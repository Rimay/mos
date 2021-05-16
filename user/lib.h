#ifndef LIB_H
#define LIB_H

#define USER_LIB

#include <error.h>
#include <queue.h>
#include <trap.h>
#include <pcb.h>
#include <utils.h>
#include <mmu.h>


extern unsigned long *vpt, *vpm, *vpd;
/////////////////////////////////////////////////////////////
//                          Printf                         //
/////////////////////////////////////////////////////////////
#include <stdarg.h>

void user_lp_Print(void (*output)(void *, const char *, int), void *arg, const char *fmt, va_list ap);
void writef(char *fmt, ...);
void _user_panic(const char *, int, const char *, ...)
__attribute__((noreturn));

#define user_panic(...) _user_panic(__FILE__, __LINE__, __VA_ARGS__)


/////////////////////////////////////////////////////////////
//                       Syscall                           //
/////////////////////////////////////////////////////////////
void syscall_putchar(char c);
unsigned int syscall_getpcbid();
void syscall_yield();
int syscall_pcb_destroy(unsigned int pcbid);
int syscall_set_pgfault_handler(unsigned int pcbid, void (*func)(void), unsigned long xstacktop);
int syscall_mem_alloc(unsigned int pcbid, unsigned long va, unsigned long perm);
int syscall_mem_map(unsigned int srcid, unsigned long srcva, unsigned int dstid, unsigned long dstva, unsigned long perm);
int syscall_mem_unmap(unsigned int pcbid, unsigned long va);
unsigned int syscall_pcb_alloc();
int syscall_set_pcb_status(unsigned int pcbid, unsigned int status);
int syscall_set_trapframe(unsigned int pcbid, struct Trapframe *tf);
void syscall_panic(char *msg);
void syscall_ipc_recv(unsigned long dstva);
int syscall_ipc_can_send(unsigned int pcbid, unsigned long value, unsigned long srcva, unsigned long perm);
char syscall_cgetc();
void syscall_emmc_read(unsigned int sector, unsigned long va);



//////////////////////////////////////////////////////////////

#define user_assert(x)	\
	do {	if (!(x)) user_panic("assertion failed: %s", #x); } while (0)

#endif
