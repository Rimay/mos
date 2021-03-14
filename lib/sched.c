#include <env.h>
#include <printf.h>
#include <cpu.h>

void sched_yield()
{
    unsigned int first_id = 0,loop;
    struct Env* tmp_env;
    int cpu_id = cpu_current_id();
    while (1) {
        for (int i = PRIORITY_NUM;i >= 0;i--) {
            first_id = 0;
            loop = 0;
            while (!LIST_EMPTY(&env_sched_list[i])) {
                tmp_env = LIST_FIRST(&env_sched_list[i]);
                // printf("cpu %d get env %d env_status %d PRIORITY_NUM %d \n",cpu_id,tmp_env->env_id, tmp_env->env_status, i);

                if (tmp_env->env_status == ENV_FREE) {
                    LIST_REMOVE(tmp_env,env_sched_link);
                }
                else if (tmp_env->env_status == ENV_RUNNING && tmp_env->cpu_id == cpu_id) {
                    LIST_REMOVE(tmp_env,env_sched_link);
                    LIST_INSERT_TAIL(&env_sched_list[i],tmp_env,env_sched_link);
                    env_run(tmp_env);
                    return;
                }
                else if (tmp_env->env_status == ENV_NOT_RUNNABLE || tmp_env->env_status == ENV_RUNNING) {
                   LIST_REMOVE(tmp_env,env_sched_link);
                   LIST_INSERT_TAIL(&env_sched_list[i],tmp_env,env_sched_link);
                   if (tmp_env->env_id == first_id){
                        //printf("cpu %d break scheduling at pri %d\n",cpu_id,i);
                        break;
                   }
                   if (loop == 0){
                       loop++;
                       first_id = tmp_env->env_id;
                   }
                       
                }
                else {
                    LIST_REMOVE(tmp_env,env_sched_link);
                    LIST_INSERT_TAIL(&env_sched_list[i],tmp_env,env_sched_link);
                    env_run(tmp_env);
                    return;
                }
            }
        }
    }
}
