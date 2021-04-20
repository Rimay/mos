#ifndef SPIN_LOCK_H
#define SPIN_LOCK_H

typedef volatile unsigned int spinlock_t;

void spin_lock(spinlock_t *lock);
void spin_unlock(spinlock_t *lock);

void lock_kernel();
void unlock_kernel();

#endif