.model small
.stack 100h
.data
  num dw ?
  temp dw ? 
  newline db 13,10 ,"$" 
  is_negative db 0   
  m1 db "poss $"
  m2 db "nigga $"   
  m3 db "zeeero$"

.code   
    
       scan_number proc     
        mov ax, 0
        mov bx ,10 

        scan_: 
            mul bx
            mov temp , ax
            mov ah, 1
            int 21h
            cmp al, 13
            je exit
            cmp al , "-"  
            je negative
            sub al , 48   
            mov ah, 0
            add ax , temp
            mov num , ax   
            jmp scan_         
             
                                negative: 
                                mov is_negative ,1 
                                mov ax, 0
                                jmp scan_
                                
                                
                       make_neg:
                       neg num
                       jmp sesh 
                        
                       exit:
                       cmp is_negative,  1  
                       
                       je make_neg
                       
                       sesh:
                       ret
       scan_number endp 
       
      
 main proc
 mov ax, @data
 mov ds, ax
    
 
          call scan_number
          mov ah, 9
          mov dx , offset newline
          int 21h 
          
          mov ax, num
          cmp ax, 0
          je zeeeero
            
           cmp ax, 0
           jl nigga
          
          cmp ax ,0 
          jg posss 
          
                      
           zeeeero:
           mov ah, 9
           mov dx , offset m3
           int 21h
           jmp sesh_sob 


                      
           nigga:
           mov ah, 9
           mov dx , offset m2
           int 21h
           jmp sesh_sob            
                   

                      
           posss:
           mov ah, 9
           mov dx , offset m1
           int 21h
           jmp sesh_sob          
            
 sesh_sob:
 mov ax, 4c00h
 int 21h
 main endp

 end main