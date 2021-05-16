#include <lib.h>

extern unsigned long msyscall(int no, unsigned long a1, unsigned long a2, unsigned long a3, unsigned long a4, unsigned long a5);

void syscall_putchar(char c) {
    msyscall(0, c, 0, 0, 0, 0);
}

unsigned int syscall_getpcbid() {
    return (unsigned int)msyscall(1, 0, 0, 0, 0, 0);
}

void syscall_yield() {
    msyscall(2, 0, 0, 0, 0, 0);
}

int syscall_pcb_destroy(unsigned int pcbid) {
    return (int)msyscall(3, pcbid, 0, 0, 0, 0);
}

int syscall_set_pgfault_handler(unsigned int pcbid, void (*func)(void), unsigned long xstacktop) {
    return (int)msyscall(4, pcbid, (unsigned long)func, xstacktop, 0, 0);
}

int syscall_mem_alloc(unsigned int pcbid, unsigned long va, unsigned long perm) {
    return (int)msyscall(5, pcbid, va, perm, 0, 0);
}

int syscall_mem_map(unsigned int srcid, unsigned long srcva, unsigned int dstid, unsigned long dstva, unsigned long perm) {
    return (int)msyscall(6, srcid, srcva, dstid, dstva, perm);
}

int syscall_mem_unmap(unsigned int pcbid, unsigned long va) {
    return (int)msyscall(7, pcbid, va, 0, 0, 0);
}

unsigned int syscall_pcb_alloc() {
    return (unsigned int)msyscall(8, 0, 0, 0, 0, 0);
}

int syscall_set_pcb_status(unsigned int pcbid, unsigned int status) {
    return (int)msyscall(9, pcbid, status, 0, 0, 0);
}

int syscall_set_trapframe(unsigned int pcbid, struct Trapframe *tf) {
    return (int)msyscall(10, pcbid, (unsigned long)tf, 0, 0, 0);
}

void syscall_panic(char *msg) {
    msyscall(11, (unsigned long)msg, 0, 0, 0, 0);
}

int syscall_ipc_can_send(unsigned int pcbid, unsigned long value, unsigned long srcva, unsigned long perm) {
    return (int)msyscall(12, pcbid, value, srcva, perm, 0);
}

void syscall_ipc_recv(unsigned long dstva) {
    msyscall(13, dstva, 0, 0, 0, 0);
}

char syscall_cgetc() {
    return (char)msyscall(14, 0, 0, 0, 0, 0);
}

void syscall_emmc_read(unsigned int sector, unsigned long va) {
    msyscall(15, sector, va, 0, 0, 0);
}