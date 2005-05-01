% 20050201-CMOS-Net1.m4
.PS
cct_init

define('dimen_',0.75) 

loopwid = dimen_

DownA: c_fet(up_ ,,) ; rlabel(,$closed$,) 
DownB: c_fet(up_ ,,) with .S at DownA.D ; rlabel(,$closed$,) 
DownC: c_fet(up_ ,,) with .S at DownB.D ; rlabel(,$closed$,) 
	
.PE
