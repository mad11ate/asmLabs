.586
.model flat, stdcall
extern ExitProcess@4:near

includelib /masm32/lib/user32.lib
includelib /masm32/lib/kernel32.lib
data segment

N EQU 9 
;A DB 2, 1, 6, 0, 2, 1, 0, 2, 9 
A DB -2, -1, -6, -10, -2, -1, -10, -2, -9 
MAX DB ?

data ends

text segment

start:
    MOV DL, A
    MOV ECX, N-1		
    JCXZ FIN
    MOV ESI, 0
	
L:
    INC ESI
    CMP A[ESI], DL
    JL SKP
        MOV DL, A[ESI]
    SKP:		
LOOP L
MOV MAX, DL				
FIN: 

push 0
call ExitProcess@4
text ends
end start
