	.file	"20041020.C"
	.version	"01.01"
gcc2_compiled.:
.text
	.p2align 2,0x90
.globl ackerman__Fii
		.type		 ackerman__Fii,@function
ackerman__Fii:
	pushl %ebp
	movl %esp,%ebp
	subl $8,%esp
	cmpl $0,8(%ebp)
	jne .L3
	movl 12(%ebp),%edx
	incl %edx
	movl %edx,%eax
	jmp .L2
	jmp .L4
	.p2align 2,0x90
.L3:
	cmpl $0,12(%ebp)
	jne .L5
	addl $-8,%esp
	pushl $1
	movl 8(%ebp),%eax
	decl %eax
	pushl %eax
	call ackerman__Fii
	addl $16,%esp
	movl %eax,%edx
	movl %edx,%eax
	jmp .L2
	jmp .L4
	.p2align 2,0x90
.L5:
	addl $-8,%esp
	addl $-8,%esp
	movl 12(%ebp),%eax
	decl %eax
	pushl %eax
	movl 8(%ebp),%eax
	pushl %eax
	call ackerman__Fii
	addl $16,%esp
	movl %eax,%eax
	pushl %eax
	movl 8(%ebp),%eax
	decl %eax
	pushl %eax
	call ackerman__Fii
	addl $16,%esp
	movl %eax,%edx
	movl %edx,%eax
	jmp .L2
	.p2align 2,0x90
.L6:
.L4:
	jmp .L7
	jmp .L2
	.p2align 2,0x90
.L7:
.L2:
	leave
	ret
.Lfe1:
		.size		 ackerman__Fii,.Lfe1-ackerman__Fii
	.p2align 2,0x90
.globl main
		.type		 main,@function
main:
	pushl %ebp
	movl %esp,%ebp
	subl $24,%esp
	movl $6,-4(%ebp)
	addl $-8,%esp
	movl -4(%ebp),%eax
	pushl %eax
	pushl $3
	call ackerman__Fii
	addl $16,%esp
	movl %eax,%eax
	movl %eax,-8(%ebp)
	movl -8(%ebp),%edx
	movl %edx,%eax
	jmp .L8
	xorl %eax,%eax
	jmp .L8
	.p2align 2,0x90
.L8:
	leave
	ret
.Lfe2:
		.size		 main,.Lfe2-main
	.ident	"GCC: (GNU) cplusplus 2.95.4 20020320 [FreeBSD]"
