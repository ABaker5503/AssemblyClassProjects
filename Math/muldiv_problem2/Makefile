NAME=muldiv_problem2

all: muldiv_problem2

clean:
	rm -rf muldiv_problem2 muldiv_problem2.o

muldiv_problem2: muldiv_problem2.asm
	nasm -f elf -F dwarf -g muldiv_problem2.asm
	gcc -no-pie -g -m32 -o muldiv_problem2 muldiv_problem2.o /usr/local/share/csc314/driver.c /usr/local/share/csc314/asm_io.o
