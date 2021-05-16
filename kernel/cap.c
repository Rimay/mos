#include "utils.h"
#include "error.h"
#include "printf.h"
#include "cap.h"
#include "utils.h"
#include "mmu.h"


struct bootinfo *bi;

// extern struct Pcb *init_pcb;
// extern u32 pagecn_slot_cnt;
extern u64 phy_alloc_addr;
 

static errval_t dcopy_cap(struct capability *dest, struct capability *src)
{
    assert(src  != NULL);
    assert(dest != NULL);
    assert(dest->type == ObjType_Null);

    memcpy(dest, src, sizeof(struct capability));
    return SYS_ERR_OK;
}


/*
 * lookup a capability given a cnode capability
*/
errval_t cnode_lookup_cap(struct capability *rootcn, u64 cptr,
                         u64 level, struct capability **ret_cap, u8 rights)
{
    struct cte *ret_cte = NULL;

    u64 l1index, l2index;
    l1index = (cptr >> L2CNODE_BITS) & MASK(CPTR_BITS-L2CNODE_BITS);
    l2index = cptr & MASK(L2CNODE_BITS);

    assert(ret_cte != NULL);
    assert(rootcn != NULL);
    assert(level <= 2);

    // level == 0 means that we do not do any resolution and just return the cte for rootcn.
    if (level == 0) {
        *ret_cap = rootcn;
        return SYS_ERR_OK;
    }
    
    assert(rootcn->type == ObjType_L1cnode);
    /*
     * todo: cnode_get_slots 
     */
    // assert(l1index < cnode_get_slots(rootcn));
    assert((rootcn->rights & rights) == rights);
    
    // level == 1 means that we terminate after looking up the slot in the L1 cnode.
    struct cte *l2cnode = caps_locate_slot(rootcn->u.l1cnode.base, l1index);
    if (level == 1) {
        assert(l2cnode->cap.type != ObjType_Null);
        *ret_cap = &(l2cnode->cap);
        return SYS_ERR_OK;
    }

    assert(l2cnode->cap.type == ObjType_L2cnode);
    assert(l2index < L2CNODE_BITS);
    assert((l2cnode->cap.rights & rights) == rights);

    struct cte *cte = caps_locate_slot(l2cnode->cap.u.l2cnode.base, l2index);
    assert(cte->cap.type != ObjType_Null);
    *ret_cap = &(cte->cap);

    return SYS_ERR_OK;
}


