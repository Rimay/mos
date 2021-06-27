#include "utils.h"
#include "error.h"
#include "printf.h"
#include "cap.h"
#include "utils.h"
#include "mmu.h"
#include "pcb.h"
#include "dprintf.h"

struct bootinfo *bi;
extern u64 phy_alloc_addr;


static errval_t dcopy_cap(struct capability *dest, struct capability *src)
{
    assert(src  != NULL);
    assert(dest != NULL);
    // assert(dest->type == ObjType_Null);

    memcpy(dest, src, sizeof(struct capability));
    return SYS_ERR_OK;
}


// lookup a capability given a cnode capability
errval_t cnode_lookup_cap(struct capability *rootcn, u64 l1index, u64 l2index, u64 level, 
                        struct capability **ret_cap, u8 rights)
{
    assert(rootcn != NULL && rootcn->type == ObjType_L1cnode);
    assert(l1index < L1CNODE_SLOTNUM);
    assert(l2index < L2CNODE_SLOTNUM);
    assert(level <= 2);
    assert((rootcn->rights & rights) == rights);

    // level == 0 means we do not do any resolution and just return the cte for rootcn.
    if (level == 0) {
        *ret_cap = rootcn;
        return SYS_ERR_OK;
    }
    
    // level == 1 means we terminate after looking up the slot in the L1 cnode.
    struct cte *l2cnode = caps_locate_slot(rootcn->u.l1cnode.base, l1index);
    if (level == 1) {
        assert(l2cnode->cap.type != ObjType_Null);
        *ret_cap = &(l2cnode->cap);
        return SYS_ERR_OK;
    }

    assert(l2cnode->cap.type == ObjType_L2cnode);
    assert((l2cnode->cap.rights & rights) == rights);

    struct cte *cte = caps_locate_slot(l2cnode->cap.u.l2cnode.base, l2index);
    assert(cte->cap.type != ObjType_Null);

    *ret_cap = &(cte->cap);
    return SYS_ERR_OK;
}


struct cte* caps_create_new(enum objtype type, u64 addr, struct cte *dest_caps)
{
    assert(type != ObjType_Null && type < ObjType_Num);
    assert(dest_caps != NULL);

    struct capability temp_cap;
    memzero(&temp_cap, sizeof(struct capability));
    temp_cap.type = type;
    temp_cap.rights = CAPRIGHTS_ALLRIGHTS;

    errval_t err = SYS_ERR_OK;
    u64 obj_size = objsize(type);
    struct cte *ret = NULL;

