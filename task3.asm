%include "io.inc"

section .text
global CMAIN
CMAIN:
    ;write your code here
    GET_DEC 4, eax
    mov ebx, eax
    shl eax, 1
    shl ebx, 2
    add eax, ebx
    
    PRINT_DEC 4, eax
        
    xor eax, eax
    ret