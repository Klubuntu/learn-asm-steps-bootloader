[org 0x7c00]

mov bp, 0x9000
mov sp, bp
mov bx, MSG_REAL_MODE
call print_string

call switch_to_pm

jmp $

%include "mode/gdt.asm"
%include "print/print_string.asm"
%include "print/print_string_pm.asm"
%include "mode/switch_to_pm.asm"

; Variables
; BOOT_DRIVE: db 0 ; BOOT_DRIVE is 1 disk

[bits 32]

BEGIN_PM:
   ; on protect mode using e + [reg], example: eax, ebx
   mov ebx, MSG_PROT_MODE
   call print_string_pm
   jmp $

; Other Variables
MSG_REAL_MODE db "Loaded 16 bit Real-Mode", 0
MSG_PROT_MODE db "Switched to 32 bit Protect-Mode", 0

; Bootsector padding
TIMES 510-($-$$) db 0	        ;Fill the rest of sector with 0
DW 0xAA55