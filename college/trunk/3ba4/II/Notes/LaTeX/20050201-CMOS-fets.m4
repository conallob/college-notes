% 20050201-CMOS-Net1.m4
.PS
cct_init

define('dimen_',0.75) 

loopwid = dimen_

DownA: c_fet(up_ ,,) ; llabel(,$A$,) 
DownB: c_fet(down_ ,,) with .S at DownA.D+((2*loopwid),0); llabel(,$B$,) 

	line right loopwid from DownA.S+(0,(loopwid*2)) ; dot ; clabel($PWR$,,)
	line right loopwid from Here to DownB.D+(0,(2*loopwid))

.PE
