.model small
.stack
.data

UnidadesEntero db ?
DecenasEntero db ?
Entero db ?
Ingreso db 'Ingrese un Entero de dos digitos: ','$'
ResiduoBinario db ?
CocienteBinario db ?
Resultado db 'El equivalente en binario es: ','$'
Cont db 7
BitSalida1  db ?
BitSalida2  db ?
BitSalida3  db ?
BitSalida4  db ?
BitSalida5  db ?
BitSalida6  db ? 
BitSalida7 db ?


.code

    mov ax,@Data
    mov ds,ax
    
    mov ah,09h
    lea dx,Ingreso
    int 21h
      
    mov ah,01h
    int 21h
    sub al,30h
    mov DecenasEntero,al
      
    mov ah,01h
    int 21h
    sub al,30h
    mov UnidadesEntero,al
        
    mov al,DecenasEntero
    mov bl,10
    mul bl
    add al,UnidadesEntero
    mov Entero,al   
    mov al,Entero 
    mov CocienteBinario,al                                
    
    mov ax, 0003H
    int 10H
    
    mov ah,09h
    lea dx,Resultado
    int 21h
    
    mov cl,1
                    
    LoopBinario:   
    
    InicioLoop:    
    xor ax,ax
    mov al,CocienteBinario
    mov bl,2
    div bl
    
    mov CocienteBinario,al
    mov ResiduoBinario,ah        
    
    mov CocienteBinario,al
    cmp al,0
    jz true
    jmp false
    
    true:
    mov cl,1 
    jmp Imprimir 

    false: 
    mov cl,2   
        
    Imprimir:
    call ImprimirBinario
           
    
    Avanzar:
    
    dec Cont
    
    loop LoopBinario
    
    call ImprimirResultado
    
    jmp finalizar
    
    proc ImprimirBinario 
    mov al,Cont    
    cmp al,1
    
    jz BitUno    
    cmp al,2
    jz BitDos    
    cmp al,3
    jz BitTres    
    cmp al,4
    jz BitCuatro    
    cmp al,5
    jz BitCinco
    cmp al,6
    jz BitSeis
    cmp al,7
    jz BitSiete
        
    BitUno:
    mov al,ResiduoBinario
    mov BitSalida1,AL
    jmp fin
    
    BitDos:
   mov al,ResiduoBinario
   mov BitSalida2,AL
    jmp fin
    
    BitTres:
  mov al,ResiduoBinario
  mov BitSalida3,AL
    jmp fin
    
    BitCuatro:
    mov al,ResiduoBinario
    mov BitSalida4,AL
    jmp fin
    
    BitCinco:
   mov al,ResiduoBinario
   mov BitSalida5,AL
    jmp fin    
    
    BitSeis:
    mov al,ResiduoBinario
    mov BitSalida6,AL
    jmp fin
    
    
    BitSiete:
    mov al,ResiduoBinario
    mov BitSalida7,AL
    jmp fin 
    
    fin:
    ret
    ImprimirBinario endp 
    
    
    proc ImprimirResultado
        
    MOV dL,BitSalida1
    ADD DL,30H
    MOV AH,02
    int 21h
    
     MOV dL,BitSalida2
    ADD DL,30H
    MOV AH,02
    int 21h
    
     MOV dL,BitSalida3
    ADD DL,30H
    MOV AH,02
    int 21h
    
     MOV dL,BitSalida4
    ADD DL,30H
    MOV AH,02
    int 21h
    
     MOV dL,BitSalida5
    ADD DL,30H
    MOV AH,02
    int 21h
    
     MOV dL,BitSalida6
    ADD DL,30H
    MOV AH,02
    int 21h
    
     MOV dL,BitSalida7
    ADD DL,30H
    MOV AH,02
    int 21h
    
    ret
    ImprimirResultado endp
     
    
    finalizar:
    MOV AH, 4CH
    INT 21H

end