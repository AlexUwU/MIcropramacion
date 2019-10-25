model small
.stack
.data

Continuar db ?
ImprimirX db 'x','$'

.code
    mov ax,@Data
    mov Ds,ax          
    mov cx,1                      
    
    LoopX:
    mov ah,09h
    lea dx,ImprimirX          
    int 21h
    
    mov AH, 01          
    int 16h      
    
    CMP AL, 0dh
    jz FinCiclo
    jmp ContinuarCiclo
    
    FinCiclo:
    mov cx,1
    jmp Next
    
    ContinuarCiclo:
    mov cx,2
    
    Next:    
    
    loop LoopX    
        
    mov ax, 0003H
    int 10H        


    finalizar:
     MOV AH, 4CH
     INT 21H
    
    
    
end