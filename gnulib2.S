	.file	"gnulib2.cpp"
gcc_compiled.:
.text
	.align 2
.globl ___adddi3
___adddi3:
	pushl %ebp
	movl %esp,%ebp
	subl $24,%esp
	pushl %esi
	pushl %ebx
	movl 8(%ebp),%ecx
	movl 12(%ebp),%ebx
	movl 16(%ebp),%eax
	movl 20(%ebp),%edx
	movl %ebx,-4(%ebp)
	movl %ecx,-8(%ebp)
	movl %edx,-12(%ebp)
	movl %eax,-16(%ebp)
	pushl $8
	leal -24(%ebp),%eax
	pushl %eax
	leal -16(%ebp),%eax
	pushl %eax
	leal -8(%ebp),%eax
	pushl %eax
	call _badd
	movl -20(%ebp),%esi
	movl -24(%ebp),%ebx
	movl %ebx,%eax
	movl %esi,%edx
	leal -32(%ebp),%esp
	popl %ebx
	popl %esi
	leave
	ret
	.align 2
_badd:
	pushl %ebp
	movl %esp,%ebp
	pushl %edi
	pushl %esi
	pushl %ebx
	movl 20(%ebp),%esi
	shrl $1,%esi
	xorl %ebx,%ebx
	xorl %ecx,%ecx
	cmpl %ecx,%esi
	jbe L7
L6:
	movl 8(%ebp),%edi
	movzwl (%edi,%ecx,2),%eax
	movl 12(%ebp),%edi
	movzwl (%edi,%ecx,2),%edx
	leal (%edx,%eax),%eax
	leal (%eax,%ebx),%ebx
	movw %bx,%ax
	movl 16(%ebp),%edi
	movw %ax,(%edi,%ecx,2)
	shrl $16,%ebx
	incl %ecx
	cmpl %ecx,%esi
	ja L6
L7:
	movl %ebx,%eax
	leal -12(%ebp),%esp
	popl %ebx
	popl %esi
	popl %edi
	leave
	ret
	.align 2
.globl ___anddi3
___anddi3:
	pushl %ebp
	movl %esp,%ebp
	pushl %edi
	pushl %esi
	pushl %ebx
	movl 16(%ebp),%esi
	movl 20(%ebp),%edi
	movl 12(%ebp),%ebx
	andl %edi,%ebx
	movl %ebx,%eax
	movl %eax,%edx
	movl 8(%ebp),%ebx
	andl %esi,%ebx
	movl %ebx,%ecx
	movl %ecx,%eax
	leal -12(%ebp),%esp
	popl %ebx
	popl %esi
	popl %edi
	leave
	ret
	.align 2
.globl ___iordi3
___iordi3:
	pushl %ebp
	movl %esp,%ebp
	pushl %edi
	pushl %esi
	pushl %ebx
	movl 16(%ebp),%esi
	movl 20(%ebp),%edi
	movl 12(%ebp),%ebx
	orl %edi,%ebx
	movl %ebx,%eax
	movl %eax,%edx
	movl 8(%ebp),%ebx
	orl %esi,%ebx
	movl %ebx,%ecx
	movl %ecx,%eax
	leal -12(%ebp),%esp
	popl %ebx
	popl %esi
	popl %edi
	leave
	ret
	.align 2
.globl ___xordi3
___xordi3:
	pushl %ebp
	movl %esp,%ebp
	pushl %edi
	pushl %esi
	pushl %ebx
	movl 16(%ebp),%esi
	movl 20(%ebp),%edi
	movl 12(%ebp),%ebx
	xorl %edi,%ebx
	movl %ebx,%eax
	movl %eax,%edx
	movl 8(%ebp),%ebx
	xorl %esi,%ebx
	movl %ebx,%ecx
	movl %ecx,%eax
	leal -12(%ebp),%esp
	popl %ebx
	popl %esi
	popl %edi
	leave
	ret
	.align 2
.globl ___one_cmpldi2
___one_cmpldi2:
	pushl %ebp
	movl %esp,%ebp
	pushl %esi
	pushl %ebx
	movl 8(%ebp),%ecx
	movl 12(%ebp),%ebx
	movl %ebx,%esi
	notl %esi
	movl %esi,%eax
	movl %eax,%edx
	notl %ecx
	movl %ecx,%eax
	leal -8(%ebp),%esp
	popl %ebx
	popl %esi
	leave
	ret
	.align 2
.globl ___lshldi3
___lshldi3:
	pushl %ebp
	movl %esp,%ebp
	subl $16,%esp
	pushl %edi
	pushl %esi
	pushl %ebx
	movl 8(%ebp),%eax
	movl 12(%ebp),%edx
	movl 16(%ebp),%ecx
	movl %ecx,-16(%ebp)
	testl %ecx,%ecx
	je L12
	movl %eax,%esi
	movl %edx,%edi
	movl $32,%eax
	subl -16(%ebp),%eax
	testl %eax,%eax
	jg L14
	movl $0,-8(%ebp)
	negl %eax
	movl %eax,-12(%ebp)
	movl %esi,%ebx
	movl %eax,%ecx
	shll %cl,%ebx
	movl %ebx,%eax
	movl %eax,-4(%ebp)
	jmp L15
	.align 2
