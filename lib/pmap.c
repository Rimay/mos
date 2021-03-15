#include <env.h>
#include "pmap.h"
#include "cap.h"

struct Page pages[PHYSICAL_MEMORY_END / BY2PG];
static struct Page_list page_free_list;
u64 page_freemem;

void page_init(u64 freemem) {
    page_freemem = freemem;
    LIST_INIT(&page_free_list);
    u64 used_index = freemem / BY2PG;
    u64 i;
    
    for (i = 0; i < used_index; i++) {
        pages[i].pp_ref = 1;
    }
    for (i = used_index; i < PHYSICAL_MEMORY_END / BY2PG; i++) {
        pages[i].pp_ref = 0;
        LIST_INSERT_HEAD(&page_free_list, &pages[i], pp_link);
    }
}

void bzero(void* b, u_long len) {
    u_long max = (u_long)b + len;
    while ((u_long)b + 7 < max) {
        *(u_long *) b = 0;
        b += 8;
    }
    while ((u_long) b < max) {
        *(u_char *) b++ = 0;
    }
}

void bcopy(const void *src, void *dst, u_long len) {
    u_long max = (u_long)dst + len;
    while ((u_long) dst + 7 < max) {
        *(u_long *) dst = *(u_long *) src;
        dst += 8;
        src += 8;
    }
    while ((u_long) dst < max) {
        *(u_char *) dst = *(u_char *) src;
        dst += 1;
        src += 1;
    }
}

int page_alloc(struct Page **pp) {
    struct Page *page;
    page = LIST_FIRST(&page_free_list);
    if (page == NULL) {
        panic("page_alloc E_NO_MEM");
        return -E_NO_MEM;
    }
   
    LIST_REMOVE(page, pp_link);
    bzero((void *)page2kva(page), BY2PG);
    page->pp_ref = 0;
    *pp = page;
    return 0;
}

void page_free(struct Page *pp, u32 env_id) {
    int r;
    if (pp->pp_ref > 0) return;
    assert(pp->pp_ref == 0);

    // unmap the page
    r = cap_unmap_free_page(env_id, pp);
    assert(r >= 0);

    LIST_INSERT_HEAD(&page_free_list, pp, pp_link);
    return;
}

/* 
 *  --------------------------------
 *  core walk logic
 *  --------------------------------
 *  *pde, *pme, *pte bits[12:31] save the ppn of the page
 *       bits[0:11] save the flags of the page      
*/
int pgdir_walk(u64 *pgdir, u_long va, int create, u64 **ppte, u32 env_id) {
    struct Page *ppage;
    u_long *pde, *pme, *pte;
    pde = (u_long *) KADDR(&pgdir[PDX(va)]);
    if (!(*pde & PTE_4KB)) {
        if (!create) {
            *ppte = NULL;
            return 0;
        }
        page_alloc(&ppage);
        *pde = page2pa(ppage) | PTE_4KB;
        page_insert(pgdir, ppage, UVPM + (PDX(va) << PGSHIFT), PTE_USER | PTE_RO, env_id);
        ppage->pp_ref = 1;
    }
    pme = (u_long *)KADDR(PTE_ADDR(*pde)) + PMX(va);
    if (!(*pme & PTE_4KB)) {
        if (!create) {
            *ppte = NULL;
            return 0;
        }
        page_alloc(&ppage);
        *pme = page2pa(ppage) | PTE_4KB;
        page_insert(pgdir, ppage, UVPT + (PDX(va) << PMSHIFT) + (PMX(va) << PGSHIFT), PTE_USER | PTE_RO, env_id);
        ppage->pp_ref = 1;
    }
    pte = (u_long *)KADDR(PTE_ADDR(*pme)) + PTX(va);
    *ppte = pte;
    return 0;
}


int page_insert(u64 *pgdir, struct Page *pp, u_long va, u_long perm, u32 env_id) {
    int r;
    u_long PERM;
    u64 *pte;
    PERM = perm | PTE_NORMAL | PTE_INNER_SHARE | PTE_AF | PTE_4KB;

    // map the page 
    r = cap_map_free_page(env_id, pp);
    assert(r == 0);

    pgdir_walk(pgdir, va, 1, &pte, env_id);
    if ((*pte & PTE_4KB) != 0) {        // dirty 
        if (pa2page(*pte) != pp) {      // ppn is correct, [0:11] bits is wrong
            page_remove(pgdir, va, env_id);
        } else {                        // ppn is wrong, [0:11] bits is wrong
            tlb_invalidate();
            *pte = page2pa(pp) | PERM;
            return 0;
        }
    }

    tlb_invalidate();
    r = pgdir_walk(pgdir, va, 1, &pte, env_id);
    if (r != 0) {
        panic ("page insert check failed .\n");
    }
    *pte = page2pa(pp) | PERM;
    pp->pp_ref++;
    return 0;
}

struct Page *page_lookup(u64 *pgdir, u_long va, u64 **ppte, u32 env_id) {
    struct Page *ppage;
    u64 *pte;

    pgdir_walk(pgdir, va, 0, &pte, env_id);
    if (pte == 0 || (*pte & PTE_4KB) == 0) {
        return 0;
    }
    ppage = pa2page(PTE_ADDR(*pte));    // pte bits[13:31] save the ppn of the page
    if (ppte) {
        *ppte = pte;
    }
    return ppage;
}


void page_decref(struct Page *pp, u32 env_id) {
    if (--pp->pp_ref == 0)  page_free(pp, ENVX(env_id));
}

void page_remove(u64 *pgdir, u_long va, u32 env_id) {
    u64 *pte;
    struct Page *ppage = page_lookup(pgdir, va, &pte, env_id);
    if (ppage == 0) {
        return;
    }
    ppage->pp_ref--;
    if (ppage->pp_ref == 0) {
        page_free(ppage, ENVX(env_id));
    }
    *pte = 0;
    tlb_invalidate();
}

