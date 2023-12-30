NAME=hw_libc

all: hw_libc

clean:
	rm -rf hw_libc hw_libc.o

hw_libc: hw_libc.asm
	nasm -f elf -F dwarf -g hw_libc.asm
	gcc -no-pie -g -m32 -o hw_libc hw_libc.o /usr/local/share/csc314/driver.c /usr/local/share/csc314/asm_io.o
