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
	leaq	1(%rsi), %rdi
	movq	%r8, %rax
	leaq	1(%rdx), %r9
	subq	%rdi, %rax
	cmpq	$14, %rax
	movq	%r8, %rax
	seta	%dil
	subq	%r9, %rax
	cmpq	$14, %rax
	seta	%al
	testb	%al, %dil
	je	.L5
	leal	-1(%rcx), %eax
	cmpl	$14, %eax
	jbe	.L5
	vmovdqa	.LC0(%rip), %xmm4
	vmovdqa	.LC1(%rip), %xmm3
	movl	%ecx, %edi
	xorl	%eax, %eax
	vmovdqa	.LC2(%rip), %xmm2
	shrl	$4, %edi
	salq	$4, %rdi
	vpmovzxbw	%xmm4, %xmm5
	vpsrldq	$8, %xmm4, %xmm4
	vpmovzxbw	%xmm4, %xmm4
	.p2align 4
	.p2align 3
.L6:
	vmovdqu	(%rsi,%rax), %xmm0
	vmovdqu	(%rdx,%rax), %xmm6
	vpmovzxbw	%xmm0, %xmm1
	vpsrldq	$8, %xmm0, %xmm0
	vpmovzxbw	%xmm0, %xmm0
	vpmovzxbw	%xmm6, %xmm7
	vpmullw	%xmm5, %xmm1, %xmm1
	vpsrldq	$8, %xmm6, %xmm6
	vpmovzxbw	%xmm6, %xmm6
	vpmullw	%xmm4, %xmm0, %xmm0
	vpaddw	%xmm7, %xmm1, %xmm1
	vpaddw	%xmm3, %xmm1, %xmm1
	vpsrlw	$2, %xmm1, %xmm1
	vpand	%xmm1, %xmm2, %xmm1
	vpaddw	%xmm6, %xmm0, %xmm0
	vpaddw	%xmm3, %xmm0, %xmm0
	vpsrlw	$2, %xmm0, %xmm0
	vpand	%xmm0, %xmm2, %xmm0
	vpackuswb	%xmm0, %xmm1, %xmm0
	vmovdqu	%xmm0, (%r8,%rax)
	addq	$16, %rax
	cmpq	%rdi, %rax
	jne	.L6
	movl	%ecx, %eax
	andl	$-16, %eax
	testb	$15, %cl
	je	.L4
	movl	%eax, %edi
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
	addl	$14, %eax
	movzbl	(%rsi,%rdi), %r9d
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
	.p2align 4
	.p2align 3
.L5:
	movl	%ecx, %ecx
	xorl	%eax, %eax
	.p2align 4
	.p2align 3
.L8:
	movzbl	(%rsi,%rax), %edi
	leal	(%rdi,%rdi,2), %r9d
	movzbl	(%rdx,%rax), %edi
	leal	2(%r9,%rdi), %edi
	sarl	$2, %edi
	movb	%dil, (%r8,%rax)
	incq	%rax
	cmpq	%rax, %rcx
	jne	.L8
	movq	%r8, %rax
	ret
	.cfi_endproc
.LFE665:
	.size	stbi__resample_row_v_2, .-stbi__resample_row_v_2
	.p2align 4
	.type	stbi__resample_row_generic, @function
stbi__resample_row_generic:
.LFB669:
	.cfi_startproc
	endbr64
	movq	%rdi, %r10
	testl	%ecx, %ecx
	jle	.L42
	testl	%r8d, %r8d
	jle	.L42
	leal	-1(%rcx), %eax
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	%r8d, %r14d
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	leaq	1(%rsi,%rax), %rax
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movslq	%r8d, %r13
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	%r8d, %ebx
	leal	-1(%r8), %r15d
	movq	%rax, -40(%rsp)
	movl	%r8d, %eax
	andl	$-16, %r14d
	xorl	%r12d, %r12d
	shrl	$4, %eax
	xorl	%r9d, %r9d
	movq	%rbx, -16(%rsp)
	decl	%eax
	incq	%rax
	salq	$4, %rax
	movq	%rax, -32(%rsp)
	movl	%r8d, %eax
	andl	$15, %eax
	movl	%eax, -24(%rsp)
	decl	%eax
	movl	%eax, -20(%rsp)
	.p2align 4
	.p2align 3
.L21:
	movq	%rsi, %rcx
	leaq	0(%r13,%rdi), %rax
	incq	%rsi
	cmpq	%rax, %rcx
	setnb	%dl
	cmpq	%rsi, %rdi
	setnb	%al
	orb	%dl, %al
	je	.L33
	cmpl	$6, %r15d
	jbe	.L33
	cmpl	$14, %r15d
	jbe	.L31
	vpbroadcastb	(%rcx), %xmm0
	movq	-32(%rsp), %rax
	leaq	(%rax,%rdi), %rdx
	movq	%rdi, %rax
	.p2align 4
	.p2align 3
.L23:
	vmovdqu	%xmm0, (%rax)
	addq	$16, %rax
	cmpq	%rax, %rdx
	jne	.L23
	cmpl	%r8d, %r14d
	je	.L28
	cmpl	$6, -20(%rsp)
	movl	-24(%rsp), %ebp
	jbe	.L32
	movl	%r14d, %r11d
	movl	%r14d, %eax
.L22:
	movzbl	(%rcx), %ebx
	movl	%ebx, %edx
	sall	$8, %edx
	orl	%ebx, %edx
	leaq	(%r10,%r12), %rbx
	vmovd	%edx, %xmm1
	movl	%ebp, %edx
	vpshuflw	$0, %xmm1, %xmm0
	andl	$-8, %edx
	vmovq	%xmm0, (%rbx,%r11)
	addl	%edx, %eax
	cmpl	%ebp, %edx
	je	.L28
.L25:
	movzbl	(%rcx), %r11d
	leal	(%r9,%rax), %edx
	movslq	%edx, %rdx
	movb	%r11b, (%r10,%rdx)
	leal	1(%rax), %edx
	cmpl	%edx, %r8d
	jle	.L28
	addl	%r9d, %edx
	movslq	%edx, %rdx
	movb	%r11b, (%r10,%rdx)
	leal	2(%rax), %edx
	cmpl	%edx, %r8d
	jle	.L28
	movzbl	(%rcx), %r11d
	addl	%r9d, %edx
	movslq	%edx, %rdx
	movb	%r11b, (%r10,%rdx)
	leal	3(%rax), %edx
	cmpl	%edx, %r8d
	jle	.L28
	addl	%r9d, %edx
	movslq	%edx, %rdx
	movb	%r11b, (%r10,%rdx)
	leal	4(%rax), %edx
	cmpl	%edx, %r8d
	jle	.L28
	movzbl	(%rcx), %r11d
	addl	%r9d, %edx
	movslq	%edx, %rdx
	movb	%r11b, (%r10,%rdx)
	leal	5(%rax), %edx
	cmpl	%edx, %r8d
	jle	.L28
	addl	%r9d, %edx
	addl	$6, %eax
	movslq	%edx, %rdx
	movb	%r11b, (%r10,%rdx)
	cmpl	%eax, %r8d
	jle	.L28
	movzbl	(%rcx), %edx
	addl	%r9d, %eax
	cltq
	movb	%dl, (%r10,%rax)
.L28:
	addq	%r13, %rdi
	addl	%r8d, %r9d
	addq	%r13, %r12
	cmpq	-40(%rsp), %rsi
	jne	.L21
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	movq	%r10, %rax
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
	.p2align 4
	.p2align 3
.L33:
	.cfi_restore_state
	movq	-16(%rsp), %rbx
	movq	%rdi, %rax
	leaq	(%rbx,%rdi), %rdx
	.p2align 4
	.p2align 3
.L27:
	movzbl	(%rcx), %r11d
	incq	%rax
	movb	%r11b, -1(%rax)
	cmpq	%rdx, %rax
	jne	.L27
	jmp	.L28
.L31:
	movl	%r8d, %ebp
	xorl	%r11d, %r11d
	xorl	%eax, %eax
	jmp	.L22
.L32:
	movl	%r14d, %eax
	jmp	.L25
.L42:
	.cfi_def_cfa_offset 8
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	.cfi_restore 14
	.cfi_restore 15
	movq	%r10, %rax
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
	js	.L46
	call	stbi__out_gif_code
.L46:
	movl	34912(%rbx), %edx
	cmpl	34904(%rbx), %edx
	jge	.L52
	addl	34908(%rbx), %edx
	movq	24(%rbx), %rsi
	movq	8(%rbx), %rcx
	leal	3(%rdx), %eax
	cmovns	%edx, %eax
	sarl	$2, %eax
	cltq
	movb	$1, (%rsi,%rax)
	movzbl	2103(%rbx,%rbp,4), %eax
	sall	$2, %eax
	cltq
	addq	34872(%rbx), %rax
	cmpb	$-128, 3(%rax)
	jbe	.L48
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
.L48:
	movl	34908(%rbx), %eax
	addl	$4, %eax
	movl	%eax, 34908(%rbx)
	cmpl	34900(%rbx), %eax
	jl	.L52
	movl	34884(%rbx), %eax
	vmovd	34892(%rbx), %xmm2
	addl	34912(%rbx), %eax
	movl	34904(%rbx), %esi
	vpinsrd	$1, %eax, %xmm2, %xmm0
	vmovq	%xmm0, 34908(%rbx)
	cmpl	%esi, %eax
	jl	.L52
	movl	34880(%rbx), %edx
	jmp	.L50
	.p2align 4
	.p2align 3
.L51:
	shlx	%edx, 34916(%rbx), %eax
	movl	%eax, %ecx
	decl	%edx
	sarl	%ecx
	addl	34896(%rbx), %ecx
	vmovd	%edx, %xmm1
	vpinsrd	$1, %eax, %xmm1, %xmm0
	vmovq	%xmm0, 34880(%rbx)
	movl	%ecx, 34912(%rbx)
	cmpl	%esi, %ecx
	jl	.L52
.L50:
	testl	%edx, %edx
	jg	.L51
.L52:
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
	vmovss	(%r9), %xmm8
	vmovss	(%rax), %xmm4
	vmovss	(%rsi), %xmm2
	vmovss	(%rdx), %xmm0
	vmovss	(%r8), %xmm7
	vmovss	(%rcx), %xmm1
	vmovss	(%rdi), %xmm6
	vmovss	(%r10), %xmm3
	vmovss	.LC6(%rip), %xmm10
	vaddss	%xmm3, %xmm4, %xmm5
	vsubss	%xmm3, %xmm4, %xmm4
	vaddss	%xmm6, %xmm2, %xmm3
	vsubss	%xmm6, %xmm2, %xmm2
	vaddss	%xmm8, %xmm0, %xmm6
	vsubss	%xmm8, %xmm0, %xmm0
	vaddss	%xmm7, %xmm1, %xmm8
	vsubss	%xmm7, %xmm1, %xmm1
	vaddss	%xmm6, %xmm3, %xmm9
	vsubss	%xmm6, %xmm3, %xmm3
	vmovss	.LC4(%rip), %xmm6
	vaddss	%xmm8, %xmm5, %xmm7
	vsubss	%xmm8, %xmm5, %xmm5
	vaddss	%xmm1, %xmm0, %xmm1
	vaddss	%xmm0, %xmm2, %xmm0
	vaddss	%xmm2, %xmm4, %xmm2
	vaddss	%xmm5, %xmm3, %xmm3
	vaddss	%xmm9, %xmm7, %xmm8
	vsubss	%xmm9, %xmm7, %xmm7
	vmovaps	%xmm3, %xmm9
	vfmadd132ss	%xmm6, %xmm5, %xmm9
	vfnmadd132ss	%xmm6, %xmm5, %xmm3
	vsubss	%xmm2, %xmm1, %xmm5
	vmulss	.LC5(%rip), %xmm1, %xmm1
	vmulss	.LC7(%rip), %xmm2, %xmm2
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
	jne	.L59
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4
	.p2align 3
.L59:
	.cfi_restore_state
	movq	%rbp, %rsi
	popq	%rbp
	.cfi_def_cfa_offset 8
	movl	%eax, %edi
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
.LC8:
	.string	"stb_image_write.h"
.LC9:
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
	je	.L62
	movq	%rdi, %r12
	movq	%rsi, %rbx
	movq	%rdx, %rbp
	leaq	4(%rsp), %r13
	jmp	.L76
	.p2align 4
	.p2align 3
.L87:
	cmpb	$32, %al
	je	.L66
	cmpb	$49, %al
	jne	.L68
	movl	0(%rbp), %eax
	cmpl	$47, %eax
	ja	.L70
	movl	%eax, %edx
	addq	16(%rbp), %rdx
	addl	$8, %eax
	movl	%eax, 0(%rbp)
.L71:
	movl	(%rdx), %eax
	leaq	3(%rsp), %rsi
	movl	$1, %edx
	movq	8(%r12), %rdi
	movb	%al, 3(%rsp)
	call	*(%r12)
.L66:
	movzbl	(%rbx), %eax
	testb	%al, %al
	je	.L62
.L76:
	incq	%rbx
	cmpb	$50, %al
	je	.L64
	jle	.L87
	cmpb	$52, %al
	jne	.L68
	movl	0(%rbp), %eax
	cmpl	$47, %eax
	ja	.L74
	movl	%eax, %edx
	addq	16(%rbp), %rdx
	addl	$8, %eax
	movl	%eax, 0(%rbp)
.L75:
	movl	(%rdx), %eax
	movq	%r13, %rsi
	movl	$4, %edx
	movq	8(%r12), %rdi
	movl	%eax, 4(%rsp)
	call	*(%r12)
	movzbl	(%rbx), %eax
	testb	%al, %al
	jne	.L76
.L62:
	movq	8(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L88
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
	.p2align 4
	.p2align 3
.L64:
	.cfi_restore_state
	movl	0(%rbp), %eax
	cmpl	$47, %eax
	ja	.L72
	movl	%eax, %edx
	addq	16(%rbp), %rdx
	addl	$8, %eax
	movl	%eax, 0(%rbp)
.L73:
	movzwl	(%rdx), %eax
	movq	%r13, %rsi
	movl	$2, %edx
	movq	8(%r12), %rdi
	movw	%ax, 4(%rsp)
	call	*(%r12)
	jmp	.L66
	.p2align 4
	.p2align 3
.L74:
	movq	8(%rbp), %rdx
	leaq	8(%rdx), %rax
	movq	%rax, 8(%rbp)
	jmp	.L75
	.p2align 4
	.p2align 3
.L72:
	movq	8(%rbp), %rdx
	leaq	8(%rdx), %rax
	movq	%rax, 8(%rbp)
	jmp	.L73
	.p2align 4
	.p2align 3
.L70:
	movq	8(%rbp), %rdx
	leaq	8(%rdx), %rax
	movq	%rax, 8(%rbp)
	jmp	.L71
.L68:
	leaq	__PRETTY_FUNCTION__.30(%rip), %rcx
	movl	$372, %edx
	leaq	.LC8(%rip), %rsi
	leaq	.LC9(%rip), %rdi
	call	__assert_fail@PLT
.L88:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE791:
	.size	stbiw__writefv, .-stbiw__writefv
	.section	.rodata.str1.1
.LC10:
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
	.p2align 4
	.p2align 3
.L90:
	movl	-4(%r14,%rbp,4), %r12d
	testl	%r12d, %r12d
	jle	.L93
	movslq	%r13d, %rax
	movslq	%r12d, %rdx
	movl	%ebp, %esi
	addl	%r12d, %r13d
	leaq	1280(%rbx,%rax), %rdi
	call	memset@PLT
.L93:
	incq	%rbp
	cmpq	$17, %rbp
	jne	.L90
	movslq	%r13d, %r13
	movl	$1, %edx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	movb	$0, 1280(%rbx,%r13)
	movl	$16, %r8d
	jmp	.L97
	.p2align 4
	.p2align 3
.L94:
	movl	%r8d, %ecx
	subl	%r9d, %ecx
	shlx	%ecx, %eax, %ecx
	addl	%eax, %eax
	movl	%ecx, 1540(%rbx,%rdx,4)
	incq	%rdx
	cmpq	$17, %rdx
	je	.L111
.L97:
	movl	%ebp, %ecx
	movl	%edx, %r9d
	movl	%edx, %r10d
	movl	%edx, %edi
	subl	%eax, %ecx
	movl	%ecx, 1612(%rbx,%rdx,4)
	movslq	%ebp, %rcx
	movzbl	1280(%rbx,%rcx), %ecx
	cmpl	%edx, %ecx
	jne	.L94
	leal	1(%rbp), %ecx
	movslq	%ecx, %rcx
	.p2align 4
	.p2align 3
.L95:
	movl	%eax, %r11d
	incl	%eax
	movl	%ecx, %ebp
	leal	-1(%rax), %esi
	movw	%si, 510(%rbx,%rcx,2)
	movzbl	1280(%rbx,%rcx), %esi
	incq	%rcx
	cmpl	%edi, %esi
	je	.L95
	shrx	%r10d, %r11d, %r11d
	testl	%r11d, %r11d
	je	.L94
	leaq	.LC10(%rip), %rax
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
.L111:
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
	jne	.L100
	jmp	.L101
	.p2align 4
	.p2align 3
.L112:
	incq	%r12
	cmpq	%r12, %r14
	je	.L101
.L100:
	movzbl	1280(%rbx,%r12), %eax
	cmpl	$9, %eax
	jg	.L112
	movzwl	512(%rbx,%r12,2), %edi
	movl	%r13d, %ecx
	movl	$1, %edx
	movzbl	%r12b, %esi
	subl	%eax, %ecx
	incq	%r12
	shlx	%ecx, %edx, %edx
	movslq	%edx, %rdx
	shlx	%ecx, %edi, %edi
	movslq	%edi, %rdi
	addq	%rbx, %rdi
	call	memset@PLT
	cmpq	%r12, %r14
	jne	.L100
.L101:
	popq	%rbx
	.cfi_def_cfa_offset 40
	movl	$1, %eax
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
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
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movslq	%ecx, %rcx
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movslq	%esi, %r13
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	imulq	%rcx, %r13
	subq	$2104, %rsp
	.cfi_def_cfa_offset 2160
	movq	%fs:40, %rax
	movq	%rax, 2088(%rsp)
	xorl	%eax, %eax
	movl	%edx, %eax
	sarl	%eax
	movl	%eax, 28(%rsp)
	testl	%eax, %eax
	jle	.L113
	testq	%r13, %r13
	je	.L113
	movslq	%edx, %r12
	movq	%rdi, 8(%rsp)
	movl	$0, 24(%rsp)
	leaq	32(%rsp), %rbp
	decq	%r12
	imulq	%r13, %r12
	addq	%rdi, %r12
	movq	%r12, 16(%rsp)
	.p2align 4
	.p2align 3
.L116:
	movq	8(%rsp), %r12
	movq	%r13, %r15
	movq	16(%rsp), %rbx
	.p2align 4
	.p2align 3
.L115:
	movl	$2048, %edx
	movl	$2048, %ecx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	cmpq	%rdx, %r15
	cmovbe	%r15, %rdx
	movq	%rdx, %r14
	call	__memcpy_chk@PLT
	movq	%rbx, %rsi
	movq	%r12, %rdi
	movq	%r14, %rdx
	addq	%r14, %r12
	call	memcpy@PLT
	movq	%rbx, %rdi
	movq	%r14, %rdx
	movq	%rbp, %rsi
	call	memcpy@PLT
	addq	%r14, %rbx
	subq	%r14, %r15
	jne	.L115
	incl	24(%rsp)
	addq	%r13, 8(%rsp)
	subq	%r13, 16(%rsp)
	movl	24(%rsp), %eax
	cmpl	28(%rsp), %eax
	jne	.L116
.L113:
	movq	2088(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L125
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
.L125:
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
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%rsi, %rdi
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	cmpq	$0, 16(%rbp)
	movq	200(%rbp), %rax
	movslq	%edx, %rbx
	movq	192(%rbp), %rsi
	je	.L127
	movq	%rax, %r12
	subq	%rsi, %r12
	cmpl	%ebx, %r12d
	jl	.L131
.L127:
	leaq	(%rsi,%rbx), %rdx
	xorl	%r8d, %r8d
	cmpq	%rdx, %rax
	jnb	.L132
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	movl	%r8d, %eax
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4
	.p2align 3
.L132:
	.cfi_restore_state
	movq	%rbx, %rdx
	call	memcpy@PLT
	addq	%rbx, 192(%rbp)
	movl	$1, %r8d
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	movl	%r8d, %eax
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4
	.p2align 3
.L131:
	.cfi_restore_state
	movslq	%r12d, %r13
	subl	%r12d, %ebx
	movq	%r13, %rdx
	call	memcpy@PLT
	movq	40(%rbp), %rdi
	movl	%ebx, %edx
	leaq	(%rax,%r13), %rsi
	call	*16(%rbp)
	xorl	%r8d, %r8d
	cmpl	%eax, %ebx
	movq	200(%rbp), %rax
	sete	%r8b
	movq	%rax, 192(%rbp)
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	movl	%r8d, %eax
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
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
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	%ecx, %eax
	leaq	firstmap.19(%rip), %rcx
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdi, %r10
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	%edx, %ebp
	leaq	mapping.20(%rip), %rdx
	subq	$32, %rsp
	.cfi_def_cfa_offset 88
	testl	%r8d, %r8d
	movl	%esi, %ebx
	cmove	%rcx, %rdx
	movslq	88(%rsp), %rcx
	movq	96(%rsp), %rdi
	movl	(%rdx,%rcx,4), %r11d
	movl	stbi__flip_vertically_on_write(%rip), %edx
	testl	%edx, %edx
	je	.L135
	decl	%eax
	negl	%ebx
	subl	%r8d, %eax
	imull	%esi, %eax
	cltq
	leaq	(%r10,%rax), %rsi
	testl	%r11d, %r11d
	je	.L136
.L268:
	testl	%r9d, %r9d
	jle	.L138
	movl	%ebx, %edx
	movl	%r9d, %r13d
	movq	%rsi, %r8
	movq	%rdi, %rcx
	negl	%edx
	subl	%ebx, %r13d
	movl	%r11d, %r12d
	leaq	.L141(%rip), %r10
	.p2align 4
	.p2align 3
.L147:
	cmpl	$6, %r11d
	ja	.L139
	movslq	(%r10,%r12,4), %rax
	addq	%r10, %rax
	notrack jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L141:
	.long	.L139-.L141
	.long	.L140-.L141
	.long	.L143-.L141
	.long	.L144-.L141
	.long	.L143-.L141
	.long	.L140-.L141
	.long	.L140-.L141
	.text
	.p2align 4
	.p2align 3
.L140:
	movzbl	(%r8), %eax
	movb	%al, (%rcx)
.L139:
	incl	%edx
	incq	%r8
	incq	%rcx
	cmpl	%edx, %r13d
	jne	.L147
.L138:
	cmpl	$6, %r11d
	ja	.L265
	leaq	.L150(%rip), %rdx
	movslq	(%rdx,%r11,4), %rax
	addq	%rdx, %rax
	notrack jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L150:
	.long	.L265-.L150
	.long	.L155-.L150
	.long	.L154-.L150
	.long	.L153-.L150
	.long	.L152-.L150
	.long	.L151-.L150
	.long	.L149-.L150
	.text
	.p2align 4
	.p2align 3
.L143:
	movslq	%edx, %r14
	movzbl	(%r8), %eax
	subb	(%rsi,%r14), %al
	movb	%al, (%rcx)
	jmp	.L139
	.p2align 4
	.p2align 3
.L144:
	movslq	%edx, %rax
	movzbl	(%rsi,%rax), %r14d
	movzbl	(%r8), %eax
	shrb	%r14b
	subl	%r14d, %eax
	movb	%al, (%rcx)
	jmp	.L139
	.p2align 4
	.p2align 3
.L152:
	movl	%ebp, %r14d
	imull	%r9d, %r14d
	cmpl	%r14d, %r9d
	jge	.L265
	movslq	%r9d, %rdx
	movslq	%ebx, %r10
	negl	%ebx
	movl	%r14d, %r12d
	movq	%rdx, %r11
	leaq	(%rdi,%rdx), %rbp
	movslq	%ebx, %rax
	subl	%r9d, %r12d
	subq	%r10, %r11
	movq	%rbp, %rcx
	leaq	1(%rsi,%rax), %rbx
	leaq	1(%rsi), %r13
	leaq	1(%rsi,%r11), %r8
	subq	%r8, %rcx
	cmpq	$14, %rcx
	movq	%rbp, %rcx
	seta	%r8b
	subq	%rbx, %rcx
	leaq	1(%rsi,%rdx), %rbx
	cmpq	$14, %rcx
	seta	%cl
	andl	%ecx, %r8d
	movq	%rbp, %rcx
	subq	%rbx, %rcx
	movq	%rbp, %rbx
	cmpq	$14, %rcx
	seta	%cl
	subq	%r13, %rbx
	cmpq	$14, %rbx
	seta	%bl
	andl	%ebx, %ecx
	testb	%cl, %r8b
	je	.L210
	leal	-1(%r12), %ecx
	cmpl	$14, %ecx
	jbe	.L210
	vmovdqa	.LC13(%rip), %xmm14
	movl	%r12d, %r8d
	leaq	(%rsi,%rdx), %rbx
	addq	%rsi, %rax
	shrl	$4, %r8d
	addq	%rsi, %r11
	xorl	%ecx, %ecx
	salq	$4, %r8
	.p2align 4
	.p2align 3
.L184:
	vmovdqu	(%rax,%rcx), %xmm2
	vmovdqu	(%rax,%rcx), %xmm3
	vmovdqu	(%rsi,%rcx), %xmm6
	vpmovzxbw	%xmm2, %xmm10
	vmovdqu	(%r11,%rcx), %xmm2
	vpsrldq	$8, %xmm3, %xmm0
	vpmovzxbw	%xmm0, %xmm0
	vpmovzxbw	%xmm6, %xmm5
	vmovdqu	(%rsi,%rcx), %xmm6
	vpmovzxwd	%xmm0, %xmm11
	vpsrldq	$8, %xmm0, %xmm0
	vpmovzxwd	%xmm0, %xmm4
	vpmovzxwd	%xmm5, %xmm15
	vpmovzxwd	%xmm10, %xmm12
	vpsrldq	$8, %xmm5, %xmm5
	vmovdqa	%xmm4, -120(%rsp)
	vpmovzxwd	%xmm5, %xmm5
	vpsrldq	$8, %xmm10, %xmm10
	vpmovzxwd	%xmm10, %xmm10
	vpmovzxbw	%xmm2, %xmm3
	vmovdqu	(%r11,%rcx), %xmm2
	vpsrldq	$8, %xmm6, %xmm0
	vpmovzxbw	%xmm0, %xmm0
	vpmovzxwd	%xmm0, %xmm13
	vpsrldq	$8, %xmm0, %xmm0
	vpmovzxwd	%xmm0, %xmm0
	vpsrldq	$8, %xmm2, %xmm1
	vpmovzxbw	%xmm1, %xmm1
	vpmovzxwd	%xmm3, %xmm2
	vpsrldq	$8, %xmm3, %xmm3
	vpmovzxwd	%xmm1, %xmm4
	vpsrldq	$8, %xmm1, %xmm1
	vpmovzxwd	%xmm1, %xmm1
	vpaddd	%xmm15, %xmm2, %xmm7
	vpaddd	%xmm0, %xmm1, %xmm8
	vpsubd	-120(%rsp), %xmm8, %xmm8
	vpsubd	%xmm12, %xmm7, %xmm7
	vpaddd	%xmm13, %xmm4, %xmm9
	vpsubd	%xmm11, %xmm9, %xmm9
	vpmovzxwd	%xmm3, %xmm3
	vpsubd	%xmm15, %xmm7, %xmm15
	vpaddd	%xmm5, %xmm3, %xmm6
	vpsubd	%xmm2, %xmm7, %xmm2
	vpsubd	%xmm12, %xmm7, %xmm7
	vpabsd	%xmm15, %xmm15
	vpsubd	%xmm10, %xmm6, %xmm6
	vpabsd	%xmm2, %xmm2
	vpabsd	%xmm7, %xmm7
	vpsubd	%xmm13, %xmm9, %xmm13
	vpsubd	%xmm4, %xmm9, %xmm4
	vpsubd	%xmm11, %xmm9, %xmm9
	vpsubd	%xmm5, %xmm6, %xmm5
	vmovdqa	%xmm15, -72(%rsp)
	vpabsd	%xmm4, %xmm4
	vpsubd	%xmm3, %xmm6, %xmm3
	vpsubd	%xmm10, %xmm6, %xmm6
	vpabsd	%xmm9, %xmm10
	vpminsd	%xmm10, %xmm4, %xmm11
	vpabsd	%xmm3, %xmm3
	vpabsd	%xmm6, %xmm6
	vmovdqa	%xmm10, -56(%rsp)
	vpabsd	%xmm5, %xmm5
	vpabsd	%xmm13, %xmm13
	vpsubd	%xmm0, %xmm8, %xmm0
	vpsubd	%xmm1, %xmm8, %xmm1
	vpsubd	-120(%rsp), %xmm8, %xmm8
	vmovdqa	%xmm11, -120(%rsp)
	vpabsd	%xmm0, %xmm0
	vpabsd	%xmm1, %xmm1
	vpcmpgtd	%xmm11, %xmm13, %xmm11
	vmovdqa	%xmm0, -104(%rsp)
	vpminsd	%xmm6, %xmm3, %xmm0
	vpabsd	%xmm8, %xmm12
	vpminsd	%xmm7, %xmm2, %xmm8
	vpcmpgtd	%xmm8, %xmm15, %xmm10
	vpcmpeqd	%xmm8, %xmm2, %xmm15
	vpminsd	%xmm12, %xmm1, %xmm9
	vmovdqa	%xmm12, -40(%rsp)
	vpcmpgtd	%xmm7, %xmm2, %xmm2
	vmovdqa	-72(%rsp), %xmm7
	vmovdqa	%xmm10, -88(%rsp)
	vpcmpgtd	%xmm0, %xmm5, %xmm12
	vpand	-88(%rsp), %xmm15, %xmm15
	vmovdqa	-104(%rsp), %xmm10
	vpand	-88(%rsp), %xmm2, %xmm2
	vpminsd	%xmm7, %xmm8, %xmm8
	vmovdqa	%xmm15, -24(%rsp)
	vpcmpeqd	%xmm7, %xmm8, %xmm8
	vmovdqa	-104(%rsp), %xmm7
	vpcmpeqd	%xmm0, %xmm3, %xmm15
	vpminsd	%xmm0, %xmm5, %xmm0
	vpand	%xmm8, %xmm14, %xmm8
	vpcmpeqd	%xmm0, %xmm5, %xmm0
	vpminsd	-120(%rsp), %xmm13, %xmm5
	vpand	%xmm12, %xmm15, %xmm15
	vpcmpgtd	%xmm9, %xmm10, %xmm10
	vmovdqa	%xmm15, -8(%rsp)
	vpcmpeqd	-120(%rsp), %xmm4, %xmm15
	vpand	%xmm0, %xmm14, %xmm0
	vpand	%xmm11, %xmm15, %xmm15
	vpcmpgtd	%xmm6, %xmm3, %xmm3
	vpackusdw	%xmm0, %xmm8, %xmm0
	vpand	.LC2(%rip), %xmm0, %xmm0
	vmovdqa	%xmm15, 8(%rsp)
	vpcmpeqd	%xmm9, %xmm1, %xmm15
	vpand	%xmm12, %xmm3, %xmm3
	vpcmpgtd	-56(%rsp), %xmm4, %xmm4
	vpcmpgtd	-40(%rsp), %xmm1, %xmm1
	vpand	%xmm2, %xmm14, %xmm2
	vpand	%xmm3, %xmm14, %xmm3
	vpand	%xmm11, %xmm4, %xmm4
	vpand	%xmm10, %xmm1, %xmm1
	vpackusdw	%xmm3, %xmm2, %xmm2
	vpand	%xmm10, %xmm15, %xmm15
	vpminsd	%xmm7, %xmm9, %xmm9
	vpand	%xmm1, %xmm14, %xmm1
	vpand	%xmm4, %xmm14, %xmm4
	vpand	%xmm15, %xmm14, %xmm15
	vpcmpeqd	%xmm7, %xmm9, %xmm6
	vpackusdw	%xmm1, %xmm4, %xmm4
	vpcmpeqd	%xmm5, %xmm13, %xmm5
	vpand	%xmm6, %xmm14, %xmm6
	vpand	%xmm5, %xmm14, %xmm5
	vpackusdw	%xmm6, %xmm5, %xmm5
	vpand	.LC2(%rip), %xmm5, %xmm5
	vpackuswb	%xmm5, %xmm0, %xmm0
	vmovdqu	(%r11,%rcx), %xmm5
	vpblendvb	%xmm0, (%rsi,%rcx), %xmm5, %xmm0
	vpand	-24(%rsp), %xmm14, %xmm5
	vpand	-8(%rsp), %xmm14, %xmm6
	vpand	.LC2(%rip), %xmm4, %xmm4
	vpand	.LC2(%rip), %xmm2, %xmm1
	vpackusdw	%xmm6, %xmm5, %xmm5
	vpand	8(%rsp), %xmm14, %xmm6
	vpand	.LC2(%rip), %xmm5, %xmm5
	vpackuswb	%xmm4, %xmm1, %xmm1
	vmovdqu	(%rbx,%rcx), %xmm4
	vpackusdw	%xmm15, %xmm6, %xmm6
	vpand	.LC2(%rip), %xmm6, %xmm6
	vpackuswb	%xmm6, %xmm5, %xmm5
	vpblendvb	%xmm5, (%r11,%rcx), %xmm0, %xmm0
	vpblendvb	%xmm1, (%rax,%rcx), %xmm0, %xmm0
	vpsubb	%xmm0, %xmm4, %xmm0
	vmovdqu	%xmm0, 0(%rbp,%rcx)
	addq	$16, %rcx
	cmpq	%r8, %rcx
	jne	.L184
	movl	%r12d, %ecx
	andl	$-16, %ecx
	addl	%ecx, %r9d
	cmpl	%ecx, %r12d
	je	.L265
	movq	%rsi, %rbx
	leaq	(%rdx,%r10), %rcx
	movq	%rsi, %r15
	movslq	%r9d, %r9
	subq	%rdx, %rbx
	subq	%rcx, %r15
	movq	%rbx, -120(%rsp)
	.p2align 4
	.p2align 3
.L188:
	movq	-120(%rsp), %rbx
	movzbl	(%rax,%r9), %r8d
	movzbl	(%r15,%r9), %ecx
	movzbl	(%rsi,%r9), %r10d
	movzbl	(%rbx,%r9), %ebp
	movl	%r8d, %r13d
	movl	%ecx, %r12d
	leal	(%r8,%rbp), %edx
	movl	%ebp, %ebx
	subl	%ecx, %edx
	movl	%edx, %r11d
	subl	%r8d, %r11d
	movl	%r11d, %r8d
	negl	%r8d
	cmovs	%r11d, %r8d
	movl	%edx, %r11d
	subl	%ecx, %r11d
	movl	%r11d, %ecx
	negl	%ecx
	cmovs	%r11d, %ecx
	subl	%ebp, %edx
	movl	%edx, %r11d
	negl	%r11d
	cmovns	%r11d, %edx
	cmpl	%ecx, %r8d
	movl	%ecx, %r11d
	cmovle	%r8d, %r11d
	cmpl	%r11d, %edx
	jle	.L189
	cmpl	%ecx, %r8d
	movl	%r12d, %ebx
	cmovle	%r13d, %ebx
.L189:
	subl	%ebx, %r10d
	movb	%r10b, (%rdi,%r9)
	incq	%r9
	cmpl	%r9d, %r14d
	jg	.L188
.L265:
	addq	$32, %rsp
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
	.p2align 4
	.p2align 3
.L135:
	.cfi_restore_state
	imull	%esi, %r8d
	movslq	%r8d, %r8
	leaq	(%r10,%r8), %rsi
	testl	%r11d, %r11d
	jne	.L268
.L136:
	addq	$32, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	imull	%ebp, %r9d
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
	movslq	%r9d, %rdx
	jmp	memcpy@PLT
	.p2align 4
	.p2align 3
.L149:
	.cfi_restore_state
	imull	%r9d, %ebp
	cmpl	%ebp, %r9d
	jge	.L265
	movslq	%r9d, %rcx
	movl	%ebp, %r10d
	leaq	1(%rsi), %rbx
	leaq	(%rdi,%rcx), %r8
	leaq	1(%rsi,%rcx), %r11
	subl	%r9d, %r10d
	movq	%r8, %rdx
	leal	-1(%r10), %eax
	subq	%r11, %rdx
	cmpq	$14, %rdx
	movq	%r8, %rdx
	seta	%r11b
	subq	%rbx, %rdx
	cmpq	$14, %rdx
	seta	%dl
	testb	%dl, %r11b
	je	.L214
	cmpl	$6, %eax
	jbe	.L214
	cmpl	$14, %eax
	jbe	.L215
	movl	%r10d, %edx
	leaq	(%rsi,%rcx), %r11
	xorl	%eax, %eax
	shrl	$4, %edx
	salq	$4, %rdx
	.p2align 4
	.p2align 3
.L198:
	vmovdqu	(%r11,%rax), %xmm3
	vpsubb	(%rsi,%rax), %xmm3, %xmm0
	vmovdqu	%xmm0, (%r8,%rax)
	addq	$16, %rax
	cmpq	%rdx, %rax
	jne	.L198
	movl	%r10d, %edx
	andl	$-16, %edx
	leal	(%rdx,%r9), %r8d
	cmpl	%edx, %r10d
	je	.L265
	subl	%edx, %r10d
	leal	-1(%r10), %eax
	cmpl	$6, %eax
	jbe	.L201
.L197:
	leaq	(%rcx,%rdx), %rax
	vmovq	(%rsi,%rdx), %xmm1
	vmovq	(%rsi,%rax), %xmm0
	vpsubb	%xmm1, %xmm0, %xmm0
	vmovq	%xmm0, (%rdi,%rax)
	movl	%r10d, %eax
	andl	$-8, %eax
	addl	%eax, %r8d
	cmpl	%eax, %r10d
	je	.L265
.L201:
	movl	%r8d, %edx
	movslq	%r8d, %rcx
	subl	%r9d, %edx
	movzbl	(%rsi,%rcx), %eax
	movslq	%edx, %rdx
	subb	(%rsi,%rdx), %al
	movb	%al, (%rdi,%rcx)
	leal	1(%r8), %eax
	cmpl	%eax, %ebp
	jle	.L265
	movslq	%eax, %rcx
	subl	%r9d, %eax
	cltq
	movzbl	(%rsi,%rcx), %edx
	subb	(%rsi,%rax), %dl
	leal	2(%r8), %eax
	movb	%dl, (%rdi,%rcx)
	cmpl	%eax, %ebp
	jle	.L265
	movslq	%eax, %rcx
	subl	%r9d, %eax
	cltq
	movzbl	(%rsi,%rcx), %edx
	subb	(%rsi,%rax), %dl
	leal	3(%r8), %eax
	movb	%dl, (%rdi,%rcx)
	cmpl	%eax, %ebp
	jle	.L265
	movslq	%eax, %rcx
	subl	%r9d, %eax
	cltq
	movzbl	(%rsi,%rcx), %edx
	subb	(%rsi,%rax), %dl
	leal	4(%r8), %eax
	movb	%dl, (%rdi,%rcx)
	cmpl	%eax, %ebp
	jle	.L265
	movslq	%eax, %rcx
	subl	%r9d, %eax
	cltq
	movzbl	(%rsi,%rcx), %edx
	subb	(%rsi,%rax), %dl
	leal	5(%r8), %eax
	movb	%dl, (%rdi,%rcx)
	cmpl	%eax, %ebp
	jle	.L265
	movslq	%eax, %rcx
	subl	%r9d, %eax
	cltq
	movzbl	(%rsi,%rcx), %edx
	subb	(%rsi,%rax), %dl
	leal	6(%r8), %eax
	movb	%dl, (%rdi,%rcx)
	cmpl	%eax, %ebp
	jle	.L265
.L267:
	movslq	%eax, %rcx
	subl	%r9d, %eax
	cltq
	movzbl	(%rsi,%rcx), %edx
	subb	(%rsi,%rax), %dl
	movb	%dl, (%rdi,%rcx)
	jmp	.L265
	.p2align 4
	.p2align 3
.L155:
	imull	%r9d, %ebp
	cmpl	%ebp, %r9d
	jge	.L265
	movslq	%r9d, %r8
	movl	%ebp, %r10d
	leaq	1(%rsi), %rbx
	leaq	(%rdi,%r8), %rcx
	leaq	1(%rsi,%r8), %r11
	subl	%r9d, %r10d
	movq	%rcx, %rdx
	leal	-1(%r10), %eax
	subq	%r11, %rdx
	cmpq	$14, %rdx
	movq	%rcx, %rdx
	seta	%r11b
	subq	%rbx, %rdx
	cmpq	$14, %rdx
	seta	%dl
	testb	%dl, %r11b
	je	.L206
	cmpl	$6, %eax
	jbe	.L206
	cmpl	$14, %eax
	jbe	.L207
	movl	%r10d, %edx
	leaq	(%rsi,%r8), %r11
	xorl	%eax, %eax
	shrl	$4, %edx
	salq	$4, %rdx
	.p2align 4
	.p2align 3
.L164:
	vmovdqu	(%r11,%rax), %xmm3
	vpsubb	(%rsi,%rax), %xmm3, %xmm0
	vmovdqu	%xmm0, (%rcx,%rax)
	addq	$16, %rax
	cmpq	%rdx, %rax
	jne	.L164
	movl	%r10d, %edx
	andl	$-16, %edx
	leal	(%rdx,%r9), %ecx
	cmpl	%r10d, %edx
	je	.L265
	subl	%edx, %r10d
	leal	-1(%r10), %eax
	cmpl	$6, %eax
	jbe	.L167
.L163:
	leaq	(%rdx,%r8), %rax
	vmovq	(%rsi,%rdx), %xmm1
	vmovq	(%rsi,%rax), %xmm0
	vpsubb	%xmm1, %xmm0, %xmm0
	vmovq	%xmm0, (%rdi,%rax)
	movl	%r10d, %eax
	andl	$-8, %eax
	addl	%eax, %ecx
	cmpl	%r10d, %eax
	je	.L265
.L167:
	movl	%ecx, %edx
	movslq	%ecx, %r8
	subl	%r9d, %edx
	movzbl	(%rsi,%r8), %eax
	movslq	%edx, %rdx
	subb	(%rsi,%rdx), %al
	movb	%al, (%rdi,%r8)
	leal	1(%rcx), %eax
	cmpl	%eax, %ebp
	jle	.L265
	movslq	%eax, %r8
	subl	%r9d, %eax
	cltq
	movzbl	(%rsi,%r8), %edx
	subb	(%rsi,%rax), %dl
	leal	2(%rcx), %eax
	movb	%dl, (%rdi,%r8)
	cmpl	%ebp, %eax
	jge	.L265
	movslq	%eax, %r8
	subl	%r9d, %eax
	cltq
	movzbl	(%rsi,%r8), %edx
	subb	(%rsi,%rax), %dl
	leal	3(%rcx), %eax
	movb	%dl, (%rdi,%r8)
	cmpl	%eax, %ebp
	jle	.L265
	movslq	%eax, %r8
	subl	%r9d, %eax
	cltq
	movzbl	(%rsi,%r8), %edx
	subb	(%rsi,%rax), %dl
	leal	4(%rcx), %eax
	movb	%dl, (%rdi,%r8)
	cmpl	%eax, %ebp
	jle	.L265
	movslq	%eax, %r8
	subl	%r9d, %eax
	cltq
	movzbl	(%rsi,%r8), %edx
	subb	(%rsi,%rax), %dl
	leal	5(%rcx), %eax
	movb	%dl, (%rdi,%r8)
	cmpl	%ebp, %eax
	jge	.L265
	movslq	%eax, %r8
	subl	%r9d, %eax
	cltq
	movzbl	(%rsi,%r8), %edx
	subb	(%rsi,%rax), %dl
	leal	6(%rcx), %eax
	movb	%dl, (%rdi,%r8)
	cmpl	%ebp, %eax
	jl	.L267
	jmp	.L265
	.p2align 4
	.p2align 3
.L154:
	imull	%r9d, %ebp
	cmpl	%r9d, %ebp
	jle	.L265
	movslq	%r9d, %rcx
	movl	%ebp, %r8d
	movslq	%ebx, %r10
	leaq	(%rdi,%rcx), %r12
	leaq	1(%rsi,%rcx), %r14
	subl	%r9d, %r8d
	movq	%rcx, %r11
	movq	%r12, %r13
	leal	-1(%r8), %edx
	subq	%r10, %r11
	leaq	1(%rcx), %rax
	subq	%r14, %r13
	cmpq	$14, %r13
	seta	%r14b
	cmpl	$6, %edx
	seta	%r13b
	testb	%r13b, %r14b
	je	.L170
	leaq	1(%rsi,%r11), %r14
	movq	%r12, %r13
	subq	%r14, %r13
	cmpq	$14, %r13
	jbe	.L170
	cmpl	$14, %edx
	jbe	.L208
	movl	%r8d, %edx
	leaq	(%rsi,%rcx), %r10
	addq	%rsi, %r11
	xorl	%eax, %eax
	shrl	$4, %edx
	salq	$4, %rdx
	.p2align 4
	.p2align 3
.L172:
	vmovdqu	(%r10,%rax), %xmm2
	vpsubb	(%r11,%rax), %xmm2, %xmm0
	vmovdqu	%xmm0, (%r12,%rax)
	addq	$16, %rax
	cmpq	%rdx, %rax
	jne	.L172
	movl	%r8d, %eax
	andl	$-16, %eax
	addl	%eax, %r9d
	cmpl	%eax, %r8d
	je	.L265
	subl	%eax, %r8d
	leal	-1(%r8), %edx
	cmpl	$6, %edx
	jbe	.L175
.L171:
	addq	%rax, %rcx
	vmovq	(%r11,%rax), %xmm1
	movl	%r8d, %eax
	vmovq	(%rsi,%rcx), %xmm0
	vpsubb	%xmm1, %xmm0, %xmm0
	andl	$-8, %eax
	addl	%eax, %r9d
	vmovq	%xmm0, (%rdi,%rcx)
	cmpl	%r8d, %eax
	je	.L265
.L175:
	movl	%r9d, %edx
	movslq	%r9d, %rcx
	subl	%ebx, %edx
	movzbl	(%rsi,%rcx), %eax
	movslq	%edx, %rdx
	subb	(%rsi,%rdx), %al
	movb	%al, (%rdi,%rcx)
	leal	1(%r9), %eax
	cmpl	%ebp, %eax
	jge	.L265
	movslq	%eax, %rcx
	subl	%ebx, %eax
	cltq
	movzbl	(%rsi,%rcx), %edx
	subb	(%rsi,%rax), %dl
	leal	2(%r9), %eax
	movb	%dl, (%rdi,%rcx)
	cmpl	%ebp, %eax
	jge	.L265
	movslq	%eax, %rcx
	subl	%ebx, %eax
	cltq
	movzbl	(%rsi,%rcx), %edx
	subb	(%rsi,%rax), %dl
	leal	3(%r9), %eax
	movb	%dl, (%rdi,%rcx)
	cmpl	%eax, %ebp
	jle	.L265
	movslq	%eax, %rcx
	subl	%ebx, %eax
	cltq
	movzbl	(%rsi,%rcx), %edx
	subb	(%rsi,%rax), %dl
	leal	4(%r9), %eax
	movb	%dl, (%rdi,%rcx)
	cmpl	%ebp, %eax
	jge	.L265
	movslq	%eax, %rcx
	subl	%ebx, %eax
	cltq
	movzbl	(%rsi,%rcx), %edx
	subb	(%rsi,%rax), %dl
	leal	5(%r9), %eax
	movb	%dl, (%rdi,%rcx)
	cmpl	%eax, %ebp
	jle	.L265
	movslq	%eax, %rcx
	subl	%ebx, %eax
	addl	$6, %r9d
	cltq
	movzbl	(%rsi,%rcx), %edx
	subb	(%rsi,%rax), %dl
	movb	%dl, (%rdi,%rcx)
	cmpl	%r9d, %ebp
	jle	.L265
	movslq	%r9d, %rcx
	subl	%ebx, %r9d
	movslq	%r9d, %rax
	movzbl	(%rsi,%rcx), %edx
	subb	(%rsi,%rax), %dl
	movb	%dl, (%rdi,%rcx)
	jmp	.L265
	.p2align 4
	.p2align 3
.L153:
	imull	%r9d, %ebp
	cmpl	%r9d, %ebp
	jle	.L265
	movslq	%r9d, %rax
	movl	%ebp, %r11d
	movslq	%ebx, %rdx
	leaq	1(%rsi), %r13
	leaq	(%rdi,%rax), %r10
	leaq	1(%rsi,%rax), %r12
	movq	%rax, %rcx
	subl	%r9d, %r11d
	movq	%r10, %r8
	subq	%rdx, %rcx
	subq	%r12, %r8
	cmpq	$14, %r8
	movq	%r10, %r8
	seta	%r12b
	subq	%r13, %r8
	cmpq	$14, %r8
	seta	%r8b
	testb	%r8b, %r12b
	je	.L209
	leaq	1(%rsi,%rcx), %r12
	movq	%r10, %r8
	subq	%r12, %r8
	cmpq	$14, %r8
	leal	-1(%r11), %r8d
	seta	%r12b
	cmpl	$14, %r8d
	seta	%r8b
	testb	%r8b, %r12b
	je	.L209
	vmovdqa	.LC11(%rip), %xmm2
	vmovdqa	.LC12(%rip), %xmm3
	movl	%r11d, %edx
	leaq	(%rsi,%rax), %r8
	shrl	$4, %edx
	addq	%rsi, %rcx
	xorl	%eax, %eax
	salq	$4, %rdx
	.p2align 4
	.p2align 3
.L179:
	vmovdqu	(%rsi,%rax), %xmm4
	vpsrlw	$1, %xmm4, %xmm0
	vmovdqu	(%rcx,%rax), %xmm4
	vpand	%xmm0, %xmm2, %xmm0
	vpsrlw	$1, %xmm4, %xmm1
	vmovdqu	(%r8,%rax), %xmm4
	vpand	%xmm1, %xmm2, %xmm1
	vpaddb	%xmm1, %xmm0, %xmm0
	vpsubb	%xmm0, %xmm4, %xmm1
	vmovdqu	(%rsi,%rax), %xmm4
	vpand	(%rcx,%rax), %xmm4, %xmm0
	vpand	%xmm3, %xmm0, %xmm0
	vpsubb	%xmm0, %xmm1, %xmm0
	vmovdqu	%xmm0, (%r10,%rax)
	addq	$16, %rax
	cmpq	%rdx, %rax
	jne	.L179
	movl	%r11d, %edx
	andl	$-16, %edx
	leal	(%r9,%rdx), %eax
	cmpl	%edx, %r11d
	je	.L265
	movl	%eax, %ecx
	movslq	%edx, %rdx
	movslq	%eax, %r8
	subl	%ebx, %ecx
	movzbl	(%rsi,%rdx), %edx
	movslq	%ecx, %rcx
	movzbl	(%rsi,%rcx), %ecx
	addl	%ecx, %edx
	movzbl	(%rsi,%r8), %ecx
	sarl	%edx
	subl	%edx, %ecx
	leal	1(%rax), %edx
	movb	%cl, (%rdi,%r8)
	cmpl	%edx, %ebp
	jle	.L265
	movl	%edx, %ecx
	movslq	%edx, %r8
	subl	%ebx, %edx
	subl	%r9d, %ecx
	movslq	%edx, %rdx
	movslq	%ecx, %rcx
	movzbl	(%rsi,%rdx), %edx
	movzbl	(%rsi,%rcx), %ecx
	addl	%ecx, %edx
	movzbl	(%rsi,%r8), %ecx
	sarl	%edx
	subl	%edx, %ecx
	leal	2(%rax), %edx
	movb	%cl, (%rdi,%r8)
	cmpl	%edx, %ebp
	jle	.L265
	movl	%edx, %ecx
	movslq	%edx, %r8
	subl	%ebx, %edx
	subl	%r9d, %ecx
	movslq	%edx, %rdx
	movslq	%ecx, %rcx
	movzbl	(%rsi,%rdx), %edx
	movzbl	(%rsi,%rcx), %ecx
	addl	%ecx, %edx
	movzbl	(%rsi,%r8), %ecx
	sarl	%edx
	subl	%edx, %ecx
	leal	3(%rax), %edx
	movb	%cl, (%rdi,%r8)
	cmpl	%edx, %ebp
	jle	.L265
	movl	%edx, %ecx
	movslq	%edx, %r8
	subl	%ebx, %edx
	subl	%r9d, %ecx
	movslq	%edx, %rdx
	movslq	%ecx, %rcx
	movzbl	(%rsi,%rdx), %edx
	movzbl	(%rsi,%rcx), %ecx
	addl	%ecx, %edx
	movzbl	(%rsi,%r8), %ecx
	sarl	%edx
	subl	%edx, %ecx
	leal	4(%rax), %edx
	movb	%cl, (%rdi,%r8)
	cmpl	%edx, %ebp
	jle	.L265
	movl	%edx, %ecx
	movslq	%edx, %r8
	subl	%ebx, %edx
	subl	%r9d, %ecx
	movslq	%edx, %rdx
	movslq	%ecx, %rcx
	movzbl	(%rsi,%rdx), %edx
	movzbl	(%rsi,%rcx), %ecx
	addl	%ecx, %edx
	movzbl	(%rsi,%r8), %ecx
	sarl	%edx
	subl	%edx, %ecx
	leal	5(%rax), %edx
	movb	%cl, (%rdi,%r8)
	cmpl	%edx, %ebp
	jle	.L265
	movl	%edx, %ecx
	movslq	%edx, %r8
	subl	%ebx, %edx
	subl	%r9d, %ecx
	movslq	%edx, %rdx
	movslq	%ecx, %rcx
	movzbl	(%rsi,%rdx), %edx
	movzbl	(%rsi,%rcx), %ecx
	addl	%ecx, %edx
	movzbl	(%rsi,%r8), %ecx
	sarl	%edx
	subl	%edx, %ecx
	leal	6(%rax), %edx
	movb	%cl, (%rdi,%r8)
	cmpl	%edx, %ebp
	jle	.L265
	movl	%edx, %ecx
	movslq	%edx, %r8
	subl	%ebx, %edx
	subl	%r9d, %ecx
	movslq	%edx, %rdx
	movslq	%ecx, %rcx
	movzbl	(%rsi,%rdx), %edx
	movzbl	(%rsi,%rcx), %ecx
	addl	%ecx, %edx
	movzbl	(%rsi,%r8), %ecx
	sarl	%edx
	subl	%edx, %ecx
	leal	7(%rax), %edx
	movb	%cl, (%rdi,%r8)
	cmpl	%edx, %ebp
	jle	.L265
	movl	%edx, %ecx
	movslq	%edx, %r8
	subl	%ebx, %edx
	subl	%r9d, %ecx
	movslq	%edx, %rdx
	movslq	%ecx, %rcx
	movzbl	(%rsi,%rdx), %edx
	movzbl	(%rsi,%rcx), %ecx
	addl	%ecx, %edx
	movzbl	(%rsi,%r8), %ecx
	sarl	%edx
	subl	%edx, %ecx
	leal	8(%rax), %edx
	movb	%cl, (%rdi,%r8)
	cmpl	%edx, %ebp
	jle	.L265
	movl	%edx, %ecx
	movslq	%edx, %r8
	subl	%ebx, %edx
	subl	%r9d, %ecx
	movslq	%edx, %rdx
	movslq	%ecx, %rcx
	movzbl	(%rsi,%rdx), %edx
	movzbl	(%rsi,%rcx), %ecx
	addl	%ecx, %edx
	movzbl	(%rsi,%r8), %ecx
	sarl	%edx
	subl	%edx, %ecx
	leal	9(%rax), %edx
	movb	%cl, (%rdi,%r8)
	cmpl	%edx, %ebp
	jle	.L265
	movl	%edx, %ecx
	movslq	%edx, %r8
	subl	%ebx, %edx
	subl	%r9d, %ecx
	movslq	%edx, %rdx
	movslq	%ecx, %rcx
	movzbl	(%rsi,%rdx), %edx
	movzbl	(%rsi,%rcx), %ecx
	addl	%ecx, %edx
	movzbl	(%rsi,%r8), %ecx
	sarl	%edx
	subl	%edx, %ecx
	leal	10(%rax), %edx
	movb	%cl, (%rdi,%r8)
	cmpl	%edx, %ebp
	jle	.L265
	movl	%edx, %ecx
	movslq	%edx, %r8
	subl	%ebx, %edx
	subl	%r9d, %ecx
	movslq	%edx, %rdx
	movslq	%ecx, %rcx
	movzbl	(%rsi,%rdx), %edx
	movzbl	(%rsi,%rcx), %ecx
	addl	%ecx, %edx
	movzbl	(%rsi,%r8), %ecx
	sarl	%edx
	subl	%edx, %ecx
	leal	11(%rax), %edx
	movb	%cl, (%rdi,%r8)
	cmpl	%edx, %ebp
	jle	.L265
	movl	%edx, %ecx
	movslq	%edx, %r8
	subl	%ebx, %edx
	subl	%r9d, %ecx
	movslq	%edx, %rdx
	movslq	%ecx, %rcx
	movzbl	(%rsi,%rdx), %edx
	movzbl	(%rsi,%rcx), %ecx
	addl	%ecx, %edx
	movzbl	(%rsi,%r8), %ecx
	sarl	%edx
	subl	%edx, %ecx
	leal	12(%rax), %edx
	movb	%cl, (%rdi,%r8)
	cmpl	%edx, %ebp
	jle	.L265
	movl	%edx, %ecx
	movslq	%edx, %r8
	subl	%ebx, %edx
	subl	%r9d, %ecx
	movslq	%edx, %rdx
	movslq	%ecx, %rcx
	movzbl	(%rsi,%rdx), %edx
	movzbl	(%rsi,%rcx), %ecx
	addl	%ecx, %edx
	movzbl	(%rsi,%r8), %ecx
	sarl	%edx
	subl	%edx, %ecx
	leal	13(%rax), %edx
	movb	%cl, (%rdi,%r8)
	cmpl	%edx, %ebp
	jle	.L265
	movl	%edx, %ecx
	movslq	%edx, %r8
	subl	%ebx, %edx
	addl	$14, %eax
	subl	%r9d, %ecx
	movslq	%edx, %rdx
	movslq	%ecx, %rcx
	movzbl	(%rsi,%rdx), %edx
	movzbl	(%rsi,%rcx), %ecx
	addl	%ecx, %edx
	movzbl	(%rsi,%r8), %ecx
	sarl	%edx
	subl	%edx, %ecx
	movb	%cl, (%rdi,%r8)
	cmpl	%eax, %ebp
	jle	.L265
	movl	%eax, %edx
	movslq	%eax, %rcx
	subl	%ebx, %eax
	subl	%r9d, %edx
	cltq
	movslq	%edx, %rdx
	movzbl	(%rsi,%rax), %eax
	movzbl	(%rsi,%rdx), %edx
	addl	%edx, %eax
	movzbl	(%rsi,%rcx), %edx
	sarl	%eax
	subl	%eax, %edx
	movb	%dl, (%rdi,%rcx)
	jmp	.L265
	.p2align 4
	.p2align 3
.L151:
	imull	%r9d, %ebp
	cmpl	%ebp, %r9d
	jge	.L265
	movslq	%r9d, %rax
	movl	%ebp, %r10d
	leaq	1(%rsi), %r11
	leaq	(%rdi,%rax), %r8
	leaq	1(%rsi,%rax), %rcx
	subl	%r9d, %r10d
	movq	%r8, %rdx
	subq	%rcx, %rdx
	cmpq	$14, %rdx
	movq	%r8, %rdx
	seta	%cl
	subq	%r11, %rdx
	cmpq	$14, %rdx
	seta	%dl
	testb	%dl, %cl
	je	.L213
	leal	-1(%r10), %edx
	cmpl	$14, %edx
	jbe	.L213
	vmovdqa	.LC11(%rip), %xmm2
	movl	%r10d, %ecx
	leaq	(%rsi,%rax), %rdx
	xorl	%eax, %eax
	shrl	$4, %ecx
	salq	$4, %rcx
	.p2align 4
	.p2align 3
.L192:
	vmovdqu	(%rsi,%rax), %xmm3
	vpsrlw	$1, %xmm3, %xmm0
	vmovdqu	(%rdx,%rax), %xmm3
	vpand	%xmm0, %xmm2, %xmm0
	vpsubb	%xmm0, %xmm3, %xmm0
	vmovdqu	%xmm0, (%r8,%rax)
	addq	$16, %rax
	cmpq	%rcx, %rax
	jne	.L192
	movl	%r10d, %edx
	andl	$-16, %edx
	leal	(%r9,%rdx), %eax
	cmpl	%edx, %r10d
	je	.L265
	movslq	%edx, %rdx
	movslq	%eax, %r8
	movzbl	(%rsi,%rdx), %ecx
	movzbl	(%rsi,%r8), %edx
	shrb	%cl
	subl	%ecx, %edx
	movb	%dl, (%rdi,%r8)
	leal	1(%rax), %edx
	cmpl	%edx, %ebp
	jle	.L265
	movslq	%edx, %r8
	subl	%r9d, %edx
	movslq	%edx, %rdx
	movzbl	(%rsi,%rdx), %ecx
	movzbl	(%rsi,%r8), %edx
	shrb	%cl
	subl	%ecx, %edx
	movb	%dl, (%rdi,%r8)
	leal	2(%rax), %edx
	cmpl	%edx, %ebp
	jle	.L265
	movslq	%edx, %r8
	subl	%r9d, %edx
	movslq	%edx, %rdx
	movzbl	(%rsi,%rdx), %ecx
	movzbl	(%rsi,%r8), %edx
	shrb	%cl
	subl	%ecx, %edx
	movb	%dl, (%rdi,%r8)
	leal	3(%rax), %edx
	cmpl	%edx, %ebp
	jle	.L265
	movslq	%edx, %r8
	subl	%r9d, %edx
	movslq	%edx, %rdx
	movzbl	(%rsi,%rdx), %ecx
	movzbl	(%rsi,%r8), %edx
	shrb	%cl
	subl	%ecx, %edx
	movb	%dl, (%rdi,%r8)
	leal	4(%rax), %edx
	cmpl	%edx, %ebp
	jle	.L265
	movslq	%edx, %r8
	subl	%r9d, %edx
	movslq	%edx, %rdx
	movzbl	(%rsi,%rdx), %ecx
	movzbl	(%rsi,%r8), %edx
	shrb	%cl
	subl	%ecx, %edx
	movb	%dl, (%rdi,%r8)
	leal	5(%rax), %edx
	cmpl	%edx, %ebp
	jle	.L265
	movslq	%edx, %r8
	subl	%r9d, %edx
	movslq	%edx, %rdx
	movzbl	(%rsi,%rdx), %ecx
	movzbl	(%rsi,%r8), %edx
	shrb	%cl
	subl	%ecx, %edx
	movb	%dl, (%rdi,%r8)
	leal	6(%rax), %edx
	cmpl	%edx, %ebp
	jle	.L265
	movslq	%edx, %r8
	subl	%r9d, %edx
	movslq	%edx, %rdx
	movzbl	(%rsi,%rdx), %ecx
	movzbl	(%rsi,%r8), %edx
	shrb	%cl
	subl	%ecx, %edx
	movb	%dl, (%rdi,%r8)
	leal	7(%rax), %edx
	cmpl	%edx, %ebp
	jle	.L265
	movslq	%edx, %r8
	subl	%r9d, %edx
	movslq	%edx, %rdx
	movzbl	(%rsi,%rdx), %ecx
	movzbl	(%rsi,%r8), %edx
	shrb	%cl
	subl	%ecx, %edx
	movb	%dl, (%rdi,%r8)
	leal	8(%rax), %edx
	cmpl	%edx, %ebp
	jle	.L265
	movslq	%edx, %r8
	subl	%r9d, %edx
	movslq	%edx, %rdx
	movzbl	(%rsi,%rdx), %ecx
	movzbl	(%rsi,%r8), %edx
	shrb	%cl
	subl	%ecx, %edx
	movb	%dl, (%rdi,%r8)
	leal	9(%rax), %edx
	cmpl	%edx, %ebp
	jle	.L265
	movslq	%edx, %r8
	subl	%r9d, %edx
	movslq	%edx, %rdx
	movzbl	(%rsi,%rdx), %ecx
	movzbl	(%rsi,%r8), %edx
	shrb	%cl
	subl	%ecx, %edx
	movb	%dl, (%rdi,%r8)
	leal	10(%rax), %edx
	cmpl	%edx, %ebp
	jle	.L265
	movslq	%edx, %r8
	subl	%r9d, %edx
	movslq	%edx, %rdx
	movzbl	(%rsi,%rdx), %ecx
	movzbl	(%rsi,%r8), %edx
	shrb	%cl
	subl	%ecx, %edx
	movb	%dl, (%rdi,%r8)
	leal	11(%rax), %edx
	cmpl	%edx, %ebp
	jle	.L265
	movslq	%edx, %r8
	subl	%r9d, %edx
	movslq	%edx, %rdx
	movzbl	(%rsi,%rdx), %ecx
	movzbl	(%rsi,%r8), %edx
	shrb	%cl
	subl	%ecx, %edx
	movb	%dl, (%rdi,%r8)
	leal	12(%rax), %edx
	cmpl	%edx, %ebp
	jle	.L265
	movslq	%edx, %r8
	subl	%r9d, %edx
	movslq	%edx, %rdx
	movzbl	(%rsi,%rdx), %ecx
	movzbl	(%rsi,%r8), %edx
	shrb	%cl
	subl	%ecx, %edx
	movb	%dl, (%rdi,%r8)
	leal	13(%rax), %edx
	cmpl	%edx, %ebp
	jle	.L265
	movslq	%edx, %r8
	subl	%r9d, %edx
	addl	$14, %eax
	movslq	%edx, %rdx
	movzbl	(%rsi,%rdx), %ecx
	movzbl	(%rsi,%r8), %edx
	shrb	%cl
	subl	%ecx, %edx
	movb	%dl, (%rdi,%r8)
	cmpl	%eax, %ebp
	jle	.L265
	movslq	%eax, %rcx
	subl	%r9d, %eax
	cltq
	movzbl	(%rsi,%rax), %edx
	movzbl	(%rsi,%rcx), %eax
	shrb	%dl
	subl	%edx, %eax
	movb	%al, (%rdi,%rcx)
	jmp	.L265
.L213:
	movq	%rsi, %r8
	subq	%rax, %r8
	.p2align 4
	.p2align 3
.L191:
	movzbl	(%r8,%rax), %ecx
	movzbl	(%rsi,%rax), %edx
	shrb	%cl
	subl	%ecx, %edx
	movb	%dl, (%rdi,%rax)
	incq	%rax
	cmpl	%eax, %ebp
	jg	.L191
	jmp	.L265
.L209:
	movq	%rsi, %r9
	movq	%rsi, %r8
	subq	%rax, %r9
	subq	%rdx, %r8
	.p2align 4
	.p2align 3
.L178:
	movzbl	(%r8,%rax), %ecx
	movzbl	(%r9,%rax), %edx
	addl	%ecx, %edx
	movzbl	(%rsi,%rax), %ecx
	sarl	%edx
	subl	%edx, %ecx
	movb	%cl, (%rdi,%rax)
	incq	%rax
	cmpl	%eax, %ebp
	jg	.L178
	jmp	.L265
.L210:
	movq	%rsi, %rbx
	subq	%rdx, %rax
	movq	%rsi, %r15
	subq	%r10, %rbx
	addq	%rsi, %rax
	subq	%rdx, %r15
	movq	%rbx, -120(%rsp)
	.p2align 4
	.p2align 3
.L183:
	movq	-120(%rsp), %rbx
	movzbl	(%rax,%rdx), %r9d
	movzbl	(%rsi,%rdx), %r10d
	movzbl	(%rbx,%rdx), %r8d
	movzbl	(%r15,%rdx), %ebx
	movl	%r9d, %ebp
	leal	(%rbx,%r8), %ecx
	movl	%r8d, %r12d
	movl	%ebx, %r11d
	subl	%r9d, %ecx
	movl	%ecx, %r13d
	subl	%r8d, %r13d
	movl	%r13d, %r8d
	negl	%r8d
	cmovs	%r13d, %r8d
	movl	%ecx, %r13d
	subl	%r9d, %r13d
	movl	%r13d, %r9d
	negl	%r9d
	cmovs	%r13d, %r9d
	movl	%r8d, %r13d
	cmpl	%r8d, %r9d
	cmovle	%r9d, %r13d
	subl	%ebx, %ecx
	movl	%ecx, %ebx
	negl	%ebx
	cmovs	%ecx, %ebx
	cmpl	%ebx, %r13d
	jge	.L190
	cmpl	%r8d, %r9d
	movl	%ebp, %r11d
	cmovge	%r12d, %r11d
.L190:
	subl	%r11d, %r10d
	movb	%r10b, (%rdi,%rdx)
	incq	%rdx
	cmpl	%edx, %r14d
	jg	.L183
	jmp	.L265
.L170:
	movq	%rsi, %r8
	subq	%r10, %r8
	jmp	.L264
	.p2align 4
	.p2align 3
.L269:
	incq	%rax
.L264:
	movzbl	(%rsi,%rcx), %edx
	subb	(%r8,%rcx), %dl
	movb	%dl, (%rdi,%rcx)
	movq	%rax, %rcx
	cmpl	%eax, %ebp
	jg	.L269
	jmp	.L265
.L206:
	movq	%rsi, %rcx
	movq	%r8, %rax
	subq	%r8, %rcx
	.p2align 4
	.p2align 3
.L162:
	movzbl	(%rsi,%rax), %edx
	subb	(%rcx,%rax), %dl
	movb	%dl, (%rdi,%rax)
	incq	%rax
	cmpl	%eax, %ebp
	jg	.L162
	jmp	.L265
.L214:
	movq	%rcx, %rax
	movq	%rsi, %rcx
	subq	%rax, %rcx
	.p2align 4
	.p2align 3
.L196:
	movzbl	(%rsi,%rax), %edx
	subb	(%rcx,%rax), %dl
	movb	%dl, (%rdi,%rax)
	incq	%rax
	cmpl	%eax, %ebp
	jg	.L196
	jmp	.L265
.L215:
	movl	%r9d, %r8d
	xorl	%edx, %edx
	jmp	.L197
.L208:
	xorl	%eax, %eax
	addq	%rsi, %r11
	jmp	.L171
.L207:
	movl	%r9d, %ecx
	xorl	%edx, %edx
	jmp	.L163
	.cfi_endproc
.LFE822:
	.size	stbiw__encode_png_line, .-stbiw__encode_png_line
	.section	.rodata.str1.1
.LC14:
	.string	"stb_image.h"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC15:
	.string	"req_comp >= 1 && req_comp <= 4"
	.section	.rodata.str1.1
.LC16:
	.string	"outofmem"
	.text
	.p2align 4
	.type	stbi__convert_format16, @function
stbi__convert_format16:
.LFB637:
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
	movq	%rdi, %rbp
	subq	$168, %rsp
	.cfi_def_cfa_offset 224
	movl	%r8d, 8(%rsp)
	cmpl	%esi, %edx
	je	.L336
	movl	%edx, %eax
	movl	%edx, %r13d
	movl	%ecx, %r15d
	imull	%ecx, %eax
	movl	%eax, 12(%rsp)
	leal	-1(%rdx), %eax
	cmpl	$3, %eax
	ja	.L536
	movl	12(%rsp), %edi
	movl	%esi, %ebx
	movl	%r8d, %r14d
	imull	%r8d, %edi
	addl	%edi, %edi
	call	malloc@PLT
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L273
	testl	%r14d, %r14d
	jle	.L335
	movl	%ebx, %eax
	leal	-1(%r15), %r14d
	movl	$1, %edi
	vmovdqa	.LC13(%rip), %xmm4
	imull	%r15d, %eax
	vmovdqa	.LC29(%rip), %xmm14
	leal	-10(%r13,%rbx,8), %r13d
	movl	%eax, 16(%rsp)
	leal	-2(%r15), %eax
	cmpl	$-1, %eax
	cmovge	%r15d, %edi
	setl	%al
	cmpl	$7, %r14d
	setbe	%dl
	leal	-1(%rdi), %ecx
	movl	%edi, 20(%rsp)
	orl	%eax, %edx
	movl	%ecx, 136(%rsp)
	movb	%dl, 43(%rsp)
	movl	%ecx, %edx
	andl	$-8, %ecx
	shrl	$3, %edx
	movl	%ecx, 140(%rsp)
	leal	-1(%rdx), %esi
	movq	%rsi, %rdx
	salq	$6, %rdx
	movq	%rdx, 96(%rsp)
	movl	%r14d, %edx
	subl	%ecx, %edx
	movl	%edx, 44(%rsp)
	leaq	0(,%rcx,8), %rdx
	movq	%rdx, 88(%rsp)
	leaq	(%rcx,%rcx), %rdx
	movq	%rdx, 120(%rsp)
	addq	%rcx, %rdx
	addq	%rdx, %rdx
	cmpl	$6, %r14d
	movq	%rdx, 128(%rsp)
	setbe	%dl
	xorl	%r8d, %r8d
	xorl	%r9d, %r9d
	orl	%eax, %edx
	movl	%edi, %eax
	andl	$-8, %edi
	shrl	$3, %eax
	movb	%dl, 42(%rsp)
	movl	%edi, 24(%rsp)
	leal	-1(%rax), %edx
	movq	%rdx, %rax
	salq	$6, %rax
	movq	%rax, 104(%rsp)
	movl	%r14d, %eax
	subl	%edi, %eax
	movl	%eax, 28(%rsp)
	movl	%edi, %eax
	leaq	0(,%rax,8), %rdi
	movq	%rdi, 56(%rsp)
	leaq	0(,%rax,4), %rdi
	movq	%rdi, 32(%rsp)
	leaq	(%rax,%rax), %rdi
	addq	%rdi, %rax
	movq	%rdi, 72(%rsp)
	xorl	%edi, %edi
	addq	%rax, %rax
	movq	%rax, 48(%rsp)
	movq	%rdx, %rax
	incq	%rdx
	salq	$5, %rax
	salq	$4, %rdx
	movq	%rax, 112(%rsp)
	leaq	0(,%rcx,4), %rax
	movq	%rdx, 64(%rsp)
	movq	%rax, 80(%rsp)
	leaq	1(%rsi), %rax
	movq	%rax, 152(%rsp)
	salq	$4, %rax
	movq	%rax, 144(%rsp)
	.p2align 4
	.p2align 3
.L334:
	movl	%r8d, %r10d
	movl	%edi, %r11d
	leaq	(%r10,%r10), %rsi
	leaq	0(%rbp,%r11,2), %rdx
	leaq	(%r12,%rsi), %rax
	cmpl	$25, %r13d
	ja	.L275
	leaq	.L277(%rip), %rbx
	movl	%r13d, %ecx
	movslq	(%rbx,%rcx,4), %rcx
	addq	%rbx, %rcx
	notrack jmp	*%rcx
	.section	.rodata
	.align 4
	.align 4
.L277:
	.long	.L288-.L277
	.long	.L287-.L277
	.long	.L286-.L277
	.long	.L275-.L277
	.long	.L275-.L277
	.long	.L275-.L277
	.long	.L275-.L277
	.long	.L285-.L277
	.long	.L275-.L277
	.long	.L284-.L277
	.long	.L283-.L277
	.long	.L275-.L277
	.long	.L275-.L277
	.long	.L275-.L277
	.long	.L275-.L277
	.long	.L282-.L277
	.long	.L281-.L277
	.long	.L275-.L277
	.long	.L280-.L277
	.long	.L275-.L277
	.long	.L275-.L277
	.long	.L275-.L277
	.long	.L275-.L277
	.long	.L279-.L277
	.long	.L278-.L277
	.long	.L276-.L277
	.text
	.p2align 4
	.p2align 3
.L276:
	testl	%r14d, %r14d
	js	.L289
	cmpb	$0, 43(%rsp)
	jne	.L347
	movq	96(%rsp), %rbx
	movq	%rdx, %rcx
	movq	%rax, %rsi
	leaq	64(%rdx,%rbx), %r10
	.p2align 4
	.p2align 3
.L333:
	vmovdqu	48(%rcx), %xmm5
	vmovdqu	32(%rcx), %xmm2
	addq	$64, %rcx
	addq	$48, %rsi
	vmovdqu	-48(%rcx), %xmm0
	vpshufb	.LC33(%rip), %xmm5, %xmm1
	vmovdqu	-64(%rcx), %xmm5
	vpshufb	.LC32(%rip), %xmm2, %xmm3
	vpor	%xmm1, %xmm3, %xmm3
	vpshufb	.LC37(%rip), %xmm2, %xmm2
	vmovdqu	%xmm3, -16(%rsi)
	vpshufb	.LC34(%rip), %xmm5, %xmm1
	vpshufb	.LC35(%rip), %xmm0, %xmm5
	vpshufb	.LC36(%rip), %xmm0, %xmm0
	vpor	%xmm5, %xmm1, %xmm1
	vpor	%xmm2, %xmm0, %xmm0
	vmovdqu	%xmm1, -48(%rsi)
	vmovdqu	%xmm0, -32(%rsi)
	cmpq	%rcx, %r10
	jne	.L333
	addq	88(%rsp), %rdx
	addq	128(%rsp), %rax
	movl	44(%rsp), %ecx
.L332:
	movzwl	(%rdx), %esi
	movw	%si, (%rax)
	movzwl	2(%rdx), %esi
	movw	%si, 2(%rax)
	movzwl	4(%rdx), %esi
	movw	%si, 4(%rax)
	testl	%ecx, %ecx
	je	.L289
	movzwl	8(%rdx), %esi
	movw	%si, 6(%rax)
	movzwl	10(%rdx), %esi
	movw	%si, 8(%rax)
	movzwl	12(%rdx), %esi
	movw	%si, 10(%rax)
	cmpl	$1, %ecx
	je	.L289
	movzwl	16(%rdx), %esi
	movw	%si, 12(%rax)
	movzwl	18(%rdx), %esi
	movw	%si, 14(%rax)
	movzwl	20(%rdx), %esi
	movw	%si, 16(%rax)
	cmpl	$2, %ecx
	je	.L289
	movzwl	24(%rdx), %esi
	movw	%si, 18(%rax)
	movzwl	26(%rdx), %esi
	movw	%si, 20(%rax)
	movzwl	28(%rdx), %esi
	movw	%si, 22(%rax)
	cmpl	$3, %ecx
	je	.L289
	movzwl	32(%rdx), %esi
	movw	%si, 24(%rax)
	movzwl	34(%rdx), %esi
	movw	%si, 26(%rax)
	movzwl	36(%rdx), %esi
	movw	%si, 28(%rax)
	cmpl	$4, %ecx
	je	.L289
	movzwl	40(%rdx), %esi
	movw	%si, 30(%rax)
	movzwl	42(%rdx), %esi
	movw	%si, 32(%rax)
	movzwl	44(%rdx), %esi
	movw	%si, 34(%rax)
	cmpl	$5, %ecx
	je	.L289
	movzwl	48(%rdx), %esi
	movw	%si, 36(%rax)
	movzwl	50(%rdx), %esi
	movw	%si, 38(%rax)
	movzwl	52(%rdx), %esi
	movw	%si, 40(%rax)
	cmpl	$6, %ecx
	je	.L289
	movzwl	56(%rdx), %ecx
	movw	%cx, 42(%rax)
	movzwl	58(%rdx), %ecx
	movw	%cx, 44(%rax)
	movzwl	60(%rdx), %edx
	movw	%dx, 46(%rax)
	jmp	.L289
	.p2align 4
	.p2align 3
.L278:
	testl	%r14d, %r14d
	js	.L289
	cmpb	$0, 42(%rsp)
	jne	.L346
	movq	104(%rsp), %rbx
	movq	%rdx, %rcx
	movq	%rax, %rsi
	leaq	64(%rdx,%rbx), %r10
	.p2align 4
	.p2align 3
.L329:
	vmovdqu	(%rcx), %xmm5
	vpand	16(%rcx), %xmm4, %xmm0
	addq	$64, %rcx
	addq	$32, %rsi
	vpand	-64(%rcx), %xmm4, %xmm3
	vpand	-32(%rcx), %xmm4, %xmm2
	vpsrld	$16, %xmm5, %xmm1
	vmovdqu	-48(%rcx), %xmm5
	vpackusdw	%xmm0, %xmm3, %xmm3
	vpand	%xmm3, %xmm4, %xmm7
	vpsrld	$16, %xmm3, %xmm3
	vpsrld	$16, %xmm5, %xmm0
	vmovdqu	-32(%rcx), %xmm5
	vpackusdw	%xmm0, %xmm1, %xmm1
	vpand	-16(%rcx), %xmm4, %xmm0
	vpand	%xmm1, %xmm4, %xmm6
	vpsrld	$16, %xmm1, %xmm1
	vpackusdw	%xmm0, %xmm2, %xmm2
	vpsrld	$16, %xmm5, %xmm0
	vmovdqu	-16(%rcx), %xmm5
	vpsrld	$16, %xmm5, %xmm5
	vpackusdw	%xmm5, %xmm0, %xmm0
	vpand	%xmm2, %xmm4, %xmm5
	vpsrld	$16, %xmm2, %xmm2
	vpackusdw	%xmm2, %xmm3, %xmm3
	vpand	%xmm0, %xmm4, %xmm2
	vpackusdw	%xmm5, %xmm7, %xmm7
	vpsrld	$16, %xmm0, %xmm0
	vpmullw	%xmm14, %xmm7, %xmm5
	vpackusdw	%xmm2, %xmm6, %xmm6
	vpackusdw	%xmm0, %xmm1, %xmm1
	vpmullw	.LC30(%rip), %xmm6, %xmm2
	vpmulhuw	.LC30(%rip), %xmm6, %xmm6
	vpmulhuw	%xmm14, %xmm7, %xmm7
	vpunpcklwd	%xmm7, %xmm5, %xmm8
	vpunpckhwd	%xmm7, %xmm5, %xmm5
	vpunpcklwd	%xmm6, %xmm2, %xmm0
	vpunpckhwd	%xmm6, %xmm2, %xmm2
	vpaddd	%xmm8, %xmm0, %xmm0
	vpmullw	.LC31(%rip), %xmm3, %xmm8
	vpaddd	%xmm5, %xmm2, %xmm2
	vpmulhuw	.LC31(%rip), %xmm3, %xmm3
	vpunpcklwd	%xmm3, %xmm8, %xmm9
	vpunpckhwd	%xmm3, %xmm8, %xmm3
	vpaddd	%xmm9, %xmm0, %xmm0
	vpaddd	%xmm3, %xmm2, %xmm2
	vpsrad	$8, %xmm0, %xmm0
	vpsrad	$8, %xmm2, %xmm2
	vpand	%xmm0, %xmm4, %xmm0
	vpand	%xmm2, %xmm4, %xmm2
	vpackusdw	%xmm2, %xmm0, %xmm0
	vpunpcklwd	%xmm1, %xmm0, %xmm2
	vpunpckhwd	%xmm1, %xmm0, %xmm0
	vmovdqu	%xmm2, -32(%rsi)
	vmovdqu	%xmm0, -16(%rsi)
	cmpq	%rcx, %r10
	jne	.L329
	addq	56(%rsp), %rdx
	addq	32(%rsp), %rax
	movl	20(%rsp), %esi
	cmpl	%esi, 24(%rsp)
	je	.L289
	movl	28(%rsp), %esi
.L328:
	movzwl	(%rdx), %ecx
	movzwl	2(%rdx), %r10d
	imull	$77, %ecx, %ecx
	imull	$150, %r10d, %r10d
	addl	%r10d, %ecx
	movzwl	4(%rdx), %r10d
	imull	$29, %r10d, %r10d
	addl	%r10d, %ecx
	sarl	$8, %ecx
	movw	%cx, (%rax)
	movzwl	6(%rdx), %ecx
	movw	%cx, 2(%rax)
	testl	%esi, %esi
	je	.L289
	movzwl	8(%rdx), %ecx
	movzwl	10(%rdx), %r10d
	imull	$77, %ecx, %ecx
	imull	$150, %r10d, %r10d
	addl	%r10d, %ecx
	movzwl	12(%rdx), %r10d
	imull	$29, %r10d, %r10d
	addl	%r10d, %ecx
	sarl	$8, %ecx
	movw	%cx, 4(%rax)
	movzwl	14(%rdx), %ecx
	movw	%cx, 6(%rax)
	cmpl	$1, %esi
	je	.L289
	movzwl	16(%rdx), %ecx
	movzwl	18(%rdx), %r10d
	imull	$77, %ecx, %ecx
	imull	$150, %r10d, %r10d
	addl	%r10d, %ecx
	movzwl	20(%rdx), %r10d
	imull	$29, %r10d, %r10d
	addl	%r10d, %ecx
	sarl	$8, %ecx
	movw	%cx, 8(%rax)
	movzwl	22(%rdx), %ecx
	movw	%cx, 10(%rax)
	cmpl	$2, %esi
	je	.L289
	movzwl	24(%rdx), %ecx
	movzwl	26(%rdx), %r10d
	imull	$77, %ecx, %ecx
	imull	$150, %r10d, %r10d
	addl	%r10d, %ecx
	movzwl	28(%rdx), %r10d
	imull	$29, %r10d, %r10d
	addl	%r10d, %ecx
	sarl	$8, %ecx
	movw	%cx, 12(%rax)
	movzwl	30(%rdx), %ecx
	movw	%cx, 14(%rax)
	cmpl	$3, %esi
	je	.L289
	movzwl	32(%rdx), %ecx
	movzwl	34(%rdx), %r10d
	imull	$77, %ecx, %ecx
	imull	$150, %r10d, %r10d
	addl	%r10d, %ecx
	movzwl	36(%rdx), %r10d
	imull	$29, %r10d, %r10d
	addl	%r10d, %ecx
	sarl	$8, %ecx
	movw	%cx, 16(%rax)
	movzwl	38(%rdx), %ecx
	movw	%cx, 18(%rax)
	cmpl	$4, %esi
	je	.L289
	movzwl	40(%rdx), %ecx
	movzwl	42(%rdx), %r10d
	imull	$77, %ecx, %ecx
	imull	$150, %r10d, %r10d
	addl	%r10d, %ecx
	movzwl	44(%rdx), %r10d
	imull	$29, %r10d, %r10d
	addl	%r10d, %ecx
	sarl	$8, %ecx
	movw	%cx, 20(%rax)
	movzwl	46(%rdx), %ecx
	movw	%cx, 22(%rax)
	cmpl	$5, %esi
	je	.L289
	movzwl	48(%rdx), %ecx
	movzwl	50(%rdx), %esi
	imull	$77, %ecx, %ecx
	imull	$150, %esi, %esi
	addl	%esi, %ecx
	movzwl	52(%rdx), %esi
	imull	$29, %esi, %esi
	addl	%esi, %ecx
	sarl	$8, %ecx
	movw	%cx, 24(%rax)
	movzwl	54(%rdx), %edx
	movw	%dx, 26(%rax)
	jmp	.L289
	.p2align 4
	.p2align 3
.L279:
	testl	%r14d, %r14d
	js	.L289
	cmpb	$0, 43(%rsp)
	jne	.L345
	vmovdqa	.LC13(%rip), %xmm0
	vmovdqa	.LC29(%rip), %xmm5
	movq	%rdx, %rcx
	movq	%rax, %rsi
	vmovdqa	.LC30(%rip), %xmm3
	vmovdqa	.LC31(%rip), %xmm2
	movq	96(%rsp), %rbx
	leaq	64(%rdx,%rbx), %r10
	.p2align 4
	.p2align 3
.L327:
	vpand	16(%rcx), %xmm0, %xmm1
	vpand	(%rcx), %xmm0, %xmm8
	addq	$64, %rcx
	addq	$16, %rsi
	vpand	-16(%rcx), %xmm0, %xmm6
	vmovdqu	-16(%rcx), %xmm15
	vpackusdw	%xmm1, %xmm8, %xmm8
	vpand	-32(%rcx), %xmm0, %xmm1
	vpand	%xmm8, %xmm0, %xmm7
	vpsrld	$16, %xmm8, %xmm8
	vpsrld	$16, %xmm15, %xmm9
	vpackusdw	%xmm6, %xmm1, %xmm1
	vpand	%xmm1, %xmm0, %xmm6
	vpsrld	$16, %xmm1, %xmm1
	vpackusdw	%xmm1, %xmm8, %xmm8
	vpackusdw	%xmm6, %xmm7, %xmm7
	vmovdqu	-64(%rcx), %xmm6
	vpmullw	%xmm5, %xmm7, %xmm10
	vpmulhuw	%xmm5, %xmm7, %xmm11
	vpsrld	$16, %xmm6, %xmm1
	vmovdqu	-48(%rcx), %xmm6
	vpsrld	$16, %xmm6, %xmm6
	vpackusdw	%xmm6, %xmm1, %xmm1
	vmovdqu	-32(%rcx), %xmm6
	vpand	%xmm1, %xmm0, %xmm1
	vpsrld	$16, %xmm6, %xmm6
	vpackusdw	%xmm9, %xmm6, %xmm6
	vpunpcklwd	%xmm11, %xmm10, %xmm9
	vpunpckhwd	%xmm11, %xmm10, %xmm10
	vpand	%xmm6, %xmm0, %xmm6
	vpackusdw	%xmm6, %xmm1, %xmm6
	vpmullw	%xmm3, %xmm6, %xmm7
	vpmulhuw	%xmm3, %xmm6, %xmm1
	vpunpcklwd	%xmm1, %xmm7, %xmm6
	vpunpckhwd	%xmm1, %xmm7, %xmm1
	vpaddd	%xmm9, %xmm6, %xmm6
	vpaddd	%xmm10, %xmm1, %xmm1
	vpmullw	%xmm2, %xmm8, %xmm9
	vpmulhuw	%xmm2, %xmm8, %xmm8
	vpunpcklwd	%xmm8, %xmm9, %xmm12
	vpunpckhwd	%xmm8, %xmm9, %xmm9
	vpaddd	%xmm12, %xmm6, %xmm6
	vpaddd	%xmm9, %xmm1, %xmm1
	vpsrad	$8, %xmm6, %xmm6
	vpsrad	$8, %xmm1, %xmm1
	vpand	%xmm6, %xmm0, %xmm6
	vpand	%xmm1, %xmm0, %xmm1
	vpackusdw	%xmm1, %xmm6, %xmm1
	vmovdqu	%xmm1, -16(%rsi)
	cmpq	%rcx, %r10
	jne	.L327
	addq	88(%rsp), %rdx
	addq	120(%rsp), %rax
	movl	44(%rsp), %esi
.L326:
	movzwl	(%rdx), %ecx
	movzwl	2(%rdx), %r10d
	imull	$77, %ecx, %ecx
	imull	$150, %r10d, %r10d
	addl	%r10d, %ecx
	movzwl	4(%rdx), %r10d
	imull	$29, %r10d, %r10d
	addl	%r10d, %ecx
	sarl	$8, %ecx
	movw	%cx, (%rax)
	testl	%esi, %esi
	je	.L289
	movzwl	8(%rdx), %ecx
	movzwl	10(%rdx), %r10d
	imull	$77, %ecx, %ecx
	imull	$150, %r10d, %r10d
	addl	%r10d, %ecx
	movzwl	12(%rdx), %r10d
	imull	$29, %r10d, %r10d
	addl	%r10d, %ecx
	sarl	$8, %ecx
	movw	%cx, 2(%rax)
	cmpl	$1, %esi
	je	.L289
	movzwl	16(%rdx), %ecx
	movzwl	18(%rdx), %r10d
	imull	$77, %ecx, %ecx
	imull	$150, %r10d, %r10d
	addl	%r10d, %ecx
	movzwl	20(%rdx), %r10d
	imull	$29, %r10d, %r10d
	addl	%r10d, %ecx
	sarl	$8, %ecx
	movw	%cx, 4(%rax)
	cmpl	$2, %esi
	je	.L289
	movzwl	24(%rdx), %ecx
	movzwl	26(%rdx), %r10d
	imull	$77, %ecx, %ecx
	imull	$150, %r10d, %r10d
	addl	%r10d, %ecx
	movzwl	28(%rdx), %r10d
	imull	$29, %r10d, %r10d
	addl	%r10d, %ecx
	sarl	$8, %ecx
	movw	%cx, 6(%rax)
	cmpl	$3, %esi
	je	.L289
	movzwl	32(%rdx), %ecx
	movzwl	34(%rdx), %r10d
	imull	$77, %ecx, %ecx
	imull	$150, %r10d, %r10d
	addl	%r10d, %ecx
	movzwl	36(%rdx), %r10d
	imull	$29, %r10d, %r10d
	addl	%r10d, %ecx
	sarl	$8, %ecx
	movw	%cx, 8(%rax)
	cmpl	$4, %esi
	je	.L289
	movzwl	40(%rdx), %ecx
	movzwl	42(%rdx), %r10d
	imull	$77, %ecx, %ecx
	imull	$150, %r10d, %r10d
	addl	%r10d, %ecx
	movzwl	44(%rdx), %r10d
	imull	$29, %r10d, %r10d
	addl	%r10d, %ecx
	sarl	$8, %ecx
	movw	%cx, 10(%rax)
	cmpl	$5, %esi
	je	.L289
	movzwl	48(%rdx), %ecx
	movzwl	50(%rdx), %r10d
	imull	$77, %ecx, %ecx
	imull	$150, %r10d, %r10d
	addl	%r10d, %ecx
	movzwl	52(%rdx), %r10d
	imull	$29, %r10d, %r10d
	addl	%r10d, %ecx
	sarl	$8, %ecx
	movw	%cx, 12(%rax)
	cmpl	$6, %esi
	je	.L289
	movzwl	56(%rdx), %esi
	movzwl	58(%rdx), %ecx
	movzwl	60(%rdx), %edx
	imull	$77, %esi, %esi
	imull	$150, %ecx, %ecx
	imull	$29, %edx, %edx
	addl	%esi, %ecx
	addl	%edx, %ecx
	sarl	$8, %ecx
	movw	%cx, 14(%rax)
	jmp	.L289
	.p2align 4
	.p2align 3
.L280:
	testl	%r14d, %r14d
	js	.L289
	cmpb	$0, 42(%rsp)
	jne	.L342
	movq	104(%rsp), %r15
	movq	%rdx, %rbx
	movq	%rax, %rcx
	leaq	6(%r12,%rsi), %rsi
	leaq	64(%rax,%r15), %r15
	.p2align 4
	.p2align 3
.L313:
	vmovdqu	(%rbx), %xmm2
	vmovdqu	16(%rbx), %xmm1
	addq	$64, %rcx
	addq	$48, %rbx
	vmovdqu	-16(%rbx), %xmm0
	addq	$64, %rsi
	vpextrw	$0, %xmm2, -64(%rcx)
	vpextrw	$1, %xmm2, -62(%rcx)
	vpextrw	$2, %xmm2, -60(%rcx)
	vpextrw	$3, %xmm2, -56(%rcx)
	vpextrw	$4, %xmm2, -54(%rcx)
	vpextrw	$5, %xmm2, -52(%rcx)
	vpextrw	$6, %xmm2, -48(%rcx)
	vpextrw	$7, %xmm2, -46(%rcx)
	vpextrw	$0, %xmm1, -44(%rcx)
	vpextrw	$1, %xmm1, -40(%rcx)
	vpextrw	$2, %xmm1, -38(%rcx)
	vpextrw	$3, %xmm1, -36(%rcx)
	vpextrw	$4, %xmm1, -32(%rcx)
	vpextrw	$5, %xmm1, -30(%rcx)
	vpextrw	$6, %xmm1, -28(%rcx)
	vpextrw	$7, %xmm1, -24(%rcx)
	vpextrw	$0, %xmm0, -22(%rcx)
	vpextrw	$1, %xmm0, -20(%rcx)
	vpextrw	$2, %xmm0, -16(%rcx)
	vpextrw	$3, %xmm0, -14(%rcx)
	vpextrw	$4, %xmm0, -12(%rcx)
	vpextrw	$5, %xmm0, -8(%rcx)
	vpextrw	$6, %xmm0, -6(%rcx)
	vpextrw	$7, %xmm0, -4(%rcx)
	movw	$-1, -64(%rsi)
	movw	$-1, -56(%rsi)
	movw	$-1, -48(%rsi)
	movw	$-1, -40(%rsi)
	movw	$-1, -32(%rsi)
	movw	$-1, -24(%rsi)
	movw	$-1, -16(%rsi)
	movw	$-1, -8(%rsi)
	cmpq	%rcx, %r15
	jne	.L313
	movl	24(%rsp), %ecx
	movl	20(%rsp), %ebx
	addq	48(%rsp), %rdx
	addq	56(%rsp), %rax
	cmpl	%ebx, %ecx
	je	.L289
	movl	28(%rsp), %esi
.L312:
	subl	%ecx, %ebx
	leal	-1(%rbx), %r15d
	cmpl	$2, %r15d
	jbe	.L316
	leaq	(%rcx,%rcx,2), %r15
	leaq	(%r10,%rcx,4), %rcx
	addq	%r11, %r15
	addq	%rcx, %rcx
	leaq	0(%rbp,%r15,2), %r11
	leaq	6(%r12,%rcx), %r10
	vmovq	(%r11), %xmm2
	vmovq	8(%r11), %xmm1
	vmovq	16(%r11), %xmm0
	vpextrw	$0, %xmm2, (%r12,%rcx)
	vpextrw	$1, %xmm2, 2(%r12,%rcx)
	vpextrw	$2, %xmm2, 4(%r12,%rcx)
	vpextrw	$3, %xmm2, 8(%r12,%rcx)
	vpextrw	$0, %xmm1, 10(%r12,%rcx)
	vpextrw	$1, %xmm1, 12(%r12,%rcx)
	vpextrw	$2, %xmm1, 16(%r12,%rcx)
	vpextrw	$3, %xmm1, 18(%r12,%rcx)
	vpextrw	$0, %xmm0, 20(%r12,%rcx)
	vpextrw	$1, %xmm0, 24(%r12,%rcx)
	vpextrw	$2, %xmm0, 26(%r12,%rcx)
	vpextrw	$3, %xmm0, 28(%r12,%rcx)
	movl	%ebx, %ecx
	movw	$-1, (%r10)
	movw	$-1, 8(%r10)
	andl	$-4, %ecx
	movw	$-1, 16(%r10)
	movw	$-1, 24(%r10)
	movl	%ecx, %r10d
	subl	%ecx, %esi
	leaq	(%r10,%r10,2), %r11
	leaq	(%rax,%r10,8), %rax
	leaq	(%rdx,%r11,2), %rdx
	cmpl	%ecx, %ebx
	je	.L289
.L316:
	movzwl	(%rdx), %ecx
	movw	%cx, (%rax)
	movzwl	2(%rdx), %ecx
	movw	%cx, 2(%rax)
	movzwl	4(%rdx), %ecx
	movw	$-1, 6(%rax)
	movw	%cx, 4(%rax)
	testl	%esi, %esi
	je	.L289
	movzwl	6(%rdx), %ecx
	movw	%cx, 8(%rax)
	movzwl	8(%rdx), %ecx
	movw	%cx, 10(%rax)
	movzwl	10(%rdx), %ecx
	movw	$-1, 14(%rax)
	movw	%cx, 12(%rax)
	cmpl	$1, %esi
	je	.L289
	movzwl	12(%rdx), %ecx
	movw	%cx, 16(%rax)
	movzwl	14(%rdx), %ecx
	movw	%cx, 18(%rax)
	movzwl	16(%rdx), %edx
	movw	$-1, 22(%rax)
	movw	%dx, 20(%rax)
	.p2align 4
	.p2align 3
.L289:
	addl	16(%rsp), %edi
	incl	%r9d
	addl	12(%rsp), %r8d
	cmpl	8(%rsp), %r9d
	jne	.L334
.L335:
	movq	%rbp, %rdi
	call	free@PLT
.L270:
	addq	$168, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%r12, %rax
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
	.p2align 4
	.p2align 3
.L281:
	.cfi_restore_state
	testl	%r14d, %r14d
	js	.L289
	cmpb	$0, 42(%rsp)
	jne	.L344
	vmovdqa	.LC13(%rip), %xmm0
	vmovdqa	.LC28(%rip), %xmm6
	movq	%rdx, %rsi
	movq	%rax, %rcx
	vmovdqa	.LC29(%rip), %xmm5
	vmovdqa	.LC30(%rip), %xmm3
	vpcmpeqd	%xmm9, %xmm9, %xmm9
	vmovdqa	.LC31(%rip), %xmm2
	movq	112(%rsp), %rbx
	leaq	32(%rax,%rbx), %r10
	.p2align 4
	.p2align 3
.L323:
	vmovdqu	32(%rsi), %xmm15
	vmovdqu	(%rsi), %xmm7
	addq	$32, %rcx
	addq	$48, %rsi
	vmovdqu	-32(%rsi), %xmm1
	vpshufb	%xmm6, %xmm15, %xmm8
	vpshufb	%xmm6, %xmm7, %xmm7
	vpshufb	%xmm6, %xmm1, %xmm1
	vpalignr	$12, %xmm7, %xmm1, %xmm10
	vpalignr	$12, %xmm1, %xmm8, %xmm1
	vpalignr	$12, %xmm8, %xmm7, %xmm7
	vpalignr	$10, %xmm1, %xmm10, %xmm11
	vpalignr	$10, %xmm10, %xmm7, %xmm10
	vpalignr	$10, %xmm7, %xmm1, %xmm7
	vpalignr	$10, %xmm10, %xmm10, %xmm10
	vpmullw	%xmm7, %xmm3, %xmm8
	vpalignr	$6, %xmm11, %xmm11, %xmm11
	vpmullw	%xmm5, %xmm10, %xmm13
	vpmulhuw	%xmm3, %xmm7, %xmm1
	vpmulhuw	%xmm5, %xmm10, %xmm10
	vpunpcklwd	%xmm1, %xmm8, %xmm7
	vpunpckhwd	%xmm1, %xmm8, %xmm1
	vpunpcklwd	%xmm10, %xmm13, %xmm12
	vpunpckhwd	%xmm10, %xmm13, %xmm13
	vpaddd	%xmm12, %xmm7, %xmm7
	vpaddd	%xmm13, %xmm1, %xmm1
	vpmullw	%xmm2, %xmm11, %xmm12
	vpmulhuw	%xmm2, %xmm11, %xmm11
	vpunpcklwd	%xmm11, %xmm12, %xmm15
	vpunpckhwd	%xmm11, %xmm12, %xmm12
	vpaddd	%xmm15, %xmm7, %xmm7
	vpaddd	%xmm12, %xmm1, %xmm1
	vpsrad	$8, %xmm7, %xmm7
	vpsrad	$8, %xmm1, %xmm1
	vpand	%xmm7, %xmm0, %xmm7
	vpand	%xmm1, %xmm0, %xmm1
	vpackusdw	%xmm1, %xmm7, %xmm1
	vpunpcklwd	%xmm9, %xmm1, %xmm7
	vpunpckhwd	%xmm9, %xmm1, %xmm1
	vmovdqu	%xmm7, -32(%rcx)
	vmovdqu	%xmm1, -16(%rcx)
	cmpq	%rcx, %r10
	jne	.L323
	addq	48(%rsp), %rdx
	addq	32(%rsp), %rax
	movl	20(%rsp), %esi
	cmpl	%esi, 24(%rsp)
	je	.L289
	movl	28(%rsp), %esi
.L322:
	movzwl	(%rdx), %ecx
	movzwl	2(%rdx), %r10d
	imull	$77, %ecx, %ecx
	imull	$150, %r10d, %r10d
	addl	%r10d, %ecx
	movzwl	4(%rdx), %r10d
	movw	$-1, 2(%rax)
	imull	$29, %r10d, %r10d
	addl	%r10d, %ecx
	sarl	$8, %ecx
	movw	%cx, (%rax)
	testl	%esi, %esi
	je	.L289
	movzwl	6(%rdx), %ecx
	movzwl	8(%rdx), %r10d
	imull	$77, %ecx, %ecx
	imull	$150, %r10d, %r10d
	addl	%r10d, %ecx
	movzwl	10(%rdx), %r10d
	movw	$-1, 6(%rax)
	imull	$29, %r10d, %r10d
	addl	%r10d, %ecx
	sarl	$8, %ecx
	movw	%cx, 4(%rax)
	cmpl	$1, %esi
	je	.L289
	movzwl	12(%rdx), %ecx
	movzwl	14(%rdx), %r10d
	imull	$77, %ecx, %ecx
	imull	$150, %r10d, %r10d
	addl	%r10d, %ecx
	movzwl	16(%rdx), %r10d
	movw	$-1, 10(%rax)
	imull	$29, %r10d, %r10d
	addl	%r10d, %ecx
	sarl	$8, %ecx
	movw	%cx, 8(%rax)
	cmpl	$2, %esi
	je	.L289
	movzwl	18(%rdx), %ecx
	movzwl	20(%rdx), %r10d
	imull	$77, %ecx, %ecx
	imull	$150, %r10d, %r10d
	addl	%r10d, %ecx
	movzwl	22(%rdx), %r10d
	movw	$-1, 14(%rax)
	imull	$29, %r10d, %r10d
	addl	%r10d, %ecx
	sarl	$8, %ecx
	movw	%cx, 12(%rax)
	cmpl	$3, %esi
	je	.L289
	movzwl	24(%rdx), %ecx
	movzwl	26(%rdx), %r10d
	imull	$77, %ecx, %ecx
	imull	$150, %r10d, %r10d
	addl	%r10d, %ecx
	movzwl	28(%rdx), %r10d
	movw	$-1, 18(%rax)
	imull	$29, %r10d, %r10d
	addl	%r10d, %ecx
	sarl	$8, %ecx
	movw	%cx, 16(%rax)
	cmpl	$4, %esi
	je	.L289
	movzwl	30(%rdx), %ecx
	movzwl	32(%rdx), %r10d
	imull	$77, %ecx, %ecx
	imull	$150, %r10d, %r10d
	addl	%r10d, %ecx
	movzwl	34(%rdx), %r10d
	movw	$-1, 22(%rax)
	imull	$29, %r10d, %r10d
	addl	%r10d, %ecx
	sarl	$8, %ecx
	movw	%cx, 20(%rax)
	cmpl	$5, %esi
	je	.L289
	movzwl	36(%rdx), %esi
	movzwl	38(%rdx), %ecx
	movzwl	40(%rdx), %edx
	movw	$-1, 26(%rax)
	imull	$77, %esi, %esi
	imull	$150, %ecx, %ecx
	imull	$29, %edx, %edx
	addl	%esi, %ecx
	addl	%edx, %ecx
	sarl	$8, %ecx
	movw	%cx, 24(%rax)
	jmp	.L289
	.p2align 4
	.p2align 3
.L282:
	testl	%r14d, %r14d
	js	.L289
	cmpb	$0, 42(%rsp)
	jne	.L343
	vmovdqa	.LC13(%rip), %xmm0
	vmovdqa	.LC28(%rip), %xmm6
	movq	%rdx, %rcx
	movq	%rax, %rsi
	vmovdqa	.LC29(%rip), %xmm5
	vmovdqa	.LC30(%rip), %xmm3
	vmovdqa	.LC31(%rip), %xmm2
	movq	64(%rsp), %rbx
	leaq	(%rax,%rbx), %r10
	.p2align 4
	.p2align 3
.L319:
	vmovdqu	(%rcx), %xmm7
	addq	$16, %rsi
	addq	$48, %rcx
	vpshufb	%xmm6, %xmm7, %xmm8
	vmovdqu	-32(%rcx), %xmm7
	vpshufb	%xmm6, %xmm7, %xmm1
	vmovdqu	-16(%rcx), %xmm7
	vpalignr	$12, %xmm8, %xmm1, %xmm9
	vpshufb	%xmm6, %xmm7, %xmm7
	vpalignr	$12, %xmm1, %xmm7, %xmm1
	vpalignr	$12, %xmm7, %xmm8, %xmm8
	vpalignr	$10, %xmm1, %xmm9, %xmm13
	vpalignr	$10, %xmm8, %xmm1, %xmm7
	vpalignr	$10, %xmm9, %xmm8, %xmm9
	vpmulhuw	%xmm3, %xmm7, %xmm1
	vpalignr	$10, %xmm9, %xmm9, %xmm9
	vpalignr	$6, %xmm13, %xmm13, %xmm13
	vpmullw	%xmm5, %xmm9, %xmm12
	vpmullw	%xmm7, %xmm3, %xmm8
	vpmulhuw	%xmm5, %xmm9, %xmm9
	vpunpcklwd	%xmm1, %xmm8, %xmm10
	vpunpckhwd	%xmm1, %xmm8, %xmm1
	vpmulhuw	%xmm2, %xmm13, %xmm7
	vpunpcklwd	%xmm9, %xmm12, %xmm11
	vpunpckhwd	%xmm9, %xmm12, %xmm12
	vpaddd	%xmm11, %xmm10, %xmm10
	vpaddd	%xmm12, %xmm1, %xmm1
	vpmullw	%xmm2, %xmm13, %xmm11
	vpunpcklwd	%xmm7, %xmm11, %xmm13
	vpunpckhwd	%xmm7, %xmm11, %xmm11
	vpaddd	%xmm13, %xmm10, %xmm10
	vpaddd	%xmm11, %xmm1, %xmm1
	vpsrad	$8, %xmm10, %xmm10
	vpsrad	$8, %xmm1, %xmm1
	vpand	%xmm10, %xmm0, %xmm7
	vpand	%xmm1, %xmm0, %xmm1
	vpackusdw	%xmm1, %xmm7, %xmm1
	vmovdqu	%xmm1, -16(%rsi)
	cmpq	%rsi, %r10
	jne	.L319
	addq	48(%rsp), %rdx
	addq	72(%rsp), %rax
	movl	20(%rsp), %esi
	cmpl	%esi, 24(%rsp)
	je	.L289
	movl	28(%rsp), %esi
.L318:
	movzwl	2(%rdx), %ecx
	movzwl	(%rdx), %r10d
	imull	$150, %ecx, %ecx
	imull	$77, %r10d, %r10d
	addl	%r10d, %ecx
	movzwl	4(%rdx), %r10d
	imull	$29, %r10d, %r10d
	addl	%r10d, %ecx
	sarl	$8, %ecx
	movw	%cx, (%rax)
	testl	%esi, %esi
	je	.L289
	movzwl	8(%rdx), %ecx
	movzwl	6(%rdx), %r10d
	imull	$150, %ecx, %ecx
	imull	$77, %r10d, %r10d
	addl	%r10d, %ecx
	movzwl	10(%rdx), %r10d
	imull	$29, %r10d, %r10d
	addl	%r10d, %ecx
	sarl	$8, %ecx
	movw	%cx, 2(%rax)
	cmpl	$1, %esi
	je	.L289
	movzwl	14(%rdx), %ecx
	movzwl	12(%rdx), %r10d
	imull	$150, %ecx, %ecx
	imull	$77, %r10d, %r10d
	addl	%r10d, %ecx
	movzwl	16(%rdx), %r10d
	imull	$29, %r10d, %r10d
	addl	%r10d, %ecx
	sarl	$8, %ecx
	movw	%cx, 4(%rax)
	cmpl	$2, %esi
	je	.L289
	movzwl	20(%rdx), %ecx
	movzwl	18(%rdx), %r10d
	imull	$150, %ecx, %ecx
	imull	$77, %r10d, %r10d
	addl	%r10d, %ecx
	movzwl	22(%rdx), %r10d
	imull	$29, %r10d, %r10d
	addl	%r10d, %ecx
	sarl	$8, %ecx
	movw	%cx, 6(%rax)
	cmpl	$3, %esi
	je	.L289
	movzwl	24(%rdx), %ecx
	movzwl	26(%rdx), %r10d
	imull	$77, %ecx, %ecx
	imull	$150, %r10d, %r10d
	addl	%r10d, %ecx
	movzwl	28(%rdx), %r10d
	imull	$29, %r10d, %r10d
	addl	%r10d, %ecx
	sarl	$8, %ecx
	movw	%cx, 8(%rax)
	cmpl	$4, %esi
	je	.L289
	movzwl	30(%rdx), %ecx
	movzwl	32(%rdx), %r10d
	imull	$77, %ecx, %ecx
	imull	$150, %r10d, %r10d
	addl	%r10d, %ecx
	movzwl	34(%rdx), %r10d
	imull	$29, %r10d, %r10d
	addl	%r10d, %ecx
	sarl	$8, %ecx
	movw	%cx, 10(%rax)
	cmpl	$5, %esi
	je	.L289
	movzwl	36(%rdx), %esi
	movzwl	38(%rdx), %ecx
	movzwl	40(%rdx), %edx
	imull	$77, %esi, %esi
	imull	$150, %ecx, %ecx
	imull	$29, %edx, %edx
	addl	%esi, %ecx
	addl	%edx, %ecx
	sarl	$8, %ecx
	movw	%cx, 12(%rax)
	jmp	.L289
	.p2align 4
	.p2align 3
.L283:
	testl	%r14d, %r14d
	js	.L289
	cmpb	$0, 42(%rsp)
	jne	.L341
	vmovdqa	.LC13(%rip), %xmm0
	movq	112(%rsp), %rbx
	movq	%rdx, %rsi
	movq	%rax, %rcx
	leaq	32(%rdx,%rbx), %rbx
	.p2align 4
	.p2align 3
.L307:
	vpand	16(%rsi), %xmm0, %xmm2
	vmovdqu	(%rsi), %xmm5
	addq	$32, %rsi
	addq	$64, %rcx
	vpand	-32(%rsi), %xmm0, %xmm1
	vpackusdw	%xmm2, %xmm1, %xmm1
	vpsrld	$16, %xmm5, %xmm2
	vmovdqu	-16(%rsi), %xmm5
	vpsrld	$16, %xmm5, %xmm3
	vpackusdw	%xmm3, %xmm2, %xmm2
	vpunpcklwd	%xmm1, %xmm1, %xmm5
	vpunpckhwd	%xmm1, %xmm1, %xmm3
	vpunpcklwd	%xmm2, %xmm1, %xmm6
	vpunpckhwd	%xmm2, %xmm1, %xmm1
	vpunpcklwd	%xmm6, %xmm5, %xmm2
	vpunpckhwd	%xmm6, %xmm5, %xmm5
	vmovdqu	%xmm2, -64(%rcx)
	vpunpcklwd	%xmm1, %xmm3, %xmm2
	vpunpckhwd	%xmm1, %xmm3, %xmm3
	vmovdqu	%xmm5, -48(%rcx)
	vmovdqu	%xmm2, -32(%rcx)
	vmovdqu	%xmm3, -16(%rcx)
	cmpq	%rsi, %rbx
	jne	.L307
	movl	24(%rsp), %esi
	movl	20(%rsp), %ebx
	addq	32(%rsp), %rdx
	addq	56(%rsp), %rax
	cmpl	%ebx, %esi
	je	.L289
.L306:
	subl	%esi, %ebx
	cmpl	$1, %ebx
	je	.L310
	leaq	(%r11,%rsi,2), %r11
	leaq	(%r10,%rsi,4), %rsi
	leal	-1(%rbx), %ecx
	leaq	0(%rbp,%r11,2), %r11
	leaq	(%r12,%rsi,2), %rsi
	vmovq	(%r11), %xmm0
	vpshuflw	$64, %xmm0, %xmm0
	vmovq	%xmm0, (%rsi)
	cmpl	$2, %ebx
	je	.L311
	vmovq	4(%r11), %xmm0
	vpshuflw	$64, %xmm0, %xmm0
	vmovq	%xmm0, 8(%rsi)
	cmpl	$2, %ecx
	je	.L311
	vmovq	8(%r11), %xmm0
	vpshuflw	$64, %xmm0, %xmm0
	vmovq	%xmm0, 16(%rsi)
	cmpl	$3, %ecx
	je	.L311
	vmovq	12(%r11), %xmm0
	vpshuflw	$64, %xmm0, %xmm0
	vmovq	%xmm0, 24(%rsi)
	cmpl	$4, %ecx
	je	.L311
	vmovq	16(%r11), %xmm0
	vpshuflw	$64, %xmm0, %xmm0
	vmovq	%xmm0, 32(%rsi)
	cmpl	$5, %ecx
	je	.L311
	vmovq	20(%r11), %xmm0
	vpshuflw	$64, %xmm0, %xmm0
	vmovq	%xmm0, 40(%rsi)
.L311:
	leaq	(%rdx,%rcx,4), %rdx
	leaq	(%rax,%rcx,8), %rax
.L310:
	movzwl	(%rdx), %ecx
	movw	%cx, 4(%rax)
	movw	%cx, 2(%rax)
	movw	%cx, (%rax)
	movzwl	2(%rdx), %edx
	movw	%dx, 6(%rax)
	jmp	.L289
	.p2align 4
	.p2align 3
.L284:
	testl	%r14d, %r14d
	js	.L289
	cmpb	$0, 43(%rsp)
	jne	.L340
	vmovdqa	.LC25(%rip), %xmm5
	vmovdqa	.LC26(%rip), %xmm3
	movq	%rdx, %rsi
	movq	%rax, %rcx
	vmovdqa	.LC27(%rip), %xmm2
	movq	152(%rsp), %r10
	salq	$5, %r10
	addq	%rdx, %r10
	.p2align 4
	.p2align 3
.L305:
	vmovdqu	(%rsi), %xmm6
	vmovdqu	16(%rsi), %xmm1
	addq	$32, %rsi
	addq	$48, %rcx
	vpshufb	%xmm5, %xmm6, %xmm0
	vmovdqu	%xmm0, -48(%rcx)
	vpalignr	$8, -32(%rsi), %xmm1, %xmm0
	vpshufb	%xmm2, %xmm1, %xmm1
	vpshufb	%xmm3, %xmm0, %xmm0
	vmovdqu	%xmm0, -32(%rcx)
	vmovdqu	%xmm1, -16(%rcx)
	cmpq	%rsi, %r10
	jne	.L305
	addq	80(%rsp), %rdx
	addq	128(%rsp), %rax
	movl	44(%rsp), %ecx
.L304:
	movzwl	(%rdx), %esi
	movw	%si, 4(%rax)
	movw	%si, 2(%rax)
	movw	%si, (%rax)
	testl	%ecx, %ecx
	je	.L289
	movzwl	4(%rdx), %esi
	movw	%si, 10(%rax)
	movw	%si, 8(%rax)
	movw	%si, 6(%rax)
	cmpl	$1, %ecx
	je	.L289
	movzwl	8(%rdx), %esi
	movw	%si, 16(%rax)
	movw	%si, 14(%rax)
	movw	%si, 12(%rax)
	cmpl	$2, %ecx
	je	.L289
	movzwl	12(%rdx), %esi
	movw	%si, 22(%rax)
	movw	%si, 20(%rax)
	movw	%si, 18(%rax)
	cmpl	$3, %ecx
	je	.L289
	movzwl	16(%rdx), %esi
	movw	%si, 28(%rax)
	movw	%si, 26(%rax)
	movw	%si, 24(%rax)
	cmpl	$4, %ecx
	je	.L289
	movzwl	20(%rdx), %esi
	movw	%si, 34(%rax)
	movw	%si, 32(%rax)
	movw	%si, 30(%rax)
	cmpl	$5, %ecx
	je	.L289
	movzwl	24(%rdx), %esi
	movw	%si, 40(%rax)
	movw	%si, 38(%rax)
	movw	%si, 36(%rax)
	cmpl	$6, %ecx
	je	.L289
	movzwl	28(%rdx), %edx
	movw	%dx, 46(%rax)
	movw	%dx, 44(%rax)
	movw	%dx, 42(%rax)
	jmp	.L289
	.p2align 4
	.p2align 3
.L285:
	testl	%r14d, %r14d
	js	.L289
	cmpb	$0, 43(%rsp)
	jne	.L339
	vmovdqa	.LC13(%rip), %xmm0
	movq	144(%rsp), %rsi
	xorl	%ecx, %ecx
	.p2align 4
	.p2align 3
.L302:
	vpand	(%rdx,%rcx,2), %xmm0, %xmm1
	vpand	16(%rdx,%rcx,2), %xmm0, %xmm2
	vpackusdw	%xmm2, %xmm1, %xmm1
	vmovdqu	%xmm1, (%rax,%rcx)
	addq	$16, %rcx
	cmpq	%rcx, %rsi
	jne	.L302
	addq	80(%rsp), %rdx
	addq	120(%rsp), %rax
	movl	140(%rsp), %esi
	movl	44(%rsp), %ebx
.L301:
	movl	136(%rsp), %ecx
	subl	%esi, %ecx
	cmpl	$3, %ecx
	jbe	.L303
	leaq	(%r11,%rsi,2), %r11
	andl	$-4, %ecx
	addq	%r10, %rsi
	leaq	0(%rbp,%r11,2), %r11
	subl	%ecx, %ebx
	leaq	(%rdx,%rcx,4), %rdx
	leaq	(%rax,%rcx,2), %rax
	vmovq	(%r11), %xmm0
	vmovq	8(%r11), %xmm1
	vpunpcklwd	%xmm1, %xmm0, %xmm2
	vpunpcklwd	%xmm1, %xmm0, %xmm0
	vpshufd	$14, %xmm2, %xmm2
	vpunpcklwd	%xmm2, %xmm0, %xmm0
	vmovq	%xmm0, (%r12,%rsi,2)
.L303:
	movzwl	(%rdx), %ecx
	movw	%cx, (%rax)
	testl	%ebx, %ebx
	je	.L289
	movzwl	4(%rdx), %ecx
	movw	%cx, 2(%rax)
	cmpl	$1, %ebx
	je	.L289
	movzwl	8(%rdx), %ecx
	movw	%cx, 4(%rax)
	cmpl	$2, %ebx
	je	.L289
	movzwl	12(%rdx), %edx
	movw	%dx, 6(%rax)
	jmp	.L289
	.p2align 4
	.p2align 3
.L286:
	testl	%r14d, %r14d
	js	.L289
	movl	%r14d, %esi
	.p2align 4
	.p2align 3
.L300:
	movzwl	(%rdx), %ecx
	decl	%esi
	movw	$-1, 6(%rax)
	addq	$2, %rdx
	addq	$8, %rax
	movw	%cx, -4(%rax)
	movw	%cx, -6(%rax)
	movw	%cx, -8(%rax)
	cmpl	$-1, %esi
	jne	.L300
	jmp	.L289
	.p2align 4
	.p2align 3
.L288:
	testl	%r14d, %r14d
	js	.L289
	cmpb	$0, 42(%rsp)
	jne	.L337
	movq	64(%rsp), %rsi
	xorl	%ecx, %ecx
	vpcmpeqd	%xmm1, %xmm1, %xmm1
	.p2align 4
	.p2align 3
.L291:
	vmovdqu	(%rdx,%rcx), %xmm0
	vpunpcklwd	%xmm1, %xmm0, %xmm2
	vpunpckhwd	%xmm1, %xmm0, %xmm0
	vmovdqu	%xmm2, (%rax,%rcx,2)
	vmovdqu	%xmm0, 16(%rax,%rcx,2)
	addq	$16, %rcx
	cmpq	%rcx, %rsi
	jne	.L291
	movl	24(%rsp), %ecx
	movl	20(%rsp), %ebx
	addq	72(%rsp), %rdx
	addq	32(%rsp), %rax
	cmpl	%ebx, %ecx
	je	.L289
	movl	28(%rsp), %esi
.L290:
	subl	%ecx, %ebx
	leal	-1(%rbx), %r15d
	cmpl	$2, %r15d
	jbe	.L294
	leaq	(%r10,%rcx,2), %r10
	addq	%r11, %rcx
	vmovq	.LC17(%rip), %xmm1
	vmovq	0(%rbp,%rcx,2), %xmm0
	movl	%ebx, %ecx
	vpunpcklwd	%xmm1, %xmm0, %xmm2
	vpunpcklwd	%xmm1, %xmm0, %xmm0
	leaq	(%r12,%r10,2), %r10
	andl	$-4, %ecx
	vpshufd	$14, %xmm0, %xmm0
	vmovq	%xmm2, (%r10)
	vmovq	%xmm0, 8(%r10)
	movl	%ecx, %r10d
	subl	%ecx, %esi
	leaq	(%rdx,%r10,2), %rdx
	leaq	(%rax,%r10,4), %rax
	cmpl	%ebx, %ecx
	je	.L289
.L294:
	movzwl	(%rdx), %ecx
	movw	$-1, 2(%rax)
	movw	%cx, (%rax)
	testl	%esi, %esi
	je	.L289
	movzwl	2(%rdx), %ecx
	movw	$-1, 6(%rax)
	movw	%cx, 4(%rax)
	cmpl	$1, %esi
	je	.L289
	movzwl	4(%rdx), %edx
	movw	$-1, 10(%rax)
	movw	%dx, 8(%rax)
	jmp	.L289
	.p2align 4
	.p2align 3
.L287:
	testl	%r14d, %r14d
	js	.L289
	cmpb	$0, 42(%rsp)
	jne	.L338
	vmovdqa	.LC18(%rip), %xmm10
	vmovdqa	.LC19(%rip), %xmm9
	movq	%rdx, %rsi
	movq	%rax, %rcx
	vmovdqa	.LC20(%rip), %xmm8
	vmovdqa	.LC21(%rip), %xmm7
	vmovdqa	.LC22(%rip), %xmm6
	vmovdqa	.LC23(%rip), %xmm5
	vmovdqa	.LC24(%rip), %xmm3
	movq	64(%rsp), %rbx
	leaq	(%rdx,%rbx), %r10
	.p2align 4
	.p2align 3
.L297:
	vmovdqu	(%rsi), %xmm0
	addq	$16, %rsi
	addq	$48, %rcx
	vpshufb	%xmm9, %xmm0, %xmm2
	vpshufb	%xmm10, %xmm0, %xmm1
	vpblendw	$36, %xmm2, %xmm1, %xmm1
	vpshufb	%xmm8, %xmm0, %xmm2
	vmovdqu	%xmm1, -48(%rcx)
	vpshufb	%xmm6, %xmm2, %xmm2
	vpshufb	%xmm7, %xmm0, %xmm1
	vpor	%xmm2, %xmm1, %xmm1
	vmovdqu	%xmm1, -32(%rcx)
	vpshufb	%xmm5, %xmm0, %xmm1
	vpshufb	%xmm3, %xmm0, %xmm0
	vpblendw	$146, %xmm0, %xmm1, %xmm0
	vmovdqu	%xmm0, -16(%rcx)
	cmpq	%rsi, %r10
	jne	.L297
	addq	72(%rsp), %rdx
	addq	48(%rsp), %rax
	movl	20(%rsp), %esi
	cmpl	%esi, 24(%rsp)
	je	.L289
	movl	28(%rsp), %ecx
.L296:
	movzwl	(%rdx), %esi
	movw	%si, 4(%rax)
	movw	%si, 2(%rax)
	movw	%si, (%rax)
	testl	%ecx, %ecx
	je	.L289
	movzwl	2(%rdx), %esi
	movw	%si, 10(%rax)
	movw	%si, 8(%rax)
	movw	%si, 6(%rax)
	cmpl	$1, %ecx
	je	.L289
	movzwl	4(%rdx), %esi
	movw	%si, 16(%rax)
	movw	%si, 14(%rax)
	movw	%si, 12(%rax)
	cmpl	$2, %ecx
	je	.L289
	movzwl	6(%rdx), %esi
	movw	%si, 22(%rax)
	movw	%si, 20(%rax)
	movw	%si, 18(%rax)
	cmpl	$3, %ecx
	je	.L289
	movzwl	8(%rdx), %esi
	movw	%si, 28(%rax)
	movw	%si, 26(%rax)
	movw	%si, 24(%rax)
	cmpl	$4, %ecx
	je	.L289
	movzwl	10(%rdx), %esi
	movw	%si, 34(%rax)
	movw	%si, 32(%rax)
	movw	%si, 30(%rax)
	cmpl	$5, %ecx
	je	.L289
	movzwl	12(%rdx), %edx
	movw	%dx, 40(%rax)
	movw	%dx, 38(%rax)
	movw	%dx, 36(%rax)
	jmp	.L289
	.p2align 4
	.p2align 3
.L336:
	movq	%rdi, %r12
	jmp	.L270
.L342:
	movl	20(%rsp), %ebx
	movl	%r14d, %esi
	xorl	%ecx, %ecx
	jmp	.L312
.L344:
	movl	%r14d, %esi
	jmp	.L322
.L345:
	movl	%r14d, %esi
	jmp	.L326
.L339:
	movl	%r14d, %ebx
	xorl	%esi, %esi
	jmp	.L301
.L337:
	movl	20(%rsp), %ebx
	movl	%r14d, %esi
	xorl	%ecx, %ecx
	jmp	.L290
.L338:
	movl	%r14d, %ecx
	jmp	.L296
.L346:
	movl	%r14d, %esi
	jmp	.L328
.L347:
	movl	%r14d, %ecx
	jmp	.L332
.L340:
	movl	%r14d, %ecx
	jmp	.L304
.L343:
	movl	%r14d, %esi
	jmp	.L318
.L341:
	movl	20(%rsp), %ebx
	xorl	%esi, %esi
	jmp	.L306
	.p2align 4
	.p2align 3
.L275:
	leaq	__PRETTY_FUNCTION__.42(%rip), %rcx
	movl	$1827, %edx
	leaq	.LC14(%rip), %rsi
	leaq	.LC9(%rip), %rdi
	call	__assert_fail@PLT
.L273:
	movq	%rbp, %rdi
	call	free@PLT
	leaq	.LC16(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L270
.L536:
	leaq	__PRETTY_FUNCTION__.42(%rip), %rcx
	movl	$1798, %edx
	leaq	.LC14(%rip), %rsi
	leaq	.LC15(%rip), %rdi
	call	__assert_fail@PLT
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
	movq	%rdi, %r8
	movq	%rdx, %rdi
	leal	(%rax,%rax,2), %ecx
	movzbl	(%rdx), %eax
	addl	%eax, %ecx
	cmpl	$1, %r10d
	je	.L547
	leal	-1(%r10), %r9d
	andl	$-8, %r9d
	jle	.L544
	vmovdqa	.LC38(%rip), %xmm4
	xorl	%eax, %eax
	.p2align 4
	.p2align 3
.L541:
	vmovq	(%rdi,%rax), %xmm0
	vmovq	(%rsi,%rax), %xmm2
	movzbl	8(%rsi,%rax), %edx
	leal	(%rdx,%rdx,2), %edx
	vpmovzxbw	%xmm2, %xmm2
	vpmovzxbw	%xmm0, %xmm0
	vpsllw	$2, %xmm2, %xmm5
	vpaddw	%xmm0, %xmm5, %xmm5
	vpsubw	%xmm2, %xmm5, %xmm3
	vpsubw	%xmm5, %xmm2, %xmm2
	vpslldq	$2, %xmm3, %xmm0
	vpinsrw	$0, %ecx, %xmm0, %xmm0
	movzbl	8(%rdi,%rax), %ecx
	vpsrldq	$2, %xmm3, %xmm1
	vpsllw	$2, %xmm3, %xmm3
	vpaddw	%xmm4, %xmm3, %xmm3
	vpaddw	%xmm3, %xmm0, %xmm0
	vpaddw	%xmm2, %xmm0, %xmm0
	addl	%ecx, %edx
	vpinsrw	$7, %edx, %xmm1, %xmm1
	vpaddw	%xmm3, %xmm1, %xmm1
	vpaddw	%xmm2, %xmm1, %xmm1
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
	jg	.L541
	decl	%r9d
	shrl	$3, %r9d
	incl	%r9d
	leal	0(,%r9,8), %edx
	sall	$4, %r9d
	movslq	%edx, %r11
	movslq	%r9d, %r9
	incl	%edx
	movzbl	(%rsi,%r11), %eax
	movzbl	(%rdi,%r11), %r11d
	addq	%r8, %r9
	leal	(%rax,%rax,2), %eax
	addl	%r11d, %eax
.L540:
	leal	(%rax,%rax,2), %r11d
	leal	8(%rcx,%r11), %ecx
	sarl	$4, %ecx
	movb	%cl, (%r9)
	cmpl	%edx, %r10d
	jle	.L542
	movslq	%edx, %rdx
	.p2align 4
	.p2align 3
.L543:
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
	jg	.L543
.L542:
	addl	%r10d, %r10d
	addl	$2, %eax
	sarl	$2, %eax
	movslq	%r10d, %r10
	movb	%al, -1(%r8,%r10)
	movq	%r8, %rax
	ret
	.p2align 4
	.p2align 3
.L547:
	addl	$2, %ecx
	movq	%r8, %rax
	sarl	$2, %ecx
	movb	%cl, 1(%r8)
	movb	%cl, (%r8)
	ret
	.p2align 4
	.p2align 3
.L544:
	movq	%r8, %r9
	movl	%ecx, %eax
	movl	$1, %edx
	jmp	.L540
	.cfi_endproc
.LFE668:
	.size	stbi__resample_row_hv_2_simd, .-stbi__resample_row_hv_2_simd
	.p2align 4
	.type	stbi__YCbCr_to_RGB_simd, @function
stbi__YCbCr_to_RGB_simd:
.LFB671:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movq	%rdx, %r10
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movq	%rcx, %r11
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	cmpl	$4, %r9d
	je	.L549
.L561:
	xorl	%eax, %eax
.L551:
	movslq	%r9d, %r9
	movslq	%eax, %rcx
	cmpl	%eax, %r8d
	jg	.L559
	jmp	.L565
	.p2align 4
	.p2align 3
.L567:
	movl	%ebp, %ebx
.L554:
	cmpl	$255, %eax
	jbe	.L556
	notl	%eax
	sarl	$31, %eax
.L556:
	cmpl	$255, %edx
	jbe	.L558
	notl	%edx
	sarl	$31, %edx
.L558:
	incq	%rcx
	movb	%bl, (%rdi)
	movb	%al, 1(%rdi)
	movb	%dl, 2(%rdi)
	movb	$-1, 3(%rdi)
	addq	%r9, %rdi
	cmpl	%ecx, %r8d
	jle	.L565
.L559:
	movzbl	(%r11,%rcx), %ebp
	movzbl	(%rsi,%rcx), %r12d
	movzbl	(%r10,%rcx), %edx
	addl	$-128, %ebp
	sall	$20, %r12d
	imull	$1470208, %ebp, %eax
	addl	$-128, %edx
	imull	$-748800, %ebp, %ebp
	leal	524288(%r12,%rax), %ebx
	imull	$-360960, %edx, %eax
	imull	$1858048, %edx, %edx
	leal	524288(%r12,%rbp), %ebp
	xorw	%ax, %ax
	addl	%ebp, %eax
	leal	524288(%r12,%rdx), %edx
	movl	%ebx, %ebp
	sarl	$20, %ebp
	sarl	$20, %eax
	sarl	$20, %edx
	cmpl	$268435455, %ebx
	jbe	.L567
	movl	%ebp, %ebx
	notl	%ebx
	sarl	$31, %ebx
	jmp	.L554
	.p2align 4
	.p2align 3
.L565:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4
	.p2align 3
.L549:
	.cfi_restore_state
	cmpl	$7, %r8d
	jle	.L561
	vmovdqa	.LC39(%rip), %xmm9
	vmovdqa	.LC40(%rip), %xmm3
	leal	-8(%r8), %eax
	vpxor	%xmm2, %xmm2, %xmm2
	vmovdqa	.LC41(%rip), %xmm8
	vmovdqa	.LC42(%rip), %xmm7
	shrl	$3, %eax
	vmovdqa	.LC43(%rip), %xmm6
	vmovdqa	.LC44(%rip), %xmm5
	leal	1(%rax), %ebx
	xorl	%eax, %eax
	vmovdqa	.LC2(%rip), %xmm4
	movq	%rbx, %rdx
	leaq	0(,%rbx,8), %rcx
	.p2align 4
	.p2align 3
.L552:
	vmovq	(%r10,%rax), %xmm0
	vmovq	(%r11,%rax), %xmm11
	vmovq	(%rsi,%rax), %xmm12
	vpxor	%xmm3, %xmm0, %xmm0
	vpxor	%xmm3, %xmm11, %xmm11
	vpunpcklbw	%xmm0, %xmm2, %xmm0
	vpunpcklbw	%xmm11, %xmm2, %xmm11
	vpunpcklbw	%xmm12, %xmm9, %xmm12
	vpmulhw	%xmm0, %xmm7, %xmm1
	vpsrlw	$4, %xmm12, %xmm12
	vpmulhw	%xmm11, %xmm8, %xmm10
	vpaddw	%xmm12, %xmm1, %xmm1
	vpmulhw	%xmm6, %xmm0, %xmm0
	vpaddw	%xmm12, %xmm10, %xmm10
	vpsraw	$4, %xmm10, %xmm10
	vpmulhw	%xmm5, %xmm11, %xmm11
	vpaddw	%xmm12, %xmm0, %xmm0
	vpsraw	$4, %xmm0, %xmm0
	vpackuswb	%xmm0, %xmm10, %xmm10
	vpaddw	%xmm11, %xmm1, %xmm1
	vpsraw	$4, %xmm1, %xmm1
	vpackuswb	%xmm4, %xmm1, %xmm0
	vpunpcklbw	%xmm0, %xmm10, %xmm1
	vpunpckhbw	%xmm0, %xmm10, %xmm0
	vpunpcklwd	%xmm0, %xmm1, %xmm10
	vpunpckhwd	%xmm0, %xmm1, %xmm1
	vmovdqu	%xmm10, (%rdi,%rax,4)
	vmovdqu	%xmm1, 16(%rdi,%rax,4)
	addq	$8, %rax
	cmpq	%rcx, %rax
	jne	.L552
	salq	$5, %rbx
	leal	0(,%rdx,8), %eax
	addq	%rbx, %rdi
	jmp	.L551
	.cfi_endproc
.LFE671:
	.size	stbi__YCbCr_to_RGB_simd, .-stbi__YCbCr_to_RGB_simd
	.p2align 4
	.type	stbi__idct_simd, @function
stbi__idct_simd:
.LFB652:
	.cfi_startproc
	endbr64
	vmovdqa	32(%rdx), %xmm0
	vmovdqa	64(%rdx), %xmm4
	movslq	%esi, %rsi
	vpunpcklwd	96(%rdx), %xmm0, %xmm1
	vmovdqa	(%rdx), %xmm3
	leaq	(%rdi,%rsi), %rax
	vpunpckhwd	96(%rdx), %xmm0, %xmm0
	vmovdqa	48(%rdx), %xmm5
	vpmaddwd	.LC45(%rip), %xmm0, %xmm6
	vmovdqa	112(%rdx), %xmm9
	vmovdqa	16(%rdx), %xmm2
	vmovdqa	80(%rdx), %xmm8
	vpmaddwd	.LC46(%rip), %xmm0, %xmm7
	vpmaddwd	.LC45(%rip), %xmm1, %xmm14
	vpxor	%xmm0, %xmm0, %xmm0
	vpmaddwd	.LC46(%rip), %xmm1, %xmm15
	vpaddw	%xmm4, %xmm3, %xmm1
	vpsubw	%xmm4, %xmm3, %xmm3
	vmovdqa	%xmm6, -104(%rsp)
	vpunpcklwd	%xmm1, %xmm0, %xmm6
	vpunpckhwd	%xmm1, %xmm0, %xmm1
	vpsrad	$4, %xmm1, %xmm1
	vmovdqa	%xmm1, -56(%rsp)
	vpunpcklwd	%xmm3, %xmm0, %xmm1
	vpunpckhwd	%xmm3, %xmm0, %xmm3
	vpunpckhwd	%xmm2, %xmm8, %xmm4
	vpsrad	$4, %xmm3, %xmm3
	vmovdqa	%xmm3, -40(%rsp)
	vpunpcklwd	%xmm2, %xmm8, %xmm3
	vpaddw	%xmm8, %xmm5, %xmm8
	vpaddw	%xmm9, %xmm2, %xmm2
	vpmaddwd	.LC49(%rip), %xmm3, %xmm12
	vpsrad	$4, %xmm6, %xmm13
	vmovdqa	%xmm7, -88(%rsp)
	vpunpcklwd	%xmm5, %xmm9, %xmm6
	vpunpckhwd	%xmm5, %xmm9, %xmm7
	vpmaddwd	.LC47(%rip), %xmm6, %xmm10
	vpunpcklwd	%xmm8, %xmm2, %xmm5
	vpmaddwd	.LC47(%rip), %xmm7, %xmm11
	vpunpckhwd	%xmm8, %xmm2, %xmm2
	vmovdqa	%xmm13, -72(%rsp)
	vpmaddwd	.LC48(%rip), %xmm6, %xmm6
	vpsrad	$4, %xmm1, %xmm1
	vpmaddwd	.LC48(%rip), %xmm7, %xmm7
	vpmaddwd	.LC49(%rip), %xmm4, %xmm13
	vmovdqa	%xmm15, -24(%rsp)
	vpmaddwd	.LC51(%rip), %xmm5, %xmm9
	vpmaddwd	.LC51(%rip), %xmm2, %xmm8
	vpmaddwd	.LC50(%rip), %xmm3, %xmm3
	vpmaddwd	.LC52(%rip), %xmm2, %xmm2
	vpmaddwd	.LC52(%rip), %xmm5, %xmm5
	vpmaddwd	.LC50(%rip), %xmm4, %xmm4
	vpaddd	%xmm9, %xmm10, %xmm10
	vpaddd	%xmm9, %xmm3, %xmm3
	vmovdqa	-56(%rsp), %xmm9
	vpaddd	%xmm8, %xmm11, %xmm11
	vpaddd	%xmm2, %xmm13, %xmm13
	vpaddd	%xmm2, %xmm7, %xmm7
	vmovdqa	-72(%rsp), %xmm2
	vpaddd	%xmm5, %xmm12, %xmm12
	vpaddd	%xmm5, %xmm6, %xmm6
	vpaddd	-88(%rsp), %xmm9, %xmm5
	vpaddd	%xmm8, %xmm4, %xmm4
	vmovdqa	.LC53(%rip), %xmm8
	vpaddd	%xmm15, %xmm2, %xmm2
	vpaddd	%xmm8, %xmm2, %xmm2
	vpaddd	%xmm8, %xmm5, %xmm5
	vpaddd	%xmm4, %xmm5, %xmm15
	vpaddd	%xmm3, %xmm2, %xmm9
	vpsubd	%xmm4, %xmm5, %xmm5
	vpsubd	%xmm3, %xmm2, %xmm2
	vpsrad	$10, %xmm5, %xmm5
	vpaddd	%xmm14, %xmm1, %xmm3
	vpsrad	$10, %xmm15, %xmm15
	vpsrad	$10, %xmm2, %xmm2
	vpackssdw	%xmm5, %xmm2, %xmm2
	vmovdqa	-40(%rsp), %xmm5
	vpaddd	%xmm8, %xmm3, %xmm3
	vpaddd	-104(%rsp), %xmm5, %xmm4
	vpsrad	$10, %xmm9, %xmm9
	vpaddd	%xmm6, %xmm3, %xmm5
	vpackssdw	%xmm15, %xmm9, %xmm9
	vpsubd	%xmm6, %xmm3, %xmm3
	vpaddd	%xmm8, %xmm1, %xmm1
	vpsrad	$10, %xmm5, %xmm5
	vpsrad	$10, %xmm3, %xmm3
	vpsubd	%xmm14, %xmm1, %xmm1
	vpaddd	%xmm12, %xmm1, %xmm6
	vpsubd	%xmm12, %xmm1, %xmm1
	vpsrad	$10, %xmm1, %xmm1
	vpsrad	$10, %xmm6, %xmm6
	vpaddd	%xmm8, %xmm4, %xmm4
	vpaddd	%xmm7, %xmm4, %xmm15
	vpsubd	%xmm7, %xmm4, %xmm4
	vpsrad	$10, %xmm4, %xmm4
	vpackssdw	%xmm4, %xmm3, %xmm3
	vpaddd	-40(%rsp), %xmm8, %xmm4
	vpsrad	$10, %xmm15, %xmm15
	vpsubd	-104(%rsp), %xmm4, %xmm4
	vpackssdw	%xmm15, %xmm5, %xmm5
	vpaddd	%xmm13, %xmm4, %xmm7
	vpsubd	%xmm13, %xmm4, %xmm4
	vpsrad	$10, %xmm4, %xmm4
	vpackssdw	%xmm4, %xmm1, %xmm4
	vpaddd	-56(%rsp), %xmm8, %xmm1
	vpsrad	$10, %xmm7, %xmm7
	vpsubd	-88(%rsp), %xmm1, %xmm1
	vpackssdw	%xmm7, %xmm6, %xmm6
	vpaddd	-72(%rsp), %xmm8, %xmm7
	vpsubd	-24(%rsp), %xmm7, %xmm7
	vpaddd	%xmm11, %xmm1, %xmm12
	vpsubd	%xmm11, %xmm1, %xmm1
	vpaddd	%xmm10, %xmm7, %xmm8
	vpsrad	$10, %xmm1, %xmm11
	vpsubd	%xmm10, %xmm7, %xmm1
	vpsrad	$10, %xmm12, %xmm12
	vpsrad	$10, %xmm8, %xmm8
	vpsrad	$10, %xmm1, %xmm1
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
	vpunpcklwd	%xmm8, %xmm14, %xmm5
	vpunpckhwd	%xmm8, %xmm14, %xmm14
	vpunpcklwd	%xmm7, %xmm3, %xmm4
	vpunpckhwd	%xmm7, %xmm3, %xmm3
	vpmaddwd	.LC45(%rip), %xmm4, %xmm7
	vpmaddwd	.LC45(%rip), %xmm3, %xmm10
	vpunpcklwd	%xmm9, %xmm1, %xmm8
	vmovdqa	%xmm7, -104(%rsp)
	vmovdqa	%xmm10, -88(%rsp)
	vpmaddwd	.LC46(%rip), %xmm4, %xmm15
	vpmaddwd	.LC46(%rip), %xmm3, %xmm4
	vpaddw	%xmm5, %xmm6, %xmm3
	vpunpckhwd	%xmm9, %xmm1, %xmm7
	vpsubw	%xmm5, %xmm6, %xmm5
	vpaddw	%xmm14, %xmm9, %xmm9
	vpunpcklwd	%xmm2, %xmm14, %xmm6
	vpmaddwd	.LC47(%rip), %xmm8, %xmm10
	vpmaddwd	.LC47(%rip), %xmm7, %xmm11
	vpmaddwd	.LC48(%rip), %xmm7, %xmm7
	vpmaddwd	.LC48(%rip), %xmm8, %xmm8
	vmovdqa	%xmm4, -72(%rsp)
	vpunpcklwd	%xmm3, %xmm0, %xmm4
	vpunpckhwd	%xmm3, %xmm0, %xmm3
	vmovdqa	%xmm15, -40(%rsp)
	vpsrad	$4, %xmm4, %xmm12
	vpunpcklwd	%xmm5, %xmm0, %xmm4
	vpunpckhwd	%xmm5, %xmm0, %xmm0
	vpunpckhwd	%xmm2, %xmm14, %xmm5
	vpaddw	%xmm1, %xmm2, %xmm2
	vmovdqa	%xmm12, -56(%rsp)
	vpmaddwd	.LC49(%rip), %xmm6, %xmm12
	vpmaddwd	.LC50(%rip), %xmm6, %xmm6
	vpunpcklwd	%xmm9, %xmm2, %xmm1
	vpunpckhwd	%xmm9, %xmm2, %xmm2
	vpmaddwd	.LC51(%rip), %xmm1, %xmm9
	vpsrad	$4, %xmm3, %xmm3
	vpmaddwd	.LC51(%rip), %xmm2, %xmm14
	vpmaddwd	.LC49(%rip), %xmm5, %xmm13
	vpsrad	$4, %xmm4, %xmm4
	vpsrad	$4, %xmm0, %xmm0
	vpmaddwd	.LC50(%rip), %xmm5, %xmm5
	vpmaddwd	.LC52(%rip), %xmm2, %xmm2
	vpmaddwd	.LC52(%rip), %xmm1, %xmm1
	vpaddd	%xmm9, %xmm10, %xmm10
	vpaddd	%xmm9, %xmm6, %xmm9
	vmovdqa	-56(%rsp), %xmm6
	vpaddd	%xmm14, %xmm11, %xmm11
	vpaddd	%xmm2, %xmm13, %xmm13
	vpaddd	%xmm14, %xmm5, %xmm14
	vpaddd	%xmm2, %xmm7, %xmm2
	vmovdqa	.LC54(%rip), %xmm7
	vpaddd	-72(%rsp), %xmm3, %xmm5
	vpaddd	%xmm1, %xmm8, %xmm8
	vpaddd	%xmm1, %xmm12, %xmm12
	vpaddd	%xmm15, %xmm6, %xmm6
	vpaddd	%xmm7, %xmm6, %xmm6
	vpaddd	%xmm7, %xmm3, %xmm3
	vpsubd	-72(%rsp), %xmm3, %xmm3
	vpaddd	%xmm7, %xmm5, %xmm5
	vpaddd	%xmm9, %xmm6, %xmm1
	vpaddd	%xmm14, %xmm5, %xmm15
	vpsubd	%xmm9, %xmm6, %xmm6
	vpsubd	%xmm14, %xmm5, %xmm5
	vpaddd	-88(%rsp), %xmm0, %xmm9
	vpsrad	$17, %xmm5, %xmm5
	vpsrad	$17, %xmm6, %xmm6
	vpackssdw	%xmm5, %xmm6, %xmm6
	vpaddd	-104(%rsp), %xmm4, %xmm5
	vpaddd	%xmm7, %xmm0, %xmm0
	vpaddd	%xmm7, %xmm4, %xmm4
	vpsubd	-88(%rsp), %xmm0, %xmm0
	vpsubd	-104(%rsp), %xmm4, %xmm4
	vpsrad	$17, %xmm15, %xmm15
	vpsrad	$17, %xmm1, %xmm1
	vpackssdw	%xmm15, %xmm1, %xmm1
	vpaddd	%xmm7, %xmm9, %xmm9
	vpaddd	%xmm7, %xmm5, %xmm5
	vpaddd	%xmm2, %xmm9, %xmm15
	vpsubd	%xmm2, %xmm9, %xmm9
	vpaddd	%xmm8, %xmm5, %xmm14
	vpaddd	%xmm12, %xmm4, %xmm2
	vpsubd	%xmm8, %xmm5, %xmm5
	vpsrad	$17, %xmm15, %xmm15
	vpaddd	%xmm13, %xmm0, %xmm8
	vpsrad	$17, %xmm2, %xmm2
	vpsubd	%xmm13, %xmm0, %xmm0
	vpsubd	%xmm12, %xmm4, %xmm4
	vpsrad	$17, %xmm8, %xmm8
	vpackssdw	%xmm8, %xmm2, %xmm2
	vpaddd	-56(%rsp), %xmm7, %xmm8
	vpsrad	$17, %xmm0, %xmm0
	vpsubd	-40(%rsp), %xmm8, %xmm8
	vpsrad	$17, %xmm4, %xmm4
	vpackssdw	%xmm0, %xmm4, %xmm4
	vpaddd	%xmm11, %xmm3, %xmm0
	vpsubd	%xmm11, %xmm3, %xmm3
	vpsrad	$17, %xmm0, %xmm0
	vpsrad	$17, %xmm14, %xmm14
	vpsrad	$17, %xmm9, %xmm9
	vpackssdw	%xmm15, %xmm14, %xmm14
	vpsrad	$17, %xmm5, %xmm5
	vpackssdw	%xmm9, %xmm5, %xmm5
	vpackuswb	%xmm14, %xmm1, %xmm1
	vpackuswb	%xmm6, %xmm5, %xmm5
	vpaddd	%xmm10, %xmm8, %xmm7
	vpsrad	$17, %xmm7, %xmm7
	vpackssdw	%xmm0, %xmm7, %xmm7
	vpsrad	$17, %xmm3, %xmm0
	vpsubd	%xmm10, %xmm8, %xmm3
	vpsrad	$17, %xmm3, %xmm3
	vpackssdw	%xmm0, %xmm3, %xmm3
	vpackuswb	%xmm7, %xmm2, %xmm2
	vpackuswb	%xmm4, %xmm3, %xmm3
	vpunpcklbw	%xmm3, %xmm1, %xmm0
	vpunpckhbw	%xmm3, %xmm1, %xmm1
	vpunpcklbw	%xmm5, %xmm2, %xmm3
	vpunpckhbw	%xmm5, %xmm2, %xmm5
	vpunpcklbw	%xmm3, %xmm0, %xmm2
	vpunpckhbw	%xmm3, %xmm0, %xmm0
	vpunpcklbw	%xmm5, %xmm1, %xmm3
	vpunpckhbw	%xmm5, %xmm1, %xmm1
	vpunpcklbw	%xmm3, %xmm2, %xmm4
	vpunpckhbw	%xmm3, %xmm2, %xmm2
	vpunpcklbw	%xmm1, %xmm0, %xmm3
	vpunpckhbw	%xmm1, %xmm0, %xmm0
	vmovq	%xmm4, (%rdi)
	vpshufd	$78, %xmm4, %xmm4
	vmovq	%xmm4, (%rax)
	addq	%rsi, %rax
	vmovq	%xmm2, (%rax)
	addq	%rsi, %rax
	vpshufd	$78, %xmm2, %xmm2
	vmovq	%xmm2, (%rax)
	addq	%rsi, %rax
	vmovq	%xmm3, (%rax)
	addq	%rsi, %rax
	vpshufd	$78, %xmm3, %xmm3
	vmovq	%xmm3, (%rax)
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
	jne	.L588
	cmpl	$3, %edx
	je	.L576
	jg	.L577
	cmpl	$1, %edx
	je	.L578
	cmpl	$2, %edx
	jne	.L586
	movl	$0x3f800000, 4(%r12)
.L578:
	movl	$0x00000000, (%r12)
.L586:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4
	.p2align 3
.L577:
	.cfi_restore_state
	cmpl	$4, %edx
	jne	.L586
	movl	$0x3f800000, 12(%r12)
.L576:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	movl	$0x00000000, 8(%r12)
	movq	$0, (%r12)
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4
	.p2align 3
.L588:
	.cfi_restore_state
	vmovsd	.LC55(%rip), %xmm0
	subl	$136, %edi
	movq	%rsi, %rbp
	call	ldexp@PLT
	cmpl	$2, %ebx
	movzbl	0(%rbp), %eax
	vxorps	%xmm1, %xmm1, %xmm1
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	jg	.L571
	movzbl	1(%rbp), %edx
	addl	%edx, %eax
	movzbl	2(%rbp), %edx
	addl	%edx, %eax
	vcvtsi2ssl	%eax, %xmm1, %xmm1
	vmulss	%xmm0, %xmm1, %xmm1
	vdivss	.LC56(%rip), %xmm1, %xmm1
	vmovss	%xmm1, (%r12)
	cmpl	$2, %ebx
	jne	.L586
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	movl	$0x3f800000, 4(%r12)
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4
	.p2align 3
.L571:
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
	jne	.L586
	popq	%rbx
	.cfi_def_cfa_offset 24
	movl	$0x3f800000, 12(%r12)
	popq	%rbp
	.cfi_def_cfa_offset 16
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
	je	.L591
	movq	200(%rdi), %rcx
	movq	%rcx, %rdx
	subq	%rax, %rdx
	cmpl	%esi, %edx
	jl	.L592
.L591:
	movslq	%esi, %rsi
	addq	%rsi, %rax
	movq	%rax, 192(%rdi)
	ret
	.p2align 4
	.p2align 3
.L592:
	movq	40(%rdi), %r8
	movq	24(%rdi), %rax
	movq	%rcx, 192(%rdi)
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
	cmpl	$1, %edi
	je	.L613
	leal	(%rax,%rax,2), %edx
	movb	%al, (%r8)
	movzbl	1(%rsi), %eax
	leal	-1(%rdi), %ecx
	leal	2(%rdx,%rax), %eax
	sarl	$2, %eax
	movb	%al, 1(%r8)
	cmpl	$1, %ecx
	jle	.L603
	leal	-2(%rdi), %r11d
	leaq	2(%r8), %rdx
	leal	-3(%rdi), %eax
	leaq	2(%r8,%r11,2), %r9
	movq	%r11, %r10
	leaq	2(%rsi,%r11), %r11
	cmpq	%r9, %rsi
	setnb	%r9b
	cmpq	%r11, %rdx
	setnb	%r11b
	orb	%r11b, %r9b
	je	.L597
	cmpl	$14, %eax
	jbe	.L597
	vmovdqa	.LC0(%rip), %xmm4
	vmovdqa	.LC1(%rip), %xmm3
	movl	%r10d, %r9d
	leaq	1(%rsi), %rax
	vmovdqa	.LC2(%rip), %xmm2
	shrl	$4, %r9d
	decl	%r9d
	salq	$4, %r9
	leaq	17(%rsi,%r9), %r9
	vpmovzxbw	%xmm4, %xmm5
	vpsrldq	$8, %xmm4, %xmm4
	vpmovzxbw	%xmm4, %xmm4
	.p2align 4
	.p2align 3
.L598:
	vmovdqu	(%rax), %xmm6
	vmovdqu	-1(%rax), %xmm1
	addq	$16, %rax
	addq	$32, %rdx
	vpmovzxbw	%xmm6, %xmm8
	vpsrldq	$8, %xmm6, %xmm6
	vpmovzxbw	%xmm6, %xmm6
	vpmovzxbw	%xmm1, %xmm0
	vpmullw	%xmm5, %xmm8, %xmm8
	vpsrldq	$8, %xmm1, %xmm1
	vpmovzxbw	%xmm1, %xmm1
	vpmullw	%xmm4, %xmm6, %xmm6
	vpaddw	%xmm3, %xmm8, %xmm8
	vpaddw	%xmm8, %xmm0, %xmm0
	vpsrlw	$2, %xmm0, %xmm0
	vpand	%xmm0, %xmm2, %xmm0
	vpaddw	%xmm3, %xmm6, %xmm6
	vpaddw	%xmm6, %xmm1, %xmm1
	vpsrlw	$2, %xmm1, %xmm1
	vpand	%xmm1, %xmm2, %xmm1
	vpackuswb	%xmm1, %xmm0, %xmm0
	vmovdqu	-15(%rax), %xmm1
	vpmovzxbw	%xmm1, %xmm7
	vpsrldq	$8, %xmm1, %xmm1
	vpmovzxbw	%xmm1, %xmm1
	vpaddw	%xmm6, %xmm1, %xmm1
	vpaddw	%xmm8, %xmm7, %xmm7
	vpsrlw	$2, %xmm7, %xmm7
	vpsrlw	$2, %xmm1, %xmm1
	vpand	%xmm7, %xmm2, %xmm6
	vpand	%xmm1, %xmm2, %xmm1
	vpackuswb	%xmm1, %xmm6, %xmm1
	vpunpcklbw	%xmm1, %xmm0, %xmm6
	vpunpckhbw	%xmm1, %xmm0, %xmm0
	vmovdqu	%xmm6, -32(%rdx)
	vmovdqu	%xmm0, -16(%rdx)
	cmpq	%rax, %r9
	jne	.L598
	movl	%r10d, %edx
	andl	$-16, %edx
	leal	1(%rdx), %eax
	cmpl	%edx, %r10d
	je	.L602
	cltq
	.p2align 4
	.p2align 3
.L600:
	movzbl	(%rsi,%rax), %edx
	leal	2(%rdx,%rdx,2), %r9d
	movzbl	-1(%rsi,%rax), %edx
	addl	%r9d, %edx
	sarl	$2, %edx
	movb	%dl, (%r8,%rax,2)
	movzbl	1(%rsi,%rax), %edx
	addl	%r9d, %edx
	sarl	$2, %edx
	movb	%dl, 1(%r8,%rax,2)
	incq	%rax
	cmpl	%eax, %ecx
	jg	.L600
.L602:
	addl	%ecx, %ecx
	movslq	%ecx, %rcx
	leaq	1(%rcx), %r9
.L596:
	movzbl	-2(%rsi,%rdi), %eax
	leaq	-1(%rsi,%rdi), %rdx
	leal	(%rax,%rax,2), %esi
	movzbl	(%rdx), %eax
	leal	2(%rsi,%rax), %eax
	sarl	$2, %eax
	movb	%al, (%r8,%rcx)
	movzbl	(%rdx), %eax
	movb	%al, (%r8,%r9)
	movq	%r8, %rax
	ret
	.p2align 4
	.p2align 3
.L613:
	movb	%al, 1(%r8)
	movb	%al, (%r8)
	movq	%r8, %rax
	ret
	.p2align 4
	.p2align 3
.L597:
	leaq	2(%rax), %r10
	movl	$1, %eax
	.p2align 4
	.p2align 3
.L601:
	movzbl	(%rsi,%rax), %edx
	leal	2(%rdx,%rdx,2), %r9d
	movzbl	-1(%rsi,%rax), %edx
	addl	%r9d, %edx
	sarl	$2, %edx
	movb	%dl, (%r8,%rax,2)
	movzbl	1(%rsi,%rax), %edx
	addl	%r9d, %edx
	sarl	$2, %edx
	movb	%dl, 1(%r8,%rax,2)
	incq	%rax
	cmpq	%rax, %r10
	jne	.L601
	jmp	.L602
	.p2align 4
	.p2align 3
.L603:
	movl	$3, %r9d
	movl	$2, %ecx
	jmp	.L596
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
	je	.L619
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4
	.p2align 3
.L619:
	.cfi_restore_state
	movq	%rbp, %rdi
	call	ferror@PLT
	popq	%rbp
	.cfi_def_cfa_offset 8
	testl	%eax, %eax
	setne	%al
	movzbl	%al, %eax
	ret
	.cfi_endproc
.LFE577:
	.size	stbi__stdio_eof, .-stbi__stdio_eof
	.section	.rodata.str1.1
.LC59:
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
	leaq	.LC8(%rip), %rsi
	leaq	.LC59(%rip), %rdi
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	call	__assert_fail@PLT
	.cfi_endproc
.LFE853:
	.size	stbiw__sbgrowf.part.0, .-stbiw__sbgrowf.part.0
	.section	.rodata.str1.1
.LC60:
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
	je	.L623
	vmovaps	%xmm0, 80(%rsp)
	vmovaps	%xmm1, 96(%rsp)
	vmovaps	%xmm2, 112(%rsp)
	vmovaps	%xmm3, 128(%rsp)
	vmovaps	%xmm4, 144(%rsp)
	vmovaps	%xmm5, 160(%rsp)
	vmovaps	%xmm6, 176(%rsp)
	vmovaps	%xmm7, 192(%rsp)
.L623:
	movq	%rsp, %rdx
	leaq	.LC60(%rip), %rsi
	movq	%fs:40, %rax
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax
	leaq	224(%rsp), %rax
	movl	$16, (%rsp)
	movl	$48, 4(%rsp)
	movq	%rax, 8(%rsp)
	leaq	32(%rsp), %rax
	movq	%rax, 16(%rsp)
	call	stbiw__writefv
	movq	24(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L627
	addq	$216, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L627:
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
	jle	.L645
	leal	-1(%rsi), %eax
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	leaq	18128(%rdi), %rbx
	leaq	(%rax,%rax,2), %rax
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	salq	$5, %rax
	leaq	18224(%rdi,%rax), %rbp
.L633:
	movq	8(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L630
	call	free@PLT
	vpxor	%xmm0, %xmm0, %xmm0
	vmovdqu	%xmm0, (%rbx)
.L630:
	movq	16(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L631
	call	free@PLT
	movq	$0, 16(%rbx)
	movq	$0, 32(%rbx)
.L631:
	movq	24(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L632
	call	free@PLT
	movq	$0, 24(%rbx)
.L632:
	addq	$96, %rbx
	cmpq	%rbp, %rbx
	jne	.L633
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4
	.p2align 3
.L645:
	.cfi_restore 3
	.cfi_restore 6
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE866:
	.size	stbi__free_jpeg_components.constprop.0, .-stbi__free_jpeg_components.constprop.0
	.section	.rodata.str1.8
	.align 8
.LC61:
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
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdi, %r14
	leal	0(,%rsi,4), %edi
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movslq	%edi, %rdi
	movl	%edx, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	%esi, %r15d
	movslq	%ecx, %rbx
	subq	$360, %rsp
	.cfi_def_cfa_offset 416
	movq	%r8, 88(%rsp)
	movl	%esi, 12(%rsp)
	leaq	208(%rsp), %rbp
	movl	%edx, 72(%rsp)
	movq	%fs:40, %rax
	movq	%rax, 344(%rsp)
	xorl	%eax, %eax
	call	malloc@PLT
	vmovdqa	.LC64(%rip), %xmm0
	leaq	128(%rsp), %rsi
	movl	$65, %edx
	movq	8(%r14), %rdi
	movq	%rax, 64(%rsp)
	movw	$10, 192(%rsp)
	vmovdqa	%xmm0, 128(%rsp)
	vmovdqa	.LC65(%rip), %xmm0
	vmovdqa	%xmm0, 144(%rsp)
	vmovdqa	.LC66(%rip), %xmm0
	vmovdqa	%xmm0, 160(%rsp)
	vmovdqa	.LC67(%rip), %xmm0
	vmovdqa	%xmm0, 176(%rsp)
	call	*(%r14)
	movl	$128, %edx
	movl	$1, %esi
	movq	%rbp, %rdi
	xorl	%eax, %eax
	movl	%r15d, %r9d
	movl	%r12d, %r8d
	leaq	.LC61(%rip), %rcx
	call	__sprintf_chk@PLT
	movq	8(%r14), %rdi
	movq	%rbp, %rsi
	movl	%eax, %edx
	call	*(%r14)
	testl	%r12d, %r12d
	jle	.L654
	movl	12(%rsp), %eax
	movl	$1, 36(%rsp)
	movl	%eax, %esi
	movbew	%ax, 86(%rsp)
	imull	%ebx, %esi
	movl	%esi, 76(%rsp)
	leal	-8(%rax), %esi
	movl	%esi, 80(%rsp)
	leal	-3(%rbx), %esi
	movl	%esi, 32(%rsp)
	leal	(%rax,%rax), %esi
	movl	%esi, 96(%rsp)
	addl	%eax, %esi
	leaq	0(,%rbx,4), %rax
	movq	%rax, 24(%rsp)
	movl	36(%rsp), %eax
	movl	%esi, 100(%rsp)
.L653:
	leal	-1(%rax), %edx
	movl	stbi__flip_vertically_on_write(%rip), %ecx
	testl	%ecx, %ecx
	je	.L650
	movl	72(%rsp), %edx
	subl	%eax, %edx
.L650:
	imull	76(%rsp), %edx
	movq	88(%rsp), %rax
	movl	$514, 124(%rsp)
	cmpl	$32759, 80(%rsp)
	movslq	%edx, %rdx
	leaq	(%rax,%rdx,4), %rbp
	movzwl	86(%rsp), %eax
	movw	%ax, 126(%rsp)
	jbe	.L651
	movl	12(%rsp), %eax
	xorl	%r13d, %r13d
	leaq	120(%rsp), %rbx
	testl	%eax, %eax
	jg	.L661
	jmp	.L660
	.p2align 4
	.p2align 3
.L688:
	vmovss	.LC62(%rip), %xmm5
	vmovaps	%xmm1, %xmm2
	vmovaps	%xmm1, %xmm3
	vmovaps	%xmm1, %xmm4
	vcomiss	%xmm2, %xmm5
	jbe	.L707
.L717:
	movl	$0, 120(%rsp)
.L715:
	movq	8(%r14), %rdi
	movl	$4, %edx
	movq	%rbx, %rsi
	incl	%r13d
	call	*(%r14)
	addq	24(%rsp), %rbp
	cmpl	%r13d, 12(%rsp)
	je	.L660
.L661:
	cmpl	$1, 32(%rsp)
	vmovss	0(%rbp), %xmm1
	ja	.L688
	vmovss	8(%rbp), %xmm4
	vmovss	4(%rbp), %xmm3
	vmovss	.LC62(%rip), %xmm5
	vmaxss	%xmm4, %xmm3, %xmm2
	vmaxss	%xmm2, %xmm1, %xmm2
	vcomiss	%xmm2, %xmm5
	ja	.L717
.L707:
	vcvtss2sd	%xmm2, %xmm2, %xmm0
	leaq	116(%rsp), %rdi
	vmovss	%xmm1, 44(%rsp)
	vmovss	%xmm3, 40(%rsp)
	vmovss	%xmm4, 16(%rsp)
	vmovss	%xmm2, (%rsp)
	call	frexp@PLT
	vmovss	(%rsp), %xmm2
	xorl	%eax, %eax
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	vmulss	.LC63(%rip), %xmm0, %xmm0
	vmovss	44(%rsp), %xmm1
	vmovss	40(%rsp), %xmm3
	vmovss	16(%rsp), %xmm4
	movzbl	116(%rsp), %esi
	vdivss	%xmm2, %xmm0, %xmm0
	vmulss	%xmm1, %xmm0, %xmm1
	vmulss	%xmm3, %xmm0, %xmm3
	vmulss	%xmm4, %xmm0, %xmm0
	vcvttss2sil	%xmm1, %edx
	movb	%dl, %al
	vcvttss2sil	%xmm3, %edx
	movb	%dl, %ah
	leal	-128(%rsi), %edx
	movzwl	%ax, %eax
	sall	$24, %edx
	vcvttss2sil	%xmm0, %ecx
	movzbl	%cl, %ecx
	sall	$16, %ecx
	orl	%ecx, %eax
	orl	%edx, %eax
	movl	%eax, 120(%rsp)
	jmp	.L715
.L683:
	movq	56(%rsp), %rsi
	addq	%rsi, (%rsp)
	decl	16(%rsp)
	jne	.L685
.L660:
	movl	36(%rsp), %eax
	leal	1(%rax), %edx
	cmpl	%eax, 72(%rsp)
	je	.L654
	movl	%edx, 36(%rsp)
	movl	%edx, %eax
	jmp	.L653
.L651:
	movq	64(%rsp), %rax
	movl	12(%rsp), %edx
	movq	%r14, 104(%rsp)
	movslq	96(%rsp), %r15
	movq	24(%rsp), %rbx
	movq	%rdx, %rsi
	movq	%rax, (%rsp)
	addq	%rax, %rdx
	movq	%rax, %r13
	movslq	100(%rsp), %rax
	movslq	%esi, %rsi
	movq	%rdx, 16(%rsp)
	movq	%rsi, 56(%rsp)
	movq	%rsi, %r14
	movq	%rax, %r12
	jmp	.L667
.L691:
	vmovss	.LC62(%rip), %xmm6
	vmovaps	%xmm1, %xmm2
	vmovaps	%xmm1, %xmm4
	vmovaps	%xmm1, %xmm3
	vcomiss	%xmm2, %xmm6
	jbe	.L708
.L719:
	movl	$0, 120(%rsp)
	xorl	%edx, %edx
	xorl	%esi, %esi
	xorl	%edi, %edi
	xorl	%r8d, %r8d
.L666:
	movb	%r8b, 0(%r13)
	addq	%rbx, %rbp
	movb	%dil, 0(%r13,%r14)
	incq	%r13
	movb	%sil, -1(%r13,%r15)
	movb	%dl, -1(%r13,%r12)
	cmpq	%r13, 16(%rsp)
	je	.L718
.L667:
	cmpl	$1, 32(%rsp)
	vmovss	0(%rbp), %xmm1
	ja	.L691
	vmovss	8(%rbp), %xmm4
	vmovss	4(%rbp), %xmm3
	vmovss	.LC62(%rip), %xmm6
	vmaxss	%xmm4, %xmm3, %xmm2
	vmaxss	%xmm2, %xmm1, %xmm2
	vcomiss	%xmm2, %xmm6
	ja	.L719
.L708:
	vcvtss2sd	%xmm2, %xmm2, %xmm0
	leaq	116(%rsp), %rdi
	vmovss	%xmm1, 52(%rsp)
	vmovss	%xmm3, 48(%rsp)
	vmovss	%xmm4, 44(%rsp)
	vmovss	%xmm2, 40(%rsp)
	call	frexp@PLT
	vmovss	40(%rsp), %xmm2
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	vmulss	.LC63(%rip), %xmm0, %xmm0
	vmovss	52(%rsp), %xmm1
	vmovss	48(%rsp), %xmm3
	vmovss	44(%rsp), %xmm4
	movzbl	116(%rsp), %ecx
	leal	-128(%rcx), %edx
	xorl	%ecx, %ecx
	movl	%edx, %r10d
	sall	$24, %r10d
	vdivss	%xmm2, %xmm0, %xmm0
	vmulss	%xmm1, %xmm0, %xmm1
	vmulss	%xmm3, %xmm0, %xmm3
	vmulss	%xmm4, %xmm0, %xmm0
	vcvttss2sil	%xmm1, %r11d
	movb	%r11b, %cl
	vcvttss2sil	%xmm3, %eax
	movb	%al, %ch
	movl	%r11d, %r8d
	movl	%eax, %edi
	movzwl	%cx, %ecx
	vcvttss2sil	%xmm0, %r9d
	movl	%r9d, %esi
	movzbl	%r9b, %r9d
	sall	$16, %r9d
	orl	%r9d, %ecx
	orl	%r10d, %ecx
	movl	%ecx, 120(%rsp)
	jmp	.L666
.L718:
	movq	104(%rsp), %r14
	leaq	124(%rsp), %rsi
	movl	$4, %edx
	leaq	116(%rsp), %rbp
	movq	8(%r14), %rdi
	call	*(%r14)
	movl	$4, 16(%rsp)
.L685:
	xorl	%r15d, %r15d
	.p2align 4
	.p2align 3
.L676:
	movl	12(%rsp), %ecx
	cmpl	%r15d, %ecx
	jle	.L683
	movq	(%rsp), %rdi
	movslq	%r15d, %rax
	leal	2(%r15), %esi
	movl	%r15d, %r13d
	leaq	(%rdi,%rax), %rdx
	movl	%ecx, %edi
	cmpl	%esi, %ecx
	jg	.L671
	jmp	.L720
	.p2align 4
	.p2align 3
.L669:
	incl	%esi
	incl	%r13d
	incq	%rdx
	cmpl	%esi, %edi
	je	.L716
.L671:
	movzbl	(%rdx), %ecx
	cmpb	1(%rdx), %cl
	jne	.L669
	cmpb	2(%rdx), %cl
	jne	.L669
	cmpl	%esi, 12(%rsp)
	jle	.L716
	cmpl	%r13d, %r15d
	jl	.L674
	jmp	.L675
	.p2align 4
	.p2align 3
.L721:
	movslq	%r15d, %rax
.L674:
	movq	(%rsp), %rcx
	movl	%r13d, %ebx
	movl	$128, %edx
	movq	8(%r14), %rdi
	subl	%r15d, %ebx
	movq	%rbp, %rsi
	cmpl	%edx, %ebx
	cmovg	%edx, %ebx
	movl	$1, %edx
	leaq	(%rcx,%rax), %r12
	addl	%ebx, %r15d
	movb	%bl, 116(%rsp)
	call	*(%r14)
	movq	8(%r14), %rdi
	movl	%ebx, %edx
	movq	%r12, %rsi
	call	*(%r14)
	cmpl	%r13d, %r15d
	jl	.L721
.L675:
	leal	2(%r13), %eax
	cmpl	%eax, 12(%rsp)
	jle	.L676
	cmpl	%r13d, 12(%rsp)
	jle	.L678
	movq	(%rsp), %rsi
	movslq	%r15d, %rax
	movl	12(%rsp), %ecx
	movzbl	(%rsi,%rax), %edx
	movslq	%r13d, %rax
	addq	%rsi, %rax
	jmp	.L679
	.p2align 4
	.p2align 3
.L682:
	incl	%r13d
	incq	%rax
	cmpl	%r13d, %ecx
	je	.L678
.L679:
	cmpb	%dl, (%rax)
	je	.L682
.L678:
	leaq	115(%rsp), %r12
	cmpl	%r13d, %r15d
	jge	.L676
	movq	%rbp, %rax
	movq	%r12, %rbp
	movq	%r14, %r12
	movq	%rax, %r14
	.p2align 4
	.p2align 3
.L680:
	movq	(%rsp), %rax
	movl	%r13d, %ebx
	movl	$127, %edx
	movq	8(%r12), %rdi
	subl	%r15d, %ebx
	movq	%r14, %rsi
	cmpl	%edx, %ebx
	cmovg	%edx, %ebx
	movslq	%r15d, %rdx
	movzbl	(%rax,%rdx), %edx
	addl	%ebx, %r15d
	movb	%dl, 115(%rsp)
	leal	-128(%rbx), %edx
	movb	%dl, 116(%rsp)
	movl	$1, %edx
	call	*(%r12)
	movl	$1, %edx
	movq	8(%r12), %rdi
	movq	%rbp, %rsi
	call	*(%r12)
	cmpl	%r13d, %r15d
	jl	.L680
	movq	%r14, %rbp
	movq	%r12, %r14
	jmp	.L676
	.p2align 4
	.p2align 3
.L716:
	movl	12(%rsp), %r13d
	jmp	.L674
.L720:
	movl	%ecx, %r13d
	jmp	.L674
.L654:
	movq	64(%rsp), %rdi
	call	free@PLT
	movq	344(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L722
	addq	$360, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movl	$1, %eax
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
.L722:
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
	movl	%edx, %r8d
	orl	%esi, %eax
	js	.L723
	testl	%esi, %esi
	je	.L725
	movl	$2147483647, %eax
	cltd
	idivl	%esi
	cmpl	%eax, %edi
	jle	.L725
.L723:
	xorl	%eax, %eax
	ret
	.p2align 4
	.p2align 3
.L725:
	testl	%r8d, %r8d
	js	.L723
	imull	%esi, %edi
	testl	%r8d, %r8d
	je	.L726
	movl	$2147483647, %eax
	cltd
	idivl	%r8d
	cmpl	%eax, %edi
	jg	.L723
.L726:
	testl	%ecx, %ecx
	js	.L723
	imull	%edi, %r8d
	testl	%ecx, %ecx
	je	.L727
	movl	$2147483647, %eax
	cltd
	idivl	%ecx
	cmpl	%eax, %r8d
	jg	.L723
.L727:
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
	movl	%edx, %r8d
	orl	%esi, %eax
	js	.L743
	testl	%esi, %esi
	je	.L745
	movl	$2147483647, %eax
	cltd
	idivl	%esi
	cmpl	%eax, %edi
	jle	.L745
.L743:
	xorl	%eax, %eax
	ret
	.p2align 4
	.p2align 3
.L745:
	testl	%r8d, %r8d
	js	.L743
	imull	%esi, %edi
	testl	%r8d, %r8d
	je	.L746
	movl	$2147483647, %esi
	movl	%esi, %eax
	cltd
	idivl	%r8d
	cmpl	%eax, %edi
	jg	.L743
	imull	%edi, %r8d
	subl	%ecx, %esi
	cmpl	%r8d, %esi
	jl	.L743
.L746:
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
	movq	368(%rsp), %rsi
	movl	%r8d, 16(%rsp)
	movq	%rdi, 24(%rsp)
	testb	%al, %al
	je	.L758
	vmovaps	%xmm0, 144(%rsp)
	vmovaps	%xmm1, 160(%rsp)
	vmovaps	%xmm2, 176(%rsp)
	vmovaps	%xmm3, 192(%rsp)
	vmovaps	%xmm4, 208(%rsp)
	vmovaps	%xmm5, 224(%rsp)
	vmovaps	%xmm6, 240(%rsp)
	vmovaps	%xmm7, 256(%rsp)
.L758:
	movl	16(%rsp), %edi
	movq	%fs:40, %rax
	movq	%rax, 88(%rsp)
	xorl	%eax, %eax
	orl	%r14d, %edi
	jns	.L796
.L757:
	movq	88(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L797
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
	.p2align 4
	.p2align 3
.L796:
	.cfi_restore_state
	leaq	376(%rsp), %rax
	leaq	64(%rsp), %rdx
	movq	%rbx, %rdi
	movl	$48, 64(%rsp)
	movq	%rax, 72(%rsp)
	leaq	96(%rsp), %rax
	movl	$48, 68(%rsp)
	movq	%rax, 80(%rsp)
	call	stbiw__writefv
	movl	$0, 60(%rsp)
	movl	16(%rsp), %r10d
	testl	%r10d, %r10d
	je	.L782
	movl	stbi__flip_vertically_on_write(%rip), %r9d
	testl	%r9d, %r9d
	jne	.L788
	movl	16(%rsp), %eax
	movl	$-1, 32(%rsp)
	movl	$-1, 16(%rsp)
	decl	%eax
	movl	%eax, 4(%rsp)
.L761:
	movl	32(%rsp), %edi
	movl	%r14d, %eax
	imull	%r12d, %eax
	imull	%eax, %edi
	imull	4(%rsp), %eax
	movl	%edi, 36(%rsp)
	movl	%eax, 20(%rsp)
	leaq	60(%rsp), %rax
	movq	%rax, 40(%rsp)
	.p2align 4
	.p2align 3
.L785:
	movl	80(%rbx), %edx
	testl	%r14d, %r14d
	jle	.L784
	movslq	20(%rsp), %rbp
	movslq	%r12d, %r15
	addq	24(%rsp), %rbp
	xorl	%r13d, %r13d
	jmp	.L779
	.p2align 4
	.p2align 3
.L799:
	leal	-1(%r12), %eax
	cmpl	$1, %eax
	ja	.L764
	movl	336(%rsp), %r8d
	movzbl	0(%rbp), %eax
	movslq	%edx, %rsi
	testl	%r8d, %r8d
	jne	.L798
	incq	%rsi
	cmpq	$64, %rsi
	ja	.L770
	movslq	%edx, %rcx
	incl	%edx
.L771:
	movl	%edx, 80(%rbx)
	movb	%al, 16(%rbx,%rcx)
	.p2align 4
	.p2align 3
.L764:
	cmpl	$1, 352(%rsp)
	jne	.L774
	movslq	%edx, %rax
	movzbl	-1(%rbp,%r15), %ecx
	incq	%rax
	cmpq	$64, %rax
	ja	.L777
	movslq	%edx, %rax
	incl	%edx
.L778:
	movl	%edx, 80(%rbx)
	movb	%cl, 16(%rbx,%rax)
.L774:
	incl	%r13d
	addq	%r15, %rbp
	cmpl	%r13d, %r14d
	je	.L784
.L779:
	movq	(%rbx), %rcx
	movq	8(%rbx), %rdi
	movslq	%edx, %rax
	cmpl	$3, %r12d
	je	.L762
	jle	.L799
	cmpl	$4, %r12d
	jne	.L764
	movl	352(%rsp), %r11d
	movslq	%edx, %rax
	movzbl	0(%rbp), %r8d
	movzbl	1(%rbp), %r9d
	movzbl	2(%rbp), %esi
	leaq	3(%rax), %r10
	testl	%r11d, %r11d
	jne	.L762
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
	movzbl	%r9b, %eax
	movl	$2155905153, %r9d
	sbbb	$0, %r8b
	imull	%r11d, %eax
	subl	$255, %esi
	imull	%r11d, %esi
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
	ja	.L772
	leal	1(%rdx), %esi
	leal	2(%rdx), %ecx
	movslq	%edx, %rdi
	addl	$3, %edx
.L773:
	movslq	%esi, %rsi
	movl	%edx, 80(%rbx)
	incl	%r13d
	movb	%r9b, 16(%rbx,%rdi)
	movb	%al, 16(%rbx,%rsi)
	movslq	%ecx, %rax
	addq	%r15, %rbp
	movb	%r8b, 16(%rbx,%rax)
	cmpl	%r13d, %r14d
	jne	.L779
	.p2align 4
	.p2align 3
.L784:
	testl	%edx, %edx
	je	.L780
	movq	8(%rbx), %rdi
	leaq	16(%rbx), %rsi
	call	*(%rbx)
	movl	$0, 80(%rbx)
	movq	8(%rbx), %rdi
	movl	360(%rsp), %edx
	movq	40(%rsp), %rsi
	call	*(%rbx)
	movl	32(%rsp), %edi
	addl	%edi, 4(%rsp)
	movl	36(%rsp), %ecx
	movl	4(%rsp), %eax
	addl	%ecx, 20(%rsp)
	cmpl	%eax, 16(%rsp)
	jne	.L785
.L782:
	movl	$1, %eax
	jmp	.L757
.L788:
	movl	$1, 32(%rsp)
	movl	$0, 4(%rsp)
	jmp	.L761
	.p2align 4
	.p2align 3
.L762:
	addq	$3, %rax
	movzbl	0(%rbp), %r8d
	movzbl	1(%rbp), %r9d
	movzbl	2(%rbp), %r10d
	cmpq	$64, %rax
	ja	.L775
	leal	1(%rdx), %ecx
	leal	2(%rdx), %eax
	movslq	%edx, %rsi
	addl	$3, %edx
.L776:
	movslq	%ecx, %rcx
	cltq
	movl	%edx, 80(%rbx)
	movb	%r10b, 16(%rbx,%rsi)
	movb	%r9b, 16(%rbx,%rcx)
	movb	%r8b, 16(%rbx,%rax)
	jmp	.L764
	.p2align 4
	.p2align 3
.L777:
	movb	%cl, 10(%rsp)
	movq	8(%rbx), %rdi
	leaq	16(%rbx), %rsi
	call	*(%rbx)
	movzbl	10(%rsp), %ecx
	movl	$1, %edx
	xorl	%eax, %eax
	jmp	.L778
	.p2align 4
	.p2align 3
.L775:
	movb	%r10b, 12(%rsp)
	movb	%r9b, 11(%rsp)
	leaq	16(%rbx), %rsi
	movb	%r8b, 10(%rsp)
	call	*%rcx
	movl	$2, %eax
	movl	$1, %ecx
	movl	$3, %edx
	movzbl	12(%rsp), %r10d
	movzbl	11(%rsp), %r9d
	xorl	%esi, %esi
	movzbl	10(%rsp), %r8d
	jmp	.L776
	.p2align 4
	.p2align 3
.L770:
	movb	%al, 10(%rsp)
	leaq	16(%rbx), %rsi
	call	*%rcx
	movzbl	10(%rsp), %eax
	xorl	%ecx, %ecx
	movl	$1, %edx
	jmp	.L771
	.p2align 4
	.p2align 3
.L798:
	addq	$3, %rsi
	cmpq	$64, %rsi
	ja	.L768
	leal	1(%rdx), %esi
	leal	2(%rdx), %ecx
	movslq	%edx, %rdi
	addl	$3, %edx
.L769:
	movslq	%esi, %rsi
	movslq	%ecx, %rcx
	movl	%edx, 80(%rbx)
	movb	%al, 16(%rbx,%rdi)
	movb	%al, 16(%rbx,%rsi)
	movb	%al, 16(%rbx,%rcx)
	jmp	.L764
	.p2align 4
	.p2align 3
.L772:
	movl	%eax, 12(%rsp)
	movb	%r9b, 11(%rsp)
	leaq	16(%rbx), %rsi
	movb	%r8b, 10(%rsp)
	call	*%rcx
	xorl	%edi, %edi
	movl	$2, %ecx
	movl	$1, %esi
	movl	12(%rsp), %eax
	movzbl	11(%rsp), %r9d
	movl	$3, %edx
	movzbl	10(%rsp), %r8d
	jmp	.L773
	.p2align 4
	.p2align 3
.L780:
	movq	8(%rbx), %rdi
	movl	360(%rsp), %edx
	movq	40(%rsp), %rsi
	call	*(%rbx)
	movl	32(%rsp), %edi
	addl	%edi, 4(%rsp)
	movl	36(%rsp), %ecx
	movl	4(%rsp), %eax
	addl	%ecx, 20(%rsp)
	cmpl	16(%rsp), %eax
	jne	.L785
	movl	$1, %eax
	jmp	.L757
	.p2align 4
	.p2align 3
.L768:
	movb	%al, 10(%rsp)
	leaq	16(%rbx), %rsi
	call	*%rcx
	movl	336(%rsp), %esi
	movzbl	10(%rsp), %eax
	movl	$2, %ecx
	movl	$3, %edx
	xorl	%edi, %edi
	jmp	.L769
.L797:
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
	jle	.L811
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
	jmp	.L805
	.p2align 4
	.p2align 3
.L815:
	movslq	-4(%rax), %rdx
	movl	-8(%rax), %esi
	leal	1(%rdx), %ecx
	cmpl	%esi, %ecx
	jl	.L803
	leal	1(%rsi,%rsi), %r12d
	leaq	-8(%rax), %rdi
	movslq	%r12d, %rsi
	addq	$8, %rsi
	call	realloc@PLT
	movq	%rax, %rdx
	testq	%rax, %rax
	je	.L807
.L804:
	leaq	8(%rdx), %rax
	movl	%r12d, (%rdx)
	movslq	4(%rdx), %rdx
	leal	1(%rdx), %ecx
.L803:
	movl	(%rbx), %esi
	movl	%ecx, -4(%rax)
	movb	%sil, (%rax,%rdx)
	shrl	$8, (%rbx)
	movl	0(%rbp), %edi
	leal	-8(%rdi), %edx
	movl	%edx, 0(%rbp)
	cmpl	$7, %edx
	jle	.L814
.L805:
	testq	%rax, %rax
	jne	.L815
	movl	$10, %edi
	call	malloc@PLT
	movq	%rax, %rdx
	testq	%rax, %rax
	je	.L807
	movl	$0, 4(%rdx)
	movl	$2, %r12d
	jmp	.L804
	.p2align 4
	.p2align 3
.L814:
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4
	.p2align 3
.L811:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	ret
.L807:
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	.cfi_offset 6, -24
	.cfi_offset 12, -16
	leaq	__PRETTY_FUNCTION__.22(%rip), %rcx
	movl	$830, %edx
	leaq	.LC8(%rip), %rsi
	leaq	.LC59(%rip), %rdi
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
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	andl	$-3, %eax
	movl	%ecx, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	%eax, %ecx
	movq	%rdi, %rbp
	subq	$72, %rsp
	.cfi_def_cfa_offset 128
	cmpl	$1, %eax
	movl	%edx, %edi
	movq	%r8, %rbx
	movl	%eax, 16(%rsp)
	movl	%r12d, %eax
	movl	%edx, 48(%rsp)
	sbbl	$0, %eax
	movl	%esi, 20(%rsp)
	cmpl	$2, %eax
	movl	%eax, %edx
	setl	%r8b
	setl	%al
	xorl	%r9d, %r9d
	movzbl	%r8b, %r8d
	movzbl	%al, %eax
	addl	$10, %r8d
	addl	$2, %eax
	orl	%esi, %edi
	js	.L816
	testl	%ecx, %ecx
	movl	stbi_write_tga_with_rle(%rip), %r10d
	sete	%cl
	movzbl	%cl, %ecx
	addl	%ecx, %edx
	leal	0(,%rcx,8), %esi
	sall	$3, %edx
	testl	%r10d, %r10d
	je	.L918
	pushq	%rsi
	.cfi_def_cfa_offset 136
	pushq	%rdx
	.cfi_def_cfa_offset 144
	xorl	%r9d, %r9d
	xorl	%ecx, %ecx
	movl	64(%rsp), %r14d
	xorl	%edx, %edx
	leaq	.LC60(%rip), %rsi
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
	jne	.L883
	decl	%r14d
	movl	$-1, 52(%rsp)
	movl	$-1, 48(%rsp)
	movl	%r14d, 44(%rsp)
.L821:
	movl	48(%rsp), %ecx
	cmpl	%ecx, 44(%rsp)
	je	.L822
	movl	20(%rsp), %ecx
	testl	%ecx, %ecx
	jle	.L822
	movl	52(%rsp), %eax
	movslq	%r12d, %r14
	imull	%ecx, %eax
	imull	%r12d, %eax
	cltq
	movq	%rax, 56(%rsp)
	movl	44(%rsp), %eax
	imull	%ecx, %eax
	imull	%r12d, %eax
	cltq
	addq	%rbx, %rax
	movq	%rax, (%rsp)
	leal	-1(%rcx), %eax
	movl	%eax, 36(%rsp)
	.p2align 4
	.p2align 3
.L824:
	xorl	%r13d, %r13d
	.p2align 4
	.p2align 3
.L823:
	movl	%r12d, %ecx
	movq	(%rsp), %rdi
	leal	1(%r13), %eax
	imull	%r13d, %ecx
	movslq	%ecx, %rbx
	addq	%rdi, %rbx
	cmpl	%r13d, 36(%rsp)
	jle	.L884
	leal	(%rcx,%r12), %r15d
	movq	%r14, %rdx
	movslq	%r15d, %rsi
	addq	%rdi, %rsi
	movq	%rbx, %rdi
	call	memcmp@PLT
	movl	%eax, %ecx
	movl	%eax, 8(%rsp)
	leal	2(%r13), %eax
	testl	%ecx, %ecx
	je	.L826
	movl	20(%rsp), %esi
	cmpl	%eax, %esi
	jle	.L885
	leal	(%r15,%r12), %ecx
	movq	%rbx, 8(%rsp)
	movq	%rbp, 24(%rsp)
	movl	$2, %r15d
	movslq	%ecx, %rcx
	movq	%rbx, %rbp
	movl	%r12d, 32(%rsp)
	movl	%esi, %ebx
	addq	(%rsp), %rcx
	movq	%rcx, %r12
	jmp	.L828
	.p2align 4
	.p2align 3
.L919:
	incl	%r15d
	addq	%r14, %rbp
	addq	%r14, %r12
	leal	(%r15,%r13), %eax
	cmpl	%eax, %ebx
	jle	.L888
	cmpl	$127, %r15d
	jg	.L888
.L828:
	movq	%r14, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	memcmp@PLT
	testl	%eax, %eax
	jne	.L919
	movq	8(%rsp), %rbx
	movq	24(%rsp), %rbp
	decl	%r15d
	movl	32(%rsp), %r12d
	leal	-1(%r15), %ecx
	addl	%r15d, %r13d
.L825:
	movslq	80(%rbp), %rax
	leaq	1(%rax), %rsi
	movq	%rax, %rdx
	cmpq	$64, %rsi
	ja	.L834
	incl	%edx
.L835:
	movl	%edx, 80(%rbp)
	movb	%cl, 16(%rbp,%rax)
	xorl	%eax, %eax
	movl	%r13d, 40(%rsp)
	movq	%r14, %r13
	movl	%r12d, %r14d
	movl	%r15d, %r12d
	movl	%eax, %r15d
	jmp	.L851
	.p2align 4
	.p2align 3
.L921:
	leal	-1(%r14), %eax
	cmpl	$1, %eax
	ja	.L838
	movslq	80(%rbp), %rax
	movzbl	(%rbx), %r8d
	leaq	1(%rax), %rsi
	movq	%rax, %rdx
	cmpq	$64, %rsi
	ja	.L841
	incl	%edx
.L842:
	movl	%edx, 80(%rbp)
	movb	%r8b, 16(%rbp,%rax)
.L843:
	movl	16(%rsp), %edi
	testl	%edi, %edi
	jne	.L838
	movslq	%edx, %rax
	movzbl	-1(%rbx,%r13), %r8d
	incq	%rax
	cmpq	$64, %rax
	ja	.L849
.L922:
	leal	1(%rdx), %eax
.L850:
	movslq	%edx, %rdx
	movl	%eax, 80(%rbp)
	movb	%r8b, 16(%rbp,%rdx)
.L838:
	incl	%r15d
	addq	%r13, %rbx
	cmpl	%r15d, %r12d
	je	.L920
.L851:
	cmpl	$3, %r14d
	je	.L836
	jle	.L921
	cmpl	$4, %r14d
	jne	.L838
	movl	16(%rsp), %r8d
	testl	%r8d, %r8d
	je	.L836
	movzbl	(%rbx), %eax
	movzbl	3(%rbx), %edx
	movzbl	1(%rbx), %r10d
	movslq	80(%rbp), %r11
	subl	$255, %eax
	imull	%edx, %eax
	movq	%r11, %rsi
	movslq	%eax, %r8
	imulq	$-2139062143, %r8, %r8
	shrq	$32, %r8
	addl	%eax, %r8d
	sarl	$31, %eax
	sarl	$7, %r8d
	cmpb	$1, %al
	movl	$2155905153, %eax
	sbbb	$0, %r8b
	imull	%edx, %r10d
	imulq	%rax, %r10
	movzbl	2(%rbx), %eax
	shrq	$39, %r10
	subl	$255, %eax
	imull	%edx, %eax
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
	ja	.L844
	leal	3(%r11), %edx
	leal	1(%r11), %edi
	addl	$2, %esi
	leaq	4(%r11), %rax
.L845:
	movslq	%edi, %rdi
	movslq	%esi, %rsi
	movl	%edx, 80(%rbp)
	movb	%r9b, 16(%rbp,%r11)
	movb	%r10b, 16(%rbp,%rdi)
	movb	%r8b, 16(%rbp,%rsi)
	movzbl	-1(%rbx,%r13), %r8d
	cmpq	$64, %rax
	jbe	.L922
.L849:
	movb	%r8b, 8(%rsp)
	movq	8(%rbp), %rdi
	leaq	16(%rbp), %rsi
	call	*0(%rbp)
	movzbl	8(%rsp), %r8d
	movl	$1, %eax
	xorl	%edx, %edx
	jmp	.L850
	.p2align 4
	.p2align 3
.L920:
	movl	%r14d, %r12d
	movq	%r13, %r14
	movl	40(%rsp), %r13d
.L852:
	cmpl	%r13d, 20(%rsp)
	jg	.L823
	movl	52(%rsp), %ecx
	addl	%ecx, 44(%rsp)
	movq	56(%rsp), %rbx
	movl	44(%rsp), %eax
	addq	%rbx, (%rsp)
	cmpl	48(%rsp), %eax
	jne	.L824
.L822:
	movl	80(%rbp), %edx
	testl	%edx, %edx
	je	.L917
	movq	8(%rbp), %rdi
	leaq	16(%rbp), %rsi
	call	*0(%rbp)
	movl	$0, 80(%rbp)
.L917:
	movl	$1, %r9d
.L816:
	addq	$72, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movl	%r9d, %eax
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
.L918:
	.cfi_restore_state
	subq	$8, %rsp
	.cfi_def_cfa_offset 136
	movl	%r12d, %r9d
	pushq	%rsi
	.cfi_def_cfa_offset 144
	pushq	%rdx
	.cfi_def_cfa_offset 152
	movl	$-1, %esi
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
	leaq	.LC60(%rip), %rax
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
	addq	$144, %rsp
	.cfi_def_cfa_offset 128
	movl	%eax, %r9d
	jmp	.L816
	.p2align 4
	.p2align 3
.L836:
	movslq	80(%rbp), %rdi
	movzbl	(%rbx), %r8d
	movzbl	1(%rbx), %r9d
	movzbl	2(%rbx), %r10d
	leaq	3(%rdi), %rax
	movq	%rdi, %r11
	cmpq	$64, %rax
	ja	.L847
	leal	3(%rdi), %edx
	leal	1(%rdi), %esi
	leal	2(%rdi), %eax
.L848:
	movslq	%esi, %rsi
	cltq
	movl	%edx, 80(%rbp)
	movb	%r10b, 16(%rbp,%rdi)
	movb	%r9b, 16(%rbp,%rsi)
	movb	%r8b, 16(%rbp,%rax)
	jmp	.L843
	.p2align 4
	.p2align 3
.L847:
	movq	8(%rbp), %rdi
	movb	%r10b, 32(%rsp)
	movb	%r9b, 24(%rsp)
	leaq	16(%rbp), %rsi
	movb	%r8b, 8(%rsp)
	movl	%r11d, %edx
	call	*0(%rbp)
	movl	$2, %eax
	movl	$1, %esi
	movl	$3, %edx
	movzbl	32(%rsp), %r10d
	movzbl	24(%rsp), %r9d
	xorl	%edi, %edi
	movzbl	8(%rsp), %r8d
	jmp	.L848
	.p2align 4
	.p2align 3
.L841:
	movb	%r8b, 8(%rsp)
	movq	8(%rbp), %rdi
	leaq	16(%rbp), %rsi
	call	*0(%rbp)
	movzbl	8(%rsp), %r8d
	movl	$1, %edx
	xorl	%eax, %eax
	jmp	.L842
	.p2align 4
	.p2align 3
.L826:
	movl	20(%rsp), %edi
	cmpl	%eax, %edi
	jle	.L886
	leal	(%r15,%r12), %ecx
	movq	%rbp, 24(%rsp)
	movl	%r12d, 32(%rsp)
	movl	$2, %r15d
	movslq	%ecx, %rcx
	movl	%edi, %ebp
	addq	(%rsp), %rcx
	movq	%rcx, %r12
	jmp	.L832
	.p2align 4
	.p2align 3
.L831:
	incl	%r15d
	addq	%r14, %r12
	leal	(%r15,%r13), %eax
	cmpl	%eax, %ebp
	jle	.L889
	cmpl	$127, %r15d
	jg	.L889
.L832:
	movq	%r14, %rdx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	memcmp@PLT
	testl	%eax, %eax
	je	.L831
	movq	24(%rsp), %rbp
	movl	32(%rsp), %r12d
	leal	127(%r15), %ecx
	addl	%r15d, %r13d
.L830:
	movslq	80(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rax, %r8
	cmpq	$64, %rdx
	jbe	.L923
	movb	%cl, 24(%rsp)
	movq	8(%rbp), %rdi
	leaq	16(%rbp), %rsi
	movl	%r8d, %edx
	call	*0(%rbp)
	movl	$1, 80(%rbp)
	movzbl	24(%rsp), %ecx
	movb	%cl, 16(%rbp)
	cmpl	$3, %r12d
	je	.L853
	jg	.L854
	leal	-1(%r12), %eax
	cmpl	$1, %eax
	ja	.L855
	movzbl	(%rbx), %ecx
	movl	$2, %edx
	movl	$1, %eax
.L864:
	movl	%edx, 80(%rbp)
	movb	%cl, 16(%rbp,%rax)
.L860:
	movl	16(%rsp), %ecx
	testl	%ecx, %ecx
	jne	.L852
	movslq	%edx, %rax
	movzbl	-1(%rbx,%r14), %ebx
	incq	%rax
	cmpq	$64, %rax
	jbe	.L924
	movq	8(%rbp), %rdi
	leaq	16(%rbp), %rsi
	call	*0(%rbp)
	movl	$1, %eax
.L872:
	movl	%eax, 80(%rbp)
	movslq	8(%rsp), %rax
	movb	%bl, 16(%rbp,%rax)
	jmp	.L852
	.p2align 4
	.p2align 3
.L884:
	movl	%eax, %r13d
	xorl	%ecx, %ecx
	movl	$1, %r15d
	jmp	.L825
	.p2align 4
	.p2align 3
.L854:
	movl	$4, %eax
	movl	$1, %edx
	cmpl	$4, %r12d
	jne	.L855
.L857:
	movl	16(%rsp), %esi
	movzbl	(%rbx), %ecx
	movzbl	1(%rbx), %r8d
	movzbl	2(%rbx), %r9d
	testl	%esi, %esi
	je	.L862
	movzbl	3(%rbx), %esi
	subl	$255, %ecx
	movzbl	%r8b, %ebx
	imull	%esi, %ecx
	movslq	%ecx, %r15
	imulq	$-2139062143, %r15, %r15
	shrq	$32, %r15
	addl	%ecx, %r15d
	sarl	$31, %ecx
	sarl	$7, %r15d
	cmpb	$1, %cl
	movl	$2155905153, %ecx
	sbbb	$0, %r15b
	imull	%esi, %ebx
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
	ja	.L865
	leal	3(%rdx), %edi
	leal	1(%rdx), %esi
	leal	2(%rdx), %eax
.L866:
	movslq	%edx, %rdx
	movl	%edi, 80(%rbp)
	cltq
	movb	%cl, 16(%rbp,%rdx)
	movslq	%esi, %rdx
	movb	%bl, 16(%rbp,%rdx)
	movb	%r15b, 16(%rbp,%rax)
	jmp	.L852
	.p2align 4
	.p2align 3
.L923:
	leal	1(%r8), %edx
	movl	%edx, 80(%rbp)
	movb	%cl, 16(%rbp,%rax)
	cmpl	$3, %r12d
	je	.L858
	jg	.L859
	leal	-1(%r12), %ecx
	cmpl	$1, %ecx
	ja	.L860
	movzbl	(%rbx), %ecx
	cmpq	$63, %rax
	jne	.L925
	movb	%cl, 24(%rsp)
	movq	8(%rbp), %rdi
	leaq	16(%rbp), %rsi
	call	*0(%rbp)
	movzbl	24(%rsp), %ecx
	xorl	%eax, %eax
	movl	$1, %edx
	jmp	.L864
	.p2align 4
	.p2align 3
.L859:
	addq	$4, %rax
	cmpl	$4, %r12d
	je	.L857
	jmp	.L860
	.p2align 4
	.p2align 3
.L844:
	leaq	16(%rbp), %r11
	movl	%esi, %edx
	movq	8(%rbp), %rdi
	movl	%r10d, 32(%rsp)
	movq	%r11, %rsi
	movb	%r8b, 24(%rsp)
	movb	%r9b, 8(%rsp)
	call	*0(%rbp)
	movl	$4, %eax
	movl	$2, %esi
	movl	$1, %edi
	movl	32(%rsp), %r10d
	movzbl	24(%rsp), %r8d
	movl	$3, %edx
	xorl	%r11d, %r11d
	movzbl	8(%rsp), %r9d
	jmp	.L845
	.p2align 4
	.p2align 3
.L834:
	movb	%cl, 8(%rsp)
	movq	8(%rbp), %rdi
	leaq	16(%rbp), %rsi
	call	*0(%rbp)
	movzbl	8(%rsp), %ecx
	movl	$1, %edx
	xorl	%eax, %eax
	jmp	.L835
	.p2align 4
	.p2align 3
.L855:
	movl	16(%rsp), %eax
	testl	%eax, %eax
	jne	.L852
	movzbl	-1(%rbx,%r14), %ebx
	movl	$1, 8(%rsp)
.L878:
	movl	8(%rsp), %eax
	incl	%eax
	jmp	.L872
	.p2align 4
	.p2align 3
.L888:
	movq	8(%rsp), %rbx
	movq	24(%rsp), %rbp
	leal	-1(%r15), %ecx
	movl	%eax, %r13d
	movl	32(%rsp), %r12d
	jmp	.L825
	.p2align 4
	.p2align 3
.L889:
	movq	24(%rsp), %rbp
	movl	32(%rsp), %r12d
	leal	127(%r15), %ecx
	movl	%eax, %r13d
	jmp	.L830
	.p2align 4
	.p2align 3
.L858:
	movzbl	(%rbx), %ecx
	movzbl	1(%rbx), %r8d
	addq	$4, %rax
	movzbl	2(%rbx), %r9d
.L862:
	cmpq	$64, %rax
	jbe	.L926
	movq	8(%rbp), %rdi
	movb	%cl, 40(%rsp)
	movb	%r9b, 32(%rsp)
	leaq	16(%rbp), %rsi
	movb	%r8b, 24(%rsp)
	call	*0(%rbp)
	xorl	%eax, %eax
	movl	$2, %esi
	movl	$1, %edi
	movzbl	40(%rsp), %ecx
	movzbl	32(%rsp), %r9d
	movl	$3, %edx
	movzbl	24(%rsp), %r8d
.L870:
	movslq	%edi, %rdi
	movslq	%esi, %rsi
	movl	%edx, 80(%rbp)
	movb	%r9b, 16(%rbp,%rax)
	movb	%r8b, 16(%rbp,%rdi)
	movb	%cl, 16(%rbp,%rsi)
	jmp	.L860
	.p2align 4
	.p2align 3
.L853:
	movzbl	(%rbx), %ecx
	movzbl	1(%rbx), %r8d
	movl	$1, %eax
	movzbl	2(%rbx), %r9d
.L868:
	leal	3(%rax), %edx
	leal	1(%rax), %edi
	leal	2(%rax), %esi
	jmp	.L870
.L924:
	movl	%edx, 8(%rsp)
	jmp	.L878
.L865:
	movq	8(%rbp), %rdi
	movb	%cl, 8(%rsp)
	leaq	16(%rbp), %rsi
	call	*0(%rbp)
	movzbl	8(%rsp), %ecx
	xorl	%edx, %edx
	movl	$2, %eax
	movl	$1, %esi
	movl	$3, %edi
	jmp	.L866
.L926:
	movslq	%edx, %rax
	jmp	.L868
.L885:
	movl	%eax, %r13d
	movl	$1, %ecx
	movl	$2, %r15d
	jmp	.L825
.L886:
	movl	%eax, %r13d
	movl	$-127, %ecx
	jmp	.L830
.L883:
	movl	$1, 52(%rsp)
	movl	$0, 44(%rsp)
	jmp	.L821
.L925:
	movslq	%edx, %rax
	leal	2(%r8), %edx
	jmp	.L864
	.cfi_endproc
.LFE803:
	.size	stbi_write_tga_core, .-stbi_write_tga_core
	.section	.rodata.str1.1
.LC68:
	.string	"bad sizes"
.LC69:
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
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	vpxor	%xmm0, %xmm0, %xmm0
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
	movl	%edx, %ebp
	movq	%rsi, %rbx
	subq	$184, %rsp
	.cfi_def_cfa_offset 240
	movl	$1024, %edx
	xorl	%esi, %esi
	movq	%fs:40, %rax
	movq	%rax, 168(%rsp)
	xorl	%eax, %eax
	vmovdqa	%xmm0, 96(%rsp)
	vmovdqa	%xmm0, 112(%rsp)
	vmovdqa	%xmm0, 128(%rsp)
	vmovdqa	%xmm0, 144(%rsp)
	movl	$0, 160(%rsp)
	call	memset@PLT
	leal	-1(%rbp), %edx
	movq	%rax, %rcx
	leaq	1(%rbx,%rdx), %rsi
	movq	%rbx, %rax
	.p2align 4
	.p2align 3
.L928:
	movzbl	(%rax), %edx
	incq	%rax
	incl	96(%rsp,%rdx,4)
	cmpq	%rsi, %rax
	jne	.L928
	movl	100(%rsp), %esi
	movl	$0, 96(%rsp)
	cmpl	$2, %esi
	jg	.L929
	movl	104(%rsp), %edx
	cmpl	$4, %edx
	jg	.L929
	movl	108(%rsp), %edi
	cmpl	$8, %edi
	jg	.L929
	movl	112(%rsp), %r8d
	cmpl	$16, %r8d
	jg	.L929
	movl	116(%rsp), %r9d
	cmpl	$32, %r9d
	jg	.L929
	movl	120(%rsp), %r10d
	cmpl	$64, %r10d
	jg	.L929
	movl	124(%rsp), %r11d
	cmpl	$128, %r11d
	jg	.L929
	movl	128(%rsp), %r12d
	cmpl	$256, %r12d
	jg	.L929
	movl	132(%rsp), %r13d
	cmpl	$512, %r13d
	jg	.L929
	movl	136(%rsp), %r14d
	cmpl	$1024, %r14d
	jg	.L929
	movl	140(%rsp), %eax
	movl	%eax, 12(%rsp)
	cmpl	$2048, %eax
	jg	.L929
	movl	144(%rsp), %eax
	movl	%eax, 16(%rsp)
	cmpl	$4096, %eax
	jg	.L929
	movl	148(%rsp), %eax
	movl	%eax, 20(%rsp)
	cmpl	$8192, %eax
	jg	.L929
	movl	152(%rsp), %eax
	movl	%eax, 24(%rsp)
	cmpl	$16384, %eax
	jg	.L929
	movl	156(%rsp), %eax
	movl	%eax, 28(%rsp)
	cmpl	$32768, %eax
	jg	.L929
	movl	%esi, %eax
	movl	$0, 36(%rsp)
	movw	$0, 1026(%rcx)
	sall	$15, %eax
	movw	$0, 1126(%rcx)
	movw	%si, 1128(%rcx)
	movl	%eax, 1060(%rcx)
	leal	(%rsi,%rsi), %eax
	movl	%eax, 40(%rsp)
	movw	%ax, 1028(%rcx)
	addl	%edx, %eax
	testl	%edx, %edx
	je	.L932
	cmpl	$4, %eax
	jg	.L933
.L932:
	movl	%eax, %r15d
	addl	%esi, %edx
	addl	%eax, %eax
	sall	$14, %r15d
	movl	%eax, 44(%rsp)
	movw	%ax, 1030(%rcx)
	addl	%edi, %eax
	movl	%r15d, 1064(%rcx)
	movw	%dx, 1130(%rcx)
	testl	%edi, %edi
	je	.L934
	cmpl	$8, %eax
	jg	.L933
.L934:
	movl	%eax, %esi
	addl	%edi, %edx
	addl	%eax, %eax
	sall	$13, %esi
	movl	%eax, 48(%rsp)
	movw	%ax, 1032(%rcx)
	addl	%r8d, %eax
	movl	%esi, 1068(%rcx)
	movw	%dx, 1132(%rcx)
	testl	%r8d, %r8d
	je	.L935
	cmpl	$16, %eax
	jg	.L933
.L935:
	movl	%eax, %esi
	addl	%r8d, %edx
	addl	%eax, %eax
	sall	$12, %esi
	movl	%eax, 52(%rsp)
	movw	%ax, 1034(%rcx)
	addl	%r9d, %eax
	movl	%esi, 1072(%rcx)
	movw	%dx, 1134(%rcx)
	testl	%r9d, %r9d
	je	.L936
	cmpl	$32, %eax
	jg	.L933
.L936:
	movl	%eax, %esi
	addl	%r9d, %edx
	addl	%eax, %eax
	sall	$11, %esi
	movl	%eax, 56(%rsp)
	movw	%ax, 1036(%rcx)
	addl	%r10d, %eax
	movl	%esi, 1076(%rcx)
	movw	%dx, 1136(%rcx)
	testl	%r10d, %r10d
	je	.L937
	cmpl	$64, %eax
	jg	.L933
.L937:
	movl	%eax, %esi
	addl	%r10d, %edx
	addl	%eax, %eax
	sall	$10, %esi
	movl	%eax, 60(%rsp)
	movw	%ax, 1038(%rcx)
	addl	%r11d, %eax
	movl	%esi, 1080(%rcx)
	movw	%dx, 1138(%rcx)
	testl	%r11d, %r11d
	je	.L938
	cmpl	$128, %eax
	jg	.L933
.L938:
	movl	%eax, %esi
	addl	%r11d, %edx
	addl	%eax, %eax
	sall	$9, %esi
	movl	%eax, 64(%rsp)
	movw	%ax, 1040(%rcx)
	addl	%r12d, %eax
	movl	%esi, 1084(%rcx)
	movw	%dx, 1140(%rcx)
	testl	%r12d, %r12d
	je	.L939
	cmpl	$256, %eax
	jg	.L933
.L939:
	movl	%eax, %esi
	addl	%r12d, %edx
	addl	%eax, %eax
	sall	$8, %esi
	movl	%eax, 68(%rsp)
	movw	%ax, 1042(%rcx)
	addl	%r13d, %eax
	movl	%esi, 1088(%rcx)
	movw	%dx, 1142(%rcx)
	testl	%r13d, %r13d
	je	.L940
	cmpl	$512, %eax
	jg	.L933
.L940:
	movl	%eax, %esi
	addl	%r13d, %edx
	addl	%eax, %eax
	sall	$7, %esi
	movl	%eax, 72(%rsp)
	movw	%ax, 1044(%rcx)
	addl	%r14d, %eax
	movl	%esi, 1092(%rcx)
	movw	%dx, 1144(%rcx)
	testl	%r14d, %r14d
	je	.L941
	cmpl	$1024, %eax
	jg	.L933
.L941:
	movl	12(%rsp), %edi
	movl	%eax, %esi
	addl	%r14d, %edx
	addl	%eax, %eax
	sall	$6, %esi
	movl	%eax, 76(%rsp)
	movw	%ax, 1046(%rcx)
	movl	%esi, 1096(%rcx)
	movw	%dx, 1146(%rcx)
	addl	%edi, %eax
	testl	%edi, %edi
	je	.L942
	cmpl	$2048, %eax
	jg	.L933
.L942:
	addl	12(%rsp), %edx
	movl	16(%rsp), %edi
	movl	%eax, %esi
	addl	%eax, %eax
	sall	$5, %esi
	movl	%eax, 80(%rsp)
	movw	%ax, 1048(%rcx)
	movl	%esi, 1100(%rcx)
	addl	%edi, %eax
	movw	%dx, 1148(%rcx)
	testl	%edi, %edi
	je	.L943
	cmpl	$4096, %eax
	jg	.L933
.L943:
	addl	16(%rsp), %edx
	movl	20(%rsp), %edi
	movl	%eax, %esi
	addl	%eax, %eax
	sall	$4, %esi
	movl	%eax, 84(%rsp)
	movw	%ax, 1050(%rcx)
	movl	%esi, 1104(%rcx)
	addl	%edi, %eax
	movw	%dx, 1150(%rcx)
	testl	%edi, %edi
	je	.L944
	cmpl	$8192, %eax
	jg	.L933
.L944:
	addl	20(%rsp), %edx
	movl	24(%rsp), %edi
	leal	0(,%rax,8), %esi
	addl	%eax, %eax
	movl	%eax, 88(%rsp)
	movw	%ax, 1052(%rcx)
	movl	%esi, 1108(%rcx)
	addl	%edi, %eax
	movw	%dx, 1152(%rcx)
	testl	%edi, %edi
	je	.L945
	cmpl	$16384, %eax
	jg	.L933
.L945:
	addl	24(%rsp), %edx
	movl	28(%rsp), %edi
	leal	0(,%rax,4), %esi
	addl	%eax, %eax
	movl	%eax, 92(%rsp)
	movw	%ax, 1054(%rcx)
	movl	%esi, 1112(%rcx)
	addl	%edi, %eax
	movw	%dx, 1154(%rcx)
	testl	%edi, %edi
	jne	.L1001
.L946:
	addl	%eax, %eax
	movl	$65536, 1120(%rcx)
	xorl	%edx, %edx
	movl	$1, %r10d
	movl	%eax, 1116(%rcx)
	movl	$16, %r9d
	jmp	.L950
	.p2align 4
	.p2align 3
.L948:
	incl	%edi
	movl	%edi, 32(%rsp,%r8,4)
.L947:
	incq	%rdx
	cmpq	%rdx, %rbp
	je	.L1002
.L950:
	movzbl	(%rbx,%rdx), %r12d
	testl	%r12d, %r12d
	je	.L947
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
	jg	.L948
	movl	%edi, %r13d
	leal	(%rdi,%rdi), %eax
	movl	%r12d, %r11d
	shlx	%r12d, %r10d, %esi
	sarl	%r13d
	andl	$43690, %eax
	sall	$9, %r11d
	movslq	%esi, %rsi
	andl	$21845, %r13d
	orl	%edx, %r11d
	orl	%eax, %r13d
	movl	%r13d, %eax
	sall	$2, %r13d
	sarl	$2, %eax
	andl	$52428, %r13d
	andl	$13107, %eax
	orl	%r13d, %eax
	movl	%eax, %r13d
	sall	$4, %eax
	sarl	$4, %r13d
	andl	$61680, %eax
	andl	$3855, %r13d
	orl	%eax, %r13d
	movl	%r13d, %eax
	sall	$8, %r13d
	movzwl	%r13w, %r13d
	sarl	$8, %eax
	orl	%r13d, %eax
	movl	%r9d, %r13d
	subl	%r12d, %r13d
	sarx	%r13d, %eax, %eax
	cltq
	.p2align 4
	.p2align 3
.L949:
	movw	%r11w, (%rcx,%rax,2)
	addq	%rsi, %rax
	cmpl	$511, %eax
	jle	.L949
	jmp	.L948
	.p2align 4
	.p2align 3
.L929:
	leaq	.LC68(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
.L927:
	movq	168(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L1003
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
	.p2align 4
	.p2align 3
.L1002:
	.cfi_restore_state
	movl	$1, %eax
	jmp	.L927
	.p2align 4
	.p2align 3
.L1001:
	cmpl	$32768, %eax
	jle	.L946
	.p2align 4
	.p2align 3
.L933:
	leaq	.LC69(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L927
.L1003:
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
	movq	%rsi, %rdi
	movl	16(%rcx), %edx
	cmpl	$15, %edx
	jg	.L1005
	movq	8(%rcx), %r8
	cmpq	%r8, (%rcx)
	jnb	.L1016
	movl	20(%rcx), %esi
	jmp	.L1012
	.p2align 4
	.p2align 3
.L1008:
	movq	(%rcx), %rax
	cmpq	%rax, %r8
	jbe	.L1010
	leaq	1(%rax), %r9
	movq	%r9, (%rcx)
	movzbl	(%rax), %eax
	shlx	%edx, %eax, %eax
	orl	%eax, %esi
.L1010:
	addl	$8, %edx
	movl	%esi, 20(%rcx)
	movl	%edx, 16(%rcx)
	cmpl	$24, %edx
	jg	.L1009
.L1012:
	shrx	%edx, %esi, %eax
	testl	%eax, %eax
	je	.L1008
	movq	%r8, (%rcx)
	jmp	.L1009
	.p2align 4
	.p2align 3
.L1005:
	movl	20(%rcx), %esi
.L1009:
	movl	%esi, %eax
	andl	$511, %eax
	movzwl	(%rdi,%rax,2), %r8d
	movl	%r8d, %eax
	testl	%r8d, %r8d
	je	.L1013
	sarl	$9, %r8d
	andl	$511, %eax
	shrx	%r8d, %esi, %esi
	subl	%r8d, %edx
	movl	%esi, 20(%rcx)
	movl	%edx, 16(%rcx)
	ret
	.p2align 4
	.p2align 3
.L1013:
	movl	%esi, %r8d
	leal	(%rsi,%rsi), %eax
	sarl	%r8d
	andl	$43690, %eax
	andl	$21845, %r8d
	orl	%eax, %r8d
	movl	%r8d, %eax
	sall	$2, %r8d
	sarl	$2, %eax
	andl	$52428, %r8d
	andl	$13107, %eax
	orl	%r8d, %eax
	movl	%eax, %r8d
	sall	$4, %eax
	sarl	$4, %r8d
	andl	$61680, %eax
	andl	$3855, %r8d
	orl	%eax, %r8d
	movl	%r8d, %eax
	sall	$8, %r8d
	sarl	$8, %eax
	movzwl	%r8w, %r8d
	orl	%r8d, %eax
	cmpl	1096(%rdi), %eax
	jl	.L1017
	cmpl	1100(%rdi), %eax
	jl	.L1018
	cmpl	1104(%rdi), %eax
	jl	.L1019
	cmpl	1108(%rdi), %eax
	jl	.L1020
	cmpl	1112(%rdi), %eax
	jl	.L1021
	movl	$15, %r8d
	cmpl	1116(%rdi), %eax
	jl	.L1015
.L1016:
	movl	$-1, %eax
	ret
	.p2align 4
	.p2align 3
.L1018:
	movl	$11, %r8d
.L1015:
	movl	$16, %r9d
	subl	%r8d, %r9d
.L1014:
	sarx	%r9d, %eax, %eax
	movslq	%r8d, %r9
	movzwl	1024(%rdi,%r9,2), %r10d
	movzwl	1124(%rdi,%r9,2), %r9d
	subl	%r10d, %eax
	addl	%r9d, %eax
	cmpl	$287, %eax
	jg	.L1016
	cltq
	movzbl	1156(%rdi,%rax), %r9d
	cmpl	%r8d, %r9d
	jne	.L1016
	shrx	%r8d, %esi, %esi
	subl	%r8d, %edx
	movzwl	1444(%rdi,%rax,2), %eax
	movl	%esi, 20(%rcx)
	movl	%edx, 16(%rcx)
	ret
	.p2align 4
	.p2align 3
.L1017:
	movl	$6, %r9d
	movl	$10, %r8d
	jmp	.L1014
	.p2align 4
	.p2align 3
.L1019:
	movl	$12, %r8d
	jmp	.L1015
.L1020:
	movl	$13, %r8d
	jmp	.L1015
.L1021:
	movl	$14, %r8d
	jmp	.L1015
	.cfi_endproc
.LFE688:
	.size	stbi__zhuffman_decode, .-stbi__zhuffman_decode
	.p2align 4
	.type	stbi__convert_format, @function
stbi__convert_format:
.LFB635:
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
	movq	%rdi, %rbp
	subq	$200, %rsp
	.cfi_def_cfa_offset 256
	movl	%r8d, 4(%rsp)
	cmpl	%esi, %edx
	je	.L1087
	leal	-1(%rdx), %eax
	movl	%edx, %r13d
	cmpl	$3, %eax
	ja	.L1573
	testl	%ecx, %ecx
	js	.L1027
	leal	-1(%rcx), %ebx
	je	.L1026
	movl	$2147483647, %eax
	cltd
	idivl	%ecx
	cmpl	%eax, %r13d
	jg	.L1027
.L1026:
	movl	4(%rsp), %edi
	testl	%edi, %edi
	js	.L1027
	movl	%ecx, %r11d
	imull	%r13d, %r11d
	movl	%r11d, 8(%rsp)
	testl	%edi, %edi
	je	.L1028
	movl	$2147483647, %eax
	cltd
	idivl	%edi
	cmpl	%eax, %r11d
	jg	.L1027
	imull	8(%rsp), %edi
	movl	%ecx, 12(%rsp)
	movl	%esi, (%rsp)
	movslq	%edi, %rdi
	call	malloc@PLT
	movl	(%rsp), %esi
	testq	%rax, %rax
	movl	12(%rsp), %ecx
	movq	%rax, %r12
	je	.L1027
	leal	-2(%rcx), %eax
	movl	%esi, %r15d
	movl	$1, %edi
	vmovdqa	.LC83(%rip), %xmm7
	imull	%ecx, %r15d
	cmpl	$-1, %eax
	vmovdqa	.LC86(%rip), %xmm15
	leal	-10(%r13,%rsi,8), %r14d
	cmovge	%ecx, %edi
	setl	%al
	cmpl	$15, %ebx
	movl	%ebx, (%rsp)
	setbe	%dl
	leal	-1(%rdi), %ecx
	movl	%edi, 12(%rsp)
	orl	%eax, %edx
	movb	%dl, 35(%rsp)
	movl	%ecx, %edx
	andl	$-16, %ecx
	shrl	$4, %edx
	movq	%rcx, 72(%rsp)
	decl	%edx
	movq	%rdx, %r11
	vpsrldq	$8, %xmm7, %xmm14
	vmovdqa	.LC84(%rip), %xmm7
	vpmovzxbw	%xmm14, %xmm14
	salq	$6, %r11
	movq	%r11, 88(%rsp)
	movl	%ebx, %r11d
	subl	%ecx, %r11d
	movl	%r11d, 36(%rsp)
	leaq	0(,%rcx,4), %r11
	movq	%r11, 80(%rsp)
	leaq	(%rcx,%rcx), %r11
	movq	%r11, 112(%rsp)
	addq	%rcx, %r11
	cmpl	$14, %ebx
	setbe	%cl
	movq	%r11, 120(%rsp)
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	orl	%eax, %ecx
	movl	%edi, %eax
	vpsrldq	$8, %xmm7, %xmm0
	vpmovzxbw	%xmm0, %xmm7
	shrl	$4, %eax
	movb	%cl, 34(%rsp)
	vmovdqa	%xmm7, 160(%rsp)
	vmovdqa	.LC85(%rip), %xmm7
	decl	%eax
	andl	$-16, %edi
	movq	%rax, %rcx
	movl	%edi, 16(%rsp)
	movq	%rdi, 48(%rsp)
	salq	$6, %rcx
	movq	%rcx, 96(%rsp)
	movl	%ebx, %ecx
	subl	%edi, %ecx
	movl	%ecx, 20(%rsp)
	leaq	0(,%rdi,4), %rcx
	movq	%rcx, 56(%rsp)
	leaq	(%rdi,%rdi), %rcx
	movq	%rcx, 24(%rsp)
	addq	%rdi, %rcx
	movq	%rax, %rdi
	incq	%rax
	salq	$5, %rdi
	salq	$4, %rax
	vpsrldq	$8, %xmm7, %xmm0
	vpmovzxbw	%xmm0, %xmm7
	movq	%rdi, 104(%rsp)
	leaq	1(%rdx), %rdi
	movq	%rcx, 40(%rsp)
	movq	%rdi, 152(%rsp)
	salq	$4, %rdi
	movq	%rax, 64(%rsp)
	movq	%rdi, 144(%rsp)
	vmovdqa	%xmm7, 176(%rsp)
	xorl	%edi, %edi
	.p2align 4
	.p2align 3
.L1084:
	movl	%r8d, %r11d
	movl	%r9d, %r10d
	leaq	0(%rbp,%r11), %rcx
	leaq	(%r12,%r10), %rax
	cmpl	$25, %r14d
	ja	.L1030
	leaq	.L1032(%rip), %rsi
	movl	%r14d, %edx
	movslq	(%rsi,%rdx,4), %rdx
	addq	%rsi, %rdx
	notrack jmp	*%rdx
	.section	.rodata
	.align 4
	.align 4
.L1032:
	.long	.L1043-.L1032
	.long	.L1042-.L1032
	.long	.L1041-.L1032
	.long	.L1030-.L1032
	.long	.L1030-.L1032
	.long	.L1030-.L1032
	.long	.L1030-.L1032
	.long	.L1040-.L1032
	.long	.L1030-.L1032
	.long	.L1039-.L1032
	.long	.L1038-.L1032
	.long	.L1030-.L1032
	.long	.L1030-.L1032
	.long	.L1030-.L1032
	.long	.L1030-.L1032
	.long	.L1037-.L1032
	.long	.L1036-.L1032
	.long	.L1030-.L1032
	.long	.L1035-.L1032
	.long	.L1030-.L1032
	.long	.L1030-.L1032
	.long	.L1030-.L1032
	.long	.L1030-.L1032
	.long	.L1034-.L1032
	.long	.L1033-.L1032
	.long	.L1031-.L1032
	.text
.L1028:
	xorl	%edi, %edi
	call	malloc@PLT
	movq	%rax, %r12
	testq	%rax, %rax
	jne	.L1086
	.p2align 4
	.p2align 3
.L1027:
	movq	%rbp, %rdi
	xorl	%r12d, %r12d
	call	free@PLT
	leaq	.LC16(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
.L1022:
	addq	$200, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%r12, %rax
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
	.p2align 4
	.p2align 3
.L1087:
	.cfi_restore_state
	movq	%rdi, %r12
	jmp	.L1022
	.p2align 4
	.p2align 3
.L1031:
	movl	(%rsp), %r11d
	testl	%r11d, %r11d
	js	.L1044
	cmpb	$0, 35(%rsp)
	jne	.L1098
	vmovdqa	.LC87(%rip), %xmm7
	vmovdqa	.LC88(%rip), %xmm6
	movq	%rcx, %rdx
	movq	%rax, %rsi
	vmovdqa	.LC89(%rip), %xmm5
	vmovdqa	.LC90(%rip), %xmm4
	vmovdqa	.LC91(%rip), %xmm3
	movq	88(%rsp), %rbx
	leaq	64(%rcx,%rbx), %r10
	movl	%r11d, %ebx
	.p2align 4
	.p2align 3
.L1083:
	vmovdqu	32(%rdx), %xmm2
	vmovdqu	48(%rdx), %xmm1
	addq	$64, %rdx
	addq	$48, %rsi
	vmovdqu	-48(%rdx), %xmm0
	vpshufb	%xmm15, %xmm2, %xmm8
	vpshufb	%xmm7, %xmm1, %xmm1
	vpor	%xmm1, %xmm8, %xmm8
	vmovdqu	-64(%rdx), %xmm1
	vpshufb	%xmm5, %xmm0, %xmm9
	vpshufb	%xmm3, %xmm2, %xmm2
	vpshufb	%xmm4, %xmm0, %xmm0
	vmovdqu	%xmm8, -16(%rsi)
	vpor	%xmm2, %xmm0, %xmm0
	vmovdqu	%xmm0, -32(%rsi)
	vpshufb	%xmm6, %xmm1, %xmm1
	vpor	%xmm9, %xmm1, %xmm1
	vmovdqu	%xmm1, -48(%rsi)
	cmpq	%rdx, %r10
	jne	.L1083
	addq	80(%rsp), %rcx
	movl	%ebx, (%rsp)
	addq	120(%rsp), %rax
	movl	36(%rsp), %edx
.L1082:
	movzbl	(%rcx), %esi
	movb	%sil, (%rax)
	movzbl	1(%rcx), %esi
	movb	%sil, 1(%rax)
	movzbl	2(%rcx), %esi
	movb	%sil, 2(%rax)
	testl	%edx, %edx
	je	.L1044
	movzbl	4(%rcx), %esi
	movb	%sil, 3(%rax)
	movzbl	5(%rcx), %esi
	movb	%sil, 4(%rax)
	movzbl	6(%rcx), %esi
	movb	%sil, 5(%rax)
	cmpl	$1, %edx
	je	.L1044
	movzbl	8(%rcx), %esi
	movb	%sil, 6(%rax)
	movzbl	9(%rcx), %esi
	movb	%sil, 7(%rax)
	movzbl	10(%rcx), %esi
	movb	%sil, 8(%rax)
	cmpl	$2, %edx
	je	.L1044
	movzbl	12(%rcx), %esi
	movb	%sil, 9(%rax)
	movzbl	13(%rcx), %esi
	movb	%sil, 10(%rax)
	movzbl	14(%rcx), %esi
	movb	%sil, 11(%rax)
	cmpl	$3, %edx
	je	.L1044
	movzbl	16(%rcx), %esi
	movb	%sil, 12(%rax)
	movzbl	17(%rcx), %esi
	movb	%sil, 13(%rax)
	movzbl	18(%rcx), %esi
	movb	%sil, 14(%rax)
	cmpl	$4, %edx
	je	.L1044
	movzbl	20(%rcx), %esi
	movb	%sil, 15(%rax)
	movzbl	21(%rcx), %esi
	movb	%sil, 16(%rax)
	movzbl	22(%rcx), %esi
	movb	%sil, 17(%rax)
	cmpl	$5, %edx
	je	.L1044
	movzbl	24(%rcx), %esi
	movb	%sil, 18(%rax)
	movzbl	25(%rcx), %esi
	movb	%sil, 19(%rax)
	movzbl	26(%rcx), %esi
	movb	%sil, 20(%rax)
	cmpl	$6, %edx
	je	.L1044
	movzbl	28(%rcx), %esi
	movb	%sil, 21(%rax)
	movzbl	29(%rcx), %esi
	movb	%sil, 22(%rax)
	movzbl	30(%rcx), %esi
	movb	%sil, 23(%rax)
	cmpl	$7, %edx
	je	.L1044
	movzbl	32(%rcx), %esi
	movb	%sil, 24(%rax)
	movzbl	33(%rcx), %esi
	movb	%sil, 25(%rax)
	movzbl	34(%rcx), %esi
	movb	%sil, 26(%rax)
	cmpl	$8, %edx
	je	.L1044
	movzbl	36(%rcx), %esi
	movb	%sil, 27(%rax)
	movzbl	37(%rcx), %esi
	movb	%sil, 28(%rax)
	movzbl	38(%rcx), %esi
	movb	%sil, 29(%rax)
	cmpl	$9, %edx
	je	.L1044
	movzbl	40(%rcx), %esi
	movb	%sil, 30(%rax)
	movzbl	41(%rcx), %esi
	movb	%sil, 31(%rax)
	movzbl	42(%rcx), %esi
	movb	%sil, 32(%rax)
	cmpl	$10, %edx
	je	.L1044
	movzbl	44(%rcx), %esi
	movb	%sil, 33(%rax)
	movzbl	45(%rcx), %esi
	movb	%sil, 34(%rax)
	movzbl	46(%rcx), %esi
	movb	%sil, 35(%rax)
	cmpl	$11, %edx
	je	.L1044
	movzbl	48(%rcx), %esi
	movb	%sil, 36(%rax)
	movzbl	49(%rcx), %esi
	movb	%sil, 37(%rax)
	movzbl	50(%rcx), %esi
	movb	%sil, 38(%rax)
	cmpl	$12, %edx
	je	.L1044
	movzbl	52(%rcx), %esi
	movb	%sil, 39(%rax)
	movzbl	53(%rcx), %esi
	movb	%sil, 40(%rax)
	movzbl	54(%rcx), %esi
	movb	%sil, 41(%rax)
	cmpl	$13, %edx
	je	.L1044
	movzbl	56(%rcx), %esi
	movb	%sil, 42(%rax)
	movzbl	57(%rcx), %esi
	movb	%sil, 43(%rax)
	movzbl	58(%rcx), %esi
	movb	%sil, 44(%rax)
	cmpl	$14, %edx
	je	.L1044
	movzbl	60(%rcx), %edx
	movb	%dl, 45(%rax)
	movzbl	61(%rcx), %edx
	movb	%dl, 46(%rax)
	movzbl	62(%rcx), %edx
	movb	%dl, 47(%rax)
	.p2align 4
	.p2align 3
.L1044:
	addl	8(%rsp), %r9d
	incl	%edi
	addl	%r15d, %r8d
	cmpl	%edi, 4(%rsp)
	jg	.L1084
.L1086:
	movq	%rbp, %rdi
	call	free@PLT
	jmp	.L1022
	.p2align 4
	.p2align 3
.L1033:
	movl	(%rsp), %r11d
	testl	%r11d, %r11d
	js	.L1044
	cmpb	$0, 34(%rsp)
	jne	.L1097
	vmovdqa	.LC83(%rip), %xmm7
	vmovdqa	.LC2(%rip), %xmm0
	movq	%rcx, %rdx
	movq	%rax, %rsi
	vmovdqa	160(%rsp), %xmm6
	movq	96(%rsp), %rbx
	leaq	64(%rcx,%rbx), %r10
	movl	%r11d, %ebx
	vpmovzxbw	%xmm7, %xmm5
	vmovdqa	.LC84(%rip), %xmm7
	vpmovzxbw	%xmm7, %xmm4
	vmovdqa	.LC85(%rip), %xmm7
	vpmovzxbw	%xmm7, %xmm3
	vmovdqa	176(%rsp), %xmm7
	.p2align 4
	.p2align 3
.L1079:
	vpand	16(%rdx), %xmm0, %xmm1
	vpand	(%rdx), %xmm0, %xmm9
	addq	$64, %rdx
	addq	$32, %rsi
	vmovdqu	-64(%rdx), %xmm2
	vpand	-32(%rdx), %xmm0, %xmm10
	vpackuswb	%xmm1, %xmm9, %xmm9
	vmovdqu	-48(%rdx), %xmm1
	vpsrlw	$8, %xmm2, %xmm2
	vpsrlw	$8, %xmm1, %xmm1
	vpackuswb	%xmm1, %xmm2, %xmm2
	vpand	-16(%rdx), %xmm0, %xmm1
	vpackuswb	%xmm1, %xmm10, %xmm10
	vmovdqu	-32(%rdx), %xmm1
	vpand	%xmm10, %xmm0, %xmm11
	vpsrlw	$8, %xmm10, %xmm10
	vpsrlw	$8, %xmm1, %xmm8
	vmovdqu	-16(%rdx), %xmm1
	vpsrlw	$8, %xmm1, %xmm1
	vpackuswb	%xmm1, %xmm8, %xmm8
	vpand	%xmm9, %xmm0, %xmm1
	vpsrlw	$8, %xmm9, %xmm9
	vpackuswb	%xmm11, %xmm1, %xmm1
	vpackuswb	%xmm10, %xmm9, %xmm9
	vpand	%xmm8, %xmm0, %xmm11
	vpand	%xmm2, %xmm0, %xmm10
	vpackuswb	%xmm11, %xmm10, %xmm10
	vpsrlw	$8, %xmm8, %xmm8
	vpsrlw	$8, %xmm2, %xmm2
	vpackuswb	%xmm8, %xmm2, %xmm2
	vpmovzxbw	%xmm10, %xmm11
	vpmovzxbw	%xmm1, %xmm8
	vpsrldq	$8, %xmm10, %xmm10
	vpsrldq	$8, %xmm1, %xmm1
	vpmullw	%xmm4, %xmm11, %xmm11
	vpmovzxbw	%xmm1, %xmm1
	vpmovzxbw	%xmm10, %xmm10
	vpmullw	%xmm5, %xmm8, %xmm8
	vpmullw	%xmm14, %xmm1, %xmm1
	vpaddw	%xmm11, %xmm8, %xmm8
	vpmovzxbw	%xmm9, %xmm11
	vpsrldq	$8, %xmm9, %xmm9
	vpmovzxbw	%xmm9, %xmm9
	vpmullw	%xmm6, %xmm10, %xmm10
	vpmullw	%xmm3, %xmm11, %xmm11
	vpaddw	%xmm10, %xmm1, %xmm1
	vpmullw	%xmm7, %xmm9, %xmm9
	vpaddw	%xmm11, %xmm8, %xmm8
	vpsrlw	$8, %xmm8, %xmm8
	vpand	%xmm8, %xmm0, %xmm8
	vpaddw	%xmm9, %xmm1, %xmm1
	vpsrlw	$8, %xmm1, %xmm1
	vpand	%xmm1, %xmm0, %xmm1
	vpackuswb	%xmm1, %xmm8, %xmm8
	vpunpcklbw	%xmm2, %xmm8, %xmm1
	vpunpckhbw	%xmm2, %xmm8, %xmm8
	vmovdqu	%xmm1, -32(%rsi)
	vmovdqu	%xmm8, -16(%rsi)
	cmpq	%rdx, %r10
	jne	.L1079
	movl	%ebx, (%rsp)
	addq	56(%rsp), %rcx
	addq	24(%rsp), %rax
	movl	12(%rsp), %edx
	cmpl	%edx, 16(%rsp)
	je	.L1044
	movl	20(%rsp), %edx
.L1078:
	movzbl	(%rcx), %esi
	movzbl	1(%rcx), %r10d
	imull	$77, %esi, %esi
	imull	$150, %r10d, %r10d
	addl	%r10d, %esi
	movzbl	2(%rcx), %r10d
	imull	$29, %r10d, %r10d
	addl	%r10d, %esi
	movl	%esi, %ebx
	movb	%bh, (%rax)
	movzbl	3(%rcx), %esi
	movb	%sil, 1(%rax)
	testl	%edx, %edx
	je	.L1044
	movzbl	4(%rcx), %esi
	movzbl	5(%rcx), %r10d
	imull	$77, %esi, %esi
	imull	$150, %r10d, %r10d
	addl	%r10d, %esi
	movzbl	6(%rcx), %r10d
	imull	$29, %r10d, %r10d
	addl	%r10d, %esi
	movl	%esi, %ebx
	movb	%bh, 2(%rax)
	movzbl	7(%rcx), %esi
	movb	%sil, 3(%rax)
	cmpl	$1, %edx
	je	.L1044
	movzbl	8(%rcx), %esi
	movzbl	9(%rcx), %r10d
	imull	$77, %esi, %esi
	imull	$150, %r10d, %r10d
	addl	%r10d, %esi
	movzbl	10(%rcx), %r10d
	imull	$29, %r10d, %r10d
	addl	%r10d, %esi
	movl	%esi, %ebx
	movb	%bh, 4(%rax)
	movzbl	11(%rcx), %esi
	movb	%sil, 5(%rax)
	cmpl	$2, %edx
	je	.L1044
	movzbl	12(%rcx), %esi
	movzbl	13(%rcx), %r10d
	imull	$77, %esi, %esi
	imull	$150, %r10d, %r10d
	addl	%r10d, %esi
	movzbl	14(%rcx), %r10d
	imull	$29, %r10d, %r10d
	addl	%r10d, %esi
	movl	%esi, %ebx
	movb	%bh, 6(%rax)
	movzbl	15(%rcx), %esi
	movb	%sil, 7(%rax)
	cmpl	$3, %edx
	je	.L1044
	movzbl	16(%rcx), %esi
	movzbl	17(%rcx), %r10d
	imull	$77, %esi, %esi
	imull	$150, %r10d, %r10d
	addl	%r10d, %esi
	movzbl	18(%rcx), %r10d
	imull	$29, %r10d, %r10d
	addl	%r10d, %esi
	movl	%esi, %ebx
	movb	%bh, 8(%rax)
	movzbl	19(%rcx), %esi
	movb	%sil, 9(%rax)
	cmpl	$4, %edx
	je	.L1044
	movzbl	20(%rcx), %esi
	movzbl	21(%rcx), %r10d
	imull	$77, %esi, %esi
	imull	$150, %r10d, %r10d
	addl	%r10d, %esi
	movzbl	22(%rcx), %r10d
	imull	$29, %r10d, %r10d
	addl	%r10d, %esi
	movl	%esi, %ebx
	movb	%bh, 10(%rax)
	movzbl	23(%rcx), %esi
	movb	%sil, 11(%rax)
	cmpl	$5, %edx
	je	.L1044
	movzbl	24(%rcx), %esi
	movzbl	25(%rcx), %r10d
	imull	$77, %esi, %esi
	imull	$150, %r10d, %r10d
	addl	%r10d, %esi
	movzbl	26(%rcx), %r10d
	imull	$29, %r10d, %r10d
	addl	%r10d, %esi
	movl	%esi, %ebx
	movb	%bh, 12(%rax)
	movzbl	27(%rcx), %esi
	movb	%sil, 13(%rax)
	cmpl	$6, %edx
	je	.L1044
	movzbl	28(%rcx), %esi
	movzbl	29(%rcx), %r10d
	imull	$77, %esi, %esi
	imull	$150, %r10d, %r10d
	addl	%r10d, %esi
	movzbl	30(%rcx), %r10d
	imull	$29, %r10d, %r10d
	addl	%r10d, %esi
	movl	%esi, %ebx
	movb	%bh, 14(%rax)
	movzbl	31(%rcx), %esi
	movb	%sil, 15(%rax)
	cmpl	$7, %edx
	je	.L1044
	movzbl	32(%rcx), %esi
	movzbl	33(%rcx), %r10d
	imull	$77, %esi, %esi
	imull	$150, %r10d, %r10d
	addl	%r10d, %esi
	movzbl	34(%rcx), %r10d
	imull	$29, %r10d, %r10d
	addl	%r10d, %esi
	movl	%esi, %ebx
	movb	%bh, 16(%rax)
	movzbl	35(%rcx), %esi
	movb	%sil, 17(%rax)
	cmpl	$8, %edx
	je	.L1044
	movzbl	36(%rcx), %esi
	movzbl	37(%rcx), %r10d
	imull	$77, %esi, %esi
	imull	$150, %r10d, %r10d
	addl	%r10d, %esi
	movzbl	38(%rcx), %r10d
	imull	$29, %r10d, %r10d
	addl	%r10d, %esi
	movl	%esi, %ebx
	movb	%bh, 18(%rax)
	movzbl	39(%rcx), %esi
	movb	%sil, 19(%rax)
	cmpl	$9, %edx
	je	.L1044
	movzbl	40(%rcx), %esi
	movzbl	41(%rcx), %r10d
	imull	$77, %esi, %esi
	imull	$150, %r10d, %r10d
	addl	%r10d, %esi
	movzbl	42(%rcx), %r10d
	imull	$29, %r10d, %r10d
	addl	%r10d, %esi
	movl	%esi, %ebx
	movb	%bh, 20(%rax)
	movzbl	43(%rcx), %esi
	movb	%sil, 21(%rax)
	cmpl	$10, %edx
	je	.L1044
	movzbl	44(%rcx), %esi
	movzbl	45(%rcx), %r10d
	imull	$77, %esi, %esi
	imull	$150, %r10d, %r10d
	addl	%r10d, %esi
	movzbl	46(%rcx), %r10d
	imull	$29, %r10d, %r10d
	addl	%r10d, %esi
	movl	%esi, %ebx
	movb	%bh, 22(%rax)
	movzbl	47(%rcx), %esi
	movb	%sil, 23(%rax)
	cmpl	$11, %edx
	je	.L1044
	movzbl	48(%rcx), %esi
	movzbl	49(%rcx), %r10d
	imull	$77, %esi, %esi
	imull	$150, %r10d, %r10d
	addl	%r10d, %esi
	movzbl	50(%rcx), %r10d
	imull	$29, %r10d, %r10d
	addl	%r10d, %esi
	movl	%esi, %ebx
	movb	%bh, 24(%rax)
	movzbl	51(%rcx), %esi
	movb	%sil, 25(%rax)
	cmpl	$12, %edx
	je	.L1044
	movzbl	52(%rcx), %esi
	movzbl	53(%rcx), %r10d
	imull	$77, %esi, %esi
	imull	$150, %r10d, %r10d
	addl	%r10d, %esi
	movzbl	54(%rcx), %r10d
	imull	$29, %r10d, %r10d
	addl	%r10d, %esi
	movl	%esi, %ebx
	movb	%bh, 26(%rax)
	movzbl	55(%rcx), %esi
	movb	%sil, 27(%rax)
	cmpl	$13, %edx
	je	.L1044
	movzbl	56(%rcx), %edx
	movzbl	57(%rcx), %esi
	imull	$77, %edx, %edx
	imull	$150, %esi, %esi
	addl	%esi, %edx
	movzbl	58(%rcx), %esi
	imull	$29, %esi, %esi
	addl	%esi, %edx
	movb	%dh, 28(%rax)
	movzbl	59(%rcx), %edx
	movb	%dl, 29(%rax)
	jmp	.L1044
	.p2align 4
	.p2align 3
.L1034:
	movl	(%rsp), %r11d
	testl	%r11d, %r11d
	js	.L1044
	cmpb	$0, 35(%rsp)
	jne	.L1096
	vmovdqa	.LC83(%rip), %xmm8
	vmovdqa	.LC84(%rip), %xmm7
	movq	%rcx, %rdx
	movq	%rax, %rsi
	vmovdqa	.LC85(%rip), %xmm6
	vmovdqa	.LC2(%rip), %xmm0
	movq	88(%rsp), %rbx
	leaq	64(%rcx,%rbx), %r10
	movl	%r11d, %ebx
	vpmovzxbw	%xmm8, %xmm9
	vpmovzxbw	%xmm7, %xmm5
	vpsrldq	$8, %xmm8, %xmm8
	vpsrldq	$8, %xmm7, %xmm7
	vpmovzxbw	%xmm6, %xmm4
	vpmovzxbw	%xmm8, %xmm8
	vpsrldq	$8, %xmm6, %xmm6
	vpmovzxbw	%xmm7, %xmm7
	vpmovzxbw	%xmm6, %xmm6
	.p2align 4
	.p2align 3
.L1077:
	vpand	16(%rdx), %xmm0, %xmm1
	vpand	(%rdx), %xmm0, %xmm10
	addq	$64, %rdx
	addq	$16, %rsi
	vpand	-32(%rdx), %xmm0, %xmm2
	vmovdqu	-16(%rdx), %xmm13
	vpackuswb	%xmm1, %xmm10, %xmm10
	vpand	-16(%rdx), %xmm0, %xmm1
	vpsrlw	$8, %xmm13, %xmm11
	vpackuswb	%xmm1, %xmm2, %xmm2
	vpand	%xmm10, %xmm0, %xmm1
	vpsrlw	$8, %xmm10, %xmm10
	vpand	%xmm2, %xmm0, %xmm3
	vpsrlw	$8, %xmm2, %xmm2
	vpackuswb	%xmm2, %xmm10, %xmm10
	vpackuswb	%xmm3, %xmm1, %xmm1
	vmovdqu	-64(%rdx), %xmm3
	vpsrlw	$8, %xmm3, %xmm2
	vmovdqu	-48(%rdx), %xmm3
	vpsrlw	$8, %xmm3, %xmm3
	vpackuswb	%xmm3, %xmm2, %xmm2
	vmovdqu	-32(%rdx), %xmm3
	vpand	%xmm2, %xmm0, %xmm2
	vpsrlw	$8, %xmm3, %xmm3
	vpackuswb	%xmm11, %xmm3, %xmm3
	vpand	%xmm3, %xmm0, %xmm3
	vpackuswb	%xmm3, %xmm2, %xmm2
	vpmovzxbw	%xmm1, %xmm3
	vpsrldq	$8, %xmm1, %xmm1
	vpmovzxbw	%xmm1, %xmm1
	vpmullw	%xmm9, %xmm3, %xmm3
	vpmovzxbw	%xmm2, %xmm11
	vpsrldq	$8, %xmm2, %xmm2
	vpmovzxbw	%xmm2, %xmm2
	vpmullw	%xmm5, %xmm11, %xmm11
	vpmullw	%xmm8, %xmm1, %xmm1
	vpaddw	%xmm11, %xmm3, %xmm3
	vpmovzxbw	%xmm10, %xmm11
	vpsrldq	$8, %xmm10, %xmm10
	vpmovzxbw	%xmm10, %xmm10
	vpmullw	%xmm7, %xmm2, %xmm2
	vpmullw	%xmm4, %xmm11, %xmm11
	vpaddw	%xmm2, %xmm1, %xmm1
	vpmullw	%xmm6, %xmm10, %xmm10
	vpaddw	%xmm11, %xmm3, %xmm3
	vpsrlw	$8, %xmm3, %xmm3
	vpand	%xmm3, %xmm0, %xmm3
	vpaddw	%xmm10, %xmm1, %xmm1
	vpsrlw	$8, %xmm1, %xmm1
	vpand	%xmm1, %xmm0, %xmm1
	vpackuswb	%xmm1, %xmm3, %xmm3
	vmovdqu	%xmm3, -16(%rsi)
	cmpq	%rdx, %r10
	jne	.L1077
	addq	80(%rsp), %rcx
	movl	%ebx, (%rsp)
	addq	72(%rsp), %rax
	movl	36(%rsp), %edx
.L1076:
	movzbl	(%rcx), %esi
	movzbl	1(%rcx), %r10d
	imull	$77, %esi, %esi
	imull	$150, %r10d, %r10d
	addl	%r10d, %esi
	movzbl	2(%rcx), %r10d
	imull	$29, %r10d, %r10d
	addl	%r10d, %esi
	movl	%esi, %ebx
	movb	%bh, (%rax)
	testl	%edx, %edx
	je	.L1044
	movzbl	4(%rcx), %esi
	movzbl	5(%rcx), %r10d
	imull	$77, %esi, %esi
	imull	$150, %r10d, %r10d
	addl	%r10d, %esi
	movzbl	6(%rcx), %r10d
	imull	$29, %r10d, %r10d
	addl	%r10d, %esi
	movl	%esi, %ebx
	movb	%bh, 1(%rax)
	cmpl	$1, %edx
	je	.L1044
	movzbl	8(%rcx), %esi
	movzbl	9(%rcx), %r10d
	imull	$77, %esi, %esi
	imull	$150, %r10d, %r10d
	addl	%r10d, %esi
	movzbl	10(%rcx), %r10d
	imull	$29, %r10d, %r10d
	addl	%r10d, %esi
	movl	%esi, %ebx
	movb	%bh, 2(%rax)
	cmpl	$2, %edx
	je	.L1044
	movzbl	12(%rcx), %esi
	movzbl	13(%rcx), %r10d
	imull	$77, %esi, %esi
	imull	$150, %r10d, %r10d
	addl	%r10d, %esi
	movzbl	14(%rcx), %r10d
	imull	$29, %r10d, %r10d
	addl	%r10d, %esi
	movl	%esi, %ebx
	movb	%bh, 3(%rax)
	cmpl	$3, %edx
	je	.L1044
	movzbl	16(%rcx), %esi
	movzbl	17(%rcx), %r10d
	imull	$77, %esi, %esi
	imull	$150, %r10d, %r10d
	addl	%r10d, %esi
	movzbl	18(%rcx), %r10d
	imull	$29, %r10d, %r10d
	addl	%r10d, %esi
	movl	%esi, %ebx
	movb	%bh, 4(%rax)
	cmpl	$4, %edx
	je	.L1044
	movzbl	20(%rcx), %esi
	movzbl	21(%rcx), %r10d
	imull	$77, %esi, %esi
	imull	$150, %r10d, %r10d
	addl	%r10d, %esi
	movzbl	22(%rcx), %r10d
	imull	$29, %r10d, %r10d
	addl	%r10d, %esi
	movl	%esi, %ebx
	movb	%bh, 5(%rax)
	cmpl	$5, %edx
	je	.L1044
	movzbl	24(%rcx), %esi
	movzbl	25(%rcx), %r10d
	imull	$77, %esi, %esi
	imull	$150, %r10d, %r10d
	addl	%r10d, %esi
	movzbl	26(%rcx), %r10d
	imull	$29, %r10d, %r10d
	addl	%r10d, %esi
	movl	%esi, %ebx
	movb	%bh, 6(%rax)
	cmpl	$6, %edx
	je	.L1044
	movzbl	28(%rcx), %esi
	movzbl	29(%rcx), %r10d
	imull	$77, %esi, %esi
	imull	$150, %r10d, %r10d
	addl	%r10d, %esi
	movzbl	30(%rcx), %r10d
	imull	$29, %r10d, %r10d
	addl	%r10d, %esi
	movl	%esi, %ebx
	movb	%bh, 7(%rax)
	cmpl	$7, %edx
	je	.L1044
	movzbl	32(%rcx), %esi
	movzbl	33(%rcx), %r10d
	imull	$77, %esi, %esi
	imull	$150, %r10d, %r10d
	addl	%r10d, %esi
	movzbl	34(%rcx), %r10d
	imull	$29, %r10d, %r10d
	addl	%r10d, %esi
	movl	%esi, %ebx
	movb	%bh, 8(%rax)
	cmpl	$8, %edx
	je	.L1044
	movzbl	36(%rcx), %esi
	movzbl	37(%rcx), %r10d
	imull	$77, %esi, %esi
	imull	$150, %r10d, %r10d
	addl	%r10d, %esi
	movzbl	38(%rcx), %r10d
	imull	$29, %r10d, %r10d
	addl	%r10d, %esi
	movl	%esi, %ebx
	movb	%bh, 9(%rax)
	cmpl	$9, %edx
	je	.L1044
	movzbl	40(%rcx), %esi
	movzbl	41(%rcx), %r10d
	imull	$77, %esi, %esi
	imull	$150, %r10d, %r10d
	addl	%r10d, %esi
	movzbl	42(%rcx), %r10d
	imull	$29, %r10d, %r10d
	addl	%r10d, %esi
	movl	%esi, %ebx
	movb	%bh, 10(%rax)
	cmpl	$10, %edx
	je	.L1044
	movzbl	44(%rcx), %esi
	movzbl	45(%rcx), %r10d
	imull	$77, %esi, %esi
	imull	$150, %r10d, %r10d
	addl	%r10d, %esi
	movzbl	46(%rcx), %r10d
	imull	$29, %r10d, %r10d
	addl	%r10d, %esi
	movl	%esi, %ebx
	movb	%bh, 11(%rax)
	cmpl	$11, %edx
	je	.L1044
	movzbl	48(%rcx), %esi
	movzbl	49(%rcx), %r10d
	imull	$77, %esi, %esi
	imull	$150, %r10d, %r10d
	addl	%r10d, %esi
	movzbl	50(%rcx), %r10d
	imull	$29, %r10d, %r10d
	addl	%r10d, %esi
	movl	%esi, %ebx
	movb	%bh, 12(%rax)
	cmpl	$12, %edx
	je	.L1044
	movzbl	52(%rcx), %esi
	movzbl	53(%rcx), %r10d
	imull	$77, %esi, %esi
	imull	$150, %r10d, %r10d
	addl	%r10d, %esi
	movzbl	54(%rcx), %r10d
	imull	$29, %r10d, %r10d
	addl	%r10d, %esi
	movl	%esi, %ebx
	movb	%bh, 13(%rax)
	cmpl	$13, %edx
	je	.L1044
	movzbl	56(%rcx), %esi
	movzbl	57(%rcx), %r10d
	imull	$77, %esi, %esi
	imull	$150, %r10d, %r10d
	addl	%r10d, %esi
	movzbl	58(%rcx), %r10d
	imull	$29, %r10d, %r10d
	addl	%r10d, %esi
	movl	%esi, %ebx
	movb	%bh, 14(%rax)
	cmpl	$14, %edx
	je	.L1044
	movzbl	60(%rcx), %esi
	movzbl	61(%rcx), %edx
	movzbl	62(%rcx), %ecx
	imull	$77, %esi, %esi
	imull	$150, %edx, %edx
	imull	$29, %ecx, %ecx
	addl	%esi, %edx
	addl	%ecx, %edx
	movb	%dh, 15(%rax)
	jmp	.L1044
	.p2align 4
	.p2align 3
.L1035:
	movl	(%rsp), %edx
	testl	%edx, %edx
	js	.L1044
	cmpb	$0, 34(%rsp)
	jne	.L1093
	movq	96(%rsp), %rbx
	movq	%rax, %rdx
	movq	%rax, 136(%rsp)
	movq	%rcx, %r13
	leaq	3(%r12,%r10), %rsi
	leaq	64(%rax,%rbx), %rbx
	movq	%rbx, 128(%rsp)
	movl	(%rsp), %ebx
	movq	128(%rsp), %rax
	.p2align 4
	.p2align 3
.L1063:
	vmovdqu	32(%r13), %xmm0
	addq	$64, %rdx
	addq	$48, %r13
	addq	$64, %rsi
	vmovdqu	-32(%r13), %xmm1
	vmovdqu	-48(%r13), %xmm2
	vpextrb	$0, %xmm1, -43(%rdx)
	vpextrb	$0, %xmm2, -64(%rdx)
	vpextrb	$1, %xmm2, -63(%rdx)
	vpextrb	$2, %xmm2, -62(%rdx)
	vpextrb	$3, %xmm2, -60(%rdx)
	vpextrb	$4, %xmm2, -59(%rdx)
	vpextrb	$5, %xmm2, -58(%rdx)
	vpextrb	$6, %xmm2, -56(%rdx)
	vpextrb	$7, %xmm2, -55(%rdx)
	vpextrb	$8, %xmm2, -54(%rdx)
	vpextrb	$9, %xmm2, -52(%rdx)
	vpextrb	$10, %xmm2, -51(%rdx)
	vpextrb	$11, %xmm2, -50(%rdx)
	vpextrb	$12, %xmm2, -48(%rdx)
	vpextrb	$13, %xmm2, -47(%rdx)
	vpextrb	$14, %xmm2, -46(%rdx)
	vpextrb	$15, %xmm2, -44(%rdx)
	vpextrb	$1, %xmm1, -42(%rdx)
	vpextrb	$2, %xmm1, -40(%rdx)
	vpextrb	$3, %xmm1, -39(%rdx)
	vpextrb	$4, %xmm1, -38(%rdx)
	vpextrb	$5, %xmm1, -36(%rdx)
	vpextrb	$6, %xmm1, -35(%rdx)
	vpextrb	$7, %xmm1, -34(%rdx)
	vpextrb	$8, %xmm1, -32(%rdx)
	vpextrb	$9, %xmm1, -31(%rdx)
	vpextrb	$10, %xmm1, -30(%rdx)
	vpextrb	$11, %xmm1, -28(%rdx)
	vpextrb	$12, %xmm1, -27(%rdx)
	vpextrb	$13, %xmm1, -26(%rdx)
	vpextrb	$14, %xmm1, -24(%rdx)
	vpextrb	$15, %xmm1, -23(%rdx)
	vpextrb	$0, %xmm0, -22(%rdx)
	vpextrb	$1, %xmm0, -20(%rdx)
	vpextrb	$2, %xmm0, -19(%rdx)
	vpextrb	$3, %xmm0, -18(%rdx)
	vpextrb	$4, %xmm0, -16(%rdx)
	vpextrb	$5, %xmm0, -15(%rdx)
	vpextrb	$6, %xmm0, -14(%rdx)
	vpextrb	$7, %xmm0, -12(%rdx)
	vpextrb	$8, %xmm0, -11(%rdx)
	vpextrb	$9, %xmm0, -10(%rdx)
	vpextrb	$10, %xmm0, -8(%rdx)
	vpextrb	$11, %xmm0, -7(%rdx)
	vpextrb	$12, %xmm0, -6(%rdx)
	vpextrb	$13, %xmm0, -4(%rdx)
	vpextrb	$14, %xmm0, -3(%rdx)
	vpextrb	$15, %xmm0, -2(%rdx)
	movb	$-1, -64(%rsi)
	movb	$-1, -60(%rsi)
	movb	$-1, -56(%rsi)
	movb	$-1, -52(%rsi)
	movb	$-1, -48(%rsi)
	movb	$-1, -44(%rsi)
	movb	$-1, -40(%rsi)
	movb	$-1, -36(%rsi)
	movb	$-1, -32(%rsi)
	movb	$-1, -28(%rsi)
	movb	$-1, -24(%rsi)
	movb	$-1, -20(%rsi)
	movb	$-1, -16(%rsi)
	movb	$-1, -12(%rsi)
	movb	$-1, -8(%rsi)
	movb	$-1, -4(%rsi)
	cmpq	%rdx, %rax
	jne	.L1063
	movl	%ebx, (%rsp)
	movl	16(%rsp), %esi
	movl	12(%rsp), %ebx
	movq	136(%rsp), %rax
	addq	40(%rsp), %rcx
	addq	56(%rsp), %rax
	cmpl	%ebx, %esi
	je	.L1044
	movl	20(%rsp), %r13d
.L1062:
	subl	%esi, %ebx
	leal	-1(%rbx), %edx
	cmpl	$6, %edx
	jbe	.L1066
	leaq	(%rsi,%rsi,2), %rdx
	leaq	(%r10,%rsi,4), %rsi
	addq	%r11, %rdx
	leaq	3(%r12,%rsi), %r10
	addq	%rbp, %rdx
	vmovq	(%rdx), %xmm2
	vmovq	8(%rdx), %xmm1
	vmovq	16(%rdx), %xmm0
	movl	%ebx, %edx
	andl	$-8, %edx
	vpextrb	$0, %xmm2, (%r12,%rsi)
	vpextrb	$1, %xmm2, 1(%r12,%rsi)
	vpextrb	$2, %xmm2, 2(%r12,%rsi)
	vpextrb	$3, %xmm2, 4(%r12,%rsi)
	subl	%edx, %r13d
	vpextrb	$4, %xmm2, 5(%r12,%rsi)
	vpextrb	$5, %xmm2, 6(%r12,%rsi)
	vpextrb	$6, %xmm2, 8(%r12,%rsi)
	vpextrb	$7, %xmm2, 9(%r12,%rsi)
	vpextrb	$0, %xmm1, 10(%r12,%rsi)
	vpextrb	$1, %xmm1, 12(%r12,%rsi)
	vpextrb	$2, %xmm1, 13(%r12,%rsi)
	vpextrb	$3, %xmm1, 14(%r12,%rsi)
	vpextrb	$4, %xmm1, 16(%r12,%rsi)
	vpextrb	$5, %xmm1, 17(%r12,%rsi)
	vpextrb	$6, %xmm1, 18(%r12,%rsi)
	vpextrb	$7, %xmm1, 20(%r12,%rsi)
	vpextrb	$0, %xmm0, 21(%r12,%rsi)
	vpextrb	$1, %xmm0, 22(%r12,%rsi)
	vpextrb	$2, %xmm0, 24(%r12,%rsi)
	vpextrb	$3, %xmm0, 25(%r12,%rsi)
	vpextrb	$4, %xmm0, 26(%r12,%rsi)
	vpextrb	$5, %xmm0, 28(%r12,%rsi)
	vpextrb	$6, %xmm0, 29(%r12,%rsi)
	vpextrb	$7, %xmm0, 30(%r12,%rsi)
	movl	%edx, %esi
	movb	$-1, (%r10)
	movb	$-1, 4(%r10)
	movb	$-1, 8(%r10)
	leaq	(%rax,%rsi,4), %rax
	movb	$-1, 12(%r10)
	movb	$-1, 16(%r10)
	movb	$-1, 20(%r10)
	movb	$-1, 24(%r10)
	movb	$-1, 28(%r10)
	leaq	(%rsi,%rsi,2), %r10
	addq	%r10, %rcx
	cmpl	%edx, %ebx
	je	.L1044
.L1066:
	movzbl	(%rcx), %edx
	movb	%dl, (%rax)
	movzbl	1(%rcx), %edx
	movb	%dl, 1(%rax)
	movzbl	2(%rcx), %edx
	movb	$-1, 3(%rax)
	movb	%dl, 2(%rax)
	testl	%r13d, %r13d
	je	.L1044
	movzbl	3(%rcx), %edx
	movb	%dl, 4(%rax)
	movzbl	4(%rcx), %edx
	movb	%dl, 5(%rax)
	movzbl	5(%rcx), %edx
	movb	$-1, 7(%rax)
	movb	%dl, 6(%rax)
	cmpl	$1, %r13d
	je	.L1044
	movzbl	6(%rcx), %edx
	movb	%dl, 8(%rax)
	movzbl	7(%rcx), %edx
	movb	%dl, 9(%rax)
	movzbl	8(%rcx), %edx
	movb	$-1, 11(%rax)
	movb	%dl, 10(%rax)
	cmpl	$2, %r13d
	je	.L1044
	movzbl	9(%rcx), %edx
	movb	%dl, 12(%rax)
	movzbl	10(%rcx), %edx
	movb	%dl, 13(%rax)
	movzbl	11(%rcx), %edx
	movb	$-1, 15(%rax)
	movb	%dl, 14(%rax)
	cmpl	$3, %r13d
	je	.L1044
	movzbl	12(%rcx), %edx
	movb	%dl, 16(%rax)
	movzbl	13(%rcx), %edx
	movb	%dl, 17(%rax)
	movzbl	14(%rcx), %edx
	movb	$-1, 19(%rax)
	movb	%dl, 18(%rax)
	cmpl	$4, %r13d
	je	.L1044
	movzbl	15(%rcx), %edx
	movb	%dl, 20(%rax)
	movzbl	16(%rcx), %edx
	movb	%dl, 21(%rax)
	movzbl	17(%rcx), %edx
	movb	$-1, 23(%rax)
	movb	%dl, 22(%rax)
	cmpl	$5, %r13d
	je	.L1044
	movzbl	18(%rcx), %edx
	movb	%dl, 24(%rax)
	movzbl	19(%rcx), %edx
	movb	%dl, 25(%rax)
	movzbl	20(%rcx), %edx
	movb	$-1, 27(%rax)
	movb	%dl, 26(%rax)
	jmp	.L1044
	.p2align 4
	.p2align 3
.L1036:
	movl	(%rsp), %r11d
	testl	%r11d, %r11d
	js	.L1044
	cmpb	$0, 34(%rsp)
	jne	.L1095
	vmovdqa	.LC83(%rip), %xmm8
	vmovdqa	.LC84(%rip), %xmm7
	movq	%rcx, %rsi
	movq	%rax, %rdx
	vmovdqa	.LC85(%rip), %xmm6
	vmovdqa	.LC2(%rip), %xmm0
	vpcmpeqd	%xmm10, %xmm10, %xmm10
	vmovdqa	.LC82(%rip), %xmm5
	movq	104(%rsp), %rbx
	leaq	32(%rax,%rbx), %r10
	movl	%r11d, %ebx
	vpmovzxbw	%xmm8, %xmm13
	vpmovzxbw	%xmm7, %xmm12
	vpsrldq	$8, %xmm8, %xmm8
	vpsrldq	$8, %xmm7, %xmm7
	vpmovzxbw	%xmm6, %xmm11
	vpmovzxbw	%xmm8, %xmm8
	vpsrldq	$8, %xmm6, %xmm6
	vpmovzxbw	%xmm7, %xmm7
	vpmovzxbw	%xmm6, %xmm6
	.p2align 4
	.p2align 3
.L1073:
	vmovdqu	(%rsi), %xmm4
	addq	$32, %rdx
	addq	$48, %rsi
	vpshufb	%xmm5, %xmm4, %xmm3
	vmovdqu	-32(%rsi), %xmm4
	vpshufb	%xmm5, %xmm4, %xmm2
	vmovdqu	-16(%rsi), %xmm4
	vpalignr	$11, %xmm3, %xmm2, %xmm1
	vpshufb	%xmm5, %xmm4, %xmm4
	vpalignr	$11, %xmm4, %xmm3, %xmm3
	vpalignr	$11, %xmm2, %xmm4, %xmm2
	vpalignr	$11, %xmm2, %xmm1, %xmm4
	vpalignr	$11, %xmm3, %xmm2, %xmm2
	vpalignr	$11, %xmm1, %xmm3, %xmm1
	vpalignr	$5, %xmm4, %xmm4, %xmm4
	vpalignr	$10, %xmm1, %xmm1, %xmm1
	vpmovzxbw	%xmm4, %xmm9
	vpmullw	%xmm12, %xmm9, %xmm9
	vpmovzxbw	%xmm1, %xmm3
	vpsrldq	$8, %xmm4, %xmm4
	vpsrldq	$8, %xmm1, %xmm1
	vpmovzxbw	%xmm4, %xmm4
	vpmovzxbw	%xmm1, %xmm1
	vpmullw	%xmm13, %xmm3, %xmm3
	vpmullw	%xmm8, %xmm1, %xmm1
	vpaddw	%xmm9, %xmm3, %xmm3
	vpmovzxbw	%xmm2, %xmm9
	vpsrldq	$8, %xmm2, %xmm2
	vpmovzxbw	%xmm2, %xmm2
	vpmullw	%xmm7, %xmm4, %xmm4
	vpmullw	%xmm11, %xmm9, %xmm9
	vpaddw	%xmm4, %xmm1, %xmm1
	vpmullw	%xmm6, %xmm2, %xmm2
	vpaddw	%xmm9, %xmm3, %xmm3
	vpsrlw	$8, %xmm3, %xmm3
	vpaddw	%xmm2, %xmm1, %xmm2
	vpand	%xmm3, %xmm0, %xmm1
	vpsrlw	$8, %xmm2, %xmm2
	vpand	%xmm2, %xmm0, %xmm2
	vpackuswb	%xmm2, %xmm1, %xmm1
	vpunpcklbw	%xmm10, %xmm1, %xmm2
	vpunpckhbw	%xmm10, %xmm1, %xmm1
	vmovdqu	%xmm2, -32(%rdx)
	vmovdqu	%xmm1, -16(%rdx)
	cmpq	%rdx, %r10
	jne	.L1073
	movl	%ebx, (%rsp)
	addq	40(%rsp), %rcx
	addq	24(%rsp), %rax
	movl	12(%rsp), %edx
	cmpl	%edx, 16(%rsp)
	je	.L1044
	movl	20(%rsp), %edx
.L1072:
	movzbl	(%rcx), %esi
	movzbl	1(%rcx), %r10d
	imull	$77, %esi, %esi
	imull	$150, %r10d, %r10d
	addl	%r10d, %esi
	movzbl	2(%rcx), %r10d
	movb	$-1, 1(%rax)
	imull	$29, %r10d, %r10d
	addl	%r10d, %esi
	movl	%esi, %ebx
	movb	%bh, (%rax)
	testl	%edx, %edx
	je	.L1044
	movzbl	3(%rcx), %esi
	movzbl	4(%rcx), %r10d
	imull	$77, %esi, %esi
	imull	$150, %r10d, %r10d
	addl	%r10d, %esi
	movzbl	5(%rcx), %r10d
	movb	$-1, 3(%rax)
	imull	$29, %r10d, %r10d
	addl	%r10d, %esi
	movl	%esi, %ebx
	movb	%bh, 2(%rax)
	cmpl	$1, %edx
	je	.L1044
	movzbl	6(%rcx), %esi
	movzbl	7(%rcx), %r10d
	imull	$77, %esi, %esi
	imull	$150, %r10d, %r10d
	addl	%r10d, %esi
	movzbl	8(%rcx), %r10d
	movb	$-1, 5(%rax)
	imull	$29, %r10d, %r10d
	addl	%r10d, %esi
	movl	%esi, %ebx
	movb	%bh, 4(%rax)
	cmpl	$2, %edx
	je	.L1044
	movzbl	9(%rcx), %esi
	movzbl	10(%rcx), %r10d
	imull	$77, %esi, %esi
	imull	$150, %r10d, %r10d
	addl	%r10d, %esi
	movzbl	11(%rcx), %r10d
	movb	$-1, 7(%rax)
	imull	$29, %r10d, %r10d
	addl	%r10d, %esi
	movl	%esi, %ebx
	movb	%bh, 6(%rax)
	cmpl	$3, %edx
	je	.L1044
	movzbl	12(%rcx), %esi
	movzbl	13(%rcx), %r10d
	imull	$77, %esi, %esi
	imull	$150, %r10d, %r10d
	addl	%r10d, %esi
	movzbl	14(%rcx), %r10d
	movb	$-1, 9(%rax)
	imull	$29, %r10d, %r10d
	addl	%r10d, %esi
	movl	%esi, %ebx
	movb	%bh, 8(%rax)
	cmpl	$4, %edx
	je	.L1044
	movzbl	15(%rcx), %esi
	movzbl	16(%rcx), %r10d
	imull	$77, %esi, %esi
	imull	$150, %r10d, %r10d
	addl	%r10d, %esi
	movzbl	17(%rcx), %r10d
	movb	$-1, 11(%rax)
	imull	$29, %r10d, %r10d
	addl	%r10d, %esi
	movl	%esi, %ebx
	movb	%bh, 10(%rax)
	cmpl	$5, %edx
	je	.L1044
	movzbl	18(%rcx), %esi
	movzbl	19(%rcx), %r10d
	imull	$77, %esi, %esi
	imull	$150, %r10d, %r10d
	addl	%r10d, %esi
	movzbl	20(%rcx), %r10d
	movb	$-1, 13(%rax)
	imull	$29, %r10d, %r10d
	addl	%r10d, %esi
	movl	%esi, %ebx
	movb	%bh, 12(%rax)
	cmpl	$6, %edx
	je	.L1044
	movzbl	21(%rcx), %esi
	movzbl	22(%rcx), %r10d
	imull	$77, %esi, %esi
	imull	$150, %r10d, %r10d
	addl	%r10d, %esi
	movzbl	23(%rcx), %r10d
	movb	$-1, 15(%rax)
	imull	$29, %r10d, %r10d
	addl	%r10d, %esi
	movl	%esi, %ebx
	movb	%bh, 14(%rax)
	cmpl	$7, %edx
	je	.L1044
	movzbl	24(%rcx), %esi
	movzbl	25(%rcx), %r10d
	imull	$77, %esi, %esi
	imull	$150, %r10d, %r10d
	addl	%r10d, %esi
	movzbl	26(%rcx), %r10d
	movb	$-1, 17(%rax)
	imull	$29, %r10d, %r10d
	addl	%r10d, %esi
	movl	%esi, %ebx
	movb	%bh, 16(%rax)
	cmpl	$8, %edx
	je	.L1044
	movzbl	27(%rcx), %esi
	movzbl	28(%rcx), %r10d
	imull	$77, %esi, %esi
	imull	$150, %r10d, %r10d
	addl	%r10d, %esi
	movzbl	29(%rcx), %r10d
	movb	$-1, 19(%rax)
	imull	$29, %r10d, %r10d
	addl	%r10d, %esi
	movl	%esi, %ebx
	movb	%bh, 18(%rax)
	cmpl	$9, %edx
	je	.L1044
	movzbl	30(%rcx), %esi
	movzbl	31(%rcx), %r10d
	imull	$77, %esi, %esi
	imull	$150, %r10d, %r10d
	addl	%r10d, %esi
	movzbl	32(%rcx), %r10d
	movb	$-1, 21(%rax)
	imull	$29, %r10d, %r10d
	addl	%r10d, %esi
	movl	%esi, %ebx
	movb	%bh, 20(%rax)
	cmpl	$10, %edx
	je	.L1044
	movzbl	33(%rcx), %esi
	movzbl	34(%rcx), %r10d
	imull	$77, %esi, %esi
	imull	$150, %r10d, %r10d
	addl	%r10d, %esi
	movzbl	35(%rcx), %r10d
	movb	$-1, 23(%rax)
	imull	$29, %r10d, %r10d
	addl	%r10d, %esi
	movl	%esi, %ebx
	movb	%bh, 22(%rax)
	cmpl	$11, %edx
	je	.L1044
	movzbl	36(%rcx), %esi
	movzbl	37(%rcx), %r10d
	imull	$77, %esi, %esi
	imull	$150, %r10d, %r10d
	addl	%r10d, %esi
	movzbl	38(%rcx), %r10d
	movb	$-1, 25(%rax)
	imull	$29, %r10d, %r10d
	addl	%r10d, %esi
	movl	%esi, %ebx
	movb	%bh, 24(%rax)
	cmpl	$12, %edx
	je	.L1044
	movzbl	39(%rcx), %esi
	movzbl	40(%rcx), %r10d
	imull	$77, %esi, %esi
	imull	$150, %r10d, %r10d
	addl	%r10d, %esi
	movzbl	41(%rcx), %r10d
	movb	$-1, 27(%rax)
	imull	$29, %r10d, %r10d
	addl	%r10d, %esi
	movl	%esi, %ebx
	movb	%bh, 26(%rax)
	cmpl	$13, %edx
	je	.L1044
	movzbl	42(%rcx), %esi
	movzbl	43(%rcx), %edx
	movzbl	44(%rcx), %ecx
	movb	$-1, 29(%rax)
	imull	$77, %esi, %esi
	imull	$150, %edx, %edx
	imull	$29, %ecx, %ecx
	addl	%esi, %edx
	addl	%ecx, %edx
	movb	%dh, 28(%rax)
	jmp	.L1044
	.p2align 4
	.p2align 3
.L1037:
	movl	(%rsp), %r11d
	testl	%r11d, %r11d
	js	.L1044
	cmpb	$0, 34(%rsp)
	jne	.L1094
	vmovdqa	.LC83(%rip), %xmm8
	vmovdqa	.LC84(%rip), %xmm7
	movq	%rcx, %rdx
	movq	%rax, %rsi
	vmovdqa	.LC85(%rip), %xmm6
	vmovdqa	.LC2(%rip), %xmm0
	vmovdqa	.LC82(%rip), %xmm5
	movq	64(%rsp), %rbx
	leaq	(%rax,%rbx), %r10
	movl	%r11d, %ebx
	vpmovzxbw	%xmm8, %xmm12
	vpmovzxbw	%xmm7, %xmm11
	vpsrldq	$8, %xmm8, %xmm8
	vpsrldq	$8, %xmm7, %xmm7
	vpmovzxbw	%xmm6, %xmm10
	vpmovzxbw	%xmm8, %xmm8
	vpsrldq	$8, %xmm6, %xmm6
	vpmovzxbw	%xmm7, %xmm7
	vpmovzxbw	%xmm6, %xmm6
	.p2align 4
	.p2align 3
.L1069:
	vmovdqu	(%rdx), %xmm4
	vmovdqu	32(%rdx), %xmm2
	addq	$16, %rsi
	addq	$48, %rdx
	vpshufb	%xmm5, %xmm4, %xmm3
	vmovdqu	-32(%rdx), %xmm4
	vpshufb	%xmm5, %xmm2, %xmm2
	vpshufb	%xmm5, %xmm4, %xmm4
	vpalignr	$11, %xmm3, %xmm4, %xmm1
	vpalignr	$11, %xmm2, %xmm3, %xmm3
	vpalignr	$11, %xmm4, %xmm2, %xmm4
	vpalignr	$11, %xmm4, %xmm1, %xmm2
	vpalignr	$11, %xmm3, %xmm4, %xmm4
	vpalignr	$11, %xmm1, %xmm3, %xmm1
	vpalignr	$5, %xmm2, %xmm2, %xmm2
	vpalignr	$10, %xmm1, %xmm1, %xmm1
	vpmovzxbw	%xmm2, %xmm9
	vpmovzxbw	%xmm1, %xmm3
	vpsrldq	$8, %xmm2, %xmm2
	vpsrldq	$8, %xmm1, %xmm1
	vpmullw	%xmm11, %xmm9, %xmm9
	vpmovzxbw	%xmm1, %xmm1
	vpmovzxbw	%xmm2, %xmm2
	vpmullw	%xmm12, %xmm3, %xmm3
	vpmullw	%xmm8, %xmm1, %xmm1
	vpaddw	%xmm9, %xmm3, %xmm3
	vpmovzxbw	%xmm4, %xmm9
	vpsrldq	$8, %xmm4, %xmm4
	vpmovzxbw	%xmm4, %xmm4
	vpmullw	%xmm7, %xmm2, %xmm2
	vpmullw	%xmm10, %xmm9, %xmm9
	vpaddw	%xmm2, %xmm1, %xmm1
	vpmullw	%xmm6, %xmm4, %xmm4
	vpaddw	%xmm9, %xmm3, %xmm3
	vpsrlw	$8, %xmm3, %xmm3
	vpand	%xmm3, %xmm0, %xmm3
	vpaddw	%xmm4, %xmm1, %xmm1
	vpsrlw	$8, %xmm1, %xmm1
	vpand	%xmm1, %xmm0, %xmm1
	vpackuswb	%xmm1, %xmm3, %xmm3
	vmovdqu	%xmm3, -16(%rsi)
	cmpq	%rsi, %r10
	jne	.L1069
	addq	40(%rsp), %rcx
	movl	%ebx, (%rsp)
	addq	48(%rsp), %rax
	movl	12(%rsp), %edx
	cmpl	%edx, 16(%rsp)
	je	.L1044
	movl	20(%rsp), %edx
.L1068:
	movzbl	(%rcx), %esi
	movzbl	1(%rcx), %r10d
	imull	$77, %esi, %esi
	imull	$150, %r10d, %r10d
	addl	%r10d, %esi
	movzbl	2(%rcx), %r10d
	imull	$29, %r10d, %r10d
	addl	%r10d, %esi
	movl	%esi, %ebx
	movb	%bh, (%rax)
	testl	%edx, %edx
	je	.L1044
	movzbl	3(%rcx), %esi
	movzbl	4(%rcx), %r10d
	imull	$77, %esi, %esi
	imull	$150, %r10d, %r10d
	addl	%r10d, %esi
	movzbl	5(%rcx), %r10d
	imull	$29, %r10d, %r10d
	addl	%r10d, %esi
	movl	%esi, %ebx
	movb	%bh, 1(%rax)
	cmpl	$1, %edx
	je	.L1044
	movzbl	6(%rcx), %esi
	movzbl	7(%rcx), %r10d
	imull	$77, %esi, %esi
	imull	$150, %r10d, %r10d
	addl	%r10d, %esi
	movzbl	8(%rcx), %r10d
	imull	$29, %r10d, %r10d
	addl	%r10d, %esi
	movl	%esi, %ebx
	movb	%bh, 2(%rax)
	cmpl	$2, %edx
	je	.L1044
	movzbl	9(%rcx), %esi
	movzbl	10(%rcx), %r10d
	imull	$77, %esi, %esi
	imull	$150, %r10d, %r10d
	addl	%r10d, %esi
	movzbl	11(%rcx), %r10d
	imull	$29, %r10d, %r10d
	addl	%r10d, %esi
	movl	%esi, %ebx
	movb	%bh, 3(%rax)
	cmpl	$3, %edx
	je	.L1044
	movzbl	12(%rcx), %esi
	movzbl	13(%rcx), %r10d
	imull	$77, %esi, %esi
	imull	$150, %r10d, %r10d
	addl	%r10d, %esi
	movzbl	14(%rcx), %r10d
	imull	$29, %r10d, %r10d
	addl	%r10d, %esi
	movl	%esi, %ebx
	movb	%bh, 4(%rax)
	cmpl	$4, %edx
	je	.L1044
	movzbl	15(%rcx), %esi
	movzbl	16(%rcx), %r10d
	imull	$77, %esi, %esi
	imull	$150, %r10d, %r10d
	addl	%r10d, %esi
	movzbl	17(%rcx), %r10d
	imull	$29, %r10d, %r10d
	addl	%r10d, %esi
	movl	%esi, %ebx
	movb	%bh, 5(%rax)
	cmpl	$5, %edx
	je	.L1044
	movzbl	18(%rcx), %esi
	movzbl	19(%rcx), %r10d
	imull	$77, %esi, %esi
	imull	$150, %r10d, %r10d
	addl	%r10d, %esi
	movzbl	20(%rcx), %r10d
	imull	$29, %r10d, %r10d
	addl	%r10d, %esi
	movl	%esi, %ebx
	movb	%bh, 6(%rax)
	cmpl	$6, %edx
	je	.L1044
	movzbl	21(%rcx), %esi
	movzbl	22(%rcx), %r10d
	imull	$77, %esi, %esi
	imull	$150, %r10d, %r10d
	addl	%r10d, %esi
	movzbl	23(%rcx), %r10d
	imull	$29, %r10d, %r10d
	addl	%r10d, %esi
	movl	%esi, %ebx
	movb	%bh, 7(%rax)
	cmpl	$7, %edx
	je	.L1044
	movzbl	24(%rcx), %esi
	movzbl	25(%rcx), %r10d
	imull	$77, %esi, %esi
	imull	$150, %r10d, %r10d
	addl	%r10d, %esi
	movzbl	26(%rcx), %r10d
	imull	$29, %r10d, %r10d
	addl	%r10d, %esi
	movl	%esi, %ebx
	movb	%bh, 8(%rax)
	cmpl	$8, %edx
	je	.L1044
	movzbl	27(%rcx), %esi
	movzbl	28(%rcx), %r10d
	imull	$77, %esi, %esi
	imull	$150, %r10d, %r10d
	addl	%r10d, %esi
	movzbl	29(%rcx), %r10d
	imull	$29, %r10d, %r10d
	addl	%r10d, %esi
	movl	%esi, %ebx
	movb	%bh, 9(%rax)
	cmpl	$9, %edx
	je	.L1044
	movzbl	30(%rcx), %esi
	movzbl	31(%rcx), %r10d
	imull	$77, %esi, %esi
	imull	$150, %r10d, %r10d
	addl	%r10d, %esi
	movzbl	32(%rcx), %r10d
	imull	$29, %r10d, %r10d
	addl	%r10d, %esi
	movl	%esi, %ebx
	movb	%bh, 10(%rax)
	cmpl	$10, %edx
	je	.L1044
	movzbl	33(%rcx), %esi
	movzbl	34(%rcx), %r10d
	imull	$77, %esi, %esi
	imull	$150, %r10d, %r10d
	addl	%r10d, %esi
	movzbl	35(%rcx), %r10d
	imull	$29, %r10d, %r10d
	addl	%r10d, %esi
	movl	%esi, %ebx
	movb	%bh, 11(%rax)
	cmpl	$11, %edx
	je	.L1044
	movzbl	36(%rcx), %esi
	movzbl	37(%rcx), %r10d
	imull	$77, %esi, %esi
	imull	$150, %r10d, %r10d
	addl	%r10d, %esi
	movzbl	38(%rcx), %r10d
	imull	$29, %r10d, %r10d
	addl	%r10d, %esi
	movl	%esi, %ebx
	movb	%bh, 12(%rax)
	cmpl	$12, %edx
	je	.L1044
	movzbl	39(%rcx), %esi
	movzbl	40(%rcx), %r10d
	imull	$77, %esi, %esi
	imull	$150, %r10d, %r10d
	addl	%r10d, %esi
	movzbl	41(%rcx), %r10d
	imull	$29, %r10d, %r10d
	addl	%r10d, %esi
	movl	%esi, %ebx
	movb	%bh, 13(%rax)
	cmpl	$13, %edx
	je	.L1044
	movzbl	42(%rcx), %esi
	movzbl	43(%rcx), %edx
	movzbl	44(%rcx), %ecx
	imull	$77, %esi, %esi
	imull	$150, %edx, %edx
	imull	$29, %ecx, %ecx
	addl	%esi, %edx
	addl	%ecx, %edx
	movb	%dh, 14(%rax)
	jmp	.L1044
	.p2align 4
	.p2align 3
.L1038:
	movl	(%rsp), %r11d
	testl	%r11d, %r11d
	js	.L1044
	cmpb	$0, 34(%rsp)
	jne	.L1092
	vmovdqa	.LC2(%rip), %xmm0
	movq	104(%rsp), %rbx
	movq	%rcx, %rsi
	movq	%rax, %rdx
	leaq	32(%rcx,%rbx), %r10
	movl	%r11d, %ebx
	.p2align 4
	.p2align 3
.L1059:
	vpand	16(%rsi), %xmm0, %xmm2
	vpand	(%rsi), %xmm0, %xmm1
	addq	$32, %rsi
	addq	$64, %rdx
	vmovdqu	-32(%rsi), %xmm7
	vmovdqu	-16(%rsi), %xmm6
	vpackuswb	%xmm2, %xmm1, %xmm1
	vpsrlw	$8, %xmm6, %xmm3
	vpsrlw	$8, %xmm7, %xmm2
	vpackuswb	%xmm3, %xmm2, %xmm2
	vpunpcklbw	%xmm1, %xmm1, %xmm4
	vpunpcklbw	%xmm2, %xmm1, %xmm5
	vpunpckhbw	%xmm1, %xmm1, %xmm3
	vpunpckhbw	%xmm2, %xmm1, %xmm1
	vpunpcklbw	%xmm5, %xmm4, %xmm2
	vpunpckhbw	%xmm5, %xmm4, %xmm4
	vmovdqu	%xmm2, -64(%rdx)
	vpunpcklbw	%xmm1, %xmm3, %xmm2
	vpunpckhbw	%xmm1, %xmm3, %xmm3
	vmovdqu	%xmm4, -48(%rdx)
	vmovdqu	%xmm2, -32(%rdx)
	vmovdqu	%xmm3, -16(%rdx)
	cmpq	%rsi, %r10
	jne	.L1059
	movl	%ebx, (%rsp)
	addq	24(%rsp), %rcx
	addq	56(%rsp), %rax
	movl	12(%rsp), %edx
	cmpl	%edx, 16(%rsp)
	je	.L1044
	movl	20(%rsp), %edx
.L1058:
	movzbl	(%rcx), %esi
	movb	%sil, 2(%rax)
	movb	%sil, 1(%rax)
	movb	%sil, (%rax)
	movzbl	1(%rcx), %esi
	movb	%sil, 3(%rax)
	testl	%edx, %edx
	je	.L1044
	movzbl	2(%rcx), %esi
	movb	%sil, 6(%rax)
	movb	%sil, 5(%rax)
	movb	%sil, 4(%rax)
	movzbl	3(%rcx), %esi
	movb	%sil, 7(%rax)
	cmpl	$1, %edx
	je	.L1044
	movzbl	4(%rcx), %esi
	movb	%sil, 10(%rax)
	movb	%sil, 9(%rax)
	movb	%sil, 8(%rax)
	movzbl	5(%rcx), %esi
	movb	%sil, 11(%rax)
	cmpl	$2, %edx
	je	.L1044
	movzbl	6(%rcx), %esi
	movb	%sil, 14(%rax)
	movb	%sil, 13(%rax)
	movb	%sil, 12(%rax)
	movzbl	7(%rcx), %esi
	movb	%sil, 15(%rax)
	cmpl	$3, %edx
	je	.L1044
	movzbl	8(%rcx), %esi
	movb	%sil, 18(%rax)
	movb	%sil, 17(%rax)
	movb	%sil, 16(%rax)
	movzbl	9(%rcx), %esi
	movb	%sil, 19(%rax)
	cmpl	$4, %edx
	je	.L1044
	movzbl	10(%rcx), %esi
	movb	%sil, 22(%rax)
	movb	%sil, 21(%rax)
	movb	%sil, 20(%rax)
	movzbl	11(%rcx), %esi
	movb	%sil, 23(%rax)
	cmpl	$5, %edx
	je	.L1044
	movzbl	12(%rcx), %esi
	movb	%sil, 26(%rax)
	movb	%sil, 25(%rax)
	movb	%sil, 24(%rax)
	movzbl	13(%rcx), %esi
	movb	%sil, 27(%rax)
	cmpl	$6, %edx
	je	.L1044
	movzbl	14(%rcx), %esi
	movb	%sil, 30(%rax)
	movb	%sil, 29(%rax)
	movb	%sil, 28(%rax)
	movzbl	15(%rcx), %esi
	movb	%sil, 31(%rax)
	cmpl	$7, %edx
	je	.L1044
	movzbl	16(%rcx), %esi
	movb	%sil, 34(%rax)
	movb	%sil, 33(%rax)
	movb	%sil, 32(%rax)
	movzbl	17(%rcx), %esi
	movb	%sil, 35(%rax)
	cmpl	$8, %edx
	je	.L1044
	movzbl	18(%rcx), %esi
	movb	%sil, 38(%rax)
	movb	%sil, 37(%rax)
	movb	%sil, 36(%rax)
	movzbl	19(%rcx), %esi
	movb	%sil, 39(%rax)
	cmpl	$9, %edx
	je	.L1044
	movzbl	20(%rcx), %esi
	movb	%sil, 42(%rax)
	movb	%sil, 41(%rax)
	movb	%sil, 40(%rax)
	movzbl	21(%rcx), %esi
	movb	%sil, 43(%rax)
	cmpl	$10, %edx
	je	.L1044
	movzbl	22(%rcx), %esi
	movb	%sil, 46(%rax)
	movb	%sil, 45(%rax)
	movb	%sil, 44(%rax)
	movzbl	23(%rcx), %esi
	movb	%sil, 47(%rax)
	cmpl	$11, %edx
	je	.L1044
	movzbl	24(%rcx), %esi
	movb	%sil, 50(%rax)
	movb	%sil, 49(%rax)
	movb	%sil, 48(%rax)
	movzbl	25(%rcx), %esi
	movb	%sil, 51(%rax)
	cmpl	$12, %edx
	je	.L1044
	movzbl	26(%rcx), %esi
	movb	%sil, 54(%rax)
	movb	%sil, 53(%rax)
	movb	%sil, 52(%rax)
	movzbl	27(%rcx), %esi
	movb	%sil, 55(%rax)
	cmpl	$13, %edx
	je	.L1044
	movzbl	28(%rcx), %edx
	movb	%dl, 58(%rax)
	movb	%dl, 57(%rax)
	movb	%dl, 56(%rax)
	movzbl	29(%rcx), %edx
	movb	%dl, 59(%rax)
	jmp	.L1044
	.p2align 4
	.p2align 3
.L1039:
	movl	(%rsp), %ebx
	testl	%ebx, %ebx
	js	.L1044
	cmpb	$0, 35(%rsp)
	jne	.L1091
	vmovdqa	.LC79(%rip), %xmm4
	vmovdqa	.LC80(%rip), %xmm3
	movq	%rcx, %rsi
	movq	%rax, %rdx
	vmovdqa	.LC81(%rip), %xmm2
	movq	152(%rsp), %r10
	salq	$5, %r10
	addq	%rcx, %r10
	.p2align 4
	.p2align 3
.L1057:
	vmovdqu	(%rsi), %xmm6
	vmovdqu	16(%rsi), %xmm1
	addq	$32, %rsi
	addq	$48, %rdx
	vpshufb	%xmm4, %xmm6, %xmm0
	vmovdqu	%xmm0, -48(%rdx)
	vpalignr	$10, -32(%rsi), %xmm1, %xmm0
	vpshufb	%xmm2, %xmm1, %xmm1
	vpshufb	%xmm3, %xmm0, %xmm0
	vmovdqu	%xmm0, -32(%rdx)
	vmovdqu	%xmm1, -16(%rdx)
	cmpq	%rsi, %r10
	jne	.L1057
	movl	%ebx, (%rsp)
	addq	112(%rsp), %rcx
	addq	120(%rsp), %rax
	movl	36(%rsp), %edx
.L1056:
	movzbl	(%rcx), %esi
	movb	%sil, 2(%rax)
	movb	%sil, 1(%rax)
	movb	%sil, (%rax)
	testl	%edx, %edx
	je	.L1044
	movzbl	2(%rcx), %esi
	movb	%sil, 5(%rax)
	movb	%sil, 4(%rax)
	movb	%sil, 3(%rax)
	cmpl	$1, %edx
	je	.L1044
	movzbl	4(%rcx), %esi
	movb	%sil, 8(%rax)
	movb	%sil, 7(%rax)
	movb	%sil, 6(%rax)
	cmpl	$2, %edx
	je	.L1044
	movzbl	6(%rcx), %esi
	movb	%sil, 11(%rax)
	movb	%sil, 10(%rax)
	movb	%sil, 9(%rax)
	cmpl	$3, %edx
	je	.L1044
	movzbl	8(%rcx), %esi
	movb	%sil, 14(%rax)
	movb	%sil, 13(%rax)
	movb	%sil, 12(%rax)
	cmpl	$4, %edx
	je	.L1044
	movzbl	10(%rcx), %esi
	movb	%sil, 17(%rax)
	movb	%sil, 16(%rax)
	movb	%sil, 15(%rax)
	cmpl	$5, %edx
	je	.L1044
	movzbl	12(%rcx), %esi
	movb	%sil, 20(%rax)
	movb	%sil, 19(%rax)
	movb	%sil, 18(%rax)
	cmpl	$6, %edx
	je	.L1044
	movzbl	14(%rcx), %esi
	movb	%sil, 23(%rax)
	movb	%sil, 22(%rax)
	movb	%sil, 21(%rax)
	cmpl	$7, %edx
	je	.L1044
	movzbl	16(%rcx), %esi
	movb	%sil, 26(%rax)
	movb	%sil, 25(%rax)
	movb	%sil, 24(%rax)
	cmpl	$8, %edx
	je	.L1044
	movzbl	18(%rcx), %esi
	movb	%sil, 29(%rax)
	movb	%sil, 28(%rax)
	movb	%sil, 27(%rax)
	cmpl	$9, %edx
	je	.L1044
	movzbl	20(%rcx), %esi
	movb	%sil, 32(%rax)
	movb	%sil, 31(%rax)
	movb	%sil, 30(%rax)
	cmpl	$10, %edx
	je	.L1044
	movzbl	22(%rcx), %esi
	movb	%sil, 35(%rax)
	movb	%sil, 34(%rax)
	movb	%sil, 33(%rax)
	cmpl	$11, %edx
	je	.L1044
	movzbl	24(%rcx), %esi
	movb	%sil, 38(%rax)
	movb	%sil, 37(%rax)
	movb	%sil, 36(%rax)
	cmpl	$12, %edx
	je	.L1044
	movzbl	26(%rcx), %esi
	movb	%sil, 41(%rax)
	movb	%sil, 40(%rax)
	movb	%sil, 39(%rax)
	cmpl	$13, %edx
	je	.L1044
	movzbl	28(%rcx), %esi
	movb	%sil, 44(%rax)
	movb	%sil, 43(%rax)
	movb	%sil, 42(%rax)
	cmpl	$14, %edx
	je	.L1044
	movzbl	30(%rcx), %edx
	movb	%dl, 47(%rax)
	movb	%dl, 46(%rax)
	movb	%dl, 45(%rax)
	jmp	.L1044
	.p2align 4
	.p2align 3
.L1040:
	movl	(%rsp), %ebx
	testl	%ebx, %ebx
	js	.L1044
	cmpb	$0, 35(%rsp)
	jne	.L1090
	vmovdqa	.LC2(%rip), %xmm0
	movq	144(%rsp), %rsi
	xorl	%edx, %edx
	.p2align 4
	.p2align 3
.L1055:
	vpand	(%rcx,%rdx,2), %xmm0, %xmm1
	vpand	16(%rcx,%rdx,2), %xmm0, %xmm2
	vpackuswb	%xmm2, %xmm1, %xmm1
	vmovdqu	%xmm1, (%rax,%rdx)
	addq	$16, %rdx
	cmpq	%rdx, %rsi
	jne	.L1055
	addq	112(%rsp), %rcx
	addq	72(%rsp), %rax
	movl	%ebx, (%rsp)
	movl	36(%rsp), %edx
.L1054:
	movzbl	(%rcx), %esi
	movb	%sil, (%rax)
	testl	%edx, %edx
	je	.L1044
	movzbl	2(%rcx), %esi
	movb	%sil, 1(%rax)
	cmpl	$1, %edx
	je	.L1044
	movzbl	4(%rcx), %esi
	movb	%sil, 2(%rax)
	cmpl	$2, %edx
	je	.L1044
	movzbl	6(%rcx), %esi
	movb	%sil, 3(%rax)
	cmpl	$3, %edx
	je	.L1044
	movzbl	8(%rcx), %esi
	movb	%sil, 4(%rax)
	cmpl	$4, %edx
	je	.L1044
	movzbl	10(%rcx), %esi
	movb	%sil, 5(%rax)
	cmpl	$5, %edx
	je	.L1044
	movzbl	12(%rcx), %esi
	movb	%sil, 6(%rax)
	cmpl	$6, %edx
	je	.L1044
	movzbl	14(%rcx), %esi
	movb	%sil, 7(%rax)
	cmpl	$7, %edx
	je	.L1044
	movzbl	16(%rcx), %esi
	movb	%sil, 8(%rax)
	cmpl	$8, %edx
	je	.L1044
	movzbl	18(%rcx), %esi
	movb	%sil, 9(%rax)
	cmpl	$9, %edx
	je	.L1044
	movzbl	20(%rcx), %esi
	movb	%sil, 10(%rax)
	cmpl	$10, %edx
	je	.L1044
	movzbl	22(%rcx), %esi
	movb	%sil, 11(%rax)
	cmpl	$11, %edx
	je	.L1044
	movzbl	24(%rcx), %esi
	movb	%sil, 12(%rax)
	cmpl	$12, %edx
	je	.L1044
	movzbl	26(%rcx), %esi
	movb	%sil, 13(%rax)
	cmpl	$13, %edx
	je	.L1044
	movzbl	28(%rcx), %esi
	movb	%sil, 14(%rax)
	cmpl	$14, %edx
	je	.L1044
	movzbl	30(%rcx), %edx
	movb	%dl, 15(%rax)
	jmp	.L1044
	.p2align 4
	.p2align 3
.L1041:
	movl	(%rsp), %ebx
	testl	%ebx, %ebx
	js	.L1044
	movq	%rcx, %rdx
	.p2align 4
	.p2align 3
.L1053:
	movzbl	(%rdx), %esi
	incq	%rdx
	movb	$-1, 3(%rax)
	addq	$4, %rax
	movb	%sil, -2(%rax)
	movb	%sil, -3(%rax)
	movb	%sil, -4(%rax)
	movl	%ecx, %esi
	subl	%edx, %esi
	addl	%ebx, %esi
	jns	.L1053
	movl	%ebx, (%rsp)
	jmp	.L1044
	.p2align 4
	.p2align 3
.L1042:
	movl	(%rsp), %r11d
	testl	%r11d, %r11d
	js	.L1044
	cmpb	$0, 34(%rsp)
	jne	.L1089
	vmovdqa	.LC70(%rip), %xmm9
	vmovdqa	.LC71(%rip), %xmm8
	movq	%rax, %rdx
	movq	%rcx, %rsi
	vmovdqa	.LC72(%rip), %xmm7
	vmovdqa	.LC73(%rip), %xmm6
	vmovdqa	.LC74(%rip), %xmm5
	vmovdqa	.LC75(%rip), %xmm4
	vmovdqa	.LC76(%rip), %xmm3
	vmovdqa	.LC77(%rip), %xmm2
	vmovdqa	.LC78(%rip), %xmm1
	movq	64(%rsp), %rbx
	leaq	(%rcx,%rbx), %r10
	movl	%r11d, %ebx
	.p2align 4
	.p2align 3
.L1050:
	vmovdqu	(%rsi), %xmm0
	addq	$16, %rsi
	addq	$48, %rdx
	vpshufb	%xmm8, %xmm0, %xmm11
	vpshufb	%xmm9, %xmm0, %xmm10
	vpblendvb	%xmm7, %xmm11, %xmm10, %xmm10
	vpshufb	%xmm5, %xmm0, %xmm11
	vmovdqu	%xmm10, -48(%rdx)
	vpshufb	%xmm6, %xmm0, %xmm10
	vpblendvb	%xmm4, %xmm11, %xmm10, %xmm10
	vmovdqu	%xmm10, -32(%rdx)
	vpshufb	%xmm3, %xmm0, %xmm10
	vpshufb	%xmm2, %xmm0, %xmm0
	vpshufb	%xmm1, %xmm10, %xmm10
	vpor	%xmm10, %xmm0, %xmm0
	vmovdqu	%xmm0, -16(%rdx)
	cmpq	%rsi, %r10
	jne	.L1050
	addq	48(%rsp), %rcx
	movl	%ebx, (%rsp)
	addq	40(%rsp), %rax
	movl	12(%rsp), %edx
	cmpl	%edx, 16(%rsp)
	je	.L1044
	movl	20(%rsp), %edx
.L1049:
	movzbl	(%rcx), %esi
	movb	%sil, 2(%rax)
	movb	%sil, 1(%rax)
	movb	%sil, (%rax)
	testl	%edx, %edx
	je	.L1044
	movzbl	1(%rcx), %esi
	movb	%sil, 5(%rax)
	movb	%sil, 4(%rax)
	movb	%sil, 3(%rax)
	cmpl	$1, %edx
	je	.L1044
	movzbl	2(%rcx), %esi
	movb	%sil, 8(%rax)
	movb	%sil, 7(%rax)
	movb	%sil, 6(%rax)
	cmpl	$2, %edx
	je	.L1044
	movzbl	3(%rcx), %esi
	movb	%sil, 11(%rax)
	movb	%sil, 10(%rax)
	movb	%sil, 9(%rax)
	cmpl	$3, %edx
	je	.L1044
	movzbl	4(%rcx), %esi
	movb	%sil, 14(%rax)
	movb	%sil, 13(%rax)
	movb	%sil, 12(%rax)
	cmpl	$4, %edx
	je	.L1044
	movzbl	5(%rcx), %esi
	movb	%sil, 17(%rax)
	movb	%sil, 16(%rax)
	movb	%sil, 15(%rax)
	cmpl	$5, %edx
	je	.L1044
	movzbl	6(%rcx), %esi
	movb	%sil, 20(%rax)
	movb	%sil, 19(%rax)
	movb	%sil, 18(%rax)
	cmpl	$6, %edx
	je	.L1044
	movzbl	7(%rcx), %esi
	movb	%sil, 23(%rax)
	movb	%sil, 22(%rax)
	movb	%sil, 21(%rax)
	cmpl	$7, %edx
	je	.L1044
	movzbl	8(%rcx), %esi
	movb	%sil, 26(%rax)
	movb	%sil, 25(%rax)
	movb	%sil, 24(%rax)
	cmpl	$8, %edx
	je	.L1044
	movzbl	9(%rcx), %esi
	movb	%sil, 29(%rax)
	movb	%sil, 28(%rax)
	movb	%sil, 27(%rax)
	cmpl	$9, %edx
	je	.L1044
	movzbl	10(%rcx), %esi
	movb	%sil, 32(%rax)
	movb	%sil, 31(%rax)
	movb	%sil, 30(%rax)
	cmpl	$10, %edx
	je	.L1044
	movzbl	11(%rcx), %esi
	movb	%sil, 35(%rax)
	movb	%sil, 34(%rax)
	movb	%sil, 33(%rax)
	cmpl	$11, %edx
	je	.L1044
	movzbl	12(%rcx), %esi
	movb	%sil, 38(%rax)
	movb	%sil, 37(%rax)
	movb	%sil, 36(%rax)
	cmpl	$12, %edx
	je	.L1044
	movzbl	13(%rcx), %esi
	movb	%sil, 41(%rax)
	movb	%sil, 40(%rax)
	movb	%sil, 39(%rax)
	cmpl	$13, %edx
	je	.L1044
	movzbl	14(%rcx), %edx
	movb	%dl, 44(%rax)
	movb	%dl, 43(%rax)
	movb	%dl, 42(%rax)
	jmp	.L1044
	.p2align 4
	.p2align 3
.L1043:
	movl	(%rsp), %ebx
	testl	%ebx, %ebx
	js	.L1044
	cmpb	$0, 34(%rsp)
	jne	.L1088
	movq	64(%rsp), %rsi
	xorl	%edx, %edx
	vpcmpeqd	%xmm1, %xmm1, %xmm1
	.p2align 4
	.p2align 3
.L1046:
	vmovdqu	(%rcx,%rdx), %xmm0
	vpunpcklbw	%xmm1, %xmm0, %xmm2
	vpunpckhbw	%xmm1, %xmm0, %xmm0
	vmovdqu	%xmm2, (%rax,%rdx,2)
	vmovdqu	%xmm0, 16(%rax,%rdx,2)
	addq	$16, %rdx
	cmpq	%rdx, %rsi
	jne	.L1046
	addq	48(%rsp), %rcx
	addq	24(%rsp), %rax
	movl	%ebx, (%rsp)
	movl	12(%rsp), %edx
	cmpl	%edx, 16(%rsp)
	je	.L1044
	movl	20(%rsp), %edx
.L1045:
	movzbl	(%rcx), %esi
	movb	$-1, 1(%rax)
	movb	%sil, (%rax)
	testl	%edx, %edx
	je	.L1044
	movzbl	1(%rcx), %esi
	movb	$-1, 3(%rax)
	movb	%sil, 2(%rax)
	cmpl	$1, %edx
	je	.L1044
	movzbl	2(%rcx), %esi
	movb	$-1, 5(%rax)
	movb	%sil, 4(%rax)
	cmpl	$2, %edx
	je	.L1044
	movzbl	3(%rcx), %esi
	movb	$-1, 7(%rax)
	movb	%sil, 6(%rax)
	cmpl	$3, %edx
	je	.L1044
	movzbl	4(%rcx), %esi
	movb	$-1, 9(%rax)
	movb	%sil, 8(%rax)
	cmpl	$4, %edx
	je	.L1044
	movzbl	5(%rcx), %esi
	movb	$-1, 11(%rax)
	movb	%sil, 10(%rax)
	cmpl	$5, %edx
	je	.L1044
	movzbl	6(%rcx), %esi
	movb	$-1, 13(%rax)
	movb	%sil, 12(%rax)
	cmpl	$6, %edx
	je	.L1044
	movzbl	7(%rcx), %esi
	movb	$-1, 15(%rax)
	movb	%sil, 14(%rax)
	cmpl	$7, %edx
	je	.L1044
	movzbl	8(%rcx), %esi
	movb	$-1, 17(%rax)
	movb	%sil, 16(%rax)
	cmpl	$8, %edx
	je	.L1044
	movzbl	9(%rcx), %esi
	movb	$-1, 19(%rax)
	movb	%sil, 18(%rax)
	cmpl	$9, %edx
	je	.L1044
	movzbl	10(%rcx), %esi
	movb	$-1, 21(%rax)
	movb	%sil, 20(%rax)
	cmpl	$10, %edx
	je	.L1044
	movzbl	11(%rcx), %esi
	movb	$-1, 23(%rax)
	movb	%sil, 22(%rax)
	cmpl	$11, %edx
	je	.L1044
	movzbl	12(%rcx), %esi
	movb	$-1, 25(%rax)
	movb	%sil, 24(%rax)
	cmpl	$12, %edx
	je	.L1044
	movzbl	13(%rcx), %esi
	movb	$-1, 27(%rax)
	movb	%sil, 26(%rax)
	cmpl	$13, %edx
	je	.L1044
	movzbl	14(%rcx), %edx
	movb	$-1, 29(%rax)
	movb	%dl, 28(%rax)
	jmp	.L1044
.L1088:
	movl	%ebx, %edx
	jmp	.L1045
.L1097:
	movl	%r11d, %edx
	jmp	.L1078
.L1098:
	movl	%r11d, %edx
	jmp	.L1082
.L1089:
	movl	%r11d, %edx
	jmp	.L1049
.L1090:
	movl	%ebx, %edx
	jmp	.L1054
.L1091:
	movl	%ebx, %edx
	jmp	.L1056
.L1092:
	movl	%r11d, %edx
	jmp	.L1058
.L1094:
	movl	%r11d, %edx
	jmp	.L1068
.L1095:
	movl	%r11d, %edx
	jmp	.L1072
.L1093:
	movl	(%rsp), %r13d
	movl	12(%rsp), %ebx
	xorl	%esi, %esi
	jmp	.L1062
.L1096:
	movl	%r11d, %edx
	jmp	.L1076
	.p2align 4
	.p2align 3
.L1030:
	leaq	__PRETTY_FUNCTION__.43(%rip), %rcx
	movl	$1770, %edx
	leaq	.LC14(%rip), %rsi
	leaq	.LC9(%rip), %rdi
	call	__assert_fail@PLT
.L1573:
	leaq	__PRETTY_FUNCTION__.43(%rip), %rcx
	movl	$1741, %edx
	leaq	.LC14(%rip), %rsi
	leaq	.LC15(%rip), %rdi
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
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	leaq	57(%rdi), %rax
	movl	%ecx, %r15d
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movslq	%edx, %r14
	movq	%rsi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	xorl	%ebp, %ebp
	movq	%rdi, %rbx
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	leaq	56(%rdi), %r13
	movq	%rax, (%rsp)
	jmp	.L1587
	.p2align 4
	.p2align 3
.L1575:
	movl	48(%rbx), %ecx
	xorl	%r8d, %r8d
	testl	%ecx, %ecx
	jne	.L1593
.L1576:
	movb	%r8b, 2(%r12,%rbp,4)
	movq	192(%rbx), %rax
	cmpq	200(%rbx), %rax
	jb	.L1594
	movl	48(%rbx), %edx
	xorl	%r8d, %r8d
	testl	%edx, %edx
	jne	.L1595
.L1580:
	movb	%r8b, 1(%r12,%rbp,4)
	movq	192(%rbx), %rax
	cmpq	200(%rbx), %rax
	jb	.L1596
	movl	48(%rbx), %eax
	xorl	%r8d, %r8d
	testl	%eax, %eax
	jne	.L1597
.L1584:
	cmpl	%ebp, %r15d
	movb	%r8b, (%r12,%rbp,4)
	setne	%al
	negl	%eax
	movb	%al, 3(%r12,%rbp,4)
	incq	%rbp
	cmpq	%rbp, %r14
	je	.L1598
.L1587:
	movq	192(%rbx), %rax
	cmpq	200(%rbx), %rax
	jnb	.L1575
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rbx)
	movzbl	(%rax), %r8d
	jmp	.L1576
	.p2align 4
	.p2align 3
.L1596:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rbx)
	movzbl	(%rax), %r8d
	jmp	.L1584
	.p2align 4
	.p2align 3
.L1594:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rbx)
	movzbl	(%rax), %r8d
	jmp	.L1580
	.p2align 4
	.p2align 3
.L1595:
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movb	%r8b, 15(%rsp)
	movq	%r13, %rsi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	testl	%eax, %eax
	jne	.L1581
	movq	(%rsp), %rax
	movzbl	15(%rsp), %r8d
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
.L1582:
	vmovq	(%rsp), %xmm2
	vpinsrq	$1, %rax, %xmm2, %xmm0
	vmovdqu	%xmm0, 192(%rbx)
	jmp	.L1580
	.p2align 4
	.p2align 3
.L1593:
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movb	%r8b, 15(%rsp)
	movq	%r13, %rsi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	testl	%eax, %eax
	jne	.L1577
	movq	(%rsp), %rax
	movzbl	15(%rsp), %r8d
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
.L1578:
	vmovq	(%rsp), %xmm1
	vpinsrq	$1, %rax, %xmm1, %xmm0
	vmovdqu	%xmm0, 192(%rbx)
	jmp	.L1576
	.p2align 4
	.p2align 3
.L1597:
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movb	%r8b, 15(%rsp)
	movq	%r13, %rsi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	testl	%eax, %eax
	jne	.L1585
	movq	(%rsp), %rax
	movzbl	15(%rsp), %r8d
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
.L1586:
	vmovq	(%rsp), %xmm3
	vpinsrq	$1, %rax, %xmm3, %xmm0
	vmovdqu	%xmm0, 192(%rbx)
	jmp	.L1584
	.p2align 4
	.p2align 3
.L1598:
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
	.p2align 4
	.p2align 3
.L1581:
	.cfi_restore_state
	cltq
	movzbl	56(%rbx), %r8d
	addq	%r13, %rax
	jmp	.L1582
	.p2align 4
	.p2align 3
.L1577:
	cltq
	movzbl	56(%rbx), %r8d
	addq	%r13, %rax
	jmp	.L1578
	.p2align 4
	.p2align 3
.L1585:
	cltq
	movzbl	56(%rbx), %r8d
	addq	%r13, %rax
	jmp	.L1586
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
	.p2align 4
	.p2align 3
.L1600:
	leaq	56(%rbx), %r13
.L1601:
	cmpq	$0, 16(%rbx)
	je	.L1650
	movq	40(%rbx), %rdi
	call	*32(%rbx)
	testl	%eax, %eax
	je	.L1610
	movl	48(%rbx), %esi
	testl	%esi, %esi
	je	.L1615
	movq	192(%rbx), %rcx
	movq	%rcx, %rdx
	cmpq	200(%rbx), %rcx
	jnb	.L1651
.L1608:
	movzbl	0(%rbp), %eax
	cmpb	$9, %al
	je	.L1633
	cmpb	$32, %al
	je	.L1633
	subl	$10, %eax
	cmpb	$3, %al
	jbe	.L1652
.L1615:
	cmpq	$0, 16(%rbx)
	je	.L1613
.L1612:
	movq	40(%rbx), %rdi
	call	*32(%rbx)
	testl	%eax, %eax
	je	.L1617
	movl	48(%rbx), %ecx
	testl	%ecx, %ecx
	je	.L1647
.L1613:
	movq	200(%rbx), %rax
	cmpq	%rax, 192(%rbx)
	jnb	.L1647
.L1617:
	cmpb	$35, 0(%rbp)
	jne	.L1647
	cmpq	$0, 16(%rbx)
	leaq	56(%rbx), %r14
	je	.L1628
	movq	40(%rbx), %rdi
	call	*32(%rbx)
	testl	%eax, %eax
	je	.L1627
.L1653:
	movl	48(%rbx), %eax
	testl	%eax, %eax
	je	.L1600
.L1628:
	movq	192(%rbx), %rax
	cmpq	200(%rbx), %rax
	jnb	.L1600
	movzbl	0(%rbp), %edx
	cmpb	$10, %dl
	je	.L1600
	cmpb	$13, %dl
	je	.L1600
.L1631:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rbx)
	movzbl	(%rax), %r13d
.L1621:
	movb	%r13b, 0(%rbp)
	cmpq	$0, 16(%rbx)
	je	.L1628
	movq	40(%rbx), %rdi
	call	*32(%rbx)
	testl	%eax, %eax
	jne	.L1653
.L1627:
	movzbl	0(%rbp), %eax
	cmpb	$10, %al
	je	.L1600
	cmpb	$13, %al
	je	.L1600
	movq	192(%rbx), %rax
	cmpq	200(%rbx), %rax
	jb	.L1631
	movl	48(%rbx), %edx
	xorl	%r13d, %r13d
	testl	%edx, %edx
	je	.L1621
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%r14, %rsi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	testl	%eax, %eax
	jne	.L1622
	movl	$0, 48(%rbx)
	movq	%r12, %rax
	movb	$0, 56(%rbx)
.L1623:
	vmovq	%r12, %xmm1
	vpinsrq	$1, %rax, %xmm1, %xmm0
	vmovdqu	%xmm0, 192(%rbx)
	jmp	.L1621
	.p2align 4
	.p2align 3
.L1650:
	movq	192(%rbx), %rcx
	movq	%rcx, %rdx
	cmpq	%rcx, 200(%rbx)
	ja	.L1608
.L1647:
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
	.p2align 4
	.p2align 3
.L1610:
	.cfi_restore_state
	movzbl	0(%rbp), %eax
	cmpb	$32, %al
	je	.L1614
	cmpb	$9, %al
	jne	.L1654
.L1614:
	movq	192(%rbx), %rdx
	cmpq	200(%rbx), %rdx
	jb	.L1633
	movl	48(%rbx), %edi
	xorl	%r14d, %r14d
	testl	%edi, %edi
	jne	.L1655
.L1603:
	movb	%r14b, 0(%rbp)
	jmp	.L1601
.L1652:
	movq	%rcx, %rdx
	.p2align 4
	.p2align 3
.L1633:
	leaq	1(%rdx), %rax
	movq	%rax, 192(%rbx)
	movzbl	(%rdx), %r14d
	jmp	.L1603
	.p2align 4
	.p2align 3
.L1655:
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%r13, %rsi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	testl	%eax, %eax
	jne	.L1604
	movl	$0, 48(%rbx)
	movq	%r12, %rax
	movb	$0, 56(%rbx)
.L1605:
	vmovq	%r12, %xmm2
	vpinsrq	$1, %rax, %xmm2, %xmm0
	vmovdqu	%xmm0, 192(%rbx)
	jmp	.L1603
	.p2align 4
	.p2align 3
.L1622:
	cltq
	movzbl	56(%rbx), %r13d
	addq	%r14, %rax
	jmp	.L1623
	.p2align 4
	.p2align 3
.L1654:
	subl	$10, %eax
	cmpb	$3, %al
	jbe	.L1614
	jmp	.L1615
	.p2align 4
	.p2align 3
.L1604:
	cltq
	movzbl	56(%rbx), %r14d
	addq	%r13, %rax
	jmp	.L1605
	.p2align 4
	.p2align 3
.L1651:
	cmpq	$0, 16(%rbx)
	jne	.L1612
	jmp	.L1647
	.cfi_endproc
.LFE770:
	.size	stbi__pnm_skip_whitespace, .-stbi__pnm_skip_whitespace
	.section	.rodata.str1.8
	.align 8
.LC92:
	.string	"out_n == s->img_n || out_n == s->img_n+1"
	.section	.rodata.str1.1
.LC93:
	.string	"too large"
.LC94:
	.string	"not enough pixels"
.LC95:
	.string	"invalid filter"
.LC96:
	.string	"invalid width"
.LC97:
	.string	"img_n+1 == out_n"
.LC102:
	.string	"img_n == 3"
	.text
	.p2align 4
	.type	stbi__create_png_image_raw, @function
stbi__create_png_image_raw:
.LFB705:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	%ecx, %eax
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
	movq	%rsi, %rbp
	movl	%edx, %ebx
	subq	$568, %rsp
	.cfi_def_cfa_offset 624
	cmpl	$16, 624(%rsp)
	movq	%rdi, 184(%rsp)
	movl	%ecx, 172(%rsp)
	movl	%r8d, 216(%rsp)
	movl	%r9d, 212(%rsp)
	je	.L2164
	movl	%ecx, 256(%rsp)
	movl	$1, %r12d
	movl	$1, %r14d
	movq	%rdi, %rax
.L1657:
	movq	(%rax), %rax
	movl	172(%rsp), %edi
	movl	8(%rax), %eax
	movl	%eax, 220(%rsp)
	cmpl	%eax, %edi
	je	.L1658
	incl	%eax
	cmpl	%edi, %eax
	jne	.L2165
.L1658:
	movl	216(%rsp), %edi
	movl	212(%rsp), %esi
	movl	%edi, %eax
	orl	%esi, %eax
	js	.L1659
	movl	%edi, 232(%rsp)
	testl	%esi, %esi
	je	.L1660
	movl	$2147483647, %eax
	cltd
	idivl	%esi
	cmpl	%eax, %edi
	jle	.L1660
.L1659:
	movq	184(%rsp), %rax
	movq	$0, 24(%rax)
.L1662:
	leaq	.LC16(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L1656
	.p2align 4
	.p2align 3
.L1660:
	movl	256(%rsp), %eax
	testl	%eax, %eax
	js	.L1659
	movl	212(%rsp), %edi
	movl	%eax, %esi
	imull	216(%rsp), %edi
	testl	%eax, %eax
	je	.L1661
	movl	$2147483647, %eax
	cltd
	idivl	%esi
	cmpl	%eax, %edi
	jg	.L1659
.L1661:
	imull	256(%rsp), %edi
	movslq	%edi, %rdi
	call	malloc@PLT
	movq	%rax, %rdi
	movq	184(%rsp), %rax
	movq	%rdi, 24(%rax)
	testq	%rdi, %rdi
	je	.L1662
	movl	220(%rsp), %esi
	testl	%esi, %esi
	js	.L1665
	movl	216(%rsp), %edx
	testl	%edx, %edx
	je	.L1666
	movl	$2147483647, %eax
	movl	%edx, %ecx
	cltd
	idivl	%ecx
	cmpl	%eax, %esi
	jle	.L1666
.L1665:
	leaq	.LC93(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
.L1656:
	addq	$568, %rsp
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
.L1666:
	.cfi_restore_state
	movl	624(%rsp), %r15d
	testl	%r15d, %r15d
	js	.L1665
	movl	220(%rsp), %esi
	imull	216(%rsp), %esi
	movl	624(%rsp), %r13d
	movl	%esi, 404(%rsp)
	testl	%r13d, %r13d
	je	.L1667
	movl	$2147483647, %eax
	cltd
	idivl	624(%rsp)
	cmpl	%eax, %esi
	jg	.L1665
	imull	624(%rsp), %esi
	cmpl	$2147483640, %esi
	jg	.L1665
.L1667:
	movl	220(%rsp), %eax
	imull	624(%rsp), %eax
	movl	212(%rsp), %esi
	imull	216(%rsp), %eax
	addl	$7, %eax
	shrl	$3, %eax
	movl	%eax, 224(%rsp)
	incl	%eax
	imull	%esi, %eax
	cmpl	%ebx, %eax
	ja	.L1668
	testl	%esi, %esi
	je	.L1670
	movl	172(%rsp), %eax
	movl	216(%rsp), %esi
	movl	$0, 208(%rsp)
	movl	$0, 168(%rsp)
	vmovdqa	.LC13(%rip), %xmm14
	movl	%eax, %ebx
	imull	%esi, %ebx
	imull	%ebx, %r12d
	movl	%ebx, 292(%rsp)
	movl	220(%rsp), %ebx
	movl	%r12d, 176(%rsp)
	imull	%ebx, %r14d
	cmpl	$7, 624(%rsp)
	movl	%r14d, %r15d
	movq	%rbp, %r14
	setle	%dl
	cmpl	%ebx, %eax
	sete	%al
	orl	%eax, %edx
	leal	1(%rbx), %eax
	movl	%eax, 376(%rsp)
	leal	-1(%rsi), %eax
	movb	%dl, 288(%rsp)
	movl	%eax, 260(%rsp)
	.p2align 4
	.p2align 3
.L1843:
	movl	208(%rsp), %eax
	leaq	1(%r14), %rbx
	movzbl	(%r14), %ecx
	movq	%rax, 192(%rsp)
	addq	%rax, %rdi
	cmpl	$4, %ecx
	jg	.L2166
	cmpl	$7, 624(%rsp)
	jg	.L1672
	movl	224(%rsp), %esi
	cmpl	%esi, 216(%rsp)
	jb	.L2167
	movl	292(%rsp), %eax
	movl	176(%rsp), %edx
	movl	%esi, 232(%rsp)
	movl	$1, %r15d
	movl	168(%rsp), %r11d
	subl	%esi, %eax
	addq	%rax, %rdi
	movq	%rdi, %rax
	subq	%rdx, %rax
	testl	%r11d, %r11d
	jne	.L1674
	leaq	first_row_filter(%rip), %rdx
	movzbl	(%rdx,%rcx), %ecx
.L1674:
	movq	%rbx, %r9
	movq	%rdi, %r8
	xorl	%esi, %esi
	movl	%ecx, %r11d
	leaq	.L1679(%rip), %r10
	.p2align 4
	.p2align 3
.L1686:
	cmpl	$6, %ecx
	ja	.L1677
	movslq	(%r10,%r11,4), %rdx
	addq	%r10, %rdx
	notrack jmp	*%rdx
	.section	.rodata
	.align 4
	.align 4
.L1679:
	.long	.L1678-.L1679
	.long	.L1678-.L1679
	.long	.L1681-.L1679
	.long	.L1682-.L1679
	.long	.L1681-.L1679
	.long	.L1678-.L1679
	.long	.L1678-.L1679
	.text
	.p2align 4
	.p2align 3
.L1678:
	movzbl	(%r9), %edx
	movb	%dl, (%r8)
.L1677:
	incq	%rsi
	incq	%r9
	incq	%r8
	cmpl	%esi, %r15d
	jg	.L1686
	cmpl	$8, 624(%rsp)
	je	.L2168
.L1687:
	cmpl	$16, 624(%rsp)
	je	.L2169
	addq	$2, %r14
	incq	%rdi
	incq	%rax
.L1689:
	cmpb	$0, 288(%rsp)
	je	.L1692
.L2171:
	movl	232(%rsp), %ebx
	leal	-1(%rbx), %edx
	imull	%r15d, %edx
	movslq	%edx, %rbx
	movq	%rbx, (%rsp)
	cmpl	$6, %ecx
	ja	.L1693
	leaq	.L1695(%rip), %rsi
	movl	%ecx, %ecx
	movslq	(%rsi,%rcx,4), %rcx
	addq	%rsi, %rcx
	notrack jmp	*%rcx
	.section	.rodata
	.align 4
	.align 4
.L1695:
	.long	.L1701-.L1695
	.long	.L1700-.L1695
	.long	.L1699-.L1695
	.long	.L1698-.L1695
	.long	.L1697-.L1695
	.long	.L1696-.L1695
	.long	.L1694-.L1695
	.text
	.p2align 4
	.p2align 3
.L1681:
	movzbl	(%rax,%rsi), %edx
	addb	(%r9), %dl
	movb	%dl, (%r8)
	jmp	.L1677
	.p2align 4
	.p2align 3
.L1682:
	movzbl	(%rax,%rsi), %edx
	shrb	%dl
	addb	(%r9), %dl
	movb	%dl, (%r8)
	jmp	.L1677
.L1696:
	testl	%edx, %edx
	jle	.L1693
	movl	%r15d, %esi
	negl	%esi
	movslq	%esi, %rsi
	movq	%rsi, %rax
	notq	%rax
	cmpq	$14, %rax
	leal	-1(%rdx), %eax
	seta	%cl
	cmpl	$14, %eax
	seta	%al
	testb	%al, %cl
	je	.L1742
	leaq	1(%r14), %rcx
	movq	%rdi, %rax
	subq	%rcx, %rax
	cmpq	$14, %rax
	jbe	.L1742
	vmovdqa	.LC11(%rip), %xmm2
	movl	%edx, %ecx
	addq	%rdi, %rsi
	xorl	%eax, %eax
	shrl	$4, %ecx
	salq	$4, %rcx
	.p2align 4
	.p2align 3
.L1743:
	vmovdqu	(%rsi,%rax), %xmm3
	vpsrlw	$1, %xmm3, %xmm0
	vpand	%xmm0, %xmm2, %xmm0
	vpaddb	(%r14,%rax), %xmm0, %xmm0
	vmovdqu	%xmm0, (%rdi,%rax)
	addq	$16, %rax
	cmpq	%rax, %rcx
	jne	.L1743
	movl	%edx, %esi
	andl	$-16, %esi
	testb	$15, %dl
	je	.L1693
	movl	%esi, %eax
	movl	%esi, %ecx
	subl	%r15d, %eax
	cltq
	movzbl	(%rdi,%rax), %eax
	shrb	%al
	addb	(%r14,%rcx), %al
	movb	%al, (%rdi,%rcx)
	leal	1(%rsi), %eax
	cmpl	%eax, %edx
	jle	.L1693
	movslq	%eax, %rcx
	subl	%r15d, %eax
	cltq
	movzbl	(%rdi,%rax), %eax
	shrb	%al
	addb	(%r14,%rcx), %al
	movb	%al, (%rdi,%rcx)
	leal	2(%rsi), %eax
	cmpl	%eax, %edx
	jle	.L1693
	movslq	%eax, %rcx
	subl	%r15d, %eax
	cltq
	movzbl	(%rdi,%rax), %eax
	shrb	%al
	addb	(%r14,%rcx), %al
	movb	%al, (%rdi,%rcx)
	leal	3(%rsi), %eax
	cmpl	%eax, %edx
	jle	.L1693
	movslq	%eax, %rcx
	subl	%r15d, %eax
	cltq
	movzbl	(%rdi,%rax), %eax
	shrb	%al
	addb	(%r14,%rcx), %al
	movb	%al, (%rdi,%rcx)
	leal	4(%rsi), %eax
	cmpl	%eax, %edx
	jle	.L1693
	movslq	%eax, %rcx
	subl	%r15d, %eax
	cltq
	movzbl	(%rdi,%rax), %eax
	shrb	%al
	addb	(%r14,%rcx), %al
	movb	%al, (%rdi,%rcx)
	leal	5(%rsi), %eax
	cmpl	%eax, %edx
	jle	.L1693
	movslq	%eax, %rcx
	subl	%r15d, %eax
	cltq
	movzbl	(%rdi,%rax), %eax
	shrb	%al
	addb	(%r14,%rcx), %al
	movb	%al, (%rdi,%rcx)
	leal	6(%rsi), %eax
	cmpl	%eax, %edx
	jle	.L1693
	movslq	%eax, %rcx
	subl	%r15d, %eax
	cltq
	movzbl	(%rdi,%rax), %eax
	shrb	%al
	addb	(%r14,%rcx), %al
	movb	%al, (%rdi,%rcx)
	leal	7(%rsi), %eax
	cmpl	%eax, %edx
	jle	.L1693
	movslq	%eax, %rcx
	subl	%r15d, %eax
	cltq
	movzbl	(%rdi,%rax), %eax
	shrb	%al
	addb	(%r14,%rcx), %al
	movb	%al, (%rdi,%rcx)
	leal	8(%rsi), %eax
	cmpl	%eax, %edx
	jle	.L1693
	movslq	%eax, %rcx
	subl	%r15d, %eax
	cltq
	movzbl	(%rdi,%rax), %eax
	shrb	%al
	addb	(%r14,%rcx), %al
	movb	%al, (%rdi,%rcx)
	leal	9(%rsi), %eax
	cmpl	%eax, %edx
	jle	.L1693
	movslq	%eax, %rcx
	subl	%r15d, %eax
	cltq
	movzbl	(%rdi,%rax), %eax
	shrb	%al
	addb	(%r14,%rcx), %al
	movb	%al, (%rdi,%rcx)
	leal	10(%rsi), %eax
	cmpl	%eax, %edx
	jle	.L1693
	movslq	%eax, %rcx
	subl	%r15d, %eax
	cltq
	movzbl	(%rdi,%rax), %eax
	shrb	%al
	addb	(%r14,%rcx), %al
	movb	%al, (%rdi,%rcx)
	leal	11(%rsi), %eax
	cmpl	%eax, %edx
	jle	.L1693
	movslq	%eax, %rcx
	subl	%r15d, %eax
	cltq
	movzbl	(%rdi,%rax), %eax
	shrb	%al
	addb	(%r14,%rcx), %al
	movb	%al, (%rdi,%rcx)
	leal	12(%rsi), %eax
	cmpl	%eax, %edx
	jle	.L1693
	movslq	%eax, %rcx
	subl	%r15d, %eax
	cltq
	movzbl	(%rdi,%rax), %eax
	shrb	%al
	addb	(%r14,%rcx), %al
	movb	%al, (%rdi,%rcx)
	leal	13(%rsi), %eax
	cmpl	%eax, %edx
	jle	.L1693
	movslq	%eax, %rcx
	subl	%r15d, %eax
	cltq
	movzbl	(%rdi,%rax), %eax
	shrb	%al
	addb	(%r14,%rcx), %al
	movb	%al, (%rdi,%rcx)
	leal	14(%rsi), %eax
	cmpl	%eax, %edx
	jle	.L1693
	movslq	%eax, %rdx
	subl	%r15d, %eax
	cltq
	movzbl	(%rdi,%rax), %eax
	shrb	%al
	addb	(%r14,%rdx), %al
	movb	%al, (%rdi,%rdx)
	jmp	.L1693
.L1697:
	testl	%edx, %edx
	jle	.L1693
	movl	%r15d, %esi
	movq	%rdi, %rcx
	leaq	1(%r14), %r9
	negl	%esi
	movslq	%esi, %rsi
	leaq	1(%rax,%rsi), %r8
	subq	%r8, %rcx
	cmpq	$14, %rcx
	movq	%rdi, %rcx
	seta	%r8b
	subq	%r9, %rcx
	movq	%rsi, %r9
	cmpq	$14, %rcx
	notq	%r9
	seta	%cl
	andl	%ecx, %r8d
	leal	-1(%rdx), %ecx
	cmpl	$14, %ecx
	seta	%cl
	cmpq	$14, %r9
	seta	%r9b
	andl	%r9d, %ecx
	testb	%cl, %r8b
	je	.L1733
	leaq	1(%rax), %r8
	movq	%rdi, %rcx
	subq	%r8, %rcx
	cmpq	$14, %rcx
	jbe	.L1733
	vmovdqa	.LC2(%rip), %xmm3
	vmovdqa	.LC13(%rip), %xmm13
	movl	%edx, %ecx
	leaq	(%rax,%rsi), %r13
	shrl	$4, %ecx
	leaq	(%rdi,%rsi), %r12
	movq	%rcx, %rsi
	xorl	%ecx, %ecx
	salq	$4, %rsi
	vmovdqa	%xmm3, 240(%rsp)
	.p2align 4
	.p2align 3
.L1734:
	vmovdqu	0(%r13,%rcx), %xmm3
	vmovdqu	(%r12,%rcx), %xmm7
	vpmovzxbw	%xmm3, %xmm8
	vmovdqu	0(%r13,%rcx), %xmm3
	vpmovzxbw	%xmm7, %xmm12
	vmovdqu	(%r12,%rcx), %xmm7
	vpmovzxwd	%xmm8, %xmm9
	vpsrldq	$8, %xmm8, %xmm8
	vpmovzxwd	%xmm12, %xmm15
	vpsrldq	$8, %xmm12, %xmm12
	vpmovzxwd	%xmm12, %xmm12
	vpmovzxwd	%xmm8, %xmm8
	vpsrldq	$8, %xmm3, %xmm0
	vmovdqu	(%rax,%rcx), %xmm3
	vpmovzxbw	%xmm0, %xmm0
	vpsrldq	$8, %xmm7, %xmm10
	vpmovzxbw	%xmm10, %xmm10
	vpmovzxwd	%xmm0, %xmm4
	vpsrldq	$8, %xmm0, %xmm0
	vpmovzxwd	%xmm10, %xmm11
	vpmovzxwd	%xmm0, %xmm5
	vpsrldq	$8, %xmm10, %xmm10
	vpmovzxwd	%xmm10, %xmm10
	vmovdqa	%xmm5, 16(%rsp)
	vmovdqa	%xmm4, 32(%rsp)
	vpmovzxbw	%xmm3, %xmm2
	vmovdqu	(%rax,%rcx), %xmm3
	vpmovzxwd	%xmm2, %xmm0
	vpsrldq	$8, %xmm2, %xmm2
	vpmovzxwd	%xmm2, %xmm2
	vpaddd	%xmm15, %xmm0, %xmm6
	vpaddd	%xmm12, %xmm2, %xmm7
	vpsubd	%xmm9, %xmm6, %xmm6
	vpsubd	%xmm8, %xmm7, %xmm7
	vpsubd	%xmm15, %xmm6, %xmm15
	vpsubd	%xmm12, %xmm7, %xmm12
	vpsubd	%xmm0, %xmm6, %xmm0
	vpsubd	%xmm2, %xmm7, %xmm2
	vpsubd	%xmm9, %xmm6, %xmm6
	vpsubd	%xmm8, %xmm7, %xmm7
	vpabsd	%xmm0, %xmm0
	vpabsd	%xmm7, %xmm9
	vpabsd	%xmm2, %xmm2
	vpabsd	%xmm6, %xmm6
	vpabsd	%xmm15, %xmm15
	vmovdqa	%xmm9, 80(%rsp)
	vpsrldq	$8, %xmm3, %xmm1
	vpmovzxbw	%xmm1, %xmm1
	vpminsd	%xmm6, %xmm0, %xmm8
	vpabsd	%xmm12, %xmm12
	vpmovzxwd	%xmm1, %xmm3
	vpsrldq	$8, %xmm1, %xmm1
	vpmovzxwd	%xmm1, %xmm1
	vmovdqa	%xmm15, 64(%rsp)
	vpaddd	%xmm11, %xmm3, %xmm5
	vpsubd	%xmm4, %xmm5, %xmm5
	vpaddd	%xmm10, %xmm1, %xmm4
	vpsubd	16(%rsp), %xmm4, %xmm4
	vpsubd	%xmm11, %xmm5, %xmm11
	vpsubd	%xmm3, %xmm5, %xmm3
	vpsubd	32(%rsp), %xmm5, %xmm5
	vpabsd	%xmm3, %xmm3
	vpabsd	%xmm11, %xmm11
	vpsubd	%xmm10, %xmm4, %xmm10
	vpsubd	%xmm1, %xmm4, %xmm1
	vpsubd	16(%rsp), %xmm4, %xmm4
	vpabsd	%xmm5, %xmm7
	vpabsd	%xmm1, %xmm1
	vmovdqa	%xmm7, 96(%rsp)
	vpminsd	%xmm7, %xmm3, %xmm7
	vpabsd	%xmm10, %xmm10
	vpabsd	%xmm4, %xmm5
	vpminsd	%xmm9, %xmm2, %xmm4
	vpcmpgtd	%xmm8, %xmm15, %xmm9
	vpcmpgtd	%xmm4, %xmm12, %xmm15
	vmovdqa	%xmm9, 16(%rsp)
	vpcmpgtd	%xmm7, %xmm11, %xmm9
	vmovdqa	%xmm5, 112(%rsp)
	vmovdqa	%xmm15, 32(%rsp)
	vpcmpeqd	%xmm8, %xmm0, %xmm15
	vpminsd	%xmm5, %xmm1, %xmm5
	vmovdqa	%xmm9, 48(%rsp)
	vpcmpgtd	%xmm6, %xmm0, %xmm0
	vpcmpgtd	%xmm5, %xmm10, %xmm9
	vpand	16(%rsp), %xmm15, %xmm15
	vmovdqa	64(%rsp), %xmm6
	vpand	16(%rsp), %xmm0, %xmm0
	vmovdqa	%xmm15, 128(%rsp)
	vpcmpeqd	%xmm4, %xmm2, %xmm15
	vpand	32(%rsp), %xmm15, %xmm15
	vpminsd	%xmm6, %xmm8, %xmm8
	vpcmpgtd	80(%rsp), %xmm2, %xmm2
	vpand	32(%rsp), %xmm2, %xmm2
	vpminsd	%xmm4, %xmm12, %xmm4
	vpand	%xmm0, %xmm13, %xmm0
	vpcmpeqd	%xmm6, %xmm8, %xmm8
	vmovdqa	240(%rsp), %xmm6
	vpcmpeqd	%xmm4, %xmm12, %xmm4
	vpand	%xmm8, %xmm13, %xmm8
	vpand	%xmm4, %xmm13, %xmm4
	vpackusdw	%xmm4, %xmm8, %xmm4
	vmovdqa	%xmm15, 144(%rsp)
	vpcmpeqd	%xmm7, %xmm3, %xmm15
	vpand	48(%rsp), %xmm15, %xmm15
	vpminsd	%xmm7, %xmm11, %xmm7
	vpcmpgtd	96(%rsp), %xmm3, %xmm3
	vpand	48(%rsp), %xmm3, %xmm3
	vpand	%xmm2, %xmm13, %xmm2
	vpcmpeqd	%xmm7, %xmm11, %xmm7
	vpackusdw	%xmm2, %xmm0, %xmm0
	vpand	%xmm6, %xmm4, %xmm4
	vpand	%xmm7, %xmm13, %xmm7
	vpand	%xmm6, %xmm0, %xmm0
	vmovdqa	%xmm15, 192(%rsp)
	vpcmpeqd	%xmm5, %xmm1, %xmm15
	vpminsd	%xmm5, %xmm10, %xmm5
	vpcmpeqd	%xmm5, %xmm10, %xmm5
	vpcmpgtd	112(%rsp), %xmm1, %xmm1
	vpand	%xmm3, %xmm13, %xmm3
	vpand	%xmm9, %xmm15, %xmm15
	vpand	%xmm5, %xmm13, %xmm5
	vpand	%xmm9, %xmm1, %xmm1
	vpand	%xmm15, %xmm13, %xmm15
	vpackusdw	%xmm5, %xmm7, %xmm5
	vmovdqu	0(%r13,%rcx), %xmm7
	vpand	%xmm1, %xmm13, %xmm1
	vpand	%xmm6, %xmm5, %xmm5
	vpackusdw	%xmm1, %xmm3, %xmm1
	vpand	%xmm6, %xmm1, %xmm1
	vpackuswb	%xmm5, %xmm4, %xmm4
	vpackuswb	%xmm1, %xmm0, %xmm0
	vpand	144(%rsp), %xmm13, %xmm1
	vpblendvb	%xmm4, (%r12,%rcx), %xmm7, %xmm4
	vpblendvb	%xmm0, %xmm7, %xmm4, %xmm2
	vpand	128(%rsp), %xmm13, %xmm0
	vpackusdw	%xmm1, %xmm0, %xmm0
	vpand	192(%rsp), %xmm13, %xmm1
	vpand	%xmm6, %xmm0, %xmm0
	vpackusdw	%xmm15, %xmm1, %xmm1
	vpand	%xmm6, %xmm1, %xmm1
	vpackuswb	%xmm1, %xmm0, %xmm0
	vpblendvb	%xmm0, (%rax,%rcx), %xmm2, %xmm0
	vpaddb	(%r14,%rcx), %xmm0, %xmm0
	vmovdqu	%xmm0, (%rdi,%rcx)
	addq	$16, %rcx
	cmpq	%rcx, %rsi
	jne	.L1734
	movl	%edx, %esi
	andl	$-16, %esi
	testb	$15, %dl
	je	.L1693
	movl	%r15d, 32(%rsp)
	movl	%edx, 16(%rsp)
	jmp	.L1738
	.p2align 4
	.p2align 3
.L1737:
	cmpl	%r8d, %r9d
	cmovle	%ebx, %ecx
	addl	%r15d, %ecx
	movb	%cl, (%rdi,%rsi)
	incq	%rsi
	cmpl	%esi, 16(%rsp)
	jle	.L2170
.L1738:
	movzbl	(%rax,%rsi), %r9d
	movzbl	(%r12,%rsi), %r11d
	movzbl	0(%r13,%rsi), %r8d
	movzbl	(%r14,%rsi), %r15d
	movl	%r9d, %ebx
	leal	(%r9,%r11), %edx
	movl	%r8d, %ecx
	subl	%r8d, %edx
	movl	%edx, %r10d
	subl	%r9d, %r10d
	movl	%r10d, %r9d
	negl	%r9d
	cmovs	%r10d, %r9d
	movl	%edx, %r10d
	subl	%r8d, %r10d
	movl	%r10d, %r8d
	negl	%r8d
	cmovs	%r10d, %r8d
	subl	%r11d, %edx
	movl	%edx, %r10d
	negl	%r10d
	cmovns	%r10d, %edx
	cmpl	%r8d, %r9d
	movl	%r8d, %r10d
	cmovle	%r9d, %r10d
	cmpl	%r10d, %edx
	jg	.L1737
	movl	%r11d, %ecx
	addl	%r15d, %ecx
	movb	%cl, (%rdi,%rsi)
	incq	%rsi
	cmpl	%esi, 16(%rsp)
	jg	.L1738
.L2170:
	movl	32(%rsp), %r15d
	jmp	.L1693
.L1698:
	testl	%edx, %edx
	jle	.L1693
	leaq	1(%r14), %r8
	movq	%rdi, %rsi
	movl	%r15d, %ecx
	leaq	1(%rax), %r9
	subq	%r8, %rsi
	negl	%ecx
	movq	%rdi, %r8
	cmpq	$14, %rsi
	movslq	%ecx, %rcx
	seta	%sil
	subq	%r9, %r8
	cmpq	$14, %r8
	seta	%r8b
	testb	%r8b, %sil
	je	.L1727
	movq	%rcx, %rsi
	notq	%rsi
	cmpq	$14, %rsi
	leal	-1(%rdx), %esi
	seta	%r8b
	cmpl	$14, %esi
	seta	%sil
	testb	%sil, %r8b
	je	.L1727
	vmovdqa	.LC11(%rip), %xmm2
	vmovdqa	.LC12(%rip), %xmm3
	movl	%edx, %r8d
	addq	%rdi, %rcx
	shrl	$4, %r8d
	xorl	%esi, %esi
	salq	$4, %r8
	.p2align 4
	.p2align 3
.L1728:
	vmovdqu	(%rax,%rsi), %xmm5
	vpsrlw	$1, %xmm5, %xmm0
	vmovdqu	(%rcx,%rsi), %xmm5
	vpand	%xmm0, %xmm2, %xmm0
	vpsrlw	$1, %xmm5, %xmm1
	vmovdqu	(%rax,%rsi), %xmm5
	vpand	%xmm1, %xmm2, %xmm1
	vpaddb	%xmm1, %xmm0, %xmm0
	vpand	(%rcx,%rsi), %xmm5, %xmm1
	vpaddb	(%r14,%rsi), %xmm0, %xmm0
	vpand	%xmm3, %xmm1, %xmm1
	vpaddb	%xmm1, %xmm0, %xmm0
	vmovdqu	%xmm0, (%rdi,%rsi)
	addq	$16, %rsi
	cmpq	%rsi, %r8
	jne	.L1728
	movl	%edx, %r9d
	andl	$-16, %r9d
	testb	$15, %dl
	je	.L1693
	movl	%r9d, %ecx
	movl	%r9d, %esi
	subl	%r15d, %ecx
	movzbl	(%rax,%rsi), %r8d
	movslq	%ecx, %rcx
	movzbl	(%rdi,%rcx), %ecx
	addl	%r8d, %ecx
	sarl	%ecx
	addb	(%r14,%rsi), %cl
	movb	%cl, (%rdi,%rsi)
	leal	1(%r9), %ecx
	cmpl	%ecx, %edx
	jle	.L1693
	movslq	%ecx, %rsi
	subl	%r15d, %ecx
	movslq	%ecx, %rcx
	movzbl	(%rax,%rsi), %r8d
	movzbl	(%rdi,%rcx), %ecx
	addl	%r8d, %ecx
	sarl	%ecx
	addb	(%r14,%rsi), %cl
	movb	%cl, (%rdi,%rsi)
	leal	2(%r9), %ecx
	cmpl	%ecx, %edx
	jle	.L1693
	movslq	%ecx, %rsi
	subl	%r15d, %ecx
	movslq	%ecx, %rcx
	movzbl	(%rax,%rsi), %r8d
	movzbl	(%rdi,%rcx), %ecx
	addl	%r8d, %ecx
	sarl	%ecx
	addb	(%r14,%rsi), %cl
	movb	%cl, (%rdi,%rsi)
	leal	3(%r9), %ecx
	cmpl	%ecx, %edx
	jle	.L1693
	movslq	%ecx, %rsi
	subl	%r15d, %ecx
	movslq	%ecx, %rcx
	movzbl	(%rax,%rsi), %r8d
	movzbl	(%rdi,%rcx), %ecx
	addl	%r8d, %ecx
	sarl	%ecx
	addb	(%r14,%rsi), %cl
	movb	%cl, (%rdi,%rsi)
	leal	4(%r9), %ecx
	cmpl	%ecx, %edx
	jle	.L1693
	movslq	%ecx, %rsi
	subl	%r15d, %ecx
	movslq	%ecx, %rcx
	movzbl	(%rax,%rsi), %r8d
	movzbl	(%rdi,%rcx), %ecx
	addl	%r8d, %ecx
	sarl	%ecx
	addb	(%r14,%rsi), %cl
	movb	%cl, (%rdi,%rsi)
	leal	5(%r9), %ecx
	cmpl	%ecx, %edx
	jle	.L1693
	movslq	%ecx, %rsi
	subl	%r15d, %ecx
	movslq	%ecx, %rcx
	movzbl	(%rax,%rsi), %r8d
	movzbl	(%rdi,%rcx), %ecx
	addl	%r8d, %ecx
	sarl	%ecx
	addb	(%r14,%rsi), %cl
	movb	%cl, (%rdi,%rsi)
	leal	6(%r9), %ecx
	cmpl	%ecx, %edx
	jle	.L1693
	movslq	%ecx, %rsi
	subl	%r15d, %ecx
	movslq	%ecx, %rcx
	movzbl	(%rax,%rsi), %r8d
	movzbl	(%rdi,%rcx), %ecx
	addl	%r8d, %ecx
	sarl	%ecx
	addb	(%r14,%rsi), %cl
	movb	%cl, (%rdi,%rsi)
	leal	7(%r9), %ecx
	cmpl	%ecx, %edx
	jle	.L1693
	movslq	%ecx, %rsi
	subl	%r15d, %ecx
	movslq	%ecx, %rcx
	movzbl	(%rax,%rsi), %r8d
	movzbl	(%rdi,%rcx), %ecx
	addl	%r8d, %ecx
	sarl	%ecx
	addb	(%r14,%rsi), %cl
	movb	%cl, (%rdi,%rsi)
	leal	8(%r9), %ecx
	cmpl	%ecx, %edx
	jle	.L1693
	movslq	%ecx, %rsi
	subl	%r15d, %ecx
	movslq	%ecx, %rcx
	movzbl	(%rax,%rsi), %r8d
	movzbl	(%rdi,%rcx), %ecx
	addl	%r8d, %ecx
	sarl	%ecx
	addb	(%r14,%rsi), %cl
	movb	%cl, (%rdi,%rsi)
	leal	9(%r9), %ecx
	cmpl	%ecx, %edx
	jle	.L1693
	movslq	%ecx, %rsi
	subl	%r15d, %ecx
	movslq	%ecx, %rcx
	movzbl	(%rax,%rsi), %r8d
	movzbl	(%rdi,%rcx), %ecx
	addl	%r8d, %ecx
	sarl	%ecx
	addb	(%r14,%rsi), %cl
	movb	%cl, (%rdi,%rsi)
	leal	10(%r9), %ecx
	cmpl	%ecx, %edx
	jle	.L1693
	movslq	%ecx, %rsi
	subl	%r15d, %ecx
	movslq	%ecx, %rcx
	movzbl	(%rax,%rsi), %r8d
	movzbl	(%rdi,%rcx), %ecx
	addl	%r8d, %ecx
	sarl	%ecx
	addb	(%r14,%rsi), %cl
	movb	%cl, (%rdi,%rsi)
	leal	11(%r9), %ecx
	cmpl	%ecx, %edx
	jle	.L1693
	movslq	%ecx, %rsi
	subl	%r15d, %ecx
	movslq	%ecx, %rcx
	movzbl	(%rax,%rsi), %r8d
	movzbl	(%rdi,%rcx), %ecx
	addl	%r8d, %ecx
	sarl	%ecx
	addb	(%r14,%rsi), %cl
	movb	%cl, (%rdi,%rsi)
	leal	12(%r9), %ecx
	cmpl	%ecx, %edx
	jle	.L1693
	movslq	%ecx, %rsi
	subl	%r15d, %ecx
	movslq	%ecx, %rcx
	movzbl	(%rax,%rsi), %r8d
	movzbl	(%rdi,%rcx), %ecx
	addl	%r8d, %ecx
	sarl	%ecx
	addb	(%r14,%rsi), %cl
	movb	%cl, (%rdi,%rsi)
	leal	13(%r9), %ecx
	cmpl	%ecx, %edx
	jle	.L1693
	movslq	%ecx, %rsi
	subl	%r15d, %ecx
	movslq	%ecx, %rcx
	movzbl	(%rax,%rsi), %r8d
	movzbl	(%rdi,%rcx), %ecx
	addl	%r8d, %ecx
	sarl	%ecx
	addb	(%r14,%rsi), %cl
	movb	%cl, (%rdi,%rsi)
	leal	14(%r9), %ecx
	cmpl	%ecx, %edx
	jle	.L1693
	movslq	%ecx, %rdx
	subl	%r15d, %ecx
	movslq	%ecx, %rcx
	movzbl	(%rax,%rdx), %eax
	movzbl	(%rdi,%rcx), %ecx
	addl	%ecx, %eax
	sarl	%eax
	addb	(%r14,%rdx), %al
	movb	%al, (%rdi,%rdx)
	jmp	.L1693
.L1699:
	testl	%edx, %edx
	jle	.L1693
	leaq	1(%r14), %r9
	movq	%rdi, %r8
	leaq	1(%rax), %r10
	movl	%edx, %ecx
	subq	%r9, %r8
	movq	%rdi, %r9
	leal	-1(%rdx), %esi
	cmpq	$14, %r8
	seta	%r8b
	subq	%r10, %r9
	cmpq	$14, %r9
	seta	%r9b
	testb	%r9b, %r8b
	je	.L1718
	cmpl	$6, %esi
	jbe	.L1718
	cmpl	$14, %esi
	jbe	.L1889
	movl	%edx, %esi
	xorl	%ecx, %ecx
	shrl	$4, %esi
	salq	$4, %rsi
	.p2align 4
	.p2align 3
.L1720:
	vmovdqu	(%r14,%rcx), %xmm3
	vpaddb	(%rax,%rcx), %xmm3, %xmm0
	vmovdqu	%xmm0, (%rdi,%rcx)
	addq	$16, %rcx
	cmpq	%rcx, %rsi
	jne	.L1720
	movl	%edx, %esi
	andl	$-16, %esi
	movl	%esi, %r8d
	cmpl	%esi, %edx
	je	.L1693
	movl	%edx, %ecx
	subl	%esi, %ecx
	leal	-1(%rcx), %r9d
	cmpl	$6, %r9d
	jbe	.L1723
.L1719:
	vmovq	(%r14,%rsi), %xmm0
	vmovq	(%rax,%rsi), %xmm1
	vpaddb	%xmm1, %xmm0, %xmm0
	vmovq	%xmm0, (%rdi,%rsi)
	movl	%ecx, %esi
	andl	$-8, %esi
	addl	%esi, %r8d
	cmpl	%ecx, %esi
	je	.L1693
.L1723:
	movslq	%r8d, %rcx
	movzbl	(%rax,%rcx), %esi
	addb	(%r14,%rcx), %sil
	movb	%sil, (%rdi,%rcx)
	leal	1(%r8), %ecx
	cmpl	%ecx, %edx
	jle	.L1693
	movslq	%ecx, %rcx
	movzbl	(%rax,%rcx), %esi
	addb	(%r14,%rcx), %sil
	movb	%sil, (%rdi,%rcx)
	leal	2(%r8), %ecx
	cmpl	%ecx, %edx
	jle	.L1693
	movslq	%ecx, %rcx
	movzbl	(%rax,%rcx), %esi
	addb	(%r14,%rcx), %sil
	movb	%sil, (%rdi,%rcx)
	leal	3(%r8), %ecx
	cmpl	%ecx, %edx
	jle	.L1693
	movslq	%ecx, %rcx
	movzbl	(%rax,%rcx), %esi
	addb	(%r14,%rcx), %sil
	movb	%sil, (%rdi,%rcx)
	leal	4(%r8), %ecx
	cmpl	%edx, %ecx
	jge	.L1693
	movslq	%ecx, %rcx
	movzbl	(%rax,%rcx), %esi
	addb	(%r14,%rcx), %sil
	movb	%sil, (%rdi,%rcx)
	leal	5(%r8), %ecx
	cmpl	%edx, %ecx
	jge	.L1693
	movslq	%ecx, %rcx
	addl	$6, %r8d
	movzbl	(%rax,%rcx), %esi
	addb	(%r14,%rcx), %sil
	movb	%sil, (%rdi,%rcx)
	cmpl	%edx, %r8d
	jge	.L1693
	movslq	%r8d, %r8
	movzbl	(%rax,%r8), %eax
	addb	(%r14,%r8), %al
	movb	%al, (%rdi,%r8)
	jmp	.L1693
.L1701:
	movq	(%rsp), %rdx
	movq	%r14, %rsi
	call	memcpy@PLT
	vmovdqa	.LC13(%rip), %xmm14
	.p2align 4
	.p2align 3
.L1693:
	addq	(%rsp), %r14
.L1757:
	movl	168(%rsp), %eax
	movl	176(%rsp), %edi
	addl	%edi, 208(%rsp)
	incl	%eax
	cmpl	%eax, 212(%rsp)
	je	.L1842
	movq	184(%rsp), %rbx
	movl	%eax, 168(%rsp)
	movq	24(%rbx), %rdi
	jmp	.L1843
.L1700:
	testl	%edx, %edx
	jle	.L1693
	movl	%r15d, %eax
	leal	-1(%rdx), %ecx
	movl	%edx, %r8d
	negl	%eax
	cltq
	movq	%rax, %rsi
	notq	%rsi
	cmpq	$14, %rsi
	seta	%r9b
	cmpl	$6, %ecx
	seta	%sil
	testb	%sil, %r9b
	je	.L1709
	leaq	1(%r14), %r9
	movq	%rdi, %rsi
	subq	%r9, %rsi
	cmpq	$14, %rsi
	jbe	.L1709
	cmpl	$14, %ecx
	jbe	.L1888
	movl	%edx, %esi
	addq	%rdi, %rax
	xorl	%ecx, %ecx
	shrl	$4, %esi
	salq	$4, %rsi
	.p2align 4
	.p2align 3
.L1711:
	vmovdqu	(%r14,%rcx), %xmm3
	vpaddb	(%rax,%rcx), %xmm3, %xmm0
	vmovdqu	%xmm0, (%rdi,%rcx)
	addq	$16, %rcx
	cmpq	%rcx, %rsi
	jne	.L1711
	movl	%edx, %esi
	andl	$-16, %esi
	movl	%esi, %ecx
	cmpl	%esi, %edx
	je	.L1693
	movl	%edx, %r8d
	subl	%esi, %r8d
	leal	-1(%r8), %r9d
	cmpl	$6, %r9d
	jbe	.L1714
.L1710:
	vmovq	(%rax,%rsi), %xmm0
	vmovq	(%r14,%rsi), %xmm1
	vpaddb	%xmm1, %xmm0, %xmm0
	movl	%r8d, %eax
	andl	$-8, %eax
	addl	%eax, %ecx
	vmovq	%xmm0, (%rdi,%rsi)
	cmpl	%r8d, %eax
	je	.L1693
.L1714:
	movl	%ecx, %eax
	movslq	%ecx, %rsi
	subl	%r15d, %eax
	movzbl	(%r14,%rsi), %r8d
	cltq
	addb	(%rdi,%rax), %r8b
	leal	1(%rcx), %eax
	movb	%r8b, (%rdi,%rsi)
	cmpl	%edx, %eax
	jge	.L1693
	movslq	%eax, %rsi
	subl	%r15d, %eax
	cltq
	movzbl	(%r14,%rsi), %r8d
	addb	(%rdi,%rax), %r8b
	leal	2(%rcx), %eax
	movb	%r8b, (%rdi,%rsi)
	cmpl	%edx, %eax
	jge	.L1693
	movslq	%eax, %rsi
	subl	%r15d, %eax
	cltq
	movzbl	(%r14,%rsi), %r8d
	addb	(%rdi,%rax), %r8b
	leal	3(%rcx), %eax
	movb	%r8b, (%rdi,%rsi)
	cmpl	%edx, %eax
	jge	.L1693
	movslq	%eax, %rsi
	subl	%r15d, %eax
	cltq
	movzbl	(%r14,%rsi), %r8d
	addb	(%rdi,%rax), %r8b
	leal	4(%rcx), %eax
	movb	%r8b, (%rdi,%rsi)
	cmpl	%edx, %eax
	jge	.L1693
	movslq	%eax, %rsi
	subl	%r15d, %eax
	cltq
	movzbl	(%r14,%rsi), %r8d
	addb	(%rdi,%rax), %r8b
	leal	5(%rcx), %eax
	movb	%r8b, (%rdi,%rsi)
	cmpl	%edx, %eax
	jl	.L2162
	jmp	.L1693
	.p2align 4
	.p2align 3
.L1694:
	testl	%edx, %edx
	jle	.L1693
	movl	%r15d, %eax
	leal	-1(%rdx), %ecx
	movl	%edx, %r8d
	negl	%eax
	cltq
	movq	%rax, %rsi
	notq	%rsi
	cmpq	$14, %rsi
	seta	%r9b
	cmpl	$6, %ecx
	seta	%sil
	testb	%sil, %r9b
	je	.L1748
	leaq	1(%r14), %r9
	movq	%rdi, %rsi
	subq	%r9, %rsi
	cmpq	$14, %rsi
	jbe	.L1748
	cmpl	$14, %ecx
	jbe	.L1891
	movl	%edx, %esi
	addq	%rdi, %rax
	xorl	%ecx, %ecx
	shrl	$4, %esi
	salq	$4, %rsi
	.p2align 4
	.p2align 3
.L1750:
	vmovdqu	(%r14,%rcx), %xmm3
	vpaddb	(%rax,%rcx), %xmm3, %xmm0
	vmovdqu	%xmm0, (%rdi,%rcx)
	addq	$16, %rcx
	cmpq	%rcx, %rsi
	jne	.L1750
	movl	%edx, %esi
	andl	$-16, %esi
	movl	%esi, %ecx
	cmpl	%esi, %edx
	je	.L1693
	movl	%edx, %r8d
	subl	%esi, %r8d
	leal	-1(%r8), %r9d
	cmpl	$6, %r9d
	jbe	.L1753
.L1749:
	vmovq	(%rax,%rsi), %xmm0
	vmovq	(%r14,%rsi), %xmm1
	vpaddb	%xmm1, %xmm0, %xmm0
	movl	%r8d, %eax
	andl	$-8, %eax
	addl	%eax, %ecx
	vmovq	%xmm0, (%rdi,%rsi)
	cmpl	%r8d, %eax
	je	.L1693
.L1753:
	movl	%ecx, %eax
	movslq	%ecx, %rsi
	subl	%r15d, %eax
	movzbl	(%r14,%rsi), %r8d
	cltq
	addb	(%rdi,%rax), %r8b
	leal	1(%rcx), %eax
	movb	%r8b, (%rdi,%rsi)
	cmpl	%eax, %edx
	jle	.L1693
	movslq	%eax, %rsi
	subl	%r15d, %eax
	cltq
	movzbl	(%r14,%rsi), %r8d
	addb	(%rdi,%rax), %r8b
	leal	2(%rcx), %eax
	movb	%r8b, (%rdi,%rsi)
	cmpl	%eax, %edx
	jle	.L1693
	movslq	%eax, %rsi
	subl	%r15d, %eax
	cltq
	movzbl	(%r14,%rsi), %r8d
	addb	(%rdi,%rax), %r8b
	leal	3(%rcx), %eax
	movb	%r8b, (%rdi,%rsi)
	cmpl	%eax, %edx
	jle	.L1693
	movslq	%eax, %rsi
	subl	%r15d, %eax
	cltq
	movzbl	(%r14,%rsi), %r8d
	addb	(%rdi,%rax), %r8b
	leal	4(%rcx), %eax
	movb	%r8b, (%rdi,%rsi)
	cmpl	%eax, %edx
	jle	.L1693
	movslq	%eax, %rsi
	subl	%r15d, %eax
	cltq
	movzbl	(%r14,%rsi), %r8d
	addb	(%rdi,%rax), %r8b
	leal	5(%rcx), %eax
	movb	%r8b, (%rdi,%rsi)
	cmpl	%eax, %edx
	jle	.L1693
.L2162:
	movslq	%eax, %rsi
	subl	%r15d, %eax
	addl	$6, %ecx
	cltq
	movzbl	(%r14,%rsi), %r8d
	addb	(%rdi,%rax), %r8b
	movb	%r8b, (%rdi,%rsi)
	cmpl	%ecx, %edx
	jle	.L1693
	movslq	%ecx, %rax
	subl	%r15d, %ecx
	movslq	%ecx, %rdx
	movzbl	(%r14,%rax), %ecx
	addb	(%rdi,%rdx), %cl
	movb	%cl, (%rdi,%rax)
	jmp	.L1693
	.p2align 4
	.p2align 3
.L1672:
	movl	176(%rsp), %edx
	movl	168(%rsp), %r10d
	movq	%rdi, %rax
	subq	%rdx, %rax
	testl	%r10d, %r10d
	jne	.L1675
	leaq	first_row_filter(%rip), %rdx
	movzbl	(%rdx,%rcx), %ecx
.L1675:
	testl	%r15d, %r15d
	jne	.L1674
	cmpl	$8, 624(%rsp)
	jne	.L1687
	.p2align 4
	.p2align 3
.L2168:
	movslq	220(%rsp), %rdx
	cmpl	%edx, 172(%rsp)
	je	.L1688
	movb	$-1, (%rdi,%rdx)
.L1688:
	leaq	(%rbx,%rdx), %r14
	movslq	172(%rsp), %rdx
	addq	%rdx, %rdi
	addq	%rdx, %rax
	cmpb	$0, 288(%rsp)
	jne	.L2171
.L1692:
	movl	172(%rsp), %esi
	cmpl	%esi, 376(%rsp)
	jne	.L2172
	cmpl	$6, %ecx
	ja	.L1759
	leaq	.L1761(%rip), %rsi
	movl	%ecx, %edx
	movslq	(%rsi,%rdx,4), %rdx
	addq	%rsi, %rdx
	notrack jmp	*%rdx
	.section	.rodata
	.align 4
	.align 4
.L1761:
	.long	.L1767-.L1761
	.long	.L1766-.L1761
	.long	.L1765-.L1761
	.long	.L1764-.L1761
	.long	.L1763-.L1761
	.long	.L1762-.L1761
	.long	.L1760-.L1761
	.text
.L1762:
	movl	260(%rsp), %r9d
	testl	%r9d, %r9d
	je	.L1768
	movslq	256(%rsp), %rax
	movl	%r15d, %r10d
	movslq	%r15d, %r11
	andl	$-16, %r10d
	leal	1(%r10), %r12d
	leal	2(%r10), %ecx
	movl	%r10d, %r13d
	movl	%r10d, %ebp
	movl	%ecx, 96(%rsp)
	movq	%rcx, 16(%rsp)
	movq	%rax, %rbx
	movq	%rax, (%rsp)
	negl	%eax
	movl	%r12d, 80(%rsp)
	movslq	%eax, %rdx
	movl	%r15d, %eax
	subl	%ebx, %r13d
	shrl	$4, %eax
	addq	%rdx, %rdi
	notq	%rdx
	movslq	%r13d, %r13
	leal	-1(%rax), %r8d
	movq	%r12, %rax
	subl	%ebx, %eax
	incq	%r8
	movslq	%eax, %rsi
	movq	%rcx, %rax
	leal	3(%r10), %ecx
	salq	$4, %r8
	subl	%ebx, %eax
	movl	%ecx, 112(%rsp)
	movq	%rcx, 240(%rsp)
	cltq
	movq	%rax, 128(%rsp)
	movq	%rcx, %rax
	leal	4(%r10), %ecx
	subl	%ebx, %eax
	movl	%ecx, 144(%rsp)
	movq	%rcx, 280(%rsp)
	cltq
	movq	%rax, 264(%rsp)
	movq	%rcx, %rax
	leal	5(%r10), %ecx
	subl	%ebx, %eax
	movl	%ecx, 272(%rsp)
	movq	%rcx, 312(%rsp)
	cltq
	movq	%rax, 296(%rsp)
	movq	%rcx, %rax
	leal	6(%r10), %ecx
	subl	%ebx, %eax
	movl	%ecx, 304(%rsp)
	movq	%rcx, 336(%rsp)
	cltq
	movq	%rax, 320(%rsp)
	movq	%rcx, %rax
	leal	7(%r10), %ecx
	subl	%ebx, %eax
	movl	%ecx, 328(%rsp)
	movq	%rcx, 360(%rsp)
	cltq
	movq	%rax, 344(%rsp)
	movq	%rcx, %rax
	leal	8(%r10), %ecx
	subl	%ebx, %eax
	movl	%ecx, 352(%rsp)
	movq	%rcx, 384(%rsp)
	cltq
	movq	%rax, 368(%rsp)
	movq	%rcx, %rax
	leal	9(%r10), %ecx
	subl	%ebx, %eax
	movl	%ecx, 380(%rsp)
	movq	%rcx, 408(%rsp)
	cltq
	movq	%rax, 392(%rsp)
	movq	%rcx, %rax
	leal	10(%r10), %ecx
	subl	%ebx, %eax
	movl	%ecx, 400(%rsp)
	movq	%rcx, 432(%rsp)
	cltq
	movq	%rax, 416(%rsp)
	movq	%rcx, %rax
	leal	11(%r10), %ecx
	subl	%ebx, %eax
	movl	%ecx, 424(%rsp)
	movq	%rcx, 456(%rsp)
	cltq
	movq	%rax, 440(%rsp)
	movq	%rcx, %rax
	leal	12(%r10), %ecx
	subl	%ebx, %eax
	cltq
	movq	%rax, 464(%rsp)
	movq	%rcx, %rax
	movl	%ecx, 448(%rsp)
	subl	%ebx, %eax
	movq	%rcx, 480(%rsp)
	leal	13(%r10), %ecx
	movl	%r10d, 64(%rsp)
	cltq
	movl	%ecx, 472(%rsp)
	movq	%rcx, 504(%rsp)
	movq	%rax, 488(%rsp)
	movq	%rcx, %rax
	leal	14(%r10), %ecx
	movq	%r14, 536(%rsp)
	subl	%ebx, %eax
	movl	%ecx, 496(%rsp)
	movq	%rcx, 520(%rsp)
	cltq
	movq	%rdx, 48(%rsp)
	movq	%rax, 512(%rsp)
	movq	16(%rsp), %r10
	movq	%rcx, %rax
	subl	%ebx, %eax
	leal	-1(%r15), %ebx
	cltq
	movl	%ebx, 32(%rsp)
	movq	%rax, 528(%rsp)
	movq	%r14, %rax
	movq	%rsi, %r14
	.p2align 4
	.p2align 3
.L1822:
	movq	%rdi, %rsi
	addq	(%rsp), %rdi
	testl	%r15d, %r15d
	je	.L1829
	cmpq	$14, 48(%rsp)
	seta	%cl
	cmpl	$14, 32(%rsp)
	seta	%dl
	testb	%dl, %cl
	je	.L1823
	leaq	1(%rax), %rcx
	movq	%rdi, %rdx
	subq	%rcx, %rdx
	cmpq	$14, %rdx
	jbe	.L1823
	addq	$0, %rsi
	xorl	%edx, %edx
	.p2align 4
	.p2align 3
.L1824:
	vmovdqu	(%rsi,%rdx), %xmm3
	vpsrlw	$1, %xmm3, %xmm0
	vpand	.LC11(%rip), %xmm0, %xmm0
	vpaddb	(%rax,%rdx), %xmm0, %xmm0
	vmovdqu	%xmm0, (%rdi,%rdx)
	addq	$16, %rdx
	cmpq	%rdx, %r8
	jne	.L1824
	cmpl	64(%rsp), %r15d
	je	.L1829
	movzbl	(%rdi,%r13), %edx
	shrb	%dl
	addb	(%rax,%rbp), %dl
	movb	%dl, (%rdi,%rbp)
	cmpl	80(%rsp), %r15d
	jle	.L1829
	movzbl	(%rdi,%r14), %edx
	shrb	%dl
	addb	(%rax,%r12), %dl
	movb	%dl, (%rdi,%r12)
	cmpl	96(%rsp), %r15d
	jle	.L1829
	movq	128(%rsp), %rsi
	movzbl	(%rdi,%rsi), %esi
	movl	%esi, %edx
	movb	%sil, 16(%rsp)
	shrb	%dl
	addb	(%rax,%r10), %dl
	movb	%dl, (%rdi,%r10)
	cmpl	112(%rsp), %r15d
	jle	.L1829
	movq	264(%rsp), %rsi
	movzbl	(%rdi,%rsi), %esi
	movl	%esi, %edx
	movb	%sil, 16(%rsp)
	movq	240(%rsp), %rsi
	shrb	%dl
	addb	(%rax,%rsi), %dl
	movb	%dl, (%rdi,%rsi)
	cmpl	144(%rsp), %r15d
	jle	.L1829
	movq	296(%rsp), %rsi
	movzbl	(%rdi,%rsi), %esi
	movl	%esi, %edx
	movb	%sil, 16(%rsp)
	movq	280(%rsp), %rsi
	shrb	%dl
	addb	(%rax,%rsi), %dl
	movb	%dl, (%rdi,%rsi)
	cmpl	272(%rsp), %r15d
	jle	.L1829
	movq	320(%rsp), %rsi
	movzbl	(%rdi,%rsi), %esi
	movl	%esi, %edx
	movb	%sil, 16(%rsp)
	movq	312(%rsp), %rsi
	shrb	%dl
	addb	(%rax,%rsi), %dl
	movb	%dl, (%rdi,%rsi)
	cmpl	304(%rsp), %r15d
	jle	.L1829
	movq	344(%rsp), %rsi
	movzbl	(%rdi,%rsi), %esi
	movl	%esi, %edx
	movb	%sil, 16(%rsp)
	movq	336(%rsp), %rsi
	shrb	%dl
	addb	(%rax,%rsi), %dl
	movb	%dl, (%rdi,%rsi)
	cmpl	328(%rsp), %r15d
	jle	.L1829
	movq	368(%rsp), %rsi
	movzbl	(%rdi,%rsi), %esi
	movl	%esi, %edx
	movb	%sil, 16(%rsp)
	movq	360(%rsp), %rsi
	shrb	%dl
	addb	(%rax,%rsi), %dl
	movb	%dl, (%rdi,%rsi)
	cmpl	352(%rsp), %r15d
	jle	.L1829
	movq	392(%rsp), %rsi
	movzbl	(%rdi,%rsi), %esi
	movl	%esi, %edx
	movb	%sil, 16(%rsp)
	movq	384(%rsp), %rsi
	shrb	%dl
	addb	(%rax,%rsi), %dl
	movb	%dl, (%rdi,%rsi)
	cmpl	380(%rsp), %r15d
	jle	.L1829
	movq	416(%rsp), %rsi
	movzbl	(%rdi,%rsi), %esi
	movl	%esi, %edx
	movb	%sil, 16(%rsp)
	movq	408(%rsp), %rsi
	shrb	%dl
	addb	(%rax,%rsi), %dl
	movb	%dl, (%rdi,%rsi)
	cmpl	400(%rsp), %r15d
	jle	.L1829
	movq	440(%rsp), %rsi
	movzbl	(%rdi,%rsi), %esi
	movl	%esi, %edx
	movb	%sil, 16(%rsp)
	movq	432(%rsp), %rsi
	shrb	%dl
	addb	(%rax,%rsi), %dl
	movb	%dl, (%rdi,%rsi)
	cmpl	424(%rsp), %r15d
	jle	.L1829
	movq	464(%rsp), %rsi
	movzbl	(%rdi,%rsi), %esi
	movl	%esi, %edx
	movb	%sil, 16(%rsp)
	movq	456(%rsp), %rsi
	shrb	%dl
	addb	(%rax,%rsi), %dl
	movb	%dl, (%rdi,%rsi)
	cmpl	448(%rsp), %r15d
	jle	.L1829
	movq	488(%rsp), %rsi
	movzbl	(%rdi,%rsi), %esi
	movl	%esi, %edx
	movb	%sil, 16(%rsp)
	movq	480(%rsp), %rsi
	shrb	%dl
	addb	(%rax,%rsi), %dl
	movb	%dl, (%rdi,%rsi)
	cmpl	472(%rsp), %r15d
	jle	.L1829
	movq	512(%rsp), %rsi
	movzbl	(%rdi,%rsi), %esi
	movl	%esi, %edx
	movb	%sil, 16(%rsp)
	movq	504(%rsp), %rsi
	shrb	%dl
	addb	(%rax,%rsi), %dl
	movb	%dl, (%rdi,%rsi)
	cmpl	496(%rsp), %r15d
	jle	.L1829
	movq	528(%rsp), %rsi
	movzbl	(%rdi,%rsi), %esi
	movl	%esi, %edx
	movb	%sil, 16(%rsp)
	movq	520(%rsp), %rsi
	shrb	%dl
	addb	(%rax,%rsi), %dl
	movb	%dl, (%rdi,%rsi)
	.p2align 4
	.p2align 3
.L1829:
	addq	%r11, %rax
	decl	%r9d
	movb	$-1, (%rdi,%r11)
	jne	.L1822
	movl	260(%rsp), %eax
	movq	536(%rsp), %r14
	imulq	%r11, %rax
	addq	%rax, %r14
	cmpl	$16, 624(%rsp)
	jne	.L1757
.L2174:
	movq	184(%rsp), %rbx
	movl	216(%rsp), %r8d
	movq	192(%rsp), %rax
	addq	24(%rbx), %rax
	testl	%r8d, %r8d
	je	.L1757
.L1884:
	movslq	256(%rsp), %rcx
	movl	216(%rsp), %esi
	movslq	%r15d, %rdx
	leaq	1(%rax,%rdx), %rdx
	xorl	%eax, %eax
	.p2align 4
	.p2align 3
.L1841:
	incl	%eax
	movb	$-1, (%rdx)
	addq	%rcx, %rdx
	cmpl	%eax, %esi
	ja	.L1841
	jmp	.L1757
.L1763:
	movl	260(%rsp), %ecx
	testl	%ecx, %ecx
	je	.L1768
	movslq	256(%rsp), %rsi
	movq	%rax, %rdx
	movslq	%r15d, %rbx
	movq	%rdi, %r9
	movq	%rbx, 280(%rsp)
	movl	%r15d, 144(%rsp)
	movq	%r14, 352(%rsp)
	movl	%ecx, 296(%rsp)
	subq	%rsi, %rdx
	movq	%rsi, %rbx
	subq	%rsi, %r9
	movq	%rsi, 304(%rsp)
	movq	%rdx, 240(%rsp)
	movl	%r15d, %edx
	movl	%r15d, %esi
	negl	%ebx
	shrl	$4, %edx
	movslq	%ebx, %rbx
	andl	$-16, %esi
	decl	%edx
	leaq	(%rax,%rbx), %r11
	movq	%rbx, 264(%rsp)
	movl	%esi, 312(%rsp)
	notq	%rbx
	incq	%rdx
	movq	%rsi, 344(%rsp)
	leal	-1(%r15), %esi
	salq	$4, %rdx
	movq	%rbx, 336(%rsp)
	movl	%esi, %ebx
	movl	%esi, 328(%rsp)
	movq	%rdx, 320(%rsp)
	movq	%rbx, 272(%rsp)
	movq	%r14, %rdx
	movq	%r9, %r15
	movq	%r11, %r14
	.p2align 4
	.p2align 3
.L1811:
	movl	144(%rsp), %r9d
	testl	%r9d, %r9d
	je	.L1820
	leaq	1(%rax), %rsi
	movq	%rdi, %rcx
	leaq	1(%rdx), %r8
	subq	%rsi, %rcx
	movq	%rdi, %rsi
	cmpq	$14, %rcx
	seta	%cl
	subq	%r8, %rsi
	cmpq	$14, %rsi
	seta	%sil
	andl	%ecx, %esi
	cmpq	$14, 336(%rsp)
	seta	%cl
	cmpl	$14, 328(%rsp)
	seta	%r8b
	andl	%r8d, %ecx
	testb	%cl, %sil
	je	.L1812
	leaq	1(%r14), %rsi
	movq	%rdi, %rcx
	subq	%rsi, %rcx
	cmpq	$14, %rcx
	jbe	.L1812
	movq	264(%rsp), %rbx
	movq	320(%rsp), %r8
	xorl	%ecx, %ecx
	leaq	(%rdi,%rbx), %rsi
	.p2align 4
	.p2align 3
.L1813:
	vmovdqu	(%rsi,%rcx), %xmm7
	vmovdqu	(%rax,%rcx), %xmm3
	vmovdqu	(%r14,%rcx), %xmm5
	vmovdqu	(%r14,%rcx), %xmm6
	vpmovzxbw	%xmm7, %xmm13
	vmovdqu	(%rsi,%rcx), %xmm7
	vpmovzxbw	%xmm3, %xmm2
	vmovdqu	(%rax,%rcx), %xmm3
	vpmovzxbw	%xmm5, %xmm9
	vpmovzxwd	%xmm2, %xmm1
	vpsrldq	$8, %xmm2, %xmm2
	vpsrldq	$8, %xmm6, %xmm0
	vpmovzxwd	%xmm13, %xmm15
	vpmovzxwd	%xmm9, %xmm11
	vpmovzxwd	%xmm2, %xmm2
	vpsrldq	$8, %xmm13, %xmm13
	vpaddd	%xmm15, %xmm1, %xmm8
	vpmovzxwd	%xmm13, %xmm13
	vpmovzxbw	%xmm0, %xmm0
	vpsrldq	$8, %xmm9, %xmm9
	vpsubd	%xmm11, %xmm8, %xmm8
	vpmovzxwd	%xmm9, %xmm9
	vpmovzxwd	%xmm0, %xmm10
	vpsrldq	$8, %xmm0, %xmm0
	vpsubd	%xmm15, %xmm8, %xmm15
	vpsubd	%xmm1, %xmm8, %xmm1
	vpsubd	%xmm11, %xmm8, %xmm8
	vpmovzxwd	%xmm0, %xmm5
	vpabsd	%xmm1, %xmm1
	vpabsd	%xmm8, %xmm8
	vmovdqa	%xmm5, (%rsp)
	vpabsd	%xmm15, %xmm15
	vpsrldq	$8, %xmm7, %xmm4
	vpaddd	%xmm13, %xmm2, %xmm7
	vpmovzxbw	%xmm4, %xmm4
	vpsrldq	$8, %xmm3, %xmm0
	vpsubd	%xmm9, %xmm7, %xmm7
	vpmovzxbw	%xmm0, %xmm0
	vpmovzxwd	%xmm4, %xmm12
	vpsrldq	$8, %xmm4, %xmm4
	vpmovzxwd	%xmm0, %xmm3
	vpmovzxwd	%xmm4, %xmm4
	vpsubd	%xmm13, %xmm7, %xmm13
	vpsrldq	$8, %xmm0, %xmm0
	vpsubd	%xmm2, %xmm7, %xmm2
	vpmovzxwd	%xmm0, %xmm0
	vpsubd	%xmm9, %xmm7, %xmm7
	vmovdqa	%xmm15, 64(%rsp)
	vpminsd	%xmm8, %xmm1, %xmm9
	vpaddd	%xmm4, %xmm0, %xmm5
	vpsubd	(%rsp), %xmm5, %xmm5
	vpaddd	%xmm12, %xmm3, %xmm6
	vpcmpgtd	%xmm9, %xmm15, %xmm11
	vpsubd	%xmm10, %xmm6, %xmm6
	vpabsd	%xmm2, %xmm2
	vmovdqa	%xmm11, 32(%rsp)
	vpcmpeqd	%xmm9, %xmm1, %xmm15
	vpand	32(%rsp), %xmm15, %xmm15
	vpabsd	%xmm7, %xmm7
	vpsubd	%xmm12, %xmm6, %xmm12
	vpabsd	%xmm13, %xmm13
	vpsubd	%xmm3, %xmm6, %xmm3
	vpsubd	%xmm10, %xmm6, %xmm6
	vpminsd	%xmm7, %xmm2, %xmm10
	vpabsd	%xmm12, %xmm12
	vpcmpgtd	%xmm8, %xmm1, %xmm1
	vpcmpgtd	%xmm10, %xmm13, %xmm11
	vmovdqa	%xmm12, 16(%rsp)
	vpabsd	%xmm3, %xmm3
	vpand	32(%rsp), %xmm1, %xmm1
	vmovdqa	%xmm11, 48(%rsp)
	vmovdqa	16(%rsp), %xmm11
	vpsubd	%xmm4, %xmm5, %xmm4
	vpsubd	%xmm0, %xmm5, %xmm0
	vpsubd	(%rsp), %xmm5, %xmm5
	vmovdqa	%xmm10, (%rsp)
	vpabsd	%xmm4, %xmm12
	vpabsd	%xmm6, %xmm4
	vmovdqa	%xmm15, 96(%rsp)
	vpcmpeqd	(%rsp), %xmm2, %xmm15
	vpand	48(%rsp), %xmm15, %xmm15
	vmovdqa	%xmm4, 80(%rsp)
	vpcmpgtd	%xmm7, %xmm2, %xmm2
	vpminsd	%xmm4, %xmm3, %xmm4
	vpabsd	%xmm0, %xmm0
	vmovdqa	64(%rsp), %xmm7
	vpand	48(%rsp), %xmm2, %xmm2
	vpand	%xmm1, %xmm14, %xmm1
	vpcmpgtd	%xmm4, %xmm11, %xmm11
	vpabsd	%xmm5, %xmm5
	vpminsd	%xmm5, %xmm0, %xmm6
	vpcmpgtd	%xmm5, %xmm0, %xmm5
	vmovdqa	%xmm15, 112(%rsp)
	vpcmpeqd	%xmm4, %xmm3, %xmm15
	vpcmpgtd	%xmm6, %xmm12, %xmm10
	vpand	%xmm11, %xmm15, %xmm15
	vpcmpgtd	80(%rsp), %xmm3, %xmm3
	vpminsd	%xmm7, %xmm9, %xmm9
	vmovdqa	%xmm15, 128(%rsp)
	vpcmpeqd	%xmm6, %xmm0, %xmm15
	vpminsd	(%rsp), %xmm13, %xmm0
	vpcmpeqd	%xmm7, %xmm9, %xmm9
	vmovdqa	16(%rsp), %xmm7
	vpminsd	%xmm6, %xmm12, %xmm6
	vpand	%xmm11, %xmm3, %xmm3
	vpcmpeqd	%xmm6, %xmm12, %xmm6
	vpand	%xmm9, %xmm14, %xmm9
	vpand	%xmm10, %xmm5, %xmm5
	vpand	%xmm6, %xmm14, %xmm6
	vpand	%xmm2, %xmm14, %xmm2
	vpand	%xmm3, %xmm14, %xmm3
	vpand	%xmm5, %xmm14, %xmm5
	vpackusdw	%xmm2, %xmm1, %xmm1
	vpackusdw	%xmm5, %xmm3, %xmm3
	vpand	%xmm10, %xmm15, %xmm15
	vpand	%xmm15, %xmm14, %xmm15
	vpcmpeqd	%xmm0, %xmm13, %xmm0
	vpminsd	%xmm7, %xmm4, %xmm4
	vpand	%xmm0, %xmm14, %xmm0
	vpcmpeqd	%xmm7, %xmm4, %xmm4
	vpackusdw	%xmm0, %xmm9, %xmm0
	vpand	.LC2(%rip), %xmm0, %xmm0
	vmovdqu	(%r14,%rcx), %xmm7
	vpand	%xmm4, %xmm14, %xmm4
	vpackusdw	%xmm6, %xmm4, %xmm4
	vpand	.LC2(%rip), %xmm4, %xmm4
	vpackuswb	%xmm4, %xmm0, %xmm0
	vpblendvb	%xmm0, (%rsi,%rcx), %xmm7, %xmm0
	vpand	.LC2(%rip), %xmm1, %xmm1
	vpand	.LC2(%rip), %xmm3, %xmm3
	vpand	112(%rsp), %xmm14, %xmm2
	vpackuswb	%xmm3, %xmm1, %xmm1
	vpblendvb	%xmm1, %xmm7, %xmm0, %xmm0
	vpand	96(%rsp), %xmm14, %xmm1
	vpackusdw	%xmm2, %xmm1, %xmm1
	vpand	128(%rsp), %xmm14, %xmm2
	vpand	.LC2(%rip), %xmm1, %xmm1
	vpackusdw	%xmm15, %xmm2, %xmm2
	vpand	.LC2(%rip), %xmm2, %xmm2
	vpackuswb	%xmm2, %xmm1, %xmm1
	vpblendvb	%xmm1, (%rax,%rcx), %xmm0, %xmm0
	vpaddb	(%rdx,%rcx), %xmm0, %xmm0
	vmovdqu	%xmm0, (%rdi,%rcx)
	addq	$16, %rcx
	cmpq	%rcx, %r8
	jne	.L1813
	movl	312(%rsp), %esi
	cmpl	%esi, 144(%rsp)
	je	.L1820
	movq	%r14, (%rsp)
	movq	344(%rsp), %rsi
	movq	240(%rsp), %r14
	jmp	.L1816
	.p2align 4
	.p2align 3
.L1815:
	cmpl	%r9d, %r10d
	cmovle	%ebp, %r8d
.L1817:
	addl	%r13d, %r8d
	movb	%r8b, (%rdi,%rsi)
	incq	%rsi
	cmpl	%esi, 144(%rsp)
	jle	.L2173
.L1816:
	movzbl	(%rax,%rsi), %r10d
	movzbl	(%r15,%rsi), %ebx
	movzbl	(%r14,%rsi), %r9d
	movzbl	(%rdx,%rsi), %r13d
	movl	%r10d, %ebp
	leal	(%r10,%rbx), %ecx
	movl	%r9d, %r8d
	subl	%r9d, %ecx
	movl	%ecx, %r11d
	subl	%r10d, %r11d
	movl	%r11d, %r10d
	negl	%r10d
	cmovs	%r11d, %r10d
	movl	%ecx, %r11d
	subl	%r9d, %r11d
	movl	%r11d, %r9d
	negl	%r9d
	cmovs	%r11d, %r9d
	subl	%ebx, %ecx
	movl	%ecx, %r11d
	negl	%r11d
	cmovns	%r11d, %ecx
	cmpl	%r9d, %r10d
	movl	%r9d, %r11d
	cmovle	%r10d, %r11d
	cmpl	%r11d, %ecx
	jg	.L1815
	movl	%ebx, %r8d
	jmp	.L1817
.L1764:
	movl	260(%rsp), %r11d
	testl	%r11d, %r11d
	je	.L1768
	movslq	256(%rsp), %r12
	movslq	%r15d, %rbp
	movl	%r12d, %edx
	negl	%edx
	movslq	%edx, %rcx
	movl	%r15d, %edx
	leaq	(%rdi,%rcx), %rbx
	shrl	$4, %edx
	notq	%rcx
	movq	%rbx, 424(%rsp)
	movl	%r15d, %ebx
	leal	-1(%rdx), %r9d
	andl	$-16, %ebx
	incq	%r9
	movl	%ebx, %edx
	leal	1(%rbx), %r10d
	leal	2(%rbx), %r8d
	leal	3(%rbx), %edi
	subl	%r12d, %edx
	movl	%edi, 112(%rsp)
	movq	%rdi, 240(%rsp)
	movl	%ebx, %r13d
	movslq	%edx, %rdx
	movl	%r10d, 48(%rsp)
	movl	%r8d, 80(%rsp)
	salq	$4, %r9
	movq	%rdx, 64(%rsp)
	movq	%r10, %rdx
	subl	%r12d, %edx
	movslq	%edx, %rdx
	movq	%rdx, 96(%rsp)
	movq	%r8, %rdx
	subl	%r12d, %edx
	movslq	%edx, %rdx
	movq	%rdx, 128(%rsp)
	movq	%rdi, %rdx
	subl	%r12d, %edx
	movslq	%edx, %rdi
	movq	%rdi, 264(%rsp)
	leal	4(%rbx), %edi
	movq	%rdi, %rdx
	movl	%edi, 144(%rsp)
	movq	%rdi, 280(%rsp)
	subl	%r12d, %edx
	movslq	%edx, %rdi
	movq	%rdi, 296(%rsp)
	leal	5(%rbx), %edi
	movq	%rdi, %rdx
	movl	%edi, 272(%rsp)
	movq	%rdi, 312(%rsp)
	subl	%r12d, %edx
	movslq	%edx, %rdi
	movq	%rdi, 320(%rsp)
	leal	6(%rbx), %edi
	movq	%rdi, %rdx
	movl	%edi, 304(%rsp)
	movq	%rdi, 336(%rsp)
	subl	%r12d, %edx
	movslq	%edx, %rdi
	movq	%rdi, 344(%rsp)
	leal	7(%rbx), %edi
	movq	%rdi, %rdx
	movl	%edi, 328(%rsp)
	movq	%rdi, 360(%rsp)
	subl	%r12d, %edx
	movslq	%edx, %rdi
	movq	%rdi, 368(%rsp)
	leal	8(%rbx), %edi
	movq	%rdi, %rdx
	movl	%edi, 352(%rsp)
	movq	%rdi, 384(%rsp)
	subl	%r12d, %edx
	movslq	%edx, %rdi
	movq	%rdi, 392(%rsp)
	leal	9(%rbx), %edi
	movq	%rdi, %rdx
	movl	%edi, 380(%rsp)
	movq	%rdi, 408(%rsp)
	subl	%r12d, %edx
	movslq	%edx, %rdi
	movq	%rdi, 416(%rsp)
	leal	10(%rbx), %edi
	movq	%rdi, %rdx
	movl	%edi, 400(%rsp)
	movq	%rdi, 440(%rsp)
	subl	%r12d, %edx
	movslq	%edx, %rdi
	movq	%rdi, 448(%rsp)
	leal	11(%rbx), %edi
	movq	%rdi, %rdx
	movl	%edi, 432(%rsp)
	movq	%rdi, 464(%rsp)
	vmovdqa	.LC11(%rip), %xmm2
	subl	%r12d, %edx
	movl	%ebx, 32(%rsp)
	movq	%r14, 552(%rsp)
	movslq	%edx, %rdi
	movq	%rcx, 16(%rsp)
	movq	%rdi, 472(%rsp)
	leal	12(%rbx), %edi
	vmovdqa	.LC12(%rip), %xmm3
	movq	%rdi, %rdx
	movl	%edi, 456(%rsp)
	movq	%rdi, 488(%rsp)
	subl	%r12d, %edx
	movslq	%edx, %rdi
	movq	%rdi, 496(%rsp)
	leal	13(%rbx), %edi
	movq	%rdi, %rdx
	movl	%edi, 480(%rsp)
	movq	%rdi, 520(%rsp)
	subl	%r12d, %edx
	movslq	%edx, %rdi
	movq	%rdi, 528(%rsp)
	leal	14(%rbx), %edi
	movq	%r10, %rbx
	movq	%rdi, %rdx
	movl	%edi, 512(%rsp)
	movq	%rdi, 536(%rsp)
	subl	%r12d, %edx
	movslq	%edx, %rdi
	movq	%r14, %rdx
	movq	%r8, %r14
	movq	%rdi, 544(%rsp)
	leal	-1(%r15), %edi
	movl	%edi, (%rsp)
	movq	%rdi, 504(%rsp)
	movq	424(%rsp), %rdi
	.p2align 4
	.p2align 3
.L1803:
	movq	%rdi, %r8
	addq	%r12, %rdi
	testl	%r15d, %r15d
	je	.L1810
	leaq	1(%rax), %rsi
	movq	%rdi, %rcx
	leaq	1(%rdx), %r10
	subq	%rsi, %rcx
	movq	%rdi, %rsi
	cmpq	$14, %rcx
	seta	%cl
	subq	%r10, %rsi
	cmpq	$14, %rsi
	seta	%sil
	testb	%sil, %cl
	je	.L1804
	cmpq	$14, 16(%rsp)
	seta	%sil
	cmpl	$14, (%rsp)
	seta	%cl
	testb	%cl, %sil
	je	.L1804
	addq	$0, %r8
	xorl	%ecx, %ecx
	.p2align 4
	.p2align 3
.L1805:
	vmovdqu	(%rax,%rcx), %xmm6
	vmovdqu	(%rax,%rcx), %xmm5
	vpsrlw	$1, %xmm6, %xmm0
	vmovdqu	(%r8,%rcx), %xmm6
	vpand	%xmm0, %xmm2, %xmm0
	vpsrlw	$1, %xmm6, %xmm1
	vpand	%xmm1, %xmm2, %xmm1
	vpaddb	%xmm1, %xmm0, %xmm0
	vpand	(%r8,%rcx), %xmm5, %xmm1
	vpaddb	(%rdx,%rcx), %xmm0, %xmm0
	vpand	%xmm3, %xmm1, %xmm1
	vpaddb	%xmm1, %xmm0, %xmm0
	vmovdqu	%xmm0, (%rdi,%rcx)
	addq	$16, %rcx
	cmpq	%rcx, %r9
	jne	.L1805
	cmpl	32(%rsp), %r15d
	je	.L1810
	movq	64(%rsp), %rsi
	movzbl	(%rax,%r13), %ecx
	movzbl	(%rdi,%rsi), %esi
	addl	%esi, %ecx
	sarl	%ecx
	addb	(%rdx,%r13), %cl
	movb	%cl, (%rdi,%r13)
	cmpl	48(%rsp), %r15d
	jle	.L1810
	movq	96(%rsp), %rsi
	movzbl	(%rax,%rbx), %ecx
	movzbl	(%rdi,%rsi), %esi
	addl	%esi, %ecx
	sarl	%ecx
	addb	(%rdx,%rbx), %cl
	movb	%cl, (%rdi,%rbx)
	cmpl	80(%rsp), %r15d
	jle	.L1810
	movq	128(%rsp), %rsi
	movzbl	(%rax,%r14), %ecx
	movzbl	(%rdi,%rsi), %esi
	addl	%esi, %ecx
	sarl	%ecx
	addb	(%rdx,%r14), %cl
	movb	%cl, (%rdi,%r14)
	cmpl	112(%rsp), %r15d
	jle	.L1810
	movq	240(%rsp), %r10
	movq	264(%rsp), %rsi
	movzbl	(%rax,%r10), %ecx
	movzbl	(%rdi,%rsi), %esi
	addl	%esi, %ecx
	sarl	%ecx
	addb	(%rdx,%r10), %cl
	movb	%cl, (%rdi,%r10)
	cmpl	144(%rsp), %r15d
	jle	.L1810
	movq	280(%rsp), %r10
	movq	296(%rsp), %rsi
	movzbl	(%rax,%r10), %ecx
	movzbl	(%rdi,%rsi), %esi
	addl	%esi, %ecx
	sarl	%ecx
	addb	(%rdx,%r10), %cl
	movb	%cl, (%rdi,%r10)
	cmpl	272(%rsp), %r15d
	jle	.L1810
	movq	312(%rsp), %r10
	movq	320(%rsp), %rsi
	movzbl	(%rax,%r10), %ecx
	movzbl	(%rdi,%rsi), %esi
	addl	%esi, %ecx
	sarl	%ecx
	addb	(%rdx,%r10), %cl
	movb	%cl, (%rdi,%r10)
	cmpl	304(%rsp), %r15d
	jle	.L1810
	movq	336(%rsp), %r10
	movq	344(%rsp), %rsi
	movzbl	(%rax,%r10), %ecx
	movzbl	(%rdi,%rsi), %esi
	addl	%esi, %ecx
	sarl	%ecx
	addb	(%rdx,%r10), %cl
	movb	%cl, (%rdi,%r10)
	cmpl	328(%rsp), %r15d
	jle	.L1810
	movq	360(%rsp), %r10
	movq	368(%rsp), %rsi
	movzbl	(%rax,%r10), %ecx
	movzbl	(%rdi,%rsi), %esi
	addl	%esi, %ecx
	sarl	%ecx
	addb	(%rdx,%r10), %cl
	movb	%cl, (%rdi,%r10)
	cmpl	352(%rsp), %r15d
	jle	.L1810
	movq	384(%rsp), %r10
	movq	392(%rsp), %rsi
	movzbl	(%rax,%r10), %ecx
	movzbl	(%rdi,%rsi), %esi
	addl	%esi, %ecx
	sarl	%ecx
	addb	(%rdx,%r10), %cl
	movb	%cl, (%rdi,%r10)
	cmpl	380(%rsp), %r15d
	jle	.L1810
	movq	408(%rsp), %r10
	movq	416(%rsp), %rsi
	movzbl	(%rax,%r10), %ecx
	movzbl	(%rdi,%rsi), %esi
	addl	%esi, %ecx
	sarl	%ecx
	addb	(%rdx,%r10), %cl
	movb	%cl, (%rdi,%r10)
	cmpl	400(%rsp), %r15d
	jle	.L1810
	movq	440(%rsp), %r10
	movq	448(%rsp), %rsi
	movzbl	(%rax,%r10), %ecx
	movzbl	(%rdi,%rsi), %esi
	addl	%esi, %ecx
	sarl	%ecx
	addb	(%rdx,%r10), %cl
	movb	%cl, (%rdi,%r10)
	cmpl	432(%rsp), %r15d
	jle	.L1810
	movq	464(%rsp), %r10
	movq	472(%rsp), %rsi
	movzbl	(%rax,%r10), %ecx
	movzbl	(%rdi,%rsi), %esi
	addl	%esi, %ecx
	sarl	%ecx
	addb	(%rdx,%r10), %cl
	movb	%cl, (%rdi,%r10)
	cmpl	456(%rsp), %r15d
	jle	.L1810
	movq	488(%rsp), %r10
	movq	496(%rsp), %rsi
	movzbl	(%rax,%r10), %ecx
	movzbl	(%rdi,%rsi), %esi
	addl	%esi, %ecx
	sarl	%ecx
	addb	(%rdx,%r10), %cl
	movb	%cl, (%rdi,%r10)
	cmpl	480(%rsp), %r15d
	jle	.L1810
	movq	520(%rsp), %r10
	movq	528(%rsp), %rsi
	movzbl	(%rax,%r10), %ecx
	movzbl	(%rdi,%rsi), %esi
	addl	%esi, %ecx
	sarl	%ecx
	addb	(%rdx,%r10), %cl
	movb	%cl, (%rdi,%r10)
	cmpl	512(%rsp), %r15d
	jle	.L1810
	movq	536(%rsp), %r8
	movq	544(%rsp), %rsi
	movzbl	(%rax,%r8), %ecx
	movzbl	(%rdi,%rsi), %esi
	addl	%esi, %ecx
	sarl	%ecx
	addb	(%rdx,%r8), %cl
	movb	%cl, (%rdi,%r8)
	.p2align 4
	.p2align 3
.L1810:
	addq	%rbp, %rdx
	addq	%r12, %rax
	decl	%r11d
	movb	$-1, (%rdi,%rbp)
	jne	.L1803
	movl	260(%rsp), %eax
	movq	552(%rsp), %r14
	imulq	%rbp, %rax
	addq	%rax, %r14
	jmp	.L1759
.L1765:
	movl	260(%rsp), %r9d
	testl	%r9d, %r9d
	je	.L1768
	movl	%r15d, %edx
	movl	%r15d, %ecx
	movslq	256(%rsp), %rbx
	leal	-1(%r15), %r12d
	shrl	$4, %edx
	andl	$15, %ecx
	movl	%r15d, %ebp
	movq	%r14, 16(%rsp)
	leal	-1(%rdx), %esi
	leal	-1(%rcx), %r10d
	movq	%r14, %rdx
	movslq	%r15d, %r11
	incq	%rsi
	movq	%r12, %r13
	andl	$-16, %ebp
	movl	%r10d, (%rsp)
	salq	$4, %rsi
	movl	%ecx, %r14d
	.p2align 4
	.p2align 3
.L1792:
	testl	%r15d, %r15d
	je	.L1802
	leaq	1(%rax), %r8
	movq	%rdi, %rcx
	leaq	1(%rdx), %r10
	subq	%r8, %rcx
	movq	%rdi, %r8
	cmpq	$14, %rcx
	seta	%cl
	subq	%r10, %r8
	cmpq	$14, %r8
	seta	%r8b
	testb	%r8b, %cl
	je	.L1793
	cmpl	$6, %r13d
	jbe	.L1793
	cmpl	$14, %r13d
	jbe	.L1896
	xorl	%ecx, %ecx
	.p2align 4
	.p2align 3
.L1795:
	vmovdqu	(%rdx,%rcx), %xmm5
	vpaddb	(%rax,%rcx), %xmm5, %xmm0
	vmovdqu	%xmm0, (%rdi,%rcx)
	addq	$16, %rcx
	cmpq	%rcx, %rsi
	jne	.L1795
	cmpl	%ebp, %r15d
	je	.L1802
	cmpl	$6, (%rsp)
	movl	%r14d, %r10d
	jbe	.L1897
	movl	%ebp, %r8d
	movl	%ebp, %ecx
.L1794:
	vmovq	(%rdx,%r8), %xmm0
	vmovq	(%rax,%r8), %xmm1
	vpaddb	%xmm1, %xmm0, %xmm0
	vmovq	%xmm0, (%rdi,%r8)
	movl	%r10d, %r8d
	andl	$-8, %r8d
	addl	%r8d, %ecx
	cmpl	%r10d, %r8d
	je	.L1802
.L1797:
	movslq	%ecx, %r8
	movzbl	(%rax,%r8), %r10d
	addb	(%rdx,%r8), %r10b
	movb	%r10b, (%rdi,%r8)
	leal	1(%rcx), %r8d
	cmpl	%r8d, %r15d
	jle	.L1802
	movslq	%r8d, %r8
	movzbl	(%rax,%r8), %r10d
	addb	(%rdx,%r8), %r10b
	movb	%r10b, (%rdi,%r8)
	leal	2(%rcx), %r8d
	cmpl	%r8d, %r15d
	jle	.L1802
	movslq	%r8d, %r8
	movzbl	(%rax,%r8), %r10d
	addb	(%rdx,%r8), %r10b
	movb	%r10b, (%rdi,%r8)
	leal	3(%rcx), %r8d
	cmpl	%r8d, %r15d
	jle	.L1802
	movslq	%r8d, %r8
	movzbl	(%rax,%r8), %r10d
	addb	(%rdx,%r8), %r10b
	movb	%r10b, (%rdi,%r8)
	leal	4(%rcx), %r8d
	cmpl	%r8d, %r15d
	jle	.L1802
	movslq	%r8d, %r8
	movzbl	(%rax,%r8), %r10d
	addb	(%rdx,%r8), %r10b
	movb	%r10b, (%rdi,%r8)
	leal	5(%rcx), %r8d
	cmpl	%r8d, %r15d
	jle	.L1802
	movslq	%r8d, %r8
	addl	$6, %ecx
	movzbl	(%rax,%r8), %r10d
	addb	(%rdx,%r8), %r10b
	movb	%r10b, (%rdi,%r8)
	cmpl	%ecx, %r15d
	jle	.L1802
	movslq	%ecx, %rcx
	movzbl	(%rax,%rcx), %r8d
	addb	(%rdx,%rcx), %r8b
	movb	%r8b, (%rdi,%rcx)
.L1802:
	movb	$-1, (%rdi,%r11)
	addq	%r11, %rdx
	addq	%rbx, %rdi
	addq	%rbx, %rax
	decl	%r9d
	jne	.L1792
	movl	260(%rsp), %eax
	movq	16(%rsp), %r14
	imulq	%r11, %rax
	addq	%rax, %r14
	jmp	.L1759
.L1767:
	movl	260(%rsp), %r9d
	testl	%r9d, %r9d
	je	.L1768
	movl	%r15d, %eax
	movl	%r15d, %edx
	movslq	256(%rsp), %r13
	leal	-1(%r15), %ebp
	shrl	$4, %eax
	andl	$15, %edx
	movl	%r15d, %ebx
	movl	%ecx, 16(%rsp)
	leal	-1(%rax), %esi
	leal	-1(%rdx), %r10d
	movq	%r14, %rax
	movq	%r14, (%rsp)
	incq	%rsi
	movslq	%r15d, %r11
	movq	%rbp, %r12
	andl	$-16, %ebx
	salq	$4, %rsi
	movl	%edx, %ecx
	movl	%r10d, %r14d
	.p2align 4
	.p2align 3
.L1769:
	testl	%r15d, %r15d
	je	.L1780
	leaq	1(%rax), %r8
	movq	%rdi, %rdx
	subq	%r8, %rdx
	cmpq	$14, %rdx
	jbe	.L1770
	cmpl	$6, %r12d
	jbe	.L1770
	cmpl	$14, %r12d
	jbe	.L1892
	xorl	%edx, %edx
	.p2align 4
	.p2align 3
.L1772:
	vmovdqu	(%rax,%rdx), %xmm3
	vmovdqu	%xmm3, (%rdi,%rdx)
	addq	$16, %rdx
	cmpq	%rdx, %rsi
	jne	.L1772
	cmpl	%ebx, %r15d
	je	.L1780
	movl	%ecx, %r10d
	cmpl	$6, %r14d
	jbe	.L1893
	movl	%ebx, %r8d
	movl	%ebx, %edx
.L1771:
	vmovq	(%rax,%r8), %xmm0
	vmovq	%xmm0, (%rdi,%r8)
	movl	%r10d, %r8d
	andl	$-8, %r8d
	addl	%r8d, %edx
	cmpl	%r10d, %r8d
	je	.L1780
.L1774:
	movslq	%edx, %r8
	movzbl	(%rax,%r8), %r10d
	movb	%r10b, (%rdi,%r8)
	leal	1(%rdx), %r8d
	cmpl	%r8d, %r15d
	jle	.L1780
	movslq	%r8d, %r8
	movzbl	(%rax,%r8), %r10d
	movb	%r10b, (%rdi,%r8)
	leal	2(%rdx), %r8d
	cmpl	%r8d, %r15d
	jle	.L1780
	movslq	%r8d, %r8
	movzbl	(%rax,%r8), %r10d
	movb	%r10b, (%rdi,%r8)
	leal	3(%rdx), %r8d
	cmpl	%r8d, %r15d
	jle	.L1780
	movslq	%r8d, %r8
	movzbl	(%rax,%r8), %r10d
	movb	%r10b, (%rdi,%r8)
	leal	4(%rdx), %r8d
	cmpl	%r8d, %r15d
	jle	.L1780
	movslq	%r8d, %r8
	movzbl	(%rax,%r8), %r10d
	movb	%r10b, (%rdi,%r8)
	leal	5(%rdx), %r8d
	cmpl	%r8d, %r15d
	jle	.L1780
	movslq	%r8d, %r8
	addl	$6, %edx
	movzbl	(%rax,%r8), %r10d
	movb	%r10b, (%rdi,%r8)
	cmpl	%edx, %r15d
	jle	.L1780
	movslq	%edx, %rdx
	movzbl	(%rax,%rdx), %r8d
	movb	%r8b, (%rdi,%rdx)
.L1780:
	movb	$-1, (%rdi,%r11)
	addq	%r11, %rax
	addq	%r13, %rdi
	decl	%r9d
	jne	.L1769
	movl	260(%rsp), %eax
	movq	(%rsp), %r14
	imulq	%r11, %rax
	addq	%rax, %r14
	jmp	.L1759
.L1766:
	movl	260(%rsp), %r8d
	testl	%r8d, %r8d
	je	.L1768
	movslq	256(%rsp), %rbx
	movl	%r15d, %eax
	movl	%r15d, %ebp
	movslq	%r15d, %r9
	shrl	$4, %eax
	leal	-1(%r15), %r10d
	andl	$-16, %ebp
	movq	%r14, 48(%rsp)
	leal	-1(%rax), %esi
	movq	%r14, %rax
	incq	%rsi
	movl	%ebx, %r11d
	movq	%rbx, %r12
	salq	$4, %rsi
	negl	%r11d
	movslq	%r11d, %r11
	movq	%r11, %rdx
	addq	%r11, %rdi
	notq	%rdx
	movq	%rdx, (%rsp)
	movl	%r15d, %edx
	andl	$15, %edx
	movl	%edx, 16(%rsp)
	decl	%edx
	movl	%edx, 32(%rsp)
	.p2align 4
	.p2align 3
.L1781:
	movq	%rdi, %rcx
	addq	%rbx, %rdi
	testl	%r15d, %r15d
	je	.L1791
	cmpq	$14, (%rsp)
	seta	%r13b
	cmpl	$6, %r10d
	seta	%dl
	testb	%dl, %r13b
	je	.L1782
	leaq	1(%rax), %r13
	movq	%rdi, %rdx
	subq	%r13, %rdx
	cmpq	$14, %rdx
	jbe	.L1782
	cmpl	$14, %r10d
	jbe	.L1894
	addq	$0, %rcx
	xorl	%edx, %edx
	.p2align 4
	.p2align 3
.L1784:
	vmovdqu	(%rax,%rdx), %xmm6
	vpaddb	(%rcx,%rdx), %xmm6, %xmm0
	vmovdqu	%xmm0, (%rdi,%rdx)
	addq	$16, %rdx
	cmpq	%rdx, %rsi
	jne	.L1784
	cmpl	%ebp, %r15d
	je	.L1791
	cmpl	$6, 32(%rsp)
	movl	16(%rsp), %r13d
	jbe	.L1895
	movl	%ebp, %ecx
	movl	%ebp, %edx
.L1783:
	leaq	(%rdi,%rcx), %r14
	vmovq	(%rax,%rcx), %xmm1
	vmovq	(%r14,%r11), %xmm0
	vpaddb	%xmm1, %xmm0, %xmm0
	vmovq	%xmm0, (%rdi,%rcx)
	movl	%r13d, %ecx
	andl	$-8, %ecx
	addl	%ecx, %edx
	cmpl	%r13d, %ecx
	je	.L1791
.L1786:
	movl	%edx, %ecx
	movslq	%edx, %r13
	subl	%r12d, %ecx
	movzbl	(%rax,%r13), %r14d
	movslq	%ecx, %rcx
	addb	(%rdi,%rcx), %r14b
	leal	1(%rdx), %ecx
	movb	%r14b, (%rdi,%r13)
	cmpl	%ecx, %r15d
	jle	.L1791
	movslq	%ecx, %r13
	subl	%r12d, %ecx
	movslq	%ecx, %rcx
	movzbl	(%rax,%r13), %r14d
	addb	(%rdi,%rcx), %r14b
	leal	2(%rdx), %ecx
	movb	%r14b, (%rdi,%r13)
	cmpl	%ecx, %r15d
	jle	.L1791
	movslq	%ecx, %r13
	subl	%r12d, %ecx
	movslq	%ecx, %rcx
	movzbl	(%rax,%r13), %r14d
	addb	(%rdi,%rcx), %r14b
	leal	3(%rdx), %ecx
	movb	%r14b, (%rdi,%r13)
	cmpl	%ecx, %r15d
	jle	.L1791
	movslq	%ecx, %r13
	subl	%r12d, %ecx
	movslq	%ecx, %rcx
	movzbl	(%rax,%r13), %r14d
	addb	(%rdi,%rcx), %r14b
	leal	4(%rdx), %ecx
	movb	%r14b, (%rdi,%r13)
	cmpl	%ecx, %r15d
	jle	.L1791
	movslq	%ecx, %r13
	subl	%r12d, %ecx
	movslq	%ecx, %rcx
	movzbl	(%rax,%r13), %r14d
	addb	(%rdi,%rcx), %r14b
	leal	5(%rdx), %ecx
	movb	%r14b, (%rdi,%r13)
	cmpl	%ecx, %r15d
	jle	.L1791
	movslq	%ecx, %r13
	subl	%r12d, %ecx
	addl	$6, %edx
	movslq	%ecx, %rcx
	movzbl	(%rax,%r13), %r14d
	addb	(%rdi,%rcx), %r14b
	movb	%r14b, (%rdi,%r13)
	cmpl	%edx, %r15d
	jle	.L1791
	movslq	%edx, %rcx
	subl	%r12d, %edx
	movslq	%edx, %rdx
	movzbl	(%rax,%rcx), %r13d
	addb	(%rdi,%rdx), %r13b
	movb	%r13b, (%rdi,%rcx)
.L1791:
	addq	%r9, %rax
	decl	%r8d
	movb	$-1, (%rdi,%r9)
	jne	.L1781
.L2157:
	movl	260(%rsp), %eax
	movq	48(%rsp), %r14
	imulq	%r9, %rax
	addq	%rax, %r14
.L1759:
	cmpl	$16, 624(%rsp)
	jne	.L1757
	jmp	.L2174
.L1760:
	movl	260(%rsp), %r8d
	testl	%r8d, %r8d
	je	.L1768
	movslq	256(%rsp), %rbx
	movl	%r15d, %eax
	movl	%r15d, %ebp
	movslq	%r15d, %r9
	shrl	$4, %eax
	leal	-1(%r15), %r10d
	andl	$-16, %ebp
	movq	%r14, 48(%rsp)
	leal	-1(%rax), %esi
	movq	%r14, %rax
	incq	%rsi
	movl	%ebx, %r11d
	movq	%rbx, %r12
	salq	$4, %rsi
	negl	%r11d
	movslq	%r11d, %r11
	movq	%r11, %rdx
	addq	%r11, %rdi
	notq	%rdx
	movq	%rdx, (%rsp)
	movl	%r15d, %edx
	andl	$15, %edx
	movl	%edx, 16(%rsp)
	decl	%edx
	movl	%edx, 32(%rsp)
	.p2align 4
	.p2align 3
.L1830:
	movq	%rdi, %rcx
	addq	%rbx, %rdi
	testl	%r15d, %r15d
	je	.L1840
	cmpq	$14, (%rsp)
	seta	%r13b
	cmpl	$6, %r10d
	seta	%dl
	testb	%dl, %r13b
	je	.L1831
	leaq	1(%rax), %r13
	movq	%rdi, %rdx
	subq	%r13, %rdx
	cmpq	$14, %rdx
	jbe	.L1831
	cmpl	$14, %r10d
	jbe	.L1900
	addq	$0, %rcx
	xorl	%edx, %edx
	.p2align 4
	.p2align 3
.L1833:
	vmovdqu	(%rax,%rdx), %xmm3
	vpaddb	(%rcx,%rdx), %xmm3, %xmm0
	vmovdqu	%xmm0, (%rdi,%rdx)
	addq	$16, %rdx
	cmpq	%rsi, %rdx
	jne	.L1833
	cmpl	%ebp, %r15d
	je	.L1840
	cmpl	$6, 32(%rsp)
	movl	16(%rsp), %r13d
	jbe	.L1901
	movl	%ebp, %ecx
	movl	%ebp, %edx
.L1832:
	leaq	(%rdi,%rcx), %r14
	vmovq	(%rax,%rcx), %xmm1
	vmovq	(%r14,%r11), %xmm0
	vpaddb	%xmm1, %xmm0, %xmm0
	vmovq	%xmm0, (%rdi,%rcx)
	movl	%r13d, %ecx
	andl	$-8, %ecx
	addl	%ecx, %edx
	cmpl	%r13d, %ecx
	je	.L1840
.L1835:
	movl	%edx, %ecx
	movslq	%edx, %r13
	subl	%r12d, %ecx
	movzbl	(%rax,%r13), %r14d
	movslq	%ecx, %rcx
	addb	(%rdi,%rcx), %r14b
	leal	1(%rdx), %ecx
	movb	%r14b, (%rdi,%r13)
	cmpl	%ecx, %r15d
	jle	.L1840
	movslq	%ecx, %r13
	subl	%r12d, %ecx
	movslq	%ecx, %rcx
	movzbl	(%rax,%r13), %r14d
	addb	(%rdi,%rcx), %r14b
	leal	2(%rdx), %ecx
	movb	%r14b, (%rdi,%r13)
	cmpl	%ecx, %r15d
	jle	.L1840
	movslq	%ecx, %r13
	subl	%r12d, %ecx
	movslq	%ecx, %rcx
	movzbl	(%rax,%r13), %r14d
	addb	(%rdi,%rcx), %r14b
	leal	3(%rdx), %ecx
	movb	%r14b, (%rdi,%r13)
	cmpl	%ecx, %r15d
	jle	.L1840
	movslq	%ecx, %r13
	subl	%r12d, %ecx
	movslq	%ecx, %rcx
	movzbl	(%rax,%r13), %r14d
	addb	(%rdi,%rcx), %r14b
	leal	4(%rdx), %ecx
	movb	%r14b, (%rdi,%r13)
	cmpl	%ecx, %r15d
	jle	.L1840
	movslq	%ecx, %r13
	subl	%r12d, %ecx
	movslq	%ecx, %rcx
	movzbl	(%rax,%r13), %r14d
	addb	(%rdi,%rcx), %r14b
	leal	5(%rdx), %ecx
	movb	%r14b, (%rdi,%r13)
	cmpl	%ecx, %r15d
	jle	.L1840
	movslq	%ecx, %r13
	subl	%r12d, %ecx
	addl	$6, %edx
	movslq	%ecx, %rcx
	movzbl	(%rax,%r13), %r14d
	addb	(%rdi,%rcx), %r14b
	movb	%r14b, (%rdi,%r13)
	cmpl	%edx, %r15d
	jle	.L1840
	movslq	%edx, %rcx
	subl	%r12d, %edx
	movslq	%edx, %rdx
	movzbl	(%rax,%rcx), %r13d
	addb	(%rdi,%rdx), %r13b
	movb	%r13b, (%rdi,%rcx)
.L1840:
	addq	%r9, %rax
	decl	%r8d
	movb	$-1, (%rdi,%r9)
	jne	.L1830
	jmp	.L2157
	.p2align 4
	.p2align 3
.L2173:
	movq	(%rsp), %r14
.L1820:
	movq	280(%rsp), %rbx
	movb	$-1, (%rdi,%rbx)
	addq	%rbx, %rdx
	movq	304(%rsp), %rbx
	addq	%rbx, 240(%rsp)
	addq	%rbx, %rdi
	addq	%rbx, %rax
	addq	%rbx, %r14
	addq	%rbx, %r15
	decl	296(%rsp)
	jne	.L1811
	movl	260(%rsp), %eax
	imulq	280(%rsp), %rax
	movq	352(%rsp), %r14
	movl	144(%rsp), %r15d
	addq	%rax, %r14
	jmp	.L1759
.L1812:
	movq	264(%rsp), %rbx
	xorl	%esi, %esi
	leaq	(%rax,%rbx), %rcx
	addq	%rdi, %rbx
	movq	%rcx, 16(%rsp)
	movq	%rbx, (%rsp)
	jmp	.L1819
	.p2align 4
	.p2align 3
.L2175:
	cmpl	%r9d, %r10d
	cmovge	%ebx, %r8d
.L1818:
	addl	%r12d, %r8d
	leaq	1(%rsi), %rcx
	movb	%r8b, (%rdi,%rsi)
	cmpq	%rsi, 272(%rsp)
	je	.L1820
	movq	%rcx, %rsi
.L1819:
	movq	(%rsp), %rcx
	movq	16(%rsp), %rbx
	movzbl	(%rax,%rsi), %r9d
	movzbl	(%rdx,%rsi), %r12d
	movzbl	(%rcx,%rsi), %r11d
	movzbl	(%rbx,%rsi), %r10d
	movl	%r9d, %ebx
	leal	(%r11,%r9), %ecx
	movl	%r10d, %r8d
	movl	%r11d, %ebp
	subl	%r10d, %ecx
	movl	%ecx, %r13d
	subl	%r9d, %r13d
	movl	%r13d, %r9d
	negl	%r9d
	cmovs	%r13d, %r9d
	movl	%ecx, %r13d
	subl	%r10d, %r13d
	movl	%r13d, %r10d
	negl	%r10d
	cmovs	%r13d, %r10d
	movl	%r9d, %r13d
	cmpl	%r9d, %r10d
	cmovle	%r10d, %r13d
	subl	%r11d, %ecx
	movl	%ecx, %r11d
	negl	%r11d
	cmovs	%ecx, %r11d
	cmpl	%r11d, %r13d
	jl	.L2175
	movl	%ebp, %r8d
	jmp	.L1818
	.p2align 4
	.p2align 3
.L2169:
	movl	220(%rsp), %r14d
	movslq	%r15d, %rdx
	cmpl	%r14d, 172(%rsp)
	je	.L1691
	movb	$-1, (%rdi,%rdx)
	movb	$-1, 1(%rdi,%rdx)
.L1691:
	leaq	(%rbx,%rdx), %r14
	movslq	256(%rsp), %rdx
	addq	%rdx, %rdi
	addq	%rdx, %rax
	jmp	.L1689
.L1793:
	xorl	%ecx, %ecx
	.p2align 4
	.p2align 3
.L1799:
	movzbl	(%rax,%rcx), %r8d
	addb	(%rdx,%rcx), %r8b
	movb	%r8b, (%rdi,%rcx)
	movq	%rcx, %r8
	incq	%rcx
	cmpq	%r8, %r12
	jne	.L1799
	jmp	.L1802
.L1770:
	xorl	%edx, %edx
	.p2align 4
	.p2align 3
.L1776:
	movzbl	(%rax,%rdx), %r8d
	movb	%r8b, (%rdi,%rdx)
	movq	%rdx, %r8
	incq	%rdx
	cmpq	%r8, %rbp
	jne	.L1776
	jmp	.L1780
.L1804:
	movq	%r9, 424(%rsp)
	movq	504(%rsp), %r9
	xorl	%esi, %esi
	.p2align 4
	.p2align 3
.L1807:
	movzbl	(%rax,%rsi), %ecx
	movzbl	(%r8,%rsi), %r10d
	addl	%r10d, %ecx
	sarl	%ecx
	addb	(%rdx,%rsi), %cl
	movb	%cl, (%rdi,%rsi)
	movq	%rsi, %rcx
	incq	%rsi
	cmpq	%rcx, %r9
	jne	.L1807
	movq	424(%rsp), %r9
	jmp	.L1810
.L1831:
	movl	%r10d, %r14d
	xorl	%edx, %edx
	.p2align 4
	.p2align 3
.L1837:
	movzbl	(%rcx,%rdx), %r13d
	addb	(%rax,%rdx), %r13b
	movb	%r13b, (%rdi,%rdx)
	movq	%rdx, %r13
	incq	%rdx
	cmpq	%r13, %r14
	jne	.L1837
	jmp	.L1840
.L1823:
	xorl	%edx, %edx
	.p2align 4
	.p2align 3
.L1826:
	movzbl	(%rsi,%rdx), %ecx
	shrb	%cl
	addb	(%rax,%rdx), %cl
	movb	%cl, (%rdi,%rdx)
	movq	%rdx, %rcx
	incq	%rdx
	cmpq	%rcx, %rbx
	jne	.L1826
	jmp	.L1829
.L1782:
	movl	%r10d, %r14d
	xorl	%edx, %edx
	.p2align 4
	.p2align 3
.L1788:
	movzbl	(%rcx,%rdx), %r13d
	addb	(%rax,%rdx), %r13b
	movb	%r13b, (%rdi,%rdx)
	movq	%rdx, %r13
	incq	%rdx
	cmpq	%r13, %r14
	jne	.L1788
	jmp	.L1791
.L2164:
	addl	%eax, %eax
	movl	$2, %r12d
	movl	$2, %r14d
	movl	%eax, 256(%rsp)
	movq	%rdi, %rax
	jmp	.L1657
.L1733:
	movl	%edx, %ebx
	xorl	%ecx, %ecx
	leaq	(%rax,%rsi), %r13
	movq	%rbx, 16(%rsp)
	leaq	(%rdi,%rsi), %rbx
	movq	%rbx, 32(%rsp)
	jmp	.L1741
.L2176:
	cmpl	%r8d, %r9d
	cmovle	%r11d, %esi
.L1740:
	addl	%ebp, %esi
	movb	%sil, (%rdi,%rcx)
	incq	%rcx
	cmpq	%rcx, 16(%rsp)
	je	.L1693
.L1741:
	movq	32(%rsp), %rbx
	movzbl	(%rax,%rcx), %r9d
	movzbl	0(%r13,%rcx), %r8d
	movzbl	(%r14,%rcx), %ebp
	movzbl	(%rbx,%rcx), %r10d
	movl	%r9d, %r11d
	movl	%r8d, %esi
	leal	(%r9,%r10), %edx
	movl	%r10d, %ebx
	subl	%r8d, %edx
	movl	%edx, %r12d
	subl	%r9d, %r12d
	movl	%r12d, %r9d
	negl	%r9d
	cmovs	%r12d, %r9d
	movl	%edx, %r12d
	subl	%r8d, %r12d
	movl	%r12d, %r8d
	negl	%r8d
	cmovs	%r12d, %r8d
	cmpl	%r8d, %r9d
	movl	%r8d, %r12d
	cmovle	%r9d, %r12d
	subl	%r10d, %edx
	movl	%edx, %r10d
	negl	%r10d
	cmovs	%edx, %r10d
	cmpl	%r10d, %r12d
	jl	.L2176
	movl	%ebx, %esi
	jmp	.L1740
.L1768:
	cmpl	$16, 624(%rsp)
	jne	.L1757
	movq	184(%rsp), %rbx
	movq	192(%rsp), %rax
	addq	24(%rbx), %rax
	jmp	.L1884
.L1668:
	leaq	.LC94(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L1656
.L1900:
	movl	%r15d, %r13d
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	jmp	.L1832
.L1894:
	movl	%r15d, %r13d
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	jmp	.L1783
.L1892:
	movl	16(%rsp), %edx
	movl	%r15d, %r10d
	xorl	%r8d, %r8d
	jmp	.L1771
.L1896:
	movl	%r15d, %r10d
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	jmp	.L1794
.L1893:
	movl	%ebx, %edx
	jmp	.L1774
.L1895:
	movl	%ebp, %edx
	jmp	.L1786
.L1897:
	movl	%ebp, %ecx
	jmp	.L1797
.L1901:
	movl	%ebp, %edx
	jmp	.L1835
.L2166:
	leaq	.LC95(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L1656
.L2178:
	cmpl	$16, 624(%rsp)
	je	.L2177
.L1670:
	movl	$1, %eax
	jmp	.L1656
.L1842:
	cmpl	$7, 624(%rsp)
	jg	.L2178
	movl	404(%rsp), %edi
	movl	224(%rsp), %eax
	xorl	%r11d, %r11d
	movl	292(%rsp), %edx
	leal	-8(%rdi), %esi
	subq	%rax, %rdx
	movl	%esi, %eax
	movl	%esi, 320(%rsp)
	shrl	$3, %eax
	movq	%rdx, %rbp
	leal	1(%rax), %edx
	negl	%eax
	movq	%rdx, %rbx
	movl	%edx, 312(%rsp)
	movq	%rdx, 112(%rsp)
	salq	$3, %rdx
	movq	%rdx, 144(%rsp)
	movl	%ebx, %edx
	andl	$-16, %ebx
	leal	(%rsi,%rax,8), %eax
	shrl	$4, %edx
	leal	-4(%rdi), %esi
	movl	%ebx, 272(%rsp)
	movq	%rbx, 360(%rsp)
	decl	%edx
	movl	%eax, 380(%rsp)
	movl	%esi, 192(%rsp)
	movq	%rdx, 384(%rsp)
	movl	%ebx, %edx
	salq	$3, %rbx
	negl	%edx
	movq	%rbx, 280(%rsp)
	leal	(%rdi,%rdx,8), %edx
	movl	%edx, 296(%rsp)
	movl	%esi, %edx
	shrl	$2, %edx
	leal	1(%rdx), %ebx
	movq	%rbx, %rax
	movl	%ebx, 352(%rsp)
	movq	%rbx, 96(%rsp)
	salq	$2, %rbx
	movq	%rbx, 128(%rsp)
	movl	%eax, %ebx
	shrl	$4, %eax
	andl	$-16, %ebx
	decl	%eax
	movq	%rax, 392(%rsp)
	movl	%ebx, %eax
	movl	%ebx, 344(%rsp)
	negl	%eax
	leal	(%rdi,%rax,4), %eax
	movl	%eax, 304(%rsp)
	movl	%ebx, %eax
	movq	%rax, 336(%rsp)
	salq	$2, %rax
	movq	%rax, 328(%rsp)
	movl	%edx, %eax
	negl	%eax
	leal	(%rsi,%rax,4), %eax
	leal	-2(%rdi), %esi
	movl	%esi, %edx
	movl	%eax, 212(%rsp)
	movl	%esi, 240(%rsp)
	shrl	%edx
	leal	1(%rdx), %r12d
	leaq	(%r12,%r12), %rax
	movq	%r12, %rbx
	movl	%r12d, 256(%rsp)
	movq	%rax, 80(%rsp)
	movl	%r12d, %eax
	andl	$-16, %ebx
	shrl	$4, %eax
	movl	%ebx, 288(%rsp)
	movq	%rbx, 232(%rsp)
	decl	%eax
	incq	%rax
	salq	$4, %rax
	movq	%rax, %r13
	movl	%ebx, %eax
	addq	%rbx, %rbx
	negl	%eax
	movq	%rbx, 224(%rsp)
	leal	(%rdi,%rax,2), %eax
	leal	-2(%rax), %ebx
	movl	%ebx, 264(%rsp)
	leal	-4(%rax), %ebx
	movl	%ebx, 292(%rsp)
	leal	-6(%rax), %ebx
	movl	%ebx, 376(%rsp)
	leal	-8(%rax), %ebx
	movl	%ebx, 368(%rsp)
	leal	-10(%rax), %ebx
	movslq	260(%rsp), %r14
	movq	%r12, (%rsp)
	movl	%ebx, 408(%rsp)
	leal	-12(%rax), %ebx
	movl	%ebx, 400(%rsp)
	leal	-14(%rax), %ebx
	vmovdqa	.LC11(%rip), %xmm14
	movl	%ebx, 464(%rsp)
	leal	-16(%rax), %ebx
	vmovdqa	.LC12(%rip), %xmm11
	movl	%ebx, 448(%rsp)
	leal	-18(%rax), %ebx
	vmovdqa	.LC2(%rip), %xmm0
	movq	%r14, 16(%rsp)
	movl	%ebx, 456(%rsp)
	leal	-20(%rax), %ebx
	movl	%ebx, 472(%rsp)
	leal	-22(%rax), %ebx
	vmovdqa	.LC98(%rip), %xmm12
	movl	%ebx, 432(%rsp)
	leal	-24(%rax), %ebx
	vmovdqa	.LC0(%rip), %xmm13
	movl	%ebx, 424(%rsp)
	leal	-26(%rax), %ebx
	subl	$28, %eax
	movl	176(%rsp), %r12d
	movl	%eax, 416(%rsp)
	movl	%edx, %eax
	movq	%r13, 176(%rsp)
	movl	624(%rsp), %r10d
	negl	%eax
	movl	%ebx, 440(%rsp)
	xorl	%ebx, %ebx
	leal	(%rsi,%rax,2), %eax
	movl	220(%rsp), %r13d
	movl	%eax, 208(%rsp)
	leal	0(,%r14,4), %eax
	movslq	%eax, %r15
	movl	216(%rsp), %eax
	movq	%r15, 64(%rsp)
	leal	-3(%rax,%rax,2), %eax
	cltq
	movq	%rax, 48(%rsp)
	movl	%r14d, %eax
	movq	184(%rsp), %r14
	movq	%rax, 32(%rsp)
	.p2align 4
	.p2align 3
.L1871:
	movq	24(%r14), %rcx
	movl	%ebx, %esi
	movl	$1, %edx
	movl	632(%rsp), %edi
	leaq	(%rsi,%rbp), %rax
	leaq	(%rcx,%rsi), %r9
	addq	%rax, %rcx
	testl	%edi, %edi
	jne	.L1844
	movslq	%r10d, %rdx
	leaq	stbi__depth_scale_table(%rip), %rdi
	movzbl	(%rdi,%rdx), %edx
.L1844:
	cmpl	$4, %r10d
	je	.L2179
	cmpl	$2, %r10d
	je	.L2180
	cmpl	$1, %r10d
	je	.L2181
.L1853:
	cmpl	%r13d, 172(%rsp)
	je	.L1873
	addq	24(%r14), %rsi
	cmpl	$1, %r13d
	je	.L2182
	cmpl	$3, %r13d
	jne	.L2183
	cmpl	$-1, 260(%rsp)
	je	.L1873
	movq	16(%rsp), %rcx
	subq	32(%rsp), %rcx
	movq	64(%rsp), %rax
	movq	48(%rsp), %rdi
	addq	%rsi, %rax
	leaq	(%rsi,%rdi), %rdx
	leaq	-4(%rsi,%rcx,4), %rcx
	.p2align 4
	.p2align 3
.L1876:
	movb	$-1, 3(%rax)
	movzbl	2(%rdx), %esi
	subq	$4, %rax
	subq	$3, %rdx
	movb	%sil, 6(%rax)
	movzbl	4(%rdx), %esi
	movb	%sil, 5(%rax)
	movzbl	3(%rdx), %esi
	movb	%sil, 4(%rax)
	cmpq	%rax, %rcx
	jne	.L1876
.L1873:
	leal	1(%r11), %eax
	addl	%r12d, %ebx
	cmpl	168(%rsp), %r11d
	je	.L1670
	movl	%eax, %r11d
	jmp	.L1871
.L2182:
	cmpl	$-1, 260(%rsp)
	je	.L1873
	movq	16(%rsp), %rax
	.p2align 4
	.p2align 3
.L1874:
	movb	$-1, 1(%rsi,%rax,2)
	movzbl	(%rsi,%rax), %edx
	movb	%dl, (%rsi,%rax,2)
	decq	%rax
	cmpl	$-1, %eax
	jne	.L1874
	jmp	.L1873
.L2179:
	cmpl	$1, 404(%rsp)
	jle	.L1903
	movq	80(%rsp), %rdi
	addq	%rsi, %rdi
	cmpq	%rdi, %rax
	setge	%dil
	addq	(%rsp), %rax
	cmpq	%rax, %rsi
	setge	%al
	orb	%dil, %al
	je	.L1847
	cmpl	$29, 240(%rsp)
	jbe	.L1847
	vmovdqa	.LC2(%rip), %xmm2
	vmovdqa	.LC98(%rip), %xmm5
	vmovd	%edx, %xmm3
	vpbroadcastb	%xmm3, %xmm3
	movq	176(%rsp), %rdi
	vpunpcklbw	%xmm3, %xmm3, %xmm4
	xorl	%eax, %eax
	vpunpckhbw	%xmm3, %xmm3, %xmm3
	.p2align 4
	.p2align 3
.L1848:
	vmovdqu	(%rcx,%rax), %xmm7
	vpsrlw	$4, %xmm7, %xmm1
	vpand	%xmm1, %xmm5, %xmm1
	vpunpcklbw	%xmm1, %xmm1, %xmm6
	vpunpckhbw	%xmm1, %xmm1, %xmm1
	vpmullw	%xmm6, %xmm4, %xmm6
	vpmullw	%xmm1, %xmm3, %xmm1
	vpand	%xmm6, %xmm2, %xmm6
	vpand	%xmm1, %xmm2, %xmm1
	vpackuswb	%xmm1, %xmm6, %xmm6
	vpand	(%rcx,%rax), %xmm5, %xmm1
	vpunpcklbw	%xmm1, %xmm1, %xmm7
	vpunpckhbw	%xmm1, %xmm1, %xmm1
	vpmullw	%xmm4, %xmm7, %xmm7
	vpmullw	%xmm3, %xmm1, %xmm1
	vpand	%xmm7, %xmm2, %xmm7
	vpand	%xmm1, %xmm2, %xmm1
	vpackuswb	%xmm1, %xmm7, %xmm1
	vpunpcklbw	%xmm1, %xmm6, %xmm7
	vpunpckhbw	%xmm1, %xmm6, %xmm6
	vmovdqu	%xmm7, (%r9,%rax,2)
	vmovdqu	%xmm6, 16(%r9,%rax,2)
	addq	$16, %rax
	cmpq	%rax, %rdi
	jne	.L1848
	movq	224(%rsp), %rax
	movl	256(%rsp), %r15d
	leaq	(%r9,%rax), %rdi
	movq	232(%rsp), %rax
	leaq	(%rcx,%rax), %r8
	cmpl	%r15d, 288(%rsp)
	je	.L2158
	movzbl	(%r8), %eax
	shrb	$4, %al
	imull	%edx, %eax
	movb	%al, (%rdi)
	movzbl	(%r8), %eax
	andl	$15, %eax
	imull	%edx, %eax
	cmpl	$1, 264(%rsp)
	movb	%al, 1(%rdi)
	jle	.L2158
	movzbl	1(%r8), %eax
	shrb	$4, %al
	imull	%edx, %eax
	movb	%al, 2(%rdi)
	movzbl	1(%r8), %eax
	andl	$15, %eax
	imull	%edx, %eax
	cmpl	$1, 292(%rsp)
	movb	%al, 3(%rdi)
	jle	.L2158
	movzbl	2(%r8), %eax
	shrb	$4, %al
	imull	%edx, %eax
	movb	%al, 4(%rdi)
	movzbl	2(%r8), %eax
	andl	$15, %eax
	imull	%edx, %eax
	cmpl	$1, 376(%rsp)
	movb	%al, 5(%rdi)
	jle	.L2158
	movzbl	3(%r8), %eax
	shrb	$4, %al
	imull	%edx, %eax
	movb	%al, 6(%rdi)
	movzbl	3(%r8), %eax
	andl	$15, %eax
	imull	%edx, %eax
	cmpl	$1, 368(%rsp)
	movb	%al, 7(%rdi)
	jle	.L2158
	movzbl	4(%r8), %eax
	shrb	$4, %al
	imull	%edx, %eax
	movb	%al, 8(%rdi)
	movzbl	4(%r8), %eax
	andl	$15, %eax
	imull	%edx, %eax
	cmpl	$1, 408(%rsp)
	movb	%al, 9(%rdi)
	jle	.L2158
	movzbl	5(%r8), %eax
	shrb	$4, %al
	imull	%edx, %eax
	movb	%al, 10(%rdi)
	movzbl	5(%r8), %eax
	andl	$15, %eax
	imull	%edx, %eax
	cmpl	$1, 400(%rsp)
	movb	%al, 11(%rdi)
	jle	.L2158
	movzbl	6(%r8), %eax
	shrb	$4, %al
	imull	%edx, %eax
	movb	%al, 12(%rdi)
	movzbl	6(%r8), %eax
	andl	$15, %eax
	imull	%edx, %eax
	cmpl	$1, 464(%rsp)
	movb	%al, 13(%rdi)
	jle	.L2158
	movzbl	7(%r8), %eax
	shrb	$4, %al
	imull	%edx, %eax
	movb	%al, 14(%rdi)
	movzbl	7(%r8), %eax
	andl	$15, %eax
	imull	%edx, %eax
	cmpl	$1, 448(%rsp)
	movb	%al, 15(%rdi)
	jle	.L2158
	movzbl	8(%r8), %eax
	shrb	$4, %al
	imull	%edx, %eax
	movb	%al, 16(%rdi)
	movzbl	8(%r8), %eax
	andl	$15, %eax
	imull	%edx, %eax
	cmpl	$1, 456(%rsp)
	movb	%al, 17(%rdi)
	jle	.L2158
	movzbl	9(%r8), %eax
	shrb	$4, %al
	imull	%edx, %eax
	movb	%al, 18(%rdi)
	movzbl	9(%r8), %eax
	andl	$15, %eax
	imull	%edx, %eax
	cmpl	$1, 472(%rsp)
	movb	%al, 19(%rdi)
	jle	.L2158
	movzbl	10(%r8), %eax
	shrb	$4, %al
	imull	%edx, %eax
	movb	%al, 20(%rdi)
	movzbl	10(%r8), %eax
	andl	$15, %eax
	imull	%edx, %eax
	cmpl	$1, 432(%rsp)
	movb	%al, 21(%rdi)
	jle	.L2158
	movzbl	11(%r8), %eax
	shrb	$4, %al
	imull	%edx, %eax
	movb	%al, 22(%rdi)
	movzbl	11(%r8), %eax
	andl	$15, %eax
	imull	%edx, %eax
	cmpl	$1, 424(%rsp)
	movb	%al, 23(%rdi)
	jle	.L2158
	movzbl	12(%r8), %eax
	shrb	$4, %al
	imull	%edx, %eax
	movb	%al, 24(%rdi)
	movzbl	12(%r8), %eax
	andl	$15, %eax
	imull	%edx, %eax
	cmpl	$1, 440(%rsp)
	movb	%al, 25(%rdi)
	jle	.L2158
	movzbl	13(%r8), %eax
	shrb	$4, %al
	imull	%edx, %eax
	movb	%al, 26(%rdi)
	movzbl	13(%r8), %eax
	andl	$15, %eax
	imull	%edx, %eax
	cmpl	$1, 416(%rsp)
	movb	%al, 27(%rdi)
	jle	.L2158
	movzbl	14(%r8), %eax
	shrb	$4, %al
	imull	%edx, %eax
	movb	%al, 28(%rdi)
	movzbl	14(%r8), %eax
	andl	$15, %eax
	imull	%edx, %eax
	movb	%al, 29(%rdi)
.L2158:
	movq	(%rsp), %rax
	leaq	(%rcx,%rax), %rdi
.L1851:
	addq	80(%rsp), %r9
	movl	208(%rsp), %eax
	movq	%rdi, %rcx
.L1846:
	cmpl	$1, %eax
	jne	.L1853
	movzbl	(%rcx), %eax
	shrb	$4, %al
	imull	%edx, %eax
	movb	%al, (%r9)
	jmp	.L1853
.L2180:
	cmpl	$3, 404(%rsp)
	jle	.L1904
	movq	128(%rsp), %rdi
	addq	%rsi, %rdi
	cmpq	%rdi, %rax
	setge	%dil
	addq	96(%rsp), %rax
	cmpq	%rax, %rsi
	setge	%al
	orb	%dil, %al
	je	.L1856
	cmpl	$59, 192(%rsp)
	jbe	.L1856
	vmovdqa	.LC0(%rip), %xmm7
	vmovdqa	.LC99(%rip), %xmm8
	vmovd	%edx, %xmm5
	vpbroadcastb	%xmm5, %xmm5
	movq	392(%rsp), %r15
	vpunpcklbw	%xmm5, %xmm5, %xmm6
	movq	%r9, %rax
	movq	%rcx, %rdi
	vpunpckhbw	%xmm5, %xmm5, %xmm5
	leaq	1(%r15), %r8
	salq	$6, %r8
	addq	%r9, %r8
	.p2align 4
	.p2align 3
.L1857:
	vmovdqu	(%rdi), %xmm1
	addq	$64, %rax
	addq	$16, %rdi
	vpsrlw	$6, %xmm1, %xmm2
	vpand	%xmm2, %xmm7, %xmm2
	vpunpcklbw	%xmm2, %xmm2, %xmm4
	vpunpckhbw	%xmm2, %xmm2, %xmm2
	vpmullw	%xmm4, %xmm6, %xmm4
	vpmullw	%xmm2, %xmm5, %xmm2
	vpand	%xmm4, %xmm0, %xmm4
	vpand	%xmm2, %xmm0, %xmm2
	vpackuswb	%xmm2, %xmm4, %xmm4
	vpsrlw	$4, %xmm1, %xmm2
	vpand	%xmm2, %xmm12, %xmm2
	vpand	%xmm7, %xmm2, %xmm2
	vpunpcklbw	%xmm2, %xmm2, %xmm3
	vpunpckhbw	%xmm2, %xmm2, %xmm2
	vpmullw	%xmm6, %xmm3, %xmm3
	vpmullw	%xmm5, %xmm2, %xmm2
	vpand	%xmm3, %xmm0, %xmm3
	vpand	%xmm2, %xmm0, %xmm2
	vpackuswb	%xmm2, %xmm3, %xmm3
	vpsrlw	$2, %xmm1, %xmm2
	vpand	%xmm2, %xmm8, %xmm2
	vpand	%xmm7, %xmm1, %xmm1
	vpand	%xmm7, %xmm2, %xmm2
	vpunpcklbw	%xmm2, %xmm2, %xmm10
	vpunpckhbw	%xmm2, %xmm2, %xmm2
	vpmullw	%xmm5, %xmm2, %xmm9
	vpmullw	%xmm6, %xmm10, %xmm10
	vpand	%xmm9, %xmm0, %xmm9
	vpand	%xmm10, %xmm0, %xmm2
	vpackuswb	%xmm9, %xmm2, %xmm2
	vpunpcklbw	%xmm1, %xmm1, %xmm9
	vpunpckhbw	%xmm1, %xmm1, %xmm1
	vpmullw	%xmm6, %xmm9, %xmm9
	vpmullw	%xmm5, %xmm1, %xmm1
	vpand	%xmm9, %xmm0, %xmm9
	vpand	%xmm1, %xmm0, %xmm1
	vpackuswb	%xmm1, %xmm9, %xmm1
	vpunpcklbw	%xmm2, %xmm4, %xmm9
	vpunpckhbw	%xmm2, %xmm4, %xmm2
	vpunpcklbw	%xmm1, %xmm3, %xmm4
	vpunpckhbw	%xmm1, %xmm3, %xmm3
	vpunpcklbw	%xmm4, %xmm9, %xmm1
	vpunpckhbw	%xmm4, %xmm9, %xmm9
	vmovdqu	%xmm1, -64(%rax)
	vpunpcklbw	%xmm3, %xmm2, %xmm1
	vpunpckhbw	%xmm3, %xmm2, %xmm2
	vmovdqu	%xmm9, -48(%rax)
	vmovdqu	%xmm1, -32(%rax)
	vmovdqu	%xmm2, -16(%rax)
	cmpq	%rax, %r8
	jne	.L1857
	movq	328(%rsp), %rax
	movl	352(%rsp), %r15d
	leaq	(%r9,%rax), %rdi
	movq	336(%rsp), %rax
	leaq	(%rcx,%rax), %r8
	cmpl	%r15d, 344(%rsp)
	je	.L2159
	movl	304(%rsp), %eax
	leal	(%rax,%rdi), %r15d
	.p2align 4
	.p2align 3
.L1859:
	movzbl	(%r8), %eax
	addq	$4, %rdi
	incq	%r8
	shrb	$6, %al
	imull	%edx, %eax
	movb	%al, -4(%rdi)
	movzbl	-1(%r8), %eax
	shrb	$4, %al
	andl	$3, %eax
	imull	%edx, %eax
	movb	%al, -3(%rdi)
	movzbl	-1(%r8), %eax
	shrb	$2, %al
	andl	$3, %eax
	imull	%edx, %eax
	movb	%al, -2(%rdi)
	movzbl	-1(%r8), %eax
	andl	$3, %eax
	imull	%edx, %eax
	movb	%al, -1(%rdi)
	movl	%r15d, %eax
	subl	%edi, %eax
	cmpl	$3, %eax
	jg	.L1859
.L2159:
	movq	96(%rsp), %rax
	leaq	(%rcx,%rax), %rdi
.L1861:
	addq	128(%rsp), %r9
	movq	%rdi, %rcx
	movl	212(%rsp), %edi
.L1855:
	testl	%edi, %edi
	jle	.L1853
	movzbl	(%rcx), %eax
	shrb	$6, %al
	imull	%edx, %eax
	movb	%al, (%r9)
	cmpl	$1, %edi
	je	.L1853
	movzbl	(%rcx), %eax
	shrb	$4, %al
	andl	$3, %eax
	imull	%edx, %eax
	movb	%al, 1(%r9)
	cmpl	$3, %edi
	jne	.L1853
	movzbl	(%rcx), %eax
	shrb	$2, %al
	andl	$3, %eax
	imull	%edx, %eax
	movb	%al, 2(%r9)
	jmp	.L1853
.L2181:
	cmpl	$7, 404(%rsp)
	jle	.L1905
	movq	144(%rsp), %rdi
	addq	%rsi, %rdi
	cmpq	%rdi, %rax
	setge	%dil
	addq	112(%rsp), %rax
	cmpq	%rax, %rsi
	setge	%al
	orb	%dil, %al
	je	.L1864
	cmpl	$119, 320(%rsp)
	jbe	.L1864
	movq	384(%rsp), %r15
	vmovd	%edx, %xmm4
	vpbroadcastb	%xmm4, %xmm4
	movq	%rcx, %rdi
	vpunpcklbw	%xmm4, %xmm4, %xmm9
	movq	%r9, %rax
	vpunpckhbw	%xmm4, %xmm4, %xmm4
	leaq	1(%r15), %r8
	salq	$4, %r8
	addq	%rcx, %r8
	.p2align 4
	.p2align 3
.L1865:
	vmovdqu	(%rdi), %xmm1
	addq	$16, %rdi
	subq	$-128, %rax
	vpsrlw	$7, %xmm1, %xmm2
	vpand	%xmm2, %xmm11, %xmm2
	vpunpcklbw	%xmm2, %xmm2, %xmm8
	vpunpckhbw	%xmm2, %xmm2, %xmm2
	vpmullw	%xmm8, %xmm9, %xmm8
	vpmullw	%xmm2, %xmm4, %xmm2
	vpand	%xmm8, %xmm0, %xmm8
	vpand	%xmm2, %xmm0, %xmm2
	vpackuswb	%xmm2, %xmm8, %xmm8
	vpsrlw	$6, %xmm1, %xmm2
	vpand	%xmm2, %xmm13, %xmm2
	vpand	%xmm11, %xmm2, %xmm2
	vpunpcklbw	%xmm2, %xmm2, %xmm7
	vpunpckhbw	%xmm2, %xmm2, %xmm2
	vpmullw	%xmm9, %xmm7, %xmm7
	vpmullw	%xmm4, %xmm2, %xmm2
	vpand	%xmm7, %xmm0, %xmm7
	vpand	%xmm2, %xmm0, %xmm2
	vpackuswb	%xmm2, %xmm7, %xmm7
	vpsrlw	$5, %xmm1, %xmm2
	vpand	.LC100(%rip), %xmm2, %xmm2
	vpand	%xmm11, %xmm2, %xmm2
	vpunpcklbw	%xmm2, %xmm2, %xmm6
	vpunpckhbw	%xmm2, %xmm2, %xmm2
	vpmullw	%xmm9, %xmm6, %xmm6
	vpmullw	%xmm4, %xmm2, %xmm2
	vpand	%xmm6, %xmm0, %xmm6
	vpand	%xmm2, %xmm0, %xmm2
	vpackuswb	%xmm2, %xmm6, %xmm6
	vpsrlw	$4, %xmm1, %xmm2
	vpand	%xmm2, %xmm12, %xmm2
	vpand	%xmm11, %xmm2, %xmm2
	vpunpcklbw	%xmm2, %xmm2, %xmm5
	vpunpckhbw	%xmm2, %xmm2, %xmm2
	vpmullw	%xmm9, %xmm5, %xmm5
	vpmullw	%xmm4, %xmm2, %xmm2
	vpand	%xmm5, %xmm0, %xmm5
	vpand	%xmm2, %xmm0, %xmm2
	vpackuswb	%xmm2, %xmm5, %xmm5
	vpsrlw	$3, %xmm1, %xmm2
	vpand	.LC101(%rip), %xmm2, %xmm2
	vpand	%xmm11, %xmm2, %xmm2
	vpunpcklbw	%xmm2, %xmm2, %xmm3
	vpunpckhbw	%xmm2, %xmm2, %xmm2
	vpmullw	%xmm9, %xmm3, %xmm3
	vpmullw	%xmm4, %xmm2, %xmm2
	vpand	%xmm3, %xmm0, %xmm3
	vpand	%xmm2, %xmm0, %xmm2
	vpackuswb	%xmm2, %xmm3, %xmm3
	vpsrlw	$2, %xmm1, %xmm2
	vpand	.LC99(%rip), %xmm2, %xmm2
	vpand	%xmm11, %xmm2, %xmm2
	vpunpcklbw	%xmm2, %xmm2, %xmm10
	vpunpckhbw	%xmm2, %xmm2, %xmm2
	vpmullw	%xmm9, %xmm10, %xmm10
	vpmullw	%xmm4, %xmm2, %xmm2
	vpand	%xmm10, %xmm0, %xmm10
	vpand	%xmm2, %xmm0, %xmm2
	vpackuswb	%xmm2, %xmm10, %xmm10
	vpsrlw	$1, %xmm1, %xmm2
	vpand	%xmm2, %xmm14, %xmm2
	vpand	%xmm11, %xmm1, %xmm1
	vpand	%xmm11, %xmm2, %xmm2
	vpunpcklbw	%xmm2, %xmm2, %xmm15
	vpunpckhbw	%xmm2, %xmm2, %xmm2
	vpmullw	%xmm9, %xmm15, %xmm15
	vpmullw	%xmm4, %xmm2, %xmm2
	vpand	%xmm15, %xmm0, %xmm15
	vpand	%xmm2, %xmm0, %xmm2
	vpackuswb	%xmm2, %xmm15, %xmm2
	vpunpcklbw	%xmm1, %xmm1, %xmm15
	vpunpckhbw	%xmm1, %xmm1, %xmm1
	vpmullw	%xmm9, %xmm15, %xmm15
	vpmullw	%xmm4, %xmm1, %xmm1
	vpand	%xmm15, %xmm0, %xmm15
	vpand	%xmm1, %xmm0, %xmm1
	vpackuswb	%xmm1, %xmm15, %xmm1
	vpunpcklbw	%xmm3, %xmm8, %xmm15
	vpunpckhbw	%xmm3, %xmm8, %xmm3
	vpunpcklbw	%xmm10, %xmm7, %xmm8
	vpunpckhbw	%xmm10, %xmm7, %xmm10
	vpunpcklbw	%xmm2, %xmm6, %xmm7
	vpunpckhbw	%xmm2, %xmm6, %xmm2
	vpunpcklbw	%xmm1, %xmm5, %xmm6
	vpunpckhbw	%xmm1, %xmm5, %xmm1
	vpunpcklbw	%xmm7, %xmm15, %xmm5
	vpunpckhbw	%xmm7, %xmm15, %xmm7
	vpunpcklbw	%xmm2, %xmm3, %xmm15
	vpunpckhbw	%xmm2, %xmm3, %xmm2
	vpunpcklbw	%xmm6, %xmm8, %xmm3
	vpunpckhbw	%xmm6, %xmm8, %xmm6
	vpunpcklbw	%xmm1, %xmm10, %xmm8
	vpunpckhbw	%xmm1, %xmm10, %xmm1
	vpunpcklbw	%xmm3, %xmm5, %xmm10
	vpunpckhbw	%xmm3, %xmm5, %xmm5
	vpunpcklbw	%xmm6, %xmm7, %xmm3
	vmovdqu	%xmm3, -96(%rax)
	vpunpcklbw	%xmm8, %xmm15, %xmm3
	vpunpckhbw	%xmm6, %xmm7, %xmm7
	vpunpckhbw	%xmm8, %xmm15, %xmm15
	vmovdqu	%xmm3, -64(%rax)
	vpunpcklbw	%xmm1, %xmm2, %xmm3
	vpunpckhbw	%xmm1, %xmm2, %xmm2
	vmovdqu	%xmm10, -128(%rax)
	vmovdqu	%xmm5, -112(%rax)
	vmovdqu	%xmm7, -80(%rax)
	vmovdqu	%xmm15, -48(%rax)
	vmovdqu	%xmm3, -32(%rax)
	vmovdqu	%xmm2, -16(%rax)
	cmpq	%rdi, %r8
	jne	.L1865
	movq	280(%rsp), %rax
	movl	312(%rsp), %r15d
	leaq	(%r9,%rax), %rdi
	movq	360(%rsp), %rax
	leaq	(%rcx,%rax), %r8
	cmpl	%r15d, 272(%rsp)
	je	.L2160
	movl	296(%rsp), %eax
	leal	(%rax,%rdi), %r15d
	.p2align 4
	.p2align 3
.L1867:
	movzbl	(%r8), %eax
	addq	$8, %rdi
	incq	%r8
	shrb	$7, %al
	imull	%edx, %eax
	movb	%al, -8(%rdi)
	movzbl	-1(%r8), %eax
	shrb	$6, %al
	andl	$1, %eax
	imull	%edx, %eax
	movb	%al, -7(%rdi)
	movzbl	-1(%r8), %eax
	shrb	$5, %al
	andl	$1, %eax
	imull	%edx, %eax
	movb	%al, -6(%rdi)
	movzbl	-1(%r8), %eax
	shrb	$4, %al
	andl	$1, %eax
	imull	%edx, %eax
	movb	%al, -5(%rdi)
	movzbl	-1(%r8), %eax
	shrb	$3, %al
	andl	$1, %eax
	imull	%edx, %eax
	movb	%al, -4(%rdi)
	movzbl	-1(%r8), %eax
	shrb	$2, %al
	andl	$1, %eax
	imull	%edx, %eax
	movb	%al, -3(%rdi)
	movzbl	-1(%r8), %eax
	shrb	%al
	andl	$1, %eax
	imull	%edx, %eax
	movb	%al, -2(%rdi)
	movzbl	-1(%r8), %eax
	andl	$1, %eax
	imull	%edx, %eax
	movb	%al, -1(%rdi)
	movl	%r15d, %eax
	subl	%edi, %eax
	cmpl	$7, %eax
	jg	.L1867
.L2160:
	movq	112(%rsp), %rax
	leaq	(%rcx,%rax), %r8
.L1869:
	addq	144(%rsp), %r9
	movl	380(%rsp), %edi
	movq	%r8, %rcx
.L1863:
	testl	%edi, %edi
	jle	.L1853
	movzbl	(%rcx), %eax
	shrb	$7, %al
	imull	%edx, %eax
	movb	%al, (%r9)
	cmpl	$1, %edi
	je	.L1853
	movzbl	(%rcx), %eax
	shrb	$6, %al
	andl	$1, %eax
	imull	%edx, %eax
	movb	%al, 1(%r9)
	cmpl	$2, %edi
	je	.L1853
	movzbl	(%rcx), %eax
	shrb	$5, %al
	andl	$1, %eax
	imull	%edx, %eax
	movb	%al, 2(%r9)
	cmpl	$3, %edi
	je	.L1853
	movzbl	(%rcx), %eax
	shrb	$4, %al
	andl	$1, %eax
	imull	%edx, %eax
	movb	%al, 3(%r9)
	cmpl	$4, %edi
	je	.L1853
	movzbl	(%rcx), %eax
	shrb	$3, %al
	andl	$1, %eax
	imull	%edx, %eax
	movb	%al, 4(%r9)
	cmpl	$5, %edi
	je	.L1853
	movzbl	(%rcx), %eax
	shrb	$2, %al
	andl	$1, %eax
	imull	%edx, %eax
	movb	%al, 5(%r9)
	cmpl	$7, %edi
	jne	.L1853
	movzbl	(%rcx), %eax
	shrb	%al
	andl	$1, %eax
	imull	%edx, %eax
	movb	%al, 6(%r9)
	jmp	.L1853
.L2167:
	leaq	.LC96(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L1656
.L1709:
	movl	%edx, %edx
	xorl	%ecx, %ecx
	addq	%rdi, %rax
	.p2align 4
	.p2align 3
.L1716:
	movzbl	(%r14,%rcx), %esi
	addb	(%rax,%rcx), %sil
	movb	%sil, (%rdi,%rcx)
	incq	%rcx
	cmpq	%rcx, %rdx
	jne	.L1716
	jmp	.L1693
.L1742:
	movl	%edx, %edx
	xorl	%eax, %eax
	addq	%rdi, %rsi
	.p2align 4
	.p2align 3
.L1746:
	movzbl	(%rsi,%rax), %ecx
	shrb	%cl
	addb	(%r14,%rax), %cl
	movb	%cl, (%rdi,%rax)
	incq	%rax
	cmpq	%rdx, %rax
	jne	.L1746
	jmp	.L1693
.L1718:
	movl	%edx, %edx
	xorl	%ecx, %ecx
	.p2align 4
	.p2align 3
.L1725:
	movzbl	(%rax,%rcx), %esi
	addb	(%r14,%rcx), %sil
	movb	%sil, (%rdi,%rcx)
	incq	%rcx
	cmpq	%rcx, %rdx
	jne	.L1725
	jmp	.L1693
.L1727:
	movl	%edx, %edx
	xorl	%esi, %esi
	leaq	(%rdi,%rcx), %r9
	.p2align 4
	.p2align 3
.L1731:
	movzbl	(%r9,%rsi), %ecx
	movzbl	(%rax,%rsi), %r8d
	addl	%r8d, %ecx
	sarl	%ecx
	addb	(%r14,%rsi), %cl
	movb	%cl, (%rdi,%rsi)
	incq	%rsi
	cmpq	%rsi, %rdx
	jne	.L1731
	jmp	.L1693
.L1748:
	movl	%edx, %edx
	xorl	%ecx, %ecx
	addq	%rdi, %rax
	.p2align 4
	.p2align 3
.L1755:
	movzbl	(%r14,%rcx), %esi
	addb	(%rax,%rcx), %sil
	movb	%sil, (%rdi,%rcx)
	incq	%rcx
	cmpq	%rdx, %rcx
	jne	.L1755
	jmp	.L1693
.L2177:
	movl	216(%rsp), %edx
	imull	212(%rsp), %edx
	movq	184(%rsp), %rax
	imull	172(%rsp), %edx
	movq	24(%rax), %rsi
	testl	%edx, %edx
	je	.L1670
	leal	-1(%rdx), %eax
	cmpl	$6, %eax
	jbe	.L1907
	movl	%edx, %ecx
	movq	%rsi, %rax
	shrl	$3, %ecx
	decl	%ecx
	salq	$4, %rcx
	leaq	16(%rsi,%rcx), %rcx
.L1878:
	vmovdqu	(%rax), %xmm0
	addq	$16, %rax
	vpsrlw	$8, %xmm0, %xmm1
	vpsllw	$8, %xmm0, %xmm0
	vpor	%xmm0, %xmm1, %xmm0
	vmovdqu	%xmm0, -16(%rax)
	cmpq	%rax, %rcx
	jne	.L1878
	movl	%edx, %eax
	andl	$-8, %eax
	movl	%eax, %ecx
	leaq	(%rsi,%rcx,2), %rcx
	cmpl	%eax, %edx
	je	.L1670
.L1877:
	movl	%edx, %edi
	subl	%eax, %edi
	leal	-1(%rdi), %r8d
	cmpl	$2, %r8d
	jbe	.L1880
	movl	%eax, %r8d
	leaq	(%rsi,%r8,2), %rsi
	vmovq	(%rsi), %xmm0
	vpsrlw	$8, %xmm0, %xmm1
	vpsllw	$8, %xmm0, %xmm0
	vpor	%xmm0, %xmm1, %xmm0
	vmovq	%xmm0, (%rsi)
	movl	%edi, %esi
	andl	$-4, %esi
	movl	%esi, %r8d
	addl	%esi, %eax
	leaq	(%rcx,%r8,2), %rcx
	cmpl	%esi, %edi
	je	.L1670
.L1880:
	movbew	(%rcx), %si
	movw	%si, (%rcx)
	leal	1(%rax), %esi
	cmpl	%edx, %esi
	jnb	.L1670
	movbew	2(%rcx), %si
	addl	$2, %eax
	movw	%si, 2(%rcx)
	cmpl	%edx, %eax
	jnb	.L1670
	movbew	4(%rcx), %ax
	movw	%ax, 4(%rcx)
	jmp	.L1670
.L1847:
	movq	(%rsp), %rax
	movq	%r9, %r8
	leaq	(%rcx,%rax), %rdi
.L1850:
	movzbl	(%rcx), %eax
	addq	$2, %r8
	incq	%rcx
	shrb	$4, %al
	imull	%edx, %eax
	movb	%al, -2(%r8)
	movzbl	-1(%rcx), %eax
	andl	$15, %eax
	imull	%edx, %eax
	movb	%al, -1(%r8)
	cmpq	%rdi, %rcx
	jne	.L1850
	jmp	.L1851
.L1856:
	movq	96(%rsp), %rax
	movq	%r9, %r8
	leaq	(%rcx,%rax), %rdi
.L1860:
	movzbl	(%rcx), %eax
	addq	$4, %r8
	incq	%rcx
	shrb	$6, %al
	imull	%edx, %eax
	movb	%al, -4(%r8)
	movzbl	-1(%rcx), %eax
	shrb	$4, %al
	andl	$3, %eax
	imull	%edx, %eax
	movb	%al, -3(%r8)
	movzbl	-1(%rcx), %eax
	shrb	$2, %al
	andl	$3, %eax
	imull	%edx, %eax
	movb	%al, -2(%r8)
	movzbl	-1(%rcx), %eax
	andl	$3, %eax
	imull	%edx, %eax
	movb	%al, -1(%r8)
	cmpq	%rdi, %rcx
	jne	.L1860
	jmp	.L1861
.L1864:
	movq	112(%rsp), %rax
	movq	%r9, %rdi
	leaq	(%rcx,%rax), %r8
.L1868:
	movzbl	(%rcx), %eax
	addq	$8, %rdi
	incq	%rcx
	shrb	$7, %al
	imull	%edx, %eax
	movb	%al, -8(%rdi)
	movzbl	-1(%rcx), %eax
	shrb	$6, %al
	andl	$1, %eax
	imull	%edx, %eax
	movb	%al, -7(%rdi)
	movzbl	-1(%rcx), %eax
	shrb	$5, %al
	andl	$1, %eax
	imull	%edx, %eax
	movb	%al, -6(%rdi)
	movzbl	-1(%rcx), %eax
	shrb	$4, %al
	andl	$1, %eax
	imull	%edx, %eax
	movb	%al, -5(%rdi)
	movzbl	-1(%rcx), %eax
	shrb	$3, %al
	andl	$1, %eax
	imull	%edx, %eax
	movb	%al, -4(%rdi)
	movzbl	-1(%rcx), %eax
	shrb	$2, %al
	andl	$1, %eax
	imull	%edx, %eax
	movb	%al, -3(%rdi)
	movzbl	-1(%rcx), %eax
	shrb	%al
	andl	$1, %eax
	imull	%edx, %eax
	movb	%al, -2(%rdi)
	movzbl	-1(%rcx), %eax
	andl	$1, %eax
	imull	%edx, %eax
	movb	%al, -1(%rdi)
	cmpq	%r8, %rcx
	jne	.L1868
	jmp	.L1869
.L1888:
	xorl	%esi, %esi
	xorl	%ecx, %ecx
	addq	%rdi, %rax
	jmp	.L1710
.L1891:
	xorl	%esi, %esi
	xorl	%ecx, %ecx
	addq	%rdi, %rax
	jmp	.L1749
.L1903:
	movl	404(%rsp), %eax
	jmp	.L1846
.L1889:
	xorl	%esi, %esi
	xorl	%r8d, %r8d
	jmp	.L1719
.L1904:
	movl	404(%rsp), %edi
	jmp	.L1855
.L1905:
	movl	404(%rsp), %edi
	jmp	.L1863
.L2172:
	leaq	__PRETTY_FUNCTION__.47(%rip), %rcx
	movl	$4691, %edx
	leaq	.LC14(%rip), %rsi
	leaq	.LC97(%rip), %rdi
	call	__assert_fail@PLT
.L2183:
	leaq	__PRETTY_FUNCTION__.47(%rip), %rcx
	movl	$4780, %edx
	leaq	.LC14(%rip), %rsi
	leaq	.LC102(%rip), %rdi
	call	__assert_fail@PLT
	.p2align 4
	.p2align 3
.L1907:
	movq	%rsi, %rcx
	xorl	%eax, %eax
	jmp	.L1877
.L2165:
	leaq	__PRETTY_FUNCTION__.47(%rip), %rcx
	movl	$4607, %edx
	leaq	.LC14(%rip), %rsi
	leaq	.LC92(%rip), %rdi
	call	__assert_fail@PLT
	.cfi_endproc
.LFE705:
	.size	stbi__create_png_image_raw, .-stbi__create_png_image_raw
	.section	.rodata.str1.1
.LC103:
	.string	"#?RADIANCE\n"
.LC104:
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
	leaq	57(%rdi), %r14
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	leaq	56(%rdi), %r13
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	leaq	1+.LC103(%rip), %r12
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
	jmp	.L2190
	.p2align 4
	.p2align 3
.L2185:
	movl	48(%rbx), %eax
	testl	%eax, %eax
	jne	.L2208
.L2186:
	cmpl	%eax, %ebp
	jne	.L2189
.L2210:
	movsbl	(%r12), %ebp
	incq	%r12
	testb	%bpl, %bpl
	je	.L2209
.L2190:
	cmpq	%rcx, %rdx
	jnb	.L2185
	leaq	1(%rdx), %rsi
	movq	%rsi, 192(%rbx)
	movzbl	(%rdx), %eax
	movq	%rsi, %rdx
	cmpl	%eax, %ebp
	je	.L2210
.L2189:
	vmovdqu	208(%rbx), %xmm2
	movq	216(%rbx), %rdx
	leaq	1+.LC104(%rip), %r13
	movl	$35, %ebp
	movq	208(%rbx), %rax
	leaq	56(%rbx), %r14
	leaq	57(%rbx), %r12
	vmovdqu	%xmm2, 192(%rbx)
	jmp	.L2197
	.p2align 4
	.p2align 3
.L2192:
	movl	48(%rbx), %eax
	testl	%eax, %eax
	jne	.L2211
.L2193:
	cmpl	%eax, %ebp
	jne	.L2198
.L2212:
	movsbl	0(%r13), %ebp
	incq	%r13
	testb	%bpl, %bpl
	je	.L2199
	movq	192(%rbx), %rax
	movq	200(%rbx), %rdx
.L2197:
	cmpq	%rdx, %rax
	jnb	.L2192
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rbx)
	movzbl	(%rax), %eax
	cmpl	%eax, %ebp
	je	.L2212
.L2198:
	xorl	%r8d, %r8d
.L2196:
	movq	208(%rbx), %rax
	movq	%rax, 192(%rbx)
	movq	216(%rbx), %rax
	jmp	.L2191
	.p2align 4
	.p2align 3
.L2208:
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%r13, %rsi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	movq	%r14, %rdx
	testl	%eax, %eax
	jne	.L2187
	movl	$0, 48(%rbx)
	movq	%r14, %rcx
	movb	$0, 56(%rbx)
.L2188:
	vmovq	%r14, %xmm1
	vpinsrq	$1, %rcx, %xmm1, %xmm0
	vmovdqu	%xmm0, 192(%rbx)
	jmp	.L2186
	.p2align 4
	.p2align 3
.L2187:
	cltq
	leaq	0(%r13,%rax), %rcx
	movzbl	56(%rbx), %eax
	jmp	.L2188
	.p2align 4
	.p2align 3
.L2209:
	movq	208(%rbx), %rax
	movl	$1, %r8d
	movq	%rax, 192(%rbx)
	movq	216(%rbx), %rax
.L2191:
	movq	%rax, 200(%rbx)
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	movl	%r8d, %eax
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.p2align 4
	.p2align 3
.L2211:
	.cfi_restore_state
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%r14, %rsi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	testl	%eax, %eax
	je	.L2213
	cltq
	leaq	(%r14,%rax), %rdx
	movzbl	56(%rbx), %eax
.L2195:
	vmovq	%r12, %xmm3
	vpinsrq	$1, %rdx, %xmm3, %xmm0
	vmovdqu	%xmm0, 192(%rbx)
	jmp	.L2193
	.p2align 4
	.p2align 3
.L2213:
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	movq	%r12, %rdx
	jmp	.L2195
	.p2align 4
	.p2align 3
.L2199:
	movl	$1, %r8d
	jmp	.L2196
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
	jb	.L2221
	movl	48(%rdi), %eax
	xorl	%r12d, %r12d
	testl	%eax, %eax
	jne	.L2222
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	movl	%r12d, %eax
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4
	.p2align 3
.L2221:
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
	.p2align 4
	.p2align 3
.L2222:
	.cfi_restore_state
	leaq	56(%rdi), %rbp
	movl	52(%rdi), %edx
	movq	40(%rdi), %rdi
	movq	%rbp, %rsi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	leaq	57(%rbx), %rdx
	testl	%eax, %eax
	jne	.L2217
	movl	$0, 48(%rbx)
	movq	%rdx, %rbp
	movb	$0, 56(%rbx)
.L2218:
	vmovq	%rdx, %xmm1
	vpinsrq	$1, %rbp, %xmm1, %xmm0
	movl	%r12d, %eax
	vmovdqu	%xmm0, 192(%rbx)
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4
	.p2align 3
.L2217:
	.cfi_restore_state
	cltq
	movzbl	56(%rbx), %r12d
	addq	%rax, %rbp
	jmp	.L2218
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
	movl	20(%rdi), %r12d
	movq	%fs:40, %rax
	movq	%rax, 2696(%rsp)
	movl	16(%rdi), %eax
	cmpl	$4, %eax
	jle	.L2350
.L2224:
	movl	%r12d, %ebp
	subl	$5, %eax
	shrl	$5, %ebp
	movl	%eax, 16(%rbx)
	movl	%ebp, 20(%rbx)
	cmpl	$4, %eax
	jle	.L2351
.L2229:
	movl	%ebp, %r8d
	subl	$5, %eax
	shrl	$5, %r8d
	movl	%eax, 16(%rbx)
	movl	%r8d, 20(%rbx)
	cmpl	$3, %eax
	jle	.L2352
.L2234:
	movl	%r8d, %ecx
	subl	$4, %eax
	andl	$15, %r8d
	vpxor	%xmm0, %xmm0, %xmm0
	shrl	$4, %ecx
	movl	%eax, 16(%rbx)
	addl	$4, %r8d
	vmovdqa	%xmm0, 2208(%rsp)
	movl	%ecx, 20(%rbx)
	movw	$0, 2224(%rsp)
	xorl	%esi, %esi
	leaq	length_dezigzag.31(%rip), %r10
	movb	$0, 2226(%rsp)
	jmp	.L2244
	.p2align 4
	.p2align 3
.L2239:
	movzbl	(%r10,%rsi), %edx
	movl	%ecx, %edi
	subl	$3, %eax
	shrl	$3, %ecx
	andl	$7, %edi
	incq	%rsi
	movl	%ecx, 20(%rbx)
	movl	%eax, 16(%rbx)
	movb	%dil, 2208(%rsp,%rdx)
	cmpl	%esi, %r8d
	jle	.L2353
.L2244:
	cmpl	$2, %eax
	jg	.L2239
	movq	8(%rbx), %rdi
	jmp	.L2243
	.p2align 4
	.p2align 3
.L2240:
	movq	(%rbx), %rdx
	cmpq	%rdi, %rdx
	jnb	.L2241
	leaq	1(%rdx), %r9
	movq	%r9, (%rbx)
	movzbl	(%rdx), %edx
	shlx	%eax, %edx, %edx
	orl	%edx, %ecx
.L2241:
	addl	$8, %eax
	movl	%ecx, 20(%rbx)
	movl	%eax, 16(%rbx)
	cmpl	$24, %eax
	jg	.L2239
.L2243:
	shrx	%eax, %ecx, %edx
	testl	%edx, %edx
	je	.L2240
	movq	%rdi, (%rbx)
	jmp	.L2239
	.p2align 4
	.p2align 3
.L2353:
	leaq	176(%rsp), %r13
	vpxor	%xmm0, %xmm0, %xmm0
	xorl	%esi, %esi
	movl	$1024, %edx
	movq	%r13, %rdi
	vmovdqa	%xmm0, 96(%rsp)
	vmovdqa	%xmm0, 112(%rsp)
	vmovdqa	%xmm0, 128(%rsp)
	vmovdqa	%xmm0, 144(%rsp)
	movl	$0, 160(%rsp)
	call	memset@PLT
	leaq	2208(%rsp), %rcx
	leaq	2227(%rsp), %rsi
	movq	%rcx, %rax
	.p2align 4
	.p2align 3
.L2245:
	movzbl	(%rax), %edx
	incq	%rax
	incl	96(%rsp,%rdx,4)
	cmpq	%rax, %rsi
	jne	.L2245
	movl	100(%rsp), %esi
	movl	$0, 96(%rsp)
	cmpl	$2, %esi
	jg	.L2246
	movl	104(%rsp), %edx
	cmpl	$4, %edx
	jg	.L2246
	movl	108(%rsp), %edi
	cmpl	$8, %edi
	jg	.L2246
	movl	112(%rsp), %r8d
	cmpl	$16, %r8d
	jg	.L2246
	movl	116(%rsp), %r9d
	cmpl	$32, %r9d
	jg	.L2246
	movl	120(%rsp), %r10d
	cmpl	$64, %r10d
	jg	.L2246
	movl	124(%rsp), %r11d
	cmpl	$128, %r11d
	jg	.L2246
	movl	128(%rsp), %r14d
	cmpl	$256, %r14d
	jg	.L2246
	movl	132(%rsp), %eax
	movl	%eax, 4(%rsp)
	cmpl	$512, %eax
	jg	.L2246
	movl	136(%rsp), %eax
	movl	%eax, 8(%rsp)
	cmpl	$1024, %eax
	jg	.L2246
	movl	140(%rsp), %eax
	movl	%eax, 12(%rsp)
	cmpl	$2048, %eax
	jg	.L2246
	movl	144(%rsp), %eax
	movl	%eax, 16(%rsp)
	cmpl	$4096, %eax
	jg	.L2246
	movl	148(%rsp), %eax
	movl	%eax, 20(%rsp)
	cmpl	$8192, %eax
	jg	.L2246
	movl	152(%rsp), %eax
	movl	%eax, 24(%rsp)
	cmpl	$16384, %eax
	jg	.L2246
	movl	156(%rsp), %eax
	movl	%eax, 28(%rsp)
	cmpl	$32768, %eax
	jg	.L2246
	movl	%esi, %eax
	movl	$0, 36(%rsp)
	movw	$0, 1202(%rsp)
	sall	$15, %eax
	movw	$0, 1302(%rsp)
	movw	%si, 1304(%rsp)
	movl	%eax, 1236(%rsp)
	leal	(%rsi,%rsi), %eax
	movl	%eax, 40(%rsp)
	movw	%ax, 1204(%rsp)
	addl	%edx, %eax
	testl	%edx, %edx
	je	.L2249
	cmpl	$4, %eax
	jg	.L2278
.L2249:
	movl	%eax, %r15d
	addl	%esi, %edx
	addl	%eax, %eax
	sall	$14, %r15d
	movl	%eax, 44(%rsp)
	movw	%ax, 1206(%rsp)
	addl	%edi, %eax
	movl	%r15d, 1240(%rsp)
	movw	%dx, 1306(%rsp)
	testl	%edi, %edi
	je	.L2251
	cmpl	$8, %eax
	jg	.L2278
.L2251:
	movl	%eax, %esi
	addl	%edi, %edx
	addl	%eax, %eax
	sall	$13, %esi
	movl	%eax, 48(%rsp)
	movw	%ax, 1208(%rsp)
	addl	%r8d, %eax
	movl	%esi, 1244(%rsp)
	movw	%dx, 1308(%rsp)
	testl	%r8d, %r8d
	je	.L2252
	cmpl	$16, %eax
	jg	.L2278
.L2252:
	movl	%eax, %esi
	addl	%r8d, %edx
	addl	%eax, %eax
	sall	$12, %esi
	movl	%eax, 52(%rsp)
	movw	%ax, 1210(%rsp)
	addl	%r9d, %eax
	movl	%esi, 1248(%rsp)
	movw	%dx, 1310(%rsp)
	testl	%r9d, %r9d
	je	.L2253
	cmpl	$32, %eax
	jg	.L2278
.L2253:
	movl	%eax, %esi
	addl	%r9d, %edx
	addl	%eax, %eax
	sall	$11, %esi
	movl	%eax, 56(%rsp)
	movw	%ax, 1212(%rsp)
	addl	%r10d, %eax
	movl	%esi, 1252(%rsp)
	movw	%dx, 1312(%rsp)
	testl	%r10d, %r10d
	je	.L2254
	cmpl	$64, %eax
	jg	.L2278
.L2254:
	movl	%eax, %esi
	addl	%r10d, %edx
	addl	%eax, %eax
	sall	$10, %esi
	movl	%eax, 60(%rsp)
	movw	%ax, 1214(%rsp)
	addl	%r11d, %eax
	movl	%esi, 1256(%rsp)
	movw	%dx, 1314(%rsp)
	testl	%r11d, %r11d
	je	.L2255
	cmpl	$128, %eax
	jg	.L2278
.L2255:
	movl	%eax, %esi
	addl	%r11d, %edx
	addl	%eax, %eax
	sall	$9, %esi
	movl	%eax, 64(%rsp)
	movw	%ax, 1216(%rsp)
	addl	%r14d, %eax
	movl	%esi, 1260(%rsp)
	movw	%dx, 1316(%rsp)
	testl	%r14d, %r14d
	je	.L2256
	cmpl	$256, %eax
	jg	.L2278
.L2256:
	movl	4(%rsp), %edi
	movl	%eax, %esi
	addl	%r14d, %edx
	addl	%eax, %eax
	sall	$8, %esi
	movl	%eax, 68(%rsp)
	movw	%ax, 1218(%rsp)
	movl	%esi, 1264(%rsp)
	movw	%dx, 1318(%rsp)
	addl	%edi, %eax
	testl	%edi, %edi
	je	.L2257
	cmpl	$512, %eax
	jg	.L2278
.L2257:
	addl	4(%rsp), %edx
	movl	8(%rsp), %edi
	movl	%eax, %esi
	addl	%eax, %eax
	sall	$7, %esi
	movl	%eax, 72(%rsp)
	movw	%ax, 1220(%rsp)
	movl	%esi, 1268(%rsp)
	addl	%edi, %eax
	movw	%dx, 1320(%rsp)
	testl	%edi, %edi
	je	.L2258
	cmpl	$1024, %eax
	jg	.L2278
.L2258:
	addl	8(%rsp), %edx
	movl	12(%rsp), %edi
	movl	%eax, %esi
	addl	%eax, %eax
	sall	$6, %esi
	movl	%eax, 76(%rsp)
	movw	%ax, 1222(%rsp)
	movl	%esi, 1272(%rsp)
	addl	%edi, %eax
	movw	%dx, 1322(%rsp)
	testl	%edi, %edi
	je	.L2259
	cmpl	$2048, %eax
	jg	.L2278
.L2259:
	addl	12(%rsp), %edx
	movl	16(%rsp), %edi
	movl	%eax, %esi
	addl	%eax, %eax
	sall	$5, %esi
	movl	%eax, 80(%rsp)
	movw	%ax, 1224(%rsp)
	movl	%esi, 1276(%rsp)
	addl	%edi, %eax
	movw	%dx, 1324(%rsp)
	testl	%edi, %edi
	je	.L2260
	cmpl	$4096, %eax
	jg	.L2278
.L2260:
	movl	%eax, %esi
	addl	16(%rsp), %edx
	addl	%eax, %eax
	sall	$4, %esi
	movl	%eax, 84(%rsp)
	movw	%ax, 1226(%rsp)
	movl	%esi, 1280(%rsp)
	movl	20(%rsp), %esi
	movw	%dx, 1326(%rsp)
	addl	%esi, %eax
	testl	%esi, %esi
	je	.L2261
	cmpl	$8192, %eax
	jg	.L2278
.L2261:
	addl	20(%rsp), %edx
	movl	24(%rsp), %edi
	leal	0(,%rax,8), %esi
	addl	%eax, %eax
	movl	%eax, 88(%rsp)
	movw	%ax, 1228(%rsp)
	movl	%esi, 1284(%rsp)
	addl	%edi, %eax
	movw	%dx, 1328(%rsp)
	testl	%edi, %edi
	je	.L2262
	cmpl	$16384, %eax
	jg	.L2278
.L2262:
	leal	0(,%rax,4), %esi
	addl	24(%rsp), %edx
	addl	%eax, %eax
	movl	%esi, 1288(%rsp)
	movl	28(%rsp), %esi
	movl	%eax, 92(%rsp)
	movw	%ax, 1230(%rsp)
	movw	%dx, 1330(%rsp)
	addl	%esi, %eax
	testl	%esi, %esi
	jne	.L2354
.L2263:
	addl	%eax, %eax
	movl	$65536, 1296(%rsp)
	xorl	%edx, %edx
	movl	$1, %r11d
	movl	%eax, 1292(%rsp)
	movl	$16, %r10d
	jmp	.L2268
	.p2align 4
	.p2align 3
.L2267:
	incl	%edi
	movl	%edi, 32(%rsp,%r8,4)
.L2264:
	incq	%rdx
	cmpq	$19, %rdx
	je	.L2355
.L2268:
	movzbl	(%rcx,%rdx), %r14d
	testl	%r14d, %r14d
	je	.L2264
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
	jg	.L2267
	movl	%edi, %r15d
	leal	(%rdi,%rdi), %eax
	movl	%r14d, %r9d
	shlx	%r14d, %r11d, %esi
	sarl	%r15d
	andl	$43690, %eax
	sall	$9, %r9d
	movslq	%esi, %rsi
	andl	$21845, %r15d
	orl	%edx, %r9d
	orl	%r15d, %eax
	movl	%eax, %r15d
	sall	$2, %eax
	sarl	$2, %r15d
	andl	$52428, %eax
	andl	$13107, %r15d
	orl	%r15d, %eax
	movl	%eax, %r15d
	sall	$4, %eax
	sarl	$4, %r15d
	andl	$61680, %eax
	andl	$3855, %r15d
	orl	%eax, %r15d
	movl	%r15d, %eax
	sall	$8, %r15d
	movzwl	%r15w, %r15d
	sarl	$8, %eax
	orl	%r15d, %eax
	movl	%r10d, %r15d
	subl	%r14d, %r15d
	sarx	%r15d, %eax, %eax
	cltq
	.p2align 4
	.p2align 3
.L2266:
	movw	%r9w, 0(%r13,%rax,2)
	addq	%rsi, %rax
	cmpl	$511, %eax
	jle	.L2266
	jmp	.L2267
	.p2align 4
	.p2align 3
.L2246:
	leaq	.LC68(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
.L2223:
	movq	2696(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L2356
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
.L2358:
	.cfi_restore_state
	je	.L2357
	.p2align 4
	.p2align 3
.L2278:
	leaq	.LC69(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L2223
	.p2align 4
	.p2align 3
.L2355:
	andl	$31, %r12d
	andl	$31, %ebp
	xorl	%r15d, %r15d
	leal	257(%r12), %eax
	movl	%eax, 4(%rsp)
	leal	1(%rbp), %eax
	leal	258(%r12,%rbp), %ebp
	leaq	2240(%rsp), %r12
	movl	%eax, 8(%rsp)
	jmp	.L2291
	.p2align 4
	.p2align 3
.L2359:
	movslq	%r15d, %rdx
	incl	%r15d
	movb	%al, 2240(%rsp,%rdx)
.L2271:
	cmpl	%r15d, %ebp
	jle	.L2358
.L2291:
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	stbi__zhuffman_decode
	cmpl	$18, %eax
	ja	.L2278
	cmpl	$15, %eax
	jle	.L2359
	movl	16(%rbx), %edx
	movl	20(%rbx), %ecx
	cmpl	$16, %eax
	je	.L2360
	cmpl	$17, %eax
	je	.L2361
	cmpl	$6, %edx
	jle	.L2362
.L2286:
	movl	%ecx, %eax
	subl	$7, %edx
	andl	$127, %ecx
	xorl	%esi, %esi
	shrl	$7, %eax
	movl	%edx, 16(%rbx)
	leal	11(%rcx), %r14d
	movl	%eax, 20(%rbx)
.L2279:
	movl	%ebp, %eax
	subl	%r15d, %eax
	cmpl	%r14d, %eax
	jl	.L2278
	movslq	%r15d, %rdi
	movslq	%r14d, %rdx
	addl	%r14d, %r15d
	addq	%r12, %rdi
	call	memset@PLT
	jmp	.L2271
	.p2align 4
	.p2align 3
.L2360:
	cmpl	$1, %edx
	jle	.L2363
.L2273:
	movl	%ecx, %eax
	subl	$2, %edx
	andl	$3, %ecx
	shrl	$2, %eax
	movl	%edx, 16(%rbx)
	leal	3(%rcx), %r14d
	movl	%eax, 20(%rbx)
	testl	%r15d, %r15d
	je	.L2278
	leal	-1(%r15), %eax
	cltq
	movzbl	2240(%rsp,%rax), %esi
	jmp	.L2279
	.p2align 4
	.p2align 3
.L2361:
	cmpl	$2, %edx
	jle	.L2364
.L2281:
	movl	%ecx, %eax
	subl	$3, %edx
	andl	$7, %ecx
	xorl	%esi, %esi
	shrl	$3, %eax
	movl	%edx, 16(%rbx)
	leal	3(%rcx), %r14d
	movl	%eax, 20(%rbx)
	jmp	.L2279
	.p2align 4
	.p2align 3
.L2352:
	movq	8(%rbx), %rcx
	jmp	.L2238
	.p2align 4
	.p2align 3
.L2235:
	movq	(%rbx), %rdx
	cmpq	%rcx, %rdx
	jnb	.L2236
	leaq	1(%rdx), %rsi
	movq	%rsi, (%rbx)
	movzbl	(%rdx), %edx
	shlx	%eax, %edx, %edx
	orl	%edx, %r8d
.L2236:
	addl	$8, %eax
	movl	%r8d, 20(%rbx)
	movl	%eax, 16(%rbx)
	cmpl	$24, %eax
	jg	.L2234
.L2238:
	shrx	%eax, %r8d, %edx
	testl	%edx, %edx
	je	.L2235
	movq	%rcx, (%rbx)
	jmp	.L2234
	.p2align 4
	.p2align 3
.L2351:
	movq	8(%rbx), %rcx
	jmp	.L2233
	.p2align 4
	.p2align 3
.L2230:
	movq	(%rbx), %rdx
	cmpq	%rcx, %rdx
	jnb	.L2231
	leaq	1(%rdx), %rsi
	movq	%rsi, (%rbx)
	movzbl	(%rdx), %edx
	shlx	%eax, %edx, %edx
	orl	%edx, %ebp
.L2231:
	addl	$8, %eax
	movl	%ebp, 20(%rbx)
	movl	%eax, 16(%rbx)
	cmpl	$24, %eax
	jg	.L2229
.L2233:
	shrx	%eax, %ebp, %edx
	testl	%edx, %edx
	je	.L2230
	movq	%rcx, (%rbx)
	jmp	.L2229
	.p2align 4
	.p2align 3
.L2350:
	movq	8(%rdi), %rcx
	jmp	.L2228
	.p2align 4
	.p2align 3
.L2225:
	movq	(%rbx), %rdx
	cmpq	%rcx, %rdx
	jnb	.L2226
	leaq	1(%rdx), %rsi
	movq	%rsi, (%rbx)
	movzbl	(%rdx), %edx
	shlx	%eax, %edx, %edx
	orl	%edx, %r12d
.L2226:
	addl	$8, %eax
	movl	%r12d, 20(%rbx)
	movl	%eax, 16(%rbx)
	cmpl	$24, %eax
	jg	.L2224
.L2228:
	shrx	%eax, %r12d, %edx
	testl	%edx, %edx
	je	.L2225
	movq	%rcx, (%rbx)
	jmp	.L2224
	.p2align 4
	.p2align 3
.L2362:
	movq	8(%rbx), %rsi
	jmp	.L2290
	.p2align 4
	.p2align 3
.L2287:
	movq	(%rbx), %rax
	cmpq	%rsi, %rax
	jnb	.L2288
	leaq	1(%rax), %rdi
	movq	%rdi, (%rbx)
	movzbl	(%rax), %eax
	shlx	%edx, %eax, %eax
	orl	%eax, %ecx
.L2288:
	addl	$8, %edx
	movl	%ecx, 20(%rbx)
	movl	%edx, 16(%rbx)
	cmpl	$24, %edx
	jg	.L2286
.L2290:
	shrx	%edx, %ecx, %eax
	testl	%eax, %eax
	je	.L2287
	movq	%rsi, (%rbx)
	jmp	.L2286
.L2363:
	movq	8(%rbx), %rsi
	jmp	.L2277
	.p2align 4
	.p2align 3
.L2274:
	movq	(%rbx), %rax
	cmpq	%rsi, %rax
	jnb	.L2275
	leaq	1(%rax), %rdi
	movq	%rdi, (%rbx)
	movzbl	(%rax), %eax
	shlx	%edx, %eax, %eax
	orl	%eax, %ecx
.L2275:
	addl	$8, %edx
	movl	%ecx, 20(%rbx)
	movl	%edx, 16(%rbx)
	cmpl	$24, %edx
	jg	.L2273
.L2277:
	shrx	%edx, %ecx, %eax
	testl	%eax, %eax
	je	.L2274
	movq	%rsi, (%rbx)
	jmp	.L2273
.L2354:
	cmpl	$32768, %eax
	jle	.L2263
	jmp	.L2278
	.p2align 4
	.p2align 3
.L2364:
	movq	8(%rbx), %rsi
	jmp	.L2285
	.p2align 4
	.p2align 3
.L2282:
	movq	(%rbx), %rax
	cmpq	%rsi, %rax
	jnb	.L2283
	leaq	1(%rax), %rdi
	movq	%rdi, (%rbx)
	movzbl	(%rax), %eax
	shlx	%edx, %eax, %eax
	orl	%eax, %ecx
.L2283:
	addl	$8, %edx
	movl	%ecx, 20(%rbx)
	movl	%edx, 16(%rbx)
	cmpl	$24, %edx
	jg	.L2281
.L2285:
	shrx	%edx, %ecx, %eax
	testl	%eax, %eax
	je	.L2282
	movq	%rsi, (%rbx)
	jmp	.L2281
.L2357:
	movl	4(%rsp), %r14d
	leaq	2240(%rsp), %rbp
	leaq	52(%rbx), %rdi
	movq	%rbp, %rsi
	movl	%r14d, %edx
	call	stbi__zbuild_huffman
	testl	%eax, %eax
	je	.L2223
	movl	8(%rsp), %edx
	leaq	0(%rbp,%r14), %rsi
	leaq	2072(%rbx), %rdi
	call	stbi__zbuild_huffman
	testl	%eax, %eax
	setne	%al
	movzbl	%al, %eax
	jmp	.L2223
.L2356:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE691:
	.size	stbi__compute_huffman_codes, .-stbi__compute_huffman_codes
	.section	.rodata.str1.1
.LC105:
	.string	"bad zlib header"
.LC106:
	.string	"no preset dict"
.LC107:
	.string	"bad compression"
.LC108:
	.string	"zlib corrupt"
.LC109:
	.string	"read past buffer"
.LC110:
	.string	"output buffer limit"
.LC111:
	.string	"bad huffman code"
.LC112:
	.string	"bad dist"
	.text
	.p2align 4
	.type	stbi__parse_zlib, @function
stbi__parse_zlib:
.LFB694:
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
	movq	%rdi, %rbp
	subq	$184, %rsp
	.cfi_def_cfa_offset 240
	movq	%fs:40, %rax
	movq	%rax, 168(%rsp)
	xorl	%eax, %eax
	testl	%esi, %esi
	jne	.L2722
.L2366:
	xorl	%eax, %eax
	movq	$0, 16(%rbp)
	xorl	%edx, %edx
	testl	%eax, %eax
	jle	.L2723
	.p2align 4
	.p2align 3
.L2373:
	movl	%edx, %ebx
	decl	%eax
	shrl	%edx
	andl	$1, %ebx
	movl	%edx, 20(%rbp)
	movl	%eax, 16(%rbp)
	movl	%ebx, 4(%rsp)
	cmpl	$1, %eax
	jle	.L2724
.L2378:
	movl	%edx, %ecx
	subl	$2, %eax
	shrl	$2, %ecx
	andl	$3, %edx
	movl	%eax, 16(%rbp)
	movl	%ecx, 20(%rbp)
	je	.L2725
	cmpl	$3, %edx
	je	.L2415
	cmpl	$1, %edx
	je	.L2726
	movq	%rbp, %rdi
	call	stbi__compute_huffman_codes
	testl	%eax, %eax
	je	.L2415
	leaq	52(%rbp), %rbx
.L2463:
	movq	24(%rbp), %r15
	leaq	stbi__zdist_extra(%rip), %r14
.L2464:
	movq	%rbx, %rsi
	movq	%rbp, %rdi
	call	stbi__zhuffman_decode
	movl	%eax, %r12d
	cmpl	$255, %eax
	jg	.L2465
	testl	%eax, %eax
	js	.L2482
	movq	40(%rbp), %rax
	cmpq	%r15, %rax
	ja	.L2467
	movl	48(%rbp), %r10d
	movq	%r15, 24(%rbp)
	testl	%r10d, %r10d
	je	.L2491
	movq	32(%rbp), %rdi
	subq	%rdi, %r15
	cmpl	$-1, %r15d
	je	.L2469
	subq	%rdi, %rax
	leal	1(%r15), %ecx
	cmpl	%ecx, %eax
	jnb	.L2470
	testl	%eax, %eax
	jns	.L2471
	jmp	.L2469
	.p2align 4
	.p2align 3
.L2473:
	testl	%eax, %eax
	js	.L2469
.L2471:
	addl	%eax, %eax
	cmpl	%ecx, %eax
	jb	.L2473
.L2470:
	movl	%eax, %r13d
	movq	%r13, %rsi
	call	realloc@PLT
	testq	%rax, %rax
	je	.L2469
	movl	%r15d, %r15d
	addq	%rax, %r15
	vmovq	%r15, %xmm2
	vpinsrq	$1, %rax, %xmm2, %xmm0
	addq	%r13, %rax
	vmovdqu	%xmm0, 24(%rbp)
	movq	%rax, 40(%rbp)
.L2467:
	movb	%r12b, (%r15)
	incq	%r15
	jmp	.L2464
	.p2align 4
	.p2align 3
.L2465:
	cmpl	$256, %eax
	je	.L2727
	subl	$257, %r12d
	leaq	stbi__zlength_base(%rip), %rax
	movslq	%r12d, %r12
	movl	(%rax,%r12,4), %r13d
	leaq	stbi__zlength_extra(%rip), %rax
	movl	(%rax,%r12,4), %ecx
	testl	%ecx, %ecx
	jne	.L2728
.L2476:
	leaq	2072(%rbp), %rsi
	movq	%rbp, %rdi
	call	stbi__zhuffman_decode
	testl	%eax, %eax
	js	.L2482
	cltq
	leaq	stbi__zdist_base(%rip), %rdi
	movl	(%r14,%rax,4), %esi
	movl	(%rdi,%rax,4), %ecx
	testl	%esi, %esi
	jne	.L2729
.L2483:
	movq	32(%rbp), %rdi
	movq	%r15, %rdx
	movslq	%ecx, %r8
	subq	%rdi, %rdx
	cmpq	%r8, %rdx
	jl	.L2730
	movq	40(%rbp), %rsi
	movslq	%r13d, %rax
	addq	%r15, %rax
	cmpq	%rax, %rsi
	jnb	.L2490
	movl	48(%rbp), %r9d
	movq	%r15, 24(%rbp)
	testl	%r9d, %r9d
	je	.L2491
	movl	%r13d, %eax
	addl	%edx, %eax
	jc	.L2469
	subq	%rdi, %rsi
	leal	0(%r13,%rdx), %r9d
	movl	%esi, %eax
	cmpl	%r9d, %esi
	jnb	.L2494
	testl	%esi, %esi
	jns	.L2495
	jmp	.L2469
	.p2align 4
	.p2align 3
.L2496:
	testl	%eax, %eax
	js	.L2469
.L2495:
	addl	%eax, %eax
	cmpl	%r9d, %eax
	jb	.L2496
.L2494:
	movl	%eax, %r12d
	movq	%r8, 16(%rsp)
	movq	%rdx, 8(%rsp)
	movq	%r12, %rsi
	movl	%ecx, 24(%rsp)
	call	realloc@PLT
	testq	%rax, %rax
	je	.L2469
	movq	8(%rsp), %rdx
	movq	16(%rsp), %r8
	movl	24(%rsp), %ecx
	movl	%edx, %edx
	leaq	(%rax,%rdx), %r15
	vmovq	%r15, %xmm3
	vpinsrq	$1, %rax, %xmm3, %xmm0
	addq	%r12, %rax
	vmovdqu	%xmm0, 24(%rbp)
	movq	%rax, 40(%rbp)
.L2490:
	movq	%r15, %rdx
	subq	%r8, %rdx
	cmpl	$1, %ecx
	je	.L2731
	testl	%r13d, %r13d
	je	.L2464
	leaq	-1(%r8), %rax
	leal	-1(%r13), %esi
	cmpq	$14, %rax
	jbe	.L2498
	cmpl	$6, %esi
	jbe	.L2498
	movl	%r13d, %edi
	cmpl	$14, %esi
	jbe	.L2514
	movl	%r13d, %ecx
	xorl	%eax, %eax
	shrl	$4, %ecx
	salq	$4, %rcx
	.p2align 4
	.p2align 3
.L2500:
	vmovdqu	(%rdx,%rax), %xmm1
	vmovdqu	%xmm1, (%r15,%rax)
	addq	$16, %rax
	cmpq	%rax, %rcx
	jne	.L2500
	movl	%r13d, %eax
	andl	$-16, %eax
	movl	%eax, %r9d
	subl	%eax, %r13d
	leaq	(%r15,%r9), %rcx
	addq	%r9, %rdx
	cmpl	%edi, %eax
	je	.L2506
.L2499:
	subl	%eax, %edi
	leal	-1(%rdi), %r9d
	cmpl	$6, %r9d
	jbe	.L2503
	movq	%rax, %r9
	subq	%r8, %r9
	movq	(%r15,%r9), %r8
	movq	%r8, (%r15,%rax)
	movl	%edi, %eax
	andl	$-8, %eax
	movl	%eax, %r8d
	subl	%eax, %r13d
	addq	%r8, %rcx
	addq	%r8, %rdx
	cmpl	%edi, %eax
	je	.L2506
.L2503:
	movzbl	(%rdx), %eax
	movb	%al, (%rcx)
	cmpl	$1, %r13d
	je	.L2506
	movzbl	1(%rdx), %eax
	movb	%al, 1(%rcx)
	cmpl	$2, %r13d
	je	.L2506
	movzbl	2(%rdx), %eax
	movb	%al, 2(%rcx)
	cmpl	$3, %r13d
	je	.L2506
	movzbl	3(%rdx), %eax
	movb	%al, 3(%rcx)
	cmpl	$4, %r13d
	je	.L2506
	movzbl	4(%rdx), %eax
	movb	%al, 4(%rcx)
	cmpl	$5, %r13d
	je	.L2506
	movzbl	5(%rdx), %eax
	movb	%al, 5(%rcx)
	cmpl	$6, %r13d
	je	.L2506
	movzbl	6(%rdx), %eax
	movb	%al, 6(%rcx)
.L2506:
	leaq	1(%r15,%rsi), %r15
	jmp	.L2464
	.p2align 4
	.p2align 3
.L2469:
	leaq	.LC16(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
.L2365:
	movq	168(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L2732
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
	.p2align 4
	.p2align 3
.L2491:
	.cfi_restore_state
	leaq	.LC110(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L2365
	.p2align 4
	.p2align 3
.L2728:
	movl	16(%rbp), %eax
	movl	20(%rbp), %edx
	cmpl	%eax, %ecx
	jg	.L2733
.L2477:
	shrx	%ecx, %edx, %esi
	subl	%ecx, %eax
	bzhi	%ecx, %edx, %edx
	movl	%esi, 20(%rbp)
	movl	%eax, 16(%rbp)
	addl	%edx, %r13d
	jmp	.L2476
	.p2align 4
	.p2align 3
.L2729:
	movl	16(%rbp), %eax
	movl	20(%rbp), %edx
	cmpl	%eax, %esi
	jg	.L2734
.L2484:
	shrx	%esi, %edx, %edi
	subl	%esi, %eax
	bzhi	%esi, %edx, %edx
	movl	%edi, 20(%rbp)
	movl	%eax, 16(%rbp)
	addl	%edx, %ecx
	jmp	.L2483
	.p2align 4
	.p2align 3
.L2731:
	testl	%r13d, %r13d
	je	.L2464
	movsbl	(%rdx), %esi
	leal	-1(%r13), %r12d
	movq	%r15, %rdi
	incq	%r12
	movq	%r12, %rdx
	addq	%r12, %r15
	call	memset@PLT
	jmp	.L2464
	.p2align 4
	.p2align 3
.L2725:
	movl	%eax, %edi
	andl	$7, %edi
	jne	.L2384
	testl	%eax, %eax
	jle	.L2735
.L2385:
	movl	%ecx, %esi
	leal	-8(%rax), %edi
	movb	%cl, 164(%rsp)
	shrl	$8, %esi
	testl	%edi, %edi
	jle	.L2510
	movb	%sil, 165(%rsp)
	movl	%ecx, %r8d
	leal	-16(%rax), %esi
	shrl	$16, %r8d
	testl	%esi, %esi
	jle	.L2511
	movb	%r8b, 166(%rsp)
	shrl	$24, %ecx
	cmpl	$24, %eax
	jle	.L2512
	movb	%cl, 167(%rsp)
.L2393:
	leal	-1(%rax), %ecx
	movl	$1, %r8d
	movl	%edx, 20(%rbp)
	shrl	$3, %ecx
	testl	%eax, %eax
	leal	1(%rcx), %esi
	cmovle	%r8d, %esi
	negl	%ecx
	sall	$3, %ecx
	testl	%eax, %eax
	movl	$0, %eax
	movslq	%esi, %r8
	cmovg	%ecx, %eax
	addl	%edi, %eax
	movl	%eax, 16(%rbp)
	jne	.L2395
	cmpl	$4, %esi
	je	.L2404
	movq	8(%rbp), %rcx
	movq	0(%rbp), %rax
	leal	1(%rsi), %edx
	cmpq	%rax, %rcx
	jbe	.L2398
	leaq	1(%rax), %rdi
	movq	%rdi, 0(%rbp)
	movzbl	(%rax), %r8d
	movslq	%esi, %rax
	movb	%r8b, 164(%rsp,%rax)
	cmpl	$4, %edx
	jne	.L2736
.L2404:
	movzbl	165(%rsp), %edx
	movzbl	164(%rsp), %eax
	movzbl	166(%rsp), %ecx
	sall	$8, %edx
	addl	%eax, %edx
	movzbl	167(%rsp), %eax
	sall	$8, %eax
	addl	%ecx, %eax
	movl	%edx, %ecx
	xorl	$65535, %ecx
	cmpl	%ecx, %eax
	jne	.L2395
	movq	0(%rbp), %rsi
	movslq	%edx, %r13
	leaq	(%rsi,%r13), %rax
	cmpq	%rax, 8(%rbp)
	jb	.L2737
	movq	24(%rbp), %rdi
	movq	40(%rbp), %rcx
	leaq	(%rdi,%r13), %rax
	cmpq	%rax, %rcx
	jnb	.L2406
	movl	48(%rbp), %eax
	testl	%eax, %eax
	je	.L2738
	movq	32(%rbp), %r8
	movl	%edx, %eax
	subq	%r8, %rdi
	addl	%edi, %eax
	movq	%rdi, %r14
	jc	.L2469
	subq	%r8, %rcx
	addl	%edi, %edx
	movl	%ecx, %eax
	cmpl	%edx, %ecx
	jnb	.L2411
	testl	%ecx, %ecx
	jns	.L2412
	jmp	.L2469
	.p2align 4
	.p2align 3
.L2413:
	testl	%eax, %eax
	js	.L2469
.L2412:
	addl	%eax, %eax
	cmpl	%edx, %eax
	jb	.L2413
.L2411:
	movl	%eax, %ebx
	movq	%r8, %rdi
	movq	%rbx, %rsi
	call	realloc@PLT
	testq	%rax, %rax
	je	.L2469
	movl	%r14d, %edi
	movq	0(%rbp), %rsi
	addq	%rax, %rdi
	vmovq	%rdi, %xmm4
	vpinsrq	$1, %rax, %xmm4, %xmm0
	addq	%rbx, %rax
	vmovdqu	%xmm0, 24(%rbp)
	movq	%rax, 40(%rbp)
.L2406:
	movq	%r13, %rdx
	call	memcpy@PLT
	movl	4(%rsp), %eax
	addq	%r13, 0(%rbp)
	addq	%r13, 24(%rbp)
	testl	%eax, %eax
	jne	.L2515
.L2743:
	movl	16(%rbp), %eax
	movl	20(%rbp), %edx
	testl	%eax, %eax
	jg	.L2373
.L2723:
	movq	8(%rbp), %rsi
	jmp	.L2377
	.p2align 4
	.p2align 3
.L2374:
	movq	0(%rbp), %rcx
	cmpq	%rsi, %rcx
	jnb	.L2375
	leaq	1(%rcx), %rdi
	movq	%rdi, 0(%rbp)
	movzbl	(%rcx), %ecx
	shlx	%eax, %ecx, %ecx
	orl	%ecx, %edx
.L2375:
	addl	$8, %eax
	movl	%edx, 20(%rbp)
	movl	%eax, 16(%rbp)
	cmpl	$24, %eax
	jg	.L2373
.L2377:
	shrx	%eax, %edx, %ecx
	testl	%ecx, %ecx
	je	.L2374
	movq	%rsi, 0(%rbp)
	jmp	.L2373
	.p2align 4
	.p2align 3
.L2724:
	movq	8(%rbp), %rsi
	jmp	.L2382
	.p2align 4
	.p2align 3
.L2379:
	movq	0(%rbp), %rcx
	cmpq	%rsi, %rcx
	jnb	.L2380
	leaq	1(%rcx), %rdi
	movq	%rdi, 0(%rbp)
	movzbl	(%rcx), %ecx
	shlx	%eax, %ecx, %ecx
	orl	%ecx, %edx
.L2380:
	addl	$8, %eax
	movl	%edx, 20(%rbp)
	movl	%eax, 16(%rbp)
	cmpl	$24, %eax
	jg	.L2378
.L2382:
	shrx	%eax, %edx, %ecx
	testl	%ecx, %ecx
	je	.L2379
	movq	%rsi, 0(%rbp)
	jmp	.L2378
	.p2align 4
	.p2align 3
.L2726:
	leaq	52(%rbp), %rbx
	vpxor	%xmm0, %xmm0, %xmm0
	movl	$1024, %edx
	xorl	%esi, %esi
	movq	%rbx, %rdi
	vmovdqa	%xmm0, 96(%rsp)
	vmovdqa	%xmm0, 112(%rsp)
	vmovdqa	%xmm0, 128(%rsp)
	vmovdqa	%xmm0, 144(%rsp)
	movl	$0, 160(%rsp)
	call	memset@PLT
	leaq	1+stbi__zdefault_length(%rip), %rax
	movl	$1, 128(%rsp)
	leaq	287(%rax), %rcx
	.p2align 4
	.p2align 3
.L2417:
	movzbl	(%rax), %edx
	incq	%rax
	incl	96(%rsp,%rdx,4)
	cmpq	%rax, %rcx
	jne	.L2417
	movl	100(%rsp), %ecx
	movl	$0, 96(%rsp)
	cmpl	$2, %ecx
	jg	.L2441
	movl	104(%rsp), %edx
	cmpl	$4, %edx
	jg	.L2441
	movl	108(%rsp), %esi
	cmpl	$8, %esi
	jg	.L2441
	movl	112(%rsp), %edi
	cmpl	$16, %edi
	jg	.L2441
	movl	116(%rsp), %r10d
	cmpl	$32, %r10d
	jg	.L2441
	movl	120(%rsp), %r8d
	cmpl	$64, %r8d
	jg	.L2441
	movl	124(%rsp), %r9d
	cmpl	$128, %r9d
	jg	.L2441
	movl	128(%rsp), %r13d
	cmpl	$256, %r13d
	jg	.L2441
	movl	132(%rsp), %r11d
	cmpl	$512, %r11d
	jg	.L2441
	movl	136(%rsp), %r15d
	cmpl	$1024, %r15d
	jg	.L2441
	movl	140(%rsp), %r14d
	cmpl	$2048, %r14d
	jg	.L2441
	movl	144(%rsp), %eax
	movl	%eax, 24(%rsp)
	cmpl	$4096, %eax
	jg	.L2441
	movl	148(%rsp), %eax
	movl	%eax, 8(%rsp)
	cmpl	$8192, %eax
	jg	.L2441
	movl	152(%rsp), %eax
	movl	%eax, 16(%rsp)
	cmpl	$16384, %eax
	jg	.L2441
	movl	156(%rsp), %eax
	movl	%eax, 28(%rsp)
	cmpl	$32768, %eax
	jg	.L2441
	movl	%ecx, %eax
	movl	$0, 36(%rsp)
	movw	$0, 1078(%rbp)
	sall	$15, %eax
	movw	$0, 1178(%rbp)
	movw	%cx, 1180(%rbp)
	movl	%eax, 1112(%rbp)
	leal	(%rcx,%rcx), %eax
	movl	%eax, 40(%rsp)
	movw	%ax, 1080(%rbp)
	addl	%edx, %eax
	testl	%edx, %edx
	je	.L2517
	cmpl	$4, %eax
	jg	.L2443
.L2517:
	movl	%eax, %r12d
	addl	%ecx, %edx
	addl	%eax, %eax
	sall	$14, %r12d
	movl	%eax, 44(%rsp)
	movw	%ax, 1082(%rbp)
	addl	%esi, %eax
	movl	%r12d, 1116(%rbp)
	movw	%dx, 1182(%rbp)
	testl	%esi, %esi
	je	.L2518
	cmpl	$8, %eax
	jg	.L2443
.L2518:
	movl	%eax, %ecx
	addl	%esi, %edx
	addl	%eax, %eax
	sall	$13, %ecx
	movl	%eax, 48(%rsp)
	movw	%ax, 1084(%rbp)
	addl	%edi, %eax
	movl	%ecx, 1120(%rbp)
	movw	%dx, 1184(%rbp)
	testl	%edi, %edi
	je	.L2519
	cmpl	$16, %eax
	jg	.L2443
.L2519:
	movl	%eax, %ecx
	addl	%eax, %eax
	addl	%edi, %edx
	sall	$12, %ecx
	movl	%eax, 52(%rsp)
	movw	%ax, 1086(%rbp)
	addl	%r10d, %eax
	movl	%ecx, 1124(%rbp)
	movw	%dx, 1186(%rbp)
	cmpl	$32, %eax
	jle	.L2520
	testl	%r10d, %r10d
	jne	.L2443
.L2520:
	movl	%eax, %ecx
	addl	%r10d, %edx
	addl	%eax, %eax
	sall	$11, %ecx
	movl	%eax, 56(%rsp)
	movw	%ax, 1088(%rbp)
	addl	%r8d, %eax
	movl	%ecx, 1128(%rbp)
	movw	%dx, 1188(%rbp)
	testl	%r8d, %r8d
	je	.L2521
	cmpl	$64, %eax
	jg	.L2443
.L2521:
	movl	%eax, %ecx
	addl	%r8d, %edx
	addl	%eax, %eax
	sall	$10, %ecx
	movl	%eax, 60(%rsp)
	movw	%ax, 1090(%rbp)
	addl	%r9d, %eax
	movl	%ecx, 1132(%rbp)
	movw	%dx, 1190(%rbp)
	testl	%r9d, %r9d
	je	.L2522
	cmpl	$128, %eax
	jg	.L2443
.L2522:
	movl	%eax, %ecx
	addl	%eax, %eax
	addl	%r9d, %edx
	sall	$9, %ecx
	movl	%eax, 64(%rsp)
	movw	%ax, 1092(%rbp)
	addl	%r13d, %eax
	movl	%ecx, 1136(%rbp)
	movw	%dx, 1192(%rbp)
	cmpl	$256, %eax
	jle	.L2523
	testl	%r13d, %r13d
	jne	.L2443
.L2523:
	movl	%eax, %ecx
	addl	%r13d, %edx
	addl	%eax, %eax
	sall	$8, %ecx
	movl	%eax, 68(%rsp)
	movw	%ax, 1094(%rbp)
	addl	%r11d, %eax
	movl	%ecx, 1140(%rbp)
	movw	%dx, 1194(%rbp)
	testl	%r11d, %r11d
	je	.L2524
	cmpl	$512, %eax
	jg	.L2443
.L2524:
	movl	%eax, %ecx
	addl	%eax, %eax
	addl	%r11d, %edx
	sall	$7, %ecx
	movl	%eax, 72(%rsp)
	movw	%ax, 1096(%rbp)
	addl	%r15d, %eax
	movl	%ecx, 1144(%rbp)
	movw	%dx, 1196(%rbp)
	cmpl	$1024, %eax
	jle	.L2525
	testl	%r15d, %r15d
	jne	.L2443
.L2525:
	movl	%eax, %ecx
	addl	%r15d, %edx
	addl	%eax, %eax
	sall	$6, %ecx
	movl	%eax, 76(%rsp)
	movw	%ax, 1098(%rbp)
	addl	%r14d, %eax
	movl	%ecx, 1148(%rbp)
	movw	%dx, 1198(%rbp)
	testl	%r14d, %r14d
	je	.L2526
	cmpl	$2048, %eax
	jg	.L2443
.L2526:
	movl	24(%rsp), %edi
	movl	%eax, %ecx
	addl	%eax, %eax
	addl	%r14d, %edx
	sall	$5, %ecx
	movl	%eax, 80(%rsp)
	movw	%ax, 1100(%rbp)
	movl	%ecx, 1152(%rbp)
	movw	%dx, 1200(%rbp)
	addl	%edi, %eax
	cmpl	$4096, %eax
	jle	.L2527
	testl	%edi, %edi
	jne	.L2443
.L2527:
	addl	24(%rsp), %edx
	movl	8(%rsp), %edi
	movl	%eax, %ecx
	addl	%eax, %eax
	sall	$4, %ecx
	movl	%eax, 84(%rsp)
	movw	%ax, 1102(%rbp)
	movl	%ecx, 1156(%rbp)
	addl	%edi, %eax
	movw	%dx, 1202(%rbp)
	testl	%edi, %edi
	je	.L2528
	cmpl	$8192, %eax
	jg	.L2443
.L2528:
	addl	8(%rsp), %edx
	movl	16(%rsp), %edi
	leal	0(,%rax,8), %ecx
	addl	%eax, %eax
	movl	%eax, 88(%rsp)
	movw	%ax, 1104(%rbp)
	movl	%ecx, 1160(%rbp)
	addl	%edi, %eax
	movw	%dx, 1204(%rbp)
	cmpl	$16384, %eax
	jle	.L2529
	testl	%edi, %edi
	jne	.L2443
.L2529:
	addl	16(%rsp), %edx
	movl	28(%rsp), %edi
	leal	0(,%rax,4), %ecx
	addl	%eax, %eax
	movl	%eax, 92(%rsp)
	movw	%ax, 1106(%rbp)
	movl	%ecx, 1164(%rbp)
	addl	%edi, %eax
	movw	%dx, 1206(%rbp)
	cmpl	$32768, %eax
	jle	.L2530
	testl	%edi, %edi
	jne	.L2443
.L2530:
	addl	%eax, %eax
	movl	$65536, 1172(%rbp)
	xorl	%edx, %edx
	leaq	stbi__zdefault_length(%rip), %r8
	movl	%eax, 1168(%rbp)
	movl	$1, %r10d
	movl	$16, %r9d
	jmp	.L2435
	.p2align 4
	.p2align 3
.L2439:
	incl	%esi
	movl	%esi, 32(%rsp,%rdi,4)
.L2436:
	incq	%rdx
	cmpq	$288, %rdx
	je	.L2739
.L2435:
	movzbl	(%r8,%rdx), %r12d
	testl	%r12d, %r12d
	je	.L2436
	movslq	%r12d, %rdi
	movl	32(%rsp,%rdi,4), %esi
	movzwl	1076(%rbp,%rdi,2), %r11d
	movl	%esi, %eax
	subl	%r11d, %eax
	movzwl	1176(%rbp,%rdi,2), %r11d
	addl	%r11d, %eax
	cltq
	movb	%r12b, 1208(%rbp,%rax)
	movw	%dx, 1496(%rbp,%rax,2)
	cmpl	$9, %r12d
	jg	.L2439
	movl	%esi, %r13d
	leal	(%rsi,%rsi), %eax
	movl	%r12d, %r11d
	shlx	%r12d, %r10d, %ecx
	sarl	%r13d
	andl	$43690, %eax
	sall	$9, %r11d
	movslq	%ecx, %rcx
	andl	$21845, %r13d
	orl	%edx, %r11d
	orl	%eax, %r13d
	movl	%r13d, %eax
	sall	$2, %r13d
	sarl	$2, %eax
	andl	$52428, %r13d
	andl	$13107, %eax
	orl	%r13d, %eax
	movl	%eax, %r13d
	sall	$4, %eax
	sarl	$4, %r13d
	andl	$61680, %eax
	andl	$3855, %r13d
	orl	%eax, %r13d
	movl	%r13d, %eax
	sall	$8, %r13d
	movzwl	%r13w, %r13d
	sarl	$8, %eax
	orl	%r13d, %eax
	movl	%r9d, %r13d
	subl	%r12d, %r13d
	sarx	%r13d, %eax, %eax
	cltq
	.p2align 4
	.p2align 3
.L2438:
	movw	%r11w, 52(%rbp,%rax,2)
	addq	%rcx, %rax
	cmpl	$511, %eax
	jle	.L2438
	jmp	.L2439
	.p2align 4
	.p2align 3
.L2395:
	leaq	.LC108(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L2365
	.p2align 4
	.p2align 3
.L2739:
	vpxor	%xmm0, %xmm0, %xmm0
	leaq	2072(%rbp), %rdi
	movl	$1024, %edx
	xorl	%esi, %esi
	vmovdqa	%xmm0, 96(%rsp)
	vmovdqa	%xmm0, 112(%rsp)
	vmovdqa	%xmm0, 128(%rsp)
	vmovdqa	%xmm0, 144(%rsp)
	movl	$0, 160(%rsp)
	call	memset@PLT
	leaq	1+stbi__zdefault_distance(%rip), %rax
	movl	$1, 116(%rsp)
	leaq	31(%rax), %rcx
	.p2align 4
	.p2align 3
.L2440:
	movzbl	(%rax), %edx
	incq	%rax
	incl	96(%rsp,%rdx,4)
	cmpq	%rax, %rcx
	jne	.L2440
	movl	100(%rsp), %ecx
	movl	$0, 96(%rsp)
	cmpl	$2, %ecx
	jg	.L2441
	movl	104(%rsp), %edx
	cmpl	$4, %edx
	jg	.L2441
	movl	108(%rsp), %r8d
	cmpl	$8, %r8d
	jg	.L2441
	movl	112(%rsp), %esi
	cmpl	$16, %esi
	jg	.L2441
	movl	116(%rsp), %edi
	cmpl	$32, %edi
	jg	.L2441
	movl	120(%rsp), %r9d
	cmpl	$64, %r9d
	jg	.L2441
	movl	124(%rsp), %r11d
	cmpl	$128, %r11d
	jg	.L2441
	movl	128(%rsp), %r13d
	cmpl	$256, %r13d
	jg	.L2441
	movl	132(%rsp), %r10d
	cmpl	$512, %r10d
	jg	.L2441
	movl	136(%rsp), %r15d
	cmpl	$1024, %r15d
	jg	.L2441
	movl	140(%rsp), %eax
	movl	%eax, 24(%rsp)
	cmpl	$2048, %eax
	jg	.L2441
	movl	144(%rsp), %r14d
	cmpl	$4096, %r14d
	jg	.L2441
	movl	148(%rsp), %eax
	movl	%eax, 8(%rsp)
	cmpl	$8192, %eax
	jg	.L2441
	movl	152(%rsp), %eax
	movl	%eax, 16(%rsp)
	cmpl	$16384, %eax
	jg	.L2441
	movl	156(%rsp), %eax
	movl	%eax, 28(%rsp)
	cmpl	$32768, %eax
	jg	.L2441
	movl	%ecx, %eax
	movl	$0, 36(%rsp)
	movw	$0, 3098(%rbp)
	sall	$15, %eax
	movw	$0, 3198(%rbp)
	movw	%cx, 3200(%rbp)
	movl	%eax, 3132(%rbp)
	leal	(%rcx,%rcx), %eax
	movl	%eax, 40(%rsp)
	movw	%ax, 3100(%rbp)
	addl	%edx, %eax
	cmpl	$4, %eax
	jle	.L2531
	testl	%edx, %edx
	jne	.L2443
.L2531:
	movl	%eax, %r12d
	addl	%eax, %eax
	addl	%ecx, %edx
	sall	$14, %r12d
	movl	%eax, 44(%rsp)
	movw	%ax, 3102(%rbp)
	addl	%r8d, %eax
	movl	%r12d, 3136(%rbp)
	movw	%dx, 3202(%rbp)
	cmpl	$8, %eax
	jle	.L2532
	testl	%r8d, %r8d
	jne	.L2443
.L2532:
	movl	%eax, %ecx
	addl	%r8d, %edx
	addl	%eax, %eax
	sall	$13, %ecx
	movl	%eax, 48(%rsp)
	movw	%ax, 3104(%rbp)
	addl	%esi, %eax
	movl	%ecx, 3140(%rbp)
	movw	%dx, 3204(%rbp)
	testl	%esi, %esi
	je	.L2533
	cmpl	$16, %eax
	jg	.L2443
.L2533:
	movl	%eax, %ecx
	addl	%esi, %edx
	addl	%eax, %eax
	sall	$12, %ecx
	movl	%eax, 52(%rsp)
	movw	%ax, 3106(%rbp)
	addl	%edi, %eax
	movl	%ecx, 3144(%rbp)
	movw	%dx, 3206(%rbp)
	testl	%edi, %edi
	je	.L2534
	cmpl	$32, %eax
	jg	.L2443
.L2534:
	movl	%eax, %ecx
	addl	%edi, %edx
	addl	%eax, %eax
	sall	$11, %ecx
	movl	%eax, 56(%rsp)
	movw	%ax, 3108(%rbp)
	addl	%r9d, %eax
	movl	%ecx, 3148(%rbp)
	movw	%dx, 3208(%rbp)
	testl	%r9d, %r9d
	je	.L2535
	cmpl	$64, %eax
	jg	.L2443
.L2535:
	movl	%eax, %ecx
	addl	%eax, %eax
	addl	%r9d, %edx
	sall	$10, %ecx
	movl	%eax, 60(%rsp)
	movw	%ax, 3110(%rbp)
	addl	%r11d, %eax
	movl	%ecx, 3152(%rbp)
	movw	%dx, 3210(%rbp)
	cmpl	$128, %eax
	jle	.L2536
	testl	%r11d, %r11d
	jne	.L2443
.L2536:
	movl	%eax, %ecx
	addl	%eax, %eax
	addl	%r11d, %edx
	sall	$9, %ecx
	movl	%eax, 64(%rsp)
	movw	%ax, 3112(%rbp)
	addl	%r13d, %eax
	movl	%ecx, 3156(%rbp)
	movw	%dx, 3212(%rbp)
	cmpl	$256, %eax
	jle	.L2537
	testl	%r13d, %r13d
	jne	.L2443
.L2537:
	movl	%eax, %ecx
	addl	%r13d, %edx
	addl	%eax, %eax
	sall	$8, %ecx
	movl	%eax, 68(%rsp)
	movw	%ax, 3114(%rbp)
	addl	%r10d, %eax
	movl	%ecx, 3160(%rbp)
	movw	%dx, 3214(%rbp)
	testl	%r10d, %r10d
	je	.L2538
	cmpl	$512, %eax
	jg	.L2443
.L2538:
	movl	%eax, %ecx
	addl	%eax, %eax
	addl	%r10d, %edx
	sall	$7, %ecx
	movl	%eax, 72(%rsp)
	movw	%ax, 3116(%rbp)
	addl	%r15d, %eax
	movl	%ecx, 3164(%rbp)
	movw	%dx, 3216(%rbp)
	cmpl	$1024, %eax
	jle	.L2539
	testl	%r15d, %r15d
	jne	.L2443
.L2539:
	movl	24(%rsp), %edi
	movl	%eax, %ecx
	addl	%eax, %eax
	addl	%r15d, %edx
	sall	$6, %ecx
	movl	%eax, 76(%rsp)
	movw	%ax, 3118(%rbp)
	movl	%ecx, 3168(%rbp)
	movw	%dx, 3218(%rbp)
	addl	%edi, %eax
	cmpl	$2048, %eax
	jle	.L2540
	testl	%edi, %edi
	jne	.L2443
.L2540:
	addl	24(%rsp), %edx
	movl	%eax, %ecx
	addl	%eax, %eax
	sall	$5, %ecx
	movl	%eax, 80(%rsp)
	movw	%ax, 3120(%rbp)
	movl	%ecx, 3172(%rbp)
	addl	%r14d, %eax
	movw	%dx, 3220(%rbp)
	testl	%r14d, %r14d
	je	.L2541
	cmpl	$4096, %eax
	jg	.L2443
.L2541:
	movl	8(%rsp), %edi
	movl	%eax, %ecx
	addl	%r14d, %edx
	addl	%eax, %eax
	sall	$4, %ecx
	movl	%eax, 84(%rsp)
	movw	%ax, 3122(%rbp)
	movl	%ecx, 3176(%rbp)
	movw	%dx, 3222(%rbp)
	addl	%edi, %eax
	testl	%edi, %edi
	je	.L2542
	cmpl	$8192, %eax
	jg	.L2443
.L2542:
	addl	8(%rsp), %edx
	movl	16(%rsp), %edi
	leal	0(,%rax,8), %ecx
	addl	%eax, %eax
	movl	%eax, 88(%rsp)
	movw	%ax, 3124(%rbp)
	movl	%ecx, 3180(%rbp)
	addl	%edi, %eax
	movw	%dx, 3224(%rbp)
	testl	%edi, %edi
	je	.L2543
	cmpl	$16384, %eax
	jg	.L2443
.L2543:
	addl	16(%rsp), %edx
	movl	28(%rsp), %edi
	leal	0(,%rax,4), %ecx
	addl	%eax, %eax
	movl	%eax, 92(%rsp)
	movw	%ax, 3126(%rbp)
	movl	%ecx, 3184(%rbp)
	addl	%edi, %eax
	movw	%dx, 3226(%rbp)
	testl	%edi, %edi
	je	.L2544
	cmpl	$32768, %eax
	jg	.L2443
.L2544:
	addl	%eax, %eax
	movl	$65536, 3192(%rbp)
	xorl	%edx, %edx
	leaq	stbi__zdefault_distance(%rip), %r8
	movl	%eax, 3188(%rbp)
	movl	$1, %r10d
	movl	$16, %r9d
	jmp	.L2458
	.p2align 4
	.p2align 3
.L2462:
	incl	%esi
	movl	%esi, 32(%rsp,%rdi,4)
.L2459:
	incq	%rdx
	cmpq	$32, %rdx
	je	.L2463
.L2458:
	movzbl	(%r8,%rdx), %r12d
	testl	%r12d, %r12d
	je	.L2459
	movslq	%r12d, %rdi
	movl	32(%rsp,%rdi,4), %esi
	movzwl	3096(%rbp,%rdi,2), %r11d
	movl	%esi, %eax
	subl	%r11d, %eax
	movzwl	3196(%rbp,%rdi,2), %r11d
	addl	%r11d, %eax
	cltq
	movb	%r12b, 3228(%rbp,%rax)
	movw	%dx, 3516(%rbp,%rax,2)
	cmpl	$9, %r12d
	jg	.L2462
	movl	%esi, %r13d
	leal	(%rsi,%rsi), %eax
	movl	%r12d, %r11d
	shlx	%r12d, %r10d, %ecx
	sarl	%r13d
	andl	$43690, %eax
	sall	$9, %r11d
	movslq	%ecx, %rcx
	andl	$21845, %r13d
	orl	%edx, %r11d
	orl	%eax, %r13d
	movl	%r13d, %eax
	sall	$2, %r13d
	sarl	$2, %eax
	andl	$52428, %r13d
	andl	$13107, %eax
	orl	%r13d, %eax
	movl	%eax, %r13d
	sall	$4, %eax
	sarl	$4, %r13d
	andl	$61680, %eax
	andl	$3855, %r13d
	orl	%eax, %r13d
	movl	%r13d, %eax
	sall	$8, %r13d
	movzwl	%r13w, %r13d
	sarl	$8, %eax
	orl	%r13d, %eax
	movl	%r9d, %r13d
	subl	%r12d, %r13d
	sarx	%r13d, %eax, %eax
	cltq
	.p2align 4
	.p2align 3
.L2461:
	movw	%r11w, 2072(%rbp,%rax,2)
	addq	%rcx, %rax
	cmpl	$511, %eax
	jle	.L2461
	jmp	.L2462
	.p2align 4
	.p2align 3
.L2441:
	leaq	.LC68(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L2365
	.p2align 4
	.p2align 3
.L2733:
	movq	8(%rbp), %rdi
	jmp	.L2481
	.p2align 4
	.p2align 3
.L2478:
	movq	0(%rbp), %rsi
	cmpq	%rdi, %rsi
	jnb	.L2479
	leaq	1(%rsi), %r8
	movq	%r8, 0(%rbp)
	movzbl	(%rsi), %esi
	shlx	%eax, %esi, %esi
	orl	%esi, %edx
.L2479:
	addl	$8, %eax
	movl	%edx, 20(%rbp)
	movl	%eax, 16(%rbp)
	cmpl	$24, %eax
	jg	.L2477
.L2481:
	shrx	%eax, %edx, %esi
	testl	%esi, %esi
	je	.L2478
	movq	%rdi, 0(%rbp)
	jmp	.L2477
	.p2align 4
	.p2align 3
.L2734:
	movq	8(%rbp), %r8
	jmp	.L2488
	.p2align 4
	.p2align 3
.L2485:
	movq	0(%rbp), %rdi
	cmpq	%r8, %rdi
	jnb	.L2486
	leaq	1(%rdi), %r9
	movq	%r9, 0(%rbp)
	movzbl	(%rdi), %edi
	shlx	%eax, %edi, %edi
	orl	%edi, %edx
.L2486:
	addl	$8, %eax
	movl	%edx, 20(%rbp)
	movl	%eax, 16(%rbp)
	cmpl	$24, %eax
	jg	.L2484
.L2488:
	shrx	%eax, %edx, %edi
	testl	%edi, %edi
	je	.L2485
	movq	%r8, 0(%rbp)
	jmp	.L2484
	.p2align 4
	.p2align 3
.L2384:
	cmpl	%edi, %eax
	jl	.L2740
.L2388:
	shrx	%edi, %ecx, %ecx
	subl	%edi, %eax
	movl	%ecx, 20(%rbp)
	movl	%eax, 16(%rbp)
	testl	%eax, %eax
	jg	.L2385
.L2735:
	jne	.L2395
	movq	8(%rbp), %rcx
	movq	0(%rbp), %rax
	cmpq	%rax, %rcx
	jbe	.L2741
	leaq	1(%rax), %rdi
	movq	%rdi, 0(%rbp)
	movzbl	(%rax), %eax
	movb	%al, 164(%rsp)
	movl	$1, %eax
	leal	1(%rax), %edx
	cmpq	%rdi, %rcx
	ja	.L2742
.L2400:
	movb	$0, 164(%rsp,%rax)
	cmpl	$4, %edx
	jne	.L2403
	jmp	.L2404
	.p2align 4
	.p2align 3
.L2741:
	xorl	%r8d, %r8d
	movl	$1, %edx
.L2398:
	movb	$0, 164(%rsp,%r8)
	cmpl	$4, %edx
	je	.L2404
.L2403:
	movl	$3, %r8d
	xorl	%esi, %esi
	subl	%edx, %r8d
	movslq	%edx, %rdx
	incq	%r8
	leaq	164(%rsp,%rdx), %rdi
	movq	%r8, %rdx
	call	memset@PLT
	jmp	.L2404
	.p2align 4
	.p2align 3
.L2443:
	leaq	.LC69(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L2365
	.p2align 4
	.p2align 3
.L2482:
	leaq	.LC111(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L2365
	.p2align 4
	.p2align 3
.L2510:
	movl	%esi, %edx
	jmp	.L2393
	.p2align 4
	.p2align 3
.L2511:
	movl	%r8d, %edx
	jmp	.L2393
	.p2align 4
	.p2align 3
.L2498:
	movl	%r13d, %r13d
	xorl	%eax, %eax
	.p2align 4
	.p2align 3
.L2505:
	movzbl	(%rdx,%rax), %ecx
	movb	%cl, (%r15,%rax)
	incq	%rax
	cmpq	%rax, %r13
	jne	.L2505
	jmp	.L2506
.L2736:
	movslq	%edx, %rax
	leal	1(%rax), %edx
	cmpq	%rdi, %rcx
	jbe	.L2400
.L2742:
	leaq	1(%rdi), %r8
	movslq	%eax, %rsi
	movq	%r8, 0(%rbp)
	movzbl	(%rdi), %r9d
	movb	%r9b, 164(%rsp,%rsi)
	cmpl	$4, %edx
	je	.L2404
	leal	2(%rax), %esi
	cmpq	%rcx, %r8
	jnb	.L2401
	leaq	2(%rdi), %r8
	movslq	%edx, %rdx
	movq	%r8, 0(%rbp)
	movzbl	1(%rdi), %r9d
	movb	%r9b, 164(%rsp,%rdx)
	cmpl	$4, %esi
	je	.L2404
	leal	3(%rax), %edx
	xorl	%eax, %eax
	cmpq	%rcx, %r8
	jnb	.L2402
	leaq	3(%rdi), %rax
	movq	%rax, 0(%rbp)
	movzbl	2(%rdi), %eax
.L2402:
	movslq	%esi, %rsi
	movb	%al, 164(%rsp,%rsi)
	cmpl	$4, %edx
	jne	.L2403
	jmp	.L2404
.L2738:
	leaq	.LC110(%rip), %rbx
	movq	%rbx, %fs:stbi__g_failure_reason@tpoff
	jmp	.L2365
	.p2align 4
	.p2align 3
.L2401:
	movslq	%edx, %rdx
	movb	$0, 164(%rsp,%rdx)
	cmpl	$4, %esi
	je	.L2404
	movl	%esi, %edx
	jmp	.L2403
	.p2align 4
	.p2align 3
.L2737:
	leaq	.LC109(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L2365
	.p2align 4
	.p2align 3
.L2740:
	movq	8(%rbp), %r8
	jmp	.L2392
	.p2align 4
	.p2align 3
.L2389:
	movq	0(%rbp), %rsi
	cmpq	%r8, %rsi
	jnb	.L2390
	leaq	1(%rsi), %r9
	movq	%r9, 0(%rbp)
	movzbl	(%rsi), %esi
	shlx	%eax, %esi, %esi
	orl	%esi, %ecx
.L2390:
	addl	$8, %eax
	movl	%ecx, 20(%rbp)
	movl	%eax, 16(%rbp)
	cmpl	$24, %eax
	jg	.L2388
.L2392:
	shrx	%eax, %ecx, %esi
	testl	%esi, %esi
	je	.L2389
	movq	%r8, 0(%rbp)
	jmp	.L2388
	.p2align 4
	.p2align 3
.L2512:
	movl	%ecx, %edx
	jmp	.L2393
.L2727:
	movl	4(%rsp), %eax
	movq	%r15, 24(%rbp)
	testl	%eax, %eax
	je	.L2743
.L2515:
	movl	$1, %eax
	jmp	.L2365
.L2730:
	leaq	.LC112(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L2365
.L2722:
	movq	(%rdi), %rax
	movq	8(%rdi), %rcx
	cmpq	%rcx, %rax
	jnb	.L2371
	leaq	1(%rax), %rdi
	movq	%rdi, 0(%rbp)
	movzbl	(%rax), %edx
	movl	%edx, %esi
	cmpq	%rdi, %rcx
	jbe	.L2371
	leaq	2(%rax), %r8
	movq	%r8, 0(%rbp)
	movzbl	1(%rax), %eax
	movl	%eax, %edi
	cmpq	%r8, %rcx
	jbe	.L2371
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
	jne	.L2371
	andl	$32, %edi
	jne	.L2744
	andl	$15, %esi
	cmpb	$8, %sil
	je	.L2366
	leaq	.LC107(%rip), %rbx
	movq	%rbx, %fs:stbi__g_failure_reason@tpoff
	jmp	.L2365
.L2415:
	xorl	%eax, %eax
	jmp	.L2365
.L2514:
	movq	%r15, %rcx
	xorl	%eax, %eax
	jmp	.L2499
.L2371:
	leaq	.LC105(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L2365
.L2744:
	leaq	.LC106(%rip), %rbx
	movq	%rbx, %fs:stbi__g_failure_reason@tpoff
	jmp	.L2365
.L2732:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE694:
	.size	stbi__parse_zlib, .-stbi__parse_zlib
	.section	.rodata.str1.1
.LC113:
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
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	leaq	56(%rdi), %rax
	movl	%esi, %r15d
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdx, %r13
	leaq	4(%rdx), %r14
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdx, %rbp
	movq	%rdi, %rbx
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	movl	$128, %r12d
	movq	%rax, 8(%rsp)
	leaq	57(%rdi), %rax
	movq	%rax, 16(%rsp)
.L2757:
	testl	%r12d, %r15d
	je	.L2746
	cmpq	$0, 16(%rbx)
	je	.L2751
	movq	40(%rbx), %rdi
	call	*32(%rbx)
	testl	%eax, %eax
	je	.L2750
	movl	48(%rbx), %edx
	testl	%edx, %edx
	je	.L2748
.L2751:
	movq	192(%rbx), %rax
	cmpq	200(%rbx), %rax
	jnb	.L2748
.L2758:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rbx)
	movzbl	(%rax), %r9d
.L2754:
	movb	%r9b, 0(%rbp)
.L2746:
	incq	%rbp
	sarl	%r12d
	cmpq	%rbp, %r14
	jne	.L2757
.L2764:
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%r13, %rax
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
	.p2align 4
	.p2align 3
.L2750:
	.cfi_restore_state
	movq	192(%rbx), %rax
	cmpq	200(%rbx), %rax
	jb	.L2758
	movl	48(%rbx), %eax
	xorl	%r9d, %r9d
	testl	%eax, %eax
	je	.L2754
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movb	%r9b, 31(%rsp)
	movq	8(%rsp), %rsi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	testl	%eax, %eax
	jne	.L2755
	movq	16(%rsp), %rax
	movzbl	31(%rsp), %r9d
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
.L2756:
	vmovq	16(%rsp), %xmm1
	vpinsrq	$1, %rax, %xmm1, %xmm0
	vmovdqu	%xmm0, 192(%rbx)
	jmp	.L2754
	.p2align 4
	.p2align 3
.L2748:
	leaq	.LC113(%rip), %rax
	xorl	%r13d, %r13d
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L2764
	.p2align 4
	.p2align 3
.L2755:
	cltq
	movzbl	56(%rbx), %r9d
	addq	8(%rsp), %rax
	jmp	.L2756
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
	movq	192(%rdi), %rdx
	movq	%rdi, %rbx
	movq	200(%rdi), %rax
	cmpq	%rax, %rdx
	jb	.L2779
	movl	48(%rdi), %r12d
	testl	%r12d, %r12d
	jne	.L2780
.L2766:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	movl	%r12d, %eax
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4
	.p2align 3
.L2779:
	.cfi_restore_state
	leaq	1(%rdx), %rcx
	movq	%rcx, 192(%rdi)
	movzbl	(%rdx), %r12d
.L2768:
	cmpq	%rax, %rcx
	jnb	.L2772
	leaq	1(%rcx), %rax
	movq	%rax, 192(%rbx)
	movzbl	(%rcx), %eax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	sall	$8, %eax
	addl	%eax, %r12d
	movl	%r12d, %eax
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4
	.p2align 3
.L2772:
	.cfi_restore_state
	movl	48(%rbx), %eax
	testl	%eax, %eax
	je	.L2766
	leaq	56(%rbx), %rbp
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%rbp, %rsi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	leaq	57(%rbx), %rdx
	testl	%eax, %eax
	jne	.L2773
	movl	$0, 48(%rbx)
	movq	%rdx, %rbp
	movb	$0, 56(%rbx)
.L2774:
	vmovq	%rdx, %xmm2
	vpinsrq	$1, %rbp, %xmm2, %xmm0
	movl	%r12d, %eax
	vmovdqu	%xmm0, 192(%rbx)
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4
	.p2align 3
.L2780:
	.cfi_restore_state
	leaq	56(%rdi), %rbp
	movl	52(%rdi), %edx
	movq	40(%rdi), %rdi
	movq	%rbp, %rsi
	call	*16(%rbx)
	leaq	57(%rbx), %rcx
	movslq	%eax, %r12
	movq	192(%rbx), %rax
	subq	208(%rbx), %rax
	addl	%eax, 184(%rbx)
	testl	%r12d, %r12d
	jne	.L2770
	movl	$0, 48(%rbx)
	movq	%rcx, %rax
	movb	$0, 56(%rbx)
.L2771:
	vmovq	%rcx, %xmm1
	vpinsrq	$1, %rax, %xmm1, %xmm0
	vmovdqu	%xmm0, 192(%rbx)
	jmp	.L2768
	.p2align 4
	.p2align 3
.L2773:
	cltq
	addq	%rax, %rbp
	movzbl	56(%rbx), %eax
	sall	$8, %eax
	addl	%eax, %r12d
	jmp	.L2774
	.p2align 4
	.p2align 3
.L2770:
	leaq	0(%rbp,%r12), %rax
	movzbl	56(%rbx), %r12d
	jmp	.L2771
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
	movq	192(%rdi), %rdx
	movq	%rdi, %rbx
	movq	200(%rdi), %rax
	cmpq	%rax, %rdx
	jb	.L2794
	movl	48(%rdi), %r12d
	testl	%r12d, %r12d
	jne	.L2795
.L2781:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	movl	%r12d, %eax
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4
	.p2align 3
.L2794:
	.cfi_restore_state
	leaq	1(%rdx), %rcx
	movq	%rcx, 192(%rdi)
	movzbl	(%rdx), %r12d
	sall	$8, %r12d
.L2783:
	cmpq	%rax, %rcx
	jnb	.L2787
	leaq	1(%rcx), %rax
	movq	%rax, 192(%rbx)
	movzbl	(%rcx), %eax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	addl	%eax, %r12d
	movl	%r12d, %eax
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4
	.p2align 3
.L2787:
	.cfi_restore_state
	movl	48(%rbx), %eax
	testl	%eax, %eax
	je	.L2781
	leaq	56(%rbx), %rbp
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%rbp, %rsi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	leaq	57(%rbx), %rdx
	testl	%eax, %eax
	jne	.L2788
	movl	$0, 48(%rbx)
	movq	%rdx, %rbp
	movb	$0, 56(%rbx)
.L2789:
	vmovq	%rdx, %xmm2
	vpinsrq	$1, %rbp, %xmm2, %xmm0
	movl	%r12d, %eax
	vmovdqu	%xmm0, 192(%rbx)
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4
	.p2align 3
.L2795:
	.cfi_restore_state
	leaq	56(%rdi), %rbp
	movl	52(%rdi), %edx
	movq	40(%rdi), %rdi
	movq	%rbp, %rsi
	call	*16(%rbx)
	leaq	57(%rbx), %rcx
	movslq	%eax, %r12
	movq	192(%rbx), %rax
	subq	208(%rbx), %rax
	addl	%eax, 184(%rbx)
	testl	%r12d, %r12d
	jne	.L2785
	movl	$0, 48(%rbx)
	movq	%rcx, %rax
	movb	$0, 56(%rbx)
.L2786:
	vmovq	%rcx, %xmm1
	vpinsrq	$1, %rax, %xmm1, %xmm0
	vmovdqu	%xmm0, 192(%rbx)
	jmp	.L2783
	.p2align 4
	.p2align 3
.L2788:
	cltq
	addq	%rax, %rbp
	movzbl	56(%rbx), %eax
	addl	%eax, %r12d
	jmp	.L2789
	.p2align 4
	.p2align 3
.L2785:
	leaq	0(%rbp,%r12), %rax
	movzbl	56(%rbx), %r12d
	sall	$8, %r12d
	jmp	.L2786
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
	jb	.L2820
	movl	48(%rdi), %r13d
	testl	%r13d, %r13d
	jne	.L2821
.L2799:
	sall	$16, %r13d
.L2808:
	xorl	%ebp, %ebp
.L2812:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	leal	0(%rbp,%r13), %eax
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4
	.p2align 3
.L2820:
	.cfi_restore_state
	leaq	1(%rax), %rcx
	movq	%rcx, 192(%rdi)
	movzbl	(%rax), %r12d
	sall	$8, %r12d
	movl	%r12d, %r13d
.L2798:
	cmpq	%rdx, %rcx
	jnb	.L2802
	leaq	1(%rcx), %rsi
	movq	%rsi, 192(%rbx)
	movzbl	(%rcx), %eax
	addl	%eax, %r13d
	sall	$16, %r13d
	cmpq	%rdx, %rsi
	jnb	.L2806
.L2822:
	leaq	1(%rsi), %rcx
	movq	%rcx, 192(%rbx)
	movzbl	(%rsi), %ebp
	sall	$8, %ebp
	cmpq	%rdx, %rcx
	jnb	.L2811
.L2823:
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
	.p2align 4
	.p2align 3
.L2802:
	.cfi_restore_state
	movl	48(%rbx), %ecx
	testl	%ecx, %ecx
	je	.L2799
	leaq	56(%rbx), %rbp
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%rbp, %rsi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	leaq	57(%rbx), %rsi
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	testl	%eax, %eax
	jne	.L2804
	movl	$0, 48(%rbx)
	movq	%rsi, %rdx
	movb	$0, 56(%rbx)
.L2805:
	vmovq	%rsi, %xmm2
	vpinsrq	$1, %rdx, %xmm2, %xmm0
	sall	$16, %r13d
	vmovdqu	%xmm0, 192(%rbx)
	cmpq	%rdx, %rsi
	jb	.L2822
.L2806:
	movl	48(%rbx), %edx
	testl	%edx, %edx
	je	.L2808
	leaq	56(%rbx), %r12
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%r12, %rsi
	call	*16(%rbx)
	leaq	57(%rbx), %rcx
	movslq	%eax, %rbp
	movq	192(%rbx), %rax
	subq	208(%rbx), %rax
	addl	%eax, 184(%rbx)
	testl	%ebp, %ebp
	jne	.L2809
	movl	$0, 48(%rbx)
	movq	%rcx, %rdx
	movb	$0, 56(%rbx)
.L2810:
	vmovq	%rcx, %xmm3
	vpinsrq	$1, %rdx, %xmm3, %xmm0
	vmovdqu	%xmm0, 192(%rbx)
	cmpq	%rdx, %rcx
	jb	.L2823
.L2811:
	movl	48(%rbx), %eax
	testl	%eax, %eax
	je	.L2812
	leaq	56(%rbx), %r12
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%r12, %rsi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	leaq	57(%rbx), %rdx
	testl	%eax, %eax
	jne	.L2813
	movl	$0, 48(%rbx)
	movq	%rdx, %r12
	movb	$0, 56(%rbx)
.L2814:
	vmovq	%rdx, %xmm4
	vpinsrq	$1, %r12, %xmm4, %xmm0
	leal	0(%rbp,%r13), %eax
	vmovdqu	%xmm0, 192(%rbx)
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
	.p2align 4
	.p2align 3
.L2821:
	.cfi_restore_state
	leaq	56(%rdi), %rbp
	movl	52(%rdi), %edx
	movq	40(%rdi), %rdi
	movq	%rbp, %rsi
	call	*16(%rbx)
	leaq	57(%rbx), %rcx
	movl	%eax, %r13d
	movq	192(%rbx), %rax
	subq	208(%rbx), %rax
	addl	%eax, 184(%rbx)
	testl	%r13d, %r13d
	jne	.L2800
	movl	$0, 48(%rbx)
	movq	%rcx, %rdx
	movb	$0, 56(%rbx)
.L2801:
	vmovq	%rcx, %xmm1
	vpinsrq	$1, %rdx, %xmm1, %xmm0
	vmovdqu	%xmm0, 192(%rbx)
	jmp	.L2798
	.p2align 4
	.p2align 3
.L2804:
	cltq
	leaq	0(%rbp,%rax), %rdx
	movzbl	56(%rbx), %eax
	addl	%eax, %r13d
	jmp	.L2805
	.p2align 4
	.p2align 3
.L2809:
	leaq	(%r12,%rbp), %rdx
	movzbl	56(%rbx), %ebp
	sall	$8, %ebp
	jmp	.L2810
	.p2align 4
	.p2align 3
.L2800:
	movslq	%r13d, %r12
	leaq	0(%rbp,%r12), %rdx
	movzbl	56(%rbx), %r12d
	sall	$8, %r12d
	movl	%r12d, %r13d
	jmp	.L2801
	.p2align 4
	.p2align 3
.L2813:
	cltq
	addq	%rax, %r12
	movzbl	56(%rbx), %eax
	addl	%eax, %ebp
	jmp	.L2814
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
	jb	.L2848
	movl	48(%rdi), %r13d
	testl	%r13d, %r13d
	jne	.L2849
.L2836:
	xorl	%ebp, %ebp
.L2840:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	sall	$16, %ebp
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
	.p2align 4
	.p2align 3
.L2848:
	.cfi_restore_state
	leaq	1(%rdx), %rsi
	movq	%rsi, 192(%rdi)
	movzbl	(%rdx), %r13d
	cmpq	%rax, %rsi
	jnb	.L2830
.L2850:
	leaq	1(%rsi), %rcx
	movq	%rcx, 192(%rbx)
	movzbl	(%rsi), %edx
	sall	$8, %edx
	addl	%edx, %r13d
	cmpq	%rax, %rcx
	jnb	.L2834
.L2851:
	leaq	1(%rcx), %rdx
	movq	%rdx, 192(%rbx)
	movzbl	(%rcx), %ebp
	cmpq	%rax, %rdx
	jnb	.L2839
.L2852:
	leaq	1(%rdx), %rax
	movq	%rax, 192(%rbx)
	movzbl	(%rdx), %eax
	sall	$8, %eax
	addl	%eax, %ebp
	jmp	.L2840
	.p2align 4
	.p2align 3
.L2849:
	leaq	56(%rdi), %rbp
	movl	52(%rdi), %edx
	movq	40(%rdi), %rdi
	movq	%rbp, %rsi
	call	*16(%rbx)
	leaq	57(%rbx), %rsi
	movslq	%eax, %r13
	movq	192(%rbx), %rax
	subq	208(%rbx), %rax
	addl	%eax, 184(%rbx)
	testl	%r13d, %r13d
	jne	.L2828
	movl	$0, 48(%rbx)
	movq	%rsi, %rax
	movb	$0, 56(%rbx)
.L2829:
	vmovq	%rsi, %xmm1
	vpinsrq	$1, %rax, %xmm1, %xmm0
	vmovdqu	%xmm0, 192(%rbx)
	cmpq	%rax, %rsi
	jb	.L2850
.L2830:
	movl	48(%rbx), %ecx
	testl	%ecx, %ecx
	je	.L2836
	leaq	56(%rbx), %rbp
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%rbp, %rsi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	leaq	57(%rbx), %rcx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	testl	%eax, %eax
	jne	.L2832
	movl	$0, 48(%rbx)
	movq	%rcx, %rax
	movb	$0, 56(%rbx)
.L2833:
	vmovq	%rcx, %xmm2
	vpinsrq	$1, %rax, %xmm2, %xmm0
	vmovdqu	%xmm0, 192(%rbx)
	cmpq	%rax, %rcx
	jb	.L2851
.L2834:
	movl	48(%rbx), %edx
	testl	%edx, %edx
	je	.L2836
	leaq	56(%rbx), %r12
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%r12, %rsi
	call	*16(%rbx)
	leaq	57(%rbx), %rdx
	movslq	%eax, %rbp
	movq	192(%rbx), %rax
	subq	208(%rbx), %rax
	addl	%eax, 184(%rbx)
	testl	%ebp, %ebp
	jne	.L2837
	movl	$0, 48(%rbx)
	movq	%rdx, %rax
	movb	$0, 56(%rbx)
.L2838:
	vmovq	%rdx, %xmm3
	vpinsrq	$1, %rax, %xmm3, %xmm0
	vmovdqu	%xmm0, 192(%rbx)
	cmpq	%rax, %rdx
	jb	.L2852
.L2839:
	movl	48(%rbx), %eax
	testl	%eax, %eax
	je	.L2840
	leaq	56(%rbx), %r12
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%r12, %rsi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	leaq	57(%rbx), %rdx
	testl	%eax, %eax
	jne	.L2841
	movl	$0, 48(%rbx)
	movq	%rdx, %r12
	movb	$0, 56(%rbx)
.L2842:
	vmovq	%rdx, %xmm4
	vpinsrq	$1, %r12, %xmm4, %xmm0
	vmovdqu	%xmm0, 192(%rbx)
	jmp	.L2840
	.p2align 4
	.p2align 3
.L2828:
	leaq	0(%rbp,%r13), %rax
	movzbl	56(%rbx), %r13d
	jmp	.L2829
	.p2align 4
	.p2align 3
.L2832:
	movzbl	56(%rbx), %edx
	cltq
	addq	%rbp, %rax
	sall	$8, %edx
	addl	%edx, %r13d
	jmp	.L2833
	.p2align 4
	.p2align 3
.L2841:
	cltq
	addq	%rax, %r12
	movzbl	56(%rbx), %eax
	sall	$8, %eax
	addl	%eax, %ebp
	jmp	.L2842
	.p2align 4
	.p2align 3
.L2837:
	leaq	(%r12,%rbp), %rax
	movzbl	56(%rbx), %ebp
	jmp	.L2838
	.cfi_endproc
.LFE633:
	.size	stbi__get32le, .-stbi__get32le
	.section	.rodata.str1.1
.LC114:
	.string	"expected marker"
.LC115:
	.string	"bad DRI len"
.LC116:
	.string	"bad DQT type"
.LC117:
	.string	"bad DQT table"
.LC118:
	.string	"bad DHT header"
.LC119:
	.string	"bad COM len"
.LC120:
	.string	"bad APP len"
.LC121:
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
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdi, %r13
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
	je	.L2854
	movl	%esi, %ebx
	jg	.L2855
	cmpl	$196, %esi
	je	.L2856
	cmpl	$219, %esi
	jne	.L2858
	movq	(%rdi), %rdi
	call	stbi__get16be
	subl	$2, %eax
	movl	%eax, 8(%rsp)
	testl	%eax, %eax
	jle	.L2862
	leaq	64+stbi__jpeg_dezigzag(%rip), %r8
	.p2align 4
	.p2align 3
.L2888:
	movq	0(%r13), %rbx
	movq	192(%rbx), %rdx
	movq	200(%rbx), %rsi
	cmpq	%rsi, %rdx
	jb	.L2992
	movl	48(%rbx), %r14d
	xorl	%r15d, %r15d
	testl	%r14d, %r14d
	jne	.L2993
.L2865:
	leaq	stbi__jpeg_dezigzag(%rip), %r12
	movslq	%r15d, %r15
	jmp	.L2885
	.p2align 4
	.p2align 3
.L2996:
	cmpq	%rdx, %rsi
	ja	.L2994
	movl	48(%rbx), %ebp
	testl	%ebp, %ebp
	jne	.L2995
.L2879:
	movzbl	(%r12), %edx
	movq	%r15, %rax
	incq	%r12
	salq	$6, %rax
	leaq	6720(%rdx,%rax), %rax
	movw	%bp, 8(%r13,%rax,2)
	cmpq	%r12, %r8
	je	.L2884
	movq	0(%r13), %rbx
	movq	192(%rbx), %rdx
	movq	200(%rbx), %rsi
.L2885:
	testl	%r14d, %r14d
	jne	.L2996
	cmpq	%rdx, %rsi
	ja	.L2997
	movl	48(%rbx), %r9d
	xorl	%ebp, %ebp
	testl	%r9d, %r9d
	je	.L2879
	leaq	56(%rbx), %rsi
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%rsi, (%rsp)
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	leaq	64+stbi__jpeg_dezigzag(%rip), %r8
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	testl	%eax, %eax
	movq	(%rsp), %rsi
	leaq	57(%rbx), %rdx
	jne	.L2882
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	movq	%rdx, %rsi
.L2883:
	vmovq	%rdx, %xmm3
	vpinsrq	$1, %rsi, %xmm3, %xmm0
	vmovdqu	%xmm0, 192(%rbx)
	jmp	.L2879
.L2855:
	cmpl	$255, %esi
	jne	.L2859
	leaq	.LC114(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
.L2853:
	movq	120(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L2998
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
.L2859:
	.cfi_restore_state
	leal	-224(%rsi), %eax
	cmpl	$15, %eax
	jbe	.L2936
	cmpl	$254, %esi
	je	.L2936
.L2858:
	leaq	.LC121(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L2853
.L2856:
	movq	(%rdi), %rdi
	call	stbi__get16be
	subl	$2, %eax
	movl	%eax, 16(%rsp)
	testl	%eax, %eax
	jle	.L2889
	.p2align 4
	.p2align 3
.L2906:
	movq	0(%r13), %r12
	movq	192(%r12), %rax
	movq	200(%r12), %rdx
	cmpq	%rdx, %rax
	jb	.L2999
	movl	48(%r12), %ecx
	movl	$0, 24(%rsp)
	movq	$0, 8(%rsp)
	movl	%ecx, (%rsp)
	testl	%ecx, %ecx
	jne	.L3000
.L2892:
	leaq	48(%rsp), %r14
	leaq	112(%rsp), %rbx
	xorl	%ebp, %ebp
	movq	%r14, 40(%rsp)
	jmp	.L2896
	.p2align 4
	.p2align 3
.L2898:
	movl	48(%r12), %eax
	testl	%eax, %eax
	jne	.L3001
.L2899:
	movl	%eax, (%r14)
	addq	$4, %r14
	cmpq	%r14, %rbx
	je	.L3002
.L2902:
	movq	0(%r13), %r12
	movq	192(%r12), %rax
	movq	200(%r12), %rdx
.L2896:
	cmpq	%rdx, %rax
	jnb	.L2898
	leaq	1(%rax), %rdx
	addq	$4, %r14
	movq	%rdx, 192(%r12)
	movzbl	(%rax), %eax
	movl	%eax, -4(%r14)
	addl	%eax, %ebp
	cmpq	%r14, %rbx
	jne	.L2902
.L3002:
	movl	16(%rsp), %eax
	movl	(%rsp), %edi
	subl	$17, %eax
	movl	%eax, 36(%rsp)
	movq	8(%rsp), %rax
	testl	%edi, %edi
	jne	.L2903
	movq	40(%rsp), %rsi
	leaq	8(%r13,%rax), %rdi
	call	stbi__build_huffman
	testl	%eax, %eax
	je	.L2990
	movslq	24(%rsp), %rax
	movq	%rax, 24(%rsp)
	imulq	$1680, %rax, %rax
	leaq	1032(%r13,%rax), %rbx
	testl	%ebp, %ebp
	je	.L2913
.L2905:
	xorl	%r12d, %r12d
	jmp	.L2912
	.p2align 4
	.p2align 3
.L2908:
	movl	48(%r15), %esi
	xorl	%r14d, %r14d
	testl	%esi, %esi
	jne	.L3003
.L2909:
	movb	%r14b, (%rbx,%r12)
	incq	%r12
	cmpl	%r12d, %ebp
	jle	.L3004
.L2912:
	movq	0(%r13), %r15
	movq	192(%r15), %rax
	cmpq	200(%r15), %rax
	jnb	.L2908
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%r15)
	movzbl	(%rax), %r14d
	movb	%r14b, (%rbx,%r12)
	incq	%r12
	cmpl	%r12d, %ebp
	jg	.L2912
.L3004:
	movl	(%rsp), %ecx
	testl	%ecx, %ecx
	je	.L2913
	movq	8(%rsp), %rax
	leaq	6728(%r13,%rax), %rdi
.L2907:
	movq	24(%rsp), %rbx
	xorl	%edx, %edx
	movl	$-1, %ecx
	salq	$10, %rbx
	leaq	13960(%r13,%rbx), %r11
	movl	$1, %ebx
	.p2align 4
	.p2align 3
.L2916:
	movzbl	(%rdi,%rdx), %eax
	movw	$0, (%r11,%rdx,2)
	cmpb	$-1, %al
	je	.L2914
	movzbl	1024(%rdi,%rax), %r9d
	movl	%r9d, %r14d
	andl	$15, %r14d
	je	.L2914
	movzbl	1280(%rdi,%rax), %r15d
	movzbl	%r14b, %r10d
	movl	%r15d, %eax
	addl	%r10d, %r15d
	cmpl	$9, %r15d
	jg	.L2914
	shlx	%eax, %edx, %esi
	movl	$9, %r15d
	subl	%r10d, %r15d
	andl	$511, %esi
	decl	%r10d
	sarx	%r15d, %esi, %esi
	shlx	%r10d, %ebx, %r10d
	movl	%esi, %r15d
	cmpl	%r10d, %esi
	jge	.L2915
	shlx	%r14d, %ecx, %r10d
	leal	1(%rsi,%r10), %r15d
	movl	%r15d, %esi
.L2915:
	subl	$-128, %r15d
	cmpl	$255, %r15d
	ja	.L2914
	sall	$4, %esi
	sarl	$4, %r9d
	movzbl	%r14b, %r14d
	addl	%r9d, %esi
	addl	%r14d, %eax
	sall	$4, %esi
	addl	%esi, %eax
	movw	%ax, (%r11,%rdx,2)
	.p2align 4
	.p2align 3
.L2914:
	incq	%rdx
	cmpq	$512, %rdx
	jne	.L2916
.L2913:
	movl	36(%rsp), %eax
	subl	%ebp, %eax
	movl	%eax, 16(%rsp)
	testl	%eax, %eax
	jg	.L2906
.L2889:
	movl	16(%rsp), %edx
	xorl	%eax, %eax
	testl	%edx, %edx
	sete	%al
	jmp	.L2853
	.p2align 4
	.p2align 3
.L3001:
	leaq	56(%r12), %r15
	movl	52(%r12), %edx
	movq	40(%r12), %rdi
	movq	%r15, %rsi
	call	*16(%r12)
	movq	192(%r12), %rdx
	subq	208(%r12), %rdx
	addl	%edx, 184(%r12)
	leaq	57(%r12), %rdx
	testl	%eax, %eax
	jne	.L2900
	movl	$0, 48(%r12)
	movq	%rdx, %rsi
	movb	$0, 56(%r12)
.L2901:
	vmovq	%rdx, %xmm4
	vpinsrq	$1, %rsi, %xmm4, %xmm0
	vmovdqu	%xmm0, 192(%r12)
	jmp	.L2899
	.p2align 4
	.p2align 3
.L2900:
	cltq
	leaq	(%r15,%rax), %rsi
	movzbl	56(%r12), %eax
	addl	%eax, %ebp
	jmp	.L2901
	.p2align 4
	.p2align 3
.L3003:
	leaq	56(%r15), %rsi
	movl	52(%r15), %edx
	movq	40(%r15), %rdi
	movq	%rsi, 16(%rsp)
	call	*16(%r15)
	movq	192(%r15), %rdx
	subq	208(%r15), %rdx
	addl	%edx, 184(%r15)
	testl	%eax, %eax
	movq	16(%rsp), %rsi
	leaq	57(%r15), %rdx
	jne	.L2910
	movl	$0, 48(%r15)
	movb	$0, 56(%r15)
	movq	%rdx, %rsi
.L2911:
	vmovq	%rdx, %xmm5
	vpinsrq	$1, %rsi, %xmm5, %xmm0
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L2909
	.p2align 4
	.p2align 3
.L2910:
	cltq
	movzbl	56(%r15), %r14d
	addq	%rax, %rsi
	jmp	.L2911
	.p2align 4
	.p2align 3
.L2903:
	movq	40(%rsp), %rsi
	leaq	6728(%r13,%rax), %rdi
	movq	%rdi, 16(%rsp)
	call	stbi__build_huffman
	testl	%eax, %eax
	je	.L2990
	movslq	24(%rsp), %rax
	movq	16(%rsp), %rdi
	movq	%rax, 24(%rsp)
	imulq	$1680, %rax, %rax
	testl	%ebp, %ebp
	leaq	7752(%r13,%rax), %rbx
	jne	.L2905
	jmp	.L2907
.L2999:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%r12)
	movzbl	(%rax), %eax
	movl	%eax, %ecx
	movl	%eax, %r14d
	sarl	$4, %ecx
	andl	$15, %r14d
	movl	%ecx, (%rsp)
	movl	%eax, %ecx
	andl	$15, %ecx
	cmpl	$31, %eax
	seta	%al
	cmpl	$3, %ecx
	movl	%ecx, 24(%rsp)
	setg	%dl
	orl	%edx, %eax
.L2891:
	testb	%al, %al
	jne	.L2895
.L2894:
	movq	0(%r13), %r12
	movzbl	%r14b, %r14d
	imulq	$1680, %r14, %rax
	movq	200(%r12), %rdx
	movq	%rax, 8(%rsp)
	movq	192(%r12), %rax
	jmp	.L2892
.L3000:
	leaq	56(%r12), %r14
	movl	52(%r12), %edx
	movq	40(%r12), %rdi
	movq	%r14, %rsi
	call	*16(%r12)
	leaq	57(%r12), %rdx
	movl	%eax, %ecx
	movl	%eax, (%rsp)
	movq	192(%r12), %rax
	subq	208(%r12), %rax
	addl	%eax, 184(%r12)
	testl	%ecx, %ecx
	jne	.L2893
	vmovq	%rdx, %xmm6
	vpunpcklqdq	%xmm6, %xmm6, %xmm0
	movl	$0, 48(%r12)
	xorl	%r14d, %r14d
	movb	$0, 56(%r12)
	vmovdqu	%xmm0, 192(%r12)
	jmp	.L2894
.L2854:
	movq	(%rdi), %rdi
	call	stbi__get16be
	cmpl	$4, %eax
	je	.L2861
	leaq	.LC115(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L2853
.L2893:
	movslq	(%rsp), %rax
	vmovq	%rdx, %xmm7
	leaq	(%r14,%rax), %rsi
	movzbl	56(%r12), %eax
	vpinsrq	$1, %rsi, %xmm7, %xmm0
	vmovdqu	%xmm0, 192(%r12)
	movl	%eax, %ecx
	movl	%eax, %r14d
	sarl	$4, %ecx
	andl	$15, %r14d
	movl	%ecx, (%rsp)
	movl	%eax, %ecx
	andl	$15, %ecx
	cmpl	$31, %eax
	seta	%al
	cmpl	$3, %ecx
	movl	%ecx, 24(%rsp)
	setg	%dil
	orl	%edi, %eax
	jmp	.L2891
.L2861:
	movq	0(%r13), %rdi
	call	stbi__get16be
	movl	%eax, 18536(%r13)
	movl	$1, %eax
	jmp	.L2853
.L2936:
	movq	0(%r13), %rdi
	call	stbi__get16be
	movl	%eax, %ebp
	cmpl	$1, %eax
	jg	.L2918
	cmpl	$254, %ebx
	je	.L3005
	leaq	.LC120(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L2853
	.p2align 4
	.p2align 3
.L2884:
	testl	%r14d, %r14d
	je	.L2886
	subl	$129, 8(%rsp)
	movl	8(%rsp), %eax
	testl	%eax, %eax
	jg	.L2888
.L2862:
	movl	8(%rsp), %r8d
	xorl	%eax, %eax
	testl	%r8d, %r8d
	sete	%al
	jmp	.L2853
	.p2align 4
	.p2align 3
.L2994:
	leaq	1(%rdx), %rdi
	movq	%rdi, 192(%rbx)
	movzbl	(%rdx), %ebp
	sall	$8, %ebp
	cmpq	%rsi, %rdi
	jnb	.L2876
.L3006:
	leaq	1(%rdi), %rax
	movq	%rax, 192(%rbx)
	movzbl	(%rdi), %eax
	addl	%eax, %ebp
	jmp	.L2879
	.p2align 4
	.p2align 3
.L2997:
	leaq	1(%rdx), %rax
	movq	%rax, 192(%rbx)
	movzbl	(%rdx), %ebp
	jmp	.L2879
	.p2align 4
	.p2align 3
.L2995:
	leaq	56(%rbx), %rbp
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%rbp, %rsi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	leaq	57(%rbx), %rdi
	subq	208(%rbx), %rdx
	leaq	64+stbi__jpeg_dezigzag(%rip), %r8
	addl	%edx, 184(%rbx)
	testl	%eax, %eax
	jne	.L2874
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	movq	%rdi, %rsi
.L2875:
	vmovq	%rdi, %xmm1
	vpinsrq	$1, %rsi, %xmm1, %xmm0
	movzbl	56(%rbx), %ebp
	vmovdqu	%xmm0, 192(%rbx)
	sall	$8, %ebp
	cmpq	%rsi, %rdi
	jb	.L3006
.L2876:
	movl	48(%rbx), %r10d
	testl	%r10d, %r10d
	je	.L2879
	leaq	56(%rbx), %rsi
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%rsi, (%rsp)
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	leaq	64+stbi__jpeg_dezigzag(%rip), %r8
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	testl	%eax, %eax
	movq	(%rsp), %rsi
	leaq	57(%rbx), %rdx
	jne	.L2877
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	movq	%rdx, %rsi
.L2878:
	vmovq	%rdx, %xmm2
	vpinsrq	$1, %rsi, %xmm2, %xmm0
	movzbl	56(%rbx), %eax
	vmovdqu	%xmm0, 192(%rbx)
	addl	%eax, %ebp
	jmp	.L2879
	.p2align 4
	.p2align 3
.L2882:
	cltq
	movzbl	56(%rbx), %ebp
	addq	%rax, %rsi
	jmp	.L2883
	.p2align 4
	.p2align 3
.L2874:
	cltq
	leaq	0(%rbp,%rax), %rsi
	jmp	.L2875
	.p2align 4
	.p2align 3
.L2877:
	cltq
	addq	%rax, %rsi
	jmp	.L2878
.L2886:
	subl	$65, 8(%rsp)
	movl	8(%rsp), %eax
	testl	%eax, %eax
	jg	.L2888
	jmp	.L2862
	.p2align 4
	.p2align 3
.L2992:
	leaq	1(%rdx), %rax
	movq	%rax, 192(%rbx)
	movzbl	(%rdx), %r14d
	movl	%r14d, %eax
	sarl	$4, %r14d
	movl	%eax, %r15d
	andl	$15, %r15d
.L2864:
	cmpl	$1, %r14d
	jg	.L3007
	testb	$12, %al
	jne	.L2869
.L2867:
	movq	0(%r13), %rbx
	movq	192(%rbx), %rdx
	movq	200(%rbx), %rsi
	jmp	.L2865
.L2993:
	leaq	56(%rbx), %rbp
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%rbp, %rsi
	call	*16(%rbx)
	leaq	57(%rbx), %rdx
	leaq	64+stbi__jpeg_dezigzag(%rip), %r8
	movslq	%eax, %r15
	movq	192(%rbx), %rax
	subq	208(%rbx), %rax
	addl	%eax, 184(%rbx)
	testl	%r15d, %r15d
	jne	.L2866
	vmovq	%rdx, %xmm6
	vpunpcklqdq	%xmm6, %xmm6, %xmm0
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	vmovdqu	%xmm0, 192(%rbx)
	xorl	%r14d, %r14d
	jmp	.L2867
.L2895:
	leaq	.LC118(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
.L2990:
	xorl	%eax, %eax
	jmp	.L2853
.L2866:
	movzbl	56(%rbx), %r14d
	addq	%r15, %rbp
	vmovq	%rdx, %xmm7
	vpinsrq	$1, %rbp, %xmm7, %xmm0
	vmovdqu	%xmm0, 192(%rbx)
	movl	%r14d, %eax
	sarl	$4, %r14d
	movl	%eax, %r15d
	andl	$15, %r15d
	jmp	.L2864
.L2869:
	leaq	.LC117(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L2853
.L3007:
	leaq	.LC116(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L2853
.L2918:
	leal	-2(%rax), %esi
	cmpl	$224, %ebx
	jne	.L2920
	cmpl	$4, %esi
	jle	.L2920
	leaq	tag.38(%rip), %rbx
	movl	$1, %r12d
	xorl	%r15d, %r15d
	leaq	5(%rbx), %r14
.L2922:
	movq	0(%r13), %rdi
	call	stbi__get8
	cmpb	(%rbx), %al
	cmovne	%r15d, %r12d
	incq	%rbx
	cmpq	%r14, %rbx
	jne	.L2922
	leal	-7(%rbp), %esi
	testl	%r12d, %r12d
	je	.L2923
	movl	$1, 18504(%r13)
.L2923:
	movq	0(%r13), %rdi
	testl	%esi, %esi
	je	.L2991
	js	.L3008
.L2929:
	call	stbi__skip.part.0
.L2991:
	movl	$1, %eax
	jmp	.L2853
.L2920:
	cmpl	$238, %ebx
	jne	.L2924
	cmpl	$11, %esi
	jle	.L2924
	leaq	tag.37(%rip), %rbx
	movl	$1, %r12d
	xorl	%r15d, %r15d
	leaq	6(%rbx), %r14
.L2926:
	movq	0(%r13), %rdi
	call	stbi__get8
	cmpb	(%rbx), %al
	cmovne	%r15d, %r12d
	incq	%rbx
	cmpq	%r14, %rbx
	jne	.L2926
	leal	-8(%rbp), %esi
	testl	%r12d, %r12d
	je	.L2923
	movq	0(%r13), %rdi
	call	stbi__get8
	movq	0(%r13), %rdi
	call	stbi__get16be
	movq	0(%r13), %rdi
	call	stbi__get16be
	movq	0(%r13), %rdi
	call	stbi__get8
	leal	-14(%rbp), %esi
	movzbl	%al, %eax
	movl	%eax, 18508(%r13)
	jmp	.L2923
.L2924:
	movq	0(%r13), %rdi
	testl	%esi, %esi
	jne	.L2929
	jmp	.L2991
.L3005:
	leaq	.LC119(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L2853
.L2998:
	call	__stack_chk_fail@PLT
	.p2align 4
	.p2align 3
.L3008:
	movq	200(%rdi), %rax
	movq	%rax, 192(%rdi)
	movl	$1, %eax
	jmp	.L2853
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
	.p2align 4
	.p2align 3
.L3027:
	movl	18476(%rbx), %esi
	testl	%esi, %esi
	je	.L3039
	movl	18468(%rbx), %eax
	addl	$8, %eax
	movl	%eax, 18468(%rbx)
	cmpl	$24, %eax
	jg	.L3036
.L3026:
	addl	$8, %eax
	cmpl	$24, %eax
	jle	.L3026
	movl	%eax, 18468(%rbx)
.L3036:
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
	.p2align 4
	.p2align 3
.L3039:
	.cfi_restore_state
	movq	(%rbx), %rbp
	movq	192(%rbp), %rax
	cmpq	200(%rbp), %rax
	jb	.L3040
	movl	48(%rbp), %ecx
	xorl	%r12d, %r12d
	testl	%ecx, %ecx
	jne	.L3041
.L3013:
	movl	18468(%rbx), %eax
	movl	$24, %edx
	subl	%eax, %edx
	addl	$8, %eax
	shlx	%edx, %r12d, %r12d
	movl	%eax, 18468(%rbx)
	orl	%r12d, 18464(%rbx)
	cmpl	$24, %eax
	jle	.L3027
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
	.p2align 4
	.p2align 3
.L3040:
	.cfi_restore_state
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rbp)
	movzbl	(%rax), %r12d
.L3012:
	cmpl	$255, %r12d
	jne	.L3013
	movq	(%rbx), %rbp
	movq	192(%rbp), %rax
	cmpq	200(%rbp), %rax
	jb	.L3038
	movl	48(%rbp), %edx
	testl	%edx, %edx
	je	.L3013
	leaq	56(%rbp), %r13
	movl	52(%rbp), %edx
	movq	40(%rbp), %rdi
	movq	%r13, %rsi
	call	*16(%rbp)
	movq	192(%rbp), %rdx
	leaq	57(%rbp), %rsi
	subq	208(%rbp), %rdx
	addl	%edx, 184(%rbp)
	testl	%eax, %eax
	jne	.L3018
	vmovq	%rsi, %xmm5
	vpunpcklqdq	%xmm5, %xmm5, %xmm0
	movl	$0, 48(%rbp)
	movb	$0, 56(%rbp)
	vmovdqu	%xmm0, 192(%rbp)
	jmp	.L3013
	.p2align 4
	.p2align 3
.L3038:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rbp)
	movzbl	(%rax), %edx
	movl	%edx, %ecx
.L3016:
	cmpl	$255, %edx
	jne	.L3019
	movq	(%rbx), %rbp
	movq	192(%rbp), %rax
	cmpq	200(%rbp), %rax
	jb	.L3038
	movl	48(%rbp), %eax
	testl	%eax, %eax
	je	.L3013
	leaq	56(%rbp), %r13
	movl	52(%rbp), %edx
	movq	40(%rbp), %rdi
	movq	%r13, %rsi
	call	*16(%rbp)
	movq	192(%rbp), %rdx
	leaq	57(%rbp), %rsi
	subq	208(%rbp), %rdx
	addl	%edx, 184(%rbp)
	testl	%eax, %eax
	jne	.L3023
	vmovq	%rsi, %xmm3
	vpunpcklqdq	%xmm3, %xmm3, %xmm0
	movl	$0, 48(%rbp)
	movb	$0, 56(%rbp)
	vmovdqu	%xmm0, 192(%rbp)
	jmp	.L3013
	.p2align 4
	.p2align 3
.L3041:
	leaq	56(%rbp), %r13
	movl	52(%rbp), %edx
	movq	40(%rbp), %rdi
	movq	%r13, %rsi
	call	*16(%rbp)
	movq	192(%rbp), %rdx
	subq	208(%rbp), %rdx
	addl	%edx, 184(%rbp)
	leaq	57(%rbp), %rdx
	testl	%eax, %eax
	jne	.L3014
	vmovq	%rdx, %xmm1
	vpunpcklqdq	%xmm1, %xmm1, %xmm0
	movl	$0, 48(%rbp)
	movb	$0, 56(%rbp)
	vmovdqu	%xmm0, 192(%rbp)
	jmp	.L3013
	.p2align 4
	.p2align 3
.L3014:
	cltq
	vmovq	%rdx, %xmm2
	movzbl	56(%rbp), %r12d
	addq	%rax, %r13
	vpinsrq	$1, %r13, %xmm2, %xmm0
	vmovdqu	%xmm0, 192(%rbp)
	jmp	.L3012
	.p2align 4
	.p2align 3
.L3023:
	movzbl	56(%rbp), %edx
	cltq
	vmovq	%rsi, %xmm4
	addq	%rax, %r13
	vpinsrq	$1, %r13, %xmm4, %xmm0
	vmovdqu	%xmm0, 192(%rbp)
	movl	%edx, %ecx
	jmp	.L3016
.L3018:
	movzbl	56(%rbp), %edx
	cltq
	vmovq	%rsi, %xmm6
	addq	%rax, %r13
	vpinsrq	$1, %r13, %xmm6, %xmm0
	vmovdqu	%xmm0, 192(%rbp)
	movl	%edx, %ecx
	jmp	.L3016
.L3019:
	testl	%edx, %edx
	je	.L3013
	movb	%cl, 18472(%rbx)
	movl	$1, 18476(%rbx)
	jmp	.L3036
	.cfi_endproc
.LFE642:
	.size	stbi__grow_buffer_unsafe, .-stbi__grow_buffer_unsafe
	.section	.rodata.str1.8
	.align 8
.LC122:
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
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rdi, %rbp
	movq	%rsi, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movl	18468(%rdi), %eax
	cmpl	$15, %eax
	jle	.L3058
.L3043:
	movl	18464(%rbp), %edx
	movl	%edx, %ecx
	shrl	$23, %ecx
	movzbl	(%rbx,%rcx), %ecx
	cmpl	$255, %ecx
	je	.L3044
	movzbl	1280(%rbx,%rcx), %esi
	cmpl	%eax, %esi
	jg	.L3056
	subl	%esi, %eax
	shlx	%esi, %edx, %edx
	movl	%edx, 18464(%rbp)
	movl	%eax, 18468(%rbp)
	movzbl	1024(%rbx,%rcx), %eax
.L3042:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4
	.p2align 3
.L3044:
	.cfi_restore_state
	movl	%edx, %ecx
	shrl	$16, %ecx
	cmpl	1580(%rbx), %ecx
	jb	.L3049
	cmpl	1584(%rbx), %ecx
	jb	.L3050
	cmpl	1588(%rbx), %ecx
	jb	.L3051
	cmpl	1592(%rbx), %ecx
	jb	.L3052
	cmpl	1596(%rbx), %ecx
	jb	.L3053
	cmpl	1600(%rbx), %ecx
	jb	.L3054
	cmpl	1604(%rbx), %ecx
	jb	.L3055
	subl	$16, %eax
	movl	%eax, 18468(%rbp)
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	movl	$-1, %eax
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4
	.p2align 3
.L3058:
	.cfi_restore_state
	call	stbi__grow_buffer_unsafe
	movl	18468(%rbp), %eax
	jmp	.L3043
	.p2align 4
	.p2align 3
.L3052:
	movl	$13, %edi
	.p2align 4
	.p2align 3
.L3046:
	cmpl	%eax, %edi
	jg	.L3056
	movl	$32, %esi
	movslq	%edi, %r8
	leaq	stbi__bmask(%rip), %r9
	movl	%esi, %ecx
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
	jne	.L3059
	subl	%edi, %eax
	shlx	%edi, %edx, %edx
	movl	%eax, 18468(%rbp)
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
	.p2align 4
	.p2align 3
.L3049:
	.cfi_restore_state
	movl	$10, %edi
	jmp	.L3046
	.p2align 4
	.p2align 3
.L3050:
	movl	$11, %edi
	jmp	.L3046
	.p2align 4
	.p2align 3
.L3051:
	movl	$12, %edi
	jmp	.L3046
.L3053:
	movl	$14, %edi
	jmp	.L3046
.L3054:
	movl	$15, %edi
	jmp	.L3046
.L3055:
	movl	$16, %edi
	jmp	.L3046
.L3056:
	movl	$-1, %eax
	jmp	.L3042
.L3059:
	leaq	__PRETTY_FUNCTION__.35(%rip), %rcx
	movl	$2115, %edx
	leaq	.LC14(%rip), %rsi
	leaq	.LC122(%rip), %rdi
	call	__assert_fail@PLT
	.cfi_endproc
.LFE643:
	.size	stbi__jpeg_huff_decode, .-stbi__jpeg_huff_decode
	.section	.rodata.str1.1
.LC123:
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
	jne	.L3065
	cmpl	$15, 18468(%rdi)
	movq	%rdi, %rbx
	movq	%rsi, %rbp
	movq	%rdx, %r12
	movl	%ecx, %r13d
	jle	.L3074
	movl	18492(%rbx), %eax
	testl	%eax, %eax
	je	.L3075
.L3064:
	movl	18468(%rbx), %eax
	testl	%eax, %eax
	jle	.L3076
.L3068:
	movl	18464(%rbx), %edx
	decl	%eax
	movl	%eax, 18468(%rbx)
	movl	$1, %eax
	leal	(%rdx,%rdx), %ecx
	movl	%ecx, 18464(%rbx)
	testl	%edx, %edx
	jns	.L3060
	movl	18496(%rbx), %edx
	shlx	%edx, %eax, %edx
	addw	%dx, 0(%rbp)
.L3060:
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
	.p2align 4
	.p2align 3
.L3075:
	.cfi_restore_state
	leaq	8(%rbp), %rdi
	movq	%rbp, %rcx
	xorl	%eax, %eax
	movq	$0, 0(%rbp)
	andq	$-8, %rdi
	movq	$0, 120(%rbp)
	movq	%r12, %rsi
	subq	%rdi, %rcx
	subl	$-128, %ecx
	shrl	$3, %ecx
	rep stosq
	movq	%rbx, %rdi
	call	stbi__jpeg_huff_decode
	movl	%eax, %r12d
	cmpl	$15, %eax
	ja	.L3065
	testl	%eax, %eax
	jne	.L3077
.L3066:
	movslq	%r13d, %rcx
	movl	18496(%rbx), %edx
	leaq	(%rcx,%rcx,2), %rax
	salq	$5, %rax
	addl	18104(%rbx,%rax), %r12d
	movl	%r12d, 18104(%rbx,%rax)
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
	.p2align 4
	.p2align 3
.L3074:
	.cfi_restore_state
	call	stbi__grow_buffer_unsafe
	movl	18492(%rbx), %eax
	testl	%eax, %eax
	jne	.L3064
	jmp	.L3075
	.p2align 4
	.p2align 3
.L3065:
	leaq	.LC123(%rip), %rax
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
	.p2align 4
	.p2align 3
.L3076:
	.cfi_restore_state
	movq	%rbx, %rdi
	call	stbi__grow_buffer_unsafe
	movl	18468(%rbx), %eax
	jmp	.L3068
	.p2align 4
	.p2align 3
.L3077:
	movl	18468(%rbx), %edx
	cmpl	%edx, %eax
	jg	.L3078
.L3067:
	movl	18464(%rbx), %eax
	movl	%r12d, %ecx
	subl	%r12d, %edx
	movslq	%r12d, %rdi
	movl	%edx, 18468(%rbx)
	leaq	stbi__jbias(%rip), %rdx
	movl	%eax, %esi
	shrl	$31, %eax
	roll	%cl, %esi
	decl	%eax
	andl	(%rdx,%rdi,4), %eax
	movl	%esi, %ecx
	leaq	stbi__bmask(%rip), %rsi
	movl	(%rsi,%rdi,4), %esi
	andn	%ecx, %esi, %r8d
	andl	%esi, %ecx
	movl	%r8d, 18464(%rbx)
	leal	(%rax,%rcx), %r12d
	jmp	.L3066
	.p2align 4
	.p2align 3
.L3078:
	movq	%rbx, %rdi
	call	stbi__grow_buffer_unsafe
	movl	18468(%rbx), %edx
	jmp	.L3067
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
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdx, %r15
	movslq	%r9d, %r14
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
	movq	%r8, %rbp
	movq	%rdi, %rbx
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	cmpl	$15, 18468(%rdi)
	movq	80(%rsp), %r13
	movq	%rcx, (%rsp)
	jle	.L3095
.L3080:
	movq	%r15, %rsi
	movq	%rbx, %rdi
	call	stbi__jpeg_huff_decode
	movl	%eax, %edx
	cmpl	$15, %eax
	jbe	.L3081
.L3089:
	leaq	.LC111(%rip), %rax
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
	.p2align 4
	.p2align 3
.L3081:
	.cfi_restore_state
	xorl	%eax, %eax
	movl	$16, %ecx
	movq	%r12, %rdi
	rep stosq
	movl	18468(%rbx), %eax
	testl	%edx, %edx
	jne	.L3083
.L3084:
	leaq	(%r14,%r14,2), %rcx
	movl	$1, %r15d
	leaq	stbi__jpeg_dezigzag(%rip), %r14
	salq	$5, %rcx
	addl	18104(%rbx,%rcx), %edx
	movl	%edx, 18104(%rbx,%rcx)
	imulw	0(%r13), %dx
	movw	%dx, (%r12)
	jmp	.L3093
	.p2align 4
	.p2align 3
.L3086:
	movl	18464(%rbx), %esi
	movl	%esi, %eax
	shrl	$23, %eax
	movswl	0(%rbp,%rax,2), %edx
	movl	%edx, %ecx
	testl	%edx, %edx
	je	.L3087
	movl	%edx, %eax
	sarl	$8, %edx
	andl	$15, %ecx
	subl	%ecx, 18468(%rbx)
	sarl	$4, %eax
	shlx	%ecx, %esi, %esi
	andl	$15, %eax
	movl	%esi, 18464(%rbx)
	addl	%r15d, %eax
	leal	1(%rax), %r15d
	cltq
	movzbl	(%r14,%rax), %eax
	imulw	0(%r13,%rax,2), %dx
	movw	%dx, (%r12,%rax,2)
.L3088:
	cmpl	$63, %r15d
	jg	.L3091
.L3096:
	movl	18468(%rbx), %eax
.L3093:
	cmpl	$15, %eax
	jg	.L3086
	movq	%rbx, %rdi
	call	stbi__grow_buffer_unsafe
	jmp	.L3086
	.p2align 4
	.p2align 3
.L3087:
	movq	(%rsp), %rsi
	movq	%rbx, %rdi
	call	stbi__jpeg_huff_decode
	testl	%eax, %eax
	js	.L3089
	movl	%eax, %ecx
	andl	$15, %ecx
	jne	.L3090
	cmpl	$240, %eax
	jne	.L3091
	addl	$16, %r15d
	cmpl	$63, %r15d
	jle	.L3096
.L3091:
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movl	$1, %eax
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
	.p2align 4
	.p2align 3
.L3090:
	.cfi_restore_state
	movl	18468(%rbx), %r10d
	sarl	$4, %eax
	addl	%r15d, %eax
	leal	1(%rax), %r15d
	cltq
	movzbl	(%r14,%rax), %edx
	cmpl	%r10d, %ecx
	jg	.L3097
.L3092:
	movl	18464(%rbx), %eax
	movslq	%ecx, %r9
	leaq	stbi__bmask(%rip), %rdi
	subl	%ecx, %r10d
	movl	(%rdi,%r9,4), %r8d
	leaq	stbi__jbias(%rip), %rdi
	movl	%r10d, 18468(%rbx)
	movl	%eax, %esi
	shrl	$31, %eax
	decl	%eax
	andl	(%rdi,%r9,4), %eax
	roll	%cl, %esi
	andn	%esi, %r8d, %r11d
	andl	%r8d, %esi
	movl	%r11d, 18464(%rbx)
	addl	%esi, %eax
	imulw	0(%r13,%rdx,2), %ax
	movw	%ax, (%r12,%rdx,2)
	jmp	.L3088
	.p2align 4
	.p2align 3
.L3095:
	call	stbi__grow_buffer_unsafe
	jmp	.L3080
	.p2align 4
	.p2align 3
.L3097:
	movq	%rbx, %rdi
	movb	%dl, 15(%rsp)
	movl	%ecx, 8(%rsp)
	call	stbi__grow_buffer_unsafe
	movl	18468(%rbx), %r10d
	movzbl	15(%rsp), %edx
	movl	8(%rsp), %ecx
	jmp	.L3092
	.p2align 4
	.p2align 3
.L3083:
	cmpl	%eax, %edx
	jg	.L3098
.L3085:
	movl	18464(%rbx), %esi
	movl	%edx, %ecx
	movslq	%edx, %r8
	subl	%edx, %eax
	leaq	stbi__jbias(%rip), %rdx
	movl	%eax, 18468(%rbx)
	movl	%esi, %edi
	shrl	$31, %esi
	roll	%cl, %edi
	decl	%esi
	andl	(%rdx,%r8,4), %esi
	movl	%edi, %ecx
	leaq	stbi__bmask(%rip), %rdi
	movl	(%rdi,%r8,4), %edi
	andn	%ecx, %edi, %r9d
	andl	%edi, %ecx
	movl	%r9d, 18464(%rbx)
	leal	(%rsi,%rcx), %edx
	jmp	.L3084
.L3098:
	movq	%rbx, %rdi
	movl	%edx, 8(%rsp)
	call	stbi__grow_buffer_unsafe
	movl	18468(%rbx), %eax
	movl	8(%rsp), %edx
	jmp	.L3085
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
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rcx, %r11
	movq	%rdi, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rcx, %r13
	leaq	512(%rcx), %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%r9, %rbp
	movq	%rcx, %rbx
	subq	$360, %rsp
	.cfi_def_cfa_offset 416
	movq	%rsi, (%rsp)
	movq	%rdx, 16(%rsp)
	movq	%fs:40, %rdx
	movq	%rdx, 344(%rsp)
	xorl	%edx, %edx
	.p2align 4
	.p2align 3
.L3100:
	leaq	28(%rbx), %rax
	leaq	12(%rbx), %rcx
	leaq	8(%rbx), %rdx
	leaq	4(%rbx), %rsi
	pushq	%rax
	.cfi_def_cfa_offset 424
	leaq	24(%rbx), %rax
	leaq	20(%rbx), %r9
	leaq	16(%rbx), %r8
	pushq	%rax
	.cfi_def_cfa_offset 432
	movq	%rbx, %rdi
	addq	$64, %rbx
	call	stbiw__jpg_DCT
	popq	%r10
	.cfi_def_cfa_offset 424
	popq	%r15
	.cfi_def_cfa_offset 416
	cmpq	%rbx, %r12
	jne	.L3100
	leaq	32(%r11), %rbx
	.p2align 4
	.p2align 3
.L3101:
	leaq	448(%r11), %rax
	leaq	320(%r11), %r9
	leaq	256(%r11), %r8
	leaq	192(%r11), %rcx
	pushq	%rax
	.cfi_def_cfa_offset 424
	leaq	384(%r11), %rax
	leaq	128(%r11), %rdx
	leaq	64(%r11), %rsi
	pushq	%rax
	.cfi_def_cfa_offset 432
	movq	%r11, %rdi
	addq	$4, %r11
	call	stbiw__jpg_DCT
	popq	%r8
	.cfi_def_cfa_offset 424
	popq	%r9
	.cfi_def_cfa_offset 416
	cmpq	%r11, %rbx
	jne	.L3101
	vmovss	.LC124(%rip), %xmm1
	leaq	stbiw__jpg_ZigZag(%rip), %rdx
	vxorps	%xmm0, %xmm0, %xmm0
	leaq	64(%rdx), %rcx
	.p2align 4
	.p2align 3
.L3119:
	vmovss	0(%rbp), %xmm2
	vmulss	0(%r13), %xmm2, %xmm2
	vcomiss	%xmm2, %xmm0
	ja	.L3102
	vaddss	%xmm1, %xmm2, %xmm2
	vcvttss2sil	%xmm2, %esi
.L3103:
	vmovss	4(%r13), %xmm2
	movzbl	(%rdx), %eax
	vmulss	4(%rbp), %xmm2, %xmm2
	movl	%esi, 80(%rsp,%rax,4)
	vcomiss	%xmm2, %xmm0
	ja	.L3104
	vaddss	%xmm1, %xmm2, %xmm2
	vcvttss2sil	%xmm2, %esi
.L3105:
	vmovss	8(%r13), %xmm2
	movzbl	1(%rdx), %eax
	vmulss	8(%rbp), %xmm2, %xmm2
	movl	%esi, 80(%rsp,%rax,4)
	vcomiss	%xmm2, %xmm0
	ja	.L3106
	vaddss	%xmm1, %xmm2, %xmm2
	vcvttss2sil	%xmm2, %esi
.L3107:
	vmovss	12(%r13), %xmm2
	movzbl	2(%rdx), %eax
	vmulss	12(%rbp), %xmm2, %xmm2
	movl	%esi, 80(%rsp,%rax,4)
	vcomiss	%xmm2, %xmm0
	ja	.L3108
	vaddss	%xmm1, %xmm2, %xmm2
	vcvttss2sil	%xmm2, %esi
.L3109:
	vmovss	16(%r13), %xmm2
	movzbl	3(%rdx), %eax
	vmulss	16(%rbp), %xmm2, %xmm2
	movl	%esi, 80(%rsp,%rax,4)
	vcomiss	%xmm2, %xmm0
	ja	.L3110
	vaddss	%xmm1, %xmm2, %xmm2
	vcvttss2sil	%xmm2, %esi
.L3111:
	vmovss	20(%r13), %xmm2
	movzbl	4(%rdx), %eax
	vmulss	20(%rbp), %xmm2, %xmm2
	movl	%esi, 80(%rsp,%rax,4)
	vcomiss	%xmm2, %xmm0
	ja	.L3112
	vaddss	%xmm1, %xmm2, %xmm2
	vcvttss2sil	%xmm2, %esi
.L3113:
	vmovss	24(%r13), %xmm2
	movzbl	5(%rdx), %eax
	vmulss	24(%rbp), %xmm2, %xmm2
	movl	%esi, 80(%rsp,%rax,4)
	vcomiss	%xmm2, %xmm0
	ja	.L3114
	vaddss	%xmm1, %xmm2, %xmm2
	vcvttss2sil	%xmm2, %esi
.L3115:
	vmovss	28(%r13), %xmm2
	movzbl	6(%rdx), %eax
	vmulss	28(%rbp), %xmm2, %xmm2
	movl	%esi, 80(%rsp,%rax,4)
	movzbl	7(%rdx), %eax
	vcomiss	%xmm2, %xmm0
	ja	.L3116
	vaddss	%xmm1, %xmm2, %xmm2
	addq	$8, %rdx
	addq	$64, %r13
	addq	$32, %rbp
	vcvttss2sil	%xmm2, %esi
	movl	%esi, 80(%rsp,%rax,4)
	cmpq	%rcx, %rdx
	jne	.L3119
.L3118:
	movl	80(%rsp), %eax
	movq	(%rsp), %rcx
	movl	%eax, 60(%rsp)
	subl	416(%rsp), %eax
	movl	(%rcx), %r13d
	movq	16(%rsp), %rcx
	movl	%eax, %edi
	movl	(%rcx), %r12d
	je	.L3200
	movl	%eax, %edx
	negl	%edx
	cmovs	%eax, %edx
	cmpl	$-2147483648, %eax
	adcl	$-1, %edi
	sarl	%edx
	je	.L3170
	movl	$2, %ecx
	.p2align 4
	.p2align 3
.L3127:
	movl	%ecx, %esi
	incl	%ecx
	sarl	%edx
	jne	.L3127
	movl	$1, %ebp
	movzwl	%si, %eax
	movzwl	%si, %edx
	shlx	%esi, %ebp, %ebp
	movl	%eax, 12(%rsp)
	salq	$2, %rdx
	decl	%ebp
.L3126:
	leaq	YDC_HT.4(%rip), %rcx
	andl	%edi, %ebp
	movzwl	2(%rcx,%rdx), %eax
	movw	%bp, 8(%rsp)
	leal	(%rax,%r12), %r15d
	movzwl	(%rcx,%rdx), %r12d
	movl	$24, %edx
	subl	%r15d, %edx
	shlx	%edx, %r12d, %r12d
	orl	%r13d, %r12d
	cmpl	$7, %r15d
	jle	.L3128
	movl	%r15d, %r13d
	leaq	79(%rsp), %rbx
	.p2align 4
	.p2align 3
.L3130:
	movl	%r12d, %ebp
	movq	8(%r14), %rdi
	movl	$1, %edx
	movq	%rbx, %rsi
	sarl	$16, %ebp
	movb	%bpl, 79(%rsp)
	call	*(%r14)
	cmpb	$-1, %bpl
	jne	.L3129
	movq	8(%r14), %rdi
	movb	$0, 79(%rsp)
	movl	$1, %edx
	movq	%rbx, %rsi
	call	*(%r14)
.L3129:
	subl	$8, %r13d
	sall	$8, %r12d
	cmpl	$7, %r13d
	jg	.L3130
	andl	$7, %r15d
.L3128:
	movq	(%rsp), %rcx
	movq	16(%rsp), %rax
	movl	$24, %edx
	movl	%r12d, (%rcx)
	movl	%r15d, (%rax)
	movl	12(%rsp), %eax
	movzwl	8(%rsp), %r12d
	addl	%r15d, %eax
	subl	%eax, %edx
	movl	%eax, 12(%rsp)
	shlx	%edx, %r12d, %r12d
	orl	(%rcx), %r12d
	cmpl	$7, %eax
	jle	.L3131
	movl	%eax, %ebp
	leaq	79(%rsp), %rbx
	.p2align 4
	.p2align 3
.L3133:
	movl	%r12d, %r13d
	movq	8(%r14), %rdi
	movl	$1, %edx
	movq	%rbx, %rsi
	sarl	$16, %r13d
	movb	%r13b, 79(%rsp)
	call	*(%r14)
	cmpb	$-1, %r13b
	jne	.L3132
	movq	8(%r14), %rdi
	movb	$0, 79(%rsp)
	movl	$1, %edx
	movq	%rbx, %rsi
	call	*(%r14)
.L3132:
	subl	$8, %ebp
	sall	$8, %r12d
	cmpl	$7, %ebp
	jg	.L3133
	andl	$7, 12(%rsp)
.L3131:
	movq	(%rsp), %rax
	movl	12(%rsp), %ecx
	movl	%r12d, (%rax)
	movq	16(%rsp), %rax
	movl	%ecx, (%rax)
.L3124:
	leaq	80(%rsp), %rax
	movl	$63, %edx
	movq	%rax, 40(%rsp)
	jmp	.L3134
	.p2align 4
	.p2align 3
.L3136:
	decq	%rdx
	je	.L3135
.L3134:
	movl	(%rax,%rdx,4), %edi
	testl	%edi, %edi
	je	.L3136
	movl	%edx, 32(%rsp)
	movl	%edx, 52(%rsp)
	movl	$1, %esi
	.p2align 4
	.p2align 3
.L3137:
	movslq	%esi, %rdx
	movl	80(%rsp,%rdx,4), %ebx
	testl	%ebx, %ebx
	jne	.L3162
	cmpl	%esi, 32(%rsp)
	jl	.L3201
	movl	52(%rsp), %edi
	leal	2(%rsi), %ecx
	leal	1(%rsi), %edx
	movq	40(%rsp), %rax
	movslq	%ecx, %rcx
	movslq	%edx, %rdx
	subl	%esi, %edi
	addq	%rdi, %rcx
	jmp	.L3142
	.p2align 4
	.p2align 3
.L3203:
	incq	%rdx
	cmpq	%rdx, %rcx
	je	.L3202
.L3142:
	movl	(%rax,%rdx,4), %ebx
	movl	%edx, %edi
	testl	%ebx, %ebx
	je	.L3203
	movl	%edx, %eax
	movl	%ebx, %r13d
	movl	%edx, 28(%rsp)
	subl	%esi, %eax
	negl	%r13d
	cmovs	%ebx, %r13d
	movl	%eax, 36(%rsp)
	sarl	%r13d
	movl	%r13d, 48(%rsp)
	cmpl	$15, %eax
	jg	.L3144
	sall	$4, %eax
	movl	%eax, %ecx
.L3145:
	movl	48(%rsp), %edi
	leal	-1(%rbx), %esi
	testl	%ebx, %ebx
	cmovns	%ebx, %esi
	testl	%edi, %edi
	je	.L3152
	movl	$2, %edx
	.p2align 4
	.p2align 3
.L3153:
	movzwl	%dx, %eax
	incl	%edx
	sarl	%edi
	jne	.L3153
	movl	$1, %ebx
	leal	(%rcx,%rax), %edx
	movl	%eax, 24(%rsp)
	shlx	%eax, %ebx, %ebx
	movslq	%edx, %rdx
	decl	%ebx
	salq	$2, %rdx
	andl	%esi, %ebx
	movzwl	%bx, %ebx
.L3154:
	leaq	YAC_HT.3(%rip), %rsi
	movl	12(%rsp), %eax
	movzwl	2(%rsi,%rdx), %ecx
	movzwl	(%rsi,%rdx), %ebp
	movl	$24, %edx
	addl	%ecx, %eax
	movq	(%rsp), %rcx
	subl	%eax, %edx
	movl	%eax, 8(%rsp)
	shlx	%edx, %ebp, %ebp
	orl	(%rcx), %ebp
	cmpl	$7, %eax
	jle	.L3155
	movl	%eax, %r13d
	leaq	79(%rsp), %r15
	.p2align 4
	.p2align 3
.L3157:
	movl	%ebp, %r12d
	movq	8(%r14), %rdi
	movl	$1, %edx
	movq	%r15, %rsi
	sarl	$16, %r12d
	movb	%r12b, 79(%rsp)
	call	*(%r14)
	cmpb	$-1, %r12b
	jne	.L3156
	movq	8(%r14), %rdi
	movb	$0, 79(%rsp)
	movl	$1, %edx
	movq	%r15, %rsi
	call	*(%r14)
.L3156:
	subl	$8, %r13d
	sall	$8, %ebp
	cmpl	$7, %r13d
	jg	.L3157
	andl	$7, 8(%rsp)
.L3155:
	movq	(%rsp), %rcx
	movl	8(%rsp), %eax
	movl	$24, %edx
	movq	16(%rsp), %rsi
	movl	%ebp, (%rcx)
	movl	%eax, (%rsi)
	addl	24(%rsp), %eax
	subl	%eax, %edx
	movl	%eax, 12(%rsp)
	shlx	%edx, %ebx, %ebx
	orl	(%rcx), %ebx
	cmpl	$7, %eax
	jle	.L3158
	movl	%eax, %ebp
	leaq	79(%rsp), %r15
	.p2align 4
	.p2align 3
.L3160:
	movl	%ebx, %r12d
	movq	8(%r14), %rdi
	movl	$1, %edx
	movq	%r15, %rsi
	sarl	$16, %r12d
	movb	%r12b, 79(%rsp)
	call	*(%r14)
	cmpb	$-1, %r12b
	jne	.L3159
	movq	8(%r14), %rdi
	movb	$0, 79(%rsp)
	movl	$1, %edx
	movq	%r15, %rsi
	call	*(%r14)
.L3159:
	subl	$8, %ebp
	sall	$8, %ebx
	cmpl	$7, %ebp
	jg	.L3160
	andl	$7, 12(%rsp)
.L3158:
	movq	(%rsp), %rax
	movl	12(%rsp), %ecx
	movl	28(%rsp), %esi
	movl	%ebx, (%rax)
	movq	16(%rsp), %rax
	incl	%esi
	movl	%ecx, (%rax)
	cmpl	32(%rsp), %esi
	jle	.L3137
	cmpl	$63, 32(%rsp)
	jne	.L3204
.L3099:
	movq	344(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L3205
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
	.p2align 4
	.p2align 3
.L3116:
	.cfi_restore_state
	vsubss	%xmm1, %xmm2, %xmm2
	addq	$8, %rdx
	addq	$64, %r13
	addq	$32, %rbp
	vcvttss2sil	%xmm2, %esi
	movl	%esi, 80(%rsp,%rax,4)
	cmpq	%rdx, %rcx
	jne	.L3119
	jmp	.L3118
	.p2align 4
	.p2align 3
.L3114:
	vsubss	%xmm1, %xmm2, %xmm2
	vcvttss2sil	%xmm2, %esi
	jmp	.L3115
	.p2align 4
	.p2align 3
.L3112:
	vsubss	%xmm1, %xmm2, %xmm2
	vcvttss2sil	%xmm2, %esi
	jmp	.L3113
	.p2align 4
	.p2align 3
.L3110:
	vsubss	%xmm1, %xmm2, %xmm2
	vcvttss2sil	%xmm2, %esi
	jmp	.L3111
	.p2align 4
	.p2align 3
.L3108:
	vsubss	%xmm1, %xmm2, %xmm2
	vcvttss2sil	%xmm2, %esi
	jmp	.L3109
	.p2align 4
	.p2align 3
.L3106:
	vsubss	%xmm1, %xmm2, %xmm2
	vcvttss2sil	%xmm2, %esi
	jmp	.L3107
	.p2align 4
	.p2align 3
.L3104:
	vsubss	%xmm1, %xmm2, %xmm2
	vcvttss2sil	%xmm2, %esi
	jmp	.L3105
	.p2align 4
	.p2align 3
.L3102:
	vsubss	%xmm1, %xmm2, %xmm2
	vcvttss2sil	%xmm2, %esi
	jmp	.L3103
	.p2align 4
	.p2align 3
.L3202:
	movl	%edi, %eax
	movl	%edi, 28(%rsp)
	subl	%esi, %eax
	movl	%eax, 36(%rsp)
	cmpl	$15, %eax
	jg	.L3206
	movl	%eax, %ecx
	xorl	%esi, %esi
	sall	$4, %ecx
.L3152:
	leal	1(%rcx), %edx
	movl	%esi, %ebx
	movl	$1, 24(%rsp)
	movslq	%edx, %rdx
	andl	$1, %ebx
	salq	$2, %rdx
	jmp	.L3154
.L3206:
	movl	$0, 48(%rsp)
.L3144:
	movl	36(%rsp), %edx
	movl	$1, 8(%rsp)
	movl	%ebx, 56(%rsp)
	movl	12(%rsp), %r12d
	sarl	$4, %edx
	leal	1(%rdx), %eax
	movl	%eax, 24(%rsp)
	.p2align 4
	.p2align 3
.L3149:
	movq	(%rsp), %rax
	leal	11(%r12), %r15d
	movl	$24, %edx
	movl	$2041, %ebx
	subl	%r15d, %edx
	shlx	%edx, %ebx, %ebx
	orl	(%rax), %ebx
	cmpl	$7, %r15d
	jle	.L3171
	leaq	79(%rsp), %rbp
	.p2align 4
	.p2align 3
.L3148:
	movl	%ebx, %r13d
	movq	8(%r14), %rdi
	movl	$1, %edx
	movq	%rbp, %rsi
	sarl	$16, %r13d
	movb	%r13b, 79(%rsp)
	call	*(%r14)
	cmpb	$-1, %r13b
	jne	.L3147
	movq	8(%r14), %rdi
	movb	$0, 79(%rsp)
	movl	$1, %edx
	movq	%rbp, %rsi
	call	*(%r14)
.L3147:
	subl	$8, %r15d
	sall	$8, %ebx
	cmpl	$7, %r15d
	jg	.L3148
	addl	$3, %r12d
	andl	$7, %r12d
.L3146:
	movq	(%rsp), %rax
	incl	8(%rsp)
	movl	%ebx, (%rax)
	movq	16(%rsp), %rax
	movl	%r12d, (%rax)
	movl	8(%rsp), %eax
	cmpl	24(%rsp), %eax
	jne	.L3149
	movl	36(%rsp), %ecx
	movl	%r12d, 12(%rsp)
	movl	56(%rsp), %ebx
	sall	$4, %ecx
	movzbl	%cl, %ecx
	jmp	.L3145
	.p2align 4
	.p2align 3
.L3171:
	movl	%r15d, %r12d
	jmp	.L3146
.L3204:
	movq	(%rsp), %rax
	leal	4(%rcx), %ebp
	movl	$24, %edx
	movl	$10, %r12d
	subl	%ebp, %edx
	shlx	%edx, %r12d, %r12d
	orl	(%rax), %r12d
	cmpl	$7, %ebp
	jle	.L3164
	leaq	79(%rsp), %rbx
	.p2align 4
	.p2align 3
.L3166:
	movl	%r12d, %r13d
	movq	8(%r14), %rdi
	movl	$1, %edx
	movq	%rbx, %rsi
	sarl	$16, %r13d
	movb	%r13b, 79(%rsp)
	call	*(%r14)
	cmpb	$-1, %r13b
	jne	.L3165
	movq	8(%r14), %rdi
	movb	$0, 79(%rsp)
	movl	$1, %edx
	movq	%rbx, %rsi
	call	*(%r14)
.L3165:
	subl	$8, %ebp
	sall	$8, %r12d
	cmpl	$7, %ebp
	jg	.L3166
	movl	12(%rsp), %ebp
	subl	$4, %ebp
	andl	$7, %ebp
.L3164:
	movq	(%rsp), %rax
	movl	%r12d, (%rax)
	movq	16(%rsp), %rax
	movl	%ebp, (%rax)
	jmp	.L3099
.L3162:
	movl	%ebx, %r13d
	movl	%esi, 28(%rsp)
	negl	%r13d
	cmovs	%ebx, %r13d
	xorl	%ecx, %ecx
	sarl	%r13d
	movl	%r13d, 48(%rsp)
	jmp	.L3145
.L3201:
	movl	%esi, 28(%rsp)
	movl	$4, %edx
	movl	$1, 24(%rsp)
	jmp	.L3154
.L3200:
	leal	2(%r12), %ebp
	movl	%ebp, 12(%rsp)
	cmpl	$7, %ebp
	jle	.L3121
	leaq	79(%rsp), %rbx
	.p2align 4
	.p2align 3
.L3123:
	movl	%r13d, %r15d
	movq	8(%r14), %rdi
	movl	$1, %edx
	movq	%rbx, %rsi
	sarl	$16, %r15d
	movb	%r15b, 79(%rsp)
	call	*(%r14)
	cmpb	$-1, %r15b
	jne	.L3122
	movq	8(%r14), %rdi
	movb	$0, 79(%rsp)
	movl	$1, %edx
	movq	%rbx, %rsi
	call	*(%r14)
.L3122:
	subl	$8, %ebp
	sall	$8, %r13d
	cmpl	$7, %ebp
	jg	.L3123
	subl	$6, %r12d
	andl	$7, %r12d
	movl	%r12d, 12(%rsp)
.L3121:
	movq	(%rsp), %rax
	movl	12(%rsp), %ecx
	movl	%r13d, (%rax)
	movq	16(%rsp), %rax
	movl	%ecx, (%rax)
	jmp	.L3124
.L3135:
	movl	12(%rsp), %eax
	movl	$24, %edx
	movl	$10, %ebp
	leaq	79(%rsp), %rbx
	leal	4(%rax), %r12d
	movq	(%rsp), %rax
	subl	%r12d, %edx
	shlx	%edx, %ebp, %ebp
	orl	(%rax), %ebp
	cmpl	$7, %r12d
	jle	.L3167
	.p2align 4
	.p2align 3
.L3139:
	movl	%ebp, %r13d
	movq	8(%r14), %rdi
	movl	$1, %edx
	movq	%rbx, %rsi
	sarl	$16, %r13d
	movb	%r13b, 79(%rsp)
	call	*(%r14)
	cmpb	$-1, %r13b
	jne	.L3138
	movq	8(%r14), %rdi
	movb	$0, 79(%rsp)
	movl	$1, %edx
	movq	%rbx, %rsi
	call	*(%r14)
.L3138:
	subl	$8, %r12d
	sall	$8, %ebp
	cmpl	$7, %r12d
	jg	.L3139
	movl	12(%rsp), %r12d
	subl	$4, %r12d
	andl	$7, %r12d
.L3167:
	movq	(%rsp), %rax
	movl	%ebp, (%rax)
	movq	16(%rsp), %rax
	movl	%r12d, (%rax)
	jmp	.L3099
.L3170:
	movl	$4, %edx
	movl	$1, %ebp
	movl	$1, 12(%rsp)
	jmp	.L3126
.L3205:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE886:
	.size	stbiw__jpg_processDU.constprop.0, .-stbiw__jpg_processDU.constprop.0
	.section	.rodata.str1.1
.LC125:
	.string	"not PSD"
.LC126:
	.string	"wrong version"
.LC127:
	.string	"wrong channel count"
.LC128:
	.string	"unsupported bit depth"
.LC129:
	.string	"wrong color format"
.LC132:
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
	movq	%rdx, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movl	%r8d, %r13d
	movq	%rcx, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%r9, %rbp
	movq	%rdi, %rbx
	subq	$104, %rsp
	.cfi_def_cfa_offset 160
	movq	%rsi, 8(%rsp)
	call	stbi__get32be
	cmpl	$943870035, %eax
	jne	.L3354
	movq	%rbx, %rdi
	call	stbi__get16be
	cmpl	$1, %eax
	jne	.L3355
	cmpq	$0, 16(%rbx)
	movq	192(%rbx), %rax
	je	.L3211
	movq	200(%rbx), %rcx
	movq	%rcx, %rdx
	subq	%rax, %rdx
	cmpl	$5, %edx
	jle	.L3356
.L3211:
	addq	$6, %rax
	movq	%rax, 192(%rbx)
.L3212:
	movq	%rbx, %rdi
	call	stbi__get16be
	movl	%eax, 20(%rsp)
	cmpl	$16, %eax
	ja	.L3357
	movq	%rbx, %rdi
	call	stbi__get32be
	movq	%rbx, %rdi
	movl	%eax, %r15d
	movl	%eax, 36(%rsp)
	call	stbi__get32be
	movl	%eax, 16(%rsp)
	cmpl	$16777216, %r15d
	jg	.L3215
	cmpl	$16777216, 16(%rsp)
	jg	.L3215
	movq	%rbx, %rdi
	call	stbi__get16be
	movl	%eax, 24(%rsp)
	subl	$8, %eax
	andl	$-9, %eax
	jne	.L3358
	movq	%rbx, %rdi
	call	stbi__get16be
	cmpl	$3, %eax
	jne	.L3359
	movq	%rbx, %rdi
	call	stbi__get32be
	movl	%eax, %esi
	testl	%eax, %eax
	je	.L3218
	js	.L3360
	movq	%rbx, %rdi
	call	stbi__skip.part.0
.L3218:
	movq	%rbx, %rdi
	call	stbi__get32be
	movl	%eax, %esi
	testl	%eax, %eax
	je	.L3220
	js	.L3361
	movq	%rbx, %rdi
	call	stbi__skip.part.0
.L3220:
	movq	%rbx, %rdi
	call	stbi__get32be
	movl	%eax, %esi
	testl	%eax, %eax
	je	.L3222
	js	.L3362
	movq	%rbx, %rdi
	call	stbi__skip.part.0
.L3222:
	movq	%rbx, %rdi
	call	stbi__get16be
	movl	%eax, %esi
	cmpl	$1, %eax
	jg	.L3363
	movl	36(%rsp), %eax
	movl	16(%rsp), %ecx
	movl	%eax, %edi
	orl	%ecx, %edi
	js	.L3215
	movl	%eax, %edi
	testl	%eax, %eax
	je	.L3225
	movl	$2147483647, %eax
	sall	$2, %ecx
	cltd
	idivl	%edi
	cmpl	%eax, %ecx
	jg	.L3215
.L3225:
	cmpl	$16, 24(%rsp)
	sete	%dl
	cmpl	$16, 160(%rsp)
	sete	%al
	andl	%eax, %edx
	movb	%dl, 48(%rsp)
	testl	%esi, %esi
	jne	.L3226
	testb	%dl, %dl
	jne	.L3364
.L3226:
	movl	36(%rsp), %eax
	imull	16(%rsp), %eax
	movl	%esi, 40(%rsp)
	leal	0(,%rax,4), %edi
	movl	%eax, 32(%rsp)
	movslq	%edi, %rdi
	call	malloc@PLT
	movq	%rax, %r15
	testq	%rax, %rax
	je	.L3228
	movl	40(%rsp), %esi
	testl	%esi, %esi
	je	.L3229
	movl	20(%rsp), %esi
	imull	36(%rsp), %esi
	testl	%esi, %esi
	je	.L3230
	leal	(%rsi,%rsi), %esi
	movq	%rbx, %rdi
	call	stbi__skip.part.0
.L3230:
	movl	32(%rsp), %eax
	xorl	%ecx, %ecx
	movq	%r15, 48(%rsp)
	movl	%r13d, 84(%rsp)
	movq	%r14, 64(%rsp)
	movq	%r12, 72(%rsp)
	movq	%rcx, %r13
	movq	%rbp, 88(%rsp)
	decl	%eax
	movl	%eax, 80(%rsp)
	leaq	4(%r15,%rax,4), %rax
	movq	%rbx, %r15
	movq	%rax, 40(%rsp)
	leaq	57(%rbx), %rax
	movq	%rax, 24(%rsp)
.L3233:
	movq	48(%rsp), %rax
	xorl	%ebx, %ebx
	leaq	56(%r15), %r12
	leaq	(%rax,%r13), %rbp
	cmpl	%r13d, 20(%rsp)
	jle	.L3365
	movq	%r13, 56(%rsp)
	movl	%ebx, %r13d
	.p2align 4
	.p2align 3
.L3231:
	movl	32(%rsp), %r14d
	subl	%r13d, %r14d
	testl	%r14d, %r14d
	jle	.L3350
.L3241:
	movq	192(%r15), %rax
	movq	200(%r15), %rdx
	cmpq	%rdx, %rax
	jb	.L3366
	movl	48(%r15), %r11d
	testl	%r11d, %r11d
	jne	.L3367
	movl	$1, %esi
.L3238:
	addl	%esi, %r13d
	movslq	%esi, %rsi
	leaq	0(%rbp,%rsi,4), %r14
	jmp	.L3248
	.p2align 4
	.p2align 3
.L3244:
	movl	48(%r15), %r10d
	xorl	%ebx, %ebx
	testl	%r10d, %r10d
	jne	.L3368
.L3245:
	movb	%bl, 0(%rbp)
	addq	$4, %rbp
	cmpq	%r14, %rbp
	je	.L3249
.L3248:
	cmpq	%rax, %rdx
	jbe	.L3244
	leaq	1(%rax), %rcx
	movq	%rcx, 192(%r15)
	movzbl	(%rax), %ebx
	movq	%rcx, %rax
	jmp	.L3245
	.p2align 4
	.p2align 3
.L3355:
	leaq	.LC126(%rip), %rax
	xorl	%r15d, %r15d
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
.L3207:
	addq	$104, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%r15, %rax
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
	.p2align 4
	.p2align 3
.L3354:
	.cfi_restore_state
	leaq	.LC125(%rip), %rax
	xorl	%r15d, %r15d
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L3207
	.p2align 4
	.p2align 3
.L3356:
	movl	$6, %esi
	movq	40(%rbx), %rdi
	movq	%rcx, 192(%rbx)
	subl	%edx, %esi
	call	*24(%rbx)
	jmp	.L3212
	.p2align 4
	.p2align 3
.L3215:
	leaq	.LC93(%rip), %rax
	xorl	%r15d, %r15d
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L3207
	.p2align 4
	.p2align 3
.L3357:
	leaq	.LC127(%rip), %rax
	xorl	%r15d, %r15d
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L3207
	.p2align 4
	.p2align 3
.L3359:
	leaq	.LC129(%rip), %rax
	xorl	%r15d, %r15d
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L3207
	.p2align 4
	.p2align 3
.L3366:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%r15)
	movzbl	(%rax), %eax
.L3237:
	cmpl	$128, %eax
	je	.L3241
	cmpl	$127, %eax
	jle	.L3369
	movl	$257, %ebx
	subl	%eax, %ebx
	cmpl	%ebx, %r14d
	jl	.L3243
	movq	%r15, %rdi
	addl	%ebx, %r13d
	call	stbi__get8
	movslq	%ebx, %rdx
	leaq	0(%rbp,%rdx,4), %r14
	.p2align 4
	.p2align 3
.L3250:
	movb	%al, 0(%rbp)
	addq	$4, %rbp
	cmpq	%r14, %rbp
	jne	.L3250
.L3249:
	movq	%r14, %rbp
	jmp	.L3231
	.p2align 4
	.p2align 3
.L3368:
	movl	52(%r15), %edx
	movq	40(%r15), %rdi
	movq	%r12, %rsi
	call	*16(%r15)
	movslq	%eax, %rdx
	movq	192(%r15), %rax
	subq	208(%r15), %rax
	addl	%eax, 184(%r15)
	movq	24(%rsp), %rax
	testl	%edx, %edx
	jne	.L3246
	movl	$0, 48(%r15)
	movq	%rax, %rdx
	vmovq	%rax, %xmm6
	movb	$0, 56(%r15)
.L3247:
	vpinsrq	$1, %rdx, %xmm6, %xmm0
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L3245
	.p2align 4
	.p2align 3
.L3367:
	movl	52(%r15), %edx
	movq	40(%r15), %rdi
	movq	%r12, %rsi
	call	*16(%r15)
	movslq	%eax, %rdx
	movq	192(%r15), %rax
	subq	208(%r15), %rax
	addl	%eax, 184(%r15)
	testl	%edx, %edx
	jne	.L3239
	vmovddup	24(%rsp), %xmm0
	movl	$0, 48(%r15)
	movl	$1, %esi
	movb	$0, 56(%r15)
	vmovdqu	%xmm0, 192(%r15)
.L3240:
	movq	192(%r15), %rax
	movq	200(%r15), %rdx
	jmp	.L3238
	.p2align 4
	.p2align 3
.L3246:
	movzbl	56(%r15), %ebx
	addq	%r12, %rdx
	vmovq	%rax, %xmm6
	jmp	.L3247
	.p2align 4
	.p2align 3
.L3239:
	addq	%r12, %rdx
	vmovq	24(%rsp), %xmm7
	movzbl	56(%r15), %eax
	vpinsrq	$1, %rdx, %xmm7, %xmm0
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L3237
	.p2align 4
	.p2align 3
.L3358:
	leaq	.LC128(%rip), %rax
	xorl	%r15d, %r15d
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L3207
	.p2align 4
	.p2align 3
.L3365:
	movl	32(%rsp), %ebx
	cmpl	$3, %r13d
	movq	40(%rsp), %rdx
	sete	%al
	negl	%eax
	testl	%ebx, %ebx
	je	.L3236
	.p2align 4
	.p2align 3
.L3235:
	movb	%al, 0(%rbp)
	addq	$4, %rbp
	cmpq	%rdx, %rbp
	jne	.L3235
.L3236:
	incq	%r13
	incq	40(%rsp)
	cmpq	$4, %r13
	jne	.L3233
	movq	48(%rsp), %r15
	movq	64(%rsp), %r14
	movq	72(%rsp), %r12
	movl	84(%rsp), %r13d
	movq	88(%rsp), %rbp
.L3234:
	movl	%r13d, %ecx
	andl	$-5, %ecx
	cmpl	$3, 20(%rsp)
	jle	.L3264
	cmpl	$16, 0(%rbp)
	vxorps	%xmm2, %xmm2, %xmm2
	je	.L3265
	movl	32(%rsp), %edx
	testl	%edx, %edx
	je	.L3267
	vmovss	.LC131(%rip), %xmm4
	vmovss	.LC57(%rip), %xmm5
	movq	%r15, %rax
	movl	80(%rsp), %edx
	leaq	4(%r15,%rdx,4), %rdx
	.p2align 4
	.p2align 3
.L3272:
	movzbl	3(%rax), %esi
	leal	-1(%rsi), %edi
	cmpb	$-3, %dil
	ja	.L3271
	vcvtsi2ssl	%esi, %xmm2, %xmm0
	vdivss	%xmm4, %xmm0, %xmm0
	movzbl	(%rax), %esi
	vcvtsi2ssl	%esi, %xmm2, %xmm1
	vdivss	%xmm0, %xmm5, %xmm0
	vsubss	%xmm0, %xmm5, %xmm3
	vmulss	%xmm0, %xmm1, %xmm1
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
.L3271:
	addq	$4, %rax
	cmpq	%rdx, %rax
	jne	.L3272
.L3267:
	testl	%ecx, %ecx
	je	.L3273
.L3274:
	movl	36(%rsp), %r8d
	movl	16(%rsp), %ecx
	movq	%r15, %rdi
	movl	%r13d, %edx
	movl	$4, %esi
	call	stbi__convert_format
	movq	%rax, %r15
.L3275:
	testq	%r15, %r15
	je	.L3207
.L3273:
	testq	%r12, %r12
	je	.L3276
	movl	$4, (%r12)
.L3276:
	movl	36(%rsp), %eax
	movl	16(%rsp), %ecx
	movl	%eax, (%r14)
	movq	8(%rsp), %rax
	movl	%ecx, (%rax)
	jmp	.L3207
.L3364:
	movl	36(%rsp), %edx
	movl	16(%rsp), %esi
	xorl	%ecx, %ecx
	movl	$8, %edi
	call	stbi__malloc_mad3
	movl	$16, 0(%rbp)
	movq	%rax, %r15
	testq	%rax, %rax
	je	.L3228
	movl	36(%rsp), %eax
	imull	16(%rsp), %eax
	movl	%eax, 32(%rsp)
.L3229:
	movl	32(%rsp), %eax
	xorl	%esi, %esi
	movq	%r14, 64(%rsp)
	movq	%r12, 72(%rsp)
	movl	%r13d, 84(%rsp)
	movq	%rbp, 56(%rsp)
	movq	%r15, %r14
	movq	%rsi, %r12
	movq	%r15, 40(%rsp)
	decl	%eax
	leaq	8(%r15,%rax,8), %rcx
	movl	%eax, 80(%rsp)
	leaq	4(%r15,%rax,4), %rax
	movq	%rcx, %r13
	movq	%rax, %rbp
.L3256:
	cmpl	20(%rsp), %r12d
	jl	.L3253
	cmpl	$3, %r12d
	sete	%dl
	cmpb	$0, 48(%rsp)
	je	.L3254
	movl	32(%rsp), %r9d
	movzbl	%dl, %edx
	movq	%r14, %rax
	negl	%edx
	testl	%r9d, %r9d
	je	.L3257
	.p2align 4
	.p2align 3
.L3255:
	movw	%dx, (%rax)
	addq	$8, %rax
	cmpq	%r13, %rax
	jne	.L3255
.L3257:
	incq	%r12
	addq	$2, %r14
	addq	$2, %r13
	incq	%rbp
	cmpq	$4, %r12
	jne	.L3256
	movq	40(%rsp), %r15
	movq	64(%rsp), %r14
	movq	72(%rsp), %r12
	movl	84(%rsp), %r13d
	movq	56(%rsp), %rbp
	jmp	.L3234
	.p2align 4
	.p2align 3
.L3253:
	movq	56(%rsp), %rax
	cmpl	$16, (%rax)
	je	.L3370
	cmpl	$16, 24(%rsp)
	movq	40(%rsp), %rax
	leaq	(%rax,%r12), %r15
	je	.L3261
	movl	32(%rsp), %esi
	testl	%esi, %esi
	je	.L3257
	.p2align 4
	.p2align 3
.L3262:
	movq	%rbx, %rdi
	addq	$4, %r15
	call	stbi__get8
	movb	%al, -4(%r15)
	cmpq	%rbp, %r15
	jne	.L3262
	jmp	.L3257
	.p2align 4
	.p2align 3
.L3254:
	movq	40(%rsp), %rax
	movl	32(%rsp), %r8d
	negl	%edx
	addq	%r12, %rax
	testl	%r8d, %r8d
	je	.L3257
	.p2align 4
	.p2align 3
.L3258:
	movb	%dl, (%rax)
	addq	$4, %rax
	cmpq	%rbp, %rax
	jne	.L3258
	jmp	.L3257
	.p2align 4
	.p2align 3
.L3264:
	testl	%ecx, %ecx
	je	.L3273
	cmpl	$16, 0(%rbp)
	jne	.L3274
.L3277:
	movl	36(%rsp), %r8d
	movl	16(%rsp), %ecx
	movq	%r15, %rdi
	movl	%r13d, %edx
	movl	$4, %esi
	call	stbi__convert_format16
	movq	%rax, %r15
	jmp	.L3275
	.p2align 4
	.p2align 3
.L3363:
	leaq	.LC107(%rip), %rax
	xorl	%r15d, %r15d
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L3207
.L3350:
	movq	56(%rsp), %r13
	jmp	.L3236
.L3261:
	movl	32(%rsp), %ecx
	testl	%ecx, %ecx
	je	.L3257
	.p2align 4
	.p2align 3
.L3263:
	movq	%rbx, %rdi
	addq	$4, %r15
	call	stbi__get16be
	movzbl	%ah, %eax
	movb	%al, -4(%r15)
	cmpq	%rbp, %r15
	jne	.L3263
	jmp	.L3257
.L3362:
	movq	200(%rbx), %rax
	movq	%rax, 192(%rbx)
	jmp	.L3222
.L3360:
	movq	200(%rbx), %rax
	movq	%rax, 192(%rbx)
	jmp	.L3218
.L3361:
	movq	200(%rbx), %rax
	movq	%rax, 192(%rbx)
	jmp	.L3220
.L3265:
	movl	32(%rsp), %eax
	testl	%eax, %eax
	je	.L3268
	vmovss	.LC130(%rip), %xmm4
	vmovss	.LC57(%rip), %xmm5
	movq	%r15, %rax
	movl	80(%rsp), %edx
	leaq	8(%r15,%rdx,8), %rdx
	.p2align 4
	.p2align 3
.L3270:
	movzwl	6(%rax), %esi
	leal	-1(%rsi), %edi
	cmpw	$-3, %di
	ja	.L3269
	vcvtsi2ssl	%esi, %xmm2, %xmm0
	vdivss	%xmm4, %xmm0, %xmm0
	movzwl	(%rax), %esi
	vcvtsi2ssl	%esi, %xmm2, %xmm1
	vdivss	%xmm0, %xmm5, %xmm0
	vsubss	%xmm0, %xmm5, %xmm3
	vmulss	%xmm0, %xmm1, %xmm1
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
.L3269:
	addq	$8, %rax
	cmpq	%rax, %rdx
	jne	.L3270
.L3268:
	testl	%ecx, %ecx
	jne	.L3277
	jmp	.L3273
.L3370:
	movl	32(%rsp), %edi
	movq	%r14, %r15
	testl	%edi, %edi
	je	.L3257
	.p2align 4
	.p2align 3
.L3260:
	movq	%rbx, %rdi
	addq	$8, %r15
	call	stbi__get16be
	movw	%ax, -8(%r15)
	cmpq	%r13, %r15
	jne	.L3260
	jmp	.L3257
.L3369:
	leal	1(%rax), %esi
	cmpl	%r14d, %esi
	jle	.L3240
.L3243:
	movq	48(%rsp), %rdi
	xorl	%r15d, %r15d
	call	free@PLT
	leaq	.LC132(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L3207
.L3228:
	leaq	.LC16(%rip), %rax
	xorl	%r15d, %r15d
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L3207
	.cfi_endproc
.LFE737:
	.size	stbi__psd_load, .-stbi__psd_load
	.section	.rodata.str1.1
.LC133:
	.string	"no SOF"
.LC134:
	.string	"bad SOF len"
.LC135:
	.string	"only 8-bit"
.LC136:
	.string	"no header height"
.LC137:
	.string	"0 width"
.LC138:
	.string	"bad component count"
.LC139:
	.string	"bad H"
.LC140:
	.string	"bad V"
.LC141:
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
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbp
	movl	%esi, %ebx
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	movzbl	18472(%rdi), %eax
	cmpb	$-1, %al
	je	.L3372
	movb	$-1, 18472(%rdi)
.L3373:
	movzbl	%al, %esi
.L3516:
	leal	-192(%rsi), %eax
	jmp	.L3512
	.p2align 4
	.p2align 3
.L3372:
	movq	(%rdi), %r12
	movq	192(%r12), %rax
	cmpq	200(%r12), %rax
	jb	.L3518
	movl	48(%r12), %r9d
	testl	%r9d, %r9d
	jne	.L3519
.L3376:
	movl	$255, %esi
	.p2align 4
	.p2align 3
.L3414:
	movq	%rbp, %rdi
	call	stbi__process_marker
	testl	%eax, %eax
	je	.L3371
	movzbl	18472(%rbp), %esi
	cmpb	$-1, %sil
	je	.L3386
.L3517:
	movb	$-1, 18472(%rbp)
	leal	-192(%rsi), %eax
.L3512:
	cmpl	$2, %eax
	ja	.L3414
	movq	0(%rbp), %r12
	xorl	%eax, %eax
	cmpl	$194, %esi
	sete	%al
	movl	%eax, 18480(%rbp)
	movq	192(%r12), %rdx
	movq	200(%r12), %rax
	cmpq	%rax, %rdx
	jb	.L3520
	movl	48(%r12), %ecx
	testl	%ecx, %ecx
	jne	.L3521
.L3417:
	leaq	.LC134(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
.L3371:
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
	.p2align 4
	.p2align 3
.L3386:
	.cfi_restore_state
	movq	0(%rbp), %r12
	movq	192(%r12), %rax
	cmpq	200(%r12), %rax
	jb	.L3522
	movl	48(%r12), %r8d
	movq	16(%r12), %rax
	testl	%r8d, %r8d
	jne	.L3523
	.p2align 4
	.p2align 3
.L3465:
	cmpq	$0, 16(%r12)
	je	.L3402
	movq	40(%r12), %rdi
	call	*32(%r12)
	testl	%eax, %eax
	je	.L3401
	movl	48(%r12), %edi
	testl	%edi, %edi
	je	.L3400
.L3402:
	movq	200(%r12), %rax
	cmpq	%rax, 192(%r12)
	jnb	.L3400
.L3401:
	movzbl	18472(%rbp), %esi
	cmpb	$-1, %sil
	jne	.L3517
	movq	0(%rbp), %r12
	movq	192(%r12), %rax
	cmpq	200(%r12), %rax
	jb	.L3524
	movl	48(%r12), %esi
	movq	16(%r12), %rax
	testl	%esi, %esi
	je	.L3465
	leaq	56(%r12), %r13
	movl	52(%r12), %edx
	movq	40(%r12), %rdi
	movq	%r13, %rsi
	call	*%rax
	movq	192(%r12), %rdx
	leaq	57(%r12), %rcx
	subq	208(%r12), %rdx
	vmovq	%rcx, %xmm0
	addl	%edx, 184(%r12)
	testl	%eax, %eax
	je	.L3513
	cltq
	movzbl	56(%r12), %edx
	addq	%rax, %r13
	vpinsrq	$1, %r13, %xmm0, %xmm0
	vmovdqu	%xmm0, 192(%r12)
	movq	0(%rbp), %r12
	.p2align 4
	.p2align 3
.L3405:
	cmpb	$-1, %dl
	jne	.L3465
	.p2align 4
	.p2align 3
.L3413:
	movq	192(%r12), %rax
	cmpq	200(%r12), %rax
	jb	.L3525
	movl	48(%r12), %esi
	testl	%esi, %esi
	je	.L3414
	leaq	56(%r12), %r13
	movl	52(%r12), %edx
	movq	40(%r12), %rdi
	movq	%r13, %rsi
	call	*16(%r12)
	leaq	57(%r12), %rdx
	movslq	%eax, %rsi
	movq	192(%r12), %rax
	subq	208(%r12), %rax
	addl	%eax, 184(%r12)
	testl	%esi, %esi
	jne	.L3410
	vmovq	%rdx, %xmm3
	vpunpcklqdq	%xmm3, %xmm3, %xmm0
	movl	$0, 48(%r12)
	movb	$0, 56(%r12)
	vmovdqu	%xmm0, 192(%r12)
	jmp	.L3516
	.p2align 4
	.p2align 3
.L3525:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%r12)
	movzbl	(%rax), %eax
.L3409:
	cmpb	$-1, %al
	jne	.L3373
	movq	0(%rbp), %r12
	jmp	.L3413
	.p2align 4
	.p2align 3
.L3400:
	leaq	.LC133(%rip), %rax
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
	.p2align 4
	.p2align 3
.L3410:
	.cfi_restore_state
	addq	%rsi, %r13
	vmovq	%rdx, %xmm4
	movzbl	56(%r12), %eax
	vpinsrq	$1, %r13, %xmm4, %xmm0
	vmovdqu	%xmm0, 192(%r12)
	jmp	.L3409
	.p2align 4
	.p2align 3
.L3524:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%r12)
	movzbl	(%rax), %edx
	jmp	.L3405
	.p2align 4
	.p2align 3
.L3522:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%r12)
	movzbl	(%rax), %edx
.L3389:
	cmpb	$-1, %dl
	jne	.L3465
	.p2align 4
	.p2align 3
.L3398:
	movq	192(%r12), %rax
	cmpq	200(%r12), %rax
	jb	.L3526
	movl	48(%r12), %esi
	testl	%esi, %esi
	je	.L3414
	leaq	56(%r12), %r13
	movl	52(%r12), %edx
	movq	40(%r12), %rdi
	movq	%r13, %rsi
	call	*16(%r12)
	leaq	57(%r12), %rdx
	movslq	%eax, %rsi
	movq	192(%r12), %rax
	subq	208(%r12), %rax
	addl	%eax, 184(%r12)
	testl	%esi, %esi
	jne	.L3395
	vmovq	%rdx, %xmm5
	vpunpcklqdq	%xmm5, %xmm5, %xmm0
	movl	$0, 48(%r12)
	movb	$0, 56(%r12)
	vmovdqu	%xmm0, 192(%r12)
	jmp	.L3516
	.p2align 4
	.p2align 3
.L3526:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%r12)
	movzbl	(%rax), %eax
.L3393:
	cmpb	$-1, %al
	jne	.L3373
	movq	0(%rbp), %r12
	jmp	.L3398
	.p2align 4
	.p2align 3
.L3395:
	addq	%rsi, %r13
	vmovq	%rdx, %xmm6
	movzbl	56(%r12), %eax
	vpinsrq	$1, %r13, %xmm6, %xmm0
	vmovdqu	%xmm0, 192(%r12)
	jmp	.L3393
	.p2align 4
	.p2align 3
.L3513:
	vpunpcklqdq	%xmm0, %xmm0, %xmm0
	movl	$0, 48(%r12)
	movb	$0, 56(%r12)
	vmovdqu	%xmm0, 192(%r12)
	movq	0(%rbp), %r12
	jmp	.L3465
	.p2align 4
	.p2align 3
.L3518:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%r12)
	movzbl	(%rax), %edx
.L3375:
	cmpb	$-1, %dl
	jne	.L3376
	.p2align 4
	.p2align 3
.L3383:
	movq	0(%rbp), %r12
	movq	192(%r12), %rax
	cmpq	200(%r12), %rax
	jb	.L3527
	movl	48(%r12), %esi
	testl	%esi, %esi
	je	.L3414
	leaq	56(%r12), %r13
	movl	52(%r12), %edx
	movq	40(%r12), %rdi
	movq	%r13, %rsi
	call	*16(%r12)
	leaq	57(%r12), %rdx
	movslq	%eax, %rsi
	movq	192(%r12), %rax
	subq	208(%r12), %rax
	addl	%eax, 184(%r12)
	testl	%esi, %esi
	jne	.L3381
	vmovq	%rdx, %xmm7
	vpunpcklqdq	%xmm7, %xmm7, %xmm0
	movl	$0, 48(%r12)
	movb	$0, 56(%r12)
	vmovdqu	%xmm0, 192(%r12)
	jmp	.L3414
	.p2align 4
	.p2align 3
.L3527:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%r12)
	movzbl	(%rax), %eax
.L3379:
	cmpb	$-1, %al
	je	.L3383
	jmp	.L3373
	.p2align 4
	.p2align 3
.L3381:
	addq	%rsi, %r13
	vmovq	%rdx, %xmm1
	movzbl	56(%r12), %eax
	vpinsrq	$1, %r13, %xmm1, %xmm0
	vmovdqu	%xmm0, 192(%r12)
	jmp	.L3379
.L3519:
	leaq	56(%r12), %r13
	movl	52(%r12), %edx
	movq	40(%r12), %rdi
	movq	%r13, %rsi
	call	*16(%r12)
	movq	192(%r12), %rdx
	leaq	57(%r12), %rcx
	subq	208(%r12), %rdx
	addl	%edx, 184(%r12)
	testl	%eax, %eax
	jne	.L3377
	vmovq	%rcx, %xmm2
	vpunpcklqdq	%xmm2, %xmm2, %xmm0
	movl	$0, 48(%r12)
	movb	$0, 56(%r12)
	vmovdqu	%xmm0, 192(%r12)
	jmp	.L3376
.L3523:
	leaq	56(%r12), %r13
	movl	52(%r12), %edx
	movq	40(%r12), %rdi
	movq	%r13, %rsi
	call	*%rax
	movq	192(%r12), %rdx
	leaq	57(%r12), %rcx
	subq	208(%r12), %rdx
	vmovq	%rcx, %xmm0
	addl	%edx, 184(%r12)
	testl	%eax, %eax
	je	.L3513
	cltq
	movzbl	56(%r12), %edx
	addq	%rax, %r13
	vpinsrq	$1, %r13, %xmm0, %xmm0
	vmovdqu	%xmm0, 192(%r12)
	movq	0(%rbp), %r12
	jmp	.L3389
.L3377:
	cltq
	vmovq	%rcx, %xmm2
	movzbl	56(%r12), %edx
	addq	%rax, %r13
	vpinsrq	$1, %r13, %xmm2, %xmm0
	vmovdqu	%xmm0, 192(%r12)
	jmp	.L3375
.L3520:
	leaq	1(%rdx), %rcx
	movq	%rcx, 192(%r12)
	movzbl	(%rdx), %r14d
	sall	$8, %r14d
.L3416:
	cmpq	%rax, %rcx
	jnb	.L3420
	leaq	1(%rcx), %rdx
	movq	%rdx, 192(%r12)
	movzbl	(%rcx), %ecx
	addl	%ecx, %r14d
.L3421:
	cmpl	$10, %r14d
	jle	.L3417
	cmpq	%rax, %rdx
	jnb	.L3426
	leaq	1(%rdx), %rax
	movq	%rax, 192(%r12)
	movzbl	(%rdx), %edx
.L3427:
	cmpb	$8, %dl
	jne	.L3430
	movq	%r12, %rdi
	call	stbi__get16be
	movl	%eax, 4(%r12)
	testl	%eax, %eax
	jne	.L3431
	leaq	.LC136(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L3371
.L3420:
	movl	48(%r12), %edx
	testl	%edx, %edx
	jne	.L3528
	cmpl	$10, %r14d
	jle	.L3417
.L3430:
	leaq	.LC135(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L3371
.L3426:
	movl	48(%r12), %eax
	testl	%eax, %eax
	je	.L3430
	leaq	56(%r12), %r13
	movl	52(%r12), %edx
	movq	40(%r12), %rdi
	movq	%r13, %rsi
	call	*16(%r12)
	movq	192(%r12), %rdx
	leaq	57(%r12), %rcx
	subq	208(%r12), %rdx
	vmovq	%rcx, %xmm0
	addl	%edx, 184(%r12)
	testl	%eax, %eax
	jne	.L3429
	vpunpcklqdq	%xmm0, %xmm0, %xmm0
	movl	$0, 48(%r12)
	movb	$0, 56(%r12)
	vmovdqu	%xmm0, 192(%r12)
	jmp	.L3430
.L3521:
	leaq	56(%r12), %r13
	movl	52(%r12), %edx
	movq	40(%r12), %rdi
	movq	%r13, %rsi
	call	*16(%r12)
	leaq	57(%r12), %rcx
	movslq	%eax, %r14
	movq	192(%r12), %rax
	subq	208(%r12), %rax
	addl	%eax, 184(%r12)
	testl	%r14d, %r14d
	jne	.L3418
	movl	$0, 48(%r12)
	movq	%rcx, %rax
	movb	$0, 56(%r12)
.L3419:
	vmovq	%rcx, %xmm2
	vpinsrq	$1, %rax, %xmm2, %xmm0
	vmovdqu	%xmm0, 192(%r12)
	jmp	.L3416
.L3528:
	leaq	56(%r12), %r13
	movl	52(%r12), %edx
	movq	40(%r12), %rdi
	movq	%r13, %rsi
	call	*16(%r12)
	movq	192(%r12), %rdx
	subq	208(%r12), %rdx
	addl	%edx, 184(%r12)
	leaq	57(%r12), %rdx
	testl	%eax, %eax
	jne	.L3423
	movl	$0, 48(%r12)
	movq	%rdx, %rax
	movb	$0, 56(%r12)
.L3424:
	vmovq	%rdx, %xmm2
	vpinsrq	$1, %rax, %xmm2, %xmm0
	vmovdqu	%xmm0, 192(%r12)
	jmp	.L3421
.L3431:
	movq	%r12, %rdi
	call	stbi__get16be
	movl	%eax, (%r12)
	testl	%eax, %eax
	je	.L3529
	cmpl	$16777216, 4(%r12)
	ja	.L3434
	cmpl	$16777216, %eax
	ja	.L3434
	movq	%r12, %rdi
	call	stbi__get8
	movzbl	%al, %r13d
	subl	$3, %eax
	cmpb	$1, %al
	jbe	.L3435
	cmpl	$1, %r13d
	jne	.L3530
.L3435:
	leal	0(%r13,%r13,2), %eax
	movl	%r13d, 8(%r12)
	addl	$8, %eax
	testl	%r13d, %r13d
	je	.L3436
	movq	$0, 18128(%rbp)
	movq	$0, 18152(%rbp)
	cmpl	$1, %r13d
	je	.L3437
	movq	$0, 18224(%rbp)
	movq	$0, 18248(%rbp)
	cmpl	$2, %r13d
	je	.L3437
	movq	$0, 18320(%rbp)
	movq	$0, 18344(%rbp)
	cmpl	$3, %r13d
	je	.L3437
	movq	$0, 18416(%rbp)
	movq	$0, 18440(%rbp)
.L3437:
	cmpl	%eax, %r14d
	jne	.L3417
	movl	$0, 18512(%rbp)
	leaq	18080(%rbp), %r15
	xorl	%r14d, %r14d
	jmp	.L3443
.L3438:
	movq	%r12, %rdi
	call	stbi__get8
	movzbl	%al, %edx
	sarl	$4, %edx
	movl	%edx, 4(%r15)
	je	.L3448
	cmpl	$4, %edx
	jg	.L3448
	movl	%eax, %edx
	andl	$15, %eax
	andl	$15, %edx
	movl	%eax, 8(%r15)
	leal	-1(%rdx), %eax
	cmpb	$3, %al
	ja	.L3449
	movq	%r12, %rdi
	call	stbi__get8
	movzbl	%al, %eax
	movl	%eax, 12(%r15)
	cmpl	$3, %eax
	jg	.L3531
	movl	8(%r12), %r13d
	incq	%r14
	addq	$96, %r15
	cmpl	%r14d, %r13d
	jle	.L3463
.L3443:
	movq	%r12, %rdi
	call	stbi__get8
	movzbl	%al, %eax
	movl	%eax, (%r15)
	cmpl	$3, 8(%r12)
	jne	.L3438
	leaq	rgb.36(%rip), %rcx
	movzbl	(%rcx,%r14), %edx
	cmpl	%edx, %eax
	jne	.L3438
	incl	18512(%rbp)
	jmp	.L3438
.L3418:
	leaq	0(%r13,%r14), %rax
	movzbl	56(%r12), %r14d
	sall	$8, %r14d
	jmp	.L3419
.L3423:
	movzbl	56(%r12), %ecx
	cltq
	addq	%r13, %rax
	addl	%ecx, %r14d
	jmp	.L3424
.L3434:
	leaq	.LC93(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L3371
.L3529:
	leaq	.LC137(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L3371
.L3429:
	cltq
	movzbl	56(%r12), %edx
	addq	%rax, %r13
	vpinsrq	$1, %r13, %xmm0, %xmm0
	vmovdqu	%xmm0, 192(%r12)
	jmp	.L3427
.L3436:
	cmpl	%eax, %r14d
	jne	.L3417
	movl	$0, 18512(%rbp)
.L3463:
	testl	%ebx, %ebx
	jne	.L3461
	movl	4(%r12), %r8d
	movl	(%r12), %r9d
	movl	%r8d, %eax
	orl	%r9d, %eax
	js	.L3434
	testl	%r8d, %r8d
	je	.L3445
	movl	$2147483647, %eax
	cltd
	idivl	%r8d
	cmpl	%eax, %r9d
	jg	.L3434
.L3445:
	testl	%r13d, %r13d
	js	.L3434
	je	.L3466
	movl	$2147483647, %eax
	movl	%r8d, %ecx
	cltd
	imull	%r9d, %ecx
	idivl	%r13d
	cmpl	%eax, %ecx
	jg	.L3434
	leaq	18084(%rbp), %r12
	xorl	%edx, %edx
	movl	$1, %r15d
	movl	$1, %r14d
	movq	%r12, %rax
.L3447:
	movl	(%rax), %ecx
	cmpl	%ecx, %r14d
	cmovl	%ecx, %r14d
	movl	4(%rax), %ecx
	cmpl	%ecx, %r15d
	cmovl	%ecx, %r15d
	incl	%edx
	addq	$96, %rax
	cmpl	%r13d, %edx
	jne	.L3447
.L3446:
	movq	%r12, %rcx
	xorl	%esi, %esi
	jmp	.L3450
.L3451:
	movl	%r14d, %eax
	movq	%rcx, %rdi
	cltd
	idivl	(%rcx)
	testl	%edx, %edx
	jne	.L3448
	movl	%r15d, %eax
	addq	$96, %rcx
	cltd
	idivl	4(%rdi)
	testl	%edx, %edx
	jne	.L3449
	incl	%esi
.L3450:
	cmpl	%r13d, %esi
	jne	.L3451
	leal	0(,%r14,8), %esi
	xorl	%edx, %edx
	leal	0(,%r15,8), %ecx
	movl	%r8d, 24(%rsp)
	leal	-1(%r9,%rsi), %eax
	vmovd	%esi, %xmm2
	vpinsrd	$1, %ecx, %xmm2, %xmm0
	movl	%r9d, 28(%rsp)
	divl	%esi
	xorl	%edx, %edx
	vmovq	%xmm0, 18072(%rbp)
	movl	%eax, 12(%rsp)
	leal	-1(%r8,%rcx), %eax
	vmovd	12(%rsp), %xmm2
	divl	%ecx
	vpinsrd	$1, %eax, %xmm2, %xmm1
	movl	%eax, 16(%rsp)
	vmovd	%r14d, %xmm2
	leal	-1(%r14), %eax
	vpinsrd	$1, %r15d, %xmm2, %xmm0
	movl	%eax, 20(%rsp)
	movl	%ebx, %eax
	movq	%r12, %rbx
	vpunpcklqdq	%xmm1, %xmm0, %xmm0
	movq	%rbp, %r12
	vmovdqu	%xmm0, 18056(%rbp)
	movl	%eax, %ebp
	jmp	.L3452
.L3453:
	testl	%edi, %edi
	je	.L3455
	movl	$2147483647, %eax
	cltd
	idivl	%esi
	cmpl	%eax, %r10d
	jg	.L3514
.L3455:
	movl	%r10d, %edi
	movl	%r10d, 36(%rsp)
	movl	%esi, 32(%rsp)
	vmovq	%xmm2, 40(%rsp)
	imull	%esi, %edi
	addl	$15, %edi
	movslq	%edi, %rdi
	call	malloc@PLT
	movl	32(%rsp), %esi
	vmovq	40(%rsp), %xmm2
	testq	%rax, %rax
	movl	36(%rsp), %r10d
	movq	%rax, 52(%rbx)
	je	.L3515
	addq	$15, %rax
	andq	$-16, %rax
	cmpl	$0, 18480(%r12)
	movq	%rax, 44(%rbx)
	jne	.L3532
.L3458:
	incl	%ebp
	addq	$96, %rbx
.L3452:
	cmpl	%r13d, %ebp
	je	.L3461
	movl	(%rbx), %eax
	movl	12(%rsp), %edx
	movq	$0, 76(%rbx)
	movl	4(%rbx), %ecx
	movl	16(%rsp), %edi
	imull	%eax, %edx
	imull	28(%rsp), %eax
	imull	%ecx, %edi
	imull	24(%rsp), %ecx
	addl	20(%rsp), %eax
	leal	0(,%rdx,8), %r10d
	vmovd	%edx, %xmm2
	xorl	%edx, %edx
	vmovd	%r10d, %xmm7
	leal	0(,%rdi,8), %esi
	vpinsrd	$1, %edi, %xmm2, %xmm2
	vpinsrd	$1, %esi, %xmm7, %xmm0
	divl	%r14d
	xorl	%edx, %edx
	movl	%eax, %r11d
	leal	-1(%r15,%rcx), %eax
	divl	%r15d
	vmovd	%r11d, %xmm7
	vpinsrd	$1, %eax, %xmm7, %xmm1
	movl	%r10d, %eax
	vpunpcklqdq	%xmm0, %xmm1, %xmm0
	orl	%esi, %eax
	vmovdqu	%xmm0, 24(%rbx)
	vpxor	%xmm0, %xmm0, %xmm0
	vmovdqu	%xmm0, 60(%rbx)
	jns	.L3453
.L3514:
	movslq	%ebp, %rax
	movq	%r12, %rbp
	movq	%rax, %rbx
	imulq	$96, %rax, %rax
	movq	$0, 18136(%r12,%rax)
.L3454:
	leaq	.LC16(%rip), %rax
	leal	1(%rbx), %esi
	movq	%rbp, %rdi
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	call	stbi__free_jpeg_components.constprop.0
	testl	%eax, %eax
	setne	%al
	movzbl	%al, %eax
	jmp	.L3371
.L3461:
	movl	$1, %eax
	jmp	.L3371
.L3466:
	movl	$1, %r15d
	movl	$1, %r14d
	leaq	18084(%rbp), %r12
	jmp	.L3446
.L3532:
	movl	$15, %ecx
	movl	$2, %edx
	movl	%r10d, %edi
	vmovq	%xmm2, 84(%rbx)
	call	stbi__malloc_mad3
	movq	%rax, 60(%rbx)
	testq	%rax, %rax
	je	.L3515
	addq	$15, %rax
	andq	$-16, %rax
	movq	%rax, 76(%rbx)
	jmp	.L3458
.L3515:
	movl	%ebp, %ebx
	movq	%r12, %rbp
	jmp	.L3454
.L3530:
	leaq	.LC138(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L3371
.L3531:
	leaq	.LC141(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L3371
.L3449:
	leaq	.LC140(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L3371
.L3448:
	leaq	.LC139(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L3371
	.cfi_endproc
.LFE854:
	.size	stbi__decode_jpeg_header.part.0, .-stbi__decode_jpeg_header.part.0
	.section	.rodata.str1.1
.LC143:
	.string	"no SOI"
.LC144:
	.string	"bad SOS component count"
.LC145:
	.string	"bad SOS len"
.LC146:
	.string	"bad DC huff"
.LC147:
	.string	"bad AC huff"
.LC148:
	.string	"bad SOS"
.LC149:
	.string	"bad DNL len"
.LC150:
	.string	"bad DNL height"
	.text
	.p2align 4
	.type	stbi__decode_jpeg_image, @function
stbi__decode_jpeg_image:
.LFB663:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	vpxor	%xmm0, %xmm0, %xmm0
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdi, %r13
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$232, %rsp
	.cfi_def_cfa_offset 288
	movq	%fs:40, %rax
	movq	%rax, 216(%rsp)
	xorl	%eax, %eax
	movq	.LC142(%rip), %rax
	vmovdqu	%xmm0, 18136(%rdi)
	vmovdqu	%xmm0, 18232(%rdi)
	vmovdqu	%xmm0, 18328(%rdi)
	vmovdqu	%xmm0, 18424(%rdi)
	movl	$0, 18536(%rdi)
	movb	$-1, 18472(%rdi)
	movq	%rax, 18504(%rdi)
	movq	(%rdi), %rdi
	call	stbi__get8
	cmpb	$-1, %al
	jne	.L3538
.L3534:
	movq	0(%r13), %rbp
	movq	192(%rbp), %rax
	cmpq	200(%rbp), %rax
	jb	.L3853
	movl	48(%rbp), %r10d
	testl	%r10d, %r10d
	jne	.L3854
.L3538:
	leaq	.LC143(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
.L3533:
	movq	216(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L3855
	addq	$232, %rsp
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
.L3853:
	.cfi_restore_state
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rbp)
	movzbl	(%rax), %edx
.L3537:
	cmpb	$-1, %dl
	je	.L3534
	cmpb	$-40, %dl
	jne	.L3538
	xorl	%esi, %esi
	movq	%r13, %rdi
	call	stbi__decode_jpeg_header.part.0
	testl	%eax, %eax
	je	.L3851
	movzbl	18472(%r13), %eax
	cmpb	$-1, %al
	je	.L3541
	movb	$-1, 18472(%r13)
.L3542:
	movzbl	%al, %esi
	cmpb	$-39, %al
	jne	.L3547
	movl	18480(%r13), %eax
	testl	%eax, %eax
	jne	.L3708
.L3709:
	movl	$1, %eax
	jmp	.L3533
.L3572:
	orl	18484(%r14), %edx
	movl	%edx, %r12d
	jne	.L3573
	testb	%cl, %cl
	jne	.L3573
	movl	18536(%r14), %eax
	movl	$63, 18488(%r14)
	movl	$0, 18476(%r14)
	movl	$0, 18392(%r14)
	movl	$0, 18296(%r14)
	movl	$0, 18200(%r14)
	movl	$0, 18104(%r14)
	movq	$0, 18464(%r14)
	movb	$-1, 18472(%r14)
	testl	%eax, %eax
	je	.L3856
	movl	%eax, 18540(%r14)
	movl	$0, 18500(%r14)
.L3719:
	cmpl	$1, 18516(%r14)
	je	.L3578
	movl	18068(%r14), %edx
	testl	%edx, %edx
	jle	.L3593
	movl	18064(%r14), %eax
	leaq	6728(%r14), %rbx
	movl	$0, 8(%rsp)
	movq	%r14, %r15
	movq	%rbx, 32(%rsp)
.L3580:
	movl	$0, (%rsp)
	movq	%r15, %r14
	testl	%eax, %eax
	jle	.L3611
.L3610:
	movl	18516(%r14), %eax
	movq	$0, 40(%rsp)
	testl	%eax, %eax
	jle	.L3608
.L3602:
	movq	40(%rsp), %rbx
	movslq	18520(%r14,%rbx,4), %rdx
	leaq	(%rdx,%rdx,2), %r10
	movl	%edx, 56(%rsp)
	salq	$5, %r10
	leaq	(%r14,%r10), %r15
	movl	18088(%r15), %ebx
	testl	%ebx, %ebx
	jle	.L3595
	movl	18084(%r15), %ebp
	movl	$0, 16(%rsp)
.L3596:
	testl	%ebp, %ebp
	jle	.L3601
	leaq	8(%r14), %rax
	xorl	%r12d, %r12d
	leaq	80(%rsp), %r13
	movq	%rax, 24(%rsp)
	movq	%r15, %rax
	movq	%r14, %r15
	movq	%rax, %r14
	jmp	.L3599
	.p2align 4
	.p2align 3
.L3857:
	movl	18116(%r14), %esi
	movslq	%ebp, %rbp
	movq	%r13, %rdx
	incl	%r12d
	imull	%esi, %ebx
	leal	0(,%rbx,8), %edi
	movslq	%edi, %rdi
	addq	%rbp, %rdi
	addq	18128(%r14), %rdi
	call	*18544(%r15)
	movl	18084(%r14), %ebp
	cmpl	%r12d, %ebp
	jle	.L3598
	movl	18088(%r14), %ebx
.L3599:
	movslq	18100(%r14), %rax
	movq	32(%rsp), %rdi
	subq	$8, %rsp
	.cfi_def_cfa_offset 296
	movslq	18096(%r14), %rdx
	imull	8(%rsp), %ebp
	imull	16(%rsp), %ebx
	movq	%rax, %rsi
	imulq	$1680, %rax, %rax
	imulq	$1680, %rdx, %rdx
	addq	32(%rsp), %rdx
	addl	24(%rsp), %ebx
	salq	$10, %rsi
	leaq	13960(%r15,%rsi), %r8
	movq	%r13, %rsi
	leaq	(%rdi,%rax), %rcx
	movslq	18092(%r14), %rax
	movq	%r15, %rdi
	addl	%r12d, %ebp
	sall	$3, %ebp
	salq	$7, %rax
	leaq	13448(%r15,%rax), %rax
	pushq	%rax
	.cfi_def_cfa_offset 304
	movl	72(%rsp), %r9d
	call	stbi__jpeg_decode_block
	popq	%r11
	.cfi_def_cfa_offset 296
	popq	%rdx
	.cfi_def_cfa_offset 288
	testl	%eax, %eax
	jne	.L3857
.L3851:
	xorl	%eax, %eax
	jmp	.L3533
.L3541:
	movq	0(%r13), %rdi
	call	stbi__get8
	cmpb	$-1, %al
	jne	.L3724
.L3548:
	movq	0(%r13), %rbp
	movq	192(%rbp), %rax
	cmpq	200(%rbp), %rax
	jb	.L3858
	movl	48(%rbp), %esi
	testl	%esi, %esi
	je	.L3547
	leaq	56(%rbp), %rbx
	movl	52(%rbp), %edx
	movq	40(%rbp), %rdi
	movq	%rbx, %rsi
	call	*16(%rbp)
	movslq	%eax, %rsi
	movq	192(%rbp), %rax
	subq	208(%rbp), %rax
	addl	%eax, 184(%rbp)
	leaq	57(%rbp), %rax
	vmovq	%rax, %xmm0
	testl	%esi, %esi
	jne	.L3546
	vpunpcklqdq	%xmm0, %xmm0, %xmm0
	movl	$0, 48(%rbp)
	movb	$0, 56(%rbp)
	vmovdqu	%xmm0, 192(%rbp)
.L3547:
	movq	%r13, %r14
.L3707:
	cmpl	$218, %esi
	jne	.L3550
	movq	(%r14), %rdi
	call	stbi__get16be
	movq	(%r14), %rbx
	movl	%eax, %r12d
	movq	192(%rbx), %rax
	cmpq	200(%rbx), %rax
	jb	.L3859
	movl	48(%rbx), %r9d
	testl	%r9d, %r9d
	jne	.L3860
	movl	$0, 18516(%r14)
.L3555:
	leaq	.LC144(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L3533
.L3550:
	cmpl	$220, %esi
	jne	.L3705
	movq	(%r14), %rbp
	movq	192(%rbp), %rdx
	movq	200(%rbp), %rax
	cmpq	%rax, %rdx
	jb	.L3861
	movl	48(%rbp), %r13d
	testl	%r13d, %r13d
	jne	.L3862
.L3680:
	movq	192(%rbp), %rdx
	movq	200(%rbp), %rax
	cmpq	%rax, %rdx
	jb	.L3863
	movl	48(%rbp), %r12d
	testl	%r12d, %r12d
	jne	.L3864
.L3688:
	cmpl	$4, %r13d
	jne	.L3865
	movq	(%r14), %rax
	cmpl	%r12d, 4(%rax)
	jne	.L3695
.L3850:
	movzbl	18472(%r14), %eax
.L3674:
	cmpb	$-1, %al
	je	.L3696
.L3669:
	movb	$-1, 18472(%r14)
.L3697:
	movzbl	%al, %esi
	cmpb	$-39, %al
	jne	.L3707
	movq	%r14, %r13
	movl	18480(%r13), %eax
	testl	%eax, %eax
	je	.L3709
	jmp	.L3708
	.p2align 4
	.p2align 3
.L3696:
	movq	(%r14), %rbx
	movq	192(%rbx), %rax
	cmpq	200(%rbx), %rax
	jb	.L3866
	movl	48(%rbx), %edx
	testl	%edx, %edx
	jne	.L3867
.L3700:
	movl	$255, %esi
	.p2align 4
	.p2align 3
.L3705:
	movq	%r14, %rdi
	call	stbi__process_marker
	testl	%eax, %eax
	jne	.L3850
.L3852:
	xorl	%eax, %eax
	jmp	.L3533
	.p2align 4
	.p2align 3
.L3866:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rbx)
	movzbl	(%rax), %edx
.L3699:
	cmpb	$-1, %dl
	jne	.L3700
	.p2align 4
	.p2align 3
.L3706:
	movq	(%r14), %rbx
	movq	192(%rbx), %rax
	cmpq	200(%rbx), %rax
	jb	.L3868
	movl	48(%rbx), %esi
	testl	%esi, %esi
	je	.L3705
	leaq	56(%rbx), %rbp
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%rbp, %rsi
	call	*16(%rbx)
	movslq	%eax, %rsi
	movq	192(%rbx), %rax
	subq	208(%rbx), %rax
	addl	%eax, 184(%rbx)
	leaq	57(%rbx), %rax
	vmovq	%rax, %xmm3
	testl	%esi, %esi
	jne	.L3704
	vpunpcklqdq	%xmm3, %xmm3, %xmm0
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	movq	%r14, %rdi
	vmovdqu	%xmm0, 192(%rbx)
	call	stbi__process_marker
	testl	%eax, %eax
	jne	.L3850
	jmp	.L3852
	.p2align 4
	.p2align 3
.L3868:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rbx)
	movzbl	(%rax), %eax
.L3703:
	cmpb	$-1, %al
	je	.L3706
	jmp	.L3697
	.p2align 4
	.p2align 3
.L3704:
	addq	%rsi, %rbp
	movzbl	56(%rbx), %eax
	vpinsrq	$1, %rbp, %xmm3, %xmm0
	vmovdqu	%xmm0, 192(%rbx)
	jmp	.L3703
.L3863:
	leaq	1(%rdx), %rcx
	movq	%rcx, 192(%rbp)
	movzbl	(%rdx), %r12d
	sall	$8, %r12d
	cmpq	%rax, %rcx
	jnb	.L3691
.L3876:
	leaq	1(%rcx), %rax
	movq	%rax, 192(%rbp)
	movzbl	(%rcx), %eax
	addl	%eax, %r12d
	jmp	.L3688
.L3861:
	leaq	1(%rdx), %rcx
	movq	%rcx, 192(%rbp)
	movzbl	(%rdx), %r13d
	sall	$8, %r13d
	cmpq	%rax, %rcx
	jnb	.L3683
.L3879:
	leaq	1(%rcx), %rax
	movq	%rax, 192(%rbp)
	movzbl	(%rcx), %eax
	movq	(%r14), %rbp
	addl	%eax, %r13d
	jmp	.L3680
.L3859:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rbx)
	movzbl	(%rax), %eax
	leal	-1(%rax), %ecx
.L3552:
	movl	%eax, 18516(%r14)
	cmpl	$3, %ecx
	ja	.L3555
	movq	(%r14), %rbp
	cmpl	%eax, 8(%rbp)
	jl	.L3555
	leal	6(%rax,%rax), %edx
	cmpl	%edx, %r12d
	jne	.L3557
	xorl	%ebx, %ebx
	testl	%eax, %eax
	jg	.L3558
	jmp	.L3559
	.p2align 4
	.p2align 3
.L3560:
	movl	48(%rbp), %r12d
	xorl	%eax, %eax
	xorl	%esi, %esi
	testl	%r12d, %r12d
	jne	.L3869
.L3562:
	movl	8(%rbp), %edx
	testl	%edx, %edx
	jle	.L3728
.L3873:
	cmpl	18080(%r14), %r12d
	je	.L3729
	cmpl	$1, %edx
	je	.L3730
	cmpl	18176(%r14), %r12d
	je	.L3731
	cmpl	$2, %edx
	je	.L3732
	cmpl	18272(%r14), %r12d
	je	.L3733
	cmpl	$3, %edx
	je	.L3734
	movl	$4, %ecx
	cmpl	%r12d, 18368(%r14)
	je	.L3870
.L3568:
	cmpl	%edx, %ecx
	je	.L3851
.L3569:
	sarl	$4, %eax
	movl	%eax, %edx
	movslq	%ecx, %rax
	leaq	(%rax,%rax,2), %rax
	salq	$5, %rax
	addq	%r14, %rax
	movl	%edx, 18096(%rax)
	cmpl	$3, %edx
	jg	.L3871
	movl	%esi, %edx
	andl	$15, %edx
	andl	$12, %esi
	movl	%edx, 18100(%rax)
	jne	.L3872
	movl	%ecx, 18520(%r14,%rbx,4)
	incq	%rbx
	cmpl	%ebx, 18516(%r14)
	jle	.L3559
.L3558:
	movq	192(%rbp), %rdx
	movq	200(%rbp), %rax
	cmpq	%rax, %rdx
	jnb	.L3560
	leaq	1(%rdx), %rcx
	movq	%rcx, 192(%rbp)
	movzbl	(%rdx), %r12d
	cmpq	%rax, %rcx
	jnb	.L3565
.L3874:
	leaq	1(%rcx), %rax
	movl	8(%rbp), %edx
	movq	%rax, 192(%rbp)
	movzbl	(%rcx), %eax
	movl	%eax, %esi
	testl	%edx, %edx
	jg	.L3873
.L3728:
	xorl	%ecx, %ecx
	jmp	.L3568
.L3869:
	leaq	56(%rbp), %r13
	movl	52(%rbp), %edx
	movq	40(%rbp), %rdi
	movq	%r13, %rsi
	call	*16(%rbp)
	movslq	%eax, %r12
	movq	192(%rbp), %rax
	subq	208(%rbp), %rax
	addl	%eax, 184(%rbp)
	leaq	57(%rbp), %rax
	testl	%r12d, %r12d
	jne	.L3563
	movl	$0, 48(%rbp)
	movq	%rax, %r13
	movb	$0, 56(%rbp)
.L3564:
	vmovq	%rax, %xmm2
	vpinsrq	$1, %r13, %xmm2, %xmm0
	vmovdqu	%xmm0, 192(%rbp)
	movq	(%r14), %rbp
	movq	192(%rbp), %rcx
	movq	200(%rbp), %rax
	cmpq	%rax, %rcx
	jb	.L3874
.L3565:
	movl	48(%rbp), %eax
	testl	%eax, %eax
	je	.L3727
	leaq	56(%rbp), %r13
	movl	52(%rbp), %edx
	movq	40(%rbp), %rdi
	movq	%r13, %rsi
	call	*16(%rbp)
	movq	192(%rbp), %rdx
	subq	208(%rbp), %rdx
	addl	%edx, 184(%rbp)
	leaq	57(%rbp), %rdx
	testl	%eax, %eax
	jne	.L3566
	movl	$0, 48(%rbp)
	movq	%rdx, %r13
	xorl	%esi, %esi
	movb	$0, 56(%rbp)
.L3567:
	vmovq	%rdx, %xmm3
	vpinsrq	$1, %r13, %xmm3, %xmm0
	vmovdqu	%xmm0, 192(%rbp)
	movq	(%r14), %rbp
	jmp	.L3562
.L3557:
	leaq	.LC145(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L3533
.L3867:
	leaq	56(%rbx), %rbp
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%rbp, %rsi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	leaq	57(%rbx), %rsi
	subq	208(%rbx), %rdx
	vmovq	%rsi, %xmm0
	addl	%edx, 184(%rbx)
	testl	%eax, %eax
	jne	.L3701
	vpunpcklqdq	%xmm0, %xmm0, %xmm0
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	vmovdqu	%xmm0, 192(%rbx)
	jmp	.L3700
.L3864:
	leaq	56(%rbp), %rbx
	movl	52(%rbp), %edx
	movq	40(%rbp), %rdi
	movq	%rbx, %rsi
	call	*16(%rbp)
	leaq	57(%rbp), %rcx
	movslq	%eax, %r12
	movq	192(%rbp), %rax
	subq	208(%rbp), %rax
	addl	%eax, 184(%rbp)
	testl	%r12d, %r12d
	je	.L3875
	leaq	(%rbx,%r12), %rax
	movzbl	56(%rbp), %r12d
	sall	$8, %r12d
.L3690:
	vmovq	%rcx, %xmm7
	vpinsrq	$1, %rax, %xmm7, %xmm0
	vmovdqu	%xmm0, 192(%rbp)
	cmpq	%rax, %rcx
	jb	.L3876
.L3691:
	movl	48(%rbp), %ecx
	testl	%ecx, %ecx
	je	.L3688
	leaq	56(%rbp), %rbx
	movl	52(%rbp), %edx
	movq	40(%rbp), %rdi
	movq	%rbx, %rsi
	call	*16(%rbp)
	movq	192(%rbp), %rdx
	subq	208(%rbp), %rdx
	addl	%edx, 184(%rbp)
	leaq	57(%rbp), %rdx
	testl	%eax, %eax
	je	.L3877
	cltq
	addq	%rax, %rbx
	movzbl	56(%rbp), %eax
	addl	%eax, %r12d
.L3693:
	vmovq	%rdx, %xmm2
	vpinsrq	$1, %rbx, %xmm2, %xmm0
	vmovdqu	%xmm0, 192(%rbp)
	jmp	.L3688
.L3862:
	leaq	56(%rbp), %rbx
	movl	52(%rbp), %edx
	movq	40(%rbp), %rdi
	movq	%rbx, %rsi
	call	*16(%rbp)
	leaq	57(%rbp), %rcx
	movslq	%eax, %r13
	movq	192(%rbp), %rax
	subq	208(%rbp), %rax
	addl	%eax, 184(%rbp)
	testl	%r13d, %r13d
	je	.L3878
	leaq	(%rbx,%r13), %rax
	movzbl	56(%rbp), %r13d
	sall	$8, %r13d
.L3682:
	vmovq	%rcx, %xmm5
	vpinsrq	$1, %rax, %xmm5, %xmm0
	vmovdqu	%xmm0, 192(%rbp)
	cmpq	%rax, %rcx
	jb	.L3879
.L3683:
	movl	48(%rbp), %esi
	testl	%esi, %esi
	je	.L3849
	leaq	56(%rbp), %rbx
	movl	52(%rbp), %edx
	movq	40(%rbp), %rdi
	movq	%rbx, %rsi
	call	*16(%rbp)
	movq	192(%rbp), %rdx
	subq	208(%rbp), %rdx
	addl	%edx, 184(%rbp)
	leaq	57(%rbp), %rdx
	testl	%eax, %eax
	je	.L3880
	cltq
	addq	%rax, %rbx
	movzbl	56(%rbp), %eax
	addl	%eax, %r13d
.L3685:
	vmovq	%rdx, %xmm6
	vpinsrq	$1, %rbx, %xmm6, %xmm0
	vmovdqu	%xmm0, 192(%rbp)
.L3849:
	movq	(%r14), %rbp
	jmp	.L3680
.L3860:
	leaq	56(%rbx), %rbp
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%rbp, %rsi
	call	*16(%rbx)
	movslq	%eax, %rdx
	movq	192(%rbx), %rax
	subq	208(%rbx), %rax
	addl	%eax, 184(%rbx)
	leaq	57(%rbx), %rax
	vmovq	%rax, %xmm0
	testl	%edx, %edx
	jne	.L3554
	vpunpcklqdq	%xmm0, %xmm0, %xmm0
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	vmovdqu	%xmm0, 192(%rbx)
	movl	$0, 18516(%r14)
	jmp	.L3555
.L3566:
	cltq
	addq	%rax, %r13
	movzbl	56(%rbp), %eax
	movl	%eax, %esi
	jmp	.L3567
.L3563:
	addq	%r12, %r13
	movzbl	56(%rbp), %r12d
	jmp	.L3564
.L3854:
	leaq	56(%rbp), %rbx
	movl	52(%rbp), %edx
	movq	40(%rbp), %rdi
	movq	%rbx, %rsi
	call	*16(%rbp)
	movq	192(%rbp), %rdx
	leaq	57(%rbp), %rdi
	subq	208(%rbp), %rdx
	vmovq	%rdi, %xmm0
	addl	%edx, 184(%rbp)
	testl	%eax, %eax
	jne	.L3539
	vpunpcklqdq	%xmm0, %xmm0, %xmm0
	movl	$0, 48(%rbp)
	movb	$0, 56(%rbp)
	vmovdqu	%xmm0, 192(%rbp)
	jmp	.L3538
.L3729:
	xorl	%ecx, %ecx
	jmp	.L3569
.L3701:
	cltq
	movzbl	56(%rbx), %edx
	addq	%rax, %rbp
	vpinsrq	$1, %rbp, %xmm0, %xmm0
	vmovdqu	%xmm0, 192(%rbx)
	jmp	.L3699
.L3880:
	movl	$0, 48(%rbp)
	movb	$0, 56(%rbp)
	movq	%rdx, %rbx
	jmp	.L3685
.L3877:
	movl	$0, 48(%rbp)
	movb	$0, 56(%rbp)
	movq	%rdx, %rbx
	jmp	.L3693
.L3878:
	movl	$0, 48(%rbp)
	movb	$0, 56(%rbp)
	movq	%rcx, %rax
	jmp	.L3682
.L3875:
	movl	$0, 48(%rbp)
	movb	$0, 56(%rbp)
	movq	%rcx, %rax
	jmp	.L3690
.L3539:
	cltq
	movzbl	56(%rbp), %edx
	addq	%rax, %rbx
	vpinsrq	$1, %rbx, %xmm0, %xmm0
	vmovdqu	%xmm0, 192(%rbp)
	jmp	.L3537
.L3554:
	movzbl	56(%rbx), %eax
	addq	%rbp, %rdx
	vpinsrq	$1, %rdx, %xmm0, %xmm0
	vmovdqu	%xmm0, 192(%rbx)
	leal	-1(%rax), %ecx
	jmp	.L3552
.L3708:
	movq	0(%r13), %rdx
	movl	8(%rdx), %eax
	testl	%eax, %eax
	jle	.L3709
	leaq	18092(%r13), %r15
	movl	$0, (%rsp)
	movq	%r13, %r14
.L3717:
	movl	16(%r15), %ebx
	leal	7(%rbx), %ebp
	movl	20(%r15), %ebx
	sarl	$3, %ebp
	leal	7(%rbx), %r12d
	sarl	$3, %r12d
	testl	%r12d, %r12d
	jle	.L3711
	testl	%ebp, %ebp
	jle	.L3716
	xorl	%ebx, %ebx
	movslq	%ebp, %rbp
.L3715:
	xorl	%r13d, %r13d
	jmp	.L3714
	.p2align 4
	.p2align 3
.L3882:
	vmovdqu	(%rax), %xmm1
	vpmullw	(%rcx), %xmm1, %xmm0
	vmovdqu	%xmm0, (%rax)
	vmovdqu	16(%rcx), %xmm2
	vpmullw	16(%rax), %xmm2, %xmm0
	vmovdqu	%xmm0, 16(%rax)
	vmovdqu	32(%rcx), %xmm3
	vpmullw	32(%rax), %xmm3, %xmm0
	vmovdqu	%xmm0, 32(%rax)
	vmovdqu	48(%rcx), %xmm4
	vpmullw	48(%rax), %xmm4, %xmm0
	vmovdqu	%xmm0, 48(%rax)
	vmovdqu	64(%rcx), %xmm5
	vpmullw	64(%rax), %xmm5, %xmm0
	vmovdqu	%xmm0, 64(%rax)
	vmovdqu	80(%rcx), %xmm6
	vpmullw	80(%rax), %xmm6, %xmm0
	vmovdqu	%xmm0, 80(%rax)
	vmovdqu	96(%rcx), %xmm7
	vpmullw	96(%rax), %xmm7, %xmm0
	vmovdqu	%xmm0, 96(%rax)
	vmovdqu	112(%rcx), %xmm0
	vpmullw	112(%rax), %xmm0, %xmm0
	vmovdqu	%xmm0, 112(%rax)
.L3713:
	movl	24(%r15), %esi
	movq	%r8, %rdx
	movl	%esi, %eax
	imull	%ebx, %eax
	sall	$3, %eax
	cltq
	leaq	(%rax,%r13,8), %rdi
	incq	%r13
	addq	36(%r15), %rdi
	call	*18544(%r14)
	cmpq	%rbp, %r13
	je	.L3881
.L3714:
	movl	76(%r15), %edx
	movslq	(%r15), %rsi
	movq	68(%r15), %rax
	imull	%ebx, %edx
	addq	$105, %rsi
	salq	$7, %rsi
	leal	(%rdx,%r13), %ecx
	movslq	%edx, %rdx
	sall	$6, %ecx
	addq	%r13, %rdx
	movslq	%ecx, %rcx
	salq	$7, %rdx
	leaq	(%rax,%rcx,2), %r8
	addq	%rdx, %rax
	leaq	8(%r14,%rsi), %rcx
	leaq	10(%r14,%rsi), %rsi
	movq	%rax, %rdx
	subq	%rsi, %rdx
	cmpq	$12, %rdx
	ja	.L3882
	xorl	%eax, %eax
	.p2align 4
	.p2align 3
.L3712:
	movzwl	(%r8,%rax), %edx
	imulw	(%rcx,%rax), %dx
	movw	%dx, (%r8,%rax)
	addq	$2, %rax
	cmpq	$128, %rax
	jne	.L3712
	jmp	.L3713
.L3881:
	incl	%ebx
	cmpl	%ebx, %r12d
	jne	.L3715
	movq	(%r14), %rdx
.L3716:
	movl	8(%rdx), %eax
.L3711:
	incl	(%rsp)
	addq	$96, %r15
	movl	(%rsp), %ebx
	cmpl	%eax, %ebx
	jl	.L3717
	jmp	.L3709
	.p2align 4
	.p2align 3
.L3858:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rbp)
	movzbl	(%rax), %eax
.L3545:
	cmpb	$-1, %al
	je	.L3548
	jmp	.L3542
	.p2align 4
	.p2align 3
.L3870:
	movl	$3, %ecx
	jmp	.L3569
.L3734:
	movl	$3, %ecx
	jmp	.L3568
.L3733:
	movl	$2, %ecx
	jmp	.L3569
.L3732:
	movl	$2, %ecx
	jmp	.L3568
.L3731:
	movl	$1, %ecx
	jmp	.L3569
.L3730:
	movl	$1, %ecx
	jmp	.L3568
.L3872:
	leaq	.LC147(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L3533
.L3871:
	leaq	.LC146(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L3533
.L3559:
	movq	%rbp, %rdi
	call	stbi__get8
	movq	(%r14), %rdi
	movzbl	%al, %eax
	movl	%eax, 18484(%r14)
	call	stbi__get8
	movq	(%r14), %rdi
	movzbl	%al, %eax
	movl	%eax, 18488(%r14)
	call	stbi__get8
	movl	18480(%r14), %r8d
	movzbl	%al, %edx
	movl	%eax, %ecx
	andl	$15, %eax
	sarl	$4, %edx
	andl	$15, %ecx
	vmovd	%edx, %xmm4
	vpinsrd	$1, %eax, %xmm4, %xmm0
	vmovq	%xmm0, 18492(%r14)
	testl	%r8d, %r8d
	je	.L3572
	movl	18484(%r14), %edi
	cmpl	$63, %edi
	jg	.L3573
	cmpl	$13, %edx
	movl	18488(%r14), %esi
	setg	%al
	cmpb	$13, %cl
	seta	%dl
	orb	%dl, %al
	jne	.L3573
	cmpl	$63, %esi
	setg	%al
	cmpl	%esi, %edi
	setg	%dl
	orb	%dl, %al
	jne	.L3573
	movl	18536(%r14), %eax
	movl	$0, 18476(%r14)
	movl	$0, 18392(%r14)
	movl	$0, 18296(%r14)
	movl	$0, 18200(%r14)
	movl	$0, 18104(%r14)
	movq	$0, 18464(%r14)
	movb	$-1, 18472(%r14)
	testl	%eax, %eax
	je	.L3832
	movl	%eax, 18540(%r14)
	movl	$0, 18500(%r14)
.L3720:
	cmpl	$1, 18516(%r14)
	je	.L3612
	movl	18068(%r14), %edx
	testl	%edx, %edx
	jle	.L3593
	movl	18064(%r14), %eax
	movl	$0, (%rsp)
	movq	%r14, %r15
.L3613:
	xorl	%ebx, %ebx
	testl	%eax, %eax
	jle	.L3668
.L3667:
	movl	18516(%r15), %edx
	movq	$0, 8(%rsp)
	testl	%edx, %edx
	jle	.L3666
.L3661:
	movq	8(%rsp), %rax
	movslq	18520(%r15,%rax,4), %rax
	leaq	(%rax,%rax,2), %r14
	movq	%rax, %r13
	salq	$5, %r14
	addq	%r15, %r14
	movl	18088(%r14), %eax
	testl	%eax, %eax
	jle	.L3656
	movl	18084(%r14), %ecx
	xorl	%ebp, %ebp
.L3657:
	testl	%ecx, %ecx
	jle	.L3660
	xorl	%r12d, %r12d
	jmp	.L3658
	.p2align 4
	.p2align 3
.L3884:
	movl	18084(%r14), %ecx
	incl	%r12d
	movl	18088(%r14), %eax
	cmpl	%r12d, %ecx
	jle	.L3883
.L3658:
	imull	(%rsp), %eax
	imull	%ebx, %ecx
	movslq	18096(%r14), %rdx
	movq	%r15, %rdi
	addl	%r12d, %ecx
	imulq	$1680, %rdx, %rdx
	addl	%ebp, %eax
	imull	18168(%r14), %eax
	leaq	8(%r15,%rdx), %rdx
	addl	%ecx, %eax
	movq	18160(%r14), %rcx
	sall	$6, %eax
	cltq
	leaq	(%rcx,%rax,2), %rsi
	movl	%r13d, %ecx
	call	stbi__jpeg_decode_block_prog_dc
	testl	%eax, %eax
	jne	.L3884
	jmp	.L3851
.L3573:
	leaq	.LC148(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L3533
.L3546:
	addq	%rsi, %rbx
	movzbl	56(%rbp), %eax
	vpinsrq	$1, %rbx, %xmm0, %xmm0
	vmovdqu	%xmm0, 192(%rbp)
	jmp	.L3545
.L3724:
	movl	$255, %esi
	jmp	.L3547
.L3695:
	leaq	.LC150(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L3533
.L3865:
	leaq	.LC149(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L3533
	.p2align 4
	.p2align 3
.L3598:
	movq	%r14, %rax
	incl	16(%rsp)
	movq	%r15, %r14
	movl	18088(%rax), %ebx
	movq	%rax, %r15
	movl	16(%rsp), %eax
	cmpl	%eax, %ebx
	jg	.L3596
.L3601:
	movl	18516(%r14), %eax
.L3595:
	incq	40(%rsp)
	movq	40(%rsp), %rbx
	cmpl	%ebx, %eax
	jg	.L3602
.L3608:
	movl	18540(%r14), %eax
	decl	%eax
	movl	%eax, 18540(%r14)
	testl	%eax, %eax
	jle	.L3885
.L3603:
	incl	(%rsp)
	movl	(%rsp), %ebx
	movl	18064(%r14), %eax
	cmpl	%eax, %ebx
	jl	.L3610
	movl	18068(%r14), %edx
	movq	%r14, %r15
.L3611:
	incl	8(%rsp)
	movl	8(%rsp), %ebx
	cmpl	%edx, %ebx
	jl	.L3580
.L3848:
	movq	%r15, %r14
.L3847:
	movzbl	18472(%r14), %eax
.L3652:
	cmpb	$-1, %al
	jne	.L3669
.L3593:
	movq	(%r14), %rbp
.L3718:
	cmpq	$0, 16(%rbp)
	je	.L3675
	movq	40(%rbp), %rdi
	call	*32(%rbp)
	testl	%eax, %eax
	je	.L3676
	movl	48(%rbp), %edi
	testl	%edi, %edi
	je	.L3850
.L3675:
	movq	200(%rbp), %rax
	cmpq	%rax, 192(%rbp)
	jnb	.L3850
.L3676:
	movq	(%r14), %rbp
	movq	192(%rbp), %rax
	cmpq	200(%rbp), %rax
	jb	.L3886
	movl	48(%rbp), %r8d
	movq	16(%rbp), %rax
	testl	%r8d, %r8d
	je	.L3718
	leaq	56(%rbp), %rbx
	movl	52(%rbp), %edx
	movq	40(%rbp), %rdi
	movq	%rbx, %rsi
	call	*%rax
	movq	192(%rbp), %rdx
	leaq	57(%rbp), %rdi
	subq	208(%rbp), %rdx
	vmovq	%rdi, %xmm0
	addl	%edx, 184(%rbp)
	testl	%eax, %eax
	jne	.L3673
	vpunpcklqdq	%xmm0, %xmm0, %xmm0
	movl	$0, 48(%rbp)
	movb	$0, 56(%rbp)
	vmovdqu	%xmm0, 192(%rbp)
	movq	(%r14), %rbp
	jmp	.L3718
.L3883:
	incl	%ebp
	cmpl	%eax, %ebp
	jl	.L3657
.L3660:
	movl	18516(%r15), %edx
.L3656:
	incq	8(%rsp)
	movq	8(%rsp), %rax
	cmpl	%eax, %edx
	jg	.L3661
.L3666:
	movl	18540(%r15), %eax
	decl	%eax
	movl	%eax, 18540(%r15)
	testl	%eax, %eax
	jle	.L3887
.L3662:
	movl	18064(%r15), %eax
	incl	%ebx
	cmpl	%eax, %ebx
	jl	.L3667
	movl	18068(%r15), %edx
.L3668:
	incl	(%rsp)
	movl	(%rsp), %ebx
	cmpl	%edx, %ebx
	jl	.L3613
	jmp	.L3848
	.p2align 4
	.p2align 3
.L3886:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rbp)
	movzbl	(%rax), %edx
.L3671:
	cmpb	$-1, %dl
	jne	.L3718
	movq	%rbp, %rdi
	call	stbi__get8
	movb	%al, 18472(%r14)
	jmp	.L3674
.L3612:
	movslq	18520(%r14), %rax
	movl	$0, 56(%rsp)
	movl	%eax, 60(%rsp)
	leaq	(%rax,%rax,2), %rax
	salq	$5, %rax
	leaq	(%r14,%rax), %r13
	movl	18108(%r13), %eax
	addl	$7, %eax
	sarl	$3, %eax
	movl	%eax, 40(%rsp)
	movl	18112(%r13), %eax
	addl	$7, %eax
	sarl	$3, %eax
	movl	%eax, 68(%rsp)
	testl	%eax, %eax
	jle	.L3593
	movq	%r13, 72(%rsp)
.L3614:
	movl	40(%rsp), %r9d
	movl	$0, (%rsp)
	movq	72(%rsp), %r12
	testl	%r9d, %r9d
	jg	.L3654
	jmp	.L3655
	.p2align 4
	.p2align 3
.L3889:
	movslq	18096(%r12), %rax
	movl	60(%rsp), %ecx
	movq	%rbp, %rsi
	movq	%r14, %rdi
	imulq	$1680, %rax, %rax
	leaq	8(%r14,%rax), %rdx
	call	stbi__jpeg_decode_block_prog_dc
	testl	%eax, %eax
	je	.L3851
.L3617:
	movl	18540(%r14), %eax
	decl	%eax
	movl	%eax, 18540(%r14)
	testl	%eax, %eax
	jle	.L3888
	incl	(%rsp)
	movl	(%rsp), %eax
	cmpl	%eax, 40(%rsp)
	je	.L3655
.L3654:
	movl	56(%rsp), %eax
	imull	18168(%r12), %eax
	movq	18160(%r12), %rdx
	movl	18484(%r14), %r15d
	addl	(%rsp), %eax
	sall	$6, %eax
	cltq
	leaq	(%rdx,%rax,2), %rbp
	testl	%r15d, %r15d
	je	.L3889
	movslq	18100(%r12), %rsi
	movl	18492(%r14), %r10d
	movl	18500(%r14), %ecx
	imulq	$1680, %rsi, %rax
	leaq	6728(%r14,%rax), %rax
	movq	%rax, 24(%rsp)
	movl	18496(%r14), %eax
	testl	%r10d, %r10d
	jne	.L3618
	testl	%ecx, %ecx
	jne	.L3890
	movl	$1, %ecx
	salq	$10, %rsi
	movq	%r12, 8(%rsp)
	movq	24(%rsp), %r12
	shlx	%eax, %ecx, %eax
	leaq	13960(%rsi), %rbx
	movl	%eax, %r13d
	jmp	.L3629
	.p2align 4
	.p2align 3
.L3620:
	movl	18464(%r14), %edi
	movl	%edi, %eax
	shrl	$23, %eax
	leaq	(%r14,%rax,2), %rax
	movswl	(%rax,%rbx), %ecx
	movl	%ecx, %esi
	testl	%ecx, %ecx
	je	.L3621
	movl	%ecx, %eax
	andl	$15, %esi
	subl	%esi, 18468(%r14)
	sarl	$8, %ecx
	imull	%r13d, %ecx
	sarl	$4, %eax
	shlx	%esi, %edi, %edi
	andl	$15, %eax
	leaq	stbi__jpeg_dezigzag(%rip), %rsi
	movl	%edi, 18464(%r14)
	addl	%r15d, %eax
	leal	1(%rax), %r15d
	cltq
	movzbl	(%rsi,%rax), %eax
	movw	%cx, 0(%rbp,%rax,2)
.L3622:
	cmpl	%r15d, 18488(%r14)
	jl	.L3891
.L3629:
	cmpl	$15, 18468(%r14)
	jg	.L3620
	movq	%r14, %rdi
	call	stbi__grow_buffer_unsafe
	jmp	.L3620
.L3621:
	movq	%r12, %rsi
	movq	%r14, %rdi
	call	stbi__jpeg_huff_decode
	testl	%eax, %eax
	js	.L3638
	movl	%eax, %ecx
	sarl	$4, %ecx
	andl	$15, %eax
	jne	.L3624
	cmpl	$14, %ecx
	jle	.L3892
	addl	$16, %r15d
	cmpl	%r15d, 18488(%r14)
	jge	.L3629
.L3891:
	movq	8(%rsp), %r12
	jmp	.L3617
.L3888:
	cmpl	$23, 18468(%r14)
	jle	.L3893
.L3651:
	movzbl	18472(%r14), %eax
	leal	48(%rax), %edx
	cmpb	$7, %dl
	ja	.L3652
	movl	18536(%r14), %eax
	movl	$2147483647, %edx
	movl	$0, 18476(%r14)
	movl	$0, 18392(%r14)
	movl	$0, 18296(%r14)
	movl	$0, 18200(%r14)
	movl	$0, 18104(%r14)
	movq	$0, 18464(%r14)
	movb	$-1, 18472(%r14)
	movl	$0, 18500(%r14)
	testl	%eax, %eax
	cmove	%edx, %eax
	incl	(%rsp)
	movl	%eax, 18540(%r14)
	movl	(%rsp), %eax
	cmpl	%eax, 40(%rsp)
	jne	.L3654
.L3655:
	incl	56(%rsp)
	movl	56(%rsp), %eax
	cmpl	%eax, 68(%rsp)
	jne	.L3614
	jmp	.L3847
	.p2align 4
	.p2align 3
.L3624:
	addl	%r15d, %ecx
	leaq	stbi__jpeg_dezigzag(%rip), %rdi
	leal	1(%rcx), %r15d
	movslq	%ecx, %rcx
	movzbl	(%rdi,%rcx), %r10d
	movl	18468(%r14), %edi
	cmpl	%edi, %eax
	jg	.L3894
.L3628:
	movl	18464(%r14), %esi
	movl	%eax, %ecx
	movslq	%eax, %r9
	subl	%eax, %edi
	movl	%edi, 18468(%r14)
	movzbl	%r10b, %edi
	movl	%esi, %edx
	shrl	$31, %esi
	roll	%cl, %edx
	leal	-1(%rsi), %eax
	leaq	stbi__jbias(%rip), %rsi
	movl	%edx, %ecx
	leaq	stbi__bmask(%rip), %rdx
	andl	(%rsi,%r9,4), %eax
	movl	(%rdx,%r9,4), %r8d
	andn	%ecx, %r8d, %r11d
	andl	%r8d, %ecx
	addl	%ecx, %eax
	movl	%r11d, 18464(%r14)
	imull	%r13d, %eax
	movw	%ax, 0(%rbp,%rdi,2)
	jmp	.L3622
.L3618:
	movl	$1, %r13d
	shlx	%eax, %r13d, %eax
	movl	%eax, 32(%rsp)
	movw	%ax, 8(%rsp)
	testl	%ecx, %ecx
	jne	.L3829
	cwtl
	movq	%r12, 48(%rsp)
	movq	%r14, %r12
	movq	%rbp, %r14
	movl	%eax, 64(%rsp)
	.p2align 4
	.p2align 3
.L3631:
	movq	24(%rsp), %rsi
	movq	%r12, %rdi
	call	stbi__jpeg_huff_decode
	movl	%eax, %ebx
	testl	%eax, %eax
	js	.L3638
	movl	%eax, %ebp
	sarl	$4, %ebp
	andl	$15, %ebx
	jne	.L3639
	cmpl	$14, %ebp
	jg	.L3640
	movl	$1, %eax
	shlx	%ebp, %eax, %eax
	decl	%eax
	movl	%eax, 18500(%r12)
	testl	%ebp, %ebp
	jne	.L3895
	movl	$64, %ebp
	.p2align 4
	.p2align 3
.L3640:
	movl	18488(%r12), %r10d
	cmpl	%r10d, %r15d
	jg	.L3846
	movslq	%r15d, %rax
	leaq	stbi__jpeg_dezigzag(%rip), %rdi
	movl	%ebx, 16(%rsp)
	movq	%r14, %rbx
	addq	%rdi, %rax
	movq	%rax, %r13
	jmp	.L3649
	.p2align 4
	.p2align 3
.L3898:
	movl	18468(%r12), %eax
	testl	%eax, %eax
	jle	.L3896
.L3644:
	movl	18464(%r12), %ecx
	decl	%eax
	movl	%eax, 18468(%r12)
	leal	(%rcx,%rcx), %edi
	movl	%edi, 18464(%r12)
	testl	%ecx, %ecx
	js	.L3897
.L3645:
	incq	%r13
	cmpl	%r10d, %r15d
	jg	.L3846
.L3649:
	movzbl	0(%r13), %eax
	incl	%r15d
	leaq	(%rbx,%rax,2), %r14
	cmpw	$0, (%r14)
	jne	.L3898
	testl	%ebp, %ebp
	je	.L3899
	decl	%ebp
	jmp	.L3645
	.p2align 4
	.p2align 3
.L3897:
	movzwl	(%r14), %eax
	testw	%ax, 8(%rsp)
	jne	.L3645
	movl	32(%rsp), %esi
	movl	%eax, %edi
	subl	%esi, %edi
	leal	(%rax,%rsi), %ecx
	testw	%ax, %ax
	movl	%edi, %eax
	cmovg	%ecx, %eax
	movw	%ax, (%r14)
	jmp	.L3645
	.p2align 4
	.p2align 3
.L3896:
	movq	%r12, %rdi
	call	stbi__grow_buffer_unsafe
	movl	18468(%r12), %eax
	movl	18488(%r12), %r10d
	jmp	.L3644
.L3899:
	movq	%r14, %r13
	movq	%rbx, %r14
	movl	16(%rsp), %ebx
	movw	%bx, 0(%r13)
	cmpl	%r15d, %r10d
	jge	.L3631
.L3846:
	movq	%r12, %r14
	movq	48(%rsp), %r12
	jmp	.L3617
.L3639:
	cmpl	$1, %ebx
	jne	.L3638
	movl	18468(%r12), %eax
	testl	%eax, %eax
	jle	.L3900
.L3642:
	decl	%eax
	movl	18464(%r12), %esi
	movl	%eax, 18468(%r12)
	movl	64(%rsp), %eax
	leal	(%rsi,%rsi), %edi
	movl	%eax, %ebx
	movl	%edi, 18464(%r12)
	negl	%ebx
	testl	%esi, %esi
	cmovs	%eax, %ebx
	jmp	.L3640
.L3893:
	movq	%r14, %rdi
	call	stbi__grow_buffer_unsafe
	jmp	.L3651
.L3900:
	movq	%r12, %rdi
	call	stbi__grow_buffer_unsafe
	movl	18468(%r12), %eax
	jmp	.L3642
.L3829:
	decl	%ecx
	movl	%ecx, 18500(%r14)
	movl	18488(%r14), %ecx
	cmpl	%ecx, %r15d
	jg	.L3617
	movslq	%r15d, %rbx
	jmp	.L3637
.L3632:
	incq	%rbx
	cmpl	%ebx, %ecx
	jl	.L3617
.L3637:
	leaq	stbi__jpeg_dezigzag(%rip), %rax
	movzbl	(%rax,%rbx), %eax
	leaq	0(%rbp,%rax,2), %r13
	cmpw	$0, 0(%r13)
	je	.L3632
	movl	18468(%r14), %eax
	testl	%eax, %eax
	jle	.L3901
.L3633:
	movl	18464(%r14), %edx
	decl	%eax
	movl	%eax, 18468(%r14)
	leal	(%rdx,%rdx), %esi
	movl	%esi, 18464(%r14)
	testl	%edx, %edx
	jns	.L3632
	movzwl	0(%r13), %eax
	testw	%ax, 8(%rsp)
	jne	.L3632
	movl	32(%rsp), %edi
	movl	%eax, %esi
	subl	%edi, %esi
	leal	(%rax,%rdi), %edx
	testw	%ax, %ax
	movl	%esi, %eax
	cmovg	%edx, %eax
	movw	%ax, 0(%r13)
	jmp	.L3632
.L3901:
	movq	%r14, %rdi
	call	stbi__grow_buffer_unsafe
	movl	18468(%r14), %eax
	movl	18488(%r14), %ecx
	jmp	.L3633
.L3638:
	leaq	.LC111(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L3533
.L3895:
	movl	18468(%r12), %edi
	cmpl	%edi, %ebp
	jg	.L3902
.L3641:
	movl	18464(%r12), %esi
	movl	%ebp, %ecx
	movslq	%ebp, %r8
	subl	%ebp, %edi
	movl	%edi, 18468(%r12)
	movl	$64, %ebp
	roll	%cl, %esi
	leaq	stbi__bmask(%rip), %rcx
	movl	(%rcx,%r8,4), %r8d
	andn	%esi, %r8d, %r10d
	andl	%r8d, %esi
	addl	%esi, %eax
	movl	%r10d, 18464(%r12)
	movl	%eax, 18500(%r12)
	jmp	.L3640
.L3894:
	movq	%r14, %rdi
	movb	%r10b, 24(%rsp)
	movl	%eax, 16(%rsp)
	call	stbi__grow_buffer_unsafe
	movl	18468(%r14), %edi
	movzbl	24(%rsp), %r10d
	movl	16(%rsp), %eax
	jmp	.L3628
.L3890:
	decl	%ecx
	movl	%ecx, 18500(%r14)
	jmp	.L3617
.L3578:
	movslq	18520(%r14), %rax
	leaq	(%rax,%rax,2), %r10
	movq	%rax, %r15
	salq	$5, %r10
	leaq	(%r14,%r10), %r13
	movl	18108(%r13), %eax
	addl	$7, %eax
	sarl	$3, %eax
	movl	%eax, %ebx
	movl	%eax, 24(%rsp)
	movl	18112(%r13), %eax
	addl	$7, %eax
	sarl	$3, %eax
	movl	%eax, 56(%rsp)
	testl	%eax, %eax
	jle	.L3593
	leal	-1(%rbx), %eax
	leaq	8(,%rax,8), %rax
	movq	%rax, 16(%rsp)
	movq	%r13, %rax
	movq	%r14, %r13
	movq	%rax, %r14
.L3582:
	movl	24(%rsp), %ecx
	testl	%ecx, %ecx
	jle	.L3592
	leaq	6728(%r13), %rax
	xorl	%ebx, %ebx
	leaq	80(%rsp), %rbp
	movq	%rax, (%rsp)
	leaq	8(%r13), %rax
	movq	%rax, 8(%rsp)
	jmp	.L3589
.L3584:
	addq	$8, %rbx
	cmpq	16(%rsp), %rbx
	je	.L3592
.L3589:
	movslq	18100(%r14), %rax
	movq	(%rsp), %rdi
	subq	$8, %rsp
	.cfi_def_cfa_offset 296
	movl	%r15d, %r9d
	movslq	18096(%r14), %rdx
	movq	%rax, %rsi
	imulq	$1680, %rax, %rax
	imulq	$1680, %rdx, %rdx
	addq	16(%rsp), %rdx
	salq	$10, %rsi
	leaq	13960(%r13,%rsi), %r8
	movq	%rbp, %rsi
	leaq	(%rdi,%rax), %rcx
	movslq	18092(%r14), %rax
	movq	%r13, %rdi
	salq	$7, %rax
	leaq	13448(%r13,%rax), %rax
	pushq	%rax
	.cfi_def_cfa_offset 304
	call	stbi__jpeg_decode_block
	popq	%rsi
	.cfi_def_cfa_offset 296
	popq	%rdi
	.cfi_def_cfa_offset 288
	testl	%eax, %eax
	je	.L3851
	movl	18116(%r14), %esi
	movq	%rbp, %rdx
	movl	%esi, %edi
	imull	%r12d, %edi
	sall	$3, %edi
	movslq	%edi, %rdi
	addq	%rbx, %rdi
	addq	18128(%r14), %rdi
	call	*18544(%r13)
	movl	18540(%r13), %eax
	decl	%eax
	movl	%eax, 18540(%r13)
	testl	%eax, %eax
	jg	.L3584
	cmpl	$23, 18468(%r13)
	jle	.L3903
.L3585:
	movzbl	18472(%r13), %eax
	leal	48(%rax), %edx
	cmpb	$7, %dl
	ja	.L3836
	movl	18536(%r13), %eax
	movl	$2147483647, %edi
	movl	$0, 18476(%r13)
	movl	$0, 18392(%r13)
	movl	$0, 18296(%r13)
	movl	$0, 18200(%r13)
	movl	$0, 18104(%r13)
	movq	$0, 18464(%r13)
	movb	$-1, 18472(%r13)
	movl	$0, 18500(%r13)
	testl	%eax, %eax
	cmove	%edi, %eax
	addq	$8, %rbx
	movl	%eax, 18540(%r13)
	cmpq	16(%rsp), %rbx
	jne	.L3589
.L3592:
	incl	%r12d
	cmpl	%r12d, 56(%rsp)
	jne	.L3582
	movzbl	18472(%r13), %eax
	movq	%r13, %r14
	jmp	.L3652
	.p2align 4
	.p2align 3
.L3903:
	movq	%r13, %rdi
	call	stbi__grow_buffer_unsafe
	jmp	.L3585
.L3902:
	movq	%r12, %rdi
	call	stbi__grow_buffer_unsafe
	movl	18500(%r12), %eax
	movl	18468(%r12), %edi
	jmp	.L3641
.L3892:
	movl	$1, %eax
	movq	8(%rsp), %r12
	shlx	%ecx, %eax, %eax
	movl	%eax, 18500(%r14)
	testl	%ecx, %ecx
	jne	.L3904
.L3626:
	decl	%eax
	movl	%eax, 18500(%r14)
	jmp	.L3617
.L3836:
	movq	%r13, %r14
	jmp	.L3652
.L3673:
	cltq
	movzbl	56(%rbp), %edx
	addq	%rax, %rbx
	vpinsrq	$1, %rbx, %xmm0, %xmm0
	vmovdqu	%xmm0, 192(%rbp)
	movq	(%r14), %rbp
	jmp	.L3671
.L3904:
	movl	18468(%r14), %esi
	cmpl	%esi, %ecx
	jg	.L3905
.L3627:
	movl	18464(%r14), %edx
	movslq	%ecx, %rdi
	leaq	stbi__bmask(%rip), %rbx
	subl	%ecx, %esi
	movl	(%rbx,%rdi,4), %edi
	movl	%esi, 18468(%r14)
	roll	%cl, %edx
	andn	%edx, %edi, %r8d
	andl	%edi, %edx
	movl	%r8d, 18464(%r14)
	addl	%edx, %eax
	jmp	.L3626
.L3887:
	cmpl	$23, 18468(%r15)
	jle	.L3906
.L3663:
	movzbl	18472(%r15), %eax
	leal	48(%rax), %edx
	cmpb	$7, %dl
	ja	.L3843
	movl	18536(%r15), %eax
	movl	$2147483647, %esi
	movl	$0, 18476(%r15)
	movl	$0, 18392(%r15)
	movl	$0, 18296(%r15)
	movl	$0, 18200(%r15)
	movl	$0, 18104(%r15)
	movq	$0, 18464(%r15)
	movb	$-1, 18472(%r15)
	movl	$0, 18500(%r15)
	testl	%eax, %eax
	cmove	%esi, %eax
	movl	%eax, 18540(%r15)
	jmp	.L3662
.L3832:
	movl	$2147483647, 18540(%r14)
	movl	$0, 18500(%r14)
	jmp	.L3720
.L3905:
	movq	%r14, %rdi
	movl	%ecx, 8(%rsp)
	call	stbi__grow_buffer_unsafe
	movl	18500(%r14), %eax
	movl	18468(%r14), %esi
	movl	8(%rsp), %ecx
	jmp	.L3627
.L3843:
	movq	%r15, %r14
	jmp	.L3652
.L3906:
	movq	%r15, %rdi
	call	stbi__grow_buffer_unsafe
	jmp	.L3663
.L3885:
	cmpl	$23, 18468(%r14)
	jle	.L3907
.L3604:
	movzbl	18472(%r14), %eax
	leal	48(%rax), %edx
	cmpb	$7, %dl
	ja	.L3652
	movl	18536(%r14), %eax
	movl	$2147483647, %edx
	movl	$0, 18476(%r14)
	movl	$0, 18392(%r14)
	movl	$0, 18296(%r14)
	movl	$0, 18200(%r14)
	movl	$0, 18104(%r14)
	movq	$0, 18464(%r14)
	movb	$-1, 18472(%r14)
	movl	$0, 18500(%r14)
	testl	%eax, %eax
	cmove	%edx, %eax
	movl	%eax, 18540(%r14)
	jmp	.L3603
.L3856:
	movl	$2147483647, 18540(%r14)
	movl	$0, 18500(%r14)
	jmp	.L3719
.L3907:
	movq	%r14, %rdi
	call	stbi__grow_buffer_unsafe
	jmp	.L3604
.L3727:
	xorl	%esi, %esi
	jmp	.L3562
.L3855:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE663:
	.size	stbi__decode_jpeg_image, .-stbi__decode_jpeg_image
	.section	.rodata.str1.1
.LC151:
	.string	"bad BMP"
.LC152:
	.string	"unknown BMP"
.LC153:
	.string	"BMP RLE"
.LC154:
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
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%rdi, %rbp
	movq	%rsi, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	call	stbi__get32le
	movq	192(%rbp), %rdx
	movq	200(%rbp), %rax
	cmpq	%rax, %rdx
	jb	.L3974
	movl	48(%rbp), %edi
	testl	%edi, %edi
	jne	.L3975
.L3927:
	movq	%rbp, %rdi
	call	stbi__get32le
	movq	%rbp, %rdi
	movl	%eax, 4(%rbx)
	call	stbi__get32le
	vpxor	%xmm0, %xmm0, %xmm0
	movl	$14, 32(%rbx)
	movl	%eax, %r12d
	movl	%eax, 8(%rbx)
	movl	4(%rbx), %eax
	vmovdqu	%xmm0, 12(%rbx)
	testl	%eax, %eax
	js	.L3935
	cmpl	$12, %r12d
	je	.L3969
	cmpl	$40, %r12d
	je	.L3932
	movl	%r12d, %eax
	andl	$-17, %eax
	cmpl	$108, %eax
	je	.L3933
	cmpl	$56, %r12d
	jne	.L3976
.L3933:
	movq	%rbp, %rdi
	call	stbi__get32le
	movq	%rbp, %rdi
	movl	%eax, 0(%rbp)
	call	stbi__get32le
	movq	%rbp, %rdi
	movl	%eax, 4(%rbp)
	call	stbi__get16le
	cmpl	$1, %eax
	jne	.L3935
	movq	%rbp, %rdi
	call	stbi__get16le
	movq	%rbp, %rdi
	movl	%eax, (%rbx)
	call	stbi__get32le
	movl	%eax, %r13d
	leal	-1(%rax), %eax
	cmpl	$1, %eax
	jbe	.L3977
	cmpl	$3, %r13d
	jg	.L3978
	jne	.L3939
	movl	(%rbx), %eax
	subl	$16, %eax
	andl	$-17, %eax
	jne	.L3935
.L3939:
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
	jne	.L3940
	cmpl	$56, %r12d
	je	.L3979
.L3941:
	movl	(%rbx), %eax
	leal	-16(%rax), %edx
	andl	$-17, %edx
	jne	.L3973
	testl	%r13d, %r13d
	je	.L3980
	cmpl	$3, %r13d
	jne	.L3935
	movq	%rbp, %rdi
	call	stbi__get32le
	movq	%rbp, %rdi
	movl	%eax, 12(%rbx)
	call	stbi__get32le
	movq	%rbp, %rdi
	movl	%eax, 16(%rbx)
	call	stbi__get32le
	movl	%eax, 20(%rbx)
	addl	$12, 32(%rbx)
	movl	16(%rbx), %edx
	cmpl	%edx, 12(%rbx)
	jne	.L3973
	cmpl	%edx, %eax
	jne	.L3973
	.p2align 4
	.p2align 3
.L3935:
	leaq	.LC151(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
.L3908:
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
	.p2align 4
	.p2align 3
.L3932:
	.cfi_restore_state
	cmpl	$12, %r12d
	jne	.L3933
.L3969:
	movq	%rbp, %rdi
	call	stbi__get16le
	movq	%rbp, %rdi
	movl	%eax, 0(%rbp)
	call	stbi__get16le
	movq	%rbp, %rdi
	movl	%eax, 4(%rbp)
	call	stbi__get16le
	cmpl	$1, %eax
	jne	.L3935
	movq	%rbp, %rdi
	call	stbi__get16le
	movl	%eax, (%rbx)
.L3973:
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
	.p2align 4
	.p2align 3
.L3974:
	.cfi_restore_state
	incq	%rdx
	movq	%rdx, 192(%rbp)
	leaq	1(%rdx), %rcx
	cmpq	%rax, %rdx
	jnb	.L3981
.L3916:
	movq	%rcx, 192(%rbp)
	leaq	1(%rcx), %rdx
	cmpq	%rcx, %rax
	jbe	.L3982
.L3922:
	movq	%rdx, 192(%rbp)
	cmpq	%rdx, %rax
	jbe	.L3983
.L3925:
	incq	%rdx
	movq	%rdx, 192(%rbp)
	jmp	.L3927
	.p2align 4
	.p2align 3
.L3976:
	leaq	.LC152(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L3908
	.p2align 4
	.p2align 3
.L3975:
	leaq	56(%rbp), %r12
	movl	52(%rbp), %edx
	movq	40(%rbp), %rdi
	movq	%r12, %rsi
	call	*16(%rbp)
	movq	192(%rbp), %rdx
	subq	208(%rbp), %rdx
	addl	%edx, 184(%rbp)
	leaq	57(%rbp), %rdx
	testl	%eax, %eax
	jne	.L3912
	movl	$0, 48(%rbp)
	movq	%rdx, %rax
	movb	$0, 56(%rbp)
.L3913:
	movq	%rax, 200(%rbp)
	movq	%rdx, 192(%rbp)
	leaq	1(%rdx), %rcx
	cmpq	%rax, %rdx
	jb	.L3916
.L3981:
	movl	48(%rbp), %esi
	testl	%esi, %esi
	je	.L3927
	leaq	56(%rbp), %r12
	movl	52(%rbp), %edx
	movq	40(%rbp), %rdi
	movq	%r12, %rsi
	call	*16(%rbp)
	movq	192(%rbp), %rdx
	leaq	57(%rbp), %rcx
	subq	208(%rbp), %rdx
	addl	%edx, 184(%rbp)
	testl	%eax, %eax
	jne	.L3917
	movl	$0, 48(%rbp)
	movq	%rcx, %rax
	movb	$0, 56(%rbp)
.L3918:
	movq	%rax, 200(%rbp)
	movq	%rcx, 192(%rbp)
	leaq	1(%rcx), %rdx
	cmpq	%rcx, %rax
	ja	.L3922
.L3982:
	movl	48(%rbp), %ecx
	testl	%ecx, %ecx
	je	.L3927
	leaq	56(%rbp), %r12
	movl	52(%rbp), %edx
	movq	40(%rbp), %rdi
	movq	%r12, %rsi
	call	*16(%rbp)
	movq	192(%rbp), %rdx
	subq	208(%rbp), %rdx
	addl	%edx, 184(%rbp)
	leaq	57(%rbp), %rdx
	testl	%eax, %eax
	jne	.L3923
	movl	$0, 48(%rbp)
	movq	%rdx, %rax
	movb	$0, 56(%rbp)
.L3924:
	movq	%rax, 200(%rbp)
	movq	%rdx, 192(%rbp)
	cmpq	%rdx, %rax
	ja	.L3925
.L3983:
	movl	48(%rbp), %edx
	testl	%edx, %edx
	je	.L3927
	leaq	56(%rbp), %r12
	movl	52(%rbp), %edx
	movq	40(%rbp), %rdi
	movq	%r12, %rsi
	call	*16(%rbp)
	movq	192(%rbp), %rdx
	subq	208(%rbp), %rdx
	addl	%edx, 184(%rbp)
	leaq	57(%rbp), %rdx
	testl	%eax, %eax
	jne	.L3928
	movl	$0, 48(%rbp)
	movq	%rdx, %r12
	movb	$0, 56(%rbp)
.L3929:
	vmovq	%rdx, %xmm1
	vpinsrq	$1, %r12, %xmm1, %xmm0
	vmovdqu	%xmm0, 192(%rbp)
	jmp	.L3927
	.p2align 4
	.p2align 3
.L3940:
	cmpl	$108, %eax
	jne	.L3935
	movq	%rbp, %rdi
	call	stbi__get32le
	movq	%rbp, %rdi
	movl	%eax, 12(%rbx)
	call	stbi__get32le
	movq	%rbp, %rdi
	movl	%eax, 16(%rbx)
	call	stbi__get32le
	movq	%rbp, %rdi
	movl	%eax, 20(%rbx)
	call	stbi__get32le
	movl	%eax, 24(%rbx)
	testl	%r13d, %r13d
	je	.L3984
.L3947:
	movq	%rbp, %rdi
	movl	$12, %ebx
	call	stbi__get32le
	.p2align 4
	.p2align 3
.L3950:
	movq	%rbp, %rdi
	call	stbi__get32le
	decl	%ebx
	jne	.L3950
	cmpl	$124, %r12d
	jne	.L3973
	movq	%rbp, %rdi
	call	stbi__get32le
	movq	%rbp, %rdi
	call	stbi__get32le
	movq	%rbp, %rdi
	call	stbi__get32le
	movq	%rbp, %rdi
	call	stbi__get32le
	movl	$1, %eax
	jmp	.L3908
	.p2align 4
	.p2align 3
.L3928:
	cltq
	addq	%rax, %r12
	jmp	.L3929
	.p2align 4
	.p2align 3
.L3923:
	cltq
	addq	%r12, %rax
	jmp	.L3924
	.p2align 4
	.p2align 3
.L3912:
	cltq
	addq	%r12, %rax
	jmp	.L3913
	.p2align 4
	.p2align 3
.L3917:
	cltq
	addq	%r12, %rax
	jmp	.L3918
	.p2align 4
	.p2align 3
.L3977:
	leaq	.LC153(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L3908
	.p2align 4
	.p2align 3
.L3978:
	leaq	.LC154(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L3908
	.p2align 4
	.p2align 3
.L3979:
	movq	%rbp, %rdi
	call	stbi__get32le
	movq	%rbp, %rdi
	call	stbi__get32le
	movq	%rbp, %rdi
	call	stbi__get32le
	movq	%rbp, %rdi
	call	stbi__get32le
	jmp	.L3941
	.p2align 4
	.p2align 3
.L3980:
	cmpl	$16, %eax
	je	.L3985
	vmovdqa	.LC156(%rip), %xmm0
	movl	$0, 28(%rbx)
	movl	$1, %eax
	vmovdqu	%xmm0, 12(%rbx)
	jmp	.L3908
	.p2align 4
	.p2align 3
.L3984:
	movl	(%rbx), %eax
	cmpl	$16, %eax
	je	.L3986
	cmpl	$32, %eax
	je	.L3987
	vpxor	%xmm0, %xmm0, %xmm0
	vmovdqu	%xmm0, 12(%rbx)
	jmp	.L3947
.L3985:
	movq	.LC155(%rip), %rax
	movl	$31, 20(%rbx)
	movq	%rax, 12(%rbx)
	movl	$1, %eax
	jmp	.L3908
.L3986:
	movq	.LC155(%rip), %rax
	movl	$31, 20(%rbx)
	movq	%rax, 12(%rbx)
	jmp	.L3947
.L3987:
	vmovdqa	.LC156(%rip), %xmm0
	movl	$0, 28(%rbx)
	vmovdqu	%xmm0, 12(%rbx)
	jmp	.L3947
	.cfi_endproc
.LFE842:
	.size	stbi__bmp_parse_header.part.0, .-stbi__bmp_parse_header.part.0
	.section	.rodata.str1.1
.LC157:
	.string	"bad png sig"
.LC158:
	.string	"multiple IHDR"
.LC159:
	.string	"bad IHDR len"
.LC160:
	.string	"1/2/4/8/16-bit only"
.LC161:
	.string	"bad ctype"
.LC162:
	.string	"bad comp method"
.LC163:
	.string	"bad filter method"
.LC164:
	.string	"bad interlace method"
.LC165:
	.string	"0-pixel image"
.LC166:
	.string	"first not IHDR"
.LC167:
	.string	"invalid PLTE"
.LC168:
	.string	"tRNS after IDAT"
.LC169:
	.string	"tRNS before PLTE"
.LC170:
	.string	"bad tRNS len"
.LC171:
	.string	"tRNS with alpha"
.LC172:
	.string	"no PLTE"
.LC173:
	.string	"outofdata"
.LC174:
	.string	"no IDAT"
.LC183:
	.string	"out_n == 2 || out_n == 4"
.LC184:
	.string	"s->img_out_n == 4"
	.text
	.p2align 4
	.type	stbi__parse_png_file, @function
stbi__parse_png_file:
.LFB715:
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
	subq	$4096, %rsp
	.cfi_def_cfa_offset 4152
	orq	$0, (%rsp)
	subq	$1352, %rsp
	.cfi_def_cfa_offset 5504
	vpxor	%xmm0, %xmm0, %xmm0
	movq	(%rdi), %r14
	movl	%edx, 60(%rsp)
	movq	%rdi, 8(%rsp)
	movl	%esi, 48(%rsp)
	movq	%fs:40, %rax
	movq	%rax, 5432(%rsp)
	xorl	%eax, %eax
	vmovdqu	%xmm0, 8(%rdi)
	movq	192(%r14), %rdx
	movq	200(%r14), %rax
	movw	$0, 4397(%rsp)
	movb	$0, 4399(%rsp)
	movq	$0, 24(%rdi)
	cmpq	%rax, %rdx
	jb	.L3989
	movl	48(%r14), %r13d
	testl	%r13d, %r13d
	jne	.L4253
	.p2align 4
	.p2align 3
.L3990:
	leaq	.LC157(%rip), %rax
	xorl	%r15d, %r15d
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
.L3988:
	movq	5432(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L4254
	addq	$5448, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movl	%r15d, %eax
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
	.p2align 4
	.p2align 3
.L3989:
	.cfi_restore_state
	leaq	1(%rdx), %rcx
	movq	%rcx, 192(%r14)
	movzbl	(%rdx), %edx
.L3992:
	cmpb	$-119, %dl
	jne	.L3990
	cmpq	%rax, %rcx
	jb	.L3993
	movl	48(%r14), %r12d
	testl	%r12d, %r12d
	je	.L3990
	leaq	56(%r14), %rbx
	movl	52(%r14), %edx
	movq	40(%r14), %rdi
	movq	%rbx, %rsi
	call	*16(%r14)
	movq	192(%r14), %rdx
	subq	208(%r14), %rdx
	addl	%edx, 184(%r14)
	leaq	57(%r14), %rdx
	testl	%eax, %eax
	je	.L3994
	cltq
	vmovq	%rdx, %xmm3
	movzbl	56(%r14), %ecx
	addq	%rbx, %rax
	vpinsrq	$1, %rax, %xmm3, %xmm0
	vmovdqu	%xmm0, 192(%r14)
	jmp	.L3995
	.p2align 4
	.p2align 3
.L3993:
	leaq	1(%rcx), %rdx
	movq	%rdx, 192(%r14)
	movzbl	(%rcx), %ecx
.L3995:
	cmpb	$80, %cl
	jne	.L3990
	cmpq	%rax, %rdx
	jb	.L3996
	movl	48(%r14), %ebp
	testl	%ebp, %ebp
	je	.L3990
	leaq	56(%r14), %rbx
	movl	52(%r14), %edx
	movq	40(%r14), %rdi
	movq	%rbx, %rsi
	call	*16(%r14)
	movq	192(%r14), %rdx
	leaq	57(%r14), %rcx
	subq	208(%r14), %rdx
	addl	%edx, 184(%r14)
	testl	%eax, %eax
	je	.L3997
	cltq
	vmovq	%rcx, %xmm6
	movzbl	56(%r14), %edx
	addq	%rbx, %rax
	vpinsrq	$1, %rax, %xmm6, %xmm0
	vmovdqu	%xmm0, 192(%r14)
	jmp	.L3998
	.p2align 4
	.p2align 3
.L3996:
	leaq	1(%rdx), %rcx
	movq	%rcx, 192(%r14)
	movzbl	(%rdx), %edx
.L3998:
	cmpb	$78, %dl
	jne	.L3990
	cmpq	%rax, %rcx
	jb	.L3999
	movl	48(%r14), %ebx
	testl	%ebx, %ebx
	je	.L3990
	leaq	56(%r14), %rbx
	movl	52(%r14), %edx
	movq	40(%r14), %rdi
	movq	%rbx, %rsi
	call	*16(%r14)
	movq	192(%r14), %rdx
	subq	208(%r14), %rdx
	addl	%edx, 184(%r14)
	leaq	57(%r14), %rdx
	testl	%eax, %eax
	je	.L4000
	cltq
	vmovq	%rdx, %xmm3
	movzbl	56(%r14), %ecx
	addq	%rbx, %rax
	vpinsrq	$1, %rax, %xmm3, %xmm0
	vmovdqu	%xmm0, 192(%r14)
	jmp	.L4001
	.p2align 4
	.p2align 3
.L3999:
	leaq	1(%rcx), %rdx
	movq	%rdx, 192(%r14)
	movzbl	(%rcx), %ecx
.L4001:
	cmpb	$71, %cl
	jne	.L3990
	cmpq	%rax, %rdx
	jb	.L4002
	movl	48(%r14), %r11d
	testl	%r11d, %r11d
	je	.L3990
	leaq	56(%r14), %rbx
	movl	52(%r14), %edx
	movq	40(%r14), %rdi
	movq	%rbx, %rsi
	call	*16(%r14)
	movq	192(%r14), %rdx
	leaq	57(%r14), %rcx
	subq	208(%r14), %rdx
	addl	%edx, 184(%r14)
	testl	%eax, %eax
	je	.L4003
	cltq
	vmovq	%rcx, %xmm2
	movzbl	56(%r14), %edx
	addq	%rbx, %rax
	vpinsrq	$1, %rax, %xmm2, %xmm0
	vmovdqu	%xmm0, 192(%r14)
	jmp	.L4004
	.p2align 4
	.p2align 3
.L4002:
	leaq	1(%rdx), %rcx
	movq	%rcx, 192(%r14)
	movzbl	(%rdx), %edx
.L4004:
	cmpb	$13, %dl
	jne	.L3990
	cmpq	%rax, %rcx
	jb	.L4005
	movl	48(%r14), %r10d
	testl	%r10d, %r10d
	je	.L3990
	leaq	56(%r14), %rbx
	movl	52(%r14), %edx
	movq	40(%r14), %rdi
	movq	%rbx, %rsi
	call	*16(%r14)
	movq	192(%r14), %rdx
	subq	208(%r14), %rdx
	addl	%edx, 184(%r14)
	leaq	57(%r14), %rdx
	testl	%eax, %eax
	je	.L4006
	cltq
	vmovq	%rdx, %xmm7
	movzbl	56(%r14), %ecx
	addq	%rbx, %rax
	vpinsrq	$1, %rax, %xmm7, %xmm0
	vmovdqu	%xmm0, 192(%r14)
	jmp	.L4007
	.p2align 4
	.p2align 3
.L4005:
	leaq	1(%rcx), %rdx
	movq	%rdx, 192(%r14)
	movzbl	(%rcx), %ecx
.L4007:
	cmpb	$10, %cl
	jne	.L3990
	cmpq	%rax, %rdx
	jb	.L4008
	movl	48(%r14), %r9d
	testl	%r9d, %r9d
	je	.L3990
	leaq	56(%r14), %rbx
	movl	52(%r14), %edx
	movq	40(%r14), %rdi
	movq	%rbx, %rsi
	call	*16(%r14)
	movq	192(%r14), %rdx
	leaq	57(%r14), %rcx
	subq	208(%r14), %rdx
	addl	%edx, 184(%r14)
	testl	%eax, %eax
	jne	.L4255
	vmovq	%rcx, %xmm4
	vpunpcklqdq	%xmm4, %xmm4, %xmm0
	movl	$0, 48(%r14)
	movb	$0, 56(%r14)
	vmovdqu	%xmm0, 192(%r14)
	jmp	.L3990
	.p2align 4
	.p2align 3
.L4008:
	leaq	1(%rdx), %rcx
	movq	%rcx, 192(%r14)
	movzbl	(%rdx), %edx
.L4010:
	cmpb	$26, %dl
	jne	.L3990
	cmpq	%rax, %rcx
	jb	.L4256
	movl	48(%r14), %r8d
	testl	%r8d, %r8d
	je	.L3990
	leaq	56(%r14), %rbx
	movl	52(%r14), %edx
	movq	40(%r14), %rdi
	movq	%rbx, %rsi
	call	*16(%r14)
	movq	192(%r14), %rdx
	leaq	57(%r14), %rcx
	subq	208(%r14), %rdx
	addl	%edx, 184(%r14)
	testl	%eax, %eax
	jne	.L4013
	vmovq	%rcx, %xmm2
	vpunpcklqdq	%xmm2, %xmm2, %xmm0
	movl	$0, 48(%r14)
	movb	$0, 56(%r14)
	vmovdqu	%xmm0, 192(%r14)
	jmp	.L3990
	.p2align 4
	.p2align 3
.L4256:
	leaq	1(%rcx), %rax
	movq	%rax, 192(%r14)
	movzbl	(%rcx), %edx
.L4012:
	cmpb	$10, %dl
	jne	.L3990
	leaq	57(%r14), %rax
	movl	$0, 72(%rsp)
	movl	$0, 52(%rsp)
	movl	$1, %r15d
	movl	$0, 56(%rsp)
	xorl	%r13d, %r13d
	xorl	%r12d, %r12d
	movl	$0, 24(%rsp)
	movb	$0, 87(%rsp)
	movb	$0, 86(%rsp)
	movq	%r14, %rbx
	movq	%rax, 16(%rsp)
	.p2align 4
	.p2align 3
.L4014:
	movq	%rbx, %rdi
	call	stbi__get32be
	movq	%rbx, %rdi
	movl	%eax, %ebp
	call	stbi__get32be
	cmpl	$1229472850, %eax
	je	.L4016
	ja	.L4017
	cmpl	$1229209940, %eax
	je	.L4018
	cmpl	$1229278788, %eax
	jne	.L4257
	movq	%rbx, %r14
	testl	%r15d, %r15d
	jne	.L4062
	movl	48(%rsp), %r11d
	testl	%r11d, %r11d
	jne	.L4043
	movq	8(%rsp), %rax
	movq	8(%rax), %rbp
	testq	%rbp, %rbp
	je	.L4258
	movq	%rax, %r13
	movl	4(%rbx), %eax
	movl	(%rbx), %ebx
	imull	32(%r13), %ebx
	movl	8(%r14), %edx
	movl	72(%rsp), %r12d
	imull	%eax, %edx
	xorl	$1, %r12d
	addl	$7, %ebx
	shrl	$3, %ebx
	imull	%edx, %ebx
	addl	%eax, %ebx
	movslq	%ebx, %rbx
	movq	%rbx, %rdi
	call	malloc@PLT
	vmovq	%rax, %xmm4
	vpunpcklqdq	%xmm4, %xmm4, %xmm1
	testq	%rax, %rax
	je	.L4083
	movslq	24(%rsp), %rdx
	addq	%rbx, %rax
	vmovq	%rbp, %xmm5
	movl	%r12d, %esi
	movq	%rax, 328(%rsp)
	leaq	288(%rsp), %rax
	vmovdqu	%xmm1, 312(%rsp)
	movq	%rax, %rdi
	movl	$1, 336(%rsp)
	movq	%rax, 88(%rsp)
	addq	%rbp, %rdx
	vpinsrq	$1, %rdx, %xmm5, %xmm0
	vmovdqa	%xmm0, 288(%rsp)
	call	stbi__parse_zlib
	movl	%eax, %r15d
	testl	%eax, %eax
	je	.L4084
	movq	320(%rsp), %rax
	movl	312(%rsp), %ecx
	subl	%eax, %ecx
	movq	%rax, 16(%r13)
	movl	%ecx, 140(%rsp)
	testq	%rax, %rax
	je	.L4250
	movq	8(%rsp), %rbx
	movq	8(%rbx), %rdi
	call	free@PLT
	movl	8(%r14), %eax
	movq	$0, 8(%rbx)
	movl	%eax, 136(%rsp)
	incl	%eax
	cmpl	60(%rsp), %eax
	je	.L4259
.L4087:
	cmpb	$0, 87(%rsp)
	cmove	136(%rsp), %eax
	movl	%eax, 136(%rsp)
.L4088:
	movq	8(%rsp), %rsi
	movl	%eax, 12(%r14)
	movl	56(%rsp), %r10d
	movl	32(%rsi), %ebx
	movq	16(%rsi), %rcx
	movq	(%rsi), %r15
	movq	%rcx, 144(%rsp)
	cmpl	$16, %ebx
	movl	%eax, %ecx
	leal	(%rax,%rax), %eax
	cmovne	%ecx, %eax
	movl	4(%r15), %r9d
	movl	%ebx, 152(%rsp)
	movl	(%r15), %ebp
	movl	%eax, 48(%rsp)
	testl	%r10d, %r10d
	je	.L4260
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movl	%r9d, %esi
	movl	%ebp, %edi
	movl	%eax, %ebx
	movl	%r9d, 16(%rsp)
	call	stbi__malloc_mad3
	movq	%rax, 24(%rsp)
	testq	%rax, %rax
	je	.L4093
	leaq	192(%rsp), %rax
	movslq	%ebx, %r12
	movq	%r15, %rcx
	movl	16(%rsp), %r9d
	movq	%rax, 112(%rsp)
	leaq	256(%rsp), %rax
	movq	$0, 40(%rsp)
	movq	%r12, %r15
	movq	%rax, 128(%rsp)
	leaq	224(%rsp), %rax
	movq	%r14, 168(%rsp)
	movq	%rax, 120(%rsp)
	jmp	.L4100
	.p2align 4
	.p2align 3
.L4094:
	addq	$4, 40(%rsp)
	movq	40(%rsp), %rax
	cmpq	$28, %rax
	je	.L4099
	movq	8(%rsp), %rax
	movq	(%rax), %rcx
	movl	4(%rcx), %r9d
	movl	(%rcx), %ebp
.L4100:
	movq	.LC176(%rip), %rax
	vmovdqa	.LC175(%rip), %xmm4
	movl	$0, 216(%rsp)
	movl	$1, 280(%rsp)
	xorl	%edx, %edx
	movl	$1, 248(%rsp)
	movl	$2, 312(%rsp)
	movq	40(%rsp), %rsi
	vmovdqa	.LC179(%rip), %xmm2
	movq	%rax, 208(%rsp)
	movq	.LC178(%rip), %rax
	vmovdqa	.LC177(%rip), %xmm3
	vmovdqa	.LC181(%rip), %xmm1
	movq	%rax, 240(%rsp)
	movq	.LC180(%rip), %rax
	vmovdqa	%xmm4, 192(%rsp)
	vmovdqa	%xmm2, 256(%rsp)
	movq	%rax, 272(%rsp)
	movq	.LC182(%rip), %rax
	vmovdqa	%xmm3, 224(%rsp)
	vmovdqa	%xmm1, 288(%rsp)
	movq	%rax, 304(%rsp)
	movq	112(%rsp), %rax
	movl	(%rax,%rsi), %r14d
	movq	128(%rsp), %rax
	movl	(%rax,%rsi), %ebx
	movl	%ebx, %eax
	subl	%r14d, %eax
	leal	-1(%rbp,%rax), %eax
	divl	%ebx
	movq	120(%rsp), %rdx
	movl	(%rdx,%rsi), %ebp
	movq	88(%rsp), %rdx
	movl	(%rdx,%rsi), %esi
	xorl	%edx, %edx
	movl	%esi, 80(%rsp)
	movl	%eax, 16(%rsp)
	movl	%esi, %eax
	subl	%ebp, %eax
	leal	-1(%r9,%rax), %eax
	divl	%esi
	movl	%eax, 76(%rsp)
	movl	16(%rsp), %esi
	testl	%esi, %esi
	je	.L4094
	testl	%eax, %eax
	je	.L4094
	movl	16(%rsp), %r12d
	movl	%eax, %r13d
	movl	8(%rcx), %eax
	movl	152(%rsp), %ecx
	movl	%r13d, %r9d
	imull	%r12d, %eax
	movl	%r12d, %r8d
	imull	%ecx, %eax
	addl	$7, %eax
	sarl	$3, %eax
	incl	%eax
	imull	%r13d, %eax
	movl	%eax, 156(%rsp)
	movl	52(%rsp), %eax
	pushq	%rax
	.cfi_def_cfa_offset 5512
	pushq	%rcx
	.cfi_def_cfa_offset 5520
	movl	152(%rsp), %ecx
	movl	156(%rsp), %edx
	movq	160(%rsp), %rsi
	movq	24(%rsp), %rdi
	call	stbi__create_png_image_raw
	popq	%rdx
	.cfi_def_cfa_offset 5512
	popq	%rcx
	.cfi_def_cfa_offset 5504
	testl	%eax, %eax
	je	.L4095
	movq	8(%rsp), %rax
	movq	24(%rax), %rsi
	movq	%rsi, 160(%rsp)
	testl	%r13d, %r13d
	jle	.L4096
	testl	%r12d, %r12d
	jle	.L4096
	movl	48(%rsp), %ecx
	movq	%rsi, 64(%rsp)
	movl	$0, 56(%rsp)
	movl	%ecx, %eax
	imull	%ecx, %ebx
	imull	%r12d, %eax
	imull	%ecx, %r14d
	cltq
	movq	%rax, 104(%rsp)
	movslq	%ebx, %rax
	movq	%rax, 32(%rsp)
	movslq	%r14d, %rax
	movq	%rax, 96(%rsp)
	.p2align 4
	.p2align 3
.L4097:
	movq	8(%rsp), %rax
	xorl	%r12d, %r12d
	movq	96(%rsp), %r13
	movq	64(%rsp), %r14
	movq	(%rax), %rbx
	movq	%r15, %rax
	movl	%r12d, %r15d
	movq	%r13, %rcx
	movq	%r14, %r12
	movq	%rax, %r14
	movq	%rbx, %r13
	movq	%rcx, %rbx
	.p2align 4
	.p2align 3
.L4098:
	movl	48(%rsp), %edi
	imull	0(%r13), %edi
	movq	%r12, %rsi
	movq	%r14, %rdx
	incl	%r15d
	addq	%r14, %r12
	imull	%ebp, %edi
	addq	%rbx, %rdi
	addq	24(%rsp), %rdi
	call	memcpy@PLT
	addq	32(%rsp), %rbx
	cmpl	%r15d, 16(%rsp)
	jne	.L4098
	incl	56(%rsp)
	movq	104(%rsp), %rsi
	movq	%r14, %r15
	addq	%rsi, 64(%rsp)
	addl	80(%rsp), %ebp
	movl	56(%rsp), %eax
	cmpl	%eax, 76(%rsp)
	jne	.L4097
.L4096:
	movq	160(%rsp), %rdi
	call	free@PLT
	movl	156(%rsp), %eax
	addq	%rax, 144(%rsp)
	subl	%eax, 140(%rsp)
	jmp	.L4094
	.p2align 4
	.p2align 3
.L4017:
	cmpl	$1347179589, %eax
	je	.L4022
	cmpl	$1951551059, %eax
	jne	.L4021
	testl	%r15d, %r15d
	jne	.L4062
	movq	8(%rsp), %rax
	cmpq	$0, 8(%rax)
	jne	.L4261
	cmpb	$0, 86(%rsp)
	jne	.L4262
	movl	8(%rbx), %eax
	testb	$1, %al
	je	.L4263
	leal	(%rax,%rax), %edx
	cmpl	%ebp, %edx
	jne	.L4067
	movq	8(%rsp), %rcx
	cmpl	$16, 32(%rcx)
	je	.L4071
	xorl	%ebp, %ebp
	leaq	4397(%rsp), %r14
	testl	%eax, %eax
	jle	.L4248
	movq	%r14, %rax
	movq	%rbx, %r14
	movq	%rax, %rbx
.L4072:
	movq	%r14, %rdi
	call	stbi__get16be
	leaq	stbi__depth_scale_table(%rip), %rsi
	movl	%eax, %r8d
	movq	8(%rsp), %rax
	movslq	32(%rax), %rcx
	movzbl	(%rsi,%rcx), %eax
	imull	%r8d, %eax
	movb	%al, (%rbx,%rbp)
	incq	%rbp
	cmpl	%ebp, 8(%r14)
	jg	.L4072
	movq	%r14, %rbx
.L4248:
	movb	$1, 87(%rsp)
	jmp	.L4024
	.p2align 4
	.p2align 3
.L4257:
	cmpl	$1130840649, %eax
	jne	.L4021
	movl	$1, 72(%rsp)
	testl	%ebp, %ebp
	je	.L4024
	js	.L4264
.L4148:
	movl	%ebp, %esi
	movq	%rbx, %rdi
	call	stbi__skip.part.0
	.p2align 4
	.p2align 3
.L4024:
	movq	%rbx, %rdi
	call	stbi__get32be
	jmp	.L4014
	.p2align 4
	.p2align 3
.L4016:
	testl	%r15d, %r15d
	je	.L4265
	cmpl	$13, %ebp
	jne	.L4266
	movq	%rbx, %rdi
	call	stbi__get32be
	movq	%rbx, %rdi
	movl	%eax, (%rbx)
	call	stbi__get32be
	movl	%eax, 4(%rbx)
	cmpl	$16777216, %eax
	ja	.L4029
	cmpl	$16777216, (%rbx)
	ja	.L4029
	movq	%rbx, %rdi
	call	stbi__get8
	movq	8(%rsp), %rcx
	movzbl	%al, %edx
	movl	%edx, 32(%rcx)
	cmpb	$16, %al
	jbe	.L4267
.L4030:
	leaq	.LC160(%rip), %rax
	xorl	%r15d, %r15d
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L3988
	.p2align 4
	.p2align 3
.L4018:
	testl	%r15d, %r15d
	jne	.L4062
	cmpb	$0, 86(%rsp)
	je	.L4074
	testl	%r13d, %r13d
	je	.L4268
.L4074:
	cmpl	$2, 48(%rsp)
	je	.L4269
	movl	24(%rsp), %eax
	leal	(%rax,%rbp), %r14d
	cmpl	%eax, %r14d
	jl	.L4250
	movq	8(%rsp), %rax
	movq	8(%rax), %rdi
	cmpl	%r12d, %r14d
	ja	.L4270
.L4077:
	movl	24(%rsp), %eax
	movl	%ebp, %edx
	leaq	(%rdi,%rax), %rsi
	movq	%rbx, %rdi
	call	stbi__getn
	testl	%eax, %eax
	je	.L4271
	movl	%r14d, 24(%rsp)
	jmp	.L4024
	.p2align 4
	.p2align 3
.L4021:
	testl	%r15d, %r15d
	jne	.L4062
	testl	$536870912, %eax
	je	.L4272
	testl	%ebp, %ebp
	je	.L4024
	jns	.L4148
.L4264:
	movq	200(%rbx), %rax
	movq	%rax, 192(%rbx)
	jmp	.L4024
	.p2align 4
	.p2align 3
.L4022:
	testl	%r15d, %r15d
	jne	.L4062
	cmpl	$768, %ebp
	ja	.L4046
	movl	$2863311531, %eax
	movl	%ebp, %r13d
	imulq	%rax, %r13
	shrq	$33, %r13
	leal	0(%r13,%r13,2), %eax
	cmpl	%ebp, %eax
	jne	.L4046
	cmpl	$2, %eax
	jbe	.L4155
	leaq	4400(%rsp), %r14
	leaq	56(%rbx), %rsi
	movl	%r12d, 32(%rsp)
	movq	192(%rbx), %rdx
	movq	%r14, %rcx
	movq	200(%rbx), %rax
	movl	%r13d, %r14d
	xorl	%ebp, %ebp
	movl	%r15d, 40(%rsp)
	movq	%rsi, %r12
	movq	%rcx, %r13
	jmp	.L4061
	.p2align 4
	.p2align 3
.L4047:
	movl	48(%rbx), %edi
	testl	%edi, %edi
	jne	.L4273
	movb	$0, 0(%r13,%rbp,4)
.L4052:
	movl	48(%rbx), %esi
	testl	%esi, %esi
	jne	.L4274
	movb	$0, 1(%r13,%rbp,4)
.L4057:
	movl	48(%rbx), %ecx
	xorl	%r15d, %r15d
	testl	%ecx, %ecx
	jne	.L4275
.L4058:
	movb	%r15b, 2(%r13,%rbp,4)
	movb	$-1, 3(%r13,%rbp,4)
	incq	%rbp
	cmpl	%ebp, %r14d
	jbe	.L4276
.L4061:
	cmpq	%rax, %rdx
	jnb	.L4047
	leaq	1(%rdx), %r8
	movq	%r8, 192(%rbx)
	movzbl	(%rdx), %edx
	movb	%dl, 0(%r13,%rbp,4)
	cmpq	%r8, %rax
	jbe	.L4156
.L4278:
	leaq	1(%r8), %rdi
	movq	%rdi, 192(%rbx)
	movzbl	(%r8), %edx
	movb	%dl, 1(%r13,%rbp,4)
	cmpq	%rdi, %rax
	jbe	.L4157
.L4277:
	leaq	1(%rdi), %rdx
	movq	%rdx, 192(%rbx)
	movzbl	(%rdi), %r15d
	jmp	.L4058
	.p2align 4
	.p2align 3
.L4275:
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%r12, %rsi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	movq	16(%rsp), %rdx
	testl	%eax, %eax
	jne	.L4059
	movl	$0, 48(%rbx)
	movq	%rdx, %rax
	vmovq	%rdx, %xmm7
	movb	$0, 56(%rbx)
.L4060:
	vpinsrq	$1, %rax, %xmm7, %xmm0
	vmovdqu	%xmm0, 192(%rbx)
	jmp	.L4058
	.p2align 4
	.p2align 3
.L4274:
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%r12, %rsi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	subq	208(%rbx), %rdx
	movq	16(%rsp), %rdi
	addl	%edx, 184(%rbx)
	testl	%eax, %eax
	jne	.L4055
	movl	$0, 48(%rbx)
	movq	%rdi, %rax
	xorl	%edx, %edx
	vmovq	%rdi, %xmm6
	movb	$0, 56(%rbx)
.L4056:
	vpinsrq	$1, %rax, %xmm6, %xmm0
	movb	%dl, 1(%r13,%rbp,4)
	vmovdqu	%xmm0, 192(%rbx)
	cmpq	%rdi, %rax
	ja	.L4277
.L4157:
	movq	%rdi, %rdx
	jmp	.L4057
	.p2align 4
	.p2align 3
.L4273:
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%r12, %rsi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	subq	208(%rbx), %rdx
	movq	16(%rsp), %r8
	addl	%edx, 184(%rbx)
	testl	%eax, %eax
	jne	.L4050
	movl	$0, 48(%rbx)
	movq	%r8, %rax
	xorl	%edx, %edx
	vmovq	%r8, %xmm5
	movb	$0, 56(%rbx)
.L4051:
	vpinsrq	$1, %rax, %xmm5, %xmm0
	movb	%dl, 0(%r13,%rbp,4)
	vmovdqu	%xmm0, 192(%rbx)
	cmpq	%r8, %rax
	ja	.L4278
.L4156:
	movq	%r8, %rdx
	jmp	.L4052
	.p2align 4
	.p2align 3
.L4276:
	movl	32(%rsp), %r12d
	movl	40(%rsp), %r15d
	movl	%r14d, %r13d
	jmp	.L4024
	.p2align 4
	.p2align 3
.L4055:
	cltq
	movzbl	56(%rbx), %edx
	vmovq	%rdi, %xmm6
	addq	%r12, %rax
	jmp	.L4056
	.p2align 4
	.p2align 3
.L4050:
	cltq
	movzbl	56(%rbx), %edx
	vmovq	%r8, %xmm5
	addq	%r12, %rax
	jmp	.L4051
	.p2align 4
	.p2align 3
.L4059:
	cltq
	movzbl	56(%rbx), %r15d
	vmovq	%rdx, %xmm7
	addq	%r12, %rax
	jmp	.L4060
	.p2align 4
	.p2align 3
.L4267:
	movq	$-65815, %rdx
	btq	%rax, %rdx
	jc	.L4030
	movq	%rbx, %rdi
	call	stbi__get8
	movl	%eax, %ebp
	movzbl	%al, %eax
	movl	%eax, 52(%rsp)
	cmpl	$6, %eax
	jg	.L4034
	cmpl	$3, 52(%rsp)
	je	.L4279
	testb	$1, %bpl
	jne	.L4034
.L4035:
	movq	%rbx, %rdi
	call	stbi__get8
	testb	%al, %al
	jne	.L4280
	movq	%rbx, %rdi
	call	stbi__get8
	testb	%al, %al
	jne	.L4281
	movq	%rbx, %rdi
	call	stbi__get8
	movzbl	%al, %eax
	movl	%eax, 56(%rsp)
	cmpl	$1, %eax
	jg	.L4282
	movl	(%rbx), %esi
	testl	%esi, %esi
	je	.L4039
	movl	4(%rbx), %edi
	testl	%edi, %edi
	je	.L4039
	cmpb	$0, 86(%rsp)
	jne	.L4041
	andl	$2, %ebp
	movl	$3, %eax
	movl	52(%rsp), %r8d
	cmovne	%eax, %r15d
	movl	$1073741824, %eax
	xorl	%edx, %edx
	divl	%esi
	xorl	%edx, %edx
	sarl	$2, %r8d
	addl	%r15d, %r8d
	movl	%r8d, 8(%rbx)
	divl	%r8d
	cmpl	%eax, %edi
	ja	.L4029
	cmpl	$2, 48(%rsp)
	jne	.L4246
	.p2align 4
	.p2align 3
.L4043:
	movl	$1, %r15d
	jmp	.L3988
	.p2align 4
	.p2align 3
.L4041:
	movl	$268435456, %eax
	xorl	%edx, %edx
	movl	$1, 8(%rbx)
	divl	%esi
	cmpl	%eax, %edi
	ja	.L4029
.L4246:
	xorl	%r15d, %r15d
	jmp	.L4024
	.p2align 4
	.p2align 3
.L4071:
	movb	$1, 87(%rsp)
	testl	%eax, %eax
	jle	.L4024
	xorl	%r14d, %r14d
	leaq	186(%rsp), %rbp
.L4073:
	movq	%rbx, %rdi
	call	stbi__get16be
	movw	%ax, 0(%rbp,%r14,2)
	incq	%r14
	cmpl	%r14d, 8(%rbx)
	jg	.L4073
	jmp	.L4248
	.p2align 4
	.p2align 3
.L4062:
	leaq	.LC166(%rip), %rax
	xorl	%r15d, %r15d
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L3988
	.p2align 4
	.p2align 3
.L4270:
	testl	%r12d, %r12d
	jne	.L4080
	movl	$4096, %r12d
	cmpl	%r12d, %ebp
	cmovnb	%ebp, %r12d
	cmpl	%r12d, %r14d
	jbe	.L4079
	.p2align 4
	.p2align 3
.L4080:
	addl	%r12d, %r12d
	cmpl	%r12d, %r14d
	ja	.L4080
.L4079:
	movl	%r12d, %esi
	call	realloc@PLT
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L4093
	movq	8(%rsp), %rax
	movq	%rdi, 8(%rax)
	jmp	.L4077
	.p2align 4
	.p2align 3
.L4253:
	leaq	56(%r14), %rbx
	movl	52(%r14), %edx
	movq	40(%r14), %rdi
	movq	%rbx, %rsi
	call	*16(%r14)
	movq	192(%r14), %rdx
	leaq	57(%r14), %rcx
	subq	208(%r14), %rdx
	addl	%edx, 184(%r14)
	testl	%eax, %eax
	je	.L3997
	cltq
	vmovq	%rcx, %xmm6
	movzbl	56(%r14), %edx
	addq	%rbx, %rax
	vpinsrq	$1, %rax, %xmm6, %xmm0
	vmovdqu	%xmm0, 192(%r14)
	jmp	.L3992
	.p2align 4
	.p2align 3
.L4279:
	movq	8(%rsp), %rax
	cmpl	$16, 32(%rax)
	je	.L4034
	movb	$3, 86(%rsp)
	jmp	.L4035
	.p2align 4
	.p2align 3
.L3997:
	vmovq	%rcx, %xmm7
	vpunpcklqdq	%xmm7, %xmm7, %xmm0
	movl	$0, 48(%r14)
	movb	$0, 56(%r14)
	vmovdqu	%xmm0, 192(%r14)
	jmp	.L3990
	.p2align 4
	.p2align 3
.L4262:
	cmpl	$2, 48(%rsp)
	je	.L4283
	testl	%r13d, %r13d
	je	.L4284
	cmpl	%ebp, %r13d
	jb	.L4067
	testl	%ebp, %ebp
	je	.L4247
	leal	-1(%rbp), %eax
	leaq	4403(%rsp), %r14
	leaq	4407(%rsp,%rax,4), %rbp
	.p2align 4
	.p2align 3
.L4069:
	movq	%rbx, %rdi
	addq	$4, %r14
	call	stbi__get8
	movb	%al, -4(%r14)
	cmpq	%rbp, %r14
	jne	.L4069
.L4247:
	movb	$4, 86(%rsp)
	jmp	.L4024
	.p2align 4
	.p2align 3
.L3994:
	vmovq	%rdx, %xmm2
	vpunpcklqdq	%xmm2, %xmm2, %xmm0
	movl	$0, 48(%r14)
	movb	$0, 56(%r14)
	vmovdqu	%xmm0, 192(%r14)
	jmp	.L3990
.L4258:
	leaq	.LC174(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L3988
.L4099:
	movq	8(%rsp), %rax
	movq	24(%rsp), %rcx
	movq	168(%rsp), %r14
	movq	%rcx, 24(%rax)
.L4092:
	cmpb	$0, 87(%rsp)
	je	.L4108
	movq	8(%rsp), %rbx
	movl	12(%r14), %esi
	movq	(%rbx), %rax
	leal	-2(%rsi), %edx
	andl	$-3, %edx
	movl	(%rax), %ecx
	imull	4(%rax), %ecx
	cmpl	$16, 32(%rbx)
	movq	24(%rbx), %rax
	je	.L4285
	testl	%edx, %edx
	jne	.L4286
	cmpl	$2, %esi
	je	.L4114
	testl	%ecx, %ecx
	je	.L4108
	movzbl	4397(%rsp), %esi
	movzbl	4398(%rsp), %edi
	leaq	(%rax,%rcx,4), %rdx
	movzbl	4399(%rsp), %r8d
	jmp	.L4119
	.p2align 4
	.p2align 3
.L4118:
	addq	$4, %rax
	cmpq	%rdx, %rax
	je	.L4108
.L4119:
	cmpb	%sil, (%rax)
	jne	.L4118
	cmpb	%dil, 1(%rax)
	jne	.L4118
	cmpb	%r8b, 2(%rax)
	jne	.L4118
	movb	$0, 3(%rax)
	jmp	.L4118
.L4106:
	testl	%ecx, %ecx
	je	.L4108
	leal	-1(%rcx), %edi
	movzwl	186(%rsp), %esi
	cmpl	$7, %edi
	jbe	.L4109
	vmovdqa	.LC13(%rip), %xmm1
	movl	%edi, %r8d
	vmovd	%esi, %xmm4
	movq	%rax, %rdx
	shrl	$3, %r8d
	vpbroadcastw	%xmm4, %xmm4
	vpxor	%xmm3, %xmm3, %xmm3
	decl	%r8d
	salq	$5, %r8
	leaq	32(%rax,%r8), %r8
.L4110:
	vpand	(%rdx), %xmm1, %xmm0
	vpand	16(%rdx), %xmm1, %xmm2
	addq	$32, %rdx
	vpackusdw	%xmm2, %xmm0, %xmm0
	vpcmpeqw	%xmm4, %xmm0, %xmm0
	vpcmpeqw	%xmm3, %xmm0, %xmm0
	vpextrw	$0, %xmm0, -30(%rdx)
	vpextrw	$1, %xmm0, -26(%rdx)
	vpextrw	$2, %xmm0, -22(%rdx)
	vpextrw	$3, %xmm0, -18(%rdx)
	vpextrw	$4, %xmm0, -14(%rdx)
	vpextrw	$5, %xmm0, -10(%rdx)
	vpextrw	$6, %xmm0, -6(%rdx)
	vpextrw	$7, %xmm0, -2(%rdx)
	cmpq	%rdx, %r8
	jne	.L4110
	movl	%edi, %edx
	andl	$-8, %edx
	movl	%edx, %edi
	leaq	(%rax,%rdi,4), %rax
.L4109:
	xorl	%edi, %edi
	cmpw	%si, (%rax)
	setne	%dil
	negl	%edi
	movw	%di, 2(%rax)
	leal	1(%rdx), %edi
	cmpl	%edi, %ecx
	jbe	.L4108
	xorl	%edi, %edi
	cmpw	%si, 4(%rax)
	setne	%dil
	negl	%edi
	movw	%di, 6(%rax)
	leal	2(%rdx), %edi
	cmpl	%edi, %ecx
	jbe	.L4108
	xorl	%edi, %edi
	cmpw	%si, 8(%rax)
	setne	%dil
	negl	%edi
	movw	%di, 10(%rax)
	leal	3(%rdx), %edi
	cmpl	%edi, %ecx
	jbe	.L4108
	xorl	%edi, %edi
	cmpw	%si, 12(%rax)
	setne	%dil
	negl	%edi
	movw	%di, 14(%rax)
	leal	4(%rdx), %edi
	cmpl	%edi, %ecx
	jbe	.L4108
	xorl	%edi, %edi
	cmpw	%si, 16(%rax)
	setne	%dil
	negl	%edi
	movw	%di, 18(%rax)
	leal	5(%rdx), %edi
	cmpl	%edi, %ecx
	jbe	.L4108
	xorl	%edi, %edi
	cmpw	%si, 20(%rax)
	setne	%dil
	negl	%edi
	movw	%di, 22(%rax)
	leal	6(%rdx), %edi
	cmpl	%edi, %ecx
	jbe	.L4108
	xorl	%edi, %edi
	cmpw	%si, 24(%rax)
	setne	%dil
	addl	$7, %edx
	negl	%edi
	movw	%di, 26(%rax)
	cmpl	%edx, %ecx
	jbe	.L4108
	xorl	%edx, %edx
	cmpw	%si, 28(%rax)
	setne	%dl
	negl	%edx
	movw	%dx, 30(%rax)
.L4108:
	movl	72(%rsp), %r11d
	testl	%r11d, %r11d
	je	.L4103
	movl	%fs:stbi__de_iphone_flag_set@tpoff, %r10d
	testl	%r10d, %r10d
	je	.L4122
	movl	%fs:stbi__de_iphone_flag_local@tpoff, %r9d
	testl	%r9d, %r9d
	setne	%al
.L4123:
	testb	%al, %al
	je	.L4103
	cmpl	$2, 12(%r14)
	jle	.L4103
	movq	8(%rsp), %rcx
	movq	(%rcx), %rax
	movq	24(%rcx), %rcx
	movl	(%rax), %edx
	imull	4(%rax), %edx
	movl	12(%rax), %eax
	cmpl	$3, %eax
	je	.L4287
	cmpl	$4, %eax
	jne	.L4288
	movl	%fs:stbi__unpremultiply_on_load_set@tpoff, %edi
	testl	%edi, %edi
	je	.L4129
	movl	%fs:stbi__unpremultiply_on_load_local@tpoff, %esi
	testl	%esi, %esi
	jne	.L4130
.L4131:
	testl	%edx, %edx
	je	.L4103
	leal	-1(%rdx), %esi
	cmpl	$15, %esi
	jbe	.L4165
	movl	%esi, %edi
	movq	%rcx, %rax
	shrl	$4, %edi
	decl	%edi
	salq	$6, %rdi
	leaq	64(%rcx,%rdi), %rdi
.L4137:
	vmovdqu	(%rax), %xmm3
	vmovdqu	16(%rax), %xmm2
	addq	$64, %rax
	vmovdqu	-32(%rax), %xmm1
	vmovdqu	-16(%rax), %xmm0
	vpextrb	$2, %xmm3, -64(%rax)
	vpextrb	$6, %xmm3, -60(%rax)
	vpextrb	$10, %xmm3, -56(%rax)
	vpextrb	$14, %xmm3, -52(%rax)
	vpextrb	$2, %xmm2, -48(%rax)
	vpextrb	$6, %xmm2, -44(%rax)
	vpextrb	$10, %xmm2, -40(%rax)
	vpextrb	$14, %xmm2, -36(%rax)
	vpextrb	$2, %xmm1, -32(%rax)
	vpextrb	$6, %xmm1, -28(%rax)
	vpextrb	$10, %xmm1, -24(%rax)
	vpextrb	$14, %xmm1, -20(%rax)
	vpextrb	$2, %xmm0, -16(%rax)
	vpextrb	$6, %xmm0, -12(%rax)
	vpextrb	$10, %xmm0, -8(%rax)
	vpextrb	$14, %xmm0, -4(%rax)
	vpextrb	$0, %xmm3, -62(%rax)
	vpextrb	$4, %xmm3, -58(%rax)
	vpextrb	$8, %xmm3, -54(%rax)
	vpextrb	$12, %xmm3, -50(%rax)
	vpextrb	$0, %xmm2, -46(%rax)
	vpextrb	$4, %xmm2, -42(%rax)
	vpextrb	$8, %xmm2, -38(%rax)
	vpextrb	$12, %xmm2, -34(%rax)
	vpextrb	$0, %xmm1, -30(%rax)
	vpextrb	$4, %xmm1, -26(%rax)
	vpextrb	$8, %xmm1, -22(%rax)
	vpextrb	$12, %xmm1, -18(%rax)
	vpextrb	$0, %xmm0, -14(%rax)
	vpextrb	$4, %xmm0, -10(%rax)
	vpextrb	$8, %xmm0, -6(%rax)
	vpextrb	$12, %xmm0, -2(%rax)
	cmpq	%rax, %rdi
	jne	.L4137
	movl	%esi, %eax
	andl	$-16, %eax
	movl	%eax, %esi
	leaq	(%rcx,%rsi,4), %rcx
.L4136:
	movzbl	(%rcx), %esi
	movzbl	2(%rcx), %edi
	movb	%sil, 2(%rcx)
	leal	1(%rax), %esi
	movb	%dil, (%rcx)
	cmpl	%esi, %edx
	jbe	.L4103
	movzbl	4(%rcx), %esi
	movzbl	6(%rcx), %edi
	movb	%sil, 6(%rcx)
	leal	2(%rax), %esi
	movb	%dil, 4(%rcx)
	cmpl	%esi, %edx
	jbe	.L4103
	movzbl	8(%rcx), %esi
	movzbl	10(%rcx), %edi
	movb	%sil, 10(%rcx)
	leal	3(%rax), %esi
	movb	%dil, 8(%rcx)
	cmpl	%esi, %edx
	jbe	.L4103
	movzbl	12(%rcx), %esi
	movzbl	14(%rcx), %edi
	movb	%sil, 14(%rcx)
	leal	4(%rax), %esi
	movb	%dil, 12(%rcx)
	cmpl	%esi, %edx
	jbe	.L4103
	movzbl	16(%rcx), %esi
	movzbl	18(%rcx), %edi
	movb	%sil, 18(%rcx)
	leal	5(%rax), %esi
	movb	%dil, 16(%rcx)
	cmpl	%esi, %edx
	jbe	.L4103
	movzbl	20(%rcx), %esi
	movzbl	22(%rcx), %edi
	movb	%sil, 22(%rcx)
	leal	6(%rax), %esi
	movb	%dil, 20(%rcx)
	cmpl	%esi, %edx
	jbe	.L4103
	movzbl	24(%rcx), %esi
	movzbl	26(%rcx), %edi
	movb	%sil, 26(%rcx)
	leal	7(%rax), %esi
	movb	%dil, 24(%rcx)
	cmpl	%esi, %edx
	jbe	.L4103
	movzbl	28(%rcx), %esi
	movzbl	30(%rcx), %edi
	movb	%sil, 30(%rcx)
	leal	8(%rax), %esi
	movb	%dil, 28(%rcx)
	cmpl	%esi, %edx
	jbe	.L4103
	movzbl	32(%rcx), %esi
	movzbl	34(%rcx), %edi
	movb	%sil, 34(%rcx)
	leal	9(%rax), %esi
	movb	%dil, 32(%rcx)
	cmpl	%esi, %edx
	jbe	.L4103
	movzbl	36(%rcx), %esi
	movzbl	38(%rcx), %edi
	movb	%sil, 38(%rcx)
	leal	10(%rax), %esi
	movb	%dil, 36(%rcx)
	cmpl	%esi, %edx
	jbe	.L4103
	movzbl	40(%rcx), %esi
	movzbl	42(%rcx), %edi
	movb	%sil, 42(%rcx)
	leal	11(%rax), %esi
	movb	%dil, 40(%rcx)
	cmpl	%esi, %edx
	jbe	.L4103
	movzbl	44(%rcx), %esi
	movzbl	46(%rcx), %edi
	movb	%sil, 46(%rcx)
	leal	12(%rax), %esi
	movb	%dil, 44(%rcx)
	cmpl	%esi, %edx
	jbe	.L4103
	movzbl	48(%rcx), %esi
	movzbl	50(%rcx), %edi
	movb	%sil, 50(%rcx)
	leal	13(%rax), %esi
	movb	%dil, 48(%rcx)
	cmpl	%esi, %edx
	jbe	.L4103
	movzbl	52(%rcx), %esi
	movzbl	54(%rcx), %edi
	movb	%sil, 54(%rcx)
	leal	14(%rax), %esi
	movb	%dil, 52(%rcx)
	cmpl	%esi, %edx
	jbe	.L4103
	movzbl	56(%rcx), %esi
	movzbl	58(%rcx), %edi
	addl	$15, %eax
	movb	%dil, 56(%rcx)
	movb	%sil, 58(%rcx)
	cmpl	%eax, %edx
	jbe	.L4103
	movzbl	60(%rcx), %eax
	movzbl	62(%rcx), %edx
	movb	%al, 62(%rcx)
	movb	%dl, 60(%rcx)
.L4103:
	cmpb	$0, 86(%rsp)
	je	.L4289
	movl	60(%rsp), %eax
	movzbl	86(%rsp), %r13d
	movq	8(%rsp), %rcx
	cmpl	$3, %eax
	movl	%r13d, 8(%r14)
	cmovge	%eax, %r13d
	movl	%r13d, 12(%r14)
	movq	(%rcx), %rdx
	movq	24(%rcx), %rbp
	movl	(%rdx), %eax
	imull	4(%rdx), %eax
	movl	%eax, %r12d
	testl	%eax, %eax
	jns	.L4290
.L4093:
	leaq	.LC16(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
.L4250:
	xorl	%r15d, %r15d
	jmp	.L3988
.L4000:
	vmovq	%rdx, %xmm4
	vpunpcklqdq	%xmm4, %xmm4, %xmm0
	movl	$0, 48(%r14)
	movb	$0, 56(%r14)
	vmovdqu	%xmm0, 192(%r14)
	jmp	.L3990
.L4003:
	vmovq	%rcx, %xmm6
	vpunpcklqdq	%xmm6, %xmm6, %xmm0
	movl	$0, 48(%r14)
	movb	$0, 56(%r14)
	vmovdqu	%xmm0, 192(%r14)
	jmp	.L3990
.L4006:
	vmovq	%rdx, %xmm3
	vpunpcklqdq	%xmm3, %xmm3, %xmm0
	movl	$0, 48(%r14)
	movb	$0, 56(%r14)
	vmovdqu	%xmm0, 192(%r14)
	jmp	.L3990
.L4255:
	cltq
	vmovq	%rcx, %xmm5
	movzbl	56(%r14), %edx
	addq	%rbx, %rax
	vpinsrq	$1, %rax, %xmm5, %xmm0
	vmovdqu	%xmm0, 192(%r14)
	jmp	.L4010
.L4013:
	cltq
	vmovq	%rcx, %xmm6
	movzbl	56(%r14), %edx
	addq	%rax, %rbx
	vpinsrq	$1, %rbx, %xmm6, %xmm0
	vmovdqu	%xmm0, 192(%r14)
	jmp	.L4012
.L4290:
	movl	$2147483647, %eax
	cltd
	idivl	%r13d
	cmpl	%r12d, %eax
	jl	.L4093
	movl	%r12d, %edi
	imull	%r13d, %edi
	movslq	%edi, %rdi
	call	malloc@PLT
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L4093
	cmpl	$3, %r13d
	je	.L4141
	movl	%r12d, %ecx
	xorl	%edx, %edx
	testl	%r12d, %r12d
	je	.L4143
	.p2align 4
	.p2align 3
.L4145:
	movzbl	0(%rbp,%rdx), %eax
	sall	$2, %eax
	cltq
	movl	4400(%rsp,%rax), %eax
	movl	%eax, (%rbx,%rdx,4)
	incq	%rdx
	cmpq	%rdx, %rcx
	jne	.L4145
.L4143:
	movq	%rbp, %rdi
	call	free@PLT
	movq	8(%rsp), %rax
	movq	%rbx, 24(%rax)
.L4146:
	movq	8(%rsp), %rbx
	movl	$1, %r15d
	movq	16(%rbx), %rdi
	call	free@PLT
	movq	$0, 16(%rbx)
	movq	%r14, %rdi
	call	stbi__get32be
	jmp	.L3988
.L4155:
	xorl	%r13d, %r13d
	jmp	.L4024
.L4260:
	movl	52(%rsp), %eax
	movl	%ebp, %r8d
	pushq	%rax
	.cfi_def_cfa_offset 5512
	movl	160(%rsp), %eax
	pushq	%rax
	.cfi_def_cfa_offset 5520
	movl	152(%rsp), %ecx
	movl	156(%rsp), %edx
	movq	160(%rsp), %rsi
	movq	24(%rsp), %rdi
	call	stbi__create_png_image_raw
	popq	%rdi
	.cfi_def_cfa_offset 5512
	popq	%r8
	.cfi_def_cfa_offset 5504
	testl	%eax, %eax
	je	.L4250
	jmp	.L4092
.L4259:
	cmpl	$3, 60(%rsp)
	je	.L4087
	cmpb	$0, 86(%rsp)
	jne	.L4087
	movl	60(%rsp), %eax
	movl	%eax, 136(%rsp)
	jmp	.L4088
.L4289:
	cmpb	$0, 87(%rsp)
	je	.L4146
	incl	8(%r14)
	jmp	.L4146
.L4029:
	leaq	.LC93(%rip), %rax
	xorl	%r15d, %r15d
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L3988
.L4084:
	movq	320(%rsp), %rdi
	call	free@PLT
	movq	8(%rsp), %rax
	movq	$0, 16(%rax)
	jmp	.L3988
.L4046:
	leaq	.LC167(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L3988
.L4034:
	leaq	.LC161(%rip), %rax
	xorl	%r15d, %r15d
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L3988
.L4039:
	leaq	.LC165(%rip), %rax
	xorl	%r15d, %r15d
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L3988
.L4122:
	movl	stbi__de_iphone_flag_global(%rip), %r8d
	testl	%r8d, %r8d
	setne	%al
	jmp	.L4123
.L4285:
	testl	%edx, %edx
	jne	.L4291
	cmpl	$2, %esi
	je	.L4106
	testl	%ecx, %ecx
	je	.L4108
	movzwl	186(%rsp), %esi
	movzwl	188(%rsp), %edi
	leaq	(%rax,%rcx,8), %rdx
	movzwl	190(%rsp), %r8d
	jmp	.L4112
.L4111:
	addq	$8, %rax
	cmpq	%rdx, %rax
	je	.L4108
.L4112:
	cmpw	%si, (%rax)
	jne	.L4111
	cmpw	%di, 2(%rax)
	jne	.L4111
	cmpw	%r8w, 4(%rax)
	jne	.L4111
	movw	$0, 6(%rax)
	jmp	.L4111
.L4141:
	testl	%r12d, %r12d
	je	.L4143
	movl	%r12d, %eax
	movq	%rbp, %rdi
	movq	%rbx, %rdx
	leaq	(%rax,%rax,2), %rsi
	addq	%rbx, %rsi
	.p2align 4
	.p2align 3
.L4144:
	movzbl	(%rdi), %eax
	addq	$3, %rdx
	incq	%rdi
	sall	$2, %eax
	cltq
	movzbl	4400(%rsp,%rax), %ecx
	movb	%cl, -3(%rdx)
	movzbl	4401(%rsp,%rax), %ecx
	movzbl	4402(%rsp,%rax), %eax
	movb	%cl, -2(%rdx)
	movb	%al, -1(%rdx)
	cmpq	%rsi, %rdx
	jne	.L4144
	jmp	.L4143
.L4265:
	leaq	.LC158(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L3988
.L4261:
	leaq	.LC168(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L3988
.L4266:
	leaq	.LC159(%rip), %rax
	xorl	%r15d, %r15d
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L3988
.L4268:
	leaq	.LC172(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L3988
.L4272:
	movbel	%eax, invalid_chunk.48(%rip)
	leaq	invalid_chunk.48(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L3988
.L4269:
	movzbl	86(%rsp), %eax
	movl	$1, %r15d
	movl	%eax, 8(%rbx)
	jmp	.L3988
.L4067:
	leaq	.LC170(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L3988
.L4271:
	leaq	.LC173(%rip), %rax
	xorl	%r15d, %r15d
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L3988
.L4280:
	leaq	.LC162(%rip), %rax
	xorl	%r15d, %r15d
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L3988
.L4281:
	leaq	.LC163(%rip), %rax
	xorl	%r15d, %r15d
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L3988
.L4282:
	leaq	.LC164(%rip), %rax
	xorl	%r15d, %r15d
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L3988
.L4114:
	testl	%ecx, %ecx
	je	.L4108
	leal	-1(%rcx), %r8d
	movzbl	4397(%rsp), %edi
	cmpl	$15, %r8d
	jbe	.L4116
	vmovdqa	.LC2(%rip), %xmm1
	movl	%r8d, %esi
	vmovd	%edi, %xmm4
	movq	%rax, %rdx
	shrl	$4, %esi
	vpbroadcastb	%xmm4, %xmm4
	vpxor	%xmm3, %xmm3, %xmm3
	decl	%esi
	salq	$5, %rsi
	leaq	32(%rax,%rsi), %rsi
.L4117:
	vpand	(%rdx), %xmm1, %xmm0
	vpand	16(%rdx), %xmm1, %xmm2
	addq	$32, %rdx
	vpackuswb	%xmm2, %xmm0, %xmm0
	vpcmpeqb	%xmm4, %xmm0, %xmm0
	vpcmpeqb	%xmm3, %xmm0, %xmm0
	vpextrb	$0, %xmm0, -31(%rdx)
	vpextrb	$1, %xmm0, -29(%rdx)
	vpextrb	$2, %xmm0, -27(%rdx)
	vpextrb	$3, %xmm0, -25(%rdx)
	vpextrb	$4, %xmm0, -23(%rdx)
	vpextrb	$5, %xmm0, -21(%rdx)
	vpextrb	$6, %xmm0, -19(%rdx)
	vpextrb	$7, %xmm0, -17(%rdx)
	vpextrb	$8, %xmm0, -15(%rdx)
	vpextrb	$9, %xmm0, -13(%rdx)
	vpextrb	$10, %xmm0, -11(%rdx)
	vpextrb	$11, %xmm0, -9(%rdx)
	vpextrb	$12, %xmm0, -7(%rdx)
	vpextrb	$13, %xmm0, -5(%rdx)
	vpextrb	$14, %xmm0, -3(%rdx)
	vpextrb	$15, %xmm0, -1(%rdx)
	cmpq	%rsi, %rdx
	jne	.L4117
	movl	%r8d, %edx
	andl	$-16, %edx
	movl	%edx, %esi
	leaq	(%rax,%rsi,2), %rax
.L4116:
	cmpb	%dil, (%rax)
	setne	%sil
	negl	%esi
	movb	%sil, 1(%rax)
	leal	1(%rdx), %esi
	cmpl	%esi, %ecx
	jbe	.L4108
	cmpb	%dil, 2(%rax)
	setne	%sil
	negl	%esi
	movb	%sil, 3(%rax)
	leal	2(%rdx), %esi
	cmpl	%esi, %ecx
	jbe	.L4108
	cmpb	%dil, 4(%rax)
	setne	%sil
	negl	%esi
	movb	%sil, 5(%rax)
	leal	3(%rdx), %esi
	cmpl	%esi, %ecx
	jbe	.L4108
	cmpb	%dil, 6(%rax)
	setne	%sil
	negl	%esi
	movb	%sil, 7(%rax)
	leal	4(%rdx), %esi
	cmpl	%esi, %ecx
	jbe	.L4108
	cmpb	%dil, 8(%rax)
	setne	%sil
	negl	%esi
	movb	%sil, 9(%rax)
	leal	5(%rdx), %esi
	cmpl	%esi, %ecx
	jbe	.L4108
	cmpb	%dil, 10(%rax)
	setne	%sil
	negl	%esi
	movb	%sil, 11(%rax)
	leal	6(%rdx), %esi
	cmpl	%esi, %ecx
	jbe	.L4108
	cmpb	%dil, 12(%rax)
	setne	%sil
	negl	%esi
	movb	%sil, 13(%rax)
	leal	7(%rdx), %esi
	cmpl	%esi, %ecx
	jbe	.L4108
	cmpb	%dil, 14(%rax)
	setne	%sil
	negl	%esi
	movb	%sil, 15(%rax)
	leal	8(%rdx), %esi
	cmpl	%esi, %ecx
	jbe	.L4108
	cmpb	%dil, 16(%rax)
	setne	%sil
	negl	%esi
	movb	%sil, 17(%rax)
	leal	9(%rdx), %esi
	cmpl	%esi, %ecx
	jbe	.L4108
	cmpb	%dil, 18(%rax)
	setne	%sil
	negl	%esi
	movb	%sil, 19(%rax)
	leal	10(%rdx), %esi
	cmpl	%esi, %ecx
	jbe	.L4108
	cmpb	%dil, 20(%rax)
	setne	%sil
	negl	%esi
	movb	%sil, 21(%rax)
	leal	11(%rdx), %esi
	cmpl	%esi, %ecx
	jbe	.L4108
	cmpb	%dil, 22(%rax)
	setne	%sil
	negl	%esi
	movb	%sil, 23(%rax)
	leal	12(%rdx), %esi
	cmpl	%esi, %ecx
	jbe	.L4108
	cmpb	%dil, 24(%rax)
	setne	%sil
	negl	%esi
	movb	%sil, 25(%rax)
	leal	13(%rdx), %esi
	cmpl	%esi, %ecx
	jbe	.L4108
	cmpb	%dil, 26(%rax)
	setne	%sil
	negl	%esi
	movb	%sil, 27(%rax)
	leal	14(%rdx), %esi
	cmpl	%esi, %ecx
	jbe	.L4108
	cmpb	%dil, 28(%rax)
	setne	%sil
	addl	$15, %edx
	negl	%esi
	movb	%sil, 29(%rax)
	cmpl	%edx, %ecx
	jbe	.L4108
	cmpb	%dil, 30(%rax)
	setne	%dl
	negl	%edx
	movb	%dl, 31(%rax)
	jmp	.L4108
.L4263:
	leaq	.LC171(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L3988
.L4095:
	movq	24(%rsp), %rdi
	movl	%eax, %r15d
	call	free@PLT
	jmp	.L3988
.L4284:
	leaq	.LC169(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L3988
.L4283:
	movl	$4, 8(%rbx)
	movl	$1, %r15d
	jmp	.L3988
.L4287:
	testl	%edx, %edx
	je	.L4103
	leal	-1(%rdx), %eax
	cmpl	$14, %eax
	jbe	.L4164
	movl	%edx, %esi
	movq	%rcx, %rax
	shrl	$4, %esi
	decl	%esi
	leaq	(%rsi,%rsi,2), %rsi
	salq	$4, %rsi
	leaq	48(%rcx,%rsi), %rsi
.L4126:
	vmovdqu	(%rax), %xmm1
	vmovdqu	16(%rax), %xmm2
	addq	$48, %rax
	vmovdqu	-16(%rax), %xmm0
	vpextrb	$2, %xmm1, -48(%rax)
	vpextrb	$5, %xmm1, -45(%rax)
	vpextrb	$8, %xmm1, -42(%rax)
	vpextrb	$11, %xmm1, -39(%rax)
	vpextrb	$14, %xmm1, -36(%rax)
	vpextrb	$1, %xmm2, -33(%rax)
	vpextrb	$4, %xmm2, -30(%rax)
	vpextrb	$7, %xmm2, -27(%rax)
	vpextrb	$10, %xmm2, -24(%rax)
	vpextrb	$13, %xmm2, -21(%rax)
	vpextrb	$0, %xmm0, -18(%rax)
	vpextrb	$3, %xmm0, -15(%rax)
	vpextrb	$6, %xmm0, -12(%rax)
	vpextrb	$9, %xmm0, -9(%rax)
	vpextrb	$12, %xmm0, -6(%rax)
	vpextrb	$15, %xmm0, -3(%rax)
	vpextrb	$0, %xmm1, -46(%rax)
	vpextrb	$3, %xmm1, -43(%rax)
	vpextrb	$6, %xmm1, -40(%rax)
	vpextrb	$9, %xmm1, -37(%rax)
	vpextrb	$12, %xmm1, -34(%rax)
	vpextrb	$15, %xmm1, -31(%rax)
	vpextrb	$2, %xmm2, -28(%rax)
	vpextrb	$5, %xmm2, -25(%rax)
	vpextrb	$8, %xmm2, -22(%rax)
	vpextrb	$11, %xmm2, -19(%rax)
	vpextrb	$14, %xmm2, -16(%rax)
	vpextrb	$1, %xmm0, -13(%rax)
	vpextrb	$4, %xmm0, -10(%rax)
	vpextrb	$7, %xmm0, -7(%rax)
	vpextrb	$10, %xmm0, -4(%rax)
	vpextrb	$13, %xmm0, -1(%rax)
	cmpq	%rsi, %rax
	jne	.L4126
	movl	%edx, %eax
	andl	$-16, %eax
	movl	%eax, %esi
	leaq	(%rsi,%rsi,2), %rsi
	addq	%rsi, %rcx
	cmpl	%eax, %edx
	je	.L4103
.L4125:
	movzbl	(%rcx), %esi
	movzbl	2(%rcx), %edi
	movb	%sil, 2(%rcx)
	leal	1(%rax), %esi
	movb	%dil, (%rcx)
	cmpl	%edx, %esi
	jnb	.L4103
	movzbl	3(%rcx), %esi
	movzbl	5(%rcx), %edi
	movb	%sil, 5(%rcx)
	leal	2(%rax), %esi
	movb	%dil, 3(%rcx)
	cmpl	%esi, %edx
	jbe	.L4103
	movzbl	6(%rcx), %esi
	movzbl	8(%rcx), %edi
	movb	%sil, 8(%rcx)
	leal	3(%rax), %esi
	movb	%dil, 6(%rcx)
	cmpl	%esi, %edx
	jbe	.L4103
	movzbl	9(%rcx), %esi
	movzbl	11(%rcx), %edi
	movb	%sil, 11(%rcx)
	leal	4(%rax), %esi
	movb	%dil, 9(%rcx)
	cmpl	%esi, %edx
	jbe	.L4103
	movzbl	12(%rcx), %esi
	movzbl	14(%rcx), %edi
	movb	%sil, 14(%rcx)
	leal	5(%rax), %esi
	movb	%dil, 12(%rcx)
	cmpl	%esi, %edx
	jbe	.L4103
	movzbl	15(%rcx), %esi
	movzbl	17(%rcx), %edi
	movb	%sil, 17(%rcx)
	leal	6(%rax), %esi
	movb	%dil, 15(%rcx)
	cmpl	%esi, %edx
	jbe	.L4103
	movzbl	18(%rcx), %esi
	movzbl	20(%rcx), %edi
	movb	%sil, 20(%rcx)
	leal	7(%rax), %esi
	movb	%dil, 18(%rcx)
	cmpl	%esi, %edx
	jbe	.L4103
	movzbl	21(%rcx), %esi
	movzbl	23(%rcx), %edi
	movb	%sil, 23(%rcx)
	leal	8(%rax), %esi
	movb	%dil, 21(%rcx)
	cmpl	%esi, %edx
	jbe	.L4103
	movzbl	24(%rcx), %esi
	movzbl	26(%rcx), %edi
	movb	%sil, 26(%rcx)
	leal	9(%rax), %esi
	movb	%dil, 24(%rcx)
	cmpl	%esi, %edx
	jbe	.L4103
	movzbl	27(%rcx), %esi
	movzbl	29(%rcx), %edi
	movb	%sil, 29(%rcx)
	leal	10(%rax), %esi
	movb	%dil, 27(%rcx)
	cmpl	%esi, %edx
	jbe	.L4103
	movzbl	30(%rcx), %esi
	movzbl	32(%rcx), %edi
	movb	%sil, 32(%rcx)
	leal	11(%rax), %esi
	movb	%dil, 30(%rcx)
	cmpl	%esi, %edx
	jbe	.L4103
	movzbl	33(%rcx), %esi
	movzbl	35(%rcx), %edi
	movb	%sil, 35(%rcx)
	leal	12(%rax), %esi
	movb	%dil, 33(%rcx)
	cmpl	%esi, %edx
	jbe	.L4103
	movzbl	36(%rcx), %esi
	movzbl	38(%rcx), %edi
	movb	%sil, 38(%rcx)
	leal	13(%rax), %esi
	movb	%dil, 36(%rcx)
	cmpl	%esi, %edx
	jbe	.L4103
	movzbl	39(%rcx), %esi
	movzbl	41(%rcx), %edi
	addl	$14, %eax
	movb	%dil, 39(%rcx)
	movb	%sil, 41(%rcx)
	cmpl	%eax, %edx
	jbe	.L4103
	movzbl	42(%rcx), %eax
	movzbl	44(%rcx), %edx
	movb	%al, 44(%rcx)
	movb	%dl, 42(%rcx)
	jmp	.L4103
.L4129:
	movl	stbi__unpremultiply_on_load_global(%rip), %eax
	testl	%eax, %eax
	je	.L4131
.L4130:
	movl	%edx, %eax
	leaq	(%rcx,%rax,4), %rdi
	testl	%edx, %edx
	je	.L4103
.L4134:
	movzbl	3(%rcx), %esi
	movzbl	(%rcx), %r10d
	movzbl	2(%rcx), %r9d
	testb	%sil, %sil
	je	.L4132
	movzbl	1(%rcx), %edx
	movl	%esi, %r8d
	addq	$4, %rcx
	shrb	%r8b
	movzbl	%r8b, %r8d
	movl	%edx, %eax
	sall	$8, %eax
	subl	%edx, %eax
	addl	%r8d, %eax
	cltd
	idivl	%esi
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
	cmpq	%rdi, %rcx
	jne	.L4134
	jmp	.L4103
.L4132:
	movb	%r10b, 2(%rcx)
	movb	%r9b, (%rcx)
	addq	$4, %rcx
	cmpq	%rdi, %rcx
	jne	.L4134
	jmp	.L4103
.L4254:
	call	__stack_chk_fail@PLT
.L4165:
	xorl	%eax, %eax
	jmp	.L4136
.L4083:
	movq	8(%rsp), %rax
	movq	$0, 16(%rax)
	jmp	.L3988
.L4164:
	xorl	%eax, %eax
	jmp	.L4125
.L4288:
	leaq	__PRETTY_FUNCTION__.44(%rip), %rcx
	movl	$4992, %edx
	leaq	.LC14(%rip), %rsi
	leaq	.LC184(%rip), %rdi
	call	__assert_fail@PLT
.L4291:
	leaq	__PRETTY_FUNCTION__.46(%rip), %rcx
	movl	$4884, %edx
	leaq	.LC14(%rip), %rsi
	leaq	.LC183(%rip), %rdi
	call	__assert_fail@PLT
.L4286:
	leaq	__PRETTY_FUNCTION__.45(%rip), %rcx
	movl	$4859, %edx
	leaq	.LC14(%rip), %rsi
	leaq	.LC183(%rip), %rdi
	call	__assert_fail@PLT
	.cfi_endproc
.LFE715:
	.size	stbi__parse_png_file, .-stbi__parse_png_file
	.section	.text.unlikely,"ax",@progbits
.LCOLDB185:
	.text
.LHOTB185:
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
	jb	.L4336
	movl	48(%rdi), %edi
	xorl	%r14d, %r14d
	testl	%edi, %edi
	jne	.L4337
.L4294:
	xorl	%ebp, %ebp
	cmpq	$0, 16(%rbx)
	leaq	57(%rbx), %rax
	leaq	56(%rbx), %r15
	movq	%rax, (%rsp)
	movl	%ebp, %r13d
	je	.L4318
.L4341:
	movq	40(%rbx), %rdi
	call	*32(%rbx)
	testl	%eax, %eax
	je	.L4319
	movl	48(%rbx), %eax
	testl	%eax, %eax
	je	.L4335
.L4318:
	movq	200(%rbx), %rax
	cmpq	%rax, 192(%rbx)
	jnb	.L4335
.L4319:
	cmpb	$10, %r14b
	je	.L4307
	movb	%r14b, (%r12,%rbp)
	cmpq	$1022, %rbp
	je	.L4338
	movq	192(%rbx), %rax
	movq	16(%rbx), %r8
	cmpq	200(%rbx), %rax
	jb	.L4339
	movl	48(%rbx), %edx
	xorl	%r14d, %r14d
	testl	%edx, %edx
	jne	.L4340
.L4315:
	incq	%rbp
	cmpq	$0, 16(%rbx)
	movl	%ebp, %r13d
	jne	.L4341
	jmp	.L4318
	.p2align 4
	.p2align 3
.L4339:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rbx)
	movzbl	(%rax), %r14d
	jmp	.L4315
	.p2align 4
	.p2align 3
.L4335:
	movslq	%r13d, %rbp
.L4307:
	movb	$0, (%r12,%rbp)
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%r12, %rax
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
	.p2align 4
	.p2align 3
.L4340:
	.cfi_restore_state
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%r15, %rsi
	call	*%r8
	movq	192(%rbx), %rdx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	testl	%eax, %eax
	je	.L4342
	movzbl	56(%rbx), %r14d
	cltq
	addq	%r15, %rax
.L4317:
	vmovq	(%rsp), %xmm1
	vpinsrq	$1, %rax, %xmm1, %xmm0
	vmovdqu	%xmm0, 192(%rbx)
	jmp	.L4315
	.p2align 4
	.p2align 3
.L4342:
	movq	(%rsp), %rax
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	jmp	.L4317
	.p2align 4
	.p2align 3
.L4336:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rdi)
	movzbl	(%rax), %r14d
	jmp	.L4294
	.p2align 4
	.p2align 3
.L4337:
	leaq	56(%rbx), %rbp
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%rbp, %rsi
	call	*%r8
	movq	192(%rbx), %rdx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	leaq	57(%rbx), %rdx
	testl	%eax, %eax
	jne	.L4295
	movl	$0, 48(%rbx)
	movq	%rdx, %rbp
	movb	$0, 56(%rbx)
.L4296:
	vmovq	%rdx, %xmm2
	vpinsrq	$1, %rbp, %xmm2, %xmm0
	vmovdqu	%xmm0, 192(%rbx)
	jmp	.L4294
	.p2align 4
	.p2align 3
.L4295:
	cltq
	movzbl	56(%rbx), %r14d
	addq	%rax, %rbp
	jmp	.L4296
.L4338:
	movq	16(%rbx), %rbp
	leaq	57(%rbx), %r13
	leaq	56(%rbx), %r14
	vmovq	%r13, %xmm4
	vpunpcklqdq	%xmm4, %xmm4, %xmm3
	vmovdqa	%xmm3, (%rsp)
.L4298:
	testq	%rbp, %rbp
	je	.L4306
.L4303:
	movq	40(%rbx), %rdi
	call	*32(%rbx)
	testl	%eax, %eax
	je	.L4305
	movl	48(%rbx), %esi
	testl	%esi, %esi
	je	.L4301
.L4306:
	movq	192(%rbx), %rax
	cmpq	200(%rbx), %rax
	jnb	.L4301
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rbx)
	cmpb	$10, (%rax)
	je	.L4301
	testq	%rbp, %rbp
	je	.L4300
.L4334:
	movq	16(%rbx), %rbp
	testq	%rbp, %rbp
	jne	.L4303
	jmp	.L4306
.L4305:
	movq	192(%rbx), %rax
	cmpq	200(%rbx), %rax
	jb	.L4343
	movl	48(%rbx), %ecx
	movq	16(%rbx), %rbp
	testl	%ecx, %ecx
	je	.L4298
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%r14, %rsi
	call	*%rbp
	movq	192(%rbx), %rdx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	testl	%eax, %eax
	jne	.L4312
	vmovdqa	(%rsp), %xmm5
	movq	16(%rbx), %rbp
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	vmovdqu	%xmm5, 192(%rbx)
	jmp	.L4298
.L4312:
	cltq
	vmovq	%r13, %xmm6
	addq	%r14, %rax
	cmpb	$10, 56(%rbx)
	vpinsrq	$1, %rax, %xmm6, %xmm0
	vmovdqu	%xmm0, 192(%rbx)
	jne	.L4334
.L4301:
	movl	$1023, %ebp
	jmp	.L4307
.L4343:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rbx)
	cmpb	$10, (%rax)
	jne	.L4334
	jmp	.L4301
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.type	stbi__hdr_gettoken.cold, @function
stbi__hdr_gettoken.cold:
.LFSB759:
.L4300:
	.cfi_def_cfa_offset 80
	.cfi_offset 3, -56
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
	.cfi_offset 15, -16
	movq	200(%rbx), %rdx
.L4302:
	movq	192(%rbx), %rax
	cmpq	%rax, %rdx
	jbe	.L4301
	leaq	1(%rax), %rcx
	movq	%rcx, 192(%rbx)
	cmpb	$10, (%rax)
	jne	.L4302
	jmp	.L4301
	.cfi_endproc
.LFE759:
	.text
	.size	stbi__hdr_gettoken, .-stbi__hdr_gettoken
	.section	.text.unlikely
	.size	stbi__hdr_gettoken.cold, .-stbi__hdr_gettoken.cold
.LCOLDE185:
	.text
.LHOTE185:
	.section	.rodata.str1.1
.LC186:
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
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rsi, %r14
	leaq	.LC186(%rip), %r15
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdx, %r13
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
	leaq	32(%rsp), %rbp
	cmove	%rax, %r14
	testq	%rdx, %rdx
	cmove	%rax, %r13
	testq	%rcx, %rcx
	cmovne	%rcx, %rax
	xorl	%r12d, %r12d
	movq	%rax, 8(%rsp)
	call	stbi__hdr_test
	testl	%eax, %eax
	jne	.L4348
	jmp	.L4365
	.p2align 4
	.p2align 3
.L4366:
	movq	%r15, %rsi
	call	strcmp@PLT
	testl	%eax, %eax
	movl	$1, %eax
	cmove	%eax, %r12d
.L4348:
	movq	%rbx, %rdi
	movq	%rbp, %rsi
	call	stbi__hdr_gettoken
	movq	%rax, 24(%rsp)
	cmpb	$0, (%rax)
	movq	%rax, %rdi
	jne	.L4366
	testl	%r12d, %r12d
	jne	.L4352
	vmovdqu	208(%rbx), %xmm1
	vmovdqu	%xmm1, 192(%rbx)
.L4344:
	movq	1064(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L4367
	addq	$1080, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movl	%r12d, %eax
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
	.p2align 4
	.p2align 3
.L4352:
	.cfi_restore_state
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	stbi__hdr_gettoken
	movq	%rax, 24(%rsp)
	cmpb	$45, (%rax)
	jne	.L4361
	cmpb	$89, 1(%rax)
	jne	.L4361
	cmpb	$32, 2(%rax)
	jne	.L4361
	leaq	3(%rax), %rdi
	movl	$10, %edx
	leaq	24(%rsp), %rsi
	movq	%rdi, 24(%rsp)
	call	strtol@PLT
	movq	24(%rsp), %rdx
	movl	%eax, 0(%r13)
	cmpb	$32, (%rdx)
	jne	.L4355
	leaq	1(%rdx), %rax
	.p2align 4
	.p2align 3
.L4356:
	movq	%rax, 24(%rsp)
	movq	%rax, %rdx
	incq	%rax
	cmpb	$32, -1(%rax)
	je	.L4356
.L4355:
	cmpb	$43, (%rdx)
	jne	.L4362
	cmpb	$88, 1(%rdx)
	jne	.L4362
	cmpb	$32, 2(%rdx)
	jne	.L4362
	leaq	3(%rdx), %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	movq	%rdi, 24(%rsp)
	call	strtol@PLT
	movl	%eax, (%r14)
	movq	8(%rsp), %rax
	movl	$3, (%rax)
	jmp	.L4344
	.p2align 4
	.p2align 3
.L4365:
	vmovdqu	208(%rbx), %xmm0
	movl	%eax, %r12d
	vmovdqu	%xmm0, 192(%rbx)
	jmp	.L4344
	.p2align 4
	.p2align 3
.L4361:
	vmovdqu	208(%rbx), %xmm2
	xorl	%r12d, %r12d
	vmovdqu	%xmm2, 192(%rbx)
	jmp	.L4344
	.p2align 4
	.p2align 3
.L4362:
	vmovdqu	208(%rbx), %xmm3
	xorl	%r12d, %r12d
	vmovdqu	%xmm3, 192(%rbx)
	jmp	.L4344
.L4367:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE762:
	.size	stbi__hdr_info, .-stbi__hdr_info
	.section	.rodata.str1.1
.LC187:
	.string	"#?RADIANCE"
.LC188:
	.string	"#?RGBE"
.LC189:
	.string	"not HDR"
.LC190:
	.string	"unsupported format"
.LC191:
	.string	"unsupported data layout"
	.section	.rodata.str1.8
	.align 8
.LC192:
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
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rsi, %r15
	movq	%rdi, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rcx, %r13
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$1176, %rsp
	.cfi_def_cfa_offset 1232
	leaq	128(%rsp), %rbp
	movq	%rdx, (%rsp)
	movl	%r8d, 56(%rsp)
	movq	%rbp, %rsi
	movq	%fs:40, %rax
	movq	%rax, 1160(%rsp)
	xorl	%eax, %eax
	call	stbi__hdr_gettoken
	leaq	.LC187(%rip), %rsi
	movq	%rax, %rdi
	movq	%rax, %r12
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L4450
	leaq	.LC188(%rip), %rsi
	movq	%r12, %rdi
	call	strcmp@PLT
	movl	%eax, %ebx
	testl	%eax, %eax
	jne	.L4453
.L4369:
	leaq	.LC186(%rip), %r12
	jmp	.L4371
	.p2align 4
	.p2align 3
.L4454:
	movq	%r12, %rsi
	call	strcmp@PLT
	testl	%eax, %eax
	movl	$1, %eax
	cmove	%eax, %ebx
.L4371:
	movq	%r14, %rdi
	movq	%rbp, %rsi
	call	stbi__hdr_gettoken
	movq	%rax, 112(%rsp)
	cmpb	$0, (%rax)
	movq	%rax, %rdi
	jne	.L4454
	testl	%ebx, %ebx
	je	.L4455
	movq	%rbp, %rsi
	movq	%r14, %rdi
	call	stbi__hdr_gettoken
	movq	%rax, 112(%rsp)
	cmpb	$45, (%rax)
	je	.L4456
.L4380:
	leaq	.LC191(%rip), %rax
	xorl	%r12d, %r12d
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
.L4368:
	movq	1160(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L4457
	addq	$1176, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%r12, %rax
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
	.p2align 4
	.p2align 3
.L4450:
	.cfi_restore_state
	movl	%eax, %ebx
	jmp	.L4369
	.p2align 4
	.p2align 3
.L4456:
	cmpb	$89, 1(%rax)
	jne	.L4380
	cmpb	$32, 2(%rax)
	jne	.L4380
	leaq	3(%rax), %rdi
	leaq	112(%rsp), %rsi
	movl	$10, %edx
	movq	%rdi, 112(%rsp)
	call	strtol@PLT
	movq	112(%rsp), %rdi
	movq	%rax, 24(%rsp)
	cmpb	$32, (%rdi)
	jne	.L4377
	leaq	1(%rdi), %rax
	.p2align 4
	.p2align 3
.L4378:
	movq	%rax, 112(%rsp)
	movq	%rax, %rdi
	incq	%rax
	cmpb	$32, -1(%rax)
	je	.L4378
.L4377:
	cmpb	$43, (%rdi)
	jne	.L4380
	cmpb	$88, 1(%rdi)
	jne	.L4380
	cmpb	$32, 2(%rdi)
	jne	.L4380
	movq	24(%rsp), %rbp
	addq	$3, %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	movq	%rdi, 112(%rsp)
	movl	%ebp, 60(%rsp)
	call	strtol@PLT
	movq	%rax, 40(%rsp)
	movl	%eax, 8(%rsp)
	cmpl	$16777216, %ebp
	jg	.L4382
	cmpl	$16777216, %eax
	jg	.L4382
	movl	%eax, (%r15)
	movl	24(%rsp), %ecx
	movq	(%rsp), %rax
	movl	%ecx, (%rax)
	testq	%r13, %r13
	je	.L4383
	movl	$3, 0(%r13)
.L4383:
	movl	56(%rsp), %ecx
	movl	$3, %eax
	testl	%ecx, %ecx
	cmovne	%ecx, %eax
	movq	40(%rsp), %rcx
	movl	%eax, 56(%rsp)
	movq	24(%rsp), %rax
	movl	%ecx, %esi
	orl	%eax, %esi
	js	.L4382
	testl	%eax, %eax
	je	.L4385
	movl	$2147483647, %eax
	cltd
	idivl	60(%rsp)
	cmpl	%eax, %ecx
	jg	.L4382
.L4385:
	movl	56(%rsp), %eax
	testl	%eax, %eax
	jns	.L4458
	.p2align 4
	.p2align 3
.L4382:
	leaq	.LC93(%rip), %rax
	xorl	%r12d, %r12d
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L4368
	.p2align 4
	.p2align 3
.L4455:
	leaq	.LC190(%rip), %rax
	xorl	%r12d, %r12d
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L4368
.L4453:
	leaq	.LC189(%rip), %rax
	xorl	%r12d, %r12d
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L4368
.L4458:
	movl	56(%rsp), %esi
	movl	$2147483647, %eax
	movl	40(%rsp), %ecx
	cltd
	imull	24(%rsp), %ecx
	idivl	%esi
	cmpl	%ecx, %eax
	jl	.L4382
	imull	%esi, %ecx
	movl	%esi, %edx
	cmpl	$536870911, %ecx
	jg	.L4382
	movl	60(%rsp), %esi
	movl	8(%rsp), %edi
	movl	$4, %ecx
	call	stbi__malloc_mad4.constprop.0
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L4459
	movl	40(%rsp), %eax
	subl	$8, %eax
	cmpl	$32759, %eax
	ja	.L4426
	movl	24(%rsp), %r9d
	testl	%r9d, %r9d
	jle	.L4368
	movq	40(%rsp), %rsi
	movl	$0, 80(%rsp)
	movl	$0, 84(%rsp)
	movq	%r14, %r15
	movq	$0, 32(%rsp)
	movl	%ebx, 92(%rsp)
	movq	%r12, 72(%rsp)
	movl	%esi, %eax
	sall	$2, %eax
	movq	%rax, 104(%rsp)
	movslq	56(%rsp), %rax
	movl	%eax, %ecx
	salq	$2, %rax
	imull	%esi, %ecx
	movq	%rax, 96(%rsp)
	leaq	57(%r14), %rax
	movq	%rax, (%rsp)
	movl	%ecx, 88(%rsp)
.L4418:
	movq	%r15, %rdi
	xorl	%ebx, %ebx
	call	stbi__get8
	movq	%r15, %rdi
	movl	%eax, %r13d
	call	stbi__get8
	movq	%r15, %rdi
	movl	%eax, %r14d
	movb	%r13b, %bl
	movl	%r14d, %eax
	movb	%al, %bh
	call	stbi__get8
	movzbl	%al, %edx
	cmpb	$2, %r13b
	jne	.L4449
	cmpb	$2, %r14b
	jne	.L4449
	testb	%al, %al
	js	.L4460
	sall	$8, %edx
	movq	%r15, %rdi
	movl	%edx, %ebx
	call	stbi__get8
	movzbl	%al, %eax
	orl	%ebx, %eax
	cmpl	%eax, 8(%rsp)
	jne	.L4461
	cmpq	$0, 32(%rsp)
	je	.L4462
.L4395:
	movq	$0, 48(%rsp)
.L4396:
	movl	8(%rsp), %edx
	testl	%edx, %edx
	je	.L4421
	movq	32(%rsp), %rsi
	movl	8(%rsp), %ecx
	movq	%r15, %r13
	xorl	%r14d, %r14d
	movq	192(%r15), %rax
	movq	200(%r15), %rdx
	addq	$4, %rsi
	movl	%ecx, %r15d
	movq	%rsi, 64(%rsp)
	jmp	.L4416
	.p2align 4
	.p2align 3
.L4397:
	movl	48(%r13), %r8d
	testl	%r8d, %r8d
	jne	.L4463
.L4399:
	movl	8(%rsp), %r15d
	subl	%r14d, %r15d
	testl	%r15d, %r15d
	jle	.L4464
.L4416:
	cmpq	%rdx, %rax
	jnb	.L4397
	leaq	1(%rax), %rsi
	movq	%rsi, 192(%r13)
	movzbl	(%rax), %r12d
.L4398:
	cmpb	$-128, %r12b
	jbe	.L4401
	cmpq	%rdx, %rsi
	jb	.L4465
	movl	48(%r13), %edi
	xorl	%ebx, %ebx
	testl	%edi, %edi
	jne	.L4466
.L4403:
	leal	-128(%r12), %ecx
	movzbl	%cl, %ecx
	cmpl	%r15d, %ecx
	jg	.L4409
	movq	48(%rsp), %rdi
	movslq	%r14d, %rax
	leaq	(%rdi,%rax,4), %rdi
	addq	32(%rsp), %rdi
	xorl	%eax, %eax
	.p2align 4
	.p2align 3
.L4407:
	movb	%bl, (%rdi,%rax,4)
	incq	%rax
	cmpl	%eax, %ecx
	jg	.L4407
	addl	%ecx, %r14d
.L4452:
	movq	%rsi, %rax
	jmp	.L4399
	.p2align 4
	.p2align 3
.L4463:
	leaq	56(%r13), %rbx
	movl	52(%r13), %edx
	movq	40(%r13), %rdi
	movq	%rbx, %rsi
	call	*16(%r13)
	movslq	%eax, %rdx
	movq	192(%r13), %rax
	subq	208(%r13), %rax
	addl	%eax, 184(%r13)
	movq	(%rsp), %rax
	testl	%edx, %edx
	jne	.L4400
	vmovq	%rax, %xmm2
	vpunpcklqdq	%xmm2, %xmm2, %xmm0
	movl	$0, 48(%r13)
	movq	%rax, %rdx
	movb	$0, 56(%r13)
	vmovdqu	%xmm0, 192(%r13)
	jmp	.L4399
	.p2align 4
	.p2align 3
.L4465:
	leaq	1(%rsi), %rax
	movq	%rax, 192(%r13)
	movzbl	(%rsi), %ebx
	movq	%rax, %rsi
	jmp	.L4403
	.p2align 4
	.p2align 3
.L4401:
	movzbl	%r12b, %eax
	movl	%eax, 16(%rsp)
	cmpl	%r15d, %eax
	jg	.L4409
	testl	%eax, %eax
	je	.L4452
	movq	48(%rsp), %rbx
	decl	%eax
	movslq	%r14d, %rcx
	leal	0(,%r14,4), %r15d
	addq	%rcx, %rax
	movslq	%r15d, %r15
	leaq	56(%r13), %r12
	leaq	(%rbx,%rax,4), %r9
	movq	64(%rsp), %rax
	addq	%rbx, %r15
	addq	32(%rsp), %r15
	leaq	(%r9,%rax), %rbx
	movq	%rsi, %rax
	jmp	.L4415
	.p2align 4
	.p2align 3
.L4411:
	movl	48(%r13), %esi
	xorl	%ebp, %ebp
	testl	%esi, %esi
	jne	.L4467
.L4412:
	movb	%bpl, (%r15)
	addq	$4, %r15
	cmpq	%rbx, %r15
	je	.L4468
.L4415:
	cmpq	%rax, %rdx
	jbe	.L4411
	leaq	1(%rax), %rcx
	addq	$4, %r15
	movq	%rcx, 192(%r13)
	movzbl	(%rax), %ebp
	movq	%rcx, %rax
	movb	%bpl, -4(%r15)
	cmpq	%rbx, %r15
	jne	.L4415
.L4468:
	addl	16(%rsp), %r14d
	jmp	.L4399
	.p2align 4
	.p2align 3
.L4467:
	movl	52(%r13), %edx
	movq	40(%r13), %rdi
	movq	%r12, %rsi
	call	*16(%r13)
	movslq	%eax, %rdx
	movq	192(%r13), %rax
	subq	208(%r13), %rax
	addl	%eax, 184(%r13)
	movq	(%rsp), %rax
	testl	%edx, %edx
	jne	.L4413
	movl	$0, 48(%r13)
	movq	%rax, %rdx
	vmovq	%rax, %xmm1
	movb	$0, 56(%r13)
.L4414:
	vpinsrq	$1, %rdx, %xmm1, %xmm0
	vmovdqu	%xmm0, 192(%r13)
	jmp	.L4412
	.p2align 4
	.p2align 3
.L4413:
	movzbl	56(%r13), %ebp
	addq	%r12, %rdx
	vmovq	%rax, %xmm1
	jmp	.L4414
	.p2align 4
	.p2align 3
.L4400:
	addq	%rbx, %rdx
	vmovq	%rax, %xmm3
	movzbl	56(%r13), %r12d
	movq	%rax, %rsi
	vpinsrq	$1, %rdx, %xmm3, %xmm0
	vmovdqu	%xmm0, 192(%r13)
	jmp	.L4398
.L4466:
	leaq	56(%r13), %r9
	movl	52(%r13), %edx
	movq	40(%r13), %rdi
	movq	%r9, %rsi
	movq	%r9, 16(%rsp)
	call	*16(%r13)
	movq	192(%r13), %rdx
	subq	208(%r13), %rdx
	addl	%edx, 184(%r13)
	testl	%eax, %eax
	movq	(%rsp), %rsi
	movq	16(%rsp), %r9
	jne	.L4404
	movl	$0, 48(%r13)
	movb	$0, 56(%r13)
	movq	%rsi, %rdx
	vmovq	%rsi, %xmm4
.L4405:
	vpinsrq	$1, %rdx, %xmm4, %xmm0
	vmovdqu	%xmm0, 192(%r13)
	jmp	.L4403
.L4426:
	xorl	%ebx, %ebx
.L4387:
	cmpl	%ebx, 24(%rsp)
	jle	.L4368
	movl	%ebx, %r15d
	xorl	%ebp, %ebp
	incl	%ebx
	cmpl	%ebp, 40(%rsp)
	jle	.L4387
.L4390:
	movl	40(%rsp), %r13d
	movl	56(%rsp), %eax
	imull	%r15d, %r13d
	imull	%eax, %r13d
	imull	%ebp, %eax
	incl	%ebp
	movslq	%r13d, %rcx
	leaq	124(%rsp), %r13
	movq	%rcx, 8(%rsp)
	movl	%eax, (%rsp)
.L4389:
	movl	$4, %edx
	movq	%r13, %rsi
	movq	%r14, %rdi
	call	stbi__getn
	movslq	(%rsp), %rax
	movq	%r13, %rsi
	addq	8(%rsp), %rax
	movl	56(%rsp), %edx
	leaq	(%r12,%rax,4), %rdi
	call	stbi__hdr_convert
	cmpl	%ebp, 40(%rsp)
	jg	.L4390
	jmp	.L4387
.L4464:
	movq	%r13, %r15
.L4421:
	incq	48(%rsp)
	movq	48(%rsp), %rax
	cmpq	$4, %rax
	jne	.L4396
	movl	8(%rsp), %ecx
	testl	%ecx, %ecx
	je	.L4423
	movslq	84(%rsp), %rax
	movq	72(%rsp), %rcx
	movq	96(%rsp), %rbp
	movl	56(%rsp), %r12d
	leaq	(%rcx,%rax,4), %r14
	movq	32(%rsp), %rcx
	movl	40(%rsp), %eax
	movq	%rcx, %r13
	leaq	(%rcx,%rax,4), %rbx
	.p2align 4
	.p2align 3
.L4422:
	movq	%r13, %rsi
	movq	%r14, %rdi
	movl	%r12d, %edx
	addq	$4, %r13
	call	stbi__hdr_convert
	addq	%rbp, %r14
	cmpq	%r13, %rbx
	jne	.L4422
.L4423:
	incl	80(%rsp)
	movl	88(%rsp), %edx
	movl	80(%rsp), %eax
	addl	%edx, 84(%rsp)
	cmpl	%eax, 60(%rsp)
	jne	.L4418
	movq	32(%rsp), %rdi
	movq	72(%rsp), %r12
	call	free@PLT
	jmp	.L4368
	.p2align 4
	.p2align 3
.L4409:
	movq	72(%rsp), %rdi
	xorl	%r12d, %r12d
	call	free@PLT
	movq	32(%rsp), %rdi
	call	free@PLT
	leaq	.LC132(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L4368
.L4404:
	cltq
	movzbl	56(%r13), %ebx
	vmovq	%rsi, %xmm4
	leaq	(%r9,%rax), %rdx
	jmp	.L4405
.L4462:
	movq	104(%rsp), %rdi
	call	malloc@PLT
	movq	%rax, 32(%rsp)
	testq	%rax, %rax
	jne	.L4395
	movq	72(%rsp), %rdi
	xorl	%r12d, %r12d
	call	free@PLT
	leaq	.LC16(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L4368
	.p2align 4
	.p2align 3
.L4449:
	movq	%r15, %r14
	movq	72(%rsp), %r12
	movl	%ebx, %r15d
	movl	92(%rsp), %ebx
.L4392:
	movq	%r14, %rdi
	movw	%r15w, 124(%rsp)
	movb	%al, 126(%rsp)
	leaq	124(%rsp), %r13
	movl	$2, %ebp
	call	stbi__get8
	movl	56(%rsp), %r15d
	movq	%r13, %rsi
	movq	%r12, %rdi
	movb	%al, 127(%rsp)
	movl	%r15d, %edx
	call	stbi__hdr_convert
	movq	32(%rsp), %rdi
	call	free@PLT
	movl	%r15d, (%rsp)
	movq	$0, 8(%rsp)
	xorl	%r15d, %r15d
	jmp	.L4389
.L4461:
	movq	72(%rsp), %rdi
	xorl	%r12d, %r12d
	call	free@PLT
	movq	32(%rsp), %rdi
	call	free@PLT
	leaq	.LC192(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L4368
.L4460:
	movq	%r15, %r14
	movl	92(%rsp), %ebx
	movq	72(%rsp), %r12
	movl	$514, %r15d
	jmp	.L4392
.L4459:
	leaq	.LC16(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L4368
.L4457:
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
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdi, %r15
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
	movq	%rcx, %rbx
	movq	%r9, %rbp
	subq	$392, %rsp
	.cfi_def_cfa_offset 448
	movq	%rbx, %r13
	leaq	256(%rbx), %r12
	movq	%rbx, %r14
	movq	464(%rsp), %rax
	movq	%rsi, 8(%rsp)
	movq	%rdx, 24(%rsp)
	movq	456(%rsp), %r11
	movzwl	(%rax), %ecx
	movq	%rax, 56(%rsp)
	movq	%fs:40, %rdx
	movq	%rdx, 376(%rsp)
	xorl	%edx, %edx
	movw	%cx, 92(%rsp)
	movzwl	2(%rax), %ecx
	movw	%cx, 94(%rsp)
	movzwl	960(%rax), %ecx
	movzwl	962(%rax), %eax
	movw	%cx, 84(%rsp)
	movw	%ax, 86(%rsp)
	.p2align 4
	.p2align 3
.L4470:
	leaq	28(%r14), %rax
	leaq	12(%r14), %rcx
	leaq	8(%r14), %rdx
	leaq	4(%r14), %rsi
	pushq	%rax
	.cfi_def_cfa_offset 456
	leaq	24(%r14), %rax
	leaq	20(%r14), %r9
	leaq	16(%r14), %r8
	pushq	%rax
	.cfi_def_cfa_offset 464
	movq	%r14, %rdi
	addq	$32, %r14
	call	stbiw__jpg_DCT
	popq	%r10
	.cfi_def_cfa_offset 456
	popq	%rax
	.cfi_def_cfa_offset 448
	cmpq	%r14, %r12
	jne	.L4470
	leaq	32(%rbx), %r12
	.p2align 4
	.p2align 3
.L4471:
	leaq	224(%rbx), %rax
	leaq	160(%rbx), %r9
	leaq	128(%rbx), %r8
	leaq	96(%rbx), %rcx
	pushq	%rax
	.cfi_def_cfa_offset 456
	leaq	192(%rbx), %rax
	leaq	64(%rbx), %rdx
	leaq	32(%rbx), %rsi
	pushq	%rax
	.cfi_def_cfa_offset 464
	movq	%rbx, %rdi
	addq	$4, %rbx
	call	stbiw__jpg_DCT
	popq	%r8
	.cfi_def_cfa_offset 456
	popq	%r9
	.cfi_def_cfa_offset 448
	cmpq	%rbx, %r12
	jne	.L4471
	vmovss	.LC124(%rip), %xmm1
	leaq	stbiw__jpg_ZigZag(%rip), %rdx
	vxorps	%xmm0, %xmm0, %xmm0
	leaq	64(%rdx), %rcx
	.p2align 4
	.p2align 3
.L4489:
	vmovss	0(%rbp), %xmm2
	vmulss	0(%r13), %xmm2, %xmm2
	vcomiss	%xmm2, %xmm0
	ja	.L4472
	vaddss	%xmm1, %xmm2, %xmm2
	vcvttss2sil	%xmm2, %esi
.L4473:
	vmovss	4(%r13), %xmm2
	movzbl	(%rdx), %eax
	vmulss	4(%rbp), %xmm2, %xmm2
	movl	%esi, 112(%rsp,%rax,4)
	vcomiss	%xmm2, %xmm0
	ja	.L4474
	vaddss	%xmm1, %xmm2, %xmm2
	vcvttss2sil	%xmm2, %esi
.L4475:
	vmovss	8(%r13), %xmm2
	movzbl	1(%rdx), %eax
	vmulss	8(%rbp), %xmm2, %xmm2
	movl	%esi, 112(%rsp,%rax,4)
	vcomiss	%xmm2, %xmm0
	ja	.L4476
	vaddss	%xmm1, %xmm2, %xmm2
	vcvttss2sil	%xmm2, %esi
.L4477:
	vmovss	12(%r13), %xmm2
	movzbl	2(%rdx), %eax
	vmulss	12(%rbp), %xmm2, %xmm2
	movl	%esi, 112(%rsp,%rax,4)
	vcomiss	%xmm2, %xmm0
	ja	.L4478
	vaddss	%xmm1, %xmm2, %xmm2
	vcvttss2sil	%xmm2, %esi
.L4479:
	vmovss	16(%r13), %xmm2
	movzbl	3(%rdx), %eax
	vmulss	16(%rbp), %xmm2, %xmm2
	movl	%esi, 112(%rsp,%rax,4)
	vcomiss	%xmm2, %xmm0
	ja	.L4480
	vaddss	%xmm1, %xmm2, %xmm2
	vcvttss2sil	%xmm2, %esi
.L4481:
	vmovss	20(%r13), %xmm2
	movzbl	4(%rdx), %eax
	vmulss	20(%rbp), %xmm2, %xmm2
	movl	%esi, 112(%rsp,%rax,4)
	vcomiss	%xmm2, %xmm0
	ja	.L4482
	vaddss	%xmm1, %xmm2, %xmm2
	vcvttss2sil	%xmm2, %esi
.L4483:
	vmovss	24(%r13), %xmm2
	movzbl	5(%rdx), %eax
	vmulss	24(%rbp), %xmm2, %xmm2
	movl	%esi, 112(%rsp,%rax,4)
	vcomiss	%xmm2, %xmm0
	ja	.L4484
	vaddss	%xmm1, %xmm2, %xmm2
	vcvttss2sil	%xmm2, %esi
.L4485:
	vmovss	28(%r13), %xmm2
	movzbl	6(%rdx), %eax
	vmulss	28(%rbp), %xmm2, %xmm2
	movl	%esi, 112(%rsp,%rax,4)
	movzbl	7(%rdx), %eax
	vcomiss	%xmm2, %xmm0
	ja	.L4486
	vaddss	%xmm1, %xmm2, %xmm2
	addq	$8, %rdx
	addq	$32, %r13
	addq	$32, %rbp
	vcvttss2sil	%xmm2, %esi
	movl	%esi, 112(%rsp,%rax,4)
	cmpq	%rcx, %rdx
	jne	.L4489
.L4488:
	movl	112(%rsp), %eax
	movq	8(%rsp), %rcx
	movl	%eax, 88(%rsp)
	subl	448(%rsp), %eax
	movl	(%rcx), %edi
	movq	24(%rsp), %rcx
	movl	%eax, %esi
	movl	(%rcx), %r8d
	je	.L4569
	movl	%eax, %edx
	negl	%edx
	cmovs	%eax, %edx
	cmpl	$-2147483648, %eax
	adcl	$-1, %esi
	sarl	%edx
	je	.L4540
	movl	$2, %ecx
	.p2align 4
	.p2align 3
.L4497:
	movl	%ecx, %r9d
	incl	%ecx
	sarl	%edx
	jne	.L4497
	movl	$1, %ecx
	movzwl	%r9w, %eax
	movzwl	%r9w, %edx
	shlx	%r9d, %ecx, %ecx
	movl	%eax, 20(%rsp)
	salq	$2, %rdx
	decl	%ecx
.L4496:
	movzwl	2(%r11,%rdx), %r13d
	movzwl	(%r11,%rdx), %ebp
	movl	$24, %edx
	andl	%esi, %ecx
	movw	%cx, 16(%rsp)
	addl	%r8d, %r13d
	subl	%r13d, %edx
	shlx	%edx, %ebp, %ebp
	orl	%edi, %ebp
	cmpl	$7, %r13d
	jle	.L4498
	movl	%r13d, %r12d
	leaq	111(%rsp), %rbx
	.p2align 4
	.p2align 3
.L4500:
	movl	%ebp, %r14d
	movq	8(%r15), %rdi
	movl	$1, %edx
	movq	%rbx, %rsi
	sarl	$16, %r14d
	movb	%r14b, 111(%rsp)
	call	*(%r15)
	cmpb	$-1, %r14b
	jne	.L4499
	movq	8(%r15), %rdi
	movb	$0, 111(%rsp)
	movl	$1, %edx
	movq	%rbx, %rsi
	call	*(%r15)
.L4499:
	subl	$8, %r12d
	sall	$8, %ebp
	cmpl	$7, %r12d
	jg	.L4500
	andl	$7, %r13d
.L4498:
	movq	8(%rsp), %rcx
	movq	24(%rsp), %rax
	movl	$24, %edx
	movzwl	16(%rsp), %r12d
	movl	%ebp, (%rcx)
	movl	%r13d, (%rax)
	movl	20(%rsp), %eax
	addl	%r13d, %eax
	subl	%eax, %edx
	movl	%eax, 20(%rsp)
	shlx	%edx, %r12d, %r12d
	orl	(%rcx), %r12d
	cmpl	$7, %eax
	jle	.L4501
	movl	%eax, %ebp
	leaq	111(%rsp), %rbx
	.p2align 4
	.p2align 3
.L4503:
	movl	%r12d, %r13d
	movq	8(%r15), %rdi
	movl	$1, %edx
	movq	%rbx, %rsi
	sarl	$16, %r13d
	movb	%r13b, 111(%rsp)
	call	*(%r15)
	cmpb	$-1, %r13b
	jne	.L4502
	movq	8(%r15), %rdi
	movb	$0, 111(%rsp)
	movl	$1, %edx
	movq	%rbx, %rsi
	call	*(%r15)
.L4502:
	subl	$8, %ebp
	sall	$8, %r12d
	cmpl	$7, %ebp
	jg	.L4503
	andl	$7, 20(%rsp)
.L4501:
	movq	8(%rsp), %rax
	movl	20(%rsp), %ecx
	movl	%r12d, (%rax)
	movq	24(%rsp), %rax
	movl	%ecx, (%rax)
.L4494:
	leaq	112(%rsp), %rax
	movl	$63, %edx
	movq	%rax, 64(%rsp)
	jmp	.L4504
	.p2align 4
	.p2align 3
.L4506:
	decq	%rdx
	je	.L4505
.L4504:
	movl	(%rax,%rdx,4), %edi
	testl	%edi, %edi
	je	.L4506
	movl	%edx, 48(%rsp)
	movl	%edx, 76(%rsp)
	movl	$1, %esi
	.p2align 4
	.p2align 3
.L4507:
	movslq	%esi, %rdx
	movl	112(%rsp,%rdx,4), %r12d
	testl	%r12d, %r12d
	jne	.L4532
	cmpl	%esi, 48(%rsp)
	jl	.L4570
	movl	76(%rsp), %edi
	leal	2(%rsi), %ecx
	leal	1(%rsi), %edx
	movq	64(%rsp), %rax
	movslq	%ecx, %rcx
	movslq	%edx, %rdx
	subl	%esi, %edi
	addq	%rdi, %rcx
	jmp	.L4512
	.p2align 4
	.p2align 3
.L4572:
	incq	%rdx
	cmpq	%rdx, %rcx
	je	.L4571
.L4512:
	movl	(%rax,%rdx,4), %r12d
	movl	%edx, %edi
	testl	%r12d, %r12d
	je	.L4572
	movl	%edx, %eax
	movl	%r12d, %r13d
	movl	%edx, 44(%rsp)
	subl	%esi, %eax
	negl	%r13d
	cmovs	%r12d, %r13d
	movl	%eax, 52(%rsp)
	sarl	%r13d
	movl	%r13d, 72(%rsp)
	cmpl	$15, %eax
	jg	.L4514
	sall	$4, %eax
	movl	%eax, %ecx
.L4515:
	movl	72(%rsp), %eax
	leal	-1(%r12), %esi
	testl	%r12d, %r12d
	cmovns	%r12d, %esi
	testl	%eax, %eax
	je	.L4522
	movl	$2, %edx
	.p2align 4
	.p2align 3
.L4523:
	movl	%edx, %r14d
	incl	%edx
	sarl	%eax
	jne	.L4523
	movzwl	%r14w, %eax
	movl	$1, %r12d
	shlx	%eax, %r12d, %r12d
	leal	(%rcx,%rax), %edx
	movl	%eax, 32(%rsp)
	decl	%r12d
	movslq	%edx, %rdx
	andl	%esi, %r12d
	salq	$2, %rdx
	movzwl	%r12w, %r12d
.L4524:
	movq	56(%rsp), %rcx
	movzwl	2(%rcx,%rdx), %eax
	addl	20(%rsp), %eax
	movzwl	(%rcx,%rdx), %ebx
	movq	8(%rsp), %rcx
	movl	$24, %edx
	subl	%eax, %edx
	movl	%eax, 16(%rsp)
	shlx	%edx, %ebx, %ebx
	orl	(%rcx), %ebx
	cmpl	$7, %eax
	jle	.L4525
	movl	%eax, %ebp
	leaq	111(%rsp), %r13
	.p2align 4
	.p2align 3
.L4527:
	movl	%ebx, %r14d
	movq	8(%r15), %rdi
	movl	$1, %edx
	movq	%r13, %rsi
	sarl	$16, %r14d
	movb	%r14b, 111(%rsp)
	call	*(%r15)
	cmpb	$-1, %r14b
	jne	.L4526
	movq	8(%r15), %rdi
	movb	$0, 111(%rsp)
	movl	$1, %edx
	movq	%r13, %rsi
	call	*(%r15)
.L4526:
	subl	$8, %ebp
	sall	$8, %ebx
	cmpl	$7, %ebp
	jg	.L4527
	andl	$7, 16(%rsp)
.L4525:
	movq	8(%rsp), %rcx
	movl	16(%rsp), %eax
	movq	24(%rsp), %rsi
	movl	%ebx, (%rcx)
	movl	$24, %ebx
	movl	%eax, (%rsi)
	addl	32(%rsp), %eax
	subl	%eax, %ebx
	movl	%eax, 20(%rsp)
	shlx	%ebx, %r12d, %ebx
	orl	(%rcx), %ebx
	cmpl	$7, %eax
	jle	.L4528
	movl	%eax, %ebp
	leaq	111(%rsp), %r13
	.p2align 4
	.p2align 3
.L4530:
	movl	%ebx, %r12d
	movq	8(%r15), %rdi
	movl	$1, %edx
	movq	%r13, %rsi
	sarl	$16, %r12d
	movb	%r12b, 111(%rsp)
	call	*(%r15)
	cmpb	$-1, %r12b
	jne	.L4529
	movq	8(%r15), %rdi
	movb	$0, 111(%rsp)
	movl	$1, %edx
	movq	%r13, %rsi
	call	*(%r15)
.L4529:
	subl	$8, %ebp
	sall	$8, %ebx
	cmpl	$7, %ebp
	jg	.L4530
	andl	$7, 20(%rsp)
.L4528:
	movq	8(%rsp), %rax
	movl	20(%rsp), %ecx
	movl	44(%rsp), %esi
	movl	%ebx, (%rax)
	movq	24(%rsp), %rax
	incl	%esi
	movl	%ecx, (%rax)
	cmpl	48(%rsp), %esi
	jle	.L4507
	cmpl	$63, 48(%rsp)
	jne	.L4573
.L4469:
	movq	376(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L4574
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
	.p2align 4
	.p2align 3
.L4486:
	.cfi_restore_state
	vsubss	%xmm1, %xmm2, %xmm2
	addq	$8, %rdx
	addq	$32, %r13
	addq	$32, %rbp
	vcvttss2sil	%xmm2, %esi
	movl	%esi, 112(%rsp,%rax,4)
	cmpq	%rdx, %rcx
	jne	.L4489
	jmp	.L4488
	.p2align 4
	.p2align 3
.L4484:
	vsubss	%xmm1, %xmm2, %xmm2
	vcvttss2sil	%xmm2, %esi
	jmp	.L4485
	.p2align 4
	.p2align 3
.L4482:
	vsubss	%xmm1, %xmm2, %xmm2
	vcvttss2sil	%xmm2, %esi
	jmp	.L4483
	.p2align 4
	.p2align 3
.L4480:
	vsubss	%xmm1, %xmm2, %xmm2
	vcvttss2sil	%xmm2, %esi
	jmp	.L4481
	.p2align 4
	.p2align 3
.L4478:
	vsubss	%xmm1, %xmm2, %xmm2
	vcvttss2sil	%xmm2, %esi
	jmp	.L4479
	.p2align 4
	.p2align 3
.L4476:
	vsubss	%xmm1, %xmm2, %xmm2
	vcvttss2sil	%xmm2, %esi
	jmp	.L4477
	.p2align 4
	.p2align 3
.L4474:
	vsubss	%xmm1, %xmm2, %xmm2
	vcvttss2sil	%xmm2, %esi
	jmp	.L4475
	.p2align 4
	.p2align 3
.L4472:
	vsubss	%xmm1, %xmm2, %xmm2
	vcvttss2sil	%xmm2, %esi
	jmp	.L4473
	.p2align 4
	.p2align 3
.L4571:
	movl	%edi, %eax
	movl	%edi, 44(%rsp)
	subl	%esi, %eax
	movl	%eax, 52(%rsp)
	cmpl	$15, %eax
	jg	.L4575
	movl	%eax, %ecx
	xorl	%esi, %esi
	sall	$4, %ecx
.L4522:
	leal	1(%rcx), %edx
	movl	%esi, %r12d
	movl	$1, 32(%rsp)
	movslq	%edx, %rdx
	andl	$1, %r12d
	salq	$2, %rdx
	jmp	.L4524
.L4575:
	movl	$0, 72(%rsp)
.L4514:
	movzwl	86(%rsp), %eax
	movl	$1, 16(%rsp)
	movl	%r12d, 80(%rsp)
	movl	52(%rsp), %edx
	movl	20(%rsp), %r13d
	movl	%eax, 36(%rsp)
	movzwl	84(%rsp), %eax
	sarl	$4, %edx
	movl	%eax, 40(%rsp)
	leal	1(%rdx), %eax
	movl	%eax, 32(%rsp)
	.p2align 4
	.p2align 3
.L4519:
	addl	36(%rsp), %r13d
	movl	$24, %ebx
	movq	8(%rsp), %rax
	subl	%r13d, %ebx
	shlx	%ebx, 40(%rsp), %ebx
	orl	(%rax), %ebx
	cmpl	$7, %r13d
	jle	.L4516
	movl	%r13d, %ebp
	leaq	111(%rsp), %r12
	.p2align 4
	.p2align 3
.L4518:
	movl	%ebx, %r14d
	movq	8(%r15), %rdi
	movl	$1, %edx
	movq	%r12, %rsi
	sarl	$16, %r14d
	movb	%r14b, 111(%rsp)
	call	*(%r15)
	cmpb	$-1, %r14b
	jne	.L4517
	movq	8(%r15), %rdi
	movb	$0, 111(%rsp)
	movl	$1, %edx
	movq	%r12, %rsi
	call	*(%r15)
.L4517:
	subl	$8, %ebp
	sall	$8, %ebx
	cmpl	$7, %ebp
	jg	.L4518
	andl	$7, %r13d
.L4516:
	movq	8(%rsp), %rax
	incl	16(%rsp)
	movl	%ebx, (%rax)
	movq	24(%rsp), %rax
	movl	%r13d, (%rax)
	movl	16(%rsp), %eax
	cmpl	32(%rsp), %eax
	jne	.L4519
	movl	52(%rsp), %ecx
	movl	%r13d, 20(%rsp)
	movl	80(%rsp), %r12d
	sall	$4, %ecx
	movzbl	%cl, %ecx
	jmp	.L4515
.L4573:
	movzwl	94(%rsp), %ebp
	addl	20(%rsp), %ebp
	movl	$24, %edx
	movzwl	92(%rsp), %r13d
	movq	8(%rsp), %rax
	subl	%ebp, %edx
	shlx	%edx, %r13d, %r13d
	orl	(%rax), %r13d
	cmpl	$7, %ebp
	jle	.L4534
	movl	%ebp, %r12d
	leaq	111(%rsp), %rbx
	.p2align 4
	.p2align 3
.L4536:
	movl	%r13d, %r14d
	movq	8(%r15), %rdi
	movl	$1, %edx
	movq	%rbx, %rsi
	sarl	$16, %r14d
	movb	%r14b, 111(%rsp)
	call	*(%r15)
	cmpb	$-1, %r14b
	jne	.L4535
	movq	8(%r15), %rdi
	movb	$0, 111(%rsp)
	movl	$1, %edx
	movq	%rbx, %rsi
	call	*(%r15)
.L4535:
	subl	$8, %r12d
	sall	$8, %r13d
	cmpl	$7, %r12d
	jg	.L4536
	andl	$7, %ebp
.L4534:
	movq	8(%rsp), %rax
	movl	%r13d, (%rax)
	movq	24(%rsp), %rax
	movl	%ebp, (%rax)
	jmp	.L4469
.L4532:
	movl	%r12d, %r13d
	movl	%esi, 44(%rsp)
	negl	%r13d
	cmovs	%r12d, %r13d
	xorl	%ecx, %ecx
	sarl	%r13d
	movl	%r13d, 72(%rsp)
	jmp	.L4515
.L4570:
	movl	%esi, 44(%rsp)
	movl	$4, %edx
	movl	$1, 32(%rsp)
	jmp	.L4524
.L4569:
	movzwl	2(%r11), %edx
	movzwl	(%r11), %ebp
	leal	(%rdx,%r8), %eax
	movl	$24, %edx
	subl	%eax, %edx
	movl	%eax, 20(%rsp)
	shlx	%edx, %ebp, %ebp
	orl	%edi, %ebp
	cmpl	$7, %eax
	jle	.L4491
	movl	%eax, %r12d
	leaq	111(%rsp), %rbx
	.p2align 4
	.p2align 3
.L4493:
	movl	%ebp, %r13d
	movq	8(%r15), %rdi
	movl	$1, %edx
	movq	%rbx, %rsi
	sarl	$16, %r13d
	movb	%r13b, 111(%rsp)
	call	*(%r15)
	cmpb	$-1, %r13b
	jne	.L4492
	movq	8(%r15), %rdi
	movb	$0, 111(%rsp)
	movl	$1, %edx
	movq	%rbx, %rsi
	call	*(%r15)
.L4492:
	subl	$8, %r12d
	sall	$8, %ebp
	cmpl	$7, %r12d
	jg	.L4493
	andl	$7, 20(%rsp)
.L4491:
	movq	8(%rsp), %rax
	movl	20(%rsp), %ecx
	movl	%ebp, (%rax)
	movq	24(%rsp), %rax
	movl	%ecx, (%rax)
	jmp	.L4494
.L4505:
	movzwl	94(%rsp), %r13d
	addl	20(%rsp), %r13d
	movl	$24, %edx
	leaq	111(%rsp), %rbx
	movzwl	92(%rsp), %ebp
	movq	8(%rsp), %rax
	subl	%r13d, %edx
	movl	%r13d, %r12d
	shlx	%edx, %ebp, %ebp
	orl	(%rax), %ebp
	cmpl	$7, %r13d
	jle	.L4537
	.p2align 4
	.p2align 3
.L4509:
	movl	%ebp, %r14d
	movq	8(%r15), %rdi
	movl	$1, %edx
	movq	%rbx, %rsi
	sarl	$16, %r14d
	movb	%r14b, 111(%rsp)
	call	*(%r15)
	cmpb	$-1, %r14b
	jne	.L4508
	movq	8(%r15), %rdi
	movb	$0, 111(%rsp)
	movl	$1, %edx
	movq	%rbx, %rsi
	call	*(%r15)
.L4508:
	subl	$8, %r12d
	sall	$8, %ebp
	cmpl	$7, %r12d
	jg	.L4509
	andl	$7, %r13d
.L4537:
	movq	8(%rsp), %rax
	movl	%ebp, (%rax)
	movq	24(%rsp), %rax
	movl	%r13d, (%rax)
	jmp	.L4469
.L4540:
	movl	$4, %edx
	movl	$1, %ecx
	movl	$1, 20(%rsp)
	jmp	.L4496
.L4574:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE891:
	.size	stbiw__jpg_processDU.constprop.1, .-stbiw__jpg_processDU.constprop.1
	.p2align 4
	.type	stbi_write_jpg_core.part.0, @function
stbi_write_jpg_core.part.0:
.LFB846:
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
	subq	$4096, %rsp
	.cfi_def_cfa_offset 4152
	orq	$0, (%rsp)
	subq	$600, %rsp
	.cfi_def_cfa_offset 4752
	movq	%rdi, 240(%rsp)
	movl	%esi, 104(%rsp)
	movq	%r8, %r10
	movl	%edx, 144(%rsp)
	movl	%ecx, 160(%rsp)
	movq	%fs:40, %rax
	movq	%rax, 4680(%rsp)
	xorl	%eax, %eax
	testl	%r9d, %r9d
	je	.L4629
	movl	%r9d, %ebx
	movl	$5000, %eax
	jle	.L4580
	movl	$100, %ecx
	cmpl	%ecx, %r9d
	cmovle	%r9d, %ecx
	cmpl	$49, %r9d
	jg	.L4658
	cltd
	idivl	%ecx
	jmp	.L4580
.L4629:
	movl	$20, %eax
	movl	$90, %ebx
.L4580:
	xorl	%edx, %edx
	leaq	YQT.17(%rip), %r9
	leaq	stbiw__jpg_ZigZag(%rip), %r8
	leaq	UVQT.16(%rip), %rdi
.L4583:
	movl	(%r9,%rdx,4), %esi
	movl	$1, %ecx
	imull	%eax, %esi
	cmpl	$49, %esi
	jle	.L4581
	movl	$-1, %ecx
	cmpl	$25549, %esi
	jg	.L4581
	leal	50(%rsi), %ecx
	imulq	$1374389535, %rcx, %rcx
	shrq	$37, %rcx
.L4581:
	movl	(%rdi,%rdx,4), %r11d
	movzbl	(%r8,%rdx), %esi
	imull	%eax, %r11d
	movb	%cl, 4544(%rsp,%rsi)
	movl	$1, %ecx
	cmpl	$49, %r11d
	jle	.L4582
	movl	$-1, %ecx
	cmpl	$25549, %r11d
	jg	.L4582
	leal	50(%r11), %ecx
	imulq	$1374389535, %rcx, %rcx
	shrq	$37, %rcx
.L4582:
	incq	%rdx
	movb	%cl, 4608(%rsp,%rsi)
	cmpq	$64, %rdx
	jne	.L4583
	vmovaps	.LC193(%rip), %xmm7
	vmovaps	.LC194(%rip), %xmm4
	leaq	416(%rsp), %rax
	leaq	stbiw__jpg_ZigZag(%rip), %r11
	vmovaps	.LC195(%rip), %xmm6
	movq	%rax, 264(%rsp)
	movq	%rax, %rbp
	leaq	672(%rsp), %rax
	leaq	aasf.15(%rip), %r13
	movq	%rax, 288(%rsp)
	movq	%rax, %r12
.L4584:
	movzbl	2(%r11), %ecx
	addq	$8, %r11
	addq	$4, %r13
	addq	$32, %rbp
	movzbl	-8(%r11), %edi
	movzbl	-7(%r11), %esi
	addq	$32, %r12
	movzbl	-4(%r11), %r15d
	vbroadcastss	-4(%r13), %xmm5
	movzbl	4608(%rsp,%rcx), %edx
	movzbl	4544(%rsp,%rcx), %ecx
	movzbl	4608(%rsp,%rdi), %eax
	movzbl	4544(%rsp,%rdi), %edi
	vmovd	%edx, %xmm0
	movzbl	-5(%r11), %edx
	vmovd	%ecx, %xmm9
	vmovd	%eax, %xmm1
	movzbl	4608(%rsp,%rsi), %eax
	movzbl	4544(%rsp,%rsi), %esi
	movzbl	4608(%rsp,%rdx), %r8d
	movzbl	4544(%rsp,%rdx), %edx
	vpinsrd	$1, %eax, %xmm1, %xmm1
	movzbl	4608(%rsp,%r15), %eax
	movzbl	4544(%rsp,%r15), %r15d
	vpinsrd	$1, %r8d, %xmm0, %xmm0
	movzbl	-3(%r11), %r8d
	vpinsrd	$1, %edx, %xmm9, %xmm9
	vpunpcklqdq	%xmm0, %xmm1, %xmm1
	vmovd	%eax, %xmm0
	movzbl	-2(%r11), %eax
	vmovd	%r15d, %xmm2
	vcvtdq2ps	%xmm1, %xmm1
	movzbl	4608(%rsp,%r8), %r9d
	movzbl	4544(%rsp,%r8), %r8d
	movzbl	4608(%rsp,%rax), %r14d
	movzbl	4544(%rsp,%rax), %eax
	vmulps	%xmm5, %xmm1, %xmm1
	vpinsrd	$1, %r8d, %xmm2, %xmm2
	vpinsrd	$1, %r9d, %xmm0, %xmm0
	vmovd	%eax, %xmm3
	movzbl	-1(%r11), %eax
	vmovd	%r14d, %xmm8
	vmulps	%xmm6, %xmm1, %xmm1
	vdivps	%xmm1, %xmm4, %xmm1
	movzbl	4544(%rsp,%rax), %r15d
	vpinsrd	$1, %r15d, %xmm3, %xmm3
	vpunpcklqdq	%xmm3, %xmm2, %xmm2
	vmovd	%edi, %xmm3
	vpinsrd	$1, %esi, %xmm3, %xmm3
	vpunpcklqdq	%xmm9, %xmm3, %xmm3
	vcvtdq2ps	%xmm2, %xmm2
	vcvtdq2ps	%xmm3, %xmm3
	vmulps	%xmm5, %xmm2, %xmm2
	vmulps	%xmm5, %xmm3, %xmm3
	vmulps	%xmm7, %xmm2, %xmm2
	vmulps	%xmm6, %xmm3, %xmm3
	vdivps	%xmm2, %xmm4, %xmm2
	vdivps	%xmm3, %xmm4, %xmm3
	vmovaps	%xmm2, -16(%rbp)
	vmovaps	%xmm3, -32(%rbp)
	movzbl	4608(%rsp,%rax), %eax
	vmovaps	%xmm1, -32(%r12)
	vpinsrd	$1, %eax, %xmm8, %xmm8
	leaq	64+stbiw__jpg_ZigZag(%rip), %rax
	vpunpcklqdq	%xmm8, %xmm0, %xmm0
	vcvtdq2ps	%xmm0, %xmm0
	vmulps	%xmm5, %xmm0, %xmm0
	vmulps	%xmm7, %xmm0, %xmm0
	vdivps	%xmm0, %xmm4, %xmm0
	vmovaps	%xmm0, -16(%r12)
	cmpq	%rax, %r11
	jne	.L4584
	movq	240(%rsp), %r15
	cmpl	$91, %ebx
	movl	$17, %edx
	movl	$34, %eax
	movl	144(%rsp), %r12d
	movl	104(%rsp), %r13d
	cmovge	%edx, %eax
	leaq	412(%rsp), %r14
	movb	%al, 4523(%rsp)
	movabsq	$45600891830604035, %rax
	movq	%r10, (%rsp)
	movl	$25, %edx
	movq	%rax, 4528(%rsp)
	leaq	head0.14(%rip), %rsi
	movl	$285262079, 4512(%rsp)
	movb	$8, 4516(%rsp)
	movw	$259, 4521(%rsp)
	movbew	%r12w, 4517(%rsp)
	movbew	%r13w, 4519(%rsp)
	movl	$17891840, 4524(%rsp)
	movq	8(%r15), %rdi
	call	*(%r15)
	movq	8(%r15), %rdi
	leaq	4544(%rsp), %rsi
	movl	$64, %edx
	call	*(%r15)
	movq	8(%r15), %rdi
	movl	$1, %edx
	movq	%r14, %rsi
	movb	$1, 412(%rsp)
	movq	%r14, 232(%rsp)
	call	*(%r15)
	movq	8(%r15), %rdi
	leaq	4608(%rsp), %rsi
	movl	$64, %edx
	call	*(%r15)
	movq	8(%r15), %rdi
	leaq	4512(%rsp), %rsi
	movl	$24, %edx
	call	*(%r15)
	movq	8(%r15), %rdi
	movl	$16, %edx
	leaq	1+std_dc_luminance_nrcodes.13(%rip), %rsi
	call	*(%r15)
	movq	8(%r15), %rdi
	movl	$12, %edx
	leaq	std_dc_luminance_values.12(%rip), %rsi
	call	*(%r15)
	movq	8(%r15), %rdi
	movl	$1, %edx
	movq	%r14, %rsi
	movb	$16, 412(%rsp)
	call	*(%r15)
	movq	8(%r15), %rdi
	movl	$16, %edx
	leaq	1+std_ac_luminance_nrcodes.11(%rip), %rsi
	call	*(%r15)
	movl	$162, %edx
	leaq	std_ac_luminance_values.10(%rip), %rsi
	movq	8(%r15), %rdi
	call	*(%r15)
	movl	$1, %edx
	movq	%r14, %rsi
	movq	8(%r15), %rdi
	movb	$1, 412(%rsp)
	call	*(%r15)
	movl	$16, %edx
	movq	8(%r15), %rdi
	leaq	1+std_dc_chrominance_nrcodes.9(%rip), %rsi
	call	*(%r15)
	movq	8(%r15), %rdi
	movl	$12, %edx
	leaq	std_dc_chrominance_values.8(%rip), %rsi
	call	*(%r15)
	movq	8(%r15), %rdi
	movl	$1, %edx
	movq	%r14, %rsi
	movb	$17, 412(%rsp)
	call	*(%r15)
	movq	8(%r15), %rdi
	movl	$16, %edx
	leaq	1+std_ac_chrominance_nrcodes.7(%rip), %rsi
	call	*(%r15)
	movl	$162, %edx
	leaq	std_ac_chrominance_values.6(%rip), %rsi
	movq	8(%r15), %rdi
	call	*(%r15)
	movl	$14, %edx
	leaq	head2.5(%rip), %rsi
	movq	8(%r15), %rdi
	call	*(%r15)
	movl	$0, 408(%rsp)
	movl	$0, 412(%rsp)
	vxorps	%xmm8, %xmm8, %xmm8
	movl	160(%rsp), %ecx
	movq	(%rsp), %r10
	cmpl	$2, %ecx
	setg	%al
	setg	%dil
	addq	%rax, %rax
	movzbl	%dil, %edi
	andl	$2, %eax
	movq	%rdi, 208(%rsp)
	addq	%r10, %rdi
	cmpl	$90, %ebx
	leaq	(%r10,%rax), %rbp
	movq	%rdi, 384(%rsp)
	movq	%rax, 216(%rsp)
	movq	%rbp, 96(%rsp)
	jle	.L4586
	testl	%r12d, %r12d
	jle	.L4587
	testl	%r13d, %r13d
	jle	.L4587
	leal	-1(%r12), %eax
	vmovaps	.LC196(%rip), %xmm14
	vmovaps	.LC197(%rip), %xmm13
	leaq	3488(%rsp), %r15
	movl	%eax, 108(%rsp)
	vmovaps	.LC199(%rip), %xmm15
	andl	$-8, %eax
	vmovaps	.LC202(%rip), %xmm9
	addl	$15, %eax
	movq	%r15, %r12
	movl	$7, 140(%rsp)
	movl	$0, 164(%rsp)
	movl	%eax, 192(%rsp)
	leal	0(,%rcx,8), %eax
	leaq	408(%rsp), %rcx
	movl	$0, 152(%rsp)
	movl	%eax, 176(%rsp)
	movq	%rcx, 224(%rsp)
	leal	-1(%r13), %eax
	leaq	YAC_HT.3(%rip), %rcx
	movl	%eax, 172(%rsp)
	movq	%rcx, 248(%rsp)
	andl	$-8, %eax
	leaq	YDC_HT.4(%rip), %rcx
	addl	$9, %eax
	movq	%rcx, 256(%rsp)
	leaq	UVAC_HT.1(%rip), %rcx
	movl	$0, 148(%rsp)
	movq	%rcx, 280(%rsp)
	movl	%eax, 180(%rsp)
	leaq	UVDC_HT.2(%rip), %rcx
	leaq	1456(%rsp), %rax
	leaq	1440(%rsp), %r11
	leaq	2464(%rsp), %r14
	movq	%rcx, 272(%rsp)
	movq	%rax, 184(%rsp)
	movq	%rdi, %rbx
	movq	%r10, %r15
.L4588:
	movl	140(%rsp), %eax
	movl	$0, (%rsp)
	movl	$1, 136(%rsp)
	movq	%r11, %r13
	leal	-7(%rax), %ecx
	incl	%eax
	movl	%ecx, 168(%rsp)
	movl	144(%rsp), %ecx
	cmpl	%ecx, %eax
	cmovg	%ecx, %eax
	movl	%eax, 112(%rsp)
.L4625:
	movl	136(%rsp), %ecx
	movl	104(%rsp), %esi
	movl	172(%rsp), %edi
	movl	160(%rsp), %r8d
	movl	stbi__flip_vertically_on_write(%rip), %r10d
	leal	6(%rcx), %eax
	cmpl	%ecx, %esi
	movl	%edi, %edx
	cmovg	%ecx, %edx
	imull	%r8d, %edx
	movl	%edx, 28(%rsp)
	leal	1(%rcx), %edx
	cmpl	%edx, %esi
	cmovle	%edi, %edx
	imull	%r8d, %edx
	movl	%edx, 32(%rsp)
	leal	2(%rcx), %edx
	cmpl	%edx, %esi
	cmovle	%edi, %edx
	imull	%r8d, %edx
	movl	%edx, 48(%rsp)
	leal	3(%rcx), %edx
	cmpl	%edx, %esi
	cmovle	%edi, %edx
	imull	%r8d, %edx
	movl	%edx, 64(%rsp)
	leal	4(%rcx), %edx
	cmpl	%edx, %esi
	cmovle	%edi, %edx
	imull	%r8d, %edx
	movl	%edx, 96(%rsp)
	leal	5(%rcx), %edx
	movl	168(%rsp), %ecx
	cmpl	%edx, %esi
	cmovle	%edi, %edx
	imull	%r8d, %edx
	cmpl	%eax, %esi
	cmovle	%edi, %eax
	imull	%r8d, %eax
	movl	%edx, 80(%rsp)
	movl	%eax, 128(%rsp)
	cmpl	%ecx, 144(%rsp)
	jg	.L4624
	xorl	%eax, %eax
.L4622:
	xorl	%edx, %edx
	salq	$2, %rax
	testl	%r10d, %r10d
	cmove	108(%rsp), %edx
	imull	104(%rsp), %edx
	movl	32(%rsp), %r8d
	movl	(%rsp), %edi
	movl	28(%rsp), %esi
	imull	160(%rsp), %edx
	addl	%edx, %r8d
	addl	%edx, %edi
	addl	%edx, %esi
	movslq	%r8d, %r9
	movl	48(%rsp), %r8d
	movslq	%edi, %rdi
	movslq	%esi, %rsi
	addl	%edx, %r8d
	movslq	%r8d, %r11
	movzbl	(%r15,%rdi), %r8d
	vcvtsi2ssl	%r8d, %xmm8, %xmm7
	movzbl	(%r15,%rsi), %r8d
	vcvtsi2ssl	%r8d, %xmm8, %xmm0
	movzbl	(%r15,%r9), %r8d
	vmovaps	%xmm0, %xmm1
	vunpcklps	%xmm1, %xmm7, %xmm7
	vcvtsi2ssl	%r8d, %xmm8, %xmm0
	movzbl	(%r15,%r11), %r8d
	vcvtsi2ssl	%r8d, %xmm8, %xmm2
	movzbl	(%rbx,%rdi), %r8d
	vunpcklps	%xmm2, %xmm0, %xmm0
	movzbl	0(%rbp,%rdi), %edi
	vmovlhps	%xmm0, %xmm7, %xmm7
	vcvtsi2ssl	%r8d, %xmm8, %xmm0
	movzbl	(%rbx,%rsi), %r8d
	vmovaps	%xmm0, %xmm10
	movzbl	0(%rbp,%rsi), %esi
	vcvtsi2ssl	%r8d, %xmm8, %xmm0
	movzbl	(%rbx,%r9), %r8d
	vmovaps	%xmm0, %xmm1
	vunpcklps	%xmm1, %xmm10, %xmm10
	vcvtsi2ssl	%r8d, %xmm8, %xmm0
	movzbl	(%rbx,%r11), %r8d
	vcvtsi2ssl	%r8d, %xmm8, %xmm2
	vunpcklps	%xmm2, %xmm0, %xmm0
	movl	80(%rsp), %r8d
	vmovlhps	%xmm0, %xmm10, %xmm10
	vcvtsi2ssl	%edi, %xmm8, %xmm0
	vmovaps	%xmm0, %xmm1
	vcvtsi2ssl	%esi, %xmm8, %xmm0
	movzbl	0(%rbp,%r9), %esi
	vmovaps	%xmm0, %xmm2
	movl	96(%rsp), %edi
	vunpcklps	%xmm2, %xmm1, %xmm1
	vmulps	.LC203(%rip), %xmm10, %xmm5
	addl	%edx, %r8d
	movslq	%r8d, %r8
	vcvtsi2ssl	%esi, %xmm8, %xmm0
	movzbl	0(%rbp,%r11), %esi
	addl	%edx, %edi
	movslq	%edi, %rdi
	vcvtsi2ssl	%esi, %xmm8, %xmm3
	movl	64(%rsp), %esi
	vunpcklps	%xmm3, %xmm0, %xmm0
	vmovlhps	%xmm0, %xmm1, %xmm1
	vfmsub231ps	%xmm9, %xmm7, %xmm5
	addl	%edx, %esi
	addl	128(%rsp), %edx
	movslq	%esi, %rsi
	movzbl	(%r15,%rsi), %r9d
	movslq	%edx, %rdx
	vcvtsi2ssl	%r9d, %xmm8, %xmm6
	movzbl	(%r15,%rdi), %r9d
	vcvtsi2ssl	%r9d, %xmm8, %xmm0
	movzbl	(%r15,%r8), %r9d
	vmovaps	%xmm0, %xmm2
	vunpcklps	%xmm2, %xmm6, %xmm6
	vcvtsi2ssl	%r9d, %xmm8, %xmm0
	movzbl	(%r15,%rdx), %r9d
	vcvtsi2ssl	%r9d, %xmm8, %xmm3
	movzbl	(%rbx,%rsi), %r9d
	vunpcklps	%xmm3, %xmm0, %xmm0
	vmovlhps	%xmm0, %xmm6, %xmm6
	vcvtsi2ssl	%r9d, %xmm8, %xmm0
	movzbl	(%rbx,%rdi), %r9d
	vcvtsi2ssl	%r9d, %xmm8, %xmm2
	movzbl	(%rbx,%r8), %r9d
	vmovaps	%xmm2, %xmm3
	vunpcklps	%xmm3, %xmm0, %xmm0
	vcvtsi2ssl	%r9d, %xmm8, %xmm2
	movzbl	(%rbx,%rdx), %r9d
	vcvtsi2ssl	%r9d, %xmm8, %xmm4
	vunpcklps	%xmm4, %xmm2, %xmm2
	vmovlhps	%xmm2, %xmm0, %xmm0
	vmulps	.LC203(%rip), %xmm0, %xmm4
	vmulps	.LC200(%rip), %xmm10, %xmm3
	movzbl	0(%rbp,%rsi), %esi
	movzbl	0(%rbp,%rdx), %edx
	vmulps	.LC200(%rip), %xmm0, %xmm2
	vfmsub231ps	.LC201(%rip), %xmm7, %xmm3
	vfnmadd231ps	.LC204(%rip), %xmm1, %xmm5
	vcvtsi2ssl	%edx, %xmm8, %xmm11
	leaq	3504(%rsp), %rdx
	vmulps	%xmm14, %xmm0, %xmm0
	vfmsub231ps	.LC201(%rip), %xmm6, %xmm2
	vmulps	%xmm14, %xmm10, %xmm10
	vfmsub231ps	%xmm9, %xmm6, %xmm4
	vfmadd132ps	%xmm13, %xmm0, %xmm6
	vcvtsi2ssl	%esi, %xmm8, %xmm0
	movzbl	0(%rbp,%rdi), %esi
	vfmadd132ps	%xmm13, %xmm10, %xmm7
	movl	140(%rsp), %edi
	vcvtsi2ssl	%esi, %xmm8, %xmm12
	movzbl	0(%rbp,%r8), %esi
	vunpcklps	%xmm12, %xmm0, %xmm0
	vfmadd231ps	%xmm9, %xmm1, %xmm3
	vfmadd132ps	.LC198(%rip), %xmm7, %xmm1
	movq	184(%rsp), %r8
	vcvtsi2ssl	%esi, %xmm8, %xmm10
	vunpcklps	%xmm11, %xmm10, %xmm10
	leaq	2480(%rsp), %rsi
	vmovlhps	%xmm10, %xmm0, %xmm0
	vfnmadd231ps	.LC204(%rip), %xmm0, %xmm4
	vfmadd231ps	%xmm9, %xmm0, %xmm2
	vfmadd132ps	.LC198(%rip), %xmm6, %xmm0
	vaddps	%xmm15, %xmm1, %xmm1
	vaddps	%xmm15, %xmm0, %xmm0
	.p2align 4
	.p2align 3
.L4619:
	incl	%ecx
	vmovaps	%xmm1, 0(%r13,%rax)
	vmovaps	%xmm3, (%r14,%rax)
	vmovaps	%xmm5, (%r12,%rax)
	vmovaps	%xmm0, (%r8,%rax)
	vmovaps	%xmm2, (%rsi,%rax)
	vmovaps	%xmm4, (%rdx,%rax)
	addq	$32, %rax
	cmpl	%ecx, %edi
	jge	.L4619
.L4620:
	subq	$8, %rsp
	.cfi_def_cfa_offset 4760
	movl	$8, %r8d
	movq	%r13, %rcx
	pushq	256(%rsp)
	.cfi_def_cfa_offset 4768
	pushq	272(%rsp)
	.cfi_def_cfa_offset 4776
	movl	172(%rsp), %eax
	pushq	%rax
	.cfi_def_cfa_offset 4784
	movq	296(%rsp), %r9
	movq	264(%rsp), %rdx
	movq	256(%rsp), %rsi
	movq	272(%rsp), %rdi
	call	stbiw__jpg_processDU.constprop.1
	movl	$8, %r8d
	movq	%r14, %rcx
	movl	%eax, 180(%rsp)
	addq	$24, %rsp
	.cfi_def_cfa_offset 4760
	pushq	288(%rsp)
	.cfi_def_cfa_offset 4768
	pushq	288(%rsp)
	.cfi_def_cfa_offset 4776
	movl	176(%rsp), %eax
	pushq	%rax
	.cfi_def_cfa_offset 4784
	movq	320(%rsp), %r9
	movq	264(%rsp), %rdx
	movq	256(%rsp), %rsi
	movq	272(%rsp), %rdi
	call	stbiw__jpg_processDU.constprop.1
	movl	$8, %r8d
	movq	%r12, %rcx
	movl	%eax, 184(%rsp)
	addq	$24, %rsp
	.cfi_def_cfa_offset 4760
	pushq	288(%rsp)
	.cfi_def_cfa_offset 4768
	pushq	288(%rsp)
	.cfi_def_cfa_offset 4776
	movl	188(%rsp), %eax
	pushq	%rax
	.cfi_def_cfa_offset 4784
	movq	272(%rsp), %rdi
	movq	320(%rsp), %r9
	movq	264(%rsp), %rdx
	movq	256(%rsp), %rsi
	call	stbiw__jpg_processDU.constprop.1
	addl	$8, 168(%rsp)
	vxorps	%xmm8, %xmm8, %xmm8
	movl	208(%rsp), %edi
	movl	%eax, 196(%rsp)
	addl	%edi, 32(%rsp)
	movl	168(%rsp), %eax
	addq	$32, %rsp
	.cfi_def_cfa_offset 4752
	cmpl	180(%rsp), %eax
	vmovaps	.LC202(%rip), %xmm9
	vmovaps	.LC196(%rip), %xmm14
	vmovaps	.LC197(%rip), %xmm13
	vmovaps	.LC199(%rip), %xmm15
	jne	.L4625
	addl	$8, 140(%rsp)
	movq	%r13, %r11
	movl	140(%rsp), %eax
	cmpl	192(%rsp), %eax
	jne	.L4588
.L4617:
	movl	412(%rsp), %eax
	movl	$127, %ebx
	leal	7(%rax), %ebp
	movl	$24, %eax
	subl	%ebp, %eax
	shlx	%eax, %ebx, %ebx
	orl	408(%rsp), %ebx
	cmpl	$7, %ebp
	jle	.L4587
	movq	240(%rsp), %r13
	leaq	407(%rsp), %r12
.L4627:
	movl	%ebx, %r14d
	movq	8(%r13), %rdi
	movl	$1, %edx
	movq	%r12, %rsi
	sarl	$16, %r14d
	movb	%r14b, 407(%rsp)
	call	*0(%r13)
	cmpb	$-1, %r14b
	jne	.L4626
	movq	8(%r13), %rdi
	movb	$0, 407(%rsp)
	movl	$1, %edx
	movq	%r12, %rsi
	call	*0(%r13)
.L4626:
	subl	$8, %ebp
	sall	$8, %ebx
	cmpl	$7, %ebp
	jg	.L4627
.L4587:
	movq	240(%rsp), %rbx
	movq	232(%rsp), %r15
	movl	$1, %edx
	movb	$-1, 412(%rsp)
	movq	8(%rbx), %rdi
	movq	%r15, %rsi
	call	*(%rbx)
	movb	$-39, 412(%rsp)
	movq	8(%rbx), %rdi
	movl	$1, %edx
	movq	%r15, %rsi
	call	*(%rbx)
	movq	4680(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L4659
	addq	$4696, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movl	$1, %eax
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
.L4586:
	.cfi_restore_state
	movl	144(%rsp), %eax
	testl	%eax, %eax
	jle	.L4587
	movl	104(%rsp), %ebx
	testl	%ebx, %ebx
	jle	.L4587
	decl	%eax
	decl	%ebx
	leaq	1440(%rsp), %r11
	leaq	2464(%rsp), %r14
	movl	%eax, 108(%rsp)
	andl	$-16, %eax
	leaq	3488(%rsp), %r15
	movq	%r14, %r13
	addl	$16, %eax
	movq	%r11, %r14
	movl	%ebx, 172(%rsp)
	movl	$0, 324(%rsp)
	movl	%eax, 380(%rsp)
	movl	%ecx, %eax
	movl	$0, 320(%rsp)
	movq	%r15, %r11
	sall	$4, %eax
	imull	%ebx, %ecx
	movl	$0, 312(%rsp)
	movl	$0, 316(%rsp)
	movl	%eax, 376(%rsp)
	movl	%ebx, %eax
	movq	%r10, 392(%rsp)
	shrl	$4, %eax
	incl	%eax
	movl	%ecx, 308(%rsp)
	salq	$4, %rax
	movq	%rax, 344(%rsp)
	movslq	%ecx, %rax
	movq	%rax, 296(%rsp)
	leaq	408(%rsp), %rax
	movq	%rax, 224(%rsp)
	leaq	YAC_HT.3(%rip), %rax
	movq	%rax, 248(%rsp)
	leaq	YDC_HT.4(%rip), %rax
	movq	%rax, 256(%rsp)
	leaq	1472(%rsp), %rax
	movq	%rax, 368(%rsp)
	leaq	1952(%rsp), %rax
	movq	%rax, 352(%rsp)
	leaq	1984(%rsp), %rax
	movq	%rax, 360(%rsp)
	leaq	1184(%rsp), %rax
	movq	%rax, 336(%rsp)
	leaq	928(%rsp), %rax
	movq	%rax, 328(%rsp)
	leaq	UVAC_HT.1(%rip), %rax
	movq	%rax, 280(%rsp)
	leaq	UVDC_HT.2(%rip), %rax
	movq	%rax, 272(%rsp)
.L4589:
	movq	392(%rsp), %rbp
	movl	$0, 304(%rsp)
	movq	$0, 152(%rsp)
	movl	$15, %r15d
	movq	%r11, %rbx
	movq	384(%rsp), %r12
.L4618:
	movq	152(%rsp), %rax
	cmpl	$1, 160(%rsp)
	movl	%eax, 140(%rsp)
	movl	%eax, 136(%rsp)
	movl	stbi__flip_vertically_on_write(%rip), %eax
	movl	%eax, 148(%rsp)
	jne	.L4660
	movq	152(%rsp), %r8
	movq	%r12, 64(%rsp)
	movq	%r13, 128(%rsp)
	movq	%rbx, %rdi
	movq	%r14, %r12
	movl	104(%rsp), %eax
	movl	160(%rsp), %esi
	leal	16(%r8), %ecx
	movl	%r8d, 168(%rsp)
	cmpl	%eax, %ecx
	cmovg	%eax, %ecx
	movl	%ecx, %eax
	movl	%ecx, 28(%rsp)
	subl	%r8d, %eax
	cmpl	%ecx, %r8d
	cmovl	%eax, %esi
	decl	%eax
	cmpl	$14, %eax
	movl	%esi, 184(%rsp)
	setbe	%dl
	cmpl	%ecx, %r8d
	setge	%al
	andl	$-16, %esi
	movl	%esi, 180(%rsp)
	addl	%r8d, %esi
	orl	%eax, %edx
	movl	316(%rsp), %eax
	movl	%esi, 176(%rsp)
	movl	140(%rsp), %esi
	movb	%dl, 164(%rsp)
	xorl	%r8d, %r8d
	movl	%eax, 80(%rsp)
	leal	2(%rsi), %edx
	leal	1(%rsi), %eax
	vmovd	%esi, %xmm7
	vmovd	%edx, %xmm1
	leal	3(%rsi), %edx
	vpinsrd	$1, %eax, %xmm7, %xmm0
	vpinsrd	$1, %edx, %xmm1, %xmm1
	vpunpcklqdq	%xmm1, %xmm0, %xmm0
	vpaddd	.LC213(%rip), %xmm0, %xmm7
	vmovdqa	%xmm7, 192(%rsp)
	.p2align 4
	.p2align 3
.L4601:
	movl	80(%rsp), %esi
	movl	108(%rsp), %edx
	cmpl	%esi, 144(%rsp)
	movl	148(%rsp), %r9d
	movl	%edx, %eax
	cmovg	%esi, %eax
	subl	%eax, %edx
	testl	%r9d, %r9d
	cmovne	%edx, %eax
	movl	104(%rsp), %edx
	imull	%edx, %eax
	movl	%eax, (%rsp)
	cmpl	168(%rsp), %edx
	jg	.L4592
	movl	136(%rsp), %eax
	movl	%r8d, %edx
.L4597:
	movl	140(%rsp), %esi
	movl	$1, %r9d
	subl	%eax, %esi
	cmpl	%eax, %r15d
	leal	16(%rsi), %r10d
	cmovl	%r9d, %r10d
	addl	$15, %esi
	cmpl	$14, %esi
	jbe	.L4593
	cmpl	%eax, %r15d
	jl	.L4593
	movslq	%edx, %rsi
	movq	64(%rsp), %rcx
	vmovaps	.LC197(%rip), %xmm15
	salq	$2, %rsi
	leaq	(%r14,%rsi), %r9
	leaq	0(%r13,%rsi), %r11
	addq	%rbx, %rsi
	movq	%r9, 112(%rsp)
	movl	172(%rsp), %r9d
	addl	(%rsp), %r9d
	movslq	%r9d, %r9
	vpbroadcastb	0(%rbp,%r9), %xmm0
	vpmovzxbw	%xmm0, %xmm1
	vpsrldq	$8, %xmm0, %xmm0
	vpmovzxbw	%xmm0, %xmm0
	vpmovsxwd	%xmm0, %xmm10
	vpsrldq	$8, %xmm0, %xmm0
	vpmovsxwd	%xmm0, %xmm0
	vpmovsxwd	%xmm1, %xmm11
	vcvtdq2ps	%xmm0, %xmm7
	vpbroadcastb	(%rcx,%r9), %xmm0
	movq	96(%rsp), %rcx
	vpsrldq	$8, %xmm1, %xmm3
	vpmovsxwd	%xmm3, %xmm3
	vcvtdq2ps	%xmm11, %xmm11
	vcvtdq2ps	%xmm3, %xmm3
	vcvtdq2ps	%xmm10, %xmm10
	vmovaps	%xmm7, 48(%rsp)
	vpmovzxbw	%xmm0, %xmm1
	vpsrldq	$8, %xmm0, %xmm0
	vpmovzxbw	%xmm0, %xmm0
	vpmovsxwd	%xmm1, %xmm6
	vpmovsxwd	%xmm0, %xmm5
	vpsrldq	$8, %xmm1, %xmm2
	vpsrldq	$8, %xmm0, %xmm1
	vpbroadcastb	(%rcx,%r9), %xmm0
	vpmovsxwd	%xmm2, %xmm2
	vpmovsxwd	%xmm1, %xmm1
	vcvtdq2ps	%xmm6, %xmm6
	vcvtdq2ps	%xmm2, %xmm2
	movq	112(%rsp), %r9
	vcvtdq2ps	%xmm5, %xmm5
	vcvtdq2ps	%xmm1, %xmm1
	vpmovzxbw	%xmm0, %xmm4
	vpsrldq	$8, %xmm0, %xmm0
	vpmovzxbw	%xmm0, %xmm0
	vpmovsxwd	%xmm4, %xmm9
	vpsrldq	$8, %xmm4, %xmm4
	vpmovsxwd	%xmm4, %xmm4
	vpmovsxwd	%xmm0, %xmm7
	vcvtdq2ps	%xmm4, %xmm4
	vpsrldq	$8, %xmm0, %xmm0
	vpmovsxwd	%xmm0, %xmm0
	vcvtdq2ps	%xmm9, %xmm9
	vcvtdq2ps	%xmm7, %xmm7
	vcvtdq2ps	%xmm0, %xmm0
	vmovaps	%xmm4, 32(%rsp)
	vmovaps	.LC196(%rip), %xmm4
	vmulps	%xmm4, %xmm6, %xmm14
	vmulps	%xmm4, %xmm2, %xmm13
	vmulps	%xmm4, %xmm5, %xmm12
	vmulps	%xmm4, %xmm1, %xmm4
	vfmadd231ps	48(%rsp), %xmm15, %xmm4
	vfmadd231ps	%xmm15, %xmm3, %xmm13
	vfmadd231ps	%xmm15, %xmm11, %xmm14
	vfmadd231ps	%xmm15, %xmm10, %xmm12
	vmovaps	.LC198(%rip), %xmm15
	vfmadd231ps	32(%rsp), %xmm15, %xmm13
	vfmadd231ps	%xmm15, %xmm9, %xmm14
	vfmadd231ps	%xmm15, %xmm7, %xmm12
	vfmadd231ps	%xmm15, %xmm0, %xmm4
	vmovaps	.LC199(%rip), %xmm15
	vaddps	%xmm15, %xmm4, %xmm4
	vaddps	%xmm15, %xmm14, %xmm14
	vaddps	%xmm15, %xmm13, %xmm13
	vaddps	%xmm15, %xmm12, %xmm12
	vmovaps	.LC201(%rip), %xmm15
	vmovups	%xmm4, 48(%r9)
	vmovaps	.LC200(%rip), %xmm4
	vmovups	%xmm14, (%r9)
	vmovups	%xmm13, 16(%r9)
	vmovups	%xmm12, 32(%r9)
	vmulps	%xmm4, %xmm6, %xmm14
	vmulps	%xmm4, %xmm2, %xmm13
	vmulps	%xmm4, %xmm5, %xmm12
	vfmsub231ps	%xmm15, %xmm3, %xmm13
	vmulps	%xmm4, %xmm1, %xmm4
	vfmsub231ps	%xmm15, %xmm11, %xmm14
	vfmsub231ps	%xmm15, %xmm10, %xmm12
	vfmsub132ps	48(%rsp), %xmm4, %xmm15
	vmovaps	.LC202(%rip), %xmm4
	vfmadd231ps	32(%rsp), %xmm4, %xmm13
	vfmadd231ps	%xmm4, %xmm7, %xmm12
	vfmadd231ps	%xmm4, %xmm9, %xmm14
	vfmadd231ps	%xmm4, %xmm0, %xmm15
	vmovups	%xmm12, 32(%r11)
	vmovaps	.LC203(%rip), %xmm12
	vmovups	%xmm14, (%r11)
	vmovups	%xmm13, 16(%r11)
	vmovups	%xmm15, 48(%r11)
	vmulps	%xmm12, %xmm2, %xmm2
	vmulps	%xmm12, %xmm1, %xmm1
	vfmsub231ps	%xmm4, %xmm3, %xmm2
	vmovaps	48(%rsp), %xmm3
	vmulps	%xmm12, %xmm6, %xmm6
	vmulps	%xmm12, %xmm5, %xmm5
	vfmsub231ps	%xmm4, %xmm11, %xmm6
	vfmsub231ps	%xmm4, %xmm10, %xmm5
	vfmsub132ps	%xmm4, %xmm1, %xmm3
	vmovaps	.LC204(%rip), %xmm4
	vmovaps	32(%rsp), %xmm1
	vfnmadd132ps	%xmm4, %xmm6, %xmm9
	vfnmadd132ps	%xmm4, %xmm2, %xmm1
	vfnmadd132ps	%xmm4, %xmm5, %xmm7
	vfnmadd132ps	%xmm4, %xmm3, %xmm0
	vmovups	%xmm9, (%rsi)
	vmovups	%xmm1, 16(%rsi)
	vmovups	%xmm7, 32(%rsi)
	vmovups	%xmm0, 48(%rsi)
	movl	%r10d, %esi
	andl	$-16, %esi
	addl	%esi, %eax
	addl	%esi, %edx
	cmpl	%r10d, %esi
	je	.L4598
.L4593:
	movslq	104(%rsp), %rsi
	movslq	(%rsp), %r9
	subl	%edx, %eax
	vmovss	.LC205(%rip), %xmm4
	vmovss	.LC209(%rip), %xmm5
	vmovss	.LC211(%rip), %xmm9
	vmovss	.LC124(%rip), %xmm6
	vmovss	.LC212(%rip), %xmm7
	vmovss	.LC208(%rip), %xmm10
	addq	%rsi, %r9
	movl	28(%rsp), %ecx
	movslq	%edx, %rsi
	movzbl	-1(%rbp,%r9), %r10d
	vcvtsi2ssl	%r10d, %xmm8, %xmm1
	movq	64(%rsp), %r10
	movzbl	-1(%r9,%r10), %r10d
	vcvtsi2ssl	%r10d, %xmm8, %xmm2
	movq	96(%rsp), %r10
	vmulss	%xmm4, %xmm2, %xmm4
	vfmadd231ss	.LC206(%rip), %xmm1, %xmm4
	vmulss	%xmm5, %xmm2, %xmm5
	vfmsub231ss	.LC210(%rip), %xmm1, %xmm5
	movzbl	-1(%r9,%r10), %r9d
	vmulss	%xmm9, %xmm2, %xmm2
	vfmsub132ss	%xmm6, %xmm2, %xmm1
	vcvtsi2ssl	%r9d, %xmm8, %xmm0
	vfmadd231ss	.LC207(%rip), %xmm0, %xmm4
	vfmadd231ss	%xmm6, %xmm0, %xmm5
	vfnmadd132ss	%xmm7, %xmm1, %xmm0
	vsubss	%xmm10, %xmm4, %xmm4
	.p2align 4
	.p2align 3
.L4595:
	vmovss	%xmm4, (%r14,%rsi,4)
	vmovss	%xmm5, 0(%r13,%rsi,4)
	vmovss	%xmm0, (%rbx,%rsi,4)
	incq	%rsi
	leal	(%rax,%rsi), %edx
	cmpl	%r15d, %edx
	jle	.L4595
	movl	%ecx, 28(%rsp)
.L4598:
	addl	$16, %r8d
	incl	80(%rsp)
	addq	$64, %r12
	addq	$64, %rdi
	addq	$64, 128(%rsp)
	cmpl	$256, %r8d
	jne	.L4601
	movq	64(%rsp), %r12
.L4602:
	subq	$8, %rsp
	.cfi_def_cfa_offset 4760
	movq	%r14, %rcx
	movl	$16, %r8d
	pushq	256(%rsp)
	.cfi_def_cfa_offset 4768
	pushq	272(%rsp)
	.cfi_def_cfa_offset 4776
	movl	336(%rsp), %eax
	pushq	%rax
	.cfi_def_cfa_offset 4784
	movq	272(%rsp), %r14
	movq	296(%rsp), %r9
	movq	264(%rsp), %rdx
	movq	256(%rsp), %rsi
	movq	%r14, %rdi
	call	stbiw__jpg_processDU.constprop.0
	addq	$24, %rsp
	.cfi_def_cfa_offset 4760
	movq	%r14, %rdi
	movl	$16, %r8d
	pushq	256(%rsp)
	.cfi_def_cfa_offset 4768
	pushq	272(%rsp)
	.cfi_def_cfa_offset 4776
	pushq	%rax
	.cfi_def_cfa_offset 4784
	movq	296(%rsp), %r9
	movq	400(%rsp), %rcx
	movq	264(%rsp), %rdx
	movq	256(%rsp), %rsi
	call	stbiw__jpg_processDU.constprop.0
	addq	$24, %rsp
	.cfi_def_cfa_offset 4760
	movq	%r14, %rdi
	movl	$16, %r8d
	pushq	256(%rsp)
	.cfi_def_cfa_offset 4768
	pushq	272(%rsp)
	.cfi_def_cfa_offset 4776
	pushq	%rax
	.cfi_def_cfa_offset 4784
	movq	296(%rsp), %r9
	movq	384(%rsp), %rcx
	movq	264(%rsp), %rdx
	movq	256(%rsp), %rsi
	call	stbiw__jpg_processDU.constprop.0
	addq	$24, %rsp
	.cfi_def_cfa_offset 4760
	movq	%r14, %rdi
	movl	$16, %r8d
	pushq	256(%rsp)
	.cfi_def_cfa_offset 4768
	pushq	272(%rsp)
	.cfi_def_cfa_offset 4776
	pushq	%rax
	.cfi_def_cfa_offset 4784
	movq	392(%rsp), %rcx
	movq	264(%rsp), %rdx
	movq	256(%rsp), %rsi
	movq	296(%rsp), %r9
	leaq	1472(%rsp), %r14
	call	stbiw__jpg_processDU.constprop.0
	movq	368(%rsp), %rcx
	movq	%rbx, %rdx
	movl	%eax, 344(%rsp)
	movq	360(%rsp), %rsi
	movq	%r13, %rax
	addq	$32, %rsp
	.cfi_def_cfa_offset 4752
	.p2align 4
	.p2align 3
.L4613:
	vmovaps	(%rax), %xmm15
	addq	$32, %rcx
	subq	$-128, %rdx
	addq	$32, %rsi
	vshufps	$221, 16(%rax), %xmm15, %xmm0
	vshufps	$136, 16(%rax), %xmm15, %xmm15
	subq	$-128, %rax
	vmovaps	-64(%rax), %xmm14
	vmovaps	-96(%rax), %xmm12
	vmovaps	-80(%rax), %xmm13
	vmovaps	-32(%rax), %xmm10
	vmovaps	-16(%rax), %xmm11
	vmovaps	-128(%rdx), %xmm7
	vmovaps	-112(%rdx), %xmm9
	vmovaps	-96(%rdx), %xmm3
	vmovaps	-80(%rdx), %xmm4
	vmovaps	-64(%rdx), %xmm5
	vmovaps	-48(%rdx), %xmm6
	vmovaps	-32(%rdx), %xmm1
	vmovaps	-16(%rdx), %xmm2
	vaddps	%xmm15, %xmm0, %xmm0
	vshufps	$136, -48(%rax), %xmm14, %xmm15
	vshufps	$221, -48(%rax), %xmm14, %xmm14
	vaddps	%xmm15, %xmm0, %xmm0
	vaddps	%xmm14, %xmm0, %xmm0
	vmulps	.LC214(%rip), %xmm0, %xmm0
	vmovaps	%xmm0, -32(%rsi)
	vshufps	$221, %xmm13, %xmm12, %xmm0
	vshufps	$136, %xmm13, %xmm12, %xmm12
	vaddps	%xmm12, %xmm0, %xmm0
	vshufps	$136, %xmm11, %xmm10, %xmm12
	vshufps	$221, %xmm11, %xmm10, %xmm10
	vaddps	%xmm12, %xmm0, %xmm0
	vaddps	%xmm10, %xmm0, %xmm0
	vmulps	.LC214(%rip), %xmm0, %xmm0
	vmovaps	%xmm0, -16(%rsi)
	vshufps	$221, %xmm9, %xmm7, %xmm0
	vshufps	$136, %xmm9, %xmm7, %xmm7
	vaddps	%xmm7, %xmm0, %xmm0
	vshufps	$136, %xmm6, %xmm5, %xmm7
	vshufps	$221, %xmm6, %xmm5, %xmm5
	vaddps	%xmm7, %xmm0, %xmm0
	vaddps	%xmm5, %xmm0, %xmm0
	vmulps	.LC214(%rip), %xmm0, %xmm0
	vmovaps	%xmm0, -32(%rcx)
	vshufps	$221, %xmm4, %xmm3, %xmm0
	vshufps	$136, %xmm4, %xmm3, %xmm3
	vaddps	%xmm3, %xmm0, %xmm0
	vshufps	$136, %xmm2, %xmm1, %xmm3
	vshufps	$221, %xmm2, %xmm1, %xmm1
	vaddps	%xmm3, %xmm0, %xmm0
	vaddps	%xmm1, %xmm0, %xmm0
	vmulps	.LC214(%rip), %xmm0, %xmm0
	vmovaps	%xmm0, -16(%rcx)
	cmpq	%rcx, %r14
	jne	.L4613
	subq	$8, %rsp
	.cfi_def_cfa_offset 4760
	movl	$8, %r8d
	addl	$16, %r15d
	pushq	288(%rsp)
	.cfi_def_cfa_offset 4768
	pushq	288(%rsp)
	.cfi_def_cfa_offset 4776
	movl	344(%rsp), %eax
	pushq	%rax
	.cfi_def_cfa_offset 4784
	movq	320(%rsp), %r9
	movq	360(%rsp), %rcx
	movq	264(%rsp), %rdx
	movq	256(%rsp), %rsi
	movq	272(%rsp), %rdi
	call	stbiw__jpg_processDU.constprop.1
	movl	$8, %r8d
	movl	%eax, 352(%rsp)
	addq	$24, %rsp
	.cfi_def_cfa_offset 4760
	pushq	288(%rsp)
	.cfi_def_cfa_offset 4768
	pushq	288(%rsp)
	.cfi_def_cfa_offset 4776
	movl	348(%rsp), %eax
	pushq	%rax
	.cfi_def_cfa_offset 4784
	movq	272(%rsp), %rdi
	movq	320(%rsp), %r9
	movq	368(%rsp), %rcx
	movq	264(%rsp), %rdx
	movq	256(%rsp), %rsi
	call	stbiw__jpg_processDU.constprop.1
	addq	$16, 184(%rsp)
	vxorps	%xmm8, %xmm8, %xmm8
	movl	408(%rsp), %edi
	movl	%eax, 356(%rsp)
	addl	%edi, 336(%rsp)
	movq	184(%rsp), %rax
	addq	$32, %rsp
	.cfi_def_cfa_offset 4752
	cmpq	344(%rsp), %rax
	jne	.L4618
	addl	$16, 316(%rsp)
	movq	%rbx, %r11
	movl	316(%rsp), %eax
	cmpl	380(%rsp), %eax
	jne	.L4589
	jmp	.L4617
	.p2align 4
	.p2align 3
.L4592:
	cmpb	$0, 164(%rsp)
	jne	.L4637
	leal	1(%r8), %eax
	movslq	(%rsp), %r11
	vmovd	%r8d, %xmm7
	leal	2(%r8), %ecx
	vpinsrd	$1, %eax, %xmm7, %xmm1
	movq	152(%rsp), %rax
	leal	3(%r8), %edx
	vmovd	%ecx, %xmm0
	vpinsrd	$1, %edx, %xmm0, %xmm0
	movq	208(%rsp), %rcx
	vpunpcklqdq	%xmm0, %xmm1, %xmm7
	vmovdqa	%xmm7, 112(%rsp)
	addq	%r11, %rax
	vmovdqu	0(%rbp,%rax), %xmm0
	addq	%rbp, %rax
	vpmovzxbw	%xmm0, %xmm1
	vpsrldq	$8, %xmm0, %xmm0
	vpmovzxbw	%xmm0, %xmm0
	vpmovsxwd	%xmm1, %xmm11
	vpsrldq	$8, %xmm1, %xmm4
	vpmovsxwd	%xmm0, %xmm1
	vpsrldq	$8, %xmm0, %xmm0
	vpmovsxwd	%xmm0, %xmm0
	vcvtdq2ps	%xmm1, %xmm5
	vpmovsxwd	%xmm4, %xmm4
	vcvtdq2ps	%xmm0, %xmm7
	vmovdqu	(%rax,%rcx), %xmm0
	movq	216(%rsp), %rcx
	vcvtdq2ps	%xmm4, %xmm4
	vcvtdq2ps	%xmm11, %xmm11
	vmovaps	%xmm5, 48(%rsp)
	vmovaps	%xmm7, 32(%rsp)
	vpmovzxbw	%xmm0, %xmm1
	vpsrldq	$8, %xmm0, %xmm0
	vpmovzxbw	%xmm0, %xmm0
	vpmovsxwd	%xmm0, %xmm6
	vpmovsxwd	%xmm1, %xmm7
	vpsrldq	$8, %xmm1, %xmm2
	vpsrldq	$8, %xmm0, %xmm1
	vcvtdq2ps	%xmm6, %xmm6
	vpmovsxwd	%xmm2, %xmm2
	vmulps	.LC196(%rip), %xmm6, %xmm12
	vpmovsxwd	%xmm1, %xmm1
	vcvtdq2ps	%xmm7, %xmm7
	vmulps	.LC196(%rip), %xmm7, %xmm14
	vmovdqu	(%rax,%rcx), %xmm0
	vcvtdq2ps	%xmm2, %xmm2
	movq	128(%rsp), %rax
	vmulps	.LC196(%rip), %xmm2, %xmm13
	vcvtdq2ps	%xmm1, %xmm1
	vmulps	.LC196(%rip), %xmm1, %xmm15
	vfmadd231ps	.LC197(%rip), %xmm5, %xmm12
	vmovaps	32(%rsp), %xmm5
	vfmadd231ps	.LC197(%rip), %xmm4, %xmm13
	vfmadd231ps	.LC197(%rip), %xmm5, %xmm15
	vfmadd231ps	.LC197(%rip), %xmm11, %xmm14
	vmovaps	.LC198(%rip), %xmm5
	vpmovzxbw	%xmm0, %xmm3
	vpsrldq	$8, %xmm0, %xmm0
	vpmovzxbw	%xmm0, %xmm0
	vpmovsxwd	%xmm3, %xmm10
	vpmovsxwd	%xmm0, %xmm9
	vpsrldq	$8, %xmm3, %xmm3
	vpsrldq	$8, %xmm0, %xmm0
	vpmovsxwd	%xmm3, %xmm3
	vpmovsxwd	%xmm0, %xmm0
	vcvtdq2ps	%xmm10, %xmm10
	vcvtdq2ps	%xmm3, %xmm3
	vcvtdq2ps	%xmm9, %xmm9
	vcvtdq2ps	%xmm0, %xmm0
	vfmadd231ps	%xmm5, %xmm9, %xmm12
	vfmadd231ps	%xmm5, %xmm0, %xmm15
	vfmadd231ps	%xmm5, %xmm3, %xmm13
	vfmadd231ps	%xmm5, %xmm10, %xmm14
	vmovaps	.LC199(%rip), %xmm5
	vaddps	%xmm5, %xmm14, %xmm14
	vaddps	%xmm5, %xmm13, %xmm13
	vaddps	%xmm5, %xmm12, %xmm12
	vaddps	%xmm5, %xmm15, %xmm5
	vmovaps	.LC201(%rip), %xmm15
	vmovups	%xmm14, (%r12)
	vmovups	%xmm13, 16(%r12)
	vmovups	%xmm5, 48(%r12)
	vmovups	%xmm12, 32(%r12)
	vmovaps	.LC200(%rip), %xmm5
	vmulps	%xmm5, %xmm6, %xmm12
	vfmsub231ps	48(%rsp), %xmm15, %xmm12
	vmulps	%xmm5, %xmm7, %xmm14
	vmulps	%xmm5, %xmm2, %xmm13
	vfmsub231ps	%xmm15, %xmm11, %xmm14
	vfmsub231ps	%xmm15, %xmm4, %xmm13
	vmulps	%xmm5, %xmm1, %xmm5
	vfmsub132ps	32(%rsp), %xmm5, %xmm15
	vmovaps	.LC202(%rip), %xmm5
	vfmadd231ps	%xmm5, %xmm9, %xmm12
	vfmadd231ps	%xmm5, %xmm10, %xmm14
	vfmadd231ps	%xmm5, %xmm3, %xmm13
	vfmadd231ps	%xmm5, %xmm0, %xmm15
	vmovups	%xmm14, (%rax)
	vmovups	%xmm13, 16(%rax)
	vmovups	%xmm12, 32(%rax)
	vmovaps	.LC203(%rip), %xmm12
	movl	180(%rsp), %esi
	movl	176(%rsp), %r9d
	vmovups	%xmm15, 48(%rax)
	leal	(%rsi,%r8), %r10d
	vmulps	%xmm12, %xmm1, %xmm1
	vfmsub231ps	32(%rsp), %xmm5, %xmm1
	vmulps	%xmm12, %xmm2, %xmm2
	vmulps	%xmm12, %xmm7, %xmm7
	vfmsub231ps	%xmm5, %xmm4, %xmm2
	vmovaps	.LC204(%rip), %xmm4
	vmulps	%xmm12, %xmm6, %xmm6
	vfmsub231ps	48(%rsp), %xmm5, %xmm6
	vfmsub231ps	%xmm5, %xmm11, %xmm7
	vfnmadd132ps	%xmm4, %xmm1, %xmm0
	vfnmadd132ps	%xmm4, %xmm7, %xmm10
	vmovdqa	112(%rsp), %xmm7
	vfnmadd132ps	%xmm4, %xmm2, %xmm3
	vmovups	%xmm0, 48(%rdi)
	vpaddd	.LC213(%rip), %xmm7, %xmm0
	vmovdqa	192(%rsp), %xmm7
	vfnmadd132ps	%xmm4, %xmm6, %xmm9
	vmovups	%xmm10, (%rdi)
	vmovups	%xmm3, 16(%rdi)
	vmovups	%xmm9, 32(%rdi)
	vpextrd	$3, %xmm0, %edx
	vpextrd	$3, %xmm7, %eax
	cmpl	184(%rsp), %esi
	je	.L4599
.L4596:
	movq	64(%rsp), %rdx
	movslq	%r9d, %r9
	vmovss	.LC205(%rip), %xmm4
	leal	1(%r10), %esi
	vmovss	.LC206(%rip), %xmm13
	vmovss	.LC207(%rip), %xmm12
	movslq	%r10d, %r10
	movq	%r9, %rax
	vmovss	.LC208(%rip), %xmm10
	vmovss	.LC209(%rip), %xmm5
	addq	%r11, %r9
	movslq	%esi, %rsi
	vmovss	.LC210(%rip), %xmm11
	vmovss	.LC124(%rip), %xmm6
	subq	%r10, %r9
	vmovss	.LC211(%rip), %xmm9
	vmovss	.LC212(%rip), %xmm7
	leaq	0(%rbp,%r9), %r11
	leaq	(%rdx,%r9), %r10
	addq	96(%rsp), %r9
	movl	28(%rsp), %ecx
	.p2align 4
	.p2align 3
.L4600:
	movzbl	-1(%r11,%rsi), %edx
	incl	%eax
	vcvtsi2ssl	%edx, %xmm8, %xmm1
	movzbl	-1(%r10,%rsi), %edx
	vcvtsi2ssl	%edx, %xmm8, %xmm2
	vmulss	%xmm4, %xmm2, %xmm3
	movzbl	-1(%r9,%rsi), %edx
	vfmadd231ss	%xmm13, %xmm1, %xmm3
	vcvtsi2ssl	%edx, %xmm8, %xmm0
	movl	%esi, %edx
	vfmadd231ss	%xmm12, %xmm0, %xmm3
	vsubss	%xmm10, %xmm3, %xmm3
	vmovss	%xmm3, -4(%r14,%rsi,4)
	vmulss	%xmm5, %xmm2, %xmm3
	vmulss	%xmm9, %xmm2, %xmm2
	vfmsub231ss	%xmm11, %xmm1, %xmm3
	vfmsub132ss	%xmm6, %xmm2, %xmm1
	vfmadd231ss	%xmm6, %xmm0, %xmm3
	vfnmadd132ss	%xmm7, %xmm1, %xmm0
	vmovss	%xmm3, -4(%r13,%rsi,4)
	vmovss	%xmm0, -4(%rbx,%rsi,4)
	incq	%rsi
	cmpl	%ecx, %eax
	jl	.L4600
	movl	%ecx, 28(%rsp)
.L4599:
	cmpl	%r15d, %eax
	jle	.L4597
	jmp	.L4598
.L4637:
	movl	136(%rsp), %r9d
	movslq	(%rsp), %r11
	movl	%r8d, %r10d
	jmp	.L4596
.L4660:
	movl	152(%rsp), %eax
	movq	96(%rsp), %rcx
	movl	$1, %r11d
	movl	%eax, 128(%rsp)
	movl	316(%rsp), %eax
	movl	%eax, 32(%rsp)
	movl	140(%rsp), %eax
	addl	$15, %eax
	movl	%eax, 48(%rsp)
	.p2align 4
	.p2align 3
.L4612:
	movl	32(%rsp), %esi
	leal	-1(%r11), %edx
	cmpl	%esi, 144(%rsp)
	movl	108(%rsp), %edi
	movl	%edi, %eax
	cmovg	%esi, %eax
	subl	%eax, %edi
	movl	%edi, %esi
	movl	148(%rsp), %edi
	testl	%edi, %edi
	movl	104(%rsp), %edi
	cmovne	%esi, %eax
	movl	160(%rsp), %esi
	imull	%edi, %eax
	imull	%esi, %eax
	movl	%eax, 28(%rsp)
	cmpl	128(%rsp), %edi
	jle	.L4640
	movl	140(%rsp), %edx
	cltq
	movslq	%esi, %r9
	movq	%r11, %rsi
	vmovss	.LC205(%rip), %xmm13
	vmovss	.LC206(%rip), %xmm12
	vmovss	.LC207(%rip), %xmm11
	vmovss	.LC208(%rip), %xmm9
	vmovss	.LC209(%rip), %xmm4
	vmovss	.LC210(%rip), %xmm10
	leal	16(%rdx), %r8d
	vmovss	.LC124(%rip), %xmm5
	vmovss	.LC211(%rip), %xmm7
	cmpl	%edi, %r8d
	vmovss	.LC212(%rip), %xmm6
	cmovg	%edi, %r8d
	movslq	304(%rsp), %rdi
	addq	%rax, %rdi
	movl	136(%rsp), %eax
	.p2align 4
	.p2align 3
.L4607:
	movzbl	0(%rbp,%rdi), %edx
	incl	%eax
	vcvtsi2ssl	%edx, %xmm8, %xmm1
	movzbl	(%r12,%rdi), %edx
	vcvtsi2ssl	%edx, %xmm8, %xmm2
	vmulss	%xmm13, %xmm2, %xmm3
	movzbl	(%rcx,%rdi), %edx
	addq	%r9, %rdi
	vfmadd231ss	%xmm12, %xmm1, %xmm3
	vcvtsi2ssl	%edx, %xmm8, %xmm0
	movl	%esi, %edx
	vfmadd231ss	%xmm11, %xmm0, %xmm3
	vsubss	%xmm9, %xmm3, %xmm3
	vmovss	%xmm3, -4(%r14,%rsi,4)
	vmulss	%xmm4, %xmm2, %xmm3
	vmulss	%xmm7, %xmm2, %xmm2
	vfmsub231ss	%xmm10, %xmm1, %xmm3
	vfmsub132ss	%xmm5, %xmm2, %xmm1
	vfmadd231ss	%xmm5, %xmm0, %xmm3
	vfnmadd132ss	%xmm6, %xmm1, %xmm0
	vmovss	%xmm3, -4(%r13,%rsi,4)
	vmovss	%xmm0, -4(%rbx,%rsi,4)
	incq	%rsi
	cmpl	%r8d, %eax
	jl	.L4607
	cmpl	48(%rsp), %eax
	jg	.L4609
.L4605:
	movl	140(%rsp), %esi
	movl	48(%rsp), %r10d
	movl	$1, %edi
	subl	%eax, %esi
	cmpl	%eax, %r10d
	leal	16(%rsi), %r8d
	cmovl	%edi, %r8d
	addl	$15, %esi
	cmpl	$14, %esi
	jbe	.L4608
	cmpl	%eax, %r10d
	jl	.L4608
	movl	28(%rsp), %edi
	addl	308(%rsp), %edi
	movslq	%edx, %rsi
	salq	$2, %rsi
	leaq	(%r14,%rsi), %r10
	leaq	0(%r13,%rsi), %r9
	addq	%rbx, %rsi
	movslq	%edi, %rdi
	vpbroadcastb	0(%rbp,%rdi), %xmm0
	vpmovzxbw	%xmm0, %xmm1
	vpsrldq	$8, %xmm0, %xmm0
	vpmovzxbw	%xmm0, %xmm0
	vpmovsxwd	%xmm0, %xmm9
	vpsrldq	$8, %xmm0, %xmm0
	vpmovsxwd	%xmm0, %xmm0
	vpmovsxwd	%xmm1, %xmm14
	vcvtdq2ps	%xmm0, %xmm7
	vpbroadcastb	(%r12,%rdi), %xmm0
	vpsrldq	$8, %xmm1, %xmm3
	vpmovsxwd	%xmm3, %xmm3
	vcvtdq2ps	%xmm9, %xmm9
	vcvtdq2ps	%xmm14, %xmm14
	vcvtdq2ps	%xmm3, %xmm3
	vmovaps	%xmm7, 64(%rsp)
	vpmovzxbw	%xmm0, %xmm1
	vpsrldq	$8, %xmm0, %xmm0
	vpmovzxbw	%xmm0, %xmm0
	vpmovsxwd	%xmm1, %xmm5
	vpmovsxwd	%xmm0, %xmm10
	vpsrldq	$8, %xmm1, %xmm4
	vpsrldq	$8, %xmm0, %xmm1
	vpbroadcastb	(%rcx,%rdi), %xmm0
	vcvtdq2ps	%xmm10, %xmm10
	vmulps	.LC196(%rip), %xmm10, %xmm12
	vpmovsxwd	%xmm4, %xmm4
	vcvtdq2ps	%xmm5, %xmm5
	vmulps	.LC196(%rip), %xmm5, %xmm15
	vpmovsxwd	%xmm1, %xmm1
	vcvtdq2ps	%xmm4, %xmm4
	vfmadd231ps	.LC197(%rip), %xmm9, %xmm12
	vcvtdq2ps	%xmm1, %xmm1
	vfmadd231ps	.LC197(%rip), %xmm14, %xmm15
	vmulps	.LC196(%rip), %xmm4, %xmm13
	vmulps	.LC196(%rip), %xmm1, %xmm11
	vfmadd231ps	.LC197(%rip), %xmm3, %xmm13
	vpmovzxbw	%xmm0, %xmm2
	vpsrldq	$8, %xmm0, %xmm0
	vpmovzxbw	%xmm0, %xmm0
	vpmovsxwd	%xmm2, %xmm7
	vpmovsxwd	%xmm0, %xmm6
	vpsrldq	$8, %xmm0, %xmm0
	vpmovsxwd	%xmm0, %xmm0
	vcvtdq2ps	%xmm7, %xmm7
	vpsrldq	$8, %xmm2, %xmm2
	vpmovsxwd	%xmm2, %xmm2
	vcvtdq2ps	%xmm6, %xmm6
	vfmadd231ps	.LC198(%rip), %xmm6, %xmm12
	vcvtdq2ps	%xmm2, %xmm2
	vfmadd231ps	.LC198(%rip), %xmm2, %xmm13
	vmovaps	%xmm7, 80(%rsp)
	vcvtdq2ps	%xmm0, %xmm7
	vmovaps	80(%rsp), %xmm0
	vfmadd231ps	.LC198(%rip), %xmm0, %xmm15
	vaddps	.LC199(%rip), %xmm13, %xmm13
	vmovaps	%xmm7, (%rsp)
	vmovaps	64(%rsp), %xmm7
	vfmadd231ps	.LC197(%rip), %xmm7, %xmm11
	vaddps	.LC199(%rip), %xmm15, %xmm15
	vmovaps	%xmm12, 64(%rsp)
	vmovaps	(%rsp), %xmm12
	vfmadd231ps	.LC198(%rip), %xmm12, %xmm11
	vmovups	%xmm13, 16(%r10)
	vaddps	.LC199(%rip), %xmm11, %xmm11
	vmovups	%xmm15, (%r10)
	vmovaps	64(%rsp), %xmm15
	vaddps	.LC199(%rip), %xmm15, %xmm12
	vmovups	%xmm12, 32(%r10)
	vmovups	%xmm11, 48(%r10)
	vmulps	.LC200(%rip), %xmm10, %xmm12
	vmulps	.LC200(%rip), %xmm5, %xmm15
	vfmsub231ps	.LC201(%rip), %xmm9, %xmm12
	vfmsub231ps	.LC201(%rip), %xmm14, %xmm15
	vmulps	.LC200(%rip), %xmm4, %xmm13
	vmulps	.LC200(%rip), %xmm1, %xmm11
	vmulps	.LC203(%rip), %xmm5, %xmm5
	vmulps	.LC203(%rip), %xmm4, %xmm4
	vfmadd231ps	.LC202(%rip), %xmm6, %xmm12
	vfmadd231ps	.LC202(%rip), %xmm0, %xmm15
	vmulps	.LC203(%rip), %xmm10, %xmm10
	vmulps	.LC203(%rip), %xmm1, %xmm1
	vfmsub231ps	.LC201(%rip), %xmm3, %xmm13
	vfmsub231ps	.LC201(%rip), %xmm7, %xmm11
	vfmsub231ps	.LC202(%rip), %xmm7, %xmm1
	vfmsub231ps	.LC202(%rip), %xmm14, %xmm5
	vmovaps	%xmm0, %xmm7
	vfmsub132ps	.LC202(%rip), %xmm4, %xmm3
	vfmsub132ps	.LC202(%rip), %xmm10, %xmm9
	vfmadd231ps	.LC202(%rip), %xmm2, %xmm13
	vfnmadd132ps	.LC204(%rip), %xmm5, %xmm7
	vfnmadd132ps	.LC204(%rip), %xmm9, %xmm6
	vfnmadd132ps	.LC204(%rip), %xmm3, %xmm2
	vmovaps	%xmm12, 64(%rsp)
	vmovaps	(%rsp), %xmm12
	vmovups	%xmm15, (%r9)
	vmovaps	64(%rsp), %xmm15
	vfmadd231ps	.LC202(%rip), %xmm12, %xmm11
	vmovaps	%xmm12, %xmm0
	vfnmadd132ps	.LC204(%rip), %xmm1, %xmm0
	vmovups	%xmm15, 32(%r9)
	vmovups	%xmm13, 16(%r9)
	vmovups	%xmm11, 48(%r9)
	vmovups	%xmm7, (%rsi)
	vmovups	%xmm2, 16(%rsi)
	vmovups	%xmm6, 32(%rsi)
	vmovups	%xmm0, 48(%rsi)
	movl	%r8d, %esi
	andl	$-16, %esi
	addl	%esi, %eax
	addl	%esi, %edx
	cmpl	%esi, %r8d
	je	.L4609
.L4608:
	movslq	28(%rsp), %rdi
	addq	296(%rsp), %rdi
	movslq	%edx, %rsi
	subl	%edx, %eax
	vmovss	.LC209(%rip), %xmm4
	vmovss	.LC211(%rip), %xmm7
	vmovss	.LC124(%rip), %xmm5
	vmovss	.LC212(%rip), %xmm6
	vmovss	.LC208(%rip), %xmm9
	movzbl	0(%rbp,%rdi), %r8d
	vcvtsi2ssl	%r8d, %xmm8, %xmm2
	movzbl	(%r12,%rdi), %r8d
	movzbl	(%rcx,%rdi), %edi
	vcvtsi2ssl	%r8d, %xmm8, %xmm3
	vmulss	.LC205(%rip), %xmm3, %xmm0
	vmulss	%xmm4, %xmm3, %xmm4
	vcvtsi2ssl	%edi, %xmm8, %xmm1
	vfmsub231ss	.LC210(%rip), %xmm2, %xmm4
	vfmadd231ss	.LC206(%rip), %xmm2, %xmm0
	vmulss	%xmm7, %xmm3, %xmm3
	vfmsub132ss	%xmm5, %xmm3, %xmm2
	vfmadd231ss	.LC207(%rip), %xmm1, %xmm0
	vfmadd231ss	%xmm5, %xmm1, %xmm4
	vfnmadd132ss	%xmm6, %xmm2, %xmm1
	vsubss	%xmm9, %xmm0, %xmm0
	.p2align 4
	.p2align 3
.L4610:
	vmovss	%xmm0, (%r14,%rsi,4)
	vmovss	%xmm4, 0(%r13,%rsi,4)
	vmovss	%xmm1, (%rbx,%rsi,4)
	incq	%rsi
	leal	(%rax,%rsi), %edx
	cmpl	%edx, %r15d
	jge	.L4610
.L4609:
	addq	$16, %r11
	incl	32(%rsp)
	cmpq	$257, %r11
	jne	.L4612
	jmp	.L4602
	.p2align 4
	.p2align 3
.L4640:
	movl	136(%rsp), %eax
	jmp	.L4605
.L4624:
	movl	$8, %edx
	.p2align 4
	.p2align 3
.L4621:
	movl	108(%rsp), %eax
	movl	(%rsp), %edi
	movl	48(%rsp), %esi
	subl	%ecx, %eax
	testl	%r10d, %r10d
	cmove	%ecx, %eax
	imull	104(%rsp), %eax
	incl	%ecx
	imull	160(%rsp), %eax
	leal	(%rax,%rdi), %r9d
	movl	28(%rsp), %edi
	addl	%eax, %esi
	movslq	%r9d, %r9
	movslq	%esi, %rsi
	movzbl	(%r15,%r9), %r11d
	leal	(%rax,%rdi), %r8d
	movl	32(%rsp), %edi
	movslq	%r8d, %r8
	vcvtsi2ssl	%r11d, %xmm8, %xmm3
	movzbl	(%r15,%r8), %r11d
	addl	%eax, %edi
	movslq	%edi, %rdi
	vcvtsi2ssl	%r11d, %xmm8, %xmm0
	movzbl	(%r15,%rdi), %r11d
	vmovaps	%xmm0, %xmm1
	vunpcklps	%xmm1, %xmm3, %xmm3
	vcvtsi2ssl	%r11d, %xmm8, %xmm0
	movzbl	(%r15,%rsi), %r11d
	vcvtsi2ssl	%r11d, %xmm8, %xmm2
	movzbl	(%rbx,%r9), %r11d
	vunpcklps	%xmm2, %xmm0, %xmm0
	movzbl	0(%rbp,%r9), %r9d
	vmovlhps	%xmm0, %xmm3, %xmm3
	vcvtsi2ssl	%r11d, %xmm8, %xmm10
	movzbl	(%rbx,%r8), %r11d
	movzbl	0(%rbp,%r8), %r8d
	vcvtsi2ssl	%r11d, %xmm8, %xmm0
	movzbl	(%rbx,%rdi), %r11d
	vmovaps	%xmm0, %xmm1
	movzbl	0(%rbp,%rdi), %edi
	vunpcklps	%xmm1, %xmm10, %xmm10
	vcvtsi2ssl	%r9d, %xmm8, %xmm1
	vcvtsi2ssl	%r11d, %xmm8, %xmm0
	movzbl	(%rbx,%rsi), %r11d
	movzbl	0(%rbp,%rsi), %esi
	vcvtsi2ssl	%r11d, %xmm8, %xmm2
	vunpcklps	%xmm2, %xmm0, %xmm0
	vcvtsi2ssl	%esi, %xmm8, %xmm4
	movl	80(%rsp), %esi
	vmovlhps	%xmm0, %xmm10, %xmm10
	vcvtsi2ssl	%r8d, %xmm8, %xmm0
	vmovaps	%xmm0, %xmm2
	vcvtsi2ssl	%edi, %xmm8, %xmm0
	movl	64(%rsp), %edi
	vunpcklps	%xmm2, %xmm1, %xmm1
	vunpcklps	%xmm4, %xmm0, %xmm0
	vmovlhps	%xmm0, %xmm1, %xmm1
	addl	%eax, %esi
	movslq	%esi, %rsi
	leal	(%rax,%rdi), %r8d
	movl	96(%rsp), %edi
	movslq	%r8d, %r8
	movzbl	(%r15,%r8), %r9d
	addl	%eax, %edi
	addl	128(%rsp), %eax
	movslq	%edi, %rdi
	vcvtsi2ssl	%r9d, %xmm8, %xmm2
	movzbl	(%r15,%rdi), %r9d
	cltq
	vcvtsi2ssl	%r9d, %xmm8, %xmm0
	movzbl	(%r15,%rsi), %r9d
	vmovaps	%xmm0, %xmm4
	vunpcklps	%xmm4, %xmm2, %xmm2
	vcvtsi2ssl	%r9d, %xmm8, %xmm0
	movzbl	(%r15,%rax), %r9d
	vcvtsi2ssl	%r9d, %xmm8, %xmm5
	movzbl	(%rbx,%r8), %r9d
	vunpcklps	%xmm5, %xmm0, %xmm0
	vmovlhps	%xmm0, %xmm2, %xmm2
	vcvtsi2ssl	%r9d, %xmm8, %xmm0
	movzbl	(%rbx,%rdi), %r9d
	vcvtsi2ssl	%r9d, %xmm8, %xmm4
	movzbl	(%rbx,%rsi), %r9d
	vmovaps	%xmm4, %xmm5
	vunpcklps	%xmm5, %xmm0, %xmm0
	vmulps	.LC203(%rip), %xmm10, %xmm5
	vcvtsi2ssl	%r9d, %xmm8, %xmm4
	movzbl	(%rbx,%rax), %r9d
	vcvtsi2ssl	%r9d, %xmm8, %xmm6
	vunpcklps	%xmm6, %xmm4, %xmm4
	vmovlhps	%xmm4, %xmm0, %xmm0
	vmulps	.LC203(%rip), %xmm0, %xmm4
	vmulps	.LC200(%rip), %xmm10, %xmm7
	movzbl	0(%rbp,%rax), %eax
	movzbl	0(%rbp,%r8), %r8d
	movzbl	0(%rbp,%rdi), %edi
	movzbl	0(%rbp,%rsi), %esi
	vmulps	.LC200(%rip), %xmm0, %xmm6
	vfmsub231ps	.LC201(%rip), %xmm3, %xmm7
	vmulps	%xmm14, %xmm10, %xmm10
	vcvtsi2ssl	%eax, %xmm8, %xmm12
	movslq	%edx, %rax
	vfmsub231ps	.LC201(%rip), %xmm2, %xmm6
	vcvtsi2ssl	%edi, %xmm8, %xmm11
	vmulps	%xmm14, %xmm0, %xmm0
	vfmsub231ps	%xmm9, %xmm3, %xmm5
	vfnmadd231ps	.LC204(%rip), %xmm1, %xmm5
	vfmsub231ps	%xmm9, %xmm2, %xmm4
	vfmadd132ps	%xmm13, %xmm10, %xmm3
	vfmadd132ps	%xmm13, %xmm0, %xmm2
	vcvtsi2ssl	%esi, %xmm8, %xmm10
	vcvtsi2ssl	%r8d, %xmm8, %xmm0
	vunpcklps	%xmm12, %xmm10, %xmm10
	vunpcklps	%xmm11, %xmm0, %xmm0
	vmovlhps	%xmm10, %xmm0, %xmm0
	vfnmadd231ps	.LC204(%rip), %xmm0, %xmm4
	vfmadd231ps	%xmm9, %xmm1, %xmm7
	vfmadd132ps	.LC198(%rip), %xmm3, %xmm1
	vfmadd231ps	%xmm9, %xmm0, %xmm6
	vfmadd132ps	.LC198(%rip), %xmm2, %xmm0
	vmovaps	%xmm7, -32(%r14,%rdx,4)
	vmovaps	%xmm5, -32(%r12,%rdx,4)
	vmovaps	%xmm6, -16(%r14,%rdx,4)
	vmovaps	%xmm4, -16(%r12,%rdx,4)
	vaddps	%xmm15, %xmm1, %xmm1
	vaddps	%xmm15, %xmm0, %xmm0
	vmovaps	%xmm1, -32(%r13,%rdx,4)
	vmovaps	%xmm0, -16(%r13,%rdx,4)
	addq	$8, %rdx
	cmpl	112(%rsp), %ecx
	jl	.L4621
	cmpl	140(%rsp), %ecx
	jle	.L4622
	jmp	.L4620
.L4658:
	movl	$100, %eax
	subl	%ecx, %eax
	addl	%eax, %eax
	jmp	.L4580
.L4659:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE846:
	.size	stbi_write_jpg_core.part.0, .-stbi_write_jpg_core.part.0
	.section	.rodata.str1.1
.LC215:
	.string	"max value > 65535"
	.section	.text.unlikely
.LCOLDB216:
	.text
.LHOTB216:
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
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rsi, %r13
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdx, %rbx
	movq	%rcx, %rbp
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	vmovdqu	208(%rdi), %xmm0
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	leaq	36(%rsp), %rax
	testq	%rsi, %rsi
	cmove	%rax, %r13
	testq	%rdx, %rdx
	cmove	%rax, %rbx
	testq	%rcx, %rcx
	cmove	%rax, %rbp
	vpextrq	$1, %xmm0, %rax
	vmovdqu	%xmm0, 192(%rdi)
	vmovq	%xmm0, %rdx
	cmpq	%rdx, %rax
	ja	.L4769
	movl	48(%rdi), %r11d
	testl	%r11d, %r11d
	jne	.L4770
.L4667:
	vmovdqu	%xmm0, 192(%r14)
	xorl	%eax, %eax
.L4661:
	movq	40(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L4771
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
	.p2align 4
	.p2align 3
.L4769:
	.cfi_restore_state
	leaq	1(%rdx), %rcx
	movq	%rcx, 192(%rdi)
	movzbl	(%rdx), %r15d
.L4666:
	cmpq	%rcx, %rax
	jbe	.L4772
	leaq	1(%rcx), %rdx
	movq	%rdx, 192(%r14)
	movzbl	(%rcx), %ecx
.L4672:
	cmpb	$80, %r15b
	jne	.L4768
	leal	-53(%rcx), %esi
	cmpb	$1, %sil
	ja	.L4768
	cmpb	$54, %cl
	sete	%cl
	movzbl	%cl, %ecx
	leal	1(%rcx,%rcx), %ecx
	movl	%ecx, 0(%rbp)
	cmpq	%rax, %rdx
	jb	.L4773
	movl	48(%r14), %r9d
	xorl	%ebp, %ebp
	testl	%r9d, %r9d
	jne	.L4774
.L4678:
	movb	%bpl, 35(%rsp)
	leaq	35(%rsp), %rbp
	movq	%r14, %rdi
	xorl	%r15d, %r15d
	movq	%rbp, %rsi
	call	stbi__pnm_skip_whitespace
	movq	16(%r14), %r12
	leaq	56(%r14), %rax
	movq	%rax, 8(%rsp)
	leaq	57(%r14), %rax
	movq	%rax, 16(%rsp)
.L4681:
	testq	%r12, %r12
	je	.L4695
	movq	40(%r14), %rdi
	call	*32(%r14)
	testl	%eax, %eax
	je	.L4694
	movl	48(%r14), %edi
	testl	%edi, %edi
	je	.L4688
.L4695:
	movq	192(%r14), %rdx
	cmpq	200(%r14), %rdx
	jnb	.L4688
	movzbl	35(%rsp), %eax
	subl	$48, %eax
	cmpb	$9, %al
	jbe	.L4775
.L4688:
	movl	%r15d, 0(%r13)
	movq	%rbp, %rsi
	movq	%r14, %rdi
	xorl	%r15d, %r15d
	call	stbi__pnm_skip_whitespace
	leaq	57(%r14), %rax
	leaq	56(%r14), %r13
	movq	16(%r14), %r12
	movq	%rax, 8(%rsp)
.L4696:
	testq	%r12, %r12
	je	.L4711
	movq	40(%r14), %rdi
	call	*32(%r14)
	testl	%eax, %eax
	je	.L4710
	movl	48(%r14), %ecx
	testl	%ecx, %ecx
	je	.L4704
.L4711:
	movq	192(%r14), %rdx
	cmpq	200(%r14), %rdx
	jnb	.L4704
	movzbl	35(%rsp), %eax
	subl	$48, %eax
	cmpb	$9, %al
	jbe	.L4776
.L4704:
	movl	%r15d, (%rbx)
	movq	%rbp, %rsi
	movq	%r14, %rdi
	xorl	%ebx, %ebx
	call	stbi__pnm_skip_whitespace
	leaq	56(%r14), %r15
	leaq	57(%r14), %rbp
	movq	16(%r14), %r12
.L4712:
	testq	%r12, %r12
	je	.L4723
	movq	40(%r14), %rdi
	call	*32(%r14)
	testl	%eax, %eax
	je	.L4722
	movl	48(%r14), %eax
	testl	%eax, %eax
	je	.L4718
.L4723:
	movq	192(%r14), %rdx
	cmpq	200(%r14), %rdx
	jnb	.L4718
	movzbl	35(%rsp), %eax
	subl	$48, %eax
	cmpb	$9, %al
	jbe	.L4777
.L4718:
	cmpl	$65535, %ebx
	jg	.L4778
	xorl	%eax, %eax
	cmpl	$255, %ebx
	setg	%al
	leal	8(,%rax,8), %eax
	jmp	.L4661
	.p2align 4
	.p2align 3
.L4768:
	vmovdqu	208(%r14), %xmm0
	jmp	.L4667
	.p2align 4
	.p2align 3
.L4777:
	movsbl	%al, %eax
	leal	(%rbx,%rbx,4), %esi
	leal	(%rax,%rsi,2), %ebx
	leaq	1(%rdx), %rax
	movq	%rax, 192(%r14)
	movzbl	(%rdx), %eax
	movb	%al, 35(%rsp)
	testq	%r12, %r12
	je	.L4760
	movq	16(%r14), %r12
	jmp	.L4712
	.p2align 4
	.p2align 3
.L4775:
	movsbl	%al, %eax
	leal	(%r15,%r15,4), %esi
	leal	(%rax,%rsi,2), %r15d
	leaq	1(%rdx), %rax
	movq	%rax, 192(%r14)
	movzbl	(%rdx), %eax
	movb	%al, 35(%rsp)
	testq	%r12, %r12
	je	.L4762
	movq	16(%r14), %r12
	jmp	.L4681
	.p2align 4
	.p2align 3
.L4776:
	movsbl	%al, %eax
	leal	(%r15,%r15,4), %esi
	leal	(%rax,%rsi,2), %r15d
	leaq	1(%rdx), %rax
	movq	%rax, 192(%r14)
	movzbl	(%rdx), %eax
	movb	%al, 35(%rsp)
	testq	%r12, %r12
	je	.L4761
	movq	16(%r14), %r12
	jmp	.L4696
	.p2align 4
	.p2align 3
.L4694:
	movsbl	35(%rsp), %edx
	movl	%edx, %eax
	subl	$48, %eax
	cmpb	$9, %al
	ja	.L4688
	leal	(%r15,%r15,4), %eax
	movq	16(%r14), %r12
	leal	-48(%rdx,%rax,2), %r15d
	movq	192(%r14), %rax
	cmpq	200(%r14), %rax
	jb	.L4682
	movl	48(%r14), %r8d
	xorl	%r11d, %r11d
	testl	%r8d, %r8d
	jne	.L4779
.L4683:
	movb	%r11b, 35(%rsp)
	jmp	.L4681
	.p2align 4
	.p2align 3
.L4710:
	movsbl	35(%rsp), %edx
	movl	%edx, %eax
	subl	$48, %eax
	cmpb	$9, %al
	ja	.L4704
	leal	(%r15,%r15,4), %eax
	movq	16(%r14), %r12
	leal	-48(%rdx,%rax,2), %r15d
	movq	192(%r14), %rax
	cmpq	200(%r14), %rax
	jb	.L4698
	movl	48(%r14), %esi
	xorl	%r9d, %r9d
	testl	%esi, %esi
	jne	.L4780
.L4699:
	movb	%r9b, 35(%rsp)
	jmp	.L4696
	.p2align 4
	.p2align 3
.L4722:
	movsbl	35(%rsp), %edx
	movl	%edx, %eax
	subl	$48, %eax
	cmpb	$9, %al
	ja	.L4718
	leal	(%rbx,%rbx,4), %eax
	movq	16(%r14), %r12
	leal	-48(%rdx,%rax,2), %ebx
	movq	192(%r14), %rax
	cmpq	200(%r14), %rax
	jb	.L4714
	movl	48(%r14), %edx
	xorl	%r13d, %r13d
	testl	%edx, %edx
	jne	.L4781
.L4715:
	movb	%r13b, 35(%rsp)
	jmp	.L4712
	.p2align 4
	.p2align 3
.L4779:
	movl	52(%r14), %edx
	movq	40(%r14), %rdi
	movb	%r11b, 29(%rsp)
	movq	8(%rsp), %rsi
	call	*%r12
	movq	192(%r14), %rdx
	subq	208(%r14), %rdx
	addl	%edx, 184(%r14)
	testl	%eax, %eax
	jne	.L4684
	movq	16(%rsp), %rax
	movzbl	29(%rsp), %r11d
	movl	$0, 48(%r14)
	movb	$0, 56(%r14)
.L4685:
	vmovq	16(%rsp), %xmm1
	vpinsrq	$1, %rax, %xmm1, %xmm0
	movq	16(%r14), %r12
	vmovdqu	%xmm0, 192(%r14)
	jmp	.L4683
	.p2align 4
	.p2align 3
.L4781:
	movl	52(%r14), %edx
	movq	40(%r14), %rdi
	movq	%r15, %rsi
	call	*%r12
	movq	192(%r14), %rdx
	subq	208(%r14), %rdx
	addl	%edx, 184(%r14)
	testl	%eax, %eax
	jne	.L4716
	movl	$0, 48(%r14)
	movq	%rbp, %rax
	movb	$0, 56(%r14)
.L4717:
	vmovq	%rbp, %xmm3
	vpinsrq	$1, %rax, %xmm3, %xmm0
	movq	16(%r14), %r12
	vmovdqu	%xmm0, 192(%r14)
	jmp	.L4715
	.p2align 4
	.p2align 3
.L4780:
	movl	52(%r14), %edx
	movq	40(%r14), %rdi
	movb	%r9b, 16(%rsp)
	movq	%r13, %rsi
	call	*%r12
	movq	192(%r14), %rdx
	subq	208(%r14), %rdx
	addl	%edx, 184(%r14)
	testl	%eax, %eax
	jne	.L4700
	movq	8(%rsp), %rax
	movzbl	16(%rsp), %r9d
	movl	$0, 48(%r14)
	movb	$0, 56(%r14)
.L4701:
	vmovq	8(%rsp), %xmm2
	vpinsrq	$1, %rax, %xmm2, %xmm0
	movq	16(%r14), %r12
	vmovdqu	%xmm0, 192(%r14)
	jmp	.L4699
	.p2align 4
	.p2align 3
.L4772:
	movl	48(%r14), %r10d
	testl	%r10d, %r10d
	je	.L4768
	leaq	56(%r14), %r12
	movl	52(%r14), %edx
	movq	40(%r14), %rdi
	movq	%r12, %rsi
	call	*16(%r14)
	movq	192(%r14), %rdx
	subq	208(%r14), %rdx
	addl	%edx, 184(%r14)
	leaq	57(%r14), %rdx
	testl	%eax, %eax
	jne	.L4674
	movl	$0, 48(%r14)
	movq	%rdx, %rax
	xorl	%ecx, %ecx
	movb	$0, 56(%r14)
.L4675:
	vmovq	%rdx, %xmm5
	vpinsrq	$1, %rax, %xmm5, %xmm0
	vmovdqu	%xmm0, 192(%r14)
	jmp	.L4672
	.p2align 4
	.p2align 3
.L4770:
	leaq	56(%rdi), %r12
	movl	52(%rdi), %edx
	movq	40(%rdi), %rdi
	movq	%r12, %rsi
	call	*16(%r14)
	movq	192(%r14), %rdx
	leaq	57(%r14), %rcx
	subq	208(%r14), %rdx
	addl	%edx, 184(%r14)
	testl	%eax, %eax
	jne	.L4668
	movl	$0, 48(%r14)
	movq	%rcx, %rax
	xorl	%r15d, %r15d
	movb	$0, 56(%r14)
.L4669:
	vmovq	%rcx, %xmm4
	vpinsrq	$1, %rax, %xmm4, %xmm0
	vmovdqu	%xmm0, 192(%r14)
	jmp	.L4666
	.p2align 4
	.p2align 3
.L4773:
	leaq	1(%rdx), %rax
	movq	%rax, 192(%r14)
	movzbl	(%rdx), %ebp
	jmp	.L4678
	.p2align 4
	.p2align 3
.L4778:
	leaq	.LC215(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L4661
	.p2align 4
	.p2align 3
.L4700:
	cltq
	movzbl	56(%r14), %r9d
	addq	%r13, %rax
	jmp	.L4701
	.p2align 4
	.p2align 3
.L4684:
	cltq
	movzbl	56(%r14), %r11d
	addq	8(%rsp), %rax
	jmp	.L4685
	.p2align 4
	.p2align 3
.L4716:
	cltq
	movzbl	56(%r14), %r13d
	addq	%r15, %rax
	jmp	.L4717
	.p2align 4
	.p2align 3
.L4668:
	cltq
	movzbl	56(%r14), %r15d
	addq	%r12, %rax
	jmp	.L4669
	.p2align 4
	.p2align 3
.L4674:
	cltq
	movzbl	56(%r14), %ecx
	addq	%r12, %rax
	jmp	.L4675
	.p2align 4
	.p2align 3
.L4774:
	leaq	56(%r14), %r12
	movl	52(%r14), %edx
	movq	40(%r14), %rdi
	movq	%r12, %rsi
	call	*16(%r14)
	movq	192(%r14), %rdx
	subq	208(%r14), %rdx
	addl	%edx, 184(%r14)
	leaq	57(%r14), %rdx
	testl	%eax, %eax
	jne	.L4679
	movl	$0, 48(%r14)
	movq	%rdx, %r12
	movb	$0, 56(%r14)
.L4680:
	vmovq	%rdx, %xmm6
	vpinsrq	$1, %r12, %xmm6, %xmm0
	vmovdqu	%xmm0, 192(%r14)
	jmp	.L4678
	.p2align 4
	.p2align 3
.L4679:
	cltq
	movzbl	56(%r14), %ebp
	addq	%rax, %r12
	jmp	.L4680
.L4771:
	call	__stack_chk_fail@PLT
.L4714:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%r14)
	movzbl	(%rax), %eax
	movb	%al, 35(%rsp)
	jmp	.L4712
.L4698:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%r14)
	movzbl	(%rax), %eax
	movb	%al, 35(%rsp)
	jmp	.L4696
.L4682:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%r14)
	movzbl	(%rax), %eax
	movb	%al, 35(%rsp)
	jmp	.L4681
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.type	stbi__pnm_info.cold, @function
stbi__pnm_info.cold:
.LFSB773:
.L4761:
	.cfi_def_cfa_offset 112
	.cfi_offset 3, -56
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
	.cfi_offset 15, -16
	movq	200(%r14), %rsi
	xorl	%edx, %edx
.L4707:
	movq	192(%r14), %rcx
	cmpq	%rsi, %rcx
	jnb	.L4782
	subl	$48, %eax
	cmpb	$9, %al
	jbe	.L4705
	testb	%dl, %dl
	je	.L4704
	movzbl	30(%rsp), %eax
	movb	%al, 35(%rsp)
	jmp	.L4704
.L4762:
	movq	200(%r14), %rsi
	xorl	%edx, %edx
.L4691:
	movq	192(%r14), %rcx
	cmpq	%rcx, %rsi
	jbe	.L4783
	subl	$48, %eax
	cmpb	$9, %al
	jbe	.L4689
	testb	%dl, %dl
	je	.L4688
	movzbl	31(%rsp), %eax
	movb	%al, 35(%rsp)
	jmp	.L4688
.L4760:
	movq	200(%r14), %rcx
.L4719:
	movq	192(%r14), %rdx
	cmpq	%rcx, %rdx
	jnb	.L4718
	subl	$48, %eax
	cmpb	$9, %al
	ja	.L4718
	movsbl	%al, %eax
	leal	(%rbx,%rbx,4), %esi
	leal	(%rax,%rsi,2), %ebx
	leaq	1(%rdx), %rax
	movq	%rax, 192(%r14)
	movzbl	(%rdx), %eax
	jmp	.L4719
.L4783:
	testb	%dl, %dl
	je	.L4688
	movzbl	31(%rsp), %eax
	movb	%al, 35(%rsp)
	jmp	.L4688
.L4782:
	testb	%dl, %dl
	je	.L4704
	movzbl	30(%rsp), %eax
	movb	%al, 35(%rsp)
	jmp	.L4704
.L4705:
	leal	(%r15,%r15,4), %edx
	movsbl	%al, %eax
	leal	(%rax,%rdx,2), %r15d
	leaq	1(%rcx), %rax
	movl	$1, %edx
	movq	%rax, 192(%r14)
	movzbl	(%rcx), %eax
	movb	%al, 30(%rsp)
	jmp	.L4707
.L4689:
	leal	(%r15,%r15,4), %edx
	movsbl	%al, %eax
	leal	(%rax,%rdx,2), %r15d
	leaq	1(%rcx), %rax
	movl	$1, %edx
	movq	%rax, 192(%r14)
	movzbl	(%rcx), %eax
	movb	%al, 31(%rsp)
	jmp	.L4691
	.cfi_endproc
.LFE773:
	.text
	.size	stbi__pnm_info, .-stbi__pnm_info
	.section	.text.unlikely
	.size	stbi__pnm_info.cold, .-stbi__pnm_info.cold
.LCOLDE216:
	.text
.LHOTE216:
	.p2align 4
	.type	stbi__is_16_main, @function
stbi__is_16_main:
.LFB776:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	xorl	%edx, %edx
	movl	$2, %esi
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%rdi, %rbp
	subq	$56, %rsp
	.cfi_def_cfa_offset 96
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	movq	%rdi, (%rsp)
	movq	%rsp, %rdi
	call	stbi__parse_png_file
	testl	%eax, %eax
	je	.L4818
	cmpl	$16, 32(%rsp)
	movl	$1, %r12d
	je	.L4784
	movq	(%rsp), %rax
	vmovdqu	208(%rax), %xmm1
	vmovdqu	%xmm1, 192(%rax)
.L4786:
	movq	192(%rbp), %rdx
	movq	200(%rbp), %rax
	cmpq	%rax, %rdx
	jb	.L4819
	movl	48(%rbp), %esi
	testl	%esi, %esi
	jne	.L4820
.L4817:
	movq	208(%rbp), %rax
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	xorl	%esi, %esi
	movq	%rbp, %rdi
	xorl	%r12d, %r12d
	movq	%rax, 192(%rbp)
	movq	216(%rbp), %rax
	movq	%rax, 200(%rbp)
	call	stbi__pnm_info
	cmpl	$16, %eax
	sete	%r12b
.L4784:
	movq	40(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L4821
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	movl	%r12d, %eax
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4
	.p2align 3
.L4818:
	.cfi_restore_state
	movq	(%rsp), %rax
	vmovdqu	208(%rax), %xmm2
	vmovdqu	%xmm2, 192(%rax)
	jmp	.L4786
	.p2align 4
	.p2align 3
.L4819:
	leaq	1(%rdx), %rsi
	movq	%rsi, 192(%rbp)
	movzbl	(%rdx), %ebx
	sall	$8, %ebx
	movl	%ebx, %r13d
.L4790:
	cmpq	%rax, %rsi
	jnb	.L4794
	leaq	1(%rsi), %rcx
	movq	%rcx, 192(%rbp)
	movzbl	(%rsi), %edx
	addl	%edx, %r13d
.L4795:
	sall	$16, %r13d
	cmpq	%rax, %rcx
	jnb	.L4798
	leaq	1(%rcx), %rdx
	movq	%rdx, 192(%rbp)
	movzbl	(%rcx), %ebx
	sall	$8, %ebx
.L4799:
	cmpq	%rax, %rdx
	jnb	.L4803
	leaq	1(%rdx), %rax
	movq	%rax, 192(%rbp)
	movzbl	(%rdx), %eax
	addl	%eax, %ebx
.L4804:
	addl	%r13d, %ebx
	cmpl	$943870035, %ebx
	jne	.L4817
	movq	%rbp, %rdi
	call	stbi__get16be
	movl	%eax, %r12d
	cmpl	$1, %eax
	jne	.L4817
	movq	%rbp, %rdi
	movl	$6, %esi
	call	stbi__skip.part.0
	movq	%rbp, %rdi
	call	stbi__get16be
	cmpl	$16, %eax
	ja	.L4817
	movq	%rbp, %rdi
	call	stbi__get16be
	cmpl	$16, %eax
	je	.L4784
	jmp	.L4817
	.p2align 4
	.p2align 3
.L4820:
	leaq	56(%rbp), %r12
	movl	52(%rbp), %edx
	movq	40(%rbp), %rdi
	movq	%r12, %rsi
	call	*16(%rbp)
	leaq	57(%rbp), %rsi
	movl	%eax, %r13d
	movq	192(%rbp), %rax
	subq	208(%rbp), %rax
	addl	%eax, 184(%rbp)
	testl	%r13d, %r13d
	je	.L4822
	movslq	%r13d, %rbx
	leaq	(%r12,%rbx), %rax
	movzbl	56(%rbp), %ebx
	sall	$8, %ebx
	movl	%ebx, %r13d
.L4793:
	vmovq	%rsi, %xmm3
	vpinsrq	$1, %rax, %xmm3, %xmm0
	vmovdqu	%xmm0, 192(%rbp)
	jmp	.L4790
	.p2align 4
	.p2align 3
.L4803:
	movl	48(%rbp), %eax
	testl	%eax, %eax
	je	.L4804
	leaq	56(%rbp), %r12
	movl	52(%rbp), %edx
	movq	40(%rbp), %rdi
	movq	%r12, %rsi
	call	*16(%rbp)
	movq	192(%rbp), %rdx
	subq	208(%rbp), %rdx
	addl	%edx, 184(%rbp)
	leaq	57(%rbp), %rdx
	testl	%eax, %eax
	je	.L4823
	cltq
	addq	%rax, %r12
	movzbl	56(%rbp), %eax
	addl	%eax, %ebx
.L4806:
	vmovq	%rdx, %xmm6
	vpinsrq	$1, %r12, %xmm6, %xmm0
	vmovdqu	%xmm0, 192(%rbp)
	jmp	.L4804
	.p2align 4
	.p2align 3
.L4798:
	movl	48(%rbp), %edx
	testl	%edx, %edx
	je	.L4817
	leaq	56(%rbp), %r12
	movl	52(%rbp), %edx
	movq	40(%rbp), %rdi
	movq	%r12, %rsi
	call	*16(%rbp)
	leaq	57(%rbp), %rdx
	movslq	%eax, %rbx
	movq	192(%rbp), %rax
	subq	208(%rbp), %rax
	addl	%eax, 184(%rbp)
	testl	%ebx, %ebx
	je	.L4824
	leaq	(%r12,%rbx), %rax
	movzbl	56(%rbp), %ebx
	sall	$8, %ebx
.L4802:
	vmovq	%rdx, %xmm5
	vpinsrq	$1, %rax, %xmm5, %xmm0
	vmovdqu	%xmm0, 192(%rbp)
	jmp	.L4799
	.p2align 4
	.p2align 3
.L4794:
	movl	48(%rbp), %ecx
	testl	%ecx, %ecx
	je	.L4817
	leaq	56(%rbp), %r12
	movl	52(%rbp), %edx
	movq	40(%rbp), %rdi
	movq	%r12, %rsi
	call	*16(%rbp)
	movq	192(%rbp), %rdx
	leaq	57(%rbp), %rcx
	subq	208(%rbp), %rdx
	addl	%edx, 184(%rbp)
	testl	%eax, %eax
	je	.L4825
	movzbl	56(%rbp), %edx
	cltq
	addq	%r12, %rax
	addl	%edx, %r13d
.L4797:
	vmovq	%rcx, %xmm4
	vpinsrq	$1, %rax, %xmm4, %xmm0
	vmovdqu	%xmm0, 192(%rbp)
	jmp	.L4795
	.p2align 4
	.p2align 3
.L4825:
	movl	$0, 48(%rbp)
	movb	$0, 56(%rbp)
	movq	%rcx, %rax
	jmp	.L4797
	.p2align 4
	.p2align 3
.L4824:
	movl	$0, 48(%rbp)
	movb	$0, 56(%rbp)
	movq	%rdx, %rax
	jmp	.L4802
	.p2align 4
	.p2align 3
.L4823:
	movl	$0, 48(%rbp)
	movb	$0, 56(%rbp)
	movq	%rdx, %r12
	jmp	.L4806
	.p2align 4
	.p2align 3
.L4822:
	movl	$0, 48(%rbp)
	movb	$0, 56(%rbp)
	movq	%rsi, %rax
	jmp	.L4793
.L4821:
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
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rdi, %rbp
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movq	192(%rdi), %rdx
	movq	200(%rdi), %rax
	cmpq	%rax, %rdx
	jb	.L4840
	movl	48(%rdi), %ecx
	testl	%ecx, %ecx
	jne	.L4829
.L4832:
	xorl	%eax, %eax
.L4826:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4
	.p2align 3
.L4840:
	.cfi_restore_state
	leaq	1(%rdx), %rcx
	movq	%rcx, 192(%rdi)
	movzbl	(%rdx), %edx
.L4828:
	cmpb	$71, %dl
	jne	.L4832
	cmpq	%rax, %rcx
	jb	.L4841
	movl	48(%rbp), %edx
	testl	%edx, %edx
	je	.L4832
	leaq	56(%rbp), %rbx
	movl	52(%rbp), %edx
	movq	40(%rbp), %rdi
	movq	%rbx, %rsi
	call	*16(%rbp)
	movq	192(%rbp), %rdx
	subq	208(%rbp), %rdx
	addl	%edx, 184(%rbp)
	leaq	57(%rbp), %rdx
	testl	%eax, %eax
	jne	.L4835
	vmovq	%rdx, %xmm3
	vpunpcklqdq	%xmm3, %xmm3, %xmm0
	movl	$0, 48(%rbp)
	movb	$0, 56(%rbp)
	vmovdqu	%xmm0, 192(%rbp)
	jmp	.L4832
	.p2align 4
	.p2align 3
.L4829:
	leaq	56(%rdi), %rbx
	movl	52(%rdi), %edx
	movq	40(%rdi), %rdi
	movq	%rbx, %rsi
	call	*16(%rbp)
	movq	192(%rbp), %rdx
	leaq	57(%rbp), %rcx
	subq	208(%rbp), %rdx
	addl	%edx, 184(%rbp)
	testl	%eax, %eax
	jne	.L4831
	vmovq	%rcx, %xmm1
	vpunpcklqdq	%xmm1, %xmm1, %xmm0
	movl	$0, 48(%rbp)
	movb	$0, 56(%rbp)
	vmovdqu	%xmm0, 192(%rbp)
	jmp	.L4832
	.p2align 4
	.p2align 3
.L4841:
	leaq	1(%rcx), %rdx
	movq	%rdx, 192(%rbp)
	movzbl	(%rcx), %ecx
.L4834:
	cmpb	$73, %cl
	jne	.L4832
	cmpq	%rax, %rdx
	jb	.L4842
	movl	48(%rbp), %eax
	testl	%eax, %eax
	je	.L4832
	leaq	56(%rbp), %rbx
	movl	52(%rbp), %edx
	movq	40(%rbp), %rdi
	movq	%rbx, %rsi
	call	*16(%rbp)
	movq	192(%rbp), %rdx
	leaq	57(%rbp), %rcx
	subq	208(%rbp), %rdx
	addl	%edx, 184(%rbp)
	testl	%eax, %eax
	jne	.L4838
	vmovq	%rcx, %xmm5
	vpunpcklqdq	%xmm5, %xmm5, %xmm0
	movl	$0, 48(%rbp)
	movb	$0, 56(%rbp)
	vmovdqu	%xmm0, 192(%rbp)
	jmp	.L4832
	.p2align 4
	.p2align 3
.L4831:
	cltq
	vmovq	%rcx, %xmm2
	movzbl	56(%rbp), %edx
	addq	%rbx, %rax
	vpinsrq	$1, %rax, %xmm2, %xmm0
	vmovdqu	%xmm0, 192(%rbp)
	jmp	.L4828
	.p2align 4
	.p2align 3
.L4842:
	leaq	1(%rdx), %rax
	movq	%rax, 192(%rbp)
	movzbl	(%rdx), %edx
.L4837:
	cmpb	$70, %dl
	jne	.L4832
	movq	%rbp, %rdi
	call	stbi__get8
	cmpb	$56, %al
	jne	.L4832
	movq	%rbp, %rdi
	call	stbi__get8
	subl	$55, %eax
	testb	$-3, %al
	jne	.L4832
	movq	%rbp, %rdi
	call	stbi__get8
	cmpb	$97, %al
	sete	%al
	movzbl	%al, %eax
	jmp	.L4826
	.p2align 4
	.p2align 3
.L4835:
	cltq
	vmovq	%rdx, %xmm4
	movzbl	56(%rbp), %ecx
	addq	%rbx, %rax
	vpinsrq	$1, %rax, %xmm4, %xmm0
	vmovdqu	%xmm0, 192(%rbp)
	jmp	.L4834
.L4838:
	cltq
	vmovq	%rcx, %xmm6
	movzbl	56(%rbp), %edx
	addq	%rax, %rbx
	vpinsrq	$1, %rbx, %xmm6, %xmm0
	vmovdqu	%xmm0, 192(%rbp)
	jmp	.L4837
	.cfi_endproc
.LFE745:
	.size	stbi__gif_test_raw, .-stbi__gif_test_raw
	.section	.rodata.str1.1
.LC217:
	.string	"not BMP"
.LC218:
	.string	"bad offset"
.LC219:
	.string	"invalid"
.LC220:
	.string	"bad bpp"
.LC221:
	.string	"bad masks"
.LC222:
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
	jb	.L5145
	movl	48(%rdi), %ebp
	testl	%ebp, %ebp
	jne	.L4846
.L4849:
	leaq	.LC217(%rip), %rax
	xorl	%ebp, %ebp
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
.L4843:
	movq	1240(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L5146
	addq	$1256, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%rbp, %rax
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
	.p2align 4
	.p2align 3
.L5145:
	.cfi_restore_state
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rdi)
	movzbl	(%rax), %edx
.L4845:
	cmpb	$66, %dl
	jne	.L4849
	movq	%rbx, %rdi
	call	stbi__get8
	cmpb	$77, %al
	jne	.L4849
	leaq	160(%rsp), %rsi
	movq	%rbx, %rdi
	call	stbi__bmp_parse_header.part.0
	testq	%rax, %rax
	je	.L5144
	movl	4(%rbx), %eax
	movl	%eax, %ecx
	movl	%eax, 144(%rsp)
	negl	%ecx
	cmovs	%eax, %ecx
	movl	%ecx, 4(%rbx)
	cmpl	$16777216, %ecx
	jg	.L4852
	movl	(%rbx), %esi
	cmpl	$16777216, %esi
	ja	.L4852
	movl	172(%rsp), %eax
	movl	168(%rsp), %r12d
	movl	164(%rsp), %r15d
	movl	%eax, 68(%rsp)
	movl	176(%rsp), %eax
	movl	%eax, 64(%rsp)
	movl	180(%rsp), %eax
	movl	%eax, 72(%rsp)
	movl	184(%rsp), %eax
	movl	%eax, 8(%rsp)
	movl	188(%rsp), %eax
	movl	%eax, 24(%rsp)
	movl	160(%rsp), %eax
	movl	%eax, 16(%rsp)
	cmpl	$12, %r12d
	je	.L5147
	cmpl	$15, 16(%rsp)
	jg	.L4854
	movl	%r15d, %eax
	subl	192(%rsp), %eax
	subl	%r12d, %eax
	sarl	$2, %eax
	movl	%eax, 32(%rsp)
	movl	32(%rsp), %edx
	testl	%edx, %edx
	jne	.L5148
.L4854:
	movq	192(%rbx), %rax
	subq	208(%rbx), %rax
	movslq	%r15d, %rdx
	movslq	184(%rbx), %rdi
	addq	%rdi, %rax
	cmpq	%rax, %rdx
	jne	.L5149
	cmpl	$-16777216, 8(%rsp)
	movl	$0, 32(%rsp)
	sete	%r14b
	cmpl	$24, 16(%rsp)
	sete	%r13b
	movl	%r13d, %eax
	andb	%r14b, %al
	jne	.L5150
.L4857:
	cmpl	$1, 8(%rsp)
	movl	$3, %eax
	sbbl	$-1, %eax
	cmpl	$2, 104(%rsp)
	movl	%eax, 56(%rsp)
	movl	%eax, 8(%rbx)
	jle	.L4859
.L4858:
	testl	%esi, %esi
	je	.L5151
	movl	$2147483647, %eax
	cltd
	idivl	%esi
	cmpl	%eax, 104(%rsp)
	jle	.L5152
.L4852:
	leaq	.LC93(%rip), %rax
	xorl	%ebp, %ebp
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L4843
.L5150:
	cmpl	$2, 104(%rsp)
	movl	$3, 8(%rbx)
	movl	%eax, %r14d
	movl	%eax, %r13d
	jg	.L4858
	movl	$3, 56(%rsp)
	.p2align 4
	.p2align 3
.L4859:
	testl	%esi, %esi
	jne	.L4861
.L5015:
	xorl	%edi, %edi
.L5012:
	imull	%ecx, %edi
	movslq	%edi, %rdi
	call	malloc@PLT
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L4863
	cmpl	$15, 16(%rsp)
	jg	.L4864
	movl	32(%rsp), %eax
	testl	%eax, %eax
	je	.L4865
	cmpl	$256, %eax
	jg	.L4865
	testl	%eax, %eax
	jle	.L4885
	decl	%eax
	leaq	57(%rbx), %rdx
	movq	%rbp, 48(%rsp)
	leaq	208(%rsp), %r14
	leaq	212(%rsp,%rax,4), %r13
	leaq	56(%rbx), %rax
	movq	%rbx, %rbp
	movq	%rdx, 8(%rsp)
	movl	%r15d, 40(%rsp)
	movq	%rax, %rbx
	jmp	.L4884
	.p2align 4
	.p2align 3
.L4869:
	movl	48(%rbp), %r11d
	testl	%r11d, %r11d
	jne	.L5153
	movb	$0, 2(%r14)
.L4874:
	movl	48(%rbp), %r10d
	testl	%r10d, %r10d
	jne	.L5154
	movb	$0, 1(%r14)
.L4879:
	movl	48(%rbp), %r9d
	xorl	%r15d, %r15d
	testl	%r9d, %r9d
	jne	.L5155
.L4880:
	movb	%r15b, (%r14)
	cmpl	$12, %r12d
	je	.L4883
	movq	%rbp, %rdi
	call	stbi__get8
.L4883:
	addq	$4, %r14
	cmpq	%r14, %r13
	je	.L5156
.L4884:
	movq	192(%rbp), %rdx
	movq	200(%rbp), %rax
	cmpq	%rax, %rdx
	jnb	.L4869
	leaq	1(%rdx), %rsi
	movq	%rsi, 192(%rbp)
	movzbl	(%rdx), %edx
.L4870:
	movb	%dl, 2(%r14)
	cmpq	%rax, %rsi
	jnb	.L4874
	leaq	1(%rsi), %rdx
	movq	%rdx, 192(%rbp)
	movzbl	(%rsi), %esi
.L4875:
	movb	%sil, 1(%r14)
	cmpq	%rax, %rdx
	jnb	.L4879
	leaq	1(%rdx), %rax
	movq	%rax, 192(%rbp)
	movzbl	(%rdx), %r15d
	jmp	.L4880
	.p2align 4
	.p2align 3
.L5147:
	cmpl	$23, %eax
	jg	.L4854
	movl	%r15d, %eax
	subl	192(%rsp), %eax
	subl	$24, %eax
	movslq	%eax, %rdx
	sarl	$31, %eax
	imulq	$1431655766, %rdx, %rdx
	shrq	$32, %rdx
	subl	%eax, %edx
	movl	%edx, 32(%rsp)
	movl	32(%rsp), %edx
	testl	%edx, %edx
	je	.L4854
.L5148:
	cmpl	$-16777216, 8(%rsp)
	sete	%r14b
	cmpl	$24, 16(%rsp)
	sete	%r13b
	jmp	.L4857
.L5152:
	movl	104(%rsp), %eax
	movl	%eax, 56(%rsp)
.L4861:
	movl	56(%rsp), %edi
	movl	144(%rsp), %eax
	imull	%esi, %edi
	testl	%eax, %eax
	je	.L5157
	movl	$2147483647, %r8d
	movl	%r8d, %eax
	cltd
	idivl	%ecx
	movl	%eax, %r9d
	cmpl	%eax, %edi
	jg	.L4852
	movl	%r8d, %eax
	cltd
	idivl	%esi
	cmpl	56(%rsp), %eax
	jl	.L4863
	cmpl	%edi, %r9d
	jge	.L5012
.L4863:
	leaq	.LC16(%rip), %rax
	xorl	%ebp, %ebp
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L4843
	.p2align 4
	.p2align 3
.L4864:
	movl	%r15d, %esi
	subl	192(%rsp), %esi
	subl	%r12d, %esi
	je	.L4922
	js	.L5158
	movq	%rbx, %rdi
	call	stbi__skip.part.0
.L4922:
	testb	%r13b, %r13b
	jne	.L5159
	cmpl	$16, 16(%rsp)
	je	.L5160
	cmpl	$32, 16(%rsp)
	jne	.L5032
	cmpl	$255, 72(%rsp)
	jne	.L5032
	cmpl	$65280, 64(%rsp)
	jne	.L5032
	cmpl	$16711680, 68(%rsp)
	jne	.L5032
	testb	%r14b, %r14b
	je	.L5032
	movl	(%rbx), %eax
	movl	$0, 108(%rsp)
	movl	$2, 60(%rsp)
	movl	%eax, %r11d
	jmp	.L5143
.L5032:
	movl	$0, 108(%rsp)
.L4927:
	movl	68(%rsp), %esi
	movl	64(%rsp), %edi
	testl	%esi, %esi
	sete	%al
	testl	%edi, %edi
	sete	%dl
	orb	%dl, %al
	jne	.L4952
	movl	72(%rsp), %ecx
	testl	%ecx, %ecx
	je	.L4952
	movl	68(%rsp), %eax
	cmpl	$65535, %eax
	ja	.L5161
	movl	$8, %edx
	xorl	%r12d, %r12d
.L4932:
	cmpl	$255, %eax
	jbe	.L4933
	shrl	$8, %eax
	movl	%edx, %r12d
.L4933:
	cmpl	$15, %eax
	jbe	.L4934
	addl	$4, %r12d
	shrl	$4, %eax
.L4934:
	cmpl	$3, %eax
	jbe	.L4935
	addl	$2, %r12d
	shrl	$2, %eax
.L4935:
	movl	68(%rsp), %edx
	cmpl	$1, %eax
	setne	%al
	movzbl	%al, %eax
	addl	%eax, %r12d
	movl	%edx, %eax
	andl	$1431655765, %edx
	shrl	%eax
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
	movl	%eax, 76(%rsp)
	movl	64(%rsp), %eax
	cmpl	$65535, %eax
	jbe	.L5034
	shrl	$16, %eax
	movl	$24, %edx
	movl	$16, %r13d
.L4937:
	cmpl	$255, %eax
	jbe	.L4938
	shrl	$8, %eax
	movl	%edx, %r13d
.L4938:
	cmpl	$15, %eax
	jbe	.L4939
	addl	$4, %r13d
	shrl	$4, %eax
.L4939:
	cmpl	$3, %eax
	jbe	.L4940
	addl	$2, %r13d
	shrl	$2, %eax
.L4940:
	movl	64(%rsp), %edx
	cmpl	$1, %eax
	setne	%al
	movzbl	%al, %eax
	addl	%eax, %r13d
	movl	%edx, %eax
	andl	$1431655765, %edx
	shrl	%eax
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
	jbe	.L5035
	shrl	$16, %eax
	movl	$24, %edx
	movl	$16, %ecx
.L4942:
	cmpl	$255, %eax
	jbe	.L4943
	shrl	$8, %eax
	movl	%edx, %ecx
.L4943:
	cmpl	$15, %eax
	jbe	.L4944
	addl	$4, %ecx
	shrl	$4, %eax
.L4944:
	cmpl	$3, %eax
	jbe	.L4945
	addl	$2, %ecx
	shrl	$2, %eax
.L4945:
	movl	72(%rsp), %edx
	cmpl	$1, %eax
	setne	%al
	movzbl	%al, %eax
	addl	%eax, %ecx
	movl	%edx, %eax
	andl	$1431655765, %edx
	shrl	%eax
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
	je	.L5036
	cmpl	$65535, %eax
	jbe	.L5037
	shrl	$16, %eax
	movl	$24, %esi
	movl	$16, %edx
.L4948:
	cmpl	$255, %eax
	jbe	.L4949
	shrl	$8, %eax
	movl	%esi, %edx
.L4949:
	cmpl	$15, %eax
	jbe	.L4950
	addl	$4, %edx
	shrl	$4, %eax
.L4950:
	cmpl	$3, %eax
	jbe	.L4951
	addl	$2, %edx
	shrl	$2, %eax
.L4951:
	cmpl	$1, %eax
	setne	%al
	movzbl	%al, %eax
	addl	%eax, %edx
.L4947:
	movl	8(%rsp), %edi
	movl	%edi, %eax
	andl	$1431655765, %edi
	shrl	%eax
	andl	$1431655765, %eax
	addl	%edi, %eax
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
	cmpl	$8, 76(%rsp)
	movzbl	%al, %eax
	movl	%eax, 112(%rsp)
	jg	.L4952
	cmpl	$8, 84(%rsp)
	jg	.L4952
	cmpl	$8, 88(%rsp)
	jg	.L4952
	cmpl	$8, %eax
	jg	.L4952
	leal	-7(%r12), %eax
	movl	$0, 60(%rsp)
	movl	%eax, 148(%rsp)
	leal	-7(%r13), %eax
	movl	%eax, 152(%rsp)
	leal	-7(%rcx), %eax
	movl	%eax, 156(%rsp)
	leal	-7(%rdx), %eax
	movl	%eax, 116(%rsp)
	movl	(%rbx), %eax
	movl	%eax, %r11d
	jmp	.L4925
	.p2align 4
	.p2align 3
.L5153:
	movl	52(%rbp), %edx
	movq	%rbx, %rsi
	movq	40(%rbp), %rdi
	call	*16(%rbp)
	movq	192(%rbp), %rdx
	subq	208(%rbp), %rdx
	movq	8(%rsp), %rsi
	addl	%edx, 184(%rbp)
	testl	%eax, %eax
	jne	.L4872
	movl	$0, 48(%rbp)
	movq	%rsi, %rax
	xorl	%edx, %edx
	vmovq	%rsi, %xmm6
	movb	$0, 56(%rbp)
.L4873:
	vpinsrq	$1, %rax, %xmm6, %xmm0
	vmovdqu	%xmm0, 192(%rbp)
	jmp	.L4870
	.p2align 4
	.p2align 3
.L5155:
	movl	52(%rbp), %edx
	movq	40(%rbp), %rdi
	movq	%rbx, %rsi
	call	*16(%rbp)
	movq	192(%rbp), %rdx
	subq	208(%rbp), %rdx
	addl	%edx, 184(%rbp)
	testl	%eax, %eax
	jne	.L4881
	movq	8(%rsp), %rax
	movl	$0, 48(%rbp)
	movb	$0, 56(%rbp)
.L4882:
	vmovq	8(%rsp), %xmm6
	vpinsrq	$1, %rax, %xmm6, %xmm0
	vmovdqu	%xmm0, 192(%rbp)
	jmp	.L4880
	.p2align 4
	.p2align 3
.L5154:
	movl	52(%rbp), %edx
	movq	40(%rbp), %rdi
	movq	%rbx, %rsi
	call	*16(%rbp)
	movq	192(%rbp), %rdx
	subq	208(%rbp), %rdx
	addl	%edx, 184(%rbp)
	movq	8(%rsp), %rdx
	testl	%eax, %eax
	jne	.L4877
	movl	$0, 48(%rbp)
	movq	%rdx, %rax
	xorl	%esi, %esi
	vmovq	%rdx, %xmm7
	movb	$0, 56(%rbp)
.L4878:
	vpinsrq	$1, %rax, %xmm7, %xmm0
	vmovdqu	%xmm0, 192(%rbp)
	jmp	.L4875
	.p2align 4
	.p2align 3
.L5156:
	movq	%rbp, %rbx
	movl	40(%rsp), %r15d
	movq	48(%rsp), %rbp
.L4885:
	movl	%r15d, %esi
	subl	192(%rsp), %esi
	xorl	%eax, %eax
	subl	%r12d, %esi
	cmpl	$12, %r12d
	setne	%al
	addl	$3, %eax
	imull	32(%rsp), %eax
	subl	%eax, %esi
	je	.L4886
	js	.L5162
	movq	%rbx, %rdi
	call	stbi__skip.part.0
.L4886:
	cmpl	$1, 16(%rsp)
	je	.L5163
	cmpl	$4, 16(%rsp)
	je	.L5164
	cmpl	$8, 16(%rsp)
	jne	.L4893
	movl	(%rbx), %eax
	movl	%eax, %r11d
	movl	%eax, %edx
.L4892:
	movl	4(%rbx), %r8d
	negl	%edx
	leaq	57(%rbx), %rdi
	xorl	%r13d, %r13d
	andl	$3, %edx
	movl	$0, 8(%rsp)
	movq	%rdi, 40(%rsp)
	movl	%edx, 48(%rsp)
	testl	%r8d, %r8d
	jle	.L4890
	movq	%rbp, %r14
	movl	16(%rsp), %r15d
	movl	%r13d, %ebp
	movl	56(%rsp), %r13d
	.p2align 4
	.p2align 3
.L5007:
	xorl	%r8d, %r8d
	leaq	56(%rbx), %rsi
	testl	%eax, %eax
	jle	.L4911
	.p2align 4
	.p2align 3
.L4919:
	movq	192(%rbx), %rax
	cmpq	200(%rbx), %rax
	jb	.L5165
	movl	48(%rbx), %eax
	xorl	%r12d, %r12d
	testl	%eax, %eax
	jne	.L5166
.L4906:
	xorl	%edx, %edx
	cmpl	$4, %r15d
	jne	.L4909
	movl	%r12d, %edx
	sarl	$4, %eax
	andl	$15, %edx
.L4909:
	cltq
	movslq	%ebp, %rcx
	leal	3(%rbp), %r12d
	movzbl	208(%rsp,%rax,4), %edi
	movb	%dil, (%r14,%rcx)
	movzbl	209(%rsp,%rax,4), %edi
	leal	1(%rbp), %ecx
	movzbl	210(%rsp,%rax,4), %eax
	movslq	%ecx, %rcx
	movb	%dil, (%r14,%rcx)
	leal	2(%rbp), %ecx
	movslq	%ecx, %rcx
	movb	%al, (%r14,%rcx)
	cmpl	$4, %r13d
	jne	.L4910
	movslq	%r12d, %r12
	movb	$-1, (%r14,%r12)
	leal	4(%rbp), %r12d
.L4910:
	movl	(%rbx), %eax
	leal	1(%r8), %ecx
	movl	%eax, %r11d
	cmpl	%ecx, %eax
	je	.L5029
	cmpl	$8, %r15d
	je	.L5167
.L4912:
	movslq	%edx, %rdx
	movslq	%r12d, %rax
	leal	3(%r12), %ebp
	movzbl	208(%rsp,%rdx,4), %ecx
	movb	%cl, (%r14,%rax)
	movzbl	209(%rsp,%rdx,4), %ecx
	leal	1(%r12), %eax
	movzbl	210(%rsp,%rdx,4), %edx
	cltq
	movb	%cl, (%r14,%rax)
	leal	2(%r12), %eax
	cltq
	movb	%dl, (%r14,%rax)
	cmpl	$4, %r13d
	je	.L5168
	movl	(%rbx), %eax
	addl	$2, %r8d
	movl	%eax, %r11d
	cmpl	%eax, %r8d
	jl	.L4919
.L4911:
	movl	48(%rsp), %ecx
	testl	%ecx, %ecx
	je	.L4920
	cmpq	$0, 16(%rbx)
	movq	192(%rbx), %rdx
	je	.L4921
	movq	200(%rbx), %rdi
	movq	%rdi, %rsi
	subq	%rdx, %rsi
	cmpl	%esi, %ecx
	jg	.L5169
.L4921:
	movslq	48(%rsp), %rsi
	addq	%rsi, %rdx
	movq	%rdx, 192(%rbx)
.L4920:
	incl	8(%rsp)
	movl	8(%rsp), %esi
	movl	4(%rbx), %r8d
	cmpl	%r8d, %esi
	jl	.L5007
	movq	%r14, %rbp
.L4890:
	cmpl	$4, 56(%rsp)
	jne	.L4989
	movl	24(%rsp), %edi
	testl	%edi, %edi
	jne	.L4989
	movl	%eax, %edx
	imull	%r8d, %edx
	leal	-1(,%rdx,4), %edx
	testl	%edx, %edx
	js	.L4989
	movslq	%edx, %rdx
	.p2align 4
	.p2align 3
.L4990:
	movb	$-1, 0(%rbp,%rdx)
	subq	$4, %rdx
	testl	%edx, %edx
	jns	.L4990
	movl	%eax, %r11d
.L4989:
	movl	144(%rsp), %esi
	testl	%esi, %esi
	jle	.L4991
	cmpl	$1, %r8d
	jle	.L4991
	movl	56(%rsp), %r9d
	xorl	%r10d, %r10d
	.p2align 4
	.p2align 3
.L4993:
	movl	%r11d, %ecx
	leal	-1(%r8), %eax
	movl	%r10d, %esi
	imull	%r9d, %ecx
	subl	%r10d, %eax
	movl	%eax, %edx
	imull	%ecx, %esi
	imull	%ecx, %edx
	testl	%ecx, %ecx
	jle	.L4991
	movl	(%rbx), %r11d
	xorl	%eax, %eax
	leaq	0(%rbp,%rsi), %rcx
	addq	%rbp, %rdx
	movl	%r11d, %r8d
	imull	%r9d, %r8d
	.p2align 4
	.p2align 3
.L4992:
	movzbl	(%rcx,%rax), %esi
	movzbl	(%rdx,%rax), %edi
	movb	%dil, (%rcx,%rax)
	movb	%sil, (%rdx,%rax)
	incq	%rax
	cmpl	%eax, %r8d
	jg	.L4992
	movl	4(%rbx), %r8d
	incl	%r10d
	movl	%r8d, %eax
	sarl	%eax
	cmpl	%eax, %r10d
	jl	.L4993
.L4991:
	movl	104(%rsp), %eax
	testl	%eax, %eax
	je	.L4994
	movl	56(%rsp), %esi
	cmpl	%eax, %esi
	je	.L4994
	movq	%rbp, %rdi
	movl	%r11d, %ecx
	movl	%eax, %edx
	call	stbi__convert_format
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L5144
	movl	(%rbx), %r11d
.L4994:
	movq	120(%rsp), %rax
	movq	128(%rsp), %rdx
	movl	%r11d, (%rax)
	movl	4(%rbx), %eax
	movl	%eax, (%rdx)
	movq	136(%rsp), %rdx
	testq	%rdx, %rdx
	je	.L4843
	movl	8(%rbx), %eax
	movl	%eax, (%rdx)
	jmp	.L4843
	.p2align 4
	.p2align 3
.L5165:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rbx)
	movzbl	(%rax), %eax
	movl	%eax, %r12d
	jmp	.L4906
	.p2align 4
	.p2align 3
.L5168:
	movslq	%ebp, %rbp
	addl	$4, %r12d
	addl	$2, %r8d
	movb	$-1, (%r14,%rbp)
	movl	(%rbx), %eax
	movl	%r12d, %ebp
	movl	%eax, %r11d
	cmpl	%r8d, %eax
	jg	.L4919
	jmp	.L4911
	.p2align 4
	.p2align 3
.L5167:
	movq	192(%rbx), %rax
	cmpq	200(%rbx), %rax
	jb	.L5170
	movl	48(%rbx), %edx
	testl	%edx, %edx
	je	.L4912
	movl	52(%rbx), %edx
	movl	%r8d, 32(%rsp)
	movq	%rsi, 16(%rsp)
	movq	40(%rbx), %rdi
	call	*16(%rbx)
	movq	16(%rsp), %rsi
	movl	%eax, %edx
	movq	192(%rbx), %rax
	subq	208(%rbx), %rax
	addl	%eax, 184(%rbx)
	testl	%edx, %edx
	movl	32(%rsp), %r8d
	jne	.L4915
	movq	40(%rsp), %rax
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
.L4916:
	vmovq	40(%rsp), %xmm5
	vpinsrq	$1, %rax, %xmm5, %xmm0
	vmovdqu	%xmm0, 192(%rbx)
	jmp	.L4912
	.p2align 4
	.p2align 3
.L5166:
	movl	52(%rbx), %edx
	movl	%r8d, 32(%rsp)
	movq	%rsi, 16(%rsp)
	movq	40(%rbx), %rdi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	subq	208(%rbx), %rdx
	movq	16(%rsp), %rsi
	addl	%edx, 184(%rbx)
	testl	%eax, %eax
	movl	32(%rsp), %r8d
	jne	.L4907
	movq	40(%rsp), %rdx
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
.L4908:
	vmovq	40(%rsp), %xmm1
	vpinsrq	$1, %rdx, %xmm1, %xmm0
	vmovdqu	%xmm0, 192(%rbx)
	jmp	.L4906
	.p2align 4
	.p2align 3
.L4907:
	cltq
	leaq	(%rsi,%rax), %rdx
	movzbl	56(%rbx), %eax
	movl	%eax, %r12d
	jmp	.L4908
	.p2align 4
	.p2align 3
.L5170:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rbx)
	movzbl	(%rax), %edx
	jmp	.L4912
	.p2align 4
	.p2align 3
.L5029:
	movl	%r12d, %ebp
	jmp	.L4911
	.p2align 4
	.p2align 3
.L5149:
	leaq	.LC218(%rip), %rax
	xorl	%ebp, %ebp
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L4843
	.p2align 4
	.p2align 3
.L4846:
	leaq	56(%rdi), %rbp
	movl	52(%rdi), %edx
	movq	40(%rdi), %rdi
	movq	%rbp, %rsi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	leaq	57(%rbx), %rcx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	testl	%eax, %eax
	jne	.L4848
	vmovq	%rcx, %xmm5
	vpunpcklqdq	%xmm5, %xmm5, %xmm0
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	vmovdqu	%xmm0, 192(%rbx)
	jmp	.L4849
	.p2align 4
	.p2align 3
.L5169:
	movl	%ecx, %r8d
	movq	%rdi, 192(%rbx)
	movq	40(%rbx), %rdi
	subl	%esi, %r8d
	movl	%r8d, %esi
	call	*24(%rbx)
	movl	(%rbx), %eax
	movl	%eax, %r11d
	jmp	.L4920
.L4915:
	movslq	%edx, %rax
	movzbl	56(%rbx), %edx
	addq	%rsi, %rax
	jmp	.L4916
.L4872:
	cltq
	movzbl	56(%rbp), %edx
	vmovq	%rsi, %xmm6
	addq	%rbx, %rax
	jmp	.L4873
.L4881:
	cltq
	movzbl	56(%rbp), %r15d
	addq	%rbx, %rax
	jmp	.L4882
.L4877:
	cltq
	movzbl	56(%rbp), %esi
	vmovq	%rdx, %xmm7
	addq	%rbx, %rax
	jmp	.L4878
.L4848:
	cltq
	vmovq	%rcx, %xmm5
	movzbl	56(%rbx), %edx
	addq	%rax, %rbp
	vpinsrq	$1, %rbp, %xmm5, %xmm0
	vmovdqu	%xmm0, 192(%rbx)
	jmp	.L4845
.L5159:
	movl	(%rbx), %eax
	movl	$1, 60(%rsp)
	leal	(%rax,%rax,2), %edx
	movl	%eax, %r11d
	negl	%edx
	andl	$3, %edx
	movl	%edx, 108(%rsp)
.L5143:
	movl	$0, 112(%rsp)
	movl	$0, 88(%rsp)
	movl	$0, 84(%rsp)
	movl	$0, 76(%rsp)
	movl	$0, 116(%rsp)
	movl	$0, 156(%rsp)
	movl	$0, 152(%rsp)
	movl	$0, 148(%rsp)
.L4925:
	movl	4(%rbx), %r8d
	testl	%r8d, %r8d
	jle	.L4890
	xorl	%r13d, %r13d
	leaq	57(%rbx), %rdi
	movq	%rbp, %rcx
	movl	$0, 92(%rsp)
	movq	%rdi, 96(%rsp)
	leaq	mul_table.40(%rip), %r12
	movl	%r13d, %ebp
	.p2align 4
	.p2align 3
.L4988:
	movl	60(%rsp), %edx
	testl	%edx, %edx
	jne	.L4953
	movl	$8, %edx
	subl	76(%rsp), %edx
	xorl	%r15d, %r15d
	leaq	shift_table.39(%rip), %r13
	movl	%edx, 80(%rsp)
	testl	%eax, %eax
	jle	.L4955
	movq	%rbx, %r10
	movl	152(%rsp), %r14d
	movl	%r15d, %r9d
	movq	%rcx, %r15
	movl	156(%rsp), %r8d
	movl	148(%rsp), %ebx
	.p2align 4
	.p2align 3
.L4954:
	cmpl	$16, 16(%rsp)
	movl	%r9d, 48(%rsp)
	movl	%r8d, 40(%rsp)
	movq	%r10, %rdi
	movq	%r10, 32(%rsp)
	je	.L5171
	call	stbi__get32le
	movl	48(%rsp), %r9d
	movl	40(%rsp), %r8d
	movq	32(%rsp), %r10
	movl	%eax, %edx
.L4977:
	movl	68(%rsp), %eax
	movl	%ebx, %esi
	negl	%esi
	andl	%edx, %eax
	testl	%ebx, %ebx
	shlx	%esi, %eax, %esi
	shrx	%ebx, %eax, %eax
	cmovs	%esi, %eax
	cmpl	$255, %eax
	ja	.L4998
	movslq	76(%rsp), %r11
	movzbl	80(%rsp), %ecx
	movslq	%ebp, %rsi
	leal	1(%rbp), %edi
	shrx	%ecx, %eax, %eax
	imull	(%r12,%r11,4), %eax
	movl	0(%r13,%r11,4), %r11d
	sarx	%r11d, %eax, %r11d
	movb	%r11b, (%r15,%rsi)
	movl	64(%rsp), %esi
	movl	%r14d, %r11d
	negl	%r11d
	andl	%edx, %esi
	testl	%r14d, %r14d
	shrx	%r14d, %esi, %eax
	shlx	%r11d, %esi, %esi
	cmovns	%eax, %esi
	cmpl	$255, %esi
	ja	.L4998
	movl	84(%rsp), %ecx
	movl	$8, %eax
	movslq	%edi, %rdi
	leal	2(%rbp), %r11d
	subl	%ecx, %eax
	shrx	%eax, %esi, %eax
	movslq	%ecx, %rsi
	imull	(%r12,%rsi,4), %eax
	movl	0(%r13,%rsi,4), %esi
	sarx	%esi, %eax, %eax
	movb	%al, (%r15,%rdi)
	movl	72(%rsp), %eax
	movl	%r8d, %edi
	negl	%edi
	andl	%edx, %eax
	testl	%r8d, %r8d
	shrx	%r8d, %eax, %esi
	shlx	%edi, %eax, %eax
	cmovns	%esi, %eax
	cmpl	$255, %eax
	ja	.L4998
	movl	88(%rsp), %ecx
	movl	$8, %edi
	movslq	%r11d, %r11
	leal	3(%rbp), %esi
	subl	%ecx, %edi
	shrx	%edi, %eax, %eax
	movslq	%ecx, %rdi
	movl	8(%rsp), %ecx
	imull	(%r12,%rdi,4), %eax
	movl	0(%r13,%rdi,4), %edi
	sarx	%edi, %eax, %eax
	movb	%al, (%r15,%r11)
	movl	$255, %eax
	testl	%ecx, %ecx
	jne	.L5172
.L4996:
	orl	%eax, 24(%rsp)
	cmpl	$4, 56(%rsp)
	je	.L5173
	movl	(%r10), %eax
	incl	%r9d
	movl	%eax, %r11d
	cmpl	%eax, %r9d
	jge	.L5174
	movl	%esi, %ebp
	jmp	.L4954
	.p2align 4
	.p2align 3
.L5174:
	movq	%r15, %rcx
	movq	%r10, %rbx
	movl	%esi, %ebp
.L4955:
	movl	108(%rsp), %r10d
	testl	%r10d, %r10d
	je	.L4986
	cmpq	$0, 16(%rbx)
	movq	192(%rbx), %rdx
	je	.L4987
	movq	200(%rbx), %rdi
	movq	%rdi, %rsi
	subq	%rdx, %rsi
	cmpl	%esi, %r10d
	jg	.L5175
.L4987:
	movslq	108(%rsp), %rsi
	addq	%rsi, %rdx
	movq	%rdx, 192(%rbx)
.L4986:
	incl	92(%rsp)
	movl	92(%rsp), %esi
	movl	4(%rbx), %r8d
	cmpl	%r8d, %esi
	jl	.L4988
	movq	%rcx, %rbp
	jmp	.L4890
	.p2align 4
	.p2align 3
.L5171:
	call	stbi__get16le
	movq	32(%rsp), %r10
	movl	40(%rsp), %r8d
	movl	48(%rsp), %r9d
	movl	%eax, %edx
	jmp	.L4977
	.p2align 4
	.p2align 3
.L5173:
	movslq	%esi, %rsi
	incl	%r9d
	addl	$4, %ebp
	movb	%al, (%r15,%rsi)
	movl	(%r10), %eax
	movl	%eax, %r11d
	cmpl	%eax, %r9d
	jge	.L5176
	movl	%ebp, %esi
	movl	%esi, %ebp
	jmp	.L4954
	.p2align 4
	.p2align 3
.L5172:
	movl	116(%rsp), %edi
	andl	8(%rsp), %edx
	movl	%edi, %eax
	movl	%edi, %ecx
	negl	%eax
	testl	%edi, %edi
	shlx	%eax, %edx, %eax
	shrx	%ecx, %edx, %edx
	cmovs	%eax, %edx
	cmpl	$255, %edx
	ja	.L4998
	movl	112(%rsp), %edi
	movl	$8, %eax
	subl	%edi, %eax
	shrx	%eax, %edx, %edx
	movslq	%edi, %rax
	imull	(%r12,%rax,4), %edx
	movl	0(%r13,%rax,4), %eax
	sarx	%eax, %edx, %eax
	jmp	.L4996
	.p2align 4
	.p2align 3
.L4953:
	testl	%eax, %eax
	jle	.L4955
	xorl	%r15d, %r15d
	leaq	56(%rbx), %rsi
	movl	%r15d, %r14d
	movl	24(%rsp), %r15d
	jmp	.L4975
	.p2align 4
	.p2align 3
.L4956:
	movl	48(%rbx), %eax
	xorl	%r9d, %r9d
	testl	%eax, %eax
	jne	.L5177
.L4957:
	movb	%r9b, (%r11)
	leaq	1(%rcx,%r13), %r11
	movq	192(%rbx), %rax
	cmpq	200(%rbx), %rax
	jb	.L5178
	movl	48(%rbx), %eax
	xorl	%r9d, %r9d
	testl	%eax, %eax
	jne	.L5179
.L4961:
	movb	%r9b, (%r11)
	addq	%rcx, %r13
	movq	192(%rbx), %rax
	cmpq	200(%rbx), %rax
	jb	.L5180
	movl	48(%rbx), %r10d
	xorl	%r9d, %r9d
	testl	%r10d, %r10d
	jne	.L5181
.L4965:
	cmpl	$2, 60(%rsp)
	movb	%r9b, 0(%r13)
	leal	3(%rbp), %r13d
	je	.L4968
.L5185:
	orb	$-1, %r15b
	movl	$-1, %r9d
.L4969:
	cmpl	$4, 56(%rsp)
	je	.L5182
	movl	(%rbx), %eax
	incl	%r14d
	movl	%eax, %r11d
	cmpl	%eax, %r14d
	jge	.L5183
.L4974:
	movl	%r13d, %ebp
.L4975:
	movslq	%ebp, %r13
	movq	192(%rbx), %rax
	leaq	2(%rcx,%r13), %r11
	cmpq	200(%rbx), %rax
	jnb	.L4956
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rbx)
	movzbl	(%rax), %r9d
	jmp	.L4957
	.p2align 4
	.p2align 3
.L5182:
	movslq	%r13d, %r13
	incl	%r14d
	addl	$4, %ebp
	movb	%r9b, (%rcx,%r13)
	movl	(%rbx), %eax
	movl	%eax, %r11d
	cmpl	%eax, %r14d
	jge	.L5184
	movl	%ebp, %r13d
	jmp	.L4974
	.p2align 4
	.p2align 3
.L5180:
	leaq	1(%rax), %rdx
	cmpl	$2, 60(%rsp)
	movq	%rdx, 192(%rbx)
	movzbl	(%rax), %r9d
	movb	%r9b, 0(%r13)
	leal	3(%rbp), %r13d
	jne	.L5185
.L4968:
	movq	192(%rbx), %rax
	cmpq	200(%rbx), %rax
	jb	.L5186
	movl	48(%rbx), %r8d
	xorl	%r9d, %r9d
	testl	%r8d, %r8d
	je	.L4969
	movl	52(%rbx), %edx
	movq	%rcx, 32(%rsp)
	movq	%rsi, 24(%rsp)
	movq	40(%rbx), %rdi
	movb	%r9b, 40(%rsp)
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	testl	%eax, %eax
	movq	24(%rsp), %rsi
	movq	32(%rsp), %rcx
	jne	.L4971
	movq	96(%rsp), %rax
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	movzbl	40(%rsp), %r9d
.L4972:
	vmovq	96(%rsp), %xmm7
	vpinsrq	$1, %rax, %xmm7, %xmm0
	vmovdqu	%xmm0, 192(%rbx)
	jmp	.L4969
	.p2align 4
	.p2align 3
.L5178:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rbx)
	movzbl	(%rax), %r9d
	jmp	.L4961
	.p2align 4
	.p2align 3
.L5177:
	movl	52(%rbx), %edx
	movq	%rcx, 40(%rsp)
	movq	%r11, 32(%rsp)
	movq	40(%rbx), %rdi
	movq	%rsi, 24(%rsp)
	movb	%r9b, 48(%rsp)
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	subq	208(%rbx), %rdx
	movq	24(%rsp), %rsi
	addl	%edx, 184(%rbx)
	testl	%eax, %eax
	movq	32(%rsp), %r11
	movq	40(%rsp), %rcx
	jne	.L4958
	movq	96(%rsp), %rax
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	movzbl	48(%rsp), %r9d
.L4959:
	vmovq	96(%rsp), %xmm2
	vpinsrq	$1, %rax, %xmm2, %xmm0
	vmovdqu	%xmm0, 192(%rbx)
	jmp	.L4957
	.p2align 4
	.p2align 3
.L5181:
	movl	52(%rbx), %edx
	movq	%rcx, 32(%rsp)
	movq	%rsi, 24(%rsp)
	movq	40(%rbx), %rdi
	movb	%r9b, 40(%rsp)
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	testl	%eax, %eax
	movq	24(%rsp), %rsi
	movq	32(%rsp), %rcx
	jne	.L4966
	movq	96(%rsp), %rax
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	movzbl	40(%rsp), %r9d
.L4967:
	vmovq	96(%rsp), %xmm4
	vpinsrq	$1, %rax, %xmm4, %xmm0
	vmovdqu	%xmm0, 192(%rbx)
	jmp	.L4965
	.p2align 4
	.p2align 3
.L5179:
	movl	52(%rbx), %edx
	movq	%rcx, 40(%rsp)
	movq	%r11, 32(%rsp)
	movq	40(%rbx), %rdi
	movq	%rsi, 24(%rsp)
	movb	%r9b, 48(%rsp)
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	subq	208(%rbx), %rdx
	movq	24(%rsp), %rsi
	addl	%edx, 184(%rbx)
	testl	%eax, %eax
	movq	32(%rsp), %r11
	movq	40(%rsp), %rcx
	jne	.L4962
	movq	96(%rsp), %rax
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	movzbl	48(%rsp), %r9d
.L4963:
	vmovq	96(%rsp), %xmm3
	vpinsrq	$1, %rax, %xmm3, %xmm0
	vmovdqu	%xmm0, 192(%rbx)
	jmp	.L4961
	.p2align 4
	.p2align 3
.L5183:
	movl	%r15d, 24(%rsp)
	movl	%r13d, %ebp
	jmp	.L4955
	.p2align 4
	.p2align 3
.L5186:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rbx)
	movzbl	(%rax), %eax
	movl	%eax, %r9d
	orl	%eax, %r15d
	jmp	.L4969
	.p2align 4
	.p2align 3
.L4958:
	cltq
	movzbl	56(%rbx), %r9d
	addq	%rsi, %rax
	jmp	.L4959
	.p2align 4
	.p2align 3
.L4962:
	cltq
	movzbl	56(%rbx), %r9d
	addq	%rsi, %rax
	jmp	.L4963
	.p2align 4
	.p2align 3
.L4966:
	cltq
	movzbl	56(%rbx), %r9d
	addq	%rsi, %rax
	jmp	.L4967
	.p2align 4
	.p2align 3
.L5175:
	movl	%r10d, %r8d
	movq	%rcx, 32(%rsp)
	movq	%rdi, 192(%rbx)
	movq	40(%rbx), %rdi
	subl	%esi, %r8d
	movl	%r8d, %esi
	call	*24(%rbx)
	movl	(%rbx), %eax
	movq	32(%rsp), %rcx
	movl	%eax, %r11d
	jmp	.L4986
	.p2align 4
	.p2align 3
.L5184:
	movl	%r15d, 24(%rsp)
	jmp	.L4955
	.p2align 4
	.p2align 3
.L5176:
	movq	%r15, %rcx
	movq	%r10, %rbx
	jmp	.L4955
.L4952:
	movq	%rbp, %rdi
	call	free@PLT
	leaq	.LC221(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
.L5144:
	xorl	%ebp, %ebp
	jmp	.L4843
.L5163:
	movl	(%rbx), %eax
	movl	4(%rbx), %r8d
	xorl	%r14d, %r14d
	xorl	%r12d, %r12d
	leal	7(%rax), %edx
	movl	%eax, %r11d
	shrl	$3, %edx
	negl	%edx
	andl	$3, %edx
	movl	%edx, 8(%rsp)
	testl	%r8d, %r8d
	jle	.L4890
	movq	%rbx, %r15
	movl	%r14d, %ebx
	.p2align 4
	.p2align 3
.L4889:
	movq	%r15, %rdi
	call	stbi__get8
	movl	(%r15), %r8d
	movzbl	%al, %esi
	testl	%r8d, %r8d
	jle	.L4894
	cmpl	$4, 56(%rsp)
	je	.L4895
	leal	3(%rbx), %r13d
	xorl	%r14d, %r14d
	movslq	%r13d, %r13
.L5140:
	movl	(%r15), %ecx
	movl	$7, %edx
.L4898:
	sarx	%edx, %esi, %edi
	incl	%r14d
	movl	%r13d, %ebx
	andl	$1, %edi
	movzbl	208(%rsp,%rdi,4), %r8d
	movb	%r8b, -3(%rbp,%r13)
	movzbl	209(%rsp,%rdi,4), %r8d
	movzbl	210(%rsp,%rdi,4), %edi
	movb	%r8b, -2(%rbp,%r13)
	movb	%dil, -1(%rbp,%r13)
	cmpl	%r14d, %ecx
	je	.L4894
	subl	$1, %edx
	jb	.L5187
	addq	$3, %r13
	cmpl	%r14d, %ecx
	jg	.L4898
.L4894:
	movl	8(%rsp), %esi
	testl	%esi, %esi
	je	.L4902
	movq	%r15, %rdi
	incl	%r12d
	call	stbi__skip.part.0
	movl	4(%r15), %r8d
	cmpl	%r8d, %r12d
	jl	.L4889
.L5142:
	movl	(%r15), %eax
	movq	%r15, %rbx
	movl	%eax, %r11d
	jmp	.L4890
.L4971:
	movzbl	56(%rbx), %edx
	cltq
	addq	%rsi, %rax
	movl	%edx, %r9d
	orl	%edx, %r15d
	jmp	.L4972
.L5161:
	shrl	$16, %eax
	movl	$24, %edx
	movl	$16, %r12d
	jmp	.L4932
	.p2align 4
	.p2align 3
.L5187:
	movq	%r15, %rdi
	addq	$3, %r13
	call	stbi__get8
	movzbl	%al, %esi
	cmpl	%r14d, (%r15)
	jg	.L5140
	jmp	.L4894
	.p2align 4
	.p2align 3
.L4902:
	movl	4(%r15), %r8d
	incl	%r12d
	cmpl	%r8d, %r12d
	jl	.L4889
	jmp	.L5142
	.p2align 4
	.p2align 3
.L4895:
	addl	$4, %ebx
	xorl	%r14d, %r14d
	movslq	%ebx, %r13
.L5141:
	movl	(%r15), %ecx
	movl	$7, %edx
.L4901:
	sarx	%edx, %esi, %edi
	incl	%r14d
	movl	%r13d, %ebx
	movb	$-1, -1(%rbp,%r13)
	andl	$1, %edi
	movzbl	208(%rsp,%rdi,4), %r8d
	movb	%r8b, -4(%rbp,%r13)
	movzbl	209(%rsp,%rdi,4), %r8d
	movzbl	210(%rsp,%rdi,4), %edi
	movb	%r8b, -3(%rbp,%r13)
	movb	%dil, -2(%rbp,%r13)
	cmpl	%ecx, %r14d
	je	.L4894
	subl	$1, %edx
	jb	.L5188
	addq	$4, %r13
	cmpl	%ecx, %r14d
	jl	.L4901
	jmp	.L4894
	.p2align 4
	.p2align 3
.L5188:
	movq	%r15, %rdi
	addq	$4, %r13
	call	stbi__get8
	movzbl	%al, %esi
	cmpl	(%r15), %r14d
	jl	.L5141
	jmp	.L4894
.L5160:
	movl	(%rbx), %eax
	addl	%eax, %eax
	negl	%eax
	andl	$3, %eax
	movl	%eax, 108(%rsp)
	jmp	.L4927
.L5035:
	movl	$8, %edx
	xorl	%ecx, %ecx
	jmp	.L4942
.L5034:
	movl	$8, %edx
	xorl	%r13d, %r13d
	jmp	.L4937
.L5037:
	movl	$8, %esi
	xorl	%edx, %edx
	jmp	.L4948
.L5157:
	movl	$2147483647, %eax
	cltd
	idivl	%esi
	cmpl	%eax, 56(%rsp)
	jg	.L4863
	jmp	.L5012
.L5164:
	movl	(%rbx), %eax
	leal	1(%rax), %edx
	movl	%eax, %r11d
	shrl	%edx
	jmp	.L4892
.L5158:
	movq	200(%rbx), %rax
	movq	%rax, 192(%rbx)
	jmp	.L4922
.L5162:
	movq	200(%rbx), %rax
	movq	%rax, 192(%rbx)
	jmp	.L4886
.L4865:
	movq	%rbp, %rdi
	xorl	%ebp, %ebp
	call	free@PLT
	leaq	.LC219(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L4843
.L4893:
	movq	%rbp, %rdi
	xorl	%ebp, %ebp
	call	free@PLT
	leaq	.LC220(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L4843
.L4998:
	leaq	__PRETTY_FUNCTION__.41(%rip), %rcx
	movl	$5345, %edx
	leaq	.LC14(%rip), %rsi
	leaq	.LC222(%rip), %rdi
	call	__assert_fail@PLT
.L5036:
	orl	$-1, %edx
	jmp	.L4947
.L5151:
	movl	104(%rsp), %eax
	movl	%eax, 56(%rsp)
	jmp	.L5015
.L5146:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE894:
	.size	stbi__bmp_load.constprop.0, .-stbi__bmp_load.constprop.0
	.section	.rodata.str1.1
.LC223:
	.string	"not GIF"
.LC224:
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
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movq	%rdx, %r14
	movq	%rsi, %r13
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movl	%ecx, %r12d
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$16, %rsp
	.cfi_def_cfa_offset 64
	movq	192(%rdi), %rdx
	movq	200(%rdi), %rax
	cmpq	%rax, %rdx
	jb	.L5215
	movl	48(%rdi), %ecx
	testl	%ecx, %ecx
	jne	.L5216
.L5193:
	leaq	.LC223(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
.L5189:
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
	.p2align 4
	.p2align 3
.L5215:
	.cfi_restore_state
	leaq	1(%rdx), %rcx
	movq	%rcx, 192(%rdi)
	movzbl	(%rdx), %edx
.L5191:
	cmpb	$71, %dl
	jne	.L5193
	cmpq	%rcx, %rax
	ja	.L5217
	movl	48(%rbp), %edx
	testl	%edx, %edx
	je	.L5193
	leaq	56(%rbp), %rbx
	movl	52(%rbp), %edx
	movq	40(%rbp), %rdi
	movq	%rbx, %rsi
	call	*16(%rbp)
	movq	192(%rbp), %rdx
	subq	208(%rbp), %rdx
	addl	%edx, 184(%rbp)
	leaq	57(%rbp), %rdx
	testl	%eax, %eax
	jne	.L5198
	vmovq	%rdx, %xmm3
	vpunpcklqdq	%xmm3, %xmm3, %xmm0
	movl	$0, 48(%rbp)
	movb	$0, 56(%rbp)
	vmovdqu	%xmm0, 192(%rbp)
	jmp	.L5193
	.p2align 4
	.p2align 3
.L5216:
	leaq	56(%rdi), %rbx
	movl	52(%rdi), %edx
	movq	40(%rdi), %rdi
	movq	%rbx, %rsi
	call	*16(%rbp)
	movq	192(%rbp), %rdx
	leaq	57(%rbp), %rcx
	subq	208(%rbp), %rdx
	addl	%edx, 184(%rbp)
	testl	%eax, %eax
	jne	.L5194
	vmovq	%rcx, %xmm1
	vpunpcklqdq	%xmm1, %xmm1, %xmm0
	movl	$0, 48(%rbp)
	movb	$0, 56(%rbp)
	vmovdqu	%xmm0, 192(%rbp)
	jmp	.L5193
	.p2align 4
	.p2align 3
.L5217:
	leaq	1(%rcx), %rdx
	movq	%rdx, 192(%rbp)
	movzbl	(%rcx), %ecx
.L5197:
	cmpb	$73, %cl
	jne	.L5193
	cmpq	%rax, %rdx
	jb	.L5218
	movl	48(%rbp), %eax
	testl	%eax, %eax
	je	.L5193
	leaq	56(%rbp), %rbx
	movl	52(%rbp), %edx
	movq	40(%rbp), %rdi
	movq	%rbx, %rsi
	call	*16(%rbp)
	movq	192(%rbp), %rdx
	leaq	57(%rbp), %rcx
	subq	208(%rbp), %rdx
	addl	%edx, 184(%rbp)
	testl	%eax, %eax
	jne	.L5201
	vmovq	%rcx, %xmm5
	vpunpcklqdq	%xmm5, %xmm5, %xmm0
	movl	$0, 48(%rbp)
	movb	$0, 56(%rbp)
	vmovdqu	%xmm0, 192(%rbp)
	jmp	.L5193
	.p2align 4
	.p2align 3
.L5194:
	cltq
	vmovq	%rcx, %xmm2
	movzbl	56(%rbp), %edx
	addq	%rbx, %rax
	vpinsrq	$1, %rax, %xmm2, %xmm0
	vmovdqu	%xmm0, 192(%rbp)
	jmp	.L5191
	.p2align 4
	.p2align 3
.L5218:
	leaq	1(%rdx), %rax
	movq	%rax, 192(%rbp)
	movzbl	(%rdx), %edx
.L5200:
	cmpb	$70, %dl
	jne	.L5193
	movq	%rbp, %rdi
	call	stbi__get8
	cmpb	$56, %al
	jne	.L5193
	movq	%rbp, %rdi
	call	stbi__get8
	subl	$55, %eax
	testb	$-3, %al
	jne	.L5193
	movq	%rbp, %rdi
	call	stbi__get8
	cmpb	$97, %al
	jne	.L5193
	leaq	.LC224(%rip), %rax
	movq	%rbp, %rdi
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	call	stbi__get16le
	movq	%rbp, %rdi
	movl	%eax, 0(%r13)
	call	stbi__get16le
	movq	%rbp, %rdi
	movl	%eax, 4(%r13)
	call	stbi__get8
	movq	%rbp, %rdi
	movzbl	%al, %eax
	movl	%eax, 32(%r13)
	call	stbi__get8
	movq	%rbp, %rdi
	movzbl	%al, %eax
	movl	%eax, 36(%r13)
	call	stbi__get8
	movl	$-1, 44(%r13)
	cmpl	$16777216, 0(%r13)
	movzbl	%al, %eax
	movl	%eax, 40(%r13)
	jg	.L5205
	cmpl	$16777216, 4(%r13)
	jg	.L5205
	testq	%r14, %r14
	je	.L5206
	movl	$4, (%r14)
.L5206:
	testl	%r12d, %r12d
	jne	.L5207
	movl	32(%r13), %edx
	movl	$1, %eax
	testb	$-128, %dl
	je	.L5189
	movl	$2, %ecx
	andl	$7, %edx
	leaq	52(%r13), %rsi
	movq	%rbp, %rdi
	shlx	%edx, %ecx, %edx
	orl	$-1, %ecx
	movl	%eax, 12(%rsp)
	call	stbi__gif_parse_colortable
	movl	12(%rsp), %eax
	jmp	.L5189
	.p2align 4
	.p2align 3
.L5198:
	cltq
	vmovq	%rdx, %xmm4
	movzbl	56(%rbp), %ecx
	addq	%rbx, %rax
	vpinsrq	$1, %rax, %xmm4, %xmm0
	vmovdqu	%xmm0, 192(%rbp)
	jmp	.L5197
.L5201:
	cltq
	vmovq	%rcx, %xmm6
	movzbl	56(%rbp), %edx
	addq	%rax, %rbx
	vpinsrq	$1, %rbx, %xmm6, %xmm0
	vmovdqu	%xmm0, 192(%rbp)
	jmp	.L5200
.L5205:
	leaq	.LC93(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L5189
.L5207:
	movl	%r12d, %eax
	jmp	.L5189
	.cfi_endproc
.LFE748:
	.size	stbi__gif_header, .-stbi__gif_header
	.section	.rodata.str1.1
.LC225:
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
	movq	%rdi, %r15
	movl	$18568, %edi
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rcx, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdx, %rbp
	movq	%rsi, %rbx
	subq	$88, %rsp
	.cfi_def_cfa_offset 144
	movq	%fs:40, %rax
	movq	%rax, 72(%rsp)
	xorl	%eax, %eax
	call	malloc@PLT
	testq	%rax, %rax
	je	.L5396
	movq	%rax, %r13
	movq	%r15, (%rax)
	movq	.LC142(%rip), %rax
	movb	$-1, 18472(%r13)
	movq	%rax, 18504(%r13)
	movq	192(%r15), %rax
	cmpq	200(%r15), %rax
	jb	.L5397
	movl	48(%r15), %eax
	movq	%r15, %r14
	testl	%eax, %eax
	jne	.L5398
	.p2align 4
	.p2align 3
.L5224:
	leaq	.LC143(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
.L5233:
	vmovdqu	208(%r14), %xmm1
	movq	%r13, %rdi
	vmovdqu	%xmm1, 192(%r14)
	call	free@PLT
.L5221:
	leaq	32(%rsp), %r14
	xorl	%edx, %edx
	movl	$2, %esi
	movq	%r14, %rdi
	movq	%r15, 32(%rsp)
	call	stbi__parse_png_file
	movl	%eax, %r13d
	testl	%eax, %eax
	je	.L5399
	testq	%rbx, %rbx
	je	.L5243
	movq	32(%rsp), %rax
	movl	(%rax), %eax
	movl	%eax, (%rbx)
.L5243:
	testq	%rbp, %rbp
	je	.L5244
	movq	32(%rsp), %rax
	movl	4(%rax), %eax
	movl	%eax, 0(%rbp)
.L5244:
	movl	$1, %r9d
	testq	%r12, %r12
	je	.L5219
	movq	32(%rsp), %rax
	movl	8(%rax), %eax
	movl	%eax, (%r12)
	.p2align 4
	.p2align 3
.L5219:
	movq	72(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L5400
	addq	$88, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movl	%r9d, %eax
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
	.p2align 4
	.p2align 3
.L5399:
	.cfi_restore_state
	movq	32(%rsp), %rax
	movl	$34928, %edi
	vmovdqu	208(%rax), %xmm2
	vmovdqu	%xmm2, 192(%rax)
	call	malloc@PLT
	testq	%rax, %rax
	je	.L5401
	movl	$1, %ecx
	movq	%r12, %rdx
	movq	%rax, %rsi
	movq	%r15, %rdi
	movq	%rax, (%rsp)
	call	stbi__gif_header
	movq	(%rsp), %r8
	testl	%eax, %eax
	je	.L5402
	testq	%rbx, %rbx
	je	.L5248
	movl	(%r8), %eax
	movl	%eax, (%rbx)
.L5248:
	testq	%rbp, %rbp
	je	.L5249
	movl	4(%r8), %eax
	movl	%eax, 0(%rbp)
.L5249:
	movq	%r8, %rdi
	call	free@PLT
	movl	$1, %r9d
	jmp	.L5219
	.p2align 4
	.p2align 3
.L5397:
	leaq	1(%rax), %rdx
	movq	%r15, %r14
	movq	%rdx, 192(%r15)
	movzbl	(%rax), %edx
.L5223:
	cmpb	$-1, %dl
	jne	.L5224
	.p2align 4
	.p2align 3
.L5231:
	movq	192(%r14), %rax
	cmpq	200(%r14), %rax
	jb	.L5403
	movl	48(%r14), %r11d
	testl	%r11d, %r11d
	je	.L5224
	leaq	56(%r14), %rsi
	movl	52(%r14), %edx
	movq	40(%r14), %rdi
	movq	%rsi, (%rsp)
	call	*16(%r14)
	movq	192(%r14), %rdx
	leaq	57(%r14), %rcx
	subq	208(%r14), %rdx
	addl	%edx, 184(%r14)
	testl	%eax, %eax
	movq	(%rsp), %rsi
	jne	.L5228
	vmovq	%rcx, %xmm3
	vpunpcklqdq	%xmm3, %xmm3, %xmm0
	movl	$0, 48(%r14)
	movb	$0, 56(%r14)
	vmovdqu	%xmm0, 192(%r14)
.L5229:
	movq	0(%r13), %r14
	jmp	.L5224
	.p2align 4
	.p2align 3
.L5403:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%r14)
	movzbl	(%rax), %edx
.L5227:
	cmpb	$-1, %dl
	jne	.L5230
	movq	0(%r13), %r14
	jmp	.L5231
.L5230:
	cmpb	$-40, %dl
	jne	.L5229
	movl	$2, %esi
	movq	%r13, %rdi
	call	stbi__decode_jpeg_header.part.0
	testl	%eax, %eax
	je	.L5404
	testq	%rbx, %rbx
	je	.L5235
	movq	0(%r13), %rax
	movl	(%rax), %eax
	movl	%eax, (%rbx)
.L5235:
	testq	%rbp, %rbp
	je	.L5236
	movq	0(%r13), %rax
	movl	4(%rax), %eax
	movl	%eax, 0(%rbp)
.L5236:
	testq	%r12, %r12
	je	.L5237
	movq	0(%r13), %rax
	movq	%r13, %rdi
	cmpl	$2, 8(%rax)
	setg	%al
	movzbl	%al, %eax
	leal	1(%rax,%rax), %eax
	movl	%eax, (%r12)
	call	free@PLT
	movl	$1, %r9d
	jmp	.L5219
	.p2align 4
	.p2align 3
.L5237:
	movq	%r13, %rdi
	call	free@PLT
	movl	$1, %r9d
	jmp	.L5219
	.p2align 4
	.p2align 3
.L5228:
	cltq
	vmovq	%rcx, %xmm4
	movzbl	56(%r14), %edx
	addq	%rsi, %rax
	vpinsrq	$1, %rax, %xmm4, %xmm0
	vmovdqu	%xmm0, 192(%r14)
	jmp	.L5227
	.p2align 4
	.p2align 3
.L5404:
	movq	0(%r13), %r14
	jmp	.L5233
	.p2align 4
	.p2align 3
.L5402:
	movq	%r8, %rdi
	call	free@PLT
	movq	208(%r15), %rdx
	movq	216(%r15), %rax
	movq	%rdx, 192(%r15)
	movq	%rax, 200(%r15)
.L5246:
	movl	$255, 60(%rsp)
	cmpq	%rax, %rdx
	jb	.L5405
	movl	48(%r15), %r10d
	testl	%r10d, %r10d
	jne	.L5252
.L5255:
	leaq	.LC217(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
.L5253:
	vmovdqu	208(%r15), %xmm5
	testq	%rbx, %rbx
	movq	%rbx, %rax
	movq	%r15, %rdi
	cmove	%r14, %rax
	testq	%rbp, %rbp
	movq	%rax, 8(%rsp)
	movq	%r14, %rax
	cmovne	%rbp, %rax
	testq	%r12, %r12
	movq	%rax, (%rsp)
	movq	%r14, %rax
	cmovne	%r12, %rax
	movq	%rax, 16(%rsp)
	vmovdqu	%xmm5, 192(%r15)
	call	stbi__get32be
	cmpl	$943870035, %eax
	je	.L5406
.L5392:
	testq	%rbx, %rbx
	movq	%r14, %rcx
	movq	208(%r15), %rdx
	movq	216(%r15), %rax
	cmovne	%rbx, %rcx
	testq	%rbp, %rbp
	movq	%rcx, (%rsp)
	movq	%r14, %rcx
	cmovne	%rbp, %rcx
	testq	%r12, %r12
	cmovne	%r12, %r14
	movq	%rdx, 192(%r15)
	movq	%rax, 200(%r15)
	movq	%rcx, 8(%rsp)
	movq	%r14, 16(%rsp)
	cmpq	%rdx, %rax
	ja	.L5278
	movl	48(%r15), %r8d
	testl	%r8d, %r8d
	jne	.L5407
.L5279:
	vmovdqu	208(%r15), %xmm6
	vmovdqu	%xmm6, 192(%r15)
.L5293:
	movq	%r12, %rcx
	movq	%rbp, %rdx
	movq	%rbx, %rsi
	movq	%r15, %rdi
	call	stbi__pnm_info
	testl	%eax, %eax
	jne	.L5395
	movq	%r12, %rcx
	movq	%rbp, %rdx
	movq	%rbx, %rsi
	movq	%r15, %rdi
	call	stbi__hdr_info
	testl	%eax, %eax
	movl	%eax, (%rsp)
	jne	.L5395
	movq	%r15, %rdi
	call	stbi__get8
	movq	%r15, %rdi
	call	stbi__get8
	movl	(%rsp), %r9d
	movzbl	%al, %r14d
	cmpl	$1, %r14d
	jle	.L5306
.L5320:
	movq	208(%r15), %rax
	movq	%rax, 192(%r15)
	movq	216(%r15), %rax
	movq	%rax, 200(%r15)
	leaq	.LC225(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L5219
	.p2align 4
	.p2align 3
.L5398:
	leaq	56(%r15), %r14
	movl	52(%r15), %edx
	movq	40(%r15), %rdi
	movq	%r14, %rsi
	call	*16(%r15)
	movq	192(%r15), %rdx
	leaq	57(%r15), %rcx
	subq	208(%r15), %rdx
	addl	%edx, 184(%r15)
	testl	%eax, %eax
	jne	.L5225
	vmovq	%rcx, %xmm6
	vpunpcklqdq	%xmm6, %xmm6, %xmm0
	movq	0(%r13), %r14
	movl	$0, 48(%r15)
	movb	$0, 56(%r15)
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L5224
	.p2align 4
	.p2align 3
.L5405:
	leaq	1(%rdx), %rcx
	movq	%rcx, 192(%r15)
	movzbl	(%rdx), %edx
.L5251:
	cmpb	$66, %dl
	jne	.L5255
	cmpq	%rcx, %rax
	ja	.L5408
	movl	48(%r15), %r9d
	testl	%r9d, %r9d
	je	.L5255
	leaq	56(%r15), %rsi
	movl	52(%r15), %edx
	movq	40(%r15), %rdi
	movq	%rsi, (%rsp)
	call	*16(%r15)
	movq	192(%r15), %rdx
	leaq	57(%r15), %rcx
	subq	208(%r15), %rdx
	addl	%edx, 184(%r15)
	testl	%eax, %eax
	movq	(%rsp), %rsi
	jne	.L5258
	vmovq	%rcx, %xmm6
	vpunpcklqdq	%xmm6, %xmm6, %xmm0
	movl	$0, 48(%r15)
	movb	$0, 56(%r15)
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L5255
	.p2align 4
	.p2align 3
.L5225:
	cltq
	vmovq	%rcx, %xmm7
	movzbl	56(%r15), %edx
	addq	%rax, %r14
	vpinsrq	$1, %r14, %xmm7, %xmm0
	movq	0(%r13), %r14
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L5223
	.p2align 4
	.p2align 3
.L5408:
	leaq	1(%rcx), %rax
	movq	%rax, 192(%r15)
	movzbl	(%rcx), %edx
.L5257:
	cmpb	$77, %dl
	jne	.L5255
	movq	%r14, %rsi
	movq	%r15, %rdi
	call	stbi__bmp_parse_header.part.0
	testq	%rax, %rax
	je	.L5253
	testq	%rbx, %rbx
	je	.L5262
	movl	(%r15), %eax
	movl	%eax, (%rbx)
.L5262:
	testq	%rbp, %rbp
	je	.L5263
	movl	4(%r15), %eax
	movl	%eax, 0(%rbp)
.L5263:
	movl	$1, %r9d
	testq	%r12, %r12
	je	.L5219
	cmpl	$24, 32(%rsp)
	movl	56(%rsp), %eax
	je	.L5409
.L5265:
	cmpl	$1, %eax
	movl	$3, %eax
	movl	$1, %r9d
	sbbl	$-1, %eax
	movl	%eax, (%r12)
	jmp	.L5219
	.p2align 4
	.p2align 3
.L5409:
	cmpl	$-16777216, %eax
	jne	.L5265
	movl	$3, (%r12)
	jmp	.L5219
.L5406:
	movq	%r15, %rdi
	call	stbi__get16be
	cmpl	$1, %eax
	jne	.L5392
	movl	$6, %esi
	movq	%r15, %rdi
	movl	%eax, 28(%rsp)
	call	stbi__skip.part.0
	movq	%r15, %rdi
	call	stbi__get16be
	movl	28(%rsp), %r9d
	cmpl	$16, %eax
	ja	.L5392
	movq	%r15, %rdi
	movl	%r9d, 28(%rsp)
	call	stbi__get32be
	movq	%r15, %rdi
	movq	(%rsp), %rcx
	movl	%eax, (%rcx)
	call	stbi__get32be
	movq	%r15, %rdi
	movq	8(%rsp), %rcx
	movl	%eax, (%rcx)
	call	stbi__get16be
	subl	$8, %eax
	movl	28(%rsp), %r9d
	andl	$-9, %eax
	jne	.L5392
	movq	%r15, %rdi
	movl	%r9d, (%rsp)
	call	stbi__get16be
	cmpl	$3, %eax
	movl	(%rsp), %r9d
	jne	.L5392
	movq	16(%rsp), %rax
	movl	$4, (%rax)
	jmp	.L5219
	.p2align 4
	.p2align 3
.L5252:
	leaq	56(%r15), %rsi
	movl	52(%r15), %edx
	movq	40(%r15), %rdi
	movq	%rsi, (%rsp)
	call	*16(%r15)
	movq	192(%r15), %rdx
	leaq	57(%r15), %rcx
	subq	208(%r15), %rdx
	addl	%edx, 184(%r15)
	testl	%eax, %eax
	movq	(%rsp), %rsi
	jne	.L5254
	vmovq	%rcx, %xmm7
	vpunpcklqdq	%xmm7, %xmm7, %xmm0
	movl	$0, 48(%r15)
	movb	$0, 56(%r15)
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L5255
.L5306:
	movq	%r15, %rdi
	movl	%r9d, (%rsp)
	call	stbi__get8
	cmpl	$1, %r14d
	movl	(%rsp), %r9d
	movl	%eax, %r13d
	je	.L5410
	andl	$-10, %eax
	cmpb	$2, %al
	jne	.L5320
	movl	$9, %esi
	movq	%r15, %rdi
	movl	%r9d, (%rsp)
	xorl	%r14d, %r14d
	call	stbi__skip.part.0
	movl	(%rsp), %r9d
.L5312:
	movq	%r15, %rdi
	movl	%r9d, 8(%rsp)
	call	stbi__get16le
	testl	%eax, %eax
	movl	8(%rsp), %r9d
	movl	%eax, (%rsp)
	jle	.L5320
	movq	%r15, %rdi
	movl	%r9d, 8(%rsp)
	call	stbi__get16le
	testl	%eax, %eax
	movl	8(%rsp), %r9d
	jle	.L5320
	movq	%r15, %rdi
	movl	%r9d, 28(%rsp)
	movl	%eax, 16(%rsp)
	call	stbi__get8
	movq	%r15, %rdi
	movb	%al, 8(%rsp)
	call	stbi__get8
	testl	%r14d, %r14d
	movzbl	8(%rsp), %edx
	movl	16(%rsp), %ecx
	movl	28(%rsp), %r9d
	je	.L5316
	subl	$8, %edx
	andb	$-9, %dl
	jne	.L5320
	cmpl	$16, %r14d
	jg	.L5318
	cmpl	$14, %r14d
	jg	.L5339
	movl	$1, %eax
	cmpl	$8, %r14d
	jne	.L5320
.L5319:
	testq	%rbx, %rbx
	je	.L5325
	movl	(%rsp), %esi
	movl	%esi, (%rbx)
.L5325:
	testq	%rbp, %rbp
	je	.L5326
	movl	%ecx, 0(%rbp)
.L5326:
	testq	%r12, %r12
	je	.L5395
	movl	%eax, (%r12)
.L5395:
	movl	$1, %r9d
	jmp	.L5219
.L5278:
	leaq	1(%rdx), %rcx
	movq	%rcx, 192(%r15)
	movzbl	(%rdx), %edx
.L5281:
	cmpb	$83, %dl
	jne	.L5279
	cmpq	%rcx, %rax
	ja	.L5282
	movl	48(%r15), %edi
	testl	%edi, %edi
	je	.L5279
	leaq	56(%r15), %r14
	movl	52(%r15), %edx
	movq	40(%r15), %rdi
	movq	%r14, %rsi
	call	*16(%r15)
	movq	192(%r15), %rdx
	leaq	57(%r15), %rsi
	subq	208(%r15), %rdx
	addl	%edx, 184(%r15)
	testl	%eax, %eax
	je	.L5283
	cltq
	movzbl	56(%r15), %edx
	vmovq	%rsi, %xmm7
	addq	%r14, %rax
	vpinsrq	$1, %rax, %xmm7, %xmm0
	vmovdqu	%xmm0, 192(%r15)
.L5284:
	cmpb	$-128, %dl
	jne	.L5279
	cmpq	%rax, %rsi
	jb	.L5285
	movl	48(%r15), %esi
	testl	%esi, %esi
	je	.L5279
	leaq	56(%r15), %r14
	movl	52(%r15), %edx
	movq	40(%r15), %rdi
	movq	%r14, %rsi
	call	*16(%r15)
	movq	192(%r15), %rdx
	subq	208(%r15), %rdx
	addl	%edx, 184(%r15)
	leaq	57(%r15), %rdx
	testl	%eax, %eax
	je	.L5286
	cltq
	movzbl	56(%r15), %ecx
	vmovq	%rdx, %xmm7
	addq	%r14, %rax
	vpinsrq	$1, %rax, %xmm7, %xmm0
	vmovdqu	%xmm0, 192(%r15)
.L5287:
	cmpb	$-10, %cl
	jne	.L5279
	cmpq	%rax, %rdx
	jb	.L5411
	movl	48(%r15), %ecx
	testl	%ecx, %ecx
	je	.L5279
	leaq	56(%r15), %r14
	movl	52(%r15), %edx
	movq	40(%r15), %rdi
	movq	%r14, %rsi
	call	*16(%r15)
	movslq	%eax, %rdx
	movq	192(%r15), %rax
	subq	208(%r15), %rax
	addl	%eax, 184(%r15)
	leaq	57(%r15), %rax
	vmovq	%rax, %xmm0
	testl	%edx, %edx
	jne	.L5290
	vpunpcklqdq	%xmm0, %xmm0, %xmm0
	movl	$0, 48(%r15)
	movb	$0, 56(%r15)
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L5279
.L5282:
	leaq	1(%rcx), %rsi
	movq	%rsi, 192(%r15)
	movzbl	(%rcx), %edx
	jmp	.L5284
.L5285:
	leaq	1(%rsi), %rdx
	movq	%rdx, 192(%r15)
	movzbl	(%rsi), %ecx
	jmp	.L5287
.L5411:
	leaq	1(%rdx), %rax
	movq	%rax, 192(%r15)
	movzbl	(%rdx), %eax
.L5289:
	cmpb	$52, %al
	jne	.L5279
	movl	$88, %esi
	movq	%r15, %rdi
	call	stbi__skip.part.0
	movq	%r15, %rdi
	call	stbi__get16be
	movq	(%rsp), %rcx
	movq	%r15, %rdi
	movl	%eax, (%rcx)
	call	stbi__get16be
	cmpq	$0, 16(%r15)
	movq	8(%rsp), %rcx
	movl	%eax, (%rcx)
	je	.L5291
	movq	40(%r15), %rdi
	call	*32(%r15)
	testl	%eax, %eax
	je	.L5292
	movl	48(%r15), %edx
	testl	%edx, %edx
	je	.L5279
.L5291:
	movq	200(%r15), %rax
	cmpq	%rax, 192(%r15)
	jnb	.L5279
.L5292:
	movq	(%rsp), %rax
	movl	(%rax), %ecx
	testl	%ecx, %ecx
	je	.L5295
	movl	$268435456, %eax
	cltd
	idivl	%ecx
	movq	8(%rsp), %rcx
	cmpl	(%rcx), %eax
	jl	.L5393
.L5295:
	movl	$8, %esi
	movq	%r15, %rdi
	call	stbi__skip.part.0
	movl	$10, 8(%rsp)
.L5296:
	movq	%r15, %rdi
	call	stbi__get8
	movq	%r15, %rdi
	movl	%eax, %r14d
	call	stbi__get8
	movq	%r15, %rdi
	movb	%al, (%rsp)
	call	stbi__get8
	movq	%r15, %rdi
	call	stbi__get8
	movzbl	%al, %eax
	orl	%eax, %r13d
	cmpq	$0, 16(%r15)
	je	.L5300
	movq	40(%r15), %rdi
	call	*32(%r15)
	testl	%eax, %eax
	je	.L5299
	movl	48(%r15), %eax
	testl	%eax, %eax
	je	.L5279
.L5300:
	movq	200(%r15), %rax
	cmpq	%rax, 192(%r15)
	jnb	.L5279
.L5299:
	cmpb	$8, (%rsp)
	jne	.L5393
	testb	%r14b, %r14b
	je	.L5412
	decl	8(%rsp)
	jne	.L5296
	jmp	.L5293
.L5254:
	cltq
	vmovq	%rcx, %xmm7
	movzbl	56(%r15), %edx
	addq	%rsi, %rax
	vpinsrq	$1, %rax, %xmm7, %xmm0
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L5251
.L5258:
	cltq
	vmovq	%rcx, %xmm7
	movzbl	56(%r15), %edx
	addq	%rsi, %rax
	vpinsrq	$1, %rax, %xmm7, %xmm0
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L5257
.L5407:
	leaq	56(%r15), %r14
	movl	52(%r15), %edx
	movq	40(%r15), %rdi
	movq	%r14, %rsi
	call	*16(%r15)
	movq	192(%r15), %rdx
	leaq	57(%r15), %rcx
	subq	208(%r15), %rdx
	addl	%edx, 184(%r15)
	testl	%eax, %eax
	je	.L5280
	cltq
	vmovq	%rcx, %xmm7
	movzbl	56(%r15), %edx
	addq	%r14, %rax
	vpinsrq	$1, %rax, %xmm7, %xmm0
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L5281
.L5393:
	vmovdqu	208(%r15), %xmm7
	vmovdqu	%xmm7, 192(%r15)
	jmp	.L5293
.L5280:
	vmovq	%rcx, %xmm6
	vpunpcklqdq	%xmm6, %xmm6, %xmm0
	movl	$0, 48(%r15)
	movb	$0, 56(%r15)
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L5279
.L5283:
	vmovq	%rsi, %xmm6
	vpunpcklqdq	%xmm6, %xmm6, %xmm0
	movl	$0, 48(%r15)
	movb	$0, 56(%r15)
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L5279
.L5286:
	vmovq	%rdx, %xmm6
	vpunpcklqdq	%xmm6, %xmm6, %xmm0
	movl	$0, 48(%r15)
	movb	$0, 56(%r15)
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L5279
.L5290:
	addq	%rdx, %r14
	movzbl	56(%r15), %eax
	vpinsrq	$1, %r14, %xmm0, %xmm0
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L5289
.L5410:
	andl	$-9, %eax
	decb	%al
	jne	.L5320
	movl	$4, %esi
	movq	%r15, %rdi
	movl	%r9d, (%rsp)
	call	stbi__skip.part.0
	movq	%r15, %rdi
	call	stbi__get8
	movl	(%rsp), %r9d
	cmpb	$32, %al
	movzbl	%al, %r14d
	ja	.L5320
	movabsq	$-4311843073, %rdx
	sarx	%rax, %rdx, %rax
	testb	$1, %al
	jne	.L5320
	movl	$4, %esi
	movq	%r15, %rdi
	movl	%r9d, (%rsp)
	call	stbi__skip.part.0
	movl	(%rsp), %r9d
	jmp	.L5312
.L5412:
	movq	16(%rsp), %rbx
	andl	$16, %r13d
	movl	$1, %r9d
	cmpl	$1, %r13d
	sbbl	%eax, %eax
	addl	$4, %eax
	movl	%eax, (%rbx)
	jmp	.L5219
.L5396:
	leaq	.LC16(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L5221
.L5400:
	call	__stack_chk_fail@PLT
.L5316:
	leal	-8(%rdx), %eax
	cmpb	$24, %al
	ja	.L5320
	leaq	.L5322(%rip), %rsi
	movzbl	%al, %eax
	movslq	(%rsi,%rax,4), %rax
	addq	%rsi, %rax
	notrack jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L5322:
	.long	.L5324-.L5322
	.long	.L5320-.L5322
	.long	.L5320-.L5322
	.long	.L5320-.L5322
	.long	.L5320-.L5322
	.long	.L5320-.L5322
	.long	.L5320-.L5322
	.long	.L5339-.L5322
	.long	.L5323-.L5322
	.long	.L5320-.L5322
	.long	.L5320-.L5322
	.long	.L5320-.L5322
	.long	.L5320-.L5322
	.long	.L5320-.L5322
	.long	.L5320-.L5322
	.long	.L5320-.L5322
	.long	.L5321-.L5322
	.long	.L5320-.L5322
	.long	.L5320-.L5322
	.long	.L5320-.L5322
	.long	.L5320-.L5322
	.long	.L5320-.L5322
	.long	.L5320-.L5322
	.long	.L5320-.L5322
	.long	.L5321-.L5322
	.text
.L5401:
	leaq	.LC16(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	movq	192(%r15), %rdx
	movq	200(%r15), %rax
	jmp	.L5246
.L5321:
	movzbl	%dl, %eax
	sarl	$3, %eax
	jmp	.L5319
.L5323:
	andl	$-9, %r13d
	xorl	%edx, %edx
	movl	$3, %eax
	cmpb	$3, %r13b
	sete	%dl
	subl	%edx, %eax
	jmp	.L5319
.L5324:
	movl	$1, %eax
	jmp	.L5319
.L5339:
	movl	$3, %eax
	jmp	.L5319
.L5318:
	leal	-24(%r14), %eax
	andl	$-9, %eax
	jne	.L5320
	movl	%r14d, %eax
	sarl	$3, %eax
	jmp	.L5319
	.cfi_endproc
.LFE775:
	.size	stbi__info_main, .-stbi__info_main
	.section	.rodata.str1.1
.LC227:
	.string	"bad Image Descriptor"
.LC228:
	.string	"missing color table"
.LC237:
	.string	"no clear code"
.LC238:
	.string	"too many codes"
.LC239:
	.string	"illegal code in raster"
.LC240:
	.string	"unknown code"
	.text
	.p2align 4
	.type	stbi__gif_load_next.constprop.0, @function
stbi__gif_load_next.constprop.0:
.LFB896:
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
	movq	%rsi, %rbp
	movq	%rdi, %rbx
	subq	$88, %rsp
	.cfi_def_cfa_offset 144
	movq	8(%rsi), %r12
	testq	%r12, %r12
	je	.L5546
	movl	$2, %eax
	sarx	%eax, 48(%rsi), %eax
	andl	$7, %eax
	movl	(%rsi), %edx
	imull	4(%rsi), %edx
	cmpl	$3, %eax
	jne	.L5425
	testq	%rcx, %rcx
	jne	.L5422
.L5428:
	movslq	%edx, %rcx
	xorl	%eax, %eax
	testl	%edx, %edx
	jg	.L5430
	jmp	.L5424
	.p2align 4
	.p2align 3
.L5429:
	incq	%rax
	cmpq	%rcx, %rax
	je	.L5542
.L5430:
	movq	24(%rbp), %rdx
	cmpb	$0, (%rdx,%rax)
	je	.L5429
	movq	16(%rbp), %rsi
	leal	0(,%rax,4), %edx
	incq	%rax
	movslq	%edx, %rdx
	movl	(%rsi,%rdx), %esi
	movl	%esi, (%r12,%rdx)
	movq	8(%rbp), %r12
	cmpq	%rcx, %rax
	jne	.L5430
.L5542:
	movl	0(%rbp), %edx
	imull	4(%rbp), %edx
	jmp	.L5424
	.p2align 4
	.p2align 3
.L5422:
	cmpl	$3, %eax
	jne	.L5425
	testl	%edx, %edx
	jle	.L5424
	movslq	%edx, %rdx
	xorl	%eax, %eax
	jmp	.L5427
	.p2align 4
	.p2align 3
.L5426:
	incq	%rax
	cmpq	%rdx, %rax
	je	.L5542
.L5427:
	movq	24(%rbp), %rsi
	cmpb	$0, (%rsi,%rax)
	je	.L5426
	leal	0(,%rax,4), %esi
	movslq	%esi, %rsi
	movl	(%rcx,%rsi), %edi
	movl	%edi, (%r12,%rsi)
	movq	8(%rbp), %r12
	jmp	.L5426
	.p2align 4
	.p2align 3
.L5425:
	cmpl	$2, %eax
	je	.L5428
.L5424:
	movq	16(%rbp), %rdi
	sall	$2, %edx
	movq	%r12, %rsi
	movslq	%edx, %rdx
	call	memcpy@PLT
	movl	4(%rbp), %edx
	movl	$0, 44(%rsp)
	imull	0(%rbp), %edx
	movq	24(%rbp), %rdi
	movslq	%edx, %rdx
.L5421:
	xorl	%esi, %esi
	leaq	56(%rbx), %r13
	leaq	57(%rbx), %r12
	call	memset@PLT
	movq	192(%rbx), %rax
	movq	200(%rbx), %rdx
.L5431:
	cmpq	%rdx, %rax
	jb	.L5547
	movl	48(%rbx), %eax
	testl	%eax, %eax
	jne	.L5548
.L5434:
	leaq	.LC240(%rip), %rax
	xorl	%r12d, %r12d
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
.L5413:
	addq	$88, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%r12, %rax
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
	.p2align 4
	.p2align 3
.L5547:
	.cfi_restore_state
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rbx)
	movzbl	(%rax), %edx
.L5433:
	cmpb	$44, %dl
	je	.L5436
	cmpb	$59, %dl
	jne	.L5549
	movq	%rbx, %r12
	jmp	.L5413
	.p2align 4
	.p2align 3
.L5549:
	cmpb	$33, %dl
	jne	.L5434
	movq	%rbx, %rdi
	call	stbi__get8
	cmpb	$-7, %al
	je	.L5550
.L5544:
	movq	192(%rbx), %rax
	movq	200(%rbx), %rdx
.L5483:
	cmpq	%rdx, %rax
	jb	.L5551
	movl	48(%rbx), %ecx
	testl	%ecx, %ecx
	je	.L5431
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%r13, %rsi
	call	*16(%rbx)
	movslq	%eax, %rdx
	movq	192(%rbx), %rax
	subq	208(%rbx), %rax
	addl	%eax, 184(%rbx)
	movq	%r12, %rax
	testl	%edx, %edx
	jne	.L5490
	vmovq	%r12, %xmm5
	vpunpcklqdq	%xmm5, %xmm5, %xmm0
	movl	$0, 48(%rbx)
	movq	%r12, %rdx
	movb	$0, 56(%rbx)
	vmovdqu	%xmm0, 192(%rbx)
	jmp	.L5431
	.p2align 4
	.p2align 3
.L5551:
	leaq	1(%rax), %rcx
	movq	%rcx, 192(%rbx)
	movzbl	(%rax), %eax
	movzbl	%al, %esi
.L5489:
	testl	%esi, %esi
	je	.L5552
	cmpq	$0, 16(%rbx)
	je	.L5486
	movq	%rdx, %rdi
	subq	%rcx, %rdi
	cmpl	%esi, %edi
	jl	.L5553
.L5486:
	addq	%rcx, %rax
	movq	%rax, 192(%rbx)
	jmp	.L5483
	.p2align 4
	.p2align 3
.L5553:
	subl	%edi, %esi
	movq	%rdx, 192(%rbx)
	movq	40(%rbx), %rdi
	call	*24(%rbx)
	jmp	.L5544
	.p2align 4
	.p2align 3
.L5436:
	movq	%rbx, %rdi
	call	stbi__get16le
	movq	%rbx, %rdi
	movl	%eax, %r12d
	call	stbi__get16le
	movq	%rbx, %rdi
	movl	%eax, %r14d
	call	stbi__get16le
	movq	%rbx, %rdi
	movl	%eax, %r13d
	call	stbi__get16le
	movl	0(%rbp), %ecx
	leal	(%r12,%r13), %edx
	cmpl	%ecx, %edx
	jg	.L5438
	leal	(%r14,%rax), %edx
	cmpl	4(%rbp), %edx
	jg	.L5438
	sall	$2, %ecx
	movl	%r14d, %esi
	leal	0(,%r12,4), %edx
	imull	%ecx, %esi
	movl	%ecx, 34916(%rbp)
	vmovd	%edx, %xmm7
	movl	%edx, 34908(%rbp)
	imull	%ecx, %eax
	leal	(%rdx,%r13,4), %ecx
	movq	%rbx, %rdi
	vmovd	%ecx, %xmm1
	vpinsrd	$1, %esi, %xmm7, %xmm0
	addl	%esi, %eax
	testl	%r13d, %r13d
	vpinsrd	$1, %eax, %xmm1, %xmm1
	cmovne	%esi, %eax
	vpunpcklqdq	%xmm1, %xmm0, %xmm0
	movl	%eax, 34912(%rbp)
	vmovdqu	%xmm0, 34892(%rbp)
	call	stbi__get8
	movzbl	%al, %edx
	movl	%edx, 34888(%rbp)
	testb	$64, %al
	jne	.L5554
	movl	34916(%rbp), %edx
	vpxor	%xmm0, %xmm0, %xmm0
.L5442:
	vpinsrd	$1, %edx, %xmm0, %xmm0
	vmovq	%xmm0, 34880(%rbp)
	testb	%al, %al
	jns	.L5443
	movl	$-1, %ecx
	testb	$1, 48(%rbp)
	je	.L5444
	movl	44(%rbp), %ecx
.L5444:
	leaq	1076(%rbp), %r12
	andl	$7, %eax
	movl	$2, %edx
	movq	%rbx, %rdi
	shlx	%eax, %edx, %edx
	movq	%r12, %rsi
	call	stbi__gif_parse_colortable
.L5445:
	movq	%r12, 34872(%rbp)
	movq	%rbx, %rdi
	call	stbi__get8
	cmpb	$12, %al
	ja	.L5545
	movzbl	%al, %ecx
	movl	$1, %edx
	leal	1(%rcx), %edi
	shlx	%eax, %edx, %eax
	movl	%edi, %ecx
	movl	%eax, 8(%rsp)
	movl	%edi, 36(%rsp)
	movl	%eax, %edi
	shlx	%ecx, %edx, %edx
	leal	-1(%rax), %eax
	leal	-1(%rdx), %ecx
	movl	%ecx, 40(%rsp)
	cmpl	$14, %eax
	jbe	.L5494
	vmovdqa	.LC226(%rip), %xmm5
	shrl	$4, %edi
	leaq	2102(%rbp), %rax
	vmovdqa	.LC229(%rip), %xmm13
	vmovdqa	.LC230(%rip), %xmm12
	movl	%edi, %edx
	vmovdqa	.LC13(%rip), %xmm3
	vmovdqa	.LC231(%rip), %xmm11
	decl	%edx
	vmovdqa	.LC232(%rip), %xmm10
	vmovdqa	.LC2(%rip), %xmm4
	salq	$6, %rdx
	vmovdqa	.LC233(%rip), %xmm9
	vmovdqa	.LC234(%rip), %xmm8
	leaq	2166(%rbp,%rdx), %rdx
	vmovdqa	.LC235(%rip), %xmm7
	vmovdqa	.LC236(%rip), %xmm6
.L5449:
	vmovdqa	%xmm5, %xmm2
	movw	$-1, -2(%rax)
	movw	$-1, 2(%rax)
	addq	$64, %rax
	vpaddd	%xmm12, %xmm2, %xmm0
	vpand	%xmm2, %xmm3, %xmm1
	vpaddd	%xmm10, %xmm2, %xmm14
	movw	$-1, -58(%rax)
	vpand	%xmm0, %xmm3, %xmm0
	vpand	%xmm14, %xmm3, %xmm14
	movw	$-1, -54(%rax)
	movw	$-1, -50(%rax)
	vpackusdw	%xmm0, %xmm1, %xmm1
	vpaddd	%xmm11, %xmm2, %xmm0
	movw	$-1, -46(%rax)
	movw	$-1, -42(%rax)
	vpand	%xmm0, %xmm3, %xmm0
	vpand	%xmm1, %xmm4, %xmm1
	movw	$-1, -38(%rax)
	movw	$-1, -34(%rax)
	vpackusdw	%xmm14, %xmm0, %xmm0
	vpaddd	%xmm8, %xmm2, %xmm14
	movw	$-1, -30(%rax)
	movw	$-1, -26(%rax)
	vpand	%xmm0, %xmm4, %xmm0
	vpand	%xmm14, %xmm3, %xmm14
	movw	$-1, -22(%rax)
	movw	$-1, -18(%rax)
	vpackuswb	%xmm0, %xmm1, %xmm1
	vpaddd	%xmm9, %xmm2, %xmm0
	movw	$-1, -14(%rax)
	movw	$-1, -10(%rax)
	vpand	%xmm0, %xmm3, %xmm0
	movw	$-1, -6(%rax)
	vpaddd	%xmm13, %xmm5, %xmm5
	vpackusdw	%xmm14, %xmm0, %xmm0
	vpaddd	%xmm7, %xmm2, %xmm14
	vpaddd	%xmm6, %xmm2, %xmm2
	vpextrw	$0, %xmm1, -64(%rax)
	vpand	%xmm14, %xmm3, %xmm14
	vpand	%xmm2, %xmm3, %xmm2
	vpand	%xmm0, %xmm4, %xmm0
	vpextrw	$1, %xmm1, -60(%rax)
	vpackusdw	%xmm2, %xmm14, %xmm2
	vpextrw	$2, %xmm1, -56(%rax)
	vpextrw	$3, %xmm1, -52(%rax)
	vpand	%xmm2, %xmm4, %xmm2
	vpextrw	$4, %xmm1, -48(%rax)
	vpextrw	$5, %xmm1, -44(%rax)
	vpackuswb	%xmm2, %xmm0, %xmm0
	vpextrw	$6, %xmm1, -40(%rax)
	vpextrw	$7, %xmm1, -36(%rax)
	vpextrw	$0, %xmm0, -32(%rax)
	vpextrw	$1, %xmm0, -28(%rax)
	vpextrw	$2, %xmm0, -24(%rax)
	vpextrw	$3, %xmm0, -20(%rax)
	vpextrw	$4, %xmm0, -16(%rax)
	vpextrw	$5, %xmm0, -12(%rax)
	vpextrw	$6, %xmm0, -8(%rax)
	vpextrw	$7, %xmm0, -4(%rax)
	cmpq	%rax, %rdx
	jne	.L5449
	movl	8(%rsp), %edi
	movl	%edi, %eax
	andl	$-16, %eax
	andl	$15, %edi
	je	.L5450
.L5448:
	xorl	%edx, %edx
	movl	8(%rsp), %r9d
	movslq	%eax, %rsi
	movb	%al, %dl
	leaq	0(%rbp,%rsi,4), %r15
	movb	%al, %dh
	movw	$-1, 2100(%r15)
	movw	%dx, 2102(%rbp,%rsi,4)
	leal	1(%rax), %edx
	cmpl	%edx, %r9d
	jle	.L5450
	xorl	%esi, %esi
	movslq	%edx, %rdi
	movw	$-1, 2104(%r15)
	movb	%dl, %sil
	movl	%esi, %ecx
	movb	%dl, %ch
	leal	2(%rax), %edx
	movw	%cx, 2102(%rbp,%rdi,4)
	cmpl	%edx, %r9d
	jle	.L5450
	xorl	%esi, %esi
	movslq	%edx, %rdi
	movw	$-1, 2108(%r15)
	movb	%dl, %sil
	movl	%esi, %ecx
	movb	%dl, %ch
	leal	3(%rax), %edx
	movw	%cx, 2102(%rbp,%rdi,4)
	cmpl	%r9d, %edx
	jge	.L5450
	xorl	%esi, %esi
	movslq	%edx, %rdi
	movw	$-1, 2112(%r15)
	movb	%dl, %sil
	movl	%esi, %ecx
	movb	%dl, %ch
	leal	4(%rax), %edx
	movw	%cx, 2102(%rbp,%rdi,4)
	cmpl	%edx, %r9d
	jle	.L5450
	xorl	%esi, %esi
	movslq	%edx, %rdi
	movw	$-1, 2116(%r15)
	movb	%dl, %sil
	movl	%esi, %ecx
	movb	%dl, %ch
	leal	5(%rax), %edx
	movw	%cx, 2102(%rbp,%rdi,4)
	cmpl	%r9d, %edx
	jge	.L5450
	xorl	%esi, %esi
	movslq	%edx, %rdi
	movw	$-1, 2120(%r15)
	movb	%dl, %sil
	movl	%esi, %ecx
	movb	%dl, %ch
	leal	6(%rax), %edx
	movw	%cx, 2102(%rbp,%rdi,4)
	cmpl	%edx, %r9d
	jle	.L5450
	xorl	%esi, %esi
	movslq	%edx, %rdi
	movw	$-1, 2124(%r15)
	movb	%dl, %sil
	movl	%esi, %ecx
	movb	%dl, %ch
	leal	7(%rax), %edx
	movw	%cx, 2102(%rbp,%rdi,4)
	cmpl	%edx, %r9d
	jle	.L5450
	xorl	%esi, %esi
	movslq	%edx, %rdi
	movw	$-1, 2128(%r15)
	movb	%dl, %sil
	movl	%esi, %ecx
	movb	%dl, %ch
	leal	8(%rax), %edx
	movw	%cx, 2102(%rbp,%rdi,4)
	cmpl	%edx, %r9d
	jle	.L5450
	xorl	%esi, %esi
	movslq	%edx, %rdi
	movw	$-1, 2132(%r15)
	movb	%dl, %sil
	movl	%esi, %ecx
	movb	%dl, %ch
	leal	9(%rax), %edx
	movw	%cx, 2102(%rbp,%rdi,4)
	cmpl	%edx, %r9d
	jle	.L5450
	xorl	%esi, %esi
	movslq	%edx, %rdi
	movw	$-1, 2136(%r15)
	movb	%dl, %sil
	movl	%esi, %ecx
	movb	%dl, %ch
	leal	10(%rax), %edx
	movw	%cx, 2102(%rbp,%rdi,4)
	cmpl	%edx, %r9d
	jle	.L5450
	xorl	%esi, %esi
	movslq	%edx, %rdi
	movw	$-1, 2140(%r15)
	movb	%dl, %sil
	movl	%esi, %ecx
	movb	%dl, %ch
	leal	11(%rax), %edx
	movw	%cx, 2102(%rbp,%rdi,4)
	cmpl	%edx, %r9d
	jle	.L5450
	xorl	%esi, %esi
	movslq	%edx, %rdi
	movw	$-1, 2144(%r15)
	movb	%dl, %sil
	movl	%esi, %ecx
	movb	%dl, %ch
	leal	12(%rax), %edx
	movw	%cx, 2102(%rbp,%rdi,4)
	cmpl	%edx, %r9d
	jle	.L5450
	xorl	%esi, %esi
	movslq	%edx, %rdi
	movw	$-1, 2148(%r15)
	movb	%dl, %sil
	movl	%esi, %ecx
	movb	%dl, %ch
	leal	13(%rax), %edx
	movw	%cx, 2102(%rbp,%rdi,4)
	cmpl	%edx, %r9d
	jle	.L5450
	xorl	%esi, %esi
	movslq	%edx, %rdi
	addl	$14, %eax
	movw	$-1, 2152(%r15)
	movb	%dl, %sil
	movl	%esi, %ecx
	movb	%dl, %ch
	movw	%cx, 2102(%rbp,%rdi,4)
	cmpl	%eax, %r9d
	jle	.L5450
	xorl	%edx, %edx
	movslq	%eax, %rcx
	movw	$-1, 2156(%r15)
	movb	%al, %dl
	movb	%al, %dh
	movw	%dx, 2102(%rbp,%rcx,4)
	.p2align 4
	.p2align 3
.L5450:
	movl	8(%rsp), %edi
	xorl	%r15d, %r15d
	xorl	%r12d, %r12d
	movq	$-1, %r10
	movl	40(%rsp), %r11d
	movl	36(%rsp), %r13d
	movl	$1, 28(%rsp)
	leal	2(%rdi), %eax
	movl	%eax, %ecx
	movl	%eax, 56(%rsp)
	leal	1(%rdi), %eax
	movl	%eax, 32(%rsp)
	leaq	57(%rbx), %rax
	movslq	%ecx, %r14
	movq	%rax, 48(%rsp)
	movq	%rbp, %rax
	movl	%r15d, %ebp
	movq	%rax, %rcx
	.p2align 4
	.p2align 3
.L5451:
	cmpl	%r12d, %r13d
	jle	.L5452
	movq	192(%rbx), %rdx
	movq	200(%rbx), %rax
	testl	%ebp, %ebp
	jne	.L5453
	cmpq	%rax, %rdx
	jb	.L5555
	movl	48(%rbx), %eax
	testl	%eax, %eax
	jne	.L5456
.L5539:
	movq	%rcx, %rbp
.L5543:
	movq	8(%rbp), %r12
	testq	%r12, %r12
	je	.L5545
	movl	44(%rsp), %edi
	testl	%edi, %edi
	je	.L5413
	movl	36(%rbp), %esi
	testl	%esi, %esi
	jle	.L5413
	movl	0(%rbp), %ecx
	imull	4(%rbp), %ecx
	testl	%ecx, %ecx
	jle	.L5413
	movslq	%ecx, %rcx
	xorl	%eax, %eax
	jmp	.L5478
	.p2align 4
	.p2align 3
.L5477:
	incq	%rax
	cmpq	%rax, %rcx
	je	.L5413
.L5478:
	movq	24(%rbp), %rdx
	cmpb	$0, (%rdx,%rax)
	jne	.L5477
	movslq	36(%rbp), %rdx
	movb	$-1, 55(%rbp,%rdx,4)
	movl	52(%rbp,%rdx,4), %edi
	movq	8(%rbp), %rsi
	leal	0(,%rax,4), %edx
	movslq	%edx, %rdx
	movl	%edi, (%rsi,%rdx)
	jmp	.L5477
	.p2align 4
	.p2align 3
.L5550:
	movq	%rbx, %rdi
	call	stbi__get8
	movzbl	%al, %esi
	cmpb	$4, %al
	je	.L5556
	testl	%esi, %esi
	je	.L5484
	movq	%rbx, %rdi
	call	stbi__skip.part.0
	movq	192(%rbx), %rax
	movq	200(%rbx), %rdx
	jmp	.L5431
	.p2align 4
	.p2align 3
.L5490:
	movzbl	56(%rbx), %eax
	addq	%r13, %rdx
	vmovq	%r12, %xmm7
	movq	%r12, %rcx
	vpinsrq	$1, %rdx, %xmm7, %xmm0
	vmovdqu	%xmm0, 192(%rbx)
	movzbl	%al, %esi
	jmp	.L5489
	.p2align 4
	.p2align 3
.L5554:
	movl	34916(%rbp), %ecx
	leal	0(,%rcx,8), %edx
	movl	$3, %ecx
	vmovd	%ecx, %xmm0
	jmp	.L5442
	.p2align 4
	.p2align 3
.L5452:
	movl	%r15d, %r8d
	subl	%r13d, %r12d
	sarx	%r13d, %r15d, %r15d
	andl	%r11d, %r8d
	cmpl	%r8d, 8(%rsp)
	je	.L5495
	cmpl	32(%rsp), %r8d
	je	.L5557
	cmpl	%r14d, %r8d
	jg	.L5471
	movl	28(%rsp), %r9d
	testl	%r9d, %r9d
	jne	.L5558
	testl	%r10d, %r10d
	js	.L5473
	leal	1(%r14), %eax
	cmpl	$8192, %eax
	jg	.L5559
	leaq	(%rcx,%r14,4), %rdx
	movw	%r10w, 2100(%rdx)
	movzbl	2102(%rcx,%r10,4), %esi
	movb	%sil, 2102(%rdx)
	cmpl	%eax, %r8d
	je	.L5475
	movslq	%r8d, %rsi
	movzbl	2102(%rcx,%rsi,4), %esi
.L5475:
	movb	%sil, 2103(%rdx)
	movslq	%eax, %r14
.L5476:
	movq	%rcx, %rdi
	movzwl	%r8w, %esi
	movq	%rcx, 16(%rsp)
	call	stbi__out_gif_code
	testl	%r14d, %r11d
	movq	16(%rsp), %rcx
	jne	.L5496
	cmpl	$4095, %r14d
	jle	.L5560
.L5496:
	movslq	%r8d, %r10
	jmp	.L5451
	.p2align 4
	.p2align 3
.L5555:
	leaq	1(%rdx), %rsi
	movq	%rsi, 192(%rbx)
	movzbl	(%rdx), %ebp
	movq	%rsi, %rdx
.L5455:
	testl	%ebp, %ebp
	je	.L5539
.L5453:
	decl	%ebp
	cmpq	%rax, %rdx
	jb	.L5561
	movl	48(%rbx), %eax
	testl	%eax, %eax
	jne	.L5562
.L5461:
	addl	$8, %r12d
	jmp	.L5451
	.p2align 4
	.p2align 3
.L5495:
	movslq	56(%rsp), %r14
	movl	40(%rsp), %r11d
	movq	$-1, %r10
	movl	$0, 28(%rsp)
	movl	36(%rsp), %r13d
	jmp	.L5451
	.p2align 4
	.p2align 3
.L5561:
	leaq	1(%rdx), %rax
	movq	%rax, 192(%rbx)
	movzbl	(%rdx), %eax
	shlx	%r12d, %eax, %eax
	orl	%eax, %r15d
	jmp	.L5461
	.p2align 4
	.p2align 3
.L5473:
	cmpl	%r14d, %r8d
	jne	.L5476
.L5471:
	leaq	.LC239(%rip), %rax
	xorl	%r12d, %r12d
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L5413
	.p2align 4
	.p2align 3
.L5560:
	incl	%r13d
	movl	$1, %eax
	movslq	%r8d, %r10
	shlx	%r13d, %eax, %r11d
	decl	%r11d
	jmp	.L5451
	.p2align 4
	.p2align 3
.L5562:
	leaq	56(%rbx), %rsi
	movl	52(%rbx), %edx
	movq	%rcx, 72(%rsp)
	movl	%r10d, 64(%rsp)
	movl	%r11d, 60(%rsp)
	movq	%rsi, 16(%rsp)
	movq	40(%rbx), %rdi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	testl	%eax, %eax
	movq	16(%rsp), %rsi
	movl	60(%rsp), %r11d
	movslq	64(%rsp), %r10
	movq	72(%rsp), %rcx
	jne	.L5462
	movq	48(%rsp), %rsi
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
.L5463:
	vmovq	48(%rsp), %xmm6
	vpinsrq	$1, %rsi, %xmm6, %xmm0
	vmovdqu	%xmm0, 192(%rbx)
	jmp	.L5461
	.p2align 4
	.p2align 3
.L5546:
	xorl	%ecx, %ecx
	call	stbi__gif_header
	testl	%eax, %eax
	je	.L5545
	movl	0(%rbp), %esi
	movl	4(%rbp), %ecx
	testl	%esi, %esi
	js	.L5417
	je	.L5418
	movl	$2147483647, %eax
	cltd
	idivl	%esi
	cmpl	$3, %eax
	jle	.L5417
.L5418:
	testl	%ecx, %ecx
	js	.L5417
	je	.L5419
	movl	$2147483647, %eax
	leal	0(,%rsi,4), %edi
	cltd
	idivl	%ecx
	cmpl	%eax, %edi
	jle	.L5419
	.p2align 4
	.p2align 3
.L5417:
	leaq	.LC93(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L5413
	.p2align 4
	.p2align 3
.L5456:
	leaq	56(%rbx), %rbp
	movl	52(%rbx), %edx
	movq	%rcx, 64(%rsp)
	movl	%r10d, 60(%rsp)
	movl	%r11d, 16(%rsp)
	movq	%rbp, %rsi
	movq	40(%rbx), %rdi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	subq	208(%rbx), %rdx
	movl	16(%rsp), %r11d
	addl	%edx, 184(%rbx)
	testl	%eax, %eax
	movq	48(%rsp), %rdx
	movslq	60(%rsp), %r10
	movq	64(%rsp), %rcx
	jne	.L5458
	vmovddup	48(%rsp), %xmm0
	movq	%rcx, %rbp
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	vmovdqu	%xmm0, 192(%rbx)
	jmp	.L5543
	.p2align 4
	.p2align 3
.L5462:
	cltq
	addq	%rax, %rsi
	movzbl	56(%rbx), %eax
	shlx	%r12d, %eax, %eax
	orl	%eax, %r15d
	jmp	.L5463
	.p2align 4
	.p2align 3
.L5548:
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%r13, %rsi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	testl	%eax, %eax
	jne	.L5435
	vmovq	%r12, %xmm5
	vpunpcklqdq	%xmm5, %xmm5, %xmm0
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	vmovdqu	%xmm0, 192(%rbx)
	jmp	.L5434
	.p2align 4
	.p2align 3
.L5438:
	leaq	.LC227(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
.L5545:
	xorl	%r12d, %r12d
	jmp	.L5413
	.p2align 4
	.p2align 3
.L5443:
	testb	$-128, 32(%rbp)
	je	.L5446
	leaq	52(%rbp), %r12
	jmp	.L5445
	.p2align 4
	.p2align 3
.L5458:
	cltq
	vmovq	%rdx, %xmm7
	addq	%rbp, %rax
	movzbl	56(%rbx), %ebp
	vpinsrq	$1, %rax, %xmm7, %xmm0
	vmovdqu	%xmm0, 192(%rbx)
	jmp	.L5455
	.p2align 4
	.p2align 3
.L5435:
	cltq
	vmovq	%r12, %xmm6
	movzbl	56(%rbx), %edx
	addq	%r13, %rax
	vpinsrq	$1, %rax, %xmm6, %xmm0
	vmovdqu	%xmm0, 192(%rbx)
	jmp	.L5433
.L5419:
	imull	%esi, %ecx
	movl	$1, %esi
	leal	0(,%rcx,4), %r15d
	movl	%ecx, %r13d
	movslq	%r15d, %r15
	movq	%r15, %rdi
	call	calloc@PLT
	movq	%r15, %rdi
	movl	$1, %esi
	movq	%rax, 8(%rbp)
	movq	%rax, %r14
	call	calloc@PLT
	movslq	%r13d, %rdx
	movl	$1, %esi
	movq	%rax, %r15
	movq	%rdx, %rdi
	movq	%rax, 16(%rbp)
	movq	%rdx, 8(%rsp)
	call	calloc@PLT
	testq	%r15, %r15
	movq	%rax, %rdi
	movq	%rax, 24(%rbp)
	sete	%al
	testq	%r14, %r14
	sete	%cl
	orb	%cl, %al
	jne	.L5420
	testq	%rdi, %rdi
	je	.L5420
	movq	8(%rsp), %rdx
	movl	$1, 44(%rsp)
	jmp	.L5421
.L5484:
	movq	192(%rbx), %rax
	movq	200(%rbx), %rdx
	jmp	.L5431
.L5557:
	movl	%ebp, %r15d
	movq	%rcx, %rbp
	testl	%r15d, %r15d
	je	.L5467
	movl	%r15d, %esi
	movq	%rbx, %rdi
	call	stbi__skip.part.0
	.p2align 4
	.p2align 3
.L5467:
	movq	%rbx, %rdi
	call	stbi__get8
	movzbl	%al, %esi
	testl	%esi, %esi
	je	.L5543
.L5470:
	cmpq	$0, 16(%rbx)
	movq	192(%rbx), %rdx
	je	.L5468
	movq	200(%rbx), %rdi
	movq	%rdi, %rcx
	subq	%rdx, %rcx
	cmpl	%ecx, %esi
	jg	.L5563
.L5468:
	movzbl	%al, %eax
	movq	%rbx, %rdi
	addq	%rax, %rdx
	movq	%rdx, 192(%rbx)
	call	stbi__get8
	movzbl	%al, %esi
	testl	%esi, %esi
	jne	.L5470
	jmp	.L5543
	.p2align 4
	.p2align 3
.L5563:
	movq	%rdi, 192(%rbx)
	subl	%ecx, %esi
	movq	40(%rbx), %rdi
	call	*24(%rbx)
	jmp	.L5467
.L5558:
	leaq	.LC237(%rip), %rax
	xorl	%r12d, %r12d
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L5413
.L5559:
	leaq	.LC238(%rip), %rax
	xorl	%r12d, %r12d
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L5413
.L5446:
	leaq	.LC228(%rip), %rax
	xorl	%r12d, %r12d
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L5413
.L5494:
	xorl	%eax, %eax
	jmp	.L5448
.L5556:
	movq	%rbx, %rdi
	call	stbi__get8
	movq	%rbx, %rdi
	movzbl	%al, %eax
	movl	%eax, 48(%rbp)
	call	stbi__get16le
	leal	(%rax,%rax,4), %eax
	addl	%eax, %eax
	movl	%eax, 34920(%rbp)
	movslq	44(%rbp), %rax
	testl	%eax, %eax
	js	.L5481
	movb	$-1, 55(%rbp,%rax,4)
.L5481:
	testb	$1, 48(%rbp)
	je	.L5482
	movq	%rbx, %rdi
	call	stbi__get8
	movzbl	%al, %eax
	movl	%eax, 44(%rbp)
	movb	$0, 55(%rbp,%rax,4)
	jmp	.L5544
.L5482:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	stbi__skip.part.0
	movl	$-1, 44(%rbp)
	jmp	.L5544
.L5552:
	movq	%rcx, %rax
	jmp	.L5431
.L5420:
	leaq	.LC16(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L5413
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
	xorl	%ecx, %ecx
	movq	%r12, %rdx
	movq	%rbx, %rdi
	movq	%rax, %rsi
	call	stbi__gif_load_next.constprop.0
	cmpq	%rax, %rbx
	je	.L5565
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L5565
	movl	(%rsp), %ecx
	movl	4(%rsp), %r8d
	movl	%ecx, (%r14)
	movl	%r8d, 0(%rbp)
	testl	$-5, %r13d
	jne	.L5581
.L5566:
	movq	24(%rsp), %rdi
	call	free@PLT
	movq	16(%rsp), %rdi
	call	free@PLT
	movq	34936(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L5582
	addq	$34944, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	movq	%r12, %rax
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
	.p2align 4
	.p2align 3
.L5565:
	.cfi_restore_state
	movq	8(%rsp), %r12
	testq	%r12, %r12
	je	.L5566
	movq	%r12, %rdi
	xorl	%r12d, %r12d
	call	free@PLT
	jmp	.L5566
	.p2align 4
	.p2align 3
.L5581:
	movl	%r13d, %edx
	movl	$4, %esi
	movq	%rax, %rdi
	call	stbi__convert_format
	movq	%rax, %r12
	jmp	.L5566
.L5582:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE897:
	.size	stbi__gif_load.constprop.0, .-stbi__gif_load.constprop.0
	.section	.rodata.str1.1
.LC241:
	.string	"bad req_comp"
.LC242:
	.string	"bad bits_per_channel"
.LC243:
	.string	"bad format"
.LC244:
	.string	"bad palette"
.LC245:
	.string	"tga_comp == STBI_rgb"
	.text
	.p2align 4
	.type	stbi__load_main, @function
stbi__load_main:
.LFB594:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdi, %r15
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
	movq	%r9, %rbp
	subq	$440, %rsp
	.cfi_def_cfa_offset 496
	movq	%rdx, 32(%rsp)
	movq	%rsi, 24(%rsp)
	leaq	stbi__idct_simd(%rip), %rdx
	movl	496(%rsp), %ebx
	movq	%rcx, 16(%rsp)
	movl	%r8d, 136(%rsp)
	vmovq	%rdx, %xmm7
	movq	%fs:40, %rax
	movq	%rax, 424(%rsp)
	leaq	stbi__YCbCr_to_RGB_simd(%rip), %rax
	movq	$0, 4(%r9)
	movq	192(%rdi), %rdx
	movl	$8, (%r9)
	vpinsrq	$1, %rax, %xmm7, %xmm6
	movq	200(%rdi), %rax
	vmovdqa	%xmm6, (%rsp)
	cmpq	%rax, %rdx
	jb	.L5584
	movl	48(%rdi), %eax
	testl	%eax, %eax
	jne	.L6440
	.p2align 4
	.p2align 3
.L5585:
	leaq	.LC157(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	vmovdqu	208(%r15), %xmm3
	movq	216(%r15), %rcx
	movq	208(%r15), %rdx
	vmovdqu	%xmm3, 192(%r15)
	cmpq	%rcx, %rdx
	jb	.L6441
	movl	48(%r15), %r11d
	testl	%r11d, %r11d
	jne	.L6442
.L5621:
	movq	%rdx, 192(%r15)
.L5629:
	movq	%rcx, 200(%r15)
	movq	%r15, %rdi
	call	stbi__gif_test_raw
	vmovdqu	208(%r15), %xmm2
	movl	%eax, %r14d
	vmovdqu	%xmm2, 192(%r15)
	testl	%eax, %eax
	jne	.L6443
	movq	%r15, %rdi
	call	stbi__get32be
	vmovdqu	208(%r15), %xmm7
	movl	%eax, %r8d
	movq	208(%r15), %rdx
	movq	216(%r15), %rax
	vmovdqu	%xmm7, 192(%r15)
	cmpl	$943870035, %r8d
	je	.L6444
	cmpq	%rax, %rdx
	jb	.L5636
	movl	48(%r15), %r10d
	testl	%r10d, %r10d
	jne	.L6445
	.p2align 4
	.p2align 3
.L5637:
	movq	208(%r15), %rax
	movl	$18568, %edi
	movq	%rax, 192(%r15)
	movq	216(%r15), %rax
	movq	%rax, 200(%r15)
	call	malloc@PLT
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L6446
	vmovdqa	(%rsp), %xmm4
	leaq	stbi__resample_row_hv_2_simd(%rip), %rbx
	movq	%r15, (%rax)
	movq	%r15, %rdi
	movq	%rbx, 18560(%rax)
	vmovdqu	%xmm4, 18544(%rax)
	movq	.LC142(%rip), %rax
	movb	$-1, 18472(%r12)
	movq	%rax, 18504(%r12)
	call	stbi__get8
	cmpb	$-1, %al
	jne	.L6430
.L5796:
	movq	(%r12), %r13
	movq	192(%r13), %rax
	cmpq	200(%r13), %rax
	jb	.L6447
	movl	48(%r13), %ecx
	testl	%ecx, %ecx
	jne	.L6411
.L6430:
	vmovdqu	208(%r15), %xmm0
.L5799:
	leaq	.LC143(%rip), %rax
	movq	%r12, %rdi
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	vmovdqu	%xmm0, 192(%r15)
	call	free@PLT
.L5795:
	movq	%r15, %rdi
	call	stbi__get8
	movq	%r15, %rdi
	movl	%eax, %ebx
	call	stbi__get8
	cmpb	$80, %bl
	jne	.L5860
	subl	$53, %eax
	cmpb	$1, %al
	ja	.L5860
	leaq	8(%r15), %rcx
	leaq	4(%r15), %rdx
	movq	%r15, %rsi
	movq	%r15, %rdi
	call	stbi__pnm_info
	movl	%eax, 0(%rbp)
	testl	%eax, %eax
	je	.L6437
	cmpl	$16777216, 4(%r15)
	ja	.L5928
	movl	(%r15), %eax
	cmpl	$16777216, %eax
	ja	.L5928
	movq	24(%rsp), %rsi
	movl	%eax, (%rsi)
	movq	32(%rsp), %rsi
	movl	4(%r15), %eax
	movl	%eax, (%rsi)
	movq	16(%rsp), %rsi
	testq	%rsi, %rsi
	je	.L5867
	movl	8(%r15), %eax
	movl	%eax, (%rsi)
.L5867:
	movl	4(%r15), %r8d
	movl	(%r15), %esi
	movl	8(%r15), %ebx
	movl	0(%rbp), %edi
	movl	%r8d, %ebp
	imull	%esi, %ebp
	testl	%ebx, %ebx
	js	.L5928
	testl	%esi, %esi
	js	.L5928
	je	.L5868
	movl	$2147483647, %eax
	cltd
	idivl	%esi
	cmpl	%eax, %ebx
	jg	.L5928
.L5868:
	testl	%r8d, %r8d
	js	.L5928
	movl	%esi, %ecx
	imull	%ebx, %ecx
	testl	%r8d, %r8d
	je	.L5869
	movl	$2147483647, %eax
	cltd
	idivl	%r8d
	cmpl	%eax, %ecx
	jg	.L5928
.L5869:
	cmpl	$-7, %edi
	jl	.L5928
	testl	%edi, %edi
	leal	7(%rdi), %r12d
	cmovns	%edi, %r12d
	sarl	$3, %r12d
	je	.L5870
	movl	$2147483647, %eax
	imull	%r8d, %ecx
	cltd
	idivl	%r12d
	cmpl	%eax, %ecx
	jg	.L5928
.L5870:
	movl	%r12d, %ecx
	movl	%r8d, %edx
	movl	%ebx, %edi
	call	stbi__malloc_mad4.constprop.0
	movq	%rax, %r13
	movq	%rax, (%rsp)
	testq	%rax, %rax
	je	.L6436
	imull	%r12d, %ebx
	movq	%rax, %rsi
	movq	%r15, %rdi
	movl	%ebx, %edx
	imull	%ebp, %edx
	call	stbi__getn
	movl	136(%rsp), %eax
	testl	%eax, %eax
	je	.L5583
	movl	8(%r15), %esi
	cmpl	%esi, %eax
	je	.L5583
	movq	424(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L6439
	movl	4(%r15), %r8d
	movl	(%r15), %ecx
	movq	%r13, %rdi
	movl	136(%rsp), %edx
	addq	$440, %rsp
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
	jmp	stbi__convert_format
	.p2align 4
	.p2align 3
.L6441:
	.cfi_restore_state
	leaq	1(%rdx), %rax
	movq	%rax, 192(%r15)
	movzbl	(%rdx), %ecx
.L5620:
	cmpb	$66, %cl
	jne	.L5623
	movq	%r15, %rdi
	call	stbi__get8
	cmpb	$77, %al
	je	.L6448
	movq	208(%r15), %rax
	movq	216(%r15), %rcx
	movq	%rax, 192(%r15)
	jmp	.L5629
	.p2align 4
	.p2align 3
.L5584:
	leaq	1(%rdx), %rcx
	movq	%rcx, 192(%rdi)
	movzbl	(%rdx), %edx
.L5587:
	cmpb	$-119, %dl
	jne	.L5585
	cmpq	%rax, %rcx
	jb	.L5588
	movl	48(%r15), %eax
	testl	%eax, %eax
	je	.L5585
	leaq	56(%r15), %r12
	movl	52(%r15), %edx
	movq	40(%r15), %rdi
	movq	%r12, %rsi
	call	*16(%r15)
	movq	192(%r15), %rdx
	subq	208(%r15), %rdx
	addl	%edx, 184(%r15)
	leaq	57(%r15), %rdx
	testl	%eax, %eax
	je	.L5589
	cltq
	vmovq	%rdx, %xmm3
	movzbl	56(%r15), %ecx
	addq	%r12, %rax
	vpinsrq	$1, %rax, %xmm3, %xmm0
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L5590
	.p2align 4
	.p2align 3
.L5588:
	leaq	1(%rcx), %rdx
	movq	%rdx, 192(%r15)
	movzbl	(%rcx), %ecx
.L5590:
	cmpb	$80, %cl
	jne	.L5585
	cmpq	%rax, %rdx
	jb	.L5591
	movl	48(%r15), %eax
	testl	%eax, %eax
	je	.L5585
	leaq	56(%r15), %r12
	movl	52(%r15), %edx
	movq	40(%r15), %rdi
	movq	%r12, %rsi
	call	*16(%r15)
	movq	192(%r15), %rdx
	leaq	57(%r15), %rcx
	subq	208(%r15), %rdx
	addl	%edx, 184(%r15)
	testl	%eax, %eax
	je	.L5592
	cltq
	vmovq	%rcx, %xmm5
	movzbl	56(%r15), %edx
	addq	%r12, %rax
	vpinsrq	$1, %rax, %xmm5, %xmm0
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L5593
	.p2align 4
	.p2align 3
.L5591:
	leaq	1(%rdx), %rcx
	movq	%rcx, 192(%r15)
	movzbl	(%rdx), %edx
.L5593:
	cmpb	$78, %dl
	jne	.L5585
	cmpq	%rax, %rcx
	jb	.L5594
	movl	48(%r15), %eax
	testl	%eax, %eax
	je	.L5585
	leaq	56(%r15), %r12
	movl	52(%r15), %edx
	movq	40(%r15), %rdi
	movq	%r12, %rsi
	call	*16(%r15)
	movq	192(%r15), %rdx
	subq	208(%r15), %rdx
	addl	%edx, 184(%r15)
	leaq	57(%r15), %rdx
	testl	%eax, %eax
	je	.L5595
	cltq
	vmovq	%rdx, %xmm7
	movzbl	56(%r15), %ecx
	addq	%r12, %rax
	vpinsrq	$1, %rax, %xmm7, %xmm0
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L5596
	.p2align 4
	.p2align 3
.L5594:
	leaq	1(%rcx), %rdx
	movq	%rdx, 192(%r15)
	movzbl	(%rcx), %ecx
.L5596:
	cmpb	$71, %cl
	jne	.L5585
	cmpq	%rax, %rdx
	jb	.L5597
	movl	48(%r15), %eax
	testl	%eax, %eax
	je	.L5585
	leaq	56(%r15), %r12
	movl	52(%r15), %edx
	movq	40(%r15), %rdi
	movq	%r12, %rsi
	call	*16(%r15)
	movq	192(%r15), %rdx
	leaq	57(%r15), %rcx
	subq	208(%r15), %rdx
	addl	%edx, 184(%r15)
	testl	%eax, %eax
	je	.L5598
	cltq
	vmovq	%rcx, %xmm5
	movzbl	56(%r15), %edx
	addq	%r12, %rax
	vpinsrq	$1, %rax, %xmm5, %xmm0
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L5599
	.p2align 4
	.p2align 3
.L5597:
	leaq	1(%rdx), %rcx
	movq	%rcx, 192(%r15)
	movzbl	(%rdx), %edx
.L5599:
	cmpb	$13, %dl
	jne	.L5585
	cmpq	%rax, %rcx
	jb	.L5600
	movl	48(%r15), %r14d
	testl	%r14d, %r14d
	je	.L5585
	leaq	56(%r15), %r12
	movl	52(%r15), %edx
	movq	40(%r15), %rdi
	movq	%r12, %rsi
	call	*16(%r15)
	movq	192(%r15), %rdx
	subq	208(%r15), %rdx
	addl	%edx, 184(%r15)
	leaq	57(%r15), %rdx
	testl	%eax, %eax
	je	.L5601
	cltq
	vmovq	%rdx, %xmm4
	movzbl	56(%r15), %ecx
	addq	%r12, %rax
	vpinsrq	$1, %rax, %xmm4, %xmm0
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L5602
	.p2align 4
	.p2align 3
.L5600:
	leaq	1(%rcx), %rdx
	movq	%rdx, 192(%r15)
	movzbl	(%rcx), %ecx
.L5602:
	cmpb	$10, %cl
	jne	.L5585
	cmpq	%rax, %rdx
	jb	.L5603
	movl	48(%r15), %r13d
	testl	%r13d, %r13d
	je	.L5585
	leaq	56(%r15), %r12
	movl	52(%r15), %edx
	movq	40(%r15), %rdi
	movq	%r12, %rsi
	call	*16(%r15)
	movq	192(%r15), %rdx
	leaq	57(%r15), %rcx
	subq	208(%r15), %rdx
	addl	%edx, 184(%r15)
	testl	%eax, %eax
	jne	.L6449
	vmovq	%rcx, %xmm6
	vpunpcklqdq	%xmm6, %xmm6, %xmm0
	movl	$0, 48(%r15)
	movb	$0, 56(%r15)
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L5585
	.p2align 4
	.p2align 3
.L5603:
	leaq	1(%rdx), %rcx
	movq	%rcx, 192(%r15)
	movzbl	(%rdx), %edx
.L5605:
	cmpb	$26, %dl
	jne	.L5585
	cmpq	%rax, %rcx
	jb	.L6450
	movl	48(%r15), %r12d
	testl	%r12d, %r12d
	je	.L5585
	leaq	56(%r15), %r12
	movl	52(%r15), %edx
	movq	40(%r15), %rdi
	movq	%r12, %rsi
	call	*16(%r15)
	movq	192(%r15), %rdx
	subq	208(%r15), %rdx
	addl	%edx, 184(%r15)
	leaq	57(%r15), %rdx
	testl	%eax, %eax
	jne	.L5608
	movl	$0, 48(%r15)
	movb	$0, 56(%r15)
	movq	%rdx, 200(%r15)
	jmp	.L5585
	.p2align 4
	.p2align 3
.L6450:
	leaq	1(%rcx), %rax
	movq	%rax, 192(%r15)
	movzbl	(%rcx), %edx
.L5607:
	cmpb	$10, %dl
	jne	.L5585
	vmovdqu	208(%r15), %xmm7
	cmpl	$4, 136(%rsp)
	movq	%r15, 144(%rsp)
	vmovdqu	%xmm7, 192(%r15)
	ja	.L6451
	movl	136(%rsp), %edx
	xorl	%esi, %esi
	leaq	144(%rsp), %rdi
	call	stbi__parse_png_file
	testl	%eax, %eax
	je	.L6059
	movl	176(%rsp), %edx
	cmpl	$8, %edx
	jle	.L6060
	cmpl	$16, %edx
	jne	.L6452
.L5615:
	movq	168(%rsp), %rax
	movl	136(%rsp), %ebx
	movl	%edx, 0(%rbp)
	xorl	%edi, %edi
	movq	$0, 168(%rsp)
	movq	%rax, (%rsp)
	movq	144(%rsp), %rax
	movl	(%rax), %ecx
	testl	%ebx, %ebx
	je	.L5616
	movl	12(%rax), %esi
	cmpl	%esi, %ebx
	je	.L5616
	cmpl	$8, %edx
	movl	4(%rax), %r8d
	movq	(%rsp), %rdi
	movl	%ebx, %edx
	je	.L6453
	call	stbi__convert_format16
	movq	%rax, (%rsp)
.L5618:
	cmpq	$0, (%rsp)
	movq	144(%rsp), %rax
	movl	136(%rsp), %esi
	movl	%esi, 12(%rax)
	je	.L5583
	movq	168(%rsp), %rdi
.L5616:
	movl	(%rax), %edx
	movq	24(%rsp), %rsi
	movl	%edx, (%rsi)
	movq	32(%rsp), %rsi
	movl	4(%rax), %edx
	movl	%edx, (%rsi)
	movq	16(%rsp), %rsi
	testq	%rsi, %rsi
	je	.L5614
	movl	8(%rax), %eax
	movl	%eax, (%rsi)
	jmp	.L5614
.L6059:
	movq	168(%rsp), %rdi
	movq	$0, (%rsp)
.L5614:
	call	free@PLT
	movq	160(%rsp), %rdi
	call	free@PLT
	movq	152(%rsp), %rdi
	call	free@PLT
.L5583:
	movq	424(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L6439
	movq	(%rsp), %rax
	addq	$440, %rsp
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
.L5636:
	.cfi_restore_state
	leaq	1(%rdx), %rcx
	movq	%rcx, 192(%r15)
	movzbl	(%rdx), %edx
.L5639:
	cmpb	$83, %dl
	jne	.L5637
	cmpq	%rax, %rcx
	jb	.L5640
	movl	48(%r15), %r9d
	testl	%r9d, %r9d
	je	.L5637
	leaq	56(%r15), %rbx
	movl	52(%r15), %edx
	movq	40(%r15), %rdi
	movq	%rbx, %rsi
	call	*16(%r15)
	movq	192(%r15), %rdx
	subq	208(%r15), %rdx
	addl	%edx, 184(%r15)
	leaq	57(%r15), %rdx
	testl	%eax, %eax
	je	.L5641
	cltq
	vmovq	%rdx, %xmm6
	movzbl	56(%r15), %ecx
	addq	%rbx, %rax
	vpinsrq	$1, %rax, %xmm6, %xmm0
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L5642
.L6448:
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
	je	.L5626
	cmpl	$40, %eax
	je	.L5626
	movq	208(%r15), %rdx
	movq	216(%r15), %rcx
	movq	%rdx, 192(%r15)
	cmpl	$56, %eax
	je	.L5630
	cmpl	$108, %eax
	je	.L5630
	cmpl	$124, %eax
	jne	.L5629
.L5630:
	movq	%rcx, 200(%r15)
	movq	424(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L6439
	movl	136(%rsp), %r8d
	movq	16(%rsp), %rcx
	movq	%r15, %rdi
	movq	32(%rsp), %rdx
	movq	24(%rsp), %rsi
	addq	$440, %rsp
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
	jmp	stbi__bmp_load.constprop.0
.L5860:
	.cfi_restore_state
	vmovdqu	208(%r15), %xmm7
	movq	%r15, %rdi
	vmovdqu	%xmm7, 192(%r15)
	call	stbi__hdr_test
	movl	%eax, 96(%rsp)
	testl	%eax, %eax
	jne	.L6454
	movq	%r15, %rdi
	call	stbi__get8
	movq	%r15, %rdi
	call	stbi__get8
	movzbl	%al, %ebp
	movl	%ebp, %ebx
	cmpl	$1, %ebp
	jle	.L6455
.L5888:
	movq	208(%r15), %rax
	movq	%rax, 192(%r15)
	movq	216(%r15), %rax
.L5899:
	movq	%rax, 200(%r15)
	leaq	.LC225(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	movq	$0, (%rsp)
	jmp	.L5583
	.p2align 4
	.p2align 3
.L6443:
	movq	424(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L6439
	movl	136(%rsp), %r8d
	movq	16(%rsp), %rcx
	movq	%r15, %rdi
	movq	32(%rsp), %rdx
	movq	24(%rsp), %rsi
	addq	$440, %rsp
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
	jmp	stbi__gif_load.constprop.0
	.p2align 4
	.p2align 3
.L6440:
	.cfi_restore_state
	leaq	56(%rdi), %r12
	movl	52(%rdi), %edx
	movq	40(%rdi), %rdi
	movq	%r12, %rsi
	call	*16(%r15)
	movq	192(%r15), %rdx
	leaq	57(%r15), %rcx
	subq	208(%r15), %rdx
	addl	%edx, 184(%r15)
	testl	%eax, %eax
	je	.L5586
	cltq
	vmovq	%rcx, %xmm4
	movzbl	56(%r15), %edx
	addq	%r12, %rax
	vpinsrq	$1, %rax, %xmm4, %xmm0
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L5587
.L6442:
	leaq	56(%r15), %r12
	movl	52(%r15), %edx
	movq	40(%r15), %rdi
	movq	%r12, %rsi
	call	*16(%r15)
	movq	208(%r15), %rdx
	leaq	57(%r15), %rsi
	movq	192(%r15), %rcx
	subq	%rdx, %rcx
	addl	%ecx, 184(%r15)
	testl	%eax, %eax
	jne	.L5622
	vmovq	%rsi, %xmm3
	vpunpcklqdq	%xmm3, %xmm3, %xmm0
	movl	$0, 48(%r15)
	movb	$0, 56(%r15)
	vmovdqu	%xmm0, 192(%r15)
.L5623:
	movq	216(%r15), %rcx
	jmp	.L5621
	.p2align 4
	.p2align 3
.L6451:
	leaq	.LC241(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	movq	$0, (%rsp)
	jmp	.L5583
.L6447:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%r13)
	movzbl	(%rax), %eax
.L5798:
	cmpb	$-1, %al
	je	.L5796
	vmovdqu	208(%r15), %xmm0
	cmpb	$-40, %al
	jne	.L5799
	vmovdqu	%xmm0, 192(%r15)
	movq	%r12, %rdi
	call	free@PLT
	movl	$18568, %edi
	call	malloc@PLT
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L6436
	vmovdqa	(%rsp), %xmm2
	cmpl	$4, 136(%rsp)
	movq	%r15, (%rax)
	movq	%rbx, 18560(%rax)
	movl	$0, 8(%r15)
	vmovdqu	%xmm2, 18544(%rax)
	ja	.L6456
	movq	%rax, %rdi
	call	stbi__decode_jpeg_image
	testl	%eax, %eax
	je	.L6457
	movq	0(%rbp), %r12
	movl	136(%rsp), %edx
	movl	8(%r12), %eax
	movl	%eax, 48(%rsp)
	testl	%edx, %edx
	jne	.L5811
	cmpl	$2, %eax
	jle	.L6081
	movl	$3, 136(%rsp)
.L5811:
	cmpl	$3, 48(%rsp)
	je	.L6458
.L5812:
	movl	48(%rsp), %eax
	movl	$0, 104(%rsp)
	movl	%eax, 40(%rsp)
	testl	%eax, %eax
	jle	.L6459
.L5813:
	movl	(%r12), %ebx
	vpxor	%xmm0, %xmm0, %xmm0
	leaq	224(%rsp), %rax
	leaq	18084(%rbp), %r15
	movq	%r12, (%rsp)
	movl	%r14d, %r13d
	movq	%rbp, %r12
	vmovdqa	%xmm0, 192(%rsp)
	vmovdqa	%xmm0, 208(%rsp)
	movq	%rax, 80(%rsp)
	movq	%rax, %rbp
	leal	3(%rbx), %esi
	movq	%rsi, %r14
	.p2align 4
	.p2align 3
.L5817:
	movq	%r14, %rdi
	call	malloc@PLT
	movq	%rax, 68(%r15)
	testq	%rax, %rax
	je	.L6460
	movl	18056(%r12), %eax
	movabsq	$4294967297, %rsi
	cltd
	idivl	(%r15)
	movl	%eax, %ecx
	movl	18060(%r12), %eax
	vmovd	%ecx, %xmm5
	cltd
	idivl	4(%r15)
	xorl	%edx, %edx
	movl	$0, 40(%rbp)
	movl	%eax, %edi
	leal	-1(%rbx,%rcx), %eax
	divl	%ecx
	movl	%edi, %edx
	vpinsrd	$1, %edi, %xmm5, %xmm0
	sarl	%edx
	vmovd	%eax, %xmm4
	vpinsrd	$1, %edx, %xmm4, %xmm1
	movslq	%r13d, %rax
	vpunpcklqdq	%xmm1, %xmm0, %xmm0
	leaq	(%rax,%rax,2), %rax
	vmovdqu	%xmm0, 24(%rbp)
	vmovddup	44(%r15), %xmm0
	salq	$4, %rax
	vmovdqu	%xmm0, 8(%rbp)
	movq	248(%rsp,%rax), %rdx
	leaq	resample_row_1(%rip), %rax
	cmpq	%rsi, %rdx
	je	.L5816
	movabsq	$8589934593, %rsi
	leaq	stbi__resample_row_v_2(%rip), %rax
	cmpq	%rsi, %rdx
	je	.L5816
	movabsq	$4294967298, %rcx
	leaq	stbi__resample_row_h_2(%rip), %rax
	cmpq	%rcx, %rdx
	je	.L5816
	movabsq	$8589934594, %rcx
	leaq	stbi__resample_row_generic(%rip), %rax
	cmpq	%rcx, %rdx
	jne	.L5816
	movq	18560(%r12), %rax
	.p2align 4
	.p2align 3
.L5816:
	movq	%rax, 0(%rbp)
	incl	%r13d
	addq	$96, %r15
	addq	$48, %rbp
	cmpl	40(%rsp), %r13d
	jne	.L5817
	movq	%r12, %rbp
	movq	(%rsp), %r12
	movl	4(%r12), %esi
	testl	%ebx, %ebx
	js	.L5818
	je	.L5819
	movl	$2147483647, %eax
	cltd
	idivl	%ebx
	cmpl	%eax, 136(%rsp)
	jg	.L5818
.L5819:
	testl	%esi, %esi
	js	.L5818
	movl	136(%rsp), %edi
	imull	%ebx, %edi
	testl	%esi, %esi
	je	.L5820
	movl	$2147483647, %eax
	cltd
	idivl	%esi
	cmpl	%eax, %edi
	jg	.L5818
	imull	%edi, %esi
	cmpl	$2147483647, %esi
	jne	.L6461
.L5818:
	movl	48(%rsp), %esi
	movq	%rbp, %rdi
	call	stbi__free_jpeg_components.constprop.0
	leaq	.LC16(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	movq	$0, (%rsp)
.L5803:
	movq	%rbp, %rdi
	call	free@PLT
	jmp	.L5583
.L6060:
	movl	$8, %edx
	jmp	.L5615
.L5640:
	leaq	1(%rcx), %rdx
	movq	%rdx, 192(%r15)
	movzbl	(%rcx), %ecx
.L5642:
	cmpb	$-128, %cl
	jne	.L5637
	cmpq	%rax, %rdx
	jb	.L5643
	movl	48(%r15), %r8d
	testl	%r8d, %r8d
	je	.L5637
	leaq	56(%r15), %rbx
	movl	52(%r15), %edx
	movq	40(%r15), %rdi
	movq	%rbx, %rsi
	call	*16(%r15)
	movq	192(%r15), %rdx
	leaq	57(%r15), %rcx
	subq	208(%r15), %rdx
	addl	%edx, 184(%r15)
	testl	%eax, %eax
	je	.L5644
	cltq
	vmovq	%rcx, %xmm2
	movzbl	56(%r15), %edx
	addq	%rbx, %rax
	vpinsrq	$1, %rax, %xmm2, %xmm0
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L5645
.L5643:
	leaq	1(%rdx), %rcx
	movq	%rcx, 192(%r15)
	movzbl	(%rdx), %edx
.L5645:
	cmpb	$-10, %dl
	jne	.L5637
	cmpq	%rax, %rcx
	jb	.L6462
	movl	48(%r15), %edi
	testl	%edi, %edi
	je	.L5637
	leaq	56(%r15), %rbx
	movl	52(%r15), %edx
	movq	40(%r15), %rdi
	movq	%rbx, %rsi
	call	*16(%r15)
	movq	192(%r15), %rdx
	subq	208(%r15), %rdx
	addl	%edx, 184(%r15)
	leaq	57(%r15), %rdx
	testl	%eax, %eax
	jne	.L5648
	vmovq	%rdx, %xmm5
	vpunpcklqdq	%xmm5, %xmm5, %xmm0
	movl	$0, 48(%r15)
	movb	$0, 56(%r15)
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L5637
.L5586:
	vmovq	%rcx, %xmm7
	vpunpcklqdq	%xmm7, %xmm7, %xmm0
	movl	$0, 48(%r15)
	movb	$0, 56(%r15)
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L5585
.L6462:
	leaq	1(%rcx), %rdx
	movq	%rdx, 192(%r15)
	movzbl	(%rcx), %ecx
.L5647:
	cmpb	$52, %cl
	jne	.L5637
	movl	$84, %r12d
	leaq	56(%r15), %rbx
	jmp	.L5653
	.p2align 4
	.p2align 3
.L5649:
	movl	48(%r15), %esi
	testl	%esi, %esi
	jne	.L6463
.L5650:
	decl	%r12d
	je	.L6464
.L5653:
	cmpq	%rdx, %rax
	jbe	.L5649
	incq	%rdx
	decl	%r12d
	movq	%rdx, 192(%r15)
	jne	.L5653
.L6464:
	cmpq	%rdx, %rax
	ja	.L5654
	movl	48(%r15), %ecx
	testl	%ecx, %ecx
	je	.L5637
	leaq	56(%r15), %rbx
	movl	52(%r15), %edx
	movq	40(%r15), %rdi
	movq	%rbx, %rsi
	call	*16(%r15)
	movslq	%eax, %rdx
	movq	192(%r15), %rax
	subq	208(%r15), %rax
	addl	%eax, 184(%r15)
	leaq	57(%r15), %rax
	vmovq	%rax, %xmm0
	testl	%edx, %edx
	je	.L5662
	addq	%rdx, %rbx
	movzbl	56(%r15), %eax
	vpinsrq	$1, %rbx, %xmm0, %xmm0
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L5657
	.p2align 4
	.p2align 3
.L6463:
	movl	52(%r15), %edx
	movq	40(%r15), %rdi
	movq	%rbx, %rsi
	call	*16(%r15)
	movq	192(%r15), %rdx
	subq	208(%r15), %rdx
	addl	%edx, 184(%r15)
	leaq	57(%r15), %rdx
	testl	%eax, %eax
	jne	.L5651
	movl	$0, 48(%r15)
	movq	%rdx, %rax
	movb	$0, 56(%r15)
.L5652:
	vmovq	%rdx, %xmm2
	vpinsrq	$1, %rax, %xmm2, %xmm0
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L5650
	.p2align 4
	.p2align 3
.L5651:
	cltq
	addq	%rbx, %rax
	jmp	.L5652
.L5589:
	vmovq	%rdx, %xmm5
	vpunpcklqdq	%xmm5, %xmm5, %xmm0
	movl	$0, 48(%r15)
	movb	$0, 56(%r15)
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L5585
.L6444:
	movq	424(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L6439
	movl	%ebx, 496(%rsp)
	movl	136(%rsp), %r8d
	movq	16(%rsp), %rcx
	movq	%rbp, %r9
	movq	32(%rsp), %rdx
	movq	%r15, %rdi
	movq	24(%rsp), %rsi
	addq	$440, %rsp
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
	jmp	stbi__psd_load
.L5592:
	.cfi_restore_state
	vmovq	%rcx, %xmm4
	vpunpcklqdq	%xmm4, %xmm4, %xmm0
	movl	$0, 48(%r15)
	movb	$0, 56(%r15)
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L5585
.L5595:
	vmovq	%rdx, %xmm2
	vpunpcklqdq	%xmm2, %xmm2, %xmm0
	movl	$0, 48(%r15)
	movb	$0, 56(%r15)
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L5585
.L5598:
	vmovq	%rcx, %xmm3
	vpunpcklqdq	%xmm3, %xmm3, %xmm0
	movl	$0, 48(%r15)
	movb	$0, 56(%r15)
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L5585
.L5601:
	vmovq	%rdx, %xmm7
	vpunpcklqdq	%xmm7, %xmm7, %xmm0
	movl	$0, 48(%r15)
	movb	$0, 56(%r15)
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L5585
.L5654:
	leaq	1(%rdx), %rax
	movq	%rax, 192(%r15)
	movzbl	(%rdx), %eax
.L5657:
	cmpb	$80, %al
	jne	.L5637
	movq	192(%r15), %rax
	cmpq	200(%r15), %rax
	jb	.L5658
	movl	48(%r15), %edx
	testl	%edx, %edx
	je	.L5637
	leaq	56(%r15), %rbx
	movl	52(%r15), %edx
	movq	40(%r15), %rdi
	movq	%rbx, %rsi
	call	*16(%r15)
	movslq	%eax, %rdx
	movq	192(%r15), %rax
	subq	208(%r15), %rax
	addl	%eax, 184(%r15)
	leaq	57(%r15), %rax
	vmovq	%rax, %xmm0
	testl	%edx, %edx
	je	.L5662
	movzbl	56(%r15), %eax
	addq	%rdx, %rbx
	vpinsrq	$1, %rbx, %xmm0, %xmm0
	vmovdqu	%xmm0, 192(%r15)
.L5660:
	cmpb	$73, %al
	jne	.L5637
	movq	192(%r15), %rax
	cmpq	%rax, 200(%r15)
	ja	.L5661
	movl	48(%r15), %eax
	testl	%eax, %eax
	je	.L5637
	leaq	56(%r15), %rbx
	movl	52(%r15), %edx
	movq	40(%r15), %rdi
	movq	%rbx, %rsi
	call	*16(%r15)
	movslq	%eax, %rdx
	movq	192(%r15), %rax
	subq	208(%r15), %rax
	addl	%eax, 184(%r15)
	leaq	57(%r15), %rax
	vmovq	%rax, %xmm0
	testl	%edx, %edx
	je	.L5662
	movzbl	56(%r15), %eax
	addq	%rdx, %rbx
	vpinsrq	$1, %rbx, %xmm0, %xmm0
	vmovdqu	%xmm0, 192(%r15)
.L5663:
	cmpb	$67, %al
	jne	.L5637
	movq	192(%r15), %rax
	cmpq	200(%r15), %rax
	jb	.L6465
	movl	48(%r15), %eax
	testl	%eax, %eax
	je	.L5637
	leaq	56(%r15), %rbx
	movl	52(%r15), %edx
	movq	40(%r15), %rdi
	movq	%rbx, %rsi
	call	*16(%r15)
	movslq	%eax, %rdx
	movq	192(%r15), %rax
	subq	208(%r15), %rax
	addl	%eax, 184(%r15)
	testl	%edx, %edx
	jne	.L5666
	movl	$0, 48(%r15)
	movb	$0, 56(%r15)
	jmp	.L5637
.L6449:
	cltq
	vmovq	%rcx, %xmm5
	movzbl	56(%r15), %edx
	addq	%r12, %rax
	vpinsrq	$1, %rax, %xmm5, %xmm0
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L5605
.L5622:
	cltq
	vmovq	%rsi, %xmm4
	movzbl	56(%r15), %ecx
	addq	%rax, %r12
	vpinsrq	$1, %r12, %xmm4, %xmm0
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L5620
.L5608:
	cltq
	movzbl	56(%r15), %edx
	addq	%rax, %r12
	movq	%r12, 200(%r15)
	jmp	.L5607
.L6454:
	movl	136(%rsp), %ebx
	movq	16(%rsp), %rbp
	movq	%r15, %rdi
	movq	32(%rsp), %rdx
	movq	24(%rsp), %rsi
	movl	%ebx, %r8d
	movq	%rbp, %rcx
	call	stbi__hdr_load.constprop.0
	movq	%rax, 48(%rsp)
	testl	%ebx, %ebx
	jne	.L5873
	movl	0(%rbp), %eax
	movl	%eax, 136(%rsp)
.L5873:
	movq	32(%rsp), %rax
	cmpq	$0, 48(%rsp)
	movl	(%rax), %ecx
	movq	24(%rsp), %rax
	movl	(%rax), %esi
	je	.L6437
	movl	%ecx, %eax
	orl	%esi, %eax
	js	.L5877
	testl	%ecx, %ecx
	je	.L5876
	movl	$2147483647, %eax
	cltd
	idivl	%ecx
	cmpl	%eax, %esi
	jg	.L5877
.L5876:
	movl	136(%rsp), %ebx
	testl	%ebx, %ebx
	js	.L5877
	imull	%esi, %ecx
	movl	%ecx, 56(%rsp)
	testl	%ebx, %ebx
	je	.L5878
	movl	$2147483647, %eax
	cltd
	idivl	%ebx
	cmpl	%eax, %ecx
	jg	.L5877
	movl	%ebx, %edi
	imull	%ecx, %edi
	movslq	%edi, %rdi
	call	malloc@PLT
	movq	%rax, (%rsp)
	testq	%rax, %rax
	je	.L5877
	movl	%ebx, 40(%rsp)
	andl	$1, %ebx
	je	.L6044
.L5879:
	movl	56(%rsp), %ebp
	testl	%ebp, %ebp
	je	.L5880
	movl	40(%rsp), %esi
	xorl	%eax, %eax
	testl	%esi, %esi
	cmovns	%esi, %eax
	xorl	%r15d, %r15d
	movl	%eax, 64(%rsp)
	.p2align 4
	.p2align 3
.L5881:
	movl	40(%rsp), %ebx
	testl	%ebx, %ebx
	jle	.L5887
	movq	48(%rsp), %rax
	vmovss	stbi__h2l_scale_i(%rip), %xmm3
	movslq	%r15d, %rdx
	vxorpd	%xmm5, %xmm5, %xmm5
	movslq	40(%rsp), %r12
	vcvtss2sd	stbi__h2l_gamma_i(%rip), %xmm5, %xmm1
	vxorps	%xmm5, %xmm5, %xmm5
	xorl	%r13d, %r13d
	vmovss	%xmm5, 32(%rsp)
	leaq	(%rax,%rdx,4), %rbp
	movq	(%rsp), %rax
	vmovss	%xmm3, 24(%rsp)
	leaq	(%rax,%rdx), %rbx
	.p2align 4
	.p2align 3
.L5883:
	vmovss	24(%rsp), %xmm3
	vmovsd	%xmm1, 16(%rsp)
	vmulss	0(%rbp,%r13,4), %xmm3, %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	call	pow@PLT
	vmovss	.LC124(%rip), %xmm4
	xorl	%eax, %eax
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	vfmadd132ss	.LC131(%rip), %xmm4, %xmm0
	vmovss	32(%rsp), %xmm5
	vmovsd	16(%rsp), %xmm1
	vcomiss	%xmm0, %xmm5
	ja	.L5882
	vcomiss	.LC131(%rip), %xmm0
	movl	$-1, %eax
	jbe	.L6466
.L5882:
	movb	%al, (%rbx,%r13)
	incq	%r13
	cmpq	%r13, %r12
	jne	.L5883
.L5887:
	movl	64(%rsp), %eax
	cmpl	%eax, 136(%rsp)
	jle	.L5884
	movq	48(%rsp), %rsi
	addl	%r15d, %eax
	vmovss	.LC124(%rip), %xmm4
	vxorps	%xmm6, %xmm6, %xmm6
	cltq
	xorl	%edx, %edx
	vmovss	(%rsi,%rax,4), %xmm0
	vfmadd132ss	.LC131(%rip), %xmm4, %xmm0
	vcomiss	%xmm0, %xmm6
	ja	.L5885
	vcomiss	.LC131(%rip), %xmm0
	movl	$-1, %edx
	jbe	.L6467
.L5885:
	movq	(%rsp), %rsi
	movb	%dl, (%rsi,%rax)
.L5884:
	addl	136(%rsp), %r15d
	incl	%r14d
	cmpl	56(%rsp), %r14d
	jne	.L5881
.L5880:
	movq	48(%rsp), %rdi
	call	free@PLT
	jmp	.L5583
.L5626:
	movq	208(%r15), %rax
	movq	216(%r15), %rcx
	movq	%rax, 192(%r15)
	jmp	.L5630
.L6456:
	leaq	.LC241(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	movq	$0, (%rsp)
	jmp	.L5803
.L6466:
	vcvttss2sil	%xmm0, %eax
	jmp	.L5882
.L5928:
	leaq	.LC93(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	movq	$0, (%rsp)
	jmp	.L5583
.L5658:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%r15)
	movzbl	(%rax), %eax
	jmp	.L5660
.L5661:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%r15)
	movzbl	(%rax), %eax
	jmp	.L5663
.L6465:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%r15)
	movzbl	(%rax), %eax
.L5665:
	cmpb	$84, %al
	jne	.L5637
	movq	16(%rsp), %rsi
	leaq	144(%rsp), %rdx
	movq	208(%r15), %rax
	movl	$92, %ebp
	leaq	56(%r15), %rbx
	testq	%rsi, %rsi
	movq	%rax, 192(%r15)
	movq	%rax, %rcx
	cmovne	%rsi, %rdx
	movq	%rdx, 16(%rsp)
	movq	216(%r15), %rdx
	movq	%rdx, 200(%r15)
	jmp	.L5672
	.p2align 4
	.p2align 3
.L5668:
	movl	48(%r15), %eax
	testl	%eax, %eax
	jne	.L6468
.L5669:
	decl	%ebp
	je	.L6469
.L5672:
	cmpq	%rcx, %rdx
	jbe	.L5668
	incq	%rcx
	movq	%rcx, 192(%r15)
	jmp	.L5669
	.p2align 4
	.p2align 3
.L6468:
	movl	52(%r15), %edx
	movq	40(%r15), %rdi
	movq	%rbx, %rsi
	call	*16(%r15)
	movq	192(%r15), %rdx
	leaq	57(%r15), %rcx
	subq	208(%r15), %rdx
	addl	%edx, 184(%r15)
	testl	%eax, %eax
	jne	.L5670
	movl	$0, 48(%r15)
	movq	%rcx, %rdx
	movb	$0, 56(%r15)
.L5671:
	vmovq	%rcx, %xmm6
	vpinsrq	$1, %rdx, %xmm6, %xmm0
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L5669
	.p2align 4
	.p2align 3
.L5670:
	cltq
	leaq	(%rbx,%rax), %rdx
	jmp	.L5671
.L6469:
	movq	%r15, %rdi
	call	stbi__get16be
	movq	%r15, %rdi
	movl	%eax, 40(%rsp)
	call	stbi__get16be
	movl	%eax, 48(%rsp)
	cmpl	$16777216, %eax
	jg	.L5928
	cmpl	$16777216, 40(%rsp)
	jg	.L5928
	cmpq	$0, 16(%r15)
	je	.L5679
	movq	40(%r15), %rdi
	call	*32(%r15)
	testl	%eax, %eax
	je	.L5678
	movl	48(%r15), %eax
	testl	%eax, %eax
	je	.L5677
.L5679:
	movq	200(%r15), %rax
	cmpq	%rax, 192(%r15)
	jnb	.L5677
.L5678:
	movl	40(%rsp), %ebx
	movl	48(%rsp), %esi
	movl	%ebx, %eax
	orl	%esi, %eax
	js	.L5928
	testl	%esi, %esi
	je	.L5680
	movl	$2147483647, %eax
	cltd
	idivl	%esi
	cmpl	%eax, %ebx
	jg	.L5928
	imull	48(%rsp), %ebx
	cmpl	$536870911, %ebx
	jg	.L5928
	movq	%r15, %rdi
	call	stbi__get32be
	movq	%r15, %rdi
	call	stbi__get16be
	movq	%r15, %rdi
	call	stbi__get16be
.L6048:
	sall	$2, %ebx
	movslq	%ebx, %r12
	movq	%r12, %rdi
	call	malloc@PLT
	movq	%rax, (%rsp)
	testq	%rax, %rax
	je	.L6435
	movq	%r12, %rdx
	movq	%rax, %rdi
	movl	$255, %esi
	xorl	%r13d, %r13d
	call	memset@PLT
	leaq	56(%r15), %r12
	leaq	57(%r15), %rax
	leaq	225(%rsp), %rbx
	movl	%r13d, %ebp
	movl	%r14d, 80(%rsp)
	movl	$0, 72(%rsp)
	movq	%r15, %r14
	movq	%rax, 56(%rsp)
	movq	%rbx, %r15
	movq	%r12, %r13
.L5683:
	movq	200(%r14), %rax
	movl	%ebp, 64(%rsp)
	incl	%ebp
	movq	192(%r14), %rdx
	movq	16(%r14), %r10
	movq	%rax, %rsi
	cmpq	%rax, %rdx
	jb	.L6470
	movl	48(%r14), %eax
	xorl	%r12d, %r12d
	testl	%eax, %eax
	jne	.L6471
.L5687:
	xorl	%ebx, %ebx
.L5697:
	movq	%rsi, %rax
	xorl	%esi, %esi
.L5698:
	movb	%sil, (%r15)
	cmpq	%rdx, %rax
	ja	.L6472
	movl	48(%r14), %r9d
	testl	%r9d, %r9d
	jne	.L6473
	cmpq	$0, 16(%r14)
	movb	$0, 1(%r15)
	je	.L6429
.L6056:
	movq	40(%r14), %rdi
	call	*32(%r14)
	testl	%eax, %eax
	je	.L5707
	movl	48(%r14), %r8d
	testl	%r8d, %r8d
	je	.L6429
	movq	192(%r14), %rsi
	movq	200(%r14), %rax
.L5706:
	cmpq	%rsi, %rax
	jbe	.L6429
.L5707:
	cmpb	$8, %bl
	jne	.L6409
	testb	%r12b, %r12b
	je	.L6474
	addq	$3, %r15
	cmpl	$10, %ebp
	jne	.L5683
.L6409:
	leaq	.LC243(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
.L5684:
	movq	(%rsp), %rdi
	call	free@PLT
	movq	$0, (%rsp)
.L6045:
	movq	24(%rsp), %rax
	movl	40(%rsp), %esi
	movl	%esi, (%rax)
	movl	48(%rsp), %esi
	movq	32(%rsp), %rax
	movl	%esi, (%rax)
	movl	136(%rsp), %esi
	testl	%esi, %esi
	jne	.L5793
	movq	16(%rsp), %rax
	movl	(%rax), %eax
	movl	%eax, 136(%rsp)
.L5793:
	movl	48(%rsp), %r8d
	movl	$4, %esi
	movl	40(%rsp), %ecx
	movl	136(%rsp), %edx
	movq	(%rsp), %rdi
	call	stbi__convert_format
	movq	%rax, (%rsp)
	jmp	.L5583
.L6471:
	movl	52(%r14), %edx
	movq	40(%r14), %rdi
	movq	%r13, %rsi
	call	*%r10
	movq	192(%r14), %rdx
	subq	208(%r14), %rdx
	movq	56(%rsp), %rdi
	addl	%edx, 184(%r14)
	testl	%eax, %eax
	jne	.L5688
	movl	$0, 48(%r14)
	movq	%rdi, %rax
	vmovq	%rdi, %xmm7
	movb	$0, 56(%r14)
.L5689:
	movq	16(%r14), %r10
	vpinsrq	$1, %rax, %xmm7, %xmm0
	vmovdqu	%xmm0, 192(%r14)
.L5686:
	cmpq	%rdi, %rax
	jbe	.L6475
	leaq	1(%rdi), %rsi
	movq	%rsi, 192(%r14)
	movzbl	(%rdi), %ebx
.L5692:
	cmpq	%rsi, %rax
	jbe	.L6476
	leaq	1(%rsi), %rdx
	movq	%rdx, 192(%r14)
	movzbl	(%rsi), %esi
	jmp	.L5698
.L6411:
	leaq	56(%r13), %rsi
	movl	52(%r13), %edx
	movq	40(%r13), %rdi
	movq	%rsi, 40(%rsp)
	call	*16(%r13)
	movq	40(%rsp), %rsi
	leaq	57(%r13), %rdx
	movslq	%eax, %rcx
	movq	192(%r13), %rax
	subq	208(%r13), %rax
	addl	%eax, 184(%r13)
	testl	%ecx, %ecx
	jne	.L5800
	vmovq	%rdx, %xmm5
	vpunpcklqdq	%xmm5, %xmm5, %xmm0
	movb	$0, 56(%r13)
	movl	$0, 48(%r13)
	vmovdqu	%xmm0, 192(%r13)
	vmovdqu	208(%r15), %xmm0
	jmp	.L5799
.L6470:
	leaq	1(%rdx), %rdi
	movq	%rdi, 192(%r14)
	movzbl	(%rdx), %r12d
	jmp	.L5686
.L6472:
	leaq	1(%rdx), %rsi
	movq	%rsi, 192(%r14)
	movzbl	(%rdx), %edi
	orl	%edi, 72(%rsp)
	movl	%edi, %edx
.L5702:
	cmpq	$0, 16(%r14)
	movb	%dl, 1(%r15)
	je	.L5706
	jmp	.L6056
.L6445:
	leaq	56(%r15), %rbx
	movl	52(%r15), %edx
	movq	40(%r15), %rdi
	movq	%rbx, %rsi
	call	*16(%r15)
	movq	192(%r15), %rdx
	leaq	57(%r15), %rcx
	subq	208(%r15), %rdx
	addl	%edx, 184(%r15)
	testl	%eax, %eax
	je	.L5638
	cltq
	vmovq	%rcx, %xmm7
	movzbl	56(%r15), %edx
	addq	%rbx, %rax
	vpinsrq	$1, %rax, %xmm7, %xmm0
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L5639
.L5662:
	vpunpcklqdq	%xmm0, %xmm0, %xmm0
	movl	$0, 48(%r15)
	movb	$0, 56(%r15)
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L5637
.L6452:
	leaq	.LC242(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	movq	$0, (%rsp)
	jmp	.L5583
.L6455:
	movq	%r15, %rdi
	call	stbi__get8
	cmpl	$1, %ebp
	je	.L6477
	andl	$-10, %eax
	cmpb	$2, %al
	jne	.L5888
	movl	$9, %esi
	movq	%r15, %rdi
	call	stbi__skip.part.0
.L5892:
	movq	%r15, %rdi
	call	stbi__get16le
	testl	%eax, %eax
	jle	.L5888
	movq	%r15, %rdi
	call	stbi__get16le
	testl	%eax, %eax
	jle	.L5888
	movq	%r15, %rdi
	andl	$1, %ebx
	call	stbi__get8
	movl	%eax, %edx
	leal	-8(%rdx), %eax
	testb	$-9, %al
	setne	%al
	cmpb	$32, %dl
	ja	.L5895
	movabsq	$-4295000321, %rcx
	sarx	%rdx, %rcx, %rcx
	andl	$1, %ecx
	testb	%bl, %bl
	je	.L6116
	testb	%al, %al
	jne	.L5888
.L6116:
	vmovdqu	208(%r15), %xmm0
	movq	216(%r15), %rax
	vmovq	%xmm0, %rsi
	testb	%cl, %cl
	jne	.L6053
.L5898:
	vmovdqu	%xmm0, 192(%r15)
	cmpq	%rax, %rsi
	jb	.L6478
	movl	48(%r15), %r12d
	movb	$0, 72(%rsp)
	movl	%r12d, %ebx
	testl	%r12d, %r12d
	jne	.L6479
.L5902:
	movl	$0, 48(%rsp)
	testl	%ebx, %ebx
	jne	.L6480
.L5906:
	movq	%r15, %rdi
	call	stbi__get16le
	movq	%r15, %rdi
	movl	%eax, 104(%rsp)
	call	stbi__get16le
	movl	%eax, 88(%rsp)
	movq	192(%r15), %rax
	cmpq	200(%r15), %rax
	jb	.L6481
	movl	48(%r15), %r14d
	xorl	%r13d, %r13d
	testl	%r14d, %r14d
	jne	.L6482
.L5914:
	movq	%r15, %rdi
	call	stbi__get16le
	movq	%r15, %rdi
	call	stbi__get16le
	movq	%r15, %rdi
	call	stbi__get16le
	movq	%r15, %rdi
	movl	%eax, 56(%rsp)
	call	stbi__get16le
	movq	192(%r15), %rcx
	movl	%eax, 40(%rsp)
	movq	200(%r15), %rax
	cmpq	%rax, %rcx
	jb	.L6483
	movl	48(%r15), %eax
	xorl	%ebp, %ebp
	xorl	%ecx, %ecx
	movl	%eax, 80(%rsp)
	testl	%eax, %eax
	jne	.L6484
.L5919:
	cmpl	$16777216, 40(%rsp)
	movl	$0, 420(%rsp)
	jg	.L5928
	cmpl	$16777216, 56(%rsp)
	jg	.L5928
	movl	$0, 64(%rsp)
	cmpl	$7, %ebx
	jle	.L5929
	subl	$8, %ebx
	movl	$1, 64(%rsp)
.L5929:
	movl	48(%rsp), %r10d
	testl	%r10d, %r10d
	je	.L5930
	cmpb	$16, %r13b
	ja	.L5931
	cmpb	$14, %r13b
	ja	.L6105
	xorl	%ebx, %ebx
	movl	$1, %r14d
	cmpb	$8, %r13b
	jne	.L5933
.L5932:
	movq	24(%rsp), %rax
	movl	56(%rsp), %esi
	movl	%esi, (%rax)
	movq	32(%rsp), %rax
	movl	40(%rsp), %esi
	movl	%esi, (%rax)
	movq	16(%rsp), %rax
	testq	%rax, %rax
	je	.L5939
	movl	%r14d, (%rax)
.L5939:
	movl	56(%rsp), %edi
	movl	40(%rsp), %esi
	movl	%edi, %eax
	orl	%esi, %eax
	js	.L5928
	testl	%esi, %esi
	je	.L5940
	movl	$2147483647, %r13d
	movl	%r13d, %eax
	cltd
	idivl	%esi
	cmpl	%eax, %edi
	jg	.L5928
	movl	%r13d, %eax
	movl	40(%rsp), %esi
	cltd
	idivl	%r14d
	imull	%edi, %esi
	movl	%esi, 32(%rsp)
	movl	%eax, %r13d
	cmpl	%esi, %eax
	jl	.L5928
.L6047:
	movl	32(%rsp), %edi
	movb	%cl, 16(%rsp)
	imull	%r14d, %edi
	movslq	%edi, %rdi
	call	malloc@PLT
	movzbl	16(%rsp), %ecx
	testq	%rax, %rax
	movq	%rax, (%rsp)
	je	.L6435
	testl	%r12d, %r12d
	je	.L5943
	cmpq	$0, 16(%r15)
	movq	192(%r15), %rax
	je	.L5944
	movq	200(%r15), %rsi
	movq	%rsi, %rdx
	subq	%rax, %rdx
	cmpl	%r12d, %edx
	jl	.L6485
.L5944:
	movzbl	72(%rsp), %edx
	addq	%rdx, %rax
	movq	%rax, 192(%r15)
.L5943:
	movl	%ecx, %eax
	movl	48(%rsp), %esi
	andl	$32, %eax
	orl	64(%rsp), %esi
	movb	%al, 120(%rsp)
	jne	.L5945
	testl	%ebx, %ebx
	jne	.L6109
	movl	40(%rsp), %r9d
	testl	%r9d, %r9d
	jle	.L5947
	movl	56(%rsp), %ebp
	imull	%r14d, %ebp
	testb	%al, %al
	je	.L5948
	movq	(%rsp), %r12
	movslq	%ebp, %r13
.L5949:
	movq	%r12, %rsi
	movl	%ebp, %edx
	movq	%r15, %rdi
	incl	%ebx
	call	stbi__getn
	addq	%r13, %r12
	cmpl	40(%rsp), %ebx
	jne	.L5949
.L5947:
	cmpl	$2, %r14d
	jle	.L6041
.L6040:
	movl	32(%rsp), %ecx
	movq	(%rsp), %rax
	movslq	%r14d, %rdx
	testl	%ecx, %ecx
	je	.L6041
	movl	96(%rsp), %ecx
.L6042:
	movzbl	(%rax), %esi
	movzbl	2(%rax), %edi
	incl	%ecx
	movb	%dil, (%rax)
	movb	%sil, 2(%rax)
	addq	%rdx, %rax
	cmpl	32(%rsp), %ecx
	jne	.L6042
.L6041:
	movl	136(%rsp), %eax
	testl	%eax, %eax
	je	.L5583
	cmpl	%r14d, %eax
	je	.L5583
	movl	40(%rsp), %r8d
	movl	56(%rsp), %ecx
	movl	%eax, %edx
	movl	%r14d, %esi
	movq	(%rsp), %rdi
	call	stbi__convert_format
	movq	%rax, (%rsp)
	jmp	.L5583
.L6461:
	incl	%esi
	movslq	%esi, %rdi
	call	malloc@PLT
	movq	%rax, (%rsp)
	testq	%rax, %rax
	je	.L5818
	leaq	192(%rsp), %rax
	movq	%rbp, 56(%rsp)
	movl	$0, 64(%rsp)
	movq	%rax, 88(%rsp)
	movl	$0, 48(%rsp)
	movl	40(%rsp), %eax
	decl	%eax
	leaq	200(%rsp,%rax,8), %rax
	movq	%rax, 40(%rsp)
	leaq	18112(%rbp), %rax
	movl	%ebx, %ebp
	movq	%rax, 96(%rsp)
	movslq	136(%rsp), %rax
	movq	%rax, 112(%rsp)
	.p2align 4
	.p2align 3
.L5853:
	imull	64(%rsp), %ebp
	movq	96(%rsp), %r15
	movq	88(%rsp), %r13
	movq	80(%rsp), %rbx
	addq	(%rsp), %rbp
	movq	%rbp, 72(%rsp)
.L5827:
	movl	28(%rbx), %ebp
	movq	16(%rbx), %r14
	movl	36(%rbx), %r12d
	movq	(%rbx), %rax
	movl	24(%rbx), %r8d
	movl	32(%rbx), %ecx
	movq	8(%rbx), %rsi
	movl	%ebp, %edi
	sarl	%edi
	movq	%r14, %rdx
	cmpl	%edi, %r12d
	jl	.L5823
	movq	%rsi, %rdx
	movq	%r14, %rsi
.L5823:
	movq	40(%r15), %rdi
	incl	%r12d
	call	*%rax
	movq	%rax, 0(%r13)
	cmpl	%r12d, %ebp
	jle	.L5824
	movl	%r12d, 36(%rbx)
.L5825:
	addq	$48, %rbx
	addq	$96, %r15
	addq	$8, %r13
	cmpq	%r13, 40(%rsp)
	jne	.L5827
	movq	56(%rsp), %rax
	cmpl	$2, 136(%rsp)
	movq	72(%rsp), %rbp
	movq	(%rax), %r12
	movl	(%r12), %r8d
	jle	.L5828
	movl	8(%r12), %eax
	movq	192(%rsp), %rsi
	cmpl	$3, %eax
	je	.L6486
	cmpl	$4, %eax
	jne	.L6487
	movq	56(%rsp), %rax
	movl	18508(%rax), %edx
	testl	%edx, %edx
	je	.L6488
	movq	200(%rsp), %r10
	cmpl	$2, %edx
	movq	18552(%rax), %rax
	movq	%rbp, %rdi
	movq	208(%rsp), %rcx
	movl	136(%rsp), %r9d
	movq	%r10, %rdx
	je	.L6489
	call	*%rax
	movq	56(%rsp), %rax
	movq	(%rax), %r12
	.p2align 4
	.p2align 3
.L5831:
	incl	48(%rsp)
	movl	136(%rsp), %ebx
	movl	48(%rsp), %eax
	addl	%ebx, 64(%rsp)
	cmpl	4(%r12), %eax
	jnb	.L6490
	movl	(%r12), %ebp
	jmp	.L5853
	.p2align 4
	.p2align 3
.L5824:
	movl	40(%rbx), %eax
	movl	$0, 36(%rbx)
	movq	%r14, 8(%rbx)
	incl	%eax
	movl	%eax, 40(%rbx)
	cmpl	(%r15), %eax
	jge	.L5825
	movslq	4(%r15), %rax
	leaq	(%r14,%rax), %r9
	movq	%r9, 16(%rbx)
	jmp	.L5825
.L5828:
	movl	104(%rsp), %r13d
	testl	%r13d, %r13d
	je	.L5840
	cmpl	$1, 136(%rsp)
	je	.L5841
	testl	%r8d, %r8d
	je	.L5831
	movq	208(%rsp), %r8
	movq	200(%rsp), %rdi
	xorl	%edx, %edx
	movq	192(%rsp), %rsi
	.p2align 4
	.p2align 3
.L5844:
	movl	%edx, %ecx
	movzbl	(%rsi,%rcx), %eax
	movzbl	(%rdi,%rcx), %r9d
	movzbl	(%r8,%rcx), %ecx
	movb	$-1, 1(%rbp,%rdx,2)
	imull	$77, %eax, %eax
	imull	$150, %r9d, %r9d
	imull	$29, %ecx, %ecx
	addl	%r9d, %eax
	addl	%ecx, %eax
	movb	%ah, 0(%rbp,%rdx,2)
	incq	%rdx
	cmpl	%edx, (%r12)
	ja	.L5844
	jmp	.L5831
.L5840:
	cmpl	$4, 8(%r12)
	je	.L6491
.L5845:
	cmpl	$1, 136(%rsp)
	movq	192(%rsp), %rcx
	je	.L5849
	xorl	%eax, %eax
	testl	%r8d, %r8d
	je	.L5831
	.p2align 4
	.p2align 3
.L5850:
	movl	%eax, %edx
	movzbl	(%rcx,%rdx), %edx
	movb	$-1, 1(%rbp,%rax,2)
	movb	%dl, 0(%rbp,%rax,2)
	incq	%rax
	cmpl	%eax, (%r12)
	ja	.L5850
.L6431:
	movq	56(%rsp), %rax
	movq	(%rax), %r12
	jmp	.L5831
.L6486:
	movl	104(%rsp), %r15d
	testl	%r15d, %r15d
	jne	.L6492
	movq	56(%rsp), %rbx
	movl	136(%rsp), %r9d
	movq	%rbp, %rdi
	movq	208(%rsp), %rcx
	movq	200(%rsp), %rdx
	call	*18552(%rbx)
	movq	(%rbx), %r12
	jmp	.L5831
.L6487:
	movq	112(%rsp), %rcx
	xorl	%eax, %eax
	testl	%r8d, %r8d
	je	.L5831
	.p2align 4
	.p2align 3
.L5839:
	movl	%eax, %edx
	incl	%eax
	movzbl	(%rsi,%rdx), %edx
	movb	$-1, 3(%rbp)
	movb	%dl, 2(%rbp)
	movb	%dl, 1(%rbp)
	movb	%dl, 0(%rbp)
	addq	%rcx, %rbp
	cmpl	(%r12), %eax
	jb	.L5839
	jmp	.L6431
.L6490:
	movl	8(%r12), %eax
	movq	56(%rsp), %rbp
	movl	%eax, 48(%rsp)
.L5822:
	movl	48(%rsp), %eax
	testl	%eax, %eax
	jle	.L5854
	decl	%eax
	leaq	18128(%rbp), %r12
	leaq	(%rax,%rax,2), %rax
	salq	$5, %rax
	leaq	18224(%rbp,%rax), %rbx
.L5858:
	movq	8(%r12), %rdi
	testq	%rdi, %rdi
	je	.L5855
	call	free@PLT
	vpxor	%xmm4, %xmm4, %xmm4
	vmovdqu	%xmm4, (%r12)
.L5855:
	movq	16(%r12), %rdi
	testq	%rdi, %rdi
	je	.L5856
	call	free@PLT
	movq	$0, 16(%r12)
	movq	$0, 32(%r12)
.L5856:
	movq	24(%r12), %rdi
	testq	%rdi, %rdi
	je	.L5857
	call	free@PLT
	movq	$0, 24(%r12)
.L5857:
	addq	$96, %r12
	cmpq	%r12, %rbx
	jne	.L5858
	movq	0(%rbp), %r12
.L5854:
	movl	(%r12), %eax
	movq	24(%rsp), %rsi
	movl	%eax, (%rsi)
	movq	32(%rsp), %rsi
	movl	4(%r12), %eax
	movl	%eax, (%rsi)
	movq	16(%rsp), %rsi
	testq	%rsi, %rsi
	je	.L5803
	xorl	%eax, %eax
	cmpl	$2, 8(%r12)
	setg	%al
	leal	1(%rax,%rax), %eax
	movl	%eax, (%rsi)
	jmp	.L5803
.L6491:
	movl	18508(%rax), %eax
	testl	%eax, %eax
	je	.L6493
	cmpl	$2, %eax
	jne	.L5845
	testl	%r8d, %r8d
	je	.L5831
	movq	216(%rsp), %rsi
	movq	192(%rsp), %rcx
	xorl	%edx, %edx
.L5848:
	movl	%edx, %edi
	incl	%edx
	movzbl	(%rcx,%rdi), %eax
	movzbl	(%rsi,%rdi), %edi
	movb	$-1, 1(%rbp)
	notl	%eax
	movzbl	%al, %eax
	imull	%edi, %eax
	subl	$-128, %eax
	movl	%eax, %edi
	shrl	$8, %edi
	addl	%edi, %eax
	movb	%ah, 0(%rbp)
	addq	112(%rsp), %rbp
	cmpl	(%r12), %edx
	jb	.L5848
	jmp	.L6431
.L5841:
	testl	%r8d, %r8d
	je	.L5831
	movq	208(%rsp), %r8
	movq	200(%rsp), %rdi
	xorl	%edx, %edx
	movq	192(%rsp), %rsi
	.p2align 4
	.p2align 3
.L5843:
	movl	%edx, %ecx
	movzbl	(%rsi,%rcx), %eax
	movzbl	(%rdi,%rcx), %r9d
	movzbl	(%r8,%rcx), %ecx
	imull	$77, %eax, %eax
	imull	$150, %r9d, %r9d
	imull	$29, %ecx, %ecx
	addl	%r9d, %eax
	addl	%ecx, %eax
	movb	%ah, 0(%rbp,%rdx)
	incq	%rdx
	cmpl	%edx, (%r12)
	ja	.L5843
	jmp	.L5831
.L5849:
	testl	%r8d, %r8d
	je	.L5831
	xorl	%eax, %eax
	.p2align 4
	.p2align 3
.L5851:
	movl	%eax, %edx
	incl	%eax
	movzbl	(%rcx,%rdx), %esi
	movb	%sil, 0(%rbp,%rdx)
	cmpl	(%r12), %eax
	jb	.L5851
	jmp	.L6431
.L5800:
	addq	%rcx, %rsi
	vmovq	%rdx, %xmm6
	movzbl	56(%r13), %eax
	vpinsrq	$1, %rsi, %xmm6, %xmm0
	vmovdqu	%xmm0, 192(%r13)
	jmp	.L5798
.L5680:
	movq	%r15, %rdi
	xorl	%ebx, %ebx
	call	stbi__get32be
	movq	%r15, %rdi
	call	stbi__get16be
	movq	%r15, %rdi
	call	stbi__get16be
	jmp	.L6048
.L5638:
	vmovq	%rcx, %xmm5
	vpunpcklqdq	%xmm5, %xmm5, %xmm0
	movl	$0, 48(%r15)
	movb	$0, 56(%r15)
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L5637
.L6429:
	leaq	.LC113(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L5684
.L5878:
	xorl	%edi, %edi
	call	malloc@PLT
	movq	%rax, (%rsp)
	testq	%rax, %rax
	jne	.L6044
.L5877:
	movq	48(%rsp), %rdi
	call	free@PLT
.L6436:
	leaq	.LC16(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	movq	$0, (%rsp)
	jmp	.L5583
.L6453:
	call	stbi__convert_format
	movq	%rax, (%rsp)
	jmp	.L5618
.L5644:
	vmovq	%rcx, %xmm3
	vpunpcklqdq	%xmm3, %xmm3, %xmm0
	movl	$0, 48(%r15)
	movb	$0, 56(%r15)
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L5637
.L5641:
	vmovq	%rdx, %xmm7
	vpunpcklqdq	%xmm7, %xmm7, %xmm0
	movl	$0, 48(%r15)
	movb	$0, 56(%r15)
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L5637
.L5677:
	leaq	.LC113(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	movq	$0, (%rsp)
	jmp	.L5583
.L6488:
	testl	%r8d, %r8d
	je	.L5831
	movq	216(%rsp), %r10
	movq	200(%rsp), %r11
	xorl	%ecx, %ecx
	movq	208(%rsp), %r8
	movq	112(%rsp), %rdx
.L5836:
	movl	%ecx, %r9d
	incl	%ecx
	movzbl	(%r10,%r9), %edi
	movzbl	(%rsi,%r9), %eax
	imull	%edi, %eax
	subl	$-128, %eax
	movl	%eax, %ebx
	shrl	$8, %ebx
	addl	%ebx, %eax
	movb	%ah, 0(%rbp)
	movzbl	(%r11,%r9), %eax
	imull	%edi, %eax
	subl	$-128, %eax
	movl	%eax, %ebx
	shrl	$8, %ebx
	addl	%ebx, %eax
	movb	%ah, 1(%rbp)
	movzbl	(%r8,%r9), %eax
	movb	$-1, 3(%rbp)
	imull	%edi, %eax
	subl	$-128, %eax
	movl	%eax, %edi
	shrl	$8, %edi
	addl	%edi, %eax
	movb	%ah, 2(%rbp)
	addq	%rdx, %rbp
	cmpl	(%r12), %ecx
	jb	.L5836
	jmp	.L6431
.L5648:
	cltq
	vmovq	%rdx, %xmm6
	movzbl	56(%r15), %ecx
	addq	%rbx, %rax
	vpinsrq	$1, %rax, %xmm6, %xmm0
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L5647
.L6458:
	movl	18512(%rbp), %eax
	movl	$1, 104(%rsp)
	movl	%eax, 40(%rsp)
	cmpl	$3, %eax
	je	.L5813
	cmpq	$0, 18504(%rbp)
	movl	$3, 40(%rsp)
	je	.L5813
	xorl	%eax, %eax
	cmpl	$2, 136(%rsp)
	movl	$0, 104(%rsp)
	setg	%al
	leal	1(%rax,%rax), %eax
	movl	%eax, 40(%rsp)
	jmp	.L5813
.L6473:
	movl	52(%r14), %edx
	movq	%r13, %rsi
	movq	40(%r14), %rdi
	call	*%r10
	movq	192(%r14), %rdx
	subq	208(%r14), %rdx
	movq	56(%rsp), %rsi
	addl	%edx, 184(%r14)
	testl	%eax, %eax
	jne	.L5704
	movl	$0, 48(%r14)
	movq	%rsi, %rax
	xorl	%edx, %edx
	vmovq	%rsi, %xmm4
	movb	$0, 56(%r14)
.L5705:
	vpinsrq	$1, %rax, %xmm4, %xmm0
	vmovdqu	%xmm0, 192(%r14)
	jmp	.L5702
.L6492:
	testl	%r8d, %r8d
	je	.L5831
	movq	200(%rsp), %r8
	movq	208(%rsp), %rdi
	xorl	%eax, %eax
	movq	112(%rsp), %r9
.L5832:
	movl	%eax, %edx
	incl	%eax
	movzbl	(%rsi,%rdx), %ecx
	movb	%cl, 0(%rbp)
	movzbl	(%r8,%rdx), %ecx
	movb	%cl, 1(%rbp)
	movzbl	(%rdi,%rdx), %edx
	movb	$-1, 3(%rbp)
	movb	%dl, 2(%rbp)
	addq	%r9, %rbp
	cmpl	(%r12), %eax
	jb	.L5832
	jmp	.L6431
.L6476:
	movl	48(%r14), %r11d
	testl	%r11d, %r11d
	je	.L6494
	movl	52(%r14), %edx
	movq	40(%r14), %rdi
	movq	%r13, %rsi
	call	*%r10
	movq	192(%r14), %rdx
	subq	208(%r14), %rdx
	addl	%edx, 184(%r14)
	movq	56(%rsp), %rdx
	testl	%eax, %eax
	jne	.L5699
	movl	$0, 48(%r14)
	movq	%rdx, %rax
	xorl	%esi, %esi
	vmovq	%rdx, %xmm3
	movb	$0, 56(%r14)
.L5700:
	vpinsrq	$1, %rax, %xmm3, %xmm0
	movq	16(%r14), %r10
	vmovdqu	%xmm0, 192(%r14)
	jmp	.L5698
.L6475:
	movl	48(%r14), %ebx
	testl	%ebx, %ebx
	je	.L6495
	movl	52(%r14), %edx
	movq	%r13, %rsi
	movq	40(%r14), %rdi
	call	*%r10
	movq	192(%r14), %rdx
	subq	208(%r14), %rdx
	movq	56(%rsp), %rsi
	addl	%edx, 184(%r14)
	testl	%eax, %eax
	jne	.L5693
	movl	$0, 48(%r14)
	movq	%rsi, %rax
	xorl	%ebx, %ebx
	vmovq	%rsi, %xmm2
	movb	$0, 56(%r14)
.L5694:
	vpinsrq	$1, %rax, %xmm2, %xmm0
	movq	16(%r14), %r10
	vmovdqu	%xmm0, 192(%r14)
	jmp	.L5692
.L6044:
	movl	136(%rsp), %eax
	decl	%eax
	movl	%eax, 40(%rsp)
	jmp	.L5879
.L5956:
	movq	72(%rsp), %rsi
	movl	%r12d, %edx
	movq	%r15, %rdi
	call	stbi__getn
	testl	%eax, %eax
	jne	.L5946
	movq	(%rsp), %rdi
	call	free@PLT
	movq	72(%rsp), %rdi
	call	free@PLT
	leaq	.LC244(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
.L6437:
	movq	$0, (%rsp)
	jmp	.L5583
.L5666:
	addq	%rbx, %rdx
	movzbl	56(%r15), %eax
	movq	%rdx, 200(%r15)
	jmp	.L5665
.L6081:
	movl	$1, 136(%rsp)
	jmp	.L5812
.L5704:
	movzbl	56(%r14), %edi
	cltq
	orl	%edi, 72(%rsp)
	vmovq	%rsi, %xmm4
	addq	%r13, %rax
	movl	%edi, %edx
	jmp	.L5705
.L5699:
	cltq
	movzbl	56(%r14), %esi
	vmovq	%rdx, %xmm3
	addq	%r13, %rax
	jmp	.L5700
.L5693:
	cltq
	movzbl	56(%r14), %ebx
	vmovq	%rsi, %xmm2
	addq	%r13, %rax
	jmp	.L5694
.L6477:
	andl	$-9, %eax
	cmpb	$1, %al
	jne	.L5888
	movq	%r15, %rdi
	movl	$4, %esi
	call	stbi__skip.part.0
	movq	%r15, %rdi
	call	stbi__get8
	cmpb	$32, %al
	ja	.L5888
	movabsq	$-4311843073, %rdx
	btq	%rax, %rdx
	jc	.L5888
	movl	$4, %esi
	movq	%r15, %rdi
	call	stbi__skip.part.0
	jmp	.L5892
.L5688:
	cltq
	movzbl	56(%r14), %r12d
	vmovq	%rdi, %xmm7
	addq	%r13, %rax
	jmp	.L5689
.L6467:
	vcvttss2sil	%xmm0, %edx
	jmp	.L5885
.L6489:
	call	*%rax
	movq	56(%rsp), %rax
	movq	(%rax), %r12
	movl	(%r12), %r14d
	testl	%r14d, %r14d
	je	.L5831
	movq	216(%rsp), %rcx
	movq	112(%rsp), %rsi
	xorl	%edx, %edx
.L5838:
	movl	%edx, %eax
	incl	%edx
	movzbl	(%rcx,%rax), %edi
	movzbl	0(%rbp), %eax
	notl	%eax
	movzbl	%al, %eax
	imull	%edi, %eax
	subl	$-128, %eax
	movl	%eax, %r8d
	shrl	$8, %r8d
	addl	%r8d, %eax
	movb	%ah, 0(%rbp)
	movzbl	1(%rbp), %eax
	notl	%eax
	movzbl	%al, %eax
	imull	%edi, %eax
	subl	$-128, %eax
	movl	%eax, %r8d
	shrl	$8, %r8d
	addl	%r8d, %eax
	movb	%ah, 1(%rbp)
	movzbl	2(%rbp), %eax
	notl	%eax
	movzbl	%al, %eax
	imull	%edi, %eax
	subl	$-128, %eax
	movl	%eax, %edi
	shrl	$8, %edi
	addl	%edi, %eax
	movb	%ah, 2(%rbp)
	addq	%rsi, %rbp
	cmpl	(%r12), %edx
	jb	.L5838
	jmp	.L5831
.L6493:
	testl	%r8d, %r8d
	je	.L5831
	movq	216(%rsp), %r9
	movq	192(%rsp), %r8
	xorl	%edi, %edi
	movq	200(%rsp), %r11
	movq	208(%rsp), %rbx
	movq	112(%rsp), %rcx
.L5847:
	movl	%edi, %eax
	incl	%edi
	movzbl	(%r9,%rax), %r13d
	movzbl	(%r8,%rax), %edx
	movzbl	(%r11,%rax), %r10d
	movzbl	(%rbx,%rax), %esi
	movb	$-1, 1(%rbp)
	imull	%r13d, %edx
	imull	%r13d, %r10d
	imull	%r13d, %esi
	subl	$-128, %edx
	movl	%edx, %eax
	subl	$-128, %r10d
	shrl	$8, %eax
	subl	$-128, %esi
	addl	%edx, %eax
	movl	%r10d, %edx
	shrl	$8, %edx
	shrl	$8, %eax
	addl	%r10d, %edx
	imull	$77, %eax, %eax
	shrl	$8, %edx
	imull	$150, %edx, %edx
	addl	%edx, %eax
	movl	%esi, %edx
	shrl	$8, %edx
	addl	%esi, %edx
	shrl	$8, %edx
	imull	$29, %edx, %edx
	addl	%edx, %eax
	movb	%ah, 0(%rbp)
	addq	%rcx, %rbp
	cmpl	(%r12), %edi
	jb	.L5847
	jmp	.L6431
.L6483:
	leaq	1(%rcx), %rdx
	movq	%rdx, 192(%r15)
	movzbl	(%rcx), %esi
	movl	%esi, %ebp
	movl	%esi, 80(%rsp)
.L5918:
	cmpq	%rdx, %rax
	jbe	.L6496
	leaq	1(%rdx), %rax
	movq	%rax, 192(%r15)
	movzbl	(%rdx), %ecx
	jmp	.L5919
.L6481:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%r15)
	movzbl	(%rax), %r14d
	movl	%r14d, %r13d
	jmp	.L5914
.L5931:
	subl	$24, %r13d
	andl	$247, %r13d
	je	.L6433
.L5933:
	leaq	.LC243(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	movq	$0, (%rsp)
	jmp	.L5583
.L5930:
	leal	-8(%rbp), %eax
	cmpb	$24, %al
	ja	.L5933
	leaq	.L5936(%rip), %rdx
	movzbl	%al, %eax
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	notrack jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L5936:
	.long	.L5938-.L5936
	.long	.L5933-.L5936
	.long	.L5933-.L5936
	.long	.L5933-.L5936
	.long	.L5933-.L5936
	.long	.L5933-.L5936
	.long	.L5933-.L5936
	.long	.L6105-.L5936
	.long	.L5937-.L5936
	.long	.L5933-.L5936
	.long	.L5933-.L5936
	.long	.L5933-.L5936
	.long	.L5933-.L5936
	.long	.L5933-.L5936
	.long	.L5933-.L5936
	.long	.L5933-.L5936
	.long	.L5935-.L5936
	.long	.L5933-.L5936
	.long	.L5933-.L5936
	.long	.L5933-.L5936
	.long	.L5933-.L5936
	.long	.L5933-.L5936
	.long	.L5933-.L5936
	.long	.L5933-.L5936
	.long	.L5935-.L5936
	.text
.L6478:
	leaq	1(%rsi), %rcx
	movq	%rcx, 192(%r15)
	movzbl	(%rsi), %r12d
	movb	%r12b, 72(%rsp)
.L5901:
	cmpq	%rax, %rcx
	jnb	.L6497
	leaq	1(%rcx), %rdx
	movq	%rdx, 192(%r15)
	movzbl	(%rcx), %esi
	movl	%esi, 48(%rsp)
.L5905:
	cmpq	%rax, %rdx
	jnb	.L6498
	leaq	1(%rdx), %rax
	movq	%rax, 192(%r15)
	movzbl	(%rdx), %ebx
	jmp	.L5906
.L6457:
	movq	0(%rbp), %rax
	movl	8(%rax), %eax
	testl	%eax, %eax
	jle	.L6432
	decl	%eax
	leaq	18128(%rbp), %rbx
	leaq	(%rax,%rax,2), %rax
	salq	$5, %rax
	leaq	18224(%rbp,%rax), %r12
.L5809:
	movq	8(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L5806
	call	free@PLT
	vpxor	%xmm7, %xmm7, %xmm7
	vmovdqu	%xmm7, (%rbx)
.L5806:
	movq	16(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L5807
	call	free@PLT
	movq	$0, 16(%rbx)
	movq	$0, 32(%rbx)
.L5807:
	movq	24(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L5808
	call	free@PLT
	movq	$0, 24(%rbx)
.L5808:
	addq	$96, %rbx
	cmpq	%rbx, %r12
	jne	.L5809
.L6432:
	movq	$0, (%rsp)
	jmp	.L5803
.L5945:
	movl	48(%rsp), %r8d
	testl	%r8d, %r8d
	je	.L6109
	movl	88(%rsp), %edi
	testl	%edi, %edi
	je	.L6499
	movl	104(%rsp), %esi
	testl	%esi, %esi
	je	.L5952
	js	.L6500
	movl	104(%rsp), %esi
	movq	%r15, %rdi
	call	stbi__skip.part.0
.L5952:
	cmpl	%r13d, 88(%rsp)
	ja	.L5955
	movl	88(%rsp), %r12d
	imull	%r14d, %r12d
	movslq	%r12d, %rdi
	call	malloc@PLT
	movq	%rax, 72(%rsp)
	testq	%rax, %rax
	je	.L5955
	testl	%ebx, %ebx
	je	.L5956
	cmpl	$3, %r14d
	jne	.L6501
	movq	%rax, %r12
	xorl	%r13d, %r13d
.L5957:
	movq	%r15, %rdi
	addq	$3, %r12
	incl	%r13d
	call	stbi__get16le
	movl	%eax, %ecx
	movl	%eax, %edx
	shrw	$10, %cx
	andl	$31, %ecx
	movl	%ecx, %eax
	sall	$8, %eax
	subl	%ecx, %eax
	movl	%eax, %ecx
	imulq	$138547333, %rcx, %rcx
	shrq	$32, %rcx
	subl	%ecx, %eax
	shrl	%eax
	addl	%ecx, %eax
	movl	%edx, %ecx
	andl	$31, %edx
	shrw	$5, %cx
	shrl	$4, %eax
	andl	$31, %ecx
	movb	%al, -3(%r12)
	movl	%ecx, %eax
	sall	$8, %eax
	subl	%ecx, %eax
	movl	%eax, %ecx
	imulq	$138547333, %rcx, %rcx
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
	cmpl	%r13d, 88(%rsp)
	jg	.L5957
.L5946:
	movl	32(%rsp), %ecx
	testl	%ecx, %ecx
	je	.L5996
	movq	(%rsp), %r13
	movslq	%r14d, %rax
	xorl	%r12d, %r12d
	leaq	420(%rsp), %rbp
	xorl	%edi, %edi
	leaq	57(%r15), %rsi
	movq	%rax, 104(%rsp)
	movl	%ebx, 112(%rsp)
	movl	$0, 24(%rsp)
	movl	$1, %eax
	movq	%rsi, 16(%rsp)
	movq	%r13, %rbx
	movl	%r14d, %r13d
	movl	%r12d, %r14d
	movq	%rbp, %r12
	movl	%edi, %ebp
	jmp	.L5995
.L6507:
	testl	%r14d, %r14d
	je	.L6502
	testl	%ebp, %ebp
	je	.L5961
	testl	%eax, %eax
	jne	.L6503
.L5967:
	cmpl	$8, %r13d
	jnb	.L5989
.L6407:
	testb	$4, %r13b
	jne	.L6504
	testl	%r13d, %r13d
	je	.L5990
	movzbl	(%r12), %eax
	movb	%al, (%rbx)
	testb	$2, %r13b
	jne	.L6505
.L5990:
	incl	24(%rsp)
	decl	%r14d
	addq	104(%rsp), %rbx
	movl	24(%rsp), %eax
	cmpl	32(%rsp), %eax
	je	.L6506
	xorl	%eax, %eax
.L5995:
	movl	64(%rsp), %edx
	testl	%edx, %edx
	jne	.L6507
.L5961:
	movl	48(%rsp), %eax
	testl	%eax, %eax
	jne	.L6508
	movl	112(%rsp), %r11d
	testl	%r11d, %r11d
	je	.L5978
	cmpl	$3, %r13d
	jne	.L6509
	movq	192(%r15), %rsi
	movq	200(%r15), %rax
	cmpq	%rax, %rsi
	jb	.L6510
	movl	48(%r15), %r11d
	testl	%r11d, %r11d
	jne	.L6511
.L5982:
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
	andl	$31, %r11d
	shrw	$5, %dx
	shrl	$4, %eax
	andl	$31, %edx
	movb	%al, 420(%rsp)
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
	movb	%al, 421(%rsp)
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
	movb	%al, 422(%rsp)
	jmp	.L6407
.L5989:
	movq	(%r12), %rax
	leaq	8(%rbx), %rdi
	movq	%r12, %r11
	andq	$-8, %rdi
	movq	%rax, (%rbx)
	movl	%r13d, %eax
	movq	-8(%r12,%rax), %rdx
	movq	%rdx, -8(%rbx,%rax)
	movq	%rbx, %rax
	subq	%rdi, %rax
	subq	%rax, %r11
	addl	%r13d, %eax
	andl	$-8, %eax
	cmpl	$8, %eax
	jb	.L5990
	andl	$-8, %eax
	xorl	%edx, %edx
.L5993:
	movl	%edx, %ecx
	addl	$8, %edx
	movq	(%r11,%rcx), %rsi
	movq	%rsi, (%rdi,%rcx)
	cmpl	%eax, %edx
	jb	.L5993
	jmp	.L5990
.L6502:
	movq	192(%r15), %rax
	cmpq	200(%r15), %rax
	jb	.L6512
	movl	48(%r15), %ebp
	movl	64(%rsp), %r14d
	testl	%ebp, %ebp
	je	.L5961
	leaq	56(%r15), %rbp
	movl	52(%r15), %edx
	movq	40(%r15), %rdi
	movq	%rbp, %rsi
	call	*16(%r15)
	movq	192(%r15), %rdx
	subq	208(%r15), %rdx
	addl	%edx, 184(%r15)
	testl	%eax, %eax
	jne	.L5965
	movq	16(%rsp), %rbp
	movl	$0, 48(%r15)
	movb	$0, 56(%r15)
.L5966:
	movzbl	56(%r15), %eax
	vmovq	16(%rsp), %xmm2
	vpinsrq	$1, %rbp, %xmm2, %xmm0
	vmovdqu	%xmm0, 192(%r15)
.L6434:
	movl	%eax, %r9d
	sarl	$7, %eax
	andl	$127, %r9d
	movl	%eax, %ebp
	incl	%r9d
	movzbl	%r9b, %r14d
	jmp	.L5961
.L6508:
	cmpl	$8, 80(%rsp)
	movq	%r15, %rdi
	je	.L6513
	call	stbi__get16le
.L5970:
	xorl	%edx, %edx
	cmpl	%eax, 88(%rsp)
	jle	.L5971
	imull	%r13d, %eax
	movl	%eax, %edx
.L5971:
	movslq	%edx, %rax
	addq	72(%rsp), %rax
	cmpl	$8, %r13d
	jnb	.L5972
	testb	$4, %r13b
	jne	.L6514
	testl	%r13d, %r13d
	je	.L6407
	movzbl	(%rax), %edx
	movb	%dl, (%r12)
	testb	$2, %r13b
	je	.L5967
	movl	%r13d, %edx
	movzwl	-2(%rax,%rdx), %eax
	movw	%ax, -2(%r12,%rdx)
	jmp	.L5967
	.p2align 4
	.p2align 3
.L5978:
	movq	192(%r15), %rdx
	movq	200(%r15), %rax
	cmpq	%rax, %rdx
	jb	.L5997
	movl	48(%r15), %r9d
	testl	%r9d, %r9d
	jne	.L6515
	movb	$0, 420(%rsp)
	cmpl	$1, %r13d
	je	.L6407
.L6052:
	movl	48(%r15), %r8d
	testl	%r8d, %r8d
	jne	.L6516
	movb	$0, 421(%rsp)
	cmpl	$2, %r13d
	jle	.L5967
.L6051:
	movl	48(%r15), %edi
	testl	%edi, %edi
	jne	.L6517
	movb	$0, 422(%rsp)
	cmpl	$3, %r13d
	jle	.L5967
.L6050:
	movl	48(%r15), %esi
	xorl	%r11d, %r11d
	testl	%esi, %esi
	jne	.L6518
.L6016:
	movb	%r11b, 423(%rsp)
	cmpl	$4, %r13d
	jle	.L5967
	cmpq	%rdx, %rax
	ja	.L6519
	leaq	56(%r15), %rbx
	movl	52(%r15), %edx
	movq	40(%r15), %rdi
	movq	%rbx, %rsi
	call	*16(%r15)
	movq	192(%r15), %rdx
	subq	208(%r15), %rdx
	addl	%edx, 184(%r15)
	leaq	57(%r15), %rdx
	testl	%eax, %eax
	jne	.L6022
	movl	$0, 48(%r15)
	movq	%rdx, %rbx
	movb	$0, 56(%r15)
.L6023:
	vmovq	%rdx, %xmm3
	vpinsrq	$1, %rbx, %xmm3, %xmm0
	vmovdqu	%xmm0, 192(%r15)
	.p2align 4
	.p2align 3
.L6510:
	leaq	1(%rsi), %rdx
	movq	%rdx, 192(%r15)
	movzbl	(%rsi), %r11d
.L5981:
	cmpq	%rdx, %rax
	jbe	.L6520
	leaq	1(%rdx), %rax
	movq	%rax, 192(%r15)
	movzbl	(%rdx), %eax
	sall	$8, %eax
	addl	%eax, %r11d
	jmp	.L5982
.L5972:
	movq	(%rax), %rdx
	leaq	424(%rsp), %rdi
	movq	%rdx, (%r12)
	movl	%r13d, %edx
	movq	-8(%rax,%rdx), %rsi
	movq	%rsi, -8(%r12,%rdx)
	movq	%r12, %rdx
	subq	%rdi, %rdx
	subq	%rdx, %rax
	addl	%r13d, %edx
	andl	$-8, %edx
	cmpl	$8, %edx
	jb	.L5967
	andl	$-8, %edx
	xorl	%esi, %esi
.L5976:
	movl	%esi, %ecx
	addl	$8, %esi
	movq	(%rax,%rcx), %r8
	movq	%r8, (%rdi,%rcx)
	cmpl	%edx, %esi
	jb	.L5976
	jmp	.L5967
.L6506:
	movl	112(%rsp), %ebx
	movl	%r13d, %r14d
.L5996:
	cmpb	$0, 120(%rsp)
	jne	.L5960
	movl	40(%rsp), %eax
	testl	%eax, %eax
	jle	.L5960
	movl	56(%rsp), %r12d
	decl	%eax
	movl	%eax, 24(%rsp)
	imull	%r14d, %r12d
	testl	%r12d, %r12d
	je	.L5960
	movl	%r12d, %eax
	movq	(%rsp), %rcx
	movl	%r12d, %r11d
	leal	-1(%r12), %r9d
	shrl	$4, %eax
	andl	$-16, %r11d
	xorl	%r13d, %r13d
	decl	%eax
	incq	%rax
	salq	$4, %rax
	movq	%rax, %r15
	movl	%r12d, %eax
	andl	$15, %eax
	movl	%eax, 48(%rsp)
	movslq	%r12d, %rax
	movq	%rax, 64(%rsp)
.L6029:
	movl	24(%rsp), %eax
	movl	56(%rsp), %esi
	subl	%r13d, %eax
	imull	%esi, %eax
	movl	%esi, %edx
	imull	%r13d, %edx
	imull	%r14d, %eax
	imull	%r14d, %edx
	movslq	%eax, %r10
	movslq	%edx, %rsi
	leaq	16(%r10), %rdi
	cmpq	%rdi, %rsi
	leaq	16(%rsi), %r8
	setge	%dil
	cmpq	%r8, %r10
	setge	%r8b
	orb	%r8b, %dil
	je	.L6028
	cmpl	$6, %r9d
	jbe	.L6028
	cmpl	$14, %r9d
	jbe	.L6115
	leaq	(%rcx,%rsi), %rbp
	leaq	(%rcx,%r10), %r8
	xorl	%edi, %edi
.L6031:
	vmovdqu	0(%rbp,%rdi), %xmm0
	vmovdqu	(%r8,%rdi), %xmm3
	vmovdqu	%xmm3, 0(%rbp,%rdi)
	vmovdqu	%xmm0, (%r8,%rdi)
	addq	$16, %rdi
	cmpq	%rdi, %r15
	jne	.L6031
	addl	%r11d, %edx
	addl	%r11d, %eax
	cmpl	%r11d, %r12d
	je	.L6036
	movl	48(%rsp), %r8d
	movl	%r11d, 16(%rsp)
.L6030:
	movl	%r12d, %ebp
	subl	16(%rsp), %ebp
	leal	-1(%rbp), %edi
	cmpl	$6, %edi
	jbe	.L6033
	movl	16(%rsp), %edi
	addq	%rdi, %rsi
	addq	%r10, %rdi
	addq	%rcx, %rsi
	addq	%rcx, %rdi
	movq	(%rsi), %r10
	vmovq	(%rdi), %xmm0
	vmovq	%xmm0, (%rsi)
	movl	%ebp, %esi
	andl	$-8, %esi
	addl	%esi, %edx
	addl	%esi, %eax
	subl	%esi, %r8d
	movq	%r10, (%rdi)
	cmpl	%ebp, %esi
	je	.L6036
.L6033:
	movslq	%edx, %rdi
	movslq	%eax, %rsi
	addq	%rcx, %rdi
	addq	%rcx, %rsi
	movzbl	(%rdi), %r10d
	movzbl	(%rsi), %ebp
	movb	%bpl, (%rdi)
	movb	%r10b, (%rsi)
	leal	1(%rdx), %edi
	leal	1(%rax), %esi
	cmpl	$1, %r8d
	je	.L6036
	movslq	%edi, %rdi
	movslq	%esi, %rsi
	addq	%rcx, %rdi
	addq	%rcx, %rsi
	movzbl	(%rdi), %r10d
	movzbl	(%rsi), %ebp
	movb	%bpl, (%rdi)
	movb	%r10b, (%rsi)
	leal	2(%rdx), %edi
	leal	2(%rax), %esi
	cmpl	$2, %r8d
	je	.L6036
	movslq	%edi, %rdi
	movslq	%esi, %rsi
	addq	%rcx, %rdi
	addq	%rcx, %rsi
	movzbl	(%rdi), %r10d
	movzbl	(%rsi), %ebp
	movb	%bpl, (%rdi)
	movb	%r10b, (%rsi)
	leal	3(%rdx), %edi
	leal	3(%rax), %esi
	cmpl	$3, %r8d
	je	.L6036
	movslq	%edi, %rdi
	movslq	%esi, %rsi
	addq	%rcx, %rdi
	addq	%rcx, %rsi
	movzbl	(%rdi), %r10d
	movzbl	(%rsi), %ebp
	movb	%bpl, (%rdi)
	movb	%r10b, (%rsi)
	leal	4(%rdx), %edi
	leal	4(%rax), %esi
	cmpl	$4, %r8d
	je	.L6036
	movslq	%edi, %rdi
	movslq	%esi, %rsi
	addq	%rcx, %rdi
	addq	%rcx, %rsi
	movzbl	(%rdi), %r10d
	movzbl	(%rsi), %ebp
	movb	%bpl, (%rdi)
	movb	%r10b, (%rsi)
	leal	5(%rdx), %edi
	leal	5(%rax), %esi
	cmpl	$5, %r8d
	je	.L6036
	movslq	%edi, %rdi
	movslq	%esi, %rsi
	addl	$6, %edx
	addl	$6, %eax
	addq	%rcx, %rdi
	addq	%rcx, %rsi
	movzbl	(%rdi), %r10d
	movzbl	(%rsi), %ebp
	movb	%bpl, (%rdi)
	movb	%r10b, (%rsi)
	cmpl	$6, %r8d
	je	.L6036
	movslq	%edx, %rdx
	cltq
	addq	%rcx, %rdx
	addq	%rcx, %rax
	movzbl	(%rdx), %esi
	movzbl	(%rax), %edi
	movb	%dil, (%rdx)
	movb	%sil, (%rax)
.L6036:
	incl	%r13d
	leal	(%r13,%r13), %eax
	cmpl	%eax, 40(%rsp)
	jg	.L6029
.L5960:
	cmpq	$0, 72(%rsp)
	je	.L6025
	movq	72(%rsp), %rdi
	call	free@PLT
.L6025:
	cmpl	$2, %r14d
	jle	.L6041
	testl	%ebx, %ebx
	jne	.L6041
	jmp	.L6040
.L6028:
	movq	64(%rsp), %rdi
	leaq	(%rcx,%rsi), %rax
	leaq	(%rax,%rdi), %rbp
.L6035:
	movq	%rax, %rdx
	movzbl	(%rax), %edi
	incq	%rax
	subq	%rsi, %rdx
	movzbl	(%rdx,%r10), %r8d
	movb	%r8b, -1(%rax)
	movb	%dil, (%rdx,%r10)
	cmpq	%rax, %rbp
	jne	.L6035
	jmp	.L6036
.L6504:
	movl	(%r12), %eax
	movl	%eax, (%rbx)
	movl	%r13d, %eax
	movl	-4(%r12,%rax), %edx
	movl	%edx, -4(%rbx,%rax)
	jmp	.L5990
.L6513:
	call	stbi__get8
	movzbl	%al, %eax
	jmp	.L5970
.L6512:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%r15)
	movzbl	(%rax), %eax
	jmp	.L6434
.L6511:
	leaq	56(%r15), %rsi
	movl	52(%r15), %edx
	movq	40(%r15), %rdi
	movq	%rsi, 128(%rsp)
	call	*16(%r15)
	movq	16(%rsp), %rdx
	movslq	%eax, %r11
	movq	192(%r15), %rax
	subq	208(%r15), %rax
	movq	128(%rsp), %rsi
	addl	%eax, 184(%r15)
	testl	%r11d, %r11d
	jne	.L5983
	movl	$0, 48(%r15)
	movb	$0, 56(%r15)
	movq	%rdx, %rax
	vmovq	%rdx, %xmm3
.L5984:
	vpinsrq	$1, %rax, %xmm3, %xmm0
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L5981
.L6520:
	movl	48(%r15), %r10d
	testl	%r10d, %r10d
	je	.L5982
	leaq	56(%r15), %rsi
	movl	52(%r15), %edx
	movl	%r11d, 140(%rsp)
	movq	40(%r15), %rdi
	movq	%rsi, 128(%rsp)
	call	*16(%r15)
	movq	192(%r15), %rdx
	subq	208(%r15), %rdx
	movq	128(%rsp), %rsi
	addl	%edx, 184(%r15)
	testl	%eax, %eax
	movl	140(%rsp), %r11d
	jne	.L5987
	movq	16(%rsp), %rsi
	movl	$0, 48(%r15)
	movb	$0, 56(%r15)
.L5988:
	vmovq	16(%rsp), %xmm4
	vpinsrq	$1, %rsi, %xmm4, %xmm0
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L5982
.L5997:
	leaq	1(%rdx), %rdi
	movq	%rdi, 192(%r15)
	movzbl	(%rdx), %edx
.L6001:
	movb	%dl, 420(%rsp)
	cmpl	$1, %r13d
	je	.L6407
	cmpq	%rdi, %rax
	jbe	.L6521
	leaq	1(%rdi), %rdx
	movq	%rdx, 192(%r15)
	movzbl	(%rdi), %esi
.L6007:
	movb	%sil, 421(%rsp)
	cmpl	$2, %r13d
	jle	.L5967
	cmpq	%rdx, %rax
	jbe	.L6051
	leaq	1(%rdx), %rdi
	movq	%rdi, 192(%r15)
	movzbl	(%rdx), %esi
	movq	%rdi, %rdx
.L6013:
	movb	%sil, 422(%rsp)
	cmpl	$3, %r13d
	jle	.L5967
	cmpq	%rax, %rdx
	jnb	.L6050
	leaq	1(%rdx), %rsi
	movq	%rsi, 192(%r15)
	movzbl	(%rdx), %r11d
	movq	%rsi, %rdx
	jmp	.L6016
.L6105:
	movl	$1, %ebx
	movl	$3, %r14d
	jmp	.L5932
.L6109:
	movq	$0, 72(%rsp)
	jmp	.L5946
.L5935:
	movl	80(%rsp), %r14d
.L6433:
	sarl	$3, %r14d
	xorl	%ebx, %ebx
	testl	%r14d, %r14d
	jne	.L5932
	jmp	.L5933
.L6484:
	leaq	56(%r15), %rcx
	movl	52(%r15), %edx
	movq	40(%r15), %rdi
	movq	%rcx, %rsi
	movq	%rcx, (%rsp)
	call	*16(%r15)
	movq	(%rsp), %rcx
	movl	%eax, %esi
	movl	%eax, 80(%rsp)
	movq	192(%r15), %rax
	leaq	57(%r15), %rdx
	subq	208(%r15), %rax
	addl	%eax, 184(%r15)
	testl	%esi, %esi
	jne	.L5920
	movl	$0, 48(%r15)
	movb	$0, 56(%r15)
	movq	%rdx, %rax
.L5921:
	vmovq	%rdx, %xmm6
	vpinsrq	$1, %rax, %xmm6, %xmm0
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L5918
.L6482:
	leaq	56(%r15), %rbp
	movl	52(%r15), %edx
	movq	40(%r15), %rdi
	movq	%rbp, %rsi
	call	*16(%r15)
	leaq	57(%r15), %rdx
	movl	%eax, %r14d
	movq	192(%r15), %rax
	subq	208(%r15), %rax
	addl	%eax, 184(%r15)
	testl	%r14d, %r14d
	jne	.L5915
	movl	$0, 48(%r15)
	movq	%rdx, %rax
	movb	$0, 56(%r15)
.L5916:
	vmovq	%rdx, %xmm5
	vpinsrq	$1, %rax, %xmm5, %xmm0
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L5914
.L5820:
	movl	$1, %edi
	call	malloc@PLT
	movq	%rax, (%rsp)
	testq	%rax, %rax
	jne	.L5822
	jmp	.L5818
.L6479:
	leaq	56(%r15), %rbx
	movl	52(%r15), %edx
	movq	40(%r15), %rdi
	movq	%rbx, %rsi
	call	*16(%r15)
	leaq	57(%r15), %rcx
	movl	%eax, %r12d
	movq	192(%r15), %rax
	subq	208(%r15), %rax
	addl	%eax, 184(%r15)
	testl	%r12d, %r12d
	jne	.L5903
	movl	$0, 48(%r15)
	movq	%rcx, %rax
	movb	$0, 56(%r15)
.L5904:
	vmovq	%rcx, %xmm2
	vpinsrq	$1, %rax, %xmm2, %xmm0
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L5901
.L6480:
	leaq	56(%r15), %rbx
	movl	52(%r15), %edx
	movq	40(%r15), %rdi
	movq	%rbx, %rsi
	call	*16(%r15)
	leaq	57(%r15), %rdx
	movl	%eax, %esi
	movl	%eax, 48(%rsp)
	movq	192(%r15), %rax
	subq	208(%r15), %rax
	addl	%eax, 184(%r15)
	testl	%esi, %esi
	jne	.L5907
	movl	$0, 48(%r15)
	movq	%rdx, %rax
	movb	$0, 56(%r15)
.L5908:
	vmovq	%rdx, %xmm3
	vpinsrq	$1, %rax, %xmm3, %xmm0
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L5905
.L6498:
	movl	48(%r15), %ebx
	testl	%ebx, %ebx
	je	.L5906
	leaq	56(%r15), %rbp
	movl	52(%r15), %edx
	movq	40(%r15), %rdi
	movq	%rbp, %rsi
	call	*16(%r15)
	leaq	57(%r15), %rdx
	movslq	%eax, %rbx
	movq	192(%r15), %rax
	subq	208(%r15), %rax
	addl	%eax, 184(%r15)
	testl	%ebx, %ebx
	jne	.L5911
	movl	$0, 48(%r15)
	movq	%rdx, %rax
	movb	$0, 56(%r15)
.L5912:
	vmovq	%rdx, %xmm4
	vpinsrq	$1, %rax, %xmm4, %xmm0
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L5906
.L6496:
	movl	48(%r15), %r11d
	testl	%r11d, %r11d
	je	.L6522
	leaq	56(%r15), %rcx
	movl	52(%r15), %edx
	movq	40(%r15), %rdi
	movq	%rcx, %rsi
	movq	%rcx, (%rsp)
	call	*16(%r15)
	movq	192(%r15), %rdx
	subq	208(%r15), %rdx
	addl	%edx, 184(%r15)
	testl	%eax, %eax
	movq	(%rsp), %rcx
	leaq	57(%r15), %rdx
	jne	.L5924
	movl	$0, 48(%r15)
	movb	$0, 56(%r15)
	movq	%rdx, %rax
	xorl	%ecx, %ecx
.L5925:
	vmovq	%rdx, %xmm7
	vpinsrq	$1, %rax, %xmm7, %xmm0
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L5919
.L6497:
	movl	48(%r15), %ebx
	jmp	.L5902
.L5937:
	cmpl	$3, %ebx
	setne	%bl
	movzbl	%bl, %ebx
	leal	2(%rbx), %r14d
	jmp	.L5932
.L5907:
	movslq	48(%rsp), %rax
	movzbl	56(%r15), %esi
	addq	%rbx, %rax
	movl	%esi, 48(%rsp)
	jmp	.L5908
.L6505:
	movl	%r13d, %eax
	movzwl	-2(%r12,%rax), %edx
	movw	%dx, -2(%rbx,%rax)
	jmp	.L5990
.L6503:
	movl	%eax, %ebp
	jmp	.L5961
.L5965:
	cltq
	addq	%rax, %rbp
	jmp	.L5966
.L6115:
	movl	%r12d, %r8d
	movl	$0, 16(%rsp)
	jmp	.L6030
.L5983:
	leaq	(%rsi,%r11), %rax
	vmovq	%rdx, %xmm3
	movzbl	56(%r15), %r11d
	jmp	.L5984
.L6516:
	leaq	56(%r15), %rsi
	movl	52(%r15), %edx
	movq	40(%r15), %rdi
	movq	%rsi, 128(%rsp)
	call	*16(%r15)
	movq	192(%r15), %rdx
	subq	208(%r15), %rdx
	addl	%edx, 184(%r15)
	movq	16(%rsp), %rdx
	testl	%eax, %eax
	je	.L6005
	movq	128(%rsp), %rsi
	cltq
	addq	%rsi, %rax
	movzbl	56(%r15), %esi
.L6008:
	vmovq	16(%rsp), %xmm6
	vpinsrq	$1, %rax, %xmm6, %xmm0
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L6007
.L5895:
	testb	%bl, %bl
	je	.L6055
	testb	%al, %al
	jne	.L5888
.L6055:
	vmovdqu	208(%r15), %xmm0
	movq	216(%r15), %rax
	vmovq	%xmm0, %rsi
.L6053:
	andl	$-9, %edx
	cmpb	$16, %dl
	je	.L5898
	movq	%rsi, 192(%r15)
	jmp	.L5899
.L6515:
	leaq	56(%r15), %rsi
	movl	52(%r15), %edx
	movq	40(%r15), %rdi
	movq	%rsi, 128(%rsp)
	call	*16(%r15)
	movq	192(%r15), %rdx
	subq	208(%r15), %rdx
	addl	%edx, 184(%r15)
	movq	16(%rsp), %rdi
	testl	%eax, %eax
	je	.L5999
	movq	128(%rsp), %rsi
	movzbl	56(%r15), %edx
	cltq
	vmovq	%rdi, %xmm5
	addq	%rsi, %rax
.L6002:
	vpinsrq	$1, %rax, %xmm5, %xmm0
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L6001
.L6474:
	xorl	%eax, %eax
	testb	$16, 72(%rsp)
	movq	16(%rsp), %rsi
	movl	48(%rsp), %edi
	setne	%al
	addl	$3, %eax
	movl	%eax, (%rsi)
	testl	%edi, %edi
	jle	.L6045
	movl	40(%rsp), %esi
	movl	$4, %r13d
	leal	0(,%rsi,4), %eax
	leal	-1(%rsi), %edx
	cltq
	movq	%rax, 96(%rsp)
	movq	(%rsp), %rax
	leaq	4(%rax,%rdx,4), %rax
	notq	%rdx
	movq	%rax, 56(%rsp)
	movslq	64(%rsp), %rax
	leaq	(%rax,%rax,2), %rax
	leaq	229(%rsp,%rax), %rax
	movq	%rax, 104(%rsp)
	leaq	226(%rsp), %rax
	movq	%rax, 120(%rsp)
	leaq	0(,%rdx,4), %rax
	movq	%rax, 112(%rsp)
	leaq	420(%rsp), %rax
	movq	%rax, 72(%rsp)
.L5792:
	movq	112(%rsp), %rax
	movq	%r14, %r15
	addq	56(%rsp), %rax
	movq	120(%rsp), %rbp
	movq	%rax, 64(%rsp)
.L5720:
	movzbl	-1(%rbp), %eax
	cmpb	$1, %al
	je	.L5715
	cmpb	$2, %al
	je	.L5716
	testb	%al, %al
	jne	.L6409
	cmpl	$0, 40(%rsp)
	jle	.L5723
	movzbl	0(%rbp), %r12d
	movq	64(%rsp), %rbx
.L5725:
	movq	%rbx, %rdx
	movl	%r12d, %esi
	movq	%r15, %rdi
	call	stbi__readval
	testq	%rax, %rax
	je	.L5684
	addq	$4, %rbx
	cmpq	56(%rsp), %rbx
	jne	.L5725
.L5723:
	addq	$3, %rbp
	cmpq	%rbp, 104(%rsp)
	jne	.L5720
	incl	80(%rsp)
	movq	96(%rsp), %rbx
	movq	%r15, %r14
	addq	%rbx, 56(%rsp)
	movl	80(%rsp), %eax
	cmpl	%eax, 48(%rsp)
	jne	.L5792
	jmp	.L6045
.L6519:
	incq	%rdx
	movq	%rdx, 192(%r15)
.L5987:
	cltq
	addq	%rax, %rsi
	movzbl	56(%r15), %eax
	sall	$8, %eax
	addl	%eax, %r11d
	jmp	.L5988
.L5920:
	movslq	80(%rsp), %rax
	movzbl	56(%r15), %esi
	addq	%rcx, %rax
	movl	%esi, %ebp
	movl	%esi, 80(%rsp)
	jmp	.L5921
.L5903:
	movslq	%r12d, %rax
	movzbl	56(%r15), %r12d
	addq	%rbx, %rax
	movb	%r12b, 72(%rsp)
	jmp	.L5904
.L5911:
	leaq	0(%rbp,%rbx), %rax
	movzbl	56(%r15), %ebx
	jmp	.L5912
.L5915:
	movslq	%r14d, %r9
	movzbl	56(%r15), %r14d
	leaq	0(%rbp,%r9), %rax
	movl	%r14d, %r13d
	jmp	.L5916
.L6459:
	movl	%eax, %esi
	movq	%rbp, %rdi
	call	stbi__free_jpeg_components.constprop.0
	jmp	.L6432
.L5924:
	cltq
	addq	%rcx, %rax
	movzbl	56(%r15), %ecx
	jmp	.L5925
.L5940:
	movl	$2147483647, %eax
	movl	$0, 32(%rsp)
	cltd
	idivl	%r14d
	movl	%eax, %r13d
	jmp	.L6047
.L5948:
	movl	40(%rsp), %eax
	movl	%ebp, %r13d
	negl	%r13d
	movslq	%r13d, %r13
	leal	-1(%rax), %r12d
	imull	56(%rsp), %r12d
	imull	%r14d, %r12d
	movslq	%r12d, %r12
	addq	(%rsp), %r12
.L5950:
	movq	%r12, %rsi
	movl	%ebp, %edx
	movq	%r15, %rdi
	call	stbi__getn
	incl	%ebx
	addq	%r13, %r12
	cmpl	%ebx, 40(%rsp)
	jne	.L5950
	jmp	.L5947
.L6485:
	movq	%rsi, 192(%r15)
	movl	%r12d, %esi
	movb	%cl, 16(%rsp)
	movq	40(%r15), %rdi
	subl	%edx, %esi
	call	*24(%r15)
	movzbl	16(%rsp), %ecx
	jmp	.L5943
.L6521:
	movq	%rdi, %rdx
	jmp	.L6052
.L5955:
	movq	(%rsp), %rdi
	call	free@PLT
	leaq	.LC16(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	movq	$0, (%rsp)
	jmp	.L5583
.L6460:
	movl	48(%rsp), %esi
	movq	%r12, %rdi
	movq	%rax, (%rsp)
	movq	%r12, %rbp
	call	stbi__free_jpeg_components.constprop.0
	leaq	.LC16(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L5803
.L6522:
	xorl	%ecx, %ecx
	jmp	.L5919
.L5716:
	movl	40(%rsp), %eax
	movq	64(%rsp), %r14
	movl	%eax, %ebx
	testl	%eax, %eax
	jle	.L5723
	movq	%rbp, 88(%rsp)
	movq	%r15, %rbp
.L5719:
	movq	%rbp, %rdi
	call	stbi__get8
	cmpq	$0, 16(%rbp)
	movzbl	%al, %edx
	movq	%rdx, %r15
	je	.L5761
	movl	%edx, 128(%rsp)
	movq	40(%rbp), %rdi
	call	*32(%rbp)
	testl	%eax, %eax
	movl	128(%rsp), %edx
	je	.L5760
	cmpl	$0, 48(%rbp)
	je	.L6429
.L5761:
	movq	200(%rbp), %rax
	cmpq	%rax, 192(%rbp)
	jnb	.L6429
.L5760:
	cmpl	$127, %edx
	jle	.L5762
	leal	-127(%rdx), %r12d
	cmpl	$128, %edx
	je	.L6523
.L5764:
	cmpl	%ebx, %r12d
	jg	.L6429
	movq	88(%rsp), %rax
	movq	72(%rsp), %rdx
	movq	%rbp, %rdi
	movzbl	(%rax), %esi
	movl	%esi, %r15d
	call	stbi__readval
	testq	%rax, %rax
	je	.L5684
	testl	%r12d, %r12d
	jle	.L5790
	movl	%r15d, %eax
	movl	%r15d, %edx
	movl	%r15d, %esi
	andl	$64, %eax
	andl	$32, %edx
	andl	$16, %esi
	testb	%r15b, %r15b
	js	.L5768
	testb	%sil, %sil
	jne	.L5769
	testb	%dl, %dl
	jne	.L5770
	testb	%al, %al
	je	.L6428
	xorl	%eax, %eax
.L5771:
	movzbl	421(%rsp), %edx
	movb	%dl, 1(%r14,%rax,4)
	incq	%rax
	cmpl	%eax, %r12d
	jg	.L5771
.L6428:
	movslq	%r12d, %rax
	leaq	(%r14,%rax,4), %r14
.L5790:
	subl	%r12d, %ebx
	testl	%ebx, %ebx
	jg	.L5719
.L6426:
	movq	%rbp, %r15
	movq	88(%rsp), %rbp
	jmp	.L5723
.L6523:
	movq	%rbp, %rdi
	call	stbi__get16be
	movl	%eax, %r12d
	jmp	.L5764
.L5762:
	leal	1(%rdx), %r12d
	cmpl	%ebx, %r12d
	jg	.L6429
	movq	88(%rsp), %rax
	movl	%ebx, 128(%rsp)
	leaq	4(%r14,%r15,4), %r15
	movzbl	(%rax), %esi
	movl	%esi, %ebx
.L5791:
	movq	%r14, %rdx
	movl	%ebx, %esi
	movq	%rbp, %rdi
	call	stbi__readval
	testq	%rax, %rax
	je	.L5684
	addq	$4, %r14
	cmpq	%r15, %r14
	jne	.L5791
	movl	128(%rsp), %ebx
	jmp	.L5790
.L5715:
	movl	40(%rsp), %eax
	movq	64(%rsp), %r14
	movl	%eax, %r12d
	testl	%eax, %eax
	jle	.L5723
	movq	%rbp, 88(%rsp)
	movq	%r15, %rbp
.L5758:
	movq	%rbp, %rdi
	call	stbi__get8
	cmpq	$0, 16(%rbp)
	movzbl	%al, %ebx
	je	.L5729
	movq	40(%rbp), %rdi
	call	*32(%rbp)
	testl	%eax, %eax
	je	.L5728
	cmpl	$0, 48(%rbp)
	je	.L6429
.L5729:
	movq	200(%rbp), %rax
	cmpq	%rax, 192(%rbp)
	jnb	.L6429
.L5728:
	movq	88(%rsp), %rax
	movq	72(%rsp), %rdx
	movq	%rbp, %rdi
	movzbl	(%rax), %esi
	movl	%esi, %r15d
	cmpl	%r12d, %ebx
	jle	.L5731
	call	stbi__readval
	testq	%rax, %rax
	je	.L5684
	movl	%r12d, %ebx
.L5733:
	movl	%r15d, %eax
	movl	%r15d, %edx
	movl	%r15d, %esi
	andl	$64, %eax
	andl	$32, %edx
	andl	$16, %esi
	testb	%r15b, %r15b
	js	.L5735
	testb	%sil, %sil
	jne	.L5736
	testb	%dl, %dl
	jne	.L5737
	testb	%al, %al
	je	.L6427
	xorl	%eax, %eax
.L5738:
	movzbl	421(%rsp), %edx
	movb	%dl, 1(%r14,%rax,4)
	incq	%rax
	cmpl	%eax, %ebx
	jg	.L5738
.L6427:
	movslq	%ebx, %rax
	salq	$2, %rax
	testl	%ebx, %ebx
	cmovle	%r13, %rax
	subl	%ebx, %r12d
	addq	%rax, %r14
	testl	%r12d, %r12d
	jg	.L5758
	jmp	.L6426
.L5735:
	testb	%sil, %sil
	jne	.L5747
	testb	%dl, %dl
	jne	.L5748
	testb	%al, %al
	movl	$0, %eax
	jne	.L5749
.L5750:
	movzbl	420(%rsp), %edx
	movb	%dl, (%r14,%rax,4)
	incq	%rax
	cmpl	%eax, %ebx
	jg	.L5750
	jmp	.L6427
.L5749:
	movzbl	420(%rsp), %edx
	movb	%dl, (%r14,%rax,4)
	movzbl	421(%rsp), %edx
	movb	%dl, 1(%r14,%rax,4)
	incq	%rax
	cmpl	%eax, %ebx
	jg	.L5749
	jmp	.L6427
.L5731:
	call	stbi__readval
	testq	%rax, %rax
	je	.L5684
	testl	%ebx, %ebx
	jne	.L5733
	jmp	.L5758
.L5748:
	testb	%al, %al
	movl	$0, %eax
	jne	.L5751
.L5752:
	movzbl	420(%rsp), %edx
	movb	%dl, (%r14,%rax,4)
	movzbl	422(%rsp), %edx
	movb	%dl, 2(%r14,%rax,4)
	incq	%rax
	cmpl	%eax, %ebx
	jg	.L5752
	jmp	.L6427
.L5751:
	movzbl	420(%rsp), %edx
	movb	%dl, (%r14,%rax,4)
	movzbl	421(%rsp), %edx
	movb	%dl, 1(%r14,%rax,4)
	movzbl	422(%rsp), %edx
	movb	%dl, 2(%r14,%rax,4)
	incq	%rax
	cmpl	%eax, %ebx
	jg	.L5751
	jmp	.L6427
.L5747:
	testb	%dl, %dl
	jne	.L5753
	testb	%al, %al
	movl	$0, %eax
	jne	.L5754
.L5755:
	movzbl	420(%rsp), %edx
	movb	%dl, (%r14,%rax,4)
	movzbl	423(%rsp), %edx
	movb	%dl, 3(%r14,%rax,4)
	incq	%rax
	cmpl	%eax, %ebx
	jg	.L5755
	jmp	.L6427
.L5754:
	movzbl	420(%rsp), %edx
	movb	%dl, (%r14,%rax,4)
	movzbl	421(%rsp), %edx
	movb	%dl, 1(%r14,%rax,4)
	movzbl	423(%rsp), %edx
	movb	%dl, 3(%r14,%rax,4)
	incq	%rax
	cmpl	%eax, %ebx
	jg	.L5754
	jmp	.L6427
.L5753:
	testb	%al, %al
	movl	$0, %eax
	jne	.L5756
.L5757:
	movzbl	420(%rsp), %edx
	movb	%dl, (%r14,%rax,4)
	movzbl	422(%rsp), %edx
	movb	%dl, 2(%r14,%rax,4)
	movzbl	423(%rsp), %edx
	movb	%dl, 3(%r14,%rax,4)
	incq	%rax
	cmpl	%eax, %ebx
	jg	.L5757
	jmp	.L6427
.L5756:
	movzbl	420(%rsp), %edx
	movb	%dl, (%r14,%rax,4)
	movzbl	421(%rsp), %edx
	movb	%dl, 1(%r14,%rax,4)
	movzbl	422(%rsp), %edx
	movb	%dl, 2(%r14,%rax,4)
	movzbl	423(%rsp), %edx
	movb	%dl, 3(%r14,%rax,4)
	incq	%rax
	cmpl	%eax, %ebx
	jg	.L5756
	jmp	.L6427
.L5737:
	testb	%al, %al
	movl	$0, %eax
	jne	.L5740
.L5741:
	movzbl	422(%rsp), %edx
	movb	%dl, 2(%r14,%rax,4)
	incq	%rax
	cmpl	%eax, %ebx
	jg	.L5741
	jmp	.L6427
.L5740:
	movzbl	421(%rsp), %edx
	movb	%dl, 1(%r14,%rax,4)
	movzbl	422(%rsp), %edx
	movb	%dl, 2(%r14,%rax,4)
	incq	%rax
	cmpl	%eax, %ebx
	jg	.L5740
	jmp	.L6427
.L5736:
	testb	%dl, %dl
	jne	.L5742
	testb	%al, %al
	movl	$0, %eax
	jne	.L5743
.L5744:
	movzbl	423(%rsp), %edx
	movb	%dl, 3(%r14,%rax,4)
	incq	%rax
	cmpl	%eax, %ebx
	jg	.L5744
	jmp	.L6427
.L5743:
	movzbl	421(%rsp), %edx
	movb	%dl, 1(%r14,%rax,4)
	movzbl	423(%rsp), %edx
	movb	%dl, 3(%r14,%rax,4)
	incq	%rax
	cmpl	%eax, %ebx
	jg	.L5743
	jmp	.L6427
.L5742:
	testb	%al, %al
	movl	$0, %eax
	jne	.L5745
.L5746:
	movzbl	422(%rsp), %edx
	movb	%dl, 2(%r14,%rax,4)
	movzbl	423(%rsp), %edx
	movb	%dl, 3(%r14,%rax,4)
	incq	%rax
	cmpl	%eax, %ebx
	jg	.L5746
	jmp	.L6427
.L5745:
	movzbl	421(%rsp), %edx
	movb	%dl, 1(%r14,%rax,4)
	movzbl	422(%rsp), %edx
	movb	%dl, 2(%r14,%rax,4)
	movzbl	423(%rsp), %edx
	movb	%dl, 3(%r14,%rax,4)
	incq	%rax
	cmpl	%eax, %ebx
	jg	.L5745
	jmp	.L6427
.L5770:
	testb	%al, %al
	movl	$0, %eax
	jne	.L5772
.L5773:
	movzbl	422(%rsp), %edx
	movb	%dl, 2(%r14,%rax,4)
	incq	%rax
	cmpl	%eax, %r12d
	jg	.L5773
	jmp	.L6428
.L5769:
	testb	%dl, %dl
	jne	.L5774
	testb	%al, %al
	movl	$0, %eax
	jne	.L5775
.L5776:
	movzbl	423(%rsp), %edx
	movb	%dl, 3(%r14,%rax,4)
	incq	%rax
	cmpl	%eax, %r12d
	jg	.L5776
	jmp	.L6428
.L5768:
	testb	%sil, %sil
	jne	.L5779
	testb	%dl, %dl
	jne	.L5780
	testb	%al, %al
	movl	$0, %eax
	jne	.L5781
.L5782:
	movzbl	420(%rsp), %edx
	movb	%dl, (%r14,%rax,4)
	incq	%rax
	cmpl	%eax, %r12d
	jg	.L5782
	jmp	.L6428
.L5772:
	movzbl	421(%rsp), %edx
	movb	%dl, 1(%r14,%rax,4)
	movzbl	422(%rsp), %edx
	movb	%dl, 2(%r14,%rax,4)
	incq	%rax
	cmpl	%eax, %r12d
	jg	.L5772
	jmp	.L6428
.L5781:
	movzbl	420(%rsp), %edx
	movb	%dl, (%r14,%rax,4)
	movzbl	421(%rsp), %edx
	movb	%dl, 1(%r14,%rax,4)
	incq	%rax
	cmpl	%eax, %r12d
	jg	.L5781
	jmp	.L6428
.L5780:
	testb	%al, %al
	movl	$0, %eax
	jne	.L5783
.L5784:
	movzbl	420(%rsp), %edx
	movb	%dl, (%r14,%rax,4)
	movzbl	422(%rsp), %edx
	movb	%dl, 2(%r14,%rax,4)
	incq	%rax
	cmpl	%eax, %r12d
	jg	.L5784
	jmp	.L6428
.L5779:
	testb	%dl, %dl
	jne	.L5785
	testb	%al, %al
	movl	$0, %eax
	jne	.L5786
.L5787:
	movzbl	420(%rsp), %edx
	movb	%dl, (%r14,%rax,4)
	movzbl	423(%rsp), %edx
	movb	%dl, 3(%r14,%rax,4)
	incq	%rax
	cmpl	%eax, %r12d
	jg	.L5787
	jmp	.L6428
.L5783:
	movzbl	420(%rsp), %edx
	movb	%dl, (%r14,%rax,4)
	movzbl	421(%rsp), %edx
	movb	%dl, 1(%r14,%rax,4)
	movzbl	422(%rsp), %edx
	movb	%dl, 2(%r14,%rax,4)
	incq	%rax
	cmpl	%eax, %r12d
	jg	.L5783
	jmp	.L6428
.L5786:
	movzbl	420(%rsp), %edx
	movb	%dl, (%r14,%rax,4)
	movzbl	421(%rsp), %edx
	movb	%dl, 1(%r14,%rax,4)
	movzbl	423(%rsp), %edx
	movb	%dl, 3(%r14,%rax,4)
	incq	%rax
	cmpl	%eax, %r12d
	jg	.L5786
	jmp	.L6428
.L5785:
	testb	%al, %al
	movl	$0, %eax
	jne	.L5788
.L5789:
	movzbl	420(%rsp), %edx
	movb	%dl, (%r14,%rax,4)
	movzbl	422(%rsp), %edx
	movb	%dl, 2(%r14,%rax,4)
	movzbl	423(%rsp), %edx
	movb	%dl, 3(%r14,%rax,4)
	incq	%rax
	cmpl	%eax, %r12d
	jg	.L5789
	jmp	.L6428
.L5775:
	movzbl	421(%rsp), %edx
	movb	%dl, 1(%r14,%rax,4)
	movzbl	423(%rsp), %edx
	movb	%dl, 3(%r14,%rax,4)
	incq	%rax
	cmpl	%eax, %r12d
	jg	.L5775
	jmp	.L6428
.L5774:
	testb	%al, %al
	movl	$0, %eax
	jne	.L5777
.L5778:
	movzbl	422(%rsp), %edx
	movb	%dl, 2(%r14,%rax,4)
	movzbl	423(%rsp), %edx
	movb	%dl, 3(%r14,%rax,4)
	incq	%rax
	cmpl	%eax, %r12d
	jg	.L5778
	jmp	.L6428
.L5788:
	movzbl	420(%rsp), %edx
	movb	%dl, (%r14,%rax,4)
	movzbl	421(%rsp), %edx
	movb	%dl, 1(%r14,%rax,4)
	movzbl	422(%rsp), %edx
	movb	%dl, 2(%r14,%rax,4)
	movzbl	423(%rsp), %edx
	movb	%dl, 3(%r14,%rax,4)
	incq	%rax
	cmpl	%eax, %r12d
	jg	.L5788
	jmp	.L6428
.L5777:
	movzbl	421(%rsp), %edx
	movb	%dl, 1(%r14,%rax,4)
	movzbl	422(%rsp), %edx
	movb	%dl, 2(%r14,%rax,4)
	movzbl	423(%rsp), %edx
	movb	%dl, 3(%r14,%rax,4)
	incq	%rax
	cmpl	%eax, %r12d
	jg	.L5777
	jmp	.L6428
.L6509:
	leaq	__PRETTY_FUNCTION__.34(%rip), %rcx
	movl	$5929, %edx
	leaq	.LC14(%rip), %rsi
	leaq	.LC245(%rip), %rdi
	call	__assert_fail@PLT
.L6514:
	movl	(%rax), %edx
	movl	%edx, (%r12)
	movl	%r13d, %edx
	movl	-4(%rax,%rdx), %eax
	movl	%eax, -4(%r12,%rdx)
	jmp	.L5967
.L5938:
	xorl	%ebx, %ebx
	movl	$1, %r14d
	jmp	.L5932
.L6501:
	leaq	__PRETTY_FUNCTION__.34(%rip), %rcx
	movl	$5880, %edx
	leaq	.LC14(%rip), %rsi
	leaq	.LC245(%rip), %rdi
	call	__assert_fail@PLT
.L6517:
	leaq	56(%r15), %rsi
	movl	52(%r15), %edx
	movq	40(%r15), %rdi
	movq	%rsi, 128(%rsp)
	call	*16(%r15)
	movq	192(%r15), %rdx
	subq	208(%r15), %rdx
	addl	%edx, 184(%r15)
	movq	16(%rsp), %rdx
	testl	%eax, %eax
	je	.L6011
	movq	128(%rsp), %rsi
	cltq
	addq	%rsi, %rax
	movzbl	56(%r15), %esi
.L6014:
	vmovq	16(%rsp), %xmm7
	vpinsrq	$1, %rax, %xmm7, %xmm0
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L6013
.L6005:
	movq	16(%rsp), %rax
	movl	$0, 48(%r15)
	movb	$0, 56(%r15)
	xorl	%esi, %esi
	jmp	.L6008
.L6011:
	movq	16(%rsp), %rax
	movl	$0, 48(%r15)
	movb	$0, 56(%r15)
	xorl	%esi, %esi
	jmp	.L6014
.L6439:
	call	__stack_chk_fail@PLT
.L5999:
	movq	16(%rsp), %rax
	movl	$0, 48(%r15)
	movb	$0, 56(%r15)
	xorl	%edx, %edx
	vmovq	%rax, %xmm5
	jmp	.L6002
.L6499:
	movq	(%rsp), %rdi
	call	free@PLT
	leaq	.LC244(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	movq	$0, (%rsp)
	jmp	.L5583
.L6500:
	movq	200(%r15), %rax
	movq	%rax, 192(%r15)
	jmp	.L5952
.L6435:
	leaq	.LC16(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L5583
.L6518:
	leaq	56(%r15), %rsi
	movl	52(%r15), %edx
	movb	%r11b, 140(%rsp)
	movq	40(%r15), %rdi
	movq	%rsi, 128(%rsp)
	call	*16(%r15)
	movq	192(%r15), %rdx
	subq	208(%r15), %rdx
	movzbl	140(%rsp), %r11d
	addl	%edx, 184(%r15)
	testl	%eax, %eax
	movq	16(%rsp), %rdx
	je	.L6017
	movq	128(%rsp), %rsi
	cltq
	movzbl	56(%r15), %r11d
	addq	%rsi, %rax
.L6019:
	vmovq	16(%rsp), %xmm2
	vpinsrq	$1, %rax, %xmm2, %xmm0
	vmovdqu	%xmm0, 192(%r15)
	jmp	.L6016
.L6022:
	cltq
	addq	%rax, %rbx
	jmp	.L6023
.L6494:
	movq	192(%r14), %rdx
	movq	200(%r14), %rsi
	jmp	.L5697
.L6495:
	movq	192(%r14), %rdx
	movq	200(%r14), %rsi
	jmp	.L5687
.L6446:
	leaq	.LC16(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L5795
.L6017:
	movq	16(%rsp), %rax
	movl	$0, 48(%r15)
	movb	$0, 56(%r15)
	jmp	.L6019
	.cfi_endproc
.LFE594:
	.size	stbi__load_main, .-stbi__load_main
	.section	.rodata.str1.8
	.align 8
.LC246:
	.string	"ri.bits_per_channel == 8 || ri.bits_per_channel == 16"
	.text
	.p2align 4
	.type	stbi__load_and_postprocess_8bit, @function
stbi__load_and_postprocess_8bit:
.LFB599:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	%r8d, %r14d
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdx, %r13
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rsi, %rbp
	subq	$64, %rsp
	.cfi_def_cfa_offset 120
	movq	%rcx, 8(%rsp)
	movq	%fs:40, %rax
	movq	%rax, 48(%rsp)
	xorl	%eax, %eax
	pushq	$8
	.cfi_def_cfa_offset 128
	leaq	44(%rsp), %r9
	call	stbi__load_main
	popq	%rsi
	.cfi_def_cfa_offset 120
	movq	%rax, %r12
	popq	%rdi
	.cfi_def_cfa_offset 112
	testq	%rax, %rax
	je	.L6524
	movl	28(%rsp), %eax
	leal	-8(%rax), %edx
	andl	$-9, %edx
	jne	.L6558
	cmpl	$8, %eax
	je	.L6527
	movl	%r14d, %eax
	testl	%r14d, %r14d
	je	.L6559
.L6528:
	movl	0(%r13), %r15d
	imull	0(%rbp), %r15d
	imull	%eax, %r15d
	movslq	%r15d, %rdx
	movq	%rdx, %rdi
	movq	%rdx, 8(%rsp)
	call	malloc@PLT
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L6529
	testl	%r15d, %r15d
	movq	8(%rsp), %rdx
	jle	.L6531
	leaq	(%r12,%rdx,2), %rax
	cmpq	%rax, %rbx
	setnb	%al
	addq	%rbx, %rdx
	cmpq	%rdx, %r12
	setnb	%dl
	orb	%dl, %al
	je	.L6533
	leal	-1(%r15), %eax
	cmpl	$14, %eax
	jbe	.L6533
	vmovdqa	.LC2(%rip), %xmm2
	movl	%r15d, %edx
	xorl	%eax, %eax
	shrl	$4, %edx
	salq	$4, %rdx
	.p2align 4
	.p2align 3
.L6534:
	vmovdqu	(%r12,%rax,2), %xmm3
	vmovdqu	16(%r12,%rax,2), %xmm4
	vpsrlw	$8, %xmm3, %xmm0
	vpsrlw	$8, %xmm4, %xmm1
	vpand	%xmm0, %xmm2, %xmm0
	vpand	%xmm1, %xmm2, %xmm1
	vpackuswb	%xmm1, %xmm0, %xmm0
	vmovdqu	%xmm0, (%rbx,%rax)
	addq	$16, %rax
	cmpq	%rdx, %rax
	jne	.L6534
	movl	%r15d, %eax
	andl	$-16, %eax
	testb	$15, %r15b
	je	.L6531
	movl	%eax, %ecx
	movzbl	1(%r12,%rcx,2), %esi
	leaq	(%rcx,%rcx), %rdx
	movb	%sil, (%rbx,%rcx)
	leal	1(%rax), %ecx
	cmpl	%ecx, %r15d
	jle	.L6531
	movzbl	3(%r12,%rdx), %esi
	movslq	%ecx, %rcx
	movb	%sil, (%rbx,%rcx)
	leal	2(%rax), %ecx
	cmpl	%ecx, %r15d
	jle	.L6531
	movzbl	5(%r12,%rdx), %esi
	movslq	%ecx, %rcx
	movb	%sil, (%rbx,%rcx)
	leal	3(%rax), %ecx
	cmpl	%ecx, %r15d
	jle	.L6531
	movzbl	7(%r12,%rdx), %esi
	movslq	%ecx, %rcx
	movb	%sil, (%rbx,%rcx)
	leal	4(%rax), %ecx
	cmpl	%ecx, %r15d
	jle	.L6531
	movzbl	9(%r12,%rdx), %esi
	movslq	%ecx, %rcx
	movb	%sil, (%rbx,%rcx)
	leal	5(%rax), %ecx
	cmpl	%ecx, %r15d
	jle	.L6531
	movzbl	11(%r12,%rdx), %esi
	movslq	%ecx, %rcx
	movb	%sil, (%rbx,%rcx)
	leal	6(%rax), %ecx
	cmpl	%ecx, %r15d
	jle	.L6531
	movzbl	13(%r12,%rdx), %esi
	movslq	%ecx, %rcx
	movb	%sil, (%rbx,%rcx)
	leal	7(%rax), %ecx
	cmpl	%ecx, %r15d
	jle	.L6531
	movzbl	15(%r12,%rdx), %esi
	movslq	%ecx, %rcx
	movb	%sil, (%rbx,%rcx)
	leal	8(%rax), %ecx
	cmpl	%ecx, %r15d
	jle	.L6531
	movzbl	17(%r12,%rdx), %esi
	movslq	%ecx, %rcx
	movb	%sil, (%rbx,%rcx)
	leal	9(%rax), %ecx
	cmpl	%ecx, %r15d
	jle	.L6531
	movzbl	19(%r12,%rdx), %esi
	movslq	%ecx, %rcx
	movb	%sil, (%rbx,%rcx)
	leal	10(%rax), %ecx
	cmpl	%ecx, %r15d
	jle	.L6531
	movzbl	21(%r12,%rdx), %esi
	movslq	%ecx, %rcx
	movb	%sil, (%rbx,%rcx)
	leal	11(%rax), %ecx
	cmpl	%ecx, %r15d
	jle	.L6531
	movzbl	23(%r12,%rdx), %esi
	movslq	%ecx, %rcx
	movb	%sil, (%rbx,%rcx)
	leal	12(%rax), %ecx
	cmpl	%ecx, %r15d
	jle	.L6531
	movzbl	25(%r12,%rdx), %esi
	movslq	%ecx, %rcx
	movb	%sil, (%rbx,%rcx)
	leal	13(%rax), %ecx
	cmpl	%ecx, %r15d
	jle	.L6531
	movzbl	27(%r12,%rdx), %esi
	movslq	%ecx, %rcx
	addl	$14, %eax
	movb	%sil, (%rbx,%rcx)
	cmpl	%eax, %r15d
	jle	.L6531
	movzbl	29(%r12,%rdx), %edx
	cltq
	movb	%dl, (%rbx,%rax)
	.p2align 4
	.p2align 3
.L6531:
	movq	%r12, %rdi
	call	free@PLT
.L6532:
	movl	$8, 28(%rsp)
	movq	%rbx, %r12
.L6527:
	movl	%fs:stbi__vertically_flip_on_load_set@tpoff, %ecx
	testl	%ecx, %ecx
	jne	.L6560
	movl	stbi__vertically_flip_on_load_global(%rip), %eax
	testl	%eax, %eax
	je	.L6524
.L6539:
	testl	%r14d, %r14d
	jne	.L6540
	movq	(%rsp), %rax
	movl	(%rax), %r14d
.L6540:
	movl	0(%r13), %edx
	movl	0(%rbp), %esi
	movl	%r14d, %ecx
	movq	%r12, %rdi
	call	stbi__vertical_flip
.L6524:
	movq	40(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L6561
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%r12, %rax
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
	.p2align 4
	.p2align 3
.L6560:
	.cfi_restore_state
	movl	%fs:stbi__vertically_flip_on_load_local@tpoff, %edx
	testl	%edx, %edx
	jne	.L6539
	jmp	.L6524
	.p2align 4
	.p2align 3
.L6559:
	movq	(%rsp), %rax
	movl	(%rax), %eax
	jmp	.L6528
	.p2align 4
	.p2align 3
.L6533:
	movl	%r15d, %r15d
	xorl	%eax, %eax
	.p2align 4
	.p2align 3
.L6536:
	movzbl	1(%r12,%rax,2), %edx
	movb	%dl, (%rbx,%rax)
	incq	%rax
	cmpq	%r15, %rax
	jne	.L6536
	jmp	.L6531
.L6561:
	call	__stack_chk_fail@PLT
.L6558:
	leaq	__PRETTY_FUNCTION__.50(%rip), %rcx
	movl	$1249, %edx
	leaq	.LC14(%rip), %rsi
	leaq	.LC246(%rip), %rdi
	call	__assert_fail@PLT
.L6529:
	leaq	.LC16(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L6532
	.cfi_endproc
.LFE599:
	.size	stbi__load_and_postprocess_8bit, .-stbi__load_and_postprocess_8bit
	.p2align 4
	.type	stbi__loadf_main, @function
stbi__loadf_main:
.LFB612:
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
	movq	%rdi, %r13
	movq	%rcx, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdx, %rbp
	movq	%rsi, %rbx
	subq	$72, %rsp
	.cfi_def_cfa_offset 128
	movl	%r8d, 44(%rsp)
	call	stbi__hdr_test
	movl	%eax, 56(%rsp)
	testl	%eax, %eax
	jne	.L6600
	movl	44(%rsp), %r15d
	movq	%r12, %rcx
	movq	%rbp, %rdx
	movq	%rbx, %rsi
	movq	%r13, %rdi
	movl	%r15d, %r8d
	call	stbi__load_and_postprocess_8bit
	movq	%rax, 32(%rsp)
	testq	%rax, %rax
	je	.L6568
	testl	%r15d, %r15d
	jne	.L6569
	movl	(%r12), %eax
	movl	%eax, 44(%rsp)
.L6569:
	movl	0(%rbp), %ebp
	movl	$4, %ecx
	movl	(%rbx), %ebx
	movl	44(%rsp), %edx
	movl	%ebp, %esi
	movl	%ebx, %edi
	call	stbi__malloc_mad4.constprop.0
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L6601
	movl	44(%rsp), %edi
	movl	%edi, %eax
	movl	%edi, %esi
	andl	$1, %eax
	cmpl	$1, %eax
	sbbl	$0, %esi
	imull	%ebx, %ebp
	movl	%esi, 60(%rsp)
	movl	%ebp, 40(%rsp)
	testl	%ebp, %ebp
	jle	.L6572
	testl	%esi, %esi
	jle	.L6573
	vmovss	.LC131(%rip), %xmm2
	movslq	%edi, %rax
	movq	32(%rsp), %rdi
	xorl	%r12d, %r12d
	movq	%rax, 48(%rsp)
	leal	-1(%rsi), %eax
	xorl	%ebp, %ebp
	leaq	1(%rdi,%rax), %rbx
	vmovss	%xmm2, 28(%rsp)
	.p2align 4
	.p2align 3
.L6574:
	vxorpd	%xmm7, %xmm7, %xmm7
	movq	32(%rsp), %rax
	leaq	0(%r13,%rbp,4), %r15
	vcvtss2sd	stbi__l2h_scale(%rip), %xmm7, %xmm0
	vcvtss2sd	stbi__l2h_gamma(%rip), %xmm7, %xmm1
	leaq	(%rax,%rbp), %r14
	vmovsd	%xmm0, 16(%rsp)
	.p2align 4
	.p2align 3
.L6575:
	movzbl	(%r14), %ecx
	vxorps	%xmm4, %xmm4, %xmm4
	vmovsd	%xmm1, 8(%rsp)
	incq	%r14
	addq	$4, %r15
	vcvtsi2ssl	%ecx, %xmm4, %xmm0
	vdivss	28(%rsp), %xmm0, %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	call	pow@PLT
	vmulsd	16(%rsp), %xmm0, %xmm0
	vmovsd	8(%rsp), %xmm1
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	vmovss	%xmm0, -4(%r15)
	cmpq	%rbx, %r14
	jne	.L6575
	movq	48(%rsp), %rax
	incl	%r12d
	addq	%rax, %rbx
	addq	%rax, %rbp
	cmpl	40(%rsp), %r12d
	jne	.L6574
.L6573:
	movl	60(%rsp), %edi
	cmpl	%edi, 44(%rsp)
	jle	.L6572
	cmpl	$1, 44(%rsp)
	jne	.L6602
	movslq	60(%rsp), %rdx
	movslq	40(%rsp), %rcx
	movq	32(%rsp), %rbx
	movq	%rcx, %rdi
	addq	%rdx, %rcx
	leaq	0(%r13,%rdx,4), %rax
	leaq	0(%r13,%rcx,4), %rsi
	addq	%rbx, %rdx
	cmpq	%rsi, %rdx
	setnb	%sil
	addq	%rbx, %rcx
	cmpq	%rcx, %rax
	setnb	%cl
	orb	%cl, %sil
	je	.L6579
	leal	-1(%rdi), %ecx
	cmpl	$14, %ecx
	jbe	.L6579
	vmovaps	.LC247(%rip), %xmm2
	shrl	$4, %edi
	movl	%edi, %ecx
	salq	$4, %rcx
	addq	%rdx, %rcx
	.p2align 4
	.p2align 3
.L6580:
	vmovdqu	(%rdx), %xmm0
	addq	$16, %rdx
	addq	$64, %rax
	vpmovzxbw	%xmm0, %xmm1
	vpsrldq	$8, %xmm0, %xmm0
	vpmovzxbw	%xmm0, %xmm0
	vpmovzxwd	%xmm1, %xmm3
	vpsrldq	$8, %xmm1, %xmm1
	vpmovzxwd	%xmm1, %xmm1
	vcvtdq2ps	%xmm1, %xmm1
	vcvtdq2ps	%xmm3, %xmm3
	vdivps	%xmm2, %xmm1, %xmm1
	vmovups	%xmm1, -48(%rax)
	vpmovzxwd	%xmm0, %xmm1
	vpsrldq	$8, %xmm0, %xmm0
	vpmovzxwd	%xmm0, %xmm0
	vcvtdq2ps	%xmm1, %xmm1
	vcvtdq2ps	%xmm0, %xmm0
	vdivps	%xmm2, %xmm3, %xmm3
	vdivps	%xmm2, %xmm1, %xmm1
	vmovups	%xmm3, -64(%rax)
	vdivps	%xmm2, %xmm0, %xmm0
	vmovups	%xmm1, -32(%rax)
	vmovups	%xmm0, -16(%rax)
	cmpq	%rcx, %rdx
	jne	.L6580
	movl	40(%rsp), %edi
	movl	%edi, %eax
	andl	$-16, %eax
	testb	$15, %dil
	je	.L6572
	movl	60(%rsp), %esi
	vmovss	.LC131(%rip), %xmm3
	vxorps	%xmm2, %xmm2, %xmm2
	movq	32(%rsp), %rbx
	leal	(%rsi,%rax), %edx
	movslq	%edx, %rdx
	movzbl	(%rbx,%rdx), %ecx
	vcvtsi2ssl	%ecx, %xmm2, %xmm0
	vdivss	%xmm3, %xmm0, %xmm0
	vmovss	%xmm0, 0(%r13,%rdx,4)
	leal	1(%rax), %edx
	cmpl	%edi, %edx
	jge	.L6572
	addl	%esi, %edx
	movslq	%edx, %rdx
	movzbl	(%rbx,%rdx), %ecx
	vcvtsi2ssl	%ecx, %xmm2, %xmm0
	vdivss	%xmm3, %xmm0, %xmm0
	vmovss	%xmm0, 0(%r13,%rdx,4)
	leal	2(%rax), %edx
	cmpl	%edx, %edi
	jle	.L6572
	addl	%esi, %edx
	movslq	%edx, %rdx
	movzbl	(%rbx,%rdx), %ecx
	vcvtsi2ssl	%ecx, %xmm2, %xmm0
	vdivss	%xmm3, %xmm0, %xmm0
	vmovss	%xmm0, 0(%r13,%rdx,4)
	leal	3(%rax), %edx
	cmpl	%edx, %edi
	jle	.L6572
	addl	%esi, %edx
	movslq	%edx, %rdx
	movzbl	(%rbx,%rdx), %ecx
	vcvtsi2ssl	%ecx, %xmm2, %xmm0
	vdivss	%xmm3, %xmm0, %xmm0
	vmovss	%xmm0, 0(%r13,%rdx,4)
	leal	4(%rax), %edx
	cmpl	%edx, %edi
	jle	.L6572
	addl	%esi, %edx
	movslq	%edx, %rdx
	movzbl	(%rbx,%rdx), %ecx
	vcvtsi2ssl	%ecx, %xmm2, %xmm0
	vdivss	%xmm3, %xmm0, %xmm0
	vmovss	%xmm0, 0(%r13,%rdx,4)
	leal	5(%rax), %edx
	cmpl	%edx, %edi
	jle	.L6572
	addl	%esi, %edx
	movslq	%edx, %rdx
	movzbl	(%rbx,%rdx), %ecx
	vcvtsi2ssl	%ecx, %xmm2, %xmm0
	vdivss	%xmm3, %xmm0, %xmm0
	vmovss	%xmm0, 0(%r13,%rdx,4)
	leal	6(%rax), %edx
	cmpl	%edx, %edi
	jle	.L6572
	addl	%esi, %edx
	movslq	%edx, %rdx
	movzbl	(%rbx,%rdx), %ecx
	vcvtsi2ssl	%ecx, %xmm2, %xmm0
	vdivss	%xmm3, %xmm0, %xmm0
	vmovss	%xmm0, 0(%r13,%rdx,4)
	leal	7(%rax), %edx
	cmpl	%edx, %edi
	jle	.L6572
	addl	%esi, %edx
	movslq	%edx, %rdx
	movzbl	(%rbx,%rdx), %ecx
	vcvtsi2ssl	%ecx, %xmm2, %xmm0
	vdivss	%xmm3, %xmm0, %xmm0
	vmovss	%xmm0, 0(%r13,%rdx,4)
	leal	8(%rax), %edx
	cmpl	%edx, %edi
	jle	.L6572
	addl	%esi, %edx
	movslq	%edx, %rdx
	movzbl	(%rbx,%rdx), %ecx
	vcvtsi2ssl	%ecx, %xmm2, %xmm0
	vdivss	%xmm3, %xmm0, %xmm0
	vmovss	%xmm0, 0(%r13,%rdx,4)
	leal	9(%rax), %edx
	cmpl	%edx, %edi
	jle	.L6572
	addl	%esi, %edx
	movslq	%edx, %rdx
	movzbl	(%rbx,%rdx), %ecx
	vcvtsi2ssl	%ecx, %xmm2, %xmm0
	vdivss	%xmm3, %xmm0, %xmm0
	vmovss	%xmm0, 0(%r13,%rdx,4)
	leal	10(%rax), %edx
	cmpl	%edx, %edi
	jle	.L6572
	addl	%esi, %edx
	movslq	%edx, %rdx
	movzbl	(%rbx,%rdx), %ecx
	vcvtsi2ssl	%ecx, %xmm2, %xmm0
	vdivss	%xmm3, %xmm0, %xmm0
	vmovss	%xmm0, 0(%r13,%rdx,4)
	leal	11(%rax), %edx
	cmpl	%edx, %edi
	jle	.L6572
	addl	%esi, %edx
	movslq	%edx, %rdx
	movzbl	(%rbx,%rdx), %ecx
	vcvtsi2ssl	%ecx, %xmm2, %xmm0
	vdivss	%xmm3, %xmm0, %xmm0
	vmovss	%xmm0, 0(%r13,%rdx,4)
	leal	12(%rax), %edx
	cmpl	%edx, %edi
	jle	.L6572
	addl	%esi, %edx
	movslq	%edx, %rdx
	movzbl	(%rbx,%rdx), %ecx
	vcvtsi2ssl	%ecx, %xmm2, %xmm0
	vdivss	%xmm3, %xmm0, %xmm0
	vmovss	%xmm0, 0(%r13,%rdx,4)
	leal	13(%rax), %edx
	cmpl	%edx, %edi
	jle	.L6572
	addl	%esi, %edx
	addl	$14, %eax
	movslq	%edx, %rdx
	movzbl	(%rbx,%rdx), %ecx
	vcvtsi2ssl	%ecx, %xmm2, %xmm0
	vdivss	%xmm3, %xmm0, %xmm0
	vmovss	%xmm0, 0(%r13,%rdx,4)
	cmpl	%eax, %edi
	jle	.L6572
	addl	%esi, %eax
	cltq
	movzbl	(%rbx,%rax), %edx
	vcvtsi2ssl	%edx, %xmm2, %xmm0
	vdivss	%xmm3, %xmm0, %xmm0
	vmovss	%xmm0, 0(%r13,%rax,4)
	.p2align 4
	.p2align 3
.L6572:
	movq	32(%rsp), %rdi
	call	free@PLT
.L6562:
	addq	$72, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%r13, %rax
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
	.p2align 4
	.p2align 3
.L6600:
	.cfi_restore_state
	movl	44(%rsp), %r8d
	movq	%r13, %rdi
	movq	%r12, %rcx
	movq	%rbp, %rdx
	movq	%rbx, %rsi
	call	stbi__hdr_load.constprop.0
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L6562
	movl	%fs:stbi__vertically_flip_on_load_set@tpoff, %esi
	testl	%esi, %esi
	je	.L6565
	movl	%fs:stbi__vertically_flip_on_load_local@tpoff, %ecx
	testl	%ecx, %ecx
	je	.L6562
.L6566:
	movl	44(%rsp), %eax
	testl	%eax, %eax
	jne	.L6567
	movl	(%r12), %eax
	movl	%eax, 44(%rsp)
.L6567:
	movl	44(%rsp), %ecx
	movq	%r13, %rdi
	movl	0(%rbp), %edx
	movl	(%rbx), %esi
	sall	$2, %ecx
	call	stbi__vertical_flip
	jmp	.L6562
.L6568:
	leaq	.LC225(%rip), %rax
	xorl	%r13d, %r13d
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L6562
.L6565:
	movl	stbi__vertically_flip_on_load_global(%rip), %edx
	testl	%edx, %edx
	je	.L6562
	jmp	.L6566
.L6602:
	vmovss	.LC131(%rip), %xmm3
	movslq	60(%rsp), %rax
	movslq	44(%rsp), %rsi
	movq	32(%rsp), %rdx
	leaq	0(,%rsi,4), %rdi
	addq	%rax, %rdx
	leaq	0(%r13,%rax,4), %rax
	vmovss	%xmm3, 28(%rsp)
	.p2align 4
	.p2align 3
.L6577:
	movzbl	(%rdx), %ecx
	vxorps	%xmm2, %xmm2, %xmm2
	addq	%rsi, %rdx
	incl	56(%rsp)
	movl	56(%rsp), %ebx
	vcvtsi2ssl	%ecx, %xmm2, %xmm0
	vdivss	28(%rsp), %xmm0, %xmm0
	vmovss	%xmm0, (%rax)
	addq	%rdi, %rax
	cmpl	40(%rsp), %ebx
	jne	.L6577
	jmp	.L6572
.L6579:
	vmovss	.LC131(%rip), %xmm3
	movl	40(%rsp), %edi
	xorl	%ecx, %ecx
	vmovss	%xmm3, 28(%rsp)
.L6582:
	movzbl	(%rdx,%rcx), %esi
	vxorps	%xmm3, %xmm3, %xmm3
	vcvtsi2ssl	%esi, %xmm3, %xmm0
	vdivss	28(%rsp), %xmm0, %xmm0
	vmovss	%xmm0, (%rax,%rcx,4)
	incq	%rcx
	cmpq	%rdi, %rcx
	jne	.L6582
	jmp	.L6572
.L6601:
	movq	32(%rsp), %rdi
	call	free@PLT
	leaq	.LC16(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L6562
	.cfi_endproc
.LFE612:
	.size	stbi__loadf_main, .-stbi__loadf_main
	.p2align 4
	.type	stbi__load_and_postprocess_16bit, @function
stbi__load_and_postprocess_16bit:
.LFB600:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	%r8d, %r15d
	movq	%rcx, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdx, %r13
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rsi, %rbp
	subq	$64, %rsp
	.cfi_def_cfa_offset 120
	movq	%fs:40, %rax
	movq	%rax, 48(%rsp)
	xorl	%eax, %eax
	pushq	$16
	.cfi_def_cfa_offset 128
	leaq	44(%rsp), %r9
	call	stbi__load_main
	popq	%rsi
	.cfi_def_cfa_offset 120
	movq	%rax, %r12
	popq	%rdi
	.cfi_def_cfa_offset 112
	testq	%rax, %rax
	je	.L6603
	movl	28(%rsp), %eax
	leal	-8(%rax), %edx
	andl	$-9, %edx
	jne	.L6637
	cmpl	$16, %eax
	je	.L6606
	movl	%r15d, %eax
	testl	%r15d, %r15d
	je	.L6638
.L6607:
	movl	0(%r13), %edx
	imull	0(%rbp), %edx
	imull	%eax, %edx
	leal	(%rdx,%rdx), %edi
	movl	%edx, 12(%rsp)
	movslq	%edi, %rdi
	call	malloc@PLT
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L6608
	movl	12(%rsp), %edx
	testl	%edx, %edx
	jle	.L6610
	movslq	%edx, %rax
	leaq	(%rbx,%rax,2), %rcx
	cmpq	%rcx, %r12
	setnb	%cl
	addq	%r12, %rax
	cmpq	%rax, %rbx
	setnb	%al
	orb	%al, %cl
	je	.L6612
	leal	-1(%rdx), %eax
	cmpl	$14, %eax
	jbe	.L6612
	movl	%edx, %ecx
	xorl	%eax, %eax
	shrl	$4, %ecx
	salq	$4, %rcx
	.p2align 4
	.p2align 3
.L6613:
	vmovdqu	(%r12,%rax), %xmm0
	vpmovzxbw	%xmm0, %xmm2
	vpsrldq	$8, %xmm0, %xmm0
	vpmovzxbw	%xmm0, %xmm0
	vpsllw	$8, %xmm2, %xmm1
	vpaddw	%xmm2, %xmm1, %xmm1
	vmovdqu	%xmm1, (%rbx,%rax,2)
	vpsllw	$8, %xmm0, %xmm1
	vpaddw	%xmm0, %xmm1, %xmm0
	vmovdqu	%xmm0, 16(%rbx,%rax,2)
	addq	$16, %rax
	cmpq	%rcx, %rax
	jne	.L6613
	movl	%edx, %eax
	andl	$-16, %eax
	testb	$15, %dl
	je	.L6610
	movl	%eax, %esi
	movzbl	(%r12,%rsi), %edi
	leaq	(%rsi,%rsi), %rcx
	movl	%edi, %esi
	sall	$8, %esi
	addl	%edi, %esi
	movw	%si, (%rbx,%rcx)
	leal	1(%rax), %esi
	cmpl	%esi, %edx
	jle	.L6610
	movslq	%esi, %rsi
	movzbl	(%r12,%rsi), %edi
	movl	%edi, %esi
	sall	$8, %esi
	addl	%edi, %esi
	movw	%si, 2(%rbx,%rcx)
	leal	2(%rax), %esi
	cmpl	%esi, %edx
	jle	.L6610
	movslq	%esi, %rsi
	movzbl	(%r12,%rsi), %edi
	movl	%edi, %esi
	sall	$8, %esi
	addl	%edi, %esi
	movw	%si, 4(%rbx,%rcx)
	leal	3(%rax), %esi
	cmpl	%esi, %edx
	jle	.L6610
	movslq	%esi, %rsi
	movzbl	(%r12,%rsi), %edi
	movl	%edi, %esi
	sall	$8, %esi
	addl	%edi, %esi
	movw	%si, 6(%rbx,%rcx)
	leal	4(%rax), %esi
	cmpl	%esi, %edx
	jle	.L6610
	movslq	%esi, %rsi
	movzbl	(%r12,%rsi), %edi
	movl	%edi, %esi
	sall	$8, %esi
	addl	%edi, %esi
	movw	%si, 8(%rbx,%rcx)
	leal	5(%rax), %esi
	cmpl	%esi, %edx
	jle	.L6610
	movslq	%esi, %rsi
	movzbl	(%r12,%rsi), %edi
	movl	%edi, %esi
	sall	$8, %esi
	addl	%edi, %esi
	movw	%si, 10(%rbx,%rcx)
	leal	6(%rax), %esi
	cmpl	%esi, %edx
	jle	.L6610
	movslq	%esi, %rsi
	movzbl	(%r12,%rsi), %edi
	movl	%edi, %esi
	sall	$8, %esi
	addl	%edi, %esi
	movw	%si, 12(%rbx,%rcx)
	leal	7(%rax), %esi
	cmpl	%esi, %edx
	jle	.L6610
	movslq	%esi, %rsi
	movzbl	(%r12,%rsi), %edi
	movl	%edi, %esi
	sall	$8, %esi
	addl	%edi, %esi
	movw	%si, 14(%rbx,%rcx)
	leal	8(%rax), %esi
	cmpl	%esi, %edx
	jle	.L6610
	movslq	%esi, %rsi
	movzbl	(%r12,%rsi), %edi
	movl	%edi, %esi
	sall	$8, %esi
	addl	%edi, %esi
	movw	%si, 16(%rbx,%rcx)
	leal	9(%rax), %esi
	cmpl	%esi, %edx
	jle	.L6610
	movslq	%esi, %rsi
	movzbl	(%r12,%rsi), %edi
	movl	%edi, %esi
	sall	$8, %esi
	addl	%edi, %esi
	movw	%si, 18(%rbx,%rcx)
	leal	10(%rax), %esi
	cmpl	%esi, %edx
	jle	.L6610
	movslq	%esi, %rsi
	movzbl	(%r12,%rsi), %edi
	movl	%edi, %esi
	sall	$8, %esi
	addl	%edi, %esi
	movw	%si, 20(%rbx,%rcx)
	leal	11(%rax), %esi
	cmpl	%esi, %edx
	jle	.L6610
	movslq	%esi, %rsi
	movzbl	(%r12,%rsi), %edi
	movl	%edi, %esi
	sall	$8, %esi
	addl	%edi, %esi
	movw	%si, 22(%rbx,%rcx)
	leal	12(%rax), %esi
	cmpl	%esi, %edx
	jle	.L6610
	movslq	%esi, %rsi
	movzbl	(%r12,%rsi), %edi
	movl	%edi, %esi
	sall	$8, %esi
	addl	%edi, %esi
	movw	%si, 24(%rbx,%rcx)
	leal	13(%rax), %esi
	cmpl	%esi, %edx
	jle	.L6610
	movslq	%esi, %rsi
	addl	$14, %eax
	movzbl	(%r12,%rsi), %edi
	movl	%edi, %esi
	sall	$8, %esi
	addl	%edi, %esi
	movw	%si, 26(%rbx,%rcx)
	cmpl	%eax, %edx
	jle	.L6610
	cltq
	movzbl	(%r12,%rax), %edx
	movl	%edx, %eax
	sall	$8, %eax
	addl	%edx, %eax
	movw	%ax, 28(%rbx,%rcx)
	.p2align 4
	.p2align 3
.L6610:
	movq	%r12, %rdi
	call	free@PLT
.L6611:
	movl	$16, 28(%rsp)
	movq	%rbx, %r12
.L6606:
	movl	%fs:stbi__vertically_flip_on_load_set@tpoff, %ecx
	testl	%ecx, %ecx
	jne	.L6639
	movl	stbi__vertically_flip_on_load_global(%rip), %eax
	testl	%eax, %eax
	je	.L6603
.L6618:
	testl	%r15d, %r15d
	jne	.L6619
	movl	(%r14), %r15d
.L6619:
	movl	0(%r13), %edx
	movl	0(%rbp), %esi
	leal	(%r15,%r15), %ecx
	movq	%r12, %rdi
	call	stbi__vertical_flip
.L6603:
	movq	40(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L6640
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%r12, %rax
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
	.p2align 4
	.p2align 3
.L6639:
	.cfi_restore_state
	movl	%fs:stbi__vertically_flip_on_load_local@tpoff, %edx
	testl	%edx, %edx
	jne	.L6618
	jmp	.L6603
	.p2align 4
	.p2align 3
.L6638:
	movl	(%r14), %eax
	jmp	.L6607
	.p2align 4
	.p2align 3
.L6612:
	movl	%edx, %edx
	xorl	%eax, %eax
	.p2align 4
	.p2align 3
.L6615:
	movzbl	(%r12,%rax), %esi
	movl	%esi, %ecx
	sall	$8, %ecx
	addl	%esi, %ecx
	movw	%cx, (%rbx,%rax,2)
	incq	%rax
	cmpq	%rax, %rdx
	jne	.L6615
	jmp	.L6610
.L6640:
	call	__stack_chk_fail@PLT
.L6637:
	leaq	__PRETTY_FUNCTION__.33(%rip), %rcx
	movl	$1275, %edx
	leaq	.LC14(%rip), %rsi
	leaq	.LC246(%rip), %rdi
	call	__assert_fail@PLT
.L6608:
	leaq	.LC16(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L6611
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
	movq	%rdi, %r13
	movq	%rsi, 8(%rsp)
	movq	%rdx, 48(%rsp)
	movq	%rsi, %rbx
	movq	%rcx, 56(%rsp)
	movq	%r8, 72(%rsp)
	movq	%r9, %rbp
	movq	%fs:40, %rax
	movq	%rax, 35016(%rsp)
	xorl	%eax, %eax
	call	stbi__gif_test_raw
	vmovdqu	208(%r13), %xmm0
	vmovdqu	%xmm0, 192(%r13)
	testl	%eax, %eax
	je	.L6642
	leaq	80(%rsp), %r15
	xorl	%esi, %esi
	movl	$34928, %edx
	movq	%r15, %rdi
	call	memset@PLT
	testq	%rbx, %rbx
	je	.L6643
	movq	$0, (%rbx)
.L6643:
	movq	$4, 16(%rsp)
	xorl	%r14d, %r14d
	xorl	%r12d, %r12d
	movl	$0, (%rsp)
	.p2align 4
	.p2align 3
.L6644:
	movq	%r14, %rcx
	movq	%rbp, %rdx
	movq	%r15, %rsi
	movq	%r13, %rdi
	call	stbi__gif_load_next.constprop.0
	movq	%rax, %r8
	testq	%rax, %rax
	je	.L6645
	cmpq	%rax, %r13
	je	.L6645
	movl	80(%rsp), %edx
	movq	48(%rsp), %rax
	movq	%r8, 40(%rsp)
	movq	56(%rsp), %rbx
	incl	(%rsp)
	movl	(%rsp), %ecx
	movl	%edx, (%rax)
	movl	84(%rsp), %eax
	imull	%eax, %edx
	movl	%eax, (%rbx)
	leal	0(,%rdx,4), %ebx
	movl	%edx, 36(%rsp)
	imull	%ebx, %ecx
	movl	%ecx, 24(%rsp)
	movslq	%ecx, %rsi
	testq	%r12, %r12
	je	.L6646
	movq	%r12, %rdi
	call	realloc@PLT
	movq	40(%rsp), %r8
	testq	%rax, %rax
	movq	%rax, %r9
	je	.L6701
	movq	8(%rsp), %rax
	testq	%rax, %rax
	je	.L6652
	movq	16(%rsp), %rsi
	movq	(%rax), %rdi
	movq	%r9, 64(%rsp)
	movq	%r8, 40(%rsp)
	call	realloc@PLT
	movq	40(%rsp), %r8
	testq	%rax, %rax
	movq	64(%rsp), %r9
	je	.L6702
	movq	8(%rsp), %rsi
	movq	%r9, %r12
	movq	%rax, (%rsi)
.L6654:
	movl	24(%rsp), %edi
	movslq	%ebx, %rdx
	movq	%r8, %rsi
	subl	%ebx, %edi
	movslq	%edi, %rdi
	addq	%r12, %rdi
	call	memcpy@PLT
	cmpl	$1, (%rsp)
	je	.L6659
	movl	36(%rsp), %eax
	movq	%r12, %r14
	sall	$3, %eax
	cltq
	subq	%rax, %r14
.L6659:
	movq	8(%rsp), %rax
	movl	35000(%rsp), %edx
	movq	16(%rsp), %rbx
	movq	(%rax), %rax
	movl	%edx, -4(%rax,%rbx)
.L6656:
	addq	$4, 16(%rsp)
	jmp	.L6644
	.p2align 4
	.p2align 3
.L6662:
	movq	%rax, %r9
.L6652:
	movl	24(%rsp), %edi
	movslq	%ebx, %rdx
	movq	%r8, %rsi
	movq	%r9, 24(%rsp)
	subl	%ebx, %edi
	movslq	%edi, %rdi
	addq	%r9, %rdi
	call	memcpy@PLT
	cmpl	$1, (%rsp)
	movq	24(%rsp), %r12
	je	.L6656
	movl	36(%rsp), %eax
	movq	%r12, %r14
	sall	$3, %eax
	cltq
	subq	%rax, %r14
	jmp	.L6656
	.p2align 4
	.p2align 3
.L6646:
	movq	%rsi, %rdi
	call	malloc@PLT
	movq	40(%rsp), %r8
	testq	%rax, %rax
	movq	%rax, %r12
	je	.L6703
	cmpq	$0, 8(%rsp)
	je	.L6662
	movq	16(%rsp), %rdi
	movq	%r8, 40(%rsp)
	call	malloc@PLT
	movq	8(%rsp), %rsi
	testq	%rax, %rax
	movq	40(%rsp), %r8
	movq	%rax, (%rsi)
	jne	.L6654
	movq	88(%rsp), %rdi
	call	free@PLT
	movq	104(%rsp), %rdi
	call	free@PLT
	movq	96(%rsp), %rdi
	call	free@PLT
	movq	%r12, %rdi
	jmp	.L6700
	.p2align 4
	.p2align 3
.L6645:
	movq	88(%rsp), %rdi
	call	free@PLT
	movq	104(%rsp), %rdi
	call	free@PLT
	movq	96(%rsp), %rdi
	call	free@PLT
	testl	$-5, 35088(%rsp)
	jne	.L6704
.L6657:
	movq	72(%rsp), %rax
	movl	(%rsp), %esi
	movl	%esi, (%rax)
.L6641:
	movq	35016(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L6705
	addq	$35032, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%r12, %rax
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
.L6704:
	.cfi_restore_state
	movl	(%rsp), %ecx
	imull	80(%rsp), %ecx
	movq	%r12, %rdi
	movl	$4, %esi
	movl	84(%rsp), %r8d
	movl	35088(%rsp), %edx
	call	stbi__convert_format
	movq	%rax, %r12
	jmp	.L6657
.L6642:
	leaq	.LC223(%rip), %rax
	xorl	%r12d, %r12d
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L6641
.L6703:
	movq	88(%rsp), %rdi
	call	free@PLT
	movq	104(%rsp), %rdi
	call	free@PLT
	movq	96(%rsp), %rdi
	call	free@PLT
	movq	8(%rsp), %rax
	testq	%rax, %rax
	je	.L6649
.L6698:
	movq	(%rax), %rdi
	testq	%rdi, %rdi
	je	.L6649
.L6696:
	call	free@PLT
.L6649:
	leaq	.LC16(%rip), %rax
	xorl	%r12d, %r12d
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L6641
.L6702:
	movq	88(%rsp), %rdi
	movq	%r9, (%rsp)
	call	free@PLT
	movq	104(%rsp), %rdi
	call	free@PLT
	movq	96(%rsp), %rdi
	call	free@PLT
	movq	(%rsp), %rdi
.L6700:
	call	free@PLT
	movq	8(%rsp), %rax
	movq	(%rax), %rdi
	testq	%rdi, %rdi
	jne	.L6696
	jmp	.L6649
.L6701:
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
	jne	.L6698
	jmp	.L6649
.L6705:
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
.LC248:
	.string	"rb"
.LC249:
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
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rcx, %r13
	movq	%rdx, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rsi, %rbp
	leaq	.LC248(%rip), %rsi
	subq	$248, %rsp
	.cfi_def_cfa_offset 304
	movl	%r8d, %ebx
	movq	%fs:40, %rax
	movq	%rax, 232(%rsp)
	xorl	%eax, %eax
	call	fopen@PLT
	testq	%rax, %rax
	je	.L6721
	movq	%rax, %r14
	vmovdqa	stbi__stdio_callbacks(%rip), %xmm0
	movq	16+stbi__stdio_callbacks(%rip), %rax
	leaq	56(%rsp), %r15
	movl	$128, %edx
	movq	%r15, %rsi
	movq	%r14, %rdi
	movq	%r14, 40(%rsp)
	movl	$0, 184(%rsp)
	movq	%r15, 208(%rsp)
	movq	%r15, 192(%rsp)
	movq	%rax, 32(%rsp)
	movq	.LC250(%rip), %rax
	vmovdqa	%xmm0, 16(%rsp)
	movq	%rax, 48(%rsp)
	call	stbi__stdio_read
	movq	192(%rsp), %rdx
	subq	208(%rsp), %rdx
	addl	%edx, 184(%rsp)
	testl	%eax, %eax
	je	.L6722
	cltq
	addq	%r15, %rax
.L6714:
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
	je	.L6715
	movl	192(%rsp), %esi
	subl	200(%rsp), %esi
	movl	$1, %edx
	movq	%r14, %rdi
	movslq	%esi, %rsi
	call	fseek@PLT
.L6715:
	movq	%r14, %rdi
	call	fclose@PLT
.L6710:
	movq	232(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L6723
	addq	$248, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%r12, %rax
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
	.p2align 4
	.p2align 3
.L6722:
	.cfi_restore_state
	movl	$0, 48(%rsp)
	movb	$0, 56(%rsp)
	leaq	57(%rsp), %rax
	jmp	.L6714
.L6723:
	call	__stack_chk_fail@PLT
.L6721:
	leaq	.LC249(%rip), %rax
	xorl	%r12d, %r12d
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L6710
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
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	%r8d, %r15d
	movq	%rcx, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdx, %r13
	movq	%rsi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	$128, %edx
	movq	%rdi, %rbp
	subq	$248, %rsp
	.cfi_def_cfa_offset 304
	vmovdqa	stbi__stdio_callbacks(%rip), %xmm0
	movq	%fs:40, %rax
	movq	%rax, 232(%rsp)
	xorl	%eax, %eax
	movq	16+stbi__stdio_callbacks(%rip), %rax
	leaq	56(%rsp), %rbx
	movq	%rdi, 40(%rsp)
	movl	$0, 184(%rsp)
	movq	%rbx, %rsi
	movq	%rbx, 208(%rsp)
	movq	%rbx, 192(%rsp)
	movq	%rax, 32(%rsp)
	movq	.LC250(%rip), %rax
	vmovdqa	%xmm0, 16(%rsp)
	movq	%rax, 48(%rsp)
	call	stbi__stdio_read
	movq	192(%rsp), %rdx
	subq	208(%rsp), %rdx
	addl	%edx, 184(%rsp)
	testl	%eax, %eax
	jne	.L6725
	movl	$0, 48(%rsp)
	leaq	57(%rsp), %rax
	movb	$0, 56(%rsp)
.L6726:
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
	je	.L6724
	movl	192(%rsp), %esi
	subl	200(%rsp), %esi
	movl	$1, %edx
	movq	%rbp, %rdi
	movslq	%esi, %rsi
	call	fseek@PLT
.L6724:
	movq	232(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L6733
	addq	$248, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%r12, %rax
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
	.p2align 4
	.p2align 3
.L6725:
	.cfi_restore_state
	cltq
	addq	%rbx, %rax
	jmp	.L6726
.L6733:
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
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	%r8d, %r15d
	movq	%rcx, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdx, %r13
	movq	%rsi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	$128, %edx
	movq	%rdi, %rbp
	subq	$248, %rsp
	.cfi_def_cfa_offset 304
	vmovdqa	stbi__stdio_callbacks(%rip), %xmm0
	movq	%fs:40, %rax
	movq	%rax, 232(%rsp)
	xorl	%eax, %eax
	movq	16+stbi__stdio_callbacks(%rip), %rax
	leaq	56(%rsp), %rbx
	movq	%rdi, 40(%rsp)
	movl	$0, 184(%rsp)
	movq	%rbx, %rsi
	movq	%rbx, 208(%rsp)
	movq	%rbx, 192(%rsp)
	movq	%rax, 32(%rsp)
	movq	.LC250(%rip), %rax
	vmovdqa	%xmm0, 16(%rsp)
	movq	%rax, 48(%rsp)
	call	stbi__stdio_read
	movq	192(%rsp), %rdx
	subq	208(%rsp), %rdx
	addl	%edx, 184(%rsp)
	testl	%eax, %eax
	jne	.L6735
	movl	$0, 48(%rsp)
	leaq	57(%rsp), %rax
	movb	$0, 56(%rsp)
.L6736:
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
	je	.L6734
	movl	192(%rsp), %esi
	subl	200(%rsp), %esi
	movl	$1, %edx
	movq	%rbp, %rdi
	movslq	%esi, %rsi
	call	fseek@PLT
.L6734:
	movq	232(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L6743
	addq	$248, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%r12, %rax
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
	.p2align 4
	.p2align 3
.L6735:
	.cfi_restore_state
	cltq
	addq	%rbx, %rax
	jmp	.L6736
.L6743:
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
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rcx, %r13
	movq	%rdx, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rsi, %rbp
	leaq	.LC248(%rip), %rsi
	subq	$248, %rsp
	.cfi_def_cfa_offset 304
	movl	%r8d, %ebx
	movq	%fs:40, %rax
	movq	%rax, 232(%rsp)
	xorl	%eax, %eax
	call	fopen@PLT
	testq	%rax, %rax
	je	.L6755
	movq	%rax, %r14
	vmovdqa	stbi__stdio_callbacks(%rip), %xmm0
	movq	16+stbi__stdio_callbacks(%rip), %rax
	leaq	56(%rsp), %r15
	movl	$128, %edx
	movq	%r15, %rsi
	movq	%r14, %rdi
	movq	%r14, 40(%rsp)
	movl	$0, 184(%rsp)
	movq	%r15, 208(%rsp)
	movq	%r15, 192(%rsp)
	movq	%rax, 32(%rsp)
	movq	.LC250(%rip), %rax
	vmovdqa	%xmm0, 16(%rsp)
	movq	%rax, 48(%rsp)
	call	stbi__stdio_read
	movq	192(%rsp), %rdx
	subq	208(%rsp), %rdx
	addl	%edx, 184(%rsp)
	testl	%eax, %eax
	je	.L6756
	cltq
	addq	%r15, %rax
.L6748:
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
	je	.L6749
	movl	192(%rsp), %esi
	subl	200(%rsp), %esi
	movl	$1, %edx
	movq	%r14, %rdi
	movslq	%esi, %rsi
	call	fseek@PLT
.L6749:
	movq	%r14, %rdi
	call	fclose@PLT
.L6744:
	movq	232(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L6757
	addq	$248, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%r12, %rax
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
	.p2align 4
	.p2align 3
.L6756:
	.cfi_restore_state
	movl	$0, 48(%rsp)
	movb	$0, 56(%rsp)
	leaq	57(%rsp), %rax
	jmp	.L6748
.L6757:
	call	__stack_chk_fail@PLT
.L6755:
	leaq	.LC249(%rip), %rax
	xorl	%r12d, %r12d
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L6744
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
	vmovq	%rdi, %xmm1
	movq	%rdx, %rsi
	movq	%fs:40, %rax
	movq	%rax, 232(%rsp)
	xorl	%eax, %eax
	leaq	(%rdi,%r10), %rax
	movq	%rcx, %rdx
	movq	%rsp, %rdi
	movq	%r8, %rcx
	vpinsrq	$1, %rax, %xmm1, %xmm0
	movl	%r9d, %r8d
	movq	$0, 16(%rsp)
	movl	$0, 48(%rsp)
	movl	$0, 184(%rsp)
	vmovdqa	%xmm0, 192(%rsp)
	vmovdqa	%xmm0, 208(%rsp)
	call	stbi__load_and_postprocess_16bit
	movq	232(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L6761
	addq	$248, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L6761:
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
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movq	%rsi, %rdi
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movq	%rcx, %r12
	movq	%rdx, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movq	%r8, %r13
	movl	%r9d, %r14d
	subq	$240, %rsp
	.cfi_def_cfa_offset 288
	vmovdqu	(%rax), %xmm0
	movq	(%rax), %rcx
	movq	16(%rax), %rax
	leaq	56(%rsp), %rbx
	movq	%fs:40, %rdx
	movq	%rdx, 232(%rsp)
	xorl	%edx, %edx
	movq	%rsi, 40(%rsp)
	movl	$128, %edx
	movl	$0, 184(%rsp)
	movq	%rbx, %rsi
	movq	%rbx, 208(%rsp)
	movq	%rbx, 192(%rsp)
	movq	%rax, 32(%rsp)
	movq	.LC250(%rip), %rax
	vmovdqa	%xmm0, 16(%rsp)
	movq	%rax, 48(%rsp)
	call	*%rcx
	movq	192(%rsp), %rdx
	subq	208(%rsp), %rdx
	addl	%edx, 184(%rsp)
	testl	%eax, %eax
	jne	.L6763
	movl	$0, 48(%rsp)
	leaq	57(%rsp), %rax
	movb	$0, 56(%rsp)
.L6764:
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
	jne	.L6767
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
	.p2align 4
	.p2align 3
.L6763:
	.cfi_restore_state
	cltq
	addq	%rbx, %rax
	jmp	.L6764
.L6767:
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
	vmovq	%rdi, %xmm1
	movq	%rdx, %rsi
	movq	%fs:40, %rax
	movq	%rax, 232(%rsp)
	xorl	%eax, %eax
	leaq	(%rdi,%r10), %rax
	movq	%rcx, %rdx
	movq	%rsp, %rdi
	movq	%r8, %rcx
	vpinsrq	$1, %rax, %xmm1, %xmm0
	movl	%r9d, %r8d
	movq	$0, 16(%rsp)
	movl	$0, 48(%rsp)
	movl	$0, 184(%rsp)
	vmovdqa	%xmm0, 192(%rsp)
	vmovdqa	%xmm0, 208(%rsp)
	call	stbi__load_and_postprocess_8bit
	movq	232(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L6771
	addq	$248, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L6771:
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
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movq	%rsi, %rdi
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movq	%rcx, %r12
	movq	%rdx, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movq	%r8, %r13
	movl	%r9d, %r14d
	subq	$240, %rsp
	.cfi_def_cfa_offset 288
	vmovdqu	(%rax), %xmm0
	movq	(%rax), %rcx
	movq	16(%rax), %rax
	leaq	56(%rsp), %rbx
	movq	%fs:40, %rdx
	movq	%rdx, 232(%rsp)
	xorl	%edx, %edx
	movq	%rsi, 40(%rsp)
	movl	$128, %edx
	movl	$0, 184(%rsp)
	movq	%rbx, %rsi
	movq	%rbx, 208(%rsp)
	movq	%rbx, 192(%rsp)
	movq	%rax, 32(%rsp)
	movq	.LC250(%rip), %rax
	vmovdqa	%xmm0, 16(%rsp)
	movq	%rax, 48(%rsp)
	call	*%rcx
	movq	192(%rsp), %rdx
	subq	208(%rsp), %rdx
	addl	%edx, 184(%rsp)
	testl	%eax, %eax
	jne	.L6773
	movl	$0, 48(%rsp)
	leaq	57(%rsp), %rax
	movb	$0, 56(%rsp)
.L6774:
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
	jne	.L6777
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
	.p2align 4
	.p2align 3
.L6773:
	.cfi_restore_state
	cltq
	addq	%rbx, %rax
	jmp	.L6774
.L6777:
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
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movslq	%esi, %r10
	vmovq	%rdi, %xmm1
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%r9, %r12
	movq	%rdx, %rsi
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%r8, %rbp
	movq	%rcx, %rbx
	subq	$2360, %rsp
	.cfi_def_cfa_offset 2416
	movq	%r12, %r8
	movq	%rbp, %rcx
	movq	%rbx, %rdx
	movq	%fs:40, %rax
	movq	%rax, 2344(%rsp)
	xorl	%eax, %eax
	leaq	(%rdi,%r10), %rax
	movq	2416(%rsp), %r13
	movq	$0, 80(%rsp)
	movl	$0, 112(%rsp)
	vpinsrq	$1, %rax, %xmm1, %xmm0
	movl	$0, 248(%rsp)
	leaq	64(%rsp), %rdi
	subq	$8, %rsp
	.cfi_def_cfa_offset 2424
	vmovdqa	%xmm0, 264(%rsp)
	vmovdqa	%xmm0, 280(%rsp)
	movl	2432(%rsp), %eax
	movq	%r13, %r9
	pushq	%rax
	.cfi_def_cfa_offset 2432
	call	stbi__load_gif_main.constprop.0
	movq	%rax, 72(%rsp)
	movl	%fs:stbi__vertically_flip_on_load_set@tpoff, %r8d
	popq	%rsi
	.cfi_def_cfa_offset 2424
	popq	%rdi
	.cfi_def_cfa_offset 2416
	testl	%r8d, %r8d
	je	.L6779
	movl	%fs:stbi__vertically_flip_on_load_local@tpoff, %ecx
	testl	%ecx, %ecx
	jne	.L6780
.L6778:
	movq	2344(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L6796
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
.L6779:
	.cfi_restore_state
	movl	stbi__vertically_flip_on_load_global(%rip), %edx
	testl	%edx, %edx
	je	.L6778
.L6780:
	movslq	0(%rbp), %rax
	movslq	(%rbx), %rcx
	movslq	0(%r13), %rdx
	movl	(%r12), %edi
	movl	%eax, %esi
	imull	%ecx, %esi
	movl	%edi, 36(%rsp)
	imull	%edx, %esi
	testl	%edi, %edi
	jle	.L6778
	imulq	%rdx, %rcx
	movl	$0, 32(%rsp)
	leaq	288(%rsp), %rbp
	movq	%rcx, %r12
	movl	%eax, %ecx
	decq	%rax
	imulq	%r12, %rax
	sarl	%ecx
	movl	%ecx, 20(%rsp)
	movslq	%esi, %rcx
	movq	%rcx, 40(%rsp)
	movq	%rax, 48(%rsp)
	movq	56(%rsp), %rax
	movq	%rax, 24(%rsp)
	.p2align 4
	.p2align 3
.L6783:
	movl	20(%rsp), %eax
	testl	%eax, %eax
	jle	.L6786
	testq	%r12, %r12
	je	.L6786
	movq	24(%rsp), %rax
	movl	$0, 16(%rsp)
	movq	%rax, (%rsp)
	addq	48(%rsp), %rax
	movq	%rax, 8(%rsp)
	.p2align 4
	.p2align 3
.L6787:
	movq	(%rsp), %r14
	movq	%r12, %r13
	movq	8(%rsp), %rbx
	.p2align 4
	.p2align 3
.L6785:
	movl	$2048, %r15d
	movl	$2048, %ecx
	movq	%r14, %rsi
	movq	%rbp, %rdi
	cmpq	%r15, %r13
	cmovbe	%r13, %r15
	movq	%r15, %rdx
	call	__memcpy_chk@PLT
	movq	%rbx, %rsi
	movq	%r14, %rdi
	movq	%r15, %rdx
	call	memcpy@PLT
	movq	%rbx, %rdi
	movq	%r15, %rdx
	movq	%rbp, %rsi
	call	memcpy@PLT
	addq	%r15, %r14
	addq	%r15, %rbx
	subq	%r15, %r13
	jne	.L6785
	incl	16(%rsp)
	addq	%r12, (%rsp)
	subq	%r12, 8(%rsp)
	movl	16(%rsp), %eax
	cmpl	20(%rsp), %eax
	jne	.L6787
.L6786:
	incl	32(%rsp)
	movq	40(%rsp), %rcx
	movl	32(%rsp), %eax
	addq	%rcx, 24(%rsp)
	cmpl	%eax, 36(%rsp)
	jne	.L6783
	jmp	.L6778
.L6796:
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
	vmovq	%rdi, %xmm1
	movq	%rdx, %rsi
	movq	%fs:40, %rax
	movq	%rax, 232(%rsp)
	xorl	%eax, %eax
	leaq	(%rdi,%r10), %rax
	movq	%rcx, %rdx
	movq	%rsp, %rdi
	movq	%r8, %rcx
	vpinsrq	$1, %rax, %xmm1, %xmm0
	movl	%r9d, %r8d
	movq	$0, 16(%rsp)
	movl	$0, 48(%rsp)
	movl	$0, 184(%rsp)
	vmovdqa	%xmm0, 192(%rsp)
	vmovdqa	%xmm0, 208(%rsp)
	call	stbi__loadf_main
	movq	232(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L6800
	addq	$248, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L6800:
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
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movq	%rsi, %rdi
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movq	%rcx, %r12
	movq	%rdx, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movq	%r8, %r13
	movl	%r9d, %r14d
	subq	$240, %rsp
	.cfi_def_cfa_offset 288
	vmovdqu	(%rax), %xmm0
	movq	(%rax), %rcx
	movq	16(%rax), %rax
	leaq	56(%rsp), %rbx
	movq	%fs:40, %rdx
	movq	%rdx, 232(%rsp)
	xorl	%edx, %edx
	movq	%rsi, 40(%rsp)
	movl	$128, %edx
	movl	$0, 184(%rsp)
	movq	%rbx, %rsi
	movq	%rbx, 208(%rsp)
	movq	%rbx, 192(%rsp)
	movq	%rax, 32(%rsp)
	movq	.LC250(%rip), %rax
	vmovdqa	%xmm0, 16(%rsp)
	movq	%rax, 48(%rsp)
	call	*%rcx
	movq	192(%rsp), %rdx
	subq	208(%rsp), %rdx
	addl	%edx, 184(%rsp)
	testl	%eax, %eax
	jne	.L6802
	movl	$0, 48(%rsp)
	leaq	57(%rsp), %rax
	movb	$0, 56(%rsp)
.L6803:
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
	jne	.L6806
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
	.p2align 4
	.p2align 3
.L6802:
	.cfi_restore_state
	cltq
	addq	%rbx, %rax
	jmp	.L6803
.L6806:
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
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rcx, %r13
	movq	%rdx, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rsi, %rbp
	leaq	.LC248(%rip), %rsi
	subq	$248, %rsp
	.cfi_def_cfa_offset 304
	movl	%r8d, %ebx
	movq	%fs:40, %rax
	movq	%rax, 232(%rsp)
	xorl	%eax, %eax
	call	fopen@PLT
	testq	%rax, %rax
	je	.L6814
	movq	%rax, %r14
	vmovdqa	stbi__stdio_callbacks(%rip), %xmm0
	movq	16+stbi__stdio_callbacks(%rip), %rax
	leaq	56(%rsp), %r15
	movl	$128, %edx
	movq	%r15, %rsi
	movq	%r14, %rdi
	movq	%r14, 40(%rsp)
	movl	$0, 184(%rsp)
	movq	%r15, 208(%rsp)
	movq	%r15, 192(%rsp)
	movq	%rax, 32(%rsp)
	movq	.LC250(%rip), %rax
	vmovdqa	%xmm0, 16(%rsp)
	movq	%rax, 48(%rsp)
	call	stbi__stdio_read
	movq	192(%rsp), %rdx
	subq	208(%rsp), %rdx
	addl	%edx, 184(%rsp)
	testl	%eax, %eax
	je	.L6815
	cltq
	addq	%r15, %rax
.L6811:
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
.L6807:
	movq	232(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L6816
	addq	$248, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%r12, %rax
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
	.p2align 4
	.p2align 3
.L6815:
	.cfi_restore_state
	movl	$0, 48(%rsp)
	movb	$0, 56(%rsp)
	leaq	57(%rsp), %rax
	jmp	.L6811
.L6816:
	call	__stack_chk_fail@PLT
.L6814:
	leaq	.LC249(%rip), %rax
	xorl	%r12d, %r12d
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L6807
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
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movl	%r8d, %r14d
	movq	%rcx, %r13
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movq	%rdx, %r12
	movq	%rsi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movl	$128, %edx
	subq	$240, %rsp
	.cfi_def_cfa_offset 288
	vmovdqa	stbi__stdio_callbacks(%rip), %xmm0
	movq	%fs:40, %rax
	movq	%rax, 232(%rsp)
	xorl	%eax, %eax
	movq	16+stbi__stdio_callbacks(%rip), %rax
	leaq	56(%rsp), %rbx
	movq	%rdi, 40(%rsp)
	movl	$0, 184(%rsp)
	movq	%rbx, %rsi
	movq	%rbx, 208(%rsp)
	movq	%rbx, 192(%rsp)
	movq	%rax, 32(%rsp)
	movq	.LC250(%rip), %rax
	vmovdqa	%xmm0, 16(%rsp)
	movq	%rax, 48(%rsp)
	call	stbi__stdio_read
	movq	192(%rsp), %rdx
	subq	208(%rsp), %rdx
	addl	%edx, 184(%rsp)
	testl	%eax, %eax
	jne	.L6818
	movl	$0, 48(%rsp)
	leaq	57(%rsp), %rax
	movb	$0, 56(%rsp)
.L6819:
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
	jne	.L6822
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
	.p2align 4
	.p2align 3
.L6818:
	.cfi_restore_state
	cltq
	addq	%rbx, %rax
	jmp	.L6819
.L6822:
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
	movslq	%esi, %rsi
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	vmovq	%rdi, %xmm1
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	addq	%rdi, %rsi
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	leaq	1+.LC103(%rip), %rbp
	subq	$248, %rsp
	.cfi_def_cfa_offset 288
	vpinsrq	$1, %rsi, %xmm1, %xmm0
	movl	$35, %ebx
	movq	%fs:40, %rax
	movq	%rax, 232(%rsp)
	xorl	%eax, %eax
	leaq	56(%rsp), %r13
	movq	$0, 16(%rsp)
	movl	$0, 48(%rsp)
	leaq	57(%rsp), %r12
	movl	$0, 184(%rsp)
	vmovdqa	%xmm0, 192(%rsp)
	vmovdqa	%xmm0, 208(%rsp)
	jmp	.L6829
	.p2align 4
	.p2align 3
.L6824:
	movl	48(%rsp), %eax
	testl	%eax, %eax
	jne	.L6848
.L6825:
	cmpl	%eax, %ebx
	jne	.L6828
.L6849:
	movsbl	0(%rbp), %ebx
	incq	%rbp
	testb	%bl, %bl
	je	.L6836
.L6829:
	cmpq	%rsi, %rdi
	jnb	.L6824
	leaq	1(%rdi), %rdx
	movq	%rdx, 192(%rsp)
	movzbl	(%rdi), %eax
	movq	%rdx, %rdi
	cmpl	%eax, %ebx
	je	.L6849
.L6828:
	vmovdqa	208(%rsp), %xmm2
	movq	216(%rsp), %rcx
	leaq	1+.LC104(%rip), %rbp
	movl	$35, %ebx
	movq	208(%rsp), %rdx
	leaq	56(%rsp), %r13
	leaq	57(%rsp), %r12
	vmovdqa	%xmm2, 192(%rsp)
	jmp	.L6835
	.p2align 4
	.p2align 3
.L6831:
	movl	48(%rsp), %eax
	testl	%eax, %eax
	jne	.L6850
.L6832:
	cmpl	%ebx, %eax
	jne	.L6838
.L6851:
	movsbl	0(%rbp), %ebx
	incq	%rbp
	testb	%bl, %bl
	je	.L6836
.L6835:
	cmpq	%rdx, %rcx
	jbe	.L6831
	leaq	1(%rdx), %rsi
	movq	%rsi, 192(%rsp)
	movzbl	(%rdx), %eax
	movq	%rsi, %rdx
	cmpl	%ebx, %eax
	je	.L6851
.L6838:
	xorl	%eax, %eax
	jmp	.L6823
	.p2align 4
	.p2align 3
.L6848:
	movl	52(%rsp), %edx
	movq	40(%rsp), %rdi
	movq	%r13, %rsi
	call	*16(%rsp)
	movq	192(%rsp), %rdx
	subq	208(%rsp), %rdx
	addl	%edx, 184(%rsp)
	testl	%eax, %eax
	jne	.L6826
	movl	$0, 48(%rsp)
	movq	%r12, %rsi
	movb	$0, 56(%rsp)
.L6827:
	movq	%rsi, 200(%rsp)
	movq	%r12, 192(%rsp)
	movq	%r12, %rdi
	jmp	.L6825
	.p2align 4
	.p2align 3
.L6836:
	movl	$1, %eax
.L6823:
	movq	232(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L6852
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
	.p2align 4
	.p2align 3
.L6826:
	.cfi_restore_state
	cltq
	leaq	0(%r13,%rax), %rsi
	movzbl	56(%rsp), %eax
	jmp	.L6827
	.p2align 4
	.p2align 3
.L6850:
	movl	52(%rsp), %edx
	movq	40(%rsp), %rdi
	movq	%r13, %rsi
	call	*16(%rsp)
	movq	192(%rsp), %rdx
	subq	208(%rsp), %rdx
	addl	%edx, 184(%rsp)
	testl	%eax, %eax
	je	.L6853
	cltq
	leaq	0(%r13,%rax), %rcx
	movzbl	56(%rsp), %eax
.L6834:
	movq	%rcx, 200(%rsp)
	movq	%r12, 192(%rsp)
	movq	%r12, %rdx
	jmp	.L6832
	.p2align 4
	.p2align 3
.L6853:
	movl	$0, 48(%rsp)
	movb	$0, 56(%rsp)
	movq	%r12, %rcx
	jmp	.L6834
.L6852:
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
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	leaq	.LC248(%rip), %rsi
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
	je	.L6872
	movq	%rax, %rdi
	movq	%rax, %rbp
	leaq	56(%rsp), %r14
	call	ftell@PLT
	vmovdqa	stbi__stdio_callbacks(%rip), %xmm0
	movl	$128, %edx
	movq	%r14, %rsi
	movq	%rax, %r12
	movq	16+stbi__stdio_callbacks(%rip), %rax
	movq	%rbp, %rdi
	movq	%rbp, 40(%rsp)
	movl	$0, 184(%rsp)
	movq	%r14, 208(%rsp)
	movq	%r14, 192(%rsp)
	movq	%rax, 32(%rsp)
	movq	.LC250(%rip), %rax
	vmovdqa	%xmm0, 16(%rsp)
	movq	%rax, 48(%rsp)
	call	stbi__stdio_read
	movq	192(%rsp), %rdx
	subq	208(%rsp), %rdx
	addl	%edx, 184(%rsp)
	testl	%eax, %eax
	je	.L6883
	cltq
	leaq	(%r14,%rax), %rcx
.L6857:
	movq	%r14, 192(%rsp)
	leaq	56(%rsp), %r14
	movq	%rcx, 200(%rsp)
	leaq	1+.LC103(%rip), %r13
	movq	%rcx, 216(%rsp)
	movq	%r14, %rdx
	movl	$35, %ebx
	leaq	57(%rsp), %r15
	jmp	.L6863
	.p2align 4
	.p2align 3
.L6858:
	movl	48(%rsp), %eax
	testl	%eax, %eax
	jne	.L6884
.L6859:
	cmpl	%eax, %ebx
	jne	.L6862
.L6886:
	movsbl	0(%r13), %ebx
	incq	%r13
	testb	%bl, %bl
	je	.L6885
.L6863:
	cmpq	%rdx, %rcx
	jbe	.L6858
	leaq	1(%rdx), %rsi
	movq	%rsi, 192(%rsp)
	movzbl	(%rdx), %eax
	movq	%rsi, %rdx
	cmpl	%eax, %ebx
	je	.L6886
.L6862:
	vmovdqa	208(%rsp), %xmm1
	movq	216(%rsp), %rdx
	leaq	1+.LC104(%rip), %r13
	movl	$35, %ebx
	movq	208(%rsp), %rax
	leaq	57(%rsp), %r15
	vmovdqa	%xmm1, 192(%rsp)
	jmp	.L6870
	.p2align 4
	.p2align 3
.L6865:
	movl	48(%rsp), %eax
	testl	%eax, %eax
	jne	.L6887
.L6866:
	cmpl	%ebx, %eax
	jne	.L6873
.L6888:
	movsbl	0(%r13), %ebx
	incq	%r13
	testb	%bl, %bl
	je	.L6874
	movq	192(%rsp), %rax
	movq	200(%rsp), %rdx
.L6870:
	cmpq	%rdx, %rax
	jnb	.L6865
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rsp)
	movzbl	(%rax), %eax
	cmpl	%ebx, %eax
	je	.L6888
.L6873:
	xorl	%r13d, %r13d
.L6869:
	movq	208(%rsp), %rax
	movq	%rax, 192(%rsp)
	movq	216(%rsp), %rax
	jmp	.L6864
	.p2align 4
	.p2align 3
.L6883:
	movl	$0, 48(%rsp)
	movb	$0, 56(%rsp)
	leaq	57(%rsp), %rcx
	jmp	.L6857
	.p2align 4
	.p2align 3
.L6884:
	movl	52(%rsp), %edx
	movq	40(%rsp), %rdi
	movq	%r14, %rsi
	call	*16(%rsp)
	movq	192(%rsp), %rdx
	subq	208(%rsp), %rdx
	addl	%edx, 184(%rsp)
	testl	%eax, %eax
	jne	.L6860
	movl	$0, 48(%rsp)
	movq	%r15, %rcx
	movb	$0, 56(%rsp)
.L6861:
	movq	%rcx, 200(%rsp)
	movq	%r15, 192(%rsp)
	movq	%r15, %rdx
	jmp	.L6859
	.p2align 4
	.p2align 3
.L6860:
	cltq
	leaq	(%r14,%rax), %rcx
	movzbl	56(%rsp), %eax
	jmp	.L6861
	.p2align 4
	.p2align 3
.L6885:
	movq	208(%rsp), %rax
	movl	$1, %r13d
	movq	%rax, 192(%rsp)
	movq	216(%rsp), %rax
.L6864:
	movq	%rbp, %rdi
	xorl	%edx, %edx
	movq	%r12, %rsi
	movq	%rax, 200(%rsp)
	call	fseek@PLT
	movq	%rbp, %rdi
	call	fclose@PLT
.L6854:
	movq	232(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L6889
	addq	$248, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movl	%r13d, %eax
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
	.p2align 4
	.p2align 3
.L6887:
	.cfi_restore_state
	movl	52(%rsp), %edx
	movq	40(%rsp), %rdi
	movq	%r14, %rsi
	call	*16(%rsp)
	movq	192(%rsp), %rdx
	subq	208(%rsp), %rdx
	addl	%edx, 184(%rsp)
	testl	%eax, %eax
	je	.L6890
	cltq
	leaq	(%r14,%rax), %rdx
	movzbl	56(%rsp), %eax
.L6868:
	movq	%rdx, 200(%rsp)
	movq	%r15, 192(%rsp)
	jmp	.L6866
	.p2align 4
	.p2align 3
.L6890:
	movl	$0, 48(%rsp)
	movb	$0, 56(%rsp)
	movq	%r15, %rdx
	jmp	.L6868
	.p2align 4
	.p2align 3
.L6874:
	movl	$1, %r13d
	jmp	.L6869
.L6889:
	call	__stack_chk_fail@PLT
.L6872:
	xorl	%r13d, %r13d
	jmp	.L6854
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
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbp
	subq	$248, %rsp
	.cfi_def_cfa_offset 304
	movq	%fs:40, %rax
	movq	%rax, 232(%rsp)
	xorl	%eax, %eax
	call	ftell@PLT
	vmovdqa	stbi__stdio_callbacks(%rip), %xmm0
	leaq	56(%rsp), %r14
	movl	$128, %edx
	movq	%rax, %r12
	movq	16+stbi__stdio_callbacks(%rip), %rax
	movq	%r14, %rsi
	movq	%rbp, %rdi
	movq	%rbp, 40(%rsp)
	movl	$0, 184(%rsp)
	movq	%r14, 208(%rsp)
	movq	%r14, 192(%rsp)
	movq	%rax, 32(%rsp)
	movq	.LC250(%rip), %rax
	vmovdqa	%xmm0, 16(%rsp)
	movq	%rax, 48(%rsp)
	call	stbi__stdio_read
	movq	192(%rsp), %rdx
	subq	208(%rsp), %rdx
	addl	%edx, 184(%rsp)
	testl	%eax, %eax
	jne	.L6892
	movl	$0, 48(%rsp)
	leaq	57(%rsp), %rcx
	movb	$0, 56(%rsp)
.L6893:
	movq	%r14, 192(%rsp)
	leaq	56(%rsp), %r14
	movq	%rcx, 200(%rsp)
	leaq	1+.LC103(%rip), %r13
	movq	%rcx, 216(%rsp)
	movq	%r14, %rdx
	movl	$35, %ebx
	leaq	57(%rsp), %r15
	jmp	.L6899
	.p2align 4
	.p2align 3
.L6894:
	movl	48(%rsp), %eax
	testl	%eax, %eax
	jne	.L6918
.L6895:
	cmpl	%eax, %ebx
	jne	.L6898
.L6920:
	movsbl	0(%r13), %ebx
	incq	%r13
	testb	%bl, %bl
	je	.L6919
.L6899:
	cmpq	%rdx, %rcx
	jbe	.L6894
	leaq	1(%rdx), %rsi
	movq	%rsi, 192(%rsp)
	movzbl	(%rdx), %eax
	movq	%rsi, %rdx
	cmpl	%eax, %ebx
	je	.L6920
.L6898:
	vmovdqa	208(%rsp), %xmm1
	movq	216(%rsp), %rdx
	leaq	1+.LC104(%rip), %r13
	movl	$35, %ebx
	movq	208(%rsp), %rax
	leaq	57(%rsp), %r15
	vmovdqa	%xmm1, 192(%rsp)
	jmp	.L6906
	.p2align 4
	.p2align 3
.L6901:
	movl	48(%rsp), %eax
	testl	%eax, %eax
	jne	.L6921
.L6902:
	cmpl	%ebx, %eax
	jne	.L6908
.L6922:
	movsbl	0(%r13), %ebx
	incq	%r13
	testb	%bl, %bl
	je	.L6909
	movq	192(%rsp), %rax
	movq	200(%rsp), %rdx
.L6906:
	cmpq	%rdx, %rax
	jnb	.L6901
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rsp)
	movzbl	(%rax), %eax
	cmpl	%ebx, %eax
	je	.L6922
.L6908:
	xorl	%r13d, %r13d
.L6905:
	movq	208(%rsp), %rax
	movq	%rax, 192(%rsp)
	movq	216(%rsp), %rax
	jmp	.L6900
	.p2align 4
	.p2align 3
.L6918:
	movl	52(%rsp), %edx
	movq	40(%rsp), %rdi
	movq	%r14, %rsi
	call	*16(%rsp)
	movq	192(%rsp), %rdx
	subq	208(%rsp), %rdx
	addl	%edx, 184(%rsp)
	testl	%eax, %eax
	jne	.L6896
	movl	$0, 48(%rsp)
	movq	%r15, %rcx
	movb	$0, 56(%rsp)
.L6897:
	movq	%rcx, 200(%rsp)
	movq	%r15, 192(%rsp)
	movq	%r15, %rdx
	jmp	.L6895
	.p2align 4
	.p2align 3
.L6896:
	cltq
	leaq	(%r14,%rax), %rcx
	movzbl	56(%rsp), %eax
	jmp	.L6897
	.p2align 4
	.p2align 3
.L6919:
	movq	208(%rsp), %rax
	movl	$1, %r13d
	movq	%rax, 192(%rsp)
	movq	216(%rsp), %rax
.L6900:
	xorl	%edx, %edx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	movq	%rax, 200(%rsp)
	call	fseek@PLT
	movq	232(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L6923
	addq	$248, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movl	%r13d, %eax
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
	.p2align 4
	.p2align 3
.L6892:
	.cfi_restore_state
	cltq
	leaq	(%r14,%rax), %rcx
	jmp	.L6893
	.p2align 4
	.p2align 3
.L6921:
	movl	52(%rsp), %edx
	movq	40(%rsp), %rdi
	movq	%r14, %rsi
	call	*16(%rsp)
	movq	192(%rsp), %rdx
	subq	208(%rsp), %rdx
	addl	%edx, 184(%rsp)
	testl	%eax, %eax
	je	.L6924
	cltq
	leaq	(%r14,%rax), %rdx
	movzbl	56(%rsp), %eax
.L6904:
	movq	%rdx, 200(%rsp)
	movq	%r15, 192(%rsp)
	jmp	.L6902
	.p2align 4
	.p2align 3
.L6924:
	movl	$0, 48(%rsp)
	movb	$0, 56(%rsp)
	movq	%r15, %rdx
	jmp	.L6904
	.p2align 4
	.p2align 3
.L6909:
	movl	$1, %r13d
	jmp	.L6905
.L6923:
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
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movq	%rsi, %rdi
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$248, %rsp
	.cfi_def_cfa_offset 288
	vmovdqu	(%rax), %xmm0
	movq	(%rax), %rcx
	movq	16(%rax), %rax
	leaq	56(%rsp), %r12
	movq	%fs:40, %rdx
	movq	%rdx, 232(%rsp)
	xorl	%edx, %edx
	movq	%rsi, 40(%rsp)
	movl	$128, %edx
	movl	$0, 184(%rsp)
	movq	%r12, %rsi
	movq	%r12, 208(%rsp)
	movq	%r12, 192(%rsp)
	movq	%rax, 32(%rsp)
	movq	.LC250(%rip), %rax
	vmovdqa	%xmm0, 16(%rsp)
	movq	%rax, 48(%rsp)
	call	*%rcx
	movq	192(%rsp), %rdx
	subq	208(%rsp), %rdx
	addl	%edx, 184(%rsp)
	testl	%eax, %eax
	jne	.L6926
	movl	$0, 48(%rsp)
	leaq	57(%rsp), %rcx
	movb	$0, 56(%rsp)
.L6927:
	movq	%r12, 192(%rsp)
	leaq	56(%rsp), %r12
	movq	%rcx, 200(%rsp)
	leaq	1+.LC103(%rip), %rbp
	movq	%rcx, 216(%rsp)
	movq	%r12, %rdx
	movl	$35, %ebx
	leaq	57(%rsp), %r13
	jmp	.L6933
	.p2align 4
	.p2align 3
.L6928:
	movl	48(%rsp), %eax
	testl	%eax, %eax
	jne	.L6952
.L6929:
	cmpl	%eax, %ebx
	jne	.L6932
.L6953:
	movsbl	0(%rbp), %ebx
	incq	%rbp
	testb	%bl, %bl
	je	.L6940
.L6933:
	cmpq	%rdx, %rcx
	jbe	.L6928
	leaq	1(%rdx), %rsi
	movq	%rsi, 192(%rsp)
	movzbl	(%rdx), %eax
	movq	%rsi, %rdx
	cmpl	%eax, %ebx
	je	.L6953
.L6932:
	vmovdqa	208(%rsp), %xmm1
	movq	216(%rsp), %rcx
	leaq	1+.LC104(%rip), %rbp
	movl	$35, %ebx
	movq	208(%rsp), %rdx
	leaq	57(%rsp), %r13
	vmovdqa	%xmm1, 192(%rsp)
	jmp	.L6939
	.p2align 4
	.p2align 3
.L6935:
	movl	48(%rsp), %eax
	testl	%eax, %eax
	jne	.L6954
.L6936:
	cmpl	%ebx, %eax
	jne	.L6942
.L6955:
	movsbl	0(%rbp), %ebx
	incq	%rbp
	testb	%bl, %bl
	je	.L6940
.L6939:
	cmpq	%rcx, %rdx
	jnb	.L6935
	leaq	1(%rdx), %rsi
	movq	%rsi, 192(%rsp)
	movzbl	(%rdx), %eax
	movq	%rsi, %rdx
	cmpl	%ebx, %eax
	je	.L6955
.L6942:
	xorl	%eax, %eax
	jmp	.L6925
	.p2align 4
	.p2align 3
.L6952:
	movl	52(%rsp), %edx
	movq	40(%rsp), %rdi
	movq	%r12, %rsi
	call	*16(%rsp)
	movq	192(%rsp), %rdx
	subq	208(%rsp), %rdx
	addl	%edx, 184(%rsp)
	testl	%eax, %eax
	jne	.L6930
	movl	$0, 48(%rsp)
	movq	%r13, %rcx
	movb	$0, 56(%rsp)
.L6931:
	movq	%rcx, 200(%rsp)
	movq	%r13, 192(%rsp)
	movq	%r13, %rdx
	jmp	.L6929
	.p2align 4
	.p2align 3
.L6940:
	movl	$1, %eax
.L6925:
	movq	232(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L6956
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
	.p2align 4
	.p2align 3
.L6930:
	.cfi_restore_state
	cltq
	leaq	(%r12,%rax), %rcx
	movzbl	56(%rsp), %eax
	jmp	.L6931
	.p2align 4
	.p2align 3
.L6926:
	cltq
	leaq	(%r12,%rax), %rcx
	jmp	.L6927
	.p2align 4
	.p2align 3
.L6954:
	movl	52(%rsp), %edx
	movq	40(%rsp), %rdi
	movq	%r12, %rsi
	call	*16(%rsp)
	movq	192(%rsp), %rdx
	subq	208(%rsp), %rdx
	addl	%edx, 184(%rsp)
	testl	%eax, %eax
	je	.L6957
	cltq
	leaq	(%r12,%rax), %rcx
	movzbl	56(%rsp), %eax
.L6938:
	movq	%rcx, 200(%rsp)
	movq	%r13, 192(%rsp)
	movq	%r13, %rdx
	jmp	.L6936
	.p2align 4
	.p2align 3
.L6957:
	movl	$0, 48(%rsp)
	movb	$0, 56(%rsp)
	movq	%r13, %rcx
	jmp	.L6938
.L6956:
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
	vmovss	.LC57(%rip), %xmm1
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
	vmovss	.LC57(%rip), %xmm1
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
	movslq	%esi, %rbx
	movq	%rcx, %rbp
	movq	%r13, %rdi
	movq	%fs:40, %rax
	movq	%rax, 4104(%rsp)
	xorl	%eax, %eax
	call	malloc@PLT
	testq	%rax, %rax
	je	.L6962
	addq	%r12, %rbx
	vmovq	%rax, %xmm2
	vmovq	%r12, %xmm3
	addq	%r13, %rax
	vpunpcklqdq	%xmm2, %xmm2, %xmm1
	vpinsrq	$1, %rbx, %xmm3, %xmm0
	movq	%rsp, %rdi
	movl	$1, %esi
	vmovdqa	%xmm0, (%rsp)
	vmovdqu	%xmm1, 24(%rsp)
	movq	%rax, 40(%rsp)
	movl	$1, 48(%rsp)
	call	stbi__parse_zlib
	testl	%eax, %eax
	je	.L6964
	movq	32(%rsp), %rax
	testq	%rbp, %rbp
	je	.L6962
	movq	24(%rsp), %rdx
	subq	%rax, %rdx
	movl	%edx, 0(%rbp)
.L6962:
	movq	4104(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L6974
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
	.p2align 4
	.p2align 3
.L6964:
	.cfi_restore_state
	movq	32(%rsp), %rdi
	call	free@PLT
	xorl	%eax, %eax
	jmp	.L6962
.L6974:
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
	movslq	%esi, %rbx
	movq	%rcx, %rbp
	movq	%r13, %rdi
	movl	%r8d, %r14d
	movq	%fs:40, %rax
	movq	%rax, 4104(%rsp)
	xorl	%eax, %eax
	call	malloc@PLT
	testq	%rax, %rax
	je	.L6976
	addq	%r12, %rbx
	vmovq	%rax, %xmm2
	vmovq	%r12, %xmm3
	addq	%r13, %rax
	vpunpcklqdq	%xmm2, %xmm2, %xmm1
	vpinsrq	$1, %rbx, %xmm3, %xmm0
	movq	%rsp, %rdi
	movl	%r14d, %esi
	vmovdqa	%xmm0, (%rsp)
	vmovdqu	%xmm1, 24(%rsp)
	movq	%rax, 40(%rsp)
	movl	$1, 48(%rsp)
	call	stbi__parse_zlib
	testl	%eax, %eax
	je	.L6978
	movq	32(%rsp), %rax
	testq	%rbp, %rbp
	je	.L6976
	movq	24(%rsp), %rdx
	subq	%rax, %rdx
	movl	%edx, 0(%rbp)
.L6976:
	movq	4104(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L6988
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
	.p2align 4
	.p2align 3
.L6978:
	.cfi_restore_state
	movq	32(%rsp), %rdi
	call	free@PLT
	xorl	%eax, %eax
	jmp	.L6976
.L6988:
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
	movslq	%esi, %rsi
	vmovq	%rdi, %xmm2
	vmovq	%rdx, %xmm1
	movq	%fs:40, %rax
	movq	%rax, 4104(%rsp)
	xorl	%eax, %eax
	leaq	(%rdx,%rcx), %rax
	addq	%rsi, %rdi
	movl	$1, %esi
	movl	$0, 48(%rsp)
	vpinsrq	$1, %rax, %xmm1, %xmm0
	movq	%rdi, 40(%rsp)
	movq	%rsp, %rdi
	vmovdqa	%xmm0, (%rsp)
	vpunpcklqdq	%xmm2, %xmm2, %xmm0
	vmovdqu	%xmm0, 24(%rsp)
	call	stbi__parse_zlib
	testl	%eax, %eax
	je	.L6992
	movq	24(%rsp), %rax
	subl	32(%rsp), %eax
.L6989:
	movq	4104(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L6994
	addq	$4120, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4
	.p2align 3
.L6992:
	.cfi_restore_state
	movl	$-1, %eax
	jmp	.L6989
.L6994:
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
	movl	%esi, %r12d
	movq	%rdx, %rbx
	movq	%fs:40, %rax
	movq	%rax, 4104(%rsp)
	xorl	%eax, %eax
	call	malloc@PLT
	testq	%rax, %rax
	je	.L6995
	movslq	%r12d, %rdx
	vmovq	%rax, %xmm2
	xorl	%esi, %esi
	addq	$16384, %rax
	addq	%rbp, %rdx
	vpunpcklqdq	%xmm2, %xmm2, %xmm1
	vmovq	%rbp, %xmm3
	movq	%rsp, %rdi
	vpinsrq	$1, %rdx, %xmm3, %xmm0
	vmovdqu	%xmm1, 24(%rsp)
	movq	%rax, 40(%rsp)
	vmovdqa	%xmm0, (%rsp)
	movl	$1, 48(%rsp)
	call	stbi__parse_zlib
	testl	%eax, %eax
	je	.L6997
	movq	32(%rsp), %rax
	testq	%rbx, %rbx
	je	.L6995
	movq	24(%rsp), %rdx
	subq	%rax, %rdx
	movl	%edx, (%rbx)
.L6995:
	movq	4104(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L7007
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
	.p2align 4
	.p2align 3
.L6997:
	.cfi_restore_state
	movq	32(%rsp), %rdi
	call	free@PLT
	xorl	%eax, %eax
	jmp	.L6995
.L7007:
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
	movslq	%esi, %rsi
	vmovq	%rdi, %xmm2
	vmovq	%rdx, %xmm1
	movq	%fs:40, %rax
	movq	%rax, 4104(%rsp)
	xorl	%eax, %eax
	leaq	(%rdx,%rcx), %rax
	addq	%rsi, %rdi
	xorl	%esi, %esi
	movl	$0, 48(%rsp)
	vpinsrq	$1, %rax, %xmm1, %xmm0
	movq	%rdi, 40(%rsp)
	movq	%rsp, %rdi
	vmovdqa	%xmm0, (%rsp)
	vpunpcklqdq	%xmm2, %xmm2, %xmm0
	vmovdqu	%xmm0, 24(%rsp)
	call	stbi__parse_zlib
	testl	%eax, %eax
	je	.L7011
	movq	24(%rsp), %rax
	subl	32(%rsp), %eax
.L7008:
	movq	4104(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L7013
	addq	$4120, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4
	.p2align 3
.L7011:
	.cfi_restore_state
	movl	$-1, %eax
	jmp	.L7008
.L7013:
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
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rsi, %r12
	leaq	.LC248(%rip), %rsi
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdx, %r13
	subq	$248, %rsp
	.cfi_def_cfa_offset 304
	movq	%fs:40, %rax
	movq	%rax, 232(%rsp)
	xorl	%eax, %eax
	call	fopen@PLT
	testq	%rax, %rax
	je	.L7025
	movq	%rax, %rdi
	movq	%rax, %rbp
	leaq	56(%rsp), %rbx
	call	ftell@PLT
	vmovdqa	stbi__stdio_callbacks(%rip), %xmm0
	movl	$128, %edx
	movq	%rbx, %rsi
	movq	%rax, %r15
	movq	16+stbi__stdio_callbacks(%rip), %rax
	movq	%rbp, %rdi
	movq	%rbp, 40(%rsp)
	movl	$0, 184(%rsp)
	movq	%rbx, 208(%rsp)
	movq	%rbx, 192(%rsp)
	movq	%rax, 32(%rsp)
	movq	.LC250(%rip), %rax
	vmovdqa	%xmm0, 16(%rsp)
	movq	%rax, 48(%rsp)
	call	stbi__stdio_read
	movq	192(%rsp), %rdx
	subq	208(%rsp), %rdx
	addl	%edx, 184(%rsp)
	testl	%eax, %eax
	je	.L7026
	cltq
	addq	%rbx, %rax
.L7022:
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
.L7018:
	movq	232(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L7027
	addq	$248, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movl	%r12d, %eax
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
	.p2align 4
	.p2align 3
.L7026:
	.cfi_restore_state
	movl	$0, 48(%rsp)
	movb	$0, 56(%rsp)
	leaq	57(%rsp), %rax
	jmp	.L7022
.L7027:
	call	__stack_chk_fail@PLT
.L7025:
	leaq	.LC249(%rip), %rax
	xorl	%r12d, %r12d
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L7018
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
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rcx, %r15
	movq	%rdx, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rsi, %r13
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbp
	subq	$248, %rsp
	.cfi_def_cfa_offset 304
	movq	%fs:40, %rax
	movq	%rax, 232(%rsp)
	xorl	%eax, %eax
	call	ftell@PLT
	vmovdqa	stbi__stdio_callbacks(%rip), %xmm0
	leaq	56(%rsp), %rbx
	movl	$128, %edx
	movq	%rax, %r12
	movq	16+stbi__stdio_callbacks(%rip), %rax
	movq	%rbx, %rsi
	movq	%rbp, %rdi
	movq	%rbp, 40(%rsp)
	movl	$0, 184(%rsp)
	movq	%rbx, 208(%rsp)
	movq	%rbx, 192(%rsp)
	movq	%rax, 32(%rsp)
	movq	.LC250(%rip), %rax
	vmovdqa	%xmm0, 16(%rsp)
	movq	%rax, 48(%rsp)
	call	stbi__stdio_read
	movq	192(%rsp), %rdx
	subq	208(%rsp), %rdx
	addl	%edx, 184(%rsp)
	testl	%eax, %eax
	jne	.L7029
	movl	$0, 48(%rsp)
	leaq	57(%rsp), %rax
	movb	$0, 56(%rsp)
.L7030:
	movq	%r13, %rsi
	movq	%rsp, %rdi
	movq	%r15, %rcx
	movq	%r14, %rdx
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
	jne	.L7033
	addq	$248, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movl	%r13d, %eax
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
	.p2align 4
	.p2align 3
.L7029:
	.cfi_restore_state
	cltq
	addq	%rbx, %rax
	jmp	.L7030
.L7033:
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
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	leaq	.LC248(%rip), %rsi
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
	je	.L7041
	movq	%rax, %rdi
	movq	%rax, %rbp
	leaq	56(%rsp), %rbx
	call	ftell@PLT
	vmovdqa	stbi__stdio_callbacks(%rip), %xmm0
	movl	$128, %edx
	movq	%rbx, %rsi
	movq	%rax, %r12
	movq	16+stbi__stdio_callbacks(%rip), %rax
	movq	%rbp, %rdi
	movq	%rbp, 40(%rsp)
	movl	$0, 184(%rsp)
	movq	%rbx, 208(%rsp)
	movq	%rbx, 192(%rsp)
	movq	%rax, 32(%rsp)
	movq	.LC250(%rip), %rax
	vmovdqa	%xmm0, 16(%rsp)
	movq	%rax, 48(%rsp)
	call	stbi__stdio_read
	movq	192(%rsp), %rdx
	subq	208(%rsp), %rdx
	addl	%edx, 184(%rsp)
	testl	%eax, %eax
	je	.L7042
	cltq
	addq	%rbx, %rax
.L7038:
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
.L7034:
	movq	232(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L7043
	addq	$248, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	movl	%r13d, %eax
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4
	.p2align 3
.L7042:
	.cfi_restore_state
	movl	$0, 48(%rsp)
	movb	$0, 56(%rsp)
	leaq	57(%rsp), %rax
	jmp	.L7038
.L7043:
	call	__stack_chk_fail@PLT
.L7041:
	leaq	.LC249(%rip), %rax
	xorl	%r13d, %r13d
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L7034
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
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%rdi, %rbp
	subq	$248, %rsp
	.cfi_def_cfa_offset 288
	movq	%fs:40, %rax
	movq	%rax, 232(%rsp)
	xorl	%eax, %eax
	call	ftell@PLT
	vmovdqa	stbi__stdio_callbacks(%rip), %xmm0
	leaq	56(%rsp), %rbx
	movl	$128, %edx
	movq	%rax, %r12
	movq	16+stbi__stdio_callbacks(%rip), %rax
	movq	%rbx, %rsi
	movq	%rbp, %rdi
	movq	%rbp, 40(%rsp)
	movl	$0, 184(%rsp)
	movq	%rbx, 208(%rsp)
	movq	%rbx, 192(%rsp)
	movq	%rax, 32(%rsp)
	movq	.LC250(%rip), %rax
	vmovdqa	%xmm0, 16(%rsp)
	movq	%rax, 48(%rsp)
	call	stbi__stdio_read
	movq	192(%rsp), %rdx
	subq	208(%rsp), %rdx
	addl	%edx, 184(%rsp)
	testl	%eax, %eax
	jne	.L7045
	movl	$0, 48(%rsp)
	leaq	57(%rsp), %rax
	movb	$0, 56(%rsp)
.L7046:
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
	jne	.L7049
	addq	$248, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	movl	%r13d, %eax
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4
	.p2align 3
.L7045:
	.cfi_restore_state
	cltq
	addq	%rbx, %rax
	jmp	.L7046
.L7049:
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
	vmovq	%rdi, %xmm1
	movq	%rdx, %rsi
	movq	%fs:40, %rax
	movq	%rax, 232(%rsp)
	xorl	%eax, %eax
	leaq	(%rdi,%r9), %rax
	movq	%rcx, %rdx
	movq	%rsp, %rdi
	movq	%r8, %rcx
	vpinsrq	$1, %rax, %xmm1, %xmm0
	movq	$0, 16(%rsp)
	movl	$0, 48(%rsp)
	movl	$0, 184(%rsp)
	vmovdqa	%xmm0, 192(%rsp)
	vmovdqa	%xmm0, 208(%rsp)
	call	stbi__info_main
	movq	232(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L7053
	addq	$248, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L7053:
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
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movq	%rcx, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%rdx, %rbp
	movq	%rsi, %rdi
	subq	$248, %rsp
	.cfi_def_cfa_offset 288
	vmovdqu	(%rax), %xmm0
	movq	(%rax), %rcx
	movq	%r8, %r13
	movq	16(%rax), %rax
	leaq	56(%rsp), %rbx
	movq	%fs:40, %rdx
	movq	%rdx, 232(%rsp)
	xorl	%edx, %edx
	movq	%rsi, 40(%rsp)
	movl	$128, %edx
	movl	$0, 184(%rsp)
	movq	%rbx, %rsi
	movq	%rbx, 208(%rsp)
	movq	%rbx, 192(%rsp)
	movq	%rax, 32(%rsp)
	movq	.LC250(%rip), %rax
	vmovdqa	%xmm0, 16(%rsp)
	movq	%rax, 48(%rsp)
	call	*%rcx
	movq	192(%rsp), %rdx
	subq	208(%rsp), %rdx
	addl	%edx, 184(%rsp)
	testl	%eax, %eax
	jne	.L7055
	movl	$0, 48(%rsp)
	leaq	57(%rsp), %rax
	movb	$0, 56(%rsp)
.L7056:
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
	jne	.L7059
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
	.p2align 4
	.p2align 3
.L7055:
	.cfi_restore_state
	cltq
	addq	%rbx, %rax
	jmp	.L7056
.L7059:
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
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movslq	%esi, %rsi
	vmovq	%rdi, %xmm1
	subq	$296, %rsp
	.cfi_def_cfa_offset 320
	xorl	%edx, %edx
	movq	%fs:40, %rax
	movq	%rax, 280(%rsp)
	xorl	%eax, %eax
	leaq	(%rdi,%rsi), %rax
	leaq	48(%rsp), %rbp
	movq	%rsp, %rdi
	movl	$2, %esi
	vpinsrq	$1, %rax, %xmm1, %xmm0
	movq	$0, 64(%rsp)
	movl	$0, 96(%rsp)
	movl	$0, 232(%rsp)
	vmovdqa	%xmm0, 240(%rsp)
	vmovdqa	%xmm0, 256(%rsp)
	movq	%rbp, (%rsp)
	call	stbi__parse_png_file
	testl	%eax, %eax
	je	.L7077
	cmpl	$16, 32(%rsp)
	movl	$1, %r12d
	je	.L7060
	movq	(%rsp), %rax
	movq	%rbp, %rdi
	vmovdqu	208(%rax), %xmm2
	vmovdqu	%xmm2, 192(%rax)
	call	stbi__get32be
	cmpl	$943870035, %eax
	je	.L7065
.L7076:
	movq	256(%rsp), %rax
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	xorl	%esi, %esi
	movq	%rbp, %rdi
	xorl	%r12d, %r12d
	movq	%rax, 240(%rsp)
	movq	264(%rsp), %rax
	movq	%rax, 248(%rsp)
	call	stbi__pnm_info
	cmpl	$16, %eax
	sete	%r12b
.L7060:
	movq	280(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L7078
	addq	$296, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	movl	%r12d, %eax
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4
	.p2align 3
.L7077:
	.cfi_restore_state
	movq	(%rsp), %rax
	movq	%rbp, %rdi
	vmovdqu	208(%rax), %xmm3
	vmovdqu	%xmm3, 192(%rax)
	call	stbi__get32be
	cmpl	$943870035, %eax
	jne	.L7076
.L7065:
	movq	%rbp, %rdi
	call	stbi__get16be
	movl	%eax, %r12d
	cmpl	$1, %eax
	jne	.L7076
	cmpq	$0, 64(%rsp)
	movq	240(%rsp), %rax
	je	.L7068
	movq	248(%rsp), %rcx
	movq	%rcx, %rdx
	subq	%rax, %rdx
	cmpl	$5, %edx
	jle	.L7079
.L7068:
	addq	$6, %rax
	movq	%rax, 240(%rsp)
.L7069:
	movq	%rbp, %rdi
	call	stbi__get16be
	cmpl	$16, %eax
	ja	.L7076
	movq	%rbp, %rdi
	call	stbi__get16be
	cmpl	$16, %eax
	je	.L7060
	jmp	.L7076
	.p2align 4
	.p2align 3
.L7079:
	movl	$6, %esi
	movq	88(%rsp), %rdi
	movq	%rcx, 240(%rsp)
	subl	%edx, %esi
	call	*72(%rsp)
	jmp	.L7069
.L7078:
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
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movq	%rsi, %rdi
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	subq	$288, %rsp
	.cfi_def_cfa_offset 320
	vmovdqu	(%rax), %xmm0
	movq	(%rax), %rcx
	movq	16(%rax), %rax
	leaq	104(%rsp), %rbx
	movq	%fs:40, %rdx
	movq	%rdx, 280(%rsp)
	xorl	%edx, %edx
	movq	%rsi, 88(%rsp)
	movl	$128, %edx
	movl	$0, 232(%rsp)
	movq	%rbx, %rsi
	movq	%rbx, 256(%rsp)
	movq	%rbx, 240(%rsp)
	movq	%rax, 80(%rsp)
	movq	.LC250(%rip), %rax
	vmovdqa	%xmm0, 64(%rsp)
	movq	%rax, 96(%rsp)
	call	*%rcx
	movq	240(%rsp), %rdx
	subq	256(%rsp), %rdx
	addl	%edx, 232(%rsp)
	testl	%eax, %eax
	jne	.L7081
	movl	$0, 96(%rsp)
	leaq	105(%rsp), %rax
	movb	$0, 104(%rsp)
.L7082:
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
	je	.L7099
	cmpl	$16, 32(%rsp)
	movl	$1, %r12d
	je	.L7080
	movq	(%rsp), %rax
	movq	%rbp, %rdi
	vmovdqu	208(%rax), %xmm1
	vmovdqu	%xmm1, 192(%rax)
	call	stbi__get32be
	cmpl	$943870035, %eax
	je	.L7087
.L7098:
	movq	256(%rsp), %rax
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	xorl	%esi, %esi
	movq	%rbp, %rdi
	xorl	%r12d, %r12d
	movq	%rax, 240(%rsp)
	movq	264(%rsp), %rax
	movq	%rax, 248(%rsp)
	call	stbi__pnm_info
	cmpl	$16, %eax
	sete	%r12b
.L7080:
	movq	280(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L7100
	addq	$288, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	movl	%r12d, %eax
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4
	.p2align 3
.L7081:
	.cfi_restore_state
	cltq
	addq	%rbx, %rax
	jmp	.L7082
	.p2align 4
	.p2align 3
.L7099:
	movq	(%rsp), %rax
	movq	%rbp, %rdi
	vmovdqu	208(%rax), %xmm2
	vmovdqu	%xmm2, 192(%rax)
	call	stbi__get32be
	cmpl	$943870035, %eax
	jne	.L7098
.L7087:
	movq	%rbp, %rdi
	call	stbi__get16be
	movl	%eax, %r12d
	cmpl	$1, %eax
	jne	.L7098
	cmpq	$0, 64(%rsp)
	movq	240(%rsp), %rax
	je	.L7090
	movq	248(%rsp), %rcx
	movq	%rcx, %rdx
	subq	%rax, %rdx
	cmpl	$5, %edx
	jle	.L7101
.L7090:
	addq	$6, %rax
	movq	%rax, 240(%rsp)
.L7091:
	movq	%rbp, %rdi
	call	stbi__get16be
	cmpl	$16, %eax
	ja	.L7098
	movq	%rbp, %rdi
	call	stbi__get16be
	cmpl	$16, %eax
	je	.L7080
	jmp	.L7098
	.p2align 4
	.p2align 3
.L7101:
	movl	$6, %esi
	movq	88(%rsp), %rdi
	movq	%rcx, 240(%rsp)
	subl	%edx, %esi
	call	*72(%rsp)
	jmp	.L7091
.L7100:
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
.LC251:
	.string	"11 4 22 44 44 22 444444"
	.section	.rodata.str1.8
	.align 8
.LC252:
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
	vmovdqa	%xmm0, 16(%rsp)
	vmovdqa	%xmm0, 32(%rsp)
	vmovdqa	%xmm0, 48(%rsp)
	vmovdqa	%xmm0, 64(%rsp)
	movq	$0, 80(%rsp)
	movq	%rdi, (%rsp)
	movq	%rsi, 8(%rsp)
	cmpl	$4, %r8d
	je	.L7104
	movl	%r10d, %ecx
	leal	0(,%r10,4), %edx
	movl	%r10d, %esi
	movq	%rsp, %rdi
	andl	$3, %ecx
	subl	%edx, %esi
	pushq	$0
	.cfi_def_cfa_offset 120
	pushq	$0
	.cfi_def_cfa_offset 128
	movl	%ecx, %edx
	pushq	$0
	.cfi_def_cfa_offset 136
	pushq	$0
	.cfi_def_cfa_offset 144
	subl	%esi, %edx
	leaq	.LC251(%rip), %rsi
	pushq	$0
	.cfi_def_cfa_offset 152
	pushq	$0
	.cfi_def_cfa_offset 160
	imull	%eax, %edx
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
	addl	$54, %edx
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
	pushq	$1
	.cfi_def_cfa_offset 288
	movl	%eax, %r8d
	xorl	%eax, %eax
	call	stbiw__outfile.constprop.0
	addq	$176, %rsp
	.cfi_def_cfa_offset 112
.L7103:
	movq	88(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L7108
	addq	$104, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4
	.p2align 3
.L7104:
	.cfi_restore_state
	movl	%r10d, %edx
	movq	%rsp, %rdi
	subq	$8, %rsp
	.cfi_def_cfa_offset 120
	movl	%eax, %r8d
	imull	%ecx, %edx
	pushq	$0
	.cfi_def_cfa_offset 128
	pushq	$0
	.cfi_def_cfa_offset 136
	movl	$-1, %esi
	pushq	$0
	.cfi_def_cfa_offset 144
	pushq	$0
	.cfi_def_cfa_offset 152
	xorl	%eax, %eax
	pushq	$0
	.cfi_def_cfa_offset 160
	pushq	$0
	.cfi_def_cfa_offset 168
	leal	122(,%rdx,4), %edx
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
	leaq	.LC252(%rip), %rcx
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
	jmp	.L7103
.L7108:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE801:
	.size	stbi_write_bmp_to_func, .-stbi_write_bmp_to_func
	.section	.rodata.str1.1
.LC253:
	.string	"wb"
	.text
	.p2align 4
	.globl	stbi_write_bmp
	.type	stbi_write_bmp, @function
stbi_write_bmp:
.LFB802:
	.cfi_startproc
	endbr64
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movq	%rdi, %r9
	movq	%r8, %r13
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movl	%ecx, %ebp
	movl	$11, %ecx
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movl	%esi, %r12d
	leaq	.LC253(%rip), %rsi
	movl	%edx, %ebx
	subq	$96, %rsp
	.cfi_def_cfa_offset 144
	movq	%fs:40, %rax
	movq	%rax, 88(%rsp)
	xorl	%eax, %eax
	movq	%rsp, %r14
	movq	%r14, %rdi
	rep stosq
	movq	%r9, %rdi
	call	fopen@PLT
	leaq	stbi__stdio_write(%rip), %rdx
	movq	%rdx, (%rsp)
	movq	%rax, 8(%rsp)
	testq	%rax, %rax
	je	.L7114
	cmpl	$4, %ebp
	je	.L7111
	movl	%r12d, %edx
	leal	0(,%r12,4), %eax
	movl	%r12d, %ecx
	pushq	$0
	.cfi_def_cfa_offset 152
	andl	$3, %edx
	subl	%eax, %ecx
	pushq	$0
	.cfi_def_cfa_offset 160
	pushq	$0
	.cfi_def_cfa_offset 168
	movl	%edx, %eax
	pushq	$0
	.cfi_def_cfa_offset 176
	pushq	$0
	.cfi_def_cfa_offset 184
	movl	%ebp, %r9d
	subl	%ecx, %eax
	pushq	$0
	.cfi_def_cfa_offset 192
	pushq	$24
	.cfi_def_cfa_offset 200
	movl	%r12d, %ecx
	imull	%ebx, %eax
	pushq	$1
	.cfi_def_cfa_offset 208
	pushq	%rbx
	.cfi_def_cfa_offset 216
	movl	%ebx, %r8d
	pushq	%r12
	.cfi_def_cfa_offset 224
	pushq	$40
	.cfi_def_cfa_offset 232
	movl	$-1, %esi
	movq	%r14, %rdi
	pushq	$54
	.cfi_def_cfa_offset 240
	pushq	$0
	.cfi_def_cfa_offset 248
	addl	$54, %eax
	pushq	$0
	.cfi_def_cfa_offset 256
	pushq	%rax
	.cfi_def_cfa_offset 264
	leaq	.LC251(%rip), %rax
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
	movq	%r14, %rsp
	.cfi_def_cfa_offset 144
	movl	%eax, %r12d
.L7112:
	movq	8(%rsp), %rdi
	call	fclose@PLT
.L7109:
	movq	88(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L7116
	addq	$96, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	movl	%r12d, %eax
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
	.p2align 4
	.p2align 3
.L7111:
	.cfi_restore_state
	movl	%r12d, %eax
	subq	$8, %rsp
	.cfi_def_cfa_offset 152
	movl	%r12d, %ecx
	movl	$4, %r9d
	imull	%ebx, %eax
	pushq	$0
	.cfi_def_cfa_offset 160
	pushq	$0
	.cfi_def_cfa_offset 168
	movl	%ebx, %r8d
	pushq	$0
	.cfi_def_cfa_offset 176
	pushq	$0
	.cfi_def_cfa_offset 184
	movl	$-1, %edx
	movl	$-1, %esi
	pushq	$0
	.cfi_def_cfa_offset 192
	pushq	$0
	.cfi_def_cfa_offset 200
	movq	%r14, %rdi
	leal	122(,%rax,4), %eax
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
	leaq	.LC252(%rip), %rax
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
	addq	$320, %rsp
	.cfi_def_cfa_offset 144
	movl	%eax, %r12d
	jmp	.L7112
.L7114:
	xorl	%r12d, %r12d
	jmp	.L7109
.L7116:
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
	vpxor	%xmm0, %xmm0, %xmm0
	movq	%rsi, %r10
	movl	%edx, %esi
	movq	%fs:40, %rax
	movq	%rax, 88(%rsp)
	xorl	%eax, %eax
	movl	%ecx, %edx
	movq	%rdi, (%rsp)
	movl	%r8d, %ecx
	movq	%rsp, %rdi
	movq	%r9, %r8
	vmovdqa	%xmm0, 16(%rsp)
	vmovdqa	%xmm0, 32(%rsp)
	vmovdqa	%xmm0, 48(%rsp)
	vmovdqa	%xmm0, 64(%rsp)
	movq	$0, 80(%rsp)
	movq	%r10, 8(%rsp)
	call	stbi_write_tga_core
	movq	88(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L7120
	addq	$104, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L7120:
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
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movq	%rdi, %r9
	movl	%ecx, %r14d
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movl	$11, %ecx
	movl	%esi, %r12d
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	leaq	.LC253(%rip), %rsi
	movl	%edx, %r13d
	movq	%r8, %rbx
	subq	$96, %rsp
	.cfi_def_cfa_offset 144
	movq	%fs:40, %rax
	movq	%rax, 88(%rsp)
	xorl	%eax, %eax
	movq	%rsp, %rbp
	movq	%rbp, %rdi
	rep stosq
	movq	%r9, %rdi
	call	fopen@PLT
	leaq	stbi__stdio_write(%rip), %rdx
	movq	%rdx, (%rsp)
	movq	%rax, 8(%rsp)
	testq	%rax, %rax
	je	.L7124
	movl	%r12d, %esi
	movq	%rbp, %rdi
	movq	%rbx, %r8
	movl	%r14d, %ecx
	movl	%r13d, %edx
	call	stbi_write_tga_core
	movq	8(%rsp), %rdi
	movl	%eax, %r12d
	call	fclose@PLT
.L7121:
	movq	88(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L7126
	addq	$96, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	movl	%r12d, %eax
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
.L7124:
	.cfi_restore_state
	xorl	%r12d, %r12d
	jmp	.L7121
.L7126:
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
	vpxor	%xmm0, %xmm0, %xmm0
	movl	%edx, %r10d
	movl	%ecx, %edx
	movq	%fs:40, %rax
	movq	%rax, 88(%rsp)
	xorl	%eax, %eax
	testl	%ecx, %ecx
	movq	%rsi, 8(%rsp)
	vmovdqa	%xmm0, 16(%rsp)
	setle	%al
	testq	%r9, %r9
	vmovdqa	%xmm0, 32(%rsp)
	vmovdqa	%xmm0, 48(%rsp)
	sete	%sil
	vmovdqa	%xmm0, 64(%rsp)
	movq	$0, 80(%rsp)
	orb	%sil, %al
	movq	%rdi, (%rsp)
	jne	.L7130
	testl	%r10d, %r10d
	jle	.L7130
	movl	%r8d, %ecx
	movq	%rsp, %rdi
	movq	%r9, %r8
	movl	%r10d, %esi
	call	stbi_write_hdr_core.part.0
	jmp	.L7127
	.p2align 4
	.p2align 3
.L7130:
	xorl	%eax, %eax
.L7127:
	movq	88(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L7132
	addq	$104, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L7132:
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
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	vpxor	%xmm0, %xmm0, %xmm0
	movl	%edx, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movl	%esi, %ebp
	leaq	.LC253(%rip), %rsi
	subq	$104, %rsp
	.cfi_def_cfa_offset 144
	movl	%ecx, %r13d
	movq	%r8, %rbx
	movq	%fs:40, %rax
	movq	%rax, 88(%rsp)
	xorl	%eax, %eax
	vmovdqa	%xmm0, 16(%rsp)
	vmovdqa	%xmm0, 32(%rsp)
	vmovdqa	%xmm0, 48(%rsp)
	vmovdqa	%xmm0, 64(%rsp)
	movq	$0, 80(%rsp)
	call	fopen@PLT
	movq	%rax, %rdi
	leaq	stbi__stdio_write(%rip), %rax
	movq	%rax, (%rsp)
	movq	%rdi, 8(%rsp)
	testq	%rdi, %rdi
	je	.L7137
	testl	%r12d, %r12d
	setle	%al
	testq	%rbx, %rbx
	sete	%dl
	orb	%dl, %al
	jne	.L7138
	testl	%ebp, %ebp
	jle	.L7138
	movq	%rsp, %rdi
	movl	%r12d, %edx
	movq	%rbx, %r8
	movl	%r13d, %ecx
	movl	%ebp, %esi
	call	stbi_write_hdr_core.part.0
	movq	8(%rsp), %rdi
	movl	%eax, %r12d
	jmp	.L7135
	.p2align 4
	.p2align 3
.L7138:
	xorl	%r12d, %r12d
.L7135:
	call	fclose@PLT
.L7133:
	movq	88(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L7140
	addq	$104, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	movl	%r12d, %eax
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
.L7137:
	.cfi_restore_state
	xorl	%r12d, %r12d
	jmp	.L7133
.L7140:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE812:
	.size	stbi_write_hdr, .-stbi_write_hdr
	.section	.rodata.str1.1
.LC255:
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
	movl	%esi, 56(%rsp)
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
	je	.L7141
	movl	$5, %eax
	movl	$10, %edi
	cmpl	%eax, %ebx
	cmovge	%ebx, %eax
	movl	%eax, 76(%rsp)
	call	malloc@PLT
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L7144
	movq	.LC254(%rip), %rax
	movb	$120, 8(%rdi)
	movl	$13, %esi
	movq	%rax, (%rdi)
	call	realloc@PLT
	testq	%rax, %rax
	je	.L7144
	movslq	4(%rax), %rdx
	leaq	8(%rax), %rdi
	leaq	100(%rsp), %rbx
	leaq	96(%rsp), %r15
	movl	$5, (%rax)
	movq	%r15, %rsi
	movl	$1, 96(%rsp)
	movl	$1, 100(%rsp)
	movq	%rbx, 40(%rsp)
	movq	%r15, 32(%rsp)
	leal	1(%rdx), %ecx
	movl	%ecx, 4(%rax)
	movb	$94, (%rdi,%rdx)
	movq	%rbx, %rdx
	call	stbiw__zlib_flushf
	movl	100(%rsp), %edx
	movq	%r15, %rsi
	movq	%rax, %rdi
	movl	$1, %eax
	shlx	%edx, %eax, %eax
	addl	$2, %edx
	orl	%eax, 96(%rsp)
	movl	%edx, 100(%rsp)
	movq	%rbx, %rdx
	call	stbiw__zlib_flushf
	movq	%rax, 16(%rsp)
	movl	56(%rsp), %eax
	subl	$3, %eax
	movl	%eax, 68(%rsp)
	testl	%eax, %eax
	jle	.L7214
	movslq	76(%rsp), %rax
	xorl	%r15d, %r15d
	leal	(%rax,%rax), %ebx
	salq	$3, %rax
	movl	%ebx, 72(%rsp)
	movq	%rax, 80(%rsp)
	.p2align 4
	.p2align 3
.L7171:
	movslq	%r15d, %r13
	leaq	(%r14,%r13), %rbx
	movzbl	1(%rbx), %eax
	movzbl	(%rbx), %edi
	movzbl	2(%rbx), %edx
	sall	$8, %eax
	movb	%dil, 63(%rsp)
	movl	%edi, 64(%rsp)
	addl	%edi, %eax
	sall	$16, %edx
	addl	%edx, %eax
	movq	24(%rsp), %rdi
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
	addl	%edx, %eax
	andl	$16383, %eax
	leaq	(%rdi,%rax,8), %rax
	movq	(%rax), %r8
	movq	%rax, 48(%rsp)
	testq	%r8, %r8
	je	.L7146
	movslq	-4(%r8), %r11
	testl	%r11d, %r11d
	jle	.L7215
	movl	56(%rsp), %edi
	leal	-32768(%r15), %r9d
	leal	-1(%r11), %eax
	movq	%r8, %rsi
	movslq	%r9d, %r9
	leaq	8(%r8,%rax,8), %r10
	xorl	%r12d, %r12d
	movl	$3, %ebp
	subl	%r15d, %edi
	jmp	.L7152
	.p2align 4
	.p2align 3
.L7148:
	addq	$8, %rsi
	cmpq	%r10, %rsi
	je	.L7147
.L7152:
	movq	(%rsi), %rcx
	movq	%rcx, %rax
	subq	%r14, %rax
	cmpq	%r9, %rax
	jle	.L7148
	testl	%edi, %edi
	jle	.L7148
	movl	$1, %eax
	movq	%rsi, 8(%rsp)
	jmp	.L7150
	.p2align 4
	.p2align 3
.L7296:
	movl	%eax, %edx
	incq	%rax
	cmpl	%edx, %edi
	jle	.L7149
	cmpl	$257, %edx
	jg	.L7149
.L7150:
	movzbl	-1(%rcx,%rax), %esi
	leal	-1(%rax), %edx
	cmpb	%sil, -1(%rbx,%rax)
	je	.L7296
.L7149:
	movq	8(%rsp), %rsi
	cmpl	%edx, %ebp
	jg	.L7148
	addq	$8, %rsi
	movq	%rcx, %r12
	movl	%edx, %ebp
	cmpq	%r10, %rsi
	jne	.L7152
	.p2align 4
	.p2align 3
.L7147:
	cmpl	%r11d, 72(%rsp)
	je	.L7297
.L7153:
	movl	-8(%r8), %edx
	leal	1(%r11), %eax
	cmpl	%edx, %eax
	jl	.L7200
	leal	1(%rdx,%rdx), %edx
	leaq	-8(%r8), %rdi
	leal	0(,%rdx,8), %esi
	movl	%edx, 8(%rsp)
	movslq	%esi, %rsi
	addq	$8, %rsi
	call	realloc@PLT
	movl	8(%rsp), %edx
	testq	%rax, %rax
	je	.L7211
.L7154:
	movq	48(%rsp), %rcx
	movslq	4(%rax), %r11
	leaq	8(%rax), %r8
	movl	%edx, (%rax)
	movq	%r8, (%rcx)
	leal	1(%r11), %eax
.L7200:
	movl	%eax, -4(%r8)
	movq	%rbx, (%r8,%r11,8)
	testq	%r12, %r12
	jne	.L7298
.L7155:
	cmpb	$-113, 63(%rsp)
	movl	100(%rsp), %edx
	movl	96(%rsp), %ecx
	movl	64(%rsp), %eax
	ja	.L7169
	addl	$48, %eax
	movl	%eax, %esi
	leal	(%rax,%rax), %edi
	sarl	%esi
	andl	$2, %edi
	andl	$1, %esi
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
	sarl	$7, %eax
	sarl	$6, %esi
	addl	%edi, %edi
	andl	$1, %esi
	orl	%edi, %esi
	addl	%esi, %esi
	orl	%esi, %eax
	shlx	%edx, %eax, %eax
	addl	$8, %edx
	orl	%ecx, %eax
	movl	%eax, 96(%rsp)
.L7294:
	movl	%edx, 100(%rsp)
	movq	32(%rsp), %rsi
	incl	%r15d
	movq	40(%rsp), %rdx
	movq	16(%rsp), %rdi
	call	stbiw__zlib_flushf
	movq	%rax, 16(%rsp)
.L7168:
	cmpl	68(%rsp), %r15d
	jl	.L7171
.L7145:
	movl	56(%rsp), %eax
	cmpl	%r15d, %eax
	jle	.L7172
	decl	%eax
	movq	16(%rsp), %rdi
	movq	32(%rsp), %r12
	movslq	%r15d, %rdx
	movq	40(%rsp), %r13
	subl	%r15d, %eax
	leaq	(%r14,%rdx), %rbp
	addq	%rdx, %rax
	leaq	1(%r14,%rax), %rbx
.L7175:
	movzbl	0(%rbp), %eax
	movl	100(%rsp), %edx
	movl	96(%rsp), %ecx
	cmpb	$-113, %al
	ja	.L7173
	addl	$48, %eax
	movzbl	%al, %eax
	movl	%eax, %esi
	leal	(%rax,%rax), %r8d
	sarl	%esi
	andl	$2, %r8d
	andl	$1, %esi
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
	sarl	$7, %eax
	sarl	$6, %esi
	addl	%r8d, %r8d
	andl	$1, %esi
	orl	%r8d, %esi
	addl	%esi, %esi
	orl	%esi, %eax
	shlx	%edx, %eax, %eax
	addl	$8, %edx
	orl	%ecx, %eax
	movl	%eax, 96(%rsp)
.L7295:
	movl	%edx, 100(%rsp)
	movq	%r12, %rsi
	movq	%r13, %rdx
	incq	%rbp
	call	stbiw__zlib_flushf
	movq	%rax, %rdi
	cmpq	%rbx, %rbp
	jne	.L7175
	movq	%rax, 16(%rsp)
.L7172:
	movq	40(%rsp), %rbp
	movq	32(%rsp), %rbx
	movq	16(%rsp), %rdi
	addl	$7, 100(%rsp)
	movq	%rbp, %rdx
	movq	%rbx, %rsi
	call	stbiw__zlib_flushf
	movq	%rax, %r12
	movl	100(%rsp), %eax
	testl	%eax, %eax
	je	.L7176
	movl	%eax, %edx
	movq	%r12, %rdi
	.p2align 4
	.p2align 3
.L7177:
	incl	%edx
	movq	%rbx, %rsi
	movl	%edx, 100(%rsp)
	movq	%rbp, %rdx
	call	stbiw__zlib_flushf
	movl	100(%rsp), %edx
	movq	%rax, %rdi
	testl	%edx, %edx
	jne	.L7177
	movq	%rax, %r12
.L7176:
	movq	24(%rsp), %rax
	movq	%rax, %rbx
	leaq	131072(%rax), %rbp
	.p2align 4
	.p2align 3
.L7179:
	movq	(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L7178
	subq	$8, %rdi
	call	free@PLT
.L7178:
	addq	$8, %rbx
	cmpq	%rbp, %rbx
	jne	.L7179
	movq	24(%rsp), %rdi
	call	free@PLT
	movl	56(%rsp), %ebx
	leaq	-8(%r12), %rcx
	movl	-4(%r12), %edi
	movq	%rcx, 24(%rsp)
	leal	32766(%rbx), %edx
	movl	%ebx, %r13d
	movslq	%edx, %rax
	imulq	$-2147418109, %rax, %rax
	shrq	$32, %rax
	addl	%edx, %eax
	sarl	$31, %edx
	sarl	$14, %eax
	subl	%edx, %eax
	leal	(%rax,%rax,4), %eax
	leal	2(%rbx,%rax), %eax
	cmpl	%eax, %edi
	jle	.L7180
	movl	$2, -4(%r12)
	testl	%ebx, %ebx
	jle	.L7216
	movl	$2, %edi
	xorl	%ebx, %ebx
	movq	%r14, 8(%rsp)
	movq	%rcx, %rbp
	jmp	.L7186
	.p2align 4
	.p2align 3
.L7183:
	movl	%edx, -4(%r12)
	movb	%r15b, (%r12,%rax)
	movslq	-4(%r12), %rax
	movl	-8(%r12), %ecx
	leal	1(%rax), %edx
	cmpl	%ecx, %edx
	jge	.L7299
.L7184:
	movl	%r15d, %ecx
	movl	%edx, -4(%r12)
	movzbl	%ch, %ecx
	movb	%cl, (%r12,%rax)
	movslq	-4(%r12), %rax
	movl	-8(%r12), %ecx
	leal	1(%rax), %edx
	cmpl	%ecx, %edx
	jge	.L7300
.L7185:
	movl	%edx, -4(%r12)
	movl	%r15d, %edx
	notl	%edx
	movb	%dl, (%r12,%rax)
	movslq	-4(%r12), %rax
	movl	-8(%r12), %ecx
	leal	1(%rax), %edx
	cmpl	%ecx, %edx
	jge	.L7301
.L7202:
	movl	%edx, -4(%r12)
	movl	%r15d, %edx
	movslq	%ebx, %rsi
	addq	8(%rsp), %rsi
	notl	%edx
	addl	%r15d, %ebx
	movzbl	%dh, %ecx
	movslq	%r15d, %rdx
	movb	%cl, (%r12,%rax)
	movslq	-4(%r12), %rdi
	addq	%r12, %rdi
	call	memcpy@PLT
	movl	-4(%r12), %edi
	addl	%r15d, %edi
	movl	%edi, -4(%r12)
	cmpl	%ebx, %r13d
	jle	.L7290
	leaq	-8(%r12), %rbp
.L7186:
	movl	-8(%r12), %ecx
	movl	%r13d, %r14d
	movl	$32767, %r15d
	leal	1(%rdi), %eax
	subl	%ebx, %r14d
	cmpl	%r15d, %r14d
	cmovle	%r14d, %r15d
	cmpl	%ecx, %eax
	jl	.L7182
	leal	1(%rcx,%rcx), %ecx
	movq	%rbp, %rdi
	movslq	%ecx, %rsi
	movl	%ecx, 16(%rsp)
	addq	$8, %rsi
	call	realloc@PLT
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L7144
	movl	16(%rsp), %ecx
	movl	4(%rax), %edi
	leaq	8(%rax), %r12
	movl	%ecx, (%rax)
	leal	1(%rdi), %eax
.L7182:
	movslq	%edi, %rdi
	cmpl	$32767, %r14d
	movl	%eax, -4(%r12)
	setle	(%r12,%rdi)
	movslq	-4(%r12), %rax
	movl	-8(%r12), %ecx
	leal	1(%rax), %edx
	cmpl	%ecx, %edx
	jl	.L7183
	leal	1(%rcx,%rcx), %r14d
	movq	%rbp, %rdi
	movslq	%r14d, %rsi
	addq	$8, %rsi
	call	realloc@PLT
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L7144
	leaq	8(%rax), %r12
	movl	%r14d, (%rax)
	movslq	4(%rax), %rax
	leal	1(%rax), %edx
	jmp	.L7183
	.p2align 4
	.p2align 3
.L7298:
	leaq	1(%r14,%r13), %rdx
	movzbl	2(%r14,%r13), %eax
	movzbl	(%rdx), %ecx
	movzbl	2(%rdx), %edx
	sall	$8, %eax
	addl	%ecx, %eax
	sall	$16, %edx
	movq	24(%rsp), %rcx
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
	addl	%edx, %eax
	andl	$16383, %eax
	movq	(%rcx,%rax,8), %rsi
	testq	%rsi, %rsi
	je	.L7156
	movl	-4(%rsi), %eax
	testl	%eax, %eax
	jle	.L7156
	movl	56(%rsp), %ecx
	leal	-32767(%r15), %r8d
	decl	%eax
	movslq	%r8d, %r8
	leaq	8(%rsi,%rax,8), %r9
	leal	-1(%rcx), %edi
	subl	%r15d, %edi
	jmp	.L7161
	.p2align 4
	.p2align 3
.L7157:
	addq	$8, %rsi
	cmpq	%r9, %rsi
	je	.L7156
.L7161:
	movq	(%rsi), %rcx
	movq	%rcx, %rax
	subq	%r14, %rax
	cmpq	%r8, %rax
	jle	.L7157
	testl	%edi, %edi
	jle	.L7157
	movl	$1, %eax
	jmp	.L7159
	.p2align 4
	.p2align 3
.L7302:
	movl	%eax, %edx
	incq	%rax
	cmpl	%edx, %edi
	jle	.L7158
	cmpl	$257, %edx
	jg	.L7158
.L7159:
	movzbl	(%rbx,%rax), %r10d
	leal	-1(%rax), %edx
	cmpb	%r10b, -1(%rcx,%rax)
	je	.L7302
.L7158:
	cmpl	%edx, %ebp
	jl	.L7155
	addq	$8, %rsi
	cmpq	%r9, %rsi
	jne	.L7161
	.p2align 4
	.p2align 3
.L7156:
	subq	%r12, %rbx
	movl	%ebx, %r13d
	cmpl	$32767, %ebx
	jg	.L7198
	cmpl	$258, %ebp
	jg	.L7198
	leaq	2+lengthc.26(%rip), %rdx
	xorl	%eax, %eax
	.p2align 4
	.p2align 3
.L7162:
	movzwl	(%rdx), %ecx
	movslq	%eax, %r12
	addq	$2, %rdx
	leal	1(%r12), %eax
	cmpl	%ebp, %ecx
	jle	.L7162
	movl	100(%rsp), %edx
	movl	96(%rsp), %esi
	cmpl	$22, %r12d
	jg	.L7163
	movl	%eax, %edi
	leal	(%rax,%rax), %ecx
	sarl	%edi
	andl	$2, %ecx
	andl	$1, %edi
	orl	%edi, %ecx
	movl	%eax, %edi
	sarl	$2, %edi
	addl	%ecx, %ecx
	andl	$1, %edi
	orl	%ecx, %edi
	movl	%eax, %ecx
	sarl	$4, %eax
	sarl	$3, %ecx
	addl	%edi, %edi
	andl	$1, %ecx
	orl	%edi, %ecx
	addl	%ecx, %ecx
	orl	%ecx, %eax
	sall	$2, %eax
	shlx	%edx, %eax, %eax
	addl	$7, %edx
	orl	%esi, %eax
	movl	%eax, 96(%rsp)
.L7293:
	movq	16(%rsp), %rdi
	movl	%edx, 100(%rsp)
	movq	32(%rsp), %rsi
	movq	40(%rsp), %rdx
	call	stbiw__zlib_flushf
	movq	%rax, %rdi
	leaq	lengtheb.25(%rip), %rax
	movzbl	(%rax,%r12), %eax
	testb	%al, %al
	jne	.L7303
.L7165:
	xorl	%eax, %eax
	.p2align 4
	.p2align 3
.L7166:
	leaq	2+distc.24(%rip), %rcx
	movslq	%eax, %r12
	movzwl	(%rcx,%rax,2), %edx
	incq	%rax
	cmpl	%r13d, %edx
	jle	.L7166
	movl	%r12d, %edx
	leal	(%r12,%r12), %eax
	movl	100(%rsp), %ecx
	movq	32(%rsp), %rsi
	sarl	%edx
	andl	$2, %eax
	andl	$1, %edx
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
	sarl	$4, %edx
	addl	%eax, %eax
	orl	%edx, %eax
	movq	40(%rsp), %rdx
	shlx	%ecx, %eax, %eax
	addl	$5, %ecx
	orl	%eax, 96(%rsp)
	movl	%ecx, 100(%rsp)
	call	stbiw__zlib_flushf
	movq	%rax, 16(%rsp)
	leaq	disteb.23(%rip), %rax
	movzbl	(%rax,%r12), %eax
	testb	%al, %al
	jne	.L7304
.L7167:
	addl	%ebp, %r15d
	jmp	.L7168
.L7303:
	leaq	lengthc.26(%rip), %rdx
	movl	100(%rsp), %ecx
	movzwl	(%rdx,%r12,2), %esi
	movl	%ebp, %edx
	addl	%ecx, %eax
	subl	%esi, %edx
	movq	32(%rsp), %rsi
	movl	%eax, 100(%rsp)
	shlx	%ecx, %edx, %edx
	orl	%edx, 96(%rsp)
	movq	40(%rsp), %rdx
	call	stbiw__zlib_flushf
	movq	%rax, %rdi
	jmp	.L7165
	.p2align 4
	.p2align 3
.L7146:
	movl	$24, %edi
	call	malloc@PLT
	testq	%rax, %rax
	je	.L7211
	movl	$0, 4(%rax)
	xorl	%r12d, %r12d
	movl	$3, %ebp
	movl	$2, %edx
	jmp	.L7154
	.p2align 4
	.p2align 3
.L7169:
	addl	$256, %eax
	movl	%eax, %edi
	leal	(%rax,%rax), %esi
	sarl	%edi
	andl	$2, %esi
	andl	$1, %edi
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
	sarl	$6, %eax
	sarl	$5, %esi
	addl	%edi, %edi
	andl	$1, %eax
	andl	$1, %esi
	orl	%edi, %esi
	addl	%esi, %esi
	orl	%esi, %eax
	leal	3(,%rax,4), %eax
	shlx	%edx, %eax, %eax
	addl	$9, %edx
	orl	%ecx, %eax
	movl	%eax, 96(%rsp)
	jmp	.L7294
	.p2align 4
	.p2align 3
.L7163:
	leal	169(%r12), %eax
	movl	%eax, %edi
	leal	(%rax,%rax), %ecx
	sarl	$2, %eax
	sarl	%edi
	andl	$2, %ecx
	andl	$1, %eax
	andl	$1, %edi
	orl	%edi, %ecx
	addl	%ecx, %ecx
	orl	%ecx, %eax
	sall	$5, %eax
	orl	$3, %eax
	shlx	%edx, %eax, %eax
	addl	$8, %edx
	orl	%esi, %eax
	movl	%eax, 96(%rsp)
	jmp	.L7293
.L7304:
	leaq	distc.24(%rip), %rdi
	movl	100(%rsp), %ecx
	movq	32(%rsp), %rsi
	movzwl	(%rdi,%r12,2), %edx
	movq	16(%rsp), %rdi
	addl	%ecx, %eax
	subl	%edx, %ebx
	movl	%eax, 100(%rsp)
	shlx	%ecx, %ebx, %edx
	orl	%edx, 96(%rsp)
	movq	40(%rsp), %rdx
	call	stbiw__zlib_flushf
	movq	%rax, 16(%rsp)
	jmp	.L7167
.L7297:
	movq	80(%rsp), %rdx
	movq	%r8, %rdi
	leaq	(%r8,%rdx), %rsi
	call	memmove@PLT
	movq	%rax, %r8
	movl	76(%rsp), %eax
	movl	%eax, -4(%r8)
	movslq	%eax, %r11
	jmp	.L7153
.L7173:
	addl	$256, %eax
	movl	%eax, %r8d
	leal	(%rax,%rax), %esi
	sarl	%r8d
	andl	$2, %esi
	andl	$1, %r8d
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
	sarl	$6, %eax
	sarl	$5, %esi
	addl	%r8d, %r8d
	andl	$1, %eax
	andl	$1, %esi
	orl	%r8d, %esi
	addl	%esi, %esi
	orl	%esi, %eax
	leal	3(,%rax,4), %eax
	shlx	%edx, %eax, %eax
	addl	$9, %edx
	orl	%ecx, %eax
	movl	%eax, 96(%rsp)
	jmp	.L7295
.L7216:
	movl	$3, %eax
	movl	$2, %edi
	xorl	%ebp, %ebp
	movl	$1, %ebx
.L7181:
	movl	-8(%r12), %edx
	cmpl	%eax, %edx
	jg	.L7193
	movq	24(%rsp), %rdi
	leal	1(%rdx,%rdx), %r13d
	movslq	%r13d, %rsi
	addq	$8, %rsi
	call	realloc@PLT
	movq	%rax, 24(%rsp)
	testq	%rax, %rax
	je	.L7144
	movl	4(%rax), %edi
	leaq	8(%rax), %r12
	movl	%r13d, (%rax)
	leal	1(%rdi), %eax
.L7193:
	movl	%eax, -4(%r12)
	movl	%ebp, %eax
	movslq	%edi, %rdi
	movzbl	%ah, %eax
	movb	%al, (%r12,%rdi)
	movslq	-4(%r12), %rax
	movl	-8(%r12), %ecx
	leal	1(%rax), %edx
	cmpl	%ecx, %edx
	jge	.L7305
.L7194:
	movl	%edx, -4(%r12)
	movb	%bpl, (%r12,%rax)
	movslq	-4(%r12), %rax
	movl	-8(%r12), %ecx
	leal	1(%rax), %edx
	cmpl	%ecx, %edx
	jge	.L7306
.L7195:
	movzbl	%bh, %ecx
	movl	%edx, -4(%r12)
	movb	%cl, (%r12,%rax)
	movslq	-4(%r12), %rax
	movl	-8(%r12), %ecx
	leal	1(%rax), %edx
	cmpl	%ecx, %edx
	jge	.L7307
.L7207:
	movl	%edx, -4(%r12)
	movb	%bl, (%r12,%rax)
	movq	88(%rsp), %rbx
	movslq	-4(%r12), %rdx
	movq	%r12, %rsi
	movq	24(%rsp), %rdi
	movl	%edx, (%rbx)
	call	memmove@PLT
.L7141:
	movq	104(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L7308
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
.L7215:
	.cfi_restore_state
	xorl	%r12d, %r12d
	movl	$3, %ebp
	jmp	.L7147
.L7180:
	movslq	%ebx, %rsi
	movl	%ebx, %eax
	imulq	$1584310703, %rsi, %rsi
	sarl	$31, %eax
	sarq	$43, %rsi
	subl	%eax, %esi
	imull	$5552, %esi, %eax
	movl	%ebx, %esi
	subl	%eax, %esi
	testl	%ebx, %ebx
	jle	.L7309
.L7188:
	movl	%esi, %r8d
	xorl	%ebp, %ebp
	movl	$1, %ebx
	testl	%esi, %esi
	jle	.L7192
	xorl	%ecx, %ecx
	movl	$1, %ebx
	xorl	%ebp, %ebp
	.p2align 4
	.p2align 3
.L7191:
	xorl	%eax, %eax
	addq	%r14, %rcx
	.p2align 4
	.p2align 3
.L7189:
	movzbl	(%rcx,%rax), %edx
	incq	%rax
	addl	%edx, %ebx
	addl	%ebx, %ebp
	cmpl	%eax, %esi
	jg	.L7189
	movl	%ebx, %eax
	movl	$2147975281, %edx
	imulq	%rdx, %rax
	shrq	$47, %rax
	imull	$65521, %eax, %eax
	subl	%eax, %ebx
	movl	%ebp, %eax
	imulq	%rdx, %rax
	shrq	$47, %rax
	imull	$65521, %eax, %eax
	subl	%eax, %ebp
.L7192:
	leal	1(%rdi), %eax
	cmpl	%r8d, 56(%rsp)
	jle	.L7181
	movslq	%r8d, %rcx
	movl	$5552, %esi
	addl	$5552, %r8d
	jmp	.L7191
.L7301:
	leal	1(%rcx,%rcx), %r14d
	movq	%rbp, %rdi
	movslq	%r14d, %rsi
	addq	$8, %rsi
	call	realloc@PLT
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L7144
	leaq	8(%rax), %r12
	movl	%r14d, (%rax)
	movslq	4(%rax), %rax
	leal	1(%rax), %edx
	jmp	.L7202
.L7300:
	leal	1(%rcx,%rcx), %r14d
	movq	%rbp, %rdi
	movslq	%r14d, %rsi
	addq	$8, %rsi
	call	realloc@PLT
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L7144
	leaq	8(%rax), %r12
	movl	%r14d, (%rax)
	movslq	4(%rax), %rax
	leal	1(%rax), %edx
	jmp	.L7185
.L7299:
	leal	1(%rcx,%rcx), %r14d
	movq	%rbp, %rdi
	movslq	%r14d, %rsi
	addq	$8, %rsi
	call	realloc@PLT
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L7144
	leaq	8(%rax), %r12
	movl	%r14d, (%rax)
	movslq	4(%rax), %rax
	leal	1(%rax), %edx
	jmp	.L7184
.L7290:
	movslq	56(%rsp), %rsi
	movq	8(%rsp), %r14
	movq	%rbp, 24(%rsp)
	movq	%rsi, %rbx
	imulq	$1584310703, %rsi, %rsi
	movl	%ebx, %eax
	sarl	$31, %eax
	sarq	$43, %rsi
	subl	%eax, %esi
	imull	$5552, %esi, %eax
	subl	%eax, %ebx
	movl	%ebx, %esi
	jmp	.L7188
.L7307:
	movq	24(%rsp), %rdi
	leal	1(%rcx,%rcx), %ebp
	movslq	%ebp, %rsi
	addq	$8, %rsi
	call	realloc@PLT
	movq	%rax, 24(%rsp)
	testq	%rax, %rax
	je	.L7144
	leaq	8(%rax), %r12
	movl	%ebp, (%rax)
	movslq	4(%rax), %rax
	leal	1(%rax), %edx
	jmp	.L7207
.L7306:
	movq	24(%rsp), %rdi
	leal	1(%rcx,%rcx), %ebp
	movslq	%ebp, %rsi
	addq	$8, %rsi
	call	realloc@PLT
	movq	%rax, 24(%rsp)
	testq	%rax, %rax
	je	.L7144
	leaq	8(%rax), %r12
	movl	%ebp, (%rax)
	movslq	4(%rax), %rax
	leal	1(%rax), %edx
	jmp	.L7195
.L7305:
	movq	24(%rsp), %rdi
	leal	1(%rcx,%rcx), %r13d
	movslq	%r13d, %rsi
	addq	$8, %rsi
	call	realloc@PLT
	movq	%rax, 24(%rsp)
	testq	%rax, %rax
	je	.L7144
	leaq	8(%rax), %r12
	movl	%r13d, (%rax)
	movslq	4(%rax), %rax
	leal	1(%rax), %edx
	jmp	.L7194
.L7309:
	leal	1(%rdi), %eax
	xorl	%ebp, %ebp
	movl	$1, %ebx
	jmp	.L7181
.L7214:
	xorl	%r15d, %r15d
	jmp	.L7145
.L7198:
	leaq	__PRETTY_FUNCTION__.27(%rip), %rcx
	movl	$959, %edx
	leaq	.LC8(%rip), %rsi
	leaq	.LC255(%rip), %rdi
	call	__assert_fail@PLT
.L7211:
	leaq	__PRETTY_FUNCTION__.22(%rip), %rcx
	movl	$830, %edx
	leaq	.LC8(%rip), %rsi
	leaq	.LC59(%rip), %rdi
	call	__assert_fail@PLT
.L7144:
	call	stbiw__sbgrowf.part.0
.L7308:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE818:
	.size	stbi_zlib_compress, .-stbi_zlib_compress
	.section	.rodata.str1.1
.LC259:
	.string	"o == out + *out_len"
	.text
	.p2align 4
	.globl	stbi_write_png_to_mem
	.type	stbi_write_png_to_mem, @function
stbi_write_png_to_mem:
.LFB823:
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
	movl	%edx, %r13d
	movl	%ecx, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$152, %rsp
	.cfi_def_cfa_offset 208
	vmovdqa	.LC256(%rip), %xmm0
	movq	%rdi, 24(%rsp)
	movl	%r8d, 32(%rsp)
	movq	%r9, 80(%rsp)
	imull	%edx, %r8d
	movq	%fs:40, %rax
	movq	%rax, 136(%rsp)
	movl	stbi_write_force_png_filter(%rip), %eax
	testl	%esi, %esi
	movl	$6, 128(%rsp)
	movl	%r8d, %r14d
	cmove	%r8d, %esi
	movl	%esi, 36(%rsp)
	vmovdqa	%xmm0, 112(%rsp)
	cmpl	$5, %eax
	movl	%eax, %ebx
	movl	$-1, %eax
	cmovl	%ebx, %eax
	leal	1(%r8), %ebx
	movl	%eax, 40(%rsp)
	movl	%ebx, %eax
	imull	%ecx, %eax
	movslq	%eax, %rdi
	movl	%eax, 92(%rsp)
	call	malloc@PLT
	movq	%rax, 72(%rsp)
	testq	%rax, %rax
	je	.L7313
	movslq	%r14d, %rax
	movq	%rax, %rdi
	movq	%rax, 48(%rsp)
	call	malloc@PLT
	movq	%rax, %r15
	testq	%rax, %rax
	je	.L7314
	testl	%r12d, %r12d
	jle	.L7326
	movslq	%ebx, %rax
	movl	%r13d, 20(%rsp)
	xorl	%ebp, %ebp
	movl	%r14d, %r13d
	movq	%rax, 56(%rsp)
	movq	72(%rsp), %rax
	leaq	1(%rax), %rcx
	leal	-1(%r14), %eax
	movl	%eax, 44(%rsp)
	movl	%r14d, %eax
	shrl	$4, %eax
	leal	-1(%rax), %ebx
	movl	%r14d, %eax
	movq	%rcx, %r14
	incq	%rbx
	andl	$-16, %eax
	salq	$4, %rbx
	movl	%eax, 88(%rsp)
	addq	%r15, %rbx
	jmp	.L7325
	.p2align 4
	.p2align 3
.L7354:
	pushq	%r15
	.cfi_def_cfa_offset 216
	pushq	%rax
	.cfi_def_cfa_offset 224
	movl	%ebp, %r8d
	movl	%r12d, %ecx
	movl	48(%rsp), %r9d
	movl	36(%rsp), %edx
	movl	52(%rsp), %esi
	movq	40(%rsp), %rdi
	call	stbiw__encode_png_line
	popq	%rdi
	.cfi_def_cfa_offset 216
	popq	%r8
	.cfi_def_cfa_offset 208
	movl	40(%rsp), %eax
	movl	%eax, 12(%rsp)
.L7319:
	movzbl	12(%rsp), %eax
	movq	%r14, %rdi
	movq	%r15, %rsi
	incl	%ebp
	movq	48(%rsp), %rdx
	movb	%al, -1(%r14)
	call	memcpy@PLT
	addq	56(%rsp), %r14
	cmpl	%ebp, %r12d
	je	.L7353
.L7325:
	movl	40(%rsp), %eax
	testl	%eax, %eax
	jns	.L7354
	xorl	%eax, %eax
	movq	%r14, 64(%rsp)
	movl	$2147483647, 16(%rsp)
	movl	%eax, %r14d
	movl	%r13d, %eax
	movl	$0, 12(%rsp)
	movq	%rbx, %r13
	movl	%eax, %ebx
.L7318:
	pushq	%r15
	.cfi_def_cfa_offset 216
	pushq	%r14
	.cfi_def_cfa_offset 224
	movl	%r12d, %ecx
	movl	%ebp, %r8d
	movl	48(%rsp), %r9d
	movl	36(%rsp), %edx
	movl	52(%rsp), %esi
	movq	40(%rsp), %rdi
	call	stbiw__encode_png_line
	popq	%rcx
	.cfi_def_cfa_offset 216
	popq	%rsi
	.cfi_def_cfa_offset 208
	testl	%ebx, %ebx
	jle	.L7332
	cmpl	$14, 44(%rsp)
	jbe	.L7333
	movq	%r15, %rdx
	vpxor	%xmm1, %xmm1, %xmm1
	.p2align 4
	.p2align 3
.L7322:
	vpabsb	(%rdx), %xmm0
	addq	$16, %rdx
	vpmovzxbw	%xmm0, %xmm3
	vpsrldq	$8, %xmm0, %xmm0
	vpmovzxbw	%xmm0, %xmm0
	vpmovzxwd	%xmm3, %xmm2
	vpsrldq	$8, %xmm3, %xmm3
	vpmovzxwd	%xmm3, %xmm3
	vpaddd	%xmm1, %xmm2, %xmm1
	vpaddd	%xmm1, %xmm3, %xmm3
	vpmovzxwd	%xmm0, %xmm1
	vpsrldq	$8, %xmm0, %xmm0
	vpmovzxwd	%xmm0, %xmm0
	vpaddd	%xmm3, %xmm1, %xmm1
	vpaddd	%xmm1, %xmm0, %xmm1
	cmpq	%r13, %rdx
	jne	.L7322
	movl	88(%rsp), %eax
	vpsrldq	$8, %xmm1, %xmm0
	vpaddd	%xmm0, %xmm1, %xmm1
	vpsrldq	$4, %xmm1, %xmm0
	vpaddd	%xmm0, %xmm1, %xmm1
	vmovd	%xmm1, %edx
	cmpl	%ebx, %eax
	je	.L7320
	movl	%eax, %ecx
.L7321:
	movslq	%ecx, %rsi
	movzbl	(%r15,%rsi), %edi
	movl	%edi, %esi
	negb	%sil
	cmovs	%edi, %esi
	movzbl	%sil, %esi
	addl	%esi, %edx
	leal	1(%rcx), %esi
	cmpl	%esi, %ebx
	jle	.L7320
	movslq	%esi, %rsi
	movzbl	(%r15,%rsi), %edi
	movl	%edi, %esi
	negb	%sil
	cmovs	%edi, %esi
	movzbl	%sil, %esi
	addl	%esi, %edx
	leal	2(%rcx), %esi
	cmpl	%esi, %ebx
	jle	.L7320
	movslq	%esi, %rsi
	movzbl	(%r15,%rsi), %edi
	movl	%edi, %esi
	negb	%sil
	cmovs	%edi, %esi
	movzbl	%sil, %esi
	addl	%esi, %edx
	leal	3(%rcx), %esi
	cmpl	%esi, %ebx
	jle	.L7320
	movslq	%esi, %rsi
	movzbl	(%r15,%rsi), %edi
	movl	%edi, %esi
	negb	%sil
	cmovs	%edi, %esi
	movzbl	%sil, %esi
	addl	%esi, %edx
	leal	4(%rcx), %esi
	cmpl	%esi, %ebx
	jle	.L7320
	movslq	%esi, %rsi
	movzbl	(%r15,%rsi), %edi
	movl	%edi, %esi
	negb	%sil
	cmovs	%edi, %esi
	movzbl	%sil, %esi
	addl	%esi, %edx
	leal	5(%rcx), %esi
	cmpl	%esi, %ebx
	jle	.L7320
	movslq	%esi, %rsi
	movzbl	(%r15,%rsi), %edi
	movl	%edi, %esi
	negb	%sil
	cmovs	%edi, %esi
	movzbl	%sil, %esi
	addl	%esi, %edx
	leal	6(%rcx), %esi
	cmpl	%esi, %ebx
	jle	.L7320
	movslq	%esi, %rsi
	movzbl	(%r15,%rsi), %edi
	movl	%edi, %esi
	negb	%sil
	cmovs	%edi, %esi
	movzbl	%sil, %esi
	addl	%esi, %edx
	leal	7(%rcx), %esi
	cmpl	%esi, %ebx
	jle	.L7320
	movslq	%esi, %rsi
	movzbl	(%r15,%rsi), %edi
	movl	%edi, %esi
	negb	%sil
	cmovs	%edi, %esi
	movzbl	%sil, %esi
	addl	%esi, %edx
	leal	8(%rcx), %esi
	cmpl	%esi, %ebx
	jle	.L7320
	movslq	%esi, %rsi
	movzbl	(%r15,%rsi), %edi
	movl	%edi, %esi
	negb	%sil
	cmovs	%edi, %esi
	movzbl	%sil, %esi
	addl	%esi, %edx
	leal	9(%rcx), %esi
	cmpl	%esi, %ebx
	jle	.L7320
	movslq	%esi, %rsi
	movzbl	(%r15,%rsi), %edi
	movl	%edi, %esi
	negb	%sil
	cmovs	%edi, %esi
	movzbl	%sil, %esi
	addl	%esi, %edx
	leal	10(%rcx), %esi
	cmpl	%esi, %ebx
	jle	.L7320
	movslq	%esi, %rsi
	movzbl	(%r15,%rsi), %edi
	movl	%edi, %esi
	negb	%sil
	cmovs	%edi, %esi
	movzbl	%sil, %esi
	addl	%esi, %edx
	leal	11(%rcx), %esi
	cmpl	%esi, %ebx
	jle	.L7320
	movslq	%esi, %rsi
	movzbl	(%r15,%rsi), %edi
	movl	%edi, %esi
	negb	%sil
	cmovs	%edi, %esi
	movzbl	%sil, %esi
	addl	%esi, %edx
	leal	12(%rcx), %esi
	cmpl	%esi, %ebx
	jle	.L7320
	movslq	%esi, %rsi
	movzbl	(%r15,%rsi), %edi
	movl	%edi, %esi
	negb	%sil
	cmovs	%edi, %esi
	movzbl	%sil, %esi
	addl	%esi, %edx
	leal	13(%rcx), %esi
	cmpl	%esi, %ebx
	jle	.L7320
	movslq	%esi, %rsi
	movzbl	(%r15,%rsi), %edi
	movl	%edi, %esi
	negb	%sil
	cmovs	%edi, %esi
	addl	$14, %ecx
	movzbl	%sil, %esi
	addl	%esi, %edx
	cmpl	%ecx, %ebx
	jle	.L7320
	movslq	%ecx, %rcx
	movzbl	(%r15,%rcx), %esi
	movl	%esi, %ecx
	negb	%cl
	cmovs	%esi, %ecx
	movzbl	%cl, %ecx
	addl	%ecx, %edx
	.p2align 4
	.p2align 3
.L7320:
	cmpl	%edx, 16(%rsp)
	jle	.L7324
	movl	%edx, 16(%rsp)
	movl	%r14d, 12(%rsp)
.L7324:
	incl	%r14d
	cmpl	$5, %r14d
	jne	.L7318
	movl	%ebx, %eax
	movq	%r13, %rbx
	movq	64(%rsp), %r14
	movl	%eax, %r13d
	movl	12(%rsp), %eax
	cmpl	$5, %eax
	je	.L7319
	pushq	%r15
	.cfi_def_cfa_offset 216
	pushq	%rax
	.cfi_def_cfa_offset 224
	movl	%ebp, %r8d
	movl	%r12d, %ecx
	movl	48(%rsp), %r9d
	movl	36(%rsp), %edx
	movl	52(%rsp), %esi
	movq	40(%rsp), %rdi
	call	stbiw__encode_png_line
	popq	%rax
	.cfi_def_cfa_offset 216
	popq	%rdx
	.cfi_def_cfa_offset 208
	jmp	.L7319
	.p2align 4
	.p2align 3
.L7332:
	xorl	%edx, %edx
	jmp	.L7320
.L7333:
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	jmp	.L7321
.L7353:
	movl	20(%rsp), %r13d
.L7326:
	movq	%r15, %rdi
	call	free@PLT
	movq	72(%rsp), %rbx
	leaq	108(%rsp), %rdx
	movl	stbi_write_png_compression_level(%rip), %ecx
	movl	92(%rsp), %esi
	movq	%rbx, %rdi
	call	stbi_zlib_compress
	movq	%rbx, %rdi
	movq	%rax, %rbp
	call	free@PLT
	testq	%rbp, %rbp
	je	.L7313
	movl	108(%rsp), %r10d
	movbel	108(%rsp), %r14d
	leal	57(%r10), %ebx
	movl	%r10d, 12(%rsp)
	movslq	%ebx, %rdi
	call	malloc@PLT
	movq	%rax, %r15
	testq	%rax, %rax
	je	.L7313
	movq	80(%rsp), %rax
	movl	%r12d, %esi
	movl	%r12d, %edi
	movl	%r12d, %ecx
	sarl	$8, %esi
	sarl	$16, %edi
	sarl	$24, %ecx
	movl	%r13d, %r8d
	movzbl	%sil, %r11d
	movzbl	%cl, %ecx
	sarl	$8, %r8d
	movl	%r13d, %r9d
	sarl	$16, %r9d
	movl	%r13d, %edx
	movl	%r14d, 33(%r15)
	movslq	12(%rsp), %r14
	movl	%ebx, (%rax)
	movabsq	$727905341920923785, %rax
	sarl	$24, %edx
	leaq	crc_table.18(%rip), %rbx
	movq	%rax, (%r15)
	movq	.LC257(%rip), %rax
	movb	$8, 24(%r15)
	movw	$0, 26(%r15)
	movb	$0, 28(%r15)
	movl	$1413563465, 37(%r15)
	movq	%rax, 8(%r15)
	movzbl	%r12b, %eax
	salq	$8, %rax
	orq	%r11, %rax
	movzbl	%dil, %r11d
	salq	$8, %rax
	orq	%r11, %rax
	salq	$8, %rax
	orq	%rcx, %rax
	movzbl	%r13b, %ecx
	salq	$8, %rax
	orq	%rcx, %rax
	movzbl	%r8b, %ecx
	salq	$8, %rax
	orq	%rcx, %rax
	movzbl	%r9b, %ecx
	salq	$8, %rax
	orq	%rcx, %rax
	movzbl	%dl, %ecx
	xorl	$-11, %edx
	salq	$8, %rax
	orq	%rcx, %rax
	movq	%rax, 16(%r15)
	movslq	32(%rsp), %rax
	movl	112(%rsp,%rax,4), %ecx
	movzbl	%dl, %eax
	movl	(%rbx,%rax,4), %eax
	movb	%cl, 25(%r15)
	xorl	$5725777, %eax
	movl	%eax, %edx
	xorl	%r9d, %eax
	movzbl	%al, %eax
	shrl	$8, %edx
	xorl	(%rbx,%rax,4), %edx
	movl	%edx, %eax
	xorl	%r8d, %edx
	movl	%r12d, %r8d
	movzbl	%dl, %edx
	shrl	$8, %eax
	xorl	(%rbx,%rdx,4), %eax
	movl	%eax, %edx
	xorl	%r13d, %eax
	movzbl	%al, %eax
	shrl	$8, %edx
	xorl	(%rbx,%rax,4), %edx
	movl	%edx, %eax
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
	movq	%rbp, %rsi
	movzbl	%dl, %edx
	shrl	$8, %eax
	xorl	(%rbx,%rdx,4), %eax
	movl	%eax, %edx
	xorl	%r12d, %eax
	leaq	41(%r15), %r12
	movzbl	%al, %eax
	shrl	$8, %edx
	movq	%r12, %rdi
	addq	%r14, %r12
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
	shrl	$8, %edx
	movzbl	%al, %eax
	xorl	(%rbx,%rax,4), %edx
	movl	%edx, %eax
	movzbl	%dl, %edx
	shrl	$8, %eax
	xorl	(%rbx,%rdx,4), %eax
	movl	%eax, %edx
	movzbl	%al, %eax
	shrl	$8, %edx
	xorl	(%rbx,%rax,4), %edx
	movl	%edx, %eax
	movq	%r14, %rdx
	notl	%eax
	movbel	%eax, 29(%r15)
	call	memmove@PLT
	movq	%rbp, %rdi
	call	free@PLT
	movslq	108(%rsp), %rsi
	movq	$-4, %rdx
	movq	$-3, %rax
	subq	%rsi, %rdx
	subq	%rsi, %rax
	cmpl	$-3, %esi
	jl	.L7334
	leal	3(%rsi), %esi
	addq	%r12, %rdx
	addq	%r12, %rsi
	addq	%rax, %rsi
	movl	$-1, %eax
	.p2align 4
	.p2align 3
.L7328:
	movl	%eax, %ecx
	xorb	(%rdx), %al
	incq	%rdx
	shrl	$8, %ecx
	movzbl	%al, %eax
	xorl	(%rbx,%rax,4), %ecx
	movl	%ecx, %eax
	cmpq	%rsi, %rdx
	jne	.L7328
	notl	%eax
	movl	%eax, %ebx
	movl	%eax, %edx
	movzbl	%ah, %ecx
	shrl	$24, %ebx
	shrl	$16, %edx
	movl	%ebx, %esi
.L7327:
	movb	%al, 3(%r12)
	movq	.LC258(%rip), %rax
	movb	%sil, (%r12)
	addq	$16, %r12
	movb	%dl, -15(%r12)
	movb	%cl, -14(%r12)
	movl	$-2107620690, -4(%r12)
	movq	%rax, -12(%r12)
	movq	80(%rsp), %rax
	movslq	(%rax), %rax
	addq	%r15, %rax
	cmpq	%r12, %rax
	jne	.L7355
.L7310:
	movq	136(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L7356
	addq	$152, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%r15, %rax
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
.L7313:
	.cfi_restore_state
	xorl	%r15d, %r15d
	jmp	.L7310
.L7334:
	xorl	%eax, %eax
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	xorl	%esi, %esi
	jmp	.L7327
.L7314:
	movq	72(%rsp), %rdi
	call	free@PLT
	jmp	.L7310
.L7356:
	call	__stack_chk_fail@PLT
.L7355:
	leaq	__PRETTY_FUNCTION__.21(%rip), %rcx
	movl	$1209, %edx
	leaq	.LC8(%rip), %rsi
	leaq	.LC259(%rip), %rdi
	call	__assert_fail@PLT
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
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movl	%esi, %r10d
	movq	%rdi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movq	%r8, %rdi
	movl	%r9d, %esi
	movl	%ecx, %r8d
	subq	$16, %rsp
	.cfi_def_cfa_offset 48
	movl	%edx, %ecx
	movl	%r10d, %edx
	xorl	%r13d, %r13d
	leaq	4(%rsp), %r9
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	call	stbi_write_png_to_mem
	testq	%rax, %rax
	je	.L7357
	movq	%r12, %rdi
	leaq	.LC253(%rip), %rsi
	movq	%rax, %rbp
	call	fopen@PLT
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L7364
	movslq	4(%rsp), %rdx
	movq	%rax, %rcx
	movl	$1, %esi
	movq	%rbp, %rdi
	movl	$1, %r13d
	call	fwrite@PLT
	movq	%r12, %rdi
	call	fclose@PLT
	movq	%rbp, %rdi
	call	free@PLT
.L7357:
	movq	8(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L7365
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	movl	%r13d, %eax
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
.L7365:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
.L7364:
	movq	%rbp, %rdi
	call	free@PLT
	jmp	.L7357
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
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movq	%rsi, %r12
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
	je	.L7369
	movq	%rax, %rbp
	movq	%rax, %rsi
	movl	4(%rsp), %edx
	movq	%r12, %rdi
	call	*%rbx
	movq	%rbp, %rdi
	call	free@PLT
	movl	$1, %eax
.L7366:
	movq	8(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L7371
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
	.p2align 4
	.p2align 3
.L7369:
	.cfi_restore_state
	xorl	%eax, %eax
	jmp	.L7366
.L7371:
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
	vmovdqa	%xmm0, 16(%rsp)
	vmovdqa	%xmm0, 32(%rsp)
	vmovdqa	%xmm0, 48(%rsp)
	vmovdqa	%xmm0, 64(%rsp)
	movq	$0, 80(%rsp)
	movq	%rdi, (%rsp)
	movq	%rsi, 8(%rsp)
	testq	%r9, %r9
	je	.L7376
	movl	%edx, %esi
	testl	%edx, %edx
	je	.L7376
	leal	-1(%r8), %eax
	movl	%ecx, %edx
	movl	%r8d, %ecx
	cmpl	$3, %eax
	ja	.L7376
	testl	%edx, %edx
	je	.L7376
	movq	%r9, %r8
	movl	112(%rsp), %r9d
	movq	%rsp, %rdi
	call	stbi_write_jpg_core.part.0
	jmp	.L7372
	.p2align 4
	.p2align 3
.L7376:
	xorl	%eax, %eax
.L7372:
	movq	88(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L7378
	addq	$104, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L7378:
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
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdi, %r10
	movl	%edx, %r14d
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movl	%ecx, %r12d
	movl	$11, %ecx
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	%esi, %ebp
	leaq	.LC253(%rip), %rsi
	subq	$104, %rsp
	.cfi_def_cfa_offset 160
	movq	%r8, %rbx
	movl	%r9d, %r13d
	movq	%fs:40, %rax
	movq	%rax, 88(%rsp)
	xorl	%eax, %eax
	movq	%rsp, %r15
	movq	%r15, %rdi
	rep stosq
	movq	%r10, %rdi
	call	fopen@PLT
	movq	%rax, %rdi
	leaq	stbi__stdio_write(%rip), %rax
	movq	%rax, (%rsp)
	movq	%rdi, 8(%rsp)
	testq	%rdi, %rdi
	je	.L7383
	testq	%rbx, %rbx
	je	.L7385
	testl	%ebp, %ebp
	je	.L7385
	leal	-1(%r12), %eax
	cmpl	$3, %eax
	ja	.L7385
	testl	%r14d, %r14d
	je	.L7385
	movl	%r12d, %ecx
	movq	%r15, %rdi
	movl	%r13d, %r9d
	movq	%rbx, %r8
	movl	%r14d, %edx
	movl	%ebp, %esi
	call	stbi_write_jpg_core.part.0
	movq	8(%rsp), %rdi
	movl	%eax, %r12d
	jmp	.L7381
	.p2align 4
	.p2align 3
.L7385:
	xorl	%r12d, %r12d
.L7381:
	call	fclose@PLT
.L7379:
	movq	88(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L7387
	addq	$104, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movl	%r12d, %eax
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
.L7383:
	.cfi_restore_state
	xorl	%r12d, %r12d
	jmp	.L7379
.L7387:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE832:
	.size	stbi_write_jpg, .-stbi_write_jpg
	.section	.rodata.str1.8
	.align 8
.LC260:
	.string	"Usage: %s <image1> [<image2> ...]\n"
	.section	.rodata.str1.1
.LC261:
	.string	"[info] Processing %s\n"
.LC262:
	.string	"Image could not be opened"
.LC263:
	.string	"Could not allocate memory"
.LC264:
	.string	"%s_grey.jpg"
	.section	.rodata.str1.8
	.align 8
.LC265:
	.string	"[info] %s: width=%d, height=%d, nchannels=%d\n"
	.align 8
.LC266:
	.string	"[error] Num of channels=%d not supported. Only three (RGB), four (RGBA) are supported.\n"
	.section	.rodata.str1.1
.LC271:
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
	jle	.L7420
	leal	-2(%rdi), %eax
	leaq	8(%rsi), %rbx
	leaq	.LC261(%rip), %r15
	leaq	.LC248(%rip), %r14
	leaq	16(%rsi,%rax,8), %rax
	movq	%rax, (%rsp)
	leaq	56(%rsp), %rax
	movq	%rax, 8(%rsp)
	.p2align 4
	.p2align 3
.L7409:
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
	je	.L7421
	movq	16+stbi__stdio_callbacks(%rip), %rax
	vmovdqa	stbi__stdio_callbacks(%rip), %xmm6
	leaq	152(%rsp), %r12
	movl	$128, %edx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	movq	%rbp, 136(%rsp)
	movl	$0, 280(%rsp)
	movq	%r12, 304(%rsp)
	movq	%r12, 288(%rsp)
	movq	%rax, 128(%rsp)
	movq	.LC250(%rip), %rax
	vmovdqa	%xmm6, 112(%rsp)
	movq	%rax, 144(%rsp)
	call	stbi__stdio_read
	movq	288(%rsp), %rdx
	subq	304(%rsp), %rdx
	addl	%edx, 280(%rsp)
	testl	%eax, %eax
	jne	.L7393
	movl	$0, 144(%rsp)
	leaq	153(%rsp), %rax
	movb	$0, 152(%rsp)
.L7394:
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
	je	.L7395
	movl	288(%rsp), %esi
	subl	296(%rsp), %esi
	movq	%rbp, %rdi
	movl	$1, %edx
	movslq	%esi, %rsi
	call	fseek@PLT
	movq	%rbp, %rdi
	call	fclose@PLT
.L7396:
	movl	44(%rsp), %edi
	imull	48(%rsp), %edi
	movslq	%edi, %rdi
	call	malloc@PLT
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L7422
.L7397:
	movq	(%rbx), %r13
	movq	%r13, %rdi
	call	strlen@PLT
	decl	%eax
	js	.L7398
	cltq
	jmp	.L7400
	.p2align 4
	.p2align 3
.L7399:
	decq	%rax
	testl	%eax, %eax
	js	.L7398
.L7400:
	cmpb	$46, 0(%r13,%rax)
	leaq	0(%r13,%rax), %rcx
	jne	.L7399
	movb	$0, (%rcx)
	movq	(%rbx), %r13
.L7398:
	movq	8(%rsp), %rdi
	xorl	%eax, %eax
	movq	%r13, %rdx
	leaq	.LC264(%rip), %rsi
	movq	$0, 56(%rsp)
	call	asprintf@PLT
	cmpq	$0, 56(%rsp)
	je	.L7423
	movq	(%rbx), %rdx
	movl	52(%rsp), %r9d
	leaq	.LC265(%rip), %rsi
	movl	$1, %edi
	movl	48(%rsp), %r8d
	movl	44(%rsp), %ecx
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	52(%rsp), %edx
	leal	-3(%rdx), %eax
	cmpl	$1, %eax
	jbe	.L7402
	leaq	.LC266(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
.L7403:
	addq	$8, %rbx
	cmpq	%rbx, (%rsp)
	jne	.L7409
.L7390:
	movq	328(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L7424
	addq	$344, %rsp
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
	.p2align 4
	.p2align 3
.L7393:
	.cfi_restore_state
	cltq
	addq	%r12, %rax
	jmp	.L7394
	.p2align 4
	.p2align 3
.L7402:
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
	jle	.L7404
	movl	48(%rsp), %r8d
	testl	%r8d, %r8d
	jle	.L7404
	vmovsd	.LC267(%rip), %xmm5
	vmovsd	.LC268(%rip), %xmm4
	movslq	%eax, %rsi
	sall	$2, %eax
	vmovsd	.LC269(%rip), %xmm3
	movq	%r12, %r10
	movslq	%eax, %rdi
	xorl	%r9d, %r9d
	.p2align 4
	.p2align 3
.L7405:
	leaq	0(%rbp,%r9), %rcx
	movq	%r10, %rax
	xorl	%edx, %edx
	.p2align 4
	.p2align 3
.L7406:
	movzbl	(%rax), %r11d
	incl	%edx
	vcvtsi2sdl	%r11d, %xmm2, %xmm0
	movzbl	1(%rax), %r11d
	vcvtsi2sdl	%r11d, %xmm2, %xmm1
	vmulsd	%xmm5, %xmm1, %xmm1
	movzbl	2(%rax), %r11d
	addq	%rdi, %rax
	vfmadd231sd	%xmm4, %xmm0, %xmm1
	vcvtsi2sdl	%r11d, %xmm2, %xmm0
	vfmadd132sd	%xmm3, %xmm1, %xmm0
	vcvttsd2sil	%xmm0, %r11d
	movb	%r11b, (%rcx)
	addq	%rsi, %rcx
	cmpl	%r8d, %edx
	jne	.L7406
	incq	%r9
	addq	$4, %r10
	cmpq	%r9, %rsi
	jne	.L7405
.L7404:
#APP
# 87 "greyScale.c" 1
	#final_bucle
# 0 "" 2
#NO_APP
	leaq	96(%rsp), %r10
	xorl	%eax, %eax
	movl	$11, %ecx
	movq	56(%rsp), %r8
	movq	%r10, %rdi
	movl	48(%rsp), %edx
	movl	44(%rsp), %r11d
	leaq	.LC253(%rip), %rsi
	rep stosq
	movq	%r10, 24(%rsp)
	movq	%r8, %rdi
	movl	%edx, 20(%rsp)
	movl	%r11d, 16(%rsp)
	call	fopen@PLT
	movq	%rax, %rdi
	leaq	stbi__stdio_write(%rip), %rax
	movq	%rax, 96(%rsp)
	movq	%rdi, 104(%rsp)
	testq	%rdi, %rdi
	je	.L7407
	movl	20(%rsp), %edx
	movl	16(%rsp), %r11d
	testl	%edx, %edx
	sete	%al
	testl	%r11d, %r11d
	sete	%cl
	orb	%cl, %al
	jne	.L7408
	testq	%rbp, %rbp
	je	.L7408
	movq	24(%rsp), %rdi
	movl	$10, %r9d
	movq	%rbp, %r8
	movl	$1, %ecx
	movl	%r11d, %esi
	call	stbi_write_jpg_core.part.0
	movq	104(%rsp), %rdi
.L7408:
	call	fclose@PLT
.L7407:
	movq	%r12, %rdi
	call	free@PLT
	leaq	64(%rsp), %rdi
	xorl	%esi, %esi
	call	gettimeofday@PLT
	imulq	$1000000, 64(%rsp), %rax
	vxorps	%xmm2, %xmm2, %xmm2
	leaq	.LC271(%rip), %rsi
	imulq	$1000000, 80(%rsp), %rdx
	movl	$1, %edi
	addq	72(%rsp), %rax
	addq	88(%rsp), %rdx
	subq	%rdx, %rax
	vcvtsi2sdq	%rax, %xmm2, %xmm0
	vdivsd	.LC270(%rip), %xmm0, %xmm0
	movl	$1, %eax
	call	__printf_chk@PLT
	movq	56(%rsp), %rdi
	call	free@PLT
	jmp	.L7403
	.p2align 4
	.p2align 3
.L7395:
	movq	%rbp, %rdi
	call	fclose@PLT
.L7392:
	leaq	.LC262(%rip), %rdi
	xorl	%r12d, %r12d
	call	perror@PLT
	jmp	.L7396
.L7420:
	movq	(%rsi), %rdx
	movl	$1, %edi
	leaq	.LC260(%rip), %rsi
	call	__printf_chk@PLT
	jmp	.L7390
.L7424:
	call	__stack_chk_fail@PLT
.L7423:
	leaq	.LC263(%rip), %rdi
	call	perror@PLT
	orl	$-1, %edi
	call	exit@PLT
.L7422:
	leaq	.LC263(%rip), %rdi
	call	perror@PLT
	jmp	.L7397
.L7421:
	leaq	.LC249(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L7392
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
	.value	1016
	.value	10
	.value	-106
	.value	16
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
	.value	2039
	.value	11
	.value	-98
	.value	16
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
	.value	123
	.value	7
	.value	4086
	.value	12
	.value	-90
	.value	16
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
	.value	250
	.value	8
	.value	4087
	.value	12
	.value	-82
	.value	16
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
	.value	32704
	.value	15
	.value	-74
	.value	16
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
	.value	-66
	.value	16
	.value	-65
	.value	16
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
	.value	-57
	.value	16
	.value	-56
	.value	16
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
	.value	1017
	.value	10
	.value	-48
	.value	16
	.value	-47
	.value	16
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
	.value	1018
	.value	10
	.value	-39
	.value	16
	.value	-38
	.value	16
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
	.value	2040
	.value	11
	.value	-30
	.value	16
	.value	-29
	.value	16
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
	.value	-21
	.value	16
	.value	-20
	.value	16
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
	.value	-11
	.value	16
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
	.type	YDC_HT.4, @object
	.size	YDC_HT.4, 1024
YDC_HT.4:
	.value	0
	.value	2
	.value	2
	.value	3
	.value	3
	.value	3
	.value	4
	.value	3
	.value	5
	.value	3
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
	.zero	976
	.align 8
	.type	head2.5, @object
	.size	head2.5, 14
head2.5:
	.string	"\377\332"
	.string	"\f\003\001"
	.string	"\002\021\003\021"
	.string	"?"
	.align 32
	.type	std_ac_chrominance_values.6, @object
	.size	std_ac_chrominance_values.6, 162
std_ac_chrominance_values.6:
	.string	""
	.ascii	"\001\002\003\021\004\005!1\006\022AQ\007aq\023\"2\201\b\024B"
	.ascii	"\221\241\261\301\t#3R\360\025br\321\n\026$4\341%\361\027\030"
	.ascii	"\031\032&'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz\202\203\204"
	.ascii	"\205\206\207\210\211\212\222\223\224\225\226\227\230\231\232"
	.ascii	"\242\243\244\245\246\247\250\251\252\262\263\264\265\266\267"
	.ascii	"\270\271\272\302\303\304\305\306\307\310\311\312\322\323\324"
	.ascii	"\325\326\327\330\331\332\342\343\344\345\346\347\350\351\352"
	.ascii	"\362\363\364\365\366\367\370\371\372"
	.align 16
	.type	std_ac_chrominance_nrcodes.7, @object
	.size	std_ac_chrominance_nrcodes.7, 17
std_ac_chrominance_nrcodes.7:
	.string	""
	.string	""
	.string	"\002\001\002\004\004\003\004\007\005\004\004"
	.ascii	"\001\002w"
	.align 8
	.type	std_dc_chrominance_values.8, @object
	.size	std_dc_chrominance_values.8, 12
std_dc_chrominance_values.8:
	.string	""
	.ascii	"\001\002\003\004\005\006\007\b\t\n\013"
	.align 16
	.type	std_dc_chrominance_nrcodes.9, @object
	.size	std_dc_chrominance_nrcodes.9, 17
std_dc_chrominance_nrcodes.9:
	.string	""
	.string	""
	.string	"\003\001\001\001\001\001\001\001\001\001"
	.string	""
	.string	""
	.string	""
	.string	""
	.align 32
	.type	std_ac_luminance_values.10, @object
	.size	std_ac_luminance_values.10, 162
std_ac_luminance_values.10:
	.string	"\001\002\003"
	.ascii	"\004\021\005\022!1A\006\023Qa\007\"q\0242\201\221\241\b#B\261"
	.ascii	"\301\025R\321\360$3br\202\t\n\026\027\030\031\032%&'()*45678"
	.ascii	"9:CDEFGHIJSTUVWXYZcdefghijstuvwxyz\203\204\205\206\207\210\211"
	.ascii	"\212\222\223\224\225\226\227\230\231\232\242\243\244\245\246"
	.ascii	"\247\250\251\252\262\263\264\265\266\267\270\271\272\302\303"
	.ascii	"\304\305\306\307\310\311\312\322\323\324\325\326\327\330\331"
	.ascii	"\332\341\342\343\344\345\346\347\350\351\352\361\362\363\364"
	.ascii	"\365\366\367\370\371\372"
	.align 16
	.type	std_ac_luminance_nrcodes.11, @object
	.size	std_ac_luminance_nrcodes.11, 17
std_ac_luminance_nrcodes.11:
	.string	""
	.string	""
	.string	"\002\001\003\003\002\004\003\005\005\004\004"
	.string	""
	.ascii	"\001}"
	.align 8
	.type	std_dc_luminance_values.12, @object
	.size	std_dc_luminance_values.12, 12
std_dc_luminance_values.12:
	.string	""
	.ascii	"\001\002\003\004\005\006\007\b\t\n\013"
	.align 16
	.type	std_dc_luminance_nrcodes.13, @object
	.size	std_dc_luminance_nrcodes.13, 17
std_dc_luminance_nrcodes.13:
	.string	""
	.string	""
	.string	"\001\005\001\001\001\001\001\001"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.align 16
	.type	head0.14, @object
	.size	head0.14, 25
head0.14:
	.string	"\377\330\377\340"
	.string	"\020JFIF"
	.string	"\001\001"
	.string	""
	.string	"\001"
	.string	"\001"
	.string	""
	.string	"\377\333"
	.string	"\204"
	.align 32
	.type	aasf.15, @object
	.size	aasf.15, 32
aasf.15:
	.long	1077216499
	.long	1081808063
	.long	1080853343
	.long	1079302960
	.long	1077216499
	.long	1074674138
	.long	1069805333
	.long	1061668290
	.align 32
	.type	UVQT.16, @object
	.size	UVQT.16, 256
UVQT.16:
	.long	17
	.long	18
	.long	24
	.long	47
	.long	99
	.long	99
	.long	99
	.long	99
	.long	18
	.long	21
	.long	26
	.long	66
	.long	99
	.long	99
	.long	99
	.long	99
	.long	24
	.long	26
	.long	56
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	47
	.long	66
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.align 32
	.type	YQT.17, @object
	.size	YQT.17, 256
YQT.17:
	.long	16
	.long	11
	.long	10
	.long	16
	.long	24
	.long	40
	.long	51
	.long	61
	.long	12
	.long	12
	.long	14
	.long	19
	.long	26
	.long	58
	.long	60
	.long	55
	.long	14
	.long	13
	.long	16
	.long	24
	.long	40
	.long	57
	.long	69
	.long	56
	.long	14
	.long	17
	.long	22
	.long	29
	.long	51
	.long	87
	.long	80
	.long	62
	.long	18
	.long	22
	.long	37
	.long	56
	.long	68
	.long	109
	.long	103
	.long	77
	.long	24
	.long	35
	.long	55
	.long	64
	.long	81
	.long	104
	.long	113
	.long	92
	.long	49
	.long	64
	.long	78
	.long	87
	.long	103
	.long	121
	.long	120
	.long	101
	.long	72
	.long	92
	.long	95
	.long	98
	.long	112
	.long	100
	.long	103
	.long	99
	.align 32
	.type	crc_table.18, @object
	.size	crc_table.18, 1024
crc_table.18:
	.long	0
	.long	1996959894
	.long	-301047508
	.long	-1727442502
	.long	124634137
	.long	1886057615
	.long	-379345611
	.long	-1637575261
	.long	249268274
	.long	2044508324
	.long	-522852066
	.long	-1747789432
	.long	162941995
	.long	2125561021
	.long	-407360249
	.long	-1866523247
	.long	498536548
	.long	1789927666
	.long	-205950648
	.long	-2067906082
	.long	450548861
	.long	1843258603
	.long	-187386543
	.long	-2083289657
	.long	325883990
	.long	1684777152
	.long	-43845254
	.long	-1973040660
	.long	335633487
	.long	1661365465
	.long	-99664541
	.long	-1928851979
	.long	997073096
	.long	1281953886
	.long	-715111964
	.long	-1570279054
	.long	1006888145
	.long	1258607687
	.long	-770865667
	.long	-1526024853
	.long	901097722
	.long	1119000684
	.long	-608450090
	.long	-1396901568
	.long	853044451
	.long	1172266101
	.long	-589951537
	.long	-1412350631
	.long	651767980
	.long	1373503546
	.long	-925412992
	.long	-1076862698
	.long	565507253
	.long	1454621731
	.long	-809855591
	.long	-1195530993
	.long	671266974
	.long	1594198024
	.long	-972236366
	.long	-1324619484
	.long	795835527
	.long	1483230225
	.long	-1050600021
	.long	-1234817731
	.long	1994146192
	.long	31158534
	.long	-1731059524
	.long	-271249366
	.long	1907459465
	.long	112637215
	.long	-1614814043
	.long	-390540237
	.long	2013776290
	.long	251722036
	.long	-1777751922
	.long	-519137256
	.long	2137656763
	.long	141376813
	.long	-1855689577
	.long	-429695999
	.long	1802195444
	.long	476864866
	.long	-2056965928
	.long	-228458418
	.long	1812370925
	.long	453092731
	.long	-2113342271
	.long	-183516073
	.long	1706088902
	.long	314042704
	.long	-1950435094
	.long	-54949764
	.long	1658658271
	.long	366619977
	.long	-1932296973
	.long	-69972891
	.long	1303535960
	.long	984961486
	.long	-1547960204
	.long	-725929758
	.long	1256170817
	.long	1037604311
	.long	-1529756563
	.long	-740887301
	.long	1131014506
	.long	879679996
	.long	-1385723834
	.long	-631195440
	.long	1141124467
	.long	855842277
	.long	-1442165665
	.long	-586318647
	.long	1342533948
	.long	654459306
	.long	-1106571248
	.long	-921952122
	.long	1466479909
	.long	544179635
	.long	-1184443383
	.long	-832445281
	.long	1591671054
	.long	702138776
	.long	-1328506846
	.long	-942167884
	.long	1504918807
	.long	783551873
	.long	-1212326853
	.long	-1061524307
	.long	-306674912
	.long	-1698712650
	.long	62317068
	.long	1957810842
	.long	-355121351
	.long	-1647151185
	.long	81470997
	.long	1943803523
	.long	-480048366
	.long	-1805370492
	.long	225274430
	.long	2053790376
	.long	-468791541
	.long	-1828061283
	.long	167816743
	.long	2097651377
	.long	-267414716
	.long	-2029476910
	.long	503444072
	.long	1762050814
	.long	-144550051
	.long	-2140837941
	.long	426522225
	.long	1852507879
	.long	-19653770
	.long	-1982649376
	.long	282753626
	.long	1742555852
	.long	-105259153
	.long	-1900089351
	.long	397917763
	.long	1622183637
	.long	-690576408
	.long	-1580100738
	.long	953729732
	.long	1340076626
	.long	-776247311
	.long	-1497606297
	.long	1068828381
	.long	1219638859
	.long	-670225446
	.long	-1358292148
	.long	906185462
	.long	1090812512
	.long	-547295293
	.long	-1469587627
	.long	829329135
	.long	1181335161
	.long	-882789492
	.long	-1134132454
	.long	628085408
	.long	1382605366
	.long	-871598187
	.long	-1156888829
	.long	570562233
	.long	1426400815
	.long	-977650754
	.long	-1296233688
	.long	733239954
	.long	1555261956
	.long	-1026031705
	.long	-1244606671
	.long	752459403
	.long	1541320221
	.long	-1687895376
	.long	-328994266
	.long	1969922972
	.long	40735498
	.long	-1677130071
	.long	-351390145
	.long	1913087877
	.long	83908371
	.long	-1782625662
	.long	-491226604
	.long	2075208622
	.long	213261112
	.long	-1831694693
	.long	-438977011
	.long	2094854071
	.long	198958881
	.long	-2032938284
	.long	-237706686
	.long	1759359992
	.long	534414190
	.long	-2118248755
	.long	-155638181
	.long	1873836001
	.long	414664567
	.long	-2012718362
	.long	-15766928
	.long	1711684554
	.long	285281116
	.long	-1889165569
	.long	-127750551
	.long	1634467795
	.long	376229701
	.long	-1609899400
	.long	-686959890
	.long	1308918612
	.long	956543938
	.long	-1486412191
	.long	-799009033
	.long	1231636301
	.long	1047427035
	.long	-1362007478
	.long	-640263460
	.long	1088359270
	.long	936918000
	.long	-1447252397
	.long	-558129467
	.long	1202900863
	.long	817233897
	.long	-1111625188
	.long	-893730166
	.long	1404277552
	.long	615818150
	.long	-1160759803
	.long	-841546093
	.long	1423857449
	.long	601450431
	.long	-1285129682
	.long	-1000256840
	.long	1567103746
	.long	711928724
	.long	-1274298825
	.long	-1022587231
	.long	1510334235
	.long	755167117
	.data
	.align 16
	.type	firstmap.19, @object
	.size	firstmap.19, 20
firstmap.19:
	.long	0
	.long	1
	.long	0
	.long	5
	.long	6
	.align 16
	.type	mapping.20, @object
	.size	mapping.20, 20
mapping.20:
	.long	0
	.long	1
	.long	2
	.long	3
	.long	4
	.section	.rodata
	.align 16
	.type	__PRETTY_FUNCTION__.21, @object
	.size	__PRETTY_FUNCTION__.21, 22
__PRETTY_FUNCTION__.21:
	.string	"stbi_write_png_to_mem"
	.align 8
	.type	__PRETTY_FUNCTION__.22, @object
	.size	__PRETTY_FUNCTION__.22, 15
__PRETTY_FUNCTION__.22:
	.string	"stbiw__sbgrowf"
	.align 16
	.type	disteb.23, @object
	.size	disteb.23, 30
disteb.23:
	.string	""
	.string	""
	.string	""
	.string	""
	.ascii	"\001\001\002\002\003\003\004\004\005\005\006\006\007\007\b\b"
	.ascii	"\t\t\n\n\013\013\f\f\r\r"
	.align 32
	.type	distc.24, @object
	.size	distc.24, 62
distc.24:
	.value	1
	.value	2
	.value	3
	.value	4
	.value	5
	.value	7
	.value	9
	.value	13
	.value	17
	.value	25
	.value	33
	.value	49
	.value	65
	.value	97
	.value	129
	.value	193
	.value	257
	.value	385
	.value	513
	.value	769
	.value	1025
	.value	1537
	.value	2049
	.value	3073
	.value	4097
	.value	6145
	.value	8193
	.value	12289
	.value	16385
	.value	24577
	.value	-32768
	.align 16
	.type	lengtheb.25, @object
	.size	lengtheb.25, 29
lengtheb.25:
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\001\001\001\001\002\002\002\002\003\003\003\003\004\004\004\004\005\005\005\005"
	.align 32
	.type	lengthc.26, @object
	.size	lengthc.26, 60
lengthc.26:
	.value	3
	.value	4
	.value	5
	.value	6
	.value	7
	.value	8
	.value	9
	.value	10
	.value	11
	.value	13
	.value	15
	.value	17
	.value	19
	.value	23
	.value	27
	.value	31
	.value	35
	.value	43
	.value	51
	.value	59
	.value	67
	.value	83
	.value	99
	.value	115
	.value	131
	.value	163
	.value	195
	.value	227
	.value	258
	.value	259
	.align 16
	.type	__PRETTY_FUNCTION__.27, @object
	.size	__PRETTY_FUNCTION__.27, 19
__PRETTY_FUNCTION__.27:
	.string	"stbi_zlib_compress"
	.align 8
	.type	__PRETTY_FUNCTION__.30, @object
	.size	__PRETTY_FUNCTION__.30, 15
__PRETTY_FUNCTION__.30:
	.string	"stbiw__writefv"
	.align 16
	.type	length_dezigzag.31, @object
	.size	length_dezigzag.31, 19
length_dezigzag.31:
	.string	"\020\021\022"
	.ascii	"\b\007\t\006\n\005\013\004\f\003\r\002\016\001\017"
	.align 32
	.type	__PRETTY_FUNCTION__.33, @object
	.size	__PRETTY_FUNCTION__.33, 33
__PRETTY_FUNCTION__.33:
	.string	"stbi__load_and_postprocess_16bit"
	.align 8
	.type	__PRETTY_FUNCTION__.34, @object
	.size	__PRETTY_FUNCTION__.34, 15
__PRETTY_FUNCTION__.34:
	.string	"stbi__tga_load"
	.align 16
	.type	__PRETTY_FUNCTION__.35, @object
	.size	__PRETTY_FUNCTION__.35, 23
__PRETTY_FUNCTION__.35:
	.string	"stbi__jpeg_huff_decode"
	.type	rgb.36, @object
	.size	rgb.36, 3
rgb.36:
	.ascii	"RGB"
	.type	tag.37, @object
	.size	tag.37, 6
tag.37:
	.string	"Adobe"
	.type	tag.38, @object
	.size	tag.38, 5
tag.38:
	.string	"JFIF"
	.align 32
	.type	shift_table.39, @object
	.size	shift_table.39, 36
shift_table.39:
	.long	0
	.long	0
	.long	0
	.long	1
	.long	0
	.long	2
	.long	4
	.long	6
	.long	0
	.align 32
	.type	mul_table.40, @object
	.size	mul_table.40, 36
mul_table.40:
	.long	0
	.long	255
	.long	85
	.long	73
	.long	17
	.long	33
	.long	65
	.long	129
	.long	1
	.align 16
	.type	__PRETTY_FUNCTION__.41, @object
	.size	__PRETTY_FUNCTION__.41, 18
__PRETTY_FUNCTION__.41:
	.string	"stbi__shiftsigned"
	.align 16
	.type	__PRETTY_FUNCTION__.42, @object
	.size	__PRETTY_FUNCTION__.42, 23
__PRETTY_FUNCTION__.42:
	.string	"stbi__convert_format16"
	.align 16
	.type	__PRETTY_FUNCTION__.43, @object
	.size	__PRETTY_FUNCTION__.43, 21
__PRETTY_FUNCTION__.43:
	.string	"stbi__convert_format"
	.align 16
	.type	__PRETTY_FUNCTION__.44, @object
	.size	__PRETTY_FUNCTION__.44, 16
__PRETTY_FUNCTION__.44:
	.string	"stbi__de_iphone"
	.align 16
	.type	__PRETTY_FUNCTION__.45, @object
	.size	__PRETTY_FUNCTION__.45, 27
__PRETTY_FUNCTION__.45:
	.string	"stbi__compute_transparency"
	.align 16
	.type	__PRETTY_FUNCTION__.46, @object
	.size	__PRETTY_FUNCTION__.46, 29
__PRETTY_FUNCTION__.46:
	.string	"stbi__compute_transparency16"
	.align 16
	.type	__PRETTY_FUNCTION__.47, @object
	.size	__PRETTY_FUNCTION__.47, 27
__PRETTY_FUNCTION__.47:
	.string	"stbi__create_png_image_raw"
	.data
	.align 16
	.type	invalid_chunk.48, @object
	.size	invalid_chunk.48, 25
invalid_chunk.48:
	.string	"XXXX PNG chunk not known"
	.section	.rodata
	.align 32
	.type	__PRETTY_FUNCTION__.50, @object
	.size	__PRETTY_FUNCTION__.50, 32
__PRETTY_FUNCTION__.50:
	.string	"stbi__load_and_postprocess_8bit"
	.align 32
	.type	stbiw__jpg_ZigZag, @object
	.size	stbiw__jpg_ZigZag, 64
stbiw__jpg_ZigZag:
	.string	""
	.ascii	"\001\005\006\016\017\033\034\002\004\007\r\020\032\035*\003\b"
	.ascii	"\f\021\031\036)+\t\013\022\030\037(,5\n\023\027 '-46\024\026"
	.ascii	"!&.37<\025\"%/28;=#$019:>?"
	.local	stbi__flip_vertically_on_write
	.comm	stbi__flip_vertically_on_write,4,4
	.globl	stbi_write_force_png_filter
	.data
	.align 4
	.type	stbi_write_force_png_filter, @object
	.size	stbi_write_force_png_filter, 4
stbi_write_force_png_filter:
	.long	-1
	.globl	stbi_write_tga_with_rle
	.align 4
	.type	stbi_write_tga_with_rle, @object
	.size	stbi_write_tga_with_rle, 4
stbi_write_tga_with_rle:
	.long	1
	.globl	stbi_write_png_compression_level
	.align 4
	.type	stbi_write_png_compression_level, @object
	.size	stbi_write_png_compression_level, 4
stbi_write_png_compression_level:
	.long	8
	.section	.tbss,"awT",@nobits
	.align 4
	.type	stbi__de_iphone_flag_set, @object
	.size	stbi__de_iphone_flag_set, 4
stbi__de_iphone_flag_set:
	.zero	4
	.align 4
	.type	stbi__de_iphone_flag_local, @object
	.size	stbi__de_iphone_flag_local, 4
stbi__de_iphone_flag_local:
	.zero	4
	.align 4
	.type	stbi__unpremultiply_on_load_set, @object
	.size	stbi__unpremultiply_on_load_set, 4
stbi__unpremultiply_on_load_set:
	.zero	4
	.align 4
	.type	stbi__unpremultiply_on_load_local, @object
	.size	stbi__unpremultiply_on_load_local, 4
stbi__unpremultiply_on_load_local:
	.zero	4
	.local	stbi__de_iphone_flag_global
	.comm	stbi__de_iphone_flag_global,4,4
	.local	stbi__unpremultiply_on_load_global
	.comm	stbi__unpremultiply_on_load_global,4,4
	.section	.rodata
	.align 8
	.type	stbi__depth_scale_table, @object
	.size	stbi__depth_scale_table, 9
stbi__depth_scale_table:
	.string	""
	.string	"\377U"
	.string	"\021"
	.string	""
	.string	""
	.ascii	"\001"
	.type	first_row_filter, @object
	.size	first_row_filter, 5
first_row_filter:
	.string	""
	.string	"\001"
	.ascii	"\005\006"
	.align 32
	.type	stbi__zdefault_distance, @object
	.size	stbi__zdefault_distance, 32
stbi__zdefault_distance:
	.ascii	"\005\005\005\005\005\005\005\005\005\005\005\005\005\005\005"
	.ascii	"\005\005\005\005\005\005\005\005\005\005\005\005\005\005\005"
	.ascii	"\005\005"
	.align 32
	.type	stbi__zdefault_length, @object
	.size	stbi__zdefault_length, 288
stbi__zdefault_length:
	.ascii	"\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b"
	.ascii	"\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b"
	.ascii	"\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b"
	.ascii	"\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b"
	.ascii	"\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\t\t\t\t\t\t"
	.ascii	"\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t"
	.ascii	"\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t"
	.ascii	"\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t"
	.ascii	"\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\007\007\007\007\007\007\007"
	.ascii	"\007\007\007\007\007\007\007\007\007\007\007\007\007\007\007"
	.ascii	"\007\007\b\b\b\b\b\b\b\b"
	.align 32
	.type	stbi__zdist_extra, @object
	.size	stbi__zdist_extra, 128
stbi__zdist_extra:
	.long	0
	.long	0
	.long	0
	.long	0
	.long	1
	.long	1
	.long	2
	.long	2
	.long	3
	.long	3
	.long	4
	.long	4
	.long	5
	.long	5
	.long	6
	.long	6
	.long	7
	.long	7
	.long	8
	.long	8
	.long	9
	.long	9
	.long	10
	.long	10
	.long	11
	.long	11
	.long	12
	.long	12
	.long	13
	.long	13
	.zero	8
	.align 32
	.type	stbi__zdist_base, @object
	.size	stbi__zdist_base, 128
stbi__zdist_base:
	.long	1
	.long	2
	.long	3
	.long	4
	.long	5
	.long	7
	.long	9
	.long	13
	.long	17
	.long	25
	.long	33
	.long	49
	.long	65
	.long	97
	.long	129
	.long	193
	.long	257
	.long	385
	.long	513
	.long	769
	.long	1025
	.long	1537
	.long	2049
	.long	3073
	.long	4097
	.long	6145
	.long	8193
	.long	12289
	.long	16385
	.long	24577
	.long	0
	.long	0
	.align 32
	.type	stbi__zlength_extra, @object
	.size	stbi__zlength_extra, 124
stbi__zlength_extra:
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	1
	.long	1
	.long	1
	.long	1
	.long	2
	.long	2
	.long	2
	.long	2
	.long	3
	.long	3
	.long	3
	.long	3
	.long	4
	.long	4
	.long	4
	.long	4
	.long	5
	.long	5
	.long	5
	.long	5
	.long	0
	.long	0
	.long	0
	.align 32
	.type	stbi__zlength_base, @object
	.size	stbi__zlength_base, 124
stbi__zlength_base:
	.long	3
	.long	4
	.long	5
	.long	6
	.long	7
	.long	8
	.long	9
	.long	10
	.long	11
	.long	13
	.long	15
	.long	17
	.long	19
	.long	23
	.long	27
	.long	31
	.long	35
	.long	43
	.long	51
	.long	59
	.long	67
	.long	83
	.long	99
	.long	115
	.long	131
	.long	163
	.long	195
	.long	227
	.long	258
	.long	0
	.long	0
	.align 32
	.type	stbi__jpeg_dezigzag, @object
	.size	stbi__jpeg_dezigzag, 79
stbi__jpeg_dezigzag:
	.string	""
	.ascii	"\001\b\020\t\002\003\n\021\030 \031\022\013\004\005\f\023\032"
	.ascii	"!(0)\"\033\024\r\006\007\016\025\034#*1892+$\035\026\017\027"
	.ascii	"\036%,3:;4-&\037'.5<=6/7>????????????????"
	.align 32
	.type	stbi__jbias, @object
	.size	stbi__jbias, 64
stbi__jbias:
	.long	0
	.long	-1
	.long	-3
	.long	-7
	.long	-15
	.long	-31
	.long	-63
	.long	-127
	.long	-255
	.long	-511
	.long	-1023
	.long	-2047
	.long	-4095
	.long	-8191
	.long	-16383
	.long	-32767
	.align 32
	.type	stbi__bmask, @object
	.size	stbi__bmask, 68
stbi__bmask:
	.long	0
	.long	1
	.long	3
	.long	7
	.long	15
	.long	31
	.long	63
	.long	127
	.long	255
	.long	511
	.long	1023
	.long	2047
	.long	4095
	.long	8191
	.long	16383
	.long	32767
	.long	65535
	.data
	.align 4
	.type	stbi__h2l_scale_i, @object
	.size	stbi__h2l_scale_i, 4
stbi__h2l_scale_i:
	.long	1065353216
	.align 4
	.type	stbi__h2l_gamma_i, @object
	.size	stbi__h2l_gamma_i, 4
stbi__h2l_gamma_i:
	.long	1055439406
	.align 4
	.type	stbi__l2h_scale, @object
	.size	stbi__l2h_scale, 4
stbi__l2h_scale:
	.long	1065353216
	.align 4
	.type	stbi__l2h_gamma, @object
	.size	stbi__l2h_gamma, 4
stbi__l2h_gamma:
	.long	1074580685
	.section	.tbss
	.align 4
	.type	stbi__vertically_flip_on_load_set, @object
	.size	stbi__vertically_flip_on_load_set, 4
stbi__vertically_flip_on_load_set:
	.zero	4
	.align 4
	.type	stbi__vertically_flip_on_load_local, @object
	.size	stbi__vertically_flip_on_load_local, 4
stbi__vertically_flip_on_load_local:
	.zero	4
	.local	stbi__vertically_flip_on_load_global
	.comm	stbi__vertically_flip_on_load_global,4,4
	.align 8
	.type	stbi__g_failure_reason, @object
	.size	stbi__g_failure_reason, 8
stbi__g_failure_reason:
	.zero	8
	.section	.data.rel.ro.local,"aw"
	.align 16
	.type	stbi__stdio_callbacks, @object
	.size	stbi__stdio_callbacks, 24
stbi__stdio_callbacks:
	.quad	stbi__stdio_read
	.quad	stbi__stdio_skip
	.quad	stbi__stdio_eof
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC0:
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.align 16
.LC1:
	.value	2
	.value	2
	.value	2
	.value	2
	.value	2
	.value	2
	.value	2
	.value	2
	.align 16
.LC2:
	.value	255
	.value	255
	.value	255
	.value	255
	.value	255
	.value	255
	.value	255
	.value	255
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC4:
	.long	1060439283
	.align 4
.LC5:
	.long	1057655764
	.align 4
.LC6:
	.long	1053028117
	.align 4
.LC7:
	.long	1067924853
	.section	.rodata.cst16
	.align 16
.LC11:
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.align 16
.LC12:
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.align 16
.LC13:
	.long	65535
	.long	65535
	.long	65535
	.long	65535
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC17:
	.value	-1
	.value	-1
	.value	-1
	.value	-1
	.section	.rodata.cst16
	.align 16
.LC18:
	.byte	0
	.byte	1
	.byte	0
	.byte	1
	.byte	0
	.byte	1
	.byte	2
	.byte	3
	.byte	2
	.byte	3
	.byte	0
	.byte	1
	.byte	4
	.byte	5
	.byte	4
	.byte	5
	.align 16
.LC19:
	.byte	0
	.byte	1
	.byte	2
	.byte	3
	.byte	0
	.byte	1
	.byte	6
	.byte	7
	.byte	8
	.byte	9
	.byte	2
	.byte	3
	.byte	12
	.byte	13
	.byte	14
	.byte	15
	.align 16
.LC20:
	.byte	0
	.byte	1
	.byte	6
	.byte	7
	.byte	6
	.byte	7
	.byte	0
	.byte	1
	.byte	8
	.byte	9
	.byte	8
	.byte	9
	.byte	0
	.byte	1
	.byte	10
	.byte	11
	.align 16
.LC21:
	.byte	4
	.byte	5
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	6
	.byte	7
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	8
	.byte	9
	.byte	-128
	.byte	-128
	.align 16
.LC22:
	.byte	-128
	.byte	-128
	.byte	2
	.byte	3
	.byte	4
	.byte	5
	.byte	-128
	.byte	-128
	.byte	8
	.byte	9
	.byte	10
	.byte	11
	.byte	-128
	.byte	-128
	.byte	14
	.byte	15
	.align 16
.LC23:
	.byte	10
	.byte	11
	.byte	0
	.byte	1
	.byte	12
	.byte	13
	.byte	12
	.byte	13
	.byte	0
	.byte	1
	.byte	14
	.byte	15
	.byte	14
	.byte	15
	.byte	0
	.byte	1
	.align 16
.LC24:
	.byte	0
	.byte	1
	.byte	10
	.byte	11
	.byte	4
	.byte	5
	.byte	6
	.byte	7
	.byte	12
	.byte	13
	.byte	10
	.byte	11
	.byte	12
	.byte	13
	.byte	14
	.byte	15
	.align 16
.LC25:
	.byte	0
	.byte	1
	.byte	0
	.byte	1
	.byte	0
	.byte	1
	.byte	4
	.byte	5
	.byte	4
	.byte	5
	.byte	4
	.byte	5
	.byte	8
	.byte	9
	.byte	8
	.byte	9
	.align 16
.LC26:
	.byte	0
	.byte	1
	.byte	4
	.byte	5
	.byte	4
	.byte	5
	.byte	4
	.byte	5
	.byte	8
	.byte	9
	.byte	8
	.byte	9
	.byte	8
	.byte	9
	.byte	12
	.byte	13
	.align 16
.LC27:
	.byte	4
	.byte	5
	.byte	4
	.byte	5
	.byte	8
	.byte	9
	.byte	8
	.byte	9
	.byte	8
	.byte	9
	.byte	12
	.byte	13
	.byte	12
	.byte	13
	.byte	12
	.byte	13
	.align 16
.LC28:
	.byte	0
	.byte	1
	.byte	6
	.byte	7
	.byte	12
	.byte	13
	.byte	2
	.byte	3
	.byte	8
	.byte	9
	.byte	14
	.byte	15
	.byte	4
	.byte	5
	.byte	10
	.byte	11
	.align 16
.LC29:
	.value	77
	.value	77
	.value	77
	.value	77
	.value	77
	.value	77
	.value	77
	.value	77
	.align 16
.LC30:
	.value	150
	.value	150
	.value	150
	.value	150
	.value	150
	.value	150
	.value	150
	.value	150
	.align 16
.LC31:
	.value	29
	.value	29
	.value	29
	.value	29
	.value	29
	.value	29
	.value	29
	.value	29
	.align 16
.LC32:
	.byte	10
	.byte	11
	.byte	12
	.byte	13
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.align 16
.LC33:
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	0
	.byte	1
	.byte	2
	.byte	3
	.byte	4
	.byte	5
	.byte	8
	.byte	9
	.byte	10
	.byte	11
	.byte	12
	.byte	13
	.align 16
.LC34:
	.byte	0
	.byte	1
	.byte	2
	.byte	3
	.byte	4
	.byte	5
	.byte	8
	.byte	9
	.byte	10
	.byte	11
	.byte	12
	.byte	13
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.align 16
.LC35:
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	0
	.byte	1
	.byte	2
	.byte	3
	.align 16
.LC36:
	.byte	4
	.byte	5
	.byte	8
	.byte	9
	.byte	10
	.byte	11
	.byte	12
	.byte	13
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.align 16
.LC37:
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	0
	.byte	1
	.byte	2
	.byte	3
	.byte	4
	.byte	5
	.byte	8
	.byte	9
	.align 16
.LC38:
	.value	8
	.value	8
	.value	8
	.value	8
	.value	8
	.value	8
	.value	8
	.value	8
	.align 16
.LC39:
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.set	.LC40,.LC39
	.align 16
.LC41:
	.value	5743
	.value	5743
	.value	5743
	.value	5743
	.value	5743
	.value	5743
	.value	5743
	.value	5743
	.align 16
.LC42:
	.value	-1410
	.value	-1410
	.value	-1410
	.value	-1410
	.value	-1410
	.value	-1410
	.value	-1410
	.value	-1410
	.align 16
.LC43:
	.value	7258
	.value	7258
	.value	7258
	.value	7258
	.value	7258
	.value	7258
	.value	7258
	.value	7258
	.align 16
.LC44:
	.value	-2925
	.value	-2925
	.value	-2925
	.value	-2925
	.value	-2925
	.value	-2925
	.value	-2925
	.value	-2925
	.align 16
.LC45:
	.value	2217
	.value	-5350
	.value	2217
	.value	-5350
	.value	2217
	.value	-5350
	.value	2217
	.value	-5350
	.align 16
.LC46:
	.value	5352
	.value	2217
	.value	5352
	.value	2217
	.value	5352
	.value	2217
	.value	5352
	.value	2217
	.align 16
.LC47:
	.value	-6811
	.value	-8034
	.value	-6811
	.value	-8034
	.value	-6811
	.value	-8034
	.value	-6811
	.value	-8034
	.align 16
.LC48:
	.value	-8034
	.value	4552
	.value	-8034
	.value	4552
	.value	-8034
	.value	4552
	.value	-8034
	.value	4552
	.align 16
.LC49:
	.value	6813
	.value	-1597
	.value	6813
	.value	-1597
	.value	6813
	.value	-1597
	.value	6813
	.value	-1597
	.align 16
.LC50:
	.value	-1597
	.value	4552
	.value	-1597
	.value	4552
	.value	-1597
	.value	4552
	.value	-1597
	.value	4552
	.align 16
.LC51:
	.value	1131
	.value	4816
	.value	1131
	.value	4816
	.value	1131
	.value	4816
	.value	1131
	.value	4816
	.align 16
.LC52:
	.value	4816
	.value	-5681
	.value	4816
	.value	-5681
	.value	4816
	.value	-5681
	.value	4816
	.value	-5681
	.align 16
.LC53:
	.long	512
	.long	512
	.long	512
	.long	512
	.align 16
.LC54:
	.long	16842752
	.long	16842752
	.long	16842752
	.long	16842752
	.section	.rodata.cst8
	.align 8
.LC55:
	.long	0
	.long	1072693248
	.section	.rodata.cst4
	.align 4
.LC56:
	.long	1077936128
	.set	.LC57,.LC194
	.align 4
.LC62:
	.long	172994847
	.align 4
.LC63:
	.long	1132462080
	.section	.rodata.cst16
	.align 16
.LC64:
	.quad	5638868765947084579
	.quad	7598231316865893699
	.align 16
.LC65:
	.quad	2340009372826301556
	.quad	7449355557986792563
	.align 16
.LC66:
	.quad	3343206294633275237
	.quad	6071218788584786536
	.align 16
.LC67:
	.quad	6878238401287566141
	.quad	7305515286472780914
	.align 16
.LC70:
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	1
	.byte	0
	.byte	2
	.byte	2
	.byte	0
	.byte	3
	.byte	3
	.byte	0
	.byte	4
	.byte	4
	.byte	0
	.byte	5
	.align 16
.LC71:
	.byte	0
	.byte	1
	.byte	0
	.byte	3
	.byte	4
	.byte	1
	.byte	6
	.byte	7
	.byte	2
	.byte	9
	.byte	10
	.byte	3
	.byte	12
	.byte	13
	.byte	4
	.byte	15
	.align 16
.LC72:
	.byte	0
	.byte	0
	.byte	-1
	.byte	0
	.byte	0
	.byte	-1
	.byte	0
	.byte	0
	.byte	-1
	.byte	0
	.byte	0
	.byte	-1
	.byte	0
	.byte	0
	.byte	-1
	.byte	0
	.align 16
.LC73:
	.byte	5
	.byte	0
	.byte	6
	.byte	6
	.byte	0
	.byte	7
	.byte	7
	.byte	0
	.byte	8
	.byte	8
	.byte	0
	.byte	9
	.byte	9
	.byte	0
	.byte	10
	.byte	10
	.align 16
.LC74:
	.byte	0
	.byte	5
	.byte	2
	.byte	3
	.byte	6
	.byte	5
	.byte	6
	.byte	7
	.byte	8
	.byte	9
	.byte	8
	.byte	11
	.byte	12
	.byte	9
	.byte	14
	.byte	15
	.align 16
.LC75:
	.byte	0
	.byte	-1
	.byte	0
	.byte	0
	.byte	-1
	.byte	0
	.byte	0
	.byte	-1
	.byte	0
	.byte	0
	.byte	-1
	.byte	0
	.byte	0
	.byte	-1
	.byte	0
	.byte	0
	.align 16
.LC76:
	.byte	0
	.byte	11
	.byte	11
	.byte	0
	.byte	12
	.byte	12
	.byte	0
	.byte	13
	.byte	13
	.byte	0
	.byte	14
	.byte	14
	.byte	0
	.byte	15
	.byte	15
	.byte	0
	.align 16
.LC77:
	.byte	10
	.byte	-128
	.byte	-128
	.byte	11
	.byte	-128
	.byte	-128
	.byte	12
	.byte	-128
	.byte	-128
	.byte	13
	.byte	-128
	.byte	-128
	.byte	14
	.byte	-128
	.byte	-128
	.byte	15
	.align 16
.LC78:
	.byte	-128
	.byte	1
	.byte	2
	.byte	-128
	.byte	4
	.byte	5
	.byte	-128
	.byte	7
	.byte	8
	.byte	-128
	.byte	10
	.byte	11
	.byte	-128
	.byte	13
	.byte	14
	.byte	-128
	.align 16
.LC79:
	.byte	0
	.byte	0
	.byte	0
	.byte	2
	.byte	2
	.byte	2
	.byte	4
	.byte	4
	.byte	4
	.byte	6
	.byte	6
	.byte	6
	.byte	8
	.byte	8
	.byte	8
	.byte	10
	.align 16
.LC80:
	.byte	0
	.byte	0
	.byte	2
	.byte	2
	.byte	2
	.byte	4
	.byte	4
	.byte	4
	.byte	6
	.byte	6
	.byte	6
	.byte	8
	.byte	8
	.byte	8
	.byte	10
	.byte	10
	.align 16
.LC81:
	.byte	4
	.byte	6
	.byte	6
	.byte	6
	.byte	8
	.byte	8
	.byte	8
	.byte	10
	.byte	10
	.byte	10
	.byte	12
	.byte	12
	.byte	12
	.byte	14
	.byte	14
	.byte	14
	.align 16
.LC82:
	.byte	0
	.byte	3
	.byte	6
	.byte	9
	.byte	12
	.byte	15
	.byte	2
	.byte	5
	.byte	8
	.byte	11
	.byte	14
	.byte	1
	.byte	4
	.byte	7
	.byte	10
	.byte	13
	.align 16
.LC83:
	.byte	77
	.byte	77
	.byte	77
	.byte	77
	.byte	77
	.byte	77
	.byte	77
	.byte	77
	.byte	77
	.byte	77
	.byte	77
	.byte	77
	.byte	77
	.byte	77
	.byte	77
	.byte	77
	.align 16
.LC84:
	.byte	-106
	.byte	-106
	.byte	-106
	.byte	-106
	.byte	-106
	.byte	-106
	.byte	-106
	.byte	-106
	.byte	-106
	.byte	-106
	.byte	-106
	.byte	-106
	.byte	-106
	.byte	-106
	.byte	-106
	.byte	-106
	.align 16
.LC85:
	.byte	29
	.byte	29
	.byte	29
	.byte	29
	.byte	29
	.byte	29
	.byte	29
	.byte	29
	.byte	29
	.byte	29
	.byte	29
	.byte	29
	.byte	29
	.byte	29
	.byte	29
	.byte	29
	.align 16
.LC86:
	.byte	10
	.byte	12
	.byte	13
	.byte	14
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.align 16
.LC87:
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	0
	.byte	1
	.byte	2
	.byte	4
	.byte	5
	.byte	6
	.byte	8
	.byte	9
	.byte	10
	.byte	12
	.byte	13
	.byte	14
	.align 16
.LC88:
	.byte	0
	.byte	1
	.byte	2
	.byte	4
	.byte	5
	.byte	6
	.byte	8
	.byte	9
	.byte	10
	.byte	12
	.byte	13
	.byte	14
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.align 16
.LC89:
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	0
	.byte	1
	.byte	2
	.byte	4
	.align 16
.LC90:
	.byte	5
	.byte	6
	.byte	8
	.byte	9
	.byte	10
	.byte	12
	.byte	13
	.byte	14
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.align 16
.LC91:
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	0
	.byte	1
	.byte	2
	.byte	4
	.byte	5
	.byte	6
	.byte	8
	.byte	9
	.align 16
.LC98:
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.align 16
.LC99:
	.byte	63
	.byte	63
	.byte	63
	.byte	63
	.byte	63
	.byte	63
	.byte	63
	.byte	63
	.byte	63
	.byte	63
	.byte	63
	.byte	63
	.byte	63
	.byte	63
	.byte	63
	.byte	63
	.align 16
.LC100:
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.align 16
.LC101:
	.byte	31
	.byte	31
	.byte	31
	.byte	31
	.byte	31
	.byte	31
	.byte	31
	.byte	31
	.byte	31
	.byte	31
	.byte	31
	.byte	31
	.byte	31
	.byte	31
	.byte	31
	.byte	31
	.set	.LC124,.LC202
	.section	.rodata.cst4
	.align 4
.LC130:
	.long	1199570688
	.set	.LC131,.LC247
	.section	.rodata.cst8
	.align 8
.LC142:
	.long	0
	.long	-1
	.align 8
.LC155:
	.long	31744
	.long	992
	.section	.rodata.cst16
	.align 16
.LC156:
	.long	16711680
	.long	65280
	.long	255
	.long	-16777216
	.align 16
.LC175:
	.long	0
	.long	4
	.long	0
	.long	2
	.section	.rodata.cst8
	.align 8
.LC176:
	.long	0
	.long	1
	.section	.rodata.cst16
	.align 16
.LC177:
	.long	0
	.long	0
	.long	4
	.long	0
	.section	.rodata.cst8
	.align 8
.LC178:
	.long	2
	.long	0
	.section	.rodata.cst16
	.align 16
.LC179:
	.long	8
	.long	8
	.long	4
	.long	4
	.set	.LC180,.LC230
	.align 16
.LC181:
	.long	8
	.long	8
	.long	8
	.long	4
	.set	.LC182,.LC256+8
	.align 16
.LC193:
	.long	1077216499
	.long	1074674138
	.long	1069805333
	.long	1061668290
	.align 16
.LC194:
	.long	1065353216
	.long	1065353216
	.long	1065353216
	.long	1065353216
	.align 16
.LC195:
	.long	1077216499
	.long	1081808063
	.long	1080853343
	.long	1079302960
	.align 16
.LC196:
	.long	1058424226
	.long	1058424226
	.long	1058424226
	.long	1058424226
	.align 16
.LC197:
	.long	1050220167
	.long	1050220167
	.long	1050220167
	.long	1050220167
	.align 16
.LC198:
	.long	1038710997
	.long	1038710997
	.long	1038710997
	.long	1038710997
	.align 16
.LC199:
	.long	-1023410176
	.long	-1023410176
	.long	-1023410176
	.long	-1023410176
	.align 16
.LC200:
	.long	1051302633
	.long	1051302633
	.long	1051302633
	.long	1051302633
	.align 16
.LC201:
	.long	-1104360914
	.long	-1104360914
	.long	-1104360914
	.long	-1104360914
	.align 16
.LC202:
	.long	1056964608
	.long	1056964608
	.long	1056964608
	.long	1056964608
	.align 16
.LC203:
	.long	1054236297
	.long	1054236297
	.long	1054236297
	.long	1054236297
	.align 16
.LC204:
	.long	1034323419
	.long	1034323419
	.long	1034323419
	.long	1034323419
	.set	.LC205,.LC196
	.set	.LC206,.LC197
	.set	.LC207,.LC198
	.section	.rodata.cst4
	.align 4
.LC208:
	.long	1124073472
	.set	.LC209,.LC200
	.set	.LC210,.LC201
	.set	.LC211,.LC203
	.set	.LC212,.LC204
	.section	.rodata.cst16
	.align 16
.LC213:
	.long	13
	.long	13
	.long	13
	.long	13
	.align 16
.LC214:
	.long	1048576000
	.long	1048576000
	.long	1048576000
	.long	1048576000
	.align 16
.LC226:
	.long	0
	.long	0
	.long	1
	.long	1
	.align 16
.LC229:
	.long	16
	.long	16
	.long	16
	.long	16
	.align 16
.LC230:
	.long	2
	.long	2
	.long	2
	.long	2
	.align 16
.LC231:
	.long	4
	.long	4
	.long	4
	.long	4
	.align 16
.LC232:
	.long	6
	.long	6
	.long	6
	.long	6
	.align 16
.LC233:
	.long	8
	.long	8
	.long	8
	.long	8
	.align 16
.LC234:
	.long	10
	.long	10
	.long	10
	.long	10
	.align 16
.LC235:
	.long	12
	.long	12
	.long	12
	.long	12
	.align 16
.LC236:
	.long	14
	.long	14
	.long	14
	.long	14
	.align 16
.LC247:
	.long	1132396544
	.long	1132396544
	.long	1132396544
	.long	1132396544
	.section	.rodata.cst8
	.align 8
.LC250:
	.long	1
	.long	128
	.align 8
.LC254:
	.long	2
	.long	1
	.section	.rodata.cst16
	.align 16
.LC256:
	.long	-1
	.long	0
	.long	4
	.long	2
	.section	.rodata.cst8
	.align 8
.LC257:
	.byte	0
	.byte	0
	.byte	0
	.byte	13
	.byte	73
	.byte	72
	.byte	68
	.byte	82
	.align 8
.LC258:
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	73
	.byte	69
	.byte	78
	.byte	68
	.align 8
.LC267:
	.long	962072674
	.long	1071827124
	.align 8
.LC268:
	.long	1999736773
	.long	1070801197
	.align 8
.LC269:
	.long	-1614907703
	.long	1069362970
	.align 8
.LC270:
	.long	0
	.long	1093567616
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
