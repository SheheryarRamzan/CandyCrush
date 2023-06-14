include cc.inc

.MODEL SMALL
.STACK 100h


.DATA

;Vars for Rules screen
	TitleRules db "Learning How to Play","$"
	rules db ?
	rule1 db "1: You can clear candy pieces from the board by lining up 3 (or more) in a row","$" 
	rule1b db "which is accomplished by swapping pieces of candy in order to create three.","$"
	rule2 db '2: The number at the top of the screen is the number of moves remaining$'
	rule3 db '3: Progress bar in the upper-left corner of screen displays current score.$'
	rule4 db '4: Winning a game in Candy Crush Saga unlocks the next level.$'
	prompt db "Press Any Key To Move To Entered Level!!","$"
	boxlinerow db '__________________________________________$'
	boxlinecol db '|$'
	bombmsg db "B","$"

	;Vars for initial screen
	gamename db "CANDY CRUSH","$"
	contributors db "FAHAD SHEHERYAR","$"


	primenumone DW 47
	primenumtwo DW 13
	rand_num DB ?   
	range_random DB ?

	
	ArrayLevelOne DB 100 DUP(?)  

	
	row_tile DB ?
	col_tile DB ?
	Num_Tile DB ?


	Iterator_Row DB ?		     
	Iterator_Col DB ?		     
	temp DB ?
	loopCounter DB ?	            

	DrawSquare_Color DB 9
	DrawSquare_Row DW 0
	DrawSquare_Col DW 0
	Square_Size DW 50 ; 32

	
	drawstring_movRow DB ?
	drawstring_movCol DB ? 
	drawstring_movColor DB ?
	 
	ColMouse_Px DW ?
	RowMouse_Px DW ?
	board_tileRow DB ?
	board_tileCol DB ?

	
	Start_MouseColumn DW ?
	Start_MouseRow DW ?
	boxFillI DB ?
	boxFillO DB ?

	
	TileRow_Screen DB ?
	TileCol_Screen DB ?
	  
	
	One_Row DB ?
	One_Col DB ?
	One_Index DB ?

	Two_Row DB ?
	Two_Col DB ? 
	Two_Index DB ?
	Index_Temp DW ?
	 
	
	Index_Array DW ?


	Var_Temp DB ?
	Var_Temp2 DW ?
	TotalNum_Cols DB 10
	TotalNum_Rows DB 10
	Index_RowCrush DB 0
	Index_ColCrush DB 0
	VC_possible DB 0
	HC_possible DB 0
	isBomb DB 0
	bombNum DB ?
	Crush_Perpetual DB 0

	
	Row_DropDown DB ?
	Col_DropDown DB ?
	Row_Temp DB ?

	
	Bex_Index DW ?
	End_Index DW ?
	LengthCombination DB ?

	
	lastColIndex DB ?


	quotient DB ?
	remainder DB ?
	Print_CountNum DB ?
	Print_NumColour DB ? 
	Print_NumRow DB ?
	Print_NumCol DB ?

	
	score DW 0
	totalScore DW 0
	moves DW 15

	levelonemsg db "LEVEL 1", "$"
	leveltwomsg db "LEVEL 2", "$"
	levelthreemsg db "LEVEL 3", "$"

	
	enterNameMSG db "Enter Your Name: ","$"
	CandyCrushMsg db "Candy Crush Game","$"
	enterLevelMSG db "Enter Level Number: ","$"
	playerName db 20 DUP(?)
	LengthOfSquare dw ?	; x-axis
	WidthofSquare dw ?	; y-axis
	BegPix_Square dw ?

	levelNum DB ?


;Strings
	User_Name DB "Name:","$"
	User_Moves DB "Moves:","$"
	userScore DB "Score:","$"
	levelScoreMSG DB "Your score for this level is", "$"
	thankYouMSG DB "Thank you for playing!", "$"
	endScoreMSG DB "Your final score is", "$"


	x_axis_array dw 150, 200, 250, 300, 350, 400, 450
	dw 150, 200, 250, 300, 350, 400, 450
	dw 150, 200, 250, 300, 350, 400, 450
	dw 150, 200, 250, 300, 350, 400, 450
	dw 150, 200, 250, 300, 350, 400, 450
	dw 150, 200, 250, 300, 350, 400, 450
	dw 150, 200, 250, 300, 350, 400, 450

	y_axis_array dw 90, 90, 90, 90, 90, 90, 90
	dw 140,140,140,140,140,140,140
	dw 190,190,190,190,190,190,190
	dw 240,240,240,240,240,240,240
	dw 290,290,290,290,290,290,290
	dw 340,340,340,340,340,340,340
	dw 390,390,390,390,390,390,390

	BegCol dw 40
	BegRow dw 50
	FinalCol dw 80
	Incr dw 0
	counter dw 420
	counte db 21
	count db 0
	colcount db 0
	count2 db 0
	tempx dw 0
	tempy dw 0
	temp2x dw 0
	temp2y dw 0
	temp3x dw 0

	temp3y dw 0
	x dw 0
	y dw 0
	x1 dw 0
	Lcount db ?
	count_lines db 0
	templ dw 0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Vars for LEVEL 2;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	BegColtwo dw 40
	BegRowtwo dw 50
	FinalColtwo dw 80
	IncrTwo dw 0
	countertwo dw 420
	countetwo db 21
	counttwo db 0
	colcounttwo db 0
	count2two db 0
	tempxtwo dw 0
	tempytwo dw 0
	temp2xtwo dw 0
	temp2ytwo dw 0
	temp3xtwo dw 0
	temptwo dw 0
	temp3ytwo dw 0
	xtwo dw 0
	ytwo dw 0

	Lcounttwo db ?
	count_linestwo db 0
	x1two dw ?
	y1two dw ?

	x_axis_arraytwo dw 198, 248, 348, 398
	dw 198, 248, 298, 348, 398
	dw 148, 198, 248, 298, 348, 398, 448
	dw 198, 248, 298, 348, 398
	dw 148, 198, 248, 298, 348, 398, 448
	dw 198, 248,298, 348, 398
	dw 198, 248, 348, 398

	y_axis_arraytwo dw  88, 88, 88, 88
	dw  138, 138,  138, 138, 138
	dw 188,188, 188,188, 188, 188, 188
	dw 238, 238, 238, 238,238
	dw  288,  288,  288,  288,  288,  288, 288
	dw 338, 338, 338, 338, 338
	dw 388, 388,  388, 388

	ran_num_arraytwo db 49 dup(?)

	randomtwo db 0





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;VARS FOR LEVEL 3;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;






BegColthree dw 40
	BegRowthree dw 50
	FinalColthree dw 80
	Incrthree dw 0
	counterthree dw 420
	countethree db 21
	countthree db 0
	colcountthree db 0
	count2three db 0
	tempxthree dw 0
	tempythree dw 0
	temp2xthree dw 0
	temp2ythree dw 0
	temp3xthree dw 0
	tempthree dw 0
	temp3ythree dw 0
	xthree dw 0
	ythree dw 0

	count_linesthree db 0
	x1three dw ?
	y1three dw ?

	x_axis_array_three dw 148, 198, 248, 348, 398, 448
	dw 148, 198, 248, 348, 398, 448
	dw 148, 198, 248, 348, 398, 448
	dw 0
	dw 148, 198, 248, 348, 398, 448
	dw 148, 198, 248, 348, 398,448
	dw 148,198, 248, 348, 398,448

	y_axis_array_three dw  88, 88, 88, 88, 88, 88
	dw  138, 138, 138, 138, 138, 138
	dw 188,188, 188, 188, 188, 188
	dw 0
	dw  288,  288,  288,  288,  288, 288
	dw 338, 338, 338, 338, 338, 338
	dw 388,388, 388,  388, 388, 388

	ran_num_array_three db 49 dup(?)

	randomThree db 0
  
.CODE
main proc
  
    mov AX, @data
    mov DS, AX
	
	DisplayFirstScreen		; Ask player name and starting level number
	DisplaySecondScreen		; Rules screen 

	ProcessGame::			
				
	cmp levelNum, 1
	je LevelOne
	cmp levelNum, 2
	je LevelTwo
	cmp levelNum, 3
	je LevelThree
	
	
	LevelOne:
		StartLevelOne
		jmp CrushingCandies
	LevelTwo:
		call populategridL2
		jmp exitMain
	LevelThree:
		call populategrid_three
		jmp exitMain
		
	CrushingCandies:
		call findHC	
		call findVC
		
		cmp HC_possible, 1	
		je contin
		cmp VC_possible, 1
		je contin
		jmp StarCandyCrush				
	
	contin:
		call ReplaceNumbersWhenCrushed			
		mov HC_possible, 0
		mov VC_possible, 0
		jmp CrushingCandies

	StarCandyCrush:	
		call DrawingStage 
		mov score, 0				
	
	Update:
		call NameMoveScore		
		call MouseClickFunction		
	
		jmp Update
	                   
    exitMain::
    mov AH, 4Ch
    int 21h

