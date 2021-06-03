.586
.model flat, stdcall
extern ExitProcess@4:near

includelib /masm32/lib/user32.lib
includelib /masm32/lib/kernel32.lib
data segment

N EQU 3 ; —“–Œ » 
M EQU 4 ; —“ŒÀ¡÷€

B DW M DUP(?)

A DW 3, 4, 5, 2,
     0, 2, 0, 3,
     1, 8, 1, 2
data ends

text segment
start:

MOV ECX, M
JCXZ MN1
MOV EBX, 0

L1: 
    PUSH CX
    MOV CX, N
    JCXZ MN1
    MOV ESI, 0
    MOV AX, A[EBX]
L2: 
    CMP AX, A[EBX][ESI]
    JG SKP
        MOV AX, A[EBX][ESI]
    SKP:
    ADD ESI, 2*M
    LOOP L2

    MOV B[EBX], AX
    ADD EBX, 2

    POP CX
LOOP L1

MN1:

push 0
call ExitProcess@4
text ends
end start