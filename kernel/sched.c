#include <pcb.h>
#include <printf.h>
#include <cpu.h>

void sched_yield()
{
    // printf("------ time interrupt received\n");
    u8 cpu_id = cpu_current_id();
    struct Pcb *p = NULL;
    struct Pcb *first_p = NULL;
    if (LIST_EMPTY(&pcb_sched_list)) {
        printf("No process avilable now\n");
        return;
    }
    while (1) {
        p = LIST_FIRST(&pcb_sched_list);
        assert(p->status == ENV_RUNNABLE || p->status == ENV_RUNNING || p->status == ENV_BLOCK_ON_RECV || p->status == ENV_BLOCK_ON_SEND);
        if (first_p == NULL) {
            first_p = p;
        }
        else if (first_p == p) {
            printf("No process avilable now\n");
            return;
        }
        if (p->status == ENV_RUNNABLE || (p->status == ENV_RUNNING && p->cpu_id == cpu_id)) {
            LIST_REMOVE(p, sched_link);
            LIST_INSERT_TAIL(&pcb_sched_list, p, sched_link);
            pcb_run(p);
            return;
        }
        LIST_REMOVE(p, sched_link);
        LIST_INSERT_TAIL(&pcb_sched_list, p, sched_link);
    }
}
