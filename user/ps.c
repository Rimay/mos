#include "mos.h"


struct procserv_state ps_state;
const char* dprintf_server_name = "PROCSERV";
int dprintf_server_colour = 32;


u64 faketime() {
    return ps_state.faketime++;
}

void handle_msg()
{

}


void umain(void)
{
    initialise(&ps_state);
    dprintf("PROCSERV initialised.\n");
    dprintf("==========================================\n\n");

    while (1) {
        
    }   
}


