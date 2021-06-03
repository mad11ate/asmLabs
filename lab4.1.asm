.586
.model flat, stdcall
extern ExitProcess@4:near

includelib C:/masm32/lib/user32.lib
includelib C:/masm32/lib/kernel32.lib

data segment
    Y DB 3
    Z DB 1
    X DB 0
    ERR DB 0
    RESULT DB ?
data ends

text segment
START:
    MOV AL, 3
    IMUL Y
    JO ERROR 
    IMUL Z
    JO ERROR 
    MOV BL, AL

    MOV AL, 1
    ADD AL, X
    JO ERROR 
    IMUL AL
    JO ERROR 
    MOV CL, AL

    MOV AX, 2
    CMP CL, 0
    JE ERROR
    IDIV CL

    SUB BL, AL
    JO ERROR 
    ADD BL, 4  
    JO ERROR 
    MOV RESULT, BL
    JMP SKIP
    
    ERROR: MOV ERR, 1
    SKIP: 
    
    push 0
    call ExitProcess@4
text ends
end start