main endp

    
DrawingStage proc 
   
   push SI
   
   mov AH, 0h           
   mov AL, 12h
   int 10h     
   
   mov row_tile, 6		
   mov col_tile, 20
  
   mov SI, 0		
   mov Iterator_Row, 0		
   mov Iterator_Col, 0		
   
   mov AL, col_tile		
   mov temp, AL
   
   
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;NUMBER DISPLAYING IN TILES;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	; rowLoop:
		; mov Iterator_Col, 0
		
		; colLoop:
			; cmp levelNum, 2				 
			; jne sketch
			
			; cmp Iterator_Row, 2				
			; jbe Check_Coloumn_Corner
			; cmp Iterator_Row, 7				
			; jae Check_Coloumn_Corner
			; cmp Iterator_Row, 4				
			; je checkCentreColumns	
			; cmp Iterator_Row, 5				
			; je checkCentreColumns	
			; jmp sketch
	
		; Check_Coloumn_Corner:				
			; cmp Iterator_Col, 2
			; jbe nextIter
			; cmp Iterator_Col, 7
			; jae nextIter
			; jmp sketch
		
		; checkCentreColumns:			
			; cmp Iterator_Col, 3
			; jb sketch
			; cmp Iterator_Col, 6
			; ja sketch		
			; jmp nextIter
     
        ; sketch:
            ; mov DH, ArrayLevelOne[SI]		
			; cmp DH, 7
			; jb continue					
			; cmp DH, 'B'
			; je continue
			; cmp DH, 'X'
			; je continue
			; jmp nextIter
			
		; continue:	
			; mov Num_Tile, DH
			; DarwBox
	
		; nextIter:
			; add col_tile, 6
			; inc SI
			
			; inc Iterator_Col
			; cmp Iterator_Col, 7
			; jb ColLoop
    
		; mov AL, temp
		; mov col_tile, AL		
		; add row_tile, 3
		; inc Iterator_Row
		; cmp Iterator_Row, 7
		; jb rowLoop
	
    drawBoardGrid        
	call display_candies
    pop SI
	ret

DrawingStage endp 

printHorizontalLine PROC   
    push bp     
    mov bp, sp
   
    mov BX, [bp + 4]	; Square_Size
    mov DX, [bp + 6]
    mov CX, [bp + 8]
    
	push AX
	
	mov AX, 0
	
	printLine:
		cmp AX, BX
		je exitPrintLine
		
		push AX
		mov AH, 0Ch 
		mov BH, 0
		mov AL, DrawSquare_Color
		int 10h
		         
	    pop AX	         
		inc AX
		inc CX
		jmp printLine
	
	exitPrintLine:
		pop AX    
		pop bp
		ret 
		
printHorizontalLine ENDP


printVerticalLine PROC
	push bp     
    mov bp, sp
   
    mov BX, [bp + 4]
    mov DX, [bp + 6]
    mov CX, [bp + 8]

	push AX
	
	mov AX, 0
	
	printLineA:
		cmp AX, BX
		je exitPrintLineA
		   
		push AX   
		mov AH, 0Ch
		mov BH, 0
		mov AL, DrawSquare_Color
		int 10h
		
		pop AX
		inc AX
		inc DX
		jmp printLineA
	
	exitPrintLineA:
		pop AX    
		pop bp
		ret
		
printVerticalLine ENDP


WriteString proc
	push AX
	push BX
	push DX
		
	mov DH, drawstring_movRow
	mov DL, drawstring_movCol
	
	drawLoop:
		mov AH, [SI]
		cmp AH, '$'
		je Endproc
		
		mov AH, 02h
		int 10h

		mov AH, 09h
		mov AL, [SI]
		mov BH, 0
		mov BL, drawstring_movColor 
		mov CX, 1
		int 10h
		
		inc DL
		inc SI
		jmp drawLoop
Endproc:
	pop DX
	pop BX
	pop AX
	ret
	
WriteString endp  
 

NameMoveScore proc
    
    push SI
    
    mov drawstring_movRow, 2
    mov drawstring_movCol, 2
    mov drawstring_movColor, 5
    lea SI, User_Name
    call WriteString  

	printPlayerName
	
	
    mov drawstring_movRow, 2			
    mov drawstring_movCol, 68 
    mov drawstring_movColor, 2
    lea SI, User_Moves
    call WriteString  

	mov ax, moves				
	mov Print_NumColour, 0Ah
	mov Print_NumCol, 75
	mov Print_NumRow, 2
	call MultiDigitCode
	
    mov drawstring_movRow, 1			
    mov drawstring_movCol, 68
    mov drawstring_movColor, 3
    lea SI, userScore
    call WriteString
	
	mov ax, score				
	mov Print_NumColour, 0Bh
	mov Print_NumCol, 75
	mov Print_NumRow, 1
	call MultiDigitCode
	
	mov drawstring_movRow, 3
    mov drawstring_movCol, 37
    mov drawstring_movColor, 9
    lea SI, levelonemsg
    call WriteString  
	
    pop SI
    ret 

NameMoveScore endp

displayGameInfoL2 proc
    
    push SI
    
    mov drawstring_movRow, 2
    mov drawstring_movCol, 2
    mov drawstring_movColor, 5
    lea SI, User_Name
    call WriteString  

	printPlayerName
	
	
    mov drawstring_movRow, 2			
    mov drawstring_movCol, 68 
    mov drawstring_movColor, 2
    lea SI, User_Moves
    call WriteString  

	mov ax, moves				
	mov Print_NumColour, 0Ah
	mov Print_NumCol, 75
	mov Print_NumRow, 2
	call MultiDigitCode
	
    mov drawstring_movRow, 1			
    mov drawstring_movCol, 68
    mov drawstring_movColor, 3
    lea SI, userScore
    call WriteString
	
	mov ax, score				
	mov Print_NumColour, 0Bh
	mov Print_NumCol, 75
	mov Print_NumRow, 1
	call MultiDigitCode
	
	mov drawstring_movRow, 3
    mov drawstring_movCol, 37
    mov drawstring_movColor, 9
    lea SI, leveltwomsg
    call WriteString  
	
    pop SI
    ret 

displayGameInfoL2 endp  

displayGameInfoL3 proc
    
    push SI
    
    mov drawstring_movRow, 2
    mov drawstring_movCol, 2
    mov drawstring_movColor, 5
    lea SI, User_Name
    call WriteString  

	printPlayerName
	
	
    mov drawstring_movRow, 2			
    mov drawstring_movCol, 68 
    mov drawstring_movColor, 2
    lea SI, User_Moves
    call WriteString  

	mov ax, moves				
	mov Print_NumColour, 0Ah
	mov Print_NumCol, 75
	mov Print_NumRow, 2
	call MultiDigitCode
	
    mov drawstring_movRow, 1			
    mov drawstring_movCol, 68
    mov drawstring_movColor, 3
    lea SI, userScore
    call WriteString
	
	mov ax, score				
	mov Print_NumColour, 0Bh
	mov Print_NumCol, 75
	mov Print_NumRow, 1
	call MultiDigitCode
	
	mov drawstring_movRow, 3
    mov drawstring_movCol, 37
    mov drawstring_movColor, 9
    lea SI, levelthreemsg
    call WriteString  
	
    pop SI
    ret 

displayGameInfoL3 endp  


BoardToScreenConversion proc
	push AX
	push BX

	mov AL, board_tileCol
	mov BL, 4
	mul BL
	add AL, 20
	mov TileCol_Screen, AL
	
	mov AL, board_tileRow
	mov BL, 2
	mul BL
	add AL, 6
	mov TileRow_Screen, AL
	
	pop BX
	pop AX
	ret
BoardToScreenConversion endp 
 

ScreenPixelsToTileConversion proc
	push AX
	push BX
	
	sub ColMouse_Px, 148				
	sub RowMouse_Px, 88
    
    cmp ColMouse_Px, 0              
    jne next 
    mov board_tileCol, 0
    jmp cont
   
    next:  
	mov AX, 0
	mov AX, ColMouse_Px
	mov BL, 50
	div BL
	mov board_tileCol, AL
    
    cont:
    cmp RowMouse_Px, 0
    jne next2
    mov board_tileRow, 0
    jmp retFN 
    
    next2:
	mov AX, 0
	mov AX, RowMouse_Px
	div BL
	mov board_tileRow, AL
    
    retFN:
	pop BX
	pop AX
	ret

ScreenPixelsToTileConversion endp
	

TileToScreenPixelConversion proc
    push AX
    push DX
    
    mov AX, 0
    mov AL, 50
    mul board_tileCol
    
    add AX, 148
    mov ColMouse_Px,AX
    
    mov AX, 0
    mov AL, 50
    mul board_tileRow
    
    add AX, 88
    mov RowMouse_Px, AX  
    
    pop DX
    pop AX
    ret
	
TileToScreenPixelConversion endp	


