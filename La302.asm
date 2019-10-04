.MODEL small                            ; Modelo para ejecutables
.STACK

.DATA
    VALOR1 DB ?          
    VALOR2 DB ?
    VALOR1IN DB 'Ingrese el primer numero: $'
    VALOR2IN DB 'Ingrese el segundo numero: $'
    SUMA DB 'Total: $ '
    RESTA DB 'Diferencia: $ '
    MULTI DB 'Producto: $ '  
    DIVIC DB 'Cociente: $ '
    DIVIR DB 'Residuo: $ '
    RESI DB ?
   
.CODE
Programa:

    Mov AX,@DATA                        
    Mov DS,AX                         
    MOV DX, OFFSET VALOR1IN               
    MOV AH,09h              
    INT 21h   
    MOV AH,01h                          
    INT 21h                             
    SUB AL, 30h                         
    MOV VALOR1,AL                         
    MOV DX, OFFSET VALOR2IN               
    MOV AH,09h              
    INT 21h
    MOV AH,01h                          
    INT 21h                             
    SUB AL, 30h                        
    MOV VALOR2,AL                        
    MOV DX, OFFSET SUMA                
    MOV AH,09h              
    INT 21h
    XOR BX,BX                         
    MOV BH, VALOR1                       
    MOV BL, VALOR2                        
    ADD BH, BL                          
    ADD BH, 30H                         
    MOV DL, BH                          
    Mov AH, 02h                         
    Int 21h
    MOV DX, OFFSET RESTA               
    MOV AH,09h              
    INT 21h
    XOR BX,BX                         
    MOV BH, VALOR1                        
    MOV BL, VALOR2                        
    SUB BH, BL                      
    ADD BH, 30h                       
    MOV DL, BH
    MOV AH, 02h                         
    INT 21h
    MOV DX, OFFSET MULTI                
    MOV AH,09h              
    INT 21h
    MOV DL, VALOR1                        
    MOV AL, VALOR2                     
    MUl DL                           
    Add AX, 30h                     
    Mov Dx, Ax
    MOV AH, 02h                        
    INT 21h
    MOV DX, OFFSET DIVIC                
    MOV AH,09h              
    INT 21h
    MOV AH, 0H                          
    MOV AL, VALOR1                        
    MOV BL, VALOR2                      
    DIV BL                            
    MOV RESI,AH                          
    ADD RESI,30H                       
    Add AL, 30H
    MOV DL, AL
    MOV AH, 02h                         
    INT 21h  
    MOV DX, OFFSET DIVIR                
    MOV AH,09h              
    INT 21h  
    MOV DL,RESI
    MOV AH, 02h                       
    INT 21h
    MOV ah, 4ch                    
    INT 21H  
END Programa



   