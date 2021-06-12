#include <syscall.h>
#include <uart.h>
#include <mmu.h>
#include <printf.h>
#include <page.h>
#include <sched.h>
#include <cpu.h>
#include "cap.h"
#include "pcb.h"
#include "dprintf.h"

extern struct Pcb *curpcb[NCPU];
extern struct Trapframe *trap_frames[NCPU];
extern u64 c_pcnslot_cnt;
extern struct bootinfo *bi;
extern struct Pcb *init_pcb;
extern struct Endpoint ipc_send_ep, ipc_recv_ep;

u64 forked_cte;

void sys_putchar(char c) {
    uart_send((u32) c);
}


u64 sys_alloc(u64 sz)
{
    u64 page_num = (sz + BASE_PAGE_SIZE - 1) / BASE_PAGE_SIZE;
    u64 new_addr = ROUND_UP(phy_alloc_addr, BASE_PAGE_SIZE) + page_num * BASE_PAGE_SIZE;
    assert(new_addr <= PHYS_MEMORY_END);
    
    u64 addr = alloc_phys_aligned(sz, BASE_PAGE_SIZE);
    return addr;
}


/*
 * retype a mem into an object
 *      ut_addr: pa of mem
 *      ut_size: size of mem
 *      dest_type: object type
 *      dest_cspace: the space to hold the object
 *      l1_index: slot id in cspace(l1cnode)
 *      l2_index: slot id in l2cnode(l1cnode)
 *      obj_num: the created object num
 */
u64 sys_retype(u64 ut_addr, u64 ut_size, u64 dest_type, u64 dest_cspace, 
                    u64 l1_index, u64 l2_index, u64 obj_num)
{
    struct cte *cspace = (struct cte *)pa2kva(dest_cspace);

    assert(dest_type == ObjType_Dispatcher || dest_type == ObjType_Page || dest_type == ObjType_Endpoint ||
            dest_type == ObjType_VNode_l0 || dest_type == ObjType_VNode_l1 || dest_type == ObjType_VNode_l2);
    assert(cspace->cap.type == ObjType_L1cnode);
    assert(objsize(dest_type) * obj_num <= ut_size);
    assert(l1_index < L1CNODE_SLOTNUM);
    assert(l2_index < L2CNODE_SLOTNUM);
    assert(l2_index + obj_num <= L2CNODE_SLOTNUM);

    struct cte *xcn = caps_locate_slot(cspace->cap.u.l1cnode.base, l1_index);
    // printf("xcn addr: 0x%lx\n", (u64)xcn);
    // printf("phy_alloc_addr addr: 0x%lx\n", phy_alloc_addr);

    // 如果l2cnode未被创建，需要先创建l2cnode
    if (xcn->cap.u.l1cnode.base == 0) {
        caps_create_new(ObjType_L2cnode, alloc_phys_aligned(objsize(ObjType_L2cnode), BASE_PAGE_SIZE), 
                    objsize(ObjType_L2cnode), objsize(ObjType_L2cnode), 1, 0, xcn);
    }
    struct cte *xcte = caps_locate_slot(xcn->cap.u.l2cnode.base, l2_index);
    // printf("xcte addr: 0x%lx\n", (u64)xcte);
    // printf("phy_alloc_addr addr: 0x%lx\n", phy_alloc_addr);
    
    /*--------------------------------------- retype --------------------------------------------*/
    if (dest_type == ObjType_Dispatcher) {
        caps_create_new(ObjType_Dispatcher, ut_addr, 0,  objsize(ObjType_Dispatcher),
                             obj_num, 0, xcte);
    }
    else if (dest_type == ObjType_Endpoint) {
        caps_create_new(ObjType_Endpoint, ut_addr, 0, objsize(ObjType_Endpoint), 
                            obj_num, 0, xcte);
    }
    else {
        panic("Not implemented yet!\n");
    }
    
    return kva2pa((u64)xcte);
}                     


/*
 * set the dispatcher's basic properties given 
 *      disp: capabilty addr
 *      ppid: father process's pid
 */
u64 sys_set_dispatcher_properties(u64 disp, u64 ppid)
{
    forked_cte = pa2kva(disp);
    struct cte* disp_cte = (struct cte *)forked_cte;
    assert(disp_cte->cap.type == ObjType_Dispatcher);
    
    struct Pcb *p = (struct Pcb *)pa2kva((u64)disp_cte->cap.u.dispatcher.e);
    assert(p != NULL);
    
    u8 cpu_id = cpu_current_id();
    struct cte *c_ustack_cte;

    u64 child_pid = pcb_init(p, ppid, &c_ustack_cte);
    
    // copy parents' ustack to child's ustack 
    u64* p_ustack_pte = walk_pgdir((u64 *)curpcb[cpu_id]->pg_dir, U_STACK_TOP - BASE_PAGE_SIZE);
    u64 p_ustack_pa = PTE_ADDR(*p_ustack_pte);
    memcpy((u64 *)pa2kva(c_ustack_cte->cap.u.page.base), (u64 *)pa2kva(p_ustack_pa), BASE_PAGE_SIZE);
    
    // copy trapframe
    memcpy(&(p->pcb_tf), trap_frames[cpu_id], sizeof(struct Trapframe));
    p->pcb_tf.regs[0] = 0;
    dprintf("elr is: 0x%lx\n", p->pcb_tf.elr);

    LIST_INSERT_TAIL(&pcb_sched_list, p, sched_link);
    
    return child_pid;
}


