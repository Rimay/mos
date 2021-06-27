#include <printf.h>
#include <syscall.h>
#include <utils.h>
#include <pcb.h>
#include <cpu.h>
#include "cap.h"
#include "page.h"
#include "dprintf.h"

struct Trapframe *trap_frames[NCPU];
extern struct bootinfo *bi;
extern u64 forked_cte;


u64 get_el() {
    u64 r;
    asm volatile ("mrs %0, currentel" : "=r"(r));
    return r;
}

u64 get_elr() {
    u64 r;
    asm volatile ("mrs %0, elr_el1" : "=r"(r));
    return r;
}

u64 get_esr() {
    u64 r;
    asm volatile ("mrs %0, esr_el1" : "=r"(r));
    return r;
}

u64 get_far() {
    u64 r;
    asm volatile ("mrs %0, far_el1" : "=r"(r));
    return r;
}

void handle_el0_pgfault() {
    u8 cpu_id = cpu_current_id();
    u64 bad_va = get_far();
    u64 *pte = walk_pgdir((u64 *)curpcb[cpu_id]->pgdir_kva, bad_va);

    dprintf("+++++++++++++ page fault occured +++++++++++++\n");
    dprintf("bad va: 0x%lx  *pte: 0x%lx\n", bad_va, *pte);
    if (curpcb[cpu_id]->pgfault_handler == 0) {
        printf("\n[cpu %d Page fault]\n", cpu_id);
        printf("esr : [%08x]\n", get_esr());
        printf("va  : [%l016x]\n", get_far());
        printf("elr  : [%l016x]\n", get_elr());
        while (1) {
            asm volatile ("wfi");
        }
   }
   else {
        if ((*pte & PTE_COW) == 0) {
            printf("\n[cpu %d Page fault]\n", cpu_id);
            printf("esr : [%08x]\n", get_esr());
            printf("va  : [%l016x]\n", get_far());
            printf("elr  : [%l016x]\n", get_elr());
            while (1) {
                asm volatile ("wfi");
            }
        }

        /*
        * alloc a trapframe in user space to store current tf
        * elr -> __asm_pgfault_handler
        * sp  -> U_XSTACK_TOP - sizeof(struct Trapframe) (to restore current tf in entry.S(user code))
        */
        struct Trapframe *tf = trap_frames[cpu_id];
        memcpy((void *) (U_XSTACK_TOP - sizeof(struct Trapframe)), tf, sizeof(struct Trapframe));

        tf->elr = curpcb[cpu_id]->pgfault_handler;
        tf->sp = U_XSTACK_TOP - sizeof(struct Trapframe);       

        // todo: not use global varible to store arg 1
        tf->regs[0] = kva2pa((u64)bi->ps_cte);
        tf->regs[1] = kva2pa(forked_cte);
        tf->regs[2] = bad_va;
   }
}

void handle_el0_sync() {
    printf("\n[cpu %d EL0 Sync Exception]\n", cpu_current_id());
    printf("esr : [%08x]\n", get_esr());
    printf("ec  : [%02x]\n", get_esr() >> 26);
    printf("far : [%l016x]\n", get_far());
    printf("elr : [%l016x]\n", get_elr());
    while (1) {
        asm volatile ("wfi");
    }
}

void handle_el1_sync() {
    printf("\n[cpu %d EL1 Sync Exception]\n", cpu_current_id());
    printf("esr : [%08x]\n", get_esr());
    printf("ec  : [%02x]\n", get_esr() >> 26);
    printf("far : [%l016x]\n", get_far());
    printf("elr : [%l016x]\n", get_elr());
    while (1) {
        asm volatile ("wfi");
    }
}

void handle_fiq() {
    printf("\n[cpu %d FIQ Exception]\n", cpu_current_id());
    printf("currentel : [%08x]\n", get_el());
    printf("esr : [%08x]\n", get_esr());
    printf("far : [%l016x]\n", get_far());
    printf("elr : [%l016x]\n", get_elr());
    while (1) {
        asm volatile ("wfi");
    }
}

void handle_err() {
    printf("\n[cpu %d Err Exception]\n", cpu_current_id());
    printf("currentel : [%08x]\n", get_el());
    printf("esr : [%08x]\n", get_esr());
    printf("far : [%l016x]\n", get_far());
    printf("elr  : [%l016x]\n", get_elr());
    while (1) {
        asm volatile ("wfi");
    }
}


void set_reg0(u64 r) {
    int cpu_id = cpu_current_id();
    trap_frames[cpu_id]->regs[0] = r;
}

void handle_el0_syscall() {
    // printf("------ syscall interrupt received\n");
    u8 cpu_id = cpu_current_id();
    u64 a0 = trap_frames[cpu_id]->regs[0];
    u64 a1 = trap_frames[cpu_id]->regs[1];
    u64 a2 = trap_frames[cpu_id]->regs[2];
    u64 a3 = trap_frames[cpu_id]->regs[3];
    u64 a4 = trap_frames[cpu_id]->regs[4];
    u64 a5 = trap_frames[cpu_id]->regs[5];
    // u64 a6 = trap_frames[cpu_id]->regs[6];
    // u64 a7 = trap_frames[cpu_id]->regs[7];
    if (a0 == 0) {
        sys_putchar((char) a1);
    }
    else if (a0 == 1) {
        u64 r = sys_alloc(a1);
        set_reg0(r);
    }
    else if (a0 == 2) {
        u64 r = sys_retype(a1, a2, a3, a4);
        set_reg0(r);
    }
    else if (a0 == 3) {
        u64 r = sys_set_dispatcher_properties(a1, a2);
        set_reg0(r);
    }
    else if (a0 == 4) {
        sys_set_pgfault_handler(a1, a2);
    }
    else if (a0 == 5) {
        sys_map(a1, a2, a3, a4, a5);
    }
    else if (a0 == 6) {
        sys_unmap(a1, a2);
    }
    else if (a0 == 7) {
        sys_page_alloc(a1, a2, a3);
    }
    else if (a0 == 9) {
        u64 r = sys_get_disp_info();
        set_reg0(r);
    }
    else if (a0 == 11) {
        sys_set_pcb_status(a1, a2);
    }
    else if (a0 == 13) {
        handle_send(a1, a2);
    }
    else if (a0 == 14) {
        handle_recv(a1, a2);
    }
    else if (a0 == 15) {
        u64 r = get_mr(a1, a2);
        set_reg0(r);
    }
    else if (a0 == 16) {
        set_mr(a1, a2, a3);
    }
    else if (a0 == 17) {
        sys_copy(a1, a2, a3, a4);
    }
    else if (a0 == 18) {
        reset_ipc_buffer();
    }
}

