	.file	"20041020.C"
	.section	".text"
	.align 4
	.global _Z8ackermanii
	.type	_Z8ackermanii, #function
	.proc	04
_Z8ackermanii:
.LLFB2:
	!#PROLOGUE# 0
	save	%sp, -120, %sp
.LLCFI0:
	!#PROLOGUE# 1
	st	%i0, [%fp+68]
	st	%i1, [%fp+72]
	ld	[%fp+68], %g1
	cmp	%g1, 0
	bne	.LL2
	nop
	ld	[%fp+72], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp-20]
	b	.LL1
	 nop
.LL2:
	ld	[%fp+72], %g1
	cmp	%g1, 0
	bne	.LL4
	nop
	ld	[%fp+68], %g1
	add	%g1, -1, %g1
	mov	%g1, %o0
	mov	1, %o1
	call	_Z8ackermanii, 0
	 nop
	mov	%o0, %g1
	st	%g1, [%fp-20]
	b	.LL1
	 nop
.LL4:
	ld	[%fp+72], %g1
	add	%g1, -1, %g1
	ld	[%fp+68], %o0
	mov	%g1, %o1
	call	_Z8ackermanii, 0
	 nop
	mov	%o0, %o5
	ld	[%fp+68], %g1
	add	%g1, -1, %g1
	mov	%g1, %o0
	mov	%o5, %o1
	call	_Z8ackermanii, 0
	 nop
	mov	%o0, %g1
	st	%g1, [%fp-20]
.LL1:
	ld	[%fp-20], %i0
	ret
	restore
.LLFE2:
	.size	_Z8ackermanii, .-_Z8ackermanii
	.align 4
	.global main
	.type	main, #function
	.proc	04
main:
.LLFB3:
	!#PROLOGUE# 0
	save	%sp, -120, %sp
.LLCFI1:
	!#PROLOGUE# 1
	mov	6, %g1
	st	%g1, [%fp-20]
	mov	3, %o0
	ld	[%fp-20], %o1
	call	_Z8ackermanii, 0
	 nop
	mov	%o0, %g1
	st	%g1, [%fp-24]
	ld	[%fp-24], %g1
	mov	%g1, %i0
	ret
	restore
.LLFE3:
	.size	main, .-main
	.section	".eh_frame",#alloc,#write
.LLframe1:
	.uaword	.LLECIE1-.LLSCIE1
.LLSCIE1:
	.uaword	0x0
	.byte	0x1
	.asciz	"zP"
	.byte	0x1
	.byte	0x7c
	.byte	0xf
	.byte	0x8
	.byte	0x50
	.align 4
	.long	__gxx_personality_v0
	.byte	0xc
	.byte	0xe
	.byte	0x0
	.align 4
.LLECIE1:
.LLSFDE1:
	.uaword	.LLEFDE1-.LLASFDE1
.LLASFDE1:
	.uaword	.LLASFDE1-.LLframe1
	.uaword	.LLFB2
	.uaword	.LLFE2-.LLFB2
	.byte	0x0
	.byte	0x4
	.uaword	.LLCFI0-.LLFB2
	.byte	0xd
	.byte	0x1e
	.byte	0x2d
	.byte	0x9
	.byte	0xf
	.byte	0x1f
	.align 4
.LLEFDE1:
.LLSFDE3:
	.uaword	.LLEFDE3-.LLASFDE3
.LLASFDE3:
	.uaword	.LLASFDE3-.LLframe1
	.uaword	.LLFB3
	.uaword	.LLFE3-.LLFB3
	.byte	0x0
	.byte	0x4
	.uaword	.LLCFI1-.LLFB3
	.byte	0xd
	.byte	0x1e
	.byte	0x2d
	.byte	0x9
	.byte	0xf
	.byte	0x1f
	.align 4
.LLEFDE3:
	.ident	"GCC: (GNU) 3.4.2"
