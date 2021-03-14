#ifndef OSLABPI_PMAP_H
#define OSLABPI_PMAP_H

#include "mmu.h"
#include "types.h"
#include "queue.h"
#include "printf.h"
#include "error.h"

typedef unsigned long Pde;
typedef unsigned long Pte;

u64 *boot_pgdir;

LIST_HEAD(Page_list, Page);
typedef LIST_ENTRY(Page) Page_LIST_entry_t;
struct Page {
    Page_LIST_entry_t pp_link;
    u_short pp_ref;
};

extern struct Page pages[];

static inline u_long page2ppn(struct Page *pp) {return pp - pages;}
static inline u_long page2pa(struct Page *pp) {return (page2ppn(pp) << PGSHIFT);}   /* Get the physical address of Page 'pp'. */
static inline u_long page2kva(struct Page *pp) {return KADDR((u_long)(page2ppn(pp) << PGSHIFT));}

/* Get the Page struct whose physical address is 'pa'. */
static inline struct Page *pa2page(u_long pa) {
    if (PPN(pa) >= PHYSICAL_MEMORY_END / BY2PG) {
        panic("pa2page called with invalid pa: %lx", pa);
    }
    return &pages[PPN(pa)];
}

void page_init(u64 freemem);
int page_alloc(struct Page **pp);
void page_free(struct Page *pp);
void page_decref(struct Page *pp);
int pgdir_walk(u64 *pgdir, u_long va, int create, u64 **ppte, u32 env_id);
int page_insert(u64 *pgdir, struct Page *pp, u_long va, u_long perm, u32 env_id);
struct Page *page_lookup(u64 *pgdir, u_long va, u64 **ppte, u32 env_id);
void page_remove(u64 *pgdir, u_long va, u32 env_id);
void tlb_invalidate();
void bcopy(const void *src, void *dst, u_long len);
void bzero(void *b, u_long len);

#endif //OSLABPI_PMAP_H