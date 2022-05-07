segment .data 
	msg db 'Hello, World!', 10 
	len equ $-msg  ; $ refers to addr of curr line and $-msg will get the string length 


segment .text 
	global _start


_start: ; tells the linker entry point of program 
	mov edx, len 
	mov ecx, msg
	mov ebx, 1 ; stdout file discriptor 
	mov eax, 4 ; syscall number print 
	int 0x80  ;interrupt for kernal it uses the reister which has file discriptor (here ebx) to determine which system call tp be invoked, this is a vectored intr 
	
	mov eax,1 ; exit sys call number 
	int 0x80;  call kernal	  

