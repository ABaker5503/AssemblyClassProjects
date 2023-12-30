NAME=SortingIntegers

all: SortingIntegers

clean:
	rm -rf SortingIntegers SortingIntegers.o

SortingIntegers: SortingIntegers.asm
	nasm -f elf -F dwarf -g SortingIntegers.asm
	gcc -no-pie -g -m32 -o SortingIntegers SortingIntegers.o /usr/local/share/csc314/driver.c /usr/local/share/csc314/asm_io.o
