org 100h
 mov ah, 01h
 int 21h
 sub al, '0'
 mov cl, al
 mov al, 0
mov bl, 1
 cmp cl, 1
 je display_al
 cmp cl, 2
 je display_bl
 mov ch, 2
 next_term:
 mov dl, al
 add al, bl
 mov bl, dl
 inc ch
 cmp ch, cl
 jne next_term
 display_al:
 add al, '0'
 mov dl, al
 mov ah, 02h
 int 21h
 jmp end_program
 display_bl:
 add bl, '0'
 mov dl, bl
 mov ah, 02h
 int 21h
 end_program:
 mov ah, 4Ch
 int 21h