#include "pcb.h"
#include "page.h"
#include "utils.h"
#include "kerelf.h"
#include "cap.h"
#include "dprintf.h"

u64 pid_cnt;

struct Pcb *init_pcb;
struct Pcb *curpcb[NCPU];
struct Pcb_list pcb_sched_list;

struct cte *init_cspace, *pagecn, *pgdir_cte, *u_stack_cte;
u64 p_pcnslot_cnt;
u64 c_pcnslot_cnt;

extern struct bootinfo *bi;
extern u64 phy_alloc_addr;



u32 gen_pid()
{
    return pid_cnt++;
}


// init a newly forked process
inline u64 pcb_init(struct Pcb *p, u64 ppid, struct cte **u_stack_cte)
{
    u8 cpu_id = cpu_current_id();
    assert(ppid == curpcb[cpu_id]->pid);

    p->pid = gen_pid();
    p->ppid = ppid;
    p->status = ENV_NOT_RUNNABLE;
    p->pri = curpcb[cpu_id]->pri;
    p->cpu_id = cpu_id;

    // disable ipc
    p->ipc_on = 0;

    // create cspace(l1cnode) and page_cnode(l2cnode)
    // child process don't share cspace 
    u64 addr = alloc_phys_aligned(objsize(ObjType_L1cnode), BASE_PAGE_SIZE);
    p->cspace = (struct cte *)pa2kva(addr);
    caps_create_new(ObjType_L1cnode, addr, objsize(ObjType_L1cnode), objsize(ObjType_L1cnode), 1, 0, p->cspace);
    dprintf("ccf cspace at 0x%x\n", addr);

    struct cte *c_pagecn = caps_locate_slot(p->cspace->cap.u.l1cnode.base, SLOT_PAGECN); 
    caps_create_new(ObjType_L2cnode, alloc_phys_aligned(objsize(ObjType_L2cnode), BASE_PAGE_SIZE),  objsize(ObjType_L2cnode), \
                    objsize(ObjType_L2cnode), 1, 0, c_pagecn);
    dprintf("ccf pagecn at 0x%x\n", c_pagecn->cap.u.l2cnode.base);


    // alloc page for child pgdir 
    struct cte *c_pgdir = caps_locate_slot(c_pagecn->cap.u.l2cnode.base, c_pcnslot_cnt++);
    caps_create_new(ObjType_VNode_l0, alloc_phys_aligned(objsize(ObjType_VNode_l0), BASE_PAGE_SIZE), 
                    0, objsize(ObjType_VNode_l0), 1, 0, c_pgdir);
    dprintf("ccf pgdir at 0x%x\n", c_pgdir->cap.u.vnode_l0.base);

    p->pg_dir = pa2kva(c_pgdir->cap.u.vnode_l0.base);
    map_ptable((u64 *)p->pg_dir, UVPD, kva2pa(p->pg_dir), PTE_USER | PTE_RO, c_pagecn, &c_pcnslot_cnt);
    dprintf("map child's pg_dir success!\n");


    // alloc page for child ustack 
    struct cte *c_ustack_cte = caps_locate_slot(c_pagecn->cap.u.l2cnode.base, c_pcnslot_cnt++);
    caps_create_new(ObjType_Page, alloc_phys_aligned(objsize(ObjType_Page), BASE_PAGE_SIZE), 
                    0, objsize(ObjType_Page), 1, 0, c_ustack_cte);
    map_ptable((u64 *)p->pg_dir, U_STACK_TOP - BASE_PAGE_SIZE,
                 c_ustack_cte->cap.u.page.base, PTE_USER | PTE_RW, c_pagecn, &c_pcnslot_cnt);
    dprintf("map child's u_stack success!\n");
    *u_stack_cte = c_ustack_cte;

    return p->pid;
}


void pcb_run(struct Pcb *p) {
    int cpu_id = cpu_current_id();
    struct Trapframe *old = trap_frames[cpu_id];
    
    if (curpcb[cpu_id] != NULL) {
        memcpy(&(curpcb[cpu_id]->pcb_tf), old, sizeof(struct Trapframe));
        curpcb[cpu_id]->status = ENV_RUNNABLE;
    }
    
    curpcb[cpu_id] = p;
    curpcb[cpu_id]->cpu_id = cpu_id;
    curpcb[cpu_id]->status = ENV_RUNNING;

    memcpy(old, &curpcb[cpu_id]->pcb_tf, sizeof(struct Trapframe));
    //dprintf ("cpu %d tf elf after pcb_run is %l016x\n",cpu_id,old->elr);
    //dprintf("ret addr [%l016x]\n",curpcb[cpu_id]->pcb_tf.elr);

    // setup pgdir register
    set_ttbr0(curpcb[cpu_id]->pg_dir & 0xFFFFFFFF);    
    
    // cleanup the tlb
    tlb_invalidate();
}


