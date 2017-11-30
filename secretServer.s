	.file	"secretServer.c"
	.comm	globals,1092,32
	.section	.rodata
.LC0:
	.string	"Error: "
	.text
	.globl	die
	.type	die, @function
die:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$224, %rsp
	movq	%rdi, -216(%rbp)
	movq	%rsi, -168(%rbp)
	movq	%rdx, -160(%rbp)
	movq	%rcx, -152(%rbp)
	movq	%r8, -144(%rbp)
	movq	%r9, -136(%rbp)
	testb	%al, %al
	je	.L3
	movaps	%xmm0, -128(%rbp)
	movaps	%xmm1, -112(%rbp)
	movaps	%xmm2, -96(%rbp)
	movaps	%xmm3, -80(%rbp)
	movaps	%xmm4, -64(%rbp)
	movaps	%xmm5, -48(%rbp)
	movaps	%xmm6, -32(%rbp)
	movaps	%xmm7, -16(%rbp)
.L3:
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$7, %edx
	movl	$1, %esi
	movl	$.LC0, %edi
	call	fwrite
	movl	$8, -200(%rbp)
	movl	$48, -196(%rbp)
	leaq	16(%rbp), %rax
	movq	%rax, -192(%rbp)
	leaq	-176(%rbp), %rax
	movq	%rax, -184(%rbp)
	movq	stderr(%rip), %rax
	leaq	-200(%rbp), %rdx
	movq	-216(%rbp), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	vfprintf
	movq	stderr(%rip), %rax
	movq	%rax, %rsi
	movl	$10, %edi
	call	fputc
	movl	$-1, %edi
	call	exit
	.cfi_endproc
.LFE5:
	.size	die, .-die
	.globl	readLineFromFd
	.type	readLineFromFd, @function
readLineFromFd:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, -8(%rbp)
.L8:
	movq	-8(%rbp), %rcx
	movl	-20(%rbp), %eax
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	read
	testq	%rax, %rax
	jle	.L12
	addq	$1, -8(%rbp)
	movq	-8(%rbp), %rax
	subq	$1, %rax
	movzbl	(%rax), %eax
	cmpb	$10, %al
	je	.L13
	jmp	.L8
.L12:
	nop
	jmp	.L6
.L13:
	nop
.L6:
	subq	$1, -8(%rbp)
	jmp	.L9
.L11:
	subq	$1, -8(%rbp)
.L9:
	movq	-8(%rbp), %rax
	cmpq	-32(%rbp), %rax
	jbe	.L10
	call	__ctype_b_loc
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	movsbq	%al, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	movzwl	(%rax), %eax
	movzwl	%ax, %eax
	andl	$8192, %eax
	testl	%eax, %eax
	jne	.L11
.L10:
	movq	-8(%rbp), %rax
	addq	$1, %rax
	movb	$0, (%rax)
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	readLineFromFd, .-readLineFromFd
	.globl	writeStrToFd
	.type	writeStrToFd, @function
