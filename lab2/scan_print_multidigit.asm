.model small
.stack 100h
.data
    num dw ?            
    newline db 13, 10, "$"     
    temp dw ?      
    m1 db "enter number : $"
    m2 db "you entered  : $"

.code    
main proc
    mov ax, @data  
    mov ds, ax
    
    mov ah, 9
    mov dx , offset m1
    int 21h 

    call scan_number

    mov ah, 9
    mov dx, offset newline
    
    mov ah, 9
    mov dx , offset m2
    int 21h        
    
    
    call print_number

   
    mov ax, 4c00h
    int 21h
main endp


scan_number proc 
    
    mov ax, 0 
    mov bx , 10
scan_:
    mul bx   
    mov temp, ax
    mov ah, 1
    int 21h  
    cmp al, 13     
        je exit
    sub al, 48 
    mov ah , 0     
    add ax, temp  
    mov num, ax
    jmp scan_
    
    exit: 
        mov ah, 9
        mov dx, offset newline
        int 21h
        ret
scan_number endp       


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
    cmp cx, 0       
    je done_printing
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