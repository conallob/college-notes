% 20050201-CMOS-Net1.m4
.PS
cct_init

define('dimen_',0.75) 

loopwid = dimen_

UpA:	c_fet(up_ ,,P) ; llabel(,$A$,)
UpB:	c_fet(up_ ,,P) with .D at UpA.S+((7*loopwid)/4,0); llabel(,$B$,)
UpC:	c_fet(down_ ,,P) with .S at UpB.D+(loopwid/2,0); llabel(,$C$,)
UpD:	c_fet(down_ ,,P) with .S at UpA.D+((2*loopwid),0) ; llabel(,$D$,)

DownA: c_fet(up_ ,,) with .D at UpB.S+(-((3*loopwid)/4),0); llabel(,$A$,)
DownB: c_fet(up_ ,,) with .D at DownA.S+(-(loopwid),0) ; llabel(,$B$,)
DownC: c_fet(up_ ,,) with .D at DownB.S ; llabel(,$C$,)
DownD: c_fet(down_ ,,) with .S at DownA.S+(loopwid,0) ; llabel(,$D$,)

	# Pullup Network
	line loopwid right from UpA.D ; dot ; clabel($PWR$,,)
	line loopwid right from Here to UpD.S
	line right from UpB.D to UpD.D ; dot
	line right from UpD.D to UpC.S
	line down from UpA.S then right to UpB.S then right to UpC.D
	
	# Pulldown Network
	line left from DownB.D to DownA.S then to DownD.S
	line right loopwid from DownC.S ; ground(,,E)
	line right from Here then up to DownD.D

	#Output
	line right (2*loopwid) from UpC.D ; "sp_$Y$" ljust
	
.PE
