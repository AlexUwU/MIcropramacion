.386
.model flat, stdcall
option casemap:none
; Includes
include \masm32\include\windows.inc
include \masm32\include\kernel32.inc
include \masm32\include\masm32.inc
include \masm32\include\masm32rt.inc 
; librerias
includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\masm32.lib
; Segmento de Datos
.DATA  

NumeroEntero1 dword 3
NumeroEntero2 dword 2
TotalSuma dword 0
TotalResta dword 0
Total1 DB 0aH,0DH,"El resultado de la suma es: " ,0
Total2 DB 0aH,0DH,"El resultado de la resta es: " ,0
Comparador1 DB 0aH,0DH,"El numero a es mayor" ,0
Comparador2 DB 0aH,0DH,"El numero b es mayor" ,0
Comparador3 DB 0aH,0DH,"Los dos numeros son iguales" ,0

.CODE 
 
programa:
main PROC
	
	mov eax,NumeroEntero1
	ADD eax,NumeroEntero2
	mov TotalSuma,eax
	ADD TotalSuma,30h

	mov eax,NumeroEntero1
	SUB eax,NumeroEntero2
	mov TotalResta,eax
	ADD TotalResta,30h

	INVOKE StdOut, addr Total1
	INVOKE StdOut, addr TotalSuma

	INVOKE StdOut, addr Total2
	INVOKE StdOut, addr TotalResta

	mov eax,NumeroEntero1
	cmp eax,NumeroEntero2
	jz Igual
	jc M2
	jnz M1
	
	M1:
	INVOKE StdOut, addr Comparador1
	jmp finProceso

	M2:
	INVOKE StdOut, addr Comparador2
	jmp finProceso

	Igual:
	INVOKE StdOut, addr Comparador3
	jmp finProceso



	finProceso:
	INVOKE ExitProcess,0
	main ENDP
END programa
