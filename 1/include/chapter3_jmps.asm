mov ah, 0x0e ; int=10/ah=0x0e -> BIOS tele - type output
mov bx, 50 ; DECLARE BX=50

; if (bx <= 4){
;    mov al, "A"
; }
; else if (bx < 40) {
;    mov al, "B"
; }
; else {
;    mov al, "C"
; }

cmp bx, 4 ; IF CODE
jle arg1 ; IF CODE

cmp bx, 40 ; ELSE IF CODE
jl arg2 ; ELSE IF CODE

jmp arg3 ; ELSE CODE

; jmp $

arg1:
   mov al, "A"
   jmp end
arg2:
   mov al, "B"
   jmp end
arg3:
   mov al, "C"
   jmp end
end:


int 0x10 ; print the character in al

; Padding generater ERROR
; Like: error: TIMES value -4 is negative
