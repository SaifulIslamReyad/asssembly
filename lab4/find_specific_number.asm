.MODEL SMALL
.STACK 100H
.DATA
    array DW 2,1,4,6,9  
    length DW  5                                      
    newline db 13, 10, "$"  
    num dw ?      
    cx_dhore_rakhi dw ?
    temp dw ?
    sn dw 9   

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
                 
            mov cx, length
            mov si , 0     
                    find_specific_number:   
                     mov ax , array[si]
                     add si , 2
                     cmp ax , sn
                     je ans     
                    loop find_specific_number

            ans:
            mov ax , 5
            sub ax , cx
            mov num , ax
            call print_number      
            
           
    mov ax , 4c00h
    int 21h
MAIN ENDP
END MAIN
