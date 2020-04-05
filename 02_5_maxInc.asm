%include "io.inc"
section .text
global CMAIN
CMAIN:
    GET_DEC 4, ecx
    xor eax, eax; ans
    xor edx, edx; cur count
    
.l1:
    GET_DEC 4, ebx
    test eax, eax
    jnz .check
    inc eax
    jmp .continue
.check:
    cmp ebx, esi
    jg .continue
    mov edi, edx
    xor edx, edx
    cmp edi, eax
    jle .continue
    mov eax, edi    
.continue:
    inc edx
    mov esi, ebx; prev
    loop .l1
    
    cmp edx, eax
    jle .print
    mov eax, edx
   
.print:
    PRINT_DEC 4, eax
    
    
    
            
    xor eax, eax
    ret