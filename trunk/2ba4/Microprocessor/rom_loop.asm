INITSP		EQU	$00000
LOOP		EQU	$00400
INITPC		EQU	$00400

	ORG INITSP
	dc.l INITSP
	dc.l INITPC

	org LOOP

	MOVE.B	#$02,$4000
	MOVE.B	$4000,$4800

	JMP LOOP