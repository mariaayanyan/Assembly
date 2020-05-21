%include "io.inc"
section .text
func:
    push ebp
    mov ebp, esp
    
    xor eax, eax
    test ecx, ecx
    jz .out
    
    push edx
    xor edx, edx
    mov eax, ecx
    div ebx
    
    mov ecx, eax
    xor eax, eax
    
    test edx, 1
    jz .sk
    inc eax
.sk:
    pop edx
    push eax
    call func
    add eax, [esp]
.out:
    mov esp, ebp
    pop ebp
    ret

global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    GET_UDEC 4, ecx
    mov ebx, 3
    
    call func
    PRINT_DEC 4, eax
    
    xor eax, eax
    ret