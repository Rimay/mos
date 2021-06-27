#include "mos.h"



struct vka_object ep_app2;


u64 faketime() 
{
    static u64 t = 0;
    return t++;
}


void app2_main(void)
{
    dprintf_server_name = "APP2";
    dprintf_server_colour = 33;
    dwritef("-------------------- app 2 start! --------------------\n");
    while(1);
}




