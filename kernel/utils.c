#include "utils.h"


void memzero(void* b, u64 len) {
    u64 max = (u64)b + len;
    while ((u64)b + 7 < max) {
        *(u64 *) b = 0;
        b += 8;
    }
    while ((u64) b < max) {
        *(u8 *) b++ = 0;
    }
}

void memcpy(void *dst, const void *src, u64 len) {
    u64 max = (u64)dst + len;
    while ((u64) dst + 7 < max) {
        *(u64 *) dst = *(u64 *) src;
        dst += 8;
        src += 8;
    }
    while ((u64) dst < max) {
        *(u8 *) dst = *(u8 *) src;
        dst += 1;
        src += 1;
    }
}

