section .data 
	count equ 3 

section .text
	global _start 

_start: 
	mov eax,4 
	mov ebx,1 
	mov ecx,count
	mov edx,1   
	int 80h 

	mov eax,1 
	int 80h 