L14:
	movl %esi,%ebx
	movl %eax,%ecx
	shrl %cl,%ebx
	movl %ebx,%eax
	movl %esi,%ebx
	movl -16(%ebp),%ecx
	shll %cl,%ebx
	movl %ebx,%edx
	movl %edx,-8(%ebp)
	movl %edi,%ebx
	shll %cl,%ebx
	movl %ebx,%edx
	orl %eax,%edx
	movl %edx,-4(%ebp)
L15:
	movl -8(%ebp),%eax
	movl -4(%ebp),%edx
L12:
	leal -28(%ebp),%esp
	popl %ebx
	popl %esi
	popl %edi
	leave
	ret
	.align 2
.globl ___lshrdi3
___lshrdi3:
	pushl %ebp
	movl %esp,%ebp
	subl $16,%esp
	pushl %edi
	pushl %esi
	pushl %ebx
	movl 8(%ebp),%eax
	movl 12(%ebp),%edx
	movl 16(%ebp),%ecx
	movl %ecx,-16(%ebp)
	testl %ecx,%ecx
	je L16
	movl %eax,%esi
	movl %edx,%edi
	movl $32,%eax
	subl -16(%ebp),%eax
	testl %eax,%eax
	jg L18
	movl $0,-4(%ebp)
	negl %eax
	movl %eax,-12(%ebp)
	movl %edi,%ebx
	movl %eax,%ecx
	shrl %cl,%ebx
	movl %ebx,%eax
	movl %eax,-8(%ebp)
	jmp L19
	.align 2
L18:
	movl %edi,%ebx
	movl %eax,%ecx
	shll %cl,%ebx
	movl %ebx,%eax
	movl %edi,%ebx
	movl -16(%ebp),%ecx
	shrl %cl,%ebx
	movl %ebx,%edx
	movl %edx,-4(%ebp)
	movl %esi,%ebx
	shrl %cl,%ebx
	movl %ebx,%edx
	orl %eax,%edx
	movl %edx,-8(%ebp)
L19:
	movl -8(%ebp),%eax
	movl -4(%ebp),%edx
L16:
	leal -28(%ebp),%esp
	popl %ebx
	popl %esi
	popl %edi
	leave
	ret
	.align 2
.globl ___ashldi3
___ashldi3:
	pushl %ebp
	movl %esp,%ebp
	subl $16,%esp
	pushl %edi
	pushl %esi
	pushl %ebx
	movl 8(%ebp),%eax
	movl 12(%ebp),%edx
	movl 16(%ebp),%ecx
	movl %ecx,-16(%ebp)
	testl %ecx,%ecx
	je L20
	movl %eax,%esi
	movl %edx,%edi
	movl $32,%eax
	subl -16(%ebp),%eax
	testl %eax,%eax
	jg L22
	movl $0,-8(%ebp)
	negl %eax
	movl %eax,-12(%ebp)
	movl %esi,%ebx
	movl %eax,%ecx
	shll %cl,%ebx
	movl %ebx,%eax
	movl %eax,-4(%ebp)
	jmp L23
	.align 2
L22:
	movl %esi,%ebx
	movl %eax,%ecx
	shrl %cl,%ebx
	movl %ebx,%eax
	movl %esi,%ebx
	movl -16(%ebp),%ecx
	shll %cl,%ebx
	movl %ebx,%edx
	movl %edx,-8(%ebp)
	movl %edi,%ebx
	shll %cl,%ebx
	movl %ebx,%edx
	orl %eax,%edx
	movl %edx,-4(%ebp)
L23:
	movl -8(%ebp),%eax
	movl -4(%ebp),%edx
L20:
	leal -28(%ebp),%esp
	popl %ebx
	popl %esi
	popl %edi
	leave
	ret
	.align 2
.globl ___ashrdi3
___ashrdi3:
	pushl %ebp
	movl %esp,%ebp
	subl $16,%esp
	pushl %edi
	pushl %esi
	pushl %ebx
	movl 8(%ebp),%eax
	movl 12(%ebp),%edx
	movl 16(%ebp),%ecx
	movl %ecx,-16(%ebp)
	testl %ecx,%ecx
	je L24
	movl %eax,%esi
	movl %edx,%edi
	movl $32,%edx
	subl -16(%ebp),%edx
	testl %edx,%edx
	jg L26
	movl %edi,%ecx
	sarl $31,%ecx
	movl %ecx,%eax
	movl %eax,-4(%ebp)
	negl %edx
	movl %edx,-12(%ebp)
	movl %edi,%ebx
	movl %edx,%ecx
	sarl %cl,%ebx
	movl %ebx,%eax
	movl %eax,-8(%ebp)
	jmp L27
	.align 2
L26:
	movl %edi,%ebx
	movl %edx,%ecx
	shll %cl,%ebx
	movl %ebx,%eax
	movl %edi,%ebx
	movl -16(%ebp),%ecx
	sarl %cl,%ebx
	movl %ebx,%edx
	movl %edx,-4(%ebp)
	movl %esi,%ebx
	shrl %cl,%ebx
	movl %ebx,%edx
	orl %eax,%edx
	movl %edx,-8(%ebp)
L27:
	movl -8(%ebp),%eax
	movl -4(%ebp),%edx
L24:
	leal -28(%ebp),%esp
	popl %ebx
	popl %esi
	popl %edi
	leave
	ret
	.align 2
