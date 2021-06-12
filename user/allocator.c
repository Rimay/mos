#include "mos.h"


void vka_init(struct vka *v)
{
    v->disp_cte = syscall_get_init_disp();
    v->cspace_cte = syscall_get_init_disp_cspace();
}

int vka_alloc_object(struct vka *v, u64 type, struct vka_object *result)
{
    u64 base = syscall_alloc(objsize(type));
    u64 slot = objslot(type);
    result->cte_pa = syscall_retype(base, objsize(type), type, v->cspace_cte, slot, v->cur_slot[slot], 1);
    return 0;
}


int vka_alloc_endpoint(struct vka *v, u64 type, struct vka_object *result)
{
    return vka_alloc_object(v, type, result);
}

int vka_alloc_pcb(struct vka *v, u64 type, struct vka_object *result)
{
    return vka_alloc_object(v, type, result);
    
}


