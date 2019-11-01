.model small
.DATA
    r DB 0FFH DUP(?)                      ;Resultante
    conta DB ?
.STACK
.CODE

programa:
    MOV AX,@DATA
    MOV DS, AX
    
    ;Limpieza de pantalla
    MOV AX, 03H
    INT 10H
    
    MOV SI, 0
    MOV conta, 0
Lectura:
;Lector de una tecla
    XOR AX,AX
    MOV AH, 01H
    INT 21H
    CMP AL, 0DH
    JZ Imprimir
    MOV r[SI], AL
    INC SI
    INC conta
    JMP Lectura
    
Imprimir:
    MOV CL, conta
    MOV SI, 0
Aux:
    MOV AH, 02H
    MOV DL, r[SI]
    SUB DL, 20H
    INT 21H
    INC SI
    LOOP Aux
    ;Terminar programa
    MOV AH,4CH
    INT 21H             ;Se invoca a la interrupcion del DOS 21H para finalizar 
end programa