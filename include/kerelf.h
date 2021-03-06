#ifndef _KER_ELF_H
#define _KER_ELF_H

#include <utils.h>
#include "pcb.h"

/* 64-bit ELF base type. */
typedef unsigned long Elf64_Addr;
typedef unsigned short Elf64_Half;
typedef short Elf64_SHalf;
typedef unsigned long Elf64_Off;
typedef int Elf64_Sword;
typedef unsigned int Elf64_Word;
typedef unsigned long Elf64_Xword;
typedef long Elf64_Sxword;

/* The ELF file header.  This appears at the start of every ELF file.  */
#define EI_NIDENT     (16)

typedef struct elf64_hdr
{
	unsigned char e_ident[EI_NIDENT]; /* ELF "magic number" */
	Elf64_Half    e_type;
	Elf64_Half    e_machine;
	Elf64_Word    e_version;
	Elf64_Addr    e_entry;  /* Entry point virtual address */
	Elf64_Off     e_phoff;  /* Program header table file offset */
	Elf64_Off     e_shoff;  /* Section header table file offset */
	Elf64_Word    e_flags;
	Elf64_Half    e_ehsize;
	Elf64_Half    e_phentsize;
	Elf64_Half    e_phnum;
	Elf64_Half    e_shentsize;
	Elf64_Half    e_shnum;
	Elf64_Half    e_shstrndx;
} Elf64_Ehdr;

#define ELFMAG0       0x7f      /* EI_MAG */
#define ELFMAG1       'E'
#define ELFMAG2       'L'
#define ELFMAG3       'F'

/* Program segment header.  */
typedef struct elf64_phdr
{
	Elf64_Word  p_type;
	Elf64_Word  p_flags;
	Elf64_Off   p_offset;   /* Segment file offset */
	Elf64_Addr  p_vaddr;    /* Segment virtual address */
	Elf64_Addr  p_paddr;    /* Segment physical address */
	Elf64_Xword p_filesz;   /* Segment size in file */
	Elf64_Xword p_memsz;    /* Segment size in memory */
	Elf64_Xword p_align;    /* Segment alignment, file & memory */
} Elf64_Phdr;

/* sh_type */
#define SHT_NULL      0
#define SHT_PROGBITS  1
#define SHT_SYMTAB    2
#define SHT_STRTAB    3
#define SHT_RELA      4
#define SHT_HASH      5
#define SHT_DYNAMIC   6
#define SHT_NOTE      7
#define SHT_NOBITS    8
#define SHT_REL       9
#define SHT_SHLIB     10
#define SHT_DYNSYM    11
#define SHT_NUM       12
#define SHT_LOPROC    0x70000000
#define SHT_HIPROC    0x7fffffff
#define SHT_LOUSER    0x80000000
#define SHT_HIUSER    0xffffffff

/* sh_flags */
#define SHF_WRITE     0x1
#define SHF_ALLOC     0x2
#define SHF_EXECINSTR 0x4
#define SHF_MASKPROC  0xf0000000


void load_icode(struct Pcb *e, u8 *binary, u32 size);

#endif /* kerelf.h */
