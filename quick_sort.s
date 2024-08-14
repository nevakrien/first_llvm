	.text
	.intel_syntax noprefix
	.file	"quick_sort.ll"
	.globl	debug_print_size                # -- Begin function debug_print_size
	.p2align	4, 0x90
	.type	debug_print_size,@function
debug_print_size:                       # @debug_print_size
	.cfi_startproc
# %bb.0:
	push	rax
	.cfi_def_cfa_offset 16
	sub	rsi, rdi
	lea	rdi, [rip + .Ldebug_call_str]
	mov	al, 0
	call	printf@PLT
	pop	rax
	.cfi_def_cfa_offset 8
	ret
.Lfunc_end0:
	.size	debug_print_size, .Lfunc_end0-debug_print_size
	.cfi_endproc
                                        # -- End function
	.globl	debug_print_loopidx             # -- Begin function debug_print_loopidx
	.p2align	4, 0x90
	.type	debug_print_loopidx,@function
debug_print_loopidx:                    # @debug_print_loopidx
	.cfi_startproc
# %bb.0:
	push	rax
	.cfi_def_cfa_offset 16
	mov	rax, rdx
	mov	rcx, rsi
	mov	rdx, rdi
	mov	rsi, rdx
	sub	rsi, rcx
	sub	rdx, rax
	lea	rdi, [rip + .Ldebug_loop_str]
	mov	al, 0
	call	printf@PLT
	pop	rax
	.cfi_def_cfa_offset 8
	ret
.Lfunc_end1:
	.size	debug_print_loopidx, .Lfunc_end1-debug_print_loopidx
	.cfi_endproc
                                        # -- End function
	.globl	quick_sort                      # -- Begin function quick_sort
	.p2align	4, 0x90
	.type	quick_sort,@function
quick_sort:                             # @quick_sort
	.cfi_startproc
# %bb.0:                                # %entry
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 64
	mov	qword ptr [rbp - 8], rdi        # 8-byte Spill
	mov	qword ptr [rbp - 16], rsi       # 8-byte Spill
	call	debug_print_size@PLT
	mov	rsi, qword ptr [rbp - 16]       # 8-byte Reload
	mov	rdi, qword ptr [rbp - 8]        # 8-byte Reload
	cmp	rdi, rsi
	jb	.LBB2_2
# %bb.1:                                # %exit_early
	mov	rsp, rbp
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.LBB2_2:                                # %setup
	.cfi_def_cfa rbp, 16
	mov	rcx, qword ptr [rbp - 16]       # 8-byte Reload
	mov	rsi, qword ptr [rbp - 8]        # 8-byte Reload
	mov	eax, dword ptr [rsi]
	mov	dword ptr [rbp - 36], eax       # 4-byte Spill
	mov	rdx, rsp
	add	rdx, -16
	mov	qword ptr [rbp - 32], rdx       # 8-byte Spill
	mov	rsp, rdx
	mov	rax, rsp
	add	rax, -16
	mov	qword ptr [rbp - 24], rax       # 8-byte Spill
	mov	rsp, rax
	add	rsi, 8
	mov	qword ptr [rdx], rsi
	mov	qword ptr [rax], rcx
.LBB2_3:                                # %loop
                                        # =>This Inner Loop Header: Depth=1
	mov	rdi, qword ptr [rbp - 8]        # 8-byte Reload
	mov	rax, qword ptr [rbp - 24]       # 8-byte Reload
	mov	rcx, qword ptr [rbp - 32]       # 8-byte Reload
	mov	rsi, qword ptr [rcx]
	mov	qword ptr [rbp - 48], rsi       # 8-byte Spill
	mov	rdx, qword ptr [rax]
	mov	qword ptr [rbp - 56], rdx       # 8-byte Spill
	call	debug_print_loopidx@PLT
	mov	rcx, qword ptr [rbp - 56]       # 8-byte Reload
	mov	rax, qword ptr [rbp - 48]       # 8-byte Reload
	cmp	rax, rcx
	ja	.LBB2_7
# %bb.4:                                # %compare
                                        #   in Loop: Header=BB2_3 Depth=1
	mov	ecx, dword ptr [rbp - 36]       # 4-byte Reload
	mov	rax, qword ptr [rbp - 48]       # 8-byte Reload
	mov	eax, dword ptr [rax]
	mov	dword ptr [rbp - 60], eax       # 4-byte Spill
	cmp	eax, ecx
	jg	.LBB2_6
# %bb.5:                                # %append_left
                                        #   in Loop: Header=BB2_3 Depth=1
	mov	rax, qword ptr [rbp - 32]       # 8-byte Reload
	mov	rcx, qword ptr [rbp - 48]       # 8-byte Reload
	add	rcx, 8
	mov	qword ptr [rax], rcx
	jmp	.LBB2_3
.LBB2_6:                                # %append_right
                                        #   in Loop: Header=BB2_3 Depth=1
	mov	rax, qword ptr [rbp - 24]       # 8-byte Reload
	mov	rcx, qword ptr [rbp - 56]       # 8-byte Reload
	mov	edx, dword ptr [rbp - 60]       # 4-byte Reload
	mov	dword ptr [rcx], edx
	add	rcx, -8
	mov	qword ptr [rax], rcx
	jmp	.LBB2_3
.LBB2_7:                                # %done_loop
	mov	rsi, qword ptr [rbp - 48]       # 8-byte Reload
	mov	rdi, qword ptr [rbp - 8]        # 8-byte Reload
	mov	eax, dword ptr [rbp - 36]       # 4-byte Reload
	mov	ecx, dword ptr [rbp - 60]       # 4-byte Reload
	mov	dword ptr [rdi], ecx
	mov	dword ptr [rsi], eax
	add	rsi, -8
	call	quick_sort@PLT
	mov	rdi, qword ptr [rbp - 48]       # 8-byte Reload
	mov	rsi, qword ptr [rbp - 16]       # 8-byte Reload
	add	rdi, 8
	call	quick_sort@PLT
	mov	rsp, rbp
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end2:
	.size	quick_sort, .Lfunc_end2-quick_sort
	.cfi_endproc
                                        # -- End function
	.type	.Ldebug_call_str,@object        # @debug_call_str
	.section	.rodata.str1.1,"aMS",@progbits,1
.Ldebug_call_str:
	.asciz	"Calling quick_sort with size %llu\n"
	.size	.Ldebug_call_str, 35

	.type	.Ldebug_loop_str,@object        # @debug_loop_str
.Ldebug_loop_str:
	.asciz	"left in %llu right in %llu\n"
	.size	.Ldebug_loop_str, 28

	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym printf
	.addrsig_sym debug_print_size
	.addrsig_sym debug_print_loopidx
	.addrsig_sym quick_sort
