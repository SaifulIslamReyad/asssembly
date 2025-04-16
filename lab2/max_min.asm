;Compare Three Numbers. Find Max and Min

.model small
.stack 100h
.data
    num1 dw ?  
    num2 dw ?
    num3 dw ? 
    num dw ?
    temp dw ?        
    max dw ? 
    min dw ?
    
    m1 db  "enter number : $" 
    max_msg db 13, 10, "MAX: $" , 13 , 10
    min_msg db 13, 10, "MIN: $" , 13 , 10
    newline db 13, 10, "$"

.code    
main proc
    mov ax, @data
    mov ds, ax

    
    call scan_number  
    mov ax, num
    mov num1 , ax


    call scan_number
    mov ax, num
    mov num2 , ax

  
    call scan_number
    mov ax, num
    mov num3 , ax

    ; find maximum
    mov ax, num1
    cmp ax, num2
    jge check_num3
    mov ax, num2

check_num3:
    cmp ax, num3
    jge store_max
    mov ax, num3

store_max:
    mov max , ax 

    ; find Minimum
    mov ax, num1
    cmp ax, num2
    jle check_min_num3
    mov ax, num2

check_min_num3:
    cmp ax, num3
    jle store_min
    mov ax, num3

store_min:
    mov min, ax  

            mov dx, offset max_msg
            mov ah, 9
            int 21h
        
            mov ax, max
            mov num , ax
            call print_number
        
        
        
            ; Print Minimum
            mov dx, offset min_msg
            mov ah, 9
            int 21h
        
            mov ax, min
            mov num , ax
            call print_number
        
            
            mov ax, 4c00h
            int 21h

main endp





scan_number proc 
    mov ah, 9
    mov dx , offset m1
    int 21h     
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
        mov ah , 9
        mov dx , offset newline
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
    test ax, ax     
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
    ret
print_number endp


end main