MouseClickFunction proc
	mov AX, 1		
	int 33h

	mov AX, 3			
	int 33h
	
	cmp BX, 1	
	je checkMousePix
	jmp Endproc
	
	checkMousePix:
		mov ColMouse_Px, CX
		mov RowMouse_Px, DX
		
		cmp ColMouse_Px, 148		
		jb Endproc
		
		cmp ColMouse_Px, 496
		ja Endproc
		
		cmp RowMouse_Px, 88
		jb Endproc

		cmp RowMouse_Px, 440
		ja Endproc
		
		cmp levelNum, 2
		jne cont
		
		
		cmp RowMouse_Px, 184				 
		jbe Check_Coloumn_Corner
		
		cmp RowMouse_Px, 312				
		jae Check_Coloumn_Corner
		
		cmp RowMouse_Px, 216				
		jb cont	
		
		cmp RowMouse_Px, 280				
		ja cont	
		jmp checkCentreColumns
	
		Check_Coloumn_Corner:				
			cmp ColMouse_Px, 244
			jbe Endproc
			
			cmp ColMouse_Px, 372
			jae Endproc
			jmp cont
		
		checkCentreColumns:				
			cmp ColMouse_Px, 244
			jna cont
			
			cmp ColMouse_Px, 372
			ja cont
			jmp Endproc
			
		cont:
			call ScreenPixelsToTileConversion		
			call TileToScreenPixelConversion		
				
			mov AX, ColMouse_Px		
			mov DrawSquare_Col, AX
			mov AX, RowMouse_Px
			mov DrawSquare_Row, AX
			mov DrawSquare_Color, 10
			mov Square_Size, 50
			drawSquare		
			
			inc DrawSquare_Col		
			drawSquare			
			
			call PlacingTilesAccordingToArray	
			mov AX, Index_Array
			mov One_Index, AL
			mov AH, board_tileCol		
			mov One_Col, AH
			mov AH, board_tileRow
			mov One_Row, AH

			call checkForMouseRelease
				
	Endproc:
		ret

MouseClickFunction endp 


checkForMouseRelease proc
	
	checkLoop:
		mov AX, 3			
		int 33h

		cmp BX, 0	
		jne checkLoop
		
		mov ColMouse_Px, CX
		mov RowMouse_Px, DX
		
		cmp ColMouse_Px, 148		
		jb Endproc
		
		cmp ColMouse_Px, 468
		ja Endproc
		
		cmp RowMouse_Px, 88
		jb Endproc

		cmp RowMouse_Px, 408
		ja Endproc
		
		cmp levelNum, 2
		jne cont
		
		
		cmp RowMouse_Px, 184				
		jbe Check_Coloumn_Corner
		
		cmp RowMouse_Px, 312				
		jae Check_Coloumn_Corner
		
		cmp RowMouse_Px, 216				
		jb cont	
		
		cmp RowMouse_Px, 280				
		ja cont	
		jmp checkCentreColumns
	
		Check_Coloumn_Corner:			
			cmp ColMouse_Px, 244
			jbe Endproc
			
			cmp ColMouse_Px, 372
			jae Endproc
			jmp cont
		
		checkCentreColumns:				
			cmp ColMouse_Px, 244
			jna cont
			
			cmp ColMouse_Px, 372
			ja cont
			jmp Endproc
			
		cont:
		call ScreenPixelsToTileConversion		
		call TileToScreenPixelConversion	
		
		mov AX, ColMouse_Px		
		mov DrawSquare_Col, AX
		mov AX, RowMouse_Px
		mov DrawSquare_Row, AX
		mov DrawSquare_Color, 10
		mov Square_Size, 50 ;32
		drawSquare

		inc DrawSquare_Col		
		drawSquare
			
		call PlacingTilesAccordingToArray
		mov AX, Index_Array
		mov Two_Index, AL
		mov AH, board_tileCol	
		mov Two_Col, AH
		mov AH, board_tileRow
		mov Two_Row, AH
		
		call CheckSwapPossibility			
		ret
		
	Endproc:   
		mov DrawSquare_Color, 9
	drawBoardGrid
		ret
checkForMouseRelease endp


PlacingTilesAccordingToArray proc

	push AX
	push BX
 	
	mov AL, board_tileRow
	mov BL, 7;10
	mul BL
	
	mov BH, 0
	mov BL, board_tileCol
	
	add AX, BX 
	mov Index_Array, AX
	
	pop BX
	pop AX
	ret
	
PlacingTilesAccordingToArray endp

 
ClickSquareColor proc
	push CX
	push DX
	push AX
		
	mov boxFillO, 0
	mov CX, Start_MouseColumn
	mov DX, Start_MouseRow
	
	outerloop:
		mov boxFillI, 0
		
		innerloop:
			mov AH, 0ch
			mov AL, 09h
			int 10h
			inc boxFillI
			inc CX
			cmp boxFillI,50
			jb innerloop
		
		mov CX, Start_MouseColumn
		inc DX
		inc boxFillO
		cmp boxFillO,50
		jb outerloop
	
	pop AX
	pop DX
	pop CX
	ret
ClickSquareColor endp


CheckSwapPossibility proc

	mov AH, One_Col
	mov AL, One_Row

	mov BH, Two_Col
	mov BL, Two_Row

	cmp AH, BH		
	jne sameRow
	
	sameCol:
		cmp BL, AL 			
		ja secondRowLarger
		cmp BL, AL
		jb secondRowSmaller	 
		jmp Endproc			 
		
		secondRowLarger:		
			mov CL, BL		
			mov DL, AL		
			sub CL, DL
			cmp CL, 1		
			jne Endproc
			cmp BL, 9		
			ja Endproc			
			
			call swapTiles
			jmp Endproc
			
		secondRowSmaller: 
			mov CL, BL		
			mov DL, AL		
			sub DL, CL
			cmp DL, 1		
			jne Endproc
			cmp BL, 0		
			jb Endproc			
			
			call swapTiles
			jmp Endproc
	
	sameRow:
		cmp AL, BL		
		je checkcol
		jmp Endproc
		
	checkcol:
		cmp BH,AH
		ja secondColLarger	
		cmp BH, AH
		jb secondColSmaller	
		jmp Endproc
		
		secondColLarger:
			mov CL, BH		
			mov DL, AH		
			sub CL, DL
			cmp CL, 1		
			jne Endproc
			cmp BH, 9
			ja Endproc			
			
			call swapTiles
			jmp Endproc
		
		secondColSmaller:
			mov CL, BH		
			mov DL, AH		
			sub DL, CL
			cmp DL, 1		
			jne Endproc
			cmp BL, 0
			jb Endproc			
			
			call swapTiles
			jmp Endproc
	
	Endproc:				
		mov DrawSquare_Color, 9	
		drawBoardGrid		
		ret

CheckSwapPossibility endp


swapTiles proc
	push AX
	push BX
	push CX
	push DX
	push SI

	mov BH, 0				
	mov BL, One_Index
	mov SI, BX
	mov Index_Temp, BX
	
	mov DH, ArrayLevelOne[SI]	
	
	mov BH, 0
	mov BL, Two_Index		
	mov SI, BX
		
	mov CL, ArrayLevelOne[SI]	
	
	cmp DH, 'X'		
	je exitIfBlocker
	cmp CL, 'X'
	je exitIfBlocker
	
	cmp DH, 'B'		
	je checkBombFirst
	jmp checkBombSecond	
	
	checkBombFirst:		
		cmp CL, 'B'		
		je ifBomb
		
		mov AL, CL		
		call BombCrushing
		call DrawingStage
		call ReplaceNumbersWhenCrushed
		jmp normalFinish
		
		ifBomb:			
			mov DrawSquare_Color, 9
			drawBoardGrid
			jmp normalFinish
	
	checkBombSecond:   
		cmp CL, 'B'		
		jne swap		
		mov AL, DH		
		call BombCrushing
		call DrawingStage
		call ReplaceNumbersWhenCrushed
		jmp normalFinish
		
	swap:
		mov ArrayLevelOne[SI], DH		
		mov SI, Index_Temp
		mov ArrayLevelOne[SI], CL
		
	normalFinish:	
		call CrushingUntilSamePairsNotRemoved
		dec moves				
		cmp moves, 0			
		jne exitIfBlocker		
		
		jb goToNextLevel		
		
		
		goToNextLevel:
			call displayEndScreen
		
		
	exitIfBlocker:	
	 	mov AX, 1
		int 33h

		pop SI
		pop DX
		pop CX
		pop BX
		pop AX
	ret	

swapTiles endp
 

oneSecDelay proc
	push ax
	push cx
	push dx
	
	mov cx, 0Fh				
	mov dx, 4240h
	mov ah, 86h
	int 15h 		

	pop dx
	pop cx
	pop ax
	ret
oneSecDelay endp  


