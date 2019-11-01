.model small
.DATA
    r DB 0FFH DUP(?)                      ;Resultante
    conta DB ?
    msg db 'Ingrese la cadena: $'
    msg3 db 'La cadena no es palindroma$'
    msg4 db 'La cadena es palindroma$'
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
    PUSH AX
    INC SI
    INC conta
    JMP Lectura
    
Siguiente:
    MOV SI, 0
    MOV CL, conta
Validar:
    XOR AX,AX
    POP AX
    CMP r[SI], AL
    JNE Diferente
    INC SI
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