%include "io.inc"
section .text
sort:
    cmp eax, ebx
    jle s1
    xchg eax, ebx 
    s1:
    cmp eax, edx
    jle s2
    xchg eax, edx
    s2:
    cmp ebx, edx
    jle s3
    xchg ebx, edx
    s3:
    ret
    

global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    GET_DEC 4, ecx
    GET_DEC 4, eax
    GET_DEC 4, ebx
    GET_DEC 4, edx
    
    call sort
    
    sub ecx, 3
    test ecx, ecx
    jz print
    lp:
    GET_DEC 4, esi
    cmp esi, edx
    jl l1
    
    mov eax, ebx
    mov ebx, edx
    mov edx, esi
    jmp fin
    
    l1:
    cmp esi, ebx
    jl l2
        
    mov eax, ebx    
    mov ebx, esi
    jmp fin
    
    l2:
    cmp esi, eax
    jl fin
    mov eax, esi
        
    fin:
    loop lp
    
    print:
    PRINT_DEC 4, edx
    PRINT_CHAR ' '
    PRINT_DEC 4, ebx
    PRINT_CHAR ' '
    PRINT_DEC 4, eax
    
    xor eax, eax
    ret