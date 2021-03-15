#include <mmu.h>
#include <error.h>
#include <env.h>
#include <kerelf.h>
#include <sched.h>
#include <pmap.h>
#include <printf.h>
#include <spin_lock.h>
#include <cpu.h>
#include <queue.h>

struct Env envs[NENV];
struct Env *curenv[NCPU];

static struct Env_list env_free_list;
struct Env_list env_sched_list[PRIORITY_NUM + 1];

u_int mkenvid(struct Env *e) {
    static u_long next_env_id = 0;
    u_int idx = e - envs;
    return (++next_env_id << (1 + LOG2NENV)) | idx;
}

int envid2env(u_int envid, struct Env **penv, int checkperm) {
    int cpu_id = cpu_current_id();
    struct Env *e;
    if (envid == 0) {
        *penv = curenv[cpu_id];
        return 0;
    }
    e = &envs[ENVX(envid)];
    if (e->env_status == ENV_FREE || e->env_id != envid) {
        *penv = 0;
        return -E_BAD_ENV;
    }
    if (checkperm && e != curenv[cpu_id] && e->env_parent_id != curenv[cpu_id]->env_id) {
        *penv = 0;
        return -E_BAD_ENV;
    }
    *penv = e;
    return 0;
}

void env_init(void) {
    LIST_INIT(&env_free_list);
    int i;
    for (i = 0;i <= PRIORITY_NUM;i++) {
        LIST_INIT(&env_sched_list[i]);
    }
    for (i = NENV - 1; i >= 0; i--) {
        envs[i].env_id = i;
        envs[i].env_status = ENV_FREE;
        LIST_INSERT_HEAD(&env_free_list, &envs[i], env_link);
    }
    for (i = 0; i < NCPU; i++) {
        curenv[i] = NULL;
    }
}


int env_alloc(struct Env **newenv, u_int parent_id) {
    int r;
    struct Page *p = NULL;
    struct Env *e = LIST_FIRST(&env_free_list);
    assert(e != NULL);
    e->env_id = mkenvid(e);

    r = page_alloc(&p);
    assert(r >= 0);

    p->pp_ref++;
    e->env_pgdir = (u_long *) page2kva(p);
    page_insert(e->env_pgdir, pa2page(PADDR(e->env_pgdir)), UVPD, PTE_USER | PTE_RO, ENVX(e->env_id));
        
    e->env_parent_id = parent_id;
    e->env_status = ENV_RUNNABLE;
    e->env_tf.spsr = 0;
    e->env_tf.sp = U_STACK_TOP;

    LIST_REMOVE(e, env_link);
    *newenv = e;
    return 0;
}

static int load_icode_mapper(u_long va, u_int sgsize, u_char *bin, u_int bin_size, void *user_data) {
    struct Env *env = (struct Env *) user_data;
    int env_id = ENVX(env->env_id);
    struct Page *p = NULL;
    u_long i;
    int r;
    u_long offset = va - ROUNDDOWN(va, BY2PG);
    for (i = 0; i < bin_size; i += BY2PG) {
        r = page_alloc(&p);
        assert(r >= 0);
        
        p->pp_ref++;
        
        r = page_insert(env->env_pgdir, p, va-offset+i, PTE_USER | PTE_RW, env_id);
        assert(r >= 0);

        bcopy(bin+i, (void *) page2kva(p) + offset, MIN(BY2PG, bin_size - i));
    }
    while (i < sgsize) {
        r = page_alloc(&p);
        assert(r >= 0);

        p->pp_ref++;
        r = page_insert(env->env_pgdir, p, va-offset+i, PTE_USER | PTE_RW, env_id);
        assert(r >= 0);
        i += BY2PG;
    }
    return 0;
}

static void load_icode(struct Env *e, u_char *binary, u_int size) {
    struct Page *p = NULL;
    u_long entry_point;
    u_long r = page_alloc(&p);
    assert(r >= 0);

    // Use appropriate perm to set initial stack for new Env.
    r = page_insert(e->env_pgdir, p, U_STACK_TOP - BY2PG, PTE_USER | PTE_RW, ENVX(e->env_id));
    assert(r >= 0);

    r = load_elf(binary, size, &entry_point, e, load_icode_mapper);
    assert(r >= 0);
    e->env_tf.elr = entry_point;
}

