segment .data 
	stars times 10 db '*' 

segment .text 
	global _start 
	

_start:
	mov eax,4 
	mov ebx,1 
	mov ecx,stars 
	mov edx,10
	int 80h 
	
	mov eax,1 
	int 80h 

