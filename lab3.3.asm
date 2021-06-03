.586
.model flat,stdcall
extern ExitProcess@4:near

includelib c:\masm32\lib\user32.lib
includelib c:\masm32\lib\kernel32.lib

data segment

x db 1
y db 9
u db ?

data ends

text segment
start:
mov bl, x

;x^2+(y+8)^2<=64
mov al, bl
imul al
mov dx,ax

mov al,y
add al,8
imul al

add dx,ax

cmp dx,64
jle m1
jmp fin

;y<=-1
m1:
cmp y,-1 
jle m2
jmp fin

;x+y>=-16
m2: 
mov al,bl
add al,y
cmp al,-16
jge fin2

fin:mov u,bl
jmp k
fin2:mov u,3
k:

push 0 
call ExitProcess@4
text ends
end start