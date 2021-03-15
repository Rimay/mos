# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/bin/cmake

# The command to remove a file.
RM = /usr/local/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/yili/mos

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/yili/mos/build

# Include any dependencies generated for this target.
include CMakeFiles/mos_qemu.elf.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/mos_qemu.elf.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/mos_qemu.elf.dir/flags.make

../user/pingpong.bin:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/yili/mos/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating ../user/pingpong.bin, ../user/test0.bin, ../user/test1.bin, ../user/test2.bin, ../user/test3.bin, ../user/test4.bin, ../user/idle.bin, ../user/fktest.bin"
	cd /home/yili/mos/user && make all

../user/test0.bin: ../user/pingpong.bin
	@$(CMAKE_COMMAND) -E touch_nocreate ../user/test0.bin

../user/test1.bin: ../user/pingpong.bin
	@$(CMAKE_COMMAND) -E touch_nocreate ../user/test1.bin

../user/test2.bin: ../user/pingpong.bin
	@$(CMAKE_COMMAND) -E touch_nocreate ../user/test2.bin

../user/test3.bin: ../user/pingpong.bin
	@$(CMAKE_COMMAND) -E touch_nocreate ../user/test3.bin

../user/test4.bin: ../user/pingpong.bin
	@$(CMAKE_COMMAND) -E touch_nocreate ../user/test4.bin

../user/idle.bin: ../user/pingpong.bin
	@$(CMAKE_COMMAND) -E touch_nocreate ../user/idle.bin

../user/fktest.bin: ../user/pingpong.bin
	@$(CMAKE_COMMAND) -E touch_nocreate ../user/fktest.bin

CMakeFiles/mos_qemu.elf.dir/boot/start.S.o: CMakeFiles/mos_qemu.elf.dir/flags.make
CMakeFiles/mos_qemu.elf.dir/boot/start.S.o: ../boot/start.S
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/yili/mos/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building ASM object CMakeFiles/mos_qemu.elf.dir/boot/start.S.o"
	aarch64-elf-gcc $(ASM_DEFINES) $(ASM_INCLUDES) $(ASM_FLAGS) -o CMakeFiles/mos_qemu.elf.dir/boot/start.S.o -c /home/yili/mos/boot/start.S

CMakeFiles/mos_qemu.elf.dir/boot/vm.c.o: CMakeFiles/mos_qemu.elf.dir/flags.make
CMakeFiles/mos_qemu.elf.dir/boot/vm.c.o: ../boot/vm.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/yili/mos/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object CMakeFiles/mos_qemu.elf.dir/boot/vm.c.o"
	aarch64-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/mos_qemu.elf.dir/boot/vm.c.o   -c /home/yili/mos/boot/vm.c

CMakeFiles/mos_qemu.elf.dir/boot/vm.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/mos_qemu.elf.dir/boot/vm.c.i"
	aarch64-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/yili/mos/boot/vm.c > CMakeFiles/mos_qemu.elf.dir/boot/vm.c.i

CMakeFiles/mos_qemu.elf.dir/boot/vm.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/mos_qemu.elf.dir/boot/vm.c.s"
	aarch64-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/yili/mos/boot/vm.c -o CMakeFiles/mos_qemu.elf.dir/boot/vm.c.s

CMakeFiles/mos_qemu.elf.dir/driver/uart.c.o: CMakeFiles/mos_qemu.elf.dir/flags.make
CMakeFiles/mos_qemu.elf.dir/driver/uart.c.o: ../driver/uart.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/yili/mos/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object CMakeFiles/mos_qemu.elf.dir/driver/uart.c.o"
	aarch64-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/mos_qemu.elf.dir/driver/uart.c.o   -c /home/yili/mos/driver/uart.c

CMakeFiles/mos_qemu.elf.dir/driver/uart.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/mos_qemu.elf.dir/driver/uart.c.i"
	aarch64-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/yili/mos/driver/uart.c > CMakeFiles/mos_qemu.elf.dir/driver/uart.c.i

CMakeFiles/mos_qemu.elf.dir/driver/uart.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/mos_qemu.elf.dir/driver/uart.c.s"
	aarch64-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/yili/mos/driver/uart.c -o CMakeFiles/mos_qemu.elf.dir/driver/uart.c.s

CMakeFiles/mos_qemu.elf.dir/init/main.c.o: CMakeFiles/mos_qemu.elf.dir/flags.make
CMakeFiles/mos_qemu.elf.dir/init/main.c.o: ../init/main.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/yili/mos/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object CMakeFiles/mos_qemu.elf.dir/init/main.c.o"
	aarch64-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/mos_qemu.elf.dir/init/main.c.o   -c /home/yili/mos/init/main.c

