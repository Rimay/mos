#include <printf.h>
#include <syscall_all.h>
#include <types.h>
#include <env.h>
#include <cpu.h>

struct Trapframe *trap_frames[NCPU];

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

void handle_el0_syscall() {
    int no = trap_frames[cpu_current_id()]->regs[0];
    u64 a1 = trap_frames[cpu_current_id()]->regs[1];
    u64 a2 = trap_frames[cpu_current_id()]->regs[2];
    u64 a3 = trap_frames[cpu_current_id()]->regs[3];
    u64 a4 = trap_frames[cpu_current_id()]->regs[4];
    u64 a5 = trap_frames[cpu_current_id()]->regs[5];

    u_long result;
    switch (no) {
    default:
    case 0:sys_putchar(no, (char) a1);
        break;
    case 1:result = sys_getenvid();
        sys_set_return(result);
        break;
        case 2:
            sys_yield();
            break;
        case 3:
            result = (u_long) sys_env_destroy(no, (u_int) a1);
            sys_set_return(result);
            break;
        case 4:
            result = (u_long) sys_set_pgfault_handler(no, (u_int) a1, a2, a3);
            sys_set_return(result);
            break;
        case 5:
            result = (u_long) sys_mem_alloc(no, (u_int) a1, a2, a3);
            sys_set_return(result);
            break;
        case 6:
            result = (u_long) sys_mem_map(no, (u_int) a1, a2, (u_int) a3, a4, a5);
            sys_set_return(result);
            break;
        case 7:
            result = (u_long) sys_mem_unmap(no, (u_int) a1, a2);
            sys_set_return(result);
            break;
        case 8:
            result = (u_long) sys_env_alloc();
            sys_set_return(result);
            break;
        case 9:
            result = (u_long) sys_set_env_status(no, (u_int) a1, (u_int) a2);
            sys_set_return(result);
            break;
        case 10:
            sys_set_trapframe(no, (u_int) a1, (struct Trapframe *) a2);
            break;
        case 11:
            sys_panic(no, (char *) a1);
            break;
        case 12:
            result = (u_long) sys_ipc_can_send(no, (u_int) a1, a2, a3, a4);
            sys_set_return(result);
            break;
        case 13:
            sys_ipc_recv(no, a1);
            break;
        case 14:
            result = (u_long) sys_cgetc();
            sys_set_return(result);
            break;
    }
}

void handle_el0_pgfault() {
    unsigned long bad_va;
    bad_va = get_far();
    int cpu_id = cpu_current_id();
    printf("cpu %d handle pgfault at elr %l016x\n", cpu_id, get_elr());
    if (curenv[cpu_id]->env_pgfault_handler == 0) {
        printf("\n[cpu %d Page fault]\n", cpu_id);
        printf("esr : [%08x]\n", get_esr());
        printf("va  : [%l016x]\n", get_far());
        printf("elr  : [%l016x]\n", get_elr());
        while (1) {
            asm volatile ("wfi");
        }
   } else {
       u64 *pte;
       pgdir_walk(curenv[cpu_id]->env_pgdir, bad_va, 0, &pte, curenv[cpu_id]->env_id);
       if ((*pte & PTE_COW) == 0) {
           printf("\n[cpu %d Page fault]\n", cpu_id);
           printf("esr : [%08x]\n", get_esr());
           printf("va  : [%l016x]\n", get_far());
           printf("elr  : [%l016x]\n", get_elr());
           while (1) {
               asm volatile ("wfi");
           }
       }
       struct Trapframe *tf = trap_frames[cpu_id];
       bcopy(tf, (void *) (U_XSTACK_TOP - sizeof(struct Trapframe)), sizeof(struct Trapframe));
       tf->elr = curenv[cpu_id]->env_pgfault_handler;
       tf->sp = U_XSTACK_TOP - sizeof(struct Trapframe);
       tf->regs[0] = bad_va;
       printf("tf elf is %016x\n",tf->elr);
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
