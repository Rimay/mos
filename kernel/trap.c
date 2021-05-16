#include <printf.h>
#include <syscall_all.h>
#include <utils.h>
#include <pcb.h>
#include <cpu.h>
#include "cap.h"


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

void handle_el0_pgfault() {
    // unsigned long bad_va;
    // bad_va = get_far();
    int cpu_id = cpu_current_id();
    printf("cpu %d handle pgfault at elr %l016x\n", cpu_id, get_elr());
    printf("\n[cpu %d Page fault]\n", cpu_id);
    printf("esr : [%08x]\n", get_esr());
    printf("va  : [%l016x]\n", get_far());
    printf("elr  : [%l016x]\n", get_elr());
    while (1) {
        asm volatile ("wfi");
    }
    
    // if (curpcb[cpu_id]->pgfault_handler == 0) {
        printf("\n[cpu %d Page fault]\n", cpu_id);
        printf("esr : [%08x]\n", get_esr());
        printf("va  : [%l016x]\n", get_far());
        printf("elr  : [%l016x]\n", get_elr());
        while (1) {
            asm volatile ("wfi");
        }
//    } else {
//        u64 *pte;
//        pgdir_walk(curpcb[cpu_id]->pg_dir, bad_va, 0, &pte, curpcb[cpu_id]->pid);
//        if ((*pte & PTE_COW) == 0) {
//            printf("\n[cpu %d Page fault]\n", cpu_id);
//            printf("esr : [%08x]\n", get_esr());
//            printf("va  : [%l016x]\n", get_far());
//            printf("elr  : [%l016x]\n", get_elr());
//            while (1) {
//                asm volatile ("wfi");
//            }
//        }
//        struct Trapframe *tf = trap_frames[cpu_id];
//        memcpy((void *) (U_XSTACK_TOP - sizeof(struct Trapframe)), tf, sizeof(struct Trapframe));
//        tf->elr = curpcb[cpu_id]->pgfault_handler;
//        tf->sp = U_XSTACK_TOP - sizeof(struct Trapframe);
//        tf->regs[0] = bad_va;
//        printf("tf elf is %016x\n",tf->elr);
//    }
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

typedef void (*invocation_t)(u64, u64, u64, u64, u64, u64, u64, u64);

static invocation_t invocations[ObjType_Num][CAP_MAX_CMD] = {
    [ObjType_L1cnode] = {
        [CNodeCmd_Copy]   = handle_copy,
        [CNodeCmd_Mint]   = handle_mint,
        [CNodeCmd_Create] = handle_create,
        [CNodeCmd_Delete] = handle_delete,
        [CNodeCmd_Revoke] = handle_revoke,
        [CNodeCmd_GetState] = handle_get_state,
        [CNodeCmd_GetSize] = handle_get_size,
        [CNodeCmd_Resize] = handle_resize,
        [CNodeCmd_CapIdentify] = handle_cap_identify,
    },
    [ObjType_VNode_l0] = {
        [VNodeCmd_Map]   = handle_map,
        [VNodeCmd_Unmap] = handle_unmap,
    },
    [ObjType_VNode_l1] = {
        [VNodeCmd_Map]   = handle_map,
        [VNodeCmd_Unmap] = handle_unmap,
    },
    [ObjType_VNode_l2] = {
        [VNodeCmd_Map]   = handle_map,
        [VNodeCmd_Unmap] = handle_unmap,
    },
    [ObjType_Frame_Mapping] = {
        [MappingCmd_Destroy] = handle_mapping_destroy,
        [MappingCmd_Modify] = handle_mapping_modify,
    },
    [ObjType_VNode_l0_Mapping] = {
        [MappingCmd_Destroy] = handle_mapping_destroy,
        [MappingCmd_Modify] = handle_mapping_modify,
    },
    [ObjType_VNode_l1_Mapping] = {
        [MappingCmd_Destroy] = handle_mapping_destroy,
        [MappingCmd_Modify] = handle_mapping_modify,
    },
    [ObjType_VNode_l2_Mapping] = {
        [MappingCmd_Destroy] = handle_mapping_destroy,
        [MappingCmd_Modify] = handle_mapping_modify,
    },
    [ObjType_Dispatcher] = {
        [DispatcherCmd_Setup]       = handle_dispatcher_setup,
        [DispatcherCmd_Properties]  = handle_dispatcher_properties,
    },
    [ObjType_ID] = {
        [IDCmd_Identify] = handle_idcap_identify,
    },

};


void handle_el0_syscall() {
    // printf("------ syscall interrupt received\n");

    u64 a0 = trap_frames[cpu_current_id()]->regs[0];
    u64 a1 = trap_frames[cpu_current_id()]->regs[1];
    // u64 a2 = trap_frames[cpu_current_id()]->regs[2];
    // u64 a3 = trap_frames[cpu_current_id()]->regs[3];
    // u64 a4 = trap_frames[cpu_current_id()]->regs[4];
    // u64 a5 = trap_frames[cpu_current_id()]->regs[5];
    // u64 a6 = trap_frames[cpu_current_id()]->regs[6];
    // u64 a7 = trap_frames[cpu_current_id()]->regs[7];
    if (a0 == 0) {
        sys_putchar(a0, (char) a1);
    }

}

