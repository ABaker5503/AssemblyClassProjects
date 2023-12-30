NAME=KrabbyPattiesCook

all: KrabbyPattiesCook

clean:
	rm -rf KrabbyPattiesCook KrabbyPattiesCook.o

KrabbyPattiesCook: KrabbyPattiesCook.asm
	nasm -f elf -F dwarf -g KrabbyPattiesCook.asm
	gcc -no-pie -g -m32 -o KrabbyPattiesCook KrabbyPattiesCook.o /usr/local/share/csc314/driver.c /usr/local/share/csc314/asm_io.o
