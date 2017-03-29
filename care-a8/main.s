	.file	"main.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%s %d"
.LC1:
	.string	"N: %d\n"
.LC2:
	.string	"Min: %d\n"
.LC3:
	.string	"Max: %d\n"
.LC4:
	.string	"Average: %lf\n"
.LC5:
	.string	"Number over average: %d\n"
.LC6:
	.string	"Truncated average: %lf\n"
.LC7:
	.string	"Variance: %lf\n"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC8:
	.string	"Sample %d completed in %d cycles.\n"
	.section	.rodata.str1.1
.LC9:
	.string	"Average of %ld cycles.\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB48:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movl	$grades, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movl	$names, %ebx
	subq	$24, %rsp
	.cfi_def_cfa_offset 48
	.p2align 4,,10
	.p2align 3
.L3:
	movq	stdin(%rip), %rdx
	movl	$1024, %esi
	movl	$buf, %edi
	call	fgets
	movq	%rbp, %rcx
	movq	%rax, nul(%rip)
	movq	%rbx, %rdx
	xorl	%eax, %eax
	movl	$.LC0, %esi
	movl	$buf, %edi
	addq	$20, %rbx
	addq	$4, %rbp
	call	__isoc99_sscanf
	cmpq	$names+1600, %rbx
	jne	.L3
	xorl	%ebp, %ebp
	.p2align 4,,10
	.p2align 3
.L6:
#APP
# 40 "main.c" 1
	cpuid
	rdtscp
	movl %eax, %esi
	
# 0 "" 2
#NO_APP
	movl	$avg, %r9d
	movl	%esi, start_time(%rip)
	movq	$var, 8(%rsp)
	movq	$trunc_avg, (%rsp)
	movl	$num_over_avg, %r8d
	movl	$max, %ecx
	movl	$min, %edx
	movl	$80, %esi
	movl	$grades, %edi
	call	compute_stats
#APP
# 51 "main.c" 1
	cpuid
	rdtscp
	movl %eax, %esi
	
# 0 "" 2
#NO_APP
	movl	%esi, end_time(%rip)
	subl	start_time(%rip), %esi
	movslq	%ebp, %rax
	movl	%esi, cycles(,%rax,4)
	xorl	%eax, %eax
	cmpl	$20000, %esi
	setge	%al
	subl	%eax, %ebp
	addl	$1, %ebp
	cmpl	$19, %ebp
	jle	.L6
	movl	$80, %edx
	movl	$.LC1, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	movl	$cycles+4, %ebp
	movl	$1, %ebx
	call	__printf_chk
	movl	min(%rip), %edx
	movl	$.LC2, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
	movl	max(%rip), %edx
	movl	$.LC3, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
	movsd	avg(%rip), %xmm0
	movl	$.LC4, %esi
	movl	$1, %edi
	movl	$1, %eax
	call	__printf_chk
	movl	num_over_avg(%rip), %edx
	movl	$.LC5, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
	movsd	trunc_avg(%rip), %xmm0
	movl	$.LC6, %esi
	movl	$1, %edi
	movl	$1, %eax
	call	__printf_chk
	movsd	var(%rip), %xmm0
	movl	$.LC7, %esi
	movl	$1, %edi
	movl	$1, %eax
	call	__printf_chk
	movq	stdout(%rip), %rsi
	movl	$10, %edi
	call	_IO_putc
	movl	cycles(%rip), %ecx
	movl	$1, %edx
	movl	$.LC8, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	movq	$0, total(%rip)
	call	__printf_chk
	.p2align 4,,10
	.p2align 3
.L7:
	movl	0(%rbp), %ecx
	addl	$1, %ebx
	xorl	%eax, %eax
	movl	%ebx, %edx
	movl	$.LC8, %esi
	movl	$1, %edi
	call	__printf_chk
	leal	-1(%rbx), %eax
	cmpl	$9, %eax
	jle	.L8
	movslq	0(%rbp), %rax
	addq	%rax, total(%rip)
.L8:
	addq	$4, %rbp
	cmpl	$20, %ebx
	jne	.L7
	movq	total(%rip), %rcx
	movabsq	$7378697629483820647, %rdx
	addq	$24, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	movq	%rcx, %rax
	sarq	$63, %rcx
	movl	$.LC9, %esi
	imulq	%rdx
	movl	$1, %edi
	xorl	%eax, %eax
	sarq	$2, %rdx
	subq	%rcx, %rdx
	jmp	__printf_chk
	.cfi_endproc
.LFE48:
	.size	main, .-main
	.comm	nul,8,8
	.globl	end_time
	.data
	.align 4
	.type	end_time, @object
	.size	end_time, 4
end_time:
	.long	125
	.globl	start_time
	.align 4
	.type	start_time, @object
	.size	start_time, 4
start_time:
	.long	150
	.comm	total,8,8
	.comm	cycles,80,32
	.comm	var,8,8
	.comm	trunc_avg,8,8
	.comm	avg,8,8
	.comm	num_over_avg,4,4
	.comm	max,4,4
	.comm	min,4,4
	.comm	grades,320,32
	.comm	names,1600,32
	.comm	buf,1024,32
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.3) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
