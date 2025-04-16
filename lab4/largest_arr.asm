.MODEL SMALL
.STACK 100H
.DATA
    array  DW  1, 2, 3, 4, 5 , 1 ,2  
    length DW  5                   
    largest DW  0                   
    newline db 13, 10, "$"           

.CODE  
print_number proc    
    mov ax, largest  
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
    mov dx, offset newline
    int 21h
    ret
print_number endp

MAIN PROC
    MOV AX, @DATA  
    MOV DS, AX

    MOV CX, length  
    MOV SI, 0       
    MOV AX, array[SI] 
    MOV largest, AX  

find:
    mov ax , array[si] 
    add si , 2
    cmp ax , largest
    jg update 
done_update:
    loop find 
    jmp exit

update:
    mov largest , ax
    jmp done_update
 
exit:
    call print_number
                       
    mov ax , 4c00h
    int 21h
MAIN ENDP
END MAIN
