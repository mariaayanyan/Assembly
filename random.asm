%include "io.inc"
section .bss
x1 resd 1
y1 resd 1
x2 resd 1
y2 resd 1
x3 resd 1
y3 resd 1
section .text
global CMAIN
CMAIN:
    GET_DEC 4,x1
    GET_DEC 4,y1
    GET_DEC 4,x2
    GET_DEC 4,y2
    GET_DEC 4,x3
    GET_DEC 4,y3
    mov eax,dword [x2]
    sub eax,dword [x1];(eax=x2-x1)
    mov ebx,dword [y3]
    sub ebx,dword [y1];(ebx=y3-y1)
    mov ecx,dword [y2]
    sub ecx,dword [y1];(ecx=y2-y1)
    mov edx,dword [x3]
    sub edx,dword [x1];(edx=x3-x1)
    imul eax,ebx;(eax=eax*ebx)
    imul ecx,edx;(ecx=ecx*edx)
    sub eax,ecx;(eax=eax-ecx)
    mov ebx,eax
    sar ebx,31
    add eax,ebx
    xor eax,ebx
    mov ecx,2
    cdq
    idiv ecx
    imul edx,5
    PRINT_DEC 4,eax
    PRINT_CHAR "."
    PRINT_DEC 4,edx
    xor eax, eax
    ret