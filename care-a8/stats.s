	.file	"stats.c"
	.text
	.p2align 4,,15
	.globl	compute_stats
	.type	compute_stats, @function
compute_stats:
.LFB27:
	.cfi_startproc
	movl	(%rdi), %r11d
	movq	8(%rsp), %rax
	testl	%esi, %esi
	movq	16(%rsp), %r10
	movl	%r11d, (%rdx)
	movl	(%rdi), %r11d
	movl	%r11d, (%rcx)
	movq	$0, (%r9)
	movl	$0, (%r8)
	movq	$0, (%r10)
	movq	$0, (%rax)
	jle	.L2
	cmpl	$1, %esi
	je	.L4
	leal	-2(%rsi), %r10d
	leaq	4(%rdi), %rax
	leaq	8(%rdi,%r10,4), %r11
	.p2align 4,,10
	.p2align 3
.L8:
	movl	(%rax), %r10d
	cmpl	(%rdx), %r10d
	jge	.L6
	movl	%r10d, (%rdx)
	movl	(%rax), %r10d
.L6:
	cmpl	%r10d, (%rcx)
	jge	.L7
	movl	%r10d, (%rcx)
.L7:
	addq	$4, %rax
	cmpq	%r11, %rax
	jne	.L8
.L4:
	leal	-1(%rsi), %ecx
	xorl	%eax, %eax
	jmp	.L15
	.p2align 4,,10
	.p2align 3
.L20:
	addl	$1, %eax
	movsd	%xmm0, (%r9)
	cmpl	%eax, %esi
	jle	.L19
.L15:
	movslq	%eax, %rdx
	cmpl	%ecx, %eax
	cvtsi2sd	(%rdi,%rdx,4), %xmm0
	addsd	(%r9), %xmm0
	jne	.L20
	cvtsi2sd	%esi, %xmm1
	xorl	%eax, %eax
	divsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movsd	%xmm0, (%r9)
	.p2align 4,,10
	.p2align 3
.L13:
	cvtsi2sd	(%rdi,%rax,4), %xmm0
	ucomisd	%xmm1, %xmm0
	jbe	.L11
	addl	$1, (%r8)
.L11:
	addq	$1, %rax
	cmpl	%eax, %esi
	jg	.L13
	movl	%esi, %eax
	addl	$1, %eax
	cmpl	%eax, %esi
	jg	.L15
.L19:
	rep ret
.L2:
	movsd	.LC1(%rip), %xmm2
	movsd	%xmm2, (%r9)
	movsd	%xmm2, (%r10)
	movsd	%xmm2, (%rax)
	ret
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
