#include "mos.h"

struct vka v;
struct vka_object ep;



struct vka_object ep_app1;


u64 faketime() 
{
    static u64 t = 0;
    return t++;
}


void app1_main(void)
{
    dprintf_server_name = "APP1";
    dprintf_server_colour = 32;
    dwritef("-------------------- app 1 start! --------------------\n");
    

    while(1);
}




