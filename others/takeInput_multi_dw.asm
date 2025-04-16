.model small
.stack 100h
.data
  a dw ?  
  b dw ?

.code    
main proc
    mov ax, @data
    mov ds, ax
    
    mov bx, 10
    scan:
        mov ah, 1
        int 21h  
        cmp al , 13
            je print
        sub al , 48 
        mov ah, 0
        mov b, ax 
        mov ax, a
        mul bx 
        add ax, b    
        mov a , ax
        jmp scan
        
    print:
    
    mov ax, 4c00h
    int 21h
    main endp
end main