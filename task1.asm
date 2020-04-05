%include "io.inc"
section .bss
    a resd 1
    b resd 1
    c resd 1
    d resd 1
section .text
global CMAIN
CMAIN:
    GET_DEC 4, [a]
    GET_DEC 4, [b]
    GET_DEC 4, [c]
    GET_DEC 4, [d]
    
    mov eax, [a]
    and eax, [b]
    not eax
    
    mov ebx, [c]
    not ebx
    and ebx, [d]
    or eax, ebx
    
    mov ebx, [d]
    not ebx
    and ebx, [c]
    or eax, ebx     
    mov [a], eax
    
    PRINT_DEC 4, [a]  
    
    xor eax, eax
    ret
    
;int a, b, c, d;
;cin >> a >> b >> c >> d;
;a = ~(a&b)|((~c&d)|(c&~d));    