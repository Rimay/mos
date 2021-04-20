#include <spin_lock.h>

static spinlock_t kernel_lock = 0;

void lock_kernel() {
    spin_lock(&kernel_lock);
}

void unlock_kernel() {
    spin_unlock(&kernel_lock);
}

void spin_lock(spinlock_t *lock) {
    unsigned int const ONE = 1;
    spinlock_t tmp;

    asm volatile("1:\n\t"
                 "ldaxr %w0, %1 \n\t"
                 "cbnz %w0, 1b \n\t"
                 "stxr %w0, %w2, %1 \n\t"
                 "cbnz %w0, 1b \n\t"
    : "=&r"(tmp), "+Q"(*lock)
    : "r"(ONE));
}

void spin_unlock(spinlock_t *lock) {
    asm volatile("stlr wzr, %0\n\t" ::"Q"(*lock));
}
