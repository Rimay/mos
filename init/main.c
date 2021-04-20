#include <cpu.h>
#include <env.h>
#include <gic.h>
#include <kclock.h>
#include <pmap.h>
#include <printf.h>
#include <sched.h>
#include <spin_lock.h>

extern void _binary_pingpong_elf_start();
extern void _binary_pingpong_elf_end();
extern void _binary_test0_elf_start();
extern void _binary_test0_elf_end();
extern void _binary_test1_elf_start();
extern void _binary_test1_elf_end();
extern void _binary_test2_elf_start();
extern void _binary_test2_elf_end();
extern void _binary_test3_elf_start();
extern void _binary_test3_elf_end();
extern void _binary_test4_elf_start();
extern void _binary_test4_elf_end();
extern void _binary_idle_elf_start();
extern void _binary_idle_elf_end();

extern void _binary_fktest_elf_start();
extern void _binary_fktest_elf_end();

extern char bss_start[];
extern char bss_end[];

void *memset(void *dst, u8 c, u64 count)
{
    u8 *d = (u8 *)dst;
    while (count--) {
        *d = c;
        d++;
    }
    return dst;
}

void main(u64 freemem)
{

    u8 id = cpu_current_id();
    if (id == 0)
    {
        memset(bss_start, 0, bss_end - bss_start);
        printf("cpu %d at main\n", id);
        printf("freemem %016x\n", freemem);
        
        page_init(freemem);
        printf("page_init ok!\n");

        env_init();
        printf("env_init ok!\n");

        cpu_disable_irq();
        gicd_init();
        printf("gicd_init ok!\n");

        // env_create_priority(_binary_test0_elf_start, _binary_test0_elf_end - _binary_test0_elf_start, 2);
        // env_create_priority(_binary_test1_elf_start, _binary_test1_elf_end - _binary_test1_elf_start, 2);
        // env_create_priority(_binary_test2_elf_start, _binary_test2_elf_end - _binary_test2_elf_start, 1);
        // env_create_priority(_binary_test3_elf_start, _binary_test3_elf_end - _binary_test3_elf_start, 1);
        // env_create_priority(_binary_test4_elf_start, _binary_test4_elf_end - _binary_test4_elf_start, 1);
        // env_create_priority(_binary_test0_elf_start, _binary_test0_elf_end - _binary_test0_elf_start, 0);
        // env_create_priority(_binary_test1_elf_start, _binary_test1_elf_end - _binary_test1_elf_start,1);
        // env_create_priority(_binary_test2_elf_start, _binary_test2_elf_end - _binary_test2_elf_start,2);
        // env_create_priority(_binary_test3_elf_start, _binary_test3_elf_end - _binary_test3_elf_start,1);
        // env_create_priority(_binary_test4_elf_start, _binary_test4_elf_end - _binary_test4_elf_start,1);
        // env_create_priority(_binary_idle_elf_start, _binary_idle_elf_end - _binary_idle_elf_start, 0);
        // env_create_priority(_binary_idle_elf_start, _binary_idle_elf_end - _binary_idle_elf_start, 0);
        // env_create_priority(_binary_idle_elf_start, _binary_idle_elf_end - _binary_idle_elf_start, 0);
        // env_create_priority(_binary_idle_elf_start, _binary_idle_elf_end - _binary_idle_elf_start, 0);

        env_create_priority(_binary_fktest_elf_start, _binary_fktest_elf_end - _binary_fktest_elf_start, 1);

        // env_create_priority(_binary_pingpong_elf_start, _binary_pingpong_elf_end - _binary_pingpong_elf_start, 1);
        printf("env_create ok!\n");

        cpu_boot_secondary();
        printf("boot secondary ok!\n");
    }

    gicc_init();
    printf("core %d gicc_init ok!\n", id);

    timer_gic_init(id);
    printf("core %d timer_gic_init ok!\n", id);

    kclock_init();
    printf("core %d kclock_init ok!\n", id);

    cpu_enable_irq();

    while (1)
    {
        asm volatile("wfi");
    }
}
