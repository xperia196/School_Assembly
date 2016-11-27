TITLE	HW4
PAGE	60, 132
STSEG	SEGMENT
	DB 64 DUP(?)
STSEG	ENDS
;-----------------------
DTSEG	SEGMENT
SCORE	DB	81, 65, 77, 82, 73, 55, 88, 78, 51, 91, 86, 76
COUNT	DW	12
STORE	DB	?
	ORG	10H
STORE_SCORE	DB 30 DUP(?)
	ORG	0040H
HIGHEST	DB	?
DTSEG	ENDS
;-----------------------
CDSEG	SEGMENT
MAIN	PROC	FAR
	ASSUME CS:CDSEG, DS:DTSEG, SS:STSEG
	MOV	AX, DTSEG
	MOV	DS, AX
	MOV	CX, COUNT
	MOV BX, OFFSET SCORE
	MOV	AL, 0
AGAIN:	CMP	AL, [BX]
	JA	NEXT
	MOV	AL, [BX]
NEXT:	INC BX
	LOOP	AGAIN
	MOV	HIGHEST, AL
	MOV	CX, COUNT
	MOV	AL, 99
	SUB	AL, HIGHEST
	MOV	STORE, AL
	MOV	BX, OFFSET STORE_SCORE
	MOV	SI, OFFSET SCORE
COMD:	MOV	AL, [SI]
	SUB	AL, STORE
	MOV	[BX], AL
	INC	BX
	INC	SI
	LOOP	COMD
	MOV	AH, 4CH
	INT	21H
MAIN	ENDP
CDSEG	ENDS
	END	MAIN