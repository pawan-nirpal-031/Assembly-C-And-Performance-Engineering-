section .data 
	message: db 'hello, world!', 10 

section .text
global _start

_start:
	mov  rax,1 	;write system call number 
	mov  rdi,1	;std output discriptor 
	mov  rsi,message  ; string start address 
	mov  rdx,14	; string lenght in bytes
	syscall 
	
	mov  rax,60	;exit system call number
	xor  rdi,rdi	;clear rdi 
	syscall

