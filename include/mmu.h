#ifndef _MMU_H_
#define _MMU_H_

// #ifndef USER_LIB


#include "error.h"
#include "utils.h"
#include "queue.h"
#include "printf.h"
#include "error.h"
#include "utils.h"



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


#define PHYSICAL_MEMORY_START  0x40000000u
#define PHYSICAL_MEMORY_END    0x60000000u
#define PHYSICAL_MEMORY_LENGTH (PHYSICAL_MEMORY_END - PHYSICAL_MEMORY_START)


#define U_LIMIT             0x80000000
#define U_XSTACK_TOP        0x80000000
#define U_STACK_TOP         0x01000000
#define PAGE_FAULT_TEMP (U_XSTACK_TOP - 2 * BY2PG)

#define UVPD                0x7040200000UL
#define UVPM                0x7040000000UL
#define UVPT                0x7000000000UL


#define PTE_NORMAL      (0u << 2u)
#define PTE_DEVICE      (1u << 2u)
#define PTE_NON_CACHE   (2u << 2u)


#define PTE_4KB         (0b11u)          // Table descriptor
#define PTE_KERN        (0u << 6u)        //
#define PTE_USER        (1u << 6u)        //
#define PTE_RW          (0u << 7u)        //
#define PTE_RO          (1u << 7u)        //
#define PTE_AF          (1u << 10u)       //
#define PTE_PXN         (1ul << 53u)     //
#define PTE_UXN         (1ul << 54u)     //
#define PTE_OUTER_SHARE (2u << 8u)        //
#define PTE_INNER_SHARE (3u << 8u)        //

// user-defined PTE_FLAG
#define PTE_COW         (1ul << 55u)
#define PTE_LIBRARY     (1ul << 56u)



/* ---------------------------------------------------------- fish ------------------------------------------------------------- */

/* The system's base page size is 4kB, mapped in the L2 table */
#define BASE_PAGE_BITS       12
#define BASE_PAGE_SIZE       BIT(BASE_PAGE_BITS)
#define BASE_PAGE_MASK       MASK(BASE_PAGE_BITS)
#define BASE_PAGE_OFFSET(a)  ((a) & BASE_PAGE_MASK)

// /* 2MB pages are mapped in the L2 table */
// #define L2_BLOCK_BITS      21
// #define L2_BLOCK_SIZE      BIT(L2_BLOCK_BITS)
// #define L2_BLOCK_MASK      MASK(L2_BLOCK_BITS)
// #define L2_BLOCK_OFFSET(a) ((a) & L2_BLOCK_MASK)

/* 2MB pages are mapped in the L1 table */
#define L1_BLOCK_BITS       21
#define L1_BLOCK_SIZE       BIT(L1_BLOCK_BITS)
#define L1_BLOCK_MASK       MASK(L1_BLOCK_BITS)
#define L1_BLOCK_OFFSET(a)  ((a) & L1_BLOCK_MASK)

// L0 entry info
#define L0_BITS              30
#define L0_SIZE              BIT(L0_BITS)
#define L0_MASK              MASK(L0_BITS)
#define L0_OFFSET(a)         ((a) & L0_MASK)

/* All entries are 8 bytes */
#define PTABLE_ENTRY_BITS 3
#define PTABLE_ENTRY_SIZE BIT(PTABLE_ENTRY_BITS)

/* All levels resolve 9 bits (in contrast to earlier ARMs). */
#define PTABLE_BITS          9
#define PTABLE_SIZE          BIT(PTABLE_BITS + PTABLE_ENTRY_BITS)
#define PTABLE_MASK          MASK(PTABLE_BITS + PTABLE_ENTRY_BITS)
#define PTABLE_CLEAR         0 /* An invalid table entry */
#define PTABLE_NUM_ENTRIES   BIT(PTABLE_BITS)

/* Macros to extract indices from the VAddr */
#define L0_BASE(addr) FIELD(L0_BITS, PTABLE_BITS, (u64)addr)
#define L1_BASE(addr) FIELD(L1_BLOCK_BITS, PTABLE_BITS, (u64)addr)
#define L2_BASE(addr) FIELD(BASE_PAGE_BITS, PTABLE_BITS, (u64)addr)
#define L012_BASE(addr) FIELD(BASE_PAGE_BITS, 3 * PTABLE_BITS, (u64)addr)

#define L2_CACHEABLE  0x08
#define L2_BUFFERABLE 0x04
#define L2_USR_RO     0x20
#define L2_USR_RW     0x30
#define L2_USR_NONE   0x10

/* Page type independent page options */
#define KPI_PAGING_FLAGS_READ    0x01
#define KPI_PAGING_FLAGS_WRITE   0x02
#define KPI_PAGING_FLAGS_EXECUTE 0x04
#define KPI_PAGING_FLAGS_NOCACHE 0x08
#define KPI_PAGING_FLAGS_MASK    0x0f


#define INIT_SPACE_LIMIT        (4 * 1024 * 1024)
#define INIT_VBASE              (2 * 1024 * 1024)

// Resolves to the required number of entries in Ln to map `limit' number of bytes.
#define L0_ENTRIES(limit) (L0_BASE((limit) - 1) + 1)
#define L1_ENTRIES(limit) (L1_BASE((limit) - 1) + 1)
#define L2_ENTRIES(limit) (L2_BASE((limit) - 1) + 1)

#define INIT_L0_ENTRIES          L0_ENTRIES(INIT_SPACE_LIMIT)
#define INIT_L1_ENTRIES          L1_ENTRIES(INIT_SPACE_LIMIT)
#define INIT_L2_ENTRIES          L1_ENTRIES(INIT_SPACE_LIMIT)


#define MEMORY_OFFSET 0xffffff8000000000ULL

#define PHYS_MEMORY_START   0x40000000ULL
#define PHYS_MEMORY_END     0x7F000000ULL


#define PADDR_SPACE_LIMIT BIT(32)         // 4G

static inline u64 pa2kva(u64 addr)
{
    assert(addr < (u64)PHYS_MEMORY_END);
    return addr + MEMORY_OFFSET;
}

static inline u64 pa_is_valid(u64 addr)
{
    return addr < PHYS_MEMORY_END;
}

static inline u64 kva2pa(u64 addr)
{
    assert(addr >= MEMORY_OFFSET);
    return addr - MEMORY_OFFSET;
}


static inline int aligned(u64 address, u64 bytes)
{
    return (address & (bytes - 1)) == 0;
}


// The address from where alloc_phys will start allocating memory
u64 phy_alloc_addr;

static inline u64 alloc_phys(u64 size)
{
    // how many page need to alloc for 'size'
    u64 page_num = (size + BASE_PAGE_SIZE - 1) / BASE_PAGE_SIZE;
    u64 addr = phy_alloc_addr;
    assert(phy_alloc_addr + page_num * BASE_PAGE_SIZE <= PHYS_MEMORY_END);
    
    // printf("addr: %x   page_num: %ld\n", addr, page_num);

    phy_alloc_addr += page_num * BASE_PAGE_SIZE;
    memzero((void *)pa2kva(addr), page_num * BASE_PAGE_SIZE);

    return addr;
}

static inline u64 alloc_phys_aligned(u64 size, u64 align)
{
    phy_alloc_addr = ROUND_UP(phy_alloc_addr, align);
    return alloc_phys(size);
}

// #endif // USER_LIB
#endif //OSLABPI_MMU_H
