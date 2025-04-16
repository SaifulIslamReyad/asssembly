;Check if a Number is Positive or Negative
.model small
.stack 100h
.data
    num dw 0            
    newline db 13, 10, "$"     
    temp dw ?      
    m1 db "Enter number  : $" 
    m2 db "this number is : $"
    positive_msg db "Positive$"
    negative_msg db "Negative$"
    zero_msg db "Zero$"
    is_negative db 0

.code    
main proc
    mov ax, @data  
    mov ds, ax


    mov ah, 9
    mov dx, offset m1
    int 21h 


    call scan_number


    mov ah, 9
    mov dx, offset m2
    int 21h      


    call check_sign


    mov ax, 4c00h
    int 21h
main endp


scan_number proc 
    mov ax, 0 
    mov bx, 10
    mov is_negative, 0   


    mov ah, 1
    int 21h

    cmp al, '-'   
    jne scan_loop   

    mov is_negative, 1  
    int 21h             

scan_loop:
    cmp al, 13     
    je exit_scan

    sub al, 48     
    mov ah, 0     

    mul bx         
    add ax, num    
    mov num, ax    


    mov ah, 1
    int 21h
    jmp scan_loop

exit_scan:
    cmp is_negative, 1
    jne done

    neg num    

done:
    mov ah, 9
    mov dx, offset newline
    int 21h
    ret
scan_number endp       

check_sign proc
    mov ax, num

    cmp ax, 0
    jl print_negative   
    jg print_positive   

    jmp print_zero      

print_positive:
    mov dx, offset positive_msg
    jmp display_result

print_negative:
    mov dx, offset negative_msg
    jmp display_result

print_zero:
    mov dx, offset zero_msg

display_result:
    mov ah, 9
    int 21h
    mov ah, 9
    mov dx, offset newline
    int 21h
    ret
check_sign endp


end main
