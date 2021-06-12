#include <cpu.h>
#include <gic.h>
#include <kclock.h>
#include <printf.h>
#include <sched.h>
#include <spin_lock.h>
#include "cap.h"
#include "page.h"
#include "dprintf.h"

extern void _binary_client_elf_start();
extern void _binary_client_elf_end();

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
        dprintf("freemem 0x%lx\n", freemem);
        
        cap_init_1(freemem);
        dprintf("cap_init ok!\n");
        // while (1) {}

        cpu_disable_irq();
        gicd_init();
        dprintf("gicd_init ok!\n");

        pcb_create_init(_binary_client_elf_start, _binary_client_elf_end - _binary_client_elf_start, 0);
        dprintf("init pcb 'hello' create ok!\n");
        dprintf("freemem 0x%lx\n", phy_alloc_addr);
        
        cap_init_2();
        
        cpu_boot_secondary();
        dprintf("boot secondary ok!\n");
    }

    gicc_init();
    dprintf("core %d gicc_init ok!\n", id);

    timer_gic_init(id);
    dprintf("core %d timer_gic_init ok!\n", id);

    kclock_init();
    dprintf("core %d kclock_init ok!\n\n\n", id);

    cpu_enable_irq();

    while (1)
    {
        asm volatile("wfi");
    }
}
