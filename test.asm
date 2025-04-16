.model small
.stack 100h
.data
   newline db 13, 10, '$'  ; New line characters
   prompt db "Enter number: $" 
   ok db "ok $"
   a db 9                  ; Example variable
   b dw ?                  ; Store multi-digit number

.code
main proc
    mov ax, @data
    mov ds, ax   

    mov ah, 9
    mov dx, offset prompt
    int 21h  ; Print "Enter number:"
    
    mov bx, 10   ; Base for number conversion
    mov ax, 0    ; AX will store the final number

take_input:
    mov ah, 1
    int 21h      ; Read character from user
    cmp al, 13   ; Check if Enter is pressed
    je exit      ; If Enter, stop reading
    
    sub al, 48   ; Convert ASCII to number
    cbw          ; Convert AL to AX to avoid overflow
    mul bx       ; Multiply AX by 10 (shift left)
    add ax, bx   ; Add the new digit to AX

    jmp take_input  ; Repeat for next digit

exit:
    mov b, ax  ; Store final number in variable `b`
    
    
    mov ah, 9
    mov dx, offset newline
    int 21h

    
    mov ah, 9
    mov dx, offset ok
    int 21h   ; Print newline
    
    mov ax, 4c00h
    int 21h
main endp
end main
