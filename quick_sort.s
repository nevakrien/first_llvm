	.text
	.intel_syntax noprefix
	.file	"quick_sort.ll"
	.globl	quick_sort                      # -- Begin function quick_sort
	.p2align	4, 0x90
	.type	quick_sort,@function
quick_sort:                             # @quick_sort
	.cfi_startproc
# %bb.0:                                # %entry
	mov	eax, dword ptr [rdi]
	mov	dword ptr [rsp - 36], eax       # 4-byte Spill
	mov	rax, rsi
	shl	rax, 3
	mov	rcx, rdi
	add	rcx, rax
	mov	qword ptr [rsp - 32], rcx       # 8-byte Spill
	mov	rax, rdi
	add	rax, -8
	add	rcx, -8
	mov	qword ptr [rsp - 8], rdi
	mov	qword ptr [rsp - 16], rcx
	cmp	rsi, 0
	mov	qword ptr [rsp - 24], rax       # 8-byte Spill
	jle	.LBB0_5
.LBB0_1:                                # %loop
                                        # =>This Inner Loop Header: Depth=1
	mov	ecx, dword ptr [rsp - 36]       # 4-byte Reload
	mov	rsi, qword ptr [rsp - 32]       # 8-byte Reload
	mov	rax, qword ptr [rsp - 24]       # 8-byte Reload
	mov	rdx, rax
	add	rdx, -8
	mov	qword ptr [rsp - 72], rdx       # 8-byte Spill
	cmp	rdx, rsi
	sete	dl
	mov	byte ptr [rsp - 57], dl         # 1-byte Spill
	mov	rdx, qword ptr [rsp - 8]
	mov	qword ptr [rsp - 56], rdx       # 8-byte Spill
	mov	rdx, qword ptr [rsp - 16]
	mov	qword ptr [rsp - 48], rdx       # 8-byte Spill
	cmp	dword ptr [rax], ecx
	jg	.LBB0_3
# %bb.2:                                # %left
                                        #   in Loop: Header=BB0_1 Depth=1
	mov	rax, qword ptr [rsp - 72]       # 8-byte Reload
	mov	cl, byte ptr [rsp - 57]         # 1-byte Reload
	mov	rdx, qword ptr [rsp - 56]       # 8-byte Reload
	add	rdx, -8
	mov	qword ptr [rsp - 8], rdx
	test	cl, 1
	mov	qword ptr [rsp - 24], rax       # 8-byte Spill
	jne	.LBB0_4
	jmp	.LBB0_1
.LBB0_3:                                # %right
                                        #   in Loop: Header=BB0_1 Depth=1
	mov	rax, qword ptr [rsp - 72]       # 8-byte Reload
	mov	cl, byte ptr [rsp - 57]         # 1-byte Reload
	mov	rdx, qword ptr [rsp - 48]       # 8-byte Reload
	mov	esi, dword ptr [rdx]
	mov	dword ptr [rdx], esi
	add	rdx, -8
	mov	qword ptr [rsp - 16], rdx
	test	cl, 1
	mov	qword ptr [rsp - 24], rax       # 8-byte Spill
	jne	.LBB0_4
	jmp	.LBB0_1
.LBB0_4:                                # %recurse
	ret
.LBB0_5:                                # %end_empty
	ret
.Lfunc_end0:
	.size	quick_sort, .Lfunc_end0-quick_sort
	.cfi_endproc
                                        # -- End function
	.section	".note.GNU-stack","",@progbits
	.addrsig
