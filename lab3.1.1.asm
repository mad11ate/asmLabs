.586
.model flat, stdcall
extern ExitProcess@4:near

includelib C:\masm32\lib\user32.lib
includelib C:\masm32\lib\kernel32.lib

data segment
    X DB 4
    Y DB 3
    Z DB 1
    RESULT DB ?
data ends

text segment
start:
    MOV AL, 2
    MUL Z
    ADD AL, X
    MOV BL, AL

    MOV AL, Z
    ADD AL, y
    MOV CL, AL

    MOV AL, 3
    MUL Z

    CMP AL, BL
    JB EVENTONE
    MOV AL, BL
    EVENTONE: CMP AL, CL
    JB EVENTTWO
    MOV AL, CL
    EVENTTWO: 
    MOV RESULT, AL
    push 0
    call ExitProcess@4
 text ends
 end start 