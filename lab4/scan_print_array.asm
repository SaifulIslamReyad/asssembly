.MODEL SMALL
.STACK 100H
.DATA
    array DW ? , ? , ? , ? , ? ,?   
    length DW  6                                      
    newline db 13, 10, "$"  
    num dw ?      
    cx_dhore_rakhi dw ?
    temp dw ?   

.CODE    
scan_number proc 
    mov cx, 5
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
    loop scan_
    ;mtian
    exit: 
        mov ah, 9
        mov dx, offset newline
        int 21h
        ret
scan_number endp 


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
    je print_digits 

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
     
     
                                            mov cx, length   
                                            mov si , 0
                                            scan_array:  
                                                    mov cx_dhore_rakhi , cx
                                                    call scan_number 
                                                    mov cx, cx_dhore_rakhi
                                                    mov ax , num
                                                    mov array[si] , ax
                                                    add si , 2
                                            loop scan_array
    
                mov si, 0
                mov cx, length
                print_array:
                    mov ax , array[si]
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
