% Liblog.m4
.PS
cct_init

ifdef(`NAND_gate',,`include(HOMELIB_`'liblog.m4)')
ifdef(`NOT_gate',,`include(HOMELIB_`'liblog.m4)')

G: NAND_gate
	left_
N: NOT_gate with .In1 at (G.Out,G)
	right_
	line left 3*L_unit from G.In1 ; "$A$sp_" rjust
	line left 3*L_unit from G.In2 ; "$B$sp_" rjust
	line right 6*L_unit from G.Out to N.In1
	line right 3*L_unit from N.Out ; "sp_$f$" ljust
.PE
