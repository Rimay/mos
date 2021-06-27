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
extern struct bootinfo *bi;
extern struct Endpoint ipc_send_ep, ipc_recv_ep;

u64 forked_cte;


void sys_putchar(char c) {
    uart_send((u32) c);
}


u64 sys_alloc(u64 sz)
{
    assert( ROUND_UP(phy_alloc_addr, BASE_PAGE_SIZE) + \
            ((sz + BASE_PAGE_SIZE - 1) / BASE_PAGE_SIZE) * BASE_PAGE_SIZE <= PHYS_MEMORY_END );
    
    return alloc_phys_aligned(sz, BASE_PAGE_SIZE);
}


/*
 * retype a mem into an object
 *      ut_addr: pa of untyped mem
 *      ut_size: size of untyped mem
 *      dest_type: retyped dest type
 *      disp: dispatcher to hold the object (parent cte)
 */
u64 sys_retype(u64 ut_addr, u64 ut_size, u64 dest_type, u64 disp)
{
    assert(dest_type == ObjType_Dispatcher || dest_type == ObjType_Page || dest_type == ObjType_Endpoint);
    assert(ut_size == objsize(dest_type));

    struct cte* disp_cte = (struct cte*)pa2kva(disp);
    assert(disp_cte->cap.type == ObjType_Dispatcher);

    struct Pcb *pp = (struct Pcb *)pa2kva((u64)disp_cte->cap.u.dispatcher.e);

    /*--------------------------------------- retype --------------------------------------------*/
    if (dest_type == ObjType_Dispatcher) {
        struct cte* pcb_cte = caps_create_new(ObjType_Dispatcher, ut_addr, pp->pcbcn);
        struct Pcb* p = (struct Pcb* )pa2kva((u64)pcb_cte->cap.u.dispatcher.e);
        p->self_disp = pcb_cte;
        return kva2pa((u64)pcb_cte);
    }
    else if (dest_type == ObjType_Endpoint) {
        struct cte* epcn = pp->epcn;
        struct cte* ep_cte = caps_create_new(ObjType_Endpoint, ut_addr, epcn);
        return kva2pa((u64)ep_cte);
    }
    else {
        panic("Not implemented yet!\n");
    }
    
    // should not reach here
    return 0;
}                     


// set the dispatcher's basic properties 
// TODO:
//      do not use global varible forked_cte
u64 sys_set_dispatcher_properties(u64 disp, u64 ppid)
{
    forked_cte = pa2kva(disp);

    struct cte* disp_cte = (struct cte *)forked_cte;
    assert(disp_cte->cap.type == ObjType_Dispatcher);
    
    struct Pcb *p = (struct Pcb *)pa2kva((u64)disp_cte->cap.u.dispatcher.e);
    assert(p != NULL);
    
    u8 cpu_id = cpu_current_id();
    struct Pcb* pp = curpcb[cpu_id];    // parent pcb

    u64 pid = pcb_init(p, ppid);
    
    // copy stack
    memcpy((u64 *)p->stack_kva, (u64 *)pp->stack_kva, BASE_PAGE_SIZE);
    
    // copy trapframe
    memcpy(&(p->pcb_tf), trap_frames[cpu_id], sizeof(struct Trapframe));

    p->pcb_tf.regs[0] = 0;
    dprintf("elr is: 0x%lx\n", p->pcb_tf.elr);

    LIST_INSERT_TAIL(&pcb_sched_list, p, sched_link);
    
    return pid;
}


//  set the dispatcher's pagefault handler and xstack given 
//       disp: capabilty addr
//       func: pgfault handler func addr
void sys_set_pgfault_handler(u64 disp, u64 func)
{
    struct cte* disp_cte = (struct cte *)pa2kva(disp);
    assert(disp_cte->cap.type == ObjType_Dispatcher);
    
    struct Pcb *p = (struct Pcb *)pa2kva((u64)disp_cte->cap.u.dispatcher.e);
    assert(p != NULL);

    p->pgfault_handler = func;
    p->xstacktop = U_XSTACK_TOP - BASE_PAGE_SIZE;

    dprintf("set pgfault handler  disp: 0x%lx | func: 0x%lx | xstacktop: \n", disp, func, p->xstacktop);
}


/*
 * map a src_va from src_disp to dest_va in dest_disp with perm
 */
void sys_map(u64 src_disp, u64 src_va, u64 dest_disp, u64 dest_va, u64 perm)
{
    // printf("enter sys_map - src_disp: 0x%lx | src_va: 0x%lx | dest_disp: 0x%lx | dest_va: 0x%lx\n", src_disp, src_va, dest_disp, dest_va);
    src_disp = pa2kva(src_disp);
    dest_disp = pa2kva(dest_disp);
    assert(((struct cte *)src_disp)->cap.type == ObjType_Dispatcher && ((struct cte *)dest_disp)->cap.type == ObjType_Dispatcher);
    
    struct Pcb *src_p = (struct Pcb *)pa2kva((u64)((struct cte *)src_disp)->cap.u.dispatcher.e);
    struct Pcb *dest_p = (struct Pcb *)pa2kva((u64)((struct cte *)dest_disp)->cap.u.dispatcher.e);
    assert(src_p != NULL && dest_p != NULL);

    u64 *pte = walk_pgdir((u64 *)src_p->pgdir_kva, src_va);
    u64 pa = PTE_ADDR(*pte);
    // dprintf("map srv_va: 0x%lx    *pte:0x%lx    pa: 0x%lx\n", src_va, *pte, pa);

    map_ptable((u64 *)dest_p->pgdir_kva, dest_va, pa, perm, dest_p);
}

