CROSS  := aarch64-elf-
CFLAGS := -Wall -ffreestanding -nostdlib -static -mgeneral-regs-only
CC     := $(CROSS)gcc
LD     := $(CROSS)ld

INCLUDES = -I../include/ -I./
USERLIB := allocator.o fork.o u_print.o u_printf.o u_syscall.o u_utils.o

# todo: ps 放到user/目录下一个新文件夹
#
all:  client.bin

%.bin: %.elf
	$(LD) -r -b binary -o $@ $<
%.elf: entry.o %.o $(USERLIB)
	$(LD) -o $@ -e _start -T user.lds -G 0 -static -n -nostdlib $^
%.o: %.c
	$(CC) $(CFLAGS) $(INCLUDES) -c -o $@ $<
%.o: %.S
	$(CC) $(CFLAGS) $(INCLUDES) -c -o $@ $<

.PHONY: clean
clean:
	rm -rf *~ *.o *.elf *.bin
