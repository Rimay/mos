#include "mos.h"

void initialise(struct procserv_state *s) 
{
    memzero(s, sizeof(struct procserv_state));
    /* todo: initialise vka */
    dprintf("Allocating process server vka...\n");

    /* todo: initialise endpoint */
    dprintf("Allocating endpoint...\n");

    // /* todo: initialise ipc_recv */
    // dprintf("Allocating ipc recv slot...\n");

    // /* todo: initialise miscellaneous states. */
    // dprintf("Initialising miscellaneous states....\n");

    
}