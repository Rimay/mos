#ifndef _ENV_H_
#define _ENV_H_

#include "mmu.h"
#include "queue.h"
#include "trap.h"
#include "cpu.h"
#include "cap.h"
#include "kernel_objects.h"

#define ENVX(pcbid)	((pcbid) & (NENV - 1))

#define ENV_NOT_RUNNABLE	0
#define ENV_RUNNABLE		1
#define ENV_RUNNING			2
#define ENV_BLOCK_ON_RECV			3
#define ENV_BLOCK_ON_SEND			4


#define MSG_MAX_LEN 8
#define MSG_MAX_EXTRA_CAPS 4

struct ipc_buffer;
enum endpoint_state {
    EP_State_Idle = 0,
    EP_State_Send = 1,
    EP_State_Recv = 2
};

struct ipc_info {
    u32 msg_num;
    u32 cap_num;
};

struct ipc_buffer {
    u64 msg[MSG_MAX_LEN];
    u64 caps[MSG_MAX_EXTRA_CAPS];
};

    // struct ipc_info tag;
    // u64 recv_cnode;
    // u64 recv_l1_offset;
    // u64 recv_l2_offset;

struct Pcb {
	// basic attributes
	u32 pid, ppid, status, pri, cpu_id;

	// cspace
	struct cte *cspace;

	// vspace
	u64 pg_dir;             
	
	// trap frame
	struct Trapframe pcb_tf;        // Saved registers

	// ipc
	u32 ipc_on;
	struct ipc_buffer buffer;

	// fault handling
	u64 pgfault_handler;      // page fault state
	u64 xstacktop;            // top of exception stack
    
	LIST_ENTRY(Pcb) sched_link;
	struct Pcb *ipc_next;
	struct Pcb *ipc_prev;
};

#ifndef USER_LIB

#include <utils.h>

LIST_HEAD(Pcb_list, Pcb);
extern struct Pcb *curpcb[NCPU];	        				// current pcb in each core
extern struct Pcb_list pcb_sched_list; 						// runnable pcb list

u64 pcb_init(struct Pcb *p, u64 ppid, struct cte **u_stack_cte);

void pcb_run(struct Pcb *e);
void set_init_pcb_caps();
void pcb_create_init(void *binary, u32 size, int priority);

void ep_append(struct Endpoint *ep, struct Pcb *p, int state);
struct Pcb* ep_pop(struct Endpoint *ep);
void ipc_copy(struct ipc_buffer *src, struct ipc_buffer *dest);

// int pcb_alloc(struct Pcb **e, u_int ppid);


#endif // USER_LIB

#endif // !_ENV_H_
