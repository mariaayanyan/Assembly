%include "io.inc"
section .text
global CMAIN
CMAIN:
    GET_DEC 4, eax
    mov ebx, 10
.l1:
    cdq
    idiv ebx
    cmp edx, 7
    jne .skip
    PRINT_STRING "YES"
    xor eax, eax
    ret
    
.skip:
    test eax, eax
    jnz .l1
    
    PRINT_STRING "NO"
    xor eax, eax
    ret