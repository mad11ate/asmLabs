.586
.model flat, stdcall
extern ExitProcess@4:near

includelib C:/masm32/lib/user32.lib
includelib C:/masm32/lib/kernel32.lib

data segment
    Y DB 0
    Z DB 0
    X DB 0
    ERR DB 0
    RESULT DB ?
data ends

text segment
START:
    MOV AL, 3
    MUL Y
    MUL Z
    MOV BL, AL

    MOV AL, 1
    ADD AL, X
    MUL AL
    MOV CL, AL

    MOV AX, 2
    CMP CL, 0
    JE ERROR
    DIV CL

    SUB BL, AL
    JC ERROR 
    ADD BL, 4  
    MOV RESULT, BL
    JMP SKIP
    
    ERROR: MOV ERR, 1
    SKIP: 
    
    push 0
    call ExitProcess@4
text ends
end start