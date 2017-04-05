	.file	"main.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"The trace is %ld.\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB39:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	xorl	%edi, %edi
	xorl	%eax, %eax
	xorl	%r15d, %r15d
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	$1717986919, %r14d
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	call	time
	movl	%eax, %edi
	call	srand
	movl	$512, %esi
	movl	$512, %edi
	call	newMatrix
	movl	$512, %esi
	movl	$512, %edi
	movq	%rax, %r12
	call	newMatrix
	movq	%rax, %r13
	.p2align 4,,10
	.p2align 3
.L2:
	movq	(%r12,%r15,2), %rbp
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L5:
	call	rand
	movl	%eax, %ecx
	addq	%rbx, %rbp
	imull	%r14d
	movl	%ecx, %eax
	sarl	$31, %eax
	sarl	$2, %edx
	subl	%eax, %edx
	leal	(%rdx,%rdx,4), %eax
	addl	%eax, %eax
	subl	%eax, %ecx
	movq	0(%r13,%rbx,2), %rax
	subl	$5, %ecx
	movl	%ecx, 0(%rbp)
	movq	(%r12,%r15,2), %rbp
	movl	0(%rbp,%rbx), %edx
	addq	$4, %rbx
	cmpq	$2048, %rbx
	movl	%edx, (%rax,%r15)
	jne	.L5
	addq	$4, %r15
	cmpq	$2048, %r15
	jne	.L2
	movl	$10, %ebp
	xorl	%ebx, %ebx
.L9:
	movq	%r13, %rcx
	movl	$512, %r9d
	movl	$512, %r8d
	movl	$512, %edx
	movl	$512, %esi
	movq	%r12, %rdi
	call	mul
	xorl	%ecx, %ecx
	.p2align 4,,10
	.p2align 3
.L7:
	movq	(%rax,%rcx,2), %rdx
	movslq	(%rdx,%rcx), %rdx
	addq	$4, %rcx
	addq	%rdx, %rbx
	cmpq	$2048, %rcx
	jne	.L7
	movq	%rax, %rdi
	call	freeMatrix
	subl	$1, %ebp
	jne	.L9
	movq	%rbx, %rdx
	movl	$.LC0, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
	movq	%r12, %rdi
	call	freeMatrix
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	movq	%r13, %rdi
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	jmp	freeMatrix
	.cfi_endproc
.LFE39:
	.size	main, .-main
	.comm	total,8,8
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.3) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
