%include "include/print_hex.asm"
%include "include/print_string.asm"

%macro print_hex 1
   pusha
   mov dx, %1
   call print_hex
   popa
%endmacro

%macro printss 1
   pusha
   mov bx, %1
   call print_string
   popa
%endmacro