findHC proc
	push BX
	push AX
	push SI
		
	mov BX, 0
	mov AX, 0
	mov SI, 0
	
	mov Index_RowCrush, 0
	RowLoop:
		
		mov Index_ColCrush, 0
		
		fullColLoop:
		
			
		ColLoop:
			mov BL, Index_RowCrush
			mov AL, TotalNum_Cols
			mul BL
			mov BX, AX
			mov DX, 0
			mov DL, Index_ColCrush
			mov SI, DX
			
			call CrushingInSameRow		
			
		cont:
			inc Index_ColCrush
			cmp Index_ColCrush, 7 
			jb fullColLoop
		
		inc Index_RowCrush
		cmp Index_RowCrush, 7 
		jb RowLoop
		
	pop SI
	pop AX
	pop BX
	
	ret		
findHC endp


CrushingInSameRow proc
	mov di, SI
	cmp Index_ColCrush, 8		
	jb checkCrush
	jmp Endproc

	checkCrush:
		push BX	
		add BX, SI
		mov Bex_Index, BX		
		pop BX
		mov AL, ArrayLevelOne[BX+SI]		
		cmp AL, 'B'						
		je Endproc							
		cmp AL, 'X'
		je Endproc
		
		inc SI
		cmp AL, ArrayLevelOne[BX+SI]
		je checkNextValue		    
		jmp Endproc

	checkNextValue:
		inc SI
		cmp AL, ArrayLevelOne[BX+SI]
		je fillZero				
		jmp Endproc

	fillZero:
		mov HC_possible, 1	
		mov LengthCombination, 3			
		add score, 3
		
		cont:
			mov SI, di
			mov ArrayLevelOne[BX+SI], 0
			inc SI
			mov ArrayLevelOne[BX+SI], 0
			inc SI
			mov ArrayLevelOne[BX+SI], 0
	
	crushAll:
		inc SI
		cmp SI, 7				
		jb checkAboveThreeCombo
		jmp endFN

	checkAboveThreeCombo:
		cmp AL, ArrayLevelOne[BX+SI]	
		je placeBomb
		jmp endFN		
	
	placeBomb:							
		inc LengthCombination
		inc score
		mov ArrayLevelOne[BX+SI-1], 0		
		mov ArrayLevelOne[BX+SI], 'B'		
		jmp crushAll

	endFN:
		push BX
		add BX, SI
		dec BX
		mov End_Index, BX	
		pop BX
		
		cmp levelNum, 3
		jne Endproc
		call RemoveHorizontalCrush	
		
		Endproc:
			mov SI, di
			ret

CrushingInSameRow endp	
	

findVC proc
	push BX
	push AX
	push SI
	push DX
		
	mov BX, 0
	mov AX, 0
	mov SI, 0
	
	mov Index_ColCrush, 0
	ColLoop:
		
		mov DX, 0
		mov DL, Index_ColCrush
		mov SI, DX
		mov Index_RowCrush, 0
			
		fullRowLoop:
			
		RowLoop:
			mov BL, Index_RowCrush
			mov AL, TotalNum_Cols
			mul BL
			mov BX, AX
			call CrushingInSameColoumn		
			
		cont:	
			inc Index_RowCrush
			cmp Index_RowCrush, 7
			jb fullRowLoop
		
		inc Index_ColCrush
		cmp Index_ColCrush, 7
		jb ColLoop
	
	pop DX
	pop SI
	pop AX
	pop BX
	
	ret		
findVC endp


CrushingInSameColoumn proc
	mov di, BX
	mov DL, Index_RowCrush
	mov Var_Temp, DL
	cmp Index_RowCrush, 8		
	jb checkCrush
	jmp Endproc

	checkCrush:
		push BX
		add BX, SI
		mov Bex_Index, BX
		pop BX
		mov AL, ArrayLevelOne[BX+SI]
		cmp AL, 'B'						
		je Endproc
		cmp AL, 'X'
		je Endproc
		
		add BX, 7
		cmp AL, ArrayLevelOne[BX+SI]
		je checkNextValue		
		jmp Endproc

	checkNextValue:
		add BX, 7
		cmp AL, ArrayLevelOne[BX+SI]
		je fillZero					
		jmp Endproc

	fillZero:
		mov VC_possible, 1		
		mov LengthCombination, 3
		add score, 3
		
		cont:
			mov BX, di
			mov ArrayLevelOne[BX+SI], 0
			inc Var_Temp
			add BX, 7
			mov ArrayLevelOne[BX+SI], 0
			inc Var_Temp
			add BX, 7
			mov ArrayLevelOne[BX+SI], 0

	crushAll:
		inc Var_Temp
		cmp Var_Temp, 7				
		jb checkAboveThreeCombo
		jmp endFN

	checkAboveThreeCombo:
		add BX, 7
		cmp AL, ArrayLevelOne[BX+SI]
		je makeZero
		jmp endFN		
	
	makeZero:
		inc LengthCombination
		inc score
		mov ArrayLevelOne[BX+SI-7], 0		
		mov ArrayLevelOne[BX+SI], 'B'	
		jmp crushAll 

	endFN:
		push BX
		add BX, SI
		sub BX, 7
		mov End_Index, BX
		pop BX
		
		cmp levelNum, 3
		jne Endproc
		call removeBlockersVertically
		
	Endproc:
		ret

CrushingInSameColoumn endp	
 
BombCrushing proc
	
	; AL = Value to be bombed
	
	mov SI, 0
	mov CX, 100
	bombLoop:
		cmp AL, ArrayLevelOne[SI]		
		je makeZero
		cmp ArrayLevelOne[SI], 'B'		
		je makeZero
		jmp checkNext		
	
	makeZero:
		mov ArrayLevelOne[SI], 0
		
	checkNext:
		inc SI
		loop bombLoop
	
	mov isBomb, 1
	mov bombNum, AL 
	ret
BombCrushing endp 
 
ReplaceNumbersWhenCrushed proc
	push BX
	push AX
	push SI
	push DX
	
	mov AX, 0
	mov DX, 0
	
	mov Row_DropDown, 0
	RowLoop:
		
		mov Col_DropDown, 0
		ColLoop:
			
			mov BL, Row_DropDown
			mov AL, TotalNum_Cols
			mul BL
			mov BX, AX
			mov DX, 0
			mov DL, Col_DropDown
			mov SI, DX
			cmp ArrayLevelOne[BX+SI], 0
			je callmoveUp
			jmp checkNext
			
			callMoveUp:
				call ReplaceNumbersWhenCrushedUp
			
			checkNext:
				inc Col_DropDown
				cmp Col_DropDown, 10
				jb ColLoop
			
			inc Row_DropDown
			cmp Row_DropDown, 10
			jb RowLoop
	
	pop DX
	pop SI
	pop AX
	pop BX		
	ret
ReplaceNumbersWhenCrushed endp


ReplaceNumbersWhenCrushedUp proc
	mov temp, 0
	mov DL, Row_DropDown
	mov Row_Temp, DL
	
	upLoop:	
		cmp Row_Temp, 0		
		je getRand
		
		cmp ArrayLevelOne[BX+SI-7], 7		
		je getRand
		
		cmp ArrayLevelOne[BX+SI-7], 'X'	
		je checkifXIsAtTopRow
 
		mov DL, ArrayLevelOne[BX+SI]     
		mov DH, ArrayLevelOne[BX+SI-7]  
		mov ArrayLevelOne[BX+SI], DH		
		mov ArrayLevelOne[BX+SI-7], DL
		dec Row_Temp
		
	KeepMovingUp:
		mov BX, 0
		mov AX, 0
		mov BL, Row_Temp
		mov AL, TotalNum_Cols
		mul BL
		mov BX, AX
		
		jmp upLoop
	
	checkifXIsAtTopRow:
		mov DL, Row_Temp
		mov temp, DL
		dec temp		
		cmp temp, 0 					
		je getRand	
		mov DL, ArrayLevelOne[BX+SI]     	
		mov DH, ArrayLevelOne[BX+SI-14]  	
		mov ArrayLevelOne[BX+SI], DH		
		mov ArrayLevelOne[BX+SI-14], DL
		sub Row_Temp, 2  					
		jmp KeepMovingUp
	
	getRand:
		mov range_random, 5
		RandomFunc
		;call display_candies
		push DX
		mov DL, rand_num
		mov ArrayLevelOne[BX+SI], DL
		pop DX
		
	ret
ReplaceNumbersWhenCrushedUp endp

 
CrushingUntilSamePairsNotRemoved proc
	
	continuousCrush:
		call findHC	; 
		call findVC
		
		cmp HC_possible, 1	
		je crushAgain
		cmp VC_possible, 1		
		je crushAgain
		jmp finish					
		
		crushAgain:
			mov DrawSquare_Color, 9		
			call NameMoveScore
			call DrawingStage			
			
			call ReplaceNumbersWhenCrushed			
			call DrawingStage				
		
			mov HC_possible, 0
			mov VC_possible, 0
			jmp continuousCrush			

		finish:
			mov DrawSquare_Color, 9		
			call NameMoveScore
			call DrawingStage	
			ret	
CrushingUntilSamePairsNotRemoved endp


