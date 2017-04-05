	.file	"matrix.c"
	.text
	.p2align 4,,15
	.globl	newMatrix
	.type	newMatrix, @function
newMatrix:
.LFB39:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movl	%esi, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movl	%edi, %ebx
	movslq	%edi, %rdi
	salq	$3, %rdi
	call	malloc
	testq	%rax, %rax
	movq	%rax, %rbp
	je	.L6
	movl	%ebx, %edi
	imull	%r12d, %edi
	movslq	%edi, %rdi
	salq	$2, %rdi
	call	malloc
	testq	%rax, %rax
	je	.L3
	testl	%ebx, %ebx
	jle	.L7
	movslq	%r12d, %rsi
	movq	%rax, %rcx
	xorl	%edx, %edx
	salq	$2, %rsi
	.p2align 4,,10
	.p2align 3
.L5:
	movq	%rcx, 0(%rbp,%rdx,8)
	addq	$1, %rdx
	addq	%rsi, %rcx
	cmpl	%edx, %ebx
	jg	.L5
.L7:
	movq	%rbp, %rax
.L2:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L6:
	.cfi_restore_state
	xorl	%eax, %eax
	jmp	.L2
.L3:
	movq	%rbp, %rdi
	call	free
	xorl	%eax, %eax
	jmp	.L2
	.cfi_endproc
.LFE39:
	.size	newMatrix, .-newMatrix
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	" %3d"
	.text
	.p2align 4,,15
	.globl	printMatrix
	.type	printMatrix, @function
printMatrix:
.LFB40:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	testl	%esi, %esi
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	jle	.L11
	leal	-1(%rsi), %eax
	movl	%edx, %r12d
	movq	%rdi, %r14
	leaq	8(%rdi,%rax,8), %r13
	leal	-1(%rdx), %eax
	leaq	4(,%rax,4), %rbp
	.p2align 4,,10
	.p2align 3
.L12:
	testl	%r12d, %r12d
	jle	.L14
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L15:
	movq	(%r14), %rax
	movl	$.LC0, %esi
	movl	$1, %edi
	movl	(%rax,%rbx), %edx
	xorl	%eax, %eax
	addq	$4, %rbx
	call	__printf_chk
	cmpq	%rbp, %rbx
	jne	.L15
.L14:
	movq	stdout(%rip), %rsi
	movl	$10, %edi
	addq	$8, %r14
	call	_IO_putc
	cmpq	%r13, %r14
	jne	.L12
.L11:
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	movq	stdout(%rip), %rsi
	movl	$10, %edi
	jmp	_IO_putc
	.cfi_endproc
.LFE40:
	.size	printMatrix, .-printMatrix
	.p2align 4,,15
	.globl	freeMatrix
	.type	freeMatrix, @function
freeMatrix:
.LFB41:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	movq	(%rdi), %rdi
	call	free
	movq	%rbx, %rdi
	popq	%rbx
	.cfi_def_cfa_offset 8
	jmp	free
	.cfi_endproc
.LFE41:
	.size	freeMatrix, .-freeMatrix
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.3) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