// unmap a va in disp
void sys_unmap(u64 disp, u64 va)
{
    // printf("enter sys_unmap - disp: 0x%lx | va: 0x%lx\n", disp, va);

    disp = pa2kva(disp);
    struct cte* disp_cte = (struct cte *)disp;
    assert(disp_cte->cap.type == ObjType_Dispatcher);
    
    struct Pcb *p = (struct Pcb *)pa2kva((u64)disp_cte->cap.u.dispatcher.e);
    assert(p != NULL);

    u64 *pte = walk_pgdir((u64 *)p->pgdir_kva, va);
    // dprintf("unmap va: 0x%lx    *pte:0x%lx\n", va, *pte);
    *pte = 0;
}

// todo:
//      move to ut + retype
//
void sys_page_alloc(u64 disp, u64 va, u64 perm)
{
    dprintf("disp: 0x%lx   va: 0x%lx\n", disp, va);
    struct cte* disp_cte = (struct cte *)pa2kva(disp);
    assert(disp_cte->cap.type == ObjType_Dispatcher);
    
    struct Pcb *p = (struct Pcb *)pa2kva((u64)disp_cte->cap.u.dispatcher.e);
    assert(p != NULL);

    u64 pa = alloc_page(p);      // alloc new page
    map_ptable((u64 *)p->pgdir_kva, va, pa, perm, p);    // insert into pg_dir (va should not be dirty!)
}

u64 sys_get_disp_info()
{
    struct Pcb *p = curpcb[cpu_current_id()];
    return kva2pa((u64)p->self_disp);
}


void sys_set_pcb_status(u64 disp, u64 status)
{
    disp = pa2kva(disp);
    struct Pcb* p = (struct Pcb *)pa2kva((u64)((struct cte *)disp)->cap.u.dispatcher.e);
    p->status = status;
}



void handle_send(u64 ep_pa, u64 badge)
{
    struct cte *ep = (struct cte *)pa2kva(ep_pa);
    // dprintf("recv ep state: %d\n", ep->cap.u.endpoint.state);
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
        dprintf("ipc copy in sender\n");
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
    // dprintf("send ep state: %d\n", ep->cap.u.endpoint.state);

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
        dprintf("ipc copy in receiver\n");
        break;
    }
    default:
        panic("invalid ep state");
    }
}


u64 get_mr(u64 i, u64 is_cap)
{
    assert(i < MSG_MAX_LEN);
    struct Pcb *p = curpcb[cpu_current_id()];
    u64 ret;
    if (is_cap) {
        ret = p->buffer.caps[i];
    }
    else {
        ret = p->buffer.msg[i];
    }
    return ret;
}


void set_mr(u64 i, u64 value, u64 is_cap)
{
    assert(i < MSG_MAX_LEN);
    struct Pcb *p = curpcb[cpu_current_id()];
    if (is_cap) {
        p->buffer.caps[i] = value;
    }
    else {
        p->buffer.msg[i] = value;
    }
}


void sys_copy(u64 disp, u64 dest, u64 src, u64 len)
{
    // dprintf("========we are in sys_copy\n");
    disp = pa2kva(disp);
    struct cte* disp_cte = (struct cte *)disp;
    assert(disp_cte->cap.type == ObjType_Dispatcher);
    
    struct Pcb *p = (struct Pcb *)pa2kva((u64)disp_cte->cap.u.dispatcher.e);
    assert(p != NULL);

    u64 *src_pte = walk_pgdir((u64 *)p->pgdir_kva, src);
    u64 src_pa = PTE_ADDR(*src_pte);
    u64 *dest_pte = walk_pgdir((u64 *)p->pgdir_kva, dest);
    u64 dest_pa = PTE_ADDR(*dest_pte);
    dprintf("srv_va: 0x%lx  *src_pte:0x%lx  src_pa: 0x%lx  |  dest_va: 0x%lx  *dest_pte:0x%lx  dest_pa: 0x%lx\n", \
         src, *src_pte, src_pa, dest, *dest_pte, dest_pa);
    memcpy((void *)pa2kva(dest_pa), (void *)pa2kva(src_pa), len);
}


void reset_ipc_buffer()
{
    u8 cpu_id = cpu_current_id();
    struct Pcb *p = curpcb[cpu_id];
    memzero(&p->buffer, sizeof(p->buffer));
}