.globl ___subdi3
___subdi3:
	pushl %ebp
	movl %esp,%ebp
	subl $24,%esp
	pushl %esi
	pushl %ebx
	movl 8(%ebp),%ecx
	movl 12(%ebp),%ebx
	movl 16(%ebp),%eax
	movl 20(%ebp),%edx
	movl %ebx,-4(%ebp)
	movl %ecx,-8(%ebp)
	movl %edx,-12(%ebp)
	movl %eax,-16(%ebp)
	pushl $8
	leal -24(%ebp),%eax
	pushl %eax
	leal -16(%ebp),%eax
	pushl %eax
	leal -8(%ebp),%eax
	pushl %eax
	call _bsub
	movl -20(%ebp),%esi
	movl -24(%ebp),%ebx
	movl %ebx,%eax
	movl %esi,%edx
	leal -32(%ebp),%esp
	popl %ebx
	popl %esi
	leave
	ret
	.align 2
_bsub:
	pushl %ebp
	movl %esp,%ebp
	pushl %edi
	pushl %esi
	pushl %ebx
	movl 20(%ebp),%esi
	shrl $1,%esi
	xorl %ebx,%ebx
	xorl %ecx,%ecx
	cmpl %ecx,%esi
	jbe L34
L33:
	movl 8(%ebp),%edi
	movzwl (%edi,%ecx,2),%eax
	movl 12(%ebp),%edi
	movzwl (%edi,%ecx,2),%edx
	subl %edx,%eax
	leal (%eax,%ebx),%ebx
	movw %bx,%ax
	movl 16(%ebp),%edi
	movw %ax,(%edi,%ecx,2)
	sarl $16,%ebx
	incl %ecx
	cmpl %ecx,%esi
	ja L33
L34:
	movl %ebx,%eax
	leal -12(%ebp),%esp
	popl %ebx
	popl %esi
	popl %edi
	leave
	ret
	.align 2
.globl ___muldi3
___muldi3:
	pushl %ebp
	movl %esp,%ebp
	subl $32,%esp
	pushl %esi
	pushl %ebx
	movl 8(%ebp),%ecx
	movl 12(%ebp),%ebx
	movl 16(%ebp),%eax
	movl 20(%ebp),%edx
	movl %ebx,-20(%ebp)
	movl %ecx,-24(%ebp)
	movl %edx,-28(%ebp)
	movl %eax,-32(%ebp)
	pushl $8
	pushl $8
	leal -16(%ebp),%eax
	pushl %eax
	leal -32(%ebp),%eax
	pushl %eax
	leal -24(%ebp),%eax
	pushl %eax
	call _bmul
	movl -12(%ebp),%esi
	movl -16(%ebp),%ebx
	movl %ebx,%eax
	movl %esi,%edx
	leal -40(%ebp),%esp
	popl %ebx
	popl %esi
	leave
	ret
	.align 2
_bmul:
	pushl %ebp
	movl %esp,%ebp
	subl $16,%esp
	pushl %edi
	pushl %esi
	pushl %ebx
	movl 20(%ebp),%esi
	movl %esi,-4(%ebp)
	movl 24(%ebp),%esi
	movl %esi,-8(%ebp)
	movl -4(%ebp),%esi
	movl -8(%ebp),%edx
	leal (%edx,%esi),%eax
	pushl %eax
	pushl $0
	pushl 16(%ebp)
	call _memset
	shrl $1,-4(%ebp)
	shrl $1,-8(%ebp)
	xorl %edi,%edi
	cmpl -8(%ebp),%edi
	jae L46
L44:
	movl 16(%ebp),%esi
	leal (%esi,%edi,2),%esi
	movl %esi,-12(%ebp)
	xorl %ebx,%ebx
	xorl %ecx,%ecx
	cmpl -4(%ebp),%ecx
	jae L45
L43:
	movl 8(%ebp),%esi
	movzwl (%esi,%ecx,2),%eax
	movl 12(%ebp),%esi
	movzwl (%esi,%edi,2),%esi
	imull %esi,%eax
	movl -12(%ebp),%esi
	movzwl (%esi,%ecx,2),%esi
	leal (%esi,%eax),%eax
	leal (%eax,%ebx),%ebx
	movw %bx,%ax
	movl -12(%ebp),%esi
	movw %ax,(%esi,%ecx,2)
	shrl $16,%ebx
	incl %ecx
	cmpl -4(%ebp),%ecx
	jb L43
L45:
	movw %bx,%ax
	movl -12(%ebp),%esi
	movw %ax,(%esi,%ecx,2)
	incl %edi
	cmpl -8(%ebp),%edi
	jb L44
L46:
	leal -28(%ebp),%esp
	popl %ebx
	popl %esi
	popl %edi
	leave
	ret
	.align 2
.globl ___divdi3
___divdi3:
	pushl %ebp
	movl %esp,%ebp
	pushl %esi
	pushl %ebx
	movl 8(%ebp),%ebx
	movl 12(%ebp),%esi
	pushl $0
	pushl $0
	pushl %esi
	pushl %ebx
	call ___cmpdi2
	addl $16,%esp
	cmpl $1,%eax
	jge L48
	pushl $0
	pushl $0
	pushl 20(%ebp)
	pushl 16(%ebp)
	call ___cmpdi2
	addl $16,%esp
	cmpl $1,%eax
	jge L49
	pushl %esi
	pushl %ebx
	call ___negdi2
	addl $8,%esp
	movl %eax,%ebx
	movl %edx,%esi
	pushl 20(%ebp)
	pushl 16(%ebp)
	call ___negdi2
	addl $8,%esp
	pushl %edx
	pushl %eax
	jmp L54
	.align 2