    switch (type) {
    // return dest_caps
    // it's managed by bootinfo
    case ObjType_Phymem:
    {
        temp_cap.u.phymem.base = addr;
        temp_cap.u.phymem.bytes = PHYS_MEMORY_END - addr;
        err = dcopy_cap(&dest_caps->cap, &temp_cap);
        assert(!err_is_fail(err));
        ret = dest_caps;
        break;
    }
    // return dest_caps
    case ObjType_L1cnode:
    {
        temp_cap.u.l1cnode.base = addr;
        temp_cap.u.l1cnode.bytes = obj_size;
        temp_cap.u.l1cnode.cnt = 0;
        err = dcopy_cap(&dest_caps->cap, &temp_cap);
        assert(!err_is_fail(err));
        ret = dest_caps;
        break;
    }
    // return dest_caps
    case ObjType_L2cnode:
    {
        temp_cap.u.l2cnode.base = addr;
        temp_cap.u.l2cnode.bytes = obj_size;
        temp_cap.u.l2cnode.cnt = 0;
        err = dcopy_cap(&dest_caps->cap, &temp_cap);
        assert(!err_is_fail(err));
        ret = dest_caps;
        break;
    }
    // dest_caps: l2cnode (pagecn / stackcn / ... )
    // return: dest page cte
    // TODO:    
    //      one way alloc, cannot reuse free slot
    case ObjType_Page:
    {
        u64 base = dest_caps->cap.u.l2cnode.base;
        u64 cnt = dest_caps->cap.u.l2cnode.cnt;
        assert(cnt < L2CNODE_SLOTNUM);

        struct cte* dest_cte = caps_locate_slot(base, cnt);
        temp_cap.u.page.base = addr;
        temp_cap.u.page.bytes = obj_size;
        err = dcopy_cap(&dest_cte->cap, &temp_cap);
        assert(!err_is_fail(err));
        
        dest_caps->cap.u.l2cnode.cnt++;
        ret = dest_cte;
        break;
    }
    // dest_caps: l2cnode (vnodecn)
    // return: dest vnode cte
    // TODO:    
    //      one way alloc, cannot reuse free slot
    case ObjType_VNode:
    {
        u64 base = dest_caps->cap.u.l2cnode.base;
        u64 cnt = dest_caps->cap.u.l2cnode.cnt;
        assert(cnt < L2CNODE_SLOTNUM);

        struct cte* dest_cte = caps_locate_slot(base, cnt);
        temp_cap.u.vnode.base = addr;
        errval_t err = dcopy_cap(&dest_cte->cap, &temp_cap);
        assert(!err_is_fail(err));

        dest_caps->cap.u.l2cnode.cnt++;
        ret = dest_cte;
        break;
    }
    // dest_caps: l2cnode (pcbcn)
    // return: dest pcb cte
    // TODO:    
    //      one way alloc, cannot reuse free slot
    case ObjType_Dispatcher:
    {
        u64 base = dest_caps->cap.u.l2cnode.base;
        u64 cnt = dest_caps->cap.u.l2cnode.cnt;
        assert(cnt < L2CNODE_SLOTNUM);

        struct cte* dest_cte = caps_locate_slot(base, cnt);
        temp_cap.u.dispatcher.e = (struct Pcb *)addr;
        errval_t err = dcopy_cap(&dest_cte->cap, &temp_cap);
        assert(!err_is_fail(err));

        dest_caps->cap.u.l2cnode.cnt++;
        ret = dest_cte;
        break;

    }
    // dest_caps: l2cnode (epcn)
    // return: dest ep cte
    // TODO:    
    //      one way alloc, cannot reuse free slot
    case ObjType_Endpoint:
    {
        u64 base = dest_caps->cap.u.l2cnode.base;
        u64 cnt = dest_caps->cap.u.l2cnode.cnt;
        assert(cnt < L2CNODE_SLOTNUM);

        struct cte* dest_cte = caps_locate_slot(base, cnt);
        temp_cap.u.endpoint.head = 0;
        temp_cap.u.endpoint.tail = 0;
        temp_cap.u.endpoint.len = 0;
        temp_cap.u.endpoint.state = EP_State_Idle;
        err = dcopy_cap(&dest_cte->cap, &temp_cap);
        assert(!err_is_fail(err));

        dest_caps->cap.u.l2cnode.cnt++;
        ret = dest_cte;
        break;
    }
    default:
        break;
    }

    return ret;
}

// return: the created cte 
struct cte* create_cap(enum objtype type, struct cte *dest_cte, u64 is_l1cnode)
{
    // dprintf("dest cte0: 0x%lx\n", (u64)dest_cte);
    u64 addr = alloc_phys_aligned(objsize(type), BASE_PAGE_SIZE);
    if (is_l1cnode) {
        dest_cte = (struct cte *)pa2kva(addr);
    }
    // dprintf("dest cte1: 0x%lx\n", (u64)dest_cte);
    struct cte* ret = caps_create_new(type, addr, dest_cte);
    // dprintf("type: %d\n", ret->cap.type);
    return ret;
}


void cap_init_1(u64 freemem)
{
    // phy_alloc_addr set to freemem
    phy_alloc_addr = freemem;

    // alloc 4KB for bootinfo
    u64 addr = alloc_phys_aligned(BOOT_INFO_SIZE, BASE_PAGE_SIZE);
    bi = (struct bootinfo *)pa2kva(addr);
    dprintf("BOOTINFO addr: 0x%lx\n", bi);
}


void cap_init_2()
{
    // ccf free_mem in bootinfo, range is [phy_alloc_addr, PHYS_MEMORY_END]
    struct cte* c = caps_create_new(ObjType_Phymem, phy_alloc_addr, &(bi->free_mem));

    assert(c->cap.type == ObjType_Phymem && c->cap.u.phymem.base == phy_alloc_addr);
}


