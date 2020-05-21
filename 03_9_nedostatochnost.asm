%include "io.inc"
section .text
isNedostatochnoe:
    push ebp
    mov ebp, esp
    
    push ecx;  
    push ebx; 
    mov ecx, edi; sum
    neg ecx
    mov ebx, 1; div
    cmp edi, 1
    je .out
    
.loop:
    xor edx, edx
    mov eax, edi    
    div ebx
    test edx, edx
    jnz .nope
    add ecx, ebx
    add ecx, eax
.nope:    
    inc ebx
    push ebx
    imul ebx, ebx
    cmp ebx, edi
    pop ebx
    jl .loop
    
    push ebx
    imul ebx, ebx
    cmp ebx, edi
    pop ebx
    jg .out 
    add ecx, ebx
    
.out:
    xor eax, eax 
    cmp ecx, edi
    jge .ret
    inc eax   
.ret:    
    pop ebx    
    pop ecx            
    mov esp, ebp
    pop ebp
    ret

global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    GET_DEC 4, ebx; k
    xor ecx, ecx; counter
    mov edi, 1; current number
.l1:
    call isNedostatochnoe
    test eax, eax
    jz .sk
    inc ecx
    mov esi,edi; answer
.sk:
    inc edi
    cmp ebx, ecx
    jne .l1
    
    PRINT_DEC 4, esi
    
    xor eax, eax
    ret