#include "mos.h"

extern u64 msyscall(u64 a0, u64 a1, u64 a2, u64 a3, u64 a4, u64 a5, u64 a6, u64 a7);

/*------------------------------------------------- old syscall ------------------------------------------------*/

void syscall_putchar(char c)
{
    msyscall(0, c, 0, 0, 0, 0, 0, 0);
}

u64 syscall_alloc(u64 sz)
{
    u64 r = msyscall(1, sz, 0, 0, 0, 0, 0, 0);
    return r;
}

u64 syscall_retype(u64 ut_addr, u64 ut_size, u64 dest_type, u64 disp)
{
    u64 r = msyscall(2, ut_addr, ut_size, dest_type, disp, 0, 0, 0);
    return r;
}   

u64 syscall_set_dispatcher_properties(u64 disp, u64 ppid)
{
    u64 r = msyscall(3, disp, ppid, 0, 0, 0, 0, 0);
    return r;
}

void syscall_set_pgfault_handler(u64 disp, u64 func)
{
    msyscall(4, disp, func, 0, 0, 0, 0, 0);
}


void syscall_map(u64 src_disp, u64 src_va, u64 dest_disp, u64 dest_va, u64 perm)
{
    msyscall(5, src_disp, src_va, dest_disp, dest_va, perm, 0, 0);
}

void syscall_unmap(u64 disp, u64 va)
{
    msyscall(6, disp, va, 0, 0, 0, 0, 0);
}

void syscall_page_alloc(u64 disp, u64 va, u64 perm)
{
    msyscall(7, disp, va, perm, 0, 0, 0, 0);
}

u64 syscall_get_disp_info()
{
    return msyscall(9, 0, 0, 0, 0, 0, 0, 0);
}


void syscall_set_pcb_status(u64 disp, u64 status)
{
    msyscall(11, disp, status, 0, 0, 0, 0, 0);
}


/*------------------------------------------------- msg syscall ------------------------------------------------*/
void mos_call(u64 ep_pa, u64 badge)
{
    msyscall(12, ep_pa, badge, 0, 0, 0, 0, 0);
}

void mos_send(u64 ep_pa, u64 badge)
{
    msyscall(13, ep_pa, badge, 0, 0, 0, 0, 0);
}

void mos_recv(u64 ep_pa, u64 badge)
{
    msyscall(14, ep_pa, badge, 0, 0, 0, 0, 0);
}

u64 mos_get_mr(u64 i, u64 is_cap)
{
    return msyscall(15, i, is_cap, 0, 0, 0, 0, 0);
}

void mos_set_mr(u64 i, u64 value, u64 is_cap)
{
    msyscall(16, i, value, is_cap, 0, 0, 0, 0);
}


void syscall_copy(u64 disp, u64 dest, u64 src, u64 len)
{
    msyscall(17, disp, dest, src, len, 0, 0, 0);
}

void syscall_reset_ipc_buffer()
{
    msyscall(18, 0, 0, 0, 0, 0, 0, 0);
}