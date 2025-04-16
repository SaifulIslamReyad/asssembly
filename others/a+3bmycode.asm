.model small

.stack 100h

.data 
 m1 db "enter number : $"
 ans db "ans is : $"
 
 a db ?
 b db ?
 temp db ?
 num db ?
 temp2 db ?

.code   

inp proc
 
    mov ah , 1
    int 21h
    sub al , 48
    mov bl , 10
    mul bl
    mov temp , al
    mov ah , 1
    int 21h  
    sub al, 48
    add al, temp    
                  
    ret
inp endp

newline proc
mov dl , 10
mov ah, 2
int 21h
mov dl , 13
int 21h  
mov ax , 0 
ret
newline endp


op proc
    
mov ax , 0
mov bl, 10
mov al, num
div bl
mov temp2 , ah
mov temp , al  
mov ax , 0   
            
mov dl , temp 
add dl , 48
mov ah, 2
int 21h 

mov dl , temp2 
add dl , 48
mov ah, 2
int 21h
    
ret
op endp         
         
         

main proc
    mov ax, @data
    mov ds, ax  
    mov ax, 0
           
           
    mov dl , offset m1
    mov ah, 9
    int 21h
    call inp   
    mov a, al
    call newline
    mov dl , offset m1
    mov ah, 9
    int 21h
    call inp
    mov b, al 
    mov bl, 3
    mul bl
    add al, a
          
    
    mov num, al
    call newline
    mov dl , offset ans
    mov ah, 9
    int 21h
    call op

    
main endp
end main