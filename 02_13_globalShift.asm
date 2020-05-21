%include "io.inc"
section .bss
    arr resd 1000000
    first resd 1

section .text
global CMAIN
CMAIN:
    GET_DEC 4, eax ; n
    test eax, eax
    jz .end
    xor ecx, ecx
    
.input:
    GET_UDEC 4, [arr + 4*ecx]
    inc ecx
    cmp ecx, eax
    jl .input
    
    GET_DEC 4, ecx ; k
    mov ebx, 1
    shl ebx, cl
    dec ebx ; 2^k - 1
    
    mov edx, ebx
    mov esi, eax
    dec esi
    and edx, [arr + 4*esi]
    shr dword[arr + 4*esi], cl
    mov [first], edx ; first
    dec esi
    
.l1:
    mov edx, ebx    
    and edx, [arr + 4*esi]
    shr dword[arr + 4*esi], cl
    mov edi, ecx
    sub ecx, 32
    neg ecx
    shl edx, cl
    xchg edi, ecx
    inc esi
    or dword[arr + 4*esi], edx
    sub esi, 2
    cmp esi, 0
    jge .l1
    
    mov edx, [first]
    sub ecx, 32
    neg ecx
    shl edx, cl
    or dword[arr], edx
    
    xor ecx, ecx
.print:
    PRINT_UDEC 4, [arr + 4*ecx]
    PRINT_CHAR ' '
    inc ecx
    cmp ecx, eax
    jl .print
                            
        
.end:    
    xor eax, eax
    ret