RemoveHorizontalCrush proc	
	mov AX, Bex_Index
	mov BH, 10
	div BH				
	cmp AH, 0			
	jne startMiddle		
	
	
		mov SI, Bex_Index
		cmp SI, 9
		jna inFirstRow_First	
		
		cmp SI, 90				
		jae inLastRow_First
		call checkAbove
		call checkBelow
		jmp middleTiles_First
		
		inFirstRow_First:		
			call checkBelow
			jmp middleTiles_First
			
		inLastRow_First:
			call checkAbove
		
		middleTiles_First:	
		xor CX, CX
		mov CL, LengthCombination 
		sub CL, 2
		inc SI
		
		checkBlockerLoop_First:
			cmp Bex_Index, 9	
			jna onlyBelow_First
			
			cmp SI, 90
			jae onlyAbove_First
			call checkAbove
			call checkBelow
			jmp nextLoopIter_First
			
			onlyAbove_First:
				call checkAbove
				jmp nextLoopIter_First
			
			onlyBelow_First:			
				call checkBelow
				
			nextLoopIter_First:
			inc SI
			loop checkBlockerLoop_First
		
		jmp checkLastTile
	
	startMiddle:
		mov SI, Bex_Index
		cmp SI, 9
		jna inFirstRow_Middle	
		
		cmp SI, 90			
		jae inLastRow_Middle
		call checkAbove
		call checkBelow
		call CheckLHS
		jmp middleTiles_Middle
		
		inFirstRow_Middle:		
			call checkBelow
			call CheckLHS
			jmp middleTiles_Middle
			
		inLastRow_Middle:
			call checkAbove
			call CheckLHS
			
		middleTiles_Middle:	
		xor CX, CX
		mov CL, LengthCombination
		sub CL, 2
		inc SI
		
		checkBlockerLoop_Middle:
			cmp Bex_Index, 9
			jna onlyBelow_Middle
			
			cmp SI, 90
			jae onlyAbove_Middle
			call checkAbove
			call checkBelow
			call CheckLHS
			jmp nextLoopIter_Middle
			
			onlyAbove_Middle:
				call checkAbove
				call CheckLHS
				jmp nextLoopIter_Middle
			
			onlyBelow_Middle:			
				call checkBelow
				call CheckLHS
				
			nextLoopIter_Middle:
			inc SI
			loop checkBlockerLoop_Middle
			
	checkLastTile:
		mov SI, End_Index
		call LastColoumnIndex
		xor DX, DX
		mov DL, lastColIndex	
		
		cmp SI, 9
		jna	inFirstRow_Last
		
		cmp SI, 90
		jae inLastRow_Last
		
		cmp End_Index, DX
		je inLastColC
		
		call checkAbove
		call checkBelow
		call CheckRHS
		ret
		
		inLastColC:
			call checkAbove
			call checkBelow
			ret
	
		inFirstRow_Last:
			cmp End_Index, DX
			je inLastColA
			
			call checkBelow
			call CheckRHS
			ret
			
			inLastColA:
				call checkBelow
				ret
		
		inLastRow_Last:
			cmp End_Index, DX
			je inLastColB
			
			call checkAbove
			call CheckRHS
			ret
			
		inLastColB:
			call checkAbove
				
	ret	
RemoveHorizontalCrush endp

	
checkBelow proc
	cmp ArrayLevelOne[SI + 7], 'X'
	jne Endproc
	mov ArrayLevelOne[SI + 7], 0

	Endproc:
		ret
checkBelow endp

checkAbove proc
	cmp ArrayLevelOne[SI - 7], 'X'
	jne Endproc
	mov ArrayLevelOne[SI - 7], 0

	Endproc:
		ret
checkAbove endp

CheckLHS proc
	cmp ArrayLevelOne[SI - 1], 'X'
	jne Endproc
	mov ArrayLevelOne[SI - 1], 0

	Endproc:
		ret
CheckLHS endp

CheckRHS proc
	cmp ArrayLevelOne[SI + 1], 'X'
	jne Endproc
	mov ArrayLevelOne[SI + 1], 0

	Endproc:
		ret
CheckRHS endp


LastColoumnIndex proc
	push AX
	push BX

	mov AX, SI
	mov BH, 10
	div BH
	
	mov AH, 0
	mul BH
	add AL, 9
	
	mov lastColIndex, AL
	
	pop BX
	pop AX
	ret
LastColoumnIndex endp


removeBlockersVertically proc	
	cmp Bex_Index, 9	
	ja startMiddle	
	

		mov SI, Bex_Index
		cmp SI, 0
		je inFirstCol_First		
		cmp SI, 9			
		je inLastCol_First
		call CheckRHS
		call CheckLHS
		jmp middleTiles_First
		
		inFirstCol_First:		
			call CheckRHS
			jmp middleTiles_First
			
		inLastCol_First:
			call CheckLHS
		
		middleTiles_First:
		xor CX, CX
		mov CL, LengthCombination 
		sub CL, 2
		add SI, 7
		
		checkBlockerLoop_First:
			cmp Bex_Index, 0	
			je onlyRight_First
			cmp SI, 8
			je onlyLeft_First
			call CheckRHS
			call CheckLHS
			jmp nextLoopIter_First
			
			onlyLeft_First:
				call CheckLHS
				jmp nextLoopIter_First
			
			onlyRight_First:	
				call CheckRHS
				
			nextLoopIter_First:
			add SI, 7
			loop checkBlockerLoop_First
		
		jmp checkLastTile
	
	
	startMiddle:
		mov SI, Bex_Index
		mov AX, SI				
		mov BH, 7
		div BH
		cmp AH, 0
		je inFirstCol_Middle	
		
		call LastColoumnIndex
		xor DX, DX
		mov DL, lastColIndex	
		cmp SI, DX				
		je inLastCol_Middle		
		
		call checkAbove	
		call CheckRHS
		call CheckLHS
		jmp middleTiles_Middle
		
		inFirstCol_Middle:		
			call checkAbove
			call CheckRHS
			jmp middleTiles_Middle
			
		inLastCol_Middle:
			call checkAbove
			call CheckLHS
			
		middleTiles_Middle:	
		xor CX, CX
		mov CL, LengthCombination
		sub CL, 2
		add SI, 7
		
		checkBlockerLoop_Middle:
			mov AX, Bex_Index					
			mov BH, 7
			div BH
			cmp AH, 0			
			je checkRight_Middle	
			
			call LastColoumnIndex
			xor DX, DX
			mov DL, lastColIndex	
			cmp SI, DX				
			je checkLeft_Middle		
			
			call CheckLHS
			call CheckRHS
			jmp nextLoopIter_Middle
			
			checkLeft_Middle:
				call CheckLHS
				jmp nextLoopIter_Middle
			
			checkRight_Middle:			
				call CheckRHS
				
			nextLoopIter_Middle:
			add SI, 10
			loop checkBlockerLoop_Middle
			
	checkLastTile:
		mov SI, End_Index
		mov AX, SI				
		mov BH, 7
		div BH
		cmp AH, 0
		je inFirstCol_Last	
		
		call LastColoumnIndex
		xor DX, DX
		mov DL, lastColIndex	
		cmp SI, DX			
		je inLastCol_Last	
		
		cmp SI, 90
		ja inMiddleColLastRow
		call checkBelow		
		call CheckRHS
		call CheckLHS
		ret
		
		inMiddleColLastRow:
			call CheckRHS
			call CheckLHS
			ret
		
		inFirstCol_Last:
			cmp SI, 90
			je Num_Tile90
			call CheckRHS
			call checkBelow
			ret
			
			Num_Tile90:
				call CheckRHS
				ret
		
		inLastCol_Last:
			cmp SI, 99
			je Num_Tile99
			call CheckLHS
			call checkBelow
			ret
			
			Num_Tile99:
				call CheckLHS
				
	ret	
removeBlockersVertically endp
	
MultiDigitCode proc
	push DX
	push CX
	mov Print_CountNum, 0 
	mov BL, 10
	
	pushingNumberIntoStack:
		div BL
		mov remainder, AH
		mov quotient, AL
		mov AH, 0
		mov AL, remainder
		push AX			
		inc Print_CountNum
		mov AL, quotient
		mov AH, 0
		cmp AL, 0				
		jne pushingNumberIntoStack
		mov DH, Print_NumRow
		mov DL, Print_NumCol
		
		popingAndPrintingNumber:
		pop AX
		mov remainder, AL 	
		add remainder, 48
		mov AH, 02			
		int 10h
		
		mov AH, 09
		mov AL, remainder
		mov BL, Print_NumColour
		mov CX, 1
		mov BH, 0
		int 10h
		
		inc DL	;increnebting column
		dec Print_CountNum
		cmp Print_CountNum, 0
		ja popingAndPrintingNumber
	
	pop CX
	pop DX
	ret
MultiDigitCode endp	

displayEndScreen proc
	push ax
	mov ah, 0		; Set video mode 640x480
	mov al, 12h
	int 10h
	
	drawSquareBorder
	
	mov drawstring_movRow, 2		
    mov drawstring_movCol, 33
    mov drawstring_movColor, 12
    lea SI, gamename
    call WriteString 

	
	mov drawstring_movCol, 27			
	mov drawstring_movRow, 13
	mov drawstring_movColor, 0Eh
	lea SI, thankYouMSG
	call WriteString 
	
	
	inputLevel
	
	jmp exitMain
	
	pop ax
	ret
