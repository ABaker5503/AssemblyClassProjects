NAME=memory2

all: memory2

clean:
	rm -rf memory2 memory2.o

memory2: memory2.asm
	nasm -f elf -F dwarf -g memory2.asm
	gcc -no-pie -g -m32 -o memory2 memory2.o /usr/local/share/csc314/driver.c /usr/local/share/csc314/asm_io.o
