	.section __TEXT,__text,regular,pure_instructions
	.section __TEXT,__picsymbolstub1,symbol_stubs,pure_instructions,32
.section __TEXT,__text,regular,pure_instructions
	.align 2
	.align 2
	.globl __Z8ackermanii
.section __TEXT,__text,regular,pure_instructions
	.align 2
__Z8ackermanii:
LFB3:
	mflr r0
	stmw r30,-8(r1)
LCFI0:
	stw r0,8(r1)
LCFI1:
	stwu r1,-96(r1)
LCFI2:
	mr r30,r1
LCFI3:
	stw r3,120(r30)
	stw r4,124(r30)
	lwz r0,120(r30)
	cmpwi cr7,r0,0
	bne cr7,L2
	lwz r2,124(r30)
	addi r0,r2,1
	stw r0,64(r30)
	b L1
L2:
	lwz r0,124(r30)
	cmpwi cr7,r0,0
	bne cr7,L4
	lwz r2,120(r30)
	addi r0,r2,-1
	mr r3,r0
	li r4,1
	bl __Z8ackermanii
	mr r0,r3
	stw r0,64(r30)
	b L1
L4:
	lwz r2,124(r30)
	addi r0,r2,-1
	lwz r3,120(r30)
	mr r4,r0
	bl __Z8ackermanii
	mr r9,r3
	lwz r2,120(r30)
	addi r0,r2,-1
	mr r3,r0
	mr r4,r9
	bl __Z8ackermanii
	mr r0,r3
	stw r0,64(r30)
L1:
	lwz r3,64(r30)
	lwz r1,0(r1)
	lwz r0,8(r1)
	mtlr r0
	lmw r30,-8(r1)
	blr
LFE3:
	.align 2
	.globl _main
.section __TEXT,__text,regular,pure_instructions
	.align 2
_main:
LFB5:
	mflr r0
	stmw r30,-8(r1)
LCFI4:
	stw r0,8(r1)
LCFI5:
	stwu r1,-96(r1)
LCFI6:
	mr r30,r1
LCFI7:
	li r0,6
	stw r0,64(r30)
	li r3,3
	lwz r4,64(r30)
	bl __Z8ackermanii
	mr r0,r3
	stw r0,68(r30)
	lwz r0,68(r30)
	mr r3,r0
	lwz r1,0(r1)
	lwz r0,8(r1)
	mtlr r0
	lmw r30,-8(r1)
	blr
LFE5:
.data
.section __TEXT,__eh_frame,coalesced,no_toc+strip_static_syms
EH_frame1:
	.set L$set$0,LECIE1-LSCIE1
	.long L$set$0
LSCIE1:
	.long	0x0
	.byte	0x1
	.ascii "zPR\0"
	.byte	0x1
	.byte	0x7c
	.byte	0x41
	.byte	0x6
	.byte	0x90
	.long	L___gxx_personality_v0$non_lazy_ptr-.
	.byte	0x10
	.byte	0xc
	.byte	0x1
	.byte	0x0
	.align 2
LECIE1:
.globl _Z8ackermanii.eh
_Z8ackermanii.eh:
LSFDE1:
	.set L$set$1,LEFDE1-LASFDE1
	.long L$set$1
LASFDE1:
	.long	LASFDE1-EH_frame1
	.long	LFB3-.
	.set L$set$2,LFE3-LFB3
	.long L$set$2
	.byte	0x0
	.byte	0x4
	.set L$set$3,LCFI2-LFB3
	.long L$set$3
	.byte	0xe
	.byte	0x60
	.byte	0x11
	.byte	0x41
	.byte	0x7e
	.byte	0x9f
	.byte	0x1
	.byte	0x9e
	.byte	0x2
	.byte	0x4
	.set L$set$4,LCFI3-LCFI2
	.long L$set$4
	.byte	0xd
	.byte	0x1e
	.align 2
LEFDE1:
.globl main.eh
main.eh:
LSFDE3:
	.set L$set$5,LEFDE3-LASFDE3
	.long L$set$5
LASFDE3:
	.long	LASFDE3-EH_frame1
	.long	LFB5-.
	.set L$set$6,LFE5-LFB5
	.long L$set$6
	.byte	0x0
	.byte	0x4
	.set L$set$7,LCFI6-LFB5
	.long L$set$7
	.byte	0xe
	.byte	0x60
	.byte	0x11
	.byte	0x41
	.byte	0x7e
	.byte	0x9f
	.byte	0x1
	.byte	0x9e
	.byte	0x2
	.byte	0x4
	.set L$set$8,LCFI7-LCFI6
	.long L$set$8
	.byte	0xd
	.byte	0x1e
	.align 2
LEFDE3:
.data
.non_lazy_symbol_pointer
L___gxx_personality_v0$non_lazy_ptr:
	.indirect_symbol ___gxx_personality_v0
	.long	0
.data
.constructor
.data
.destructor
	.align 1
