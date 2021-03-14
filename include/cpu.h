#ifndef _CPU_H_
#define _CPU_H_

#include <types.h>
#define NCPU 4

u8 cpu_current_id();
void cpu_boot_secondary();
void cpu_enable_irq();
void cpu_disable_irq();

#endif // !_ENV_H_