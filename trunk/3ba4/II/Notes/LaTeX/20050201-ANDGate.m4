% Liblog.m4
.PS
cct_init
ifdef(`AND_gate',,`include(HOMELIB_`'liblog.m4)')
G: AND_gate
	left_
	line left 3*L_unit from G.In1 ; "$A$sp_" rjust
	line left 3*L_unit from G.In2 ; "$B$sp_" rjust
	line right 3*L_unit from G.Out ; "sp_$f$" ljust
.PE
