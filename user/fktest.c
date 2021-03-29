#include "lib.h"


void fktest_env_alloc(u64 rights)
{
    int i;
    int id = fork(rights);
    if (id == 0) {
        id = fork(rights);
        if (id == 0) {
            for (i = 0; i < 10; i++) {
                writef("\t\tchild2 created\n");
            }
            while (1) {}
        }
        for (i = 0; i < 10; i++) {
            writef("\tchild1 created\n");
        }
        while (1) {}
    }
    for (i = 0; i < 10; i++) {
        writef("father created\n");
    }
    while (1) {}
}

void fktest_set_env_status(u64 rights)
{
    int i;
    int id = fork(rights);
    writef("env %d return from fork\n", id);
    if (id == 0) {
        u32 env_id = syscall_getenvid();
        syscall_set_env_status(env_id, ENV_FREE);

        for (i = 0; i < 10; i++) {
            writef("\tchild1 created\n");
        }
        while (1) {}
    }
    for (i = 0; i < 10; i++) {
        writef("father created\n");
    }
    while (1) {}
}

void fktest_get_env_id(u64 rights)
{
    int i;
    int id = fork(rights);
    if (id == 0) {
        u32 env_id = syscall_getenvid();
        writef("env_id: %d\n", env_id);

        for (i = 0; i < 10; i++) {
            writef("\tchild1 created\n");
        }
        while (1) {}
    }
    for (i = 0; i < 10; i++) {
        writef("father created\n");
    }
    while (1) {}
    
}

void fktest_yield(u64 rights)
{
    int i;
    int id = fork(rights);
    if (id == 0) {
        for (i = 0; i < 10; i++) {
            writef("\tchild1 created\n");
        }
        while (1) {}
    }
    syscall_yield(0);
    for (i = 0; i < 10; i++) {
        writef("father created\n");
    }
    while (1) {}
}

void fktest_env_destroy(u64 rights)
{
    int i;
    int id = fork(rights);
    if (id == 0) {
        syscall_env_destroy(1);
        for (i = 0; i < 10; i++) {
            writef("\tchild1 created\n");
        }
        while (1) {}
    }
    syscall_yield(0);
    for (i = 0; i < 10; i++) {
        writef("father created\n");
    }
    while (1) {}
}

void fktest_set_pgfault_handler(u64 rights)
{
    
}

void fktest_mem_alloc(u64 rights)
{
    
}

void fktest_mem_unmap(u64 rights)
{
    
}

void umain() 
{
    // writef("------------------ test with env_alloc rights ------------------\n");
    // u64 rights = RIGHTS_ENV_ALLOC | RIGHTS_SET_PGFAULT_HANDLER | RIGHTS_MEM_ALLOC | RIGHTS_SET_ENV_STATUS;
    // fktest_env_alloc(rights);

    // writef("------------------ test without env_alloc rights ------------------\n");
    // u64 rights =  RIGHTS_SET_PGFAULT_HANDLER | RIGHTS_MEM_ALLOC | RIGHTS_SET_ENV_STATUS;
    // fktest_env_alloc(rights);


    
    // writef("------------------ test with set_env_status rights ------------------\n");
    // u64 rights =  RIGHTS_SET_PGFAULT_HANDLER | RIGHTS_MEM_ALLOC | RIGHTS_YIELD | RIGHTS_SET_ENV_STATUS;
    // fktest_set_env_status(rights);

    // writef("------------------ test without set_env_status rights ------------------\n");
    // u64 rights =  RIGHTS_SET_PGFAULT_HANDLER | RIGHTS_MEM_ALLOC | RIGHTS_YIELD;
    // fktest_set_env_status(rights);



    // writef("------------------ test without get_env_id rights ------------------\n");
    // u64 rights =  RIGHTS_SET_PGFAULT_HANDLER | RIGHTS_MEM_ALLOC | RIGHTS_YIELD | RIGHTS_SET_ENV_STATUS;
    // fktest_get_env_id(rights);



    // writef("------------------ test with yield rights ------------------\n");
    // u64 rights =  RIGHTS_SET_PGFAULT_HANDLER | RIGHTS_MEM_ALLOC | RIGHTS_YIELD | RIGHTS_SET_ENV_STATUS | RIGHTS_GET_ENV_ID;
    // fktest_yield(rights);


    // writef("------------------ test with yield rights ------------------\n");
    // u64 rights =  RIGHTS_SET_PGFAULT_HANDLER | RIGHTS_MEM_ALLOC | RIGHTS_YIELD | RIGHTS_SET_ENV_STATUS | RIGHTS_GET_ENV_ID | RIGHTS_ENV_DESTROY;
    // fktest_env_destroy(rights);

    // writef("------------------ test without yield rights ------------------\n");
    // u64 rights =  RIGHTS_SET_PGFAULT_HANDLER | RIGHTS_MEM_ALLOC | RIGHTS_YIELD | RIGHTS_SET_ENV_STATUS | RIGHTS_GET_ENV_ID;
    // fktest_env_destroy(rights);


    // fktest_set_pgfault_handler();
    // fktest_mem_alloc();
    // fktest_mem_unmap();
}



