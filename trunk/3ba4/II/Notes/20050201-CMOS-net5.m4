% 20050201-CMOS-Net1.m4
.PS
cct_init

define('dimen_',0.75) 

loopwid = dimen_

UpA:	c_fet(up_ ,,P) ; llabel(,$A$,)
UpB:	c_fet(up_ ,,P) with .D at UpA.S ; llabel(,$B$,)
UpC:	c_fet(up_ ,,P) with .D at UpB.S+(-(loopwid/2),0) ; llabel(,$C$,)
UpD:	c_fet(down_ ,,P) with .S at UpB.S+((loopwid/2),0) ; llabel(,$D$,)

DownA: c_fet(up_ ,,) with .D at UpC.S+(-(loopwid/2),-(loopwid/4)); llabel(,$A$,)
DownB: c_fet(up_ ,,) with .D at DownA.D+(loopwid,0) ; llabel(,$B$,)
DownC: c_fet(down_ ,,) with .S at DownB.D+(loopwid,0) ; llabel(,$C$,)
DownD: c_fet(down_ ,,) with .S at DownC.D ; llabel(,$D$,)

	# Pullup Network
	line right from UpC.D to UpB.S then right to UpD.S
	line right from UpC.S to UpD.D
	
	# Pulldown Network
	line right from DownA.D to DownB.D then to DownC.S
	line down from DownA.S then right to DownD.D
	line down loopwid from DownB.S ; dot

	#Output
	line up (loopwid/4) from DownB.D ; dot
	line up (loopwid/8) from DownB.D then right (2*loopwid) ; "sp_$Y$" ljust

.PE
