%include "io.inc"
section .bss
    x resd 4
    y resd 4

section .text
sort:
    push ebp
    mov ebp, esp; eax -> n, esi -> n-1
    
    xor ebx, ebx
    xor ecx, ecx
    mov edi, [ebp + 8]      
.i: 
    lea ecx, [ebx + 1]
    mov edx, [edi + 4*ebx]
.j:
    cmp [edi + 4*ecx], edx
    jge .continue
    xchg edx, [edi + 4*ecx]
    mov [edi + 4*ebx], edx
            
.continue:
    inc ecx
    cmp ecx, eax
    jl .j
        
    inc ebx
    cmp ebx, esi
    jl .i 

    
    mov esp, ebp
    pop ebp
    ret
    
global CMAIN
CMAIN:
    push ebp
    mov ebp, esp
    
    xor ecx, ecx    
.inp:
    GET_DEC 4, [x + 4*ecx]
    GET_DEC 4, [y + 4*ecx]
    inc ecx
    cmp ecx, 4
    jl .inp
    
    mov eax, 4
    mov esi, 3
    push x
    call sort
    
    push y 
    call sort
    
    GET_DEC 4, eax
    GET_DEC 4, ebx
    
    cmp eax, [x]
    jle .no
    cmp eax, [x+8]
    jge .no
    
    cmp ebx, [y]
    jle .no
    cmp ebx, [y+8]
    jge .no
   
     
    PRINT_STRING "YES"  
    jmp .fin
     
.no:
    PRINT_STRING "NO"
   
.fin:
    mov esp, ebp
    pop ebp   
    xor eax, eax 
    ret