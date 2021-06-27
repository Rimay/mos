#include "mos.h"

extern struct procserv_state ps_state;

void sv_ping_handler()
{
    dwritef(COLOUR_Y "PROCESS SERVER RECIEVED PING!!! HI THERE! (•_•)" COLOUR_RESET "\n");
}

void sv_new_ep_handler()
{
    dwritef(COLOUR_G "PROCESS SERVER RECEIVED new_ep msg!" COLOUR_RESET "\n");
    struct vka_object ep;
    int r = vka_alloc_endpoint(&ps_state.alloctor, &ep);
    user_assert(r == 0);
    
    ps_state.child_endpoint = &ep;
}
void sv_proc_watch_handler()
{

}
void sv_proc_unwatch_handler()
{

}
void sv_new_proc_handler()
{

}