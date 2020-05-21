%include "io.inc"
section .bss
    arr resd 1000
section .text
count:
    xor eax, eax
.cl:
    shr edx, 1
    jc .sk
    inc eax
.sk:     
    test edx, edx
    jnz .cl
    
    ret
global CMAIN
CMAIN:
    GET_DEC 4, ebx; n
    xor esi, esi; index
    test ebx, ebx
    jnz .inp
    
    PRINT_DEC 4, 0
    xor eax, eax
    ret
    
.inp:
    GET_UDEC 4, [arr + 4*esi]
    inc esi    
    cmp esi, ebx
    jne .inp
    
    GET_DEC 4, ecx; k
    xor esi, esi; index
    xor edi, edi; ans

.loop:
    mov edx, [arr + 4*esi]
    call count
    cmp eax, ecx
    jne .inc
    inc edi
.inc:  
    inc esi
    cmp esi, ebx
    jne .loop
              
    PRINT_DEC 4, edi        
    xor eax, eax
    ret