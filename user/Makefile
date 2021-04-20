CROSS  := aarch64-elf-
CFLAGS := -Wall -ffreestanding -nostdlib -static -mgeneral-regs-only
CC     := $(CROSS)gcc
LD     := $(CROSS)ld

INCLUDES = -I../include/ -I./
USERLIB := fd.o file.o fork.o fs.o fsipc.o ipc.o libos.o pgfault.o print.o printf.o string.o syscall_lib.o #pageref.o

all: pingpong.bin test0.bin test1.bin test2.bin test3.bin test4.bin idle.bin fktest.bin # 这里填用户程序名，与 user目录的 pingpong.c对应

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
