#ifndef _KERNEL_OBJECTS_H_
#define _KERNEL_OBJECTS_H_

#include "utils.h"
#include "cap.h"


struct Null{
};


struct Phymem{
    u64 base;
    u64 bytes;
};


struct L1cnode {
    u64 base;
    u64 bytes;
    u64 cnt;
};

struct L2cnode {
    u64 base;
    u64 bytes;
    u64 cnt;
};

struct Page {
    u64 base;
    u64 bytes;
};

struct Dispatcher {
    struct Pcb *e;
};

struct VNode {
    u64 base;
};

struct Endpoint {
    u64 head;   // Struct Pcb pointer addr 
    u64 tail;   // Struct Pcb pointer addr 
    u64 len;
    u64 state;
};




#endif
