.MODEL SMALL
.STACK 100H
.DATA     
    MSG1 DB "Enter value of a: $"
    MSG2 DB "Enter value of b: $"
    MSG3 DB "Result (a + 3b) = $"
    
    A DB ?   ; Store user input a
    B DB ?   ; Store user input b
    RESULT DW ?  ; Store result

.CODE      
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

; PRINT MESSAGE 1 (Enter a)
    MOV DX, OFFSET MSG1
    MOV AH, 9
    INT 21H

; READ a
    MOV AH, 1
    INT 21H
    SUB AL, 48  ; Convert ASCII to integer
    MOV A, AL

; PRINT NEW LINE
    MOV DL, 10
    MOV AH, 2
    INT 21H
    MOV DL, 13
    INT 21H

; PRINT MESSAGE 2 (Enter b)
    MOV DX, OFFSET MSG2
    MOV AH, 9
    INT 21H

; READ b
    MOV AH, 1
    INT 21H
    SUB AL, 48  ; Convert ASCII to integer
    MOV B, AL

; PRINT NEW LINE
    MOV DL, 10
    MOV AH, 2
    INT 21H
    MOV DL, 13
    INT 21H

; COMPUTE a + 3b
    MOV AL, B
    MOV BL, 3
    MUL BL   ; AL = B * 3

    ADD AL, A ; AL = A + (3 * B)
    MOV RESULT, AX ; Store result in RESULT

; PRINT MESSAGE 3 (Result)
    MOV DX, OFFSET MSG3
    MOV AH, 9
    INT 21H

; PRINT NEW LINE
    MOV DL, 10
    MOV AH, 2
    INT 21H
    MOV DL, 13
    INT 21H

; CONVERT RESULT TO ASCII AND DISPLAY
    MOV AX, RESULT
    MOV BL, 10
    MOV AH, 0
    DIV BL   ; Divide AX by 10 (AL = quotient, AH = remainder)

    MOV DL, AL
    ADD DL, 48  ; Convert quotient to ASCII
    MOV AH, 2
    INT 21H

    MOV DL, AH
    ADD DL, 48  ; Convert remainder to ASCII
    MOV AH, 2
    INT 21H

; EXIT PROGRAM
    MOV AX, 4C00H
    INT 21H
    
MAIN ENDP
END MAIN
