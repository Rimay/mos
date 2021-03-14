#ifndef _CAP_H_
#define _CAP_H_

#include <types.h>
#include <queue.h>
#include <mmu.h>
#include "env.h"
#include "pmap.h"

#define CAP_TYPE_UNUSED 0
#define CAP_TYPE_FREE_PAGE 1


struct cap {
    LIST_ENTRY(cap) cap_link;       // Free list
    u32 env_id;
    void *addr;
    u32 cap_type;   
    u32 readable;
    u32 writable;
};


#define NCAP 130000

LIST_HEAD(cap_list, cap);
extern struct cap caps[];
extern struct Page pages[];


void cap_init();
int cap_map_free_page(u32 env_id, struct Page* page);
int cap_unmap_free_page(struct Page* page);

#endif


