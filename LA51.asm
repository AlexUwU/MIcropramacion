.model small
.stack
.data

UnidadesEntero db ?
UnidadesDecenas db ?
Entero db ?
Ingreso db 'Ingrese un numero: ','$'
Resultado db 'Los factores resultantes son: ',0AH,0DH,'$'
Cont db 0
res db ?


.code
    mov ax,@Data
    mov Ds,ax            
               
    mov ah,09h
    lea dx,Ingreso
    int 21h
        
    mov ah,01h
    int 21h
    sub al,30h
    mov UnidadesDecenas,al
  
    mov ah,01h
    int 21h
    sub al,30h
    mov UnidadesEntero,al
        
    mov al,UnidadesDecenas
    mov bl,10
    mul bl
    add al,UnidadesEntero
    mov Entero,al   
    mov al,Entero            
       
    mov ax, 0003H
    int 10H
        
    mov cl,Entero
    mov ah,09h
    lea dx,Resultado
    int 21h
        
    LoopFactores:
    mov al,Cont
    add al,1
    mov  Cont,al    
    xor ax,ax
    mov bl, Cont
    mov al, Entero
    div bl    
    mov res,ah
    
    mov al,res
    cmp al,0
    jz FactoresNumero
    jmp Next
    
    FactoresNumero:         
    mov ah,02h
    mov dx,32
    int 21h    
    
    mov al, Cont
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
           
    Next:   
            
    loop LoopFactores

    
    jmp finalizar

    finalizar:    
    MOV AH, 4CH
    INT 21H


end