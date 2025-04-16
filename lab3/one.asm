;1*x+2*x+……+n*x = ?

.model small
.stack 100h
.data
    x dw 2 
    n dw 5   
    ans dw 0        
    newline db 13, 10, "$"     
    temp dw ?      

.code    
main proc
    mov ax, @data  
    mov ds, ax 
    
        mov ax, x
        mov cx, n
        reyad:
               mul cx
               mov bx, ax
               add ans , ax
               mov ax, x
               loop reyad  
    call print_number
    mov ax, 4c00h
    int 21h
main endp

   
print_number proc   
    mov ax, ans      
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