CMakeFiles/mos_qemu.elf.dir/init/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/mos_qemu.elf.dir/init/main.c.i"
	aarch64-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/yili/mos/init/main.c > CMakeFiles/mos_qemu.elf.dir/init/main.c.i

CMakeFiles/mos_qemu.elf.dir/init/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/mos_qemu.elf.dir/init/main.c.s"
	aarch64-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/yili/mos/init/main.c -o CMakeFiles/mos_qemu.elf.dir/init/main.c.s

CMakeFiles/mos_qemu.elf.dir/lib/asm.S.o: CMakeFiles/mos_qemu.elf.dir/flags.make
CMakeFiles/mos_qemu.elf.dir/lib/asm.S.o: ../lib/asm.S
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/yili/mos/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building ASM object CMakeFiles/mos_qemu.elf.dir/lib/asm.S.o"
	aarch64-elf-gcc $(ASM_DEFINES) $(ASM_INCLUDES) $(ASM_FLAGS) -o CMakeFiles/mos_qemu.elf.dir/lib/asm.S.o -c /home/yili/mos/lib/asm.S

CMakeFiles/mos_qemu.elf.dir/lib/cap.c.o: CMakeFiles/mos_qemu.elf.dir/flags.make
CMakeFiles/mos_qemu.elf.dir/lib/cap.c.o: ../lib/cap.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/yili/mos/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building C object CMakeFiles/mos_qemu.elf.dir/lib/cap.c.o"
	aarch64-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/mos_qemu.elf.dir/lib/cap.c.o   -c /home/yili/mos/lib/cap.c

CMakeFiles/mos_qemu.elf.dir/lib/cap.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/mos_qemu.elf.dir/lib/cap.c.i"
	aarch64-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/yili/mos/lib/cap.c > CMakeFiles/mos_qemu.elf.dir/lib/cap.c.i

CMakeFiles/mos_qemu.elf.dir/lib/cap.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/mos_qemu.elf.dir/lib/cap.c.s"
	aarch64-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/yili/mos/lib/cap.c -o CMakeFiles/mos_qemu.elf.dir/lib/cap.c.s

CMakeFiles/mos_qemu.elf.dir/lib/cpu.c.o: CMakeFiles/mos_qemu.elf.dir/flags.make
CMakeFiles/mos_qemu.elf.dir/lib/cpu.c.o: ../lib/cpu.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/yili/mos/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building C object CMakeFiles/mos_qemu.elf.dir/lib/cpu.c.o"
	aarch64-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/mos_qemu.elf.dir/lib/cpu.c.o   -c /home/yili/mos/lib/cpu.c

CMakeFiles/mos_qemu.elf.dir/lib/cpu.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/mos_qemu.elf.dir/lib/cpu.c.i"
	aarch64-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/yili/mos/lib/cpu.c > CMakeFiles/mos_qemu.elf.dir/lib/cpu.c.i

CMakeFiles/mos_qemu.elf.dir/lib/cpu.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/mos_qemu.elf.dir/lib/cpu.c.s"
	aarch64-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/yili/mos/lib/cpu.c -o CMakeFiles/mos_qemu.elf.dir/lib/cpu.c.s

CMakeFiles/mos_qemu.elf.dir/lib/env.c.o: CMakeFiles/mos_qemu.elf.dir/flags.make
CMakeFiles/mos_qemu.elf.dir/lib/env.c.o: ../lib/env.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/yili/mos/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building C object CMakeFiles/mos_qemu.elf.dir/lib/env.c.o"
	aarch64-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/mos_qemu.elf.dir/lib/env.c.o   -c /home/yili/mos/lib/env.c

CMakeFiles/mos_qemu.elf.dir/lib/env.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/mos_qemu.elf.dir/lib/env.c.i"
	aarch64-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/yili/mos/lib/env.c > CMakeFiles/mos_qemu.elf.dir/lib/env.c.i

CMakeFiles/mos_qemu.elf.dir/lib/env.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/mos_qemu.elf.dir/lib/env.c.s"
	aarch64-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/yili/mos/lib/env.c -o CMakeFiles/mos_qemu.elf.dir/lib/env.c.s

