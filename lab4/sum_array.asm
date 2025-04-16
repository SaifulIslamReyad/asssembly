.MODEL SMALL
.STACK 100H
.DATA
    array  DW  10, 20, 30, 40, 50  
    length DW  5                   
    sum    DW  0   
    newline db 13, 10, "$"                  

.CODE  
print_number proc    

    mov ax, sum      
    mov cx, 0        
    mov bx, 10       

push_digits:
    mov dx, 0        
    div bx          
    push dx      
    inc cx         
    cmp ax , 0     
    jnz push_digits 

print_digits:
    pop dx           
    add dl, 48      
    mov ah, 2        
    int 21h
    loop print_digits 

done_printing:  
    mov ah, 9
    mov dx,offset newline
    int 21h
    ret
print_number endp


MAIN PROC
    MOV AX, @DATA  
    MOV DS, AX

    MOV CX, length 
    MOV SI, 0      
    MOV AX, 0      

            SUM_LOOP:
            ADD AX, array[SI] 
            ADD SI, 2         
            LOOP SUM_LOOP    

    MOV sum, AX 
    
    call print_number     


    MOV AX, 4C00H       
    INT 21H

MAIN ENDP
END MAIN
