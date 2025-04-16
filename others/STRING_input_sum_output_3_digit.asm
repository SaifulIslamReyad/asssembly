.MODEL SMALL
.STACK 100H
.DATA     
    MSG1 DB "   FIRST NUMBER : $"   
    MSG2 DB "   SECOND NUMBER : $"      
    MSG3 DB "   THIRD NUMBER : $"
    MSG4 DB "   SUM : $"
    
    A DB ?
    B DB ?  
    C DB ?
    
    SUM DB ?
    FIRST DB ?
    SECOND DB ?
    THIRD DB ?
    
    
.CODE      
MAIN PROC
MOV AX, @DATA
MOV DS, AX
MOV AX, 0    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;         
         
  


;PRINT MSG1
MOV DX , OFFSET MSG1
MOV AH, 9
INT 21H
;TAKING INPUT A
MOV AH, 1         
INT 21H  
SUB AL, 48
MOV A, AL         
         

;PRINT MSG2
MOV DX , OFFSET MSG2
MOV AH, 9
INT 21H
;TAKING INPUT B
MOV AH, 1         
INT 21H  
SUB AL, 48
MOV B, AL  
   
   
;PRINT MSG3
MOV DX , OFFSET MSG3
MOV AH, 9
INT 21H
;TAKING INPUT C
MOV AH, 1         
INT 21H  
SUB AL, 48
MOV C, AL  

       
         
; ADDING         
MOV AL ,A
ADD AL, B 
ADD AL, C
MOV SUM , AL

     
     
;MODIFYING BEFORE OUTPUT 
MOV AH, 0
MOV BL, 10
DIV BL 
MOV THIRD ,AH

MOV AH, 0
MOV BL, 10
DIV BL 
MOV FIRST, AL
MOV SECOND ,AH   



;PRINT MSG4
MOV DX , OFFSET MSG4
MOV AH, 9
INT 21H
     
     
;OUTPUTING FIRST
MOV DL, FIRST 
ADD DL, 48
MOV AH, 2   
INT 21H         
         
 
;OUTPUTING SECOND
MOV DL, SECOND 
ADD DL, 48
MOV AH, 2   
INT 21H        
         
         

;OUTPUTING THIRD
MOV DL, THIRD 
ADD DL, 48
MOV AH, 2   
INT 21H         
         
         
         
         

         
         
             
         
       
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
MOV AX , 4C00H
INT 21H
    
MAIN ENDP
END MAIN

