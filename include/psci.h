#ifndef _PSCI_H_
#define _PSCI_H_

#include "utils.h"

int psci_cpu_on(unsigned int cpu, u_int entry_point);

#endif // !_PSCI_H_