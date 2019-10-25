.MODEL small
.STACK
.DATA
        
    IngresoNum db 0AH,0DH,'Ingrese numero: ','$'    
    n1 db ?
    n2 db ?
    Multiplicacion db 0
    Resultado db "El resultado es: ","$"
    
.code

programa:
    
    mov ax,@Data
    mov Ds,ax
    
    mov ah,09h
    lea dx,IngresoNum
    int 21h
    mov ah,01h
    int 21h
    suB al,30h
    mov n1,al
    
    mov ah,09h
    lea dx,IngresoNum
    int 21h
    mov ah,01h
    int 21h
    suB al,30h
    mov n2,al
       
    MOV CL,n1
    
    
    SumaSucesiva:    
    mov al,n2
    add al,Multiplicacion
    mov Multiplicacion,al
    LOOP SumaSucesiva        
    
    mov ax, 0003H
    int 10H
        
    mov ah,09
    lea dx,Resultado
    int 21h
        
    mov al,Multiplicacion        
    AAM
    mov bx,ax
    mov ah,02h
    mov dl,bh
    add dl,30h
    int 21h
    mov ah,02h
    mov dl,bl
    add dl,30h
    int 21h
   
    finalizar:
    MOV AH, 4CH
    INT 21H
            
END programa