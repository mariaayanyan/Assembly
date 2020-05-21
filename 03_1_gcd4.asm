;02.11
%include "io.inc"

section .text

gcd:
    .l1:
    
    cmp ebx, 0    
    jz .exit 
    
    cdq
    div ebx
    mov eax, edx
    xchg ebx, eax
    jmp .l1
    
    .exit:
    ret

global CMAIN
CMAIN:
    GET_DEC 4, eax
    GET_DEC 4, ebx
    call gcd
    GET_DEC 4, ebx
    call gcd
    GET_DEC 4, ebx
    call gcd
    PRINT_DEC 4, eax
        
    xor eax, eax
    ret