.Model small 
.DATA                                   ;Variable que contiene el texto a mostrar 
cadena_nombre DB'Alexander Solorzano$'  ;$ significa final de cadena
cadena_carne DB ' 1243717$ ' 
otra DB 'El caracter ascii escogido es: $'
.Stack 
.CODE 
Programa:                               ;etiqueta de inicializacion del programa 
MOV AX, @DATA                            ;guarda direccion del inicio del segmento del dato 
MOV DS, AX 
                                        ;imprimir cadena 
MOV AX, OFFSET cadena_nombre            ;asignamos la variable string en DX
MOV DX, AX 
MOV AH, 09h                             ;imprimir un string      
INT 21h

MOV AH, 02h
MOV DX, 10 
INT 21h
                                 ;ejecuta la interrupcion de imprimir 
MOV BX, OFFSET cadena_carne
MOV DX, BX
MOV AH, 09h 
INT 21h 


MOV AH, 02h
MOV DX, 10 
INT 21h

XOR DX, DX 
MOV DX, OFFSET OTRA
MOV AH, 09h
INT 21h 

MOV AH, 02h
MOV DX, 60
int 21h


MOV AH, 4Ch                              ;termina proceso 
INT 21h                                 ;ejecuta la interrupcion
END Programa                            ;termina programa