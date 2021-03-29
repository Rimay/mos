#include "cap.h"
#include "queue.h"
#include "pmap.h"


extern int page_freemem;

struct cap_opt caps_opt[NCAP_OPT];
static struct cap_opt_list cap_opt_free_list;

u32 cap_page_start_index;
u32 cap_page_end_index;
u32 max_ppn;


// todo 内存指定地址开辟一段空间保存数据
void cap_init()
{
    int i, j;

    cap_page_start_index = (u32)(page_freemem / BY2PG);
    cap_page_end_index = (u32)(PHYSICAL_MEMORY_END / BY2PG);
    max_ppn = cap_page_end_index - cap_page_start_index;

    LIST_INIT(&cap_opt_free_list);
    for (i = 0; i < NCAP_OPT; i++) {
        caps_opt[i].cap_id = i;
        if (i < max_ppn) {
            caps_opt[i].ppn = i + cap_page_start_index;
            caps_opt[i].rights = 0;
        }
        else if (i < max_ppn + NENV) {
            caps_opt[i].env_id = i - max_ppn;
            caps_opt[i].rights |= RIGHTS_ENV_ALLOC | RIGHTS_SET_ENV_STATUS | RIGHTS_GET_ENV_ID | RIGHTS_YIELD | RIGHTS_ENV_DESTROY | RIGHTS_SET_PGFAULT_HANDLER | RIGHTS_MEM_ALLOC | RIGHTS_MEM_UNMAP;
        }
        // caps_opt[i].env_id2 =  -1;
        // caps_opt[i].perm = 0;
        
        LIST_INSERT_HEAD(&cap_opt_free_list, &caps_opt[i], cap_opt_link);
    }
}


u8 cap_set_env_rights(u32 env_id, u64 rights)
{
    // cal cap_id
    assert(0 <= env_id && env_id < NENV);
    u32 cap_id = env_id + cap_page_start_index;

    // set rights
    struct cap_opt *c = &caps_opt[cap_id];
    c->rights = rights;

    return 0;
}


int cap_map_free_page(u32 env_id, struct Page* page)
{
    // cal ppn 
    u64 ppn = page2ppn(page);
    assert(cap_page_start_index <= ppn && ppn < cap_page_end_index);
    // printf("cap_map_free_page env_id: %d\tppn: %d\toffset: %d\ts: %d\te: %d\n", env_id, ppn, ppn - cap_page_start_index, cap_page_start_index, cap_page_end_index);

    // cal the cap_id
    u32 cap_id = ppn - cap_page_start_index;

    // set env_id 
    struct cap_opt *c = &caps_opt[cap_id];
    c->env_id = (u16)env_id;
    
    return 0;
}


int cap_unmap_free_page(u32 env_id, struct Page* page)
{
    // cal ppn 
    u64 ppn = page2ppn(page);
    assert(cap_page_start_index <= ppn && ppn < cap_page_end_index);

    // cal cap_id
    u32 cap_id = ppn - cap_page_start_index;

    // reset env_id
    struct cap_opt *c = &caps_opt[cap_id];
    c->env_id = -1;
    
    return 0;
}



u8 check_env_right(u32 env_id, u64 rights)
{
    // cal cap_id
    assert(0 <= env_id && env_id < NENV);
    u32 cap_id = env_id + cap_page_start_index;

    // get env_id's rights
    struct cap_opt *c = &caps_opt[cap_id];
    u64 r = c->rights;
    
    // judge if the rights are ok
    u64 t = (r & rights);
    // printf("env_id: %d\tcap_id: %d\tr: %d\tt: %d\trights: %d\n", env_id, cap_id, r, t, rights);
    assert(t == rights);

    return 0;
}





