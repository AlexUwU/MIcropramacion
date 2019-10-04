.model small
.DATA
    VALOR1 DB 2            
    VALOR2 DB 2           
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
    XOR DX,DX
    MOV DX, OFFSET SUMA
    MOV AH, 09H
    INT 21H
    XOR DL,DL            
    MOV DL, VALOR1       
    ADD DL, VALOR2       
    ADD DL, 30H           
    MOV AH, 02H         
    INT 21H
    XOR DX,DX
    MOV DX, OFFSET RESTA
    MOV AH, 09H
    INT 21H
    XOR DL,DL            
    MOV DL,VALOR1              
    SUB DL,VALOR2
    ADD DL, 30H
    MOV AH, 02H         
    INT 21H
    XOR DX,DX
    MOV DX, OFFSET MULTI
    MOV AH, 09H
    INT 21H
    XOR AX,AX
    XOR AL,AL             
    MOV AL, VALOR1        
    MUL VALOR2
    MOV DX, AX
    ADD DX, 30H
    MOV AH, 02H
    INT 21H
    XOR DX,DX
    MOV DX, OFFSET DIVID
    MOV AH, 09H
    INT 21H
    XOR AX,AX
    XOR AL,AL
    MOV AL,VALOR1        
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