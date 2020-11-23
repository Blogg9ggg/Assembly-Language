assume cs:code

code segment
start:	
	;;;	年
		mov al,9
		out 70h,al	
		in al,71h
		
		mov ah,al
		mov cl,4
		shr ah,cl
		and al,00001111b
		
		add ah,30h
		add al,30h
		
		mov bx,0b800h
		mov es,bx
		mov byte ptr es:[160*12+40*2-6],ah
		mov byte ptr es:[160*12+40*2-4],al
		mov al,'/'
		mov byte ptr es:[160*12+40*2-2],al

	;;;	月
		mov al,8
		out 70h,al	
		in al,71h
		
		mov ah,al
		mov cl,4
		shr ah,cl
		and al,00001111b
		
		add ah,30h
		add al,30h
		
		mov bx,0b800h
		mov es,bx
		mov byte ptr es:[160*12+40*2],ah
		mov byte ptr es:[160*12+40*2+2],al
		mov al,'/'
		mov byte ptr es:[160*12+40*2+4],al
		
	;;;	日
		mov al,7
		out 70h,al	
		in al,71h
		
		mov ah,al
		mov cl,4
		shr ah,cl
		and al,00001111b
		
		add ah,30h
		add al,30h
		
		mov bx,0b800h
		mov es,bx
		mov byte ptr es:[160*12+40*2+6],ah
		mov byte ptr es:[160*12+40*2+8],al
		mov al,' '
		mov byte ptr es:[160*12+40*2+10],al
		
	;;;	时
		mov al,4
		out 70h,al	
		in al,71h
		
		mov ah,al
		mov cl,4
		shr ah,cl
		and al,00001111b
		
		add ah,30h
		add al,30h
		
		mov bx,0b800h
		mov es,bx
		mov byte ptr es:[160*12+40*2+12],ah
		mov byte ptr es:[160*12+40*2+14],al
		mov al,':'
		mov byte ptr es:[160*12+40*2+16],al
		
	;;;	分
		mov al,2
		out 70h,al	
		in al,71h
		
		mov ah,al
		mov cl,4
		shr ah,cl
		and al,00001111b
		
		add ah,30h
		add al,30h
		
		mov bx,0b800h
		mov es,bx
		mov byte ptr es:[160*12+40*2+18],ah
		mov byte ptr es:[160*12+40*2+20],al
		mov al,':'
		mov byte ptr es:[160*12+40*2+22],al
		
	;;;	秒
		mov al,0
		out 70h,al	
		in al,71h
		
		mov ah,al
		mov cl,4
		shr ah,cl
		and al,00001111b
		
		add ah,30h
		add al,30h
		
		mov bx,0b800h
		mov es,bx
		mov byte ptr es:[160*12+40*2+24],ah
		mov byte ptr es:[160*12+40*2+26],al
		
		mov ax,4c00h
		int 21h
		
code ends
end start