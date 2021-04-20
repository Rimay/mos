#ifndef OSLABPI_MMU_H
#define OSLABPI_MMU_H

#define BY2PG   4096u
#define PDMAP   (BY2PG * 512 * 512) // size of whe whole page table
#define PDSHIFT 30u
#define PMSHIFT 21u
#define PGSHIFT 12u

#define PDX(va) ((((unsigned long)(va)) >> PDSHIFT) & 0x1FFu)
#define PMX(va) ((((unsigned long)(va)) >> PMSHIFT) & 0x1FFu)
#define PTX(va) ((((unsigned long)(va)) >> PGSHIFT) & 0x1FFu)

#define PTE_ADDR(pte) ((unsigned long)(pte) & 0xFFFFF000)

#define PPN(va) (((unsigned long)(va) & 0x0000007FFFFFFFFFUL) >> 12)
#define VPN(va) PPN(va)

#define KADDR(pa) ((unsigned long)(pa) | 0xFFFFFF8000000000UL)
#define PADDR(kva) ((unsigned long)(kva) & 0xFFFFFFFFUL)


/*  Physical Memory Layout
 *
 *    P_LIMIT   +-------------+--------------------------------+  0x7F000000
 *              |              PAGED MEMORY                    |
 *              +-------------+--------------------------------+  `freemem` passed to main
 *              | Page Table  | (Page frames used to init vm)  |
 *              |             | Kernel Page Directory          |
 *              +-------------+--------------------------------+  `kernel_end`
 *              |             | Kernel                         |
 *  KERNEL_TEXT +-------------+--------------------------------+  0x40080000
 *  KSTACK _/   |             | Core 0 Stack                   |
 *              +-------------+--------------------------------+  0x40060000
 *              |             | Core 1 Stack                   |
 *              +-------------+--------------------------------+  0x40040000
 *              |             | Core 2 Stack                   |
 *              +-------------+--------------------------------+  0x40020000
 *              |             | Core 3 Stack                   |
 *              +-------------+--------------------------------+  0x40000000 <- PHYSICAL_MEMORY_START
 *              |             | ............                   |
 *              |-------------+--------------------------------+  0x09010000
 *              |             | UART                           |
 *              |  Device     +--------------------------------+  0x09000000
 *              |             | GIC                            |
 *              +-------------+--------------------------------+  0x08000000
 *              |             |                                |
 *              +-------------+--------------------------------+  0x00000000    
 * */

#define PHYSICAL_MEMORY_START  0x40000000u
#define PHYSICAL_MEMORY_END    0x60000000u
#define PHYSICAL_MEMORY_LENGTH (PHYSICAL_MEMORY_END - PHYSICAL_MEMORY_START)


#define U_PAGES_BASE        0x90000000
#define U_ENVS_BASE         0x80000000
#define U_LIMIT             0x80000000
#define U_XSTACK_TOP        0x80000000
#define U_STACK_TOP         0x01000000

#define UVPD                0x7040200000UL
#define UVPM                0x7040000000UL
#define UVPT                0x7000000000UL


#define PTE_NORMAL      (0u << 2u)
#define PTE_DEVICE      (1u << 2u)
#define PTE_NON_CACHE   (2u << 2u)


#define PTE_4KB         (0b11u)          // if the pte exists
#define PTE_KERN        (0u << 6u)        // ?
#define PTE_USER        (1u << 6u)        // ?
#define PTE_RW          (0u << 7u)        // ?
#define PTE_RO          (1u << 7u)        // ?
#define PTE_AF          (1u << 10u)       // ?
#define PTE_PXN         (1ul << 53u)     // ?
#define PTE_UXN         (1ul << 54u)     // ?
#define PTE_OUTER_SHARE (2u << 8u)        // ?
#define PTE_INNER_SHARE (3u << 8u)        // ?

// user-defined PTE_FLAG
#define PTE_COW         (1ul << 55u)
#define PTE_LIBRARY     (1ul << 56u)

#endif //OSLABPI_MMU_H
