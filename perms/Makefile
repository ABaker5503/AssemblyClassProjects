NAME=perms

all: perms

clean:
	rm -rf perms perms.o

perms: perms.asm
	nasm -f elf -F dwarf -g perms.asm
	gcc -no-pie -g -m32 -o perms perms.o /usr/local/share/csc314/driver.c /usr/local/share/csc314/asm_io.o
