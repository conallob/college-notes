% 20050201-CMOS-Net1.m4
.PS
cct_init

define('dimen_',0.75) 

loopwid = dimen_

FET1:	c_fet(up_,,) ; rlabel(,$closed$,) 
FET2:	c_fet(up_,,) with .D at FET1.S; rlabel(,$closed$,) 

	line down from FET1.G to FET2.G
	line down loopwid/2 from FET1.G then left loopwid ; "$0$sp_" rjust 
	line up loopwid/2 from FET1.D ; ground(,U,E) 
	line down loopwid/2 from FET2.S ; ground(,,)
	line right loopwid from FET2.D ; "sp_$OUT$" ljust 
	
.PE