/* 
 * obj_size is 0 for non-sized utils (e.g. VNodes) 
*/
errval_t caps_create_new(enum objtype type, u64 addr, u64 bytes,
                u64 obj_size, u64 obj_num, u8 core_id, struct cte *dest_caps)
{
    assert(type != ObjType_Null);
    assert(dest_caps != NULL);
    assert(type < ObjType_Num);

    struct capability temp_cap;
    memzero(&temp_cap, sizeof(struct capability));
    temp_cap.type = type;
    temp_cap.rights = CAPRIGHTS_ALLRIGHTS;

    errval_t err = SYS_ERR_OK;
    u64 i = 0;

    switch (type)
    {
    case ObjType_Phymem:
    {
        for (i = 0; i < obj_num; i++) {
            temp_cap.u.phymem.base = addr + i * obj_size;
            temp_cap.u.phymem.bytes = bytes;
            err = dcopy_cap(&dest_caps[i].cap, &temp_cap);
            if (err_is_fail(err)) {
                break;
            }
        }
        break;
    }
    case ObjType_L1cnode:
    {
        assert(obj_size == objsize(ObjType_L1cnode));
        for (i = 0; i < obj_num; i++) {
            temp_cap.u.l1cnode.base = addr + i * obj_size;
            temp_cap.u.l1cnode.bytes = bytes;
            temp_cap.u.l1cnode.rightsmask = CAPRIGHTS_ALLRIGHTS;
            err = dcopy_cap(&dest_caps[i].cap, &temp_cap);
            if (err_is_fail(err)) {
                break;
            }
        }
        break;
    }
    case ObjType_L2cnode:
    {
        assert(obj_size == objsize(ObjType_L2cnode));
        for (i = 0; i < obj_num; i++) {
            temp_cap.u.l1cnode.base = addr + i * obj_size;
            temp_cap.u.l1cnode.bytes = bytes;
            temp_cap.u.l1cnode.rightsmask = CAPRIGHTS_ALLRIGHTS;
            err = dcopy_cap(&dest_caps[i].cap, &temp_cap);
            if (err_is_fail(err)) {
                break;
            }
        }
        break;
    }
    case ObjType_Page:
    {
        assert(obj_size == objsize(ObjType_Page));
        for(i = 0; i < obj_num; i++) {
            temp_cap.u.page.base = addr + i * obj_size;
            temp_cap.u.page.bytes = obj_size;
            err = dcopy_cap(&dest_caps[i].cap, &temp_cap);
            if (err_is_fail(err)) {
                break;
            }
        }
        break;
    }
    /*
     * todo:
     * add bytes attribute to vnode_l0/1/2
     */
    case ObjType_VNode_l0:
    {
        assert(obj_size == objsize(ObjType_VNode_l0));
        for(i = 0; i < obj_num; i++) {
            temp_cap.u.vnode_l0.base = addr + i * obj_size;
            errval_t err = dcopy_cap(&dest_caps[i].cap, &temp_cap);
            if (err_is_fail(err)) {
                break;
            }
        }

        break;
    }
    case ObjType_VNode_l1:
    {
        assert(obj_size == objsize(ObjType_VNode_l1));
        for(i = 0; i < obj_num; i++) {
            temp_cap.u.vnode_l1.base = addr + i * obj_size;
            errval_t err = dcopy_cap(&dest_caps[i].cap, &temp_cap);
            if (err_is_fail(err)) {
                break;
            }
        }
        break;
    }
    case ObjType_VNode_l2:
    {
        assert(obj_size == objsize(ObjType_VNode_l2));
        for(i = 0; i < obj_num; i++) {
            temp_cap.u.vnode_l2.base = addr + i * obj_size;
            errval_t err = dcopy_cap(&dest_caps[i].cap, &temp_cap);
            if (err_is_fail(err)) {
                break;
            }
        }

        break;
    }
    case ObjType_Dispatcher:
    {
        assert(obj_size == objsize(ObjType_Dispatcher));
        for(i = 0; i < obj_num; i++) {
            temp_cap.u.dispatcher.e = (struct Pcb *) (addr + i * obj_size);
            err = dcopy_cap(&dest_caps[i].cap, &temp_cap);
            if (err_is_fail(err)) {
                break;
            }
        }
        break;
    }
    default:
        break;
    }

    // Revert the partially initialized caps to zero
    if (err_is_fail(err)) {
        for (size_t j = 0; j < i; j++) {
            memzero(&dest_caps[j], sizeof(dest_caps[j]));
        }
        return err;
    }
    else {
        // Set the owner for all the new caps
        // for (size_t j = 0; j < i; j++) {
        //     dest_caps[j].mdbnode.owner = owner;
        // }
        return SYS_ERR_OK;
    }
}


void cap_init_1(u64 freemem)
{
    // phy_alloc_addr set to freemem
    phy_alloc_addr = freemem;

    // alloc 4KB for bootinfo
    u64 addr = alloc_phys_aligned(BOOT_INFO_SIZE, BASE_PAGE_SIZE);
    bi = (struct bootinfo *)pa2kva(addr);
}

void cap_init_2()
{
    // ccf free_mem in bootinfo, range is [phy_alloc_addr, PHYS_MEMORY_END]
    caps_create_new(ObjType_Phymem, phy_alloc_addr, PHYS_MEMORY_END - phy_alloc_addr, \
                     objsize(ObjType_Phymem), 1, 0, &(bi->free_mem));
}