#include "kerelf.h"
#include "mmu.h"
#include "pcb.h"
#include "page.h"
#include "dprintf.h"

extern struct cte *pagecn;
extern u64 p_pcnslot_cnt;


static inline int is_elf_format(u8 *binary) {
    Elf64_Ehdr *ehdr = (Elf64_Ehdr *) binary;
    if ((ehdr->e_ident[0] == ELFMAG0) && (ehdr->e_ident[1] == ELFMAG1) &&
        (ehdr->e_ident[2] == ELFMAG2) && (ehdr->e_ident[3] == ELFMAG3)) {
        return 1;
    }
    return 0;
}


static int load_icode_mapper(u64 va, u_int mem_size, u8 *bin, u_int file_size, void *pp) {
    struct Pcb *pcb = (struct Pcb *) pp;
    u64 i;
    u64 offset = va - ROUND_DOWN(va, BASE_PAGE_SIZE);
    // printf("\t\tload_icode_mapper va: 0x%lx\tfile size: 0x%lx\tmem size: 0x%lx\n", va, file_size, mem_size);

    for (i = 0; i < file_size; i += BASE_PAGE_SIZE) {
        u64 pa = alloc_page(pagecn, &p_pcnslot_cnt, ObjType_Page);
        
        map_ptable((u64 *)pcb->pg_dir, 
                    va-offset+i, pa, PTE_USER | PTE_RW, pagecn, &p_pcnslot_cnt);
        // printf("\t\telf map va: 0x%lx\tpa: 0x%lx\n", va-offset+i, pa);
        // u64 *pte = walk_pgdir((u64 *)pcb->pg_dir, va - offset + i);
        // printf("\t\tfind pa: 0x%lx\n", PTE_ADDR(*pte));

        memcpy((void *) pa2kva(pa) + offset, bin+i, MIN(BY2PG, file_size - i));
        // printf("\t\tstage 1: i %d  slot_cnt %d\n", i, p_pcnslot_cnt);
    }
    while (i < mem_size) {
         // alloc new page
        u64 pa = alloc_page(pagecn, &p_pcnslot_cnt, ObjType_Page);
        
        // map new page to pcb's pgdir
        map_ptable((u64 *)pcb->pg_dir,  va-offset+i, pa, \
                    PTE_USER | PTE_RW, pagecn, &p_pcnslot_cnt);
        
        i += BASE_PAGE_SIZE;
        // printf("\t\tstage 2: i %d  slot_cnt %d\n", i, p_pcnslot_cnt);
    }
    return 0;
}


int load_elf(u8 *binary, int size, u64 *entry_point, void *pcb) {
    Elf64_Ehdr *ehdr = (Elf64_Ehdr *) binary;
    Elf64_Phdr *phdr = NULL;

    u8 *ptr_ph_table = NULL;
    Elf64_Half ph_entry_count, ph_entry_size;
    int r;

    if ((size < 4) || !is_elf_format(binary)) {
        return -1;
    }

    ptr_ph_table = binary + ehdr->e_phoff;
    ph_entry_count = ehdr->e_phnum;
    ph_entry_size = ehdr->e_phentsize;

    while (ph_entry_count--) {
        phdr = (Elf64_Phdr *) ptr_ph_table;
        if (phdr->p_type == SHT_PROGBITS) {
            r = load_icode_mapper(phdr->p_vaddr, phdr->p_memsz, binary + phdr->p_offset, phdr->p_filesz, pcb);
            if (r < 0) {
                return r;
            }
        }
        ptr_ph_table += ph_entry_size;
    }

    *entry_point = ehdr->e_entry;
    return 0;
}


void load_elf_img(struct Pcb *p, u8 *binary, u32 size) {
    u64 entry_point;
    int r = load_elf(binary, size, &entry_point, p);
    assert(r >= 0);
    p->pcb_tf.elr = entry_point;
    dprintf("elf entry point is %lx\n", entry_point);
}
