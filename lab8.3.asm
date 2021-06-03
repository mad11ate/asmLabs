.586
.model flat, stdcall
extern ExitProcess@4:near

includelib /masm32/lib/user32.lib
includelib /masm32/lib/kernel32.lib
data segment

N EQU 3 ; —“–Œ » 
M EQU 4 ; —“ŒÀ¡÷€

B DW M DUP(1)

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
    
L2: 
    CMP A[EBX], 0
    JNE SKP
        MOV B[EBX], 0
        JMP OUTQ
    SKP:
    ADD ESI, 2*M
    LOOP L2

    OUTQ:
    ADD EBX, 2

    POP CX
LOOP L1

MN1:

push 0
call ExitProcess@4
text ends
end start