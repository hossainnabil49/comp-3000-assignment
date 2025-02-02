	.file	"3000ping.c"
	.text
	.section	.rodata
.LC0:
	.string	"%s"
	.text
	.globl	pr_addr
	.type	pr_addr, @function
pr_addr:
.LFB36:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$160, %rsp
	movq	%rdi, -152(%rbp)
	movl	%esi, -156(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	last_salen.2(%rip), %eax
	cmpl	%eax, -156(%rbp)
	jne	.L2
	movl	-156(%rbp), %edx
	movq	-152(%rbp), %rax
	leaq	last_sa.1(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	memcmp@PLT
	testl	%eax, %eax
	jne	.L2
	leaq	buffer.0(%rip), %rax
	jmp	.L4
.L2:
	movl	-156(%rbp), %eax
	movl	%eax, last_salen.2(%rip)
	movl	last_salen.2(%rip), %eax
	movl	%eax, %edx
	movq	-152(%rbp), %rax
	movq	%rax, %rsi
	leaq	last_sa.1(%rip), %rax
	movq	%rax, %rdi
	call	memcpy@PLT
	leaq	-144(%rbp), %rdx
	movl	-156(%rbp), %esi
	movq	-152(%rbp), %rax
	subq	$8, %rsp
	pushq	$1
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$128, %ecx
	movq	%rax, %rdi
	call	getnameinfo@PLT
	addq	$16, %rsp
	leaq	-144(%rbp), %rax
	movq	%rax, %rcx
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdx
	movl	$4096, %esi
	leaq	buffer.0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	snprintf@PLT
	leaq	buffer.0(%rip), %rax
.L4:
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L5
	call	__stack_chk_fail@PLT
.L5:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE36:
	.size	pr_addr, .-pr_addr
	.globl	in_cksum
	.type	in_cksum, @function
in_cksum:
.LFB37:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r12
	pushq	%rbx
	.cfi_offset 12, -24
	.cfi_offset 3, -32
	movq	%rdi, -40(%rbp)
	movl	%esi, %eax
	movw	%dx, -44(%rbp)
	movl	%eax, %r12d
	movq	-40(%rbp), %rax
	movq	%rax, -24(%rbp)
	movzwl	-44(%rbp), %ebx
	jmp	.L7
.L8:
	movq	-24(%rbp), %rax
	leaq	2(%rax), %rdx
	movq	%rdx, -24(%rbp)
	movzwl	(%rax), %eax
	movzwl	%ax, %eax
	addl	%eax, %ebx
	subl	$2, %r12d
.L7:
	cmpl	$1, %r12d
	jg	.L8
	cmpl	$1, %r12d
	jne	.L9
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, %ebx
.L9:
	movl	%ebx, %edx
	sarl	$16, %edx
	movzwl	%bx, %eax
	leal	(%rdx,%rax), %ebx
	movl	%ebx, %eax
	sarl	$16, %eax
	addl	%eax, %ebx
	movl	%ebx, %eax
	notl	%eax
	movl	%eax, %ebx
	movl	%ebx, %eax
	popq	%rbx
	popq	%r12
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE37:
	.size	in_cksum, .-in_cksum
	.section	.rodata
	.align 8
.LC1:
	.string	"The first argument must be an IP address\n"
.LC2:
	.string	"Error creating socket"
.LC3:
	.string	"getsockname"
.LC4:
	.string	"ping: out of memory.\n"
.LC5:
	.string	"Sent %d bytes\n"
.LC6:
	.string	"Error in recvmsg"
.LC7:
	.string	"(BAD CHECKSUM)"
.LC8:
	.string	"Reply of %d bytes received\n"
.LC9:
	.string	"icmp_seq = %u\n"
.LC10:
	.string	"Not a ICMP_ECHOREPLY"
	.text
	.globl	ping
	.type	ping, @function
ping:
.LFB38:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$368, %rsp
	movq	%rdi, -360(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	$0, -176(%rbp)
	movq	$0, -168(%rbp)
	movw	$2, -176(%rbp)
	leaq	-160(%rbp), %rax
	movl	$16, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	movw	$2, -160(%rbp)
	leaq	-160(%rbp), %rax
	leaq	4(%rax), %rdx
	movq	-360(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	inet_aton@PLT
	testl	%eax, %eax
	jne	.L12
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$41, %edx
	movl	$1, %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movl	$1, %edi
	call	exit@PLT
.L12:
	movl	$1025, %edi
	call	htons@PLT
	movw	%ax, -158(%rbp)
	movl	$1, %edx
	movl	$2, %esi
	movl	$2, %edi
	call	socket@PLT
	movl	%eax, -336(%rbp)
	cmpl	$-1, -336(%rbp)
	jne	.L13
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
.L13:
	leaq	-340(%rbp), %rdx
	leaq	-176(%rbp), %rcx
	movl	-336(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	getsockname@PLT
	cmpl	$-1, %eax
	jne	.L14
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	movl	$2, %edi
	call	exit@PLT
.L14:
	movl	$56, -332(%rbp)
	movl	$60, -328(%rbp)
	movl	$76, -324(%rbp)
	movl	$0, -320(%rbp)
	movl	-332(%rbp), %edx
	movl	-328(%rbp), %eax
	addl	%eax, %edx
	movl	-324(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, -316(%rbp)
	movl	-316(%rbp), %eax
	movl	%eax, %eax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -296(%rbp)
	cmpq	$0, -296(%rbp)
	jne	.L15
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$21, %edx
	movl	$1, %esi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movl	$2, %edi
	call	exit@PLT
.L15:
	movq	-296(%rbp), %rax
	movq	%rax, -288(%rbp)
	movq	-288(%rbp), %rax
	movb	$8, (%rax)
	movq	-288(%rbp), %rax
	movb	$0, 1(%rax)
	movq	-288(%rbp), %rax
	movw	$0, 2(%rax)
	movl	-320(%rbp), %eax
	addl	$1, %eax
	movzwl	%ax, %eax
	movl	%eax, %edi
	call	htons@PLT
	movq	-288(%rbp), %rdx
	movw	%ax, 6(%rdx)
	movl	-332(%rbp), %eax
	addl	$8, %eax
	movl	%eax, -312(%rbp)
	movl	-312(%rbp), %ecx
	movq	-288(%rbp), %rax
	movl	$0, %edx
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	in_cksum
	movq	-288(%rbp), %rdx
	movw	%ax, 2(%rdx)
	movl	-312(%rbp), %eax
	movslq	%eax, %rdx
	leaq	-160(%rbp), %rcx
	movq	-288(%rbp), %rsi
	movl	-336(%rbp), %eax
	movl	$16, %r9d
	movq	%rcx, %r8
	movl	$0, %ecx
	movl	%eax, %edi
	call	sendto@PLT
	movl	%eax, -308(%rbp)
	movl	-308(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-296(%rbp), %rax
	movq	%rax, -256(%rbp)
	movl	-316(%rbp), %eax
	cltq
	movq	%rax, -248(%rbp)
	leaq	-240(%rbp), %rax
	movl	$56, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	leaq	-144(%rbp), %rax
	movq	%rax, -240(%rbp)
	movl	$128, -232(%rbp)
	leaq	-256(%rbp), %rax
	movq	%rax, -224(%rbp)
	movq	$1, -216(%rbp)
	movl	$256, -304(%rbp)
	movl	-304(%rbp), %edx
	leaq	-240(%rbp), %rcx
	movl	-336(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	recvmsg@PLT
	movl	%eax, -312(%rbp)
	cmpl	$0, -312(%rbp)
	jns	.L16
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	movl	$1, %edi
	call	exit@PLT
.L16:
	movq	-224(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -280(%rbp)
	movq	-280(%rbp), %rax
	movq	%rax, -272(%rbp)
	movl	-312(%rbp), %ecx
	movq	-272(%rbp), %rax
	movl	$0, %edx
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	in_cksum
	movzwl	%ax, %eax
	movl	%eax, -300(%rbp)
	cmpl	$0, -300(%rbp)
	je	.L17
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$1, %edi
	call	exit@PLT
.L17:
	movq	-240(%rbp), %rax
	movq	%rax, -264(%rbp)
	movq	-272(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L18
	movq	-264(%rbp), %rax
	movl	$16, %esi
	movq	%rax, %rdi
	call	pr_addr
	movq	%rax, %rdi
	call	puts@PLT
	movl	-312(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-272(%rbp), %rax
	movzwl	6(%rax), %eax
	movzwl	%ax, %eax
	movl	%eax, %edi
	call	ntohs@PLT
	movzwl	%ax, %eax
	movl	%eax, %esi
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L11
.L18:
	leaq	.LC10(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	nop
.L11:
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L21
	call	__stack_chk_fail@PLT
.L21:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE38:
	.size	ping, .-ping
	.local	last_salen.2
	.comm	last_salen.2,4,4
	.local	last_sa.1
	.comm	last_sa.1,128,32
	.local	buffer.0
	.comm	buffer.0,4096,32
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
