[BITS 16]	                        ;Tells the assembler that its a 16 bit code
[ORG 0x7C00]	                    ;Origin, tell the assembler that where the code will
				                  ;   be in memory after it is been loaded

PrintCharacter:
    ; Print the character in AL
    mov ah, 0x0E
    mov bh, 0x00
    mov bl, 0x07
    int 0x10
   ;  ret

PrintString:
    next_character:
        ; Get the next character from the string
        mov al, [si]
        inc si
        ; Check if the                                                                                                                                                                                                              character is the null terminator
        cmp al, 0
        je exit_function
        ; Print the character
        call PrintCharacter
        jmp next_character
    exit_function:
        ret
