#include "mmu.h"
#include "utils.h"
#include "cap.h"
#include "printf.h"
#include "page.h"

u64 alloc_page(struct cte *pagecn, u64 *slot_cnt, u64 type)
{
    assert(pagecn->cap.type == ObjType_L2cnode);
    u64 base = pagecn->cap.u.l2cnode.base;
    u64 bytes = pagecn->cap.u.l2cnode.bytes;
    // printf("\t\tbase %lx  bytes %lx\n", base, bytes);

    assert((*slot_cnt + 1) * CTE_SIZE < bytes);
    assert(type == ObjType_VNode_l0 || type == ObjType_VNode_l1 || type == ObjType_VNode_l2 || type == ObjType_Page);

    enum objtype obj_type = (enum objtype) type;
    struct cte *dest_cte = caps_locate_slot(base, (*slot_cnt)++);
    u64 addr = alloc_phys_aligned(objsize(obj_type), BASE_PAGE_SIZE);
    caps_create_new(obj_type, addr, 0, objsize(obj_type), 1, 0, dest_cte);
    return addr;
}

/* 
 * remove a dirty page in pte
 */
void unmap_page(u64 *pgdir, u64 va)
{
    u64 *pte = walk_pgdir(pgdir, va);
    *pte = 0;
}

/*
 * slot_cnt will be validatd, thus it's a pointer
 *      pagecn: l2cnode
 */
void map_ptable(u64 *pg_dir, u64 va, u64 pa, u64 perm, struct cte *pagecn, u64 *slot_cnt)
{
    assert(aligned((u64)pg_dir, PTABLE_SIZE));
    assert(aligned(pa, PTABLE_SIZE));
    
    perm = perm | PTE_NORMAL | PTE_INNER_SHARE | PTE_AF | PTE_4KB;

    u64 *pde = (u64 *)&pg_dir[PDX(va)];
    // printf("\t\tpde at 0x%lx  pde value 0x%lx\n", pde, *pde);
    if ((*pde & PTE_4KB) == 0) {
        // map the missed l1 table page
        u64 tmp_addr = alloc_page(pagecn, slot_cnt, ObjType_VNode_l1);
        *pde = tmp_addr | PTE_4KB;
        map_ptable(pg_dir, UVPM + (PDX(va) << PGSHIFT), tmp_addr, PTE_USER | PTE_RO, pagecn, slot_cnt);
    }

    u64 *pme = (u64 *)pa2kva(PTE_ADDR(*pde)) + PMX(va);
    // printf("\t\tpme at 0x%lx  pme value 0x%lx\n", pme, *pme);
    if ((*pme & PTE_4KB) == 0) {
        // map the missed l2 table page
        u64 tmp_addr = alloc_page(pagecn, slot_cnt, ObjType_VNode_l2);
        *pme = tmp_addr | PTE_4KB;
        map_ptable(pg_dir, UVPT + (PDX(va) << PMSHIFT) + (PMX(va) << PGSHIFT), tmp_addr, PTE_USER | PTE_RO, pagecn, slot_cnt);
    }

    u64 *pte = (u64 *)pa2kva(PTE_ADDR(*pme)) + PTX(va);
    // printf("\t\tpte at 0x%lx  pte value 0x%lx\n", pte, *pte);

    if ((*pte & PTE_4KB) != 0 && PTE_ADDR(*pte) != pa) {
        unmap_page(pg_dir, va);
    }
    tlb_invalidate();
    *pte = pa | perm;
}

/*
 * return the pte's addr of va
 */
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

