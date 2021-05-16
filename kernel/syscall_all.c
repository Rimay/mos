#include <syscall_all.h>
#include <uart.h>
#include <mmu.h>
#include <printf.h>
#include <page.h>
#include <sched.h>
#include <cpu.h>
#include "cap.h"

extern struct Pcb *curpcb[NCPU];
extern struct Trapframe *trap_frames[NCPU];


void sys_set_return(u64 r) {
    int cpu_id = cpu_current_id();
    trap_frames[cpu_id]->regs[0] = r;
}

void sys_putchar(int sysno, char c) {
    uart_send((u32) c);
}

// void sys_panic(int sysno, char *msg) {
//     panic("%s", msg);
// }

// int sys_mem_alloc(int sysno, u32 pcbid, u64 va, u64 perm) {
//     struct Pcb *pcb;
//     struct Page *ppage;
//     int ret;
//     assert(va >= U_LIMIT);

//     ret = pcbid2pcb(pcbid, &pcb, 0);
//     assert(ret >= 0);
    
//     ret = page_alloc(&ppage);
//     assert(ret >= 0);

//     bzero((void *)page2kva(ppage), BY2PG);
//     ret = page_insert(pcb->pcb_pgdir, ppage, va, perm | PTE_USER | PTE_RW, pcb->pcb_id);
//     assert(ret >= 0);

//     return 0;
// }

// int sys_mem_map(int sysno, u32 srcid, u64 srcva, u32 dstid, u64 dstva, u64 perm) {
//     int ret;
//     struct Pcb *srcpcb;
//     struct Pcb *dstpcb;
//     struct Page *ppage;
//     u64 *ppte;
//     srcva = ROUND_DOWN(srcva, BY2PG);
//     dstva = ROUND_DOWN(dstva, BY2PG);
//     ret = pcbid2pcb(srcid, &srcpcb, 1);
//     if (ret < 0) {
//         printf("[ERR] sys_mem_map pcbid2pcb\n");
//         return ret;
//     }
//     ret = pcbid2pcb(dstid, &dstpcb, 1);
//     if (ret < 0) {
//         printf("[ERR] sys_mem_map pcbid2pcb\n");
//         return ret;
//     }
//     ppage = page_lookup(srcpcb->pcb_pgdir, srcva, &ppte, srcpcb->pcb_id);
//     if (ppage == NULL) {
//         printf("[ERR] sys_mem_map : page_lookup : [%l016x] : [%l016x] : [%l016x]\n", srcpcb->pcb_pgdir, srcva, &ppte);
//         return -1;
//     }
//     ret = page_insert(dstpcb->pcb_pgdir, ppage, dstva, perm, dstpcb->pcb_id);
//     if (ret < 0) {
//         printf("[ERR] sys_mem_map page_insert\n");
//         return ret;
//     }
//     return 0;
// }

// int sys_mem_unmap(int sysno, u32 pcbid, u64 va) {
//     int ret;
//     struct Pcb *pcb;
//     ret = pcbid2pcb(pcbid, &pcb, 1);
//     if (ret < 0) {
//         printf("[ERR] sys_mem_unmap : pcbid2pcb\n");
//         return ret;
//     }
//     page_remove(pcb->pcb_pgdir, va, pcb->pcb_id);
//     return ret;
// }

// u32 sys_pcb_alloc() {
//     int r;
//     struct Pcb *e;
//     int cpu_id = cpu_current_id();

//     r = pcb_alloc(&e, curpcb[cpu_id]->pcb_id);
//     assert(r >= 0);

//     bcopy(trap_frames[cpu_id], &e->pcb_tf, sizeof(struct Trapframe));

//     u64 *ppte = NULL;
//     pgdir_walk(curpcb[cpu_id]->pcb_pgdir, U_STACK_TOP - BY2PG, 0, &ppte, curpcb[cpu_id]->pcb_id); 
//     if (ppte != NULL) {
//         struct Page *ppc, *ppp;
//         ppp = pa2page(PTE_ADDR(*ppte));
//         page_alloc(&ppc);
//         bcopy((const void *) page2kva(ppp), (void *) page2kva(ppc), BY2PG);
//         page_insert(e->pcb_pgdir, ppc, U_STACK_TOP - BY2PG, PTE_USER | PTE_RW, e->pcb_id);
//     }

