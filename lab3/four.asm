
;fibonacci 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597, 2584
.model small
.stack 100h
.data  
    num dw 0         
    newline db 13, 10, "$"
    fibo dw 10     
    temp dw ?
    temp2 dw ?
    temp3 dw ?
    a dw 0
    b dw 1    
      

.code    
main proc
    mov ax, @data
    mov ds, ax 

    mov cx , fibo   
    mov ax, a
    mov dx, b 
    
print_loop: 
    
    mov temp , cx
    mov temp2 , ax
    mov temp3 , dx 
    mov num ,ax
    call print_number   
    mov cx, temp
    mov ax , temp2
    mov dx, temp3

    add ax, dx 
    xchg ax, dx ; dx = summation .... ax = previous b

loop print_loop    
    



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