/*
 * set the dispatcher's pagefault handler and xstack given 
 *      disp: capabilty addr
 *      func: pgfault handler func addr
 * the xstack cap is locate in SLOT_UXSTACKCN(3) slot of cspace, 
 * and it currently only occupys one slot in the l2cnode
 */
void sys_set_pgfault_handler(u64 disp, u64 func)
{
    disp = pa2kva(disp);
    struct cte* disp_cte = (struct cte *)disp;
    assert(disp_cte->cap.type == ObjType_Dispatcher);
    
    struct Pcb *p = (struct Pcb *)pa2kva((u64)disp_cte->cap.u.dispatcher.e);
    assert(p != NULL);

    p->pgfault_handler = func;
    dprintf("setting pgfault handler for 0x%lx    at 0x%lx\n", disp, func);

    // create uxstackcn and uxstackcte
    struct cte *uxstackcn = caps_locate_slot(p->cspace->cap.u.l1cnode.base, SLOT_UXSTACKCN); 
    caps_create_new(ObjType_L2cnode, alloc_phys_aligned(objsize(ObjType_L2cnode), BASE_PAGE_SIZE), 
                    objsize(ObjType_L2cnode), objsize(ObjType_L2cnode), 1, 0, uxstackcn);

    u64 uxstack_slot_cnt = 0;                    
    struct cte *uxstack_cte = caps_locate_slot(uxstackcn->cap.u.l2cnode.base, uxstack_slot_cnt++); 
    caps_create_new(ObjType_Page, alloc_phys_aligned(objsize(ObjType_Page), BASE_PAGE_SIZE), 
                    objsize(ObjType_Page), objsize(ObjType_Page), 1, 0, uxstack_cte);

    map_ptable((u64 *)p->pg_dir, U_XSTACK_TOP - BASE_PAGE_SIZE, uxstack_cte->cap.u.page.base,\
                PTE_USER | PTE_RW, uxstackcn, &uxstack_slot_cnt);
    p->xstacktop = U_XSTACK_TOP - BASE_PAGE_SIZE;
}


/*
 * map a src_va from src_disp to dest_va in dest_disp with perm
 */
void sys_map(u64 src_disp, u64 src_va, u64 dest_disp, u64 dest_va, u64 perm)
{
    // dprintf("========we are in sys_map\n");
    src_disp = pa2kva(src_disp);
    dest_disp = pa2kva(dest_disp);
    assert(((struct cte *)src_disp)->cap.type == ObjType_Dispatcher && ((struct cte *)dest_disp)->cap.type == ObjType_Dispatcher);
    
    struct Pcb *src_p = (struct Pcb *)pa2kva((u64)((struct cte *)src_disp)->cap.u.dispatcher.e);
    struct Pcb *dest_p = (struct Pcb *)pa2kva((u64)((struct cte *)dest_disp)->cap.u.dispatcher.e);
    assert(src_p != NULL && dest_p != NULL);

    u64 *pte = walk_pgdir((u64 *)src_p->pg_dir, src_va);
    u64 pa = PTE_ADDR(*pte);
    dprintf("srv_va: 0x%lx    *pte:0x%lx    pa: 0x%lx\n", src_va, *pte, pa);

    struct cte *pagecn = caps_locate_slot(dest_p->cspace->cap.u.l1cnode.base, SLOT_PAGECN);
    map_ptable((u64 *)dest_p->pg_dir, dest_va, pa, perm, pagecn, &c_pcnslot_cnt);
}

// unmap a va in disp
void sys_unmap(u64 disp, u64 va)
{
    // dprintf("========we are in sys_unmap\n");
    disp = pa2kva(disp);
    struct cte* disp_cte = (struct cte *)disp;
    assert(disp_cte->cap.type == ObjType_Dispatcher);
    
    struct Pcb *p = (struct Pcb *)pa2kva((u64)disp_cte->cap.u.dispatcher.e);
    assert(p != NULL);

    u64 *pte = walk_pgdir((u64 *)p->pg_dir, va);
    dprintf("unmap va: 0x%lx    *pte:0x%lx\n", va, *pte);
    *pte = 0;

}