L49:
	pushl %esi
	pushl %ebx
	call ___negdi2
	addl $8,%esp
	pushl 20(%ebp)
	pushl 16(%ebp)
	pushl %edx
	pushl %eax
	jmp L55
	.align 2
L48:
	pushl $0
	pushl $0
	pushl 20(%ebp)
	pushl 16(%ebp)
	call ___cmpdi2
	addl $16,%esp
	cmpl $1,%eax
	jge L52
	pushl 20(%ebp)
	pushl 16(%ebp)
	call ___negdi2
	addl $8,%esp
	pushl %edx
	pushl %eax
	pushl %esi
	pushl %ebx
L55:
	call ___udivdi3
	addl $16,%esp
	pushl %edx
	pushl %eax
	call ___negdi2
	jmp L47
	.align 2
L52:
	pushl 20(%ebp)
	pushl 16(%ebp)
L54:
	pushl %esi
	pushl %ebx
	call ___udivdi3
L47:
	leal -8(%ebp),%esp
	popl %ebx
	popl %esi
	leave
	ret
	.align 2
.globl ___moddi3
___moddi3:
	pushl %ebp
	movl %esp,%ebp
	pushl %esi
	pushl %ebx
	movl 8(%ebp),%ebx
	movl 12(%ebp),%esi
	pushl $0
	pushl $0
	pushl %esi
	pushl %ebx
	call ___cmpdi2
	addl $16,%esp
	cmpl $1,%eax
	jge L57
	pushl $0
	pushl $0
	pushl 20(%ebp)
	pushl 16(%ebp)
	call ___cmpdi2
	addl $16,%esp
	cmpl $1,%eax
	jge L58
	pushl %esi
	pushl %ebx
	call ___negdi2
	addl $8,%esp
	movl %eax,%ebx
	movl %edx,%esi
	pushl 20(%ebp)
	pushl 16(%ebp)
	call ___negdi2
	addl $8,%esp
	pushl %edx
	pushl %eax
	pushl %esi
	pushl %ebx
	jmp L63
	.align 2
L58:
	pushl %esi
	pushl %ebx
	call ___negdi2
	addl $8,%esp
	pushl 20(%ebp)
	pushl 16(%ebp)
	pushl %edx
	pushl %eax
L63:
	call ___umoddi3
	addl $16,%esp
	pushl %edx
	pushl %eax
	call ___negdi2
	jmp L56
	.align 2
L57:
	pushl $0
	pushl $0
	pushl 20(%ebp)
	pushl 16(%ebp)
	call ___cmpdi2
	addl $16,%esp
	cmpl $1,%eax
	jge L61
	pushl 20(%ebp)
	pushl 16(%ebp)
	call ___negdi2
	addl $8,%esp
	pushl %edx
	pushl %eax
	jmp L64
	.align 2
L61:
	pushl 20(%ebp)
	pushl 16(%ebp)
L64:
	pushl %esi
	pushl %ebx
	call ___umoddi3
L56:
	leal -8(%ebp),%esp
	popl %ebx
	popl %esi
	leave
	ret
	.align 2
.globl ___udivdi3
___udivdi3:
	pushl %ebp
	movl %esp,%ebp
	subl $40,%esp
	pushl %esi
	pushl %ebx
	movl 8(%ebp),%ecx
	movl 12(%ebp),%ebx
	movl 16(%ebp),%eax
	movl 20(%ebp),%edx
	movl $0,-4(%ebp)
	movl $0,-8(%ebp)
	movl %ebx,-12(%ebp)
	movl %ecx,-16(%ebp)
	movl %edx,-20(%ebp)
	movl %eax,-24(%ebp)
	pushl $8
	pushl $16
	leal -40(%ebp),%eax
	pushl %eax
	leal -32(%ebp),%eax
	pushl %eax
	leal -24(%ebp),%eax
	pushl %eax
	leal -16(%ebp),%eax
	pushl %eax
	call ___bdiv
	movl -28(%ebp),%esi
	movl -32(%ebp),%ebx
	movl %ebx,%eax
	movl %esi,%edx
	leal -48(%ebp),%esp
	popl %ebx
	popl %esi
	leave
	ret
	.align 2
.globl ___umoddi3
___umoddi3:
	pushl %ebp
	movl %esp,%ebp
	subl $40,%esp
	pushl %esi
	pushl %ebx
	movl 8(%ebp),%ecx
	movl 12(%ebp),%ebx
	movl 16(%ebp),%eax
	movl 20(%ebp),%edx
	movl $0,-4(%ebp)
	movl $0,-8(%ebp)
	movl %ebx,-12(%ebp)
	movl %ecx,-16(%ebp)
	movl %edx,-20(%ebp)
	movl %eax,-24(%ebp)
	pushl $8
	pushl $16
	leal -40(%ebp),%eax
	pushl %eax
	leal -32(%ebp),%eax
	pushl %eax
	leal -24(%ebp),%eax
	pushl %eax
	leal -16(%ebp),%eax
	pushl %eax
	call ___bdiv
	movl -36(%ebp),%esi
	movl -40(%ebp),%ebx
	movl %ebx,%eax
	movl %esi,%edx
	leal -48(%ebp),%esp
	popl %ebx
	popl %esi
	leave
	ret
	.align 2
