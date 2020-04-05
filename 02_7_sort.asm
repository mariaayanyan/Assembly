%include "io.inc"
section .bss
    arr resd 10000
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    GET_DEC 4, eax
    xor ecx, ecx
    mov esi, eax
    dec esi
    
.l1:
    GET_DEC 4, [arr + 4*ecx ]
    inc ecx
    cmp ecx, eax
    jl .l1
        
    test esi, esi
    jz .fin
    
    xor ebx, ebx
    xor ecx, ecx    
.i: 
    lea ecx, [ebx + 1]
    mov edx, [arr + 4*ebx]
.j:
    cmp [arr + 4*ecx], edx
    jge .continue
    xchg edx, [arr + 4*ecx]
    mov [arr + 4*ebx], edx
            
.continue:
    inc ecx
    cmp ecx, eax
    jl .j
        
    inc ebx
    cmp ebx, esi
    jl .i    
   
.fin: 
    xor ecx, ecx
.print:
    PRINT_DEC 4, [arr + 4*ecx]
    PRINT_CHAR ' '
    inc ecx
    cmp ecx, eax
    jl .print    
    
    xor ecx, ecx
.print:
    PRINT_DEC 4, [x + 4*ecx]
    PRINT_CHAR ' '
    inc ecx
    cmp ecx, eax
    jl .print    
    
        
    xor eax, eax
    ret