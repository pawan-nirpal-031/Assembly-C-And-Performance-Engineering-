section .data
	codes: db '0123456789ABCDEF'

section .text 
global _start
_start:
	mov rax, 0x1122334455667788
	mov rdi, 1
	mov rdx, 1 
	mov rcx, 64 ; since symbol 1 in hex has 4 bit rep. 
.loop: 
	push rax 
	sub rcx,4 
	sar rax,cl ; cl is 4 bits of lowest byte of cx
	and rax,0xf 
	lea rsi, [codes+rax]
	mov rax,1

	; syscall does not change rcx and r11
	push rcx 
	syscall 
	pop rcx 
	
	pop rax
	test rcx,rcx ; used for 'it is a zero? check'
	jnz .loop		
	
	mov rax,60 ; invoking exit system call 
	xor rdi,rdi 
	syscall
