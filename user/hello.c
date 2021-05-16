#include "lib.h"

void f1()
{
    int x = 0;
    writef("x addr: 0x%lx\n", &x);
}


void umain(void)
{
    writef("hello world!\n");
    f1();
}

