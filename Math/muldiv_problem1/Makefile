NAME=muldiv_problem1

all: muldiv_problem1

clean:
	rm -rf muldiv_problem1 muldiv_problem1.o

muldiv_problem1: muldiv_problem1.asm
	nasm -f elf -F dwarf -g muldiv_problem1.asm
	gcc -no-pie -g -m32 -o muldiv_problem1 muldiv_problem1.o /usr/local/share/csc314/driver.c /usr/local/share/csc314/asm_io.o
