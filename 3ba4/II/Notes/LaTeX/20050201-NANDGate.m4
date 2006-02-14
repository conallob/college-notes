% Liblog.m4
.PS
cct_init

ifdef(`NAND_gate',,`include(HOMELIB_`'liblog.m4)')

G:		NAND_gate
		

	line left 3*L_unit from G.In1 ; "$A$sp_" rjust
	line left 3*L_unit from G.In2 ; "$B$sp_" rjust
	line right 3*L_unit from G.Out ; "sp_$f$" ljust

.PE
