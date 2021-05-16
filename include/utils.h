#ifndef _UTILS_H_
#define _UTILS_H_

#include <stddef.h>
#include <stdbool.h>

typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
typedef unsigned long u64;

typedef char i8;
typedef short i16;
typedef int i32;
typedef long i64;

typedef unsigned char u_char;
typedef unsigned short u_short;
typedef unsigned int u_int;
typedef unsigned long u_long;

#define MIN(_a, _b)	\
	({		\
		typeof(_a) __a = (_a);	\
		typeof(_b) __b = (_b);	\
		__a <= __b ? __a : __b;	\
	})

// /* Rounding; only works for n = power of two */
// #define ROUND(a, n)	(((((u_long)(a))+(n)-1)) & ~((n)-1))
// #define ROUND_DOWN(a, n)	(((u_long)(a)) & ~((n)-1))

/* A one-bit mask at bit n of type t */
#define BIT_T(t, n) ((t)1 << (n))

/* A one-bit mask at bit n */
#define BIT(n) BIT_T(u64, n)

/* An n-bit mask, beginning at bit 0 of type t */
#define MASK_T(t, n) (BIT_T(t, n) - 1)

/* An n-bit mask, beginning at bit 0 */
#define MASK(n) MASK_T(u64, n)

/* An n-bit field selector, beginning at bit m */
#define FIELD(m,n,x) (((x) >> m) & MASK(n))

/* Round n up to the next multiple of size */
#define ROUND_UP(n, size) ((((n) + (size) - 1)) & (~((size) - 1)))

/* Divide n by size, rounding up */
#define DIVIDE_ROUND_UP(n, size) (((n) + (size) - 1) / (size))

/* Round n down to the nearest multiple of size */
#define ROUND_DOWN(n, size) ((n) & (~((size) - 1)))

/* Return the number of entries in a statically-allocated array */
#define ARRAY_LENGTH(x) (sizeof(x) / sizeof((x)[0]))



static inline void set_ttbr0(u64 pa) {asm volatile ("msr ttbr0_el1, %0" :: "r" (pa));}

static inline void tlb_invalidate() {asm volatile ("dsb ishst; tlbi vmalle1is; dsb ish; isb");}

void memzero(void *dst, u64 count);
void memcpy(void *dst, const void *src, u64 len);

#endif