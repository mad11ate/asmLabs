.586
.model flat, stdcall
extern ExitProcess@4:near

includelib /masm32/lib/user32.lib
includelib /masm32/lib/kernel32.lib

data segment
    X DW 2
    Y DW 1
    Z DW ?

data ends
 
text segment
start:
    MOV AX, X
    MOV BX, Y
    CALL MAT

    CMP DX, 4
    JL NORMAL
    SUB DX, 3
    JMP FINISH

    NORMAL:
    SUB AX, 2
    INC BX
    CALL MAT

    FINISH:
    MOV Z, DX

    push 0
    call ExitProcess@4

MAT PROC ; 2x + 2y
    PUSH AX
    PUSH BX
    ADD AX, AX
    ADD BX, BX
    ADD AX, BX
    MOV DX, AX
    POP BX
    POP AX
    RET
MAT ENDP

text ends
end start