.globl ___negdi2
___negdi2:
	pushl %ebp
	movl %esp,%ebp
	subl $16,%esp
	pushl %esi
	pushl %ebx
	movl 8(%ebp),%eax
	movl 12(%ebp),%edx
	movl %edx,-4(%ebp)
	movl %eax,-8(%ebp)
	pushl $8
	leal -16(%ebp),%eax
	pushl %eax
	leal -8(%ebp),%eax
	pushl %eax
	call _bneg
	movl -12(%ebp),%esi
	movl -16(%ebp),%ebx
	movl %ebx,%eax
	movl %esi,%edx
	leal -24(%ebp),%esp
	popl %ebx
	popl %esi
	leave
	ret
	.align 2
_bneg:
	pushl %ebp
	movl %esp,%ebp
	pushl %edi
	pushl %esi
	pushl %ebx
	movl 8(%ebp),%edi
	movl 12(%ebp),%esi
	movl 16(%ebp),%ebx
	shrl $1,%ebx
	xorl %ecx,%ecx
	xorl %edx,%edx
	cmpl %edx,%ebx
	jbe L73
L72:
	movzwl (%edi,%edx,2),%eax
	subl %eax,%ecx
	movw %cx,%ax
	movw %ax,(%esi,%edx,2)
	sarl $16,%ecx
	incl %edx
	cmpl %edx,%ebx
	ja L72
L73:
	movl %ecx,%eax
	leal -12(%ebp),%esp
	popl %ebx
	popl %esi
	popl %edi
	leave
	ret
	.align 2
.globl ___bdiv
___bdiv:
	pushl %ebp
	movl %esp,%ebp
	subl $56,%esp
	pushl %edi
	pushl %esi
	pushl %ebx
	movl 24(%ebp),%ebx
	movl 28(%ebp),%eax
	movl %eax,-4(%ebp)
	leal 3(%ebx),%eax
	andl $-4,%eax
	subl %eax,%esp
	movl %esp,-12(%ebp)
	movl -4(%ebp),%eax
	addl $3,%eax
	andl $-4,%eax
	subl %eax,%esp
	movl %esp,-16(%ebp)
	shrl $1,%ebx
	shrl $1,-4(%ebp)
	movl %ebx,%eax
	subl -4(%ebp),%eax
	movl %eax,-56(%ebp)
	jmp L75
	.align 2
L78:
	movl -4(%ebp),%eax
	movl 20(%ebp),%ecx
	movw $0,-2(%ecx,%eax,2)
	decl %ebx
	decl -4(%ebp)
	jne L75
	call _abort
L75:
	movl -4(%ebp),%eax
	movl 12(%ebp),%ecx
	cmpw $0,-2(%ecx,%eax,2)
	je L78
	cmpl $1,-4(%ebp)
	jne L79
	movl 8(%ebp),%eax
	movzwl -2(%eax,%ebx,2),%esi
	movl -56(%ebp),%eax
	decl %eax
	movl %eax,-56(%ebp)
	js L113
L83:
	shll $16,%esi
	movl %esi,-48(%ebp)
	movl 8(%ebp),%ecx
	movl -56(%ebp),%eax
	movzwl (%ecx,%eax,2),%edx
	orl %edx,%esi
	movl 12(%ebp),%eax
	movzwl (%eax),%eax
	movl %eax,-48(%ebp)
	movl %esi,%eax
	xorl %edx,%edx
	divl -48(%ebp)
	movl %eax,-48(%ebp)
	movw -48(%ebp),%ax
	movw %ax,-48(%ebp)
	movw -48(%ebp),%di
	movl 16(%ebp),%ecx
	movl -56(%ebp),%eax
	movw %di,(%ecx,%eax,2)
	movl 12(%ebp),%eax
	movzwl (%eax),%eax
	movl %eax,-48(%ebp)
	movl %esi,%eax
	xorl %edx,%edx
	divl -48(%ebp)
	movl %edx,%esi
	decl -56(%ebp)
	jns L83
L113:
	movw %si,-48(%ebp)
	movw -48(%ebp),%cx
	movl 20(%ebp),%eax
	movw %cx,(%eax)
	jmp L74
	.align 2
L79:
	movl $0,-36(%ebp)
	movl -4(%ebp),%eax
	movl 12(%ebp),%ecx
	movzwl -2(%ecx,%eax,2),%edx
L88:
	movl $15,%ecx
	subl -36(%ebp),%ecx
	movl $1,%eax
	sall %cl,%eax
	testl %edx,%eax
	jne L85
	incl -36(%ebp)
	cmpl $15,-36(%ebp)
	jle L88
L85:
	pushl %ebx
	pushl $0
	pushl -12(%ebp)
	pushl -36(%ebp)
	pushl 8(%ebp)
	call _bshift
	pushl -4(%ebp)
	pushl $0
	pushl -16(%ebp)
	pushl -36(%ebp)
	pushl 12(%ebp)
	call _bshift
	movl -12(%ebp),%eax
	leal -2(%eax,%ebx,2),%eax
	movl %eax,-48(%ebp)
	movl -56(%ebp),%eax
	leal -2(,%eax,2),%edx
	movl -48(%ebp),%eax
	subl %edx,%eax
	movl %eax,-20(%ebp)
	addl $-2,%eax
	movl %eax,-24(%ebp)
	addl $-2,%eax
	movl %eax,-28(%ebp)
	movl -4(%ebp),%eax
	movl -16(%ebp),%ecx
	leal -2(%ecx,%eax,2),%ecx
	movl %ecx,-32(%ebp)
	movl -56(%ebp),%eax
	decl %eax
	movl %eax,-56(%ebp)
	addl $40,%esp
	testl %eax,%eax
	jl L112
