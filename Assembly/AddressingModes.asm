segment .data
	name db 'Master Shifu' 
	len equ $-name
	
segment .text 
	global _start
	
_start:
	mov eax,4 
	mov ebx,1 
	mov ecx,name 
	mov edx,len 
	int 80h 
	
	mov [name], dword 'Oogway,' ; changing name to Oogway, Shifu 
	mov eax,4 
	mov ebx,1 
	mov ecx,name 
	mov edx,13 
	int 80h 

	mov eax,1 
	int 80h
	
