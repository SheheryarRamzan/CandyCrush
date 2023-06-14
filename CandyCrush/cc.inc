PRNSTR MACRO MSG
    MOV AH,09H
    LEA DX,MSG
    INT 21H
ENDM

DisplaySecondScreen MACRO
	mov ah, 0	
	mov al, 12h
	int 10h
		
	displayRules
	inputRules
ENDM


DisplayFirstScreen MACRO

	mov ah, 0		
	mov al, 12h
	int 10h
	
	drawSquareBorder
	displayintialscreen	
	inputPlayerName
	displayEnterLevel
	inputLevel
	
EndM


StartLevelOne MACRO

push SI
push CX
push BX
    	
mov SI, 0
mov CX, 100

mov primenumone, 47
mov primenumtwo, 13
mov range_random, 5	
fillLoop:  
    RandomFunc
    mov BL, rand_num
    mov ArrayLevelOne[SI], BL  
    inc SI
    loop fillLoop      

mov ah, 0
mov al, 12h
int 10h
		   
pop BX
pop CX
pop SI
   
                                                                                                                                                                                                                                                                
EndM  

RandomFunc MACRO     
    
    push AX
    push BX
	push CX
    push DX
    
	genAgain:
		mov AX, primenumone  
		mov BX, 1
		mul BX
		
		add AX, primenumtwo 
		mov BH, range_random
		div BH
				  
		mov rand_num, AH
		inc rand_num             
		
		cmp isBomb, 1	
		jne cont
		mov CL, rand_num
		cmp CL, bombNum
		jne cont
		mov primenumone, AX
		mov primenumtwo, DX
		jmp genAgain
	
	cont:
		mov primenumone, AX
		mov primenumtwo, DX

    pop DX
	pop CX
    pop BX
    pop AX 
        
ENDM

DarwBox MACRO
    
    push AX
    push BX
    push CX
    push DX
        
    mov DH, row_tile
    mov DL, col_tile
    
    mov AH, 02h		  
    int 10h
    
    mov AL, Num_Tile    
	cmp AL, 0	   
	je drawZero
	
	cmp AL, 'B'
	je drawBomb
	
	cmp AL, 'X'
	jne cont
	
	mov BL, 0Fh		  
	mov AL, 'X'
	mov BH, 0
	mov CX, 1
	jmp exit
		
	drawBomb:
		mov BL, 0Dh		  
		mov AL, 'B'
		mov BH, 0
		mov CX, 1
		jmp exit
	
	drawZero:		
		mov BL,	0Eh
		jmp next
	
	cont:
		mov BL, 15       
	next:
		add AL, 48		  
		mov BH, 0		  ; Page number = 0
		mov CX, 1		  ; Display once
    
	exit:
    mov AH, 9h
    int 10h    
    
    pop DX
    pop CX
    pop BX
    pop AX
    
ENDM    

drawBoardGrid MACRO
	push AX
	push BX
	push CX
	push DX
	push SI
	
	mov DrawSquare_Color, 07
	mov DrawSquare_Row, 88
	mov DrawSquare_Col, 148
	mov Square_Size, 50
	mov loopCounter, 0
	mov DX, Square_Size

	mov SI, 0
	printLoop:
		cmp loopCounter, 7
		je finishPrint   
		
		mov CX, 7
		printRow:
			cmp ArrayLevelOne[SI], 'B'
			je setBombTileColor
			cmp ArrayLevelOne[SI], 'X'
			jne cont1
			mov DrawSquare_Color, 07h	
			jmp cont1
			
			setBombTileColor:
				mov DrawSquare_Color, 07h	
		
			cont1:
				drawSquare  
				add DrawSquare_Col, 50
				mov DrawSquare_Color, 9
				inc SI
				loop printRow
	 
		add DrawSquare_Row, 50
		mov DrawSquare_Col, 148
		inc loopCounter
		jmp printLoop
	 
	finishPrint:   
		cmp levelNum, 2
		jne finish

	finish:
		pop SI
		pop DX
		pop CX
		pop BX
		pop AX 
		  
          
ENDM

drawSquare MACRO

	push DX
	push CX
	push AX
	
	mov BX, 0
	mov AX, Square_Size              ; Length of line in pixels
	mov DX, DrawSquare_Row
	mov CX, DrawSquare_Col
	
	push CX
	push DX
	push AX
	call printHorizontalLine
	call printVerticalLine  
	
	pop AX
	pop DX
	add DX, AX
	dec DX
	push DX
	push AX
	call printHorizontalLine
	
	pop AX
	pop DX
	mov DX, DrawSquare_Row
	pop CX
	add CX, AX   
	dec CX
	push CX
	push DX
	push AX
	call printVerticalLine
	 
	pop AX
	pop DX 
	pop CX 
	pop AX
	pop CX 
	pop DX  

ENDM


inputRules MACRO
	
	mov dl, 33
	mov dh, 14
	mov ah, 02
	int 10h
	
	mov ah, 01
	int 21h
	sub al, 48
	mov rules, al
	
ENDM


