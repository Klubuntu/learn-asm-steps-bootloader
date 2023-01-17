[org 0x7c00 ]

; mov ah, 0x0e ; int=10/ah=0x0e -> BIOS tele - type output

%include "include/chapter3.asm"
%include "include/chapter3_jmps.asm"
%include "include/chapter3_macro.asm"

; msg1 db 'Hello, world!', 0xa

mov bx, msg1

print_char " "
print_char "|"
print_char "O"
print_char "T"
print_char "H"
print_char "E"
print_char "R"
print_char " "
print_char "I"
print_char "M"
print_char "P"
print_char "O"
print_char "R"
print_char "T"
print_char "|"
print_char " "
print_char " "
; prints msg1
; prints 'Teraz jest 22:43'

message1 db 'Hello, World!', 0
message2 db 'This is another message', 0

mov bx, message1
prints
mov bx, message2
prints

; jmp $


msg1:
   db 'Welcome', 0

HelloString db 'Hi User', 0

; Padding and magic BIOS number.
times 510-($-$$) db 0
dw 0xAA55