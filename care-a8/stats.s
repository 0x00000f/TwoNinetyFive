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
	movl	(%rdi), %eax
	testl	%esi, %esi
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
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	%eax, (%rdx)
	movq	56(%rsp), %r15
	movl	(%rdi), %eax
	movq	64(%rsp), %r14
	movl	%eax, (%rcx)
	movq	$0, (%r9)
	movl	$0, (%r8)
	movq	$0, (%r14)
	movq	$0, (%r15)
	jle	.L33
	cmpl	$1, %esi
	je	.L34
	cmpl	$2, %esi
	leaq	4(%rdi), %r10
	movl	$1, %r11d
	je	.L35
	.p2align 4,,10
	.p2align 3
.L27:
	movl	(%r10), %eax
	cmpl	(%rdx), %eax
	jge	.L6
	movl	%eax, (%rdx)
	movl	(%r10), %eax
.L6:
	cmpl	%eax, (%rcx)
	jge	.L7
	movl	%eax, (%rcx)
.L7:
	addl	$1, %r11d
	addq	$4, %r10
	cmpl	%r11d, %esi
	jg	.L27
	leal	-1(%rsi), %r10d
	leal	-2(%rsi), %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	xorl	%r11d, %r11d
	movq	%rdx, %r13
	.p2align 4,,10
	.p2align 3
.L22:
	cvtsi2sd	(%rdi,%rax,4), %xmm0
	addsd	(%r9), %xmm0
	cmpl	%eax, %r10d
	movsd	%xmm0, (%r9)
	je	.L36
.L10:
	addq	$1, %rax
	cmpl	%eax, %esi
	jg	.L22
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
.L33:
	.cfi_restore_state
	movsd	.LC1(%rip), %xmm3
	movsd	%xmm3, (%r9)
	movsd	%xmm3, (%r14)
	movsd	%xmm3, (%r15)
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
.L34:
	.cfi_restore_state
	movsd	.LC1(%rip), %xmm6
	movsd	%xmm6, (%r14)
	movsd	%xmm6, (%r15)
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
.L35:
	.cfi_restore_state
	movsd	.LC1(%rip), %xmm2
	movsd	%xmm2, (%r15)
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
.L36:
	.cfi_restore_state
	cvtsi2sd	%esi, %xmm1
	xorl	%r12d, %r12d
	movq	%rax, -16(%rsp)
	divsd	%xmm1, %xmm0
	movsd	%xmm0, (%r9)
	jmp	.L21
.L38:
	movsd	(%r9), %xmm0
.L21:
	cvtsi2sd	(%rdi,%r12,4), %xmm1
	ucomisd	%xmm0, %xmm1
	jbe	.L11
	addl	$1, (%r8)
.L11:
	cmpl	%r12d, %r10d
	je	.L37
.L13:
	addq	$1, %r12
	cmpl	%r12d, %esi
	jg	.L38
	movq	-16(%rsp), %rax
	jmp	.L10
.L37:
	cvtsi2sd	%ebp, %xmm1
	xorl	%eax, %eax
	movq	%r12, -8(%rsp)
.L20:
	cvtsi2sd	(%rdi,%rax,4), %xmm0
	subsd	(%r9), %xmm0
	cmpl	%eax, %r10d
	mulsd	%xmm0, %xmm0
	addsd	(%r14), %xmm0
	movsd	%xmm0, (%r14)
	je	.L28
	movsd	(%r15), %xmm0
.L14:
	divsd	%xmm1, %xmm0
	addq	$1, %rax
	cmpl	%eax, %esi
	movsd	%xmm0, (%r15)
	jg	.L20
	cvtsi2sd	%r10d, %xmm1
	movq	-8(%rsp), %r12
	movsd	(%r14), %xmm0
	divsd	%xmm1, %xmm0
	movsd	%xmm0, (%r14)
	jmp	.L13
.L28:
	movl	0(%r13), %edx
	movsd	(%r15), %xmm0
	movl	%edx, -20(%rsp)
	xorl	%edx, %edx
.L18:
	movl	(%rdi,%rdx,4), %r12d
	cmpl	-20(%rsp), %r12d
	je	.L39
.L15:
	cmpl	(%rcx), %r12d
	je	.L40
.L17:
	cvtsi2sd	%r12d, %xmm2
	addsd	%xmm2, %xmm0
	movsd	%xmm0, (%r15)
.L16:
	addq	$1, %rdx
	cmpl	%edx, %esi
	jg	.L18
	jmp	.L14
.L40:
	testl	%ebx, %ebx
	jne	.L17
	movl	$1, %ebx
	.p2align 4,,4
	jmp	.L16
.L39:
	testl	%r11d, %r11d
	jne	.L15
	movl	$1, %r11d
	jmp	.L16
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
