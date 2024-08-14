	.text
	.intel_syntax noprefix
	.file	"quick_sort.ll"
	.intel_syntax noprefix
	.globl	quick_sort                      # -- Begin function quick_sort
	.p2align	4, 0x90
	.type	quick_sort,@function
quick_sort:                             # 
# %bb.0:                                # 
	push	r15
	push	r14
	push	rbx
	lea	r14, [rdi + 4]
	cmp	r14, rsi
	ja	.LBB0_9
# %bb.1:                                # 
	mov	rbx, rdi
	.p2align	4, 0x90
.LBB0_2:                                # 
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_3 Depth 2
                                        #       Child Loop BB0_4 Depth 3
	mov	eax, dword ptr [rbx]
	mov	rcx, rsi
	mov	r8, r14
	mov	rdx, rbx
.LBB0_3:                                # 
                                        #   Parent Loop BB0_2 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_4 Depth 3
	mov	r15, r8
	.p2align	4, 0x90
.LBB0_4:                                # 
                                        #   Parent Loop BB0_2 Depth=1
                                        #     Parent Loop BB0_3 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	mov	edi, dword ptr [r15]
	cmp	edi, eax
	jle	.LBB0_5
# %bb.6:                                # 
                                        #   in Loop: Header=BB0_4 Depth=3
	mov	r8d, dword ptr [rcx]
	mov	dword ptr [r15], r8d
	mov	dword ptr [rcx], edi
	add	rcx, -4
	cmp	rcx, r15
	jae	.LBB0_4
	jmp	.LBB0_7
	.p2align	4, 0x90
.LBB0_5:                                # 
                                        #   in Loop: Header=BB0_3 Depth=2
	lea	r8, [r15 + 4]
	mov	rdx, r15
	cmp	rcx, r8
	jae	.LBB0_3
	jmp	.LBB0_8
	.p2align	4, 0x90
.LBB0_7:                                # 
                                        #   in Loop: Header=BB0_2 Depth=1
	mov	edi, dword ptr [rdx]
	mov	r15, rdx
.LBB0_8:                                # 
                                        #   in Loop: Header=BB0_2 Depth=1
	mov	dword ptr [rbx], edi
	mov	dword ptr [r15], eax
	lea	rdi, [r15 + 4]
	call	quick_sort@PLT
	add	r15, -4
	mov	rsi, r15
	cmp	r14, r15
	jbe	.LBB0_2
.LBB0_9:                                # 
	pop	rbx
	pop	r14
	pop	r15
	ret
.Lfunc_end0:
	.size	quick_sort, .Lfunc_end0-quick_sort
                                        # -- End function
	.section	".note.GNU-stack","",@progbits