void
env_create_priority(void *binary, unsigned int size, int priority)
{
    struct Env *e;
    env_alloc(&e,0);
    // printf("env_create_priority env_id: %d\n", e->env_id);
    e->env_pri = priority;
    
    load_icode(e,binary,size);
    LIST_INSERT_HEAD(&env_sched_list[priority], e, env_sched_link);
}

void
env_create(u_char *binary, unsigned int size)
{
    env_create_priority(binary,size,1);
}

void env_free(struct Env *e) {
    u64 *pme;
    u64 *pte;
    u_long pdeno, pmeno, pteno;
    int cpuid = cpu_current_id();
    //printf("not free e le_prev = %08x\n",e->env_sched_link.le_prev);
    printf("cpu %d [%08x] free env %08x\n", cpuid, curenv[cpuid] ? curenv[cpuid]->env_id : 0, e->env_id);
    for (pdeno = 0; pdeno < PDX(U_LIMIT); pdeno++) {
        if (!(e->env_pgdir[pdeno] & PTE_4KB)) {
            continue;
        }
        pme = (Pte *) KADDR(PTE_ADDR(e->env_pgdir));
        for (pmeno = 0; pmeno < PMX(U_LIMIT); pmeno++) {
            if (!(pme[pmeno] & PTE_4KB)) {
                continue;
            }
            pte = (Pte *) KADDR(PTE_ADDR(pme[pmeno]));
            for (pteno = 0; pteno < PTX(U_LIMIT); pteno++) {
                if (pte[pteno] & PTE_4KB) {
                    page_remove(e->env_pgdir, (pdeno << PDSHIFT) | (pmeno << PMSHIFT) | (pteno << PGSHIFT), ENVX(e->env_id));
                }
            }
            page_decref(pa2page(PTE_ADDR(pme[pmeno])), ENVX(e->env_id));
            pme[pmeno] = 0;
        }
        page_decref(pa2page(PTE_ADDR(e->env_pgdir[pdeno])), ENVX(e->env_id));
        e->env_pgdir[pdeno] = 0;
    }
    page_decref(pa2page((u_long) e->env_pgdir), ENVX(e->env_id));
    //bzero(e, sizeof(struct Env));
    //e->env_pgdir = 0;

    e->env_status = ENV_FREE;
    //printf("freed e le_prev = %08x\n",e->env_sched_link.le_prev);
    LIST_INSERT_HEAD(&env_free_list, e, env_link);
}

void env_destroy(struct Env *e) {
    printf("env_destroy called\n");
    int cpu_id = e->cpu_id;
    env_free(e);
    if (curenv[cpu_id] == e) {
        curenv[cpu_id] = NULL;
        //printf("cpu %d freed\n",cpu_id);
        sched_yield();
    }
}

void set_ttbr0(u_long pa) {asm volatile ("msr ttbr0_el1, %0" :: "r" (pa));}

void tlb_invalidate() {asm volatile ("dsb ishst; tlbi vmalle1is; dsb ish; isb");}

void env_run(struct Env *e) {
    struct Trapframe *old;
    //printf("curenv addr 0x%08x\n",e); 
    int cpu_id = cpu_current_id();
    old = trap_frames[cpu_id];
    if (curenv[cpu_id]) {
        bcopy(old, &(curenv[cpu_id]->env_tf), sizeof(struct Trapframe));
    }
    if (curenv[cpu_id] != NULL) {
        curenv[cpu_id]->env_status = ENV_RUNNABLE;
    }
    curenv[cpu_id] = e;
    curenv[cpu_id]->cpu_id = cpu_id;
    curenv[cpu_id]->env_status = ENV_RUNNING;
    //printf("cpu %d will run env %x\n",cpu_id,curenv[cpu_id]->env_id);
    bcopy(&curenv[cpu_id]->env_tf, old, sizeof(struct Trapframe));
    //printf ("cpu %d tf elf after env_run is %l016x\n",cpu_id,old->elr);
    //printf("ret addr [%l016x]\n",curenv[cpu_id]->env_tf.elr);
    set_ttbr0(((u_long)curenv[cpu_id]->env_pgdir) & 0xFFFFFFFF);
    //unlock_kernel();
    tlb_invalidate();
    
}