displayRules MACRO
	
	
	mov drawstring_movRow, 2			; Display moves string
    mov drawstring_movCol, 28 
    mov drawstring_movColor, 2
    lea SI, TitleRules
    call WriteString  
	
	mov drawstring_movRow, 6		; Display moves string
    mov drawstring_movCol, 00 
    mov drawstring_movColor, 3
    lea SI, rule1
    call WriteString 

	mov drawstring_movRow, 7		; Display moves string
    mov drawstring_movCol, 00 
    mov drawstring_movColor, 3
    lea SI, rule1b
    call WriteString 	

	mov drawstring_movRow, 10		; Display moves string
    mov drawstring_movCol, 00 
    mov drawstring_movColor, 4
    lea SI, rule2
    call WriteString 
	
	mov drawstring_movRow, 13		; Display moves string
    mov drawstring_movCol, 00 
    mov drawstring_movColor, 5
    lea SI, rule3
    call WriteString 
	
	mov drawstring_movRow, 16		; Display moves string
    mov drawstring_movCol, 00 
    mov drawstring_movColor, 6
    lea SI, rule4
    call WriteString 

	mov dh, 22
	mov dl, 20
	mov si, 0
	printingprompt:
		mov ah, 02
		int 10h
		mov ah, 09 
		mov al, prompt[si]
		mov bl, 0Eh
		mov cx, 1
		mov bh, 0
		int 10h	
		inc dl
		inc si
		cmp prompt[si], "$"
		jne printingprompt
	
	

ENDM



displayBomb MACRO
	
	
	mov drawstring_movRow, 5		; Display moves string
    mov drawstring_movCol, 20
    mov drawstring_movColor, 4
    lea SI, bombmsg
    
	call WriteString  

ENDM	
 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


inputLevel MACRO

	
	mov dl, 33
	mov dh, 14
	mov ah, 02
	int 10h
	
	mov ah, 01
	int 21h
	sub al, 48
	mov levelNum, al
	
ENDM


displayEnterLevel MACRO
	
	mov drawstring_movRow, 15		; Display moves string
    mov drawstring_movCol, 13 
    mov drawstring_movColor, 1
    lea SI, enterLevelMSG
    call WriteString 
ENDM


inputPlayerName MACRO
	
	mov dl, 30
	mov dh, 13
	mov ah, 02
	int 10h
		
	lea SI, playerName
	mov ah, 01h

	inputChar:
		int 21h
		mov [si], al
		inc si
		cmp al, 13
		jne inputChar
			
ENDM


displayintialscreen MACRO

	mov drawstring_movRow, 13		; Display moves string
    mov drawstring_movCol, 13 
    mov drawstring_movColor, 3
    lea SI, enterNameMSG
    call WriteString 
	

	mov drawstring_movRow, 2		; Display moves string
    mov drawstring_movCol, 33
    mov drawstring_movColor, 12
    lea SI, gamename
    call WriteString 

	
	mov drawstring_movRow, 25		; Display moves string
    mov drawstring_movCol, 15 
    mov drawstring_movColor, 13
    lea SI, contributors
    call WriteString 
	
	
	
ENDM


printPlayerName MACRO
	
	
	mov dh, 2
	mov dl, 7
	mov si, 0
	
	printingName:
		mov ah, 02
		int 10h
		mov ah, 09 
		mov al, playerName[si]
		mov bl, 0Ch
		mov cx, 1
		mov bh, 0
		int 10h	
		
		inc dl
		inc si
		cmp playerName[si], 13
		jne printingName 	
ENDM



drawSquareBorder MACRO
	
	mov bx, 0
	mov cx, 42
	mov dx, 20
	topLineforgamename:
		mov ah, 0Ch
		mov al, 0eh
		push bx
		mov bh, 0
		int 10h
		pop bx
		
		inc cx
		inc bx
		cmp bx, 555
		jb topLineforgamename

	mov bx, 0
	mov cx, 42
	mov dx, 55
	bottomLineforgamename:
		mov ah, 0Ch
		mov al, 0eh
		push bx
		mov bh, 0
		int 10h
		pop bx
		
		inc cx
		inc bx
		cmp bx, 555
		jb bottomLineforgamename	
	
	mov bx, 0
	mov cx, 42
	mov dx, 150
	topLineforname:
		mov ah, 0Ch
		mov al, 0eh
		push bx
		mov bh, 0
		int 10h
		pop bx
		
		inc cx
		inc bx
		cmp bx, 555
		jb topLineforname
	
	
	mov bx, 0
	mov cx, 42
	mov dx, 300
	bottomLineforname:
		mov ah, 0Ch
		mov al, 0eh
		push bx
		mov bh, 0
		int 10h
		pop bx
		
		inc cx
		inc bx
		cmp bx, 555
		jb bottomLineforname	
		
	
	
	mov bx, 0
	mov cx, 597	;COL
	mov dx, 150
	rightLineforname:
		mov ah, 0Ch
		mov al, 0eh
		push bx
		mov bh, 0
		int 10h
		pop bx
		
		inc dx
		inc bx
		cmp bx, 150
		jb rightLineforname	
		
	mov bx, 0
	mov cx, 42
	mov dx, 150
	leftLineforname:
		mov ah, 0Ch
		mov al, 0Eh
		push bx
		mov bh, 0
		int 10h
		pop bx
		
		inc dx
		inc bx
		cmp bx, 150	;Length of line
		jb leftLineforname	
		
	
ENDM