#ifndef __GIC_H__
#define __GIC_H__
#include "types.h"

#define GICD_BASE_KERN (0x8000000ul | 0xFFFFFF8000000000ul)
#define GICC_BASE_KERN (0x8010000ul | 0xFFFFFF8000000000ul)

/* Register offsets for the ARM generic interrupt controller (GIC) */
#define BIT_MASK(OFF, LEN) (((1UL << (OFF + LEN)) - 1) & ~((1UL << (OFF)) - 1))

#define GIC_DIST_OFFSET 0x1000
#define GIC_CPU_OFFSET_A9 0x0100
#define GIC_CPU_OFFSET_A15 0x2000

#define EL1_PHY_TIMER_INT 30
#define EL1_VIRT_TIMER_INT 27
#define NONSEC_EL2_PHY_TIMER_INT 26
#define NONSEC_EL2_VIRT_TIMER_INT 28

/* Distributor Registers */
#define GICD_CTLR_EN_BIT (0x1)

#define GICD_TYPER_ITLN_OFF 0
#define GICD_TYPER_ITLN_LEN 5
#define GICD_TYPER_ITLN_MSK BIT_MASK(GICD_TYPER_ITLN_OFF, GICD_TYPER_ITLN_LEN)
#define GICD_TYPER_CPUN_OFF 5
#define GICD_TYPER_CPUN_LEN 3
#define GICD_TYPER_CPUN_MSK BIT_MASK(GICD_TYPER_CPUN_OFF, GICD_TYPER_CPUN_LEN)

#define GIC_MAX_INTERUPTS 1024
#define GIC_MAX_SGIS 16
#define GIC_MAX_PPIS 16
#define GIC_CPU_PRIV (GIC_MAX_SGIS + GIC_MAX_PPIS)
#define GIC_MAX_SPIS (GIC_MAX_INTERUPTS - GIC_CPU_PRIV)
#define GIC_PRIO_BITS 8
#define GIC_TARGET_BITS 8
#define GIC_MAX_TARGETS GIC_TARGET_BITS
#define GIC_CONFIG_BITS 2
#define GIC_SEC_BITS 2
#define GIC_SGI_BITS 8

#define GIC_INT_REG(NINT) (NINT / (sizeof(unsigned int) * 8))
#define GIC_INT_MASK(NINT) (1U << NINT % (sizeof(unsigned int) * 8))
#define GIC_NUM_INT_REGS(NINT) GIC_INT_REG(NINT)
#define GIC_NUM_PRIVINT_REGS (GIC_CPU_PRIV / (sizeof(unsigned int) * 8))

#define GIC_PRIO_REG(NINT) ((NINT * GIC_PRIO_BITS) / (sizeof(unsigned int) * 8))
#define GIC_NUM_PRIO_REGS(NINT) GIC_PRIO_REG(NINT)
#define GIC_PRIO_OFF(NINT) (NINT * GIC_PRIO_BITS) % (sizeof(unsigned int) * 8)

#define GIC_TARGET_REG(NINT) ((NINT * GIC_TARGET_BITS) / (sizeof(unsigned int) * 8))
#define GIC_NUM_TARGET_REGS(NINT) GIC_TARGET_REG(NINT)
#define GIC_TARGET_OFF(NINT) (NINT * GIC_TARGET_BITS) % (sizeof(unsigned int) * 8)

#define GIC_CONFIG_REG(NINT) ((NINT * GIC_CONFIG_BITS) / (sizeof(unsigned int) * 8))
#define GIC_NUM_CONFIG_REGS(NINT) GIC_CONFIG_REG(NINT)
#define GIC_CONFIG_OFF(NINT) (NINT * GIC_CONFIG_BITS) % (sizeof(unsigned int) * 8)

#define GIC_NUM_SEC_REGS(NINT) ((NINT * GIC_SEC_BITS) / (sizeof(unsigned int) * 8))

#define GIC_NUM_SGI_REGS \
    ((GIC_MAX_SGIS * GIC_SGI_BITS) / (sizeof(unsigned int) * 8))
#define GICD_SGI_REG(NINT) (NINT / 4)
#define GICD_SGI_OFF(NINT) ((NINT % 4) * 8)

