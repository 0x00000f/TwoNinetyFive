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
	testl	%esi, %esi
	movl	$0, (%r8)
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
	movl	(%rdi), %ebx
	movq	56(%rsp), %r15
	movq	64(%rsp), %r14
	movq	$0, (%r9)
	movl	%ebx, (%rdx)
	movl	%ebx, (%rcx)
	movq	$0, (%r14)
	movq	$0, (%r15)
	jle	.L32
	cmpl	$1, %esi
	je	.L33
	cmpl	$2, %esi
	je	.L34
	leaq	4(%rdi), %r11
	movl	%ebx, %ebp
	movl	$1, %r10d
	jmp	.L9
	.p2align 4,,10
	.p2align 3
.L35:
	movl	(%rdx), %ebp
	movl	(%rcx), %ebx
.L9:
	movl	(%r11), %eax
	cmpl	%ebp, %eax
	jge	.L6
	movl	%eax, (%rdx)
.L6:
	cmpl	%ebx, %eax
	jle	.L7
	movl	%eax, (%rcx)
.L7:
	addl	$1, %r10d
	addq	$4, %r11
	cmpl	%r10d, %esi
	jg	.L35
	leal	-1(%rsi), %r10d
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	xorpd	%xmm1, %xmm1
	xorl	%r11d, %r11d
	leal	-2(%rsi), %ebp
	movq	%rdx, %r13
	jmp	.L23
	.p2align 4,,10
	.p2align 3
.L37:
	movapd	%xmm0, %xmm1
.L23:
	cmpl	%eax, %r10d
	cvtsi2sd	(%rdi,%rax,4), %xmm0
	addsd	%xmm1, %xmm0
	je	.L36
.L10:
	addq	$1, %rax
	cmpl	%eax, %esi
	jg	.L37
	movsd	%xmm0, (%r9)
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
.L32:
	.cfi_restore_state
	movsd	.LC1(%rip), %xmm5
	movsd	%xmm5, (%r9)
	movsd	%xmm5, (%r14)
	movsd	%xmm5, (%r15)
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
	movsd	.LC1(%rip), %xmm4
	movsd	%xmm4, (%r14)
	movsd	%xmm4, (%r15)
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
	movq	%r9, -8(%rsp)
	divsd	%xmm1, %xmm0
.L21:
	cvtsi2sd	(%rdi,%r12,4), %xmm1
	ucomisd	%xmm0, %xmm1
	jbe	.L11
	addl	$1, (%r8)
.L11:
	cmpl	%r12d, %r10d
	je	.L38
.L13:
	addq	$1, %r12
	cmpl	%r12d, %esi
	jg	.L21
	movq	-16(%rsp), %rax
	movq	-8(%rsp), %r9
	jmp	.L10
.L38:
	cvtsi2sd	%ebp, %xmm4
	xorl	%eax, %eax
	movsd	(%r14), %xmm3
	movsd	(%r15), %xmm2
.L20:
	cvtsi2sd	(%rdi,%rax,4), %xmm1
	subsd	%xmm0, %xmm1
	cmpl	%eax, %r10d
	mulsd	%xmm1, %xmm1
	addsd	%xmm3, %xmm1
	je	.L39
.L14:
	divsd	%xmm4, %xmm2
	addq	$1, %rax
	cmpl	%eax, %esi
	movsd	%xmm2, (%r15)
	jle	.L19
	movapd	%xmm1, %xmm3
	jmp	.L20
.L39:
	movl	0(%r13), %edx
	movl	%edx, -20(%rsp)
	xorl	%edx, %edx
.L18:
	movl	(%rdi,%rdx,4), %r9d
	cmpl	-20(%rsp), %r9d
	je	.L40
.L15:
	cmpl	(%rcx), %r9d
	je	.L41
.L17:
	cvtsi2sd	%r9d, %xmm3
	addsd	%xmm3, %xmm2
	movsd	%xmm2, (%r15)
.L16:
	addq	$1, %rdx
	cmpl	%edx, %esi
	jg	.L18
	jmp	.L14
.L19:
	cvtsi2sd	%r10d, %xmm2
	divsd	%xmm2, %xmm1
	movsd	%xmm1, (%r14)
	jmp	.L13
.L41:
	testl	%ebx, %ebx
	jne	.L17
	movl	$1, %ebx
	jmp	.L16
.L40:
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
