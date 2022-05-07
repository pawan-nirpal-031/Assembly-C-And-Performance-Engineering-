sys_exit equ 1 
sys_write equ 4 
stdin equ 0 
stdout equ 1 

section .data 
	m1 db 'Hello, World',10,0xD
	l1 equ $-m1 
	
	m2 db 'Welcome to the World of,',10,0xD
        l2 equ $-m2

	m3 db 'Linux asm programming'
        l3 equ $-m3


section .text 
	global _start

_start:
	mov eax,sys_write
	mov ebx, stdout
	mov ecx,m1 
	mov edx,l1
	int 80h
	
	mov eax,sys_write
        mov ebx, stdout
        mov ecx,m2
        mov edx,l2
	int 80h 	

	mov eax,sys_write
        mov ebx, stdout
        mov ecx,m3
        mov edx,l3
	int 80h
	
	mov eax, sys_exit 
	int 80h 
