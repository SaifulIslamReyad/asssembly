; a/ b

.model small
.stack 100h
.data
 a db ?
 b db ?
 temp db ?
 vagfol db ?
 vagsesh db ?  
 temp1 db ?
 temp2 db ?
 m1 db "enter number : $"
 vs db "vagsesg is : $"
 vf db "vagfol is : $"
 

.code
 
ip proc
    mov ah, 1
    int 21h
    sub al , 48    
    mov bl , 10
    mul bl
    mov temp , al
    mov ah, 1
    int 21h
    sub al, 48 
    add al, temp
    
     
ret 
ip endp 
 
 
newline proc
   mov ah, 2
   mov dl, 10
   int 21h
   mov dl, 13
   int 21h
ret    
newline endp


op proc
   mov ah, 0 
   mov bl, 10
   div bl
   mov temp1 ,al
   mov temp2 ,ah 
   mov ax , 0 
   mov ah, 2
   mov dl , temp1
   add dl, 48
   int 21h
   mov dl , temp2
   add dl ,48
   int 21h 
    
ret
op endp

main proc
    mov ax , @data
    mov ds, ax    
       
       
       mov ah, 9
       mov dl , offset m1
       int 21h        
       call ip
       mov a, al  
       call newline
       
       mov ah, 9 
       mov dl , offset m1
       int 21h
       call ip
       mov b, al
       call newline
       
       mov ax , 0
       mov al, a
       mov bl , b
       div bl 
       mov vagsesh , ah
       mov vagfol , al
       mov ax , 0
       
       
       mov ah, 9
       mov dl , offset vs
       int 21h
       mov al, vagsesh
       call op   
       
       mov ah, 9
       mov dl, offset vf
       int 21h
       mov al , vagfol
       call op 
              
    mov ax, 4c00h
    int 21h          
main endp

end main