#ifndef _ENV_H_
#define _ENV_H_

#include <utils.h>
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


struct Pcb {
	// basic attributes
	u32 pid, ppid, status, pri, cpu_id;

	// cspace
	struct cte *cspace;
	struct cte *self_disp;	// kva

	struct cte *pagecn;
	struct cte *vnodecn;
	struct cte *pcbcn;
	struct cte *stackcn;
	struct cte *epcn;

	// vspace
	u64 pgdir_kva;
	u64 stack_kva;
	u64 uxstack_kva;
	
	// trap frame
	struct Trapframe pcb_tf;        // Saved registers

	// ipc
	struct ipc_buffer buffer;

	// fault handling
	u64 pgfault_handler;      // page fault state
	u64 xstacktop;            // top of exception stack
    
	LIST_ENTRY(Pcb) sched_link;
	struct Pcb *ipc_next;
	struct Pcb *ipc_prev;
};

#ifndef USER_LIB


LIST_HEAD(Pcb_list, Pcb);
extern struct Pcb *curpcb[NCPU];	        				// current pcb in each core
extern struct Pcb_list pcb_sched_list; 						// runnable pcb list


void init_cspace(struct Pcb *p, u64 is_root);
u64 pcb_init(struct Pcb *p, u64 ppid);
void create_root_pcb(void *binary, u32 size, int priority, int app_id);
void pcb_run(struct Pcb *e);


void ep_append(struct Endpoint *ep, struct Pcb *p, int state);
struct Pcb* ep_pop(struct Endpoint *ep);
void ipc_copy(struct ipc_buffer *src, struct ipc_buffer *dest);


#endif // USER_LIB

#endif // !_ENV_H_
