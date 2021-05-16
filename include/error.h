#ifndef _ERROR_H_
#define _ERROR_H_

#include "utils.h"

// Kernel error codes -- keep in sync with list in kern/printf.c.
#define E_UNSPECIFIED	1	// Unspecified or unknown problem
#define E_BAD_ENV       2       // Pcbironment doesn't exist or otherwise
// cannot be used in requested action
#define E_INVAL		3	// Invalid parameter
#define E_NO_MEM	4	// Request failed due to memory shortage
#define E_NO_FREE_ENV   5       // Attempt to create a new pcbironment beyond
// the maximum allowed
#define E_IPC_NOT_RECV  6	// Attempt to send to pcb that is not recving.

// File system error codes -- only seen in user-level
#define	E_NO_DISK	7	// No free space left on disk
#define E_MAX_OPEN	8	// Too many files are open
#define E_NOT_FOUND	9 	// File or block not found
#define E_BAD_PATH	10	// Bad path
#define E_FILE_EXISTS	11	// File already exists
#define E_NOT_EXEC	12	// File not a valid executable

#define MAXERROR 12


typedef u8 errval_t;
enum err_code {
    SYS_ERR_OK = 0,
    SYS_ERR_SLOT_IN_USE = 1,
    SYS_ERR_CNODE_TYPE = 2,
    SYS_ERR_L1_CNODE_INDEX = 3,
    SYS_ERR_CAP_NOT_FOUND = 4,
};

 
static inline enum err_code err_no(errval_t errval) {
 
    return (((enum err_code) (errval & ((1 << 10) - 1))));
}

static inline u8 err_is_fail(errval_t errval) {
    enum err_code _fof_x3;
 
    _fof_x3 = err_no(errval);
    return ((_fof_x3 >= 1));
}
 
static inline u8 err_is_ok(errval_t errval) {
    enum err_code _fof_x2;
 
    _fof_x2 = err_no(errval);
    return ((_fof_x2 < 1));
}

 
#endif // _ERROR_H_
