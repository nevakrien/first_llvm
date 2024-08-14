	.text
	.intel_syntax noprefix
	.file	"quick_sort.ll"
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
	add	rdi, 4
	mov	qword ptr [rsp + 80], rdi       # 8-byte Spill
	cmp	rdi, rsi
	jb	.LBB0_2
# %bb.1:                                # %exit_early
	add	rsp, 88
	.cfi_def_cfa_offset 8
	ret
.LBB0_2:                                # %setup
	.cfi_def_cfa_offset 96
	mov	rax, qword ptr [rsp + 72]       # 8-byte Reload
	mov	rcx, qword ptr [rsp + 80]       # 8-byte Reload
	mov	rdx, qword ptr [rsp + 64]       # 8-byte Reload
	mov	esi, dword ptr [rdx]
	mov	dword ptr [rsp + 36], esi       # 4-byte Spill
	mov	qword ptr [rsp + 40], rdx       # 8-byte Spill
	mov	qword ptr [rsp + 48], rcx       # 8-byte Spill
	mov	qword ptr [rsp + 56], rax       # 8-byte Spill
.LBB0_3:                                # %loop
                                        # =>This Inner Loop Header: Depth=1
	mov	rdx, qword ptr [rsp + 40]       # 8-byte Reload
	mov	rcx, qword ptr [rsp + 48]       # 8-byte Reload
	mov	rax, qword ptr [rsp + 56]       # 8-byte Reload
	mov	qword ptr [rsp + 8], rax        # 8-byte Spill
	mov	qword ptr [rsp + 16], rcx       # 8-byte Spill
	mov	qword ptr [rsp + 24], rdx       # 8-byte Spill
	cmp	rax, rcx
	jb	.LBB0_7
# %bb.4:                                # %compare
                                        #   in Loop: Header=BB0_3 Depth=1
	mov	ecx, dword ptr [rsp + 36]       # 4-byte Reload
	mov	rax, qword ptr [rsp + 16]       # 8-byte Reload
	mov	eax, dword ptr [rax]
	mov	dword ptr [rsp + 4], eax        # 4-byte Spill
	cmp	eax, ecx
	jg	.LBB0_6
# %bb.5:                                # %append_left
                                        #   in Loop: Header=BB0_3 Depth=1
	mov	rax, qword ptr [rsp + 8]        # 8-byte Reload
	mov	rdx, qword ptr [rsp + 16]       # 8-byte Reload
	mov	rcx, rdx
	add	rcx, 4
	mov	qword ptr [rsp + 40], rdx       # 8-byte Spill
	mov	qword ptr [rsp + 48], rcx       # 8-byte Spill
	mov	qword ptr [rsp + 56], rax       # 8-byte Spill
	jmp	.LBB0_3
.LBB0_6:                                # %append_right
                                        #   in Loop: Header=BB0_3 Depth=1
	mov	rcx, qword ptr [rsp + 16]       # 8-byte Reload
	mov	rdx, qword ptr [rsp + 24]       # 8-byte Reload
	mov	rax, qword ptr [rsp + 8]        # 8-byte Reload
	mov	esi, dword ptr [rsp + 4]        # 4-byte Reload
	mov	edi, dword ptr [rax]
	mov	dword ptr [rcx], edi
	mov	dword ptr [rax], esi
	add	rax, -4
	mov	qword ptr [rsp + 40], rdx       # 8-byte Spill
	mov	qword ptr [rsp + 48], rcx       # 8-byte Spill
	mov	qword ptr [rsp + 56], rax       # 8-byte Spill
	jmp	.LBB0_3
.LBB0_7:                                # %done_loop
	mov	rsi, qword ptr [rsp + 24]       # 8-byte Reload
	mov	rdi, qword ptr [rsp + 64]       # 8-byte Reload
	mov	eax, dword ptr [rsp + 36]       # 4-byte Reload
	mov	ecx, dword ptr [rsi]
	mov	dword ptr [rdi], ecx
	mov	dword ptr [rsi], eax
	add	rsi, -4
	call	quick_sort@PLT
	mov	rdi, qword ptr [rsp + 24]       # 8-byte Reload
	mov	rsi, qword ptr [rsp + 72]       # 8-byte Reload
	add	rdi, 4
	call	quick_sort@PLT
	add	rsp, 88
	.cfi_def_cfa_offset 8
	ret
.Lfunc_end0:
	.size	quick_sort, .Lfunc_end0-quick_sort
	.cfi_endproc
                                        # -- End function
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym quick_sort
