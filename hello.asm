org 100h

mov ah, 9
mov dx, offset msg
int 21h

mov ah, 4Ch
int 21h

msg db 'Hello, World!$'
