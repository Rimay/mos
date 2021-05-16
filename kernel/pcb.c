#include "pcb.h"
#include "page.h"
#include "utils.h"
#include "kerelf.h"
#include "cap.h"

u64 pid_cnt;

struct Pcb *init_pcb;
struct Pcb *curpcb[NCPU];
struct Pcb_list pcb_sched_list;

struct cte *init_cspace, *pagecn, *pgdir_cte, *u_stack_cte;
u64 pagecn_slot_cnt;

extern struct bootinfo *bi;
extern u64 phy_alloc_addr;



u32 gen_pid()
{
    return pid_cnt++;
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
    //printf ("cpu %d tf elf after pcb_run is %l016x\n",cpu_id,old->elr);
    //printf("ret addr [%l016x]\n",curpcb[cpu_id]->pcb_tf.elr);

    // setup pgdir register
    set_ttbr0(curpcb[cpu_id]->pg_dir & 0xFFFFFFFF);    
    
    // cleanup the tlb
    tlb_invalidate();
}


void set_init_pcb_caps()
{
    /* todo:
        *  1. alloc a page for pgdir
        *  2. alloc a page for stack
    */

    /*
     * alloc a-pcb-size for init_pcb & ccf for init_pcb 
     */
    u64 addr = alloc_phys_aligned(objsize(ObjType_Dispatcher), BASE_PAGE_SIZE);
    init_pcb = (struct Pcb *)pa2kva(addr);
    caps_create_new(ObjType_Dispatcher, addr, 0, objsize(ObjType_Dispatcher), 1, 0, &(bi->init_pcb_cte));
    // printf("\t\tccf pcb at 0x%x\n", addr);


    /*
     * ccf init_pcb's cspace(l1cnode) it has 16 slot, each slot is a l2cnode
     * size = 1k
     */
    addr = alloc_phys_aligned(objsize(ObjType_L1cnode), BASE_PAGE_SIZE);
    init_pcb->cpsace = (struct cte *)pa2kva(addr);
    init_cspace = init_pcb->cpsace;

    caps_create_new(ObjType_L1cnode, addr, 
                    objsize(ObjType_L1cnode), objsize(ObjType_L1cnode), 1, 0, init_cspace);
    // printf("\t\tccf cspace at 0x%x\n", addr);

    /*
     * ccf pagecn it has 1024 slot, each slot is a cte
     * size = 64k
     */
    pagecn = caps_locate_slot(init_cspace->cap.u.l1cnode.base, ROOTCN_SLOT_PAGECN); 
    caps_create_new(ObjType_L2cnode, alloc_phys_aligned(objsize(ObjType_L2cnode), BASE_PAGE_SIZE), 
                    objsize(ObjType_L2cnode), objsize(ObjType_L2cnode), 1, 0, pagecn);
    // printf("\t\tccf pagecn at 0x%x\n", pagecn->cap.u.l2cnode.base);

    /*
     * ccf pgdir it's in pagecn's slot
     */
    pgdir_cte = caps_locate_slot(pagecn->cap.u.l2cnode.base, pagecn_slot_cnt++);
    caps_create_new(ObjType_VNode_l0, alloc_phys_aligned(objsize(ObjType_VNode_l0), BASE_PAGE_SIZE), 
                    0, objsize(ObjType_VNode_l0), 1, 0, pgdir_cte);

    init_pcb->pg_dir = pa2kva(pgdir_cte->cap.u.vnode_l0.base);
    // printf("\t\tccf pgdir at 0x%x\n", pgdir_cte->cap.u.vnode_l2.base);


    // ccf u_stack it's in pagecn's slot
    /*
     * create a new cap type u_stack
    */
    u_stack_cte = caps_locate_slot(pagecn->cap.u.l2cnode.base, pagecn_slot_cnt++);
    caps_create_new(ObjType_Page, alloc_phys_aligned(objsize(ObjType_Page), BASE_PAGE_SIZE), 
                    0, objsize(ObjType_Page), 1, 0, u_stack_cte);
    // printf("\t\tccf u_stack at 0x%x\n", u_stack_cte->cap.u.page.base);

}


void pcb_create_init(void *binary, u32 size, int priority)
{
    /* todo:
        *  1. alloc a page for pg_dir
        *  2. alloc a page for u_stack
    */
    set_init_pcb_caps();
    printf("\tsetup success!\n");

    /* todo:
        *  1. map pg_dir to pg_dir
        *  2. map u_stack to pg_dir
    */
    map_ptable(pagecn, &pagecn_slot_cnt, (u64 *)init_pcb->pg_dir, UVPD, kva2pa(init_pcb->pg_dir), PTE_USER | PTE_RO);
    printf("\tmap pg_dir success!\n");

    map_ptable(pagecn, &pagecn_slot_cnt, (u64 *)init_pcb->pg_dir, U_STACK_TOP - BASE_PAGE_SIZE,
                 u_stack_cte->cap.u.page.base, PTE_USER | PTE_RW);
    printf("\tmap u_stack success!\n");

    init_pcb->pcb_tf.spsr = 0;
    init_pcb->pcb_tf.sp = U_STACK_TOP;

    init_pcb->pid = gen_pid();
    init_pcb->ppid = 0;
    init_pcb->status = ENV_RUNNABLE;
    init_pcb->pri = priority;
    init_pcb->cpu_id = 0;    

    load_icode(init_pcb, binary, size);
    printf("\tload elf_img success!\n");

    LIST_INSERT_TAIL(&pcb_sched_list, init_pcb, sched_link);

}