L108:
	movl -32(%ebp),%eax
	movw (%eax),%di
	movl -20(%ebp),%ecx
	movl -56(%ebp),%eax
	cmpw (%ecx,%eax,2),%di
	jne L92
	movl $65535,-8(%ebp)
	movl -32(%ebp),%eax
	movzwl (%eax),%eax
	movl %eax,-48(%ebp)
	movl -24(%ebp),%ecx
	movl -56(%ebp),%eax
	movzwl (%ecx,%eax,2),%edx
	movl -48(%ebp),%eax
	leal (%edx,%eax),%ecx
	movl %ecx,-52(%ebp)
	jmp L93
	.align 2
L92:
	movl -20(%ebp),%ecx
	movl -56(%ebp),%eax
	movzwl (%ecx,%eax,2),%ecx
	shll $16,%ecx
	movl %ecx,-48(%ebp)
	movl -24(%ebp),%ecx
	movzwl (%ecx,%eax,2),%edx
	orl -48(%ebp),%edx
	movl %edx,-48(%ebp)
	movl -32(%ebp),%eax
	movzwl (%eax),%edx
	movl -48(%ebp),%eax
	movl %edx,%ecx
	xorl %edx,%edx
	divl %ecx
	movl %eax,-8(%ebp)
	movl %edx,-52(%ebp)
L93:
	cmpl $65535,-52(%ebp)
	ja L95
	movl -32(%ebp),%eax
	movzwl -2(%eax),%esi
	movl -28(%ebp),%ecx
	movl -56(%ebp),%eax
	movzwl (%ecx,%eax,2),%ebx
L96:
	movl -8(%ebp),%edx
	imull %esi,%edx
	movl -52(%ebp),%eax
	shll $16,%eax
	orl %ebx,%eax
	cmpl %edx,%eax
	jae L95
	decl -8(%ebp)
	movl -32(%ebp),%eax
	movzwl (%eax),%eax
	movl %eax,-48(%ebp)
	movl -52(%ebp),%eax
	movl -48(%ebp),%ecx
	leal (%ecx,%eax),%ecx
	movl %ecx,-52(%ebp)
	cmpl $65535,%ecx
	jbe L96
L95:
	xorl %esi,%esi
	xorl %ebx,%ebx
	cmpl -4(%ebp),%ebx
	jae L110
	movl -12(%ebp),%ecx
	movl -56(%ebp),%eax
	leal (%ecx,%eax,2),%ecx
	movl %ecx,-40(%ebp)
L102:
	movl %ebx,%eax
	addl %eax,%eax
	movl %eax,-48(%ebp)
	movl -40(%ebp),%eax
	movl -48(%ebp),%ecx
	movzwl (%ecx,%eax),%edx
	movl -16(%ebp),%eax
	movzwl (%eax,%ebx,2),%eax
	imull -8(%ebp),%eax
	subl %eax,%edx
	leal (%edx,%esi),%esi
	movw %si,%dx
	movl -40(%ebp),%eax
	movw %dx,(%ecx,%eax)
	cmpl $65535,%esi
	ja L100
	xorl %esi,%esi
	jmp L99
	.align 2
L100:
	movl %esi,%eax
	shrl $16,%eax
	movl %eax,%esi
	orl $-65536,%esi
L99:
	incl %ebx
	cmpl -4(%ebp),%ebx
	jb L102
L110:
	movw -8(%ebp),%ax
	movw %ax,-48(%ebp)
	movw -48(%ebp),%di
	movl 16(%ebp),%ecx
	movl -56(%ebp),%eax
	movw %di,(%ecx,%eax,2)
	movl -20(%ebp),%ecx
	movzwl (%ecx,%eax,2),%ecx
	leal (%ecx,%esi),%eax
	testl %eax,%eax
	jge L91
	movl 16(%ebp),%ecx
	movl -56(%ebp),%eax
	addw $65535,(%ecx,%eax,2)
	xorl %esi,%esi
	xorl %ebx,%ebx
	cmpl -4(%ebp),%ebx
	jae L91
	movl -12(%ebp),%ecx
	leal (%ecx,%eax,2),%ecx
	movl %ecx,-44(%ebp)
L107:
	movl %ebx,%eax
	addl %eax,%eax
	movl %eax,-48(%ebp)
	movl -44(%ebp),%eax
	movl -48(%ebp),%ecx
	movzwl (%ecx,%eax),%edx
	movl -16(%ebp),%eax
	movzwl (%eax,%ebx,2),%eax
	leal (%eax,%edx),%edx
	leal (%edx,%esi),%esi
	movw %si,%dx
	movl -44(%ebp),%eax
	movw %dx,(%ecx,%eax)
	shrl $16,%esi
	incl %ebx
	cmpl -4(%ebp),%ebx
	jb L107
L91:
	decl -56(%ebp)
	jns L108
L112:
	movl -4(%ebp),%eax
	decl %eax
	pushl %eax
	movl -12(%ebp),%eax
	movzwl (%eax),%eax
	movl -36(%ebp),%ecx
	sarl %cl,%eax
	pushl %eax
	pushl 20(%ebp)
	movl $16,%eax
	subl %ecx,%eax
	pushl %eax
	movl -12(%ebp),%eax
	addl $2,%eax
	pushl %eax
	call _bshift
	movl %eax,-48(%ebp)
	movw -48(%ebp),%ax
	movw %ax,-48(%ebp)
	movw -48(%ebp),%di
	movl -4(%ebp),%eax
	movl 20(%ebp),%ecx
	movw %di,-2(%ecx,%eax,2)
