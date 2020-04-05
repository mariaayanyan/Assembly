%include "io.inc"
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    GET_UDEC 4, eax
    GET_DEC 4, ecx
    mov ebx, ecx
    mov edx, 1
    shl edx, cl
    dec edx
    sub ebx, 32
    neg ebx; count
    
    xor esi, esi; max
    xor ecx, ecx; shift
    
    inc ebx
.l1:
    mov edi, edx
    and edi, eax
    shr edi, cl
    cmp edi, esi
    jb .continue
    mov esi, edi
.continue:
    shl edx, 1
    inc ecx
    dec ebx
    test ebx, ebx
    jnz .l1
    
    PRINT_UDEC 4, esi
            
    xor eax, eax
    ret