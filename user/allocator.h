#ifndef _ALLOCATOR_H_
#define _ALLOCATOR_H_

#include "mos.h"

struct vka {
    u64 disp_cte;
    u64 cspace_cte;
    u64 cur_slot[L1CNODE_SLOTNUM];
};


struct vka_object {
    u64 cte_pa;   
};

struct cspace_path {
    u64 cnode;
    u64 l1index;
    u64 l2index;
};

struct procserv_state {
    struct vka alloctor;
    struct vka_object endpoint;
    
    struct vka_object *child_endpoint;
    
    // struct cspace_path ipc_recv;
    // struct pid_list plist;
    u64 faketime;
};


/*------------------------------------- allocator function -------------------------------------*/
void vka_init(struct vka *v);
int vka_alloc_endpoint(struct vka *v, u64 type, struct vka_object *result);
int vka_alloc_pcb(struct vka *v, u64 type, struct vka_object *result);


#endif

