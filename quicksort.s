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
	sub	rsi, rdi
	sub	rdx, rdi
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
	sub	rsp, 88
	.cfi_def_cfa_offset 96
	mov	qword ptr [rsp + 64], rdi       # 8-byte Spill
	mov	qword ptr [rsp + 72], rsi       # 8-byte Spill
	call	debug_print_size@PLT
	mov	rdi, qword ptr [rsp + 64]       # 8-byte Reload
	mov	rsi, qword ptr [rsp + 72]       # 8-byte Reload
	add	rdi, 4
	mov	qword ptr [rsp + 80], rdi       # 8-byte Spill
	cmp	rdi, rsi
	jb	.LBB2_2
# %bb.1:                                # %exit_early
	add	rsp, 88
	.cfi_def_cfa_offset 8
	ret
.LBB2_2:                                # %setup
	.cfi_def_cfa_offset 96
	mov	rax, qword ptr [rsp + 72]       # 8-byte Reload
	mov	rcx, qword ptr [rsp + 80]       # 8-byte Reload
	mov	rdx, qword ptr [rsp + 64]       # 8-byte Reload
	mov	edx, dword ptr [rdx]
	mov	dword ptr [rsp + 36], edx       # 4-byte Spill
	mov	rdx, rcx
	mov	qword ptr [rsp + 40], rdx       # 8-byte Spill
	mov	qword ptr [rsp + 48], rcx       # 8-byte Spill
	mov	qword ptr [rsp + 56], rax       # 8-byte Spill
.LBB2_3:                                # %loop
                                        # =>This Inner Loop Header: Depth=1
	mov	rdi, qword ptr [rsp + 64]       # 8-byte Reload
	mov	rsi, qword ptr [rsp + 40]       # 8-byte Reload
	mov	rax, qword ptr [rsp + 48]       # 8-byte Reload
	mov	rdx, qword ptr [rsp + 56]       # 8-byte Reload
	mov	qword ptr [rsp + 24], rdx       # 8-byte Spill
	mov	qword ptr [rsp + 8], rax        # 8-byte Spill
	mov	qword ptr [rsp + 16], rsi       # 8-byte Spill
	call	debug_print_loopidx@PLT
	mov	rcx, qword ptr [rsp + 16]       # 8-byte Reload
	mov	rax, qword ptr [rsp + 24]       # 8-byte Reload
	cmp	rax, rcx
	jbe	.LBB2_7
# %bb.4:                                # %compare
                                        #   in Loop: Header=BB2_3 Depth=1
	mov	ecx, dword ptr [rsp + 36]       # 4-byte Reload
	mov	rax, qword ptr [rsp + 16]       # 8-byte Reload
	mov	eax, dword ptr [rax]
	mov	dword ptr [rsp + 4], eax        # 4-byte Spill
	cmp	eax, ecx
	jg	.LBB2_6
# %bb.5:                                # %append_left
                                        #   in Loop: Header=BB2_3 Depth=1
	lea	rdi, [rip + .Ldebug_left_str]
	call	printf@PLT
	mov	rcx, qword ptr [rsp + 16]       # 8-byte Reload
                                        # kill: def $edx killed $eax
	mov	rax, qword ptr [rsp + 24]       # 8-byte Reload
	mov	rdx, rcx
	add	rdx, 4
	mov	qword ptr [rsp + 40], rdx       # 8-byte Spill
	mov	qword ptr [rsp + 48], rcx       # 8-byte Spill
	mov	qword ptr [rsp + 56], rax       # 8-byte Spill
	jmp	.LBB2_3
.LBB2_6:                                # %append_right
                                        #   in Loop: Header=BB2_3 Depth=1
	lea	rdi, [rip + .Ldebug_right_str]
	call	printf@PLT
	mov	edx, dword ptr [rsp + 4]        # 4-byte Reload
	mov	rcx, qword ptr [rsp + 16]       # 8-byte Reload
                                        # kill: def $esi killed $eax
	mov	rax, qword ptr [rsp + 24]       # 8-byte Reload
	mov	esi, dword ptr [rax]
	mov	dword ptr [rcx], esi
	mov	dword ptr [rax], edx
	add	rax, -4
	mov	rdx, rcx
	mov	qword ptr [rsp + 40], rdx       # 8-byte Spill
	mov	qword ptr [rsp + 48], rcx       # 8-byte Spill
	mov	qword ptr [rsp + 56], rax       # 8-byte Spill
	jmp	.LBB2_3
.LBB2_7:                                # %done_loop
	mov	rsi, qword ptr [rsp + 8]        # 8-byte Reload
	mov	rdi, qword ptr [rsp + 64]       # 8-byte Reload
	mov	eax, dword ptr [rsp + 36]       # 4-byte Reload
	mov	ecx, dword ptr [rsi]
	mov	dword ptr [rdi], ecx
	mov	dword ptr [rsi], eax
	add	rsi, -4
	call	quick_sort@PLT
	mov	rdi, qword ptr [rsp + 8]        # 8-byte Reload
	mov	rsi, qword ptr [rsp + 72]       # 8-byte Reload
	add	rdi, 4
	call	quick_sort@PLT
	add	rsp, 88
	.cfi_def_cfa_offset 8
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

	.type	.Ldebug_left_str,@object        # @debug_left_str
.Ldebug_left_str:
	.asciz	"left\n"
	.size	.Ldebug_left_str, 6

	.type	.Ldebug_right_str,@object       # @debug_right_str
.Ldebug_right_str:
	.asciz	"right\n"
	.size	.Ldebug_right_str, 7

	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym printf
	.addrsig_sym debug_print_size
	.addrsig_sym debug_print_loopidx
	.addrsig_sym quick_sort
