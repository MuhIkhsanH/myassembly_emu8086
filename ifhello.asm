.model small
.stack 100h

.data
prompt db 'Masukkan Teks: $'
newline db 13,10,'$'

buffer db 20
db 0
db 20 dup(0)

hello_str db 'hello'
suffix db ' too$'


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

mov si, offset buffer + 2
mov di, offset hello_str
mov cx, 5

compare_loop:
mov al, [si]
cmp al, [di]
jne not_hello
inc si
inc di
loop compare_loop


mov si, offset buffer
mov cl, [si+1]
mov bx, si
add bx, 2
add bx, cx
mov byte ptr [bx], '$'

lea dx, buffer +2
mov ah, 09h
int 21h

lea dx, suffix
mov ah, 09h
int 21h
jmp selesai

not_hello:
lea dx, buffer + 2
mov ah, 09h
int 21h

selesai:
mov ah, 4Ch
int 21h

end main




; [SOURCE]: C:\EMU8086\MySource\ifhello.asm
