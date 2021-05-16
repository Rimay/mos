#ifndef _ENV_H_
#define _ENV_H_

#include "mmu.h"
#include "queue.h"
#include "trap.h"
#include "cpu.h"
#include "cap.h"

#define ENVX(pcbid)	((pcbid) & (NENV - 1))

#define ENV_NOT_RUNNABLE	0
#define ENV_RUNNABLE		1
#define ENV_RUNNING			2


struct Pcb {
	// basic attributes
	u32 pid, ppid, status, pri, cpu_id;

	// cspace
	struct cte *cpsace;

	// vspace
	u64 pg_dir;             
	
	// trap frame
	struct Trapframe pcb_tf;        // Saved registers

	// IPC
	u64 ipc_value;            // data value sent to us
	u32 ipc_from;             // pcbid of the sender
	int ipc_recving;          // pcb is blocked receiving
	u64 ipc_dstva;		// va at which to map received page
	u64 ipc_perm;		// perm of page mapping received

	// fault handling
	u64 pgfault_handler;      // page fault state
	u64 xstacktop;            // top of exception stack
    
	LIST_ENTRY(Pcb) sched_link;
};

#ifndef USER_LIB

#include <utils.h>

LIST_HEAD(Pcb_list, Pcb);
extern struct Pcb *curpcb[NCPU];	        				// current pcb in each core
extern struct Pcb_list pcb_sched_list; 						// runnable pcb list

void pcb_run(struct Pcb *e);
void set_init_pcb_caps();
void pcb_create_init(void *binary, u32 size, int priority);

// int pcb_alloc(struct Pcb **e, u_int ppid);


#endif // USER_LIB

#endif // !_ENV_H_
