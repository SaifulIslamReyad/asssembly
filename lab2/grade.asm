; Grade Classification. Above 80 is A+. 75 to 79 is A.......

.model small
.stack 100h
.data
    num dw ?            
    newline db 13, 10, "$"     
    temp dw ?      
    m1 db "Enter number  : $"
    m2 db "Your Grade is : $"
 
    
    a_plus db "A+ $"
    a_grade db "A  $"
    a_minus db "A- $"
    b_grade db "B  $"
    c_grade db "C  $"
    d_grade db "D  $"
    f_grade db "F  $"

.code    
main proc
    mov ax, @data  
    
    
    mov ds, ax
    mov ah, 9
    mov dx , offset m1
    int 21h 

    call scan_number


    mov ah, 9
    mov dx , offset m2
    int 21h      
    call classify_grade

   
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


classify_grade proc
    mov ax, num

    cmp ax, 80
    jge print_a_plus

    cmp ax, 75
    jge print_a

    cmp ax, 70
    jge print_a_minus

    cmp ax, 65
    jge print_b

    cmp ax, 60
    jge print_c

    cmp ax, 50
    jge print_d

    jmp print_f

print_a_plus:
    mov dx, offset a_plus
    jmp display_grade

print_a:
    mov dx, offset a_grade
    jmp display_grade

print_a_minus:
    mov dx, offset a_minus
    jmp display_grade

print_b:
    mov dx, offset b_grade
    jmp display_grade

print_c:
    mov dx, offset c_grade
    jmp display_grade

print_d:
    mov dx, offset d_grade
    jmp display_grade

print_f:
    mov dx, offset f_grade

display_grade:
    mov ah, 9
    int 21h
    ret
classify_grade endp


end main
