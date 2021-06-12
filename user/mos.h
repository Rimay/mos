#ifndef _MOS_H_
#define _MOS_H_

#define USER_LIB

// #include <error.h>
// #include <queue.h>
// #include <trap.h>
#include <stdarg.h>

#include "pcb.h"
#include "cap.h"
#include "mmu.h"
#include "utils.h"
#include "printf.h"
#include "print.h"

#include "ps_state.h"
#include "allocator.h"
#include "dprintf.h"
extern u64 *vpt, *vpm, *vpd;

#define user_panic(...) _user_panic(__FILE__, __LINE__, __VA_ARGS__)
#define user_assert(x) do { if (!(x)) user_panic("assertion failed: %s", #x); } while (0)

int fork(struct vka *v);


void user_lp_Print(void (*output)(void *, const char *, int),
			  void *arg,
			  const char *fmt,
			  va_list ap);
void writef(char *fmt, ...);
void _user_panic(const char *file, int line, const char *fmt, ...);

/*------------------------------------------------- old syscall ------------------------------------------------*/
void syscall_putchar(char c);
u64 syscall_alloc(u64 sz);
u64 syscall_retype(u64 untype_addr, u64 untype_size, u64 dest_type, u64 dest_cspace, u64 l1index,\
                    u64 l2index, u64 obj_num);

u64 syscall_set_dispatcher_properties(u64 disp, u64 ppid);
void syscall_set_pgfault_handler(u64 disp, u64 func);

void syscall_map(u64 src_disp, u64 src_va, u64 dest_disp, u64 dest_va, u64 perm);
void syscall_unmap(u64 disp, u64 va);

void syscall_page_alloc(u64 disp, u64 va, u64 perm);
u64 syscall_get_bi();
u64 syscall_get_init_disp();
u64 syscall_get_init_disp_cspace();
void syscall_set_pcb_status(u64 disp, u64 status);

/*------------------------------------------------- msg syscall ------------------------------------------------*/
void mos_call(u64 ep_pa, u64 badge);
void mos_send(u64 ep_pa, u64 badge);
void mos_recv(u64 ep_pa, u64 badge);
u64 mos_get_mr(u64 i);
void mos_set_mr(u64 i, u64 value);

void syscall_copy(u64 disp, u64 dest, u64 src, u64 len);


void u_memcpy(void *dst, const void *src, u64 len);
void u_memzero(void* b, u64 len);

#endif // _MOS_H_
