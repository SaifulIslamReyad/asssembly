; Check if a triangle has all equal sides or two equal or none

.model small
.stack 100h
.data
    side1 dw ?
    side2 dw ?
    side3 dw ?       
    num dw ?  
    temp dw ?
    somobahu_msg db "SOMOBAHU$"
    somodibahu_msg db "SomoDibahu$"
    bisomobahu_msg db "Bisomobahu$"
    m1 db "Enter 3 sides below :- $"
    newline db 13, 10, "$"

.code
main proc
    mov ax, @data
    mov ds, ax


    mov ah, 9
    mov dx, offset m1
    int 21h          
    mov dx , offset newline
    int 21h


    call scan_number
    mov ax, num
    mov side1, ax    
    call scan_number
    mov ax, num    
    mov side2, ax    
    call scan_number
    mov ax, num
    mov side3, ax   

    mov dx, offset newline
    mov ah, 9
    int 21h
    
    call check_triangle

 
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
        mov ah , 9
        mov dx , offset newline
        int 21h 
    ret
scan_number endp

check_triangle proc
    mov ax, side1
    cmp ax, side2
    jne not_equal_1
    cmp ax, side3
    jne display_somodibahu
    mov ah, 9
    mov dx, offset somobahu_msg
    int 21h
    ret

not_equal_1:   
    mov ax, side1
    cmp ax, side3
    je display_somodibahu
    
    mov ax, side2
    cmp ax, side3
    je display_somodibahu
    
    jmp display_bisomobahu

display_somodibahu:
    mov ah, 9
    mov dx, offset somodibahu_msg
    int 21h
    ret

display_bisomobahu:
    mov ah, 9
    mov dx, offset bisomobahu_msg
    int 21h
    ret
check_triangle endp

end main
