#include "mos.h"

extern struct procserv_state ps_state;

void cl_ping(struct vka_object *ep)
{
    mos_set_mr(0, RPC_PROC_PING, 0);
    mos_send(ep->cte_pa, 0);
}

void cl_new_ep(struct vka_object *ps_ep, struct vka_object *ep)
{
    mos_set_mr(0, RPC_PROC_NEW_ENDPOINT, 0);
    mos_send(ps_ep->cte_pa, 0);
    ep = ps_state.child_endpoint;
}
void cl_proc_watch()
{

}
void cl_proc_unwatch()
{

}
void cl_new_proc()
{

}