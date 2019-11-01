.model small
.DATA
    l DB 0FFH DUP(?)                      ;Resultante
    cont DB ?
.STACK
.CODE

programa:
    MOV AX,@DATA
    MOV DS, AX
    MOV AX, 03H
    INT 10H    
    MOV SI, 0
    MOV cont, 0
Lectura:
    XOR AX,AX
    MOV AH, 01H
    INT 21H
    CMP AL, 0DH
    JZ Imprimir
    MOV l[SI], AL
    INC SI
    INC cont
    JMP Lectura
Imprimir:
    MOV CL, cont
    MOV SI, 0
Aux:
    MOV AH, 02H
    MOV DL, l[SI]
    SUB DL, 20H
    INT 21H
    INC SI
    LOOP Aux
    MOV AH,4CH
    INT 21H             
end programa