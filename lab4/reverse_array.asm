.MODEL SMALL
.STACK 100H
.DATA
    array  DW  1, 2, 3, 4, 5   
    length DW  5                   
    brray dw ?, ? , ? , ? , ?                   
    newline db 13, 10, "$"  
    num dw ?      
    cx_dhore_rakhi dw ?   

.CODE  
print_number proc    
    mov ax  , num  
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
    mov bx, 8

reyad:
    mov ax, array[bx]
    mov brray[si] , ax
    add si , 2
    sub bx , 2
    loop reyad 
 
 
    
mov si, 0
mov cx, length 
print_array:
    mov ax , brray[si]
    mov num , ax
    add si, 2  
    
    mov cx_dhore_rakhi, cx
    call print_number     
    mov cx , cx_dhore_rakhi
loop print_array
    

                       
    mov ax , 4c00h
    int 21h
MAIN ENDP
END MAIN
