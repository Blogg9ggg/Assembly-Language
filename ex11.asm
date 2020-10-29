; 实验 11

assume cs:codesg

inputsg segment
	; 49 个字符 + 1
	; A -> 65, Z -> 5Ah
	; a -> 97, z -> 122
	; -32
	db "Beginner's All-purpose Symbolic Instruction Code.",0
inputsg ends

outputsg segment
	db 50 dup (0)
outputsg ends

codesg segment
start:	mov ax,inputsg
		mov ds,ax
		mov si,0
		
		mov ax,outputsg
		mov es,ax
		mov di,0
		
		call letterc
		
		mov ax,4c00h
		int 21h

letterc:mov cx,50

loop1:	mov al,ds:[si]
		mov es:[di],al
		inc si
		
		mov bl,97
		cmp al,bl
		jnb nless97
		
		
temp:	inc di
		loop loop1
		ret
		
change: sub al,32
		mov es:[di],al
		jmp temp
		
nless97:cmp al,122
		jna change
		
codesg ends

end start