% 20050201-CMOS-Net1.m4
.PS
cct_init

define('dimen_',0.75)

loopwid = 1; loopht = 0.75
span = 5*L_unit

UpA:	c_fet(up_ loopwid,,P)# ; llabel(,A,)
#UpB:	c_fet(up_ loopwid,,P)# ; llabel(,B,)
#UpC:	c_fet(up_ loopwid,,P)# ; llabel(,C,)
UpD:	c_fet(down_ loopwid,,P)# at UpA+(span,0)
	
	line up from UpA.D then right ; dot 
	line right then down to UpD.S 
.PE
