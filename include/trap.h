#ifndef _TRAP_H_
#define _TRAP_H_

#include <utils.h>

#define CAP_MAX_CMD 15

struct Trapframe
{
    u64 regs[31];
    u64 spsr;
    u64 elr;
    u64 sp;
};

extern struct Trapframe *trap_frames[];


#endif
