section .data 
	m1 db "enter the number :",10
	l1 equ $-m1 
	
	evn db "given number is EVEN"
	l2 equ $-evn 
	
	odd db "given number is ODD"
	l3 equ $-odd 
	

section .bss 
	num resb 1 

section .text 
	global _start 

_start: 
	mov eax,4 
	mov ebx,1 
	mov ecx,m1 
	mov edx,l1 
	int 128 
	
	mov eax,3 
	mov ebx,0 
	mov ecx,num 
	mov edx,1 
	int 128 
	
	mov eax,[num] 
	sub eax,'0' 
	
	and eax,1 
	jz print_even
	jmp print_odd 
	 

exit_prog:
	mov eax,1
        int 128

print_even:
	mov eax,4
        mov ebx,1
	mov ecx,evn
	mov edx,l2	
	int 128
	jmp exit_prog

print_odd: 
	mov eax,4
        mov ebx,1
	mov ecx,odd 
	mov edx,l3 
	int 128 
 	jmp exit_prog
