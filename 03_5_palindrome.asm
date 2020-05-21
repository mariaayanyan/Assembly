%include "io.inc"
section .text
reverse:
    push ebp
    mov ebp, esp

    mov ebx, 10
    mov eax, ecx
    xor edi, edi
    
.rev:
    test eax, eax
    jz .end        
    xor edx, edx
    div ebx
    imul edi, 10
    add edi, edx
    jmp .rev
            
.end:    
    mov eax, edi
    mov esp, ebp
    pop ebp
    ret

global CMAIN
CMAIN:
    GET_UDEC 4, ecx
    GET_UDEC 4, esi
    
.l1:
    test esi, esi
    jz .fin
    call reverse
    add ecx, eax
    dec esi    
    jmp .l1
    
.fin:
    call reverse
    cmp eax, ecx
    jz .yes
    PRINT_STRING "No"
    xor eax, eax
    ret
    
.yes:
    PRINT_STRING "Yes"
    NEWLINE
    PRINT_UDEC 4, ecx    
    xor eax, eax
    ret