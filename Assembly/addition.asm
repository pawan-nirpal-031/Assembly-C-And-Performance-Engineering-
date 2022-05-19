sys_exit equ 1 
sys_read equ 3 
sys_write equ 4 
stdin equ 0 
stdout equ 1 
	

segment .data 
	msg1 db "Enter a digit ",10 
	len1 equ $-msg1 
	
	msg2 db "Enter second digit ",10
        len2 equ $-msg2
	
	msg3 db "Sum is : " 
	len3 equ $-msg3 
	
	
segment .bss 
      num1 resb 2 
      num2 resb 2 
      res resb 1 

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
	
	
	; moving num1 to eax and num2 to ebx and subtracting ascii '0' to convert from char to decimal digit
	
	mov eax,[num1] 
	sub eax,'0' 
	
	mov ebx,[num2] 
	sub ebx,'0' 
	
	; now add eax and ebx and store into eax 
	add eax,ebx 
	; add '0' to convert from decimal digit to ASCII for writing to std output 

	add eax,'0' 
	

	mov [res],eax ; updating the sum into res variable
	
	; writing the value to stdout 
	mov eax,sys_write 
	mov ebx,stdout 
	mov ecx,res 
	mov edx,1 
	int 128 
	
	mov eax,sys_exit 
	xor ebx,ebx 
	int 128 
 





 
