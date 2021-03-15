#include "lib.h"

extern struct Env *env;

#define PAGE_FAULT_TEMP (U_XSTACK_TOP - 2 * BY2PG)

static void pgfault(u64 va)
{
    int r;
    u64 pte;
    va = (va >> PGSHIFT) << PGSHIFT;
    pte = vpt[PDX(va) * 512 * 512 + PMX(va) * 512 + PTX(va)];
    user_assert(pte & PTE_COW);

    r = syscall_mem_alloc(0, PAGE_FAULT_TEMP, PTE_USER | PTE_RW);
    user_assert(r>=0);
    
    user_bcopy((void *)va, (void *)PAGE_FAULT_TEMP, BY2PG);
    r = syscall_mem_map(0, PAGE_FAULT_TEMP, 0, va, PTE_USER | PTE_RW);
    user_assert(r>=0);
    
    r = syscall_mem_unmap(0, PAGE_FAULT_TEMP);
    user_assert(r>=0);
}

extern void __asm_pgfault_handler(void);

static void duppage(u32 envid, u64 va, u64 pte)
{
    int r;
    u64 perm = pte & 0xFFF;
    // 共享页面
    if (pte & PTE_LIBRARY) {
        r = syscall_mem_map(0, va, envid, va, perm & PTE_LIBRARY);
        user_assert(r>=0);
    }
    // 可写页面或写时复制页面 
    else if ((perm & PTE_RO) == 0 || (pte & PTE_COW) != 0) {  
        r = syscall_mem_map(0, va, envid, va, PTE_USER | PTE_RO | PTE_COW);
        user_assert(r>=0);
        r = syscall_mem_map(0, va, 0,     va, PTE_USER | PTE_RO | PTE_COW);
        user_assert(r>=0);
    }
    // 只读页面 
    else {
        r = syscall_mem_map(0, va, envid, va, perm);
        user_assert(r>=0);
    }
}

int fork() {
    u32 envid;
    int ret;
    u64 va, i, j, k, pte;

    set_pgfault_handler(pgfault);
    
    envid = syscall_env_alloc();
    user_assert(envid >= 0);
    if (envid == 0) {
        env = &(envs[ENVX(syscall_getenvid())]);
        return 0;
    }

    for (i = 0; i < 512; i++) {
        if (vpd[i] == 0) continue;
        for (j = 0; j < 512; j++) {
            if (vpm[i * 512 + j] == 0) continue;
            for (k = 0; k < 512; k++) {
                pte = vpt[i * 512 * 512 + j * 512 + k];
                if (pte == 0) continue;
                va = (i * 512 * 512 + j * 512 + k) << PGSHIFT;
                if (va >= U_STACK_TOP - BY2PG) goto DUPPAGE_OK;
                duppage(envid, va, pte);
            }
        }
    }

    DUPPAGE_OK:
    ret = syscall_mem_alloc(envid, U_XSTACK_TOP - BY2PG, PTE_USER | PTE_RW);
    user_assert(ret >= 0);

    ret = syscall_set_pgfault_handler(envid, __asm_pgfault_handler, U_XSTACK_TOP);
    user_assert(ret >= 0);

    ret = syscall_set_env_status(envid, ENV_RUNNABLE);
    user_assert(ret >= 0);

    return envid;
}
