SECTIONS
{
    . = 0xFFFFFF8040080000;
    .start : {
        *(.text.start*)
        *(.text.init*)
        *(.data.init*)
    }
    .text : {
        *(.text*)
    }
    .rodata : {
        *(.rodata*)
    }
    .data : {
        *(.data*)
    }
    bss_start = .;
    .bss : {
        *(.bss*)
    }
    bss_end = .;
    kernel_end = .;
}