#define GIC_NUM_APR_REGS ((1UL << (GIC_PRIO_BITS - 1)) / (sizeof(unsigned int) * 8))
#define GIC_NUM_LIST_REGS (64)
typedef struct
{
    /* Enables interrupts and affinity routing.*/
    unsigned int CTLR;
    /* Provides information about what features the GIC implementation supports.
    It indicates:
    - Whether the GIC implementation supports two Security states.
    - The maximum number of INTIDs that the GIC implementation supports.
    - The number of PEs that can be used as interrupt targets.*/
    unsigned int TYPER;
    /* Provides information about the implementer and revision of the
     * Distributor.*/
    unsigned int IIDR;
    unsigned char pad0[0x0080 - 0x000C];
    /* banked CPU */
    unsigned int IGROUPR[GIC_NUM_INT_REGS(GIC_MAX_INTERUPTS)];
    /* Enables forwarding of the corresponding interrupt to the CPU
     * interfaces.*/
    unsigned int ISENABLER[GIC_NUM_INT_REGS(GIC_MAX_INTERUPTS)];
    /* Disables forwarding of the corresponding interrupt to the CPU
     * interfaces.*/
    unsigned int ICENABLER[GIC_NUM_INT_REGS(GIC_MAX_INTERUPTS)];
    /* Adds the pending state to the corresponding interrupt.*/
    unsigned int ISPENDR[GIC_NUM_INT_REGS(GIC_MAX_INTERUPTS)];
    /* Removes the pending state from the corresponding interrupt.
    Next two registers are used when saving and restoring GIC state.*/
    unsigned int ICPENDR[GIC_NUM_INT_REGS(GIC_MAX_INTERUPTS)];
    /* Activates the corresponding interrupt. */
    unsigned int ISACTIVER[GIC_NUM_INT_REGS(GIC_MAX_INTERUPTS)];
    /* Deactivates the corresponding interrupt*/
    unsigned int ICACTIVER[GIC_NUM_INT_REGS(GIC_MAX_INTERUPTS)];
    /* Holds the priority of the corresponding interrupt.*/
    unsigned int IPRIORITYR[GIC_NUM_PRIO_REGS(GIC_MAX_INTERUPTS)];
    // unsigned char pad1[0x0800 - 0x07FC];
    /* holds the list of CPU interfaces to which the Distributor forwards the
     * interrupt.*/
    unsigned int ITARGETSR[GIC_NUM_TARGET_REGS(GIC_MAX_INTERUPTS)];
    // unsigned char pad2[0x0C00 - 0x0820];
    /* Determines whether the corresponding interrupt is edge-triggered or
     * level-sensitive.*/
    unsigned int ICFGR[GIC_NUM_CONFIG_REGS(GIC_MAX_INTERUPTS)];
    unsigned char pad3[0x0E00 - 0x0D00];
    /* Enables Secure software to permit Non-secure software on a particular PE
     * to create and control Group 0 interrupts.*/
    unsigned int NSACR[GIC_NUM_SEC_REGS(GIC_MAX_INTERUPTS)];
    /* Controls the generation of SGIs.*/
    unsigned int SGIR;
    unsigned char pad4[0x0F10 - 0x0F04];
    /* Removes the pending state from an SGI.*/
    unsigned int CPENDSGIR[GIC_NUM_SGI_REGS];
    /* Adds the pending state to an SGI.  */
    unsigned int SPENDSGIR[GIC_NUM_SGI_REGS];
} __attribute__((__packed__)) gicd_t;

/* Cpu Interface Memory Mapped Registers */
#define GICC_CTLR_EN_BIT (0x1)
#define GICC_CTLR_EOImodeNS_BIT (1UL << 9)
#define GICC_CTLR_WR_MSK (0x1)
#define GICC_IAR_ID_OFF (0)
#define GICC_IAR_ID_LEN (10)
#define GICC_IAR_ID_MSK (BIT_MASK(GICC_IAR_ID_OFF, GICC_IAR_ID_LEN))
#define GICC_IAR_CPU_OFF (10)
#define GICC_IAR_CPU_LEN (3)
#define GICC_IAR_CPU_MSK (BIT_MASK(GICC_IAR_CPU_OFF, GICC_IAR_CPU_LEN))
typedef struct
{
    /*Controls the CPU interface, including enabling of interrupt groups,
    interrupt signal bypass, binary point registers used,
    and separation of priority drop and interrupt deactivation.*/
    unsigned int CTLR;
    /* provides an interrupt priority filter.
    Only interrupts with higher priority than the value in this register are
    signaled to the PE.*/
    unsigned int PMR;
    /* Defines the point at which the priority value fields split into two
    parts, the group priority field and the subpriority field.*/
    unsigned int BPR;
    /* Provides the INTID of the signaled interrupt.
    A read of this register by the PE acts as an acknowledge for the
    interrupt.*/
    unsigned int IAR;
    /* A write to this register performs priority drop for the specified
    interrupt and, if the appropriate GICC_CTLR.EOImodeS or GICC_CTLR.EOImodeNS
    field == 0, also deactivates the interrupt.*/
    unsigned int EOIR;
    /* indicates the running priority of the CPU interface.*/
    unsigned int RPR;
    /* Provides the INTID of the highest priority pending interrupt on the CPU
     * interface.*/
    unsigned int HPPIR;
    /* Defines the point at which the priority value fields split into two
    parts, the group priority field and the subpriority field. The group
    priority field determines Group 1 interrupt preemption.*/
    unsigned int ABPR;
    /* Provides the INTID of the signaled Group 1 interrupt.
      A read of this register by the PE acts as an acknowledge for the
      interrupt.*/
    unsigned int AIAR;
    /*A write to this register performs priority drop for the specified Group 1
    interrupt and, if the appropriate GICC_CTLR.EOImodeS or GICC_CTLR.EOImodeNS
    field == 0, also deactivates the interrupt.*/
    unsigned int AEOIR;
    /* If the highest priority pending interrupt is in Group 1,
    this register provides the INTID of the highest priority pending interrupt
    on the CPU interface.*/
    unsigned int AHPPIR;
    unsigned char pad0[0x00D0 - 0x002C];
    /* Provides information about interrupt active priorities.*/
    unsigned int APR[GIC_NUM_APR_REGS];
    /* Provides information about Group 1 interrupt active priorities.*/
    unsigned int NSAPR[GIC_NUM_APR_REGS];
    unsigned char pad1[0x00FC - 0x00F0];
    /* Provides information about the implementer and revision of the CPU
     * Interface.*/
    unsigned int IIDR;
    unsigned char pad2[0x1000 - 0x0100];
    /*When interrupt priority drop is separated from interrupt deactivation,
    a write to this register deactivates the specified interrupt.*/
    unsigned int DIR;
} __attribute__((__packed__)) gicc_t;

void timer_gic_init(u_int cpu_id);
void gicc_init();
void gicd_init();
void gicd_set_prio(u64 int_id, u_char prio);
void gicd_set_enable(u64 int_id, u_int en);
void gicd_set_trgt(u64 int_id, u_char trgt);
void interrupts_arch_enable(u64 int_id, u_int en, u_int cpu_id);

static inline unsigned long long bit_extract(u64 word, u64 off, u64 len)
{
    return (word >> off) & BIT_MASK(0, len);
}

#endif /* __GIC_H__ */
