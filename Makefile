.PHONY: hello sum stack

all: hello sum stack

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

clean:
	rm -rf bin/