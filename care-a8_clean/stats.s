	.file	"stats.c"
	.text
	.p2align 4,,15
	.globl	compute_stats
	.type	compute_stats, @function
compute_stats:
.LFB27:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	cmpl	$1, %esi
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movl	(%rdi), %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movl	%r12d, (%rdx)
	movq	40(%rsp), %rbx
	movq	48(%rsp), %rbp
	jle	.L2
	leal	-2(%rsi), %r10d
	leaq	4(%rdi), %rax
	leaq	8(%rdi,%r10,4), %r13
	movq	%rax, %r10
	jmp	.L5
	.p2align 4,,10
	.p2align 3
.L33:
	movl	(%rdx), %r12d
.L5:
	movl	(%r10), %r11d
	cmpl	%r12d, %r11d
	jge	.L3
	movl	%r11d, (%rdx)
.L3:
	addq	$4, %r10
	cmpq	%r13, %r10
	jne	.L33
	movl	(%rdi), %r11d
	movl	%r11d, (%rcx)
	jmp	.L23
	.p2align 4,,10
	.p2align 3
.L7:
	movl	(%rcx), %r11d
.L23:
	movl	(%rax), %r10d
	cmpl	%r11d, %r10d
	jle	.L6
	movl	%r10d, (%rcx)
.L6:
	addq	$4, %rax
	cmpq	%r13, %rax
	jne	.L7
.L24:
	xorpd	%xmm1, %xmm1
	xorl	%eax, %eax
	movapd	%xmm1, %xmm0
	.p2align 4,,10
	.p2align 3
.L9:
	cvtsi2sd	(%rdi,%rax,4), %xmm2
	addq	$1, %rax
	addsd	%xmm2, %xmm0
	cmpl	%eax, %esi
	jg	.L9
	cvtsi2sd	%esi, %xmm2
	xorl	%eax, %eax
	divsd	%xmm2, %xmm0
	movsd	%xmm0, (%r9)
	movl	$0, (%r8)
	.p2align 4,,10
	.p2align 3
.L26:
	cvtsi2sd	(%rdi,%rax,4), %xmm2
	ucomisd	%xmm0, %xmm2
	jbe	.L10
	addl	$1, (%r8)
.L10:
	addq	$1, %rax
	cmpl	%eax, %esi
	jg	.L26
	movq	$0, 0(%rbp)
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L14:
	cvtsi2sd	(%rdi,%rax,4), %xmm0
	subsd	(%r9), %xmm0
	addq	$1, %rax
	cmpl	%eax, %esi
	mulsd	%xmm0, %xmm0
	addsd	%xmm0, %xmm1
	movsd	%xmm1, 0(%rbp)
	jg	.L14
	cmpl	$1, %esi
	je	.L34
	leal	-1(%rsi), %eax
	movl	(%rdx), %r8d
	xorl	%r10d, %r10d
	xorl	%r9d, %r9d
	cvtsi2sd	%eax, %xmm0
	xorl	%eax, %eax
	divsd	%xmm0, %xmm1
	movsd	%xmm1, 0(%rbp)
	movq	$0, (%rbx)
	jmp	.L21
	.p2align 4,,10
	.p2align 3
.L17:
	cmpl	(%rcx), %edx
	je	.L35
.L19:
	cvtsi2sd	%edx, %xmm0
	addsd	(%rbx), %xmm0
	movsd	%xmm0, (%rbx)
.L18:
	addq	$1, %rax
	cmpl	%eax, %esi
	jle	.L36
.L21:
	movl	(%rdi,%rax,4), %edx
	cmpl	%r8d, %edx
	jne	.L17
	testl	%r9d, %r9d
	jne	.L17
	addq	$1, %rax
	movl	$1, %r9d
	cmpl	%eax, %esi
	jg	.L21
	.p2align 4,,10
	.p2align 3
.L36:
	cmpl	$2, %esi
	je	.L37
	subl	$2, %esi
	movsd	(%rbx), %xmm0
	cvtsi2sd	%esi, %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, (%rbx)
.L1:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L35:
	.cfi_restore_state
	testl	%r10d, %r10d
	jne	.L19
	movl	$1, %r10d
	jmp	.L18
	.p2align 4,,10
	.p2align 3
.L34:
	movsd	.LC1(%rip), %xmm3
	movsd	%xmm3, 0(%rbp)
	movsd	%xmm3, (%rbx)
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L37:
	.cfi_restore_state
	movsd	.LC1(%rip), %xmm5
	movsd	%xmm5, (%rbx)
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
.L2:
	.cfi_restore_state
	movl	(%rdi), %eax
	testl	%esi, %esi
	movl	%eax, (%rcx)
	movq	$0, (%r9)
	jg	.L24
	movsd	.LC1(%rip), %xmm6
	movl	$0, (%r8)
	movsd	%xmm6, (%r9)
	movsd	%xmm6, 0(%rbp)
	movsd	%xmm6, (%rbx)
	jmp	.L1
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
