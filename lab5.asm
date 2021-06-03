.586
.model flat, stdcall
extern ExitProcess@4:near
includelib C:\masm32\lib\user32.lib
includelib C:\masm32\lib\kerne32.lib
data segment
    SUM DW ?
    TWO DB 2
    N EQU 8
 data ends

text segment
start:
    MOV DX, 1
    MOV BX, 0
    MOV CL, 1
    
    REPEAT: CMP CL, N
    JE FINISH
    MOV AX, DX
    DIV TWO
    CMP AH, 0
    JNE SKIP
        MOV AL, DL
        MUL AL
        ADD BX, AX
    SKIP: INC DX
    INC CL
    JMP REPEAT
    
    FINISH: MOV SUM, BX 
    push 0
    call ExitProcess@4
text ends
end start