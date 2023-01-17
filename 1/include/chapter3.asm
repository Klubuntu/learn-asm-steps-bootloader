;A simple boot sector program that demonstrates addressing.

; First attempt
; mov al, the_secret
; int 0x10 ; Does this print an X?

; ; Second attempt
; mov al, [the_secret]
; int 0x10 ; Does this print an X?

; Third attempt
mov bx, the_secret2
add bx, 0x7c00
; add - bx = bx + 0x7c00
mov al, [bx]
int 0x10 ; Does this print an X?

; Fourth attempt
mov al, [0x7c1e]
int 0x10 ; Does this print an X?
; jmp $ ; Jump forever

the_secret: db "X"
the_secret2: db "Hello User",0 ; only printing Start and End char [hr]

; Padding generater ERROR
; Like: error: TIMES value -4 is negative

; [var] - var on ascii