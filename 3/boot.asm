[org 0x7c00]
[bits 16]

mov [BOOT_DRIVE], dl
mov bp, 0x8000
mov sp, bp

mov bx, 0x9000
mov dh, 5
mov dl, [BOOT_DRIVE]
call disk_load

mov dx, [0x9000]
call print_hex

mov dx, [0x9000 + 512]
call print_hex

jmp $

%include "print/print_string.asm"
%include "print/print_hex.asm"
%include "disk/disk_load.asm"

; Variables
BOOT_DRIVE: db 0 ; BOOT_DRIVE is 1 disk


; Bootsector padding
TIMES 510 - ($-$$) db 0	        ;Fill the rest of sector with 0
DW 0xAA55

times 256 dw 0xdada
times 256 dw 0xface