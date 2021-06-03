.586
.model flat, stdcall
extern ExitProcess@4:near

includelib /masm32/lib/user32.lib
includelib /masm32/lib/kernel32.lib
data segment

N EQU 3 ; ÑÒÐÎÊÈ 
M EQU 4 ; ÑÒÎËÁÖÛ

B DB M DUP(?)

A DB 3, 4, 5, 2,  ;120(78h)
     1, 2, 4, 3,  ;24(18h)
     1, 8, 1, 2  ;16(10h) 
data ends

text segment
start:

MOV ECX, M
JCXZ MN1
MOV EBX, 0
MOV EDI, 0


L1: 
    PUSH CX
    MOV CX, N
    JCXZ MN1
    MOV ESI, 0
    MOV DL, 0
L2: 
    ADD DL, A[EBX][ESI] 
    ADD ESI, M
    LOOP L2

    MOV B[EBX], DL
    INC EBX 

    POP CX
LOOP L1

MN1:

push 0
call ExitProcess@4
text ends
end start
