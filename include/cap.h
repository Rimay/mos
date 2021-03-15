#ifndef _CAP_H_
#define _CAP_H_

#include <types.h>
#include <queue.h>
#include <mmu.h>
#include "env.h"
#include <pmap.h>

#define NCAP 150000

#define CAP_TYPE_UNUSED 0
#define CAP_TYPE_FREE_PAGE 1



// #ifndef NENV
// #include <env.h>
// #endif
#define LOG2NENV	10u
#define NENV		(1u << LOG2NENV)
#define CAP_ENVIDS_LEN (NENV >> 5)

#define PTE_READ 0
#define PTE_WRITE 1
#define PTE_COW 2
#define PTE_LIB 3

struct cap {
    // u64 env_ids[CAP_ENVIDS_LEN];
    u8 env_ids[NENV];
    void *addr;
    u32 cap_type;   
    u32 rights;
};


// LIST_HEAD(cap_list, cap);
extern struct cap caps[];
extern struct Page pages[];

void _cap_env_id_switch(u32 cap_id, u32 env_id, u8 on);

void cap_init();
int cap_map_free_page(u32 env_id, struct Page* page);
int cap_unmap_free_page(u32 env_id, struct Page* page);

u8 check_page_pte_perm(u32 env_id, struct Page *page, u8 ro, u8 cow, u8 pte_lib);
u8 check_page_alloc_perm(u32 env_id);
u8 check_page_remove_perm(u32 env_id, struct Page *page);

#endif


