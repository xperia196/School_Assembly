TITLE	HW5
PAGE	60, 132
STSEG	SEGMENT
	DB 64 DUP(?)
STSEG	ENDS
;-----------------------------
DTSEG	SEGMENT
DTSEG	ENDS
;-----------------------------
CDSEG	SEGMENT
MAIN		PROC	FAR
	ASSUME	CS:CDSEG, DS:DTSEG, SS:STSEG
	MOV		AX, DTSEG
	MOV	DS, AX
	MOV	AX, 0600H
	MOV	BH, 07
	MOV	CX, 0000
	MOV	DX, 184FH
	INT	10H
	MOV	AH, 00
	MOV	AL, 04
	INT	10H
	
	MOV	CX, 50
	MOV	DX, 10
WIDGHT:	MOV	AH, 0CH
	MOV	AL, 01
	INT	10H
	INC	CX
	CMP	CX, 200
	JNZ	WIDGHT

	MOV	CX, 200
	MOV	DX, 10
HEIGHT:	MOV	AH, 0CH
	MOV	AL, 01
	INT	10H
	INC	DX
	CMP	DX, 160
	JNZ	HEIGHT
	
	MOV	CX, 50
	MOV	DX, 10
DIA:	MOV	AH, 0CH
	MOV	AL, 01
	INT	10H
	INC	CX
	CMP	CX, 200
	INC	DX
	CMP	DX, 160
	JNZ	DIA
	
	MOV	AH, 4CH
	INT	21H
MAIN	ENDP
CDSEG	ENDS
	END	MAIN