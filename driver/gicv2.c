#include <gic.h>
#include <cpu.h>
#include <trap.h>
#include <spin_lock.h>
#include <sched.h>
#include <kclock.h>
#include <printf.h>
volatile gicd_t* gicd = (volatile gicd_t *) GICD_BASE_KERN;
volatile gicc_t* gicc = (volatile gicc_t *) GICC_BASE_KERN;


void interrupts_arch_enable(u64 int_id, u_int en,u_int cpu_id) {
    gicd_set_enable(int_id, en);
    gicd_set_prio(int_id, 0x7F);
    gicd_set_trgt(int_id, 1U << cpu_id);
}

void gicd_set_trgt(u64 int_id, u_char trgt) {
    u64 reg_ind = GIC_TARGET_REG(int_id);
    u64 off = GIC_TARGET_OFF(int_id);
    u_int mask = BIT_MASK(off, GIC_TARGET_BITS);

    gicd->ITARGETSR[reg_ind] =
        (gicd->ITARGETSR[reg_ind] & ~mask) | ((trgt << off) & mask);
}

void gicd_set_enable(u64 int_id, u_int en) {
    u64 reg_ind = GIC_INT_REG(int_id);
    u64 bit = GIC_INT_MASK(int_id);

    if (en) {
        gicd->ISENABLER[reg_ind] = bit;
    } else {
        gicd->ICENABLER[reg_ind] = bit;
    }

}

void gicd_set_prio(u64 int_id, u_char prio) {
    u64 reg_ind = GIC_PRIO_REG(int_id);
    u64 off = GIC_PRIO_OFF(int_id);
    u64 mask = BIT_MASK(off, GIC_PRIO_BITS);

    gicd->IPRIORITYR[reg_ind] =
        (gicd->IPRIORITYR[reg_ind] & ~mask) | ((prio << off) & mask);
}


void gicd_init() {
    // get max num of SPIs
    u_int itlinenumber = bit_extract(gicd->TYPER, GICD_TYPER_ITLN_OFF, GICD_TYPER_ITLN_LEN);
    u64 int_num = 32 * itlinenumber + 1;

    /* Bring distributor to known state */
    for (int i = GIC_NUM_PRIVINT_REGS; i < GIC_NUM_INT_REGS(int_num); i++) {
        /**
         * Make sure all interrupts are not enabled, non pending, non active.
         */
        gicd->ICENABLER[i] = -1;
        gicd->ICPENDR[i] = -1;
        gicd->ICACTIVER[i] = -1;
    }

    /* All interrupts have lowest priority possible by default */
    for (int i = GIC_CPU_PRIV; i < GIC_NUM_PRIO_REGS(int_num); i++)
        gicd->IPRIORITYR[i] = -1;

    /* No CPU targets for any interrupt by default */
    for (int i = GIC_CPU_PRIV; i < GIC_NUM_TARGET_REGS(int_num); i++)
        gicd->ITARGETSR[i] = 0;

    /* Enable distributor */
    gicd->CTLR |= GICD_CTLR_EN_BIT;
}

void gicc_init() {
    for (int i = 0; i < GIC_NUM_INT_REGS(GIC_CPU_PRIV); i++) {
        /**
         * Make sure all private interrupts are not enabled, non pending, non active.
         */
        gicd->ICENABLER[i] = -1;
        gicd->ICPENDR[i] = -1;
        gicd->ICACTIVER[i] = -1;
    }

    /* Clear any pending SGIs. */
    for (int i = 0; i < GIC_NUM_SGI_REGS; i++) {
        gicd->CPENDSGIR[i] = -1;
    }

    /* All interrupts have lowest priority possible by default */
    for (int i = 0; i < GIC_NUM_PRIO_REGS(GIC_CPU_PRIV); i++) {
        gicd->IPRIORITYR[i] = -1;
    }

    gicc->PMR = -1;
    gicc->CTLR |= GICC_CTLR_EN_BIT | GICC_CTLR_EOImodeNS_BIT;
}

void timer_gic_init(u_int cpu_id)
{
    interrupts_arch_enable(NONSEC_EL2_PHY_TIMER_INT, 1,cpu_id);
    interrupts_arch_enable(EL1_VIRT_TIMER_INT, 1,cpu_id);
    interrupts_arch_enable(EL1_PHY_TIMER_INT, 1,cpu_id);
    interrupts_arch_enable(NONSEC_EL2_VIRT_TIMER_INT, 1,cpu_id);
}

void gic_handler() {
    u64 ack = gicc->IAR;
    u64 id = bit_extract(ack, GICC_IAR_ID_OFF, GICC_IAR_ID_LEN);
    //u64 src = bit_extract(ack, GICC_IAR_CPU_OFF, GICC_IAR_CPU_LEN);
    if (id >= 1022)
        return;

    if (id == 30 || id == 26 || id == 27 || id == 28) {
        sched_yield();
        kclock_next();
    } else {
        printf("Interrupt %d hasn't been implemented,sorry\n", id);
        while (1) {
            asm volatile ("nop");
        }
    }
    //printf("cpu %d ret addr [%l016x]\n",cpu_id,get_elr());
    gicc->EOIR = ack;
    gicc->DIR = ack;
}