//     e->pcb_status = ENV_NOT_RUNNABLE;
//     e->pcb_tf.regs[0] = 0;
//     e->pcb_ipc_recving = 0;
//     e->pcb_pri = curpcb[cpu_id]->pcb_pri;
//     return e->pcb_id;
// }

// int sys_set_pcb_status(int sysno, u32 pcbid, u32 status) {
//     struct Pcb *pcb;
//     int ret;
//     if (status != ENV_RUNNABLE && status != ENV_NOT_RUNNABLE && status != ENV_FREE && status != ENV_RUNNING) {
//         return -E_INVAL;
//     }
//     ret = pcbid2pcb(pcbid, &pcb, 0);
//     if (ret < 0)
//         return ret;
//     if (status == ENV_RUNNABLE && pcb->pcb_status != ENV_RUNNABLE) {
// 		//printf("insert son to tail,pcbid = %d\n",pcbid);
// 		LIST_INSERT_HEAD(&pcb_sched_list[pcb->pcb_pri], pcb, pcb_sched_link);
// 	}
// 	else if (status != ENV_RUNNABLE && pcb->pcb_status == ENV_RUNNABLE) {
// 		LIST_REMOVE(pcb,pcb_sched_link);
// 	}
//     pcb->pcb_status = status;
//     return 0;
// }

// u32 sys_getpcbid() {
//     int cpu_id = cpu_current_id();
//     return curpcb[cpu_id]->pcb_id;
// }

// void sys_yield() {
//     sched_yield();
// }

// int sys_pcb_destroy(int sysno, u32 pcbid) {
//     int r;
//     struct Pcb *e;
//     r = pcbid2pcb(pcbid, &e, 1);
//     if (r < 0) {
//         return r;
//     }
//     pcb_destroy(e);
//     return 0;
// }

// int sys_set_pgfault_handler(int sysno, u32 pcbid, u64 func, u64 xstacktop) {
//     struct Pcb *pcb;
//     int ret;
//     ret = pcbid2pcb(pcbid, &pcb, 0);
//     if (ret < 0) {
//         return ret;
//     }
        
//     pcb->pcb_pgfault_handler = func;
//     pcb->pcb_xstacktop = xstacktop;
//     return 0;
// }

// void sys_set_trapframe(int sysno, u32 pcbid, struct Trapframe *tf) {
//     assert("sys_set_trapframe not implemented.");
// }


// void sys_ipc_recv(int sysno, u64 dstva) {
//     int cpu_id = cpu_current_id();
//     curpcb[cpu_id]->pcb_ipc_dstva = dstva;
//     curpcb[cpu_id]->pcb_ipc_recving = 1;
//     curpcb[cpu_id]->pcb_status = ENV_NOT_RUNNABLE;
//     sys_yield();
// }

// int sys_ipc_can_send(int sysno, u32 pcbid, u64 value, u64 srcva, u64 perm) {
//     int r;
//     struct Pcb *e;
//     r = pcbid2pcb(pcbid, &e, 0);
//     if (r < 0) {
//         printf("[ERR] sys_ipc_can_send E_BAD_ENV\n");
//         return -E_BAD_ENV;
//     }
//     int cpu_id = cpu_current_id();
//     if (srcva != 0 && e->pcb_ipc_dstva != 0) {
//         u64 *pte;
//         struct Page *p = page_lookup(curpcb[cpu_id]->pcb_pgdir, srcva, &pte, curpcb[cpu_id]->pcb_id);
//         page_insert(e->pcb_pgdir, p, e->pcb_ipc_dstva, perm | PTE_4KB | PTE_USER | PTE_RW, e->pcb_id);
//         e->pcb_ipc_perm = perm;
//     }
//     if (!e->pcb_ipc_recving) {
//         return -E_IPC_NOT_RECV;
//     }
//     e->pcb_ipc_recving = 0;
//     e->pcb_ipc_from = curpcb[cpu_id]->pcb_id;
//     e->pcb_ipc_value = value;
//     e->pcb_status = ENV_RUNNABLE;
//     return 0;
// }





void handle_copy(u64 a0, u64 a1, u64 a2, u64 a3, u64 a4, u64 a5, u64 a6, u64 a7)
{
    
}
void handle_mint(u64 a0, u64 a1, u64 a2, u64 a3, u64 a4, u64 a5, u64 a6, u64 a7)
{
    
}

