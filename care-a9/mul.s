	.file	"mul.c"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"Incompatible multiplication: %d x %d times a %d x %d\n"
	.text
	.p2align 4,,15
	.globl	mul
	.type	mul, @function
mul:
.LFB39:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	movl	%esi, %r13d
	pushq	%r12
	pushq	%rbx
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movl	%edx, %ebx
	subq	$24, %rsp
	cmpl	%r8d, %edx
	jne	.L21
	movq	%rdi, %r12
	movl	%r9d, %esi
	movl	%r13d, %edi
	movq	%rcx, %r14
	movl	%r9d, -52(%rbp)
	call	newMatrix
	testq	%rax, %rax
	je	.L3
	xorl	%r11d, %r11d
	subq	$16, %rsp
	salq	$2, %r11
	testl	%r13d, %r13d
	movq	%rsp, %rdi
	jle	.L3
	movl	-52(%rbp), %r9d
	shrq	$2, %r11
	movq	%rsp, %rcx
	salq	$2, %r11
	xorl	%r10d, %r10d
.L4:
	testl	%r9d, %r9d
	jle	.L8
	movq	(%r14,%r10,8), %r8
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L9:
	movl	(%r8,%rdx,4), %esi
	movl	%esi, (%rcx,%rdx,4)
	addq	$1, %rdx
	cmpl	%edx, %r9d
	jg	.L9
.L8:
	addq	$1, %r10
	addq	%r11, %rcx
	cmpl	%r10d, %r13d
	jg	.L4
	xorl	%r14d, %r14d
.L7:
	testl	%r9d, %r9d
	jle	.L11
	movq	(%rax,%r14,8), %r15
	xorl	%esi, %esi
	.p2align 4,,10
	.p2align 3
.L14:
	testl	%ebx, %ebx
	movslq	%esi, %rcx
	jle	.L15
	movq	(%r12,%r14,8), %rdx
	xorl	%r8d, %r8d
	xorl	%r11d, %r11d
	.p2align 4,,10
	.p2align 3
.L13:
	movl	(%rdx,%r8,4), %r10d
	addq	$1, %r8
	imull	(%rdi,%rcx,4), %r10d
	addl	%r10d, %r11d
	cmpl	%r8d, %ebx
	jg	.L13
	movl	%r11d, (%r15,%rsi,4)
	addq	$1, %rsi
	cmpl	%esi, %r9d
	jg	.L14
.L11:
	addq	$1, %r14
	cmpl	%r14d, %r13d
	jg	.L7
.L3:
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L15:
	.cfi_restore_state
	xorl	%r11d, %r11d
	movl	%r11d, (%r15,%rsi,4)
	addq	$1, %rsi
	cmpl	%esi, %r9d
	jg	.L14
	jmp	.L11
.L21:
	movl	%edx, %ecx
	movl	$1, %edi
	movl	%esi, %edx
	xorl	%eax, %eax
	movl	$.LC0, %esi
	call	__printf_chk
	movl	$-1, %edi
	call	exit
	.cfi_endproc
.LFE39:
	.size	mul, .-mul
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.3) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
