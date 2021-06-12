#ifndef _PS_STATE_H
#define _PS_STATE_H

#include "allocator.h"

struct procserv_state {
    struct vka alloctor;
    struct vka_object endpoint;
    
    // struct cspace_path ipc_recv;
    
    // struct pid_list plist;
    
    u64 faketime;
};



void initialise(struct procserv_state *s);

#endif