// todo:
//      move to ut + retype
//
void sys_page_alloc(u64 disp, u64 va, u64 perm)
{
    // dprintf("========we are in sys_page_alloc\n");
    dprintf("disp: 0x%lx   va: 0x%lx\n", disp, va);
    disp = pa2kva(disp);
    struct cte* disp_cte = (struct cte *)disp;
    assert(disp_cte->cap.type == ObjType_Dispatcher);
    
    struct Pcb *p = (struct Pcb *)pa2kva((u64)disp_cte->cap.u.dispatcher.e);
    assert(p != NULL);
    struct cte *pagecn = caps_locate_slot(p->cspace->cap.u.l1cnode.base, SLOT_PAGECN);
    u64 pa = alloc_page(pagecn, &c_pcnslot_cnt, ObjType_Page);      // alloc new page
    map_ptable((u64 *)p->pg_dir, va, pa, perm, pagecn, &c_pcnslot_cnt);    // insert into pg_dir (va should not be dirty!)
}

u64 sys_get_bi()
{
    return kva2pa((u64)bi);
}

u64 sys_get_init_disp()
{
    return kva2pa((u64)&bi->init_pcb_cte);
}

u64 sys_get_init_disp_cspace()
{
    return kva2pa((u64)init_pcb->cspace);
}

void sys_set_pcb_status(u64 disp, u64 status)
{
    disp = pa2kva(disp);
    struct Pcb* p = (struct Pcb *)pa2kva((u64)((struct cte *)disp)->cap.u.dispatcher.e);
    p->status = status;
}


/*
 1. 层次更清晰: 
    基于object(cap)执行系统调用流程
 2. 可分为block/non-block调用
 3. 
*/
// void handle_syscall()
// {
// }

void handle_call(u64 ep_pa, u64 badge)
{

}


void handle_send(u64 ep_pa, u64 badge)
{
    struct cte *ep = (struct cte *)pa2kva(ep_pa);
    assert(ep->cap.type == ObjType_Endpoint);
    switch (ep->cap.u.endpoint.state)
    {
    case EP_State_Idle:
    case EP_State_Send: {
        // set status and add sender to send_ep
        struct Pcb *sender;
        sender = curpcb[cpu_current_id()];
        sender->status = ENV_BLOCK_ON_SEND;
        ep_append(&ep->cap.u.endpoint, sender, EP_State_Send);
        sched_yield();
        break;
    }
    case EP_State_Recv: {
        // pop the proc from receiver ep
        struct Pcb *receiver = ep_pop(&ep->cap.u.endpoint);
        struct Pcb *sender = curpcb[cpu_current_id()];
        receiver->status = ENV_RUNNABLE;
        ipc_copy(&sender->buffer, &receiver->buffer);
        break;
    }
    default:
        panic("invalid ep state");
    }
}

void handle_recv(u64 ep_pa, u64 badge)
{
    struct cte *ep = (struct cte *)pa2kva(ep_pa);
    assert(ep->cap.type == ObjType_Endpoint);
    switch (ep->cap.u.endpoint.state)
    {
    case EP_State_Idle:
    case EP_State_Recv: {
        // set status and add sender to recv_ep
        struct Pcb *receiver = curpcb[cpu_current_id()];
        receiver->status = ENV_BLOCK_ON_RECV;
        ep_append(&ep->cap.u.endpoint, receiver, EP_State_Recv);
        sched_yield();
        break;
    }
    case EP_State_Send: {
        // pop the proc from receiver ep
        struct Pcb *sender = ep_pop(&ep->cap.u.endpoint);
        struct Pcb *receiver = curpcb[cpu_current_id()];
        sender->status = ENV_RUNNABLE;
        ipc_copy(&sender->buffer, &receiver->buffer);
        break;
    }
    default:
        panic("invalid ep state");
    }
}

u64 get_mr(u64 i)
{
    assert(i < MSG_MAX_LEN);
    struct Pcb *p = curpcb[cpu_current_id()];
    return p->buffer.msg[i];
}

void set_mr(u64 i, u64 value)
{
    assert(i < MSG_MAX_LEN);
    struct Pcb *p = curpcb[cpu_current_id()];
    p->buffer.msg[i] = value;
}

void sys_copy(u64 disp, u64 dest, u64 src, u64 len)
{
    // dprintf("========we are in sys_copy\n");
    disp = pa2kva(disp);
    struct cte* disp_cte = (struct cte *)disp;
    assert(disp_cte->cap.type == ObjType_Dispatcher);
    
    struct Pcb *p = (struct Pcb *)pa2kva((u64)disp_cte->cap.u.dispatcher.e);
    assert(p != NULL);

    u64 *src_pte = walk_pgdir((u64 *)p->pg_dir, src);
    u64 src_pa = PTE_ADDR(*src_pte);
    u64 *dest_pte = walk_pgdir((u64 *)p->pg_dir, dest);
    u64 dest_pa = PTE_ADDR(*dest_pte);
    dprintf("srv_va: 0x%lx  *src_pte:0x%lx  src_pa: 0x%lx  |||  dest_va: 0x%lx  *dest_pte:0x%lx  dest_pa: 0x%lx\n", \
         src, *src_pte, src_pa, dest, *dest_pte, dest_pa);
    memcpy((void *)pa2kva(dest_pa), (void *)pa2kva(src_pa), len);
}