#ifndef RPI_EVO_INCLUDE_MMIO_H
#define RPI_EVO_INCLUDE_MMIO_H

#include <types.h>

#define MMIO_KERN 0xFFFFFF8000000000ull

static inline void writeb(u8 value, volatile void *addr) {
    *((u8 volatile *) addr) = value;
}

static inline void writew(u16 value, volatile void *addr) {
    *((u16 volatile *) addr) = value;
}

static inline void writel(u32 value, volatile void *addr) {
    *((u32 volatile *) addr) = value;
}

static inline void writeq(u64 value, volatile void *addr) {
    *((u64 volatile *) addr) = value;
}

static inline u8 readb(volatile void *addr) { return *((u8 volatile *) addr); }

static inline u16 readw(volatile void *addr) { return *((u16 volatile *) addr); }

static inline u32 readl(volatile void *addr) { return *((u32 volatile *) addr); }

static inline u64 readq(volatile void *addr) { return *((u64 volatile *) addr); }

#endif //RPI_EVO_INCLUDE_MMIO_H
