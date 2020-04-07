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
    xor esi, esi  
.i: ;eax   
    xor ebx, ebx  
.j: ;ebx
    xor ecx, ecx
    mov dword[c + esi], 0
.l: ;ecx
    mov edx, [m]
    imul edx, eax
    add edx, ecx
    mov edx, [a+4*edx]
    
    mov edi, [k]
    imul edi, ecx
    add edi, ebx
    mov edi, [b+4*edi]
     
    imul edx, edi
    add [c+esi], edx  
    
    inc ecx
    cmp ecx, [m]
    jl .l
    
    add esi, 4
    inc ebx
    cmp ebx, [k]
    jl .j
    
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
