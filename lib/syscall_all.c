#include <syscall_all.h>
#include <uart.h>
#include <mmu.h>
#include <env.h>
#include <printf.h>
#include <pmap.h>
#include <sched.h>
#include <cpu.h>
#include <cap.h>

extern struct Env *curenv[NCPU];

void sys_set_return(u64 r) {
    int cpu_id = cpu_current_id();
    trap_frames[cpu_id]->regs[0] = r;
}

void sys_putchar(int sysno, char c) {
    uart_send((u32) c);
}

char sys_cgetc() {
    return 0;
}

void sys_panic(int sysno, char *msg) {
    panic("%s", msg);
}


int sys_mem_alloc(int sysno, u32 envid, u64 va, u64 perm) {
    struct Env *env;
    struct Page *ppage;
    int r;
    if (va >= U_LIMIT) {
        printf("[ERR] sys_mem_alloc va\n");
        return -1;
    }
    r = envid2env(envid, &env, 0);
    if (r < 0) {
        printf("[ERR] sys_mem_alloc envid2env\n");
        return r;
    }
    // check alloc_perm correct
    r = check_page_alloc_perm(envid);
    if (r < 0) {
        printf("[ERR] sys_mem_alloc check_page_alloc_perm\n");
        return r;
    }
    r = page_alloc(&ppage);
    if (r < 0) {
        printf("[ERR] sys_mem_alloc page_alloc\n");
        return r;
    }
    bzero((void *)page2kva(ppage), BY2PG);
    r = page_insert(env->env_pgdir, ppage, va, perm | PTE_USER | PTE_RW, ENVX(env->env_id));
    if (r < 0) {
        printf("[ERR] sys_mem_alloc page_insert\n");
        return r;
    }
    return 0;
}

int sys_mem_map(int sysno, u32 srcid, u64 srcva, u32 dstid, u64 dstva, u64 perm) {
    int r;
    struct Env *srcenv, *dstenv;
    struct Page *ppage;
    u64 *ppte;
    srcva = ROUNDDOWN(srcva, BY2PG);
    dstva = ROUNDDOWN(dstva, BY2PG);
    r = envid2env(srcid, &srcenv, 1);
    if (r < 0) {
        printf("[ERR] sys_mem_map envid2env\n");
        return r;
    }
    ppage = page_lookup(srcenv->env_pgdir, srcva, &ppte, ENVX(srcenv->env_id));
    if (ppage == NULL) {
        printf("[ERR] sys_mem_map : page_lookup : [%l016x] : [%l016x] : [%l016x]\n", srcenv->env_pgdir, srcva, &ppte);
        return -1;
    }

    // check pte_perm correct
    r = check_page_pte_perm(srcid, ppage, (perm & PTE_RO), (perm & PTE_COW), (perm & PTE_LIBRARY));
    if (r != 0) {
        printf("[ERR] check_page_pte_perm\n");
        return r;
    }

    r = envid2env(dstid, &dstenv, 1);
    if (r < 0) {
        printf("[ERR] sys_mem_map envid2env\n");
        return r;
    }
    r = page_insert(dstenv->env_pgdir, ppage, dstva, perm, ENVX(dstenv->env_id));
    if (r < 0) {
        printf("[ERR] sys_mem_map page_insert\n");
        return r;
    }
    
    return 0;
}

int sys_mem_unmap(int sysno, u32 envid, u64 va) {
     
    int r;
    struct Env *env;
    struct Page *page;
    u64 *ppte;

    r = envid2env(envid, &env, 1);
    if (r < 0) {
        printf("[ERR] sys_mem_unmap envid2env\n");
        return r;
    }

    page = page_lookup(env->env_pgdir, va, &ppte, ENVX(envid));
    if (page == NULL) {
        printf("[ERR] sys_mem_unmap : page_lookup : [%l016x] : [%l016x] : [%l016x]\n", env->env_pgdir, va, &ppte);
        return -1;
    }
    
    // check remove_perm correct
    r = check_page_remove_perm(envid, page);
    if (r < 0) {
        printf("[ERR] sys_mem_unmap check_page_remove_perm\n");
        return r;
    }

    page_remove(env->env_pgdir, va, ENVX(envid));
    return r;
}
 

