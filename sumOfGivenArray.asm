%include "io.inc"
section .data
    x dd 15, 45, 76, 62, 35
section .text
global CMAIN
CMAIN:
    ;write your code here
    xor ecx, ecx
    xor eax, eax
    .l1:
        add eax, [x+4*ecx]
        inc ecx
        cmp ecx, 5
        jge .l2
        jmp .l1
    .l2:
        PRINT_DEC 4, eax 
     
    xor eax, eax
    ret