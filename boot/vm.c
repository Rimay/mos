#include <mmu.h>
#include <utils.h>

#define INIT __attribute__((section(".text.init")))

static u64 freemem __attribute__((section(".data.init")));

INIT static void boot_bzero(void *b, u64 len) {
    u64 max = (u64) b + len;
    while ((u64) b + 7 < max) {
        *(u64 *) b = 0;
        b += 8;
    }
    while ((u64) b < max) {
        *(u_char *) b++ = 0;
    }
}

INIT static void *boot_alloc(u_int n, u_int align, int clear) {
    /*
        n: allocate n byte
        align: the mem is aligned by 'align'
        clear: if clear, initialise these n byte to 0
    */
    u64 alloced_mem;
    freemem = ROUND_UP(freemem, align);
    alloced_mem = freemem;
    freemem += n;
    if (clear) {
        boot_bzero((void *) alloced_mem, n);
    }
    return (void *) alloced_mem;
}

INIT static u64 *boot_pgdir_walk(u64 *pgdir, u64 va) {
    /*
        Use 39bit virtual address (4kB page and 3 levels page table)
        [   9   |   9   |   9   |   12   ]
           Pde     Pme     Pte     Page
        find the physical address of the va from the 3 levels page table
    */
    u64 *pde;
    u64 *pme;
    u64 *pte;
    pde = (u64 *) (&pgdir[PDX(va)]);
    pme = (u64 *) (PTE_ADDR(*pde)) + PMX(va);

    // it seems that the page in pde doesn't exists
    if (!(*pde & PTE_4KB)) {
        pme = (u64 *) boot_alloc(BY2PG, BY2PG, 1);
        *pde = (u64) pme | PTE_4KB;
        pme += PMX(va);
    }

    // it seems that the page in pme doesn't exists
    pte = (u64 *) (PTE_ADDR(*pme)) + PTX(va);
    if (!(*pme & PTE_4KB)) {
        pte = (u64 *) boot_alloc(BY2PG, BY2PG, 1);
        *pme = (u64) pte | PTE_4KB;
        pte += PTX(va);
    }
    return pte;
}

INIT static void boot_map_segment(u64 *pgdir, u64 va, u64 size, u64 pa, u64 perm) {
    u64 *ppte;
    u64 i;
    for (i = 0; i < size; i += BY2PG) {
        ppte = boot_pgdir_walk(pgdir, va + i);
        *ppte = PTE_ADDR(pa + i) | perm | PTE_KERN | PTE_RW | PTE_AF | PTE_4KB;
    }
}

extern char kernel_end[];

INIT u64 vm_init(u64 *pgdir) {
    boot_bzero(pgdir, BY2PG);
    freemem = ROUND_UP(((u32) (u64) kernel_end), BY2PG);
    // Map normal memory
    boot_map_segment(pgdir,
                     PHYSICAL_MEMORY_START,
                     PHYSICAL_MEMORY_LENGTH,
                     PHYSICAL_MEMORY_START,
                     PTE_NORMAL | PTE_INNER_SHARE);
    // Map UART
    boot_map_segment(pgdir, 0x8000000, 0x1000, 0x8000000, PTE_DEVICE | PTE_OUTER_SHARE);
    // Map GICD
    boot_map_segment(pgdir, 0x8010000, 0x2000, 0x8010000, PTE_DEVICE | PTE_OUTER_SHARE);
    // Map GICC
    boot_map_segment(pgdir, 0x9000000, 0x1000, 0x9000000, PTE_DEVICE | PTE_OUTER_SHARE);
    return freemem;
}