u32 sys_env_alloc() {
    int r;
    struct Env *e;
    int cpu_id = cpu_current_id();
    r = env_alloc(&e, curenv[cpu_id]->env_id);
    if (r < 0) {
        printf("[ERR] sys_env_alloc : env_alloc\n");
        return r;
    }
    bcopy(trap_frames[cpu_id], &e->env_tf, sizeof(struct Trapframe));

    u64 *ppte = NULL;
    pgdir_walk(curenv[cpu_id]->env_pgdir, U_STACK_TOP - BY2PG, 0, &ppte, curenv[cpu_id]->env_id);
    if (ppte != NULL) {
        struct Page *ppc, *ppp;
        ppp = pa2page(PTE_ADDR(*ppte));
        page_alloc(&ppc);
        bcopy((const void *) page2kva(ppp), (void *) page2kva(ppc), BY2PG);
        page_insert(e->env_pgdir, ppc, U_STACK_TOP - BY2PG, PTE_USER | PTE_RW, ENVX(e->env_id));
    }

    e->env_status = ENV_NOT_RUNNABLE;
    e->env_tf.regs[0] = 0;
    e->env_ipc_recving = 0;
    e->env_pri = curenv[cpu_id]->env_pri;
    return e->env_id;
}

int sys_set_env_status(int sysno, u32 envid, u32 status) {
    struct Env *env;
    int ret;
    if (status != ENV_RUNNABLE && status != ENV_NOT_RUNNABLE && status != ENV_FREE && status != ENV_RUNNING) {
        return -E_INVAL;
    }
    ret = envid2env(envid, &env, 0);
    if (ret < 0)
        return ret;
    if (status == ENV_RUNNABLE && env->env_status != ENV_RUNNABLE) {
		//printf("insert son to tail,envid = %d\n",envid);
		LIST_INSERT_HEAD(&env_sched_list[env->env_pri], env, env_sched_link);
	}
	else if (status != ENV_RUNNABLE && env->env_status == ENV_RUNNABLE) {
		LIST_REMOVE(env,env_sched_link);
	}
    env->env_status = status;
    return 0;
}

u32 sys_getenvid() {
    int cpu_id = cpu_current_id();
    return curenv[cpu_id]->env_id;
}

void sys_yield() {
    sched_yield();
}

int sys_env_destroy(int sysno, u32 envid) {
    int r;
    struct Env *e;
    r = envid2env(envid, &e, 1);
    if (r < 0) {
        return r;
    }
    env_destroy(e);
    return 0;
}

int sys_set_pgfault_handler(int sysno, u32 envid, u64 func, u64 xstacktop) {
    struct Env *env;
    int ret;
    ret = envid2env(envid, &env, 0);
    if (ret < 0) {
        return ret;
    }
        
    env->env_pgfault_handler = func;
    env->env_xstacktop = xstacktop;
    return 0;
}

void sys_set_trapframe(int sysno, u32 envid, struct Trapframe *tf) {
    assert("sys_set_trapframe not implemented.");
}


void sys_ipc_recv(int sysno, u64 dstva) {
    int cpu_id = cpu_current_id();
    curenv[cpu_id]->env_ipc_dstva = dstva;
    curenv[cpu_id]->env_ipc_recving = 1;
    curenv[cpu_id]->env_status = ENV_NOT_RUNNABLE;
    sys_yield();
}

int sys_ipc_can_send(int sysno, u32 envid, u64 value, u64 srcva, u64 perm) {
    int r;
    struct Env *e;
    r = envid2env(envid, &e, 0);
    if (r < 0) {
        printf("[ERR] sys_ipc_can_send E_BAD_ENV\n");
        return -E_BAD_ENV;
    }
    int cpu_id = cpu_current_id();
    if (srcva != 0 && e->env_ipc_dstva != 0) {
        u64 *pte;
        struct Page *p = page_lookup(curenv[cpu_id]->env_pgdir, srcva, &pte, curenv[cpu_id]->env_id);
        page_insert(e->env_pgdir, p, e->env_ipc_dstva, perm | PTE_4KB | PTE_USER | PTE_RW, ENVX(e->env_id));
        e->env_ipc_perm = perm;
    }
    if (!e->env_ipc_recving) {
        return -E_IPC_NOT_RECV;
    }
    e->env_ipc_recving = 0;
    e->env_ipc_from = curenv[cpu_id]->env_id;
    e->env_ipc_value = value;
    e->env_status = ENV_RUNNABLE;
    return 0;
}