displayEndScreen endp


Triangle proc 
	add x,10
	add y,30
	mov ax, x
	mov BegCol, ax 
	mov ax,y
	mov BegRow ,ax 
	add x1, 40
	mov ax,x1
	mov FinalCol,ax
	mov Incr, 0
	mov ax,0
	mov ah, 06h
	int 10h
L10:
	mov ah,0ch ; 	
	mov al,1
	mov cx,BegCol
	mov dx,BegRow
	.Repeat
	int 10h
	inc cx
	.until (cx==FinalCol)
	sub FinalCol, 1
	Add BegCol, 1
	sub BegRow, 1
     
	mov ax, FinalCol
	cmp ax, BegCol
	je Exittt
jmp L10

Exittt:
	ret
Triangle endp


;-------------------------------------------------------------
Square proc   							;150  ;60

				
add x,15
add y,15
mov cx,x;160
mov dx,y;70
mov counter,20
mov count_lines,20

upper1:
	mov ah,0ch
	mov al,4
	mov bx,0
	inc cx
	int 10h
	dec counter
	cmp counter,0
	jne upper1
	inc dx
	mov cx,x
	dec count_lines
	cmp count_lines,0
	mov counter,20
	jne upper1
	
			
			ret
		Square endp
		
;--------------------------------------------------------------------------------------------------------------
		
		Parallelogram proc 
		
				mov ah,0ch   ;150 ;60
				mov al, 5h
				add x, 20;15
				add y, 27
				mov cx, x;165
				mov dx, y;85

				mov tempx,cx
				mov tempy,dx
				add tempx,10

				side1:
					int 10h
					dec cx
					inc dx
					inc count
					cmp count,10
					jne side1

					mov count,0
					mov temp3x,cx
					mov temp3y,dx

				
				mov cx, temp3x
				mov dx, temp3y

			colouring3:
				inc temp3x
				
				mov cx, temp3x
				mov dx, temp3y

				InLoop3:
					int 10h
					inc cx
					dec dx
					inc count
					cmp count,11
					jne InLoop3

					mov count,0

				inc count2
				cmp count2,11
				jne colouring3
				mov count2,0

			ret			
		Parallelogram endp

;-------------------------------------------------------------------------------------
		Right_Triangle proc 
		
				mov ah,0ch
				mov al, 2h
				
				;mov x, 160
				;mov y, 70
				
				add x,10
				add y,10
				
				mov cx, x
				mov dx, y
				mov tempx, cx
				add tempx,20
				mov tempy, dx
				add tempy,20

				dig1:
					int 10h
					inc dx
					cmp dx, tempy
					jne dig1

					mov templ,dx
					mov temp3y,dx
					dec templ

				dig2:
					int 10h
					inc cx
					cmp cx,tempx
					jne dig2

	
				dig3:
					int 10h
					dec cx
					dec dx
					cmp cx,x;160
					jne dig3

			
				mov tempx,cx
				add tempx,2
				
			
			colouring4:
				inc y

				mov cx,x
				mov dx,y

				inc tempx

				InLoop4:
					int 10h
					inc cx
					cmp cx, tempx
					jne InLoop4
	
				inc count2
				cmp count2,20
				jne colouring4
				
				mov count2,0
						
			ret
Right_Triangle endp

White_Parallelogram proc  

				mov ah,0ch
				add x,20
				add y,20
				mov cx, x;160
				mov dx, y;70
				mov al, 1111b
				mov tempx,cx
				mov tempy,dx
				add tempx,10

				side1:
					int 10h
					inc cx
					inc dx
					inc count
					cmp count,10
					jne side1

					mov count,0
					mov temp3x,cx
					mov temp3y,dx

				
				mov cx, temp3x
				mov dx, temp3y

			colouring3:
				dec temp3x
				
				mov cx, temp3x
				mov dx, temp3y

				InLoop3:
					int 10h
					dec cx
					dec dx
					inc count
					cmp count,11
					jne InLoop3

					mov count,0

				inc count2
				cmp count2,11
				jne colouring3
				mov count2,0

			ret
		White_Parallelogram endp
		
		
delay proc
mov cx,5
startD:
	mov cx,3000
	je endD
	inc cx
	jmp startD
endD:
	ret
delay ENDP


display_candies proc uses si ax bx 
	mov si,0
continue2:
	mov al,ArrayLevelOne[SI]
	
	.if al==1
	mov bx,x_axis_array[si]
	mov x,bx
	mov bx, y_axis_array[si]
	mov y,bx 
	call Square
	call delay
	jmp continue3
	
	
	.elseif al==2
	mov ax,x_axis_array[si]
	mov x,ax
	mov x1,ax
	mov ax, y_axis_array[si]
	mov y,ax 
	call Triangle
	call delay
	jmp continue3
	
	.elseif al==3
	mov ax,x_axis_array[si]
	mov x,ax
	mov x1,ax
	mov ax, y_axis_array[si]
	mov y,ax 
	call Right_Triangle
	call delay
	jmp continue3
	
	.elseif al==4
	mov ax,x_axis_array[si]
	mov x,ax
	mov x1,ax
	mov ax, y_axis_array[si]
	mov y,ax 
	call Parallelogram
	call delay
	jmp continue3
	
	
	
	.elseif al==5
	mov bx,x_axis_array[si]
	mov x,bx
	mov bx, y_axis_array[si]
	mov y,bx 
    call SQUARE
	call delay
	jmp continue3
	
	.endif
continue3:
	INC SI
	INC SI
	cmp si,98
	jne continue2
ret
display_candies endp

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;LEVEL 2;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


populategridL2 proc 

	mov ah, 0		; Set video mode 640x480
	mov al, 12h
	int 10h

	call DRAW_GRIDLevel2
	;call Triangle
	;call Squares
	;call Parallelogram
	;call Right_Triangle
	call Randomanizationtwo
	call display_candiestwo
	call displayGameInfoL2
	ret

populategridL2 endp

	
DRAW_SquareL2 proc
mov cx,x1two
mov dx,y1two
mov countertwo,50

upper1:
	mov ah,0ch
	mov al,7
	mov bx,0
	inc cx
	int 10h
	dec countertwo
	cmp countertwo,0
	jne upper1

sub y1two,1
add x1two,1
mov cx,x1two
mov dx,y1two
mov countertwo,50
left:
	mov ah,0ch
	mov al,7
	mov bx,0
	inc dx
	int 10h
	dec countertwo
	cmp countertwo,0
	jne left

add x1two,50
add y1two,1
mov cx,x1two
mov dx,y1two
mov countertwo,50
right:
	mov ah,0ch
	mov al,7
	mov bx,0
	inc dx
	int 10h
	dec countertwo
	cmp countertwo,0
	jne right

sub x1two,50
add y1two,50
mov cx,x1two
mov dx,y1two
mov countertwo,50
lower:
	mov ah,0ch
	mov al,7
	mov bx,0
	inc cx
	int 10h
	dec countertwo
	cmp countertwo,0
	jne lower

ret
DRAW_SquareL2 endp

;-----------------------------------------------------------------------------------------------
DRAW_GRIDLevel2 proc 
	


mov x1two, 198
mov y1two, 88
call DRAW_SquareL2


mov x1two, 248
mov y1two, 88
call DRAW_SquareL2


mov x1two, 348
mov y1two, 88
call DRAW_SquareL2

mov x1two, 398
mov y1two, 88
call DRAW_SquareL2



mov x1two, 198
mov y1two, 138
call DRAW_SquareL2


mov x1two, 248
mov y1two, 138
call DRAW_SquareL2


mov x1two, 298
mov y1two, 138
call DRAW_SquareL2


mov x1two, 348
mov y1two, 138
call DRAW_SquareL2

mov x1two, 398
mov y1two, 138
call DRAW_SquareL2
														


mov x1two, 148
mov y1two, 188
call DRAW_SquareL2

mov x1two, 198
mov y1two, 188
call DRAW_SquareL2


mov x1two, 248
mov y1two, 188
call DRAW_SquareL2

mov x1two, 298
mov y1two, 188
call DRAW_SquareL2


mov x1two, 348
mov y1two, 188
call DRAW_SquareL2

mov x1two, 398
mov y1two, 188
call DRAW_SquareL2

mov x1two, 448
mov y1two, 188
call DRAW_SquareL2


mov x1two, 198
mov y1two, 238
call DRAW_SquareL2


mov x1two, 248
mov y1two, 238
call DRAW_SquareL2

mov x1two, 298
mov y1two, 238
call DRAW_SquareL2


mov x1two, 348
mov y1two, 238
call DRAW_SquareL2

mov x1two, 398
mov y1two, 238
call DRAW_SquareL2


mov x1two, 148
mov y1two, 288
call DRAW_SquareL2

