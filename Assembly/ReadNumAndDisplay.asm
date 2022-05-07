segment .data
	msg db 'Enter a number :',10 
	msglen equ $-msg 
	dispmsg db 'You entered : '
	dispmsglen equ $-dispmsg

segment .bss
	num resb 5 

segment .text 
	global _start

_start: 
	mov eax,4 ; user prompt  
	mov ebx,1 
	mov ecx,msg 
	mov edx, msglen
	int 80h 
	
	; read user input 
	mov eax, 3 
	mov ebx, 2 
	mov ecx,num  
	mov edx,5 
	int 80h 
	
	; display prompt 
	mov eax,4 
        mov ebx,1
        mov ecx,dispmsg
        mov edx,dispmsglen
        int 80h	
	
	; show the number 
	mov eax,4 ; user prompt
        mov ebx,1
        mov ecx,num
        mov edx,5 
        int 80h

	; exit syscall 
	mov eax,1 
	mov ebx,0 
	int 80h 

