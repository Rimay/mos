cmake_minimum_required(VERSION 3.9)
project(mos C ASM)

set(CMAKE_C_STANDARD 11)
set(CMAKE_C_COMPILER aarch64-elf-gcc)
set(CMAKE_ASM_COMPILER aarch64-elf-gcc)
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -ffreestanding -mgeneral-regs-only")

include_directories(include)

set(USER_PROGRAM
        ${CMAKE_CURRENT_SOURCE_DIR}/user/client.bin
)

add_executable(mos_qemu.elf
        boot/start.S
        boot/vm.c
        driver/gicv2.c
        driver/kclock.c
        driver/psci.c
        driver/uart.c
        include/cap.h
        include/cpu.h
        include/error.h
        include/gic.h
        include/kclock.h
        include/kerelf.h
        include/kernel_objects.h
        include/mmio.h
        include/mmu.h
        include/page.h
        include/pcb.h
        include/print.h
        include/printf.h
        include/psci.h
        include/queue.h
        include/sched.h
        include/spin_lock.h
        include/syscall.h
        include/trap.h
        include/uart.h
        kernel/asm.S
        kernel/cap.c
        kernel/cpu.c
        kernel/kernel_elfloader.c
        kernel/main.c
        kernel/page.c
        kernel/pcb.c
        kernel/print.c
        kernel/printf.c
        kernel/sched.c
        kernel/spin_lock.c
        kernel/syscall.c
        kernel/trap.c
        kernel/utils.c
        ${USER_PROGRAM}
)

SET_SOURCE_FILES_PROPERTIES(
        ${USER_PROGRAM}
        PROPERTIES
        EXTERNAL_OBJECT true
        GENERATED true
)

add_custom_command(
        OUTPUT  ${USER_PROGRAM}
        COMMAND make all
        WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}/user
)

set_target_properties(mos_qemu.elf PROPERTIES LINK_DEPENDS ${CMAKE_SOURCE_DIR}/kernel.lds)
set_target_properties(mos_qemu.elf PROPERTIES LINK_FLAGS " -Wl,--build-id=none -nostdlib -T ${CMAKE_SOURCE_DIR}/kernel.lds")
set_target_properties(mos_qemu.elf PROPERTIES COMPILE_FLAGS "-DPLATFORM_QEMU")
