.model small
.data
 num dw ?
 temp dw ?  
 newline db 13 , 10 , "$" 
 arr dw 5,1,2,41,11 
 brr dw 1,2,3,4,5
 crr dw 5 dup(?)
 cxx dw ?    
 len dw 5    
 evenm db 13, 10, "even  $"
 oddm db 13 , 10 , "odd $",
 nai db 13 ,10, "nai $"


.stack 100h
.code     

scan proc
     mov ax, 0
     mov bx , 10
     mov cx , 5
     
     
     scan_:
        mul bx
        mov temp , ax
        mov ah, 1
        int 21h
        cmp al , 13
        je done_scanning 
        sub al, 48
        mov ah, 0
        add ax , temp
        mov num , ax   
        jmp scan_
  
  done_scanning:    
  mov dx, offset newline 
  mov ah, 9
  int 21h
  ret 
scan endp

          
print proc
  mov ax , num
  mov bx, 10
  mov cx, 0
  mov dx , 0
  
  push_:
    mov dx, 0
    div bx
    push dx
    inc cx
    cmp ax, 0 
    je pop_
    jmp push_
   
  pop_:
    pop dx
    add dx, 48
    mov ah, 2
    int 21h
    loop pop_ 
   
mov ah, 9
mov dx, offset newline
int 21h  
    
ret    
print endp 

scan_array proc
   
   mov si , 0  
   mov cx, len
   scan_array_:
        mov cxx, cx
        call scan 
        mov cx , cxx
        mov ax, num
        mov arr[si], ax
        add si, 2 
        loop scan_array_
    

ret    
scan_array endp


print_array proc
    mov cx, len
    mov si , 0  
    mov ax, 0
       print_array_:
            mov ax, crr[si]
            mov num , ax
            mov cxx, cx
            call print
            mov cx , cxx 
            add si, 2
            loop print_array_
    
    ret
print_array endp 

adda proc
mov cx, len
mov si, 0
   adding:
       mov ax, arr[si]
       add ax, 2
       mov arr[si], ax
       add si, 2
       loop adding 
 
 ret
    
adda endp  

findeo proc    
    
    mov cx, len
    mov si , 0
    jmp ff
    even:    
        mov ah, 9
        mov dx  , offset evenm
        int 21h  
        jmp fff
    odd:
        mov ah , 9     
        mov dx  , offset oddm
        int 21h
        jmp fff    
                
        ff:        
            mov ax, arr[si]
            and ax , 1
            cmp ax , 1
            je odd
            jmp even 
            fff:
            add si, 2        
            loop ff
    
            ret
 findeo endp  


 adding_alt proc 
    mov cx, 2 ;2nd,4th.....
    mov si , 2 ;starting frm 2nd number  
    mov ax, 0
    aaaa:
        add ax , arr[si]
        add si, 4
        add cx, 2
        cmp cx, len
        jg done_aaaa 
        jmp aaaa
    
 done_aaaa: 
 mov num , ax
 call print  
 ret
 adding_alt endp 
 
 
 adding_two_array proc
      mov si, 0
      mov cx, len
      ata:
        mov ax , arr[si]
        add ax, brr[si]
        mov crr[si] , ax
        add si, 2
      loop ata
      
 ret
 adding_two_array endp
 
 reverse_array proc 
    mov cx, len
    mov si, 8
    mov bx, 0
    
    ra:
        mov ax, arr[si]
        sub si, 2
        mov crr[bx] , ax
        add bx , 2
        loop ra
    
     
 ret    
 reverse_array endp 
 
 
 find_max proc 
    mov si, 0
    mov cx, len
    mov bx, arr[si]  
    jmp fm
    update:
    mov bx,ax 
    mov num , ax
    
    fm:
       mov ax, arr[si]
       cmp ax, bx
       jg update 
       add si, 2
       
    loop fm
    
  ret
  find_max endp 
 
  search proc
       mov si, 0
       mov ax, 40
       mov cx, len
       
       khojo: 
            cmp arr[si] , ax
            je paisi
            add si, 2
            
       loop khojo 
       
       mov ah, 9
       mov dx, offset nai
       int 21h
       
       jmp khotom
    
    paisi:    
        mov bx, 2
        mov ax, si
        div bx
        inc ax
        mov num , ax
        call print
    
    khotom:   
    ret
  search endp
                         
main proc
        mov ax, @data
        mov ds , ax
               call search
               
                
        mov ax, 4c00h
        int 21h
    
main endp
end main