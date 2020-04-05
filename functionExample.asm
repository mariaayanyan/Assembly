;int callee(int x, int y, int z)
;{
;   int k = x + y + x;
;   return k;
;}

;int caller(void)
;{
;	return callee(1, 2, 3) + 5;
;}

%include "io.inc"
section .text
callee:
    push ebp
    mov ebp, esp ;      enter

    ;[ebp +] -> parameter   
    ;[ebp -] -> local    
        
    sub esp, 4
    ; [ebp - 4] -> k
    ; [ebp] -> old ebp
    ; [ebp + 4] -> old eip
    ; [ebp + 8] -> x
    ; [ebp + 12] -> y
    ; [ebp + 16] -> z

    mov eax, [ebp + 8]
    add eax, [ebp + 12]
    add eax, [ebp + 16]
    
    mov [ebp - 4], eax
    
    mov esp, ebp 
    pop ebp ;leave
    ret

caller:
    push ebp
    mov ebp, esp
                    
    push 3
    push 2
    push 1    
    call callee ; push eip; jmp foo
    add eax, 5      
    
    mov esp, ebp
    pop ebp ; mov ebp, [esp]; add esp, 4
    ret     ; pop eip
    
    
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging 
    ;write your code here
    push ebp
    mov ebp, esp
    
    call caller
    PRINT_DEC 4, eax
    
    mov esp, ebp
    pop ebp
    xor eax, eax
    ret