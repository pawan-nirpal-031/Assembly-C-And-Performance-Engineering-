; constants can be declared by 'equ' or '%assign' or '%define', syntax : "symbol_name equ expression" opreand of equ can be an expresion

SYS_EXIT equ 1 
SYS_WRITE equ 4 
STDIN equ 0 
STDOUT equ 1 

section .data 
	msg1 db 'Hello engineer',10 
	len1 equ $-msg1 
	
	msg2 db 'let us do some system programming',10
        len2 equ $-msg2 
	
	msg3 db 'Linux Assembly programming',10
        len3 equ $-msg3


section .text
	global _start

_start:
	mov eax,SYS_WRITE 
	mov ebx,STDOUT 
	mov ecx,msg1 
	mov edx, len1 
	int 80h 
	
	mov eax,SYS_WRITE
        mov ebx,STDOUT
        mov ecx,msg2
        mov edx,len2
        int 80h 


	mov eax,SYS_WRITE
        mov ebx,STDOUT
        mov ecx,msg3
        mov edx, len3
        int 80h


	mov eax,SYS_EXIT 
	int 80h

