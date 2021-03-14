#ifndef OSLABPI_TYPE_H
#define OSLABPI_TYPE_H

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

/* Rounding; only works for n = power of two */
#define ROUND(a, n)	(((((u_long)(a))+(n)-1)) & ~((n)-1))
#define ROUNDDOWN(a, n)	(((u_long)(a)) & ~((n)-1))

#endif //OSLABPI_TYPE_H