void set_init_pcb_caps()
{
    /*
     * alloc a-pcb-size for init_pcb & ccf for init_pcb 
     */
    u64 addr = alloc_phys_aligned(objsize(ObjType_Dispatcher), BASE_PAGE_SIZE);
    init_pcb = (struct Pcb *)pa2kva(addr);
    caps_create_new(ObjType_Dispatcher, addr, 0, objsize(ObjType_Dispatcher), 1, 0, &(bi->init_pcb_cte));
    bi->init_pcb_cte.cap.u.dispatcher.e = (struct Pcb *)addr;
    dprintf("ccf pcb at 0x%x\n", addr);

    /*
     * ccf init_pcb's cspace(l1cnode) it has 16 slot, each slot is a l2cnode
     * size = 1k
     */
    addr = alloc_phys_aligned(objsize(ObjType_L1cnode), BASE_PAGE_SIZE);
    init_pcb->cspace = (struct cte *)pa2kva(addr);
    init_cspace = init_pcb->cspace;

    caps_create_new(ObjType_L1cnode, addr, 
                    objsize(ObjType_L1cnode), objsize(ObjType_L1cnode), 1, 0, init_cspace);
    dprintf("ccf cspace at 0x%x\n", addr);

    /*
     * ccf pagecn it has 1024 slot, each slot is a cte. size = 64k
     * ccf pgdir, it's in pagecn's slot
     */
    pagecn = caps_locate_slot(init_cspace->cap.u.l1cnode.base, SLOT_PAGECN); 
    caps_create_new(ObjType_L2cnode, alloc_phys_aligned(objsize(ObjType_L2cnode), BASE_PAGE_SIZE), 
                    objsize(ObjType_L2cnode), objsize(ObjType_L2cnode), 1, 0, pagecn);
    dprintf("ccf pagecn at 0x%x\n", pagecn->cap.u.l2cnode.base);
    
    pgdir_cte = caps_locate_slot(pagecn->cap.u.l2cnode.base, p_pcnslot_cnt++);
    caps_create_new(ObjType_VNode_l0, alloc_phys_aligned(objsize(ObjType_VNode_l0), BASE_PAGE_SIZE), 
                    0, objsize(ObjType_VNode_l0), 1, 0, pgdir_cte);
    
    // set init pcb's pg_dir
    init_pcb->pg_dir = pa2kva(pgdir_cte->cap.u.vnode_l0.base);
    dprintf("ccf pgdir at 0x%x\n", pgdir_cte->cap.u.vnode_l2.base);

    /*
     * ccf ustackcn it has 1024 slot, each slot is a cte. size = 64k
     * ccf ustack, it's in ustackcn's slot
     */
    u_stack_cte = caps_locate_slot(pagecn->cap.u.l2cnode.base, p_pcnslot_cnt++);
    caps_create_new(ObjType_Page, alloc_phys_aligned(objsize(ObjType_Page), BASE_PAGE_SIZE), 
                    0, objsize(ObjType_Page), 1, 0, u_stack_cte);
    dprintf("ccf u_stack at 0x%x\n", u_stack_cte->cap.u.page.base);
    
}


void pcb_create_init(void *binary, u32 size, int priority)
{
    /*
     *  1. alloc pages for pg_dir
     *  2. alloc pages for u_stack
     */
    set_init_pcb_caps();
    dprintf("setup success!\n");

    /* 
     *  1. map pg_dir to pg_dir
     *  2. map u_stack to pg_dir
     */
    map_ptable((u64 *)init_pcb->pg_dir, UVPD, kva2pa(init_pcb->pg_dir), PTE_USER | PTE_RO, pagecn, &p_pcnslot_cnt);
    dprintf("map pg_dir success!\n");

    map_ptable((u64 *)init_pcb->pg_dir, U_STACK_TOP - BASE_PAGE_SIZE,
                 u_stack_cte->cap.u.page.base, PTE_USER | PTE_RW, pagecn, &p_pcnslot_cnt);
    dprintf("map u_stack success!\n");

    init_pcb->pcb_tf.spsr = 0;
    init_pcb->pcb_tf.sp = U_STACK_TOP;

    init_pcb->pid = gen_pid();
    init_pcb->ppid = 0;
    init_pcb->status = ENV_RUNNABLE;
    init_pcb->pri = priority;
    init_pcb->cpu_id = 0;    

    init_pcb->ipc_on = 0;

    /*
     * load elf img
     */
    load_elf_img(init_pcb, binary, size);
    dprintf("load elf_img success!\n");

    LIST_INSERT_TAIL(&pcb_sched_list, init_pcb, sched_link);
}



void ep_append(struct Endpoint *ep, struct Pcb *p, int state)
{
    assert(state == EP_State_Send || state == EP_State_Idle || state == EP_State_Recv);
    u64 proc_addr = (u64)p;
    if (ep->len == 0) {
        assert(ep->head == 0 && ep->tail == 0);
        ep->head = proc_addr;
        ep->tail = proc_addr;
        p->ipc_prev = NULL;
        p->ipc_next = NULL;
        ep->state = state;
    }   
    else {
        struct Pcb *tail = (struct Pcb *)ep->tail;
        tail->ipc_next = p;
        p->ipc_prev = tail;
        p->ipc_next = NULL;
        ep->tail = proc_addr;
    }
    ep->len++;
}

struct Pcb* ep_pop(struct Endpoint *ep)
{
    assert(ep->len > 0);
    struct Pcb* ret = (struct Pcb *)ep->tail;
    if (ep->len == 1) {
        ep->state = EP_State_Idle;
        ep->head = ep->tail = 0;
    }
    else {
        ep->tail = (u64)ret->ipc_prev;
        ret->ipc_prev->ipc_next = NULL;
        ret->ipc_prev = NULL;
    }
    ep->len--;
    return ret;
}

void ipc_copy(struct ipc_buffer *src, struct ipc_buffer *dest)
{
    assert(src != NULL && dest != NULL);
    int i;
    for (i = 0; i < MSG_MAX_LEN; i++) {
        dest->msg[i] = src->msg[i];
    }
}


