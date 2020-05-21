%include "io.inc"
section .data
a dd 0, 0, 1, 3
c dw 0, 0, 1, 4
section .bss
b resd 4


section .text

;void * memcpy ( void * destination, const void * source, size_t num );
_memcpy:
    push ebp
    mov ebp, esp
    
    cld
    
    push edi
    push esi
    
    mov edi, [ebp + 8]; dest
    mov eax, edi
    mov esi, [ebp + 12]; source
    mov ecx, [ebp + 16]; count
    test ecx, ecx
    jz .skip
    rep movsb

    pop esi
    pop edi
.skip:    
    pop esp
    ret

;void * memmove ( void * destination, const void * source, size_t num );
_memmove:
    push ebp
    mov ebp, esp
    
    
    
    pop ebp
    ret    
    
global CMAIN
CMAIN:
    ;write your code here
    ;df = direction flag, 0 -> +, 1 -> -
    
    cld
    
    mov esi, a
    mov edi, b
    mov ecx, 4
.l1:
    movsd
    loop .l1
    ;movsb, movsw, movsd
    
    cld
    ;mov eax, [esi]; source
    ;add esi, 4  
    ;lodsd   
    
    ;stosd -> store string
    ;cld
    ;mov edi, b; destination
    ;mov [edi], eax
    ;add edi, 4    
         
    mov ecx, 4
    mov esi, c
    mov edi, b
    xor eax, eax
    
.loop:
    lodsw
    stosd
    loop .loop
    
    cld
    mov ecx, 4                  
    mov esi, a                         
    mov edi, b
    rep movsd; do while ecx != 0                                                      
    
    ;compares the arrays
    ;mov ecx, 4                   
    ;mov esi, a                         
    ;mov edi, b
    ;repe cmpsd
    ;then some shit for the last pair of elements, я хз
    
    ;find the first index of mismatching elements
    ;repz -> while ecx != 0 && zf == 1, same as repe                                                                                    
    ;repne, repnz                                                                                                                                                                                    
     
    ;scas -> scan string
    ;cld
    ;mov ecx, 4
    ;mov edi, b
    ;repne scasd                                                                                                                                                                                                                                                                         
    
    ;rep
    ;   movs
    ;   lods
    ;   stos
    ;   ins
    ;   outs  
    
    ;repe/z repne/nz                                                                                                                                                                                                                                                                                                                                                                      
    ;cmps
    ;scas
    
    push 16
    push a
    push b
    call _memcpy
    add esp, 12
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
    xor eax, eax
    ret