	.file	"stats.c"
	.text
	.p2align 4,,15
	.globl	compute_stats
	.type	compute_stats, @function
compute_stats:
.LFB27:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	leal	-2(%rsi), %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	(%rdi), %eax
	cmpl	$1, %ebp
	movq	56(%rsp), %r12
	movq	64(%rsp), %r13
	movq	$0, (%r9)
	movl	$0, (%r8)
	movl	%eax, (%rdx)
	movl	%eax, (%rcx)
	movq	$0, 0(%r13)
	movq	$0, (%r12)
	jle	.L44
	leaq	4(%rdi), %r10
	movl	%eax, %ebx
	movl	$1, %r14d
	movq	%r10, %r11
	jmp	.L9
	.p2align 4,,10
	.p2align 3
.L45:
	movl	(%rdx), %ebx
.L9:
	movl	(%r11), %r15d
	cmpl	%ebx, %r15d
	jge	.L5
	movl	%r15d, (%rdx)
	movl	%r15d, %ebx
.L5:
	movl	4(%r11), %r15d
	cmpl	%ebx, %r15d
	jge	.L6
	movl	%r15d, (%rdx)
	movl	%r15d, %ebx
.L6:
	movl	8(%r11), %r15d
	cmpl	%ebx, %r15d
	jge	.L7
	movl	%r15d, (%rdx)
.L7:
	addl	$3, %r14d
	addq	$12, %r11
	cmpl	%ebp, %r14d
	jl	.L45
	movl	$1, %r11d
	jmp	.L13
	.p2align 4,,10
	.p2align 3
.L46:
	movl	(%rcx), %eax
.L13:
	movl	(%r10), %ebx
	cmpl	%eax, %ebx
	jle	.L10
	movl	%ebx, (%rcx)
	movl	%ebx, %eax
.L10:
	movl	4(%r10), %ebx
	cmpl	%eax, %ebx
	jle	.L11
	movl	%ebx, (%rcx)
	movl	%ebx, %eax
.L11:
	movl	8(%r10), %ebx
	cmpl	%eax, %ebx
	jle	.L12
	movl	%ebx, (%rcx)
.L12:
	addl	$3, %r11d
	addq	$12, %r10
	cmpl	%ebp, %r11d
	jl	.L46
.L3:
	xorpd	%xmm0, %xmm0
	leaq	-4(%rdi), %rax
	movl	$-1, %r10d
	.p2align 4,,10
	.p2align 3
.L17:
	cvtsi2sd	(%rax), %xmm1
	addsd	%xmm1, %xmm0
	cvtsi2sd	4(%rax), %xmm1
	addl	$3, %r10d
	addq	$12, %rax
	addsd	%xmm1, %xmm0
	cvtsi2sd	-4(%rax), %xmm1
	cmpl	%ebp, %r10d
	addsd	%xmm1, %xmm0
	jl	.L17
	movsd	%xmm0, (%r9)
.L4:
	testl	%esi, %esi
	jle	.L47
	cvtsi2sd	%esi, %xmm0
	testl	%ebp, %ebp
	movsd	(%r9), %xmm1
	divsd	%xmm0, %xmm1
	movsd	%xmm1, (%r9)
	js	.L19
	leaq	-4(%rdi), %rax
	movl	$-1, %r9d
	.p2align 4,,10
	.p2align 3
.L26:
	cvtsi2sd	(%rax), %xmm0
	ucomisd	%xmm1, %xmm0
	jbe	.L20
	addl	$1, (%r8)
.L20:
	cvtsi2sd	4(%rax), %xmm0
	ucomisd	%xmm1, %xmm0
	jbe	.L22
	addl	$1, (%r8)
.L22:
	cvtsi2sd	8(%rax), %xmm0
	ucomisd	%xmm1, %xmm0
	jbe	.L24
	addl	$1, (%r8)
.L24:
	addl	$3, %r9d
	addq	$12, %rax
	cmpl	%ebp, %r9d
	jl	.L26
.L19:
	leal	-1(%rsi), %r9d
	xorpd	%xmm2, %xmm2
	movl	%r9d, %r8d
	movslq	%r9d, %rax
	notq	%r8
	leaq	(%rdi,%rax,4), %rdi
	xorl	%eax, %eax
	salq	$2, %r8
	.p2align 4,,10
	.p2align 3
.L35:
	cvtsi2sd	(%rdi,%rax), %xmm0
	subsd	%xmm1, %xmm0
	subq	$4, %rax
	cmpq	%r8, %rax
	mulsd	%xmm0, %xmm0
	addsd	%xmm0, %xmm2
	jne	.L35
	cmpl	$1, %esi
	movsd	%xmm2, 0(%r13)
	je	.L48
	cvtsi2sd	%r9d, %xmm0
	xorl	%eax, %eax
	xorl	%r11d, %r11d
	movl	(%rdx), %r9d
	xorl	%r10d, %r10d
	divsd	%xmm0, %xmm2
	movsd	%xmm2, 0(%r13)
	jmp	.L33
	.p2align 4,,10
	.p2align 3
.L29:
	cmpl	(%rcx), %edx
	je	.L49
.L31:
	cvtsi2sd	%edx, %xmm0
	addsd	(%r12), %xmm0
	movsd	%xmm0, (%r12)
.L30:
	subq	$4, %rax
	cmpq	%r8, %rax
	je	.L50
.L33:
	movl	(%rdi,%rax), %edx
	cmpl	%r9d, %edx
	jne	.L29
	testl	%r10d, %r10d
	jne	.L29
	subq	$4, %rax
	movl	$1, %r10d
	cmpq	%r8, %rax
	jne	.L33
	.p2align 4,,10
	.p2align 3
.L50:
	cmpl	$2, %esi
	je	.L51
	cvtsi2sd	%ebp, %xmm1
	movsd	(%r12), %xmm0
	divsd	%xmm1, %xmm0
	movsd	%xmm0, (%r12)
	popq	%rbx
	.cfi_remember_state
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
	ret
	.p2align 4,,10
	.p2align 3
.L49:
	.cfi_restore_state
	testl	%r11d, %r11d
	jne	.L31
	movl	$1, %r11d
	jmp	.L30
	.p2align 4,,10
	.p2align 3
.L47:
	movsd	.LC1(%rip), %xmm3
	movsd	%xmm3, (%r9)
	movsd	%xmm3, 0(%r13)
	movsd	%xmm3, (%r12)
	popq	%rbx
	.cfi_remember_state
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
	ret
	.p2align 4,,10
	.p2align 3
.L48:
	.cfi_restore_state
	movsd	.LC1(%rip), %xmm6
	movsd	%xmm6, 0(%r13)
	movsd	%xmm6, (%r12)
	popq	%rbx
	.cfi_remember_state
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
	ret
	.p2align 4,,10
	.p2align 3
.L51:
	.cfi_restore_state
	movsd	.LC1(%rip), %xmm6
	movsd	%xmm6, (%r12)
	popq	%rbx
	.cfi_remember_state
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
	ret
.L44:
	.cfi_restore_state
	testl	%ebp, %ebp
	js	.L4
	jmp	.L3
	.cfi_endproc
.LFE27:
	.size	compute_stats, .-compute_stats
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	0
	.long	2146959360
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.3) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
