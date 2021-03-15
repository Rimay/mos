#include "cap.h"
#include "queue.h"
#include "pmap.h"

struct cap caps[NCAP];
// static struct cap_list cap_free_list;
extern int page_freemem;

u32 cap_page_start_index;
u32 cap_page_end_index;


// todo 内存指定地址开辟一段空间保存数据
void cap_init()
{
    int i, j;

    for (i = 0; i < NCAP; i++) {
        // for (j = 0; j < CAP_ENVIDS_LEN; j++) {
        //     caps[i].env_ids[j] = 0;
        // }
        for (j = 0; j < NENV; j++) {
            _cap_env_id_switch(i, j, 0);
        }
        caps[i].addr = NULL;
        caps[i].cap_type = CAP_TYPE_UNUSED;
        caps[i].rights = (1u << PTE_WRITE);
    }
    cap_page_start_index = (u32)(page_freemem / BY2PG);
    cap_page_end_index = (u32)(PHYSICAL_MEMORY_END / BY2PG);
}

void _cap_env_id_switch(u32 cap_id, u32 env_id, u8 on)
{
    assert(cap_id < NCAP);
    assert(env_id < NENV);
    caps[cap_id].env_ids[env_id] = on;
    
    // u8 i = env_id / 64, j = env_id % 64;
    // assert(i < CAP_ENVIDS_LEN);

    // struct cap *c = &caps[cap_id];
    // if (on & 1) {
    //     c->env_ids[i] |= (1u << j);
    // }
    // else {
    //     c->env_ids[i] &= (0u << j);
    // }
    // printf("i %d  j %d  c->env_ids[i] %d\n", i, j, c->env_ids[i]);
}

int cap_map_free_page(u32 env_id, struct Page* page)
{
    u64 ppn = page2ppn(page);
    assert(cap_page_start_index <= ppn);
    assert(ppn < cap_page_end_index);
    assert(ppn - cap_page_start_index < NCAP);

    // printf("cap_map_free_page env_id: %d\tppn: %d\toffset: %d\ts: %d\te: %d\n", env_id, ppn, ppn - cap_page_start_index, cap_page_start_index, cap_page_end_index);

    u32 cap_id = ppn - cap_page_start_index;
    struct cap *c = &caps[cap_id];
    _cap_env_id_switch(cap_id, env_id, 1);
    c->cap_type = CAP_TYPE_FREE_PAGE;
    c->addr = page;
    return 0;
}

int cap_unmap_free_page(u32 env_id, struct Page* page)
{
    u64 ppn = page2ppn(page);
    assert(cap_page_start_index <= ppn);
    assert(ppn < cap_page_end_index);
    assert(ppn - cap_page_start_index < NCAP);

    u32 cap_id = ppn - cap_page_start_index;
    struct cap *c = &caps[cap_id];
    _cap_env_id_switch(cap_id, env_id, 0);
    c->cap_type = CAP_TYPE_UNUSED;
    c->addr = 0;
    return 0;
}

u8 check_page_pte_perm(u32 env_id, struct Page *page, u8 ro, u8 cow, u8 pte_lib)
{   
    u64 ppn = page2ppn(page);
    assert(cap_page_start_index <= ppn);
    assert(ppn < cap_page_end_index);
    assert(ppn - cap_page_start_index < NCAP);
    
    assert(env_id < NENV);

    u32 cap_id = ppn - cap_page_start_index;
    struct cap *c = &caps[cap_id];
    return 0;
}

u8 check_page_alloc_perm(u32 env_id)
{
    return 0;
}

u8 check_page_remove_perm(u32 env_id, struct Page *page)
{
    return 0;
}





