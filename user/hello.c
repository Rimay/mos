#include "mos.h"

struct vka v;


void umain(void)
{
    writef("hello world!\n");
    
    vka_init(&v);

    int t = fork(&v);
    if (t == 0) {
        writef("---------------------------------------\n");
        writef("child process success!\n");
        writef("---------------------------------------\n");

        while (1);
    }
    else {
        writef("---------------------------------------\n");
        writef("parent process success! child pid: %d\n", t);
        writef("---------------------------------------\n");


        while (1);
    }
}

