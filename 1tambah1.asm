.model small
.stack 100h

.data
prompt db 'Masukkan Nama: $'
newline db 13,10,'$'
buffer db 20
db 0
db 20 dup(0)


output_msg db 'Halo, $'


.code
main:
mov ax, @data
mov ds, ax

mov ah, 09h
lea dx, prompt
int 21h

mov ah, 0Ah
lea dx, buffer
int 21h

mov ah, 09h
lea dx, newline
int 21h

mov ah, 09h
lea dx, output_msg
int 21h

mov si, offset buffer
mov cl, [si+1]
mov bx, si
add bx, 2
add bx, cx
mov byte ptr [bx], '$'

lea dx, buffer+2
mov ah, 09h
int 21h

mov ah, 4Ch
int 21h


end main
