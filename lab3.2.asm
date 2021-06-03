.586
.model flat, stdcall
extern ExitProcess@4:near

includelib C:\masm32\lib\user32.lib
includelib C:\masm32\lib\kernel32.lib

data segment
    X DB 33
    Y DB 11
data ends

text segment
start:
    CMP X, -1
    JLE EVENTONE
    CMP X, 18
    JLE EVENTTWO
    CMP X, 32
    JLE EVENTTHREE
    MOV AL, 2
    SUB AL, X
    MOV Y, AL
    JMP PROGEND
    EVENTONE: MOV AL, 1
    MOV Y, AL
    JMP PROGEND
    EVENTTWO: NEG X
    MOV AL, X
    MOV Y, AL
    JMP PROGEND
    EVENTTHREE: MOV AL, 0
    MOV Y, AL
    PROGEND:
    push 0
    call ExitProcess@4
 text ends
 end start 