CMakeFiles/mos_qemu.elf.dir/driver/gicv2.c.o: CMakeFiles/mos_qemu.elf.dir/flags.make
CMakeFiles/mos_qemu.elf.dir/driver/gicv2.c.o: ../driver/gicv2.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/yili/mos/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building C object CMakeFiles/mos_qemu.elf.dir/driver/gicv2.c.o"
	aarch64-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/mos_qemu.elf.dir/driver/gicv2.c.o   -c /home/yili/mos/driver/gicv2.c

CMakeFiles/mos_qemu.elf.dir/driver/gicv2.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/mos_qemu.elf.dir/driver/gicv2.c.i"
	aarch64-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/yili/mos/driver/gicv2.c > CMakeFiles/mos_qemu.elf.dir/driver/gicv2.c.i

CMakeFiles/mos_qemu.elf.dir/driver/gicv2.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/mos_qemu.elf.dir/driver/gicv2.c.s"
	aarch64-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/yili/mos/driver/gicv2.c -o CMakeFiles/mos_qemu.elf.dir/driver/gicv2.c.s

CMakeFiles/mos_qemu.elf.dir/driver/kclock.c.o: CMakeFiles/mos_qemu.elf.dir/flags.make
CMakeFiles/mos_qemu.elf.dir/driver/kclock.c.o: ../driver/kclock.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/yili/mos/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Building C object CMakeFiles/mos_qemu.elf.dir/driver/kclock.c.o"
	aarch64-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/mos_qemu.elf.dir/driver/kclock.c.o   -c /home/yili/mos/driver/kclock.c

CMakeFiles/mos_qemu.elf.dir/driver/kclock.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/mos_qemu.elf.dir/driver/kclock.c.i"
	aarch64-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/yili/mos/driver/kclock.c > CMakeFiles/mos_qemu.elf.dir/driver/kclock.c.i

CMakeFiles/mos_qemu.elf.dir/driver/kclock.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/mos_qemu.elf.dir/driver/kclock.c.s"
	aarch64-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/yili/mos/driver/kclock.c -o CMakeFiles/mos_qemu.elf.dir/driver/kclock.c.s

CMakeFiles/mos_qemu.elf.dir/lib/kernel_elfloader.c.o: CMakeFiles/mos_qemu.elf.dir/flags.make
CMakeFiles/mos_qemu.elf.dir/lib/kernel_elfloader.c.o: ../lib/kernel_elfloader.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/yili/mos/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_12) "Building C object CMakeFiles/mos_qemu.elf.dir/lib/kernel_elfloader.c.o"
	aarch64-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/mos_qemu.elf.dir/lib/kernel_elfloader.c.o   -c /home/yili/mos/lib/kernel_elfloader.c

CMakeFiles/mos_qemu.elf.dir/lib/kernel_elfloader.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/mos_qemu.elf.dir/lib/kernel_elfloader.c.i"
	aarch64-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/yili/mos/lib/kernel_elfloader.c > CMakeFiles/mos_qemu.elf.dir/lib/kernel_elfloader.c.i

CMakeFiles/mos_qemu.elf.dir/lib/kernel_elfloader.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/mos_qemu.elf.dir/lib/kernel_elfloader.c.s"
	aarch64-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/yili/mos/lib/kernel_elfloader.c -o CMakeFiles/mos_qemu.elf.dir/lib/kernel_elfloader.c.s

CMakeFiles/mos_qemu.elf.dir/lib/pmap.c.o: CMakeFiles/mos_qemu.elf.dir/flags.make
CMakeFiles/mos_qemu.elf.dir/lib/pmap.c.o: ../lib/pmap.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/yili/mos/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_13) "Building C object CMakeFiles/mos_qemu.elf.dir/lib/pmap.c.o"
	aarch64-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/mos_qemu.elf.dir/lib/pmap.c.o   -c /home/yili/mos/lib/pmap.c

CMakeFiles/mos_qemu.elf.dir/lib/pmap.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/mos_qemu.elf.dir/lib/pmap.c.i"
	aarch64-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/yili/mos/lib/pmap.c > CMakeFiles/mos_qemu.elf.dir/lib/pmap.c.i

CMakeFiles/mos_qemu.elf.dir/lib/pmap.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/mos_qemu.elf.dir/lib/pmap.c.s"
	aarch64-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/yili/mos/lib/pmap.c -o CMakeFiles/mos_qemu.elf.dir/lib/pmap.c.s

