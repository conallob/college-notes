% 20050201-CMOS-Net1.m4
.PS
cct_init

define('dimen_',0.75) 

loopwid = dimen_

UpA:	c_fet(up_ ,,P) ; llabel(,$A$,)
UpB:	c_fet(down_ ,,P) with .D at UpA.S+(loopwid,0) ; llabel(,$B$,)

DownA: c_fet(up_ ,,) with .D at UpB.D; llabel(,$A$,)
DownB: c_fet(up_ ,,) with .D at DownA.S ; llabel(,$B$,)

	# Pullup Network
	line right (loopwid/2) from UpA.D ; dot ; clabel(,,$PWR$)
	line right from UpA.D to UpB.S
	line right from UpA.S to UpB.D
		
	# Pulldown Network
	line down (loopwid/2) from DownB.S ; ground(,,,)

	#Output
	line right loopwid from DownA.D ; "sp_$\overline{a \cdot b}$" ljust
	
.PE
