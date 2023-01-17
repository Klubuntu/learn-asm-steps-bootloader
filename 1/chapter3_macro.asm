mov ah, 0x0e ; int=10/ah=0x0e -> BIOS tele - type output

%macro print_char 1
   ; xor al, al
   mov al, %1
   int 0x10
%endmacro

print_char "A"
print_char "B"
print_char "C"
print_char "D"

; Padding and magic BIOS number.
times 510-($-$$) db 0
dw 0xAA55