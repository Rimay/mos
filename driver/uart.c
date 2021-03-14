#include <mmio.h>
#include <uart.h>

#define UART0_BASE 0x09000000ull

void uart_send(char c)
{
    writel(c, (volatile void *)(MMIO_KERN | UART0_BASE));
}
