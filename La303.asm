.model small
.DATA
    VALOR1 DB ?                   
    VALOR2 DB ?                  
    UNI DB ?                      
    DECI DB ?                      
    SUMA DB 'Total:$'
    RESTA DB ' Diferencia:$'
    MULTI DB ' Producto:$'
    DIVID DB ' Cociente:$'
    RESI DB ' Residuo:$'
.STACK
.CODE
programa:
    MOV AX,@DATA
    MOV DS, AX
    XOR AX,AX
    XOR CX,CX
    MOV CL, 05H
    ADD CL, 05H
    MOV AH, 01H
    INT 21H
    MOV VALOR1, AL
    INT 21H
    MOV VALOR2, AL
    SUB VALOR1, 30h
    SUB VALOR2, 30h
    XOR AX,AX
    XOR DX,DX
    MOV DX, OFFSET SUMA
    MOV AH, 09H
    INT 21H
    XOR DX,DX               
    MOV DL, VALOR1          
    ADD DL, VALOR2          
    XOR AX,AX
    MOV AL,DL           
    DIV CL
    MOV DECI, AL          
    MOV UNI, AH           
    XOR AX,AX
    ADD DECI, 30H         
    ADD UNI, 30H         
    MOV DL, DECI
    MOV AH, 02H         
    INT 21H
    MOV DL, UNI       
    INT 21H
    XOR DX,DX
    MOV DX, OFFSET RESTA
    MOV AH, 09H
    INT 21H
    XOR DX,DX             
    MOV DL, VALOR1        
    SBB DL, VALOR2
    XOR AX,AX
    MOV AL, DL            
    DIV CL
    MOV DECI, AL          
    MOV UNI, AH           
    XOR AX,AX
    ADD DECI, 30H         
    ADD UNI, 30H         
    MOV DL, DECI
    MOV AH, 02H         
    INT 21H
    MOV DL, UNI       
    INT 21H
    XOR DX,DX
    MOV DX, OFFSET MULTI
    MOV AH, 09H
    INT 21H   
    XOR AX,AX             
    MOV AL, VALOR1        
    MUL VALOR2
    MOV DX, AX
    DIV CL
    MOV DECI, AL          
    MOV UNI, AH           
    XOR AX,AX
    ADD DECI, 30H        
    ADD UNI, 30H         
    MOV DL, DECI
    MOV AH, 02H         
    INT 21H
    MOV DL, UNI       
    INT 21H
    XOR DX,DX
    MOV DX, OFFSET DIVID
    MOV AH, 09H
    INT 21H
    XOR AX,AX
    MOV AL, VALOR1        
    DIV VALOR2
    MOV DL,AL            
    MOV BH, AH           
    ADD DL, 30H
    MOV AH, 02H
    INT 21H
    XOR DX,DX
    MOV DX, OFFSET RESI
    MOV AH, 09H
    INT 21H
    MOV DL,BH           
    ADD DL, 30H
    MOV AH, 02H
    INT 21H
    MOV AH,4CH
    INT 21H             
end programa