.data

.global pcbs
pcbs: .dword 0x80000000
.global pages
pages: .dword 0x90000000

.global vpt
vpt: .dword 0x7000000000UL
.global vpm
vpm: .dword 0x7040000000UL
.global vpd
vpd: .dword 0x7040200000UL

.p2align 12
.global fsipcbuf
fsipcbuf: .space 4096

__sp_user: .dword 0
__elr_user: .dword 0

.extern umain

.text
.global _start
_start:
	bl	umain
	nop

.global msyscall
msyscall:
    svc #0
    ret

.global __asm_pgfault_handler
__asm_pgfault_handler:
    ldr x19, =pgfault
    blr x19
    nop
    back:
    ldr x0, [sp, #(32 * 8)] //elr
    adr x1, __elr_user
    str x0, [x1]
    ldr x0, [sp, #(33 * 8)] //sp
    adr x1, __sp_user
    str x0, [x1]

    ldp x0, x1,  [sp, #(0 * 16)]
    ldp x2, x3,  [sp, #(1 * 16)]
    ldp x4, x5,  [sp, #(2 * 16)]
    ldp x6, x7,  [sp, #(3 * 16)]
    ldp x8, x9,  [sp, #(4 * 16)]
    ldp x10,x11, [sp, #(5 * 16)]
    ldp x12,x13, [sp, #(6 * 16)]
    ldp x14,x15, [sp, #(7 * 16)]
    ldp x16,x17, [sp, #(8 * 16)]
    ldp x18,x19, [sp, #(9 * 16)] // x18 PR (reserved purpose)
    ldp x20,x21, [sp, #(10 * 16)]
    ldp x22,x23, [sp, #(11 * 16)]
    ldp x24,x25, [sp, #(12 * 16)]
    ldp x26,x27, [sp, #(13 * 16)]
    ldp x28,x29, [sp, #(14 * 16)]
    ldr x30, [sp, #(15 * 16)]

    adr x18, __sp_user
    ldr x18, [x18]
    mov sp, x18
    adr x18, __elr_user
    ldr x18, [x18]
    br x18


