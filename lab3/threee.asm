;Find even numbers between 1 to 20

.model small
.stack 100h
.data  
    num dw 2         
    newline db 13, 10, "$"     
    temp dw ?      

.code    
main proc
    mov ax, @data
    mov ds, ax 

    mov cx, 10   
    

    even: 
        mov temp , cx  
        call print_number 
        mov cx, temp
        mov ax, 2        
        add num , ax 
        
                
    loop even   

    mov ax, 4C00h       
    int 21h
main endp

   
print_number proc 
    mov ax, num        
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
   
   
end main


1234