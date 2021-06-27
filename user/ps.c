#include "mos.h"


struct procserv_state ps_state;

const char* dprintf_server_name = "PROCSERV";
int dprintf_server_colour = 34;
struct vka_object ep2;


u64 faketime() 
{
    return ps_state.faketime++;
}


void ps_init(struct procserv_state *s)
{
    u_memzero(s, sizeof(struct procserv_state));

    dwritef("Init vka...\n");
    vka_init(&s->alloctor);

    dwritef("Allocating endpoint...\n");
    int r = vka_alloc_endpoint(&s->alloctor, &s->endpoint);
    user_assert(r == 0);

    // TODO: should not init client ep in ps
    r = vka_alloc_endpoint(&s->alloctor, &ep2);
    user_assert(r == 0);
}


void handle_msg()
{
    u64 label = mos_get_mr(0, 0);
    if (label == RPC_PROC_PING) {
        sv_ping_handler();
    }
    else if (label == RPC_PROC_NEW_ENDPOINT) {
        sv_new_ep_handler();
    }
    else if (label == RPC_PROC_WATCH_CLIENT) {
        sv_proc_watch_handler();
    }
    else if (label == RPC_PROC_UNWATCH_CLIENT) {
        sv_proc_unwatch_handler();
    }
    else if (label == RPC_PROC_NEW_PROC) {
        sv_new_proc_handler();
    }
    else {
        dwritef("sv unknwon label: %d\n", label);
    }
    syscall_reset_ipc_buffer();
}


void run_child()
{
    dwritef("---------------------------------------\n");
    dwritef("child process forked!\n");
    dwritef("---------------------------------------\n");
    struct vka_object child_ep;
    cl_new_ep(&ps_state.endpoint, &child_ep);
    dwritef("ep addr: 0x%lx    ep cte pa: 0x%lx\n", &child_ep, child_ep.cte_pa);
    // cl_ping(&ps_state.endpoint);

    while(1){
    }
}


void umain(void)
{
    dwritef("==========================================\n");
    dwritef("Enter process server umain\n");
    dwritef("==========================================\n");
    
    dwritef("Init process server\n");
    ps_init(&ps_state);

    // dwritef("Init self-loader\n");
    // int pid = fork(&ps_state.alloctor);
    // if (pid == 0) {
    //     run_child();
    // }

    while (1) {
        mos_recv(ep2.cte_pa, 0);
        handle_msg();
        ps_state.faketime++;
    }   
}


