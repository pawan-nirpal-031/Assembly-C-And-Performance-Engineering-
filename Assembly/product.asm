; Multiplicand in both cases will be in an accumulator, depending upon the size of the multiplicand and the multiplier and the generated product is also stored in two registers depending upon the size of the operands When two bytes are multiplied The multiplicand is in the AL register, and the multiplier is a byte in the memory or in another register. The product is in AX. High-order 8 bits of the product is stored in AH and the low-order 8 bits are stored in AL When two one-word values are multiplied. The multiplicand should be in the AX register, and the multiplier is a word in memory or another register. For example, for an instruction like MUL DX, you must store the multiplier in DX and the multiplicand in AX. The resultant product is a doubleword, which will need two registers. The high-order (leftmost) portion gets stored in DX and the lower-order (rightmost) portion gets stored in .  

sys_read equ 3 
sys_write equ 4 
sys_exit equ 1 
stdin equ 0 
stdout equ 1 




section .data 
	msg1 db "Enter a number", 10 
	len1 equ $-msg1 
	
	msg2 db "Enter another number", 10
        len2 equ $-msg2
	
	msg3 db "Product is : "
	len3 equ $-msg3 
	

section .bss 
	num1 resb 2 
	num2 resb 2 
	res resb 2

section .text 
	global _start 
	

_start:
	mov eax,sys_write 
	mov ebx,stdout 
	mov ecx,msg1 
	mov edx,len1 
	int 128 

	mov eax,sys_read 
	mov ebx,stdin  
	mov ecx,num1 
	mov edx,2 
	int 128 
	
	mov eax,sys_write 
	mov ebx,stdout 
	mov ecx,msg2 
	mov edx,len2  
	int 128 
	
	mov eax,sys_read 
	mov ebx,stdin  
	mov ecx,num2 
	mov edx,2 
	int 128 
	
	mov eax,sys_write 
	mov ebx,stdout 
	mov ecx,msg3 
	mov edx,len3 
	int 128 
	
	mov ax,[num1] 
	sub ax,'0' 
	
	mov bx,[num2] 
	sub bx,'0' 

	mul bx 
	add al,'0' 
	mov [res],al  
	
	mov eax,sys_write 
	mov ebx,stdout 
	mov ecx,res 
	mov edx,2 
	int 128 

	mov eax,sys_exit 
	int 128 
