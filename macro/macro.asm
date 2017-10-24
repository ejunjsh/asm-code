
section .text

    %macro PRINT 1
        jmp %%astr
        %%str db %1, 0
        %%strln equ $-%%str
        %%astr: _syscall_write %%str, %%strln
    %endmacro

    %macro _syscall_write 2
        mov rax, 1
        mov rdi, 1
        mov rsi, %1
        mov rdx, %2
        syscall
    %endmacro

    %macro exit 0
        ;; exit
        mov	rax, 60
        mov	rdi, 0
        syscall
    %endmacro

	global	_start

    _start:
        PRINT "hello world"
        exit