.model small
.DATA
    l1 DB 0FFH DUP(?)                      
    l2 DB 0FFH DUP(?)                    
    cont DB ?
    cont1 DB ?
    msg db 'Ingrese la cadena numero-1 : $'
    msg2 db 'Ingrese la cadena numero-2 : $'
    msg3 db 'Las cadenas son diferentes$'
    msg4 db 'Las cadenas son iguales$'
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
;Lector de una tecla
    XOR AX,AX
    MOV AH, 01H
    INT 21H
    CMP AL, 0DH
    JZ Siguiente
    MOV l1[SI], AL
    INC SI
    INC cont
    JMP Lectura
    
Siguiente:
    MOV cont1, 0
    MOV SI, 0

    MOV DX, OFFSET msg2
    MOV AH, 09H
    INT 21H
Lectura1:
    XOR AX,AX
    MOV AH, 01H
    INT 21H
    CMP AL, 0DH
    JZ Terminar
    MOV l2[SI], AL
    INC SI
    INC cont1
    JMP Lectura1
Terminar:
    MOV AL, cont
    CMP cont1, AL
    JNE Diferente
    MOV SI, 0
    MOV CL, cont
Validar:
    MOV AL, l2[SI]
    CMP l1[SI], AL
    JNE Diferente
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