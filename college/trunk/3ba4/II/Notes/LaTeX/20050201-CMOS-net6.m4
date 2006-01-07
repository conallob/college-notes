% 20050201-CMOS-Net1.m4
.PS
cct_init

define('dimen_',0.75) 

loopwid = dimen_

UpA:	c_fet(up_ ,,P) ; llabel(,$A$,)
UpB:	c_fet(down_ ,,P) with .S at UpA.D+(loopwid,0) ; llabel(,$B$,)
UpC:	c_fet(down_ ,,P) with .S at UpB.D ; llabel(,$C$,)

DownA: c_fet(up_ ,,) with .D at UpC.D+(-(loopwid/2),-(loopwid/4)); llabel(,$A$,)
DownB: c_fet(up_ ,,) with .D at DownA.S+(-(loopwid/2),0) ; llabel(,$B$,)
DownC: c_fet(down_ ,,) with .S at DownA.S+((loopwid/2),0) ; llabel(,$C$,)

	# Pullup Network
	line right from UpA.D to UpB.S
	line down from UpA.S then right to UpC.D
	
	# Pulldown Network
	line right from DownB.D to DownA.S ; dot
	line right from DownA.S to DownC.S
	line right from DownB.S to DownC.D

	#Output
	line up (loopwid/4) from DownA.D ; dot 
	line down from Here to DownA.D ; dot
	line up (loopwid/8) from Here then right (loopwid*2) ; "sp_$Z$" ljust 

.PE
