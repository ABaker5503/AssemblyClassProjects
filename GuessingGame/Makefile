NAME=GuessingGame

all: GuessingGame

clean:
	rm -rf GuessingGame GuessingGame.o

GuessingGame: GuessingGame.asm
	nasm -f elf -F dwarf -g GuessingGame.asm
	gcc -no-pie -g -m32 -o GuessingGame GuessingGame.o /usr/local/share/csc314/driver.c /usr/local/share/csc314/asm_io.o
