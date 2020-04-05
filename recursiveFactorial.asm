%include "io.inc"
section .text
factorial:
    cmp ecx, 0
    je exit
    dec ecx
    call factorial
    inc ecx
    mul ecx
    jmp fin
exit:
    mov eax, 1
fin:
    ret
global CMAIN
CMAIN:
    mov ecx, 5
    call factorial
    PRINT_DEC 4, eax
    xor eax, eax
    ret