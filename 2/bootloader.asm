[org 0x7c00]
[bits 16]

%include "include/print.asm"

; number: dw 0822
message: db "MV",0
; print_hex number
printss message




TIMES 510 - ($ - $$) db 0	        ;Fill the rest of sector with 0
DW 0xAA55			                ;Add boot signature at the end of bootloader