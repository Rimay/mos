#ifndef _CAP_H_
#define _CAP_H_

#include <types.h>
#include <queue.h>
#include <mmu.h>
#include "env.h"
#include <pmap.h>


#define NCAP_OPT 150000

#define CAP_TYPE_UNUSED 0
#define CAP_TYPE_FREE_PAGE 1
#define CAP_TYPE_ENV_ALLOC 2
#define CAP_TYPE_ENV_SET_STATUS 3



#define LOG2NENV	10u
#define NENV		(1u << LOG2NENV)

// #define PTE_READ 0
// #define PTE_WRITE 1
// #define PTE_COW 2
// #define PTE_LIB 3


// rights map
#define RIGHTS_ENV_ALLOC 1
#define RIGHTS_SET_ENV_STATUS 2
#define RIGHTS_GET_ENV_ID 4
#define RIGHTS_YIELD 8
#define RIGHTS_ENV_DESTROY 16
#define RIGHTS_SET_PGFAULT_HANDLER 32
#define RIGHTS_MEM_ALLOC 64
#define RIGHTS_MEM_UNMAP 128


/* cap usage
    0                    max_free_ppn-1                 nenv
    |                          |                          |
    |--------------------------------------------------------------------------------------------------|
    |        page              |            env           |
*/
struct cap_opt {
    u32 cap_id;
    u16 env_id;
    u16 env_id2;
    u32 ppn;
    u64 perm;
    u64 rights;
    LIST_ENTRY(cap_opt) cap_opt_link;
};

LIST_HEAD(cap_opt_list,cap_opt);


// LIST_HEAD(cap_list, cap);
extern struct cap_opt caps_opt[];
extern struct Page pages[];


void cap_init();
u8 cap_set_env_rights(u32 env_id, u64 rights);
int cap_map_free_page(u32 env_id, struct Page* page);
int cap_unmap_free_page(u32 env_id, struct Page* page);

u8 check_env_right(u32 env_id, u64 rights);











#endif





























