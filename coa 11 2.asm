  .org 100h
 mov ah, 01h
 int 21h
 sub al, '0'
 mov bl, al
 mov cl, al
 mov al, 1
 factorial_loop:
mul cl
 dec cl
 jnz factorial_loop
 add al, '0'
 mov dl, al
 mov ah, 02h
 int 21h
 mov ah, 4Ch
 int 21h