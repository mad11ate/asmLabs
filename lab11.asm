.586
.model flat, stdcall
extern ExitProcess@4:near
includelib C:\masm32\lib\user32.lib
includelib C:\masm32\lib\kernel32.lib

data segment
   ARR1 DW 3, 4, 1, 2, 2, 0
   ARR2 DW 1, 1, 4, 4, 9, 6, 2
   
   N1 EQU 6
   N2 EQU 7
data ends

text segment
start:
    LEA EBX, ARR1
    MOV ECX, N1
    JCXZ SKPFRST
    CALL MAT

    SKPFRST:
    LEA EBX, ARR2
    MOV ECX, N2
    JCXZ FNSH
    CALL MAT
    
    FNSH:
push 0
call ExitProcess@4

MAT PROC
    PUSH AX
    RPT:
        MOV AX, [EBX]
        TEST AX, 1
        JNZ F1
            ADD AX, 2 
            MOV [EBX], AX
        F1:
        ADD EBX, 2
    LOOP RPT
    POP AX
    RET
MAT ENDP

text ends
end start
