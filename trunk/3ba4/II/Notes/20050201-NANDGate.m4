% Liblog.m4
.PS
cct_init
ifdef(`NAND_gate',,`include(HOMELIB_`'liblog.m4)')
xgap = 0.6
[ dmov = 0.4
{
{NAND_gate(2)}
}
]
.PE
