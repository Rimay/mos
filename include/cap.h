#ifndef _CAP_H_
#define _CAP_H_

#include "utils.h"
#include "pcb.h"
#include "kernel_objects.h"
#include "mmu.h"
#include "printf.h"


#define OBJBITS_CTE             6
#define CTE_SIZE                (1UL << OBJBITS_CTE)

#define CPTR_BITS               64

/*      cap rights      */
#define CAPRIGHTS_READ          (1 << 0)
#define CAPRIGHTS_WRITE         (1 << 1)
#define CAPRIGHTS_EXECUTE       (1 << 2)
#define CAPRIGHTS_GRANT         (1 << 3)
#define CAPRIGHTS_IDENTIFY      (1 << 4)
#define CAPRIGHTS_NUM           5

#define CAPRIGHTS_ALLRIGHTS     ((1 << CAPRIGHTS_NUM) - 1)
#define CAPRIGHTS_READ_WRITE    (CAPRIGHTS_READ | CAPRIGHTS_WRITE)
#define CAPRIGHTS_NORIGHTS      0



/*
 * ---------------------------------------------------------------------
 *                           cap commands
 * ---------------------------------------------------------------------
*/
enum cnode_cmd {
    CNodeCmd_Copy,      ///< Copy capability
    CNodeCmd_Mint,      ///< Mint capability
    CNodeCmd_Delete,    ///< Delete capability
    CNodeCmd_Revoke,    ///< Revoke capability
    CNodeCmd_Create,    ///< Create capability
    CNodeCmd_GetState,  ///< Get distcap state for capability
    CNodeCmd_GetSize,   ///< Get Size of CNode, only applicable for L1 Cnode
    CNodeCmd_Resize,    ///< Resize CNode, only applicable for L1 Cnode
    CNodeCmd_CapIdentify ///< Identify capability
};

enum vnode_cmd {
    VNodeCmd_Map,
    VNodeCmd_Unmap,
    VNodeCmd_ModifyFlags,
    VNodeCmd_CleanDirtyBits, ///< Cleans all dirty bit in the table
    VNodeCmd_CopyRemap,      ///< Copy and remap page table for copy-on-write
    VNodeCmd_Inherit,        ///< Clone page table
};

enum mapping_cmd {
    MappingCmd_Modify,
    MappingCmd_Destroy,
};

enum dispatcher_cmd {
    DispatcherCmd_Setup,            ///< Set dispatcher parameters
    DispatcherCmd_Properties,       ///< Set dispatcher properties
};

enum id_cmd {
    IDCmd_Identify  ///< Return system-wide unique ID
};


/*
 * ---------------------------------------------------------------------
 *                           cap definition
 * ---------------------------------------------------------------------
*/
enum __attribute__((__packed__)) objtype
{
    ObjType_Null = 0,
    ObjType_L1cnode = 1,
    ObjType_Page = 2,
    ObjType_VNode_l0 = 3,
    ObjType_VNode_l1 = 4,
    ObjType_VNode_l2 = 5,
    ObjType_Frame_Mapping = 6, 
    ObjType_VNode_l0_Mapping = 7,
    ObjType_VNode_l1_Mapping = 8,
    ObjType_VNode_l2_Mapping = 9,
    ObjType_Dispatcher = 10,
    ObjType_ID = 11,
    ObjType_L2cnode = 12,
    ObjType_Phymem = 13,
    ObjType_Num = 20
};

union capability_u {
    struct Null null;
    struct Phymem phymem;
    struct L1cnode l1cnode;
    struct L2cnode l2cnode;
    struct Page page;
    struct VNode_l0 vnode_l0;
    struct VNode_l0_Mapping vnode_l0_mapping;
    struct VNode_l1 vnode_l1;
    struct VNode_l1_Mapping vnode_l1_mapping;
    struct VNode_l2 vnode_l2;
    struct VNode_l2_Mapping vnode_l2_mapping;
    struct Dispatcher dispatcher;

};

struct capability
{
    union  capability_u u;
    enum objtype type;
    u8 rights;
};

struct cte
{
    struct capability cap;
    char padding[CTE_SIZE - ROUND_UP(sizeof(struct capability), 8)];
};


/*
 * ---------------------------------------------------------------------
 *                           bootinfo structs
 * ---------------------------------------------------------------------
*/
#define BOOT_INFO_SIZE              4096

/* root cnode slot position */
#define ROOTCN_SLOT_PAGECN          1   ///< Pagecn slot in root cnode
#define ROOTCN_SLOT_TASKCN          2   ///< Taskcn slot in root cnode

#define L1CNODE_SLOTNUM             16

#define L2CNODE_BITS                10
#define L2CNODE_SLOTNUM             1024

#define INIT

struct bootinfo {
    /// Init's cnodes
    struct cte init_pcb_cte;    // the cte for the init pcb
    struct cte free_mem;        // the cte that manage the free memory
    char padding[BOOT_INFO_SIZE - ROUND_UP(sizeof(struct cte), 8)];
};


/*
 * ---------------------------------------------------------------------
 *                           cap methods
 * ---------------------------------------------------------------------
*/
static inline u64 objsize(enum objtype type)
{
    if (type == ObjType_VNode_l0 ||
        type == ObjType_VNode_l1 ||
        type == ObjType_VNode_l2 ||
        type == ObjType_Page) {
        return 4096; // BASE_PAGE_SIZE
    }
    else if (type == ObjType_Dispatcher) {
        return 2048;
    }
    else if (type == ObjType_L1cnode) {
        return L1CNODE_SLOTNUM * CTE_SIZE;
    }
    else if (type == ObjType_L2cnode) {
        return L2CNODE_SLOTNUM * CTE_SIZE;
    }
    else if (type == ObjType_Null || 
             type == ObjType_Num ||
             type == ObjType_Phymem
             ) {
        return 0;
    }
    // todo: ObjType_VNode_l0/1/2_Mapping
    assert(0 && !"Page table size unknown.");
    return 0;
}

extern u64 pa2kva(u64 addr);

// base is pa
static inline struct cte *caps_locate_slot(u64 base, u32 offset)
{
    return (struct cte *)pa2kva(base + CTE_SIZE * offset);
}


static inline struct cte *cap_to_cte(struct capability *cap)
{
    return (struct cte *) ((char *)cap - offsetof(struct cte, cap));
}


errval_t caps_create_new(enum objtype type, u64 addr, u64 bytes,
                u64 obj_size, u64 obj_num, u8 core_id, struct cte *dest_caps);
errval_t cnode_lookup_cap(struct capability *rootcn, u64 cptr,
                u64 level, struct capability **ret_cap, u8 rights);
void cap_init_1(u64 freemem);
void cap_init_2();

#endif