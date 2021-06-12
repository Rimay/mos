#ifndef _DPRINTF_H_
#define _DPRINTF_H_

#include <stdint.h>
#include <stdarg.h>
#include "utils.h"

/*------------------------------------------- config ---------------------------------------------*/
#define CONFIG_MOS_COLOUR_OUTPUT 1
#define CONFIG_MOS_DEBUG 1


UNUSED static u64 k_faketime() {
    static u64 t = 0;
    return t++;
}


// Console colours.
#ifndef COLOUR
    #ifdef CONFIG_MOS_COLOUR_OUTPUT
        #define COLOUR "\033[;1;%dm"
        #define COLOUR_R "\033[;1;31m"
        #define COLOUR_G "\033[;1;32m"
        #define COLOUR_Y "\033[;1;33m"
        #define COLOUR_B "\033[;1;34m"
        #define COLOUR_M "\033[;1;35m"
        #define COLOUR_C "\033[;1;36m"
        #define COLOUR_W "\033[;1;37m"
        #define COLOUR_NORM_R "\033[;0;31m"
        #define COLOUR_NORM_G "\033[;0;32m"
        #define COLOUR_NORM_Y "\033[;0;33m"
        #define COLOUR_NORM_B "\033[;0;34m"
        #define COLOUR_NORM_M "\033[;0;35m"
        #define COLOUR_NORM_C "\033[;0;36m"
        #define COLOUR_NORM_W "\033[;0;37m"
        #define COLOUR_RESET "\033[0m"
    #else
        #define COLOUR "%d "
        #define COLOUR_R
        #define COLOUR_G
        #define COLOUR_Y
        #define COLOUR_B
        #define COLOUR_M
        #define COLOUR_C
        #define COLOUR_W
        #define COLOUR_NORM_R
        #define COLOUR_NORM_G
        #define COLOUR_NORM_Y
        #define COLOUR_NORM_B
        #define COLOUR_NORM_M
        #define COLOUR_NORM_C
        #define COLOUR_NORM_W
        #define COLOUR_RESET
    #endif
#endif


extern u64 faketime() __attribute__((weak)); 
extern const char* dprintf_server_name;
extern int dprintf_server_colour;

#define MOS_ERROR(...) writef(COLOUR "ERROR" COLOUR_RESET " %s(): ", \
    31, __FUNCTION__); writef(__VA_ARGS__); writef("\n");

#define MOS_WARNING(...) writef(COLOUR "WARNING" COLOUR_RESET " %s(): ", \
    33, __FUNCTION__); writef(__VA_ARGS__); writef("\n");

#ifdef CONFIG_MOS_DEBUG
    // user print
    #define dwritef(...) writef("[00.%u] " COLOUR "%s | " \
        COLOUR_RESET " %s(): ", \
        faketime ? faketime() : 0, \
        dprintf_server_colour, dprintf_server_name, __FUNCTION__); \
        writef(__VA_ARGS__);

    // kernel print
    #define dprintf(...) printf("[00.%u] " COLOUR_C "Kernel | " \
        COLOUR_RESET " %s(): ", k_faketime(),  __FUNCTION__); \
        printf(__VA_ARGS__);
#else
    #define dwritef(...)
    #define dprintf(...)
#endif


#endif /* _DPRINTF_H_ */
