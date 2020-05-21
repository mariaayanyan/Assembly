%include "io.inc"
section .text
func:
    push ebp
    mov ebp, esp
    
    GET_DEC 4, eax
    test eax, eax
    jz .end
    push eax
    call func       
    PRINT_DEC 4, [esp]
    PRINT_CHAR ' '  
    
.end:    
    mov esp, ebp
    pop ebp
    ret

global CMAIN
CMAIN:
    call func
    
    xor eax, eax
    ret