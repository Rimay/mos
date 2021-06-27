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

extern struct bootinfo *bi;
extern u64 phy_alloc_addr;


u32 gen_pid()
{
    return pid_cnt++;
}


/*
    ccf dispatcher
    ccf cspace
        ccf pagecn
        ccf vnodecn
            ccf vnode_0
        ccf stackcn
            ccf stack
            ccf uxstack
*/
void init_cspace(struct Pcb *p, u64 is_root)
{
    if (is_root) {
        if (bi->init_pcbcn_is_created == 0) {
            create_cap(ObjType_L2cnode,  &(bi->init_pcbcn_cte), 0);
            bi->init_pcbcn_is_created = 1;
        }

        struct cte* pcb_cte = create_cap(ObjType_Dispatcher, &(bi->init_pcbcn_cte), 0);

        u64 pcb_pa = (u64)pcb_cte->cap.u.dispatcher.e;
        p = (struct Pcb *)pa2kva(pcb_pa);
        p->self_disp = pcb_cte;        
        init_pcb = p;
        
        dprintf("ccf pcb at 0x%x\n", pcb_pa);
    }
    
    // ---------------------   ccf pcb's cspace (16 slot \ size = 1k)   ---------------------
    p->cspace = create_cap(ObjType_L1cnode, p->cspace, 1);
    u64 cspace_base = p->cspace->cap.u.l1cnode.base;
    dprintf("ccf cspace at 0x%x\n", cspace_base);

    // ---------------------   ccf pagecn (1024 slot / size = 64k)   ---------------------
    struct cte *cn = caps_locate_slot(cspace_base, SLOT_PAGE); 
    cn = create_cap(ObjType_L2cnode, cn, 0);
    p->pagecn = cn;
    dprintf("ccf pagecn at 0x%x\n", cn->cap.u.l2cnode.base);
 
    // ---------------------   ccf vnodecn (1024 slot \ size = 64k)   ---------------------
    cn = caps_locate_slot(cspace_base, SLOT_VNODE);
    cn = create_cap(ObjType_L2cnode, cn, 0);
    p->vnodecn = cn;
    dprintf("ccf vnodecn at 0x%x\n", cn->cap.u.l2cnode.base);

    // ccf vnode
    cn = create_cap(ObjType_VNode, cn, 0);
    u64 pgdir_pa = cn->cap.u.vnode.base;
    p->pgdir_kva = pa2kva(pgdir_pa);
    dprintf("ccf vnode_0 at 0x%x\n", pgdir_pa);

    // ---------------------   ccf pcbcn (1024 slot \ size = 64k)   ---------------------
    cn = caps_locate_slot(cspace_base, SLOT_PCB);
    cn = create_cap(ObjType_L2cnode, cn, 0);
    p->pcbcn = cn;
    dprintf("ccf pcbcn at 0x%x\n", cn->cap.u.l2cnode.base);
    
    // ---------------------   ccf stackcn (1024 slot \ size = 64k)   ---------------------
    cn = caps_locate_slot(cspace_base, SLOT_STACK);
    cn = create_cap(ObjType_L2cnode, cn, 0);
    p->stackcn = cn;
    dprintf("ccf stackcn at 0x%x\n", cn->cap.u.l2cnode.base);

    // ccf stack
    cn = create_cap(ObjType_Page, cn, 0);
    u64 stack_pa = cn->cap.u.page.base;
    p->stack_kva = pa2kva(stack_pa);
    dprintf("ccf stack at 0x%x\n", stack_pa);

    // ccf uxstack
    cn = create_cap(ObjType_Page, cn, 0);
    u64 uxstack_pa = cn->cap.u.page.base;
    p->uxstack_kva = pa2kva(uxstack_pa);
    dprintf("ccf uxstack at 0x%x\n", uxstack_pa);

    // ---------------------   ccf epcn (1024 slot \ size = 64k)   ---------------------
    cn = caps_locate_slot(cspace_base, SLOT_ENDPOINT);
    cn = create_cap(ObjType_L2cnode, cn, 0);
    p->epcn = cn;
    dprintf("ccf epcn at 0x%x\n", cn->cap.u.l2cnode.base);
}


// init an empty pcb
u64 pcb_init(struct Pcb *p, u64 ppid)
{
    init_cspace(p, 0);

    // map pgdir 
    map_ptable((u64 *)p->pgdir_kva, UVPD, kva2pa(p->pgdir_kva), 
                PTE_USER | PTE_RO, p);
    dprintf("map pg_dir success!\n");

    // map stack 
    map_ptable((u64 *)p->pgdir_kva, U_STACK_TOP - BASE_PAGE_SIZE, kva2pa(p->stack_kva), 
                PTE_USER | PTE_RW, p);
    dprintf("map stack success!\n");

    // map uxstack 
    map_ptable((u64 *)p->pgdir_kva, U_XSTACK_TOP - BASE_PAGE_SIZE, kva2pa(p->uxstack_kva), 
                PTE_USER | PTE_RW, p);
    dprintf("map uxstack success!\n");


    u8 cpu_id = cpu_current_id();
    assert(ppid == curpcb[cpu_id]->pid);

    p->pid = gen_pid();
    p->ppid = ppid;
    p->status = ENV_NOT_RUNNABLE;
    p->pri = curpcb[cpu_id]->pri;
    p->cpu_id = cpu_id;

    return p->pid;
}


// TODO:
//      const char *app_name
void create_root_pcb(void *binary, u32 size, int priority, int app_id)
{
    // alloc pages for pg_dir and u_stack
    init_cspace(init_pcb, 1);
    dprintf("set cap success!\n");

    if (app_id == 0) {
        bi->ps_cte = init_pcb->self_disp;
    }
    else if (app_id == 1) {
        bi->app1_cte = init_pcb->self_disp;
    }
    else if (app_id == 2) {
        bi->app2_cte = init_pcb->self_disp;
    }

    // map pg_dir
    map_ptable((u64 *)init_pcb->pgdir_kva, UVPD, kva2pa(init_pcb->pgdir_kva), 
                PTE_USER | PTE_RO, init_pcb);
    dprintf("map pg_dir success!\n");

    // map stack
    map_ptable((u64 *)init_pcb->pgdir_kva, U_STACK_TOP - BASE_PAGE_SIZE, kva2pa(init_pcb->stack_kva), 
                PTE_USER | PTE_RW, init_pcb);
    dprintf("map stack success!\n");

    // map uxstack 
    map_ptable((u64 *)init_pcb->pgdir_kva, U_XSTACK_TOP - BASE_PAGE_SIZE, kva2pa(init_pcb->uxstack_kva), 
                PTE_USER | PTE_RW, init_pcb);
    dprintf("map uxstack success!\n");

    // setting up miscellaneous 
    init_pcb->pcb_tf.spsr = 0;
    init_pcb->pcb_tf.sp = U_STACK_TOP;

    init_pcb->pid = gen_pid();
    init_pcb->ppid = 0;
    init_pcb->status = ENV_RUNNABLE;
    init_pcb->pri = priority;
    init_pcb->cpu_id = 0;    
    dprintf("set miscellaneous success!\n");

    // load elf img
    load_elf_img(init_pcb, binary, size);
    dprintf("load elf_img success!\n");

    LIST_INSERT_TAIL(&pcb_sched_list, init_pcb, sched_link);
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
    set_ttbr0(curpcb[cpu_id]->pgdir_kva & 0xFFFFFFFF);    
    
    // cleanup the tlb
    tlb_invalidate();
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


