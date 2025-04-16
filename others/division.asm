.MODEL SMALL
.STACK 100H
.DATA
    MSG1 DB "Enter first number (Dividend): $"
    MSG2 DB "Enter second number (Divisor): $"
    MSG3 DB "Quotient: $"
    MSG4 DB " Remainder: $"
    
    NUM1 DB ?  ; Stores first number (Dividend)
    NUM2 DB ?  ; Stores second number (Divisor)
    QUOTIENT DB ?
    REMAINDER DB ?

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; PRINT MSG1
    MOV DL, OFFSET MSG1
    MOV AH, 9
    INT 21H

    ; READ FIRST 2-DIGIT NUMBER
    ;CALL READ_NUMBER
    ; READ FIRST DIGIT
    mov ah, 1
    int 21h
    sub al, 48
    mov bl , 10
    mul bl
    mov bl, al
    mov ah,1
    int 21h 
    sub al, 48
    add al, bl   
    
    
    
    MOV NUM1, AL  ; Store the first number (Dividend)

    ; PRINT NEW LINE
    MOV AH, 2
    MOV DL, 10
    INT 21H
    MOV DL, 13
    INT 21H

    ; PRINT MSG2
    MOV DX, OFFSET MSG2
    MOV AH, 9
    INT 21H

    ; READ SECOND 2-DIGIT NUMBER
    ;CALL READ_NUMBER  
    ; READ FIRST DIGIT
    MOV AH, 1
    INT 21H
    SUB AL, 48  ; Convert ASCII to integer
    MOV BL, AL  ; Store first digit

    ; READ SECOND DIGIT
    MOV AH, 1
    INT 21H
    SUB AL, 48  ; Convert ASCII to integer

    ; COMBINE DIGITS TO FORM NUMBER
    MOV AH, 0
    MOV CL, 10
    MUL CL
    ADD AL, BL  ; AL = (first_digit * 10) + second_digit


    MOV NUM2, AL  ; Store the second number (Divisor)

    ; PRINT NEW LINE
    MOV DL, 10
    MOV AH, 2
    INT 21H
    MOV DL, 13
    INT 21H

    ; PERFORM DIVISION
    MOV AX, 0
    MOV AL, NUM1  ; Move Dividend to AX
    MOV BL, NUM2  ; Move Divisor to BL
    DIV BL        ; AX ÷ BL ? AL = Quotient, AH = Remainder

    MOV QUOTIENT, AL
    MOV REMAINDER, AH

    ; PRINT MSG3 (Quotient)
    MOV DX, OFFSET MSG3
    MOV AH, 9
    INT 21H

    ; DISPLAY QUOTIENT
    MOV DL, QUOTIENT
    ADD DL, 48
    MOV AH, 2
    INT 21H

    ; PRINT MSG4 (Remainder)
    MOV DX, OFFSET MSG4
    MOV AH, 9
    INT 21H

    ; DISPLAY REMAINDER
    MOV DL, REMAINDER
    ADD DL, 48
    MOV AH, 2
    INT 21H

    ; EXIT PROGRAM
    MOV AX, 4C00H
    INT 21H

MAIN ENDP


READ_NUMBER PROC
    ; READ FIRST DIGIT
    MOV AH, 1
    INT 21H
    SUB AL, 48  ; Convert ASCII to integer
    MOV BL, AL  ; Store first digit

    ; READ SECOND DIGIT
    MOV AH, 1
    INT 21H
    SUB AL, 48  ; Convert ASCII to integer

    ; COMBINE DIGITS TO FORM NUMBER
    MOV AH, 0
    MOV CL, 10
    MUL CL
    ADD AL, BL  ; AL = (first_digit * 10) + second_digit

    RET
READ_NUMBER ENDP

END MAIN