mov x1two, 198
mov y1two, 288
call DRAW_SquareL2


mov x1two, 248
mov y1two, 288
call DRAW_SquareL2

mov x1two, 298
mov y1two, 288
call DRAW_SquareL2


mov x1two, 348
mov y1two, 288
call DRAW_SquareL2

mov x1two, 398
mov y1two, 288
call DRAW_SquareL2

mov x1two, 448
mov y1two, 288
call DRAW_SquareL2



mov x1two, 198
mov y1two, 338
call DRAW_SquareL2


mov x1two, 248
mov y1two, 338
call DRAW_SquareL2


mov x1two, 298
mov y1two, 338
call DRAW_SquareL2


mov x1two, 348
mov y1two, 338
call DRAW_SquareL2

mov x1two, 398
mov y1two, 338
call DRAW_SquareL2



mov x1two, 198
mov y1two, 388
call DRAW_SquareL2


mov x1two, 248
mov y1two, 388
call DRAW_SquareL2


mov x1two, 348
mov y1two, 388
call DRAW_SquareL2

mov x1two, 398
mov y1two, 388
call DRAW_SquareL2



ret

DRAW_GRIDLevel2 endp

;-----------------------------------------------------------------------------------------------

Triangletwo proc 
	add xtwo,10
	add ytwo,30
	mov ax, xtwo
	mov BegColtwo, ax 
	mov ax,ytwo
	mov BegRowtwo ,ax 
	add x1two, 40
	mov ax,x1two
	mov FinalColtwo,ax 
	mov IncrTwo, 0
	mov ax,0
	mov ah, 06h
	int 10h
L10:
	mov ah,0ch ; 	
	mov al,1 
	mov cx,BegColtwo; 	
	mov dx,BegRowtwo; 
	.Repeat
	int 10h
	inc cx
	.until (cx==FinalColtwo)
	sub FinalColtwo, 1
	Add BegColtwo, 1
	sub BegRowtwo, 1
     
	mov ax, FinalColtwo
	cmp ax, BegColtwo
	je Exittt
jmp L10

Exittt:
	ret
Triangletwo endp


;-------------------------------------------------------------
Squaretwo proc   							;150  ;60

				
add xtwo,15
add ytwo,15
mov cx,xtwo;160
mov dx,ytwo;70
mov countertwo,20
mov count_linestwo,20

upper1:
	mov ah,0ch
	mov al,4
	mov bx,0
	inc cx
	int 10h
	dec countertwo
	cmp countertwo,0
	jne upper1
	inc dx
	mov cx,xtwo
	dec count_linestwo
	cmp count_linestwo,0
	mov countertwo,20
	jne upper1
	
			
			ret
		Squaretwo endp
		
;--------------------------------------------------------------------------------------------------------------
		
		Parallelogramtwo proc 
		
				mov ah,0ch   ;150 ;60
				mov al, 5h
				add xtwo, 20;15
				add ytwo, 27
				mov cx, xtwo;165
				mov dx, ytwo;85

				mov tempxtwo,cx
				mov tempytwo,dx
				add tempxtwo,10

				side1:
					int 10h
					dec cx
					inc dx
					inc counttwo
					cmp counttwo,10
					jne side1

					mov counttwo,0
					mov temp3xtwo,cx
					mov temp3ytwo,dx

				
				mov cx, temp3xtwo
				mov dx, temp3ytwo

			colouring3:
				inc temp3xtwo
				
				mov cx, temp3xtwo
				mov dx, temp3ytwo

				InLoop3:
					int 10h
					inc cx
					dec dx
					inc counttwo
					cmp counttwo,11
					jne InLoop3

					mov counttwo,0

				inc count2two
				cmp count2two,11
				jne colouring3
				mov count2two,0

			ret			
		Parallelogramtwo endp

;-------------------------------------------------------------------------------------
		Right_Triangletwo proc 
		
				mov ah,0ch
				mov al, 2h
				
				;mov xtwo, 160
				;mov ytwo, 70
				
				add xtwo,10
				add ytwo,10
				
				mov cx, xtwo
				mov dx, ytwo
				mov tempxtwo, cx
				add tempxtwo,20
				mov tempytwo, dx
				add tempytwo,20

				dig1:
					int 10h
					inc dx
					cmp dx, tempytwo
					jne dig1

					mov temptwo,dx
					mov temp3ytwo,dx
					dec temptwo

				dig2:
					int 10h
					inc cx
					cmp cx,tempxtwo
					jne dig2

	
				dig3:
					int 10h
					dec cx
					dec dx
					cmp cx,xtwo;160
					jne dig3

			
				mov tempxtwo,cx
				add tempxtwo,2
				
			
			colouring4:
				inc ytwo

				mov cx,xtwo
				mov dx,ytwo

				inc tempxtwo

				InLoop4:
					int 10h
					inc cx
					cmp cx, tempxtwo
					jne InLoop4
	
				inc count2two
				cmp count2two,20
				jne colouring4
				
				mov count2two,0
						
			ret
Right_Triangletwo endp


		
delaytwo proc
mov cx,5
startD:
	mov cx,3000
	je endD
	inc cx
	jmp startD
endD:
	ret
delaytwo ENDP


Randomanizationtwo proc
mov si,0
call delaytwo
mov ah,0
mov dx,0 
int 1Ah

continue:
mov ax,dx
xor dx,dx
mov bx,4
div bx
add dl, 1

mov randomtwo, dl
    add  dl, '0'  ; to ascii from '0' to '9'
   mov ah, 2h   ; call interrupt to display a value in DL
    int 21h

	mov dl,randomtwo
	mov ran_num_arraytwo[si],dl
	inc si
	inc si
	cmp si,98
	jne continue
	
ret
Randomanizationtwo endp


display_candiestwo proc uses si ax bx 
	mov si,0
continue2:
	mov al,ran_num_arraytwo[si]
	
	.if al==1
	mov bx,x_axis_arraytwo[si]
	mov xtwo,bx
	mov bx, y_axis_arraytwo[si]
	mov ytwo,bx 
	call Squaretwo
	call delaytwo
	jmp continue3
	
	
	.elseif al==2
	mov ax,x_axis_arraytwo[si]
	mov xtwo,ax
	mov x1two,ax
	mov ax, y_axis_arraytwo[si]
	mov ytwo,ax 
	call Triangletwo
	call delaytwo
	jmp continue3
	
	.elseif al==3
	mov ax,x_axis_arraytwo[si]
	mov xtwo,ax
	mov x1two,ax
	mov ax, y_axis_arraytwo[si]
	mov ytwo,ax 
	call Right_Triangletwo
	call delaytwo
	jmp continue3
	
	.elseif al==4
	mov ax,x_axis_arraytwo[si]
	mov xtwo,ax
	mov x1two,ax
	mov ax, y_axis_arraytwo[si]
	mov ytwo,ax 
	call Parallelogramtwo
	call delaytwo
	jmp continue3
	
	
	
	;.elseif al==5
	;mov bx,x_axis_arraytwo[si]
	;mov xtwo,bx
	;mov bx, y_axis_arraytwo[si]
	;mov ytwo,bx 
    ;call White_Parallelogram
	;call delay
	;jmp continue3
	
	

	.endif
continue3:
	INC SI
	INC SI
	cmp si,98
	jne continue2
ret
display_candiestwo endp




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;LEVEL 3;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
populategrid_three proc 

	mov ah, 0		; Set video mode 640x480
	mov al, 12h
	int 10h

	call DrawLevel3Grid
	;call Triangle
	;call Square
	;call Parallelogram
	;call Right_Triangle
	call randomThreeanization_three
	call display_candies_three
	call displayGameInfoL3
	ret

populategrid_three endp

	
DRAW_Square proc
mov cx,x1three
mov dx,y1three
mov counterthree,50

upper1:
	mov ah,0ch
	mov al,7
	mov bx,0
	inc cx
	int 10h
	dec counterthree
	cmp counterthree,0
	jne upper1

sub y1three,1
add x1three,1
mov cx,x1three
mov dx,y1three
mov counterthree,50
left:
	mov ah,0ch
	mov al,7
	mov bx,0
	inc dx
	int 10h
	dec counterthree
	cmp counterthree,0
	jne left

add x1three,50
add y1three,1
mov cx,x1three
mov dx,y1three
mov counterthree,50
right:
	mov ah,0ch
	mov al,7
	mov bx,0
	inc dx
	int 10h
	dec counterthree
	cmp counterthree,0
	jne right

sub x1three,50
add y1three,50
mov cx,x1three
mov dx,y1three
mov counterthree,50
lower:
	mov ah,0ch
	mov al,7
	mov bx,0
	inc cx
	int 10h
	dec counterthree
	cmp counterthree,0
	jne lower

ret
DRAW_Square endp

;-----------------------------------------------------------------------------------------------

DrawLevel3Grid proc

mov x1three, 148
mov y1three, 88
call DRAW_Square

mov x1three, 198
mov y1three, 88
call DRAW_Square