CMakeFiles/mos_qemu.elf.dir/lib/print.c.o: CMakeFiles/mos_qemu.elf.dir/flags.make
CMakeFiles/mos_qemu.elf.dir/lib/print.c.o: ../lib/print.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/yili/mos/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_14) "Building C object CMakeFiles/mos_qemu.elf.dir/lib/print.c.o"
	aarch64-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/mos_qemu.elf.dir/lib/print.c.o   -c /home/yili/mos/lib/print.c

CMakeFiles/mos_qemu.elf.dir/lib/print.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/mos_qemu.elf.dir/lib/print.c.i"
	aarch64-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/yili/mos/lib/print.c > CMakeFiles/mos_qemu.elf.dir/lib/print.c.i

CMakeFiles/mos_qemu.elf.dir/lib/print.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/mos_qemu.elf.dir/lib/print.c.s"
	aarch64-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/yili/mos/lib/print.c -o CMakeFiles/mos_qemu.elf.dir/lib/print.c.s

CMakeFiles/mos_qemu.elf.dir/lib/printf.c.o: CMakeFiles/mos_qemu.elf.dir/flags.make
CMakeFiles/mos_qemu.elf.dir/lib/printf.c.o: ../lib/printf.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/yili/mos/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_15) "Building C object CMakeFiles/mos_qemu.elf.dir/lib/printf.c.o"
	aarch64-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/mos_qemu.elf.dir/lib/printf.c.o   -c /home/yili/mos/lib/printf.c

CMakeFiles/mos_qemu.elf.dir/lib/printf.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/mos_qemu.elf.dir/lib/printf.c.i"
	aarch64-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/yili/mos/lib/printf.c > CMakeFiles/mos_qemu.elf.dir/lib/printf.c.i

CMakeFiles/mos_qemu.elf.dir/lib/printf.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/mos_qemu.elf.dir/lib/printf.c.s"
	aarch64-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/yili/mos/lib/printf.c -o CMakeFiles/mos_qemu.elf.dir/lib/printf.c.s

CMakeFiles/mos_qemu.elf.dir/driver/psci.c.o: CMakeFiles/mos_qemu.elf.dir/flags.make
CMakeFiles/mos_qemu.elf.dir/driver/psci.c.o: ../driver/psci.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/yili/mos/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_16) "Building C object CMakeFiles/mos_qemu.elf.dir/driver/psci.c.o"
	aarch64-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/mos_qemu.elf.dir/driver/psci.c.o   -c /home/yili/mos/driver/psci.c

CMakeFiles/mos_qemu.elf.dir/driver/psci.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/mos_qemu.elf.dir/driver/psci.c.i"
	aarch64-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/yili/mos/driver/psci.c > CMakeFiles/mos_qemu.elf.dir/driver/psci.c.i

CMakeFiles/mos_qemu.elf.dir/driver/psci.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/mos_qemu.elf.dir/driver/psci.c.s"
	aarch64-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/yili/mos/driver/psci.c -o CMakeFiles/mos_qemu.elf.dir/driver/psci.c.s

CMakeFiles/mos_qemu.elf.dir/lib/sched.c.o: CMakeFiles/mos_qemu.elf.dir/flags.make
CMakeFiles/mos_qemu.elf.dir/lib/sched.c.o: ../lib/sched.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/yili/mos/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_17) "Building C object CMakeFiles/mos_qemu.elf.dir/lib/sched.c.o"
	aarch64-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/mos_qemu.elf.dir/lib/sched.c.o   -c /home/yili/mos/lib/sched.c

CMakeFiles/mos_qemu.elf.dir/lib/sched.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/mos_qemu.elf.dir/lib/sched.c.i"
	aarch64-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/yili/mos/lib/sched.c > CMakeFiles/mos_qemu.elf.dir/lib/sched.c.i

CMakeFiles/mos_qemu.elf.dir/lib/sched.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/mos_qemu.elf.dir/lib/sched.c.s"
	aarch64-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/yili/mos/lib/sched.c -o CMakeFiles/mos_qemu.elf.dir/lib/sched.c.s

CMakeFiles/mos_qemu.elf.dir/lib/spin_lock.c.o: CMakeFiles/mos_qemu.elf.dir/flags.make
CMakeFiles/mos_qemu.elf.dir/lib/spin_lock.c.o: ../lib/spin_lock.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/yili/mos/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_18) "Building C object CMakeFiles/mos_qemu.elf.dir/lib/spin_lock.c.o"
	aarch64-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/mos_qemu.elf.dir/lib/spin_lock.c.o   -c /home/yili/mos/lib/spin_lock.c

