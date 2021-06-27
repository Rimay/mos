#include <cpu.h>
#include <gic.h>
#include <kclock.h>
#include <printf.h>
#include <sched.h>
#include <spin_lock.h>
#include "cap.h"
#include "page.h"
#include "dprintf.h"

extern void _binary_ps_elf_start();
extern void _binary_ps_elf_end();

extern void _binary_app1_elf_start();
extern void _binary_app1_elf_end();

extern void _binary_app2_elf_start();
extern void _binary_app2_elf_end();

extern char bss_start[];
extern char bss_end[];


static inline void set_bss_zero(void *dst, u64 count)
{
    u8 *d = (u8 *)dst;
    while (count--) {
        *d = 0;
        d++;
    }
}


void main(u64 freemem)
{
    // printf("enter main\n");
    u8 id = cpu_current_id();
    if (id == 0) {
        set_bss_zero(bss_start, bss_end - bss_start);
        dprintf("cpu %d at main\n", id);
        dprintf("freemem: 0x%lx\n", freemem);
        
        cap_init_1(freemem);
        dprintf("cap_init success!\n");

        cpu_disable_irq();
        gicd_init();
        dprintf("gicd_init success!\n");

        create_root_pcb(_binary_ps_elf_start, _binary_ps_elf_end - _binary_ps_elf_start, 0, 0);
        dprintf("process server create success!\n");

        create_root_pcb(_binary_app1_elf_start, _binary_app1_elf_end - _binary_app1_elf_start, 0, 1);
        dprintf("app1 create success!\n");

        create_root_pcb(_binary_app2_elf_start, _binary_app2_elf_end - _binary_app2_elf_start, 0, 2);
        dprintf("app2 create success!\n");

        dprintf("freemem: 0x%lx\n", phy_alloc_addr);
        
        cap_init_2();
        
        cpu_boot_secondary();
        dprintf("boot secondary success!\n");
    }

    gicc_init();
    dprintf("core %d gicc_init success!\n", id);

    timer_gic_init(id);
    dprintf("core %d timer_gic_init success!\n", id);

    kclock_init();
    dprintf("core %d kclock_init success!\n\n\n", id);

    cpu_enable_irq();

    while (1)
    {
        asm volatile("wfi");
    }
}
