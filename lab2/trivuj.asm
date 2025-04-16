.model small
.stack 100h
.data  

m1 db "somo$"
m2 db "Di$ "
m3 db "Biso$"
num dw ?
temp dw ?
n1 dw ?
n2 dw ?
n3 dw ?

.code

newline proc
            mov ah , 2
            mov dl , 13
            int 21h
            mov dl , 10
            int 21h
ret
newline endp


scan_number proc
mov ax, 0
mov bx , 10

 scan_:    
    mul bx
    mov temp , ax
    mov ah , 1
    int 21h
        cmp al , 13
        je exit
    mov ah , 0
    sub ax , 48
    add ax , temp
    mov num , ax
    jmp scan_

exit: 
ret
scan_number endp

main proc
mov ax, @data
mov ds, ax

                      call scan_number
           mov ax, num
           mov n1 , ax 
                      call newline    
                      call scan_number
           mov ax, num
           mov n2 , ax 
                      call newline
                      call scan_number
           mov ax, num
           mov n3 , ax     
           
                                mov ax, n1
                                cmp ax , n2
                                je n1_soman_n2 
                                jmp n1_soman_na_n2
                                
                                        n1_soman_n2:
                                        cmp ax , n3
                                        je sob_soman
                                        
                                               n1_soman_na_n2:
                                               cmp ax , n3
                                               je duida_soman  
                                               jmp n1_soman_na_n2_and_n3
                                               
                                                    n1_soman_na_n2_and_n3:  
                                                        mov ax, n2
                                                        cmp ax, n3
                                                        je duida_soman
                                                        jmp keu_soman_na
                                                    
                                            
sob_soman: 
call newline
mov dx , offset m1
jmp sesh 


duida_soman: 
call newline
mov dx , offset m2
jmp sesh 


keu_soman_na: 
call newline
mov dx , offset m3
jmp sesh  


sesh: 
mov ah , 9
int 21h             
              
mov ax, 4c00h
int 21h    
main endp
end main