CMakeFiles/mos_qemu.elf.dir/lib/spin_lock.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/mos_qemu.elf.dir/lib/spin_lock.c.i"
	aarch64-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/yili/mos/lib/spin_lock.c > CMakeFiles/mos_qemu.elf.dir/lib/spin_lock.c.i

CMakeFiles/mos_qemu.elf.dir/lib/spin_lock.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/mos_qemu.elf.dir/lib/spin_lock.c.s"
	aarch64-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/yili/mos/lib/spin_lock.c -o CMakeFiles/mos_qemu.elf.dir/lib/spin_lock.c.s

CMakeFiles/mos_qemu.elf.dir/lib/syscall_all.c.o: CMakeFiles/mos_qemu.elf.dir/flags.make
CMakeFiles/mos_qemu.elf.dir/lib/syscall_all.c.o: ../lib/syscall_all.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/yili/mos/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_19) "Building C object CMakeFiles/mos_qemu.elf.dir/lib/syscall_all.c.o"
	aarch64-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/mos_qemu.elf.dir/lib/syscall_all.c.o   -c /home/yili/mos/lib/syscall_all.c

CMakeFiles/mos_qemu.elf.dir/lib/syscall_all.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/mos_qemu.elf.dir/lib/syscall_all.c.i"
	aarch64-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/yili/mos/lib/syscall_all.c > CMakeFiles/mos_qemu.elf.dir/lib/syscall_all.c.i

CMakeFiles/mos_qemu.elf.dir/lib/syscall_all.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/mos_qemu.elf.dir/lib/syscall_all.c.s"
	aarch64-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/yili/mos/lib/syscall_all.c -o CMakeFiles/mos_qemu.elf.dir/lib/syscall_all.c.s

CMakeFiles/mos_qemu.elf.dir/lib/trap.c.o: CMakeFiles/mos_qemu.elf.dir/flags.make
CMakeFiles/mos_qemu.elf.dir/lib/trap.c.o: ../lib/trap.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/yili/mos/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_20) "Building C object CMakeFiles/mos_qemu.elf.dir/lib/trap.c.o"
	aarch64-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/mos_qemu.elf.dir/lib/trap.c.o   -c /home/yili/mos/lib/trap.c

CMakeFiles/mos_qemu.elf.dir/lib/trap.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/mos_qemu.elf.dir/lib/trap.c.i"
	aarch64-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/yili/mos/lib/trap.c > CMakeFiles/mos_qemu.elf.dir/lib/trap.c.i

CMakeFiles/mos_qemu.elf.dir/lib/trap.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/mos_qemu.elf.dir/lib/trap.c.s"
	aarch64-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/yili/mos/lib/trap.c -o CMakeFiles/mos_qemu.elf.dir/lib/trap.c.s

# Object files for target mos_qemu.elf
mos_qemu_elf_OBJECTS = \
"CMakeFiles/mos_qemu.elf.dir/boot/start.S.o" \
"CMakeFiles/mos_qemu.elf.dir/boot/vm.c.o" \
"CMakeFiles/mos_qemu.elf.dir/driver/uart.c.o" \
"CMakeFiles/mos_qemu.elf.dir/init/main.c.o" \
"CMakeFiles/mos_qemu.elf.dir/lib/asm.S.o" \
"CMakeFiles/mos_qemu.elf.dir/lib/cap.c.o" \
"CMakeFiles/mos_qemu.elf.dir/lib/cpu.c.o" \
"CMakeFiles/mos_qemu.elf.dir/lib/env.c.o" \
"CMakeFiles/mos_qemu.elf.dir/driver/gicv2.c.o" \
"CMakeFiles/mos_qemu.elf.dir/driver/kclock.c.o" \
"CMakeFiles/mos_qemu.elf.dir/lib/kernel_elfloader.c.o" \
"CMakeFiles/mos_qemu.elf.dir/lib/pmap.c.o" \
"CMakeFiles/mos_qemu.elf.dir/lib/print.c.o" \
"CMakeFiles/mos_qemu.elf.dir/lib/printf.c.o" \
"CMakeFiles/mos_qemu.elf.dir/driver/psci.c.o" \
"CMakeFiles/mos_qemu.elf.dir/lib/sched.c.o" \
"CMakeFiles/mos_qemu.elf.dir/lib/spin_lock.c.o" \
"CMakeFiles/mos_qemu.elf.dir/lib/syscall_all.c.o" \
"CMakeFiles/mos_qemu.elf.dir/lib/trap.c.o"

