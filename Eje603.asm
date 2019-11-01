.model small
.DATA
    l1 DB 0FFH DUP(?)                      
    cont DB ?
    msg db 'Ingrese la cadena: $'
    msg3 db 'La cadena no es palindroma$'
    msg4 db 'La cadena es palindroma$'
.STACK
.CODE
programa:
    MOV AX,@DATA
    MOV DS, AX
    MOV SI, 0
    MOV cont, 0
    MOV DX, OFFSET msg
    MOV AH, 09H
    INT 21H
Lectura:
    XOR AX,AX
    MOV AH, 01H
    INT 21H
    CMP AL, 0DH
    JZ Siguiente
    MOV l1[SI], AL
    PUSH AX
    INC SI
    INC cont
    JMP Lectura
Siguiente:
    MOV SI, 0
    MOV CL, cont
Validar:
    XOR AX,AX
    POP AX
    CMP l1[SI], AL
    JNE Diferente
    INC SI
    LOOP Validar
    JMP Igual
Igual:
    MOV DX, OFFSET msg4
    MOV AH, 09H
    INT 21H
Diferente:
    MOV DX, OFFSET msg3
    MOV AH, 09H
    INT 21H
    JMP Fin
Fin:
    MOV AH,4CH
    INT 21H             
end programa