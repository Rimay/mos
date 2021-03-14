cmake_minimum_required(VERSION 3.9)
project(mos C ASM)

set(CMAKE_C_STANDARD 11)
set(CMAKE_C_COMPILER aarch64-elf-gcc)
set(CMAKE_ASM_COMPILER aarch64-elf-gcc)
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -ffreestanding -mgeneral-regs-only")

include_directories(include)

set(USER_PROGRAM
        ${CMAKE_CURRENT_SOURCE_DIR}/user/pingpong.bin
        ${CMAKE_CURRENT_SOURCE_DIR}/user/test0.bin
        ${CMAKE_CURRENT_SOURCE_DIR}/user/test1.bin
        ${CMAKE_CURRENT_SOURCE_DIR}/user/test2.bin
        ${CMAKE_CURRENT_SOURCE_DIR}/user/test3.bin
        ${CMAKE_CURRENT_SOURCE_DIR}/user/test4.bin
        ${CMAKE_CURRENT_SOURCE_DIR}/user/idle.bin
        ${CMAKE_CURRENT_SOURCE_DIR}/user/fktest.bin
)

add_executable(mos_qemu.elf
        boot/start.S
        boot/vm.c
        driver/uart.c
        include/cap.h
        include/cpu.h
        include/env.h
        include/error.h
        include/gic.h
        include/kclock.h
        include/kerelf.h
        include/mmio.h
        include/mmu.h
        include/pmap.h
        include/print.h
        include/printf.h
        include/psci.h
        include/queue.h
        include/sched.h
        include/spin_lock.h
        include/syscall_all.h
        include/trap.h
        include/types.h
        include/uart.h
        init/main.c
        lib/asm.S
        lib/cap.c
        lib/cpu.c
        lib/env.c
        driver/gicv2.c
        driver/kclock.c
        lib/kernel_elfloader.c
        lib/pmap.c
        lib/print.c
        lib/printf.c
        driver/psci.c
        lib/sched.c
        lib/spin_lock.c
        lib/syscall_all.c
        lib/trap.c
        ${USER_PROGRAM}
        )

        add_executable(mos_vm.elf
        boot/start.S
        boot/vm.c
        driver/uart.c
        include/cap.h
        include/cpu.h
        include/env.h
        include/error.h
        include/gic.h
        include/kclock.h
        include/kerelf.h
        include/mmio.h
        include/mmu.h
        include/pmap.h
        include/print.h
        include/printf.h
        include/psci.h
        include/queue.h
        include/sched.h
        include/spin_lock.h
        include/syscall_all.h
        include/trap.h
        include/types.h
        include/uart.h
        init/main.c
        lib/asm.S
        lib/cap.c
        lib/cpu.c
        lib/env.c
        driver/gicv2.c
        driver/kclock.c
        lib/kernel_elfloader.c
        lib/pmap.c
        lib/print.c
        lib/printf.c
        driver/psci.c
        lib/sched.c
        lib/spin_lock.c
        lib/syscall_all.c
        lib/trap.c
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
set_target_properties(mos_vm.elf PROPERTIES LINK_DEPENDS ${CMAKE_SOURCE_DIR}/kernel.lds)
set_target_properties(mos_vm.elf PROPERTIES LINK_FLAGS " -Wl,--build-id=none -nostdlib -T ${CMAKE_SOURCE_DIR}/kernel.lds")
set_target_properties(mos_vm.elf PROPERTIES COMPILE_FLAGS "-DPLATFORM_VM")