.model small
.DATA
    r DB 0FFH DUP(?)                      ;Resultante
    r1 DB 0FFH DUP(?)                      ;Resultante
    conta DB ?
    conta2 DB ?
    msg db 'Ingrese la cadena1: $'
    msg2 db 'Ingrese la cadena2: $'
    msg3 db 'Las cadenas no son iguales$'
    msg4 db 'Las cadenas son iguales$'
.STACK
.CODE

programa:
    MOV AX,@DATA
    MOV DS, AX
    
    MOV SI, 0
    MOV conta, 0
    
    MOV DX, OFFSET msg
    MOV AH, 09H
    INT 21H
Lectura:
;Lector de una tecla
    XOR AX,AX
    MOV AH, 01H
    INT 21H
    CMP AL, 0DH
    JZ Siguiente
    MOV r[SI], AL
    INC SI
    INC conta
    JMP Lectura
    
Siguiente:
    MOV conta2, 0
    MOV SI, 0

    MOV DX, OFFSET msg2
    MOV AH, 09H
    INT 21H
Lectura1:
;Lector de una tecla
    XOR AX,AX
    MOV AH, 01H
    INT 21H
    CMP AL, 0DH
    JZ Terminar
    MOV r1[SI], AL
    INC SI
    INC conta2
    JMP Lectura1
    
Terminar:
    MOV AL, conta
    CMP conta2, AL
    JNE Diferente
    MOV SI, 0
    MOV CL, conta
Validar:
    MOV AL, r1[SI]
    CMP r[SI], AL
    JNE Diferente
    LOOP Validar
    JMP Iguales
Diferente:
    MOV DX, OFFSET msg3
    MOV AH, 09H
    INT 21H
    JMP Fin
Iguales:
    MOV DX, OFFSET msg4
    MOV AH, 09H
    INT 21H
Fin:
    ;Terminar programa
    MOV AH,4CH
    INT 21H             ;Se invoca a la interrupcion del DOS 21H para finalizar 
end programa