link:
	ld -m elf_i386 -Ttext 0x7c00 --oformat binary *.o -o kernel.bin
compile:
	as --32 boot.s -o boot.o
compile-kernel:
	gcc -m32 -ffreestanding -O2 -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables -fomit-frame-pointer -fno-pie -c kernel.c -o kernel.o 