L74:
	leal -68(%ebp),%esp
	popl %ebx
	popl %esi
	popl %edi
	leave
	ret
	.align 2
_bshift:
	pushl %ebp
	movl %esp,%ebp
	subl $4,%esp
	pushl %edi
	pushl %esi
	pushl %ebx
	movl 12(%ebp),%esi
	movl 16(%ebp),%edi
	movw 20(%ebp),%ax
	movl 24(%ebp),%ebx
	testl %esi,%esi
	jne L116
	movl %ebx,%eax
	addl %eax,%eax
	pushl %eax
	pushl 8(%ebp)
	pushl %edi
	call _memcpy
	xorl %eax,%eax
	jmp L115
	.align 2
L116:
	movzwl %ax,%ecx
	movl %ecx,-4(%ebp)
	xorl %edx,%edx
	cmpl %edx,%ebx
	jle L121
L120:
	movl 8(%ebp),%ecx
	movzwl (%ecx,%edx,2),%eax
	movl %esi,%ecx
	shll %cl,%eax
	orl %eax,-4(%ebp)
	movw -4(%ebp),%ax
	movw %ax,(%edi,%edx,2)
	shrl $16,-4(%ebp)
	incl %edx
	cmpl %edx,%ebx
	jg L120
L121:
	movl -4(%ebp),%eax
L115:
	leal -16(%ebp),%esp
	popl %ebx
	popl %esi
	popl %edi
	leave
	ret
	.align 2
.globl ___cmpdi2
___cmpdi2:
	pushl %ebp
	movl %esp,%ebp
	pushl %ebx
	movl 8(%ebp),%ecx
	movl 12(%ebp),%ebx
	movl 16(%ebp),%eax
	movl 20(%ebp),%edx
	cmpl %ebx,%edx
	jg L129
	cmpl %ebx,%edx
	jl L130
	cmpl %ecx,%eax
	jbe L126
L129:
	xorl %eax,%eax
	jmp L122
	.align 2
L126:
	cmpl %ecx,%eax
	jae L127
L130:
	movl $2,%eax
	jmp L122
	.align 2
L127:
	movl $1,%eax
L122:
	leal -4(%ebp),%esp
	popl %ebx
	leave
	ret
	.align 2
.globl ___ucmpdi2
___ucmpdi2:
	pushl %ebp
	movl %esp,%ebp
	pushl %ebx
	movl 8(%ebp),%ecx
	movl 12(%ebp),%ebx
	movl 16(%ebp),%eax
	movl 20(%ebp),%edx
	cmpl %ebx,%edx
	ja L138
	cmpl %ebx,%edx
	jb L139
	cmpl %ecx,%eax
	jbe L135
L138:
	xorl %eax,%eax
	jmp L131
	.align 2
L135:
	cmpl %ecx,%eax
	jae L136
L139:
	movl $2,%eax
	jmp L131
	.align 2
L136:
	movl $1,%eax
L131:
	leal -4(%ebp),%esp
	popl %ebx
	leave
	ret
	.align 2
.globl ___fixunsdfdi
___fixunsdfdi:
	pushl %ebp
	movl %esp,%ebp
	subl $24,%esp
	pushl %edi
	pushl %esi
	pushl %ebx
	movl 8(%ebp),%esi
	movl 12(%ebp),%edi
	movl %esi,-8(%ebp)
	movl %edi,-4(%ebp)
	pushl $0
	pushl $0
	pushl -4(%ebp)
	pushl -8(%ebp)
	call ___cmpdf2
	addl $16,%esp
	testl %eax,%eax
	jge L141
	movl $0,%eax
	movl $0,%edx
	jmp L140
	.align 2
L141:
	pushl $1106247680
	pushl $0
	pushl -4(%ebp)
	pushl -8(%ebp)
	call ___divdf3
	addl $16,%esp
	addl $-8,%esp
	fstpl (%esp)
	popl %eax
	popl %edx
	pushl %edx
	pushl %eax
	call ___fixunsdfsi
	addl $8,%esp
	movl %eax,-16(%ebp)
	movl $0,-12(%ebp)
	pushl $0
	pushl $32
	pushl -12(%ebp)
	pushl -16(%ebp)
	call ___lshldi3
	addl $16,%esp
	movl %eax,-16(%ebp)
	movl %edx,-12(%ebp)
	pushl -12(%ebp)
	pushl -16(%ebp)
	call ___floatdidf
	addl $8,%esp
	fstpl -24(%ebp)
	pushl $0
	pushl $0
	pushl -20(%ebp)
	pushl -24(%ebp)
	call ___cmpdf2
	addl $16,%esp
	testl %eax,%eax
	jge L142
	pushl $1139802112
	pushl $0
	pushl -20(%ebp)
	pushl -24(%ebp)
	call ___adddf3
	addl $16,%esp
	fstpl -24(%ebp)
L142:
	pushl -20(%ebp)
	pushl -24(%ebp)
	pushl -4(%ebp)
	pushl -8(%ebp)
	call ___subdf3
	addl $16,%esp
	fstpl -8(%ebp)
	pushl $0
	pushl $0
	pushl -4(%ebp)
	pushl -8(%ebp)
	call ___cmpdf2
	addl $16,%esp
	testl %eax,%eax
	jge L143
	pushl -4(%ebp)
	pushl -8(%ebp)
	call ___negdf2
	addl $8,%esp
	addl $-8,%esp
	fstpl (%esp)
	popl %eax
	popl %edx
	pushl %edx
	pushl %eax
	call ___fixunsdfsi
	addl $8,%esp
	movl %eax,%edx
	xorl %ecx,%ecx
	pushl %ecx
	pushl %edx
	pushl -12(%ebp)
	pushl -16(%ebp)
	call ___subdi3
	jmp L145
	.align 2
