.MODEL small
.DATA
N1 DB 0
N2 DB 0
NA DB 0
NMS DB 0
NRD DB 0
iguales DB ' Son iguales $'
mayor DB ' el primero es mayor $'
menor DB ' el primero es menor $'
multiplicacion DB ' el resultado de la multiplicacion es: $'
division DB ' el resultado de la division es: $'
residuo DB ' el residuo de la division es: $'
.STACK
.CODE
programa:
;inicia programa
    MOV AX, @DATA ; se obtiene la direccion de inicio del segmento de datos
    Mov DS, AX ; asignamos al registro data segment la direccion de inicio de segmento
;comparacion de numeros
    ;leer numero 1
    XOR AX,AX
    MOV AH,01h
    INT 21h
    SUB AL,30h ;obtiene el valor real
    MOV N1,AL
    ;leer numero 2
    XOR AX,AX
    MOV AH, 01h
    INT 21h
    SUB AL, 30h ; obtener el valor real
    MOV N2,AL
    MOV DL,N1
    CMP DL,N2
    JE SonIguales
    JG PrimeroMayor
    JL PrimeroMenor

SonIguales:
    MOV DX,offset iguales ;carga la referencia de la cadena al registro DX
    MOV AH,09h ;carga valor interrupcion imprimir cadena
    INT 21h
    JMP MultiplicacionSumas ;salta a la multiplicacion
   
PrimeroMayor:
    MOV DX,offset mayor
    MOV AH,09h
    INT 21h
    JMP MultiplicacionSumas ;salta a la multiplicacion
   
PrimeroMenor:
    MOV DX,offset menor
    MOV AH,09h
    INT 21h
    JMP MultiplicacionSumas ;salta a la multiplicacion
   
MultiplicacionSumas:
    XOR AX,AX
    MOV CL,N1
    MOV DL,0d
    JMP SumasConsecutivas
   
SumasConsecutivas:
    ADD DL,N2
    CMP DL,9d
    JG Acarreo
    DEC CL
    CMP CL,0d
    JNE SumasConsecutivas
    JMP ResultadoMult
   
Acarreo:
    ADD NA,1d
    SUB DL,10d
    DEC CL
    CMP CL,0d
    JNE SumasConsecutivas
    JMP ResultadoMult
   
ResultadoMult:
    MOV NMS,DL
    MOV DX,offset multiplicacion
    MOV AH,09h
    INT 21h
    XOR DX,DX
    MOV DL,NA
    ADD DL,30h
    MOV AH,02h
    INT 21h
    MOV DL,NMS
    ADD DL,30h
    MOV AH,02h
    INT 21h
    JMP DivisionRestas
   
DivisionRestas:
    XOR AX,AX
    MOV DL,N1
    MOV CL,0d
    JMP RestasConsecutivas
   
RestasConsecutivas:
    SUB DL,N2
    CMP DL,0d
    JE DivisionEntera
    CMP DL,N2
    JL DivisionConResiduo
    INC CL
    JMP RestasConsecutivas
   
DivisionEntera:
    INC CL
    MOV DX,offset division
    MOV AH,09h
    INT 21h
    XOR DX,DX
    MOV DL,CL
    ADD DL,30h
    MOV AH,02h ;muestra el resultado de la division
    INT 21h
    JMP terminar
   
DivisionConResiduo:
    INC CL
    MOV NRD,DL
    MOV DX,offset division
    MOV AH,09h
    INT 21h
    XOR DX,DX
    MOV DL,CL
    ADD DL,30h
    MOV AH,02h
    INT 21h
    MOV DX,offset residuo
    MOV AH,09h
    INT 21h
    XOR DX,DX
    MOV DL,NRD
    ADD DL,30h
    MOV AH,02h
    INT 21h
    JMP terminar
   
   
;terminar programa
terminar:
MOV AH, 4Ch ; comando terminar proceso
INT 21h
END programa
