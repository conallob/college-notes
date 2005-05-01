% Liblog.m4
.PS
cct_init

ifdef(`NOT_gate',,`include(HOMELIB_`'liblog.m4)')

G:		NOT_gate
		

	line left 3*L_unit from G.In1 
	line right 3*L_unit from G.Out

.PE
