#include "mos.h"


void vka_init(struct vka *v)
{
    v->disp_cte = syscall_get_disp_info();
}


int vka_alloc_object(struct vka *v, u64 type, struct vka_object *result)
{
    u64 base = syscall_alloc(objsize(type));
    result->cte_pa = syscall_retype(base, objsize(type), type, v->disp_cte);
    // dwritef("new cte pa: 0x%lx\n", result->cte_pa);
    return 0;
}


int vka_alloc_endpoint(struct vka *v, struct vka_object *result)
{
    return vka_alloc_object(v, ObjType_Endpoint, result);
}


int vka_alloc_pcb(struct vka *v, struct vka_object *result)
{
    return vka_alloc_object(v, ObjType_Dispatcher, result);
}

int vka_alloc_page(struct vka *v, struct vka_object *result)
{
    return vka_alloc_object(v, ObjType_Page, result);
}
