%include "io.inc"
section .bss
section .text
global CMAIN
CMAIN:
    GET_DEC 4, ecx
    mov ebx, 1
.l1:
    inc ebx
    mov eax, ecx
    cdq
    div ebx
    test edx, edx
    jz .print
    
    mov edx, ebx
    imul edx, edx
    cmp edx, ecx
    jle .l1
 
    mov ebx, ecx
 
.print:
    mov eax, ecx
    cdq
    div ebx
    PRINT_DEC 4, eax
    
    xor eax, eax
    ret
    
    
    
    
    
    