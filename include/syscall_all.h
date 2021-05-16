#ifndef _SYSCALL_ALL_H_
#define _SYSCALL_ALL_H_

#include <mmu.h>
#include "error.h"
#include "utils.h"

struct Trapframe;


void sys_set_return(unsigned long r);

void sys_putchar(int sysno, char c);

unsigned int sys_getpcbid();

void sys_yield();

int sys_pcb_destroy(int sysno, unsigned int pcbid);

int sys_set_pgfault_handler(int sysno, unsigned int pcbid, unsigned long func, unsigned long xstacktop);

int sys_mem_alloc(int sysno, unsigned int pcbid, unsigned long va, unsigned long perm);

int sys_mem_map(int sysno, unsigned int srcid, unsigned long srcva, unsigned int dstid, unsigned long dstva, unsigned long perm);

int sys_mem_unmap(int sysno, unsigned int pcbid, unsigned long va);

unsigned int sys_pcb_alloc();

int sys_set_pcb_status(int sysno, unsigned int pcbid, unsigned int status);

void sys_set_trapframe(int sysno, unsigned int pcbid, struct Trapframe *tf);

void sys_panic(int sysno, char *msg);

void sys_ipc_recv(int sysno, unsigned long dstva);

int sys_ipc_can_send(int sysno, unsigned int pcbid, unsigned long value, unsigned long srcva, unsigned long perm);

char sys_cgetc();

void sys_emmc_read(int sysno, unsigned int sector, unsigned long va);







/* ------------------------------------------------------------- fish -------------------------------------------------------------*/
void handle_copy(u64 a0, u64 a1, u64 a2, u64 a3, u64 a4, u64 a5, u64 a6, u64 a7);
void handle_mint(u64 a0, u64 a1, u64 a2, u64 a3, u64 a4, u64 a5, u64 a6, u64 a7);
void handle_create(u64 a0, u64 a1, u64 a2, u64 a3, u64 a4, u64 a5, u64 a6, u64 a7);
void handle_delete(u64 a0, u64 a1, u64 a2, u64 a3, u64 a4, u64 a5, u64 a6, u64 a7);
void handle_revoke(u64 a0, u64 a1, u64 a2, u64 a3, u64 a4, u64 a5, u64 a6, u64 a7);
void handle_get_state(u64 a0, u64 a1, u64 a2, u64 a3, u64 a4, u64 a5, u64 a6, u64 a7);
void handle_get_size(u64 a0, u64 a1, u64 a2, u64 a3, u64 a4, u64 a5, u64 a6, u64 a7);
void handle_resize(u64 a0, u64 a1, u64 a2, u64 a3, u64 a4, u64 a5, u64 a6, u64 a7);
void handle_cap_identify(u64 a0, u64 a1, u64 a2, u64 a3, u64 a4, u64 a5, u64 a6, u64 a7);

void handle_map(u64 a0, u64 a1, u64 a2, u64 a3, u64 a4, u64 a5, u64 a6, u64 a7);
void handle_unmap(u64 a0, u64 a1, u64 a2, u64 a3, u64 a4, u64 a5, u64 a6, u64 a7);

void handle_mapping_destroy(u64 a0, u64 a1, u64 a2, u64 a3, u64 a4, u64 a5, u64 a6, u64 a7);
void handle_mapping_modify(u64 a0, u64 a1, u64 a2, u64 a3, u64 a4, u64 a5, u64 a6, u64 a7);

void handle_dispatcher_setup(u64 a0, u64 a1, u64 a2, u64 a3, u64 a4, u64 a5, u64 a6, u64 a7);
void handle_dispatcher_properties(u64 a0, u64 a1, u64 a2, u64 a3, u64 a4, u64 a5, u64 a6, u64 a7);

void handle_idcap_identify(u64 a0, u64 a1, u64 a2, u64 a3, u64 a4, u64 a5, u64 a6, u64 a7);


















#endif //_SYSCALL_ALL_H_
