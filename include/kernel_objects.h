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
    u8 rightsmask;
};

struct L2cnode {
    u64 base;
    u64 bytes;
};

struct Page {
    u64 base;
    u64 bytes;
};

struct Dispatcher {
    struct Pcb *e;
};

struct VNode_l0 {
    u64 base;
};

struct VNode_l0_Mapping {   
    struct capability* cap;
    struct cte* ptable;
    u16 entry;
    u16 pte_count;
};

struct VNode_l1 {
    u64 base;
};
struct VNode_l1_Mapping {   
    struct capability* cap;
    struct cte* ptable;
    u16 entry;
    u16 pte_count;
};

struct VNode_l2 {
    u64 base;
};

struct VNode_l2_Mapping {   
    struct capability* cap;
    struct cte* ptable;
    u16 entry;
    u16 pte_count;
};

#endif
