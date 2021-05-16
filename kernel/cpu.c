#include <cpu.h>
#include <mmu.h>
#include <psci.h>

void _el1_start();

// Get any additional ap booted up and running.
void cpu_boot_secondary()
{
    int i;
    for (i = 1; i < NCPU; i++)
    {
        psci_cpu_on(i, PADDR(_el1_start));
    }
}

#define PSTATE_DAIF_I_BIT (1UL << 1)

void cpu_enable_irq()
{
    asm volatile("msr DAIFClr, %0\n" ::"I"(PSTATE_DAIF_I_BIT));
}

void cpu_disable_irq()
{
    asm volatile("msr DAIFSet, %0\n" ::"I"(PSTATE_DAIF_I_BIT));
}

u8 cpu_current_id()
{
    u64 id;
    asm volatile("mrs %0, mpidr_el1"
                 : "=r"(id));
    return (u8)(id & 0xffu);
}
