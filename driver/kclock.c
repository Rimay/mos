#include <kclock.h>
#include <utils.h>

#define ARCH_TIMER_CTRL_ENABLE (1 << 0)
#define ARCH_TIMER_CTRL_IT_MASK (1 << 1)
#define ARCH_TIMER_CTRL_IT_STAT (1 << 2)

void kclock_next()
{
    u64 count = 0x1000000;
    u64 ctl;
#ifdef PLATFORM_VM
    asm volatile("mrs %0, cntv_ctl_el0"
                 : "=r"(ctl));
    ctl |= ARCH_TIMER_CTRL_ENABLE;
    ctl &= ~ARCH_TIMER_CTRL_IT_MASK;
    asm volatile("msr cntv_tval_el0, %0" ::"r"(count));
    asm volatile("msr cntv_ctl_el0, %0" ::"r"(ctl));
#endif
#ifdef PLATFORM_QEMU
    asm volatile("mrs %0, cntp_ctl_el0"
                 : "=r"(ctl));
    ctl |= ARCH_TIMER_CTRL_ENABLE;
    ctl &= ~ARCH_TIMER_CTRL_IT_MASK;
    asm volatile("msr cntp_tval_el0, %0" ::"r"(count));
    asm volatile("msr cntp_ctl_el0, %0" ::"r"(ctl));
#endif
}

void kclock_init()
{
    kclock_next();
}