BITS 16                     ; Real mode 16 bits
ORG 0x7C00                  ; BIOS loads MBR in this address

start:
    mov ah, 0x0E            ; TTY service on the high part
    mov al, 'A'             ; Character to print on the lower part
    int 0x10                ; Call BIOS to print

hang:
    jmp hang                ; Infinite loop

times 510 - ($ - $$) db 0   ; Padding to 510bytes
dw 0xAA55                   ; Signature of MBR