mov x1three, 248
mov y1three, 88
call DRAW_Square


mov x1three, 348
mov y1three, 88
call DRAW_Square

mov x1three, 398
mov y1three, 88
call DRAW_Square

mov x1three, 448
mov y1three, 88
call DRAW_Square


;------------------------------------

mov x1three, 298
mov y1three, 88
call DRAW_Horizontal

;-----------------------------------

mov x1three, 148
mov y1three, 138
call DRAW_Square

mov x1three, 198
mov y1three, 138
call DRAW_Square


mov x1three, 248
mov y1three, 138
call DRAW_Square


mov x1three, 348
mov y1three, 138
call DRAW_Square

mov x1three, 398
mov y1three, 138
call DRAW_Square

mov x1three, 448
mov y1three, 138
call DRAW_Square


;-----------------------------------------------

mov x1three, 149
mov y1three, 238
call DRAW_Vertical

;-----------------------------------------------

mov x1three, 148
mov y1three, 188
call DRAW_Square

mov x1three, 198
mov y1three, 188
call DRAW_Square


mov x1three, 248
mov y1three, 188
call DRAW_Square


mov x1three, 348
mov y1three, 188
call DRAW_Square

mov x1three, 398
mov y1three, 188
call DRAW_Square

mov x1three, 448
mov y1three, 188
call DRAW_Square

;----------------------------------------------------------------

mov x1three, 499
mov y1three, 238
call DRAW_Vertical

;----------------------------------------------------------------

mov x1three, 148
mov y1three, 288
call DRAW_Square

mov x1three, 198
mov y1three, 288
call DRAW_Square


mov x1three, 248
mov y1three, 288
call DRAW_Square


mov x1three, 348
mov y1three, 288
call DRAW_Square

mov x1three, 398
mov y1three, 288
call DRAW_Square

mov x1three, 448
mov y1three, 288
call DRAW_Square

;----------------------------------------------------------------------


mov x1three, 148
mov y1three, 338
call DRAW_Square

mov x1three, 198
mov y1three, 338
call DRAW_Square


mov x1three, 248
mov y1three, 338
call DRAW_Square


mov x1three, 348
mov y1three, 338
call DRAW_Square

mov x1three, 398
mov y1three, 338
call DRAW_Square

mov x1three, 448
mov y1three, 338
call DRAW_Square


;------------------------------------------------------------------------------------------
mov x1three, 298
mov y1three, 438
call DRAW_Horizontal

;------------------------------------------------------------------------


mov x1three, 148
mov y1three, 388
call DRAW_Square

mov x1three, 198
mov y1three, 388
call DRAW_Square


mov x1three, 248
mov y1three, 388
call DRAW_Square


mov x1three, 348
mov y1three, 388
call DRAW_Square

mov x1three, 398
mov y1three, 388
call DRAW_Square

mov x1three, 448
mov y1three, 388
call DRAW_Square


ret
DrawLevel3Grid endp
;-----------------------------------------------------------------------------------------------


DRAW_Horizontal proc

mov cx,x1three
mov dx,y1three
mov counterthree,50
upper:
	mov ah,0ch
	mov al,7
	mov bx,0
	inc cx
	int 10h
	dec counterthree
	cmp counterthree,0
	jne upper

ret
DRAW_Horizontal endp

DRAW_Vertical proc

mov cx,x1three
mov dx,y1three
mov counterthree,50
upper:
	mov ah,0ch
	mov al,7
	mov bx,0
	inc dx
	int 10h
	dec counterthree
	cmp counterthree,0
	jne upper

ret
DRAW_Vertical endp




TriangleLevelThree proc 
	add xthree,10
	add ythree,30
	mov ax, xthree
	mov BegColthree, ax 
	mov ax,ythree
	mov BegRowthree ,ax 
	add x1three, 40
	mov ax,x1three
	mov FinalColthree,ax 
	mov Incrthree, 0
	mov ax,0
	mov ah, 06h
	int 10h
L10:
	mov ah,0ch ; 	write Pixel on screen
	mov al,1;1110b  
	mov cx,BegColthree; 	
	mov dx,BegRowthree;  
	.Repeat
	int 10h
	inc cx
	.until (cx==FinalColthree)
	sub FinalColthree, 1
	Add BegColthree, 1
	sub BegRowthree, 1
     
	mov ax, FinalColthree
	cmp ax, BegColthree
	je Exittt
jmp L10

Exittt:
	ret
TriangleLevelThree endp


;-------------------------------------------------------------
SquareLevelThree proc   							;150  ;60

				
add xthree,15
add ythree,15
mov cx,xthree;160
mov dx,ythree;70
mov counterthree,20
mov count_linesthree,20

upper1:
	mov ah,0ch
	mov al,4
	mov bx,0
	inc cx
	int 10h
	dec counterthree
	cmp counterthree,0
	jne upper1
	inc dx
	mov cx,xthree
	dec count_linesthree
	cmp count_linesthree,0
	mov counterthree,20
	jne upper1
	
			
			ret
		SquareLevelThree endp
		
;--------------------------------------------------------------------------------------------------------------
		
		ParallelogramLevelThree proc 
		
				mov ah,0ch   ;150 ;60
				mov al, 5h
				add xthree, 20;15
				add ythree, 27
				mov cx, xthree;165
				mov dx, ythree;85

				mov tempxthree,cx
				mov tempythree,dx
				add tempxthree,10

				side1:
					int 10h
					dec cx
					inc dx
					inc countthree
					cmp countthree,10
					jne side1

					mov countthree,0
					mov temp3xthree,cx
					mov temp3ythree,dx

				
				mov cx, temp3xthree
				mov dx, temp3ythree

			colouring3:
				inc temp3xthree
				
				mov cx, temp3xthree
				mov dx, temp3ythree

				InLoop3:
					int 10h
					inc cx
					dec dx
					inc countthree
					cmp countthree,11
					jne InLoop3

					mov countthree,0

				inc count2three
				cmp count2three,11
				jne colouring3
				mov count2three,0

			ret			
		ParallelogramLevelThree endp

;-------------------------------------------------------------------------------------
		Right_TriangleLevelThree proc 
		
				mov ah,0ch
				mov al, 2h
				
				;mov xthree, 160
				;mov ythree, 70
				
				add xthree,10
				add ythree,10
				
				mov cx, xthree
				mov dx, ythree
				mov tempxthree, cx
				add tempxthree,20
				mov tempythree, dx
				add tempythree,20

				dig1:
					int 10h
					inc dx
					cmp dx, tempythree
					jne dig1

					mov tempthree,dx
					mov temp3ythree,dx
					dec tempthree

				dig2:
					int 10h
					inc cx
					cmp cx,tempxthree
					jne dig2

	
				dig3:
					int 10h
					dec cx
					dec dx
					cmp cx,xthree;160
					jne dig3

			
				mov tempxthree,cx
				add tempxthree,2
				
			
			colouring4:
				inc ythree

				mov cx,xthree
				mov dx,ythree

				inc tempxthree

				InLoop4:
					int 10h
					inc cx
					cmp cx, tempxthree
					jne InLoop4
	
				inc count2three
				cmp count2three,20
				jne colouring4
				
				mov count2three,0
						
			ret
Right_TriangleLevelThree endp

	

randomThreeanization_three proc
mov si,0
call delay
mov ah,0
mov dx,0 
int 1Ah

continue:
mov ax,dx
xor dx,dx
mov bx,4
div bx
add dl, 1

mov randomThree, dl
    add  dl, '0'  ; to ascii from '0' to '9'
   mov ah, 2h   ; call interrupt to display a value in DL
    int 21h

	mov dl,randomThree
	mov ran_num_array_three[si],dl
	inc si
	inc si
	cmp si,98
	jne continue
	
ret
randomThreeanization_three endp


display_candies_three proc uses si ax bx 
	mov si,0
continue2:
	mov al,ran_num_array_three[si]
	
	.if al==1
	mov bx,x_axis_array_three[si]
	mov xthree,bx
	mov bx, y_axis_array_three[si]
	mov ythree,bx 
	call SquareLevelThree
	call delay
	jmp continue3
	
	
	.elseif al==2
	mov ax,x_axis_array_three[si]
	mov xthree,ax
	mov x1three,ax
	mov ax, y_axis_array_three[si]
	mov ythree,ax 
	call TriangleLevelThree
	call delay
	jmp continue3
	
	.elseif al==3
	mov ax,x_axis_array_three[si]
	mov xthree,ax
	mov x1three,ax
	mov ax, y_axis_array_three[si]
	mov ythree,ax 
	call Right_TriangleLevelThree
	call delay
	jmp continue3
	
	.elseif al==4
	mov ax,x_axis_array_three[si]
	mov xthree,ax
	mov x1three,ax
	mov ax, y_axis_array_three[si]
	mov ythree,ax 
	call ParallelogramLevelThree
	call delay
	jmp continue3
	
	.endif
continue3:
	INC SI
	INC SI
	cmp si,98
	jne continue2
ret
display_candies_three endp



end
