CROSS  := aarch64-elf-
CFLAGS := -Wall -ffreestanding -nostdlib -static -mgeneral-regs-only
CC     := $(CROSS)gcc
LD     := $(CROSS)ld

INCLUDES = -I../include/ -I./
USERLIB := libos.o print.o printf.o  syscall_lib.o 

all: hello.bin   # 这里填用户程序名，与 user目录的 pingpong.c对应

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
