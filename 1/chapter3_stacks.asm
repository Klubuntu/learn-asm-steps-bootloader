;
; A simple boot sector program that demonstrates the stack.
;
mov ah, 0x0e      ; int 10/ ah = 0eh -> scrolling teletype BIOS routine
mov bp, 0x8000    ; Set the base of the stack a little above where BIOS
mov sp, bp        ; loads our boot sector - so it won ’t overwrite us.
push 'BIURO'      ; Push some characters on the stack for later
push 'POLSKIE'    ; retreival. Note , these are pushed on as
push 'NOWE'       ; 16 - bit values , so the most significant byte
                  ; will be added by our assembler as 0 x00.
pop bx            ; Note , we can only pop 16 - bits , so pop to bx
mov al, bl        ; then copy bl ( i.e. 8- bit char ) to al
int 0x10          ; print (al)
pop bx            ; Pop the next value
mov al, bl
int 0x10          ; print (al)
mov al, [0x7ffe]  ; To prove our stack grows downwards from bp ,
                  ; fetch the char at 0 x8000 - 0x2 ( i.e. 16 - bits )
int 0x10          ; print (al)
jmp $             ; Jump forever.

; Padding and magic BIOS number.
times 510-($-$$) db 0
dw 0xAA55

; Code displaying only first char on push 'var'

; Compare Languages

;; C - JAVA
; if( ax == 4) {
; bx = 23;
; } else {
; bx = 45;
; }

;; ASM
; cmp ax, 4        ; compare the value in ax to 4
; je then_block     ; jump to then_block if they were equal
; mov bx, 45       ; otherwise , execute this code
; jmp the_end       ; important : jump over the ’then ’ block ,
;                   ; so we don ’t also execute that code.
; then_block :
;    mov bx, 23
; the_end :

