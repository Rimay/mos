.macro VECTOR handler
    sub	sp, sp, #0x110 // size of ContextFrame
    stp x0, x1,  [sp, #(0 * 16)]
    stp x2, x3,  [sp, #(1 * 16)]
    stp x4, x5,  [sp, #(2 * 16)]
    stp x6, x7,  [sp, #(3 * 16)]
    stp x8, x9,  [sp, #(4 * 16)]
    stp x10,x11, [sp, #(5 * 16)]
    stp x12,x13, [sp, #(6 * 16)]
    stp x14,x15, [sp, #(7 * 16)]
    stp x16,x17, [sp, #(8 * 16)]
    stp x18,x19, [sp, #(9 * 16)]
    stp x20,x21, [sp, #(10 * 16)]
    stp x22,x23, [sp, #(11 * 16)]
    stp x24,x25, [sp, #(12 * 16)]
    stp x26,x27, [sp, #(13 * 16)]
    stp x28,x29, [sp, #(14 * 16)]
    mrs x1, spsr_el1
    stp x30, x1, [sp, #(15 * 16)]
    mrs x0, elr_el1
    mrs x1, sp_el0
    stp x0, x1,  [sp, #(16 * 16)]

    mov x19, sp
    bl  cpu_current_id // x0 <- cpuid
    ldr x1, =trap_frames
    lsl x0, x0, #3
    add x1, x1, x0
    str x19, [x1]

    bl  \handler
    b   pop_context
.endm

.macro VECTOR_DISABLED
1:  wfe
    b      1b
.endm

// Exception Vector Table
.align 11
.global vectors
vectors:
// Current exception level with SP_EL0.
.org 0x000
    VECTOR_DISABLED // synchronous
.org 0x080
    VECTOR_DISABLED // irq
.org 0x100
    VECTOR_DISABLED // fiq
.org 0x180
    VECTOR_DISABLED // serror

// Current exception level with SP_ELx, x > 0.
.org 0x200
    VECTOR el1_sync
.org 0x280
    VECTOR el1_irq
.org 0x300
    VECTOR el1_fiq
.org 0x380
    VECTOR el1_err

// Lower exception level, aarch64
.org 0x400
    VECTOR el0_sync
.org 0x480
    VECTOR el0_irq
.org 0x500
    VECTOR el0_fiq
.org 0x580
    VECTOR el0_err

// Lower exception level, aarch32
.org 0x600
    VECTOR_DISABLED // synchronous
.org 0x680
    VECTOR_DISABLED // irq
.org 0x700
    VECTOR_DISABLED // fiq
.org 0x780
    VECTOR_DISABLED // serror

.global pop_context
pop_context:
    ldr x0, [sp, #(31 * 8)] // spsr
    ldr x1, [sp, #(32 * 8)] // elr
    ldr x2, [sp, #(33 * 8)] // sp
    msr spsr_el1, x0
    msr elr_el1, x1
    msr sp_el0, x2
    ldp x0, x1,  [sp, #(0 * 16)]
    ldp x2, x3,  [sp, #(1 * 16)]
    ldp x4, x5,  [sp, #(2 * 16)]
    ldp x6, x7,  [sp, #(3 * 16)]
    ldp x8, x9,  [sp, #(4 * 16)]
    ldp x10,x11, [sp, #(5 * 16)]
    ldp x12,x13, [sp, #(6 * 16)]
    ldp x14,x15, [sp, #(7 * 16)]
    ldp x16,x17, [sp, #(8 * 16)]
    ldp x18,x19, [sp, #(9 * 16)]
    ldp x20,x21, [sp, #(10 * 16)]
    ldp x22,x23, [sp, #(11 * 16)]
    ldp x24,x25, [sp, #(12 * 16)]
    ldp x26,x27, [sp, #(13 * 16)]
    ldp x28,x29, [sp, #(14 * 16)]
    ldr x30, [sp, #(15 * 16)]
    add	sp, sp, #0x110 // size of ContextFrame
    eret

// Syscall and Pgfault
el0_sync:
    bl lock_kernel
    mrs x19, esr_el1
    lsr x19, x19, #26
    cmp x19, #0x20 // Instruction PG Fault
    beq el0_sync_pgfault
    cmp x19, #0x24 // Data PG Fault
    beq el0_sync_pgfault
    cmp x19, #0x15
    beq el0_sync_syscall
    bl handle_el0_sync
el0_sync_end:
    bl unlock_kernel
    b pop_context

el0_sync_pgfault:
    bl handle_el0_pgfault
    b el0_sync_end

el0_sync_syscall:
    bl handle_el0_syscall
    b el0_sync_end

// Interupt (Clock)
el0_irq:
el1_irq:
    bl lock_kernel
    bl gic_handler
    bl unlock_kernel
    b pop_context

el0_fiq:
el1_fiq:
1:  bl handle_fiq
    b 1b

el0_err:
el1_err:
1:  bl handle_err
    b 1b

el1_sync:
1:  bl handle_el1_sync
    b 1b
