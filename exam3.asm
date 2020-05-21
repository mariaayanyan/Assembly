%include "io.inc"
section .text
global CMAIN
CMAIN:
    GET_UDEC 4, eax
    test eax, eax
    jz .end
    GET_DEC 4, esi
    cmp esi, 0
    jge .continue
    neg esi
.continue:    
    dec eax
    test eax, eax
    jz .print
    
.l1:
    GET_DEC 4, ebx
    cmp ebx, 0
    jge .pos
    neg ebx
.pos:
    cmp ebx, esi
    jge .skip
    mov esi, ebx
.skip:
    dec eax
    test eax, eax
    jnz .l1    
    
    
.print:
    PRINT_DEC 4, esi
.end:
    xor eax, eax
    ret