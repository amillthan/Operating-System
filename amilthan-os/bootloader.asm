; bootloader.asm
[org 0x7c00]         ; BIOS loads boot sector to 0x7C00

start:
    mov si, message  ; SI points to the start of the message

print_loop:
    lodsb            ; Load byte at DS:SI into AL, then increment SI
    cmp al, 0        ; End of string?
    je hang          ; If yes, jump to end
    mov ah, 0x0E     ; BIOS teletype function
    int 0x10         ; Call BIOS interrupt to print AL
    jmp print_loop   ; Repeat for next character

hang:
    jmp $            ; Infinite loop to stop execution

message db 'hello, welcome Amilthan OS', 0

; Padding to fill up 512 bytes
times 510 - ($ - $$) db 0
dw 0xAA55            ; Boot signature (must be at end)
