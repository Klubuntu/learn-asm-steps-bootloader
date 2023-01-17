; Print the string whose address is in `bx`, segment `ds`
; String is zero terminated
;


hello_world:
    db 'Hello, World !', 0

print_string:
    pusha ; save the current state of all general purpose registers
    mov ax, 0x1301 ; set video mode
    int 0x10
    mov bx, hello_world ; set the address of the string to be displayed

loop:
    mov al, [ds:bx] ; load the next character from the string
    cmp al, 0 ; check if the character is the null terminator
    je return ; if it is, exit the loop
    mov ah, 0x0e ; set the video mode to display the character
    int 0x10 ; display the character
    inc bx ; move the pointer to the next character in the string
    jmp loop

return:
    popa ; restore the original state of all general purpose registers
    ; ret ; return to the caller

; loop:
;     mov al, [ds:bx] ; load the next character from the string
;     cmp al, 0 ; check if the character is the null terminator
;     je return ; if it is, exit the loop
;     mov ah, 0x0e ; set the video mode to display the character
;     int 0x10 ; display the character
;     inc bx ; move the pointer to the next character in the string
;     jmp loop

; return:
;     popa ; restore the original state of all general purpose registers
;     ret ; return to the caller


; Endless loading _ 
;
; print_string:
;     pusha

; loop1:
;    mov al, [ds:bx]   ; load what `bx` points to #COMMENT THIS GENERATING MATRIX
;    cmp al, 0
;    je return1
;    push bx        ; save bx
;    mov ah, 0x0e   ; load this every time through the loop
;                   ; you don't know if `int` preserves it
;    xor al, al
;    int 0x10
;    jmp loop1

; return1:
