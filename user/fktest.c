#include "lib.h"

void umain() {
    int id = 0;
    // writef("-------------------------- fktest start\n");
    id = fork();
    if (id == 0) {
        // if ((id = fork()) == 0) {
        //     for (;;) {
        //         writef("child2 \t");
        //     }
        // }
        for (;;) {
            writef("child1 \t");
        }
    }
    for (;;) {
        writef("father \t");
    }
}
