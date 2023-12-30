NAME=pidAndKill

all: pidAndKill

clean:
	rm -rf pidAndKill pidAndKill.o

pidAndKill: pidAndKill.asm
	nasm -f elf -F dwarf -g pidAndKill.asm
	gcc -no-pie -g -m32 -o pidAndKill pidAndKill.o /usr/local/share/csc314/driver.c /usr/local/share/csc314/asm_io.o
