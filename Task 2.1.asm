%include "io.inc"
section .text
global CMAIN
CMAIN:
    GET_DEC 4, ecx
    ;mov eax, -2147483648
    mov eax, 0xFFFFFFFF80000000
    
    .start:     
        GET_DEC 4, ebx
        cmp ebx, eax
        jle .decr
        mov eax, ebx
        
    .decr:  
        dec ecx
        test ecx, ecx
        jnz .start
        
    PRINT_DEC 4, eax
                   
    xor eax, eax
    ret
    
    
    
    
    
    