L143:
	pushl -4(%ebp)
	pushl -8(%ebp)
	call ___fixunsdfsi
	addl $8,%esp
	movl %eax,%edx
	xorl %ecx,%ecx
	pushl %ecx
	pushl %edx
	pushl -12(%ebp)
	pushl -16(%ebp)
	call ___adddi3
L145:
	movl %eax,-16(%ebp)
	movl %edx,-12(%ebp)
	movl -16(%ebp),%eax
	movl -12(%ebp),%edx
L140:
	leal -36(%ebp),%esp
	popl %ebx
	popl %esi
	popl %edi
	leave
	ret
	.align 2
.globl ___fixdfdi
___fixdfdi:
	pushl %ebp
	movl %esp,%ebp
	pushl %esi
	pushl %ebx
	movl 8(%ebp),%ebx
	movl 12(%ebp),%esi
	pushl $0
	pushl $0
	pushl %esi
	pushl %ebx
	call ___cmpdf2
	addl $16,%esp
	testl %eax,%eax
	jge L147
	pushl %esi
	pushl %ebx
	call ___negdf2
	addl $8,%esp
	addl $-8,%esp
	fstpl (%esp)
	popl %eax
	popl %edx
	pushl %edx
	pushl %eax
	call ___fixunsdfdi
	pushl %edx
	pushl %eax
	call ___negdi2
	jmp L146
	.align 2
L147:
	pushl %esi
	pushl %ebx
	call ___fixunsdfdi
L146:
	leal -8(%ebp),%esp
	popl %ebx
	popl %esi
	leave
	ret
	.align 2
.globl ___floatdidf
___floatdidf:
	pushl %ebp
	movl %esp,%ebp
	subl $24,%esp
	pushl %edi
	pushl %esi
	pushl %ebx
	movl 8(%ebp),%ecx
	movl 12(%ebp),%ebx
	movl %ecx,-8(%ebp)
	movl %ebx,-4(%ebp)
	xorl %edi,%edi
	pushl $0
	pushl $0
	pushl -4(%ebp)
	pushl -8(%ebp)
	call ___cmpdi2
	addl $16,%esp
	cmpl $1,%eax
	jge L149
	pushl -4(%ebp)
	pushl -8(%ebp)
	call ___negdi2
	addl $8,%esp
	movl %eax,-8(%ebp)
	movl %edx,-4(%ebp)
	movl $1,%edi
L149:
	pushl $0
	pushl $32
	pushl -4(%ebp)
	pushl -8(%ebp)
	call ___ashrdi3
	addl $16,%esp
	pushl %eax
	call ___floatsidf
	addl $4,%esp
	fstpl -24(%ebp)
	pushl $0
	pushl $0
	pushl -20(%ebp)
	pushl -24(%ebp)
	call ___cmpdf2
	addl $16,%esp
	testl %eax,%eax
	jge L150
	pushl $1106247680
	pushl $0
	pushl -20(%ebp)
	pushl -24(%ebp)
	call ___adddf3
	addl $16,%esp
	fstpl -24(%ebp)
L150:
	movl -24(%ebp),%ecx
	movl -20(%ebp),%ebx
	movl %ecx,-16(%ebp)
	movl %ebx,-12(%ebp)
	pushl $1089470464
	pushl $0
	pushl -12(%ebp)
	pushl -16(%ebp)
	call ___muldf3
	addl $16,%esp
	fstpl -16(%ebp)
	pushl $1089470464
	pushl $0
	pushl -12(%ebp)
	pushl -16(%ebp)
	call ___muldf3
	addl $16,%esp
	fstpl -16(%ebp)
	movl -8(%ebp),%eax
	pushl %eax
	call ___floatsidf
	addl $4,%esp
	fstpl -24(%ebp)
	pushl $0
	pushl $0
	pushl -20(%ebp)
	pushl -24(%ebp)
	call ___cmpdf2
	addl $16,%esp
	testl %eax,%eax
	jge L151
	pushl $1106247680
	pushl $0
	pushl -20(%ebp)
	pushl -24(%ebp)
	call ___adddf3
	addl $16,%esp
	fstpl -24(%ebp)
L151:
	pushl -20(%ebp)
	pushl -24(%ebp)
	pushl -12(%ebp)
	pushl -16(%ebp)
	call ___adddf3
	addl $16,%esp
	fstpl -16(%ebp)
	testl %edi,%edi
	je L152
	pushl -12(%ebp)
	pushl -16(%ebp)
	call ___negdf2
	addl $-8,%esp
	fstpl (%esp)
	popl %eax
	popl %edx
	jmp L153
	.align 2
L152:
	movl -16(%ebp),%eax
	movl -12(%ebp),%edx
L153:
	pushl %edx
	pushl %eax
	fldl (%esp) 
	addl $8,%esp
	leal -36(%ebp),%esp
	popl %ebx
	popl %esi
	popl %edi
	leave
	ret
	.align 2
.globl ___builtin_saveregs
___builtin_saveregs:
	pushl %ebp
	movl %esp,%ebp
	call _abort
	leave
	ret
