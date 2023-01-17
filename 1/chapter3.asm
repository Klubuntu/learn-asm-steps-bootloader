;A simple boot sector program that demonstrates addressing.

mov ah, 0x0e ; int 10/ ah = 0eh -> scrolling teletype BIOS routine

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
jmp $ ; Jump forever

the_secret: db "X"
the_secret2: db "Hello User",0 ; only printing Start and End char [hr]

times 510-($-$$) db 0
dw 0xAA55

; [var] - var on ascii