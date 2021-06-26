#ifndef _PS_H_
#define _PS_H_

#include "mos.h"

struct procserv_state;

#ifndef _RPC_PROC_LABEL_ENUMS_
#define _RPC_PROC_LABEL_ENUMS_
enum rpc_proc_label_enum {
    RPC_PROC_IDLE,
    RPC_PROC_PING,
    RPC_PROC_NEW_ENDPOINT,
    RPC_PROC_WATCH_CLIENT,
    RPC_PROC_UNWATCH_CLIENT,
    RPC_PROC_NEW_PROC,
};
#endif


void ps_init(struct procserv_state *s);


#endif
