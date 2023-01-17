mov ah, 0x0e ; int=10/ah=0x0e -> BIOS tele - type output

mov al, "H"
call print_text

mov al, "e"
call print_text

mov al, "l"
call print_text

mov al, "l"
call print_text

mov al, "o"
call print_text

mov al, " "
call print_text

mov al, "U"
call print_text

mov al, "s"
call print_text

mov al, "e"
call print_text

mov al, "r"
call print_text
xor al, al


print_text:
   int 0x10
   ret

; Padding and magic BIOS number.
times 510-($-$$) db 0
dw 0xAA55