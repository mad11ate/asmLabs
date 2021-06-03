.586
.model flat, stdcall
extern ExitProcess@4:near
includelib C:\masm32\lib\user32.lib
includelib C:\masm32\lib\kerne32.lib
data segment
    A DB 2
    b DB 3
    CC DB 2
    D DW 6
    E DB 2
    F DW ?
 data ends

text segment
start:
    MOV AL, A
    MUL B
    MOV DX, AX
    MOV AX, D
    DIV E
    MOV BH, 0
    MOV BX, AX
    MOV AL, CC
    MOV AH, 0
    ADD DX, AX
    SUB DX, BX
    MOV F, DXs
    push 0
    call ExitProcess@4
text ends
end start
