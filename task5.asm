%include "io.inc"

section .text
global CMAIN
CMAIN:
    ;write your code here
    mov eax, 0xfffffbee 
    rol eax, 4
    
    PRINT_HEX 2, ax
    
    xor eax, eax
    ret