void handle_create(u64 a0, u64 a1, u64 a2, u64 a3, u64 a4, u64 a5, u64 a6, u64 a7)
{
    
}
void handle_delete(u64 a0, u64 a1, u64 a2, u64 a3, u64 a4, u64 a5, u64 a6, u64 a7)
{
    
}
void handle_revoke(u64 a0, u64 a1, u64 a2, u64 a3, u64 a4, u64 a5, u64 a6, u64 a7)
{
    
}
void handle_get_state(u64 a0, u64 a1, u64 a2, u64 a3, u64 a4, u64 a5, u64 a6, u64 a7)
{
    
}
void handle_get_size(u64 a0, u64 a1, u64 a2, u64 a3, u64 a4, u64 a5, u64 a6, u64 a7)
{
    
}
void handle_resize(u64 a0, u64 a1, u64 a2, u64 a3, u64 a4, u64 a5, u64 a6, u64 a7)
{
    
}
void handle_cap_identify(u64 a0, u64 a1, u64 a2, u64 a3, u64 a4, u64 a5, u64 a6, u64 a7)
{
    
}

void handle_map(u64 a0, u64 a1, u64 a2, u64 a3, u64 a4, u64 a5, u64 a6, u64 a7)
{
    
}
void handle_unmap(u64 a0, u64 a1, u64 a2, u64 a3, u64 a4, u64 a5, u64 a6, u64 a7)
{
    
}

void handle_mapping_destroy(u64 a0, u64 a1, u64 a2, u64 a3, u64 a4, u64 a5, u64 a6, u64 a7)
{
    
}
void handle_mapping_modify(u64 a0, u64 a1, u64 a2, u64 a3, u64 a4, u64 a5, u64 a6, u64 a7)
{
    
}

void handle_dispatcher_setup(u64 a0, u64 a1, u64 a2, u64 a3, u64 a4, u64 a5, u64 a6, u64 a7)
{
    // errval_t err = SYS_ERR_OK;
    
    // struct capability *to = (struct capability *)(a0);
    // assert(to->type == ObjType_Dispatcher);
    // struct Pcb *pcb = to->u.dispatcher.e;
    
    // u64 cptr = a1;
    // u64 level = a2;
    // u64 vptr = a3;

    // /* 1. set cspace root */
    // struct cte *root;
    // err = cnode_lookup_cap(&dcb_current->cspace.cap, cptr, level, &root, CAPRIGHTS_READ);
    // assert(err == SYS_ERR_OK);
    // assert(root->cap.type == ObjType_L1cnode);
    
    // err = caps_copy_to_cte(&dcb->cspace, root, false, 0, 0);
    // assert(err == SYS_ERR_OK);

    // /* 2. set vspace root */
    // struct capability *vroot;
    // err = cnode_lookup_cap(&root->cap, vptr, CNODE_TYPE_COUNT, &vroot, CAPRIGHTS_WRITE);
    // assert(err == SYS_ERR_OK);
    // assert(vroot->type == ObjType_VNode_l0);

    // pcb->vspace = vroot->u.vnode_l0.base;

    // /* 3. set dispatcher frame pointer */
    // struct cte *dispcte;
    // err = cnode_lookup_cap(&root->cap, dptr, CNODE_TYPE_COUNT, &dispcte,
    //                        CAPRIGHTS_READ_WRITE);
    // assert(err == SYS_ERR_OK);
    // struct capability *dispcap = &dispcte->cap;
    // assert(dispcap->type == ObjType_Frame);
    // if (get_size(dispcap) < DISPATCHER_FRAME_SIZE) {
    //     return SYSRET(SYS_ERR_DISP_FRAME_SIZE);
    // }
    // /* FIXME: check rights? */

    // lpaddr = gen_phys_to_local_phys(get_address(dispcap));
    // dcb->disp = local_phys_to_mem(lpaddr);
    // // Copy the cap to dcb also
    // err = caps_copy_to_cte(&dcb->disp_cte, dispcte, false, 0, 0);
    // // If copy fails, something wrong in kernel
    // assert(err_is_ok(err));
    
}

void handle_dispatcher_properties(u64 a0, u64 a1, u64 a2, u64 a3, u64 a4, u64 a5, u64 a6, u64 a7)
{
    
}

void handle_idcap_identify(u64 a0, u64 a1, u64 a2, u64 a3, u64 a4, u64 a5, u64 a6, u64 a7)
{
    
}


