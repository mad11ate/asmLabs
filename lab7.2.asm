.586
.model flat, stdcall
extern ExitProcess@4:near

includelib /masm32/lib/user32.lib
includelib /masm32/lib/kernel32.lib
data segment

N EQU 9 
A DW 1, -2, 3, 0, -3, 6, 1, 2, -1  
;   10  -1 10  1  -2 10 10 10   0
data ends

text segment

start:
    MOV ECX, N	
    JCXZ FIN	
    MOV ESI, 0	
L:
    CMP A[ESI], 0	
    JG MLE
    INC A[ESI]    			
    JMP MGE			
    MLE:
        MOV A[ESI], 10  
    MGE: ADD ESI, 2		
LOOP L
FIN: 

push 0
call ExitProcess@4
text ends
end start