# External object files for target mos_qemu.elf
mos_qemu_elf_EXTERNAL_OBJECTS = \
"/home/yili/mos/user/pingpong.bin" \
"/home/yili/mos/user/test0.bin" \
"/home/yili/mos/user/test1.bin" \
"/home/yili/mos/user/test2.bin" \
"/home/yili/mos/user/test3.bin" \
"/home/yili/mos/user/test4.bin" \
"/home/yili/mos/user/idle.bin" \
"/home/yili/mos/user/fktest.bin"

mos_qemu.elf: CMakeFiles/mos_qemu.elf.dir/boot/start.S.o
mos_qemu.elf: CMakeFiles/mos_qemu.elf.dir/boot/vm.c.o
mos_qemu.elf: CMakeFiles/mos_qemu.elf.dir/driver/uart.c.o
mos_qemu.elf: CMakeFiles/mos_qemu.elf.dir/init/main.c.o
mos_qemu.elf: CMakeFiles/mos_qemu.elf.dir/lib/asm.S.o
mos_qemu.elf: CMakeFiles/mos_qemu.elf.dir/lib/cap.c.o
mos_qemu.elf: CMakeFiles/mos_qemu.elf.dir/lib/cpu.c.o
mos_qemu.elf: CMakeFiles/mos_qemu.elf.dir/lib/env.c.o
mos_qemu.elf: CMakeFiles/mos_qemu.elf.dir/driver/gicv2.c.o
mos_qemu.elf: CMakeFiles/mos_qemu.elf.dir/driver/kclock.c.o
mos_qemu.elf: CMakeFiles/mos_qemu.elf.dir/lib/kernel_elfloader.c.o
mos_qemu.elf: CMakeFiles/mos_qemu.elf.dir/lib/pmap.c.o
mos_qemu.elf: CMakeFiles/mos_qemu.elf.dir/lib/print.c.o
mos_qemu.elf: CMakeFiles/mos_qemu.elf.dir/lib/printf.c.o
mos_qemu.elf: CMakeFiles/mos_qemu.elf.dir/driver/psci.c.o
mos_qemu.elf: CMakeFiles/mos_qemu.elf.dir/lib/sched.c.o
mos_qemu.elf: CMakeFiles/mos_qemu.elf.dir/lib/spin_lock.c.o
mos_qemu.elf: CMakeFiles/mos_qemu.elf.dir/lib/syscall_all.c.o
mos_qemu.elf: CMakeFiles/mos_qemu.elf.dir/lib/trap.c.o
mos_qemu.elf: ../user/pingpong.bin
mos_qemu.elf: ../user/test0.bin
mos_qemu.elf: ../user/test1.bin
mos_qemu.elf: ../user/test2.bin
mos_qemu.elf: ../user/test3.bin
mos_qemu.elf: ../user/test4.bin
mos_qemu.elf: ../user/idle.bin
mos_qemu.elf: ../user/fktest.bin
mos_qemu.elf: CMakeFiles/mos_qemu.elf.dir/build.make
mos_qemu.elf: ../kernel.lds
mos_qemu.elf: CMakeFiles/mos_qemu.elf.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/yili/mos/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_21) "Linking C executable mos_qemu.elf"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/mos_qemu.elf.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/mos_qemu.elf.dir/build: mos_qemu.elf

.PHONY : CMakeFiles/mos_qemu.elf.dir/build

CMakeFiles/mos_qemu.elf.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/mos_qemu.elf.dir/cmake_clean.cmake
.PHONY : CMakeFiles/mos_qemu.elf.dir/clean

CMakeFiles/mos_qemu.elf.dir/depend: ../user/pingpong.bin
CMakeFiles/mos_qemu.elf.dir/depend: ../user/test0.bin
CMakeFiles/mos_qemu.elf.dir/depend: ../user/test1.bin
CMakeFiles/mos_qemu.elf.dir/depend: ../user/test2.bin
CMakeFiles/mos_qemu.elf.dir/depend: ../user/test3.bin
CMakeFiles/mos_qemu.elf.dir/depend: ../user/test4.bin
CMakeFiles/mos_qemu.elf.dir/depend: ../user/idle.bin
CMakeFiles/mos_qemu.elf.dir/depend: ../user/fktest.bin
	cd /home/yili/mos/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/yili/mos /home/yili/mos /home/yili/mos/build /home/yili/mos/build /home/yili/mos/build/CMakeFiles/mos_qemu.elf.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/mos_qemu.elf.dir/depend

