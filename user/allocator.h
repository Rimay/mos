#ifndef _ALLOCATOR_H_
#define _ALLOCATOR_H_

#include "mos.h"

struct vka {
    u64 disp_cte;
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
    
    u64 faketime;
};


/*------------------------------------- allocator function -------------------------------------*/
void vka_init(struct vka *v);
int vka_alloc_endpoint(struct vka *v, struct vka_object *result);
int vka_alloc_pcb(struct vka *v, struct vka_object *result);


#endif

