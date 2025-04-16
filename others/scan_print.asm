.model small
.stack 100h
.data
    num dw ?            ; Variable to store the number
    newline db 13, 10, "$"  ; New line

.code    
main proc
    mov ax, @data
    mov ds, ax

    ; Scan multi-digit number
    call scan_number

    ; Print the scanned number
    call print_number

    ; Exit program
    mov ax, 4c00h
    int 21h
main endp

scan_number proc
    mov ax, 0        ; Clear AX register (for storing number)
    mov bx, 10       ; Multiplier for decimal conversion
scan_loop:
    mov ah, 1        ; Read character
    int 21h
    cmp al, 13       ; Enter key pressed?
    je store_number
    sub al, 48       ; Convert ASCII to number
    mul bx           ; Multiply previous value by 10
    add ax, ax       ; Add new digit
    jmp scan_loop

store_number:
    mov num, ax      ; Store the final number
    ret
scan_number endp



print_number proc
    mov ax, num
    mov cx, 0        ; Counter for digits
    mov bx, 10       ; Base 10 divisor

push_digits:
    mov dx, 0        ; Clear DX before division
    div bx           ; AX / 10 → Quotient in AX, Remainder in DX
    push dx          ; Store remainder (digit) in stack
    inc cx           ; Increase digit count
    test ax, ax      ; Check if quotient is 0
    jnz push_digits  ; If not zero, continue

print_digits:
    pop dx           ; Get the last digit
    add dl, 48       ; Convert to ASCII
    mov ah, 2        ; Print character
    int 21h
    loop print_digits ; Loop until all digits are printed

    mov dx, offset newline
    mov ah, 9
    int 21h

    ret
print_number endp

end main
