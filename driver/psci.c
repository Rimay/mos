#include <error.h>
#include <psci.h>

#define CPU_ON 0xC4000003

struct smc_result
{
    u64 x0;
    u64 x1;
    u64 x2;
    u64 x3;
};

static inline u64 smc_call(u64 x0, u64 x1, u64 x2, u64 x3,
                           struct smc_result *result)
{
    register u64 r0 asm("x0") = x0;
    register u64 r1 asm("x1") = x1;
    register u64 r2 asm("x2") = x2;
    register u64 r3 asm("x3") = x3;

#ifdef PLATFORM_QEMU
    asm volatile("hvc	#0\n"
                 : "=r"(r0)
                 : "r"(r0), "r"(r1), "r"(r2), "r"(r3));
#endif
#ifdef PLATFORM_VM
    asm volatile("smc	#0\n"
                 : "=r"(r0)
                 : "r"(r0), "r"(r1), "r"(r2), "r"(r3));
#endif
    if (result != NULL)
    {
        result->x0 = r0;
        result->x1 = r1;
        result->x2 = r2;
        result->x3 = r3;
    }

    return r0;
}

int psci_cpu_on(unsigned int cpu, u_int entry_point)
{
    int err;
    err = smc_call(CPU_ON, cpu, entry_point, 0, NULL);
    return err == 0 ? 0 : -E_INVAL;
}
