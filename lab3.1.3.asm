.586
.model flat, stdcall
extern ExitProcess@4:near

includelib C:\masm32\lib\user32.lib
includelib C:\masm32\lib\kernel32.lib

data segment
    X DB 7
    Y DB 11
    Z DB 15
    RESULT DB ?
data ends

text segment
start:
    MOV AL, X
    CMP AL, Y
    JB EVENTONE
    MOV AL, Y
    EVENTONE: CMP AL, Z
    JB EVENTTWO
    MOV AL, Z
    EVENTTWO: 
    MOV RESULT, AL
    push 0
    call ExitProcess@4
 text ends
 end start 