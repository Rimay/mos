.section .text.start

.global _start
_start:
    ldr x1, =0x40080000
    mov sp, x1
    adr x0, kernel_page_directory
    bl vm_init          // jump to boot/vm.c vm_init function
    mov x19, x0

.global _el1_start
_el1_start:
    mrs x0, mpidr_el1
    and x1, x0, #0x100
    cbnz x1, 1f // only support one cluster
    and x0, x0, #0xff // x0 <- core id

    ldr x1, =0xFFFFFF8040080000
    mov x2, #0x20000
    mul x3, x0, x2
    sub x1, x1, x3

    mov sp, x1
    // load exception vector
    ldr x0, =vectors
    msr vbar_el1, x0

    ldr x0, =0x4400FF
    msr mair_el1, x0
    
    ldr x0, =0x34B5593519
    msr tcr_el1, x0
    isb
    
    adr x0, kernel_page_directory
    msr ttbr0_el1, x0
    msr ttbr1_el1, x0
    
    dsb ish
    isb
    
    mrs x0, sctlr_el1
    ldr x0, =0x30d51825
    msr sctlr_el1, x0
    isb

    mov x0, x19
    ldr x1, =main
    blr x1

1:  wfe
    b 1b

.section .data.init
kernel_page_directory:
    .align 12
    .space 4096
