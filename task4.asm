%include "io.inc"
section .bss
    x resd 1
    y resd 1

section .text
global CMAIN
CMAIN:
    ;write your code here
    GET_DEC 4, [x]
    mov eax, [x]
    mov ebx, eax
    mov ecx, eax
    
    shl ebx, 5
    shr eax, 3
    sub ebx, eax
    
    mov eax, ecx
    shr ecx, 4
    shl ecx, 4
    sub eax, ecx
    
    add ebx, eax    
    mov [y], ebx
    
    PRINT_DEC 4, [y] 
    
    xor eax, eax
    ret