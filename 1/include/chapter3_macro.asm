org 0x7c00
mov ah, 0x0e ; int=10/ah=0x0e -> BIOS tele - type output

; %include "include/print_string2.asm"

%macro print_char 1
   ; xor al, al
   mov al, %1
   int 0x10
%endmacro

; print string macro
%macro prints 1
    pusha
    mov ah, 0x0e
    mov bx, %1
print_string_loop:
    mov al, [bx]
    int 0x10
    add bx, 1
    cmp al, 0
    jne print_string_loop
    popa
    ret
%endmacro

; prints HelloString2
ret
; Infinite loop to hang the program



HelloString2 db 'Hello World', 0	    ;HelloWorld string ending with 0

; %macro cls 0
;    call cls
; %endmacro

; cls:
; 	pusha
; 	mov al, 03h
; 	mov ah, 00h
; 	int 10h
; 	popa
; 	ret


GOODBYE_MSG:
   db 'Goodbye!', 0


; print_string:
;     ; set up parameters for print_string
;     mov ah, 0x0E
;     mov al, [message]
;     mov bx, 0x0007
;     int 0x10
;     inc message
;     cmp byte [message], 0
;     jne print_string
;     ret

; Padding generater ERROR
; Like: error: TIMES value -4 is negative