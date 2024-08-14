	.text
	.intel_syntax noprefix
	.file	"quick_sort.ll"
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
	mov	qword ptr [rbp - 16], rdi       # 8-byte Spill
	mov	qword ptr [rbp - 8], rsi        # 8-byte Spill
	cmp	rdi, rsi
	ja	.LBB0_2
# %bb.1:                                # %exit_early
	mov	rsp, rbp
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.LBB0_2:                                # %setup
	.cfi_def_cfa rbp, 16
	mov	rcx, qword ptr [rbp - 8]        # 8-byte Reload
	mov	rsi, qword ptr [rbp - 16]       # 8-byte Reload
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
	add	rsi, -8
	mov	qword ptr [rdx], rsi
	mov	qword ptr [rax], rcx
.LBB0_3:                                # %loop
                                        # =>This Inner Loop Header: Depth=1
	mov	rax, qword ptr [rbp - 16]       # 8-byte Reload
	mov	rcx, qword ptr [rbp - 8]        # 8-byte Reload
	mov	rdx, qword ptr [rbp - 32]       # 8-byte Reload
	mov	rdx, qword ptr [rdx]
	mov	qword ptr [rbp - 48], rdx       # 8-byte Spill
	cmp	rax, rcx
	ja	.LBB0_7
# %bb.4:                                # %compare
                                        #   in Loop: Header=BB0_3 Depth=1
	mov	ecx, dword ptr [rbp - 36]       # 4-byte Reload
	mov	rax, qword ptr [rbp - 48]       # 8-byte Reload
	mov	eax, dword ptr [rax]
	mov	dword ptr [rbp - 52], eax       # 4-byte Spill
	cmp	eax, ecx
	jg	.LBB0_6
# %bb.5:                                # %append_left
                                        #   in Loop: Header=BB0_3 Depth=1
	mov	rax, qword ptr [rbp - 32]       # 8-byte Reload
	mov	rcx, qword ptr [rbp - 48]       # 8-byte Reload
	add	rcx, -8
	mov	qword ptr [rax], rcx
	jmp	.LBB0_3
.LBB0_6:                                # %append_right
                                        #   in Loop: Header=BB0_3 Depth=1
	mov	rax, qword ptr [rbp - 24]       # 8-byte Reload
	mov	edx, dword ptr [rbp - 52]       # 4-byte Reload
	mov	rcx, qword ptr [rax]
	mov	dword ptr [rcx], edx
	add	rcx, -8
	mov	qword ptr [rax], rcx
	jmp	.LBB0_3
.LBB0_7:                                # %done_loop
	mov	rsi, qword ptr [rbp - 48]       # 8-byte Reload
	mov	rdi, qword ptr [rbp - 16]       # 8-byte Reload
	mov	eax, dword ptr [rbp - 36]       # 4-byte Reload
	mov	ecx, dword ptr [rbp - 52]       # 4-byte Reload
	mov	dword ptr [rdi], ecx
	mov	dword ptr [rsi], eax
	add	rsi, -8
	call	quick_sort@PLT
	mov	rdi, qword ptr [rbp - 48]       # 8-byte Reload
	mov	rsi, qword ptr [rbp - 8]        # 8-byte Reload
	add	rdi, 8
	call	quick_sort@PLT
	mov	rsp, rbp
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end0:
	.size	quick_sort, .Lfunc_end0-quick_sort
	.cfi_endproc
                                        # -- End function
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym quick_sort
