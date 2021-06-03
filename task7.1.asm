.586
.model flat, stdcall
extern ExitProcess@4:near

includelib /masm32/lib/user32.lib
includelib /masm32/lib/kernel32.lib
data segment

N EQU 9 
A DB 1, 2, 3, 4, 5, 6, 7, 8, 9 
CNT DB ?

data ends

text segment

start:

    MOV ECX, N 	
    MOV DL, 0	
    MOV BL, 3	
    JCXZ FIN	
    MOV ESI, 0	
L:
    MOV AL, A[ESI]	
    MOV AH, 0		
    DIV BL			
    CMP AH, 0		
    JE ME			
    INC DL  		
    ME: 
    INC ESI			
LOOP L				
FIN: MOV CNT, DL	

push 0
call ExitProcess@4
text ends
end start