writeStrToFd:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movq	-16(%rbp), %rcx
	movl	-4(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	writeStrToFd, .-writeStrToFd
	.section	.rodata
	.align 8
.LC1:
	.string	"Usage: server port password secret"
.LC2:
	.string	"bad port %s"
.LC3:
	.string	"socket() failed"
	.align 8
.LC4:
	.string	"Could not bind listening socket: %s"
	.align 8
.LC5:
	.string	"Could not listen for incoming connections."
	.align 8
.LC6:
	.string	"Waiting for a new connection..."
.LC7:
	.string	"accept() failed: %s"
.LC8:
	.string	"Talking to someone."
.LC9:
	.string	"Secret Server 1.0\n"
	.align 8
.LC10:
	.string	"Someone used the correct password."
.LC11:
	.string	"The secret is: "
.LC12:
	.string	"\n"
	.align 8
.LC13:
	.string	"Someone used an incorrect password."
	.align 8
.LC14:
	.string	"I am not talking to you, bye!\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movl	%edi, -36(%rbp)
	movq	%rsi, -48(%rbp)
	cmpl	$4, -36(%rbp)
	je	.L17
	movl	$.LC1, %edi
	movl	$0, %eax
	call	die
.L17:
	movq	$0, -16(%rbp)
	movq	-48(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	-16(%rbp), %rcx
	movl	$10, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strtol
	movl	%eax, globals(%rip)
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L18
	movq	-48(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movl	$.LC2, %edi
	movl	$0, %eax
	call	die
.L18:
	movq	-48(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	movl	$32, %edx
	movq	%rax, %rsi
	movl	$globals+36, %edi
	call	strncpy
	movb	$0, globals+67(%rip)
	movq	-48(%rbp), %rax
	addq	$24, %rax
	movq	(%rax), %rax
	movl	$1024, %edx
	movq	%rax, %rsi
	movl	$globals+68, %edi
	call	strncpy
	movb	$0, globals+1091(%rip)
	movl	$0, %edx
	movl	$1, %esi
	movl	$2, %edi
	call	socket
	movl	%eax, -4(%rbp)
	cmpl	$0, -4(%rbp)
	jns	.L19
	movl	$.LC3, %edi
	movl	$0, %eax
	call	die
.L19:
	leaq	-32(%rbp), %rax
	movl	$16, %esi
	movq	%rax, %rdi
	call	bzero
	movw	$2, -32(%rbp)
	movl	$0, %edi
	call	htons
	movzwl	%ax, %eax
	movl	%eax, -28(%rbp)
	movl	globals(%rip), %eax
	movzwl	%ax, %eax
	movl	%eax, %edi
	call	htons
	movw	%ax, -30(%rbp)
	leaq	-32(%rbp), %rcx
	movl	-4(%rbp), %eax
	movl	$16, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	bind
	testl	%eax, %eax
	jns	.L20
	call	__errno_location
	movl	(%rax), %eax
	movl	%eax, %edi
	call	strerror
	movq	%rax, %rsi
	movl	$.LC4, %edi
	movl	$0, %eax
	call	die
.L20:
	movl	-4(%rbp), %eax
	movl	$3, %esi
	movl	%eax, %edi
	call	listen
	testl	%eax, %eax
	je	.L25
	movl	$.LC5, %edi
	movl	$0, %eax
	call	die
.L25:
	movl	$.LC6, %edi
	call	puts
	movl	-4(%rbp), %eax
	movl	$0, %edx
	movl	$0, %esi
	movl	%eax, %edi
	call	accept
	movl	%eax, -8(%rbp)
	cmpl	$0, -8(%rbp)
	jns	.L22
	call	__errno_location
	movl	(%rax), %eax
	movl	%eax, %edi
	call	strerror
	movq	%rax, %rsi
	movl	$.LC7, %edi
	movl	$0, %eax
	call	die
.L22:
	movl	$.LC8, %edi
	call	puts
	movl	-8(%rbp), %eax
	movl	$.LC9, %esi
	movl	%eax, %edi
	call	writeStrToFd
	movl	-8(%rbp), %eax
	movl	$globals+4, %esi
	movl	%eax, %edi
	call	readLineFromFd
	movl	$globals+36, %esi
	movl	$globals+4, %edi
	call	strcmp
	testl	%eax, %eax
	jne	.L23
	movl	$.LC10, %edi
	call	puts
	movl	-8(%rbp), %eax
	movl	$.LC11, %esi
	movl	%eax, %edi
	call	writeStrToFd
	movl	-8(%rbp), %eax
	movl	$globals+68, %esi
	movl	%eax, %edi
	call	writeStrToFd
	movl	-8(%rbp), %eax
	movl	$.LC12, %esi
	movl	%eax, %edi
	call	writeStrToFd
	jmp	.L24
.L23:
	movl	$.LC13, %edi
	call	puts
	movl	-8(%rbp), %eax
	movl	$.LC14, %esi
	movl	%eax, %edi
	call	writeStrToFd
.L24:
	movl	-8(%rbp), %eax
	movl	%eax, %edi
	call	close
	jmp	.L25
	.cfi_endproc
.LFE8:
	.size	main, .-main
	.ident	"GCC: (GNU) 7.2.1 20170915 (Red Hat 7.2.1-2)"
	.section	.note.GNU-stack,"",@progbits
