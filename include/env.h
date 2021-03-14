#ifndef _ENV_H_
#define _ENV_H_

#include "mmu.h"
#include "queue.h"
#include "trap.h"
#include "cpu.h"
#include "cap.h"

#define LOG2NENV	10u
#define NENV		(1u << LOG2NENV)
#define ENVX(envid)	((envid) & (NENV - 1))
#define GET_ENV_ASID(envid) (((envid)>> 11)<<6)

// Values of env_status in struct Env
#define ENV_FREE			0
#define ENV_RUNNABLE		1
#define ENV_NOT_RUNNABLE	2
#define ENV_RUNNING			3
#define PRIORITY_NUM		2

struct Env {
	struct Trapframe env_tf;        // Saved registers
	LIST_ENTRY(Env) env_link;       // Free list
	unsigned int env_id;                   // Unique environment identifier
	unsigned int env_parent_id;            // env_id of this env's parent
	unsigned int env_status;               // Status of the environment
	unsigned long *env_pgdir;                // Kernel virtual address of page dir
	LIST_ENTRY(Env) env_sched_link;
	unsigned int env_pri;
	unsigned int cpu_id;
	

	// Lab 4 IPC
	unsigned long env_ipc_value;            // data value sent to us
	unsigned int env_ipc_from;             // envid of the sender
	int env_ipc_recving;          // env is blocked receiving
	unsigned long env_ipc_dstva;		// va at which to map received page
	unsigned long env_ipc_perm;		// perm of page mapping received

	// Lab 4 fault handling
	unsigned long env_pgfault_handler;      // page fault state
	unsigned long env_xstacktop;            // top of exception stack

	// Lab 6 scheduler counts
	unsigned int env_runs;			// number of times been env_run'ed
};

#ifndef USER_LIB

#include <types.h>

LIST_HEAD(Env_list, Env);
extern struct Env envs[NENV];		// All environments
extern struct Env *curenv[NCPU];	        // the current env
extern struct Env_list env_sched_list[PRIORITY_NUM + 1]; // runnable env list

void env_init(void);
int env_alloc(struct Env **e, u_int parent_id);
void env_free(struct Env *);
void env_create(u_char *binary, unsigned int size);
void env_create_priority(void *binary, unsigned int size, int priority);
void env_destroy(struct Env *e);
int envid2env(u_int envid, struct Env **penv, int checkperm);
void env_run(struct Env *e);

#endif // USER_LIB

#endif // !_ENV_H_
