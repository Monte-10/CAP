	.file	"greyScale.c"
	.text
	.p2align 4
	.type	resample_row_1, @function
resample_row_1:
.LFB664:
	.cfi_startproc
	endbr64
	movq	%rsi, %rax
	ret
	.cfi_endproc
.LFE664:
	.size	resample_row_1, .-resample_row_1
	.p2align 4
	.type	stbi__resample_row_v_2, @function
stbi__resample_row_v_2:
.LFB665:
	.cfi_startproc
	endbr64
	movq	%rdi, %r8
	testl	%ecx, %ecx
	jle	.L4
	leaq	1(%rsi), %r10
	subq	%r10, %rdi
	cmpq	$30, %rdi
	leaq	1(%rdx), %r11
	movq	%r8, %rdi
	seta	%r10b
	subq	%r11, %rdi
	cmpq	$30, %rdi
	seta	%dil
	movl	%ecx, %r9d
	leal	-1(%rcx), %eax
	testb	%dil, %r10b
	je	.L5
	cmpl	$14, %eax
	jbe	.L5
	cmpl	$30, %eax
	jbe	.L13
	movl	%ecx, %edi
	shrl	$5, %edi
	vmovdqa	.LC1(%rip), %ymm3
	vmovdqa	.LC2(%rip), %ymm2
	vmovdqa	.LC0(%rip), %xmm4
	salq	$5, %rdi
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L7:
	vmovdqu	(%rsi,%rax), %ymm1
	vpmovzxbw	%xmm4, %ymm7
	vpmovzxbw	%xmm1, %ymm0
	vextracti128	$0x1, %ymm1, %xmm1
	vpmovzxbw	%xmm1, %ymm1
	vpmullw	%ymm7, %ymm0, %ymm0
	vpmullw	%ymm7, %ymm1, %ymm1
	vmovdqu	(%rdx,%rax), %ymm5
	vpmovzxbw	%xmm5, %ymm6
	vextracti128	$0x1, %ymm5, %xmm5
	vpmovzxbw	%xmm5, %ymm5
	vpaddw	%ymm6, %ymm0, %ymm0
	vpaddw	%ymm5, %ymm1, %ymm1
	vpaddw	%ymm3, %ymm0, %ymm0
	vpaddw	%ymm3, %ymm1, %ymm1
	vpsrlw	$2, %ymm0, %ymm0
	vpsrlw	$2, %ymm1, %ymm1
	vpand	%ymm0, %ymm2, %ymm0
	vpand	%ymm1, %ymm2, %ymm1
	vpackuswb	%ymm1, %ymm0, %ymm0
	vpermq	$216, %ymm0, %ymm0
	vmovdqu	%ymm0, (%r8,%rax)
	addq	$32, %rax
	cmpq	%rdi, %rax
	jne	.L7
	movl	%ecx, %edi
	andl	$-32, %edi
	movl	%edi, %eax
	cmpl	%edi, %ecx
	je	.L22
	movl	%ecx, %r9d
	subl	%edi, %r9d
	leal	-1(%r9), %r10d
	cmpl	$14, %r10d
	jbe	.L24
	vzeroupper
.L6:
	vmovdqu	(%rsi,%rdi), %xmm0
	vmovdqa	.LC3(%rip), %xmm3
	vpmovzxbw	%xmm0, %xmm1
	vpmovzxbw	%xmm3, %xmm4
	vpsrldq	$8, %xmm0, %xmm0
	vpsrldq	$8, %xmm3, %xmm3
	vpmullw	%xmm4, %xmm1, %xmm1
	vpmovzxbw	%xmm0, %xmm0
	vpmovzxbw	%xmm3, %xmm3
	vpmullw	%xmm3, %xmm0, %xmm0
	vmovdqu	(%rdx,%rdi), %xmm2
	vpmovzxbw	%xmm2, %xmm4
	vpsrldq	$8, %xmm2, %xmm2
	vpaddw	%xmm4, %xmm1, %xmm1
	vpmovzxbw	%xmm2, %xmm2
	vmovdqa	.LC4(%rip), %xmm4
	vpaddw	%xmm2, %xmm0, %xmm0
	vpaddw	%xmm4, %xmm1, %xmm1
	vmovdqa	.LC5(%rip), %xmm2
	vpaddw	%xmm4, %xmm0, %xmm0
	vpsrlw	$2, %xmm0, %xmm0
	vpsrlw	$2, %xmm1, %xmm1
	vpand	%xmm1, %xmm2, %xmm1
	vpand	%xmm0, %xmm2, %xmm2
	vpackuswb	%xmm2, %xmm1, %xmm0
	vmovdqu	%xmm0, (%r8,%rdi)
	movl	%r9d, %edi
	andl	$-16, %edi
	addl	%edi, %eax
	cmpl	%edi, %r9d
	je	.L4
.L9:
	movslq	%eax, %rdi
	movzbl	(%rsi,%rdi), %r9d
	leal	(%r9,%r9,2), %r10d
	movzbl	(%rdx,%rdi), %r9d
	leal	2(%r10,%r9), %r9d
	sarl	$2, %r9d
	movb	%r9b, (%r8,%rdi)
	leal	1(%rax), %edi
	cmpl	%edi, %ecx
	jle	.L4
	movslq	%edi, %rdi
	movzbl	(%rsi,%rdi), %r9d
	leal	(%r9,%r9,2), %r10d
	movzbl	(%rdx,%rdi), %r9d
	leal	2(%r10,%r9), %r9d
	sarl	$2, %r9d
	movb	%r9b, (%r8,%rdi)
	leal	2(%rax), %edi
	cmpl	%edi, %ecx
	jle	.L4
	movslq	%edi, %rdi
	movzbl	(%rsi,%rdi), %r9d
	leal	(%r9,%r9,2), %r10d
	movzbl	(%rdx,%rdi), %r9d
	leal	2(%r10,%r9), %r9d
	sarl	$2, %r9d
	movb	%r9b, (%r8,%rdi)
	leal	3(%rax), %edi
	cmpl	%edi, %ecx
	jle	.L4
	movslq	%edi, %rdi
	movzbl	(%rsi,%rdi), %r9d
	leal	(%r9,%r9,2), %r10d
	movzbl	(%rdx,%rdi), %r9d
	leal	2(%r10,%r9), %r9d
	sarl	$2, %r9d
	movb	%r9b, (%r8,%rdi)
	leal	4(%rax), %edi
	cmpl	%edi, %ecx
	jle	.L4
	movslq	%edi, %rdi
	movzbl	(%rsi,%rdi), %r9d
	leal	(%r9,%r9,2), %r10d
	movzbl	(%rdx,%rdi), %r9d
	leal	2(%r10,%r9), %r9d
	sarl	$2, %r9d
	movb	%r9b, (%r8,%rdi)
	leal	5(%rax), %edi
	cmpl	%edi, %ecx
	jle	.L4
	movslq	%edi, %rdi
	movzbl	(%rsi,%rdi), %r9d
	leal	(%r9,%r9,2), %r10d
	movzbl	(%rdx,%rdi), %r9d
	leal	2(%r10,%r9), %r9d
	sarl	$2, %r9d
	movb	%r9b, (%r8,%rdi)
	leal	6(%rax), %edi
	cmpl	%edi, %ecx
	jle	.L4
	movslq	%edi, %rdi
	movzbl	(%rsi,%rdi), %r9d
	leal	(%r9,%r9,2), %r10d
	movzbl	(%rdx,%rdi), %r9d
	leal	2(%r10,%r9), %r9d
	sarl	$2, %r9d
	movb	%r9b, (%r8,%rdi)
	leal	7(%rax), %edi
	cmpl	%edi, %ecx
	jle	.L4
	movslq	%edi, %rdi
	movzbl	(%rsi,%rdi), %r9d
	leal	(%r9,%r9,2), %r10d
	movzbl	(%rdx,%rdi), %r9d
	leal	2(%r10,%r9), %r9d
	sarl	$2, %r9d
	movb	%r9b, (%r8,%rdi)
	leal	8(%rax), %edi
	cmpl	%edi, %ecx
	jle	.L4
	movslq	%edi, %rdi
	movzbl	(%rsi,%rdi), %r9d
	leal	(%r9,%r9,2), %r10d
	movzbl	(%rdx,%rdi), %r9d
	leal	2(%r10,%r9), %r9d
	sarl	$2, %r9d
	movb	%r9b, (%r8,%rdi)
	leal	9(%rax), %edi
	cmpl	%edi, %ecx
	jle	.L4
	movslq	%edi, %rdi
	movzbl	(%rsi,%rdi), %r9d
	leal	(%r9,%r9,2), %r10d
	movzbl	(%rdx,%rdi), %r9d
	leal	2(%r10,%r9), %r9d
	sarl	$2, %r9d
	movb	%r9b, (%r8,%rdi)
	leal	10(%rax), %edi
	cmpl	%edi, %ecx
	jle	.L4
	movslq	%edi, %rdi
	movzbl	(%rsi,%rdi), %r9d
	leal	(%r9,%r9,2), %r10d
	movzbl	(%rdx,%rdi), %r9d
	leal	2(%r10,%r9), %r9d
	sarl	$2, %r9d
	movb	%r9b, (%r8,%rdi)
	leal	11(%rax), %edi
	cmpl	%edi, %ecx
	jle	.L4
	movslq	%edi, %rdi
	movzbl	(%rsi,%rdi), %r9d
	leal	(%r9,%r9,2), %r10d
	movzbl	(%rdx,%rdi), %r9d
	leal	2(%r10,%r9), %r9d
	sarl	$2, %r9d
	movb	%r9b, (%r8,%rdi)
	leal	12(%rax), %edi
	cmpl	%edi, %ecx
	jle	.L4
	movslq	%edi, %rdi
	movzbl	(%rsi,%rdi), %r9d
	leal	(%r9,%r9,2), %r10d
	movzbl	(%rdx,%rdi), %r9d
	leal	2(%r10,%r9), %r9d
	sarl	$2, %r9d
	movb	%r9b, (%r8,%rdi)
	leal	13(%rax), %edi
	cmpl	%edi, %ecx
	jle	.L4
	movslq	%edi, %rdi
	movzbl	(%rsi,%rdi), %r9d
	addl	$14, %eax
	leal	(%r9,%r9,2), %r10d
	movzbl	(%rdx,%rdi), %r9d
	leal	2(%r10,%r9), %r9d
	sarl	$2, %r9d
	movb	%r9b, (%r8,%rdi)
	cmpl	%eax, %ecx
	jle	.L4
	cltq
	movzbl	(%rsi,%rax), %ecx
	movzbl	(%rdx,%rax), %edx
	leal	(%rcx,%rcx,2), %ecx
	leal	2(%rcx,%rdx), %edx
	sarl	$2, %edx
	movb	%dl, (%r8,%rax)
.L4:
	movq	%r8, %rax
	ret
	.p2align 4,,10
	.p2align 3
.L5:
	movl	%ecx, %ecx
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L11:
	movzbl	(%rsi,%rax), %edi
	leal	(%rdi,%rdi,2), %r9d
	movzbl	(%rdx,%rax), %edi
	leal	2(%r9,%rdi), %edi
	sarl	$2, %edi
	movb	%dil, (%r8,%rax)
	incq	%rax
	cmpq	%rcx, %rax
	jne	.L11
	movq	%r8, %rax
	ret
.L13:
	xorl	%edi, %edi
	xorl	%eax, %eax
	jmp	.L6
.L24:
	vzeroupper
	jmp	.L9
.L22:
	vzeroupper
	jmp	.L4
	.cfi_endproc
.LFE665:
	.size	stbi__resample_row_v_2, .-stbi__resample_row_v_2
	.p2align 4
	.type	stbi__resample_row_generic, @function
stbi__resample_row_generic:
.LFB669:
	.cfi_startproc
	endbr64
	movq	%rdi, %r9
	testl	%ecx, %ecx
	jle	.L50
	testl	%r8d, %r8d
	jle	.L50
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	leal	-1(%rcx), %eax
	leaq	1(%rsi,%rax), %rax
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	movl	%r8d, %edx
	.cfi_offset 15, -24
	leal	-1(%r8), %r15d
	pushq	%r14
	.cfi_offset 14, -32
	movl	%r8d, %r14d
	andl	$-32, %r14d
	pushq	%r13
	xorl	%ecx, %ecx
	pushq	%r12
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	movslq	%r8d, %r12
	pushq	%rbx
	.cfi_offset 3, -56
	xorl	%ebx, %ebx
	andq	$-32, %rsp
	movq	%rax, -8(%rsp)
	movl	%r8d, %eax
	shrl	$5, %eax
	decl	%eax
	incq	%rax
	salq	$5, %rax
	movq	%rax, -16(%rsp)
	movl	%r8d, %eax
	andl	$31, %eax
	movl	%eax, -20(%rsp)
	decl	%eax
	movq	%rdx, -32(%rsp)
	movl	%eax, -24(%rsp)
	.p2align 4,,10
	.p2align 3
.L28:
	movq	%rsi, %rdx
	leaq	(%r12,%rdi), %rax
	incq	%rsi
	cmpq	%rax, %rdx
	setnb	%r10b
	cmpq	%rsi, %rdi
	setnb	%al
	orb	%r10b, %al
	je	.L40
	cmpl	$14, %r15d
	jbe	.L40
	cmpl	$30, %r15d
	jbe	.L38
	movq	-16(%rsp), %rax
	vpbroadcastb	(%rdx), %ymm0
	leaq	(%rax,%rdi), %r10
	movq	%rdi, %rax
	.p2align 4,,10
	.p2align 3
.L30:
	vmovdqu	%ymm0, (%rax)
	addq	$32, %rax
	cmpq	%rax, %r10
	jne	.L30
	cmpl	%r8d, %r14d
	je	.L35
	cmpl	$14, -24(%rsp)
	movl	-20(%rsp), %r11d
	jbe	.L39
	movl	%r14d, %r10d
	movl	%r14d, %eax
.L29:
	vpbroadcastb	(%rdx), %xmm0
	leaq	(%r9,%rbx), %r13
	vmovdqu	%xmm0, 0(%r13,%r10)
	movl	%r11d, %r10d
	andl	$-16, %r10d
	addl	%r10d, %eax
	cmpl	%r11d, %r10d
	je	.L35
.L32:
	movzbl	(%rdx), %r11d
	leal	(%rcx,%rax), %r10d
	movslq	%r10d, %r10
	movb	%r11b, (%r9,%r10)
	leal	1(%rax), %r10d
	cmpl	%r10d, %r8d
	jle	.L35
	addl	%ecx, %r10d
	movslq	%r10d, %r10
	movb	%r11b, (%r9,%r10)
	leal	2(%rax), %r10d
	cmpl	%r10d, %r8d
	jle	.L35
	movzbl	(%rdx), %r11d
	addl	%ecx, %r10d
	movslq	%r10d, %r10
	movb	%r11b, (%r9,%r10)
	leal	3(%rax), %r10d
	cmpl	%r10d, %r8d
	jle	.L35
	addl	%ecx, %r10d
	movslq	%r10d, %r10
	movb	%r11b, (%r9,%r10)
	leal	4(%rax), %r10d
	cmpl	%r10d, %r8d
	jle	.L35
	movzbl	(%rdx), %r11d
	addl	%ecx, %r10d
	movslq	%r10d, %r10
	movb	%r11b, (%r9,%r10)
	leal	5(%rax), %r10d
	cmpl	%r10d, %r8d
	jle	.L35
	addl	%ecx, %r10d
	movslq	%r10d, %r10
	movb	%r11b, (%r9,%r10)
	leal	6(%rax), %r10d
	cmpl	%r10d, %r8d
	jle	.L35
	movzbl	(%rdx), %r11d
	addl	%ecx, %r10d
	movslq	%r10d, %r10
	movb	%r11b, (%r9,%r10)
	leal	7(%rax), %r10d
	cmpl	%r10d, %r8d
	jle	.L35
	addl	%ecx, %r10d
	movslq	%r10d, %r10
	movb	%r11b, (%r9,%r10)
	leal	8(%rax), %r10d
	cmpl	%r10d, %r8d
	jle	.L35
	movzbl	(%rdx), %r11d
	addl	%ecx, %r10d
	movslq	%r10d, %r10
	movb	%r11b, (%r9,%r10)
	leal	9(%rax), %r10d
	cmpl	%r10d, %r8d
	jle	.L35
	addl	%ecx, %r10d
	movslq	%r10d, %r10
	movb	%r11b, (%r9,%r10)
	leal	10(%rax), %r10d
	cmpl	%r10d, %r8d
	jle	.L35
	movzbl	(%rdx), %r11d
	addl	%ecx, %r10d
	movslq	%r10d, %r10
	movb	%r11b, (%r9,%r10)
	leal	11(%rax), %r10d
	cmpl	%r10d, %r8d
	jle	.L35
	addl	%ecx, %r10d
	movslq	%r10d, %r10
	movb	%r11b, (%r9,%r10)
	leal	12(%rax), %r10d
	cmpl	%r10d, %r8d
	jle	.L35
	movzbl	(%rdx), %r11d
	addl	%ecx, %r10d
	movslq	%r10d, %r10
	movb	%r11b, (%r9,%r10)
	leal	13(%rax), %r10d
	cmpl	%r10d, %r8d
	jle	.L35
	addl	%ecx, %r10d
	movslq	%r10d, %r10
	addl	$14, %eax
	movb	%r11b, (%r9,%r10)
	cmpl	%eax, %r8d
	jle	.L35
	movzbl	(%rdx), %edx
	addl	%ecx, %eax
	cltq
	movb	%dl, (%r9,%rax)
	.p2align 4,,10
	.p2align 3
.L35:
	addq	%r12, %rdi
	addl	%r8d, %ecx
	addq	%r12, %rbx
	cmpq	-8(%rsp), %rsi
	jne	.L28
	vzeroupper
	leaq	-40(%rbp), %rsp
	movq	%r9, %rax
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L40:
	.cfi_restore_state
	movq	-32(%rsp), %r11
	movq	%rdi, %rax
	leaq	(%r11,%rdi), %r10
	.p2align 4,,10
	.p2align 3
.L34:
	movzbl	(%rdx), %r11d
	incq	%rax
	movb	%r11b, -1(%rax)
	cmpq	%r10, %rax
	jne	.L34
	jmp	.L35
.L38:
	movl	%r8d, %r11d
	xorl	%r10d, %r10d
	xorl	%eax, %eax
	jmp	.L29
.L39:
	movl	%r14d, %eax
	jmp	.L32
.L50:
	.cfi_def_cfa 7, 8
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	.cfi_restore 14
	.cfi_restore 15
	movq	%r9, %rax
	ret
	.cfi_endproc
.LFE669:
	.size	stbi__resample_row_generic, .-stbi__resample_row_generic
	.p2align 4
	.type	stbi__out_gif_code, @function
stbi__out_gif_code:
.LFB750:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movzwl	%si, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rdi, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movswl	2100(%rdi,%rbp,4), %esi
	testw	%si, %si
	js	.L54
	call	stbi__out_gif_code
.L54:
	movl	34912(%rbx), %edx
	cmpl	34904(%rbx), %edx
	jge	.L60
	addl	34908(%rbx), %edx
	leal	3(%rdx), %eax
	cmovns	%edx, %eax
	movq	24(%rbx), %rsi
	sarl	$2, %eax
	cltq
	movq	8(%rbx), %rcx
	movb	$1, (%rsi,%rax)
	movzbl	2103(%rbx,%rbp,4), %eax
	sall	$2, %eax
	cltq
	addq	34872(%rbx), %rax
	cmpb	$-128, 3(%rax)
	jbe	.L56
	movslq	%edx, %rdx
	addq	%rcx, %rdx
	movzbl	2(%rax), %ecx
	movb	%cl, (%rdx)
	movzbl	1(%rax), %ecx
	movb	%cl, 1(%rdx)
	movzbl	(%rax), %ecx
	movb	%cl, 2(%rdx)
	movzbl	3(%rax), %eax
	movb	%al, 3(%rdx)
.L56:
	movl	34908(%rbx), %eax
	addl	$4, %eax
	movl	%eax, 34908(%rbx)
	cmpl	34900(%rbx), %eax
	jl	.L60
	movl	34884(%rbx), %eax
	vmovd	34892(%rbx), %xmm2
	addl	34912(%rbx), %eax
	movl	34904(%rbx), %esi
	vpinsrd	$1, %eax, %xmm2, %xmm0
	vmovq	%xmm0, 34908(%rbx)
	cmpl	%esi, %eax
	jl	.L60
	movl	34880(%rbx), %edx
	jmp	.L58
	.p2align 4,,10
	.p2align 3
.L59:
	shlx	%edx, 34916(%rbx), %eax
	decl	%edx
	movl	%eax, %ecx
	sarl	%ecx
	vmovd	%edx, %xmm1
	addl	34896(%rbx), %ecx
	vpinsrd	$1, %eax, %xmm1, %xmm0
	movl	%ecx, 34912(%rbx)
	vmovq	%xmm0, 34880(%rbx)
	cmpl	%esi, %ecx
	jl	.L60
.L58:
	testl	%edx, %edx
	jg	.L59
.L60:
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE750:
	.size	stbi__out_gif_code, .-stbi__out_gif_code
	.p2align 4
	.type	stbiw__jpg_DCT, @function
stbiw__jpg_DCT:
.LFB827:
	.cfi_startproc
	movq	%rdi, %rax
	movq	16(%rsp), %r10
	movq	8(%rsp), %rdi
	vmovss	(%r8), %xmm7
	vmovss	(%r9), %xmm8
	vmovss	(%rdi), %xmm6
	vmovss	(%r10), %xmm3
	vmovss	(%rax), %xmm4
	vmovss	(%rsi), %xmm2
	vmovss	(%rdx), %xmm0
	vmovss	(%rcx), %xmm1
	vaddss	%xmm3, %xmm4, %xmm5
	vsubss	%xmm3, %xmm4, %xmm4
	vaddss	%xmm6, %xmm2, %xmm3
	vsubss	%xmm6, %xmm2, %xmm2
	vaddss	%xmm8, %xmm0, %xmm6
	vsubss	%xmm8, %xmm0, %xmm0
	vaddss	%xmm7, %xmm1, %xmm8
	vaddss	%xmm6, %xmm3, %xmm9
	vsubss	%xmm7, %xmm1, %xmm1
	vsubss	%xmm6, %xmm3, %xmm3
	vaddss	%xmm8, %xmm5, %xmm7
	vsubss	%xmm8, %xmm5, %xmm5
	vaddss	%xmm1, %xmm0, %xmm1
	vaddss	%xmm0, %xmm2, %xmm0
	vaddss	%xmm5, %xmm3, %xmm3
	vaddss	%xmm2, %xmm4, %xmm2
	vmovss	.LC8(%rip), %xmm6
	vaddss	%xmm9, %xmm7, %xmm8
	vsubss	%xmm9, %xmm7, %xmm7
	vmovaps	%xmm3, %xmm9
	vfmadd132ss	%xmm6, %xmm5, %xmm9
	vfnmadd132ss	%xmm6, %xmm5, %xmm3
	vsubss	%xmm2, %xmm1, %xmm5
	vmulss	.LC9(%rip), %xmm1, %xmm1
	vmulss	.LC11(%rip), %xmm2, %xmm2
	vmovss	.LC10(%rip), %xmm10
	vfmadd231ss	%xmm10, %xmm5, %xmm1
	vfmadd231ss	%xmm10, %xmm5, %xmm2
	vmovaps	%xmm0, %xmm5
	vfnmadd132ss	%xmm6, %xmm4, %xmm0
	vfmadd132ss	%xmm6, %xmm4, %xmm5
	vaddss	%xmm0, %xmm1, %xmm4
	vsubss	%xmm1, %xmm0, %xmm0
	vmovss	%xmm4, (%r9)
	vmovss	%xmm0, (%rcx)
	vaddss	%xmm5, %xmm2, %xmm0
	vsubss	%xmm2, %xmm5, %xmm5
	vmovss	%xmm0, (%rsi)
	vmovss	%xmm5, (%r10)
	vmovss	%xmm8, (%rax)
	vmovss	%xmm9, (%rdx)
	vmovss	%xmm7, (%r8)
	vmovss	%xmm3, (%rdi)
	ret
	.cfi_endproc
.LFE827:
	.size	stbiw__jpg_DCT, .-stbiw__jpg_DCT
	.p2align 4
	.type	stbi__stdio_skip, @function
stbi__stdio_skip:
.LFB576:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movslq	%esi, %rsi
	movq	%rdi, %rbp
	movl	$1, %edx
	call	fseek@PLT
	movq	%rbp, %rdi
	call	fgetc@PLT
	cmpl	$-1, %eax
	jne	.L67
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L67:
	.cfi_restore_state
	movq	%rbp, %rsi
	movl	%eax, %edi
	popq	%rbp
	.cfi_def_cfa_offset 8
	jmp	ungetc@PLT
	.cfi_endproc
.LFE576:
	.size	stbi__stdio_skip, .-stbi__stdio_skip
	.p2align 4
	.type	stbi__stdio_read, @function
stbi__stdio_read:
.LFB575:
	.cfi_startproc
	endbr64
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movq	%rdi, %rcx
	movslq	%edx, %rdx
	movq	%rsi, %rdi
	movl	$1, %esi
	call	fread@PLT
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE575:
	.size	stbi__stdio_read, .-stbi__stdio_read
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC12:
	.string	"stb_image_write.h"
.LC13:
	.string	"0"
	.text
	.p2align 4
	.type	stbiw__writefv, @function
stbiw__writefv:
.LFB791:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$24, %rsp
	.cfi_def_cfa_offset 64
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	movzbl	(%rsi), %eax
	testb	%al, %al
	je	.L70
	movq	%rdi, %r12
	movq	%rsi, %rbx
	movq	%rdx, %rbp
	leaq	4(%rsp), %r13
	jmp	.L84
	.p2align 4,,10
	.p2align 3
.L95:
	cmpb	$32, %al
	je	.L74
	cmpb	$49, %al
	jne	.L76
	movl	0(%rbp), %eax
	cmpl	$47, %eax
	ja	.L78
	movl	%eax, %edx
	addl	$8, %eax
	movl	%eax, 0(%rbp)
	addq	16(%rbp), %rdx
.L79:
	movl	(%rdx), %eax
	movq	8(%r12), %rdi
	movb	%al, 3(%rsp)
	leaq	3(%rsp), %rsi
	movl	$1, %edx
	call	*(%r12)
.L74:
	movzbl	(%rbx), %eax
	testb	%al, %al
	je	.L70
.L84:
	incq	%rbx
	cmpb	$50, %al
	je	.L72
	jle	.L95
	cmpb	$52, %al
	jne	.L76
	movl	0(%rbp), %eax
	cmpl	$47, %eax
	ja	.L82
	movl	%eax, %edx
	addl	$8, %eax
	movl	%eax, 0(%rbp)
	addq	16(%rbp), %rdx
.L83:
	movl	(%rdx), %eax
	movq	8(%r12), %rdi
	movl	%eax, 4(%rsp)
	movl	$4, %edx
	movq	%r13, %rsi
	call	*(%r12)
	movzbl	(%rbx), %eax
	testb	%al, %al
	jne	.L84
.L70:
	movq	8(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L96
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
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
.L72:
	.cfi_restore_state
	movl	0(%rbp), %eax
	cmpl	$47, %eax
	ja	.L80
	movl	%eax, %edx
	addl	$8, %eax
	movl	%eax, 0(%rbp)
	addq	16(%rbp), %rdx
.L81:
	movzwl	(%rdx), %eax
	movq	8(%r12), %rdi
	movw	%ax, 4(%rsp)
	movl	$2, %edx
	movq	%r13, %rsi
	call	*(%r12)
	jmp	.L74
	.p2align 4,,10
	.p2align 3
.L82:
	movq	8(%rbp), %rdx
	leaq	8(%rdx), %rax
	movq	%rax, 8(%rbp)
	jmp	.L83
	.p2align 4,,10
	.p2align 3
.L80:
	movq	8(%rbp), %rdx
	leaq	8(%rdx), %rax
	movq	%rax, 8(%rbp)
	jmp	.L81
	.p2align 4,,10
	.p2align 3
.L78:
	movq	8(%rbp), %rdx
	leaq	8(%rdx), %rax
	movq	%rax, 8(%rbp)
	jmp	.L79
.L76:
	leaq	__PRETTY_FUNCTION__.30(%rip), %rcx
	movl	$372, %edx
	leaq	.LC12(%rip), %rsi
	leaq	.LC13(%rip), %rdi
	call	__assert_fail@PLT
.L96:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE791:
	.size	stbiw__writefv, .-stbiw__writefv
	.section	.rodata.str1.1
.LC14:
	.string	"bad code lengths"
	.text
	.p2align 4
	.type	stbi__build_huffman, @function
stbi__build_huffman:
.LFB640:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	movq	%rsi, %r14
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	xorl	%r13d, %r13d
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movl	$1, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movq	%rdi, %rbx
	.p2align 4,,10
	.p2align 3
.L98:
	movl	-4(%r14,%rbp,4), %r12d
	testl	%r12d, %r12d
	jle	.L101
	movslq	%r13d, %rax
	movslq	%r12d, %rdx
	leaq	1280(%rbx,%rax), %rdi
	movl	%ebp, %esi
	call	memset@PLT
	addl	%r12d, %r13d
.L101:
	incq	%rbp
	cmpq	$17, %rbp
	jne	.L98
	movslq	%r13d, %r13
	movb	$0, 1280(%rbx,%r13)
	movl	$1, %edx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	movl	$16, %r8d
	jmp	.L105
	.p2align 4,,10
	.p2align 3
.L102:
	movl	%r8d, %ecx
	subl	%r9d, %ecx
	shlx	%ecx, %eax, %ecx
	movl	%ecx, 1540(%rbx,%rdx,4)
	incq	%rdx
	addl	%eax, %eax
	cmpq	$17, %rdx
	je	.L119
.L105:
	movl	%ebp, %ecx
	subl	%eax, %ecx
	movl	%ecx, 1612(%rbx,%rdx,4)
	movslq	%ebp, %rcx
	movl	%edx, %r9d
	movzbl	1280(%rbx,%rcx), %ecx
	movl	%edx, %r10d
	movl	%edx, %edi
	cmpl	%edx, %ecx
	jne	.L102
	leal	1(%rbp), %ecx
	movslq	%ecx, %rcx
	.p2align 4,,10
	.p2align 3
.L103:
	movl	%eax, %r11d
	incl	%eax
	leal	-1(%rax), %esi
	movw	%si, 510(%rbx,%rcx,2)
	movl	%ecx, %ebp
	movzbl	1280(%rbx,%rcx), %esi
	incq	%rcx
	cmpl	%edi, %esi
	je	.L103
	shrx	%r10d, %r11d, %r11d
	testl	%r11d, %r11d
	je	.L102
	leaq	.LC14(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
.L119:
	.cfi_restore_state
	movl	$-1, 1608(%rbx)
	movl	$512, %edx
	movl	$255, %esi
	movq	%rbx, %rdi
	call	memset@PLT
	movslq	%ebp, %r14
	xorl	%r12d, %r12d
	movl	$9, %r13d
	testl	%ebp, %ebp
	jne	.L108
	jmp	.L109
	.p2align 4,,10
	.p2align 3
.L120:
	incq	%r12
	cmpq	%r12, %r14
	je	.L109
.L108:
	movzbl	1280(%rbx,%r12), %eax
	cmpl	$9, %eax
	jg	.L120
	movzwl	512(%rbx,%r12,2), %edi
	movl	%r13d, %ecx
	subl	%eax, %ecx
	shlx	%ecx, %edi, %edi
	movl	$1, %edx
	movslq	%edi, %rdi
	movzbl	%r12b, %esi
	shlx	%ecx, %edx, %edx
	addq	%rbx, %rdi
	movslq	%edx, %rdx
	incq	%r12
	call	memset@PLT
	cmpq	%r12, %r14
	jne	.L108
.L109:
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	movl	$1, %eax
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE640:
	.size	stbi__build_huffman, .-stbi__build_huffman
	.p2align 4
	.type	stbi__vertical_flip, @function
stbi__vertical_flip:
.LFB597:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movslq	%ecx, %rcx
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movslq	%esi, %r13
	imulq	%rcx, %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$2104, %rsp
	.cfi_def_cfa_offset 2160
	movq	%fs:40, %rax
	movq	%rax, 2088(%rsp)
	xorl	%eax, %eax
	movl	%edx, %eax
	sarl	%eax
	movl	%eax, 28(%rsp)
	testl	%eax, %eax
	jle	.L121
	testq	%r13, %r13
	je	.L121
	movslq	%edx, %r12
	decq	%r12
	imulq	%r13, %r12
	movq	%rdi, 8(%rsp)
	movl	$0, 24(%rsp)
	addq	%rdi, %r12
	movq	%r12, 16(%rsp)
	leaq	32(%rsp), %rbp
	.p2align 4,,10
	.p2align 3
.L124:
	movq	8(%rsp), %r12
	movq	16(%rsp), %rbx
	movq	%r13, %r15
	.p2align 4,,10
	.p2align 3
.L123:
	movl	$2048, %edx
	cmpq	%rdx, %r15
	cmovbe	%r15, %rdx
	movl	$2048, %ecx
	movq	%rdx, %r14
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	__memcpy_chk@PLT
	movq	%rbx, %rsi
	movq	%r12, %rdi
	movq	%r14, %rdx
	call	memcpy@PLT
	movq	%rbx, %rdi
	movq	%r14, %rdx
	movq	%rbp, %rsi
	call	memcpy@PLT
	addq	%r14, %r12
	addq	%r14, %rbx
	subq	%r14, %r15
	jne	.L123
	incl	24(%rsp)
	addq	%r13, 8(%rsp)
	subq	%r13, 16(%rsp)
	movl	24(%rsp), %eax
	cmpl	28(%rsp), %eax
	jne	.L124
.L121:
	movq	2088(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L133
	addq	$2104, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
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
	ret
.L133:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE597:
	.size	stbi__vertical_flip, .-stbi__vertical_flip
	.p2align 4
	.type	stbi__getn, @function
stbi__getn:
.LFB629:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movq	%rdi, %rbp
	movq	%rsi, %rdi
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movslq	%edx, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	cmpq	$0, 16(%rbp)
	movq	200(%rbp), %rax
	movq	192(%rbp), %rsi
	je	.L135
	movq	%rax, %r12
	subq	%rsi, %r12
	cmpl	%ebx, %r12d
	jl	.L139
.L135:
	leaq	(%rsi,%rbx), %rdx
	xorl	%r8d, %r8d
	cmpq	%rdx, %rax
	jnb	.L140
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	movl	%r8d, %eax
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L140:
	.cfi_restore_state
	movq	%rbx, %rdx
	call	memcpy@PLT
	addq	%rbx, 192(%rbp)
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	movl	$1, %r8d
	popq	%r12
	.cfi_def_cfa_offset 16
	movl	%r8d, %eax
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L139:
	.cfi_restore_state
	movslq	%r12d, %r13
	movq	%r13, %rdx
	call	memcpy@PLT
	subl	%r12d, %ebx
	movq	40(%rbp), %rdi
	leaq	(%rax,%r13), %rsi
	movl	%ebx, %edx
	call	*16(%rbp)
	xorl	%r8d, %r8d
	cmpl	%eax, %ebx
	movq	200(%rbp), %rax
	sete	%r8b
	movq	%rax, 192(%rbp)
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	movl	%r8d, %eax
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE629:
	.size	stbi__getn, .-stbi__getn
	.p2align 4
	.type	stbiw__encode_png_line, @function
stbiw__encode_png_line:
.LFB822:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movl	%ecx, %eax
	leaq	firstmap.19(%rip), %rcx
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	movq	%rdi, %r10
	movl	%esi, %r11d
	pushq	%r14
	pushq	%r13
	pushq	%r12
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	movl	%edx, %r12d
	leaq	mapping.20(%rip), %rdx
	pushq	%rbx
	andq	$-32, %rsp
	subq	$200, %rsp
	.cfi_offset 3, -56
	testl	%r8d, %r8d
	cmove	%rcx, %rdx
	movslq	16(%rbp), %rcx
	movq	24(%rbp), %rdi
	movl	(%rdx,%rcx,4), %ebx
	movl	stbi__flip_vertically_on_write(%rip), %edx
	testl	%edx, %edx
	je	.L143
	decl	%eax
	subl	%r8d, %eax
	imull	%esi, %eax
	negl	%r11d
	cltq
	leaq	(%r10,%rax), %rsi
	testl	%ebx, %ebx
	je	.L144
.L300:
	testl	%r9d, %r9d
	jle	.L146
	movl	%r11d, %edx
	movl	%r9d, %r14d
	movq	%rsi, %r8
	movq	%rdi, %rcx
	negl	%edx
	subl	%r11d, %r14d
	movl	%ebx, %r13d
	leaq	.L149(%rip), %r10
	.p2align 4,,10
	.p2align 3
.L155:
	cmpl	$6, %ebx
	ja	.L147
	movslq	(%r10,%r13,4), %rax
	addq	%r10, %rax
	notrack jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L149:
	.long	.L147-.L149
	.long	.L148-.L149
	.long	.L151-.L149
	.long	.L152-.L149
	.long	.L151-.L149
	.long	.L148-.L149
	.long	.L148-.L149
	.text
	.p2align 4,,10
	.p2align 3
.L148:
	movzbl	(%r8), %eax
	movb	%al, (%rcx)
.L147:
	incl	%edx
	incq	%r8
	incq	%rcx
	cmpl	%r14d, %edx
	jne	.L155
.L146:
	cmpl	$6, %ebx
	ja	.L297
	leaq	.L158(%rip), %rdx
	movslq	(%rdx,%rbx,4), %rax
	addq	%rdx, %rax
	notrack jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L158:
	.long	.L297-.L158
	.long	.L163-.L158
	.long	.L162-.L158
	.long	.L161-.L158
	.long	.L160-.L158
	.long	.L159-.L158
	.long	.L157-.L158
	.text
	.p2align 4,,10
	.p2align 3
.L151:
	movzbl	(%r8), %eax
	movslq	%edx, %r15
	subb	(%rsi,%r15), %al
	movb	%al, (%rcx)
	jmp	.L147
	.p2align 4,,10
	.p2align 3
.L152:
	movslq	%edx, %rax
	movzbl	(%rsi,%rax), %r15d
	movzbl	(%r8), %eax
	shrb	%r15b
	subl	%r15d, %eax
	movb	%al, (%rcx)
	jmp	.L147
	.p2align 4,,10
	.p2align 3
.L160:
	movl	%r12d, %r15d
	imull	%r9d, %r15d
	cmpl	%r15d, %r9d
	jge	.L297
	movslq	%r9d, %rcx
	leaq	(%rdi,%rcx), %r12
	movslq	%r11d, %rdx
	negl	%r11d
	leaq	1(%rsi,%rcx), %r13
	movslq	%r11d, %r8
	movq	%r12, %r11
	subq	%r13, %r11
	movl	%r15d, %ebx
	movq	%rcx, %r10
	subl	%r9d, %ebx
	subq	%rdx, %r10
	leaq	1(%rsi), %r14
	cmpq	$30, %r11
	movq	%r12, %r13
	seta	%r11b
	subq	%r14, %r13
	cmpq	$30, %r13
	seta	%r13b
	leal	-1(%rbx), %eax
	andl	%r13d, %r11d
	cmpl	$14, %eax
	seta	%r13b
	andl	%r13d, %r11d
	leaq	1(%rsi,%r10), %r14
	movq	%r12, %r13
	subq	%r14, %r13
	cmpq	$30, %r13
	seta	%r13b
	testb	%r13b, %r11b
	je	.L228
	leaq	1(%rsi,%r8), %r13
	movq	%r12, %r11
	subq	%r13, %r11
	cmpq	$30, %r11
	jbe	.L228
	cmpl	$30, %eax
	jbe	.L229
	movl	%ebx, %r11d
	shrl	$5, %r11d
	vmovdqa	.LC19(%rip), %ymm14
	leaq	(%rsi,%rcx), %r13
	addq	%rsi, %r8
	addq	%rsi, %r10
	salq	$5, %r11
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L196:
	vmovdqu	(%r8,%rax), %ymm7
	vmovdqu	(%rsi,%rax), %ymm6
	vmovdqu	(%r10,%rax), %ymm2
	vextracti128	$0x1, %ymm7, %xmm0
	vextracti128	$0x1, %ymm6, %xmm4
	vextracti128	$0x1, %ymm2, %xmm2
	vpmovzxbw	%xmm0, %ymm0
	vpmovzxbw	%xmm2, %ymm2
	vpmovzxbw	%xmm4, %ymm4
	vpmovzxbw	(%r10,%rax), %ymm3
	vpmovzxbw	(%rsi,%rax), %ymm5
	vpmovzxwd	%xmm0, %ymm11
	vpmovzxwd	%xmm2, %ymm1
	vpmovzxwd	%xmm4, %ymm13
	vextracti128	$0x1, %ymm0, %xmm0
	vextracti128	$0x1, %ymm2, %xmm2
	vextracti128	$0x1, %ymm4, %xmm4
	vpmovzxbw	(%r8,%rax), %ymm9
	vpmovzxwd	%xmm0, %ymm7
	vpmovzxwd	%xmm2, %ymm2
	vpmovzxwd	%xmm4, %ymm4
	vmovdqa	%ymm7, 168(%rsp)
	vpmovzxwd	%xmm3, %ymm0
	vpmovzxwd	%xmm5, %ymm15
	vpaddd	%ymm4, %ymm2, %ymm10
	vpsubd	168(%rsp), %ymm10, %ymm10
	vpmovzxwd	%xmm9, %ymm12
	vpaddd	%ymm15, %ymm0, %ymm8
	vpsubd	%ymm12, %ymm8, %ymm8
	vpsubd	%ymm15, %ymm8, %ymm15
	vpsubd	%ymm4, %ymm10, %ymm4
	vpsubd	%ymm0, %ymm8, %ymm0
	vpsubd	%ymm12, %ymm8, %ymm8
	vpabsd	%ymm0, %ymm0
	vpabsd	%ymm4, %ymm4
	vpabsd	%ymm8, %ymm8
	vmovdqa	%ymm4, 136(%rsp)
	vpabsd	%ymm15, %ymm15
	vpminsd	%ymm8, %ymm0, %ymm4
	vmovdqa	%ymm15, 40(%rsp)
	vpcmpgtd	%ymm4, %ymm15, %ymm15
	vpsubd	%ymm2, %ymm10, %ymm2
	vpsubd	168(%rsp), %ymm10, %ymm10
	vmovdqa	%ymm15, 104(%rsp)
	vpabsd	%ymm2, %ymm2
	vpabsd	%ymm10, %ymm12
	vmovdqa	136(%rsp), %ymm15
	vpminsd	%ymm12, %ymm2, %ymm10
	vpcmpgtd	%ymm10, %ymm15, %ymm15
	vextracti128	$0x1, %ymm3, %xmm3
	vextracti128	$0x1, %ymm5, %xmm5
	vpmovzxwd	%xmm3, %ymm3
	vpmovzxwd	%xmm5, %ymm5
	vextracti128	$0x1, %ymm9, %xmm9
	vmovdqa	%ymm15, 72(%rsp)
	vpmovzxwd	%xmm9, %ymm9
	vpcmpeqd	%ymm4, %ymm0, %ymm15
	vpaddd	%ymm5, %ymm3, %ymm7
	vpsubd	%ymm9, %ymm7, %ymm7
	vpaddd	%ymm13, %ymm1, %ymm6
	vpsubd	%ymm5, %ymm7, %ymm5
	vpsubd	%ymm3, %ymm7, %ymm3
	vpsubd	%ymm9, %ymm7, %ymm7
	vpsubd	%ymm11, %ymm6, %ymm6
	vpand	104(%rsp), %ymm15, %ymm15
	vpabsd	%ymm3, %ymm3
	vpabsd	%ymm7, %ymm7
	vpminsd	%ymm7, %ymm3, %ymm9
	vpsubd	%ymm13, %ymm6, %ymm13
	vpsubd	%ymm1, %ymm6, %ymm1
	vpsubd	%ymm11, %ymm6, %ymm6
	vpabsd	%ymm5, %ymm5
	vpabsd	%ymm1, %ymm1
	vpabsd	%ymm6, %ymm6
	vmovdqa	%ymm15, -24(%rsp)
	vpcmpeqd	%ymm9, %ymm3, %ymm15
	vpcmpgtd	%ymm7, %ymm3, %ymm3
	vmovdqa	40(%rsp), %ymm7
	vpminsd	%ymm6, %ymm1, %ymm11
	vmovdqa	%ymm12, 8(%rsp)
	vpcmpgtd	%ymm9, %ymm5, %ymm12
	vmovdqa	%ymm11, 168(%rsp)
	vpabsd	%ymm13, %ymm13
	vpminsd	%ymm7, %ymm4, %ymm4
	vpminsd	%ymm9, %ymm5, %ymm9
	vpcmpeqd	%ymm7, %ymm4, %ymm4
	vpcmpeqd	%ymm9, %ymm5, %ymm9
	vmovdqa	136(%rsp), %ymm7
	vpminsd	168(%rsp), %ymm13, %ymm5
	vpand	%ymm12, %ymm15, %ymm15
	vmovdqa	%ymm15, -56(%rsp)
	vpcmpeqd	168(%rsp), %ymm1, %ymm15
	vpcmpgtd	%ymm6, %ymm1, %ymm1
	vpcmpeqd	%ymm5, %ymm13, %ymm6
	vpminsd	%ymm7, %ymm10, %ymm5
	vpcmpeqd	%ymm7, %ymm5, %ymm5
	vpcmpgtd	%ymm11, %ymm13, %ymm11
	vpand	%ymm4, %ymm14, %ymm4
	vpand	%ymm5, %ymm14, %ymm5
	vpand	%ymm9, %ymm14, %ymm9
	vpand	%ymm6, %ymm14, %ymm6
	vpackusdw	%ymm5, %ymm6, %ymm6
	vpackusdw	%ymm9, %ymm4, %ymm4
	vpermq	$216, %ymm4, %ymm4
	vpermq	$216, %ymm6, %ymm6
	vpand	.LC2(%rip), %ymm6, %ymm6
	vpand	.LC2(%rip), %ymm4, %ymm5
	vpand	%ymm11, %ymm15, %ymm15
	vmovdqa	%ymm15, -88(%rsp)
	vpcmpgtd	%ymm8, %ymm0, %ymm0
	vpcmpeqd	%ymm10, %ymm2, %ymm15
	vpcmpgtd	8(%rsp), %ymm2, %ymm2
	vpackuswb	%ymm6, %ymm5, %ymm5
	vmovdqu	(%r10,%rax), %ymm6
	vpermq	$216, %ymm5, %ymm5
	vpblendvb	%ymm5, (%rsi,%rax), %ymm6, %ymm5
	vpand	72(%rsp), %ymm15, %ymm15
	vpand	104(%rsp), %ymm0, %ymm0
	vpand	72(%rsp), %ymm2, %ymm2
	vpand	-24(%rsp), %ymm14, %ymm4
	vpand	-56(%rsp), %ymm14, %ymm6
	vpand	%ymm12, %ymm3, %ymm3
	vpackusdw	%ymm6, %ymm4, %ymm4
	vpand	-88(%rsp), %ymm14, %ymm6
	vpand	%ymm11, %ymm1, %ymm1
	vpand	%ymm15, %ymm14, %ymm15
	vpand	%ymm2, %ymm14, %ymm2
	vpackusdw	%ymm15, %ymm6, %ymm6
	vpand	%ymm0, %ymm14, %ymm0
	vpand	%ymm3, %ymm14, %ymm3
	vpand	%ymm1, %ymm14, %ymm1
	vpackusdw	%ymm2, %ymm1, %ymm1
	vpermq	$216, %ymm4, %ymm4
	vpermq	$216, %ymm6, %ymm6
	vpackusdw	%ymm3, %ymm0, %ymm0
	vpand	.LC2(%rip), %ymm4, %ymm4
	vpand	.LC2(%rip), %ymm6, %ymm6
	vpermq	$216, %ymm0, %ymm0
	vpermq	$216, %ymm1, %ymm1
	vpand	.LC2(%rip), %ymm0, %ymm0
	vpand	.LC2(%rip), %ymm1, %ymm1
	vpackuswb	%ymm6, %ymm4, %ymm4
	vpermq	$216, %ymm4, %ymm4
	vpackuswb	%ymm1, %ymm0, %ymm0
	vmovdqu	0(%r13,%rax), %ymm2
	vpblendvb	%ymm4, (%r10,%rax), %ymm5, %ymm4
	vpermq	$216, %ymm0, %ymm0
	vpblendvb	%ymm0, (%r8,%rax), %ymm4, %ymm4
	vpsubb	%ymm4, %ymm2, %ymm0
	vmovdqu	%ymm0, (%r12,%rax)
	addq	$32, %rax
	cmpq	%r11, %rax
	jne	.L196
	movl	%ebx, %eax
	andl	$-32, %eax
	addl	%eax, %r9d
	cmpl	%eax, %ebx
	je	.L291
	subl	%eax, %ebx
	leal	-1(%rbx), %r11d
	cmpl	$14, %r11d
	jbe	.L299
	vzeroupper
.L195:
	vmovdqu	(%r8,%rax), %xmm1
	vmovdqu	(%r10,%rax), %xmm3
	vmovdqu	(%rsi,%rax), %xmm7
	vpmovzxbw	%xmm1, %xmm11
	vmovdqa	%xmm1, -88(%rsp)
	vpmovzxbw	%xmm3, %xmm2
	vmovdqa	%xmm3, -104(%rsp)
	vpmovzxbw	%xmm7, %xmm10
	vpsrldq	$8, %xmm1, %xmm5
	vpsrldq	$8, %xmm3, %xmm1
	vpsrldq	$8, %xmm7, %xmm3
	vpmovzxwd	%xmm2, %xmm0
	vpmovzxwd	%xmm10, %xmm15
	vpmovzxbw	%xmm1, %xmm1
	vpmovzxbw	%xmm3, %xmm3
	vpsrldq	$8, %xmm2, %xmm2
	vpsrldq	$8, %xmm10, %xmm10
	vpmovzxwd	%xmm11, %xmm13
	vpmovzxwd	%xmm1, %xmm4
	vpmovzxwd	%xmm3, %xmm14
	vpmovzxbw	%xmm5, %xmm5
	vpmovzxwd	%xmm2, %xmm2
	vpmovzxwd	%xmm10, %xmm10
	vpsrldq	$8, %xmm11, %xmm11
	vpsrldq	$8, %xmm1, %xmm1
	vpsrldq	$8, %xmm3, %xmm3
	vpmovzxwd	%xmm5, %xmm12
	vpmovzxwd	%xmm11, %xmm11
	vpaddd	%xmm10, %xmm2, %xmm8
	vpmovzxwd	%xmm1, %xmm1
	vpmovzxwd	%xmm3, %xmm3
	vpsrldq	$8, %xmm5, %xmm5
	vpsubd	%xmm11, %xmm8, %xmm8
	vpmovzxwd	%xmm5, %xmm5
	vpaddd	%xmm15, %xmm0, %xmm9
	vpaddd	%xmm3, %xmm1, %xmm6
	vpsubd	%xmm13, %xmm9, %xmm9
	vpsubd	%xmm5, %xmm6, %xmm6
	vpsubd	%xmm10, %xmm8, %xmm10
	vpsubd	%xmm3, %xmm6, %xmm3
	vpsubd	%xmm15, %xmm9, %xmm15
	vpabsd	%xmm10, %xmm10
	vpsubd	%xmm0, %xmm9, %xmm0
	vpsubd	%xmm13, %xmm9, %xmm9
	vmovdqa	%xmm10, 168(%rsp)
	vmovdqa	%xmm7, -120(%rsp)
	vpabsd	%xmm3, %xmm10
	vpaddd	%xmm14, %xmm4, %xmm7
	vpabsd	%xmm0, %xmm0
	vpabsd	%xmm9, %xmm9
	vpsubd	%xmm12, %xmm7, %xmm7
	vmovdqa	%xmm10, 136(%rsp)
	vpabsd	%xmm15, %xmm15
	vpminsd	%xmm9, %xmm0, %xmm10
	vpsubd	%xmm1, %xmm6, %xmm1
	vpsubd	%xmm5, %xmm6, %xmm6
	vpabsd	%xmm1, %xmm1
	vpabsd	%xmm6, %xmm6
	vmovdqa	%xmm15, 40(%rsp)
	vpsubd	%xmm14, %xmm7, %xmm14
	vpsubd	%xmm4, %xmm7, %xmm4
	vpsubd	%xmm12, %xmm7, %xmm7
	vpcmpgtd	%xmm10, %xmm15, %xmm12
	vmovdqa	136(%rsp), %xmm15
	vpsubd	%xmm2, %xmm8, %xmm2
	vpsubd	%xmm11, %xmm8, %xmm8
	vpminsd	%xmm6, %xmm1, %xmm11
	vpcmpgtd	%xmm11, %xmm15, %xmm15
	vmovdqa	%xmm12, 104(%rsp)
	vpabsd	%xmm2, %xmm2
	vmovdqa	%xmm15, 72(%rsp)
	vpcmpeqd	%xmm10, %xmm0, %xmm15
	vmovdqa	168(%rsp), %xmm12
	vpabsd	%xmm8, %xmm8
	vpand	104(%rsp), %xmm15, %xmm15
	vpminsd	%xmm8, %xmm2, %xmm3
	vpcmpgtd	%xmm3, %xmm12, %xmm13
	vmovdqa	%xmm15, 8(%rsp)
	vpcmpeqd	%xmm3, %xmm2, %xmm15
	vpabsd	%xmm4, %xmm4
	vpabsd	%xmm7, %xmm7
	vpminsd	%xmm7, %xmm4, %xmm5
	vpabsd	%xmm14, %xmm14
	vpand	%xmm13, %xmm15, %xmm15
	vpcmpgtd	%xmm5, %xmm14, %xmm12
	vmovdqa	%xmm15, -24(%rsp)
	vpcmpeqd	%xmm5, %xmm4, %xmm15
	vpminsd	%xmm5, %xmm14, %xmm5
	vpcmpgtd	%xmm8, %xmm2, %xmm2
	vpand	%xmm12, %xmm15, %xmm15
	vmovdqa	%xmm15, -56(%rsp)
	vpcmpeqd	%xmm11, %xmm1, %xmm15
	vpcmpgtd	%xmm6, %xmm1, %xmm1
	vmovdqa	40(%rsp), %xmm6
	vpcmpeqd	%xmm5, %xmm14, %xmm8
	vpminsd	%xmm6, %xmm10, %xmm10
	vmovdqa	136(%rsp), %xmm14
	vpcmpeqd	%xmm6, %xmm10, %xmm10
	vmovdqa	168(%rsp), %xmm6
	vpminsd	%xmm14, %xmm11, %xmm5
	vpminsd	%xmm6, %xmm3, %xmm3
	vpcmpeqd	%xmm14, %xmm5, %xmm5
	vpcmpeqd	%xmm6, %xmm3, %xmm3
	vmovdqa	.LC20(%rip), %xmm6
	vpcmpgtd	%xmm9, %xmm0, %xmm0
	vpand	%xmm5, %xmm6, %xmm5
	vpand	%xmm8, %xmm6, %xmm8
	vpand	%xmm10, %xmm6, %xmm10
	vpand	%xmm3, %xmm6, %xmm3
	vpackusdw	%xmm5, %xmm8, %xmm8
	vmovdqa	.LC5(%rip), %xmm5
	vpackusdw	%xmm3, %xmm10, %xmm3
	vpand	%xmm3, %xmm5, %xmm3
	vpand	%xmm8, %xmm5, %xmm8
	vpcmpgtd	%xmm7, %xmm4, %xmm4
	vpackuswb	%xmm8, %xmm3, %xmm7
	vpand	-24(%rsp), %xmm6, %xmm8
	vpand	8(%rsp), %xmm6, %xmm3
	vpand	72(%rsp), %xmm15, %xmm15
	vpand	104(%rsp), %xmm0, %xmm0
	vpand	72(%rsp), %xmm1, %xmm1
	vpackusdw	%xmm8, %xmm3, %xmm3
	vpand	-56(%rsp), %xmm6, %xmm8
	vpand	%xmm13, %xmm2, %xmm2
	vpand	%xmm15, %xmm6, %xmm15
	vpand	%xmm12, %xmm4, %xmm4
	vmovdqa	-104(%rsp), %xmm13
	vpand	%xmm0, %xmm6, %xmm0
	vpand	%xmm2, %xmm6, %xmm2
	vpand	%xmm4, %xmm6, %xmm4
	vpackusdw	%xmm15, %xmm8, %xmm8
	vpand	%xmm1, %xmm6, %xmm6
	vpand	%xmm3, %xmm5, %xmm3
	vpand	%xmm8, %xmm5, %xmm8
	vpackusdw	%xmm2, %xmm0, %xmm0
	vpackusdw	%xmm6, %xmm4, %xmm4
	leaq	(%rcx,%rax), %r11
	vpblendvb	%xmm7, -120(%rsp), %xmm13, %xmm7
	vpand	%xmm0, %xmm5, %xmm0
	vpackuswb	%xmm8, %xmm3, %xmm3
	vpand	%xmm4, %xmm5, %xmm5
	vpackuswb	%xmm5, %xmm0, %xmm0
	vpblendvb	%xmm3, %xmm13, %xmm7, %xmm3
	vmovdqu	(%rsi,%r11), %xmm5
	vpblendvb	%xmm0, -88(%rsp), %xmm3, %xmm3
	movl	%ebx, %eax
	vpsubb	%xmm3, %xmm5, %xmm0
	andl	$-16, %eax
	vmovdqu	%xmm0, (%rdi,%r11)
	addl	%eax, %r9d
	cmpl	%eax, %ebx
	je	.L297
.L199:
	leaq	(%rcx,%rdx), %rax
	movq	%rsi, %rbx
	subq	%rax, %rbx
	movq	%rsi, %rax
	subq	%rcx, %rax
	movq	%rbx, 168(%rsp)
	movq	%rax, 136(%rsp)
	movq	%rsi, %r14
	movslq	%r9d, %r9
	subq	%rdx, %r14
.L202:
	movq	168(%rsp), %rax
	movzbl	(%r14,%r9), %edx
	movzbl	(%rax,%r9), %ebx
	movq	136(%rsp), %rax
	movl	%edx, %r13d
	movzbl	(%rax,%r9), %r11d
	movl	%ebx, %r12d
	leal	(%rdx,%r11), %eax
	subl	%ebx, %eax
	movl	%eax, %ecx
	subl	%edx, %ecx
	movl	%ecx, %edx
	sarl	$31, %edx
	xorl	%edx, %ecx
	subl	%edx, %ecx
	movl	%eax, %edx
	subl	%ebx, %edx
	subl	%r11d, %eax
	movl	%edx, %ebx
	sarl	$31, %ebx
	movl	%r11d, %r10d
	movl	%eax, %r11d
	sarl	$31, %r11d
	xorl	%ebx, %edx
	xorl	%r11d, %eax
	subl	%ebx, %edx
	subl	%r11d, %eax
	cmpl	%edx, %ecx
	movl	%edx, %r11d
	cmovle	%ecx, %r11d
	movzbl	(%rsi,%r9), %r8d
	cmpl	%r11d, %eax
	jle	.L203
	cmpl	%edx, %ecx
	movl	%r12d, %r10d
	cmovle	%r13d, %r10d
.L203:
	subl	%r10d, %r8d
	movb	%r8b, (%rdi,%r9)
	incq	%r9
	cmpl	%r9d, %r15d
	jg	.L202
.L297:
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
	.p2align 4,,10
	.p2align 3
.L143:
	.cfi_restore_state
	imull	%esi, %r8d
	movslq	%r8d, %r8
	leaq	(%r10,%r8), %rsi
	testl	%ebx, %ebx
	jne	.L300
.L144:
	leaq	-40(%rbp), %rsp
	imull	%r12d, %r9d
	movslq	%r9d, %rdx
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	jmp	memcpy@PLT
	.p2align 4,,10
	.p2align 3
.L157:
	.cfi_restore_state
	imull	%r9d, %r12d
	cmpl	%r12d, %r9d
	jge	.L297
	movslq	%r9d, %rdx
	leaq	(%rdi,%rdx), %r10
	leaq	1(%rsi,%rdx), %r11
	movq	%r10, %rcx
	subq	%r11, %rcx
	movl	%r12d, %r8d
	subl	%r9d, %r8d
	leaq	1(%rsi), %rbx
	cmpq	$30, %rcx
	movq	%r10, %rcx
	seta	%r11b
	subq	%rbx, %rcx
	cmpq	$30, %rcx
	seta	%cl
	leal	-1(%r8), %eax
	testb	%cl, %r11b
	je	.L234
	cmpl	$14, %eax
	jbe	.L234
	cmpl	$30, %eax
	jbe	.L235
	movl	%r8d, %ecx
	shrl	$5, %ecx
	leaq	(%rsi,%rdx), %r11
	salq	$5, %rcx
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L215:
	vmovdqu	(%r11,%rax), %ymm2
	vpsubb	(%rsi,%rax), %ymm2, %ymm0
	vmovdqu	%ymm0, (%r10,%rax)
	addq	$32, %rax
	cmpq	%rcx, %rax
	jne	.L215
	movl	%r8d, %eax
	andl	$-32, %eax
	leal	(%rax,%r9), %ecx
	cmpl	%eax, %r8d
	je	.L295
	subl	%eax, %r8d
	leal	-1(%r8), %r10d
	cmpl	$14, %r10d
	jbe	.L301
	vzeroupper
.L214:
	movl	%eax, %r10d
	leaq	(%rdx,%r10), %rax
	vmovdqu	(%rsi,%rax), %xmm2
	vpsubb	(%rsi,%r10), %xmm2, %xmm0
	vmovdqu	%xmm0, (%rdi,%rax)
	movl	%r8d, %eax
	andl	$-16, %eax
	addl	%eax, %ecx
	cmpl	%eax, %r8d
	je	.L297
.L218:
	movslq	%ecx, %r8
	movl	%ecx, %edx
	movzbl	(%rsi,%r8), %eax
	subl	%r9d, %edx
	movslq	%edx, %rdx
	subb	(%rsi,%rdx), %al
	movb	%al, (%rdi,%r8)
	leal	1(%rcx), %eax
	cmpl	%eax, %r12d
	jle	.L297
	movslq	%eax, %r8
	movzbl	(%rsi,%r8), %edx
	subl	%r9d, %eax
	cltq
	subb	(%rsi,%rax), %dl
	leal	2(%rcx), %eax
	movb	%dl, (%rdi,%r8)
	cmpl	%eax, %r12d
	jle	.L297
	movslq	%eax, %r8
	movzbl	(%rsi,%r8), %edx
	subl	%r9d, %eax
	cltq
	subb	(%rsi,%rax), %dl
	leal	3(%rcx), %eax
	movb	%dl, (%rdi,%r8)
	cmpl	%eax, %r12d
	jle	.L297
	movslq	%eax, %r8
	movzbl	(%rsi,%r8), %edx
	subl	%r9d, %eax
	cltq
	subb	(%rsi,%rax), %dl
	leal	4(%rcx), %eax
	movb	%dl, (%rdi,%r8)
	cmpl	%eax, %r12d
	jle	.L297
	movslq	%eax, %r8
	movzbl	(%rsi,%r8), %edx
	subl	%r9d, %eax
	cltq
	subb	(%rsi,%rax), %dl
	leal	5(%rcx), %eax
	movb	%dl, (%rdi,%r8)
	cmpl	%eax, %r12d
	jle	.L297
	movslq	%eax, %r8
	movzbl	(%rsi,%r8), %edx
	subl	%r9d, %eax
	cltq
	subb	(%rsi,%rax), %dl
	leal	6(%rcx), %eax
	movb	%dl, (%rdi,%r8)
	cmpl	%eax, %r12d
	jle	.L297
	movslq	%eax, %r8
	movzbl	(%rsi,%r8), %edx
	subl	%r9d, %eax
	cltq
	subb	(%rsi,%rax), %dl
	leal	7(%rcx), %eax
	movb	%dl, (%rdi,%r8)
	cmpl	%eax, %r12d
	jle	.L297
	movslq	%eax, %r8
	movzbl	(%rsi,%r8), %edx
	subl	%r9d, %eax
	cltq
	subb	(%rsi,%rax), %dl
	leal	8(%rcx), %eax
	movb	%dl, (%rdi,%r8)
	cmpl	%eax, %r12d
	jle	.L297
	movslq	%eax, %r8
	movzbl	(%rsi,%r8), %edx
	subl	%r9d, %eax
	cltq
	subb	(%rsi,%rax), %dl
	leal	9(%rcx), %eax
	movb	%dl, (%rdi,%r8)
	cmpl	%eax, %r12d
	jle	.L297
	movslq	%eax, %r8
	movzbl	(%rsi,%r8), %edx
	subl	%r9d, %eax
	cltq
	subb	(%rsi,%rax), %dl
	leal	10(%rcx), %eax
	movb	%dl, (%rdi,%r8)
	cmpl	%eax, %r12d
	jle	.L297
	movslq	%eax, %r8
	movzbl	(%rsi,%r8), %edx
	subl	%r9d, %eax
	cltq
	subb	(%rsi,%rax), %dl
	leal	11(%rcx), %eax
	movb	%dl, (%rdi,%r8)
	cmpl	%eax, %r12d
	jle	.L297
	movslq	%eax, %r8
	movzbl	(%rsi,%r8), %edx
	subl	%r9d, %eax
	cltq
	subb	(%rsi,%rax), %dl
	leal	12(%rcx), %eax
	movb	%dl, (%rdi,%r8)
	cmpl	%eax, %r12d
	jle	.L297
	movslq	%eax, %r8
	movzbl	(%rsi,%r8), %edx
	subl	%r9d, %eax
	cltq
	subb	(%rsi,%rax), %dl
	leal	13(%rcx), %eax
	movb	%dl, (%rdi,%r8)
	cmpl	%eax, %r12d
	jle	.L297
	movslq	%eax, %r8
	movzbl	(%rsi,%r8), %edx
	subl	%r9d, %eax
	cltq
	subb	(%rsi,%rax), %dl
	addl	$14, %ecx
	movb	%dl, (%rdi,%r8)
	cmpl	%ecx, %r12d
	jle	.L297
	movslq	%ecx, %r8
	movzbl	(%rsi,%r8), %edx
	subl	%r9d, %ecx
	movslq	%ecx, %rax
	subb	(%rsi,%rax), %dl
	movb	%dl, (%rdi,%r8)
	jmp	.L297
	.p2align 4,,10
	.p2align 3
.L163:
	imull	%r9d, %r12d
	cmpl	%r12d, %r9d
	jge	.L297
	movslq	%r9d, %rdx
	leaq	(%rdi,%rdx), %r10
	leaq	1(%rsi,%rdx), %r11
	movq	%r10, %rcx
	subq	%r11, %rcx
	movl	%r12d, %r8d
	subl	%r9d, %r8d
	leaq	1(%rsi), %rbx
	cmpq	$30, %rcx
	movq	%r10, %rcx
	seta	%r11b
	subq	%rbx, %rcx
	cmpq	$30, %rcx
	seta	%cl
	leal	-1(%r8), %eax
	testb	%cl, %r11b
	je	.L223
	cmpl	$14, %eax
	jbe	.L223
	cmpl	$30, %eax
	jbe	.L224
	movl	%r8d, %ecx
	shrl	$5, %ecx
	leaq	(%rsi,%rdx), %r11
	salq	$5, %rcx
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L172:
	vmovdqu	(%r11,%rax), %ymm1
	vpsubb	(%rsi,%rax), %ymm1, %ymm0
	vmovdqu	%ymm0, (%r10,%rax)
	addq	$32, %rax
	cmpq	%rcx, %rax
	jne	.L172
	movl	%r8d, %eax
	andl	$-32, %eax
	leal	(%rax,%r9), %ecx
	cmpl	%r8d, %eax
	je	.L285
	subl	%eax, %r8d
	leal	-1(%r8), %r10d
	cmpl	$14, %r10d
	jbe	.L302
	vzeroupper
.L171:
	movl	%eax, %r10d
	leaq	(%r10,%rdx), %rax
	vmovdqu	(%rsi,%rax), %xmm2
	vpsubb	(%rsi,%r10), %xmm2, %xmm0
	vmovdqu	%xmm0, (%rdi,%rax)
	movl	%r8d, %eax
	andl	$-16, %eax
	addl	%eax, %ecx
	cmpl	%r8d, %eax
	je	.L297
.L175:
	movslq	%ecx, %r8
	movl	%ecx, %edx
	movzbl	(%rsi,%r8), %eax
	subl	%r9d, %edx
	movslq	%edx, %rdx
	subb	(%rsi,%rdx), %al
	movb	%al, (%rdi,%r8)
	leal	1(%rcx), %eax
	cmpl	%eax, %r12d
	jle	.L297
	movslq	%eax, %r8
	movzbl	(%rsi,%r8), %edx
	subl	%r9d, %eax
	cltq
	subb	(%rsi,%rax), %dl
	leal	2(%rcx), %eax
	movb	%dl, (%rdi,%r8)
	cmpl	%r12d, %eax
	jge	.L297
	movslq	%eax, %r8
	movzbl	(%rsi,%r8), %edx
	subl	%r9d, %eax
	cltq
	subb	(%rsi,%rax), %dl
	leal	3(%rcx), %eax
	movb	%dl, (%rdi,%r8)
	cmpl	%r12d, %eax
	jge	.L297
	movslq	%eax, %r8
	movzbl	(%rsi,%r8), %edx
	subl	%r9d, %eax
	cltq
	subb	(%rsi,%rax), %dl
	leal	4(%rcx), %eax
	movb	%dl, (%rdi,%r8)
	cmpl	%eax, %r12d
	jle	.L297
	movslq	%eax, %r8
	movzbl	(%rsi,%r8), %edx
	subl	%r9d, %eax
	cltq
	subb	(%rsi,%rax), %dl
	leal	5(%rcx), %eax
	movb	%dl, (%rdi,%r8)
	cmpl	%r12d, %eax
	jge	.L297
	movslq	%eax, %r8
	movzbl	(%rsi,%r8), %edx
	subl	%r9d, %eax
	cltq
	subb	(%rsi,%rax), %dl
	leal	6(%rcx), %eax
	movb	%dl, (%rdi,%r8)
	cmpl	%r12d, %eax
	jge	.L297
	movslq	%eax, %r8
	movzbl	(%rsi,%r8), %edx
	subl	%r9d, %eax
	cltq
	subb	(%rsi,%rax), %dl
	leal	7(%rcx), %eax
	movb	%dl, (%rdi,%r8)
	cmpl	%r12d, %eax
	jge	.L297
	movslq	%eax, %r8
	movzbl	(%rsi,%r8), %edx
	subl	%r9d, %eax
	cltq
	subb	(%rsi,%rax), %dl
	leal	8(%rcx), %eax
	movb	%dl, (%rdi,%r8)
	cmpl	%eax, %r12d
	jle	.L297
	movslq	%eax, %r8
	movzbl	(%rsi,%r8), %edx
	subl	%r9d, %eax
	cltq
	subb	(%rsi,%rax), %dl
	leal	9(%rcx), %eax
	movb	%dl, (%rdi,%r8)
	cmpl	%eax, %r12d
	jle	.L297
	movslq	%eax, %r8
	movzbl	(%rsi,%r8), %edx
	subl	%r9d, %eax
	cltq
	subb	(%rsi,%rax), %dl
	leal	10(%rcx), %eax
	movb	%dl, (%rdi,%r8)
	cmpl	%eax, %r12d
	jle	.L297
	movslq	%eax, %r8
	movzbl	(%rsi,%r8), %edx
	subl	%r9d, %eax
	cltq
	subb	(%rsi,%rax), %dl
	leal	11(%rcx), %eax
	movb	%dl, (%rdi,%r8)
	cmpl	%eax, %r12d
	jle	.L297
	movslq	%eax, %r8
	movzbl	(%rsi,%r8), %edx
	subl	%r9d, %eax
	cltq
	subb	(%rsi,%rax), %dl
	leal	12(%rcx), %eax
	movb	%dl, (%rdi,%r8)
	cmpl	%eax, %r12d
	jle	.L297
	movslq	%eax, %r8
	movzbl	(%rsi,%r8), %edx
	subl	%r9d, %eax
	cltq
	subb	(%rsi,%rax), %dl
	leal	13(%rcx), %eax
	movb	%dl, (%rdi,%r8)
	cmpl	%eax, %r12d
	jle	.L297
	movslq	%eax, %r8
	movzbl	(%rsi,%r8), %edx
	subl	%r9d, %eax
	cltq
	subb	(%rsi,%rax), %dl
	addl	$14, %ecx
	movb	%dl, (%rdi,%r8)
	cmpl	%ecx, %r12d
	jle	.L297
	movslq	%ecx, %r8
	movzbl	(%rsi,%r8), %edx
	subl	%r9d, %ecx
	movslq	%ecx, %rax
	subb	(%rsi,%rax), %dl
	movb	%dl, (%rdi,%r8)
	jmp	.L297
	.p2align 4,,10
	.p2align 3
.L162:
	imull	%r9d, %r12d
	cmpl	%r9d, %r12d
	jle	.L297
	movslq	%r9d, %rdx
	leaq	(%rdi,%rdx), %rbx
	leaq	1(%rdx), %rax
	leaq	(%rsi,%rax), %r15
	movl	%r12d, %r8d
	movq	%rbx, %r14
	subq	%r15, %r14
	subl	%r9d, %r8d
	movslq	%r11d, %r13
	movq	%rdx, %rcx
	leal	-1(%r8), %r10d
	subq	%r13, %rcx
	cmpq	$30, %r14
	seta	%r15b
	cmpl	$14, %r10d
	seta	%r14b
	testb	%r14b, %r15b
	je	.L178
	leaq	1(%rsi,%rcx), %r15
	movq	%rbx, %r14
	subq	%r15, %r14
	cmpq	$30, %r14
	jbe	.L178
	cmpl	$30, %r10d
	jbe	.L225
	movl	%r8d, %r10d
	shrl	$5, %r10d
	leaq	(%rsi,%rdx), %r13
	addq	%rsi, %rcx
	salq	$5, %r10
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L180:
	vmovdqu	0(%r13,%rax), %ymm1
	vpsubb	(%rcx,%rax), %ymm1, %ymm0
	vmovdqu	%ymm0, (%rbx,%rax)
	addq	$32, %rax
	cmpq	%r10, %rax
	jne	.L180
	movl	%r8d, %eax
	andl	$-32, %eax
	addl	%eax, %r9d
	cmpl	%eax, %r8d
	je	.L287
	subl	%eax, %r8d
	leal	-1(%r8), %r10d
	cmpl	$14, %r10d
	jbe	.L303
	vzeroupper
.L179:
	addq	%rax, %rdx
	vmovdqu	(%rsi,%rdx), %xmm5
	vpsubb	(%rcx,%rax), %xmm5, %xmm0
	movl	%r8d, %eax
	andl	$-16, %eax
	vmovdqu	%xmm0, (%rdi,%rdx)
	addl	%eax, %r9d
	cmpl	%eax, %r8d
	je	.L297
.L183:
	movslq	%r9d, %rcx
	movl	%r9d, %edx
	movzbl	(%rsi,%rcx), %eax
	subl	%r11d, %edx
	movslq	%edx, %rdx
	subb	(%rsi,%rdx), %al
	movb	%al, (%rdi,%rcx)
	leal	1(%r9), %eax
	cmpl	%r12d, %eax
	jge	.L297
	movslq	%eax, %rcx
	movzbl	(%rsi,%rcx), %edx
	subl	%r11d, %eax
	cltq
	subb	(%rsi,%rax), %dl
	leal	2(%r9), %eax
	movb	%dl, (%rdi,%rcx)
	cmpl	%eax, %r12d
	jle	.L297
	movslq	%eax, %rcx
	movzbl	(%rsi,%rcx), %edx
	subl	%r11d, %eax
	cltq
	subb	(%rsi,%rax), %dl
	leal	3(%r9), %eax
	movb	%dl, (%rdi,%rcx)
	cmpl	%eax, %r12d
	jle	.L297
	movslq	%eax, %rcx
	movzbl	(%rsi,%rcx), %edx
	subl	%r11d, %eax
	cltq
	subb	(%rsi,%rax), %dl
	leal	4(%r9), %eax
	movb	%dl, (%rdi,%rcx)
	cmpl	%eax, %r12d
	jle	.L297
	movslq	%eax, %rcx
	movzbl	(%rsi,%rcx), %edx
	subl	%r11d, %eax
	cltq
	subb	(%rsi,%rax), %dl
	leal	5(%r9), %eax
	movb	%dl, (%rdi,%rcx)
	cmpl	%eax, %r12d
	jle	.L297
	movslq	%eax, %rcx
	movzbl	(%rsi,%rcx), %edx
	subl	%r11d, %eax
	cltq
	subb	(%rsi,%rax), %dl
	leal	6(%r9), %eax
	movb	%dl, (%rdi,%rcx)
	cmpl	%eax, %r12d
	jle	.L297
	movslq	%eax, %rcx
	movzbl	(%rsi,%rcx), %edx
	subl	%r11d, %eax
	cltq
	subb	(%rsi,%rax), %dl
	leal	7(%r9), %eax
	movb	%dl, (%rdi,%rcx)
	cmpl	%eax, %r12d
	jle	.L297
	movslq	%eax, %rcx
	movzbl	(%rsi,%rcx), %edx
	subl	%r11d, %eax
	cltq
	subb	(%rsi,%rax), %dl
	leal	8(%r9), %eax
	movb	%dl, (%rdi,%rcx)
	cmpl	%eax, %r12d
	jle	.L297
	movslq	%eax, %rcx
	movzbl	(%rsi,%rcx), %edx
	subl	%r11d, %eax
	cltq
	subb	(%rsi,%rax), %dl
	leal	9(%r9), %eax
	movb	%dl, (%rdi,%rcx)
	cmpl	%eax, %r12d
	jle	.L297
	movslq	%eax, %rcx
	movzbl	(%rsi,%rcx), %edx
	subl	%r11d, %eax
	cltq
	subb	(%rsi,%rax), %dl
	leal	10(%r9), %eax
	movb	%dl, (%rdi,%rcx)
	cmpl	%eax, %r12d
	jle	.L297
	movslq	%eax, %rcx
	movzbl	(%rsi,%rcx), %edx
	subl	%r11d, %eax
	cltq
	subb	(%rsi,%rax), %dl
	leal	11(%r9), %eax
	movb	%dl, (%rdi,%rcx)
	cmpl	%eax, %r12d
	jle	.L297
	movslq	%eax, %rcx
	movzbl	(%rsi,%rcx), %edx
	subl	%r11d, %eax
	cltq
	subb	(%rsi,%rax), %dl
	leal	12(%r9), %eax
	movb	%dl, (%rdi,%rcx)
	cmpl	%eax, %r12d
	jle	.L297
	movslq	%eax, %rcx
	movzbl	(%rsi,%rcx), %edx
	subl	%r11d, %eax
	cltq
	subb	(%rsi,%rax), %dl
	leal	13(%r9), %eax
	movb	%dl, (%rdi,%rcx)
	cmpl	%eax, %r12d
	jle	.L297
	movslq	%eax, %rcx
	movzbl	(%rsi,%rcx), %edx
	subl	%r11d, %eax
	cltq
	subb	(%rsi,%rax), %dl
	addl	$14, %r9d
	movb	%dl, (%rdi,%rcx)
	cmpl	%r9d, %r12d
	jle	.L297
	movslq	%r9d, %rcx
	movzbl	(%rsi,%rcx), %edx
	subl	%r11d, %r9d
	movslq	%r9d, %rax
	subb	(%rsi,%rax), %dl
	movb	%dl, (%rdi,%rcx)
	jmp	.L297
	.p2align 4,,10
	.p2align 3
.L161:
	imull	%r9d, %r12d
	cmpl	%r9d, %r12d
	jle	.L297
	movslq	%r9d, %rdx
	leaq	(%rdi,%rdx), %rcx
	leaq	1(%rsi,%rdx), %r14
	movq	%rcx, %rax
	subq	%r14, %rax
	movl	%r12d, %ebx
	movslq	%r11d, %r13
	movq	%rdx, %r10
	subl	%r9d, %ebx
	subq	%r13, %r10
	leaq	1(%rsi), %r15
	cmpq	$30, %rax
	movq	%rcx, %r14
	seta	%al
	subq	%r15, %r14
	cmpq	$30, %r14
	seta	%r14b
	leal	-1(%rbx), %r8d
	andl	%r14d, %eax
	cmpl	$14, %r8d
	seta	%r14b
	testb	%r14b, %al
	je	.L226
	leaq	1(%rsi,%r10), %r14
	movq	%rcx, %rax
	subq	%r14, %rax
	cmpq	$30, %rax
	jbe	.L226
	cmpl	$30, %r8d
	jbe	.L227
	movl	%ebx, %r8d
	shrl	$5, %r8d
	vmovdqa	.LC15(%rip), %ymm4
	vmovdqa	.LC16(%rip), %ymm3
	leaq	(%rsi,%rdx), %r13
	addq	%rsi, %r10
	salq	$5, %r8
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L188:
	vmovdqu	(%rsi,%rax), %ymm0
	vmovdqu	(%r10,%rax), %ymm1
	vmovdqu	0(%r13,%rax), %ymm7
	vpand	%ymm1, %ymm0, %ymm2
	vpsrlw	$1, %ymm0, %ymm0
	vpsrlw	$1, %ymm1, %ymm1
	vpand	%ymm4, %ymm2, %ymm2
	vpand	%ymm0, %ymm3, %ymm0
	vpand	%ymm1, %ymm3, %ymm1
	vpsubb	%ymm2, %ymm7, %ymm2
	vpaddb	%ymm1, %ymm0, %ymm0
	vpsubb	%ymm0, %ymm2, %ymm0
	vmovdqu	%ymm0, (%rcx,%rax)
	addq	$32, %rax
	cmpq	%rax, %r8
	jne	.L188
	movl	%ebx, %r8d
	andl	$-32, %r8d
	leal	(%r8,%r9), %ecx
	cmpl	%r8d, %ebx
	je	.L289
	subl	%r8d, %ebx
	leal	-1(%rbx), %eax
	cmpl	$14, %eax
	jbe	.L304
	vzeroupper
.L187:
	vmovdqu	(%rsi,%r8), %xmm0
	vmovdqu	(%r10,%r8), %xmm3
	vpsrlw	$1, %xmm0, %xmm1
	vpand	.LC18(%rip), %xmm0, %xmm0
	leaq	(%rdx,%r8), %rax
	vmovdqa	.LC17(%rip), %xmm2
	vmovdqu	(%rsi,%rax), %xmm5
	vpand	%xmm3, %xmm0, %xmm0
	vpsrlw	$1, %xmm3, %xmm3
	vpand	%xmm1, %xmm2, %xmm1
	vpand	%xmm3, %xmm2, %xmm2
	vpsubb	%xmm1, %xmm5, %xmm1
	vpaddb	%xmm2, %xmm0, %xmm0
	vpsubb	%xmm0, %xmm1, %xmm0
	vmovdqu	%xmm0, (%rdi,%rax)
	movl	%ebx, %eax
	andl	$-16, %eax
	addl	%eax, %ecx
	cmpl	%ebx, %eax
	je	.L297
.L191:
	movl	%ecx, %eax
	movl	%ecx, %edx
	subl	%r9d, %eax
	subl	%r11d, %edx
	cltq
	movslq	%edx, %rdx
	movzbl	(%rsi,%rdx), %edx
	movzbl	(%rsi,%rax), %eax
	movslq	%ecx, %r8
	addl	%edx, %eax
	movzbl	(%rsi,%r8), %edx
	sarl	%eax
	subl	%eax, %edx
	leal	1(%rcx), %eax
	movb	%dl, (%rdi,%r8)
	cmpl	%eax, %r12d
	jle	.L297
	movl	%eax, %edx
	movslq	%eax, %r8
	subl	%r9d, %edx
	subl	%r11d, %eax
	movslq	%edx, %rdx
	cltq
	movzbl	(%rsi,%rdx), %edx
	movzbl	(%rsi,%rax), %eax
	addl	%edx, %eax
	movzbl	(%rsi,%r8), %edx
	sarl	%eax
	subl	%eax, %edx
	leal	2(%rcx), %eax
	movb	%dl, (%rdi,%r8)
	cmpl	%eax, %r12d
	jle	.L297
	movl	%eax, %edx
	movslq	%eax, %r8
	subl	%r9d, %edx
	subl	%r11d, %eax
	movslq	%edx, %rdx
	cltq
	movzbl	(%rsi,%rdx), %edx
	movzbl	(%rsi,%rax), %eax
	addl	%edx, %eax
	movzbl	(%rsi,%r8), %edx
	sarl	%eax
	subl	%eax, %edx
	leal	3(%rcx), %eax
	movb	%dl, (%rdi,%r8)
	cmpl	%eax, %r12d
	jle	.L297
	movl	%eax, %edx
	movslq	%eax, %r8
	subl	%r9d, %edx
	subl	%r11d, %eax
	movslq	%edx, %rdx
	cltq
	movzbl	(%rsi,%rdx), %edx
	movzbl	(%rsi,%rax), %eax
	addl	%edx, %eax
	movzbl	(%rsi,%r8), %edx
	sarl	%eax
	subl	%eax, %edx
	leal	4(%rcx), %eax
	movb	%dl, (%rdi,%r8)
	cmpl	%eax, %r12d
	jle	.L297
	movl	%eax, %edx
	movslq	%eax, %r8
	subl	%r9d, %edx
	subl	%r11d, %eax
	movslq	%edx, %rdx
	cltq
	movzbl	(%rsi,%rdx), %edx
	movzbl	(%rsi,%rax), %eax
	addl	%edx, %eax
	movzbl	(%rsi,%r8), %edx
	sarl	%eax
	subl	%eax, %edx
	leal	5(%rcx), %eax
	movb	%dl, (%rdi,%r8)
	cmpl	%eax, %r12d
	jle	.L297
	movl	%eax, %edx
	movslq	%eax, %r8
	subl	%r9d, %edx
	subl	%r11d, %eax
	movslq	%edx, %rdx
	cltq
	movzbl	(%rsi,%rdx), %edx
	movzbl	(%rsi,%rax), %eax
	addl	%edx, %eax
	movzbl	(%rsi,%r8), %edx
	sarl	%eax
	subl	%eax, %edx
	leal	6(%rcx), %eax
	movb	%dl, (%rdi,%r8)
	cmpl	%eax, %r12d
	jle	.L297
	movl	%eax, %edx
	movslq	%eax, %r8
	subl	%r9d, %edx
	subl	%r11d, %eax
	movslq	%edx, %rdx
	cltq
	movzbl	(%rsi,%rdx), %edx
	movzbl	(%rsi,%rax), %eax
	addl	%edx, %eax
	movzbl	(%rsi,%r8), %edx
	sarl	%eax
	subl	%eax, %edx
	leal	7(%rcx), %eax
	movb	%dl, (%rdi,%r8)
	cmpl	%eax, %r12d
	jle	.L297
	movl	%eax, %edx
	movslq	%eax, %r8
	subl	%r9d, %edx
	subl	%r11d, %eax
	movslq	%edx, %rdx
	cltq
	movzbl	(%rsi,%rdx), %edx
	movzbl	(%rsi,%rax), %eax
	addl	%edx, %eax
	movzbl	(%rsi,%r8), %edx
	sarl	%eax
	subl	%eax, %edx
	leal	8(%rcx), %eax
	movb	%dl, (%rdi,%r8)
	cmpl	%eax, %r12d
	jle	.L297
	movl	%eax, %edx
	movslq	%eax, %r8
	subl	%r9d, %edx
	subl	%r11d, %eax
	movslq	%edx, %rdx
	cltq
	movzbl	(%rsi,%rdx), %edx
	movzbl	(%rsi,%rax), %eax
	addl	%edx, %eax
	movzbl	(%rsi,%r8), %edx
	sarl	%eax
	subl	%eax, %edx
	leal	9(%rcx), %eax
	movb	%dl, (%rdi,%r8)
	cmpl	%eax, %r12d
	jle	.L297
	movl	%eax, %edx
	movslq	%eax, %r8
	subl	%r9d, %edx
	subl	%r11d, %eax
	movslq	%edx, %rdx
	cltq
	movzbl	(%rsi,%rdx), %edx
	movzbl	(%rsi,%rax), %eax
	addl	%edx, %eax
	movzbl	(%rsi,%r8), %edx
	sarl	%eax
	subl	%eax, %edx
	leal	10(%rcx), %eax
	movb	%dl, (%rdi,%r8)
	cmpl	%eax, %r12d
	jle	.L297
	movl	%eax, %edx
	movslq	%eax, %r8
	subl	%r9d, %edx
	subl	%r11d, %eax
	movslq	%edx, %rdx
	cltq
	movzbl	(%rsi,%rdx), %edx
	movzbl	(%rsi,%rax), %eax
	addl	%edx, %eax
	movzbl	(%rsi,%r8), %edx
	sarl	%eax
	subl	%eax, %edx
	leal	11(%rcx), %eax
	movb	%dl, (%rdi,%r8)
	cmpl	%eax, %r12d
	jle	.L297
	movl	%eax, %edx
	movslq	%eax, %r8
	subl	%r9d, %edx
	subl	%r11d, %eax
	movslq	%edx, %rdx
	cltq
	movzbl	(%rsi,%rdx), %edx
	movzbl	(%rsi,%rax), %eax
	addl	%edx, %eax
	movzbl	(%rsi,%r8), %edx
	sarl	%eax
	subl	%eax, %edx
	leal	12(%rcx), %eax
	movb	%dl, (%rdi,%r8)
	cmpl	%eax, %r12d
	jle	.L297
	movl	%eax, %edx
	movslq	%eax, %r8
	subl	%r9d, %edx
	subl	%r11d, %eax
	movslq	%edx, %rdx
	cltq
	movzbl	(%rsi,%rdx), %edx
	movzbl	(%rsi,%rax), %eax
	addl	%edx, %eax
	movzbl	(%rsi,%r8), %edx
	sarl	%eax
	subl	%eax, %edx
	leal	13(%rcx), %eax
	movb	%dl, (%rdi,%r8)
	cmpl	%eax, %r12d
	jle	.L297
	movl	%eax, %edx
	movslq	%eax, %r8
	subl	%r9d, %edx
	subl	%r11d, %eax
	movslq	%edx, %rdx
	cltq
	movzbl	(%rsi,%rdx), %edx
	movzbl	(%rsi,%rax), %eax
	addl	$14, %ecx
	addl	%edx, %eax
	movzbl	(%rsi,%r8), %edx
	sarl	%eax
	subl	%eax, %edx
	movb	%dl, (%rdi,%r8)
	cmpl	%ecx, %r12d
	jle	.L297
	movl	%ecx, %eax
	subl	%r9d, %eax
	movslq	%ecx, %r8
	cltq
	subl	%r11d, %ecx
	movzbl	(%rsi,%rax), %edx
	movslq	%ecx, %rax
	movzbl	(%rsi,%rax), %eax
	addl	%edx, %eax
	movzbl	(%rsi,%r8), %edx
	sarl	%eax
	subl	%eax, %edx
	movb	%dl, (%rdi,%r8)
	jmp	.L297
	.p2align 4,,10
	.p2align 3
.L159:
	imull	%r9d, %r12d
	cmpl	%r12d, %r9d
	jge	.L297
	movslq	%r9d, %rdx
	leaq	(%rdi,%rdx), %r10
	leaq	1(%rsi,%rdx), %r11
	movq	%r10, %rcx
	subq	%r11, %rcx
	movl	%r12d, %r8d
	subl	%r9d, %r8d
	leaq	1(%rsi), %rbx
	cmpq	$30, %rcx
	movq	%r10, %rcx
	seta	%r11b
	subq	%rbx, %rcx
	cmpq	$30, %rcx
	seta	%cl
	leal	-1(%r8), %eax
	testb	%cl, %r11b
	je	.L232
	cmpl	$14, %eax
	jbe	.L232
	cmpl	$30, %eax
	jbe	.L233
	movl	%r8d, %ecx
	shrl	$5, %ecx
	vmovdqa	.LC16(%rip), %ymm3
	leaq	(%rsi,%rdx), %r11
	salq	$5, %rcx
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L207:
	vmovdqu	(%rsi,%rax), %ymm2
	vmovdqu	(%r11,%rax), %ymm1
	vpsrlw	$1, %ymm2, %ymm0
	vpand	%ymm0, %ymm3, %ymm0
	vpsubb	%ymm0, %ymm1, %ymm0
	vmovdqu	%ymm0, (%r10,%rax)
	addq	$32, %rax
	cmpq	%rcx, %rax
	jne	.L207
	movl	%r8d, %eax
	andl	$-32, %eax
	leal	(%rax,%r9), %ecx
	cmpl	%eax, %r8d
	je	.L293
	subl	%eax, %r8d
	leal	-1(%r8), %r10d
	cmpl	$14, %r10d
	jbe	.L305
	vzeroupper
.L206:
	movl	%eax, %r10d
	vmovdqu	(%rsi,%r10), %xmm0
	leaq	(%rdx,%r10), %rax
	vpsrlw	$1, %xmm0, %xmm0
	vmovdqu	(%rsi,%rax), %xmm3
	vpand	.LC17(%rip), %xmm0, %xmm0
	vpsubb	%xmm0, %xmm3, %xmm0
	vmovdqu	%xmm0, (%rdi,%rax)
	movl	%r8d, %eax
	andl	$-16, %eax
	addl	%eax, %ecx
	cmpl	%eax, %r8d
	je	.L297
.L210:
	movl	%ecx, %eax
	subl	%r9d, %eax
	cltq
	movzbl	(%rsi,%rax), %edx
	movslq	%ecx, %r8
	movzbl	(%rsi,%r8), %eax
	shrb	%dl
	subl	%edx, %eax
	movb	%al, (%rdi,%r8)
	leal	1(%rcx), %eax
	cmpl	%eax, %r12d
	jle	.L297
	movslq	%eax, %r8
	subl	%r9d, %eax
	cltq
	movzbl	(%rsi,%rax), %edx
	movzbl	(%rsi,%r8), %eax
	shrb	%dl
	subl	%edx, %eax
	movb	%al, (%rdi,%r8)
	leal	2(%rcx), %eax
	cmpl	%eax, %r12d
	jle	.L297
	movslq	%eax, %r8
	subl	%r9d, %eax
	cltq
	movzbl	(%rsi,%rax), %edx
	movzbl	(%rsi,%r8), %eax
	shrb	%dl
	subl	%edx, %eax
	movb	%al, (%rdi,%r8)
	leal	3(%rcx), %eax
	cmpl	%eax, %r12d
	jle	.L297
	movslq	%eax, %r8
	subl	%r9d, %eax
	cltq
	movzbl	(%rsi,%rax), %edx
	movzbl	(%rsi,%r8), %eax
	shrb	%dl
	subl	%edx, %eax
	movb	%al, (%rdi,%r8)
	leal	4(%rcx), %eax
	cmpl	%eax, %r12d
	jle	.L297
	movslq	%eax, %r8
	subl	%r9d, %eax
	cltq
	movzbl	(%rsi,%rax), %edx
	movzbl	(%rsi,%r8), %eax
	shrb	%dl
	subl	%edx, %eax
	movb	%al, (%rdi,%r8)
	leal	5(%rcx), %eax
	cmpl	%eax, %r12d
	jle	.L297
	movslq	%eax, %r8
	subl	%r9d, %eax
	cltq
	movzbl	(%rsi,%rax), %edx
	movzbl	(%rsi,%r8), %eax
	shrb	%dl
	subl	%edx, %eax
	movb	%al, (%rdi,%r8)
	leal	6(%rcx), %eax
	cmpl	%eax, %r12d
	jle	.L297
	movslq	%eax, %r8
	subl	%r9d, %eax
	cltq
	movzbl	(%rsi,%rax), %edx
	movzbl	(%rsi,%r8), %eax
	shrb	%dl
	subl	%edx, %eax
	movb	%al, (%rdi,%r8)
	leal	7(%rcx), %eax
	cmpl	%eax, %r12d
	jle	.L297
	movslq	%eax, %r8
	subl	%r9d, %eax
	cltq
	movzbl	(%rsi,%rax), %edx
	movzbl	(%rsi,%r8), %eax
	shrb	%dl
	subl	%edx, %eax
	movb	%al, (%rdi,%r8)
	leal	8(%rcx), %eax
	cmpl	%eax, %r12d
	jle	.L297
	movslq	%eax, %r8
	subl	%r9d, %eax
	cltq
	movzbl	(%rsi,%rax), %edx
	movzbl	(%rsi,%r8), %eax
	shrb	%dl
	subl	%edx, %eax
	movb	%al, (%rdi,%r8)
	leal	9(%rcx), %eax
	cmpl	%eax, %r12d
	jle	.L297
	movslq	%eax, %r8
	subl	%r9d, %eax
	cltq
	movzbl	(%rsi,%rax), %edx
	movzbl	(%rsi,%r8), %eax
	shrb	%dl
	subl	%edx, %eax
	movb	%al, (%rdi,%r8)
	leal	10(%rcx), %eax
	cmpl	%eax, %r12d
	jle	.L297
	movslq	%eax, %r8
	subl	%r9d, %eax
	cltq
	movzbl	(%rsi,%rax), %edx
	movzbl	(%rsi,%r8), %eax
	shrb	%dl
	subl	%edx, %eax
	movb	%al, (%rdi,%r8)
	leal	11(%rcx), %eax
	cmpl	%eax, %r12d
	jle	.L297
	movslq	%eax, %r8
	subl	%r9d, %eax
	cltq
	movzbl	(%rsi,%rax), %edx
	movzbl	(%rsi,%r8), %eax
	shrb	%dl
	subl	%edx, %eax
	movb	%al, (%rdi,%r8)
	leal	12(%rcx), %eax
	cmpl	%eax, %r12d
	jle	.L297
	movslq	%eax, %r8
	subl	%r9d, %eax
	cltq
	movzbl	(%rsi,%rax), %edx
	movzbl	(%rsi,%r8), %eax
	shrb	%dl
	subl	%edx, %eax
	movb	%al, (%rdi,%r8)
	leal	13(%rcx), %eax
	cmpl	%eax, %r12d
	jle	.L297
	movslq	%eax, %r8
	subl	%r9d, %eax
	cltq
	movzbl	(%rsi,%rax), %edx
	movzbl	(%rsi,%r8), %eax
	shrb	%dl
	subl	%edx, %eax
	addl	$14, %ecx
	movb	%al, (%rdi,%r8)
	cmpl	%ecx, %r12d
	jle	.L297
	movslq	%ecx, %r8
	subl	%r9d, %ecx
	movslq	%ecx, %rax
	movzbl	(%rsi,%rax), %edx
	movzbl	(%rsi,%r8), %eax
	shrb	%dl
	subl	%edx, %eax
	movb	%al, (%rdi,%r8)
	jmp	.L297
.L232:
	movq	%rsi, %r8
	movq	%rdx, %rax
	subq	%rdx, %r8
	.p2align 4,,10
	.p2align 3
.L205:
	movzbl	(%r8,%rax), %ecx
	movzbl	(%rsi,%rax), %edx
	shrb	%cl
	subl	%ecx, %edx
	movb	%dl, (%rdi,%rax)
	incq	%rax
	cmpl	%eax, %r12d
	jg	.L205
	jmp	.L297
.L226:
	movq	%rsi, %r9
	movq	%rsi, %r8
	movq	%rdx, %rax
	subq	%rdx, %r9
	subq	%r13, %r8
	.p2align 4,,10
	.p2align 3
.L186:
	movzbl	(%r8,%rax), %ecx
	movzbl	(%r9,%rax), %edx
	addl	%ecx, %edx
	movzbl	(%rsi,%rax), %ecx
	sarl	%edx
	subl	%edx, %ecx
	movb	%cl, (%rdi,%rax)
	incq	%rax
	cmpl	%eax, %r12d
	jg	.L186
	jmp	.L297
.L228:
	movq	%rsi, %rbx
	subq	%rdx, %rbx
	movq	%rbx, 168(%rsp)
	movq	%rsi, %rbx
	subq	%rcx, %rbx
	movq	%rbx, 136(%rsp)
	subq	%rcx, %r8
	leaq	(%rsi,%r8), %rax
	.p2align 4,,10
	.p2align 3
.L194:
	movq	168(%rsp), %rbx
	movzbl	(%rax,%rcx), %r14d
	movzbl	(%rbx,%rcx), %r9d
	movq	136(%rsp), %rbx
	movl	%r9d, %r13d
	movzbl	(%rbx,%rcx), %ebx
	movl	%r14d, %r12d
	leal	(%rbx,%r9), %edx
	subl	%r14d, %edx
	movl	%edx, %r8d
	subl	%r9d, %r8d
	movl	%r8d, %r9d
	sarl	$31, %r9d
	xorl	%r9d, %r8d
	subl	%r9d, %r8d
	movl	%edx, %r9d
	subl	%r14d, %r9d
	movl	%r9d, %r14d
	sarl	$31, %r14d
	xorl	%r14d, %r9d
	subl	%r14d, %r9d
	cmpl	%r8d, %r9d
	movl	%r8d, %r14d
	cmovle	%r9d, %r14d
	subl	%ebx, %edx
	movl	%ebx, %r11d
	movl	%edx, %ebx
	sarl	$31, %ebx
	xorl	%ebx, %edx
	subl	%ebx, %edx
	movzbl	(%rsi,%rcx), %r10d
	cmpl	%edx, %r14d
	jge	.L204
	cmpl	%r8d, %r9d
	movl	%r12d, %r11d
	cmovge	%r13d, %r11d
.L204:
	subl	%r11d, %r10d
	movb	%r10b, (%rdi,%rcx)
	incq	%rcx
	cmpl	%ecx, %r15d
	jg	.L194
	jmp	.L297
.L178:
	movq	%rsi, %r8
	subq	%r13, %r8
	jmp	.L284
	.p2align 4,,10
	.p2align 3
.L306:
	incq	%rax
.L284:
	movzbl	(%rsi,%rdx), %ecx
	subb	(%r8,%rdx), %cl
	movb	%cl, (%rdi,%rdx)
	movq	%rax, %rdx
	cmpl	%eax, %r12d
	jg	.L306
	jmp	.L297
.L223:
	movq	%rsi, %rcx
	movq	%rdx, %rax
	subq	%rdx, %rcx
	.p2align 4,,10
	.p2align 3
.L170:
	movzbl	(%rsi,%rax), %edx
	subb	(%rcx,%rax), %dl
	movb	%dl, (%rdi,%rax)
	incq	%rax
	cmpl	%eax, %r12d
	jg	.L170
	jmp	.L297
.L234:
	movq	%rsi, %rcx
	movq	%rdx, %rax
	subq	%rdx, %rcx
	.p2align 4,,10
	.p2align 3
.L213:
	movzbl	(%rsi,%rax), %edx
	subb	(%rcx,%rax), %dl
	movb	%dl, (%rdi,%rax)
	incq	%rax
	cmpl	%eax, %r12d
	jg	.L213
	jmp	.L297
.L299:
	vzeroupper
	jmp	.L199
.L229:
	xorl	%eax, %eax
	addq	%rsi, %r8
	addq	%rsi, %r10
	jmp	.L195
.L225:
	xorl	%eax, %eax
	addq	%rsi, %rcx
	jmp	.L179
.L233:
	movl	%r9d, %ecx
	xorl	%eax, %eax
	jmp	.L206
.L227:
	movl	%r9d, %ecx
	xorl	%r8d, %r8d
	addq	%rsi, %r10
	jmp	.L187
.L224:
	movl	%r9d, %ecx
	xorl	%eax, %eax
	jmp	.L171
.L235:
	movl	%r9d, %ecx
	xorl	%eax, %eax
	jmp	.L214
.L301:
	vzeroupper
	jmp	.L218
.L303:
	vzeroupper
	jmp	.L183
.L305:
	vzeroupper
	jmp	.L210
.L302:
	vzeroupper
	jmp	.L175
.L304:
	vzeroupper
	jmp	.L191
.L291:
	vzeroupper
	jmp	.L297
.L295:
	vzeroupper
	jmp	.L297
.L285:
	vzeroupper
	jmp	.L297
.L289:
	vzeroupper
	jmp	.L297
.L287:
	vzeroupper
	jmp	.L297
.L293:
	vzeroupper
	jmp	.L297
	.cfi_endproc
.LFE822:
	.size	stbiw__encode_png_line, .-stbiw__encode_png_line
	.section	.rodata.str1.1
.LC21:
	.string	"stb_image.h"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC22:
	.string	"req_comp >= 1 && req_comp <= 4"
	.section	.rodata.str1.1
.LC23:
	.string	"outofmem"
	.text
	.p2align 4
	.type	stbi__convert_format16, @function
stbi__convert_format16:
.LFB637:
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
	movq	%rdi, %r13
	pushq	%r12
	pushq	%rbx
	andq	$-32, %rsp
	subq	$640, %rsp
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movl	%r8d, 636(%rsp)
	cmpl	%esi, %edx
	je	.L384
	leal	-1(%rdx), %eax
	movl	%edx, %r14d
	cmpl	$3, %eax
	ja	.L620
	movl	%r8d, %edi
	imull	%ecx, %edi
	movl	%esi, %ebx
	movl	%ecx, %r15d
	imull	%edx, %edi
	addl	%edi, %edi
	call	malloc@PLT
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L310
	movl	636(%rsp), %eax
	testl	%eax, %eax
	jle	.L383
	movl	%ebx, %eax
	imull	%r15d, %eax
	leal	-1(%r15), %ecx
	movl	$1, %edi
	movl	%eax, 624(%rsp)
	movl	%r14d, %eax
	imull	%r15d, %eax
	movl	%ecx, 632(%rsp)
	vmovdqa	.LC19(%rip), %ymm12
	movl	%eax, 628(%rsp)
	leal	-2(%r15), %eax
	cmpl	$-1, %eax
	cmovge	%r15d, %edi
	setl	%al
	cmpl	$15, %ecx
	setbe	%dl
	orl	%eax, %edx
	leal	-1(%rdi), %r11d
	movb	%dl, 618(%rsp)
	movl	%r11d, %edx
	shrl	$4, %edx
	leal	-1(%rdx), %esi
	movl	%r11d, 124(%rsp)
	andl	$-16, %r11d
	movl	%ecx, %r15d
	movq	%rsi, %rdx
	subl	%r11d, %ecx
	salq	$7, %rdx
	movl	%ecx, 108(%rsp)
	movl	%r11d, %ecx
	movq	%rdx, 32(%rsp)
	leaq	0(,%rcx,8), %rdx
	movq	%rdx, 48(%rsp)
	leaq	(%rcx,%rcx), %rdx
	movq	%rdx, 24(%rsp)
	addq	%rcx, %rdx
	addq	%rdx, %rdx
	cmpl	$14, %r15d
	movq	%rdx, 16(%rsp)
	setbe	%dl
	orl	%eax, %edx
	movl	%edi, %eax
	shrl	$4, %eax
	movb	%dl, 619(%rsp)
	leal	-1(%rax), %edx
	movq	%rdx, %rax
	salq	$7, %rax
	movl	%edi, 620(%rsp)
	andl	$-16, %edi
	movq	%rax, 40(%rsp)
	movl	%edi, %eax
	subl	%edi, %r15d
	movl	%edi, 612(%rsp)
	leaq	0(,%rax,8), %rdi
	movq	%rdi, 80(%rsp)
	leaq	0(,%rax,4), %rdi
	movq	%rdi, 112(%rsp)
	leaq	(%rax,%rax), %rdi
	addq	%rdi, %rax
	addq	%rax, %rax
	movq	%rax, 96(%rsp)
	movq	%rdx, %rax
	salq	$6, %rax
	movq	%rax, 56(%rsp)
	leaq	0(,%rcx,4), %rax
	movq	%rax, 64(%rsp)
	incq	%rdx
	leaq	1(%rsi), %rax
	movq	%rax, (%rsp)
	salq	$5, %rdx
	salq	$5, %rax
	movl	%r15d, 608(%rsp)
	movq	%rdi, 72(%rsp)
	movq	%rax, 8(%rsp)
	movq	%rdx, 88(%rsp)
	movl	%r11d, 120(%rsp)
	xorl	%r10d, %r10d
	xorl	%r9d, %r9d
	xorl	%r11d, %r11d
	leal	-10(%r14,%rbx,8), %r14d
	.p2align 4,,10
	.p2align 3
.L382:
	movl	%r10d, %r8d
	movl	%r9d, %edi
	leaq	(%r8,%r8), %rsi
	leaq	0(%r13,%rdi,2), %rcx
	leaq	(%r12,%rsi), %rdx
	cmpl	$25, %r14d
	ja	.L312
	leaq	.L314(%rip), %rbx
	movl	%r14d, %eax
	movslq	(%rbx,%rax,4), %rax
	addq	%rbx, %rax
	notrack jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L314:
	.long	.L325-.L314
	.long	.L324-.L314
	.long	.L323-.L314
	.long	.L312-.L314
	.long	.L312-.L314
	.long	.L312-.L314
	.long	.L312-.L314
	.long	.L322-.L314
	.long	.L312-.L314
	.long	.L321-.L314
	.long	.L320-.L314
	.long	.L312-.L314
	.long	.L312-.L314
	.long	.L312-.L314
	.long	.L312-.L314
	.long	.L319-.L314
	.long	.L318-.L314
	.long	.L312-.L314
	.long	.L317-.L314
	.long	.L312-.L314
	.long	.L312-.L314
	.long	.L312-.L314
	.long	.L312-.L314
	.long	.L316-.L314
	.long	.L315-.L314
	.long	.L313-.L314
	.text
	.p2align 4,,10
	.p2align 3
.L313:
	movl	632(%rsp), %eax
	testl	%eax, %eax
	js	.L326
	cmpb	$0, 618(%rsp)
	jne	.L395
	movq	32(%rsp), %rbx
	movq	%rcx, %rax
	movq	%rdx, %rsi
	leaq	128(%rcx,%rbx), %rbx
	.p2align 4,,10
	.p2align 3
.L380:
	vmovdqu	96(%rax), %ymm1
	vmovdqu	64(%rax), %ymm2
	vpshufb	.LC83(%rip), %ymm1, %ymm4
	vpshufb	.LC82(%rip), %ymm2, %ymm3
	vpermq	$78, %ymm4, %ymm4
	vpshufb	.LC84(%rip), %ymm1, %ymm1
	vpor	%ymm4, %ymm1, %ymm1
	vpermq	$78, %ymm3, %ymm3
	vpor	%ymm1, %ymm3, %ymm3
	vmovdqu	(%rax), %ymm1
	vmovdqu	32(%rax), %ymm0
	vpshufb	.LC85(%rip), %ymm1, %ymm5
	vpshufb	.LC86(%rip), %ymm0, %ymm4
	vpermq	$78, %ymm5, %ymm5
	vpshufb	.LC87(%rip), %ymm1, %ymm1
	vpermq	$78, %ymm4, %ymm4
	vpor	%ymm5, %ymm1, %ymm1
	vpor	%ymm4, %ymm1, %ymm1
	vmovdqu	%ymm1, (%rsi)
	vpshufb	.LC88(%rip), %ymm0, %ymm4
	vpshufb	.LC89(%rip), %ymm2, %ymm1
	vpermq	$78, %ymm4, %ymm4
	vpermq	$78, %ymm1, %ymm1
	vpshufb	.LC83(%rip), %ymm0, %ymm0
	vpshufb	.LC85(%rip), %ymm2, %ymm2
	vpor	%ymm4, %ymm0, %ymm0
	vpor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	subq	$-128, %rax
	vmovdqu	%ymm0, 32(%rsi)
	vmovdqu	%ymm3, 64(%rsi)
	addq	$96, %rsi
	cmpq	%rax, %rbx
	jne	.L380
	movl	120(%rsp), %esi
	movl	108(%rsp), %ebx
	addq	48(%rsp), %rcx
	addq	16(%rsp), %rdx
.L379:
	movl	124(%rsp), %eax
	subl	%esi, %eax
	cmpl	$7, %eax
	jbe	.L381
	leaq	(%rdi,%rsi,4), %rdi
	leaq	0(%r13,%rdi,2), %rdi
	vmovdqu	32(%rdi), %xmm2
	vmovdqu	48(%rdi), %xmm5
	vpshufb	.LC90(%rip), %xmm2, %xmm3
	vpshufb	.LC91(%rip), %xmm5, %xmm1
	vmovdqu	16(%rdi), %xmm0
	vpor	%xmm1, %xmm3, %xmm3
	vmovdqu	(%rdi), %xmm1
	leaq	(%rsi,%rsi,2), %rsi
	andl	$-8, %eax
	vpshufb	.LC93(%rip), %xmm0, %xmm4
	addq	%r8, %rsi
	vpshufb	.LC92(%rip), %xmm1, %xmm1
	vpshufb	.LC94(%rip), %xmm0, %xmm0
	vpshufb	.LC95(%rip), %xmm2, %xmm2
	leaq	(%r12,%rsi,2), %rsi
	vpor	%xmm4, %xmm1, %xmm1
	vpor	%xmm2, %xmm0, %xmm0
	subl	%eax, %ebx
	leaq	(%rcx,%rax,8), %rcx
	leaq	(%rax,%rax,2), %rax
	vmovdqu	%xmm1, (%rsi)
	vmovdqu	%xmm0, 16(%rsi)
	vmovdqu	%xmm3, 32(%rsi)
	leaq	(%rdx,%rax,2), %rdx
.L381:
	movzwl	(%rcx), %eax
	movw	%ax, (%rdx)
	movzwl	2(%rcx), %eax
	movw	%ax, 2(%rdx)
	movzwl	4(%rcx), %eax
	movw	%ax, 4(%rdx)
	testl	%ebx, %ebx
	je	.L326
	movzwl	8(%rcx), %eax
	movw	%ax, 6(%rdx)
	movzwl	10(%rcx), %eax
	movw	%ax, 8(%rdx)
	movzwl	12(%rcx), %eax
	movw	%ax, 10(%rdx)
	cmpl	$1, %ebx
	je	.L326
	movzwl	16(%rcx), %eax
	movw	%ax, 12(%rdx)
	movzwl	18(%rcx), %eax
	movw	%ax, 14(%rdx)
	movzwl	20(%rcx), %eax
	movw	%ax, 16(%rdx)
	cmpl	$2, %ebx
	je	.L326
	movzwl	24(%rcx), %eax
	movw	%ax, 18(%rdx)
	movzwl	26(%rcx), %eax
	movw	%ax, 20(%rdx)
	movzwl	28(%rcx), %eax
	movw	%ax, 22(%rdx)
	cmpl	$3, %ebx
	je	.L326
	movzwl	32(%rcx), %eax
	movw	%ax, 24(%rdx)
	movzwl	34(%rcx), %eax
	movw	%ax, 26(%rdx)
	movzwl	36(%rcx), %eax
	movw	%ax, 28(%rdx)
	cmpl	$4, %ebx
	je	.L326
	movzwl	40(%rcx), %eax
	movw	%ax, 30(%rdx)
	movzwl	42(%rcx), %eax
	movw	%ax, 32(%rdx)
	movzwl	44(%rcx), %eax
	movw	%ax, 34(%rdx)
	cmpl	$5, %ebx
	je	.L326
	movzwl	48(%rcx), %eax
	movw	%ax, 36(%rdx)
	movzwl	50(%rcx), %eax
	movw	%ax, 38(%rdx)
	movzwl	52(%rcx), %eax
	movw	%ax, 40(%rdx)
	cmpl	$6, %ebx
	je	.L326
	movzwl	56(%rcx), %eax
	movw	%ax, 42(%rdx)
	movzwl	58(%rcx), %eax
	movw	%ax, 44(%rdx)
	movzwl	60(%rcx), %eax
	movw	%ax, 46(%rdx)
	.p2align 4,,10
	.p2align 3
.L326:
	incl	%r11d
	addl	624(%rsp), %r9d
	addl	628(%rsp), %r10d
	cmpl	636(%rsp), %r11d
	jne	.L382
	vzeroupper
.L383:
	movq	%r13, %rdi
	call	free@PLT
.L307:
	leaq	-40(%rbp), %rsp
	popq	%rbx
	movq	%r12, %rax
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L315:
	.cfi_restore_state
	movl	632(%rsp), %esi
	testl	%esi, %esi
	js	.L326
	cmpb	$0, 619(%rsp)
	jne	.L394
	movq	40(%rsp), %rbx
	vmovdqa	.LC68(%rip), %ymm5
	vmovdqa	.LC69(%rip), %ymm4
	movq	%rcx, %rax
	movq	%rdx, %rsi
	leaq	128(%rcx,%rbx), %rbx
	.p2align 4,,10
	.p2align 3
.L374:
	vmovdqu	(%rax), %ymm0
	vmovdqu	32(%rax), %ymm3
	vmovdqu	64(%rax), %ymm2
	vmovdqu	96(%rax), %ymm6
	vpand	%ymm3, %ymm12, %ymm7
	vpand	%ymm0, %ymm12, %ymm1
	vpsrld	$16, %ymm3, %ymm3
	vpsrld	$16, %ymm0, %ymm0
	vpackusdw	%ymm3, %ymm0, %ymm0
	vpermq	$216, %ymm0, %ymm3
	vpackusdw	%ymm7, %ymm1, %ymm1
	vpand	%ymm2, %ymm12, %ymm0
	vpand	%ymm6, %ymm12, %ymm7
	vpackusdw	%ymm7, %ymm0, %ymm0
	vpermq	$216, %ymm1, %ymm1
	vpermq	$216, %ymm0, %ymm0
	vpsrld	$16, %ymm6, %ymm6
	vpsrld	$16, %ymm2, %ymm2
	vpackusdw	%ymm6, %ymm2, %ymm2
	vpand	%ymm1, %ymm12, %ymm7
	vpand	%ymm0, %ymm12, %ymm6
	vpsrld	$16, %ymm1, %ymm1
	vpsrld	$16, %ymm0, %ymm0
	vpackusdw	%ymm0, %ymm1, %ymm1
	vpermq	$216, %ymm2, %ymm2
	vpand	%ymm2, %ymm12, %ymm0
	vpackusdw	%ymm6, %ymm7, %ymm7
	vpermq	$216, %ymm1, %ymm6
	vpand	%ymm3, %ymm12, %ymm1
	vpackusdw	%ymm0, %ymm1, %ymm1
	vpsrld	$16, %ymm2, %ymm2
	vpsrld	$16, %ymm3, %ymm0
	vpermq	$216, %ymm7, %ymm7
	vpermq	$216, %ymm1, %ymm1
	vpackusdw	%ymm2, %ymm0, %ymm0
	vpermq	$216, %ymm0, %ymm2
	vpmullw	.LC67(%rip), %ymm7, %ymm9
	vpmulhuw	.LC67(%rip), %ymm7, %ymm0
	vpmullw	%ymm1, %ymm5, %ymm7
	vpmulhuw	%ymm5, %ymm1, %ymm1
	vpunpcklwd	%ymm0, %ymm9, %ymm8
	vpunpckhwd	%ymm0, %ymm9, %ymm9
	vperm2i128	$32, %ymm9, %ymm8, %ymm3
	vpmullw	%ymm6, %ymm4, %ymm11
	vpunpcklwd	%ymm1, %ymm7, %ymm0
	vpunpckhwd	%ymm1, %ymm7, %ymm7
	vperm2i128	$32, %ymm7, %ymm0, %ymm1
	vpaddd	%ymm3, %ymm1, %ymm1
	vpmulhuw	%ymm4, %ymm6, %ymm3
	vperm2i128	$49, %ymm7, %ymm0, %ymm0
	subq	$-128, %rax
	addq	$64, %rsi
	vpunpcklwd	%ymm3, %ymm11, %ymm10
	vpunpckhwd	%ymm3, %ymm11, %ymm3
	vperm2i128	$32, %ymm3, %ymm10, %ymm6
	vpaddd	%ymm6, %ymm1, %ymm1
	vperm2i128	$49, %ymm9, %ymm8, %ymm6
	vpaddd	%ymm6, %ymm0, %ymm0
	vperm2i128	$49, %ymm3, %ymm10, %ymm3
	vpaddd	%ymm3, %ymm0, %ymm0
	vpsrad	$8, %ymm1, %ymm1
	vpsrad	$8, %ymm0, %ymm0
	vpand	%ymm1, %ymm12, %ymm1
	vpand	%ymm0, %ymm12, %ymm0
	vpackusdw	%ymm0, %ymm1, %ymm0
	vpermq	$216, %ymm0, %ymm0
	vpunpcklwd	%ymm2, %ymm0, %ymm1
	vpunpckhwd	%ymm2, %ymm0, %ymm0
	vperm2i128	$32, %ymm0, %ymm1, %ymm2
	vperm2i128	$49, %ymm0, %ymm1, %ymm1
	vmovdqu	%ymm2, -64(%rsi)
	vmovdqu	%ymm1, -32(%rsi)
	cmpq	%rbx, %rax
	jne	.L374
	movl	612(%rsp), %eax
	movl	620(%rsp), %ebx
	addq	80(%rsp), %rcx
	addq	112(%rsp), %rdx
	cmpl	%ebx, %eax
	je	.L326
	movl	608(%rsp), %esi
.L373:
	subl	%eax, %ebx
	leal	-1(%rbx), %r15d
	cmpl	$6, %r15d
	jbe	.L377
	leaq	(%rdi,%rax,4), %rdi
	leaq	0(%r13,%rdi,2), %rdi
	vmovdqa	.LC20(%rip), %xmm1
	vmovdqu	(%rdi), %xmm3
	vmovdqu	16(%rdi), %xmm2
	vmovdqu	32(%rdi), %xmm0
	vmovdqu	48(%rdi), %xmm5
	vpand	%xmm2, %xmm1, %xmm6
	vpand	%xmm3, %xmm1, %xmm4
	vpsrld	$16, %xmm2, %xmm2
	vpsrld	$16, %xmm3, %xmm3
	vpackusdw	%xmm6, %xmm4, %xmm4
	vpackusdw	%xmm2, %xmm3, %xmm3
	vpand	%xmm5, %xmm1, %xmm6
	vpand	%xmm0, %xmm1, %xmm2
	vpackusdw	%xmm6, %xmm2, %xmm2
	vpsrld	$16, %xmm5, %xmm5
	vpsrld	$16, %xmm0, %xmm0
	vpackusdw	%xmm5, %xmm0, %xmm0
	vpand	%xmm4, %xmm1, %xmm7
	vpand	%xmm2, %xmm1, %xmm5
	vpsrld	$16, %xmm4, %xmm4
	vpsrld	$16, %xmm2, %xmm2
	vpackusdw	%xmm2, %xmm4, %xmm4
	vpand	%xmm3, %xmm1, %xmm6
	vpand	%xmm0, %xmm1, %xmm2
	vpsrld	$16, %xmm3, %xmm3
	vpsrld	$16, %xmm0, %xmm0
	vpackusdw	%xmm0, %xmm3, %xmm3
	vmovdqa	.LC79(%rip), %xmm0
	vpackusdw	%xmm5, %xmm7, %xmm7
	vpmullw	%xmm0, %xmm7, %xmm5
	vpmulhuw	%xmm0, %xmm7, %xmm7
	vmovdqa	.LC80(%rip), %xmm0
	vpackusdw	%xmm2, %xmm6, %xmm6
	vpmullw	%xmm0, %xmm6, %xmm2
	vpmulhuw	%xmm0, %xmm6, %xmm6
	vmovdqa	.LC81(%rip), %xmm9
	vpunpcklwd	%xmm7, %xmm5, %xmm8
	vpunpckhwd	%xmm7, %xmm5, %xmm5
	leaq	(%r8,%rax,2), %rax
	vpunpcklwd	%xmm6, %xmm2, %xmm0
	vpaddd	%xmm8, %xmm0, %xmm0
	vpmullw	%xmm9, %xmm4, %xmm8
	vpmulhuw	%xmm9, %xmm4, %xmm4
	vpunpckhwd	%xmm6, %xmm2, %xmm2
	vpaddd	%xmm5, %xmm2, %xmm2
	leaq	(%r12,%rax,2), %rax
	vpunpcklwd	%xmm4, %xmm8, %xmm9
	vpunpckhwd	%xmm4, %xmm8, %xmm4
	vpaddd	%xmm9, %xmm0, %xmm0
	vpaddd	%xmm4, %xmm2, %xmm2
	vpsrad	$8, %xmm0, %xmm0
	vpsrad	$8, %xmm2, %xmm2
	vpand	%xmm0, %xmm1, %xmm0
	vpand	%xmm2, %xmm1, %xmm1
	vpackusdw	%xmm1, %xmm0, %xmm0
	vpunpcklwd	%xmm3, %xmm0, %xmm1
	vpunpckhwd	%xmm3, %xmm0, %xmm0
	vmovdqu	%xmm1, (%rax)
	vmovdqu	%xmm0, 16(%rax)
	movl	%ebx, %eax
	andl	$-8, %eax
	movl	%eax, %edi
	subl	%eax, %esi
	leaq	(%rcx,%rdi,8), %rcx
	leaq	(%rdx,%rdi,4), %rdx
	cmpl	%eax, %ebx
	je	.L326
.L377:
	movzwl	(%rcx), %eax
	movzwl	2(%rcx), %edi
	imull	$77, %eax, %eax
	imull	$150, %edi, %edi
	addl	%edi, %eax
	movzwl	4(%rcx), %edi
	imull	$29, %edi, %edi
	addl	%edi, %eax
	sarl	$8, %eax
	movw	%ax, (%rdx)
	movzwl	6(%rcx), %eax
	movw	%ax, 2(%rdx)
	testl	%esi, %esi
	je	.L326
	movzwl	8(%rcx), %eax
	movzwl	10(%rcx), %edi
	imull	$77, %eax, %eax
	imull	$150, %edi, %edi
	addl	%edi, %eax
	movzwl	12(%rcx), %edi
	imull	$29, %edi, %edi
	addl	%edi, %eax
	sarl	$8, %eax
	movw	%ax, 4(%rdx)
	movzwl	14(%rcx), %eax
	movw	%ax, 6(%rdx)
	cmpl	$1, %esi
	je	.L326
	movzwl	16(%rcx), %eax
	movzwl	18(%rcx), %edi
	imull	$77, %eax, %eax
	imull	$150, %edi, %edi
	addl	%edi, %eax
	movzwl	20(%rcx), %edi
	imull	$29, %edi, %edi
	addl	%edi, %eax
	sarl	$8, %eax
	movw	%ax, 8(%rdx)
	movzwl	22(%rcx), %eax
	movw	%ax, 10(%rdx)
	cmpl	$2, %esi
	je	.L326
	movzwl	24(%rcx), %eax
	movzwl	26(%rcx), %edi
	imull	$77, %eax, %eax
	imull	$150, %edi, %edi
	addl	%edi, %eax
	movzwl	28(%rcx), %edi
	imull	$29, %edi, %edi
	addl	%edi, %eax
	sarl	$8, %eax
	movw	%ax, 12(%rdx)
	movzwl	30(%rcx), %eax
	movw	%ax, 14(%rdx)
	cmpl	$3, %esi
	je	.L326
	movzwl	32(%rcx), %eax
	movzwl	34(%rcx), %edi
	imull	$77, %eax, %eax
	imull	$150, %edi, %edi
	addl	%edi, %eax
	movzwl	36(%rcx), %edi
	imull	$29, %edi, %edi
	addl	%edi, %eax
	sarl	$8, %eax
	movw	%ax, 16(%rdx)
	movzwl	38(%rcx), %eax
	movw	%ax, 18(%rdx)
	cmpl	$4, %esi
	je	.L326
	movzwl	40(%rcx), %eax
	movzwl	42(%rcx), %edi
	imull	$77, %eax, %eax
	imull	$150, %edi, %edi
	addl	%edi, %eax
	movzwl	44(%rcx), %edi
	imull	$29, %edi, %edi
	addl	%edi, %eax
	sarl	$8, %eax
	movw	%ax, 20(%rdx)
	movzwl	46(%rcx), %eax
	movw	%ax, 22(%rdx)
	cmpl	$5, %esi
	je	.L326
	movzwl	48(%rcx), %eax
	movzwl	50(%rcx), %esi
	imull	$77, %eax, %eax
	imull	$150, %esi, %esi
	addl	%esi, %eax
	movzwl	52(%rcx), %esi
	imull	$29, %esi, %esi
	addl	%esi, %eax
	sarl	$8, %eax
	movw	%ax, 24(%rdx)
	movzwl	54(%rcx), %eax
	movw	%ax, 26(%rdx)
	jmp	.L326
	.p2align 4,,10
	.p2align 3
.L316:
	movl	632(%rsp), %ebx
	testl	%ebx, %ebx
	js	.L326
	cmpb	$0, 618(%rsp)
	jne	.L393
	movq	32(%rsp), %rbx
	vmovdqa	.LC19(%rip), %ymm1
	vmovdqa	.LC67(%rip), %ymm6
	vmovdqa	.LC68(%rip), %ymm5
	vmovdqa	.LC69(%rip), %ymm4
	movq	%rcx, %rax
	movq	%rdx, %rsi
	leaq	128(%rcx,%rbx), %rbx
	.p2align 4,,10
	.p2align 3
.L371:
	vmovdqu	(%rax), %ymm0
	vmovdqu	32(%rax), %ymm10
	vmovdqu	64(%rax), %ymm3
	vmovdqu	96(%rax), %ymm9
	vpand	%ymm10, %ymm1, %ymm7
	vpand	%ymm0, %ymm1, %ymm2
	vpackusdw	%ymm7, %ymm2, %ymm2
	vpand	%ymm3, %ymm1, %ymm8
	vpand	%ymm9, %ymm1, %ymm7
	vpsrld	$16, %ymm10, %ymm10
	vpsrld	$16, %ymm9, %ymm9
	vpsrld	$16, %ymm0, %ymm0
	vpsrld	$16, %ymm3, %ymm3
	vpackusdw	%ymm10, %ymm0, %ymm0
	vpackusdw	%ymm9, %ymm3, %ymm3
	vpermq	$216, %ymm0, %ymm0
	vpermq	$216, %ymm3, %ymm3
	vpand	%ymm3, %ymm1, %ymm3
	vpand	%ymm0, %ymm1, %ymm0
	vpackusdw	%ymm7, %ymm8, %ymm8
	vpackusdw	%ymm3, %ymm0, %ymm0
	vpermq	$216, %ymm2, %ymm2
	vpermq	$216, %ymm8, %ymm8
	vpermq	$216, %ymm0, %ymm0
	vpmullw	%ymm0, %ymm5, %ymm3
	vpand	%ymm8, %ymm1, %ymm11
	vpmulhuw	%ymm5, %ymm0, %ymm0
	vpand	%ymm2, %ymm1, %ymm7
	vpackusdw	%ymm11, %ymm7, %ymm7
	vpermq	$216, %ymm7, %ymm7
	vpsrld	$16, %ymm8, %ymm8
	vpsrld	$16, %ymm2, %ymm2
	vpmullw	%ymm7, %ymm6, %ymm9
	vpackusdw	%ymm8, %ymm2, %ymm2
	vpmulhuw	%ymm6, %ymm7, %ymm7
	vpermq	$216, %ymm2, %ymm2
	vpunpcklwd	%ymm0, %ymm3, %ymm8
	vpunpckhwd	%ymm0, %ymm3, %ymm0
	vpmullw	%ymm2, %ymm4, %ymm3
	vpmulhuw	%ymm4, %ymm2, %ymm2
	vpunpcklwd	%ymm7, %ymm9, %ymm10
	vpunpckhwd	%ymm7, %ymm9, %ymm9
	vperm2i128	$32, %ymm9, %ymm10, %ymm11
	vperm2i128	$32, %ymm0, %ymm8, %ymm7
	vpaddd	%ymm11, %ymm7, %ymm7
	vperm2i128	$49, %ymm9, %ymm10, %ymm10
	vpunpcklwd	%ymm2, %ymm3, %ymm11
	vperm2i128	$49, %ymm0, %ymm8, %ymm0
	vpunpckhwd	%ymm2, %ymm3, %ymm3
	vperm2i128	$32, %ymm3, %ymm11, %ymm2
	vpaddd	%ymm10, %ymm0, %ymm0
	vperm2i128	$49, %ymm3, %ymm11, %ymm11
	vpaddd	%ymm2, %ymm7, %ymm2
	vpaddd	%ymm11, %ymm0, %ymm0
	vpsrad	$8, %ymm2, %ymm2
	vpsrad	$8, %ymm0, %ymm0
	vpand	%ymm2, %ymm1, %ymm2
	vpand	%ymm0, %ymm1, %ymm0
	vpackusdw	%ymm0, %ymm2, %ymm0
	vpermq	$216, %ymm0, %ymm0
	subq	$-128, %rax
	vmovdqu	%ymm0, (%rsi)
	addq	$32, %rsi
	cmpq	%rax, %rbx
	jne	.L371
	movl	120(%rsp), %esi
	movl	108(%rsp), %ebx
	addq	48(%rsp), %rcx
	addq	24(%rsp), %rdx
.L370:
	movl	124(%rsp), %eax
	subl	%esi, %eax
	cmpl	$7, %eax
	jbe	.L372
	leaq	(%rdi,%rsi,4), %rdi
	leaq	0(%r13,%rdi,2), %rdi
	vmovdqa	.LC20(%rip), %xmm2
	vmovdqu	(%rdi), %xmm1
	vmovdqu	16(%rdi), %xmm6
	vmovdqu	32(%rdi), %xmm7
	vmovdqu	48(%rdi), %xmm4
	vpand	%xmm6, %xmm2, %xmm0
	vpand	%xmm1, %xmm2, %xmm3
	vpackusdw	%xmm0, %xmm3, %xmm3
	vpand	%xmm4, %xmm2, %xmm5
	vpand	%xmm7, %xmm2, %xmm0
	vpackusdw	%xmm5, %xmm0, %xmm0
	vpand	%xmm0, %xmm2, %xmm8
	vpand	%xmm3, %xmm2, %xmm5
	vpsrld	$16, %xmm0, %xmm0
	vpsrld	$16, %xmm3, %xmm3
	vpackusdw	%xmm0, %xmm3, %xmm3
	vpsrld	$16, %xmm6, %xmm6
	vpsrld	$16, %xmm1, %xmm0
	vpsrld	$16, %xmm4, %xmm4
	vpsrld	$16, %xmm7, %xmm1
	vpackusdw	%xmm6, %xmm0, %xmm0
	vpackusdw	%xmm4, %xmm1, %xmm1
	vpand	%xmm1, %xmm2, %xmm1
	vpand	%xmm0, %xmm2, %xmm0
	vpackusdw	%xmm1, %xmm0, %xmm0
	vmovdqa	.LC79(%rip), %xmm6
	vmovdqa	.LC80(%rip), %xmm1
	vpackusdw	%xmm8, %xmm5, %xmm5
	vpmullw	%xmm6, %xmm5, %xmm4
	vpmulhuw	%xmm6, %xmm5, %xmm6
	vpmullw	%xmm1, %xmm0, %xmm5
	vpmulhuw	%xmm1, %xmm0, %xmm0
	vmovdqa	.LC81(%rip), %xmm8
	andl	$-8, %eax
	vpunpcklwd	%xmm6, %xmm4, %xmm7
	vpunpckhwd	%xmm6, %xmm4, %xmm4
	vpunpcklwd	%xmm0, %xmm5, %xmm1
	vpaddd	%xmm7, %xmm1, %xmm1
	vpmullw	%xmm8, %xmm3, %xmm7
	vpmulhuw	%xmm8, %xmm3, %xmm3
	vpunpckhwd	%xmm0, %xmm5, %xmm0
	vpaddd	%xmm4, %xmm0, %xmm0
	addq	%r8, %rsi
	subl	%eax, %ebx
	vpunpcklwd	%xmm3, %xmm7, %xmm8
	vpunpckhwd	%xmm3, %xmm7, %xmm3
	vpaddd	%xmm8, %xmm1, %xmm1
	vpaddd	%xmm3, %xmm0, %xmm0
	vpsrad	$8, %xmm1, %xmm1
	vpsrad	$8, %xmm0, %xmm0
	vpand	%xmm1, %xmm2, %xmm1
	vpand	%xmm0, %xmm2, %xmm0
	vpackusdw	%xmm0, %xmm1, %xmm0
	vmovdqu	%xmm0, (%r12,%rsi,2)
	leaq	(%rcx,%rax,8), %rcx
	leaq	(%rdx,%rax,2), %rdx
.L372:
	movzwl	(%rcx), %eax
	movzwl	2(%rcx), %esi
	imull	$77, %eax, %eax
	imull	$150, %esi, %esi
	addl	%esi, %eax
	movzwl	4(%rcx), %esi
	imull	$29, %esi, %esi
	addl	%esi, %eax
	sarl	$8, %eax
	movw	%ax, (%rdx)
	testl	%ebx, %ebx
	je	.L326
	movzwl	8(%rcx), %eax
	movzwl	10(%rcx), %esi
	imull	$77, %eax, %eax
	imull	$150, %esi, %esi
	addl	%esi, %eax
	movzwl	12(%rcx), %esi
	imull	$29, %esi, %esi
	addl	%esi, %eax
	sarl	$8, %eax
	movw	%ax, 2(%rdx)
	cmpl	$1, %ebx
	je	.L326
	movzwl	16(%rcx), %eax
	movzwl	18(%rcx), %esi
	imull	$77, %eax, %eax
	imull	$150, %esi, %esi
	addl	%esi, %eax
	movzwl	20(%rcx), %esi
	imull	$29, %esi, %esi
	addl	%esi, %eax
	sarl	$8, %eax
	movw	%ax, 4(%rdx)
	cmpl	$2, %ebx
	je	.L326
	movzwl	24(%rcx), %eax
	movzwl	26(%rcx), %esi
	imull	$77, %eax, %eax
	imull	$150, %esi, %esi
	addl	%esi, %eax
	movzwl	28(%rcx), %esi
	imull	$29, %esi, %esi
	addl	%esi, %eax
	sarl	$8, %eax
	movw	%ax, 6(%rdx)
	cmpl	$3, %ebx
	je	.L326
	movzwl	32(%rcx), %eax
	movzwl	34(%rcx), %esi
	imull	$77, %eax, %eax
	imull	$150, %esi, %esi
	addl	%esi, %eax
	movzwl	36(%rcx), %esi
	imull	$29, %esi, %esi
	addl	%esi, %eax
	sarl	$8, %eax
	movw	%ax, 8(%rdx)
	cmpl	$4, %ebx
	je	.L326
	movzwl	40(%rcx), %eax
	movzwl	42(%rcx), %esi
	imull	$77, %eax, %eax
	imull	$150, %esi, %esi
	addl	%esi, %eax
	movzwl	44(%rcx), %esi
	imull	$29, %esi, %esi
	addl	%esi, %eax
	sarl	$8, %eax
	movw	%ax, 10(%rdx)
	cmpl	$5, %ebx
	je	.L326
	movzwl	48(%rcx), %eax
	movzwl	50(%rcx), %esi
	imull	$77, %eax, %eax
	imull	$150, %esi, %esi
	addl	%esi, %eax
	movzwl	52(%rcx), %esi
	imull	$29, %esi, %esi
	addl	%esi, %eax
	sarl	$8, %eax
	movw	%ax, 12(%rdx)
	cmpl	$6, %ebx
	je	.L326
	movzwl	56(%rcx), %esi
	movzwl	58(%rcx), %eax
	movzwl	60(%rcx), %ecx
	imull	$77, %esi, %esi
	imull	$150, %eax, %eax
	imull	$29, %ecx, %ecx
	addl	%esi, %eax
	addl	%ecx, %eax
	sarl	$8, %eax
	movw	%ax, 14(%rdx)
	jmp	.L326
	.p2align 4,,10
	.p2align 3
.L317:
	movl	632(%rsp), %eax
	testl	%eax, %eax
	js	.L326
	cmpb	$0, 619(%rsp)
	jne	.L390
	movq	40(%rsp), %r15
	movq	%rcx, %rbx
	movq	%rdx, %rax
	leaq	6(%r12,%rsi), %rsi
	leaq	128(%rdx,%r15), %r15
	.p2align 4,,10
	.p2align 3
.L353:
	vmovdqu	(%rbx), %ymm2
	vmovdqu	32(%rbx), %ymm1
	vmovdqu	64(%rbx), %ymm0
	vpextrw	$0, %xmm2, (%rax)
	vpextrw	$1, %xmm2, 2(%rax)
	vpextrw	$2, %xmm2, 4(%rax)
	vpextrw	$3, %xmm2, 8(%rax)
	vpextrw	$4, %xmm2, 10(%rax)
	vpextrw	$5, %xmm2, 12(%rax)
	vpextrw	$6, %xmm2, 16(%rax)
	vpextrw	$7, %xmm2, 18(%rax)
	vpextrw	$0, %xmm1, 42(%rax)
	vextracti128	$0x1, %ymm2, %xmm2
	vpextrw	$1, %xmm1, 44(%rax)
	vpextrw	$2, %xmm1, 48(%rax)
	vpextrw	$3, %xmm1, 50(%rax)
	vpextrw	$4, %xmm1, 52(%rax)
	vpextrw	$5, %xmm1, 56(%rax)
	vpextrw	$6, %xmm1, 58(%rax)
	vpextrw	$7, %xmm1, 60(%rax)
	vextracti128	$0x1, %ymm1, %xmm1
	vpextrw	$0, %xmm2, 20(%rax)
	vpextrw	$1, %xmm2, 24(%rax)
	vpextrw	$2, %xmm2, 26(%rax)
	vpextrw	$3, %xmm2, 28(%rax)
	vpextrw	$4, %xmm2, 32(%rax)
	vpextrw	$5, %xmm2, 34(%rax)
	vpextrw	$6, %xmm2, 36(%rax)
	vpextrw	$7, %xmm2, 40(%rax)
	vpextrw	$0, %xmm1, 64(%rax)
	vpextrw	$1, %xmm1, 66(%rax)
	vpextrw	$2, %xmm1, 68(%rax)
	vpextrw	$3, %xmm1, 72(%rax)
	vpextrw	$4, %xmm1, 74(%rax)
	vpextrw	$5, %xmm1, 76(%rax)
	vpextrw	$0, %xmm0, 84(%rax)
	vpextrw	$1, %xmm0, 88(%rax)
	vpextrw	$2, %xmm0, 90(%rax)
	vpextrw	$3, %xmm0, 92(%rax)
	vpextrw	$4, %xmm0, 96(%rax)
	vpextrw	$5, %xmm0, 98(%rax)
	vpextrw	$6, %xmm0, 100(%rax)
	vpextrw	$7, %xmm0, 104(%rax)
	vextracti128	$0x1, %ymm0, %xmm0
	vpextrw	$6, %xmm1, 80(%rax)
	vpextrw	$7, %xmm1, 82(%rax)
	vpextrw	$0, %xmm0, 106(%rax)
	vpextrw	$1, %xmm0, 108(%rax)
	vpextrw	$2, %xmm0, 112(%rax)
	vpextrw	$3, %xmm0, 114(%rax)
	vpextrw	$4, %xmm0, 116(%rax)
	vpextrw	$5, %xmm0, 120(%rax)
	vpextrw	$6, %xmm0, 122(%rax)
	vpextrw	$7, %xmm0, 124(%rax)
	subq	$-128, %rax
	movw	$-1, (%rsi)
	movw	$-1, 8(%rsi)
	movw	$-1, 16(%rsi)
	movw	$-1, 24(%rsi)
	movw	$-1, 32(%rsi)
	movw	$-1, 40(%rsi)
	movw	$-1, 48(%rsi)
	movw	$-1, 56(%rsi)
	movw	$-1, 64(%rsi)
	movw	$-1, 72(%rsi)
	movw	$-1, 80(%rsi)
	movw	$-1, 88(%rsi)
	movw	$-1, 96(%rsi)
	movw	$-1, 104(%rsi)
	addq	$96, %rbx
	movw	$-1, 112(%rsi)
	movw	$-1, 120(%rsi)
	subq	$-128, %rsi
	cmpq	%r15, %rax
	jne	.L353
	movl	612(%rsp), %eax
	movl	620(%rsp), %ebx
	addq	96(%rsp), %rcx
	addq	80(%rsp), %rdx
	cmpl	%ebx, %eax
	je	.L326
	movl	608(%rsp), %esi
.L352:
	subl	%eax, %ebx
	leal	-1(%rbx), %r15d
	cmpl	$6, %r15d
	jbe	.L356
	leaq	(%rax,%rax,2), %r15
	addq	%rdi, %r15
	leaq	0(%r13,%r15,2), %rdi
	vmovdqu	(%rdi), %xmm2
	vmovdqu	16(%rdi), %xmm1
	vmovdqu	32(%rdi), %xmm0
	leaq	(%r8,%rax,4), %rax
	addq	%rax, %rax
	leaq	6(%r12,%rax), %r8
	vpextrw	$0, %xmm2, (%r12,%rax)
	vpextrw	$1, %xmm2, 2(%r12,%rax)
	vpextrw	$2, %xmm2, 4(%r12,%rax)
	vpextrw	$3, %xmm2, 8(%r12,%rax)
	vpextrw	$4, %xmm2, 10(%r12,%rax)
	vpextrw	$5, %xmm2, 12(%r12,%rax)
	vpextrw	$6, %xmm2, 16(%r12,%rax)
	vpextrw	$7, %xmm2, 18(%r12,%rax)
	vpextrw	$0, %xmm1, 20(%r12,%rax)
	vpextrw	$1, %xmm1, 24(%r12,%rax)
	vpextrw	$2, %xmm1, 26(%r12,%rax)
	vpextrw	$3, %xmm1, 28(%r12,%rax)
	vpextrw	$4, %xmm1, 32(%r12,%rax)
	vpextrw	$5, %xmm1, 34(%r12,%rax)
	vpextrw	$6, %xmm1, 36(%r12,%rax)
	vpextrw	$7, %xmm1, 40(%r12,%rax)
	vpextrw	$0, %xmm0, 42(%r12,%rax)
	vpextrw	$1, %xmm0, 44(%r12,%rax)
	vpextrw	$2, %xmm0, 48(%r12,%rax)
	vpextrw	$3, %xmm0, 50(%r12,%rax)
	vpextrw	$4, %xmm0, 52(%r12,%rax)
	vpextrw	$5, %xmm0, 56(%r12,%rax)
	vpextrw	$6, %xmm0, 58(%r12,%rax)
	vpextrw	$7, %xmm0, 60(%r12,%rax)
	movl	$-1, %eax
	movw	%ax, 8(%r8)
	movl	$-1, %eax
	movw	%ax, 16(%r8)
	movl	$-1, %eax
	movw	%ax, 24(%r8)
	movl	$-1, %eax
	movw	%ax, 32(%r8)
	movl	$-1, %r15d
	movl	$-1, %eax
	movw	%r15w, (%r8)
	movw	%ax, 40(%r8)
	movl	%ebx, %eax
	movl	$-1, %edi
	andl	$-8, %eax
	movw	%di, 48(%r8)
	movl	$-1, %r15d
	movl	%eax, %edi
	movw	%r15w, 56(%r8)
	leaq	(%rdi,%rdi,2), %r8
	subl	%eax, %esi
	leaq	(%rcx,%r8,2), %rcx
	leaq	(%rdx,%rdi,8), %rdx
	cmpl	%eax, %ebx
	je	.L326
.L356:
	movzwl	(%rcx), %eax
	movl	$-1, %r8d
	movw	%ax, (%rdx)
	movzwl	2(%rcx), %eax
	movw	%ax, 2(%rdx)
	movzwl	4(%rcx), %eax
	movw	%r8w, 6(%rdx)
	movw	%ax, 4(%rdx)
	testl	%esi, %esi
	je	.L326
	movzwl	6(%rcx), %eax
	movl	$-1, %edi
	movw	%ax, 8(%rdx)
	movzwl	8(%rcx), %eax
	movw	%ax, 10(%rdx)
	movzwl	10(%rcx), %eax
	movw	%di, 14(%rdx)
	movw	%ax, 12(%rdx)
	cmpl	$1, %esi
	je	.L326
	movzwl	12(%rcx), %eax
	movw	%ax, 16(%rdx)
	movzwl	14(%rcx), %eax
	movw	%ax, 18(%rdx)
	movzwl	16(%rcx), %eax
	movw	%ax, 20(%rdx)
	movl	$-1, %eax
	movw	%ax, 22(%rdx)
	cmpl	$2, %esi
	je	.L326
	movzwl	18(%rcx), %eax
	movw	%ax, 24(%rdx)
	movzwl	20(%rcx), %eax
	movw	%ax, 26(%rdx)
	movzwl	22(%rcx), %eax
	movw	%ax, 28(%rdx)
	movl	$-1, %eax
	movw	%ax, 30(%rdx)
	cmpl	$3, %esi
	je	.L326
	movzwl	24(%rcx), %eax
	movw	%ax, 32(%rdx)
	movzwl	26(%rcx), %eax
	movw	%ax, 34(%rdx)
	movzwl	28(%rcx), %eax
	movw	%ax, 36(%rdx)
	movl	$-1, %eax
	movw	%ax, 38(%rdx)
	cmpl	$4, %esi
	je	.L326
	movzwl	30(%rcx), %eax
	movw	%ax, 40(%rdx)
	movzwl	32(%rcx), %eax
	movw	%ax, 42(%rdx)
	movzwl	34(%rcx), %eax
	movw	%ax, 44(%rdx)
	movl	$-1, %eax
	movw	%ax, 46(%rdx)
	cmpl	$5, %esi
	je	.L326
	movzwl	36(%rcx), %eax
	movw	%ax, 48(%rdx)
	movzwl	38(%rcx), %eax
	movw	%ax, 50(%rdx)
	movzwl	40(%rcx), %eax
	movw	%ax, 52(%rdx)
	movl	$-1, %eax
	movw	%ax, 54(%rdx)
	jmp	.L326
	.p2align 4,,10
	.p2align 3
.L318:
	movl	632(%rsp), %ebx
	testl	%ebx, %ebx
	js	.L326
	cmpb	$0, 619(%rsp)
	jne	.L392
	vmovdqa	.LC50(%rip), %ymm5
	vmovdqa	.LC58(%rip), %ymm6
	vmovdqa	%ymm5, 384(%rsp)
	vmovdqa	.LC51(%rip), %ymm5
	vmovdqa	%ymm6, 160(%rsp)
	vmovdqa	%ymm5, 352(%rsp)
	vmovdqa	.LC52(%rip), %ymm5
	vmovdqa	.LC60(%rip), %ymm6
	vmovdqa	%ymm5, 320(%rsp)
	vmovdqa	.LC53(%rip), %ymm5
	vmovdqa	%ymm6, 576(%rsp)
	vmovdqa	%ymm5, 288(%rsp)
	vmovdqa	.LC55(%rip), %ymm5
	vmovdqa	.LC62(%rip), %ymm6
	vmovdqa	%ymm5, 256(%rsp)
	vmovdqa	.LC56(%rip), %ymm5
	vmovdqa	%ymm6, 512(%rsp)
	vmovdqa	%ymm5, 224(%rsp)
	vmovdqa	.LC57(%rip), %ymm5
	vmovdqa	.LC64(%rip), %ymm6
	vmovdqa	%ymm5, 192(%rsp)
	vmovdqa	.LC59(%rip), %ymm5
	movq	56(%rsp), %rbx
	vmovdqa	%ymm5, 128(%rsp)
	vmovdqa	.LC61(%rip), %ymm5
	vmovdqa	%ymm6, 448(%rsp)
	vmovdqa	%ymm5, 544(%rsp)
	vmovdqa	.LC63(%rip), %ymm5
	vmovdqa	.LC19(%rip), %ymm1
	vmovdqa	%ymm5, 480(%rsp)
	vmovdqa	.LC65(%rip), %ymm5
	vmovdqa	.LC54(%rip), %ymm11
	vmovdqa	%ymm5, 416(%rsp)
	vmovdqa	.LC66(%rip), %ymm13
	vmovdqa	.LC67(%rip), %ymm6
	vmovdqa	.LC68(%rip), %ymm5
	vmovdqa	.LC69(%rip), %ymm4
	movq	%rcx, %rsi
	movq	%rdx, %rax
	leaq	64(%rdx,%rbx), %rbx
	vpcmpeqd	%ymm14, %ymm14, %ymm14
	.p2align 4,,10
	.p2align 3
.L365:
	vmovdqu	(%rsi), %ymm0
	vmovdqu	32(%rsi), %ymm8
	vpshufb	384(%rsp), %ymm0, %ymm2
	vmovdqu	64(%rsi), %ymm7
	vpermq	$78, %ymm2, %ymm2
	vpshufb	352(%rsp), %ymm0, %ymm3
	vpshufb	320(%rsp), %ymm8, %ymm9
	vpor	%ymm2, %ymm3, %ymm3
	vpor	%ymm9, %ymm3, %ymm3
	vpshufb	288(%rsp), %ymm7, %ymm9
	vpermq	$78, %ymm9, %ymm9
	vpshufb	256(%rsp), %ymm7, %ymm2
	vpor	%ymm9, %ymm2, %ymm2
	vpshufb	%ymm11, %ymm3, %ymm3
	vpshufb	224(%rsp), %ymm0, %ymm9
	vpor	%ymm2, %ymm3, %ymm3
	vpermq	$78, %ymm9, %ymm9
	vpshufb	192(%rsp), %ymm0, %ymm2
	vpshufb	160(%rsp), %ymm8, %ymm10
	vpor	%ymm9, %ymm2, %ymm2
	vpor	%ymm10, %ymm2, %ymm2
	vpshufb	128(%rsp), %ymm7, %ymm10
	vpermq	$78, %ymm10, %ymm10
	vpshufb	576(%rsp), %ymm7, %ymm9
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm11, %ymm2, %ymm2
	vpor	%ymm9, %ymm2, %ymm2
	vpshufb	544(%rsp), %ymm0, %ymm9
	vpermq	$78, %ymm9, %ymm9
	vpshufb	512(%rsp), %ymm0, %ymm0
	vpshufb	480(%rsp), %ymm8, %ymm8
	vpor	%ymm9, %ymm0, %ymm0
	vpor	%ymm8, %ymm0, %ymm0
	vpshufb	448(%rsp), %ymm7, %ymm8
	vpermq	$78, %ymm8, %ymm8
	vpshufb	%ymm13, %ymm7, %ymm7
	vpor	%ymm8, %ymm7, %ymm7
	vpshufb	416(%rsp), %ymm0, %ymm0
	vpmullw	%ymm3, %ymm6, %ymm8
	vpor	%ymm7, %ymm0, %ymm0
	vpmulhuw	%ymm6, %ymm3, %ymm3
	vpmullw	%ymm2, %ymm5, %ymm7
	vpmulhuw	%ymm5, %ymm2, %ymm2
	vpmullw	%ymm0, %ymm4, %ymm15
	vpmulhuw	%ymm4, %ymm0, %ymm0
	vpunpcklwd	%ymm3, %ymm8, %ymm10
	vpunpckhwd	%ymm3, %ymm8, %ymm8
	vpunpcklwd	%ymm2, %ymm7, %ymm3
	vpunpckhwd	%ymm2, %ymm7, %ymm7
	vperm2i128	$32, %ymm8, %ymm10, %ymm9
	vperm2i128	$32, %ymm7, %ymm3, %ymm2
	vpaddd	%ymm9, %ymm2, %ymm2
	vperm2i128	$49, %ymm8, %ymm10, %ymm10
	vpunpcklwd	%ymm0, %ymm15, %ymm9
	vperm2i128	$49, %ymm7, %ymm3, %ymm3
	vpunpckhwd	%ymm0, %ymm15, %ymm0
	vperm2i128	$32, %ymm0, %ymm9, %ymm15
	vpaddd	%ymm10, %ymm3, %ymm3
	vperm2i128	$49, %ymm0, %ymm9, %ymm9
	vpaddd	%ymm15, %ymm2, %ymm2
	vpaddd	%ymm9, %ymm3, %ymm3
	vpsrad	$8, %ymm2, %ymm2
	vpsrad	$8, %ymm3, %ymm3
	vpand	%ymm3, %ymm1, %ymm3
	vpand	%ymm2, %ymm1, %ymm2
	vpackusdw	%ymm3, %ymm2, %ymm2
	vpermq	$216, %ymm2, %ymm2
	vpunpcklwd	%ymm14, %ymm2, %ymm0
	vpunpckhwd	%ymm14, %ymm2, %ymm2
	vperm2i128	$32, %ymm2, %ymm0, %ymm3
	vperm2i128	$49, %ymm2, %ymm0, %ymm0
	vmovdqu	%ymm3, (%rax)
	vmovdqu	%ymm0, 32(%rax)
	addq	$64, %rax
	addq	$96, %rsi
	cmpq	%rax, %rbx
	jne	.L365
	movl	612(%rsp), %eax
	movl	620(%rsp), %ebx
	addq	96(%rsp), %rcx
	addq	112(%rsp), %rdx
	cmpl	%ebx, %eax
	je	.L326
	movl	608(%rsp), %esi
.L364:
	subl	%eax, %ebx
	leal	-1(%rbx), %r15d
	cmpl	$6, %r15d
	jbe	.L368
	leaq	(%rax,%rax), %r15
	addq	%r15, %rax
	addq	%rdi, %rax
	leaq	0(%r13,%rax,2), %rax
	vmovdqu	(%rax), %xmm0
	vmovdqu	16(%rax), %xmm2
	vmovdqu	32(%rax), %xmm5
	vpshufb	.LC71(%rip), %xmm2, %xmm1
	vpshufb	.LC70(%rip), %xmm0, %xmm3
	vpor	%xmm1, %xmm3, %xmm3
	vpshufb	.LC72(%rip), %xmm5, %xmm1
	vpblendw	$192, %xmm1, %xmm3, %xmm3
	vpshufb	.LC73(%rip), %xmm0, %xmm4
	vpshufb	.LC74(%rip), %xmm2, %xmm1
	vpor	%xmm1, %xmm4, %xmm4
	vpshufb	.LC75(%rip), %xmm5, %xmm1
	vpblendw	$224, %xmm1, %xmm4, %xmm4
	vpshufb	.LC77(%rip), %xmm2, %xmm2
	vpshufb	.LC76(%rip), %xmm0, %xmm1
	vpor	%xmm2, %xmm1, %xmm1
	vpshufb	.LC78(%rip), %xmm5, %xmm0
	vpblendw	$224, %xmm0, %xmm1, %xmm1
	vmovdqa	.LC79(%rip), %xmm0
	vmovdqa	.LC81(%rip), %xmm7
	vpmullw	%xmm0, %xmm3, %xmm6
	vpmulhuw	%xmm0, %xmm3, %xmm3
	vmovdqa	.LC80(%rip), %xmm0
	addq	%r8, %r15
	vpmullw	%xmm0, %xmm4, %xmm2
	vpmulhuw	%xmm0, %xmm4, %xmm4
	vpunpcklwd	%xmm3, %xmm6, %xmm5
	vpunpckhwd	%xmm3, %xmm6, %xmm3
	movl	%ebx, %eax
	leaq	(%r12,%r15,2), %rdi
	vpunpcklwd	%xmm4, %xmm2, %xmm0
	vpaddd	%xmm5, %xmm0, %xmm0
	vpmullw	%xmm7, %xmm1, %xmm5
	vpmulhuw	%xmm7, %xmm1, %xmm1
	vpunpckhwd	%xmm4, %xmm2, %xmm2
	vpaddd	%xmm3, %xmm2, %xmm2
	andl	$-8, %eax
	subl	%eax, %esi
	vpunpcklwd	%xmm1, %xmm5, %xmm7
	vpunpckhwd	%xmm1, %xmm5, %xmm5
	vpaddd	%xmm5, %xmm2, %xmm1
	vpaddd	%xmm7, %xmm0, %xmm0
	vmovdqa	.LC20(%rip), %xmm2
	vpsrad	$8, %xmm1, %xmm1
	vpsrad	$8, %xmm0, %xmm0
	vpand	%xmm0, %xmm2, %xmm0
	vpand	%xmm1, %xmm2, %xmm2
	vpackusdw	%xmm2, %xmm0, %xmm0
	vpcmpeqd	%xmm1, %xmm1, %xmm1
	vpunpcklwd	%xmm1, %xmm0, %xmm2
	vpunpckhwd	%xmm1, %xmm0, %xmm0
	vmovdqu	%xmm2, (%rdi)
	vmovdqu	%xmm0, 16(%rdi)
	movl	%eax, %edi
	leaq	(%rdi,%rdi,2), %r8
	leaq	(%rcx,%r8,2), %rcx
	leaq	(%rdx,%rdi,4), %rdx
	cmpl	%eax, %ebx
	je	.L326
.L368:
	movzwl	(%rcx), %eax
	movzwl	2(%rcx), %edi
	imull	$77, %eax, %eax
	imull	$150, %edi, %edi
	addl	%edi, %eax
	movzwl	4(%rcx), %edi
	imull	$29, %edi, %edi
	addl	%edi, %eax
	sarl	$8, %eax
	movl	$-1, %edi
	movw	%ax, (%rdx)
	movw	%di, 2(%rdx)
	testl	%esi, %esi
	je	.L326
	movzwl	6(%rcx), %eax
	movzwl	8(%rcx), %edi
	imull	$77, %eax, %eax
	imull	$150, %edi, %edi
	addl	%edi, %eax
	movzwl	10(%rcx), %edi
	imull	$29, %edi, %edi
	addl	%edi, %eax
	sarl	$8, %eax
	movw	%ax, 4(%rdx)
	movl	$-1, %eax
	movw	%ax, 6(%rdx)
	cmpl	$1, %esi
	je	.L326
	movzwl	12(%rcx), %eax
	movzwl	14(%rcx), %edi
	imull	$77, %eax, %eax
	imull	$150, %edi, %edi
	addl	%edi, %eax
	movzwl	16(%rcx), %edi
	imull	$29, %edi, %edi
	addl	%edi, %eax
	sarl	$8, %eax
	movw	%ax, 8(%rdx)
	movl	$-1, %eax
	movw	%ax, 10(%rdx)
	cmpl	$2, %esi
	je	.L326
	movzwl	18(%rcx), %eax
	movzwl	20(%rcx), %edi
	imull	$77, %eax, %eax
	imull	$150, %edi, %edi
	addl	%edi, %eax
	movzwl	22(%rcx), %edi
	imull	$29, %edi, %edi
	addl	%edi, %eax
	sarl	$8, %eax
	movw	%ax, 12(%rdx)
	movl	$-1, %eax
	movw	%ax, 14(%rdx)
	cmpl	$3, %esi
	je	.L326
	movzwl	24(%rcx), %eax
	movzwl	26(%rcx), %edi
	imull	$77, %eax, %eax
	imull	$150, %edi, %edi
	addl	%edi, %eax
	movzwl	28(%rcx), %edi
	imull	$29, %edi, %edi
	addl	%edi, %eax
	sarl	$8, %eax
	movw	%ax, 16(%rdx)
	movl	$-1, %eax
	movw	%ax, 18(%rdx)
	cmpl	$4, %esi
	je	.L326
	movzwl	30(%rcx), %eax
	movzwl	32(%rcx), %edi
	imull	$77, %eax, %eax
	imull	$150, %edi, %edi
	addl	%edi, %eax
	movzwl	34(%rcx), %edi
	imull	$29, %edi, %edi
	addl	%edi, %eax
	sarl	$8, %eax
	movw	%ax, 20(%rdx)
	movl	$-1, %eax
	movw	%ax, 22(%rdx)
	cmpl	$5, %esi
	je	.L326
	movzwl	36(%rcx), %esi
	movzwl	38(%rcx), %eax
	movzwl	40(%rcx), %ecx
	imull	$77, %esi, %esi
	imull	$150, %eax, %eax
	imull	$29, %ecx, %ecx
	movl	$-1, %r15d
	addl	%esi, %eax
	addl	%ecx, %eax
	sarl	$8, %eax
	movw	%ax, 24(%rdx)
	movw	%r15w, 26(%rdx)
	jmp	.L326
	.p2align 4,,10
	.p2align 3
.L319:
	movl	632(%rsp), %r15d
	testl	%r15d, %r15d
	js	.L326
	cmpb	$0, 619(%rsp)
	jne	.L391
	vmovdqa	.LC50(%rip), %ymm5
	movq	88(%rsp), %rbx
	vmovdqa	%ymm5, 384(%rsp)
	vmovdqa	.LC51(%rip), %ymm5
	vmovdqa	.LC19(%rip), %ymm1
	vmovdqa	%ymm5, 352(%rsp)
	vmovdqa	.LC52(%rip), %ymm5
	vmovdqa	.LC54(%rip), %ymm11
	vmovdqa	%ymm5, 320(%rsp)
	vmovdqa	.LC53(%rip), %ymm5
	vmovdqa	.LC59(%rip), %ymm14
	vmovdqa	%ymm5, 288(%rsp)
	vmovdqa	.LC55(%rip), %ymm5
	movq	%rcx, %rax
	vmovdqa	%ymm5, 256(%rsp)
	vmovdqa	.LC56(%rip), %ymm5
	movq	%rdx, %rsi
	vmovdqa	%ymm5, 224(%rsp)
	vmovdqa	.LC57(%rip), %ymm5
	addq	%rdx, %rbx
	vmovdqa	%ymm5, 192(%rsp)
	vmovdqa	.LC58(%rip), %ymm5
	vmovdqa	%ymm5, 160(%rsp)
	vmovdqa	.LC60(%rip), %ymm5
	vmovdqa	%ymm5, 576(%rsp)
	vmovdqa	.LC61(%rip), %ymm5
	vmovdqa	%ymm5, 544(%rsp)
	vmovdqa	.LC62(%rip), %ymm5
	vmovdqa	%ymm5, 512(%rsp)
	vmovdqa	.LC63(%rip), %ymm5
	vmovdqa	%ymm5, 480(%rsp)
	vmovdqa	.LC64(%rip), %ymm5
	vmovdqa	%ymm5, 448(%rsp)
	vmovdqa	.LC65(%rip), %ymm5
	vmovdqa	%ymm5, 416(%rsp)
	vmovdqa	.LC66(%rip), %ymm13
	vmovdqa	.LC67(%rip), %ymm6
	vmovdqa	.LC68(%rip), %ymm5
	vmovdqa	.LC69(%rip), %ymm4
	.p2align 4,,10
	.p2align 3
.L359:
	vmovdqu	(%rax), %ymm0
	vmovdqu	32(%rax), %ymm8
	vpshufb	384(%rsp), %ymm0, %ymm2
	vmovdqu	64(%rax), %ymm7
	vpermq	$78, %ymm2, %ymm2
	vpshufb	352(%rsp), %ymm0, %ymm3
	vpshufb	320(%rsp), %ymm8, %ymm9
	vpor	%ymm2, %ymm3, %ymm3
	vpor	%ymm9, %ymm3, %ymm3
	vpshufb	288(%rsp), %ymm7, %ymm9
	vpermq	$78, %ymm9, %ymm9
	vpshufb	256(%rsp), %ymm7, %ymm2
	vpor	%ymm9, %ymm2, %ymm2
	vpshufb	%ymm11, %ymm3, %ymm3
	vpshufb	224(%rsp), %ymm0, %ymm9
	vpor	%ymm2, %ymm3, %ymm3
	vpermq	$78, %ymm9, %ymm9
	vpshufb	192(%rsp), %ymm0, %ymm2
	vpshufb	160(%rsp), %ymm8, %ymm10
	vpor	%ymm9, %ymm2, %ymm2
	vpor	%ymm10, %ymm2, %ymm2
	vpshufb	%ymm14, %ymm7, %ymm10
	vpermq	$78, %ymm10, %ymm10
	vpshufb	576(%rsp), %ymm7, %ymm9
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm11, %ymm2, %ymm2
	vpor	%ymm9, %ymm2, %ymm2
	vpshufb	544(%rsp), %ymm0, %ymm9
	vpermq	$78, %ymm9, %ymm9
	vpshufb	512(%rsp), %ymm0, %ymm0
	vpshufb	480(%rsp), %ymm8, %ymm8
	vpor	%ymm9, %ymm0, %ymm0
	vpor	%ymm8, %ymm0, %ymm0
	vpshufb	448(%rsp), %ymm7, %ymm8
	vpermq	$78, %ymm8, %ymm8
	vpshufb	%ymm13, %ymm7, %ymm7
	vpor	%ymm8, %ymm7, %ymm7
	vpshufb	416(%rsp), %ymm0, %ymm0
	vpmullw	%ymm3, %ymm6, %ymm8
	vpor	%ymm7, %ymm0, %ymm0
	vpmulhuw	%ymm6, %ymm3, %ymm3
	vpmullw	%ymm2, %ymm5, %ymm7
	vpmulhuw	%ymm5, %ymm2, %ymm2
	vpmullw	%ymm0, %ymm4, %ymm15
	vpmulhuw	%ymm4, %ymm0, %ymm0
	vpunpcklwd	%ymm3, %ymm8, %ymm10
	vpunpckhwd	%ymm3, %ymm8, %ymm8
	vpunpcklwd	%ymm2, %ymm7, %ymm3
	vpunpckhwd	%ymm2, %ymm7, %ymm7
	vperm2i128	$32, %ymm8, %ymm10, %ymm9
	vperm2i128	$32, %ymm7, %ymm3, %ymm2
	vpaddd	%ymm9, %ymm2, %ymm2
	vperm2i128	$49, %ymm8, %ymm10, %ymm10
	vpunpcklwd	%ymm0, %ymm15, %ymm9
	vperm2i128	$49, %ymm7, %ymm3, %ymm3
	vpunpckhwd	%ymm0, %ymm15, %ymm0
	vperm2i128	$32, %ymm0, %ymm9, %ymm15
	vpaddd	%ymm10, %ymm3, %ymm3
	vperm2i128	$49, %ymm0, %ymm9, %ymm9
	vpaddd	%ymm15, %ymm2, %ymm2
	vpaddd	%ymm9, %ymm3, %ymm3
	vpsrad	$8, %ymm2, %ymm2
	vpsrad	$8, %ymm3, %ymm3
	vpand	%ymm2, %ymm1, %ymm2
	vpand	%ymm3, %ymm1, %ymm3
	vpackusdw	%ymm3, %ymm2, %ymm2
	vpermq	$216, %ymm2, %ymm2
	vmovdqu	%ymm2, (%rsi)
	addq	$32, %rsi
	addq	$96, %rax
	cmpq	%rsi, %rbx
	jne	.L359
	movl	612(%rsp), %eax
	movl	620(%rsp), %ebx
	addq	96(%rsp), %rcx
	addq	72(%rsp), %rdx
	cmpl	%ebx, %eax
	je	.L326
	movl	608(%rsp), %esi
.L358:
	subl	%eax, %ebx
	leal	-1(%rbx), %r15d
	cmpl	$6, %r15d
	jbe	.L362
	leaq	(%rax,%rax,2), %r15
	addq	%rdi, %r15
	leaq	0(%r13,%r15,2), %rdi
	vmovdqu	(%rdi), %xmm0
	vmovdqu	16(%rdi), %xmm2
	vmovdqu	32(%rdi), %xmm1
	vpshufb	.LC71(%rip), %xmm2, %xmm4
	vpshufb	.LC70(%rip), %xmm0, %xmm3
	vpor	%xmm4, %xmm3, %xmm3
	vpshufb	.LC72(%rip), %xmm1, %xmm4
	vpblendw	$192, %xmm4, %xmm3, %xmm3
	vpshufb	.LC74(%rip), %xmm2, %xmm5
	vpshufb	.LC73(%rip), %xmm0, %xmm4
	vpshufb	.LC77(%rip), %xmm2, %xmm2
	vpshufb	.LC76(%rip), %xmm0, %xmm0
	vpor	%xmm5, %xmm4, %xmm4
	vpor	%xmm2, %xmm0, %xmm0
	vpshufb	.LC75(%rip), %xmm1, %xmm5
	vpshufb	.LC78(%rip), %xmm1, %xmm1
	vpblendw	$224, %xmm1, %xmm0, %xmm0
	vmovdqa	.LC79(%rip), %xmm1
	vpblendw	$224, %xmm5, %xmm4, %xmm4
	vpmullw	%xmm1, %xmm3, %xmm6
	vpmulhuw	%xmm1, %xmm3, %xmm3
	vmovdqa	.LC80(%rip), %xmm1
	vmovdqa	.LC81(%rip), %xmm7
	vpmullw	%xmm1, %xmm4, %xmm2
	vpmulhuw	%xmm1, %xmm4, %xmm4
	vpunpcklwd	%xmm3, %xmm6, %xmm5
	vpunpckhwd	%xmm3, %xmm6, %xmm3
	movl	%ebx, %edi
	addq	%r8, %rax
	vpunpcklwd	%xmm4, %xmm2, %xmm1
	vpaddd	%xmm5, %xmm1, %xmm1
	vpmullw	%xmm7, %xmm0, %xmm5
	vpmulhuw	%xmm7, %xmm0, %xmm0
	vpunpckhwd	%xmm4, %xmm2, %xmm2
	vpaddd	%xmm3, %xmm2, %xmm2
	vmovdqa	.LC20(%rip), %xmm3
	andl	$-8, %edi
	vpunpcklwd	%xmm0, %xmm5, %xmm7
	vpunpckhwd	%xmm0, %xmm5, %xmm5
	vpaddd	%xmm7, %xmm1, %xmm1
	vpaddd	%xmm5, %xmm2, %xmm2
	vpsrad	$8, %xmm1, %xmm1
	vpsrad	$8, %xmm2, %xmm2
	vpand	%xmm1, %xmm3, %xmm0
	vpand	%xmm2, %xmm3, %xmm3
	vpackusdw	%xmm3, %xmm0, %xmm0
	vmovdqu	%xmm0, (%r12,%rax,2)
	movl	%edi, %eax
	leaq	(%rax,%rax), %r8
	addq	%r8, %rax
	subl	%edi, %esi
	leaq	(%rcx,%rax,2), %rcx
	addq	%r8, %rdx
	cmpl	%edi, %ebx
	je	.L326
.L362:
	movzwl	2(%rcx), %eax
	movzwl	(%rcx), %edi
	imull	$150, %eax, %eax
	imull	$77, %edi, %edi
	addl	%edi, %eax
	movzwl	4(%rcx), %edi
	imull	$29, %edi, %edi
	addl	%edi, %eax
	sarl	$8, %eax
	movw	%ax, (%rdx)
	testl	%esi, %esi
	je	.L326
	movzwl	8(%rcx), %eax
	movzwl	6(%rcx), %edi
	imull	$150, %eax, %eax
	imull	$77, %edi, %edi
	addl	%edi, %eax
	movzwl	10(%rcx), %edi
	imull	$29, %edi, %edi
	addl	%edi, %eax
	sarl	$8, %eax
	movw	%ax, 2(%rdx)
	cmpl	$1, %esi
	je	.L326
	movzwl	12(%rcx), %eax
	movzwl	14(%rcx), %edi
	imull	$77, %eax, %eax
	imull	$150, %edi, %edi
	addl	%edi, %eax
	movzwl	16(%rcx), %edi
	imull	$29, %edi, %edi
	addl	%edi, %eax
	sarl	$8, %eax
	movw	%ax, 4(%rdx)
	cmpl	$2, %esi
	je	.L326
	movzwl	18(%rcx), %eax
	movzwl	20(%rcx), %edi
	imull	$77, %eax, %eax
	imull	$150, %edi, %edi
	addl	%edi, %eax
	movzwl	22(%rcx), %edi
	imull	$29, %edi, %edi
	addl	%edi, %eax
	sarl	$8, %eax
	movw	%ax, 6(%rdx)
	cmpl	$3, %esi
	je	.L326
	movzwl	24(%rcx), %eax
	movzwl	26(%rcx), %edi
	imull	$77, %eax, %eax
	imull	$150, %edi, %edi
	addl	%edi, %eax
	movzwl	28(%rcx), %edi
	imull	$29, %edi, %edi
	addl	%edi, %eax
	sarl	$8, %eax
	movw	%ax, 8(%rdx)
	cmpl	$4, %esi
	je	.L326
	movzwl	30(%rcx), %eax
	movzwl	32(%rcx), %edi
	imull	$77, %eax, %eax
	imull	$150, %edi, %edi
	addl	%edi, %eax
	movzwl	34(%rcx), %edi
	imull	$29, %edi, %edi
	addl	%edi, %eax
	sarl	$8, %eax
	movw	%ax, 10(%rdx)
	cmpl	$5, %esi
	je	.L326
	movzwl	36(%rcx), %esi
	movzwl	38(%rcx), %eax
	movzwl	40(%rcx), %ecx
	imull	$77, %esi, %esi
	imull	$150, %eax, %eax
	imull	$29, %ecx, %ecx
	addl	%esi, %eax
	addl	%ecx, %eax
	sarl	$8, %eax
	movw	%ax, 12(%rdx)
	jmp	.L326
	.p2align 4,,10
	.p2align 3
.L320:
	movl	632(%rsp), %esi
	testl	%esi, %esi
	js	.L326
	cmpb	$0, 619(%rsp)
	jne	.L389
	movq	56(%rsp), %rbx
	vmovdqa	.LC19(%rip), %ymm1
	vmovdqa	.LC49(%rip), %ymm5
	movq	%rcx, %rsi
	movq	%rdx, %rax
	leaq	64(%rcx,%rbx), %rbx
	.p2align 4,,10
	.p2align 3
.L347:
	vmovdqu	(%rsi), %ymm2
	vmovdqu	32(%rsi), %ymm3
	vpand	%ymm2, %ymm1, %ymm0
	vpand	%ymm3, %ymm1, %ymm4
	vpsrld	$16, %ymm2, %ymm2
	vpsrld	$16, %ymm3, %ymm3
	vpackusdw	%ymm4, %ymm0, %ymm0
	vpackusdw	%ymm3, %ymm2, %ymm2
	vpermq	$216, %ymm0, %ymm0
	vpermq	$216, %ymm2, %ymm2
	vpunpcklwd	%ymm2, %ymm0, %ymm6
	vperm2i128	$0, %ymm0, %ymm0, %ymm4
	vperm2i128	$17, %ymm0, %ymm0, %ymm3
	vpunpckhwd	%ymm2, %ymm0, %ymm0
	vpshufb	%ymm5, %ymm4, %ymm4
	vperm2i128	$32, %ymm0, %ymm6, %ymm7
	vperm2i128	$49, %ymm0, %ymm6, %ymm2
	vpunpckhwd	%ymm7, %ymm4, %ymm0
	vpunpcklwd	%ymm7, %ymm4, %ymm6
	vperm2i128	$32, %ymm0, %ymm6, %ymm4
	vpshufb	%ymm5, %ymm3, %ymm3
	vmovdqu	%ymm4, (%rax)
	vperm2i128	$49, %ymm0, %ymm6, %ymm6
	vpunpcklwd	%ymm2, %ymm3, %ymm4
	vpunpckhwd	%ymm2, %ymm3, %ymm0
	vperm2i128	$32, %ymm0, %ymm4, %ymm2
	addq	$64, %rsi
	vperm2i128	$49, %ymm0, %ymm4, %ymm4
	vmovdqu	%ymm6, 32(%rax)
	vmovdqu	%ymm2, 64(%rax)
	vmovdqu	%ymm4, 96(%rax)
	subq	$-128, %rax
	cmpq	%rsi, %rbx
	jne	.L347
	movl	612(%rsp), %eax
	movl	620(%rsp), %ebx
	addq	112(%rsp), %rcx
	addq	80(%rsp), %rdx
	cmpl	%ebx, %eax
	je	.L326
	movl	608(%rsp), %esi
.L346:
	subl	%eax, %ebx
	leal	-1(%rbx), %r15d
	cmpl	$6, %r15d
	jbe	.L350
	leaq	(%rdi,%rax,2), %rdi
	leaq	0(%r13,%rdi,2), %rdi
	vmovdqu	(%rdi), %xmm1
	vmovdqu	16(%rdi), %xmm2
	vmovdqa	.LC20(%rip), %xmm3
	leaq	(%r8,%rax,4), %rax
	vpand	%xmm1, %xmm3, %xmm0
	vpand	%xmm2, %xmm3, %xmm3
	vpsrld	$16, %xmm1, %xmm1
	vpsrld	$16, %xmm2, %xmm2
	vpackusdw	%xmm3, %xmm0, %xmm0
	vpackusdw	%xmm2, %xmm1, %xmm1
	vpunpcklwd	%xmm0, %xmm0, %xmm3
	vpunpcklwd	%xmm1, %xmm0, %xmm4
	leaq	(%r12,%rax,2), %rax
	vpunpckhwd	%xmm0, %xmm0, %xmm2
	vpunpckhwd	%xmm1, %xmm0, %xmm0
	vpunpcklwd	%xmm4, %xmm3, %xmm1
	vmovdqu	%xmm1, (%rax)
	vpunpckhwd	%xmm4, %xmm3, %xmm3
	vpunpcklwd	%xmm0, %xmm2, %xmm1
	vpunpckhwd	%xmm0, %xmm2, %xmm2
	vmovdqu	%xmm3, 16(%rax)
	vmovdqu	%xmm1, 32(%rax)
	vmovdqu	%xmm2, 48(%rax)
	movl	%ebx, %eax
	andl	$-8, %eax
	movl	%eax, %edi
	subl	%eax, %esi
	leaq	(%rcx,%rdi,4), %rcx
	leaq	(%rdx,%rdi,8), %rdx
	cmpl	%eax, %ebx
	je	.L326
.L350:
	movzwl	(%rcx), %eax
	movw	%ax, 4(%rdx)
	movw	%ax, 2(%rdx)
	movw	%ax, (%rdx)
	movzwl	2(%rcx), %eax
	movw	%ax, 6(%rdx)
	testl	%esi, %esi
	je	.L326
	movzwl	6(%rcx), %eax
	movzwl	4(%rcx), %edi
	salq	$16, %rax
	orq	%rdi, %rax
	salq	$16, %rax
	orq	%rdi, %rax
	salq	$16, %rax
	orq	%rdi, %rax
	movq	%rax, 8(%rdx)
	cmpl	$1, %esi
	je	.L326
	movzwl	10(%rcx), %eax
	movzwl	8(%rcx), %edi
	salq	$16, %rax
	orq	%rdi, %rax
	salq	$16, %rax
	orq	%rdi, %rax
	salq	$16, %rax
	orq	%rdi, %rax
	movq	%rax, 16(%rdx)
	cmpl	$2, %esi
	je	.L326
	movzwl	14(%rcx), %eax
	movzwl	12(%rcx), %edi
	salq	$16, %rax
	orq	%rdi, %rax
	salq	$16, %rax
	orq	%rdi, %rax
	salq	$16, %rax
	orq	%rdi, %rax
	movq	%rax, 24(%rdx)
	cmpl	$3, %esi
	je	.L326
	movzwl	18(%rcx), %eax
	movzwl	16(%rcx), %edi
	salq	$16, %rax
	orq	%rdi, %rax
	salq	$16, %rax
	orq	%rdi, %rax
	salq	$16, %rax
	orq	%rdi, %rax
	movq	%rax, 32(%rdx)
	cmpl	$4, %esi
	je	.L326
	movzwl	22(%rcx), %eax
	movzwl	20(%rcx), %edi
	salq	$16, %rax
	orq	%rdi, %rax
	salq	$16, %rax
	orq	%rdi, %rax
	salq	$16, %rax
	orq	%rdi, %rax
	movq	%rax, 40(%rdx)
	cmpl	$5, %esi
	je	.L326
	movzwl	26(%rcx), %eax
	movzwl	24(%rcx), %ecx
	salq	$16, %rax
	orq	%rcx, %rax
	salq	$16, %rax
	orq	%rcx, %rax
	salq	$16, %rax
	orq	%rcx, %rax
	movq	%rax, 48(%rdx)
	jmp	.L326
	.p2align 4,,10
	.p2align 3
.L321:
	movl	632(%rsp), %ebx
	testl	%ebx, %ebx
	js	.L326
	cmpb	$0, 618(%rsp)
	jne	.L388
	movq	(%rsp), %rbx
	vmovdqa	.LC43(%rip), %ymm5
	salq	$6, %rbx
	vmovdqa	.LC44(%rip), %ymm4
	vmovdqa	.LC45(%rip), %ymm3
	movq	%rcx, %rsi
	movq	%rdx, %rax
	addq	%rcx, %rbx
	.p2align 4,,10
	.p2align 3
.L344:
	vmovdqu	(%rsi), %ymm1
	vmovdqu	32(%rsi), %ymm0
	vpermq	$148, %ymm1, %ymm2
	vperm2i128	$33, %ymm0, %ymm1, %ymm1
	vpermq	$233, %ymm0, %ymm0
	vpshufb	%ymm5, %ymm2, %ymm2
	vpshufb	%ymm4, %ymm1, %ymm1
	vpshufb	%ymm3, %ymm0, %ymm0
	addq	$64, %rsi
	vmovdqu	%ymm2, (%rax)
	vmovdqu	%ymm1, 32(%rax)
	vmovdqu	%ymm0, 64(%rax)
	addq	$96, %rax
	cmpq	%rsi, %rbx
	jne	.L344
	movl	120(%rsp), %r15d
	movl	108(%rsp), %ebx
	addq	64(%rsp), %rcx
	addq	16(%rsp), %rdx
.L343:
	movl	124(%rsp), %eax
	subl	%r15d, %eax
	cmpl	$7, %eax
	jbe	.L345
	leaq	(%r15,%r15), %rsi
	addq	%rsi, %rdi
	leaq	0(%r13,%rdi,2), %rdi
	vmovdqu	(%rdi), %xmm0
	vmovdqu	16(%rdi), %xmm1
	addq	%r15, %rsi
	andl	$-8, %eax
	vpshufb	.LC46(%rip), %xmm0, %xmm2
	addq	%r8, %rsi
	vpalignr	$8, %xmm0, %xmm1, %xmm0
	leaq	(%r12,%rsi,2), %rsi
	vpshufb	.LC47(%rip), %xmm0, %xmm0
	vpshufb	.LC48(%rip), %xmm1, %xmm1
	subl	%eax, %ebx
	leaq	(%rcx,%rax,4), %rcx
	leaq	(%rax,%rax,2), %rax
	vmovdqu	%xmm2, (%rsi)
	vmovdqu	%xmm0, 16(%rsi)
	vmovdqu	%xmm1, 32(%rsi)
	leaq	(%rdx,%rax,2), %rdx
.L345:
	movzwl	(%rcx), %eax
	movw	%ax, 4(%rdx)
	movw	%ax, 2(%rdx)
	movw	%ax, (%rdx)
	testl	%ebx, %ebx
	je	.L326
	movzwl	4(%rcx), %eax
	movw	%ax, 10(%rdx)
	movw	%ax, 8(%rdx)
	movw	%ax, 6(%rdx)
	cmpl	$1, %ebx
	je	.L326
	movzwl	8(%rcx), %eax
	movw	%ax, 16(%rdx)
	movw	%ax, 14(%rdx)
	movw	%ax, 12(%rdx)
	cmpl	$2, %ebx
	je	.L326
	movzwl	12(%rcx), %eax
	movw	%ax, 22(%rdx)
	movw	%ax, 20(%rdx)
	movw	%ax, 18(%rdx)
	cmpl	$3, %ebx
	je	.L326
	movzwl	16(%rcx), %eax
	movw	%ax, 28(%rdx)
	movw	%ax, 26(%rdx)
	movw	%ax, 24(%rdx)
	cmpl	$4, %ebx
	je	.L326
	movzwl	20(%rcx), %eax
	movw	%ax, 34(%rdx)
	movw	%ax, 32(%rdx)
	movw	%ax, 30(%rdx)
	cmpl	$5, %ebx
	je	.L326
	movzwl	24(%rcx), %eax
	movw	%ax, 40(%rdx)
	movw	%ax, 38(%rdx)
	movw	%ax, 36(%rdx)
	cmpl	$6, %ebx
	je	.L326
	movzwl	28(%rcx), %eax
	movw	%ax, 46(%rdx)
	movw	%ax, 44(%rdx)
	movw	%ax, 42(%rdx)
	jmp	.L326
	.p2align 4,,10
	.p2align 3
.L322:
	movl	632(%rsp), %r15d
	testl	%r15d, %r15d
	js	.L326
	cmpb	$0, 618(%rsp)
	jne	.L387
	vmovdqa	.LC19(%rip), %ymm1
	movq	8(%rsp), %rsi
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L341:
	vpand	(%rcx,%rax,2), %ymm1, %ymm0
	vpand	32(%rcx,%rax,2), %ymm1, %ymm2
	vpackusdw	%ymm2, %ymm0, %ymm0
	vpermq	$216, %ymm0, %ymm0
	vmovdqu	%ymm0, (%rdx,%rax)
	addq	$32, %rax
	cmpq	%rax, %rsi
	jne	.L341
	movl	120(%rsp), %esi
	movl	108(%rsp), %ebx
	addq	64(%rsp), %rcx
	addq	24(%rsp), %rdx
.L340:
	movl	124(%rsp), %eax
	subl	%esi, %eax
	cmpl	$7, %eax
	jbe	.L342
	vmovdqa	.LC20(%rip), %xmm0
	leaq	(%rdi,%rsi,2), %rdi
	leaq	0(%r13,%rdi,2), %rdi
	vpand	(%rdi), %xmm0, %xmm1
	vpand	16(%rdi), %xmm0, %xmm0
	andl	$-8, %eax
	vpackusdw	%xmm0, %xmm1, %xmm0
	addq	%r8, %rsi
	vmovdqu	%xmm0, (%r12,%rsi,2)
	subl	%eax, %ebx
	leaq	(%rcx,%rax,4), %rcx
	leaq	(%rdx,%rax,2), %rdx
.L342:
	movzwl	(%rcx), %eax
	movw	%ax, (%rdx)
	testl	%ebx, %ebx
	je	.L326
	movzwl	4(%rcx), %eax
	movw	%ax, 2(%rdx)
	cmpl	$1, %ebx
	je	.L326
	movzwl	8(%rcx), %eax
	movw	%ax, 4(%rdx)
	cmpl	$2, %ebx
	je	.L326
	movzwl	12(%rcx), %eax
	movw	%ax, 6(%rdx)
	cmpl	$3, %ebx
	je	.L326
	movzwl	16(%rcx), %eax
	movw	%ax, 8(%rdx)
	cmpl	$4, %ebx
	je	.L326
	movzwl	20(%rcx), %eax
	movw	%ax, 10(%rdx)
	cmpl	$5, %ebx
	je	.L326
	movzwl	24(%rcx), %eax
	movw	%ax, 12(%rdx)
	cmpl	$6, %ebx
	je	.L326
	movzwl	28(%rcx), %eax
	movw	%ax, 14(%rdx)
	jmp	.L326
	.p2align 4,,10
	.p2align 3
.L323:
	movl	632(%rsp), %esi
	testl	%esi, %esi
	js	.L326
	.p2align 4,,10
	.p2align 3
.L339:
	movzwl	(%rcx), %eax
	decl	%esi
	movw	%ax, 4(%rdx)
	movw	%ax, 2(%rdx)
	movw	%ax, (%rdx)
	movl	$-1, %eax
	movw	%ax, 6(%rdx)
	addq	$2, %rcx
	addq	$8, %rdx
	cmpl	$-1, %esi
	jne	.L339
	jmp	.L326
	.p2align 4,,10
	.p2align 3
.L324:
	movl	632(%rsp), %eax
	testl	%eax, %eax
	js	.L326
	cmpb	$0, 619(%rsp)
	jne	.L386
	movq	88(%rsp), %rbx
	vmovdqa	.LC24(%rip), %ymm15
	vmovdqa	.LC25(%rip), %ymm14
	vmovdqa	.LC26(%rip), %ymm13
	vmovdqa	.LC27(%rip), %ymm11
	vmovdqa	.LC28(%rip), %ymm10
	vmovdqa	.LC30(%rip), %ymm9
	vmovdqa	.LC31(%rip), %ymm8
	vmovdqa	.LC32(%rip), %ymm7
	vmovdqa	.LC33(%rip), %ymm6
	vmovdqa	.LC34(%rip), %ymm5
	vmovdqa	.LC35(%rip), %ymm4
	movq	%rcx, %rsi
	movq	%rdx, %rax
	addq	%rcx, %rbx
	.p2align 4,,10
	.p2align 3
.L334:
	vmovdqu	(%rsi), %ymm0
	addq	$32, %rsi
	vperm2i128	$0, %ymm0, %ymm0, %ymm1
	vpshufb	%ymm14, %ymm0, %ymm3
	vpshufb	%ymm11, %ymm0, %ymm2
	vpshufb	%ymm15, %ymm1, %ymm1
	vpermq	$78, %ymm3, %ymm3
	vpor	%ymm3, %ymm2, %ymm2
	vpshufb	%ymm13, %ymm1, %ymm1
	vpor	%ymm2, %ymm1, %ymm1
	vmovdqu	%ymm1, (%rax)
	vpermq	$132, %ymm0, %ymm1
	vpshufb	.LC29(%rip), %ymm0, %ymm2
	vpshufb	%ymm10, %ymm1, %ymm1
	vpblendvb	%ymm9, %ymm2, %ymm1, %ymm1
	vpshufb	%ymm8, %ymm0, %ymm2
	vmovdqu	%ymm1, 32(%rax)
	vpermq	$78, %ymm2, %ymm2
	vpshufb	%ymm7, %ymm0, %ymm1
	vpor	%ymm2, %ymm1, %ymm1
	vpshufb	%ymm6, %ymm0, %ymm2
	vpermq	$78, %ymm2, %ymm2
	vpshufb	%ymm5, %ymm0, %ymm0
	vpshufb	%ymm4, %ymm1, %ymm1
	vpor	%ymm2, %ymm0, %ymm0
	vpor	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 64(%rax)
	addq	$96, %rax
	cmpq	%rbx, %rsi
	jne	.L334
	movl	612(%rsp), %eax
	movl	620(%rsp), %ebx
	addq	72(%rsp), %rcx
	addq	96(%rsp), %rdx
	cmpl	%ebx, %eax
	je	.L326
	movl	608(%rsp), %esi
.L333:
	subl	%eax, %ebx
	leal	-1(%rbx), %r15d
	cmpl	$6, %r15d
	jbe	.L337
	leaq	(%rax,%rax,2), %r15
	addq	%rdi, %rax
	vmovdqu	0(%r13,%rax,2), %xmm0
	addq	%r8, %r15
	vpshufb	.LC37(%rip), %xmm0, %xmm2
	vpshufb	.LC36(%rip), %xmm0, %xmm1
	leaq	(%r12,%r15,2), %r8
	vpblendw	$36, %xmm2, %xmm1, %xmm1
	vpshufb	.LC38(%rip), %xmm0, %xmm2
	vmovdqu	%xmm1, (%r8)
	vpshufb	.LC40(%rip), %xmm2, %xmm2
	vpshufb	.LC39(%rip), %xmm0, %xmm1
	vpor	%xmm2, %xmm1, %xmm1
	vmovdqu	%xmm1, 16(%r8)
	movl	%ebx, %edi
	vpshufb	.LC41(%rip), %xmm0, %xmm1
	vpshufb	.LC42(%rip), %xmm0, %xmm0
	andl	$-8, %edi
	vpblendw	$146, %xmm0, %xmm1, %xmm0
	vmovdqu	%xmm0, 32(%r8)
	movl	%edi, %r8d
	leaq	(%r8,%r8), %rax
	addq	%rax, %rcx
	addq	%r8, %rax
	subl	%edi, %esi
	leaq	(%rdx,%rax,2), %rdx
	cmpl	%edi, %ebx
	je	.L326
.L337:
	movzwl	(%rcx), %eax
	movw	%ax, 4(%rdx)
	movw	%ax, 2(%rdx)
	movw	%ax, (%rdx)
	testl	%esi, %esi
	je	.L326
	movzwl	2(%rcx), %eax
	movw	%ax, 10(%rdx)
	movw	%ax, 8(%rdx)
	movw	%ax, 6(%rdx)
	cmpl	$1, %esi
	je	.L326
	movzwl	4(%rcx), %eax
	movw	%ax, 16(%rdx)
	movw	%ax, 14(%rdx)
	movw	%ax, 12(%rdx)
	cmpl	$2, %esi
	je	.L326
	movzwl	6(%rcx), %eax
	movw	%ax, 22(%rdx)
	movw	%ax, 20(%rdx)
	movw	%ax, 18(%rdx)
	cmpl	$3, %esi
	je	.L326
	movzwl	8(%rcx), %eax
	movw	%ax, 28(%rdx)
	movw	%ax, 26(%rdx)
	movw	%ax, 24(%rdx)
	cmpl	$4, %esi
	je	.L326
	movzwl	10(%rcx), %eax
	movw	%ax, 34(%rdx)
	movw	%ax, 32(%rdx)
	movw	%ax, 30(%rdx)
	cmpl	$5, %esi
	je	.L326
	movzwl	12(%rcx), %eax
	movw	%ax, 40(%rdx)
	movw	%ax, 38(%rdx)
	movw	%ax, 36(%rdx)
	jmp	.L326
	.p2align 4,,10
	.p2align 3
.L325:
	movl	632(%rsp), %eax
	testl	%eax, %eax
	js	.L326
	cmpb	$0, 619(%rsp)
	jne	.L385
	movq	88(%rsp), %rsi
	xorl	%eax, %eax
	vpcmpeqd	%ymm2, %ymm2, %ymm2
	.p2align 4,,10
	.p2align 3
.L328:
	vmovdqu	(%rcx,%rax), %ymm0
	vpunpcklwd	%ymm2, %ymm0, %ymm1
	vpunpckhwd	%ymm2, %ymm0, %ymm0
	vperm2i128	$32, %ymm0, %ymm1, %ymm3
	vperm2i128	$49, %ymm0, %ymm1, %ymm1
	vmovdqu	%ymm3, (%rdx,%rax,2)
	vmovdqu	%ymm1, 32(%rdx,%rax,2)
	addq	$32, %rax
	cmpq	%rax, %rsi
	jne	.L328
	movl	612(%rsp), %eax
	movl	620(%rsp), %ebx
	addq	72(%rsp), %rcx
	addq	112(%rsp), %rdx
	cmpl	%ebx, %eax
	je	.L326
	movl	608(%rsp), %esi
.L327:
	subl	%eax, %ebx
	leal	-1(%rbx), %r15d
	cmpl	$6, %r15d
	jbe	.L331
	leaq	(%r8,%rax,2), %r8
	addq	%rdi, %rax
	vmovdqu	0(%r13,%rax,2), %xmm0
	movl	%ebx, %eax
	vpcmpeqd	%xmm1, %xmm1, %xmm1
	andl	$-8, %eax
	leaq	(%r12,%r8,2), %r8
	vpunpcklwd	%xmm1, %xmm0, %xmm2
	movl	%eax, %edi
	vpunpckhwd	%xmm1, %xmm0, %xmm0
	vmovdqu	%xmm2, (%r8)
	vmovdqu	%xmm0, 16(%r8)
	subl	%eax, %esi
	leaq	(%rcx,%rdi,2), %rcx
	leaq	(%rdx,%rdi,4), %rdx
	cmpl	%ebx, %eax
	je	.L326
.L331:
	movzwl	(%rcx), %eax
	movl	$-1, %r15d
	movw	%ax, (%rdx)
	movw	%r15w, 2(%rdx)
	testl	%esi, %esi
	je	.L326
	movzwl	2(%rcx), %eax
	movl	$-1, %ebx
	movw	%ax, 4(%rdx)
	movw	%bx, 6(%rdx)
	cmpl	$1, %esi
	je	.L326
	movzwl	4(%rcx), %eax
	movl	$-1, %r8d
	movw	%ax, 8(%rdx)
	movw	%r8w, 10(%rdx)
	cmpl	$2, %esi
	je	.L326
	movzwl	6(%rcx), %eax
	movl	$-1, %edi
	movw	%ax, 12(%rdx)
	movw	%di, 14(%rdx)
	cmpl	$3, %esi
	je	.L326
	movzwl	8(%rcx), %eax
	movw	%ax, 16(%rdx)
	movl	$-1, %eax
	movw	%ax, 18(%rdx)
	cmpl	$4, %esi
	je	.L326
	movzwl	10(%rcx), %eax
	movw	%ax, 20(%rdx)
	movl	$-1, %eax
	movw	%ax, 22(%rdx)
	cmpl	$5, %esi
	je	.L326
	movzwl	12(%rcx), %eax
	movw	%ax, 24(%rdx)
	movl	$-1, %eax
	movw	%ax, 26(%rdx)
	jmp	.L326
	.p2align 4,,10
	.p2align 3
.L384:
	movq	%rdi, %r12
	jmp	.L307
.L389:
	movl	632(%rsp), %esi
	movl	620(%rsp), %ebx
	xorl	%eax, %eax
	jmp	.L346
.L392:
	movl	632(%rsp), %esi
	movl	620(%rsp), %ebx
	xorl	%eax, %eax
	jmp	.L364
.L391:
	movl	632(%rsp), %esi
	movl	620(%rsp), %ebx
	xorl	%eax, %eax
	jmp	.L358
.L395:
	movl	632(%rsp), %ebx
	xorl	%esi, %esi
	jmp	.L379
.L393:
	movl	632(%rsp), %ebx
	xorl	%esi, %esi
	jmp	.L370
.L388:
	movl	632(%rsp), %ebx
	xorl	%r15d, %r15d
	jmp	.L343
.L390:
	movl	632(%rsp), %esi
	movl	620(%rsp), %ebx
	xorl	%eax, %eax
	jmp	.L352
.L394:
	movl	632(%rsp), %esi
	movl	620(%rsp), %ebx
	xorl	%eax, %eax
	jmp	.L373
.L385:
	movl	632(%rsp), %esi
	movl	620(%rsp), %ebx
	xorl	%eax, %eax
	jmp	.L327
.L386:
	movl	632(%rsp), %esi
	movl	620(%rsp), %ebx
	xorl	%eax, %eax
	jmp	.L333
.L387:
	movl	632(%rsp), %ebx
	xorl	%esi, %esi
	jmp	.L340
	.p2align 4,,10
	.p2align 3
.L312:
	leaq	__PRETTY_FUNCTION__.42(%rip), %rcx
	movl	$1827, %edx
	leaq	.LC21(%rip), %rsi
	leaq	.LC13(%rip), %rdi
	vzeroupper
	call	__assert_fail@PLT
.L620:
	leaq	__PRETTY_FUNCTION__.42(%rip), %rcx
	movl	$1798, %edx
	leaq	.LC21(%rip), %rsi
	leaq	.LC22(%rip), %rdi
	call	__assert_fail@PLT
.L310:
	movq	%r13, %rdi
	call	free@PLT
	leaq	.LC23(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L307
	.cfi_endproc
.LFE637:
	.size	stbi__convert_format16, .-stbi__convert_format16
	.p2align 4
	.type	stbi__resample_row_hv_2_simd, @function
stbi__resample_row_hv_2_simd:
.LFB668:
	.cfi_startproc
	endbr64
	movzbl	(%rsi), %eax
	movl	%ecx, %r10d
	leal	(%rax,%rax,2), %ecx
	movzbl	(%rdx), %eax
	movq	%rdi, %r8
	addl	%eax, %ecx
	movq	%rdx, %rdi
	cmpl	$1, %r10d
	je	.L631
	leal	-1(%r10), %r9d
	andl	$-8, %r9d
	jle	.L628
	vmovdqa	.LC96(%rip), %xmm4
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L625:
	vmovq	(%rsi,%rax), %xmm2
	vmovq	(%rdi,%rax), %xmm0
	vpmovzxbw	%xmm2, %xmm2
	vpmovzxbw	%xmm0, %xmm0
	vpsllw	$2, %xmm2, %xmm5
	vpaddw	%xmm0, %xmm5, %xmm5
	vpsubw	%xmm2, %xmm5, %xmm3
	movzbl	8(%rsi,%rax), %edx
	vpslldq	$2, %xmm3, %xmm0
	vpinsrw	$0, %ecx, %xmm0, %xmm0
	movzbl	8(%rdi,%rax), %ecx
	leal	(%rdx,%rdx,2), %edx
	addl	%ecx, %edx
	vpsrldq	$2, %xmm3, %xmm1
	vpsllw	$2, %xmm3, %xmm3
	vpinsrw	$7, %edx, %xmm1, %xmm1
	vpaddw	%xmm4, %xmm3, %xmm3
	vpsubw	%xmm5, %xmm2, %xmm2
	vpaddw	%xmm3, %xmm1, %xmm1
	vpaddw	%xmm3, %xmm0, %xmm0
	vpaddw	%xmm2, %xmm1, %xmm1
	vpaddw	%xmm2, %xmm0, %xmm0
	vpunpcklwd	%xmm1, %xmm0, %xmm2
	vpunpckhwd	%xmm1, %xmm0, %xmm0
	vpsrlw	$4, %xmm0, %xmm0
	vpsrlw	$4, %xmm2, %xmm1
	vpackuswb	%xmm0, %xmm1, %xmm0
	vmovdqu	%xmm0, (%r8,%rax,2)
	movzbl	7(%rsi,%rax), %edx
	leal	(%rdx,%rdx,2), %ecx
	movzbl	7(%rdi,%rax), %edx
	addq	$8, %rax
	addl	%edx, %ecx
	cmpl	%eax, %r9d
	jg	.L625
	decl	%r9d
	shrl	$3, %r9d
	incl	%r9d
	leal	0(,%r9,8), %edx
	movslq	%edx, %r11
	movzbl	(%rsi,%r11), %eax
	sall	$4, %r9d
	movzbl	(%rdi,%r11), %r11d
	leal	(%rax,%rax,2), %eax
	movslq	%r9d, %r9
	addl	%r11d, %eax
	addq	%r8, %r9
	incl	%edx
.L624:
	leal	(%rax,%rax,2), %r11d
	leal	8(%rcx,%r11), %ecx
	sarl	$4, %ecx
	movb	%cl, (%r9)
	cmpl	%edx, %r10d
	jle	.L626
	movslq	%edx, %rdx
	.p2align 4,,10
	.p2align 3
.L627:
	movl	%eax, %ecx
	movzbl	(%rsi,%rdx), %eax
	movzbl	(%rdi,%rdx), %r9d
	leal	(%rax,%rax,2), %eax
	addl	%r9d, %eax
	leal	(%rcx,%rcx,2), %r9d
	leal	8(%rax,%r9), %r9d
	sarl	$4, %r9d
	movb	%r9b, -1(%r8,%rdx,2)
	leal	(%rax,%rax,2), %r9d
	leal	8(%rcx,%r9), %ecx
	sarl	$4, %ecx
	movb	%cl, (%r8,%rdx,2)
	incq	%rdx
	cmpl	%edx, %r10d
	jg	.L627
.L626:
	addl	%r10d, %r10d
	addl	$2, %eax
	sarl	$2, %eax
	movslq	%r10d, %r10
	movb	%al, -1(%r8,%r10)
	movq	%r8, %rax
	ret
	.p2align 4,,10
	.p2align 3
.L631:
	addl	$2, %ecx
	sarl	$2, %ecx
	movb	%cl, 1(%r8)
	movb	%cl, (%r8)
	movq	%r8, %rax
	ret
	.p2align 4,,10
	.p2align 3
.L628:
	movq	%r8, %r9
	movl	%ecx, %eax
	movl	$1, %edx
	jmp	.L624
	.cfi_endproc
.LFE668:
	.size	stbi__resample_row_hv_2_simd, .-stbi__resample_row_hv_2_simd
	.p2align 4
	.type	stbi__YCbCr_to_RGB_simd, @function
stbi__YCbCr_to_RGB_simd:
.LFB671:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	movq	%rdx, %r10
	movq	%rcx, %r11
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	cmpl	$4, %r9d
	je	.L633
.L645:
	xorl	%eax, %eax
.L635:
	movslq	%r9d, %r9
	movslq	%eax, %rcx
	cmpl	%eax, %r8d
	jle	.L649
	.p2align 4,,10
	.p2align 3
.L643:
	movzbl	(%r11,%rcx), %r12d
	movzbl	(%r10,%rcx), %edx
	addl	$-128, %r12d
	addl	$-128, %edx
	movzbl	(%rsi,%rcx), %r13d
	imull	$1470208, %r12d, %ebp
	imull	$-360960, %edx, %ebx
	imull	$-748800, %r12d, %r12d
	sall	$20, %r13d
	addl	$524288, %r13d
	imull	$1858048, %edx, %eax
	addl	%r13d, %r12d
	addl	%r13d, %ebp
	xorw	%bx, %bx
	addl	%r12d, %ebx
	movl	%ebp, %r12d
	sarl	$20, %ebx
	addl	%r13d, %eax
	sarl	$20, %r12d
	movl	%ebx, %edx
	sarl	$20, %eax
	movl	%r12d, %ebx
	cmpl	$268435455, %ebp
	jbe	.L638
	movl	%r12d, %ebx
	notl	%ebx
	sarl	$31, %ebx
.L638:
	cmpl	$255, %edx
	jbe	.L640
	notl	%edx
	sarl	$31, %edx
.L640:
	cmpl	$255, %eax
	jbe	.L642
	notl	%eax
	sarl	$31, %eax
.L642:
	incq	%rcx
	movb	%bl, (%rdi)
	movb	%dl, 1(%rdi)
	movb	%al, 2(%rdi)
	movb	$-1, 3(%rdi)
	addq	%r9, %rdi
	cmpl	%ecx, %r8d
	jg	.L643
.L649:
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
.L633:
	.cfi_restore_state
	cmpl	$7, %r8d
	jle	.L645
	leal	-8(%r8), %eax
	shrl	$3, %eax
	leal	1(%rax), %ebx
	vmovdqa	.LC97(%rip), %xmm9
	vmovdqa	.LC98(%rip), %xmm3
	vmovdqa	.LC99(%rip), %xmm8
	vmovdqa	.LC100(%rip), %xmm7
	vmovdqa	.LC101(%rip), %xmm6
	vmovdqa	.LC102(%rip), %xmm5
	vmovdqa	.LC5(%rip), %xmm4
	movq	%rbx, %rdx
	leaq	0(,%rbx,8), %rcx
	xorl	%eax, %eax
	vpxor	%xmm2, %xmm2, %xmm2
	.p2align 4,,10
	.p2align 3
.L636:
	vmovq	(%r10,%rax), %xmm0
	vmovq	(%r11,%rax), %xmm11
	vpxor	%xmm3, %xmm0, %xmm0
	vpunpcklbw	%xmm0, %xmm2, %xmm0
	vpxor	%xmm3, %xmm11, %xmm11
	vpmulhw	%xmm0, %xmm7, %xmm1
	vpunpcklbw	%xmm11, %xmm2, %xmm11
	vmovq	(%rsi,%rax), %xmm12
	vpmulhw	%xmm11, %xmm8, %xmm10
	vpmulhw	%xmm6, %xmm0, %xmm0
	vpmulhw	%xmm5, %xmm11, %xmm11
	vpunpcklbw	%xmm12, %xmm9, %xmm12
	vpsrlw	$4, %xmm12, %xmm12
	vpaddw	%xmm12, %xmm1, %xmm1
	vpaddw	%xmm12, %xmm10, %xmm10
	vpaddw	%xmm12, %xmm0, %xmm0
	vpaddw	%xmm11, %xmm1, %xmm1
	vpsraw	$4, %xmm0, %xmm0
	vpsraw	$4, %xmm1, %xmm1
	vpsraw	$4, %xmm10, %xmm10
	vpackuswb	%xmm0, %xmm10, %xmm10
	vpackuswb	%xmm4, %xmm1, %xmm0
	vpunpcklbw	%xmm0, %xmm10, %xmm1
	vpunpckhbw	%xmm0, %xmm10, %xmm0
	vpunpcklwd	%xmm0, %xmm1, %xmm10
	vpunpckhwd	%xmm0, %xmm1, %xmm1
	vmovdqu	%xmm10, (%rdi,%rax,4)
	vmovdqu	%xmm1, 16(%rdi,%rax,4)
	addq	$8, %rax
	cmpq	%rax, %rcx
	jne	.L636
	salq	$5, %rbx
	addq	%rbx, %rdi
	leal	0(,%rdx,8), %eax
	jmp	.L635
	.cfi_endproc
.LFE671:
	.size	stbi__YCbCr_to_RGB_simd, .-stbi__YCbCr_to_RGB_simd
	.p2align 4
	.type	stbi__idct_simd, @function
stbi__idct_simd:
.LFB652:
	.cfi_startproc
	endbr64
	vmovdqa	96(%rdx), %xmm3
	vmovdqa	32(%rdx), %xmm0
	vmovdqa	64(%rdx), %xmm4
	vpunpcklwd	%xmm3, %xmm0, %xmm1
	vpunpckhwd	%xmm3, %xmm0, %xmm0
	vmovdqa	(%rdx), %xmm3
	vpmaddwd	.LC103(%rip), %xmm0, %xmm6
	vpmaddwd	.LC103(%rip), %xmm1, %xmm14
	vpmaddwd	.LC104(%rip), %xmm1, %xmm15
	vpmaddwd	.LC104(%rip), %xmm0, %xmm7
	vpaddw	%xmm4, %xmm3, %xmm1
	vpxor	%xmm0, %xmm0, %xmm0
	vmovdqa	%xmm6, -104(%rsp)
	vpunpcklwd	%xmm1, %xmm0, %xmm6
	vpunpckhwd	%xmm1, %xmm0, %xmm1
	vpsubw	%xmm4, %xmm3, %xmm3
	vpsrad	$4, %xmm1, %xmm1
	vmovdqa	48(%rdx), %xmm5
	vmovdqa	112(%rdx), %xmm9
	vmovdqa	16(%rdx), %xmm2
	vmovdqa	80(%rdx), %xmm8
	vmovdqa	%xmm1, -56(%rsp)
	vpunpcklwd	%xmm3, %xmm0, %xmm1
	vpunpckhwd	%xmm3, %xmm0, %xmm3
	vpsrad	$4, %xmm3, %xmm3
	vpunpckhwd	%xmm2, %xmm8, %xmm4
	vmovdqa	%xmm3, -40(%rsp)
	vpunpcklwd	%xmm2, %xmm8, %xmm3
	vpaddw	%xmm8, %xmm5, %xmm8
	vpaddw	%xmm9, %xmm2, %xmm2
	vpsrad	$4, %xmm6, %xmm13
	vmovdqa	%xmm7, -88(%rsp)
	vpunpcklwd	%xmm5, %xmm9, %xmm6
	vpunpckhwd	%xmm5, %xmm9, %xmm7
	vpunpcklwd	%xmm8, %xmm2, %xmm5
	vpmaddwd	.LC105(%rip), %xmm6, %xmm10
	vpmaddwd	.LC105(%rip), %xmm7, %xmm11
	vpmaddwd	.LC107(%rip), %xmm3, %xmm12
	vpmaddwd	.LC106(%rip), %xmm6, %xmm6
	vpmaddwd	.LC106(%rip), %xmm7, %xmm7
	vpunpckhwd	%xmm8, %xmm2, %xmm2
	vmovdqa	%xmm13, -72(%rsp)
	vpmaddwd	.LC107(%rip), %xmm4, %xmm13
	vpmaddwd	.LC109(%rip), %xmm5, %xmm9
	vpmaddwd	.LC108(%rip), %xmm3, %xmm3
	vpmaddwd	.LC109(%rip), %xmm2, %xmm8
	vpmaddwd	.LC110(%rip), %xmm2, %xmm2
	vpmaddwd	.LC110(%rip), %xmm5, %xmm5
	vpaddd	%xmm9, %xmm10, %xmm10
	vpaddd	%xmm9, %xmm3, %xmm3
	vpmaddwd	.LC108(%rip), %xmm4, %xmm4
	vmovdqa	-56(%rsp), %xmm9
	vpaddd	%xmm2, %xmm13, %xmm13
	vpaddd	%xmm2, %xmm7, %xmm7
	vmovdqa	-72(%rsp), %xmm2
	vpaddd	%xmm8, %xmm11, %xmm11
	vpaddd	%xmm5, %xmm12, %xmm12
	vpaddd	%xmm5, %xmm6, %xmm6
	vpaddd	%xmm8, %xmm4, %xmm4
	vpaddd	-88(%rsp), %xmm9, %xmm5
	vmovdqa	.LC111(%rip), %xmm8
	vpaddd	%xmm15, %xmm2, %xmm2
	vpaddd	%xmm8, %xmm2, %xmm2
	vpaddd	%xmm8, %xmm5, %xmm5
	vmovdqa	%xmm15, -24(%rsp)
	vpaddd	%xmm3, %xmm2, %xmm9
	vpaddd	%xmm4, %xmm5, %xmm15
	vpsubd	%xmm3, %xmm2, %xmm2
	vpsubd	%xmm4, %xmm5, %xmm5
	vpsrad	$10, %xmm5, %xmm5
	vpsrad	$10, %xmm2, %xmm2
	vpackssdw	%xmm5, %xmm2, %xmm2
	vmovdqa	-40(%rsp), %xmm5
	vpsrad	$4, %xmm1, %xmm1
	vpaddd	-104(%rsp), %xmm5, %xmm4
	vpaddd	%xmm14, %xmm1, %xmm3
	vpaddd	%xmm8, %xmm3, %xmm3
	vpaddd	%xmm8, %xmm4, %xmm4
	vpsrad	$10, %xmm15, %xmm15
	vpsrad	$10, %xmm9, %xmm9
	vpackssdw	%xmm15, %xmm9, %xmm9
	vpaddd	%xmm6, %xmm3, %xmm5
	vpaddd	%xmm7, %xmm4, %xmm15
	vpsubd	%xmm6, %xmm3, %xmm3
	vpsubd	%xmm7, %xmm4, %xmm4
	vpsrad	$10, %xmm4, %xmm4
	vpsrad	$10, %xmm3, %xmm3
	vpackssdw	%xmm4, %xmm3, %xmm3
	vpaddd	-40(%rsp), %xmm8, %xmm4
	vpaddd	%xmm8, %xmm1, %xmm1
	vpsubd	-104(%rsp), %xmm4, %xmm4
	vpsubd	%xmm14, %xmm1, %xmm1
	vpaddd	%xmm13, %xmm4, %xmm7
	vpaddd	%xmm12, %xmm1, %xmm6
	vpsubd	%xmm13, %xmm4, %xmm4
	vpsubd	%xmm12, %xmm1, %xmm1
	vpsrad	$10, %xmm1, %xmm1
	vpsrad	$10, %xmm4, %xmm4
	vpackssdw	%xmm4, %xmm1, %xmm4
	vpsrad	$10, %xmm7, %xmm7
	vpaddd	-56(%rsp), %xmm8, %xmm1
	vpsrad	$10, %xmm6, %xmm6
	vpackssdw	%xmm7, %xmm6, %xmm6
	vpaddd	-72(%rsp), %xmm8, %xmm7
	vpsubd	-88(%rsp), %xmm1, %xmm1
	vpsubd	-24(%rsp), %xmm7, %xmm7
	vpaddd	%xmm11, %xmm1, %xmm12
	vpsubd	%xmm11, %xmm1, %xmm1
	vpaddd	%xmm10, %xmm7, %xmm8
	vpsrad	$10, %xmm1, %xmm11
	vpsubd	%xmm10, %xmm7, %xmm1
	vpsrad	$10, %xmm15, %xmm15
	vpsrad	$10, %xmm12, %xmm12
	vpsrad	$10, %xmm5, %xmm5
	vpsrad	$10, %xmm8, %xmm8
	vpsrad	$10, %xmm1, %xmm1
	vpackssdw	%xmm15, %xmm5, %xmm5
	vpackssdw	%xmm12, %xmm8, %xmm8
	vpackssdw	%xmm11, %xmm1, %xmm1
	vpunpcklwd	%xmm1, %xmm9, %xmm10
	vpunpcklwd	%xmm2, %xmm8, %xmm11
	vpunpcklwd	%xmm4, %xmm5, %xmm7
	vpunpckhwd	%xmm1, %xmm9, %xmm1
	vpunpckhwd	%xmm4, %xmm5, %xmm4
	vpunpcklwd	%xmm3, %xmm6, %xmm9
	vpunpckhwd	%xmm2, %xmm8, %xmm5
	vpunpckhwd	%xmm3, %xmm6, %xmm6
	vpunpcklwd	%xmm9, %xmm10, %xmm2
	vpunpcklwd	%xmm11, %xmm7, %xmm3
	vpunpcklwd	%xmm6, %xmm1, %xmm14
	vpunpckhwd	%xmm11, %xmm7, %xmm7
	vpunpcklwd	%xmm5, %xmm4, %xmm8
	vpunpckhwd	%xmm9, %xmm10, %xmm9
	vpunpckhwd	%xmm5, %xmm4, %xmm4
	vpunpckhwd	%xmm6, %xmm1, %xmm1
	vpunpcklwd	%xmm3, %xmm2, %xmm6
	vpunpckhwd	%xmm3, %xmm2, %xmm2
	vpunpcklwd	%xmm7, %xmm9, %xmm3
	vpunpckhwd	%xmm7, %xmm9, %xmm9
	vpunpcklwd	%xmm4, %xmm1, %xmm7
	vpunpckhwd	%xmm4, %xmm1, %xmm1
	vpunpcklwd	%xmm7, %xmm3, %xmm4
	vpunpckhwd	%xmm7, %xmm3, %xmm3
	vpmaddwd	.LC103(%rip), %xmm3, %xmm10
	vpmaddwd	.LC103(%rip), %xmm4, %xmm7
	vpunpcklwd	%xmm8, %xmm14, %xmm5
	vmovdqa	%xmm7, -104(%rsp)
	vmovdqa	%xmm10, -88(%rsp)
	vpmaddwd	.LC104(%rip), %xmm4, %xmm15
	vpmaddwd	.LC104(%rip), %xmm3, %xmm4
	vpaddw	%xmm5, %xmm6, %xmm3
	vpunpckhwd	%xmm8, %xmm14, %xmm14
	vpsubw	%xmm5, %xmm6, %xmm5
	vmovdqa	%xmm4, -72(%rsp)
	vpunpcklwd	%xmm3, %xmm0, %xmm4
	vpunpcklwd	%xmm9, %xmm1, %xmm8
	vpunpckhwd	%xmm9, %xmm1, %xmm7
	vpunpcklwd	%xmm2, %xmm14, %xmm6
	vpaddw	%xmm14, %xmm9, %xmm9
	vpsrad	$4, %xmm4, %xmm12
	vpunpckhwd	%xmm3, %xmm0, %xmm3
	vpunpcklwd	%xmm5, %xmm0, %xmm4
	vpunpckhwd	%xmm5, %xmm0, %xmm0
	vpunpckhwd	%xmm2, %xmm14, %xmm5
	vpaddw	%xmm1, %xmm2, %xmm2
	vpunpcklwd	%xmm9, %xmm2, %xmm1
	vpmaddwd	.LC105(%rip), %xmm8, %xmm10
	vmovdqa	%xmm12, -56(%rsp)
	vpunpckhwd	%xmm9, %xmm2, %xmm2
	vpmaddwd	.LC107(%rip), %xmm6, %xmm12
	vpmaddwd	.LC109(%rip), %xmm1, %xmm9
	vpmaddwd	.LC108(%rip), %xmm6, %xmm6
	vpmaddwd	.LC109(%rip), %xmm2, %xmm14
	vpmaddwd	.LC105(%rip), %xmm7, %xmm11
	vpmaddwd	.LC107(%rip), %xmm5, %xmm13
	vpmaddwd	.LC110(%rip), %xmm2, %xmm2
	vpmaddwd	.LC108(%rip), %xmm5, %xmm5
	vpmaddwd	.LC106(%rip), %xmm7, %xmm7
	vpaddd	%xmm9, %xmm10, %xmm10
	vpsrad	$4, %xmm3, %xmm3
	vpaddd	%xmm9, %xmm6, %xmm9
	vmovdqa	-56(%rsp), %xmm6
	vpmaddwd	.LC110(%rip), %xmm1, %xmm1
	vpaddd	%xmm14, %xmm11, %xmm11
	vpaddd	%xmm2, %xmm13, %xmm13
	vpaddd	%xmm14, %xmm5, %xmm14
	vpaddd	%xmm2, %xmm7, %xmm2
	vpmaddwd	.LC106(%rip), %xmm8, %xmm8
	vmovdqa	%xmm15, -40(%rsp)
	vmovdqa	.LC112(%rip), %xmm7
	vpaddd	-72(%rsp), %xmm3, %xmm5
	vpaddd	%xmm15, %xmm6, %xmm6
	vpaddd	%xmm7, %xmm6, %xmm6
	vpaddd	%xmm7, %xmm5, %xmm5
	vpaddd	%xmm1, %xmm8, %xmm8
	vpaddd	%xmm1, %xmm12, %xmm12
	vpaddd	%xmm14, %xmm5, %xmm15
	vpaddd	%xmm9, %xmm6, %xmm1
	vpsubd	%xmm14, %xmm5, %xmm5
	vpsubd	%xmm9, %xmm6, %xmm6
	vpsrad	$4, %xmm4, %xmm4
	vpsrad	$4, %xmm0, %xmm0
	vpsrad	$17, %xmm5, %xmm5
	vpsrad	$17, %xmm6, %xmm6
	vpaddd	-88(%rsp), %xmm0, %xmm9
	vpackssdw	%xmm5, %xmm6, %xmm6
	vpaddd	%xmm7, %xmm0, %xmm0
	vpaddd	-104(%rsp), %xmm4, %xmm5
	vpaddd	%xmm7, %xmm4, %xmm4
	vpsubd	-104(%rsp), %xmm4, %xmm4
	vpsubd	-88(%rsp), %xmm0, %xmm0
	vpaddd	%xmm7, %xmm5, %xmm5
	vpaddd	%xmm7, %xmm9, %xmm9
	vpsrad	$17, %xmm15, %xmm15
	vpsrad	$17, %xmm1, %xmm1
	vpaddd	%xmm8, %xmm5, %xmm14
	vpackssdw	%xmm15, %xmm1, %xmm1
	vpsubd	%xmm8, %xmm5, %xmm5
	vpaddd	%xmm2, %xmm9, %xmm15
	vpaddd	%xmm13, %xmm0, %xmm8
	vpsubd	%xmm2, %xmm9, %xmm9
	vpaddd	%xmm12, %xmm4, %xmm2
	vpsrad	$17, %xmm8, %xmm8
	vpsrad	$17, %xmm2, %xmm2
	vpackssdw	%xmm8, %xmm2, %xmm2
	vpaddd	-56(%rsp), %xmm7, %xmm8
	vpaddd	%xmm7, %xmm3, %xmm3
	vpsubd	-40(%rsp), %xmm8, %xmm8
	vpsubd	-72(%rsp), %xmm3, %xmm3
	vpsubd	%xmm13, %xmm0, %xmm0
	vpsubd	%xmm12, %xmm4, %xmm4
	vpsrad	$17, %xmm0, %xmm0
	vpsrad	$17, %xmm4, %xmm4
	vpackssdw	%xmm0, %xmm4, %xmm4
	vpaddd	%xmm10, %xmm8, %xmm7
	vpaddd	%xmm11, %xmm3, %xmm0
	vpsrad	$17, %xmm0, %xmm0
	vpsubd	%xmm11, %xmm3, %xmm3
	vpsrad	$17, %xmm7, %xmm7
	vpackssdw	%xmm0, %xmm7, %xmm7
	vpsrad	$17, %xmm3, %xmm0
	vpsubd	%xmm10, %xmm8, %xmm3
	vpsrad	$17, %xmm15, %xmm15
	vpsrad	$17, %xmm14, %xmm14
	vpsrad	$17, %xmm9, %xmm9
	vpsrad	$17, %xmm5, %xmm5
	vpsrad	$17, %xmm3, %xmm3
	vpackssdw	%xmm0, %xmm3, %xmm3
	vpackssdw	%xmm15, %xmm14, %xmm14
	vpackssdw	%xmm9, %xmm5, %xmm5
	vpackuswb	%xmm4, %xmm3, %xmm3
	vpackuswb	%xmm7, %xmm2, %xmm2
	vpackuswb	%xmm14, %xmm1, %xmm1
	vpackuswb	%xmm6, %xmm5, %xmm5
	vpunpcklbw	%xmm3, %xmm1, %xmm0
	vpunpckhbw	%xmm3, %xmm1, %xmm1
	vpunpcklbw	%xmm5, %xmm2, %xmm3
	vpunpckhbw	%xmm5, %xmm2, %xmm5
	vpunpcklbw	%xmm3, %xmm0, %xmm2
	vpunpckhbw	%xmm3, %xmm0, %xmm0
	vpunpcklbw	%xmm5, %xmm1, %xmm3
	movslq	%esi, %rsi
	vpunpcklbw	%xmm3, %xmm2, %xmm4
	vmovq	%xmm4, (%rdi)
	leaq	(%rdi,%rsi), %rax
	vpshufd	$78, %xmm4, %xmm4
	vmovq	%xmm4, (%rax)
	vpunpckhbw	%xmm3, %xmm2, %xmm2
	addq	%rsi, %rax
	vmovq	%xmm2, (%rax)
	vpunpckhbw	%xmm5, %xmm1, %xmm1
	addq	%rsi, %rax
	vpshufd	$78, %xmm2, %xmm2
	vmovq	%xmm2, (%rax)
	vpunpcklbw	%xmm1, %xmm0, %xmm3
	addq	%rsi, %rax
	vmovq	%xmm3, (%rax)
	addq	%rsi, %rax
	vpshufd	$78, %xmm3, %xmm3
	vmovq	%xmm3, (%rax)
	vpunpckhbw	%xmm1, %xmm0, %xmm0
	addq	%rsi, %rax
	vmovq	%xmm0, (%rax)
	vpshufd	$78, %xmm0, %xmm0
	vmovq	%xmm0, (%rax,%rsi)
	ret
	.cfi_endproc
.LFE652:
	.size	stbi__idct_simd, .-stbi__idct_simd
	.p2align 4
	.type	stbi__hdr_convert, @function
stbi__hdr_convert:
.LFB760:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movq	%rdi, %r12
	movzbl	3(%rsi), %edi
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movl	%edx, %ebx
	testb	%dil, %dil
	jne	.L671
	cmpl	$3, %edx
	je	.L659
	jg	.L660
	cmpl	$1, %edx
	je	.L661
	cmpl	$2, %edx
	jne	.L669
	movl	$0x3f800000, 4(%r12)
.L661:
	movl	$0x00000000, (%r12)
.L669:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L660:
	.cfi_restore_state
	cmpl	$4, %edx
	jne	.L669
	movl	$0x3f800000, 12(%r12)
.L659:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	movl	$0x00000000, 8(%r12)
	movq	$0, (%r12)
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L671:
	.cfi_restore_state
	vmovsd	.LC113(%rip), %xmm0
	subl	$136, %edi
	movq	%rsi, %rbp
	call	ldexp@PLT
	cmpl	$2, %ebx
	movzbl	0(%rbp), %eax
	vxorps	%xmm1, %xmm1, %xmm1
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	jg	.L654
	movzbl	1(%rbp), %edx
	addl	%edx, %eax
	movzbl	2(%rbp), %edx
	addl	%edx, %eax
	vcvtsi2ssl	%eax, %xmm1, %xmm1
	vmulss	%xmm0, %xmm1, %xmm1
	vdivss	.LC114(%rip), %xmm1, %xmm1
	vmovss	%xmm1, (%r12)
	cmpl	$2, %ebx
	jne	.L669
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	movl	$0x3f800000, 4(%r12)
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L654:
	.cfi_restore_state
	vcvtsi2ssl	%eax, %xmm1, %xmm2
	vmulss	%xmm0, %xmm2, %xmm2
	vmovss	%xmm2, (%r12)
	movzbl	1(%rbp), %eax
	vcvtsi2ssl	%eax, %xmm1, %xmm2
	vmulss	%xmm0, %xmm2, %xmm2
	vmovss	%xmm2, 4(%r12)
	movzbl	2(%rbp), %eax
	vcvtsi2ssl	%eax, %xmm1, %xmm1
	vmulss	%xmm0, %xmm1, %xmm1
	vmovss	%xmm1, 8(%r12)
	cmpl	$4, %ebx
	jne	.L669
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	movl	$0x3f800000, 12(%r12)
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE760:
	.size	stbi__hdr_convert, .-stbi__hdr_convert
	.p2align 4
	.type	stbi__stdio_write, @function
stbi__stdio_write:
.LFB787:
	.cfi_startproc
	endbr64
	movq	%rdi, %rcx
	movslq	%edx, %rdx
	movq	%rsi, %rdi
	movl	$1, %esi
	jmp	fwrite@PLT
	.cfi_endproc
.LFE787:
	.size	stbi__stdio_write, .-stbi__stdio_write
	.p2align 4
	.type	stbi__skip.part.0, @function
stbi__skip.part.0:
.LFB838:
	.cfi_startproc
	cmpq	$0, 16(%rdi)
	movq	192(%rdi), %rax
	je	.L674
	movq	200(%rdi), %rcx
	movq	%rcx, %rdx
	subq	%rax, %rdx
	cmpl	%esi, %edx
	jl	.L675
.L674:
	movslq	%esi, %rsi
	addq	%rsi, %rax
	movq	%rax, 192(%rdi)
	ret
	.p2align 4,,10
	.p2align 3
.L675:
	movq	%rcx, 192(%rdi)
	movq	40(%rdi), %r8
	movq	24(%rdi), %rax
	subl	%edx, %esi
	movq	%r8, %rdi
	jmp	*%rax
	.cfi_endproc
.LFE838:
	.size	stbi__skip.part.0, .-stbi__skip.part.0
	.p2align 4
	.type	stbi__resample_row_h_2, @function
stbi__resample_row_h_2:
.LFB666:
	.cfi_startproc
	endbr64
	movq	%rdi, %r8
	movslq	%ecx, %rdi
	movzbl	(%rsi), %eax
	movq	%rsi, %rdx
	cmpl	$1, %edi
	je	.L703
	movb	%al, (%r8)
	leal	(%rax,%rax,2), %ecx
	movzbl	1(%rsi), %eax
	leal	-1(%rdi), %esi
	leal	2(%rcx,%rax), %eax
	sarl	$2, %eax
	movb	%al, 1(%r8)
	cmpl	$1, %esi
	jle	.L690
	leal	-2(%rdi), %r11d
	leaq	2(%r8,%r11,2), %r10
	cmpq	%r10, %rdx
	movq	%r11, %r9
	leaq	2(%r8), %rcx
	leaq	2(%rdx,%r11), %r11
	setnb	%r10b
	cmpq	%r11, %rcx
	setnb	%r11b
	orb	%r11b, %r10b
	leal	-3(%rdi), %eax
	je	.L680
	cmpl	$14, %eax
	jbe	.L680
	cmpl	$30, %eax
	jbe	.L681
	movl	%r9d, %r10d
	shrl	$5, %r10d
	decl	%r10d
	salq	$5, %r10
	vmovdqa	.LC1(%rip), %ymm4
	vmovdqa	.LC2(%rip), %ymm3
	vmovdqa	.LC0(%rip), %xmm5
	leaq	1(%rdx), %rax
	leaq	33(%rdx,%r10), %r10
	.p2align 4,,10
	.p2align 3
.L682:
	vmovdqu	(%rax), %ymm0
	vpmovzxbw	%xmm5, %ymm1
	vextracti128	$0x1, %ymm0, %xmm6
	vpmovzxbw	%xmm0, %ymm7
	vpmovzxbw	%xmm6, %ymm6
	vpmullw	%ymm1, %ymm7, %ymm7
	vpmullw	%ymm1, %ymm6, %ymm6
	vmovdqu	-1(%rax), %ymm1
	vmovdqu	1(%rax), %ymm2
	vpmovzxbw	%xmm1, %ymm0
	vextracti128	$0x1, %ymm1, %xmm1
	vpaddw	%ymm4, %ymm7, %ymm7
	vpaddw	%ymm4, %ymm6, %ymm6
	vpmovzxbw	%xmm1, %ymm1
	vpaddw	%ymm7, %ymm0, %ymm0
	vpaddw	%ymm6, %ymm1, %ymm1
	vpsrlw	$2, %ymm0, %ymm0
	vpsrlw	$2, %ymm1, %ymm1
	vpand	%ymm1, %ymm3, %ymm1
	vpand	%ymm0, %ymm3, %ymm0
	vpackuswb	%ymm1, %ymm0, %ymm0
	vpmovzxbw	%xmm2, %ymm1
	vextracti128	$0x1, %ymm2, %xmm2
	vpmovzxbw	%xmm2, %ymm2
	vpaddw	%ymm7, %ymm1, %ymm1
	vpaddw	%ymm6, %ymm2, %ymm2
	vpsrlw	$2, %ymm1, %ymm1
	vpsrlw	$2, %ymm2, %ymm2
	vpand	%ymm2, %ymm3, %ymm2
	vpand	%ymm1, %ymm3, %ymm1
	vpackuswb	%ymm2, %ymm1, %ymm1
	vpermq	$216, %ymm1, %ymm1
	vpermq	$216, %ymm0, %ymm0
	vpunpcklbw	%ymm1, %ymm0, %ymm2
	vpunpckhbw	%ymm1, %ymm0, %ymm0
	vperm2i128	$32, %ymm0, %ymm2, %ymm1
	addq	$32, %rax
	vperm2i128	$49, %ymm0, %ymm2, %ymm2
	vmovdqu	%ymm1, (%rcx)
	vmovdqu	%ymm2, 32(%rcx)
	addq	$64, %rcx
	cmpq	%rax, %r10
	jne	.L682
	movl	%r9d, %ecx
	andl	$-32, %ecx
	leal	1(%rcx), %eax
	cmpl	%ecx, %r9d
	je	.L701
	movl	%edi, %r10d
	subl	%ecx, %r10d
	leal	-2(%r10), %r9d
	subl	$3, %r10d
	cmpl	$14, %r10d
	jbe	.L702
	vzeroupper
.L689:
	vmovdqu	1(%rdx,%rcx), %xmm0
	vmovdqa	.LC3(%rip), %xmm1
	vpmovzxbw	%xmm0, %xmm5
	vpmovzxbw	%xmm1, %xmm2
	vpmullw	%xmm2, %xmm5, %xmm5
	vpsrldq	$8, %xmm1, %xmm1
	vpsrldq	$8, %xmm0, %xmm2
	vpmovzxbw	%xmm1, %xmm1
	vpmovzxbw	%xmm2, %xmm2
	vpmullw	%xmm1, %xmm2, %xmm2
	vmovdqu	(%rdx,%rcx), %xmm1
	vmovdqa	.LC4(%rip), %xmm3
	vpmovzxbw	%xmm1, %xmm0
	vpsrldq	$8, %xmm1, %xmm1
	vpaddw	%xmm3, %xmm5, %xmm5
	vpaddw	%xmm3, %xmm2, %xmm2
	vpmovzxbw	%xmm1, %xmm1
	vmovdqa	.LC5(%rip), %xmm4
	vpaddw	%xmm2, %xmm1, %xmm1
	vpaddw	%xmm5, %xmm0, %xmm0
	vmovdqu	2(%rdx,%rcx), %xmm3
	vpsrlw	$2, %xmm0, %xmm0
	vpsrlw	$2, %xmm1, %xmm1
	vpand	%xmm1, %xmm4, %xmm1
	vpand	%xmm0, %xmm4, %xmm0
	vpackuswb	%xmm1, %xmm0, %xmm0
	vpmovzxbw	%xmm3, %xmm1
	vpsrldq	$8, %xmm3, %xmm3
	vpmovzxbw	%xmm3, %xmm3
	vpaddw	%xmm5, %xmm1, %xmm1
	vpaddw	%xmm2, %xmm3, %xmm2
	vpsrlw	$2, %xmm2, %xmm2
	vpsrlw	$2, %xmm1, %xmm1
	vpand	%xmm1, %xmm4, %xmm1
	vpand	%xmm2, %xmm4, %xmm4
	leaq	2(%r8,%rcx,2), %r10
	vpackuswb	%xmm4, %xmm1, %xmm1
	movl	%r9d, %ecx
	vpunpcklbw	%xmm1, %xmm0, %xmm2
	andl	$-16, %ecx
	vpunpckhbw	%xmm1, %xmm0, %xmm0
	vmovdqu	%xmm2, (%r10)
	vmovdqu	%xmm0, 16(%r10)
	addl	%ecx, %eax
	cmpl	%ecx, %r9d
	je	.L688
.L684:
	cltq
	.p2align 4,,10
	.p2align 3
.L686:
	movzbl	(%rdx,%rax), %ecx
	leal	2(%rcx,%rcx,2), %r9d
	movzbl	-1(%rdx,%rax), %ecx
	addl	%r9d, %ecx
	sarl	$2, %ecx
	movb	%cl, (%r8,%rax,2)
	movzbl	1(%rdx,%rax), %ecx
	addl	%r9d, %ecx
	sarl	$2, %ecx
	movb	%cl, 1(%r8,%rax,2)
	incq	%rax
	cmpl	%eax, %esi
	jg	.L686
.L688:
	addl	%esi, %esi
	movslq	%esi, %rsi
	leaq	1(%rsi), %r9
.L679:
	movzbl	-2(%rdx,%rdi), %eax
	leaq	-1(%rdx,%rdi), %rcx
	leal	(%rax,%rax,2), %edx
	movzbl	(%rcx), %eax
	leal	2(%rdx,%rax), %eax
	sarl	$2, %eax
	movb	%al, (%r8,%rsi)
	movzbl	(%rcx), %eax
	movb	%al, (%r8,%r9)
	movq	%r8, %rax
	ret
	.p2align 4,,10
	.p2align 3
.L703:
	movb	%al, 1(%r8)
	movb	%al, (%r8)
	movq	%r8, %rax
	ret
	.p2align 4,,10
	.p2align 3
.L680:
	leaq	2(%rax), %r10
	movl	$1, %eax
	.p2align 4,,10
	.p2align 3
.L687:
	movzbl	(%rdx,%rax), %ecx
	leal	2(%rcx,%rcx,2), %r9d
	movzbl	-1(%rdx,%rax), %ecx
	addl	%r9d, %ecx
	sarl	$2, %ecx
	movb	%cl, (%r8,%rax,2)
	movzbl	1(%rdx,%rax), %ecx
	addl	%r9d, %ecx
	sarl	$2, %ecx
	movb	%cl, 1(%r8,%rax,2)
	incq	%rax
	cmpq	%rax, %r10
	jne	.L687
	jmp	.L688
	.p2align 4,,10
	.p2align 3
.L690:
	movl	$3, %r9d
	movl	$2, %esi
	jmp	.L679
.L681:
	xorl	%ecx, %ecx
	movl	$1, %eax
	jmp	.L689
.L702:
	vzeroupper
	jmp	.L684
.L701:
	vzeroupper
	jmp	.L688
	.cfi_endproc
.LFE666:
	.size	stbi__resample_row_h_2, .-stbi__resample_row_h_2
	.p2align 4
	.type	stbi__stdio_eof, @function
stbi__stdio_eof:
.LFB577:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rdi, %rbp
	call	feof@PLT
	movl	%eax, %r8d
	movl	$1, %eax
	testl	%r8d, %r8d
	je	.L709
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L709:
	.cfi_restore_state
	movq	%rbp, %rdi
	call	ferror@PLT
	testl	%eax, %eax
	setne	%al
	movzbl	%al, %eax
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE577:
	.size	stbi__stdio_eof, .-stbi__stdio_eof
	.section	.rodata.str1.1
.LC117:
	.string	"p"
	.text
	.p2align 4
	.type	stbiw__sbgrowf.part.0, @function
stbiw__sbgrowf.part.0:
.LFB853:
	.cfi_startproc
	pushq	%rax
	.cfi_def_cfa_offset 16
	popq	%rax
	.cfi_def_cfa_offset 8
	leaq	__PRETTY_FUNCTION__.22(%rip), %rcx
	movl	$830, %edx
	leaq	.LC12(%rip), %rsi
	leaq	.LC117(%rip), %rdi
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	call	__assert_fail@PLT
	.cfi_endproc
.LFE853:
	.size	stbiw__sbgrowf.part.0, .-stbiw__sbgrowf.part.0
	.section	.rodata.str1.1
.LC118:
	.string	"111 221 2222 11"
	.text
	.p2align 4
	.type	stbiw__writef.constprop.0, @function
stbiw__writef.constprop.0:
.LFB865:
	.cfi_startproc
	subq	$216, %rsp
	.cfi_def_cfa_offset 224
	movq	%rdx, 48(%rsp)
	movq	%rcx, 56(%rsp)
	movq	%r8, 64(%rsp)
	movq	%r9, 72(%rsp)
	testb	%al, %al
	je	.L713
	vmovaps	%xmm0, 80(%rsp)
	vmovaps	%xmm1, 96(%rsp)
	vmovaps	%xmm2, 112(%rsp)
	vmovaps	%xmm3, 128(%rsp)
	vmovaps	%xmm4, 144(%rsp)
	vmovaps	%xmm5, 160(%rsp)
	vmovaps	%xmm6, 176(%rsp)
	vmovaps	%xmm7, 192(%rsp)
.L713:
	movq	%fs:40, %rax
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax
	leaq	224(%rsp), %rax
	movq	%rax, 8(%rsp)
	movq	%rsp, %rdx
	leaq	32(%rsp), %rax
	leaq	.LC118(%rip), %rsi
	movq	%rax, 16(%rsp)
	movl	$16, (%rsp)
	movl	$48, 4(%rsp)
	call	stbiw__writefv
	movq	24(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L717
	addq	$216, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L717:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE865:
	.size	stbiw__writef.constprop.0, .-stbiw__writef.constprop.0
	.p2align 4
	.type	stbi__free_jpeg_components.constprop.0, @function
stbi__free_jpeg_components.constprop.0:
.LFB866:
	.cfi_startproc
	testl	%esi, %esi
	jle	.L735
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	leal	-1(%rsi), %eax
	leaq	(%rax,%rax,2), %rax
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	salq	$5, %rax
	leaq	18128(%rdi), %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	leaq	18224(%rdi,%rax), %rbp
.L723:
	movq	8(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L720
	call	free@PLT
	movq	$0, 8(%rbx)
	movq	$0, (%rbx)
.L720:
	movq	16(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L721
	call	free@PLT
	movq	$0, 16(%rbx)
	movq	$0, 32(%rbx)
.L721:
	movq	24(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L722
	call	free@PLT
	movq	$0, 24(%rbx)
.L722:
	addq	$96, %rbx
	cmpq	%rbp, %rbx
	jne	.L723
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	xorl	%eax, %eax
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L735:
	.cfi_restore 3
	.cfi_restore 6
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE866:
	.size	stbi__free_jpeg_components.constprop.0, .-stbi__free_jpeg_components.constprop.0
	.section	.rodata.str1.8
	.align 8
.LC119:
	.string	"EXPOSURE=          1.0000000000000\n\n-Y %d +X %d\n"
	.text
	.p2align 4
	.type	stbi_write_hdr_core.part.0, @function
stbi_write_hdr_core.part.0:
.LFB856:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movl	%esi, %r15d
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	%edx, %r14d
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rdi, %r13
	leal	0(,%rsi,4), %edi
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movslq	%edi, %rdi
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movslq	%ecx, %rbx
	subq	$360, %rsp
	.cfi_def_cfa_offset 416
	movq	%r8, 80(%rsp)
	movl	%esi, 12(%rsp)
	movl	%edx, 64(%rsp)
	leaq	208(%rsp), %rbp
	movq	%fs:40, %rax
	movq	%rax, 344(%rsp)
	xorl	%eax, %eax
	call	malloc@PLT
	vmovdqa	.LC122(%rip), %xmm0
	movl	$10, %esi
	vmovdqa	%xmm0, 128(%rsp)
	vmovdqa	.LC123(%rip), %xmm0
	movw	%si, 192(%rsp)
	vmovdqa	%xmm0, 144(%rsp)
	vmovdqa	.LC124(%rip), %xmm0
	movq	8(%r13), %rdi
	vmovdqa	%xmm0, 160(%rsp)
	vmovdqa	.LC125(%rip), %xmm0
	leaq	128(%rsp), %rsi
	vmovdqa	%xmm0, 176(%rsp)
	movl	$65, %edx
	movq	%rax, 56(%rsp)
	call	*0(%r13)
	movl	$128, %edx
	movl	$1, %esi
	movq	%rbp, %rdi
	xorl	%eax, %eax
	movl	%r15d, %r9d
	movl	%r14d, %r8d
	leaq	.LC119(%rip), %rcx
	call	__sprintf_chk@PLT
	movq	8(%r13), %rdi
	movl	%eax, %edx
	movq	%rbp, %rsi
	call	*0(%r13)
	testl	%r14d, %r14d
	jle	.L744
	movl	12(%rsp), %eax
	movl	$1, 28(%rsp)
	movl	%eax, %ecx
	imull	%ebx, %ecx
	movbew	%ax, 78(%rsp)
	movq	%r13, %r15
	movl	%ecx, 68(%rsp)
	leal	-8(%rax), %ecx
	movl	%ecx, 72(%rsp)
	leal	-3(%rbx), %ecx
	movl	%ecx, 24(%rsp)
	leal	(%rax,%rax), %ecx
	movl	%ecx, 88(%rsp)
	addl	%eax, %ecx
	movl	%ecx, 92(%rsp)
	leaq	0(,%rbx,4), %rax
	movq	%rax, 16(%rsp)
	movl	28(%rsp), %eax
.L743:
	movl	stbi__flip_vertically_on_write(%rip), %ecx
	leal	-1(%rax), %edx
	testl	%ecx, %ecx
	je	.L740
	movl	64(%rsp), %edx
	subl	%eax, %edx
.L740:
	imull	68(%rsp), %edx
	movq	80(%rsp), %rax
	cmpl	$32759, 72(%rsp)
	movslq	%edx, %rdx
	leaq	(%rax,%rdx,4), %rbp
	movzwl	78(%rsp), %eax
	movl	$514, 124(%rsp)
	movw	%ax, 126(%rsp)
	jbe	.L741
	movl	12(%rsp), %eax
	xorl	%r13d, %r13d
	leaq	120(%rsp), %rbx
	testl	%eax, %eax
	jg	.L751
	jmp	.L750
	.p2align 4,,10
	.p2align 3
.L778:
	vmovss	.LC120(%rip), %xmm5
	vmovaps	%xmm1, %xmm2
	vcomiss	%xmm2, %xmm5
	vmovaps	%xmm1, %xmm3
	vmovaps	%xmm1, %xmm4
	jbe	.L797
.L807:
	movl	$0, 120(%rsp)
.L805:
	movq	8(%r15), %rdi
	movl	$4, %edx
	movq	%rbx, %rsi
	incl	%r13d
	call	*(%r15)
	addq	16(%rsp), %rbp
	cmpl	%r13d, 12(%rsp)
	je	.L750
.L751:
	cmpl	$1, 24(%rsp)
	vmovss	0(%rbp), %xmm1
	ja	.L778
	vmovss	8(%rbp), %xmm4
	vmovss	4(%rbp), %xmm3
	vmovss	.LC120(%rip), %xmm5
	vmaxss	%xmm4, %xmm3, %xmm2
	vmaxss	%xmm2, %xmm1, %xmm2
	vcomiss	%xmm2, %xmm5
	ja	.L807
.L797:
	leaq	116(%rsp), %rdi
	vmovss	%xmm1, 40(%rsp)
	vmovss	%xmm3, 36(%rsp)
	vmovss	%xmm4, 32(%rsp)
	vmovss	%xmm2, (%rsp)
	vcvtss2sd	%xmm2, %xmm2, %xmm0
	call	frexp@PLT
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	vmulss	.LC121(%rip), %xmm0, %xmm0
	vmovss	(%rsp), %xmm2
	vmovss	40(%rsp), %xmm1
	vmovss	36(%rsp), %xmm3
	vmovss	32(%rsp), %xmm4
	vdivss	%xmm2, %xmm0, %xmm0
	xorl	%eax, %eax
	vmulss	%xmm1, %xmm0, %xmm1
	vmulss	%xmm3, %xmm0, %xmm3
	vmulss	%xmm4, %xmm0, %xmm0
	vcvttss2sil	%xmm1, %edx
	vcvttss2sil	%xmm0, %ecx
	movb	%dl, %al
	vcvttss2sil	%xmm3, %edx
	movzbl	%cl, %ecx
	sall	$16, %ecx
	movb	%dl, %ah
	movl	116(%rsp), %edx
	movzwl	%ax, %eax
	addl	$-128, %edx
	sall	$24, %edx
	orl	%ecx, %eax
	orl	%edx, %eax
	movl	%eax, 120(%rsp)
	jmp	.L805
.L773:
	addq	48(%rsp), %rbx
	decl	32(%rsp)
	jne	.L775
.L750:
	movl	28(%rsp), %eax
	leal	1(%rax), %edx
	cmpl	%eax, 64(%rsp)
	je	.L744
	movl	%edx, 28(%rsp)
	movl	%edx, %eax
	jmp	.L743
.L741:
	movq	56(%rsp), %rax
	movl	12(%rsp), %edx
	movq	%rax, %rbx
	movq	%rdx, %rcx
	movq	%rax, %r14
	addq	%rax, %rdx
	movslq	92(%rsp), %rax
	movslq	%ecx, %rcx
	movq	%rbx, 96(%rsp)
	movq	%r15, 104(%rsp)
	movq	%rdx, (%rsp)
	movq	%rcx, 48(%rsp)
	movslq	88(%rsp), %r13
	movq	16(%rsp), %rbx
	movq	%rax, %r12
	movq	%rcx, %r15
	jmp	.L757
.L781:
	vmovss	.LC120(%rip), %xmm6
	vmovaps	%xmm1, %xmm2
	vcomiss	%xmm2, %xmm6
	vmovaps	%xmm1, %xmm4
	vmovaps	%xmm1, %xmm3
	jbe	.L798
.L809:
	movl	$0, 120(%rsp)
	xorl	%edx, %edx
	xorl	%esi, %esi
	xorl	%edi, %edi
	xorl	%r8d, %r8d
.L756:
	movb	%r8b, (%r14)
	movb	%dil, (%r14,%r15)
	movb	%sil, (%r14,%r13)
	movb	%dl, (%r14,%r12)
	incq	%r14
	addq	%rbx, %rbp
	cmpq	%r14, (%rsp)
	je	.L808
.L757:
	cmpl	$1, 24(%rsp)
	vmovss	0(%rbp), %xmm1
	ja	.L781
	vmovss	8(%rbp), %xmm4
	vmovss	4(%rbp), %xmm3
	vmovss	.LC120(%rip), %xmm6
	vmaxss	%xmm4, %xmm3, %xmm2
	vmaxss	%xmm2, %xmm1, %xmm2
	vcomiss	%xmm2, %xmm6
	ja	.L809
.L798:
	leaq	116(%rsp), %rdi
	vmovss	%xmm1, 44(%rsp)
	vmovss	%xmm3, 40(%rsp)
	vmovss	%xmm4, 36(%rsp)
	vmovss	%xmm2, 32(%rsp)
	vcvtss2sd	%xmm2, %xmm2, %xmm0
	call	frexp@PLT
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	vmulss	.LC121(%rip), %xmm0, %xmm0
	vmovss	32(%rsp), %xmm2
	vmovss	44(%rsp), %xmm1
	vmovss	40(%rsp), %xmm3
	vmovss	36(%rsp), %xmm4
	vdivss	%xmm2, %xmm0, %xmm0
	movl	116(%rsp), %edx
	xorl	%ecx, %ecx
	addl	$-128, %edx
	movl	%edx, %r10d
	sall	$24, %r10d
	vmulss	%xmm1, %xmm0, %xmm1
	vmulss	%xmm3, %xmm0, %xmm3
	vmulss	%xmm4, %xmm0, %xmm0
	vcvttss2sil	%xmm1, %r11d
	vcvttss2sil	%xmm3, %eax
	vcvttss2sil	%xmm0, %r9d
	movb	%r11b, %cl
	movb	%al, %ch
	movl	%r9d, %esi
	movzbl	%r9b, %r9d
	sall	$16, %r9d
	movzwl	%cx, %ecx
	orl	%r9d, %ecx
	orl	%r10d, %ecx
	movl	%ecx, 120(%rsp)
	movl	%r11d, %r8d
	movl	%eax, %edi
	jmp	.L756
.L808:
	movq	104(%rsp), %r15
	leaq	124(%rsp), %rsi
	movq	8(%r15), %rdi
	movl	$4, %edx
	movq	96(%rsp), %rbx
	call	*(%r15)
	leaq	116(%rsp), %rax
	movl	$4, 32(%rsp)
	movq	%rax, (%rsp)
.L775:
	xorl	%r14d, %r14d
	.p2align 4,,10
	.p2align 3
.L766:
	movl	12(%rsp), %ecx
	cmpl	%r14d, %ecx
	jle	.L773
	movslq	%r14d, %rax
	leal	2(%r14), %esi
	leaq	(%rbx,%rax), %rdx
	movl	%r14d, %r13d
	movl	%ecx, %edi
	cmpl	%esi, %ecx
	jg	.L761
	jmp	.L810
	.p2align 4,,10
	.p2align 3
.L759:
	incl	%esi
	incl	%r13d
	incq	%rdx
	cmpl	%esi, %edi
	je	.L806
.L761:
	movzbl	(%rdx), %ecx
	cmpb	1(%rdx), %cl
	jne	.L759
	cmpb	2(%rdx), %cl
	jne	.L759
	cmpl	%esi, 12(%rsp)
	jle	.L806
	cmpl	%r13d, %r14d
	jl	.L764
	jmp	.L765
	.p2align 4,,10
	.p2align 3
.L811:
	movslq	%r14d, %rax
.L764:
	movl	%r13d, %ebp
	subl	%r14d, %ebp
	movl	$128, %edx
	cmpl	%edx, %ebp
	cmovg	%edx, %ebp
	movq	8(%r15), %rdi
	movb	%bpl, 116(%rsp)
	movq	(%rsp), %rsi
	movl	$1, %edx
	leaq	(%rbx,%rax), %r12
	call	*(%r15)
	movq	8(%r15), %rdi
	movl	%ebp, %edx
	movq	%r12, %rsi
	addl	%ebp, %r14d
	call	*(%r15)
	cmpl	%r13d, %r14d
	jl	.L811
.L765:
	leal	2(%r13), %eax
	cmpl	%eax, 12(%rsp)
	jle	.L766
	cmpl	%r13d, 12(%rsp)
	jle	.L768
	movslq	%r14d, %rax
	movzbl	(%rbx,%rax), %edx
	movslq	%r13d, %rax
	movl	12(%rsp), %ecx
	addq	%rbx, %rax
	jmp	.L769
	.p2align 4,,10
	.p2align 3
.L772:
	incl	%r13d
	incq	%rax
	cmpl	%r13d, %ecx
	je	.L768
.L769:
	cmpb	%dl, (%rax)
	je	.L772
.L768:
	leaq	115(%rsp), %r12
	cmpl	%r13d, %r14d
	jge	.L766
	.p2align 4,,10
	.p2align 3
.L770:
	movl	%r13d, %ebp
	subl	%r14d, %ebp
	movl	$127, %edx
	cmpl	%edx, %ebp
	cmovg	%edx, %ebp
	movslq	%r14d, %rdx
	movzbl	(%rbx,%rdx), %edx
	movq	8(%r15), %rdi
	movb	%dl, 115(%rsp)
	leal	-128(%rbp), %edx
	movb	%dl, 116(%rsp)
	movq	(%rsp), %rsi
	movl	$1, %edx
	call	*(%r15)
	movq	8(%r15), %rdi
	movl	$1, %edx
	movq	%r12, %rsi
	addl	%ebp, %r14d
	call	*(%r15)
	cmpl	%r13d, %r14d
	jl	.L770
	jmp	.L766
	.p2align 4,,10
	.p2align 3
.L806:
	movl	12(%rsp), %r13d
	jmp	.L764
.L810:
	movl	%ecx, %r13d
	jmp	.L764
.L744:
	movq	56(%rsp), %rdi
	call	free@PLT
	movq	344(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L812
	addq	$360, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
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
	movl	$1, %eax
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L812:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE856:
	.size	stbi_write_hdr_core.part.0, .-stbi_write_hdr_core.part.0
	.p2align 4
	.type	stbi__malloc_mad4.constprop.0, @function
stbi__malloc_mad4.constprop.0:
.LFB868:
	.cfi_startproc
	movl	%edi, %eax
	orl	%esi, %eax
	movl	%edx, %r8d
	js	.L813
	testl	%esi, %esi
	je	.L815
	movl	$2147483647, %eax
	cltd
	idivl	%esi
	cmpl	%eax, %edi
	jle	.L815
.L813:
	xorl	%eax, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L815:
	testl	%r8d, %r8d
	js	.L813
	imull	%esi, %edi
	testl	%r8d, %r8d
	je	.L816
	movl	$2147483647, %eax
	cltd
	idivl	%r8d
	cmpl	%eax, %edi
	jg	.L813
.L816:
	testl	%ecx, %ecx
	js	.L813
	imull	%edi, %r8d
	testl	%ecx, %ecx
	je	.L817
	movl	$2147483647, %eax
	cltd
	idivl	%ecx
	cmpl	%eax, %r8d
	jg	.L813
.L817:
	imull	%r8d, %ecx
	movslq	%ecx, %rdi
	jmp	malloc@PLT
	.cfi_endproc
.LFE868:
	.size	stbi__malloc_mad4.constprop.0, .-stbi__malloc_mad4.constprop.0
	.p2align 4
	.type	stbi__malloc_mad3, @function
stbi__malloc_mad3:
.LFB589:
	.cfi_startproc
	movl	%edi, %eax
	orl	%esi, %eax
	movl	%edx, %r8d
	js	.L833
	testl	%esi, %esi
	je	.L835
	movl	$2147483647, %eax
	cltd
	idivl	%esi
	cmpl	%eax, %edi
	jle	.L835
.L833:
	xorl	%eax, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L835:
	testl	%r8d, %r8d
	js	.L833
	imull	%esi, %edi
	testl	%r8d, %r8d
	je	.L836
	movl	$2147483647, %esi
	movl	%esi, %eax
	cltd
	idivl	%r8d
	cmpl	%eax, %edi
	jg	.L833
	imull	%edi, %r8d
	subl	%ecx, %esi
	cmpl	%r8d, %esi
	jl	.L833
.L836:
	addl	%r8d, %ecx
	movslq	%ecx, %rdi
	jmp	malloc@PLT
	.cfi_endproc
.LFE589:
	.size	stbi__malloc_mad3, .-stbi__malloc_mad3
	.p2align 4
	.type	stbiw__outfile.constprop.0, @function
stbiw__outfile.constprop.0:
.LFB872:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	%ecx, %r14d
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movl	%r9d, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	subq	$280, %rsp
	.cfi_def_cfa_offset 336
	movq	344(%rsp), %rdi
	movl	%r8d, 16(%rsp)
	movq	%rdi, 24(%rsp)
	movq	368(%rsp), %rsi
	testb	%al, %al
	je	.L848
	vmovaps	%xmm0, 144(%rsp)
	vmovaps	%xmm1, 160(%rsp)
	vmovaps	%xmm2, 176(%rsp)
	vmovaps	%xmm3, 192(%rsp)
	vmovaps	%xmm4, 208(%rsp)
	vmovaps	%xmm5, 224(%rsp)
	vmovaps	%xmm6, 240(%rsp)
	vmovaps	%xmm7, 256(%rsp)
.L848:
	movl	16(%rsp), %edi
	movq	%fs:40, %rax
	movq	%rax, 88(%rsp)
	xorl	%eax, %eax
	orl	%r14d, %edi
	jns	.L886
.L847:
	movq	88(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L887
	addq	$280, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
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
	ret
	.p2align 4,,10
	.p2align 3
.L886:
	.cfi_restore_state
	leaq	376(%rsp), %rax
	movq	%rax, 72(%rsp)
	leaq	64(%rsp), %rdx
	leaq	96(%rsp), %rax
	movq	%rbx, %rdi
	movl	$48, 64(%rsp)
	movl	$48, 68(%rsp)
	movq	%rax, 80(%rsp)
	call	stbiw__writefv
	movl	16(%rsp), %r10d
	movl	$0, 60(%rsp)
	testl	%r10d, %r10d
	je	.L872
	movl	stbi__flip_vertically_on_write(%rip), %r9d
	testl	%r9d, %r9d
	jne	.L878
	movl	16(%rsp), %eax
	movl	$-1, 32(%rsp)
	decl	%eax
	movl	%eax, 4(%rsp)
	movl	$-1, 16(%rsp)
.L851:
	movl	%r14d, %eax
	imull	%r12d, %eax
	movl	32(%rsp), %edi
	imull	%eax, %edi
	imull	4(%rsp), %eax
	movl	%edi, 36(%rsp)
	movl	%eax, 20(%rsp)
	leaq	60(%rsp), %rax
	movq	%rax, 40(%rsp)
	.p2align 4,,10
	.p2align 3
.L875:
	movl	80(%rbx), %edx
	testl	%r14d, %r14d
	jle	.L874
	movslq	20(%rsp), %rbp
	movslq	%r12d, %r15
	addq	24(%rsp), %rbp
	xorl	%r13d, %r13d
	jmp	.L869
	.p2align 4,,10
	.p2align 3
.L889:
	leal	-1(%r12), %eax
	cmpl	$1, %eax
	ja	.L854
	movl	336(%rsp), %r8d
	movzbl	0(%rbp), %eax
	movslq	%edx, %rsi
	testl	%r8d, %r8d
	jne	.L888
	incq	%rsi
	cmpq	$64, %rsi
	ja	.L860
	movslq	%edx, %rcx
	incl	%edx
.L861:
	movl	%edx, 80(%rbx)
	movb	%al, 16(%rbx,%rcx)
	.p2align 4,,10
	.p2align 3
.L854:
	cmpl	$1, 352(%rsp)
	jne	.L864
	movslq	%edx, %rax
	incq	%rax
	movzbl	-1(%rbp,%r15), %ecx
	cmpq	$64, %rax
	ja	.L867
	movslq	%edx, %rax
	incl	%edx
.L868:
	movl	%edx, 80(%rbx)
	movb	%cl, 16(%rbx,%rax)
.L864:
	incl	%r13d
	addq	%r15, %rbp
	cmpl	%r13d, %r14d
	je	.L874
.L869:
	movq	(%rbx), %rcx
	movq	8(%rbx), %rdi
	movslq	%edx, %rax
	cmpl	$3, %r12d
	je	.L852
	jle	.L889
	cmpl	$4, %r12d
	jne	.L854
	movl	352(%rsp), %r11d
	movslq	%edx, %rax
	movzbl	0(%rbp), %r8d
	movzbl	1(%rbp), %r9d
	movzbl	2(%rbp), %esi
	leaq	3(%rax), %r10
	testl	%r11d, %r11d
	jne	.L852
	movzbl	3(%rbp), %r11d
	movzbl	%r8b, %eax
	subl	$255, %eax
	imull	%r11d, %eax
	movslq	%eax, %r8
	imulq	$-2139062143, %r8, %r8
	shrq	$32, %r8
	addl	%eax, %r8d
	sarl	$31, %eax
	sarl	$7, %r8d
	cmpb	$1, %al
	sbbb	$0, %r8b
	movzbl	%r9b, %eax
	subl	$255, %esi
	imull	%r11d, %esi
	imull	%r11d, %eax
	movl	$2155905153, %r9d
	imulq	%r9, %rax
	movslq	%esi, %r9
	imulq	$-2139062143, %r9, %r9
	shrq	$39, %rax
	shrq	$32, %r9
	addl	%esi, %r9d
	sarl	$31, %esi
	sarl	$7, %r9d
	cmpb	$1, %sil
	sbbb	$0, %r9b
	cmpq	$64, %r10
	ja	.L862
	leal	1(%rdx), %esi
	leal	2(%rdx), %ecx
	movslq	%edx, %rdi
	addl	$3, %edx
.L863:
	movslq	%esi, %rsi
	movl	%edx, 80(%rbx)
	incl	%r13d
	movb	%r9b, 16(%rbx,%rdi)
	movb	%al, 16(%rbx,%rsi)
	movslq	%ecx, %rax
	movb	%r8b, 16(%rbx,%rax)
	addq	%r15, %rbp
	cmpl	%r13d, %r14d
	jne	.L869
	.p2align 4,,10
	.p2align 3
.L874:
	testl	%edx, %edx
	je	.L870
	movq	8(%rbx), %rdi
	leaq	16(%rbx), %rsi
	call	*(%rbx)
	movl	$0, 80(%rbx)
	movq	8(%rbx), %rdi
	movl	360(%rsp), %edx
	movq	40(%rsp), %rsi
	call	*(%rbx)
	movl	32(%rsp), %edi
	movl	36(%rsp), %ecx
	addl	%edi, 4(%rsp)
	addl	%ecx, 20(%rsp)
	movl	4(%rsp), %eax
	cmpl	%eax, 16(%rsp)
	jne	.L875
.L872:
	movl	$1, %eax
	jmp	.L847
.L878:
	movl	$1, 32(%rsp)
	movl	$0, 4(%rsp)
	jmp	.L851
	.p2align 4,,10
	.p2align 3
.L852:
	addq	$3, %rax
	movzbl	0(%rbp), %r8d
	movzbl	1(%rbp), %r9d
	movzbl	2(%rbp), %r10d
	cmpq	$64, %rax
	ja	.L865
	leal	1(%rdx), %ecx
	leal	2(%rdx), %eax
	movslq	%edx, %rsi
	addl	$3, %edx
.L866:
	movslq	%ecx, %rcx
	cltq
	movl	%edx, 80(%rbx)
	movb	%r10b, 16(%rbx,%rsi)
	movb	%r9b, 16(%rbx,%rcx)
	movb	%r8b, 16(%rbx,%rax)
	jmp	.L854
	.p2align 4,,10
	.p2align 3
.L867:
	movq	8(%rbx), %rdi
	leaq	16(%rbx), %rsi
	movb	%cl, 10(%rsp)
	call	*(%rbx)
	movzbl	10(%rsp), %ecx
	movl	$1, %edx
	xorl	%eax, %eax
	jmp	.L868
	.p2align 4,,10
	.p2align 3
.L865:
	leaq	16(%rbx), %rsi
	movb	%r10b, 12(%rsp)
	movb	%r9b, 11(%rsp)
	movb	%r8b, 10(%rsp)
	call	*%rcx
	movzbl	12(%rsp), %r10d
	movzbl	11(%rsp), %r9d
	movzbl	10(%rsp), %r8d
	movl	$2, %eax
	movl	$1, %ecx
	movl	$3, %edx
	xorl	%esi, %esi
	jmp	.L866
	.p2align 4,,10
	.p2align 3
.L860:
	leaq	16(%rbx), %rsi
	movb	%al, 10(%rsp)
	call	*%rcx
	movzbl	10(%rsp), %eax
	xorl	%ecx, %ecx
	movl	$1, %edx
	jmp	.L861
	.p2align 4,,10
	.p2align 3
.L888:
	addq	$3, %rsi
	cmpq	$64, %rsi
	ja	.L858
	leal	1(%rdx), %esi
	leal	2(%rdx), %ecx
	movslq	%edx, %rdi
	addl	$3, %edx
.L859:
	movslq	%esi, %rsi
	movslq	%ecx, %rcx
	movl	%edx, 80(%rbx)
	movb	%al, 16(%rbx,%rdi)
	movb	%al, 16(%rbx,%rsi)
	movb	%al, 16(%rbx,%rcx)
	jmp	.L854
	.p2align 4,,10
	.p2align 3
.L862:
	leaq	16(%rbx), %rsi
	movl	%eax, 12(%rsp)
	movb	%r9b, 11(%rsp)
	movb	%r8b, 10(%rsp)
	call	*%rcx
	movl	12(%rsp), %eax
	movzbl	11(%rsp), %r9d
	movzbl	10(%rsp), %r8d
	xorl	%edi, %edi
	movl	$2, %ecx
	movl	$1, %esi
	movl	$3, %edx
	jmp	.L863
	.p2align 4,,10
	.p2align 3
.L870:
	movq	8(%rbx), %rdi
	movl	360(%rsp), %edx
	movq	40(%rsp), %rsi
	call	*(%rbx)
	movl	32(%rsp), %edi
	movl	36(%rsp), %ecx
	addl	%edi, 4(%rsp)
	addl	%ecx, 20(%rsp)
	movl	4(%rsp), %eax
	cmpl	16(%rsp), %eax
	jne	.L875
	movl	$1, %eax
	jmp	.L847
	.p2align 4,,10
	.p2align 3
.L858:
	leaq	16(%rbx), %rsi
	movb	%al, 10(%rsp)
	call	*%rcx
	movl	336(%rsp), %esi
	movzbl	10(%rsp), %eax
	movl	$2, %ecx
	movl	$3, %edx
	xorl	%edi, %edi
	jmp	.L859
.L887:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE872:
	.size	stbiw__outfile.constprop.0, .-stbiw__outfile.constprop.0
	.p2align 4
	.type	stbiw__zlib_flushf, @function
stbiw__zlib_flushf:
.LFB814:
	.cfi_startproc
	cmpl	$7, (%rdx)
	movq	%rdi, %rax
	jle	.L901
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movq	%rdx, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rsi, %rbx
	jmp	.L895
	.p2align 4,,10
	.p2align 3
.L905:
	movslq	-4(%rax), %rdx
	movl	-8(%rax), %esi
	leal	1(%rdx), %ecx
	cmpl	%esi, %ecx
	jl	.L893
	leal	1(%rsi,%rsi), %r12d
	movslq	%r12d, %rsi
	addq	$8, %rsi
	leaq	-8(%rax), %rdi
	call	realloc@PLT
	movq	%rax, %rdx
	testq	%rax, %rax
	je	.L897
.L894:
	movl	%r12d, (%rdx)
	leaq	8(%rdx), %rax
	movslq	4(%rdx), %rdx
	leal	1(%rdx), %ecx
.L893:
	movl	(%rbx), %esi
	movl	%ecx, -4(%rax)
	movb	%sil, (%rax,%rdx)
	shrl	$8, (%rbx)
	movl	0(%rbp), %edi
	leal	-8(%rdi), %edx
	movl	%edx, 0(%rbp)
	cmpl	$7, %edx
	jle	.L904
.L895:
	testq	%rax, %rax
	jne	.L905
	movl	$10, %edi
	call	malloc@PLT
	movq	%rax, %rdx
	testq	%rax, %rax
	je	.L897
	movl	$0, 4(%rdx)
	movl	$2, %r12d
	jmp	.L894
	.p2align 4,,10
	.p2align 3
.L904:
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L901:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	ret
.L897:
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	.cfi_offset 6, -24
	.cfi_offset 12, -16
	leaq	__PRETTY_FUNCTION__.22(%rip), %rcx
	movl	$830, %edx
	leaq	.LC12(%rip), %rsi
	leaq	.LC117(%rip), %rdi
	call	__assert_fail@PLT
	.cfi_endproc
.LFE814:
	.size	stbiw__zlib_flushf, .-stbiw__zlib_flushf
	.p2align 4
	.type	stbi_write_tga_core, @function
stbi_write_tga_core:
.LFB803:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	leal	-2(%rcx), %eax
	andl	$-3, %eax
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movl	%ecx, %r13d
	movl	%eax, %ecx
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rdi, %rbp
	movl	%edx, %edi
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%r8, %rbx
	subq	$72, %rsp
	.cfi_def_cfa_offset 128
	movl	%eax, 16(%rsp)
	cmpl	$1, %eax
	movl	%r13d, %eax
	sbbl	$0, %eax
	cmpl	$2, %eax
	setl	%r8b
	movl	%edx, 48(%rsp)
	movl	%eax, %edx
	setl	%al
	movzbl	%r8b, %r8d
	movzbl	%al, %eax
	addl	$10, %r8d
	addl	$2, %eax
	xorl	%r9d, %r9d
	orl	%esi, %edi
	movl	%esi, 20(%rsp)
	js	.L906
	testl	%ecx, %ecx
	sete	%cl
	movzbl	%cl, %ecx
	movl	stbi_write_tga_with_rle(%rip), %r10d
	addl	%ecx, %edx
	leal	0(,%rcx,8), %esi
	sall	$3, %edx
	testl	%r10d, %r10d
	je	.L1008
	pushq	%rsi
	.cfi_def_cfa_offset 136
	xorl	%r9d, %r9d
	xorl	%ecx, %ecx
	pushq	%rdx
	.cfi_def_cfa_offset 144
	leaq	.LC118(%rip), %rsi
	xorl	%edx, %edx
	movl	64(%rsp), %r14d
	movq	%rbp, %rdi
	pushq	%r14
	.cfi_def_cfa_offset 152
	movl	44(%rsp), %eax
	pushq	%rax
	.cfi_def_cfa_offset 160
	xorl	%eax, %eax
	pushq	$0
	.cfi_def_cfa_offset 168
	pushq	$0
	.cfi_def_cfa_offset 176
	pushq	$0
	.cfi_def_cfa_offset 184
	pushq	$0
	.cfi_def_cfa_offset 192
	call	stbiw__writef.constprop.0
	movl	stbi__flip_vertically_on_write(%rip), %r9d
	addq	$64, %rsp
	.cfi_def_cfa_offset 128
	testl	%r9d, %r9d
	jne	.L973
	decl	%r14d
	movl	%r14d, 44(%rsp)
	movl	$-1, 52(%rsp)
	movl	$-1, 48(%rsp)
.L911:
	movl	48(%rsp), %ecx
	cmpl	%ecx, 44(%rsp)
	je	.L912
	movl	20(%rsp), %ecx
	testl	%ecx, %ecx
	jle	.L912
	movl	52(%rsp), %eax
	movslq	%r13d, %r12
	imull	%ecx, %eax
	imull	%r13d, %eax
	cltq
	movq	%rax, 56(%rsp)
	movl	44(%rsp), %eax
	imull	%ecx, %eax
	imull	%r13d, %eax
	cltq
	addq	%rbx, %rax
	movq	%rax, (%rsp)
	leal	-1(%rcx), %eax
	movl	%eax, 36(%rsp)
	.p2align 4,,10
	.p2align 3
.L914:
	xorl	%r14d, %r14d
	.p2align 4,,10
	.p2align 3
.L913:
	movl	%r13d, %ecx
	imull	%r14d, %ecx
	movq	(%rsp), %rdi
	leal	1(%r14), %eax
	movslq	%ecx, %rbx
	addq	%rdi, %rbx
	cmpl	%r14d, 36(%rsp)
	jle	.L974
	leal	(%rcx,%r13), %r15d
	movslq	%r15d, %rsi
	addq	%rdi, %rsi
	movq	%r12, %rdx
	movq	%rbx, %rdi
	call	memcmp@PLT
	movl	%eax, %ecx
	movl	%eax, 8(%rsp)
	leal	2(%r14), %eax
	testl	%ecx, %ecx
	je	.L916
	movl	20(%rsp), %esi
	cmpl	%eax, %esi
	jle	.L975
	leal	(%r15,%r13), %ecx
	movslq	%ecx, %rcx
	addq	(%rsp), %rcx
	movq	%rbx, 8(%rsp)
	movq	%rbp, 24(%rsp)
	movl	%r13d, 32(%rsp)
	movq	%rbx, %rbp
	movq	%r12, %r13
	movl	$2, %r15d
	movl	%esi, %ebx
	movq	%rcx, %r12
	jmp	.L918
	.p2align 4,,10
	.p2align 3
.L1009:
	incl	%r15d
	leal	(%r14,%r15), %eax
	addq	%r13, %rbp
	addq	%r13, %r12
	cmpl	%eax, %ebx
	jle	.L978
	cmpl	$127, %r15d
	jg	.L978
.L918:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	memcmp@PLT
	testl	%eax, %eax
	jne	.L1009
	decl	%r15d
	movq	%r13, %r12
	movq	8(%rsp), %rbx
	movq	24(%rsp), %rbp
	movl	32(%rsp), %r13d
	leal	-1(%r15), %ecx
	addl	%r15d, %r14d
.L915:
	movslq	80(%rbp), %rax
	leaq	1(%rax), %rsi
	movq	%rax, %rdx
	cmpq	$64, %rsi
	ja	.L924
	incl	%edx
.L925:
	movl	%edx, 80(%rbp)
	movb	%cl, 16(%rbp,%rax)
	xorl	%eax, %eax
	movl	%r14d, 40(%rsp)
	movq	%r12, %r14
	movl	%r15d, %r12d
	movl	%eax, %r15d
	jmp	.L941
	.p2align 4,,10
	.p2align 3
.L1011:
	leal	-1(%r13), %eax
	cmpl	$1, %eax
	ja	.L928
	movslq	80(%rbp), %rax
	movzbl	(%rbx), %r8d
	leaq	1(%rax), %rsi
	movq	%rax, %rdx
	cmpq	$64, %rsi
	ja	.L931
	incl	%edx
.L932:
	movl	%edx, 80(%rbp)
	movb	%r8b, 16(%rbp,%rax)
.L933:
	movl	16(%rsp), %edi
	testl	%edi, %edi
	jne	.L928
	movslq	%edx, %rax
	incq	%rax
	movzbl	-1(%rbx,%r14), %r8d
	cmpq	$64, %rax
	ja	.L939
.L1012:
	leal	1(%rdx), %eax
.L940:
	movslq	%edx, %rdx
	movl	%eax, 80(%rbp)
	movb	%r8b, 16(%rbp,%rdx)
.L928:
	incl	%r15d
	addq	%r14, %rbx
	cmpl	%r15d, %r12d
	je	.L1010
.L941:
	cmpl	$3, %r13d
	je	.L926
	jle	.L1011
	cmpl	$4, %r13d
	jne	.L928
	movl	16(%rsp), %r8d
	testl	%r8d, %r8d
	je	.L926
	movzbl	(%rbx), %eax
	movzbl	3(%rbx), %edx
	subl	$255, %eax
	imull	%edx, %eax
	movzbl	1(%rbx), %r10d
	movslq	80(%rbp), %r11
	movslq	%eax, %r8
	imulq	$-2139062143, %r8, %r8
	movq	%r11, %rsi
	shrq	$32, %r8
	addl	%eax, %r8d
	sarl	$31, %eax
	sarl	$7, %r8d
	cmpb	$1, %al
	sbbb	$0, %r8b
	imull	%edx, %r10d
	movl	$2155905153, %eax
	imulq	%rax, %r10
	movzbl	2(%rbx), %eax
	subl	$255, %eax
	imull	%edx, %eax
	shrq	$39, %r10
	movslq	%eax, %r9
	imulq	$-2139062143, %r9, %r9
	shrq	$32, %r9
	addl	%eax, %r9d
	sarl	$31, %eax
	sarl	$7, %r9d
	cmpb	$1, %al
	leaq	3(%r11), %rax
	sbbb	$0, %r9b
	cmpq	$64, %rax
	ja	.L934
	leal	3(%r11), %edx
	leal	1(%r11), %edi
	addl	$2, %esi
	leaq	4(%r11), %rax
.L935:
	movslq	%edi, %rdi
	movslq	%esi, %rsi
	movl	%edx, 80(%rbp)
	movb	%r9b, 16(%rbp,%r11)
	movb	%r10b, 16(%rbp,%rdi)
	movb	%r8b, 16(%rbp,%rsi)
	movzbl	-1(%rbx,%r14), %r8d
	cmpq	$64, %rax
	jbe	.L1012
.L939:
	movq	8(%rbp), %rdi
	leaq	16(%rbp), %rsi
	movb	%r8b, 8(%rsp)
	call	*0(%rbp)
	movzbl	8(%rsp), %r8d
	movl	$1, %eax
	xorl	%edx, %edx
	jmp	.L940
	.p2align 4,,10
	.p2align 3
.L1010:
	movq	%r14, %r12
	movl	40(%rsp), %r14d
.L942:
	cmpl	%r14d, 20(%rsp)
	jg	.L913
	movl	52(%rsp), %ecx
	movq	56(%rsp), %rbx
	addl	%ecx, 44(%rsp)
	addq	%rbx, (%rsp)
	movl	44(%rsp), %eax
	cmpl	48(%rsp), %eax
	jne	.L914
.L912:
	movl	80(%rbp), %edx
	testl	%edx, %edx
	je	.L1007
	movq	8(%rbp), %rdi
	leaq	16(%rbp), %rsi
	call	*0(%rbp)
	movl	$0, 80(%rbp)
.L1007:
	movl	$1, %r9d
.L906:
	addq	$72, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
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
	movl	%r9d, %eax
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L1008:
	.cfi_restore_state
	subq	$8, %rsp
	.cfi_def_cfa_offset 136
	pushq	%rsi
	.cfi_def_cfa_offset 144
	movl	%r13d, %r9d
	movl	$-1, %esi
	pushq	%rdx
	.cfi_def_cfa_offset 152
	movl	$-1, %edx
	movl	72(%rsp), %r8d
	pushq	%r8
	.cfi_def_cfa_offset 160
	movl	52(%rsp), %edi
	pushq	%rdi
	.cfi_def_cfa_offset 168
	pushq	$0
	.cfi_def_cfa_offset 176
	pushq	$0
	.cfi_def_cfa_offset 184
	pushq	$0
	.cfi_def_cfa_offset 192
	pushq	$0
	.cfi_def_cfa_offset 200
	pushq	$0
	.cfi_def_cfa_offset 208
	pushq	%rax
	.cfi_def_cfa_offset 216
	leaq	.LC118(%rip), %rax
	pushq	$0
	.cfi_def_cfa_offset 224
	pushq	$0
	.cfi_def_cfa_offset 232
	pushq	%rax
	.cfi_def_cfa_offset 240
	xorl	%eax, %eax
	pushq	$0
	.cfi_def_cfa_offset 248
	pushq	%rcx
	.cfi_def_cfa_offset 256
	movl	%edi, %ecx
	movq	%rbp, %rdi
	pushq	%rbx
	.cfi_def_cfa_offset 264
	pushq	$0
	.cfi_def_cfa_offset 272
	call	stbiw__outfile.constprop.0
	movl	%eax, %r9d
	addq	$144, %rsp
	.cfi_def_cfa_offset 128
	jmp	.L906
	.p2align 4,,10
	.p2align 3
.L926:
	movslq	80(%rbp), %rdi
	movzbl	(%rbx), %r8d
	leaq	3(%rdi), %rax
	movzbl	1(%rbx), %r9d
	movzbl	2(%rbx), %r10d
	movq	%rdi, %r11
	cmpq	$64, %rax
	ja	.L937
	leal	3(%rdi), %edx
	leal	1(%rdi), %esi
	leal	2(%rdi), %eax
.L938:
	movslq	%esi, %rsi
	cltq
	movl	%edx, 80(%rbp)
	movb	%r10b, 16(%rbp,%rdi)
	movb	%r9b, 16(%rbp,%rsi)
	movb	%r8b, 16(%rbp,%rax)
	jmp	.L933
	.p2align 4,,10
	.p2align 3
.L937:
	movq	8(%rbp), %rdi
	leaq	16(%rbp), %rsi
	movl	%r11d, %edx
	movb	%r10b, 32(%rsp)
	movb	%r9b, 24(%rsp)
	movb	%r8b, 8(%rsp)
	call	*0(%rbp)
	movzbl	32(%rsp), %r10d
	movzbl	24(%rsp), %r9d
	movzbl	8(%rsp), %r8d
	movl	$2, %eax
	movl	$1, %esi
	movl	$3, %edx
	xorl	%edi, %edi
	jmp	.L938
	.p2align 4,,10
	.p2align 3
.L931:
	movq	8(%rbp), %rdi
	leaq	16(%rbp), %rsi
	movb	%r8b, 8(%rsp)
	call	*0(%rbp)
	movzbl	8(%rsp), %r8d
	movl	$1, %edx
	xorl	%eax, %eax
	jmp	.L932
	.p2align 4,,10
	.p2align 3
.L916:
	movl	20(%rsp), %edi
	cmpl	%eax, %edi
	jle	.L976
	leal	(%r15,%r13), %ecx
	movslq	%ecx, %rcx
	addq	(%rsp), %rcx
	movq	%rbp, 24(%rsp)
	movl	%r13d, 32(%rsp)
	movl	$2, %r15d
	movq	%r12, %r13
	movl	%edi, %ebp
	movq	%rcx, %r12
	jmp	.L922
	.p2align 4,,10
	.p2align 3
.L921:
	incl	%r15d
	leal	(%r14,%r15), %eax
	addq	%r13, %r12
	cmpl	%eax, %ebp
	jle	.L979
	cmpl	$127, %r15d
	jg	.L979
.L922:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	memcmp@PLT
	testl	%eax, %eax
	je	.L921
	movq	%r13, %r12
	movq	24(%rsp), %rbp
	movl	32(%rsp), %r13d
	leal	127(%r15), %ecx
	addl	%r15d, %r14d
.L920:
	movslq	80(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rax, %r8
	cmpq	$64, %rdx
	jbe	.L1013
	movq	8(%rbp), %rdi
	leaq	16(%rbp), %rsi
	movl	%r8d, %edx
	movb	%cl, 24(%rsp)
	call	*0(%rbp)
	movzbl	24(%rsp), %ecx
	movl	$1, 80(%rbp)
	movb	%cl, 16(%rbp)
	cmpl	$3, %r13d
	je	.L943
	jg	.L944
	leal	-1(%r13), %eax
	cmpl	$1, %eax
	ja	.L945
	movzbl	(%rbx), %ecx
	movl	$2, %edx
	movl	$1, %eax
.L954:
	movl	%edx, 80(%rbp)
	movb	%cl, 16(%rbp,%rax)
.L950:
	movl	16(%rsp), %ecx
	testl	%ecx, %ecx
	jne	.L942
	movslq	%edx, %rax
	incq	%rax
	movzbl	-1(%rbx,%r12), %ebx
	cmpq	$64, %rax
	jbe	.L1014
	movq	8(%rbp), %rdi
	leaq	16(%rbp), %rsi
	call	*0(%rbp)
	movl	$1, %eax
.L962:
	movl	%eax, 80(%rbp)
	movslq	8(%rsp), %rax
	movb	%bl, 16(%rbp,%rax)
	jmp	.L942
	.p2align 4,,10
	.p2align 3
.L974:
	movl	%eax, %r14d
	xorl	%ecx, %ecx
	movl	$1, %r15d
	jmp	.L915
	.p2align 4,,10
	.p2align 3
.L944:
	movl	$4, %eax
	movl	$1, %edx
	cmpl	$4, %r13d
	jne	.L945
.L947:
	movl	16(%rsp), %esi
	movzbl	(%rbx), %ecx
	movzbl	1(%rbx), %r8d
	movzbl	2(%rbx), %r9d
	testl	%esi, %esi
	je	.L952
	movzbl	3(%rbx), %esi
	subl	$255, %ecx
	imull	%esi, %ecx
	movzbl	%r8b, %ebx
	movslq	%ecx, %r15
	imulq	$-2139062143, %r15, %r15
	shrq	$32, %r15
	addl	%ecx, %r15d
	sarl	$31, %ecx
	sarl	$7, %r15d
	cmpb	$1, %cl
	sbbb	$0, %r15b
	imull	%esi, %ebx
	movl	$2155905153, %ecx
	imulq	%rcx, %rbx
	leal	-255(%r9), %ecx
	imull	%ecx, %esi
	shrq	$39, %rbx
	movslq	%esi, %rcx
	imulq	$-2139062143, %rcx, %rcx
	shrq	$32, %rcx
	addl	%esi, %ecx
	sarl	$31, %esi
	sarl	$7, %ecx
	cmpb	$1, %sil
	sbbb	$0, %cl
	cmpq	$64, %rax
	ja	.L955
	leal	3(%rdx), %edi
	leal	1(%rdx), %esi
	leal	2(%rdx), %eax
.L956:
	movslq	%edx, %rdx
	movl	%edi, 80(%rbp)
	cltq
	movb	%cl, 16(%rbp,%rdx)
	movslq	%esi, %rdx
	movb	%bl, 16(%rbp,%rdx)
	movb	%r15b, 16(%rbp,%rax)
	jmp	.L942
	.p2align 4,,10
	.p2align 3
.L1013:
	leal	1(%r8), %edx
	movl	%edx, 80(%rbp)
	movb	%cl, 16(%rbp,%rax)
	cmpl	$3, %r13d
	je	.L948
	jg	.L949
	leal	-1(%r13), %ecx
	cmpl	$1, %ecx
	ja	.L950
	movzbl	(%rbx), %ecx
	cmpq	$63, %rax
	jne	.L1015
	movq	8(%rbp), %rdi
	leaq	16(%rbp), %rsi
	movb	%cl, 24(%rsp)
	call	*0(%rbp)
	movzbl	24(%rsp), %ecx
	xorl	%eax, %eax
	movl	$1, %edx
	jmp	.L954
	.p2align 4,,10
	.p2align 3
.L949:
	addq	$4, %rax
	cmpl	$4, %r13d
	je	.L947
	jmp	.L950
	.p2align 4,,10
	.p2align 3
.L934:
	leaq	16(%rbp), %r11
	movq	8(%rbp), %rdi
	movl	%esi, %edx
	movq	%r11, %rsi
	movl	%r10d, 32(%rsp)
	movb	%r8b, 24(%rsp)
	movb	%r9b, 8(%rsp)
	call	*0(%rbp)
	movl	32(%rsp), %r10d
	movzbl	24(%rsp), %r8d
	movzbl	8(%rsp), %r9d
	movl	$4, %eax
	movl	$2, %esi
	movl	$1, %edi
	movl	$3, %edx
	xorl	%r11d, %r11d
	jmp	.L935
	.p2align 4,,10
	.p2align 3
.L924:
	movq	8(%rbp), %rdi
	leaq	16(%rbp), %rsi
	movb	%cl, 8(%rsp)
	call	*0(%rbp)
	movzbl	8(%rsp), %ecx
	movl	$1, %edx
	xorl	%eax, %eax
	jmp	.L925
	.p2align 4,,10
	.p2align 3
.L945:
	movl	16(%rsp), %eax
	testl	%eax, %eax
	jne	.L942
	movl	$1, 8(%rsp)
	movzbl	-1(%rbx,%r12), %ebx
.L968:
	movl	8(%rsp), %eax
	incl	%eax
	jmp	.L962
	.p2align 4,,10
	.p2align 3
.L978:
	movq	%r13, %r12
	movq	8(%rsp), %rbx
	movq	24(%rsp), %rbp
	movl	32(%rsp), %r13d
	leal	-1(%r15), %ecx
	movl	%eax, %r14d
	jmp	.L915
	.p2align 4,,10
	.p2align 3
.L979:
	movq	%r13, %r12
	movq	24(%rsp), %rbp
	movl	32(%rsp), %r13d
	leal	127(%r15), %ecx
	movl	%eax, %r14d
	jmp	.L920
	.p2align 4,,10
	.p2align 3
.L948:
	movzbl	(%rbx), %ecx
	movzbl	1(%rbx), %r8d
	movzbl	2(%rbx), %r9d
	addq	$4, %rax
.L952:
	cmpq	$64, %rax
	jbe	.L1016
	movq	8(%rbp), %rdi
	leaq	16(%rbp), %rsi
	movb	%cl, 40(%rsp)
	movb	%r9b, 32(%rsp)
	movb	%r8b, 24(%rsp)
	call	*0(%rbp)
	movzbl	40(%rsp), %ecx
	movzbl	32(%rsp), %r9d
	movzbl	24(%rsp), %r8d
	xorl	%eax, %eax
	movl	$2, %esi
	movl	$1, %edi
	movl	$3, %edx
.L960:
	movslq	%edi, %rdi
	movslq	%esi, %rsi
	movl	%edx, 80(%rbp)
	movb	%r9b, 16(%rbp,%rax)
	movb	%r8b, 16(%rbp,%rdi)
	movb	%cl, 16(%rbp,%rsi)
	jmp	.L950
	.p2align 4,,10
	.p2align 3
.L943:
	movzbl	(%rbx), %ecx
	movzbl	1(%rbx), %r8d
	movzbl	2(%rbx), %r9d
	movl	$1, %eax
.L958:
	leal	3(%rax), %edx
	leal	1(%rax), %edi
	leal	2(%rax), %esi
	jmp	.L960
.L1014:
	movl	%edx, 8(%rsp)
	jmp	.L968
.L955:
	movq	8(%rbp), %rdi
	leaq	16(%rbp), %rsi
	movb	%cl, 8(%rsp)
	call	*0(%rbp)
	movzbl	8(%rsp), %ecx
	xorl	%edx, %edx
	movl	$2, %eax
	movl	$1, %esi
	movl	$3, %edi
	jmp	.L956
.L1016:
	movslq	%edx, %rax
	jmp	.L958
.L975:
	movl	%eax, %r14d
	movl	$1, %ecx
	movl	$2, %r15d
	jmp	.L915
.L976:
	movl	%eax, %r14d
	movl	$-127, %ecx
	jmp	.L920
.L973:
	movl	$1, 52(%rsp)
	movl	$0, 44(%rsp)
	jmp	.L911
.L1015:
	movslq	%edx, %rax
	leal	2(%r8), %edx
	jmp	.L954
	.cfi_endproc
.LFE803:
	.size	stbi_write_tga_core, .-stbi_write_tga_core
	.section	.rodata.str1.1
.LC126:
	.string	"bad sizes"
.LC127:
	.string	"bad codelengths"
	.text
	.p2align 4
	.type	stbi__zbuild_huffman, @function
stbi__zbuild_huffman:
.LFB682:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	vpxor	%xmm0, %xmm0, %xmm0
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
	movl	%edx, %ebp
	movl	$1024, %edx
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rsi, %rbx
	xorl	%esi, %esi
	subq	$184, %rsp
	.cfi_def_cfa_offset 240
	movq	%fs:40, %rax
	movq	%rax, 168(%rsp)
	xorl	%eax, %eax
	movl	$0, 160(%rsp)
	vmovdqa	%xmm0, 96(%rsp)
	vmovdqa	%xmm0, 112(%rsp)
	vmovdqa	%xmm0, 128(%rsp)
	vmovdqa	%xmm0, 144(%rsp)
	call	memset@PLT
	leal	-1(%rbp), %edx
	movq	%rax, %rcx
	leaq	1(%rbx,%rdx), %rsi
	movq	%rbx, %rax
	.p2align 4,,10
	.p2align 3
.L1018:
	movzbl	(%rax), %edx
	incq	%rax
	incl	96(%rsp,%rdx,4)
	cmpq	%rax, %rsi
	jne	.L1018
	movl	100(%rsp), %esi
	movl	$0, 96(%rsp)
	cmpl	$2, %esi
	jg	.L1019
	movl	104(%rsp), %edx
	cmpl	$4, %edx
	jg	.L1019
	movl	108(%rsp), %edi
	cmpl	$8, %edi
	jg	.L1019
	movl	112(%rsp), %r8d
	cmpl	$16, %r8d
	jg	.L1019
	movl	116(%rsp), %r9d
	cmpl	$32, %r9d
	jg	.L1019
	movl	120(%rsp), %r10d
	cmpl	$64, %r10d
	jg	.L1019
	movl	124(%rsp), %r11d
	cmpl	$128, %r11d
	jg	.L1019
	movl	128(%rsp), %r12d
	cmpl	$256, %r12d
	jg	.L1019
	movl	132(%rsp), %r13d
	cmpl	$512, %r13d
	jg	.L1019
	movl	136(%rsp), %r14d
	cmpl	$1024, %r14d
	jg	.L1019
	movl	140(%rsp), %eax
	movl	%eax, 12(%rsp)
	cmpl	$2048, %eax
	jg	.L1019
	movl	144(%rsp), %eax
	movl	%eax, 16(%rsp)
	cmpl	$4096, %eax
	jg	.L1019
	movl	148(%rsp), %eax
	movl	%eax, 20(%rsp)
	cmpl	$8192, %eax
	jg	.L1019
	movl	152(%rsp), %eax
	movl	%eax, 24(%rsp)
	cmpl	$16384, %eax
	jg	.L1019
	movl	156(%rsp), %eax
	movl	%eax, 28(%rsp)
	cmpl	$32768, %eax
	jg	.L1019
	xorl	%eax, %eax
	movw	%ax, 1026(%rcx)
	movl	%esi, %eax
	sall	$15, %eax
	movl	%eax, 1060(%rcx)
	xorl	%r15d, %r15d
	leal	(%rsi,%rsi), %eax
	movl	%eax, 40(%rsp)
	movw	%ax, 1028(%rcx)
	movl	$0, 36(%rsp)
	movw	%r15w, 1126(%rcx)
	movw	%si, 1128(%rcx)
	addl	%edx, %eax
	testl	%edx, %edx
	je	.L1022
	cmpl	$4, %eax
	jg	.L1023
.L1022:
	movl	%eax, %r15d
	sall	$14, %r15d
	addl	%eax, %eax
	addl	%esi, %edx
	movl	%eax, 44(%rsp)
	movw	%ax, 1030(%rcx)
	movl	%r15d, 1064(%rcx)
	movw	%dx, 1130(%rcx)
	addl	%edi, %eax
	testl	%edi, %edi
	je	.L1024
	cmpl	$8, %eax
	jg	.L1023
.L1024:
	movl	%eax, %esi
	sall	$13, %esi
	addl	%eax, %eax
	addl	%edi, %edx
	movl	%eax, 48(%rsp)
	movw	%ax, 1032(%rcx)
	movl	%esi, 1068(%rcx)
	movw	%dx, 1132(%rcx)
	addl	%r8d, %eax
	testl	%r8d, %r8d
	je	.L1025
	cmpl	$16, %eax
	jg	.L1023
.L1025:
	movl	%eax, %esi
	sall	$12, %esi
	addl	%eax, %eax
	addl	%r8d, %edx
	movl	%eax, 52(%rsp)
	movw	%ax, 1034(%rcx)
	movl	%esi, 1072(%rcx)
	movw	%dx, 1134(%rcx)
	addl	%r9d, %eax
	testl	%r9d, %r9d
	je	.L1026
	cmpl	$32, %eax
	jg	.L1023
.L1026:
	movl	%eax, %esi
	sall	$11, %esi
	addl	%eax, %eax
	addl	%r9d, %edx
	movl	%eax, 56(%rsp)
	movw	%ax, 1036(%rcx)
	movl	%esi, 1076(%rcx)
	movw	%dx, 1136(%rcx)
	addl	%r10d, %eax
	testl	%r10d, %r10d
	je	.L1027
	cmpl	$64, %eax
	jg	.L1023
.L1027:
	movl	%eax, %esi
	sall	$10, %esi
	addl	%eax, %eax
	addl	%r10d, %edx
	movl	%eax, 60(%rsp)
	movw	%ax, 1038(%rcx)
	movl	%esi, 1080(%rcx)
	movw	%dx, 1138(%rcx)
	addl	%r11d, %eax
	testl	%r11d, %r11d
	je	.L1028
	cmpl	$128, %eax
	jg	.L1023
.L1028:
	movl	%eax, %esi
	sall	$9, %esi
	addl	%eax, %eax
	addl	%r11d, %edx
	movl	%eax, 64(%rsp)
	movw	%ax, 1040(%rcx)
	movl	%esi, 1084(%rcx)
	movw	%dx, 1140(%rcx)
	addl	%r12d, %eax
	testl	%r12d, %r12d
	je	.L1029
	cmpl	$256, %eax
	jg	.L1023
.L1029:
	movl	%eax, %esi
	sall	$8, %esi
	addl	%eax, %eax
	addl	%r12d, %edx
	movl	%eax, 68(%rsp)
	movw	%ax, 1042(%rcx)
	movl	%esi, 1088(%rcx)
	movw	%dx, 1142(%rcx)
	addl	%r13d, %eax
	testl	%r13d, %r13d
	je	.L1030
	cmpl	$512, %eax
	jg	.L1023
.L1030:
	movl	%eax, %esi
	sall	$7, %esi
	addl	%eax, %eax
	addl	%r13d, %edx
	movl	%eax, 72(%rsp)
	movw	%ax, 1044(%rcx)
	movl	%esi, 1092(%rcx)
	movw	%dx, 1144(%rcx)
	addl	%r14d, %eax
	testl	%r14d, %r14d
	je	.L1031
	cmpl	$1024, %eax
	jg	.L1023
.L1031:
	movl	%eax, %esi
	movl	12(%rsp), %edi
	addl	%eax, %eax
	sall	$6, %esi
	addl	%r14d, %edx
	movl	%eax, 76(%rsp)
	movw	%ax, 1046(%rcx)
	movl	%esi, 1096(%rcx)
	movw	%dx, 1146(%rcx)
	addl	%edi, %eax
	testl	%edi, %edi
	je	.L1032
	cmpl	$2048, %eax
	jg	.L1023
.L1032:
	movl	%eax, %esi
	movl	16(%rsp), %edi
	addl	%eax, %eax
	sall	$5, %esi
	addl	12(%rsp), %edx
	movl	%eax, 80(%rsp)
	movw	%ax, 1048(%rcx)
	movl	%esi, 1100(%rcx)
	movw	%dx, 1148(%rcx)
	addl	%edi, %eax
	testl	%edi, %edi
	je	.L1033
	cmpl	$4096, %eax
	jg	.L1023
.L1033:
	movl	%eax, %esi
	movl	20(%rsp), %edi
	addl	%eax, %eax
	sall	$4, %esi
	addl	16(%rsp), %edx
	movl	%eax, 84(%rsp)
	movw	%ax, 1050(%rcx)
	movl	%esi, 1104(%rcx)
	movw	%dx, 1150(%rcx)
	addl	%edi, %eax
	testl	%edi, %edi
	je	.L1034
	cmpl	$8192, %eax
	jg	.L1023
.L1034:
	movl	24(%rsp), %edi
	leal	0(,%rax,8), %esi
	addl	20(%rsp), %edx
	addl	%eax, %eax
	movl	%eax, 88(%rsp)
	movw	%ax, 1052(%rcx)
	movl	%esi, 1108(%rcx)
	movw	%dx, 1152(%rcx)
	addl	%edi, %eax
	testl	%edi, %edi
	je	.L1035
	cmpl	$16384, %eax
	jg	.L1023
.L1035:
	movl	28(%rsp), %edi
	leal	0(,%rax,4), %esi
	addl	24(%rsp), %edx
	addl	%eax, %eax
	movl	%eax, 92(%rsp)
	movw	%ax, 1054(%rcx)
	movl	%esi, 1112(%rcx)
	movw	%dx, 1154(%rcx)
	addl	%edi, %eax
	testl	%edi, %edi
	jne	.L1091
.L1036:
	addl	%eax, %eax
	movl	%eax, 1116(%rcx)
	movl	$65536, 1120(%rcx)
	xorl	%edx, %edx
	movl	$1, %r10d
	movl	$16, %r9d
	jmp	.L1040
	.p2align 4,,10
	.p2align 3
.L1038:
	incl	%edi
	movl	%edi, 32(%rsp,%r8,4)
.L1037:
	incq	%rdx
	cmpq	%rdx, %rbp
	je	.L1092
.L1040:
	movzbl	(%rbx,%rdx), %r12d
	testl	%r12d, %r12d
	je	.L1037
	movslq	%r12d, %r8
	movl	32(%rsp,%r8,4), %edi
	movzwl	1024(%rcx,%r8,2), %r11d
	movl	%edi, %eax
	subl	%r11d, %eax
	movzwl	1124(%rcx,%r8,2), %r11d
	addl	%r11d, %eax
	cltq
	movb	%r12b, 1156(%rcx,%rax)
	movw	%dx, 1444(%rcx,%rax,2)
	cmpl	$9, %r12d
	jg	.L1038
	movl	%edi, %r13d
	sarl	%r13d
	leal	(%rdi,%rdi), %eax
	andl	$43690, %eax
	andl	$21845, %r13d
	orl	%eax, %r13d
	movl	%r13d, %eax
	sarl	$2, %eax
	sall	$2, %r13d
	andl	$52428, %r13d
	andl	$13107, %eax
	orl	%r13d, %eax
	movl	%eax, %r13d
	sarl	$4, %r13d
	sall	$4, %eax
	andl	$61680, %eax
	andl	$3855, %r13d
	orl	%eax, %r13d
	movl	%r13d, %eax
	sall	$8, %r13d
	movzwl	%r13w, %r13d
	sarl	$8, %eax
	orl	%r13d, %eax
	movl	%r12d, %r11d
	movl	%r9d, %r13d
	sall	$9, %r11d
	subl	%r12d, %r13d
	shlx	%r12d, %r10d, %esi
	sarx	%r13d, %eax, %eax
	orl	%edx, %r11d
	movslq	%esi, %rsi
	cltq
	.p2align 4,,10
	.p2align 3
.L1039:
	movw	%r11w, (%rcx,%rax,2)
	addq	%rsi, %rax
	cmpl	$511, %eax
	jle	.L1039
	jmp	.L1038
	.p2align 4,,10
	.p2align 3
.L1019:
	leaq	.LC126(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
.L1017:
	movq	168(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L1093
	addq	$184, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
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
	ret
	.p2align 4,,10
	.p2align 3
.L1092:
	.cfi_restore_state
	movl	$1, %eax
	jmp	.L1017
	.p2align 4,,10
	.p2align 3
.L1091:
	cmpl	$32768, %eax
	jle	.L1036
	.p2align 4,,10
	.p2align 3
.L1023:
	leaq	.LC127(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L1017
.L1093:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE682:
	.size	stbi__zbuild_huffman, .-stbi__zbuild_huffman
	.p2align 4
	.type	stbi__zhuffman_decode, @function
stbi__zhuffman_decode:
.LFB688:
	.cfi_startproc
	movq	%rdi, %rcx
	movl	16(%rcx), %edx
	movq	%rsi, %rdi
	cmpl	$15, %edx
	jg	.L1095
	movq	8(%rcx), %r8
	cmpq	%r8, (%rcx)
	jnb	.L1106
	movl	20(%rcx), %esi
	jmp	.L1102
	.p2align 4,,10
	.p2align 3
.L1098:
	movq	(%rcx), %rax
	cmpq	%rax, %r8
	jbe	.L1100
	leaq	1(%rax), %r9
	movq	%r9, (%rcx)
	movzbl	(%rax), %eax
	shlx	%edx, %eax, %eax
	orl	%eax, %esi
.L1100:
	addl	$8, %edx
	movl	%esi, 20(%rcx)
	movl	%edx, 16(%rcx)
	cmpl	$24, %edx
	jg	.L1099
.L1102:
	shrx	%edx, %esi, %eax
	testl	%eax, %eax
	je	.L1098
	movq	%r8, (%rcx)
	jmp	.L1099
	.p2align 4,,10
	.p2align 3
.L1095:
	movl	20(%rcx), %esi
.L1099:
	movl	%esi, %eax
	andl	$511, %eax
	movzwl	(%rdi,%rax,2), %r8d
	movl	%r8d, %eax
	testl	%r8d, %r8d
	je	.L1103
	sarl	$9, %r8d
	subl	%r8d, %edx
	shrx	%r8d, %esi, %esi
	movl	%edx, 16(%rcx)
	movl	%esi, 20(%rcx)
	andl	$511, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L1103:
	movl	%esi, %r8d
	sarl	%r8d
	leal	(%rsi,%rsi), %eax
	andl	$43690, %eax
	andl	$21845, %r8d
	orl	%eax, %r8d
	movl	%r8d, %eax
	sarl	$2, %eax
	sall	$2, %r8d
	andl	$52428, %r8d
	andl	$13107, %eax
	orl	%r8d, %eax
	movl	%eax, %r8d
	sarl	$4, %r8d
	sall	$4, %eax
	andl	$61680, %eax
	andl	$3855, %r8d
	orl	%eax, %r8d
	movl	%r8d, %eax
	sall	$8, %r8d
	sarl	$8, %eax
	movzwl	%r8w, %r8d
	orl	%r8d, %eax
	cmpl	1096(%rdi), %eax
	jl	.L1107
	cmpl	1100(%rdi), %eax
	jl	.L1108
	cmpl	1104(%rdi), %eax
	jl	.L1109
	cmpl	1108(%rdi), %eax
	jl	.L1110
	cmpl	1112(%rdi), %eax
	jl	.L1111
	movl	$15, %r8d
	cmpl	1116(%rdi), %eax
	jl	.L1105
.L1106:
	movl	$-1, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L1108:
	movl	$11, %r8d
.L1105:
	movl	$16, %r9d
	subl	%r8d, %r9d
.L1104:
	sarx	%r9d, %eax, %eax
	movslq	%r8d, %r9
	movzwl	1024(%rdi,%r9,2), %r10d
	movzwl	1124(%rdi,%r9,2), %r9d
	subl	%r10d, %eax
	addl	%r9d, %eax
	cmpl	$287, %eax
	jg	.L1106
	cltq
	movzbl	1156(%rdi,%rax), %r9d
	cmpl	%r8d, %r9d
	jne	.L1106
	subl	%r8d, %edx
	shrx	%r8d, %esi, %esi
	movl	%edx, 16(%rcx)
	movl	%esi, 20(%rcx)
	movzwl	1444(%rdi,%rax,2), %eax
	ret
	.p2align 4,,10
	.p2align 3
.L1107:
	movl	$6, %r9d
	movl	$10, %r8d
	jmp	.L1104
	.p2align 4,,10
	.p2align 3
.L1109:
	movl	$12, %r8d
	jmp	.L1105
.L1110:
	movl	$13, %r8d
	jmp	.L1105
.L1111:
	movl	$14, %r8d
	jmp	.L1105
	.cfi_endproc
.LFE688:
	.size	stbi__zhuffman_decode, .-stbi__zhuffman_decode
	.p2align 4
	.type	stbi__convert_format, @function
stbi__convert_format:
.LFB635:
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
	movq	%rdi, %r13
	pushq	%r12
	pushq	%rbx
	andq	$-32, %rsp
	subq	$576, %rsp
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movl	%r8d, 572(%rsp)
	cmpl	%esi, %edx
	je	.L1193
	leal	-1(%rdx), %eax
	movl	%edx, %ebx
	cmpl	$3, %eax
	ja	.L1739
	testl	%ecx, %ecx
	js	.L1117
	je	.L1116
	movl	$2147483647, %eax
	cltd
	idivl	%ecx
	cmpl	%eax, %ebx
	jg	.L1117
.L1116:
	movl	572(%rsp), %edi
	testl	%edi, %edi
	js	.L1117
	movl	%ecx, %r10d
	imull	%ebx, %r10d
	movl	%r10d, 564(%rsp)
	testl	%edi, %edi
	je	.L1118
	movl	$2147483647, %eax
	cltd
	idivl	%edi
	cmpl	%eax, %r10d
	jg	.L1117
	imull	564(%rsp), %edi
	movl	%ecx, 560(%rsp)
	movl	%esi, 568(%rsp)
	movslq	%edi, %rdi
	call	malloc@PLT
	testq	%rax, %rax
	movl	568(%rsp), %esi
	movl	560(%rsp), %ecx
	movq	%rax, %r12
	je	.L1117
	movl	%esi, %eax
	imull	%ecx, %eax
	movl	$1, %edi
	leal	-1(%rcx), %edx
	movl	%eax, 560(%rsp)
	leal	-2(%rcx), %eax
	cmpl	$-1, %eax
	cmovge	%ecx, %edi
	setl	%al
	cmpl	$31, %edx
	movl	%edx, %ecx
	leal	-1(%rdi), %r9d
	movl	%edx, 568(%rsp)
	setbe	%dl
	orl	%eax, %edx
	movl	%r9d, %r11d
	andl	$-32, %r11d
	movb	%dl, 554(%rsp)
	movl	%r9d, 140(%rsp)
	movl	%r9d, %edx
	movl	%ecx, %r9d
	subl	%r11d, %r9d
	shrl	$5, %edx
	decl	%edx
	movl	%r9d, 124(%rsp)
	movl	%r11d, %r9d
	movl	%r11d, 136(%rsp)
	movq	%rdx, %r10
	leaq	(%r9,%r9), %r11
	salq	$7, %r10
	movq	%r11, 40(%rsp)
	addq	%r9, %r11
	cmpl	$30, %ecx
	movq	%r11, 32(%rsp)
	movl	%ecx, %r11d
	setbe	%cl
	orl	%eax, %ecx
	movl	%edi, %eax
	shrl	$5, %eax
	decl	%eax
	movb	%cl, 555(%rsp)
	movq	%rax, %rcx
	salq	$7, %rcx
	movl	%edi, 556(%rsp)
	andl	$-32, %edi
	movq	%rcx, 56(%rsp)
	leaq	0(,%rdi,4), %rcx
	movq	%rcx, 96(%rsp)
	leaq	(%rdi,%rdi), %rcx
	subl	%edi, %r11d
	movl	%edi, 548(%rsp)
	movq	%rdi, 104(%rsp)
	movq	%rcx, 128(%rsp)
	addq	%rdi, %rcx
	movq	%rax, %rdi
	salq	$6, %rdi
	movq	%rdi, 48(%rsp)
	incq	%rax
	leaq	1(%rdx), %rdi
	movq	%rdi, 16(%rsp)
	salq	$5, %rax
	salq	$5, %rdi
	movq	%rcx, 112(%rsp)
	movq	%rdi, 24(%rsp)
	movq	%rax, 88(%rsp)
	movq	%r10, 64(%rsp)
	leaq	0(,%r9,4), %r10
	movq	%r9, 80(%rsp)
	movq	%r10, 72(%rsp)
	movl	%r11d, 544(%rsp)
	xorl	%r10d, %r10d
	xorl	%r11d, %r11d
	xorl	%r9d, %r9d
	leal	-10(%rbx,%rsi,8), %ebx
	.p2align 4,,10
	.p2align 3
.L1190:
	movl	%r10d, %edi
	movl	%r11d, %r8d
	leaq	0(%r13,%rdi), %rcx
	leaq	(%r12,%r8), %rsi
	movq	%rcx, %rdx
	movq	%rsi, %rax
	cmpl	$25, %ebx
	ja	.L1120
	leaq	.L1122(%rip), %r15
	movl	%ebx, %r14d
	movslq	(%r15,%r14,4), %r14
	addq	%r15, %r14
	notrack jmp	*%r14
	.section	.rodata
	.align 4
	.align 4
.L1122:
	.long	.L1133-.L1122
	.long	.L1132-.L1122
	.long	.L1131-.L1122
	.long	.L1120-.L1122
	.long	.L1120-.L1122
	.long	.L1120-.L1122
	.long	.L1120-.L1122
	.long	.L1130-.L1122
	.long	.L1120-.L1122
	.long	.L1129-.L1122
	.long	.L1128-.L1122
	.long	.L1120-.L1122
	.long	.L1120-.L1122
	.long	.L1120-.L1122
	.long	.L1120-.L1122
	.long	.L1127-.L1122
	.long	.L1126-.L1122
	.long	.L1120-.L1122
	.long	.L1125-.L1122
	.long	.L1120-.L1122
	.long	.L1120-.L1122
	.long	.L1120-.L1122
	.long	.L1120-.L1122
	.long	.L1124-.L1122
	.long	.L1123-.L1122
	.long	.L1121-.L1122
	.text
.L1118:
	xorl	%edi, %edi
	call	malloc@PLT
	movq	%rax, %r12
	testq	%rax, %rax
	jne	.L1192
	.p2align 4,,10
	.p2align 3
.L1117:
	movq	%r13, %rdi
	call	free@PLT
	leaq	.LC23(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%r12d, %r12d
.L1112:
	leaq	-40(%rbp), %rsp
	popq	%rbx
	movq	%r12, %rax
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L1193:
	.cfi_restore_state
	movq	%rdi, %r12
	jmp	.L1112
	.p2align 4,,10
	.p2align 3
.L1121:
	cmpl	$-1, 568(%rsp)
	je	.L1134
	cmpb	$0, 554(%rsp)
	jne	.L1204
	movq	64(%rsp), %r15
	vmovdqa	.LC188(%rip), %ymm10
	vmovdqa	.LC189(%rip), %ymm4
	vmovdqa	.LC190(%rip), %ymm9
	vmovdqa	.LC191(%rip), %ymm3
	vmovdqa	.LC192(%rip), %ymm8
	vmovdqa	.LC193(%rip), %ymm7
	vmovdqa	.LC194(%rip), %ymm6
	vmovdqa	.LC195(%rip), %ymm5
	movq	%rcx, %rax
	movq	%rsi, %rdx
	leaq	128(%r15,%rcx), %r14
	.p2align 4,,10
	.p2align 3
.L1188:
	vmovdqu	96(%rax), %ymm1
	vmovdqu	64(%rax), %ymm11
	vpshufb	%ymm4, %ymm1, %ymm12
	vpshufb	%ymm10, %ymm11, %ymm2
	vpermq	$78, %ymm12, %ymm12
	vpshufb	%ymm9, %ymm1, %ymm1
	vpor	%ymm12, %ymm1, %ymm1
	vpermq	$78, %ymm2, %ymm2
	vpor	%ymm1, %ymm2, %ymm2
	vmovdqu	(%rax), %ymm1
	vmovdqu	32(%rax), %ymm0
	vpshufb	%ymm3, %ymm1, %ymm13
	vpshufb	%ymm8, %ymm0, %ymm12
	vpermq	$78, %ymm13, %ymm13
	vpshufb	%ymm7, %ymm1, %ymm1
	vpermq	$78, %ymm12, %ymm12
	vpor	%ymm13, %ymm1, %ymm1
	vpor	%ymm12, %ymm1, %ymm1
	vmovdqu	%ymm1, (%rdx)
	vpshufb	%ymm6, %ymm0, %ymm12
	vpshufb	%ymm5, %ymm11, %ymm1
	vpermq	$78, %ymm12, %ymm12
	vpermq	$78, %ymm1, %ymm1
	vpshufb	%ymm4, %ymm0, %ymm0
	vpshufb	%ymm3, %ymm11, %ymm11
	vpor	%ymm12, %ymm0, %ymm0
	vpor	%ymm1, %ymm11, %ymm11
	vpor	%ymm11, %ymm0, %ymm0
	subq	$-128, %rax
	vmovdqu	%ymm0, 32(%rdx)
	vmovdqu	%ymm2, 64(%rdx)
	addq	$96, %rdx
	cmpq	%rax, %r14
	jne	.L1188
	movq	72(%rsp), %rax
	movl	136(%rsp), %r14d
	leaq	(%rcx,%rax), %rdx
	movq	32(%rsp), %rax
	addq	%rsi, %rax
	movl	124(%rsp), %esi
.L1187:
	movl	140(%rsp), %ecx
	subl	%r14d, %ecx
	cmpl	$15, %ecx
	jbe	.L1189
	leaq	(%rdi,%r14,4), %rdi
	addq	%r13, %rdi
	vmovdqu	32(%rdi), %xmm2
	vmovdqu	48(%rdi), %xmm6
	vpshufb	.LC196(%rip), %xmm2, %xmm3
	vpshufb	.LC197(%rip), %xmm6, %xmm1
	vmovdqu	16(%rdi), %xmm0
	vpor	%xmm1, %xmm3, %xmm3
	vmovdqu	(%rdi), %xmm1
	leaq	(%r14,%r14,2), %r14
	andl	$-16, %ecx
	vpshufb	.LC199(%rip), %xmm0, %xmm4
	addq	%r8, %r14
	vpshufb	.LC198(%rip), %xmm1, %xmm1
	vpshufb	.LC200(%rip), %xmm0, %xmm0
	vpshufb	.LC201(%rip), %xmm2, %xmm2
	addq	%r12, %r14
	vpor	%xmm4, %xmm1, %xmm1
	vpor	%xmm2, %xmm0, %xmm0
	subl	%ecx, %esi
	leaq	(%rdx,%rcx,4), %rdx
	leaq	(%rcx,%rcx,2), %rcx
	vmovdqu	%xmm1, (%r14)
	vmovdqu	%xmm0, 16(%r14)
	vmovdqu	%xmm3, 32(%r14)
	addq	%rcx, %rax
.L1189:
	movzbl	(%rdx), %ecx
	movb	%cl, (%rax)
	movzbl	1(%rdx), %ecx
	movb	%cl, 1(%rax)
	movzbl	2(%rdx), %ecx
	movb	%cl, 2(%rax)
	testl	%esi, %esi
	je	.L1134
	movzbl	4(%rdx), %ecx
	movb	%cl, 3(%rax)
	movzbl	5(%rdx), %ecx
	movb	%cl, 4(%rax)
	movzbl	6(%rdx), %ecx
	movb	%cl, 5(%rax)
	cmpl	$1, %esi
	je	.L1134
	movzbl	8(%rdx), %ecx
	movb	%cl, 6(%rax)
	movzbl	9(%rdx), %ecx
	movb	%cl, 7(%rax)
	movzbl	10(%rdx), %ecx
	movb	%cl, 8(%rax)
	cmpl	$2, %esi
	je	.L1134
	movzbl	12(%rdx), %ecx
	movb	%cl, 9(%rax)
	movzbl	13(%rdx), %ecx
	movb	%cl, 10(%rax)
	movzbl	14(%rdx), %ecx
	movb	%cl, 11(%rax)
	cmpl	$3, %esi
	je	.L1134
	movzbl	16(%rdx), %ecx
	movb	%cl, 12(%rax)
	movzbl	17(%rdx), %ecx
	movb	%cl, 13(%rax)
	movzbl	18(%rdx), %ecx
	movb	%cl, 14(%rax)
	cmpl	$4, %esi
	je	.L1134
	movzbl	20(%rdx), %ecx
	movb	%cl, 15(%rax)
	movzbl	21(%rdx), %ecx
	movb	%cl, 16(%rax)
	movzbl	22(%rdx), %ecx
	movb	%cl, 17(%rax)
	cmpl	$5, %esi
	je	.L1134
	movzbl	24(%rdx), %ecx
	movb	%cl, 18(%rax)
	movzbl	25(%rdx), %ecx
	movb	%cl, 19(%rax)
	movzbl	26(%rdx), %ecx
	movb	%cl, 20(%rax)
	cmpl	$6, %esi
	je	.L1134
	movzbl	28(%rdx), %ecx
	movb	%cl, 21(%rax)
	movzbl	29(%rdx), %ecx
	movb	%cl, 22(%rax)
	movzbl	30(%rdx), %ecx
	movb	%cl, 23(%rax)
	cmpl	$7, %esi
	je	.L1134
	movzbl	32(%rdx), %ecx
	movb	%cl, 24(%rax)
	movzbl	33(%rdx), %ecx
	movb	%cl, 25(%rax)
	movzbl	34(%rdx), %ecx
	movb	%cl, 26(%rax)
	cmpl	$8, %esi
	je	.L1134
	movzbl	36(%rdx), %ecx
	movb	%cl, 27(%rax)
	movzbl	37(%rdx), %ecx
	movb	%cl, 28(%rax)
	movzbl	38(%rdx), %ecx
	movb	%cl, 29(%rax)
	cmpl	$9, %esi
	je	.L1134
	movzbl	40(%rdx), %ecx
	movb	%cl, 30(%rax)
	movzbl	41(%rdx), %ecx
	movb	%cl, 31(%rax)
	movzbl	42(%rdx), %ecx
	movb	%cl, 32(%rax)
	cmpl	$10, %esi
	je	.L1134
	movzbl	44(%rdx), %ecx
	movb	%cl, 33(%rax)
	movzbl	45(%rdx), %ecx
	movb	%cl, 34(%rax)
	movzbl	46(%rdx), %ecx
	movb	%cl, 35(%rax)
	cmpl	$11, %esi
	je	.L1134
	movzbl	48(%rdx), %ecx
	movb	%cl, 36(%rax)
	movzbl	49(%rdx), %ecx
	movb	%cl, 37(%rax)
	movzbl	50(%rdx), %ecx
	movb	%cl, 38(%rax)
	cmpl	$12, %esi
	je	.L1134
	movzbl	52(%rdx), %ecx
	movb	%cl, 39(%rax)
	movzbl	53(%rdx), %ecx
	movb	%cl, 40(%rax)
	movzbl	54(%rdx), %ecx
	movb	%cl, 41(%rax)
	cmpl	$13, %esi
	je	.L1134
	movzbl	56(%rdx), %ecx
	movb	%cl, 42(%rax)
	movzbl	57(%rdx), %ecx
	movb	%cl, 43(%rax)
	movzbl	58(%rdx), %ecx
	movb	%cl, 44(%rax)
	cmpl	$14, %esi
	je	.L1134
	movzbl	60(%rdx), %ecx
	movb	%cl, 45(%rax)
	movzbl	61(%rdx), %ecx
	movb	%cl, 46(%rax)
	movzbl	62(%rdx), %edx
	movb	%dl, 47(%rax)
	.p2align 4,,10
	.p2align 3
.L1134:
	incl	%r9d
	addl	560(%rsp), %r10d
	addl	564(%rsp), %r11d
	cmpl	%r9d, 572(%rsp)
	jg	.L1190
	vzeroupper
.L1192:
	movq	%r13, %rdi
	call	free@PLT
	jmp	.L1112
	.p2align 4,,10
	.p2align 3
.L1123:
	cmpl	$-1, 568(%rsp)
	je	.L1134
	cmpb	$0, 555(%rsp)
	jne	.L1203
	movq	56(%rsp), %r15
	vmovdqa	.LC2(%rip), %ymm0
	movq	%rcx, %rax
	movq	%rsi, %rdx
	leaq	128(%r15,%rcx), %r14
	.p2align 4,,10
	.p2align 3
.L1182:
	vmovdqu	(%rax), %ymm2
	vmovdqu	32(%rax), %ymm5
	vmovdqu	64(%rax), %ymm3
	vmovdqu	96(%rax), %ymm1
	vpand	%ymm5, %ymm0, %ymm6
	vpand	%ymm2, %ymm0, %ymm4
	vpsrlw	$8, %ymm5, %ymm5
	vpsrlw	$8, %ymm2, %ymm2
	vpackuswb	%ymm6, %ymm4, %ymm4
	vpackuswb	%ymm5, %ymm2, %ymm2
	vpand	%ymm1, %ymm0, %ymm6
	vpand	%ymm3, %ymm0, %ymm5
	vpackuswb	%ymm6, %ymm5, %ymm5
	vpsrlw	$8, %ymm1, %ymm1
	vpsrlw	$8, %ymm3, %ymm3
	vpermq	$216, %ymm4, %ymm4
	vpermq	$216, %ymm5, %ymm5
	vpackuswb	%ymm1, %ymm3, %ymm3
	vpand	%ymm5, %ymm0, %ymm6
	vpermq	$216, %ymm2, %ymm2
	vpermq	$216, %ymm3, %ymm3
	vpand	%ymm4, %ymm0, %ymm1
	vpsrlw	$8, %ymm5, %ymm5
	vpsrlw	$8, %ymm4, %ymm4
	vpackuswb	%ymm6, %ymm1, %ymm1
	vpackuswb	%ymm5, %ymm4, %ymm4
	vpand	%ymm3, %ymm0, %ymm6
	vpand	%ymm2, %ymm0, %ymm5
	vpackuswb	%ymm6, %ymm5, %ymm5
	vpmovzxbw	.LC185(%rip), %ymm9
	vpmovzxbw	.LC186(%rip), %ymm7
	vpermq	$216, %ymm1, %ymm1
	vpermq	$216, %ymm5, %ymm5
	vpsrlw	$8, %ymm3, %ymm3
	vpsrlw	$8, %ymm2, %ymm2
	vpackuswb	%ymm3, %ymm2, %ymm2
	vpmovzxbw	%xmm5, %ymm6
	vpmovzxbw	%xmm1, %ymm3
	vpmullw	%ymm7, %ymm6, %ymm6
	vpmullw	%ymm9, %ymm3, %ymm3
	vpermq	$216, %ymm4, %ymm4
	vextracti128	$0x1, %ymm1, %xmm1
	vextracti128	$0x1, %ymm5, %xmm5
	vpmovzxbw	%xmm4, %ymm8
	vpaddw	%ymm6, %ymm3, %ymm3
	vpmovzxbw	%xmm1, %ymm1
	vpmovzxbw	.LC187(%rip), %ymm6
	vpmovzxbw	%xmm5, %ymm5
	vextracti128	$0x1, %ymm4, %xmm4
	vpmullw	%ymm9, %ymm1, %ymm1
	vpmullw	%ymm7, %ymm5, %ymm5
	vpmovzxbw	%xmm4, %ymm4
	vpmullw	%ymm6, %ymm8, %ymm8
	vpmullw	%ymm6, %ymm4, %ymm4
	vpermq	$216, %ymm2, %ymm2
	vpaddw	%ymm5, %ymm1, %ymm1
	subq	$-128, %rax
	vpaddw	%ymm8, %ymm3, %ymm3
	vpaddw	%ymm4, %ymm1, %ymm1
	vpsrlw	$8, %ymm3, %ymm3
	vpsrlw	$8, %ymm1, %ymm1
	vpand	%ymm3, %ymm0, %ymm3
	vpand	%ymm1, %ymm0, %ymm1
	vpackuswb	%ymm1, %ymm3, %ymm1
	vpermq	$216, %ymm1, %ymm1
	vpunpcklbw	%ymm2, %ymm1, %ymm3
	vpunpckhbw	%ymm2, %ymm1, %ymm1
	vperm2i128	$32, %ymm1, %ymm3, %ymm2
	vperm2i128	$49, %ymm1, %ymm3, %ymm3
	vmovdqu	%ymm2, (%rdx)
	vmovdqu	%ymm3, 32(%rdx)
	addq	$64, %rdx
	cmpq	%rax, %r14
	jne	.L1182
	movq	96(%rsp), %rax
	leaq	(%rcx,%rax), %rdx
	movq	128(%rsp), %rax
	movl	556(%rsp), %ecx
	addq	%rsi, %rax
	movl	548(%rsp), %esi
	cmpl	%ecx, %esi
	je	.L1134
	movl	544(%rsp), %ecx
	movl	%ecx, 512(%rsp)
.L1181:
	movl	556(%rsp), %r14d
	subl	%esi, %r14d
	leal	-1(%r14), %r15d
	cmpl	$14, %r15d
	jbe	.L1185
	leaq	(%rdi,%rsi,4), %rdi
	addq	%r13, %rdi
	vmovdqa	.LC5(%rip), %xmm4
	vmovdqu	(%rdi), %xmm2
	vmovdqu	16(%rdi), %xmm5
	vmovdqu	32(%rdi), %xmm1
	vmovdqu	48(%rdi), %xmm0
	vpand	%xmm5, %xmm4, %xmm6
	vpand	%xmm2, %xmm4, %xmm3
	vpsrlw	$8, %xmm5, %xmm5
	vpsrlw	$8, %xmm2, %xmm2
	vpackuswb	%xmm6, %xmm3, %xmm3
	vpackuswb	%xmm5, %xmm2, %xmm2
	vpand	%xmm0, %xmm4, %xmm6
	vpand	%xmm1, %xmm4, %xmm5
	vpackuswb	%xmm6, %xmm5, %xmm5
	vpsrlw	$8, %xmm0, %xmm0
	vpsrlw	$8, %xmm1, %xmm1
	vpackuswb	%xmm0, %xmm1, %xmm1
	vpand	%xmm5, %xmm4, %xmm6
	vmovdqa	.LC185(%rip), %xmm8
	vpand	%xmm3, %xmm4, %xmm0
	vpsrlw	$8, %xmm5, %xmm5
	vpsrlw	$8, %xmm3, %xmm3
	vpackuswb	%xmm6, %xmm0, %xmm0
	vpackuswb	%xmm5, %xmm3, %xmm3
	vpand	%xmm1, %xmm4, %xmm6
	vmovdqa	.LC186(%rip), %xmm7
	vpand	%xmm2, %xmm4, %xmm5
	vpsrlw	$8, %xmm1, %xmm1
	vpsrlw	$8, %xmm2, %xmm2
	vpackuswb	%xmm6, %xmm5, %xmm5
	vpackuswb	%xmm1, %xmm2, %xmm2
	vpmovzxbw	%xmm8, %xmm6
	vpmovzxbw	%xmm0, %xmm1
	vpmovzxbw	%xmm7, %xmm9
	vpmullw	%xmm6, %xmm1, %xmm1
	vpmovzxbw	%xmm5, %xmm6
	vpmullw	%xmm9, %xmm6, %xmm6
	vpsrldq	$8, %xmm0, %xmm0
	vpsrldq	$8, %xmm8, %xmm8
	vpsrldq	$8, %xmm5, %xmm5
	vpsrldq	$8, %xmm7, %xmm7
	vpaddw	%xmm6, %xmm1, %xmm1
	vmovdqa	.LC187(%rip), %xmm6
	vpmovzxbw	%xmm3, %xmm9
	vpmovzxbw	%xmm6, %xmm10
	vpmovzxbw	%xmm0, %xmm0
	vpmovzxbw	%xmm8, %xmm8
	vpmovzxbw	%xmm5, %xmm5
	vpmovzxbw	%xmm7, %xmm7
	vpsrldq	$8, %xmm3, %xmm3
	vpsrldq	$8, %xmm6, %xmm6
	vpmullw	%xmm8, %xmm0, %xmm0
	vpmullw	%xmm7, %xmm5, %xmm5
	vpmovzxbw	%xmm3, %xmm3
	vpmovzxbw	%xmm6, %xmm6
	vpmullw	%xmm10, %xmm9, %xmm9
	vpmullw	%xmm6, %xmm3, %xmm3
	vpaddw	%xmm5, %xmm0, %xmm0
	leaq	(%r8,%rsi,2), %rsi
	addq	%r12, %rsi
	vpaddw	%xmm9, %xmm1, %xmm1
	vpaddw	%xmm3, %xmm0, %xmm0
	vpsrlw	$8, %xmm1, %xmm1
	vpsrlw	$8, %xmm0, %xmm0
	vpand	%xmm1, %xmm4, %xmm1
	vpand	%xmm0, %xmm4, %xmm0
	vpackuswb	%xmm0, %xmm1, %xmm0
	vpunpcklbw	%xmm2, %xmm0, %xmm1
	vpunpckhbw	%xmm2, %xmm0, %xmm0
	vmovdqu	%xmm1, (%rsi)
	vmovdqu	%xmm0, 16(%rsi)
	movl	%r14d, %esi
	andl	$-16, %esi
	movl	%esi, %edi
	subl	%esi, 512(%rsp)
	leaq	(%rdx,%rdi,4), %rdx
	leaq	(%rax,%rdi,2), %rax
	cmpl	%esi, %r14d
	je	.L1134
.L1185:
	movzbl	(%rdx), %esi
	movzbl	1(%rdx), %edi
	imull	$77, %esi, %esi
	imull	$150, %edi, %edi
	movl	512(%rsp), %r15d
	addl	%edi, %esi
	movzbl	2(%rdx), %edi
	imull	$29, %edi, %edi
	addl	%edi, %esi
	movl	%esi, %ecx
	movb	%ch, (%rax)
	movzbl	3(%rdx), %esi
	movb	%sil, 1(%rax)
	testl	%r15d, %r15d
	je	.L1134
	movzbl	4(%rdx), %esi
	movzbl	5(%rdx), %edi
	imull	$77, %esi, %esi
	imull	$150, %edi, %edi
	addl	%edi, %esi
	movzbl	6(%rdx), %edi
	imull	$29, %edi, %edi
	addl	%edi, %esi
	movl	%esi, %ecx
	movb	%ch, 2(%rax)
	movzbl	7(%rdx), %esi
	movb	%sil, 3(%rax)
	cmpl	$1, %r15d
	je	.L1134
	movzbl	8(%rdx), %esi
	movzbl	9(%rdx), %edi
	imull	$77, %esi, %esi
	imull	$150, %edi, %edi
	addl	%edi, %esi
	movzbl	10(%rdx), %edi
	imull	$29, %edi, %edi
	addl	%edi, %esi
	movl	%esi, %ecx
	movb	%ch, 4(%rax)
	movzbl	11(%rdx), %esi
	movb	%sil, 5(%rax)
	cmpl	$2, %r15d
	je	.L1134
	movzbl	12(%rdx), %esi
	movzbl	13(%rdx), %edi
	imull	$77, %esi, %esi
	imull	$150, %edi, %edi
	addl	%edi, %esi
	movzbl	14(%rdx), %edi
	imull	$29, %edi, %edi
	addl	%edi, %esi
	movl	%esi, %ecx
	movb	%ch, 6(%rax)
	movzbl	15(%rdx), %esi
	movb	%sil, 7(%rax)
	cmpl	$3, %r15d
	je	.L1134
	movzbl	16(%rdx), %esi
	movzbl	17(%rdx), %edi
	imull	$77, %esi, %esi
	imull	$150, %edi, %edi
	addl	%edi, %esi
	movzbl	18(%rdx), %edi
	imull	$29, %edi, %edi
	addl	%edi, %esi
	movl	%esi, %ecx
	movb	%ch, 8(%rax)
	movzbl	19(%rdx), %esi
	movb	%sil, 9(%rax)
	cmpl	$4, %r15d
	je	.L1134
	movzbl	20(%rdx), %esi
	movzbl	21(%rdx), %edi
	imull	$77, %esi, %esi
	imull	$150, %edi, %edi
	addl	%edi, %esi
	movzbl	22(%rdx), %edi
	imull	$29, %edi, %edi
	addl	%edi, %esi
	movl	%esi, %ecx
	movb	%ch, 10(%rax)
	movzbl	23(%rdx), %esi
	movb	%sil, 11(%rax)
	cmpl	$5, %r15d
	je	.L1134
	movzbl	24(%rdx), %esi
	movzbl	25(%rdx), %edi
	imull	$77, %esi, %esi
	imull	$150, %edi, %edi
	addl	%edi, %esi
	movzbl	26(%rdx), %edi
	imull	$29, %edi, %edi
	addl	%edi, %esi
	movl	%esi, %ecx
	movb	%ch, 12(%rax)
	movzbl	27(%rdx), %esi
	movb	%sil, 13(%rax)
	cmpl	$6, %r15d
	je	.L1134
	movzbl	28(%rdx), %esi
	movzbl	29(%rdx), %edi
	imull	$77, %esi, %esi
	imull	$150, %edi, %edi
	addl	%edi, %esi
	movzbl	30(%rdx), %edi
	imull	$29, %edi, %edi
	addl	%edi, %esi
	movl	%esi, %ecx
	movb	%ch, 14(%rax)
	movzbl	31(%rdx), %esi
	movb	%sil, 15(%rax)
	cmpl	$7, %r15d
	je	.L1134
	movzbl	32(%rdx), %esi
	movzbl	33(%rdx), %edi
	imull	$77, %esi, %esi
	imull	$150, %edi, %edi
	addl	%edi, %esi
	movzbl	34(%rdx), %edi
	imull	$29, %edi, %edi
	addl	%edi, %esi
	movl	%esi, %ecx
	movb	%ch, 16(%rax)
	movzbl	35(%rdx), %esi
	movb	%sil, 17(%rax)
	cmpl	$8, %r15d
	je	.L1134
	movzbl	36(%rdx), %esi
	movzbl	37(%rdx), %edi
	imull	$77, %esi, %esi
	imull	$150, %edi, %edi
	addl	%edi, %esi
	movzbl	38(%rdx), %edi
	imull	$29, %edi, %edi
	addl	%edi, %esi
	movl	%esi, %ecx
	movb	%ch, 18(%rax)
	movzbl	39(%rdx), %esi
	movb	%sil, 19(%rax)
	cmpl	$9, %r15d
	je	.L1134
	movzbl	40(%rdx), %esi
	movzbl	41(%rdx), %edi
	imull	$77, %esi, %esi
	imull	$150, %edi, %edi
	addl	%edi, %esi
	movzbl	42(%rdx), %edi
	imull	$29, %edi, %edi
	addl	%edi, %esi
	movl	%esi, %ecx
	movb	%ch, 20(%rax)
	movzbl	43(%rdx), %esi
	movb	%sil, 21(%rax)
	cmpl	$10, %r15d
	je	.L1134
	movzbl	44(%rdx), %esi
	movzbl	45(%rdx), %edi
	imull	$77, %esi, %esi
	imull	$150, %edi, %edi
	addl	%edi, %esi
	movzbl	46(%rdx), %edi
	imull	$29, %edi, %edi
	addl	%edi, %esi
	movl	%esi, %ecx
	movb	%ch, 22(%rax)
	movzbl	47(%rdx), %esi
	movb	%sil, 23(%rax)
	cmpl	$11, %r15d
	je	.L1134
	movzbl	48(%rdx), %esi
	movzbl	49(%rdx), %edi
	imull	$77, %esi, %esi
	imull	$150, %edi, %edi
	addl	%edi, %esi
	movzbl	50(%rdx), %edi
	imull	$29, %edi, %edi
	addl	%edi, %esi
	movl	%esi, %ecx
	movb	%ch, 24(%rax)
	movzbl	51(%rdx), %esi
	movb	%sil, 25(%rax)
	cmpl	$12, %r15d
	je	.L1134
	movzbl	52(%rdx), %esi
	movzbl	53(%rdx), %edi
	imull	$77, %esi, %esi
	imull	$150, %edi, %edi
	addl	%edi, %esi
	movzbl	54(%rdx), %edi
	imull	$29, %edi, %edi
	addl	%edi, %esi
	movl	%esi, %ecx
	movb	%ch, 26(%rax)
	movzbl	55(%rdx), %esi
	movb	%sil, 27(%rax)
	cmpl	$13, %r15d
	je	.L1134
	movzbl	56(%rdx), %ecx
	movzbl	57(%rdx), %esi
	imull	$77, %ecx, %ecx
	imull	$150, %esi, %esi
	addl	%esi, %ecx
	movzbl	58(%rdx), %esi
	imull	$29, %esi, %esi
	addl	%esi, %ecx
	movb	%ch, 28(%rax)
	movzbl	59(%rdx), %edx
	movb	%dl, 29(%rax)
	jmp	.L1134
	.p2align 4,,10
	.p2align 3
.L1124:
	cmpl	$-1, 568(%rsp)
	je	.L1134
	cmpb	$0, 554(%rsp)
	jne	.L1202
	movq	64(%rsp), %r15
	vmovdqa	.LC2(%rip), %ymm0
	vmovdqa	.LC174(%rip), %ymm1
	movq	%rcx, %rax
	movq	%rsi, %rdx
	leaq	128(%r15,%rcx), %r8
	.p2align 4,,10
	.p2align 3
.L1179:
	vmovdqu	(%rax), %ymm2
	vmovdqu	32(%rax), %ymm8
	vmovdqu	64(%rax), %ymm5
	vmovdqu	96(%rax), %ymm6
	vpand	%ymm8, %ymm0, %ymm3
	vpand	%ymm2, %ymm0, %ymm4
	vpackuswb	%ymm3, %ymm4, %ymm4
	vpand	%ymm5, %ymm0, %ymm7
	vpand	%ymm6, %ymm0, %ymm3
	vpsrlw	$8, %ymm8, %ymm8
	vpsrlw	$8, %ymm6, %ymm6
	vpsrlw	$8, %ymm2, %ymm2
	vpsrlw	$8, %ymm5, %ymm5
	vpackuswb	%ymm3, %ymm7, %ymm7
	vpackuswb	%ymm8, %ymm2, %ymm2
	vpackuswb	%ymm6, %ymm5, %ymm5
	vpermq	$216, %ymm4, %ymm4
	vpermq	$216, %ymm7, %ymm7
	vpermq	$216, %ymm2, %ymm2
	vpermq	$216, %ymm5, %ymm5
	vpand	%ymm7, %ymm0, %ymm9
	vpand	%ymm4, %ymm0, %ymm3
	vpand	%ymm5, %ymm0, %ymm5
	vpand	%ymm2, %ymm0, %ymm2
	vpackuswb	%ymm9, %ymm3, %ymm3
	vpsrlw	$8, %ymm7, %ymm7
	vpackuswb	%ymm5, %ymm2, %ymm2
	vpsrlw	$8, %ymm4, %ymm4
	vpmovzxbw	.LC185(%rip), %ymm9
	vpermq	$216, %ymm3, %ymm3
	vpackuswb	%ymm7, %ymm4, %ymm4
	vpermq	$216, %ymm2, %ymm2
	vpmovzxbw	.LC186(%rip), %ymm7
	vpmovzxbw	%xmm3, %ymm5
	vpmovzxbw	%xmm2, %ymm6
	vpmullw	%ymm7, %ymm6, %ymm6
	vpmullw	%ymm9, %ymm5, %ymm5
	vpermq	$216, %ymm4, %ymm4
	vextracti128	$0x1, %ymm3, %xmm3
	vextracti128	$0x1, %ymm2, %xmm2
	vpmovzxbw	%xmm4, %ymm8
	vpmovzxbw	%xmm3, %ymm3
	vpmovzxbw	%xmm2, %ymm2
	vextracti128	$0x1, %ymm4, %xmm4
	vpaddw	%ymm6, %ymm5, %ymm5
	vpmullw	%ymm9, %ymm3, %ymm3
	vpmovzxbw	%xmm1, %ymm6
	vpmullw	%ymm7, %ymm2, %ymm2
	vpmovzxbw	%xmm4, %ymm4
	vpmullw	%ymm6, %ymm8, %ymm8
	vpmullw	%ymm6, %ymm4, %ymm4
	subq	$-128, %rax
	vpaddw	%ymm2, %ymm3, %ymm2
	addq	$32, %rdx
	vpaddw	%ymm8, %ymm5, %ymm5
	vpaddw	%ymm4, %ymm2, %ymm2
	vpsrlw	$8, %ymm5, %ymm5
	vpsrlw	$8, %ymm2, %ymm2
	vpand	%ymm5, %ymm0, %ymm5
	vpand	%ymm2, %ymm0, %ymm2
	vpackuswb	%ymm2, %ymm5, %ymm5
	vpermq	$216, %ymm5, %ymm5
	vmovdqu	%ymm5, -32(%rdx)
	cmpq	%rax, %r8
	jne	.L1179
	movq	72(%rsp), %rax
	movl	136(%rsp), %r14d
	leaq	(%rcx,%rax), %rdx
	movq	80(%rsp), %rax
	movl	124(%rsp), %r8d
	addq	%rsi, %rax
.L1178:
	movl	140(%rsp), %ecx
	subl	%r14d, %ecx
	cmpl	$15, %ecx
	jbe	.L1180
	leaq	(%rdi,%r14,4), %rdi
	addq	%r13, %rdi
	vmovdqa	.LC5(%rip), %xmm3
	vmovdqu	16(%rdi), %xmm8
	vmovdqu	(%rdi), %xmm4
	vmovdqu	48(%rdi), %xmm7
	vmovdqu	32(%rdi), %xmm2
	vpand	%xmm8, %xmm3, %xmm0
	vpand	%xmm4, %xmm3, %xmm1
	vpackuswb	%xmm0, %xmm1, %xmm1
	vpand	%xmm2, %xmm3, %xmm6
	vpand	%xmm7, %xmm3, %xmm0
	vpackuswb	%xmm0, %xmm6, %xmm6
	vpand	%xmm6, %xmm3, %xmm5
	vpand	%xmm1, %xmm3, %xmm0
	vpsrlw	$8, %xmm6, %xmm6
	vpsrlw	$8, %xmm1, %xmm1
	vpackuswb	%xmm5, %xmm0, %xmm0
	vpsrlw	$8, %xmm4, %xmm4
	vpackuswb	%xmm6, %xmm1, %xmm5
	vpsrlw	$8, %xmm2, %xmm2
	vpsrlw	$8, %xmm8, %xmm6
	vpsrlw	$8, %xmm7, %xmm1
	vpackuswb	%xmm6, %xmm4, %xmm4
	vpackuswb	%xmm1, %xmm2, %xmm2
	vpand	%xmm4, %xmm3, %xmm4
	vpand	%xmm2, %xmm3, %xmm2
	vpackuswb	%xmm2, %xmm4, %xmm1
	vmovdqa	.LC185(%rip), %xmm2
	vmovdqa	.LC186(%rip), %xmm7
	vpmovzxbw	%xmm2, %xmm6
	vpmovzxbw	%xmm0, %xmm4
	vpmovzxbw	%xmm7, %xmm8
	vpmullw	%xmm6, %xmm4, %xmm4
	vpmovzxbw	%xmm1, %xmm6
	vpmullw	%xmm8, %xmm6, %xmm6
	vpsrldq	$8, %xmm0, %xmm0
	vpsrldq	$8, %xmm2, %xmm2
	vpmovzxbw	%xmm2, %xmm2
	vpmovzxbw	%xmm0, %xmm0
	vpaddw	%xmm6, %xmm4, %xmm4
	vmovdqa	.LC187(%rip), %xmm6
	vpmullw	%xmm2, %xmm0, %xmm0
	vpsrldq	$8, %xmm7, %xmm7
	vpsrldq	$8, %xmm1, %xmm2
	vpmovzxbw	%xmm6, %xmm9
	vpmovzxbw	%xmm2, %xmm2
	vpmovzxbw	%xmm7, %xmm7
	vpsrldq	$8, %xmm5, %xmm1
	vpsrldq	$8, %xmm6, %xmm6
	vpmullw	%xmm7, %xmm2, %xmm2
	vpmovzxbw	%xmm5, %xmm8
	vpmovzxbw	%xmm1, %xmm1
	vpmovzxbw	%xmm6, %xmm6
	vpmullw	%xmm9, %xmm8, %xmm8
	vpmullw	%xmm6, %xmm1, %xmm1
	vpaddw	%xmm2, %xmm0, %xmm0
	andl	$-16, %ecx
	subl	%ecx, %r8d
	vpaddw	%xmm8, %xmm4, %xmm4
	vpaddw	%xmm1, %xmm0, %xmm0
	vpsrlw	$8, %xmm4, %xmm4
	vpsrlw	$8, %xmm0, %xmm0
	vpand	%xmm4, %xmm3, %xmm4
	vpand	%xmm0, %xmm3, %xmm0
	vpackuswb	%xmm0, %xmm4, %xmm4
	vmovdqu	%xmm4, (%rsi,%r14)
	leaq	(%rdx,%rcx,4), %rdx
	addq	%rcx, %rax
.L1180:
	movzbl	(%rdx), %ecx
	movzbl	1(%rdx), %esi
	imull	$77, %ecx, %ecx
	imull	$150, %esi, %esi
	addl	%esi, %ecx
	movzbl	2(%rdx), %esi
	imull	$29, %esi, %esi
	addl	%esi, %ecx
	movb	%ch, (%rax)
	testl	%r8d, %r8d
	je	.L1134
	movzbl	4(%rdx), %ecx
	movzbl	5(%rdx), %esi
	imull	$77, %ecx, %ecx
	imull	$150, %esi, %esi
	addl	%esi, %ecx
	movzbl	6(%rdx), %esi
	imull	$29, %esi, %esi
	addl	%esi, %ecx
	movb	%ch, 1(%rax)
	cmpl	$1, %r8d
	je	.L1134
	movzbl	8(%rdx), %ecx
	movzbl	9(%rdx), %esi
	imull	$77, %ecx, %ecx
	imull	$150, %esi, %esi
	addl	%esi, %ecx
	movzbl	10(%rdx), %esi
	imull	$29, %esi, %esi
	addl	%esi, %ecx
	movb	%ch, 2(%rax)
	cmpl	$2, %r8d
	je	.L1134
	movzbl	12(%rdx), %ecx
	movzbl	13(%rdx), %esi
	imull	$77, %ecx, %ecx
	imull	$150, %esi, %esi
	addl	%esi, %ecx
	movzbl	14(%rdx), %esi
	imull	$29, %esi, %esi
	addl	%esi, %ecx
	movb	%ch, 3(%rax)
	cmpl	$3, %r8d
	je	.L1134
	movzbl	16(%rdx), %ecx
	movzbl	17(%rdx), %esi
	imull	$77, %ecx, %ecx
	imull	$150, %esi, %esi
	addl	%esi, %ecx
	movzbl	18(%rdx), %esi
	imull	$29, %esi, %esi
	addl	%esi, %ecx
	movb	%ch, 4(%rax)
	cmpl	$4, %r8d
	je	.L1134
	movzbl	20(%rdx), %ecx
	movzbl	21(%rdx), %esi
	imull	$77, %ecx, %ecx
	imull	$150, %esi, %esi
	addl	%esi, %ecx
	movzbl	22(%rdx), %esi
	imull	$29, %esi, %esi
	addl	%esi, %ecx
	movb	%ch, 5(%rax)
	cmpl	$5, %r8d
	je	.L1134
	movzbl	24(%rdx), %ecx
	movzbl	25(%rdx), %esi
	imull	$77, %ecx, %ecx
	imull	$150, %esi, %esi
	addl	%esi, %ecx
	movzbl	26(%rdx), %esi
	imull	$29, %esi, %esi
	addl	%esi, %ecx
	movb	%ch, 6(%rax)
	cmpl	$6, %r8d
	je	.L1134
	movzbl	28(%rdx), %ecx
	movzbl	29(%rdx), %esi
	imull	$77, %ecx, %ecx
	imull	$150, %esi, %esi
	addl	%esi, %ecx
	movzbl	30(%rdx), %esi
	imull	$29, %esi, %esi
	addl	%esi, %ecx
	movb	%ch, 7(%rax)
	cmpl	$7, %r8d
	je	.L1134
	movzbl	32(%rdx), %ecx
	movzbl	33(%rdx), %esi
	imull	$77, %ecx, %ecx
	imull	$150, %esi, %esi
	addl	%esi, %ecx
	movzbl	34(%rdx), %esi
	imull	$29, %esi, %esi
	addl	%esi, %ecx
	movb	%ch, 8(%rax)
	cmpl	$8, %r8d
	je	.L1134
	movzbl	36(%rdx), %ecx
	movzbl	37(%rdx), %esi
	imull	$77, %ecx, %ecx
	imull	$150, %esi, %esi
	addl	%esi, %ecx
	movzbl	38(%rdx), %esi
	imull	$29, %esi, %esi
	addl	%esi, %ecx
	movb	%ch, 9(%rax)
	cmpl	$9, %r8d
	je	.L1134
	movzbl	40(%rdx), %ecx
	movzbl	41(%rdx), %esi
	imull	$77, %ecx, %ecx
	imull	$150, %esi, %esi
	addl	%esi, %ecx
	movzbl	42(%rdx), %esi
	imull	$29, %esi, %esi
	addl	%esi, %ecx
	movb	%ch, 10(%rax)
	cmpl	$10, %r8d
	je	.L1134
	movzbl	44(%rdx), %ecx
	movzbl	45(%rdx), %esi
	imull	$77, %ecx, %ecx
	imull	$150, %esi, %esi
	addl	%esi, %ecx
	movzbl	46(%rdx), %esi
	imull	$29, %esi, %esi
	addl	%esi, %ecx
	movb	%ch, 11(%rax)
	cmpl	$11, %r8d
	je	.L1134
	movzbl	48(%rdx), %ecx
	movzbl	49(%rdx), %esi
	imull	$77, %ecx, %ecx
	imull	$150, %esi, %esi
	addl	%esi, %ecx
	movzbl	50(%rdx), %esi
	imull	$29, %esi, %esi
	addl	%esi, %ecx
	movb	%ch, 12(%rax)
	cmpl	$12, %r8d
	je	.L1134
	movzbl	52(%rdx), %ecx
	movzbl	53(%rdx), %esi
	imull	$77, %ecx, %ecx
	imull	$150, %esi, %esi
	addl	%esi, %ecx
	movzbl	54(%rdx), %esi
	imull	$29, %esi, %esi
	addl	%esi, %ecx
	movb	%ch, 13(%rax)
	cmpl	$13, %r8d
	je	.L1134
	movzbl	56(%rdx), %ecx
	movzbl	57(%rdx), %esi
	imull	$77, %ecx, %ecx
	imull	$150, %esi, %esi
	addl	%esi, %ecx
	movzbl	58(%rdx), %esi
	imull	$29, %esi, %esi
	addl	%esi, %ecx
	movb	%ch, 14(%rax)
	cmpl	$14, %r8d
	je	.L1134
	movzbl	60(%rdx), %esi
	movzbl	61(%rdx), %ecx
	movzbl	62(%rdx), %edx
	imull	$77, %esi, %esi
	imull	$150, %ecx, %ecx
	imull	$29, %edx, %edx
	addl	%esi, %ecx
	addl	%edx, %ecx
	movb	%ch, 15(%rax)
	jmp	.L1134
	.p2align 4,,10
	.p2align 3
.L1125:
	cmpl	$-1, 568(%rsp)
	je	.L1134
	cmpb	$0, 555(%rsp)
	jne	.L1199
	movq	56(%rsp), %r15
	movq	%rcx, %r14
	leaq	3(%r12,%r8), %rdx
	leaq	128(%r15,%rsi), %r15
	.p2align 4,,10
	.p2align 3
.L1161:
	vmovdqu	(%r14), %ymm2
	vmovdqu	32(%r14), %ymm1
	vmovdqu	64(%r14), %ymm0
	vpextrb	$0, %xmm2, (%rax)
	vpextrb	$1, %xmm2, 1(%rax)
	vpextrb	$2, %xmm2, 2(%rax)
	vpextrb	$3, %xmm2, 4(%rax)
	vpextrb	$4, %xmm2, 5(%rax)
	vpextrb	$5, %xmm2, 6(%rax)
	vpextrb	$6, %xmm2, 8(%rax)
	vpextrb	$7, %xmm2, 9(%rax)
	vpextrb	$8, %xmm2, 10(%rax)
	vpextrb	$9, %xmm2, 12(%rax)
	vpextrb	$10, %xmm2, 13(%rax)
	vpextrb	$11, %xmm2, 14(%rax)
	vpextrb	$12, %xmm2, 16(%rax)
	vpextrb	$13, %xmm2, 17(%rax)
	vpextrb	$14, %xmm2, 18(%rax)
	vpextrb	$15, %xmm2, 20(%rax)
	vextracti128	$0x1, %ymm2, %xmm2
	vpextrb	$0, %xmm2, 21(%rax)
	vpextrb	$1, %xmm2, 22(%rax)
	vpextrb	$2, %xmm2, 24(%rax)
	vpextrb	$3, %xmm2, 25(%rax)
	vpextrb	$4, %xmm2, 26(%rax)
	vpextrb	$5, %xmm2, 28(%rax)
	vpextrb	$6, %xmm2, 29(%rax)
	vpextrb	$7, %xmm2, 30(%rax)
	vpextrb	$8, %xmm2, 32(%rax)
	vpextrb	$9, %xmm2, 33(%rax)
	vpextrb	$10, %xmm2, 34(%rax)
	vpextrb	$11, %xmm2, 36(%rax)
	vpextrb	$12, %xmm2, 37(%rax)
	vpextrb	$13, %xmm2, 38(%rax)
	vpextrb	$0, %xmm1, 42(%rax)
	vpextrb	$1, %xmm1, 44(%rax)
	vpextrb	$2, %xmm1, 45(%rax)
	vpextrb	$3, %xmm1, 46(%rax)
	vpextrb	$4, %xmm1, 48(%rax)
	vpextrb	$5, %xmm1, 49(%rax)
	vpextrb	$6, %xmm1, 50(%rax)
	vpextrb	$7, %xmm1, 52(%rax)
	vpextrb	$8, %xmm1, 53(%rax)
	vpextrb	$9, %xmm1, 54(%rax)
	vpextrb	$10, %xmm1, 56(%rax)
	vpextrb	$11, %xmm1, 57(%rax)
	vpextrb	$12, %xmm1, 58(%rax)
	vpextrb	$13, %xmm1, 60(%rax)
	vpextrb	$14, %xmm1, 61(%rax)
	vpextrb	$15, %xmm1, 62(%rax)
	vextracti128	$0x1, %ymm1, %xmm1
	vpextrb	$14, %xmm2, 40(%rax)
	vpextrb	$15, %xmm2, 41(%rax)
	vpextrb	$0, %xmm1, 64(%rax)
	vpextrb	$1, %xmm1, 65(%rax)
	vpextrb	$2, %xmm1, 66(%rax)
	vpextrb	$3, %xmm1, 68(%rax)
	vpextrb	$4, %xmm1, 69(%rax)
	vpextrb	$5, %xmm1, 70(%rax)
	vpextrb	$6, %xmm1, 72(%rax)
	vpextrb	$7, %xmm1, 73(%rax)
	vpextrb	$8, %xmm1, 74(%rax)
	vpextrb	$9, %xmm1, 76(%rax)
	vpextrb	$10, %xmm1, 77(%rax)
	vpextrb	$11, %xmm1, 78(%rax)
	vpextrb	$12, %xmm1, 80(%rax)
	vpextrb	$13, %xmm1, 81(%rax)
	vpextrb	$14, %xmm1, 82(%rax)
	vpextrb	$0, %xmm0, 85(%rax)
	vpextrb	$1, %xmm0, 86(%rax)
	vpextrb	$2, %xmm0, 88(%rax)
	vpextrb	$3, %xmm0, 89(%rax)
	vpextrb	$4, %xmm0, 90(%rax)
	vpextrb	$5, %xmm0, 92(%rax)
	vpextrb	$6, %xmm0, 93(%rax)
	vpextrb	$7, %xmm0, 94(%rax)
	vpextrb	$8, %xmm0, 96(%rax)
	vpextrb	$9, %xmm0, 97(%rax)
	vpextrb	$10, %xmm0, 98(%rax)
	vpextrb	$11, %xmm0, 100(%rax)
	vpextrb	$12, %xmm0, 101(%rax)
	vpextrb	$13, %xmm0, 102(%rax)
	vpextrb	$14, %xmm0, 104(%rax)
	vpextrb	$15, %xmm0, 105(%rax)
	vextracti128	$0x1, %ymm0, %xmm0
	vpextrb	$15, %xmm1, 84(%rax)
	vpextrb	$0, %xmm0, 106(%rax)
	vpextrb	$1, %xmm0, 108(%rax)
	vpextrb	$2, %xmm0, 109(%rax)
	vpextrb	$3, %xmm0, 110(%rax)
	vpextrb	$4, %xmm0, 112(%rax)
	vpextrb	$5, %xmm0, 113(%rax)
	vpextrb	$6, %xmm0, 114(%rax)
	vpextrb	$7, %xmm0, 116(%rax)
	vpextrb	$8, %xmm0, 117(%rax)
	vpextrb	$9, %xmm0, 118(%rax)
	vpextrb	$10, %xmm0, 120(%rax)
	vpextrb	$11, %xmm0, 121(%rax)
	vpextrb	$12, %xmm0, 122(%rax)
	vpextrb	$13, %xmm0, 124(%rax)
	vpextrb	$14, %xmm0, 125(%rax)
	vpextrb	$15, %xmm0, 126(%rax)
	subq	$-128, %rax
	movb	$-1, (%rdx)
	movb	$-1, 4(%rdx)
	movb	$-1, 8(%rdx)
	movb	$-1, 12(%rdx)
	movb	$-1, 16(%rdx)
	movb	$-1, 20(%rdx)
	movb	$-1, 24(%rdx)
	movb	$-1, 28(%rdx)
	movb	$-1, 32(%rdx)
	movb	$-1, 36(%rdx)
	movb	$-1, 40(%rdx)
	movb	$-1, 44(%rdx)
	movb	$-1, 48(%rdx)
	movb	$-1, 52(%rdx)
	movb	$-1, 56(%rdx)
	movb	$-1, 60(%rdx)
	movb	$-1, 64(%rdx)
	movb	$-1, 68(%rdx)
	movb	$-1, 72(%rdx)
	movb	$-1, 76(%rdx)
	movb	$-1, 80(%rdx)
	movb	$-1, 84(%rdx)
	movb	$-1, 88(%rdx)
	movb	$-1, 92(%rdx)
	movb	$-1, 96(%rdx)
	movb	$-1, 100(%rdx)
	movb	$-1, 104(%rdx)
	movb	$-1, 108(%rdx)
	movb	$-1, 112(%rdx)
	movb	$-1, 116(%rdx)
	movb	$-1, 120(%rdx)
	movb	$-1, 124(%rdx)
	addq	$96, %r14
	subq	$-128, %rdx
	cmpq	%rax, %r15
	jne	.L1161
	movq	112(%rsp), %rax
	movl	548(%rsp), %r14d
	leaq	(%rcx,%rax), %rdx
	movq	96(%rsp), %rax
	addq	%rsi, %rax
	movl	556(%rsp), %esi
	cmpl	%esi, %r14d
	je	.L1134
	movl	544(%rsp), %esi
.L1160:
	movl	556(%rsp), %r15d
	subl	%r14d, %r15d
	leal	-1(%r15), %ecx
	cmpl	$14, %ecx
	jbe	.L1164
	leaq	(%r14,%r14,2), %rcx
	addq	%rdi, %rcx
	addq	%r13, %rcx
	vmovdqu	32(%rcx), %xmm0
	vmovdqu	16(%rcx), %xmm1
	vmovdqu	(%rcx), %xmm2
	movl	%r15d, %ecx
	leaq	(%r8,%r14,4), %rdi
	andl	$-16, %ecx
	leaq	3(%r12,%rdi), %r8
	vpextrb	$0, %xmm2, (%r12,%rdi)
	vpextrb	$1, %xmm2, 1(%r12,%rdi)
	vpextrb	$2, %xmm2, 2(%r12,%rdi)
	vpextrb	$3, %xmm2, 4(%r12,%rdi)
	vpextrb	$4, %xmm2, 5(%r12,%rdi)
	vpextrb	$5, %xmm2, 6(%r12,%rdi)
	vpextrb	$6, %xmm2, 8(%r12,%rdi)
	vpextrb	$7, %xmm2, 9(%r12,%rdi)
	vpextrb	$8, %xmm2, 10(%r12,%rdi)
	vpextrb	$9, %xmm2, 12(%r12,%rdi)
	vpextrb	$10, %xmm2, 13(%r12,%rdi)
	vpextrb	$11, %xmm2, 14(%r12,%rdi)
	vpextrb	$12, %xmm2, 16(%r12,%rdi)
	vpextrb	$13, %xmm2, 17(%r12,%rdi)
	vpextrb	$14, %xmm2, 18(%r12,%rdi)
	vpextrb	$15, %xmm2, 20(%r12,%rdi)
	vpextrb	$0, %xmm1, 21(%r12,%rdi)
	vpextrb	$1, %xmm1, 22(%r12,%rdi)
	vpextrb	$2, %xmm1, 24(%r12,%rdi)
	vpextrb	$3, %xmm1, 25(%r12,%rdi)
	vpextrb	$4, %xmm1, 26(%r12,%rdi)
	vpextrb	$5, %xmm1, 28(%r12,%rdi)
	vpextrb	$6, %xmm1, 29(%r12,%rdi)
	vpextrb	$7, %xmm1, 30(%r12,%rdi)
	vpextrb	$8, %xmm1, 32(%r12,%rdi)
	vpextrb	$9, %xmm1, 33(%r12,%rdi)
	vpextrb	$10, %xmm1, 34(%r12,%rdi)
	vpextrb	$11, %xmm1, 36(%r12,%rdi)
	vpextrb	$12, %xmm1, 37(%r12,%rdi)
	vpextrb	$13, %xmm1, 38(%r12,%rdi)
	vpextrb	$14, %xmm1, 40(%r12,%rdi)
	vpextrb	$15, %xmm1, 41(%r12,%rdi)
	vpextrb	$0, %xmm0, 42(%r12,%rdi)
	vpextrb	$1, %xmm0, 44(%r12,%rdi)
	vpextrb	$2, %xmm0, 45(%r12,%rdi)
	vpextrb	$3, %xmm0, 46(%r12,%rdi)
	vpextrb	$4, %xmm0, 48(%r12,%rdi)
	vpextrb	$5, %xmm0, 49(%r12,%rdi)
	vpextrb	$6, %xmm0, 50(%r12,%rdi)
	vpextrb	$7, %xmm0, 52(%r12,%rdi)
	vpextrb	$8, %xmm0, 53(%r12,%rdi)
	vpextrb	$9, %xmm0, 54(%r12,%rdi)
	vpextrb	$10, %xmm0, 56(%r12,%rdi)
	vpextrb	$11, %xmm0, 57(%r12,%rdi)
	vpextrb	$12, %xmm0, 58(%r12,%rdi)
	vpextrb	$13, %xmm0, 60(%r12,%rdi)
	vpextrb	$14, %xmm0, 61(%r12,%rdi)
	vpextrb	$15, %xmm0, 62(%r12,%rdi)
	movl	%ecx, %edi
	movb	$-1, (%r8)
	movb	$-1, 4(%r8)
	movb	$-1, 8(%r8)
	movb	$-1, 12(%r8)
	movb	$-1, 16(%r8)
	movb	$-1, 20(%r8)
	movb	$-1, 24(%r8)
	movb	$-1, 28(%r8)
	movb	$-1, 32(%r8)
	movb	$-1, 36(%r8)
	movb	$-1, 40(%r8)
	movb	$-1, 44(%r8)
	movb	$-1, 48(%r8)
	movb	$-1, 52(%r8)
	movb	$-1, 56(%r8)
	movb	$-1, 60(%r8)
	leaq	(%rdi,%rdi,2), %r8
	subl	%ecx, %esi
	addq	%r8, %rdx
	leaq	(%rax,%rdi,4), %rax
	cmpl	%ecx, %r15d
	je	.L1134
.L1164:
	movzbl	(%rdx), %ecx
	movb	%cl, (%rax)
	movzbl	1(%rdx), %ecx
	movb	%cl, 1(%rax)
	movzbl	2(%rdx), %ecx
	movb	$-1, 3(%rax)
	movb	%cl, 2(%rax)
	testl	%esi, %esi
	je	.L1134
	movzbl	3(%rdx), %ecx
	movb	%cl, 4(%rax)
	movzbl	4(%rdx), %ecx
	movb	%cl, 5(%rax)
	movzbl	5(%rdx), %ecx
	movb	$-1, 7(%rax)
	movb	%cl, 6(%rax)
	cmpl	$1, %esi
	je	.L1134
	movzbl	6(%rdx), %ecx
	movb	%cl, 8(%rax)
	movzbl	7(%rdx), %ecx
	movb	%cl, 9(%rax)
	movzbl	8(%rdx), %ecx
	movb	$-1, 11(%rax)
	movb	%cl, 10(%rax)
	cmpl	$2, %esi
	je	.L1134
	movzbl	9(%rdx), %ecx
	movb	%cl, 12(%rax)
	movzbl	10(%rdx), %ecx
	movb	%cl, 13(%rax)
	movzbl	11(%rdx), %ecx
	movb	$-1, 15(%rax)
	movb	%cl, 14(%rax)
	cmpl	$3, %esi
	je	.L1134
	movzbl	12(%rdx), %ecx
	movb	%cl, 16(%rax)
	movzbl	13(%rdx), %ecx
	movb	%cl, 17(%rax)
	movzbl	14(%rdx), %ecx
	movb	$-1, 19(%rax)
	movb	%cl, 18(%rax)
	cmpl	$4, %esi
	je	.L1134
	movzbl	15(%rdx), %ecx
	movb	%cl, 20(%rax)
	movzbl	16(%rdx), %ecx
	movb	%cl, 21(%rax)
	movzbl	17(%rdx), %ecx
	movb	$-1, 23(%rax)
	movb	%cl, 22(%rax)
	cmpl	$5, %esi
	je	.L1134
	movzbl	18(%rdx), %ecx
	movb	%cl, 24(%rax)
	movzbl	19(%rdx), %ecx
	movb	%cl, 25(%rax)
	movzbl	20(%rdx), %ecx
	movb	$-1, 27(%rax)
	movb	%cl, 26(%rax)
	cmpl	$6, %esi
	je	.L1134
	movzbl	21(%rdx), %ecx
	movb	%cl, 28(%rax)
	movzbl	22(%rdx), %ecx
	movb	%cl, 29(%rax)
	movzbl	23(%rdx), %ecx
	movb	$-1, 31(%rax)
	movb	%cl, 30(%rax)
	cmpl	$7, %esi
	je	.L1134
	movzbl	24(%rdx), %ecx
	movb	%cl, 32(%rax)
	movzbl	25(%rdx), %ecx
	movb	%cl, 33(%rax)
	movzbl	26(%rdx), %ecx
	movb	$-1, 35(%rax)
	movb	%cl, 34(%rax)
	cmpl	$8, %esi
	je	.L1134
	movzbl	27(%rdx), %ecx
	movb	%cl, 36(%rax)
	movzbl	28(%rdx), %ecx
	movb	%cl, 37(%rax)
	movzbl	29(%rdx), %ecx
	movb	$-1, 39(%rax)
	movb	%cl, 38(%rax)
	cmpl	$9, %esi
	je	.L1134
	movzbl	30(%rdx), %ecx
	movb	%cl, 40(%rax)
	movzbl	31(%rdx), %ecx
	movb	%cl, 41(%rax)
	movzbl	32(%rdx), %ecx
	movb	$-1, 43(%rax)
	movb	%cl, 42(%rax)
	cmpl	$10, %esi
	je	.L1134
	movzbl	33(%rdx), %ecx
	movb	%cl, 44(%rax)
	movzbl	34(%rdx), %ecx
	movb	%cl, 45(%rax)
	movzbl	35(%rdx), %ecx
	movb	$-1, 47(%rax)
	movb	%cl, 46(%rax)
	cmpl	$11, %esi
	je	.L1134
	movzbl	36(%rdx), %ecx
	movb	%cl, 48(%rax)
	movzbl	37(%rdx), %ecx
	movb	%cl, 49(%rax)
	movzbl	38(%rdx), %ecx
	movb	$-1, 51(%rax)
	movb	%cl, 50(%rax)
	cmpl	$12, %esi
	je	.L1134
	movzbl	39(%rdx), %ecx
	movb	%cl, 52(%rax)
	movzbl	40(%rdx), %ecx
	movb	%cl, 53(%rax)
	movzbl	41(%rdx), %ecx
	movb	$-1, 55(%rax)
	movb	%cl, 54(%rax)
	cmpl	$13, %esi
	je	.L1134
	movzbl	42(%rdx), %ecx
	movb	%cl, 56(%rax)
	movzbl	43(%rdx), %ecx
	movb	%cl, 57(%rax)
	movzbl	44(%rdx), %edx
	movb	$-1, 59(%rax)
	movb	%dl, 58(%rax)
	jmp	.L1134
	.p2align 4,,10
	.p2align 3
.L1126:
	cmpl	$-1, 568(%rsp)
	je	.L1134
	cmpb	$0, 555(%rsp)
	jne	.L1201
	vmovdqa	.LC159(%rip), %ymm6
	vmovdqa	.LC166(%rip), %ymm7
	vmovdqa	%ymm6, 480(%rsp)
	vmovdqa	.LC54(%rip), %ymm6
	vmovdqa	%ymm7, 288(%rsp)
	vmovdqa	%ymm6, 512(%rsp)
	vmovdqa	.LC160(%rip), %ymm6
	vmovdqa	.LC167(%rip), %ymm7
	vmovdqa	%ymm6, 448(%rsp)
	vmovdqa	.LC161(%rip), %ymm6
	vmovdqa	%ymm7, 256(%rsp)
	vmovdqa	%ymm6, 416(%rsp)
	vmovdqa	.LC162(%rip), %ymm6
	vmovdqa	.LC168(%rip), %ymm7
	vmovdqa	%ymm6, 384(%rsp)
	vmovdqa	.LC163(%rip), %ymm6
	vmovdqa	%ymm7, 224(%rsp)
	vmovdqa	%ymm6, 352(%rsp)
	vmovdqa	.LC169(%rip), %ymm7
	vmovdqa	.LC164(%rip), %ymm6
	movq	48(%rsp), %r15
	vmovdqa	.LC172(%rip), %ymm3
	vmovdqa	.LC173(%rip), %ymm2
	vmovdqa	%ymm6, 320(%rsp)
	vmovdqa	.LC2(%rip), %ymm0
	vmovdqa	.LC156(%rip), %ymm14
	vmovdqa	.LC157(%rip), %ymm13
	vmovdqa	.LC158(%rip), %ymm12
	vmovdqa	.LC165(%rip), %ymm6
	vmovdqa	.LC170(%rip), %ymm11
	vmovdqa	.LC171(%rip), %ymm10
	vmovdqa	%ymm7, 192(%rsp)
	vmovdqa	.LC174(%rip), %ymm1
	leaq	64(%r15,%rsi), %r14
	vmovdqa	%xmm3, 176(%rsp)
	vmovdqa	%xmm2, 160(%rsp)
	vmovdqa	%xmm1, 144(%rsp)
	vpcmpeqd	%ymm15, %ymm15, %ymm15
	.p2align 4,,10
	.p2align 3
.L1173:
	vmovdqu	(%rdx), %ymm2
	vmovdqu	32(%rdx), %ymm5
	vpshufb	%ymm14, %ymm2, %ymm1
	vmovdqu	64(%rdx), %ymm3
	vpermq	$78, %ymm1, %ymm1
	vpshufb	%ymm13, %ymm2, %ymm4
	vpshufb	%ymm12, %ymm5, %ymm7
	vpor	%ymm1, %ymm4, %ymm4
	vpor	%ymm7, %ymm4, %ymm4
	vpshufb	480(%rsp), %ymm3, %ymm7
	vpermq	$78, %ymm7, %ymm7
	vpshufb	448(%rsp), %ymm3, %ymm1
	vpor	%ymm7, %ymm1, %ymm1
	vpshufb	512(%rsp), %ymm4, %ymm4
	vpshufb	416(%rsp), %ymm2, %ymm7
	vpor	%ymm1, %ymm4, %ymm4
	vpermq	$78, %ymm7, %ymm7
	vpshufb	384(%rsp), %ymm2, %ymm1
	vpshufb	352(%rsp), %ymm5, %ymm8
	vpor	%ymm7, %ymm1, %ymm1
	vpor	%ymm8, %ymm1, %ymm1
	vpshufb	320(%rsp), %ymm3, %ymm8
	vpermq	$78, %ymm8, %ymm8
	vpshufb	288(%rsp), %ymm3, %ymm7
	vpor	%ymm8, %ymm7, %ymm7
	vpshufb	%ymm6, %ymm1, %ymm1
	vpor	%ymm7, %ymm1, %ymm1
	vpshufb	256(%rsp), %ymm2, %ymm7
	vpermq	$78, %ymm7, %ymm7
	vpshufb	224(%rsp), %ymm2, %ymm2
	vpshufb	192(%rsp), %ymm5, %ymm5
	vpor	%ymm7, %ymm2, %ymm2
	vpor	%ymm5, %ymm2, %ymm2
	vpshufb	%ymm11, %ymm3, %ymm5
	vpermq	$78, %ymm5, %ymm5
	vpshufb	%ymm10, %ymm3, %ymm3
	vpor	%ymm5, %ymm3, %ymm3
	vpmovzxbw	176(%rsp), %ymm9
	vpmovzxbw	160(%rsp), %ymm8
	vpshufb	%ymm6, %ymm2, %ymm2
	vpor	%ymm3, %ymm2, %ymm2
	vpmovzxbw	%xmm1, %ymm5
	vpmovzxbw	%xmm4, %ymm3
	vpmullw	%ymm8, %ymm5, %ymm5
	vpmullw	%ymm9, %ymm3, %ymm3
	vextracti128	$0x1, %ymm4, %xmm4
	vextracti128	$0x1, %ymm1, %xmm1
	vpmovzxbw	144(%rsp), %ymm7
	vpmovzxbw	%xmm4, %ymm4
	vpaddw	%ymm5, %ymm3, %ymm3
	vpmovzxbw	%xmm1, %ymm1
	vpmovzxbw	%xmm2, %ymm5
	vextracti128	$0x1, %ymm2, %xmm2
	vpmullw	%ymm9, %ymm4, %ymm4
	vpmullw	%ymm8, %ymm1, %ymm1
	vpmovzxbw	%xmm2, %ymm2
	vpmullw	%ymm7, %ymm2, %ymm2
	vpmullw	%ymm7, %ymm5, %ymm5
	addq	$64, %rax
	vpaddw	%ymm1, %ymm4, %ymm1
	addq	$96, %rdx
	vpaddw	%ymm2, %ymm1, %ymm1
	vpaddw	%ymm5, %ymm3, %ymm3
	vpsrlw	$8, %ymm3, %ymm3
	vpsrlw	$8, %ymm1, %ymm1
	vpand	%ymm1, %ymm0, %ymm1
	vpand	%ymm3, %ymm0, %ymm3
	vpackuswb	%ymm1, %ymm3, %ymm3
	vpermq	$216, %ymm3, %ymm3
	vpunpcklbw	%ymm15, %ymm3, %ymm1
	vpunpckhbw	%ymm15, %ymm3, %ymm3
	vperm2i128	$32, %ymm3, %ymm1, %ymm2
	vperm2i128	$49, %ymm3, %ymm1, %ymm1
	vmovdqu	%ymm2, -64(%rax)
	vmovdqu	%ymm1, -32(%rax)
	cmpq	%rax, %r14
	jne	.L1173
	movq	112(%rsp), %rax
	leaq	(%rcx,%rax), %rdx
	movq	128(%rsp), %rax
	movl	556(%rsp), %ecx
	addq	%rsi, %rax
	movl	548(%rsp), %esi
	cmpl	%ecx, %esi
	je	.L1134
	movl	%esi, %ecx
	movl	544(%rsp), %esi
.L1172:
	movl	556(%rsp), %r14d
	subl	%ecx, %r14d
	leal	-1(%r14), %r15d
	cmpl	$14, %r15d
	jbe	.L1176
	leaq	(%rcx,%rcx), %r15
	addq	%r15, %rcx
	addq	%rdi, %rcx
	addq	%r13, %rcx
	vmovdqu	(%rcx), %xmm1
	vmovdqu	16(%rcx), %xmm5
	vmovdqu	32(%rcx), %xmm4
	vpshufb	.LC176(%rip), %xmm5, %xmm2
	vpshufb	.LC175(%rip), %xmm1, %xmm0
	vpor	%xmm2, %xmm0, %xmm0
	vmovdqa	.LC178(%rip), %xmm2
	vpshufb	.LC177(%rip), %xmm4, %xmm3
	vpblendvb	%xmm2, %xmm3, %xmm0, %xmm0
	vpshufb	.LC180(%rip), %xmm5, %xmm6
	vpshufb	.LC179(%rip), %xmm1, %xmm3
	vpor	%xmm6, %xmm3, %xmm3
	vpshufb	.LC181(%rip), %xmm4, %xmm6
	vpblendvb	%xmm2, %xmm6, %xmm3, %xmm3
	vpshufb	.LC183(%rip), %xmm5, %xmm5
	vmovdqa	.LC185(%rip), %xmm6
	vpshufb	.LC182(%rip), %xmm1, %xmm2
	vpor	%xmm5, %xmm2, %xmm2
	vpshufb	.LC184(%rip), %xmm4, %xmm4
	vmovdqa	.LC186(%rip), %xmm5
	vpblendw	$224, %xmm4, %xmm2, %xmm2
	vpmovzxbw	%xmm0, %xmm1
	vpmovzxbw	%xmm6, %xmm4
	vpmovzxbw	%xmm5, %xmm7
	vpmullw	%xmm4, %xmm1, %xmm1
	vpmovzxbw	%xmm3, %xmm4
	vpmullw	%xmm7, %xmm4, %xmm4
	vpsrldq	$8, %xmm0, %xmm0
	vpsrldq	$8, %xmm6, %xmm6
	vpsrldq	$8, %xmm3, %xmm3
	vpsrldq	$8, %xmm5, %xmm5
	vpaddw	%xmm4, %xmm1, %xmm1
	vmovdqa	.LC187(%rip), %xmm4
	vpmovzxbw	%xmm2, %xmm7
	vpmovzxbw	%xmm4, %xmm8
	vpmovzxbw	%xmm0, %xmm0
	vpmovzxbw	%xmm6, %xmm6
	vpmovzxbw	%xmm3, %xmm3
	vpmovzxbw	%xmm5, %xmm5
	vpsrldq	$8, %xmm2, %xmm2
	vpsrldq	$8, %xmm4, %xmm4
	vpmullw	%xmm6, %xmm0, %xmm0
	vpmullw	%xmm5, %xmm3, %xmm3
	vpmovzxbw	%xmm2, %xmm2
	vpmovzxbw	%xmm4, %xmm4
	vpmullw	%xmm4, %xmm2, %xmm2
	vpmullw	%xmm8, %xmm7, %xmm7
	vpaddw	%xmm3, %xmm0, %xmm0
	movl	%r14d, %edi
	andl	$-16, %edi
	vpaddw	%xmm2, %xmm0, %xmm0
	vpaddw	%xmm7, %xmm1, %xmm1
	vmovdqa	.LC5(%rip), %xmm2
	vpsrlw	$8, %xmm0, %xmm0
	vpsrlw	$8, %xmm1, %xmm1
	vpand	%xmm1, %xmm2, %xmm1
	movl	%edi, %ecx
	vpand	%xmm0, %xmm2, %xmm2
	vpackuswb	%xmm2, %xmm1, %xmm0
	addq	%r8, %r15
	vpcmpeqd	%xmm1, %xmm1, %xmm1
	leaq	(%rcx,%rcx), %r8
	addq	%r12, %r15
	vpunpcklbw	%xmm1, %xmm0, %xmm2
	addq	%r8, %rcx
	vpunpckhbw	%xmm1, %xmm0, %xmm0
	vmovdqu	%xmm2, (%r15)
	vmovdqu	%xmm0, 16(%r15)
	subl	%edi, %esi
	addq	%rcx, %rdx
	addq	%r8, %rax
	cmpl	%edi, %r14d
	je	.L1134
.L1176:
	movzbl	(%rdx), %ecx
	movzbl	1(%rdx), %edi
	imull	$77, %ecx, %ecx
	imull	$150, %edi, %edi
	addl	%edi, %ecx
	movzbl	2(%rdx), %edi
	movb	$-1, 1(%rax)
	imull	$29, %edi, %edi
	addl	%edi, %ecx
	movb	%ch, (%rax)
	testl	%esi, %esi
	je	.L1134
	movzbl	3(%rdx), %ecx
	movzbl	4(%rdx), %edi
	imull	$77, %ecx, %ecx
	imull	$150, %edi, %edi
	addl	%edi, %ecx
	movzbl	5(%rdx), %edi
	movb	$-1, 3(%rax)
	imull	$29, %edi, %edi
	addl	%edi, %ecx
	movb	%ch, 2(%rax)
	cmpl	$1, %esi
	je	.L1134
	movzbl	6(%rdx), %ecx
	movzbl	7(%rdx), %edi
	imull	$77, %ecx, %ecx
	imull	$150, %edi, %edi
	addl	%edi, %ecx
	movzbl	8(%rdx), %edi
	movb	$-1, 5(%rax)
	imull	$29, %edi, %edi
	addl	%edi, %ecx
	movb	%ch, 4(%rax)
	cmpl	$2, %esi
	je	.L1134
	movzbl	9(%rdx), %ecx
	movzbl	10(%rdx), %edi
	imull	$77, %ecx, %ecx
	imull	$150, %edi, %edi
	addl	%edi, %ecx
	movzbl	11(%rdx), %edi
	movb	$-1, 7(%rax)
	imull	$29, %edi, %edi
	addl	%edi, %ecx
	movb	%ch, 6(%rax)
	cmpl	$3, %esi
	je	.L1134
	movzbl	12(%rdx), %ecx
	movzbl	13(%rdx), %edi
	imull	$77, %ecx, %ecx
	imull	$150, %edi, %edi
	addl	%edi, %ecx
	movzbl	14(%rdx), %edi
	movb	$-1, 9(%rax)
	imull	$29, %edi, %edi
	addl	%edi, %ecx
	movb	%ch, 8(%rax)
	cmpl	$4, %esi
	je	.L1134
	movzbl	15(%rdx), %ecx
	movzbl	16(%rdx), %edi
	imull	$77, %ecx, %ecx
	imull	$150, %edi, %edi
	addl	%edi, %ecx
	movzbl	17(%rdx), %edi
	movb	$-1, 11(%rax)
	imull	$29, %edi, %edi
	addl	%edi, %ecx
	movb	%ch, 10(%rax)
	cmpl	$5, %esi
	je	.L1134
	movzbl	18(%rdx), %ecx
	movzbl	19(%rdx), %edi
	imull	$77, %ecx, %ecx
	imull	$150, %edi, %edi
	addl	%edi, %ecx
	movzbl	20(%rdx), %edi
	movb	$-1, 13(%rax)
	imull	$29, %edi, %edi
	addl	%edi, %ecx
	movb	%ch, 12(%rax)
	cmpl	$6, %esi
	je	.L1134
	movzbl	21(%rdx), %ecx
	movzbl	22(%rdx), %edi
	imull	$77, %ecx, %ecx
	imull	$150, %edi, %edi
	addl	%edi, %ecx
	movzbl	23(%rdx), %edi
	movb	$-1, 15(%rax)
	imull	$29, %edi, %edi
	addl	%edi, %ecx
	movb	%ch, 14(%rax)
	cmpl	$7, %esi
	je	.L1134
	movzbl	24(%rdx), %ecx
	movzbl	25(%rdx), %edi
	imull	$77, %ecx, %ecx
	imull	$150, %edi, %edi
	addl	%edi, %ecx
	movzbl	26(%rdx), %edi
	movb	$-1, 17(%rax)
	imull	$29, %edi, %edi
	addl	%edi, %ecx
	movb	%ch, 16(%rax)
	cmpl	$8, %esi
	je	.L1134
	movzbl	27(%rdx), %ecx
	movzbl	28(%rdx), %edi
	imull	$77, %ecx, %ecx
	imull	$150, %edi, %edi
	addl	%edi, %ecx
	movzbl	29(%rdx), %edi
	movb	$-1, 19(%rax)
	imull	$29, %edi, %edi
	addl	%edi, %ecx
	movb	%ch, 18(%rax)
	cmpl	$9, %esi
	je	.L1134
	movzbl	30(%rdx), %ecx
	movzbl	31(%rdx), %edi
	imull	$77, %ecx, %ecx
	imull	$150, %edi, %edi
	addl	%edi, %ecx
	movzbl	32(%rdx), %edi
	movb	$-1, 21(%rax)
	imull	$29, %edi, %edi
	addl	%edi, %ecx
	movb	%ch, 20(%rax)
	cmpl	$10, %esi
	je	.L1134
	movzbl	33(%rdx), %ecx
	movzbl	34(%rdx), %edi
	imull	$77, %ecx, %ecx
	imull	$150, %edi, %edi
	addl	%edi, %ecx
	movzbl	35(%rdx), %edi
	movb	$-1, 23(%rax)
	imull	$29, %edi, %edi
	addl	%edi, %ecx
	movb	%ch, 22(%rax)
	cmpl	$11, %esi
	je	.L1134
	movzbl	36(%rdx), %ecx
	movzbl	37(%rdx), %edi
	imull	$77, %ecx, %ecx
	imull	$150, %edi, %edi
	addl	%edi, %ecx
	movzbl	38(%rdx), %edi
	movb	$-1, 25(%rax)
	imull	$29, %edi, %edi
	addl	%edi, %ecx
	movb	%ch, 24(%rax)
	cmpl	$12, %esi
	je	.L1134
	movzbl	39(%rdx), %ecx
	movzbl	40(%rdx), %edi
	imull	$77, %ecx, %ecx
	imull	$150, %edi, %edi
	addl	%edi, %ecx
	movzbl	41(%rdx), %edi
	movb	$-1, 27(%rax)
	imull	$29, %edi, %edi
	addl	%edi, %ecx
	movb	%ch, 26(%rax)
	cmpl	$13, %esi
	je	.L1134
	movzbl	42(%rdx), %esi
	movzbl	43(%rdx), %ecx
	movzbl	44(%rdx), %edx
	imull	$77, %esi, %esi
	imull	$150, %ecx, %ecx
	imull	$29, %edx, %edx
	movb	$-1, 29(%rax)
	addl	%esi, %ecx
	addl	%edx, %ecx
	movb	%ch, 28(%rax)
	jmp	.L1134
	.p2align 4,,10
	.p2align 3
.L1127:
	cmpl	$-1, 568(%rsp)
	je	.L1134
	cmpb	$0, 555(%rsp)
	jne	.L1200
	vmovdqa	.LC159(%rip), %ymm6
	vmovdqa	.LC166(%rip), %ymm7
	vmovdqa	%ymm6, 480(%rsp)
	vmovdqa	.LC54(%rip), %ymm6
	vmovdqa	%ymm7, 288(%rsp)
	vmovdqa	%ymm6, 512(%rsp)
	vmovdqa	.LC160(%rip), %ymm6
	vmovdqa	.LC167(%rip), %ymm7
	vmovdqa	%ymm6, 448(%rsp)
	vmovdqa	.LC161(%rip), %ymm6
	vmovdqa	%ymm7, 256(%rsp)
	vmovdqa	%ymm6, 416(%rsp)
	vmovdqa	.LC162(%rip), %ymm6
	vmovdqa	.LC168(%rip), %ymm7
	vmovdqa	%ymm6, 384(%rsp)
	vmovdqa	.LC163(%rip), %ymm6
	vmovdqa	%ymm7, 224(%rsp)
	vmovdqa	%ymm6, 352(%rsp)
	vmovdqa	.LC169(%rip), %ymm7
	vmovdqa	.LC164(%rip), %ymm6
	movq	88(%rsp), %r15
	vmovdqa	.LC172(%rip), %ymm3
	vmovdqa	.LC173(%rip), %ymm2
	vmovdqa	%ymm6, 320(%rsp)
	vmovdqa	.LC2(%rip), %ymm0
	vmovdqa	.LC156(%rip), %ymm14
	vmovdqa	.LC157(%rip), %ymm13
	vmovdqa	.LC158(%rip), %ymm12
	vmovdqa	.LC165(%rip), %ymm6
	vmovdqa	.LC170(%rip), %ymm11
	vmovdqa	.LC171(%rip), %ymm10
	vmovdqa	%ymm7, 192(%rsp)
	vmovdqa	.LC174(%rip), %ymm1
	movq	%rcx, %rax
	movq	%rsi, %rdx
	leaq	(%rsi,%r15), %r8
	vmovdqa	%xmm3, 176(%rsp)
	vmovdqa	%xmm2, %xmm15
	vmovdqa	%xmm1, 160(%rsp)
	.p2align 4,,10
	.p2align 3
.L1167:
	vmovdqu	(%rax), %ymm2
	vmovdqu	32(%rax), %ymm5
	vpshufb	%ymm14, %ymm2, %ymm1
	vmovdqu	64(%rax), %ymm3
	vpermq	$78, %ymm1, %ymm1
	vpshufb	%ymm13, %ymm2, %ymm4
	vpshufb	%ymm12, %ymm5, %ymm7
	vpor	%ymm1, %ymm4, %ymm4
	vpor	%ymm7, %ymm4, %ymm4
	vpshufb	480(%rsp), %ymm3, %ymm7
	vpermq	$78, %ymm7, %ymm7
	vpshufb	448(%rsp), %ymm3, %ymm1
	vpor	%ymm7, %ymm1, %ymm1
	vpshufb	512(%rsp), %ymm4, %ymm4
	vpshufb	416(%rsp), %ymm2, %ymm7
	vpor	%ymm1, %ymm4, %ymm4
	vpermq	$78, %ymm7, %ymm7
	vpshufb	384(%rsp), %ymm2, %ymm1
	vpshufb	352(%rsp), %ymm5, %ymm8
	vpor	%ymm7, %ymm1, %ymm1
	vpor	%ymm8, %ymm1, %ymm1
	vpshufb	320(%rsp), %ymm3, %ymm8
	vpermq	$78, %ymm8, %ymm8
	vpshufb	288(%rsp), %ymm3, %ymm7
	vpor	%ymm8, %ymm7, %ymm7
	vpshufb	%ymm6, %ymm1, %ymm1
	vpor	%ymm7, %ymm1, %ymm1
	vpshufb	256(%rsp), %ymm2, %ymm7
	vpermq	$78, %ymm7, %ymm7
	vpshufb	224(%rsp), %ymm2, %ymm2
	vpshufb	192(%rsp), %ymm5, %ymm5
	vpor	%ymm7, %ymm2, %ymm2
	vpor	%ymm5, %ymm2, %ymm2
	vpshufb	%ymm11, %ymm3, %ymm5
	vpermq	$78, %ymm5, %ymm5
	vpshufb	%ymm10, %ymm3, %ymm3
	vpor	%ymm5, %ymm3, %ymm3
	vpmovzxbw	176(%rsp), %ymm9
	vpshufb	%ymm6, %ymm2, %ymm2
	vpor	%ymm3, %ymm2, %ymm2
	vpmovzxbw	%xmm1, %ymm5
	vpmovzxbw	%xmm4, %ymm3
	vpmovzxbw	%xmm15, %ymm8
	vpmullw	%ymm8, %ymm5, %ymm5
	vpmullw	%ymm9, %ymm3, %ymm3
	vextracti128	$0x1, %ymm4, %xmm4
	vextracti128	$0x1, %ymm1, %xmm1
	vpmovzxbw	160(%rsp), %ymm7
	vpmovzxbw	%xmm4, %ymm4
	vpaddw	%ymm5, %ymm3, %ymm3
	vpmovzxbw	%xmm1, %ymm1
	vpmovzxbw	%xmm2, %ymm5
	vextracti128	$0x1, %ymm2, %xmm2
	vpmullw	%ymm9, %ymm4, %ymm4
	vpmullw	%ymm8, %ymm1, %ymm1
	vpmovzxbw	%xmm2, %ymm2
	vpmullw	%ymm7, %ymm5, %ymm5
	vpmullw	%ymm7, %ymm2, %ymm2
	addq	$32, %rdx
	vpaddw	%ymm1, %ymm4, %ymm1
	addq	$96, %rax
	vpaddw	%ymm5, %ymm3, %ymm3
	vpaddw	%ymm2, %ymm1, %ymm1
	vpsrlw	$8, %ymm3, %ymm3
	vpsrlw	$8, %ymm1, %ymm1
	vpand	%ymm3, %ymm0, %ymm3
	vpand	%ymm1, %ymm0, %ymm1
	vpackuswb	%ymm1, %ymm3, %ymm3
	vpermq	$216, %ymm3, %ymm3
	vmovdqu	%ymm3, -32(%rdx)
	cmpq	%rdx, %r8
	jne	.L1167
	movq	112(%rsp), %rax
	movl	548(%rsp), %r14d
	leaq	(%rcx,%rax), %rdx
	movq	104(%rsp), %rax
	movl	556(%rsp), %ecx
	addq	%rsi, %rax
	cmpl	%ecx, %r14d
	je	.L1134
	movl	544(%rsp), %r8d
	movl	%ecx, %r15d
.L1166:
	subl	%r14d, %r15d
	leal	-1(%r15), %ecx
	cmpl	$14, %ecx
	jbe	.L1170
	leaq	(%r14,%r14,2), %rcx
	addq	%rdi, %rcx
	addq	%r13, %rcx
	vmovdqu	(%rcx), %xmm2
	vmovdqu	16(%rcx), %xmm5
	vmovdqu	32(%rcx), %xmm4
	vmovdqa	.LC178(%rip), %xmm3
	vpshufb	.LC176(%rip), %xmm5, %xmm1
	vpshufb	.LC175(%rip), %xmm2, %xmm0
	vpor	%xmm1, %xmm0, %xmm0
	vpshufb	.LC177(%rip), %xmm4, %xmm1
	vpblendvb	%xmm3, %xmm1, %xmm0, %xmm0
	vpshufb	.LC180(%rip), %xmm5, %xmm6
	vpshufb	.LC179(%rip), %xmm2, %xmm1
	vpor	%xmm6, %xmm1, %xmm1
	vpshufb	.LC181(%rip), %xmm4, %xmm6
	vpblendvb	%xmm3, %xmm6, %xmm1, %xmm1
	vmovdqa	.LC185(%rip), %xmm7
	vpshufb	.LC182(%rip), %xmm2, %xmm3
	vpshufb	.LC183(%rip), %xmm5, %xmm5
	vmovdqa	.LC186(%rip), %xmm6
	vpor	%xmm5, %xmm3, %xmm3
	vpshufb	.LC184(%rip), %xmm4, %xmm4
	vpblendw	$224, %xmm4, %xmm3, %xmm3
	vpmovzxbw	%xmm0, %xmm2
	vpmovzxbw	%xmm7, %xmm4
	vpmullw	%xmm4, %xmm2, %xmm2
	vpmovzxbw	%xmm6, %xmm5
	vpmovzxbw	%xmm1, %xmm4
	vpmullw	%xmm5, %xmm4, %xmm4
	vmovdqa	.LC187(%rip), %xmm5
	vpsrldq	$8, %xmm0, %xmm0
	vpmovzxbw	%xmm5, %xmm8
	vpmovzxbw	%xmm0, %xmm0
	vpaddw	%xmm4, %xmm2, %xmm2
	vpmovzxbw	%xmm3, %xmm4
	vpmullw	%xmm8, %xmm4, %xmm4
	vpsrldq	$8, %xmm5, %xmm5
	vpmovzxbw	%xmm5, %xmm5
	movl	%r15d, %ecx
	andl	$-16, %ecx
	vpaddw	%xmm4, %xmm2, %xmm2
	vpsrlw	$8, %xmm2, %xmm4
	vpsrldq	$8, %xmm7, %xmm2
	vpmovzxbw	%xmm2, %xmm2
	vpmullw	%xmm2, %xmm0, %xmm0
	vpsrldq	$8, %xmm1, %xmm2
	vpsrldq	$8, %xmm6, %xmm1
	vpmovzxbw	%xmm1, %xmm1
	vpmovzxbw	%xmm2, %xmm2
	vpmullw	%xmm1, %xmm2, %xmm2
	vpsrldq	$8, %xmm3, %xmm1
	vpmovzxbw	%xmm1, %xmm1
	vpmullw	%xmm5, %xmm1, %xmm1
	subl	%ecx, %r8d
	vpaddw	%xmm2, %xmm0, %xmm0
	vpaddw	%xmm1, %xmm0, %xmm0
	vmovdqa	.LC5(%rip), %xmm1
	vpsrlw	$8, %xmm0, %xmm0
	vpand	%xmm4, %xmm1, %xmm2
	vpand	%xmm0, %xmm1, %xmm1
	vpackuswb	%xmm1, %xmm2, %xmm2
	vmovdqu	%xmm2, (%rsi,%r14)
	movl	%ecx, %esi
	leaq	(%rsi,%rsi,2), %rdi
	addq	%rdi, %rdx
	addq	%rsi, %rax
	cmpl	%ecx, %r15d
	je	.L1134
.L1170:
	movzbl	(%rdx), %ecx
	movzbl	1(%rdx), %esi
	imull	$77, %ecx, %ecx
	imull	$150, %esi, %esi
	addl	%esi, %ecx
	movzbl	2(%rdx), %esi
	imull	$29, %esi, %esi
	addl	%esi, %ecx
	movb	%ch, (%rax)
	testl	%r8d, %r8d
	je	.L1134
	movzbl	3(%rdx), %ecx
	movzbl	4(%rdx), %esi
	imull	$77, %ecx, %ecx
	imull	$150, %esi, %esi
	addl	%esi, %ecx
	movzbl	5(%rdx), %esi
	imull	$29, %esi, %esi
	addl	%esi, %ecx
	movb	%ch, 1(%rax)
	cmpl	$1, %r8d
	je	.L1134
	movzbl	6(%rdx), %ecx
	movzbl	7(%rdx), %esi
	imull	$77, %ecx, %ecx
	imull	$150, %esi, %esi
	addl	%esi, %ecx
	movzbl	8(%rdx), %esi
	imull	$29, %esi, %esi
	addl	%esi, %ecx
	movb	%ch, 2(%rax)
	cmpl	$2, %r8d
	je	.L1134
	movzbl	9(%rdx), %ecx
	movzbl	10(%rdx), %esi
	imull	$77, %ecx, %ecx
	imull	$150, %esi, %esi
	addl	%esi, %ecx
	movzbl	11(%rdx), %esi
	imull	$29, %esi, %esi
	addl	%esi, %ecx
	movb	%ch, 3(%rax)
	cmpl	$3, %r8d
	je	.L1134
	movzbl	12(%rdx), %ecx
	movzbl	13(%rdx), %esi
	imull	$77, %ecx, %ecx
	imull	$150, %esi, %esi
	addl	%esi, %ecx
	movzbl	14(%rdx), %esi
	imull	$29, %esi, %esi
	addl	%esi, %ecx
	movb	%ch, 4(%rax)
	cmpl	$4, %r8d
	je	.L1134
	movzbl	15(%rdx), %ecx
	movzbl	16(%rdx), %esi
	imull	$77, %ecx, %ecx
	imull	$150, %esi, %esi
	addl	%esi, %ecx
	movzbl	17(%rdx), %esi
	imull	$29, %esi, %esi
	addl	%esi, %ecx
	movb	%ch, 5(%rax)
	cmpl	$5, %r8d
	je	.L1134
	movzbl	18(%rdx), %ecx
	movzbl	19(%rdx), %esi
	imull	$77, %ecx, %ecx
	imull	$150, %esi, %esi
	addl	%esi, %ecx
	movzbl	20(%rdx), %esi
	imull	$29, %esi, %esi
	addl	%esi, %ecx
	movb	%ch, 6(%rax)
	cmpl	$6, %r8d
	je	.L1134
	movzbl	21(%rdx), %ecx
	movzbl	22(%rdx), %esi
	imull	$77, %ecx, %ecx
	imull	$150, %esi, %esi
	addl	%esi, %ecx
	movzbl	23(%rdx), %esi
	imull	$29, %esi, %esi
	addl	%esi, %ecx
	movb	%ch, 7(%rax)
	cmpl	$7, %r8d
	je	.L1134
	movzbl	24(%rdx), %ecx
	movzbl	25(%rdx), %esi
	imull	$77, %ecx, %ecx
	imull	$150, %esi, %esi
	addl	%esi, %ecx
	movzbl	26(%rdx), %esi
	imull	$29, %esi, %esi
	addl	%esi, %ecx
	movb	%ch, 8(%rax)
	cmpl	$8, %r8d
	je	.L1134
	movzbl	27(%rdx), %ecx
	movzbl	28(%rdx), %esi
	imull	$77, %ecx, %ecx
	imull	$150, %esi, %esi
	addl	%esi, %ecx
	movzbl	29(%rdx), %esi
	imull	$29, %esi, %esi
	addl	%esi, %ecx
	movb	%ch, 9(%rax)
	cmpl	$9, %r8d
	je	.L1134
	movzbl	30(%rdx), %ecx
	movzbl	31(%rdx), %esi
	imull	$77, %ecx, %ecx
	imull	$150, %esi, %esi
	addl	%esi, %ecx
	movzbl	32(%rdx), %esi
	imull	$29, %esi, %esi
	addl	%esi, %ecx
	movb	%ch, 10(%rax)
	cmpl	$10, %r8d
	je	.L1134
	movzbl	33(%rdx), %ecx
	movzbl	34(%rdx), %esi
	imull	$77, %ecx, %ecx
	imull	$150, %esi, %esi
	addl	%esi, %ecx
	movzbl	35(%rdx), %esi
	imull	$29, %esi, %esi
	addl	%esi, %ecx
	movb	%ch, 11(%rax)
	cmpl	$11, %r8d
	je	.L1134
	movzbl	36(%rdx), %ecx
	movzbl	37(%rdx), %esi
	imull	$77, %ecx, %ecx
	imull	$150, %esi, %esi
	addl	%esi, %ecx
	movzbl	38(%rdx), %esi
	imull	$29, %esi, %esi
	addl	%esi, %ecx
	movb	%ch, 12(%rax)
	cmpl	$12, %r8d
	je	.L1134
	movzbl	39(%rdx), %ecx
	movzbl	40(%rdx), %esi
	imull	$77, %ecx, %ecx
	imull	$150, %esi, %esi
	addl	%esi, %ecx
	movzbl	41(%rdx), %esi
	imull	$29, %esi, %esi
	addl	%esi, %ecx
	movb	%ch, 13(%rax)
	cmpl	$13, %r8d
	je	.L1134
	movzbl	42(%rdx), %esi
	movzbl	43(%rdx), %ecx
	movzbl	44(%rdx), %edx
	imull	$77, %esi, %esi
	imull	$150, %ecx, %ecx
	imull	$29, %edx, %edx
	addl	%esi, %ecx
	addl	%edx, %ecx
	movb	%ch, 14(%rax)
	jmp	.L1134
	.p2align 4,,10
	.p2align 3
.L1128:
	cmpl	$-1, 568(%rsp)
	je	.L1134
	cmpb	$0, 555(%rsp)
	jne	.L1198
	movq	48(%rsp), %r15
	vmovdqa	.LC2(%rip), %ymm0
	vmovdqa	.LC155(%rip), %ymm5
	leaq	64(%r15,%rcx), %r14
	.p2align 4,,10
	.p2align 3
.L1155:
	vmovdqu	(%rdx), %ymm2
	vmovdqu	32(%rdx), %ymm3
	vpand	%ymm2, %ymm0, %ymm1
	vpand	%ymm3, %ymm0, %ymm4
	vpsrlw	$8, %ymm2, %ymm2
	vpsrlw	$8, %ymm3, %ymm3
	vpackuswb	%ymm4, %ymm1, %ymm1
	vpackuswb	%ymm3, %ymm2, %ymm2
	vpermq	$216, %ymm1, %ymm1
	vpermq	$216, %ymm2, %ymm2
	vpunpcklbw	%ymm2, %ymm1, %ymm6
	vperm2i128	$0, %ymm1, %ymm1, %ymm4
	vperm2i128	$17, %ymm1, %ymm1, %ymm3
	vpunpckhbw	%ymm2, %ymm1, %ymm1
	vpshufb	%ymm5, %ymm4, %ymm4
	vperm2i128	$32, %ymm1, %ymm6, %ymm7
	vperm2i128	$49, %ymm1, %ymm6, %ymm2
	vpunpckhbw	%ymm7, %ymm4, %ymm1
	vpunpcklbw	%ymm7, %ymm4, %ymm6
	vperm2i128	$32, %ymm1, %ymm6, %ymm4
	vpshufb	%ymm5, %ymm3, %ymm3
	vmovdqu	%ymm4, (%rax)
	vperm2i128	$49, %ymm1, %ymm6, %ymm6
	vpunpcklbw	%ymm2, %ymm3, %ymm4
	vpunpckhbw	%ymm2, %ymm3, %ymm1
	vperm2i128	$32, %ymm1, %ymm4, %ymm2
	addq	$64, %rdx
	vperm2i128	$49, %ymm1, %ymm4, %ymm4
	vmovdqu	%ymm6, 32(%rax)
	vmovdqu	%ymm2, 64(%rax)
	vmovdqu	%ymm4, 96(%rax)
	subq	$-128, %rax
	cmpq	%rdx, %r14
	jne	.L1155
	movq	128(%rsp), %rax
	leaq	(%rcx,%rax), %rdx
	movq	96(%rsp), %rax
	movl	556(%rsp), %ecx
	addq	%rsi, %rax
	movl	548(%rsp), %esi
	cmpl	%ecx, %esi
	je	.L1134
	movl	544(%rsp), %ecx
.L1154:
	movl	556(%rsp), %r14d
	subl	%esi, %r14d
	leal	-1(%r14), %r15d
	cmpl	$14, %r15d
	jbe	.L1158
	leaq	(%rdi,%rsi,2), %rdi
	addq	%r13, %rdi
	vmovdqu	(%rdi), %xmm1
	vmovdqu	16(%rdi), %xmm2
	vmovdqa	.LC5(%rip), %xmm3
	leaq	(%r8,%rsi,4), %rsi
	vpand	%xmm1, %xmm3, %xmm0
	vpand	%xmm2, %xmm3, %xmm3
	vpsrlw	$8, %xmm1, %xmm1
	vpsrlw	$8, %xmm2, %xmm2
	vpackuswb	%xmm3, %xmm0, %xmm0
	vpackuswb	%xmm2, %xmm1, %xmm1
	vpunpcklbw	%xmm0, %xmm0, %xmm3
	vpunpcklbw	%xmm1, %xmm0, %xmm4
	addq	%r12, %rsi
	vpunpckhbw	%xmm0, %xmm0, %xmm2
	vpunpckhbw	%xmm1, %xmm0, %xmm0
	vpunpcklbw	%xmm4, %xmm3, %xmm1
	vmovdqu	%xmm1, (%rsi)
	vpunpckhbw	%xmm4, %xmm3, %xmm3
	vpunpcklbw	%xmm0, %xmm2, %xmm1
	vpunpckhbw	%xmm0, %xmm2, %xmm2
	vmovdqu	%xmm3, 16(%rsi)
	vmovdqu	%xmm1, 32(%rsi)
	vmovdqu	%xmm2, 48(%rsi)
	movl	%r14d, %esi
	andl	$-16, %esi
	movl	%esi, %edi
	subl	%esi, %ecx
	leaq	(%rdx,%rdi,2), %rdx
	leaq	(%rax,%rdi,4), %rax
	cmpl	%esi, %r14d
	je	.L1134
.L1158:
	movzbl	(%rdx), %esi
	movb	%sil, 2(%rax)
	movb	%sil, 1(%rax)
	movb	%sil, (%rax)
	movzbl	1(%rdx), %esi
	movb	%sil, 3(%rax)
	testl	%ecx, %ecx
	je	.L1134
	movzbl	2(%rdx), %esi
	movb	%sil, 6(%rax)
	movb	%sil, 5(%rax)
	movb	%sil, 4(%rax)
	movzbl	3(%rdx), %esi
	movb	%sil, 7(%rax)
	cmpl	$1, %ecx
	je	.L1134
	movzbl	4(%rdx), %esi
	movb	%sil, 10(%rax)
	movb	%sil, 9(%rax)
	movb	%sil, 8(%rax)
	movzbl	5(%rdx), %esi
	movb	%sil, 11(%rax)
	cmpl	$2, %ecx
	je	.L1134
	movzbl	6(%rdx), %esi
	movb	%sil, 14(%rax)
	movb	%sil, 13(%rax)
	movb	%sil, 12(%rax)
	movzbl	7(%rdx), %esi
	movb	%sil, 15(%rax)
	cmpl	$3, %ecx
	je	.L1134
	movzbl	8(%rdx), %esi
	movb	%sil, 18(%rax)
	movb	%sil, 17(%rax)
	movb	%sil, 16(%rax)
	movzbl	9(%rdx), %esi
	movb	%sil, 19(%rax)
	cmpl	$4, %ecx
	je	.L1134
	movzbl	10(%rdx), %esi
	movb	%sil, 22(%rax)
	movb	%sil, 21(%rax)
	movb	%sil, 20(%rax)
	movzbl	11(%rdx), %esi
	movb	%sil, 23(%rax)
	cmpl	$5, %ecx
	je	.L1134
	movzbl	12(%rdx), %esi
	movb	%sil, 26(%rax)
	movb	%sil, 25(%rax)
	movb	%sil, 24(%rax)
	movzbl	13(%rdx), %esi
	movb	%sil, 27(%rax)
	cmpl	$6, %ecx
	je	.L1134
	movzbl	14(%rdx), %esi
	movb	%sil, 30(%rax)
	movb	%sil, 29(%rax)
	movb	%sil, 28(%rax)
	movzbl	15(%rdx), %esi
	movb	%sil, 31(%rax)
	cmpl	$7, %ecx
	je	.L1134
	movzbl	16(%rdx), %esi
	movb	%sil, 34(%rax)
	movb	%sil, 33(%rax)
	movb	%sil, 32(%rax)
	movzbl	17(%rdx), %esi
	movb	%sil, 35(%rax)
	cmpl	$8, %ecx
	je	.L1134
	movzbl	18(%rdx), %esi
	movb	%sil, 38(%rax)
	movb	%sil, 37(%rax)
	movb	%sil, 36(%rax)
	movzbl	19(%rdx), %esi
	movb	%sil, 39(%rax)
	cmpl	$9, %ecx
	je	.L1134
	movzbl	20(%rdx), %esi
	movb	%sil, 42(%rax)
	movb	%sil, 41(%rax)
	movb	%sil, 40(%rax)
	movzbl	21(%rdx), %esi
	movb	%sil, 43(%rax)
	cmpl	$10, %ecx
	je	.L1134
	movzbl	22(%rdx), %esi
	movb	%sil, 46(%rax)
	movb	%sil, 45(%rax)
	movb	%sil, 44(%rax)
	movzbl	23(%rdx), %esi
	movb	%sil, 47(%rax)
	cmpl	$11, %ecx
	je	.L1134
	movzbl	24(%rdx), %esi
	movb	%sil, 50(%rax)
	movb	%sil, 49(%rax)
	movb	%sil, 48(%rax)
	movzbl	25(%rdx), %esi
	movb	%sil, 51(%rax)
	cmpl	$12, %ecx
	je	.L1134
	movzbl	26(%rdx), %esi
	movb	%sil, 54(%rax)
	movb	%sil, 53(%rax)
	movb	%sil, 52(%rax)
	movzbl	27(%rdx), %esi
	movb	%sil, 55(%rax)
	cmpl	$13, %ecx
	je	.L1134
	movzbl	28(%rdx), %ecx
	movb	%cl, 58(%rax)
	movb	%cl, 57(%rax)
	movb	%cl, 56(%rax)
	movzbl	29(%rdx), %edx
	movb	%dl, 59(%rax)
	jmp	.L1134
	.p2align 4,,10
	.p2align 3
.L1129:
	cmpl	$-1, 568(%rsp)
	je	.L1134
	cmpb	$0, 554(%rsp)
	jne	.L1197
	movq	16(%rsp), %r14
	vmovdqa	.LC149(%rip), %ymm5
	salq	$6, %r14
	vmovdqa	.LC150(%rip), %ymm4
	vmovdqa	.LC151(%rip), %ymm3
	addq	%rcx, %r14
	.p2align 4,,10
	.p2align 3
.L1152:
	vmovdqu	(%rdx), %ymm1
	vmovdqu	32(%rdx), %ymm0
	vpermq	$148, %ymm1, %ymm2
	vperm2i128	$33, %ymm0, %ymm1, %ymm1
	vpermq	$233, %ymm0, %ymm0
	vpshufb	%ymm5, %ymm2, %ymm2
	vpshufb	%ymm4, %ymm1, %ymm1
	vpshufb	%ymm3, %ymm0, %ymm0
	addq	$64, %rdx
	vmovdqu	%ymm2, (%rax)
	vmovdqu	%ymm1, 32(%rax)
	vmovdqu	%ymm0, 64(%rax)
	addq	$96, %rax
	cmpq	%rdx, %r14
	jne	.L1152
	movq	40(%rsp), %rax
	movl	136(%rsp), %r15d
	leaq	(%rcx,%rax), %rdx
	movq	32(%rsp), %rax
	movl	124(%rsp), %r14d
	addq	%rsi, %rax
.L1151:
	movl	140(%rsp), %esi
	subl	%r15d, %esi
	cmpl	$15, %esi
	jbe	.L1153
	leaq	(%r15,%r15), %rcx
	addq	%rcx, %rdi
	addq	%r13, %rdi
	vmovdqu	(%rdi), %xmm0
	vmovdqu	16(%rdi), %xmm1
	addq	%r15, %rcx
	vpshufb	.LC152(%rip), %xmm0, %xmm2
	addq	%r8, %rcx
	vpalignr	$10, %xmm0, %xmm1, %xmm0
	addq	%r12, %rcx
	andl	$-16, %esi
	vpshufb	.LC153(%rip), %xmm0, %xmm0
	vpshufb	.LC154(%rip), %xmm1, %xmm1
	vmovdqu	%xmm2, (%rcx)
	vmovdqu	%xmm0, 16(%rcx)
	vmovdqu	%xmm1, 32(%rcx)
	leaq	(%rsi,%rsi), %rcx
	addq	%rcx, %rdx
	addq	%rsi, %rcx
	subl	%esi, %r14d
	addq	%rcx, %rax
.L1153:
	movzbl	(%rdx), %ecx
	movb	%cl, 2(%rax)
	movb	%cl, 1(%rax)
	movb	%cl, (%rax)
	testl	%r14d, %r14d
	je	.L1134
	movzbl	2(%rdx), %ecx
	movb	%cl, 5(%rax)
	movb	%cl, 4(%rax)
	movb	%cl, 3(%rax)
	cmpl	$1, %r14d
	je	.L1134
	movzbl	4(%rdx), %ecx
	movb	%cl, 8(%rax)
	movb	%cl, 7(%rax)
	movb	%cl, 6(%rax)
	cmpl	$2, %r14d
	je	.L1134
	movzbl	6(%rdx), %ecx
	movb	%cl, 11(%rax)
	movb	%cl, 10(%rax)
	movb	%cl, 9(%rax)
	cmpl	$3, %r14d
	je	.L1134
	movzbl	8(%rdx), %ecx
	movb	%cl, 14(%rax)
	movb	%cl, 13(%rax)
	movb	%cl, 12(%rax)
	cmpl	$4, %r14d
	je	.L1134
	movzbl	10(%rdx), %ecx
	movb	%cl, 17(%rax)
	movb	%cl, 16(%rax)
	movb	%cl, 15(%rax)
	cmpl	$5, %r14d
	je	.L1134
	movzbl	12(%rdx), %ecx
	movb	%cl, 20(%rax)
	movb	%cl, 19(%rax)
	movb	%cl, 18(%rax)
	cmpl	$6, %r14d
	je	.L1134
	movzbl	14(%rdx), %ecx
	movb	%cl, 23(%rax)
	movb	%cl, 22(%rax)
	movb	%cl, 21(%rax)
	cmpl	$7, %r14d
	je	.L1134
	movzbl	16(%rdx), %ecx
	movb	%cl, 26(%rax)
	movb	%cl, 25(%rax)
	movb	%cl, 24(%rax)
	cmpl	$8, %r14d
	je	.L1134
	movzbl	18(%rdx), %ecx
	movb	%cl, 29(%rax)
	movb	%cl, 28(%rax)
	movb	%cl, 27(%rax)
	cmpl	$9, %r14d
	je	.L1134
	movzbl	20(%rdx), %ecx
	movb	%cl, 32(%rax)
	movb	%cl, 31(%rax)
	movb	%cl, 30(%rax)
	cmpl	$10, %r14d
	je	.L1134
	movzbl	22(%rdx), %ecx
	movb	%cl, 35(%rax)
	movb	%cl, 34(%rax)
	movb	%cl, 33(%rax)
	cmpl	$11, %r14d
	je	.L1134
	movzbl	24(%rdx), %ecx
	movb	%cl, 38(%rax)
	movb	%cl, 37(%rax)
	movb	%cl, 36(%rax)
	cmpl	$12, %r14d
	je	.L1134
	movzbl	26(%rdx), %ecx
	movb	%cl, 41(%rax)
	movb	%cl, 40(%rax)
	movb	%cl, 39(%rax)
	cmpl	$13, %r14d
	je	.L1134
	movzbl	28(%rdx), %ecx
	movb	%cl, 44(%rax)
	movb	%cl, 43(%rax)
	movb	%cl, 42(%rax)
	cmpl	$14, %r14d
	je	.L1134
	movzbl	30(%rdx), %edx
	movb	%dl, 47(%rax)
	movb	%dl, 46(%rax)
	movb	%dl, 45(%rax)
	jmp	.L1134
	.p2align 4,,10
	.p2align 3
.L1130:
	cmpl	$-1, 568(%rsp)
	je	.L1134
	cmpb	$0, 554(%rsp)
	jne	.L1196
	vmovdqa	.LC2(%rip), %ymm0
	movq	24(%rsp), %rdx
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L1149:
	vpand	(%rcx,%rax,2), %ymm0, %ymm1
	vpand	32(%rcx,%rax,2), %ymm0, %ymm2
	vpackuswb	%ymm2, %ymm1, %ymm1
	vpermq	$216, %ymm1, %ymm1
	vmovdqu	%ymm1, (%rsi,%rax)
	addq	$32, %rax
	cmpq	%rax, %rdx
	jne	.L1149
	movq	40(%rsp), %rax
	movl	136(%rsp), %r14d
	leaq	(%rcx,%rax), %rdx
	movq	80(%rsp), %rax
	movl	124(%rsp), %r8d
	addq	%rsi, %rax
.L1148:
	movl	140(%rsp), %ecx
	subl	%r14d, %ecx
	cmpl	$15, %ecx
	jbe	.L1150
	vmovdqa	.LC5(%rip), %xmm0
	leaq	(%rdi,%r14,2), %rdi
	addq	%r13, %rdi
	vpand	(%rdi), %xmm0, %xmm1
	vpand	16(%rdi), %xmm0, %xmm0
	andl	$-16, %ecx
	vpackuswb	%xmm0, %xmm1, %xmm0
	vmovdqu	%xmm0, (%rsi,%r14)
	subl	%ecx, %r8d
	leaq	(%rdx,%rcx,2), %rdx
	addq	%rcx, %rax
.L1150:
	movzbl	(%rdx), %ecx
	movb	%cl, (%rax)
	testl	%r8d, %r8d
	je	.L1134
	movzbl	2(%rdx), %ecx
	movb	%cl, 1(%rax)
	cmpl	$1, %r8d
	je	.L1134
	movzbl	4(%rdx), %ecx
	movb	%cl, 2(%rax)
	cmpl	$2, %r8d
	je	.L1134
	movzbl	6(%rdx), %ecx
	movb	%cl, 3(%rax)
	cmpl	$3, %r8d
	je	.L1134
	movzbl	8(%rdx), %ecx
	movb	%cl, 4(%rax)
	cmpl	$4, %r8d
	je	.L1134
	movzbl	10(%rdx), %ecx
	movb	%cl, 5(%rax)
	cmpl	$5, %r8d
	je	.L1134
	movzbl	12(%rdx), %ecx
	movb	%cl, 6(%rax)
	cmpl	$6, %r8d
	je	.L1134
	movzbl	14(%rdx), %ecx
	movb	%cl, 7(%rax)
	cmpl	$7, %r8d
	je	.L1134
	movzbl	16(%rdx), %ecx
	movb	%cl, 8(%rax)
	cmpl	$8, %r8d
	je	.L1134
	movzbl	18(%rdx), %ecx
	movb	%cl, 9(%rax)
	cmpl	$9, %r8d
	je	.L1134
	movzbl	20(%rdx), %ecx
	movb	%cl, 10(%rax)
	cmpl	$10, %r8d
	je	.L1134
	movzbl	22(%rdx), %ecx
	movb	%cl, 11(%rax)
	cmpl	$11, %r8d
	je	.L1134
	movzbl	24(%rdx), %ecx
	movb	%cl, 12(%rax)
	cmpl	$12, %r8d
	je	.L1134
	movzbl	26(%rdx), %ecx
	movb	%cl, 13(%rax)
	cmpl	$13, %r8d
	je	.L1134
	movzbl	28(%rdx), %ecx
	movb	%cl, 14(%rax)
	cmpl	$14, %r8d
	je	.L1134
	movzbl	30(%rdx), %edx
	movb	%dl, 15(%rax)
	jmp	.L1134
	.p2align 4,,10
	.p2align 3
.L1131:
	movl	568(%rsp), %edi
	cmpl	$-1, %edi
	je	.L1134
	leal	(%rdi,%rcx), %esi
	.p2align 4,,10
	.p2align 3
.L1147:
	movzbl	(%rcx), %edx
	incq	%rcx
	movb	%dl, 2(%rax)
	movb	%dl, 1(%rax)
	movb	%dl, (%rax)
	movb	$-1, 3(%rax)
	addq	$4, %rax
	cmpl	%ecx, %esi
	jns	.L1147
	jmp	.L1134
	.p2align 4,,10
	.p2align 3
.L1132:
	cmpl	$-1, 568(%rsp)
	je	.L1134
	cmpb	$0, 555(%rsp)
	jne	.L1195
	movq	88(%rsp), %rdi
	vmovdqa	.LC128(%rip), %ymm13
	vmovdqa	.LC129(%rip), %ymm12
	vmovdqa	.LC130(%rip), %ymm11
	vmovdqa	.LC131(%rip), %ymm10
	vmovdqa	.LC132(%rip), %ymm9
	vmovdqa	.LC133(%rip), %ymm8
	vmovdqa	.LC134(%rip), %ymm7
	vmovdqa	.LC135(%rip), %ymm6
	vmovdqa	.LC136(%rip), %ymm5
	vmovdqa	.LC137(%rip), %ymm4
	vmovdqa	.LC138(%rip), %ymm3
	vmovdqa	.LC139(%rip), %ymm2
	addq	%rcx, %rdi
	.p2align 4,,10
	.p2align 3
.L1142:
	vmovdqu	(%rdx), %ymm0
	addq	$32, %rdx
	vperm2i128	$0, %ymm0, %ymm0, %ymm1
	vpshufb	%ymm12, %ymm0, %ymm15
	vpshufb	%ymm10, %ymm0, %ymm14
	vpshufb	%ymm13, %ymm1, %ymm1
	vpermq	$78, %ymm15, %ymm15
	vpor	%ymm15, %ymm14, %ymm14
	vpshufb	%ymm11, %ymm1, %ymm1
	vpor	%ymm14, %ymm1, %ymm1
	vmovdqu	%ymm1, (%rax)
	vpermq	$132, %ymm0, %ymm1
	vpshufb	%ymm9, %ymm1, %ymm1
	vpshufb	%ymm8, %ymm0, %ymm14
	vpshufb	%ymm7, %ymm1, %ymm1
	vpor	%ymm1, %ymm14, %ymm1
	vpshufb	%ymm6, %ymm0, %ymm14
	vmovdqu	%ymm1, 32(%rax)
	vpermq	$78, %ymm14, %ymm14
	vpshufb	%ymm5, %ymm0, %ymm1
	vpor	%ymm14, %ymm1, %ymm1
	vpshufb	%ymm4, %ymm0, %ymm14
	vpermq	$78, %ymm14, %ymm14
	vpshufb	%ymm2, %ymm0, %ymm0
	vpshufb	%ymm3, %ymm1, %ymm1
	vpor	%ymm14, %ymm0, %ymm0
	vpor	%ymm0, %ymm1, %ymm0
	vmovdqu	%ymm0, 64(%rax)
	addq	$96, %rax
	cmpq	%rdx, %rdi
	jne	.L1142
	movq	104(%rsp), %rax
	movl	548(%rsp), %edi
	leaq	(%rcx,%rax), %rdx
	movq	112(%rsp), %rax
	addq	%rsi, %rax
	movl	556(%rsp), %esi
	cmpl	%esi, %edi
	je	.L1134
	movl	%edi, %r14d
	movl	544(%rsp), %edi
	movl	%esi, %r15d
.L1141:
	subl	%r14d, %r15d
	leal	-1(%r15), %esi
	cmpl	$14, %esi
	jbe	.L1145
	vmovdqu	(%rcx,%r14), %xmm0
	vmovdqa	.LC142(%rip), %xmm3
	leaq	(%r14,%r14,2), %rsi
	vpshufb	.LC141(%rip), %xmm0, %xmm2
	vpshufb	.LC140(%rip), %xmm0, %xmm1
	addq	%r8, %rsi
	addq	%r12, %rsi
	vpblendvb	%xmm3, %xmm2, %xmm1, %xmm1
	vmovdqa	.LC145(%rip), %xmm3
	vmovdqu	%xmm1, (%rsi)
	vpshufb	.LC144(%rip), %xmm0, %xmm2
	vpshufb	.LC143(%rip), %xmm0, %xmm1
	vpblendvb	%xmm3, %xmm2, %xmm1, %xmm1
	vmovdqu	%xmm1, 16(%rsi)
	vpshufb	.LC146(%rip), %xmm0, %xmm1
	vpshufb	.LC148(%rip), %xmm1, %xmm1
	vpshufb	.LC147(%rip), %xmm0, %xmm0
	movl	%r15d, %ecx
	andl	$-16, %ecx
	vpor	%xmm1, %xmm0, %xmm0
	vmovdqu	%xmm0, 32(%rsi)
	movl	%ecx, %esi
	addq	%rsi, %rdx
	leaq	(%rsi,%rsi,2), %rsi
	subl	%ecx, %edi
	addq	%rsi, %rax
	cmpl	%ecx, %r15d
	je	.L1134
.L1145:
	movzbl	(%rdx), %ecx
	movb	%cl, 2(%rax)
	movb	%cl, 1(%rax)
	movb	%cl, (%rax)
	testl	%edi, %edi
	je	.L1134
	movzbl	1(%rdx), %ecx
	movb	%cl, 5(%rax)
	movb	%cl, 4(%rax)
	movb	%cl, 3(%rax)
	cmpl	$1, %edi
	je	.L1134
	movzbl	2(%rdx), %ecx
	movb	%cl, 8(%rax)
	movb	%cl, 7(%rax)
	movb	%cl, 6(%rax)
	cmpl	$2, %edi
	je	.L1134
	movzbl	3(%rdx), %ecx
	movb	%cl, 11(%rax)
	movb	%cl, 10(%rax)
	movb	%cl, 9(%rax)
	cmpl	$3, %edi
	je	.L1134
	movzbl	4(%rdx), %ecx
	movb	%cl, 14(%rax)
	movb	%cl, 13(%rax)
	movb	%cl, 12(%rax)
	cmpl	$4, %edi
	je	.L1134
	movzbl	5(%rdx), %ecx
	movb	%cl, 17(%rax)
	movb	%cl, 16(%rax)
	movb	%cl, 15(%rax)
	cmpl	$5, %edi
	je	.L1134
	movzbl	6(%rdx), %ecx
	movb	%cl, 20(%rax)
	movb	%cl, 19(%rax)
	movb	%cl, 18(%rax)
	cmpl	$6, %edi
	je	.L1134
	movzbl	7(%rdx), %ecx
	movb	%cl, 23(%rax)
	movb	%cl, 22(%rax)
	movb	%cl, 21(%rax)
	cmpl	$7, %edi
	je	.L1134
	movzbl	8(%rdx), %ecx
	movb	%cl, 26(%rax)
	movb	%cl, 25(%rax)
	movb	%cl, 24(%rax)
	cmpl	$8, %edi
	je	.L1134
	movzbl	9(%rdx), %ecx
	movb	%cl, 29(%rax)
	movb	%cl, 28(%rax)
	movb	%cl, 27(%rax)
	cmpl	$9, %edi
	je	.L1134
	movzbl	10(%rdx), %ecx
	movb	%cl, 32(%rax)
	movb	%cl, 31(%rax)
	movb	%cl, 30(%rax)
	cmpl	$10, %edi
	je	.L1134
	movzbl	11(%rdx), %ecx
	movb	%cl, 35(%rax)
	movb	%cl, 34(%rax)
	movb	%cl, 33(%rax)
	cmpl	$11, %edi
	je	.L1134
	movzbl	12(%rdx), %ecx
	movb	%cl, 38(%rax)
	movb	%cl, 37(%rax)
	movb	%cl, 36(%rax)
	cmpl	$12, %edi
	je	.L1134
	movzbl	13(%rdx), %ecx
	movb	%cl, 41(%rax)
	movb	%cl, 40(%rax)
	movb	%cl, 39(%rax)
	cmpl	$13, %edi
	je	.L1134
	movzbl	14(%rdx), %edx
	movb	%dl, 44(%rax)
	movb	%dl, 43(%rax)
	movb	%dl, 42(%rax)
	jmp	.L1134
	.p2align 4,,10
	.p2align 3
.L1133:
	cmpl	$-1, 568(%rsp)
	je	.L1134
	cmpb	$0, 555(%rsp)
	jne	.L1194
	movq	88(%rsp), %rdx
	xorl	%eax, %eax
	vpcmpeqd	%ymm2, %ymm2, %ymm2
	.p2align 4,,10
	.p2align 3
.L1136:
	vmovdqu	(%rcx,%rax), %ymm0
	vpunpcklbw	%ymm2, %ymm0, %ymm1
	vpunpckhbw	%ymm2, %ymm0, %ymm0
	vperm2i128	$32, %ymm0, %ymm1, %ymm3
	vperm2i128	$49, %ymm0, %ymm1, %ymm1
	vmovdqu	%ymm3, (%rsi,%rax,2)
	vmovdqu	%ymm1, 32(%rsi,%rax,2)
	addq	$32, %rax
	cmpq	%rax, %rdx
	jne	.L1136
	movq	104(%rsp), %rax
	movl	548(%rsp), %edi
	leaq	(%rcx,%rax), %rdx
	movq	128(%rsp), %rax
	addq	%rsi, %rax
	movl	556(%rsp), %esi
	cmpl	%esi, %edi
	je	.L1134
	movl	544(%rsp), %esi
.L1135:
	movl	556(%rsp), %r14d
	subl	%edi, %r14d
	leal	-1(%r14), %r15d
	cmpl	$14, %r15d
	jbe	.L1139
	vmovdqu	(%rcx,%rdi), %xmm0
	movl	%r14d, %ecx
	leaq	(%r8,%rdi,2), %r8
	vpcmpeqd	%xmm1, %xmm1, %xmm1
	andl	$-16, %ecx
	addq	%r12, %r8
	vpunpcklbw	%xmm1, %xmm0, %xmm2
	movl	%ecx, %edi
	vpunpckhbw	%xmm1, %xmm0, %xmm0
	vmovdqu	%xmm2, (%r8)
	vmovdqu	%xmm0, 16(%r8)
	subl	%ecx, %esi
	addq	%rdi, %rdx
	leaq	(%rax,%rdi,2), %rax
	cmpl	%r14d, %ecx
	je	.L1134
.L1139:
	movzbl	(%rdx), %ecx
	movb	$-1, 1(%rax)
	movb	%cl, (%rax)
	testl	%esi, %esi
	je	.L1134
	movzbl	1(%rdx), %ecx
	movb	$-1, 3(%rax)
	movb	%cl, 2(%rax)
	cmpl	$1, %esi
	je	.L1134
	movzbl	2(%rdx), %ecx
	movb	$-1, 5(%rax)
	movb	%cl, 4(%rax)
	cmpl	$2, %esi
	je	.L1134
	movzbl	3(%rdx), %ecx
	movb	$-1, 7(%rax)
	movb	%cl, 6(%rax)
	cmpl	$3, %esi
	je	.L1134
	movzbl	4(%rdx), %ecx
	movb	$-1, 9(%rax)
	movb	%cl, 8(%rax)
	cmpl	$4, %esi
	je	.L1134
	movzbl	5(%rdx), %ecx
	movb	$-1, 11(%rax)
	movb	%cl, 10(%rax)
	cmpl	$5, %esi
	je	.L1134
	movzbl	6(%rdx), %ecx
	movb	$-1, 13(%rax)
	movb	%cl, 12(%rax)
	cmpl	$6, %esi
	je	.L1134
	movzbl	7(%rdx), %ecx
	movb	$-1, 15(%rax)
	movb	%cl, 14(%rax)
	cmpl	$7, %esi
	je	.L1134
	movzbl	8(%rdx), %ecx
	movb	$-1, 17(%rax)
	movb	%cl, 16(%rax)
	cmpl	$8, %esi
	je	.L1134
	movzbl	9(%rdx), %ecx
	movb	$-1, 19(%rax)
	movb	%cl, 18(%rax)
	cmpl	$9, %esi
	je	.L1134
	movzbl	10(%rdx), %ecx
	movb	$-1, 21(%rax)
	movb	%cl, 20(%rax)
	cmpl	$10, %esi
	je	.L1134
	movzbl	11(%rdx), %ecx
	movb	$-1, 23(%rax)
	movb	%cl, 22(%rax)
	cmpl	$11, %esi
	je	.L1134
	movzbl	12(%rdx), %ecx
	movb	$-1, 25(%rax)
	movb	%cl, 24(%rax)
	cmpl	$12, %esi
	je	.L1134
	movzbl	13(%rdx), %ecx
	movb	$-1, 27(%rax)
	movb	%cl, 26(%rax)
	cmpl	$13, %esi
	je	.L1134
	movzbl	14(%rdx), %edx
	movb	$-1, 29(%rax)
	movb	%dl, 28(%rax)
	jmp	.L1134
.L1194:
	movl	568(%rsp), %esi
	xorl	%edi, %edi
	jmp	.L1135
.L1203:
	movl	568(%rsp), %esi
	movl	%esi, 512(%rsp)
	xorl	%esi, %esi
	jmp	.L1181
.L1204:
	movl	568(%rsp), %esi
	xorl	%r14d, %r14d
	jmp	.L1187
.L1195:
	movl	568(%rsp), %edi
	movl	556(%rsp), %r15d
	xorl	%r14d, %r14d
	jmp	.L1141
.L1196:
	movl	568(%rsp), %r8d
	xorl	%r14d, %r14d
	jmp	.L1148
.L1197:
	movl	568(%rsp), %r14d
	xorl	%r15d, %r15d
	jmp	.L1151
.L1198:
	movl	568(%rsp), %ecx
	xorl	%esi, %esi
	jmp	.L1154
.L1200:
	movl	568(%rsp), %r8d
	movl	556(%rsp), %r15d
	xorl	%r14d, %r14d
	jmp	.L1166
.L1201:
	movl	568(%rsp), %esi
	xorl	%ecx, %ecx
	jmp	.L1172
.L1199:
	movl	568(%rsp), %esi
	xorl	%r14d, %r14d
	jmp	.L1160
.L1202:
	movl	568(%rsp), %r8d
	xorl	%r14d, %r14d
	jmp	.L1178
	.p2align 4,,10
	.p2align 3
.L1120:
	leaq	__PRETTY_FUNCTION__.43(%rip), %rcx
	movl	$1770, %edx
	leaq	.LC21(%rip), %rsi
	leaq	.LC13(%rip), %rdi
	vzeroupper
	call	__assert_fail@PLT
.L1739:
	leaq	__PRETTY_FUNCTION__.43(%rip), %rcx
	movl	$1741, %edx
	leaq	.LC21(%rip), %rsi
	leaq	.LC22(%rip), %rdi
	call	__assert_fail@PLT
	.cfi_endproc
.LFE635:
	.size	stbi__convert_format, .-stbi__convert_format
	.p2align 4
	.type	stbi__gif_parse_colortable, @function
stbi__gif_parse_colortable:
.LFB747:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	leaq	57(%rdi), %rax
	leaq	56(%rdi), %r15
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rsi, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movl	%ecx, %r13d
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movslq	%edx, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	xorl	%ebp, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	movq	%rax, (%rsp)
	jmp	.L1753
	.p2align 4,,10
	.p2align 3
.L1741:
	movl	48(%rbx), %esi
	xorl	%ecx, %ecx
	testl	%esi, %esi
	jne	.L1759
.L1742:
	movb	%cl, 2(%r14,%rbp,4)
	movq	192(%rbx), %rax
	cmpq	200(%rbx), %rax
	jb	.L1760
	movl	48(%rbx), %edx
	xorl	%ecx, %ecx
	testl	%edx, %edx
	jne	.L1761
.L1746:
	movb	%cl, 1(%r14,%rbp,4)
	movq	192(%rbx), %rax
	cmpq	200(%rbx), %rax
	jb	.L1762
	movl	48(%rbx), %eax
	xorl	%ecx, %ecx
	testl	%eax, %eax
	jne	.L1763
.L1750:
	cmpl	%ebp, %r13d
	setne	%al
	negl	%eax
	movb	%cl, (%r14,%rbp,4)
	movb	%al, 3(%r14,%rbp,4)
	incq	%rbp
	cmpq	%rbp, %r12
	je	.L1764
.L1753:
	movq	192(%rbx), %rax
	cmpq	200(%rbx), %rax
	jnb	.L1741
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rbx)
	movzbl	(%rax), %ecx
	jmp	.L1742
	.p2align 4,,10
	.p2align 3
.L1762:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rbx)
	movzbl	(%rax), %ecx
	jmp	.L1750
	.p2align 4,,10
	.p2align 3
.L1760:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rbx)
	movzbl	(%rax), %ecx
	jmp	.L1746
	.p2align 4,,10
	.p2align 3
.L1761:
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%r15, %rsi
	movb	%cl, 15(%rsp)
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	testl	%eax, %eax
	jne	.L1747
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	movq	(%rsp), %rax
	movzbl	15(%rsp), %ecx
.L1748:
	vmovq	(%rsp), %xmm2
	vpinsrq	$1, %rax, %xmm2, %xmm0
	vmovdqu	%xmm0, 192(%rbx)
	jmp	.L1746
	.p2align 4,,10
	.p2align 3
.L1759:
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%r15, %rsi
	movb	%cl, 15(%rsp)
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	testl	%eax, %eax
	jne	.L1743
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	movq	(%rsp), %rax
	movzbl	15(%rsp), %ecx
.L1744:
	vmovq	(%rsp), %xmm1
	vpinsrq	$1, %rax, %xmm1, %xmm0
	vmovdqu	%xmm0, 192(%rbx)
	jmp	.L1742
	.p2align 4,,10
	.p2align 3
.L1763:
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%r15, %rsi
	movb	%cl, 15(%rsp)
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	testl	%eax, %eax
	jne	.L1751
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	movq	(%rsp), %rax
	movzbl	15(%rsp), %ecx
.L1752:
	vmovq	(%rsp), %xmm3
	vpinsrq	$1, %rax, %xmm3, %xmm0
	vmovdqu	%xmm0, 192(%rbx)
	jmp	.L1750
	.p2align 4,,10
	.p2align 3
.L1764:
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
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
	ret
	.p2align 4,,10
	.p2align 3
.L1747:
	.cfi_restore_state
	cltq
	movzbl	56(%rbx), %ecx
	addq	%r15, %rax
	jmp	.L1748
	.p2align 4,,10
	.p2align 3
.L1743:
	cltq
	movzbl	56(%rbx), %ecx
	addq	%r15, %rax
	jmp	.L1744
	.p2align 4,,10
	.p2align 3
.L1751:
	cltq
	movzbl	56(%rbx), %ecx
	addq	%r15, %rax
	jmp	.L1752
	.cfi_endproc
.LFE747:
	.size	stbi__gif_parse_colortable, .-stbi__gif_parse_colortable
	.p2align 4
	.type	stbi__pnm_skip_whitespace, @function
stbi__pnm_skip_whitespace:
.LFB770:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	leaq	57(%rdi), %r12
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movq	%rsi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movq	%rdi, %rbx
	.p2align 4,,10
	.p2align 3
.L1766:
	leaq	56(%rbx), %r13
.L1767:
	cmpq	$0, 16(%rbx)
	je	.L1816
	movq	40(%rbx), %rdi
	call	*32(%rbx)
	testl	%eax, %eax
	je	.L1776
	movl	48(%rbx), %esi
	testl	%esi, %esi
	je	.L1781
	movq	192(%rbx), %rcx
	movq	%rcx, %rdx
	cmpq	200(%rbx), %rcx
	jnb	.L1817
.L1774:
	movzbl	0(%rbp), %eax
	cmpb	$9, %al
	je	.L1799
	cmpb	$32, %al
	je	.L1799
	subl	$10, %eax
	cmpb	$3, %al
	jbe	.L1818
.L1781:
	cmpq	$0, 16(%rbx)
	je	.L1779
.L1778:
	movq	40(%rbx), %rdi
	call	*32(%rbx)
	testl	%eax, %eax
	je	.L1783
	movl	48(%rbx), %ecx
	testl	%ecx, %ecx
	je	.L1813
.L1779:
	movq	200(%rbx), %rax
	cmpq	%rax, 192(%rbx)
	jnb	.L1813
.L1783:
	cmpb	$35, 0(%rbp)
	jne	.L1813
	cmpq	$0, 16(%rbx)
	leaq	56(%rbx), %r14
	je	.L1794
	movq	40(%rbx), %rdi
	call	*32(%rbx)
	testl	%eax, %eax
	je	.L1793
.L1819:
	movl	48(%rbx), %eax
	testl	%eax, %eax
	je	.L1766
.L1794:
	movq	192(%rbx), %rax
	cmpq	200(%rbx), %rax
	jnb	.L1766
	movzbl	0(%rbp), %edx
	cmpb	$10, %dl
	je	.L1766
	cmpb	$13, %dl
	je	.L1766
.L1797:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rbx)
	movzbl	(%rax), %r13d
.L1787:
	movb	%r13b, 0(%rbp)
	cmpq	$0, 16(%rbx)
	je	.L1794
	movq	40(%rbx), %rdi
	call	*32(%rbx)
	testl	%eax, %eax
	jne	.L1819
.L1793:
	movzbl	0(%rbp), %eax
	cmpb	$10, %al
	je	.L1766
	cmpb	$13, %al
	je	.L1766
	movq	192(%rbx), %rax
	cmpq	200(%rbx), %rax
	jb	.L1797
	movl	48(%rbx), %edx
	xorl	%r13d, %r13d
	testl	%edx, %edx
	je	.L1787
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%r14, %rsi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	testl	%eax, %eax
	jne	.L1788
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	movq	%r12, %rax
.L1789:
	vmovq	%r12, %xmm1
	vpinsrq	$1, %rax, %xmm1, %xmm0
	vmovdqu	%xmm0, 192(%rbx)
	jmp	.L1787
	.p2align 4,,10
	.p2align 3
.L1816:
	movq	192(%rbx), %rcx
	movq	%rcx, %rdx
	cmpq	%rcx, 200(%rbx)
	ja	.L1774
.L1813:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L1776:
	.cfi_restore_state
	movzbl	0(%rbp), %eax
	cmpb	$32, %al
	je	.L1780
	cmpb	$9, %al
	jne	.L1820
.L1780:
	movq	192(%rbx), %rdx
	cmpq	200(%rbx), %rdx
	jb	.L1799
	movl	48(%rbx), %edi
	xorl	%r14d, %r14d
	testl	%edi, %edi
	jne	.L1821
.L1769:
	movb	%r14b, 0(%rbp)
	jmp	.L1767
.L1818:
	movq	%rcx, %rdx
	.p2align 4,,10
	.p2align 3
.L1799:
	leaq	1(%rdx), %rax
	movq	%rax, 192(%rbx)
	movzbl	(%rdx), %r14d
	jmp	.L1769
	.p2align 4,,10
	.p2align 3
.L1821:
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%r13, %rsi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	testl	%eax, %eax
	jne	.L1770
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	movq	%r12, %rax
.L1771:
	vmovq	%r12, %xmm2
	vpinsrq	$1, %rax, %xmm2, %xmm0
	vmovdqu	%xmm0, 192(%rbx)
	jmp	.L1769
	.p2align 4,,10
	.p2align 3
.L1788:
	cltq
	movzbl	56(%rbx), %r13d
	addq	%r14, %rax
	jmp	.L1789
	.p2align 4,,10
	.p2align 3
.L1820:
	subl	$10, %eax
	cmpb	$3, %al
	jbe	.L1780
	jmp	.L1781
	.p2align 4,,10
	.p2align 3
.L1770:
	cltq
	movzbl	56(%rbx), %r14d
	addq	%r13, %rax
	jmp	.L1771
	.p2align 4,,10
	.p2align 3
.L1817:
	cmpq	$0, 16(%rbx)
	jne	.L1778
	jmp	.L1813
	.cfi_endproc
.LFE770:
	.size	stbi__pnm_skip_whitespace, .-stbi__pnm_skip_whitespace
	.section	.rodata.str1.8
	.align 8
.LC202:
	.string	"out_n == s->img_n || out_n == s->img_n+1"
	.section	.rodata.str1.1
.LC203:
	.string	"too large"
.LC204:
	.string	"not enough pixels"
.LC205:
	.string	"invalid filter"
.LC206:
	.string	"invalid width"
.LC207:
	.string	"img_n+1 == out_n"
.LC218:
	.string	"img_n == 3"
	.text
	.p2align 4
	.type	stbi__create_png_image_raw, @function
stbi__create_png_image_raw:
.LFB705:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movl	%ecx, %eax
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	movq	%rsi, %r12
	pushq	%rbx
	.cfi_offset 3, -56
	movl	%edx, %ebx
	andq	$-32, %rsp
	subq	$576, %rsp
	cmpl	$16, 16(%rbp)
	movq	%rdi, 208(%rsp)
	movl	%ecx, 276(%rsp)
	movl	%r8d, 272(%rsp)
	movl	%r9d, 168(%rsp)
	je	.L2378
	movl	%ecx, %r14d
	movl	$1, %r13d
	movl	$1, %r15d
	movq	%rdi, %rax
	movl	%ecx, %edx
.L1823:
	movq	(%rax), %rax
	movl	8(%rax), %eax
	movl	%eax, 156(%rsp)
	cmpl	%eax, %edx
	je	.L1824
	incl	%eax
	cmpl	%edx, %eax
	jne	.L2379
.L1824:
	movl	272(%rsp), %edi
	movl	168(%rsp), %edx
	movl	%edi, %eax
	orl	%edx, %eax
	js	.L1825
	movl	%edi, 148(%rsp)
	testl	%edx, %edx
	je	.L1826
	movl	$2147483647, %eax
	movl	%edx, %esi
	cltd
	idivl	%esi
	cmpl	%eax, %edi
	jle	.L1826
.L1825:
	movq	208(%rsp), %rax
	movq	$0, 24(%rax)
.L1828:
	leaq	.LC23(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L1822
	.p2align 4,,10
	.p2align 3
.L1826:
	testl	%r14d, %r14d
	js	.L1825
	movl	168(%rsp), %edi
	imull	272(%rsp), %edi
	testl	%r14d, %r14d
	je	.L1827
	movl	$2147483647, %eax
	cltd
	idivl	%r14d
	cmpl	%eax, %edi
	jg	.L1825
.L1827:
	imull	%r14d, %edi
	movslq	%edi, %rdi
	call	malloc@PLT
	movq	%rax, %rdi
	movq	208(%rsp), %rax
	movq	%rdi, 24(%rax)
	testq	%rdi, %rdi
	je	.L1828
	movl	156(%rsp), %esi
	testl	%esi, %esi
	js	.L1831
	movl	272(%rsp), %edx
	testl	%edx, %edx
	je	.L1832
	movl	$2147483647, %eax
	movl	%edx, %ecx
	cltd
	idivl	%ecx
	cmpl	%eax, %esi
	jle	.L1832
.L1831:
	leaq	.LC203(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
.L1822:
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
.L1832:
	.cfi_restore_state
	movl	16(%rbp), %r9d
	testl	%r9d, %r9d
	js	.L1831
	movl	156(%rsp), %esi
	movl	16(%rbp), %r8d
	imull	272(%rsp), %esi
	movl	%esi, 72(%rsp)
	testl	%r8d, %r8d
	je	.L1833
	movl	$2147483647, %eax
	cltd
	idivl	16(%rbp)
	cmpl	%eax, %esi
	jg	.L1831
	imull	16(%rbp), %esi
	cmpl	$2147483640, %esi
	jg	.L1831
.L1833:
	movl	156(%rsp), %eax
	movl	168(%rsp), %edx
	imull	16(%rbp), %eax
	imull	272(%rsp), %eax
	addl	$7, %eax
	shrl	$3, %eax
	movl	%eax, 152(%rsp)
	incl	%eax
	imull	%edx, %eax
	cmpl	%ebx, %eax
	ja	.L1834
	testl	%edx, %edx
	je	.L1836
	movl	276(%rsp), %eax
	movl	272(%rsp), %esi
	movl	%eax, %ebx
	imull	%esi, %ebx
	movl	$0, 248(%rsp)
	movl	$0, 284(%rsp)
	imull	%ebx, %r13d
	movl	%ebx, 112(%rsp)
	movl	156(%rsp), %ebx
	movl	%r13d, 280(%rsp)
	imull	%ebx, %r15d
	cmpl	$7, 16(%rbp)
	setle	%dl
	cmpl	%ebx, %eax
	sete	%al
	orl	%eax, %edx
	leal	1(%rbx), %eax
	movl	%eax, 136(%rsp)
	leal	-1(%rsi), %eax
	movb	%dl, 144(%rsp)
	movl	%eax, 140(%rsp)
	vmovdqa	.LC19(%rip), %ymm14
	movq	%rdi, %r9
	movq	%r12, %rbx
	.p2align 4,,10
	.p2align 3
.L2027:
	movl	248(%rsp), %eax
	movzbl	(%rbx), %edx
	movq	%rax, 160(%rsp)
	addq	%rax, %r9
	leaq	1(%rbx), %r10
	cmpl	$4, %edx
	jg	.L2380
	cmpl	$7, 16(%rbp)
	jg	.L1838
	movl	152(%rsp), %edi
	cmpl	%edi, 272(%rsp)
	jb	.L2381
	movl	112(%rsp), %eax
	movl	280(%rsp), %ecx
	subl	%edi, %eax
	addq	%rax, %r9
	movl	284(%rsp), %esi
	movq	%r9, %rax
	movl	%edi, 148(%rsp)
	subq	%rcx, %rax
	movl	$1, %r15d
	testl	%esi, %esi
	jne	.L1840
	leaq	first_row_filter(%rip), %rdi
	movzbl	(%rdi,%rdx), %edx
.L1840:
	movq	%r10, %r8
	movq	%r9, %rdi
	xorl	%esi, %esi
	movl	%edx, %r11d
	.p2align 4,,10
	.p2align 3
.L1852:
	cmpl	$6, %edx
	ja	.L1843
	leaq	.L1845(%rip), %r12
	movslq	(%r12,%r11,4), %rcx
	addq	%r12, %rcx
	notrack jmp	*%rcx
	.section	.rodata
	.align 4
	.align 4
.L1845:
	.long	.L1844-.L1845
	.long	.L1844-.L1845
	.long	.L1847-.L1845
	.long	.L1848-.L1845
	.long	.L1847-.L1845
	.long	.L1844-.L1845
	.long	.L1844-.L1845
	.text
	.p2align 4,,10
	.p2align 3
.L1844:
	movzbl	(%r8), %ecx
	movb	%cl, (%rdi)
.L1843:
	incq	%rsi
	incq	%r8
	incq	%rdi
	cmpl	%esi, %r15d
	jg	.L1852
	cmpl	$8, 16(%rbp)
	je	.L2382
.L1853:
	cmpl	$16, 16(%rbp)
	je	.L2383
	addq	$2, %rbx
	leaq	1(%r9), %r13
	incq	%rax
.L1855:
	cmpb	$0, 144(%rsp)
	je	.L1858
.L2385:
	movl	148(%rsp), %edi
	leal	-1(%rdi), %ecx
	imull	%r15d, %ecx
	movslq	%ecx, %r11
	movq	%r11, %r12
	cmpl	$6, %edx
	ja	.L1859
	leaq	.L1861(%rip), %rdi
	movl	%edx, %edx
	movslq	(%rdi,%rdx,4), %rdx
	addq	%rdi, %rdx
	notrack jmp	*%rdx
	.section	.rodata
	.align 4
	.align 4
.L1861:
	.long	.L1867-.L1861
	.long	.L1866-.L1861
	.long	.L1865-.L1861
	.long	.L1864-.L1861
	.long	.L1863-.L1861
	.long	.L1862-.L1861
	.long	.L1860-.L1861
	.text
	.p2align 4,,10
	.p2align 3
.L1847:
	movzbl	(%rax,%rsi), %ecx
	addb	(%r8), %cl
	movb	%cl, (%rdi)
	jmp	.L1843
	.p2align 4,,10
	.p2align 3
.L1848:
	movzbl	(%rax,%rsi), %ecx
	shrb	%cl
	addb	(%r8), %cl
	movb	%cl, (%rdi)
	jmp	.L1843
.L1862:
	testl	%r11d, %r11d
	jle	.L1859
	movl	%r15d, %eax
	negl	%eax
	cltq
	movq	%rax, %rsi
	notq	%rsi
	cmpq	$30, %rsi
	leal	-1(%r11), %ecx
	seta	%dil
	cmpl	$14, %ecx
	seta	%sil
	movl	%r11d, %edx
	testb	%sil, %dil
	je	.L1914
	leaq	1(%rbx), %rdi
	movq	%r13, %rsi
	subq	%rdi, %rsi
	cmpq	$30, %rsi
	jbe	.L1914
	cmpl	$30, %ecx
	jbe	.L2086
	movl	%r11d, %ecx
	shrl	$5, %ecx
	addq	%r13, %rax
	salq	$5, %rcx
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L1916:
	vmovdqu	(%rax,%rdx), %ymm5
	vpsrlw	$1, %ymm5, %ymm0
	vpand	.LC16(%rip), %ymm0, %ymm0
	vpaddb	(%rbx,%rdx), %ymm0, %ymm0
	vmovdqu	%ymm0, 0(%r13,%rdx)
	addq	$32, %rdx
	cmpq	%rdx, %rcx
	jne	.L1916
	movl	%r12d, %ecx
	andl	$-32, %ecx
	movl	%ecx, %edi
	cmpl	%ecx, %r12d
	je	.L1859
	movl	%r12d, %edx
	subl	%ecx, %edx
	leal	-1(%rdx), %esi
	cmpl	$14, %esi
	jbe	.L1919
.L1915:
	vmovdqu	(%rax,%rcx), %xmm0
	movl	%edx, %eax
	vpsrlw	$1, %xmm0, %xmm0
	vpand	.LC17(%rip), %xmm0, %xmm0
	andl	$-16, %eax
	vpaddb	(%rbx,%rcx), %xmm0, %xmm0
	addl	%eax, %edi
	vmovdqu	%xmm0, 0(%r13,%rcx)
	cmpl	%edx, %eax
	je	.L1859
.L1919:
	movl	%edi, %eax
	subl	%r15d, %eax
	cltq
	movzbl	0(%r13,%rax), %eax
	movslq	%edi, %rdx
	shrb	%al
	addb	(%rbx,%rdx), %al
	movb	%al, 0(%r13,%rdx)
	leal	1(%rdi), %eax
	cmpl	%eax, %r12d
	jle	.L1859
	movslq	%eax, %rdx
	subl	%r15d, %eax
	cltq
	movzbl	0(%r13,%rax), %eax
	shrb	%al
	addb	(%rbx,%rdx), %al
	movb	%al, 0(%r13,%rdx)
	leal	2(%rdi), %eax
	cmpl	%eax, %r12d
	jle	.L1859
	movslq	%eax, %rdx
	subl	%r15d, %eax
	cltq
	movzbl	0(%r13,%rax), %eax
	shrb	%al
	addb	(%rbx,%rdx), %al
	movb	%al, 0(%r13,%rdx)
	leal	3(%rdi), %eax
	cmpl	%eax, %r12d
	jle	.L1859
	movslq	%eax, %rdx
	subl	%r15d, %eax
	cltq
	movzbl	0(%r13,%rax), %eax
	shrb	%al
	addb	(%rbx,%rdx), %al
	movb	%al, 0(%r13,%rdx)
	leal	4(%rdi), %eax
	cmpl	%eax, %r12d
	jle	.L1859
	movslq	%eax, %rdx
	subl	%r15d, %eax
	cltq
	movzbl	0(%r13,%rax), %eax
	shrb	%al
	addb	(%rbx,%rdx), %al
	movb	%al, 0(%r13,%rdx)
	leal	5(%rdi), %eax
	cmpl	%eax, %r12d
	jle	.L1859
	movslq	%eax, %rdx
	subl	%r15d, %eax
	cltq
	movzbl	0(%r13,%rax), %eax
	shrb	%al
	addb	(%rbx,%rdx), %al
	movb	%al, 0(%r13,%rdx)
	leal	6(%rdi), %eax
	cmpl	%eax, %r12d
	jle	.L1859
	movslq	%eax, %rdx
	subl	%r15d, %eax
	cltq
	movzbl	0(%r13,%rax), %eax
	shrb	%al
	addb	(%rbx,%rdx), %al
	movb	%al, 0(%r13,%rdx)
	leal	7(%rdi), %eax
	cmpl	%eax, %r12d
	jle	.L1859
	movslq	%eax, %rdx
	subl	%r15d, %eax
	cltq
	movzbl	0(%r13,%rax), %eax
	shrb	%al
	addb	(%rbx,%rdx), %al
	movb	%al, 0(%r13,%rdx)
	leal	8(%rdi), %eax
	cmpl	%eax, %r12d
	jle	.L1859
	movslq	%eax, %rdx
	subl	%r15d, %eax
	cltq
	movzbl	0(%r13,%rax), %eax
	shrb	%al
	addb	(%rbx,%rdx), %al
	movb	%al, 0(%r13,%rdx)
	leal	9(%rdi), %eax
	cmpl	%eax, %r12d
	jle	.L1859
	movslq	%eax, %rdx
	subl	%r15d, %eax
	cltq
	movzbl	0(%r13,%rax), %eax
	shrb	%al
	addb	(%rbx,%rdx), %al
	movb	%al, 0(%r13,%rdx)
	leal	10(%rdi), %eax
	cmpl	%eax, %r12d
	jle	.L1859
	movslq	%eax, %rdx
	subl	%r15d, %eax
	cltq
	movzbl	0(%r13,%rax), %eax
	shrb	%al
	addb	(%rbx,%rdx), %al
	movb	%al, 0(%r13,%rdx)
	leal	11(%rdi), %eax
	cmpl	%eax, %r12d
	jle	.L1859
	movslq	%eax, %rdx
	subl	%r15d, %eax
	cltq
	movzbl	0(%r13,%rax), %eax
	shrb	%al
	addb	(%rbx,%rdx), %al
	movb	%al, 0(%r13,%rdx)
	leal	12(%rdi), %eax
	cmpl	%eax, %r12d
	jle	.L1859
	movslq	%eax, %rdx
	subl	%r15d, %eax
	cltq
	movzbl	0(%r13,%rax), %eax
	shrb	%al
	addb	(%rbx,%rdx), %al
	movb	%al, 0(%r13,%rdx)
	leal	13(%rdi), %eax
	cmpl	%eax, %r12d
	jle	.L1859
	movslq	%eax, %rdx
	subl	%r15d, %eax
	cltq
	movzbl	0(%r13,%rax), %eax
	shrb	%al
	addb	(%rbx,%rdx), %al
	movb	%al, 0(%r13,%rdx)
	leal	14(%rdi), %eax
	cmpl	%eax, %r12d
	jle	.L1859
	movslq	%eax, %rdx
	subl	%r15d, %eax
	cltq
	movzbl	0(%r13,%rax), %eax
	shrb	%al
	addb	(%rbx,%rdx), %al
	movb	%al, 0(%r13,%rdx)
	jmp	.L1859
.L1863:
	testl	%r11d, %r11d
	jle	.L1859
	movl	%r15d, %edx
	negl	%edx
	movslq	%edx, %r8
	movq	%r8, %rdx
	notq	%rdx
	cmpq	$30, %rdx
	leal	-1(%r11), %esi
	seta	%cl
	cmpl	$14, %esi
	seta	%dl
	andl	%edx, %ecx
	leaq	1(%rax,%r8), %rdi
	movq	%r13, %rdx
	subq	%rdi, %rdx
	cmpq	$30, %rdx
	seta	%dl
	andl	%ecx, %edx
	leaq	1(%rbx), %rdi
	movq	%r13, %rcx
	subq	%rdi, %rcx
	cmpq	$30, %rcx
	seta	%cl
	movl	%r11d, %r9d
	testb	%cl, %dl
	je	.L1902
	leaq	1(%rax), %rcx
	movq	%r13, %rdx
	subq	%rcx, %rdx
	cmpq	$30, %rdx
	jbe	.L1902
	cmpl	$30, %esi
	jbe	.L2084
	movl	%r11d, %edx
	shrl	$5, %edx
	salq	$5, %rdx
	movq	%rdx, %rdi
	leaq	(%rax,%r8), %rcx
	leaq	0(%r13,%r8), %rsi
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L1904:
	vmovdqu	(%rcx,%rdx), %ymm4
	vpmovzxbw	(%rax,%rdx), %ymm2
	vpmovzxbw	(%rsi,%rdx), %ymm13
	vextracti128	$0x1, %ymm4, %xmm0
	vmovdqu	(%rax,%rdx), %ymm4
	vpmovzxbw	(%rcx,%rdx), %ymm1
	vmovdqu	(%rsi,%rdx), %ymm7
	vpmovzxwd	%xmm13, %ymm15
	vextracti128	$0x1, %ymm4, %xmm10
	vpmovzxwd	%xmm2, %ymm4
	vpmovzxwd	%xmm1, %ymm9
	vpaddd	%ymm15, %ymm4, %ymm8
	vextracti128	$0x1, %ymm2, %xmm2
	vextracti128	$0x1, %ymm13, %xmm13
	vpsubd	%ymm9, %ymm8, %ymm8
	vpmovzxbw	%xmm0, %ymm0
	vpmovzxwd	%xmm2, %ymm2
	vextracti128	$0x1, %ymm7, %xmm11
	vpmovzxwd	%xmm13, %ymm13
	vextracti128	$0x1, %ymm1, %xmm1
	vpmovzxwd	%xmm0, %ymm3
	vpmovzxwd	%xmm1, %ymm1
	vpaddd	%ymm13, %ymm2, %ymm7
	vextracti128	$0x1, %ymm0, %xmm0
	vpmovzxbw	%xmm10, %ymm10
	vpmovzxbw	%xmm11, %ymm11
	vpsubd	%ymm15, %ymm8, %ymm15
	vpsubd	%ymm4, %ymm8, %ymm4
	vpsubd	%ymm9, %ymm8, %ymm8
	vpsubd	%ymm1, %ymm7, %ymm7
	vpmovzxwd	%xmm0, %ymm5
	vpmovzxwd	%xmm11, %ymm12
	vpmovzxwd	%xmm10, %ymm0
	vpabsd	%ymm4, %ymm4
	vpabsd	%ymm8, %ymm8
	vextracti128	$0x1, %ymm10, %xmm10
	vextracti128	$0x1, %ymm11, %xmm11
	vpmovzxwd	%xmm10, %ymm10
	vpmovzxwd	%xmm11, %ymm11
	vpabsd	%ymm15, %ymm15
	vpsubd	%ymm13, %ymm7, %ymm13
	vpsubd	%ymm2, %ymm7, %ymm2
	vpsubd	%ymm1, %ymm7, %ymm7
	vpminsd	%ymm8, %ymm4, %ymm1
	vmovdqa	%ymm5, 544(%rsp)
	vmovdqa	%ymm15, 416(%rsp)
	vpaddd	%ymm11, %ymm10, %ymm5
	vpcmpgtd	%ymm1, %ymm15, %ymm15
	vpsubd	544(%rsp), %ymm5, %ymm5
	vpaddd	%ymm12, %ymm0, %ymm6
	vpabsd	%ymm2, %ymm2
	vpabsd	%ymm7, %ymm7
	vpminsd	%ymm7, %ymm2, %ymm9
	vpsubd	%ymm3, %ymm6, %ymm6
	vpabsd	%ymm13, %ymm13
	vpsubd	%ymm12, %ymm6, %ymm12
	vpsubd	%ymm11, %ymm5, %ymm11
	vpsubd	%ymm0, %ymm6, %ymm0
	vpsubd	%ymm10, %ymm5, %ymm10
	vpsubd	%ymm3, %ymm6, %ymm6
	vpsubd	544(%rsp), %ymm5, %ymm5
	vmovdqa	%ymm15, 544(%rsp)
	vpcmpgtd	%ymm9, %ymm13, %ymm15
	vpabsd	%ymm0, %ymm0
	vpabsd	%ymm6, %ymm3
	vpabsd	%ymm12, %ymm12
	vmovdqa	%ymm3, 384(%rsp)
	vpminsd	%ymm3, %ymm0, %ymm3
	vmovdqa	%ymm15, 512(%rsp)
	vpcmpgtd	%ymm3, %ymm12, %ymm15
	vpabsd	%ymm10, %ymm10
	vpabsd	%ymm5, %ymm5
	vpminsd	%ymm5, %ymm10, %ymm6
	vpabsd	%ymm11, %ymm11
	vmovdqa	%ymm15, 480(%rsp)
	vpcmpgtd	%ymm6, %ymm11, %ymm15
	vpcmpgtd	%ymm5, %ymm10, %ymm5
	vmovdqa	%ymm15, 448(%rsp)
	vpcmpeqd	%ymm1, %ymm4, %ymm15
	vpcmpgtd	%ymm8, %ymm4, %ymm4
	vpand	448(%rsp), %ymm5, %ymm5
	vpand	544(%rsp), %ymm15, %ymm15
	vpand	544(%rsp), %ymm4, %ymm4
	vmovdqa	%ymm15, 352(%rsp)
	vpcmpeqd	%ymm9, %ymm2, %ymm15
	vpcmpgtd	%ymm7, %ymm2, %ymm2
	vmovdqa	416(%rsp), %ymm7
	vpand	512(%rsp), %ymm15, %ymm15
	vpminsd	%ymm7, %ymm1, %ymm1
	vmovdqa	%ymm15, 320(%rsp)
	vpcmpeqd	%ymm3, %ymm0, %ymm15
	vpminsd	%ymm9, %ymm13, %ymm9
	vpminsd	%ymm3, %ymm12, %ymm3
	vpand	480(%rsp), %ymm15, %ymm15
	vpcmpeqd	%ymm7, %ymm1, %ymm1
	vmovdqa	%ymm15, 288(%rsp)
	vpcmpeqd	%ymm6, %ymm10, %ymm15
	vpminsd	%ymm6, %ymm11, %ymm6
	vpcmpeqd	%ymm9, %ymm13, %ymm9
	vpcmpeqd	%ymm3, %ymm12, %ymm3
	vpcmpeqd	%ymm6, %ymm11, %ymm6
	vpcmpgtd	384(%rsp), %ymm0, %ymm0
	vpand	%ymm1, %ymm14, %ymm1
	vpand	%ymm9, %ymm14, %ymm9
	vpand	%ymm3, %ymm14, %ymm3
	vpand	%ymm6, %ymm14, %ymm6
	vpackusdw	%ymm9, %ymm1, %ymm1
	vpackusdw	%ymm6, %ymm3, %ymm3
	vpermq	$216, %ymm1, %ymm1
	vpermq	$216, %ymm3, %ymm3
	vpand	.LC2(%rip), %ymm1, %ymm1
	vpand	512(%rsp), %ymm2, %ymm2
	vpand	480(%rsp), %ymm0, %ymm0
	vpand	.LC2(%rip), %ymm3, %ymm3
	vpand	%ymm2, %ymm14, %ymm2
	vpackuswb	%ymm3, %ymm1, %ymm3
	vpand	%ymm0, %ymm14, %ymm0
	vpand	%ymm4, %ymm14, %ymm1
	vpand	%ymm5, %ymm14, %ymm5
	vmovdqu	(%rcx,%rdx), %ymm7
	vpackusdw	%ymm2, %ymm1, %ymm1
	vpackusdw	%ymm5, %ymm0, %ymm2
	vpermq	$216, %ymm1, %ymm1
	vpermq	$216, %ymm2, %ymm2
	vpermq	$216, %ymm3, %ymm3
	vpblendvb	%ymm3, (%rsi,%rdx), %ymm7, %ymm3
	vpand	448(%rsp), %ymm15, %ymm15
	vpand	.LC2(%rip), %ymm1, %ymm0
	vpand	.LC2(%rip), %ymm2, %ymm1
	vpand	320(%rsp), %ymm14, %ymm2
	vpackuswb	%ymm1, %ymm0, %ymm0
	vpand	352(%rsp), %ymm14, %ymm1
	vpand	%ymm15, %ymm14, %ymm15
	vpackusdw	%ymm2, %ymm1, %ymm1
	vpand	288(%rsp), %ymm14, %ymm2
	vpermq	$216, %ymm1, %ymm1
	vpackusdw	%ymm15, %ymm2, %ymm2
	vpermq	$216, %ymm2, %ymm2
	vpand	.LC2(%rip), %ymm1, %ymm1
	vpand	.LC2(%rip), %ymm2, %ymm2
	vpermq	$216, %ymm0, %ymm0
	vpackuswb	%ymm2, %ymm1, %ymm1
	vpblendvb	%ymm0, %ymm7, %ymm3, %ymm0
	vpermq	$216, %ymm1, %ymm1
	vpblendvb	%ymm1, (%rax,%rdx), %ymm0, %ymm0
	vpaddb	(%rbx,%rdx), %ymm0, %ymm0
	vmovdqu	%ymm0, 0(%r13,%rdx)
	addq	$32, %rdx
	cmpq	%rdx, %rdi
	jne	.L1904
	movl	%r12d, %edx
	andl	$-32, %edx
	movl	%edx, %esi
	cmpl	%edx, %r12d
	je	.L1859
	movl	%r12d, %r9d
	subl	%edx, %r9d
	leal	-1(%r9), %ecx
	cmpl	$14, %ecx
	jbe	.L1907
.L1903:
	movl	%edx, %ecx
	leaq	(%r8,%rcx), %rdx
	vmovdqu	(%rax,%rdx), %xmm5
	vmovdqu	(%rax,%rcx), %xmm6
	vpmovzxbw	%xmm5, %xmm1
	vpmovzxwd	%xmm1, %xmm10
	vpsrldq	$8, %xmm5, %xmm0
	vpsrldq	$8, %xmm1, %xmm1
	vpmovzxwd	%xmm1, %xmm8
	vpmovzxbw	%xmm0, %xmm0
	vpmovzxbw	%xmm6, %xmm1
	vmovdqu	(%rax,%rcx), %xmm6
	vpmovzxwd	%xmm0, %xmm9
	vpsrldq	$8, %xmm0, %xmm0
	vpmovzxwd	%xmm0, %xmm4
	vpsrldq	$8, %xmm6, %xmm0
	vmovdqu	0(%r13,%rdx), %xmm7
	vpmovzxbw	%xmm0, %xmm0
	vpmovzxwd	%xmm1, %xmm6
	vpmovzxwd	%xmm0, %xmm2
	vpsrldq	$8, %xmm1, %xmm1
	vpsrldq	$8, %xmm0, %xmm0
	vmovdqa	%xmm4, 544(%rsp)
	vpmovzxwd	%xmm1, %xmm3
	vpmovzxbw	%xmm7, %xmm4
	vpmovzxwd	%xmm0, %xmm1
	vpsrldq	$8, %xmm7, %xmm0
	vpmovzxwd	%xmm4, %xmm15
	vpmovzxbw	%xmm0, %xmm0
	vpmovzxwd	%xmm0, %xmm12
	vmovdqa	%xmm7, 224(%rsp)
	vpsrldq	$8, %xmm4, %xmm4
	vpaddd	%xmm15, %xmm6, %xmm7
	vpsrldq	$8, %xmm0, %xmm0
	vpsubd	%xmm10, %xmm7, %xmm7
	vpmovzxwd	%xmm4, %xmm13
	vpmovzxwd	%xmm0, %xmm11
	vpaddd	%xmm11, %xmm1, %xmm0
	vmovdqa	%xmm5, 256(%rsp)
	vpsubd	%xmm15, %xmm7, %xmm15
	vpaddd	%xmm13, %xmm3, %xmm5
	vpsubd	%xmm6, %xmm7, %xmm6
	vpsubd	%xmm10, %xmm7, %xmm7
	vpsubd	544(%rsp), %xmm0, %xmm0
	vpsubd	%xmm8, %xmm5, %xmm5
	vpabsd	%xmm6, %xmm6
	vpabsd	%xmm7, %xmm7
	vpabsd	%xmm15, %xmm15
	vpsubd	%xmm13, %xmm5, %xmm13
	vpsubd	%xmm3, %xmm5, %xmm3
	vpsubd	%xmm8, %xmm5, %xmm5
	vpminsd	%xmm7, %xmm6, %xmm8
	vmovdqa	%xmm15, 448(%rsp)
	vpsubd	%xmm11, %xmm0, %xmm11
	vpcmpgtd	%xmm8, %xmm15, %xmm15
	vpsubd	%xmm1, %xmm0, %xmm1
	vpsubd	544(%rsp), %xmm0, %xmm0
	vpaddd	%xmm12, %xmm2, %xmm4
	vpabsd	%xmm3, %xmm3
	vpabsd	%xmm5, %xmm5
	vpsubd	%xmm9, %xmm4, %xmm4
	vpabsd	%xmm0, %xmm10
	vpabsd	%xmm13, %xmm13
	vpminsd	%xmm5, %xmm3, %xmm0
	vmovdqa	%xmm15, 544(%rsp)
	vpsubd	%xmm12, %xmm4, %xmm12
	vpcmpgtd	%xmm0, %xmm13, %xmm15
	vpsubd	%xmm2, %xmm4, %xmm2
	vpsubd	%xmm9, %xmm4, %xmm4
	vpabsd	%xmm2, %xmm2
	vpabsd	%xmm4, %xmm9
	vpminsd	%xmm9, %xmm2, %xmm4
	vpabsd	%xmm12, %xmm12
	vmovdqa	%xmm15, 512(%rsp)
	vpcmpgtd	%xmm4, %xmm12, %xmm15
	vpabsd	%xmm1, %xmm1
	vpabsd	%xmm11, %xmm11
	vmovdqa	%xmm15, 480(%rsp)
	vpcmpeqd	%xmm8, %xmm6, %xmm15
	vmovdqa	%xmm9, 416(%rsp)
	vmovdqa	%xmm10, 384(%rsp)
	vpand	544(%rsp), %xmm15, %xmm15
	vpminsd	%xmm10, %xmm1, %xmm9
	vmovdqa	%xmm15, 352(%rsp)
	vpcmpeqd	%xmm0, %xmm3, %xmm15
	vpcmpgtd	%xmm9, %xmm11, %xmm10
	vpminsd	%xmm0, %xmm13, %xmm0
	vpand	512(%rsp), %xmm15, %xmm15
	vpcmpgtd	%xmm5, %xmm3, %xmm3
	vmovdqa	%xmm15, 320(%rsp)
	vpcmpeqd	%xmm4, %xmm2, %xmm15
	vpminsd	%xmm4, %xmm12, %xmm4
	vpcmpeqd	%xmm0, %xmm13, %xmm0
	vpand	480(%rsp), %xmm15, %xmm15
	vpcmpeqd	%xmm4, %xmm12, %xmm4
	vmovdqa	%xmm15, 288(%rsp)
	vpcmpeqd	%xmm9, %xmm1, %xmm15
	vpcmpgtd	384(%rsp), %xmm1, %xmm1
	vpminsd	%xmm9, %xmm11, %xmm9
	vpand	%xmm10, %xmm15, %xmm15
	vpand	%xmm10, %xmm1, %xmm1
	vmovdqa	448(%rsp), %xmm10
	vpcmpeqd	%xmm9, %xmm11, %xmm5
	vpminsd	%xmm10, %xmm8, %xmm8
	vpcmpeqd	%xmm10, %xmm8, %xmm8
	vpand	.LC20(%rip), %xmm5, %xmm5
	vpcmpgtd	416(%rsp), %xmm2, %xmm2
	vpand	.LC20(%rip), %xmm8, %xmm8
	vpand	.LC20(%rip), %xmm0, %xmm0
	vpand	.LC20(%rip), %xmm4, %xmm4
	vpcmpgtd	%xmm7, %xmm6, %xmm6
	vpackusdw	%xmm5, %xmm4, %xmm4
	vpackusdw	%xmm0, %xmm8, %xmm0
	vpand	544(%rsp), %xmm6, %xmm6
	vpand	.LC5(%rip), %xmm0, %xmm0
	vpand	512(%rsp), %xmm3, %xmm3
	vpand	480(%rsp), %xmm2, %xmm2
	vpand	.LC5(%rip), %xmm4, %xmm4
	vpand	.LC20(%rip), %xmm2, %xmm2
	vpackuswb	%xmm4, %xmm0, %xmm4
	vpand	.LC20(%rip), %xmm3, %xmm3
	vpand	.LC20(%rip), %xmm6, %xmm0
	vpand	.LC20(%rip), %xmm1, %xmm1
	vpackusdw	%xmm3, %xmm0, %xmm0
	vpackusdw	%xmm1, %xmm2, %xmm1
	vmovdqa	256(%rsp), %xmm5
	vpand	.LC5(%rip), %xmm1, %xmm1
	vpand	.LC5(%rip), %xmm0, %xmm0
	vpblendvb	%xmm4, 224(%rsp), %xmm5, %xmm4
	vpackuswb	%xmm1, %xmm0, %xmm0
	vpblendvb	%xmm0, %xmm5, %xmm4, %xmm1
	vmovdqa	352(%rsp), %xmm4
	vmovdqa	288(%rsp), %xmm6
	vpand	.LC20(%rip), %xmm4, %xmm0
	vmovdqa	320(%rsp), %xmm4
	vpand	.LC20(%rip), %xmm15, %xmm15
	vpand	.LC20(%rip), %xmm4, %xmm2
	movl	%r9d, %edx
	vpackusdw	%xmm2, %xmm0, %xmm0
	vpand	.LC20(%rip), %xmm6, %xmm2
	vpand	.LC5(%rip), %xmm0, %xmm0
	vpackusdw	%xmm15, %xmm2, %xmm2
	vpand	.LC5(%rip), %xmm2, %xmm2
	andl	$-16, %edx
	vpackuswb	%xmm2, %xmm0, %xmm0
	vpblendvb	%xmm0, (%rax,%rcx), %xmm1, %xmm0
	vpaddb	(%rbx,%rcx), %xmm0, %xmm0
	addl	%edx, %esi
	vmovdqu	%xmm0, 0(%r13,%rcx)
	cmpl	%r9d, %edx
	je	.L1859
.L1907:
	movslq	%r15d, %rdx
	movslq	%esi, %rdi
	movq	%rax, %rsi
	subq	%rdx, %rsi
	movq	%rsi, 544(%rsp)
	movq	%r13, %rsi
	subq	%rdx, %rsi
	movq	%rsi, 512(%rsp)
	movl	%r15d, 480(%rsp)
	movl	%r14d, 448(%rsp)
	movq	%r11, 416(%rsp)
	jmp	.L1910
.L1909:
	cmpl	%ecx, %esi
	cmovle	%r11d, %r8d
.L1911:
	addl	%r15d, %r8d
	movb	%r8b, 0(%r13,%rdi)
	incq	%rdi
	cmpl	%edi, %r12d
	jle	.L2384
.L1910:
	movq	544(%rsp), %rdx
	movzbl	(%rax,%rdi), %ecx
	movzbl	(%rdx,%rdi), %r10d
	movq	512(%rsp), %rdx
	movl	%ecx, %r11d
	movzbl	(%rdx,%rdi), %r9d
	movl	%r10d, %r8d
	leal	(%rcx,%r9), %edx
	subl	%r10d, %edx
	movl	%edx, %esi
	subl	%ecx, %esi
	movl	%esi, %ecx
	sarl	$31, %ecx
	xorl	%ecx, %esi
	subl	%ecx, %esi
	movl	%edx, %ecx
	subl	%r10d, %ecx
	subl	%r9d, %edx
	movl	%ecx, %r10d
	sarl	$31, %r10d
	movl	%r9d, %r14d
	movl	%edx, %r9d
	sarl	$31, %r9d
	xorl	%r10d, %ecx
	xorl	%r9d, %edx
	subl	%r10d, %ecx
	subl	%r9d, %edx
	cmpl	%ecx, %esi
	movl	%ecx, %r9d
	cmovle	%esi, %r9d
	movzbl	(%rbx,%rdi), %r15d
	cmpl	%r9d, %edx
	jg	.L1909
	movl	%r14d, %r8d
	jmp	.L1911
.L1864:
	testl	%r11d, %r11d
	jle	.L1859
	movl	%r15d, %edx
	negl	%edx
	movslq	%edx, %rdx
	movq	%rdx, %rsi
	notq	%rsi
	cmpq	$30, %rsi
	leal	-1(%r11), %edi
	seta	%sil
	cmpl	$14, %edi
	seta	%r8b
	andl	%r8d, %esi
	leaq	1(%rbx), %r9
	movq	%r13, %r8
	subq	%r9, %r8
	cmpq	$30, %r8
	seta	%r8b
	movl	%r11d, %ecx
	testb	%r8b, %sil
	je	.L1893
	leaq	1(%rax), %r8
	movq	%r13, %rsi
	subq	%r8, %rsi
	cmpq	$30, %rsi
	jbe	.L1893
	cmpl	$30, %edi
	jbe	.L2083
	movl	%r11d, %esi
	shrl	$5, %esi
	addq	%r13, %rdx
	salq	$5, %rsi
	xorl	%ecx, %ecx
	.p2align 4,,10
	.p2align 3
.L1895:
	vmovdqu	(%rax,%rcx), %ymm0
	vmovdqu	(%rdx,%rcx), %ymm2
	vpand	%ymm2, %ymm0, %ymm1
	vpand	.LC15(%rip), %ymm1, %ymm1
	vpsrlw	$1, %ymm0, %ymm0
	vpsrlw	$1, %ymm2, %ymm2
	vpand	.LC16(%rip), %ymm0, %ymm0
	vpand	.LC16(%rip), %ymm2, %ymm2
	vpaddb	(%rbx,%rcx), %ymm1, %ymm1
	vpaddb	%ymm2, %ymm0, %ymm0
	vpaddb	%ymm0, %ymm1, %ymm0
	vmovdqu	%ymm0, 0(%r13,%rcx)
	addq	$32, %rcx
	cmpq	%rcx, %rsi
	jne	.L1895
	movl	%r12d, %esi
	andl	$-32, %esi
	movl	%esi, %r8d
	cmpl	%esi, %r12d
	je	.L1859
	movl	%r12d, %ecx
	subl	%esi, %ecx
	leal	-1(%rcx), %edi
	cmpl	$14, %edi
	jbe	.L1898
.L1894:
	vmovdqu	(%rax,%rsi), %xmm0
	vmovdqu	(%rdx,%rsi), %xmm2
	vpsrlw	$1, %xmm0, %xmm1
	vpand	.LC18(%rip), %xmm0, %xmm0
	vpand	.LC17(%rip), %xmm1, %xmm1
	vpand	%xmm2, %xmm0, %xmm0
	vpsrlw	$1, %xmm2, %xmm2
	vpand	.LC17(%rip), %xmm2, %xmm2
	vpaddb	(%rbx,%rsi), %xmm1, %xmm1
	vpaddb	%xmm2, %xmm0, %xmm0
	movl	%ecx, %edx
	vpaddb	%xmm0, %xmm1, %xmm0
	andl	$-16, %edx
	vmovdqu	%xmm0, 0(%r13,%rsi)
	addl	%edx, %r8d
	cmpl	%ecx, %edx
	je	.L1859
.L1898:
	movl	%r8d, %edx
	subl	%r15d, %edx
	movslq	%r8d, %rcx
	movslq	%edx, %rdx
	movzbl	0(%r13,%rdx), %edx
	movzbl	(%rax,%rcx), %esi
	addl	%esi, %edx
	sarl	%edx
	addb	(%rbx,%rcx), %dl
	movb	%dl, 0(%r13,%rcx)
	leal	1(%r8), %edx
	cmpl	%edx, %r12d
	jle	.L1859
	movslq	%edx, %rcx
	subl	%r15d, %edx
	movslq	%edx, %rdx
	movzbl	0(%r13,%rdx), %edx
	movzbl	(%rax,%rcx), %esi
	addl	%esi, %edx
	sarl	%edx
	addb	(%rbx,%rcx), %dl
	movb	%dl, 0(%r13,%rcx)
	leal	2(%r8), %edx
	cmpl	%edx, %r12d
	jle	.L1859
	movslq	%edx, %rcx
	subl	%r15d, %edx
	movslq	%edx, %rdx
	movzbl	0(%r13,%rdx), %edx
	movzbl	(%rax,%rcx), %esi
	addl	%esi, %edx
	sarl	%edx
	addb	(%rbx,%rcx), %dl
	movb	%dl, 0(%r13,%rcx)
	leal	3(%r8), %edx
	cmpl	%edx, %r12d
	jle	.L1859
	movslq	%edx, %rcx
	subl	%r15d, %edx
	movslq	%edx, %rdx
	movzbl	0(%r13,%rdx), %edx
	movzbl	(%rax,%rcx), %esi
	addl	%esi, %edx
	sarl	%edx
	addb	(%rbx,%rcx), %dl
	movb	%dl, 0(%r13,%rcx)
	leal	4(%r8), %edx
	cmpl	%edx, %r12d
	jle	.L1859
	movslq	%edx, %rcx
	subl	%r15d, %edx
	movslq	%edx, %rdx
	movzbl	0(%r13,%rdx), %edx
	movzbl	(%rax,%rcx), %esi
	addl	%esi, %edx
	sarl	%edx
	addb	(%rbx,%rcx), %dl
	movb	%dl, 0(%r13,%rcx)
	leal	5(%r8), %edx
	cmpl	%edx, %r12d
	jle	.L1859
	movslq	%edx, %rcx
	subl	%r15d, %edx
	movslq	%edx, %rdx
	movzbl	0(%r13,%rdx), %edx
	movzbl	(%rax,%rcx), %esi
	addl	%esi, %edx
	sarl	%edx
	addb	(%rbx,%rcx), %dl
	movb	%dl, 0(%r13,%rcx)
	leal	6(%r8), %edx
	cmpl	%edx, %r12d
	jle	.L1859
	movslq	%edx, %rcx
	subl	%r15d, %edx
	movslq	%edx, %rdx
	movzbl	0(%r13,%rdx), %edx
	movzbl	(%rax,%rcx), %esi
	addl	%esi, %edx
	sarl	%edx
	addb	(%rbx,%rcx), %dl
	movb	%dl, 0(%r13,%rcx)
	leal	7(%r8), %edx
	cmpl	%edx, %r12d
	jle	.L1859
	movslq	%edx, %rcx
	subl	%r15d, %edx
	movslq	%edx, %rdx
	movzbl	0(%r13,%rdx), %edx
	movzbl	(%rax,%rcx), %esi
	addl	%esi, %edx
	sarl	%edx
	addb	(%rbx,%rcx), %dl
	movb	%dl, 0(%r13,%rcx)
	leal	8(%r8), %edx
	cmpl	%edx, %r12d
	jle	.L1859
	movslq	%edx, %rcx
	subl	%r15d, %edx
	movslq	%edx, %rdx
	movzbl	0(%r13,%rdx), %edx
	movzbl	(%rax,%rcx), %esi
	addl	%esi, %edx
	sarl	%edx
	addb	(%rbx,%rcx), %dl
	movb	%dl, 0(%r13,%rcx)
	leal	9(%r8), %edx
	cmpl	%r12d, %edx
	jge	.L1859
	movslq	%edx, %rcx
	subl	%r15d, %edx
	movslq	%edx, %rdx
	movzbl	0(%r13,%rdx), %edx
	movzbl	(%rax,%rcx), %esi
	addl	%esi, %edx
	sarl	%edx
	addb	(%rbx,%rcx), %dl
	movb	%dl, 0(%r13,%rcx)
	leal	10(%r8), %edx
	cmpl	%edx, %r12d
	jle	.L1859
	movslq	%edx, %rcx
	subl	%r15d, %edx
	movslq	%edx, %rdx
	movzbl	0(%r13,%rdx), %edx
	movzbl	(%rax,%rcx), %esi
	addl	%esi, %edx
	sarl	%edx
	addb	(%rbx,%rcx), %dl
	movb	%dl, 0(%r13,%rcx)
	leal	11(%r8), %edx
	cmpl	%edx, %r12d
	jle	.L1859
	movslq	%edx, %rcx
	subl	%r15d, %edx
	movslq	%edx, %rdx
	movzbl	0(%r13,%rdx), %edx
	movzbl	(%rax,%rcx), %esi
	addl	%esi, %edx
	sarl	%edx
	addb	(%rbx,%rcx), %dl
	movb	%dl, 0(%r13,%rcx)
	leal	12(%r8), %edx
	cmpl	%edx, %r12d
	jle	.L1859
	movslq	%edx, %rcx
	subl	%r15d, %edx
	movslq	%edx, %rdx
	movzbl	0(%r13,%rdx), %edx
	movzbl	(%rax,%rcx), %esi
	addl	%esi, %edx
	sarl	%edx
	addb	(%rbx,%rcx), %dl
	movb	%dl, 0(%r13,%rcx)
	leal	13(%r8), %edx
	cmpl	%edx, %r12d
	jle	.L1859
	movslq	%edx, %rcx
	subl	%r15d, %edx
	movslq	%edx, %rdx
	movzbl	0(%r13,%rdx), %edx
	movzbl	(%rax,%rcx), %esi
	addl	%esi, %edx
	sarl	%edx
	addb	(%rbx,%rcx), %dl
	movb	%dl, 0(%r13,%rcx)
	leal	14(%r8), %edx
	cmpl	%edx, %r12d
	jle	.L1859
	movslq	%edx, %rcx
	subl	%r15d, %edx
	movslq	%edx, %rdx
	movzbl	0(%r13,%rdx), %edx
	movzbl	(%rax,%rcx), %eax
	addl	%edx, %eax
	sarl	%eax
	addb	(%rbx,%rcx), %al
	movb	%al, 0(%r13,%rcx)
	jmp	.L1859
.L1865:
	testl	%r11d, %r11d
	jle	.L1859
	leaq	1(%rbx), %rdi
	movq	%r13, %rsi
	subq	%rdi, %rsi
	cmpq	$30, %rsi
	leaq	1(%rax), %r8
	movq	%r13, %rdi
	seta	%sil
	subq	%r8, %rdi
	cmpq	$30, %rdi
	seta	%dil
	movl	%r11d, %edx
	leal	-1(%r11), %ecx
	testb	%dil, %sil
	je	.L1884
	cmpl	$14, %ecx
	jbe	.L1884
	cmpl	$30, %ecx
	jbe	.L2082
	movl	%r11d, %ecx
	shrl	$5, %ecx
	salq	$5, %rcx
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L1886:
	vmovdqu	(%rbx,%rdx), %ymm4
	vpaddb	(%rax,%rdx), %ymm4, %ymm0
	vmovdqu	%ymm0, 0(%r13,%rdx)
	addq	$32, %rdx
	cmpq	%rdx, %rcx
	jne	.L1886
	movl	%r12d, %ecx
	andl	$-32, %ecx
	movl	%ecx, %edi
	cmpl	%ecx, %r12d
	je	.L1859
	movl	%r12d, %edx
	subl	%ecx, %edx
	leal	-1(%rdx), %esi
	cmpl	$14, %esi
	jbe	.L1889
.L1885:
	vmovdqu	(%rbx,%rcx), %xmm6
	vpaddb	(%rax,%rcx), %xmm6, %xmm0
	vmovdqu	%xmm0, 0(%r13,%rcx)
	movl	%edx, %ecx
	andl	$-16, %ecx
	addl	%ecx, %edi
	cmpl	%edx, %ecx
	je	.L1859
.L1889:
	movslq	%edi, %rdx
	movzbl	(%rax,%rdx), %ecx
	addb	(%rbx,%rdx), %cl
	movb	%cl, 0(%r13,%rdx)
	leal	1(%rdi), %edx
	cmpl	%edx, %r12d
	jle	.L1859
	movslq	%edx, %rdx
	movzbl	(%rax,%rdx), %ecx
	addb	(%rbx,%rdx), %cl
	movb	%cl, 0(%r13,%rdx)
	leal	2(%rdi), %edx
	cmpl	%r12d, %edx
	jge	.L1859
	movslq	%edx, %rdx
	movzbl	(%rax,%rdx), %ecx
	addb	(%rbx,%rdx), %cl
	movb	%cl, 0(%r13,%rdx)
	leal	3(%rdi), %edx
	cmpl	%edx, %r12d
	jle	.L1859
	movslq	%edx, %rdx
	movzbl	(%rbx,%rdx), %ecx
	addb	(%rax,%rdx), %cl
	movb	%cl, 0(%r13,%rdx)
	leal	4(%rdi), %edx
	cmpl	%edx, %r12d
	jle	.L1859
	movslq	%edx, %rdx
	movzbl	(%rbx,%rdx), %ecx
	addb	(%rax,%rdx), %cl
	movb	%cl, 0(%r13,%rdx)
	leal	5(%rdi), %edx
	cmpl	%r12d, %edx
	jge	.L1859
	movslq	%edx, %rdx
	movzbl	(%rax,%rdx), %ecx
	addb	(%rbx,%rdx), %cl
	movb	%cl, 0(%r13,%rdx)
	leal	6(%rdi), %edx
	cmpl	%r12d, %edx
	jge	.L1859
	movslq	%edx, %rdx
	movzbl	(%rax,%rdx), %ecx
	addb	(%rbx,%rdx), %cl
	movb	%cl, 0(%r13,%rdx)
	leal	7(%rdi), %edx
	cmpl	%r12d, %edx
	jge	.L1859
	movslq	%edx, %rdx
	movzbl	(%rax,%rdx), %ecx
	addb	(%rbx,%rdx), %cl
	movb	%cl, 0(%r13,%rdx)
	leal	8(%rdi), %edx
	cmpl	%edx, %r12d
	jle	.L1859
	movslq	%edx, %rdx
	movzbl	(%rbx,%rdx), %ecx
	addb	(%rax,%rdx), %cl
	movb	%cl, 0(%r13,%rdx)
	leal	9(%rdi), %edx
	cmpl	%edx, %r12d
	jle	.L1859
	movslq	%edx, %rdx
	movzbl	(%rbx,%rdx), %ecx
	addb	(%rax,%rdx), %cl
	movb	%cl, 0(%r13,%rdx)
	leal	10(%rdi), %edx
	cmpl	%edx, %r12d
	jle	.L1859
	movslq	%edx, %rdx
	movzbl	(%rax,%rdx), %ecx
	addb	(%rbx,%rdx), %cl
	movb	%cl, 0(%r13,%rdx)
	leal	11(%rdi), %edx
	cmpl	%edx, %r12d
	jle	.L1859
	movslq	%edx, %rdx
	movzbl	(%rax,%rdx), %ecx
	addb	(%rbx,%rdx), %cl
	movb	%cl, 0(%r13,%rdx)
	leal	12(%rdi), %edx
	cmpl	%edx, %r12d
	jle	.L1859
	movslq	%edx, %rdx
	movzbl	(%rax,%rdx), %ecx
	addb	(%rbx,%rdx), %cl
	movb	%cl, 0(%r13,%rdx)
	leal	13(%rdi), %edx
	cmpl	%edx, %r12d
	jle	.L1859
	movslq	%edx, %rdx
	movzbl	(%rbx,%rdx), %ecx
	addb	(%rax,%rdx), %cl
	movb	%cl, 0(%r13,%rdx)
	leal	14(%rdi), %edx
	cmpl	%edx, %r12d
	jle	.L1859
	movslq	%edx, %rdx
	movzbl	(%rax,%rdx), %eax
	addb	(%rbx,%rdx), %al
	movb	%al, 0(%r13,%rdx)
	jmp	.L1859
.L1867:
	movq	%r11, %rdx
	movq	%rbx, %rsi
	movq	%r13, %rdi
	movq	%r11, 544(%rsp)
	vzeroupper
	call	memcpy@PLT
	movq	544(%rsp), %r11
	vmovdqa	.LC19(%rip), %ymm14
	.p2align 4,,10
	.p2align 3
.L1859:
	addq	%r11, %rbx
.L1932:
	movl	284(%rsp), %eax
	movl	280(%rsp), %edx
	incl	%eax
	addl	%edx, 248(%rsp)
	cmpl	%eax, 168(%rsp)
	je	.L2026
	movq	208(%rsp), %rdx
	movl	%eax, 284(%rsp)
	movq	24(%rdx), %r9
	jmp	.L2027
.L1866:
	testl	%r11d, %r11d
	jle	.L1859
	movl	%r15d, %eax
	negl	%eax
	cltq
	movq	%rax, %rsi
	notq	%rsi
	cmpq	$30, %rsi
	leal	-1(%r11), %ecx
	seta	%dil
	cmpl	$14, %ecx
	seta	%sil
	movl	%r11d, %edx
	testb	%sil, %dil
	je	.L1875
	leaq	1(%rbx), %rdi
	movq	%r13, %rsi
	subq	%rdi, %rsi
	cmpq	$30, %rsi
	jbe	.L1875
	cmpl	$30, %ecx
	jbe	.L2081
	movl	%r11d, %ecx
	shrl	$5, %ecx
	addq	%r13, %rax
	salq	$5, %rcx
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L1877:
	vmovdqu	(%rbx,%rdx), %ymm6
	vpaddb	(%rax,%rdx), %ymm6, %ymm0
	vmovdqu	%ymm0, 0(%r13,%rdx)
	addq	$32, %rdx
	cmpq	%rdx, %rcx
	jne	.L1877
	movl	%r12d, %ecx
	andl	$-32, %ecx
	movl	%ecx, %edi
	cmpl	%ecx, %r12d
	je	.L1859
	movl	%r12d, %edx
	subl	%ecx, %edx
	leal	-1(%rdx), %esi
	cmpl	$14, %esi
	jbe	.L1880
.L1876:
	vmovdqu	(%rax,%rcx), %xmm4
	movl	%edx, %eax
	vpaddb	(%rbx,%rcx), %xmm4, %xmm0
	andl	$-16, %eax
	vmovdqu	%xmm0, 0(%r13,%rcx)
	addl	%eax, %edi
	cmpl	%edx, %eax
	je	.L1859
.L1880:
	movslq	%edi, %rdx
	movl	%edi, %eax
	movzbl	(%rbx,%rdx), %ecx
	subl	%r15d, %eax
	cltq
	addb	0(%r13,%rax), %cl
	leal	1(%rdi), %eax
	movb	%cl, 0(%r13,%rdx)
	cmpl	%eax, %r12d
	jle	.L1859
	movslq	%eax, %rdx
	movzbl	(%rbx,%rdx), %ecx
	subl	%r15d, %eax
	cltq
	addb	0(%r13,%rax), %cl
	leal	2(%rdi), %eax
	movb	%cl, 0(%r13,%rdx)
	cmpl	%r12d, %eax
	jge	.L1859
	movslq	%eax, %rdx
	movzbl	(%rbx,%rdx), %ecx
	subl	%r15d, %eax
	cltq
	addb	0(%r13,%rax), %cl
	leal	3(%rdi), %eax
	movb	%cl, 0(%r13,%rdx)
	cmpl	%r12d, %eax
	jge	.L1859
	movslq	%eax, %rdx
	movzbl	(%rbx,%rdx), %ecx
	subl	%r15d, %eax
	cltq
	addb	0(%r13,%rax), %cl
	leal	4(%rdi), %eax
	movb	%cl, 0(%r13,%rdx)
	cmpl	%eax, %r12d
	jle	.L1859
	movslq	%eax, %rdx
	movzbl	(%rbx,%rdx), %ecx
	subl	%r15d, %eax
	cltq
	addb	0(%r13,%rax), %cl
	leal	5(%rdi), %eax
	movb	%cl, 0(%r13,%rdx)
	cmpl	%r12d, %eax
	jge	.L1859
	movslq	%eax, %rdx
	movzbl	(%rbx,%rdx), %ecx
	subl	%r15d, %eax
	cltq
	addb	0(%r13,%rax), %cl
	leal	6(%rdi), %eax
	movb	%cl, 0(%r13,%rdx)
	cmpl	%r12d, %eax
	jge	.L1859
	movslq	%eax, %rdx
	movzbl	(%rbx,%rdx), %ecx
	subl	%r15d, %eax
	cltq
	addb	0(%r13,%rax), %cl
	leal	7(%rdi), %eax
	movb	%cl, 0(%r13,%rdx)
	cmpl	%eax, %r12d
	jle	.L1859
	movslq	%eax, %rdx
	movzbl	(%rbx,%rdx), %ecx
	subl	%r15d, %eax
	cltq
	addb	0(%r13,%rax), %cl
	leal	8(%rdi), %eax
	movb	%cl, 0(%r13,%rdx)
	cmpl	%eax, %r12d
	jle	.L1859
	movslq	%eax, %rdx
	movzbl	(%rbx,%rdx), %ecx
	subl	%r15d, %eax
	cltq
	addb	0(%r13,%rax), %cl
	leal	9(%rdi), %eax
	movb	%cl, 0(%r13,%rdx)
	cmpl	%eax, %r12d
	jle	.L1859
	movslq	%eax, %rdx
	movzbl	(%rbx,%rdx), %ecx
	subl	%r15d, %eax
	cltq
	addb	0(%r13,%rax), %cl
	leal	10(%rdi), %eax
	movb	%cl, 0(%r13,%rdx)
	cmpl	%eax, %r12d
	jle	.L1859
	movslq	%eax, %rdx
	movzbl	(%rbx,%rdx), %ecx
	subl	%r15d, %eax
	cltq
	addb	0(%r13,%rax), %cl
	leal	11(%rdi), %eax
	movb	%cl, 0(%r13,%rdx)
	cmpl	%eax, %r12d
	jle	.L1859
	movslq	%eax, %rdx
	movzbl	(%rbx,%rdx), %ecx
	subl	%r15d, %eax
	cltq
	addb	0(%r13,%rax), %cl
	leal	12(%rdi), %eax
	movb	%cl, 0(%r13,%rdx)
	cmpl	%eax, %r12d
	jle	.L1859
	movslq	%eax, %rdx
	movzbl	(%rbx,%rdx), %ecx
	subl	%r15d, %eax
	cltq
	addb	0(%r13,%rax), %cl
	leal	13(%rdi), %eax
	movb	%cl, 0(%r13,%rdx)
	cmpl	%eax, %r12d
	jle	.L1859
	movslq	%eax, %rdx
	movzbl	(%rbx,%rdx), %ecx
	subl	%r15d, %eax
	cltq
	addb	0(%r13,%rax), %cl
	leal	14(%rdi), %eax
	movb	%cl, 0(%r13,%rdx)
	cmpl	%eax, %r12d
	jle	.L1859
	movslq	%eax, %rdx
	movzbl	(%rbx,%rdx), %ecx
	subl	%r15d, %eax
	cltq
	addb	0(%r13,%rax), %cl
	movb	%cl, 0(%r13,%rdx)
	jmp	.L1859
.L1860:
	testl	%r11d, %r11d
	jle	.L1859
	movl	%r15d, %eax
	negl	%eax
	cltq
	movq	%rax, %rsi
	notq	%rsi
	cmpq	$30, %rsi
	leal	-1(%r11), %ecx
	seta	%dil
	cmpl	$14, %ecx
	seta	%sil
	movl	%r11d, %edx
	testb	%sil, %dil
	je	.L1923
	leaq	1(%rbx), %rdi
	movq	%r13, %rsi
	subq	%rdi, %rsi
	cmpq	$30, %rsi
	jbe	.L1923
	cmpl	$30, %ecx
	jbe	.L2087
	movl	%r11d, %ecx
	shrl	$5, %ecx
	addq	%r13, %rax
	salq	$5, %rcx
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L1925:
	vmovdqu	(%rbx,%rdx), %ymm6
	vpaddb	(%rax,%rdx), %ymm6, %ymm0
	vmovdqu	%ymm0, 0(%r13,%rdx)
	addq	$32, %rdx
	cmpq	%rcx, %rdx
	jne	.L1925
	movl	%r12d, %ecx
	andl	$-32, %ecx
	movl	%ecx, %edi
	cmpl	%ecx, %r12d
	je	.L1859
	movl	%r12d, %edx
	subl	%ecx, %edx
	leal	-1(%rdx), %esi
	cmpl	$14, %esi
	jbe	.L1928
.L1924:
	vmovdqu	(%rax,%rcx), %xmm4
	movl	%edx, %eax
	vpaddb	(%rbx,%rcx), %xmm4, %xmm0
	andl	$-16, %eax
	vmovdqu	%xmm0, 0(%r13,%rcx)
	addl	%eax, %edi
	cmpl	%edx, %eax
	je	.L1859
.L1928:
	movslq	%edi, %rdx
	movl	%edi, %eax
	movzbl	(%rbx,%rdx), %ecx
	subl	%r15d, %eax
	cltq
	addb	0(%r13,%rax), %cl
	leal	1(%rdi), %eax
	movb	%cl, 0(%r13,%rdx)
	cmpl	%eax, %r12d
	jle	.L1859
	movslq	%eax, %rdx
	movzbl	(%rbx,%rdx), %ecx
	subl	%r15d, %eax
	cltq
	addb	0(%r13,%rax), %cl
	leal	2(%rdi), %eax
	movb	%cl, 0(%r13,%rdx)
	cmpl	%eax, %r12d
	jle	.L1859
	movslq	%eax, %rdx
	movzbl	(%rbx,%rdx), %ecx
	subl	%r15d, %eax
	cltq
	addb	0(%r13,%rax), %cl
	leal	3(%rdi), %eax
	movb	%cl, 0(%r13,%rdx)
	cmpl	%eax, %r12d
	jle	.L1859
	movslq	%eax, %rdx
	movzbl	(%rbx,%rdx), %ecx
	subl	%r15d, %eax
	cltq
	addb	0(%r13,%rax), %cl
	leal	4(%rdi), %eax
	movb	%cl, 0(%r13,%rdx)
	cmpl	%eax, %r12d
	jle	.L1859
	movslq	%eax, %rdx
	movzbl	(%rbx,%rdx), %ecx
	subl	%r15d, %eax
	cltq
	addb	0(%r13,%rax), %cl
	leal	5(%rdi), %eax
	movb	%cl, 0(%r13,%rdx)
	cmpl	%eax, %r12d
	jle	.L1859
	movslq	%eax, %rdx
	movzbl	(%rbx,%rdx), %ecx
	subl	%r15d, %eax
	cltq
	addb	0(%r13,%rax), %cl
	leal	6(%rdi), %eax
	movb	%cl, 0(%r13,%rdx)
	cmpl	%eax, %r12d
	jle	.L1859
	movslq	%eax, %rdx
	movzbl	(%rbx,%rdx), %ecx
	subl	%r15d, %eax
	cltq
	addb	0(%r13,%rax), %cl
	leal	7(%rdi), %eax
	movb	%cl, 0(%r13,%rdx)
	cmpl	%eax, %r12d
	jle	.L1859
	movslq	%eax, %rdx
	movzbl	(%rbx,%rdx), %ecx
	subl	%r15d, %eax
	cltq
	addb	0(%r13,%rax), %cl
	leal	8(%rdi), %eax
	movb	%cl, 0(%r13,%rdx)
	cmpl	%eax, %r12d
	jle	.L1859
	movslq	%eax, %rdx
	movzbl	(%rbx,%rdx), %ecx
	subl	%r15d, %eax
	cltq
	addb	0(%r13,%rax), %cl
	leal	9(%rdi), %eax
	movb	%cl, 0(%r13,%rdx)
	cmpl	%eax, %r12d
	jle	.L1859
	movslq	%eax, %rdx
	movzbl	(%rbx,%rdx), %ecx
	subl	%r15d, %eax
	cltq
	addb	0(%r13,%rax), %cl
	leal	10(%rdi), %eax
	movb	%cl, 0(%r13,%rdx)
	cmpl	%eax, %r12d
	jle	.L1859
	movslq	%eax, %rdx
	movzbl	(%rbx,%rdx), %ecx
	subl	%r15d, %eax
	cltq
	addb	0(%r13,%rax), %cl
	leal	11(%rdi), %eax
	movb	%cl, 0(%r13,%rdx)
	cmpl	%eax, %r12d
	jle	.L1859
	movslq	%eax, %rdx
	movzbl	(%rbx,%rdx), %ecx
	subl	%r15d, %eax
	cltq
	addb	0(%r13,%rax), %cl
	leal	12(%rdi), %eax
	movb	%cl, 0(%r13,%rdx)
	cmpl	%eax, %r12d
	jle	.L1859
	movslq	%eax, %rdx
	movzbl	(%rbx,%rdx), %ecx
	subl	%r15d, %eax
	cltq
	addb	0(%r13,%rax), %cl
	leal	13(%rdi), %eax
	movb	%cl, 0(%r13,%rdx)
	cmpl	%eax, %r12d
	jle	.L1859
	movslq	%eax, %rdx
	movzbl	(%rbx,%rdx), %ecx
	subl	%r15d, %eax
	cltq
	addb	0(%r13,%rax), %cl
	leal	14(%rdi), %eax
	movb	%cl, 0(%r13,%rdx)
	cmpl	%eax, %r12d
	jle	.L1859
	movslq	%eax, %rdx
	movzbl	(%rbx,%rdx), %ecx
	subl	%r15d, %eax
	cltq
	addb	0(%r13,%rax), %cl
	movb	%cl, 0(%r13,%rdx)
	jmp	.L1859
	.p2align 4,,10
	.p2align 3
.L1838:
	movl	280(%rsp), %ecx
	movq	%r9, %rax
	subq	%rcx, %rax
	movl	284(%rsp), %ecx
	testl	%ecx, %ecx
	jne	.L1841
	leaq	first_row_filter(%rip), %rdi
	movzbl	(%rdi,%rdx), %edx
.L1841:
	testl	%r15d, %r15d
	jne	.L1840
	cmpl	$8, 16(%rbp)
	jne	.L1853
	.p2align 4,,10
	.p2align 3
.L2382:
	movslq	156(%rsp), %rcx
	cmpl	%ecx, 276(%rsp)
	je	.L1854
	movb	$-1, (%r9,%rcx)
.L1854:
	leaq	(%r10,%rcx), %rbx
	movslq	276(%rsp), %rcx
	addq	%rcx, %rax
	cmpb	$0, 144(%rsp)
	leaq	(%r9,%rcx), %r13
	jne	.L2385
.L1858:
	movl	276(%rsp), %esi
	cmpl	%esi, 136(%rsp)
	jne	.L2386
	cmpl	$6, %edx
	ja	.L1934
	leaq	.L1936(%rip), %rdi
	movl	%edx, %ecx
	movslq	(%rdi,%rcx,4), %rcx
	addq	%rdi, %rcx
	notrack jmp	*%rcx
	.section	.rodata
	.align 4
	.align 4
.L1936:
	.long	.L1942-.L1936
	.long	.L1941-.L1936
	.long	.L1940-.L1936
	.long	.L1939-.L1936
	.long	.L1938-.L1936
	.long	.L1937-.L1936
	.long	.L1935-.L1936
	.text
.L1937:
	movl	140(%rsp), %r10d
	testl	%r10d, %r10d
	je	.L1943
	movslq	%r14d, %rax
	movq	%rax, 544(%rsp)
	movl	%r14d, %eax
	negl	%eax
	movslq	%eax, %r11
	movq	%r11, %rdi
	notq	%rdi
	movq	%rdi, 512(%rsp)
	movl	%r15d, %edi
	andl	$31, %edi
	movl	%r15d, %edx
	shrl	$5, %edx
	movl	%edi, 480(%rsp)
	movslq	%r15d, %r9
	decl	%edi
	leal	-1(%rdx), %r8d
	movq	%r9, 240(%rsp)
	movl	%edi, 448(%rsp)
	movq	%rbx, 416(%rsp)
	incq	%r8
	movl	%r15d, %r12d
	leaq	0(%r13,%r11), %rax
	salq	$5, %r8
	leal	-1(%r15), %r13d
	andl	$-32, %r12d
	movq	%rbx, %rdx
	.p2align 4,,10
	.p2align 3
.L2003:
	movq	%rax, %rdi
	addq	544(%rsp), %rax
	testl	%r15d, %r15d
	je	.L2013
	cmpq	$30, 512(%rsp)
	seta	%sil
	cmpl	$14, %r13d
	seta	%cl
	testb	%cl, %sil
	je	.L2004
	leaq	1(%rdx), %rsi
	movq	%rax, %rcx
	subq	%rsi, %rcx
	cmpq	$30, %rcx
	jbe	.L2004
	cmpl	$30, %r13d
	jbe	.L2100
	addq	$0, %rdi
	xorl	%ecx, %ecx
	.p2align 4,,10
	.p2align 3
.L2006:
	vmovdqu	(%rdi,%rcx), %ymm7
	vpsrlw	$1, %ymm7, %ymm0
	vpand	.LC16(%rip), %ymm0, %ymm0
	vpaddb	(%rdx,%rcx), %ymm0, %ymm0
	vmovdqu	%ymm0, (%rax,%rcx)
	addq	$32, %rcx
	cmpq	%r8, %rcx
	jne	.L2006
	cmpl	%r12d, %r15d
	je	.L2013
	cmpl	$14, 448(%rsp)
	movl	480(%rsp), %edi
	jbe	.L2101
	movl	%r12d, %esi
	movl	%r12d, %ecx
.L2005:
	leaq	(%rax,%rsi), %rbx
	vmovdqu	(%rbx,%r11), %xmm0
	vpsrlw	$1, %xmm0, %xmm0
	vpand	.LC17(%rip), %xmm0, %xmm0
	vpaddb	(%rdx,%rsi), %xmm0, %xmm0
	vmovdqu	%xmm0, (%rax,%rsi)
	movl	%edi, %esi
	andl	$-16, %esi
	addl	%esi, %ecx
	cmpl	%edi, %esi
	je	.L2013
.L2008:
	movl	%ecx, %esi
	subl	%r14d, %esi
	movslq	%esi, %rsi
	movzbl	(%rax,%rsi), %esi
	movslq	%ecx, %rdi
	shrb	%sil
	addb	(%rdx,%rdi), %sil
	movb	%sil, (%rax,%rdi)
	leal	1(%rcx), %esi
	cmpl	%esi, %r15d
	jle	.L2013
	movslq	%esi, %rdi
	subl	%r14d, %esi
	movslq	%esi, %rsi
	movzbl	(%rax,%rsi), %esi
	shrb	%sil
	addb	(%rdx,%rdi), %sil
	movb	%sil, (%rax,%rdi)
	leal	2(%rcx), %esi
	cmpl	%esi, %r15d
	jle	.L2013
	movslq	%esi, %rdi
	subl	%r14d, %esi
	movslq	%esi, %rsi
	movzbl	(%rax,%rsi), %esi
	shrb	%sil
	addb	(%rdx,%rdi), %sil
	movb	%sil, (%rax,%rdi)
	leal	3(%rcx), %esi
	cmpl	%esi, %r15d
	jle	.L2013
	movslq	%esi, %rdi
	subl	%r14d, %esi
	movslq	%esi, %rsi
	movzbl	(%rax,%rsi), %esi
	shrb	%sil
	addb	(%rdx,%rdi), %sil
	movb	%sil, (%rax,%rdi)
	leal	4(%rcx), %esi
	cmpl	%esi, %r15d
	jle	.L2013
	movslq	%esi, %rdi
	subl	%r14d, %esi
	movslq	%esi, %rsi
	movzbl	(%rax,%rsi), %esi
	shrb	%sil
	addb	(%rdx,%rdi), %sil
	movb	%sil, (%rax,%rdi)
	leal	5(%rcx), %esi
	cmpl	%esi, %r15d
	jle	.L2013
	movslq	%esi, %rdi
	subl	%r14d, %esi
	movslq	%esi, %rsi
	movzbl	(%rax,%rsi), %esi
	shrb	%sil
	addb	(%rdx,%rdi), %sil
	movb	%sil, (%rax,%rdi)
	leal	6(%rcx), %esi
	cmpl	%esi, %r15d
	jle	.L2013
	movslq	%esi, %rdi
	subl	%r14d, %esi
	movslq	%esi, %rsi
	movzbl	(%rax,%rsi), %esi
	shrb	%sil
	addb	(%rdx,%rdi), %sil
	movb	%sil, (%rax,%rdi)
	leal	7(%rcx), %esi
	cmpl	%esi, %r15d
	jle	.L2013
	movslq	%esi, %rdi
	subl	%r14d, %esi
	movslq	%esi, %rsi
	movzbl	(%rax,%rsi), %esi
	shrb	%sil
	addb	(%rdx,%rdi), %sil
	movb	%sil, (%rax,%rdi)
	leal	8(%rcx), %esi
	cmpl	%esi, %r15d
	jle	.L2013
	movslq	%esi, %rdi
	subl	%r14d, %esi
	movslq	%esi, %rsi
	movzbl	(%rax,%rsi), %esi
	shrb	%sil
	addb	(%rdx,%rdi), %sil
	movb	%sil, (%rax,%rdi)
	leal	9(%rcx), %esi
	cmpl	%esi, %r15d
	jle	.L2013
	movslq	%esi, %rdi
	subl	%r14d, %esi
	movslq	%esi, %rsi
	movzbl	(%rax,%rsi), %esi
	shrb	%sil
	addb	(%rdx,%rdi), %sil
	movb	%sil, (%rax,%rdi)
	leal	10(%rcx), %esi
	cmpl	%esi, %r15d
	jle	.L2013
	movslq	%esi, %rdi
	subl	%r14d, %esi
	movslq	%esi, %rsi
	movzbl	(%rax,%rsi), %esi
	shrb	%sil
	addb	(%rdx,%rdi), %sil
	movb	%sil, (%rax,%rdi)
	leal	11(%rcx), %esi
	cmpl	%esi, %r15d
	jle	.L2013
	movslq	%esi, %rdi
	subl	%r14d, %esi
	movslq	%esi, %rsi
	movzbl	(%rax,%rsi), %esi
	shrb	%sil
	addb	(%rdx,%rdi), %sil
	movb	%sil, (%rax,%rdi)
	leal	12(%rcx), %esi
	cmpl	%esi, %r15d
	jle	.L2013
	movslq	%esi, %rdi
	subl	%r14d, %esi
	movslq	%esi, %rsi
	movzbl	(%rax,%rsi), %esi
	shrb	%sil
	addb	(%rdx,%rdi), %sil
	movb	%sil, (%rax,%rdi)
	leal	13(%rcx), %esi
	cmpl	%esi, %r15d
	jle	.L2013
	movslq	%esi, %rdi
	subl	%r14d, %esi
	movslq	%esi, %rsi
	movzbl	(%rax,%rsi), %esi
	addl	$14, %ecx
	shrb	%sil
	addb	(%rdx,%rdi), %sil
	movb	%sil, (%rax,%rdi)
	cmpl	%ecx, %r15d
	jle	.L2013
	movslq	%ecx, %rsi
	subl	%r14d, %ecx
	movslq	%ecx, %rcx
	movzbl	(%rax,%rcx), %ecx
	shrb	%cl
	addb	(%rdx,%rsi), %cl
	movb	%cl, (%rax,%rsi)
	.p2align 4,,10
	.p2align 3
.L2013:
	movb	$-1, (%rax,%r9)
	addq	%r9, %rdx
	decl	%r10d
	jne	.L2003
.L2373:
	movl	140(%rsp), %eax
	movq	416(%rsp), %rbx
	imulq	240(%rsp), %rax
	addq	%rax, %rbx
.L1934:
	cmpl	$16, 16(%rbp)
	jne	.L1932
	movq	208(%rsp), %rdx
	movq	160(%rsp), %rax
	movl	272(%rsp), %r13d
	addq	24(%rdx), %rax
	testl	%r13d, %r13d
	je	.L1932
.L2077:
	movslq	%r15d, %rdi
	movl	272(%rsp), %esi
	leaq	1(%rax,%rdi), %rcx
	movslq	%r14d, %rdx
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L2025:
	incl	%eax
	movb	$-1, (%rcx)
	addq	%rdx, %rcx
	cmpl	%eax, %esi
	ja	.L2025
	jmp	.L1932
.L1938:
	movl	140(%rsp), %edi
	testl	%edi, %edi
	je	.L1943
	movslq	%r15d, %rdx
	movq	%rdx, 240(%rsp)
	movslq	%r14d, %rdx
	movq	%rdx, 128(%rsp)
	movl	%r14d, %edx
	negl	%edx
	movslq	%edx, %rdx
	leaq	(%rax,%rdx), %r11
	incq	%rax
	movq	%rax, 256(%rsp)
	leal	-1(%r15), %eax
	movl	%eax, 120(%rsp)
	movl	%r15d, %eax
	shrl	$5, %eax
	decl	%eax
	incq	%rax
	salq	$5, %rax
	movq	%rax, 80(%rsp)
	movl	%r15d, %eax
	andl	$-32, %eax
	movl	%eax, 88(%rsp)
	movl	%r15d, %eax
	andl	$31, %eax
	movq	%rdx, 216(%rsp)
	movl	%eax, 104(%rsp)
	notq	%rdx
	decl	%eax
	movl	%edi, 108(%rsp)
	movq	%rdx, 96(%rsp)
	movl	%eax, 76(%rsp)
	movq	%rbx, 56(%rsp)
	movl	%r15d, 224(%rsp)
	movl	%r14d, 68(%rsp)
	movq	%r13, %r15
	movq	%r11, %r14
	movq	%rbx, %r13
	.p2align 4,,10
	.p2align 3
.L1989:
	movq	256(%rsp), %rax
	leaq	-1(%rax), %rdi
	movl	224(%rsp), %eax
	testl	%eax, %eax
	je	.L2001
	movl	120(%rsp), %ebx
	cmpq	$30, 96(%rsp)
	seta	%al
	cmpl	$14, %ebx
	seta	%dl
	andl	%edx, %eax
	movq	%r15, %rdx
	subq	256(%rsp), %rdx
	cmpq	$30, %rdx
	seta	%dl
	andl	%edx, %eax
	leaq	1(%r14), %rcx
	movq	%r15, %rdx
	subq	%rcx, %rdx
	cmpq	$30, %rdx
	seta	%dl
	testb	%dl, %al
	je	.L1990
	leaq	1(%r13), %rdx
	movq	%r15, %rax
	subq	%rdx, %rax
	cmpq	$30, %rax
	jbe	.L1990
	cmpl	$30, %ebx
	jbe	.L2096
	movq	216(%rsp), %rax
	movq	80(%rsp), %rcx
	leaq	(%r15,%rax), %rdx
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L1992:
	vmovdqu	(%r14,%rax), %ymm5
	vpmovzxbw	(%rdi,%rax), %ymm2
	vpmovzxbw	(%rdx,%rax), %ymm13
	vextracti128	$0x1, %ymm5, %xmm0
	vmovdqu	(%rdi,%rax), %ymm5
	vpmovzxbw	(%r14,%rax), %ymm1
	vpmovzxwd	%xmm2, %ymm4
	vpmovzxwd	%xmm13, %ymm15
	vpmovzxbw	%xmm0, %ymm0
	vextracti128	$0x1, %ymm5, %xmm10
	vmovdqu	(%rdx,%rax), %ymm5
	vpmovzxwd	%xmm1, %ymm9
	vpmovzxwd	%xmm0, %ymm3
	vpaddd	%ymm15, %ymm4, %ymm8
	vextracti128	$0x1, %ymm0, %xmm0
	vextracti128	$0x1, %ymm2, %xmm2
	vextracti128	$0x1, %ymm13, %xmm13
	vpsubd	%ymm9, %ymm8, %ymm8
	vpmovzxwd	%xmm0, %ymm7
	vpmovzxwd	%xmm2, %ymm2
	vextracti128	$0x1, %ymm5, %xmm11
	vpmovzxwd	%xmm13, %ymm13
	vextracti128	$0x1, %ymm1, %xmm1
	vmovdqa	%ymm7, 544(%rsp)
	vpmovzxwd	%xmm1, %ymm1
	vpaddd	%ymm13, %ymm2, %ymm7
	vpmovzxbw	%xmm10, %ymm10
	vpmovzxbw	%xmm11, %ymm11
	vpsubd	%ymm15, %ymm8, %ymm15
	vpsubd	%ymm4, %ymm8, %ymm4
	vpsubd	%ymm9, %ymm8, %ymm8
	vpsubd	%ymm1, %ymm7, %ymm7
	vpmovzxwd	%xmm10, %ymm0
	vpmovzxwd	%xmm11, %ymm12
	vpabsd	%ymm4, %ymm4
	vpabsd	%ymm8, %ymm8
	vextracti128	$0x1, %ymm10, %xmm10
	vextracti128	$0x1, %ymm11, %xmm11
	vpmovzxwd	%xmm10, %ymm10
	vpmovzxwd	%xmm11, %ymm11
	vpabsd	%ymm15, %ymm15
	vpsubd	%ymm13, %ymm7, %ymm13
	vpsubd	%ymm2, %ymm7, %ymm2
	vpsubd	%ymm1, %ymm7, %ymm7
	vpminsd	%ymm8, %ymm4, %ymm1
	vpaddd	%ymm11, %ymm10, %ymm5
	vmovdqa	%ymm15, 416(%rsp)
	vpcmpgtd	%ymm1, %ymm15, %ymm15
	vpsubd	544(%rsp), %ymm5, %ymm5
	vpaddd	%ymm12, %ymm0, %ymm6
	vpabsd	%ymm2, %ymm2
	vpabsd	%ymm7, %ymm7
	vpminsd	%ymm7, %ymm2, %ymm9
	vpsubd	%ymm3, %ymm6, %ymm6
	vpabsd	%ymm13, %ymm13
	vpsubd	%ymm12, %ymm6, %ymm12
	vpsubd	%ymm11, %ymm5, %ymm11
	vpsubd	%ymm0, %ymm6, %ymm0
	vpsubd	%ymm10, %ymm5, %ymm10
	vpsubd	%ymm3, %ymm6, %ymm6
	vpsubd	544(%rsp), %ymm5, %ymm5
	vmovdqa	%ymm15, 544(%rsp)
	vpcmpgtd	%ymm9, %ymm13, %ymm15
	vpabsd	%ymm0, %ymm0
	vpabsd	%ymm6, %ymm3
	vpabsd	%ymm12, %ymm12
	vmovdqa	%ymm3, 384(%rsp)
	vpminsd	%ymm3, %ymm0, %ymm3
	vmovdqa	%ymm15, 512(%rsp)
	vpcmpgtd	%ymm3, %ymm12, %ymm15
	vpabsd	%ymm10, %ymm10
	vpabsd	%ymm5, %ymm5
	vpminsd	%ymm5, %ymm10, %ymm6
	vpabsd	%ymm11, %ymm11
	vmovdqa	%ymm15, 480(%rsp)
	vpcmpgtd	%ymm6, %ymm11, %ymm15
	vpcmpgtd	%ymm5, %ymm10, %ymm5
	vmovdqa	%ymm15, 448(%rsp)
	vpcmpeqd	%ymm1, %ymm4, %ymm15
	vpcmpgtd	%ymm8, %ymm4, %ymm4
	vpand	448(%rsp), %ymm5, %ymm5
	vpand	544(%rsp), %ymm15, %ymm15
	vpand	544(%rsp), %ymm4, %ymm4
	vmovdqa	%ymm15, 352(%rsp)
	vpcmpeqd	%ymm9, %ymm2, %ymm15
	vpcmpgtd	%ymm7, %ymm2, %ymm2
	vmovdqa	416(%rsp), %ymm7
	vpand	512(%rsp), %ymm15, %ymm15
	vpminsd	%ymm7, %ymm1, %ymm1
	vmovdqa	%ymm15, 320(%rsp)
	vpcmpeqd	%ymm3, %ymm0, %ymm15
	vpminsd	%ymm9, %ymm13, %ymm9
	vpminsd	%ymm3, %ymm12, %ymm3
	vpand	480(%rsp), %ymm15, %ymm15
	vpcmpeqd	%ymm7, %ymm1, %ymm1
	vmovdqa	%ymm15, 288(%rsp)
	vpcmpeqd	%ymm6, %ymm10, %ymm15
	vpminsd	%ymm6, %ymm11, %ymm6
	vpcmpeqd	%ymm9, %ymm13, %ymm9
	vpcmpeqd	%ymm3, %ymm12, %ymm3
	vpcmpeqd	%ymm6, %ymm11, %ymm6
	vpcmpgtd	384(%rsp), %ymm0, %ymm0
	vpand	%ymm1, %ymm14, %ymm1
	vpand	%ymm9, %ymm14, %ymm9
	vpand	%ymm3, %ymm14, %ymm3
	vpand	%ymm6, %ymm14, %ymm6
	vpackusdw	%ymm9, %ymm1, %ymm1
	vpackusdw	%ymm6, %ymm3, %ymm3
	vpand	512(%rsp), %ymm2, %ymm2
	vpand	480(%rsp), %ymm0, %ymm0
	vpermq	$216, %ymm1, %ymm1
	vpermq	$216, %ymm3, %ymm3
	vpand	.LC2(%rip), %ymm3, %ymm3
	vpand	.LC2(%rip), %ymm1, %ymm1
	vpand	%ymm2, %ymm14, %ymm2
	vpand	%ymm0, %ymm14, %ymm0
	vpand	%ymm4, %ymm14, %ymm4
	vpand	%ymm5, %ymm14, %ymm5
	vpackuswb	%ymm3, %ymm1, %ymm1
	vpackusdw	%ymm2, %ymm4, %ymm4
	vmovdqu	(%r14,%rax), %ymm3
	vpackusdw	%ymm5, %ymm0, %ymm2
	vpermq	$216, %ymm1, %ymm1
	vpermq	$216, %ymm4, %ymm4
	vpermq	$216, %ymm2, %ymm2
	vpblendvb	%ymm1, (%rdx,%rax), %ymm3, %ymm1
	vpand	448(%rsp), %ymm15, %ymm15
	vpand	.LC2(%rip), %ymm4, %ymm0
	vpand	.LC2(%rip), %ymm2, %ymm2
	vpand	%ymm15, %ymm14, %ymm15
	vpackuswb	%ymm2, %ymm0, %ymm0
	vpermq	$216, %ymm0, %ymm0
	vpand	320(%rsp), %ymm14, %ymm2
	vpblendvb	%ymm0, %ymm3, %ymm1, %ymm0
	vpand	352(%rsp), %ymm14, %ymm1
	vpackusdw	%ymm2, %ymm1, %ymm1
	vpand	288(%rsp), %ymm14, %ymm2
	vpermq	$216, %ymm1, %ymm1
	vpackusdw	%ymm15, %ymm2, %ymm2
	vpermq	$216, %ymm2, %ymm2
	vpand	.LC2(%rip), %ymm1, %ymm1
	vpand	.LC2(%rip), %ymm2, %ymm2
	vpackuswb	%ymm2, %ymm1, %ymm1
	vpermq	$216, %ymm1, %ymm1
	vpblendvb	%ymm1, (%rdi,%rax), %ymm0, %ymm0
	vpaddb	0(%r13,%rax), %ymm0, %ymm0
	vmovdqu	%ymm0, (%r15,%rax)
	addq	$32, %rax
	cmpq	%rax, %rcx
	jne	.L1992
	movl	88(%rsp), %edx
	movl	%edx, %eax
	cmpl	%eax, 224(%rsp)
	je	.L2001
	cmpl	$14, 76(%rsp)
	movl	104(%rsp), %esi
	jbe	.L1994
.L1991:
	movq	216(%rsp), %rbx
	vmovdqu	(%rdi,%rax), %xmm7
	leaq	(%rbx,%rax), %rcx
	vmovdqu	(%rdi,%rcx), %xmm5
	vpmovzxbw	%xmm7, %xmm2
	vmovdqu	(%rdi,%rax), %xmm7
	vpsrldq	$8, %xmm5, %xmm0
	vpmovzxbw	%xmm0, %xmm0
	vpsrldq	$8, %xmm7, %xmm1
	vmovdqu	(%r15,%rcx), %xmm7
	vpmovzxwd	%xmm0, %xmm9
	vpsrldq	$8, %xmm0, %xmm0
	vpmovzxwd	%xmm0, %xmm6
	vpmovzxbw	%xmm7, %xmm13
	vpsrldq	$8, %xmm7, %xmm11
	vmovdqa	%xmm6, 544(%rsp)
	vpmovzxbw	%xmm5, %xmm8
	vpmovzxwd	%xmm2, %xmm6
	vpmovzxwd	%xmm13, %xmm15
	vpmovzxbw	%xmm1, %xmm1
	vpmovzxbw	%xmm11, %xmm11
	vpmovzxwd	%xmm8, %xmm10
	vpmovzxwd	%xmm1, %xmm3
	vpmovzxwd	%xmm11, %xmm12
	vmovdqa	%xmm7, 176(%rsp)
	vpsrldq	$8, %xmm2, %xmm2
	vpaddd	%xmm15, %xmm6, %xmm7
	vpsrldq	$8, %xmm1, %xmm1
	vpsrldq	$8, %xmm13, %xmm13
	vpsrldq	$8, %xmm11, %xmm11
	vpsubd	%xmm10, %xmm7, %xmm7
	vpmovzxwd	%xmm2, %xmm2
	vpmovzxwd	%xmm1, %xmm1
	vpmovzxwd	%xmm13, %xmm13
	vpmovzxwd	%xmm11, %xmm11
	vpsrldq	$8, %xmm8, %xmm8
	vpmovzxwd	%xmm8, %xmm8
	vpaddd	%xmm11, %xmm1, %xmm0
	vmovdqa	%xmm5, 192(%rsp)
	vpsubd	%xmm15, %xmm7, %xmm15
	vpaddd	%xmm13, %xmm2, %xmm5
	vpsubd	%xmm6, %xmm7, %xmm6
	vpsubd	%xmm10, %xmm7, %xmm7
	vpsubd	544(%rsp), %xmm0, %xmm0
	vpsubd	%xmm8, %xmm5, %xmm5
	vpabsd	%xmm6, %xmm6
	vpabsd	%xmm7, %xmm7
	vpabsd	%xmm15, %xmm15
	vpsubd	%xmm13, %xmm5, %xmm13
	vpsubd	%xmm2, %xmm5, %xmm2
	vpsubd	%xmm8, %xmm5, %xmm5
	vpminsd	%xmm7, %xmm6, %xmm8
	vmovdqa	%xmm15, 448(%rsp)
	vpsubd	%xmm11, %xmm0, %xmm11
	vpcmpgtd	%xmm8, %xmm15, %xmm15
	vpsubd	%xmm1, %xmm0, %xmm1
	vpsubd	544(%rsp), %xmm0, %xmm0
	vpaddd	%xmm12, %xmm3, %xmm4
	vpabsd	%xmm2, %xmm2
	vpabsd	%xmm5, %xmm5
	vpsubd	%xmm9, %xmm4, %xmm4
	vpabsd	%xmm0, %xmm10
	vpabsd	%xmm13, %xmm13
	vpminsd	%xmm5, %xmm2, %xmm0
	vmovdqa	%xmm15, 544(%rsp)
	vpsubd	%xmm12, %xmm4, %xmm12
	vpcmpgtd	%xmm0, %xmm13, %xmm15
	vpsubd	%xmm3, %xmm4, %xmm3
	vpsubd	%xmm9, %xmm4, %xmm4
	vpabsd	%xmm3, %xmm3
	vpabsd	%xmm4, %xmm9
	vpminsd	%xmm9, %xmm3, %xmm4
	vpabsd	%xmm12, %xmm12
	vmovdqa	%xmm15, 512(%rsp)
	vpcmpgtd	%xmm4, %xmm12, %xmm15
	vpabsd	%xmm1, %xmm1
	vpabsd	%xmm11, %xmm11
	vmovdqa	%xmm15, 480(%rsp)
	vpcmpeqd	%xmm8, %xmm6, %xmm15
	vmovdqa	%xmm9, 416(%rsp)
	vmovdqa	%xmm10, 384(%rsp)
	vpand	544(%rsp), %xmm15, %xmm15
	vpminsd	%xmm10, %xmm1, %xmm9
	vmovdqa	%xmm15, 352(%rsp)
	vpcmpeqd	%xmm0, %xmm2, %xmm15
	vpcmpgtd	%xmm9, %xmm11, %xmm10
	vpminsd	%xmm0, %xmm13, %xmm0
	vpand	512(%rsp), %xmm15, %xmm15
	vpcmpeqd	%xmm0, %xmm13, %xmm0
	vmovdqa	%xmm15, 320(%rsp)
	vpcmpeqd	%xmm4, %xmm3, %xmm15
	vpcmpgtd	%xmm5, %xmm2, %xmm2
	vpcmpgtd	416(%rsp), %xmm3, %xmm3
	vpand	480(%rsp), %xmm15, %xmm15
	vpcmpgtd	%xmm7, %xmm6, %xmm6
	vmovdqa	%xmm15, 288(%rsp)
	vpcmpeqd	%xmm9, %xmm1, %xmm15
	vpcmpgtd	384(%rsp), %xmm1, %xmm1
	vpminsd	%xmm4, %xmm12, %xmm4
	vpand	%xmm10, %xmm15, %xmm15
	vpand	%xmm10, %xmm1, %xmm1
	vmovdqa	448(%rsp), %xmm10
	vpminsd	%xmm9, %xmm11, %xmm9
	vpminsd	%xmm10, %xmm8, %xmm8
	vpcmpeqd	%xmm10, %xmm8, %xmm8
	vpcmpeqd	%xmm4, %xmm12, %xmm4
	vpcmpeqd	%xmm9, %xmm11, %xmm5
	vpand	.LC20(%rip), %xmm8, %xmm8
	vpand	.LC20(%rip), %xmm0, %xmm0
	vpand	544(%rsp), %xmm6, %xmm6
	vpand	512(%rsp), %xmm2, %xmm2
	vpand	480(%rsp), %xmm3, %xmm3
	vpand	.LC20(%rip), %xmm5, %xmm5
	vpand	.LC20(%rip), %xmm4, %xmm4
	vpackusdw	%xmm0, %xmm8, %xmm0
	vpand	.LC5(%rip), %xmm0, %xmm0
	vpand	.LC20(%rip), %xmm2, %xmm2
	vpand	.LC20(%rip), %xmm1, %xmm1
	vpand	.LC20(%rip), %xmm6, %xmm6
	vpand	.LC20(%rip), %xmm3, %xmm3
	vpackusdw	%xmm5, %xmm4, %xmm4
	vpackusdw	%xmm2, %xmm6, %xmm6
	vpand	.LC5(%rip), %xmm4, %xmm4
	vpackusdw	%xmm1, %xmm3, %xmm3
	vmovdqa	192(%rsp), %xmm5
	vpand	.LC5(%rip), %xmm6, %xmm1
	vpand	.LC5(%rip), %xmm3, %xmm3
	vpackuswb	%xmm4, %xmm0, %xmm0
	vmovdqa	320(%rsp), %xmm6
	vmovdqa	352(%rsp), %xmm4
	vpblendvb	%xmm0, 176(%rsp), %xmm5, %xmm0
	vpackuswb	%xmm3, %xmm1, %xmm1
	vpand	.LC20(%rip), %xmm6, %xmm2
	vpblendvb	%xmm1, %xmm5, %xmm0, %xmm1
	vpand	.LC20(%rip), %xmm4, %xmm0
	vmovdqa	288(%rsp), %xmm4
	vpackusdw	%xmm2, %xmm0, %xmm0
	vpand	.LC20(%rip), %xmm15, %xmm15
	vpand	.LC20(%rip), %xmm4, %xmm2
	vpand	.LC5(%rip), %xmm0, %xmm0
	vpackusdw	%xmm15, %xmm2, %xmm2
	vpand	.LC5(%rip), %xmm2, %xmm2
	vpackuswb	%xmm2, %xmm0, %xmm0
	vpblendvb	%xmm0, (%rdi,%rax), %xmm1, %xmm0
	vpaddb	0(%r13,%rax), %xmm0, %xmm0
	vmovdqu	%xmm0, (%r15,%rax)
	movl	%esi, %eax
	andl	$-16, %eax
	addl	%eax, %edx
	cmpl	%esi, %eax
	je	.L2001
.L1994:
	movq	128(%rsp), %rbx
	movq	256(%rsp), %rax
	movslq	%edx, %rdx
	subq	%rbx, %rax
	movq	%rax, 544(%rsp)
	movq	%r15, %rax
	subq	%rbx, %rax
	movq	%rax, 512(%rsp)
	jmp	.L1997
	.p2align 4,,10
	.p2align 3
.L1996:
	cmpl	%ecx, %esi
	cmovle	%r11d, %r8d
.L1998:
	addl	%r12d, %r8d
	movb	%r8b, (%r15,%rdx)
	incq	%rdx
	cmpl	%edx, 224(%rsp)
	jle	.L2001
.L1997:
	movq	544(%rsp), %rax
	movzbl	(%rdi,%rdx), %ecx
	movzbl	-1(%rdx,%rax), %r10d
	movq	512(%rsp), %rax
	movl	%ecx, %r11d
	movzbl	(%rax,%rdx), %r9d
	movl	%r10d, %r8d
	leal	(%rcx,%r9), %eax
	subl	%r10d, %eax
	movl	%eax, %esi
	subl	%ecx, %esi
	movl	%esi, %ecx
	sarl	$31, %ecx
	xorl	%ecx, %esi
	subl	%ecx, %esi
	movl	%eax, %ecx
	subl	%r10d, %ecx
	subl	%r9d, %eax
	movl	%ecx, %r10d
	sarl	$31, %r10d
	movl	%r9d, %ebx
	movl	%eax, %r9d
	sarl	$31, %r9d
	xorl	%r10d, %ecx
	xorl	%r9d, %eax
	subl	%r10d, %ecx
	subl	%r9d, %eax
	cmpl	%ecx, %esi
	movl	%ecx, %r9d
	cmovle	%esi, %r9d
	movzbl	0(%r13,%rdx), %r12d
	cmpl	%r9d, %eax
	jg	.L1996
	movl	%ebx, %r8d
	jmp	.L1998
.L1939:
	movl	140(%rsp), %r12d
	testl	%r12d, %r12d
	je	.L1943
	leal	-1(%r15), %ecx
	movl	%ecx, 480(%rsp)
	movl	%r15d, %ecx
	shrl	$5, %ecx
	movl	%r14d, %edx
	negl	%edx
	leal	-1(%rcx), %r9d
	movslq	%edx, %rdi
	incq	%r9
	movslq	%r15d, %rsi
	leaq	0(%r13,%rdi), %rdx
	movq	%rdi, 512(%rsp)
	salq	$5, %r9
	notq	%rdi
	movq	%rsi, 240(%rsp)
	movq	%rdi, 448(%rsp)
	movq	%r9, 544(%rsp)
	movl	%r15d, %r13d
	movq	%rbx, 384(%rsp)
	movq	%rbx, %rcx
	movslq	%r14d, %r11
	andl	$-32, %r13d
	movq	%rsi, %rbx
	.p2align 4,,10
	.p2align 3
.L1978:
	movq	%rdx, %r8
	addq	%r11, %rdx
	testl	%r15d, %r15d
	je	.L1988
	movl	480(%rsp), %r9d
	cmpq	$30, 448(%rsp)
	seta	%sil
	cmpl	$14, %r9d
	seta	%dil
	andl	%edi, %esi
	leaq	1(%rax), %r10
	movq	%rdx, %rdi
	subq	%r10, %rdi
	cmpq	$30, %rdi
	seta	%dil
	testb	%dil, %sil
	je	.L1979
	leaq	1(%rcx), %rdi
	movq	%rdx, %rsi
	subq	%rdi, %rsi
	cmpq	$30, %rsi
	jbe	.L1979
	cmpl	$30, %r9d
	jbe	.L2094
	movq	544(%rsp), %r9
	addq	$0, %r8
	xorl	%esi, %esi
	.p2align 4,,10
	.p2align 3
.L1981:
	vmovdqu	(%rax,%rsi), %ymm0
	vmovdqu	(%r8,%rsi), %ymm2
	vpand	%ymm2, %ymm0, %ymm1
	vpand	.LC15(%rip), %ymm1, %ymm1
	vpsrlw	$1, %ymm0, %ymm0
	vpsrlw	$1, %ymm2, %ymm2
	vpand	.LC16(%rip), %ymm0, %ymm0
	vpand	.LC16(%rip), %ymm2, %ymm2
	vpaddb	(%rcx,%rsi), %ymm1, %ymm1
	vpaddb	%ymm2, %ymm0, %ymm0
	vpaddb	%ymm0, %ymm1, %ymm0
	vmovdqu	%ymm0, (%rdx,%rsi)
	addq	$32, %rsi
	cmpq	%rsi, %r9
	jne	.L1981
	movq	%r9, 544(%rsp)
	cmpl	%r13d, %r15d
	je	.L1988
	movl	%r15d, %r8d
	subl	%r13d, %r8d
	leal	-1(%r8), %esi
	cmpl	$14, %esi
	jbe	.L2095
	movl	%r13d, %edi
	movl	%r13d, %esi
.L1980:
	vmovdqu	(%rax,%rdi), %xmm0
	movq	512(%rsp), %r9
	leaq	(%rdx,%rdi), %r10
	vmovdqu	(%r10,%r9), %xmm2
	vpsrlw	$1, %xmm0, %xmm1
	vpand	.LC18(%rip), %xmm0, %xmm0
	vpand	.LC17(%rip), %xmm1, %xmm1
	vpand	%xmm2, %xmm0, %xmm0
	vpsrlw	$1, %xmm2, %xmm2
	vpand	.LC17(%rip), %xmm2, %xmm2
	vpaddb	(%rcx,%rdi), %xmm1, %xmm1
	vpaddb	%xmm2, %xmm0, %xmm0
	vpaddb	%xmm0, %xmm1, %xmm0
	vmovdqu	%xmm0, (%rdx,%rdi)
	movl	%r8d, %edi
	andl	$-16, %edi
	addl	%edi, %esi
	cmpl	%r8d, %edi
	je	.L1988
.L1983:
	movl	%esi, %edi
	subl	%r14d, %edi
	movslq	%esi, %r8
	movslq	%edi, %rdi
	movzbl	(%rdx,%rdi), %edi
	movzbl	(%rax,%r8), %r10d
	addl	%r10d, %edi
	sarl	%edi
	addb	(%rcx,%r8), %dil
	movb	%dil, (%rdx,%r8)
	leal	1(%rsi), %edi
	cmpl	%edi, %r15d
	jle	.L1988
	movslq	%edi, %r8
	subl	%r14d, %edi
	movslq	%edi, %rdi
	movzbl	(%rdx,%rdi), %edi
	movzbl	(%rax,%r8), %r10d
	addl	%r10d, %edi
	sarl	%edi
	addb	(%rcx,%r8), %dil
	movb	%dil, (%rdx,%r8)
	leal	2(%rsi), %edi
	cmpl	%edi, %r15d
	jle	.L1988
	movslq	%edi, %r8
	subl	%r14d, %edi
	movslq	%edi, %rdi
	movzbl	(%rdx,%rdi), %edi
	movzbl	(%rax,%r8), %r10d
	addl	%r10d, %edi
	sarl	%edi
	addb	(%rcx,%r8), %dil
	movb	%dil, (%rdx,%r8)
	leal	3(%rsi), %edi
	cmpl	%edi, %r15d
	jle	.L1988
	movslq	%edi, %r8
	subl	%r14d, %edi
	movslq	%edi, %rdi
	movzbl	(%rdx,%rdi), %edi
	movzbl	(%rax,%r8), %r10d
	addl	%r10d, %edi
	sarl	%edi
	addb	(%rcx,%r8), %dil
	movb	%dil, (%rdx,%r8)
	leal	4(%rsi), %edi
	cmpl	%edi, %r15d
	jle	.L1988
	movslq	%edi, %r8
	subl	%r14d, %edi
	movslq	%edi, %rdi
	movzbl	(%rdx,%rdi), %edi
	movzbl	(%rax,%r8), %r10d
	addl	%r10d, %edi
	sarl	%edi
	addb	(%rcx,%r8), %dil
	movb	%dil, (%rdx,%r8)
	leal	5(%rsi), %edi
	cmpl	%edi, %r15d
	jle	.L1988
	movslq	%edi, %r8
	subl	%r14d, %edi
	movslq	%edi, %rdi
	movzbl	(%rdx,%rdi), %edi
	movzbl	(%rax,%r8), %r10d
	addl	%r10d, %edi
	sarl	%edi
	addb	(%rcx,%r8), %dil
	movb	%dil, (%rdx,%r8)
	leal	6(%rsi), %edi
	cmpl	%edi, %r15d
	jle	.L1988
	movslq	%edi, %r8
	subl	%r14d, %edi
	movslq	%edi, %rdi
	movzbl	(%rdx,%rdi), %edi
	movzbl	(%rax,%r8), %r10d
	addl	%r10d, %edi
	sarl	%edi
	addb	(%rcx,%r8), %dil
	movb	%dil, (%rdx,%r8)
	leal	7(%rsi), %edi
	cmpl	%edi, %r15d
	jle	.L1988
	movslq	%edi, %r8
	subl	%r14d, %edi
	movslq	%edi, %rdi
	movzbl	(%rdx,%rdi), %edi
	movzbl	(%rax,%r8), %r10d
	addl	%r10d, %edi
	sarl	%edi
	addb	(%rcx,%r8), %dil
	movb	%dil, (%rdx,%r8)
	leal	8(%rsi), %edi
	cmpl	%edi, %r15d
	jle	.L1988
	movslq	%edi, %r8
	subl	%r14d, %edi
	movslq	%edi, %rdi
	movzbl	(%rdx,%rdi), %edi
	movzbl	(%rax,%r8), %r10d
	addl	%r10d, %edi
	sarl	%edi
	addb	(%rcx,%r8), %dil
	movb	%dil, (%rdx,%r8)
	leal	9(%rsi), %edi
	cmpl	%edi, %r15d
	jle	.L1988
	movslq	%edi, %r8
	subl	%r14d, %edi
	movslq	%edi, %rdi
	movzbl	(%rdx,%rdi), %edi
	movzbl	(%rax,%r8), %r10d
	addl	%r10d, %edi
	sarl	%edi
	addb	(%rcx,%r8), %dil
	movb	%dil, (%rdx,%r8)
	leal	10(%rsi), %edi
	cmpl	%edi, %r15d
	jle	.L1988
	movslq	%edi, %r8
	subl	%r14d, %edi
	movslq	%edi, %rdi
	movzbl	(%rdx,%rdi), %edi
	movzbl	(%rax,%r8), %r10d
	addl	%r10d, %edi
	sarl	%edi
	addb	(%rcx,%r8), %dil
	movb	%dil, (%rdx,%r8)
	leal	11(%rsi), %edi
	cmpl	%edi, %r15d
	jle	.L1988
	movslq	%edi, %r8
	subl	%r14d, %edi
	movslq	%edi, %rdi
	movzbl	(%rdx,%rdi), %edi
	movzbl	(%rax,%r8), %r10d
	addl	%r10d, %edi
	sarl	%edi
	addb	(%rcx,%r8), %dil
	movb	%dil, (%rdx,%r8)
	leal	12(%rsi), %edi
	cmpl	%edi, %r15d
	jle	.L1988
	movslq	%edi, %r8
	subl	%r14d, %edi
	movslq	%edi, %rdi
	movzbl	(%rdx,%rdi), %edi
	movzbl	(%rax,%r8), %r10d
	addl	%r10d, %edi
	sarl	%edi
	addb	(%rcx,%r8), %dil
	movb	%dil, (%rdx,%r8)
	leal	13(%rsi), %edi
	cmpl	%edi, %r15d
	jle	.L1988
	movslq	%edi, %r8
	subl	%r14d, %edi
	movslq	%edi, %rdi
	movzbl	(%rdx,%rdi), %edi
	movzbl	(%rax,%r8), %r10d
	addl	$14, %esi
	addl	%r10d, %edi
	sarl	%edi
	addb	(%rcx,%r8), %dil
	movb	%dil, (%rdx,%r8)
	cmpl	%esi, %r15d
	jle	.L1988
	movslq	%esi, %rdi
	subl	%r14d, %esi
	movslq	%esi, %rsi
	movzbl	(%rdx,%rsi), %esi
	movzbl	(%rax,%rdi), %r8d
	addl	%r8d, %esi
	sarl	%esi
	addb	(%rcx,%rdi), %sil
	movb	%sil, (%rdx,%rdi)
	.p2align 4,,10
	.p2align 3
.L1988:
	movb	$-1, (%rdx,%rbx)
	addq	%rbx, %rcx
	addq	%r11, %rax
	decl	%r12d
	jne	.L1978
	movl	140(%rsp), %eax
	movq	384(%rsp), %rbx
	imulq	240(%rsp), %rax
	addq	%rax, %rbx
	jmp	.L1934
.L1940:
	movl	140(%rsp), %r9d
	testl	%r9d, %r9d
	je	.L1943
	movl	%r15d, %edi
	andl	$31, %edi
	movl	%r15d, %edx
	movslq	%r15d, %rcx
	shrl	$5, %edx
	movl	%edi, 544(%rsp)
	decl	%edi
	leal	-1(%rdx), %esi
	movq	%rcx, 240(%rsp)
	movl	%edi, 512(%rsp)
	leal	-1(%r15), %r12d
	incq	%rsi
	movl	%r15d, %r11d
	movl	%r14d, 480(%rsp)
	movq	%rbx, 448(%rsp)
	movslq	%r14d, %r10
	movq	%rbx, %rdx
	salq	$5, %rsi
	andl	$-32, %r11d
	movl	%r12d, %r14d
	movq	%rcx, %rbx
	.p2align 4,,10
	.p2align 3
.L1967:
	testl	%r15d, %r15d
	je	.L1977
	leaq	1(%rax), %rdi
	movq	%r13, %rcx
	subq	%rdi, %rcx
	cmpq	$30, %rcx
	leaq	1(%rdx), %r8
	movq	%r13, %rdi
	seta	%cl
	subq	%r8, %rdi
	cmpq	$30, %rdi
	seta	%dil
	testb	%dil, %cl
	je	.L1968
	cmpl	$14, %r14d
	jbe	.L1968
	cmpl	$30, %r14d
	jbe	.L2092
	xorl	%ecx, %ecx
	.p2align 4,,10
	.p2align 3
.L1970:
	vmovdqu	(%rdx,%rcx), %ymm6
	vpaddb	(%rax,%rcx), %ymm6, %ymm0
	vmovdqu	%ymm0, 0(%r13,%rcx)
	addq	$32, %rcx
	cmpq	%rcx, %rsi
	jne	.L1970
	cmpl	%r11d, %r15d
	je	.L1977
	cmpl	$14, 512(%rsp)
	movl	544(%rsp), %r8d
	jbe	.L2093
	movl	%r11d, %edi
	movl	%r11d, %ecx
.L1969:
	vmovdqu	(%rdx,%rdi), %xmm6
	vpaddb	(%rax,%rdi), %xmm6, %xmm0
	vmovdqu	%xmm0, 0(%r13,%rdi)
	movl	%r8d, %edi
	andl	$-16, %edi
	addl	%edi, %ecx
	cmpl	%edi, %r8d
	je	.L1977
.L1972:
	movslq	%ecx, %rdi
	movzbl	(%rax,%rdi), %r8d
	addb	(%rdx,%rdi), %r8b
	movb	%r8b, 0(%r13,%rdi)
	leal	1(%rcx), %edi
	cmpl	%edi, %r15d
	jle	.L1977
	movslq	%edi, %rdi
	movzbl	(%rax,%rdi), %r8d
	addb	(%rdx,%rdi), %r8b
	movb	%r8b, 0(%r13,%rdi)
	leal	2(%rcx), %edi
	cmpl	%edi, %r15d
	jle	.L1977
	movslq	%edi, %rdi
	movzbl	(%rax,%rdi), %r8d
	addb	(%rdx,%rdi), %r8b
	movb	%r8b, 0(%r13,%rdi)
	leal	3(%rcx), %edi
	cmpl	%edi, %r15d
	jle	.L1977
	movslq	%edi, %rdi
	movzbl	(%rax,%rdi), %r8d
	addb	(%rdx,%rdi), %r8b
	movb	%r8b, 0(%r13,%rdi)
	leal	4(%rcx), %edi
	cmpl	%edi, %r15d
	jle	.L1977
	movslq	%edi, %rdi
	movzbl	(%rax,%rdi), %r8d
	addb	(%rdx,%rdi), %r8b
	movb	%r8b, 0(%r13,%rdi)
	leal	5(%rcx), %edi
	cmpl	%edi, %r15d
	jle	.L1977
	movslq	%edi, %rdi
	movzbl	(%rax,%rdi), %r8d
	addb	(%rdx,%rdi), %r8b
	movb	%r8b, 0(%r13,%rdi)
	leal	6(%rcx), %edi
	cmpl	%edi, %r15d
	jle	.L1977
	movslq	%edi, %rdi
	movzbl	(%rax,%rdi), %r8d
	addb	(%rdx,%rdi), %r8b
	movb	%r8b, 0(%r13,%rdi)
	leal	7(%rcx), %edi
	cmpl	%edi, %r15d
	jle	.L1977
	movslq	%edi, %rdi
	movzbl	(%rax,%rdi), %r8d
	addb	(%rdx,%rdi), %r8b
	movb	%r8b, 0(%r13,%rdi)
	leal	8(%rcx), %edi
	cmpl	%edi, %r15d
	jle	.L1977
	movslq	%edi, %rdi
	movzbl	(%rax,%rdi), %r8d
	addb	(%rdx,%rdi), %r8b
	movb	%r8b, 0(%r13,%rdi)
	leal	9(%rcx), %edi
	cmpl	%edi, %r15d
	jle	.L1977
	movslq	%edi, %rdi
	movzbl	(%rax,%rdi), %r8d
	addb	(%rdx,%rdi), %r8b
	movb	%r8b, 0(%r13,%rdi)
	leal	10(%rcx), %edi
	cmpl	%edi, %r15d
	jle	.L1977
	movslq	%edi, %rdi
	movzbl	(%rax,%rdi), %r8d
	addb	(%rdx,%rdi), %r8b
	movb	%r8b, 0(%r13,%rdi)
	leal	11(%rcx), %edi
	cmpl	%edi, %r15d
	jle	.L1977
	movslq	%edi, %rdi
	movzbl	(%rax,%rdi), %r8d
	addb	(%rdx,%rdi), %r8b
	movb	%r8b, 0(%r13,%rdi)
	leal	12(%rcx), %edi
	cmpl	%edi, %r15d
	jle	.L1977
	movslq	%edi, %rdi
	movzbl	(%rax,%rdi), %r8d
	addb	(%rdx,%rdi), %r8b
	movb	%r8b, 0(%r13,%rdi)
	leal	13(%rcx), %edi
	cmpl	%edi, %r15d
	jle	.L1977
	movslq	%edi, %rdi
	movzbl	(%rax,%rdi), %r8d
	addl	$14, %ecx
	addb	(%rdx,%rdi), %r8b
	movb	%r8b, 0(%r13,%rdi)
	cmpl	%ecx, %r15d
	jle	.L1977
	movslq	%ecx, %rcx
	movzbl	(%rax,%rcx), %edi
	addb	(%rdx,%rcx), %dil
	movb	%dil, 0(%r13,%rcx)
	.p2align 4,,10
	.p2align 3
.L1977:
	movb	$-1, 0(%r13,%rbx)
	addq	%rbx, %rdx
	addq	%r10, %r13
	addq	%r10, %rax
	decl	%r9d
	jne	.L1967
	movl	140(%rsp), %eax
	movq	448(%rsp), %rbx
	imulq	240(%rsp), %rax
	movl	480(%rsp), %r14d
	addq	%rax, %rbx
	jmp	.L1934
.L1941:
	movl	140(%rsp), %r8d
	testl	%r8d, %r8d
	je	.L1943
	movslq	%r14d, %rax
	movq	%rax, 544(%rsp)
	movl	%r14d, %eax
	negl	%eax
	movslq	%eax, %r11
	movq	%r11, %rsi
	notq	%rsi
	movq	%rsi, 512(%rsp)
	movl	%r15d, %esi
	andl	$31, %esi
	movl	%r15d, %edx
	shrl	$5, %edx
	movl	%esi, 480(%rsp)
	movslq	%r15d, %r9
	decl	%esi
	leal	-1(%rdx), %edi
	movq	%r9, 240(%rsp)
	movl	%esi, 448(%rsp)
	movq	%rbx, 416(%rsp)
	incq	%rdi
	movl	%r15d, %r12d
	leaq	0(%r13,%r11), %rax
	salq	$5, %rdi
	leal	-1(%r15), %r13d
	andl	$-32, %r12d
	movq	%rbx, %rdx
	.p2align 4,,10
	.p2align 3
.L1956:
	movq	%rax, %rsi
	addq	544(%rsp), %rax
	testl	%r15d, %r15d
	je	.L1966
	cmpq	$30, 512(%rsp)
	seta	%r10b
	cmpl	$14, %r13d
	seta	%cl
	testb	%cl, %r10b
	je	.L1957
	leaq	1(%rdx), %r10
	movq	%rax, %rcx
	subq	%r10, %rcx
	cmpq	$30, %rcx
	jbe	.L1957
	cmpl	$30, %r13d
	jbe	.L2090
	addq	$0, %rsi
	xorl	%ecx, %ecx
	.p2align 4,,10
	.p2align 3
.L1959:
	vmovdqu	(%rdx,%rcx), %ymm7
	vpaddb	(%rsi,%rcx), %ymm7, %ymm0
	vmovdqu	%ymm0, (%rax,%rcx)
	addq	$32, %rcx
	cmpq	%rcx, %rdi
	jne	.L1959
	cmpl	%r12d, %r15d
	je	.L1966
	cmpl	$14, 448(%rsp)
	movl	480(%rsp), %r10d
	jbe	.L2091
	movl	%r12d, %esi
	movl	%r12d, %ecx
.L1958:
	leaq	(%rax,%rsi), %rbx
	vmovdqu	(%rbx,%r11), %xmm5
	vpaddb	(%rdx,%rsi), %xmm5, %xmm0
	vmovdqu	%xmm0, (%rax,%rsi)
	movl	%r10d, %esi
	andl	$-16, %esi
	addl	%esi, %ecx
	cmpl	%r10d, %esi
	je	.L1966
.L1961:
	movslq	%ecx, %r10
	movl	%ecx, %esi
	movzbl	(%rdx,%r10), %ebx
	subl	%r14d, %esi
	movslq	%esi, %rsi
	addb	(%rax,%rsi), %bl
	leal	1(%rcx), %esi
	movb	%bl, (%rax,%r10)
	cmpl	%esi, %r15d
	jle	.L1966
	movslq	%esi, %r10
	movzbl	(%rdx,%r10), %ebx
	subl	%r14d, %esi
	movslq	%esi, %rsi
	addb	(%rax,%rsi), %bl
	leal	2(%rcx), %esi
	movb	%bl, (%rax,%r10)
	cmpl	%esi, %r15d
	jle	.L1966
	movslq	%esi, %r10
	movzbl	(%rdx,%r10), %ebx
	subl	%r14d, %esi
	movslq	%esi, %rsi
	addb	(%rax,%rsi), %bl
	leal	3(%rcx), %esi
	movb	%bl, (%rax,%r10)
	cmpl	%esi, %r15d
	jle	.L1966
	movslq	%esi, %r10
	movzbl	(%rdx,%r10), %ebx
	subl	%r14d, %esi
	movslq	%esi, %rsi
	addb	(%rax,%rsi), %bl
	leal	4(%rcx), %esi
	movb	%bl, (%rax,%r10)
	cmpl	%esi, %r15d
	jle	.L1966
	movslq	%esi, %r10
	movzbl	(%rdx,%r10), %ebx
	subl	%r14d, %esi
	movslq	%esi, %rsi
	addb	(%rax,%rsi), %bl
	leal	5(%rcx), %esi
	movb	%bl, (%rax,%r10)
	cmpl	%esi, %r15d
	jle	.L1966
	movslq	%esi, %r10
	movzbl	(%rdx,%r10), %ebx
	subl	%r14d, %esi
	movslq	%esi, %rsi
	addb	(%rax,%rsi), %bl
	leal	6(%rcx), %esi
	movb	%bl, (%rax,%r10)
	cmpl	%esi, %r15d
	jle	.L1966
	movslq	%esi, %r10
	movzbl	(%rdx,%r10), %ebx
	subl	%r14d, %esi
	movslq	%esi, %rsi
	addb	(%rax,%rsi), %bl
	leal	7(%rcx), %esi
	movb	%bl, (%rax,%r10)
	cmpl	%esi, %r15d
	jle	.L1966
	movslq	%esi, %r10
	movzbl	(%rdx,%r10), %ebx
	subl	%r14d, %esi
	movslq	%esi, %rsi
	addb	(%rax,%rsi), %bl
	leal	8(%rcx), %esi
	movb	%bl, (%rax,%r10)
	cmpl	%esi, %r15d
	jle	.L1966
	movslq	%esi, %r10
	movzbl	(%rdx,%r10), %ebx
	subl	%r14d, %esi
	movslq	%esi, %rsi
	addb	(%rax,%rsi), %bl
	leal	9(%rcx), %esi
	movb	%bl, (%rax,%r10)
	cmpl	%esi, %r15d
	jle	.L1966
	movslq	%esi, %r10
	movzbl	(%rdx,%r10), %ebx
	subl	%r14d, %esi
	movslq	%esi, %rsi
	addb	(%rax,%rsi), %bl
	leal	10(%rcx), %esi
	movb	%bl, (%rax,%r10)
	cmpl	%esi, %r15d
	jle	.L1966
	movslq	%esi, %r10
	movzbl	(%rdx,%r10), %ebx
	subl	%r14d, %esi
	movslq	%esi, %rsi
	addb	(%rax,%rsi), %bl
	leal	11(%rcx), %esi
	movb	%bl, (%rax,%r10)
	cmpl	%esi, %r15d
	jle	.L1966
	movslq	%esi, %r10
	movzbl	(%rdx,%r10), %ebx
	subl	%r14d, %esi
	movslq	%esi, %rsi
	addb	(%rax,%rsi), %bl
	leal	12(%rcx), %esi
	movb	%bl, (%rax,%r10)
	cmpl	%esi, %r15d
	jle	.L1966
	movslq	%esi, %r10
	movzbl	(%rdx,%r10), %ebx
	subl	%r14d, %esi
	movslq	%esi, %rsi
	addb	(%rax,%rsi), %bl
	leal	13(%rcx), %esi
	movb	%bl, (%rax,%r10)
	cmpl	%esi, %r15d
	jle	.L1966
	movslq	%esi, %r10
	movzbl	(%rdx,%r10), %ebx
	subl	%r14d, %esi
	movslq	%esi, %rsi
	addb	(%rax,%rsi), %bl
	addl	$14, %ecx
	movb	%bl, (%rax,%r10)
	cmpl	%ecx, %r15d
	jle	.L1966
	movslq	%ecx, %rsi
	movzbl	(%rdx,%rsi), %r10d
	subl	%r14d, %ecx
	movslq	%ecx, %rcx
	addb	(%rax,%rcx), %r10b
	movb	%r10b, (%rax,%rsi)
	.p2align 4,,10
	.p2align 3
.L1966:
	movb	$-1, (%rax,%r9)
	addq	%r9, %rdx
	decl	%r8d
	jne	.L1956
	jmp	.L2373
.L1942:
	movl	140(%rsp), %r9d
	testl	%r9d, %r9d
	je	.L1943
	movl	%r15d, %edi
	andl	$31, %edi
	movl	%r15d, %eax
	shrl	$5, %eax
	movl	%edi, 544(%rsp)
	movslq	%r15d, %r8
	decl	%edi
	leal	-1(%rax), %esi
	movq	%r8, 240(%rsp)
	movl	%edi, 512(%rsp)
	movl	%edx, 448(%rsp)
	movslq	%r14d, %rcx
	leal	-1(%r15), %r11d
	incq	%rsi
	movl	%r15d, %r10d
	movl	%r14d, 480(%rsp)
	movq	%r11, %r12
	salq	$5, %rsi
	andl	$-32, %r10d
	movq	%rbx, %rax
	movq	%rcx, %r14
	.p2align 4,,10
	.p2align 3
.L1944:
	testl	%r15d, %r15d
	je	.L1955
	leaq	1(%rax), %rcx
	movq	%r13, %rdx
	subq	%rcx, %rdx
	cmpq	$30, %rdx
	jbe	.L1945
	cmpl	$14, %r12d
	jbe	.L1945
	cmpl	$30, %r12d
	jbe	.L2088
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L1947:
	vmovdqu	(%rax,%rdx), %ymm6
	vmovdqu	%ymm6, 0(%r13,%rdx)
	addq	$32, %rdx
	cmpq	%rsi, %rdx
	jne	.L1947
	cmpl	%r10d, %r15d
	je	.L1955
	cmpl	$14, 512(%rsp)
	movl	544(%rsp), %edi
	jbe	.L2089
	movl	%r10d, %ecx
	movl	%r10d, %edx
.L1946:
	vmovdqu	(%rax,%rcx), %xmm6
	vmovdqu	%xmm6, 0(%r13,%rcx)
	movl	%edi, %ecx
	andl	$-16, %ecx
	addl	%ecx, %edx
	cmpl	%edi, %ecx
	je	.L1955
.L1949:
	movslq	%edx, %rcx
	movzbl	(%rax,%rcx), %edi
	movb	%dil, 0(%r13,%rcx)
	leal	1(%rdx), %ecx
	cmpl	%ecx, %r15d
	jle	.L1955
	movslq	%ecx, %rcx
	movzbl	(%rax,%rcx), %edi
	movb	%dil, 0(%r13,%rcx)
	leal	2(%rdx), %ecx
	cmpl	%ecx, %r15d
	jle	.L1955
	movslq	%ecx, %rcx
	movzbl	(%rax,%rcx), %edi
	movb	%dil, 0(%r13,%rcx)
	leal	3(%rdx), %ecx
	cmpl	%ecx, %r15d
	jle	.L1955
	movslq	%ecx, %rcx
	movzbl	(%rax,%rcx), %edi
	movb	%dil, 0(%r13,%rcx)
	leal	4(%rdx), %ecx
	cmpl	%ecx, %r15d
	jle	.L1955
	movslq	%ecx, %rcx
	movzbl	(%rax,%rcx), %edi
	movb	%dil, 0(%r13,%rcx)
	leal	5(%rdx), %ecx
	cmpl	%ecx, %r15d
	jle	.L1955
	movslq	%ecx, %rcx
	movzbl	(%rax,%rcx), %edi
	movb	%dil, 0(%r13,%rcx)
	leal	6(%rdx), %ecx
	cmpl	%ecx, %r15d
	jle	.L1955
	movslq	%ecx, %rcx
	movzbl	(%rax,%rcx), %edi
	movb	%dil, 0(%r13,%rcx)
	leal	7(%rdx), %ecx
	cmpl	%ecx, %r15d
	jle	.L1955
	movslq	%ecx, %rcx
	movzbl	(%rax,%rcx), %edi
	movb	%dil, 0(%r13,%rcx)
	leal	8(%rdx), %ecx
	cmpl	%ecx, %r15d
	jle	.L1955
	movslq	%ecx, %rcx
	movzbl	(%rax,%rcx), %edi
	movb	%dil, 0(%r13,%rcx)
	leal	9(%rdx), %ecx
	cmpl	%ecx, %r15d
	jle	.L1955
	movslq	%ecx, %rcx
	movzbl	(%rax,%rcx), %edi
	movb	%dil, 0(%r13,%rcx)
	leal	10(%rdx), %ecx
	cmpl	%ecx, %r15d
	jle	.L1955
	movslq	%ecx, %rcx
	movzbl	(%rax,%rcx), %edi
	movb	%dil, 0(%r13,%rcx)
	leal	11(%rdx), %ecx
	cmpl	%ecx, %r15d
	jle	.L1955
	movslq	%ecx, %rcx
	movzbl	(%rax,%rcx), %edi
	movb	%dil, 0(%r13,%rcx)
	leal	12(%rdx), %ecx
	cmpl	%ecx, %r15d
	jle	.L1955
	movslq	%ecx, %rcx
	movzbl	(%rax,%rcx), %edi
	movb	%dil, 0(%r13,%rcx)
	leal	13(%rdx), %ecx
	cmpl	%ecx, %r15d
	jle	.L1955
	movslq	%ecx, %rcx
	movzbl	(%rax,%rcx), %edi
	addl	$14, %edx
	movb	%dil, 0(%r13,%rcx)
	cmpl	%edx, %r15d
	jle	.L1955
	movslq	%edx, %rdx
	movzbl	(%rax,%rdx), %ecx
	movb	%cl, 0(%r13,%rdx)
	.p2align 4,,10
	.p2align 3
.L1955:
	movb	$-1, 0(%r13,%r8)
	addq	%r8, %rax
	addq	%r14, %r13
	decl	%r9d
	jne	.L1944
	movl	140(%rsp), %eax
	movl	480(%rsp), %r14d
	imulq	240(%rsp), %rax
	addq	%rax, %rbx
	jmp	.L1934
.L1935:
	movl	140(%rsp), %r8d
	testl	%r8d, %r8d
	je	.L1943
	movslq	%r14d, %rax
	movq	%rax, 544(%rsp)
	movl	%r14d, %eax
	negl	%eax
	movslq	%eax, %r11
	movq	%r11, %rsi
	notq	%rsi
	movq	%rsi, 512(%rsp)
	movl	%r15d, %esi
	andl	$31, %esi
	movl	%r15d, %edx
	shrl	$5, %edx
	movl	%esi, 480(%rsp)
	movslq	%r15d, %r9
	decl	%esi
	leal	-1(%rdx), %edi
	movq	%r9, 240(%rsp)
	movl	%esi, 448(%rsp)
	movq	%rbx, 416(%rsp)
	incq	%rdi
	movl	%r15d, %r12d
	leaq	0(%r13,%r11), %rax
	salq	$5, %rdi
	leal	-1(%r15), %r13d
	andl	$-32, %r12d
	movq	%rbx, %rdx
	.p2align 4,,10
	.p2align 3
.L2014:
	movq	%rax, %rsi
	addq	544(%rsp), %rax
	testl	%r15d, %r15d
	je	.L2024
	cmpq	$30, 512(%rsp)
	seta	%r10b
	cmpl	$14, %r13d
	seta	%cl
	testb	%cl, %r10b
	je	.L2015
	leaq	1(%rdx), %r10
	movq	%rax, %rcx
	subq	%r10, %rcx
	cmpq	$30, %rcx
	jbe	.L2015
	cmpl	$30, %r13d
	jbe	.L2102
	addq	$0, %rsi
	xorl	%ecx, %ecx
	.p2align 4,,10
	.p2align 3
.L2017:
	vmovdqu	(%rdx,%rcx), %ymm6
	vpaddb	(%rsi,%rcx), %ymm6, %ymm0
	vmovdqu	%ymm0, (%rax,%rcx)
	addq	$32, %rcx
	cmpq	%rcx, %rdi
	jne	.L2017
	cmpl	%r12d, %r15d
	je	.L2024
	cmpl	$14, 448(%rsp)
	movl	480(%rsp), %r10d
	jbe	.L2103
	movl	%r12d, %esi
	movl	%r12d, %ecx
.L2016:
	leaq	(%rax,%rsi), %rbx
	vmovdqu	(%rbx,%r11), %xmm4
	vpaddb	(%rdx,%rsi), %xmm4, %xmm0
	vmovdqu	%xmm0, (%rax,%rsi)
	movl	%r10d, %esi
	andl	$-16, %esi
	addl	%esi, %ecx
	cmpl	%r10d, %esi
	je	.L2024
.L2019:
	movslq	%ecx, %r10
	movl	%ecx, %esi
	movzbl	(%rdx,%r10), %ebx
	subl	%r14d, %esi
	movslq	%esi, %rsi
	addb	(%rax,%rsi), %bl
	leal	1(%rcx), %esi
	movb	%bl, (%rax,%r10)
	cmpl	%esi, %r15d
	jle	.L2024
	movslq	%esi, %r10
	movzbl	(%rdx,%r10), %ebx
	subl	%r14d, %esi
	movslq	%esi, %rsi
	addb	(%rax,%rsi), %bl
	leal	2(%rcx), %esi
	movb	%bl, (%rax,%r10)
	cmpl	%esi, %r15d
	jle	.L2024
	movslq	%esi, %r10
	movzbl	(%rdx,%r10), %ebx
	subl	%r14d, %esi
	movslq	%esi, %rsi
	addb	(%rax,%rsi), %bl
	leal	3(%rcx), %esi
	movb	%bl, (%rax,%r10)
	cmpl	%esi, %r15d
	jle	.L2024
	movslq	%esi, %r10
	movzbl	(%rdx,%r10), %ebx
	subl	%r14d, %esi
	movslq	%esi, %rsi
	addb	(%rax,%rsi), %bl
	leal	4(%rcx), %esi
	movb	%bl, (%rax,%r10)
	cmpl	%esi, %r15d
	jle	.L2024
	movslq	%esi, %r10
	movzbl	(%rdx,%r10), %ebx
	subl	%r14d, %esi
	movslq	%esi, %rsi
	addb	(%rax,%rsi), %bl
	leal	5(%rcx), %esi
	movb	%bl, (%rax,%r10)
	cmpl	%esi, %r15d
	jle	.L2024
	movslq	%esi, %r10
	movzbl	(%rdx,%r10), %ebx
	subl	%r14d, %esi
	movslq	%esi, %rsi
	addb	(%rax,%rsi), %bl
	leal	6(%rcx), %esi
	movb	%bl, (%rax,%r10)
	cmpl	%esi, %r15d
	jle	.L2024
	movslq	%esi, %r10
	movzbl	(%rdx,%r10), %ebx
	subl	%r14d, %esi
	movslq	%esi, %rsi
	addb	(%rax,%rsi), %bl
	leal	7(%rcx), %esi
	movb	%bl, (%rax,%r10)
	cmpl	%esi, %r15d
	jle	.L2024
	movslq	%esi, %r10
	movzbl	(%rdx,%r10), %ebx
	subl	%r14d, %esi
	movslq	%esi, %rsi
	addb	(%rax,%rsi), %bl
	leal	8(%rcx), %esi
	movb	%bl, (%rax,%r10)
	cmpl	%esi, %r15d
	jle	.L2024
	movslq	%esi, %r10
	movzbl	(%rdx,%r10), %ebx
	subl	%r14d, %esi
	movslq	%esi, %rsi
	addb	(%rax,%rsi), %bl
	leal	9(%rcx), %esi
	movb	%bl, (%rax,%r10)
	cmpl	%esi, %r15d
	jle	.L2024
	movslq	%esi, %r10
	movzbl	(%rdx,%r10), %ebx
	subl	%r14d, %esi
	movslq	%esi, %rsi
	addb	(%rax,%rsi), %bl
	leal	10(%rcx), %esi
	movb	%bl, (%rax,%r10)
	cmpl	%esi, %r15d
	jle	.L2024
	movslq	%esi, %r10
	movzbl	(%rdx,%r10), %ebx
	subl	%r14d, %esi
	movslq	%esi, %rsi
	addb	(%rax,%rsi), %bl
	leal	11(%rcx), %esi
	movb	%bl, (%rax,%r10)
	cmpl	%esi, %r15d
	jle	.L2024
	movslq	%esi, %r10
	movzbl	(%rdx,%r10), %ebx
	subl	%r14d, %esi
	movslq	%esi, %rsi
	addb	(%rax,%rsi), %bl
	leal	12(%rcx), %esi
	movb	%bl, (%rax,%r10)
	cmpl	%esi, %r15d
	jle	.L2024
	movslq	%esi, %r10
	movzbl	(%rdx,%r10), %ebx
	subl	%r14d, %esi
	movslq	%esi, %rsi
	addb	(%rax,%rsi), %bl
	leal	13(%rcx), %esi
	movb	%bl, (%rax,%r10)
	cmpl	%esi, %r15d
	jle	.L2024
	movslq	%esi, %r10
	movzbl	(%rdx,%r10), %ebx
	subl	%r14d, %esi
	movslq	%esi, %rsi
	addb	(%rax,%rsi), %bl
	addl	$14, %ecx
	movb	%bl, (%rax,%r10)
	cmpl	%ecx, %r15d
	jle	.L2024
	movslq	%ecx, %rsi
	movzbl	(%rdx,%rsi), %r10d
	subl	%r14d, %ecx
	movslq	%ecx, %rcx
	addb	(%rax,%rcx), %r10b
	movb	%r10b, (%rax,%rsi)
	.p2align 4,,10
	.p2align 3
.L2024:
	movb	$-1, (%rax,%r9)
	addq	%r9, %rdx
	decl	%r8d
	jne	.L2014
	jmp	.L2373
	.p2align 4,,10
	.p2align 3
.L2001:
	movq	240(%rsp), %rax
	movb	$-1, (%r15,%rax)
	addq	%rax, %r13
	movq	128(%rsp), %rax
	addq	%rax, 256(%rsp)
	addq	%rax, %r15
	addq	%rax, %r14
	decl	108(%rsp)
	jne	.L1989
	movl	140(%rsp), %eax
	movq	56(%rsp), %rbx
	imulq	240(%rsp), %rax
	movl	224(%rsp), %r15d
	movl	68(%rsp), %r14d
	addq	%rax, %rbx
	jmp	.L1934
.L1990:
	movl	120(%rsp), %eax
	xorl	%esi, %esi
	movq	%rax, 544(%rsp)
	movq	216(%rsp), %rax
	leaq	(%r15,%rax), %rbx
	movq	%rbx, 480(%rsp)
	movq	256(%rsp), %rbx
	leaq	-1(%rbx,%rax), %rax
	movq	%rax, 512(%rsp)
	jmp	.L2000
	.p2align 4,,10
	.p2align 3
.L2387:
	cmpl	%edx, %ecx
	cmovge	%r10d, %r8d
.L1999:
	addl	%ebx, %r8d
	movb	%r8b, (%r15,%rsi)
	leaq	1(%rsi), %rax
	cmpq	%rsi, 544(%rsp)
	je	.L2001
	movq	%rax, %rsi
.L2000:
	movq	512(%rsp), %rax
	movzbl	(%rdi,%rsi), %ecx
	movzbl	(%rax,%rsi), %r12d
	movq	480(%rsp), %rax
	movl	%ecx, %r10d
	movzbl	(%rax,%rsi), %r9d
	movl	%r12d, %r8d
	leal	(%r9,%rcx), %eax
	subl	%r12d, %eax
	movl	%eax, %edx
	subl	%ecx, %edx
	movl	%edx, %ecx
	sarl	$31, %ecx
	xorl	%ecx, %edx
	subl	%ecx, %edx
	movl	%eax, %ecx
	subl	%r12d, %ecx
	movl	%ecx, %r12d
	sarl	$31, %r12d
	xorl	%r12d, %ecx
	subl	%r12d, %ecx
	cmpl	%edx, %ecx
	movl	%edx, %r12d
	cmovle	%ecx, %r12d
	subl	%r9d, %eax
	movl	%r9d, %r11d
	movl	%eax, %r9d
	sarl	$31, %r9d
	xorl	%r9d, %eax
	subl	%r9d, %eax
	movzbl	0(%r13,%rsi), %ebx
	cmpl	%eax, %r12d
	jl	.L2387
	movl	%r11d, %r8d
	jmp	.L1999
	.p2align 4,,10
	.p2align 3
.L2383:
	movl	156(%rsp), %esi
	movslq	%r15d, %rbx
	movq	%rbx, 240(%rsp)
	cmpl	%esi, 276(%rsp)
	je	.L1857
	movb	$-1, (%r9,%rbx)
	movb	$-1, 1(%r9,%rbx)
.L1857:
	movq	240(%rsp), %rbx
	movslq	%r14d, %rcx
	addq	%r10, %rbx
	leaq	(%r9,%rcx), %r13
	addq	%rcx, %rax
	jmp	.L1855
.L2004:
	movl	%r13d, %ebx
	xorl	%ecx, %ecx
	.p2align 4,,10
	.p2align 3
.L2010:
	movzbl	(%rdi,%rcx), %esi
	shrb	%sil
	addb	(%rdx,%rcx), %sil
	movb	%sil, (%rax,%rcx)
	movq	%rcx, %rsi
	incq	%rcx
	cmpq	%rsi, %rbx
	jne	.L2010
	jmp	.L2013
.L2015:
	movl	%r13d, %ebx
	xorl	%ecx, %ecx
	.p2align 4,,10
	.p2align 3
.L2021:
	movzbl	(%rsi,%rcx), %r10d
	addb	(%rdx,%rcx), %r10b
	movb	%r10b, (%rax,%rcx)
	movq	%rcx, %r10
	incq	%rcx
	cmpq	%r10, %rbx
	jne	.L2021
	jmp	.L2024
.L1945:
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L1951:
	movzbl	(%rax,%rdx), %ecx
	movb	%cl, 0(%r13,%rdx)
	movq	%rdx, %rcx
	incq	%rdx
	cmpq	%rcx, %r11
	jne	.L1951
	jmp	.L1955
.L1979:
	movl	480(%rsp), %esi
	movq	544(%rsp), %r9
	movl	%r15d, 416(%rsp)
	xorl	%edi, %edi
	movq	%rsi, %r15
	.p2align 4,,10
	.p2align 3
.L1985:
	movzbl	(%rax,%rdi), %esi
	movzbl	(%r8,%rdi), %r10d
	addl	%r10d, %esi
	sarl	%esi
	addb	(%rcx,%rdi), %sil
	movb	%sil, (%rdx,%rdi)
	movq	%rdi, %rsi
	incq	%rdi
	cmpq	%rsi, %r15
	jne	.L1985
	movq	%r9, 544(%rsp)
	movl	416(%rsp), %r15d
	jmp	.L1988
.L1968:
	xorl	%ecx, %ecx
	.p2align 4,,10
	.p2align 3
.L1974:
	movzbl	(%rax,%rcx), %edi
	addb	(%rdx,%rcx), %dil
	movb	%dil, 0(%r13,%rcx)
	movq	%rcx, %rdi
	incq	%rcx
	cmpq	%rdi, %r12
	jne	.L1974
	jmp	.L1977
.L1957:
	movl	%r13d, %ebx
	xorl	%ecx, %ecx
	.p2align 4,,10
	.p2align 3
.L1963:
	movzbl	(%rsi,%rcx), %r10d
	addb	(%rdx,%rcx), %r10b
	movb	%r10b, (%rax,%rcx)
	movq	%rcx, %r10
	incq	%rcx
	cmpq	%r10, %rbx
	jne	.L1963
	jmp	.L1966
.L2378:
	addl	%eax, %eax
	movl	%eax, %r14d
	movl	$2, %r13d
	movl	$2, %r15d
	movq	%rdi, %rax
	movl	%ecx, %edx
	jmp	.L1823
.L1902:
	movl	%r12d, %edx
	movq	%rdx, 544(%rsp)
	leaq	(%rax,%r8), %rdx
	movq	%rdx, 480(%rsp)
	leaq	0(%r13,%r8), %rdx
	movq	%rdx, 512(%rsp)
	movl	%r15d, 448(%rsp)
	movl	%r14d, 416(%rsp)
	xorl	%edi, %edi
	jmp	.L1913
.L2389:
	cmpl	%ecx, %esi
	cmovle	%r10d, %r8d
.L1912:
	addl	%r14d, %r8d
	movb	%r8b, 0(%r13,%rdi)
	incq	%rdi
	cmpq	%rdi, 544(%rsp)
	je	.L2388
.L1913:
	movq	480(%rsp), %rdx
	movzbl	(%rax,%rdi), %ecx
	movzbl	(%rdx,%rdi), %r15d
	movq	512(%rsp), %rdx
	movl	%ecx, %r10d
	movzbl	(%rdx,%rdi), %r9d
	movl	%r15d, %r8d
	leal	(%rcx,%r9), %edx
	subl	%r15d, %edx
	movl	%edx, %esi
	subl	%ecx, %esi
	movl	%esi, %ecx
	sarl	$31, %ecx
	xorl	%ecx, %esi
	subl	%ecx, %esi
	movl	%edx, %ecx
	subl	%r15d, %ecx
	movl	%ecx, %r15d
	sarl	$31, %r15d
	xorl	%r15d, %ecx
	subl	%r15d, %ecx
	cmpl	%ecx, %esi
	movl	%ecx, %r15d
	cmovle	%esi, %r15d
	subl	%r9d, %edx
	movl	%r9d, %r12d
	movl	%edx, %r9d
	sarl	$31, %r9d
	xorl	%r9d, %edx
	subl	%r9d, %edx
	movzbl	(%rbx,%rdi), %r14d
	cmpl	%edx, %r15d
	jl	.L2389
	movl	%r12d, %r8d
	jmp	.L1912
.L1943:
	cmpl	$16, 16(%rbp)
	jne	.L1932
	movq	208(%rsp), %rdx
	movq	160(%rsp), %rax
	addq	24(%rdx), %rax
	jmp	.L2077
.L2096:
	movl	224(%rsp), %esi
	xorl	%eax, %eax
	xorl	%edx, %edx
	jmp	.L1991
.L1834:
	leaq	.LC204(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	leaq	-40(%rbp), %rsp
	xorl	%eax, %eax
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L2088:
	.cfi_restore_state
	movl	448(%rsp), %edx
	movl	%r15d, %edi
	xorl	%ecx, %ecx
	jmp	.L1946
.L2094:
	movl	%r15d, %r8d
	xorl	%edi, %edi
	xorl	%esi, %esi
	jmp	.L1980
.L2092:
	movl	%r15d, %r8d
	xorl	%edi, %edi
	xorl	%ecx, %ecx
	jmp	.L1969
.L2090:
	movl	%r15d, %r10d
	xorl	%esi, %esi
	xorl	%ecx, %ecx
	jmp	.L1958
.L2100:
	movl	%r15d, %edi
	xorl	%esi, %esi
	xorl	%ecx, %ecx
	jmp	.L2005
.L2102:
	movl	%r15d, %r10d
	xorl	%esi, %esi
	xorl	%ecx, %ecx
	jmp	.L2016
.L2103:
	movl	%r12d, %ecx
	jmp	.L2019
.L2089:
	movl	%r10d, %edx
	jmp	.L1949
.L2095:
	movl	%r13d, %esi
	jmp	.L1983
.L2101:
	movl	%r12d, %ecx
	jmp	.L2008
.L2093:
	movl	%r11d, %ecx
	jmp	.L1972
.L2091:
	movl	%r12d, %ecx
	jmp	.L1961
.L2391:
	cmpl	$16, 16(%rbp)
	je	.L2390
.L2371:
	vzeroupper
.L1836:
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	movl	$1, %eax
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L2380:
	.cfi_restore_state
	leaq	.LC205(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	vzeroupper
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
.L2026:
	.cfi_restore_state
	cmpl	$7, 16(%rbp)
	jg	.L2391
	movl	152(%rsp), %eax
	movl	112(%rsp), %edx
	movl	72(%rsp), %esi
	subq	%rax, %rdx
	movq	%rdx, %r13
	leal	-8(%rsi), %edx
	movl	%edx, %edi
	shrl	$3, %edi
	leal	1(%rdi), %ebx
	movq	%rbx, %rax
	movl	%ebx, 52(%rsp)
	movq	%rbx, 168(%rsp)
	salq	$3, %rbx
	movq	%rbx, 224(%rsp)
	movl	%eax, %ebx
	shrl	$5, %eax
	andl	$-32, %ebx
	decl	%eax
	movq	%rax, 24(%rsp)
	movl	%ebx, %eax
	negl	%eax
	leal	(%rsi,%rax,8), %eax
	movl	%eax, 48(%rsp)
	movl	%ebx, %eax
	movq	%rax, 40(%rsp)
	salq	$3, %rax
	movq	%rax, 32(%rsp)
	movl	%edi, %eax
	negl	%eax
	leal	(%rdx,%rax,8), %eax
	movl	%edx, 56(%rsp)
	leal	-4(%rsi), %edx
	movl	%edi, 64(%rsp)
	movl	%edx, %edi
	shrl	$2, %edi
	movl	%ebx, 128(%rsp)
	leal	1(%rdi), %ebx
	movl	%eax, 68(%rsp)
	movl	%ebx, 108(%rsp)
	movq	%rbx, %rax
	movq	%rbx, 256(%rsp)
	salq	$2, %rbx
	movq	%rbx, 240(%rsp)
	movl	%eax, %ebx
	shrl	$5, %eax
	andl	$-32, %ebx
	decl	%eax
	movq	%rax, 16(%rsp)
	movl	%ebx, %eax
	negl	%eax
	leal	(%rsi,%rax,4), %eax
	movl	%eax, 136(%rsp)
	movl	%ebx, %eax
	movq	%rax, 112(%rsp)
	salq	$2, %rax
	movq	%rax, 120(%rsp)
	movl	%edi, %eax
	negl	%eax
	leal	(%rdx,%rax,4), %eax
	movl	%edx, 152(%rsp)
	leal	-2(%rsi), %edx
	movl	%edi, 96(%rsp)
	movl	%edx, %edi
	shrl	%edi
	movl	%eax, 160(%rsp)
	leal	1(%rdi), %eax
	movl	%ebx, 192(%rsp)
	movl	%eax, 76(%rsp)
	movq	%rax, %rbx
	movq	%rax, 480(%rsp)
	addq	%rax, %rax
	movq	%rax, 248(%rsp)
	movl	%ebx, %eax
	shrl	$5, %eax
	decl	%eax
	incq	%rax
	andl	$-32, %ebx
	salq	$5, %rax
	movq	%rax, 8(%rsp)
	movl	%ebx, %eax
	negl	%eax
	leal	(%rsi,%rax,2), %eax
	movl	%ebx, 176(%rsp)
	movl	%edx, 144(%rsp)
	movl	%edi, 148(%rsp)
	movl	%eax, 104(%rsp)
	movl	%ebx, %eax
	movq	%rax, 80(%rsp)
	addq	%rax, %rax
	movq	%rax, 88(%rsp)
	movl	%edi, %eax
	movl	140(%rsp), %ebx
	negl	%eax
	leal	(%rdx,%rax,2), %eax
	movl	%eax, 216(%rsp)
	leal	0(,%rbx,4), %eax
	cltq
	movq	%rax, 288(%rsp)
	movl	272(%rsp), %eax
	movq	%r13, 512(%rsp)
	leal	-3(%rax,%rax,2), %eax
	cltq
	movq	%rax, 320(%rsp)
	movslq	%ebx, %rax
	movq	%rax, 448(%rsp)
	movl	%ebx, %eax
	movq	%rax, 352(%rsp)
	vmovdqa	.LC15(%rip), %ymm2
	vmovdqa	.LC208(%rip), %ymm15
	vmovdqa	.LC209(%rip), %ymm1
	vmovdqa	.LC210(%rip), %ymm0
	movl	156(%rsp), %r9d
	movq	208(%rsp), %rbx
	movl	16(%rbp), %r8d
	xorl	%r15d, %r15d
	xorl	%r14d, %r14d
	.p2align 4,,10
	.p2align 3
.L2064:
	movq	512(%rsp), %rdx
	movq	24(%rbx), %rax
	movl	%r15d, %ecx
	leaq	(%rcx,%rdx), %r11
	movl	24(%rbp), %r12d
	leaq	(%rax,%r11), %rsi
	leaq	(%rax,%rcx), %rdi
	movq	%rsi, %r10
	movl	$1, %edx
	testl	%r12d, %r12d
	jne	.L2028
	movslq	%r8d, %rdx
	leaq	stbi__depth_scale_table(%rip), %r12
	movzbl	(%r12,%rdx), %edx
.L2028:
	cmpl	$4, %r8d
	je	.L2392
	cmpl	$2, %r8d
	je	.L2393
	cmpl	$1, %r8d
	je	.L2394
.L2040:
	cmpl	%r9d, 276(%rsp)
	je	.L2066
	addq	24(%rbx), %rcx
	cmpl	$1, %r9d
	je	.L2395
	cmpl	$3, %r9d
	jne	.L2396
	cmpl	$-1, 140(%rsp)
	je	.L2066
	movq	448(%rsp), %rsi
	movq	288(%rsp), %rax
	movq	320(%rsp), %rdx
	subq	352(%rsp), %rsi
	addq	%rcx, %rax
	addq	%rcx, %rdx
	leaq	-4(%rcx,%rsi,4), %rcx
	.p2align 4,,10
	.p2align 3
.L2069:
	movb	$-1, 3(%rax)
	subq	$4, %rax
	subq	$3, %rdx
	movzbl	5(%rdx), %esi
	movb	%sil, 6(%rax)
	movzbl	4(%rdx), %esi
	movb	%sil, 5(%rax)
	movzbl	3(%rdx), %esi
	movb	%sil, 4(%rax)
	cmpq	%rax, %rcx
	jne	.L2069
.L2066:
	leal	1(%r14), %eax
	addl	280(%rsp), %r15d
	cmpl	284(%rsp), %r14d
	je	.L2371
	movl	%eax, %r14d
	jmp	.L2064
.L2395:
	cmpl	$-1, 140(%rsp)
	je	.L2066
	movq	448(%rsp), %rax
	.p2align 4,,10
	.p2align 3
.L2067:
	movb	$-1, 1(%rcx,%rax,2)
	movzbl	(%rcx,%rax), %edx
	movb	%dl, (%rcx,%rax,2)
	decq	%rax
	cmpl	$-1, %eax
	jne	.L2067
	jmp	.L2066
.L2392:
	cmpl	$1, 72(%rsp)
	jle	.L2105
	movq	248(%rsp), %r10
	addq	%rcx, %r10
	cmpq	%r10, %r11
	setge	%r10b
	addq	480(%rsp), %r11
	cmpq	%r11, %rcx
	setge	%r11b
	orb	%r10b, %r11b
	je	.L2031
	movl	144(%rsp), %r11d
	cmpl	$29, %r11d
	jbe	.L2031
	cmpl	$61, %r11d
	jbe	.L2106
	vmovd	%edx, %xmm5
	vpbroadcastb	%xmm5, %ymm5
	vmovdqa	.LC208(%rip), %ymm9
	vmovdqa	.LC209(%rip), %ymm7
	vmovdqa	.LC210(%rip), %ymm6
	movq	8(%rsp), %r11
	vpunpcklbw	%ymm5, %ymm5, %ymm8
	xorl	%r10d, %r10d
	vpunpckhbw	%ymm5, %ymm5, %ymm5
	.p2align 4,,10
	.p2align 3
.L2033:
	vmovdqu	(%rsi,%r10), %ymm3
	vpsrlw	$4, %ymm3, %ymm4
	vpand	%ymm4, %ymm9, %ymm4
	vpunpcklbw	%ymm4, %ymm4, %ymm10
	vpunpckhbw	%ymm4, %ymm4, %ymm4
	vpmullw	%ymm10, %ymm8, %ymm10
	vpmullw	%ymm4, %ymm5, %ymm4
	vpand	%ymm9, %ymm3, %ymm3
	vpshufb	%ymm7, %ymm10, %ymm10
	vpshufb	%ymm6, %ymm4, %ymm4
	vpor	%ymm4, %ymm10, %ymm4
	vpunpcklbw	%ymm3, %ymm3, %ymm10
	vpunpckhbw	%ymm3, %ymm3, %ymm3
	vpmullw	%ymm8, %ymm10, %ymm10
	vpmullw	%ymm5, %ymm3, %ymm3
	vpshufb	%ymm7, %ymm10, %ymm10
	vpshufb	%ymm6, %ymm3, %ymm3
	vpor	%ymm3, %ymm10, %ymm3
	vpunpcklbw	%ymm3, %ymm4, %ymm10
	vpunpckhbw	%ymm3, %ymm4, %ymm4
	vperm2i128	$32, %ymm4, %ymm10, %ymm3
	vperm2i128	$49, %ymm4, %ymm10, %ymm10
	vmovdqu	%ymm3, (%rdi,%r10,2)
	vmovdqu	%ymm10, 32(%rdi,%r10,2)
	addq	$32, %r10
	cmpq	%r10, %r11
	jne	.L2033
	movq	88(%rsp), %r11
	movl	76(%rsp), %r12d
	leaq	(%rdi,%r11), %r10
	movq	80(%rsp), %r11
	addq	%rsi, %r11
	cmpl	%r12d, 176(%rsp)
	je	.L2374
	movl	176(%rsp), %r13d
	movl	%r13d, 384(%rsp)
	movl	104(%rsp), %r13d
	movl	%r13d, 544(%rsp)
.L2032:
	movl	148(%rsp), %r13d
	subl	384(%rsp), %r13d
	leal	1(%r13), %r12d
	movl	%r12d, 416(%rsp)
	cmpl	$14, %r13d
	jbe	.L2035
	movl	384(%rsp), %r12d
	vmovdqa	.LC211(%rip), %xmm9
	vmovdqu	(%rsi,%r12), %xmm4
	vmovd	%edx, %xmm6
	vpsrlw	$4, %xmm4, %xmm3
	vpbroadcastb	%xmm6, %xmm6
	vpand	%xmm3, %xmm9, %xmm3
	vpunpcklbw	%xmm6, %xmm6, %xmm8
	vpunpcklbw	%xmm3, %xmm3, %xmm5
	vpunpckhbw	%xmm6, %xmm6, %xmm6
	vpunpckhbw	%xmm3, %xmm3, %xmm3
	vpmullw	%xmm5, %xmm8, %xmm5
	vpmullw	%xmm3, %xmm6, %xmm3
	vmovdqa	.LC5(%rip), %xmm7
	leaq	(%rcx,%r12,2), %r13
	addq	%rax, %r13
	vpand	%xmm5, %xmm7, %xmm5
	vpand	%xmm3, %xmm7, %xmm3
	vpackuswb	%xmm3, %xmm5, %xmm5
	vpand	%xmm9, %xmm4, %xmm3
	vpunpcklbw	%xmm3, %xmm3, %xmm4
	vpunpckhbw	%xmm3, %xmm3, %xmm3
	vpmullw	%xmm6, %xmm3, %xmm3
	vpmullw	%xmm8, %xmm4, %xmm4
	movl	416(%rsp), %eax
	andl	$-16, %eax
	movl	%eax, %r12d
	vpand	%xmm4, %xmm7, %xmm4
	vpand	%xmm3, %xmm7, %xmm7
	vpackuswb	%xmm7, %xmm4, %xmm3
	vpunpcklbw	%xmm3, %xmm5, %xmm4
	vpunpckhbw	%xmm3, %xmm5, %xmm5
	vmovdqu	%xmm4, 0(%r13)
	vmovdqu	%xmm5, 16(%r13)
	movl	544(%rsp), %r13d
	negl	%r12d
	leal	0(%r13,%r12,2), %r13d
	movl	%eax, %r12d
	movl	%r13d, 544(%rsp)
	leaq	(%r10,%r12,2), %r10
	addq	%r12, %r11
	cmpl	416(%rsp), %eax
	je	.L2374
.L2035:
	movzbl	(%r11), %eax
	shrb	$4, %al
	imull	%edx, %eax
	movb	%al, (%r10)
	movzbl	(%r11), %eax
	andl	$15, %eax
	imull	%edx, %eax
	movb	%al, 1(%r10)
	movl	544(%rsp), %eax
	subl	$2, %eax
	cmpl	$1, %eax
	jle	.L2374
	movzbl	1(%r11), %eax
	shrb	$4, %al
	imull	%edx, %eax
	movb	%al, 2(%r10)
	movzbl	1(%r11), %eax
	andl	$15, %eax
	imull	%edx, %eax
	movb	%al, 3(%r10)
	movl	544(%rsp), %eax
	subl	$4, %eax
	cmpl	$1, %eax
	jle	.L2374
	movzbl	2(%r11), %eax
	shrb	$4, %al
	imull	%edx, %eax
	movb	%al, 4(%r10)
	movzbl	2(%r11), %eax
	andl	$15, %eax
	imull	%edx, %eax
	movb	%al, 5(%r10)
	movl	544(%rsp), %eax
	subl	$6, %eax
	cmpl	$1, %eax
	jle	.L2374
	movzbl	3(%r11), %eax
	shrb	$4, %al
	imull	%edx, %eax
	movb	%al, 6(%r10)
	movzbl	3(%r11), %eax
	andl	$15, %eax
	imull	%edx, %eax
	movb	%al, 7(%r10)
	movl	544(%rsp), %eax
	subl	$8, %eax
	cmpl	$1, %eax
	jle	.L2374
	movzbl	4(%r11), %eax
	shrb	$4, %al
	imull	%edx, %eax
	movb	%al, 8(%r10)
	movzbl	4(%r11), %eax
	andl	$15, %eax
	imull	%edx, %eax
	movb	%al, 9(%r10)
	movl	544(%rsp), %eax
	subl	$10, %eax
	cmpl	$1, %eax
	jle	.L2374
	movzbl	5(%r11), %eax
	shrb	$4, %al
	imull	%edx, %eax
	movb	%al, 10(%r10)
	movzbl	5(%r11), %eax
	andl	$15, %eax
	imull	%edx, %eax
	movb	%al, 11(%r10)
	movl	544(%rsp), %eax
	subl	$12, %eax
	cmpl	$1, %eax
	jle	.L2374
	movzbl	6(%r11), %eax
	shrb	$4, %al
	imull	%edx, %eax
	movb	%al, 12(%r10)
	movzbl	6(%r11), %eax
	andl	$15, %eax
	imull	%edx, %eax
	movb	%al, 13(%r10)
	movl	544(%rsp), %eax
	subl	$14, %eax
	cmpl	$1, %eax
	jle	.L2374
	movzbl	7(%r11), %eax
	shrb	$4, %al
	imull	%edx, %eax
	movb	%al, 14(%r10)
	movzbl	7(%r11), %eax
	andl	$15, %eax
	imull	%edx, %eax
	movb	%al, 15(%r10)
	movl	544(%rsp), %eax
	subl	$16, %eax
	cmpl	$1, %eax
	jle	.L2374
	movzbl	8(%r11), %eax
	shrb	$4, %al
	imull	%edx, %eax
	movb	%al, 16(%r10)
	movzbl	8(%r11), %eax
	andl	$15, %eax
	imull	%edx, %eax
	movb	%al, 17(%r10)
	movl	544(%rsp), %eax
	subl	$18, %eax
	cmpl	$1, %eax
	jle	.L2374
	movzbl	9(%r11), %eax
	shrb	$4, %al
	imull	%edx, %eax
	movb	%al, 18(%r10)
	movzbl	9(%r11), %eax
	andl	$15, %eax
	imull	%edx, %eax
	movb	%al, 19(%r10)
	movl	544(%rsp), %eax
	subl	$20, %eax
	cmpl	$1, %eax
	jle	.L2374
	movzbl	10(%r11), %eax
	shrb	$4, %al
	imull	%edx, %eax
	movb	%al, 20(%r10)
	movzbl	10(%r11), %eax
	andl	$15, %eax
	imull	%edx, %eax
	movb	%al, 21(%r10)
	movl	544(%rsp), %eax
	subl	$22, %eax
	cmpl	$1, %eax
	jle	.L2374
	movzbl	11(%r11), %eax
	shrb	$4, %al
	imull	%edx, %eax
	movb	%al, 22(%r10)
	movzbl	11(%r11), %eax
	andl	$15, %eax
	imull	%edx, %eax
	movb	%al, 23(%r10)
	movl	544(%rsp), %eax
	subl	$24, %eax
	cmpl	$1, %eax
	jle	.L2374
	movzbl	12(%r11), %eax
	shrb	$4, %al
	imull	%edx, %eax
	movb	%al, 24(%r10)
	movzbl	12(%r11), %eax
	andl	$15, %eax
	imull	%edx, %eax
	movb	%al, 25(%r10)
	movl	544(%rsp), %eax
	subl	$26, %eax
	cmpl	$1, %eax
	jle	.L2374
	movzbl	13(%r11), %eax
	shrb	$4, %al
	imull	%edx, %eax
	movb	%al, 26(%r10)
	movzbl	13(%r11), %eax
	andl	$15, %eax
	imull	%edx, %eax
	cmpl	$29, 544(%rsp)
	movb	%al, 27(%r10)
	jle	.L2374
	movzbl	14(%r11), %eax
	shrb	$4, %al
	imull	%edx, %eax
	movb	%al, 28(%r10)
	movzbl	14(%r11), %eax
	andl	$15, %eax
	imull	%edx, %eax
	movb	%al, 29(%r10)
.L2374:
	movq	480(%rsp), %rax
	leaq	(%rsi,%rax), %r10
.L2038:
	movl	216(%rsp), %eax
	addq	248(%rsp), %rdi
.L2030:
	cmpl	$1, %eax
	jne	.L2040
	movzbl	(%r10), %eax
	shrb	$4, %al
	imull	%edx, %eax
	movb	%al, (%rdi)
	jmp	.L2040
.L2393:
	cmpl	$3, 72(%rsp)
	jle	.L2107
	movq	240(%rsp), %r10
	addq	%rcx, %r10
	cmpq	%r10, %r11
	movq	256(%rsp), %r10
	setge	%r12b
	addq	%r11, %r10
	cmpq	%r10, %rcx
	setge	%r10b
	orb	%r12b, %r10b
	je	.L2043
	movl	152(%rsp), %r10d
	cmpl	$59, %r10d
	jbe	.L2043
	cmpl	$123, %r10d
	jbe	.L2108
	movq	16(%rsp), %r13
	vmovd	%edx, %xmm9
	incq	%r13
	vpbroadcastb	%xmm9, %ymm9
	salq	$7, %r13
	vmovdqa	.LC209(%rip), %ymm7
	vmovdqa	.LC210(%rip), %ymm6
	vmovdqa	.LC0(%rip), %ymm11
	vmovdqa	.LC212(%rip), %ymm12
	vpunpcklbw	%ymm9, %ymm9, %ymm10
	movq	%rdi, %r10
	movq	%rsi, %r12
	addq	%rdi, %r13
	vpunpckhbw	%ymm9, %ymm9, %ymm9
	.p2align 4,,10
	.p2align 3
.L2045:
	vmovdqu	(%r12), %ymm3
	subq	$-128, %r10
	vpsrlw	$6, %ymm3, %ymm4
	vpand	%ymm4, %ymm11, %ymm4
	vpunpcklbw	%ymm4, %ymm4, %ymm5
	vpunpckhbw	%ymm4, %ymm4, %ymm4
	vpmullw	%ymm5, %ymm10, %ymm5
	vpmullw	%ymm4, %ymm9, %ymm4
	addq	$32, %r12
	vpshufb	%ymm7, %ymm5, %ymm5
	vpshufb	%ymm6, %ymm4, %ymm4
	vpor	%ymm4, %ymm5, %ymm5
	vpsrlw	$4, %ymm3, %ymm4
	vpand	%ymm4, %ymm15, %ymm4
	vpand	%ymm11, %ymm4, %ymm4
	vpunpcklbw	%ymm4, %ymm4, %ymm13
	vpunpckhbw	%ymm4, %ymm4, %ymm4
	vpmullw	%ymm10, %ymm13, %ymm13
	vpmullw	%ymm9, %ymm4, %ymm8
	vpshufb	%ymm7, %ymm13, %ymm4
	vpshufb	%ymm6, %ymm8, %ymm8
	vpor	%ymm8, %ymm4, %ymm4
	vpsrlw	$2, %ymm3, %ymm8
	vpand	%ymm8, %ymm12, %ymm8
	vpand	%ymm11, %ymm8, %ymm8
	vpunpcklbw	%ymm8, %ymm8, %ymm14
	vpunpckhbw	%ymm8, %ymm8, %ymm8
	vpmullw	%ymm10, %ymm14, %ymm14
	vpmullw	%ymm9, %ymm8, %ymm13
	vpand	%ymm11, %ymm3, %ymm3
	vpshufb	%ymm7, %ymm14, %ymm8
	vpshufb	%ymm6, %ymm13, %ymm13
	vpor	%ymm13, %ymm8, %ymm8
	vpunpcklbw	%ymm3, %ymm3, %ymm13
	vpunpckhbw	%ymm3, %ymm3, %ymm3
	vpmullw	%ymm10, %ymm13, %ymm13
	vpmullw	%ymm9, %ymm3, %ymm3
	vpshufb	%ymm7, %ymm13, %ymm13
	vpshufb	%ymm6, %ymm3, %ymm3
	vpor	%ymm3, %ymm13, %ymm13
	vpunpcklbw	%ymm8, %ymm5, %ymm3
	vpunpckhbw	%ymm8, %ymm5, %ymm5
	vperm2i128	$32, %ymm5, %ymm3, %ymm8
	vpunpcklbw	%ymm13, %ymm4, %ymm14
	vperm2i128	$49, %ymm5, %ymm3, %ymm5
	vpunpckhbw	%ymm13, %ymm4, %ymm3
	vperm2i128	$32, %ymm3, %ymm14, %ymm4
	vpunpcklbw	%ymm4, %ymm8, %ymm13
	vperm2i128	$49, %ymm3, %ymm14, %ymm3
	vpunpckhbw	%ymm4, %ymm8, %ymm4
	vperm2i128	$32, %ymm4, %ymm13, %ymm8
	vperm2i128	$49, %ymm4, %ymm13, %ymm13
	vpunpcklbw	%ymm3, %ymm5, %ymm4
	vpunpckhbw	%ymm3, %ymm5, %ymm3
	vperm2i128	$32, %ymm3, %ymm4, %ymm5
	vperm2i128	$49, %ymm3, %ymm4, %ymm4
	vmovdqu	%ymm8, -128(%r10)
	vmovdqu	%ymm13, -96(%r10)
	vmovdqu	%ymm5, -64(%r10)
	vmovdqu	%ymm4, -32(%r10)
	cmpq	%r10, %r13
	jne	.L2045
	movq	120(%rsp), %r10
	movl	108(%rsp), %r13d
	addq	%rdi, %r10
	movq	%r10, 544(%rsp)
	movq	112(%rsp), %r10
	addq	%rsi, %r10
	movq	%r10, 384(%rsp)
	cmpl	%r13d, 192(%rsp)
	je	.L2375
	movl	136(%rsp), %r10d
	movl	192(%rsp), %r12d
	movl	%r10d, 416(%rsp)
.L2044:
	movl	96(%rsp), %r13d
	subl	%r12d, %r13d
	leal	1(%r13), %r10d
	cmpl	$14, %r13d
	jbe	.L2047
	leaq	(%rcx,%r12,4), %r13
	addq	%rax, %r12
	vmovdqu	(%r12,%r11), %xmm5
	vmovdqa	.LC3(%rip), %xmm10
	vpsrlw	$6, %xmm5, %xmm3
	vmovd	%edx, %xmm7
	vpbroadcastb	%xmm7, %xmm7
	vpand	%xmm3, %xmm10, %xmm3
	vpunpcklbw	%xmm7, %xmm7, %xmm9
	vpunpcklbw	%xmm3, %xmm3, %xmm4
	vpunpckhbw	%xmm7, %xmm7, %xmm7
	vpunpckhbw	%xmm3, %xmm3, %xmm3
	vpmullw	%xmm4, %xmm9, %xmm4
	vpmullw	%xmm3, %xmm7, %xmm3
	vmovdqa	.LC5(%rip), %xmm8
	addq	%rax, %r13
	movl	%r10d, %eax
	vpand	%xmm4, %xmm8, %xmm4
	vpand	%xmm3, %xmm8, %xmm3
	vpackuswb	%xmm3, %xmm4, %xmm4
	vpsrlw	$4, %xmm5, %xmm3
	vpand	.LC211(%rip), %xmm3, %xmm3
	andl	$-16, %eax
	vpand	%xmm10, %xmm3, %xmm3
	vpunpcklbw	%xmm3, %xmm3, %xmm6
	vpunpckhbw	%xmm3, %xmm3, %xmm3
	vpmullw	%xmm9, %xmm6, %xmm6
	vpmullw	%xmm7, %xmm3, %xmm3
	movl	%eax, %r11d
	negl	%r11d
	vpand	%xmm6, %xmm8, %xmm6
	vpand	%xmm3, %xmm8, %xmm3
	vpackuswb	%xmm3, %xmm6, %xmm6
	vpsrlw	$2, %xmm5, %xmm3
	vpand	.LC213(%rip), %xmm3, %xmm3
	vpand	%xmm10, %xmm5, %xmm5
	vpand	%xmm10, %xmm3, %xmm3
	vpunpcklbw	%xmm3, %xmm3, %xmm11
	vpunpckhbw	%xmm3, %xmm3, %xmm3
	vpmullw	%xmm9, %xmm11, %xmm11
	vpmullw	%xmm7, %xmm3, %xmm3
	vpand	%xmm11, %xmm8, %xmm11
	vpand	%xmm3, %xmm8, %xmm3
	vpackuswb	%xmm3, %xmm11, %xmm11
	vpunpcklbw	%xmm5, %xmm5, %xmm3
	vpunpckhbw	%xmm5, %xmm5, %xmm5
	vpmullw	%xmm9, %xmm3, %xmm9
	vpmullw	%xmm7, %xmm5, %xmm3
	vpand	%xmm9, %xmm8, %xmm5
	vpand	%xmm3, %xmm8, %xmm8
	vpackuswb	%xmm8, %xmm5, %xmm3
	vpunpcklbw	%xmm3, %xmm6, %xmm7
	vpunpcklbw	%xmm11, %xmm4, %xmm5
	vpunpckhbw	%xmm3, %xmm6, %xmm6
	vpunpckhbw	%xmm11, %xmm4, %xmm4
	vpunpcklbw	%xmm7, %xmm5, %xmm3
	vmovdqu	%xmm3, 0(%r13)
	vpunpckhbw	%xmm7, %xmm5, %xmm5
	vpunpcklbw	%xmm6, %xmm4, %xmm3
	vpunpckhbw	%xmm6, %xmm4, %xmm4
	vmovdqu	%xmm5, 16(%r13)
	vmovdqu	%xmm3, 32(%r13)
	vmovdqu	%xmm4, 48(%r13)
	movl	%r10d, %r13d
	movl	416(%rsp), %r10d
	leal	(%r10,%r11,4), %r11d
	movq	544(%rsp), %r10
	movl	%r11d, 416(%rsp)
	movl	%eax, %r11d
	leaq	(%r10,%r11,4), %r10
	addq	%r11, 384(%rsp)
	movq	%r10, 544(%rsp)
	cmpl	%r13d, %eax
	je	.L2375
.L2047:
	movq	544(%rsp), %r11
	movl	416(%rsp), %eax
	movq	384(%rsp), %r10
	leal	(%rax,%r11), %r12d
	.p2align 4,,10
	.p2align 3
.L2049:
	movzbl	(%r10), %eax
	addq	$4, %r11
	shrb	$6, %al
	imull	%edx, %eax
	incq	%r10
	movb	%al, -4(%r11)
	movzbl	-1(%r10), %eax
	shrb	$4, %al
	andl	$3, %eax
	imull	%edx, %eax
	movb	%al, -3(%r11)
	movzbl	-1(%r10), %eax
	shrb	$2, %al
	andl	$3, %eax
	imull	%edx, %eax
	movb	%al, -2(%r11)
	movzbl	-1(%r10), %eax
	andl	$3, %eax
	imull	%edx, %eax
	movb	%al, -1(%r11)
	movl	%r12d, %eax
	subl	%r11d, %eax
	cmpl	$3, %eax
	jg	.L2049
.L2375:
	movq	256(%rsp), %rax
	leaq	(%rsi,%rax), %r11
.L2051:
	movl	160(%rsp), %esi
	addq	240(%rsp), %rdi
	movq	%r11, %r10
.L2042:
	testl	%esi, %esi
	jle	.L2040
	movzbl	(%r10), %eax
	shrb	$6, %al
	imull	%edx, %eax
	movb	%al, (%rdi)
	cmpl	$1, %esi
	je	.L2040
	movzbl	(%r10), %eax
	shrb	$4, %al
	andl	$3, %eax
	imull	%edx, %eax
	movb	%al, 1(%rdi)
	cmpl	$3, %esi
	jne	.L2040
	movzbl	(%r10), %eax
	shrb	$2, %al
	andl	$3, %eax
	imull	%edx, %eax
	movb	%al, 2(%rdi)
	jmp	.L2040
.L2394:
	cmpl	$7, 72(%rsp)
	jle	.L2109
	movq	168(%rsp), %r10
	movq	224(%rsp), %r13
	addq	%r11, %r10
	cmpq	%rcx, %r10
	leaq	(%rcx,%r13), %r12
	setle	%r10b
	cmpq	%r11, %r12
	setle	%r11b
	orb	%r10b, %r11b
	je	.L2054
	movl	56(%rsp), %r11d
	cmpl	$119, %r11d
	jbe	.L2054
	cmpl	$247, %r11d
	jbe	.L2110
	movq	24(%rsp), %r13
	vmovd	%edx, %xmm8
	leaq	1(%r13), %r12
	vpbroadcastb	%xmm8, %ymm8
	salq	$5, %r12
	vpunpcklbw	%ymm8, %ymm8, %ymm12
	movq	%rsi, %r11
	movq	%rdi, %r10
	addq	%rsi, %r12
	vpunpckhbw	%ymm8, %ymm8, %ymm8
	.p2align 4,,10
	.p2align 3
.L2056:
	vmovdqu	(%r11), %ymm3
	addq	$32, %r11
	vpsrlw	$7, %ymm3, %ymm4
	vpand	%ymm4, %ymm2, %ymm4
	vpunpcklbw	%ymm4, %ymm4, %ymm7
	vpunpckhbw	%ymm4, %ymm4, %ymm4
	vpmullw	%ymm7, %ymm12, %ymm7
	vpmullw	%ymm4, %ymm8, %ymm4
	addq	$256, %r10
	vpshufb	%ymm1, %ymm7, %ymm7
	vpshufb	%ymm0, %ymm4, %ymm4
	vpor	%ymm4, %ymm7, %ymm7
	vpsrlw	$6, %ymm3, %ymm4
	vpand	.LC0(%rip), %ymm4, %ymm4
	vpand	%ymm2, %ymm4, %ymm4
	vpunpcklbw	%ymm4, %ymm4, %ymm6
	vpunpckhbw	%ymm4, %ymm4, %ymm4
	vpmullw	%ymm12, %ymm6, %ymm6
	vpmullw	%ymm8, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm6, %ymm6
	vpshufb	%ymm0, %ymm4, %ymm4
	vpor	%ymm4, %ymm6, %ymm6
	vpsrlw	$5, %ymm3, %ymm4
	vpand	.LC214(%rip), %ymm4, %ymm4
	vpand	%ymm2, %ymm4, %ymm4
	vpunpcklbw	%ymm4, %ymm4, %ymm5
	vpunpckhbw	%ymm4, %ymm4, %ymm4
	vpmullw	%ymm12, %ymm5, %ymm5
	vpmullw	%ymm8, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm5, %ymm5
	vpshufb	%ymm0, %ymm4, %ymm4
	vpor	%ymm4, %ymm5, %ymm5
	vpsrlw	$4, %ymm3, %ymm4
	vpand	%ymm4, %ymm15, %ymm4
	vpand	%ymm2, %ymm4, %ymm4
	vpunpcklbw	%ymm4, %ymm4, %ymm10
	vpunpckhbw	%ymm4, %ymm4, %ymm4
	vpmullw	%ymm12, %ymm10, %ymm10
	vpmullw	%ymm8, %ymm4, %ymm9
	vpshufb	%ymm1, %ymm10, %ymm4
	vpshufb	%ymm0, %ymm9, %ymm9
	vpor	%ymm9, %ymm4, %ymm4
	vpsrlw	$3, %ymm3, %ymm9
	vpand	.LC215(%rip), %ymm9, %ymm9
	vpand	%ymm2, %ymm9, %ymm9
	vpunpcklbw	%ymm9, %ymm9, %ymm11
	vpunpckhbw	%ymm9, %ymm9, %ymm9
	vpmullw	%ymm12, %ymm11, %ymm11
	vpmullw	%ymm8, %ymm9, %ymm9
	vpshufb	%ymm1, %ymm11, %ymm11
	vpshufb	%ymm0, %ymm9, %ymm9
	vpor	%ymm9, %ymm11, %ymm11
	vpsrlw	$2, %ymm3, %ymm9
	vpand	.LC212(%rip), %ymm9, %ymm9
	vpand	%ymm2, %ymm9, %ymm9
	vpunpcklbw	%ymm9, %ymm9, %ymm10
	vpunpckhbw	%ymm9, %ymm9, %ymm9
	vpmullw	%ymm12, %ymm10, %ymm10
	vpmullw	%ymm8, %ymm9, %ymm9
	vpshufb	%ymm1, %ymm10, %ymm10
	vpshufb	%ymm0, %ymm9, %ymm9
	vpor	%ymm9, %ymm10, %ymm10
	vpsrlw	$1, %ymm3, %ymm9
	vpand	.LC16(%rip), %ymm9, %ymm9
	vpand	%ymm2, %ymm3, %ymm3
	vpand	%ymm2, %ymm9, %ymm9
	vpunpcklbw	%ymm9, %ymm9, %ymm14
	vpunpckhbw	%ymm9, %ymm9, %ymm9
	vpmullw	%ymm12, %ymm14, %ymm14
	vpmullw	%ymm8, %ymm9, %ymm13
	vpshufb	%ymm1, %ymm14, %ymm9
	vpshufb	%ymm0, %ymm13, %ymm13
	vpor	%ymm13, %ymm9, %ymm9
	vpunpcklbw	%ymm3, %ymm3, %ymm13
	vpunpckhbw	%ymm3, %ymm3, %ymm3
	vpmullw	%ymm12, %ymm13, %ymm13
	vpmullw	%ymm8, %ymm3, %ymm3
	vpshufb	%ymm1, %ymm13, %ymm13
	vpshufb	%ymm0, %ymm3, %ymm3
	vpor	%ymm3, %ymm13, %ymm3
	vpunpcklbw	%ymm11, %ymm7, %ymm13
	vpunpckhbw	%ymm11, %ymm7, %ymm7
	vperm2i128	$32, %ymm7, %ymm13, %ymm11
	vperm2i128	$49, %ymm7, %ymm13, %ymm7
	vpunpcklbw	%ymm10, %ymm6, %ymm13
	vpunpckhbw	%ymm10, %ymm6, %ymm6
	vperm2i128	$32, %ymm6, %ymm13, %ymm10
	vperm2i128	$49, %ymm6, %ymm13, %ymm6
	vpunpcklbw	%ymm9, %ymm5, %ymm13
	vpunpckhbw	%ymm9, %ymm5, %ymm5
	vperm2i128	$32, %ymm5, %ymm13, %ymm9
	vperm2i128	$49, %ymm5, %ymm13, %ymm5
	vpunpcklbw	%ymm3, %ymm4, %ymm13
	vpunpckhbw	%ymm3, %ymm4, %ymm4
	vperm2i128	$32, %ymm4, %ymm13, %ymm14
	vpunpcklbw	%ymm5, %ymm7, %ymm3
	vperm2i128	$49, %ymm4, %ymm13, %ymm13
	vpunpckhbw	%ymm5, %ymm7, %ymm7
	vpunpcklbw	%ymm9, %ymm11, %ymm4
	vpunpckhbw	%ymm9, %ymm11, %ymm11
	vperm2i128	$32, %ymm11, %ymm4, %ymm9
	vperm2i128	$49, %ymm11, %ymm4, %ymm4
	vperm2i128	$32, %ymm7, %ymm3, %ymm11
	vperm2i128	$49, %ymm7, %ymm3, %ymm3
	vpunpcklbw	%ymm14, %ymm10, %ymm7
	vpunpckhbw	%ymm14, %ymm10, %ymm10
	vperm2i128	$32, %ymm10, %ymm7, %ymm14
	vpunpcklbw	%ymm13, %ymm6, %ymm5
	vpunpckhbw	%ymm13, %ymm6, %ymm6
	vperm2i128	$49, %ymm10, %ymm7, %ymm7
	vperm2i128	$32, %ymm6, %ymm5, %ymm10
	vperm2i128	$49, %ymm6, %ymm5, %ymm5
	vpunpcklbw	%ymm14, %ymm9, %ymm6
	vpunpckhbw	%ymm14, %ymm9, %ymm9
	vperm2i128	$32, %ymm9, %ymm6, %ymm13
	vperm2i128	$49, %ymm9, %ymm6, %ymm6
	vmovdqu	%ymm6, -224(%r10)
	vpunpcklbw	%ymm7, %ymm4, %ymm6
	vpunpckhbw	%ymm7, %ymm4, %ymm4
	vperm2i128	$32, %ymm4, %ymm6, %ymm7
	vperm2i128	$49, %ymm4, %ymm6, %ymm6
	vmovdqu	%ymm6, -160(%r10)
	vpunpckhbw	%ymm10, %ymm11, %ymm4
	vpunpcklbw	%ymm10, %ymm11, %ymm6
	vmovdqu	%ymm7, -192(%r10)
	vperm2i128	$32, %ymm4, %ymm6, %ymm7
	vperm2i128	$49, %ymm4, %ymm6, %ymm6
	vpunpcklbw	%ymm5, %ymm3, %ymm4
	vpunpckhbw	%ymm5, %ymm3, %ymm3
	vperm2i128	$32, %ymm3, %ymm4, %ymm5
	vperm2i128	$49, %ymm3, %ymm4, %ymm4
	vmovdqu	%ymm13, -256(%r10)
	vmovdqu	%ymm7, -128(%r10)
	vmovdqu	%ymm6, -96(%r10)
	vmovdqu	%ymm5, -64(%r10)
	vmovdqu	%ymm4, -32(%r10)
	cmpq	%r11, %r12
	jne	.L2056
	movq	32(%rsp), %r11
	movl	128(%rsp), %r10d
	leaq	(%rdi,%r11), %r13
	movq	40(%rsp), %r11
	addq	%rsi, %r11
	movq	%r11, 416(%rsp)
	cmpl	%r10d, 52(%rsp)
	je	.L2376
	movl	%r10d, %r11d
	movl	48(%rsp), %r10d
	movl	%r10d, 544(%rsp)
.L2055:
	movl	64(%rsp), %r12d
	subl	%r11d, %r12d
	leal	1(%r12), %r10d
	cmpl	$14, %r12d
	jbe	.L2058
	vmovdqu	(%rsi,%r11), %xmm5
	vmovdqa	.LC18(%rip), %xmm13
	vpsrlw	$7, %xmm5, %xmm3
	vmovd	%edx, %xmm6
	vpand	%xmm3, %xmm13, %xmm3
	vpbroadcastb	%xmm6, %xmm6
	vpunpcklbw	%xmm6, %xmm6, %xmm12
	vpunpcklbw	%xmm3, %xmm3, %xmm8
	vpunpckhbw	%xmm6, %xmm6, %xmm6
	vpunpckhbw	%xmm3, %xmm3, %xmm3
	vpmullw	%xmm8, %xmm12, %xmm8
	vpmullw	%xmm3, %xmm6, %xmm3
	vmovdqa	.LC5(%rip), %xmm4
	leaq	(%rcx,%r11,8), %r12
	addq	%r12, %rax
	vpand	%xmm8, %xmm4, %xmm8
	vpand	%xmm3, %xmm4, %xmm3
	vpackuswb	%xmm3, %xmm8, %xmm8
	vpsrlw	$6, %xmm5, %xmm3
	vpand	.LC3(%rip), %xmm3, %xmm3
	movl	%r10d, %r12d
	vpand	%xmm13, %xmm3, %xmm3
	vpunpcklbw	%xmm3, %xmm3, %xmm11
	vpunpckhbw	%xmm3, %xmm3, %xmm3
	vpmullw	%xmm12, %xmm11, %xmm11
	vpmullw	%xmm6, %xmm3, %xmm3
	vpand	%xmm11, %xmm4, %xmm11
	vpand	%xmm3, %xmm4, %xmm3
	vpackuswb	%xmm3, %xmm11, %xmm11
	vpsrlw	$5, %xmm5, %xmm3
	vpand	.LC216(%rip), %xmm3, %xmm3
	vpand	%xmm13, %xmm3, %xmm3
	vpunpcklbw	%xmm3, %xmm3, %xmm10
	vpunpckhbw	%xmm3, %xmm3, %xmm3
	vpmullw	%xmm12, %xmm10, %xmm10
	vpmullw	%xmm6, %xmm3, %xmm3
	vpand	%xmm10, %xmm4, %xmm10
	vpand	%xmm3, %xmm4, %xmm3
	vpackuswb	%xmm3, %xmm10, %xmm10
	vpsrlw	$4, %xmm5, %xmm3
	vpand	.LC211(%rip), %xmm3, %xmm3
	vpand	%xmm13, %xmm3, %xmm3
	vpunpcklbw	%xmm3, %xmm3, %xmm9
	vpunpckhbw	%xmm3, %xmm3, %xmm3
	vpmullw	%xmm12, %xmm9, %xmm9
	vpmullw	%xmm6, %xmm3, %xmm3
	vpand	%xmm9, %xmm4, %xmm9
	vpand	%xmm3, %xmm4, %xmm3
	vpackuswb	%xmm3, %xmm9, %xmm9
	vpsrlw	$3, %xmm5, %xmm3
	vpand	.LC217(%rip), %xmm3, %xmm3
	vpand	%xmm13, %xmm3, %xmm3
	vpunpcklbw	%xmm3, %xmm3, %xmm7
	vpunpckhbw	%xmm3, %xmm3, %xmm3
	vpmullw	%xmm12, %xmm7, %xmm7
	vpmullw	%xmm6, %xmm3, %xmm3
	vpand	%xmm7, %xmm4, %xmm7
	vpand	%xmm3, %xmm4, %xmm3
	vpackuswb	%xmm3, %xmm7, %xmm7
	vpsrlw	$2, %xmm5, %xmm3
	vpand	.LC213(%rip), %xmm3, %xmm3
	vmovdqa	%xmm7, 384(%rsp)
	vpand	%xmm13, %xmm3, %xmm3
	vpunpcklbw	%xmm3, %xmm3, %xmm7
	vpunpckhbw	%xmm3, %xmm3, %xmm3
	vpmullw	%xmm12, %xmm7, %xmm7
	vpmullw	%xmm6, %xmm3, %xmm3
	vpand	%xmm7, %xmm4, %xmm7
	vpand	%xmm3, %xmm4, %xmm3
	vpackuswb	%xmm3, %xmm7, %xmm7
	vpsrlw	$1, %xmm5, %xmm3
	vpand	.LC17(%rip), %xmm3, %xmm3
	vpand	%xmm13, %xmm5, %xmm5
	vpand	%xmm13, %xmm3, %xmm3
	vpunpcklbw	%xmm3, %xmm3, %xmm14
	vpunpcklbw	%xmm5, %xmm5, %xmm13
	vpunpckhbw	%xmm3, %xmm3, %xmm3
	vpunpckhbw	%xmm5, %xmm5, %xmm5
	vpmullw	%xmm6, %xmm5, %xmm5
	vpmullw	%xmm12, %xmm14, %xmm14
	vpmullw	%xmm6, %xmm3, %xmm3
	vpmullw	%xmm12, %xmm13, %xmm13
	vpunpcklbw	%xmm7, %xmm11, %xmm12
	vpunpckhbw	%xmm7, %xmm11, %xmm7
	vpand	%xmm14, %xmm4, %xmm14
	vpand	%xmm3, %xmm4, %xmm3
	vpand	%xmm13, %xmm4, %xmm6
	vpand	%xmm5, %xmm4, %xmm4
	vmovdqa	384(%rsp), %xmm5
	vpackuswb	%xmm4, %xmm6, %xmm6
	vpackuswb	%xmm3, %xmm14, %xmm3
	vpunpcklbw	%xmm5, %xmm8, %xmm4
	vpunpckhbw	%xmm5, %xmm8, %xmm8
	vpunpcklbw	%xmm3, %xmm10, %xmm5
	vpunpckhbw	%xmm3, %xmm10, %xmm3
	vpunpcklbw	%xmm6, %xmm9, %xmm10
	vpunpcklbw	%xmm10, %xmm12, %xmm11
	vpunpckhbw	%xmm6, %xmm9, %xmm6
	vpunpcklbw	%xmm5, %xmm4, %xmm9
	vpunpckhbw	%xmm5, %xmm4, %xmm5
	vpunpcklbw	%xmm3, %xmm8, %xmm4
	vpunpckhbw	%xmm3, %xmm8, %xmm3
	vpunpcklbw	%xmm6, %xmm7, %xmm8
	vpunpckhbw	%xmm6, %xmm7, %xmm7
	vpunpcklbw	%xmm11, %xmm9, %xmm6
	vpunpckhbw	%xmm10, %xmm12, %xmm10
	vmovdqu	%xmm6, (%rax)
	vpunpckhbw	%xmm11, %xmm9, %xmm6
	vmovdqu	%xmm6, 16(%rax)
	vpunpcklbw	%xmm10, %xmm5, %xmm6
	vpunpckhbw	%xmm10, %xmm5, %xmm5
	vmovdqu	%xmm5, 48(%rax)
	vpunpcklbw	%xmm8, %xmm4, %xmm5
	vpunpckhbw	%xmm8, %xmm4, %xmm4
	vmovdqu	%xmm4, 80(%rax)
	vpunpcklbw	%xmm7, %xmm3, %xmm4
	vpunpckhbw	%xmm7, %xmm3, %xmm3
	vmovdqu	%xmm6, 32(%rax)
	vmovdqu	%xmm5, 64(%rax)
	vmovdqu	%xmm4, 96(%rax)
	vmovdqu	%xmm3, 112(%rax)
	movl	%r10d, %eax
	andl	$-16, %eax
	movl	544(%rsp), %r10d
	movl	%eax, %r11d
	negl	%r11d
	leal	(%r10,%r11,8), %r11d
	movl	%r11d, 544(%rsp)
	movl	%eax, %r11d
	addq	%r11, 416(%rsp)
	leaq	0(%r13,%r11,8), %r13
	cmpl	%eax, %r12d
	je	.L2376
.L2058:
	movl	544(%rsp), %eax
	movq	416(%rsp), %r10
	movq	%r13, %r11
	leal	(%rax,%r13), %r12d
	.p2align 4,,10
	.p2align 3
.L2060:
	movzbl	(%r10), %eax
	addq	$8, %r11
	shrb	$7, %al
	imull	%edx, %eax
	incq	%r10
	movb	%al, -8(%r11)
	movzbl	-1(%r10), %eax
	shrb	$6, %al
	andl	$1, %eax
	imull	%edx, %eax
	movb	%al, -7(%r11)
	movzbl	-1(%r10), %eax
	shrb	$5, %al
	andl	$1, %eax
	imull	%edx, %eax
	movb	%al, -6(%r11)
	movzbl	-1(%r10), %eax
	shrb	$4, %al
	andl	$1, %eax
	imull	%edx, %eax
	movb	%al, -5(%r11)
	movzbl	-1(%r10), %eax
	shrb	$3, %al
	andl	$1, %eax
	imull	%edx, %eax
	movb	%al, -4(%r11)
	movzbl	-1(%r10), %eax
	shrb	$2, %al
	andl	$1, %eax
	imull	%edx, %eax
	movb	%al, -3(%r11)
	movzbl	-1(%r10), %eax
	shrb	%al
	andl	$1, %eax
	imull	%edx, %eax
	movb	%al, -2(%r11)
	movzbl	-1(%r10), %eax
	andl	$1, %eax
	imull	%edx, %eax
	movb	%al, -1(%r11)
	movl	%r12d, %eax
	subl	%r11d, %eax
	cmpl	$7, %eax
	jg	.L2060
.L2376:
	movq	224(%rsp), %rax
	leaq	(%rdi,%rax), %r11
.L2062:
	movq	168(%rsp), %rax
	movq	%r11, %rdi
	leaq	(%rsi,%rax), %r10
	movl	68(%rsp), %esi
.L2053:
	testl	%esi, %esi
	jle	.L2040
	movzbl	(%r10), %eax
	shrb	$7, %al
	imull	%edx, %eax
	movb	%al, (%rdi)
	cmpl	$1, %esi
	je	.L2040
	movzbl	(%r10), %eax
	shrb	$6, %al
	andl	$1, %eax
	imull	%edx, %eax
	movb	%al, 1(%rdi)
	cmpl	$2, %esi
	je	.L2040
	movzbl	(%r10), %eax
	shrb	$5, %al
	andl	$1, %eax
	imull	%edx, %eax
	movb	%al, 2(%rdi)
	cmpl	$3, %esi
	je	.L2040
	movzbl	(%r10), %eax
	shrb	$4, %al
	andl	$1, %eax
	imull	%edx, %eax
	movb	%al, 3(%rdi)
	cmpl	$4, %esi
	je	.L2040
	movzbl	(%r10), %eax
	shrb	$3, %al
	andl	$1, %eax
	imull	%edx, %eax
	movb	%al, 4(%rdi)
	cmpl	$5, %esi
	je	.L2040
	movzbl	(%r10), %eax
	shrb	$2, %al
	andl	$1, %eax
	imull	%edx, %eax
	movb	%al, 5(%rdi)
	cmpl	$7, %esi
	jne	.L2040
	movzbl	(%r10), %eax
	shrb	%al
	andl	$1, %eax
	imull	%edx, %eax
	movb	%al, 6(%rdi)
	jmp	.L2040
.L2381:
	leaq	.LC206(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	vzeroupper
	jmp	.L1822
.L2384:
	movl	480(%rsp), %r15d
	movl	448(%rsp), %r14d
	movq	416(%rsp), %r11
	jmp	.L1859
.L1875:
	movl	%r12d, %ecx
	xorl	%edx, %edx
	addq	%r13, %rax
	.p2align 4,,10
	.p2align 3
.L1882:
	movzbl	(%rbx,%rdx), %esi
	addb	(%rax,%rdx), %sil
	movb	%sil, 0(%r13,%rdx)
	incq	%rdx
	cmpq	%rdx, %rcx
	jne	.L1882
	jmp	.L1859
.L1923:
	movl	%r12d, %ecx
	xorl	%edx, %edx
	addq	%r13, %rax
	.p2align 4,,10
	.p2align 3
.L1930:
	movzbl	(%rbx,%rdx), %esi
	addb	(%rax,%rdx), %sil
	movb	%sil, 0(%r13,%rdx)
	incq	%rdx
	cmpq	%rdx, %rcx
	jne	.L1930
	jmp	.L1859
.L2388:
	movl	448(%rsp), %r15d
	movl	416(%rsp), %r14d
	jmp	.L1859
.L1914:
	movl	%r12d, %ecx
	xorl	%edx, %edx
	addq	%r13, %rax
	.p2align 4,,10
	.p2align 3
.L1921:
	movzbl	(%rax,%rdx), %esi
	shrb	%sil
	addb	(%rbx,%rdx), %sil
	movb	%sil, 0(%r13,%rdx)
	incq	%rdx
	cmpq	%rdx, %rcx
	jne	.L1921
	jmp	.L1859
.L1884:
	movl	%r12d, %esi
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L1891:
	movzbl	(%rax,%rdx), %ecx
	addb	(%rbx,%rdx), %cl
	movb	%cl, 0(%r13,%rdx)
	incq	%rdx
	cmpq	%rdx, %rsi
	jne	.L1891
	jmp	.L1859
.L1893:
	movl	%r12d, %edi
	xorl	%esi, %esi
	addq	%r13, %rdx
	.p2align 4,,10
	.p2align 3
.L1900:
	movzbl	(%rdx,%rsi), %ecx
	movzbl	(%rax,%rsi), %r8d
	addl	%r8d, %ecx
	sarl	%ecx
	addb	(%rbx,%rsi), %cl
	movb	%cl, 0(%r13,%rsi)
	incq	%rsi
	cmpq	%rsi, %rdi
	jne	.L1900
	jmp	.L1859
.L2390:
	movl	272(%rsp), %ecx
	movq	208(%rsp), %rax
	imull	168(%rsp), %ecx
	movq	24(%rax), %rsi
	imull	276(%rsp), %ecx
	testl	%ecx, %ecx
	je	.L2371
	leal	-1(%rcx), %eax
	cmpl	$14, %eax
	movq	%rsi, %rax
	jbe	.L2112
	movl	%ecx, %edx
	shrl	$4, %edx
	decl	%edx
	salq	$5, %rdx
	leaq	32(%rsi,%rdx), %rdx
.L2071:
	vmovdqu	(%rax), %ymm0
	addq	$32, %rax
	vpsrlw	$8, %ymm0, %ymm1
	vpsllw	$8, %ymm0, %ymm0
	vpor	%ymm0, %ymm1, %ymm0
	vmovdqu	%ymm0, -32(%rax)
	cmpq	%rax, %rdx
	jne	.L2071
	movl	%ecx, %edx
	andl	$-16, %edx
	movl	%edx, %eax
	leaq	(%rsi,%rax,2), %rax
	cmpl	%edx, %ecx
	je	.L2371
.L2070:
	movl	%ecx, %edi
	subl	%edx, %edi
	leal	-1(%rdi), %r8d
	cmpl	$6, %r8d
	jbe	.L2073
	movl	%edx, %r8d
	leaq	(%rsi,%r8,2), %rsi
	vmovdqu	(%rsi), %xmm0
	vpsrlw	$8, %xmm0, %xmm1
	vpsllw	$8, %xmm0, %xmm0
	vpor	%xmm0, %xmm1, %xmm0
	vmovdqu	%xmm0, (%rsi)
	movl	%edi, %esi
	andl	$-8, %esi
	movl	%esi, %r8d
	addl	%esi, %edx
	leaq	(%rax,%r8,2), %rax
	cmpl	%esi, %edi
	je	.L2371
.L2073:
	movbew	(%rax), %si
	movw	%si, (%rax)
	leal	1(%rdx), %esi
	cmpl	%esi, %ecx
	jbe	.L2371
	movbew	2(%rax), %si
	movw	%si, 2(%rax)
	leal	2(%rdx), %esi
	cmpl	%ecx, %esi
	jnb	.L2371
	movbew	4(%rax), %si
	movw	%si, 4(%rax)
	leal	3(%rdx), %esi
	cmpl	%ecx, %esi
	jnb	.L2371
	movbew	6(%rax), %si
	movw	%si, 6(%rax)
	leal	4(%rdx), %esi
	cmpl	%ecx, %esi
	jnb	.L2371
	movbew	8(%rax), %si
	movw	%si, 8(%rax)
	leal	5(%rdx), %esi
	cmpl	%ecx, %esi
	jnb	.L2371
	movbew	10(%rax), %si
	addl	$6, %edx
	movw	%si, 10(%rax)
	cmpl	%ecx, %edx
	jnb	.L2371
	movbew	12(%rax), %dx
	movw	%dx, 12(%rax)
	vzeroupper
	jmp	.L1836
.L2031:
	movq	480(%rsp), %rax
	movq	%rdi, %r11
	leaq	(%rsi,%rax), %r10
.L2037:
	movzbl	(%rsi), %eax
	addq	$2, %r11
	shrb	$4, %al
	imull	%edx, %eax
	incq	%rsi
	movb	%al, -2(%r11)
	movzbl	-1(%rsi), %eax
	andl	$15, %eax
	imull	%edx, %eax
	movb	%al, -1(%r11)
	cmpq	%r10, %rsi
	jne	.L2037
	jmp	.L2038
.L2043:
	movq	256(%rsp), %rax
	movq	%rdi, %r10
	leaq	(%rsi,%rax), %r11
.L2050:
	movzbl	(%rsi), %eax
	addq	$4, %r10
	shrb	$6, %al
	imull	%edx, %eax
	incq	%rsi
	movb	%al, -4(%r10)
	movzbl	-1(%rsi), %eax
	shrb	$4, %al
	andl	$3, %eax
	imull	%edx, %eax
	movb	%al, -3(%r10)
	movzbl	-1(%rsi), %eax
	shrb	$2, %al
	andl	$3, %eax
	imull	%edx, %eax
	movb	%al, -2(%r10)
	movzbl	-1(%rsi), %eax
	andl	$3, %eax
	imull	%edx, %eax
	movb	%al, -1(%r10)
	cmpq	%r11, %rsi
	jne	.L2050
	jmp	.L2051
.L2084:
	xorl	%edx, %edx
	xorl	%esi, %esi
	jmp	.L1903
.L2054:
	movq	224(%rsp), %rax
	movq	%rsi, %r10
	leaq	(%rdi,%rax), %r11
.L2061:
	movzbl	(%r10), %eax
	addq	$8, %rdi
	shrb	$7, %al
	imull	%edx, %eax
	incq	%r10
	movb	%al, -8(%rdi)
	movzbl	-1(%r10), %eax
	shrb	$6, %al
	andl	$1, %eax
	imull	%edx, %eax
	movb	%al, -7(%rdi)
	movzbl	-1(%r10), %eax
	shrb	$5, %al
	andl	$1, %eax
	imull	%edx, %eax
	movb	%al, -6(%rdi)
	movzbl	-1(%r10), %eax
	shrb	$4, %al
	andl	$1, %eax
	imull	%edx, %eax
	movb	%al, -5(%rdi)
	movzbl	-1(%r10), %eax
	shrb	$3, %al
	andl	$1, %eax
	imull	%edx, %eax
	movb	%al, -4(%rdi)
	movzbl	-1(%r10), %eax
	shrb	$2, %al
	andl	$1, %eax
	imull	%edx, %eax
	movb	%al, -3(%rdi)
	movzbl	-1(%r10), %eax
	shrb	%al
	andl	$1, %eax
	imull	%edx, %eax
	movb	%al, -2(%rdi)
	movzbl	-1(%r10), %eax
	andl	$1, %eax
	imull	%edx, %eax
	movb	%al, -1(%rdi)
	cmpq	%r11, %rdi
	jne	.L2061
	jmp	.L2062
.L2086:
	xorl	%ecx, %ecx
	xorl	%edi, %edi
	addq	%r13, %rax
	jmp	.L1915
.L2083:
	xorl	%esi, %esi
	xorl	%r8d, %r8d
	addq	%r13, %rdx
	jmp	.L1894
.L2105:
	movl	72(%rsp), %eax
	jmp	.L2030
.L2082:
	xorl	%ecx, %ecx
	xorl	%edi, %edi
	jmp	.L1885
.L2087:
	xorl	%ecx, %ecx
	xorl	%edi, %edi
	addq	%r13, %rax
	jmp	.L1924
.L2081:
	xorl	%ecx, %ecx
	xorl	%edi, %edi
	addq	%r13, %rax
	jmp	.L1876
.L2107:
	movl	72(%rsp), %esi
	jmp	.L2042
.L2109:
	movl	72(%rsp), %esi
	jmp	.L2053
.L2108:
	movl	72(%rsp), %r10d
	movq	%rsi, 384(%rsp)
	movq	%rdi, 544(%rsp)
	movl	%r10d, 416(%rsp)
	xorl	%r12d, %r12d
	jmp	.L2044
.L2106:
	movl	72(%rsp), %r13d
	movl	$0, 384(%rsp)
	movl	%r13d, 544(%rsp)
	movq	%rsi, %r11
	movq	%rdi, %r10
	jmp	.L2032
.L2110:
	movl	72(%rsp), %r11d
	movq	%rsi, 416(%rsp)
	movl	%r11d, 544(%rsp)
	movq	%rdi, %r13
	xorl	%r11d, %r11d
	jmp	.L2055
.L2379:
	leaq	__PRETTY_FUNCTION__.47(%rip), %rcx
	movl	$4607, %edx
	leaq	.LC21(%rip), %rsi
	leaq	.LC202(%rip), %rdi
	call	__assert_fail@PLT
.L2112:
	xorl	%edx, %edx
	jmp	.L2070
.L2386:
	leaq	__PRETTY_FUNCTION__.47(%rip), %rcx
	movl	$4691, %edx
	leaq	.LC21(%rip), %rsi
	leaq	.LC207(%rip), %rdi
	vzeroupper
	call	__assert_fail@PLT
.L2396:
	leaq	__PRETTY_FUNCTION__.47(%rip), %rcx
	movl	$4780, %edx
	leaq	.LC21(%rip), %rsi
	leaq	.LC218(%rip), %rdi
	vzeroupper
	call	__assert_fail@PLT
	.cfi_endproc
.LFE705:
	.size	stbi__create_png_image_raw, .-stbi__create_png_image_raw
	.section	.rodata.str1.1
.LC219:
	.string	"#?RADIANCE\n"
.LC220:
	.string	"#?RGBE\n"
	.text
	.p2align 4
	.type	stbi__hdr_test, @function
stbi__hdr_test:
.LFB758:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	leaq	56(%rdi), %r14
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	leaq	1+.LC219(%rip), %r13
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	leaq	57(%rdi), %r12
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movl	$35, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movq	%rdi, %rbx
	movq	192(%rdi), %rdx
	movq	200(%rdi), %rcx
	jmp	.L2403
	.p2align 4,,10
	.p2align 3
.L2398:
	movl	48(%rbx), %eax
	testl	%eax, %eax
	jne	.L2421
.L2399:
	cmpl	%eax, %ebp
	jne	.L2402
.L2423:
	movsbl	0(%r13), %ebp
	incq	%r13
	testb	%bpl, %bpl
	je	.L2422
.L2403:
	cmpq	%rcx, %rdx
	jnb	.L2398
	leaq	1(%rdx), %rsi
	movq	%rsi, 192(%rbx)
	movzbl	(%rdx), %eax
	movq	%rsi, %rdx
	cmpl	%eax, %ebp
	je	.L2423
.L2402:
	vmovdqu	208(%rbx), %xmm0
	leaq	1+.LC220(%rip), %r13
	vpextrq	$1, %xmm0, %rdx
	vmovq	%xmm0, %rax
	vmovdqu	%xmm0, 192(%rbx)
	movl	$35, %ebp
	leaq	56(%rbx), %r14
	leaq	57(%rbx), %r12
	jmp	.L2410
	.p2align 4,,10
	.p2align 3
.L2405:
	movl	48(%rbx), %eax
	testl	%eax, %eax
	jne	.L2424
.L2406:
	cmpl	%eax, %ebp
	jne	.L2411
.L2425:
	movsbl	0(%r13), %ebp
	incq	%r13
	testb	%bpl, %bpl
	je	.L2412
	movq	192(%rbx), %rax
	movq	200(%rbx), %rdx
.L2410:
	cmpq	%rdx, %rax
	jnb	.L2405
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rbx)
	movzbl	(%rax), %eax
	cmpl	%eax, %ebp
	je	.L2425
.L2411:
	xorl	%r8d, %r8d
.L2409:
	movq	208(%rbx), %rax
	movq	%rax, 192(%rbx)
	movq	216(%rbx), %rax
	jmp	.L2404
	.p2align 4,,10
	.p2align 3
.L2421:
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%r14, %rsi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	movq	%r12, %rdx
	testl	%eax, %eax
	jne	.L2400
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	movq	%r12, %rcx
.L2401:
	vmovq	%r12, %xmm1
	vpinsrq	$1, %rcx, %xmm1, %xmm0
	vmovdqu	%xmm0, 192(%rbx)
	jmp	.L2399
	.p2align 4,,10
	.p2align 3
.L2400:
	cltq
	leaq	(%r14,%rax), %rcx
	movzbl	56(%rbx), %eax
	jmp	.L2401
	.p2align 4,,10
	.p2align 3
.L2422:
	movq	208(%rbx), %rax
	movl	$1, %r8d
	movq	%rax, 192(%rbx)
	movq	216(%rbx), %rax
.L2404:
	movq	%rax, 200(%rbx)
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	movl	%r8d, %eax
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L2424:
	.cfi_restore_state
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%r14, %rsi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	testl	%eax, %eax
	je	.L2426
	cltq
	leaq	(%r14,%rax), %rdx
	movzbl	56(%rbx), %eax
.L2408:
	vmovq	%r12, %xmm2
	vpinsrq	$1, %rdx, %xmm2, %xmm0
	vmovdqu	%xmm0, 192(%rbx)
	jmp	.L2406
	.p2align 4,,10
	.p2align 3
.L2426:
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	movq	%r12, %rdx
	jmp	.L2408
	.p2align 4,,10
	.p2align 3
.L2412:
	movl	$1, %r8d
	jmp	.L2409
	.cfi_endproc
.LFE758:
	.size	stbi__hdr_test, .-stbi__hdr_test
	.p2align 4
	.type	stbi__get8, @function
stbi__get8:
.LFB626:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rdi, %rbx
	movq	192(%rdi), %rax
	cmpq	200(%rdi), %rax
	jb	.L2434
	movl	48(%rdi), %eax
	xorl	%r12d, %r12d
	testl	%eax, %eax
	jne	.L2435
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	movl	%r12d, %eax
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L2434:
	.cfi_restore_state
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rdi)
	movzbl	(%rax), %r12d
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	movl	%r12d, %eax
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L2435:
	.cfi_restore_state
	movl	52(%rdi), %edx
	leaq	56(%rdi), %rbp
	movq	40(%rdi), %rdi
	movq	%rbp, %rsi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	leaq	57(%rbx), %rdx
	testl	%eax, %eax
	jne	.L2430
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	movq	%rdx, %rbp
.L2431:
	vmovq	%rdx, %xmm1
	vpinsrq	$1, %rbp, %xmm1, %xmm0
	vmovdqu	%xmm0, 192(%rbx)
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	movl	%r12d, %eax
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L2430:
	.cfi_restore_state
	cltq
	movzbl	56(%rbx), %r12d
	addq	%rax, %rbp
	jmp	.L2431
	.cfi_endproc
.LFE626:
	.size	stbi__get8, .-stbi__get8
	.p2align 4
	.type	stbi__compute_huffman_codes, @function
stbi__compute_huffman_codes:
.LFB691:
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
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	subq	$2712, %rsp
	.cfi_def_cfa_offset 2768
	movq	%fs:40, %rax
	movq	%rax, 2696(%rsp)
	movl	16(%rdi), %eax
	movl	20(%rdi), %r12d
	cmpl	$4, %eax
	jle	.L2576
.L2437:
	movl	%r12d, %ebp
	shrl	$5, %ebp
	subl	$5, %eax
	movl	%ebp, 20(%rbx)
	movl	%eax, 16(%rbx)
	cmpl	$4, %eax
	jle	.L2577
.L2442:
	movl	%ebp, %r8d
	shrl	$5, %r8d
	subl	$5, %eax
	movl	%r8d, 20(%rbx)
	movl	%eax, 16(%rbx)
	cmpl	$3, %eax
	jle	.L2578
.L2447:
	movl	%r8d, %ecx
	shrl	$4, %ecx
	subl	$4, %eax
	andl	$15, %r8d
	vpxor	%xmm0, %xmm0, %xmm0
	xorl	%edx, %edx
	movl	%ecx, 20(%rbx)
	movl	%eax, 16(%rbx)
	movw	%dx, 2224(%rsp)
	movb	$0, 2226(%rsp)
	addl	$4, %r8d
	vmovdqa	%xmm0, 2208(%rsp)
	xorl	%esi, %esi
	leaq	length_dezigzag.31(%rip), %r10
	jmp	.L2457
	.p2align 4,,10
	.p2align 3
.L2452:
	movzbl	(%r10,%rsi), %edx
	movl	%ecx, %edi
	andl	$7, %edi
	shrl	$3, %ecx
	subl	$3, %eax
	incq	%rsi
	movl	%ecx, 20(%rbx)
	movl	%eax, 16(%rbx)
	movb	%dil, 2208(%rsp,%rdx)
	cmpl	%esi, %r8d
	jle	.L2579
.L2457:
	cmpl	$2, %eax
	jg	.L2452
	movq	8(%rbx), %rdi
	jmp	.L2456
	.p2align 4,,10
	.p2align 3
.L2453:
	movq	(%rbx), %rdx
	cmpq	%rdi, %rdx
	jnb	.L2454
	leaq	1(%rdx), %r9
	movq	%r9, (%rbx)
	movzbl	(%rdx), %edx
	shlx	%eax, %edx, %edx
	orl	%edx, %ecx
.L2454:
	addl	$8, %eax
	movl	%ecx, 20(%rbx)
	movl	%eax, 16(%rbx)
	cmpl	$24, %eax
	jg	.L2452
.L2456:
	shrx	%eax, %ecx, %edx
	testl	%edx, %edx
	je	.L2453
	movq	%rdi, (%rbx)
	jmp	.L2452
	.p2align 4,,10
	.p2align 3
.L2579:
	leaq	176(%rsp), %r13
	vpxor	%xmm0, %xmm0, %xmm0
	xorl	%esi, %esi
	movl	$1024, %edx
	movq	%r13, %rdi
	movl	$0, 160(%rsp)
	vmovdqa	%xmm0, 96(%rsp)
	vmovdqa	%xmm0, 112(%rsp)
	vmovdqa	%xmm0, 128(%rsp)
	vmovdqa	%xmm0, 144(%rsp)
	call	memset@PLT
	leaq	2208(%rsp), %rcx
	movq	%rcx, %rax
	leaq	2227(%rsp), %rsi
	.p2align 4,,10
	.p2align 3
.L2458:
	movzbl	(%rax), %edx
	incq	%rax
	incl	96(%rsp,%rdx,4)
	cmpq	%rax, %rsi
	jne	.L2458
	movl	100(%rsp), %esi
	movl	$0, 96(%rsp)
	cmpl	$2, %esi
	jg	.L2459
	movl	104(%rsp), %edx
	cmpl	$4, %edx
	jg	.L2459
	movl	108(%rsp), %edi
	cmpl	$8, %edi
	jg	.L2459
	movl	112(%rsp), %r8d
	cmpl	$16, %r8d
	jg	.L2459
	movl	116(%rsp), %r9d
	cmpl	$32, %r9d
	jg	.L2459
	movl	120(%rsp), %r10d
	cmpl	$64, %r10d
	jg	.L2459
	movl	124(%rsp), %r11d
	cmpl	$128, %r11d
	jg	.L2459
	movl	128(%rsp), %r14d
	cmpl	$256, %r14d
	jg	.L2459
	movl	132(%rsp), %eax
	movl	%eax, 4(%rsp)
	cmpl	$512, %eax
	jg	.L2459
	movl	136(%rsp), %eax
	movl	%eax, 8(%rsp)
	cmpl	$1024, %eax
	jg	.L2459
	movl	140(%rsp), %eax
	movl	%eax, 12(%rsp)
	cmpl	$2048, %eax
	jg	.L2459
	movl	144(%rsp), %eax
	movl	%eax, 16(%rsp)
	cmpl	$4096, %eax
	jg	.L2459
	movl	148(%rsp), %eax
	movl	%eax, 20(%rsp)
	cmpl	$8192, %eax
	jg	.L2459
	movl	152(%rsp), %eax
	movl	%eax, 24(%rsp)
	cmpl	$16384, %eax
	jg	.L2459
	movl	156(%rsp), %eax
	movl	%eax, 28(%rsp)
	cmpl	$32768, %eax
	jg	.L2459
	xorl	%eax, %eax
	movw	%ax, 1202(%rsp)
	movl	%esi, %eax
	sall	$15, %eax
	movl	%eax, 1236(%rsp)
	xorl	%r15d, %r15d
	leal	(%rsi,%rsi), %eax
	movl	%eax, 40(%rsp)
	movw	%ax, 1204(%rsp)
	movl	$0, 36(%rsp)
	movw	%r15w, 1302(%rsp)
	movw	%si, 1304(%rsp)
	addl	%edx, %eax
	testl	%edx, %edx
	je	.L2462
	cmpl	$4, %eax
	jg	.L2491
.L2462:
	movl	%eax, %r15d
	sall	$14, %r15d
	addl	%eax, %eax
	addl	%esi, %edx
	movl	%eax, 44(%rsp)
	movw	%ax, 1206(%rsp)
	movl	%r15d, 1240(%rsp)
	movw	%dx, 1306(%rsp)
	addl	%edi, %eax
	testl	%edi, %edi
	je	.L2464
	cmpl	$8, %eax
	jg	.L2491
.L2464:
	movl	%eax, %esi
	sall	$13, %esi
	addl	%eax, %eax
	addl	%edi, %edx
	movl	%eax, 48(%rsp)
	movw	%ax, 1208(%rsp)
	movl	%esi, 1244(%rsp)
	movw	%dx, 1308(%rsp)
	addl	%r8d, %eax
	testl	%r8d, %r8d
	je	.L2465
	cmpl	$16, %eax
	jg	.L2491
.L2465:
	movl	%eax, %esi
	sall	$12, %esi
	addl	%eax, %eax
	addl	%r8d, %edx
	movl	%eax, 52(%rsp)
	movw	%ax, 1210(%rsp)
	movl	%esi, 1248(%rsp)
	movw	%dx, 1310(%rsp)
	addl	%r9d, %eax
	testl	%r9d, %r9d
	je	.L2466
	cmpl	$32, %eax
	jg	.L2491
.L2466:
	movl	%eax, %esi
	sall	$11, %esi
	addl	%eax, %eax
	addl	%r9d, %edx
	movl	%eax, 56(%rsp)
	movw	%ax, 1212(%rsp)
	movl	%esi, 1252(%rsp)
	movw	%dx, 1312(%rsp)
	addl	%r10d, %eax
	testl	%r10d, %r10d
	je	.L2467
	cmpl	$64, %eax
	jg	.L2491
.L2467:
	movl	%eax, %esi
	sall	$10, %esi
	addl	%eax, %eax
	addl	%r10d, %edx
	movl	%eax, 60(%rsp)
	movw	%ax, 1214(%rsp)
	movl	%esi, 1256(%rsp)
	movw	%dx, 1314(%rsp)
	addl	%r11d, %eax
	testl	%r11d, %r11d
	je	.L2468
	cmpl	$128, %eax
	jg	.L2491
.L2468:
	movl	%eax, %esi
	sall	$9, %esi
	addl	%eax, %eax
	addl	%r11d, %edx
	movl	%eax, 64(%rsp)
	movw	%ax, 1216(%rsp)
	movl	%esi, 1260(%rsp)
	movw	%dx, 1316(%rsp)
	addl	%r14d, %eax
	testl	%r14d, %r14d
	je	.L2469
	cmpl	$256, %eax
	jg	.L2491
.L2469:
	movl	%eax, %esi
	sall	$8, %esi
	movl	%esi, 1264(%rsp)
	movl	4(%rsp), %esi
	addl	%eax, %eax
	addl	%r14d, %edx
	movl	%eax, 68(%rsp)
	movw	%ax, 1218(%rsp)
	movw	%dx, 1318(%rsp)
	addl	%esi, %eax
	testl	%esi, %esi
	je	.L2470
	cmpl	$512, %eax
	jg	.L2491
.L2470:
	movl	%eax, %esi
	movl	8(%rsp), %edi
	addl	%eax, %eax
	sall	$7, %esi
	addl	4(%rsp), %edx
	movl	%eax, 72(%rsp)
	movw	%ax, 1220(%rsp)
	movl	%esi, 1268(%rsp)
	movw	%dx, 1320(%rsp)
	addl	%edi, %eax
	testl	%edi, %edi
	je	.L2471
	cmpl	$1024, %eax
	jg	.L2491
.L2471:
	movl	%eax, %esi
	movl	12(%rsp), %edi
	addl	%eax, %eax
	sall	$6, %esi
	addl	8(%rsp), %edx
	movl	%eax, 76(%rsp)
	movw	%ax, 1222(%rsp)
	movl	%esi, 1272(%rsp)
	movw	%dx, 1322(%rsp)
	addl	%edi, %eax
	testl	%edi, %edi
	je	.L2472
	cmpl	$2048, %eax
	jg	.L2491
.L2472:
	movl	%eax, %esi
	movl	16(%rsp), %edi
	addl	%eax, %eax
	sall	$5, %esi
	addl	12(%rsp), %edx
	movl	%eax, 80(%rsp)
	movw	%ax, 1224(%rsp)
	movl	%esi, 1276(%rsp)
	movw	%dx, 1324(%rsp)
	addl	%edi, %eax
	testl	%edi, %edi
	je	.L2473
	cmpl	$4096, %eax
	jg	.L2491
.L2473:
	movl	%eax, %esi
	movl	20(%rsp), %edi
	addl	%eax, %eax
	sall	$4, %esi
	addl	16(%rsp), %edx
	movl	%eax, 84(%rsp)
	movw	%ax, 1226(%rsp)
	movl	%esi, 1280(%rsp)
	movw	%dx, 1326(%rsp)
	addl	%edi, %eax
	testl	%edi, %edi
	je	.L2474
	cmpl	$8192, %eax
	jg	.L2491
.L2474:
	movl	24(%rsp), %edi
	leal	0(,%rax,8), %esi
	addl	20(%rsp), %edx
	addl	%eax, %eax
	movl	%eax, 88(%rsp)
	movw	%ax, 1228(%rsp)
	movl	%esi, 1284(%rsp)
	movw	%dx, 1328(%rsp)
	addl	%edi, %eax
	testl	%edi, %edi
	je	.L2475
	cmpl	$16384, %eax
	jg	.L2491
.L2475:
	movl	28(%rsp), %edi
	leal	0(,%rax,4), %esi
	addl	24(%rsp), %edx
	addl	%eax, %eax
	movl	%eax, 92(%rsp)
	movw	%ax, 1230(%rsp)
	movl	%esi, 1288(%rsp)
	movw	%dx, 1330(%rsp)
	addl	%edi, %eax
	testl	%edi, %edi
	jne	.L2580
.L2476:
	addl	%eax, %eax
	movl	%eax, 1292(%rsp)
	movl	$65536, 1296(%rsp)
	xorl	%edx, %edx
	movl	$1, %r11d
	movl	$16, %r10d
	jmp	.L2481
	.p2align 4,,10
	.p2align 3
.L2480:
	incl	%edi
	movl	%edi, 32(%rsp,%r8,4)
.L2477:
	incq	%rdx
	cmpq	$19, %rdx
	je	.L2581
.L2481:
	movzbl	(%rcx,%rdx), %r14d
	testl	%r14d, %r14d
	je	.L2477
	movslq	%r14d, %r8
	movl	32(%rsp,%r8,4), %edi
	movzwl	1200(%rsp,%r8,2), %r9d
	movl	%edi, %eax
	subl	%r9d, %eax
	movzwl	1300(%rsp,%r8,2), %r9d
	addl	%r9d, %eax
	cltq
	movb	%r14b, 1332(%rsp,%rax)
	movw	%dx, 1620(%rsp,%rax,2)
	cmpl	$9, %r14d
	jg	.L2480
	movl	%edi, %r15d
	sarl	%r15d
	leal	(%rdi,%rdi), %eax
	andl	$21845, %r15d
	andl	$43690, %eax
	orl	%r15d, %eax
	movl	%eax, %r15d
	sarl	$2, %r15d
	sall	$2, %eax
	andl	$13107, %r15d
	andl	$52428, %eax
	orl	%r15d, %eax
	movl	%eax, %r15d
	sarl	$4, %r15d
	sall	$4, %eax
	andl	$61680, %eax
	andl	$3855, %r15d
	orl	%eax, %r15d
	movl	%r15d, %eax
	sall	$8, %r15d
	movzwl	%r15w, %r15d
	sarl	$8, %eax
	orl	%r15d, %eax
	movl	%r14d, %r9d
	movl	%r10d, %r15d
	sall	$9, %r9d
	subl	%r14d, %r15d
	shlx	%r14d, %r11d, %esi
	sarx	%r15d, %eax, %eax
	orl	%edx, %r9d
	movslq	%esi, %rsi
	cltq
	.p2align 4,,10
	.p2align 3
.L2479:
	movw	%r9w, 0(%r13,%rax,2)
	addq	%rsi, %rax
	cmpl	$511, %eax
	jle	.L2479
	jmp	.L2480
	.p2align 4,,10
	.p2align 3
.L2459:
	leaq	.LC126(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
.L2436:
	movq	2696(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L2582
	addq	$2712, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
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
	ret
.L2584:
	.cfi_restore_state
	je	.L2583
	.p2align 4,,10
	.p2align 3
.L2491:
	leaq	.LC127(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L2436
	.p2align 4,,10
	.p2align 3
.L2581:
	andl	$31, %r12d
	andl	$31, %ebp
	leal	257(%r12), %r14d
	leal	1(%rbp), %r12d
	leal	(%r14,%r12), %r11d
	xorl	%r15d, %r15d
	movabsq	$72340172838076673, %rbp
	jmp	.L2510
	.p2align 4,,10
	.p2align 3
.L2585:
	movslq	%r15d, %rdx
	movb	%al, 2240(%rsp,%rdx)
	incl	%r15d
.L2484:
	cmpl	%r15d, %r11d
	jle	.L2584
.L2510:
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	stbi__zhuffman_decode
	cmpl	$18, %eax
	ja	.L2491
	cmpl	$15, %eax
	jle	.L2585
	movl	16(%rbx), %edx
	movl	20(%rbx), %ecx
	cmpl	$16, %eax
	je	.L2586
	cmpl	$17, %eax
	je	.L2587
	cmpl	$6, %edx
	jle	.L2588
.L2499:
	movl	%ecx, %eax
	shrl	$7, %eax
	movl	%eax, 20(%rbx)
	subl	$7, %edx
	andl	$127, %ecx
	movl	%edx, 16(%rbx)
	addl	$11, %ecx
	xorl	%edx, %edx
.L2492:
	movl	%r11d, %eax
	subl	%r15d, %eax
	cmpl	%ecx, %eax
	jl	.L2491
	movslq	%r15d, %rax
	imulq	%rbp, %rdx
	leaq	2240(%rsp,%rax), %rax
	cmpl	$8, %ecx
	jnb	.L2504
	testb	$4, %cl
	jne	.L2589
	testl	%ecx, %ecx
	je	.L2505
	movb	%dl, (%rax)
	testb	$2, %cl
	jne	.L2590
.L2505:
	addl	%ecx, %r15d
	jmp	.L2484
	.p2align 4,,10
	.p2align 3
.L2504:
	leaq	8(%rax), %rdi
	movl	%ecx, %esi
	andq	$-8, %rdi
	movq	%rdx, (%rax)
	movq	%rdx, -8(%rax,%rsi)
	subq	%rdi, %rax
	addl	%ecx, %eax
	andl	$-8, %eax
	cmpl	$8, %eax
	jb	.L2505
	andl	$-8, %eax
	xorl	%esi, %esi
.L2508:
	movl	%esi, %r8d
	addl	$8, %esi
	movq	%rdx, (%rdi,%r8)
	cmpl	%eax, %esi
	jb	.L2508
	jmp	.L2505
	.p2align 4,,10
	.p2align 3
.L2586:
	cmpl	$1, %edx
	jle	.L2591
.L2486:
	movl	%ecx, %eax
	shrl	$2, %eax
	subl	$2, %edx
	andl	$3, %ecx
	movl	%eax, 20(%rbx)
	movl	%edx, 16(%rbx)
	addl	$3, %ecx
	testl	%r15d, %r15d
	je	.L2491
	leal	-1(%r15), %eax
	cltq
	movzbl	2240(%rsp,%rax), %edx
	jmp	.L2492
	.p2align 4,,10
	.p2align 3
.L2587:
	cmpl	$2, %edx
	jle	.L2592
.L2494:
	movl	%ecx, %eax
	subl	$3, %edx
	shrl	$3, %eax
	andl	$7, %ecx
	movl	%edx, 16(%rbx)
	movl	%eax, 20(%rbx)
	addl	$3, %ecx
	xorl	%edx, %edx
	jmp	.L2492
	.p2align 4,,10
	.p2align 3
.L2578:
	movq	8(%rbx), %rcx
	jmp	.L2451
	.p2align 4,,10
	.p2align 3
.L2448:
	movq	(%rbx), %rdx
	cmpq	%rcx, %rdx
	jnb	.L2449
	leaq	1(%rdx), %rsi
	movq	%rsi, (%rbx)
	movzbl	(%rdx), %edx
	shlx	%eax, %edx, %edx
	orl	%edx, %r8d
.L2449:
	addl	$8, %eax
	movl	%r8d, 20(%rbx)
	movl	%eax, 16(%rbx)
	cmpl	$24, %eax
	jg	.L2447
.L2451:
	shrx	%eax, %r8d, %edx
	testl	%edx, %edx
	je	.L2448
	movq	%rcx, (%rbx)
	jmp	.L2447
	.p2align 4,,10
	.p2align 3
.L2577:
	movq	8(%rbx), %rcx
	jmp	.L2446
	.p2align 4,,10
	.p2align 3
.L2443:
	movq	(%rbx), %rdx
	cmpq	%rcx, %rdx
	jnb	.L2444
	leaq	1(%rdx), %rsi
	movq	%rsi, (%rbx)
	movzbl	(%rdx), %edx
	shlx	%eax, %edx, %edx
	orl	%edx, %ebp
.L2444:
	addl	$8, %eax
	movl	%ebp, 20(%rbx)
	movl	%eax, 16(%rbx)
	cmpl	$24, %eax
	jg	.L2442
.L2446:
	shrx	%eax, %ebp, %edx
	testl	%edx, %edx
	je	.L2443
	movq	%rcx, (%rbx)
	jmp	.L2442
	.p2align 4,,10
	.p2align 3
.L2576:
	movq	8(%rdi), %rcx
	jmp	.L2441
	.p2align 4,,10
	.p2align 3
.L2438:
	movq	(%rbx), %rdx
	cmpq	%rcx, %rdx
	jnb	.L2439
	leaq	1(%rdx), %rsi
	movq	%rsi, (%rbx)
	movzbl	(%rdx), %edx
	shlx	%eax, %edx, %edx
	orl	%edx, %r12d
.L2439:
	addl	$8, %eax
	movl	%r12d, 20(%rbx)
	movl	%eax, 16(%rbx)
	cmpl	$24, %eax
	jg	.L2437
.L2441:
	shrx	%eax, %r12d, %edx
	testl	%edx, %edx
	je	.L2438
	movq	%rcx, (%rbx)
	jmp	.L2437
	.p2align 4,,10
	.p2align 3
.L2588:
	movq	8(%rbx), %rsi
	jmp	.L2503
	.p2align 4,,10
	.p2align 3
.L2500:
	movq	(%rbx), %rax
	cmpq	%rsi, %rax
	jnb	.L2501
	leaq	1(%rax), %rdi
	movq	%rdi, (%rbx)
	movzbl	(%rax), %eax
	shlx	%edx, %eax, %eax
	orl	%eax, %ecx
.L2501:
	addl	$8, %edx
	movl	%ecx, 20(%rbx)
	movl	%edx, 16(%rbx)
	cmpl	$24, %edx
	jg	.L2499
.L2503:
	shrx	%edx, %ecx, %eax
	testl	%eax, %eax
	je	.L2500
	movq	%rsi, (%rbx)
	jmp	.L2499
.L2591:
	movq	8(%rbx), %rsi
	jmp	.L2490
	.p2align 4,,10
	.p2align 3
.L2487:
	movq	(%rbx), %rax
	cmpq	%rsi, %rax
	jnb	.L2488
	leaq	1(%rax), %rdi
	movq	%rdi, (%rbx)
	movzbl	(%rax), %eax
	shlx	%edx, %eax, %eax
	orl	%eax, %ecx
.L2488:
	addl	$8, %edx
	movl	%ecx, 20(%rbx)
	movl	%edx, 16(%rbx)
	cmpl	$24, %edx
	jg	.L2486
.L2490:
	shrx	%edx, %ecx, %eax
	testl	%eax, %eax
	je	.L2487
	movq	%rsi, (%rbx)
	jmp	.L2486
.L2580:
	cmpl	$32768, %eax
	jle	.L2476
	jmp	.L2491
	.p2align 4,,10
	.p2align 3
.L2592:
	movq	8(%rbx), %rsi
	jmp	.L2498
	.p2align 4,,10
	.p2align 3
.L2495:
	movq	(%rbx), %rax
	cmpq	%rsi, %rax
	jnb	.L2496
	leaq	1(%rax), %rdi
	movq	%rdi, (%rbx)
	movzbl	(%rax), %eax
	shlx	%edx, %eax, %eax
	orl	%eax, %ecx
.L2496:
	addl	$8, %edx
	movl	%ecx, 20(%rbx)
	movl	%edx, 16(%rbx)
	cmpl	$24, %edx
	jg	.L2494
.L2498:
	shrx	%edx, %ecx, %eax
	testl	%eax, %eax
	je	.L2495
	movq	%rsi, (%rbx)
	jmp	.L2494
.L2589:
	movl	%ecx, %esi
	movl	%edx, (%rax)
	movl	%edx, -4(%rax,%rsi)
	jmp	.L2505
.L2583:
	leaq	2240(%rsp), %rbp
	leaq	52(%rbx), %rdi
	movl	%r14d, %edx
	movq	%rbp, %rsi
	call	stbi__zbuild_huffman
	testl	%eax, %eax
	je	.L2436
	movl	%r14d, %r14d
	leaq	0(%rbp,%r14), %rsi
	leaq	2072(%rbx), %rdi
	movl	%r12d, %edx
	call	stbi__zbuild_huffman
	testl	%eax, %eax
	setne	%al
	movzbl	%al, %eax
	jmp	.L2436
.L2590:
	movl	%ecx, %esi
	movw	%dx, -2(%rax,%rsi)
	jmp	.L2505
.L2582:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE691:
	.size	stbi__compute_huffman_codes, .-stbi__compute_huffman_codes
	.section	.rodata.str1.1
.LC221:
	.string	"bad zlib header"
.LC222:
	.string	"no preset dict"
.LC223:
	.string	"bad compression"
.LC224:
	.string	"zlib corrupt"
.LC225:
	.string	"read past buffer"
.LC226:
	.string	"output buffer limit"
.LC227:
	.string	"bad huffman code"
.LC228:
	.string	"bad dist"
	.text
	.p2align 4
	.type	stbi__parse_zlib, @function
stbi__parse_zlib:
.LFB694:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	movq	%rdi, %r12
	pushq	%rbx
	andq	$-32, %rsp
	subq	$192, %rsp
	.cfi_offset 3, -56
	movq	%fs:40, %rax
	movq	%rax, 184(%rsp)
	xorl	%eax, %eax
	testl	%esi, %esi
	jne	.L2976
.L2594:
	xorl	%eax, %eax
	movq	$0, 16(%r12)
	xorl	%edx, %edx
	testl	%eax, %eax
	jle	.L2977
	.p2align 4,,10
	.p2align 3
.L2601:
	movl	%edx, %ebx
	andl	$1, %ebx
	shrl	%edx
	decl	%eax
	movl	%ebx, 44(%rsp)
	movl	%edx, 20(%r12)
	movl	%eax, 16(%r12)
	cmpl	$1, %eax
	jle	.L2978
.L2606:
	movl	%edx, %ecx
	shrl	$2, %ecx
	subl	$2, %eax
	movl	%ecx, 20(%r12)
	movl	%eax, 16(%r12)
	andl	$3, %edx
	je	.L2979
	cmpl	$3, %edx
	je	.L2643
	cmpl	$1, %edx
	je	.L2980
	movq	%r12, %rdi
	call	stbi__compute_huffman_codes
	testl	%eax, %eax
	je	.L2643
	leaq	52(%r12), %rbx
.L2691:
	movq	24(%r12), %r13
.L2692:
	movq	%rbx, %rsi
	movq	%r12, %rdi
	call	stbi__zhuffman_decode
	movl	%eax, %r14d
	cmpl	$255, %eax
	jg	.L2693
	testl	%eax, %eax
	js	.L2710
	movq	40(%r12), %rax
	cmpq	%r13, %rax
	ja	.L2695
	movl	48(%r12), %r10d
	movq	%r13, 24(%r12)
	testl	%r10d, %r10d
	je	.L2719
	movq	32(%r12), %rdi
	subq	%rdi, %r13
	cmpl	$-1, %r13d
	je	.L2697
	subq	%rdi, %rax
	leal	1(%r13), %ecx
	cmpl	%ecx, %eax
	jnb	.L2698
	testl	%eax, %eax
	jns	.L2699
	jmp	.L2697
	.p2align 4,,10
	.p2align 3
.L2701:
	testl	%eax, %eax
	js	.L2697
.L2699:
	addl	%eax, %eax
	cmpl	%ecx, %eax
	jb	.L2701
.L2698:
	movl	%eax, %r15d
	movq	%r15, %rsi
	call	realloc@PLT
	testq	%rax, %rax
	je	.L2697
	movl	%r13d, %r13d
	addq	%rax, %r13
	vmovq	%r13, %xmm2
	vpinsrq	$1, %rax, %xmm2, %xmm0
	addq	%r15, %rax
	movq	%rax, 40(%r12)
	vmovdqu	%xmm0, 24(%r12)
.L2695:
	movb	%r14b, 0(%r13)
	incq	%r13
	jmp	.L2692
	.p2align 4,,10
	.p2align 3
.L2693:
	cmpl	$256, %eax
	je	.L2981
	subl	$257, %r14d
	movslq	%r14d, %r14
	leaq	stbi__zlength_base(%rip), %rax
	movl	(%rax,%r14,4), %r15d
	leaq	stbi__zlength_extra(%rip), %rax
	movl	(%rax,%r14,4), %ecx
	testl	%ecx, %ecx
	jne	.L2982
.L2704:
	leaq	2072(%r12), %rsi
	movq	%r12, %rdi
	call	stbi__zhuffman_decode
	testl	%eax, %eax
	js	.L2710
	cltq
	leaq	stbi__zdist_base(%rip), %rdi
	movl	(%rdi,%rax,4), %ecx
	leaq	stbi__zdist_extra(%rip), %rdi
	movl	(%rdi,%rax,4), %esi
	testl	%esi, %esi
	jne	.L2983
.L2711:
	movq	32(%r12), %rdi
	movq	%r13, %rdx
	subq	%rdi, %rdx
	movslq	%ecx, %r8
	cmpq	%r8, %rdx
	jl	.L2984
	movslq	%r15d, %rax
	movq	40(%r12), %rsi
	addq	%r13, %rax
	cmpq	%rax, %rsi
	jnb	.L2718
	movl	48(%r12), %r9d
	movq	%r13, 24(%r12)
	testl	%r9d, %r9d
	je	.L2719
	movl	%r15d, %eax
	addl	%edx, %eax
	jc	.L2697
	subq	%rdi, %rsi
	leal	(%r15,%rdx), %r9d
	movl	%esi, %eax
	cmpl	%r9d, %esi
	jnb	.L2722
	testl	%esi, %esi
	jns	.L2723
	jmp	.L2697
	.p2align 4,,10
	.p2align 3
.L2724:
	testl	%eax, %eax
	js	.L2697
.L2723:
	addl	%eax, %eax
	cmpl	%r9d, %eax
	jb	.L2724
.L2722:
	movl	%eax, %r14d
	movq	%r14, %rsi
	movq	%r8, 24(%rsp)
	movq	%rdx, 32(%rsp)
	movl	%ecx, 40(%rsp)
	call	realloc@PLT
	testq	%rax, %rax
	je	.L2697
	movq	32(%rsp), %rdx
	movq	24(%rsp), %r8
	movl	%edx, %edx
	leaq	(%rax,%rdx), %r13
	vmovq	%r13, %xmm3
	vpinsrq	$1, %rax, %xmm3, %xmm0
	addq	%r14, %rax
	movq	%rax, 40(%r12)
	movl	40(%rsp), %ecx
	vmovdqu	%xmm0, 24(%r12)
.L2718:
	movq	%r13, %rdx
	subq	%r8, %rdx
	cmpl	$1, %ecx
	je	.L2985
	testl	%r15d, %r15d
	je	.L2692
	leaq	-1(%r8), %rax
	leal	-1(%r15), %esi
	cmpq	$30, %rax
	jbe	.L2726
	cmpl	$14, %esi
	jbe	.L2726
	movl	%r15d, %edi
	cmpl	$30, %esi
	jbe	.L2742
	movl	%r15d, %ecx
	shrl	$5, %ecx
	salq	$5, %rcx
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L2728:
	vmovdqu	(%rdx,%rax), %ymm1
	vmovdqu	%ymm1, 0(%r13,%rax)
	addq	$32, %rax
	cmpq	%rax, %rcx
	jne	.L2728
	movl	%r15d, %eax
	andl	$-32, %eax
	movl	%eax, %r9d
	leaq	0(%r13,%r9), %rcx
	addq	%r9, %rdx
	subl	%eax, %r15d
	cmpl	%edi, %eax
	je	.L2734
.L2727:
	subl	%eax, %edi
	leal	-1(%rdi), %r9d
	cmpl	$14, %r9d
	jbe	.L2731
	movq	%rax, %r9
	subq	%r8, %r9
	vmovdqu	0(%r13,%r9), %xmm4
	vmovdqu	%xmm4, 0(%r13,%rax)
	movl	%edi, %eax
	andl	$-16, %eax
	movl	%eax, %r8d
	addq	%r8, %rcx
	addq	%r8, %rdx
	subl	%eax, %r15d
	cmpl	%edi, %eax
	je	.L2734
.L2731:
	movzbl	(%rdx), %eax
	movb	%al, (%rcx)
	cmpl	$1, %r15d
	je	.L2734
	movzbl	1(%rdx), %eax
	movb	%al, 1(%rcx)
	cmpl	$2, %r15d
	je	.L2734
	movzbl	2(%rdx), %eax
	movb	%al, 2(%rcx)
	cmpl	$3, %r15d
	je	.L2734
	movzbl	3(%rdx), %eax
	movb	%al, 3(%rcx)
	cmpl	$4, %r15d
	je	.L2734
	movzbl	4(%rdx), %eax
	movb	%al, 4(%rcx)
	cmpl	$5, %r15d
	je	.L2734
	movzbl	5(%rdx), %eax
	movb	%al, 5(%rcx)
	cmpl	$6, %r15d
	je	.L2734
	movzbl	6(%rdx), %eax
	movb	%al, 6(%rcx)
	cmpl	$7, %r15d
	je	.L2734
	movzbl	7(%rdx), %eax
	movb	%al, 7(%rcx)
	cmpl	$8, %r15d
	je	.L2734
	movzbl	8(%rdx), %eax
	movb	%al, 8(%rcx)
	cmpl	$9, %r15d
	je	.L2734
	movzbl	9(%rdx), %eax
	movb	%al, 9(%rcx)
	cmpl	$10, %r15d
	je	.L2734
	movzbl	10(%rdx), %eax
	movb	%al, 10(%rcx)
	cmpl	$11, %r15d
	je	.L2734
	movzbl	11(%rdx), %eax
	movb	%al, 11(%rcx)
	cmpl	$12, %r15d
	je	.L2734
	movzbl	12(%rdx), %eax
	movb	%al, 12(%rcx)
	cmpl	$13, %r15d
	je	.L2734
	movzbl	13(%rdx), %eax
	movb	%al, 13(%rcx)
	cmpl	$14, %r15d
	je	.L2734
	movzbl	14(%rdx), %eax
	movb	%al, 14(%rcx)
	.p2align 4,,10
	.p2align 3
.L2734:
	leaq	1(%r13,%rsi), %r13
	jmp	.L2692
	.p2align 4,,10
	.p2align 3
.L2697:
	leaq	.LC23(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
.L2593:
	movq	184(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L2986
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
	.p2align 4,,10
	.p2align 3
.L2719:
	.cfi_restore_state
	leaq	.LC226(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L2593
	.p2align 4,,10
	.p2align 3
.L2982:
	movl	16(%r12), %eax
	movl	20(%r12), %edx
	cmpl	%eax, %ecx
	jg	.L2987
.L2705:
	subl	%ecx, %eax
	shrx	%ecx, %edx, %esi
	movl	%eax, 16(%r12)
	bzhi	%ecx, %edx, %edx
	movl	%esi, 20(%r12)
	addl	%edx, %r15d
	jmp	.L2704
	.p2align 4,,10
	.p2align 3
.L2983:
	movl	16(%r12), %eax
	movl	20(%r12), %edx
	cmpl	%eax, %esi
	jg	.L2988
.L2712:
	subl	%esi, %eax
	shrx	%esi, %edx, %edi
	movl	%eax, 16(%r12)
	bzhi	%esi, %edx, %edx
	movl	%edi, 20(%r12)
	addl	%edx, %ecx
	jmp	.L2711
	.p2align 4,,10
	.p2align 3
.L2985:
	testl	%r15d, %r15d
	je	.L2692
	leal	-1(%r15), %r14d
	movsbl	(%rdx), %esi
	incq	%r14
	movq	%r13, %rdi
	movq	%r14, %rdx
	call	memset@PLT
	addq	%r14, %r13
	jmp	.L2692
	.p2align 4,,10
	.p2align 3
.L2979:
	movl	%eax, %edi
	andl	$7, %edi
	jne	.L2612
	testl	%eax, %eax
	jle	.L2989
.L2613:
	movl	%ecx, %edi
	leal	-8(%rax), %esi
	movb	%cl, 180(%rsp)
	shrl	$8, %edi
	testl	%esi, %esi
	jle	.L2738
	movb	%dil, 181(%rsp)
	movl	%ecx, %r8d
	leal	-16(%rax), %edi
	shrl	$16, %r8d
	testl	%edi, %edi
	jle	.L2739
	movb	%r8b, 182(%rsp)
	shrl	$24, %ecx
	cmpl	$24, %eax
	jle	.L2740
	movb	%cl, 183(%rsp)
.L2621:
	leal	-1(%rax), %ecx
	shrl	$3, %ecx
	leal	1(%rcx), %r8d
	testl	%eax, %eax
	movl	$1, %edi
	cmovle	%edi, %r8d
	negl	%ecx
	xorl	%edi, %edi
	sall	$3, %ecx
	testl	%eax, %eax
	movl	%edi, %eax
	cmovg	%ecx, %eax
	movl	%edx, 20(%r12)
	addl	%esi, %eax
	movl	%eax, 16(%r12)
	movl	%r8d, %r9d
	jne	.L2623
	cmpl	$4, %r8d
	je	.L2632
	movq	8(%r12), %rsi
	movq	(%r12), %rdx
	leal	1(%r8), %ecx
	cmpq	%rdx, %rsi
	jbe	.L2626
	leaq	1(%rdx), %rdi
	movq	%rdi, (%r12)
	movslq	%r8d, %rax
	movzbl	(%rdx), %edx
	movb	%dl, 180(%rsp,%rax)
	cmpl	$4, %ecx
	jne	.L2990
.L2632:
	movzbl	181(%rsp), %edx
	movzbl	180(%rsp), %eax
	sall	$8, %edx
	addl	%eax, %edx
	movzbl	183(%rsp), %eax
	movzbl	182(%rsp), %ecx
	sall	$8, %eax
	addl	%ecx, %eax
	movl	%edx, %ecx
	xorl	$65535, %ecx
	cmpl	%ecx, %eax
	jne	.L2623
	movq	(%r12), %rsi
	movslq	%edx, %r14
	leaq	(%rsi,%r14), %rax
	cmpq	%rax, 8(%r12)
	jb	.L2991
	movq	24(%r12), %rdi
	movq	40(%r12), %rcx
	leaq	(%rdi,%r14), %rax
	cmpq	%rax, %rcx
	jnb	.L2634
	movl	48(%r12), %eax
	testl	%eax, %eax
	je	.L2992
	movq	32(%r12), %r8
	movl	%edx, %eax
	subq	%r8, %rdi
	addl	%edi, %eax
	movq	%rdi, %r15
	jc	.L2697
	subq	%r8, %rcx
	addl	%edi, %edx
	movl	%ecx, %eax
	cmpl	%edx, %ecx
	jnb	.L2639
	testl	%ecx, %ecx
	jns	.L2640
	jmp	.L2697
	.p2align 4,,10
	.p2align 3
.L2641:
	testl	%eax, %eax
	js	.L2697
.L2640:
	addl	%eax, %eax
	cmpl	%edx, %eax
	jb	.L2641
.L2639:
	movl	%eax, %ebx
	movq	%rbx, %rsi
	movq	%r8, %rdi
	call	realloc@PLT
	testq	%rax, %rax
	je	.L2697
	movl	%r15d, %edi
	addq	%rax, %rdi
	vmovq	%rdi, %xmm5
	vpinsrq	$1, %rax, %xmm5, %xmm0
	addq	%rbx, %rax
	movq	%rax, 40(%r12)
	movq	(%r12), %rsi
	vmovdqu	%xmm0, 24(%r12)
.L2634:
	movq	%r14, %rdx
	call	memcpy@PLT
	movl	44(%rsp), %eax
	addq	%r14, (%r12)
	addq	%r14, 24(%r12)
	testl	%eax, %eax
	jne	.L2743
.L2996:
	movl	16(%r12), %eax
	movl	20(%r12), %edx
	testl	%eax, %eax
	jg	.L2601
.L2977:
	movq	8(%r12), %rsi
	jmp	.L2605
	.p2align 4,,10
	.p2align 3
.L2602:
	movq	(%r12), %rcx
	cmpq	%rsi, %rcx
	jnb	.L2603
	leaq	1(%rcx), %rdi
	movq	%rdi, (%r12)
	movzbl	(%rcx), %ecx
	shlx	%eax, %ecx, %ecx
	orl	%ecx, %edx
.L2603:
	addl	$8, %eax
	movl	%edx, 20(%r12)
	movl	%eax, 16(%r12)
	cmpl	$24, %eax
	jg	.L2601
.L2605:
	shrx	%eax, %edx, %ecx
	testl	%ecx, %ecx
	je	.L2602
	movq	%rsi, (%r12)
	jmp	.L2601
	.p2align 4,,10
	.p2align 3
.L2978:
	movq	8(%r12), %rsi
	jmp	.L2610
	.p2align 4,,10
	.p2align 3
.L2607:
	movq	(%r12), %rcx
	cmpq	%rsi, %rcx
	jnb	.L2608
	leaq	1(%rcx), %rdi
	movq	%rdi, (%r12)
	movzbl	(%rcx), %ecx
	shlx	%eax, %ecx, %ecx
	orl	%ecx, %edx
.L2608:
	addl	$8, %eax
	movl	%edx, 20(%r12)
	movl	%eax, 16(%r12)
	cmpl	$24, %eax
	jg	.L2606
.L2610:
	shrx	%eax, %edx, %ecx
	testl	%ecx, %ecx
	je	.L2607
	movq	%rsi, (%r12)
	jmp	.L2606
	.p2align 4,,10
	.p2align 3
.L2980:
	leaq	52(%r12), %rbx
	vpxor	%xmm0, %xmm0, %xmm0
	movl	$1024, %edx
	xorl	%esi, %esi
	movq	%rbx, %rdi
	movl	$0, 176(%rsp)
	vmovdqa	%xmm0, 112(%rsp)
	vmovdqa	%xmm0, 128(%rsp)
	vmovdqa	%xmm0, 144(%rsp)
	vmovdqa	%xmm0, 160(%rsp)
	call	memset@PLT
	movl	$1, 144(%rsp)
	leaq	1+stbi__zdefault_length(%rip), %rax
	leaq	287(%rax), %rcx
	.p2align 4,,10
	.p2align 3
.L2645:
	movzbl	(%rax), %edx
	incq	%rax
	incl	112(%rsp,%rdx,4)
	cmpq	%rax, %rcx
	jne	.L2645
	movl	116(%rsp), %ecx
	movl	$0, 112(%rsp)
	cmpl	$2, %ecx
	jg	.L2669
	movl	120(%rsp), %edx
	cmpl	$4, %edx
	jg	.L2669
	movl	124(%rsp), %esi
	cmpl	$8, %esi
	jg	.L2669
	movl	128(%rsp), %edi
	cmpl	$16, %edi
	jg	.L2669
	movl	132(%rsp), %r10d
	cmpl	$32, %r10d
	jg	.L2669
	movl	136(%rsp), %r8d
	cmpl	$64, %r8d
	jg	.L2669
	movl	140(%rsp), %r9d
	cmpl	$128, %r9d
	jg	.L2669
	movl	144(%rsp), %r14d
	cmpl	$256, %r14d
	jg	.L2669
	movl	148(%rsp), %r11d
	cmpl	$512, %r11d
	jg	.L2669
	movl	152(%rsp), %eax
	movl	%eax, 40(%rsp)
	cmpl	$1024, %eax
	jg	.L2669
	movl	156(%rsp), %r15d
	cmpl	$2048, %r15d
	jg	.L2669
	movl	160(%rsp), %eax
	movl	%eax, 32(%rsp)
	cmpl	$4096, %eax
	jg	.L2669
	movl	164(%rsp), %eax
	movl	%eax, 24(%rsp)
	cmpl	$8192, %eax
	jg	.L2669
	movl	168(%rsp), %eax
	movl	%eax, 20(%rsp)
	cmpl	$16384, %eax
	jg	.L2669
	movl	172(%rsp), %eax
	movl	%eax, 16(%rsp)
	cmpl	$32768, %eax
	jg	.L2669
	xorl	%eax, %eax
	movw	%ax, 1078(%r12)
	xorl	%eax, %eax
	movw	%ax, 1178(%r12)
	movl	%ecx, %eax
	sall	$15, %eax
	movl	%eax, 1112(%r12)
	leal	(%rcx,%rcx), %eax
	movl	%eax, 56(%rsp)
	movw	%ax, 1080(%r12)
	movl	$0, 52(%rsp)
	movw	%cx, 1180(%r12)
	addl	%edx, %eax
	testl	%edx, %edx
	je	.L2745
	cmpl	$4, %eax
	jg	.L2671
.L2745:
	movl	%eax, %r13d
	sall	$14, %r13d
	addl	%eax, %eax
	addl	%ecx, %edx
	movl	%eax, 60(%rsp)
	movw	%ax, 1082(%r12)
	movl	%r13d, 1116(%r12)
	movw	%dx, 1182(%r12)
	addl	%esi, %eax
	testl	%esi, %esi
	je	.L2746
	cmpl	$8, %eax
	jg	.L2671
.L2746:
	movl	%eax, %ecx
	sall	$13, %ecx
	addl	%eax, %eax
	addl	%esi, %edx
	movl	%eax, 64(%rsp)
	movw	%ax, 1084(%r12)
	movl	%ecx, 1120(%r12)
	movw	%dx, 1184(%r12)
	addl	%edi, %eax
	testl	%edi, %edi
	je	.L2747
	cmpl	$16, %eax
	jg	.L2671
.L2747:
	movl	%eax, %ecx
	addl	%eax, %eax
	movl	%eax, 68(%rsp)
	movw	%ax, 1086(%r12)
	sall	$12, %ecx
	addl	%edi, %edx
	addl	%r10d, %eax
	movl	%ecx, 1124(%r12)
	movw	%dx, 1186(%r12)
	cmpl	$32, %eax
	jle	.L2748
	testl	%r10d, %r10d
	jne	.L2671
.L2748:
	movl	%eax, %ecx
	sall	$11, %ecx
	addl	%eax, %eax
	addl	%r10d, %edx
	movl	%eax, 72(%rsp)
	movw	%ax, 1088(%r12)
	movl	%ecx, 1128(%r12)
	movw	%dx, 1188(%r12)
	addl	%r8d, %eax
	testl	%r8d, %r8d
	je	.L2749
	cmpl	$64, %eax
	jg	.L2671
.L2749:
	movl	%eax, %ecx
	sall	$10, %ecx
	addl	%eax, %eax
	addl	%r8d, %edx
	movl	%eax, 76(%rsp)
	movw	%ax, 1090(%r12)
	movl	%ecx, 1132(%r12)
	movw	%dx, 1190(%r12)
	addl	%r9d, %eax
	testl	%r9d, %r9d
	je	.L2750
	cmpl	$128, %eax
	jg	.L2671
.L2750:
	movl	%eax, %ecx
	addl	%eax, %eax
	movl	%eax, 80(%rsp)
	movw	%ax, 1092(%r12)
	sall	$9, %ecx
	addl	%r9d, %edx
	addl	%r14d, %eax
	movl	%ecx, 1136(%r12)
	movw	%dx, 1192(%r12)
	cmpl	$256, %eax
	jle	.L2751
	testl	%r14d, %r14d
	jne	.L2671
.L2751:
	movl	%eax, %ecx
	sall	$8, %ecx
	addl	%eax, %eax
	addl	%r14d, %edx
	movl	%eax, 84(%rsp)
	movw	%ax, 1094(%r12)
	movl	%ecx, 1140(%r12)
	movw	%dx, 1194(%r12)
	addl	%r11d, %eax
	testl	%r11d, %r11d
	je	.L2752
	cmpl	$512, %eax
	jg	.L2671
.L2752:
	movl	40(%rsp), %edi
	movl	%eax, %ecx
	addl	%eax, %eax
	movl	%eax, 88(%rsp)
	movw	%ax, 1096(%r12)
	sall	$7, %ecx
	addl	%r11d, %edx
	addl	%edi, %eax
	movl	%ecx, 1144(%r12)
	movw	%dx, 1196(%r12)
	cmpl	$1024, %eax
	jle	.L2753
	testl	%edi, %edi
	jne	.L2671
.L2753:
	movl	%eax, %ecx
	sall	$6, %ecx
	addl	%eax, %eax
	addl	40(%rsp), %edx
	movl	%eax, 92(%rsp)
	movw	%ax, 1098(%r12)
	movl	%ecx, 1148(%r12)
	movw	%dx, 1198(%r12)
	addl	%r15d, %eax
	testl	%r15d, %r15d
	je	.L2754
	cmpl	$2048, %eax
	jg	.L2671
.L2754:
	movl	32(%rsp), %edi
	movl	%eax, %ecx
	addl	%eax, %eax
	movl	%eax, 96(%rsp)
	movw	%ax, 1100(%r12)
	sall	$5, %ecx
	addl	%r15d, %edx
	addl	%edi, %eax
	movl	%ecx, 1152(%r12)
	movw	%dx, 1200(%r12)
	cmpl	$4096, %eax
	jle	.L2755
	testl	%edi, %edi
	jne	.L2671
.L2755:
	movl	%eax, %ecx
	movl	24(%rsp), %edi
	addl	%eax, %eax
	sall	$4, %ecx
	addl	32(%rsp), %edx
	movl	%eax, 100(%rsp)
	movw	%ax, 1102(%r12)
	movl	%ecx, 1156(%r12)
	movw	%dx, 1202(%r12)
	addl	%edi, %eax
	testl	%edi, %edi
	je	.L2756
	cmpl	$8192, %eax
	jg	.L2671
.L2756:
	movl	20(%rsp), %edi
	leal	0(,%rax,8), %ecx
	addl	%eax, %eax
	movl	%eax, 104(%rsp)
	movw	%ax, 1104(%r12)
	addl	24(%rsp), %edx
	addl	%edi, %eax
	movl	%ecx, 1160(%r12)
	movw	%dx, 1204(%r12)
	cmpl	$16384, %eax
	jle	.L2757
	testl	%edi, %edi
	jne	.L2671
.L2757:
	movl	16(%rsp), %esi
	leal	0(,%rax,4), %ecx
	addl	%eax, %eax
	movl	%eax, 108(%rsp)
	movw	%ax, 1106(%r12)
	addl	20(%rsp), %edx
	addl	%esi, %eax
	movl	%ecx, 1164(%r12)
	movw	%dx, 1206(%r12)
	cmpl	$32768, %eax
	jle	.L2758
	testl	%esi, %esi
	jne	.L2671
.L2758:
	addl	%eax, %eax
	movl	%eax, 1168(%r12)
	movl	$65536, 1172(%r12)
	xorl	%edx, %edx
	leaq	stbi__zdefault_length(%rip), %r9
	movl	$1, %r11d
	movl	$16, %r10d
	jmp	.L2663
	.p2align 4,,10
	.p2align 3
.L2667:
	incl	%esi
	movl	%esi, 48(%rsp,%rdi,4)
.L2664:
	incq	%rdx
	cmpq	$288, %rdx
	je	.L2993
.L2663:
	movzbl	(%r9,%rdx), %r13d
	testl	%r13d, %r13d
	je	.L2664
	movslq	%r13d, %rdi
	movl	48(%rsp,%rdi,4), %esi
	movzwl	1076(%r12,%rdi,2), %r8d
	movl	%esi, %eax
	subl	%r8d, %eax
	movzwl	1176(%r12,%rdi,2), %r8d
	addl	%r8d, %eax
	cltq
	movb	%r13b, 1208(%r12,%rax)
	movw	%dx, 1496(%r12,%rax,2)
	cmpl	$9, %r13d
	jg	.L2667
	movl	%esi, %r14d
	sarl	%r14d
	leal	(%rsi,%rsi), %eax
	andl	$43690, %eax
	andl	$21845, %r14d
	orl	%eax, %r14d
	movl	%r14d, %eax
	sarl	$2, %eax
	sall	$2, %r14d
	andl	$52428, %r14d
	andl	$13107, %eax
	orl	%r14d, %eax
	movl	%eax, %r14d
	sarl	$4, %r14d
	sall	$4, %eax
	andl	$61680, %eax
	andl	$3855, %r14d
	orl	%eax, %r14d
	movl	%r14d, %eax
	sall	$8, %r14d
	movzwl	%r14w, %r14d
	sarl	$8, %eax
	orl	%r14d, %eax
	movl	%r13d, %r8d
	movl	%r10d, %r14d
	sall	$9, %r8d
	subl	%r13d, %r14d
	shlx	%r13d, %r11d, %ecx
	sarx	%r14d, %eax, %eax
	orl	%edx, %r8d
	movslq	%ecx, %rcx
	cltq
	.p2align 4,,10
	.p2align 3
.L2666:
	movw	%r8w, 52(%r12,%rax,2)
	addq	%rcx, %rax
	cmpl	$511, %eax
	jle	.L2666
	jmp	.L2667
	.p2align 4,,10
	.p2align 3
.L2623:
	leaq	.LC224(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L2593
	.p2align 4,,10
	.p2align 3
.L2993:
	vpxor	%xmm0, %xmm0, %xmm0
	leaq	2072(%r12), %rdi
	movl	$1024, %edx
	xorl	%esi, %esi
	movl	$0, 176(%rsp)
	vmovdqa	%xmm0, 112(%rsp)
	vmovdqa	%xmm0, 128(%rsp)
	vmovdqa	%xmm0, 144(%rsp)
	vmovdqa	%xmm0, 160(%rsp)
	call	memset@PLT
	movl	$1, 132(%rsp)
	leaq	1+stbi__zdefault_distance(%rip), %rax
	leaq	31(%rax), %rcx
	.p2align 4,,10
	.p2align 3
.L2668:
	movzbl	(%rax), %edx
	incq	%rax
	incl	112(%rsp,%rdx,4)
	cmpq	%rax, %rcx
	jne	.L2668
	movl	116(%rsp), %ecx
	movl	$0, 112(%rsp)
	cmpl	$2, %ecx
	jg	.L2669
	movl	120(%rsp), %edx
	cmpl	$4, %edx
	jg	.L2669
	movl	124(%rsp), %r8d
	cmpl	$8, %r8d
	jg	.L2669
	movl	128(%rsp), %esi
	cmpl	$16, %esi
	jg	.L2669
	movl	132(%rsp), %edi
	cmpl	$32, %edi
	jg	.L2669
	movl	136(%rsp), %r9d
	cmpl	$64, %r9d
	jg	.L2669
	movl	140(%rsp), %r11d
	cmpl	$128, %r11d
	jg	.L2669
	movl	144(%rsp), %r14d
	cmpl	$256, %r14d
	jg	.L2669
	movl	148(%rsp), %r10d
	cmpl	$512, %r10d
	jg	.L2669
	movl	152(%rsp), %eax
	movl	%eax, 40(%rsp)
	cmpl	$1024, %eax
	jg	.L2669
	movl	156(%rsp), %eax
	movl	%eax, 32(%rsp)
	cmpl	$2048, %eax
	jg	.L2669
	movl	160(%rsp), %r15d
	cmpl	$4096, %r15d
	jg	.L2669
	movl	164(%rsp), %eax
	movl	%eax, 24(%rsp)
	cmpl	$8192, %eax
	jg	.L2669
	movl	168(%rsp), %eax
	movl	%eax, 20(%rsp)
	cmpl	$16384, %eax
	jg	.L2669
	movl	172(%rsp), %eax
	movl	%eax, 16(%rsp)
	cmpl	$32768, %eax
	jg	.L2669
	xorl	%eax, %eax
	movw	%ax, 3198(%r12)
	movl	%ecx, %eax
	sall	$15, %eax
	movl	%eax, 3132(%r12)
	leal	(%rcx,%rcx), %eax
	movl	%eax, 56(%rsp)
	movw	%ax, 3100(%r12)
	xorl	%r13d, %r13d
	addl	%edx, %eax
	movl	$0, 52(%rsp)
	movw	%r13w, 3098(%r12)
	movw	%cx, 3200(%r12)
	cmpl	$4, %eax
	jle	.L2759
	testl	%edx, %edx
	jne	.L2671
.L2759:
	movl	%eax, %r13d
	addl	%eax, %eax
	movl	%eax, 60(%rsp)
	movw	%ax, 3102(%r12)
	sall	$14, %r13d
	addl	%ecx, %edx
	addl	%r8d, %eax
	movl	%r13d, 3136(%r12)
	movw	%dx, 3202(%r12)
	cmpl	$8, %eax
	jle	.L2760
	testl	%r8d, %r8d
	jne	.L2671
.L2760:
	movl	%eax, %ecx
	sall	$13, %ecx
	addl	%eax, %eax
	addl	%r8d, %edx
	movl	%eax, 64(%rsp)
	movw	%ax, 3104(%r12)
	movl	%ecx, 3140(%r12)
	movw	%dx, 3204(%r12)
	addl	%esi, %eax
	testl	%esi, %esi
	je	.L2761
	cmpl	$16, %eax
	jg	.L2671
.L2761:
	movl	%eax, %ecx
	sall	$12, %ecx
	addl	%eax, %eax
	addl	%esi, %edx
	movl	%eax, 68(%rsp)
	movw	%ax, 3106(%r12)
	movl	%ecx, 3144(%r12)
	movw	%dx, 3206(%r12)
	addl	%edi, %eax
	testl	%edi, %edi
	je	.L2762
	cmpl	$32, %eax
	jg	.L2671
.L2762:
	movl	%eax, %ecx
	sall	$11, %ecx
	addl	%eax, %eax
	addl	%edi, %edx
	movl	%eax, 72(%rsp)
	movw	%ax, 3108(%r12)
	movl	%ecx, 3148(%r12)
	movw	%dx, 3208(%r12)
	addl	%r9d, %eax
	testl	%r9d, %r9d
	je	.L2763
	cmpl	$64, %eax
	jg	.L2671
.L2763:
	movl	%eax, %ecx
	addl	%eax, %eax
	movl	%eax, 76(%rsp)
	movw	%ax, 3110(%r12)
	sall	$10, %ecx
	addl	%r9d, %edx
	addl	%r11d, %eax
	movl	%ecx, 3152(%r12)
	movw	%dx, 3210(%r12)
	cmpl	$128, %eax
	jle	.L2764
	testl	%r11d, %r11d
	jne	.L2671
.L2764:
	movl	%eax, %ecx
	addl	%eax, %eax
	movl	%eax, 80(%rsp)
	movw	%ax, 3112(%r12)
	sall	$9, %ecx
	addl	%r11d, %edx
	addl	%r14d, %eax
	movl	%ecx, 3156(%r12)
	movw	%dx, 3212(%r12)
	cmpl	$256, %eax
	jle	.L2765
	testl	%r14d, %r14d
	jne	.L2671
.L2765:
	movl	%eax, %ecx
	sall	$8, %ecx
	addl	%eax, %eax
	addl	%r14d, %edx
	movl	%eax, 84(%rsp)
	movw	%ax, 3114(%r12)
	movl	%ecx, 3160(%r12)
	movw	%dx, 3214(%r12)
	addl	%r10d, %eax
	testl	%r10d, %r10d
	je	.L2766
	cmpl	$512, %eax
	jg	.L2671
.L2766:
	movl	40(%rsp), %esi
	movl	%eax, %ecx
	addl	%eax, %eax
	movl	%eax, 88(%rsp)
	movw	%ax, 3116(%r12)
	sall	$7, %ecx
	addl	%r10d, %edx
	addl	%esi, %eax
	movl	%ecx, 3164(%r12)
	movw	%dx, 3216(%r12)
	cmpl	$1024, %eax
	jle	.L2767
	testl	%esi, %esi
	jne	.L2671
.L2767:
	movl	32(%rsp), %esi
	movl	%eax, %ecx
	addl	%eax, %eax
	movl	%eax, 92(%rsp)
	movw	%ax, 3118(%r12)
	sall	$6, %ecx
	addl	40(%rsp), %edx
	addl	%esi, %eax
	movl	%ecx, 3168(%r12)
	movw	%dx, 3218(%r12)
	cmpl	$2048, %eax
	jle	.L2768
	testl	%esi, %esi
	jne	.L2671
.L2768:
	movl	%eax, %ecx
	sall	$5, %ecx
	addl	%eax, %eax
	addl	32(%rsp), %edx
	movl	%eax, 96(%rsp)
	movw	%ax, 3120(%r12)
	movl	%ecx, 3172(%r12)
	movw	%dx, 3220(%r12)
	addl	%r15d, %eax
	testl	%r15d, %r15d
	je	.L2769
	cmpl	$4096, %eax
	jg	.L2671
.L2769:
	movl	%eax, %ecx
	movl	24(%rsp), %esi
	addl	%eax, %eax
	sall	$4, %ecx
	addl	%r15d, %edx
	movl	%eax, 100(%rsp)
	movw	%ax, 3122(%r12)
	movl	%ecx, 3176(%r12)
	movw	%dx, 3222(%r12)
	addl	%esi, %eax
	testl	%esi, %esi
	je	.L2770
	cmpl	$8192, %eax
	jg	.L2671
.L2770:
	movl	20(%rsp), %edi
	leal	0(,%rax,8), %ecx
	addl	24(%rsp), %edx
	addl	%eax, %eax
	movl	%eax, 104(%rsp)
	movw	%ax, 3124(%r12)
	movl	%ecx, 3180(%r12)
	movw	%dx, 3224(%r12)
	addl	%edi, %eax
	testl	%edi, %edi
	je	.L2771
	cmpl	$16384, %eax
	jg	.L2671
.L2771:
	movl	16(%rsp), %esi
	leal	0(,%rax,4), %ecx
	addl	20(%rsp), %edx
	addl	%eax, %eax
	movl	%eax, 108(%rsp)
	movw	%ax, 3126(%r12)
	movl	%ecx, 3184(%r12)
	movw	%dx, 3226(%r12)
	addl	%esi, %eax
	testl	%esi, %esi
	je	.L2772
	cmpl	$32768, %eax
	jg	.L2671
.L2772:
	addl	%eax, %eax
	movl	%eax, 3188(%r12)
	movl	$65536, 3192(%r12)
	xorl	%edx, %edx
	leaq	stbi__zdefault_distance(%rip), %r9
	movl	$1, %r11d
	movl	$16, %r10d
	jmp	.L2686
	.p2align 4,,10
	.p2align 3
.L2690:
	incl	%esi
	movl	%esi, 48(%rsp,%rdi,4)
.L2687:
	incq	%rdx
	cmpq	$32, %rdx
	je	.L2691
.L2686:
	movzbl	(%r9,%rdx), %r13d
	testl	%r13d, %r13d
	je	.L2687
	movslq	%r13d, %rdi
	movl	48(%rsp,%rdi,4), %esi
	movzwl	3096(%r12,%rdi,2), %r8d
	movl	%esi, %eax
	subl	%r8d, %eax
	movzwl	3196(%r12,%rdi,2), %r8d
	addl	%r8d, %eax
	cltq
	movb	%r13b, 3228(%r12,%rax)
	movw	%dx, 3516(%r12,%rax,2)
	cmpl	$9, %r13d
	jg	.L2690
	movl	%esi, %r14d
	sarl	%r14d
	leal	(%rsi,%rsi), %eax
	andl	$43690, %eax
	andl	$21845, %r14d
	orl	%eax, %r14d
	movl	%r14d, %eax
	sarl	$2, %eax
	sall	$2, %r14d
	andl	$52428, %r14d
	andl	$13107, %eax
	orl	%r14d, %eax
	movl	%eax, %r14d
	sarl	$4, %r14d
	sall	$4, %eax
	andl	$61680, %eax
	andl	$3855, %r14d
	orl	%eax, %r14d
	movl	%r14d, %eax
	sall	$8, %r14d
	movzwl	%r14w, %r14d
	sarl	$8, %eax
	orl	%r14d, %eax
	movl	%r13d, %r8d
	movl	%r10d, %r14d
	sall	$9, %r8d
	subl	%r13d, %r14d
	shlx	%r13d, %r11d, %ecx
	sarx	%r14d, %eax, %eax
	orl	%edx, %r8d
	movslq	%ecx, %rcx
	cltq
	.p2align 4,,10
	.p2align 3
.L2689:
	movw	%r8w, 2072(%r12,%rax,2)
	addq	%rcx, %rax
	cmpl	$511, %eax
	jle	.L2689
	jmp	.L2690
	.p2align 4,,10
	.p2align 3
.L2669:
	leaq	.LC126(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L2593
	.p2align 4,,10
	.p2align 3
.L2987:
	movq	8(%r12), %rdi
	jmp	.L2709
	.p2align 4,,10
	.p2align 3
.L2706:
	movq	(%r12), %rsi
	cmpq	%rdi, %rsi
	jnb	.L2707
	leaq	1(%rsi), %r8
	movq	%r8, (%r12)
	movzbl	(%rsi), %esi
	shlx	%eax, %esi, %esi
	orl	%esi, %edx
.L2707:
	addl	$8, %eax
	movl	%edx, 20(%r12)
	movl	%eax, 16(%r12)
	cmpl	$24, %eax
	jg	.L2705
.L2709:
	shrx	%eax, %edx, %esi
	testl	%esi, %esi
	je	.L2706
	movq	%rdi, (%r12)
	jmp	.L2705
	.p2align 4,,10
	.p2align 3
.L2988:
	movq	8(%r12), %r8
	jmp	.L2716
	.p2align 4,,10
	.p2align 3
.L2713:
	movq	(%r12), %rdi
	cmpq	%r8, %rdi
	jnb	.L2714
	leaq	1(%rdi), %r9
	movq	%r9, (%r12)
	movzbl	(%rdi), %edi
	shlx	%eax, %edi, %edi
	orl	%edi, %edx
.L2714:
	addl	$8, %eax
	movl	%edx, 20(%r12)
	movl	%eax, 16(%r12)
	cmpl	$24, %eax
	jg	.L2712
.L2716:
	shrx	%eax, %edx, %edi
	testl	%edi, %edi
	je	.L2713
	movq	%r8, (%r12)
	jmp	.L2712
	.p2align 4,,10
	.p2align 3
.L2612:
	cmpl	%edi, %eax
	jl	.L2994
.L2616:
	subl	%edi, %eax
	shrx	%edi, %ecx, %ecx
	movl	%eax, 16(%r12)
	movl	%ecx, 20(%r12)
	testl	%eax, %eax
	jg	.L2613
.L2989:
	jne	.L2623
	movq	8(%r12), %rsi
	movq	(%r12), %rax
	cmpq	%rax, %rsi
	jbe	.L2995
	leaq	1(%rax), %rdi
	movq	%rdi, (%r12)
	movzbl	(%rax), %eax
	movb	%al, 180(%rsp)
	movl	$1, %eax
	jmp	.L2736
.L2995:
	xorl	%r9d, %r9d
	movl	$1, %ecx
.L2626:
	movslq	%r9d, %rax
.L2971:
	movb	$0, 180(%rsp,%rax)
	cmpl	$4, %ecx
	je	.L2632
.L2631:
	movl	$3, %edx
	subl	%ecx, %edx
	movslq	%ecx, %rcx
	incq	%rdx
	leaq	180(%rsp,%rcx), %rdi
	xorl	%esi, %esi
	call	memset@PLT
	jmp	.L2632
	.p2align 4,,10
	.p2align 3
.L2671:
	leaq	.LC127(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L2593
	.p2align 4,,10
	.p2align 3
.L2710:
	leaq	.LC227(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L2593
	.p2align 4,,10
	.p2align 3
.L2738:
	movl	%edi, %edx
	jmp	.L2621
	.p2align 4,,10
	.p2align 3
.L2739:
	movl	%r8d, %edx
	jmp	.L2621
	.p2align 4,,10
	.p2align 3
.L2726:
	movl	%r15d, %r15d
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L2733:
	movzbl	(%rdx,%rax), %ecx
	movb	%cl, 0(%r13,%rax)
	incq	%rax
	cmpq	%rax, %r15
	jne	.L2733
	leaq	1(%r13,%rsi), %r13
	jmp	.L2692
.L2990:
	movslq	%ecx, %rax
.L2736:
	leal	1(%rax), %ecx
	cmpq	%rdi, %rsi
	jbe	.L2971
	leaq	1(%rdi), %r8
	movq	%r8, (%r12)
	movslq	%eax, %rdx
	movzbl	(%rdi), %r9d
	movb	%r9b, 180(%rsp,%rdx)
	cmpl	$4, %ecx
	je	.L2632
	leal	2(%rax), %edx
	cmpq	%rsi, %r8
	jnb	.L2629
	leaq	2(%rdi), %r8
	movq	%r8, (%r12)
	movslq	%ecx, %rcx
	movzbl	1(%rdi), %r9d
	movb	%r9b, 180(%rsp,%rcx)
	cmpl	$4, %edx
	je	.L2632
	leal	3(%rax), %ecx
	xorl	%eax, %eax
	cmpq	%rsi, %r8
	jnb	.L2630
	leaq	3(%rdi), %rax
	movq	%rax, (%r12)
	movzbl	2(%rdi), %eax
.L2630:
	movslq	%edx, %rdx
	movb	%al, 180(%rsp,%rdx)
	cmpl	$4, %ecx
	jne	.L2631
	jmp	.L2632
.L2992:
	leaq	.LC226(%rip), %rbx
	movq	%rbx, %fs:stbi__g_failure_reason@tpoff
	jmp	.L2593
	.p2align 4,,10
	.p2align 3
.L2629:
	movslq	%ecx, %rcx
	movb	$0, 180(%rsp,%rcx)
	cmpl	$4, %edx
	je	.L2632
	movl	%edx, %ecx
	jmp	.L2631
	.p2align 4,,10
	.p2align 3
.L2991:
	leaq	.LC225(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L2593
	.p2align 4,,10
	.p2align 3
.L2994:
	movq	8(%r12), %r8
	jmp	.L2620
	.p2align 4,,10
	.p2align 3
.L2617:
	movq	(%r12), %rsi
	cmpq	%r8, %rsi
	jnb	.L2618
	leaq	1(%rsi), %r9
	movq	%r9, (%r12)
	movzbl	(%rsi), %esi
	shlx	%eax, %esi, %esi
	orl	%esi, %ecx
.L2618:
	addl	$8, %eax
	movl	%ecx, 20(%r12)
	movl	%eax, 16(%r12)
	cmpl	$24, %eax
	jg	.L2616
.L2620:
	shrx	%eax, %ecx, %esi
	testl	%esi, %esi
	je	.L2617
	movq	%r8, (%r12)
	jmp	.L2616
	.p2align 4,,10
	.p2align 3
.L2740:
	movl	%ecx, %edx
	jmp	.L2621
.L2981:
	movl	44(%rsp), %eax
	movq	%r13, 24(%r12)
	testl	%eax, %eax
	je	.L2996
.L2743:
	movl	$1, %eax
	jmp	.L2593
.L2984:
	leaq	.LC228(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L2593
.L2976:
	movq	(%rdi), %rax
	movq	8(%rdi), %rcx
	cmpq	%rcx, %rax
	jnb	.L2599
	leaq	1(%rax), %rdi
	movq	%rdi, (%r12)
	movzbl	(%rax), %edx
	movl	%edx, %esi
	cmpq	%rdi, %rcx
	jbe	.L2599
	leaq	2(%rax), %r8
	movq	%r8, (%r12)
	movzbl	1(%rax), %eax
	movl	%eax, %edi
	cmpq	%r8, %rcx
	jbe	.L2599
	sall	$8, %edx
	addl	%edx, %eax
	movq	%rax, %rdx
	imulq	$138547333, %rax, %rax
	movl	%edx, %ecx
	shrq	$32, %rax
	subl	%eax, %ecx
	shrl	%ecx
	addl	%ecx, %eax
	shrl	$4, %eax
	movl	%eax, %ecx
	sall	$5, %ecx
	subl	%eax, %ecx
	movl	%edx, %eax
	subl	%ecx, %eax
	jne	.L2599
	andl	$32, %edi
	jne	.L2997
	andl	$15, %esi
	cmpb	$8, %sil
	je	.L2594
	leaq	.LC223(%rip), %rbx
	movq	%rbx, %fs:stbi__g_failure_reason@tpoff
	jmp	.L2593
.L2643:
	xorl	%eax, %eax
	jmp	.L2593
.L2742:
	movq	%r13, %rcx
	xorl	%eax, %eax
	jmp	.L2727
.L2599:
	leaq	.LC221(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L2593
.L2997:
	leaq	.LC222(%rip), %rbx
	movq	%rbx, %fs:stbi__g_failure_reason@tpoff
	jmp	.L2593
.L2986:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE694:
	.size	stbi__parse_zlib, .-stbi__parse_zlib
	.section	.rodata.str1.1
.LC229:
	.string	"bad file"
	.text
	.p2align 4
	.type	stbi__readval, @function
stbi__readval:
.LFB740:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	leaq	56(%rdi), %rax
	movl	%esi, %r15d
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	leaq	4(%rdx), %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rdx, %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movl	$128, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rdx, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	movq	%rax, 8(%rsp)
	leaq	57(%rdi), %rax
	movq	%rax, 16(%rsp)
.L3010:
	testl	%r12d, %r15d
	je	.L2999
	cmpq	$0, 16(%rbx)
	je	.L3004
	movq	40(%rbx), %rdi
	call	*32(%rbx)
	testl	%eax, %eax
	je	.L3003
	movl	48(%rbx), %edx
	testl	%edx, %edx
	je	.L3001
.L3004:
	movq	192(%rbx), %rax
	cmpq	200(%rbx), %rax
	jnb	.L3001
.L3011:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rbx)
	movzbl	(%rax), %r9d
.L3007:
	movb	%r9b, 0(%rbp)
.L2999:
	incq	%rbp
	sarl	%r12d
	cmpq	%rbp, %r14
	jne	.L3010
.L3017:
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	movq	%r13, %rax
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L3003:
	.cfi_restore_state
	movq	192(%rbx), %rax
	cmpq	200(%rbx), %rax
	jb	.L3011
	movl	48(%rbx), %eax
	xorl	%r9d, %r9d
	testl	%eax, %eax
	je	.L3007
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	8(%rsp), %rsi
	movb	%r9b, 31(%rsp)
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	testl	%eax, %eax
	jne	.L3008
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	movq	16(%rsp), %rax
	movzbl	31(%rsp), %r9d
.L3009:
	vmovq	16(%rsp), %xmm1
	vpinsrq	$1, %rax, %xmm1, %xmm0
	vmovdqu	%xmm0, 192(%rbx)
	jmp	.L3007
	.p2align 4,,10
	.p2align 3
.L3001:
	leaq	.LC229(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%r13d, %r13d
	jmp	.L3017
	.p2align 4,,10
	.p2align 3
.L3008:
	cltq
	movzbl	56(%rbx), %r9d
	addq	8(%rsp), %rax
	jmp	.L3009
	.cfi_endproc
.LFE740:
	.size	stbi__readval, .-stbi__readval
	.p2align 4
	.type	stbi__get16le, @function
stbi__get16le:
.LFB632:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rdi, %rbx
	movq	192(%rdi), %rdx
	movq	200(%rdi), %rax
	cmpq	%rax, %rdx
	jb	.L3032
	movl	48(%rdi), %r12d
	testl	%r12d, %r12d
	jne	.L3033
.L3019:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	movl	%r12d, %eax
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L3032:
	.cfi_restore_state
	leaq	1(%rdx), %rcx
	movq	%rcx, 192(%rdi)
	movzbl	(%rdx), %r12d
.L3021:
	cmpq	%rax, %rcx
	jnb	.L3025
	leaq	1(%rcx), %rax
	movq	%rax, 192(%rbx)
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	movzbl	(%rcx), %eax
	sall	$8, %eax
	addl	%eax, %r12d
	movl	%r12d, %eax
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L3025:
	.cfi_restore_state
	movl	48(%rbx), %eax
	testl	%eax, %eax
	je	.L3019
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	leaq	56(%rbx), %rbp
	movq	%rbp, %rsi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	leaq	57(%rbx), %rdx
	testl	%eax, %eax
	jne	.L3026
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	movq	%rdx, %rbp
.L3027:
	vmovq	%rdx, %xmm2
	vpinsrq	$1, %rbp, %xmm2, %xmm0
	vmovdqu	%xmm0, 192(%rbx)
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	movl	%r12d, %eax
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L3033:
	.cfi_restore_state
	movl	52(%rdi), %edx
	leaq	56(%rdi), %rbp
	movq	40(%rdi), %rdi
	movq	%rbp, %rsi
	call	*16(%rbx)
	movslq	%eax, %r12
	movq	192(%rbx), %rax
	leaq	57(%rbx), %rcx
	subq	208(%rbx), %rax
	addl	%eax, 184(%rbx)
	testl	%r12d, %r12d
	jne	.L3023
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	movq	%rcx, %rax
.L3024:
	vmovq	%rcx, %xmm1
	vpinsrq	$1, %rax, %xmm1, %xmm0
	vmovdqu	%xmm0, 192(%rbx)
	jmp	.L3021
	.p2align 4,,10
	.p2align 3
.L3026:
	cltq
	addq	%rax, %rbp
	movzbl	56(%rbx), %eax
	sall	$8, %eax
	addl	%eax, %r12d
	jmp	.L3027
	.p2align 4,,10
	.p2align 3
.L3023:
	leaq	0(%rbp,%r12), %rax
	movzbl	56(%rbx), %r12d
	jmp	.L3024
	.cfi_endproc
.LFE632:
	.size	stbi__get16le, .-stbi__get16le
	.p2align 4
	.type	stbi__get16be, @function
stbi__get16be:
.LFB630:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rdi, %rbx
	movq	192(%rdi), %rdx
	movq	200(%rdi), %rax
	cmpq	%rax, %rdx
	jb	.L3047
	movl	48(%rdi), %r12d
	testl	%r12d, %r12d
	jne	.L3048
.L3034:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	movl	%r12d, %eax
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L3047:
	.cfi_restore_state
	leaq	1(%rdx), %rcx
	movq	%rcx, 192(%rdi)
	movzbl	(%rdx), %r12d
	sall	$8, %r12d
.L3036:
	cmpq	%rax, %rcx
	jnb	.L3040
	leaq	1(%rcx), %rax
	movq	%rax, 192(%rbx)
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	movzbl	(%rcx), %eax
	addl	%eax, %r12d
	movl	%r12d, %eax
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L3040:
	.cfi_restore_state
	movl	48(%rbx), %eax
	testl	%eax, %eax
	je	.L3034
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	leaq	56(%rbx), %rbp
	movq	%rbp, %rsi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	leaq	57(%rbx), %rdx
	testl	%eax, %eax
	jne	.L3041
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	movq	%rdx, %rbp
.L3042:
	vmovq	%rdx, %xmm2
	vpinsrq	$1, %rbp, %xmm2, %xmm0
	vmovdqu	%xmm0, 192(%rbx)
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	movl	%r12d, %eax
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L3048:
	.cfi_restore_state
	movl	52(%rdi), %edx
	leaq	56(%rdi), %rbp
	movq	40(%rdi), %rdi
	movq	%rbp, %rsi
	call	*16(%rbx)
	movslq	%eax, %r12
	movq	192(%rbx), %rax
	leaq	57(%rbx), %rcx
	subq	208(%rbx), %rax
	addl	%eax, 184(%rbx)
	testl	%r12d, %r12d
	jne	.L3038
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	movq	%rcx, %rax
.L3039:
	vmovq	%rcx, %xmm1
	vpinsrq	$1, %rax, %xmm1, %xmm0
	vmovdqu	%xmm0, 192(%rbx)
	jmp	.L3036
	.p2align 4,,10
	.p2align 3
.L3041:
	cltq
	addq	%rax, %rbp
	movzbl	56(%rbx), %eax
	addl	%eax, %r12d
	jmp	.L3042
	.p2align 4,,10
	.p2align 3
.L3038:
	leaq	0(%rbp,%r12), %rax
	movzbl	56(%rbx), %r12d
	sall	$8, %r12d
	jmp	.L3039
	.cfi_endproc
.LFE630:
	.size	stbi__get16be, .-stbi__get16be
	.p2align 4
	.type	stbi__get32be, @function
stbi__get32be:
.LFB631:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%rdi, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	movq	192(%rdi), %rax
	movq	200(%rdi), %rdx
	cmpq	%rdx, %rax
	jb	.L3073
	movl	48(%rdi), %r13d
	testl	%r13d, %r13d
	jne	.L3074
.L3052:
	sall	$16, %r13d
.L3061:
	xorl	%ebp, %ebp
.L3065:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	leal	0(%rbp,%r13), %eax
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L3073:
	.cfi_restore_state
	leaq	1(%rax), %rcx
	movq	%rcx, 192(%rdi)
	movzbl	(%rax), %r12d
	sall	$8, %r12d
	movl	%r12d, %r13d
.L3051:
	cmpq	%rdx, %rcx
	jnb	.L3055
	leaq	1(%rcx), %rsi
	movq	%rsi, 192(%rbx)
	movzbl	(%rcx), %eax
	addl	%eax, %r13d
	sall	$16, %r13d
	cmpq	%rdx, %rsi
	jnb	.L3059
.L3075:
	leaq	1(%rsi), %rcx
	movq	%rcx, 192(%rbx)
	movzbl	(%rsi), %ebp
	sall	$8, %ebp
	cmpq	%rdx, %rcx
	jnb	.L3064
.L3076:
	leaq	1(%rcx), %rax
	movq	%rax, 192(%rbx)
	movzbl	(%rcx), %eax
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	addl	%eax, %ebp
	leal	0(%rbp,%r13), %eax
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L3055:
	.cfi_restore_state
	movl	48(%rbx), %ecx
	testl	%ecx, %ecx
	je	.L3052
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	leaq	56(%rbx), %rbp
	movq	%rbp, %rsi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	leaq	57(%rbx), %rsi
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	testl	%eax, %eax
	jne	.L3057
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	movq	%rsi, %rdx
.L3058:
	vmovq	%rsi, %xmm2
	vpinsrq	$1, %rdx, %xmm2, %xmm0
	vmovdqu	%xmm0, 192(%rbx)
	sall	$16, %r13d
	cmpq	%rdx, %rsi
	jb	.L3075
.L3059:
	movl	48(%rbx), %edx
	testl	%edx, %edx
	je	.L3061
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	leaq	56(%rbx), %r12
	movq	%r12, %rsi
	call	*16(%rbx)
	movslq	%eax, %rbp
	movq	192(%rbx), %rax
	leaq	57(%rbx), %rcx
	subq	208(%rbx), %rax
	addl	%eax, 184(%rbx)
	testl	%ebp, %ebp
	jne	.L3062
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	movq	%rcx, %rdx
.L3063:
	vmovq	%rcx, %xmm3
	vpinsrq	$1, %rdx, %xmm3, %xmm0
	vmovdqu	%xmm0, 192(%rbx)
	cmpq	%rdx, %rcx
	jb	.L3076
.L3064:
	movl	48(%rbx), %eax
	testl	%eax, %eax
	je	.L3065
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	leaq	56(%rbx), %r12
	movq	%r12, %rsi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	leaq	57(%rbx), %rdx
	testl	%eax, %eax
	jne	.L3066
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	movq	%rdx, %r12
.L3067:
	vmovq	%rdx, %xmm4
	vpinsrq	$1, %r12, %xmm4, %xmm0
	vmovdqu	%xmm0, 192(%rbx)
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	leal	0(%rbp,%r13), %eax
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L3074:
	.cfi_restore_state
	movl	52(%rdi), %edx
	leaq	56(%rdi), %rbp
	movq	40(%rdi), %rdi
	movq	%rbp, %rsi
	call	*16(%rbx)
	movl	%eax, %r13d
	movq	192(%rbx), %rax
	leaq	57(%rbx), %rcx
	subq	208(%rbx), %rax
	addl	%eax, 184(%rbx)
	testl	%r13d, %r13d
	jne	.L3053
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	movq	%rcx, %rdx
.L3054:
	vmovq	%rcx, %xmm1
	vpinsrq	$1, %rdx, %xmm1, %xmm0
	vmovdqu	%xmm0, 192(%rbx)
	jmp	.L3051
	.p2align 4,,10
	.p2align 3
.L3057:
	cltq
	leaq	0(%rbp,%rax), %rdx
	movzbl	56(%rbx), %eax
	addl	%eax, %r13d
	jmp	.L3058
	.p2align 4,,10
	.p2align 3
.L3062:
	leaq	(%r12,%rbp), %rdx
	movzbl	56(%rbx), %ebp
	sall	$8, %ebp
	jmp	.L3063
	.p2align 4,,10
	.p2align 3
.L3053:
	movslq	%r13d, %r12
	leaq	0(%rbp,%r12), %rdx
	movzbl	56(%rbx), %r12d
	sall	$8, %r12d
	movl	%r12d, %r13d
	jmp	.L3054
	.p2align 4,,10
	.p2align 3
.L3066:
	cltq
	addq	%rax, %r12
	movzbl	56(%rbx), %eax
	addl	%eax, %ebp
	jmp	.L3067
	.cfi_endproc
.LFE631:
	.size	stbi__get32be, .-stbi__get32be
	.p2align 4
	.type	stbi__get32le, @function
stbi__get32le:
.LFB633:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%rdi, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	movq	192(%rdi), %rdx
	movq	200(%rdi), %rax
	cmpq	%rax, %rdx
	jb	.L3101
	movl	48(%rdi), %r13d
	testl	%r13d, %r13d
	jne	.L3102
.L3089:
	xorl	%ebp, %ebp
.L3093:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	sall	$16, %ebp
	leal	0(%rbp,%r13), %eax
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L3101:
	.cfi_restore_state
	leaq	1(%rdx), %rsi
	movq	%rsi, 192(%rdi)
	movzbl	(%rdx), %r13d
	cmpq	%rax, %rsi
	jnb	.L3083
.L3103:
	leaq	1(%rsi), %rcx
	movq	%rcx, 192(%rbx)
	movzbl	(%rsi), %edx
	sall	$8, %edx
	addl	%edx, %r13d
	cmpq	%rax, %rcx
	jnb	.L3087
.L3104:
	leaq	1(%rcx), %rdx
	movq	%rdx, 192(%rbx)
	movzbl	(%rcx), %ebp
	cmpq	%rax, %rdx
	jnb	.L3092
.L3105:
	leaq	1(%rdx), %rax
	movq	%rax, 192(%rbx)
	movzbl	(%rdx), %eax
	sall	$8, %eax
	addl	%eax, %ebp
	jmp	.L3093
	.p2align 4,,10
	.p2align 3
.L3102:
	movl	52(%rdi), %edx
	leaq	56(%rdi), %rbp
	movq	40(%rdi), %rdi
	movq	%rbp, %rsi
	call	*16(%rbx)
	movslq	%eax, %r13
	movq	192(%rbx), %rax
	leaq	57(%rbx), %rsi
	subq	208(%rbx), %rax
	addl	%eax, 184(%rbx)
	testl	%r13d, %r13d
	jne	.L3081
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	movq	%rsi, %rax
.L3082:
	vmovq	%rsi, %xmm1
	vpinsrq	$1, %rax, %xmm1, %xmm0
	vmovdqu	%xmm0, 192(%rbx)
	cmpq	%rax, %rsi
	jb	.L3103
.L3083:
	movl	48(%rbx), %ecx
	testl	%ecx, %ecx
	je	.L3089
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	leaq	56(%rbx), %rbp
	movq	%rbp, %rsi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	leaq	57(%rbx), %rcx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	testl	%eax, %eax
	jne	.L3085
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	movq	%rcx, %rax
.L3086:
	vmovq	%rcx, %xmm2
	vpinsrq	$1, %rax, %xmm2, %xmm0
	vmovdqu	%xmm0, 192(%rbx)
	cmpq	%rax, %rcx
	jb	.L3104
.L3087:
	movl	48(%rbx), %edx
	testl	%edx, %edx
	je	.L3089
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	leaq	56(%rbx), %r12
	movq	%r12, %rsi
	call	*16(%rbx)
	movslq	%eax, %rbp
	movq	192(%rbx), %rax
	leaq	57(%rbx), %rdx
	subq	208(%rbx), %rax
	addl	%eax, 184(%rbx)
	testl	%ebp, %ebp
	jne	.L3090
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	movq	%rdx, %rax
.L3091:
	vmovq	%rdx, %xmm3
	vpinsrq	$1, %rax, %xmm3, %xmm0
	vmovdqu	%xmm0, 192(%rbx)
	cmpq	%rax, %rdx
	jb	.L3105
.L3092:
	movl	48(%rbx), %eax
	testl	%eax, %eax
	je	.L3093
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	leaq	56(%rbx), %r12
	movq	%r12, %rsi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	leaq	57(%rbx), %rdx
	testl	%eax, %eax
	jne	.L3094
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	movq	%rdx, %r12
.L3095:
	vmovq	%rdx, %xmm4
	vpinsrq	$1, %r12, %xmm4, %xmm0
	vmovdqu	%xmm0, 192(%rbx)
	jmp	.L3093
	.p2align 4,,10
	.p2align 3
.L3081:
	leaq	0(%rbp,%r13), %rax
	movzbl	56(%rbx), %r13d
	jmp	.L3082
	.p2align 4,,10
	.p2align 3
.L3085:
	movzbl	56(%rbx), %edx
	cltq
	sall	$8, %edx
	addq	%rbp, %rax
	addl	%edx, %r13d
	jmp	.L3086
	.p2align 4,,10
	.p2align 3
.L3094:
	cltq
	addq	%rax, %r12
	movzbl	56(%rbx), %eax
	sall	$8, %eax
	addl	%eax, %ebp
	jmp	.L3095
	.p2align 4,,10
	.p2align 3
.L3090:
	leaq	(%r12,%rbp), %rax
	movzbl	56(%rbx), %ebp
	jmp	.L3091
	.cfi_endproc
.LFE633:
	.size	stbi__get32le, .-stbi__get32le
	.section	.rodata.str1.1
.LC230:
	.string	"expected marker"
.LC231:
	.string	"bad DRI len"
.LC232:
	.string	"bad DQT type"
.LC233:
	.string	"bad DQT table"
.LC234:
	.string	"bad DHT header"
.LC235:
	.string	"bad COM len"
.LC236:
	.string	"bad APP len"
.LC237:
	.string	"unknown marker"
	.text
	.p2align 4
	.type	stbi__process_marker, @function
stbi__process_marker:
.LFB658:
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
	movq	%rdi, %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$136, %rsp
	.cfi_def_cfa_offset 192
	movq	%fs:40, %rax
	movq	%rax, 120(%rsp)
	xorl	%eax, %eax
	cmpl	$221, %esi
	je	.L3107
	movl	%esi, %ebx
	jg	.L3108
	cmpl	$196, %esi
	je	.L3109
	cmpl	$219, %esi
	jne	.L3111
	movq	(%rdi), %rdi
	call	stbi__get16be
	subl	$2, %eax
	movl	%eax, 8(%rsp)
	testl	%eax, %eax
	jle	.L3115
	leaq	64+stbi__jpeg_dezigzag(%rip), %r8
	.p2align 4,,10
	.p2align 3
.L3141:
	movq	0(%r13), %rbx
	movq	192(%rbx), %rdx
	movq	200(%rbx), %rsi
	cmpq	%rsi, %rdx
	jb	.L3245
	movl	48(%rbx), %r14d
	xorl	%r15d, %r15d
	testl	%r14d, %r14d
	jne	.L3246
.L3118:
	leaq	stbi__jpeg_dezigzag(%rip), %r12
	movslq	%r15d, %r15
	jmp	.L3138
	.p2align 4,,10
	.p2align 3
.L3249:
	cmpq	%rdx, %rsi
	ja	.L3247
	movl	48(%rbx), %ebp
	testl	%ebp, %ebp
	jne	.L3248
.L3132:
	movzbl	(%r12), %edx
	movq	%r15, %rax
	salq	$6, %rax
	leaq	6720(%rdx,%rax), %rax
	incq	%r12
	movw	%bp, 8(%r13,%rax,2)
	cmpq	%r12, %r8
	je	.L3137
	movq	0(%r13), %rbx
	movq	192(%rbx), %rdx
	movq	200(%rbx), %rsi
.L3138:
	testl	%r14d, %r14d
	jne	.L3249
	cmpq	%rdx, %rsi
	ja	.L3250
	movl	48(%rbx), %eax
	xorl	%ebp, %ebp
	testl	%eax, %eax
	je	.L3132
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	leaq	56(%rbx), %rsi
	movq	%rsi, (%rsp)
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	movq	(%rsp), %rsi
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	testl	%eax, %eax
	leaq	57(%rbx), %rdx
	leaq	64+stbi__jpeg_dezigzag(%rip), %r8
	jne	.L3135
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	movq	%rdx, %rsi
.L3136:
	vmovq	%rdx, %xmm3
	vpinsrq	$1, %rsi, %xmm3, %xmm0
	vmovdqu	%xmm0, 192(%rbx)
	jmp	.L3132
.L3108:
	cmpl	$255, %esi
	jne	.L3112
	leaq	.LC230(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
.L3106:
	movq	120(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L3251
	addq	$136, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
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
	ret
.L3112:
	.cfi_restore_state
	leal	-224(%rsi), %eax
	cmpl	$15, %eax
	jbe	.L3189
	cmpl	$254, %esi
	je	.L3189
.L3111:
	leaq	.LC237(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L3106
.L3109:
	movq	(%rdi), %rdi
	call	stbi__get16be
	subl	$2, %eax
	movl	%eax, 16(%rsp)
	testl	%eax, %eax
	jle	.L3142
	.p2align 4,,10
	.p2align 3
.L3159:
	movq	0(%r13), %r12
	movq	192(%r12), %rax
	movq	200(%r12), %rdx
	cmpq	%rdx, %rax
	jb	.L3252
	movl	48(%r12), %ecx
	movl	$0, 24(%rsp)
	movl	%ecx, (%rsp)
	movq	$0, 8(%rsp)
	testl	%ecx, %ecx
	jne	.L3253
.L3145:
	leaq	48(%rsp), %r14
	movq	%r14, 40(%rsp)
	leaq	112(%rsp), %rbx
	xorl	%ebp, %ebp
	jmp	.L3149
	.p2align 4,,10
	.p2align 3
.L3151:
	movl	48(%r12), %eax
	testl	%eax, %eax
	jne	.L3254
.L3152:
	movl	%eax, (%r14)
	addq	$4, %r14
	cmpq	%r14, %rbx
	je	.L3255
.L3155:
	movq	0(%r13), %r12
	movq	192(%r12), %rax
	movq	200(%r12), %rdx
.L3149:
	cmpq	%rdx, %rax
	jnb	.L3151
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%r12)
	addq	$4, %r14
	movzbl	(%rax), %eax
	movl	%eax, -4(%r14)
	addl	%eax, %ebp
	cmpq	%r14, %rbx
	jne	.L3155
.L3255:
	movl	16(%rsp), %eax
	movl	(%rsp), %r11d
	subl	$17, %eax
	movl	%eax, 36(%rsp)
	movq	8(%rsp), %rax
	testl	%r11d, %r11d
	jne	.L3156
	movq	40(%rsp), %rsi
	leaq	8(%r13,%rax), %rdi
	call	stbi__build_huffman
	testl	%eax, %eax
	je	.L3243
	movslq	24(%rsp), %rax
	movq	%rax, 24(%rsp)
	imulq	$1680, %rax, %rax
	leaq	1032(%r13,%rax), %rbx
	testl	%ebp, %ebp
	je	.L3166
.L3158:
	xorl	%r12d, %r12d
	jmp	.L3165
	.p2align 4,,10
	.p2align 3
.L3161:
	movl	48(%r15), %r10d
	xorl	%r14d, %r14d
	testl	%r10d, %r10d
	jne	.L3256
.L3162:
	movb	%r14b, (%rbx,%r12)
	incq	%r12
	cmpl	%r12d, %ebp
	jle	.L3257
.L3165:
	movq	0(%r13), %r15
	movq	192(%r15), %rax
	cmpq	200(%r15), %rax
	jnb	.L3161
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%r15)
	movzbl	(%rax), %r14d
	movb	%r14b, (%rbx,%r12)
	incq	%r12
	cmpl	%r12d, %ebp
	jg	.L3165
.L3257:
	movl	(%rsp), %r9d
	testl	%r9d, %r9d
	je	.L3166
	movq	8(%rsp), %rax
	leaq	6728(%r13,%rax), %rdi
.L3160:
	movq	24(%rsp), %rbx
	xorl	%edx, %edx
	salq	$10, %rbx
	leaq	13960(%r13,%rbx), %r11
	movl	$-1, %ecx
	movl	$1, %ebx
	.p2align 4,,10
	.p2align 3
.L3169:
	movzbl	(%rdi,%rdx), %eax
	xorl	%r8d, %r8d
	movw	%r8w, (%r11,%rdx,2)
	cmpb	$-1, %al
	je	.L3167
	movzbl	1024(%rdi,%rax), %r9d
	movl	%r9d, %r14d
	andl	$15, %r14d
	je	.L3167
	movzbl	1280(%rdi,%rax), %r15d
	movzbl	%r14b, %r10d
	movl	%r15d, %eax
	addl	%r10d, %r15d
	cmpl	$9, %r15d
	jg	.L3167
	movl	$9, %r15d
	subl	%r10d, %r15d
	shlx	%eax, %edx, %esi
	decl	%r10d
	andl	$511, %esi
	sarx	%r15d, %esi, %esi
	shlx	%r10d, %ebx, %r10d
	movl	%esi, %r15d
	cmpl	%r10d, %esi
	jge	.L3168
	shlx	%r14d, %ecx, %r10d
	leal	1(%rsi,%r10), %r15d
	movl	%r15d, %esi
.L3168:
	subl	$-128, %r15d
	cmpl	$255, %r15d
	ja	.L3167
	sall	$4, %esi
	sarl	$4, %r9d
	addl	%r9d, %esi
	movzbl	%r14b, %r14d
	sall	$4, %esi
	addl	%r14d, %eax
	addl	%esi, %eax
	movw	%ax, (%r11,%rdx,2)
	.p2align 4,,10
	.p2align 3
.L3167:
	incq	%rdx
	cmpq	$512, %rdx
	jne	.L3169
.L3166:
	movl	36(%rsp), %eax
	subl	%ebp, %eax
	movl	%eax, 16(%rsp)
	testl	%eax, %eax
	jg	.L3159
.L3142:
	movl	16(%rsp), %edx
	xorl	%eax, %eax
	testl	%edx, %edx
	sete	%al
	jmp	.L3106
	.p2align 4,,10
	.p2align 3
.L3254:
	movl	52(%r12), %edx
	movq	40(%r12), %rdi
	leaq	56(%r12), %r15
	movq	%r15, %rsi
	call	*16(%r12)
	movq	192(%r12), %rdx
	subq	208(%r12), %rdx
	addl	%edx, 184(%r12)
	leaq	57(%r12), %rdx
	testl	%eax, %eax
	jne	.L3153
	movl	$0, 48(%r12)
	movb	$0, 56(%r12)
	movq	%rdx, %rsi
.L3154:
	vmovq	%rdx, %xmm4
	vpinsrq	$1, %rsi, %xmm4, %xmm0
	vmovdqu	%xmm0, 192(%r12)
	jmp	.L3152
	.p2align 4,,10
	.p2align 3
.L3153:
	cltq
	leaq	(%r15,%rax), %rsi
	movzbl	56(%r12), %eax
	addl	%eax, %ebp
	jmp	.L3154
	.p2align 4,,10
	.p2align 3
.L3256:
	movl	52(%r15), %edx
	movq	40(%r15), %rdi
	leaq	56(%r15), %rsi
	movq	%rsi, 16(%rsp)
	call	*16(%r15)
	movq	192(%r15), %rdx
	movq	16(%rsp), %rsi
	subq	208(%r15), %rdx
	addl	%edx, 184(%r15)
	testl	%eax, %eax
	leaq	57(%r15), %rdx
	jne	.L3163
	movl	$0, 48(%r15)
	movb	$0, 56(%r15)
	movq	%rdx, %rsi
.L3164:
	vmovq	%rdx, %xmm5
	vpinsrq	$1, %rsi, %xmm5, %xmm0
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L3162
	.p2align 4,,10
	.p2align 3
.L3163:
	cltq
	movzbl	56(%r15), %r14d
	addq	%rax, %rsi
	jmp	.L3164
	.p2align 4,,10
	.p2align 3
.L3156:
	movq	40(%rsp), %rsi
	leaq	6728(%r13,%rax), %rdi
	movq	%rdi, 16(%rsp)
	call	stbi__build_huffman
	testl	%eax, %eax
	je	.L3243
	movslq	24(%rsp), %rax
	movq	16(%rsp), %rdi
	movq	%rax, 24(%rsp)
	imulq	$1680, %rax, %rax
	testl	%ebp, %ebp
	leaq	7752(%r13,%rax), %rbx
	jne	.L3158
	jmp	.L3160
.L3252:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%r12)
	movzbl	(%rax), %eax
	movl	%eax, %ecx
	sarl	$4, %ecx
	movl	%eax, %r14d
	movl	%ecx, (%rsp)
	movl	%eax, %ecx
	andl	$15, %ecx
	andl	$15, %r14d
	cmpl	$31, %eax
	seta	%al
	movl	%ecx, 24(%rsp)
	cmpl	$3, %ecx
	setg	%dl
	orl	%edx, %eax
.L3144:
	testb	%al, %al
	jne	.L3148
.L3147:
	movzbl	%r14b, %r14d
	imulq	$1680, %r14, %rax
	movq	0(%r13), %r12
	movq	%rax, 8(%rsp)
	movq	200(%r12), %rdx
	movq	192(%r12), %rax
	jmp	.L3145
.L3253:
	movl	52(%r12), %edx
	movq	40(%r12), %rdi
	leaq	56(%r12), %r14
	movq	%r14, %rsi
	call	*16(%r12)
	movl	%eax, (%rsp)
	movl	%eax, %ecx
	movq	192(%r12), %rax
	leaq	57(%r12), %rdx
	subq	208(%r12), %rax
	addl	%eax, 184(%r12)
	testl	%ecx, %ecx
	jne	.L3146
	vmovq	%rdx, %xmm6
	vpunpcklqdq	%xmm6, %xmm6, %xmm0
	movl	$0, 48(%r12)
	movb	$0, 56(%r12)
	vmovdqu	%xmm0, 192(%r12)
	xorl	%r14d, %r14d
	jmp	.L3147
.L3107:
	movq	(%rdi), %rdi
	call	stbi__get16be
	cmpl	$4, %eax
	je	.L3114
	leaq	.LC231(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L3106
.L3146:
	movslq	(%rsp), %rax
	vmovq	%rdx, %xmm7
	leaq	(%r14,%rax), %rsi
	movzbl	56(%r12), %eax
	vpinsrq	$1, %rsi, %xmm7, %xmm0
	movl	%eax, %ecx
	sarl	$4, %ecx
	movl	%eax, %r14d
	movl	%ecx, (%rsp)
	movl	%eax, %ecx
	andl	$15, %ecx
	andl	$15, %r14d
	cmpl	$31, %eax
	seta	%al
	cmpl	$3, %ecx
	setg	%dil
	movl	%ecx, 24(%rsp)
	orl	%edi, %eax
	vmovdqu	%xmm0, 192(%r12)
	jmp	.L3144
.L3114:
	movq	0(%r13), %rdi
	call	stbi__get16be
	movl	%eax, 18536(%r13)
	movl	$1, %eax
	jmp	.L3106
.L3189:
	movq	0(%r13), %rdi
	call	stbi__get16be
	movl	%eax, %ebp
	cmpl	$1, %eax
	jg	.L3171
	cmpl	$254, %ebx
	je	.L3258
	leaq	.LC236(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L3106
	.p2align 4,,10
	.p2align 3
.L3137:
	testl	%r14d, %r14d
	je	.L3139
	subl	$129, 8(%rsp)
	movl	8(%rsp), %eax
	testl	%eax, %eax
	jg	.L3141
.L3115:
	movl	8(%rsp), %ebx
	xorl	%eax, %eax
	testl	%ebx, %ebx
	sete	%al
	jmp	.L3106
	.p2align 4,,10
	.p2align 3
.L3247:
	leaq	1(%rdx), %rdi
	movq	%rdi, 192(%rbx)
	movzbl	(%rdx), %ebp
	sall	$8, %ebp
	cmpq	%rsi, %rdi
	jnb	.L3129
.L3259:
	leaq	1(%rdi), %rax
	movq	%rax, 192(%rbx)
	movzbl	(%rdi), %eax
	addl	%eax, %ebp
	jmp	.L3132
	.p2align 4,,10
	.p2align 3
.L3250:
	leaq	1(%rdx), %rax
	movq	%rax, 192(%rbx)
	movzbl	(%rdx), %ebp
	jmp	.L3132
	.p2align 4,,10
	.p2align 3
.L3248:
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	leaq	56(%rbx), %rbp
	movq	%rbp, %rsi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	leaq	57(%rbx), %rdi
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	testl	%eax, %eax
	leaq	64+stbi__jpeg_dezigzag(%rip), %r8
	jne	.L3127
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	movq	%rdi, %rsi
.L3128:
	movzbl	56(%rbx), %ebp
	vmovq	%rdi, %xmm1
	vpinsrq	$1, %rsi, %xmm1, %xmm0
	vmovdqu	%xmm0, 192(%rbx)
	sall	$8, %ebp
	cmpq	%rsi, %rdi
	jb	.L3259
.L3129:
	movl	48(%rbx), %eax
	testl	%eax, %eax
	je	.L3132
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	leaq	56(%rbx), %rsi
	movq	%rsi, (%rsp)
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	movq	(%rsp), %rsi
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	testl	%eax, %eax
	leaq	57(%rbx), %rdx
	leaq	64+stbi__jpeg_dezigzag(%rip), %r8
	jne	.L3130
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	movq	%rdx, %rsi
.L3131:
	movzbl	56(%rbx), %eax
	vmovq	%rdx, %xmm2
	vpinsrq	$1, %rsi, %xmm2, %xmm0
	vmovdqu	%xmm0, 192(%rbx)
	addl	%eax, %ebp
	jmp	.L3132
	.p2align 4,,10
	.p2align 3
.L3135:
	cltq
	movzbl	56(%rbx), %ebp
	addq	%rax, %rsi
	jmp	.L3136
	.p2align 4,,10
	.p2align 3
.L3127:
	cltq
	leaq	0(%rbp,%rax), %rsi
	jmp	.L3128
	.p2align 4,,10
	.p2align 3
.L3130:
	cltq
	addq	%rax, %rsi
	jmp	.L3131
.L3139:
	subl	$65, 8(%rsp)
	movl	8(%rsp), %eax
	testl	%eax, %eax
	jg	.L3141
	jmp	.L3115
	.p2align 4,,10
	.p2align 3
.L3245:
	leaq	1(%rdx), %rax
	movq	%rax, 192(%rbx)
	movzbl	(%rdx), %r14d
	movl	%r14d, %eax
	movl	%eax, %r15d
	sarl	$4, %r14d
	andl	$15, %r15d
.L3117:
	cmpl	$1, %r14d
	jg	.L3260
	testb	$12, %al
	jne	.L3122
.L3120:
	movq	0(%r13), %rbx
	movq	192(%rbx), %rdx
	movq	200(%rbx), %rsi
	jmp	.L3118
.L3246:
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	leaq	56(%rbx), %rbp
	movq	%rbp, %rsi
	call	*16(%rbx)
	movslq	%eax, %r15
	movq	192(%rbx), %rax
	leaq	57(%rbx), %rdx
	subq	208(%rbx), %rax
	addl	%eax, 184(%rbx)
	testl	%r15d, %r15d
	leaq	64+stbi__jpeg_dezigzag(%rip), %r8
	jne	.L3119
	vmovq	%rdx, %xmm6
	vpunpcklqdq	%xmm6, %xmm6, %xmm0
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	vmovdqu	%xmm0, 192(%rbx)
	xorl	%r14d, %r14d
	jmp	.L3120
.L3148:
	leaq	.LC234(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
.L3243:
	xorl	%eax, %eax
	jmp	.L3106
.L3119:
	movzbl	56(%rbx), %r14d
	addq	%r15, %rbp
	movl	%r14d, %eax
	vmovq	%rdx, %xmm7
	movl	%eax, %r15d
	vpinsrq	$1, %rbp, %xmm7, %xmm0
	sarl	$4, %r14d
	andl	$15, %r15d
	vmovdqu	%xmm0, 192(%rbx)
	jmp	.L3117
.L3122:
	leaq	.LC233(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L3106
.L3260:
	leaq	.LC232(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L3106
.L3171:
	leal	-2(%rax), %esi
	cmpl	$224, %ebx
	jne	.L3173
	cmpl	$4, %esi
	jle	.L3173
	leaq	tag.38(%rip), %rbx
	leaq	5(%rbx), %r14
	movl	$1, %r12d
	xorl	%r15d, %r15d
.L3175:
	movq	0(%r13), %rdi
	call	stbi__get8
	cmpb	(%rbx), %al
	cmovne	%r15d, %r12d
	incq	%rbx
	cmpq	%r14, %rbx
	jne	.L3175
	leal	-7(%rbp), %esi
	testl	%r12d, %r12d
	je	.L3176
	movl	$1, 18504(%r13)
.L3176:
	movq	0(%r13), %rdi
	testl	%esi, %esi
	je	.L3244
	js	.L3261
.L3182:
	call	stbi__skip.part.0
.L3244:
	movl	$1, %eax
	jmp	.L3106
.L3173:
	cmpl	$238, %ebx
	jne	.L3177
	cmpl	$11, %esi
	jle	.L3177
	leaq	tag.37(%rip), %rbx
	leaq	6(%rbx), %r14
	movl	$1, %r12d
	xorl	%r15d, %r15d
.L3179:
	movq	0(%r13), %rdi
	call	stbi__get8
	cmpb	(%rbx), %al
	cmovne	%r15d, %r12d
	incq	%rbx
	cmpq	%r14, %rbx
	jne	.L3179
	leal	-8(%rbp), %esi
	testl	%r12d, %r12d
	je	.L3176
	movq	0(%r13), %rdi
	call	stbi__get8
	movq	0(%r13), %rdi
	call	stbi__get16be
	movq	0(%r13), %rdi
	call	stbi__get16be
	movq	0(%r13), %rdi
	call	stbi__get8
	movzbl	%al, %eax
	movl	%eax, 18508(%r13)
	leal	-14(%rbp), %esi
	jmp	.L3176
.L3177:
	movq	0(%r13), %rdi
	testl	%esi, %esi
	jne	.L3182
	jmp	.L3244
.L3258:
	leaq	.LC235(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L3106
.L3251:
	call	__stack_chk_fail@PLT
	.p2align 4,,10
	.p2align 3
.L3261:
	movq	200(%rdi), %rax
	movq	%rax, 192(%rdi)
	movl	$1, %eax
	jmp	.L3106
	.cfi_endproc
.LFE658:
	.size	stbi__process_marker, .-stbi__process_marker
	.p2align 4
	.type	stbi__grow_buffer_unsafe, @function
stbi__grow_buffer_unsafe:
.LFB642:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%rdi, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	.p2align 4,,10
	.p2align 3
.L3280:
	movl	18476(%rbx), %esi
	testl	%esi, %esi
	je	.L3292
	movl	18468(%rbx), %eax
	addl	$8, %eax
	movl	%eax, 18468(%rbx)
	cmpl	$24, %eax
	jg	.L3289
.L3279:
	addl	$8, %eax
	cmpl	$24, %eax
	jle	.L3279
	movl	%eax, 18468(%rbx)
.L3289:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
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
.L3292:
	.cfi_restore_state
	movq	(%rbx), %rbp
	movq	192(%rbp), %rax
	cmpq	200(%rbp), %rax
	jb	.L3293
	movl	48(%rbp), %ecx
	xorl	%r12d, %r12d
	testl	%ecx, %ecx
	jne	.L3294
.L3266:
	movl	18468(%rbx), %eax
	movl	$24, %edx
	subl	%eax, %edx
	addl	$8, %eax
	shlx	%edx, %r12d, %r12d
	movl	%eax, 18468(%rbx)
	orl	%r12d, 18464(%rbx)
	cmpl	$24, %eax
	jle	.L3280
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
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
.L3293:
	.cfi_restore_state
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rbp)
	movzbl	(%rax), %r12d
.L3265:
	cmpl	$255, %r12d
	jne	.L3266
	movq	(%rbx), %rbp
	movq	192(%rbp), %rax
	cmpq	200(%rbp), %rax
	jb	.L3291
	movl	48(%rbp), %edx
	testl	%edx, %edx
	je	.L3266
	movl	52(%rbp), %edx
	movq	40(%rbp), %rdi
	leaq	56(%rbp), %r13
	movq	%r13, %rsi
	call	*16(%rbp)
	movq	192(%rbp), %rdx
	leaq	57(%rbp), %rsi
	subq	208(%rbp), %rdx
	addl	%edx, 184(%rbp)
	testl	%eax, %eax
	jne	.L3271
	vmovq	%rsi, %xmm5
	vpunpcklqdq	%xmm5, %xmm5, %xmm0
	movl	$0, 48(%rbp)
	movb	$0, 56(%rbp)
	vmovdqu	%xmm0, 192(%rbp)
	jmp	.L3266
	.p2align 4,,10
	.p2align 3
.L3291:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rbp)
	movzbl	(%rax), %edx
	movl	%edx, %ecx
.L3269:
	cmpl	$255, %edx
	jne	.L3272
	movq	(%rbx), %rbp
	movq	192(%rbp), %rax
	cmpq	200(%rbp), %rax
	jb	.L3291
	movl	48(%rbp), %eax
	testl	%eax, %eax
	je	.L3266
	movl	52(%rbp), %edx
	movq	40(%rbp), %rdi
	leaq	56(%rbp), %r13
	movq	%r13, %rsi
	call	*16(%rbp)
	movq	192(%rbp), %rdx
	leaq	57(%rbp), %rsi
	subq	208(%rbp), %rdx
	addl	%edx, 184(%rbp)
	testl	%eax, %eax
	jne	.L3276
	vmovq	%rsi, %xmm3
	vpunpcklqdq	%xmm3, %xmm3, %xmm0
	movl	$0, 48(%rbp)
	movb	$0, 56(%rbp)
	vmovdqu	%xmm0, 192(%rbp)
	jmp	.L3266
	.p2align 4,,10
	.p2align 3
.L3294:
	movl	52(%rbp), %edx
	movq	40(%rbp), %rdi
	leaq	56(%rbp), %r13
	movq	%r13, %rsi
	call	*16(%rbp)
	movq	192(%rbp), %rdx
	subq	208(%rbp), %rdx
	addl	%edx, 184(%rbp)
	leaq	57(%rbp), %rdx
	testl	%eax, %eax
	jne	.L3267
	vmovq	%rdx, %xmm1
	vpunpcklqdq	%xmm1, %xmm1, %xmm0
	movl	$0, 48(%rbp)
	movb	$0, 56(%rbp)
	vmovdqu	%xmm0, 192(%rbp)
	jmp	.L3266
	.p2align 4,,10
	.p2align 3
.L3267:
	cltq
	addq	%rax, %r13
	vmovq	%rdx, %xmm2
	vpinsrq	$1, %r13, %xmm2, %xmm0
	movzbl	56(%rbp), %r12d
	vmovdqu	%xmm0, 192(%rbp)
	jmp	.L3265
	.p2align 4,,10
	.p2align 3
.L3276:
	cltq
	movzbl	56(%rbp), %edx
	addq	%rax, %r13
	vmovq	%rsi, %xmm4
	vpinsrq	$1, %r13, %xmm4, %xmm0
	movl	%edx, %ecx
	vmovdqu	%xmm0, 192(%rbp)
	jmp	.L3269
.L3271:
	cltq
	movzbl	56(%rbp), %edx
	addq	%rax, %r13
	vmovq	%rsi, %xmm6
	vpinsrq	$1, %r13, %xmm6, %xmm0
	movl	%edx, %ecx
	vmovdqu	%xmm0, 192(%rbp)
	jmp	.L3269
.L3272:
	testl	%edx, %edx
	je	.L3266
	movb	%cl, 18472(%rbx)
	movl	$1, 18476(%rbx)
	jmp	.L3289
	.cfi_endproc
.LFE642:
	.size	stbi__grow_buffer_unsafe, .-stbi__grow_buffer_unsafe
	.section	.rodata.str1.8
	.align 8
.LC238:
	.string	"(((j->code_buffer) >> (32 - h->size[c])) & stbi__bmask[h->size[c]]) == h->code[c]"
	.text
	.p2align 4
	.type	stbi__jpeg_huff_decode, @function
stbi__jpeg_huff_decode:
.LFB643:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rsi, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movl	18468(%rdi), %eax
	cmpl	$15, %eax
	jle	.L3311
.L3296:
	movl	18464(%rbp), %edx
	movl	%edx, %ecx
	shrl	$23, %ecx
	movzbl	(%rbx,%rcx), %ecx
	cmpl	$255, %ecx
	je	.L3297
	movzbl	1280(%rbx,%rcx), %esi
	cmpl	%eax, %esi
	jg	.L3309
	subl	%esi, %eax
	movl	%eax, 18468(%rbp)
	shlx	%esi, %edx, %edx
	movl	%edx, 18464(%rbp)
	movzbl	1024(%rbx,%rcx), %eax
.L3295:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L3297:
	.cfi_restore_state
	movl	%edx, %ecx
	shrl	$16, %ecx
	cmpl	1580(%rbx), %ecx
	jb	.L3302
	cmpl	1584(%rbx), %ecx
	jb	.L3303
	cmpl	1588(%rbx), %ecx
	jb	.L3304
	cmpl	1592(%rbx), %ecx
	jb	.L3305
	cmpl	1596(%rbx), %ecx
	jb	.L3306
	cmpl	1600(%rbx), %ecx
	jb	.L3307
	cmpl	1604(%rbx), %ecx
	jb	.L3308
	subl	$16, %eax
	movl	%eax, 18468(%rbp)
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	movl	$-1, %eax
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L3311:
	.cfi_restore_state
	call	stbi__grow_buffer_unsafe
	movl	18468(%rbp), %eax
	jmp	.L3296
	.p2align 4,,10
	.p2align 3
.L3305:
	movl	$13, %edi
	.p2align 4,,10
	.p2align 3
.L3299:
	cmpl	%eax, %edi
	jg	.L3309
	movl	$32, %esi
	movl	%esi, %ecx
	movslq	%edi, %r8
	leaq	stbi__bmask(%rip), %r9
	subl	%edi, %ecx
	shrx	%ecx, %edx, %ecx
	andl	(%r9,%r8,4), %ecx
	addl	1612(%rbx,%r8,4), %ecx
	movslq	%ecx, %rcx
	movzbl	1280(%rbx,%rcx), %r8d
	subl	%r8d, %esi
	shrx	%esi, %edx, %esi
	andl	(%r9,%r8,4), %esi
	movzwl	512(%rbx,%rcx,2), %r8d
	cmpl	%r8d, %esi
	jne	.L3312
	subl	%edi, %eax
	movl	%eax, 18468(%rbp)
	shlx	%edi, %edx, %edx
	movl	%edx, 18464(%rbp)
	movzbl	1024(%rbx,%rcx), %eax
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L3302:
	.cfi_restore_state
	movl	$10, %edi
	jmp	.L3299
	.p2align 4,,10
	.p2align 3
.L3303:
	movl	$11, %edi
	jmp	.L3299
	.p2align 4,,10
	.p2align 3
.L3304:
	movl	$12, %edi
	jmp	.L3299
.L3306:
	movl	$14, %edi
	jmp	.L3299
.L3307:
	movl	$15, %edi
	jmp	.L3299
.L3308:
	movl	$16, %edi
	jmp	.L3299
.L3309:
	movl	$-1, %eax
	jmp	.L3295
.L3312:
	leaq	__PRETTY_FUNCTION__.35(%rip), %rcx
	movl	$2115, %edx
	leaq	.LC21(%rip), %rsi
	leaq	.LC238(%rip), %rdi
	call	__assert_fail@PLT
	.cfi_endproc
.LFE643:
	.size	stbi__jpeg_huff_decode, .-stbi__jpeg_huff_decode
	.section	.rodata.str1.1
.LC239:
	.string	"can't merge dc and ac"
	.text
	.p2align 4
	.type	stbi__jpeg_decode_block_prog_dc, @function
stbi__jpeg_decode_block_prog_dc:
.LFB648:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	movl	18488(%rdi), %r8d
	testl	%r8d, %r8d
	jne	.L3318
	cmpl	$15, 18468(%rdi)
	movq	%rdi, %rbx
	movq	%rsi, %rbp
	movq	%rdx, %r12
	movl	%ecx, %r13d
	jle	.L3327
	movl	18492(%rbx), %eax
	testl	%eax, %eax
	je	.L3328
.L3317:
	movl	18468(%rbx), %eax
	testl	%eax, %eax
	jle	.L3329
.L3321:
	movl	18464(%rbx), %edx
	decl	%eax
	leal	(%rdx,%rdx), %ecx
	movl	%eax, 18468(%rbx)
	movl	%ecx, 18464(%rbx)
	movl	$1, %eax
	testl	%edx, %edx
	jns	.L3313
	movl	18496(%rbx), %edx
	shlx	%edx, %eax, %edx
	addw	%dx, 0(%rbp)
.L3313:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
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
.L3328:
	.cfi_restore_state
	vpxor	%xmm0, %xmm0, %xmm0
	movq	%r12, %rsi
	vmovdqu	%xmm0, 0(%rbp)
	vmovdqu	%xmm0, 16(%rbp)
	vmovdqu	%xmm0, 32(%rbp)
	vmovdqu	%xmm0, 48(%rbp)
	vmovdqu	%xmm0, 64(%rbp)
	vmovdqu	%xmm0, 80(%rbp)
	vmovdqu	%xmm0, 96(%rbp)
	vmovdqu	%xmm0, 112(%rbp)
	movq	%rbx, %rdi
	call	stbi__jpeg_huff_decode
	movl	%eax, %r12d
	cmpl	$15, %eax
	ja	.L3318
	testl	%eax, %eax
	jne	.L3330
.L3319:
	movslq	%r13d, %rcx
	leaq	(%rcx,%rcx,2), %rax
	salq	$5, %rax
	addq	%rbx, %rax
	addl	18104(%rax), %r12d
	movl	18496(%rbx), %edx
	movl	%r12d, 18104(%rax)
	movl	$1, %eax
	shlx	%edx, %eax, %eax
	imull	%r12d, %eax
	movw	%ax, 0(%rbp)
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	movl	$1, %eax
	popq	%rbx
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
.L3327:
	.cfi_restore_state
	call	stbi__grow_buffer_unsafe
	movl	18492(%rbx), %eax
	testl	%eax, %eax
	jne	.L3317
	jmp	.L3328
	.p2align 4,,10
	.p2align 3
.L3318:
	leaq	.LC239(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	xorl	%eax, %eax
	popq	%rbx
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
.L3329:
	.cfi_restore_state
	movq	%rbx, %rdi
	call	stbi__grow_buffer_unsafe
	movl	18468(%rbx), %eax
	jmp	.L3321
	.p2align 4,,10
	.p2align 3
.L3330:
	movl	18468(%rbx), %edx
	cmpl	%edx, %eax
	jg	.L3331
.L3320:
	movl	18464(%rbx), %eax
	movl	%r12d, %ecx
	movl	%eax, %esi
	roll	%cl, %esi
	movl	%esi, %ecx
	movslq	%r12d, %rdi
	leaq	stbi__bmask(%rip), %rsi
	subl	%r12d, %edx
	movl	(%rsi,%rdi,4), %esi
	shrl	$31, %eax
	movl	%edx, 18468(%rbx)
	decl	%eax
	leaq	stbi__jbias(%rip), %rdx
	andn	%ecx, %esi, %r8d
	andl	(%rdx,%rdi,4), %eax
	andl	%esi, %ecx
	movl	%r8d, 18464(%rbx)
	leal	(%rax,%rcx), %r12d
	jmp	.L3319
	.p2align 4,,10
	.p2align 3
.L3331:
	movq	%rbx, %rdi
	call	stbi__grow_buffer_unsafe
	movl	18468(%rbx), %edx
	jmp	.L3320
	.cfi_endproc
.LFE648:
	.size	stbi__jpeg_decode_block_prog_dc, .-stbi__jpeg_decode_block_prog_dc
	.p2align 4
	.type	stbi__jpeg_decode_block, @function
stbi__jpeg_decode_block:
.LFB647:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movq	%rdx, %r15
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movslq	%r9d, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%r8, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rsi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	cmpl	$15, 18468(%rdi)
	movq	%rcx, (%rsp)
	movq	80(%rsp), %r13
	jle	.L3348
.L3333:
	movq	%r15, %rsi
	movq	%rbx, %rdi
	call	stbi__jpeg_huff_decode
	movl	%eax, %ecx
	cmpl	$15, %eax
	jbe	.L3334
.L3342:
	leaq	.LC227(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	xorl	%eax, %eax
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
	ret
	.p2align 4,,10
	.p2align 3
.L3334:
	.cfi_restore_state
	vpxor	%xmm0, %xmm0, %xmm0
	vmovdqa	%xmm0, 0(%rbp)
	vmovdqa	%xmm0, 16(%rbp)
	vmovdqa	%xmm0, 32(%rbp)
	vmovdqa	%xmm0, 48(%rbp)
	vmovdqa	%xmm0, 64(%rbp)
	vmovdqa	%xmm0, 80(%rbp)
	vmovdqa	%xmm0, 96(%rbp)
	vmovdqa	%xmm0, 112(%rbp)
	movl	18468(%rbx), %eax
	testl	%ecx, %ecx
	jne	.L3336
.L3337:
	leaq	(%r14,%r14,2), %rdx
	salq	$5, %rdx
	addq	%rbx, %rdx
	addl	18104(%rdx), %ecx
	movl	%ecx, 18104(%rdx)
	imulw	0(%r13), %cx
	movl	$1, %r15d
	leaq	stbi__jpeg_dezigzag(%rip), %r14
	movw	%cx, 0(%rbp)
	jmp	.L3346
	.p2align 4,,10
	.p2align 3
.L3339:
	movl	18464(%rbx), %esi
	movl	%esi, %eax
	shrl	$23, %eax
	movswl	(%r12,%rax,2), %edx
	movl	%edx, %ecx
	testl	%edx, %edx
	je	.L3340
	movl	%edx, %eax
	sarl	$4, %eax
	andl	$15, %eax
	addl	%r15d, %eax
	leal	1(%rax), %r15d
	cltq
	movzbl	(%r14,%rax), %eax
	sarl	$8, %edx
	imulw	0(%r13,%rax,2), %dx
	andl	$15, %ecx
	subl	%ecx, 18468(%rbx)
	shlx	%ecx, %esi, %esi
	movl	%esi, 18464(%rbx)
	movw	%dx, 0(%rbp,%rax,2)
.L3341:
	cmpl	$63, %r15d
	jg	.L3344
.L3349:
	movl	18468(%rbx), %eax
.L3346:
	cmpl	$15, %eax
	jg	.L3339
	movq	%rbx, %rdi
	call	stbi__grow_buffer_unsafe
	jmp	.L3339
	.p2align 4,,10
	.p2align 3
.L3340:
	movq	(%rsp), %rsi
	movq	%rbx, %rdi
	call	stbi__jpeg_huff_decode
	testl	%eax, %eax
	js	.L3342
	movl	%eax, %ecx
	andl	$15, %ecx
	jne	.L3343
	cmpl	$240, %eax
	jne	.L3344
	addl	$16, %r15d
	cmpl	$63, %r15d
	jle	.L3349
.L3344:
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
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
	movl	$1, %eax
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L3343:
	.cfi_restore_state
	sarl	$4, %eax
	addl	%r15d, %eax
	movl	18468(%rbx), %r10d
	leal	1(%rax), %r15d
	cltq
	movzbl	(%r14,%rax), %edx
	cmpl	%r10d, %ecx
	jg	.L3350
.L3345:
	movl	18464(%rbx), %eax
	movslq	%ecx, %r9
	leaq	stbi__bmask(%rip), %rdi
	movl	(%rdi,%r9,4), %r8d
	movl	%eax, %esi
	shrl	$31, %eax
	roll	%cl, %esi
	decl	%eax
	leaq	stbi__jbias(%rip), %rdi
	andn	%esi, %r8d, %r11d
	andl	(%rdi,%r9,4), %eax
	andl	%r8d, %esi
	addl	%esi, %eax
	imulw	0(%r13,%rdx,2), %ax
	subl	%ecx, %r10d
	movl	%r11d, 18464(%rbx)
	movl	%r10d, 18468(%rbx)
	movw	%ax, 0(%rbp,%rdx,2)
	jmp	.L3341
	.p2align 4,,10
	.p2align 3
.L3348:
	call	stbi__grow_buffer_unsafe
	jmp	.L3333
	.p2align 4,,10
	.p2align 3
.L3350:
	movq	%rbx, %rdi
	movb	%dl, 15(%rsp)
	movl	%ecx, 8(%rsp)
	call	stbi__grow_buffer_unsafe
	movl	18468(%rbx), %r10d
	movzbl	15(%rsp), %edx
	movl	8(%rsp), %ecx
	jmp	.L3345
	.p2align 4,,10
	.p2align 3
.L3336:
	cmpl	%eax, %ecx
	jg	.L3351
.L3338:
	movl	18464(%rbx), %edx
	movslq	%ecx, %r8
	leaq	stbi__bmask(%rip), %rdi
	movl	(%rdi,%r8,4), %edi
	movl	%edx, %esi
	shrl	$31, %edx
	roll	%cl, %esi
	subl	%ecx, %eax
	decl	%edx
	leaq	stbi__jbias(%rip), %rcx
	andn	%esi, %edi, %r9d
	andl	(%rcx,%r8,4), %edx
	andl	%edi, %esi
	movl	%r9d, 18464(%rbx)
	movl	%eax, 18468(%rbx)
	leal	(%rdx,%rsi), %ecx
	jmp	.L3337
.L3351:
	movq	%rbx, %rdi
	movl	%ecx, 8(%rsp)
	call	stbi__grow_buffer_unsafe
	movl	18468(%rbx), %eax
	movl	8(%rsp), %ecx
	jmp	.L3338
	.cfi_endproc
.LFE647:
	.size	stbi__jpeg_decode_block, .-stbi__jpeg_decode_block
	.p2align 4
	.type	stbiw__jpg_processDU.constprop.0, @function
stbiw__jpg_processDU.constprop.0:
.LFB886:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movq	%rcx, %r11
	movq	%rdi, %r15
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rcx, %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	leaq	512(%rcx), %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%r9, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rcx, %rbx
	subq	$360, %rsp
	.cfi_def_cfa_offset 416
	movq	%rsi, (%rsp)
	movq	%rdx, 16(%rsp)
	movq	%fs:40, %rdx
	movq	%rdx, 344(%rsp)
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L3353:
	leaq	28(%rbx), %rax
	pushq	%rax
	.cfi_def_cfa_offset 424
	leaq	24(%rbx), %rax
	leaq	12(%rbx), %rcx
	pushq	%rax
	.cfi_def_cfa_offset 432
	leaq	8(%rbx), %rdx
	leaq	4(%rbx), %rsi
	leaq	20(%rbx), %r9
	leaq	16(%rbx), %r8
	movq	%rbx, %rdi
	call	stbiw__jpg_DCT
	addq	$64, %rbx
	popq	%r10
	.cfi_def_cfa_offset 424
	popq	%r14
	.cfi_def_cfa_offset 416
	cmpq	%rbx, %r12
	jne	.L3353
	leaq	32(%r11), %rbx
	.p2align 4,,10
	.p2align 3
.L3354:
	leaq	448(%r11), %rax
	pushq	%rax
	.cfi_def_cfa_offset 424
	leaq	384(%r11), %rax
	leaq	320(%r11), %r9
	pushq	%rax
	.cfi_def_cfa_offset 432
	leaq	256(%r11), %r8
	leaq	192(%r11), %rcx
	leaq	128(%r11), %rdx
	leaq	64(%r11), %rsi
	movq	%r11, %rdi
	call	stbiw__jpg_DCT
	addq	$4, %r11
	popq	%r8
	.cfi_def_cfa_offset 424
	popq	%r9
	.cfi_def_cfa_offset 416
	cmpq	%r11, %rbx
	jne	.L3354
	leaq	stbiw__jpg_ZigZag(%rip), %rdx
	vmovss	.LC240(%rip), %xmm1
	leaq	64(%rdx), %rcx
	vxorps	%xmm0, %xmm0, %xmm0
	.p2align 4,,10
	.p2align 3
.L3372:
	vmovss	0(%rbp), %xmm2
	vmulss	0(%r13), %xmm2, %xmm2
	vcomiss	%xmm2, %xmm0
	ja	.L3355
	vaddss	%xmm1, %xmm2, %xmm2
	vcvttss2sil	%xmm2, %esi
.L3356:
	vmovss	4(%r13), %xmm2
	movzbl	(%rdx), %eax
	vmulss	4(%rbp), %xmm2, %xmm2
	movl	%esi, 80(%rsp,%rax,4)
	vcomiss	%xmm2, %xmm0
	ja	.L3357
	vaddss	%xmm1, %xmm2, %xmm2
	vcvttss2sil	%xmm2, %esi
.L3358:
	vmovss	8(%r13), %xmm2
	movzbl	1(%rdx), %eax
	vmulss	8(%rbp), %xmm2, %xmm2
	movl	%esi, 80(%rsp,%rax,4)
	vcomiss	%xmm2, %xmm0
	ja	.L3359
	vaddss	%xmm1, %xmm2, %xmm2
	vcvttss2sil	%xmm2, %esi
.L3360:
	vmovss	12(%r13), %xmm2
	movzbl	2(%rdx), %eax
	vmulss	12(%rbp), %xmm2, %xmm2
	movl	%esi, 80(%rsp,%rax,4)
	vcomiss	%xmm2, %xmm0
	ja	.L3361
	vaddss	%xmm1, %xmm2, %xmm2
	vcvttss2sil	%xmm2, %esi
.L3362:
	vmovss	16(%r13), %xmm2
	movzbl	3(%rdx), %eax
	vmulss	16(%rbp), %xmm2, %xmm2
	movl	%esi, 80(%rsp,%rax,4)
	vcomiss	%xmm2, %xmm0
	ja	.L3363
	vaddss	%xmm1, %xmm2, %xmm2
	vcvttss2sil	%xmm2, %esi
.L3364:
	vmovss	20(%r13), %xmm2
	movzbl	4(%rdx), %eax
	vmulss	20(%rbp), %xmm2, %xmm2
	movl	%esi, 80(%rsp,%rax,4)
	vcomiss	%xmm2, %xmm0
	ja	.L3365
	vaddss	%xmm1, %xmm2, %xmm2
	vcvttss2sil	%xmm2, %esi
.L3366:
	vmovss	24(%r13), %xmm2
	movzbl	5(%rdx), %eax
	vmulss	24(%rbp), %xmm2, %xmm2
	movl	%esi, 80(%rsp,%rax,4)
	vcomiss	%xmm2, %xmm0
	ja	.L3367
	vaddss	%xmm1, %xmm2, %xmm2
	vcvttss2sil	%xmm2, %esi
.L3368:
	vmovss	28(%r13), %xmm2
	movzbl	6(%rdx), %eax
	vmulss	28(%rbp), %xmm2, %xmm2
	movl	%esi, 80(%rsp,%rax,4)
	movzbl	7(%rdx), %eax
	vcomiss	%xmm2, %xmm0
	ja	.L3369
	vaddss	%xmm1, %xmm2, %xmm2
	addq	$8, %rdx
	addq	$64, %r13
	vcvttss2sil	%xmm2, %esi
	addq	$32, %rbp
	movl	%esi, 80(%rsp,%rax,4)
	cmpq	%rcx, %rdx
	jne	.L3372
.L3371:
	movq	(%rsp), %rcx
	movl	80(%rsp), %eax
	movl	(%rcx), %r13d
	movq	16(%rsp), %rcx
	movl	%eax, 60(%rsp)
	subl	416(%rsp), %eax
	movl	(%rcx), %r12d
	movl	%eax, %edi
	je	.L3453
	movl	%eax, %edx
	negl	%edx
	cmovs	%eax, %edx
	cmpl	$-2147483648, %eax
	adcl	$-1, %edi
	sarl	%edx
	je	.L3423
	movl	$2, %ecx
	.p2align 4,,10
	.p2align 3
.L3380:
	movl	%ecx, %esi
	incl	%ecx
	sarl	%edx
	jne	.L3380
	movzwl	%si, %eax
	movl	%eax, 12(%rsp)
	movl	$1, %ebp
	movzwl	%si, %edx
	shlx	%esi, %ebp, %ebp
	salq	$2, %rdx
	decl	%ebp
.L3379:
	leaq	YDC_HT.4(%rip), %rcx
	addq	%rcx, %rdx
	movzwl	2(%rdx), %r14d
	andl	%edi, %ebp
	addl	%r12d, %r14d
	movzwl	(%rdx), %r12d
	movl	$24, %edx
	subl	%r14d, %edx
	shlx	%edx, %r12d, %r12d
	movw	%bp, 8(%rsp)
	orl	%r13d, %r12d
	cmpl	$7, %r14d
	jle	.L3381
	movl	%r14d, %r13d
	leaq	79(%rsp), %rbx
	.p2align 4,,10
	.p2align 3
.L3383:
	movl	%r12d, %ebp
	sarl	$16, %ebp
	movb	%bpl, 79(%rsp)
	movq	8(%r15), %rdi
	movl	$1, %edx
	movq	%rbx, %rsi
	call	*(%r15)
	cmpb	$-1, %bpl
	jne	.L3382
	movb	$0, 79(%rsp)
	movq	8(%r15), %rdi
	movl	$1, %edx
	movq	%rbx, %rsi
	call	*(%r15)
.L3382:
	subl	$8, %r13d
	sall	$8, %r12d
	cmpl	$7, %r13d
	jg	.L3383
	andl	$7, %r14d
.L3381:
	movq	(%rsp), %rcx
	movq	16(%rsp), %rax
	movl	%r12d, (%rcx)
	movl	%r14d, (%rax)
	movl	12(%rsp), %eax
	movzwl	8(%rsp), %ebp
	addl	%r14d, %eax
	movl	$24, %edx
	subl	%eax, %edx
	shlx	%edx, %ebp, %ebp
	movl	%eax, 12(%rsp)
	orl	(%rcx), %ebp
	cmpl	$7, %eax
	jle	.L3384
	movl	%eax, %r12d
	leaq	79(%rsp), %rbx
	.p2align 4,,10
	.p2align 3
.L3386:
	movl	%ebp, %r13d
	sarl	$16, %r13d
	movb	%r13b, 79(%rsp)
	movq	8(%r15), %rdi
	movl	$1, %edx
	movq	%rbx, %rsi
	call	*(%r15)
	cmpb	$-1, %r13b
	jne	.L3385
	movb	$0, 79(%rsp)
	movq	8(%r15), %rdi
	movl	$1, %edx
	movq	%rbx, %rsi
	call	*(%r15)
.L3385:
	subl	$8, %r12d
	sall	$8, %ebp
	cmpl	$7, %r12d
	jg	.L3386
	andl	$7, 12(%rsp)
.L3384:
	movq	(%rsp), %rax
	movl	12(%rsp), %ecx
	movl	%ebp, (%rax)
	movq	16(%rsp), %rax
	movl	%ecx, (%rax)
.L3377:
	leaq	80(%rsp), %rax
	movq	%rax, 40(%rsp)
	movl	$63, %edx
	jmp	.L3387
	.p2align 4,,10
	.p2align 3
.L3389:
	decq	%rdx
	je	.L3388
.L3387:
	movl	(%rax,%rdx,4), %edi
	testl	%edi, %edi
	je	.L3389
	movl	%edx, 32(%rsp)
	movl	%edx, 52(%rsp)
	movl	$1, %esi
	.p2align 4,,10
	.p2align 3
.L3390:
	movslq	%esi, %rdx
	movl	80(%rsp,%rdx,4), %r12d
	testl	%r12d, %r12d
	jne	.L3415
	cmpl	%esi, 32(%rsp)
	jl	.L3454
	movl	52(%rsp), %edi
	leal	2(%rsi), %ecx
	leal	1(%rsi), %edx
	movslq	%ecx, %rcx
	subl	%esi, %edi
	movq	40(%rsp), %rax
	movslq	%edx, %rdx
	addq	%rdi, %rcx
	jmp	.L3395
	.p2align 4,,10
	.p2align 3
.L3456:
	incq	%rdx
	cmpq	%rdx, %rcx
	je	.L3455
.L3395:
	movl	(%rax,%rdx,4), %r12d
	movl	%edx, %edi
	testl	%r12d, %r12d
	je	.L3456
	movl	%edx, %eax
	movl	%r12d, %r13d
	subl	%esi, %eax
	negl	%r13d
	cmovs	%r12d, %r13d
	movl	%edx, 28(%rsp)
	sarl	%r13d
	movl	%eax, 36(%rsp)
	movl	%r13d, 48(%rsp)
	cmpl	$15, %eax
	jg	.L3397
	sall	$4, %eax
	movl	%eax, %ecx
.L3398:
	movl	48(%rsp), %eax
	leal	-1(%r12), %esi
	testl	%r12d, %r12d
	cmovns	%r12d, %esi
	testl	%eax, %eax
	je	.L3405
	movl	$2, %edx
	.p2align 4,,10
	.p2align 3
.L3406:
	movl	%edx, %r14d
	incl	%edx
	sarl	%eax
	jne	.L3406
	movzwl	%r14w, %eax
	movl	$1, %r12d
	leal	(%rcx,%rax), %edx
	shlx	%eax, %r12d, %r12d
	movl	%eax, 24(%rsp)
	decl	%r12d
	movslq	%edx, %rdx
	andl	%esi, %r12d
	salq	$2, %rdx
	movzwl	%r12w, %r12d
.L3407:
	leaq	YAC_HT.3(%rip), %rax
	addq	%rax, %rdx
	movzwl	2(%rdx), %ecx
	movl	12(%rsp), %eax
	movzwl	(%rdx), %ebx
	addl	%ecx, %eax
	movl	$24, %edx
	movq	(%rsp), %rcx
	subl	%eax, %edx
	shlx	%edx, %ebx, %ebx
	movl	%eax, 8(%rsp)
	orl	(%rcx), %ebx
	cmpl	$7, %eax
	jle	.L3408
	movl	%eax, %ebp
	leaq	79(%rsp), %r13
	.p2align 4,,10
	.p2align 3
.L3410:
	movl	%ebx, %r14d
	sarl	$16, %r14d
	movb	%r14b, 79(%rsp)
	movq	8(%r15), %rdi
	movl	$1, %edx
	movq	%r13, %rsi
	call	*(%r15)
	cmpb	$-1, %r14b
	jne	.L3409
	movb	$0, 79(%rsp)
	movq	8(%r15), %rdi
	movl	$1, %edx
	movq	%r13, %rsi
	call	*(%r15)
.L3409:
	subl	$8, %ebp
	sall	$8, %ebx
	cmpl	$7, %ebp
	jg	.L3410
	andl	$7, 8(%rsp)
.L3408:
	movq	(%rsp), %rcx
	movl	8(%rsp), %eax
	movq	16(%rsp), %rsi
	movl	%ebx, (%rcx)
	movl	%eax, (%rsi)
	movl	$24, %ebx
	addl	24(%rsp), %eax
	subl	%eax, %ebx
	shlx	%ebx, %r12d, %ebx
	movl	%eax, 12(%rsp)
	orl	(%rcx), %ebx
	cmpl	$7, %eax
	jle	.L3411
	movl	%eax, %ebp
	leaq	79(%rsp), %r13
	.p2align 4,,10
	.p2align 3
.L3413:
	movl	%ebx, %r12d
	sarl	$16, %r12d
	movb	%r12b, 79(%rsp)
	movq	8(%r15), %rdi
	movl	$1, %edx
	movq	%r13, %rsi
	call	*(%r15)
	cmpb	$-1, %r12b
	jne	.L3412
	movb	$0, 79(%rsp)
	movq	8(%r15), %rdi
	movl	$1, %edx
	movq	%r13, %rsi
	call	*(%r15)
.L3412:
	subl	$8, %ebp
	sall	$8, %ebx
	cmpl	$7, %ebp
	jg	.L3413
	andl	$7, 12(%rsp)
.L3411:
	movq	(%rsp), %rax
	movl	28(%rsp), %esi
	movl	%ebx, (%rax)
	movl	12(%rsp), %ecx
	movq	16(%rsp), %rax
	incl	%esi
	movl	%ecx, (%rax)
	cmpl	32(%rsp), %esi
	jle	.L3390
	cmpl	$63, 32(%rsp)
	jne	.L3457
.L3352:
	movq	344(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L3458
	movl	60(%rsp), %eax
	addq	$360, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
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
	ret
	.p2align 4,,10
	.p2align 3
.L3369:
	.cfi_restore_state
	vsubss	%xmm1, %xmm2, %xmm2
	addq	$8, %rdx
	addq	$64, %r13
	vcvttss2sil	%xmm2, %esi
	addq	$32, %rbp
	movl	%esi, 80(%rsp,%rax,4)
	cmpq	%rdx, %rcx
	jne	.L3372
	jmp	.L3371
	.p2align 4,,10
	.p2align 3
.L3367:
	vsubss	%xmm1, %xmm2, %xmm2
	vcvttss2sil	%xmm2, %esi
	jmp	.L3368
	.p2align 4,,10
	.p2align 3
.L3365:
	vsubss	%xmm1, %xmm2, %xmm2
	vcvttss2sil	%xmm2, %esi
	jmp	.L3366
	.p2align 4,,10
	.p2align 3
.L3363:
	vsubss	%xmm1, %xmm2, %xmm2
	vcvttss2sil	%xmm2, %esi
	jmp	.L3364
	.p2align 4,,10
	.p2align 3
.L3361:
	vsubss	%xmm1, %xmm2, %xmm2
	vcvttss2sil	%xmm2, %esi
	jmp	.L3362
	.p2align 4,,10
	.p2align 3
.L3359:
	vsubss	%xmm1, %xmm2, %xmm2
	vcvttss2sil	%xmm2, %esi
	jmp	.L3360
	.p2align 4,,10
	.p2align 3
.L3357:
	vsubss	%xmm1, %xmm2, %xmm2
	vcvttss2sil	%xmm2, %esi
	jmp	.L3358
	.p2align 4,,10
	.p2align 3
.L3355:
	vsubss	%xmm1, %xmm2, %xmm2
	vcvttss2sil	%xmm2, %esi
	jmp	.L3356
	.p2align 4,,10
	.p2align 3
.L3455:
	movl	%edi, %eax
	subl	%esi, %eax
	movl	%edi, 28(%rsp)
	movl	%eax, 36(%rsp)
	cmpl	$15, %eax
	jg	.L3459
	movl	%eax, %ecx
	sall	$4, %ecx
	xorl	%esi, %esi
.L3405:
	leal	1(%rcx), %edx
	movslq	%edx, %rdx
	movl	%esi, %r12d
	movl	$1, 24(%rsp)
	salq	$2, %rdx
	andl	$1, %r12d
	jmp	.L3407
.L3459:
	movl	$0, 48(%rsp)
.L3397:
	movl	36(%rsp), %edx
	movl	$1, 8(%rsp)
	sarl	$4, %edx
	leal	1(%rdx), %eax
	movl	%eax, 24(%rsp)
	movl	%r12d, 56(%rsp)
	movl	12(%rsp), %r13d
	.p2align 4,,10
	.p2align 3
.L3402:
	leal	11(%r13), %ebp
	movl	$24, %eax
	subl	%ebp, %eax
	movl	$2041, %ebx
	shlx	%eax, %ebx, %ebx
	movq	(%rsp), %rax
	orl	(%rax), %ebx
	cmpl	$7, %ebp
	jle	.L3424
	leaq	79(%rsp), %r12
	.p2align 4,,10
	.p2align 3
.L3401:
	movl	%ebx, %r14d
	sarl	$16, %r14d
	movb	%r14b, 79(%rsp)
	movq	8(%r15), %rdi
	movl	$1, %edx
	movq	%r12, %rsi
	call	*(%r15)
	cmpb	$-1, %r14b
	jne	.L3400
	movb	$0, 79(%rsp)
	movq	8(%r15), %rdi
	movl	$1, %edx
	movq	%r12, %rsi
	call	*(%r15)
.L3400:
	subl	$8, %ebp
	sall	$8, %ebx
	cmpl	$7, %ebp
	jg	.L3401
	addl	$3, %r13d
	andl	$7, %r13d
.L3399:
	movq	(%rsp), %rax
	incl	8(%rsp)
	movl	%ebx, (%rax)
	movq	16(%rsp), %rax
	movl	%r13d, (%rax)
	movl	8(%rsp), %eax
	cmpl	24(%rsp), %eax
	jne	.L3402
	movl	36(%rsp), %ecx
	movl	%r13d, 12(%rsp)
	sall	$4, %ecx
	movl	56(%rsp), %r12d
	movzbl	%cl, %ecx
	jmp	.L3398
	.p2align 4,,10
	.p2align 3
.L3424:
	movl	%ebp, %r13d
	jmp	.L3399
.L3457:
	movq	(%rsp), %rax
	leal	4(%rcx), %r12d
	movl	$24, %edx
	subl	%r12d, %edx
	movl	$10, %ebp
	shlx	%edx, %ebp, %ebp
	orl	(%rax), %ebp
	cmpl	$7, %r12d
	jle	.L3417
	leaq	79(%rsp), %rbx
	.p2align 4,,10
	.p2align 3
.L3419:
	movl	%ebp, %r13d
	sarl	$16, %r13d
	movb	%r13b, 79(%rsp)
	movq	8(%r15), %rdi
	movl	$1, %edx
	movq	%rbx, %rsi
	call	*(%r15)
	cmpb	$-1, %r13b
	jne	.L3418
	movb	$0, 79(%rsp)
	movq	8(%r15), %rdi
	movl	$1, %edx
	movq	%rbx, %rsi
	call	*(%r15)
.L3418:
	subl	$8, %r12d
	sall	$8, %ebp
	cmpl	$7, %r12d
	jg	.L3419
	movl	12(%rsp), %r12d
	subl	$4, %r12d
	andl	$7, %r12d
.L3417:
	movq	(%rsp), %rax
	movl	%ebp, (%rax)
	movq	16(%rsp), %rax
	movl	%r12d, (%rax)
	jmp	.L3352
.L3415:
	movl	%r12d, %r13d
	negl	%r13d
	cmovs	%r12d, %r13d
	movl	%esi, 28(%rsp)
	sarl	%r13d
	movl	%r13d, 48(%rsp)
	xorl	%ecx, %ecx
	jmp	.L3398
.L3454:
	movl	%esi, 28(%rsp)
	movl	$1, 24(%rsp)
	movl	$4, %edx
	jmp	.L3407
.L3453:
	leal	2(%r12), %ebp
	movl	%ebp, 12(%rsp)
	cmpl	$7, %ebp
	jle	.L3374
	leaq	79(%rsp), %rbx
	.p2align 4,,10
	.p2align 3
.L3376:
	movl	%r13d, %r14d
	sarl	$16, %r14d
	movb	%r14b, 79(%rsp)
	movq	8(%r15), %rdi
	movl	$1, %edx
	movq	%rbx, %rsi
	call	*(%r15)
	cmpb	$-1, %r14b
	jne	.L3375
	movb	$0, 79(%rsp)
	movq	8(%r15), %rdi
	movl	$1, %edx
	movq	%rbx, %rsi
	call	*(%r15)
.L3375:
	subl	$8, %ebp
	sall	$8, %r13d
	cmpl	$7, %ebp
	jg	.L3376
	subl	$6, %r12d
	andl	$7, %r12d
	movl	%r12d, 12(%rsp)
.L3374:
	movq	(%rsp), %rax
	movl	12(%rsp), %ecx
	movl	%r13d, (%rax)
	movq	16(%rsp), %rax
	movl	%ecx, (%rax)
	jmp	.L3377
.L3388:
	movl	12(%rsp), %eax
	movl	$24, %edx
	leal	4(%rax), %ebp
	movq	(%rsp), %rax
	subl	%ebp, %edx
	movl	$10, %r12d
	shlx	%edx, %r12d, %r12d
	leaq	79(%rsp), %rbx
	orl	(%rax), %r12d
	cmpl	$7, %ebp
	jle	.L3420
	.p2align 4,,10
	.p2align 3
.L3392:
	movl	%r12d, %r13d
	sarl	$16, %r13d
	movb	%r13b, 79(%rsp)
	movq	8(%r15), %rdi
	movl	$1, %edx
	movq	%rbx, %rsi
	call	*(%r15)
	cmpb	$-1, %r13b
	jne	.L3391
	movb	$0, 79(%rsp)
	movq	8(%r15), %rdi
	movl	$1, %edx
	movq	%rbx, %rsi
	call	*(%r15)
.L3391:
	subl	$8, %ebp
	sall	$8, %r12d
	cmpl	$7, %ebp
	jg	.L3392
	movl	12(%rsp), %ebp
	subl	$4, %ebp
	andl	$7, %ebp
.L3420:
	movq	(%rsp), %rax
	movl	%r12d, (%rax)
	movq	16(%rsp), %rax
	movl	%ebp, (%rax)
	jmp	.L3352
.L3423:
	movl	$1, 12(%rsp)
	movl	$4, %edx
	movl	$1, %ebp
	jmp	.L3379
.L3458:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE886:
	.size	stbiw__jpg_processDU.constprop.0, .-stbiw__jpg_processDU.constprop.0
	.section	.rodata.str1.1
.LC241:
	.string	"not PSD"
.LC242:
	.string	"wrong version"
.LC243:
	.string	"wrong channel count"
.LC244:
	.string	"unsupported bit depth"
.LC245:
	.string	"wrong color format"
.LC248:
	.string	"corrupt"
	.text
	.p2align 4
	.type	stbi__psd_load, @function
stbi__psd_load:
.LFB737:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdi, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rdx, %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movl	%r8d, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rcx, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%r9, %rbx
	subq	$104, %rsp
	.cfi_def_cfa_offset 160
	movq	%rsi, 8(%rsp)
	call	stbi__get32be
	cmpl	$943870035, %eax
	jne	.L3607
	movq	%r14, %rdi
	call	stbi__get16be
	cmpl	$1, %eax
	jne	.L3608
	cmpq	$0, 16(%r14)
	movq	192(%r14), %rax
	je	.L3464
	movq	200(%r14), %rcx
	movq	%rcx, %rdx
	subq	%rax, %rdx
	cmpl	$5, %edx
	jle	.L3609
.L3464:
	addq	$6, %rax
	movq	%rax, 192(%r14)
.L3465:
	movq	%r14, %rdi
	call	stbi__get16be
	movl	%eax, 20(%rsp)
	cmpl	$16, %eax
	ja	.L3610
	movq	%r14, %rdi
	call	stbi__get32be
	movq	%r14, %rdi
	movl	%eax, 36(%rsp)
	movl	%eax, %r15d
	call	stbi__get32be
	movl	%eax, 16(%rsp)
	cmpl	$16777216, %r15d
	jg	.L3468
	cmpl	$16777216, 16(%rsp)
	jg	.L3468
	movq	%r14, %rdi
	call	stbi__get16be
	movl	%eax, 24(%rsp)
	subl	$8, %eax
	andl	$-9, %eax
	jne	.L3611
	movq	%r14, %rdi
	call	stbi__get16be
	cmpl	$3, %eax
	jne	.L3612
	movq	%r14, %rdi
	call	stbi__get32be
	movl	%eax, %esi
	testl	%eax, %eax
	je	.L3471
	js	.L3613
	movq	%r14, %rdi
	call	stbi__skip.part.0
.L3471:
	movq	%r14, %rdi
	call	stbi__get32be
	movl	%eax, %esi
	testl	%eax, %eax
	je	.L3473
	js	.L3614
	movq	%r14, %rdi
	call	stbi__skip.part.0
.L3473:
	movq	%r14, %rdi
	call	stbi__get32be
	movl	%eax, %esi
	testl	%eax, %eax
	je	.L3475
	js	.L3615
	movq	%r14, %rdi
	call	stbi__skip.part.0
.L3475:
	movq	%r14, %rdi
	call	stbi__get16be
	movl	%eax, %esi
	cmpl	$1, %eax
	jg	.L3616
	movl	36(%rsp), %eax
	movl	16(%rsp), %ecx
	movl	%eax, %edi
	orl	%ecx, %edi
	js	.L3468
	movl	%eax, %edi
	testl	%eax, %eax
	je	.L3478
	movl	$2147483647, %eax
	cltd
	idivl	%edi
	sall	$2, %ecx
	cmpl	%eax, %ecx
	jg	.L3468
.L3478:
	cmpl	$16, 24(%rsp)
	sete	%dl
	cmpl	$16, 160(%rsp)
	sete	%al
	andl	%eax, %edx
	movb	%dl, 48(%rsp)
	testl	%esi, %esi
	jne	.L3479
	testb	%dl, %dl
	jne	.L3617
.L3479:
	movl	36(%rsp), %eax
	movl	%esi, 40(%rsp)
	imull	16(%rsp), %eax
	leal	0(,%rax,4), %edi
	movslq	%edi, %rdi
	movl	%eax, 32(%rsp)
	call	malloc@PLT
	movq	%rax, %r15
	testq	%rax, %rax
	je	.L3481
	movl	40(%rsp), %esi
	testl	%esi, %esi
	je	.L3482
	movl	20(%rsp), %ecx
	imull	36(%rsp), %ecx
	testl	%ecx, %ecx
	je	.L3483
	leal	(%rcx,%rcx), %esi
	movq	%r14, %rdi
	call	stbi__skip.part.0
.L3483:
	movl	32(%rsp), %eax
	movq	$0, 40(%rsp)
	decl	%eax
	movl	%eax, 80(%rsp)
	leaq	4(%r15,%rax,4), %rax
	movq	%rax, 48(%rsp)
	leaq	57(%r14), %rax
	movq	%rax, 24(%rsp)
	movq	%r13, 64(%rsp)
	movq	%rbp, 72(%rsp)
	movl	%r12d, 84(%rsp)
	movq	%rbx, 88(%rsp)
	movq	%r15, 56(%rsp)
	movq	%r14, %r15
.L3486:
	movq	56(%rsp), %r14
	movq	40(%rsp), %rcx
	xorl	%ebx, %ebx
	addq	%rcx, %r14
	leaq	56(%r15), %rbp
	cmpl	%ecx, 20(%rsp)
	jle	.L3618
	.p2align 4,,10
	.p2align 3
.L3484:
	movl	32(%rsp), %r12d
	subl	%ebx, %r12d
	testl	%r12d, %r12d
	jle	.L3489
.L3494:
	movq	192(%r15), %rax
	movq	200(%r15), %rdx
	cmpq	%rdx, %rax
	jb	.L3619
	movl	48(%r15), %r11d
	testl	%r11d, %r11d
	jne	.L3620
	movl	$1, %ecx
.L3491:
	addl	%ecx, %ebx
	movslq	%ecx, %rcx
	leaq	(%r14,%rcx,4), %r12
	jmp	.L3501
	.p2align 4,,10
	.p2align 3
.L3497:
	movl	48(%r15), %r10d
	xorl	%r13d, %r13d
	testl	%r10d, %r10d
	jne	.L3621
.L3498:
	movb	%r13b, (%r14)
	addq	$4, %r14
	cmpq	%r12, %r14
	je	.L3502
.L3501:
	cmpq	%rax, %rdx
	jbe	.L3497
	leaq	1(%rax), %rcx
	movq	%rcx, 192(%r15)
	movzbl	(%rax), %r13d
	movq	%rcx, %rax
	jmp	.L3498
	.p2align 4,,10
	.p2align 3
.L3608:
	leaq	.LC242(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%r15d, %r15d
.L3460:
	addq	$104, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
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
	movq	%r15, %rax
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L3607:
	.cfi_restore_state
	leaq	.LC241(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%r15d, %r15d
	jmp	.L3460
	.p2align 4,,10
	.p2align 3
.L3609:
	movq	%rcx, 192(%r14)
	movq	40(%r14), %rdi
	movl	$6, %esi
	subl	%edx, %esi
	call	*24(%r14)
	jmp	.L3465
	.p2align 4,,10
	.p2align 3
.L3468:
	leaq	.LC203(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%r15d, %r15d
	jmp	.L3460
	.p2align 4,,10
	.p2align 3
.L3610:
	leaq	.LC243(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%r15d, %r15d
	jmp	.L3460
	.p2align 4,,10
	.p2align 3
.L3612:
	leaq	.LC245(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%r15d, %r15d
	jmp	.L3460
	.p2align 4,,10
	.p2align 3
.L3619:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%r15)
	movzbl	(%rax), %eax
.L3490:
	cmpl	$128, %eax
	je	.L3494
	cmpl	$127, %eax
	jle	.L3622
	movl	$257, %edx
	subl	%eax, %edx
	movl	%edx, %r13d
	cmpl	%edx, %r12d
	jl	.L3496
	movq	%r15, %rdi
	call	stbi__get8
	movslq	%r13d, %rdx
	addl	%r13d, %ebx
	leaq	(%r14,%rdx,4), %r12
	.p2align 4,,10
	.p2align 3
.L3503:
	movb	%al, (%r14)
	addq	$4, %r14
	cmpq	%r12, %r14
	jne	.L3503
.L3502:
	movq	%r12, %r14
	jmp	.L3484
	.p2align 4,,10
	.p2align 3
.L3621:
	movl	52(%r15), %edx
	movq	40(%r15), %rdi
	movq	%rbp, %rsi
	call	*16(%r15)
	movslq	%eax, %rdx
	movq	192(%r15), %rax
	subq	208(%r15), %rax
	addl	%eax, 184(%r15)
	movq	24(%rsp), %rax
	testl	%edx, %edx
	jne	.L3499
	movl	$0, 48(%r15)
	movb	$0, 56(%r15)
	movq	%rax, %rdx
	vmovq	%rax, %xmm6
.L3500:
	vpinsrq	$1, %rdx, %xmm6, %xmm0
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L3498
	.p2align 4,,10
	.p2align 3
.L3620:
	movl	52(%r15), %edx
	movq	40(%r15), %rdi
	movq	%rbp, %rsi
	call	*16(%r15)
	movslq	%eax, %rdx
	movq	192(%r15), %rax
	subq	208(%r15), %rax
	addl	%eax, 184(%r15)
	testl	%edx, %edx
	jne	.L3492
	movl	$0, 48(%r15)
	movb	$0, 56(%r15)
	vmovddup	24(%rsp), %xmm0
	movl	$1, %ecx
	vmovdqu	%xmm0, 192(%r15)
.L3493:
	movq	192(%r15), %rax
	movq	200(%r15), %rdx
	jmp	.L3491
	.p2align 4,,10
	.p2align 3
.L3499:
	movzbl	56(%r15), %r13d
	addq	%rbp, %rdx
	vmovq	%rax, %xmm6
	jmp	.L3500
	.p2align 4,,10
	.p2align 3
.L3618:
	cmpl	$3, %ecx
	movl	32(%rsp), %ebx
	sete	%al
	movq	48(%rsp), %rdx
	negl	%eax
	testl	%ebx, %ebx
	je	.L3489
	.p2align 4,,10
	.p2align 3
.L3488:
	movb	%al, (%r14)
	addq	$4, %r14
	cmpq	%rdx, %r14
	jne	.L3488
.L3489:
	incq	40(%rsp)
	incq	48(%rsp)
	movq	40(%rsp), %rax
	cmpq	$4, %rax
	jne	.L3486
	movq	56(%rsp), %r15
	movq	64(%rsp), %r13
	movq	72(%rsp), %rbp
	movl	84(%rsp), %r12d
	movq	88(%rsp), %rbx
.L3487:
	movl	%r12d, %ecx
	andl	$-5, %ecx
	cmpl	$3, 20(%rsp)
	jle	.L3517
	cmpl	$16, (%rbx)
	vxorps	%xmm2, %xmm2, %xmm2
	je	.L3518
	movl	32(%rsp), %edx
	testl	%edx, %edx
	je	.L3520
	movl	80(%rsp), %edx
	vmovss	.LC247(%rip), %xmm4
	vmovss	.LC115(%rip), %xmm5
	movq	%r15, %rax
	leaq	4(%r15,%rdx,4), %rdx
	.p2align 4,,10
	.p2align 3
.L3525:
	movzbl	3(%rax), %esi
	leal	-1(%rsi), %edi
	cmpb	$-3, %dil
	ja	.L3524
	vcvtsi2ssl	%esi, %xmm2, %xmm0
	movzbl	(%rax), %esi
	vcvtsi2ssl	%esi, %xmm2, %xmm1
	vdivss	%xmm4, %xmm0, %xmm0
	vdivss	%xmm0, %xmm5, %xmm0
	vmulss	%xmm0, %xmm1, %xmm1
	vsubss	%xmm0, %xmm5, %xmm3
	vfmadd231ss	%xmm4, %xmm3, %xmm1
	vcvttss2sil	%xmm1, %esi
	movb	%sil, (%rax)
	movzbl	1(%rax), %esi
	vcvtsi2ssl	%esi, %xmm2, %xmm1
	vmulss	%xmm0, %xmm1, %xmm1
	vfmadd231ss	%xmm4, %xmm3, %xmm1
	vcvttss2sil	%xmm1, %esi
	movb	%sil, 1(%rax)
	movzbl	2(%rax), %esi
	vcvtsi2ssl	%esi, %xmm2, %xmm1
	vmulss	%xmm0, %xmm1, %xmm1
	vfmadd132ss	%xmm4, %xmm1, %xmm3
	vcvttss2sil	%xmm3, %esi
	movb	%sil, 2(%rax)
.L3524:
	addq	$4, %rax
	cmpq	%rdx, %rax
	jne	.L3525
.L3520:
	testl	%ecx, %ecx
	je	.L3526
.L3527:
	movl	36(%rsp), %r8d
	movl	16(%rsp), %ecx
	movq	%r15, %rdi
	movl	%r12d, %edx
	movl	$4, %esi
	call	stbi__convert_format
	movq	%rax, %r15
.L3528:
	testq	%r15, %r15
	je	.L3460
.L3526:
	testq	%rbp, %rbp
	je	.L3529
	movl	$4, 0(%rbp)
.L3529:
	movl	36(%rsp), %eax
	movl	16(%rsp), %ebx
	movl	%eax, 0(%r13)
	movq	8(%rsp), %rax
	movl	%ebx, (%rax)
	jmp	.L3460
	.p2align 4,,10
	.p2align 3
.L3492:
	vmovq	24(%rsp), %xmm7
	addq	%rbp, %rdx
	vpinsrq	$1, %rdx, %xmm7, %xmm0
	movzbl	56(%r15), %eax
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L3490
	.p2align 4,,10
	.p2align 3
.L3611:
	leaq	.LC244(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%r15d, %r15d
	jmp	.L3460
.L3617:
	movl	36(%rsp), %edx
	movl	16(%rsp), %esi
	xorl	%ecx, %ecx
	movl	$8, %edi
	call	stbi__malloc_mad3
	movq	%rax, %r15
	movl	$16, (%rbx)
	testq	%rax, %rax
	je	.L3481
	movl	36(%rsp), %eax
	imull	16(%rsp), %eax
	movl	%eax, 32(%rsp)
.L3482:
	movl	32(%rsp), %eax
	movq	%r15, 40(%rsp)
	decl	%eax
	movl	%eax, 80(%rsp)
	incq	%rax
	leaq	(%r15,%rax,8), %rsi
	xorl	%ecx, %ecx
	leaq	(%r15,%rax,4), %rax
	movq	%r13, 64(%rsp)
	movq	%rbp, 72(%rsp)
	movl	%r12d, 84(%rsp)
	movq	%rbx, 56(%rsp)
	movq	%rsi, %r13
	movq	%rax, %rbp
	movq	%rcx, %r12
	movq	%r15, %rbx
.L3509:
	cmpl	20(%rsp), %r12d
	jl	.L3506
	cmpl	$3, %r12d
	sete	%dl
	cmpb	$0, 48(%rsp)
	je	.L3507
	movl	32(%rsp), %r9d
	movzbl	%dl, %edx
	movq	%rbx, %rax
	negl	%edx
	testl	%r9d, %r9d
	je	.L3510
	.p2align 4,,10
	.p2align 3
.L3508:
	movw	%dx, (%rax)
	addq	$8, %rax
	cmpq	%r13, %rax
	jne	.L3508
.L3510:
	incq	%r12
	addq	$2, %rbx
	addq	$2, %r13
	incq	%rbp
	cmpq	$4, %r12
	jne	.L3509
	movq	40(%rsp), %r15
	movq	64(%rsp), %r13
	movq	72(%rsp), %rbp
	movl	84(%rsp), %r12d
	movq	56(%rsp), %rbx
	jmp	.L3487
	.p2align 4,,10
	.p2align 3
.L3506:
	movq	56(%rsp), %rax
	cmpl	$16, (%rax)
	je	.L3623
	movq	40(%rsp), %rax
	cmpl	$16, 24(%rsp)
	leaq	(%rax,%r12), %r15
	je	.L3514
	movl	32(%rsp), %esi
	testl	%esi, %esi
	je	.L3510
	.p2align 4,,10
	.p2align 3
.L3515:
	movq	%r14, %rdi
	call	stbi__get8
	movb	%al, (%r15)
	addq	$4, %r15
	cmpq	%rbp, %r15
	jne	.L3515
	jmp	.L3510
	.p2align 4,,10
	.p2align 3
.L3507:
	movq	40(%rsp), %rax
	movl	32(%rsp), %r8d
	addq	%r12, %rax
	negl	%edx
	testl	%r8d, %r8d
	je	.L3510
	.p2align 4,,10
	.p2align 3
.L3511:
	movb	%dl, (%rax)
	addq	$4, %rax
	cmpq	%rbp, %rax
	jne	.L3511
	jmp	.L3510
	.p2align 4,,10
	.p2align 3
.L3517:
	testl	%ecx, %ecx
	je	.L3526
	cmpl	$16, (%rbx)
	jne	.L3527
.L3530:
	movl	36(%rsp), %r8d
	movl	16(%rsp), %ecx
	movq	%r15, %rdi
	movl	%r12d, %edx
	movl	$4, %esi
	call	stbi__convert_format16
	movq	%rax, %r15
	jmp	.L3528
	.p2align 4,,10
	.p2align 3
.L3616:
	leaq	.LC223(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%r15d, %r15d
	jmp	.L3460
.L3514:
	movl	32(%rsp), %ecx
	testl	%ecx, %ecx
	je	.L3510
	.p2align 4,,10
	.p2align 3
.L3516:
	movq	%r14, %rdi
	call	stbi__get16be
	movzbl	%ah, %eax
	movb	%al, (%r15)
	addq	$4, %r15
	cmpq	%rbp, %r15
	jne	.L3516
	jmp	.L3510
.L3613:
	movq	200(%r14), %rax
	movq	%rax, 192(%r14)
	jmp	.L3471
.L3614:
	movq	200(%r14), %rax
	movq	%rax, 192(%r14)
	jmp	.L3473
.L3615:
	movq	200(%r14), %rax
	movq	%rax, 192(%r14)
	jmp	.L3475
.L3518:
	movl	32(%rsp), %eax
	testl	%eax, %eax
	je	.L3521
	movl	80(%rsp), %edx
	vmovss	.LC246(%rip), %xmm4
	vmovss	.LC115(%rip), %xmm5
	movq	%r15, %rax
	leaq	8(%r15,%rdx,8), %rdx
	.p2align 4,,10
	.p2align 3
.L3523:
	movzwl	6(%rax), %esi
	leal	-1(%rsi), %edi
	cmpw	$-3, %di
	ja	.L3522
	vcvtsi2ssl	%esi, %xmm2, %xmm0
	movzwl	(%rax), %esi
	vcvtsi2ssl	%esi, %xmm2, %xmm1
	vdivss	%xmm4, %xmm0, %xmm0
	vdivss	%xmm0, %xmm5, %xmm0
	vmulss	%xmm0, %xmm1, %xmm1
	vsubss	%xmm0, %xmm5, %xmm3
	vfmadd231ss	%xmm4, %xmm3, %xmm1
	vcvttss2sil	%xmm1, %esi
	movw	%si, (%rax)
	movzwl	2(%rax), %esi
	vcvtsi2ssl	%esi, %xmm2, %xmm1
	vmulss	%xmm0, %xmm1, %xmm1
	vfmadd231ss	%xmm4, %xmm3, %xmm1
	vcvttss2sil	%xmm1, %esi
	movw	%si, 2(%rax)
	movzwl	4(%rax), %esi
	vcvtsi2ssl	%esi, %xmm2, %xmm1
	vmulss	%xmm0, %xmm1, %xmm1
	vfmadd132ss	%xmm4, %xmm1, %xmm3
	vcvttss2sil	%xmm3, %esi
	movw	%si, 4(%rax)
.L3522:
	addq	$8, %rax
	cmpq	%rax, %rdx
	jne	.L3523
.L3521:
	testl	%ecx, %ecx
	jne	.L3530
	jmp	.L3526
.L3623:
	movl	32(%rsp), %edi
	movq	%rbx, %r15
	testl	%edi, %edi
	je	.L3510
	.p2align 4,,10
	.p2align 3
.L3513:
	movq	%r14, %rdi
	call	stbi__get16be
	movw	%ax, (%r15)
	addq	$8, %r15
	cmpq	%r13, %r15
	jne	.L3513
	jmp	.L3510
.L3622:
	leal	1(%rax), %ecx
	cmpl	%r12d, %ecx
	jle	.L3493
.L3496:
	movq	56(%rsp), %rdi
	xorl	%r15d, %r15d
	call	free@PLT
	leaq	.LC248(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L3460
.L3481:
	leaq	.LC23(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%r15d, %r15d
	jmp	.L3460
	.cfi_endproc
.LFE737:
	.size	stbi__psd_load, .-stbi__psd_load
	.section	.rodata.str1.1
.LC249:
	.string	"no SOF"
.LC250:
	.string	"bad SOF len"
.LC251:
	.string	"only 8-bit"
.LC252:
	.string	"no header height"
.LC253:
	.string	"0 width"
.LC254:
	.string	"bad component count"
.LC255:
	.string	"bad H"
.LC256:
	.string	"bad V"
.LC257:
	.string	"bad TQ"
	.text
	.p2align 4
	.type	stbi__decode_jpeg_header.part.0, @function
stbi__decode_jpeg_header.part.0:
.LFB854:
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
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	%esi, %ebx
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	movzbl	18472(%rdi), %eax
	cmpb	$-1, %al
	je	.L3625
	movb	$-1, 18472(%rdi)
.L3626:
	movzbl	%al, %esi
.L3769:
	leal	-192(%rsi), %eax
	jmp	.L3765
	.p2align 4,,10
	.p2align 3
.L3625:
	movq	(%rdi), %r12
	movq	192(%r12), %rax
	cmpq	200(%r12), %rax
	jb	.L3771
	movl	48(%r12), %r9d
	testl	%r9d, %r9d
	jne	.L3772
.L3629:
	movl	$255, %esi
	.p2align 4,,10
	.p2align 3
.L3667:
	movq	%rbp, %rdi
	call	stbi__process_marker
	testl	%eax, %eax
	je	.L3624
	movzbl	18472(%rbp), %esi
	cmpb	$-1, %sil
	je	.L3639
.L3770:
	movb	$-1, 18472(%rbp)
	leal	-192(%rsi), %eax
.L3765:
	cmpl	$2, %eax
	ja	.L3667
	movq	0(%rbp), %r12
	xorl	%eax, %eax
	cmpl	$194, %esi
	sete	%al
	movl	%eax, 18480(%rbp)
	movq	192(%r12), %rdx
	movq	200(%r12), %rax
	cmpq	%rax, %rdx
	jb	.L3773
	movl	48(%r12), %ecx
	testl	%ecx, %ecx
	jne	.L3774
.L3670:
	leaq	.LC250(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
.L3624:
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
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
	ret
	.p2align 4,,10
	.p2align 3
.L3639:
	.cfi_restore_state
	movq	0(%rbp), %r12
	movq	192(%r12), %rax
	cmpq	200(%r12), %rax
	jb	.L3775
	movl	48(%r12), %r8d
	movq	16(%r12), %rax
	testl	%r8d, %r8d
	jne	.L3776
	.p2align 4,,10
	.p2align 3
.L3718:
	cmpq	$0, 16(%r12)
	je	.L3655
	movq	40(%r12), %rdi
	call	*32(%r12)
	testl	%eax, %eax
	je	.L3654
	movl	48(%r12), %edi
	testl	%edi, %edi
	je	.L3653
.L3655:
	movq	200(%r12), %rax
	cmpq	%rax, 192(%r12)
	jnb	.L3653
.L3654:
	movzbl	18472(%rbp), %esi
	cmpb	$-1, %sil
	jne	.L3770
	movq	0(%rbp), %r12
	movq	192(%r12), %rax
	cmpq	200(%r12), %rax
	jb	.L3777
	movl	48(%r12), %esi
	movq	16(%r12), %rax
	testl	%esi, %esi
	je	.L3718
	movl	52(%r12), %edx
	movq	40(%r12), %rdi
	leaq	56(%r12), %r13
	movq	%r13, %rsi
	call	*%rax
	movq	192(%r12), %rdx
	leaq	57(%r12), %rcx
	subq	208(%r12), %rdx
	addl	%edx, 184(%r12)
	vmovq	%rcx, %xmm0
	testl	%eax, %eax
	je	.L3766
	cltq
	addq	%rax, %r13
	vpinsrq	$1, %r13, %xmm0, %xmm0
	movzbl	56(%r12), %edx
	vmovdqu	%xmm0, 192(%r12)
	movq	0(%rbp), %r12
	.p2align 4,,10
	.p2align 3
.L3658:
	cmpb	$-1, %dl
	jne	.L3718
	.p2align 4,,10
	.p2align 3
.L3666:
	movq	192(%r12), %rax
	cmpq	200(%r12), %rax
	jb	.L3778
	movl	48(%r12), %esi
	testl	%esi, %esi
	je	.L3667
	movl	52(%r12), %edx
	movq	40(%r12), %rdi
	leaq	56(%r12), %r13
	movq	%r13, %rsi
	call	*16(%r12)
	movslq	%eax, %rsi
	movq	192(%r12), %rax
	leaq	57(%r12), %rdx
	subq	208(%r12), %rax
	addl	%eax, 184(%r12)
	testl	%esi, %esi
	jne	.L3663
	vmovq	%rdx, %xmm3
	vpunpcklqdq	%xmm3, %xmm3, %xmm0
	movl	$0, 48(%r12)
	movb	$0, 56(%r12)
	vmovdqu	%xmm0, 192(%r12)
	jmp	.L3769
	.p2align 4,,10
	.p2align 3
.L3778:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%r12)
	movzbl	(%rax), %eax
.L3662:
	cmpb	$-1, %al
	jne	.L3626
	movq	0(%rbp), %r12
	jmp	.L3666
	.p2align 4,,10
	.p2align 3
.L3653:
	leaq	.LC249(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	xorl	%eax, %eax
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
	ret
	.p2align 4,,10
	.p2align 3
.L3663:
	.cfi_restore_state
	addq	%rsi, %r13
	vmovq	%rdx, %xmm4
	vpinsrq	$1, %r13, %xmm4, %xmm0
	movzbl	56(%r12), %eax
	vmovdqu	%xmm0, 192(%r12)
	jmp	.L3662
	.p2align 4,,10
	.p2align 3
.L3777:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%r12)
	movzbl	(%rax), %edx
	jmp	.L3658
	.p2align 4,,10
	.p2align 3
.L3775:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%r12)
	movzbl	(%rax), %edx
.L3642:
	cmpb	$-1, %dl
	jne	.L3718
	.p2align 4,,10
	.p2align 3
.L3651:
	movq	192(%r12), %rax
	cmpq	200(%r12), %rax
	jb	.L3779
	movl	48(%r12), %esi
	testl	%esi, %esi
	je	.L3667
	movl	52(%r12), %edx
	movq	40(%r12), %rdi
	leaq	56(%r12), %r13
	movq	%r13, %rsi
	call	*16(%r12)
	movslq	%eax, %rsi
	movq	192(%r12), %rax
	leaq	57(%r12), %rdx
	subq	208(%r12), %rax
	addl	%eax, 184(%r12)
	testl	%esi, %esi
	jne	.L3648
	vmovq	%rdx, %xmm5
	vpunpcklqdq	%xmm5, %xmm5, %xmm0
	movl	$0, 48(%r12)
	movb	$0, 56(%r12)
	vmovdqu	%xmm0, 192(%r12)
	jmp	.L3769
	.p2align 4,,10
	.p2align 3
.L3779:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%r12)
	movzbl	(%rax), %eax
.L3646:
	cmpb	$-1, %al
	jne	.L3626
	movq	0(%rbp), %r12
	jmp	.L3651
	.p2align 4,,10
	.p2align 3
.L3648:
	addq	%rsi, %r13
	vmovq	%rdx, %xmm6
	vpinsrq	$1, %r13, %xmm6, %xmm0
	movzbl	56(%r12), %eax
	vmovdqu	%xmm0, 192(%r12)
	jmp	.L3646
	.p2align 4,,10
	.p2align 3
.L3766:
	movb	$0, 56(%r12)
	vpunpcklqdq	%xmm0, %xmm0, %xmm0
	movl	$0, 48(%r12)
	vmovdqu	%xmm0, 192(%r12)
	movq	0(%rbp), %r12
	jmp	.L3718
	.p2align 4,,10
	.p2align 3
.L3771:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%r12)
	movzbl	(%rax), %edx
.L3628:
	cmpb	$-1, %dl
	jne	.L3629
	.p2align 4,,10
	.p2align 3
.L3636:
	movq	0(%rbp), %r12
	movq	192(%r12), %rax
	cmpq	200(%r12), %rax
	jb	.L3780
	movl	48(%r12), %esi
	testl	%esi, %esi
	je	.L3667
	movl	52(%r12), %edx
	movq	40(%r12), %rdi
	leaq	56(%r12), %r13
	movq	%r13, %rsi
	call	*16(%r12)
	movslq	%eax, %rsi
	movq	192(%r12), %rax
	leaq	57(%r12), %rdx
	subq	208(%r12), %rax
	addl	%eax, 184(%r12)
	testl	%esi, %esi
	jne	.L3634
	vmovq	%rdx, %xmm7
	vpunpcklqdq	%xmm7, %xmm7, %xmm0
	movl	$0, 48(%r12)
	movb	$0, 56(%r12)
	vmovdqu	%xmm0, 192(%r12)
	jmp	.L3667
	.p2align 4,,10
	.p2align 3
.L3780:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%r12)
	movzbl	(%rax), %eax
.L3632:
	cmpb	$-1, %al
	je	.L3636
	jmp	.L3626
	.p2align 4,,10
	.p2align 3
.L3634:
	addq	%rsi, %r13
	vmovq	%rdx, %xmm1
	vpinsrq	$1, %r13, %xmm1, %xmm0
	movzbl	56(%r12), %eax
	vmovdqu	%xmm0, 192(%r12)
	jmp	.L3632
.L3772:
	movl	52(%r12), %edx
	movq	40(%r12), %rdi
	leaq	56(%r12), %r13
	movq	%r13, %rsi
	call	*16(%r12)
	movq	192(%r12), %rdx
	leaq	57(%r12), %rcx
	subq	208(%r12), %rdx
	addl	%edx, 184(%r12)
	testl	%eax, %eax
	jne	.L3630
	vmovq	%rcx, %xmm2
	vpunpcklqdq	%xmm2, %xmm2, %xmm0
	movl	$0, 48(%r12)
	movb	$0, 56(%r12)
	vmovdqu	%xmm0, 192(%r12)
	jmp	.L3629
.L3776:
	movl	52(%r12), %edx
	movq	40(%r12), %rdi
	leaq	56(%r12), %r13
	movq	%r13, %rsi
	call	*%rax
	movq	192(%r12), %rdx
	leaq	57(%r12), %rcx
	subq	208(%r12), %rdx
	addl	%edx, 184(%r12)
	vmovq	%rcx, %xmm0
	testl	%eax, %eax
	je	.L3766
	cltq
	addq	%rax, %r13
	vpinsrq	$1, %r13, %xmm0, %xmm0
	movzbl	56(%r12), %edx
	vmovdqu	%xmm0, 192(%r12)
	movq	0(%rbp), %r12
	jmp	.L3642
.L3630:
	cltq
	addq	%rax, %r13
	vmovq	%rcx, %xmm2
	vpinsrq	$1, %r13, %xmm2, %xmm0
	movzbl	56(%r12), %edx
	vmovdqu	%xmm0, 192(%r12)
	jmp	.L3628
.L3773:
	leaq	1(%rdx), %rcx
	movq	%rcx, 192(%r12)
	movzbl	(%rdx), %r14d
	sall	$8, %r14d
.L3669:
	cmpq	%rax, %rcx
	jnb	.L3673
	leaq	1(%rcx), %rdx
	movq	%rdx, 192(%r12)
	movzbl	(%rcx), %ecx
	addl	%ecx, %r14d
.L3674:
	cmpl	$10, %r14d
	jle	.L3670
	cmpq	%rax, %rdx
	jnb	.L3679
	leaq	1(%rdx), %rax
	movq	%rax, 192(%r12)
	movzbl	(%rdx), %edx
.L3680:
	cmpb	$8, %dl
	jne	.L3683
	movq	%r12, %rdi
	call	stbi__get16be
	movl	%eax, 4(%r12)
	testl	%eax, %eax
	jne	.L3684
	leaq	.LC252(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L3624
.L3673:
	movl	48(%r12), %edx
	testl	%edx, %edx
	jne	.L3781
	cmpl	$10, %r14d
	jle	.L3670
.L3683:
	leaq	.LC251(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L3624
.L3679:
	movl	48(%r12), %eax
	testl	%eax, %eax
	je	.L3683
	movl	52(%r12), %edx
	movq	40(%r12), %rdi
	leaq	56(%r12), %r13
	movq	%r13, %rsi
	call	*16(%r12)
	movq	192(%r12), %rdx
	leaq	57(%r12), %rcx
	subq	208(%r12), %rdx
	addl	%edx, 184(%r12)
	vmovq	%rcx, %xmm0
	testl	%eax, %eax
	jne	.L3682
	vpunpcklqdq	%xmm0, %xmm0, %xmm0
	movl	$0, 48(%r12)
	movb	$0, 56(%r12)
	vmovdqu	%xmm0, 192(%r12)
	jmp	.L3683
.L3774:
	movl	52(%r12), %edx
	movq	40(%r12), %rdi
	leaq	56(%r12), %r13
	movq	%r13, %rsi
	call	*16(%r12)
	movslq	%eax, %r14
	movq	192(%r12), %rax
	leaq	57(%r12), %rcx
	subq	208(%r12), %rax
	addl	%eax, 184(%r12)
	testl	%r14d, %r14d
	jne	.L3671
	movl	$0, 48(%r12)
	movb	$0, 56(%r12)
	movq	%rcx, %rax
.L3672:
	vmovq	%rcx, %xmm2
	vpinsrq	$1, %rax, %xmm2, %xmm0
	vmovdqu	%xmm0, 192(%r12)
	jmp	.L3669
.L3781:
	movl	52(%r12), %edx
	movq	40(%r12), %rdi
	leaq	56(%r12), %r13
	movq	%r13, %rsi
	call	*16(%r12)
	movq	192(%r12), %rdx
	subq	208(%r12), %rdx
	addl	%edx, 184(%r12)
	leaq	57(%r12), %rdx
	testl	%eax, %eax
	jne	.L3676
	movl	$0, 48(%r12)
	movb	$0, 56(%r12)
	movq	%rdx, %rax
.L3677:
	vmovq	%rdx, %xmm2
	vpinsrq	$1, %rax, %xmm2, %xmm0
	vmovdqu	%xmm0, 192(%r12)
	jmp	.L3674
.L3684:
	movq	%r12, %rdi
	call	stbi__get16be
	movl	%eax, (%r12)
	testl	%eax, %eax
	je	.L3782
	cmpl	$16777216, 4(%r12)
	ja	.L3687
	cmpl	$16777216, %eax
	ja	.L3687
	movq	%r12, %rdi
	call	stbi__get8
	movzbl	%al, %r13d
	subl	$3, %eax
	cmpb	$1, %al
	jbe	.L3688
	cmpl	$1, %r13d
	jne	.L3783
.L3688:
	leal	0(%r13,%r13,2), %eax
	movl	%r13d, 8(%r12)
	addl	$8, %eax
	testl	%r13d, %r13d
	je	.L3689
	movq	$0, 18128(%rbp)
	movq	$0, 18152(%rbp)
	cmpl	$1, %r13d
	je	.L3690
	movq	$0, 18224(%rbp)
	movq	$0, 18248(%rbp)
	cmpl	$2, %r13d
	je	.L3690
	movq	$0, 18320(%rbp)
	movq	$0, 18344(%rbp)
	cmpl	$3, %r13d
	je	.L3690
	movq	$0, 18416(%rbp)
	movq	$0, 18440(%rbp)
.L3690:
	cmpl	%eax, %r14d
	jne	.L3670
	movl	$0, 18512(%rbp)
	leaq	18080(%rbp), %r15
	xorl	%r14d, %r14d
	jmp	.L3696
.L3691:
	movq	%r12, %rdi
	call	stbi__get8
	movzbl	%al, %edx
	sarl	$4, %edx
	movl	%edx, 4(%r15)
	je	.L3701
	cmpl	$4, %edx
	jg	.L3701
	movl	%eax, %edx
	andl	$15, %edx
	andl	$15, %eax
	movl	%eax, 8(%r15)
	leal	-1(%rdx), %eax
	cmpb	$3, %al
	ja	.L3702
	movq	%r12, %rdi
	call	stbi__get8
	movzbl	%al, %eax
	movl	%eax, 12(%r15)
	cmpl	$3, %eax
	jg	.L3784
	movl	8(%r12), %r13d
	incq	%r14
	addq	$96, %r15
	cmpl	%r14d, %r13d
	jle	.L3716
.L3696:
	movq	%r12, %rdi
	call	stbi__get8
	movzbl	%al, %eax
	movl	%eax, (%r15)
	cmpl	$3, 8(%r12)
	jne	.L3691
	leaq	rgb.36(%rip), %rcx
	movzbl	(%rcx,%r14), %edx
	cmpl	%edx, %eax
	jne	.L3691
	incl	18512(%rbp)
	jmp	.L3691
.L3671:
	leaq	0(%r13,%r14), %rax
	movzbl	56(%r12), %r14d
	sall	$8, %r14d
	jmp	.L3672
.L3676:
	movzbl	56(%r12), %ecx
	cltq
	addq	%r13, %rax
	addl	%ecx, %r14d
	jmp	.L3677
.L3687:
	leaq	.LC203(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L3624
.L3782:
	leaq	.LC253(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L3624
.L3682:
	cltq
	addq	%rax, %r13
	vpinsrq	$1, %r13, %xmm0, %xmm0
	movzbl	56(%r12), %edx
	vmovdqu	%xmm0, 192(%r12)
	jmp	.L3680
.L3689:
	cmpl	%eax, %r14d
	jne	.L3670
	movl	$0, 18512(%rbp)
.L3716:
	testl	%ebx, %ebx
	jne	.L3714
	movl	4(%r12), %r8d
	movl	(%r12), %r9d
	movl	%r8d, %eax
	orl	%r9d, %eax
	js	.L3687
	testl	%r8d, %r8d
	je	.L3698
	movl	$2147483647, %eax
	cltd
	idivl	%r8d
	cmpl	%eax, %r9d
	jg	.L3687
.L3698:
	testl	%r13d, %r13d
	js	.L3687
	je	.L3719
	movl	$2147483647, %eax
	cltd
	idivl	%r13d
	movl	%r8d, %ecx
	imull	%r9d, %ecx
	cmpl	%eax, %ecx
	jg	.L3687
	leaq	18084(%rbp), %r12
	movq	%r12, %rax
	xorl	%edx, %edx
	movl	$1, %r15d
	movl	$1, %r14d
.L3700:
	movl	(%rax), %ecx
	cmpl	%ecx, %r14d
	cmovl	%ecx, %r14d
	movl	4(%rax), %ecx
	cmpl	%ecx, %r15d
	cmovl	%ecx, %r15d
	incl	%edx
	addq	$96, %rax
	cmpl	%r13d, %edx
	jne	.L3700
.L3699:
	movq	%r12, %rcx
	xorl	%esi, %esi
	jmp	.L3703
.L3704:
	movl	%r14d, %eax
	cltd
	idivl	(%rcx)
	movq	%rcx, %rdi
	testl	%edx, %edx
	jne	.L3701
	movl	%r15d, %eax
	cltd
	idivl	4(%rdi)
	addq	$96, %rcx
	testl	%edx, %edx
	jne	.L3702
	incl	%esi
.L3703:
	cmpl	%r13d, %esi
	jne	.L3704
	leal	0(,%r14,8), %esi
	leal	-1(%r9,%rsi), %eax
	xorl	%edx, %edx
	divl	%esi
	movl	%r8d, 24(%rsp)
	movl	%r9d, 28(%rsp)
	leal	0(,%r15,8), %ecx
	xorl	%edx, %edx
	vmovd	%esi, %xmm2
	vpinsrd	$1, %ecx, %xmm2, %xmm0
	vmovq	%xmm0, 18072(%rbp)
	movl	%eax, 12(%rsp)
	leal	-1(%r8,%rcx), %eax
	divl	%ecx
	vmovd	12(%rsp), %xmm2
	vpinsrd	$1, %eax, %xmm2, %xmm1
	vmovd	%r14d, %xmm2
	movl	%eax, 16(%rsp)
	vpinsrd	$1, %r15d, %xmm2, %xmm0
	leal	-1(%r14), %eax
	movl	%eax, 20(%rsp)
	vpunpcklqdq	%xmm1, %xmm0, %xmm0
	movl	%ebx, %eax
	vmovdqu	%xmm0, 18056(%rbp)
	movq	%r12, %rbx
	movq	%rbp, %r12
	movl	%eax, %ebp
	jmp	.L3705
.L3706:
	testl	%edi, %edi
	je	.L3708
	movl	$2147483647, %eax
	cltd
	idivl	%esi
	cmpl	%eax, %r10d
	jg	.L3767
.L3708:
	movl	%r10d, %edi
	imull	%esi, %edi
	movl	%r10d, 36(%rsp)
	movl	%esi, 32(%rsp)
	addl	$15, %edi
	movslq	%edi, %rdi
	vmovq	%xmm2, 40(%rsp)
	call	malloc@PLT
	testq	%rax, %rax
	movq	%rax, 52(%rbx)
	movl	32(%rsp), %esi
	movl	36(%rsp), %r10d
	vmovq	40(%rsp), %xmm2
	je	.L3768
	addq	$15, %rax
	andq	$-16, %rax
	cmpl	$0, 18480(%r12)
	movq	%rax, 44(%rbx)
	jne	.L3785
.L3711:
	incl	%ebp
	addq	$96, %rbx
.L3705:
	cmpl	%r13d, %ebp
	je	.L3714
	movl	(%rbx), %eax
	movl	12(%rsp), %edx
	movl	4(%rbx), %ecx
	imull	%eax, %edx
	imull	28(%rsp), %eax
	movl	16(%rsp), %edi
	leal	0(,%rdx,8), %r10d
	vmovd	%edx, %xmm2
	addl	20(%rsp), %eax
	xorl	%edx, %edx
	divl	%r14d
	movq	$0, 76(%rbx)
	movq	$0, 60(%rbx)
	movq	$0, 68(%rbx)
	imull	%ecx, %edi
	imull	24(%rsp), %ecx
	xorl	%edx, %edx
	leal	0(,%rdi,8), %esi
	vmovd	%r10d, %xmm7
	vpinsrd	$1, %esi, %xmm7, %xmm0
	vpinsrd	$1, %edi, %xmm2, %xmm2
	movl	%eax, %r11d
	leal	-1(%r15,%rcx), %eax
	divl	%r15d
	vmovd	%r11d, %xmm7
	vpinsrd	$1, %eax, %xmm7, %xmm1
	movl	%r10d, %eax
	vpunpcklqdq	%xmm0, %xmm1, %xmm0
	orl	%esi, %eax
	vmovdqu	%xmm0, 24(%rbx)
	jns	.L3706
.L3767:
	movslq	%ebp, %rax
	movq	%rax, %rbx
	imulq	$96, %rax, %rax
	movq	%r12, %rbp
	movq	$0, 18136(%r12,%rax)
.L3707:
	leaq	.LC23(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	leal	1(%rbx), %esi
	movq	%rbp, %rdi
	call	stbi__free_jpeg_components.constprop.0
	testl	%eax, %eax
	setne	%al
	movzbl	%al, %eax
	jmp	.L3624
.L3714:
	movl	$1, %eax
	jmp	.L3624
.L3719:
	movl	$1, %r15d
	movl	$1, %r14d
	leaq	18084(%rbp), %r12
	jmp	.L3699
.L3785:
	vmovq	%xmm2, 84(%rbx)
	movl	$15, %ecx
	movl	$2, %edx
	movl	%r10d, %edi
	call	stbi__malloc_mad3
	movq	%rax, 60(%rbx)
	testq	%rax, %rax
	je	.L3768
	addq	$15, %rax
	andq	$-16, %rax
	movq	%rax, 76(%rbx)
	jmp	.L3711
.L3768:
	movl	%ebp, %ebx
	movq	%r12, %rbp
	jmp	.L3707
.L3783:
	leaq	.LC254(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L3624
.L3784:
	leaq	.LC257(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L3624
.L3702:
	leaq	.LC256(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L3624
.L3701:
	leaq	.LC255(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L3624
	.cfi_endproc
.LFE854:
	.size	stbi__decode_jpeg_header.part.0, .-stbi__decode_jpeg_header.part.0
	.section	.rodata.str1.1
.LC258:
	.string	"no SOI"
.LC259:
	.string	"bad SOS component count"
.LC260:
	.string	"bad SOS len"
.LC261:
	.string	"bad DC huff"
.LC262:
	.string	"bad AC huff"
.LC263:
	.string	"bad SOS"
.LC264:
	.string	"bad DNL len"
.LC265:
	.string	"bad DNL height"
	.text
	.p2align 4
	.type	stbi__decode_jpeg_image, @function
stbi__decode_jpeg_image:
.LFB663:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	pushq	-8(%r10)
	pushq	%rbp
	movq	%rsp, %rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	pushq	%r15
	pushq	%r14
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	movq	%rdi, %r14
	pushq	%r13
	pushq	%r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	pushq	%rbx
	subq	$256, %rsp
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	movabsq	$-4294967296, %rax
	movq	$0, 18136(%rdi)
	movq	$0, 18144(%rdi)
	movq	$0, 18232(%rdi)
	movq	$0, 18240(%rdi)
	movq	$0, 18328(%rdi)
	movq	$0, 18336(%rdi)
	movq	$0, 18424(%rdi)
	movq	$0, 18432(%rdi)
	movl	$0, 18536(%rdi)
	movq	%rax, 18504(%rdi)
	movb	$-1, 18472(%rdi)
	movq	(%rdi), %rdi
	call	stbi__get8
	cmpb	$-1, %al
	jne	.L3791
.L3787:
	movq	(%r14), %rbx
	movq	192(%rbx), %rax
	cmpq	200(%rbx), %rax
	jb	.L4106
	movl	48(%rbx), %r10d
	testl	%r10d, %r10d
	jne	.L4107
.L3791:
	leaq	.LC258(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
.L3786:
	movq	-56(%rbp), %rdx
	subq	%fs:40, %rdx
	jne	.L4108
	leaq	-48(%rbp), %rsp
	popq	%rbx
	popq	%r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
.L4106:
	.cfi_restore_state
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rbx)
	movzbl	(%rax), %edx
.L3790:
	cmpb	$-1, %dl
	je	.L3787
	cmpb	$-40, %dl
	jne	.L3791
	xorl	%esi, %esi
	movq	%r14, %rdi
	call	stbi__decode_jpeg_header.part.0
	testl	%eax, %eax
	je	.L4104
	movzbl	18472(%r14), %edx
	cmpb	$-1, %dl
	je	.L3794
	movb	$-1, 18472(%r14)
.L3795:
	movzbl	%dl, %esi
	cmpb	$-39, %dl
	jne	.L3800
	movl	18480(%r14), %eax
	testl	%eax, %eax
	jne	.L3961
.L3962:
	movl	$1, %eax
	jmp	.L3786
.L3812:
	movq	%r12, %rdi
	call	stbi__get8
	movzbl	%al, %eax
	movl	%eax, 18484(%r15)
	movq	(%r15), %rdi
	call	stbi__get8
	movzbl	%al, %eax
	movl	%eax, 18488(%r15)
	movq	(%r15), %rdi
	call	stbi__get8
	movzbl	%al, %edx
	sarl	$4, %edx
	movl	%eax, %ecx
	vmovd	%edx, %xmm7
	andl	$15, %eax
	movl	18480(%r15), %r8d
	vpinsrd	$1, %eax, %xmm7, %xmm0
	andl	$15, %ecx
	vmovq	%xmm0, 18492(%r15)
	testl	%r8d, %r8d
	je	.L3825
	movl	18484(%r15), %edi
	cmpl	$63, %edi
	jg	.L3826
	movl	18488(%r15), %esi
	cmpl	$63, %esi
	setg	%al
	cmpl	%esi, %edi
	setg	%sil
	orl	%esi, %eax
	cmpb	$13, %cl
	seta	%cl
	orb	%cl, %al
	jne	.L3826
	cmpl	$13, %edx
	jg	.L3826
	movl	18536(%r15), %eax
	movl	$0, 18476(%r15)
	movl	$0, 18392(%r15)
	movl	$0, 18296(%r15)
	movl	$0, 18200(%r15)
	movl	$0, 18104(%r15)
	movq	$0, 18464(%r15)
	movb	$-1, 18472(%r15)
	testl	%eax, %eax
	je	.L4085
	movl	%eax, 18540(%r15)
	movl	$0, 18500(%r15)
.L3973:
	cmpl	$1, 18516(%r15)
	je	.L3865
	movl	18068(%r15), %edx
	testl	%edx, %edx
	jle	.L3846
	movl	$0, -208(%rbp)
	movl	18064(%r15), %eax
.L3866:
	movl	$0, -200(%rbp)
	testl	%eax, %eax
	jle	.L3921
.L3920:
	movl	18516(%r15), %edx
	movq	$0, -216(%rbp)
	testl	%edx, %edx
	jle	.L3919
.L3914:
	movq	-216(%rbp), %rax
	movslq	18520(%r15,%rax,4), %rax
	leaq	(%rax,%rax,2), %r8
	salq	$5, %r8
	leaq	(%r15,%r8), %r13
	movq	%rax, %r14
	movl	18088(%r13), %eax
	testl	%eax, %eax
	jle	.L3909
	movl	18084(%r13), %ecx
	xorl	%r12d, %r12d
.L3910:
	testl	%ecx, %ecx
	jle	.L3913
	xorl	%ebx, %ebx
	jmp	.L3911
	.p2align 4,,10
	.p2align 3
.L4110:
	movl	18084(%r13), %ecx
	incl	%ebx
	movl	18088(%r13), %eax
	cmpl	%ebx, %ecx
	jle	.L4109
.L3911:
	imull	-208(%rbp), %eax
	imull	-200(%rbp), %ecx
	movslq	18096(%r13), %rdx
	addl	%r12d, %eax
	imull	18168(%r13), %eax
	addl	%ebx, %ecx
	imulq	$1680, %rdx, %rdx
	addl	%ecx, %eax
	sall	$6, %eax
	movq	18160(%r13), %rcx
	cltq
	leaq	(%rcx,%rax,2), %rsi
	leaq	8(%r15,%rdx), %rdx
	movl	%r14d, %ecx
	movq	%r15, %rdi
	call	stbi__jpeg_decode_block_prog_dc
	testl	%eax, %eax
	jne	.L4110
.L4104:
	xorl	%eax, %eax
	jmp	.L3786
.L3794:
	movq	(%r14), %rdi
	call	stbi__get8
	cmpb	$-1, %al
	jne	.L3977
.L3801:
	movq	(%r14), %rbx
	movq	192(%rbx), %rax
	cmpq	200(%rbx), %rax
	jb	.L4111
	movl	48(%rbx), %esi
	testl	%esi, %esi
	je	.L3800
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	leaq	56(%rbx), %r12
	movq	%r12, %rsi
	call	*16(%rbx)
	movslq	%eax, %rsi
	movq	192(%rbx), %rax
	subq	208(%rbx), %rax
	addl	%eax, 184(%rbx)
	leaq	57(%rbx), %rax
	vmovq	%rax, %xmm0
	testl	%esi, %esi
	jne	.L3799
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	vpunpcklqdq	%xmm0, %xmm0, %xmm0
	vmovdqu	%xmm0, 192(%rbx)
.L3800:
	movq	%r14, %r15
.L3960:
	cmpl	$218, %esi
	jne	.L3803
	movq	(%r15), %rdi
	call	stbi__get16be
	movq	(%r15), %rbx
	movl	%eax, %r13d
	movq	192(%rbx), %rax
	cmpq	200(%rbx), %rax
	jb	.L4112
	movl	48(%rbx), %r9d
	testl	%r9d, %r9d
	jne	.L4113
	movl	$0, 18516(%r15)
.L3808:
	leaq	.LC259(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L3786
.L3803:
	cmpl	$220, %esi
	jne	.L3958
	movq	(%r15), %r12
	movq	192(%r12), %rdx
	movq	200(%r12), %rax
	cmpq	%rax, %rdx
	jb	.L4114
	movl	48(%r12), %r14d
	testl	%r14d, %r14d
	jne	.L4115
.L3933:
	movq	192(%r12), %rdx
	movq	200(%r12), %rax
	cmpq	%rax, %rdx
	jb	.L4116
	movl	48(%r12), %r13d
	testl	%r13d, %r13d
	jne	.L4117
.L3941:
	cmpl	$4, %r14d
	jne	.L4118
	movq	(%r15), %rax
	cmpl	%r13d, 4(%rax)
	jne	.L3948
.L4103:
	movzbl	18472(%r15), %eax
.L3927:
	cmpb	$-1, %al
	je	.L3949
.L3922:
	movb	$-1, 18472(%r15)
.L3950:
	movzbl	%al, %esi
	cmpb	$-39, %al
	jne	.L3960
	movq	%r15, %r14
	movl	18480(%r14), %eax
	testl	%eax, %eax
	je	.L3962
	jmp	.L3961
	.p2align 4,,10
	.p2align 3
.L3949:
	movq	(%r15), %rbx
	movq	192(%rbx), %rax
	cmpq	200(%rbx), %rax
	jb	.L4119
	movl	48(%rbx), %edx
	testl	%edx, %edx
	jne	.L4120
.L3953:
	movl	$255, %esi
	.p2align 4,,10
	.p2align 3
.L3958:
	movq	%r15, %rdi
	call	stbi__process_marker
	testl	%eax, %eax
	jne	.L4103
.L4105:
	xorl	%eax, %eax
	jmp	.L3786
	.p2align 4,,10
	.p2align 3
.L4119:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rbx)
	movzbl	(%rax), %edx
.L3952:
	cmpb	$-1, %dl
	jne	.L3953
	.p2align 4,,10
	.p2align 3
.L3959:
	movq	(%r15), %rbx
	movq	192(%rbx), %rax
	cmpq	200(%rbx), %rax
	jb	.L4121
	movl	48(%rbx), %esi
	testl	%esi, %esi
	je	.L3958
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	leaq	56(%rbx), %r12
	movq	%r12, %rsi
	call	*16(%rbx)
	movslq	%eax, %rsi
	movq	192(%rbx), %rax
	subq	208(%rbx), %rax
	addl	%eax, 184(%rbx)
	leaq	57(%rbx), %rax
	vmovq	%rax, %xmm5
	testl	%esi, %esi
	jne	.L3957
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	vpunpcklqdq	%xmm5, %xmm5, %xmm0
	vmovdqu	%xmm0, 192(%rbx)
	movq	%r15, %rdi
	call	stbi__process_marker
	testl	%eax, %eax
	jne	.L4103
	jmp	.L4105
	.p2align 4,,10
	.p2align 3
.L4121:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rbx)
	movzbl	(%rax), %eax
.L3956:
	cmpb	$-1, %al
	je	.L3959
	jmp	.L3950
	.p2align 4,,10
	.p2align 3
.L3957:
	addq	%rsi, %r12
	vpinsrq	$1, %r12, %xmm5, %xmm0
	movzbl	56(%rbx), %eax
	vmovdqu	%xmm0, 192(%rbx)
	jmp	.L3956
.L4116:
	leaq	1(%rdx), %rcx
	movq	%rcx, 192(%r12)
	movzbl	(%rdx), %r13d
	sall	$8, %r13d
	cmpq	%rax, %rcx
	jnb	.L3944
.L4129:
	leaq	1(%rcx), %rax
	movq	%rax, 192(%r12)
	movzbl	(%rcx), %eax
	addl	%eax, %r13d
	jmp	.L3941
.L4114:
	leaq	1(%rdx), %rcx
	movq	%rcx, 192(%r12)
	movzbl	(%rdx), %r14d
	sall	$8, %r14d
	cmpq	%rax, %rcx
	jnb	.L3936
.L4132:
	leaq	1(%rcx), %rax
	movq	%rax, 192(%r12)
	movq	(%r15), %r12
	movzbl	(%rcx), %eax
	addl	%eax, %r14d
	jmp	.L3933
.L4112:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rbx)
	movzbl	(%rax), %eax
	leal	-1(%rax), %ecx
.L3805:
	movl	%eax, 18516(%r15)
	cmpl	$3, %ecx
	ja	.L3808
	movq	(%r15), %r12
	cmpl	%eax, 8(%r12)
	jl	.L3808
	leal	6(%rax,%rax), %edx
	cmpl	%edx, %r13d
	jne	.L3810
	xorl	%ebx, %ebx
	testl	%eax, %eax
	jg	.L3811
	jmp	.L3812
	.p2align 4,,10
	.p2align 3
.L3813:
	movl	48(%r12), %r13d
	xorl	%eax, %eax
	xorl	%esi, %esi
	testl	%r13d, %r13d
	jne	.L4122
.L3815:
	movl	8(%r12), %edx
	testl	%edx, %edx
	jle	.L3981
.L4126:
	cmpl	%r13d, 18080(%r15)
	je	.L3982
	cmpl	$1, %edx
	je	.L3983
	cmpl	18176(%r15), %r13d
	je	.L3984
	cmpl	$2, %edx
	je	.L3985
	cmpl	18272(%r15), %r13d
	je	.L3986
	cmpl	$3, %edx
	je	.L3987
	movl	$4, %ecx
	cmpl	%r13d, 18368(%r15)
	je	.L4123
.L3821:
	cmpl	%edx, %ecx
	je	.L4104
.L3822:
	sarl	$4, %eax
	movl	%eax, %edx
	movslq	%ecx, %rax
	leaq	(%rax,%rax,2), %rax
	salq	$5, %rax
	addq	%r15, %rax
	movl	%edx, 18096(%rax)
	cmpl	$3, %edx
	jg	.L4124
	movl	%esi, %edx
	andl	$15, %edx
	andl	$12, %esi
	movl	%edx, 18100(%rax)
	jne	.L4125
	movl	%ecx, 18520(%r15,%rbx,4)
	incq	%rbx
	cmpl	%ebx, 18516(%r15)
	jle	.L3812
.L3811:
	movq	192(%r12), %rdx
	movq	200(%r12), %rax
	cmpq	%rax, %rdx
	jnb	.L3813
	leaq	1(%rdx), %rcx
	movq	%rcx, 192(%r12)
	movzbl	(%rdx), %r13d
	cmpq	%rax, %rcx
	jnb	.L3818
.L4127:
	leaq	1(%rcx), %rax
	movq	%rax, 192(%r12)
	movl	8(%r12), %edx
	movzbl	(%rcx), %eax
	movl	%eax, %esi
	testl	%edx, %edx
	jg	.L4126
.L3981:
	xorl	%ecx, %ecx
	jmp	.L3821
.L4122:
	movl	52(%r12), %edx
	movq	40(%r12), %rdi
	leaq	56(%r12), %r14
	movq	%r14, %rsi
	call	*16(%r12)
	movslq	%eax, %r13
	movq	192(%r12), %rax
	subq	208(%r12), %rax
	addl	%eax, 184(%r12)
	leaq	57(%r12), %rax
	testl	%r13d, %r13d
	jne	.L3816
	movl	$0, 48(%r12)
	movb	$0, 56(%r12)
	movq	%rax, %r14
.L3817:
	vmovq	%rax, %xmm5
	vpinsrq	$1, %r14, %xmm5, %xmm0
	vmovdqu	%xmm0, 192(%r12)
	movq	(%r15), %r12
	movq	192(%r12), %rcx
	movq	200(%r12), %rax
	cmpq	%rax, %rcx
	jb	.L4127
.L3818:
	movl	48(%r12), %eax
	testl	%eax, %eax
	je	.L3980
	movl	52(%r12), %edx
	movq	40(%r12), %rdi
	leaq	56(%r12), %r14
	movq	%r14, %rsi
	call	*16(%r12)
	movq	192(%r12), %rdx
	subq	208(%r12), %rdx
	addl	%edx, 184(%r12)
	leaq	57(%r12), %rdx
	testl	%eax, %eax
	jne	.L3819
	movl	$0, 48(%r12)
	movb	$0, 56(%r12)
	movq	%rdx, %r14
	xorl	%esi, %esi
.L3820:
	vmovq	%rdx, %xmm6
	vpinsrq	$1, %r14, %xmm6, %xmm0
	vmovdqu	%xmm0, 192(%r12)
	movq	(%r15), %r12
	jmp	.L3815
.L3810:
	leaq	.LC260(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L3786
.L4120:
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	leaq	56(%rbx), %r12
	movq	%r12, %rsi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	leaq	57(%rbx), %rcx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	vmovq	%rcx, %xmm0
	testl	%eax, %eax
	jne	.L3954
	vpunpcklqdq	%xmm0, %xmm0, %xmm0
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	vmovdqu	%xmm0, 192(%rbx)
	jmp	.L3953
.L4117:
	movl	52(%r12), %edx
	movq	40(%r12), %rdi
	leaq	56(%r12), %rbx
	movq	%rbx, %rsi
	call	*16(%r12)
	movslq	%eax, %r13
	movq	192(%r12), %rax
	leaq	57(%r12), %rcx
	subq	208(%r12), %rax
	addl	%eax, 184(%r12)
	testl	%r13d, %r13d
	je	.L4128
	leaq	(%rbx,%r13), %rax
	movzbl	56(%r12), %r13d
	sall	$8, %r13d
.L3943:
	vmovq	%rcx, %xmm7
	vpinsrq	$1, %rax, %xmm7, %xmm0
	vmovdqu	%xmm0, 192(%r12)
	cmpq	%rax, %rcx
	jb	.L4129
.L3944:
	movl	48(%r12), %ecx
	testl	%ecx, %ecx
	je	.L3941
	movl	52(%r12), %edx
	movq	40(%r12), %rdi
	leaq	56(%r12), %rbx
	movq	%rbx, %rsi
	call	*16(%r12)
	movq	192(%r12), %rdx
	subq	208(%r12), %rdx
	addl	%edx, 184(%r12)
	leaq	57(%r12), %rdx
	testl	%eax, %eax
	je	.L4130
	cltq
	addq	%rax, %rbx
	movzbl	56(%r12), %eax
	addl	%eax, %r13d
.L3946:
	vmovq	%rdx, %xmm4
	vpinsrq	$1, %rbx, %xmm4, %xmm0
	vmovdqu	%xmm0, 192(%r12)
	jmp	.L3941
.L4115:
	movl	52(%r12), %edx
	movq	40(%r12), %rdi
	leaq	56(%r12), %rbx
	movq	%rbx, %rsi
	call	*16(%r12)
	movslq	%eax, %r14
	movq	192(%r12), %rax
	leaq	57(%r12), %rcx
	subq	208(%r12), %rax
	addl	%eax, 184(%r12)
	testl	%r14d, %r14d
	je	.L4131
	leaq	(%rbx,%r14), %rax
	movzbl	56(%r12), %r14d
	sall	$8, %r14d
.L3935:
	vmovq	%rcx, %xmm5
	vpinsrq	$1, %rax, %xmm5, %xmm0
	vmovdqu	%xmm0, 192(%r12)
	cmpq	%rax, %rcx
	jb	.L4132
.L3936:
	movl	48(%r12), %esi
	testl	%esi, %esi
	je	.L4102
	movl	52(%r12), %edx
	movq	40(%r12), %rdi
	leaq	56(%r12), %rbx
	movq	%rbx, %rsi
	call	*16(%r12)
	movq	192(%r12), %rdx
	subq	208(%r12), %rdx
	addl	%edx, 184(%r12)
	leaq	57(%r12), %rdx
	testl	%eax, %eax
	je	.L4133
	cltq
	addq	%rax, %rbx
	movzbl	56(%r12), %eax
	addl	%eax, %r14d
.L3938:
	vmovq	%rdx, %xmm6
	vpinsrq	$1, %rbx, %xmm6, %xmm0
	vmovdqu	%xmm0, 192(%r12)
.L4102:
	movq	(%r15), %r12
	jmp	.L3933
.L4113:
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	leaq	56(%rbx), %r12
	movq	%r12, %rsi
	call	*16(%rbx)
	movslq	%eax, %rdx
	movq	192(%rbx), %rax
	subq	208(%rbx), %rax
	addl	%eax, 184(%rbx)
	leaq	57(%rbx), %rax
	vmovq	%rax, %xmm0
	testl	%edx, %edx
	jne	.L3807
	vpunpcklqdq	%xmm0, %xmm0, %xmm0
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	vmovdqu	%xmm0, 192(%rbx)
	movl	$0, 18516(%r15)
	jmp	.L3808
.L3819:
	cltq
	addq	%rax, %r14
	movzbl	56(%r12), %eax
	movl	%eax, %esi
	jmp	.L3820
.L3816:
	addq	%r13, %r14
	movzbl	56(%r12), %r13d
	jmp	.L3817
.L4107:
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	leaq	56(%rbx), %r12
	movq	%r12, %rsi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	leaq	57(%rbx), %rcx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	vmovq	%rcx, %xmm0
	testl	%eax, %eax
	jne	.L3792
	vpunpcklqdq	%xmm0, %xmm0, %xmm0
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	vmovdqu	%xmm0, 192(%rbx)
	jmp	.L3791
.L3982:
	xorl	%ecx, %ecx
	jmp	.L3822
.L3954:
	cltq
	addq	%rax, %r12
	vpinsrq	$1, %r12, %xmm0, %xmm0
	movzbl	56(%rbx), %edx
	vmovdqu	%xmm0, 192(%rbx)
	jmp	.L3952
.L4133:
	movl	$0, 48(%r12)
	movb	$0, 56(%r12)
	movq	%rdx, %rbx
	jmp	.L3938
.L4130:
	movl	$0, 48(%r12)
	movb	$0, 56(%r12)
	movq	%rdx, %rbx
	jmp	.L3946
.L4131:
	movl	$0, 48(%r12)
	movb	$0, 56(%r12)
	movq	%rcx, %rax
	jmp	.L3935
.L4128:
	movl	$0, 48(%r12)
	movb	$0, 56(%r12)
	movq	%rcx, %rax
	jmp	.L3943
.L3792:
	cltq
	addq	%rax, %r12
	vpinsrq	$1, %r12, %xmm0, %xmm0
	movzbl	56(%rbx), %edx
	vmovdqu	%xmm0, 192(%rbx)
	jmp	.L3790
.L3807:
	movzbl	56(%rbx), %eax
	addq	%rdx, %r12
	vpinsrq	$1, %r12, %xmm0, %xmm0
	leal	-1(%rax), %ecx
	vmovdqu	%xmm0, 192(%rbx)
	jmp	.L3805
.L3961:
	movq	(%r14), %rdx
	movl	8(%rdx), %eax
	testl	%eax, %eax
	jle	.L3962
	movl	$0, -200(%rbp)
	leaq	18092(%r14), %r13
	movq	%r14, %r15
	movq	%r13, %r14
.L3970:
	movl	16(%r14), %ebx
	leal	7(%rbx), %r12d
	movl	20(%r14), %ebx
	sarl	$3, %r12d
	leal	7(%rbx), %ecx
	sarl	$3, %ecx
	movl	%ecx, -208(%rbp)
	testl	%ecx, %ecx
	jle	.L3964
	testl	%r12d, %r12d
	jle	.L3969
	xorl	%ebx, %ebx
	movslq	%r12d, %r12
.L3968:
	xorl	%r13d, %r13d
	jmp	.L3967
	.p2align 4,,10
	.p2align 3
.L4135:
	vmovdqu	(%rax), %ymm1
	vpmullw	(%rsi), %ymm1, %ymm0
	vmovdqu	%ymm0, (%rax)
	vmovdqu	32(%rsi), %ymm2
	vpmullw	32(%rax), %ymm2, %ymm0
	vmovdqu	%ymm0, 32(%rax)
	vmovdqu	64(%rsi), %ymm3
	vpmullw	64(%rax), %ymm3, %ymm0
	vmovdqu	%ymm0, 64(%rax)
	vmovdqu	96(%rsi), %ymm0
	vpmullw	96(%rax), %ymm0, %ymm0
	vmovdqu	%ymm0, 96(%rax)
	vzeroupper
.L3966:
	movl	24(%r14), %esi
	movq	%r8, %rdx
	movl	%esi, %eax
	imull	%ebx, %eax
	sall	$3, %eax
	cltq
	leaq	(%rax,%r13,8), %rdi
	addq	36(%r14), %rdi
	incq	%r13
	call	*18544(%r15)
	cmpq	%r12, %r13
	je	.L4134
.L3967:
	movl	76(%r14), %edx
	movslq	(%r14), %rdi
	imull	%ebx, %edx
	movq	68(%r14), %rax
	addq	$105, %rdi
	leal	(%rdx,%r13), %esi
	movslq	%edx, %rdx
	sall	$6, %esi
	addq	%r13, %rdx
	movslq	%esi, %rsi
	salq	$7, %rdx
	leaq	(%rax,%rsi,2), %r8
	salq	$7, %rdi
	addq	%rdx, %rax
	leaq	8(%r15,%rdi), %rsi
	movq	%rax, %rdx
	leaq	10(%r15,%rdi), %rdi
	subq	%rdi, %rdx
	cmpq	$28, %rdx
	ja	.L4135
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L3965:
	movzwl	(%r8,%rax), %edx
	imulw	(%rsi,%rax), %dx
	movw	%dx, (%r8,%rax)
	addq	$2, %rax
	cmpq	$128, %rax
	jne	.L3965
	jmp	.L3966
.L4134:
	incl	%ebx
	cmpl	%ebx, -208(%rbp)
	jne	.L3968
	movq	(%r15), %rdx
.L3969:
	movl	8(%rdx), %eax
.L3964:
	incl	-200(%rbp)
	addq	$96, %r14
	movl	-200(%rbp), %ecx
	cmpl	%eax, %ecx
	jl	.L3970
	jmp	.L3962
	.p2align 4,,10
	.p2align 3
.L4111:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rbx)
	movzbl	(%rax), %edx
.L3798:
	cmpb	$-1, %dl
	je	.L3801
	jmp	.L3795
	.p2align 4,,10
	.p2align 3
.L4123:
	movl	$3, %ecx
	jmp	.L3822
.L3987:
	movl	$3, %ecx
	jmp	.L3821
.L3986:
	movl	$2, %ecx
	jmp	.L3822
.L3985:
	movl	$2, %ecx
	jmp	.L3821
.L3984:
	movl	$1, %ecx
	jmp	.L3822
.L3983:
	movl	$1, %ecx
	jmp	.L3821
.L4125:
	leaq	.LC262(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L3786
.L4124:
	leaq	.LC261(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L3786
.L3825:
	orl	18484(%r15), %edx
	movl	%edx, -200(%rbp)
	je	.L4136
.L3826:
	leaq	.LC263(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L3786
.L3799:
	addq	%rsi, %r12
	vpinsrq	$1, %r12, %xmm0, %xmm0
	movzbl	56(%rbx), %edx
	vmovdqu	%xmm0, 192(%rbx)
	jmp	.L3798
.L3977:
	movl	$255, %esi
	jmp	.L3800
.L3948:
	leaq	.LC265(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L3786
.L4118:
	leaq	.LC264(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L3786
.L4136:
	testb	%cl, %cl
	jne	.L3826
	movl	18536(%r15), %eax
	movl	$63, 18488(%r15)
	movl	$0, 18476(%r15)
	movl	$0, 18392(%r15)
	movl	$0, 18296(%r15)
	movl	$0, 18200(%r15)
	movl	$0, 18104(%r15)
	movq	$0, 18464(%r15)
	movb	$-1, 18472(%r15)
	testl	%eax, %eax
	je	.L4137
	movl	%eax, 18540(%r15)
	movl	$0, 18500(%r15)
.L3972:
	cmpl	$1, 18516(%r15)
	je	.L3831
	movl	18068(%r15), %edx
	testl	%edx, %edx
	jle	.L3846
	leaq	6728(%r15), %rcx
	movl	$0, -216(%rbp)
	movq	%rcx, -248(%rbp)
	movl	18064(%r15), %eax
.L3833:
	movl	$0, -208(%rbp)
	testl	%eax, %eax
	jle	.L3864
.L3863:
	movl	18516(%r15), %eax
	movq	$0, -256(%rbp)
	testl	%eax, %eax
	jle	.L3861
.L3855:
	movq	-256(%rbp), %rbx
	movslq	18520(%r15,%rbx,4), %rdx
	leaq	(%rdx,%rdx,2), %r10
	salq	$5, %r10
	leaq	(%r15,%r10), %r14
	movl	18088(%r14), %ebx
	movl	%edx, -236(%rbp)
	testl	%ebx, %ebx
	jle	.L3848
	movl	$0, -224(%rbp)
	movl	18084(%r14), %r12d
.L3849:
	testl	%r12d, %r12d
	jle	.L3854
	leaq	8(%r15), %rax
	movq	%rax, -232(%rbp)
	leaq	-192(%rbp), %rax
	movq	%rax, -200(%rbp)
	xorl	%r13d, %r13d
	jmp	.L3852
	.p2align 4,,10
	.p2align 3
.L4138:
	movl	18116(%r14), %esi
	movslq	%r12d, %r12
	imull	%esi, %ebx
	movq	-200(%rbp), %rdx
	incl	%r13d
	leal	0(,%rbx,8), %edi
	movslq	%edi, %rdi
	addq	%r12, %rdi
	addq	18128(%r14), %rdi
	call	*18544(%r15)
	movl	18084(%r14), %r12d
	movl	18088(%r14), %ebx
	cmpl	%r13d, %r12d
	jle	.L3851
.L3852:
	movslq	18100(%r14), %rax
	movq	-248(%rbp), %rcx
	movq	%rax, %rsi
	imulq	$1680, %rax, %rax
	movslq	18096(%r14), %rdx
	subq	$8, %rsp
	addq	%rax, %rcx
	movslq	18092(%r14), %rax
	imulq	$1680, %rdx, %rdx
	salq	$7, %rax
	leaq	13448(%r15,%rax), %rax
	pushq	%rax
	imull	-208(%rbp), %r12d
	imull	-216(%rbp), %ebx
	salq	$10, %rsi
	leaq	13960(%r15,%rsi), %r8
	movl	-236(%rbp), %r9d
	movq	-200(%rbp), %rsi
	addq	-232(%rbp), %rdx
	movq	%r15, %rdi
	addl	%r13d, %r12d
	addl	-224(%rbp), %ebx
	call	stbi__jpeg_decode_block
	popq	%r11
	sall	$3, %r12d
	popq	%rdx
	testl	%eax, %eax
	jne	.L4138
	jmp	.L4104
.L3851:
	incl	-224(%rbp)
	movl	-224(%rbp), %eax
	cmpl	%ebx, %eax
	jl	.L3849
.L3854:
	movl	18516(%r15), %eax
.L3848:
	incq	-256(%rbp)
	movq	-256(%rbp), %rcx
	cmpl	%ecx, %eax
	jg	.L3855
.L3861:
	movl	18540(%r15), %eax
	decl	%eax
	movl	%eax, 18540(%r15)
	testl	%eax, %eax
	jle	.L4139
.L3856:
	incl	-208(%rbp)
	movl	18064(%r15), %eax
	movl	-208(%rbp), %ecx
	cmpl	%eax, %ecx
	jl	.L3863
	movl	18068(%r15), %edx
.L3864:
	incl	-216(%rbp)
	movl	-216(%rbp), %ecx
	cmpl	%edx, %ecx
	jl	.L3833
.L4100:
	movzbl	18472(%r15), %eax
.L3905:
	cmpb	$-1, %al
	jne	.L3922
.L3846:
	movq	(%r15), %r12
.L3971:
	cmpq	$0, 16(%r12)
	je	.L3928
	movq	40(%r12), %rdi
	call	*32(%r12)
	testl	%eax, %eax
	je	.L3929
	movl	48(%r12), %edi
	testl	%edi, %edi
	je	.L4103
.L3928:
	movq	200(%r12), %rax
	cmpq	%rax, 192(%r12)
	jnb	.L4103
.L3929:
	movq	(%r15), %r12
	movq	192(%r12), %rax
	cmpq	200(%r12), %rax
	jb	.L4140
	movl	48(%r12), %r8d
	movq	16(%r12), %rax
	testl	%r8d, %r8d
	je	.L3971
	movl	52(%r12), %edx
	movq	40(%r12), %rdi
	leaq	56(%r12), %rbx
	movq	%rbx, %rsi
	call	*%rax
	movq	192(%r12), %rdx
	leaq	57(%r12), %rcx
	subq	208(%r12), %rdx
	addl	%edx, 184(%r12)
	vmovq	%rcx, %xmm0
	testl	%eax, %eax
	jne	.L3926
	movb	$0, 56(%r12)
	vpunpcklqdq	%xmm0, %xmm0, %xmm0
	movl	$0, 48(%r12)
	vmovdqu	%xmm0, 192(%r12)
	movq	(%r15), %r12
	jmp	.L3971
.L4109:
	incl	%r12d
	cmpl	%eax, %r12d
	jl	.L3910
.L3913:
	movl	18516(%r15), %edx
.L3909:
	incq	-216(%rbp)
	movq	-216(%rbp), %rax
	cmpl	%eax, %edx
	jg	.L3914
.L3919:
	movl	18540(%r15), %eax
	decl	%eax
	movl	%eax, 18540(%r15)
	testl	%eax, %eax
	jle	.L4141
.L3915:
	incl	-200(%rbp)
	movl	18064(%r15), %eax
	movl	-200(%rbp), %ecx
	cmpl	%eax, %ecx
	jl	.L3920
	movl	18068(%r15), %edx
.L3921:
	incl	-208(%rbp)
	movl	-208(%rbp), %ecx
	cmpl	%edx, %ecx
	jl	.L3866
	jmp	.L4100
	.p2align 4,,10
	.p2align 3
.L4140:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%r12)
	movzbl	(%rax), %edx
.L3924:
	cmpb	$-1, %dl
	jne	.L3971
	movq	%r12, %rdi
	call	stbi__get8
	movb	%al, 18472(%r15)
	jmp	.L3927
.L3865:
	movslq	18520(%r15), %rax
	movl	$0, -236(%rbp)
	movl	%eax, -240(%rbp)
	leaq	(%rax,%rax,2), %rax
	salq	$5, %rax
	leaq	(%r15,%rax), %rcx
	movl	18108(%rcx), %eax
	movq	%rcx, -280(%rbp)
	addl	$7, %eax
	sarl	$3, %eax
	movl	%eax, -256(%rbp)
	movl	18112(%rcx), %eax
	movq	%r15, %r13
	movl	%eax, -200(%rbp)
	addl	$7, %eax
	sarl	$3, %eax
	movl	%eax, -272(%rbp)
	testl	%eax, %eax
	jle	.L3846
.L3867:
	movl	-256(%rbp), %r9d
	movl	$0, -200(%rbp)
	movq	-280(%rbp), %r14
	testl	%r9d, %r9d
	jg	.L3907
	jmp	.L3908
	.p2align 4,,10
	.p2align 3
.L4143:
	movslq	18096(%r14), %rax
	movl	-240(%rbp), %ecx
	imulq	$1680, %rax, %rax
	movq	%r12, %rsi
	movq	%r13, %rdi
	leaq	8(%r13,%rax), %rdx
	call	stbi__jpeg_decode_block_prog_dc
	testl	%eax, %eax
	je	.L4104
.L3870:
	movl	18540(%r13), %eax
	decl	%eax
	movl	%eax, 18540(%r13)
	testl	%eax, %eax
	jle	.L4142
.L3903:
	incl	-200(%rbp)
	movl	-200(%rbp), %eax
	cmpl	%eax, -256(%rbp)
	je	.L3908
.L3907:
	movl	-236(%rbp), %eax
	movq	18160(%r14), %rdx
	imull	18168(%r14), %eax
	movl	18484(%r13), %r15d
	addl	-200(%rbp), %eax
	sall	$6, %eax
	cltq
	leaq	(%rdx,%rax,2), %r12
	testl	%r15d, %r15d
	je	.L4143
	movslq	18100(%r14), %rsi
	movl	18492(%r13), %r10d
	imulq	$1680, %rsi, %rax
	movl	18500(%r13), %ecx
	leaq	6728(%r13,%rax), %rax
	movq	%rax, -224(%rbp)
	movl	18496(%r13), %eax
	testl	%r10d, %r10d
	jne	.L3871
	testl	%ecx, %ecx
	jne	.L4144
	salq	$10, %rsi
	movl	$1, %ecx
	movq	%r14, -208(%rbp)
	shlx	%eax, %ecx, %eax
	leaq	13960(%rsi), %rbx
	movl	%eax, %r14d
	jmp	.L3882
	.p2align 4,,10
	.p2align 3
.L3873:
	movl	18464(%r13), %edi
	movl	%edi, %eax
	shrl	$23, %eax
	leaq	0(%r13,%rax,2), %rax
	movswl	(%rax,%rbx), %ecx
	movl	%ecx, %esi
	testl	%ecx, %ecx
	je	.L3874
	movl	%ecx, %eax
	sarl	$4, %eax
	andl	$15, %eax
	addl	%r15d, %eax
	andl	$15, %esi
	sarl	$8, %ecx
	shlx	%esi, %edi, %edi
	imull	%r14d, %ecx
	movl	%edi, 18464(%r13)
	leal	1(%rax), %r15d
	leaq	stbi__jpeg_dezigzag(%rip), %rdi
	cltq
	movzbl	(%rdi,%rax), %eax
	subl	%esi, 18468(%r13)
	movw	%cx, (%r12,%rax,2)
.L3875:
	cmpl	%r15d, 18488(%r13)
	jl	.L4145
.L3882:
	cmpl	$15, 18468(%r13)
	jg	.L3873
	movq	%r13, %rdi
	call	stbi__grow_buffer_unsafe
	jmp	.L3873
.L3874:
	movq	-224(%rbp), %rsi
	movq	%r13, %rdi
	call	stbi__jpeg_huff_decode
	movl	%eax, %ecx
	testl	%eax, %eax
	js	.L3891
	sarl	$4, %eax
	andl	$15, %ecx
	jne	.L3877
	cmpl	$14, %eax
	jle	.L4146
	addl	$16, %r15d
	cmpl	%r15d, 18488(%r13)
	jge	.L3882
.L4145:
	movq	-208(%rbp), %r14
	jmp	.L3870
.L4142:
	cmpl	$23, 18468(%r13)
	jle	.L4147
.L3904:
	movzbl	18472(%r13), %eax
	leal	48(%rax), %edx
	cmpb	$7, %dl
	ja	.L4094
	movl	18536(%r13), %eax
	movl	$2147483647, %edx
	testl	%eax, %eax
	cmove	%edx, %eax
	movl	$0, 18476(%r13)
	movl	$0, 18392(%r13)
	movl	$0, 18296(%r13)
	movl	$0, 18200(%r13)
	movl	$0, 18104(%r13)
	movq	$0, 18464(%r13)
	movb	$-1, 18472(%r13)
	movl	%eax, 18540(%r13)
	movl	$0, 18500(%r13)
	jmp	.L3903
.L3877:
	addl	%r15d, %eax
	leaq	stbi__jpeg_dezigzag(%rip), %rsi
	leal	1(%rax), %r15d
	cltq
	movzbl	(%rsi,%rax), %r8d
	movl	18468(%r13), %esi
	cmpl	%esi, %ecx
	jg	.L4148
.L3881:
	movl	18464(%r13), %eax
	movslq	%ecx, %r10
	leaq	stbi__bmask(%rip), %rdx
	movl	(%rdx,%r10,4), %r9d
	movl	%eax, %edi
	shrl	$31, %eax
	roll	%cl, %edi
	subl	%ecx, %esi
	decl	%eax
	leaq	stbi__jbias(%rip), %rcx
	andn	%edi, %r9d, %r11d
	andl	(%rcx,%r10,4), %eax
	andl	%r9d, %edi
	addl	%edi, %eax
	imull	%r14d, %eax
	movl	%r11d, 18464(%r13)
	movl	%esi, 18468(%r13)
	movw	%ax, (%r12,%r8,2)
	jmp	.L3875
.L3871:
	movl	$1, %esi
	shlx	%eax, %esi, %eax
	movl	%eax, -248(%rbp)
	movw	%ax, -216(%rbp)
	testl	%ecx, %ecx
	jne	.L4082
	cwtl
	movl	%eax, -268(%rbp)
	movq	%r14, -264(%rbp)
	movq	%r12, %r14
	.p2align 4,,10
	.p2align 3
.L3884:
	movq	-224(%rbp), %rsi
	movq	%r13, %rdi
	call	stbi__jpeg_huff_decode
	movl	%eax, %ebx
	testl	%eax, %eax
	js	.L3891
	movl	%eax, %r12d
	sarl	$4, %r12d
	andl	$15, %ebx
	jne	.L3892
	cmpl	$14, %r12d
	jg	.L3893
	movl	$1, %eax
	shlx	%r12d, %eax, %eax
	decl	%eax
	movl	%eax, 18500(%r13)
	testl	%r12d, %r12d
	jne	.L4149
	movl	$64, %r12d
	.p2align 4,,10
	.p2align 3
.L3893:
	movl	18488(%r13), %r10d
	cmpl	%r10d, %r15d
	jg	.L4099
	movslq	%r15d, %rax
	leaq	stbi__jpeg_dezigzag(%rip), %rcx
	addq	%rcx, %rax
	movl	%ebx, -232(%rbp)
	movq	%r14, %rbx
	movl	%r12d, %r14d
	movq	%rax, %r12
	jmp	.L3902
	.p2align 4,,10
	.p2align 3
.L4152:
	movl	18468(%r13), %eax
	testl	%eax, %eax
	jle	.L4150
.L3897:
	movl	18464(%r13), %edx
	decl	%eax
	leal	(%rdx,%rdx), %edi
	movl	%edi, 18464(%r13)
	movl	%eax, 18468(%r13)
	testl	%edx, %edx
	js	.L4151
.L3898:
	incq	%r12
	cmpl	%r10d, %r15d
	jg	.L4099
.L3902:
	movzbl	(%r12), %eax
	incl	%r15d
	leaq	(%rbx,%rax,2), %r8
	cmpw	$0, (%r8)
	jne	.L4152
	testl	%r14d, %r14d
	je	.L4153
	decl	%r14d
	jmp	.L3898
	.p2align 4,,10
	.p2align 3
.L4151:
	movzwl	(%r8), %eax
	testw	%ax, -216(%rbp)
	jne	.L3898
	movl	-248(%rbp), %ecx
	movl	%eax, %edi
	subl	%ecx, %edi
	leal	(%rax,%rcx), %edx
	testw	%ax, %ax
	movl	%edi, %eax
	cmovg	%edx, %eax
	movw	%ax, (%r8)
	jmp	.L3898
	.p2align 4,,10
	.p2align 3
.L4150:
	movq	%r13, %rdi
	movq	%r8, -208(%rbp)
	call	stbi__grow_buffer_unsafe
	movl	18468(%r13), %eax
	movl	18488(%r13), %r10d
	movq	-208(%rbp), %r8
	jmp	.L3897
.L4153:
	movq	%rbx, %r14
	movl	-232(%rbp), %ebx
	movw	%bx, (%r8)
	cmpl	%r15d, %r10d
	jge	.L3884
.L4099:
	movq	-264(%rbp), %r14
	jmp	.L3870
.L3892:
	cmpl	$1, %ebx
	jne	.L3891
	movl	18468(%r13), %eax
	testl	%eax, %eax
	jle	.L4154
.L3895:
	decl	%eax
	movl	%eax, 18468(%r13)
	movl	-268(%rbp), %eax
	movl	18464(%r13), %esi
	movl	%eax, %ebx
	negl	%ebx
	leal	(%rsi,%rsi), %edi
	testl	%esi, %esi
	movl	%edi, 18464(%r13)
	cmovs	%eax, %ebx
	jmp	.L3893
.L4147:
	movq	%r13, %rdi
	call	stbi__grow_buffer_unsafe
	jmp	.L3904
.L4154:
	movq	%r13, %rdi
	call	stbi__grow_buffer_unsafe
	movl	18468(%r13), %eax
	jmp	.L3895
.L4082:
	decl	%ecx
	movl	%ecx, 18500(%r13)
	movl	18488(%r13), %ecx
	cmpl	%ecx, %r15d
	jg	.L3870
	movslq	%r15d, %rbx
	jmp	.L3890
.L3885:
	incq	%rbx
	cmpl	%ebx, %ecx
	jl	.L3870
.L3890:
	leaq	stbi__jpeg_dezigzag(%rip), %rax
	movzbl	(%rax,%rbx), %eax
	leaq	(%r12,%rax,2), %r15
	cmpw	$0, (%r15)
	je	.L3885
	movl	18468(%r13), %eax
	testl	%eax, %eax
	jle	.L4155
.L3886:
	movl	18464(%r13), %edx
	decl	%eax
	leal	(%rdx,%rdx), %esi
	movl	%esi, 18464(%r13)
	movl	%eax, 18468(%r13)
	testl	%edx, %edx
	jns	.L3885
	movzwl	(%r15), %eax
	testw	%ax, -216(%rbp)
	jne	.L3885
	movl	-248(%rbp), %edi
	movl	%eax, %esi
	subl	%edi, %esi
	leal	(%rax,%rdi), %edx
	testw	%ax, %ax
	movl	%esi, %eax
	cmovg	%edx, %eax
	movw	%ax, (%r15)
	jmp	.L3885
.L4155:
	movq	%r13, %rdi
	call	stbi__grow_buffer_unsafe
	movl	18468(%r13), %eax
	movl	18488(%r13), %ecx
	jmp	.L3886
.L4149:
	movl	18468(%r13), %edi
	cmpl	%edi, %r12d
	jg	.L4156
.L3894:
	movl	18464(%r13), %esi
	movl	%r12d, %ecx
	roll	%cl, %esi
	movslq	%r12d, %r8
	leaq	stbi__bmask(%rip), %rcx
	movl	(%rcx,%r8,4), %r8d
	subl	%r12d, %edi
	andn	%esi, %r8d, %r10d
	andl	%r8d, %esi
	addl	%esi, %eax
	movl	%r10d, 18464(%r13)
	movl	%edi, 18468(%r13)
	movl	%eax, 18500(%r13)
	movl	$64, %r12d
	jmp	.L3893
.L3891:
	leaq	.LC227(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L3786
.L4148:
	movq	%r13, %rdi
	movb	%r8b, -232(%rbp)
	movl	%ecx, -216(%rbp)
	call	stbi__grow_buffer_unsafe
	movl	18468(%r13), %esi
	movzbl	-232(%rbp), %r8d
	movl	-216(%rbp), %ecx
	jmp	.L3881
.L4144:
	decl	%ecx
	movl	%ecx, 18500(%r13)
	jmp	.L3870
.L3831:
	movslq	18520(%r15), %rax
	leaq	(%rax,%rax,2), %r10
	salq	$5, %r10
	leaq	(%r15,%r10), %r13
	movq	%rax, %r14
	movl	18108(%r13), %eax
	addl	$7, %eax
	sarl	$3, %eax
	movl	%eax, -232(%rbp)
	movl	%eax, %ecx
	movl	18112(%r13), %eax
	addl	$7, %eax
	sarl	$3, %eax
	movl	%eax, -236(%rbp)
	testl	%eax, %eax
	jle	.L3846
	leal	-1(%rcx), %eax
	leaq	8(,%rax,8), %rax
	movq	%rax, -224(%rbp)
	movq	%r13, %rax
	movq	%r15, %r13
	movl	%r14d, %r15d
	movq	%rax, %r14
.L3835:
	movl	-232(%rbp), %ecx
	testl	%ecx, %ecx
	jle	.L3845
	leaq	6728(%r13), %rax
	movq	%rax, -208(%rbp)
	leaq	8(%r13), %rax
	movq	%rax, -216(%rbp)
	xorl	%ebx, %ebx
	leaq	-192(%rbp), %r12
	jmp	.L3842
.L3837:
	addq	$8, %rbx
	cmpq	-224(%rbp), %rbx
	je	.L3845
.L3842:
	movslq	18100(%r14), %rax
	movq	-208(%rbp), %rcx
	movq	%rax, %rsi
	imulq	$1680, %rax, %rax
	movslq	18096(%r14), %rdx
	subq	$8, %rsp
	addq	%rax, %rcx
	movslq	18092(%r14), %rax
	imulq	$1680, %rdx, %rdx
	salq	$7, %rax
	leaq	13448(%r13,%rax), %rax
	pushq	%rax
	salq	$10, %rsi
	leaq	13960(%r13,%rsi), %r8
	movq	%r13, %rdi
	movq	%r12, %rsi
	addq	-216(%rbp), %rdx
	movl	%r15d, %r9d
	call	stbi__jpeg_decode_block
	popq	%rsi
	popq	%rdi
	testl	%eax, %eax
	je	.L4104
	movl	18116(%r14), %esi
	movl	-200(%rbp), %edi
	movq	%r12, %rdx
	imull	%esi, %edi
	sall	$3, %edi
	movslq	%edi, %rdi
	addq	%rbx, %rdi
	addq	18128(%r14), %rdi
	call	*18544(%r13)
	movl	18540(%r13), %eax
	decl	%eax
	movl	%eax, 18540(%r13)
	testl	%eax, %eax
	jg	.L3837
	cmpl	$23, 18468(%r13)
	jle	.L4157
.L3838:
	movzbl	18472(%r13), %eax
	leal	48(%rax), %edx
	cmpb	$7, %dl
	ja	.L4094
	movl	18536(%r13), %eax
	movl	$2147483647, %ecx
	testl	%eax, %eax
	cmove	%ecx, %eax
	addq	$8, %rbx
	movl	$0, 18476(%r13)
	movl	$0, 18392(%r13)
	movl	$0, 18296(%r13)
	movl	$0, 18200(%r13)
	movl	$0, 18104(%r13)
	movq	$0, 18464(%r13)
	movb	$-1, 18472(%r13)
	movl	%eax, 18540(%r13)
	movl	$0, 18500(%r13)
	cmpq	-224(%rbp), %rbx
	jne	.L3842
.L3845:
	incl	-200(%rbp)
	movl	-200(%rbp), %eax
	cmpl	%eax, -236(%rbp)
	jne	.L3835
.L4101:
	movzbl	18472(%r13), %eax
	movq	%r13, %r15
	jmp	.L3905
	.p2align 4,,10
	.p2align 3
.L4157:
	movq	%r13, %rdi
	call	stbi__grow_buffer_unsafe
	jmp	.L3838
.L4156:
	movq	%r13, %rdi
	call	stbi__grow_buffer_unsafe
	movl	18500(%r13), %eax
	movl	18468(%r13), %edi
	jmp	.L3894
.L3908:
	incl	-236(%rbp)
	movl	-236(%rbp), %eax
	cmpl	%eax, -272(%rbp)
	jne	.L3867
	jmp	.L4101
	.p2align 4,,10
	.p2align 3
.L4094:
	movq	%r13, %r15
	jmp	.L3905
.L4146:
	movl	%eax, %ecx
	movl	$1, %eax
	shlx	%ecx, %eax, %eax
	movq	-208(%rbp), %r14
	movl	%eax, 18500(%r13)
	testl	%ecx, %ecx
	jne	.L4158
.L3879:
	decl	%eax
	movl	%eax, 18500(%r13)
	jmp	.L3870
.L3926:
	cltq
	addq	%rax, %rbx
	vpinsrq	$1, %rbx, %xmm0, %xmm0
	movzbl	56(%r12), %edx
	vmovdqu	%xmm0, 192(%r12)
	movq	(%r15), %r12
	jmp	.L3924
.L4158:
	movl	18468(%r13), %esi
	cmpl	%esi, %ecx
	jg	.L4159
.L3880:
	movl	18464(%r13), %edx
	movslq	%ecx, %rdi
	leaq	stbi__bmask(%rip), %rbx
	movl	(%rbx,%rdi,4), %edi
	roll	%cl, %edx
	andn	%edx, %edi, %r8d
	subl	%ecx, %esi
	andl	%edi, %edx
	movl	%r8d, 18464(%r13)
	movl	%esi, 18468(%r13)
	addl	%edx, %eax
	jmp	.L3879
.L3980:
	xorl	%esi, %esi
	jmp	.L3815
.L4108:
	call	__stack_chk_fail@PLT
	.p2align 4,,10
	.p2align 3
.L4159:
	movq	%r13, %rdi
	movl	%ecx, -208(%rbp)
	call	stbi__grow_buffer_unsafe
	movl	18500(%r13), %eax
	movl	18468(%r13), %esi
	movl	-208(%rbp), %ecx
	jmp	.L3880
.L4137:
	movl	$2147483647, 18540(%r15)
	movl	$0, 18500(%r15)
	jmp	.L3972
.L4139:
	cmpl	$23, 18468(%r15)
	jle	.L4160
.L3857:
	movzbl	18472(%r15), %eax
	leal	48(%rax), %edx
	cmpb	$7, %dl
	ja	.L3905
	movl	18536(%r15), %eax
	movl	$2147483647, %edx
	testl	%eax, %eax
	cmove	%edx, %eax
	movl	$0, 18476(%r15)
	movl	$0, 18392(%r15)
	movl	$0, 18296(%r15)
	movl	$0, 18200(%r15)
	movl	$0, 18104(%r15)
	movq	$0, 18464(%r15)
	movb	$-1, 18472(%r15)
	movl	%eax, 18540(%r15)
	movl	$0, 18500(%r15)
	jmp	.L3856
.L4141:
	cmpl	$23, 18468(%r15)
	jle	.L4161
.L3916:
	movzbl	18472(%r15), %eax
	leal	48(%rax), %edx
	cmpb	$7, %dl
	ja	.L3905
	movl	18536(%r15), %eax
	movl	$2147483647, %ecx
	testl	%eax, %eax
	cmove	%ecx, %eax
	movl	$0, 18476(%r15)
	movl	$0, 18392(%r15)
	movl	$0, 18296(%r15)
	movl	$0, 18200(%r15)
	movl	$0, 18104(%r15)
	movq	$0, 18464(%r15)
	movb	$-1, 18472(%r15)
	movl	%eax, 18540(%r15)
	movl	$0, 18500(%r15)
	jmp	.L3915
.L4085:
	movl	$2147483647, 18540(%r15)
	movl	$0, 18500(%r15)
	jmp	.L3973
.L4160:
	movq	%r15, %rdi
	call	stbi__grow_buffer_unsafe
	jmp	.L3857
.L4161:
	movq	%r15, %rdi
	call	stbi__grow_buffer_unsafe
	jmp	.L3916
	.cfi_endproc
.LFE663:
	.size	stbi__decode_jpeg_image, .-stbi__decode_jpeg_image
	.section	.rodata.str1.1
.LC266:
	.string	"bad BMP"
.LC267:
	.string	"unknown BMP"
.LC268:
	.string	"BMP RLE"
.LC269:
	.string	"BMP JPEG/PNG"
	.text
	.p2align 4
	.type	stbi__bmp_parse_header.part.0, @function
stbi__bmp_parse_header.part.0:
.LFB842:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%rsi, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	call	stbi__get32le
	movq	192(%rbp), %rdx
	movq	200(%rbp), %rax
	cmpq	%rax, %rdx
	jb	.L4228
	movl	48(%rbp), %edi
	testl	%edi, %edi
	jne	.L4229
.L4181:
	movq	%rbp, %rdi
	call	stbi__get32le
	movl	%eax, 4(%rbx)
	movq	%rbp, %rdi
	call	stbi__get32le
	movl	%eax, 8(%rbx)
	movl	%eax, %r12d
	movl	4(%rbx), %eax
	vpxor	%xmm0, %xmm0, %xmm0
	movl	$14, 32(%rbx)
	vmovdqu	%xmm0, 12(%rbx)
	testl	%eax, %eax
	js	.L4189
	cmpl	$12, %r12d
	je	.L4223
	cmpl	$40, %r12d
	je	.L4186
	movl	%r12d, %eax
	andl	$-17, %eax
	cmpl	$108, %eax
	je	.L4187
	cmpl	$56, %r12d
	jne	.L4230
.L4187:
	movq	%rbp, %rdi
	call	stbi__get32le
	movl	%eax, 0(%rbp)
	movq	%rbp, %rdi
	call	stbi__get32le
	movl	%eax, 4(%rbp)
	movq	%rbp, %rdi
	call	stbi__get16le
	cmpl	$1, %eax
	jne	.L4189
	movq	%rbp, %rdi
	call	stbi__get16le
	movl	%eax, (%rbx)
	movq	%rbp, %rdi
	call	stbi__get32le
	movl	%eax, %r13d
	leal	-1(%rax), %eax
	cmpl	$1, %eax
	jbe	.L4231
	cmpl	$3, %r13d
	jg	.L4232
	jne	.L4193
	movl	(%rbx), %eax
	subl	$16, %eax
	andl	$-17, %eax
	jne	.L4189
.L4193:
	movq	%rbp, %rdi
	call	stbi__get32le
	movq	%rbp, %rdi
	call	stbi__get32le
	movq	%rbp, %rdi
	call	stbi__get32le
	movq	%rbp, %rdi
	call	stbi__get32le
	movq	%rbp, %rdi
	call	stbi__get32le
	movl	%r12d, %eax
	andl	$-17, %eax
	cmpl	$40, %eax
	jne	.L4194
	cmpl	$56, %r12d
	je	.L4233
.L4195:
	movl	(%rbx), %eax
	leal	-16(%rax), %edx
	andl	$-17, %edx
	jne	.L4227
	testl	%r13d, %r13d
	je	.L4234
	cmpl	$3, %r13d
	jne	.L4189
	movq	%rbp, %rdi
	call	stbi__get32le
	movl	%eax, 12(%rbx)
	movq	%rbp, %rdi
	call	stbi__get32le
	movl	%eax, 16(%rbx)
	movq	%rbp, %rdi
	call	stbi__get32le
	movl	16(%rbx), %edx
	addl	$12, 32(%rbx)
	movl	%eax, 20(%rbx)
	cmpl	%edx, 12(%rbx)
	jne	.L4227
	cmpl	%edx, %eax
	jne	.L4227
	.p2align 4,,10
	.p2align 3
.L4189:
	leaq	.LC266(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
.L4162:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
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
.L4186:
	.cfi_restore_state
	cmpl	$12, %r12d
	jne	.L4187
.L4223:
	movq	%rbp, %rdi
	call	stbi__get16le
	movl	%eax, 0(%rbp)
	movq	%rbp, %rdi
	call	stbi__get16le
	movl	%eax, 4(%rbp)
	movq	%rbp, %rdi
	call	stbi__get16le
	cmpl	$1, %eax
	jne	.L4189
	movq	%rbp, %rdi
	call	stbi__get16le
	movl	%eax, (%rbx)
.L4227:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	movl	$1, %eax
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L4228:
	.cfi_restore_state
	incq	%rdx
	movq	%rdx, 192(%rbp)
	leaq	1(%rdx), %rcx
	cmpq	%rax, %rdx
	jnb	.L4235
.L4170:
	movq	%rcx, 192(%rbp)
	leaq	1(%rcx), %rdx
	cmpq	%rcx, %rax
	jbe	.L4236
.L4176:
	movq	%rdx, 192(%rbp)
	cmpq	%rdx, %rax
	jbe	.L4237
.L4179:
	incq	%rdx
	movq	%rdx, 192(%rbp)
	jmp	.L4181
	.p2align 4,,10
	.p2align 3
.L4230:
	leaq	.LC267(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L4162
	.p2align 4,,10
	.p2align 3
.L4229:
	movl	52(%rbp), %edx
	movq	40(%rbp), %rdi
	leaq	56(%rbp), %r12
	movq	%r12, %rsi
	call	*16(%rbp)
	movq	192(%rbp), %rdx
	subq	208(%rbp), %rdx
	addl	%edx, 184(%rbp)
	leaq	57(%rbp), %rdx
	testl	%eax, %eax
	jne	.L4166
	movl	$0, 48(%rbp)
	movb	$0, 56(%rbp)
	movq	%rdx, %rax
.L4167:
	movq	%rax, 200(%rbp)
	movq	%rdx, 192(%rbp)
	leaq	1(%rdx), %rcx
	cmpq	%rax, %rdx
	jb	.L4170
.L4235:
	movl	48(%rbp), %esi
	testl	%esi, %esi
	je	.L4181
	movl	52(%rbp), %edx
	movq	40(%rbp), %rdi
	leaq	56(%rbp), %r12
	movq	%r12, %rsi
	call	*16(%rbp)
	movq	192(%rbp), %rdx
	leaq	57(%rbp), %rcx
	subq	208(%rbp), %rdx
	addl	%edx, 184(%rbp)
	testl	%eax, %eax
	jne	.L4171
	movl	$0, 48(%rbp)
	movb	$0, 56(%rbp)
	movq	%rcx, %rax
.L4172:
	movq	%rax, 200(%rbp)
	movq	%rcx, 192(%rbp)
	leaq	1(%rcx), %rdx
	cmpq	%rcx, %rax
	ja	.L4176
.L4236:
	movl	48(%rbp), %ecx
	testl	%ecx, %ecx
	je	.L4181
	movl	52(%rbp), %edx
	movq	40(%rbp), %rdi
	leaq	56(%rbp), %r12
	movq	%r12, %rsi
	call	*16(%rbp)
	movq	192(%rbp), %rdx
	subq	208(%rbp), %rdx
	addl	%edx, 184(%rbp)
	leaq	57(%rbp), %rdx
	testl	%eax, %eax
	jne	.L4177
	movl	$0, 48(%rbp)
	movb	$0, 56(%rbp)
	movq	%rdx, %rax
.L4178:
	movq	%rax, 200(%rbp)
	movq	%rdx, 192(%rbp)
	cmpq	%rdx, %rax
	ja	.L4179
.L4237:
	movl	48(%rbp), %edx
	testl	%edx, %edx
	je	.L4181
	movl	52(%rbp), %edx
	movq	40(%rbp), %rdi
	leaq	56(%rbp), %r12
	movq	%r12, %rsi
	call	*16(%rbp)
	movq	192(%rbp), %rdx
	subq	208(%rbp), %rdx
	addl	%edx, 184(%rbp)
	leaq	57(%rbp), %rdx
	testl	%eax, %eax
	jne	.L4182
	movl	$0, 48(%rbp)
	movb	$0, 56(%rbp)
	movq	%rdx, %r12
.L4183:
	vmovq	%rdx, %xmm1
	vpinsrq	$1, %r12, %xmm1, %xmm0
	vmovdqu	%xmm0, 192(%rbp)
	jmp	.L4181
	.p2align 4,,10
	.p2align 3
.L4194:
	cmpl	$108, %eax
	jne	.L4189
	movq	%rbp, %rdi
	call	stbi__get32le
	movl	%eax, 12(%rbx)
	movq	%rbp, %rdi
	call	stbi__get32le
	movl	%eax, 16(%rbx)
	movq	%rbp, %rdi
	call	stbi__get32le
	movl	%eax, 20(%rbx)
	movq	%rbp, %rdi
	call	stbi__get32le
	movl	%eax, 24(%rbx)
	testl	%r13d, %r13d
	je	.L4238
.L4201:
	movq	%rbp, %rdi
	call	stbi__get32le
	movl	$12, %ebx
	.p2align 4,,10
	.p2align 3
.L4204:
	movq	%rbp, %rdi
	call	stbi__get32le
	decl	%ebx
	jne	.L4204
	cmpl	$124, %r12d
	jne	.L4227
	movq	%rbp, %rdi
	call	stbi__get32le
	movq	%rbp, %rdi
	call	stbi__get32le
	movq	%rbp, %rdi
	call	stbi__get32le
	movq	%rbp, %rdi
	call	stbi__get32le
	movl	$1, %eax
	jmp	.L4162
	.p2align 4,,10
	.p2align 3
.L4182:
	cltq
	addq	%rax, %r12
	jmp	.L4183
	.p2align 4,,10
	.p2align 3
.L4177:
	cltq
	addq	%r12, %rax
	jmp	.L4178
	.p2align 4,,10
	.p2align 3
.L4166:
	cltq
	addq	%r12, %rax
	jmp	.L4167
	.p2align 4,,10
	.p2align 3
.L4171:
	cltq
	addq	%r12, %rax
	jmp	.L4172
	.p2align 4,,10
	.p2align 3
.L4231:
	leaq	.LC268(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L4162
	.p2align 4,,10
	.p2align 3
.L4232:
	leaq	.LC269(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L4162
	.p2align 4,,10
	.p2align 3
.L4233:
	movq	%rbp, %rdi
	call	stbi__get32le
	movq	%rbp, %rdi
	call	stbi__get32le
	movq	%rbp, %rdi
	call	stbi__get32le
	movq	%rbp, %rdi
	call	stbi__get32le
	jmp	.L4195
	.p2align 4,,10
	.p2align 3
.L4234:
	cmpl	$16, %eax
	je	.L4239
	vmovdqa	.LC270(%rip), %xmm0
	movl	$0, 28(%rbx)
	vmovdqu	%xmm0, 12(%rbx)
	movl	$1, %eax
	jmp	.L4162
	.p2align 4,,10
	.p2align 3
.L4238:
	movl	(%rbx), %eax
	cmpl	$16, %eax
	je	.L4240
	cmpl	$32, %eax
	je	.L4241
	vpxor	%xmm0, %xmm0, %xmm0
	vmovdqu	%xmm0, 12(%rbx)
	jmp	.L4201
.L4239:
	movabsq	$4260607589376, %rax
	movq	%rax, 12(%rbx)
	movl	$31, 20(%rbx)
	movl	$1, %eax
	jmp	.L4162
.L4240:
	movabsq	$4260607589376, %rax
	movq	%rax, 12(%rbx)
	movl	$31, 20(%rbx)
	jmp	.L4201
.L4241:
	vmovdqa	.LC270(%rip), %xmm0
	movl	$0, 28(%rbx)
	vmovdqu	%xmm0, 12(%rbx)
	jmp	.L4201
	.cfi_endproc
.LFE842:
	.size	stbi__bmp_parse_header.part.0, .-stbi__bmp_parse_header.part.0
	.section	.rodata.str1.1
.LC271:
	.string	"bad png sig"
.LC272:
	.string	"multiple IHDR"
.LC273:
	.string	"bad IHDR len"
.LC274:
	.string	"1/2/4/8/16-bit only"
.LC275:
	.string	"bad ctype"
.LC276:
	.string	"bad comp method"
.LC277:
	.string	"bad filter method"
.LC278:
	.string	"bad interlace method"
.LC279:
	.string	"0-pixel image"
.LC280:
	.string	"first not IHDR"
.LC281:
	.string	"invalid PLTE"
.LC282:
	.string	"tRNS after IDAT"
.LC283:
	.string	"tRNS before PLTE"
.LC284:
	.string	"bad tRNS len"
.LC285:
	.string	"tRNS with alpha"
.LC286:
	.string	"no PLTE"
.LC287:
	.string	"outofdata"
.LC288:
	.string	"no IDAT"
.LC293:
	.string	"out_n == 2 || out_n == 4"
.LC294:
	.string	"s->img_out_n == 4"
	.text
	.p2align 4
	.type	stbi__parse_png_file, @function
stbi__parse_png_file:
.LFB715:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	pushq	-8(%r10)
	pushq	%rbp
	movq	%rsp, %rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	pushq	%rbx
	subq	$4096, %rsp
	orq	$0, (%rsp)
	subq	$1344, %rsp
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movl	%edx, -5372(%rbp)
	movq	%rdi, -5328(%rbp)
	movl	%esi, -5320(%rbp)
	movq	(%rdi), %r13
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	xorl	%eax, %eax
	movw	%ax, -1091(%rbp)
	movq	192(%r13), %rdx
	movq	200(%r13), %rax
	movb	$0, -1089(%rbp)
	movq	$0, 16(%rdi)
	movq	$0, 8(%rdi)
	movq	$0, 24(%rdi)
	cmpq	%rax, %rdx
	jb	.L4243
	movl	48(%r13), %eax
	testl	%eax, %eax
	jne	.L4518
	.p2align 4,,10
	.p2align 3
.L4244:
	leaq	.LC271(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	movl	$0, -5316(%rbp)
.L4242:
	movq	-56(%rbp), %rax
	subq	%fs:40, %rax
	jne	.L4519
	movl	-5316(%rbp), %eax
	leaq	-48(%rbp), %rsp
	popq	%rbx
	popq	%r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L4243:
	.cfi_restore_state
	leaq	1(%rdx), %rcx
	movq	%rcx, 192(%r13)
	movzbl	(%rdx), %edx
.L4246:
	cmpb	$-119, %dl
	jne	.L4244
	cmpq	%rax, %rcx
	jb	.L4247
	movl	48(%r13), %eax
	testl	%eax, %eax
	je	.L4244
	movl	52(%r13), %edx
	movq	40(%r13), %rdi
	leaq	56(%r13), %rbx
	movq	%rbx, %rsi
	call	*16(%r13)
	movq	192(%r13), %rdx
	subq	208(%r13), %rdx
	addl	%edx, 184(%r13)
	leaq	57(%r13), %rdx
	testl	%eax, %eax
	je	.L4248
	cltq
	addq	%rbx, %rax
	vmovq	%rdx, %xmm5
	vpinsrq	$1, %rax, %xmm5, %xmm0
	movzbl	56(%r13), %ecx
	vmovdqu	%xmm0, 192(%r13)
	jmp	.L4249
	.p2align 4,,10
	.p2align 3
.L4247:
	leaq	1(%rcx), %rdx
	movq	%rdx, 192(%r13)
	movzbl	(%rcx), %ecx
.L4249:
	cmpb	$80, %cl
	jne	.L4244
	cmpq	%rax, %rdx
	jb	.L4250
	movl	48(%r13), %r15d
	testl	%r15d, %r15d
	je	.L4244
	movl	52(%r13), %edx
	movq	40(%r13), %rdi
	leaq	56(%r13), %rbx
	movq	%rbx, %rsi
	call	*16(%r13)
	movq	192(%r13), %rdx
	leaq	57(%r13), %rcx
	subq	208(%r13), %rdx
	addl	%edx, 184(%r13)
	testl	%eax, %eax
	je	.L4251
	cltq
	addq	%rbx, %rax
	vmovq	%rcx, %xmm3
	vpinsrq	$1, %rax, %xmm3, %xmm0
	movzbl	56(%r13), %edx
	vmovdqu	%xmm0, 192(%r13)
	jmp	.L4252
	.p2align 4,,10
	.p2align 3
.L4250:
	leaq	1(%rdx), %rcx
	movq	%rcx, 192(%r13)
	movzbl	(%rdx), %edx
.L4252:
	cmpb	$78, %dl
	jne	.L4244
	cmpq	%rax, %rcx
	jb	.L4253
	movl	48(%r13), %r14d
	testl	%r14d, %r14d
	je	.L4244
	movl	52(%r13), %edx
	movq	40(%r13), %rdi
	leaq	56(%r13), %rbx
	movq	%rbx, %rsi
	call	*16(%r13)
	movq	192(%r13), %rdx
	subq	208(%r13), %rdx
	addl	%edx, 184(%r13)
	leaq	57(%r13), %rdx
	testl	%eax, %eax
	je	.L4254
	cltq
	addq	%rbx, %rax
	vmovq	%rdx, %xmm4
	vpinsrq	$1, %rax, %xmm4, %xmm0
	movzbl	56(%r13), %ecx
	vmovdqu	%xmm0, 192(%r13)
	jmp	.L4255
	.p2align 4,,10
	.p2align 3
.L4253:
	leaq	1(%rcx), %rdx
	movq	%rdx, 192(%r13)
	movzbl	(%rcx), %ecx
.L4255:
	cmpb	$71, %cl
	jne	.L4244
	cmpq	%rax, %rdx
	jb	.L4256
	movl	48(%r13), %r12d
	testl	%r12d, %r12d
	je	.L4244
	movl	52(%r13), %edx
	movq	40(%r13), %rdi
	leaq	56(%r13), %rbx
	movq	%rbx, %rsi
	call	*16(%r13)
	movq	192(%r13), %rdx
	leaq	57(%r13), %rcx
	subq	208(%r13), %rdx
	addl	%edx, 184(%r13)
	testl	%eax, %eax
	je	.L4510
	cltq
	addq	%rbx, %rax
	vmovq	%rcx, %xmm3
	vpinsrq	$1, %rax, %xmm3, %xmm0
	movzbl	56(%r13), %edx
	vmovdqu	%xmm0, 192(%r13)
	jmp	.L4258
	.p2align 4,,10
	.p2align 3
.L4256:
	leaq	1(%rdx), %rcx
	movq	%rcx, 192(%r13)
	movzbl	(%rdx), %edx
.L4258:
	cmpb	$13, %dl
	jne	.L4244
	cmpq	%rax, %rcx
	jb	.L4259
	movl	48(%r13), %ebx
	testl	%ebx, %ebx
	je	.L4244
	movl	52(%r13), %edx
	movq	40(%r13), %rdi
	leaq	56(%r13), %rbx
	movq	%rbx, %rsi
	call	*16(%r13)
	movq	192(%r13), %rdx
	subq	208(%r13), %rdx
	addl	%edx, 184(%r13)
	leaq	57(%r13), %rdx
	testl	%eax, %eax
	je	.L4260
	cltq
	addq	%rbx, %rax
	vmovq	%rdx, %xmm7
	vpinsrq	$1, %rax, %xmm7, %xmm0
	movzbl	56(%r13), %ecx
	vmovdqu	%xmm0, 192(%r13)
	jmp	.L4261
	.p2align 4,,10
	.p2align 3
.L4259:
	leaq	1(%rcx), %rdx
	movq	%rdx, 192(%r13)
	movzbl	(%rcx), %ecx
.L4261:
	cmpb	$10, %cl
	jne	.L4244
	cmpq	%rax, %rdx
	jb	.L4262
	movl	48(%r13), %r11d
	testl	%r11d, %r11d
	je	.L4244
	movl	52(%r13), %edx
	movq	40(%r13), %rdi
	leaq	56(%r13), %rbx
	movq	%rbx, %rsi
	call	*16(%r13)
	movq	192(%r13), %rdx
	leaq	57(%r13), %rcx
	subq	208(%r13), %rdx
	addl	%edx, 184(%r13)
	testl	%eax, %eax
	jne	.L4520
.L4263:
	vmovq	%rcx, %xmm3
	vpunpcklqdq	%xmm3, %xmm3, %xmm0
	movl	$0, 48(%r13)
	movb	$0, 56(%r13)
	vmovdqu	%xmm0, 192(%r13)
	jmp	.L4244
	.p2align 4,,10
	.p2align 3
.L4262:
	leaq	1(%rdx), %rcx
	movq	%rcx, 192(%r13)
	movzbl	(%rdx), %edx
.L4264:
	cmpb	$26, %dl
	jne	.L4244
	cmpq	%rax, %rcx
	jb	.L4521
	movl	48(%r13), %r10d
	testl	%r10d, %r10d
	je	.L4244
	movl	52(%r13), %edx
	movq	40(%r13), %rdi
	leaq	56(%r13), %rbx
	movq	%rbx, %rsi
	call	*16(%r13)
	movq	192(%r13), %rdx
	leaq	57(%r13), %rcx
	subq	208(%r13), %rdx
	addl	%edx, 184(%r13)
	testl	%eax, %eax
	jne	.L4267
.L4510:
	vmovq	%rcx, %xmm2
	vpunpcklqdq	%xmm2, %xmm2, %xmm0
	movl	$0, 48(%r13)
	movb	$0, 56(%r13)
	vmovdqu	%xmm0, 192(%r13)
	jmp	.L4244
	.p2align 4,,10
	.p2align 3
.L4521:
	leaq	1(%rcx), %rax
	movq	%rax, 192(%r13)
	movzbl	(%rcx), %edx
.L4266:
	cmpb	$10, %dl
	jne	.L4244
	leaq	57(%r13), %rax
	movl	$0, -5380(%rbp)
	movl	$0, -5364(%rbp)
	movl	$0, -5368(%rbp)
	movl	$1, -5316(%rbp)
	movl	$0, -5344(%rbp)
	movb	$0, -5393(%rbp)
	movq	%rax, -5336(%rbp)
	xorl	%ebx, %ebx
	xorl	%r14d, %r14d
	xorl	%r15d, %r15d
	.p2align 4,,10
	.p2align 3
.L4268:
	movq	%r13, %rdi
	call	stbi__get32be
	movq	%r13, %rdi
	movl	%eax, %r12d
	call	stbi__get32be
	cmpl	$1229472850, %eax
	je	.L4270
	ja	.L4271
	cmpl	$1229209940, %eax
	je	.L4272
	cmpl	$1229278788, %eax
	jne	.L4522
	movl	-5316(%rbp), %ebx
	testl	%ebx, %ebx
	jne	.L4316
	movl	-5320(%rbp), %r11d
	testl	%r11d, %r11d
	jne	.L4297
	movq	-5328(%rbp), %rax
	movq	8(%rax), %r14
	testq	%r14, %r14
	je	.L4523
	movl	0(%r13), %ebx
	movq	%rax, %rcx
	imull	32(%rcx), %ebx
	movl	4(%r13), %eax
	movl	8(%r13), %edx
	addl	$7, %ebx
	imull	%eax, %edx
	shrl	$3, %ebx
	movl	-5380(%rbp), %r12d
	imull	%edx, %ebx
	xorl	$1, %r12d
	addl	%eax, %ebx
	movslq	%ebx, %rbx
	movq	%rbx, %rdi
	call	malloc@PLT
	vmovq	%rax, %xmm7
	vpunpcklqdq	%xmm7, %xmm7, %xmm1
	testq	%rax, %rax
	je	.L4337
	movslq	-5344(%rbp), %rdx
	addq	%rbx, %rax
	movq	%rax, -5160(%rbp)
	addq	%r14, %rdx
	leaq	-5200(%rbp), %rax
	vmovq	%r14, %xmm4
	vpinsrq	$1, %rdx, %xmm4, %xmm0
	movl	%r12d, %esi
	movq	%rax, %rdi
	movl	$1, -5152(%rbp)
	movq	%rax, -5408(%rbp)
	vmovdqa	%xmm0, -5200(%rbp)
	vmovdqu	%xmm1, -5176(%rbp)
	call	stbi__parse_zlib
	movl	%eax, -5316(%rbp)
	testl	%eax, %eax
	je	.L4338
	movq	-5168(%rbp), %rax
	movl	-5176(%rbp), %ebx
	movq	-5328(%rbp), %rcx
	subl	%eax, %ebx
	movl	%ebx, -5452(%rbp)
	movq	%rax, 16(%rcx)
	testq	%rax, %rax
	je	.L4515
	movq	8(%rcx), %rdi
	movq	%rcx, %rbx
	call	free@PLT
	movl	8(%r13), %eax
	movq	$0, 8(%rbx)
	movl	%eax, -5400(%rbp)
	incl	%eax
	cmpl	-5372(%rbp), %eax
	je	.L4524
.L4341:
	cmpb	$0, -5393(%rbp)
	cmove	-5400(%rbp), %eax
	movl	%eax, -5400(%rbp)
.L4342:
	movq	-5328(%rbp), %rcx
	movl	%eax, 12(%r13)
	movl	32(%rcx), %esi
	movq	16(%rcx), %rbx
	cmpl	$16, %esi
	movq	%rbx, -5464(%rbp)
	movl	%eax, %ebx
	leal	(%rax,%rax), %eax
	movq	(%rcx), %r11
	cmovne	%ebx, %eax
	movl	-5368(%rbp), %r10d
	movl	%esi, -5456(%rbp)
	movl	%eax, -5320(%rbp)
	movl	4(%r11), %r9d
	movl	(%r11), %r12d
	testl	%r10d, %r10d
	je	.L4525
	movslq	%eax, %rbx
	xorl	%ecx, %ecx
	movl	%ebx, %edx
	movl	%r9d, %esi
	movl	%r12d, %edi
	movq	%r11, -5336(%rbp)
	movl	%r9d, -5316(%rbp)
	call	stbi__malloc_mad3
	movq	%rax, -5344(%rbp)
	testq	%rax, %rax
	je	.L4347
	leaq	-5296(%rbp), %rax
	movq	%rax, -5432(%rbp)
	leaq	-5232(%rbp), %rax
	movq	%rax, -5448(%rbp)
	leaq	-5264(%rbp), %rax
	movq	$0, -5360(%rbp)
	movq	%rax, -5440(%rbp)
	movb	%r15b, -5469(%rbp)
	movq	%r13, -5488(%rbp)
	movq	-5336(%rbp), %r11
	movl	-5316(%rbp), %r9d
	jmp	.L4354
	.p2align 4,,10
	.p2align 3
.L4348:
	addq	$4, -5360(%rbp)
	movq	-5360(%rbp), %rax
	cmpq	$28, %rax
	je	.L4353
	movq	-5328(%rbp), %rax
	movq	(%rax), %r11
	movl	4(%r11), %r9d
	movl	(%r11), %r12d
.L4354:
	movabsq	$4294967296, %rax
	movq	%rax, -5280(%rbp)
	movabsq	$8589934594, %rax
	movq	%rax, -5216(%rbp)
	movl	$0, -5272(%rbp)
	addq	$2, %rax
	vmovdqa	.LC289(%rip), %xmm4
	movq	-5360(%rbp), %rcx
	movq	%rax, -5184(%rbp)
	movq	-5432(%rbp), %rax
	movl	$1, -5208(%rbp)
	vmovdqa	.LC291(%rip), %xmm2
	vmovdqa	%xmm4, -5296(%rbp)
	movl	(%rax,%rcx), %r15d
	movq	-5448(%rbp), %rax
	vmovdqa	%xmm2, -5232(%rbp)
	movl	(%rax,%rcx), %r13d
	xorl	%edx, %edx
	leal	-1(%r13,%r12), %eax
	subl	%r15d, %eax
	divl	%r13d
	movq	$2, -5248(%rbp)
	movl	$1, -5240(%rbp)
	vmovdqa	.LC290(%rip), %xmm3
	movq	-5440(%rbp), %rsi
	movl	$2, -5176(%rbp)
	vmovdqa	.LC292(%rip), %xmm6
	vmovdqa	%xmm3, -5264(%rbp)
	movl	(%rsi,%rcx), %r14d
	movq	-5408(%rbp), %rsi
	vmovdqa	%xmm6, -5200(%rbp)
	movl	(%rsi,%rcx), %esi
	xorl	%edx, %edx
	movl	%esi, -5384(%rbp)
	movl	%eax, -5316(%rbp)
	leal	-1(%rsi,%r9), %eax
	subl	%r14d, %eax
	divl	%esi
	movl	-5316(%rbp), %esi
	movl	%eax, -5376(%rbp)
	testl	%esi, %esi
	je	.L4348
	testl	%eax, %eax
	je	.L4348
	movl	%eax, %esi
	movl	-5316(%rbp), %r12d
	movl	8(%r11), %eax
	movl	-5456(%rbp), %edx
	imull	%r12d, %eax
	movl	-5400(%rbp), %ecx
	movl	%esi, %r9d
	imull	%edx, %eax
	movq	-5328(%rbp), %rdi
	movl	%r12d, %r8d
	addl	$7, %eax
	sarl	$3, %eax
	incl	%eax
	imull	%esi, %eax
	movq	-5464(%rbp), %rsi
	movl	%eax, -5468(%rbp)
	movl	-5364(%rbp), %eax
	pushq	%rax
	pushq	%rdx
	movl	-5452(%rbp), %edx
	call	stbi__create_png_image_raw
	popq	%rdx
	popq	%rcx
	testl	%eax, %eax
	je	.L4349
	movq	-5328(%rbp), %rax
	movq	24(%rax), %rdx
	movl	-5376(%rbp), %eax
	movq	%rdx, -5480(%rbp)
	testl	%eax, %eax
	jle	.L4350
	testl	%r12d, %r12d
	jle	.L4350
	movl	-5320(%rbp), %ecx
	movq	%rdx, -5392(%rbp)
	movl	%ecx, %eax
	imull	%r12d, %eax
	imull	%ecx, %r13d
	imull	%ecx, %r15d
	cltq
	movq	%rax, -5424(%rbp)
	movslq	%r13d, %rax
	movq	%rax, -5352(%rbp)
	movslq	%r15d, %rax
	movq	%rax, -5416(%rbp)
	movl	$0, -5368(%rbp)
	movl	%r14d, -5336(%rbp)
	movq	%rbx, %r13
	.p2align 4,,10
	.p2align 3
.L4351:
	movq	-5328(%rbp), %rax
	movq	-5392(%rbp), %r14
	movq	(%rax), %r12
	xorl	%r15d, %r15d
	movq	%r14, %rcx
	movq	%r13, %rax
	movq	-5416(%rbp), %rbx
	movq	%r12, %r14
	movl	%r15d, %r13d
	movq	%rcx, %r12
	movq	%rax, %r15
	.p2align 4,,10
	.p2align 3
.L4352:
	movl	-5320(%rbp), %edi
	movq	%r12, %rsi
	imull	(%r14), %edi
	movq	%r15, %rdx
	incl	%r13d
	imull	-5336(%rbp), %edi
	addq	%r15, %r12
	addq	%rbx, %rdi
	addq	-5344(%rbp), %rdi
	call	memcpy@PLT
	addq	-5352(%rbp), %rbx
	cmpl	%r13d, -5316(%rbp)
	jne	.L4352
	incl	-5368(%rbp)
	movq	-5424(%rbp), %rcx
	movl	-5384(%rbp), %esi
	addq	%rcx, -5392(%rbp)
	movl	-5368(%rbp), %eax
	addl	%esi, -5336(%rbp)
	movq	%r15, %r13
	cmpl	%eax, -5376(%rbp)
	jne	.L4351
	movq	%r15, %rbx
.L4350:
	movq	-5480(%rbp), %rdi
	call	free@PLT
	movl	-5468(%rbp), %eax
	addq	%rax, -5464(%rbp)
	subl	%eax, -5452(%rbp)
	jmp	.L4348
	.p2align 4,,10
	.p2align 3
.L4271:
	cmpl	$1347179589, %eax
	je	.L4276
	cmpl	$1951551059, %eax
	jne	.L4275
	movl	-5316(%rbp), %eax
	testl	%eax, %eax
	jne	.L4316
	movq	-5328(%rbp), %rax
	cmpq	$0, 8(%rax)
	jne	.L4526
	testb	%r15b, %r15b
	jne	.L4527
	movl	8(%r13), %eax
	testb	$1, %al
	je	.L4528
	leal	(%rax,%rax), %edx
	cmpl	%r12d, %edx
	jne	.L4321
	movq	-5328(%rbp), %rcx
	cmpl	$16, 32(%rcx)
	je	.L4325
	xorl	%r12d, %r12d
	leaq	-1091(%rbp), %rcx
	testl	%eax, %eax
	jle	.L4513
	movq	%r12, %rax
	movl	%ebx, -5352(%rbp)
	movq	%r13, %r12
	movq	%rcx, %rbx
	movq	%rax, %r13
.L4326:
	movq	%r12, %rdi
	call	stbi__get16be
	movl	%eax, %r8d
	movq	-5328(%rbp), %rax
	leaq	stbi__depth_scale_table(%rip), %rcx
	movslq	32(%rax), %rsi
	movzbl	(%rcx,%rsi), %eax
	imull	%r8d, %eax
	movb	%al, (%rbx,%r13)
	incq	%r13
	cmpl	%r13d, 8(%r12)
	jg	.L4326
	movl	-5352(%rbp), %ebx
	movq	%r12, %r13
.L4513:
	movb	$1, -5393(%rbp)
	jmp	.L4278
	.p2align 4,,10
	.p2align 3
.L4522:
	cmpl	$1130840649, %eax
	jne	.L4275
	movl	$1, -5380(%rbp)
	testl	%r12d, %r12d
	je	.L4278
	js	.L4529
.L4407:
	movl	%r12d, %esi
	movq	%r13, %rdi
	call	stbi__skip.part.0
	.p2align 4,,10
	.p2align 3
.L4278:
	movq	%r13, %rdi
	call	stbi__get32be
	jmp	.L4268
	.p2align 4,,10
	.p2align 3
.L4270:
	movl	-5316(%rbp), %r9d
	testl	%r9d, %r9d
	je	.L4530
	cmpl	$13, %r12d
	jne	.L4531
	movq	%r13, %rdi
	call	stbi__get32be
	movl	%eax, 0(%r13)
	movq	%r13, %rdi
	call	stbi__get32be
	movl	%eax, 4(%r13)
	cmpl	$16777216, %eax
	ja	.L4283
	cmpl	$16777216, 0(%r13)
	ja	.L4283
	movq	%r13, %rdi
	call	stbi__get8
	movq	-5328(%rbp), %rsi
	movzbl	%al, %edx
	movl	%edx, 32(%rsi)
	cmpb	$16, %al
	jbe	.L4532
.L4284:
	leaq	.LC274(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	movl	$0, -5316(%rbp)
	jmp	.L4242
	.p2align 4,,10
	.p2align 3
.L4272:
	movl	-5316(%rbp), %eax
	testl	%eax, %eax
	jne	.L4316
	testb	%r15b, %r15b
	je	.L4328
	testl	%ebx, %ebx
	je	.L4533
.L4328:
	cmpl	$2, -5320(%rbp)
	je	.L4534
	movl	-5344(%rbp), %eax
	leal	(%rax,%r12), %ecx
	cmpl	%eax, %ecx
	jl	.L4515
	movq	-5328(%rbp), %rax
	movq	8(%rax), %rdi
	cmpl	%r14d, %ecx
	ja	.L4535
.L4331:
	movl	-5344(%rbp), %eax
	movl	%r12d, %edx
	leaq	(%rdi,%rax), %rsi
	movq	%r13, %rdi
	movl	%ecx, -5352(%rbp)
	call	stbi__getn
	testl	%eax, %eax
	movl	-5352(%rbp), %ecx
	je	.L4536
	movl	%ecx, -5344(%rbp)
	jmp	.L4278
	.p2align 4,,10
	.p2align 3
.L4275:
	movl	-5316(%rbp), %edx
	testl	%edx, %edx
	jne	.L4316
	testl	$536870912, %eax
	je	.L4537
	testl	%r12d, %r12d
	je	.L4278
	jns	.L4407
.L4529:
	movq	200(%r13), %rax
	movq	%rax, 192(%r13)
	jmp	.L4278
	.p2align 4,,10
	.p2align 3
.L4276:
	movl	-5316(%rbp), %r8d
	testl	%r8d, %r8d
	jne	.L4316
	cmpl	$768, %r12d
	ja	.L4300
	movl	$2863311531, %eax
	movl	%r12d, %ebx
	imulq	%rax, %rbx
	shrq	$33, %rbx
	leal	(%rbx,%rbx,2), %eax
	cmpl	%r12d, %eax
	jne	.L4300
	cmpl	$2, %eax
	jbe	.L4414
	leaq	-1088(%rbp), %r12
	xorl	%ecx, %ecx
	leaq	56(%r13), %rsi
	movb	%r15b, -5352(%rbp)
	movl	%r14d, -5360(%rbp)
	movq	%r12, %r15
	movl	%ebx, %r14d
	movq	192(%r13), %rdx
	movq	200(%r13), %rax
	movq	%rcx, %r12
	movq	%rsi, %rbx
	jmp	.L4315
	.p2align 4,,10
	.p2align 3
.L4301:
	movl	48(%r13), %edi
	testl	%edi, %edi
	jne	.L4538
	movb	$0, (%r15,%r12,4)
.L4306:
	movl	48(%r13), %esi
	testl	%esi, %esi
	jne	.L4539
	movb	$0, 1(%r15,%r12,4)
.L4311:
	movl	48(%r13), %ecx
	xorl	%r8d, %r8d
	testl	%ecx, %ecx
	jne	.L4540
.L4312:
	movb	%r8b, 2(%r15,%r12,4)
	movb	$-1, 3(%r15,%r12,4)
	incq	%r12
	cmpl	%r12d, %r14d
	jbe	.L4541
.L4315:
	cmpq	%rax, %rdx
	jnb	.L4301
	leaq	1(%rdx), %rdi
	movq	%rdi, 192(%r13)
	movzbl	(%rdx), %edx
	movb	%dl, (%r15,%r12,4)
	cmpq	%rdi, %rax
	jbe	.L4415
.L4543:
	leaq	1(%rdi), %rsi
	movq	%rsi, 192(%r13)
	movzbl	(%rdi), %edx
	movb	%dl, 1(%r15,%r12,4)
	cmpq	%rsi, %rax
	jbe	.L4416
.L4542:
	leaq	1(%rsi), %rdx
	movq	%rdx, 192(%r13)
	movzbl	(%rsi), %r8d
	jmp	.L4312
	.p2align 4,,10
	.p2align 3
.L4540:
	movl	52(%r13), %edx
	movq	40(%r13), %rdi
	movq	%rbx, %rsi
	movb	%r8b, -5376(%rbp)
	call	*16(%r13)
	movq	192(%r13), %rdx
	subq	208(%r13), %rdx
	addl	%edx, 184(%r13)
	movq	-5336(%rbp), %rdx
	testl	%eax, %eax
	jne	.L4313
	movl	$0, 48(%r13)
	movb	$0, 56(%r13)
	movzbl	-5376(%rbp), %r8d
	movq	%rdx, %rax
	vmovq	%rdx, %xmm5
.L4314:
	vpinsrq	$1, %rax, %xmm5, %xmm0
	vmovdqu	%xmm0, 192(%r13)
	jmp	.L4312
	.p2align 4,,10
	.p2align 3
.L4539:
	movl	52(%r13), %edx
	movq	40(%r13), %rdi
	movq	%rbx, %rsi
	call	*16(%r13)
	movq	192(%r13), %rdx
	movq	-5336(%rbp), %rsi
	subq	208(%r13), %rdx
	addl	%edx, 184(%r13)
	testl	%eax, %eax
	jne	.L4309
	movl	$0, 48(%r13)
	movb	$0, 56(%r13)
	movq	%rsi, %rax
	xorl	%edx, %edx
	vmovq	%rsi, %xmm7
.L4310:
	vpinsrq	$1, %rax, %xmm7, %xmm0
	movb	%dl, 1(%r15,%r12,4)
	vmovdqu	%xmm0, 192(%r13)
	cmpq	%rsi, %rax
	ja	.L4542
.L4416:
	movq	%rsi, %rdx
	jmp	.L4311
	.p2align 4,,10
	.p2align 3
.L4538:
	movl	52(%r13), %edx
	movq	40(%r13), %rdi
	movq	%rbx, %rsi
	call	*16(%r13)
	movq	192(%r13), %rdx
	movq	-5336(%rbp), %rdi
	subq	208(%r13), %rdx
	addl	%edx, 184(%r13)
	testl	%eax, %eax
	jne	.L4304
	movl	$0, 48(%r13)
	movb	$0, 56(%r13)
	movq	%rdi, %rax
	xorl	%edx, %edx
	vmovq	%rdi, %xmm6
.L4305:
	vpinsrq	$1, %rax, %xmm6, %xmm0
	movb	%dl, (%r15,%r12,4)
	vmovdqu	%xmm0, 192(%r13)
	cmpq	%rdi, %rax
	ja	.L4543
.L4415:
	movq	%rdi, %rdx
	jmp	.L4306
	.p2align 4,,10
	.p2align 3
.L4541:
	movl	%r14d, %ebx
	movzbl	-5352(%rbp), %r15d
	movl	-5360(%rbp), %r14d
	jmp	.L4278
	.p2align 4,,10
	.p2align 3
.L4309:
	cltq
	movzbl	56(%r13), %edx
	addq	%rbx, %rax
	vmovq	%rsi, %xmm7
	jmp	.L4310
	.p2align 4,,10
	.p2align 3
.L4304:
	cltq
	movzbl	56(%r13), %edx
	addq	%rbx, %rax
	vmovq	%rdi, %xmm6
	jmp	.L4305
	.p2align 4,,10
	.p2align 3
.L4313:
	cltq
	movzbl	56(%r13), %r8d
	addq	%rbx, %rax
	vmovq	%rdx, %xmm5
	jmp	.L4314
	.p2align 4,,10
	.p2align 3
.L4532:
	movq	$-65815, %rdx
	btq	%rax, %rdx
	jc	.L4284
	movq	%r13, %rdi
	call	stbi__get8
	movl	%eax, %r12d
	movzbl	%al, %eax
	movl	%eax, -5364(%rbp)
	cmpl	$6, %eax
	jg	.L4288
	cmpl	$3, -5364(%rbp)
	je	.L4544
	testb	$1, %r12b
	jne	.L4288
.L4289:
	movq	%r13, %rdi
	call	stbi__get8
	testb	%al, %al
	jne	.L4545
	movq	%r13, %rdi
	call	stbi__get8
	testb	%al, %al
	jne	.L4546
	movq	%r13, %rdi
	call	stbi__get8
	movzbl	%al, %eax
	movl	%eax, -5368(%rbp)
	cmpl	$1, %eax
	jg	.L4547
	movl	0(%r13), %ecx
	testl	%ecx, %ecx
	je	.L4293
	movl	4(%r13), %esi
	testl	%esi, %esi
	je	.L4293
	testb	%r15b, %r15b
	jne	.L4295
	andl	$2, %r12d
	movl	-5364(%rbp), %edi
	movl	$3, %eax
	cmove	-5316(%rbp), %eax
	sarl	$2, %edi
	addl	%eax, %edi
	xorl	%edx, %edx
	movl	$1073741824, %eax
	divl	%ecx
	movl	%edi, 8(%r13)
	xorl	%edx, %edx
	divl	%edi
	cmpl	%eax, %esi
	ja	.L4283
	cmpl	$2, -5320(%rbp)
	jne	.L4511
	.p2align 4,,10
	.p2align 3
.L4297:
	movl	$1, -5316(%rbp)
	jmp	.L4242
	.p2align 4,,10
	.p2align 3
.L4295:
	movl	$268435456, %eax
	xorl	%edx, %edx
	divl	%ecx
	movl	$1, 8(%r13)
	cmpl	%eax, %esi
	ja	.L4283
.L4511:
	movl	$0, -5316(%rbp)
	jmp	.L4278
	.p2align 4,,10
	.p2align 3
.L4325:
	movb	$1, -5393(%rbp)
	testl	%eax, %eax
	jle	.L4278
	leaq	-5302(%rbp), %rax
	movl	%ebx, -5352(%rbp)
	xorl	%r12d, %r12d
	movq	%rax, %rbx
.L4327:
	movq	%r13, %rdi
	call	stbi__get16be
	movw	%ax, (%rbx,%r12,2)
	incq	%r12
	cmpl	%r12d, 8(%r13)
	jg	.L4327
	movb	$1, -5393(%rbp)
	movl	-5352(%rbp), %ebx
	jmp	.L4278
	.p2align 4,,10
	.p2align 3
.L4316:
	leaq	.LC280(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	movl	$0, -5316(%rbp)
	jmp	.L4242
	.p2align 4,,10
	.p2align 3
.L4535:
	testl	%r14d, %r14d
	jne	.L4334
	movl	$4096, %r14d
	cmpl	%r14d, %r12d
	cmovnb	%r12d, %r14d
	cmpl	%r14d, %ecx
	jbe	.L4333
	.p2align 4,,10
	.p2align 3
.L4334:
	addl	%r14d, %r14d
	cmpl	%r14d, %ecx
	ja	.L4334
.L4333:
	movl	%r14d, %esi
	movl	%ecx, -5352(%rbp)
	call	realloc@PLT
	testq	%rax, %rax
	movl	-5352(%rbp), %ecx
	movq	%rax, %rdi
	je	.L4347
	movq	-5328(%rbp), %rax
	movq	%rdi, 8(%rax)
	jmp	.L4331
	.p2align 4,,10
	.p2align 3
.L4518:
	movl	52(%r13), %edx
	movq	40(%r13), %rdi
	leaq	56(%r13), %rbx
	movq	%rbx, %rsi
	call	*16(%r13)
	movq	192(%r13), %rdx
	leaq	57(%r13), %rcx
	subq	208(%r13), %rdx
	addl	%edx, 184(%r13)
	testl	%eax, %eax
	je	.L4263
	cltq
	addq	%rbx, %rax
	vmovq	%rcx, %xmm5
	vpinsrq	$1, %rax, %xmm5, %xmm0
	movzbl	56(%r13), %edx
	vmovdqu	%xmm0, 192(%r13)
	jmp	.L4246
	.p2align 4,,10
	.p2align 3
.L4544:
	movq	-5328(%rbp), %rax
	cmpl	$16, 32(%rax)
	je	.L4288
	movl	$3, %r15d
	jmp	.L4289
	.p2align 4,,10
	.p2align 3
.L4527:
	cmpl	$2, -5320(%rbp)
	je	.L4548
	testl	%ebx, %ebx
	je	.L4549
	cmpl	%r12d, %ebx
	jb	.L4321
	testl	%r12d, %r12d
	je	.L4512
	leal	-1(%r12), %eax
	leaq	-1085(%rbp), %r15
	leaq	-1081(%rbp,%rax,4), %r12
	.p2align 4,,10
	.p2align 3
.L4323:
	movq	%r13, %rdi
	call	stbi__get8
	movb	%al, (%r15)
	addq	$4, %r15
	cmpq	%r12, %r15
	jne	.L4323
.L4512:
	movl	$4, %r15d
	jmp	.L4278
	.p2align 4,,10
	.p2align 3
.L4248:
	vmovq	%rdx, %xmm2
	vpunpcklqdq	%xmm2, %xmm2, %xmm0
	movl	$0, 48(%r13)
	movb	$0, 56(%r13)
	vmovdqu	%xmm0, 192(%r13)
	jmp	.L4244
.L4251:
	vmovq	%rcx, %xmm7
	vpunpcklqdq	%xmm7, %xmm7, %xmm0
	movl	$0, 48(%r13)
	movb	$0, 56(%r13)
	vmovdqu	%xmm0, 192(%r13)
	jmp	.L4244
.L4523:
	leaq	.LC288(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L4242
.L4254:
	vmovq	%rdx, %xmm5
	vpunpcklqdq	%xmm5, %xmm5, %xmm0
	movl	$0, 48(%r13)
	movb	$0, 56(%r13)
	vmovdqu	%xmm0, 192(%r13)
	jmp	.L4244
.L4353:
	movq	-5328(%rbp), %rax
	movq	-5344(%rbp), %rbx
	movzbl	-5469(%rbp), %r15d
	movq	%rbx, 24(%rax)
	movq	-5488(%rbp), %r13
.L4346:
	cmpb	$0, -5393(%rbp)
	je	.L4362
	movq	-5328(%rbp), %rbx
	movl	12(%r13), %esi
	movq	(%rbx), %rdx
	leal	-2(%rsi), %eax
	movl	(%rdx), %ecx
	andl	$-3, %eax
	imull	4(%rdx), %ecx
	cmpl	$16, 32(%rbx)
	movq	24(%rbx), %rdx
	je	.L4550
	testl	%eax, %eax
	jne	.L4551
	cmpl	$2, %esi
	je	.L4369
	testl	%ecx, %ecx
	je	.L4362
	movzbl	-1091(%rbp), %esi
	movzbl	-1090(%rbp), %edi
	movzbl	-1089(%rbp), %r8d
	leaq	(%rdx,%rcx,4), %rax
	jmp	.L4375
	.p2align 4,,10
	.p2align 3
.L4374:
	addq	$4, %rdx
	cmpq	%rax, %rdx
	je	.L4362
.L4375:
	cmpb	%sil, (%rdx)
	jne	.L4374
	cmpb	%dil, 1(%rdx)
	jne	.L4374
	cmpb	%r8b, 2(%rdx)
	jne	.L4374
	movb	$0, 3(%rdx)
	jmp	.L4374
.L4360:
	testl	%ecx, %ecx
	je	.L4362
	leal	-1(%rcx), %esi
	movzwl	-5302(%rbp), %edi
	cmpl	$15, %esi
	jbe	.L4423
	movl	%esi, %r8d
	shrl	$4, %r8d
	decl	%r8d
	vmovd	%edi, %xmm4
	salq	$6, %r8
	vmovdqa	.LC19(%rip), %ymm2
	vpbroadcastw	%xmm4, %ymm4
	movq	%rdx, %rax
	leaq	64(%rdx,%r8), %r8
	vpxor	%xmm3, %xmm3, %xmm3
.L4364:
	vpand	(%rax), %ymm2, %ymm0
	vpand	32(%rax), %ymm2, %ymm1
	addq	$64, %rax
	vpackusdw	%ymm1, %ymm0, %ymm0
	vpermq	$216, %ymm0, %ymm0
	vpcmpeqw	%ymm4, %ymm0, %ymm0
	vpcmpeqw	%ymm3, %ymm0, %ymm0
	vpextrw	$0, %xmm0, -62(%rax)
	vpextrw	$1, %xmm0, -58(%rax)
	vpextrw	$2, %xmm0, -54(%rax)
	vpextrw	$3, %xmm0, -50(%rax)
	vpextrw	$4, %xmm0, -46(%rax)
	vpextrw	$5, %xmm0, -42(%rax)
	vpextrw	$6, %xmm0, -38(%rax)
	vpextrw	$7, %xmm0, -34(%rax)
	vextracti128	$0x1, %ymm0, %xmm0
	vpextrw	$0, %xmm0, -30(%rax)
	vpextrw	$1, %xmm0, -26(%rax)
	vpextrw	$2, %xmm0, -22(%rax)
	vpextrw	$3, %xmm0, -18(%rax)
	vpextrw	$4, %xmm0, -14(%rax)
	vpextrw	$5, %xmm0, -10(%rax)
	vpextrw	$6, %xmm0, -6(%rax)
	vpextrw	$7, %xmm0, -2(%rax)
	cmpq	%rax, %r8
	jne	.L4364
	movl	%esi, %eax
	andl	$-16, %eax
	movl	%eax, %r8d
	leaq	(%rdx,%r8,4), %r8
.L4363:
	subl	%eax, %esi
	movl	%esi, %r9d
	cmpl	$7, %esi
	jbe	.L4365
	movl	%eax, %esi
	salq	$2, %rsi
	vmovdqa	.LC20(%rip), %xmm1
	leaq	(%rdx,%rsi), %r11
	vpand	(%r11), %xmm1, %xmm0
	vpand	16(%r11), %xmm1, %xmm1
	vpackusdw	%xmm1, %xmm0, %xmm0
	vmovd	%edi, %xmm1
	vpbroadcastw	%xmm1, %xmm1
	vpcmpeqw	%xmm1, %xmm0, %xmm0
	vpxor	%xmm1, %xmm1, %xmm1
	vpcmpeqw	%xmm1, %xmm0, %xmm0
	vpextrw	$0, %xmm0, 2(%rdx,%rsi)
	vpextrw	$1, %xmm0, 6(%rdx,%rsi)
	vpextrw	$2, %xmm0, 10(%rdx,%rsi)
	vpextrw	$3, %xmm0, 14(%rdx,%rsi)
	vpextrw	$4, %xmm0, 18(%rdx,%rsi)
	vpextrw	$5, %xmm0, 22(%rdx,%rsi)
	vpextrw	$6, %xmm0, 26(%rdx,%rsi)
	vpextrw	$7, %xmm0, 30(%rdx,%rsi)
	movl	%r9d, %edx
	andl	$-8, %edx
	movl	%edx, %esi
	leaq	(%r8,%rsi,4), %r8
	addl	%edx, %eax
.L4365:
	xorl	%edx, %edx
	cmpw	%di, (%r8)
	setne	%dl
	negl	%edx
	movw	%dx, 2(%r8)
	leal	1(%rax), %edx
	cmpl	%edx, %ecx
	jbe	.L4362
	xorl	%edx, %edx
	cmpw	%di, 4(%r8)
	setne	%dl
	negl	%edx
	movw	%dx, 6(%r8)
	leal	2(%rax), %edx
	cmpl	%edx, %ecx
	jbe	.L4362
	xorl	%edx, %edx
	cmpw	%di, 8(%r8)
	setne	%dl
	negl	%edx
	movw	%dx, 10(%r8)
	leal	3(%rax), %edx
	cmpl	%edx, %ecx
	jbe	.L4362
	xorl	%edx, %edx
	cmpw	%di, 12(%r8)
	setne	%dl
	negl	%edx
	movw	%dx, 14(%r8)
	leal	4(%rax), %edx
	cmpl	%edx, %ecx
	jbe	.L4362
	xorl	%edx, %edx
	cmpw	%di, 16(%r8)
	setne	%dl
	negl	%edx
	movw	%dx, 18(%r8)
	leal	5(%rax), %edx
	cmpl	%edx, %ecx
	jbe	.L4362
	xorl	%edx, %edx
	cmpw	%di, 20(%r8)
	setne	%dl
	negl	%edx
	movw	%dx, 22(%r8)
	leal	6(%rax), %edx
	cmpl	%edx, %ecx
	jbe	.L4362
	xorl	%edx, %edx
	cmpw	%di, 24(%r8)
	setne	%dl
	negl	%edx
	addl	$7, %eax
	movw	%dx, 26(%r8)
	cmpl	%eax, %ecx
	jbe	.L4362
	xorl	%eax, %eax
	cmpw	%di, 28(%r8)
	setne	%al
	negl	%eax
	movw	%ax, 30(%r8)
.L4362:
	movl	-5380(%rbp), %r12d
	testl	%r12d, %r12d
	je	.L4357
	movl	%fs:stbi__de_iphone_flag_set@tpoff, %r11d
	testl	%r11d, %r11d
	je	.L4378
	movl	%fs:stbi__de_iphone_flag_local@tpoff, %r10d
	testl	%r10d, %r10d
	setne	%al
.L4379:
	testb	%al, %al
	je	.L4357
	cmpl	$2, 12(%r13)
	jle	.L4357
	movq	-5328(%rbp), %rbx
	movq	(%rbx), %rax
	movq	24(%rbx), %rcx
	movl	(%rax), %edx
	imull	4(%rax), %edx
	movl	12(%rax), %eax
	cmpl	$3, %eax
	je	.L4552
	cmpl	$4, %eax
	jne	.L4553
	movl	%fs:stbi__unpremultiply_on_load_set@tpoff, %r8d
	testl	%r8d, %r8d
	je	.L4387
	movl	%fs:stbi__unpremultiply_on_load_local@tpoff, %edi
	testl	%edi, %edi
	jne	.L4388
.L4389:
	testl	%edx, %edx
	je	.L4357
	leal	-1(%rdx), %esi
	movq	%rcx, %rax
	cmpl	$31, %esi
	jbe	.L4426
	movl	%esi, %edi
	shrl	$5, %edi
	decl	%edi
	salq	$7, %rdi
	leaq	128(%rcx,%rdi), %rdi
.L4395:
	vmovdqu	(%rax), %ymm3
	vmovdqu	32(%rax), %ymm2
	vmovdqu	64(%rax), %ymm1
	vmovdqu	96(%rax), %ymm0
	vmovdqa	%xmm3, %xmm7
	vmovdqa	%xmm2, %xmm6
	vmovdqa	%xmm1, %xmm5
	vmovdqa	%xmm0, %xmm4
	vpextrb	$2, %xmm3, (%rax)
	vpextrb	$6, %xmm3, 4(%rax)
	vpextrb	$10, %xmm3, 8(%rax)
	vpextrb	$14, %xmm3, 12(%rax)
	vpextrb	$2, %xmm2, 32(%rax)
	vextracti128	$0x1, %ymm3, %xmm3
	vpextrb	$6, %xmm2, 36(%rax)
	vpextrb	$10, %xmm2, 40(%rax)
	vpextrb	$14, %xmm2, 44(%rax)
	vpextrb	$2, %xmm1, 64(%rax)
	vextracti128	$0x1, %ymm2, %xmm2
	vpextrb	$6, %xmm1, 68(%rax)
	vpextrb	$10, %xmm1, 72(%rax)
	vpextrb	$14, %xmm1, 76(%rax)
	vpextrb	$2, %xmm0, 96(%rax)
	vextracti128	$0x1, %ymm1, %xmm1
	vpextrb	$6, %xmm0, 100(%rax)
	vpextrb	$10, %xmm0, 104(%rax)
	vpextrb	$14, %xmm0, 108(%rax)
	vextracti128	$0x1, %ymm0, %xmm0
	vpextrb	$2, %xmm3, 16(%rax)
	vpextrb	$6, %xmm3, 20(%rax)
	vpextrb	$10, %xmm3, 24(%rax)
	vpextrb	$14, %xmm3, 28(%rax)
	vpextrb	$2, %xmm2, 48(%rax)
	vpextrb	$6, %xmm2, 52(%rax)
	vpextrb	$10, %xmm2, 56(%rax)
	vpextrb	$14, %xmm2, 60(%rax)
	vpextrb	$2, %xmm1, 80(%rax)
	vpextrb	$6, %xmm1, 84(%rax)
	vpextrb	$10, %xmm1, 88(%rax)
	vpextrb	$14, %xmm1, 92(%rax)
	vpextrb	$2, %xmm0, 112(%rax)
	vpextrb	$6, %xmm0, 116(%rax)
	vpextrb	$10, %xmm0, 120(%rax)
	vpextrb	$14, %xmm0, 124(%rax)
	vpextrb	$0, %xmm7, 2(%rax)
	vpextrb	$4, %xmm7, 6(%rax)
	vpextrb	$8, %xmm7, 10(%rax)
	vpextrb	$12, %xmm7, 14(%rax)
	vpextrb	$0, %xmm3, 18(%rax)
	vpextrb	$4, %xmm3, 22(%rax)
	vpextrb	$8, %xmm3, 26(%rax)
	vpextrb	$12, %xmm3, 30(%rax)
	vpextrb	$0, %xmm6, 34(%rax)
	vpextrb	$4, %xmm6, 38(%rax)
	vpextrb	$8, %xmm6, 42(%rax)
	vpextrb	$12, %xmm6, 46(%rax)
	vpextrb	$0, %xmm2, 50(%rax)
	vpextrb	$4, %xmm2, 54(%rax)
	vpextrb	$8, %xmm2, 58(%rax)
	vpextrb	$12, %xmm2, 62(%rax)
	vpextrb	$0, %xmm5, 66(%rax)
	vpextrb	$4, %xmm5, 70(%rax)
	vpextrb	$8, %xmm5, 74(%rax)
	vpextrb	$12, %xmm5, 78(%rax)
	vpextrb	$0, %xmm1, 82(%rax)
	vpextrb	$4, %xmm1, 86(%rax)
	vpextrb	$8, %xmm1, 90(%rax)
	vpextrb	$12, %xmm1, 94(%rax)
	vpextrb	$0, %xmm4, 98(%rax)
	vpextrb	$4, %xmm4, 102(%rax)
	vpextrb	$8, %xmm4, 106(%rax)
	vpextrb	$12, %xmm4, 110(%rax)
	vpextrb	$0, %xmm0, 114(%rax)
	vpextrb	$4, %xmm0, 118(%rax)
	vpextrb	$8, %xmm0, 122(%rax)
	vpextrb	$12, %xmm0, 126(%rax)
	subq	$-128, %rax
	cmpq	%rdi, %rax
	jne	.L4395
	movl	%esi, %r8d
	andl	$-32, %r8d
	movl	%r8d, %eax
	leaq	(%rcx,%rax,4), %rax
.L4394:
	subl	%r8d, %esi
	movl	%esi, %r9d
	cmpl	$15, %esi
	jbe	.L4396
	movl	%r8d, %edi
	salq	$2, %rdi
	leaq	(%rcx,%rdi), %rsi
	vmovdqu	48(%rsi), %xmm0
	vmovdqu	(%rsi), %xmm3
	vmovdqu	16(%rsi), %xmm2
	vmovdqu	32(%rsi), %xmm1
	vpextrb	$2, %xmm3, (%rsi)
	vpextrb	$6, %xmm3, 4(%rsi)
	vpextrb	$10, %xmm3, 8(%rsi)
	vpextrb	$14, %xmm3, 12(%rsi)
	vpextrb	$2, %xmm2, 16(%rsi)
	vpextrb	$6, %xmm2, 20(%rsi)
	vpextrb	$10, %xmm2, 24(%rsi)
	vpextrb	$14, %xmm2, 28(%rsi)
	vpextrb	$2, %xmm1, 32(%rsi)
	vpextrb	$6, %xmm1, 36(%rsi)
	vpextrb	$10, %xmm1, 40(%rsi)
	vpextrb	$14, %xmm1, 44(%rsi)
	vpextrb	$2, %xmm0, 48(%rsi)
	vpextrb	$6, %xmm0, 52(%rsi)
	vpextrb	$10, %xmm0, 56(%rsi)
	vpextrb	$14, %xmm0, 60(%rsi)
	vpextrb	$0, %xmm3, 2(%rcx,%rdi)
	vpextrb	$4, %xmm3, 6(%rcx,%rdi)
	vpextrb	$8, %xmm3, 10(%rcx,%rdi)
	vpextrb	$12, %xmm3, 14(%rcx,%rdi)
	vpextrb	$0, %xmm2, 18(%rcx,%rdi)
	vpextrb	$4, %xmm2, 22(%rcx,%rdi)
	vpextrb	$8, %xmm2, 26(%rcx,%rdi)
	vpextrb	$12, %xmm2, 30(%rcx,%rdi)
	vpextrb	$0, %xmm1, 34(%rcx,%rdi)
	vpextrb	$4, %xmm1, 38(%rcx,%rdi)
	vpextrb	$8, %xmm1, 42(%rcx,%rdi)
	vpextrb	$12, %xmm1, 46(%rcx,%rdi)
	vpextrb	$0, %xmm0, 50(%rcx,%rdi)
	vpextrb	$4, %xmm0, 54(%rcx,%rdi)
	vpextrb	$8, %xmm0, 58(%rcx,%rdi)
	vpextrb	$12, %xmm0, 62(%rcx,%rdi)
	movl	%r9d, %ecx
	andl	$-16, %ecx
	movl	%ecx, %esi
	leaq	(%rax,%rsi,4), %rax
	addl	%ecx, %r8d
.L4396:
	movzbl	(%rax), %ecx
	movzbl	2(%rax), %esi
	movb	%cl, 2(%rax)
	leal	1(%r8), %ecx
	movb	%sil, (%rax)
	cmpl	%ecx, %edx
	jbe	.L4357
	movzbl	4(%rax), %ecx
	movzbl	6(%rax), %esi
	movb	%cl, 6(%rax)
	leal	2(%r8), %ecx
	movb	%sil, 4(%rax)
	cmpl	%ecx, %edx
	jbe	.L4357
	movzbl	8(%rax), %ecx
	movzbl	10(%rax), %esi
	movb	%cl, 10(%rax)
	leal	3(%r8), %ecx
	movb	%sil, 8(%rax)
	cmpl	%ecx, %edx
	jbe	.L4357
	movzbl	12(%rax), %ecx
	movzbl	14(%rax), %esi
	movb	%cl, 14(%rax)
	leal	4(%r8), %ecx
	movb	%sil, 12(%rax)
	cmpl	%ecx, %edx
	jbe	.L4357
	movzbl	16(%rax), %ecx
	movzbl	18(%rax), %esi
	movb	%cl, 18(%rax)
	leal	5(%r8), %ecx
	movb	%sil, 16(%rax)
	cmpl	%ecx, %edx
	jbe	.L4357
	movzbl	20(%rax), %ecx
	movzbl	22(%rax), %esi
	movb	%cl, 22(%rax)
	leal	6(%r8), %ecx
	movb	%sil, 20(%rax)
	cmpl	%ecx, %edx
	jbe	.L4357
	movzbl	24(%rax), %ecx
	movzbl	26(%rax), %esi
	movb	%cl, 26(%rax)
	leal	7(%r8), %ecx
	movb	%sil, 24(%rax)
	cmpl	%ecx, %edx
	jbe	.L4357
	movzbl	28(%rax), %ecx
	movzbl	30(%rax), %esi
	movb	%cl, 30(%rax)
	leal	8(%r8), %ecx
	movb	%sil, 28(%rax)
	cmpl	%ecx, %edx
	jbe	.L4357
	movzbl	32(%rax), %ecx
	movzbl	34(%rax), %esi
	movb	%cl, 34(%rax)
	leal	9(%r8), %ecx
	movb	%sil, 32(%rax)
	cmpl	%ecx, %edx
	jbe	.L4357
	movzbl	36(%rax), %ecx
	movzbl	38(%rax), %esi
	movb	%cl, 38(%rax)
	leal	10(%r8), %ecx
	movb	%sil, 36(%rax)
	cmpl	%ecx, %edx
	jbe	.L4357
	movzbl	40(%rax), %ecx
	movzbl	42(%rax), %esi
	movb	%cl, 42(%rax)
	leal	11(%r8), %ecx
	movb	%sil, 40(%rax)
	cmpl	%ecx, %edx
	jbe	.L4357
	movzbl	44(%rax), %ecx
	movzbl	46(%rax), %esi
	movb	%cl, 46(%rax)
	leal	12(%r8), %ecx
	movb	%sil, 44(%rax)
	cmpl	%ecx, %edx
	jbe	.L4357
	movzbl	48(%rax), %ecx
	movzbl	50(%rax), %esi
	movb	%cl, 50(%rax)
	leal	13(%r8), %ecx
	movb	%sil, 48(%rax)
	cmpl	%ecx, %edx
	jbe	.L4357
	movzbl	52(%rax), %ecx
	movzbl	54(%rax), %esi
	movb	%cl, 54(%rax)
	leal	14(%r8), %ecx
	movb	%sil, 52(%rax)
	cmpl	%ecx, %edx
	jbe	.L4357
	movzbl	56(%rax), %ecx
	movzbl	58(%rax), %esi
	movb	%cl, 58(%rax)
	leal	15(%r8), %ecx
	movb	%sil, 56(%rax)
	cmpl	%ecx, %edx
	jbe	.L4357
	movzbl	60(%rax), %edx
	movzbl	62(%rax), %ecx
	movb	%dl, 62(%rax)
	movb	%cl, 60(%rax)
.L4357:
	testb	%r15b, %r15b
	je	.L4554
	movl	-5372(%rbp), %eax
	movzbl	%r15b, %r14d
	cmpl	$3, %eax
	movl	%r14d, 8(%r13)
	cmovge	%eax, %r14d
	movq	-5328(%rbp), %rbx
	movl	%r14d, 12(%r13)
	movq	(%rbx), %rax
	movq	24(%rbx), %r12
	movl	(%rax), %edx
	imull	4(%rax), %edx
	movl	%edx, %r15d
	testl	%edx, %edx
	jns	.L4555
.L4507:
	vzeroupper
.L4347:
	leaq	.LC23(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
.L4515:
	movl	$0, -5316(%rbp)
	jmp	.L4242
.L4260:
	vmovq	%rdx, %xmm4
	vpunpcklqdq	%xmm4, %xmm4, %xmm0
	movl	$0, 48(%r13)
	movb	$0, 56(%r13)
	vmovdqu	%xmm0, 192(%r13)
	jmp	.L4244
.L4520:
	cltq
	addq	%rbx, %rax
	vmovq	%rcx, %xmm5
	vpinsrq	$1, %rax, %xmm5, %xmm0
	movzbl	56(%r13), %edx
	vmovdqu	%xmm0, 192(%r13)
	jmp	.L4264
.L4267:
	cltq
	addq	%rax, %rbx
	vmovq	%rcx, %xmm1
	vpinsrq	$1, %rbx, %xmm1, %xmm0
	movzbl	56(%r13), %edx
	vmovdqu	%xmm0, 192(%r13)
	jmp	.L4266
.L4555:
	movl	$2147483647, %eax
	cltd
	idivl	%r14d
	cmpl	%r15d, %eax
	jl	.L4507
	movl	%r14d, %edi
	imull	%r15d, %edi
	movslq	%edi, %rdi
	vzeroupper
	call	malloc@PLT
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L4347
	cmpl	$3, %r14d
	je	.L4400
	movl	%r15d, %ecx
	xorl	%edx, %edx
	testl	%r15d, %r15d
	je	.L4402
	.p2align 4,,10
	.p2align 3
.L4404:
	movzbl	(%r12,%rdx), %eax
	sall	$2, %eax
	cltq
	movl	-1088(%rbp,%rax), %eax
	movl	%eax, (%rbx,%rdx,4)
	incq	%rdx
	cmpq	%rdx, %rcx
	jne	.L4404
.L4402:
	movq	%r12, %rdi
	call	free@PLT
	movq	-5328(%rbp), %rax
	movq	%rbx, 24(%rax)
.L4405:
	movq	-5328(%rbp), %rbx
	movq	16(%rbx), %rdi
	call	free@PLT
	movq	$0, 16(%rbx)
	movq	%r13, %rdi
	call	stbi__get32be
	movl	$1, -5316(%rbp)
	jmp	.L4242
.L4414:
	xorl	%ebx, %ebx
	jmp	.L4278
.L4525:
	movl	-5364(%rbp), %eax
	movl	-5452(%rbp), %edx
	pushq	%rax
	movq	%rcx, %rdi
	movl	%r12d, %r8d
	pushq	%rsi
	movq	-5464(%rbp), %rsi
	movl	%ebx, %ecx
	call	stbi__create_png_image_raw
	popq	%rdi
	popq	%r8
	testl	%eax, %eax
	je	.L4515
	jmp	.L4346
.L4524:
	cmpl	$3, -5372(%rbp)
	je	.L4341
	testb	%r15b, %r15b
	jne	.L4341
	movl	-5372(%rbp), %eax
	movl	%eax, -5400(%rbp)
	jmp	.L4342
.L4554:
	cmpb	$0, -5393(%rbp)
	je	.L4508
	incl	8(%r13)
	vzeroupper
	jmp	.L4405
.L4283:
	leaq	.LC203(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	movl	$0, -5316(%rbp)
	jmp	.L4242
.L4338:
	movq	-5168(%rbp), %rdi
	call	free@PLT
	movq	-5328(%rbp), %rax
	movq	$0, 16(%rax)
	jmp	.L4242
.L4288:
	leaq	.LC275(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	movl	$0, -5316(%rbp)
	jmp	.L4242
.L4300:
	leaq	.LC281(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L4242
.L4293:
	leaq	.LC279(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	movl	$0, -5316(%rbp)
	jmp	.L4242
.L4378:
	movl	stbi__de_iphone_flag_global(%rip), %r9d
	testl	%r9d, %r9d
	setne	%al
	jmp	.L4379
.L4508:
	vzeroupper
	jmp	.L4405
.L4550:
	testl	%eax, %eax
	jne	.L4556
	cmpl	$2, %esi
	je	.L4360
	testl	%ecx, %ecx
	je	.L4362
	movzwl	-5302(%rbp), %esi
	movzwl	-5300(%rbp), %edi
	movzwl	-5298(%rbp), %r8d
	leaq	(%rdx,%rcx,8), %rax
	jmp	.L4367
.L4366:
	addq	$8, %rdx
	cmpq	%rax, %rdx
	je	.L4362
.L4367:
	cmpw	%si, (%rdx)
	jne	.L4366
	cmpw	%di, 2(%rdx)
	jne	.L4366
	cmpw	%r8w, 4(%rdx)
	jne	.L4366
	xorl	%ebx, %ebx
	movw	%bx, 6(%rdx)
	jmp	.L4366
.L4400:
	testl	%r15d, %r15d
	je	.L4402
	movl	%r15d, %eax
	leaq	(%rax,%rax,2), %rdi
	movq	%r12, %rcx
	addq	%rbx, %rdi
	movq	%rbx, %rdx
	.p2align 4,,10
	.p2align 3
.L4403:
	movzbl	(%rcx), %eax
	addq	$3, %rdx
	sall	$2, %eax
	cltq
	movzbl	-1088(%rbp,%rax), %esi
	incq	%rcx
	movb	%sil, -3(%rdx)
	movzbl	-1087(%rbp,%rax), %esi
	movzbl	-1086(%rbp,%rax), %eax
	movb	%sil, -2(%rdx)
	movb	%al, -1(%rdx)
	cmpq	%rdi, %rdx
	jne	.L4403
	jmp	.L4402
.L4537:
	movbel	%eax, invalid_chunk.48(%rip)
	leaq	invalid_chunk.48(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L4242
.L4530:
	leaq	.LC272(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L4242
.L4533:
	leaq	.LC286(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L4242
.L4531:
	leaq	.LC273(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	movl	$0, -5316(%rbp)
	jmp	.L4242
.L4526:
	leaq	.LC282(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L4242
.L4536:
	leaq	.LC287(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	movl	$0, -5316(%rbp)
	jmp	.L4242
.L4534:
	movzbl	%r15b, %eax
	movl	%eax, 8(%r13)
	movl	$1, -5316(%rbp)
	jmp	.L4242
.L4321:
	leaq	.LC284(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L4242
.L4545:
	leaq	.LC276(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	movl	$0, -5316(%rbp)
	jmp	.L4242
.L4546:
	leaq	.LC277(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	movl	$0, -5316(%rbp)
	jmp	.L4242
.L4547:
	leaq	.LC278(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	movl	$0, -5316(%rbp)
	jmp	.L4242
.L4369:
	testl	%ecx, %ecx
	je	.L4362
	leal	-1(%rcx), %edi
	movzbl	-1091(%rbp), %r8d
	cmpl	$31, %edi
	jbe	.L4424
	movl	%edi, %esi
	shrl	$5, %esi
	decl	%esi
	vmovd	%r8d, %xmm4
	salq	$6, %rsi
	vmovdqa	.LC2(%rip), %ymm2
	vpbroadcastb	%xmm4, %ymm4
	movq	%rdx, %rax
	leaq	64(%rdx,%rsi), %rsi
	vpxor	%xmm3, %xmm3, %xmm3
.L4372:
	vpand	(%rax), %ymm2, %ymm0
	vpand	32(%rax), %ymm2, %ymm1
	addq	$64, %rax
	vpackuswb	%ymm1, %ymm0, %ymm0
	vpermq	$216, %ymm0, %ymm0
	vpcmpeqb	%ymm4, %ymm0, %ymm0
	vpcmpeqb	%ymm3, %ymm0, %ymm0
	vpextrb	$0, %xmm0, -63(%rax)
	vpextrb	$1, %xmm0, -61(%rax)
	vpextrb	$2, %xmm0, -59(%rax)
	vpextrb	$3, %xmm0, -57(%rax)
	vpextrb	$4, %xmm0, -55(%rax)
	vpextrb	$5, %xmm0, -53(%rax)
	vpextrb	$6, %xmm0, -51(%rax)
	vpextrb	$7, %xmm0, -49(%rax)
	vpextrb	$8, %xmm0, -47(%rax)
	vpextrb	$9, %xmm0, -45(%rax)
	vpextrb	$10, %xmm0, -43(%rax)
	vpextrb	$11, %xmm0, -41(%rax)
	vpextrb	$12, %xmm0, -39(%rax)
	vpextrb	$13, %xmm0, -37(%rax)
	vpextrb	$14, %xmm0, -35(%rax)
	vpextrb	$15, %xmm0, -33(%rax)
	vextracti128	$0x1, %ymm0, %xmm0
	vpextrb	$0, %xmm0, -31(%rax)
	vpextrb	$1, %xmm0, -29(%rax)
	vpextrb	$2, %xmm0, -27(%rax)
	vpextrb	$3, %xmm0, -25(%rax)
	vpextrb	$4, %xmm0, -23(%rax)
	vpextrb	$5, %xmm0, -21(%rax)
	vpextrb	$6, %xmm0, -19(%rax)
	vpextrb	$7, %xmm0, -17(%rax)
	vpextrb	$8, %xmm0, -15(%rax)
	vpextrb	$9, %xmm0, -13(%rax)
	vpextrb	$10, %xmm0, -11(%rax)
	vpextrb	$11, %xmm0, -9(%rax)
	vpextrb	$12, %xmm0, -7(%rax)
	vpextrb	$13, %xmm0, -5(%rax)
	vpextrb	$14, %xmm0, -3(%rax)
	vpextrb	$15, %xmm0, -1(%rax)
	cmpq	%rsi, %rax
	jne	.L4372
	movl	%edi, %eax
	andl	$-32, %eax
	movl	%eax, %esi
	leaq	(%rdx,%rsi,2), %rsi
.L4371:
	subl	%eax, %edi
	movl	%edi, %r9d
	cmpl	$15, %edi
	jbe	.L4373
	movl	%eax, %edi
	addq	%rdi, %rdi
	vmovdqa	.LC5(%rip), %xmm1
	leaq	(%rdx,%rdi), %r11
	vpand	(%r11), %xmm1, %xmm0
	vpand	16(%r11), %xmm1, %xmm1
	vpackuswb	%xmm1, %xmm0, %xmm0
	vmovd	%r8d, %xmm1
	vpbroadcastb	%xmm1, %xmm1
	vpcmpeqb	%xmm1, %xmm0, %xmm0
	vpxor	%xmm1, %xmm1, %xmm1
	vpcmpeqb	%xmm1, %xmm0, %xmm0
	vpextrb	$0, %xmm0, 1(%rdx,%rdi)
	vpextrb	$1, %xmm0, 3(%rdx,%rdi)
	vpextrb	$2, %xmm0, 5(%rdx,%rdi)
	vpextrb	$3, %xmm0, 7(%rdx,%rdi)
	vpextrb	$4, %xmm0, 9(%rdx,%rdi)
	vpextrb	$5, %xmm0, 11(%rdx,%rdi)
	vpextrb	$6, %xmm0, 13(%rdx,%rdi)
	vpextrb	$7, %xmm0, 15(%rdx,%rdi)
	vpextrb	$8, %xmm0, 17(%rdx,%rdi)
	vpextrb	$9, %xmm0, 19(%rdx,%rdi)
	vpextrb	$10, %xmm0, 21(%rdx,%rdi)
	vpextrb	$11, %xmm0, 23(%rdx,%rdi)
	vpextrb	$12, %xmm0, 25(%rdx,%rdi)
	vpextrb	$13, %xmm0, 27(%rdx,%rdi)
	vpextrb	$14, %xmm0, 29(%rdx,%rdi)
	vpextrb	$15, %xmm0, 31(%rdx,%rdi)
	movl	%r9d, %edx
	andl	$-16, %edx
	movl	%edx, %edi
	leaq	(%rsi,%rdi,2), %rsi
	addl	%edx, %eax
.L4373:
	cmpb	%r8b, (%rsi)
	setne	%dl
	negl	%edx
	movb	%dl, 1(%rsi)
	leal	1(%rax), %edx
	cmpl	%edx, %ecx
	jbe	.L4362
	cmpb	%r8b, 2(%rsi)
	setne	%dl
	negl	%edx
	movb	%dl, 3(%rsi)
	leal	2(%rax), %edx
	cmpl	%edx, %ecx
	jbe	.L4362
	cmpb	%r8b, 4(%rsi)
	setne	%dl
	negl	%edx
	movb	%dl, 5(%rsi)
	leal	3(%rax), %edx
	cmpl	%edx, %ecx
	jbe	.L4362
	cmpb	%r8b, 6(%rsi)
	setne	%dl
	negl	%edx
	movb	%dl, 7(%rsi)
	leal	4(%rax), %edx
	cmpl	%edx, %ecx
	jbe	.L4362
	cmpb	%r8b, 8(%rsi)
	setne	%dl
	negl	%edx
	movb	%dl, 9(%rsi)
	leal	5(%rax), %edx
	cmpl	%edx, %ecx
	jbe	.L4362
	cmpb	%r8b, 10(%rsi)
	setne	%dl
	negl	%edx
	movb	%dl, 11(%rsi)
	leal	6(%rax), %edx
	cmpl	%edx, %ecx
	jbe	.L4362
	cmpb	%r8b, 12(%rsi)
	setne	%dl
	negl	%edx
	movb	%dl, 13(%rsi)
	leal	7(%rax), %edx
	cmpl	%edx, %ecx
	jbe	.L4362
	cmpb	%r8b, 14(%rsi)
	setne	%dl
	negl	%edx
	movb	%dl, 15(%rsi)
	leal	8(%rax), %edx
	cmpl	%edx, %ecx
	jbe	.L4362
	cmpb	%r8b, 16(%rsi)
	setne	%dl
	negl	%edx
	movb	%dl, 17(%rsi)
	leal	9(%rax), %edx
	cmpl	%edx, %ecx
	jbe	.L4362
	cmpb	%r8b, 18(%rsi)
	setne	%dl
	negl	%edx
	movb	%dl, 19(%rsi)
	leal	10(%rax), %edx
	cmpl	%edx, %ecx
	jbe	.L4362
	cmpb	%r8b, 20(%rsi)
	setne	%dl
	negl	%edx
	movb	%dl, 21(%rsi)
	leal	11(%rax), %edx
	cmpl	%edx, %ecx
	jbe	.L4362
	cmpb	%r8b, 22(%rsi)
	setne	%dl
	negl	%edx
	movb	%dl, 23(%rsi)
	leal	12(%rax), %edx
	cmpl	%edx, %ecx
	jbe	.L4362
	cmpb	%r8b, 24(%rsi)
	setne	%dl
	negl	%edx
	movb	%dl, 25(%rsi)
	leal	13(%rax), %edx
	cmpl	%edx, %ecx
	jbe	.L4362
	cmpb	%r8b, 26(%rsi)
	setne	%dl
	negl	%edx
	movb	%dl, 27(%rsi)
	leal	14(%rax), %edx
	cmpl	%edx, %ecx
	jbe	.L4362
	cmpb	%r8b, 28(%rsi)
	setne	%dl
	negl	%edx
	addl	$15, %eax
	movb	%dl, 29(%rsi)
	cmpl	%eax, %ecx
	jbe	.L4362
	cmpb	%r8b, 30(%rsi)
	setne	%al
	negl	%eax
	movb	%al, 31(%rsi)
	jmp	.L4362
.L4528:
	leaq	.LC285(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L4242
.L4349:
	movq	-5344(%rbp), %rdi
	movl	%eax, -5316(%rbp)
	call	free@PLT
	jmp	.L4242
.L4548:
	movl	$4, 8(%r13)
	movl	$1, -5316(%rbp)
	jmp	.L4242
.L4549:
	leaq	.LC283(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L4242
.L4387:
	movl	stbi__unpremultiply_on_load_global(%rip), %esi
	testl	%esi, %esi
	je	.L4389
.L4388:
	movl	%edx, %eax
	leaq	(%rcx,%rax,4), %rdi
	testl	%edx, %edx
	je	.L4357
.L4392:
	movzbl	3(%rcx), %esi
	movzbl	(%rcx), %r10d
	movzbl	2(%rcx), %r9d
	testb	%sil, %sil
	je	.L4390
	movzbl	1(%rcx), %edx
	movl	%esi, %r8d
	movl	%edx, %eax
	shrb	%r8b
	sall	$8, %eax
	movzbl	%r8b, %r8d
	subl	%edx, %eax
	addl	%r8d, %eax
	cltd
	idivl	%esi
	addq	$4, %rcx
	movb	%al, -3(%rcx)
	movl	%r10d, %eax
	sall	$8, %eax
	subl	%r10d, %eax
	addl	%r8d, %eax
	cltd
	idivl	%esi
	movb	%al, -2(%rcx)
	movl	%r9d, %eax
	sall	$8, %eax
	subl	%r9d, %eax
	addl	%r8d, %eax
	cltd
	idivl	%esi
	movb	%al, -4(%rcx)
	cmpq	%rcx, %rdi
	jne	.L4392
	jmp	.L4357
.L4390:
	movb	%r10b, 2(%rcx)
	movb	%r9b, (%rcx)
	addq	$4, %rcx
	cmpq	%rdi, %rcx
	jne	.L4392
	jmp	.L4357
.L4552:
	testl	%edx, %edx
	je	.L4357
	leal	-1(%rdx), %eax
	cmpl	$30, %eax
	movq	%rcx, %rax
	jbe	.L4425
	movl	%edx, %esi
	shrl	$5, %esi
	decl	%esi
	leaq	(%rsi,%rsi,2), %rsi
	salq	$5, %rsi
	leaq	96(%rcx,%rsi), %rsi
.L4382:
	vmovdqu	32(%rax), %ymm1
	vmovdqu	(%rax), %ymm2
	vmovdqu	64(%rax), %ymm0
	vmovdqa	%xmm2, %xmm4
	vmovdqa	%xmm1, %xmm3
	vmovdqa	%xmm0, %xmm5
	vpextrb	$2, %xmm2, (%rax)
	vpextrb	$5, %xmm2, 3(%rax)
	vpextrb	$8, %xmm2, 6(%rax)
	vpextrb	$11, %xmm2, 9(%rax)
	vpextrb	$14, %xmm2, 12(%rax)
	vpextrb	$0, %xmm1, 30(%rax)
	vextracti128	$0x1, %ymm2, %xmm2
	vpextrb	$3, %xmm1, 33(%rax)
	vpextrb	$6, %xmm1, 36(%rax)
	vpextrb	$9, %xmm1, 39(%rax)
	vpextrb	$12, %xmm1, 42(%rax)
	vpextrb	$15, %xmm1, 45(%rax)
	vpextrb	$1, %xmm0, 63(%rax)
	vextracti128	$0x1, %ymm1, %xmm1
	vpextrb	$4, %xmm0, 66(%rax)
	vpextrb	$7, %xmm0, 69(%rax)
	vpextrb	$10, %xmm0, 72(%rax)
	vpextrb	$13, %xmm0, 75(%rax)
	vextracti128	$0x1, %ymm0, %xmm0
	vpextrb	$1, %xmm2, 15(%rax)
	vpextrb	$4, %xmm2, 18(%rax)
	vpextrb	$7, %xmm2, 21(%rax)
	vpextrb	$10, %xmm2, 24(%rax)
	vpextrb	$13, %xmm2, 27(%rax)
	vpextrb	$2, %xmm1, 48(%rax)
	vpextrb	$5, %xmm1, 51(%rax)
	vpextrb	$8, %xmm1, 54(%rax)
	vpextrb	$11, %xmm1, 57(%rax)
	vpextrb	$14, %xmm1, 60(%rax)
	vpextrb	$0, %xmm0, 78(%rax)
	vpextrb	$3, %xmm0, 81(%rax)
	vpextrb	$6, %xmm0, 84(%rax)
	vpextrb	$9, %xmm0, 87(%rax)
	vpextrb	$12, %xmm0, 90(%rax)
	vpextrb	$15, %xmm0, 93(%rax)
	vpextrb	$0, %xmm4, 2(%rax)
	vpextrb	$3, %xmm4, 5(%rax)
	vpextrb	$6, %xmm4, 8(%rax)
	vpextrb	$9, %xmm4, 11(%rax)
	vpextrb	$12, %xmm4, 14(%rax)
	vpextrb	$15, %xmm4, 17(%rax)
	vpextrb	$2, %xmm2, 20(%rax)
	vpextrb	$5, %xmm2, 23(%rax)
	vpextrb	$8, %xmm2, 26(%rax)
	vpextrb	$11, %xmm2, 29(%rax)
	vpextrb	$14, %xmm2, 32(%rax)
	vpextrb	$1, %xmm3, 35(%rax)
	vpextrb	$4, %xmm3, 38(%rax)
	vpextrb	$7, %xmm3, 41(%rax)
	vpextrb	$10, %xmm3, 44(%rax)
	vpextrb	$13, %xmm3, 47(%rax)
	vpextrb	$0, %xmm1, 50(%rax)
	vpextrb	$3, %xmm1, 53(%rax)
	vpextrb	$6, %xmm1, 56(%rax)
	vpextrb	$9, %xmm1, 59(%rax)
	vpextrb	$12, %xmm1, 62(%rax)
	vpextrb	$15, %xmm1, 65(%rax)
	vpextrb	$2, %xmm5, 68(%rax)
	vpextrb	$5, %xmm5, 71(%rax)
	vpextrb	$8, %xmm5, 74(%rax)
	vpextrb	$11, %xmm5, 77(%rax)
	vpextrb	$14, %xmm5, 80(%rax)
	vpextrb	$1, %xmm0, 83(%rax)
	vpextrb	$4, %xmm0, 86(%rax)
	vpextrb	$7, %xmm0, 89(%rax)
	vpextrb	$10, %xmm0, 92(%rax)
	vpextrb	$13, %xmm0, 95(%rax)
	addq	$96, %rax
	cmpq	%rsi, %rax
	jne	.L4382
	movl	%edx, %esi
	andl	$-32, %esi
	movl	%esi, %eax
	leaq	(%rax,%rax,2), %rax
	addq	%rcx, %rax
	cmpl	%esi, %edx
	je	.L4357
.L4381:
	movl	%edx, %r9d
	subl	%esi, %r9d
	leal	-1(%r9), %edi
	cmpl	$14, %edi
	jbe	.L4384
	movl	%esi, %edi
	leaq	(%rdi,%rdi,2), %r8
	leaq	(%rcx,%r8), %rdi
	vmovdqu	32(%rdi), %xmm0
	vmovdqu	(%rdi), %xmm1
	vmovdqu	16(%rdi), %xmm2
	vpextrb	$2, %xmm1, (%rdi)
	vpextrb	$5, %xmm1, 3(%rdi)
	vpextrb	$8, %xmm1, 6(%rdi)
	vpextrb	$11, %xmm1, 9(%rdi)
	vpextrb	$14, %xmm1, 12(%rdi)
	vpextrb	$1, %xmm2, 15(%rdi)
	vpextrb	$4, %xmm2, 18(%rdi)
	vpextrb	$7, %xmm2, 21(%rdi)
	vpextrb	$10, %xmm2, 24(%rdi)
	vpextrb	$13, %xmm2, 27(%rdi)
	vpextrb	$0, %xmm0, 30(%rdi)
	vpextrb	$3, %xmm0, 33(%rdi)
	vpextrb	$6, %xmm0, 36(%rdi)
	vpextrb	$9, %xmm0, 39(%rdi)
	vpextrb	$12, %xmm0, 42(%rdi)
	vpextrb	$15, %xmm0, 45(%rdi)
	vpextrb	$0, %xmm1, 2(%rcx,%r8)
	vpextrb	$3, %xmm1, 5(%rcx,%r8)
	vpextrb	$6, %xmm1, 8(%rcx,%r8)
	vpextrb	$9, %xmm1, 11(%rcx,%r8)
	vpextrb	$12, %xmm1, 14(%rcx,%r8)
	vpextrb	$15, %xmm1, 17(%rcx,%r8)
	vpextrb	$2, %xmm2, 20(%rcx,%r8)
	vpextrb	$5, %xmm2, 23(%rcx,%r8)
	vpextrb	$8, %xmm2, 26(%rcx,%r8)
	vpextrb	$11, %xmm2, 29(%rcx,%r8)
	vpextrb	$14, %xmm2, 32(%rcx,%r8)
	vpextrb	$1, %xmm0, 35(%rcx,%r8)
	vpextrb	$4, %xmm0, 38(%rcx,%r8)
	vpextrb	$7, %xmm0, 41(%rcx,%r8)
	vpextrb	$10, %xmm0, 44(%rcx,%r8)
	vpextrb	$13, %xmm0, 47(%rcx,%r8)
	movl	%r9d, %ecx
	andl	$-16, %ecx
	movl	%ecx, %edi
	leaq	(%rdi,%rdi,2), %rdi
	addq	%rdi, %rax
	addl	%ecx, %esi
	cmpl	%ecx, %r9d
	je	.L4357
.L4384:
	movzbl	(%rax), %ecx
	movzbl	2(%rax), %edi
	movb	%cl, 2(%rax)
	leal	1(%rsi), %ecx
	movb	%dil, (%rax)
	cmpl	%edx, %ecx
	jnb	.L4357
	movzbl	3(%rax), %ecx
	movzbl	5(%rax), %edi
	movb	%cl, 5(%rax)
	leal	2(%rsi), %ecx
	movb	%dil, 3(%rax)
	cmpl	%ecx, %edx
	jbe	.L4357
	movzbl	6(%rax), %ecx
	movzbl	8(%rax), %edi
	movb	%cl, 8(%rax)
	leal	3(%rsi), %ecx
	movb	%dil, 6(%rax)
	cmpl	%ecx, %edx
	jbe	.L4357
	movzbl	9(%rax), %ecx
	movzbl	11(%rax), %edi
	movb	%cl, 11(%rax)
	leal	4(%rsi), %ecx
	movb	%dil, 9(%rax)
	cmpl	%ecx, %edx
	jbe	.L4357
	movzbl	12(%rax), %ecx
	movzbl	14(%rax), %edi
	movb	%cl, 14(%rax)
	leal	5(%rsi), %ecx
	movb	%dil, 12(%rax)
	cmpl	%ecx, %edx
	jbe	.L4357
	movzbl	15(%rax), %ecx
	movzbl	17(%rax), %edi
	movb	%cl, 17(%rax)
	leal	6(%rsi), %ecx
	movb	%dil, 15(%rax)
	cmpl	%ecx, %edx
	jbe	.L4357
	movzbl	18(%rax), %ecx
	movzbl	20(%rax), %edi
	movb	%cl, 20(%rax)
	leal	7(%rsi), %ecx
	movb	%dil, 18(%rax)
	cmpl	%ecx, %edx
	jbe	.L4357
	movzbl	21(%rax), %ecx
	movzbl	23(%rax), %edi
	movb	%cl, 23(%rax)
	leal	8(%rsi), %ecx
	movb	%dil, 21(%rax)
	cmpl	%ecx, %edx
	jbe	.L4357
	movzbl	24(%rax), %ecx
	movzbl	26(%rax), %edi
	movb	%cl, 26(%rax)
	leal	9(%rsi), %ecx
	movb	%dil, 24(%rax)
	cmpl	%ecx, %edx
	jbe	.L4357
	movzbl	27(%rax), %ecx
	movzbl	29(%rax), %edi
	movb	%cl, 29(%rax)
	leal	10(%rsi), %ecx
	movb	%dil, 27(%rax)
	cmpl	%ecx, %edx
	jbe	.L4357
	movzbl	30(%rax), %ecx
	movzbl	32(%rax), %edi
	movb	%cl, 32(%rax)
	leal	11(%rsi), %ecx
	movb	%dil, 30(%rax)
	cmpl	%ecx, %edx
	jbe	.L4357
	movzbl	33(%rax), %ecx
	movzbl	35(%rax), %edi
	movb	%cl, 35(%rax)
	leal	12(%rsi), %ecx
	movb	%dil, 33(%rax)
	cmpl	%ecx, %edx
	jbe	.L4357
	movzbl	36(%rax), %ecx
	movzbl	38(%rax), %edi
	movb	%cl, 38(%rax)
	leal	13(%rsi), %ecx
	movb	%dil, 36(%rax)
	cmpl	%ecx, %edx
	jbe	.L4357
	movzbl	39(%rax), %ecx
	movzbl	41(%rax), %edi
	addl	$14, %esi
	movb	%dil, 39(%rax)
	movb	%cl, 41(%rax)
	cmpl	%esi, %edx
	jbe	.L4357
	movzbl	42(%rax), %edx
	movzbl	44(%rax), %ecx
	movb	%dl, 44(%rax)
	movb	%cl, 42(%rax)
	jmp	.L4357
.L4424:
	movq	%rdx, %rsi
	jmp	.L4371
.L4519:
	call	__stack_chk_fail@PLT
.L4337:
	movq	-5328(%rbp), %rax
	movq	$0, 16(%rax)
	jmp	.L4242
.L4556:
	leaq	__PRETTY_FUNCTION__.46(%rip), %rcx
	movl	$4884, %edx
	leaq	.LC21(%rip), %rsi
	leaq	.LC293(%rip), %rdi
	call	__assert_fail@PLT
.L4426:
	xorl	%r8d, %r8d
	jmp	.L4394
.L4553:
	leaq	__PRETTY_FUNCTION__.44(%rip), %rcx
	movl	$4992, %edx
	leaq	.LC21(%rip), %rsi
	leaq	.LC294(%rip), %rdi
	vzeroupper
	call	__assert_fail@PLT
.L4551:
	leaq	__PRETTY_FUNCTION__.45(%rip), %rcx
	movl	$4859, %edx
	leaq	.LC21(%rip), %rsi
	leaq	.LC293(%rip), %rdi
	call	__assert_fail@PLT
.L4425:
	xorl	%esi, %esi
	jmp	.L4381
.L4423:
	movq	%rdx, %r8
	jmp	.L4363
	.cfi_endproc
.LFE715:
	.size	stbi__parse_png_file, .-stbi__parse_png_file
	.section	.text.unlikely,"ax",@progbits
.LCOLDB295:
	.text
.LHOTB295:
	.p2align 4
	.type	stbi__hdr_gettoken, @function
stbi__hdr_gettoken:
.LFB759:
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
	movq	%rsi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	movq	192(%rdi), %rax
	movq	16(%rdi), %r8
	cmpq	200(%rdi), %rax
	jb	.L4601
	movl	48(%rdi), %edi
	xorl	%r14d, %r14d
	testl	%edi, %edi
	jne	.L4602
.L4559:
	xorl	%ebp, %ebp
	leaq	57(%rbx), %rax
	cmpq	$0, 16(%rbx)
	movq	%rax, (%rsp)
	leaq	56(%rbx), %r15
	movl	%ebp, %r13d
	je	.L4583
.L4606:
	movq	40(%rbx), %rdi
	call	*32(%rbx)
	testl	%eax, %eax
	je	.L4584
	movl	48(%rbx), %eax
	testl	%eax, %eax
	je	.L4600
.L4583:
	movq	200(%rbx), %rax
	cmpq	%rax, 192(%rbx)
	jnb	.L4600
.L4584:
	cmpb	$10, %r14b
	je	.L4572
	movb	%r14b, (%r12,%rbp)
	cmpq	$1022, %rbp
	je	.L4603
	movq	192(%rbx), %rax
	movq	16(%rbx), %r8
	cmpq	200(%rbx), %rax
	jb	.L4604
	movl	48(%rbx), %edx
	xorl	%r14d, %r14d
	testl	%edx, %edx
	jne	.L4605
.L4580:
	incq	%rbp
	cmpq	$0, 16(%rbx)
	movl	%ebp, %r13d
	jne	.L4606
	jmp	.L4583
	.p2align 4,,10
	.p2align 3
.L4604:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rbx)
	movzbl	(%rax), %r14d
	jmp	.L4580
	.p2align 4,,10
	.p2align 3
.L4600:
	movslq	%r13d, %rbp
.L4572:
	movb	$0, (%r12,%rbp)
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	movq	%r12, %rax
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
.L4605:
	.cfi_restore_state
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%r15, %rsi
	call	*%r8
	movq	192(%rbx), %rdx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	testl	%eax, %eax
	je	.L4607
	cltq
	movzbl	56(%rbx), %r14d
	addq	%r15, %rax
.L4582:
	vmovq	(%rsp), %xmm1
	vpinsrq	$1, %rax, %xmm1, %xmm0
	vmovdqu	%xmm0, 192(%rbx)
	jmp	.L4580
	.p2align 4,,10
	.p2align 3
.L4607:
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	movq	(%rsp), %rax
	jmp	.L4582
	.p2align 4,,10
	.p2align 3
.L4601:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rdi)
	movzbl	(%rax), %r14d
	jmp	.L4559
	.p2align 4,,10
	.p2align 3
.L4602:
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	leaq	56(%rbx), %rbp
	movq	%rbp, %rsi
	call	*%r8
	movq	192(%rbx), %rdx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	leaq	57(%rbx), %rdx
	testl	%eax, %eax
	jne	.L4560
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	movq	%rdx, %rbp
.L4561:
	vmovq	%rdx, %xmm2
	vpinsrq	$1, %rbp, %xmm2, %xmm0
	vmovdqu	%xmm0, 192(%rbx)
	jmp	.L4559
	.p2align 4,,10
	.p2align 3
.L4560:
	cltq
	movzbl	56(%rbx), %r14d
	addq	%rax, %rbp
	jmp	.L4561
.L4603:
	leaq	57(%rbx), %r13
	vmovq	%r13, %xmm4
	vpunpcklqdq	%xmm4, %xmm4, %xmm3
	movq	16(%rbx), %rbp
	leaq	56(%rbx), %r14
	vmovdqa	%xmm3, (%rsp)
.L4563:
	testq	%rbp, %rbp
	je	.L4571
.L4568:
	movq	40(%rbx), %rdi
	call	*32(%rbx)
	testl	%eax, %eax
	je	.L4570
	movl	48(%rbx), %esi
	testl	%esi, %esi
	je	.L4566
.L4571:
	movq	192(%rbx), %rax
	cmpq	200(%rbx), %rax
	jnb	.L4566
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rbx)
	cmpb	$10, (%rax)
	je	.L4566
	testq	%rbp, %rbp
	je	.L4565
.L4599:
	movq	16(%rbx), %rbp
	testq	%rbp, %rbp
	jne	.L4568
	jmp	.L4571
.L4570:
	movq	192(%rbx), %rax
	cmpq	200(%rbx), %rax
	jb	.L4608
	movl	48(%rbx), %ecx
	movq	16(%rbx), %rbp
	testl	%ecx, %ecx
	je	.L4563
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%r14, %rsi
	call	*%rbp
	movq	192(%rbx), %rdx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	testl	%eax, %eax
	jne	.L4577
	vmovdqa	(%rsp), %xmm5
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	movq	16(%rbx), %rbp
	vmovdqu	%xmm5, 192(%rbx)
	jmp	.L4563
.L4577:
	cltq
	addq	%r14, %rax
	vmovq	%r13, %xmm6
	vpinsrq	$1, %rax, %xmm6, %xmm0
	cmpb	$10, 56(%rbx)
	vmovdqu	%xmm0, 192(%rbx)
	jne	.L4599
.L4566:
	movl	$1023, %ebp
	jmp	.L4572
.L4608:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rbx)
	cmpb	$10, (%rax)
	jne	.L4599
	jmp	.L4566
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.type	stbi__hdr_gettoken.cold, @function
stbi__hdr_gettoken.cold:
.LFSB759:
.L4565:
	.cfi_def_cfa_offset 80
	.cfi_offset 3, -56
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
	.cfi_offset 15, -16
	movq	200(%rbx), %rdx
.L4567:
	movq	192(%rbx), %rax
	cmpq	%rax, %rdx
	jbe	.L4566
	leaq	1(%rax), %rcx
	movq	%rcx, 192(%rbx)
	cmpb	$10, (%rax)
	jne	.L4567
	jmp	.L4566
	.cfi_endproc
.LFE759:
	.text
	.size	stbi__hdr_gettoken, .-stbi__hdr_gettoken
	.section	.text.unlikely
	.size	stbi__hdr_gettoken.cold, .-stbi__hdr_gettoken.cold
.LCOLDE295:
	.text
.LHOTE295:
	.section	.rodata.str1.1
.LC296:
	.string	"FORMAT=32-bit_rle_rgbe"
	.text
	.p2align 4
	.type	stbi__hdr_info, @function
stbi__hdr_info:
.LFB762:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	leaq	.LC296(%rip), %r15
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rsi, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rdx, %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	subq	$1080, %rsp
	.cfi_def_cfa_offset 1136
	movq	%fs:40, %rax
	movq	%rax, 1064(%rsp)
	xorl	%eax, %eax
	leaq	20(%rsp), %rax
	testq	%rsi, %rsi
	cmove	%rax, %r14
	testq	%rdx, %rdx
	cmove	%rax, %r13
	testq	%rcx, %rcx
	cmovne	%rcx, %rax
	leaq	32(%rsp), %rbp
	movq	%rax, 8(%rsp)
	call	stbi__hdr_test
	xorl	%r12d, %r12d
	testl	%eax, %eax
	jne	.L4613
	jmp	.L4630
	.p2align 4,,10
	.p2align 3
.L4631:
	movq	%r15, %rsi
	call	strcmp@PLT
	testl	%eax, %eax
	movl	$1, %eax
	cmove	%eax, %r12d
.L4613:
	movq	%rbx, %rdi
	movq	%rbp, %rsi
	call	stbi__hdr_gettoken
	movq	%rax, 24(%rsp)
	movq	%rax, %rdi
	cmpb	$0, (%rax)
	jne	.L4631
	testl	%r12d, %r12d
	jne	.L4617
	vmovdqu	208(%rbx), %xmm1
	vmovdqu	%xmm1, 192(%rbx)
.L4609:
	movq	1064(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L4632
	addq	$1080, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	movl	%r12d, %eax
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
.L4617:
	.cfi_restore_state
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	stbi__hdr_gettoken
	movq	%rax, 24(%rsp)
	cmpb	$45, (%rax)
	jne	.L4626
	cmpb	$89, 1(%rax)
	jne	.L4626
	cmpb	$32, 2(%rax)
	jne	.L4626
	leaq	3(%rax), %rdi
	movl	$10, %edx
	leaq	24(%rsp), %rsi
	movq	%rdi, 24(%rsp)
	call	strtol@PLT
	movl	%eax, 0(%r13)
	movq	24(%rsp), %rdx
	cmpb	$32, (%rdx)
	jne	.L4620
	leaq	1(%rdx), %rax
	.p2align 4,,10
	.p2align 3
.L4621:
	movq	%rax, 24(%rsp)
	movq	%rax, %rdx
	incq	%rax
	cmpb	$32, -1(%rax)
	je	.L4621
.L4620:
	cmpb	$43, (%rdx)
	jne	.L4627
	cmpb	$88, 1(%rdx)
	jne	.L4627
	cmpb	$32, 2(%rdx)
	jne	.L4627
	leaq	3(%rdx), %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	movq	%rdi, 24(%rsp)
	call	strtol@PLT
	movl	%eax, (%r14)
	movq	8(%rsp), %rax
	movl	$3, (%rax)
	jmp	.L4609
	.p2align 4,,10
	.p2align 3
.L4630:
	vmovdqu	208(%rbx), %xmm0
	movl	%eax, %r12d
	vmovdqu	%xmm0, 192(%rbx)
	jmp	.L4609
	.p2align 4,,10
	.p2align 3
.L4626:
	vmovdqu	208(%rbx), %xmm2
	xorl	%r12d, %r12d
	vmovdqu	%xmm2, 192(%rbx)
	jmp	.L4609
	.p2align 4,,10
	.p2align 3
.L4627:
	vmovdqu	208(%rbx), %xmm3
	xorl	%r12d, %r12d
	vmovdqu	%xmm3, 192(%rbx)
	jmp	.L4609
.L4632:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE762:
	.size	stbi__hdr_info, .-stbi__hdr_info
	.section	.rodata.str1.1
.LC297:
	.string	"#?RADIANCE"
.LC298:
	.string	"#?RGBE"
.LC299:
	.string	"not HDR"
.LC300:
	.string	"unsupported format"
.LC301:
	.string	"unsupported data layout"
	.section	.rodata.str1.8
	.align 8
.LC302:
	.string	"invalid decoded scanline length"
	.text
	.p2align 4
	.type	stbi__hdr_load.constprop.0, @function
stbi__hdr_load.constprop.0:
.LFB890:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movq	%rsi, %r15
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rcx, %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	subq	$1176, %rsp
	.cfi_def_cfa_offset 1232
	movq	%rdx, (%rsp)
	movl	%r8d, 72(%rsp)
	leaq	128(%rsp), %rbp
	movq	%rbp, %rsi
	movq	%fs:40, %rax
	movq	%rax, 1160(%rsp)
	xorl	%eax, %eax
	call	stbi__hdr_gettoken
	movq	%rax, %rdi
	leaq	.LC297(%rip), %rsi
	movq	%rax, %r12
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L4715
	leaq	.LC298(%rip), %rsi
	movq	%r12, %rdi
	call	strcmp@PLT
	movl	%eax, %r14d
	testl	%eax, %eax
	jne	.L4718
.L4634:
	leaq	.LC296(%rip), %r12
	jmp	.L4636
	.p2align 4,,10
	.p2align 3
.L4719:
	movq	%r12, %rsi
	call	strcmp@PLT
	testl	%eax, %eax
	movl	$1, %eax
	cmove	%eax, %r14d
.L4636:
	movq	%rbx, %rdi
	movq	%rbp, %rsi
	call	stbi__hdr_gettoken
	movq	%rax, 112(%rsp)
	movq	%rax, %rdi
	cmpb	$0, (%rax)
	jne	.L4719
	testl	%r14d, %r14d
	je	.L4720
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	stbi__hdr_gettoken
	movq	%rax, 112(%rsp)
	cmpb	$45, (%rax)
	je	.L4721
.L4645:
	leaq	.LC301(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	movq	$0, 16(%rsp)
.L4633:
	movq	1160(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L4722
	movq	16(%rsp), %rax
	addq	$1176, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
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
	ret
	.p2align 4,,10
	.p2align 3
.L4715:
	.cfi_restore_state
	movl	%eax, %r14d
	jmp	.L4634
	.p2align 4,,10
	.p2align 3
.L4721:
	cmpb	$89, 1(%rax)
	jne	.L4645
	cmpb	$32, 2(%rax)
	jne	.L4645
	leaq	3(%rax), %rdi
	leaq	112(%rsp), %rsi
	movl	$10, %edx
	movq	%rdi, 112(%rsp)
	call	strtol@PLT
	movq	112(%rsp), %rdi
	movq	%rax, 32(%rsp)
	cmpb	$32, (%rdi)
	jne	.L4642
	leaq	1(%rdi), %rax
	.p2align 4,,10
	.p2align 3
.L4643:
	movq	%rax, 112(%rsp)
	movq	%rax, %rdi
	incq	%rax
	cmpb	$32, -1(%rax)
	je	.L4643
.L4642:
	cmpb	$43, (%rdi)
	jne	.L4645
	cmpb	$88, 1(%rdi)
	jne	.L4645
	cmpb	$32, 2(%rdi)
	jne	.L4645
	movq	32(%rsp), %rbp
	addq	$3, %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	movl	%ebp, 76(%rsp)
	movq	%rdi, 112(%rsp)
	call	strtol@PLT
	movq	%rax, 48(%rsp)
	movl	%eax, 12(%rsp)
	cmpl	$16777216, %ebp
	jg	.L4647
	cmpl	$16777216, %eax
	jg	.L4647
	movl	%eax, (%r15)
	movl	32(%rsp), %ecx
	movq	(%rsp), %rax
	movl	%ecx, (%rax)
	testq	%r13, %r13
	je	.L4648
	movl	$3, 0(%r13)
.L4648:
	movl	72(%rsp), %ecx
	movl	$3, %eax
	testl	%ecx, %ecx
	cmovne	%ecx, %eax
	movq	48(%rsp), %rcx
	movl	%eax, 72(%rsp)
	movq	32(%rsp), %rax
	movl	%ecx, %esi
	orl	%eax, %esi
	js	.L4647
	testl	%eax, %eax
	je	.L4650
	movl	$2147483647, %eax
	cltd
	idivl	76(%rsp)
	cmpl	%eax, %ecx
	jg	.L4647
.L4650:
	movl	72(%rsp), %eax
	testl	%eax, %eax
	jns	.L4723
	.p2align 4,,10
	.p2align 3
.L4647:
	leaq	.LC203(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	movq	$0, 16(%rsp)
	jmp	.L4633
	.p2align 4,,10
	.p2align 3
.L4720:
	leaq	.LC300(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	movq	$0, 16(%rsp)
	jmp	.L4633
.L4718:
	leaq	.LC299(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	movq	$0, 16(%rsp)
	jmp	.L4633
.L4723:
	movl	$2147483647, %eax
	movl	72(%rsp), %esi
	cltd
	idivl	%esi
	movl	48(%rsp), %ecx
	imull	32(%rsp), %ecx
	cmpl	%ecx, %eax
	jl	.L4647
	imull	%esi, %ecx
	movl	%esi, %edx
	cmpl	$536870911, %ecx
	jg	.L4647
	movl	76(%rsp), %esi
	movl	12(%rsp), %edi
	movl	$4, %ecx
	call	stbi__malloc_mad4.constprop.0
	movq	%rax, 16(%rsp)
	testq	%rax, %rax
	je	.L4724
	movl	48(%rsp), %eax
	subl	$8, %eax
	cmpl	$32759, %eax
	ja	.L4691
	movl	32(%rsp), %r9d
	testl	%r9d, %r9d
	jle	.L4633
	movq	48(%rsp), %rsi
	movl	$0, 80(%rsp)
	movl	%esi, %eax
	sall	$2, %eax
	movq	%rax, 104(%rsp)
	movslq	72(%rsp), %rax
	movl	$0, 84(%rsp)
	movl	%eax, %ecx
	imull	%esi, %ecx
	salq	$2, %rax
	movq	%rax, 96(%rsp)
	leaq	57(%rbx), %rax
	movl	%ecx, 88(%rsp)
	movq	$0, 40(%rsp)
	movq	%rax, (%rsp)
	movl	%r14d, 92(%rsp)
	movq	%rbx, %r14
.L4683:
	movq	%r14, %rdi
	call	stbi__get8
	movq	%r14, %rdi
	movl	%eax, %r12d
	call	stbi__get8
	movq	%r14, %rdi
	movl	%eax, %ebp
	call	stbi__get8
	movzbl	%al, %edx
	cmpb	$2, %r12b
	jne	.L4714
	cmpb	$2, %bpl
	jne	.L4714
	testb	%al, %al
	js	.L4714
	sall	$8, %edx
	movq	%r14, %rdi
	movl	%edx, %ebp
	call	stbi__get8
	movzbl	%al, %eax
	orl	%ebp, %eax
	cmpl	%eax, 12(%rsp)
	jne	.L4725
	cmpq	$0, 40(%rsp)
	je	.L4726
.L4660:
	movq	$0, 56(%rsp)
.L4661:
	movl	12(%rsp), %edx
	testl	%edx, %edx
	je	.L4686
	movq	40(%rsp), %rcx
	xorl	%r13d, %r13d
	addq	$4, %rcx
	movq	192(%r14), %rax
	movq	200(%r14), %rdx
	movq	%r14, %r15
	movq	%rcx, 64(%rsp)
	movl	12(%rsp), %r12d
	movl	%r13d, %r14d
	jmp	.L4681
	.p2align 4,,10
	.p2align 3
.L4662:
	movl	48(%r15), %r8d
	testl	%r8d, %r8d
	jne	.L4727
.L4664:
	movl	12(%rsp), %r12d
	subl	%r14d, %r12d
	testl	%r12d, %r12d
	jle	.L4728
.L4681:
	cmpq	%rdx, %rax
	jnb	.L4662
	leaq	1(%rax), %rsi
	movq	%rsi, 192(%r15)
	movzbl	(%rax), %r13d
.L4663:
	cmpb	$-128, %r13b
	jbe	.L4666
	cmpq	%rdx, %rsi
	jb	.L4729
	movl	48(%r15), %edi
	xorl	%ebx, %ebx
	testl	%edi, %edi
	jne	.L4730
.L4668:
	leal	-128(%r13), %ecx
	movzbl	%cl, %ecx
	cmpl	%r12d, %ecx
	jg	.L4674
	movslq	%r14d, %r9
	leal	-1(%rcx), %edi
	movq	56(%rsp), %r10
	addq	%r9, %rdi
	leal	0(,%r14,4), %eax
	movq	64(%rsp), %r9
	cltq
	addq	%r10, %rax
	addq	%r10, %r9
	addq	40(%rsp), %rax
	leaq	(%r9,%rdi,4), %rdi
	.p2align 4,,10
	.p2align 3
.L4672:
	movb	%bl, (%rax)
	addq	$4, %rax
	cmpq	%rdi, %rax
	jne	.L4672
	addl	%ecx, %r14d
.L4717:
	movq	%rsi, %rax
	jmp	.L4664
	.p2align 4,,10
	.p2align 3
.L4727:
	movl	52(%r15), %edx
	movq	40(%r15), %rdi
	leaq	56(%r15), %rbx
	movq	%rbx, %rsi
	call	*16(%r15)
	movslq	%eax, %rdx
	movq	192(%r15), %rax
	subq	208(%r15), %rax
	addl	%eax, 184(%r15)
	movq	(%rsp), %rax
	testl	%edx, %edx
	jne	.L4665
	vmovq	%rax, %xmm2
	vpunpcklqdq	%xmm2, %xmm2, %xmm0
	movl	$0, 48(%r15)
	movb	$0, 56(%r15)
	vmovdqu	%xmm0, 192(%r15)
	movq	%rax, %rdx
	jmp	.L4664
	.p2align 4,,10
	.p2align 3
.L4729:
	leaq	1(%rsi), %rax
	movq	%rax, 192(%r15)
	movzbl	(%rsi), %ebx
	movq	%rax, %rsi
	jmp	.L4668
	.p2align 4,,10
	.p2align 3
.L4666:
	movzbl	%r13b, %eax
	movl	%eax, 24(%rsp)
	cmpl	%r12d, %eax
	jg	.L4674
	testl	%eax, %eax
	je	.L4717
	movq	56(%rsp), %r11
	leal	0(,%r14,4), %ecx
	movq	40(%rsp), %rax
	movslq	%ecx, %rcx
	addq	%r11, %rcx
	leaq	(%rax,%rcx), %rbx
	movl	24(%rsp), %eax
	movslq	%r14d, %rdi
	decl	%eax
	addq	%rdi, %rax
	movq	64(%rsp), %rdi
	leaq	56(%r15), %r12
	addq	%r11, %rdi
	leaq	(%rdi,%rax,4), %r13
	movq	%rsi, %rax
	jmp	.L4680
	.p2align 4,,10
	.p2align 3
.L4676:
	movl	48(%r15), %esi
	xorl	%ebp, %ebp
	testl	%esi, %esi
	jne	.L4731
.L4677:
	movb	%bpl, (%rbx)
	addq	$4, %rbx
	cmpq	%rbx, %r13
	je	.L4732
.L4680:
	cmpq	%rax, %rdx
	jbe	.L4676
	leaq	1(%rax), %rcx
	movq	%rcx, 192(%r15)
	addq	$4, %rbx
	movzbl	(%rax), %ebp
	movq	%rcx, %rax
	movb	%bpl, -4(%rbx)
	cmpq	%rbx, %r13
	jne	.L4680
.L4732:
	addl	24(%rsp), %r14d
	jmp	.L4664
	.p2align 4,,10
	.p2align 3
.L4731:
	movl	52(%r15), %edx
	movq	40(%r15), %rdi
	movq	%r12, %rsi
	call	*16(%r15)
	movslq	%eax, %rdx
	movq	192(%r15), %rax
	subq	208(%r15), %rax
	addl	%eax, 184(%r15)
	movq	(%rsp), %rax
	testl	%edx, %edx
	jne	.L4678
	movl	$0, 48(%r15)
	movb	$0, 56(%r15)
	movq	%rax, %rdx
	vmovq	%rax, %xmm1
.L4679:
	vpinsrq	$1, %rdx, %xmm1, %xmm0
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L4677
	.p2align 4,,10
	.p2align 3
.L4678:
	movzbl	56(%r15), %ebp
	addq	%r12, %rdx
	vmovq	%rax, %xmm1
	jmp	.L4679
	.p2align 4,,10
	.p2align 3
.L4665:
	vmovq	%rax, %xmm3
	addq	%rbx, %rdx
	vpinsrq	$1, %rdx, %xmm3, %xmm0
	movzbl	56(%r15), %r13d
	vmovdqu	%xmm0, 192(%r15)
	movq	%rax, %rsi
	jmp	.L4663
.L4730:
	leaq	56(%r15), %r9
	movl	52(%r15), %edx
	movq	40(%r15), %rdi
	movq	%r9, %rsi
	movq	%r9, 24(%rsp)
	call	*16(%r15)
	movq	192(%r15), %rdx
	movq	(%rsp), %rsi
	subq	208(%r15), %rdx
	addl	%edx, 184(%r15)
	testl	%eax, %eax
	movq	24(%rsp), %r9
	jne	.L4669
	movl	$0, 48(%r15)
	movb	$0, 56(%r15)
	movq	%rsi, %rdx
	vmovq	%rsi, %xmm4
.L4670:
	vpinsrq	$1, %rdx, %xmm4, %xmm0
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L4668
.L4691:
	xorl	%r14d, %r14d
.L4652:
	cmpl	%r14d, 32(%rsp)
	jle	.L4633
	xorl	%r13d, %r13d
	movl	%r14d, %ebp
	incl	%r14d
	cmpl	%r13d, 48(%rsp)
	jle	.L4652
.L4655:
	movl	48(%rsp), %r12d
	movl	72(%rsp), %eax
	imull	%ebp, %r12d
	imull	%eax, %r12d
	imull	%r13d, %eax
	incl	%r13d
	movslq	%r12d, %r15
	movl	%eax, (%rsp)
	leaq	124(%rsp), %r12
.L4654:
	movl	$4, %edx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	stbi__getn
	movslq	(%rsp), %rax
	movq	16(%rsp), %rcx
	addq	%r15, %rax
	movl	72(%rsp), %edx
	leaq	(%rcx,%rax,4), %rdi
	movq	%r12, %rsi
	call	stbi__hdr_convert
	cmpl	%r13d, 48(%rsp)
	jg	.L4655
	jmp	.L4652
.L4728:
	movq	%r15, %r14
.L4686:
	incq	56(%rsp)
	movq	56(%rsp), %rax
	cmpq	$4, %rax
	jne	.L4661
	movl	12(%rsp), %ecx
	testl	%ecx, %ecx
	je	.L4688
	movslq	84(%rsp), %rax
	movq	16(%rsp), %rcx
	movq	96(%rsp), %r13
	leaq	(%rcx,%rax,4), %r12
	movq	40(%rsp), %rcx
	movl	48(%rsp), %eax
	movl	72(%rsp), %r15d
	movq	%rcx, %rbx
	leaq	(%rcx,%rax,4), %rbp
	.p2align 4,,10
	.p2align 3
.L4687:
	movq	%rbx, %rsi
	movq	%r12, %rdi
	movl	%r15d, %edx
	addq	$4, %rbx
	call	stbi__hdr_convert
	addq	%r13, %r12
	cmpq	%rbx, %rbp
	jne	.L4687
.L4688:
	incl	80(%rsp)
	movl	88(%rsp), %esi
	addl	%esi, 84(%rsp)
	movl	80(%rsp), %eax
	cmpl	%eax, 76(%rsp)
	jne	.L4683
	movq	40(%rsp), %rdi
	call	free@PLT
	jmp	.L4633
	.p2align 4,,10
	.p2align 3
.L4674:
	movq	16(%rsp), %rdi
	call	free@PLT
	movq	40(%rsp), %rdi
	call	free@PLT
	leaq	.LC248(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	movq	$0, 16(%rsp)
	jmp	.L4633
.L4669:
	cltq
	movzbl	56(%r15), %ebx
	leaq	(%r9,%rax), %rdx
	vmovq	%rsi, %xmm4
	jmp	.L4670
.L4726:
	movq	104(%rsp), %rdi
	call	malloc@PLT
	movq	%rax, 40(%rsp)
	testq	%rax, %rax
	jne	.L4660
	movq	16(%rsp), %rdi
	call	free@PLT
	leaq	.LC23(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	movq	$0, 16(%rsp)
	jmp	.L4633
	.p2align 4,,10
	.p2align 3
.L4714:
	movq	%r14, %rbx
	movq	%rbx, %rdi
	movb	%r12b, 124(%rsp)
	movb	%bpl, 125(%rsp)
	movb	%al, 126(%rsp)
	movl	92(%rsp), %r14d
	call	stbi__get8
	movl	72(%rsp), %r15d
	movq	16(%rsp), %rdi
	leaq	124(%rsp), %r12
	movl	%r15d, %edx
	movq	%r12, %rsi
	movb	%al, 127(%rsp)
	call	stbi__hdr_convert
	movq	40(%rsp), %rdi
	xorl	%ebp, %ebp
	call	free@PLT
	movl	$2, %r13d
	movl	%r15d, (%rsp)
	xorl	%r15d, %r15d
	jmp	.L4654
.L4725:
	movq	16(%rsp), %rdi
	call	free@PLT
	movq	40(%rsp), %rdi
	call	free@PLT
	leaq	.LC302(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	movq	$0, 16(%rsp)
	jmp	.L4633
.L4724:
	leaq	.LC23(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L4633
.L4722:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE890:
	.size	stbi__hdr_load.constprop.0, .-stbi__hdr_load.constprop.0
	.p2align 4
	.type	stbiw__jpg_processDU.constprop.1, @function
stbiw__jpg_processDU.constprop.1:
.LFB891:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movq	%rdi, %r15
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
	movq	%r9, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rcx, %rbx
	movq	%rbx, %r13
	subq	$392, %rsp
	.cfi_def_cfa_offset 448
	movq	464(%rsp), %rax
	movq	%rsi, 8(%rsp)
	movq	%rax, 56(%rsp)
	movq	%rdx, 24(%rsp)
	movzwl	(%rax), %ecx
	movq	456(%rsp), %r11
	movq	%fs:40, %rdx
	movq	%rdx, 376(%rsp)
	xorl	%edx, %edx
	movw	%cx, 92(%rsp)
	movzwl	2(%rax), %ecx
	leaq	256(%rbx), %r12
	movw	%cx, 94(%rsp)
	movzwl	960(%rax), %ecx
	movzwl	962(%rax), %eax
	movw	%cx, 84(%rsp)
	movw	%ax, 86(%rsp)
	movq	%rbx, %r14
	.p2align 4,,10
	.p2align 3
.L4734:
	leaq	28(%r14), %rax
	pushq	%rax
	.cfi_def_cfa_offset 456
	leaq	24(%r14), %rax
	leaq	12(%r14), %rcx
	pushq	%rax
	.cfi_def_cfa_offset 464
	leaq	8(%r14), %rdx
	leaq	4(%r14), %rsi
	leaq	20(%r14), %r9
	leaq	16(%r14), %r8
	movq	%r14, %rdi
	call	stbiw__jpg_DCT
	addq	$32, %r14
	popq	%r10
	.cfi_def_cfa_offset 456
	popq	%rax
	.cfi_def_cfa_offset 448
	cmpq	%r14, %r12
	jne	.L4734
	leaq	32(%rbx), %r12
	.p2align 4,,10
	.p2align 3
.L4735:
	leaq	224(%rbx), %rax
	pushq	%rax
	.cfi_def_cfa_offset 456
	leaq	192(%rbx), %rax
	leaq	160(%rbx), %r9
	pushq	%rax
	.cfi_def_cfa_offset 464
	leaq	128(%rbx), %r8
	leaq	96(%rbx), %rcx
	leaq	64(%rbx), %rdx
	leaq	32(%rbx), %rsi
	movq	%rbx, %rdi
	call	stbiw__jpg_DCT
	addq	$4, %rbx
	popq	%r8
	.cfi_def_cfa_offset 456
	popq	%r9
	.cfi_def_cfa_offset 448
	cmpq	%rbx, %r12
	jne	.L4735
	leaq	stbiw__jpg_ZigZag(%rip), %rdx
	vmovss	.LC240(%rip), %xmm1
	leaq	64(%rdx), %rcx
	vxorps	%xmm0, %xmm0, %xmm0
	.p2align 4,,10
	.p2align 3
.L4753:
	vmovss	0(%rbp), %xmm2
	vmulss	0(%r13), %xmm2, %xmm2
	vcomiss	%xmm2, %xmm0
	ja	.L4736
	vaddss	%xmm1, %xmm2, %xmm2
	vcvttss2sil	%xmm2, %esi
.L4737:
	vmovss	4(%r13), %xmm2
	movzbl	(%rdx), %eax
	vmulss	4(%rbp), %xmm2, %xmm2
	movl	%esi, 112(%rsp,%rax,4)
	vcomiss	%xmm2, %xmm0
	ja	.L4738
	vaddss	%xmm1, %xmm2, %xmm2
	vcvttss2sil	%xmm2, %esi
.L4739:
	vmovss	8(%r13), %xmm2
	movzbl	1(%rdx), %eax
	vmulss	8(%rbp), %xmm2, %xmm2
	movl	%esi, 112(%rsp,%rax,4)
	vcomiss	%xmm2, %xmm0
	ja	.L4740
	vaddss	%xmm1, %xmm2, %xmm2
	vcvttss2sil	%xmm2, %esi
.L4741:
	vmovss	12(%r13), %xmm2
	movzbl	2(%rdx), %eax
	vmulss	12(%rbp), %xmm2, %xmm2
	movl	%esi, 112(%rsp,%rax,4)
	vcomiss	%xmm2, %xmm0
	ja	.L4742
	vaddss	%xmm1, %xmm2, %xmm2
	vcvttss2sil	%xmm2, %esi
.L4743:
	vmovss	16(%r13), %xmm2
	movzbl	3(%rdx), %eax
	vmulss	16(%rbp), %xmm2, %xmm2
	movl	%esi, 112(%rsp,%rax,4)
	vcomiss	%xmm2, %xmm0
	ja	.L4744
	vaddss	%xmm1, %xmm2, %xmm2
	vcvttss2sil	%xmm2, %esi
.L4745:
	vmovss	20(%r13), %xmm2
	movzbl	4(%rdx), %eax
	vmulss	20(%rbp), %xmm2, %xmm2
	movl	%esi, 112(%rsp,%rax,4)
	vcomiss	%xmm2, %xmm0
	ja	.L4746
	vaddss	%xmm1, %xmm2, %xmm2
	vcvttss2sil	%xmm2, %esi
.L4747:
	vmovss	24(%r13), %xmm2
	movzbl	5(%rdx), %eax
	vmulss	24(%rbp), %xmm2, %xmm2
	movl	%esi, 112(%rsp,%rax,4)
	vcomiss	%xmm2, %xmm0
	ja	.L4748
	vaddss	%xmm1, %xmm2, %xmm2
	vcvttss2sil	%xmm2, %esi
.L4749:
	vmovss	28(%r13), %xmm2
	movzbl	6(%rdx), %eax
	vmulss	28(%rbp), %xmm2, %xmm2
	movl	%esi, 112(%rsp,%rax,4)
	movzbl	7(%rdx), %eax
	vcomiss	%xmm2, %xmm0
	ja	.L4750
	vaddss	%xmm1, %xmm2, %xmm2
	addq	$8, %rdx
	addq	$32, %r13
	vcvttss2sil	%xmm2, %esi
	addq	$32, %rbp
	movl	%esi, 112(%rsp,%rax,4)
	cmpq	%rcx, %rdx
	jne	.L4753
.L4752:
	movq	8(%rsp), %rcx
	movl	112(%rsp), %eax
	movl	(%rcx), %edi
	movq	24(%rsp), %rcx
	movl	%eax, 88(%rsp)
	subl	448(%rsp), %eax
	movl	(%rcx), %r8d
	movl	%eax, %esi
	je	.L4835
	movl	%eax, %edx
	negl	%edx
	cmovs	%eax, %edx
	cmpl	$-2147483648, %eax
	adcl	$-1, %esi
	sarl	%edx
	je	.L4804
	movl	$2, %ecx
	.p2align 4,,10
	.p2align 3
.L4761:
	movl	%ecx, %r9d
	incl	%ecx
	sarl	%edx
	jne	.L4761
	movzwl	%r9w, %eax
	movl	%eax, 20(%rsp)
	movl	$1, %ecx
	movzwl	%r9w, %edx
	shlx	%r9d, %ecx, %ecx
	salq	$2, %rdx
	decl	%ecx
.L4760:
	addq	%rdx, %r11
	movzwl	2(%r11), %r13d
	movzwl	(%r11), %ebp
	addl	%r8d, %r13d
	movl	$24, %edx
	andl	%esi, %ecx
	subl	%r13d, %edx
	shlx	%edx, %ebp, %ebp
	movw	%cx, 16(%rsp)
	orl	%edi, %ebp
	cmpl	$7, %r13d
	jle	.L4762
	movl	%r13d, %r12d
	leaq	111(%rsp), %rbx
	.p2align 4,,10
	.p2align 3
.L4764:
	movl	%ebp, %r14d
	sarl	$16, %r14d
	movb	%r14b, 111(%rsp)
	movq	8(%r15), %rdi
	movl	$1, %edx
	movq	%rbx, %rsi
	call	*(%r15)
	cmpb	$-1, %r14b
	jne	.L4763
	movb	$0, 111(%rsp)
	movq	8(%r15), %rdi
	movl	$1, %edx
	movq	%rbx, %rsi
	call	*(%r15)
.L4763:
	subl	$8, %r12d
	sall	$8, %ebp
	cmpl	$7, %r12d
	jg	.L4764
	andl	$7, %r13d
.L4762:
	movq	8(%rsp), %rcx
	movq	24(%rsp), %rax
	movl	%ebp, (%rcx)
	movl	%r13d, (%rax)
	movl	20(%rsp), %eax
	movzwl	16(%rsp), %ebp
	addl	%r13d, %eax
	movl	$24, %edx
	subl	%eax, %edx
	shlx	%edx, %ebp, %ebp
	movl	%eax, 20(%rsp)
	orl	(%rcx), %ebp
	cmpl	$7, %eax
	jle	.L4765
	movl	%eax, %r12d
	leaq	111(%rsp), %rbx
	.p2align 4,,10
	.p2align 3
.L4767:
	movl	%ebp, %r13d
	sarl	$16, %r13d
	movb	%r13b, 111(%rsp)
	movq	8(%r15), %rdi
	movl	$1, %edx
	movq	%rbx, %rsi
	call	*(%r15)
	cmpb	$-1, %r13b
	jne	.L4766
	movb	$0, 111(%rsp)
	movq	8(%r15), %rdi
	movl	$1, %edx
	movq	%rbx, %rsi
	call	*(%r15)
.L4766:
	subl	$8, %r12d
	sall	$8, %ebp
	cmpl	$7, %r12d
	jg	.L4767
.L4833:
	andl	$7, 20(%rsp)
.L4765:
	movq	8(%rsp), %rax
	movl	20(%rsp), %ecx
	movl	%ebp, (%rax)
	movq	24(%rsp), %rax
	movl	$63, %edx
	movl	%ecx, (%rax)
	leaq	112(%rsp), %rax
	movq	%rax, 64(%rsp)
	jmp	.L4768
	.p2align 4,,10
	.p2align 3
.L4770:
	decq	%rdx
	je	.L4769
.L4768:
	movl	(%rax,%rdx,4), %edi
	testl	%edi, %edi
	je	.L4770
	movl	%edx, 48(%rsp)
	movl	%edx, 76(%rsp)
	movl	$1, %esi
	.p2align 4,,10
	.p2align 3
.L4771:
	movslq	%esi, %rdx
	movl	112(%rsp,%rdx,4), %r12d
	testl	%r12d, %r12d
	jne	.L4796
	cmpl	%esi, 48(%rsp)
	jl	.L4836
	movl	76(%rsp), %edi
	leal	2(%rsi), %ecx
	leal	1(%rsi), %edx
	movslq	%ecx, %rcx
	subl	%esi, %edi
	movq	64(%rsp), %rax
	movslq	%edx, %rdx
	addq	%rdi, %rcx
	jmp	.L4776
	.p2align 4,,10
	.p2align 3
.L4838:
	incq	%rdx
	cmpq	%rdx, %rcx
	je	.L4837
.L4776:
	movl	(%rax,%rdx,4), %r12d
	movl	%edx, %edi
	testl	%r12d, %r12d
	je	.L4838
	movl	%edx, %eax
	movl	%r12d, %r13d
	subl	%esi, %eax
	negl	%r13d
	cmovs	%r12d, %r13d
	movl	%edx, 44(%rsp)
	sarl	%r13d
	movl	%eax, 52(%rsp)
	movl	%r13d, 72(%rsp)
	cmpl	$15, %eax
	jg	.L4778
	sall	$4, %eax
	movl	%eax, %ecx
.L4779:
	movl	72(%rsp), %eax
	leal	-1(%r12), %esi
	testl	%r12d, %r12d
	cmovns	%r12d, %esi
	testl	%eax, %eax
	je	.L4786
	movl	$2, %edx
	.p2align 4,,10
	.p2align 3
.L4787:
	movl	%edx, %r14d
	incl	%edx
	sarl	%eax
	jne	.L4787
	movzwl	%r14w, %eax
	movl	$1, %r12d
	leal	(%rcx,%rax), %edx
	shlx	%eax, %r12d, %r12d
	movl	%eax, 32(%rsp)
	decl	%r12d
	movslq	%edx, %rdx
	andl	%esi, %r12d
	salq	$2, %rdx
	movzwl	%r12w, %r12d
.L4788:
	addq	56(%rsp), %rdx
	movzwl	2(%rdx), %eax
	movzwl	(%rdx), %ebx
	addl	20(%rsp), %eax
	movq	8(%rsp), %rcx
	movl	$24, %edx
	subl	%eax, %edx
	shlx	%edx, %ebx, %ebx
	movl	%eax, 16(%rsp)
	orl	(%rcx), %ebx
	cmpl	$7, %eax
	jle	.L4789
	movl	%eax, %ebp
	leaq	111(%rsp), %r13
	.p2align 4,,10
	.p2align 3
.L4791:
	movl	%ebx, %r14d
	sarl	$16, %r14d
	movb	%r14b, 111(%rsp)
	movq	8(%r15), %rdi
	movl	$1, %edx
	movq	%r13, %rsi
	call	*(%r15)
	cmpb	$-1, %r14b
	jne	.L4790
	movb	$0, 111(%rsp)
	movq	8(%r15), %rdi
	movl	$1, %edx
	movq	%r13, %rsi
	call	*(%r15)
.L4790:
	subl	$8, %ebp
	sall	$8, %ebx
	cmpl	$7, %ebp
	jg	.L4791
	andl	$7, 16(%rsp)
.L4789:
	movq	8(%rsp), %rcx
	movl	16(%rsp), %eax
	movq	24(%rsp), %rsi
	movl	%ebx, (%rcx)
	movl	%eax, (%rsi)
	movl	$24, %ebx
	addl	32(%rsp), %eax
	subl	%eax, %ebx
	shlx	%ebx, %r12d, %ebx
	movl	%eax, 20(%rsp)
	orl	(%rcx), %ebx
	cmpl	$7, %eax
	jle	.L4792
	movl	%eax, %ebp
	leaq	111(%rsp), %r13
	.p2align 4,,10
	.p2align 3
.L4794:
	movl	%ebx, %r12d
	sarl	$16, %r12d
	movb	%r12b, 111(%rsp)
	movq	8(%r15), %rdi
	movl	$1, %edx
	movq	%r13, %rsi
	call	*(%r15)
	cmpb	$-1, %r12b
	jne	.L4793
	movb	$0, 111(%rsp)
	movq	8(%r15), %rdi
	movl	$1, %edx
	movq	%r13, %rsi
	call	*(%r15)
.L4793:
	subl	$8, %ebp
	sall	$8, %ebx
	cmpl	$7, %ebp
	jg	.L4794
	andl	$7, 20(%rsp)
.L4792:
	movq	8(%rsp), %rax
	movl	44(%rsp), %esi
	movl	%ebx, (%rax)
	movl	20(%rsp), %ecx
	movq	24(%rsp), %rax
	incl	%esi
	movl	%ecx, (%rax)
	cmpl	48(%rsp), %esi
	jle	.L4771
	cmpl	$63, 48(%rsp)
	jne	.L4839
.L4733:
	movq	376(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L4840
	movl	88(%rsp), %eax
	addq	$392, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
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
	ret
	.p2align 4,,10
	.p2align 3
.L4750:
	.cfi_restore_state
	vsubss	%xmm1, %xmm2, %xmm2
	addq	$8, %rdx
	addq	$32, %r13
	vcvttss2sil	%xmm2, %esi
	addq	$32, %rbp
	movl	%esi, 112(%rsp,%rax,4)
	cmpq	%rdx, %rcx
	jne	.L4753
	jmp	.L4752
	.p2align 4,,10
	.p2align 3
.L4748:
	vsubss	%xmm1, %xmm2, %xmm2
	vcvttss2sil	%xmm2, %esi
	jmp	.L4749
	.p2align 4,,10
	.p2align 3
.L4746:
	vsubss	%xmm1, %xmm2, %xmm2
	vcvttss2sil	%xmm2, %esi
	jmp	.L4747
	.p2align 4,,10
	.p2align 3
.L4744:
	vsubss	%xmm1, %xmm2, %xmm2
	vcvttss2sil	%xmm2, %esi
	jmp	.L4745
	.p2align 4,,10
	.p2align 3
.L4742:
	vsubss	%xmm1, %xmm2, %xmm2
	vcvttss2sil	%xmm2, %esi
	jmp	.L4743
	.p2align 4,,10
	.p2align 3
.L4740:
	vsubss	%xmm1, %xmm2, %xmm2
	vcvttss2sil	%xmm2, %esi
	jmp	.L4741
	.p2align 4,,10
	.p2align 3
.L4738:
	vsubss	%xmm1, %xmm2, %xmm2
	vcvttss2sil	%xmm2, %esi
	jmp	.L4739
	.p2align 4,,10
	.p2align 3
.L4736:
	vsubss	%xmm1, %xmm2, %xmm2
	vcvttss2sil	%xmm2, %esi
	jmp	.L4737
	.p2align 4,,10
	.p2align 3
.L4837:
	movl	%edi, %eax
	subl	%esi, %eax
	movl	%edi, 44(%rsp)
	movl	%eax, 52(%rsp)
	cmpl	$15, %eax
	jg	.L4841
	movl	%eax, %ecx
	sall	$4, %ecx
	xorl	%esi, %esi
.L4786:
	leal	1(%rcx), %edx
	movslq	%edx, %rdx
	movl	%esi, %r12d
	movl	$1, 32(%rsp)
	salq	$2, %rdx
	andl	$1, %r12d
	jmp	.L4788
.L4841:
	movl	$0, 72(%rsp)
.L4778:
	movzwl	86(%rsp), %eax
	movl	52(%rsp), %edx
	movl	%eax, 36(%rsp)
	movzwl	84(%rsp), %eax
	sarl	$4, %edx
	movl	%eax, 40(%rsp)
	leal	1(%rdx), %eax
	movl	%eax, 32(%rsp)
	movl	$1, 16(%rsp)
	movl	%r12d, 80(%rsp)
	movl	20(%rsp), %r13d
	.p2align 4,,10
	.p2align 3
.L4783:
	movq	8(%rsp), %rax
	addl	36(%rsp), %r13d
	movl	$24, %ebx
	subl	%r13d, %ebx
	shlx	%ebx, 40(%rsp), %ebx
	orl	(%rax), %ebx
	cmpl	$7, %r13d
	jle	.L4780
	movl	%r13d, %ebp
	leaq	111(%rsp), %r12
	.p2align 4,,10
	.p2align 3
.L4782:
	movl	%ebx, %r14d
	sarl	$16, %r14d
	movb	%r14b, 111(%rsp)
	movq	8(%r15), %rdi
	movl	$1, %edx
	movq	%r12, %rsi
	call	*(%r15)
	cmpb	$-1, %r14b
	jne	.L4781
	movb	$0, 111(%rsp)
	movq	8(%r15), %rdi
	movl	$1, %edx
	movq	%r12, %rsi
	call	*(%r15)
.L4781:
	subl	$8, %ebp
	sall	$8, %ebx
	cmpl	$7, %ebp
	jg	.L4782
	andl	$7, %r13d
.L4780:
	movq	8(%rsp), %rax
	incl	16(%rsp)
	movl	%ebx, (%rax)
	movq	24(%rsp), %rax
	movl	%r13d, (%rax)
	movl	16(%rsp), %eax
	cmpl	32(%rsp), %eax
	jne	.L4783
	movl	52(%rsp), %ecx
	movl	%r13d, 20(%rsp)
	sall	$4, %ecx
	movl	80(%rsp), %r12d
	movzbl	%cl, %ecx
	jmp	.L4779
.L4839:
	movzwl	94(%rsp), %r13d
	movzwl	92(%rsp), %ebp
	movq	8(%rsp), %rax
	addl	20(%rsp), %r13d
	movl	$24, %edx
	subl	%r13d, %edx
	shlx	%edx, %ebp, %ebp
	orl	(%rax), %ebp
	cmpl	$7, %r13d
	jle	.L4798
	movl	%r13d, %r12d
	leaq	111(%rsp), %rbx
	.p2align 4,,10
	.p2align 3
.L4800:
	movl	%ebp, %r14d
	sarl	$16, %r14d
	movb	%r14b, 111(%rsp)
	movq	8(%r15), %rdi
	movl	$1, %edx
	movq	%rbx, %rsi
	call	*(%r15)
	cmpb	$-1, %r14b
	jne	.L4799
	movb	$0, 111(%rsp)
	movq	8(%r15), %rdi
	movl	$1, %edx
	movq	%rbx, %rsi
	call	*(%r15)
.L4799:
	subl	$8, %r12d
	sall	$8, %ebp
	cmpl	$7, %r12d
	jg	.L4800
.L4834:
	andl	$7, %r13d
.L4798:
	movq	8(%rsp), %rax
	movl	%ebp, (%rax)
	movq	24(%rsp), %rax
	movl	%r13d, (%rax)
	jmp	.L4733
.L4796:
	movl	%r12d, %r13d
	negl	%r13d
	cmovs	%r12d, %r13d
	movl	%esi, 44(%rsp)
	sarl	%r13d
	movl	%r13d, 72(%rsp)
	xorl	%ecx, %ecx
	jmp	.L4779
.L4836:
	movl	%esi, 44(%rsp)
	movl	$1, 32(%rsp)
	movl	$4, %edx
	jmp	.L4788
.L4835:
	movzwl	2(%r11), %edx
	movzwl	(%r11), %ebp
	leal	(%rdx,%r8), %eax
	movl	$24, %edx
	subl	%eax, %edx
	shlx	%edx, %ebp, %ebp
	movl	%eax, 20(%rsp)
	orl	%edi, %ebp
	cmpl	$7, %eax
	jle	.L4765
	movl	%eax, %r12d
	leaq	111(%rsp), %rbx
	.p2align 4,,10
	.p2align 3
.L4757:
	movl	%ebp, %r13d
	sarl	$16, %r13d
	movb	%r13b, 111(%rsp)
	movq	8(%r15), %rdi
	movl	$1, %edx
	movq	%rbx, %rsi
	call	*(%r15)
	cmpb	$-1, %r13b
	jne	.L4756
	movb	$0, 111(%rsp)
	movq	8(%r15), %rdi
	movl	$1, %edx
	movq	%rbx, %rsi
	call	*(%r15)
.L4756:
	subl	$8, %r12d
	sall	$8, %ebp
	cmpl	$7, %r12d
	jg	.L4757
	jmp	.L4833
.L4769:
	movzwl	94(%rsp), %r13d
	movzwl	92(%rsp), %ebp
	addl	20(%rsp), %r13d
	movq	8(%rsp), %rax
	movl	$24, %edx
	subl	%r13d, %edx
	shlx	%edx, %ebp, %ebp
	movl	%r13d, %r12d
	orl	(%rax), %ebp
	leaq	111(%rsp), %rbx
	cmpl	$7, %r13d
	jle	.L4798
	.p2align 4,,10
	.p2align 3
.L4773:
	movl	%ebp, %r14d
	sarl	$16, %r14d
	movb	%r14b, 111(%rsp)
	movq	8(%r15), %rdi
	movl	$1, %edx
	movq	%rbx, %rsi
	call	*(%r15)
	cmpb	$-1, %r14b
	jne	.L4772
	movb	$0, 111(%rsp)
	movq	8(%r15), %rdi
	movl	$1, %edx
	movq	%rbx, %rsi
	call	*(%r15)
.L4772:
	subl	$8, %r12d
	sall	$8, %ebp
	cmpl	$7, %r12d
	jg	.L4773
	jmp	.L4834
.L4804:
	movl	$1, 20(%rsp)
	movl	$4, %edx
	movl	$1, %ecx
	jmp	.L4760
.L4840:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE891:
	.size	stbiw__jpg_processDU.constprop.1, .-stbiw__jpg_processDU.constprop.1
	.p2align 4
	.type	stbi_write_jpg_core.part.0, @function
stbi_write_jpg_core.part.0:
.LFB846:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	pushq	-8(%r10)
	pushq	%rbp
	movq	%rsp, %rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	pushq	%rbx
	subq	$4096, %rsp
	orq	$0, (%rsp)
	subq	$736, %rsp
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movq	%rdi, -4704(%rbp)
	movl	%esi, -4396(%rbp)
	movl	%edx, -4488(%rbp)
	movl	%ecx, -4492(%rbp)
	movq	%r8, -4368(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	testl	%r9d, %r9d
	je	.L4896
	movl	%r9d, %r13d
	movl	$5000, %eax
	jle	.L4846
	movl	$100, %ecx
	cmpl	%ecx, %r9d
	cmovle	%r9d, %ecx
	cmpl	$49, %r9d
	jg	.L4928
	cltd
	idivl	%ecx
	jmp	.L4846
.L4896:
	movl	$20, %eax
	movl	$90, %r13d
.L4846:
	xorl	%edx, %edx
	leaq	YQT.17(%rip), %r9
	leaq	stbiw__jpg_ZigZag(%rip), %r8
	leaq	UVQT.16(%rip), %rdi
.L4849:
	movl	(%r9,%rdx,4), %esi
	movl	$1, %ecx
	imull	%eax, %esi
	cmpl	$49, %esi
	jle	.L4847
	movl	$-1, %ecx
	cmpl	$25549, %esi
	jg	.L4847
	leal	50(%rsi), %ecx
	imulq	$1374389535, %rcx, %rcx
	shrq	$37, %rcx
.L4847:
	movl	(%rdi,%rdx,4), %r10d
	movzbl	(%r8,%rdx), %esi
	imull	%eax, %r10d
	movb	%cl, -192(%rbp,%rsi)
	movl	$1, %ecx
	cmpl	$49, %r10d
	jle	.L4848
	movl	$-1, %ecx
	cmpl	$25549, %r10d
	jg	.L4848
	leal	50(%r10), %ecx
	imulq	$1374389535, %rcx, %rcx
	shrq	$37, %rcx
.L4848:
	incq	%rdx
	movb	%cl, -128(%rbp,%rsi)
	cmpq	$64, %rdx
	jne	.L4849
	leaq	-4336(%rbp), %rax
	movq	%rax, -4664(%rbp)
	leaq	-4080(%rbp), %rax
	movq	%rax, -4680(%rbp)
	vmovaps	.LC303(%rip), %ymm2
	vmovaps	.LC304(%rip), %ymm1
	leaq	stbiw__jpg_ZigZag(%rip), %r12
	leaq	aasf.15(%rip), %r15
	xorl	%r14d, %r14d
.L4850:
	movzbl	7(%r12), %r11d
	movzbl	6(%r12), %r10d
	movzbl	-192(%rbp,%r11), %eax
	movzbl	5(%r12), %r9d
	movzbl	-192(%rbp,%r10), %ebx
	salq	$8, %rax
	movzbl	4(%r12), %r8d
	orq	%rbx, %rax
	movzbl	-192(%rbp,%r9), %ebx
	salq	$8, %rax
	movzbl	3(%r12), %edi
	orq	%rbx, %rax
	movzbl	-192(%rbp,%r8), %ebx
	salq	$8, %rax
	movzbl	2(%r12), %esi
	orq	%rbx, %rax
	movzbl	-192(%rbp,%rdi), %ebx
	salq	$8, %rax
	movzbl	1(%r12), %ecx
	orq	%rbx, %rax
	movzbl	-192(%rbp,%rsi), %ebx
	salq	$8, %rax
	movzbl	(%r12), %edx
	orq	%rbx, %rax
	movzbl	-192(%rbp,%rcx), %ebx
	salq	$8, %rax
	orq	%rbx, %rax
	movzbl	-192(%rbp,%rdx), %ebx
	salq	$8, %rax
	orq	%rbx, %rax
	vbroadcastss	(%r15), %ymm3
	vmovq	%rax, %xmm0
	vpmovzxbd	%xmm0, %ymm0
	vcvtdq2ps	%ymm0, %ymm0
	vmulps	%ymm3, %ymm0, %ymm0
	movq	-4664(%rbp), %rax
	movzbl	-128(%rbp,%r10), %r10d
	movzbl	-128(%rbp,%r9), %r9d
	movzbl	-128(%rbp,%r8), %r8d
	vmulps	%ymm2, %ymm0, %ymm0
	movzbl	-128(%rbp,%rdi), %edi
	movzbl	-128(%rbp,%rsi), %esi
	movzbl	-128(%rbp,%rcx), %ecx
	movzbl	-128(%rbp,%rdx), %edx
	vdivps	%ymm0, %ymm1, %ymm0
	addq	$8, %r12
	addq	$4, %r15
	vmovaps	%ymm0, (%rax,%r14)
	movzbl	-128(%rbp,%r11), %eax
	salq	$8, %rax
	orq	%r10, %rax
	salq	$8, %rax
	orq	%r9, %rax
	salq	$8, %rax
	orq	%r8, %rax
	salq	$8, %rax
	orq	%rdi, %rax
	salq	$8, %rax
	orq	%rsi, %rax
	salq	$8, %rax
	orq	%rcx, %rax
	salq	$8, %rax
	orq	%rdx, %rax
	vmovq	%rax, %xmm0
	vpmovzxbd	%xmm0, %ymm0
	vcvtdq2ps	%ymm0, %ymm0
	vmulps	%ymm3, %ymm0, %ymm0
	movq	-4680(%rbp), %rax
	vmulps	%ymm2, %ymm0, %ymm0
	vdivps	%ymm0, %ymm1, %ymm0
	vmovaps	%ymm0, (%rax,%r14)
	leaq	64+stbiw__jpg_ZigZag(%rip), %rax
	addq	$32, %r14
	cmpq	%rax, %r12
	jne	.L4850
	movzwl	-4488(%rbp), %ebx
	movzwl	-4396(%rbp), %ecx
	movbew	%bx, -219(%rbp)
	movq	-4704(%rbp), %rbx
	cmpl	$91, %r13d
	movl	$17, %edx
	movl	$34, %eax
	cmovge	%edx, %eax
	movq	8(%rbx), %rdi
	movbew	%cx, -217(%rbp)
	movl	$259, %r10d
	movabsq	$45600891830604035, %rcx
	movl	$25, %edx
	leaq	head0.14(%rip), %rsi
	movl	$285262079, -224(%rbp)
	movb	$8, -220(%rbp)
	movw	%r10w, -215(%rbp)
	movb	%al, -213(%rbp)
	movl	$17891840, -212(%rbp)
	movq	%rcx, -208(%rbp)
	vzeroupper
	call	*(%rbx)
	movq	8(%rbx), %rdi
	leaq	-192(%rbp), %rsi
	movl	$64, %edx
	call	*(%rbx)
	movb	$1, -4340(%rbp)
	leaq	-4340(%rbp), %r15
	movq	8(%rbx), %rdi
	movl	$1, %edx
	movq	%r15, %rsi
	movq	%r15, -4568(%rbp)
	call	*(%rbx)
	movq	8(%rbx), %rdi
	leaq	-128(%rbp), %rsi
	movl	$64, %edx
	call	*(%rbx)
	movq	8(%rbx), %rdi
	leaq	-224(%rbp), %rsi
	movl	$24, %edx
	call	*(%rbx)
	movq	8(%rbx), %rdi
	movl	$16, %edx
	leaq	1+std_dc_luminance_nrcodes.13(%rip), %rsi
	call	*(%rbx)
	movq	8(%rbx), %rdi
	movl	$12, %edx
	leaq	std_dc_luminance_values.12(%rip), %rsi
	call	*(%rbx)
	movb	$16, -4340(%rbp)
	movq	8(%rbx), %rdi
	movl	$1, %edx
	movq	%r15, %rsi
	call	*(%rbx)
	movq	8(%rbx), %rdi
	movl	$16, %edx
	leaq	1+std_ac_luminance_nrcodes.11(%rip), %rsi
	call	*(%rbx)
	movq	8(%rbx), %rdi
	movl	$162, %edx
	leaq	std_ac_luminance_values.10(%rip), %rsi
	call	*(%rbx)
	movb	$1, -4340(%rbp)
	movq	8(%rbx), %rdi
	movl	$1, %edx
	movq	%r15, %rsi
	call	*(%rbx)
	movq	8(%rbx), %rdi
	movl	$16, %edx
	leaq	1+std_dc_chrominance_nrcodes.9(%rip), %rsi
	call	*(%rbx)
	movq	8(%rbx), %rdi
	movl	$12, %edx
	leaq	std_dc_chrominance_values.8(%rip), %rsi
	call	*(%rbx)
	movb	$17, -4340(%rbp)
	movq	8(%rbx), %rdi
	movl	$1, %edx
	movq	%r15, %rsi
	call	*(%rbx)
	movq	8(%rbx), %rdi
	movl	$16, %edx
	leaq	1+std_ac_chrominance_nrcodes.7(%rip), %rsi
	call	*(%rbx)
	movq	8(%rbx), %rdi
	movl	$162, %edx
	leaq	std_ac_chrominance_values.6(%rip), %rsi
	call	*(%rbx)
	movq	8(%rbx), %rdi
	movl	$14, %edx
	leaq	head2.5(%rip), %rsi
	call	*(%rbx)
	movl	-4492(%rbp), %edi
	movq	-4368(%rbp), %rbx
	cmpl	$2, %edi
	setg	%cl
	setg	%al
	movzbl	%cl, %ecx
	addq	%rax, %rax
	andl	$2, %eax
	movq	%rcx, %rdx
	movq	%rcx, -4736(%rbp)
	movq	%rbx, %r12
	movq	%rbx, %rcx
	addq	%rdx, %rcx
	addq	%rax, %r12
	cmpl	$90, %r13d
	movq	%rcx, -4376(%rbp)
	movq	%rax, -4744(%rbp)
	movq	%rcx, %r14
	movl	$0, -4344(%rbp)
	movl	$0, -4340(%rbp)
	movq	%r12, -4384(%rbp)
	movl	-4488(%rbp), %eax
	movq	%rbx, %rcx
	vxorps	%xmm8, %xmm8, %xmm8
	jle	.L4852
	testl	%eax, %eax
	jle	.L4853
	movl	-4396(%rbp), %ebx
	testl	%ebx, %ebx
	jle	.L4853
	decl	%eax
	movl	%eax, -4400(%rbp)
	andl	$-8, %eax
	addl	$15, %eax
	movl	%eax, -4592(%rbp)
	leal	0(,%rdi,8), %eax
	leaq	-4344(%rbp), %rdi
	movq	%rdi, -4576(%rbp)
	leaq	YAC_HT.3(%rip), %rdi
	movl	%eax, -4560(%rbp)
	movq	%rdi, -4648(%rbp)
	leal	-1(%rbx), %eax
	leaq	YDC_HT.4(%rip), %rdi
	movl	%eax, -4520(%rbp)
	movq	%rdi, -4656(%rbp)
	andl	$-8, %eax
	leaq	UVAC_HT.1(%rip), %rdi
	movq	%rdi, -4688(%rbp)
	leaq	-1264(%rbp), %rbx
	leaq	-3312(%rbp), %r11
	leaq	UVDC_HT.2(%rip), %rdi
	addl	$9, %eax
	movl	$7, -4504(%rbp)
	movl	$0, -4536(%rbp)
	movl	$0, -4528(%rbp)
	movl	$0, -4516(%rbp)
	movq	%rdi, -4696(%rbp)
	movl	%eax, -4584(%rbp)
	movq	%r11, -4368(%rbp)
	movq	%rbx, -4376(%rbp)
	leaq	-2288(%rbp), %r15
	vmovaps	.LC324(%rip), %ymm15
	vmovaps	.LC325(%rip), %ymm7
	vmovaps	.LC326(%rip), %ymm14
	vmovaps	.LC327(%rip), %ymm13
	movq	%r15, -4384(%rbp)
	movq	%rcx, %r15
.L4854:
	movl	-4504(%rbp), %eax
	movl	$0, -4360(%rbp)
	leal	-7(%rax), %ebx
	movl	%ebx, -4544(%rbp)
	movl	-4488(%rbp), %ebx
	incl	%eax
	cmpl	%ebx, %eax
	cmovg	%ebx, %eax
	movl	$1, -4512(%rbp)
	movl	%eax, -4500(%rbp)
.L4892:
	movl	-4512(%rbp), %ebx
	movl	-4396(%rbp), %edi
	movl	-4520(%rbp), %ecx
	movl	stbi__flip_vertically_on_write(%rip), %eax
	cmpl	%ebx, %edi
	movl	%eax, -4392(%rbp)
	movl	%ecx, %eax
	movl	-4492(%rbp), %esi
	cmovg	%ebx, %eax
	leal	6(%rbx), %edx
	imull	%esi, %eax
	movl	%eax, -4416(%rbp)
	leal	1(%rbx), %eax
	cmpl	%eax, %edi
	cmovle	%ecx, %eax
	imull	%esi, %eax
	movl	%eax, -4432(%rbp)
	leal	2(%rbx), %eax
	cmpl	%eax, %edi
	cmovle	%ecx, %eax
	imull	%esi, %eax
	movl	%eax, -4448(%rbp)
	leal	3(%rbx), %eax
	cmpl	%eax, %edi
	cmovle	%ecx, %eax
	imull	%esi, %eax
	movl	%eax, -4464(%rbp)
	leal	4(%rbx), %eax
	cmpl	%eax, %edi
	cmovle	%ecx, %eax
	imull	%esi, %eax
	movl	%eax, -4480(%rbp)
	leal	5(%rbx), %eax
	cmpl	%eax, %edi
	cmovle	%ecx, %eax
	imull	%esi, %eax
	cmpl	%edx, %edi
	movl	%eax, -4484(%rbp)
	movl	%edx, %eax
	cmovle	%ecx, %eax
	movl	-4544(%rbp), %edx
	imull	%esi, %eax
	movl	%eax, -4496(%rbp)
	cmpl	%edx, -4488(%rbp)
	jg	.L4891
	xorl	%eax, %eax
.L4889:
	movl	-4392(%rbp), %edi
	xorl	%ecx, %ecx
	salq	$2, %rax
	testl	%edi, %edi
	cmove	-4400(%rbp), %ecx
	movl	-4360(%rbp), %ebx
	imull	-4396(%rbp), %ecx
	imull	-4492(%rbp), %ecx
	leal	(%rbx,%rcx), %esi
	movslq	%esi, %rdi
	movl	-4416(%rbp), %esi
	addl	%ecx, %esi
	movslq	%esi, %r8
	movl	-4432(%rbp), %esi
	addl	%ecx, %esi
	movslq	%esi, %r9
	movl	-4448(%rbp), %esi
	addl	%ecx, %esi
	movslq	%esi, %r10
	movl	-4464(%rbp), %esi
	addl	%ecx, %esi
	movslq	%esi, %r11
	movl	-4480(%rbp), %esi
	addl	%ecx, %esi
	movslq	%esi, %rbx
	movl	-4484(%rbp), %esi
	addl	%ecx, %esi
	addl	-4496(%rbp), %ecx
	movslq	%ecx, %r13
	movzbl	(%r15,%rdi), %ecx
	movslq	%esi, %rsi
	vcvtsi2ssl	%ecx, %xmm8, %xmm3
	movzbl	(%r15,%r8), %ecx
	vcvtsi2ssl	%ecx, %xmm8, %xmm4
	movzbl	(%r15,%r9), %ecx
	vcvtsi2ssl	%ecx, %xmm8, %xmm1
	movzbl	(%r15,%r10), %ecx
	vunpcklps	%xmm4, %xmm3, %xmm3
	vcvtsi2ssl	%ecx, %xmm8, %xmm5
	movzbl	(%r15,%r11), %ecx
	vmovaps	%xmm1, %xmm2
	vcvtsi2ssl	%ecx, %xmm8, %xmm0
	movzbl	(%r15,%rbx), %ecx
	vunpcklps	%xmm5, %xmm2, %xmm2
	vcvtsi2ssl	%ecx, %xmm8, %xmm1
	movzbl	(%r15,%rsi), %ecx
	vmovlhps	%xmm2, %xmm3, %xmm3
	vmovaps	%xmm1, %xmm6
	vcvtsi2ssl	%ecx, %xmm8, %xmm1
	movzbl	(%r15,%r13), %ecx
	vunpcklps	%xmm6, %xmm0, %xmm0
	vcvtsi2ssl	%ecx, %xmm8, %xmm9
	movzbl	(%r14,%rdi), %ecx
	vunpcklps	%xmm9, %xmm1, %xmm1
	vmovlhps	%xmm1, %xmm0, %xmm0
	vinsertf128	$0x1, %xmm0, %ymm3, %ymm3
	vcvtsi2ssl	%ecx, %xmm8, %xmm0
	movzbl	(%r14,%r8), %ecx
	vcvtsi2ssl	%ecx, %xmm8, %xmm5
	movzbl	(%r14,%r9), %ecx
	vcvtsi2ssl	%ecx, %xmm8, %xmm2
	movzbl	(%r14,%r10), %ecx
	vunpcklps	%xmm5, %xmm0, %xmm0
	vcvtsi2ssl	%ecx, %xmm8, %xmm6
	movzbl	(%r14,%r11), %ecx
	vmovaps	%xmm2, %xmm4
	vcvtsi2ssl	%ecx, %xmm8, %xmm1
	movzbl	(%r14,%rbx), %ecx
	vunpcklps	%xmm6, %xmm4, %xmm4
	vcvtsi2ssl	%ecx, %xmm8, %xmm9
	movzbl	(%r14,%rsi), %ecx
	vmovlhps	%xmm4, %xmm0, %xmm0
	vcvtsi2ssl	%ecx, %xmm8, %xmm2
	movzbl	(%r14,%r13), %ecx
	vunpcklps	%xmm9, %xmm1, %xmm1
	vcvtsi2ssl	%ecx, %xmm8, %xmm10
	movzbl	(%r12,%rdi), %ecx
	vunpcklps	%xmm10, %xmm2, %xmm2
	vmovlhps	%xmm2, %xmm1, %xmm1
	vinsertf128	$0x1, %xmm1, %ymm0, %ymm0
	vmulps	%ymm15, %ymm0, %ymm2
	vmulps	%ymm14, %ymm0, %ymm1
	vmulps	.LC328(%rip), %ymm0, %ymm0
	vfmsub231ps	%ymm7, %ymm3, %ymm2
	vfmsub231ps	%ymm13, %ymm3, %ymm1
	vfmadd132ps	.LC329(%rip), %ymm0, %ymm3
	vcvtsi2ssl	%ecx, %xmm8, %xmm0
	movzbl	(%r12,%r8), %ecx
	vcvtsi2ssl	%ecx, %xmm8, %xmm9
	movzbl	(%r12,%r9), %ecx
	movq	-4376(%rbp), %rdi
	vcvtsi2ssl	%ecx, %xmm8, %xmm5
	movzbl	(%r12,%r10), %ecx
	vunpcklps	%xmm9, %xmm0, %xmm0
	vcvtsi2ssl	%ecx, %xmm8, %xmm10
	movzbl	(%r12,%r11), %ecx
	movq	-4384(%rbp), %r8
	vcvtsi2ssl	%ecx, %xmm8, %xmm4
	movzbl	(%r12,%rbx), %ecx
	vunpcklps	%xmm10, %xmm5, %xmm5
	vcvtsi2ssl	%ecx, %xmm8, %xmm11
	movzbl	(%r12,%rsi), %ecx
	vmovlhps	%xmm5, %xmm0, %xmm0
	vcvtsi2ssl	%ecx, %xmm8, %xmm6
	movzbl	(%r12,%r13), %ecx
	vunpcklps	%xmm11, %xmm4, %xmm4
	vcvtsi2ssl	%ecx, %xmm8, %xmm12
	movq	-4368(%rbp), %rsi
	movl	-4504(%rbp), %ecx
	vunpcklps	%xmm12, %xmm6, %xmm6
	vmovlhps	%xmm6, %xmm4, %xmm4
	vinsertf128	$0x1, %xmm4, %ymm0, %ymm0
	vfnmadd231ps	.LC330(%rip), %ymm0, %ymm2
	vfmadd231ps	%ymm7, %ymm0, %ymm1
	vfmadd132ps	.LC331(%rip), %ymm3, %ymm0
	vaddps	.LC332(%rip), %ymm0, %ymm0
	.p2align 4,,10
	.p2align 3
.L4886:
	incl	%edx
	vmovaps	%ymm0, (%rsi,%rax)
	vmovaps	%ymm1, (%r8,%rax)
	vmovaps	%ymm2, (%rdi,%rax)
	addq	$32, %rax
	cmpl	%edx, %ecx
	jge	.L4886
.L4887:
	subq	$8, %rsp
	pushq	-4648(%rbp)
	movl	-4516(%rbp), %eax
	movq	-4576(%rbp), %r13
	pushq	-4656(%rbp)
	movq	-4704(%rbp), %rbx
	movq	-4664(%rbp), %r9
	pushq	%rax
	movq	-4368(%rbp), %rcx
	movq	-4568(%rbp), %rdx
	movl	$8, %r8d
	movq	%r13, %rsi
	movq	%rbx, %rdi
	vzeroupper
	call	stbiw__jpg_processDU.constprop.1
	addq	$24, %rsp
	pushq	-4688(%rbp)
	movl	%eax, -4516(%rbp)
	movl	-4528(%rbp), %eax
	pushq	-4696(%rbp)
	movq	-4680(%rbp), %r9
	movq	-4384(%rbp), %rcx
	pushq	%rax
	movq	-4568(%rbp), %rdx
	movl	$8, %r8d
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	stbiw__jpg_processDU.constprop.1
	addq	$24, %rsp
	pushq	-4688(%rbp)
	movl	%eax, -4528(%rbp)
	movl	-4536(%rbp), %eax
	pushq	-4696(%rbp)
	movq	-4376(%rbp), %rcx
	movq	-4680(%rbp), %r9
	pushq	%rax
	movq	-4568(%rbp), %rdx
	movl	$8, %r8d
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	stbiw__jpg_processDU.constprop.1
	addl	$8, -4512(%rbp)
	movl	%eax, -4536(%rbp)
	movl	-4560(%rbp), %ecx
	addq	$32, %rsp
	movl	-4512(%rbp), %eax
	addl	%ecx, -4360(%rbp)
	cmpl	-4584(%rbp), %eax
	vmovaps	.LC324(%rip), %ymm15
	vmovaps	.LC325(%rip), %ymm7
	vmovaps	.LC326(%rip), %ymm14
	vmovaps	.LC327(%rip), %ymm13
	vxorps	%xmm8, %xmm8, %xmm8
	jne	.L4892
	addl	$8, -4504(%rbp)
	movl	-4504(%rbp), %eax
	cmpl	-4592(%rbp), %eax
	jne	.L4854
	vzeroupper
.L4884:
	movl	-4340(%rbp), %eax
	movl	$127, %ebx
	leal	7(%rax), %r12d
	movl	$24, %eax
	subl	%r12d, %eax
	shlx	%eax, %ebx, %ebx
	orl	-4344(%rbp), %ebx
	cmpl	$7, %r12d
	jle	.L4853
	movq	-4704(%rbp), %r14
	leaq	-4345(%rbp), %r13
.L4894:
	movl	%ebx, %r15d
	sarl	$16, %r15d
	movb	%r15b, -4345(%rbp)
	movq	8(%r14), %rdi
	movl	$1, %edx
	movq	%r13, %rsi
	call	*(%r14)
	cmpb	$-1, %r15b
	jne	.L4893
	movb	$0, -4345(%rbp)
	movq	8(%r14), %rdi
	movl	$1, %edx
	movq	%r13, %rsi
	call	*(%r14)
.L4893:
	subl	$8, %r12d
	sall	$8, %ebx
	cmpl	$7, %r12d
	jg	.L4894
.L4853:
	movq	-4704(%rbp), %rbx
	movq	-4568(%rbp), %r15
	movb	$-1, -4340(%rbp)
	movq	8(%rbx), %rdi
	movl	$1, %edx
	movq	%r15, %rsi
	call	*(%rbx)
	movb	$-39, -4340(%rbp)
	movq	8(%rbx), %rdi
	movl	$1, %edx
	movq	%r15, %rsi
	call	*(%rbx)
	movq	-56(%rbp), %rax
	subq	%fs:40, %rax
	jne	.L4929
	leaq	-48(%rbp), %rsp
	popq	%rbx
	popq	%r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	movl	$1, %eax
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
.L4852:
	.cfi_restore_state
	testl	%eax, %eax
	jle	.L4853
	movl	-4396(%rbp), %ecx
	testl	%ecx, %ecx
	jle	.L4853
	decl	%eax
	movl	%eax, -4400(%rbp)
	andl	$-16, %eax
	addl	$16, %eax
	movl	%eax, -4844(%rbp)
	movl	%edi, %eax
	decl	%ecx
	sall	$4, %eax
	movl	%eax, -4792(%rbp)
	movl	%ecx, %eax
	movl	%edi, %ebx
	shrl	$4, %eax
	imull	%ecx, %ebx
	incl	%eax
	salq	$4, %rax
	movq	%rax, -4816(%rbp)
	movslq	%edi, %rax
	movq	%rax, -4856(%rbp)
	movslq	%ebx, %rax
	movq	%rax, -4720(%rbp)
	leaq	-4344(%rbp), %rax
	movq	%rax, -4576(%rbp)
	leaq	YAC_HT.3(%rip), %rax
	movq	%rax, -4648(%rbp)
	leaq	YDC_HT.4(%rip), %rax
	movq	%rax, -4656(%rbp)
	leaq	-1232(%rbp), %rax
	movq	%rax, -4840(%rbp)
	leaq	-752(%rbp), %rax
	movq	%rax, -4824(%rbp)
	leaq	-720(%rbp), %rax
	movq	%rax, -4832(%rbp)
	leaq	-3568(%rbp), %rax
	movq	%rax, -4808(%rbp)
	leaq	-3824(%rbp), %rax
	movq	%rax, -4800(%rbp)
	leaq	UVAC_HT.1(%rip), %rax
	movq	%rax, -4688(%rbp)
	leaq	UVDC_HT.2(%rip), %rax
	movl	%ecx, -4520(%rbp)
	movl	$0, -4788(%rbp)
	movl	$0, -4784(%rbp)
	movl	$0, -4776(%rbp)
	movl	$0, -4780(%rbp)
	movq	%rax, -4696(%rbp)
	leaq	-3312(%rbp), %r11
	leaq	-2288(%rbp), %r15
	movl	%ebx, -4728(%rbp)
	leaq	-1264(%rbp), %rbx
	movq	%r15, %r14
	movq	%r11, %r15
	movq	%rbx, %r11
.L4855:
	movl	$15, %eax
	movl	$0, -4668(%rbp)
	movq	$0, -4512(%rbp)
	movq	%r15, %r12
	movq	-4856(%rbp), %r13
	movl	%eax, %r15d
	movq	%r14, %rax
	movq	%r11, %r14
	movq	%rax, %r11
.L4885:
	movq	-4512(%rbp), %rax
	cmpl	$1, -4492(%rbp)
	movl	%eax, -4496(%rbp)
	movl	%eax, -4484(%rbp)
	movl	stbi__flip_vertically_on_write(%rip), %eax
	movl	%eax, -4500(%rbp)
	jne	.L4930
	movq	-4512(%rbp), %rdi
	movl	-4396(%rbp), %eax
	leal	16(%rdi), %ecx
	cmpl	%eax, %ecx
	cmovg	%eax, %ecx
	movl	-4492(%rbp), %ebx
	movl	%ecx, %eax
	subl	%edi, %eax
	cmpl	%ecx, %edi
	cmovl	%eax, %ebx
	decl	%eax
	cmpl	$14, %eax
	setbe	%dl
	cmpl	%edi, %ecx
	setle	%al
	movl	%ebx, -4544(%rbp)
	andl	$-16, %ebx
	movl	%edi, -4516(%rbp)
	movl	%ebx, -4536(%rbp)
	addl	%edi, %ebx
	movl	-4496(%rbp), %edi
	orl	%eax, %edx
	movl	-4780(%rbp), %eax
	movb	%dl, -4504(%rbp)
	leal	2(%rdi), %edx
	vmovd	%edx, %xmm1
	vmovd	%edi, %xmm7
	movl	%eax, -4448(%rbp)
	leal	3(%rdi), %edx
	leal	1(%rdi), %eax
	vpinsrd	$1, %eax, %xmm7, %xmm0
	vpinsrd	$1, %edx, %xmm1, %xmm1
	vpunpcklqdq	%xmm1, %xmm0, %xmm0
	vpaddd	.LC322(%rip), %xmm0, %xmm7
	movq	%r14, -4464(%rbp)
	movl	%ecx, -4392(%rbp)
	movl	%ebx, -4528(%rbp)
	movq	%r13, -4584(%rbp)
	movq	%r11, %r10
	xorl	%ebx, %ebx
	vmovdqa	%xmm7, -4560(%rbp)
	movq	%r12, %r13
	.p2align 4,,10
	.p2align 3
.L4867:
	movl	-4448(%rbp), %edx
	movl	-4400(%rbp), %edi
	cmpl	%edx, -4488(%rbp)
	movl	%edi, %eax
	cmovg	%edx, %eax
	movl	-4500(%rbp), %r9d
	subl	%eax, %edi
	testl	%r9d, %r9d
	cmovne	%edi, %eax
	movl	-4396(%rbp), %edi
	imull	%edi, %eax
	movl	%eax, -4360(%rbp)
	cmpl	-4516(%rbp), %edi
	jg	.L4858
	movl	-4484(%rbp), %edx
	movl	%ebx, %esi
.L4863:
	movl	-4496(%rbp), %eax
	movl	$1, %edi
	subl	%edx, %eax
	leal	16(%rax), %r9d
	cmpl	%edx, %r15d
	cmovl	%edi, %r9d
	addl	$15, %eax
	cmpl	$14, %eax
	jbe	.L4859
	cmpl	%edx, %r15d
	jl	.L4859
	movslq	%esi, %rax
	salq	$2, %rax
	leaq	(%r14,%rax), %r8
	leaq	(%r12,%rax), %rdi
	addq	%r11, %rax
	movq	%rax, -4480(%rbp)
	movl	-4520(%rbp), %eax
	movq	-4368(%rbp), %rcx
	addl	-4360(%rbp), %eax
	cltq
	vpbroadcastb	(%rcx,%rax), %xmm0
	movq	-4376(%rbp), %rcx
	vpmovzxbw	%xmm0, %xmm1
	vpsrldq	$8, %xmm0, %xmm0
	vpmovzxbw	%xmm0, %xmm0
	vpmovsxwd	%xmm0, %xmm10
	vpsrldq	$8, %xmm0, %xmm0
	vpmovsxwd	%xmm0, %xmm0
	vcvtdq2ps	%xmm0, %xmm7
	vpbroadcastb	(%rcx,%rax), %xmm0
	vpmovsxwd	%xmm1, %xmm11
	movq	-4384(%rbp), %rcx
	vpsrldq	$8, %xmm1, %xmm3
	vpmovzxbw	%xmm0, %xmm1
	vpsrldq	$8, %xmm0, %xmm0
	vpmovzxbw	%xmm0, %xmm0
	vpmovsxwd	%xmm1, %xmm6
	vpsrldq	$8, %xmm1, %xmm2
	vpmovsxwd	%xmm0, %xmm5
	vpsrldq	$8, %xmm0, %xmm1
	vpbroadcastb	(%rcx,%rax), %xmm0
	vpmovsxwd	%xmm2, %xmm2
	vpmovzxbw	%xmm0, %xmm4
	vpmovsxwd	%xmm4, %xmm9
	vpsrldq	$8, %xmm4, %xmm4
	vpmovsxwd	%xmm4, %xmm4
	vcvtdq2ps	%xmm4, %xmm4
	vmovaps	%xmm4, -4416(%rbp)
	vmovaps	.LC305(%rip), %xmm4
	vpmovsxwd	%xmm1, %xmm1
	vcvtdq2ps	%xmm6, %xmm6
	vcvtdq2ps	%xmm2, %xmm2
	vmulps	%xmm4, %xmm6, %xmm14
	vmulps	%xmm4, %xmm2, %xmm13
	vcvtdq2ps	%xmm5, %xmm5
	vcvtdq2ps	%xmm1, %xmm1
	vmulps	%xmm4, %xmm5, %xmm12
	vmulps	%xmm4, %xmm1, %xmm4
	vmovaps	.LC306(%rip), %xmm15
	vmovaps	%xmm7, -4432(%rbp)
	vpsrldq	$8, %xmm0, %xmm0
	vcvtdq2ps	%xmm10, %xmm10
	vfmadd231ps	-4432(%rbp), %xmm15, %xmm4
	vfmadd231ps	%xmm15, %xmm10, %xmm12
	vpmovzxbw	%xmm0, %xmm0
	vpmovsxwd	%xmm3, %xmm3
	vcvtdq2ps	%xmm3, %xmm3
	vcvtdq2ps	%xmm11, %xmm11
	vfmadd231ps	%xmm15, %xmm3, %xmm13
	vfmadd231ps	%xmm15, %xmm11, %xmm14
	vpmovsxwd	%xmm0, %xmm7
	vmovaps	.LC307(%rip), %xmm15
	vpsrldq	$8, %xmm0, %xmm0
	vpmovsxwd	%xmm0, %xmm0
	vcvtdq2ps	%xmm0, %xmm0
	vfmadd231ps	%xmm15, %xmm0, %xmm4
	vcvtdq2ps	%xmm7, %xmm7
	vfmadd231ps	%xmm15, %xmm7, %xmm12
	vfmadd231ps	-4416(%rbp), %xmm15, %xmm13
	vcvtdq2ps	%xmm9, %xmm9
	vfmadd231ps	%xmm15, %xmm9, %xmm14
	vmovaps	.LC308(%rip), %xmm15
	vaddps	%xmm15, %xmm4, %xmm4
	vaddps	%xmm15, %xmm12, %xmm12
	vaddps	%xmm15, %xmm14, %xmm14
	vmovups	%xmm4, 48(%r8)
	vmovaps	.LC309(%rip), %xmm4
	vmovups	%xmm12, 32(%r8)
	vaddps	%xmm15, %xmm13, %xmm13
	vmulps	%xmm4, %xmm5, %xmm12
	vmovups	%xmm14, (%r8)
	vmovups	%xmm13, 16(%r8)
	vmovaps	.LC310(%rip), %xmm15
	vmulps	%xmm4, %xmm6, %xmm14
	vmulps	%xmm4, %xmm2, %xmm13
	vmulps	%xmm4, %xmm1, %xmm4
	vfmsub231ps	%xmm15, %xmm10, %xmm12
	vfmsub231ps	%xmm15, %xmm11, %xmm14
	vfmsub231ps	%xmm15, %xmm3, %xmm13
	vfmsub132ps	-4432(%rbp), %xmm4, %xmm15
	vmovaps	.LC311(%rip), %xmm4
	vfmadd231ps	%xmm4, %xmm7, %xmm12
	vfmadd231ps	%xmm4, %xmm9, %xmm14
	vfmadd231ps	%xmm4, %xmm0, %xmm15
	vfmadd231ps	-4416(%rbp), %xmm4, %xmm13
	vmovups	%xmm12, 32(%rdi)
	vmovaps	.LC312(%rip), %xmm12
	vmovups	%xmm14, (%rdi)
	vmulps	%xmm12, %xmm2, %xmm2
	vmulps	%xmm12, %xmm1, %xmm1
	vmulps	%xmm12, %xmm6, %xmm6
	vmulps	%xmm12, %xmm5, %xmm5
	vmovups	%xmm13, 16(%rdi)
	vfmsub231ps	%xmm4, %xmm3, %xmm2
	vmovaps	-4432(%rbp), %xmm3
	vfmsub231ps	%xmm4, %xmm11, %xmm6
	vfmsub132ps	%xmm4, %xmm1, %xmm3
	vfmsub231ps	%xmm4, %xmm10, %xmm5
	vmovups	%xmm15, 48(%rdi)
	vmovaps	.LC313(%rip), %xmm4
	vmovaps	-4416(%rbp), %xmm1
	vfnmadd132ps	%xmm4, %xmm6, %xmm9
	vfnmadd132ps	%xmm4, %xmm2, %xmm1
	vfnmadd132ps	%xmm4, %xmm5, %xmm7
	vfnmadd132ps	%xmm4, %xmm3, %xmm0
	movq	-4480(%rbp), %rax
	vmovups	%xmm9, (%rax)
	vmovups	%xmm1, 16(%rax)
	vmovups	%xmm7, 32(%rax)
	vmovups	%xmm0, 48(%rax)
	movl	%r9d, %eax
	andl	$-16, %eax
	addl	%eax, %edx
	addl	%eax, %esi
	cmpl	%r9d, %eax
	je	.L4864
.L4859:
	movslq	-4360(%rbp), %rax
	movslq	-4396(%rbp), %rdi
	movq	-4368(%rbp), %r8
	addq	%rax, %rdi
	movzbl	-1(%r8,%rdi), %r8d
	movq	-4376(%rbp), %r9
	vcvtsi2ssl	%r8d, %xmm8, %xmm1
	movzbl	-1(%rdi,%r9), %r8d
	vmovss	.LC314(%rip), %xmm4
	vcvtsi2ssl	%r8d, %xmm8, %xmm2
	vmovss	.LC318(%rip), %xmm5
	vmovss	.LC320(%rip), %xmm9
	movq	-4384(%rbp), %r8
	vmulss	%xmm4, %xmm2, %xmm4
	vmulss	%xmm5, %xmm2, %xmm5
	vmulss	%xmm9, %xmm2, %xmm2
	movzbl	-1(%rdi,%r8), %edi
	vmovss	.LC240(%rip), %xmm6
	vfmadd231ss	.LC315(%rip), %xmm1, %xmm4
	vcvtsi2ssl	%edi, %xmm8, %xmm0
	vfmsub231ss	.LC319(%rip), %xmm1, %xmm5
	vfmsub132ss	%xmm6, %xmm2, %xmm1
	vmovss	.LC321(%rip), %xmm7
	vfmadd231ss	.LC316(%rip), %xmm0, %xmm4
	vmovss	.LC317(%rip), %xmm10
	vfmadd231ss	%xmm6, %xmm0, %xmm5
	vfnmadd132ss	%xmm7, %xmm1, %xmm0
	movl	-4392(%rbp), %ecx
	vsubss	%xmm10, %xmm4, %xmm4
	movslq	%esi, %rax
	subl	%esi, %edx
	.p2align 4,,10
	.p2align 3
.L4861:
	vmovss	%xmm4, (%r14,%rax,4)
	vmovss	%xmm5, (%r12,%rax,4)
	vmovss	%xmm0, (%r11,%rax,4)
	incq	%rax
	leal	(%rdx,%rax), %esi
	cmpl	%r15d, %esi
	jle	.L4861
	movl	%ecx, -4392(%rbp)
.L4864:
	addl	$16, %ebx
	incl	-4448(%rbp)
	addq	$64, -4464(%rbp)
	addq	$64, %r13
	addq	$64, %r10
	cmpl	$256, %ebx
	jne	.L4867
	movq	-4584(%rbp), %r13
.L4868:
	subq	$8, %rsp
	pushq	-4648(%rbp)
	movl	-4776(%rbp), %eax
	movq	-4704(%rbp), %rbx
	pushq	-4656(%rbp)
	movq	-4664(%rbp), %r9
	movq	-4568(%rbp), %rdx
	pushq	%rax
	movq	-4576(%rbp), %rsi
	movl	$16, %r8d
	movq	%r14, %rcx
	movq	%rbx, %rdi
	movq	%r11, -4360(%rbp)
	call	stbiw__jpg_processDU.constprop.0
	addq	$24, %rsp
	pushq	-4648(%rbp)
	movq	-4664(%rbp), %r9
	movq	-4840(%rbp), %rcx
	pushq	-4656(%rbp)
	movq	-4568(%rbp), %rdx
	movq	-4576(%rbp), %rsi
	pushq	%rax
	movl	$16, %r8d
	movq	%rbx, %rdi
	call	stbiw__jpg_processDU.constprop.0
	addq	$24, %rsp
	pushq	-4648(%rbp)
	movq	-4664(%rbp), %r9
	movq	-4824(%rbp), %rcx
	pushq	-4656(%rbp)
	movq	-4568(%rbp), %rdx
	movq	-4576(%rbp), %rsi
	pushq	%rax
	movl	$16, %r8d
	movq	%rbx, %rdi
	call	stbiw__jpg_processDU.constprop.0
	addq	$24, %rsp
	pushq	-4648(%rbp)
	movq	-4832(%rbp), %rcx
	movq	-4568(%rbp), %rdx
	pushq	-4656(%rbp)
	movq	-4576(%rbp), %rsi
	movq	-4664(%rbp), %r9
	pushq	%rax
	movl	$16, %r8d
	movq	%rbx, %rdi
	call	stbiw__jpg_processDU.constprop.0
	movq	-4360(%rbp), %r11
	movq	-4808(%rbp), %rcx
	movq	-4800(%rbp), %rsi
	movl	%eax, -4776(%rbp)
	movq	%r11, %rdx
	movq	%r12, %rax
	addq	$32, %rsp
	.p2align 4,,10
	.p2align 3
.L4880:
	vmovaps	(%rax), %ymm5
	vmovaps	32(%rax), %ymm11
	vmovaps	64(%rax), %ymm3
	vshufps	$221, %ymm11, %ymm5, %ymm10
	vperm2f128	$3, %ymm10, %ymm10, %ymm7
	vshufps	$136, %ymm11, %ymm5, %ymm5
	vshufps	$68, %ymm7, %ymm10, %ymm0
	vshufps	$238, %ymm7, %ymm10, %ymm7
	vinsertf128	$1, %xmm7, %ymm0, %ymm0
	vperm2f128	$3, %ymm5, %ymm5, %ymm7
	vmovaps	96(%rax), %ymm9
	vshufps	$68, %ymm7, %ymm5, %ymm10
	vshufps	$238, %ymm7, %ymm5, %ymm7
	vinsertf128	$1, %xmm7, %ymm10, %ymm5
	vaddps	%ymm5, %ymm0, %ymm0
	vshufps	$136, %ymm9, %ymm3, %ymm7
	vperm2f128	$3, %ymm7, %ymm7, %ymm5
	vshufps	$68, %ymm5, %ymm7, %ymm10
	vshufps	$238, %ymm5, %ymm7, %ymm5
	vinsertf128	$1, %xmm5, %ymm10, %ymm5
	vaddps	%ymm5, %ymm0, %ymm0
	vshufps	$221, %ymm9, %ymm3, %ymm3
	vperm2f128	$3, %ymm3, %ymm3, %ymm5
	vshufps	$68, %ymm5, %ymm3, %ymm7
	vshufps	$238, %ymm5, %ymm3, %ymm5
	vinsertf128	$1, %xmm5, %ymm7, %ymm3
	vaddps	%ymm3, %ymm0, %ymm0
	vmovaps	(%rdx), %ymm2
	vmovaps	32(%rdx), %ymm6
	vmulps	.LC323(%rip), %ymm0, %ymm0
	vshufps	$221, %ymm6, %ymm2, %ymm5
	vperm2f128	$3, %ymm5, %ymm5, %ymm3
	vmovaps	64(%rdx), %ymm1
	vmovaps	96(%rdx), %ymm4
	vshufps	$136, %ymm6, %ymm2, %ymm2
	vmovaps	%ymm0, (%rsi)
	vshufps	$68, %ymm3, %ymm5, %ymm0
	vshufps	$238, %ymm3, %ymm5, %ymm3
	vinsertf128	$1, %xmm3, %ymm0, %ymm0
	vperm2f128	$3, %ymm2, %ymm2, %ymm3
	vshufps	$68, %ymm3, %ymm2, %ymm5
	vshufps	$238, %ymm3, %ymm2, %ymm3
	vinsertf128	$1, %xmm3, %ymm5, %ymm2
	vaddps	%ymm2, %ymm0, %ymm0
	vshufps	$136, %ymm4, %ymm1, %ymm3
	vperm2f128	$3, %ymm3, %ymm3, %ymm2
	vshufps	$68, %ymm2, %ymm3, %ymm5
	vshufps	$238, %ymm2, %ymm3, %ymm2
	vinsertf128	$1, %xmm2, %ymm5, %ymm2
	vaddps	%ymm2, %ymm0, %ymm0
	vshufps	$221, %ymm4, %ymm1, %ymm1
	vperm2f128	$3, %ymm1, %ymm1, %ymm2
	vshufps	$68, %ymm2, %ymm1, %ymm3
	vshufps	$238, %ymm2, %ymm1, %ymm2
	vinsertf128	$1, %xmm2, %ymm3, %ymm1
	vaddps	%ymm1, %ymm0, %ymm0
	addq	$32, %rcx
	subq	$-128, %rdx
	vmulps	.LC323(%rip), %ymm0, %ymm0
	addq	$32, %rsi
	subq	$-128, %rax
	vmovaps	%ymm0, -32(%rcx)
	cmpq	%rcx, %r12
	jne	.L4880
	subq	$8, %rsp
	pushq	-4688(%rbp)
	movl	-4784(%rbp), %eax
	movq	-4704(%rbp), %rbx
	pushq	-4696(%rbp)
	movq	-4680(%rbp), %r9
	movq	-4800(%rbp), %rcx
	pushq	%rax
	movq	-4568(%rbp), %rdx
	movq	-4576(%rbp), %rsi
	movl	$8, %r8d
	movq	%rbx, %rdi
	movq	%r11, -4360(%rbp)
	vzeroupper
	call	stbiw__jpg_processDU.constprop.1
	addq	$24, %rsp
	pushq	-4688(%rbp)
	movl	%eax, -4784(%rbp)
	movl	-4788(%rbp), %eax
	pushq	-4696(%rbp)
	movq	-4808(%rbp), %rcx
	movq	-4680(%rbp), %r9
	pushq	%rax
	movq	-4568(%rbp), %rdx
	movq	-4576(%rbp), %rsi
	movl	$8, %r8d
	movq	%rbx, %rdi
	call	stbiw__jpg_processDU.constprop.1
	addq	$16, -4512(%rbp)
	movl	%eax, -4788(%rbp)
	movl	-4792(%rbp), %ecx
	addl	$16, %r15d
	movq	-4512(%rbp), %rax
	addl	%ecx, -4668(%rbp)
	addq	$32, %rsp
	cmpq	-4816(%rbp), %rax
	movq	-4360(%rbp), %r11
	vxorps	%xmm8, %xmm8, %xmm8
	jne	.L4885
	addl	$16, -4780(%rbp)
	movq	%r11, %rax
	movq	%r14, %r11
	movq	%rax, %r14
	movl	-4780(%rbp), %eax
	movq	%r12, %r15
	cmpl	-4844(%rbp), %eax
	jne	.L4855
	jmp	.L4884
	.p2align 4,,10
	.p2align 3
.L4858:
	cmpb	$0, -4504(%rbp)
	jne	.L4904
	leal	1(%rbx), %eax
	vmovd	%ebx, %xmm7
	vpinsrd	$1, %eax, %xmm7, %xmm1
	movslq	-4360(%rbp), %r9
	movq	-4512(%rbp), %rax
	leal	2(%rbx), %ecx
	vmovd	%ecx, %xmm0
	leal	3(%rbx), %edx
	movq	-4368(%rbp), %rcx
	addq	%r9, %rax
	vpinsrd	$1, %edx, %xmm0, %xmm0
	vpunpcklqdq	%xmm0, %xmm1, %xmm7
	vmovdqu	(%rcx,%rax), %xmm0
	movq	-4376(%rbp), %rcx
	vpmovzxbw	%xmm0, %xmm1
	vpsrldq	$8, %xmm0, %xmm0
	vpmovzxbw	%xmm0, %xmm0
	vpmovsxwd	%xmm1, %xmm11
	vpsrldq	$8, %xmm1, %xmm4
	vpmovsxwd	%xmm0, %xmm1
	vpsrldq	$8, %xmm0, %xmm0
	vpmovsxwd	%xmm0, %xmm0
	vmovdqa	%xmm7, -4480(%rbp)
	vcvtdq2ps	%xmm0, %xmm7
	vmovdqu	(%rcx,%rax), %xmm0
	vcvtdq2ps	%xmm1, %xmm5
	vpmovzxbw	%xmm0, %xmm1
	vpsrldq	$8, %xmm0, %xmm0
	vpmovzxbw	%xmm0, %xmm0
	vpmovsxwd	%xmm0, %xmm6
	vmovaps	%xmm7, -4416(%rbp)
	vcvtdq2ps	%xmm6, %xmm6
	vpmovsxwd	%xmm1, %xmm7
	vmulps	.LC305(%rip), %xmm6, %xmm12
	vpsrldq	$8, %xmm1, %xmm2
	vpsrldq	$8, %xmm0, %xmm1
	vpmovsxwd	%xmm2, %xmm2
	vpmovsxwd	%xmm1, %xmm1
	vcvtdq2ps	%xmm7, %xmm7
	vcvtdq2ps	%xmm2, %xmm2
	vmulps	.LC305(%rip), %xmm7, %xmm14
	vmulps	.LC305(%rip), %xmm2, %xmm13
	vcvtdq2ps	%xmm1, %xmm1
	vmulps	.LC305(%rip), %xmm1, %xmm15
	movq	-4384(%rbp), %rcx
	vfmadd231ps	.LC306(%rip), %xmm5, %xmm12
	vmovaps	%xmm5, -4432(%rbp)
	vmovaps	-4416(%rbp), %xmm5
	vmovdqu	(%rcx,%rax), %xmm0
	vpmovsxwd	%xmm4, %xmm4
	vcvtdq2ps	%xmm4, %xmm4
	vfmadd231ps	.LC306(%rip), %xmm5, %xmm15
	vfmadd231ps	.LC306(%rip), %xmm4, %xmm13
	vcvtdq2ps	%xmm11, %xmm11
	vfmadd231ps	.LC306(%rip), %xmm11, %xmm14
	vpmovzxbw	%xmm0, %xmm3
	vpsrldq	$8, %xmm0, %xmm0
	vpmovzxbw	%xmm0, %xmm0
	vmovaps	.LC307(%rip), %xmm5
	vpmovsxwd	%xmm3, %xmm10
	vpmovsxwd	%xmm0, %xmm9
	vpsrldq	$8, %xmm3, %xmm3
	vpsrldq	$8, %xmm0, %xmm0
	vpmovsxwd	%xmm3, %xmm3
	vpmovsxwd	%xmm0, %xmm0
	vcvtdq2ps	%xmm10, %xmm10
	vcvtdq2ps	%xmm3, %xmm3
	vfmadd231ps	%xmm5, %xmm10, %xmm14
	vfmadd231ps	%xmm5, %xmm3, %xmm13
	vcvtdq2ps	%xmm9, %xmm9
	vcvtdq2ps	%xmm0, %xmm0
	vfmadd231ps	%xmm5, %xmm9, %xmm12
	vfmadd231ps	%xmm5, %xmm0, %xmm15
	vmovaps	.LC308(%rip), %xmm5
	movq	-4464(%rbp), %rax
	vaddps	%xmm5, %xmm14, %xmm14
	vaddps	%xmm5, %xmm13, %xmm13
	vaddps	%xmm5, %xmm12, %xmm12
	vaddps	%xmm5, %xmm15, %xmm5
	vmovups	%xmm14, (%rax)
	vmovups	%xmm12, 32(%rax)
	vmovups	%xmm5, 48(%rax)
	vmovaps	.LC309(%rip), %xmm5
	vmovaps	.LC310(%rip), %xmm15
	vmulps	%xmm5, %xmm7, %xmm14
	vmulps	%xmm5, %xmm6, %xmm12
	vmovups	%xmm13, 16(%rax)
	vmulps	%xmm5, %xmm2, %xmm13
	vmulps	%xmm5, %xmm1, %xmm5
	vfmsub231ps	%xmm15, %xmm11, %xmm14
	vfmsub231ps	-4432(%rbp), %xmm15, %xmm12
	vfmsub231ps	%xmm15, %xmm4, %xmm13
	vfmsub132ps	-4416(%rbp), %xmm5, %xmm15
	vmovaps	.LC311(%rip), %xmm5
	vfmadd231ps	%xmm5, %xmm9, %xmm12
	vfmadd231ps	%xmm5, %xmm10, %xmm14
	vfmadd231ps	%xmm5, %xmm3, %xmm13
	vfmadd231ps	%xmm5, %xmm0, %xmm15
	vmovups	%xmm14, 0(%r13)
	vmovups	%xmm12, 32(%r13)
	vmovaps	.LC312(%rip), %xmm12
	vmovups	%xmm13, 16(%r13)
	vmulps	%xmm12, %xmm1, %xmm1
	vmulps	%xmm12, %xmm7, %xmm7
	vmulps	%xmm12, %xmm2, %xmm2
	vmulps	%xmm12, %xmm6, %xmm6
	vmovups	%xmm15, 48(%r13)
	vfmsub231ps	-4416(%rbp), %xmm5, %xmm1
	vfmsub231ps	%xmm5, %xmm11, %xmm7
	vfmsub231ps	%xmm5, %xmm4, %xmm2
	vfmsub231ps	-4432(%rbp), %xmm5, %xmm6
	vmovaps	.LC313(%rip), %xmm4
	movl	-4536(%rbp), %eax
	vfnmadd132ps	%xmm4, %xmm1, %xmm0
	vfnmadd132ps	%xmm4, %xmm7, %xmm10
	vfnmadd132ps	%xmm4, %xmm2, %xmm3
	vfnmadd132ps	%xmm4, %xmm6, %xmm9
	vmovdqa	-4480(%rbp), %xmm7
	vmovups	%xmm0, 48(%r10)
	vpaddd	.LC322(%rip), %xmm7, %xmm0
	vmovdqa	-4560(%rbp), %xmm7
	movl	-4528(%rbp), %edi
	vmovups	%xmm10, (%r10)
	vmovups	%xmm3, 16(%r10)
	vmovups	%xmm9, 32(%r10)
	vpextrd	$3, %xmm0, %esi
	vpextrd	$3, %xmm7, %edx
	leal	(%rax,%rbx), %r8d
	cmpl	-4544(%rbp), %eax
	je	.L4865
.L4862:
	movslq	%edi, %rdi
	movq	-4368(%rbp), %rsi
	leal	1(%r8), %eax
	movq	%rdi, %rdx
	movslq	%r8d, %r8
	addq	%r9, %rdi
	subq	%r8, %rdi
	leaq	(%rsi,%rdi), %r9
	movq	-4376(%rbp), %rsi
	vmovss	.LC314(%rip), %xmm4
	vmovss	.LC315(%rip), %xmm13
	vmovss	.LC316(%rip), %xmm12
	vmovss	.LC317(%rip), %xmm10
	vmovss	.LC318(%rip), %xmm5
	vmovss	.LC319(%rip), %xmm11
	vmovss	.LC240(%rip), %xmm6
	vmovss	.LC320(%rip), %xmm9
	vmovss	.LC321(%rip), %xmm7
	movl	-4392(%rbp), %ecx
	leaq	(%rsi,%rdi), %r8
	cltq
	addq	-4384(%rbp), %rdi
	.p2align 4,,10
	.p2align 3
.L4866:
	movzbl	-1(%r9,%rax), %esi
	incl	%edx
	vcvtsi2ssl	%esi, %xmm8, %xmm1
	movzbl	-1(%r8,%rax), %esi
	vcvtsi2ssl	%esi, %xmm8, %xmm2
	movzbl	-1(%rdi,%rax), %esi
	vcvtsi2ssl	%esi, %xmm8, %xmm0
	vmulss	%xmm4, %xmm2, %xmm3
	movl	%eax, %esi
	vfmadd231ss	%xmm13, %xmm1, %xmm3
	vfmadd231ss	%xmm12, %xmm0, %xmm3
	vsubss	%xmm10, %xmm3, %xmm3
	vmovss	%xmm3, -4(%r14,%rax,4)
	vmulss	%xmm5, %xmm2, %xmm3
	vmulss	%xmm9, %xmm2, %xmm2
	vfmsub231ss	%xmm11, %xmm1, %xmm3
	vfmsub132ss	%xmm6, %xmm2, %xmm1
	vfmadd231ss	%xmm6, %xmm0, %xmm3
	vfnmadd132ss	%xmm7, %xmm1, %xmm0
	vmovss	%xmm3, -4(%r12,%rax,4)
	vmovss	%xmm0, -4(%r11,%rax,4)
	incq	%rax
	cmpl	%ecx, %edx
	jl	.L4866
	movl	%ecx, -4392(%rbp)
.L4865:
	cmpl	%r15d, %edx
	jle	.L4863
	jmp	.L4864
.L4904:
	movl	-4484(%rbp), %edi
	movslq	-4360(%rbp), %r9
	movl	%ebx, %r8d
	jmp	.L4862
.L4930:
	movq	-4512(%rbp), %rdi
	movl	-4396(%rbp), %ecx
	movl	%edi, %eax
	addl	$16, %eax
	cmpl	%ecx, %eax
	cmovg	%ecx, %eax
	movl	%edi, -4708(%rbp)
	movl	%eax, %edx
	subl	%edi, %edx
	movl	%eax, %ebx
	cmpl	%eax, %edi
	movl	$1, %eax
	cmovl	%edx, %eax
	movq	%r12, -4536(%rbp)
	movl	%eax, %ecx
	movl	%eax, -4748(%rbp)
	leal	-1(%rdx), %eax
	cmpl	$14, %eax
	setbe	%dl
	cmpl	%ebx, %edi
	setge	%al
	andl	$-16, %ecx
	movl	%ecx, -4752(%rbp)
	addl	%edi, %ecx
	orl	%eax, %edx
	movl	%ecx, -4772(%rbp)
	movl	-4780(%rbp), %eax
	movl	-4496(%rbp), %ecx
	movl	%eax, -4504(%rbp)
	leal	2(%rcx), %edi
	leal	15(%rcx), %eax
	vmovd	%ecx, %xmm7
	movb	%dl, -4709(%rbp)
	movl	%eax, -4516(%rbp)
	vmovd	%edi, %xmm1
	leal	1(%rcx), %eax
	leal	3(%rcx), %edx
	vpinsrd	$1, %eax, %xmm7, %xmm0
	vpinsrd	$1, %edx, %xmm1, %xmm1
	movq	-4376(%rbp), %rax
	vpunpcklqdq	%xmm1, %xmm0, %xmm0
	vpaddd	.LC322(%rip), %xmm0, %xmm7
	movq	$0, -4360(%rbp)
	movl	%r15d, -4672(%rbp)
	movq	%r12, -4392(%rbp)
	movq	%rax, -4432(%rbp)
	movq	%r14, -4528(%rbp)
	movl	%ebx, -4724(%rbp)
	movq	%r14, -4416(%rbp)
	movq	-4368(%rbp), %rbx
	movq	-4384(%rbp), %r14
	movq	%r11, %r9
	vmovdqa	%xmm7, -4768(%rbp)
	movq	%r13, %r11
	.p2align 4,,10
	.p2align 3
.L4879:
	movl	-4504(%rbp), %edx
	movl	-4400(%rbp), %ecx
	cmpl	%edx, -4488(%rbp)
	movl	%ecx, %edi
	cmovg	%edx, %edi
	movl	-4500(%rbp), %r8d
	subl	%edi, %ecx
	movl	%edi, %eax
	testl	%r8d, %r8d
	cmovne	%ecx, %eax
	movl	-4396(%rbp), %edi
	movl	-4492(%rbp), %ecx
	imull	%edi, %eax
	movl	-4360(%rbp), %r10d
	imull	%eax, %ecx
	movl	%ecx, -4480(%rbp)
	cmpl	-4708(%rbp), %edi
	jle	.L4907
	cmpb	$0, -4709(%rbp)
	jne	.L4908
	leal	2(%r10), %edi
	leal	3(%r10), %edx
	vmovd	%edi, %xmm0
	vpinsrd	$1, %edx, %xmm0, %xmm0
	movslq	-4668(%rbp), %rdx
	movslq	%ecx, %rcx
	addq	%rcx, %rdx
	movq	%rcx, -4544(%rbp)
	movq	-4736(%rbp), %rcx
	leal	1(%r10), %eax
	vmovd	%r10d, %xmm7
	vpinsrd	$1, %eax, %xmm7, %xmm1
	addq	%rdx, %rcx
	leaq	(%rbx,%rdx), %rax
	addq	-4744(%rbp), %rdx
	leaq	(%rbx,%rdx), %rdi
	leaq	(%rax,%r11), %rdx
	movq	%rdx, %r12
	addq	%r11, %rdx
	movq	%rdx, -4448(%rbp)
	movzbl	(%rax), %eax
	vpunpcklqdq	%xmm0, %xmm1, %xmm7
	leaq	(%rdx,%r11), %rsi
	vmovd	%eax, %xmm0
	movq	%rsi, -4464(%rbp)
	vpinsrb	$1, (%r12), %xmm0, %xmm0
	movq	-4448(%rbp), %r12
	leaq	(%rsi,%r11), %r8
	movzbl	(%r12), %eax
	movq	%r8, -4560(%rbp)
	movq	-4464(%rbp), %r12
	movq	%rdi, -4624(%rbp)
	vmovdqa	%xmm7, -4640(%rbp)
	leaq	(%r8,%r11), %rdi
	vmovd	%eax, %xmm7
	vpinsrb	$1, (%r12), %xmm7, %xmm7
	movq	%rdi, -4584(%rbp)
	movq	-4560(%rbp), %r12
	addq	%rbx, %rcx
	movq	%rcx, -4608(%rbp)
	leaq	(%rdi,%r11), %rcx
	movzbl	(%r12), %eax
	movq	%rcx, -4592(%rbp)
	movq	-4584(%rbp), %r12
	vmovd	%eax, %xmm3
	vpinsrb	$1, (%r12), %xmm3, %xmm3
	movq	-4592(%rbp), %r12
	leaq	(%rcx,%r11), %rdx
	movzbl	(%r12), %eax
	leaq	(%rdx,%r11), %rsi
	movq	%rsi, %r13
	leaq	(%rsi,%r11), %r8
	vmovd	%eax, %xmm6
	movzbl	0(%r13), %eax
	leaq	(%r8,%r11), %rdi
	leaq	(%rdi,%r11), %rsi
	movq	%rdx, -4600(%rbp)
	vmovd	%eax, %xmm1
	movzbl	(%rdi), %eax
	leaq	(%rsi,%r11), %rcx
	vmovd	%eax, %xmm5
	movzbl	(%rcx), %eax
	leaq	(%rcx,%r11), %rdx
	movq	-4600(%rbp), %r12
	leaq	(%rdx,%r11), %r15
	vmovd	%eax, %xmm2
	vpinsrb	$1, (%r12), %xmm6, %xmm6
	vpinsrb	$1, (%rsi), %xmm5, %xmm5
	vpinsrb	$1, (%r8), %xmm1, %xmm1
	vpinsrb	$1, (%rdx), %xmm2, %xmm2
	movzbl	(%r15), %eax
	movq	-4608(%rbp), %r13
	vmovd	%eax, %xmm4
	vpinsrb	$1, (%r15,%r11), %xmm4, %xmm4
	vpunpcklwd	%xmm6, %xmm3, %xmm3
	vpunpcklwd	%xmm4, %xmm2, %xmm2
	vpunpcklwd	%xmm7, %xmm0, %xmm0
	vpunpcklwd	%xmm5, %xmm1, %xmm1
	vpunpckldq	%xmm2, %xmm1, %xmm1
	vpunpckldq	%xmm3, %xmm0, %xmm0
	leaq	0(%r13,%r11), %r15
	vpunpcklqdq	%xmm1, %xmm0, %xmm0
	vpmovzxbw	%xmm0, %xmm1
	leaq	(%r15,%r11), %rax
	vpsrldq	$8, %xmm0, %xmm0
	leaq	(%rax,%r11), %rdx
	vpmovzxbw	%xmm0, %xmm0
	movq	%rdx, -4464(%rbp)
	movzbl	0(%r13), %r13d
	vpmovsxwd	%xmm0, %xmm10
	vpsrldq	$8, %xmm0, %xmm0
	leaq	(%rdx,%r11), %rsi
	vpmovsxwd	%xmm0, %xmm0
	movq	%rsi, -4560(%rbp)
	movzbl	(%rax), %eax
	vcvtdq2ps	%xmm0, %xmm7
	vmovd	%r13d, %xmm0
	vpinsrb	$1, (%r15), %xmm0, %xmm0
	movq	-4464(%rbp), %r15
	leaq	(%rsi,%r11), %r8
	vmovd	%eax, %xmm3
	vpinsrb	$1, (%r15), %xmm3, %xmm3
	movq	%r8, -4584(%rbp)
	movq	-4560(%rbp), %r15
	leaq	(%r8,%r11), %rdi
	movzbl	(%r15), %eax
	movq	%rdi, -4592(%rbp)
	movq	-4584(%rbp), %r15
	leaq	(%rdi,%r11), %rcx
	vmovd	%eax, %xmm9
	vpinsrb	$1, (%r15), %xmm9, %xmm9
	movq	%rcx, -4600(%rbp)
	movq	-4592(%rbp), %r15
	leaq	(%rcx,%r11), %r12
	movzbl	(%r15), %eax
	movq	%r12, -4608(%rbp)
	movq	-4600(%rbp), %r15
	vmovd	%eax, %xmm2
	vpinsrb	$1, (%r15), %xmm2, %xmm2
	leaq	(%r12,%r11), %r8
	movq	-4608(%rbp), %r15
	leaq	(%r8,%r11), %rdi
	movzbl	(%r15), %eax
	leaq	(%rdi,%r11), %rsi
	leaq	(%rsi,%r11), %rcx
	leaq	(%rcx,%r11), %rdx
	vpmovsxwd	%xmm1, %xmm11
	vpsrldq	$8, %xmm1, %xmm4
	vmovd	%eax, %xmm1
	movzbl	(%rdi), %eax
	leaq	(%rdx,%r11), %r12
	movq	%r12, -4616(%rbp)
	vmovaps	%xmm7, -4448(%rbp)
	vmovd	%eax, %xmm7
	movzbl	(%rcx), %eax
	vpinsrb	$1, (%rsi), %xmm7, %xmm7
	vmovd	%eax, %xmm5
	vpinsrb	$1, (%rdx), %xmm5, %xmm5
	vpinsrb	$1, (%r8), %xmm1, %xmm1
	movq	-4616(%rbp), %rcx
	movq	-4624(%rbp), %r12
	movzbl	(%rcx), %eax
	leaq	(%r12,%r11), %r15
	vmovd	%eax, %xmm6
	vpinsrb	$1, (%rcx,%r11), %xmm6, %xmm6
	vpunpcklwd	%xmm3, %xmm0, %xmm0
	vpunpcklwd	%xmm7, %xmm1, %xmm1
	vpunpcklwd	%xmm2, %xmm9, %xmm3
	vpunpcklwd	%xmm6, %xmm5, %xmm2
	vpunpckldq	%xmm2, %xmm1, %xmm1
	leaq	(%r15,%r11), %rax
	vpunpckldq	%xmm3, %xmm0, %xmm0
	leaq	(%rax,%r11), %rcx
	vpunpcklqdq	%xmm1, %xmm0, %xmm0
	vpmovzxbw	%xmm0, %xmm1
	movq	%rcx, -4464(%rbp)
	movzbl	(%r12), %r12d
	vpsrldq	$8, %xmm0, %xmm0
	leaq	(%rcx,%r11), %rdi
	vpmovzxbw	%xmm0, %xmm0
	movq	%rdi, -4560(%rbp)
	movzbl	(%rax), %eax
	vpmovsxwd	%xmm1, %xmm7
	vpsrldq	$8, %xmm1, %xmm2
	vpmovsxwd	%xmm0, %xmm6
	vpsrldq	$8, %xmm0, %xmm1
	vmovd	%r12d, %xmm0
	vpinsrb	$1, (%r15), %xmm0, %xmm0
	movq	-4464(%rbp), %r15
	leaq	(%rdi,%r11), %rdx
	vmovd	%eax, %xmm15
	vpinsrb	$1, (%r15), %xmm15, %xmm15
	movq	%rdx, -4584(%rbp)
	movq	-4560(%rbp), %r15
	leaq	(%rdx,%r11), %rsi
	movzbl	(%r15), %eax
	movq	%rsi, -4592(%rbp)
	movq	-4584(%rbp), %r15
	leaq	(%rsi,%r11), %r8
	vmovd	%eax, %xmm9
	movq	%r8, -4600(%rbp)
	vpinsrb	$1, (%r15), %xmm9, %xmm9
	movq	-4592(%rbp), %r15
	leaq	(%r8,%r11), %rcx
	movzbl	(%r15), %eax
	movq	%rcx, -4608(%rbp)
	movq	-4600(%rbp), %r15
	vmovd	%eax, %xmm14
	vpinsrb	$1, (%r15), %xmm14, %xmm14
	movq	-4608(%rbp), %r15
	leaq	(%rcx,%r11), %r8
	movzbl	(%r15), %eax
	leaq	(%r8,%r11), %rdi
	leaq	(%rdi,%r11), %rsi
	vmovd	%eax, %xmm13
	movzbl	(%rdi), %eax
	leaq	(%rsi,%r11), %rcx
	leaq	(%rcx,%r11), %rdx
	vmovd	%eax, %xmm3
	movzbl	(%rcx), %eax
	leaq	(%rdx,%r11), %r13
	vmovd	%eax, %xmm5
	movzbl	0(%r13), %eax
	vpinsrb	$1, (%r8), %xmm13, %xmm13
	vmovd	%eax, %xmm12
	vpinsrb	$1, (%rdx), %xmm5, %xmm5
	vpinsrb	$1, 0(%r13,%r11), %xmm12, %xmm12
	vpinsrb	$1, (%rsi), %xmm3, %xmm3
	vpunpcklwd	%xmm14, %xmm9, %xmm9
	vpunpcklwd	%xmm12, %xmm5, %xmm5
	vpunpcklwd	%xmm15, %xmm0, %xmm0
	vpunpcklwd	%xmm3, %xmm13, %xmm3
	vpunpckldq	%xmm5, %xmm3, %xmm3
	vpunpckldq	%xmm9, %xmm0, %xmm0
	vpunpcklqdq	%xmm3, %xmm0, %xmm0
	vpmovzxbw	%xmm0, %xmm3
	vpmovsxwd	%xmm3, %xmm5
	vcvtdq2ps	%xmm5, %xmm5
	vmovaps	%xmm5, -4464(%rbp)
	vmovaps	.LC305(%rip), %xmm5
	vpmovsxwd	%xmm2, %xmm2
	vpmovsxwd	%xmm1, %xmm1
	vcvtdq2ps	%xmm6, %xmm6
	vcvtdq2ps	%xmm7, %xmm7
	vmulps	%xmm5, %xmm6, %xmm12
	vmulps	%xmm5, %xmm7, %xmm14
	vcvtdq2ps	%xmm2, %xmm2
	vcvtdq2ps	%xmm1, %xmm1
	vmulps	%xmm5, %xmm2, %xmm13
	vmulps	%xmm5, %xmm1, %xmm5
	vmovaps	.LC306(%rip), %xmm15
	vpsrldq	$8, %xmm0, %xmm0
	vcvtdq2ps	%xmm10, %xmm10
	vpmovzxbw	%xmm0, %xmm0
	vfmadd231ps	-4448(%rbp), %xmm15, %xmm5
	vfmadd231ps	%xmm15, %xmm10, %xmm12
	vpmovsxwd	%xmm4, %xmm4
	vcvtdq2ps	%xmm11, %xmm11
	vcvtdq2ps	%xmm4, %xmm4
	vfmadd231ps	%xmm15, %xmm11, %xmm14
	vfmadd231ps	%xmm15, %xmm4, %xmm13
	vpmovsxwd	%xmm0, %xmm9
	vmovaps	.LC307(%rip), %xmm15
	vpsrldq	$8, %xmm0, %xmm0
	vpmovsxwd	%xmm0, %xmm0
	vcvtdq2ps	%xmm0, %xmm0
	vfmadd231ps	%xmm15, %xmm0, %xmm5
	vpsrldq	$8, %xmm3, %xmm3
	vcvtdq2ps	%xmm9, %xmm9
	vpmovsxwd	%xmm3, %xmm3
	vfmadd231ps	%xmm15, %xmm9, %xmm12
	vfmadd231ps	-4464(%rbp), %xmm15, %xmm14
	vcvtdq2ps	%xmm3, %xmm3
	vfmadd231ps	%xmm15, %xmm3, %xmm13
	vmovaps	.LC308(%rip), %xmm15
	movq	-4528(%rbp), %rcx
	vaddps	%xmm15, %xmm5, %xmm5
	vaddps	%xmm15, %xmm12, %xmm12
	vaddps	%xmm15, %xmm14, %xmm14
	vmovups	%xmm5, 48(%rcx)
	vmovaps	.LC309(%rip), %xmm5
	vmovups	%xmm12, 32(%rcx)
	vaddps	%xmm15, %xmm13, %xmm13
	vmulps	%xmm5, %xmm6, %xmm12
	vmovups	%xmm14, (%rcx)
	vmovups	%xmm13, 16(%rcx)
	vmovaps	.LC310(%rip), %xmm15
	vmulps	%xmm5, %xmm7, %xmm14
	vmulps	%xmm5, %xmm2, %xmm13
	vmulps	%xmm5, %xmm1, %xmm5
	vfmsub231ps	%xmm15, %xmm10, %xmm12
	movq	-4536(%rbp), %rcx
	vfmsub231ps	%xmm15, %xmm11, %xmm14
	vfmsub231ps	%xmm15, %xmm4, %xmm13
	vfmsub132ps	-4448(%rbp), %xmm5, %xmm15
	vmovaps	.LC311(%rip), %xmm5
	movq	-4360(%rbp), %rax
	vfmadd231ps	%xmm5, %xmm9, %xmm12
	vfmadd231ps	-4464(%rbp), %xmm5, %xmm14
	vfmadd231ps	%xmm5, %xmm3, %xmm13
	vfmadd231ps	%xmm5, %xmm0, %xmm15
	vmovups	%xmm12, 32(%rcx)
	vmovaps	.LC312(%rip), %xmm12
	vmovups	%xmm14, (%rcx)
	vmulps	%xmm12, %xmm2, %xmm2
	vmulps	%xmm12, %xmm1, %xmm1
	vmulps	%xmm12, %xmm7, %xmm7
	vmovups	%xmm13, 16(%rcx)
	vmovups	%xmm15, 48(%rcx)
	vfmsub132ps	%xmm5, %xmm2, %xmm4
	vmulps	%xmm12, %xmm6, %xmm2
	vfmsub231ps	%xmm5, %xmm11, %xmm7
	vmovaps	.LC313(%rip), %xmm6
	vfnmadd132ps	%xmm6, %xmm4, %xmm3
	vfmsub231ps	%xmm5, %xmm10, %xmm2
	vfmsub132ps	-4448(%rbp), %xmm1, %xmm5
	vmovaps	-4464(%rbp), %xmm1
	vfnmadd132ps	%xmm6, %xmm7, %xmm1
	vfnmadd132ps	%xmm6, %xmm2, %xmm9
	vfnmadd132ps	%xmm6, %xmm5, %xmm0
	vmovdqa	-4640(%rbp), %xmm7
	vmovups	%xmm3, 16(%r9,%rax,4)
	vmovups	%xmm1, (%r9,%rax,4)
	vmovups	%xmm9, 32(%r9,%rax,4)
	vmovups	%xmm0, 48(%r9,%rax,4)
	vpaddd	.LC322(%rip), %xmm7, %xmm0
	vmovdqa	-4768(%rbp), %xmm7
	movl	-4752(%rbp), %ecx
	vpextrd	$3, %xmm0, %eax
	vpextrd	$3, %xmm7, %edx
	addl	%ecx, %r10d
	cmpl	%ecx, -4748(%rbp)
	je	.L4909
	movl	-4772(%rbp), %edx
.L4872:
	movl	-4492(%rbp), %ecx
	leal	1(%r10), %eax
	imull	%edx, %ecx
	vmovss	.LC314(%rip), %xmm4
	vmovss	.LC315(%rip), %xmm13
	movslq	%ecx, %rcx
	vmovss	.LC316(%rip), %xmm12
	vmovss	.LC317(%rip), %xmm10
	vmovss	.LC318(%rip), %xmm5
	vmovss	.LC319(%rip), %xmm11
	vmovss	.LC240(%rip), %xmm6
	vmovss	.LC320(%rip), %xmm9
	vmovss	.LC321(%rip), %xmm7
	movl	-4724(%rbp), %esi
	movq	-4392(%rbp), %r12
	movq	-4432(%rbp), %r13
	movq	-4416(%rbp), %r15
	cltq
	addq	-4544(%rbp), %rcx
	.p2align 4,,10
	.p2align 3
.L4874:
	movzbl	(%rbx,%rcx), %edi
	incl	%edx
	vcvtsi2ssl	%edi, %xmm8, %xmm1
	movzbl	0(%r13,%rcx), %edi
	movl	%eax, %r10d
	vcvtsi2ssl	%edi, %xmm8, %xmm2
	movzbl	(%r14,%rcx), %edi
	addq	%r11, %rcx
	vcvtsi2ssl	%edi, %xmm8, %xmm0
	vmulss	%xmm4, %xmm2, %xmm3
	vfmadd231ss	%xmm13, %xmm1, %xmm3
	vfmadd231ss	%xmm12, %xmm0, %xmm3
	vsubss	%xmm10, %xmm3, %xmm3
	vmovss	%xmm3, -4(%r15,%rax,4)
	vmulss	%xmm5, %xmm2, %xmm3
	vmulss	%xmm9, %xmm2, %xmm2
	vfmsub231ss	%xmm11, %xmm1, %xmm3
	vfmsub132ss	%xmm6, %xmm2, %xmm1
	vfmadd231ss	%xmm6, %xmm0, %xmm3
	vfnmadd132ss	%xmm7, %xmm1, %xmm0
	vmovss	%xmm3, -4(%r12,%rax,4)
	vmovss	%xmm0, -4(%r9,%rax,4)
	incq	%rax
	cmpl	%edx, %esi
	jg	.L4874
	movq	%r12, -4392(%rbp)
	movq	%r13, -4432(%rbp)
	movq	%r15, -4416(%rbp)
.L4873:
	cmpl	%edx, -4516(%rbp)
	jl	.L4876
.L4871:
	movl	-4496(%rbp), %eax
	movl	-4516(%rbp), %edi
	subl	%edx, %eax
	leal	16(%rax), %esi
	cmpl	%edx, %edi
	movl	$1, %ecx
	cmovl	%ecx, %esi
	addl	$15, %eax
	cmpl	$14, %eax
	jbe	.L4875
	cmpl	%edx, %edi
	jl	.L4875
	movq	-4416(%rbp), %rcx
	movq	-4392(%rbp), %rdi
	movslq	%r10d, %rax
	salq	$2, %rax
	addq	%rax, %rcx
	addq	%rax, %rdi
	leaq	(%r9,%rax), %r8
	movl	-4480(%rbp), %eax
	movq	-4432(%rbp), %r15
	addl	-4728(%rbp), %eax
	cltq
	vpbroadcastb	(%rbx,%rax), %xmm0
	vpmovzxbw	%xmm0, %xmm1
	vpsrldq	$8, %xmm0, %xmm0
	vpmovzxbw	%xmm0, %xmm0
	vpmovsxwd	%xmm0, %xmm10
	vpsrldq	$8, %xmm0, %xmm0
	vpmovsxwd	%xmm0, %xmm0
	vcvtdq2ps	%xmm0, %xmm4
	vpbroadcastb	(%r15,%rax), %xmm0
	vpmovsxwd	%xmm1, %xmm11
	vpsrldq	$8, %xmm1, %xmm3
	vpmovzxbw	%xmm0, %xmm1
	vpsrldq	$8, %xmm0, %xmm0
	vpmovzxbw	%xmm0, %xmm0
	vpmovsxwd	%xmm1, %xmm6
	vpmovsxwd	%xmm0, %xmm5
	vpsrldq	$8, %xmm1, %xmm1
	vpsrldq	$8, %xmm0, %xmm0
	vpmovsxwd	%xmm0, %xmm0
	vpmovsxwd	%xmm1, %xmm1
	vcvtdq2ps	%xmm5, %xmm5
	vcvtdq2ps	%xmm6, %xmm6
	vmulps	.LC305(%rip), %xmm5, %xmm12
	vmulps	.LC305(%rip), %xmm6, %xmm14
	vcvtdq2ps	%xmm1, %xmm1
	vcvtdq2ps	%xmm0, %xmm15
	vmulps	.LC305(%rip), %xmm1, %xmm13
	vmovaps	%xmm15, -4464(%rbp)
	vmulps	.LC305(%rip), %xmm15, %xmm15
	vpbroadcastb	(%r14,%rax), %xmm0
	vpmovsxwd	%xmm3, %xmm3
	vcvtdq2ps	%xmm11, %xmm11
	vcvtdq2ps	%xmm3, %xmm3
	vfmadd231ps	.LC306(%rip), %xmm4, %xmm15
	vfmadd231ps	.LC306(%rip), %xmm3, %xmm13
	vcvtdq2ps	%xmm10, %xmm10
	vfmadd231ps	.LC306(%rip), %xmm11, %xmm14
	vfmadd231ps	.LC306(%rip), %xmm10, %xmm12
	vpmovzxbw	%xmm0, %xmm2
	vpsrldq	$8, %xmm0, %xmm0
	vpmovzxbw	%xmm0, %xmm0
	vmovaps	%xmm4, -4448(%rbp)
	vpmovsxwd	%xmm2, %xmm9
	vmovaps	.LC307(%rip), %xmm4
	vpmovsxwd	%xmm0, %xmm7
	vpsrldq	$8, %xmm2, %xmm2
	vpsrldq	$8, %xmm0, %xmm0
	vpmovsxwd	%xmm2, %xmm2
	vpmovsxwd	%xmm0, %xmm0
	vcvtdq2ps	%xmm9, %xmm9
	vcvtdq2ps	%xmm2, %xmm2
	vfmadd231ps	%xmm4, %xmm9, %xmm14
	vfmadd231ps	%xmm4, %xmm2, %xmm13
	vcvtdq2ps	%xmm7, %xmm7
	vcvtdq2ps	%xmm0, %xmm0
	vfmadd231ps	%xmm4, %xmm7, %xmm12
	vfmadd231ps	%xmm4, %xmm0, %xmm15
	vmovaps	.LC308(%rip), %xmm4
	movl	%esi, %eax
	vaddps	%xmm4, %xmm14, %xmm14
	vaddps	%xmm4, %xmm13, %xmm13
	vaddps	%xmm4, %xmm12, %xmm12
	vaddps	%xmm4, %xmm15, %xmm4
	vmovups	%xmm14, (%rcx)
	vmovups	%xmm13, 16(%rcx)
	vmovups	%xmm4, 48(%rcx)
	vmovaps	.LC309(%rip), %xmm4
	vmovups	%xmm12, 32(%rcx)
	vmulps	%xmm4, %xmm6, %xmm14
	vmulps	%xmm4, %xmm1, %xmm13
	vmulps	%xmm4, %xmm5, %xmm12
	vmulps	-4464(%rbp), %xmm4, %xmm4
	vmovaps	.LC310(%rip), %xmm15
	andl	$-16, %eax
	vfmsub231ps	%xmm15, %xmm3, %xmm13
	vfmsub231ps	%xmm15, %xmm11, %xmm14
	vfmsub231ps	%xmm15, %xmm10, %xmm12
	vfmsub132ps	-4448(%rbp), %xmm4, %xmm15
	vmovaps	.LC311(%rip), %xmm4
	addl	%eax, %edx
	vfmadd231ps	%xmm4, %xmm9, %xmm14
	vfmadd231ps	%xmm4, %xmm7, %xmm12
	vfmadd231ps	%xmm4, %xmm2, %xmm13
	vfmadd231ps	%xmm4, %xmm0, %xmm15
	addl	%eax, %r10d
	vmovups	%xmm14, (%rdi)
	vmovups	%xmm12, 32(%rdi)
	vmovups	%xmm13, 16(%rdi)
	vmovups	%xmm15, 48(%rdi)
	vmovaps	.LC312(%rip), %xmm12
	vmulps	%xmm12, %xmm1, %xmm1
	vmulps	%xmm12, %xmm6, %xmm6
	vfmsub132ps	%xmm4, %xmm1, %xmm3
	vmulps	%xmm12, %xmm5, %xmm1
	vmulps	-4464(%rbp), %xmm12, %xmm5
	vfmsub231ps	%xmm4, %xmm11, %xmm6
	vfmsub231ps	%xmm4, %xmm10, %xmm1
	vfmsub132ps	-4448(%rbp), %xmm5, %xmm4
	vmovaps	.LC313(%rip), %xmm5
	vfnmadd132ps	%xmm5, %xmm6, %xmm9
	vfnmadd132ps	%xmm5, %xmm3, %xmm2
	vfnmadd132ps	%xmm5, %xmm1, %xmm7
	vfnmadd132ps	%xmm5, %xmm4, %xmm0
	vmovups	%xmm9, (%r8)
	vmovups	%xmm2, 16(%r8)
	vmovups	%xmm7, 32(%r8)
	vmovups	%xmm0, 48(%r8)
	cmpl	%eax, %esi
	je	.L4876
.L4875:
	movslq	-4480(%rbp), %rcx
	movq	-4432(%rbp), %r13
	addq	-4720(%rbp), %rcx
	movzbl	(%rbx,%rcx), %esi
	vmovss	.LC314(%rip), %xmm4
	vcvtsi2ssl	%esi, %xmm8, %xmm3
	movzbl	0(%r13,%rcx), %esi
	vmovss	.LC318(%rip), %xmm5
	vcvtsi2ssl	%esi, %xmm8, %xmm7
	vmovss	.LC320(%rip), %xmm9
	movzbl	(%r14,%rcx), %ecx
	vmovss	.LC240(%rip), %xmm6
	vmulss	%xmm4, %xmm7, %xmm0
	vmulss	%xmm5, %xmm7, %xmm1
	vmulss	%xmm9, %xmm7, %xmm7
	vcvtsi2ssl	%ecx, %xmm8, %xmm2
	vmovss	.LC317(%rip), %xmm10
	vfmadd231ss	.LC315(%rip), %xmm3, %xmm0
	vfmsub231ss	.LC319(%rip), %xmm3, %xmm1
	vfmsub132ss	%xmm6, %xmm7, %xmm3
	vmovss	.LC321(%rip), %xmm7
	movl	-4672(%rbp), %esi
	vfmadd231ss	.LC316(%rip), %xmm2, %xmm0
	vfmadd231ss	%xmm6, %xmm2, %xmm1
	vfnmadd132ss	%xmm7, %xmm3, %xmm2
	movq	-4392(%rbp), %r12
	movq	-4416(%rbp), %r15
	vsubss	%xmm10, %xmm0, %xmm0
	movslq	%r10d, %rax
	subl	%r10d, %edx
	.p2align 4,,10
	.p2align 3
.L4877:
	vmovss	%xmm0, (%r15,%rax,4)
	vmovss	%xmm1, (%r12,%rax,4)
	vmovss	%xmm2, (%r9,%rax,4)
	incq	%rax
	leal	(%rdx,%rax), %ecx
	cmpl	%ecx, %esi
	jge	.L4877
	movq	%r12, -4392(%rbp)
	movq	%r13, -4432(%rbp)
	movq	%r15, -4416(%rbp)
.L4876:
	addq	$16, -4360(%rbp)
	incl	-4504(%rbp)
	addq	$64, -4528(%rbp)
	addq	$64, -4536(%rbp)
	movq	-4360(%rbp), %rax
	cmpq	$256, %rax
	jne	.L4879
	movq	%r11, %r13
	movq	-4392(%rbp), %r12
	movq	-4416(%rbp), %r14
	movl	-4672(%rbp), %r15d
	movq	%r9, %r11
	jmp	.L4868
	.p2align 4,,10
	.p2align 3
.L4907:
	movl	-4484(%rbp), %edx
	jmp	.L4871
.L4908:
	movslq	-4480(%rbp), %rax
	movl	-4484(%rbp), %edx
	movq	%rax, -4544(%rbp)
	jmp	.L4872
.L4909:
	movl	%eax, %r10d
	jmp	.L4873
.L4891:
	movl	$8, %ecx
	.p2align 4,,10
	.p2align 3
.L4888:
	movl	-4392(%rbp), %esi
	movl	-4400(%rbp), %eax
	movl	-4360(%rbp), %ebx
	subl	%edx, %eax
	testl	%esi, %esi
	cmove	%edx, %eax
	movl	-4416(%rbp), %edi
	imull	-4396(%rbp), %eax
	movl	-4484(%rbp), %esi
	incl	%edx
	imull	-4492(%rbp), %eax
	addl	%eax, %ebx
	movslq	%ebx, %rbx
	movzbl	(%r15,%rbx), %r13d
	leal	(%rax,%rdi), %r11d
	movl	-4432(%rbp), %edi
	movslq	%r11d, %r11
	leal	(%rax,%rdi), %r10d
	vcvtsi2ssl	%r13d, %xmm8, %xmm1
	movl	-4448(%rbp), %edi
	movzbl	(%r15,%r11), %r13d
	movslq	%r10d, %r10
	vcvtsi2ssl	%r13d, %xmm8, %xmm4
	leal	(%rax,%rdi), %r9d
	movzbl	(%r15,%r10), %r13d
	movl	-4464(%rbp), %edi
	movslq	%r9d, %r9
	vcvtsi2ssl	%r13d, %xmm8, %xmm2
	leal	(%rax,%rdi), %r8d
	movzbl	(%r15,%r9), %r13d
	movl	-4480(%rbp), %edi
	movslq	%r8d, %r8
	vcvtsi2ssl	%r13d, %xmm8, %xmm5
	addl	%eax, %edi
	movzbl	(%r15,%r8), %r13d
	movslq	%edi, %rdi
	vcvtsi2ssl	%r13d, %xmm8, %xmm0
	movzbl	(%r15,%rdi), %r13d
	addl	%eax, %esi
	vmovaps	%xmm2, %xmm3
	vcvtsi2ssl	%r13d, %xmm8, %xmm2
	movslq	%esi, %rsi
	movzbl	(%r15,%rsi), %r13d
	addl	-4496(%rbp), %eax
	cltq
	vmovaps	%xmm2, %xmm6
	vcvtsi2ssl	%r13d, %xmm8, %xmm2
	movzbl	(%r15,%rax), %r13d
	vunpcklps	%xmm5, %xmm3, %xmm3
	vcvtsi2ssl	%r13d, %xmm8, %xmm9
	vunpcklps	%xmm6, %xmm0, %xmm0
	movzbl	(%r14,%rbx), %r13d
	vunpcklps	%xmm4, %xmm1, %xmm1
	vunpcklps	%xmm9, %xmm2, %xmm2
	vmovlhps	%xmm2, %xmm0, %xmm0
	vmovlhps	%xmm3, %xmm1, %xmm1
	vinsertf128	$0x1, %xmm0, %ymm1, %ymm1
	vcvtsi2ssl	%r13d, %xmm8, %xmm0
	movzbl	(%r14,%r11), %r13d
	movzbl	(%r12,%rbx), %ebx
	vcvtsi2ssl	%r13d, %xmm8, %xmm5
	movzbl	(%r14,%r10), %r13d
	movzbl	(%r12,%r11), %r11d
	vcvtsi2ssl	%r13d, %xmm8, %xmm3
	movzbl	(%r14,%r9), %r13d
	vunpcklps	%xmm5, %xmm0, %xmm0
	vcvtsi2ssl	%r13d, %xmm8, %xmm6
	movzbl	(%r14,%r8), %r13d
	vmovaps	%xmm3, %xmm4
	vcvtsi2ssl	%r13d, %xmm8, %xmm2
	movzbl	(%r14,%rdi), %r13d
	vunpcklps	%xmm6, %xmm4, %xmm4
	vcvtsi2ssl	%r13d, %xmm8, %xmm9
	movzbl	(%r14,%rsi), %r13d
	vmovlhps	%xmm4, %xmm0, %xmm0
	vcvtsi2ssl	%r13d, %xmm8, %xmm3
	movzbl	(%r14,%rax), %r13d
	vunpcklps	%xmm9, %xmm2, %xmm2
	vcvtsi2ssl	%r13d, %xmm8, %xmm10
	vcvtsi2ssl	%r11d, %xmm8, %xmm9
	vunpcklps	%xmm10, %xmm3, %xmm3
	vmovlhps	%xmm3, %xmm2, %xmm2
	vinsertf128	$0x1, %xmm2, %ymm0, %ymm0
	vmulps	%ymm15, %ymm0, %ymm3
	vmulps	%ymm14, %ymm0, %ymm4
	vmulps	.LC328(%rip), %ymm0, %ymm0
	vfmsub231ps	%ymm7, %ymm1, %ymm3
	vfmsub231ps	%ymm13, %ymm1, %ymm4
	vfmadd132ps	.LC329(%rip), %ymm0, %ymm1
	movzbl	(%r12,%r10), %r10d
	movzbl	(%r12,%rax), %eax
	movzbl	(%r12,%r9), %r9d
	movzbl	(%r12,%r8), %r8d
	movzbl	(%r12,%rdi), %edi
	movzbl	(%r12,%rsi), %esi
	vcvtsi2ssl	%eax, %xmm8, %xmm12
	vcvtsi2ssl	%ebx, %xmm8, %xmm0
	vcvtsi2ssl	%r10d, %xmm8, %xmm5
	vcvtsi2ssl	%r9d, %xmm8, %xmm10
	vcvtsi2ssl	%r8d, %xmm8, %xmm2
	vcvtsi2ssl	%edi, %xmm8, %xmm11
	vcvtsi2ssl	%esi, %xmm8, %xmm6
	vunpcklps	%xmm10, %xmm5, %xmm5
	vunpcklps	%xmm9, %xmm0, %xmm0
	vunpcklps	%xmm11, %xmm2, %xmm2
	vunpcklps	%xmm12, %xmm6, %xmm6
	vmovlhps	%xmm6, %xmm2, %xmm2
	vmovlhps	%xmm5, %xmm0, %xmm0
	vinsertf128	$0x1, %xmm2, %ymm0, %ymm0
	vfnmadd231ps	.LC330(%rip), %ymm0, %ymm3
	vfmadd231ps	%ymm7, %ymm0, %ymm4
	vfmadd132ps	.LC331(%rip), %ymm1, %ymm0
	movq	-4368(%rbp), %rax
	vaddps	.LC332(%rip), %ymm0, %ymm0
	vmovaps	%ymm0, -32(%rax,%rcx,4)
	movq	-4384(%rbp), %rax
	vmovaps	%ymm4, -32(%rax,%rcx,4)
	movq	-4376(%rbp), %rax
	vmovaps	%ymm3, -32(%rax,%rcx,4)
	movslq	%ecx, %rax
	addq	$8, %rcx
	cmpl	-4500(%rbp), %edx
	jl	.L4888
	cmpl	-4504(%rbp), %edx
	jle	.L4889
	jmp	.L4887
.L4928:
	movl	$100, %eax
	subl	%ecx, %eax
	addl	%eax, %eax
	jmp	.L4846
.L4929:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE846:
	.size	stbi_write_jpg_core.part.0, .-stbi_write_jpg_core.part.0
	.section	.rodata.str1.1
.LC333:
	.string	"max value > 65535"
	.section	.text.unlikely
.LCOLDB334:
	.text
.LHOTB334:
	.p2align 4
	.type	stbi__pnm_info, @function
stbi__pnm_info:
.LFB773:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdi, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rsi, %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rcx, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdx, %rbx
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	leaq	36(%rsp), %rax
	testq	%rsi, %rsi
	vmovdqu	208(%rdi), %xmm0
	cmove	%rax, %r13
	testq	%rdx, %rdx
	cmove	%rax, %rbx
	testq	%rcx, %rcx
	cmove	%rax, %rbp
	vmovq	%xmm0, %rdx
	vpextrq	$1, %xmm0, %rax
	vmovdqu	%xmm0, 192(%rdi)
	cmpq	%rdx, %rax
	ja	.L5039
	movl	48(%rdi), %r11d
	testl	%r11d, %r11d
	jne	.L5040
.L4937:
	vmovdqu	%xmm0, 192(%r14)
	xorl	%eax, %eax
.L4931:
	movq	40(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L5041
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
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
	ret
	.p2align 4,,10
	.p2align 3
.L5039:
	.cfi_restore_state
	leaq	1(%rdx), %rcx
	movq	%rcx, 192(%rdi)
	movzbl	(%rdx), %r15d
.L4936:
	cmpq	%rcx, %rax
	jbe	.L5042
	leaq	1(%rcx), %rdx
	movq	%rdx, 192(%r14)
	movzbl	(%rcx), %ecx
.L4942:
	cmpb	$80, %r15b
	jne	.L5038
	leal	-53(%rcx), %esi
	cmpb	$1, %sil
	ja	.L5038
	cmpb	$54, %cl
	sete	%cl
	movzbl	%cl, %ecx
	leal	1(%rcx,%rcx), %ecx
	movl	%ecx, 0(%rbp)
	cmpq	%rax, %rdx
	jb	.L5043
	movl	48(%r14), %r9d
	xorl	%ebp, %ebp
	testl	%r9d, %r9d
	jne	.L5044
.L4948:
	movb	%bpl, 35(%rsp)
	leaq	35(%rsp), %rbp
	movq	%rbp, %rsi
	movq	%r14, %rdi
	call	stbi__pnm_skip_whitespace
	leaq	56(%r14), %rax
	movq	%rax, 8(%rsp)
	leaq	57(%r14), %rax
	movq	%rax, 16(%rsp)
	movq	16(%r14), %r12
	xorl	%r15d, %r15d
.L4951:
	testq	%r12, %r12
	je	.L4965
	movq	40(%r14), %rdi
	call	*32(%r14)
	testl	%eax, %eax
	je	.L4964
	movl	48(%r14), %edi
	testl	%edi, %edi
	je	.L4958
.L4965:
	movq	192(%r14), %rdx
	cmpq	200(%r14), %rdx
	jnb	.L4958
	movzbl	35(%rsp), %eax
	subl	$48, %eax
	cmpb	$9, %al
	jbe	.L5045
.L4958:
	movl	%r15d, 0(%r13)
	movq	%rbp, %rsi
	movq	%r14, %rdi
	call	stbi__pnm_skip_whitespace
	leaq	57(%r14), %rax
	movq	%rax, 8(%rsp)
	movq	16(%r14), %r12
	xorl	%r15d, %r15d
	leaq	56(%r14), %r13
.L4966:
	testq	%r12, %r12
	je	.L4981
	movq	40(%r14), %rdi
	call	*32(%r14)
	testl	%eax, %eax
	je	.L4980
	movl	48(%r14), %ecx
	testl	%ecx, %ecx
	je	.L4974
.L4981:
	movq	192(%r14), %rdx
	cmpq	200(%r14), %rdx
	jnb	.L4974
	movzbl	35(%rsp), %eax
	subl	$48, %eax
	cmpb	$9, %al
	jbe	.L5046
.L4974:
	movl	%r15d, (%rbx)
	movq	%rbp, %rsi
	movq	%r14, %rdi
	call	stbi__pnm_skip_whitespace
	movq	16(%r14), %r12
	xorl	%ebx, %ebx
	leaq	56(%r14), %r15
	leaq	57(%r14), %rbp
.L4982:
	testq	%r12, %r12
	je	.L4993
	movq	40(%r14), %rdi
	call	*32(%r14)
	testl	%eax, %eax
	je	.L4992
	movl	48(%r14), %eax
	testl	%eax, %eax
	je	.L4988
.L4993:
	movq	192(%r14), %rdx
	cmpq	200(%r14), %rdx
	jnb	.L4988
	movzbl	35(%rsp), %eax
	subl	$48, %eax
	cmpb	$9, %al
	jbe	.L5047
.L4988:
	cmpl	$65535, %ebx
	jg	.L5048
	xorl	%eax, %eax
	cmpl	$255, %ebx
	setg	%al
	leal	8(,%rax,8), %eax
	jmp	.L4931
	.p2align 4,,10
	.p2align 3
.L5038:
	vmovdqu	208(%r14), %xmm0
	jmp	.L4937
	.p2align 4,,10
	.p2align 3
.L5047:
	movsbl	%al, %eax
	leal	(%rbx,%rbx,4), %esi
	leal	(%rax,%rsi,2), %ebx
	leaq	1(%rdx), %rax
	movq	%rax, 192(%r14)
	movzbl	(%rdx), %eax
	movb	%al, 35(%rsp)
	testq	%r12, %r12
	je	.L5030
	movq	16(%r14), %r12
	jmp	.L4982
	.p2align 4,,10
	.p2align 3
.L5045:
	movsbl	%al, %eax
	leal	(%r15,%r15,4), %esi
	leal	(%rax,%rsi,2), %r15d
	leaq	1(%rdx), %rax
	movq	%rax, 192(%r14)
	movzbl	(%rdx), %eax
	movb	%al, 35(%rsp)
	testq	%r12, %r12
	je	.L5032
	movq	16(%r14), %r12
	jmp	.L4951
	.p2align 4,,10
	.p2align 3
.L5046:
	movsbl	%al, %eax
	leal	(%r15,%r15,4), %esi
	leal	(%rax,%rsi,2), %r15d
	leaq	1(%rdx), %rax
	movq	%rax, 192(%r14)
	movzbl	(%rdx), %eax
	movb	%al, 35(%rsp)
	testq	%r12, %r12
	je	.L5031
	movq	16(%r14), %r12
	jmp	.L4966
	.p2align 4,,10
	.p2align 3
.L4964:
	movsbl	35(%rsp), %edx
	movl	%edx, %eax
	subl	$48, %eax
	cmpb	$9, %al
	ja	.L4958
	leal	(%r15,%r15,4), %eax
	leal	-48(%rdx,%rax,2), %r15d
	movq	192(%r14), %rax
	movq	16(%r14), %r12
	cmpq	200(%r14), %rax
	jb	.L4952
	movl	48(%r14), %r8d
	xorl	%r11d, %r11d
	testl	%r8d, %r8d
	jne	.L5049
.L4953:
	movb	%r11b, 35(%rsp)
	jmp	.L4951
	.p2align 4,,10
	.p2align 3
.L4980:
	movsbl	35(%rsp), %edx
	movl	%edx, %eax
	subl	$48, %eax
	cmpb	$9, %al
	ja	.L4974
	leal	(%r15,%r15,4), %eax
	leal	-48(%rdx,%rax,2), %r15d
	movq	192(%r14), %rax
	movq	16(%r14), %r12
	cmpq	200(%r14), %rax
	jb	.L4968
	movl	48(%r14), %esi
	xorl	%r9d, %r9d
	testl	%esi, %esi
	jne	.L5050
.L4969:
	movb	%r9b, 35(%rsp)
	jmp	.L4966
	.p2align 4,,10
	.p2align 3
.L4992:
	movsbl	35(%rsp), %edx
	movl	%edx, %eax
	subl	$48, %eax
	cmpb	$9, %al
	ja	.L4988
	leal	(%rbx,%rbx,4), %eax
	leal	-48(%rdx,%rax,2), %ebx
	movq	192(%r14), %rax
	movq	16(%r14), %r12
	cmpq	200(%r14), %rax
	jb	.L4984
	movl	48(%r14), %edx
	xorl	%r13d, %r13d
	testl	%edx, %edx
	jne	.L5051
.L4985:
	movb	%r13b, 35(%rsp)
	jmp	.L4982
	.p2align 4,,10
	.p2align 3
.L5049:
	movl	52(%r14), %edx
	movq	40(%r14), %rdi
	movq	8(%rsp), %rsi
	movb	%r11b, 29(%rsp)
	call	*%r12
	movq	192(%r14), %rdx
	subq	208(%r14), %rdx
	addl	%edx, 184(%r14)
	testl	%eax, %eax
	jne	.L4954
	movl	$0, 48(%r14)
	movb	$0, 56(%r14)
	movq	16(%rsp), %rax
	movzbl	29(%rsp), %r11d
.L4955:
	vmovq	16(%rsp), %xmm1
	movq	16(%r14), %r12
	vpinsrq	$1, %rax, %xmm1, %xmm0
	vmovdqu	%xmm0, 192(%r14)
	jmp	.L4953
	.p2align 4,,10
	.p2align 3
.L5051:
	movl	52(%r14), %edx
	movq	40(%r14), %rdi
	movq	%r15, %rsi
	call	*%r12
	movq	192(%r14), %rdx
	subq	208(%r14), %rdx
	addl	%edx, 184(%r14)
	testl	%eax, %eax
	jne	.L4986
	movl	$0, 48(%r14)
	movb	$0, 56(%r14)
	movq	%rbp, %rax
.L4987:
	vmovq	%rbp, %xmm3
	vpinsrq	$1, %rax, %xmm3, %xmm0
	movq	16(%r14), %r12
	vmovdqu	%xmm0, 192(%r14)
	jmp	.L4985
	.p2align 4,,10
	.p2align 3
.L5050:
	movl	52(%r14), %edx
	movq	40(%r14), %rdi
	movq	%r13, %rsi
	movb	%r9b, 16(%rsp)
	call	*%r12
	movq	192(%r14), %rdx
	subq	208(%r14), %rdx
	addl	%edx, 184(%r14)
	testl	%eax, %eax
	jne	.L4970
	movl	$0, 48(%r14)
	movb	$0, 56(%r14)
	movq	8(%rsp), %rax
	movzbl	16(%rsp), %r9d
.L4971:
	vmovq	8(%rsp), %xmm2
	movq	16(%r14), %r12
	vpinsrq	$1, %rax, %xmm2, %xmm0
	vmovdqu	%xmm0, 192(%r14)
	jmp	.L4969
	.p2align 4,,10
	.p2align 3
.L5042:
	movl	48(%r14), %r10d
	testl	%r10d, %r10d
	je	.L5038
	movl	52(%r14), %edx
	movq	40(%r14), %rdi
	leaq	56(%r14), %r12
	movq	%r12, %rsi
	call	*16(%r14)
	movq	192(%r14), %rdx
	subq	208(%r14), %rdx
	addl	%edx, 184(%r14)
	leaq	57(%r14), %rdx
	testl	%eax, %eax
	jne	.L4944
	movl	$0, 48(%r14)
	movb	$0, 56(%r14)
	movq	%rdx, %rax
	xorl	%ecx, %ecx
.L4945:
	vmovq	%rdx, %xmm5
	vpinsrq	$1, %rax, %xmm5, %xmm0
	vmovdqu	%xmm0, 192(%r14)
	jmp	.L4942
	.p2align 4,,10
	.p2align 3
.L5040:
	movl	52(%rdi), %edx
	leaq	56(%rdi), %r12
	movq	40(%rdi), %rdi
	movq	%r12, %rsi
	call	*16(%r14)
	movq	192(%r14), %rdx
	leaq	57(%r14), %rcx
	subq	208(%r14), %rdx
	addl	%edx, 184(%r14)
	testl	%eax, %eax
	jne	.L4938
	movl	$0, 48(%r14)
	movb	$0, 56(%r14)
	movq	%rcx, %rax
	xorl	%r15d, %r15d
.L4939:
	vmovq	%rcx, %xmm4
	vpinsrq	$1, %rax, %xmm4, %xmm0
	vmovdqu	%xmm0, 192(%r14)
	jmp	.L4936
	.p2align 4,,10
	.p2align 3
.L5043:
	leaq	1(%rdx), %rax
	movq	%rax, 192(%r14)
	movzbl	(%rdx), %ebp
	jmp	.L4948
	.p2align 4,,10
	.p2align 3
.L5048:
	leaq	.LC333(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L4931
	.p2align 4,,10
	.p2align 3
.L4970:
	cltq
	movzbl	56(%r14), %r9d
	addq	%r13, %rax
	jmp	.L4971
	.p2align 4,,10
	.p2align 3
.L4954:
	cltq
	movzbl	56(%r14), %r11d
	addq	8(%rsp), %rax
	jmp	.L4955
	.p2align 4,,10
	.p2align 3
.L4986:
	cltq
	movzbl	56(%r14), %r13d
	addq	%r15, %rax
	jmp	.L4987
	.p2align 4,,10
	.p2align 3
.L4938:
	cltq
	movzbl	56(%r14), %r15d
	addq	%r12, %rax
	jmp	.L4939
	.p2align 4,,10
	.p2align 3
.L4944:
	cltq
	movzbl	56(%r14), %ecx
	addq	%r12, %rax
	jmp	.L4945
	.p2align 4,,10
	.p2align 3
.L5044:
	movl	52(%r14), %edx
	movq	40(%r14), %rdi
	leaq	56(%r14), %r12
	movq	%r12, %rsi
	call	*16(%r14)
	movq	192(%r14), %rdx
	subq	208(%r14), %rdx
	addl	%edx, 184(%r14)
	leaq	57(%r14), %rdx
	testl	%eax, %eax
	jne	.L4949
	movl	$0, 48(%r14)
	movb	$0, 56(%r14)
	movq	%rdx, %r12
.L4950:
	vmovq	%rdx, %xmm6
	vpinsrq	$1, %r12, %xmm6, %xmm0
	vmovdqu	%xmm0, 192(%r14)
	jmp	.L4948
	.p2align 4,,10
	.p2align 3
.L4949:
	cltq
	movzbl	56(%r14), %ebp
	addq	%rax, %r12
	jmp	.L4950
.L5041:
	call	__stack_chk_fail@PLT
.L4984:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%r14)
	movzbl	(%rax), %eax
	movb	%al, 35(%rsp)
	jmp	.L4982
.L4968:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%r14)
	movzbl	(%rax), %eax
	movb	%al, 35(%rsp)
	jmp	.L4966
.L4952:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%r14)
	movzbl	(%rax), %eax
	movb	%al, 35(%rsp)
	jmp	.L4951
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.type	stbi__pnm_info.cold, @function
stbi__pnm_info.cold:
.LFSB773:
.L5031:
	.cfi_def_cfa_offset 112
	.cfi_offset 3, -56
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
	.cfi_offset 15, -16
	movq	200(%r14), %rsi
	xorl	%edx, %edx
.L4977:
	movq	192(%r14), %rcx
	cmpq	%rsi, %rcx
	jnb	.L5052
	subl	$48, %eax
	cmpb	$9, %al
	jbe	.L4975
	testb	%dl, %dl
	je	.L4974
	movzbl	30(%rsp), %eax
	movb	%al, 35(%rsp)
	jmp	.L4974
.L5032:
	movq	200(%r14), %rsi
	xorl	%edx, %edx
.L4961:
	movq	192(%r14), %rcx
	cmpq	%rcx, %rsi
	jbe	.L5053
	subl	$48, %eax
	cmpb	$9, %al
	jbe	.L4959
	testb	%dl, %dl
	je	.L4958
	movzbl	31(%rsp), %eax
	movb	%al, 35(%rsp)
	jmp	.L4958
.L5030:
	movq	200(%r14), %rcx
.L4989:
	movq	192(%r14), %rdx
	cmpq	%rcx, %rdx
	jnb	.L4988
	subl	$48, %eax
	cmpb	$9, %al
	ja	.L4988
	movsbl	%al, %eax
	leal	(%rbx,%rbx,4), %esi
	leal	(%rax,%rsi,2), %ebx
	leaq	1(%rdx), %rax
	movq	%rax, 192(%r14)
	movzbl	(%rdx), %eax
	jmp	.L4989
.L5053:
	testb	%dl, %dl
	je	.L4958
	movzbl	31(%rsp), %eax
	movb	%al, 35(%rsp)
	jmp	.L4958
.L5052:
	testb	%dl, %dl
	je	.L4974
	movzbl	30(%rsp), %eax
	movb	%al, 35(%rsp)
	jmp	.L4974
.L4975:
	leal	(%r15,%r15,4), %edx
	movsbl	%al, %eax
	leal	(%rax,%rdx,2), %r15d
	leaq	1(%rcx), %rax
	movq	%rax, 192(%r14)
	movl	$1, %edx
	movzbl	(%rcx), %eax
	movb	%al, 30(%rsp)
	jmp	.L4977
.L4959:
	leal	(%r15,%r15,4), %edx
	movsbl	%al, %eax
	leal	(%rax,%rdx,2), %r15d
	leaq	1(%rcx), %rax
	movq	%rax, 192(%r14)
	movl	$1, %edx
	movzbl	(%rcx), %eax
	movb	%al, 31(%rsp)
	jmp	.L4961
	.cfi_endproc
.LFE773:
	.text
	.size	stbi__pnm_info, .-stbi__pnm_info
	.section	.text.unlikely
	.size	stbi__pnm_info.cold, .-stbi__pnm_info.cold
.LCOLDE334:
	.text
.LHOTE334:
	.p2align 4
	.type	stbi__is_16_main, @function
stbi__is_16_main:
.LFB776:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	xorl	%edx, %edx
	movl	$2, %esi
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$56, %rsp
	.cfi_def_cfa_offset 96
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	movq	%rdi, (%rsp)
	movq	%rsp, %rdi
	call	stbi__parse_png_file
	testl	%eax, %eax
	je	.L5088
	cmpl	$16, 32(%rsp)
	movl	$1, %r12d
	je	.L5054
	movq	(%rsp), %rax
	vmovdqu	208(%rax), %xmm1
	vmovdqu	%xmm1, 192(%rax)
.L5056:
	movq	192(%rbp), %rdx
	movq	200(%rbp), %rax
	cmpq	%rax, %rdx
	jb	.L5089
	movl	48(%rbp), %esi
	testl	%esi, %esi
	jne	.L5090
.L5087:
	movq	208(%rbp), %rax
	xorl	%ecx, %ecx
	movq	%rax, 192(%rbp)
	movq	216(%rbp), %rax
	xorl	%edx, %edx
	movq	%rax, 200(%rbp)
	xorl	%esi, %esi
	movq	%rbp, %rdi
	call	stbi__pnm_info
	xorl	%r12d, %r12d
	cmpl	$16, %eax
	sete	%r12b
.L5054:
	movq	40(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L5091
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	movl	%r12d, %eax
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L5088:
	.cfi_restore_state
	movq	(%rsp), %rax
	vmovdqu	208(%rax), %xmm2
	vmovdqu	%xmm2, 192(%rax)
	jmp	.L5056
	.p2align 4,,10
	.p2align 3
.L5089:
	leaq	1(%rdx), %rsi
	movq	%rsi, 192(%rbp)
	movzbl	(%rdx), %ebx
	sall	$8, %ebx
	movl	%ebx, %r13d
.L5060:
	cmpq	%rax, %rsi
	jnb	.L5064
	leaq	1(%rsi), %rcx
	movq	%rcx, 192(%rbp)
	movzbl	(%rsi), %edx
	addl	%edx, %r13d
.L5065:
	sall	$16, %r13d
	cmpq	%rax, %rcx
	jnb	.L5068
	leaq	1(%rcx), %rdx
	movq	%rdx, 192(%rbp)
	movzbl	(%rcx), %ebx
	sall	$8, %ebx
.L5069:
	cmpq	%rax, %rdx
	jnb	.L5073
	leaq	1(%rdx), %rax
	movq	%rax, 192(%rbp)
	movzbl	(%rdx), %eax
	addl	%eax, %ebx
.L5074:
	addl	%r13d, %ebx
	cmpl	$943870035, %ebx
	jne	.L5087
	movq	%rbp, %rdi
	call	stbi__get16be
	movl	%eax, %r12d
	cmpl	$1, %eax
	jne	.L5087
	movq	%rbp, %rdi
	movl	$6, %esi
	call	stbi__skip.part.0
	movq	%rbp, %rdi
	call	stbi__get16be
	cmpl	$16, %eax
	ja	.L5087
	movq	%rbp, %rdi
	call	stbi__get16be
	cmpl	$16, %eax
	je	.L5054
	jmp	.L5087
	.p2align 4,,10
	.p2align 3
.L5090:
	movl	52(%rbp), %edx
	movq	40(%rbp), %rdi
	leaq	56(%rbp), %r12
	movq	%r12, %rsi
	call	*16(%rbp)
	movl	%eax, %r13d
	movq	192(%rbp), %rax
	leaq	57(%rbp), %rsi
	subq	208(%rbp), %rax
	addl	%eax, 184(%rbp)
	testl	%r13d, %r13d
	je	.L5092
	movslq	%r13d, %rbx
	leaq	(%r12,%rbx), %rax
	movzbl	56(%rbp), %ebx
	sall	$8, %ebx
	movl	%ebx, %r13d
.L5063:
	vmovq	%rsi, %xmm3
	vpinsrq	$1, %rax, %xmm3, %xmm0
	vmovdqu	%xmm0, 192(%rbp)
	jmp	.L5060
	.p2align 4,,10
	.p2align 3
.L5073:
	movl	48(%rbp), %eax
	testl	%eax, %eax
	je	.L5074
	movl	52(%rbp), %edx
	movq	40(%rbp), %rdi
	leaq	56(%rbp), %r12
	movq	%r12, %rsi
	call	*16(%rbp)
	movq	192(%rbp), %rdx
	subq	208(%rbp), %rdx
	addl	%edx, 184(%rbp)
	leaq	57(%rbp), %rdx
	testl	%eax, %eax
	je	.L5093
	cltq
	addq	%rax, %r12
	movzbl	56(%rbp), %eax
	addl	%eax, %ebx
.L5076:
	vmovq	%rdx, %xmm6
	vpinsrq	$1, %r12, %xmm6, %xmm0
	vmovdqu	%xmm0, 192(%rbp)
	jmp	.L5074
	.p2align 4,,10
	.p2align 3
.L5068:
	movl	48(%rbp), %edx
	testl	%edx, %edx
	je	.L5087
	movl	52(%rbp), %edx
	movq	40(%rbp), %rdi
	leaq	56(%rbp), %r12
	movq	%r12, %rsi
	call	*16(%rbp)
	movslq	%eax, %rbx
	movq	192(%rbp), %rax
	leaq	57(%rbp), %rdx
	subq	208(%rbp), %rax
	addl	%eax, 184(%rbp)
	testl	%ebx, %ebx
	je	.L5094
	leaq	(%r12,%rbx), %rax
	movzbl	56(%rbp), %ebx
	sall	$8, %ebx
.L5072:
	vmovq	%rdx, %xmm5
	vpinsrq	$1, %rax, %xmm5, %xmm0
	vmovdqu	%xmm0, 192(%rbp)
	jmp	.L5069
	.p2align 4,,10
	.p2align 3
.L5064:
	movl	48(%rbp), %ecx
	testl	%ecx, %ecx
	je	.L5087
	movl	52(%rbp), %edx
	movq	40(%rbp), %rdi
	leaq	56(%rbp), %r12
	movq	%r12, %rsi
	call	*16(%rbp)
	movq	192(%rbp), %rdx
	leaq	57(%rbp), %rcx
	subq	208(%rbp), %rdx
	addl	%edx, 184(%rbp)
	testl	%eax, %eax
	je	.L5095
	movzbl	56(%rbp), %edx
	cltq
	addq	%r12, %rax
	addl	%edx, %r13d
.L5067:
	vmovq	%rcx, %xmm4
	vpinsrq	$1, %rax, %xmm4, %xmm0
	vmovdqu	%xmm0, 192(%rbp)
	jmp	.L5065
	.p2align 4,,10
	.p2align 3
.L5095:
	movl	$0, 48(%rbp)
	movb	$0, 56(%rbp)
	movq	%rcx, %rax
	jmp	.L5067
	.p2align 4,,10
	.p2align 3
.L5094:
	movl	$0, 48(%rbp)
	movb	$0, 56(%rbp)
	movq	%rdx, %rax
	jmp	.L5072
	.p2align 4,,10
	.p2align 3
.L5093:
	movl	$0, 48(%rbp)
	movb	$0, 56(%rbp)
	movq	%rdx, %r12
	jmp	.L5076
	.p2align 4,,10
	.p2align 3
.L5092:
	movl	$0, 48(%rbp)
	movb	$0, 56(%rbp)
	movq	%rsi, %rax
	jmp	.L5063
.L5091:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE776:
	.size	stbi__is_16_main, .-stbi__is_16_main
	.p2align 4
	.type	stbi__gif_test_raw, @function
stbi__gif_test_raw:
.LFB745:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movq	192(%rdi), %rdx
	movq	200(%rdi), %rax
	cmpq	%rax, %rdx
	jb	.L5110
	movl	48(%rdi), %ecx
	testl	%ecx, %ecx
	jne	.L5099
.L5102:
	xorl	%eax, %eax
.L5096:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L5110:
	.cfi_restore_state
	leaq	1(%rdx), %rcx
	movq	%rcx, 192(%rdi)
	movzbl	(%rdx), %edx
.L5098:
	cmpb	$71, %dl
	jne	.L5102
	cmpq	%rax, %rcx
	jb	.L5111
	movl	48(%rbp), %edx
	testl	%edx, %edx
	je	.L5102
	movl	52(%rbp), %edx
	movq	40(%rbp), %rdi
	leaq	56(%rbp), %rbx
	movq	%rbx, %rsi
	call	*16(%rbp)
	movq	192(%rbp), %rdx
	subq	208(%rbp), %rdx
	addl	%edx, 184(%rbp)
	leaq	57(%rbp), %rdx
	testl	%eax, %eax
	jne	.L5105
	vmovq	%rdx, %xmm3
	vpunpcklqdq	%xmm3, %xmm3, %xmm0
	movl	$0, 48(%rbp)
	movb	$0, 56(%rbp)
	vmovdqu	%xmm0, 192(%rbp)
	jmp	.L5102
	.p2align 4,,10
	.p2align 3
.L5099:
	movl	52(%rdi), %edx
	leaq	56(%rdi), %rbx
	movq	40(%rdi), %rdi
	movq	%rbx, %rsi
	call	*16(%rbp)
	movq	192(%rbp), %rdx
	leaq	57(%rbp), %rcx
	subq	208(%rbp), %rdx
	addl	%edx, 184(%rbp)
	testl	%eax, %eax
	jne	.L5101
	vmovq	%rcx, %xmm1
	vpunpcklqdq	%xmm1, %xmm1, %xmm0
	movl	$0, 48(%rbp)
	movb	$0, 56(%rbp)
	vmovdqu	%xmm0, 192(%rbp)
	jmp	.L5102
	.p2align 4,,10
	.p2align 3
.L5111:
	leaq	1(%rcx), %rdx
	movq	%rdx, 192(%rbp)
	movzbl	(%rcx), %ecx
.L5104:
	cmpb	$73, %cl
	jne	.L5102
	cmpq	%rax, %rdx
	jb	.L5112
	movl	48(%rbp), %eax
	testl	%eax, %eax
	je	.L5102
	movl	52(%rbp), %edx
	movq	40(%rbp), %rdi
	leaq	56(%rbp), %rbx
	movq	%rbx, %rsi
	call	*16(%rbp)
	movq	192(%rbp), %rdx
	leaq	57(%rbp), %rcx
	subq	208(%rbp), %rdx
	addl	%edx, 184(%rbp)
	testl	%eax, %eax
	jne	.L5108
	vmovq	%rcx, %xmm5
	vpunpcklqdq	%xmm5, %xmm5, %xmm0
	movl	$0, 48(%rbp)
	movb	$0, 56(%rbp)
	vmovdqu	%xmm0, 192(%rbp)
	jmp	.L5102
	.p2align 4,,10
	.p2align 3
.L5101:
	cltq
	addq	%rbx, %rax
	vmovq	%rcx, %xmm2
	vpinsrq	$1, %rax, %xmm2, %xmm0
	movzbl	56(%rbp), %edx
	vmovdqu	%xmm0, 192(%rbp)
	jmp	.L5098
	.p2align 4,,10
	.p2align 3
.L5112:
	leaq	1(%rdx), %rax
	movq	%rax, 192(%rbp)
	movzbl	(%rdx), %edx
.L5107:
	cmpb	$70, %dl
	jne	.L5102
	movq	%rbp, %rdi
	call	stbi__get8
	cmpb	$56, %al
	jne	.L5102
	movq	%rbp, %rdi
	call	stbi__get8
	subl	$55, %eax
	testb	$-3, %al
	jne	.L5102
	movq	%rbp, %rdi
	call	stbi__get8
	cmpb	$97, %al
	sete	%al
	movzbl	%al, %eax
	jmp	.L5096
	.p2align 4,,10
	.p2align 3
.L5105:
	cltq
	addq	%rbx, %rax
	vmovq	%rdx, %xmm4
	vpinsrq	$1, %rax, %xmm4, %xmm0
	movzbl	56(%rbp), %ecx
	vmovdqu	%xmm0, 192(%rbp)
	jmp	.L5104
.L5108:
	cltq
	addq	%rax, %rbx
	vmovq	%rcx, %xmm6
	vpinsrq	$1, %rbx, %xmm6, %xmm0
	movzbl	56(%rbp), %edx
	vmovdqu	%xmm0, 192(%rbp)
	jmp	.L5107
	.cfi_endproc
.LFE745:
	.size	stbi__gif_test_raw, .-stbi__gif_test_raw
	.section	.rodata.str1.1
.LC335:
	.string	"not BMP"
.LC336:
	.string	"bad offset"
.LC337:
	.string	"invalid"
.LC338:
	.string	"bad bpp"
.LC339:
	.string	"bad masks"
.LC340:
	.string	"v < 256"
	.text
	.p2align 4
	.type	stbi__bmp_load.constprop.0, @function
stbi__bmp_load.constprop.0:
.LFB894:
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
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	subq	$1256, %rsp
	.cfi_def_cfa_offset 1312
	movq	%rsi, 120(%rsp)
	movq	%rdx, 128(%rsp)
	movq	%rcx, 136(%rsp)
	movl	%r8d, 104(%rsp)
	movq	%fs:40, %rax
	movq	%rax, 1240(%rsp)
	xorl	%eax, %eax
	movq	192(%rdi), %rax
	movl	$255, 188(%rsp)
	cmpq	200(%rdi), %rax
	jb	.L5415
	movl	48(%rdi), %ebp
	testl	%ebp, %ebp
	jne	.L5116
.L5119:
	leaq	.LC335(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%ebp, %ebp
.L5113:
	movq	1240(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L5416
	addq	$1256, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	movq	%rbp, %rax
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
.L5415:
	.cfi_restore_state
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rdi)
	movzbl	(%rax), %edx
.L5115:
	cmpb	$66, %dl
	jne	.L5119
	movq	%rbx, %rdi
	call	stbi__get8
	cmpb	$77, %al
	jne	.L5119
	leaq	160(%rsp), %rsi
	movq	%rbx, %rdi
	call	stbi__bmp_parse_header.part.0
	testq	%rax, %rax
	je	.L5414
	movl	4(%rbx), %eax
	movl	%eax, %ecx
	negl	%ecx
	cmovs	%eax, %ecx
	movl	%eax, 144(%rsp)
	movl	%ecx, 4(%rbx)
	cmpl	$16777216, %ecx
	jg	.L5122
	movl	(%rbx), %esi
	cmpl	$16777216, %esi
	ja	.L5122
	movl	172(%rsp), %eax
	movl	168(%rsp), %r15d
	movl	%eax, 68(%rsp)
	movl	176(%rsp), %eax
	movl	164(%rsp), %r14d
	movl	%eax, 64(%rsp)
	movl	180(%rsp), %eax
	movl	%eax, 72(%rsp)
	movl	184(%rsp), %eax
	movl	%eax, 8(%rsp)
	movl	188(%rsp), %eax
	movl	%eax, 24(%rsp)
	movl	160(%rsp), %eax
	movl	%eax, 16(%rsp)
	cmpl	$12, %r15d
	je	.L5417
	cmpl	$15, 16(%rsp)
	jg	.L5124
	movl	%r14d, %eax
	subl	192(%rsp), %eax
	subl	%r15d, %eax
	sarl	$2, %eax
	movl	%eax, 32(%rsp)
	movl	32(%rsp), %edx
	testl	%edx, %edx
	jne	.L5418
.L5124:
	movq	192(%rbx), %rax
	movslq	184(%rbx), %rdi
	subq	208(%rbx), %rax
	movslq	%r14d, %rdx
	addq	%rdi, %rax
	cmpq	%rax, %rdx
	jne	.L5419
	cmpl	$-16777216, 8(%rsp)
	sete	%r13b
	cmpl	$24, 16(%rsp)
	sete	%r12b
	movl	%r12d, %eax
	movl	$0, 32(%rsp)
	andb	%r13b, %al
	jne	.L5420
.L5127:
	cmpl	$1, 8(%rsp)
	movl	$3, %eax
	sbbl	$-1, %eax
	cmpl	$2, 104(%rsp)
	movl	%eax, 56(%rsp)
	movl	%eax, 8(%rbx)
	jle	.L5129
.L5128:
	testl	%esi, %esi
	je	.L5421
	movl	$2147483647, %eax
	cltd
	idivl	%esi
	cmpl	%eax, 104(%rsp)
	jle	.L5422
.L5122:
	leaq	.LC203(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%ebp, %ebp
	jmp	.L5113
.L5420:
	cmpl	$2, 104(%rsp)
	movl	$3, 8(%rbx)
	movl	%eax, %r13d
	movl	%eax, %r12d
	jg	.L5128
	movl	$3, 56(%rsp)
	.p2align 4,,10
	.p2align 3
.L5129:
	testl	%esi, %esi
	jne	.L5131
.L5285:
	xorl	%edi, %edi
.L5282:
	imull	%ecx, %edi
	movslq	%edi, %rdi
	call	malloc@PLT
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L5133
	cmpl	$15, 16(%rsp)
	jg	.L5134
	movl	32(%rsp), %eax
	testl	%eax, %eax
	je	.L5135
	cmpl	$256, %eax
	jg	.L5135
	testl	%eax, %eax
	jle	.L5155
	decl	%eax
	leaq	56(%rbx), %r12
	leaq	57(%rbx), %rsi
	leaq	212(%rsp,%rax,4), %rax
	movq	%rbp, 48(%rsp)
	movq	%rsi, 8(%rsp)
	movq	%rbx, %rbp
	movl	%r14d, 40(%rsp)
	movq	%r12, %rbx
	leaq	208(%rsp), %r13
	movq	%rax, %r12
	jmp	.L5154
	.p2align 4,,10
	.p2align 3
.L5139:
	movl	48(%rbp), %r11d
	testl	%r11d, %r11d
	jne	.L5423
	movb	$0, 2(%r13)
.L5144:
	movl	48(%rbp), %r10d
	testl	%r10d, %r10d
	jne	.L5424
	movb	$0, 1(%r13)
.L5149:
	movl	48(%rbp), %r9d
	xorl	%r14d, %r14d
	testl	%r9d, %r9d
	jne	.L5425
.L5150:
	movb	%r14b, 0(%r13)
	cmpl	$12, %r15d
	je	.L5153
	movq	%rbp, %rdi
	call	stbi__get8
.L5153:
	addq	$4, %r13
	cmpq	%r13, %r12
	je	.L5426
.L5154:
	movq	192(%rbp), %rdx
	movq	200(%rbp), %rax
	cmpq	%rax, %rdx
	jnb	.L5139
	leaq	1(%rdx), %rsi
	movq	%rsi, 192(%rbp)
	movzbl	(%rdx), %edx
.L5140:
	movb	%dl, 2(%r13)
	cmpq	%rax, %rsi
	jnb	.L5144
	leaq	1(%rsi), %rdx
	movq	%rdx, 192(%rbp)
	movzbl	(%rsi), %esi
.L5145:
	movb	%sil, 1(%r13)
	cmpq	%rax, %rdx
	jnb	.L5149
	leaq	1(%rdx), %rax
	movq	%rax, 192(%rbp)
	movzbl	(%rdx), %r14d
	jmp	.L5150
	.p2align 4,,10
	.p2align 3
.L5417:
	cmpl	$23, %eax
	jg	.L5124
	movl	%r14d, %eax
	subl	192(%rsp), %eax
	subl	$24, %eax
	movslq	%eax, %rdx
	imulq	$1431655766, %rdx, %rdx
	sarl	$31, %eax
	shrq	$32, %rdx
	subl	%eax, %edx
	movl	%edx, 32(%rsp)
	movl	32(%rsp), %edx
	testl	%edx, %edx
	je	.L5124
.L5418:
	cmpl	$-16777216, 8(%rsp)
	sete	%r13b
	cmpl	$24, 16(%rsp)
	sete	%r12b
	jmp	.L5127
.L5422:
	movl	104(%rsp), %eax
	movl	%eax, 56(%rsp)
.L5131:
	movl	56(%rsp), %edi
	movl	144(%rsp), %eax
	imull	%esi, %edi
	testl	%eax, %eax
	je	.L5427
	movl	$2147483647, %r8d
	movl	%r8d, %eax
	cltd
	idivl	%ecx
	movl	%eax, %r9d
	cmpl	%eax, %edi
	jg	.L5122
	movl	%r8d, %eax
	cltd
	idivl	%esi
	cmpl	56(%rsp), %eax
	jl	.L5133
	cmpl	%edi, %r9d
	jge	.L5282
.L5133:
	leaq	.LC23(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%ebp, %ebp
	jmp	.L5113
	.p2align 4,,10
	.p2align 3
.L5134:
	movl	%r14d, %esi
	subl	192(%rsp), %esi
	subl	%r15d, %esi
	je	.L5192
	js	.L5428
	movq	%rbx, %rdi
	call	stbi__skip.part.0
.L5192:
	testb	%r12b, %r12b
	jne	.L5429
	cmpl	$16, 16(%rsp)
	je	.L5430
	cmpl	$32, 16(%rsp)
	jne	.L5302
	cmpl	$255, 72(%rsp)
	jne	.L5302
	cmpl	$65280, 64(%rsp)
	jne	.L5302
	cmpl	$16711680, 68(%rsp)
	jne	.L5302
	testb	%r13b, %r13b
	je	.L5302
	movl	(%rbx), %eax
	movl	$0, 108(%rsp)
	movl	$2, 60(%rsp)
	movl	%eax, %r11d
	jmp	.L5413
.L5302:
	movl	$0, 108(%rsp)
.L5197:
	movl	68(%rsp), %esi
	movl	64(%rsp), %edi
	testl	%esi, %esi
	sete	%al
	testl	%edi, %edi
	sete	%dl
	orb	%dl, %al
	jne	.L5222
	movl	72(%rsp), %ecx
	testl	%ecx, %ecx
	je	.L5222
	movl	68(%rsp), %eax
	cmpl	$65535, %eax
	ja	.L5431
	movl	$8, %edx
	xorl	%r12d, %r12d
.L5202:
	cmpl	$255, %eax
	jbe	.L5203
	shrl	$8, %eax
	movl	%edx, %r12d
.L5203:
	cmpl	$15, %eax
	jbe	.L5204
	addl	$4, %r12d
	shrl	$4, %eax
.L5204:
	cmpl	$3, %eax
	jbe	.L5205
	addl	$2, %r12d
	shrl	$2, %eax
.L5205:
	cmpl	$1, %eax
	setne	%al
	movl	68(%rsp), %esi
	movzbl	%al, %eax
	addl	%eax, %r12d
	movl	%esi, %eax
	shrl	%eax
	andl	$1431655765, %eax
	andl	$1431655765, %esi
	addl	%esi, %eax
	movl	%eax, %edx
	shrl	$2, %eax
	andl	$858993459, %eax
	andl	$858993459, %edx
	addl	%eax, %edx
	movl	%edx, %eax
	shrl	$4, %eax
	addl	%edx, %eax
	andl	$252645135, %eax
	movl	%eax, %edx
	shrl	$8, %edx
	addl	%edx, %eax
	movl	%eax, %edx
	shrl	$16, %edx
	addl	%edx, %eax
	movzbl	%al, %eax
	movl	%eax, 76(%rsp)
	movl	64(%rsp), %eax
	cmpl	$65535, %eax
	jbe	.L5304
	shrl	$16, %eax
	movl	$24, %edx
	movl	$16, %r13d
.L5207:
	cmpl	$255, %eax
	jbe	.L5208
	shrl	$8, %eax
	movl	%edx, %r13d
.L5208:
	cmpl	$15, %eax
	jbe	.L5209
	addl	$4, %r13d
	shrl	$4, %eax
.L5209:
	cmpl	$3, %eax
	jbe	.L5210
	addl	$2, %r13d
	shrl	$2, %eax
.L5210:
	cmpl	$1, %eax
	setne	%al
	movl	64(%rsp), %esi
	movzbl	%al, %eax
	addl	%eax, %r13d
	movl	%esi, %eax
	shrl	%eax
	movl	%esi, %edx
	andl	$1431655765, %edx
	andl	$1431655765, %eax
	addl	%edx, %eax
	movl	%eax, %edx
	shrl	$2, %eax
	andl	$858993459, %eax
	andl	$858993459, %edx
	addl	%eax, %edx
	movl	%edx, %eax
	shrl	$4, %eax
	addl	%edx, %eax
	andl	$252645135, %eax
	movl	%eax, %edx
	shrl	$8, %edx
	addl	%edx, %eax
	movl	%eax, %edx
	shrl	$16, %edx
	addl	%edx, %eax
	movzbl	%al, %eax
	movl	%eax, 84(%rsp)
	movl	72(%rsp), %eax
	cmpl	$65535, %eax
	jbe	.L5305
	shrl	$16, %eax
	movl	$24, %edx
	movl	$16, %ecx
.L5212:
	cmpl	$255, %eax
	jbe	.L5213
	shrl	$8, %eax
	movl	%edx, %ecx
.L5213:
	cmpl	$15, %eax
	jbe	.L5214
	addl	$4, %ecx
	shrl	$4, %eax
.L5214:
	cmpl	$3, %eax
	jbe	.L5215
	addl	$2, %ecx
	shrl	$2, %eax
.L5215:
	cmpl	$1, %eax
	setne	%al
	movl	72(%rsp), %esi
	movzbl	%al, %eax
	addl	%eax, %ecx
	movl	%esi, %eax
	shrl	%eax
	movl	%esi, %edx
	andl	$1431655765, %edx
	andl	$1431655765, %eax
	addl	%edx, %eax
	movl	%eax, %edx
	shrl	$2, %eax
	andl	$858993459, %eax
	andl	$858993459, %edx
	addl	%eax, %edx
	movl	%edx, %eax
	shrl	$4, %eax
	addl	%edx, %eax
	andl	$252645135, %eax
	movl	%eax, %edx
	shrl	$8, %edx
	addl	%edx, %eax
	movl	%eax, %edx
	shrl	$16, %edx
	addl	%edx, %eax
	movzbl	%al, %eax
	movl	%eax, 88(%rsp)
	movl	8(%rsp), %eax
	testl	%eax, %eax
	je	.L5306
	cmpl	$65535, %eax
	jbe	.L5307
	shrl	$16, %eax
	movl	$24, %esi
	movl	$16, %edx
.L5218:
	cmpl	$255, %eax
	jbe	.L5219
	shrl	$8, %eax
	movl	%esi, %edx
.L5219:
	cmpl	$15, %eax
	jbe	.L5220
	addl	$4, %edx
	shrl	$4, %eax
.L5220:
	cmpl	$3, %eax
	jbe	.L5221
	addl	$2, %edx
	shrl	$2, %eax
.L5221:
	cmpl	$1, %eax
	setne	%al
	movzbl	%al, %eax
	addl	%eax, %edx
.L5217:
	movl	8(%rsp), %esi
	movl	%esi, %eax
	shrl	%eax
	andl	$1431655765, %esi
	andl	$1431655765, %eax
	addl	%esi, %eax
	movl	%eax, %esi
	shrl	$2, %eax
	andl	$858993459, %eax
	andl	$858993459, %esi
	addl	%eax, %esi
	movl	%esi, %eax
	shrl	$4, %eax
	addl	%esi, %eax
	andl	$252645135, %eax
	movl	%eax, %esi
	shrl	$8, %esi
	addl	%esi, %eax
	movl	%eax, %esi
	shrl	$16, %esi
	addl	%esi, %eax
	movzbl	%al, %eax
	cmpl	$8, 76(%rsp)
	movl	%eax, 112(%rsp)
	jg	.L5222
	cmpl	$8, 84(%rsp)
	jg	.L5222
	cmpl	$8, 88(%rsp)
	jg	.L5222
	cmpl	$8, %eax
	jg	.L5222
	leal	-7(%r12), %eax
	movl	%eax, 148(%rsp)
	leal	-7(%rcx), %eax
	movl	%eax, 152(%rsp)
	leal	-7(%rdx), %eax
	movl	%eax, 116(%rsp)
	movl	(%rbx), %eax
	movl	$0, 60(%rsp)
	subl	$7, %r13d
	movl	%eax, %r11d
	jmp	.L5195
	.p2align 4,,10
	.p2align 3
.L5423:
	movl	52(%rbp), %edx
	movq	40(%rbp), %rdi
	movq	%rbx, %rsi
	call	*16(%rbp)
	movq	192(%rbp), %rdx
	movq	8(%rsp), %rsi
	subq	208(%rbp), %rdx
	addl	%edx, 184(%rbp)
	testl	%eax, %eax
	jne	.L5142
	movl	$0, 48(%rbp)
	movb	$0, 56(%rbp)
	movq	%rsi, %rax
	xorl	%edx, %edx
	vmovq	%rsi, %xmm6
.L5143:
	vpinsrq	$1, %rax, %xmm6, %xmm0
	vmovdqu	%xmm0, 192(%rbp)
	jmp	.L5140
	.p2align 4,,10
	.p2align 3
.L5425:
	movl	52(%rbp), %edx
	movq	40(%rbp), %rdi
	movq	%rbx, %rsi
	call	*16(%rbp)
	movq	192(%rbp), %rdx
	subq	208(%rbp), %rdx
	addl	%edx, 184(%rbp)
	testl	%eax, %eax
	jne	.L5151
	movl	$0, 48(%rbp)
	movb	$0, 56(%rbp)
	movq	8(%rsp), %rax
.L5152:
	vmovq	8(%rsp), %xmm6
	vpinsrq	$1, %rax, %xmm6, %xmm0
	vmovdqu	%xmm0, 192(%rbp)
	jmp	.L5150
	.p2align 4,,10
	.p2align 3
.L5424:
	movl	52(%rbp), %edx
	movq	40(%rbp), %rdi
	movq	%rbx, %rsi
	call	*16(%rbp)
	movq	192(%rbp), %rdx
	subq	208(%rbp), %rdx
	addl	%edx, 184(%rbp)
	movq	8(%rsp), %rdx
	testl	%eax, %eax
	jne	.L5147
	movl	$0, 48(%rbp)
	movb	$0, 56(%rbp)
	movq	%rdx, %rax
	xorl	%esi, %esi
	vmovq	%rdx, %xmm7
.L5148:
	vpinsrq	$1, %rax, %xmm7, %xmm0
	vmovdqu	%xmm0, 192(%rbp)
	jmp	.L5145
	.p2align 4,,10
	.p2align 3
.L5426:
	movq	%rbp, %rbx
	movl	40(%rsp), %r14d
	movq	48(%rsp), %rbp
.L5155:
	movl	%r14d, %esi
	subl	192(%rsp), %esi
	xorl	%eax, %eax
	subl	%r15d, %esi
	cmpl	$12, %r15d
	setne	%al
	addl	$3, %eax
	imull	32(%rsp), %eax
	subl	%eax, %esi
	je	.L5156
	js	.L5432
	movq	%rbx, %rdi
	call	stbi__skip.part.0
.L5156:
	cmpl	$1, 16(%rsp)
	je	.L5433
	cmpl	$4, 16(%rsp)
	je	.L5434
	cmpl	$8, 16(%rsp)
	jne	.L5163
	movl	(%rbx), %eax
	movl	%eax, %r11d
	movl	%eax, %edx
.L5162:
	negl	%edx
	movl	4(%rbx), %r8d
	andl	$3, %edx
	leaq	57(%rbx), %rdi
	movl	%edx, 48(%rsp)
	movl	$0, 8(%rsp)
	movq	%rdi, 40(%rsp)
	xorl	%r13d, %r13d
	testl	%r8d, %r8d
	jle	.L5160
	movq	%rbp, %r14
	movl	16(%rsp), %r15d
	movl	%r13d, %ebp
	movl	56(%rsp), %r13d
	.p2align 4,,10
	.p2align 3
.L5277:
	xorl	%r8d, %r8d
	leaq	56(%rbx), %rsi
	testl	%eax, %eax
	jle	.L5181
	.p2align 4,,10
	.p2align 3
.L5189:
	movq	192(%rbx), %rax
	cmpq	200(%rbx), %rax
	jb	.L5435
	movl	48(%rbx), %eax
	xorl	%r12d, %r12d
	testl	%eax, %eax
	jne	.L5436
.L5176:
	xorl	%edx, %edx
	cmpl	$4, %r15d
	jne	.L5179
	movl	%r12d, %edx
	andl	$15, %edx
	sarl	$4, %eax
.L5179:
	cltq
	movzbl	208(%rsp,%rax,4), %edi
	movslq	%ebp, %rcx
	movb	%dil, (%r14,%rcx)
	movzbl	209(%rsp,%rax,4), %edi
	leal	1(%rbp), %ecx
	movslq	%ecx, %rcx
	movb	%dil, (%r14,%rcx)
	movzbl	210(%rsp,%rax,4), %eax
	leal	2(%rbp), %ecx
	movslq	%ecx, %rcx
	movb	%al, (%r14,%rcx)
	leal	3(%rbp), %r12d
	cmpl	$4, %r13d
	jne	.L5180
	movslq	%r12d, %r12
	movb	$-1, (%r14,%r12)
	leal	4(%rbp), %r12d
.L5180:
	movl	(%rbx), %eax
	leal	1(%r8), %ecx
	movl	%eax, %r11d
	cmpl	%ecx, %eax
	je	.L5299
	cmpl	$8, %r15d
	je	.L5437
.L5182:
	movslq	%edx, %rdx
	movzbl	208(%rsp,%rdx,4), %ecx
	movslq	%r12d, %rax
	movb	%cl, (%r14,%rax)
	movzbl	209(%rsp,%rdx,4), %ecx
	leal	1(%r12), %eax
	cltq
	movb	%cl, (%r14,%rax)
	movzbl	210(%rsp,%rdx,4), %edx
	leal	2(%r12), %eax
	cltq
	movb	%dl, (%r14,%rax)
	leal	3(%r12), %ebp
	cmpl	$4, %r13d
	je	.L5438
	movl	(%rbx), %eax
	addl	$2, %r8d
	movl	%eax, %r11d
	cmpl	%eax, %r8d
	jl	.L5189
.L5181:
	movl	48(%rsp), %ecx
	testl	%ecx, %ecx
	je	.L5190
	cmpq	$0, 16(%rbx)
	movq	192(%rbx), %rdx
	je	.L5191
	movq	200(%rbx), %rdi
	movq	%rdi, %rsi
	subq	%rdx, %rsi
	cmpl	%esi, %ecx
	jg	.L5439
.L5191:
	movslq	48(%rsp), %rsi
	addq	%rsi, %rdx
	movq	%rdx, 192(%rbx)
.L5190:
	incl	8(%rsp)
	movl	4(%rbx), %r8d
	movl	8(%rsp), %esi
	cmpl	%r8d, %esi
	jl	.L5277
	movq	%r14, %rbp
.L5160:
	cmpl	$4, 56(%rsp)
	jne	.L5259
	movl	24(%rsp), %edi
	testl	%edi, %edi
	jne	.L5259
	movl	%eax, %edx
	imull	%r8d, %edx
	leal	-1(,%rdx,4), %edx
	testl	%edx, %edx
	js	.L5259
	movslq	%edx, %rdx
	.p2align 4,,10
	.p2align 3
.L5260:
	movb	$-1, 0(%rbp,%rdx)
	subq	$4, %rdx
	testl	%edx, %edx
	jns	.L5260
	movl	%eax, %r11d
.L5259:
	movl	144(%rsp), %esi
	testl	%esi, %esi
	jle	.L5261
	cmpl	$1, %r8d
	jle	.L5261
	movl	56(%rsp), %r9d
	xorl	%r10d, %r10d
	.p2align 4,,10
	.p2align 3
.L5263:
	movl	%r11d, %ecx
	imull	%r9d, %ecx
	leal	-1(%r8), %eax
	subl	%r10d, %eax
	movl	%r10d, %esi
	movl	%eax, %edx
	imull	%ecx, %esi
	imull	%ecx, %edx
	testl	%ecx, %ecx
	jle	.L5261
	movl	(%rbx), %r11d
	xorl	%eax, %eax
	movl	%r11d, %r8d
	imull	%r9d, %r8d
	leaq	0(%rbp,%rsi), %rcx
	addq	%rbp, %rdx
	.p2align 4,,10
	.p2align 3
.L5262:
	movzbl	(%rcx,%rax), %esi
	movzbl	(%rdx,%rax), %edi
	movb	%dil, (%rcx,%rax)
	movb	%sil, (%rdx,%rax)
	incq	%rax
	cmpl	%eax, %r8d
	jg	.L5262
	movl	4(%rbx), %r8d
	incl	%r10d
	movl	%r8d, %eax
	sarl	%eax
	cmpl	%eax, %r10d
	jl	.L5263
.L5261:
	movl	104(%rsp), %eax
	testl	%eax, %eax
	je	.L5264
	movl	56(%rsp), %esi
	cmpl	%eax, %esi
	je	.L5264
	movq	%rbp, %rdi
	movl	%r11d, %ecx
	movl	%eax, %edx
	call	stbi__convert_format
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L5414
	movl	(%rbx), %r11d
.L5264:
	movq	120(%rsp), %rax
	movq	128(%rsp), %rdx
	movl	%r11d, (%rax)
	movl	4(%rbx), %eax
	movl	%eax, (%rdx)
	movq	136(%rsp), %rdx
	testq	%rdx, %rdx
	je	.L5113
	movl	8(%rbx), %eax
	movl	%eax, (%rdx)
	jmp	.L5113
	.p2align 4,,10
	.p2align 3
.L5435:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rbx)
	movzbl	(%rax), %eax
	movl	%eax, %r12d
	jmp	.L5176
	.p2align 4,,10
	.p2align 3
.L5438:
	movslq	%ebp, %rbp
	movb	$-1, (%r14,%rbp)
	addl	$4, %r12d
	addl	$2, %r8d
	movl	(%rbx), %eax
	movl	%r12d, %ebp
	movl	%eax, %r11d
	cmpl	%r8d, %eax
	jg	.L5189
	jmp	.L5181
	.p2align 4,,10
	.p2align 3
.L5437:
	movq	192(%rbx), %rax
	cmpq	200(%rbx), %rax
	jb	.L5440
	movl	48(%rbx), %edx
	testl	%edx, %edx
	je	.L5182
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movl	%r8d, 32(%rsp)
	movq	%rsi, 16(%rsp)
	call	*16(%rbx)
	movl	%eax, %edx
	movq	192(%rbx), %rax
	movq	16(%rsp), %rsi
	subq	208(%rbx), %rax
	addl	%eax, 184(%rbx)
	testl	%edx, %edx
	movl	32(%rsp), %r8d
	jne	.L5185
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	movq	40(%rsp), %rax
.L5186:
	vmovq	40(%rsp), %xmm5
	vpinsrq	$1, %rax, %xmm5, %xmm0
	vmovdqu	%xmm0, 192(%rbx)
	jmp	.L5182
	.p2align 4,,10
	.p2align 3
.L5436:
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movl	%r8d, 32(%rsp)
	movq	%rsi, 16(%rsp)
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	movq	16(%rsp), %rsi
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	testl	%eax, %eax
	movl	32(%rsp), %r8d
	jne	.L5177
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	movq	40(%rsp), %rdx
.L5178:
	vmovq	40(%rsp), %xmm1
	vpinsrq	$1, %rdx, %xmm1, %xmm0
	vmovdqu	%xmm0, 192(%rbx)
	jmp	.L5176
	.p2align 4,,10
	.p2align 3
.L5177:
	cltq
	leaq	(%rsi,%rax), %rdx
	movzbl	56(%rbx), %eax
	movl	%eax, %r12d
	jmp	.L5178
	.p2align 4,,10
	.p2align 3
.L5440:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rbx)
	movzbl	(%rax), %edx
	jmp	.L5182
	.p2align 4,,10
	.p2align 3
.L5299:
	movl	%r12d, %ebp
	jmp	.L5181
	.p2align 4,,10
	.p2align 3
.L5419:
	leaq	.LC336(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%ebp, %ebp
	jmp	.L5113
	.p2align 4,,10
	.p2align 3
.L5116:
	movl	52(%rdi), %edx
	leaq	56(%rdi), %rbp
	movq	40(%rdi), %rdi
	movq	%rbp, %rsi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	leaq	57(%rbx), %rcx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	testl	%eax, %eax
	jne	.L5118
	vmovq	%rcx, %xmm5
	vpunpcklqdq	%xmm5, %xmm5, %xmm0
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	vmovdqu	%xmm0, 192(%rbx)
	jmp	.L5119
	.p2align 4,,10
	.p2align 3
.L5439:
	movq	%rdi, 192(%rbx)
	movl	%ecx, %r8d
	subl	%esi, %r8d
	movq	40(%rbx), %rdi
	movl	%r8d, %esi
	call	*24(%rbx)
	movl	(%rbx), %eax
	movl	%eax, %r11d
	jmp	.L5190
.L5185:
	movslq	%edx, %rax
	addq	%rsi, %rax
	movzbl	56(%rbx), %edx
	jmp	.L5186
.L5142:
	cltq
	movzbl	56(%rbp), %edx
	addq	%rbx, %rax
	vmovq	%rsi, %xmm6
	jmp	.L5143
.L5151:
	cltq
	movzbl	56(%rbp), %r14d
	addq	%rbx, %rax
	jmp	.L5152
.L5147:
	cltq
	movzbl	56(%rbp), %esi
	addq	%rbx, %rax
	vmovq	%rdx, %xmm7
	jmp	.L5148
.L5118:
	cltq
	addq	%rax, %rbp
	vmovq	%rcx, %xmm5
	vpinsrq	$1, %rbp, %xmm5, %xmm0
	movzbl	56(%rbx), %edx
	vmovdqu	%xmm0, 192(%rbx)
	jmp	.L5115
.L5429:
	movl	(%rbx), %eax
	movl	$1, 60(%rsp)
	leal	(%rax,%rax,2), %edx
	negl	%edx
	andl	$3, %edx
	movl	%edx, 108(%rsp)
	movl	%eax, %r11d
.L5413:
	movl	$0, 112(%rsp)
	movl	$0, 88(%rsp)
	movl	$0, 84(%rsp)
	movl	$0, 76(%rsp)
	movl	$0, 116(%rsp)
	movl	$0, 152(%rsp)
	movl	$0, 148(%rsp)
	xorl	%r13d, %r13d
.L5195:
	movl	4(%rbx), %r8d
	testl	%r8d, %r8d
	jle	.L5160
	leaq	57(%rbx), %rsi
	movl	$0, 92(%rsp)
	movq	%rsi, 96(%rsp)
	movl	%r13d, 156(%rsp)
	xorl	%r12d, %r12d
	movq	%rbp, %rcx
	leaq	mul_table.40(%rip), %r14
	movl	%r12d, %ebp
	.p2align 4,,10
	.p2align 3
.L5258:
	movl	60(%rsp), %edx
	testl	%edx, %edx
	jne	.L5223
	movl	$8, %esi
	subl	76(%rsp), %esi
	movl	%esi, 80(%rsp)
	xorl	%r15d, %r15d
	leaq	shift_table.39(%rip), %r12
	testl	%eax, %eax
	jle	.L5225
	movq	%rbx, %r10
	movl	156(%rsp), %r13d
	movl	152(%rsp), %r8d
	movl	148(%rsp), %ebx
	movl	%r15d, %r9d
	movq	%rcx, %r15
	.p2align 4,,10
	.p2align 3
.L5224:
	cmpl	$16, 16(%rsp)
	movl	%r9d, 48(%rsp)
	movl	%r8d, 40(%rsp)
	movq	%r10, 32(%rsp)
	movq	%r10, %rdi
	je	.L5441
	call	stbi__get32le
	movl	48(%rsp), %r9d
	movl	40(%rsp), %r8d
	movq	32(%rsp), %r10
	movl	%eax, %edx
.L5247:
	movl	68(%rsp), %eax
	movl	%ebx, %esi
	andl	%edx, %eax
	negl	%esi
	testl	%ebx, %ebx
	shlx	%esi, %eax, %esi
	shrx	%ebx, %eax, %eax
	cmovs	%esi, %eax
	cmpl	$255, %eax
	ja	.L5268
	movslq	76(%rsp), %r11
	movzbl	80(%rsp), %ecx
	movslq	%ebp, %rsi
	shrx	%ecx, %eax, %eax
	imull	(%r14,%r11,4), %eax
	movl	(%r12,%r11,4), %r11d
	leal	1(%rbp), %edi
	sarx	%r11d, %eax, %r11d
	movb	%r11b, (%r15,%rsi)
	movl	64(%rsp), %esi
	movl	%r13d, %r11d
	andl	%edx, %esi
	negl	%r11d
	testl	%r13d, %r13d
	shrx	%r13d, %esi, %eax
	shlx	%r11d, %esi, %esi
	cmovns	%eax, %esi
	cmpl	$255, %esi
	ja	.L5268
	movl	84(%rsp), %ecx
	movl	$8, %eax
	subl	%ecx, %eax
	shrx	%eax, %esi, %eax
	movslq	%ecx, %rsi
	imull	(%r14,%rsi,4), %eax
	movl	(%r12,%rsi,4), %esi
	movslq	%edi, %rdi
	sarx	%esi, %eax, %eax
	movb	%al, (%r15,%rdi)
	movl	72(%rsp), %eax
	movl	%r8d, %edi
	andl	%edx, %eax
	negl	%edi
	testl	%r8d, %r8d
	shrx	%r8d, %eax, %esi
	shlx	%edi, %eax, %eax
	cmovns	%esi, %eax
	leal	2(%rbp), %r11d
	cmpl	$255, %eax
	ja	.L5268
	movl	88(%rsp), %ecx
	movl	$8, %edi
	subl	%ecx, %edi
	shrx	%edi, %eax, %eax
	movslq	%ecx, %rdi
	imull	(%r14,%rdi,4), %eax
	movl	8(%rsp), %ecx
	movl	(%r12,%rdi,4), %edi
	movslq	%r11d, %r11
	sarx	%edi, %eax, %eax
	leal	3(%rbp), %esi
	movb	%al, (%r15,%r11)
	movl	$255, %eax
	testl	%ecx, %ecx
	jne	.L5442
.L5266:
	orl	%eax, 24(%rsp)
	cmpl	$4, 56(%rsp)
	je	.L5443
	movl	(%r10), %eax
	incl	%r9d
	movl	%eax, %r11d
	cmpl	%eax, %r9d
	jge	.L5444
	movl	%esi, %ebp
	jmp	.L5224
	.p2align 4,,10
	.p2align 3
.L5444:
	movq	%r15, %rcx
	movq	%r10, %rbx
	movl	%esi, %ebp
.L5225:
	movl	108(%rsp), %r10d
	testl	%r10d, %r10d
	je	.L5256
	cmpq	$0, 16(%rbx)
	movq	192(%rbx), %rdx
	je	.L5257
	movq	200(%rbx), %rdi
	movq	%rdi, %rsi
	subq	%rdx, %rsi
	cmpl	%esi, %r10d
	jg	.L5445
.L5257:
	movslq	108(%rsp), %rsi
	addq	%rsi, %rdx
	movq	%rdx, 192(%rbx)
.L5256:
	incl	92(%rsp)
	movl	4(%rbx), %r8d
	movl	92(%rsp), %esi
	cmpl	%r8d, %esi
	jl	.L5258
	movq	%rcx, %rbp
	jmp	.L5160
	.p2align 4,,10
	.p2align 3
.L5441:
	call	stbi__get16le
	movl	%eax, %edx
	movq	32(%rsp), %r10
	movl	40(%rsp), %r8d
	movl	48(%rsp), %r9d
	jmp	.L5247
	.p2align 4,,10
	.p2align 3
.L5443:
	movslq	%esi, %rsi
	movb	%al, (%r15,%rsi)
	incl	%r9d
	addl	$4, %ebp
	movl	(%r10), %eax
	movl	%eax, %r11d
	cmpl	%eax, %r9d
	jge	.L5446
	movl	%ebp, %esi
	movl	%esi, %ebp
	jmp	.L5224
	.p2align 4,,10
	.p2align 3
.L5442:
	movl	116(%rsp), %edi
	andl	8(%rsp), %edx
	movl	%edi, %eax
	negl	%eax
	movl	%edi, %ecx
	testl	%edi, %edi
	shlx	%eax, %edx, %eax
	shrx	%ecx, %edx, %edx
	cmovs	%eax, %edx
	cmpl	$255, %edx
	ja	.L5268
	movl	112(%rsp), %edi
	movl	$8, %eax
	subl	%edi, %eax
	shrx	%eax, %edx, %edx
	movslq	%edi, %rax
	imull	(%r14,%rax,4), %edx
	movl	(%r12,%rax,4), %eax
	sarx	%eax, %edx, %eax
	jmp	.L5266
	.p2align 4,,10
	.p2align 3
.L5223:
	testl	%eax, %eax
	jle	.L5225
	leaq	56(%rbx), %rax
	movq	%rax, 32(%rsp)
	movl	24(%rsp), %r13d
	xorl	%r15d, %r15d
	jmp	.L5245
	.p2align 4,,10
	.p2align 3
.L5226:
	movl	48(%rbx), %eax
	xorl	%r9d, %r9d
	testl	%eax, %eax
	jne	.L5447
.L5227:
	movb	%r9b, (%r11)
	leaq	1(%rcx,%r12), %r11
	movq	192(%rbx), %rax
	cmpq	200(%rbx), %rax
	jb	.L5448
	movl	48(%rbx), %eax
	xorl	%r9d, %r9d
	testl	%eax, %eax
	jne	.L5449
.L5231:
	movb	%r9b, (%r11)
	addq	%rcx, %r12
	movq	192(%rbx), %rax
	cmpq	200(%rbx), %rax
	jb	.L5450
	movl	48(%rbx), %r10d
	xorl	%r9d, %r9d
	testl	%r10d, %r10d
	jne	.L5451
.L5235:
	cmpl	$2, 60(%rsp)
	movb	%r9b, (%r12)
	leal	3(%rbp), %r12d
	je	.L5238
.L5455:
	orb	$-1, %r13b
	movl	$-1, %r9d
.L5239:
	cmpl	$4, 56(%rsp)
	je	.L5452
	movl	(%rbx), %eax
	incl	%r15d
	movl	%eax, %r11d
	cmpl	%eax, %r15d
	jge	.L5453
.L5244:
	movl	%r12d, %ebp
.L5245:
	movq	192(%rbx), %rax
	movslq	%ebp, %r12
	leaq	2(%rcx,%r12), %r11
	cmpq	200(%rbx), %rax
	jnb	.L5226
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rbx)
	movzbl	(%rax), %r9d
	jmp	.L5227
	.p2align 4,,10
	.p2align 3
.L5452:
	movslq	%r12d, %r12
	movb	%r9b, (%rcx,%r12)
	incl	%r15d
	addl	$4, %ebp
	movl	(%rbx), %eax
	movl	%eax, %r11d
	cmpl	%eax, %r15d
	jge	.L5454
	movl	%ebp, %r12d
	jmp	.L5244
	.p2align 4,,10
	.p2align 3
.L5450:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rbx)
	cmpl	$2, 60(%rsp)
	movzbl	(%rax), %r9d
	movb	%r9b, (%r12)
	leal	3(%rbp), %r12d
	jne	.L5455
.L5238:
	movq	192(%rbx), %rax
	cmpq	200(%rbx), %rax
	jb	.L5456
	movl	48(%rbx), %r8d
	xorl	%r9d, %r9d
	testl	%r8d, %r8d
	je	.L5239
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	32(%rsp), %rsi
	movq	%rcx, 24(%rsp)
	movb	%r9b, 40(%rsp)
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	movq	24(%rsp), %rcx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	testl	%eax, %eax
	jne	.L5241
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	movq	96(%rsp), %rax
	movzbl	40(%rsp), %r9d
.L5242:
	vmovq	96(%rsp), %xmm7
	vpinsrq	$1, %rax, %xmm7, %xmm0
	vmovdqu	%xmm0, 192(%rbx)
	jmp	.L5239
	.p2align 4,,10
	.p2align 3
.L5448:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rbx)
	movzbl	(%rax), %r9d
	jmp	.L5231
	.p2align 4,,10
	.p2align 3
.L5447:
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	32(%rsp), %rsi
	movq	%rcx, 40(%rsp)
	movq	%r11, 24(%rsp)
	movb	%r9b, 48(%rsp)
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	movq	24(%rsp), %r11
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	testl	%eax, %eax
	movq	40(%rsp), %rcx
	jne	.L5228
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	movq	96(%rsp), %rax
	movzbl	48(%rsp), %r9d
.L5229:
	vmovq	96(%rsp), %xmm2
	vpinsrq	$1, %rax, %xmm2, %xmm0
	vmovdqu	%xmm0, 192(%rbx)
	jmp	.L5227
	.p2align 4,,10
	.p2align 3
.L5451:
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	32(%rsp), %rsi
	movq	%rcx, 24(%rsp)
	movb	%r9b, 40(%rsp)
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	movq	24(%rsp), %rcx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	testl	%eax, %eax
	jne	.L5236
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	movq	96(%rsp), %rax
	movzbl	40(%rsp), %r9d
.L5237:
	vmovq	96(%rsp), %xmm4
	vpinsrq	$1, %rax, %xmm4, %xmm0
	vmovdqu	%xmm0, 192(%rbx)
	jmp	.L5235
	.p2align 4,,10
	.p2align 3
.L5449:
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	32(%rsp), %rsi
	movq	%rcx, 40(%rsp)
	movq	%r11, 24(%rsp)
	movb	%r9b, 48(%rsp)
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	movq	24(%rsp), %r11
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	testl	%eax, %eax
	movq	40(%rsp), %rcx
	jne	.L5232
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	movq	96(%rsp), %rax
	movzbl	48(%rsp), %r9d
.L5233:
	vmovq	96(%rsp), %xmm3
	vpinsrq	$1, %rax, %xmm3, %xmm0
	vmovdqu	%xmm0, 192(%rbx)
	jmp	.L5231
	.p2align 4,,10
	.p2align 3
.L5453:
	movl	%r13d, 24(%rsp)
	movl	%r12d, %ebp
	jmp	.L5225
	.p2align 4,,10
	.p2align 3
.L5456:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rbx)
	movzbl	(%rax), %eax
	movl	%eax, %r9d
	orl	%eax, %r13d
	jmp	.L5239
	.p2align 4,,10
	.p2align 3
.L5228:
	cltq
	movzbl	56(%rbx), %r9d
	addq	32(%rsp), %rax
	jmp	.L5229
	.p2align 4,,10
	.p2align 3
.L5232:
	cltq
	movzbl	56(%rbx), %r9d
	addq	32(%rsp), %rax
	jmp	.L5233
	.p2align 4,,10
	.p2align 3
.L5236:
	cltq
	movzbl	56(%rbx), %r9d
	addq	32(%rsp), %rax
	jmp	.L5237
	.p2align 4,,10
	.p2align 3
.L5445:
	movq	%rdi, 192(%rbx)
	movl	%r10d, %r8d
	subl	%esi, %r8d
	movq	40(%rbx), %rdi
	movl	%r8d, %esi
	movq	%rcx, 32(%rsp)
	call	*24(%rbx)
	movl	(%rbx), %eax
	movq	32(%rsp), %rcx
	movl	%eax, %r11d
	jmp	.L5256
	.p2align 4,,10
	.p2align 3
.L5454:
	movl	%r13d, 24(%rsp)
	jmp	.L5225
	.p2align 4,,10
	.p2align 3
.L5446:
	movq	%r15, %rcx
	movq	%r10, %rbx
	jmp	.L5225
.L5222:
	movq	%rbp, %rdi
	call	free@PLT
	leaq	.LC339(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
.L5414:
	xorl	%ebp, %ebp
	jmp	.L5113
.L5433:
	movl	(%rbx), %eax
	movl	4(%rbx), %r8d
	leal	7(%rax), %edx
	shrl	$3, %edx
	negl	%edx
	andl	$3, %edx
	movl	%edx, 8(%rsp)
	movl	%eax, %r11d
	xorl	%r14d, %r14d
	xorl	%r12d, %r12d
	testl	%r8d, %r8d
	jle	.L5160
	movq	%rbx, %r15
	movl	%r14d, %ebx
	.p2align 4,,10
	.p2align 3
.L5159:
	movq	%r15, %rdi
	call	stbi__get8
	movl	(%r15), %r8d
	movzbl	%al, %esi
	testl	%r8d, %r8d
	jle	.L5164
	cmpl	$4, 56(%rsp)
	je	.L5165
	leal	3(%rbx), %r13d
	movslq	%r13d, %r13
	xorl	%r14d, %r14d
.L5410:
	movl	(%r15), %ecx
	movl	$7, %edx
.L5168:
	sarx	%edx, %esi, %edi
	andl	$1, %edi
	movzbl	208(%rsp,%rdi,4), %r8d
	incl	%r14d
	movb	%r8b, -3(%rbp,%r13)
	movzbl	209(%rsp,%rdi,4), %r8d
	movzbl	210(%rsp,%rdi,4), %edi
	movb	%r8b, -2(%rbp,%r13)
	movb	%dil, -1(%rbp,%r13)
	movl	%r13d, %ebx
	cmpl	%r14d, %ecx
	je	.L5164
	subl	$1, %edx
	jb	.L5457
	addq	$3, %r13
	cmpl	%r14d, %ecx
	jg	.L5168
.L5164:
	movl	8(%rsp), %esi
	testl	%esi, %esi
	je	.L5172
	movq	%r15, %rdi
	call	stbi__skip.part.0
	movl	4(%r15), %r8d
	incl	%r12d
	cmpl	%r8d, %r12d
	jl	.L5159
.L5412:
	movl	(%r15), %eax
	movq	%r15, %rbx
	movl	%eax, %r11d
	jmp	.L5160
.L5241:
	movzbl	56(%rbx), %edx
	cltq
	addq	32(%rsp), %rax
	movl	%edx, %r9d
	orl	%edx, %r13d
	jmp	.L5242
.L5431:
	shrl	$16, %eax
	movl	$24, %edx
	movl	$16, %r12d
	jmp	.L5202
	.p2align 4,,10
	.p2align 3
.L5457:
	movq	%r15, %rdi
	call	stbi__get8
	movzbl	%al, %esi
	addq	$3, %r13
	cmpl	%r14d, (%r15)
	jg	.L5410
	jmp	.L5164
	.p2align 4,,10
	.p2align 3
.L5172:
	movl	4(%r15), %r8d
	incl	%r12d
	cmpl	%r8d, %r12d
	jl	.L5159
	jmp	.L5412
	.p2align 4,,10
	.p2align 3
.L5165:
	addl	$4, %ebx
	movslq	%ebx, %r13
	xorl	%r14d, %r14d
.L5411:
	movl	(%r15), %ecx
	movl	$7, %edx
.L5171:
	sarx	%edx, %esi, %edi
	andl	$1, %edi
	movzbl	208(%rsp,%rdi,4), %r8d
	incl	%r14d
	movb	%r8b, -4(%rbp,%r13)
	movzbl	209(%rsp,%rdi,4), %r8d
	movzbl	210(%rsp,%rdi,4), %edi
	movb	%r8b, -3(%rbp,%r13)
	movb	%dil, -2(%rbp,%r13)
	movb	$-1, -1(%rbp,%r13)
	movl	%r13d, %ebx
	cmpl	%ecx, %r14d
	je	.L5164
	subl	$1, %edx
	jb	.L5458
	addq	$4, %r13
	cmpl	%ecx, %r14d
	jl	.L5171
	jmp	.L5164
	.p2align 4,,10
	.p2align 3
.L5458:
	movq	%r15, %rdi
	call	stbi__get8
	movzbl	%al, %esi
	addq	$4, %r13
	cmpl	(%r15), %r14d
	jl	.L5411
	jmp	.L5164
.L5430:
	movl	(%rbx), %eax
	addl	%eax, %eax
	negl	%eax
	andl	$3, %eax
	movl	%eax, 108(%rsp)
	jmp	.L5197
.L5305:
	movl	$8, %edx
	xorl	%ecx, %ecx
	jmp	.L5212
.L5304:
	movl	$8, %edx
	xorl	%r13d, %r13d
	jmp	.L5207
.L5307:
	movl	$8, %esi
	xorl	%edx, %edx
	jmp	.L5218
.L5427:
	movl	$2147483647, %eax
	cltd
	idivl	%esi
	cmpl	%eax, 56(%rsp)
	jg	.L5133
	jmp	.L5282
.L5434:
	movl	(%rbx), %eax
	leal	1(%rax), %edx
	movl	%eax, %r11d
	shrl	%edx
	jmp	.L5162
.L5428:
	movq	200(%rbx), %rax
	movq	%rax, 192(%rbx)
	jmp	.L5192
.L5432:
	movq	200(%rbx), %rax
	movq	%rax, 192(%rbx)
	jmp	.L5156
.L5135:
	movq	%rbp, %rdi
	call	free@PLT
	leaq	.LC337(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%ebp, %ebp
	jmp	.L5113
.L5163:
	movq	%rbp, %rdi
	call	free@PLT
	leaq	.LC338(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%ebp, %ebp
	jmp	.L5113
.L5268:
	leaq	__PRETTY_FUNCTION__.41(%rip), %rcx
	movl	$5345, %edx
	leaq	.LC21(%rip), %rsi
	leaq	.LC340(%rip), %rdi
	call	__assert_fail@PLT
.L5306:
	orl	$-1, %edx
	jmp	.L5217
.L5421:
	movl	104(%rsp), %eax
	movl	%eax, 56(%rsp)
	jmp	.L5285
.L5416:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE894:
	.size	stbi__bmp_load.constprop.0, .-stbi__bmp_load.constprop.0
	.section	.rodata.str1.1
.LC341:
	.string	"not GIF"
.LC342:
	.string	""
	.text
	.p2align 4
	.type	stbi__gif_header, @function
stbi__gif_header:
.LFB748:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	movq	%rdx, %r14
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movq	%rsi, %r13
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	movl	%ecx, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$16, %rsp
	.cfi_def_cfa_offset 64
	movq	192(%rdi), %rdx
	movq	200(%rdi), %rax
	cmpq	%rax, %rdx
	jb	.L5485
	movl	48(%rdi), %ecx
	testl	%ecx, %ecx
	jne	.L5486
.L5463:
	leaq	.LC341(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
.L5459:
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
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
	ret
	.p2align 4,,10
	.p2align 3
.L5485:
	.cfi_restore_state
	leaq	1(%rdx), %rcx
	movq	%rcx, 192(%rdi)
	movzbl	(%rdx), %edx
.L5461:
	cmpb	$71, %dl
	jne	.L5463
	cmpq	%rcx, %rax
	ja	.L5487
	movl	48(%rbp), %edx
	testl	%edx, %edx
	je	.L5463
	movl	52(%rbp), %edx
	movq	40(%rbp), %rdi
	leaq	56(%rbp), %rbx
	movq	%rbx, %rsi
	call	*16(%rbp)
	movq	192(%rbp), %rdx
	subq	208(%rbp), %rdx
	addl	%edx, 184(%rbp)
	leaq	57(%rbp), %rdx
	testl	%eax, %eax
	jne	.L5468
	vmovq	%rdx, %xmm3
	vpunpcklqdq	%xmm3, %xmm3, %xmm0
	movl	$0, 48(%rbp)
	movb	$0, 56(%rbp)
	vmovdqu	%xmm0, 192(%rbp)
	jmp	.L5463
	.p2align 4,,10
	.p2align 3
.L5486:
	movl	52(%rdi), %edx
	leaq	56(%rdi), %rbx
	movq	40(%rdi), %rdi
	movq	%rbx, %rsi
	call	*16(%rbp)
	movq	192(%rbp), %rdx
	leaq	57(%rbp), %rcx
	subq	208(%rbp), %rdx
	addl	%edx, 184(%rbp)
	testl	%eax, %eax
	jne	.L5464
	vmovq	%rcx, %xmm1
	vpunpcklqdq	%xmm1, %xmm1, %xmm0
	movl	$0, 48(%rbp)
	movb	$0, 56(%rbp)
	vmovdqu	%xmm0, 192(%rbp)
	jmp	.L5463
	.p2align 4,,10
	.p2align 3
.L5487:
	leaq	1(%rcx), %rdx
	movq	%rdx, 192(%rbp)
	movzbl	(%rcx), %ecx
.L5467:
	cmpb	$73, %cl
	jne	.L5463
	cmpq	%rax, %rdx
	jb	.L5488
	movl	48(%rbp), %eax
	testl	%eax, %eax
	je	.L5463
	movl	52(%rbp), %edx
	movq	40(%rbp), %rdi
	leaq	56(%rbp), %rbx
	movq	%rbx, %rsi
	call	*16(%rbp)
	movq	192(%rbp), %rdx
	leaq	57(%rbp), %rcx
	subq	208(%rbp), %rdx
	addl	%edx, 184(%rbp)
	testl	%eax, %eax
	jne	.L5471
	vmovq	%rcx, %xmm5
	vpunpcklqdq	%xmm5, %xmm5, %xmm0
	movl	$0, 48(%rbp)
	movb	$0, 56(%rbp)
	vmovdqu	%xmm0, 192(%rbp)
	jmp	.L5463
	.p2align 4,,10
	.p2align 3
.L5464:
	cltq
	addq	%rbx, %rax
	vmovq	%rcx, %xmm2
	vpinsrq	$1, %rax, %xmm2, %xmm0
	movzbl	56(%rbp), %edx
	vmovdqu	%xmm0, 192(%rbp)
	jmp	.L5461
	.p2align 4,,10
	.p2align 3
.L5488:
	leaq	1(%rdx), %rax
	movq	%rax, 192(%rbp)
	movzbl	(%rdx), %edx
.L5470:
	cmpb	$70, %dl
	jne	.L5463
	movq	%rbp, %rdi
	call	stbi__get8
	cmpb	$56, %al
	jne	.L5463
	movq	%rbp, %rdi
	call	stbi__get8
	subl	$55, %eax
	testb	$-3, %al
	jne	.L5463
	movq	%rbp, %rdi
	call	stbi__get8
	cmpb	$97, %al
	jne	.L5463
	leaq	.LC342(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	movq	%rbp, %rdi
	call	stbi__get16le
	movl	%eax, 0(%r13)
	movq	%rbp, %rdi
	call	stbi__get16le
	movl	%eax, 4(%r13)
	movq	%rbp, %rdi
	call	stbi__get8
	movzbl	%al, %eax
	movl	%eax, 32(%r13)
	movq	%rbp, %rdi
	call	stbi__get8
	movzbl	%al, %eax
	movl	%eax, 36(%r13)
	movq	%rbp, %rdi
	call	stbi__get8
	movzbl	%al, %eax
	cmpl	$16777216, 0(%r13)
	movl	%eax, 40(%r13)
	movl	$-1, 44(%r13)
	jg	.L5475
	cmpl	$16777216, 4(%r13)
	jg	.L5475
	testq	%r14, %r14
	je	.L5476
	movl	$4, (%r14)
.L5476:
	testl	%r12d, %r12d
	jne	.L5477
	movl	32(%r13), %edx
	movl	$1, %eax
	testb	$-128, %dl
	je	.L5459
	movl	$2, %ecx
	andl	$7, %edx
	shlx	%edx, %ecx, %edx
	leaq	52(%r13), %rsi
	orl	$-1, %ecx
	movq	%rbp, %rdi
	movl	%eax, 12(%rsp)
	call	stbi__gif_parse_colortable
	movl	12(%rsp), %eax
	jmp	.L5459
	.p2align 4,,10
	.p2align 3
.L5468:
	cltq
	addq	%rbx, %rax
	vmovq	%rdx, %xmm4
	vpinsrq	$1, %rax, %xmm4, %xmm0
	movzbl	56(%rbp), %ecx
	vmovdqu	%xmm0, 192(%rbp)
	jmp	.L5467
.L5471:
	cltq
	addq	%rax, %rbx
	vmovq	%rcx, %xmm6
	vpinsrq	$1, %rbx, %xmm6, %xmm0
	movzbl	56(%rbp), %edx
	vmovdqu	%xmm0, 192(%rbp)
	jmp	.L5470
.L5475:
	leaq	.LC203(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L5459
.L5477:
	movl	%r12d, %eax
	jmp	.L5459
	.cfi_endproc
.LFE748:
	.size	stbi__gif_header, .-stbi__gif_header
	.section	.rodata.str1.1
.LC343:
	.string	"unknown image type"
	.text
	.p2align 4
	.type	stbi__info_main, @function
stbi__info_main:
.LFB775:
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
	movq	%rcx, %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdx, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rsi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	movl	$18568, %edi
	subq	$88, %rsp
	.cfi_def_cfa_offset 144
	movq	%fs:40, %rax
	movq	%rax, 72(%rsp)
	xorl	%eax, %eax
	call	malloc@PLT
	testq	%rax, %rax
	je	.L5666
	movq	%rbx, (%rax)
	movq	%rax, %r14
	movabsq	$-4294967296, %rax
	movq	%rax, 18504(%r14)
	movq	192(%rbx), %rax
	movb	$-1, 18472(%r14)
	cmpq	200(%rbx), %rax
	jb	.L5667
	movl	48(%rbx), %eax
	movq	%rbx, %r15
	testl	%eax, %eax
	jne	.L5668
	.p2align 4,,10
	.p2align 3
.L5494:
	leaq	.LC258(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
.L5503:
	vmovdqu	208(%r15), %xmm1
	movq	%r14, %rdi
	vmovdqu	%xmm1, 192(%r15)
	call	free@PLT
.L5491:
	leaq	32(%rsp), %r15
	xorl	%edx, %edx
	movl	$2, %esi
	movq	%r15, %rdi
	movq	%rbx, 32(%rsp)
	call	stbi__parse_png_file
	movl	%eax, %r14d
	testl	%eax, %eax
	je	.L5669
	testq	%rbp, %rbp
	je	.L5513
	movq	32(%rsp), %rax
	movl	(%rax), %eax
	movl	%eax, 0(%rbp)
.L5513:
	testq	%r12, %r12
	je	.L5514
	movq	32(%rsp), %rax
	movl	4(%rax), %eax
	movl	%eax, (%r12)
.L5514:
	movl	$1, %r8d
	testq	%r13, %r13
	je	.L5489
	movq	32(%rsp), %rax
	movl	8(%rax), %eax
	movl	%eax, 0(%r13)
	.p2align 4,,10
	.p2align 3
.L5489:
	movq	72(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L5670
	addq	$88, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
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
	movl	%r8d, %eax
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L5669:
	.cfi_restore_state
	movq	32(%rsp), %rax
	movl	$34928, %edi
	vmovdqu	208(%rax), %xmm2
	vmovdqu	%xmm2, 192(%rax)
	call	malloc@PLT
	testq	%rax, %rax
	je	.L5671
	movl	$1, %ecx
	movq	%r13, %rdx
	movq	%rax, %rsi
	movq	%rbx, %rdi
	movq	%rax, (%rsp)
	call	stbi__gif_header
	testl	%eax, %eax
	movq	(%rsp), %r8
	je	.L5672
	testq	%rbp, %rbp
	je	.L5518
	movl	(%r8), %eax
	movl	%eax, 0(%rbp)
.L5518:
	testq	%r12, %r12
	je	.L5519
	movl	4(%r8), %eax
	movl	%eax, (%r12)
.L5519:
	movq	%r8, %rdi
	call	free@PLT
	movl	$1, %r8d
	jmp	.L5489
	.p2align 4,,10
	.p2align 3
.L5667:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rbx)
	movq	%rbx, %r15
	movzbl	(%rax), %edx
.L5493:
	cmpb	$-1, %dl
	jne	.L5494
	.p2align 4,,10
	.p2align 3
.L5501:
	movq	192(%r15), %rax
	cmpq	200(%r15), %rax
	jb	.L5673
	movl	48(%r15), %r11d
	testl	%r11d, %r11d
	je	.L5494
	movl	52(%r15), %edx
	movq	40(%r15), %rdi
	leaq	56(%r15), %rsi
	movq	%rsi, (%rsp)
	call	*16(%r15)
	movq	192(%r15), %rdx
	movq	(%rsp), %rsi
	subq	208(%r15), %rdx
	addl	%edx, 184(%r15)
	testl	%eax, %eax
	leaq	57(%r15), %rcx
	jne	.L5498
	vmovq	%rcx, %xmm3
	movl	$0, 48(%r15)
	movb	$0, 56(%r15)
	vpunpcklqdq	%xmm3, %xmm3, %xmm0
	vmovdqu	%xmm0, 192(%r15)
.L5499:
	movq	(%r14), %r15
	jmp	.L5494
	.p2align 4,,10
	.p2align 3
.L5673:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%r15)
	movzbl	(%rax), %edx
.L5497:
	cmpb	$-1, %dl
	jne	.L5500
	movq	(%r14), %r15
	jmp	.L5501
.L5500:
	cmpb	$-40, %dl
	jne	.L5499
	movl	$2, %esi
	movq	%r14, %rdi
	call	stbi__decode_jpeg_header.part.0
	testl	%eax, %eax
	je	.L5674
	testq	%rbp, %rbp
	je	.L5505
	movq	(%r14), %rax
	movl	(%rax), %eax
	movl	%eax, 0(%rbp)
.L5505:
	testq	%r12, %r12
	je	.L5506
	movq	(%r14), %rax
	movl	4(%rax), %eax
	movl	%eax, (%r12)
.L5506:
	testq	%r13, %r13
	je	.L5507
	movq	(%r14), %rax
	movq	%r14, %rdi
	cmpl	$2, 8(%rax)
	setg	%al
	movzbl	%al, %eax
	leal	1(%rax,%rax), %eax
	movl	%eax, 0(%r13)
	call	free@PLT
	movl	$1, %r8d
	jmp	.L5489
	.p2align 4,,10
	.p2align 3
.L5507:
	movq	%r14, %rdi
	call	free@PLT
	movl	$1, %r8d
	jmp	.L5489
	.p2align 4,,10
	.p2align 3
.L5498:
	cltq
	addq	%rax, %rsi
	vmovq	%rcx, %xmm4
	vpinsrq	$1, %rsi, %xmm4, %xmm0
	movzbl	56(%r15), %edx
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L5497
	.p2align 4,,10
	.p2align 3
.L5674:
	movq	(%r14), %r15
	jmp	.L5503
	.p2align 4,,10
	.p2align 3
.L5672:
	movq	%r8, %rdi
	call	free@PLT
	movq	208(%rbx), %rdx
	movq	216(%rbx), %rax
	movq	%rdx, 192(%rbx)
	movq	%rax, 200(%rbx)
.L5516:
	movl	$255, 60(%rsp)
	cmpq	%rax, %rdx
	jb	.L5675
	movl	48(%rbx), %r10d
	testl	%r10d, %r10d
	jne	.L5522
.L5525:
	leaq	.LC335(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
.L5523:
	testq	%rbp, %rbp
	movq	%rbp, %rax
	cmove	%r15, %rax
	testq	%r12, %r12
	movq	%rax, 8(%rsp)
	movq	%r15, %rax
	cmovne	%r12, %rax
	vmovdqu	208(%rbx), %xmm5
	testq	%r13, %r13
	movq	%rax, (%rsp)
	movq	%r15, %rax
	cmovne	%r13, %rax
	vmovdqu	%xmm5, 192(%rbx)
	movq	%rbx, %rdi
	movq	%rax, 16(%rsp)
	call	stbi__get32be
	cmpl	$943870035, %eax
	je	.L5676
.L5662:
	testq	%rbp, %rbp
	movq	%r15, %rcx
	cmovne	%rbp, %rcx
	testq	%r12, %r12
	movq	%rcx, (%rsp)
	movq	%r15, %rcx
	cmovne	%r12, %rcx
	testq	%r13, %r13
	movq	208(%rbx), %rdx
	movq	216(%rbx), %rax
	cmovne	%r13, %r15
	movq	%rdx, 192(%rbx)
	movq	%rax, 200(%rbx)
	movq	%rcx, 8(%rsp)
	movq	%r15, 16(%rsp)
	cmpq	%rdx, %rax
	ja	.L5548
	movl	48(%rbx), %r8d
	testl	%r8d, %r8d
	jne	.L5677
.L5549:
	vmovdqu	208(%rbx), %xmm6
	vmovdqu	%xmm6, 192(%rbx)
.L5563:
	movq	%r13, %rcx
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	stbi__pnm_info
	testl	%eax, %eax
	jne	.L5665
	movq	%r13, %rcx
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	stbi__hdr_info
	testl	%eax, %eax
	movl	%eax, (%rsp)
	jne	.L5665
	movq	%rbx, %rdi
	call	stbi__get8
	movq	%rbx, %rdi
	call	stbi__get8
	movzbl	%al, %r15d
	cmpl	$1, %r15d
	movl	(%rsp), %r8d
	jle	.L5576
.L5590:
	movq	208(%rbx), %rax
	movq	%rax, 192(%rbx)
	movq	216(%rbx), %rax
	movq	%rax, 200(%rbx)
	leaq	.LC343(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L5489
	.p2align 4,,10
	.p2align 3
.L5668:
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	leaq	56(%rbx), %r15
	movq	%r15, %rsi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	leaq	57(%rbx), %rcx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	testl	%eax, %eax
	jne	.L5495
	vmovq	%rcx, %xmm6
	vpunpcklqdq	%xmm6, %xmm6, %xmm0
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	movq	(%r14), %r15
	vmovdqu	%xmm0, 192(%rbx)
	jmp	.L5494
	.p2align 4,,10
	.p2align 3
.L5675:
	leaq	1(%rdx), %rsi
	movq	%rsi, 192(%rbx)
	movzbl	(%rdx), %edx
.L5521:
	cmpb	$66, %dl
	jne	.L5525
	cmpq	%rsi, %rax
	ja	.L5678
	movl	48(%rbx), %r9d
	testl	%r9d, %r9d
	je	.L5525
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	leaq	56(%rbx), %rsi
	movq	%rsi, (%rsp)
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	movq	(%rsp), %rsi
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	testl	%eax, %eax
	leaq	57(%rbx), %rcx
	jne	.L5528
	vmovq	%rcx, %xmm6
	vpunpcklqdq	%xmm6, %xmm6, %xmm0
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	vmovdqu	%xmm0, 192(%rbx)
	jmp	.L5525
	.p2align 4,,10
	.p2align 3
.L5495:
	cltq
	addq	%rax, %r15
	vmovq	%rcx, %xmm7
	vpinsrq	$1, %r15, %xmm7, %xmm0
	movzbl	56(%rbx), %edx
	movq	(%r14), %r15
	vmovdqu	%xmm0, 192(%rbx)
	jmp	.L5493
	.p2align 4,,10
	.p2align 3
.L5678:
	leaq	1(%rsi), %rax
	movq	%rax, 192(%rbx)
	movzbl	(%rsi), %edx
.L5527:
	cmpb	$77, %dl
	jne	.L5525
	movq	%r15, %rsi
	movq	%rbx, %rdi
	call	stbi__bmp_parse_header.part.0
	testq	%rax, %rax
	je	.L5523
	testq	%rbp, %rbp
	je	.L5532
	movl	(%rbx), %eax
	movl	%eax, 0(%rbp)
.L5532:
	testq	%r12, %r12
	je	.L5533
	movl	4(%rbx), %eax
	movl	%eax, (%r12)
.L5533:
	movl	$1, %r8d
	testq	%r13, %r13
	je	.L5489
	cmpl	$24, 32(%rsp)
	movl	56(%rsp), %eax
	je	.L5679
.L5535:
	cmpl	$1, %eax
	movl	$3, %eax
	sbbl	$-1, %eax
	movl	%eax, 0(%r13)
	movl	$1, %r8d
	jmp	.L5489
	.p2align 4,,10
	.p2align 3
.L5679:
	cmpl	$-16777216, %eax
	jne	.L5535
	movl	$3, 0(%r13)
	jmp	.L5489
.L5676:
	movq	%rbx, %rdi
	call	stbi__get16be
	cmpl	$1, %eax
	jne	.L5662
	movl	$6, %esi
	movq	%rbx, %rdi
	movl	%eax, 28(%rsp)
	call	stbi__skip.part.0
	movq	%rbx, %rdi
	call	stbi__get16be
	cmpl	$16, %eax
	movl	28(%rsp), %r8d
	ja	.L5662
	movq	%rbx, %rdi
	movl	%r8d, 28(%rsp)
	call	stbi__get32be
	movq	(%rsp), %rcx
	movq	%rbx, %rdi
	movl	%eax, (%rcx)
	call	stbi__get32be
	movq	8(%rsp), %rcx
	movq	%rbx, %rdi
	movl	%eax, (%rcx)
	call	stbi__get16be
	subl	$8, %eax
	andl	$-9, %eax
	movl	28(%rsp), %r8d
	jne	.L5662
	movq	%rbx, %rdi
	movl	%r8d, (%rsp)
	call	stbi__get16be
	cmpl	$3, %eax
	movl	(%rsp), %r8d
	jne	.L5662
	movq	16(%rsp), %rax
	movl	$4, (%rax)
	jmp	.L5489
	.p2align 4,,10
	.p2align 3
.L5522:
	leaq	56(%rbx), %rcx
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%rcx, %rsi
	movq	%rcx, (%rsp)
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	movq	(%rsp), %rcx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	testl	%eax, %eax
	leaq	57(%rbx), %rsi
	jne	.L5524
	vmovq	%rsi, %xmm7
	vpunpcklqdq	%xmm7, %xmm7, %xmm0
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	vmovdqu	%xmm0, 192(%rbx)
	jmp	.L5525
.L5576:
	movq	%rbx, %rdi
	movl	%r8d, (%rsp)
	call	stbi__get8
	cmpl	$1, %r15d
	movl	(%rsp), %r8d
	movl	%eax, %r14d
	je	.L5680
	andl	$-10, %eax
	cmpb	$2, %al
	jne	.L5590
	movl	$9, %esi
	movq	%rbx, %rdi
	movl	%r8d, (%rsp)
	call	stbi__skip.part.0
	movl	(%rsp), %r8d
	xorl	%r15d, %r15d
.L5582:
	movq	%rbx, %rdi
	movl	%r8d, 8(%rsp)
	call	stbi__get16le
	testl	%eax, %eax
	movl	%eax, (%rsp)
	movl	8(%rsp), %r8d
	jle	.L5590
	movq	%rbx, %rdi
	movl	%r8d, 8(%rsp)
	call	stbi__get16le
	testl	%eax, %eax
	movl	8(%rsp), %r8d
	jle	.L5590
	movq	%rbx, %rdi
	movl	%r8d, 28(%rsp)
	movl	%eax, 16(%rsp)
	call	stbi__get8
	movq	%rbx, %rdi
	movb	%al, 8(%rsp)
	call	stbi__get8
	testl	%r15d, %r15d
	movzbl	8(%rsp), %edx
	movl	16(%rsp), %ecx
	movl	28(%rsp), %r8d
	je	.L5586
	subl	$8, %edx
	andb	$-9, %dl
	jne	.L5590
	cmpl	$16, %r15d
	jg	.L5588
	cmpl	$14, %r15d
	jg	.L5609
	movl	$1, %eax
	cmpl	$8, %r15d
	jne	.L5590
.L5589:
	testq	%rbp, %rbp
	je	.L5595
	movl	(%rsp), %esi
	movl	%esi, 0(%rbp)
.L5595:
	testq	%r12, %r12
	je	.L5596
	movl	%ecx, (%r12)
.L5596:
	testq	%r13, %r13
	je	.L5665
	movl	%eax, 0(%r13)
.L5665:
	movl	$1, %r8d
	jmp	.L5489
.L5548:
	leaq	1(%rdx), %rcx
	movq	%rcx, 192(%rbx)
	movzbl	(%rdx), %edx
.L5551:
	cmpb	$83, %dl
	jne	.L5549
	cmpq	%rcx, %rax
	ja	.L5552
	movl	48(%rbx), %edi
	testl	%edi, %edi
	je	.L5549
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	leaq	56(%rbx), %r15
	movq	%r15, %rsi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	leaq	57(%rbx), %rsi
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	testl	%eax, %eax
	je	.L5553
	cltq
	addq	%r15, %rax
	vmovq	%rsi, %xmm7
	vpinsrq	$1, %rax, %xmm7, %xmm0
	movzbl	56(%rbx), %edx
	vmovdqu	%xmm0, 192(%rbx)
.L5554:
	cmpb	$-128, %dl
	jne	.L5549
	cmpq	%rax, %rsi
	jb	.L5555
	movl	48(%rbx), %esi
	testl	%esi, %esi
	je	.L5549
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	leaq	56(%rbx), %r15
	movq	%r15, %rsi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	leaq	57(%rbx), %rdx
	testl	%eax, %eax
	je	.L5556
	cltq
	addq	%r15, %rax
	vmovq	%rdx, %xmm7
	vpinsrq	$1, %rax, %xmm7, %xmm0
	movzbl	56(%rbx), %ecx
	vmovdqu	%xmm0, 192(%rbx)
.L5557:
	cmpb	$-10, %cl
	jne	.L5549
	cmpq	%rax, %rdx
	jb	.L5681
	movl	48(%rbx), %ecx
	testl	%ecx, %ecx
	je	.L5549
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	leaq	56(%rbx), %r15
	movq	%r15, %rsi
	call	*16(%rbx)
	movslq	%eax, %rdx
	movq	192(%rbx), %rax
	subq	208(%rbx), %rax
	addl	%eax, 184(%rbx)
	leaq	57(%rbx), %rax
	vmovq	%rax, %xmm0
	testl	%edx, %edx
	jne	.L5560
	vpunpcklqdq	%xmm0, %xmm0, %xmm0
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	vmovdqu	%xmm0, 192(%rbx)
	jmp	.L5549
.L5552:
	leaq	1(%rcx), %rsi
	movq	%rsi, 192(%rbx)
	movzbl	(%rcx), %edx
	jmp	.L5554
.L5555:
	leaq	1(%rsi), %rdx
	movq	%rdx, 192(%rbx)
	movzbl	(%rsi), %ecx
	jmp	.L5557
.L5681:
	leaq	1(%rdx), %rax
	movq	%rax, 192(%rbx)
	movzbl	(%rdx), %eax
.L5559:
	cmpb	$52, %al
	jne	.L5549
	movl	$88, %esi
	movq	%rbx, %rdi
	call	stbi__skip.part.0
	movq	%rbx, %rdi
	call	stbi__get16be
	movq	(%rsp), %rcx
	movq	%rbx, %rdi
	movl	%eax, (%rcx)
	call	stbi__get16be
	movq	8(%rsp), %rcx
	cmpq	$0, 16(%rbx)
	movl	%eax, (%rcx)
	je	.L5561
	movq	40(%rbx), %rdi
	call	*32(%rbx)
	testl	%eax, %eax
	je	.L5562
	movl	48(%rbx), %edx
	testl	%edx, %edx
	je	.L5549
.L5561:
	movq	200(%rbx), %rax
	cmpq	%rax, 192(%rbx)
	jnb	.L5549
.L5562:
	movq	(%rsp), %rax
	movl	(%rax), %ecx
	testl	%ecx, %ecx
	je	.L5565
	movl	$268435456, %eax
	cltd
	idivl	%ecx
	movq	8(%rsp), %rcx
	cmpl	(%rcx), %eax
	jl	.L5663
.L5565:
	movl	$8, %esi
	movq	%rbx, %rdi
	call	stbi__skip.part.0
	movl	$10, 8(%rsp)
.L5566:
	movq	%rbx, %rdi
	call	stbi__get8
	movq	%rbx, %rdi
	movl	%eax, %r15d
	call	stbi__get8
	movq	%rbx, %rdi
	movb	%al, (%rsp)
	call	stbi__get8
	movq	%rbx, %rdi
	call	stbi__get8
	movzbl	%al, %eax
	orl	%eax, %r14d
	cmpq	$0, 16(%rbx)
	je	.L5570
	movq	40(%rbx), %rdi
	call	*32(%rbx)
	testl	%eax, %eax
	je	.L5569
	movl	48(%rbx), %eax
	testl	%eax, %eax
	je	.L5549
.L5570:
	movq	200(%rbx), %rax
	cmpq	%rax, 192(%rbx)
	jnb	.L5549
.L5569:
	cmpb	$8, (%rsp)
	jne	.L5663
	testb	%r15b, %r15b
	je	.L5682
	decl	8(%rsp)
	jne	.L5566
	jmp	.L5563
.L5524:
	cltq
	addq	%rcx, %rax
	vmovq	%rsi, %xmm7
	vpinsrq	$1, %rax, %xmm7, %xmm0
	movzbl	56(%rbx), %edx
	vmovdqu	%xmm0, 192(%rbx)
	jmp	.L5521
.L5528:
	cltq
	addq	%rax, %rsi
	vmovq	%rcx, %xmm7
	vpinsrq	$1, %rsi, %xmm7, %xmm0
	movzbl	56(%rbx), %edx
	vmovdqu	%xmm0, 192(%rbx)
	jmp	.L5527
.L5677:
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	leaq	56(%rbx), %r15
	movq	%r15, %rsi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	leaq	57(%rbx), %rcx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	testl	%eax, %eax
	je	.L5550
	cltq
	addq	%r15, %rax
	vmovq	%rcx, %xmm7
	vpinsrq	$1, %rax, %xmm7, %xmm0
	movzbl	56(%rbx), %edx
	vmovdqu	%xmm0, 192(%rbx)
	jmp	.L5551
.L5663:
	vmovdqu	208(%rbx), %xmm7
	vmovdqu	%xmm7, 192(%rbx)
	jmp	.L5563
.L5550:
	vmovq	%rcx, %xmm6
	vpunpcklqdq	%xmm6, %xmm6, %xmm0
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	vmovdqu	%xmm0, 192(%rbx)
	jmp	.L5549
.L5553:
	vmovq	%rsi, %xmm6
	vpunpcklqdq	%xmm6, %xmm6, %xmm0
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	vmovdqu	%xmm0, 192(%rbx)
	jmp	.L5549
.L5556:
	vmovq	%rdx, %xmm6
	vpunpcklqdq	%xmm6, %xmm6, %xmm0
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	vmovdqu	%xmm0, 192(%rbx)
	jmp	.L5549
.L5560:
	addq	%rdx, %r15
	vpinsrq	$1, %r15, %xmm0, %xmm0
	movzbl	56(%rbx), %eax
	vmovdqu	%xmm0, 192(%rbx)
	jmp	.L5559
.L5680:
	andl	$-9, %eax
	decb	%al
	jne	.L5590
	movl	$4, %esi
	movq	%rbx, %rdi
	movl	%r8d, (%rsp)
	call	stbi__skip.part.0
	movq	%rbx, %rdi
	call	stbi__get8
	cmpb	$32, %al
	movl	(%rsp), %r8d
	movzbl	%al, %r15d
	ja	.L5590
	movabsq	$-4311843073, %rdx
	sarx	%rax, %rdx, %rax
	testb	$1, %al
	jne	.L5590
	movl	$4, %esi
	movq	%rbx, %rdi
	movl	%r8d, (%rsp)
	call	stbi__skip.part.0
	movl	(%rsp), %r8d
	jmp	.L5582
.L5682:
	andl	$16, %r14d
	cmpl	$1, %r14d
	movq	16(%rsp), %rcx
	sbbl	%eax, %eax
	addl	$4, %eax
	movl	%eax, (%rcx)
	movl	$1, %r8d
	jmp	.L5489
.L5666:
	leaq	.LC23(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L5491
.L5670:
	call	__stack_chk_fail@PLT
.L5586:
	leal	-8(%rdx), %eax
	cmpb	$24, %al
	ja	.L5590
	leaq	.L5592(%rip), %rsi
	movzbl	%al, %eax
	movslq	(%rsi,%rax,4), %rax
	addq	%rsi, %rax
	notrack jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L5592:
	.long	.L5594-.L5592
	.long	.L5590-.L5592
	.long	.L5590-.L5592
	.long	.L5590-.L5592
	.long	.L5590-.L5592
	.long	.L5590-.L5592
	.long	.L5590-.L5592
	.long	.L5609-.L5592
	.long	.L5593-.L5592
	.long	.L5590-.L5592
	.long	.L5590-.L5592
	.long	.L5590-.L5592
	.long	.L5590-.L5592
	.long	.L5590-.L5592
	.long	.L5590-.L5592
	.long	.L5590-.L5592
	.long	.L5591-.L5592
	.long	.L5590-.L5592
	.long	.L5590-.L5592
	.long	.L5590-.L5592
	.long	.L5590-.L5592
	.long	.L5590-.L5592
	.long	.L5590-.L5592
	.long	.L5590-.L5592
	.long	.L5591-.L5592
	.text
.L5671:
	leaq	.LC23(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	movq	192(%rbx), %rdx
	movq	200(%rbx), %rax
	jmp	.L5516
.L5591:
	movzbl	%dl, %eax
	sarl	$3, %eax
	jmp	.L5589
.L5593:
	andl	$-9, %r14d
	xorl	%edx, %edx
	cmpb	$3, %r14b
	sete	%dl
	movl	$3, %eax
	subl	%edx, %eax
	jmp	.L5589
.L5594:
	movl	$1, %eax
	jmp	.L5589
.L5609:
	movl	$3, %eax
	jmp	.L5589
.L5588:
	leal	-24(%r15), %eax
	andl	$-9, %eax
	jne	.L5590
	movl	%r15d, %eax
	sarl	$3, %eax
	jmp	.L5589
	.cfi_endproc
.LFE775:
	.size	stbi__info_main, .-stbi__info_main
	.section	.rodata.str1.1
.LC345:
	.string	"bad Image Descriptor"
.LC346:
	.string	"missing color table"
.LC363:
	.string	"no clear code"
.LC364:
	.string	"too many codes"
.LC365:
	.string	"illegal code in raster"
.LC366:
	.string	"unknown code"
	.text
	.p2align 4
	.type	stbi__gif_load_next.constprop.0, @function
stbi__gif_load_next.constprop.0:
.LFB896:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	movq	%rsi, %r12
	pushq	%rbx
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	andq	$-32, %rsp
	subq	$96, %rsp
	movq	8(%rsi), %r13
	testq	%r13, %r13
	je	.L5819
	movl	(%rsi), %edx
	movl	$2, %eax
	sarx	%eax, 48(%rsi), %eax
	andl	$7, %eax
	imull	4(%rsi), %edx
	cmpl	$3, %eax
	jne	.L5695
	movq	%rcx, %rsi
	testq	%rcx, %rcx
	jne	.L5692
.L5698:
	movslq	%edx, %rcx
	xorl	%eax, %eax
	testl	%edx, %edx
	jg	.L5700
	jmp	.L5694
	.p2align 4,,10
	.p2align 3
.L5699:
	incq	%rax
	cmpq	%rcx, %rax
	je	.L5815
.L5700:
	movq	24(%r12), %rdx
	cmpb	$0, (%rdx,%rax)
	je	.L5699
	movq	16(%r12), %rsi
	leal	0(,%rax,4), %edx
	movslq	%edx, %rdx
	movl	(%rsi,%rdx), %esi
	incq	%rax
	movl	%esi, 0(%r13,%rdx)
	movq	8(%r12), %r13
	cmpq	%rcx, %rax
	jne	.L5700
.L5815:
	movl	(%r12), %edx
	imull	4(%r12), %edx
	jmp	.L5694
	.p2align 4,,10
	.p2align 3
.L5692:
	cmpl	$3, %eax
	jne	.L5695
	testl	%edx, %edx
	jle	.L5694
	movslq	%edx, %rdx
	xorl	%eax, %eax
	jmp	.L5697
	.p2align 4,,10
	.p2align 3
.L5696:
	incq	%rax
	cmpq	%rdx, %rax
	je	.L5815
.L5697:
	movq	24(%r12), %rcx
	cmpb	$0, (%rcx,%rax)
	je	.L5696
	leal	0(,%rax,4), %ecx
	movslq	%ecx, %rcx
	movl	(%rsi,%rcx), %edi
	movl	%edi, 0(%r13,%rcx)
	movq	8(%r12), %r13
	jmp	.L5696
	.p2align 4,,10
	.p2align 3
.L5695:
	cmpl	$2, %eax
	je	.L5698
.L5694:
	movq	16(%r12), %rdi
	sall	$2, %edx
	movslq	%edx, %rdx
	movq	%r13, %rsi
	call	memcpy@PLT
	movl	4(%r12), %edx
	movl	$0, 60(%rsp)
	imull	(%r12), %edx
	movq	24(%r12), %rdi
	movslq	%edx, %rdx
.L5691:
	xorl	%esi, %esi
	call	memset@PLT
	movq	192(%rbx), %rax
	movq	200(%rbx), %rdx
	leaq	56(%rbx), %r14
	leaq	57(%rbx), %r13
.L5701:
	cmpq	%rdx, %rax
	jb	.L5820
	movl	48(%rbx), %edi
	testl	%edi, %edi
	jne	.L5821
.L5704:
	leaq	.LC366(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%r13d, %r13d
.L5683:
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	movq	%r13, %rax
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L5820:
	.cfi_restore_state
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rbx)
	movzbl	(%rax), %edx
.L5703:
	cmpb	$44, %dl
	je	.L5706
	cmpb	$59, %dl
	jne	.L5822
	movq	%rbx, %r13
	jmp	.L5683
	.p2align 4,,10
	.p2align 3
.L5822:
	cmpb	$33, %dl
	jne	.L5704
	movq	%rbx, %rdi
	call	stbi__get8
	cmpb	$-7, %al
	je	.L5823
.L5817:
	movq	192(%rbx), %rax
	movq	200(%rbx), %rdx
.L5755:
	cmpq	%rdx, %rax
	jb	.L5824
	movl	48(%rbx), %ecx
	testl	%ecx, %ecx
	je	.L5701
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%r14, %rsi
	call	*16(%rbx)
	movslq	%eax, %rdx
	movq	192(%rbx), %rax
	subq	208(%rbx), %rax
	addl	%eax, 184(%rbx)
	movq	%r13, %rax
	testl	%edx, %edx
	jne	.L5762
	vmovq	%r13, %xmm6
	vpunpcklqdq	%xmm6, %xmm6, %xmm0
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	vmovdqu	%xmm0, 192(%rbx)
	movq	%r13, %rdx
	jmp	.L5701
	.p2align 4,,10
	.p2align 3
.L5824:
	leaq	1(%rax), %rcx
	movq	%rcx, 192(%rbx)
	movzbl	(%rax), %eax
	movzbl	%al, %esi
.L5761:
	testl	%esi, %esi
	je	.L5825
	cmpq	$0, 16(%rbx)
	je	.L5758
	movq	%rdx, %rdi
	subq	%rcx, %rdi
	cmpl	%esi, %edi
	jl	.L5826
.L5758:
	addq	%rcx, %rax
	movq	%rax, 192(%rbx)
	jmp	.L5755
	.p2align 4,,10
	.p2align 3
.L5826:
	movq	%rdx, 192(%rbx)
	subl	%edi, %esi
	movq	40(%rbx), %rdi
	call	*24(%rbx)
	jmp	.L5817
	.p2align 4,,10
	.p2align 3
.L5706:
	movq	%rbx, %rdi
	call	stbi__get16le
	movq	%rbx, %rdi
	movl	%eax, %r13d
	call	stbi__get16le
	movq	%rbx, %rdi
	movl	%eax, %r15d
	call	stbi__get16le
	movq	%rbx, %rdi
	movl	%eax, %r14d
	call	stbi__get16le
	movl	(%r12), %ecx
	leal	0(%r13,%r14), %edx
	cmpl	%ecx, %edx
	jg	.L5708
	leal	(%r15,%rax), %edx
	cmpl	4(%r12), %edx
	jg	.L5708
	sall	$2, %ecx
	movl	%r15d, %esi
	imull	%ecx, %esi
	imull	%ecx, %eax
	leal	0(,%r13,4), %edx
	leal	(%rdx,%r14,4), %edi
	addl	%esi, %eax
	vmovd	%edi, %xmm1
	testl	%r14d, %r14d
	vpinsrd	$1, %eax, %xmm1, %xmm1
	cmovne	%esi, %eax
	vmovd	%edx, %xmm7
	movl	%edx, 34908(%r12)
	vpinsrd	$1, %esi, %xmm7, %xmm0
	movl	%ecx, 34916(%r12)
	movl	%eax, 34912(%r12)
	vpunpcklqdq	%xmm1, %xmm0, %xmm0
	vmovdqu	%xmm0, 34892(%r12)
	movq	%rbx, %rdi
	call	stbi__get8
	movzbl	%al, %edx
	movl	%edx, 34888(%r12)
	testb	$64, %al
	jne	.L5827
	movl	34916(%r12), %edx
	vpxor	%xmm0, %xmm0, %xmm0
.L5712:
	vpinsrd	$1, %edx, %xmm0, %xmm0
	vmovq	%xmm0, 34880(%r12)
	testb	%al, %al
	jns	.L5713
	movl	$-1, %ecx
	testb	$1, 48(%r12)
	je	.L5714
	movl	44(%r12), %ecx
.L5714:
	leaq	1076(%r12), %r13
	andl	$7, %eax
	movl	$2, %edx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	shlx	%eax, %edx, %edx
	call	stbi__gif_parse_colortable
.L5715:
	movq	%r13, 34872(%r12)
	movq	%rbx, %rdi
	call	stbi__get8
	cmpb	$12, %al
	ja	.L5818
	movzbl	%al, %ecx
	leal	1(%rcx), %edi
	movl	$1, %edx
	shlx	%eax, %edx, %eax
	movl	%edi, 68(%rsp)
	shlx	%edi, %edx, %edx
	leal	-1(%rdx), %edi
	movl	%eax, 88(%rsp)
	movl	%edi, 64(%rsp)
	movl	%eax, %edi
	leal	-1(%rax), %eax
	cmpl	$30, %eax
	jbe	.L5766
	shrl	$5, %edi
	movl	%edi, %edx
	decl	%edx
	salq	$7, %rdx
	vmovdqa	.LC344(%rip), %ymm3
	vmovdqa	.LC347(%rip), %ymm11
	vmovdqa	.LC348(%rip), %ymm10
	vmovdqa	.LC19(%rip), %ymm1
	vmovdqa	.LC349(%rip), %ymm9
	vmovdqa	.LC350(%rip), %ymm8
	vmovdqa	.LC2(%rip), %ymm2
	vmovdqa	.LC351(%rip), %ymm7
	vmovdqa	.LC352(%rip), %ymm6
	vmovdqa	.LC353(%rip), %ymm5
	vmovdqa	.LC354(%rip), %ymm4
	leaq	2102(%r12), %rax
	leaq	2230(%r12,%rdx), %rdx
.L5719:
	vmovdqa	%ymm3, %ymm13
	vpaddd	%ymm10, %ymm13, %ymm12
	vpand	%ymm13, %ymm1, %ymm0
	vpand	%ymm12, %ymm1, %ymm12
	vpackusdw	%ymm12, %ymm0, %ymm0
	vpaddd	%ymm9, %ymm13, %ymm14
	vpaddd	%ymm8, %ymm13, %ymm12
	vpand	%ymm12, %ymm1, %ymm12
	vpand	%ymm14, %ymm1, %ymm14
	vpackusdw	%ymm12, %ymm14, %ymm14
	vpermq	$216, %ymm0, %ymm0
	vpermq	$216, %ymm14, %ymm14
	vpand	%ymm0, %ymm2, %ymm12
	vpand	%ymm14, %ymm2, %ymm14
	vpackuswb	%ymm14, %ymm12, %ymm12
	vpaddd	%ymm7, %ymm13, %ymm0
	vpaddd	%ymm6, %ymm13, %ymm14
	vpand	%ymm14, %ymm1, %ymm14
	vpand	%ymm0, %ymm1, %ymm0
	vpackusdw	%ymm14, %ymm0, %ymm0
	vpaddd	%ymm5, %ymm13, %ymm14
	vpaddd	%ymm4, %ymm13, %ymm13
	vpand	%ymm14, %ymm1, %ymm14
	vpand	%ymm13, %ymm1, %ymm13
	vpackusdw	%ymm13, %ymm14, %ymm13
	movl	$-1, %ecx
	movl	$-1, %esi
	vpermq	$216, %ymm0, %ymm0
	vpermq	$216, %ymm13, %ymm13
	movw	%cx, -2(%rax)
	movw	%si, 2(%rax)
	movl	$-1, %edi
	movl	$-1, %r8d
	movl	$-1, %r9d
	movl	$-1, %r10d
	movl	$-1, %r11d
	movl	$-1, %r13d
	movl	$-1, %r14d
	movl	$-1, %r15d
	movl	$-1, %ecx
	movl	$-1, %esi
	vpand	%ymm0, %ymm2, %ymm0
	vpand	%ymm13, %ymm2, %ymm13
	movw	%di, 6(%rax)
	movw	%r8w, 10(%rax)
	movw	%r9w, 14(%rax)
	movw	%r10w, 18(%rax)
	movw	%r11w, 22(%rax)
	movw	%r13w, 26(%rax)
	movw	%r14w, 30(%rax)
	movw	%r15w, 34(%rax)
	movw	%cx, 38(%rax)
	movw	%si, 42(%rax)
	movl	$-1, %edi
	movl	$-1, %r8d
	movl	$-1, %r9d
	movl	$-1, %r10d
	movl	$-1, %r11d
	movl	$-1, %r13d
	movl	$-1, %r14d
	movl	$-1, %r15d
	movl	$-1, %ecx
	movl	$-1, %esi
	vpackuswb	%ymm13, %ymm0, %ymm0
	vpermq	$216, %ymm12, %ymm12
	vpermq	$216, %ymm0, %ymm0
	movw	%di, 46(%rax)
	movw	%r8w, 50(%rax)
	movw	%r9w, 54(%rax)
	movw	%r10w, 58(%rax)
	movw	%r11w, 62(%rax)
	movw	%r13w, 66(%rax)
	movw	%r14w, 70(%rax)
	movw	%r15w, 74(%rax)
	movw	%cx, 78(%rax)
	movw	%si, 82(%rax)
	movl	$-1, %edi
	movl	$-1, %r8d
	movl	$-1, %r9d
	movl	$-1, %r10d
	movl	$-1, %r11d
	movl	$-1, %r13d
	movl	$-1, %r14d
	movl	$-1, %r15d
	movl	$-1, %ecx
	movl	$-1, %esi
	movw	%di, 86(%rax)
	movw	%r8w, 90(%rax)
	movw	%r9w, 94(%rax)
	movw	%r10w, 98(%rax)
	movw	%r11w, 102(%rax)
	movw	%r13w, 106(%rax)
	movw	%r14w, 110(%rax)
	movw	%r15w, 114(%rax)
	movw	%cx, 118(%rax)
	movw	%si, 122(%rax)
	vpextrw	$0, %xmm12, (%rax)
	vpextrw	$1, %xmm12, 4(%rax)
	vpextrw	$2, %xmm12, 8(%rax)
	vpextrw	$3, %xmm12, 12(%rax)
	vpextrw	$4, %xmm12, 16(%rax)
	vpextrw	$5, %xmm12, 20(%rax)
	vpextrw	$6, %xmm12, 24(%rax)
	vpextrw	$7, %xmm12, 28(%rax)
	vpextrw	$0, %xmm0, 64(%rax)
	vextracti128	$0x1, %ymm12, %xmm12
	vpextrw	$1, %xmm0, 68(%rax)
	vpextrw	$2, %xmm0, 72(%rax)
	vpextrw	$3, %xmm0, 76(%rax)
	vpextrw	$4, %xmm0, 80(%rax)
	vpextrw	$5, %xmm0, 84(%rax)
	vpextrw	$6, %xmm0, 88(%rax)
	vpextrw	$7, %xmm0, 92(%rax)
	vextracti128	$0x1, %ymm0, %xmm0
	vpextrw	$0, %xmm12, 32(%rax)
	vpextrw	$1, %xmm12, 36(%rax)
	vpextrw	$2, %xmm12, 40(%rax)
	vpextrw	$3, %xmm12, 44(%rax)
	vpextrw	$4, %xmm12, 48(%rax)
	vpextrw	$5, %xmm12, 52(%rax)
	vpextrw	$6, %xmm12, 56(%rax)
	vpextrw	$7, %xmm12, 60(%rax)
	vpextrw	$0, %xmm0, 96(%rax)
	vpextrw	$1, %xmm0, 100(%rax)
	vpextrw	$2, %xmm0, 104(%rax)
	vpextrw	$3, %xmm0, 108(%rax)
	vpextrw	$4, %xmm0, 112(%rax)
	vpextrw	$5, %xmm0, 116(%rax)
	vpextrw	$6, %xmm0, 120(%rax)
	vpextrw	$7, %xmm0, 124(%rax)
	subq	$-128, %rax
	vpaddd	%ymm11, %ymm3, %ymm3
	cmpq	%rdx, %rax
	jne	.L5719
	movl	88(%rsp), %edi
	movl	%edi, %eax
	andl	$-32, %eax
	movl	%eax, %ecx
	cmpl	%eax, %edi
	je	.L5720
.L5718:
	movl	88(%rsp), %esi
	subl	%eax, %esi
	leal	-1(%rsi), %edx
	cmpl	$14, %edx
	jbe	.L5721
	vmovd	%ecx, %xmm7
	vpshufd	$0, %xmm7, %xmm3
	vmovdqa	.LC20(%rip), %xmm2
	vpaddd	.LC355(%rip), %xmm3, %xmm1
	vpaddd	.LC356(%rip), %xmm3, %xmm0
	vpand	%xmm1, %xmm2, %xmm1
	vpand	%xmm0, %xmm2, %xmm0
	vpaddd	.LC358(%rip), %xmm3, %xmm4
	vpackusdw	%xmm0, %xmm1, %xmm1
	vpaddd	.LC357(%rip), %xmm3, %xmm0
	vpand	%xmm4, %xmm2, %xmm4
	vpand	%xmm0, %xmm2, %xmm0
	vpackusdw	%xmm4, %xmm0, %xmm0
	vmovdqa	.LC5(%rip), %xmm4
	vpaddd	.LC360(%rip), %xmm3, %xmm5
	vpand	%xmm0, %xmm4, %xmm0
	vpand	%xmm1, %xmm4, %xmm1
	vpackuswb	%xmm0, %xmm1, %xmm1
	vpaddd	.LC359(%rip), %xmm3, %xmm0
	vpand	%xmm5, %xmm2, %xmm5
	vpand	%xmm0, %xmm2, %xmm0
	vpackusdw	%xmm5, %xmm0, %xmm0
	vpaddd	.LC361(%rip), %xmm3, %xmm5
	vpaddd	.LC362(%rip), %xmm3, %xmm3
	vpand	%xmm5, %xmm2, %xmm5
	vpand	%xmm3, %xmm2, %xmm2
	salq	$2, %rax
	vpackusdw	%xmm2, %xmm5, %xmm2
	leaq	2100(%r12,%rax), %rdx
	vpand	%xmm0, %xmm4, %xmm0
	movl	$-1, %edi
	movl	$-1, %r8d
	movl	$-1, %r9d
	movl	$-1, %r10d
	movl	$-1, %r11d
	movl	$-1, %r13d
	movl	$-1, %r14d
	movl	$-1, %r15d
	vpand	%xmm2, %xmm4, %xmm4
	movw	%di, (%rdx)
	movw	%r8w, 4(%rdx)
	movw	%r9w, 8(%rdx)
	movw	%r10w, 12(%rdx)
	movw	%r11w, 16(%rdx)
	movw	%r13w, 20(%rdx)
	movw	%r14w, 24(%rdx)
	movw	%r15w, 28(%rdx)
	vpackuswb	%xmm4, %xmm0, %xmm0
	movl	$-1, %edi
	movl	$-1, %r8d
	movl	$-1, %r9d
	movl	$-1, %r10d
	movl	$-1, %r11d
	movl	$-1, %r13d
	movl	$-1, %r14d
	movl	$-1, %r15d
	movw	%di, 32(%rdx)
	movw	%r8w, 36(%rdx)
	movw	%r9w, 40(%rdx)
	movw	%r10w, 44(%rdx)
	movw	%r11w, 48(%rdx)
	movw	%r13w, 52(%rdx)
	movw	%r14w, 56(%rdx)
	movw	%r15w, 60(%rdx)
	vpextrw	$0, %xmm1, 2102(%r12,%rax)
	vpextrw	$1, %xmm1, 2106(%r12,%rax)
	vpextrw	$2, %xmm1, 2110(%r12,%rax)
	vpextrw	$3, %xmm1, 2114(%r12,%rax)
	vpextrw	$4, %xmm1, 2118(%r12,%rax)
	vpextrw	$5, %xmm1, 2122(%r12,%rax)
	vpextrw	$6, %xmm1, 2126(%r12,%rax)
	vpextrw	$7, %xmm1, 2130(%r12,%rax)
	vpextrw	$0, %xmm0, 2134(%r12,%rax)
	vpextrw	$1, %xmm0, 2138(%r12,%rax)
	vpextrw	$2, %xmm0, 2142(%r12,%rax)
	vpextrw	$3, %xmm0, 2146(%r12,%rax)
	vpextrw	$4, %xmm0, 2150(%r12,%rax)
	vpextrw	$5, %xmm0, 2154(%r12,%rax)
	vpextrw	$6, %xmm0, 2158(%r12,%rax)
	vpextrw	$7, %xmm0, 2162(%r12,%rax)
	movl	%esi, %eax
	andl	$-16, %eax
	addl	%eax, %ecx
	cmpl	%eax, %esi
	je	.L5720
.L5721:
	xorl	%eax, %eax
	movslq	%ecx, %rsi
	movb	%cl, %al
	movb	%cl, %ah
	leaq	(%r12,%rsi,4), %r9
	movl	$-1, %r15d
	movl	88(%rsp), %r8d
	movw	%r15w, 2100(%r9)
	movw	%ax, 2102(%r12,%rsi,4)
	leal	1(%rcx), %eax
	cmpl	%eax, %r8d
	jle	.L5720
	xorl	%esi, %esi
	movb	%al, %sil
	movl	%esi, %edx
	movslq	%eax, %rdi
	movb	%al, %dh
	movl	$-1, %r14d
	leal	2(%rcx), %eax
	movw	%r14w, 2104(%r9)
	movw	%dx, 2102(%r12,%rdi,4)
	cmpl	%eax, %r8d
	jle	.L5720
	xorl	%esi, %esi
	movb	%al, %sil
	movl	%esi, %edx
	movslq	%eax, %rdi
	movb	%al, %dh
	movl	$-1, %r13d
	leal	3(%rcx), %eax
	movw	%r13w, 2108(%r9)
	movw	%dx, 2102(%r12,%rdi,4)
	cmpl	%eax, %r8d
	jle	.L5720
	xorl	%esi, %esi
	movb	%al, %sil
	movl	%esi, %edx
	movslq	%eax, %rdi
	movb	%al, %dh
	movl	$-1, %r11d
	leal	4(%rcx), %eax
	movw	%r11w, 2112(%r9)
	movw	%dx, 2102(%r12,%rdi,4)
	cmpl	%r8d, %eax
	jge	.L5720
	xorl	%esi, %esi
	movb	%al, %sil
	movl	%esi, %edx
	movslq	%eax, %rdi
	movb	%al, %dh
	movl	$-1, %r10d
	leal	5(%rcx), %eax
	movw	%r10w, 2116(%r9)
	movw	%dx, 2102(%r12,%rdi,4)
	cmpl	%eax, %r8d
	jle	.L5720
	xorl	%esi, %esi
	movb	%al, %sil
	movl	$-1, %edi
	movl	%esi, %edx
	movw	%di, 2120(%r9)
	movb	%al, %dh
	movslq	%eax, %rdi
	leal	6(%rcx), %eax
	movw	%dx, 2102(%r12,%rdi,4)
	cmpl	%r8d, %eax
	jge	.L5720
	movl	$-1, %esi
	movw	%si, 2124(%r9)
	xorl	%esi, %esi
	movb	%al, %sil
	movl	%esi, %edx
	movslq	%eax, %rdi
	movb	%al, %dh
	leal	7(%rcx), %eax
	movw	%dx, 2102(%r12,%rdi,4)
	cmpl	%eax, %r8d
	jle	.L5720
	xorl	%esi, %esi
	movl	$-1, %edx
	movb	%al, %sil
	movw	%dx, 2128(%r9)
	movl	%esi, %edx
	movslq	%eax, %rdi
	movb	%al, %dh
	leal	8(%rcx), %eax
	movw	%dx, 2102(%r12,%rdi,4)
	cmpl	%eax, %r8d
	jle	.L5720
	xorl	%esi, %esi
	movb	%al, %sil
	movl	%esi, %edx
	movslq	%eax, %rdi
	movb	%al, %dh
	leal	9(%rcx), %eax
	movw	$-1, 2132(%r9)
	movw	%dx, 2102(%r12,%rdi,4)
	cmpl	%eax, %r8d
	jle	.L5720
	xorl	%esi, %esi
	movb	%al, %sil
	movl	%esi, %edx
	movslq	%eax, %rdi
	movb	%al, %dh
	leal	10(%rcx), %eax
	movw	$-1, 2136(%r9)
	movw	%dx, 2102(%r12,%rdi,4)
	cmpl	%eax, %r8d
	jle	.L5720
	xorl	%esi, %esi
	movb	%al, %sil
	movl	%esi, %edx
	movslq	%eax, %rdi
	movb	%al, %dh
	leal	11(%rcx), %eax
	movw	$-1, 2140(%r9)
	movw	%dx, 2102(%r12,%rdi,4)
	cmpl	%eax, %r8d
	jle	.L5720
	xorl	%esi, %esi
	movb	%al, %sil
	movl	%esi, %edx
	movslq	%eax, %rdi
	movb	%al, %dh
	leal	12(%rcx), %eax
	movw	$-1, 2144(%r9)
	movw	%dx, 2102(%r12,%rdi,4)
	cmpl	%eax, %r8d
	jle	.L5720
	xorl	%esi, %esi
	movb	%al, %sil
	movl	%esi, %edx
	movslq	%eax, %rdi
	movb	%al, %dh
	leal	13(%rcx), %eax
	movw	$-1, 2148(%r9)
	movw	%dx, 2102(%r12,%rdi,4)
	cmpl	%eax, %r8d
	jle	.L5720
	xorl	%esi, %esi
	movb	%al, %sil
	movl	%esi, %edx
	movslq	%eax, %rdi
	movb	%al, %dh
	addl	$14, %ecx
	movw	$-1, 2152(%r9)
	movw	%dx, 2102(%r12,%rdi,4)
	cmpl	%ecx, %r8d
	jle	.L5720
	xorl	%eax, %eax
	movb	%cl, %al
	movslq	%ecx, %rdx
	movb	%cl, %ah
	movw	$-1, 2156(%r9)
	movw	%ax, 2102(%r12,%rdx,4)
	.p2align 4,,10
	.p2align 3
.L5720:
	movl	88(%rsp), %edi
	movl	64(%rsp), %r14d
	leal	2(%rdi), %eax
	movl	%eax, %r8d
	movl	%eax, 56(%rsp)
	leal	1(%rdi), %eax
	movl	68(%rsp), %ecx
	movl	%eax, 72(%rsp)
	movl	$1, 76(%rsp)
	leaq	57(%rbx), %rax
	xorl	%r15d, %r15d
	movl	%r14d, %edi
	movq	%rax, 48(%rsp)
	movq	%r12, %rax
	movl	%ecx, %r14d
	movl	%r15d, %r12d
	xorl	%r13d, %r13d
	movslq	%r8d, %r15
	xorl	%r9d, %r9d
	movq	$-1, %r11
	movq	%rax, %r8
	movl	%edi, %ecx
	.p2align 4,,10
	.p2align 3
.L5723:
	cmpl	%r13d, %r14d
	jle	.L5724
	movq	192(%rbx), %rdx
	movq	200(%rbx), %rax
	testl	%r12d, %r12d
	jne	.L5725
	cmpq	%rax, %rdx
	jb	.L5828
	movl	48(%rbx), %eax
	testl	%eax, %eax
	jne	.L5728
.L5811:
	movq	%r8, %r12
	vzeroupper
.L5816:
	movq	8(%r12), %r13
	testq	%r13, %r13
	je	.L5818
	movl	60(%rsp), %edi
	testl	%edi, %edi
	je	.L5683
	movl	36(%r12), %esi
	testl	%esi, %esi
	jle	.L5683
	movl	(%r12), %ecx
	imull	4(%r12), %ecx
	testl	%ecx, %ecx
	jle	.L5683
	movslq	%ecx, %rcx
	xorl	%eax, %eax
	jmp	.L5750
	.p2align 4,,10
	.p2align 3
.L5749:
	incq	%rax
	cmpq	%rax, %rcx
	je	.L5683
.L5750:
	movq	24(%r12), %rdx
	cmpb	$0, (%rdx,%rax)
	jne	.L5749
	movslq	36(%r12), %rdx
	movb	$-1, 55(%r12,%rdx,4)
	movl	52(%r12,%rdx,4), %edi
	movq	8(%r12), %rsi
	leal	0(,%rax,4), %edx
	movslq	%edx, %rdx
	movl	%edi, (%rsi,%rdx)
	jmp	.L5749
	.p2align 4,,10
	.p2align 3
.L5823:
	movq	%rbx, %rdi
	call	stbi__get8
	movzbl	%al, %edx
	cmpb	$4, %al
	je	.L5829
	testl	%edx, %edx
	je	.L5756
	movzbl	%al, %esi
	movq	%rbx, %rdi
	call	stbi__skip.part.0
	movq	192(%rbx), %rax
	movq	200(%rbx), %rdx
	jmp	.L5701
	.p2align 4,,10
	.p2align 3
.L5762:
	movzbl	56(%rbx), %eax
	addq	%r14, %rdx
	vmovq	%r13, %xmm6
	vpinsrq	$1, %rdx, %xmm6, %xmm0
	movzbl	%al, %esi
	vmovdqu	%xmm0, 192(%rbx)
	movq	%r13, %rcx
	jmp	.L5761
	.p2align 4,,10
	.p2align 3
.L5827:
	movl	34916(%r12), %edi
	leal	0(,%rdi,8), %edx
	movl	$3, %edi
	vmovd	%edi, %xmm0
	jmp	.L5712
	.p2align 4,,10
	.p2align 3
.L5724:
	movl	%r9d, %r10d
	andl	%ecx, %r10d
	subl	%r14d, %r13d
	sarx	%r14d, %r9d, %r9d
	cmpl	%r10d, 88(%rsp)
	je	.L5767
	cmpl	72(%rsp), %r10d
	je	.L5830
	cmpl	%r15d, %r10d
	jg	.L5743
	movl	76(%rsp), %eax
	testl	%eax, %eax
	jne	.L5831
	testl	%r11d, %r11d
	js	.L5745
	leal	1(%r15), %eax
	cmpl	$8192, %eax
	jg	.L5832
	leaq	(%r8,%r15,4), %rdx
	movw	%r11w, 2100(%rdx)
	movzbl	2102(%r8,%r11,4), %esi
	movb	%sil, 2102(%rdx)
	cmpl	%eax, %r10d
	je	.L5747
	movslq	%r10d, %rsi
	movzbl	2102(%r8,%rsi,4), %esi
.L5747:
	movb	%sil, 2103(%rdx)
	movslq	%eax, %r15
.L5748:
	movzwl	%r10w, %esi
	movq	%r8, %rdi
	movl	%ecx, 80(%rsp)
	call	stbi__out_gif_code
	movl	80(%rsp), %ecx
	testl	%r15d, %ecx
	jne	.L5768
	cmpl	$4095, %r15d
	jle	.L5833
.L5768:
	movslq	%r10d, %r11
	jmp	.L5723
	.p2align 4,,10
	.p2align 3
.L5828:
	leaq	1(%rdx), %rsi
	movq	%rsi, 192(%rbx)
	movzbl	(%rdx), %r12d
	movq	%rsi, %rdx
.L5727:
	testl	%r12d, %r12d
	je	.L5811
.L5725:
	decl	%r12d
	cmpq	%rax, %rdx
	jb	.L5834
	movl	48(%rbx), %eax
	testl	%eax, %eax
	jne	.L5835
.L5733:
	addl	$8, %r13d
	jmp	.L5723
	.p2align 4,,10
	.p2align 3
.L5767:
	movl	$0, 76(%rsp)
	movslq	56(%rsp), %r15
	movl	64(%rsp), %ecx
	movl	68(%rsp), %r14d
	movq	$-1, %r11
	jmp	.L5723
	.p2align 4,,10
	.p2align 3
.L5834:
	leaq	1(%rdx), %rax
	movq	%rax, 192(%rbx)
	movzbl	(%rdx), %eax
	shlx	%r13d, %eax, %eax
	orl	%eax, %r9d
	jmp	.L5733
	.p2align 4,,10
	.p2align 3
.L5745:
	cmpl	%r15d, %r10d
	jne	.L5748
.L5743:
	leaq	.LC365(%rip), %rax
	xorl	%r13d, %r13d
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	vzeroupper
	jmp	.L5683
	.p2align 4,,10
	.p2align 3
.L5833:
	incl	%r14d
	movl	$1, %eax
	shlx	%r14d, %eax, %ecx
	movslq	%r10d, %r11
	decl	%ecx
	jmp	.L5723
	.p2align 4,,10
	.p2align 3
.L5835:
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	leaq	56(%rbx), %rsi
	movq	%r8, 24(%rsp)
	movl	%r11d, 32(%rsp)
	movl	%ecx, 40(%rsp)
	movl	%r9d, 44(%rsp)
	movq	%rsi, 80(%rsp)
	vzeroupper
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	movq	80(%rsp), %rsi
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	testl	%eax, %eax
	movl	44(%rsp), %r9d
	movl	40(%rsp), %ecx
	movslq	32(%rsp), %r11
	movq	24(%rsp), %r8
	jne	.L5734
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	movq	48(%rsp), %rsi
.L5735:
	vmovq	48(%rsp), %xmm6
	vpinsrq	$1, %rsi, %xmm6, %xmm0
	vmovdqu	%xmm0, 192(%rbx)
	jmp	.L5733
	.p2align 4,,10
	.p2align 3
.L5819:
	xorl	%ecx, %ecx
	call	stbi__gif_header
	testl	%eax, %eax
	je	.L5818
	movl	(%r12), %esi
	movl	4(%r12), %ecx
	testl	%esi, %esi
	js	.L5687
	je	.L5688
	movl	$2147483647, %eax
	cltd
	idivl	%esi
	cmpl	$3, %eax
	jle	.L5687
.L5688:
	testl	%ecx, %ecx
	js	.L5687
	je	.L5689
	movl	$2147483647, %eax
	cltd
	idivl	%ecx
	leal	0(,%rsi,4), %edi
	cmpl	%eax, %edi
	jle	.L5689
	.p2align 4,,10
	.p2align 3
.L5687:
	leaq	.LC203(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L5683
	.p2align 4,,10
	.p2align 3
.L5728:
	leaq	56(%rbx), %r12
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%r12, %rsi
	movq	%r8, 32(%rsp)
	movl	%r11d, 40(%rsp)
	movl	%ecx, 44(%rsp)
	movl	%r9d, 80(%rsp)
	vzeroupper
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	movl	80(%rsp), %r9d
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	testl	%eax, %eax
	movq	48(%rsp), %rdx
	movl	44(%rsp), %ecx
	movslq	40(%rsp), %r11
	movq	32(%rsp), %r8
	jne	.L5730
	vmovddup	48(%rsp), %xmm0
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	movq	%r8, %r12
	vmovdqu	%xmm0, 192(%rbx)
	jmp	.L5816
	.p2align 4,,10
	.p2align 3
.L5734:
	cltq
	addq	%rax, %rsi
	movzbl	56(%rbx), %eax
	shlx	%r13d, %eax, %eax
	orl	%eax, %r9d
	jmp	.L5735
	.p2align 4,,10
	.p2align 3
.L5821:
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%r14, %rsi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	testl	%eax, %eax
	jne	.L5705
	vmovq	%r13, %xmm6
	vpunpcklqdq	%xmm6, %xmm6, %xmm0
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	vmovdqu	%xmm0, 192(%rbx)
	jmp	.L5704
	.p2align 4,,10
	.p2align 3
.L5708:
	leaq	.LC345(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
.L5818:
	xorl	%r13d, %r13d
	jmp	.L5683
	.p2align 4,,10
	.p2align 3
.L5713:
	testb	$-128, 32(%r12)
	je	.L5716
	leaq	52(%r12), %r13
	jmp	.L5715
	.p2align 4,,10
	.p2align 3
.L5730:
	cltq
	addq	%r12, %rax
	vmovq	%rdx, %xmm7
	vpinsrq	$1, %rax, %xmm7, %xmm0
	movzbl	56(%rbx), %r12d
	vmovdqu	%xmm0, 192(%rbx)
	jmp	.L5727
	.p2align 4,,10
	.p2align 3
.L5705:
	cltq
	addq	%r14, %rax
	vmovq	%r13, %xmm6
	vpinsrq	$1, %rax, %xmm6, %xmm0
	movzbl	56(%rbx), %edx
	vmovdqu	%xmm0, 192(%rbx)
	jmp	.L5703
.L5689:
	imull	%esi, %ecx
	movl	$1, %esi
	leal	0(,%rcx,4), %edi
	movslq	%edi, %rdi
	movl	%ecx, %r14d
	movq	%rdi, 88(%rsp)
	call	calloc@PLT
	movq	%rax, 8(%r12)
	movq	88(%rsp), %rdi
	movl	$1, %esi
	movq	%rax, %r15
	call	calloc@PLT
	movq	%rax, 16(%r12)
	movslq	%r14d, %rdx
	movq	%rdx, %rdi
	movl	$1, %esi
	movq	%rax, 80(%rsp)
	movq	%rdx, 88(%rsp)
	call	calloc@PLT
	movq	80(%rsp), %rcx
	movq	%rax, 24(%r12)
	testq	%rcx, %rcx
	movq	%rax, %rdi
	sete	%al
	testq	%r15, %r15
	sete	%cl
	orb	%cl, %al
	jne	.L5690
	testq	%rdi, %rdi
	je	.L5690
	movl	$1, 60(%rsp)
	movq	88(%rsp), %rdx
	jmp	.L5691
.L5756:
	movq	192(%rbx), %rax
	movq	200(%rbx), %rdx
	jmp	.L5701
.L5830:
	movl	%r12d, %r15d
	movq	%r8, %r12
	testl	%r15d, %r15d
	je	.L5813
	movl	%r15d, %esi
	movq	%rbx, %rdi
	vzeroupper
	call	stbi__skip.part.0
	.p2align 4,,10
	.p2align 3
.L5739:
	movq	%rbx, %rdi
	call	stbi__get8
	movzbl	%al, %esi
	testl	%esi, %esi
	je	.L5816
.L5742:
	cmpq	$0, 16(%rbx)
	movq	192(%rbx), %rdx
	je	.L5740
	movq	200(%rbx), %rdi
	movq	%rdi, %rcx
	subq	%rdx, %rcx
	cmpl	%ecx, %esi
	jg	.L5836
.L5740:
	movzbl	%al, %eax
	addq	%rax, %rdx
	movq	%rdx, 192(%rbx)
	movq	%rbx, %rdi
	call	stbi__get8
	movzbl	%al, %esi
	testl	%esi, %esi
	jne	.L5742
	jmp	.L5816
	.p2align 4,,10
	.p2align 3
.L5836:
	movq	%rdi, 192(%rbx)
	movq	40(%rbx), %rdi
	subl	%ecx, %esi
	call	*24(%rbx)
	jmp	.L5739
.L5831:
	leaq	.LC363(%rip), %rax
	xorl	%r13d, %r13d
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	vzeroupper
	jmp	.L5683
.L5832:
	leaq	.LC364(%rip), %rax
	xorl	%r13d, %r13d
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	vzeroupper
	jmp	.L5683
.L5716:
	leaq	.LC346(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%r13d, %r13d
	jmp	.L5683
.L5766:
	xorl	%eax, %eax
	xorl	%ecx, %ecx
	jmp	.L5718
.L5813:
	vzeroupper
	jmp	.L5739
.L5829:
	movq	%rbx, %rdi
	call	stbi__get8
	movzbl	%al, %eax
	movl	%eax, 48(%r12)
	movq	%rbx, %rdi
	call	stbi__get16le
	leal	(%rax,%rax,4), %eax
	addl	%eax, %eax
	movl	%eax, 34920(%r12)
	movslq	44(%r12), %rax
	testl	%eax, %eax
	js	.L5753
	movb	$-1, 55(%r12,%rax,4)
.L5753:
	testb	$1, 48(%r12)
	je	.L5754
	movq	%rbx, %rdi
	call	stbi__get8
	movzbl	%al, %eax
	movl	%eax, 44(%r12)
	movb	$0, 55(%r12,%rax,4)
	jmp	.L5817
.L5754:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	stbi__skip.part.0
	movl	$-1, 44(%r12)
	jmp	.L5817
.L5825:
	movq	%rcx, %rax
	jmp	.L5701
.L5690:
	leaq	.LC23(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L5683
	.cfi_endproc
.LFE896:
	.size	stbi__gif_load_next.constprop.0, .-stbi__gif_load_next.constprop.0
	.p2align 4
	.type	stbi__gif_load.constprop.0, @function
stbi__gif_load.constprop.0:
.LFB897:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
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
	leaq	-32768(%rsp), %r11
	.cfi_def_cfa 11, 32816
.LPSRL0:
	subq	$4096, %rsp
	orq	$0, (%rsp)
	cmpq	%r11, %rsp
	jne	.LPSRL0
	.cfi_def_cfa_register 7
	subq	$2176, %rsp
	.cfi_def_cfa_offset 34992
	movl	%r8d, %r13d
	movq	%rsp, %r8
	movq	%rdi, %rbx
	movq	%rsi, %r14
	movq	%r8, %rdi
	xorl	%esi, %esi
	movq	%rdx, %rbp
	movl	$34928, %edx
	movq	%rcx, %r12
	movq	%fs:40, %rax
	movq	%rax, 34936(%rsp)
	xorl	%eax, %eax
	call	memset@PLT
	movq	%rax, %rsi
	xorl	%ecx, %ecx
	movq	%r12, %rdx
	movq	%rbx, %rdi
	call	stbi__gif_load_next.constprop.0
	cmpq	%rax, %rbx
	je	.L5838
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L5838
	movl	(%rsp), %ecx
	movl	4(%rsp), %r8d
	movl	%ecx, (%r14)
	movl	%r8d, 0(%rbp)
	testl	$-5, %r13d
	jne	.L5854
.L5839:
	movq	24(%rsp), %rdi
	call	free@PLT
	movq	16(%rsp), %rdi
	call	free@PLT
	movq	34936(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L5855
	addq	$34944, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	movq	%r12, %rax
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L5838:
	.cfi_restore_state
	movq	8(%rsp), %r12
	testq	%r12, %r12
	je	.L5839
	movq	%r12, %rdi
	call	free@PLT
	xorl	%r12d, %r12d
	jmp	.L5839
	.p2align 4,,10
	.p2align 3
.L5854:
	movl	%r13d, %edx
	movl	$4, %esi
	movq	%rax, %rdi
	call	stbi__convert_format
	movq	%rax, %r12
	jmp	.L5839
.L5855:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE897:
	.size	stbi__gif_load.constprop.0, .-stbi__gif_load.constprop.0
	.section	.rodata.str1.1
.LC367:
	.string	"bad req_comp"
.LC368:
	.string	"bad bits_per_channel"
.LC369:
	.string	"bad format"
.LC370:
	.string	"bad palette"
.LC371:
	.string	"tga_comp == STBI_rgb"
	.text
	.p2align 4
	.type	stbi__load_main, @function
stbi__load_main:
.LFB594:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	leaq	16(%rsp), %r13
	.cfi_def_cfa 13, 0
	andq	$-32, %rsp
	pushq	-8(%r13)
	pushq	%rbp
	movq	%rsp, %rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	pushq	%r15
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	movq	%rdi, %r15
	pushq	%r14
	pushq	%r13
	.cfi_escape 0xf,0x3,0x76,0x68,0x6
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	pushq	%r12
	pushq	%rbx
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	.cfi_escape 0x10,0x3,0x2,0x76,0x58
	movq	%r9, %rbx
	subq	$488, %rsp
	movq	%rdx, -408(%rbp)
	movq	%rsi, -400(%rbp)
	movq	%rcx, -392(%rbp)
	movl	%r8d, -356(%rbp)
	leaq	stbi__idct_simd(%rip), %rdx
	vmovq	%rdx, %xmm7
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	leaq	stbi__YCbCr_to_RGB_simd(%rip), %rax
	movq	$0, 4(%r9)
	movl	$8, (%r9)
	movl	0(%r13), %r12d
	movq	192(%rdi), %rdx
	vpinsrq	$1, %rax, %xmm7, %xmm6
	movq	200(%rdi), %rax
	vmovdqa	%xmm6, -384(%rbp)
	cmpq	%rax, %rdx
	jb	.L5857
	movl	48(%rdi), %r8d
	testl	%r8d, %r8d
	jne	.L6743
	.p2align 4,,10
	.p2align 3
.L5858:
	leaq	.LC271(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	vmovdqu	208(%r15), %xmm0
	vpextrq	$1, %xmm0, %rcx
	vmovq	%xmm0, %rdx
	vmovdqu	%xmm0, 192(%r15)
	cmpq	%rcx, %rdx
	jb	.L6744
	movl	48(%r15), %eax
	testl	%eax, %eax
	jne	.L6745
.L5894:
	movq	%rdx, 192(%r15)
.L5902:
	movq	%rcx, 200(%r15)
	movq	%r15, %rdi
	call	stbi__gif_test_raw
	vmovdqu	208(%r15), %xmm5
	movl	%eax, -416(%rbp)
	vmovdqu	%xmm5, 192(%r15)
	testl	%eax, %eax
	jne	.L6746
	movq	%r15, %rdi
	call	stbi__get32be
	vmovdqu	208(%r15), %xmm0
	movl	%eax, %r8d
	vmovq	%xmm0, %rdx
	vpextrq	$1, %xmm0, %rax
	vmovdqu	%xmm0, 192(%r15)
	cmpl	$943870035, %r8d
	je	.L6747
	cmpq	%rax, %rdx
	jb	.L5909
	movl	48(%r15), %eax
	testl	%eax, %eax
	jne	.L6748
	.p2align 4,,10
	.p2align 3
.L5910:
	movq	208(%r15), %rax
	movl	$18568, %edi
	movq	%rax, 192(%r15)
	movq	216(%r15), %rax
	movq	%rax, 200(%r15)
	call	malloc@PLT
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L6749
	vmovdqa	-384(%rbp), %xmm5
	leaq	stbi__resample_row_hv_2_simd(%rip), %r13
	movq	%r15, (%rax)
	movq	%r13, 18560(%rax)
	vmovdqu	%xmm5, 18544(%rax)
	movabsq	$-4294967296, %rax
	movq	%rax, 18504(%r12)
	movb	$-1, 18472(%r12)
	movq	%r15, %rdi
	call	stbi__get8
	cmpb	$-1, %al
	jne	.L6734
.L6069:
	movq	(%r12), %r14
	movq	192(%r14), %rax
	cmpq	200(%r14), %rax
	jb	.L6750
	movl	48(%r14), %r9d
	testl	%r9d, %r9d
	jne	.L6708
.L6734:
	vmovdqu	208(%r15), %xmm0
.L6072:
	leaq	.LC258(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	movq	%r12, %rdi
	vmovdqu	%xmm0, 192(%r15)
	call	free@PLT
.L6068:
	movq	%r15, %rdi
	call	stbi__get8
	movl	%eax, %r12d
	movq	%r15, %rdi
	call	stbi__get8
	cmpb	$80, %r12b
	jne	.L6133
	subl	$53, %eax
	cmpb	$1, %al
	ja	.L6133
	leaq	8(%r15), %rcx
	leaq	4(%r15), %rdx
	movq	%r15, %rsi
	movq	%r15, %rdi
	call	stbi__pnm_info
	movl	%eax, (%rbx)
	testl	%eax, %eax
	je	.L6740
	cmpl	$16777216, 4(%r15)
	ja	.L6203
	movl	(%r15), %eax
	cmpl	$16777216, %eax
	ja	.L6203
	movq	-400(%rbp), %rsi
	movl	%eax, (%rsi)
	movq	-408(%rbp), %rsi
	movl	4(%r15), %eax
	movl	%eax, (%rsi)
	movq	-392(%rbp), %rsi
	testq	%rsi, %rsi
	je	.L6140
	movl	8(%r15), %eax
	movl	%eax, (%rsi)
.L6140:
	movl	8(%r15), %edi
	movl	(%rbx), %esi
	movl	(%r15), %r14d
	movl	4(%r15), %ebx
	testl	%edi, %edi
	js	.L6203
	testl	%r14d, %r14d
	js	.L6203
	je	.L6141
	movl	$2147483647, %eax
	cltd
	idivl	%r14d
	cmpl	%eax, %edi
	jg	.L6203
.L6141:
	testl	%ebx, %ebx
	js	.L6203
	movl	%r14d, %ecx
	imull	%edi, %ecx
	testl	%ebx, %ebx
	je	.L6142
	movl	$2147483647, %eax
	cltd
	idivl	%ebx
	cmpl	%eax, %ecx
	jg	.L6203
.L6142:
	cmpl	$-7, %esi
	jl	.L6203
	testl	%esi, %esi
	leal	7(%rsi), %r13d
	cmovns	%esi, %r13d
	sarl	$3, %r13d
	je	.L6143
	movl	$2147483647, %eax
	cltd
	idivl	%r13d
	imull	%ebx, %ecx
	cmpl	%eax, %ecx
	jg	.L6203
.L6143:
	movl	%r13d, %ecx
	movl	%ebx, %edx
	movl	%r14d, %esi
	movl	%edi, -384(%rbp)
	call	stbi__malloc_mad4.constprop.0
	movq	%rax, -368(%rbp)
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L6739
	imull	%r14d, %ebx
	movl	-384(%rbp), %edi
	movq	%rax, %rsi
	movl	%ebx, %edx
	imull	%edi, %edx
	movq	%r15, %rdi
	imull	%r13d, %edx
	call	stbi__getn
	movl	-356(%rbp), %eax
	testl	%eax, %eax
	je	.L5856
	movl	8(%r15), %esi
	cmpl	%esi, %eax
	je	.L5856
	movq	-56(%rbp), %rax
	subq	%fs:40, %rax
	jne	.L6742
	movl	4(%r15), %r8d
	movl	(%r15), %ecx
	movl	-356(%rbp), %edx
	addq	$488, %rsp
	popq	%rbx
	movq	%r12, %rdi
	popq	%r12
	popq	%r13
	.cfi_remember_state
	.cfi_def_cfa 13, 0
	popq	%r14
	popq	%r15
	popq	%rbp
	leaq	-16(%r13), %rsp
	.cfi_def_cfa 7, 16
	popq	%r13
	.cfi_def_cfa_offset 8
	jmp	stbi__convert_format
	.p2align 4,,10
	.p2align 3
.L6744:
	.cfi_restore_state
	leaq	1(%rdx), %rax
	movq	%rax, 192(%r15)
	movzbl	(%rdx), %ecx
.L5893:
	cmpb	$66, %cl
	jne	.L5896
	movq	%r15, %rdi
	call	stbi__get8
	cmpb	$77, %al
	je	.L6751
	movq	208(%r15), %rax
	movq	216(%r15), %rcx
	movq	%rax, 192(%r15)
	jmp	.L5902
	.p2align 4,,10
	.p2align 3
.L5857:
	leaq	1(%rdx), %rcx
	movq	%rcx, 192(%rdi)
	movzbl	(%rdx), %edx
.L5860:
	cmpb	$-119, %dl
	jne	.L5858
	cmpq	%rax, %rcx
	jb	.L5861
	movl	48(%r15), %edi
	testl	%edi, %edi
	je	.L5858
	movl	52(%r15), %edx
	movq	40(%r15), %rdi
	leaq	56(%r15), %r14
	movq	%r14, %rsi
	call	*16(%r15)
	movq	192(%r15), %rdx
	subq	208(%r15), %rdx
	addl	%edx, 184(%r15)
	leaq	57(%r15), %rdx
	testl	%eax, %eax
	je	.L5862
	cltq
	addq	%r14, %rax
	vmovq	%rdx, %xmm4
	vpinsrq	$1, %rax, %xmm4, %xmm0
	movzbl	56(%r15), %ecx
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L5863
	.p2align 4,,10
	.p2align 3
.L5861:
	leaq	1(%rcx), %rdx
	movq	%rdx, 192(%r15)
	movzbl	(%rcx), %ecx
.L5863:
	cmpb	$80, %cl
	jne	.L5858
	cmpq	%rax, %rdx
	jb	.L5864
	movl	48(%r15), %esi
	testl	%esi, %esi
	je	.L5858
	movl	52(%r15), %edx
	movq	40(%r15), %rdi
	leaq	56(%r15), %r14
	movq	%r14, %rsi
	call	*16(%r15)
	movq	192(%r15), %rdx
	leaq	57(%r15), %rcx
	subq	208(%r15), %rdx
	addl	%edx, 184(%r15)
	testl	%eax, %eax
	je	.L5865
	cltq
	addq	%r14, %rax
	vmovq	%rcx, %xmm4
	vpinsrq	$1, %rax, %xmm4, %xmm0
	movzbl	56(%r15), %edx
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L5866
	.p2align 4,,10
	.p2align 3
.L5864:
	leaq	1(%rdx), %rcx
	movq	%rcx, 192(%r15)
	movzbl	(%rdx), %edx
.L5866:
	cmpb	$78, %dl
	jne	.L5858
	cmpq	%rax, %rcx
	jb	.L5867
	movl	48(%r15), %ecx
	testl	%ecx, %ecx
	je	.L5858
	movl	52(%r15), %edx
	movq	40(%r15), %rdi
	leaq	56(%r15), %r14
	movq	%r14, %rsi
	call	*16(%r15)
	movq	192(%r15), %rdx
	subq	208(%r15), %rdx
	addl	%edx, 184(%r15)
	leaq	57(%r15), %rdx
	testl	%eax, %eax
	je	.L5868
	cltq
	addq	%r14, %rax
	vmovq	%rdx, %xmm3
	vpinsrq	$1, %rax, %xmm3, %xmm0
	movzbl	56(%r15), %ecx
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L5869
	.p2align 4,,10
	.p2align 3
.L5867:
	leaq	1(%rcx), %rdx
	movq	%rdx, 192(%r15)
	movzbl	(%rcx), %ecx
.L5869:
	cmpb	$71, %cl
	jne	.L5858
	cmpq	%rax, %rdx
	jb	.L5870
	movl	48(%r15), %edx
	testl	%edx, %edx
	je	.L5858
	movl	52(%r15), %edx
	movq	40(%r15), %rdi
	leaq	56(%r15), %r14
	movq	%r14, %rsi
	call	*16(%r15)
	movq	192(%r15), %rdx
	leaq	57(%r15), %rcx
	subq	208(%r15), %rdx
	addl	%edx, 184(%r15)
	testl	%eax, %eax
	je	.L5877
	cltq
	addq	%r14, %rax
	vmovq	%rcx, %xmm6
	vpinsrq	$1, %rax, %xmm6, %xmm0
	movzbl	56(%r15), %edx
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L5872
	.p2align 4,,10
	.p2align 3
.L5870:
	leaq	1(%rdx), %rcx
	movq	%rcx, 192(%r15)
	movzbl	(%rdx), %edx
.L5872:
	cmpb	$13, %dl
	jne	.L5858
	cmpq	%rax, %rcx
	jb	.L5873
	movl	48(%r15), %eax
	testl	%eax, %eax
	je	.L5858
	movl	52(%r15), %edx
	movq	40(%r15), %rdi
	leaq	56(%r15), %r14
	movq	%r14, %rsi
	call	*16(%r15)
	movq	192(%r15), %rdx
	subq	208(%r15), %rdx
	addl	%edx, 184(%r15)
	leaq	57(%r15), %rdx
	testl	%eax, %eax
	je	.L5874
	cltq
	addq	%r14, %rax
	vmovq	%rdx, %xmm2
	vpinsrq	$1, %rax, %xmm2, %xmm0
	movzbl	56(%r15), %ecx
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L5875
	.p2align 4,,10
	.p2align 3
.L5873:
	leaq	1(%rcx), %rdx
	movq	%rdx, 192(%r15)
	movzbl	(%rcx), %ecx
.L5875:
	cmpb	$10, %cl
	jne	.L5858
	cmpq	%rax, %rdx
	jb	.L5876
	movl	48(%r15), %eax
	testl	%eax, %eax
	je	.L5858
	movl	52(%r15), %edx
	movq	40(%r15), %rdi
	leaq	56(%r15), %r14
	movq	%r14, %rsi
	call	*16(%r15)
	movq	192(%r15), %rdx
	leaq	57(%r15), %rcx
	subq	208(%r15), %rdx
	addl	%edx, 184(%r15)
	testl	%eax, %eax
	jne	.L6752
.L5877:
	vmovq	%rcx, %xmm7
	vpunpcklqdq	%xmm7, %xmm7, %xmm0
	movl	$0, 48(%r15)
	movb	$0, 56(%r15)
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L5858
	.p2align 4,,10
	.p2align 3
.L5876:
	leaq	1(%rdx), %rcx
	movq	%rcx, 192(%r15)
	movzbl	(%rdx), %edx
.L5878:
	cmpb	$26, %dl
	jne	.L5858
	cmpq	%rax, %rcx
	jb	.L6753
	movl	48(%r15), %eax
	testl	%eax, %eax
	je	.L5858
	movl	52(%r15), %edx
	movq	40(%r15), %rdi
	leaq	56(%r15), %r14
	movq	%r14, %rsi
	call	*16(%r15)
	movq	192(%r15), %rdx
	subq	208(%r15), %rdx
	addl	%edx, 184(%r15)
	leaq	57(%r15), %rdx
	testl	%eax, %eax
	jne	.L5881
	movl	$0, 48(%r15)
	movb	$0, 56(%r15)
	movq	%rdx, 200(%r15)
	jmp	.L5858
	.p2align 4,,10
	.p2align 3
.L6753:
	leaq	1(%rcx), %rax
	movq	%rax, 192(%r15)
	movzbl	(%rcx), %edx
.L5880:
	cmpb	$10, %dl
	jne	.L5858
	vmovdqu	208(%r15), %xmm7
	cmpl	$4, -356(%rbp)
	movq	%r15, -352(%rbp)
	vmovdqu	%xmm7, 192(%r15)
	ja	.L6754
	movl	-356(%rbp), %edx
	xorl	%esi, %esi
	leaq	-352(%rbp), %rdi
	call	stbi__parse_png_file
	testl	%eax, %eax
	je	.L6331
	movl	-320(%rbp), %edx
	cmpl	$8, %edx
	jle	.L6332
	cmpl	$16, %edx
	jne	.L6755
.L5888:
	movq	-328(%rbp), %rax
	movl	%edx, (%rbx)
	movq	%rax, -368(%rbp)
	movl	-356(%rbp), %ebx
	movq	-352(%rbp), %rax
	movq	$0, -328(%rbp)
	movl	(%rax), %ecx
	xorl	%edi, %edi
	testl	%ebx, %ebx
	je	.L5889
	movl	12(%rax), %esi
	cmpl	%esi, %ebx
	je	.L5889
	cmpl	$8, %edx
	movl	4(%rax), %r8d
	movq	-368(%rbp), %rdi
	movl	%ebx, %edx
	je	.L6756
	call	stbi__convert_format16
	movq	%rax, -368(%rbp)
.L5891:
	movq	-352(%rbp), %rax
	movl	-356(%rbp), %esi
	cmpq	$0, -368(%rbp)
	movl	%esi, 12(%rax)
	je	.L5856
	movq	-328(%rbp), %rdi
.L5889:
	movl	(%rax), %edx
	movq	-400(%rbp), %rsi
	movl	%edx, (%rsi)
	movq	-408(%rbp), %rsi
	movl	4(%rax), %edx
	movl	%edx, (%rsi)
	movq	-392(%rbp), %rsi
	testq	%rsi, %rsi
	je	.L5887
	movl	8(%rax), %eax
	movl	%eax, (%rsi)
	jmp	.L5887
.L6331:
	movq	$0, -368(%rbp)
	movq	-328(%rbp), %rdi
.L5887:
	call	free@PLT
	movq	-336(%rbp), %rdi
	call	free@PLT
	movq	-344(%rbp), %rdi
	call	free@PLT
.L5856:
	movq	-56(%rbp), %rax
	subq	%fs:40, %rax
	jne	.L6742
	movq	-368(%rbp), %rax
	addq	$488, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	.cfi_remember_state
	.cfi_def_cfa 13, 0
	popq	%r14
	popq	%r15
	popq	%rbp
	leaq	-16(%r13), %rsp
	.cfi_def_cfa 7, 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
.L5909:
	.cfi_restore_state
	leaq	1(%rdx), %rcx
	movq	%rcx, 192(%r15)
	movzbl	(%rdx), %edx
.L5912:
	cmpb	$83, %dl
	jne	.L5910
	cmpq	%rax, %rcx
	jb	.L5913
	movl	48(%r15), %r14d
	testl	%r14d, %r14d
	je	.L5910
	movl	52(%r15), %edx
	movq	40(%r15), %rdi
	leaq	56(%r15), %r12
	movq	%r12, %rsi
	call	*16(%r15)
	movq	192(%r15), %rdx
	subq	208(%r15), %rdx
	addl	%edx, 184(%r15)
	leaq	57(%r15), %rdx
	testl	%eax, %eax
	je	.L5914
	cltq
	addq	%r12, %rax
	vmovq	%rdx, %xmm3
	vpinsrq	$1, %rax, %xmm3, %xmm0
	movzbl	56(%r15), %ecx
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L5915
.L6751:
	movq	%r15, %rdi
	call	stbi__get32le
	movq	%r15, %rdi
	call	stbi__get16le
	movq	%r15, %rdi
	call	stbi__get16le
	movq	%r15, %rdi
	call	stbi__get32le
	movq	%r15, %rdi
	call	stbi__get32le
	cmpl	$12, %eax
	je	.L5899
	cmpl	$40, %eax
	je	.L5899
	movq	208(%r15), %rdx
	movq	216(%r15), %rcx
	movq	%rdx, 192(%r15)
	cmpl	$56, %eax
	je	.L5903
	cmpl	$108, %eax
	je	.L5903
	cmpl	$124, %eax
	jne	.L5902
.L5903:
	movq	%rcx, 200(%r15)
	movq	-56(%rbp), %rax
	subq	%fs:40, %rax
	jne	.L6742
	movl	-356(%rbp), %r8d
	movq	-392(%rbp), %rcx
	movq	-408(%rbp), %rdx
	movq	-400(%rbp), %rsi
	addq	$488, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	.cfi_remember_state
	.cfi_def_cfa 13, 0
	popq	%r14
	movq	%r15, %rdi
	popq	%r15
	popq	%rbp
	leaq	-16(%r13), %rsp
	.cfi_def_cfa 7, 16
	popq	%r13
	.cfi_def_cfa_offset 8
	jmp	stbi__bmp_load.constprop.0
.L6133:
	.cfi_restore_state
	vmovdqu	208(%r15), %xmm3
	movq	%r15, %rdi
	vmovdqu	%xmm3, 192(%r15)
	call	stbi__hdr_test
	movl	%eax, -480(%rbp)
	testl	%eax, %eax
	jne	.L6757
	movq	%r15, %rdi
	call	stbi__get8
	movq	%r15, %rdi
	call	stbi__get8
	movzbl	%al, %r12d
	movl	%r12d, %ebx
	cmpl	$1, %r12d
	jle	.L6758
.L6161:
	movq	208(%r15), %rax
	movq	%rax, 192(%r15)
	movq	216(%r15), %rax
.L6174:
	movq	%rax, 200(%r15)
	leaq	.LC343(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	movq	$0, -368(%rbp)
	jmp	.L5856
	.p2align 4,,10
	.p2align 3
.L6746:
	movq	-56(%rbp), %rax
	subq	%fs:40, %rax
	jne	.L6742
	movl	-356(%rbp), %r8d
	movq	-392(%rbp), %rcx
	movq	-408(%rbp), %rdx
	movq	-400(%rbp), %rsi
	addq	$488, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	.cfi_remember_state
	.cfi_def_cfa 13, 0
	popq	%r14
	movq	%r15, %rdi
	popq	%r15
	popq	%rbp
	leaq	-16(%r13), %rsp
	.cfi_def_cfa 7, 16
	popq	%r13
	.cfi_def_cfa_offset 8
	jmp	stbi__gif_load.constprop.0
	.p2align 4,,10
	.p2align 3
.L6743:
	.cfi_restore_state
	movl	52(%rdi), %edx
	leaq	56(%rdi), %r14
	movq	40(%rdi), %rdi
	movq	%r14, %rsi
	call	*16(%r15)
	movq	192(%r15), %rdx
	leaq	57(%r15), %rcx
	subq	208(%r15), %rdx
	addl	%edx, 184(%r15)
	testl	%eax, %eax
	je	.L5877
	cltq
	addq	%r14, %rax
	vmovq	%rcx, %xmm2
	vpinsrq	$1, %rax, %xmm2, %xmm0
	movzbl	56(%r15), %edx
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L5860
.L6745:
	movl	52(%r15), %edx
	movq	40(%r15), %rdi
	leaq	56(%r15), %r14
	movq	%r14, %rsi
	call	*16(%r15)
	movq	208(%r15), %rdx
	movq	192(%r15), %rcx
	leaq	57(%r15), %rsi
	subq	%rdx, %rcx
	addl	%ecx, 184(%r15)
	testl	%eax, %eax
	jne	.L5895
	vmovq	%rsi, %xmm5
	movl	$0, 48(%r15)
	movb	$0, 56(%r15)
	vpunpcklqdq	%xmm5, %xmm5, %xmm0
	vmovdqu	%xmm0, 192(%r15)
.L5896:
	movq	216(%r15), %rcx
	jmp	.L5894
	.p2align 4,,10
	.p2align 3
.L6754:
	leaq	.LC367(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	movq	$0, -368(%rbp)
	jmp	.L5856
.L6750:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%r14)
	movzbl	(%rax), %eax
.L6071:
	cmpb	$-1, %al
	je	.L6069
	vmovdqu	208(%r15), %xmm0
	cmpb	$-40, %al
	jne	.L6072
	movq	%r12, %rdi
	vmovdqu	%xmm0, 192(%r15)
	call	free@PLT
	movl	$18568, %edi
	call	malloc@PLT
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L6739
	vmovdqa	-384(%rbp), %xmm4
	cmpl	$4, -356(%rbp)
	movq	%r15, (%rax)
	movq	%r13, 18560(%rax)
	movl	$0, 8(%r15)
	vmovdqu	%xmm4, 18544(%rax)
	ja	.L6759
	movq	%rax, %rdi
	call	stbi__decode_jpeg_image
	testl	%eax, %eax
	je	.L6760
	movq	(%r12), %r15
	movl	-356(%rbp), %r8d
	movl	8(%r15), %eax
	movl	%eax, -424(%rbp)
	testl	%r8d, %r8d
	jne	.L6084
	cmpl	$2, %eax
	jle	.L6353
	movl	$3, -356(%rbp)
.L6084:
	cmpl	$3, -424(%rbp)
	je	.L6761
.L6085:
	movl	-424(%rbp), %eax
	movl	$0, -480(%rbp)
	movl	%eax, -384(%rbp)
	testl	%eax, %eax
	jle	.L6762
.L6086:
	movl	(%r15), %ebx
	leaq	18084(%r12), %r13
	leal	3(%rbx), %esi
	leaq	-256(%rbp), %rax
	movq	%r15, -432(%rbp)
	movq	%r12, %r15
	movq	%r13, %r12
	movl	-416(%rbp), %r13d
	movl	%ebx, -368(%rbp)
	vpxor	%xmm0, %xmm0, %xmm0
	movq	%rax, %rbx
	movq	%rsi, %r14
	movq	%rax, -456(%rbp)
	vmovdqa	%ymm0, -304(%rbp)
	vzeroupper
	.p2align 4,,10
	.p2align 3
.L6090:
	movq	%r14, %rdi
	call	malloc@PLT
	movq	%rax, 68(%r12)
	testq	%rax, %rax
	je	.L6763
	movl	18056(%r15), %eax
	movabsq	$4294967297, %rsi
	cltd
	idivl	(%r12)
	movl	%eax, %ecx
	movl	18060(%r15), %eax
	vmovd	%ecx, %xmm4
	cltd
	idivl	4(%r12)
	movl	$0, 40(%rbx)
	xorl	%edx, %edx
	movl	%eax, %edi
	movl	-368(%rbp), %eax
	vpinsrd	$1, %edi, %xmm4, %xmm1
	leal	-1(%rax,%rcx), %eax
	divl	%ecx
	movl	%edi, %edx
	sarl	%edx
	vmovd	%eax, %xmm3
	vpinsrd	$1, %edx, %xmm3, %xmm0
	vpunpcklqdq	%xmm0, %xmm1, %xmm0
	movslq	%r13d, %rax
	vmovdqu	%xmm0, 24(%rbx)
	leaq	(%rax,%rax,2), %rax
	salq	$4, %rax
	vmovddup	44(%r12), %xmm0
	vmovdqu	%xmm0, 8(%rbx)
	movq	-232(%rbp,%rax), %rdx
	leaq	resample_row_1(%rip), %rax
	cmpq	%rsi, %rdx
	je	.L6089
	movabsq	$8589934593, %rsi
	leaq	stbi__resample_row_v_2(%rip), %rax
	cmpq	%rsi, %rdx
	je	.L6089
	movabsq	$4294967298, %rcx
	leaq	stbi__resample_row_h_2(%rip), %rax
	cmpq	%rcx, %rdx
	je	.L6089
	movabsq	$8589934594, %rcx
	leaq	stbi__resample_row_generic(%rip), %rax
	cmpq	%rcx, %rdx
	jne	.L6089
	movq	18560(%r15), %rax
	.p2align 4,,10
	.p2align 3
.L6089:
	incl	%r13d
	movq	%rax, (%rbx)
	addq	$96, %r12
	addq	$48, %rbx
	cmpl	-384(%rbp), %r13d
	jne	.L6090
	movq	%r15, %r12
	movl	-368(%rbp), %ebx
	movq	-432(%rbp), %r15
	movl	4(%r15), %esi
	testl	%ebx, %ebx
	js	.L6091
	je	.L6092
	movl	$2147483647, %eax
	cltd
	idivl	%ebx
	cmpl	%eax, -356(%rbp)
	jg	.L6091
.L6092:
	testl	%esi, %esi
	js	.L6091
	movl	-356(%rbp), %edi
	imull	%ebx, %edi
	testl	%esi, %esi
	je	.L6093
	movl	$2147483647, %eax
	cltd
	idivl	%esi
	cmpl	%eax, %edi
	jg	.L6091
	imull	%edi, %esi
	cmpl	$2147483647, %esi
	jne	.L6764
.L6091:
	movl	-424(%rbp), %esi
	movq	%r12, %rdi
	call	stbi__free_jpeg_components.constprop.0
	leaq	.LC23(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	movq	$0, -368(%rbp)
.L6076:
	movq	%r12, %rdi
	call	free@PLT
	jmp	.L5856
.L6332:
	movl	$8, %edx
	jmp	.L5888
.L5913:
	leaq	1(%rcx), %rdx
	movq	%rdx, 192(%r15)
	movzbl	(%rcx), %ecx
.L5915:
	cmpb	$-128, %cl
	jne	.L5910
	cmpq	%rax, %rdx
	jb	.L5916
	movl	48(%r15), %r13d
	testl	%r13d, %r13d
	je	.L5910
	movl	52(%r15), %edx
	movq	40(%r15), %rdi
	leaq	56(%r15), %r12
	movq	%r12, %rsi
	call	*16(%r15)
	movq	192(%r15), %rdx
	leaq	57(%r15), %rcx
	subq	208(%r15), %rdx
	addl	%edx, 184(%r15)
	testl	%eax, %eax
	je	.L5917
	cltq
	addq	%r12, %rax
	vmovq	%rcx, %xmm7
	vpinsrq	$1, %rax, %xmm7, %xmm0
	movzbl	56(%r15), %edx
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L5918
.L5916:
	leaq	1(%rdx), %rcx
	movq	%rcx, 192(%r15)
	movzbl	(%rdx), %edx
.L5918:
	cmpb	$-10, %dl
	jne	.L5910
	cmpq	%rax, %rcx
	jb	.L6765
	movl	48(%r15), %r12d
	testl	%r12d, %r12d
	je	.L5910
	movl	52(%r15), %edx
	movq	40(%r15), %rdi
	leaq	56(%r15), %r12
	movq	%r12, %rsi
	call	*16(%r15)
	movq	192(%r15), %rdx
	subq	208(%r15), %rdx
	addl	%edx, 184(%r15)
	leaq	57(%r15), %rdx
	testl	%eax, %eax
	jne	.L5921
	vmovq	%rdx, %xmm3
	vpunpcklqdq	%xmm3, %xmm3, %xmm0
	movl	$0, 48(%r15)
	movb	$0, 56(%r15)
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L5910
.L6765:
	leaq	1(%rcx), %rdx
	movq	%rdx, 192(%r15)
	movzbl	(%rcx), %ecx
.L5920:
	cmpb	$52, %cl
	jne	.L5910
	movl	$84, %r13d
	leaq	56(%r15), %r12
	jmp	.L5926
	.p2align 4,,10
	.p2align 3
.L5922:
	movl	48(%r15), %r11d
	testl	%r11d, %r11d
	jne	.L6766
.L5923:
	decl	%r13d
	je	.L6767
.L5926:
	cmpq	%rdx, %rax
	jbe	.L5922
	incq	%rdx
	movq	%rdx, 192(%r15)
	decl	%r13d
	jne	.L5926
.L6767:
	cmpq	%rdx, %rax
	ja	.L5927
	movl	48(%r15), %r10d
	testl	%r10d, %r10d
	je	.L5910
	movl	52(%r15), %edx
	movq	40(%r15), %rdi
	leaq	56(%r15), %r12
	movq	%r12, %rsi
	call	*16(%r15)
	movslq	%eax, %rdx
	movq	192(%r15), %rax
	subq	208(%r15), %rax
	addl	%eax, 184(%r15)
	leaq	57(%r15), %rax
	vmovq	%rax, %xmm0
	testl	%edx, %edx
	je	.L5935
	addq	%rdx, %r12
	vpinsrq	$1, %r12, %xmm0, %xmm0
	movzbl	56(%r15), %eax
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L5930
	.p2align 4,,10
	.p2align 3
.L6766:
	movl	52(%r15), %edx
	movq	40(%r15), %rdi
	movq	%r12, %rsi
	call	*16(%r15)
	movq	192(%r15), %rdx
	subq	208(%r15), %rdx
	addl	%edx, 184(%r15)
	leaq	57(%r15), %rdx
	testl	%eax, %eax
	jne	.L5924
	movl	$0, 48(%r15)
	movb	$0, 56(%r15)
	movq	%rdx, %rax
.L5925:
	vmovq	%rdx, %xmm2
	vpinsrq	$1, %rax, %xmm2, %xmm0
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L5923
	.p2align 4,,10
	.p2align 3
.L5924:
	cltq
	addq	%r12, %rax
	jmp	.L5925
.L5862:
	vmovq	%rdx, %xmm2
	vpunpcklqdq	%xmm2, %xmm2, %xmm0
	movl	$0, 48(%r15)
	movb	$0, 56(%r15)
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L5858
.L6747:
	movq	-56(%rbp), %rax
	subq	%fs:40, %rax
	jne	.L6742
	movl	%r12d, 0(%r13)
	movq	%rbx, %r9
	movq	%r15, %rdi
	movl	-356(%rbp), %r8d
	movq	-392(%rbp), %rcx
	movq	-408(%rbp), %rdx
	movq	-400(%rbp), %rsi
	addq	$488, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	.cfi_remember_state
	.cfi_def_cfa 13, 0
	popq	%r14
	popq	%r15
	popq	%rbp
	leaq	-16(%r13), %rsp
	.cfi_def_cfa 7, 16
	popq	%r13
	.cfi_def_cfa_offset 8
	jmp	stbi__psd_load
.L5865:
	.cfi_restore_state
	vmovq	%rcx, %xmm2
	vpunpcklqdq	%xmm2, %xmm2, %xmm0
	movl	$0, 48(%r15)
	movb	$0, 56(%r15)
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L5858
.L5868:
	vmovq	%rdx, %xmm4
	vpunpcklqdq	%xmm4, %xmm4, %xmm0
	movl	$0, 48(%r15)
	movb	$0, 56(%r15)
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L5858
.L5927:
	leaq	1(%rdx), %rax
	movq	%rax, 192(%r15)
	movzbl	(%rdx), %eax
.L5930:
	cmpb	$80, %al
	jne	.L5910
	movq	192(%r15), %rax
	cmpq	200(%r15), %rax
	jb	.L5931
	movl	48(%r15), %r9d
	testl	%r9d, %r9d
	je	.L5910
	movl	52(%r15), %edx
	movq	40(%r15), %rdi
	leaq	56(%r15), %r12
	movq	%r12, %rsi
	call	*16(%r15)
	movslq	%eax, %rdx
	movq	192(%r15), %rax
	subq	208(%r15), %rax
	addl	%eax, 184(%r15)
	leaq	57(%r15), %rax
	vmovq	%rax, %xmm0
	testl	%edx, %edx
	je	.L5935
	addq	%rdx, %r12
	vpinsrq	$1, %r12, %xmm0, %xmm0
	movzbl	56(%r15), %eax
	vmovdqu	%xmm0, 192(%r15)
.L5933:
	cmpb	$73, %al
	jne	.L5910
	movq	192(%r15), %rax
	cmpq	200(%r15), %rax
	jb	.L5934
	movl	48(%r15), %r8d
	testl	%r8d, %r8d
	je	.L5910
	movl	52(%r15), %edx
	movq	40(%r15), %rdi
	leaq	56(%r15), %r12
	movq	%r12, %rsi
	call	*16(%r15)
	movslq	%eax, %rdx
	movq	192(%r15), %rax
	subq	208(%r15), %rax
	addl	%eax, 184(%r15)
	leaq	57(%r15), %rax
	vmovq	%rax, %xmm0
	testl	%edx, %edx
	je	.L5935
	addq	%rdx, %r12
	vpinsrq	$1, %r12, %xmm0, %xmm0
	movzbl	56(%r15), %eax
	vmovdqu	%xmm0, 192(%r15)
.L5936:
	cmpb	$67, %al
	jne	.L5910
	movq	192(%r15), %rax
	cmpq	200(%r15), %rax
	jb	.L6768
	movl	48(%r15), %edi
	testl	%edi, %edi
	je	.L5910
	movl	52(%r15), %edx
	movq	40(%r15), %rdi
	leaq	56(%r15), %r12
	movq	%r12, %rsi
	call	*16(%r15)
	movslq	%eax, %rdx
	movq	192(%r15), %rax
	subq	208(%r15), %rax
	addl	%eax, 184(%r15)
	testl	%edx, %edx
	jne	.L5939
	movl	$0, 48(%r15)
	movb	$0, 56(%r15)
	jmp	.L5910
.L5874:
	vmovq	%rdx, %xmm3
	vpunpcklqdq	%xmm3, %xmm3, %xmm0
	movl	$0, 48(%r15)
	movb	$0, 56(%r15)
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L5858
.L6752:
	cltq
	addq	%r14, %rax
	vmovq	%rcx, %xmm6
	vpinsrq	$1, %rax, %xmm6, %xmm0
	movzbl	56(%r15), %edx
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L5878
.L5881:
	cltq
	addq	%rax, %r14
	movq	%r14, 200(%r15)
	movzbl	56(%r15), %edx
	jmp	.L5880
.L5895:
	cltq
	addq	%rax, %r14
	vmovq	%rsi, %xmm6
	vpinsrq	$1, %r14, %xmm6, %xmm0
	movzbl	56(%r15), %ecx
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L5893
.L6757:
	movl	-356(%rbp), %ebx
	movq	-392(%rbp), %r14
	movq	-408(%rbp), %rdx
	movq	-400(%rbp), %rsi
	movl	%ebx, %r8d
	movq	%r14, %rcx
	movq	%r15, %rdi
	call	stbi__hdr_load.constprop.0
	movq	%rax, -424(%rbp)
	testl	%ebx, %ebx
	jne	.L6146
	movl	(%r14), %eax
	movl	%eax, -356(%rbp)
.L6146:
	movq	-408(%rbp), %rax
	cmpq	$0, -424(%rbp)
	movl	(%rax), %ecx
	movq	-400(%rbp), %rax
	movl	(%rax), %esi
	je	.L6740
	movl	%ecx, %eax
	orl	%esi, %eax
	js	.L6150
	testl	%ecx, %ecx
	je	.L6149
	movl	$2147483647, %eax
	cltd
	idivl	%ecx
	cmpl	%eax, %esi
	jg	.L6150
.L6149:
	movl	-356(%rbp), %ebx
	testl	%ebx, %ebx
	js	.L6150
	imull	%esi, %ecx
	movl	%ecx, -432(%rbp)
	testl	%ebx, %ebx
	je	.L6151
	movl	$2147483647, %eax
	cltd
	idivl	%ebx
	cmpl	%eax, %ecx
	jg	.L6150
	movl	%ebx, %edi
	imull	%ecx, %edi
	movslq	%edi, %rdi
	call	malloc@PLT
	movq	%rax, -368(%rbp)
	testq	%rax, %rax
	je	.L6150
	movl	%ebx, -408(%rbp)
	andl	$1, %ebx
	je	.L6319
.L6152:
	movl	-432(%rbp), %eax
	testl	%eax, %eax
	je	.L6153
	movl	-408(%rbp), %esi
	xorl	%eax, %eax
	testl	%esi, %esi
	cmovns	%esi, %eax
	xorl	%ebx, %ebx
	movl	%eax, -440(%rbp)
	.p2align 4,,10
	.p2align 3
.L6154:
	movl	-408(%rbp), %eax
	testl	%eax, %eax
	jle	.L6160
	movq	-424(%rbp), %rax
	movslq	%ebx, %rdx
	vmovss	stbi__h2l_scale_i(%rip), %xmm7
	leaq	(%rax,%rdx,4), %r13
	movq	-368(%rbp), %rax
	vxorps	%xmm3, %xmm3, %xmm3
	movslq	-408(%rbp), %r14
	vxorpd	%xmm2, %xmm2, %xmm2
	vmovss	%xmm7, -392(%rbp)
	xorl	%r15d, %r15d
	vmovss	%xmm3, -400(%rbp)
	leaq	(%rax,%rdx), %r12
	vcvtss2sd	stbi__h2l_gamma_i(%rip), %xmm2, %xmm1
	.p2align 4,,10
	.p2align 3
.L6156:
	vmovss	-392(%rbp), %xmm3
	vmovsd	%xmm1, -384(%rbp)
	vmulss	0(%r13,%r15,4), %xmm3, %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	call	pow@PLT
	vmovss	.LC240(%rip), %xmm4
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	vfmadd132ss	.LC247(%rip), %xmm4, %xmm0
	vmovss	-400(%rbp), %xmm5
	xorl	%eax, %eax
	vmovsd	-384(%rbp), %xmm1
	vcomiss	%xmm0, %xmm5
	ja	.L6155
	vcomiss	.LC247(%rip), %xmm0
	movl	$-1, %eax
	jbe	.L6769
.L6155:
	movb	%al, (%r12,%r15)
	incq	%r15
	cmpq	%r15, %r14
	jne	.L6156
.L6160:
	movl	-440(%rbp), %eax
	cmpl	%eax, -356(%rbp)
	jle	.L6157
	addl	%ebx, %eax
	movq	-424(%rbp), %rsi
	cltq
	vmovss	(%rsi,%rax,4), %xmm0
	vmovss	.LC240(%rip), %xmm4
	vxorps	%xmm5, %xmm5, %xmm5
	vfmadd132ss	.LC247(%rip), %xmm4, %xmm0
	xorl	%edx, %edx
	vcomiss	%xmm0, %xmm5
	ja	.L6158
	vcomiss	.LC247(%rip), %xmm0
	movl	$-1, %edx
	jbe	.L6770
.L6158:
	movq	-368(%rbp), %rsi
	movb	%dl, (%rsi,%rax)
.L6157:
	incl	-416(%rbp)
	addl	-356(%rbp), %ebx
	movl	-416(%rbp), %eax
	cmpl	-432(%rbp), %eax
	jne	.L6154
.L6153:
	movq	-424(%rbp), %rdi
	call	free@PLT
	jmp	.L5856
.L5899:
	movq	208(%r15), %rax
	movq	216(%r15), %rcx
	movq	%rax, 192(%r15)
	jmp	.L5903
.L6759:
	leaq	.LC367(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	movq	$0, -368(%rbp)
	jmp	.L6076
.L6769:
	vcvttss2sil	%xmm0, %eax
	jmp	.L6155
.L6203:
	leaq	.LC203(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	movq	$0, -368(%rbp)
	jmp	.L5856
.L5931:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%r15)
	movzbl	(%rax), %eax
	jmp	.L5933
.L5934:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%r15)
	movzbl	(%rax), %eax
	jmp	.L5936
.L6768:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%r15)
	movzbl	(%rax), %eax
.L5938:
	cmpb	$84, %al
	jne	.L5910
	movq	-392(%rbp), %rsi
	leaq	-352(%rbp), %rdx
	testq	%rsi, %rsi
	cmovne	%rsi, %rdx
	movq	208(%r15), %rax
	movq	%rdx, -392(%rbp)
	movq	216(%r15), %rdx
	movq	%rax, 192(%r15)
	movq	%rdx, 200(%r15)
	movl	$92, %r12d
	leaq	56(%r15), %rbx
	movq	%rax, %rcx
	jmp	.L5945
	.p2align 4,,10
	.p2align 3
.L5941:
	movl	48(%r15), %esi
	testl	%esi, %esi
	jne	.L6771
.L5942:
	decl	%r12d
	je	.L6772
.L5945:
	cmpq	%rcx, %rdx
	jbe	.L5941
	incq	%rcx
	movq	%rcx, 192(%r15)
	jmp	.L5942
	.p2align 4,,10
	.p2align 3
.L6771:
	movl	52(%r15), %edx
	movq	40(%r15), %rdi
	movq	%rbx, %rsi
	call	*16(%r15)
	movq	192(%r15), %rdx
	leaq	57(%r15), %rcx
	subq	208(%r15), %rdx
	addl	%edx, 184(%r15)
	testl	%eax, %eax
	jne	.L5943
	movl	$0, 48(%r15)
	movb	$0, 56(%r15)
	movq	%rcx, %rdx
.L5944:
	vmovq	%rcx, %xmm6
	vpinsrq	$1, %rdx, %xmm6, %xmm0
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L5942
	.p2align 4,,10
	.p2align 3
.L5943:
	cltq
	leaq	(%rbx,%rax), %rdx
	jmp	.L5944
.L6772:
	movq	%r15, %rdi
	call	stbi__get16be
	movq	%r15, %rdi
	movl	%eax, -384(%rbp)
	call	stbi__get16be
	movl	%eax, %r14d
	cmpl	$16777216, %eax
	jg	.L6203
	cmpl	$16777216, -384(%rbp)
	jg	.L6203
	cmpq	$0, 16(%r15)
	je	.L5952
	movq	40(%r15), %rdi
	call	*32(%r15)
	testl	%eax, %eax
	je	.L5951
	movl	48(%r15), %eax
	testl	%eax, %eax
	je	.L5950
.L5952:
	movq	200(%r15), %rax
	cmpq	%rax, 192(%r15)
	jnb	.L5950
.L5951:
	movl	-384(%rbp), %esi
	movl	%esi, %eax
	orl	%r14d, %eax
	js	.L6203
	testl	%r14d, %r14d
	je	.L5953
	movl	$2147483647, %eax
	cltd
	idivl	%r14d
	cmpl	%eax, %esi
	jg	.L6203
	movl	%esi, %ebx
	imull	%r14d, %ebx
	cmpl	$536870911, %ebx
	jg	.L6203
	movq	%r15, %rdi
	call	stbi__get32be
	movq	%r15, %rdi
	call	stbi__get16be
	movq	%r15, %rdi
	call	stbi__get16be
.L6323:
	sall	$2, %ebx
	movslq	%ebx, %r12
	movq	%r12, %rdi
	call	malloc@PLT
	movq	%rax, -368(%rbp)
	testq	%rax, %rax
	je	.L6738
	movq	%r12, %rdx
	movq	%rax, %rdi
	movl	$255, %esi
	call	memset@PLT
	leaq	56(%r15), %rax
	movq	%rax, -432(%rbp)
	leaq	57(%r15), %rax
	movl	$0, -456(%rbp)
	movq	%rax, -424(%rbp)
	leaq	-255(%rbp), %rbx
	xorl	%r13d, %r13d
	movl	%r14d, -448(%rbp)
	movl	%r13d, %r12d
	movq	%rbx, %r14
.L5956:
	movq	200(%r15), %rax
	movq	192(%r15), %rdx
	movl	%r12d, -440(%rbp)
	movq	16(%r15), %r10
	incl	%r12d
	movq	%rax, %rsi
	cmpq	%rax, %rdx
	jb	.L6773
	movl	48(%r15), %eax
	xorl	%r13d, %r13d
	testl	%eax, %eax
	jne	.L6774
.L5960:
	xorl	%ebx, %ebx
.L5970:
	movq	%rsi, %rax
	xorl	%esi, %esi
.L5971:
	movb	%sil, (%r14)
	cmpq	%rdx, %rax
	ja	.L6775
	movl	48(%r15), %eax
	testl	%eax, %eax
	jne	.L6776
	cmpq	$0, 16(%r15)
	movb	$0, 1(%r14)
	je	.L6729
.L6328:
	movq	40(%r15), %rdi
	call	*32(%r15)
	testl	%eax, %eax
	je	.L5980
	movl	48(%r15), %r11d
	testl	%r11d, %r11d
	je	.L6729
	movq	192(%r15), %rsi
	movq	200(%r15), %rax
.L5979:
	cmpq	%rsi, %rax
	jbe	.L6729
.L5980:
	cmpb	$8, %bl
	jne	.L5984
	testb	%r13b, %r13b
	je	.L6777
	addq	$3, %r14
	cmpl	$10, %r12d
	jne	.L5956
.L5984:
	leaq	.LC369(%rip), %rax
	movl	-448(%rbp), %r14d
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
.L5957:
	movq	-368(%rbp), %rdi
	call	free@PLT
	movq	$0, -368(%rbp)
.L6320:
	movq	-400(%rbp), %rax
	movl	-384(%rbp), %esi
	movl	-356(%rbp), %r10d
	movl	%esi, (%rax)
	movq	-408(%rbp), %rax
	movl	%r14d, (%rax)
	testl	%r10d, %r10d
	jne	.L6066
	movq	-392(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -356(%rbp)
.L6066:
	movl	-384(%rbp), %ecx
	movl	-356(%rbp), %edx
	movq	-368(%rbp), %rdi
	movl	%r14d, %r8d
	movl	$4, %esi
	call	stbi__convert_format
	movq	%rax, -368(%rbp)
	jmp	.L5856
.L6774:
	movl	52(%r15), %edx
	movq	40(%r15), %rdi
	movq	-432(%rbp), %rsi
	call	*%r10
	movq	192(%r15), %rdx
	movq	-424(%rbp), %rdi
	subq	208(%r15), %rdx
	addl	%edx, 184(%r15)
	testl	%eax, %eax
	jne	.L5961
	movl	$0, 48(%r15)
	movb	$0, 56(%r15)
	movq	%rdi, %rax
	vmovq	%rdi, %xmm7
.L5962:
	vpinsrq	$1, %rax, %xmm7, %xmm0
	movq	16(%r15), %r10
	vmovdqu	%xmm0, 192(%r15)
.L5959:
	cmpq	%rdi, %rax
	jbe	.L6778
	leaq	1(%rdi), %rsi
	movq	%rsi, 192(%r15)
	movzbl	(%rdi), %ebx
.L5965:
	cmpq	%rsi, %rax
	jbe	.L6779
	leaq	1(%rsi), %rdx
	movq	%rdx, 192(%r15)
	movzbl	(%rsi), %esi
	jmp	.L5971
.L6708:
	movl	52(%r14), %edx
	movq	40(%r14), %rdi
	leaq	56(%r14), %rsi
	movq	%rsi, -368(%rbp)
	call	*16(%r14)
	movslq	%eax, %rcx
	movq	192(%r14), %rax
	movq	-368(%rbp), %rsi
	subq	208(%r14), %rax
	addl	%eax, 184(%r14)
	testl	%ecx, %ecx
	leaq	57(%r14), %rdx
	jne	.L6073
	movb	$0, 56(%r14)
	vmovq	%rdx, %xmm5
	vpunpcklqdq	%xmm5, %xmm5, %xmm0
	vmovdqu	%xmm0, 192(%r14)
	movl	$0, 48(%r14)
	vmovdqu	208(%r15), %xmm0
	jmp	.L6072
.L6773:
	leaq	1(%rdx), %rdi
	movq	%rdi, 192(%r15)
	movzbl	(%rdx), %r13d
	jmp	.L5959
.L6748:
	movl	52(%r15), %edx
	movq	40(%r15), %rdi
	leaq	56(%r15), %r12
	movq	%r12, %rsi
	call	*16(%r15)
	movq	192(%r15), %rdx
	leaq	57(%r15), %rcx
	subq	208(%r15), %rdx
	addl	%edx, 184(%r15)
	testl	%eax, %eax
	je	.L5917
	cltq
	addq	%r12, %rax
	vmovq	%rcx, %xmm7
	vpinsrq	$1, %rax, %xmm7, %xmm0
	movzbl	56(%r15), %edx
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L5912
.L6775:
	leaq	1(%rdx), %rsi
	movq	%rsi, 192(%r15)
	movzbl	(%rdx), %edi
	orl	%edi, -456(%rbp)
	movl	%edi, %edx
.L5975:
	cmpq	$0, 16(%r15)
	movb	%dl, 1(%r14)
	je	.L5979
	jmp	.L6328
.L5917:
	vmovq	%rcx, %xmm2
	vpunpcklqdq	%xmm2, %xmm2, %xmm0
	movl	$0, 48(%r15)
	movb	$0, 56(%r15)
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L5910
.L5935:
	vpunpcklqdq	%xmm0, %xmm0, %xmm0
	movl	$0, 48(%r15)
	movb	$0, 56(%r15)
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L5910
.L6755:
	leaq	.LC368(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	movq	$0, -368(%rbp)
	jmp	.L5856
.L6073:
	addq	%rcx, %rsi
	vmovq	%rdx, %xmm6
	vpinsrq	$1, %rsi, %xmm6, %xmm0
	movzbl	56(%r14), %eax
	vmovdqu	%xmm0, 192(%r14)
	jmp	.L6071
.L6758:
	movq	%r15, %rdi
	call	stbi__get8
	cmpl	$1, %r12d
	je	.L6780
	andl	$-10, %eax
	cmpb	$2, %al
	jne	.L6161
	movl	$9, %esi
	movq	%r15, %rdi
	call	stbi__skip.part.0
.L6165:
	movq	%r15, %rdi
	call	stbi__get16le
	testl	%eax, %eax
	jle	.L6161
	movq	%r15, %rdi
	call	stbi__get16le
	testl	%eax, %eax
	jle	.L6161
	movq	%r15, %rdi
	call	stbi__get8
	movl	%eax, %edx
	leal	-8(%rdx), %eax
	andl	$1, %ebx
	testb	$-9, %al
	setne	%al
	cmpb	$32, %dl
	jbe	.L6168
	testb	%bl, %bl
	je	.L6388
	testb	%al, %al
	jne	.L6161
.L6388:
	movq	216(%r15), %rax
	movq	208(%r15), %rsi
.L6171:
	andl	$-9, %edx
	cmpb	$16, %dl
	je	.L6173
	movq	%rsi, 192(%r15)
	jmp	.L6174
	.p2align 4,,10
	.p2align 3
.L5953:
	movq	%r15, %rdi
	call	stbi__get32be
	movq	%r15, %rdi
	call	stbi__get16be
	movq	%r15, %rdi
	call	stbi__get16be
	xorl	%ebx, %ebx
	jmp	.L6323
.L6764:
	incl	%esi
	movslq	%esi, %rdi
	call	malloc@PLT
	movq	%rax, -368(%rbp)
	testq	%rax, %rax
	je	.L6091
	leaq	-304(%rbp), %rax
	movq	%rax, -464(%rbp)
	movl	-384(%rbp), %eax
	movl	$0, -440(%rbp)
	decl	%eax
	leaq	-296(%rbp,%rax,8), %rax
	movq	%rax, -416(%rbp)
	leaq	18112(%r12), %rax
	movq	%rax, -472(%rbp)
	movslq	-356(%rbp), %rax
	movl	$0, -424(%rbp)
	movq	%rax, -488(%rbp)
	movq	%r12, -432(%rbp)
	movl	%ebx, %r12d
	.p2align 4,,10
	.p2align 3
.L6126:
	imull	-440(%rbp), %r12d
	movq	-472(%rbp), %r15
	movq	-464(%rbp), %r14
	addq	-368(%rbp), %r12
	movq	%r12, -448(%rbp)
	movq	-456(%rbp), %rbx
.L6100:
	movl	28(%rbx), %r11d
	movq	16(%rbx), %r12
	movl	%r11d, %edi
	movl	36(%rbx), %r13d
	sarl	%edi
	movq	(%rbx), %rax
	movl	24(%rbx), %r8d
	movl	32(%rbx), %ecx
	movq	8(%rbx), %rsi
	movq	%r12, %rdx
	cmpl	%edi, %r13d
	jl	.L6096
	movq	%rsi, %rdx
	movq	%r12, %rsi
.L6096:
	movq	40(%r15), %rdi
	movl	%r11d, -384(%rbp)
	call	*%rax
	movl	-384(%rbp), %r11d
	incl	%r13d
	movq	%rax, (%r14)
	cmpl	%r13d, %r11d
	jle	.L6097
	movl	%r13d, 36(%rbx)
.L6098:
	addq	$8, %r14
	addq	$48, %rbx
	addq	$96, %r15
	cmpq	-416(%rbp), %r14
	jne	.L6100
	movq	-432(%rbp), %rax
	cmpl	$2, -356(%rbp)
	movq	(%rax), %rax
	movq	-448(%rbp), %r12
	movl	(%rax), %r8d
	jle	.L6101
	movl	8(%rax), %edx
	movq	-304(%rbp), %rsi
	cmpl	$3, %edx
	je	.L6781
	cmpl	$4, %edx
	jne	.L6782
	movq	-432(%rbp), %rbx
	movl	18508(%rbx), %edx
	testl	%edx, %edx
	je	.L6783
	movq	-296(%rbp), %r10
	cmpl	$2, %edx
	movq	18552(%rbx), %rax
	movq	-288(%rbp), %rcx
	movl	-356(%rbp), %r9d
	movq	%r10, %rdx
	movq	%r12, %rdi
	je	.L6784
	call	*%rax
	movq	-432(%rbp), %rax
	movq	(%rax), %rax
	.p2align 4,,10
	.p2align 3
.L6104:
	incl	-424(%rbp)
	movl	-356(%rbp), %edi
	addl	%edi, -440(%rbp)
	movl	-424(%rbp), %esi
	cmpl	4(%rax), %esi
	jnb	.L6785
	movl	(%rax), %r12d
	jmp	.L6126
	.p2align 4,,10
	.p2align 3
.L6097:
	movl	40(%rbx), %eax
	movl	$0, 36(%rbx)
	incl	%eax
	movq	%r12, 8(%rbx)
	movl	%eax, 40(%rbx)
	cmpl	(%r15), %eax
	jge	.L6098
	movslq	4(%r15), %rax
	leaq	(%r12,%rax), %r10
	movq	%r10, 16(%rbx)
	jmp	.L6098
.L6101:
	movl	-480(%rbp), %edx
	testl	%edx, %edx
	je	.L6113
	cmpl	$1, -356(%rbp)
	je	.L6114
	testl	%r8d, %r8d
	je	.L6104
	movq	-288(%rbp), %r9
	movq	-296(%rbp), %r8
	movq	-304(%rbp), %rdi
	xorl	%ecx, %ecx
	.p2align 4,,10
	.p2align 3
.L6117:
	movl	%ecx, %esi
	movzbl	(%rdi,%rsi), %edx
	movzbl	(%r8,%rsi), %r10d
	movzbl	(%r9,%rsi), %esi
	imull	$77, %edx, %edx
	imull	$150, %r10d, %r10d
	imull	$29, %esi, %esi
	movb	$-1, 1(%r12,%rcx,2)
	addl	%r10d, %edx
	addl	%esi, %edx
	movzbl	%dh, %ebx
	movb	%bl, (%r12,%rcx,2)
	incq	%rcx
	cmpl	%ecx, (%rax)
	ja	.L6117
	jmp	.L6104
.L6113:
	cmpl	$4, 8(%rax)
	je	.L6786
.L6118:
	cmpl	$1, -356(%rbp)
	movq	-304(%rbp), %rsi
	je	.L6122
	xorl	%edx, %edx
	testl	%r8d, %r8d
	je	.L6104
	.p2align 4,,10
	.p2align 3
.L6123:
	movl	%edx, %ecx
	movzbl	(%rsi,%rcx), %ecx
	movb	$-1, 1(%r12,%rdx,2)
	movb	%cl, (%r12,%rdx,2)
	incq	%rdx
	cmpl	%edx, (%rax)
	ja	.L6123
.L6735:
	movq	-432(%rbp), %rax
	movq	(%rax), %rax
	jmp	.L6104
.L6781:
	movl	-480(%rbp), %edi
	testl	%edi, %edi
	jne	.L6787
	movq	-432(%rbp), %rbx
	movl	-356(%rbp), %r9d
	movq	-288(%rbp), %rcx
	movq	-296(%rbp), %rdx
	movq	%r12, %rdi
	call	*18552(%rbx)
	movq	(%rbx), %rax
	jmp	.L6104
.L6782:
	movq	-488(%rbp), %rdi
	xorl	%edx, %edx
	testl	%r8d, %r8d
	je	.L6104
	.p2align 4,,10
	.p2align 3
.L6112:
	movl	%edx, %ecx
	movzbl	(%rsi,%rcx), %ecx
	movb	$-1, 3(%r12)
	movb	%cl, 2(%r12)
	movb	%cl, 1(%r12)
	movb	%cl, (%r12)
	incl	%edx
	addq	%rdi, %r12
	cmpl	(%rax), %edx
	jb	.L6112
	jmp	.L6735
.L6785:
	movq	%rax, %r15
	movl	8(%rax), %eax
	movq	-432(%rbp), %r12
	movl	%eax, -424(%rbp)
.L6095:
	movl	-424(%rbp), %eax
	testl	%eax, %eax
	jle	.L6127
	decl	%eax
	leaq	(%rax,%rax,2), %rax
	salq	$5, %rax
	leaq	18128(%r12), %r13
	leaq	18224(%r12,%rax), %rbx
.L6131:
	movq	8(%r13), %rdi
	testq	%rdi, %rdi
	je	.L6128
	call	free@PLT
	movq	$0, 8(%r13)
	movq	$0, 0(%r13)
.L6128:
	movq	16(%r13), %rdi
	testq	%rdi, %rdi
	je	.L6129
	call	free@PLT
	movq	$0, 16(%r13)
	movq	$0, 32(%r13)
.L6129:
	movq	24(%r13), %rdi
	testq	%rdi, %rdi
	je	.L6130
	call	free@PLT
	movq	$0, 24(%r13)
.L6130:
	addq	$96, %r13
	cmpq	%r13, %rbx
	jne	.L6131
	movq	(%r12), %r15
.L6127:
	movl	(%r15), %eax
	movq	-400(%rbp), %rsi
	movl	%eax, (%rsi)
	movq	-408(%rbp), %rsi
	movl	4(%r15), %eax
	movl	%eax, (%rsi)
	movq	-392(%rbp), %rsi
	testq	%rsi, %rsi
	je	.L6076
	xorl	%eax, %eax
	cmpl	$2, 8(%r15)
	setg	%al
	leal	1(%rax,%rax), %eax
	movl	%eax, (%rsi)
	jmp	.L6076
.L6786:
	movq	-432(%rbp), %rbx
	movl	18508(%rbx), %edx
	testl	%edx, %edx
	je	.L6788
	cmpl	$2, %edx
	jne	.L6118
	testl	%r8d, %r8d
	je	.L6104
	movq	-280(%rbp), %rdi
	movq	-304(%rbp), %rsi
	xorl	%ecx, %ecx
.L6121:
	movl	%ecx, %r8d
	movzbl	(%rsi,%r8), %edx
	movzbl	(%rdi,%r8), %r8d
	notl	%edx
	movzbl	%dl, %edx
	imull	%r8d, %edx
	movb	$-1, 1(%r12)
	incl	%ecx
	subl	$-128, %edx
	movl	%edx, %r8d
	shrl	$8, %r8d
	addl	%r8d, %edx
	movzbl	%dh, %ebx
	movb	%bl, (%r12)
	addq	-488(%rbp), %r12
	cmpl	(%rax), %ecx
	jb	.L6121
	jmp	.L6735
.L6114:
	testl	%r8d, %r8d
	je	.L6104
	movq	-288(%rbp), %r9
	movq	-296(%rbp), %r8
	movq	-304(%rbp), %rdi
	xorl	%ecx, %ecx
	.p2align 4,,10
	.p2align 3
.L6116:
	movl	%ecx, %esi
	movzbl	(%rdi,%rsi), %edx
	movzbl	(%r8,%rsi), %r10d
	movzbl	(%r9,%rsi), %esi
	imull	$77, %edx, %edx
	imull	$150, %r10d, %r10d
	imull	$29, %esi, %esi
	addl	%r10d, %edx
	addl	%esi, %edx
	movzbl	%dh, %ebx
	movb	%bl, (%r12,%rcx)
	incq	%rcx
	cmpl	%ecx, (%rax)
	ja	.L6116
	jmp	.L6104
.L6122:
	testl	%r8d, %r8d
	je	.L6104
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L6124:
	movl	%edx, %ecx
	movzbl	(%rsi,%rcx), %edi
	incl	%edx
	movb	%dil, (%r12,%rcx)
	cmpl	(%rax), %edx
	jb	.L6124
	jmp	.L6735
.L6168:
	movabsq	$-4295000321, %rcx
	sarx	%rdx, %rcx, %rcx
	andl	$1, %ecx
	testb	%bl, %bl
	je	.L6389
	testb	%al, %al
	jne	.L6161
.L6389:
	movq	216(%r15), %rax
	movq	208(%r15), %rsi
	testb	%cl, %cl
	jne	.L6171
.L6173:
	movq	%rsi, 192(%r15)
	movq	%rax, 200(%r15)
	cmpq	%rsi, %rax
	ja	.L6789
	movl	48(%r15), %r12d
	movb	$0, -384(%rbp)
	movl	%r12d, %ebx
	testl	%r12d, %r12d
	jne	.L6790
.L6177:
	movl	$0, -432(%rbp)
	testl	%ebx, %ebx
	jne	.L6791
.L6181:
	movq	%r15, %rdi
	call	stbi__get16le
	movq	%r15, %rdi
	movl	%eax, -464(%rbp)
	call	stbi__get16le
	movl	%eax, -472(%rbp)
	movq	192(%r15), %rax
	cmpq	200(%r15), %rax
	jb	.L6792
	movl	48(%r15), %r9d
	xorl	%r13d, %r13d
	testl	%r9d, %r9d
	jne	.L6793
.L6189:
	movq	%r15, %rdi
	movl	%r9d, -368(%rbp)
	call	stbi__get16le
	movq	%r15, %rdi
	call	stbi__get16le
	movq	%r15, %rdi
	call	stbi__get16le
	movq	%r15, %rdi
	movl	%eax, -440(%rbp)
	call	stbi__get16le
	movl	%eax, -424(%rbp)
	movq	192(%r15), %rcx
	movq	200(%r15), %rax
	movl	-368(%rbp), %r9d
	cmpq	%rax, %rcx
	jb	.L6794
	movl	48(%r15), %eax
	xorl	%r14d, %r14d
	movl	%eax, -456(%rbp)
	xorl	%ecx, %ecx
	testl	%eax, %eax
	jne	.L6795
.L6194:
	cmpl	$16777216, -424(%rbp)
	movl	$0, -60(%rbp)
	jg	.L6203
	cmpl	$16777216, -440(%rbp)
	jg	.L6203
	movl	$0, -448(%rbp)
	cmpl	$7, %ebx
	jle	.L6204
	movl	$1, -448(%rbp)
	subl	$8, %ebx
.L6204:
	movl	-432(%rbp), %eax
	testl	%eax, %eax
	je	.L6205
	cmpb	$16, %r13b
	ja	.L6206
	cmpb	$14, %r13b
	ja	.L6377
	movl	$0, -416(%rbp)
	movl	$1, %r14d
	cmpb	$8, %r13b
	jne	.L6208
.L6207:
	movq	-400(%rbp), %rax
	movl	-440(%rbp), %ebx
	movl	%ebx, (%rax)
	movq	-408(%rbp), %rax
	movl	-424(%rbp), %ebx
	movl	%ebx, (%rax)
	movq	-392(%rbp), %rax
	testq	%rax, %rax
	je	.L6214
	movl	%r14d, (%rax)
.L6214:
	movl	-440(%rbp), %ebx
	movl	-424(%rbp), %esi
	movl	%ebx, %eax
	orl	%esi, %eax
	js	.L6203
	testl	%esi, %esi
	je	.L6215
	movl	$2147483647, %r13d
	movl	%r13d, %eax
	cltd
	idivl	%esi
	cmpl	%eax, %ebx
	jg	.L6203
	movl	%r13d, %eax
	cltd
	idivl	%r14d
	movl	-424(%rbp), %esi
	imull	%ebx, %esi
	movl	%esi, -400(%rbp)
	movl	%eax, %r13d
	cmpl	%esi, %eax
	jl	.L6203
.L6322:
	movl	-400(%rbp), %edi
	movb	%cl, -392(%rbp)
	imull	%r14d, %edi
	movslq	%edi, %rdi
	call	malloc@PLT
	testq	%rax, %rax
	movq	%rax, -368(%rbp)
	movzbl	-392(%rbp), %ecx
	je	.L6738
	testl	%r12d, %r12d
	je	.L6218
	cmpq	$0, 16(%r15)
	movq	192(%r15), %rax
	je	.L6219
	movq	200(%r15), %rsi
	movq	%rsi, %rdx
	subq	%rax, %rdx
	cmpl	%r12d, %edx
	jl	.L6796
.L6219:
	movzbl	-384(%rbp), %edx
	addq	%rdx, %rax
	movq	%rax, 192(%r15)
.L6218:
	movl	-432(%rbp), %ebx
	movl	%ecx, %eax
	andl	$32, %eax
	orl	-448(%rbp), %ebx
	movb	%al, -496(%rbp)
	jne	.L6220
	movl	-416(%rbp), %ebx
	testl	%ebx, %ebx
	jne	.L6381
	movl	-424(%rbp), %r11d
	testl	%r11d, %r11d
	jle	.L6222
	movl	-440(%rbp), %ebx
	imull	%r14d, %ebx
	testb	%al, %al
	je	.L6223
	movq	-368(%rbp), %r12
	movslq	%ebx, %r13
.L6224:
	movq	%r12, %rsi
	movl	%ebx, %edx
	movq	%r15, %rdi
	call	stbi__getn
	incl	-416(%rbp)
	addq	%r13, %r12
	movl	-416(%rbp), %eax
	cmpl	-424(%rbp), %eax
	jne	.L6224
.L6222:
	cmpl	$2, %r14d
	jle	.L6316
.L6315:
	movl	-400(%rbp), %ecx
	movq	-368(%rbp), %rax
	movslq	%r14d, %rdx
	testl	%ecx, %ecx
	je	.L6316
	movl	-480(%rbp), %ecx
.L6317:
	movzbl	(%rax), %esi
	movzbl	2(%rax), %edi
	incl	%ecx
	movb	%dil, (%rax)
	movb	%sil, 2(%rax)
	addq	%rdx, %rax
	cmpl	-400(%rbp), %ecx
	jne	.L6317
.L6316:
	movl	-356(%rbp), %eax
	testl	%eax, %eax
	je	.L5856
	cmpl	%r14d, %eax
	je	.L5856
	movl	-424(%rbp), %r8d
	movl	-440(%rbp), %ecx
	movq	-368(%rbp), %rdi
	movl	%eax, %edx
	movl	%r14d, %esi
	call	stbi__convert_format
	movq	%rax, -368(%rbp)
	jmp	.L5856
.L6729:
	movl	-448(%rbp), %r14d
.L6733:
	leaq	.LC229(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L5957
.L6151:
	xorl	%edi, %edi
	call	malloc@PLT
	movq	%rax, -368(%rbp)
	testq	%rax, %rax
	jne	.L6319
.L6150:
	movq	-424(%rbp), %rdi
	call	free@PLT
.L6739:
	leaq	.LC23(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	movq	$0, -368(%rbp)
	jmp	.L5856
.L6756:
	call	stbi__convert_format
	movq	%rax, -368(%rbp)
	jmp	.L5891
.L5950:
	leaq	.LC229(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	movq	$0, -368(%rbp)
	jmp	.L5856
.L5914:
	vmovq	%rdx, %xmm4
	vpunpcklqdq	%xmm4, %xmm4, %xmm0
	movl	$0, 48(%r15)
	movb	$0, 56(%r15)
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L5910
.L6783:
	testl	%r8d, %r8d
	je	.L6104
	movq	-280(%rbp), %r9
	movq	-296(%rbp), %r11
	movq	-288(%rbp), %rbx
	movq	-488(%rbp), %rcx
	xorl	%edi, %edi
.L6109:
	movl	%edi, %r10d
	movzbl	(%r9,%r10), %r8d
	movzbl	(%rsi,%r10), %edx
	incl	%edi
	imull	%r8d, %edx
	subl	$-128, %edx
	movl	%edx, %r13d
	shrl	$8, %r13d
	addl	%r13d, %edx
	movzbl	%dh, %edx
	movb	%dl, (%r12)
	movzbl	(%r11,%r10), %edx
	imull	%r8d, %edx
	subl	$-128, %edx
	movl	%edx, %r13d
	shrl	$8, %r13d
	addl	%r13d, %edx
	movzbl	%dh, %edx
	movb	%dl, 1(%r12)
	movzbl	(%rbx,%r10), %edx
	movb	$-1, 3(%r12)
	imull	%r8d, %edx
	subl	$-128, %edx
	movl	%edx, %r8d
	shrl	$8, %r8d
	addl	%r8d, %edx
	movzbl	%dh, %edx
	movb	%dl, 2(%r12)
	addq	%rcx, %r12
	cmpl	(%rax), %edi
	jb	.L6109
	jmp	.L6735
.L5921:
	cltq
	addq	%r12, %rax
	vmovq	%rdx, %xmm4
	vpinsrq	$1, %rax, %xmm4, %xmm0
	movzbl	56(%r15), %ecx
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L5920
.L6779:
	movl	48(%r15), %eax
	testl	%eax, %eax
	je	.L6797
	movl	52(%r15), %edx
	movq	40(%r15), %rdi
	movq	-432(%rbp), %rsi
	call	*%r10
	movq	192(%r15), %rdx
	subq	208(%r15), %rdx
	addl	%edx, 184(%r15)
	movq	-424(%rbp), %rdx
	testl	%eax, %eax
	jne	.L5972
	movl	$0, 48(%r15)
	movb	$0, 56(%r15)
	movq	%rdx, %rax
	xorl	%esi, %esi
	vmovq	%rdx, %xmm3
.L5973:
	vpinsrq	$1, %rax, %xmm3, %xmm0
	movq	16(%r15), %r10
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L5971
.L6778:
	movl	48(%r15), %eax
	testl	%eax, %eax
	je	.L6798
	movl	52(%r15), %edx
	movq	-432(%rbp), %rsi
	movq	40(%r15), %rdi
	call	*%r10
	movq	192(%r15), %rdx
	movq	-424(%rbp), %rsi
	subq	208(%r15), %rdx
	addl	%edx, 184(%r15)
	testl	%eax, %eax
	jne	.L5966
	movl	$0, 48(%r15)
	movb	$0, 56(%r15)
	movq	%rsi, %rax
	xorl	%ebx, %ebx
	vmovq	%rsi, %xmm2
.L5967:
	vpinsrq	$1, %rax, %xmm2, %xmm0
	movq	16(%r15), %r10
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L5965
.L6787:
	testl	%r8d, %r8d
	je	.L6104
	movq	-296(%rbp), %r9
	movq	-288(%rbp), %r8
	movq	-488(%rbp), %r10
	xorl	%edx, %edx
.L6105:
	movl	%edx, %ecx
	movzbl	(%rsi,%rcx), %edi
	incl	%edx
	movb	%dil, (%r12)
	movzbl	(%r9,%rcx), %edi
	movb	%dil, 1(%r12)
	movzbl	(%r8,%rcx), %ecx
	movb	$-1, 3(%r12)
	movb	%cl, 2(%r12)
	addq	%r10, %r12
	cmpl	(%rax), %edx
	jb	.L6105
	jmp	.L6735
.L6761:
	movl	18512(%r12), %eax
	movl	$1, -480(%rbp)
	movl	%eax, -384(%rbp)
	cmpl	$3, %eax
	je	.L6086
	cmpq	$0, 18504(%r12)
	movl	$3, -384(%rbp)
	je	.L6086
	xorl	%eax, %eax
	cmpl	$2, -356(%rbp)
	setg	%al
	leal	1(%rax,%rax), %eax
	movl	$0, -480(%rbp)
	movl	%eax, -384(%rbp)
	jmp	.L6086
.L6776:
	movl	52(%r15), %edx
	movq	-432(%rbp), %rsi
	movq	40(%r15), %rdi
	call	*%r10
	movq	192(%r15), %rdx
	movq	-424(%rbp), %rsi
	subq	208(%r15), %rdx
	addl	%edx, 184(%r15)
	testl	%eax, %eax
	jne	.L5977
	movl	$0, 48(%r15)
	movb	$0, 56(%r15)
	movq	%rsi, %rax
	xorl	%edx, %edx
	vmovq	%rsi, %xmm4
.L5978:
	vpinsrq	$1, %rax, %xmm4, %xmm0
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L5975
.L6231:
	movq	-408(%rbp), %rsi
	movl	%r12d, %edx
	movq	%r15, %rdi
	call	stbi__getn
	testl	%eax, %eax
	jne	.L6221
	movq	-368(%rbp), %rdi
	call	free@PLT
	movq	-408(%rbp), %rdi
	call	free@PLT
	leaq	.LC370(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
.L6740:
	movq	$0, -368(%rbp)
	jmp	.L5856
.L5939:
	addq	%r12, %rdx
	movq	%rdx, 200(%r15)
	movzbl	56(%r15), %eax
	jmp	.L5938
.L6319:
	movl	-356(%rbp), %eax
	decl	%eax
	movl	%eax, -408(%rbp)
	jmp	.L6152
.L6353:
	movl	$1, -356(%rbp)
	jmp	.L6085
.L6780:
	andl	$-9, %eax
	cmpb	$1, %al
	jne	.L6161
	movq	%r15, %rdi
	movl	$4, %esi
	call	stbi__skip.part.0
	movq	%r15, %rdi
	call	stbi__get8
	cmpb	$32, %al
	ja	.L6161
	movabsq	$-4311843073, %rdx
	btq	%rax, %rdx
	jc	.L6161
	movl	$4, %esi
	movq	%r15, %rdi
	call	stbi__skip.part.0
	jmp	.L6165
.L5966:
	cltq
	movzbl	56(%r15), %ebx
	addq	-432(%rbp), %rax
	vmovq	%rsi, %xmm2
	jmp	.L5967
.L6770:
	vcvttss2sil	%xmm0, %edx
	jmp	.L6158
.L5977:
	movzbl	56(%r15), %edi
	cltq
	orl	%edi, -456(%rbp)
	addq	-432(%rbp), %rax
	movl	%edi, %edx
	vmovq	%rsi, %xmm4
	jmp	.L5978
.L5961:
	cltq
	movzbl	56(%r15), %r13d
	addq	-432(%rbp), %rax
	vmovq	%rdi, %xmm7
	jmp	.L5962
.L5972:
	cltq
	movzbl	56(%r15), %esi
	addq	-432(%rbp), %rax
	vmovq	%rdx, %xmm3
	jmp	.L5973
.L6784:
	call	*%rax
	movq	-432(%rbp), %rax
	movq	(%rax), %rax
	movl	(%rax), %ecx
	testl	%ecx, %ecx
	je	.L6104
	movq	-280(%rbp), %rsi
	movq	-488(%rbp), %rdi
	xorl	%ecx, %ecx
.L6111:
	movl	%ecx, %edx
	movzbl	(%rsi,%rdx), %r8d
	movzbl	(%r12), %edx
	incl	%ecx
	notl	%edx
	movzbl	%dl, %edx
	imull	%r8d, %edx
	subl	$-128, %edx
	movl	%edx, %r9d
	shrl	$8, %r9d
	addl	%r9d, %edx
	movzbl	%dh, %ebx
	movzbl	1(%r12), %edx
	movb	%bl, (%r12)
	notl	%edx
	movzbl	%dl, %edx
	imull	%r8d, %edx
	subl	$-128, %edx
	movl	%edx, %r9d
	shrl	$8, %r9d
	addl	%r9d, %edx
	movzbl	%dh, %ebx
	movzbl	2(%r12), %edx
	movb	%bl, 1(%r12)
	notl	%edx
	movzbl	%dl, %edx
	imull	%r8d, %edx
	subl	$-128, %edx
	movl	%edx, %r8d
	shrl	$8, %r8d
	addl	%r8d, %edx
	movzbl	%dh, %ebx
	movb	%bl, 2(%r12)
	addq	%rdi, %r12
	cmpl	(%rax), %ecx
	jb	.L6111
	jmp	.L6104
.L6788:
	testl	%r8d, %r8d
	je	.L6104
	movq	-280(%rbp), %r10
	movq	-304(%rbp), %r9
	movq	-296(%rbp), %rbx
	movq	-288(%rbp), %r13
	movq	-488(%rbp), %rsi
	xorl	%r8d, %r8d
.L6120:
	movl	%r8d, %ecx
	movzbl	(%r10,%rcx), %r14d
	movzbl	(%r9,%rcx), %edx
	movzbl	(%rbx,%rcx), %r11d
	imull	%r14d, %edx
	imull	%r14d, %r11d
	movzbl	0(%r13,%rcx), %edi
	subl	$-128, %edx
	movl	%edx, %ecx
	subl	$-128, %r11d
	shrl	$8, %ecx
	addl	%ecx, %edx
	movl	%r11d, %ecx
	shrl	$8, %ecx
	addl	%r11d, %ecx
	imull	%r14d, %edi
	shrl	$8, %edx
	shrl	$8, %ecx
	imull	$150, %ecx, %ecx
	imull	$77, %edx, %edx
	subl	$-128, %edi
	movb	$-1, 1(%r12)
	addl	%ecx, %edx
	movl	%edi, %ecx
	shrl	$8, %ecx
	addl	%edi, %ecx
	shrl	$8, %ecx
	imull	$29, %ecx, %ecx
	incl	%r8d
	addl	%ecx, %edx
	movzbl	%dh, %ecx
	movb	%cl, (%r12)
	addq	%rsi, %r12
	cmpl	(%rax), %r8d
	jb	.L6120
	jmp	.L6735
.L6206:
	subl	$24, %r13d
	andl	$247, %r13d
	je	.L6799
.L6208:
	leaq	.LC369(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	movq	$0, -368(%rbp)
	jmp	.L5856
.L6205:
	leal	-8(%r14), %r8d
	cmpb	$24, %r8b
	ja	.L6208
	leaq	.L6211(%rip), %rdx
	movzbl	%r8b, %r8d
	movslq	(%rdx,%r8,4), %rax
	addq	%rdx, %rax
	notrack jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L6211:
	.long	.L6213-.L6211
	.long	.L6208-.L6211
	.long	.L6208-.L6211
	.long	.L6208-.L6211
	.long	.L6208-.L6211
	.long	.L6208-.L6211
	.long	.L6208-.L6211
	.long	.L6377-.L6211
	.long	.L6212-.L6211
	.long	.L6208-.L6211
	.long	.L6208-.L6211
	.long	.L6208-.L6211
	.long	.L6208-.L6211
	.long	.L6208-.L6211
	.long	.L6208-.L6211
	.long	.L6208-.L6211
	.long	.L6210-.L6211
	.long	.L6208-.L6211
	.long	.L6208-.L6211
	.long	.L6208-.L6211
	.long	.L6208-.L6211
	.long	.L6208-.L6211
	.long	.L6208-.L6211
	.long	.L6208-.L6211
	.long	.L6210-.L6211
	.text
.L6794:
	leaq	1(%rcx), %rdx
	movq	%rdx, 192(%r15)
	movzbl	(%rcx), %esi
	movl	%esi, -456(%rbp)
	movl	%esi, %r14d
.L6193:
	cmpq	%rdx, %rax
	jbe	.L6800
	leaq	1(%rdx), %rax
	movq	%rax, 192(%r15)
	movzbl	(%rdx), %ecx
	jmp	.L6194
.L6792:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%r15)
	movzbl	(%rax), %r9d
	movl	%r9d, %r13d
	jmp	.L6189
.L6789:
	leaq	1(%rsi), %rcx
	movq	%rcx, 192(%r15)
	movzbl	(%rsi), %r12d
	movb	%r12b, -384(%rbp)
.L6176:
	cmpq	%rax, %rcx
	jnb	.L6801
	leaq	1(%rcx), %rdx
	movq	%rdx, 192(%r15)
	movzbl	(%rcx), %ebx
	movl	%ebx, -432(%rbp)
.L6180:
	cmpq	%rax, %rdx
	jnb	.L6802
	leaq	1(%rdx), %rax
	movq	%rax, 192(%r15)
	movzbl	(%rdx), %ebx
	jmp	.L6181
.L6760:
	movq	(%r12), %rax
	movl	8(%rax), %eax
	testl	%eax, %eax
	jle	.L6736
	decl	%eax
	leaq	(%rax,%rax,2), %rax
	salq	$5, %rax
	leaq	18128(%r12), %rbx
	leaq	18224(%r12,%rax), %r13
.L6082:
	movq	8(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L6079
	call	free@PLT
	movq	$0, 8(%rbx)
	movq	$0, (%rbx)
.L6079:
	movq	16(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L6080
	call	free@PLT
	movq	$0, 16(%rbx)
	movq	$0, 32(%rbx)
.L6080:
	movq	24(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L6081
	call	free@PLT
	movq	$0, 24(%rbx)
.L6081:
	addq	$96, %rbx
	cmpq	%r13, %rbx
	jne	.L6082
.L6736:
	movq	$0, -368(%rbp)
	jmp	.L6076
.L6220:
	movl	-432(%rbp), %r10d
	testl	%r10d, %r10d
	je	.L6381
	movl	-472(%rbp), %r9d
	testl	%r9d, %r9d
	je	.L6803
	movl	-464(%rbp), %r8d
	testl	%r8d, %r8d
	je	.L6227
	js	.L6804
	movl	-464(%rbp), %esi
	movq	%r15, %rdi
	call	stbi__skip.part.0
.L6227:
	cmpl	%r13d, -472(%rbp)
	ja	.L6230
	movl	-472(%rbp), %r12d
	imull	%r14d, %r12d
	movslq	%r12d, %rdi
	call	malloc@PLT
	movq	%rax, -408(%rbp)
	testq	%rax, %rax
	je	.L6230
	movl	-416(%rbp), %edi
	testl	%edi, %edi
	je	.L6231
	cmpl	$3, %r14d
	jne	.L6805
	movq	%rax, %r12
	xorl	%r13d, %r13d
.L6232:
	movq	%r15, %rdi
	call	stbi__get16le
	movl	%eax, %ecx
	shrw	$10, %cx
	andl	$31, %ecx
	movl	%eax, %edx
	movl	%ecx, %eax
	sall	$8, %eax
	subl	%ecx, %eax
	movl	%eax, %ecx
	imulq	$138547333, %rcx, %rcx
	incl	%r13d
	addq	$3, %r12
	shrq	$32, %rcx
	subl	%ecx, %eax
	shrl	%eax
	addl	%ecx, %eax
	movl	%edx, %ecx
	shrw	$5, %cx
	andl	$31, %ecx
	shrl	$4, %eax
	movb	%al, -3(%r12)
	movl	%ecx, %eax
	sall	$8, %eax
	subl	%ecx, %eax
	movl	%eax, %ecx
	imulq	$138547333, %rcx, %rcx
	andl	$31, %edx
	shrq	$32, %rcx
	subl	%ecx, %eax
	shrl	%eax
	addl	%ecx, %eax
	shrl	$4, %eax
	movb	%al, -2(%r12)
	movl	%edx, %eax
	sall	$8, %eax
	subl	%edx, %eax
	movl	%eax, %edx
	imulq	$138547333, %rdx, %rdx
	shrq	$32, %rdx
	subl	%edx, %eax
	shrl	%eax
	addl	%edx, %eax
	shrl	$4, %eax
	movb	%al, -1(%r12)
	cmpl	%r13d, -472(%rbp)
	jg	.L6232
.L6221:
	movl	-400(%rbp), %esi
	testl	%esi, %esi
	je	.L6271
	leaq	57(%r15), %rsi
	movq	-368(%rbp), %rbx
	leaq	-60(%rbp), %r13
	movslq	%r14d, %rax
	movq	%rsi, -384(%rbp)
	movq	%r13, %rsi
	movq	%rax, -488(%rbp)
	movq	%r15, %r13
	movl	$0, -392(%rbp)
	movq	%rbx, %r15
	movl	$0, -464(%rbp)
	movl	%r14d, %ebx
	xorl	%r12d, %r12d
	movl	$1, %eax
	movq	%rsi, %r14
	jmp	.L6270
.L6811:
	testl	%r12d, %r12d
	je	.L6806
	movl	-464(%rbp), %edx
	testl	%edx, %edx
	je	.L6236
	testl	%eax, %eax
	jne	.L6807
.L6242:
	cmpl	$8, %ebx
	jnb	.L6264
.L6704:
	testb	$4, %bl
	jne	.L6808
	testl	%ebx, %ebx
	je	.L6265
	movzbl	(%r14), %eax
	movb	%al, (%r15)
	testb	$2, %bl
	jne	.L6809
.L6265:
	incl	-392(%rbp)
	decl	%r12d
	addq	-488(%rbp), %r15
	movl	-392(%rbp), %eax
	cmpl	-400(%rbp), %eax
	je	.L6810
	xorl	%eax, %eax
.L6270:
	movl	-448(%rbp), %ecx
	testl	%ecx, %ecx
	jne	.L6811
.L6236:
	movl	-432(%rbp), %eax
	testl	%eax, %eax
	jne	.L6812
	movl	-416(%rbp), %eax
	testl	%eax, %eax
	je	.L6253
	cmpl	$3, %ebx
	jne	.L6813
	movq	192(%r13), %rsi
	movq	200(%r13), %rax
	cmpq	%rax, %rsi
	jb	.L6814
	movl	48(%r13), %r11d
	testl	%r11d, %r11d
	jne	.L6815
.L6257:
	movl	%r11d, %edx
	shrw	$10, %dx
	andl	$31, %edx
	movl	%edx, %eax
	sall	$8, %eax
	subl	%edx, %eax
	movl	%eax, %edx
	imulq	$138547333, %rdx, %rdx
	shrq	$32, %rdx
	subl	%edx, %eax
	shrl	%eax
	addl	%edx, %eax
	movl	%r11d, %edx
	shrw	$5, %dx
	andl	$31, %edx
	shrl	$4, %eax
	movb	%al, -60(%rbp)
	movl	%edx, %eax
	sall	$8, %eax
	subl	%edx, %eax
	movl	%eax, %edx
	imulq	$138547333, %rdx, %rdx
	andl	$31, %r11d
	shrq	$32, %rdx
	subl	%edx, %eax
	shrl	%eax
	addl	%edx, %eax
	shrl	$4, %eax
	movb	%al, -59(%rbp)
	movl	%r11d, %eax
	sall	$8, %eax
	subl	%r11d, %eax
	movl	%eax, %edx
	imulq	$138547333, %rdx, %rdx
	shrq	$32, %rdx
	subl	%edx, %eax
	shrl	%eax
	addl	%edx, %eax
	shrl	$4, %eax
	movb	%al, -58(%rbp)
	jmp	.L6704
.L6264:
	movq	(%r14), %rax
	leaq	8(%r15), %rdi
	movq	%rax, (%r15)
	movl	%ebx, %eax
	andq	$-8, %rdi
	movq	-8(%r14,%rax), %rdx
	movq	%r14, %r11
	movq	%rdx, -8(%r15,%rax)
	movq	%r15, %rax
	subq	%rdi, %rax
	subq	%rax, %r11
	addl	%ebx, %eax
	andl	$-8, %eax
	cmpl	$8, %eax
	jb	.L6265
	andl	$-8, %eax
	xorl	%edx, %edx
.L6268:
	movl	%edx, %ecx
	movq	(%r11,%rcx), %rsi
	addl	$8, %edx
	movq	%rsi, (%rdi,%rcx)
	cmpl	%eax, %edx
	jb	.L6268
	jmp	.L6265
.L6806:
	movq	192(%r13), %rax
	cmpq	200(%r13), %rax
	jb	.L6816
	movl	48(%r13), %eax
	movl	-448(%rbp), %r12d
	movl	%eax, -464(%rbp)
	testl	%eax, %eax
	je	.L6236
	movl	52(%r13), %edx
	movq	40(%r13), %rdi
	leaq	56(%r13), %r12
	movq	%r12, %rsi
	call	*16(%r13)
	movq	192(%r13), %rdx
	subq	208(%r13), %rdx
	addl	%edx, 184(%r13)
	testl	%eax, %eax
	jne	.L6240
	movl	$0, 48(%r13)
	movb	$0, 56(%r13)
	movq	-384(%rbp), %r12
.L6241:
	vmovq	-384(%rbp), %xmm7
	movzbl	56(%r13), %eax
	vpinsrq	$1, %r12, %xmm7, %xmm0
	vmovdqu	%xmm0, 192(%r13)
.L6737:
	movl	%eax, %r12d
	andl	$127, %r12d
	incl	%r12d
	sarl	$7, %eax
	movl	%eax, -464(%rbp)
	movzbl	%r12b, %r12d
	jmp	.L6236
.L6812:
	cmpl	$8, -456(%rbp)
	movq	%r13, %rdi
	je	.L6817
	call	stbi__get16le
.L6245:
	xorl	%edx, %edx
	cmpl	%eax, -472(%rbp)
	jle	.L6246
	imull	%ebx, %eax
	movl	%eax, %edx
.L6246:
	movslq	%edx, %rax
	addq	-408(%rbp), %rax
	cmpl	$8, %ebx
	jnb	.L6247
	testb	$4, %bl
	jne	.L6818
	testl	%ebx, %ebx
	je	.L6704
	movzbl	(%rax), %edx
	movb	%dl, (%r14)
	testb	$2, %bl
	je	.L6242
	movl	%ebx, %edx
	movzwl	-2(%rax,%rdx), %eax
	movw	%ax, -2(%r14,%rdx)
	jmp	.L6242
	.p2align 4,,10
	.p2align 3
.L6253:
	movq	192(%r13), %rdx
	movq	200(%r13), %rax
	cmpq	%rax, %rdx
	jb	.L6272
	movl	48(%r13), %r10d
	testl	%r10d, %r10d
	jne	.L6819
	movb	$0, -60(%rbp)
	cmpl	$1, %ebx
	je	.L6704
.L6327:
	movl	48(%r13), %r9d
	testl	%r9d, %r9d
	jne	.L6820
	movb	$0, -59(%rbp)
	cmpl	$2, %ebx
	jle	.L6242
.L6326:
	movl	48(%r13), %r8d
	testl	%r8d, %r8d
	jne	.L6821
	movb	$0, -58(%rbp)
	cmpl	$3, %ebx
	jle	.L6242
.L6325:
	movl	48(%r13), %edi
	xorl	%r11d, %r11d
	testl	%edi, %edi
	jne	.L6822
.L6291:
	movb	%r11b, -57(%rbp)
	cmpl	$4, %ebx
	jle	.L6242
	movq	%r13, %r15
	cmpq	%rax, %rdx
	jb	.L6823
	movl	52(%r13), %edx
	movq	40(%r13), %rdi
	leaq	56(%r13), %rbx
	movq	%rbx, %rsi
	call	*16(%r13)
	movq	192(%r13), %rdx
	subq	208(%r13), %rdx
	addl	%edx, 184(%r13)
	leaq	57(%r13), %rdx
	testl	%eax, %eax
	jne	.L6297
	movl	$0, 48(%r13)
	movb	$0, 56(%r13)
	movq	%rdx, %rbx
.L6298:
	vmovq	%rdx, %xmm2
	vpinsrq	$1, %rbx, %xmm2, %xmm0
	vmovdqu	%xmm0, 192(%r15)
	.p2align 4,,10
	.p2align 3
.L6814:
	leaq	1(%rsi), %rdx
	movq	%rdx, 192(%r13)
	movzbl	(%rsi), %r11d
.L6256:
	cmpq	%rdx, %rax
	jbe	.L6824
	leaq	1(%rdx), %rax
	movq	%rax, 192(%r13)
	movzbl	(%rdx), %eax
	sall	$8, %eax
	addl	%eax, %r11d
	jmp	.L6257
.L6247:
	movq	(%rax), %rdx
	leaq	-56(%rbp), %rdi
	movq	%rdx, (%r14)
	movl	%ebx, %edx
	movq	-8(%rax,%rdx), %rsi
	movq	%rsi, -8(%r14,%rdx)
	movq	%r14, %rdx
	subq	%rdi, %rdx
	subq	%rdx, %rax
	addl	%ebx, %edx
	andl	$-8, %edx
	cmpl	$8, %edx
	jb	.L6242
	andl	$-8, %edx
	xorl	%esi, %esi
.L6251:
	movl	%esi, %ecx
	movq	(%rax,%rcx), %r8
	addl	$8, %esi
	movq	%r8, (%rdi,%rcx)
	cmpl	%edx, %esi
	jb	.L6251
	jmp	.L6242
.L6810:
	movl	%ebx, %r14d
.L6271:
	cmpb	$0, -496(%rbp)
	jne	.L6235
	movl	-424(%rbp), %eax
	testl	%eax, %eax
	jle	.L6235
	movl	-440(%rbp), %r12d
	decl	%eax
	imull	%r14d, %r12d
	movl	%eax, -392(%rbp)
	testl	%r12d, %r12d
	je	.L6235
	movl	%r12d, %eax
	shrl	$5, %eax
	decl	%eax
	incq	%rax
	salq	$5, %rax
	movq	%rax, %r9
	movl	%r12d, %eax
	movq	-368(%rbp), %rbx
	andl	$31, %eax
	movl	%eax, -432(%rbp)
	movslq	%r12d, %rax
	addq	%rbx, %rax
	movl	%r12d, %r15d
	movq	%rax, -448(%rbp)
	leal	-1(%r12), %r11d
	andl	$-32, %r15d
	xorl	%r13d, %r13d
	movq	%rbx, %rax
.L6304:
	movl	-392(%rbp), %edx
	movl	-440(%rbp), %esi
	subl	%r13d, %edx
	imull	%esi, %edx
	movl	%esi, %ecx
	imull	%r13d, %ecx
	imull	%r14d, %edx
	imull	%r14d, %ecx
	movslq	%edx, %r10
	leaq	32(%r10), %rsi
	movslq	%ecx, %rdi
	cmpq	%rsi, %rdi
	leaq	32(%rdi), %r8
	setge	%sil
	cmpq	%r8, %r10
	setge	%r8b
	orb	%r8b, %sil
	je	.L6303
	cmpl	$14, %r11d
	jbe	.L6303
	cmpl	$30, %r11d
	jbe	.L6387
	leaq	(%rax,%rdi), %rbx
	leaq	(%rax,%r10), %r8
	xorl	%esi, %esi
.L6306:
	vmovdqu	(%rbx,%rsi), %ymm0
	vmovdqu	(%r8,%rsi), %ymm7
	vmovdqu	%ymm7, (%rbx,%rsi)
	vmovdqu	%ymm0, (%r8,%rsi)
	addq	$32, %rsi
	cmpq	%rsi, %r9
	jne	.L6306
	addl	%r15d, %ecx
	addl	%r15d, %edx
	cmpl	%r15d, %r12d
	je	.L6311
	movl	%r15d, -384(%rbp)
	movl	-432(%rbp), %esi
.L6305:
	movl	%r12d, %ebx
	subl	-384(%rbp), %ebx
	leal	-1(%rbx), %r8d
	cmpl	$14, %r8d
	jbe	.L6308
	movl	-384(%rbp), %r8d
	addq	%r8, %rdi
	addq	%r10, %r8
	addq	%rax, %r8
	vmovdqu	(%r8), %xmm3
	addq	%rax, %rdi
	vmovdqu	(%rdi), %xmm0
	vmovdqu	%xmm3, (%rdi)
	movl	%ebx, %edi
	andl	$-16, %edi
	vmovdqu	%xmm0, (%r8)
	addl	%edi, %ecx
	addl	%edi, %edx
	subl	%edi, %esi
	cmpl	%ebx, %edi
	je	.L6311
.L6308:
	movslq	%ecx, %r8
	movslq	%edx, %rdi
	addq	%rax, %r8
	addq	%rax, %rdi
	movzbl	(%r8), %r10d
	movzbl	(%rdi), %ebx
	movb	%bl, (%r8)
	movb	%r10b, (%rdi)
	leal	1(%rcx), %r8d
	leal	1(%rdx), %edi
	cmpl	$1, %esi
	je	.L6311
	movslq	%r8d, %r8
	movslq	%edi, %rdi
	addq	%rax, %r8
	addq	%rax, %rdi
	movzbl	(%r8), %r10d
	movzbl	(%rdi), %ebx
	movb	%bl, (%r8)
	movb	%r10b, (%rdi)
	leal	2(%rcx), %r8d
	leal	2(%rdx), %edi
	cmpl	$2, %esi
	je	.L6311
	movslq	%r8d, %r8
	movslq	%edi, %rdi
	addq	%rax, %r8
	addq	%rax, %rdi
	movzbl	(%r8), %r10d
	movzbl	(%rdi), %ebx
	movb	%bl, (%r8)
	movb	%r10b, (%rdi)
	leal	3(%rcx), %r8d
	leal	3(%rdx), %edi
	cmpl	$3, %esi
	je	.L6311
	movslq	%r8d, %r8
	movslq	%edi, %rdi
	addq	%rax, %r8
	addq	%rax, %rdi
	movzbl	(%r8), %r10d
	movzbl	(%rdi), %ebx
	movb	%bl, (%r8)
	movb	%r10b, (%rdi)
	leal	4(%rcx), %r8d
	leal	4(%rdx), %edi
	cmpl	$4, %esi
	je	.L6311
	movslq	%r8d, %r8
	movslq	%edi, %rdi
	addq	%rax, %r8
	addq	%rax, %rdi
	movzbl	(%r8), %r10d
	movzbl	(%rdi), %ebx
	movb	%bl, (%r8)
	movb	%r10b, (%rdi)
	leal	5(%rcx), %r8d
	leal	5(%rdx), %edi
	cmpl	$5, %esi
	je	.L6311
	movslq	%r8d, %r8
	movslq	%edi, %rdi
	addq	%rax, %r8
	addq	%rax, %rdi
	movzbl	(%r8), %r10d
	movzbl	(%rdi), %ebx
	movb	%bl, (%r8)
	movb	%r10b, (%rdi)
	leal	6(%rcx), %r8d
	leal	6(%rdx), %edi
	cmpl	$6, %esi
	je	.L6311
	movslq	%r8d, %r8
	movslq	%edi, %rdi
	addq	%rax, %r8
	addq	%rax, %rdi
	movzbl	(%r8), %r10d
	movzbl	(%rdi), %ebx
	movb	%bl, (%r8)
	movb	%r10b, (%rdi)
	leal	7(%rcx), %r8d
	leal	7(%rdx), %edi
	cmpl	$7, %esi
	je	.L6311
	movslq	%r8d, %r8
	movslq	%edi, %rdi
	addq	%rax, %r8
	addq	%rax, %rdi
	movzbl	(%r8), %r10d
	movzbl	(%rdi), %ebx
	movb	%bl, (%r8)
	movb	%r10b, (%rdi)
	leal	8(%rcx), %r8d
	leal	8(%rdx), %edi
	cmpl	$8, %esi
	je	.L6311
	movslq	%r8d, %r8
	movslq	%edi, %rdi
	addq	%rax, %r8
	addq	%rax, %rdi
	movzbl	(%r8), %r10d
	movzbl	(%rdi), %ebx
	movb	%bl, (%r8)
	movb	%r10b, (%rdi)
	leal	9(%rcx), %r8d
	leal	9(%rdx), %edi
	cmpl	$9, %esi
	je	.L6311
	movslq	%r8d, %r8
	movslq	%edi, %rdi
	addq	%rax, %r8
	addq	%rax, %rdi
	movzbl	(%r8), %r10d
	movzbl	(%rdi), %ebx
	movb	%bl, (%r8)
	movb	%r10b, (%rdi)
	leal	10(%rcx), %r8d
	leal	10(%rdx), %edi
	cmpl	$10, %esi
	je	.L6311
	movslq	%r8d, %r8
	movslq	%edi, %rdi
	addq	%rax, %r8
	addq	%rax, %rdi
	movzbl	(%r8), %r10d
	movzbl	(%rdi), %ebx
	movb	%bl, (%r8)
	movb	%r10b, (%rdi)
	leal	11(%rcx), %r8d
	leal	11(%rdx), %edi
	cmpl	$11, %esi
	je	.L6311
	movslq	%r8d, %r8
	movslq	%edi, %rdi
	addq	%rax, %r8
	addq	%rax, %rdi
	movzbl	(%r8), %r10d
	movzbl	(%rdi), %ebx
	movb	%bl, (%r8)
	movb	%r10b, (%rdi)
	leal	12(%rcx), %r8d
	leal	12(%rdx), %edi
	cmpl	$12, %esi
	je	.L6311
	movslq	%r8d, %r8
	movslq	%edi, %rdi
	addq	%rax, %r8
	addq	%rax, %rdi
	movzbl	(%r8), %r10d
	movzbl	(%rdi), %ebx
	movb	%bl, (%r8)
	movb	%r10b, (%rdi)
	leal	13(%rcx), %r8d
	leal	13(%rdx), %edi
	cmpl	$13, %esi
	je	.L6311
	movslq	%r8d, %r8
	movslq	%edi, %rdi
	addq	%rax, %r8
	addq	%rax, %rdi
	movzbl	(%r8), %r10d
	movzbl	(%rdi), %ebx
	addl	$14, %ecx
	movb	%bl, (%r8)
	addl	$14, %edx
	movb	%r10b, (%rdi)
	cmpl	$14, %esi
	je	.L6311
	movslq	%ecx, %rcx
	movslq	%edx, %rdx
	addq	%rax, %rcx
	addq	%rax, %rdx
	movzbl	(%rcx), %esi
	movzbl	(%rdx), %edi
	movb	%dil, (%rcx)
	movb	%sil, (%rdx)
.L6311:
	incl	%r13d
	leal	(%r13,%r13), %edx
	cmpl	%edx, -424(%rbp)
	jg	.L6304
	vzeroupper
.L6235:
	cmpq	$0, -408(%rbp)
	je	.L6300
	movq	-408(%rbp), %rdi
	call	free@PLT
.L6300:
	cmpl	$2, %r14d
	jle	.L6316
	movl	-416(%rbp), %esi
	testl	%esi, %esi
	jne	.L6316
	jmp	.L6315
.L6303:
	movq	-448(%rbp), %rbx
	leaq	(%rax,%rdi), %rdx
	addq	%rdi, %rbx
.L6310:
	movq	%rdx, %rcx
	subq	%rdi, %rcx
	movzbl	(%rcx,%r10), %r8d
	movzbl	(%rdx), %esi
	movb	%r8b, (%rdx)
	incq	%rdx
	movb	%sil, (%rcx,%r10)
	cmpq	%rdx, %rbx
	jne	.L6310
	jmp	.L6311
.L6808:
	movl	(%r14), %eax
	movl	%eax, (%r15)
	movl	%ebx, %eax
	movl	-4(%r14,%rax), %edx
	movl	%edx, -4(%r15,%rax)
	jmp	.L6265
.L6817:
	call	stbi__get8
	movzbl	%al, %eax
	jmp	.L6245
.L6816:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%r13)
	movzbl	(%rax), %eax
	jmp	.L6737
.L6815:
	movl	52(%r13), %edx
	movq	40(%r13), %rdi
	leaq	56(%r13), %rsi
	movq	%rsi, -504(%rbp)
	call	*16(%r13)
	movslq	%eax, %r11
	movq	192(%r13), %rax
	movq	-384(%rbp), %rdx
	subq	208(%r13), %rax
	addl	%eax, 184(%r13)
	testl	%r11d, %r11d
	movq	-504(%rbp), %rsi
	jne	.L6258
	movl	$0, 48(%r13)
	movb	$0, 56(%r13)
	movq	%rdx, %rax
	vmovq	%rdx, %xmm2
.L6259:
	vpinsrq	$1, %rax, %xmm2, %xmm0
	vmovdqu	%xmm0, 192(%r13)
	jmp	.L6256
.L6824:
	movl	48(%r13), %eax
	testl	%eax, %eax
	je	.L6257
	movl	52(%r13), %edx
	movq	40(%r13), %rdi
	leaq	56(%r13), %rsi
	movl	%r11d, -360(%rbp)
	movq	%rsi, -504(%rbp)
	call	*16(%r13)
	movq	192(%r13), %rdx
	movq	-504(%rbp), %rsi
	subq	208(%r13), %rdx
	addl	%edx, 184(%r13)
	testl	%eax, %eax
	movl	-360(%rbp), %r11d
	jne	.L6262
	movl	$0, 48(%r13)
	movb	$0, 56(%r13)
	movq	-384(%rbp), %rsi
.L6263:
	vmovq	-384(%rbp), %xmm3
	vpinsrq	$1, %rsi, %xmm3, %xmm0
	vmovdqu	%xmm0, 192(%r13)
	jmp	.L6257
.L6272:
	leaq	1(%rdx), %rdi
	movq	%rdi, 192(%r13)
	movzbl	(%rdx), %edx
.L6276:
	movb	%dl, -60(%rbp)
	cmpl	$1, %ebx
	je	.L6704
	cmpq	%rax, %rdi
	jnb	.L6825
	leaq	1(%rdi), %rdx
	movq	%rdx, 192(%r13)
	movzbl	(%rdi), %esi
.L6282:
	movb	%sil, -59(%rbp)
	cmpl	$2, %ebx
	jle	.L6242
	cmpq	%rdx, %rax
	jbe	.L6326
	leaq	1(%rdx), %rdi
	movq	%rdi, 192(%r13)
	movzbl	(%rdx), %esi
	movq	%rdi, %rdx
.L6288:
	movb	%sil, -58(%rbp)
	cmpl	$3, %ebx
	jle	.L6242
	cmpq	%rax, %rdx
	jnb	.L6325
	leaq	1(%rdx), %rsi
	movq	%rsi, 192(%r13)
	movzbl	(%rdx), %r11d
	movq	%rsi, %rdx
	jmp	.L6291
.L6381:
	movq	$0, -408(%rbp)
	jmp	.L6221
.L6791:
	movl	52(%r15), %edx
	movq	40(%r15), %rdi
	leaq	56(%r15), %rbx
	movq	%rbx, %rsi
	call	*16(%r15)
	movl	%eax, -432(%rbp)
	movl	%eax, %esi
	movq	192(%r15), %rax
	leaq	57(%r15), %rdx
	subq	208(%r15), %rax
	addl	%eax, 184(%r15)
	testl	%esi, %esi
	jne	.L6182
	movl	$0, 48(%r15)
	movb	$0, 56(%r15)
	movq	%rdx, %rax
.L6183:
	vmovq	%rdx, %xmm2
	vpinsrq	$1, %rax, %xmm2, %xmm0
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L6180
.L6800:
	movl	48(%r15), %eax
	testl	%eax, %eax
	je	.L6826
	leaq	56(%r15), %rcx
	movl	52(%r15), %edx
	movq	40(%r15), %rdi
	movq	%rcx, %rsi
	movl	%r9d, -416(%rbp)
	movq	%rcx, -368(%rbp)
	call	*16(%r15)
	movq	192(%r15), %rdx
	movq	-368(%rbp), %rcx
	subq	208(%r15), %rdx
	addl	%edx, 184(%r15)
	testl	%eax, %eax
	movl	-416(%rbp), %r9d
	leaq	57(%r15), %rdx
	jne	.L6199
	movl	$0, 48(%r15)
	movb	$0, 56(%r15)
	movq	%rdx, %rax
	xorl	%ecx, %ecx
.L6200:
	vmovq	%rdx, %xmm6
	vpinsrq	$1, %rax, %xmm6, %xmm0
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L6194
.L6790:
	movl	52(%r15), %edx
	movq	40(%r15), %rdi
	leaq	56(%r15), %rbx
	movq	%rbx, %rsi
	call	*16(%r15)
	movl	%eax, %r12d
	movq	192(%r15), %rax
	leaq	57(%r15), %rcx
	subq	208(%r15), %rax
	addl	%eax, 184(%r15)
	testl	%r12d, %r12d
	jne	.L6178
	movl	$0, 48(%r15)
	movb	$0, 56(%r15)
	movq	%rcx, %rax
.L6179:
	vmovq	%rcx, %xmm7
	vpinsrq	$1, %rax, %xmm7, %xmm0
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L6176
.L6802:
	movl	48(%r15), %ebx
	testl	%ebx, %ebx
	je	.L6181
	movl	52(%r15), %edx
	movq	40(%r15), %rdi
	leaq	56(%r15), %r13
	movq	%r13, %rsi
	call	*16(%r15)
	movslq	%eax, %rbx
	movq	192(%r15), %rax
	leaq	57(%r15), %rdx
	subq	208(%r15), %rax
	addl	%eax, 184(%r15)
	testl	%ebx, %ebx
	jne	.L6186
	movl	$0, 48(%r15)
	movb	$0, 56(%r15)
	movq	%rdx, %rax
.L6187:
	vmovq	%rdx, %xmm3
	vpinsrq	$1, %rax, %xmm3, %xmm0
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L6181
.L6377:
	movl	$1, -416(%rbp)
	movl	$3, %r14d
	jmp	.L6207
.L6801:
	movl	48(%r15), %ebx
	jmp	.L6177
.L6093:
	movl	$1, %edi
	call	malloc@PLT
	movq	%rax, -368(%rbp)
	testq	%rax, %rax
	jne	.L6095
	jmp	.L6091
.L6793:
	movl	52(%r15), %edx
	movq	40(%r15), %rdi
	leaq	56(%r15), %r14
	movq	%r14, %rsi
	call	*16(%r15)
	movslq	%eax, %r9
	movq	192(%r15), %rax
	leaq	57(%r15), %rdx
	subq	208(%r15), %rax
	addl	%eax, 184(%r15)
	testl	%r9d, %r9d
	jne	.L6190
	movl	$0, 48(%r15)
	movb	$0, 56(%r15)
	movq	%rdx, %rax
.L6191:
	vmovq	%rdx, %xmm4
	vpinsrq	$1, %rax, %xmm4, %xmm0
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L6189
.L6795:
	leaq	56(%r15), %rcx
	movl	52(%r15), %edx
	movq	40(%r15), %rdi
	movq	%rcx, %rsi
	movl	%r9d, -416(%rbp)
	movq	%rcx, -368(%rbp)
	call	*16(%r15)
	movl	%eax, %esi
	movl	%eax, -456(%rbp)
	movq	192(%r15), %rax
	movq	-368(%rbp), %rcx
	subq	208(%r15), %rax
	addl	%eax, 184(%r15)
	testl	%esi, %esi
	movl	-416(%rbp), %r9d
	leaq	57(%r15), %rdx
	jne	.L6195
	movl	$0, 48(%r15)
	movb	$0, 56(%r15)
	movq	%rdx, %rax
.L6196:
	vmovq	%rdx, %xmm5
	vpinsrq	$1, %rax, %xmm5, %xmm0
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L6193
.L6210:
	movl	-456(%rbp), %r14d
	sarl	$3, %r14d
.L6209:
	movl	$0, -416(%rbp)
	testl	%r14d, %r14d
	jne	.L6207
	jmp	.L6208
.L6195:
	movslq	-456(%rbp), %rax
	movzbl	56(%r15), %esi
	addq	%rcx, %rax
	movl	%esi, -456(%rbp)
	movl	%esi, %r14d
	jmp	.L6196
.L6212:
	xorl	%eax, %eax
	cmpl	$3, %ebx
	setne	%al
	movl	%eax, -416(%rbp)
	leal	2(%rax), %r14d
	jmp	.L6207
.L6807:
	movl	%eax, -464(%rbp)
	jmp	.L6236
.L6819:
	movl	52(%r13), %edx
	movq	40(%r13), %rdi
	leaq	56(%r13), %rsi
	movq	%rsi, -504(%rbp)
	call	*16(%r13)
	movq	192(%r13), %rdx
	movq	-384(%rbp), %rdi
	subq	208(%r13), %rdx
	addl	%edx, 184(%r13)
	testl	%eax, %eax
	je	.L6274
	movq	-504(%rbp), %rsi
	cltq
	movzbl	56(%r13), %edx
	addq	%rsi, %rax
	vmovq	%rdi, %xmm4
.L6277:
	vpinsrq	$1, %rax, %xmm4, %xmm0
	vmovdqu	%xmm0, 192(%r13)
	jmp	.L6276
.L6820:
	movl	52(%r13), %edx
	movq	40(%r13), %rdi
	leaq	56(%r13), %rsi
	movq	%rsi, -504(%rbp)
	call	*16(%r13)
	movq	192(%r13), %rdx
	subq	208(%r13), %rdx
	addl	%edx, 184(%r13)
	movq	-384(%rbp), %rdx
	testl	%eax, %eax
	je	.L6280
	movq	-504(%rbp), %rsi
	cltq
	addq	%rsi, %rax
	movzbl	56(%r13), %esi
.L6283:
	vmovq	-384(%rbp), %xmm5
	vpinsrq	$1, %rax, %xmm5, %xmm0
	vmovdqu	%xmm0, 192(%r13)
	jmp	.L6282
.L6823:
	incq	%rdx
	movq	%rdx, 192(%r13)
.L6262:
	cltq
	addq	%rax, %rsi
	movzbl	56(%r13), %eax
	sall	$8, %eax
	addl	%eax, %r11d
	jmp	.L6263
.L6182:
	movslq	-432(%rbp), %rax
	addq	%rbx, %rax
	movzbl	56(%r15), %ebx
	movl	%ebx, -432(%rbp)
	jmp	.L6183
.L6762:
	movl	%eax, %esi
	movq	%r12, %rdi
	call	stbi__free_jpeg_components.constprop.0
	jmp	.L6736
.L6777:
	xorl	%eax, %eax
	testb	$16, -456(%rbp)
	movq	-392(%rbp), %rbx
	setne	%al
	movl	-448(%rbp), %r14d
	addl	$3, %eax
	movl	%eax, (%rbx)
	testl	%r14d, %r14d
	jle	.L6320
	movl	-384(%rbp), %esi
	movslq	-440(%rbp), %rdx
	leal	0(,%rsi,4), %eax
	cltq
	movq	%rax, -480(%rbp)
	leal	-1(%rsi), %eax
	movq	-368(%rbp), %rsi
	incq	%rax
	leaq	(%rsi,%rax,4), %rbx
	negq	%rax
	salq	$2, %rax
	leaq	(%rdx,%rdx,2), %rdx
	movq	%rbx, -448(%rbp)
	movq	%rax, -488(%rbp)
	leaq	-251(%rbp,%rdx), %rbx
	leaq	-254(%rbp), %rsi
	leaq	-60(%rbp), %rax
	movq	%rbx, -472(%rbp)
	movq	%rsi, -496(%rbp)
	movq	%rax, -456(%rbp)
	movl	%r14d, -424(%rbp)
	movl	$4, %r12d
.L6065:
	movq	-488(%rbp), %rax
	movq	-496(%rbp), %r13
	addq	-448(%rbp), %rax
	movq	%rax, -440(%rbp)
.L5993:
	movzbl	-1(%r13), %eax
	cmpb	$1, %al
	je	.L5988
	cmpb	$2, %al
	je	.L5989
	testb	%al, %al
	je	.L6827
	leaq	.LC369(%rip), %rax
	movl	-424(%rbp), %r14d
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L5957
.L6230:
	movq	-368(%rbp), %rdi
	call	free@PLT
	leaq	.LC23(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	movq	$0, -368(%rbp)
	jmp	.L5856
.L6215:
	movl	$2147483647, %eax
	cltd
	idivl	%r14d
	movl	$0, -400(%rbp)
	movl	%eax, %r13d
	jmp	.L6322
.L6223:
	movl	-424(%rbp), %eax
	movl	%ebx, %r13d
	leal	-1(%rax), %r12d
	imull	-440(%rbp), %r12d
	negl	%r13d
	movslq	%r13d, %r13
	imull	%r14d, %r12d
	movslq	%r12d, %r12
	addq	-368(%rbp), %r12
.L6225:
	movq	%r12, %rsi
	movl	%ebx, %edx
	movq	%r15, %rdi
	call	stbi__getn
	incl	-416(%rbp)
	addq	%r13, %r12
	movl	-416(%rbp), %eax
	cmpl	%eax, -424(%rbp)
	jne	.L6225
	jmp	.L6222
.L6825:
	movq	%rdi, %rdx
	jmp	.L6327
.L6178:
	movslq	%r12d, %rax
	movzbl	56(%r15), %r12d
	addq	%rbx, %rax
	movb	%r12b, -384(%rbp)
	jmp	.L6179
.L6258:
	leaq	(%rsi,%r11), %rax
	vmovq	%rdx, %xmm2
	movzbl	56(%r13), %r11d
	jmp	.L6259
.L6199:
	cltq
	addq	%rcx, %rax
	movzbl	56(%r15), %ecx
	jmp	.L6200
.L6240:
	cltq
	addq	%rax, %r12
	jmp	.L6241
.L6809:
	movl	%ebx, %eax
	movzwl	-2(%r14,%rax), %edx
	movw	%dx, -2(%r15,%rax)
	jmp	.L6265
.L6387:
	movl	$0, -384(%rbp)
	movl	%r12d, %esi
	jmp	.L6305
.L6796:
	movq	%rsi, 192(%r15)
	movq	40(%r15), %rdi
	movl	%r12d, %esi
	subl	%edx, %esi
	movb	%cl, -384(%rbp)
	call	*24(%r15)
	movzbl	-384(%rbp), %ecx
	jmp	.L6218
.L6799:
	sarl	$3, %r9d
	movl	%r9d, %r14d
	jmp	.L6209
.L6186:
	leaq	0(%r13,%rbx), %rax
	movzbl	56(%r15), %ebx
	jmp	.L6187
.L6190:
	leaq	(%r14,%r9), %rax
	movzbl	56(%r15), %r9d
	movl	%r9d, %r13d
	jmp	.L6191
.L6813:
	leaq	__PRETTY_FUNCTION__.34(%rip), %rcx
	movl	$5929, %edx
	leaq	.LC21(%rip), %rsi
	leaq	.LC371(%rip), %rdi
	call	__assert_fail@PLT
.L6827:
	cmpl	$0, -384(%rbp)
	jle	.L5996
	movzbl	0(%r13), %r14d
	movq	-440(%rbp), %rbx
	jmp	.L5998
.L6828:
	addq	$4, %rbx
	cmpq	-448(%rbp), %rbx
	je	.L5996
.L5998:
	movq	%rbx, %rdx
	movl	%r14d, %esi
	movq	%r15, %rdi
	call	stbi__readval
	testq	%rax, %rax
	jne	.L6828
.L6723:
	movl	-424(%rbp), %r14d
	jmp	.L5957
.L6798:
	movq	192(%r15), %rdx
	movq	200(%r15), %rsi
	jmp	.L5960
.L5988:
	movl	-384(%rbp), %eax
	movq	-440(%rbp), %r14
	movl	%eax, -432(%rbp)
	testl	%eax, %eax
	jle	.L5996
	movq	%r13, -464(%rbp)
	movq	%r15, %r13
	movq	%r14, %r15
.L6031:
	movq	%r13, %rdi
	call	stbi__get8
	cmpq	$0, 16(%r13)
	movzbl	%al, %ebx
	je	.L6002
	movq	40(%r13), %rdi
	call	*32(%r13)
	testl	%eax, %eax
	je	.L6001
	cmpl	$0, 48(%r13)
	je	.L6730
.L6002:
	movq	200(%r13), %rax
	cmpq	%rax, 192(%r13)
	jnb	.L6730
.L6001:
	movq	-464(%rbp), %rax
	movq	-456(%rbp), %rdx
	movzbl	(%rax), %r14d
	movq	%r13, %rdi
	movzbl	%r14b, %esi
	cmpl	-432(%rbp), %ebx
	jle	.L6004
	call	stbi__readval
	testq	%rax, %rax
	je	.L6723
	movl	-432(%rbp), %ebx
.L6006:
	movl	%r14d, %eax
	movl	%r14d, %edx
	movl	%r14d, %esi
	andl	$64, %eax
	andl	$32, %edx
	andl	$16, %esi
	testb	%r14b, %r14b
	js	.L6008
	testb	%sil, %sil
	jne	.L6009
	testb	%dl, %dl
	jne	.L6010
	testb	%al, %al
	je	.L6731
	xorl	%eax, %eax
.L6011:
	movzbl	-59(%rbp), %edx
	movb	%dl, 1(%r15,%rax,4)
	incq	%rax
	cmpl	%eax, %ebx
	jg	.L6011
.L6731:
	movslq	%ebx, %rax
	salq	$2, %rax
	testl	%ebx, %ebx
	cmovle	%r12, %rax
	subl	%ebx, -432(%rbp)
	addq	%rax, %r15
	movl	-432(%rbp), %eax
	testl	%eax, %eax
	jg	.L6031
	movq	%r13, %r15
	movq	-464(%rbp), %r13
.L5996:
	addq	$3, %r13
	cmpq	%r13, -472(%rbp)
	jne	.L5993
	incl	-416(%rbp)
	movq	-480(%rbp), %rbx
	addq	%rbx, -448(%rbp)
	movl	-416(%rbp), %eax
	cmpl	%eax, -424(%rbp)
	jne	.L6065
	movl	-424(%rbp), %r14d
	jmp	.L6320
.L5989:
	movl	-384(%rbp), %eax
	movq	-440(%rbp), %rbx
	movl	%eax, -432(%rbp)
	testl	%eax, %eax
	jle	.L5996
	movq	%r13, -464(%rbp)
	movq	%r15, %r14
.L5992:
	movq	%r14, %rdi
	call	stbi__get8
	movzbl	%al, %edx
	cmpq	$0, 16(%r14)
	movq	%rdx, %r15
	je	.L6034
	movq	40(%r14), %rdi
	movl	%edx, -504(%rbp)
	call	*32(%r14)
	testl	%eax, %eax
	movl	-504(%rbp), %edx
	je	.L6033
	cmpl	$0, 48(%r14)
	je	.L6730
.L6034:
	movq	200(%r14), %rax
	cmpq	%rax, 192(%r14)
	jnb	.L6730
.L6033:
	cmpl	$127, %edx
	jle	.L6035
	leal	-127(%rdx), %r13d
	cmpl	$128, %edx
	je	.L6829
.L6037:
	cmpl	-432(%rbp), %r13d
	jg	.L6730
	movq	-464(%rbp), %rax
	movq	-456(%rbp), %rdx
	movzbl	(%rax), %esi
	movq	%r14, %rdi
	movl	%esi, %r15d
	call	stbi__readval
	testq	%rax, %rax
	je	.L6723
	testl	%r13d, %r13d
	jle	.L6063
	movl	%r15d, %eax
	movl	%r15d, %edx
	movl	%r15d, %esi
	andl	$64, %eax
	andl	$32, %edx
	andl	$16, %esi
	testb	%r15b, %r15b
	js	.L6041
	testb	%sil, %sil
	jne	.L6042
	testb	%dl, %dl
	jne	.L6043
	testb	%al, %al
	je	.L6732
	xorl	%eax, %eax
.L6044:
	movzbl	-59(%rbp), %edx
	movb	%dl, 1(%rbx,%rax,4)
	incq	%rax
	cmpl	%eax, %r13d
	jg	.L6044
.L6732:
	movslq	%r13d, %rax
	leaq	(%rbx,%rax,4), %rbx
.L6063:
	subl	%r13d, -432(%rbp)
	movl	-432(%rbp), %eax
	testl	%eax, %eax
	jg	.L5992
	movq	-464(%rbp), %r13
	movq	%r14, %r15
	jmp	.L5996
.L6829:
	movq	%r14, %rdi
	call	stbi__get16be
	movl	%eax, %r13d
	jmp	.L6037
.L6035:
	leal	1(%rdx), %r13d
	cmpl	-432(%rbp), %r13d
	jg	.L6730
	movq	-464(%rbp), %rax
	movl	%r13d, -504(%rbp)
	movzbl	(%rax), %esi
	leaq	4(%rbx,%r15,4), %r15
	movl	%esi, %r13d
.L6064:
	movq	%rbx, %rdx
	movl	%r13d, %esi
	movq	%r14, %rdi
	call	stbi__readval
	testq	%rax, %rax
	je	.L6723
	addq	$4, %rbx
	cmpq	%r15, %rbx
	jne	.L6064
	movl	-504(%rbp), %r13d
	jmp	.L6063
.L6008:
	testb	%sil, %sil
	jne	.L6020
	testb	%dl, %dl
	jne	.L6021
	testb	%al, %al
	movl	$0, %eax
	jne	.L6022
.L6023:
	movzbl	-60(%rbp), %edx
	movb	%dl, (%r15,%rax,4)
	incq	%rax
	cmpl	%eax, %ebx
	jg	.L6023
	jmp	.L6731
.L6022:
	movzbl	-60(%rbp), %edx
	movb	%dl, (%r15,%rax,4)
	movzbl	-59(%rbp), %edx
	movb	%dl, 1(%r15,%rax,4)
	incq	%rax
	cmpl	%eax, %ebx
	jg	.L6022
	jmp	.L6731
.L6004:
	call	stbi__readval
	testq	%rax, %rax
	je	.L6723
	testl	%ebx, %ebx
	jne	.L6006
	jmp	.L6031
.L6021:
	testb	%al, %al
	movl	$0, %eax
	jne	.L6024
.L6025:
	movzbl	-60(%rbp), %edx
	movb	%dl, (%r15,%rax,4)
	movzbl	-58(%rbp), %edx
	movb	%dl, 2(%r15,%rax,4)
	incq	%rax
	cmpl	%eax, %ebx
	jg	.L6025
	jmp	.L6731
.L6024:
	movzbl	-60(%rbp), %edx
	movb	%dl, (%r15,%rax,4)
	movzbl	-59(%rbp), %edx
	movb	%dl, 1(%r15,%rax,4)
	movzbl	-58(%rbp), %edx
	movb	%dl, 2(%r15,%rax,4)
	incq	%rax
	cmpl	%eax, %ebx
	jg	.L6024
	jmp	.L6731
.L6020:
	testb	%dl, %dl
	jne	.L6026
	testb	%al, %al
	movl	$0, %eax
	jne	.L6027
.L6028:
	movzbl	-60(%rbp), %edx
	movb	%dl, (%r15,%rax,4)
	movzbl	-57(%rbp), %edx
	movb	%dl, 3(%r15,%rax,4)
	incq	%rax
	cmpl	%eax, %ebx
	jg	.L6028
	jmp	.L6731
.L6027:
	movzbl	-60(%rbp), %edx
	movb	%dl, (%r15,%rax,4)
	movzbl	-59(%rbp), %edx
	movb	%dl, 1(%r15,%rax,4)
	movzbl	-57(%rbp), %edx
	movb	%dl, 3(%r15,%rax,4)
	incq	%rax
	cmpl	%eax, %ebx
	jg	.L6027
	jmp	.L6731
.L6026:
	testb	%al, %al
	movl	$0, %eax
	jne	.L6029
.L6030:
	movzbl	-60(%rbp), %edx
	movb	%dl, (%r15,%rax,4)
	movzbl	-58(%rbp), %edx
	movb	%dl, 2(%r15,%rax,4)
	movzbl	-57(%rbp), %edx
	movb	%dl, 3(%r15,%rax,4)
	incq	%rax
	cmpl	%eax, %ebx
	jg	.L6030
	jmp	.L6731
.L6029:
	movzbl	-60(%rbp), %edx
	movb	%dl, (%r15,%rax,4)
	movzbl	-59(%rbp), %edx
	movb	%dl, 1(%r15,%rax,4)
	movzbl	-58(%rbp), %edx
	movb	%dl, 2(%r15,%rax,4)
	movzbl	-57(%rbp), %edx
	movb	%dl, 3(%r15,%rax,4)
	incq	%rax
	cmpl	%eax, %ebx
	jg	.L6029
	jmp	.L6731
.L6010:
	testb	%al, %al
	movl	$0, %eax
	jne	.L6013
.L6014:
	movzbl	-58(%rbp), %edx
	movb	%dl, 2(%r15,%rax,4)
	incq	%rax
	cmpl	%eax, %ebx
	jg	.L6014
	jmp	.L6731
.L6013:
	movzbl	-59(%rbp), %edx
	movb	%dl, 1(%r15,%rax,4)
	movzbl	-58(%rbp), %edx
	movb	%dl, 2(%r15,%rax,4)
	incq	%rax
	cmpl	%eax, %ebx
	jg	.L6013
	jmp	.L6731
.L6009:
	testb	%dl, %dl
	jne	.L6015
	testb	%al, %al
	movl	$0, %eax
	jne	.L6016
.L6017:
	movzbl	-57(%rbp), %edx
	movb	%dl, 3(%r15,%rax,4)
	incq	%rax
	cmpl	%eax, %ebx
	jg	.L6017
	jmp	.L6731
.L6016:
	movzbl	-59(%rbp), %edx
	movb	%dl, 1(%r15,%rax,4)
	movzbl	-57(%rbp), %edx
	movb	%dl, 3(%r15,%rax,4)
	incq	%rax
	cmpl	%eax, %ebx
	jg	.L6016
	jmp	.L6731
.L6015:
	testb	%al, %al
	movl	$0, %eax
	jne	.L6018
.L6019:
	movzbl	-58(%rbp), %edx
	movb	%dl, 2(%r15,%rax,4)
	movzbl	-57(%rbp), %edx
	movb	%dl, 3(%r15,%rax,4)
	incq	%rax
	cmpl	%eax, %ebx
	jg	.L6019
	jmp	.L6731
.L6018:
	movzbl	-59(%rbp), %edx
	movb	%dl, 1(%r15,%rax,4)
	movzbl	-58(%rbp), %edx
	movb	%dl, 2(%r15,%rax,4)
	movzbl	-57(%rbp), %edx
	movb	%dl, 3(%r15,%rax,4)
	incq	%rax
	cmpl	%eax, %ebx
	jg	.L6018
	jmp	.L6731
.L6730:
	movl	-424(%rbp), %r14d
	jmp	.L6733
.L6043:
	testb	%al, %al
	movl	$0, %eax
	jne	.L6045
.L6046:
	movzbl	-58(%rbp), %edx
	movb	%dl, 2(%rbx,%rax,4)
	incq	%rax
	cmpl	%eax, %r13d
	jg	.L6046
	jmp	.L6732
.L6042:
	testb	%dl, %dl
	jne	.L6047
	testb	%al, %al
	movl	$0, %eax
	jne	.L6048
.L6049:
	movzbl	-57(%rbp), %edx
	movb	%dl, 3(%rbx,%rax,4)
	incq	%rax
	cmpl	%eax, %r13d
	jg	.L6049
	jmp	.L6732
.L6041:
	testb	%sil, %sil
	jne	.L6052
	testb	%dl, %dl
	jne	.L6053
	testb	%al, %al
	movl	$0, %eax
	jne	.L6054
.L6055:
	movzbl	-60(%rbp), %edx
	movb	%dl, (%rbx,%rax,4)
	incq	%rax
	cmpl	%eax, %r13d
	jg	.L6055
	jmp	.L6732
.L6045:
	movzbl	-59(%rbp), %edx
	movb	%dl, 1(%rbx,%rax,4)
	movzbl	-58(%rbp), %edx
	movb	%dl, 2(%rbx,%rax,4)
	incq	%rax
	cmpl	%eax, %r13d
	jg	.L6045
	jmp	.L6732
.L6054:
	movzbl	-60(%rbp), %edx
	movb	%dl, (%rbx,%rax,4)
	movzbl	-59(%rbp), %edx
	movb	%dl, 1(%rbx,%rax,4)
	incq	%rax
	cmpl	%eax, %r13d
	jg	.L6054
	jmp	.L6732
.L6053:
	testb	%al, %al
	movl	$0, %eax
	jne	.L6056
.L6057:
	movzbl	-60(%rbp), %edx
	movb	%dl, (%rbx,%rax,4)
	movzbl	-58(%rbp), %edx
	movb	%dl, 2(%rbx,%rax,4)
	incq	%rax
	cmpl	%eax, %r13d
	jg	.L6057
	jmp	.L6732
.L6052:
	testb	%dl, %dl
	jne	.L6058
	testb	%al, %al
	movl	$0, %eax
	jne	.L6059
.L6060:
	movzbl	-60(%rbp), %edx
	movb	%dl, (%rbx,%rax,4)
	movzbl	-57(%rbp), %edx
	movb	%dl, 3(%rbx,%rax,4)
	incq	%rax
	cmpl	%eax, %r13d
	jg	.L6060
	jmp	.L6732
.L6056:
	movzbl	-60(%rbp), %edx
	movb	%dl, (%rbx,%rax,4)
	movzbl	-59(%rbp), %edx
	movb	%dl, 1(%rbx,%rax,4)
	movzbl	-58(%rbp), %edx
	movb	%dl, 2(%rbx,%rax,4)
	incq	%rax
	cmpl	%eax, %r13d
	jg	.L6056
	jmp	.L6732
.L6059:
	movzbl	-60(%rbp), %edx
	movb	%dl, (%rbx,%rax,4)
	movzbl	-59(%rbp), %edx
	movb	%dl, 1(%rbx,%rax,4)
	movzbl	-57(%rbp), %edx
	movb	%dl, 3(%rbx,%rax,4)
	incq	%rax
	cmpl	%eax, %r13d
	jg	.L6059
	jmp	.L6732
.L6058:
	testb	%al, %al
	movl	$0, %eax
	jne	.L6061
.L6062:
	movzbl	-60(%rbp), %edx
	movb	%dl, (%rbx,%rax,4)
	movzbl	-58(%rbp), %edx
	movb	%dl, 2(%rbx,%rax,4)
	movzbl	-57(%rbp), %edx
	movb	%dl, 3(%rbx,%rax,4)
	incq	%rax
	cmpl	%eax, %r13d
	jg	.L6062
	jmp	.L6732
.L6048:
	movzbl	-59(%rbp), %edx
	movb	%dl, 1(%rbx,%rax,4)
	movzbl	-57(%rbp), %edx
	movb	%dl, 3(%rbx,%rax,4)
	incq	%rax
	cmpl	%eax, %r13d
	jg	.L6048
	jmp	.L6732
.L6047:
	testb	%al, %al
	movl	$0, %eax
	jne	.L6050
.L6051:
	movzbl	-58(%rbp), %edx
	movb	%dl, 2(%rbx,%rax,4)
	movzbl	-57(%rbp), %edx
	movb	%dl, 3(%rbx,%rax,4)
	incq	%rax
	cmpl	%eax, %r13d
	jg	.L6051
	jmp	.L6732
.L6061:
	movzbl	-60(%rbp), %edx
	movb	%dl, (%rbx,%rax,4)
	movzbl	-59(%rbp), %edx
	movb	%dl, 1(%rbx,%rax,4)
	movzbl	-58(%rbp), %edx
	movb	%dl, 2(%rbx,%rax,4)
	movzbl	-57(%rbp), %edx
	movb	%dl, 3(%rbx,%rax,4)
	incq	%rax
	cmpl	%eax, %r13d
	jg	.L6061
	jmp	.L6732
.L6050:
	movzbl	-59(%rbp), %edx
	movb	%dl, 1(%rbx,%rax,4)
	movzbl	-58(%rbp), %edx
	movb	%dl, 2(%rbx,%rax,4)
	movzbl	-57(%rbp), %edx
	movb	%dl, 3(%rbx,%rax,4)
	incq	%rax
	cmpl	%eax, %r13d
	jg	.L6050
	jmp	.L6732
.L6213:
	movl	$0, -416(%rbp)
	movl	$1, %r14d
	jmp	.L6207
.L6297:
	cltq
	addq	%rax, %rbx
	jmp	.L6298
.L6822:
	movl	52(%r13), %edx
	movq	40(%r13), %rdi
	leaq	56(%r13), %rsi
	movb	%r11b, -360(%rbp)
	movq	%rsi, -504(%rbp)
	call	*16(%r13)
	movq	192(%r13), %rdx
	movzbl	-360(%rbp), %r11d
	subq	208(%r13), %rdx
	addl	%edx, 184(%r13)
	testl	%eax, %eax
	movq	-384(%rbp), %rdx
	je	.L6292
	movq	-504(%rbp), %rsi
	cltq
	movzbl	56(%r13), %r11d
	addq	%rsi, %rax
.L6294:
	vmovq	-384(%rbp), %xmm7
	vpinsrq	$1, %rax, %xmm7, %xmm0
	vmovdqu	%xmm0, 192(%r13)
	jmp	.L6291
.L6280:
	movl	$0, 48(%r13)
	movb	$0, 56(%r13)
	movq	-384(%rbp), %rax
	xorl	%esi, %esi
	jmp	.L6283
.L6292:
	movl	$0, 48(%r13)
	movb	$0, 56(%r13)
	movq	-384(%rbp), %rax
	jmp	.L6294
.L6742:
	call	__stack_chk_fail@PLT
.L6763:
	movl	-424(%rbp), %esi
	movq	%r15, %rdi
	movq	%rax, -368(%rbp)
	call	stbi__free_jpeg_components.constprop.0
	leaq	.LC23(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	movq	%r15, %r12
	jmp	.L6076
.L6821:
	movl	52(%r13), %edx
	movq	40(%r13), %rdi
	leaq	56(%r13), %rsi
	movq	%rsi, -504(%rbp)
	call	*16(%r13)
	movq	192(%r13), %rdx
	subq	208(%r13), %rdx
	addl	%edx, 184(%r13)
	movq	-384(%rbp), %rdx
	testl	%eax, %eax
	je	.L6286
	movq	-504(%rbp), %rsi
	cltq
	addq	%rsi, %rax
	movzbl	56(%r13), %esi
.L6289:
	vmovq	-384(%rbp), %xmm6
	vpinsrq	$1, %rax, %xmm6, %xmm0
	vmovdqu	%xmm0, 192(%r13)
	jmp	.L6288
.L6274:
	movq	-384(%rbp), %rax
	movl	$0, 48(%r13)
	movb	$0, 56(%r13)
	xorl	%edx, %edx
	vmovq	%rax, %xmm4
	jmp	.L6277
.L6286:
	movl	$0, 48(%r13)
	movb	$0, 56(%r13)
	movq	-384(%rbp), %rax
	xorl	%esi, %esi
	jmp	.L6289
.L6818:
	movl	(%rax), %edx
	movl	%edx, (%r14)
	movl	%ebx, %edx
	movl	-4(%rax,%rdx), %eax
	movl	%eax, -4(%r14,%rdx)
	jmp	.L6242
.L6826:
	xorl	%ecx, %ecx
	jmp	.L6194
.L6805:
	leaq	__PRETTY_FUNCTION__.34(%rip), %rcx
	movl	$5880, %edx
	leaq	.LC21(%rip), %rsi
	leaq	.LC371(%rip), %rdi
	call	__assert_fail@PLT
.L6803:
	movq	-368(%rbp), %rdi
	call	free@PLT
	leaq	.LC370(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	movq	$0, -368(%rbp)
	jmp	.L5856
.L6804:
	movq	200(%r15), %rax
	movq	%rax, 192(%r15)
	jmp	.L6227
.L6738:
	leaq	.LC23(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L5856
.L6749:
	leaq	.LC23(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L6068
.L6797:
	movq	192(%r15), %rdx
	movq	200(%r15), %rsi
	jmp	.L5970
	.cfi_endproc
.LFE594:
	.size	stbi__load_main, .-stbi__load_main
	.section	.rodata.str1.8
	.align 8
.LC372:
	.string	"ri.bits_per_channel == 8 || ri.bits_per_channel == 16"
	.text
	.p2align 4
	.type	stbi__load_and_postprocess_8bit, @function
stbi__load_and_postprocess_8bit:
.LFB599:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	pushq	-8(%r10)
	pushq	%rbp
	movq	%rsp, %rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	pushq	%r15
	leaq	-68(%rbp), %r9
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	movl	%r8d, %r15d
	pushq	%r14
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	movq	%rcx, %r14
	pushq	%r13
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	movq	%rdx, %r13
	pushq	%r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	pushq	%rbx
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movq	%rsi, %rbx
	subq	$72, %rsp
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	pushq	$8
	call	stbi__load_main
	popq	%rsi
	movq	%rax, %r12
	popq	%rdi
	testq	%rax, %rax
	je	.L6830
	movl	-68(%rbp), %eax
	leal	-8(%rax), %esi
	andl	$-9, %esi
	jne	.L6870
	cmpl	$8, %eax
	je	.L6833
	movl	%r15d, %eax
	testl	%r15d, %r15d
	je	.L6871
.L6834:
	movl	0(%r13), %ecx
	movl	%esi, -96(%rbp)
	imull	(%rbx), %ecx
	imull	%eax, %ecx
	movslq	%ecx, %rdi
	movl	%ecx, -92(%rbp)
	movq	%rdi, -88(%rbp)
	call	malloc@PLT
	movq	%rax, %rdx
	testq	%rax, %rax
	je	.L6835
	movl	-92(%rbp), %ecx
	movq	-88(%rbp), %rdi
	testl	%ecx, %ecx
	movl	-96(%rbp), %esi
	jle	.L6837
	leaq	(%r12,%rdi,2), %rax
	cmpq	%rax, %rdx
	leaq	(%rdx,%rdi), %rax
	setnb	%r9b
	cmpq	%rax, %r12
	setnb	%al
	orb	%al, %r9b
	movl	%ecx, %r8d
	leal	-1(%rcx), %r10d
	je	.L6839
	cmpl	$14, %r10d
	jbe	.L6839
	cmpl	$30, %r10d
	jbe	.L6852
	movl	%ecx, %esi
	shrl	$5, %esi
	vmovdqa	.LC2(%rip), %ymm2
	salq	$5, %rsi
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L6841:
	vmovdqu	(%r12,%rax,2), %ymm3
	vmovdqu	32(%r12,%rax,2), %ymm4
	vpsrlw	$8, %ymm3, %ymm0
	vpsrlw	$8, %ymm4, %ymm1
	vpand	%ymm0, %ymm2, %ymm0
	vpand	%ymm1, %ymm2, %ymm1
	vpackuswb	%ymm1, %ymm0, %ymm0
	vpermq	$216, %ymm0, %ymm0
	vmovdqu	%ymm0, (%rdx,%rax)
	addq	$32, %rax
	cmpq	%rsi, %rax
	jne	.L6841
	movl	%ecx, %esi
	andl	$-32, %esi
	movl	%esi, %eax
	cmpl	%esi, %ecx
	je	.L6867
	movl	%ecx, %r8d
	subl	%esi, %r8d
	leal	-1(%r8), %edi
	cmpl	$14, %edi
	jbe	.L6872
	vzeroupper
.L6840:
	leaq	(%r12,%rsi,2), %rdi
	vmovdqu	(%rdi), %xmm5
	vmovdqu	16(%rdi), %xmm2
	vmovdqa	.LC5(%rip), %xmm1
	vpsrlw	$8, %xmm5, %xmm0
	vpsrlw	$8, %xmm2, %xmm2
	vpand	%xmm0, %xmm1, %xmm0
	vpand	%xmm2, %xmm1, %xmm1
	vpackuswb	%xmm1, %xmm0, %xmm0
	vmovdqu	%xmm0, (%rdx,%rsi)
	movl	%r8d, %esi
	andl	$-16, %esi
	addl	%esi, %eax
	cmpl	%esi, %r8d
	je	.L6837
.L6843:
	movslq	%eax, %rdi
	movzbl	1(%r12,%rdi,2), %r8d
	leaq	(%rdi,%rdi), %rsi
	movb	%r8b, (%rdx,%rdi)
	leal	1(%rax), %edi
	cmpl	%edi, %ecx
	jle	.L6837
	movzbl	3(%r12,%rsi), %r8d
	movslq	%edi, %rdi
	movb	%r8b, (%rdx,%rdi)
	leal	2(%rax), %edi
	cmpl	%edi, %ecx
	jle	.L6837
	movzbl	5(%r12,%rsi), %r8d
	movslq	%edi, %rdi
	movb	%r8b, (%rdx,%rdi)
	leal	3(%rax), %edi
	cmpl	%edi, %ecx
	jle	.L6837
	movzbl	7(%r12,%rsi), %r8d
	movslq	%edi, %rdi
	movb	%r8b, (%rdx,%rdi)
	leal	4(%rax), %edi
	cmpl	%edi, %ecx
	jle	.L6837
	movzbl	9(%r12,%rsi), %r8d
	movslq	%edi, %rdi
	movb	%r8b, (%rdx,%rdi)
	leal	5(%rax), %edi
	cmpl	%edi, %ecx
	jle	.L6837
	movzbl	11(%r12,%rsi), %r8d
	movslq	%edi, %rdi
	movb	%r8b, (%rdx,%rdi)
	leal	6(%rax), %edi
	cmpl	%edi, %ecx
	jle	.L6837
	movzbl	13(%r12,%rsi), %r8d
	movslq	%edi, %rdi
	movb	%r8b, (%rdx,%rdi)
	leal	7(%rax), %edi
	cmpl	%edi, %ecx
	jle	.L6837
	movzbl	15(%r12,%rsi), %r8d
	movslq	%edi, %rdi
	movb	%r8b, (%rdx,%rdi)
	leal	8(%rax), %edi
	cmpl	%edi, %ecx
	jle	.L6837
	movzbl	17(%r12,%rsi), %r8d
	movslq	%edi, %rdi
	movb	%r8b, (%rdx,%rdi)
	leal	9(%rax), %edi
	cmpl	%edi, %ecx
	jle	.L6837
	movzbl	19(%r12,%rsi), %r8d
	movslq	%edi, %rdi
	movb	%r8b, (%rdx,%rdi)
	leal	10(%rax), %edi
	cmpl	%edi, %ecx
	jle	.L6837
	movzbl	21(%r12,%rsi), %r8d
	movslq	%edi, %rdi
	movb	%r8b, (%rdx,%rdi)
	leal	11(%rax), %edi
	cmpl	%edi, %ecx
	jle	.L6837
	movzbl	23(%r12,%rsi), %r8d
	movslq	%edi, %rdi
	movb	%r8b, (%rdx,%rdi)
	leal	12(%rax), %edi
	cmpl	%edi, %ecx
	jle	.L6837
	movzbl	25(%r12,%rsi), %r8d
	movslq	%edi, %rdi
	movb	%r8b, (%rdx,%rdi)
	leal	13(%rax), %edi
	cmpl	%edi, %ecx
	jle	.L6837
	movzbl	27(%r12,%rsi), %r8d
	movslq	%edi, %rdi
	addl	$14, %eax
	movb	%r8b, (%rdx,%rdi)
	cmpl	%eax, %ecx
	jle	.L6837
	movzbl	29(%r12,%rsi), %ecx
	cltq
	movb	%cl, (%rdx,%rax)
	.p2align 4,,10
	.p2align 3
.L6837:
	movq	%r12, %rdi
	movq	%rdx, -88(%rbp)
	call	free@PLT
	movq	-88(%rbp), %rdx
.L6838:
	movl	$8, -68(%rbp)
	movq	%rdx, %r12
.L6833:
	movl	%fs:stbi__vertically_flip_on_load_set@tpoff, %ecx
	testl	%ecx, %ecx
	jne	.L6873
	movl	stbi__vertically_flip_on_load_global(%rip), %eax
	testl	%eax, %eax
	je	.L6830
.L6848:
	testl	%r15d, %r15d
	jne	.L6849
	movl	(%r14), %r15d
.L6849:
	movl	0(%r13), %edx
	movl	(%rbx), %esi
	movl	%r15d, %ecx
	movq	%r12, %rdi
	call	stbi__vertical_flip
.L6830:
	movq	-56(%rbp), %rax
	subq	%fs:40, %rax
	jne	.L6874
	leaq	-48(%rbp), %rsp
	popq	%rbx
	popq	%r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	movq	%r12, %rax
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L6873:
	.cfi_restore_state
	movl	%fs:stbi__vertically_flip_on_load_local@tpoff, %edx
	testl	%edx, %edx
	jne	.L6848
	jmp	.L6830
	.p2align 4,,10
	.p2align 3
.L6871:
	movl	(%r14), %eax
	jmp	.L6834
	.p2align 4,,10
	.p2align 3
.L6839:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L6845:
	movzbl	1(%r12,%rax,2), %esi
	movb	%sil, (%rdx,%rax)
	incq	%rax
	cmpq	%rcx, %rax
	jne	.L6845
	jmp	.L6837
.L6852:
	xorl	%eax, %eax
	jmp	.L6840
.L6872:
	vzeroupper
	jmp	.L6843
.L6867:
	vzeroupper
	jmp	.L6837
.L6870:
	leaq	__PRETTY_FUNCTION__.50(%rip), %rcx
	movl	$1249, %edx
	leaq	.LC21(%rip), %rsi
	leaq	.LC372(%rip), %rdi
	call	__assert_fail@PLT
.L6874:
	call	__stack_chk_fail@PLT
.L6835:
	leaq	.LC23(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L6838
	.cfi_endproc
.LFE599:
	.size	stbi__load_and_postprocess_8bit, .-stbi__load_and_postprocess_8bit
	.p2align 4
	.type	stbi__loadf_main, @function
stbi__loadf_main:
.LFB612:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	pushq	-8(%r10)
	pushq	%rbp
	movq	%rsp, %rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	pushq	%r15
	pushq	%r14
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	movq	%rdi, %r14
	pushq	%r13
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	movq	%rcx, %r13
	pushq	%r12
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	movq	%rsi, %r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	pushq	%rbx
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movq	%rdx, %rbx
	subq	$64, %rsp
	movl	%r8d, -92(%rbp)
	call	stbi__hdr_test
	movl	%eax, -96(%rbp)
	testl	%eax, %eax
	jne	.L6919
	movl	-92(%rbp), %r15d
	movq	%r13, %rcx
	movl	%r15d, %r8d
	movq	%rbx, %rdx
	movq	%r12, %rsi
	movq	%r14, %rdi
	call	stbi__load_and_postprocess_8bit
	movq	%rax, -88(%rbp)
	testq	%rax, %rax
	je	.L6881
	testl	%r15d, %r15d
	jne	.L6882
	movl	0(%r13), %eax
	movl	%eax, -92(%rbp)
.L6882:
	movl	(%rbx), %r13d
	movl	(%r12), %ebx
	movl	-92(%rbp), %edx
	movl	$4, %ecx
	movl	%r13d, %esi
	movl	%ebx, %edi
	call	stbi__malloc_mad4.constprop.0
	movq	%rax, -80(%rbp)
	testq	%rax, %rax
	je	.L6920
	movl	-92(%rbp), %edi
	movl	%edi, %eax
	andl	$1, %eax
	cmpl	$1, %eax
	movl	%edi, %esi
	sbbl	$0, %esi
	imull	%ebx, %r13d
	movl	%esi, -108(%rbp)
	movl	%r13d, -72(%rbp)
	testl	%r13d, %r13d
	jle	.L6885
	testl	%esi, %esi
	jle	.L6886
	movslq	%edi, %rax
	vmovss	.LC247(%rip), %xmm2
	movq	-88(%rbp), %rdi
	movq	%rax, -104(%rbp)
	leal	-1(%rsi), %eax
	leaq	1(%rdi,%rax), %rbx
	xorl	%r13d, %r13d
	xorl	%r12d, %r12d
	vmovss	%xmm2, -68(%rbp)
	.p2align 4,,10
	.p2align 3
.L6887:
	movq	-88(%rbp), %rax
	vxorpd	%xmm7, %xmm7, %xmm7
	leaq	(%rax,%r12), %r14
	movq	-80(%rbp), %rax
	vcvtss2sd	stbi__l2h_scale(%rip), %xmm7, %xmm0
	leaq	(%rax,%r12,4), %r15
	vmovsd	%xmm0, -64(%rbp)
	vcvtss2sd	stbi__l2h_gamma(%rip), %xmm7, %xmm1
	.p2align 4,,10
	.p2align 3
.L6888:
	movzbl	(%r14), %ecx
	vxorps	%xmm4, %xmm4, %xmm4
	vcvtsi2ssl	%ecx, %xmm4, %xmm0
	vmovsd	%xmm1, -56(%rbp)
	incq	%r14
	addq	$4, %r15
	vdivss	-68(%rbp), %xmm0, %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	call	pow@PLT
	vmulsd	-64(%rbp), %xmm0, %xmm0
	vmovsd	-56(%rbp), %xmm1
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	vmovss	%xmm0, -4(%r15)
	cmpq	%rbx, %r14
	jne	.L6888
	movq	-104(%rbp), %rax
	incl	%r13d
	addq	%rax, %rbx
	addq	%rax, %r12
	cmpl	-72(%rbp), %r13d
	jne	.L6887
.L6886:
	movl	-108(%rbp), %edx
	cmpl	%edx, -92(%rbp)
	jle	.L6885
	cmpl	$1, -92(%rbp)
	jne	.L6921
	movslq	-72(%rbp), %rcx
	movslq	-108(%rbp), %rsi
	movq	-80(%rbp), %r11
	movq	-88(%rbp), %r10
	movq	%rcx, %rbx
	movl	%ecx, %edi
	leal	-1(%rcx), %r9d
	addq	%rsi, %rcx
	leaq	(%r11,%rcx,4), %r8
	leaq	(%r10,%rsi), %rdx
	cmpq	%r8, %rdx
	setnb	%r8b
	leaq	(%r11,%rsi,4), %rax
	addq	%r10, %rcx
	cmpq	%rcx, %rax
	setnb	%cl
	orb	%cl, %r8b
	je	.L6892
	cmpl	$14, %r9d
	jbe	.L6892
	cmpl	$30, %r9d
	jbe	.L6902
	shrl	$5, %ebx
	movl	%ebx, %ecx
	salq	$5, %rcx
	vmovaps	.LC373(%rip), %ymm2
	addq	%rdx, %rcx
	.p2align 4,,10
	.p2align 3
.L6894:
	vmovdqu	(%rdx), %ymm0
	addq	$32, %rdx
	vpmovzxbw	%xmm0, %ymm1
	vpmovzxwd	%xmm1, %ymm3
	vextracti128	$0x1, %ymm1, %xmm1
	vpmovzxwd	%xmm1, %ymm1
	vcvtdq2ps	%ymm1, %ymm1
	vdivps	%ymm2, %ymm1, %ymm1
	vextracti128	$0x1, %ymm0, %xmm0
	vpmovzxbw	%xmm0, %ymm0
	vcvtdq2ps	%ymm3, %ymm3
	subq	$-128, %rax
	vdivps	%ymm2, %ymm3, %ymm3
	vmovups	%ymm1, -96(%rax)
	vpmovzxwd	%xmm0, %ymm1
	vextracti128	$0x1, %ymm0, %xmm0
	vpmovzxwd	%xmm0, %ymm0
	vcvtdq2ps	%ymm1, %ymm1
	vcvtdq2ps	%ymm0, %ymm0
	vdivps	%ymm2, %ymm1, %ymm1
	vmovups	%ymm3, -128(%rax)
	vdivps	%ymm2, %ymm0, %ymm0
	vmovups	%ymm1, -64(%rax)
	vmovups	%ymm0, -32(%rax)
	cmpq	%rdx, %rcx
	jne	.L6894
	movl	-72(%rbp), %edi
	movl	%edi, %eax
	andl	$-32, %eax
	movl	%eax, -96(%rbp)
	cmpl	%eax, %edi
	je	.L6916
	subl	%eax, %edi
	leal	-1(%rdi), %edx
	cmpl	$14, %edx
	jbe	.L6922
	vzeroupper
.L6893:
	addq	%rsi, %rax
	movq	-88(%rbp), %rsi
	vmovaps	.LC374(%rip), %xmm3
	vmovdqu	(%rsi,%rax), %xmm0
	movq	-80(%rbp), %rdx
	vpmovzxbw	%xmm0, %xmm1
	vpmovzxwd	%xmm1, %xmm2
	vpsrldq	$8, %xmm1, %xmm1
	vpmovzxwd	%xmm1, %xmm1
	vcvtdq2ps	%xmm1, %xmm1
	vdivps	%xmm3, %xmm1, %xmm1
	vpsrldq	$8, %xmm0, %xmm0
	leaq	(%rdx,%rax,4), %rdx
	vpmovzxbw	%xmm0, %xmm0
	vcvtdq2ps	%xmm2, %xmm2
	movl	%edi, %eax
	andl	$-16, %eax
	addl	%eax, -96(%rbp)
	vdivps	%xmm3, %xmm2, %xmm2
	vmovups	%xmm1, 16(%rdx)
	vpmovzxwd	%xmm0, %xmm1
	vpsrldq	$8, %xmm0, %xmm0
	vpmovzxwd	%xmm0, %xmm0
	vcvtdq2ps	%xmm1, %xmm1
	vcvtdq2ps	%xmm0, %xmm0
	vdivps	%xmm3, %xmm1, %xmm1
	vmovups	%xmm2, (%rdx)
	vdivps	%xmm3, %xmm0, %xmm0
	vmovups	%xmm1, 32(%rdx)
	vmovups	%xmm0, 48(%rdx)
	cmpl	%edi, %eax
	je	.L6885
.L6896:
	movl	-108(%rbp), %edi
	movl	-96(%rbp), %esi
	movl	%edi, %eax
	movq	-88(%rbp), %rbx
	addl	%esi, %eax
	cltq
	movzbl	(%rbx,%rax), %edx
	vxorps	%xmm2, %xmm2, %xmm2
	vcvtsi2ssl	%edx, %xmm2, %xmm0
	vmovss	.LC247(%rip), %xmm3
	movq	-80(%rbp), %rcx
	movl	-72(%rbp), %r10d
	vdivss	%xmm3, %xmm0, %xmm0
	vmovss	%xmm0, (%rcx,%rax,4)
	leal	1(%rsi), %eax
	cmpl	%r10d, %eax
	jge	.L6885
	addl	%edi, %eax
	cltq
	movzbl	(%rbx,%rax), %edx
	vcvtsi2ssl	%edx, %xmm2, %xmm0
	vdivss	%xmm3, %xmm0, %xmm0
	vmovss	%xmm0, (%rcx,%rax,4)
	leal	2(%rsi), %eax
	cmpl	%r10d, %eax
	jge	.L6885
	addl	%edi, %eax
	cltq
	movzbl	(%rbx,%rax), %edx
	vcvtsi2ssl	%edx, %xmm2, %xmm0
	vdivss	%xmm3, %xmm0, %xmm0
	vmovss	%xmm0, (%rcx,%rax,4)
	leal	3(%rsi), %eax
	cmpl	%eax, %r10d
	jle	.L6885
	addl	%edi, %eax
	cltq
	movzbl	(%rbx,%rax), %edx
	vcvtsi2ssl	%edx, %xmm2, %xmm0
	vdivss	%xmm3, %xmm0, %xmm0
	vmovss	%xmm0, (%rcx,%rax,4)
	leal	4(%rsi), %eax
	cmpl	%eax, %r10d
	jle	.L6885
	addl	%edi, %eax
	cltq
	movzbl	(%rbx,%rax), %edx
	vcvtsi2ssl	%edx, %xmm2, %xmm0
	vdivss	%xmm3, %xmm0, %xmm0
	vmovss	%xmm0, (%rcx,%rax,4)
	leal	5(%rsi), %eax
	cmpl	%eax, %r10d
	jle	.L6885
	addl	%edi, %eax
	cltq
	movzbl	(%rbx,%rax), %edx
	vcvtsi2ssl	%edx, %xmm2, %xmm0
	vdivss	%xmm3, %xmm0, %xmm0
	vmovss	%xmm0, (%rcx,%rax,4)
	leal	6(%rsi), %eax
	cmpl	%eax, %r10d
	jle	.L6885
	addl	%edi, %eax
	cltq
	movzbl	(%rbx,%rax), %edx
	vcvtsi2ssl	%edx, %xmm2, %xmm0
	vdivss	%xmm3, %xmm0, %xmm0
	vmovss	%xmm0, (%rcx,%rax,4)
	leal	7(%rsi), %eax
	cmpl	%eax, %r10d
	jle	.L6885
	addl	%edi, %eax
	cltq
	movzbl	(%rbx,%rax), %edx
	vcvtsi2ssl	%edx, %xmm2, %xmm0
	vdivss	%xmm3, %xmm0, %xmm0
	vmovss	%xmm0, (%rcx,%rax,4)
	leal	8(%rsi), %eax
	cmpl	%eax, %r10d
	jle	.L6885
	addl	%edi, %eax
	cltq
	movzbl	(%rbx,%rax), %edx
	vcvtsi2ssl	%edx, %xmm2, %xmm0
	vdivss	%xmm3, %xmm0, %xmm0
	vmovss	%xmm0, (%rcx,%rax,4)
	leal	9(%rsi), %eax
	cmpl	%eax, %r10d
	jle	.L6885
	addl	%edi, %eax
	cltq
	movzbl	(%rbx,%rax), %edx
	vcvtsi2ssl	%edx, %xmm2, %xmm0
	vdivss	%xmm3, %xmm0, %xmm0
	vmovss	%xmm0, (%rcx,%rax,4)
	leal	10(%rsi), %eax
	cmpl	%eax, %r10d
	jle	.L6885
	addl	%edi, %eax
	cltq
	movzbl	(%rbx,%rax), %edx
	vcvtsi2ssl	%edx, %xmm2, %xmm0
	vdivss	%xmm3, %xmm0, %xmm0
	vmovss	%xmm0, (%rcx,%rax,4)
	leal	11(%rsi), %eax
	cmpl	%eax, %r10d
	jle	.L6885
	addl	%edi, %eax
	cltq
	movzbl	(%rbx,%rax), %edx
	vcvtsi2ssl	%edx, %xmm2, %xmm0
	vdivss	%xmm3, %xmm0, %xmm0
	vmovss	%xmm0, (%rcx,%rax,4)
	leal	12(%rsi), %eax
	cmpl	%eax, %r10d
	jle	.L6885
	addl	%edi, %eax
	cltq
	movzbl	(%rbx,%rax), %edx
	vcvtsi2ssl	%edx, %xmm2, %xmm0
	vdivss	%xmm3, %xmm0, %xmm0
	vmovss	%xmm0, (%rcx,%rax,4)
	leal	13(%rsi), %eax
	cmpl	%eax, %r10d
	jle	.L6885
	addl	%edi, %eax
	cltq
	movzbl	(%rbx,%rax), %edx
	vcvtsi2ssl	%edx, %xmm2, %xmm0
	vdivss	%xmm3, %xmm0, %xmm0
	vmovss	%xmm0, (%rcx,%rax,4)
	movl	%esi, %eax
	addl	$14, %eax
	cmpl	%eax, %r10d
	jle	.L6885
	addl	%edi, %eax
	cltq
	movzbl	(%rbx,%rax), %edx
	vcvtsi2ssl	%edx, %xmm2, %xmm0
	vdivss	%xmm3, %xmm0, %xmm0
	vmovss	%xmm0, (%rcx,%rax,4)
	.p2align 4,,10
	.p2align 3
.L6885:
	movq	-88(%rbp), %rdi
	call	free@PLT
.L6875:
	movq	-80(%rbp), %rax
	addq	$64, %rsp
	popq	%rbx
	popq	%r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L6919:
	.cfi_restore_state
	movl	-92(%rbp), %r8d
	movq	%r13, %rcx
	movq	%rbx, %rdx
	movq	%r12, %rsi
	movq	%r14, %rdi
	call	stbi__hdr_load.constprop.0
	movq	%rax, -80(%rbp)
	testq	%rax, %rax
	je	.L6875
	movl	%fs:stbi__vertically_flip_on_load_set@tpoff, %esi
	testl	%esi, %esi
	je	.L6878
	movl	%fs:stbi__vertically_flip_on_load_local@tpoff, %ecx
	testl	%ecx, %ecx
	je	.L6875
.L6879:
	movl	-92(%rbp), %eax
	testl	%eax, %eax
	jne	.L6880
	movl	0(%r13), %eax
	movl	%eax, -92(%rbp)
.L6880:
	movl	-92(%rbp), %ecx
	movl	(%rbx), %edx
	movl	(%r12), %esi
	movq	-80(%rbp), %rdi
	sall	$2, %ecx
	call	stbi__vertical_flip
	jmp	.L6875
.L6881:
	leaq	.LC343(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	movq	$0, -80(%rbp)
	jmp	.L6875
.L6878:
	movl	stbi__vertically_flip_on_load_global(%rip), %edx
	testl	%edx, %edx
	je	.L6875
	jmp	.L6879
.L6921:
	movslq	-108(%rbp), %rax
	movslq	-92(%rbp), %rsi
	movq	-88(%rbp), %rdx
	movq	-80(%rbp), %rbx
	vmovss	.LC247(%rip), %xmm3
	addq	%rax, %rdx
	leaq	0(,%rsi,4), %rdi
	leaq	(%rbx,%rax,4), %rax
	vmovss	%xmm3, -68(%rbp)
	.p2align 4,,10
	.p2align 3
.L6890:
	movzbl	(%rdx), %ecx
	incl	-96(%rbp)
	vxorps	%xmm2, %xmm2, %xmm2
	vcvtsi2ssl	%ecx, %xmm2, %xmm0
	addq	%rsi, %rdx
	movl	-96(%rbp), %ebx
	vdivss	-68(%rbp), %xmm0, %xmm0
	vmovss	%xmm0, (%rax)
	addq	%rdi, %rax
	cmpl	-72(%rbp), %ebx
	jne	.L6890
	jmp	.L6885
.L6892:
	vmovss	.LC247(%rip), %xmm3
	movl	-72(%rbp), %edi
	xorl	%ecx, %ecx
	vmovss	%xmm3, -68(%rbp)
.L6898:
	movzbl	(%rdx,%rcx), %esi
	vxorps	%xmm2, %xmm2, %xmm2
	vcvtsi2ssl	%esi, %xmm2, %xmm0
	vdivss	-68(%rbp), %xmm0, %xmm0
	vmovss	%xmm0, (%rax,%rcx,4)
	incq	%rcx
	cmpq	%rdi, %rcx
	jne	.L6898
	jmp	.L6885
.L6902:
	xorl	%eax, %eax
	jmp	.L6893
.L6922:
	vzeroupper
	jmp	.L6896
.L6916:
	vzeroupper
	jmp	.L6885
.L6920:
	movq	-88(%rbp), %rdi
	call	free@PLT
	leaq	.LC23(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L6875
	.cfi_endproc
.LFE612:
	.size	stbi__loadf_main, .-stbi__loadf_main
	.p2align 4
	.type	stbi__load_and_postprocess_16bit, @function
stbi__load_and_postprocess_16bit:
.LFB600:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	pushq	-8(%r10)
	pushq	%rbp
	movq	%rsp, %rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	pushq	%r15
	leaq	-68(%rbp), %r9
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	movq	%rcx, %r15
	pushq	%r14
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	movq	%rdx, %r14
	pushq	%r13
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	movq	%rsi, %r13
	pushq	%r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	pushq	%rbx
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movl	%r8d, %ebx
	subq	$72, %rsp
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	pushq	$16
	call	stbi__load_main
	popq	%rsi
	movq	%rax, %r12
	popq	%rdi
	testq	%rax, %rax
	je	.L6923
	movl	-68(%rbp), %eax
	leal	-8(%rax), %esi
	andl	$-9, %esi
	jne	.L6963
	cmpl	$16, %eax
	je	.L6926
	movl	%ebx, %eax
	testl	%ebx, %ebx
	je	.L6964
.L6927:
	movl	(%r14), %ecx
	movl	%esi, -92(%rbp)
	imull	0(%r13), %ecx
	imull	%eax, %ecx
	leal	(%rcx,%rcx), %edi
	movslq	%edi, %rdi
	movl	%ecx, -88(%rbp)
	call	malloc@PLT
	movq	%rax, %rdx
	testq	%rax, %rax
	je	.L6928
	movl	-88(%rbp), %ecx
	movl	-92(%rbp), %esi
	testl	%ecx, %ecx
	jle	.L6930
	movslq	%ecx, %rax
	leaq	(%rdx,%rax,2), %r8
	cmpq	%r8, %r12
	setnb	%r8b
	addq	%r12, %rax
	cmpq	%rax, %rdx
	setnb	%al
	orb	%al, %r8b
	movl	%ecx, %edi
	leal	-1(%rcx), %r9d
	je	.L6932
	cmpl	$14, %r9d
	jbe	.L6932
	cmpl	$30, %r9d
	jbe	.L6945
	movl	%ecx, %esi
	shrl	$5, %esi
	salq	$5, %rsi
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L6934:
	vmovdqu	(%r12,%rax), %ymm0
	vpmovzxbw	%xmm0, %ymm1
	vpsllw	$8, %ymm1, %ymm2
	vextracti128	$0x1, %ymm0, %xmm0
	vpaddw	%ymm1, %ymm2, %ymm1
	vpmovzxbw	%xmm0, %ymm0
	vmovdqu	%ymm1, (%rdx,%rax,2)
	vpsllw	$8, %ymm0, %ymm1
	vpaddw	%ymm0, %ymm1, %ymm0
	vmovdqu	%ymm0, 32(%rdx,%rax,2)
	addq	$32, %rax
	cmpq	%rsi, %rax
	jne	.L6934
	movl	%ecx, %esi
	andl	$-32, %esi
	movl	%esi, %eax
	cmpl	%esi, %ecx
	je	.L6960
	movl	%ecx, %edi
	subl	%esi, %edi
	leal	-1(%rdi), %r8d
	cmpl	$14, %r8d
	jbe	.L6965
	vzeroupper
.L6933:
	vmovdqu	(%r12,%rsi), %xmm0
	leaq	(%rdx,%rsi,2), %r8
	vpmovzxbw	%xmm0, %xmm2
	vpsllw	$8, %xmm2, %xmm1
	vpsrldq	$8, %xmm0, %xmm0
	vpaddw	%xmm2, %xmm1, %xmm1
	vpmovzxbw	%xmm0, %xmm0
	vmovdqu	%xmm1, (%r8)
	movl	%edi, %esi
	vpsllw	$8, %xmm0, %xmm1
	vpaddw	%xmm0, %xmm1, %xmm0
	andl	$-16, %esi
	vmovdqu	%xmm0, 16(%r8)
	addl	%esi, %eax
	cmpl	%esi, %edi
	je	.L6930
.L6936:
	movslq	%eax, %rdi
	movzbl	(%r12,%rdi), %r9d
	leaq	(%rdi,%rdi), %rsi
	movl	%r9d, %r8d
	sall	$8, %r8d
	addl	%r9d, %r8d
	movw	%r8w, (%rdx,%rdi,2)
	leal	1(%rax), %edi
	cmpl	%ecx, %edi
	jge	.L6930
	movslq	%edi, %rdi
	movzbl	(%r12,%rdi), %r8d
	movl	%r8d, %edi
	sall	$8, %edi
	addl	%r8d, %edi
	movw	%di, 2(%rdx,%rsi)
	leal	2(%rax), %edi
	cmpl	%edi, %ecx
	jle	.L6930
	movslq	%edi, %rdi
	movzbl	(%r12,%rdi), %r8d
	movl	%r8d, %edi
	sall	$8, %edi
	addl	%r8d, %edi
	movw	%di, 4(%rdx,%rsi)
	leal	3(%rax), %edi
	cmpl	%edi, %ecx
	jle	.L6930
	movslq	%edi, %rdi
	movzbl	(%r12,%rdi), %r8d
	movl	%r8d, %edi
	sall	$8, %edi
	addl	%r8d, %edi
	movw	%di, 6(%rdx,%rsi)
	leal	4(%rax), %edi
	cmpl	%edi, %ecx
	jle	.L6930
	movslq	%edi, %rdi
	movzbl	(%r12,%rdi), %r8d
	movl	%r8d, %edi
	sall	$8, %edi
	addl	%r8d, %edi
	movw	%di, 8(%rdx,%rsi)
	leal	5(%rax), %edi
	cmpl	%edi, %ecx
	jle	.L6930
	movslq	%edi, %rdi
	movzbl	(%r12,%rdi), %r8d
	movl	%r8d, %edi
	sall	$8, %edi
	addl	%r8d, %edi
	movw	%di, 10(%rdx,%rsi)
	leal	6(%rax), %edi
	cmpl	%edi, %ecx
	jle	.L6930
	movslq	%edi, %rdi
	movzbl	(%r12,%rdi), %r8d
	movl	%r8d, %edi
	sall	$8, %edi
	addl	%r8d, %edi
	movw	%di, 12(%rdx,%rsi)
	leal	7(%rax), %edi
	cmpl	%edi, %ecx
	jle	.L6930
	movslq	%edi, %rdi
	movzbl	(%r12,%rdi), %r8d
	movl	%r8d, %edi
	sall	$8, %edi
	addl	%r8d, %edi
	movw	%di, 14(%rdx,%rsi)
	leal	8(%rax), %edi
	cmpl	%edi, %ecx
	jle	.L6930
	movslq	%edi, %rdi
	movzbl	(%r12,%rdi), %r8d
	movl	%r8d, %edi
	sall	$8, %edi
	addl	%r8d, %edi
	movw	%di, 16(%rdx,%rsi)
	leal	9(%rax), %edi
	cmpl	%edi, %ecx
	jle	.L6930
	movslq	%edi, %rdi
	movzbl	(%r12,%rdi), %r8d
	movl	%r8d, %edi
	sall	$8, %edi
	addl	%r8d, %edi
	movw	%di, 18(%rdx,%rsi)
	leal	10(%rax), %edi
	cmpl	%edi, %ecx
	jle	.L6930
	movslq	%edi, %rdi
	movzbl	(%r12,%rdi), %r8d
	movl	%r8d, %edi
	sall	$8, %edi
	addl	%r8d, %edi
	movw	%di, 20(%rdx,%rsi)
	leal	11(%rax), %edi
	cmpl	%edi, %ecx
	jle	.L6930
	movslq	%edi, %rdi
	movzbl	(%r12,%rdi), %r8d
	movl	%r8d, %edi
	sall	$8, %edi
	addl	%r8d, %edi
	movw	%di, 22(%rdx,%rsi)
	leal	12(%rax), %edi
	cmpl	%edi, %ecx
	jle	.L6930
	movslq	%edi, %rdi
	movzbl	(%r12,%rdi), %r8d
	movl	%r8d, %edi
	sall	$8, %edi
	addl	%r8d, %edi
	movw	%di, 24(%rdx,%rsi)
	leal	13(%rax), %edi
	cmpl	%edi, %ecx
	jle	.L6930
	movslq	%edi, %rdi
	movzbl	(%r12,%rdi), %r8d
	addl	$14, %eax
	movl	%r8d, %edi
	sall	$8, %edi
	addl	%r8d, %edi
	movw	%di, 26(%rdx,%rsi)
	cmpl	%eax, %ecx
	jle	.L6930
	cltq
	movzbl	(%r12,%rax), %ecx
	movl	%ecx, %eax
	sall	$8, %eax
	addl	%ecx, %eax
	movw	%ax, 28(%rdx,%rsi)
	.p2align 4,,10
	.p2align 3
.L6930:
	movq	%r12, %rdi
	movq	%rdx, -88(%rbp)
	call	free@PLT
	movq	-88(%rbp), %rdx
.L6931:
	movl	$16, -68(%rbp)
	movq	%rdx, %r12
.L6926:
	movl	%fs:stbi__vertically_flip_on_load_set@tpoff, %ecx
	testl	%ecx, %ecx
	jne	.L6966
	movl	stbi__vertically_flip_on_load_global(%rip), %eax
	testl	%eax, %eax
	je	.L6923
.L6941:
	testl	%ebx, %ebx
	jne	.L6942
	movl	(%r15), %ebx
.L6942:
	movl	(%r14), %edx
	movl	0(%r13), %esi
	leal	(%rbx,%rbx), %ecx
	movq	%r12, %rdi
	call	stbi__vertical_flip
.L6923:
	movq	-56(%rbp), %rax
	subq	%fs:40, %rax
	jne	.L6967
	leaq	-48(%rbp), %rsp
	popq	%rbx
	popq	%r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	movq	%r12, %rax
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L6966:
	.cfi_restore_state
	movl	%fs:stbi__vertically_flip_on_load_local@tpoff, %edx
	testl	%edx, %edx
	jne	.L6941
	jmp	.L6923
	.p2align 4,,10
	.p2align 3
.L6964:
	movl	(%r15), %eax
	jmp	.L6927
	.p2align 4,,10
	.p2align 3
.L6932:
	movl	%ecx, %ecx
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L6938:
	movzbl	(%r12,%rax), %edi
	movl	%edi, %esi
	sall	$8, %esi
	addl	%edi, %esi
	movw	%si, (%rdx,%rax,2)
	incq	%rax
	cmpq	%rcx, %rax
	jne	.L6938
	jmp	.L6930
.L6945:
	xorl	%eax, %eax
	jmp	.L6933
.L6965:
	vzeroupper
	jmp	.L6936
.L6960:
	vzeroupper
	jmp	.L6930
.L6963:
	leaq	__PRETTY_FUNCTION__.33(%rip), %rcx
	movl	$1275, %edx
	leaq	.LC21(%rip), %rsi
	leaq	.LC372(%rip), %rdi
	call	__assert_fail@PLT
.L6967:
	call	__stack_chk_fail@PLT
.L6928:
	leaq	.LC23(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L6931
	.cfi_endproc
.LFE600:
	.size	stbi__load_and_postprocess_16bit, .-stbi__load_and_postprocess_16bit
	.p2align 4
	.type	stbi__load_gif_main.constprop.0, @function
stbi__load_gif_main.constprop.0:
.LFB902:
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
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	leaq	-32768(%rsp), %r11
	.cfi_def_cfa 11, 32824
.LPSRL1:
	subq	$4096, %rsp
	orq	$0, (%rsp)
	cmpq	%r11, %rsp
	jne	.LPSRL1
	.cfi_def_cfa_register 7
	subq	$2264, %rsp
	.cfi_def_cfa_offset 35088
	movq	%rsi, 8(%rsp)
	movq	%rdx, 48(%rsp)
	movq	%rcx, 56(%rsp)
	movq	%r8, 72(%rsp)
	movq	%r9, 16(%rsp)
	movq	%rdi, %r13
	movq	%rsi, %rbx
	movq	%fs:40, %rax
	movq	%rax, 35016(%rsp)
	xorl	%eax, %eax
	call	stbi__gif_test_raw
	vmovdqu	208(%r13), %xmm0
	vmovdqu	%xmm0, 192(%r13)
	testl	%eax, %eax
	je	.L6969
	leaq	80(%rsp), %rdi
	xorl	%esi, %esi
	movl	$34928, %edx
	movq	%rdi, 24(%rsp)
	call	memset@PLT
	testq	%rbx, %rbx
	je	.L6970
	movq	$0, (%rbx)
.L6970:
	movl	$0, (%rsp)
	movl	$4, %ebx
	xorl	%r15d, %r15d
	xorl	%r12d, %r12d
	.p2align 4,,10
	.p2align 3
.L6971:
	movq	16(%rsp), %rdx
	movq	24(%rsp), %rsi
	movq	%r15, %rcx
	movq	%r13, %rdi
	call	stbi__gif_load_next.constprop.0
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L6972
	cmpq	%rax, %r13
	je	.L6972
	movl	80(%rsp), %edx
	movq	48(%rsp), %rax
	incl	(%rsp)
	movl	%edx, (%rax)
	movl	84(%rsp), %eax
	movq	56(%rsp), %rsi
	imull	%eax, %edx
	movl	(%rsp), %ecx
	movl	%eax, (%rsi)
	leal	0(,%rdx,4), %r14d
	imull	%r14d, %ecx
	movl	%edx, 44(%rsp)
	movl	%ecx, 32(%rsp)
	movslq	%ecx, %rsi
	testq	%r12, %r12
	je	.L6973
	movq	%r12, %rdi
	call	realloc@PLT
	movq	%rax, %r9
	testq	%rax, %rax
	je	.L7028
	movq	8(%rsp), %rax
	testq	%rax, %rax
	je	.L6979
	movq	(%rax), %rdi
	movq	%rbx, %rsi
	movq	%r9, 64(%rsp)
	call	realloc@PLT
	testq	%rax, %rax
	movq	64(%rsp), %r9
	je	.L7029
	movq	8(%rsp), %rsi
	movq	%r9, %r12
	movq	%rax, (%rsi)
.L6981:
	movl	32(%rsp), %edi
	movslq	%r14d, %rdx
	subl	%r14d, %edi
	movslq	%edi, %rdi
	addq	%r12, %rdi
	movq	%rbp, %rsi
	call	memcpy@PLT
	cmpl	$1, (%rsp)
	je	.L6986
	movl	44(%rsp), %eax
	movq	%r12, %r15
	sall	$3, %eax
	cltq
	subq	%rax, %r15
.L6986:
	movq	8(%rsp), %rax
	movl	35000(%rsp), %edx
	movq	(%rax), %rax
	movl	%edx, -4(%rax,%rbx)
.L6983:
	addq	$4, %rbx
	jmp	.L6971
	.p2align 4,,10
	.p2align 3
.L6989:
	movq	%rax, %r9
.L6979:
	movl	32(%rsp), %edi
	movslq	%r14d, %rdx
	subl	%r14d, %edi
	movslq	%edi, %rdi
	addq	%r9, %rdi
	movq	%rbp, %rsi
	movq	%r9, 32(%rsp)
	call	memcpy@PLT
	cmpl	$1, (%rsp)
	movq	32(%rsp), %r12
	je	.L6983
	movl	44(%rsp), %eax
	movq	%r12, %r15
	sall	$3, %eax
	cltq
	subq	%rax, %r15
	jmp	.L6983
	.p2align 4,,10
	.p2align 3
.L6973:
	movq	%rsi, %rdi
	call	malloc@PLT
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L7030
	cmpq	$0, 8(%rsp)
	je	.L6989
	movq	%rbx, %rdi
	call	malloc@PLT
	movq	8(%rsp), %rsi
	movq	%rax, (%rsi)
	testq	%rax, %rax
	jne	.L6981
	movq	88(%rsp), %rdi
	call	free@PLT
	movq	104(%rsp), %rdi
	call	free@PLT
	movq	96(%rsp), %rdi
	call	free@PLT
	movq	%r12, %rdi
	jmp	.L7027
	.p2align 4,,10
	.p2align 3
.L6972:
	movq	88(%rsp), %rdi
	call	free@PLT
	movq	104(%rsp), %rdi
	call	free@PLT
	movq	96(%rsp), %rdi
	call	free@PLT
	testl	$-5, 35088(%rsp)
	jne	.L7031
.L6984:
	movq	72(%rsp), %rax
	movl	(%rsp), %ebx
	movl	%ebx, (%rax)
.L6968:
	movq	35016(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L7032
	addq	$35032, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	movq	%r12, %rax
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L7031:
	.cfi_restore_state
	movl	(%rsp), %ecx
	movl	84(%rsp), %r8d
	imull	80(%rsp), %ecx
	movl	35088(%rsp), %edx
	movq	%r12, %rdi
	movl	$4, %esi
	call	stbi__convert_format
	movq	%rax, %r12
	jmp	.L6984
.L6969:
	leaq	.LC341(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%r12d, %r12d
	jmp	.L6968
.L7030:
	movq	88(%rsp), %rdi
	call	free@PLT
	movq	104(%rsp), %rdi
	call	free@PLT
	movq	96(%rsp), %rdi
	call	free@PLT
	movq	8(%rsp), %rax
	testq	%rax, %rax
	je	.L6976
.L7025:
	movq	(%rax), %rdi
	testq	%rdi, %rdi
	je	.L6976
.L7023:
	call	free@PLT
.L6976:
	leaq	.LC23(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%r12d, %r12d
	jmp	.L6968
.L7029:
	movq	88(%rsp), %rdi
	movq	%r9, (%rsp)
	call	free@PLT
	movq	104(%rsp), %rdi
	call	free@PLT
	movq	96(%rsp), %rdi
	call	free@PLT
	movq	(%rsp), %rdi
.L7027:
	call	free@PLT
	movq	8(%rsp), %rax
	movq	(%rax), %rdi
	testq	%rdi, %rdi
	jne	.L7023
	jmp	.L6976
.L7028:
	movq	88(%rsp), %rdi
	call	free@PLT
	movq	104(%rsp), %rdi
	call	free@PLT
	movq	96(%rsp), %rdi
	call	free@PLT
	movq	%r12, %rdi
	call	free@PLT
	movq	8(%rsp), %rax
	testq	%rax, %rax
	jne	.L7025
	jmp	.L6976
.L7032:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE902:
	.size	stbi__load_gif_main.constprop.0, .-stbi__load_gif_main.constprop.0
	.p2align 4
	.globl	stbi_failure_reason
	.type	stbi_failure_reason, @function
stbi_failure_reason:
.LFB580:
	.cfi_startproc
	endbr64
	movq	%fs:stbi__g_failure_reason@tpoff, %rax
	ret
	.cfi_endproc
.LFE580:
	.size	stbi_failure_reason, .-stbi_failure_reason
	.p2align 4
	.globl	stbi_image_free
	.type	stbi_image_free, @function
stbi_image_free:
.LFB591:
	.cfi_startproc
	endbr64
	jmp	free@PLT
	.cfi_endproc
.LFE591:
	.size	stbi_image_free, .-stbi_image_free
	.p2align 4
	.globl	stbi_set_flip_vertically_on_load
	.type	stbi_set_flip_vertically_on_load, @function
stbi_set_flip_vertically_on_load:
.LFB592:
	.cfi_startproc
	endbr64
	movl	%edi, stbi__vertically_flip_on_load_global(%rip)
	ret
	.cfi_endproc
.LFE592:
	.size	stbi_set_flip_vertically_on_load, .-stbi_set_flip_vertically_on_load
	.p2align 4
	.globl	stbi_set_flip_vertically_on_load_thread
	.type	stbi_set_flip_vertically_on_load_thread, @function
stbi_set_flip_vertically_on_load_thread:
.LFB593:
	.cfi_startproc
	endbr64
	movl	%edi, %fs:stbi__vertically_flip_on_load_local@tpoff
	movl	$1, %fs:stbi__vertically_flip_on_load_set@tpoff
	ret
	.cfi_endproc
.LFE593:
	.size	stbi_set_flip_vertically_on_load_thread, .-stbi_set_flip_vertically_on_load_thread
	.section	.rodata.str1.1
.LC375:
	.string	"rb"
.LC376:
	.string	"can't fopen"
	.text
	.p2align 4
	.globl	stbi_load
	.type	stbi_load, @function
stbi_load:
.LFB603:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rcx, %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdx, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rsi, %rbp
	leaq	.LC375(%rip), %rsi
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	%r8d, %ebx
	subq	$248, %rsp
	.cfi_def_cfa_offset 304
	movq	%fs:40, %rax
	movq	%rax, 232(%rsp)
	xorl	%eax, %eax
	call	fopen@PLT
	testq	%rax, %rax
	je	.L7048
	movq	%rax, %r14
	movq	16+stbi__stdio_callbacks(%rip), %rax
	leaq	56(%rsp), %r15
	vmovdqa	stbi__stdio_callbacks(%rip), %xmm0
	movq	%rax, 32(%rsp)
	movl	$128, %edx
	movabsq	$549755813889, %rax
	movq	%r15, %rsi
	movq	%r14, %rdi
	movq	%r14, 40(%rsp)
	movq	%rax, 48(%rsp)
	movl	$0, 184(%rsp)
	movq	%r15, 208(%rsp)
	movq	%r15, 192(%rsp)
	vmovdqa	%xmm0, 16(%rsp)
	call	stbi__stdio_read
	movq	192(%rsp), %rdx
	subq	208(%rsp), %rdx
	addl	%edx, 184(%rsp)
	testl	%eax, %eax
	je	.L7049
	cltq
	addq	%r15, %rax
.L7041:
	movq	%r12, %rdx
	movq	%rsp, %rdi
	movl	%ebx, %r8d
	movq	%r13, %rcx
	movq	%rbp, %rsi
	movq	%rax, 200(%rsp)
	movq	%r15, 192(%rsp)
	movq	%rax, 216(%rsp)
	call	stbi__load_and_postprocess_8bit
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L7042
	movl	192(%rsp), %esi
	movl	$1, %edx
	subl	200(%rsp), %esi
	movslq	%esi, %rsi
	movq	%r14, %rdi
	call	fseek@PLT
.L7042:
	movq	%r14, %rdi
	call	fclose@PLT
.L7037:
	movq	232(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L7050
	addq	$248, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	movq	%r12, %rax
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
.L7049:
	.cfi_restore_state
	movl	$0, 48(%rsp)
	movb	$0, 56(%rsp)
	leaq	57(%rsp), %rax
	jmp	.L7041
.L7050:
	call	__stack_chk_fail@PLT
.L7048:
	leaq	.LC376(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%r12d, %r12d
	jmp	.L7037
	.cfi_endproc
.LFE603:
	.size	stbi_load, .-stbi_load
	.p2align 4
	.globl	stbi_load_from_file
	.type	stbi_load_from_file, @function
stbi_load_from_file:
.LFB604:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movl	%r8d, %r15d
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rcx, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rdx, %r13
	movl	$128, %edx
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rsi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$248, %rsp
	.cfi_def_cfa_offset 304
	movq	%fs:40, %rax
	movq	%rax, 232(%rsp)
	xorl	%eax, %eax
	movq	16+stbi__stdio_callbacks(%rip), %rax
	leaq	56(%rsp), %rbx
	vmovdqa	stbi__stdio_callbacks(%rip), %xmm0
	movq	%rax, 32(%rsp)
	movq	%rbx, %rsi
	movabsq	$549755813889, %rax
	movq	%rdi, 40(%rsp)
	movq	%rax, 48(%rsp)
	movl	$0, 184(%rsp)
	movq	%rbx, 208(%rsp)
	movq	%rbx, 192(%rsp)
	vmovdqa	%xmm0, 16(%rsp)
	call	stbi__stdio_read
	movq	192(%rsp), %rdx
	subq	208(%rsp), %rdx
	addl	%edx, 184(%rsp)
	testl	%eax, %eax
	jne	.L7052
	movl	$0, 48(%rsp)
	movb	$0, 56(%rsp)
	leaq	57(%rsp), %rax
.L7053:
	movq	%r12, %rsi
	movq	%rsp, %rdi
	movl	%r15d, %r8d
	movq	%r14, %rcx
	movq	%r13, %rdx
	movq	%rax, 200(%rsp)
	movq	%rbx, 192(%rsp)
	movq	%rax, 216(%rsp)
	call	stbi__load_and_postprocess_8bit
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L7051
	movl	192(%rsp), %esi
	movl	$1, %edx
	subl	200(%rsp), %esi
	movslq	%esi, %rsi
	movq	%rbp, %rdi
	call	fseek@PLT
.L7051:
	movq	232(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L7060
	addq	$248, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	movq	%r12, %rax
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
.L7052:
	.cfi_restore_state
	cltq
	addq	%rbx, %rax
	jmp	.L7053
.L7060:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE604:
	.size	stbi_load_from_file, .-stbi_load_from_file
	.p2align 4
	.globl	stbi_load_from_file_16
	.type	stbi_load_from_file_16, @function
stbi_load_from_file_16:
.LFB605:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movl	%r8d, %r15d
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rcx, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rdx, %r13
	movl	$128, %edx
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rsi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$248, %rsp
	.cfi_def_cfa_offset 304
	movq	%fs:40, %rax
	movq	%rax, 232(%rsp)
	xorl	%eax, %eax
	movq	16+stbi__stdio_callbacks(%rip), %rax
	leaq	56(%rsp), %rbx
	vmovdqa	stbi__stdio_callbacks(%rip), %xmm0
	movq	%rax, 32(%rsp)
	movq	%rbx, %rsi
	movabsq	$549755813889, %rax
	movq	%rdi, 40(%rsp)
	movq	%rax, 48(%rsp)
	movl	$0, 184(%rsp)
	movq	%rbx, 208(%rsp)
	movq	%rbx, 192(%rsp)
	vmovdqa	%xmm0, 16(%rsp)
	call	stbi__stdio_read
	movq	192(%rsp), %rdx
	subq	208(%rsp), %rdx
	addl	%edx, 184(%rsp)
	testl	%eax, %eax
	jne	.L7062
	movl	$0, 48(%rsp)
	movb	$0, 56(%rsp)
	leaq	57(%rsp), %rax
.L7063:
	movq	%r12, %rsi
	movq	%rsp, %rdi
	movl	%r15d, %r8d
	movq	%r14, %rcx
	movq	%r13, %rdx
	movq	%rax, 200(%rsp)
	movq	%rbx, 192(%rsp)
	movq	%rax, 216(%rsp)
	call	stbi__load_and_postprocess_16bit
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L7061
	movl	192(%rsp), %esi
	movl	$1, %edx
	subl	200(%rsp), %esi
	movslq	%esi, %rsi
	movq	%rbp, %rdi
	call	fseek@PLT
.L7061:
	movq	232(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L7070
	addq	$248, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	movq	%r12, %rax
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
.L7062:
	.cfi_restore_state
	cltq
	addq	%rbx, %rax
	jmp	.L7063
.L7070:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE605:
	.size	stbi_load_from_file_16, .-stbi_load_from_file_16
	.p2align 4
	.globl	stbi_load_16
	.type	stbi_load_16, @function
stbi_load_16:
.LFB606:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rcx, %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdx, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rsi, %rbp
	leaq	.LC375(%rip), %rsi
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	%r8d, %ebx
	subq	$248, %rsp
	.cfi_def_cfa_offset 304
	movq	%fs:40, %rax
	movq	%rax, 232(%rsp)
	xorl	%eax, %eax
	call	fopen@PLT
	testq	%rax, %rax
	je	.L7082
	movq	%rax, %r14
	movq	16+stbi__stdio_callbacks(%rip), %rax
	leaq	56(%rsp), %r15
	vmovdqa	stbi__stdio_callbacks(%rip), %xmm0
	movq	%rax, 32(%rsp)
	movl	$128, %edx
	movabsq	$549755813889, %rax
	movq	%r15, %rsi
	movq	%r14, %rdi
	movq	%r14, 40(%rsp)
	movq	%rax, 48(%rsp)
	movl	$0, 184(%rsp)
	movq	%r15, 208(%rsp)
	movq	%r15, 192(%rsp)
	vmovdqa	%xmm0, 16(%rsp)
	call	stbi__stdio_read
	movq	192(%rsp), %rdx
	subq	208(%rsp), %rdx
	addl	%edx, 184(%rsp)
	testl	%eax, %eax
	je	.L7083
	cltq
	addq	%r15, %rax
.L7075:
	movq	%r12, %rdx
	movq	%rsp, %rdi
	movl	%ebx, %r8d
	movq	%r13, %rcx
	movq	%rbp, %rsi
	movq	%rax, 200(%rsp)
	movq	%r15, 192(%rsp)
	movq	%rax, 216(%rsp)
	call	stbi__load_and_postprocess_16bit
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L7076
	movl	192(%rsp), %esi
	movl	$1, %edx
	subl	200(%rsp), %esi
	movslq	%esi, %rsi
	movq	%r14, %rdi
	call	fseek@PLT
.L7076:
	movq	%r14, %rdi
	call	fclose@PLT
.L7071:
	movq	232(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L7084
	addq	$248, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	movq	%r12, %rax
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
.L7083:
	.cfi_restore_state
	movl	$0, 48(%rsp)
	movb	$0, 56(%rsp)
	leaq	57(%rsp), %rax
	jmp	.L7075
.L7084:
	call	__stack_chk_fail@PLT
.L7082:
	leaq	.LC376(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%r12d, %r12d
	jmp	.L7071
	.cfi_endproc
.LFE606:
	.size	stbi_load_16, .-stbi_load_16
	.p2align 4
	.globl	stbi_load_16_from_memory
	.type	stbi_load_16_from_memory, @function
stbi_load_16_from_memory:
.LFB607:
	.cfi_startproc
	endbr64
	subq	$248, %rsp
	.cfi_def_cfa_offset 256
	movslq	%esi, %r10
	movq	%fs:40, %rax
	movq	%rax, 232(%rsp)
	xorl	%eax, %eax
	vmovq	%rdi, %xmm1
	leaq	(%rdi,%r10), %rax
	vpinsrq	$1, %rax, %xmm1, %xmm0
	movq	%rdx, %rsi
	movq	%rsp, %rdi
	movq	%rcx, %rdx
	movq	%r8, %rcx
	movl	%r9d, %r8d
	movq	$0, 16(%rsp)
	movl	$0, 48(%rsp)
	movl	$0, 184(%rsp)
	vmovdqa	%xmm0, 192(%rsp)
	vmovdqa	%xmm0, 208(%rsp)
	call	stbi__load_and_postprocess_16bit
	movq	232(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L7088
	addq	$248, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L7088:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE607:
	.size	stbi_load_16_from_memory, .-stbi_load_16_from_memory
	.p2align 4
	.globl	stbi_load_16_from_callbacks
	.type	stbi_load_16_from_callbacks, @function
stbi_load_16_from_callbacks:
.LFB608:
	.cfi_startproc
	endbr64
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	movq	%rdi, %rax
	movq	%rsi, %rdi
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movl	%r9d, %r14d
	movq	%r8, %r13
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	movq	%rcx, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movq	%rdx, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$240, %rsp
	.cfi_def_cfa_offset 288
	vmovdqu	(%rax), %xmm0
	movq	(%rax), %rcx
	movq	16(%rax), %rax
	movq	%fs:40, %rdx
	movq	%rdx, 232(%rsp)
	xorl	%edx, %edx
	leaq	56(%rsp), %rbx
	movq	%rax, 32(%rsp)
	movabsq	$549755813889, %rax
	movq	%rsi, 40(%rsp)
	movq	%rax, 48(%rsp)
	movl	$0, 184(%rsp)
	movq	%rbx, 208(%rsp)
	movq	%rbx, 192(%rsp)
	movl	$128, %edx
	vmovdqa	%xmm0, 16(%rsp)
	movq	%rbx, %rsi
	call	*%rcx
	movq	192(%rsp), %rdx
	subq	208(%rsp), %rdx
	addl	%edx, 184(%rsp)
	testl	%eax, %eax
	jne	.L7090
	movl	$0, 48(%rsp)
	movb	$0, 56(%rsp)
	leaq	57(%rsp), %rax
.L7091:
	movq	%r12, %rdx
	movq	%rsp, %rdi
	movl	%r14d, %r8d
	movq	%r13, %rcx
	movq	%rbp, %rsi
	movq	%rax, 200(%rsp)
	movq	%rbx, 192(%rsp)
	movq	%rax, 216(%rsp)
	call	stbi__load_and_postprocess_16bit
	movq	232(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L7094
	addq	$240, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
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
	ret
	.p2align 4,,10
	.p2align 3
.L7090:
	.cfi_restore_state
	cltq
	addq	%rbx, %rax
	jmp	.L7091
.L7094:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE608:
	.size	stbi_load_16_from_callbacks, .-stbi_load_16_from_callbacks
	.p2align 4
	.globl	stbi_load_from_memory
	.type	stbi_load_from_memory, @function
stbi_load_from_memory:
.LFB609:
	.cfi_startproc
	endbr64
	subq	$248, %rsp
	.cfi_def_cfa_offset 256
	movslq	%esi, %r10
	movq	%fs:40, %rax
	movq	%rax, 232(%rsp)
	xorl	%eax, %eax
	vmovq	%rdi, %xmm1
	leaq	(%rdi,%r10), %rax
	vpinsrq	$1, %rax, %xmm1, %xmm0
	movq	%rdx, %rsi
	movq	%rsp, %rdi
	movq	%rcx, %rdx
	movq	%r8, %rcx
	movl	%r9d, %r8d
	movq	$0, 16(%rsp)
	movl	$0, 48(%rsp)
	movl	$0, 184(%rsp)
	vmovdqa	%xmm0, 192(%rsp)
	vmovdqa	%xmm0, 208(%rsp)
	call	stbi__load_and_postprocess_8bit
	movq	232(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L7098
	addq	$248, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L7098:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE609:
	.size	stbi_load_from_memory, .-stbi_load_from_memory
	.p2align 4
	.globl	stbi_load_from_callbacks
	.type	stbi_load_from_callbacks, @function
stbi_load_from_callbacks:
.LFB610:
	.cfi_startproc
	endbr64
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	movq	%rdi, %rax
	movq	%rsi, %rdi
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movl	%r9d, %r14d
	movq	%r8, %r13
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	movq	%rcx, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movq	%rdx, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$240, %rsp
	.cfi_def_cfa_offset 288
	vmovdqu	(%rax), %xmm0
	movq	(%rax), %rcx
	movq	16(%rax), %rax
	movq	%fs:40, %rdx
	movq	%rdx, 232(%rsp)
	xorl	%edx, %edx
	leaq	56(%rsp), %rbx
	movq	%rax, 32(%rsp)
	movabsq	$549755813889, %rax
	movq	%rsi, 40(%rsp)
	movq	%rax, 48(%rsp)
	movl	$0, 184(%rsp)
	movq	%rbx, 208(%rsp)
	movq	%rbx, 192(%rsp)
	movl	$128, %edx
	vmovdqa	%xmm0, 16(%rsp)
	movq	%rbx, %rsi
	call	*%rcx
	movq	192(%rsp), %rdx
	subq	208(%rsp), %rdx
	addl	%edx, 184(%rsp)
	testl	%eax, %eax
	jne	.L7100
	movl	$0, 48(%rsp)
	movb	$0, 56(%rsp)
	leaq	57(%rsp), %rax
.L7101:
	movq	%r12, %rdx
	movq	%rsp, %rdi
	movl	%r14d, %r8d
	movq	%r13, %rcx
	movq	%rbp, %rsi
	movq	%rax, 200(%rsp)
	movq	%rbx, 192(%rsp)
	movq	%rax, 216(%rsp)
	call	stbi__load_and_postprocess_8bit
	movq	232(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L7104
	addq	$240, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
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
	ret
	.p2align 4,,10
	.p2align 3
.L7100:
	.cfi_restore_state
	cltq
	addq	%rbx, %rax
	jmp	.L7101
.L7104:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE610:
	.size	stbi_load_from_callbacks, .-stbi_load_from_callbacks
	.p2align 4
	.globl	stbi_load_gif_from_memory
	.type	stbi_load_gif_from_memory, @function
stbi_load_gif_from_memory:
.LFB611:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movslq	%esi, %r10
	vmovq	%rdi, %xmm1
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdx, %rsi
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%r9, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%r8, %rbp
	movq	%r12, %r8
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rcx, %rbx
	movq	%rbx, %rdx
	subq	$2360, %rsp
	.cfi_def_cfa_offset 2416
	movq	%fs:40, %rax
	movq	%rax, 2344(%rsp)
	xorl	%eax, %eax
	leaq	(%rdi,%r10), %rax
	vpinsrq	$1, %rax, %xmm1, %xmm0
	movq	2416(%rsp), %r13
	movq	$0, 80(%rsp)
	movl	$0, 112(%rsp)
	movl	$0, 248(%rsp)
	vmovdqa	%xmm0, 256(%rsp)
	vmovdqa	%xmm0, 272(%rsp)
	leaq	64(%rsp), %rdi
	subq	$8, %rsp
	.cfi_def_cfa_offset 2424
	movl	2432(%rsp), %eax
	movq	%r13, %r9
	pushq	%rax
	.cfi_def_cfa_offset 2432
	movq	%rbp, %rcx
	call	stbi__load_gif_main.constprop.0
	movq	%rax, 72(%rsp)
	popq	%rsi
	.cfi_def_cfa_offset 2424
	popq	%rdi
	.cfi_def_cfa_offset 2416
	movl	%fs:stbi__vertically_flip_on_load_set@tpoff, %r8d
	testl	%r8d, %r8d
	je	.L7106
	movl	%fs:stbi__vertically_flip_on_load_local@tpoff, %ecx
	testl	%ecx, %ecx
	jne	.L7107
.L7105:
	movq	2344(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L7123
	movq	56(%rsp), %rax
	addq	$2360, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
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
	ret
.L7106:
	.cfi_restore_state
	movl	stbi__vertically_flip_on_load_global(%rip), %edx
	testl	%edx, %edx
	je	.L7105
.L7107:
	movslq	0(%rbp), %rax
	movslq	(%rbx), %rcx
	movl	%eax, %esi
	imull	%ecx, %esi
	movslq	0(%r13), %rdx
	movl	(%r12), %edi
	imull	%edx, %esi
	movl	%edi, 36(%rsp)
	testl	%edi, %edi
	jle	.L7105
	imulq	%rdx, %rcx
	movl	%eax, %edx
	decq	%rax
	imulq	%rcx, %rax
	sarl	%edx
	movl	%edx, 20(%rsp)
	movq	%rax, 48(%rsp)
	movq	56(%rsp), %rax
	movslq	%esi, %rdx
	movq	%rcx, (%rsp)
	movq	%rdx, 40(%rsp)
	movq	%rax, 24(%rsp)
	movl	$0, 32(%rsp)
	leaq	288(%rsp), %rbp
	.p2align 4,,10
	.p2align 3
.L7110:
	movl	20(%rsp), %eax
	testl	%eax, %eax
	jle	.L7113
	cmpq	$0, (%rsp)
	je	.L7113
	movq	24(%rsp), %rax
	movl	$0, 16(%rsp)
	movq	%rax, 8(%rsp)
	addq	48(%rsp), %rax
	movq	%rax, %r14
	.p2align 4,,10
	.p2align 3
.L7114:
	movq	8(%rsp), %r13
	movq	(%rsp), %r12
	movq	%r14, %rbx
	.p2align 4,,10
	.p2align 3
.L7112:
	movl	$2048, %r15d
	cmpq	%r15, %r12
	cmovbe	%r12, %r15
	movl	$2048, %ecx
	movq	%r13, %rsi
	movq	%r15, %rdx
	movq	%rbp, %rdi
	call	__memcpy_chk@PLT
	movq	%rbx, %rsi
	movq	%r13, %rdi
	movq	%r15, %rdx
	call	memcpy@PLT
	movq	%rbx, %rdi
	movq	%r15, %rdx
	movq	%rbp, %rsi
	call	memcpy@PLT
	addq	%r15, %r13
	addq	%r15, %rbx
	subq	%r15, %r12
	jne	.L7112
	incl	16(%rsp)
	movq	(%rsp), %rsi
	addq	%rsi, 8(%rsp)
	movl	16(%rsp), %eax
	subq	%rsi, %r14
	cmpl	20(%rsp), %eax
	jne	.L7114
.L7113:
	incl	32(%rsp)
	movq	40(%rsp), %rcx
	addq	%rcx, 24(%rsp)
	movl	32(%rsp), %eax
	cmpl	%eax, 36(%rsp)
	jne	.L7110
	jmp	.L7105
.L7123:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE611:
	.size	stbi_load_gif_from_memory, .-stbi_load_gif_from_memory
	.p2align 4
	.globl	stbi_loadf_from_memory
	.type	stbi_loadf_from_memory, @function
stbi_loadf_from_memory:
.LFB613:
	.cfi_startproc
	endbr64
	subq	$248, %rsp
	.cfi_def_cfa_offset 256
	movslq	%esi, %r10
	movq	%fs:40, %rax
	movq	%rax, 232(%rsp)
	xorl	%eax, %eax
	vmovq	%rdi, %xmm1
	leaq	(%rdi,%r10), %rax
	vpinsrq	$1, %rax, %xmm1, %xmm0
	movq	%rdx, %rsi
	movq	%rsp, %rdi
	movq	%rcx, %rdx
	movq	%r8, %rcx
	movl	%r9d, %r8d
	movq	$0, 16(%rsp)
	movl	$0, 48(%rsp)
	movl	$0, 184(%rsp)
	vmovdqa	%xmm0, 192(%rsp)
	vmovdqa	%xmm0, 208(%rsp)
	call	stbi__loadf_main
	movq	232(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L7127
	addq	$248, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L7127:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE613:
	.size	stbi_loadf_from_memory, .-stbi_loadf_from_memory
	.p2align 4
	.globl	stbi_loadf_from_callbacks
	.type	stbi_loadf_from_callbacks, @function
stbi_loadf_from_callbacks:
.LFB614:
	.cfi_startproc
	endbr64
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	movq	%rdi, %rax
	movq	%rsi, %rdi
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movl	%r9d, %r14d
	movq	%r8, %r13
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	movq	%rcx, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movq	%rdx, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$240, %rsp
	.cfi_def_cfa_offset 288
	vmovdqu	(%rax), %xmm0
	movq	(%rax), %rcx
	movq	16(%rax), %rax
	movq	%fs:40, %rdx
	movq	%rdx, 232(%rsp)
	xorl	%edx, %edx
	leaq	56(%rsp), %rbx
	movq	%rax, 32(%rsp)
	movabsq	$549755813889, %rax
	movq	%rsi, 40(%rsp)
	movq	%rax, 48(%rsp)
	movl	$0, 184(%rsp)
	movq	%rbx, 208(%rsp)
	movq	%rbx, 192(%rsp)
	movl	$128, %edx
	vmovdqa	%xmm0, 16(%rsp)
	movq	%rbx, %rsi
	call	*%rcx
	movq	192(%rsp), %rdx
	subq	208(%rsp), %rdx
	addl	%edx, 184(%rsp)
	testl	%eax, %eax
	jne	.L7129
	movl	$0, 48(%rsp)
	movb	$0, 56(%rsp)
	leaq	57(%rsp), %rax
.L7130:
	movq	%r12, %rdx
	movq	%rsp, %rdi
	movl	%r14d, %r8d
	movq	%r13, %rcx
	movq	%rbp, %rsi
	movq	%rax, 200(%rsp)
	movq	%rbx, 192(%rsp)
	movq	%rax, 216(%rsp)
	call	stbi__loadf_main
	movq	232(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L7133
	addq	$240, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
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
	ret
	.p2align 4,,10
	.p2align 3
.L7129:
	.cfi_restore_state
	cltq
	addq	%rbx, %rax
	jmp	.L7130
.L7133:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE614:
	.size	stbi_loadf_from_callbacks, .-stbi_loadf_from_callbacks
	.p2align 4
	.globl	stbi_loadf
	.type	stbi_loadf, @function
stbi_loadf:
.LFB615:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rcx, %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdx, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rsi, %rbp
	leaq	.LC375(%rip), %rsi
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	%r8d, %ebx
	subq	$248, %rsp
	.cfi_def_cfa_offset 304
	movq	%fs:40, %rax
	movq	%rax, 232(%rsp)
	xorl	%eax, %eax
	call	fopen@PLT
	testq	%rax, %rax
	je	.L7141
	movq	%rax, %r14
	movq	16+stbi__stdio_callbacks(%rip), %rax
	leaq	56(%rsp), %r15
	vmovdqa	stbi__stdio_callbacks(%rip), %xmm0
	movq	%rax, 32(%rsp)
	movl	$128, %edx
	movabsq	$549755813889, %rax
	movq	%r15, %rsi
	movq	%r14, %rdi
	movq	%r14, 40(%rsp)
	movq	%rax, 48(%rsp)
	movl	$0, 184(%rsp)
	movq	%r15, 208(%rsp)
	movq	%r15, 192(%rsp)
	vmovdqa	%xmm0, 16(%rsp)
	call	stbi__stdio_read
	movq	192(%rsp), %rdx
	subq	208(%rsp), %rdx
	addl	%edx, 184(%rsp)
	testl	%eax, %eax
	je	.L7142
	cltq
	addq	%r15, %rax
.L7138:
	movq	%rsp, %rdi
	movq	%r12, %rdx
	movl	%ebx, %r8d
	movq	%r13, %rcx
	movq	%rbp, %rsi
	movq	%rax, 200(%rsp)
	movq	%r15, 192(%rsp)
	movq	%rax, 216(%rsp)
	call	stbi__loadf_main
	movq	%r14, %rdi
	movq	%rax, %r12
	call	fclose@PLT
.L7134:
	movq	232(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L7143
	addq	$248, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	movq	%r12, %rax
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
.L7142:
	.cfi_restore_state
	movl	$0, 48(%rsp)
	movb	$0, 56(%rsp)
	leaq	57(%rsp), %rax
	jmp	.L7138
.L7143:
	call	__stack_chk_fail@PLT
.L7141:
	leaq	.LC376(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%r12d, %r12d
	jmp	.L7134
	.cfi_endproc
.LFE615:
	.size	stbi_loadf, .-stbi_loadf
	.p2align 4
	.globl	stbi_loadf_from_file
	.type	stbi_loadf_from_file, @function
stbi_loadf_from_file:
.LFB616:
	.cfi_startproc
	endbr64
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	movl	%r8d, %r14d
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movq	%rcx, %r13
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	movq	%rdx, %r12
	movl	$128, %edx
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movq	%rsi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$240, %rsp
	.cfi_def_cfa_offset 288
	movq	%fs:40, %rax
	movq	%rax, 232(%rsp)
	xorl	%eax, %eax
	movq	16+stbi__stdio_callbacks(%rip), %rax
	leaq	56(%rsp), %rbx
	vmovdqa	stbi__stdio_callbacks(%rip), %xmm0
	movq	%rax, 32(%rsp)
	movq	%rbx, %rsi
	movabsq	$549755813889, %rax
	movq	%rdi, 40(%rsp)
	movq	%rax, 48(%rsp)
	movl	$0, 184(%rsp)
	movq	%rbx, 208(%rsp)
	movq	%rbx, 192(%rsp)
	vmovdqa	%xmm0, 16(%rsp)
	call	stbi__stdio_read
	movq	192(%rsp), %rdx
	subq	208(%rsp), %rdx
	addl	%edx, 184(%rsp)
	testl	%eax, %eax
	jne	.L7145
	movl	$0, 48(%rsp)
	movb	$0, 56(%rsp)
	leaq	57(%rsp), %rax
.L7146:
	movq	%r12, %rdx
	movq	%rsp, %rdi
	movl	%r14d, %r8d
	movq	%r13, %rcx
	movq	%rbp, %rsi
	movq	%rax, 200(%rsp)
	movq	%rbx, 192(%rsp)
	movq	%rax, 216(%rsp)
	call	stbi__loadf_main
	movq	232(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L7149
	addq	$240, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
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
	ret
	.p2align 4,,10
	.p2align 3
.L7145:
	.cfi_restore_state
	cltq
	addq	%rbx, %rax
	jmp	.L7146
.L7149:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE616:
	.size	stbi_loadf_from_file, .-stbi_loadf_from_file
	.p2align 4
	.globl	stbi_is_hdr_from_memory
	.type	stbi_is_hdr_from_memory, @function
stbi_is_hdr_from_memory:
.LFB617:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	movslq	%esi, %rsi
	addq	%rdi, %rsi
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	leaq	1+.LC219(%rip), %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movl	$35, %ebx
	subq	$248, %rsp
	.cfi_def_cfa_offset 288
	movq	%fs:40, %rax
	movq	%rax, 232(%rsp)
	xorl	%eax, %eax
	leaq	56(%rsp), %r13
	movq	$0, 16(%rsp)
	movl	$0, 48(%rsp)
	movl	$0, 184(%rsp)
	movq	%rdi, 208(%rsp)
	movq	%rdi, 192(%rsp)
	movq	%rsi, 216(%rsp)
	movq	%rsi, 200(%rsp)
	leaq	57(%rsp), %r12
	jmp	.L7156
	.p2align 4,,10
	.p2align 3
.L7151:
	movl	48(%rsp), %eax
	testl	%eax, %eax
	jne	.L7175
.L7152:
	cmpl	%eax, %ebx
	jne	.L7155
.L7176:
	movsbl	0(%rbp), %ebx
	incq	%rbp
	testb	%bl, %bl
	je	.L7163
.L7156:
	cmpq	%rsi, %rdi
	jnb	.L7151
	leaq	1(%rdi), %rdx
	movq	%rdx, 192(%rsp)
	movzbl	(%rdi), %eax
	movq	%rdx, %rdi
	cmpl	%eax, %ebx
	je	.L7176
.L7155:
	vmovdqa	208(%rsp), %xmm0
	leaq	1+.LC220(%rip), %rbp
	vpextrq	$1, %xmm0, %rcx
	vmovq	%xmm0, %rdx
	vmovdqa	%xmm0, 192(%rsp)
	movl	$35, %ebx
	leaq	56(%rsp), %r13
	leaq	57(%rsp), %r12
	jmp	.L7162
	.p2align 4,,10
	.p2align 3
.L7158:
	movl	48(%rsp), %eax
	testl	%eax, %eax
	jne	.L7177
.L7159:
	cmpl	%ebx, %eax
	jne	.L7165
.L7178:
	movsbl	0(%rbp), %ebx
	incq	%rbp
	testb	%bl, %bl
	je	.L7163
.L7162:
	cmpq	%rdx, %rcx
	jbe	.L7158
	leaq	1(%rdx), %rsi
	movq	%rsi, 192(%rsp)
	movzbl	(%rdx), %eax
	movq	%rsi, %rdx
	cmpl	%ebx, %eax
	je	.L7178
.L7165:
	xorl	%eax, %eax
	jmp	.L7150
	.p2align 4,,10
	.p2align 3
.L7175:
	movl	52(%rsp), %edx
	movq	40(%rsp), %rdi
	movq	%r13, %rsi
	call	*16(%rsp)
	movq	192(%rsp), %rdx
	subq	208(%rsp), %rdx
	addl	%edx, 184(%rsp)
	testl	%eax, %eax
	jne	.L7153
	movl	$0, 48(%rsp)
	movb	$0, 56(%rsp)
	movq	%r12, %rsi
.L7154:
	movq	%rsi, 200(%rsp)
	movq	%r12, 192(%rsp)
	movq	%r12, %rdi
	jmp	.L7152
	.p2align 4,,10
	.p2align 3
.L7163:
	movl	$1, %eax
.L7150:
	movq	232(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L7179
	addq	$248, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
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
.L7153:
	.cfi_restore_state
	cltq
	leaq	0(%r13,%rax), %rsi
	movzbl	56(%rsp), %eax
	jmp	.L7154
	.p2align 4,,10
	.p2align 3
.L7177:
	movl	52(%rsp), %edx
	movq	40(%rsp), %rdi
	movq	%r13, %rsi
	call	*16(%rsp)
	movq	192(%rsp), %rdx
	subq	208(%rsp), %rdx
	addl	%edx, 184(%rsp)
	testl	%eax, %eax
	je	.L7180
	cltq
	leaq	0(%r13,%rax), %rcx
	movzbl	56(%rsp), %eax
.L7161:
	movq	%rcx, 200(%rsp)
	movq	%r12, 192(%rsp)
	movq	%r12, %rdx
	jmp	.L7159
	.p2align 4,,10
	.p2align 3
.L7180:
	movl	$0, 48(%rsp)
	movb	$0, 56(%rsp)
	movq	%r12, %rcx
	jmp	.L7161
.L7179:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE617:
	.size	stbi_is_hdr_from_memory, .-stbi_is_hdr_from_memory
	.p2align 4
	.globl	stbi_is_hdr
	.type	stbi_is_hdr, @function
stbi_is_hdr:
.LFB618:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	leaq	.LC375(%rip), %rsi
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
	subq	$248, %rsp
	.cfi_def_cfa_offset 304
	movq	%fs:40, %rax
	movq	%rax, 232(%rsp)
	xorl	%eax, %eax
	call	fopen@PLT
	testq	%rax, %rax
	je	.L7199
	movq	%rax, %rdi
	movq	%rax, %rbp
	call	ftell@PLT
	movq	%rax, %r12
	movq	16+stbi__stdio_callbacks(%rip), %rax
	leaq	56(%rsp), %r14
	vmovdqa	stbi__stdio_callbacks(%rip), %xmm1
	movq	%rax, 32(%rsp)
	movl	$128, %edx
	movabsq	$549755813889, %rax
	movq	%r14, %rsi
	movq	%rbp, %rdi
	movq	%rbp, 40(%rsp)
	movq	%rax, 48(%rsp)
	movl	$0, 184(%rsp)
	movq	%r14, 208(%rsp)
	movq	%r14, 192(%rsp)
	vmovdqa	%xmm1, 16(%rsp)
	call	stbi__stdio_read
	movq	192(%rsp), %rdx
	subq	208(%rsp), %rdx
	addl	%edx, 184(%rsp)
	testl	%eax, %eax
	je	.L7210
	cltq
	leaq	(%r14,%rax), %rcx
.L7184:
	movq	%r14, 192(%rsp)
	leaq	56(%rsp), %r14
	movq	%rcx, 200(%rsp)
	movq	%rcx, 216(%rsp)
	leaq	1+.LC219(%rip), %r13
	movq	%r14, %rdx
	movl	$35, %ebx
	leaq	57(%rsp), %r15
	jmp	.L7190
	.p2align 4,,10
	.p2align 3
.L7185:
	movl	48(%rsp), %eax
	testl	%eax, %eax
	jne	.L7211
.L7186:
	cmpl	%eax, %ebx
	jne	.L7189
.L7213:
	movsbl	0(%r13), %ebx
	incq	%r13
	testb	%bl, %bl
	je	.L7212
.L7190:
	cmpq	%rdx, %rcx
	jbe	.L7185
	leaq	1(%rdx), %rsi
	movq	%rsi, 192(%rsp)
	movzbl	(%rdx), %eax
	movq	%rsi, %rdx
	cmpl	%eax, %ebx
	je	.L7213
.L7189:
	vmovdqa	208(%rsp), %xmm0
	leaq	1+.LC220(%rip), %r13
	vpextrq	$1, %xmm0, %rdx
	vmovq	%xmm0, %rax
	vmovdqa	%xmm0, 192(%rsp)
	movl	$35, %ebx
	leaq	57(%rsp), %r15
	jmp	.L7197
	.p2align 4,,10
	.p2align 3
.L7192:
	movl	48(%rsp), %eax
	testl	%eax, %eax
	jne	.L7214
.L7193:
	cmpl	%ebx, %eax
	jne	.L7200
.L7215:
	movsbl	0(%r13), %ebx
	incq	%r13
	testb	%bl, %bl
	je	.L7201
	movq	192(%rsp), %rax
	movq	200(%rsp), %rdx
.L7197:
	cmpq	%rdx, %rax
	jnb	.L7192
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rsp)
	movzbl	(%rax), %eax
	cmpl	%ebx, %eax
	je	.L7215
.L7200:
	xorl	%r13d, %r13d
.L7196:
	movq	208(%rsp), %rax
	movq	%rax, 192(%rsp)
	movq	216(%rsp), %rax
	jmp	.L7191
	.p2align 4,,10
	.p2align 3
.L7210:
	movl	$0, 48(%rsp)
	movb	$0, 56(%rsp)
	leaq	57(%rsp), %rcx
	jmp	.L7184
	.p2align 4,,10
	.p2align 3
.L7211:
	movl	52(%rsp), %edx
	movq	40(%rsp), %rdi
	movq	%r14, %rsi
	call	*16(%rsp)
	movq	192(%rsp), %rdx
	subq	208(%rsp), %rdx
	addl	%edx, 184(%rsp)
	testl	%eax, %eax
	jne	.L7187
	movl	$0, 48(%rsp)
	movb	$0, 56(%rsp)
	movq	%r15, %rcx
.L7188:
	movq	%rcx, 200(%rsp)
	movq	%r15, 192(%rsp)
	movq	%r15, %rdx
	jmp	.L7186
	.p2align 4,,10
	.p2align 3
.L7187:
	cltq
	leaq	(%r14,%rax), %rcx
	movzbl	56(%rsp), %eax
	jmp	.L7188
	.p2align 4,,10
	.p2align 3
.L7212:
	movq	208(%rsp), %rax
	movl	$1, %r13d
	movq	%rax, 192(%rsp)
	movq	216(%rsp), %rax
.L7191:
	movq	%rbp, %rdi
	xorl	%edx, %edx
	movq	%r12, %rsi
	movq	%rax, 200(%rsp)
	call	fseek@PLT
	movq	%rbp, %rdi
	call	fclose@PLT
.L7181:
	movq	232(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L7216
	addq	$248, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	movl	%r13d, %eax
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L7214:
	.cfi_restore_state
	movl	52(%rsp), %edx
	movq	40(%rsp), %rdi
	movq	%r14, %rsi
	call	*16(%rsp)
	movq	192(%rsp), %rdx
	subq	208(%rsp), %rdx
	addl	%edx, 184(%rsp)
	testl	%eax, %eax
	je	.L7217
	cltq
	leaq	(%r14,%rax), %rdx
	movzbl	56(%rsp), %eax
.L7195:
	movq	%rdx, 200(%rsp)
	movq	%r15, 192(%rsp)
	jmp	.L7193
	.p2align 4,,10
	.p2align 3
.L7217:
	movl	$0, 48(%rsp)
	movb	$0, 56(%rsp)
	movq	%r15, %rdx
	jmp	.L7195
	.p2align 4,,10
	.p2align 3
.L7201:
	movl	$1, %r13d
	jmp	.L7196
.L7216:
	call	__stack_chk_fail@PLT
.L7199:
	xorl	%r13d, %r13d
	jmp	.L7181
	.cfi_endproc
.LFE618:
	.size	stbi_is_hdr, .-stbi_is_hdr
	.p2align 4
	.globl	stbi_is_hdr_from_file
	.type	stbi_is_hdr_from_file, @function
stbi_is_hdr_from_file:
.LFB619:
	.cfi_startproc
	endbr64
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
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$248, %rsp
	.cfi_def_cfa_offset 304
	movq	%fs:40, %rax
	movq	%rax, 232(%rsp)
	xorl	%eax, %eax
	call	ftell@PLT
	movq	%rax, %r12
	movq	16+stbi__stdio_callbacks(%rip), %rax
	leaq	56(%rsp), %r14
	vmovdqa	stbi__stdio_callbacks(%rip), %xmm1
	movq	%rax, 32(%rsp)
	movl	$128, %edx
	movabsq	$549755813889, %rax
	movq	%r14, %rsi
	movq	%rbp, %rdi
	movq	%rbp, 40(%rsp)
	movq	%rax, 48(%rsp)
	movl	$0, 184(%rsp)
	movq	%r14, 208(%rsp)
	movq	%r14, 192(%rsp)
	vmovdqa	%xmm1, 16(%rsp)
	call	stbi__stdio_read
	movq	192(%rsp), %rdx
	subq	208(%rsp), %rdx
	addl	%edx, 184(%rsp)
	testl	%eax, %eax
	jne	.L7219
	movl	$0, 48(%rsp)
	movb	$0, 56(%rsp)
	leaq	57(%rsp), %rcx
.L7220:
	movq	%r14, 192(%rsp)
	leaq	56(%rsp), %r14
	movq	%rcx, 200(%rsp)
	movq	%rcx, 216(%rsp)
	leaq	1+.LC219(%rip), %r13
	movq	%r14, %rdx
	movl	$35, %ebx
	leaq	57(%rsp), %r15
	jmp	.L7226
	.p2align 4,,10
	.p2align 3
.L7221:
	movl	48(%rsp), %eax
	testl	%eax, %eax
	jne	.L7245
.L7222:
	cmpl	%eax, %ebx
	jne	.L7225
.L7247:
	movsbl	0(%r13), %ebx
	incq	%r13
	testb	%bl, %bl
	je	.L7246
.L7226:
	cmpq	%rdx, %rcx
	jbe	.L7221
	leaq	1(%rdx), %rsi
	movq	%rsi, 192(%rsp)
	movzbl	(%rdx), %eax
	movq	%rsi, %rdx
	cmpl	%eax, %ebx
	je	.L7247
.L7225:
	vmovdqa	208(%rsp), %xmm0
	leaq	1+.LC220(%rip), %r13
	vpextrq	$1, %xmm0, %rdx
	vmovq	%xmm0, %rax
	vmovdqa	%xmm0, 192(%rsp)
	movl	$35, %ebx
	leaq	57(%rsp), %r15
	jmp	.L7233
	.p2align 4,,10
	.p2align 3
.L7228:
	movl	48(%rsp), %eax
	testl	%eax, %eax
	jne	.L7248
.L7229:
	cmpl	%ebx, %eax
	jne	.L7235
.L7249:
	movsbl	0(%r13), %ebx
	incq	%r13
	testb	%bl, %bl
	je	.L7236
	movq	192(%rsp), %rax
	movq	200(%rsp), %rdx
.L7233:
	cmpq	%rdx, %rax
	jnb	.L7228
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rsp)
	movzbl	(%rax), %eax
	cmpl	%ebx, %eax
	je	.L7249
.L7235:
	xorl	%r13d, %r13d
.L7232:
	movq	208(%rsp), %rax
	movq	%rax, 192(%rsp)
	movq	216(%rsp), %rax
	jmp	.L7227
	.p2align 4,,10
	.p2align 3
.L7245:
	movl	52(%rsp), %edx
	movq	40(%rsp), %rdi
	movq	%r14, %rsi
	call	*16(%rsp)
	movq	192(%rsp), %rdx
	subq	208(%rsp), %rdx
	addl	%edx, 184(%rsp)
	testl	%eax, %eax
	jne	.L7223
	movl	$0, 48(%rsp)
	movb	$0, 56(%rsp)
	movq	%r15, %rcx
.L7224:
	movq	%rcx, 200(%rsp)
	movq	%r15, 192(%rsp)
	movq	%r15, %rdx
	jmp	.L7222
	.p2align 4,,10
	.p2align 3
.L7223:
	cltq
	leaq	(%r14,%rax), %rcx
	movzbl	56(%rsp), %eax
	jmp	.L7224
	.p2align 4,,10
	.p2align 3
.L7246:
	movq	208(%rsp), %rax
	movl	$1, %r13d
	movq	%rax, 192(%rsp)
	movq	216(%rsp), %rax
.L7227:
	xorl	%edx, %edx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	movq	%rax, 200(%rsp)
	call	fseek@PLT
	movq	232(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L7250
	addq	$248, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	movl	%r13d, %eax
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L7219:
	.cfi_restore_state
	cltq
	leaq	(%r14,%rax), %rcx
	jmp	.L7220
	.p2align 4,,10
	.p2align 3
.L7248:
	movl	52(%rsp), %edx
	movq	40(%rsp), %rdi
	movq	%r14, %rsi
	call	*16(%rsp)
	movq	192(%rsp), %rdx
	subq	208(%rsp), %rdx
	addl	%edx, 184(%rsp)
	testl	%eax, %eax
	je	.L7251
	cltq
	leaq	(%r14,%rax), %rdx
	movzbl	56(%rsp), %eax
.L7231:
	movq	%rdx, 200(%rsp)
	movq	%r15, 192(%rsp)
	jmp	.L7229
	.p2align 4,,10
	.p2align 3
.L7251:
	movl	$0, 48(%rsp)
	movb	$0, 56(%rsp)
	movq	%r15, %rdx
	jmp	.L7231
	.p2align 4,,10
	.p2align 3
.L7236:
	movl	$1, %r13d
	jmp	.L7232
.L7250:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE619:
	.size	stbi_is_hdr_from_file, .-stbi_is_hdr_from_file
	.p2align 4
	.globl	stbi_is_hdr_from_callbacks
	.type	stbi_is_hdr_from_callbacks, @function
stbi_is_hdr_from_callbacks:
.LFB620:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	movq	%rdi, %rax
	movq	%rsi, %rdi
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$248, %rsp
	.cfi_def_cfa_offset 288
	vmovdqu	(%rax), %xmm1
	movq	(%rax), %rcx
	movq	16(%rax), %rax
	movq	%fs:40, %rdx
	movq	%rdx, 232(%rsp)
	xorl	%edx, %edx
	leaq	56(%rsp), %r12
	movq	%rax, 32(%rsp)
	movabsq	$549755813889, %rax
	movq	%rsi, 40(%rsp)
	movq	%rax, 48(%rsp)
	movl	$0, 184(%rsp)
	movq	%r12, 208(%rsp)
	movq	%r12, 192(%rsp)
	movl	$128, %edx
	vmovdqa	%xmm1, 16(%rsp)
	movq	%r12, %rsi
	call	*%rcx
	movq	192(%rsp), %rdx
	subq	208(%rsp), %rdx
	addl	%edx, 184(%rsp)
	testl	%eax, %eax
	jne	.L7253
	movl	$0, 48(%rsp)
	movb	$0, 56(%rsp)
	leaq	57(%rsp), %rcx
.L7254:
	movq	%r12, 192(%rsp)
	leaq	56(%rsp), %r12
	movq	%rcx, 200(%rsp)
	movq	%rcx, 216(%rsp)
	leaq	1+.LC219(%rip), %rbp
	movq	%r12, %rdx
	movl	$35, %ebx
	leaq	57(%rsp), %r13
	jmp	.L7260
	.p2align 4,,10
	.p2align 3
.L7255:
	movl	48(%rsp), %eax
	testl	%eax, %eax
	jne	.L7279
.L7256:
	cmpl	%eax, %ebx
	jne	.L7259
.L7280:
	movsbl	0(%rbp), %ebx
	incq	%rbp
	testb	%bl, %bl
	je	.L7267
.L7260:
	cmpq	%rdx, %rcx
	jbe	.L7255
	leaq	1(%rdx), %rsi
	movq	%rsi, 192(%rsp)
	movzbl	(%rdx), %eax
	movq	%rsi, %rdx
	cmpl	%eax, %ebx
	je	.L7280
.L7259:
	vmovdqa	208(%rsp), %xmm0
	leaq	1+.LC220(%rip), %rbp
	vpextrq	$1, %xmm0, %rcx
	vmovq	%xmm0, %rdx
	vmovdqa	%xmm0, 192(%rsp)
	movl	$35, %ebx
	leaq	57(%rsp), %r13
	jmp	.L7266
	.p2align 4,,10
	.p2align 3
.L7262:
	movl	48(%rsp), %eax
	testl	%eax, %eax
	jne	.L7281
.L7263:
	cmpl	%ebx, %eax
	jne	.L7269
.L7282:
	movsbl	0(%rbp), %ebx
	incq	%rbp
	testb	%bl, %bl
	je	.L7267
.L7266:
	cmpq	%rcx, %rdx
	jnb	.L7262
	leaq	1(%rdx), %rsi
	movq	%rsi, 192(%rsp)
	movzbl	(%rdx), %eax
	movq	%rsi, %rdx
	cmpl	%ebx, %eax
	je	.L7282
.L7269:
	xorl	%eax, %eax
	jmp	.L7252
	.p2align 4,,10
	.p2align 3
.L7279:
	movl	52(%rsp), %edx
	movq	40(%rsp), %rdi
	movq	%r12, %rsi
	call	*16(%rsp)
	movq	192(%rsp), %rdx
	subq	208(%rsp), %rdx
	addl	%edx, 184(%rsp)
	testl	%eax, %eax
	jne	.L7257
	movl	$0, 48(%rsp)
	movb	$0, 56(%rsp)
	movq	%r13, %rcx
.L7258:
	movq	%rcx, 200(%rsp)
	movq	%r13, 192(%rsp)
	movq	%r13, %rdx
	jmp	.L7256
	.p2align 4,,10
	.p2align 3
.L7267:
	movl	$1, %eax
.L7252:
	movq	232(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L7283
	addq	$248, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
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
.L7257:
	.cfi_restore_state
	cltq
	leaq	(%r12,%rax), %rcx
	movzbl	56(%rsp), %eax
	jmp	.L7258
	.p2align 4,,10
	.p2align 3
.L7253:
	cltq
	leaq	(%r12,%rax), %rcx
	jmp	.L7254
	.p2align 4,,10
	.p2align 3
.L7281:
	movl	52(%rsp), %edx
	movq	40(%rsp), %rdi
	movq	%r12, %rsi
	call	*16(%rsp)
	movq	192(%rsp), %rdx
	subq	208(%rsp), %rdx
	addl	%edx, 184(%rsp)
	testl	%eax, %eax
	je	.L7284
	cltq
	leaq	(%r12,%rax), %rcx
	movzbl	56(%rsp), %eax
.L7265:
	movq	%rcx, 200(%rsp)
	movq	%r13, 192(%rsp)
	movq	%r13, %rdx
	jmp	.L7263
	.p2align 4,,10
	.p2align 3
.L7284:
	movl	$0, 48(%rsp)
	movb	$0, 56(%rsp)
	movq	%r13, %rcx
	jmp	.L7265
.L7283:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE620:
	.size	stbi_is_hdr_from_callbacks, .-stbi_is_hdr_from_callbacks
	.p2align 4
	.globl	stbi_ldr_to_hdr_gamma
	.type	stbi_ldr_to_hdr_gamma, @function
stbi_ldr_to_hdr_gamma:
.LFB621:
	.cfi_startproc
	endbr64
	vmovss	%xmm0, stbi__l2h_gamma(%rip)
	ret
	.cfi_endproc
.LFE621:
	.size	stbi_ldr_to_hdr_gamma, .-stbi_ldr_to_hdr_gamma
	.p2align 4
	.globl	stbi_ldr_to_hdr_scale
	.type	stbi_ldr_to_hdr_scale, @function
stbi_ldr_to_hdr_scale:
.LFB622:
	.cfi_startproc
	endbr64
	vmovss	%xmm0, stbi__l2h_scale(%rip)
	ret
	.cfi_endproc
.LFE622:
	.size	stbi_ldr_to_hdr_scale, .-stbi_ldr_to_hdr_scale
	.p2align 4
	.globl	stbi_hdr_to_ldr_gamma
	.type	stbi_hdr_to_ldr_gamma, @function
stbi_hdr_to_ldr_gamma:
.LFB623:
	.cfi_startproc
	endbr64
	vmovss	.LC115(%rip), %xmm1
	vdivss	%xmm0, %xmm1, %xmm0
	vmovss	%xmm0, stbi__h2l_gamma_i(%rip)
	ret
	.cfi_endproc
.LFE623:
	.size	stbi_hdr_to_ldr_gamma, .-stbi_hdr_to_ldr_gamma
	.p2align 4
	.globl	stbi_hdr_to_ldr_scale
	.type	stbi_hdr_to_ldr_scale, @function
stbi_hdr_to_ldr_scale:
.LFB624:
	.cfi_startproc
	endbr64
	vmovss	.LC115(%rip), %xmm1
	vdivss	%xmm0, %xmm1, %xmm0
	vmovss	%xmm0, stbi__h2l_scale_i(%rip)
	ret
	.cfi_endproc
.LFE624:
	.size	stbi_hdr_to_ldr_scale, .-stbi_hdr_to_ldr_scale
	.p2align 4
	.globl	stbi_zlib_decode_malloc_guesssize
	.type	stbi_zlib_decode_malloc_guesssize, @function
stbi_zlib_decode_malloc_guesssize:
.LFB696:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$4096, %rsp
	.cfi_def_cfa_offset 4136
	orq	$0, (%rsp)
	subq	$24, %rsp
	.cfi_def_cfa_offset 4160
	movslq	%edx, %r13
	movq	%rdi, %r12
	movq	%r13, %rdi
	movq	%fs:40, %rax
	movq	%rax, 4104(%rsp)
	xorl	%eax, %eax
	movslq	%esi, %rbx
	movq	%rcx, %rbp
	call	malloc@PLT
	testq	%rax, %rax
	je	.L7289
	vmovq	%rax, %xmm2
	addq	%r12, %rbx
	vmovq	%r12, %xmm3
	addq	%r13, %rax
	vpunpcklqdq	%xmm2, %xmm2, %xmm1
	vpinsrq	$1, %rbx, %xmm3, %xmm0
	movq	%rsp, %rdi
	movl	$1, %esi
	movq	%rax, 40(%rsp)
	movl	$1, 48(%rsp)
	vmovdqa	%xmm0, (%rsp)
	vmovdqu	%xmm1, 24(%rsp)
	call	stbi__parse_zlib
	testl	%eax, %eax
	je	.L7291
	movq	32(%rsp), %rax
	testq	%rbp, %rbp
	je	.L7289
	movq	24(%rsp), %rdx
	subq	%rax, %rdx
	movl	%edx, 0(%rbp)
.L7289:
	movq	4104(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L7301
	addq	$4120, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
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
.L7291:
	.cfi_restore_state
	movq	32(%rsp), %rdi
	call	free@PLT
	xorl	%eax, %eax
	jmp	.L7289
.L7301:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE696:
	.size	stbi_zlib_decode_malloc_guesssize, .-stbi_zlib_decode_malloc_guesssize
	.p2align 4
	.globl	stbi_zlib_decode_malloc
	.type	stbi_zlib_decode_malloc, @function
stbi_zlib_decode_malloc:
.LFB697:
	.cfi_startproc
	endbr64
	movq	%rdx, %rcx
	movl	$16384, %edx
	jmp	stbi_zlib_decode_malloc_guesssize
	.cfi_endproc
.LFE697:
	.size	stbi_zlib_decode_malloc, .-stbi_zlib_decode_malloc
	.p2align 4
	.globl	stbi_zlib_decode_malloc_guesssize_headerflag
	.type	stbi_zlib_decode_malloc_guesssize_headerflag, @function
stbi_zlib_decode_malloc_guesssize_headerflag:
.LFB698:
	.cfi_startproc
	endbr64
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
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
	subq	$4096, %rsp
	.cfi_def_cfa_offset 4144
	orq	$0, (%rsp)
	subq	$16, %rsp
	.cfi_def_cfa_offset 4160
	movslq	%edx, %r13
	movq	%rdi, %r12
	movq	%r13, %rdi
	movq	%fs:40, %rax
	movq	%rax, 4104(%rsp)
	xorl	%eax, %eax
	movslq	%esi, %rbx
	movq	%rcx, %rbp
	movl	%r8d, %r14d
	call	malloc@PLT
	testq	%rax, %rax
	je	.L7303
	vmovq	%rax, %xmm2
	addq	%r12, %rbx
	vmovq	%r12, %xmm3
	addq	%r13, %rax
	vpunpcklqdq	%xmm2, %xmm2, %xmm1
	vpinsrq	$1, %rbx, %xmm3, %xmm0
	movq	%rsp, %rdi
	movl	%r14d, %esi
	movq	%rax, 40(%rsp)
	movl	$1, 48(%rsp)
	vmovdqa	%xmm0, (%rsp)
	vmovdqu	%xmm1, 24(%rsp)
	call	stbi__parse_zlib
	testl	%eax, %eax
	je	.L7305
	movq	32(%rsp), %rax
	testq	%rbp, %rbp
	je	.L7303
	movq	24(%rsp), %rdx
	subq	%rax, %rdx
	movl	%edx, 0(%rbp)
.L7303:
	movq	4104(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L7315
	addq	$4112, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
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
	ret
	.p2align 4,,10
	.p2align 3
.L7305:
	.cfi_restore_state
	movq	32(%rsp), %rdi
	call	free@PLT
	xorl	%eax, %eax
	jmp	.L7303
.L7315:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE698:
	.size	stbi_zlib_decode_malloc_guesssize_headerflag, .-stbi_zlib_decode_malloc_guesssize_headerflag
	.p2align 4
	.globl	stbi_zlib_decode_buffer
	.type	stbi_zlib_decode_buffer, @function
stbi_zlib_decode_buffer:
.LFB699:
	.cfi_startproc
	endbr64
	subq	$4096, %rsp
	.cfi_def_cfa_offset 4104
	orq	$0, (%rsp)
	subq	$24, %rsp
	.cfi_def_cfa_offset 4128
	movslq	%ecx, %rcx
	movq	%fs:40, %rax
	movq	%rax, 4104(%rsp)
	xorl	%eax, %eax
	movslq	%esi, %rsi
	leaq	(%rdx,%rcx), %rax
	vmovq	%rdx, %xmm1
	vpinsrq	$1, %rax, %xmm1, %xmm0
	vmovq	%rdi, %xmm2
	addq	%rsi, %rdi
	movq	%rdi, 40(%rsp)
	vmovdqa	%xmm0, (%rsp)
	movq	%rsp, %rdi
	vpunpcklqdq	%xmm2, %xmm2, %xmm0
	movl	$1, %esi
	movl	$0, 48(%rsp)
	vmovdqu	%xmm0, 24(%rsp)
	call	stbi__parse_zlib
	testl	%eax, %eax
	je	.L7319
	movq	24(%rsp), %rax
	subl	32(%rsp), %eax
.L7316:
	movq	4104(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L7321
	addq	$4120, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L7319:
	.cfi_restore_state
	movl	$-1, %eax
	jmp	.L7316
.L7321:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE699:
	.size	stbi_zlib_decode_buffer, .-stbi_zlib_decode_buffer
	.p2align 4
	.globl	stbi_zlib_decode_noheader_malloc
	.type	stbi_zlib_decode_noheader_malloc, @function
stbi_zlib_decode_noheader_malloc:
.LFB700:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	subq	$4096, %rsp
	.cfi_def_cfa_offset 4128
	orq	$0, (%rsp)
	subq	$16, %rsp
	.cfi_def_cfa_offset 4144
	movq	%rdi, %rbp
	movl	$16384, %edi
	movq	%fs:40, %rax
	movq	%rax, 4104(%rsp)
	xorl	%eax, %eax
	movl	%esi, %r12d
	movq	%rdx, %rbx
	call	malloc@PLT
	testq	%rax, %rax
	je	.L7322
	movslq	%r12d, %rdx
	vmovq	%rax, %xmm2
	addq	%rbp, %rdx
	vmovq	%rbp, %xmm3
	addq	$16384, %rax
	vpunpcklqdq	%xmm2, %xmm2, %xmm1
	vpinsrq	$1, %rdx, %xmm3, %xmm0
	xorl	%esi, %esi
	movq	%rsp, %rdi
	movq	%rax, 40(%rsp)
	movl	$1, 48(%rsp)
	vmovdqa	%xmm0, (%rsp)
	vmovdqu	%xmm1, 24(%rsp)
	call	stbi__parse_zlib
	testl	%eax, %eax
	je	.L7324
	movq	32(%rsp), %rax
	testq	%rbx, %rbx
	je	.L7322
	movq	24(%rsp), %rdx
	subq	%rax, %rdx
	movl	%edx, (%rbx)
.L7322:
	movq	4104(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L7334
	addq	$4112, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L7324:
	.cfi_restore_state
	movq	32(%rsp), %rdi
	call	free@PLT
	xorl	%eax, %eax
	jmp	.L7322
.L7334:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE700:
	.size	stbi_zlib_decode_noheader_malloc, .-stbi_zlib_decode_noheader_malloc
	.p2align 4
	.globl	stbi_zlib_decode_noheader_buffer
	.type	stbi_zlib_decode_noheader_buffer, @function
stbi_zlib_decode_noheader_buffer:
.LFB701:
	.cfi_startproc
	endbr64
	subq	$4096, %rsp
	.cfi_def_cfa_offset 4104
	orq	$0, (%rsp)
	subq	$24, %rsp
	.cfi_def_cfa_offset 4128
	movslq	%ecx, %rcx
	movq	%fs:40, %rax
	movq	%rax, 4104(%rsp)
	xorl	%eax, %eax
	movslq	%esi, %rsi
	leaq	(%rdx,%rcx), %rax
	vmovq	%rdx, %xmm1
	vpinsrq	$1, %rax, %xmm1, %xmm0
	vmovq	%rdi, %xmm2
	addq	%rsi, %rdi
	movq	%rdi, 40(%rsp)
	vmovdqa	%xmm0, (%rsp)
	xorl	%esi, %esi
	vpunpcklqdq	%xmm2, %xmm2, %xmm0
	movq	%rsp, %rdi
	movl	$0, 48(%rsp)
	vmovdqu	%xmm0, 24(%rsp)
	call	stbi__parse_zlib
	testl	%eax, %eax
	je	.L7338
	movq	24(%rsp), %rax
	subl	32(%rsp), %eax
.L7335:
	movq	4104(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L7340
	addq	$4120, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L7338:
	.cfi_restore_state
	movl	$-1, %eax
	jmp	.L7335
.L7340:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE701:
	.size	stbi_zlib_decode_noheader_buffer, .-stbi_zlib_decode_noheader_buffer
	.p2align 4
	.globl	stbi_set_unpremultiply_on_load
	.type	stbi_set_unpremultiply_on_load, @function
stbi_set_unpremultiply_on_load:
.LFB710:
	.cfi_startproc
	endbr64
	movl	%edi, stbi__unpremultiply_on_load_global(%rip)
	ret
	.cfi_endproc
.LFE710:
	.size	stbi_set_unpremultiply_on_load, .-stbi_set_unpremultiply_on_load
	.p2align 4
	.globl	stbi_convert_iphone_png_to_rgb
	.type	stbi_convert_iphone_png_to_rgb, @function
stbi_convert_iphone_png_to_rgb:
.LFB711:
	.cfi_startproc
	endbr64
	movl	%edi, stbi__de_iphone_flag_global(%rip)
	ret
	.cfi_endproc
.LFE711:
	.size	stbi_convert_iphone_png_to_rgb, .-stbi_convert_iphone_png_to_rgb
	.p2align 4
	.globl	stbi__unpremultiply_on_load_thread
	.type	stbi__unpremultiply_on_load_thread, @function
stbi__unpremultiply_on_load_thread:
.LFB712:
	.cfi_startproc
	endbr64
	movl	%edi, %fs:stbi__unpremultiply_on_load_local@tpoff
	movl	$1, %fs:stbi__unpremultiply_on_load_set@tpoff
	ret
	.cfi_endproc
.LFE712:
	.size	stbi__unpremultiply_on_load_thread, .-stbi__unpremultiply_on_load_thread
	.p2align 4
	.globl	stbi_convert_iphone_png_to_rgb_thread
	.type	stbi_convert_iphone_png_to_rgb_thread, @function
stbi_convert_iphone_png_to_rgb_thread:
.LFB713:
	.cfi_startproc
	endbr64
	movl	%edi, %fs:stbi__de_iphone_flag_local@tpoff
	movl	$1, %fs:stbi__de_iphone_flag_set@tpoff
	ret
	.cfi_endproc
.LFE713:
	.size	stbi_convert_iphone_png_to_rgb_thread, .-stbi_convert_iphone_png_to_rgb_thread
	.p2align 4
	.globl	stbi_info
	.type	stbi_info, @function
stbi_info:
.LFB777:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rcx, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rdx, %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rsi, %r12
	leaq	.LC375(%rip), %rsi
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$248, %rsp
	.cfi_def_cfa_offset 304
	movq	%fs:40, %rax
	movq	%rax, 232(%rsp)
	xorl	%eax, %eax
	call	fopen@PLT
	testq	%rax, %rax
	je	.L7352
	movq	%rax, %rdi
	movq	%rax, %rbp
	call	ftell@PLT
	movq	%rax, %r15
	movq	16+stbi__stdio_callbacks(%rip), %rax
	leaq	56(%rsp), %rbx
	vmovdqa	stbi__stdio_callbacks(%rip), %xmm0
	movq	%rax, 32(%rsp)
	movl	$128, %edx
	movabsq	$549755813889, %rax
	movq	%rbx, %rsi
	movq	%rbp, %rdi
	movq	%rbp, 40(%rsp)
	movq	%rax, 48(%rsp)
	movl	$0, 184(%rsp)
	movq	%rbx, 208(%rsp)
	movq	%rbx, 192(%rsp)
	vmovdqa	%xmm0, 16(%rsp)
	call	stbi__stdio_read
	movq	192(%rsp), %rdx
	subq	208(%rsp), %rdx
	addl	%edx, 184(%rsp)
	testl	%eax, %eax
	je	.L7353
	cltq
	addq	%rbx, %rax
.L7349:
	movq	%r12, %rsi
	movq	%rsp, %rdi
	movq	%r14, %rcx
	movq	%r13, %rdx
	movq	%rax, 200(%rsp)
	movq	%rbx, 192(%rsp)
	movq	%rax, 216(%rsp)
	call	stbi__info_main
	movq	%rbp, %rdi
	xorl	%edx, %edx
	movq	%r15, %rsi
	movl	%eax, %r12d
	call	fseek@PLT
	movq	%rbp, %rdi
	call	fclose@PLT
.L7345:
	movq	232(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L7354
	addq	$248, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	movl	%r12d, %eax
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
.L7353:
	.cfi_restore_state
	movl	$0, 48(%rsp)
	movb	$0, 56(%rsp)
	leaq	57(%rsp), %rax
	jmp	.L7349
.L7354:
	call	__stack_chk_fail@PLT
.L7352:
	leaq	.LC376(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%r12d, %r12d
	jmp	.L7345
	.cfi_endproc
.LFE777:
	.size	stbi_info, .-stbi_info
	.p2align 4
	.globl	stbi_info_from_file
	.type	stbi_info_from_file, @function
stbi_info_from_file:
.LFB778:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movq	%rcx, %r15
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdx, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rsi, %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$248, %rsp
	.cfi_def_cfa_offset 304
	movq	%fs:40, %rax
	movq	%rax, 232(%rsp)
	xorl	%eax, %eax
	call	ftell@PLT
	movq	%rax, %r12
	movq	16+stbi__stdio_callbacks(%rip), %rax
	leaq	56(%rsp), %rbx
	vmovdqa	stbi__stdio_callbacks(%rip), %xmm0
	movq	%rax, 32(%rsp)
	movl	$128, %edx
	movabsq	$549755813889, %rax
	movq	%rbx, %rsi
	movq	%rbp, %rdi
	movq	%rbp, 40(%rsp)
	movq	%rax, 48(%rsp)
	movl	$0, 184(%rsp)
	movq	%rbx, 208(%rsp)
	movq	%rbx, 192(%rsp)
	vmovdqa	%xmm0, 16(%rsp)
	call	stbi__stdio_read
	movq	192(%rsp), %rdx
	subq	208(%rsp), %rdx
	addl	%edx, 184(%rsp)
	testl	%eax, %eax
	jne	.L7356
	movl	$0, 48(%rsp)
	movb	$0, 56(%rsp)
	leaq	57(%rsp), %rax
.L7357:
	movq	%r13, %rsi
	movq	%rsp, %rdi
	movq	%r14, %rdx
	movq	%r15, %rcx
	movq	%rax, 200(%rsp)
	movq	%rbx, 192(%rsp)
	movq	%rax, 216(%rsp)
	call	stbi__info_main
	xorl	%edx, %edx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	movl	%eax, %r13d
	call	fseek@PLT
	movq	232(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L7360
	addq	$248, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	movl	%r13d, %eax
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L7356:
	.cfi_restore_state
	cltq
	addq	%rbx, %rax
	jmp	.L7357
.L7360:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE778:
	.size	stbi_info_from_file, .-stbi_info_from_file
	.p2align 4
	.globl	stbi_is_16_bit
	.type	stbi_is_16_bit, @function
stbi_is_16_bit:
.LFB779:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	leaq	.LC375(%rip), %rsi
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$248, %rsp
	.cfi_def_cfa_offset 288
	movq	%fs:40, %rax
	movq	%rax, 232(%rsp)
	xorl	%eax, %eax
	call	fopen@PLT
	testq	%rax, %rax
	je	.L7368
	movq	%rax, %rdi
	movq	%rax, %rbp
	call	ftell@PLT
	movq	%rax, %r12
	movq	16+stbi__stdio_callbacks(%rip), %rax
	leaq	56(%rsp), %rbx
	vmovdqa	stbi__stdio_callbacks(%rip), %xmm0
	movq	%rax, 32(%rsp)
	movl	$128, %edx
	movabsq	$549755813889, %rax
	movq	%rbx, %rsi
	movq	%rbp, %rdi
	movq	%rbp, 40(%rsp)
	movq	%rax, 48(%rsp)
	movl	$0, 184(%rsp)
	movq	%rbx, 208(%rsp)
	movq	%rbx, 192(%rsp)
	vmovdqa	%xmm0, 16(%rsp)
	call	stbi__stdio_read
	movq	192(%rsp), %rdx
	subq	208(%rsp), %rdx
	addl	%edx, 184(%rsp)
	testl	%eax, %eax
	je	.L7369
	cltq
	addq	%rbx, %rax
.L7365:
	movq	%rsp, %rdi
	movq	%rax, 200(%rsp)
	movq	%rbx, 192(%rsp)
	movq	%rax, 216(%rsp)
	call	stbi__is_16_main
	movq	%rbp, %rdi
	xorl	%edx, %edx
	movq	%r12, %rsi
	movl	%eax, %r13d
	call	fseek@PLT
	movq	%rbp, %rdi
	call	fclose@PLT
.L7361:
	movq	232(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L7370
	addq	$248, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	movl	%r13d, %eax
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L7369:
	.cfi_restore_state
	movl	$0, 48(%rsp)
	movb	$0, 56(%rsp)
	leaq	57(%rsp), %rax
	jmp	.L7365
.L7370:
	call	__stack_chk_fail@PLT
.L7368:
	leaq	.LC376(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%r13d, %r13d
	jmp	.L7361
	.cfi_endproc
.LFE779:
	.size	stbi_is_16_bit, .-stbi_is_16_bit
	.p2align 4
	.globl	stbi_is_16_bit_from_file
	.type	stbi_is_16_bit_from_file, @function
stbi_is_16_bit_from_file:
.LFB780:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$248, %rsp
	.cfi_def_cfa_offset 288
	movq	%fs:40, %rax
	movq	%rax, 232(%rsp)
	xorl	%eax, %eax
	call	ftell@PLT
	movq	%rax, %r12
	movq	16+stbi__stdio_callbacks(%rip), %rax
	leaq	56(%rsp), %rbx
	vmovdqa	stbi__stdio_callbacks(%rip), %xmm0
	movq	%rax, 32(%rsp)
	movl	$128, %edx
	movabsq	$549755813889, %rax
	movq	%rbx, %rsi
	movq	%rbp, %rdi
	movq	%rbp, 40(%rsp)
	movq	%rax, 48(%rsp)
	movl	$0, 184(%rsp)
	movq	%rbx, 208(%rsp)
	movq	%rbx, 192(%rsp)
	vmovdqa	%xmm0, 16(%rsp)
	call	stbi__stdio_read
	movq	192(%rsp), %rdx
	subq	208(%rsp), %rdx
	addl	%edx, 184(%rsp)
	testl	%eax, %eax
	jne	.L7372
	movl	$0, 48(%rsp)
	movb	$0, 56(%rsp)
	leaq	57(%rsp), %rax
.L7373:
	movq	%rsp, %rdi
	movq	%rax, 200(%rsp)
	movq	%rbx, 192(%rsp)
	movq	%rax, 216(%rsp)
	call	stbi__is_16_main
	xorl	%edx, %edx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	movl	%eax, %r13d
	call	fseek@PLT
	movq	232(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L7376
	addq	$248, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	movl	%r13d, %eax
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L7372:
	.cfi_restore_state
	cltq
	addq	%rbx, %rax
	jmp	.L7373
.L7376:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE780:
	.size	stbi_is_16_bit_from_file, .-stbi_is_16_bit_from_file
	.p2align 4
	.globl	stbi_info_from_memory
	.type	stbi_info_from_memory, @function
stbi_info_from_memory:
.LFB781:
	.cfi_startproc
	endbr64
	subq	$248, %rsp
	.cfi_def_cfa_offset 256
	movslq	%esi, %r9
	movq	%fs:40, %rax
	movq	%rax, 232(%rsp)
	xorl	%eax, %eax
	vmovq	%rdi, %xmm1
	leaq	(%rdi,%r9), %rax
	vpinsrq	$1, %rax, %xmm1, %xmm0
	movq	%rdx, %rsi
	movq	%rsp, %rdi
	movq	%rcx, %rdx
	movq	%r8, %rcx
	movq	$0, 16(%rsp)
	movl	$0, 48(%rsp)
	movl	$0, 184(%rsp)
	vmovdqa	%xmm0, 192(%rsp)
	vmovdqa	%xmm0, 208(%rsp)
	call	stbi__info_main
	movq	232(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L7380
	addq	$248, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L7380:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE781:
	.size	stbi_info_from_memory, .-stbi_info_from_memory
	.p2align 4
	.globl	stbi_info_from_callbacks
	.type	stbi_info_from_callbacks, @function
stbi_info_from_callbacks:
.LFB782:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	movq	%rdi, %rax
	movq	%rsi, %rdi
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movq	%rcx, %r12
	movq	%r8, %r13
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movq	%rdx, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$248, %rsp
	.cfi_def_cfa_offset 288
	vmovdqu	(%rax), %xmm0
	movq	(%rax), %rcx
	movq	16(%rax), %rax
	movq	%fs:40, %rdx
	movq	%rdx, 232(%rsp)
	xorl	%edx, %edx
	leaq	56(%rsp), %rbx
	movq	%rax, 32(%rsp)
	movabsq	$549755813889, %rax
	movq	%rsi, 40(%rsp)
	movq	%rax, 48(%rsp)
	movl	$0, 184(%rsp)
	movq	%rbx, 208(%rsp)
	movq	%rbx, 192(%rsp)
	movl	$128, %edx
	vmovdqa	%xmm0, 16(%rsp)
	movq	%rbx, %rsi
	call	*%rcx
	movq	192(%rsp), %rdx
	subq	208(%rsp), %rdx
	addl	%edx, 184(%rsp)
	testl	%eax, %eax
	jne	.L7382
	movl	$0, 48(%rsp)
	movb	$0, 56(%rsp)
	leaq	57(%rsp), %rax
.L7383:
	movq	%r12, %rdx
	movq	%rsp, %rdi
	movq	%r13, %rcx
	movq	%rbp, %rsi
	movq	%rax, 200(%rsp)
	movq	%rbx, 192(%rsp)
	movq	%rax, 216(%rsp)
	call	stbi__info_main
	movq	232(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L7386
	addq	$248, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
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
.L7382:
	.cfi_restore_state
	cltq
	addq	%rbx, %rax
	jmp	.L7383
.L7386:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE782:
	.size	stbi_info_from_callbacks, .-stbi_info_from_callbacks
	.p2align 4
	.globl	stbi_is_16_bit_from_memory
	.type	stbi_is_16_bit_from_memory, @function
stbi_is_16_bit_from_memory:
.LFB783:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movslq	%esi, %rsi
	xorl	%edx, %edx
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	subq	$296, %rsp
	.cfi_def_cfa_offset 320
	movq	%fs:40, %rax
	movq	%rax, 280(%rsp)
	xorl	%eax, %eax
	movq	%rdi, 256(%rsp)
	movq	%rdi, 240(%rsp)
	addq	%rsi, %rdi
	movq	%rdi, 264(%rsp)
	movq	%rdi, 248(%rsp)
	leaq	48(%rsp), %rbp
	movq	%rsp, %rdi
	movl	$2, %esi
	movq	$0, 64(%rsp)
	movl	$0, 96(%rsp)
	movl	$0, 232(%rsp)
	movq	%rbp, (%rsp)
	call	stbi__parse_png_file
	testl	%eax, %eax
	je	.L7404
	cmpl	$16, 32(%rsp)
	movl	$1, %r12d
	je	.L7387
	movq	(%rsp), %rax
	movq	%rbp, %rdi
	vmovdqu	208(%rax), %xmm0
	vmovdqu	%xmm0, 192(%rax)
	call	stbi__get32be
	cmpl	$943870035, %eax
	je	.L7392
.L7403:
	movq	256(%rsp), %rax
	xorl	%ecx, %ecx
	movq	%rax, 240(%rsp)
	movq	264(%rsp), %rax
	xorl	%edx, %edx
	xorl	%esi, %esi
	movq	%rbp, %rdi
	movq	%rax, 248(%rsp)
	call	stbi__pnm_info
	xorl	%r12d, %r12d
	cmpl	$16, %eax
	sete	%r12b
.L7387:
	movq	280(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L7405
	addq	$296, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	movl	%r12d, %eax
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L7404:
	.cfi_restore_state
	movq	(%rsp), %rax
	movq	%rbp, %rdi
	vmovdqu	208(%rax), %xmm1
	vmovdqu	%xmm1, 192(%rax)
	call	stbi__get32be
	cmpl	$943870035, %eax
	jne	.L7403
.L7392:
	movq	%rbp, %rdi
	call	stbi__get16be
	movl	%eax, %r12d
	cmpl	$1, %eax
	jne	.L7403
	cmpq	$0, 64(%rsp)
	movq	240(%rsp), %rax
	je	.L7395
	movq	248(%rsp), %rcx
	movq	%rcx, %rdx
	subq	%rax, %rdx
	cmpl	$5, %edx
	jle	.L7406
.L7395:
	addq	$6, %rax
	movq	%rax, 240(%rsp)
.L7396:
	movq	%rbp, %rdi
	call	stbi__get16be
	cmpl	$16, %eax
	ja	.L7403
	movq	%rbp, %rdi
	call	stbi__get16be
	cmpl	$16, %eax
	je	.L7387
	jmp	.L7403
	.p2align 4,,10
	.p2align 3
.L7406:
	movq	%rcx, 240(%rsp)
	movq	88(%rsp), %rdi
	movl	$6, %esi
	subl	%edx, %esi
	call	*72(%rsp)
	jmp	.L7396
.L7405:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE783:
	.size	stbi_is_16_bit_from_memory, .-stbi_is_16_bit_from_memory
	.p2align 4
	.globl	stbi_is_16_bit_from_callbacks
	.type	stbi_is_16_bit_from_callbacks, @function
stbi_is_16_bit_from_callbacks:
.LFB784:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movq	%rdi, %rax
	movq	%rsi, %rdi
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	subq	$288, %rsp
	.cfi_def_cfa_offset 320
	vmovdqu	(%rax), %xmm0
	movq	(%rax), %rcx
	movq	16(%rax), %rax
	movq	%fs:40, %rdx
	movq	%rdx, 280(%rsp)
	xorl	%edx, %edx
	leaq	104(%rsp), %rbx
	movq	%rax, 80(%rsp)
	movabsq	$549755813889, %rax
	movq	%rsi, 88(%rsp)
	movq	%rax, 96(%rsp)
	movl	$0, 232(%rsp)
	movq	%rbx, 256(%rsp)
	movq	%rbx, 240(%rsp)
	movl	$128, %edx
	vmovdqa	%xmm0, 64(%rsp)
	movq	%rbx, %rsi
	call	*%rcx
	movq	240(%rsp), %rdx
	subq	256(%rsp), %rdx
	addl	%edx, 232(%rsp)
	testl	%eax, %eax
	jne	.L7408
	movl	$0, 96(%rsp)
	movb	$0, 104(%rsp)
	leaq	105(%rsp), %rax
.L7409:
	leaq	48(%rsp), %rbp
	xorl	%edx, %edx
	movq	%rsp, %rdi
	movl	$2, %esi
	movq	%rax, 248(%rsp)
	movq	%rbx, 240(%rsp)
	movq	%rax, 264(%rsp)
	movq	%rbp, (%rsp)
	call	stbi__parse_png_file
	testl	%eax, %eax
	je	.L7426
	cmpl	$16, 32(%rsp)
	movl	$1, %r12d
	je	.L7407
	movq	(%rsp), %rax
	movq	%rbp, %rdi
	vmovdqu	208(%rax), %xmm1
	vmovdqu	%xmm1, 192(%rax)
	call	stbi__get32be
	cmpl	$943870035, %eax
	je	.L7414
.L7425:
	movq	256(%rsp), %rax
	xorl	%ecx, %ecx
	movq	%rax, 240(%rsp)
	movq	264(%rsp), %rax
	xorl	%edx, %edx
	xorl	%esi, %esi
	movq	%rbp, %rdi
	movq	%rax, 248(%rsp)
	call	stbi__pnm_info
	xorl	%r12d, %r12d
	cmpl	$16, %eax
	sete	%r12b
.L7407:
	movq	280(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L7427
	addq	$288, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	movl	%r12d, %eax
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L7408:
	.cfi_restore_state
	cltq
	addq	%rbx, %rax
	jmp	.L7409
	.p2align 4,,10
	.p2align 3
.L7426:
	movq	(%rsp), %rax
	movq	%rbp, %rdi
	vmovdqu	208(%rax), %xmm2
	vmovdqu	%xmm2, 192(%rax)
	call	stbi__get32be
	cmpl	$943870035, %eax
	jne	.L7425
.L7414:
	movq	%rbp, %rdi
	call	stbi__get16be
	movl	%eax, %r12d
	cmpl	$1, %eax
	jne	.L7425
	cmpq	$0, 64(%rsp)
	movq	240(%rsp), %rax
	je	.L7417
	movq	248(%rsp), %rcx
	movq	%rcx, %rdx
	subq	%rax, %rdx
	cmpl	$5, %edx
	jle	.L7428
.L7417:
	addq	$6, %rax
	movq	%rax, 240(%rsp)
.L7418:
	movq	%rbp, %rdi
	call	stbi__get16be
	cmpl	$16, %eax
	ja	.L7425
	movq	%rbp, %rdi
	call	stbi__get16be
	cmpl	$16, %eax
	je	.L7407
	jmp	.L7425
	.p2align 4,,10
	.p2align 3
.L7428:
	movq	%rcx, 240(%rsp)
	movq	88(%rsp), %rdi
	movl	$6, %esi
	subl	%edx, %esi
	call	*72(%rsp)
	jmp	.L7418
.L7427:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE784:
	.size	stbi_is_16_bit_from_callbacks, .-stbi_is_16_bit_from_callbacks
	.p2align 4
	.globl	stbi_flip_vertically_on_write
	.type	stbi_flip_vertically_on_write, @function
stbi_flip_vertically_on_write:
.LFB785:
	.cfi_startproc
	endbr64
	movl	%edi, stbi__flip_vertically_on_write(%rip)
	ret
	.cfi_endproc
.LFE785:
	.size	stbi_flip_vertically_on_write, .-stbi_flip_vertically_on_write
	.section	.rodata.str1.1
.LC377:
	.string	"11 4 22 44 44 22 444444"
	.section	.rodata.str1.8
	.align 8
.LC378:
	.string	"11 4 22 44 44 22 444444 4444 4 444 444 444 444"
	.text
	.p2align 4
	.globl	stbi_write_bmp_to_func
	.type	stbi_write_bmp_to_func, @function
stbi_write_bmp_to_func:
.LFB801:
	.cfi_startproc
	endbr64
	subq	$104, %rsp
	.cfi_def_cfa_offset 112
	vpxor	%xmm0, %xmm0, %xmm0
	movl	%edx, %r10d
	movl	%ecx, %eax
	movq	%fs:40, %rdx
	movq	%rdx, 88(%rsp)
	xorl	%edx, %edx
	movq	$0, 80(%rsp)
	movq	%rdi, (%rsp)
	movq	%rsi, 8(%rsp)
	vmovdqa	%xmm0, 16(%rsp)
	vmovdqa	%xmm0, 32(%rsp)
	vmovdqa	%xmm0, 48(%rsp)
	vmovdqa	%xmm0, 64(%rsp)
	cmpl	$4, %r8d
	je	.L7431
	movq	%rsp, %rdi
	pushq	$0
	.cfi_def_cfa_offset 120
	movl	%r10d, %ecx
	leal	0(,%r10,4), %edx
	pushq	$0
	.cfi_def_cfa_offset 128
	andl	$3, %ecx
	movl	%r10d, %esi
	pushq	$0
	.cfi_def_cfa_offset 136
	subl	%edx, %esi
	movl	%ecx, %edx
	pushq	$0
	.cfi_def_cfa_offset 144
	subl	%esi, %edx
	imull	%eax, %edx
	pushq	$0
	.cfi_def_cfa_offset 152
	leaq	.LC377(%rip), %rsi
	addl	$54, %edx
	pushq	$0
	.cfi_def_cfa_offset 160
	pushq	$24
	.cfi_def_cfa_offset 168
	pushq	$1
	.cfi_def_cfa_offset 176
	pushq	%rax
	.cfi_def_cfa_offset 184
	pushq	%r10
	.cfi_def_cfa_offset 192
	pushq	$40
	.cfi_def_cfa_offset 200
	pushq	$54
	.cfi_def_cfa_offset 208
	pushq	$0
	.cfi_def_cfa_offset 216
	pushq	$0
	.cfi_def_cfa_offset 224
	pushq	%rdx
	.cfi_def_cfa_offset 232
	movl	$-1, %edx
	pushq	$77
	.cfi_def_cfa_offset 240
	pushq	$66
	.cfi_def_cfa_offset 248
	pushq	%rsi
	.cfi_def_cfa_offset 256
	movl	$-1, %esi
	pushq	%rcx
	.cfi_def_cfa_offset 264
	movl	%r10d, %ecx
	pushq	$0
	.cfi_def_cfa_offset 272
	pushq	%r9
	.cfi_def_cfa_offset 280
	movl	%r8d, %r9d
	movl	%eax, %r8d
	pushq	$1
	.cfi_def_cfa_offset 288
	xorl	%eax, %eax
	call	stbiw__outfile.constprop.0
	addq	$176, %rsp
	.cfi_def_cfa_offset 112
.L7430:
	movq	88(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L7435
	addq	$104, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L7431:
	.cfi_restore_state
	movq	%rsp, %rdi
	subq	$8, %rsp
	.cfi_def_cfa_offset 120
	pushq	$0
	.cfi_def_cfa_offset 128
	movl	%r10d, %edx
	imull	%ecx, %edx
	pushq	$0
	.cfi_def_cfa_offset 136
	movl	%eax, %r8d
	leal	122(,%rdx,4), %edx
	pushq	$0
	.cfi_def_cfa_offset 144
	movl	$-1, %esi
	xorl	%eax, %eax
	pushq	$0
	.cfi_def_cfa_offset 152
	pushq	$0
	.cfi_def_cfa_offset 160
	pushq	$0
	.cfi_def_cfa_offset 168
	pushq	$0
	.cfi_def_cfa_offset 176
	pushq	$0
	.cfi_def_cfa_offset 184
	pushq	$0
	.cfi_def_cfa_offset 192
	pushq	$0
	.cfi_def_cfa_offset 200
	pushq	$0
	.cfi_def_cfa_offset 208
	pushq	$0
	.cfi_def_cfa_offset 216
	pushq	$0
	.cfi_def_cfa_offset 224
	pushq	$-16777216
	.cfi_def_cfa_offset 232
	pushq	$255
	.cfi_def_cfa_offset 240
	pushq	$65280
	.cfi_def_cfa_offset 248
	pushq	$16711680
	.cfi_def_cfa_offset 256
	pushq	$0
	.cfi_def_cfa_offset 264
	pushq	$0
	.cfi_def_cfa_offset 272
	pushq	$0
	.cfi_def_cfa_offset 280
	pushq	$0
	.cfi_def_cfa_offset 288
	pushq	$0
	.cfi_def_cfa_offset 296
	pushq	$3
	.cfi_def_cfa_offset 304
	pushq	$32
	.cfi_def_cfa_offset 312
	pushq	$1
	.cfi_def_cfa_offset 320
	pushq	%rcx
	.cfi_def_cfa_offset 328
	leaq	.LC378(%rip), %rcx
	pushq	%r10
	.cfi_def_cfa_offset 336
	pushq	$108
	.cfi_def_cfa_offset 344
	pushq	$122
	.cfi_def_cfa_offset 352
	pushq	$0
	.cfi_def_cfa_offset 360
	pushq	$0
	.cfi_def_cfa_offset 368
	pushq	%rdx
	.cfi_def_cfa_offset 376
	movl	$-1, %edx
	pushq	$77
	.cfi_def_cfa_offset 384
	pushq	$66
	.cfi_def_cfa_offset 392
	pushq	%rcx
	.cfi_def_cfa_offset 400
	movl	%r10d, %ecx
	pushq	$0
	.cfi_def_cfa_offset 408
	pushq	$1
	.cfi_def_cfa_offset 416
	pushq	%r9
	.cfi_def_cfa_offset 424
	movl	$4, %r9d
	pushq	$1
	.cfi_def_cfa_offset 432
	call	stbiw__outfile.constprop.0
	addq	$320, %rsp
	.cfi_def_cfa_offset 112
	jmp	.L7430
.L7435:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE801:
	.size	stbi_write_bmp_to_func, .-stbi_write_bmp_to_func
	.section	.rodata.str1.1
.LC379:
	.string	"wb"
	.text
	.p2align 4
	.globl	stbi_write_bmp
	.type	stbi_write_bmp, @function
stbi_write_bmp:
.LFB802:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	vpxor	%xmm0, %xmm0, %xmm0
	movq	%r8, %r13
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movl	%esi, %r12d
	leaq	.LC379(%rip), %rsi
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movl	%ecx, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movl	%edx, %ebx
	subq	$104, %rsp
	.cfi_def_cfa_offset 144
	movq	%fs:40, %rax
	movq	%rax, 88(%rsp)
	xorl	%eax, %eax
	movq	$0, 80(%rsp)
	vmovdqa	%xmm0, (%rsp)
	vmovdqa	%xmm0, 16(%rsp)
	vmovdqa	%xmm0, 32(%rsp)
	vmovdqa	%xmm0, 48(%rsp)
	vmovdqa	%xmm0, 64(%rsp)
	call	fopen@PLT
	leaq	stbi__stdio_write(%rip), %rcx
	movq	%rcx, (%rsp)
	movq	%rax, 8(%rsp)
	testq	%rax, %rax
	je	.L7441
	cmpl	$4, %ebp
	je	.L7438
	movq	%rsp, %rdi
	pushq	$0
	.cfi_def_cfa_offset 152
	movl	%r12d, %edx
	leal	0(,%r12,4), %eax
	pushq	$0
	.cfi_def_cfa_offset 160
	andl	$3, %edx
	movl	%r12d, %ecx
	pushq	$0
	.cfi_def_cfa_offset 168
	subl	%eax, %ecx
	movl	%edx, %eax
	pushq	$0
	.cfi_def_cfa_offset 176
	subl	%ecx, %eax
	imull	%ebx, %eax
	pushq	$0
	.cfi_def_cfa_offset 184
	movl	%r12d, %ecx
	addl	$54, %eax
	pushq	$0
	.cfi_def_cfa_offset 192
	movl	%ebp, %r9d
	movl	%ebx, %r8d
	pushq	$24
	.cfi_def_cfa_offset 200
	movl	$-1, %esi
	pushq	$1
	.cfi_def_cfa_offset 208
	pushq	%rbx
	.cfi_def_cfa_offset 216
	pushq	%r12
	.cfi_def_cfa_offset 224
	pushq	$40
	.cfi_def_cfa_offset 232
	pushq	$54
	.cfi_def_cfa_offset 240
	pushq	$0
	.cfi_def_cfa_offset 248
	pushq	$0
	.cfi_def_cfa_offset 256
	pushq	%rax
	.cfi_def_cfa_offset 264
	leaq	.LC377(%rip), %rax
	pushq	$77
	.cfi_def_cfa_offset 272
	pushq	$66
	.cfi_def_cfa_offset 280
	pushq	%rax
	.cfi_def_cfa_offset 288
	xorl	%eax, %eax
	pushq	%rdx
	.cfi_def_cfa_offset 296
	movl	$-1, %edx
	pushq	$0
	.cfi_def_cfa_offset 304
	pushq	%r13
	.cfi_def_cfa_offset 312
	pushq	$1
	.cfi_def_cfa_offset 320
	call	stbiw__outfile.constprop.0
	movl	%eax, %r12d
	addq	$176, %rsp
	.cfi_def_cfa_offset 144
.L7439:
	movq	8(%rsp), %rdi
	call	fclose@PLT
.L7436:
	movq	88(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L7443
	addq	$104, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	movl	%r12d, %eax
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L7438:
	.cfi_restore_state
	movq	%rsp, %rdi
	subq	$8, %rsp
	.cfi_def_cfa_offset 152
	pushq	$0
	.cfi_def_cfa_offset 160
	movl	%r12d, %eax
	imull	%ebx, %eax
	pushq	$0
	.cfi_def_cfa_offset 168
	movl	%r12d, %ecx
	leal	122(,%rax,4), %eax
	pushq	$0
	.cfi_def_cfa_offset 176
	movl	$4, %r9d
	movl	%ebx, %r8d
	pushq	$0
	.cfi_def_cfa_offset 184
	movl	$-1, %edx
	movl	$-1, %esi
	pushq	$0
	.cfi_def_cfa_offset 192
	pushq	$0
	.cfi_def_cfa_offset 200
	pushq	$0
	.cfi_def_cfa_offset 208
	pushq	$0
	.cfi_def_cfa_offset 216
	pushq	$0
	.cfi_def_cfa_offset 224
	pushq	$0
	.cfi_def_cfa_offset 232
	pushq	$0
	.cfi_def_cfa_offset 240
	pushq	$0
	.cfi_def_cfa_offset 248
	pushq	$0
	.cfi_def_cfa_offset 256
	pushq	$-16777216
	.cfi_def_cfa_offset 264
	pushq	$255
	.cfi_def_cfa_offset 272
	pushq	$65280
	.cfi_def_cfa_offset 280
	pushq	$16711680
	.cfi_def_cfa_offset 288
	pushq	$0
	.cfi_def_cfa_offset 296
	pushq	$0
	.cfi_def_cfa_offset 304
	pushq	$0
	.cfi_def_cfa_offset 312
	pushq	$0
	.cfi_def_cfa_offset 320
	pushq	$0
	.cfi_def_cfa_offset 328
	pushq	$3
	.cfi_def_cfa_offset 336
	pushq	$32
	.cfi_def_cfa_offset 344
	pushq	$1
	.cfi_def_cfa_offset 352
	pushq	%rbx
	.cfi_def_cfa_offset 360
	pushq	%r12
	.cfi_def_cfa_offset 368
	pushq	$108
	.cfi_def_cfa_offset 376
	pushq	$122
	.cfi_def_cfa_offset 384
	pushq	$0
	.cfi_def_cfa_offset 392
	pushq	$0
	.cfi_def_cfa_offset 400
	pushq	%rax
	.cfi_def_cfa_offset 408
	leaq	.LC378(%rip), %rax
	pushq	$77
	.cfi_def_cfa_offset 416
	pushq	$66
	.cfi_def_cfa_offset 424
	pushq	%rax
	.cfi_def_cfa_offset 432
	xorl	%eax, %eax
	pushq	$0
	.cfi_def_cfa_offset 440
	pushq	$1
	.cfi_def_cfa_offset 448
	pushq	%r13
	.cfi_def_cfa_offset 456
	pushq	$1
	.cfi_def_cfa_offset 464
	call	stbiw__outfile.constprop.0
	movl	%eax, %r12d
	addq	$320, %rsp
	.cfi_def_cfa_offset 144
	jmp	.L7439
.L7441:
	xorl	%r12d, %r12d
	jmp	.L7436
.L7443:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE802:
	.size	stbi_write_bmp, .-stbi_write_bmp
	.p2align 4
	.globl	stbi_write_tga_to_func
	.type	stbi_write_tga_to_func, @function
stbi_write_tga_to_func:
.LFB804:
	.cfi_startproc
	endbr64
	subq	$104, %rsp
	.cfi_def_cfa_offset 112
	movq	%fs:40, %rax
	movq	%rax, 88(%rsp)
	xorl	%eax, %eax
	vpxor	%xmm0, %xmm0, %xmm0
	movq	%rsi, %r10
	movq	%rdi, (%rsp)
	movl	%edx, %esi
	movq	%rsp, %rdi
	movl	%ecx, %edx
	movl	%r8d, %ecx
	movq	%r9, %r8
	movq	$0, 80(%rsp)
	movq	%r10, 8(%rsp)
	vmovdqa	%xmm0, 16(%rsp)
	vmovdqa	%xmm0, 32(%rsp)
	vmovdqa	%xmm0, 48(%rsp)
	vmovdqa	%xmm0, 64(%rsp)
	call	stbi_write_tga_core
	movq	88(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L7447
	addq	$104, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L7447:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE804:
	.size	stbi_write_tga_to_func, .-stbi_write_tga_to_func
	.p2align 4
	.globl	stbi_write_tga
	.type	stbi_write_tga, @function
stbi_write_tga:
.LFB805:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	vpxor	%xmm0, %xmm0, %xmm0
	movl	%edx, %r13d
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movl	%ecx, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movl	%esi, %ebp
	leaq	.LC379(%rip), %rsi
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%r8, %rbx
	subq	$104, %rsp
	.cfi_def_cfa_offset 144
	movq	%fs:40, %rax
	movq	%rax, 88(%rsp)
	xorl	%eax, %eax
	movq	$0, 80(%rsp)
	vmovdqa	%xmm0, (%rsp)
	vmovdqa	%xmm0, 16(%rsp)
	vmovdqa	%xmm0, 32(%rsp)
	vmovdqa	%xmm0, 48(%rsp)
	vmovdqa	%xmm0, 64(%rsp)
	call	fopen@PLT
	leaq	stbi__stdio_write(%rip), %rdx
	movq	%rdx, (%rsp)
	movq	%rax, 8(%rsp)
	testq	%rax, %rax
	je	.L7451
	movq	%rsp, %rdi
	movl	%r12d, %ecx
	movq	%rbx, %r8
	movl	%r13d, %edx
	movl	%ebp, %esi
	call	stbi_write_tga_core
	movq	8(%rsp), %rdi
	movl	%eax, %r12d
	call	fclose@PLT
.L7448:
	movq	88(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L7453
	addq	$104, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	movl	%r12d, %eax
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
.L7451:
	.cfi_restore_state
	xorl	%r12d, %r12d
	jmp	.L7448
.L7453:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE805:
	.size	stbi_write_tga, .-stbi_write_tga
	.p2align 4
	.globl	stbi_write_hdr_to_func
	.type	stbi_write_hdr_to_func, @function
stbi_write_hdr_to_func:
.LFB811:
	.cfi_startproc
	endbr64
	subq	$104, %rsp
	.cfi_def_cfa_offset 112
	movq	%fs:40, %rax
	movq	%rax, 88(%rsp)
	xorl	%eax, %eax
	testl	%ecx, %ecx
	setle	%al
	testq	%r9, %r9
	movq	%rsi, 8(%rsp)
	sete	%sil
	vpxor	%xmm0, %xmm0, %xmm0
	orb	%sil, %al
	movl	%edx, %r10d
	movq	$0, 80(%rsp)
	movq	%rdi, (%rsp)
	movl	%ecx, %edx
	vmovdqa	%xmm0, 16(%rsp)
	vmovdqa	%xmm0, 32(%rsp)
	vmovdqa	%xmm0, 48(%rsp)
	vmovdqa	%xmm0, 64(%rsp)
	jne	.L7457
	testl	%r10d, %r10d
	jle	.L7457
	movl	%r8d, %ecx
	movq	%rsp, %rdi
	movq	%r9, %r8
	movl	%r10d, %esi
	call	stbi_write_hdr_core.part.0
	jmp	.L7454
	.p2align 4,,10
	.p2align 3
.L7457:
	xorl	%eax, %eax
.L7454:
	movq	88(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L7459
	addq	$104, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L7459:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE811:
	.size	stbi_write_hdr_to_func, .-stbi_write_hdr_to_func
	.p2align 4
	.globl	stbi_write_hdr
	.type	stbi_write_hdr, @function
stbi_write_hdr:
.LFB812:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	vpxor	%xmm0, %xmm0, %xmm0
	movl	%ecx, %r13d
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movl	%edx, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movl	%esi, %ebp
	leaq	.LC379(%rip), %rsi
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%r8, %rbx
	subq	$104, %rsp
	.cfi_def_cfa_offset 144
	movq	%fs:40, %rax
	movq	%rax, 88(%rsp)
	xorl	%eax, %eax
	movq	$0, 80(%rsp)
	vmovdqa	%xmm0, 16(%rsp)
	vmovdqa	%xmm0, 32(%rsp)
	vmovdqa	%xmm0, 48(%rsp)
	vmovdqa	%xmm0, 64(%rsp)
	call	fopen@PLT
	movq	%rax, %rdi
	leaq	stbi__stdio_write(%rip), %rax
	movq	%rax, (%rsp)
	movq	%rdi, 8(%rsp)
	testq	%rdi, %rdi
	je	.L7464
	testl	%r12d, %r12d
	setle	%al
	testq	%rbx, %rbx
	sete	%dl
	orb	%dl, %al
	jne	.L7465
	testl	%ebp, %ebp
	jle	.L7465
	movq	%rsp, %rdi
	movl	%r12d, %edx
	movq	%rbx, %r8
	movl	%r13d, %ecx
	movl	%ebp, %esi
	call	stbi_write_hdr_core.part.0
	movl	%eax, %r12d
	movq	8(%rsp), %rdi
	jmp	.L7462
	.p2align 4,,10
	.p2align 3
.L7465:
	xorl	%r12d, %r12d
.L7462:
	call	fclose@PLT
.L7460:
	movq	88(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L7467
	addq	$104, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	movl	%r12d, %eax
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
.L7464:
	.cfi_restore_state
	xorl	%r12d, %r12d
	jmp	.L7460
.L7467:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE812:
	.size	stbi_write_hdr, .-stbi_write_hdr
	.section	.rodata.str1.1
.LC380:
	.string	"d <= 32767 && best <= 258"
	.text
	.p2align 4
	.globl	stbi_zlib_compress
	.type	stbi_zlib_compress, @function
stbi_zlib_compress:
.LFB818:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdi, %r14
	movl	$131072, %edi
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
	movl	%ecx, %ebx
	subq	$120, %rsp
	.cfi_def_cfa_offset 176
	movl	%esi, 20(%rsp)
	movq	%rdx, 88(%rsp)
	movl	$1, %esi
	movq	%fs:40, %rax
	movq	%rax, 104(%rsp)
	xorl	%eax, %eax
	movl	$0, 96(%rsp)
	movl	$0, 100(%rsp)
	call	calloc@PLT
	movq	%rax, 24(%rsp)
	testq	%rax, %rax
	je	.L7468
	movl	$5, %eax
	cmpl	%eax, %ebx
	cmovge	%ebx, %eax
	movl	$10, %edi
	movl	%eax, 76(%rsp)
	call	malloc@PLT
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L7471
	movabsq	$4294967298, %rax
	movq	%rax, (%rdi)
	movb	$120, 8(%rdi)
	movl	$13, %esi
	call	realloc@PLT
	testq	%rax, %rax
	je	.L7471
	movslq	4(%rax), %rdx
	movl	$5, (%rax)
	leal	1(%rdx), %ecx
	movl	%ecx, 4(%rax)
	movb	$94, 8(%rax,%rdx)
	leaq	100(%rsp), %rbx
	leaq	96(%rsp), %r15
	leaq	8(%rax), %rdi
	movq	%rbx, %rdx
	movq	%r15, %rsi
	movl	$1, 96(%rsp)
	movl	$1, 100(%rsp)
	movq	%rbx, 40(%rsp)
	movq	%r15, 32(%rsp)
	call	stbiw__zlib_flushf
	movl	100(%rsp), %edx
	movq	%rax, %rdi
	movl	$1, %eax
	shlx	%edx, %eax, %eax
	addl	$2, %edx
	movl	%edx, 100(%rsp)
	movq	%r15, %rsi
	movq	%rbx, %rdx
	orl	%eax, 96(%rsp)
	call	stbiw__zlib_flushf
	movq	%rax, 8(%rsp)
	movl	20(%rsp), %eax
	subl	$3, %eax
	movl	%eax, 68(%rsp)
	testl	%eax, %eax
	jle	.L7541
	movslq	76(%rsp), %rax
	xorl	%r15d, %r15d
	leal	(%rax,%rax), %ebx
	salq	$3, %rax
	movl	%ebx, 72(%rsp)
	movq	%rax, 80(%rsp)
	.p2align 4,,10
	.p2align 3
.L7498:
	movslq	%r15d, %rax
	leaq	(%r14,%rax), %rbx
	movq	%rax, 56(%rsp)
	movzbl	1(%rbx), %eax
	movzbl	(%rbx), %edi
	movzbl	2(%rbx), %edx
	sall	$8, %eax
	addl	%edi, %eax
	sall	$16, %edx
	addl	%edx, %eax
	leal	0(,%rax,8), %edx
	xorl	%edx, %eax
	movl	%eax, %edx
	shrl	$5, %edx
	addl	%edx, %eax
	movl	%eax, %edx
	sall	$4, %edx
	xorl	%edx, %eax
	movl	%eax, %edx
	shrl	$17, %edx
	addl	%edx, %eax
	movl	%eax, %edx
	sall	$25, %edx
	xorl	%edx, %eax
	movl	%eax, %edx
	shrl	$6, %edx
	movl	%edi, 64(%rsp)
	movl	%edi, %r13d
	addl	%edx, %eax
	movq	24(%rsp), %rdi
	andl	$16383, %eax
	leaq	(%rdi,%rax,8), %rax
	movq	(%rax), %r8
	movq	%rax, 48(%rsp)
	testq	%r8, %r8
	je	.L7473
	movslq	-4(%r8), %r11
	testl	%r11d, %r11d
	jle	.L7542
	movl	20(%rsp), %edi
	leal	-32768(%r15), %r9d
	leal	-1(%r11), %eax
	subl	%r15d, %edi
	movslq	%r9d, %r9
	movq	%r8, %rsi
	leaq	8(%r8,%rax,8), %r10
	xorl	%r12d, %r12d
	movl	$3, %ebp
	jmp	.L7479
	.p2align 4,,10
	.p2align 3
.L7475:
	addq	$8, %rsi
	cmpq	%r10, %rsi
	je	.L7474
.L7479:
	movq	(%rsi), %rcx
	movq	%rcx, %rax
	subq	%r14, %rax
	cmpq	%r9, %rax
	jle	.L7475
	testl	%edi, %edi
	jle	.L7475
	movq	%rsi, (%rsp)
	movl	$1, %eax
	jmp	.L7477
	.p2align 4,,10
	.p2align 3
.L7623:
	movl	%eax, %edx
	incq	%rax
	cmpl	%edx, %edi
	jle	.L7476
	cmpl	$257, %edx
	jg	.L7476
.L7477:
	movzbl	-1(%rcx,%rax), %esi
	leal	-1(%rax), %edx
	cmpb	%sil, -1(%rbx,%rax)
	je	.L7623
.L7476:
	movq	(%rsp), %rsi
	cmpl	%edx, %ebp
	jg	.L7475
	addq	$8, %rsi
	movq	%rcx, %r12
	movl	%edx, %ebp
	cmpq	%r10, %rsi
	jne	.L7479
	.p2align 4,,10
	.p2align 3
.L7474:
	cmpl	%r11d, 72(%rsp)
	je	.L7624
.L7480:
	movl	-8(%r8), %edx
	leal	1(%r11), %eax
	cmpl	%edx, %eax
	jl	.L7527
	leal	1(%rdx,%rdx), %edx
	leal	0(,%rdx,8), %esi
	movslq	%esi, %rsi
	addq	$8, %rsi
	leaq	-8(%r8), %rdi
	movl	%edx, (%rsp)
	call	realloc@PLT
	testq	%rax, %rax
	movl	(%rsp), %edx
	je	.L7538
.L7481:
	movq	48(%rsp), %rcx
	leaq	8(%rax), %r8
	movslq	4(%rax), %r11
	movq	%r8, (%rcx)
	movl	%edx, (%rax)
	leal	1(%r11), %eax
.L7527:
	movl	%eax, -4(%r8)
	movq	%rbx, (%r8,%r11,8)
	testq	%r12, %r12
	jne	.L7625
.L7482:
	movl	100(%rsp), %edx
	movl	96(%rsp), %ecx
	movl	64(%rsp), %eax
	cmpb	$-113, %r13b
	ja	.L7496
	addl	$48, %eax
	movl	%eax, %esi
	leal	(%rax,%rax), %edi
	sarl	%esi
	andl	$1, %esi
	andl	$2, %edi
	orl	%esi, %edi
	movl	%eax, %esi
	sarl	$2, %esi
	addl	%edi, %edi
	andl	$1, %esi
	orl	%edi, %esi
	movl	%eax, %edi
	sarl	$3, %edi
	addl	%esi, %esi
	andl	$1, %edi
	orl	%esi, %edi
	movl	%eax, %esi
	sarl	$4, %esi
	addl	%edi, %edi
	andl	$1, %esi
	orl	%edi, %esi
	movl	%eax, %edi
	sarl	$5, %edi
	addl	%esi, %esi
	andl	$1, %edi
	orl	%esi, %edi
	movl	%eax, %esi
	sarl	$6, %esi
	addl	%edi, %edi
	andl	$1, %esi
	orl	%edi, %esi
	addl	%esi, %esi
	sarl	$7, %eax
	orl	%esi, %eax
	shlx	%edx, %eax, %eax
	orl	%ecx, %eax
	movl	%eax, 96(%rsp)
	addl	$8, %edx
.L7621:
	movl	%edx, 100(%rsp)
	movq	32(%rsp), %rsi
	movq	40(%rsp), %rdx
	movq	8(%rsp), %rdi
	incl	%r15d
	call	stbiw__zlib_flushf
	movq	%rax, 8(%rsp)
.L7495:
	cmpl	68(%rsp), %r15d
	jl	.L7498
.L7472:
	movl	20(%rsp), %ebx
	cmpl	%r15d, %ebx
	jle	.L7499
	movslq	%r15d, %rax
	decl	%ebx
	leaq	(%r14,%rax), %rbp
	subl	%r15d, %ebx
	leaq	1(%r14,%rax), %rax
	movq	8(%rsp), %rdi
	movq	32(%rsp), %r12
	movq	40(%rsp), %r13
	addq	%rax, %rbx
.L7502:
	movzbl	0(%rbp), %eax
	movl	100(%rsp), %edx
	movl	96(%rsp), %ecx
	cmpb	$-113, %al
	ja	.L7500
	addl	$48, %eax
	movzbl	%al, %eax
	movl	%eax, %esi
	leal	(%rax,%rax), %r8d
	sarl	%esi
	andl	$1, %esi
	andl	$2, %r8d
	orl	%esi, %r8d
	movl	%eax, %esi
	sarl	$2, %esi
	addl	%r8d, %r8d
	andl	$1, %esi
	orl	%r8d, %esi
	movl	%eax, %r8d
	sarl	$3, %r8d
	addl	%esi, %esi
	andl	$1, %r8d
	orl	%esi, %r8d
	movl	%eax, %esi
	sarl	$4, %esi
	addl	%r8d, %r8d
	andl	$1, %esi
	orl	%r8d, %esi
	movl	%eax, %r8d
	sarl	$5, %r8d
	addl	%esi, %esi
	andl	$1, %r8d
	orl	%esi, %r8d
	movl	%eax, %esi
	sarl	$6, %esi
	addl	%r8d, %r8d
	andl	$1, %esi
	orl	%r8d, %esi
	addl	%esi, %esi
	sarl	$7, %eax
	orl	%esi, %eax
	shlx	%edx, %eax, %eax
	orl	%ecx, %eax
	movl	%eax, 96(%rsp)
	addl	$8, %edx
.L7622:
	movl	%edx, 100(%rsp)
	movq	%r12, %rsi
	movq	%r13, %rdx
	call	stbiw__zlib_flushf
	incq	%rbp
	movq	%rax, %rdi
	cmpq	%rbx, %rbp
	jne	.L7502
	movq	%rax, 8(%rsp)
.L7499:
	movq	40(%rsp), %r15
	movq	32(%rsp), %rbx
	movq	8(%rsp), %rdi
	movq	%r15, %rdx
	movq	%rbx, %rsi
	addl	$7, 100(%rsp)
	call	stbiw__zlib_flushf
	movq	%rax, %rbp
	movl	100(%rsp), %eax
	testl	%eax, %eax
	je	.L7503
	movq	%rbp, %rdi
	movl	%eax, %edx
	movq	%r15, %rbp
	.p2align 4,,10
	.p2align 3
.L7504:
	incl	%edx
	movl	%edx, 100(%rsp)
	movq	%rbx, %rsi
	movq	%rbp, %rdx
	call	stbiw__zlib_flushf
	movl	100(%rsp), %edx
	movq	%rax, %rdi
	testl	%edx, %edx
	jne	.L7504
	movq	%rax, %rbp
.L7503:
	movq	24(%rsp), %rax
	movq	%rax, %r12
	leaq	131072(%rax), %rbx
	.p2align 4,,10
	.p2align 3
.L7506:
	movq	(%r12), %rdi
	testq	%rdi, %rdi
	je	.L7505
	subq	$8, %rdi
	call	free@PLT
.L7505:
	addq	$8, %r12
	cmpq	%rbx, %r12
	jne	.L7506
	movq	24(%rsp), %rdi
	call	free@PLT
	movl	20(%rsp), %ebx
	movl	-4(%rbp), %edi
	leal	32766(%rbx), %edx
	movslq	%edx, %rax
	imulq	$-2147418109, %rax, %rax
	leaq	-8(%rbp), %rcx
	movq	%rcx, 24(%rsp)
	shrq	$32, %rax
	addl	%edx, %eax
	sarl	$14, %eax
	sarl	$31, %edx
	subl	%edx, %eax
	leal	(%rax,%rax,4), %eax
	leal	2(%rbx,%rax), %eax
	cmpl	%eax, %edi
	jle	.L7507
	movl	$2, -4(%rbp)
	testl	%ebx, %ebx
	jle	.L7543
	movq	%r14, (%rsp)
	movl	$2, %edi
	xorl	%ebx, %ebx
	movq	%rcx, %r12
	jmp	.L7513
	.p2align 4,,10
	.p2align 3
.L7510:
	movl	%edx, -4(%rbp)
	movb	%r15b, 0(%rbp,%rax)
	movslq	-4(%rbp), %rax
	movl	-8(%rbp), %ecx
	leal	1(%rax), %edx
	cmpl	%ecx, %edx
	jge	.L7626
.L7511:
	movl	%r15d, %ecx
	movl	%edx, -4(%rbp)
	movb	%ch, 0(%rbp,%rax)
	movslq	-4(%rbp), %rax
	movl	-8(%rbp), %ecx
	leal	1(%rax), %edx
	cmpl	%ecx, %edx
	jge	.L7627
.L7512:
	movl	%edx, -4(%rbp)
	movl	%r15d, %edx
	notl	%edx
	movb	%dl, 0(%rbp,%rax)
	movslq	-4(%rbp), %rax
	movl	-8(%rbp), %ecx
	leal	1(%rax), %edx
	cmpl	%ecx, %edx
	jge	.L7628
.L7529:
	movl	%edx, -4(%rbp)
	movl	%r15d, %edx
	notl	%edx
	movb	%dh, 0(%rbp,%rax)
	movslq	%ebx, %rsi
	movslq	%r15d, %rdx
	movslq	-4(%rbp), %rdi
	addq	(%rsp), %rsi
	addq	%rbp, %rdi
	call	memcpy@PLT
	movl	-4(%rbp), %edi
	addl	%r15d, %ebx
	addl	%r15d, %edi
	movl	%edi, -4(%rbp)
	cmpl	%ebx, 20(%rsp)
	jle	.L7617
	leaq	-8(%rbp), %r12
.L7513:
	movl	20(%rsp), %r14d
	movl	$32767, %r15d
	subl	%ebx, %r14d
	movl	-8(%rbp), %ecx
	cmpl	%r15d, %r14d
	leal	1(%rdi), %eax
	cmovle	%r14d, %r15d
	cmpl	%ecx, %eax
	jl	.L7509
	leal	1(%rcx,%rcx), %r13d
	movslq	%r13d, %rsi
	movq	%r12, %rdi
	addq	$8, %rsi
	call	realloc@PLT
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L7471
	movl	4(%rax), %edi
	movl	%r13d, (%rax)
	leaq	8(%rax), %rbp
	leal	1(%rdi), %eax
.L7509:
	movl	%eax, -4(%rbp)
	movslq	%edi, %rdi
	cmpl	$32767, %r14d
	setle	0(%rbp,%rdi)
	movslq	-4(%rbp), %rax
	movl	-8(%rbp), %ecx
	leal	1(%rax), %edx
	cmpl	%ecx, %edx
	jl	.L7510
	leal	1(%rcx,%rcx), %r14d
	movslq	%r14d, %rsi
	movq	%r12, %rdi
	addq	$8, %rsi
	call	realloc@PLT
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L7471
	movl	%r14d, (%rax)
	leaq	8(%rax), %rbp
	movslq	4(%rax), %rax
	leal	1(%rax), %edx
	jmp	.L7510
	.p2align 4,,10
	.p2align 3
.L7625:
	movq	56(%rsp), %rax
	leaq	1(%r14,%rax), %rdx
	movzbl	1(%rdx), %eax
	movzbl	(%rdx), %ecx
	movzbl	2(%rdx), %edx
	sall	$8, %eax
	addl	%ecx, %eax
	sall	$16, %edx
	addl	%edx, %eax
	leal	0(,%rax,8), %edx
	xorl	%edx, %eax
	movl	%eax, %edx
	shrl	$5, %edx
	addl	%edx, %eax
	movl	%eax, %edx
	sall	$4, %edx
	xorl	%edx, %eax
	movl	%eax, %edx
	shrl	$17, %edx
	addl	%edx, %eax
	movl	%eax, %edx
	sall	$25, %edx
	xorl	%edx, %eax
	movl	%eax, %edx
	shrl	$6, %edx
	movq	24(%rsp), %rcx
	addl	%edx, %eax
	andl	$16383, %eax
	movq	(%rcx,%rax,8), %rsi
	testq	%rsi, %rsi
	je	.L7483
	movl	-4(%rsi), %eax
	testl	%eax, %eax
	jle	.L7483
	movl	20(%rsp), %ecx
	leal	-32767(%r15), %r8d
	leal	-1(%rcx), %edi
	decl	%eax
	subl	%r15d, %edi
	movslq	%r8d, %r8
	leaq	8(%rsi,%rax,8), %r9
	jmp	.L7488
	.p2align 4,,10
	.p2align 3
.L7484:
	addq	$8, %rsi
	cmpq	%r9, %rsi
	je	.L7483
.L7488:
	movq	(%rsi), %rcx
	movq	%rcx, %rax
	subq	%r14, %rax
	cmpq	%r8, %rax
	jle	.L7484
	testl	%edi, %edi
	jle	.L7484
	movl	$1, %eax
	jmp	.L7486
	.p2align 4,,10
	.p2align 3
.L7629:
	movl	%eax, %edx
	incq	%rax
	cmpl	%edx, %edi
	jle	.L7485
	cmpl	$257, %edx
	jg	.L7485
.L7486:
	movzbl	(%rbx,%rax), %r10d
	leal	-1(%rax), %edx
	cmpb	%r10b, -1(%rcx,%rax)
	je	.L7629
.L7485:
	cmpl	%edx, %ebp
	jl	.L7482
	addq	$8, %rsi
	cmpq	%r9, %rsi
	jne	.L7488
	.p2align 4,,10
	.p2align 3
.L7483:
	subq	%r12, %rbx
	movl	%ebx, %r13d
	cmpl	$32767, %ebx
	jg	.L7525
	cmpl	$258, %ebp
	jg	.L7525
	leaq	2+lengthc.26(%rip), %rdx
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L7489:
	movzwl	(%rdx), %ecx
	movslq	%eax, %r12
	leal	1(%r12), %eax
	addq	$2, %rdx
	cmpl	%ebp, %ecx
	jle	.L7489
	movl	100(%rsp), %edx
	movl	96(%rsp), %esi
	cmpl	$22, %r12d
	jg	.L7490
	movl	%eax, %edi
	leal	(%rax,%rax), %ecx
	sarl	%edi
	andl	$1, %edi
	andl	$2, %ecx
	orl	%edi, %ecx
	movl	%eax, %edi
	sarl	$2, %edi
	addl	%ecx, %ecx
	andl	$1, %edi
	orl	%ecx, %edi
	movl	%eax, %ecx
	sarl	$3, %ecx
	addl	%edi, %edi
	andl	$1, %ecx
	orl	%edi, %ecx
	addl	%ecx, %ecx
	sarl	$4, %eax
	orl	%ecx, %eax
	sall	$2, %eax
	shlx	%edx, %eax, %eax
	orl	%esi, %eax
	movl	%eax, 96(%rsp)
	addl	$7, %edx
.L7620:
	movl	%edx, 100(%rsp)
	movq	8(%rsp), %rdi
	movq	40(%rsp), %rdx
	movq	32(%rsp), %rsi
	call	stbiw__zlib_flushf
	movq	%rax, %rdi
	leaq	lengtheb.25(%rip), %rax
	movzbl	(%rax,%r12), %eax
	testb	%al, %al
	jne	.L7630
.L7492:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L7493:
	leaq	2+distc.24(%rip), %rcx
	movzwl	(%rcx,%rax,2), %edx
	movslq	%eax, %r12
	incq	%rax
	cmpl	%r13d, %edx
	jle	.L7493
	movl	%r12d, %edx
	leal	(%r12,%r12), %eax
	sarl	%edx
	andl	$1, %edx
	andl	$2, %eax
	orl	%edx, %eax
	movl	%r12d, %edx
	sarl	$2, %edx
	addl	%eax, %eax
	andl	$1, %edx
	orl	%eax, %edx
	movl	%r12d, %eax
	sarl	$3, %eax
	addl	%edx, %edx
	andl	$1, %eax
	orl	%edx, %eax
	movl	%r12d, %edx
	movl	100(%rsp), %ecx
	sarl	$4, %edx
	addl	%eax, %eax
	orl	%edx, %eax
	movq	32(%rsp), %rsi
	movq	40(%rsp), %rdx
	shlx	%ecx, %eax, %eax
	addl	$5, %ecx
	orl	%eax, 96(%rsp)
	movl	%ecx, 100(%rsp)
	call	stbiw__zlib_flushf
	movq	%rax, 8(%rsp)
	leaq	disteb.23(%rip), %rax
	movzbl	(%rax,%r12), %eax
	testb	%al, %al
	jne	.L7631
.L7494:
	addl	%ebp, %r15d
	jmp	.L7495
.L7630:
	leaq	lengthc.26(%rip), %rdx
	movzwl	(%rdx,%r12,2), %esi
	movl	100(%rsp), %ecx
	movl	%ebp, %edx
	subl	%esi, %edx
	shlx	%ecx, %edx, %edx
	movq	32(%rsp), %rsi
	orl	%edx, 96(%rsp)
	movq	40(%rsp), %rdx
	addl	%ecx, %eax
	movl	%eax, 100(%rsp)
	call	stbiw__zlib_flushf
	movq	%rax, %rdi
	jmp	.L7492
	.p2align 4,,10
	.p2align 3
.L7473:
	movl	$24, %edi
	call	malloc@PLT
	testq	%rax, %rax
	je	.L7538
	movl	$0, 4(%rax)
	xorl	%r12d, %r12d
	movl	$3, %ebp
	movl	$2, %edx
	jmp	.L7481
	.p2align 4,,10
	.p2align 3
.L7496:
	addl	$256, %eax
	movl	%eax, %edi
	leal	(%rax,%rax), %esi
	sarl	%edi
	andl	$1, %edi
	andl	$2, %esi
	orl	%edi, %esi
	movl	%eax, %edi
	sarl	$2, %edi
	addl	%esi, %esi
	andl	$1, %edi
	orl	%esi, %edi
	movl	%eax, %esi
	sarl	$3, %esi
	addl	%edi, %edi
	andl	$1, %esi
	orl	%edi, %esi
	movl	%eax, %edi
	sarl	$4, %edi
	addl	%esi, %esi
	andl	$1, %edi
	orl	%esi, %edi
	movl	%eax, %esi
	sarl	$5, %esi
	addl	%edi, %edi
	andl	$1, %esi
	orl	%edi, %esi
	sarl	$6, %eax
	addl	%esi, %esi
	andl	$1, %eax
	orl	%esi, %eax
	leal	3(,%rax,4), %eax
	shlx	%edx, %eax, %eax
	orl	%ecx, %eax
	movl	%eax, 96(%rsp)
	addl	$9, %edx
	jmp	.L7621
	.p2align 4,,10
	.p2align 3
.L7490:
	leal	169(%r12), %eax
	movl	%eax, %edi
	leal	(%rax,%rax), %ecx
	sarl	%edi
	andl	$2, %ecx
	andl	$1, %edi
	orl	%edi, %ecx
	sarl	$2, %eax
	addl	%ecx, %ecx
	andl	$1, %eax
	orl	%ecx, %eax
	sall	$5, %eax
	orl	$3, %eax
	shlx	%edx, %eax, %eax
	orl	%esi, %eax
	movl	%eax, 96(%rsp)
	addl	$8, %edx
	jmp	.L7620
.L7631:
	leaq	distc.24(%rip), %rdi
	movzwl	(%rdi,%r12,2), %esi
	movl	100(%rsp), %ecx
	movl	%ebx, %edx
	subl	%esi, %edx
	shlx	%ecx, %edx, %edx
	movq	32(%rsp), %rsi
	orl	%edx, 96(%rsp)
	movq	8(%rsp), %rdi
	movq	40(%rsp), %rdx
	addl	%ecx, %eax
	movl	%eax, 100(%rsp)
	call	stbiw__zlib_flushf
	movq	%rax, 8(%rsp)
	jmp	.L7494
.L7624:
	movq	80(%rsp), %rdx
	movq	%r8, %rdi
	leaq	(%r8,%rdx), %rsi
	call	memmove@PLT
	movq	%rax, %r8
	movl	76(%rsp), %eax
	movl	%eax, -4(%r8)
	movslq	%eax, %r11
	jmp	.L7480
.L7500:
	addl	$256, %eax
	movl	%eax, %r8d
	leal	(%rax,%rax), %esi
	sarl	%r8d
	andl	$1, %r8d
	andl	$2, %esi
	orl	%r8d, %esi
	movl	%eax, %r8d
	sarl	$2, %r8d
	addl	%esi, %esi
	andl	$1, %r8d
	orl	%esi, %r8d
	movl	%eax, %esi
	sarl	$3, %esi
	addl	%r8d, %r8d
	andl	$1, %esi
	orl	%r8d, %esi
	movl	%eax, %r8d
	sarl	$4, %r8d
	addl	%esi, %esi
	andl	$1, %r8d
	orl	%esi, %r8d
	movl	%eax, %esi
	sarl	$5, %esi
	addl	%r8d, %r8d
	andl	$1, %esi
	orl	%r8d, %esi
	sarl	$6, %eax
	addl	%esi, %esi
	andl	$1, %eax
	orl	%esi, %eax
	leal	3(,%rax,4), %eax
	shlx	%edx, %eax, %eax
	orl	%ecx, %eax
	movl	%eax, 96(%rsp)
	addl	$9, %edx
	jmp	.L7622
.L7507:
	movslq	%ebx, %rsi
	imulq	$1584310703, %rsi, %rsi
	movl	%ebx, %eax
	sarl	$31, %eax
	sarq	$43, %rsi
	subl	%eax, %esi
	imull	$5552, %esi, %eax
	movl	%ebx, %esi
	subl	%eax, %esi
	testl	%ebx, %ebx
	jle	.L7632
	testl	%esi, %esi
	jle	.L7633
.L7544:
	movl	%esi, %r8d
	xorl	%ecx, %ecx
	movl	$1, %ebx
	xorl	%r12d, %r12d
	.p2align 4,,10
	.p2align 3
.L7518:
	xorl	%eax, %eax
	addq	%r14, %rcx
	.p2align 4,,10
	.p2align 3
.L7516:
	movzbl	(%rcx,%rax), %edx
	incq	%rax
	addl	%edx, %ebx
	addl	%ebx, %r12d
	cmpl	%eax, %esi
	jg	.L7516
	movl	%ebx, %eax
	movl	$2147975281, %edx
	imulq	%rdx, %rax
	movslq	%r8d, %rcx
	shrq	$47, %rax
	imull	$65521, %eax, %eax
	subl	%eax, %ebx
	movl	%r12d, %eax
	imulq	%rdx, %rax
	shrq	$47, %rax
	imull	$65521, %eax, %eax
	subl	%eax, %r12d
.L7519:
	leal	5552(%rcx), %r8d
	movl	$5552, %esi
	leal	1(%rdi), %eax
	cmpl	%ecx, 20(%rsp)
	jg	.L7518
.L7508:
	movl	-8(%rbp), %edx
	cmpl	%eax, %edx
	jg	.L7520
	leal	1(%rdx,%rdx), %r13d
	movq	24(%rsp), %rdi
	movslq	%r13d, %rsi
	addq	$8, %rsi
	call	realloc@PLT
	movq	%rax, 24(%rsp)
	testq	%rax, %rax
	je	.L7471
	movl	4(%rax), %edi
	movl	%r13d, (%rax)
	leaq	8(%rax), %rbp
	leal	1(%rdi), %eax
.L7520:
	movl	%eax, -4(%rbp)
	movslq	%edi, %rdi
	movl	%r12d, %eax
	movb	%ah, 0(%rbp,%rdi)
	movslq	-4(%rbp), %rax
	movl	-8(%rbp), %ecx
	leal	1(%rax), %edx
	cmpl	%ecx, %edx
	jge	.L7634
.L7521:
	movl	%edx, -4(%rbp)
	movb	%r12b, 0(%rbp,%rax)
	movslq	-4(%rbp), %rax
	movl	-8(%rbp), %ecx
	leal	1(%rax), %edx
	cmpl	%ecx, %edx
	jge	.L7635
.L7522:
	movl	%edx, -4(%rbp)
	movb	%bh, 0(%rbp,%rax)
	movslq	-4(%rbp), %rax
	movl	-8(%rbp), %ecx
	leal	1(%rax), %edx
	cmpl	%ecx, %edx
	jge	.L7636
.L7534:
	movl	%edx, -4(%rbp)
	movb	%bl, 0(%rbp,%rax)
	movq	88(%rsp), %rbx
	movq	24(%rsp), %rdi
	movslq	-4(%rbp), %rdx
	movq	%rbp, %rsi
	movl	%edx, (%rbx)
	call	memmove@PLT
.L7468:
	movq	104(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L7637
	movq	24(%rsp), %rax
	addq	$120, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
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
	ret
.L7542:
	.cfi_restore_state
	xorl	%r12d, %r12d
	movl	$3, %ebp
	jmp	.L7474
.L7628:
	leal	1(%rcx,%rcx), %r14d
	movslq	%r14d, %rsi
	movq	%r12, %rdi
	addq	$8, %rsi
	call	realloc@PLT
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L7471
	movl	%r14d, (%rax)
	leaq	8(%rax), %rbp
	movslq	4(%rax), %rax
	leal	1(%rax), %edx
	jmp	.L7529
.L7627:
	leal	1(%rcx,%rcx), %r14d
	movslq	%r14d, %rsi
	movq	%r12, %rdi
	addq	$8, %rsi
	call	realloc@PLT
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L7471
	movl	%r14d, (%rax)
	leaq	8(%rax), %rbp
	movslq	4(%rax), %rax
	leal	1(%rax), %edx
	jmp	.L7512
.L7626:
	leal	1(%rcx,%rcx), %r14d
	movslq	%r14d, %rsi
	movq	%r12, %rdi
	addq	$8, %rsi
	call	realloc@PLT
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L7471
	movl	%r14d, (%rax)
	leaq	8(%rax), %rbp
	movslq	4(%rax), %rax
	leal	1(%rax), %edx
	jmp	.L7511
.L7617:
	movslq	20(%rsp), %rsi
	movq	%r12, 24(%rsp)
	movq	%rsi, %rbx
	imulq	$1584310703, %rsi, %rsi
	movl	%ebx, %eax
	sarl	$31, %eax
	sarq	$43, %rsi
	subl	%eax, %esi
	imull	$5552, %esi, %eax
	movq	(%rsp), %r14
	subl	%eax, %ebx
	movl	%ebx, %esi
	testl	%esi, %esi
	jg	.L7544
.L7633:
	movslq	%esi, %rcx
	xorl	%r12d, %r12d
	movl	$1, %ebx
	jmp	.L7519
.L7636:
	leal	1(%rcx,%rcx), %r12d
	movq	24(%rsp), %rdi
	movslq	%r12d, %rsi
	addq	$8, %rsi
	call	realloc@PLT
	movq	%rax, 24(%rsp)
	testq	%rax, %rax
	je	.L7471
	movl	%r12d, (%rax)
	leaq	8(%rax), %rbp
	movslq	4(%rax), %rax
	leal	1(%rax), %edx
	jmp	.L7534
.L7635:
	leal	1(%rcx,%rcx), %r12d
	movq	24(%rsp), %rdi
	movslq	%r12d, %rsi
	addq	$8, %rsi
	call	realloc@PLT
	movq	%rax, 24(%rsp)
	testq	%rax, %rax
	je	.L7471
	movl	%r12d, (%rax)
	leaq	8(%rax), %rbp
	movslq	4(%rax), %rax
	leal	1(%rax), %edx
	jmp	.L7522
.L7634:
	leal	1(%rcx,%rcx), %r13d
	movq	24(%rsp), %rdi
	movslq	%r13d, %rsi
	addq	$8, %rsi
	call	realloc@PLT
	movq	%rax, 24(%rsp)
	testq	%rax, %rax
	je	.L7471
	movl	%r13d, (%rax)
	leaq	8(%rax), %rbp
	movslq	4(%rax), %rax
	leal	1(%rax), %edx
	jmp	.L7521
.L7632:
	leal	1(%rdi), %eax
	xorl	%r12d, %r12d
	movl	$1, %ebx
	jmp	.L7508
.L7541:
	xorl	%r15d, %r15d
	jmp	.L7472
.L7543:
	movl	$3, %eax
	movl	$2, %edi
	xorl	%r12d, %r12d
	movl	$1, %ebx
	jmp	.L7508
.L7525:
	leaq	__PRETTY_FUNCTION__.27(%rip), %rcx
	movl	$959, %edx
	leaq	.LC12(%rip), %rsi
	leaq	.LC380(%rip), %rdi
	call	__assert_fail@PLT
.L7538:
	leaq	__PRETTY_FUNCTION__.22(%rip), %rcx
	movl	$830, %edx
	leaq	.LC12(%rip), %rsi
	leaq	.LC117(%rip), %rdi
	call	__assert_fail@PLT
.L7471:
	call	stbiw__sbgrowf.part.0
.L7637:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE818:
	.size	stbi_zlib_compress, .-stbi_zlib_compress
	.section	.rodata.str1.1
.LC384:
	.string	"o == out + *out_len"
	.text
	.p2align 4
	.globl	stbi_write_png_to_mem
	.type	stbi_write_png_to_mem, @function
stbi_write_png_to_mem:
.LFB823:
	.cfi_startproc
	endbr64
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	pushq	-8(%r10)
	pushq	%rbp
	movq	%rsp, %rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	pushq	%r15
	pushq	%r14
	pushq	%r13
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	movl	%ecx, %r13d
	pushq	%r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	pushq	%rbx
	subq	$160, %rsp
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movq	%rdi, -136(%rbp)
	movl	%edx, -120(%rbp)
	movl	%r8d, -124(%rbp)
	movq	%r9, -184(%rbp)
	imull	%r8d, %edx
	vmovdqa	.LC381(%rip), %xmm0
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	movl	stbi_write_force_png_filter(%rip), %eax
	testl	%esi, %esi
	cmove	%edx, %esi
	movl	$6, -64(%rbp)
	movl	%esi, -128(%rbp)
	vmovdqa	%xmm0, -80(%rbp)
	cmpl	$5, %eax
	movl	%eax, %ebx
	movl	$-1, %eax
	cmovl	%ebx, %eax
	leal	1(%rdx), %ebx
	movl	%eax, -140(%rbp)
	movl	%ebx, %eax
	imull	%ecx, %eax
	movl	%edx, %r14d
	movslq	%eax, %rdi
	movl	%eax, -152(%rbp)
	call	malloc@PLT
	movq	%rax, -176(%rbp)
	testq	%rax, %rax
	je	.L7641
	movslq	%r14d, %rax
	movq	%rax, %rdi
	movq	%rax, -160(%rbp)
	call	malloc@PLT
	movq	%rax, %r15
	testq	%rax, %rax
	je	.L7642
	testl	%r13d, %r13d
	jle	.L7656
	movslq	%ebx, %rax
	movq	%rax, -168(%rbp)
	movq	-176(%rbp), %rax
	xorl	%r12d, %r12d
	incq	%rax
	movq	%rax, -112(%rbp)
	leal	-1(%r14), %eax
	movl	%eax, -144(%rbp)
	movl	%r14d, %eax
	shrl	$5, %eax
	leal	-1(%rax), %ebx
	movl	%r14d, %eax
	andl	$-32, %eax
	incq	%rbx
	movl	%eax, -148(%rbp)
	salq	$5, %rbx
	movq	%r15, %rax
	addq	%r15, %rbx
	movl	%r14d, %r15d
	movq	%rax, %r14
	jmp	.L7655
	.p2align 4,,10
	.p2align 3
.L7685:
	pushq	%r14
	movl	-124(%rbp), %r9d
	movl	-120(%rbp), %edx
	pushq	%rax
	movl	-128(%rbp), %esi
	movq	-136(%rbp), %rdi
	movl	%r12d, %r8d
	movl	%r13d, %ecx
	call	stbiw__encode_png_line
	movl	-140(%rbp), %eax
	popq	%r8
	movl	%eax, -104(%rbp)
	popq	%r9
.L7647:
	movq	-112(%rbp), %rax
	movzbl	-104(%rbp), %ecx
	movq	-160(%rbp), %rdx
	movb	%cl, -1(%rax)
	movq	%r14, %rsi
	movq	%rax, %rdi
	call	memcpy@PLT
	movq	-168(%rbp), %rcx
	incl	%r12d
	addq	%rcx, -112(%rbp)
	cmpl	%r12d, %r13d
	je	.L7684
.L7655:
	movl	-140(%rbp), %eax
	testl	%eax, %eax
	jns	.L7685
	movl	$2147483647, -116(%rbp)
	movl	$0, -104(%rbp)
	xorl	%eax, %eax
	movl	%r12d, %r8d
	movl	%r15d, %r12d
	movl	%eax, %r15d
.L7646:
	pushq	%r14
	movl	-128(%rbp), %esi
	movq	-136(%rbp), %rdi
	pushq	%r15
	movl	-124(%rbp), %r9d
	movl	-120(%rbp), %edx
	movl	%r13d, %ecx
	movl	%r8d, -100(%rbp)
	call	stbiw__encode_png_line
	popq	%rsi
	testl	%r12d, %r12d
	movl	-100(%rbp), %r8d
	popq	%rdi
	jle	.L7662
	cmpl	$30, -144(%rbp)
	jbe	.L7663
	movq	%r14, %rdx
	vpxor	%xmm0, %xmm0, %xmm0
	.p2align 4,,10
	.p2align 3
.L7650:
	vpabsb	(%rdx), %ymm2
	vpmovzxbw	%xmm2, %ymm3
	vpmovzxwd	%xmm3, %ymm1
	vextracti128	$0x1, %ymm2, %xmm2
	vextracti128	$0x1, %ymm3, %xmm3
	vpmovzxbw	%xmm2, %ymm2
	vpaddd	%ymm0, %ymm1, %ymm0
	vpmovzxwd	%xmm3, %ymm3
	vpaddd	%ymm0, %ymm3, %ymm3
	vpmovzxwd	%xmm2, %ymm0
	vextracti128	$0x1, %ymm2, %xmm2
	vpaddd	%ymm3, %ymm0, %ymm0
	vpmovzxwd	%xmm2, %ymm2
	addq	$32, %rdx
	vpaddd	%ymm0, %ymm2, %ymm0
	cmpq	%rdx, %rbx
	jne	.L7650
	vextracti128	$0x1, %ymm0, %xmm1
	vpaddd	%xmm0, %xmm1, %xmm0
	vpsrldq	$8, %xmm0, %xmm1
	vpaddd	%xmm1, %xmm0, %xmm0
	vpsrldq	$4, %xmm0, %xmm1
	movl	-148(%rbp), %eax
	vpaddd	%xmm1, %xmm0, %xmm0
	vmovd	%xmm0, %edx
	cmpl	%r12d, %eax
	je	.L7682
	movl	%eax, %esi
	movl	%eax, %ecx
	vzeroupper
.L7649:
	movl	%r12d, %edi
	subl	%esi, %edi
	leal	-1(%rdi), %r9d
	cmpl	$14, %r9d
	jbe	.L7652
	vpabsb	(%r14,%rsi), %xmm0
	vpmovzxbw	%xmm0, %xmm2
	vpsrldq	$8, %xmm2, %xmm1
	vpsrldq	$8, %xmm0, %xmm0
	vpmovzxbw	%xmm0, %xmm0
	vpmovzxwd	%xmm2, %xmm2
	vpmovzxwd	%xmm1, %xmm1
	vpaddd	%xmm2, %xmm1, %xmm1
	vpmovzxwd	%xmm0, %xmm2
	vpsrldq	$8, %xmm0, %xmm0
	vpaddd	%xmm1, %xmm2, %xmm1
	vpmovzxwd	%xmm0, %xmm0
	vpaddd	%xmm1, %xmm0, %xmm0
	vpsrldq	$8, %xmm0, %xmm1
	vpaddd	%xmm1, %xmm0, %xmm0
	vpsrldq	$4, %xmm0, %xmm1
	vpaddd	%xmm1, %xmm0, %xmm0
	vmovd	%xmm0, %esi
	addl	%esi, %edx
	movl	%edi, %esi
	andl	$-16, %esi
	addl	%esi, %ecx
	cmpl	%edi, %esi
	je	.L7648
.L7652:
	movslq	%ecx, %rsi
	movzbl	(%r14,%rsi), %esi
	movl	%esi, %edi
	sarb	$7, %dil
	xorl	%edi, %esi
	subl	%edi, %esi
	movzbl	%sil, %esi
	addl	%esi, %edx
	leal	1(%rcx), %esi
	cmpl	%esi, %r12d
	jle	.L7648
	movslq	%esi, %rsi
	movzbl	(%r14,%rsi), %esi
	movl	%esi, %edi
	sarb	$7, %dil
	xorl	%edi, %esi
	subl	%edi, %esi
	movzbl	%sil, %esi
	addl	%esi, %edx
	leal	2(%rcx), %esi
	cmpl	%esi, %r12d
	jle	.L7648
	movslq	%esi, %rsi
	movzbl	(%r14,%rsi), %esi
	movl	%esi, %edi
	sarb	$7, %dil
	xorl	%edi, %esi
	subl	%edi, %esi
	movzbl	%sil, %esi
	addl	%esi, %edx
	leal	3(%rcx), %esi
	cmpl	%esi, %r12d
	jle	.L7648
	movslq	%esi, %rsi
	movzbl	(%r14,%rsi), %esi
	movl	%esi, %edi
	sarb	$7, %dil
	xorl	%edi, %esi
	subl	%edi, %esi
	movzbl	%sil, %esi
	addl	%esi, %edx
	leal	4(%rcx), %esi
	cmpl	%esi, %r12d
	jle	.L7648
	movslq	%esi, %rsi
	movzbl	(%r14,%rsi), %esi
	movl	%esi, %edi
	sarb	$7, %dil
	xorl	%edi, %esi
	subl	%edi, %esi
	movzbl	%sil, %esi
	addl	%esi, %edx
	leal	5(%rcx), %esi
	cmpl	%esi, %r12d
	jle	.L7648
	movslq	%esi, %rsi
	movzbl	(%r14,%rsi), %esi
	movl	%esi, %edi
	sarb	$7, %dil
	xorl	%edi, %esi
	subl	%edi, %esi
	movzbl	%sil, %esi
	addl	%esi, %edx
	leal	6(%rcx), %esi
	cmpl	%esi, %r12d
	jle	.L7648
	movslq	%esi, %rsi
	movzbl	(%r14,%rsi), %esi
	movl	%esi, %edi
	sarb	$7, %dil
	xorl	%edi, %esi
	subl	%edi, %esi
	movzbl	%sil, %esi
	addl	%esi, %edx
	leal	7(%rcx), %esi
	cmpl	%esi, %r12d
	jle	.L7648
	movslq	%esi, %rsi
	movzbl	(%r14,%rsi), %esi
	movl	%esi, %edi
	sarb	$7, %dil
	xorl	%edi, %esi
	subl	%edi, %esi
	movzbl	%sil, %esi
	addl	%esi, %edx
	leal	8(%rcx), %esi
	cmpl	%esi, %r12d
	jle	.L7648
	movslq	%esi, %rsi
	movzbl	(%r14,%rsi), %esi
	movl	%esi, %edi
	sarb	$7, %dil
	xorl	%edi, %esi
	subl	%edi, %esi
	movzbl	%sil, %esi
	addl	%esi, %edx
	leal	9(%rcx), %esi
	cmpl	%esi, %r12d
	jle	.L7648
	movslq	%esi, %rsi
	movzbl	(%r14,%rsi), %esi
	movl	%esi, %edi
	sarb	$7, %dil
	xorl	%edi, %esi
	subl	%edi, %esi
	movzbl	%sil, %esi
	addl	%esi, %edx
	leal	10(%rcx), %esi
	cmpl	%esi, %r12d
	jle	.L7648
	movslq	%esi, %rsi
	movzbl	(%r14,%rsi), %esi
	movl	%esi, %edi
	sarb	$7, %dil
	xorl	%edi, %esi
	subl	%edi, %esi
	movzbl	%sil, %esi
	addl	%esi, %edx
	leal	11(%rcx), %esi
	cmpl	%esi, %r12d
	jle	.L7648
	movslq	%esi, %rsi
	movzbl	(%r14,%rsi), %esi
	movl	%esi, %edi
	sarb	$7, %dil
	xorl	%edi, %esi
	subl	%edi, %esi
	movzbl	%sil, %esi
	addl	%esi, %edx
	leal	12(%rcx), %esi
	cmpl	%esi, %r12d
	jle	.L7648
	movslq	%esi, %rsi
	movzbl	(%r14,%rsi), %esi
	movl	%esi, %edi
	sarb	$7, %dil
	xorl	%edi, %esi
	subl	%edi, %esi
	movzbl	%sil, %esi
	addl	%esi, %edx
	leal	13(%rcx), %esi
	cmpl	%esi, %r12d
	jle	.L7648
	movslq	%esi, %rsi
	movzbl	(%r14,%rsi), %esi
	addl	$14, %ecx
	movl	%esi, %edi
	sarb	$7, %dil
	xorl	%edi, %esi
	subl	%edi, %esi
	movzbl	%sil, %esi
	addl	%esi, %edx
	cmpl	%ecx, %r12d
	jle	.L7648
	movslq	%ecx, %rcx
	movzbl	(%r14,%rcx), %ecx
	movl	%ecx, %esi
	sarb	$7, %sil
	xorl	%esi, %ecx
	subl	%esi, %ecx
	movzbl	%cl, %ecx
	addl	%ecx, %edx
	.p2align 4,,10
	.p2align 3
.L7648:
	cmpl	%edx, -116(%rbp)
	jle	.L7654
	movl	%edx, -116(%rbp)
	movl	%r15d, -104(%rbp)
.L7654:
	incl	%r15d
	cmpl	$5, %r15d
	jne	.L7646
	movl	-104(%rbp), %eax
	movl	%r12d, %r15d
	movl	%r8d, %r12d
	cmpl	$5, %eax
	je	.L7647
	pushq	%r14
	movl	-120(%rbp), %edx
	movl	-124(%rbp), %r9d
	pushq	%rax
	movl	-128(%rbp), %esi
	movq	-136(%rbp), %rdi
	movl	%r13d, %ecx
	call	stbiw__encode_png_line
	popq	%rdx
	popq	%rcx
	jmp	.L7647
	.p2align 4,,10
	.p2align 3
.L7662:
	xorl	%edx, %edx
	jmp	.L7648
.L7663:
	xorl	%esi, %esi
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	jmp	.L7649
.L7684:
	movq	%r14, %r15
.L7656:
	movq	%r15, %rdi
	call	free@PLT
	movq	-176(%rbp), %rbx
	movl	stbi_write_png_compression_level(%rip), %ecx
	movl	-152(%rbp), %esi
	movq	%rbx, %rdi
	leaq	-84(%rbp), %rdx
	call	stbi_zlib_compress
	movq	%rax, %r12
	movq	%rbx, %rdi
	call	free@PLT
	testq	%r12, %r12
	je	.L7641
	movslq	-84(%rbp), %r14
	movbel	-84(%rbp), %r10d
	leal	57(%r14), %ebx
	movslq	%ebx, %rdi
	movl	%r10d, -100(%rbp)
	call	malloc@PLT
	movq	%rax, %r15
	testq	%rax, %rax
	je	.L7641
	movq	-184(%rbp), %rax
	movl	%r13d, %esi
	movl	%ebx, (%rax)
	movabsq	$727905341920923785, %rax
	movq	%rax, (%r15)
	movq	.LC382(%rip), %rax
	sarl	$8, %esi
	movq	%rax, 8(%r15)
	movzbl	%r13b, %eax
	movzbl	%sil, %r11d
	movl	%r13d, %edi
	salq	$8, %rax
	sarl	$16, %edi
	orq	%r11, %rax
	movl	%r13d, %ecx
	movzbl	%dil, %r11d
	salq	$8, %rax
	orq	%r11, %rax
	sarl	$24, %ecx
	movl	-120(%rbp), %r10d
	movzbl	%cl, %ecx
	salq	$8, %rax
	orq	%rcx, %rax
	movl	%r10d, %r8d
	movzbl	%r10b, %ecx
	salq	$8, %rax
	sarl	$8, %r8d
	orq	%rcx, %rax
	movl	%r10d, %r9d
	movzbl	%r8b, %ecx
	salq	$8, %rax
	sarl	$16, %r9d
	orq	%rcx, %rax
	movl	%r10d, %edx
	movzbl	%r9b, %ecx
	salq	$8, %rax
	sarl	$24, %edx
	orq	%rcx, %rax
	salq	$8, %rax
	movzbl	%dl, %ecx
	orq	%rcx, %rax
	movq	%rax, 16(%r15)
	movslq	-124(%rbp), %rax
	xorl	$-11, %edx
	movl	-80(%rbp,%rax,4), %ecx
	xorl	%eax, %eax
	leaq	crc_table.18(%rip), %rbx
	movw	%ax, 26(%r15)
	movzbl	%dl, %eax
	movl	(%rbx,%rax,4), %edx
	movb	%cl, 25(%r15)
	xorl	$5725777, %edx
	movl	%edx, %eax
	xorl	%r9d, %edx
	shrl	$8, %eax
	movzbl	%dl, %edx
	xorl	(%rbx,%rdx,4), %eax
	movl	%eax, %edx
	xorl	%r8d, %eax
	shrl	$8, %edx
	movzbl	%al, %eax
	xorl	(%rbx,%rax,4), %edx
	movl	%edx, %eax
	xorl	%r10d, %eax
	shrl	$8, %edx
	movzbl	%al, %eax
	xorl	(%rbx,%rax,4), %edx
	movl	%edx, %eax
	movl	%r13d, %r8d
	shrl	$8, %eax
	shrl	$24, %r8d
	xorl	%r8d, %edx
	movzbl	%dl, %edx
	xorl	(%rbx,%rdx,4), %eax
	movl	%eax, %edx
	xorl	%edi, %eax
	movzbl	%al, %eax
	shrl	$8, %edx
	xorl	(%rbx,%rax,4), %edx
	movl	%edx, %eax
	xorl	%esi, %edx
	movzbl	%dl, %edx
	shrl	$8, %eax
	xorl	(%rbx,%rdx,4), %eax
	movl	%eax, %edx
	xorl	%r13d, %eax
	movzbl	%al, %eax
	shrl	$8, %edx
	xorl	(%rbx,%rax,4), %edx
	movl	%edx, %eax
	movzbl	%dl, %edx
	xorq	$8, %rdx
	shrl	$8, %eax
	xorl	(%rbx,%rdx,4), %eax
	movl	%eax, %edx
	xorl	%ecx, %eax
	movzbl	%al, %eax
	shrl	$8, %edx
	xorl	(%rbx,%rax,4), %edx
	movl	%edx, %eax
	movzbl	%al, %eax
	shrl	$8, %edx
	xorl	(%rbx,%rax,4), %edx
	movl	%edx, %eax
	shrl	$8, %eax
	movzbl	%dl, %edx
	xorl	(%rbx,%rdx,4), %eax
	movl	%eax, %edx
	shrl	$8, %edx
	movzbl	%al, %eax
	xorl	(%rbx,%rax,4), %edx
	movl	-100(%rbp), %r10d
	movl	%edx, %eax
	notl	%eax
	movl	%r10d, 33(%r15)
	movb	$8, 24(%r15)
	movb	$0, 28(%r15)
	movbel	%eax, 29(%r15)
	movl	$1413563465, 37(%r15)
	leaq	41(%r15), %r13
	movq	%r14, %rdx
	movq	%r13, %rdi
	movq	%r12, %rsi
	call	memmove@PLT
	movq	%r12, %rdi
	call	free@PLT
	movslq	-84(%rbp), %rcx
	movq	$-4, %rdx
	addq	%r14, %r13
	movq	%rcx, %rax
	subq	%rcx, %rdx
	cmpl	$-3, %ecx
	jl	.L7664
	movq	%r13, %rsi
	addl	$3, %eax
	subq	%rcx, %rsi
	leaq	-3(%rsi,%rax), %rsi
	addq	%r13, %rdx
	movl	$-1, %eax
	.p2align 4,,10
	.p2align 3
.L7658:
	movl	%eax, %ecx
	xorb	(%rdx), %al
	movzbl	%al, %eax
	shrl	$8, %ecx
	xorl	(%rbx,%rax,4), %ecx
	incq	%rdx
	movl	%ecx, %eax
	cmpq	%rdx, %rsi
	jne	.L7658
	notl	%eax
	movl	%eax, %ebx
	shrl	$24, %ebx
	movl	%eax, %edx
	movl	%ebx, %esi
	shrl	$16, %edx
	movzbl	%ah, %ecx
.L7657:
	movb	%al, 3(%r13)
	movq	.LC383(%rip), %rax
	movb	%sil, 0(%r13)
	movq	%rax, 4(%r13)
	movq	-184(%rbp), %rax
	movb	%dl, 1(%r13)
	movslq	(%rax), %rax
	movb	%cl, 2(%r13)
	movl	$-2107620690, 12(%r13)
	addq	%r15, %rax
	addq	$16, %r13
	cmpq	%r13, %rax
	jne	.L7686
.L7638:
	movq	-56(%rbp), %rax
	subq	%fs:40, %rax
	jne	.L7687
	leaq	-48(%rbp), %rsp
	popq	%rbx
	popq	%r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%r13
	popq	%r14
	movq	%r15, %rax
	popq	%r15
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
.L7682:
	.cfi_restore_state
	vzeroupper
	jmp	.L7648
.L7641:
	xorl	%r15d, %r15d
	jmp	.L7638
.L7664:
	xorl	%eax, %eax
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	xorl	%esi, %esi
	jmp	.L7657
.L7686:
	leaq	__PRETTY_FUNCTION__.21(%rip), %rcx
	movl	$1209, %edx
	leaq	.LC12(%rip), %rsi
	leaq	.LC384(%rip), %rdi
	call	__assert_fail@PLT
.L7642:
	movq	-176(%rbp), %rdi
	call	free@PLT
	jmp	.L7638
.L7687:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE823:
	.size	stbi_write_png_to_mem, .-stbi_write_png_to_mem
	.p2align 4
	.globl	stbi_write_png
	.type	stbi_write_png, @function
stbi_write_png:
.LFB824:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	movl	%esi, %r10d
	movl	%r9d, %esi
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movq	%rdi, %r12
	movq	%r8, %rdi
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movl	%ecx, %r8d
	movl	%edx, %ecx
	subq	$16, %rsp
	.cfi_def_cfa_offset 48
	leaq	4(%rsp), %r9
	movl	%r10d, %edx
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	call	stbi_write_png_to_mem
	xorl	%r13d, %r13d
	testq	%rax, %rax
	je	.L7688
	movq	%r12, %rdi
	leaq	.LC379(%rip), %rsi
	movq	%rax, %rbp
	call	fopen@PLT
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L7695
	movslq	4(%rsp), %rdx
	movq	%rax, %rcx
	movl	$1, %esi
	movq	%rbp, %rdi
	call	fwrite@PLT
	movq	%r12, %rdi
	call	fclose@PLT
	movq	%rbp, %rdi
	call	free@PLT
	movl	$1, %r13d
.L7688:
	movq	8(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L7696
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	movl	%r13d, %eax
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
.L7696:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
.L7695:
	movq	%rbp, %rdi
	call	free@PLT
	jmp	.L7688
	.cfi_endproc
.LFE824:
	.size	stbi_write_png, .-stbi_write_png
	.p2align 4
	.globl	stbi_write_png_to_func
	.type	stbi_write_png_to_func, @function
stbi_write_png_to_func:
.LFB825:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movq	%rsi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rdi, %rbx
	movq	%r9, %rdi
	subq	$16, %rsp
	.cfi_def_cfa_offset 48
	movl	48(%rsp), %esi
	leaq	4(%rsp), %r9
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	call	stbi_write_png_to_mem
	testq	%rax, %rax
	je	.L7700
	movl	4(%rsp), %edx
	movq	%rax, %rbp
	movq	%rax, %rsi
	movq	%r12, %rdi
	call	*%rbx
	movq	%rbp, %rdi
	call	free@PLT
	movl	$1, %eax
.L7697:
	movq	8(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L7702
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L7700:
	.cfi_restore_state
	xorl	%eax, %eax
	jmp	.L7697
.L7702:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE825:
	.size	stbi_write_png_to_func, .-stbi_write_png_to_func
	.p2align 4
	.globl	stbi_write_jpg_to_func
	.type	stbi_write_jpg_to_func, @function
stbi_write_jpg_to_func:
.LFB831:
	.cfi_startproc
	endbr64
	subq	$104, %rsp
	.cfi_def_cfa_offset 112
	vpxor	%xmm0, %xmm0, %xmm0
	movq	%fs:40, %rax
	movq	%rax, 88(%rsp)
	xorl	%eax, %eax
	movq	$0, 80(%rsp)
	movq	%rdi, (%rsp)
	movq	%rsi, 8(%rsp)
	vmovdqa	%xmm0, 16(%rsp)
	vmovdqa	%xmm0, 32(%rsp)
	vmovdqa	%xmm0, 48(%rsp)
	vmovdqa	%xmm0, 64(%rsp)
	testq	%r9, %r9
	je	.L7707
	movl	%edx, %esi
	testl	%edx, %edx
	je	.L7707
	leal	-1(%r8), %eax
	movl	%ecx, %edx
	movl	%r8d, %ecx
	cmpl	$3, %eax
	ja	.L7707
	testl	%edx, %edx
	je	.L7707
	movq	%r9, %r8
	movl	112(%rsp), %r9d
	movq	%rsp, %rdi
	call	stbi_write_jpg_core.part.0
	jmp	.L7703
	.p2align 4,,10
	.p2align 3
.L7707:
	xorl	%eax, %eax
.L7703:
	movq	88(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L7709
	addq	$104, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L7709:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE831:
	.size	stbi_write_jpg_to_func, .-stbi_write_jpg_to_func
	.p2align 4
	.globl	stbi_write_jpg
	.type	stbi_write_jpg, @function
stbi_write_jpg:
.LFB832:
	.cfi_startproc
	endbr64
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	vpxor	%xmm0, %xmm0, %xmm0
	movl	%ecx, %r14d
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movl	%r9d, %r13d
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	movl	%edx, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movl	%esi, %ebp
	leaq	.LC379(%rip), %rsi
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movq	%r8, %rbx
	subq	$96, %rsp
	.cfi_def_cfa_offset 144
	movq	%fs:40, %rax
	movq	%rax, 88(%rsp)
	xorl	%eax, %eax
	movq	$0, 80(%rsp)
	vmovdqa	%xmm0, (%rsp)
	vmovdqa	%xmm0, 16(%rsp)
	vmovdqa	%xmm0, 32(%rsp)
	vmovdqa	%xmm0, 48(%rsp)
	vmovdqa	%xmm0, 64(%rsp)
	call	fopen@PLT
	movq	%rax, %rdi
	leaq	stbi__stdio_write(%rip), %rax
	movq	%rax, (%rsp)
	movq	%rdi, 8(%rsp)
	testq	%rdi, %rdi
	je	.L7714
	testq	%rbx, %rbx
	je	.L7716
	testl	%ebp, %ebp
	je	.L7716
	leal	-1(%r14), %eax
	cmpl	$3, %eax
	ja	.L7716
	testl	%r12d, %r12d
	je	.L7716
	movq	%rsp, %rdi
	movl	%r12d, %edx
	movl	%r13d, %r9d
	movq	%rbx, %r8
	movl	%r14d, %ecx
	movl	%ebp, %esi
	call	stbi_write_jpg_core.part.0
	movl	%eax, %r12d
	movq	8(%rsp), %rdi
	jmp	.L7712
	.p2align 4,,10
	.p2align 3
.L7716:
	xorl	%r12d, %r12d
.L7712:
	call	fclose@PLT
.L7710:
	movq	88(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L7718
	addq	$96, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	movl	%r12d, %eax
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
.L7714:
	.cfi_restore_state
	xorl	%r12d, %r12d
	jmp	.L7710
.L7718:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE832:
	.size	stbi_write_jpg, .-stbi_write_jpg
	.section	.rodata.str1.8
	.align 8
.LC385:
	.string	"Usage: %s <image1> [<image2> ...]\n"
	.section	.rodata.str1.1
.LC386:
	.string	"[info] Processing %s\n"
.LC387:
	.string	"Image could not be opened"
.LC388:
	.string	"Could not allocate memory"
.LC389:
	.string	"%s_grey.jpg"
	.section	.rodata.str1.8
	.align 8
.LC390:
	.string	"[info] %s: width=%d, height=%d, nchannels=%d\n"
	.align 8
.LC391:
	.string	"[error] Num of channels=%d not supported. Only three (RGB), four (RGBA) are supported.\n"
	.section	.rodata.str1.1
.LC396:
	.string	"Tiempo: %f\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB834:
	.cfi_startproc
	endbr64
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
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$344, %rsp
	.cfi_def_cfa_offset 400
	movq	%fs:40, %rax
	movq	%rax, 328(%rsp)
	xorl	%eax, %eax
	cmpl	$1, %edi
	jle	.L7751
	leal	-2(%rdi), %eax
	leaq	16(%rsi,%rax,8), %rax
	movq	%rax, 8(%rsp)
	leaq	56(%rsp), %rax
	movq	%rax, 16(%rsp)
	leaq	8(%rsi), %rbx
	leaq	.LC386(%rip), %r15
	leaq	.LC375(%rip), %r14
	.p2align 4,,10
	.p2align 3
.L7740:
	movq	(%rbx), %rdx
	movq	%r15, %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movq	(%rbx), %rdi
	movq	%r14, %rsi
	call	fopen@PLT
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L7752
	movq	16+stbi__stdio_callbacks(%rip), %rax
	leaq	152(%rsp), %r12
	vmovdqa	stbi__stdio_callbacks(%rip), %xmm6
	movq	%rax, 128(%rsp)
	movl	$128, %edx
	movabsq	$549755813889, %rax
	movq	%r12, %rsi
	movq	%rbp, %rdi
	movq	%rbp, 136(%rsp)
	movq	%rax, 144(%rsp)
	movl	$0, 280(%rsp)
	movq	%r12, 304(%rsp)
	movq	%r12, 288(%rsp)
	vmovdqa	%xmm6, 112(%rsp)
	call	stbi__stdio_read
	movq	288(%rsp), %rdx
	subq	304(%rsp), %rdx
	addl	%edx, 280(%rsp)
	testl	%eax, %eax
	jne	.L7724
	movl	$0, 144(%rsp)
	movb	$0, 152(%rsp)
	leaq	153(%rsp), %rax
.L7725:
	leaq	96(%rsp), %rdi
	leaq	52(%rsp), %rcx
	leaq	48(%rsp), %rdx
	leaq	44(%rsp), %rsi
	movl	$4, %r8d
	movq	%r12, 288(%rsp)
	movq	%rax, 296(%rsp)
	movq	%rax, 312(%rsp)
	call	stbi__load_and_postprocess_8bit
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L7726
	movl	288(%rsp), %esi
	movq	%rbp, %rdi
	subl	296(%rsp), %esi
	movslq	%esi, %rsi
	movl	$1, %edx
	call	fseek@PLT
	movq	%rbp, %rdi
	call	fclose@PLT
.L7727:
	movl	44(%rsp), %edi
	imull	48(%rsp), %edi
	movslq	%edi, %rdi
	call	malloc@PLT
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L7753
.L7728:
	movq	(%rbx), %r13
	movq	%r13, %rdi
	call	strlen@PLT
	decl	%eax
	js	.L7729
	cltq
	jmp	.L7731
	.p2align 4,,10
	.p2align 3
.L7730:
	decq	%rax
	testl	%eax, %eax
	js	.L7729
.L7731:
	cmpb	$46, 0(%r13,%rax)
	leaq	0(%r13,%rax), %rcx
	jne	.L7730
	movb	$0, (%rcx)
	movq	(%rbx), %r13
.L7729:
	movq	16(%rsp), %rdi
	xorl	%eax, %eax
	movq	%r13, %rdx
	leaq	.LC389(%rip), %rsi
	movq	$0, 56(%rsp)
	call	asprintf@PLT
	cmpq	$0, 56(%rsp)
	je	.L7754
	movq	(%rbx), %rdx
	movl	52(%rsp), %r9d
	movl	48(%rsp), %r8d
	movl	44(%rsp), %ecx
	leaq	.LC390(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	52(%rsp), %edx
	leal	-3(%rdx), %eax
	cmpl	$1, %eax
	jbe	.L7733
	leaq	.LC391(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
.L7734:
	addq	$8, %rbx
	cmpq	%rbx, 8(%rsp)
	jne	.L7740
.L7721:
	movq	328(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L7755
	addq	$344, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
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
	xorl	%eax, %eax
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L7724:
	.cfi_restore_state
	cltq
	addq	%r12, %rax
	jmp	.L7725
	.p2align 4,,10
	.p2align 3
.L7733:
	leaq	80(%rsp), %rdi
	xorl	%esi, %esi
	call	gettimeofday@PLT
#APP
# 78 "greyScale.c" 1
	#inicio_bucle
# 0 "" 2
#NO_APP
	movl	44(%rsp), %eax
	vxorps	%xmm2, %xmm2, %xmm2
	testl	%eax, %eax
	jle	.L7735
	movl	48(%rsp), %r8d
	testl	%r8d, %r8d
	jle	.L7735
	movslq	%eax, %rsi
	vmovsd	.LC392(%rip), %xmm5
	sall	$2, %eax
	vmovsd	.LC393(%rip), %xmm4
	vmovsd	.LC394(%rip), %xmm3
	movq	%r12, %r10
	movslq	%eax, %rdi
	xorl	%r9d, %r9d
	.p2align 4,,10
	.p2align 3
.L7736:
	leaq	0(%rbp,%r9), %rcx
	movq	%r10, %rax
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L7737:
	movzbl	(%rax), %r11d
	incl	%edx
	vcvtsi2sdl	%r11d, %xmm2, %xmm0
	movzbl	1(%rax), %r11d
	vcvtsi2sdl	%r11d, %xmm2, %xmm1
	movzbl	2(%rax), %r11d
	addq	%rdi, %rax
	vmulsd	%xmm5, %xmm1, %xmm1
	vfmadd231sd	%xmm4, %xmm0, %xmm1
	vcvtsi2sdl	%r11d, %xmm2, %xmm0
	vfmadd132sd	%xmm3, %xmm1, %xmm0
	vcvttsd2sil	%xmm0, %r11d
	movb	%r11b, (%rcx)
	addq	%rsi, %rcx
	cmpl	%r8d, %edx
	jne	.L7737
	incq	%r9
	addq	$4, %r10
	cmpq	%r9, %rsi
	jne	.L7736
.L7735:
#APP
# 97 "greyScale.c" 1
	#final_bucle
# 0 "" 2
#NO_APP
	movl	48(%rsp), %edx
	movl	44(%rsp), %r10d
	movq	56(%rsp), %rdi
	vpxor	%xmm0, %xmm0, %xmm0
	leaq	.LC379(%rip), %rsi
	movl	%edx, 28(%rsp)
	movl	%r10d, 24(%rsp)
	movq	$0, 176(%rsp)
	vmovdqa	%xmm0, 96(%rsp)
	vmovdqa	%xmm0, 112(%rsp)
	vmovdqa	%xmm0, 128(%rsp)
	vmovdqa	%xmm0, 144(%rsp)
	vmovdqa	%xmm0, 160(%rsp)
	call	fopen@PLT
	movq	%rax, %rdi
	leaq	stbi__stdio_write(%rip), %rax
	movq	%rax, 96(%rsp)
	movq	%rdi, 104(%rsp)
	testq	%rdi, %rdi
	je	.L7738
	movl	28(%rsp), %edx
	movl	24(%rsp), %r10d
	testl	%edx, %edx
	sete	%al
	testl	%r10d, %r10d
	sete	%cl
	orb	%cl, %al
	jne	.L7739
	testq	%rbp, %rbp
	je	.L7739
	leaq	96(%rsp), %rdi
	movl	$10, %r9d
	movq	%rbp, %r8
	movl	$1, %ecx
	movl	%r10d, %esi
	call	stbi_write_jpg_core.part.0
	movq	104(%rsp), %rdi
.L7739:
	call	fclose@PLT
.L7738:
	movq	%r12, %rdi
	call	free@PLT
	leaq	64(%rsp), %rdi
	xorl	%esi, %esi
	call	gettimeofday@PLT
	imulq	$1000000, 64(%rsp), %rax
	imulq	$1000000, 80(%rsp), %rdx
	vxorps	%xmm2, %xmm2, %xmm2
	addq	72(%rsp), %rax
	addq	88(%rsp), %rdx
	subq	%rdx, %rax
	vcvtsi2sdq	%rax, %xmm2, %xmm0
	leaq	.LC396(%rip), %rsi
	movl	$1, %edi
	movl	$1, %eax
	vdivsd	.LC395(%rip), %xmm0, %xmm0
	call	__printf_chk@PLT
	movq	56(%rsp), %rdi
	call	free@PLT
	jmp	.L7734
	.p2align 4,,10
	.p2align 3
.L7726:
	movq	%rbp, %rdi
	call	fclose@PLT
.L7723:
	leaq	.LC387(%rip), %rdi
	call	perror@PLT
	xorl	%r12d, %r12d
	jmp	.L7727
.L7751:
	movq	(%rsi), %rdx
	movl	$1, %edi
	leaq	.LC385(%rip), %rsi
	call	__printf_chk@PLT
	jmp	.L7721
.L7755:
	call	__stack_chk_fail@PLT
.L7754:
	leaq	.LC388(%rip), %rdi
	call	perror@PLT
	orl	$-1, %edi
	call	exit@PLT
.L7753:
	leaq	.LC388(%rip), %rdi
	call	perror@PLT
	jmp	.L7728
.L7752:
	leaq	.LC376(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L7723
	.cfi_endproc
.LFE834:
	.size	main, .-main
	.section	.rodata
	.align 32
	.type	UVAC_HT.1, @object
	.size	UVAC_HT.1, 1024
UVAC_HT.1:
	.value	0
	.value	2
	.value	1
	.value	2
	.value	4
	.value	3
	.value	10
	.value	4
	.value	24
	.value	5
	.value	25
	.value	5
	.value	56
	.value	6
	.value	120
	.value	7
	.value	500
	.value	9
	.value	1014
	.value	10
	.value	4084
	.value	12
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	11
	.value	4
	.value	57
	.value	6
	.value	246
	.value	8
	.value	501
	.value	9
	.value	2038
	.value	11
	.value	4085
	.value	12
	.value	-120
	.value	16
	.value	-119
	.value	16
	.value	-118
	.value	16
	.value	-117
	.value	16
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	26
	.value	5
	.value	247
	.value	8
	.value	1015
	.value	10
	.value	4086
	.value	12
	.value	32706
	.value	15
	.value	-116
	.value	16
	.value	-115
	.value	16
	.value	-114
	.value	16
	.value	-113
	.value	16
	.value	-112
	.value	16
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	27
	.value	5
	.value	248
	.value	8
	.value	1016
	.value	10
	.value	4087
	.value	12
	.value	-111
	.value	16
	.value	-110
	.value	16
	.value	-109
	.value	16
	.value	-108
	.value	16
	.value	-107
	.value	16
	.value	-106
	.value	16
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	58
	.value	6
	.value	502
	.value	9
	.value	-105
	.value	16
	.value	-104
	.value	16
	.value	-103
	.value	16
	.value	-102
	.value	16
	.value	-101
	.value	16
	.value	-100
	.value	16
	.value	-99
	.value	16
	.value	-98
	.value	16
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	59
	.value	6
	.value	1017
	.value	10
	.value	-97
	.value	16
	.value	-96
	.value	16
	.value	-95
	.value	16
	.value	-94
	.value	16
	.value	-93
	.value	16
	.value	-92
	.value	16
	.value	-91
	.value	16
	.value	-90
	.value	16
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	121
	.value	7
	.value	2039
	.value	11
	.value	-89
	.value	16
	.value	-88
	.value	16
	.value	-87
	.value	16
	.value	-86
	.value	16
	.value	-85
	.value	16
	.value	-84
	.value	16
	.value	-83
	.value	16
	.value	-82
	.value	16
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	122
	.value	7
	.value	2040
	.value	11
	.value	-81
	.value	16
	.value	-80
	.value	16
	.value	-79
	.value	16
	.value	-78
	.value	16
	.value	-77
	.value	16
	.value	-76
	.value	16
	.value	-75
	.value	16
	.value	-74
	.value	16
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	249
	.value	8
	.value	-73
	.value	16
	.value	-72
	.value	16
	.value	-71
	.value	16
	.value	-70
	.value	16
	.value	-69
	.value	16
	.value	-68
	.value	16
	.value	-67
	.value	16
	.value	-66
	.value	16
	.value	-65
	.value	16
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	503
	.value	9
	.value	-64
	.value	16
	.value	-63
	.value	16
	.value	-62
	.value	16
	.value	-61
	.value	16
	.value	-60
	.value	16
	.value	-59
	.value	16
	.value	-58
	.value	16
	.value	-57
	.value	16
	.value	-56
	.value	16
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	504
	.value	9
	.value	-55
	.value	16
	.value	-54
	.value	16
	.value	-53
	.value	16
	.value	-52
	.value	16
	.value	-51
	.value	16
	.value	-50
	.value	16
	.value	-49
	.value	16
	.value	-48
	.value	16
	.value	-47
	.value	16
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	505
	.value	9
	.value	-46
	.value	16
	.value	-45
	.value	16
	.value	-44
	.value	16
	.value	-43
	.value	16
	.value	-42
	.value	16
	.value	-41
	.value	16
	.value	-40
	.value	16
	.value	-39
	.value	16
	.value	-38
	.value	16
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	506
	.value	9
	.value	-37
	.value	16
	.value	-36
	.value	16
	.value	-35
	.value	16
	.value	-34
	.value	16
	.value	-33
	.value	16
	.value	-32
	.value	16
	.value	-31
	.value	16
	.value	-30
	.value	16
	.value	-29
	.value	16
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	2041
	.value	11
	.value	-28
	.value	16
	.value	-27
	.value	16
	.value	-26
	.value	16
	.value	-25
	.value	16
	.value	-24
	.value	16
	.value	-23
	.value	16
	.value	-22
	.value	16
	.value	-21
	.value	16
	.value	-20
	.value	16
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	16352
	.value	14
	.value	-19
	.value	16
	.value	-18
	.value	16
	.value	-17
	.value	16
	.value	-16
	.value	16
	.value	-15
	.value	16
	.value	-14
	.value	16
	.value	-13
	.value	16
	.value	-12
	.value	16
	.value	-11
	.value	16
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	1018
	.value	10
	.value	32707
	.value	15
	.value	-10
	.value	16
	.value	-9
	.value	16
	.value	-8
	.value	16
	.value	-7
	.value	16
	.value	-6
	.value	16
	.value	-5
	.value	16
	.value	-4
	.value	16
	.value	-3
	.value	16
	.value	-2
	.value	16
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.align 32
	.type	UVDC_HT.2, @object
	.size	UVDC_HT.2, 1024
UVDC_HT.2:
	.value	0
	.value	2
	.value	1
	.value	2
	.value	2
	.value	2
	.value	6
	.value	3
	.value	14
	.value	4
	.value	30
	.value	5
	.value	62
	.value	6
	.value	126
	.value	7
	.value	254
	.value	8
	.value	510
	.value	9
	.value	1022
	.value	10
	.value	2046
	.value	11
	.zero	976
	.align 32
	.type	YAC_HT.3, @object
	.size	YAC_HT.3, 1024
YAC_HT.3:
	.value	10
	.value	4
	.value	0
	.value	2
	.value	1
	.value	2
	.value	4
	.value	3
	.value	11
	.value	4
	.value	26
	.value	5
	.value	120
	.value	7
	.value	248
	.value	8
	.value	1014
	.value	10
	.value	-126
	.value	16
	.value	-125
	.value	16
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	12
	.value	4
	.value	27
	.value	5
	.value	121
	.value	7
	.value	502
	.value	9
	.value	2038
	.value	11
	.value	-124
	.value	16
	.value	-123
	.value	16
	.value	-122
	.value	16
	.value	-121
	.value	16
	.value	-120
	.value	16
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	28
	.value	5
	.value	249
	.value	8
	.value	1015
	.value	10
	.value	4084
	.value	12
	.value	-119
	.value	16
	.value	-118
	.value	16
	.value	-117
	.value	16
	.value	-116
	.value	16
	.value	-115
	.value	16
	.value	-114
	.value	16
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	58
	.value	6
	.value	503
	.value	9
	.value	4085
	.value	12
	.value	-113
	.value	16
	.value	-112
	.value	16
	.value	-111
	.value	16
	.value	-110
	.value	16
	.value	-109
	.value	16
	.value	-108
	.value	16
	.value	-107
	.value	16
	.value	0
	.value	0
	.value	0