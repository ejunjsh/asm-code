.PHONY: hello sum stack reverse

all: hello sum stack reverse

hello:
	mkdir -p bin
	nasm -f elf64 -o bin/hello.o hello/hello.asm
	ld -o bin/hello bin/hello.o

sum:
	mkdir -p bin
	nasm -f elf64 -o bin/sum.o sum/sum.asm
	ld -o bin/sum bin/sum.o

stack:
	mkdir -p bin
	nasm -f elf64 -o bin/stack.o stack/stack.asm
	ld -o bin/stack bin/stack.o

reverse:
	mkdir -p bin
	nasm -f elf64 -o bin/reverse.o reverse/reverse.asm
	ld -o bin/reverse bin/reverse.o

clean:
	rm -rf bin/