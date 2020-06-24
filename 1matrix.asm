model small
.stack 100h
delay macro time
local ext, iter
push cx
mov cx, time
ext:
push cx
mov cx, 50000
iter:
loop iter
pop cx
loop ext
pop cx
endm

.data
n equ 10
x db 0
y db 0
k dw ?
yy db 0
buf equ 1
.code
start:
mov ax, @data
mov ds, ax
xor ax, ax
mov ah, 05
mov al, 00
int 10h

cycl1:
mov k, 10
push cx
mov cx, n

ustk:
mov ah, 02
mov dh, x; высота
mov dl, y; ширина
int 10h

ekr:
mov ah, 10
mov al, "#"
mov cx, buf
int 10h
mov cx, k
inc x
inc y
dec k
mov dh, x
mov dl, y
loop ustk
delay 20000

nekr:
mov x, 0
mov al, yy
mov y, al
;mov ah, 02
;int 10h
;mov ah, 10
;mov al, 0
;int 10h
    mov ah,0            ;очищаем экран установкой стандартного текстового видеорежима
    mov al,3
    int 10h

inc yy

pop cx
loop cycl1

exit:
mov ax, 4c00h
int 21h
end start