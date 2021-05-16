#include "lib.h"

extern void umain();

void exit(void) {
    syscall_pcb_destroy(0);
}

struct Pcb *pcb;

void libmain(int argc, char **argv) {
    // pcb = 0;
    // int pcbid;
    // pcbid = syscall_getpcbid();
    // pcb = &pcbs[ENVX(pcbid)];

    umain(argc, argv);
    exit();
}
