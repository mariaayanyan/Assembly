%include "io.inc"
section .bss
    a resd 10000
    b resd 10000
    c resd 10000
    n resd 1
    m resd 1
    k resd 1
section .text
input:
    push ebp
    mov ebp, esp
    
    ;matrix esi*edi
    
    mov esi, [ebp + 8]
    mov edi, [ebp + 12]
    mov ecx, [ebp + 16]
    xor eax, eax
    
.ini:
    xor ebx, ebx
.inj:    
    GET_DEC 4, [ecx]
    add ecx, 4
    inc ebx
    cmp ebx, edi
    jl .inj
    
    inc eax
    cmp eax, esi
    jl .ini
    
    mov esp, ebp
    pop ebp
    ret
    
    
print:
    push ebp
    mov ebp, esp
    
    ;matrix esi*edi
    
    mov esi, [ebp + 8]
    mov edi, [ebp + 12]
    mov ecx, [ebp + 16]
    xor eax, eax
    
.pri:
    xor ebx, ebx
.prj:    
    PRINT_DEC 4, [ecx]
    PRINT_CHAR ' '
    add ecx, 4
    inc ebx
    cmp ebx, edi
    jl .prj
    
    NEWLINE
    inc eax
    cmp eax, esi
    jl .pri
    
    mov esp, ebp
    pop ebp
    ret
    
    
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    push ebp
    mov ebp, esp
    
    GET_DEC 4, n
    GET_DEC 4, m
    GET_DEC 4, k
    
    push a
    push dword[m]
    push dword[n]
    call input
    
    push b
    push dword[k]
    push dword[m]
    call input
   
    xor eax, eax
    xor ebx, ebx
    xor ecx, ecx    
    xor esi, esi
    xor edi, edi  
.i:    
    xor ebx, ebx
    mov edx,    
.k:
    xor ecx, ecx
    mov [c + esi], 0
.j:
    
    
    
    inc ecx
    cmp ecx, [m]
    jl .j
    
    add esi, 4
    inc ebx
    cmp ebx, [k]
    jl .k
    
    inc eax
    cmp eax, [n]
    jl .i
    
    
    
    
    push c
    push dword[k]
    push dword[n]
    call print
    
    
    mov esp, ebp
    pop ebp
    xor eax, eax
    ret