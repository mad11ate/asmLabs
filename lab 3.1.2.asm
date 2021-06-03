.586
.model flat, stdcall
extern ExitProcess@4:near

includelib C:\masm32\lib\user32.lib
includelib C:\masm32\lib\kernel32.lib

data segment
    X DB 3
    Y DB 3
    Z DB 2
    RESULT DB ?
data ends

text segment
start:
    MOV AL, X
    ADD AL, Y
    ADD AL, Z
    MOV BL, X

    MOV AL, X
    MUL Y
    MUL Z

    CMP AL, BL
    JB EVENTONE
    MOV BL, AL
    EVENTONE:
    MOV RESULT, BL
    push 0
    call ExitProcess@4
 text ends
 end start 