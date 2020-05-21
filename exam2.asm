%include "io.inc"
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    GET_UDEC 4, eax
    mov ebx, 10
    xor esi, esi
.l1:
    xor edx, edx
    div ebx
    test edx, 1
    jz .skip
    add esi, edx
    
.skip:
    test eax, eax
    jnz .l1
    
    PRINT_DEC 4, esi
    xor eax, eax
    ret