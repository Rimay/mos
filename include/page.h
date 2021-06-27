#ifndef _PAGE_H_
#define _PAGE_H_

#include "utils.h"
#include "cap.h"

u64 alloc_page(struct Pcb* p);
u64 alloc_vnode(struct Pcb* p);

void unmap_page(u64 *pgdir, u64 va);
void map_ptable(u64 *pg_dir, u64 va, u64 pa, u64 perm, struct Pcb* p);
u64* walk_pgdir(u64 *pg_dir, u64 va);

// void page_init(u64 freemem);

#endif
