#include "cap.h"
#include "queue.h"
#include "pmap.h"

struct cap caps[NCAP];
// static struct cap_list cap_free_list;
extern int page_freemem;



// HOW 内存指定地址开辟一段空间保存数据

void cap_init()
{
    int i;
    for (i = 0; i < NCAP; i++) {
        caps[i].env_id = -1;
        caps[i].addr = NULL;
        caps[i].cap_type = CAP_TYPE_UNUSED;
        caps[i].readable = 1;
        caps[i].writable = 1; 
    }
    // struct cap* fc;
    // int free_cap_num = 0;
    // for (fc = LIST_FIRST(&cap_free_list); fc; fc = LIST_NEXT(fc, cap_link)) {
    //     free_cap_num++;
    // }
    // printf("total free cap is : %d\n", free_cap_num);
}


int cap_map_free_page(u32 env_id, struct Page* page)
{
    u_long ppn = page2ppn(page);
    u64 used_index = page_freemem / BY2PG;
    u64 end_index = PHYSICAL_MEMORY_END / BY2PG;
    if (ppn < used_index || ppn >= end_index) {
        panic("cap_map_unused_page PAGE NOT UNUSED\n");
    }
    struct cap c = caps[ppn];

    c.cap_type = CAP_TYPE_FREE_PAGE;
    c.env_id = env_id;
    c.addr = page;
    
    return 0;
}

int cap_unmap_free_page(struct Page* page)
{
    u64 ppn = page2ppn(page);
    u64 used_index = page_freemem / BY2PG;
    u64 end_index = PHYSICAL_MEMORY_END / BY2PG;
    if (ppn < used_index || ppn >= end_index) {
        panic("cap_map_unused_page PAGE NOT UNUSED\n");
    }
    struct cap c = caps[ppn];
    c.cap_type = CAP_TYPE_UNUSED;
    c.env_id = -1;
    c.addr = 0;
    return 0;
}




