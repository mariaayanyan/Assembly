%include "io.inc"
section .data
x dd 17 ; int foo(int& i)

section .text

add4: ; void add4(int& x);
    push ebp
    mov ebp, esp
    ; [ebp] -> old ebp
    ; [ebp + 4] -> old eip
    ; [ebp + 8] -> address of x
    
    mov eax, [ebp + 8] ; eax is the address of x (eax == x; eax != [x])
    add dword [eax], 4
            
    mov esp, ebp
    pop ebp
    ret

global CMAIN
CMAIN:
    push ebp
    mov ebp, esp
    
    push x
    call add4
    
    PRINT_DEC 4, x
    
    mov esp, ebp
    pop ebp
    xor eax, eax
    ret