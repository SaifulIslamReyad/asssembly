;Write an assembly program that takes an 8-bit number from the user and checks whether it is even or odd using the IF-ELSE structure. 

.model small
.stack 100h
.data
    a db ?  
    b db ?
    even_msg db 13 , 10 ,"EVEN$", 13, 10 
    odd_msg  db 13, 10, "ODD$", 13, 10   

.code    
main proc
    mov ax, @data
    mov ds, ax
    
    mov bl, 10
scan:      
    mov al , 0
scan_:
    mul bl   
    mov a, al
    mov ah, 1
    int 21h  
    cmp al, 13     
        je process
    sub al, 48      
    add al, a   
    mov b, al
    jmp scan_
        
process: 

    mov al, b
    test al, 1      
    jz even         

odd:
    mov dx, offset odd_msg
    jmp print_result

even:
    mov dx, offset even_msg

print_result:  
    mov ah, 9     
    int 21h   
    
    
    mov ax, 4c00h   
    int 21h
main endp
end main
