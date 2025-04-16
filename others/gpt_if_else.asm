.model small
.stack 100h
.data
    number db 6 dup(?)  ; Store up to 6-digit number (adjust as needed)
    m1 db "Enter number: $"
    newline db 13, 10, '$'
    result_msg db "Double of the number: $"
    double_number db 6 dup(?)
    count db 0  ; Counter to track number of digits

.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 9
    lea dx, m1
    int 21h  ; Print "Enter number:"
    
    lea si, number  ; Point SI to store number
    lea di, double_number ; Point DI to store doubled number
    mov count, 0  ; Reset count
    
input_loop:
    mov ah, 1      ; Read character
    int 21h
    cmp al, 13     ; Check if Enter is pressed
    je done_input  ; If Enter, exit loop
    
    sub al, 48     ; Convert ASCII to digit
    mov [si], al   ; Store digit
    shl al, 1      ; Double the digit
    mov [di], al   ; Store doubled digit
    
    inc si         ; Move to next position
    inc di
    inc count      ; Increase digit count
    jmp input_loop ; Repeat until Enter

done_input:
    mov ah, 9
    lea dx, newline
    int 21h  ; Print newline
    
    mov ah, 9
    lea dx, result_msg
    int 21h  ; Print "Double of the number:"
    
    lea si, double_number
    mov cl, count  ; Load count of digits
    mov ch, 0      ; Clear high byte

print_double:
    mov dl, [si]
    add dl, 48
    mov ah, 2
    int 21h
    inc si
    loop print_double  ; Repeat count times
    
    mov ah, 9
    lea dx, newline
    int 21h  ; Print newline
    
    mov ax, 4c00h  ; Exit program
    int 21h
main endp
end main
