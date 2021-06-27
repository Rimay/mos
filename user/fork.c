#include "mos.h"


extern void __asm_pgfault_handler(void);


void pgfault(u64 disp0, u64 disp1, u64 va)
{
    u64 pte = vpt[PDX(va)*512*512 + PMX(va)*512 + PTX(va)];
    user_assert((pte & PTE_COW) != 0);
    
    // alloc a new page at tmp va in father process and
    // copy the va's page to tmp's page
    syscall_page_alloc(disp0, PAGE_FAULT_TEMP, PTE_USER | PTE_RW);
    
    // u_memcpy((void *)PAGE_FAULT_TEMP, (void *)va, BY2PG);
    syscall_copy(disp0, (u64)PAGE_FAULT_TEMP, va, BY2PG);

    // disable orignal page's COW flag
    syscall_map(disp0, va, disp1, va, PTE_USER | PTE_RW);
    
    // map tmp to va and unmap tmp
    syscall_map(disp0, PAGE_FAULT_TEMP, disp0, va, PTE_USER | PTE_RW);
    syscall_unmap(disp0, PAGE_FAULT_TEMP);
    dwritef("++++++++++++++++++++++++++++++++++++++++++++++++++++++\n");
}


static void duppage(u64 p_disp, u64 c_disp)
{
    int i, j, k;
    for (i = 0; i < 512; i++) {
        if (vpd[i] == 0) continue;
        for (j = 0; j < 512; j++) {
            if (vpm[i * 512 + j] == 0) continue;
            for (k = 0; k < 512; k++) {
                u64 pte = vpt[i * 512 * 512 + j * 512 + k];
                u64 va = (i * 512 * 512 + j * 512 + k) << PGSHIFT;
                if (va >= U_STACK_TOP - BY2PG)  return;
                if (pte == 0) continue;
                
                u64 perm = pte & 0xFFF;
                // writef("va: %lx\n", va);
                if (pte & PTE_LIBRARY) {
                    syscall_map(p_disp, va, c_disp, va, perm & PTE_LIBRARY);
                } 
                else if ((perm & PTE_RO) == 0 || (pte & PTE_COW) != 0) {
                    syscall_map(p_disp, va, c_disp, va, PTE_USER | PTE_RO | PTE_COW);
                    // syscall_map(p_disp, va, p_disp, va, PTE_USER | PTE_RO | PTE_COW);
                } 
                else {
                    syscall_map(p_disp, va, c_disp, va, perm);
                }
            }
        }
    }
}


int fork(struct vka *v)
{
    syscall_set_pgfault_handler(v->disp_cte, (u64)__asm_pgfault_handler);
    dwritef("Setting process 0's pgfault handler success!\n");

    struct vka_object child_process;
    u64 r = vka_alloc_pcb(v, &child_process);
    user_assert(r == 0);

    // init child pcb's attributes
    u64 pid = syscall_set_dispatcher_properties(child_process.cte_pa, 0);
    dwritef("Setting process 1's PROPERTY success!\n", pid);

    // child process
    if (pid == 0) {
        return 0;
    }

    // insert all va in father's pgdir to child's pgdir
    duppage(v->disp_cte, child_process.cte_pa);
    dwritef("Setting process 1's PAGE TABLE success!\n");

    // set child pgfault handler and make it runnable
    syscall_set_pgfault_handler(child_process.cte_pa, (u64)__asm_pgfault_handler);
    dwritef("Setting process 1's PGFAULT_HANDLER success!\n");

    syscall_set_pcb_status(child_process.cte_pa, ENV_RUNNABLE);
    dwritef("Setting process 1's STATUS success!\n");

    return pid;
}

