#ifndef _SYSCALL_ALL_H_
#define _SYSCALL_ALL_H_

#include <mmu.h>
#include "error.h"
#include "utils.h"

struct Trapframe;

/*------------------------------------------------- old syscall ------------------------------------------------*/
void sys_putchar(char c);

u64 sys_alloc(u64 sz);
u64 sys_retype(u64 untype_addr, u64 untype_size, u64 dest_type, \
                    u64 dest_cspace, u64 l1_slot, u64 l2_slot, u64 obj_num);

u64 sys_set_dispatcher_properties(u64 disp, u64 ppid);
void sys_set_pgfault_handler(u64 disp, u64 func);

void sys_map(u64 src_disp, u64 src_va, u64 dest_disp, u64 dest_va, u64 perm);
void sys_unmap(u64 disp, u64 va);

void sys_page_alloc(u64 disp, u64 va, u64 perm);

u64 sys_get_bi();
u64 sys_get_init_disp();
u64 sys_get_init_disp_cspace();

void sys_set_pcb_status(u64 disp, u64 status);


/*------------------------------------------------- msg syscall ------------------------------------------------*/
void handle_call(u64 ep_pa, u64 badge);
void handle_send(u64 ep_pa, u64 badge);
void handle_recv(u64 ep_pa, u64 badge);

u64 get_mr(u64 i);
void set_mr(u64 i, u64 value);

void sys_copy(u64 disp, u64 dest, u64 src, u64 len);


#endif //_SYSCALL_ALL_H_




