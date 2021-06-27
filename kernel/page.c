#include "mmu.h"
#include "utils.h"
#include "cap.h"
#include "printf.h"
#include "page.h"

u64 alloc_page(struct Pcb* p)
{
    struct cte* pagecn = p->pagecn;
    struct cte* page = create_cap(ObjType_Page, pagecn, 0);
    assert(page->cap.type == ObjType_Page);
    return page->cap.u.page.base;
}

u64 alloc_vnode(struct Pcb* p)
{
    struct cte* vnodecn = p->vnodecn;
    struct cte* page = create_cap(ObjType_VNode, vnodecn, 0);
    assert(page->cap.type == ObjType_VNode);
    return page->cap.u.vnode.base;
}


// remove a dirty page in pte
void unmap_page(u64 *pgdir, u64 va)
{
    u64 *pte = walk_pgdir(pgdir, va);
    *pte = 0;
}


// map va to pa w.r.t. (pg_dir, p)
void map_ptable(u64 *pg_dir, u64 va, u64 pa, u64 perm, struct Pcb* p)
{
    // printf("enter map_ptable\n");

    assert(aligned((u64)pg_dir, PTABLE_SIZE));
    assert(aligned(pa, PTABLE_SIZE));

    perm = perm | PTE_NORMAL | PTE_INNER_SHARE | PTE_AF | PTE_4KB;

    u64 *pde = (u64 *)&pg_dir[PDX(va)];
    // printf("\t\tpde at 0x%lx  pde value 0x%lx\n", pde, *pde);
    if ((*pde & PTE_4KB) == 0) {
        // map the missed l1 table page
        u64 tmp_addr = alloc_vnode(p);
        *pde = tmp_addr | PTE_4KB;
        map_ptable(pg_dir, UVPM + (PDX(va) << PGSHIFT), tmp_addr, PTE_USER | PTE_RO, p);
    }

    u64 *pme = (u64 *)pa2kva(PTE_ADDR(*pde)) + PMX(va);
    // printf("\t\tpme at 0x%lx  pme value 0x%lx\n", pme, *pme);
    if ((*pme & PTE_4KB) == 0) {
        // map the missed l2 table page
        u64 tmp_addr = alloc_vnode(p);
        *pme = tmp_addr | PTE_4KB;
        map_ptable(pg_dir, UVPT + (PDX(va) << PMSHIFT) + (PMX(va) << PGSHIFT), tmp_addr, PTE_USER | PTE_RO, p);
    }

    u64 *pte = (u64 *)pa2kva(PTE_ADDR(*pme)) + PTX(va);
    // printf("\t\tpte at 0x%lx  pte value 0x%lx\n", pte, *pte);

    if ((*pte & PTE_4KB) != 0 && PTE_ADDR(*pte) != pa) {
        unmap_page(pg_dir, va);
    }
    tlb_invalidate();
    *pte = pa | perm;
}


// return the pte's addr of va
u64* walk_pgdir(u64 *pg_dir, u64 va)
{
    assert(aligned((u64)pg_dir, PTABLE_SIZE));

    u64 *pde = (u64 *)&pg_dir[PDX(va)];
    // printf("\t\tpde at 0x%lx  pde value 0x%lx\n", pde, *pde);
    assert((*pde & PTE_4KB) != 0);

    u64 *pme = (u64 *)pa2kva(PTE_ADDR(*pde)) + PMX(va);
    // printf("\t\tpme at 0x%lx  pme value 0x%lx\n", pme, *pme);
    assert((*pme & PTE_4KB) != 0);

    u64 *pte = (u64 *)pa2kva(PTE_ADDR(*pme)) + PTX(va);
    // printf("\t\tpte at 0x%lx  pte value 0x%lx\n", pte, *pte);
    // assert((*pte & PTE_4KB) != 0);
    
    return pte;
}

