


.MODEL SMALL
.STACK 100H
.DATA 
    A DB ?
    B DB ?
    C DB ?
    D DB ?
    E DB ?
    M DB "ENTER NUMBER: $"
    M2 DB "ANSWER IS: $"

.CODE
    NEWLINE PROC
        MOV AH,2
        MOV DL, 10
        INT 21H
        MOV DL, 13
        INT 21H     
        RET
    NEWLINE ENDP
    ENTER_NUMBER PROC
        MOV AH,9
        MOV DX , OFFSET M
        INT 21H
        RET
    ENTER_NUMBER ENDP
    INPUT_NUMBER PROC
        CALL ENTER_NUMBER
        MOV AH, 1
        INT 21H
        SUB AL, 48    
        RET
    INPUT_NUMBER ENDP

MAIN PROC
    MOV AX, @DATA
    MOV DS, AX


    CALL INPUT_NUMBER
        MOV A, AL
    CALL NEWLINE
    CALL INPUT_NUMBER
        MOV B, AL
    CALL NEWLINE
    CALL INPUT_NUMBER
        MOV C, AL
    CALL NEWLINE
    CALL INPUT_NUMBER
        MOV D, AL
    CALL NEWLINE
    CALL INPUT_NUMBER
        MOV E, AL
    CALL NEWLINE

    MOV AX, 0
    MOV AL , B
    MOV BL , C
    MUL BL
    ADD AL, A
    ADD AL, D
    MOV B, AL

    ; a + bc + d - (a/c) *e

    MOV AX, 0
    MOV BX, 0
    MOV AL , A
    MOV BL, C
    DIV BL
    MOV BL, E
    MUL BL
    MOV BL , AL


    MOV AL, B
    SUB AL , BL
    ADD AL, 48

    MOV AH,9
    MOV DX, OFFSET M2
    INT 21H
    
CALL NEWLINE
    MOV DX, 0
    MOV DL, AL
    MOV AH,2
    INT 21H
MAIN ENDP



END MAIN

