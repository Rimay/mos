#include "mos.h"

struct vka v;
struct vka_object ep1, ep2;

u64 faketime() {
    static u64 t = 0;
    return t++;
}

const char* dprintf_server_name = "client";
int dprintf_server_colour = 32;

void umain(void)
{
    dwritef("hello world!\n");
    
    // init basic vka info
    vka_init(&v);
    
    // init ep: ep1 for parent
    //          ep2 for child
    vka_alloc_endpoint(&v, &ep1);
    vka_alloc_endpoint(&v, &ep2);

    // fork to get pid
    int pid = fork(&v);

    if (pid == 0) {
        dwritef("---------------------------------------\n");
        dwritef("child process success!\n");
        dwritef("---------------------------------------\n");
        
        u64 sender_badge = 0;
        
        mos_set_mr(0, 0x6161, 0);
        mos_send(ep1.cte_pa, 0);
        mos_recv(ep1.cte_pa, 0);

        u64 msg = mos_get_mr(0, 0);
        dwritef("receive 0x%lx from 0x%lx\n", msg, sender_badge);
        while (1);
    }
    else {
        dwritef("---------------------------------------\n");
        dwritef("parent process success! child pid: %d\n", pid);
        dwritef("---------------------------------------\n");
        
        u64 sender_badge = 0;
        
        mos_recv(ep2.cte_pa, 0);
        u64 msg = mos_get_mr(0, 0);
        dwritef("receive 0x%lx from 0x%lx\n", msg, sender_badge);
        msg = ~msg;
        mos_set_mr(0, msg, 0);
        mos_send(ep2.cte_pa, 0);
        while (1);
    }
}

