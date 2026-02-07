	TITLE	global-alloc.c
	.386P
include listing.inc
if @Version gt 510
.model FLAT
else
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
CONST	SEGMENT DWORD USE32 PUBLIC 'CONST'
CONST	ENDS
_BSS	SEGMENT DWORD USE32 PUBLIC 'BSS'
_BSS	ENDS
_TLS	SEGMENT DWORD USE32 PUBLIC 'TLS'
_TLS	ENDS
FLAT	GROUP _DATA, CONST, _BSS
	ASSUME	CS: FLAT, DS: FLAT, SS: FLAT
endif
PUBLIC	_global_alloc
EXTRN	_abort:NEAR
EXTRN	_memset:NEAR
EXTRN	_max_regno:DWORD
EXTRN	_reg_n_refs:DWORD
EXTRN	_reg_live_length:DWORD
EXTRN	_reg_renumber:DWORD
EXTRN	_qsort:NEAR
EXTRN	_regno_reg_rtx:DWORD
EXTRN	_reg_preferred_or_nothing:NEAR
EXTRN	_reload:NEAR
EXTRN	_mode_size:BYTE
EXTRN	_n_basic_blocks:DWORD
EXTRN	_basic_block_head:DWORD
EXTRN	_alloca:NEAR
_BSS	SEGMENT
_max_allocno$S536 DD 01H DUP (?)
_reg_allocno$S537 DD 01H DUP (?)
_allocno_reg$S538 DD 01H DUP (?)
_allocno_order$S539 DD 01H DUP (?)
_allocno_size$S540 DD 01H DUP (?)
_conflicts$S541 DD 01H DUP (?)
_allocno_row_words$S542 DD 01H DUP (?)
_hard_reg_conflicts$S544 DD 01H DUP (?)
_hard_reg_preferences$S545 DD 01H DUP (?)
_regs_someone_prefers$S546 DW 01H DUP (?)
	ALIGN	4

_no_global_alloc_regs$S547 DW 01H DUP (?)
	ALIGN	4

_allocnos_live$S548 DD 01H DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
; File global-alloc.c
_file$ = 8
_i$ = -4
_global_alloc PROC NEAR
; Line 189
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 192
	mov	DWORD PTR _max_allocno$S536, 0
; Line 194
	mov	WORD PTR _regs_someone_prefers$S546, 0
; Line 199
	mov	WORD PTR _no_global_alloc_regs$S547, 0
; Line 201
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L565
$L566:
	inc	DWORD PTR _i$[ebp]
$L565:
	cmp	DWORD PTR _i$[ebp], 10			; 0000000aH
	jge	$L567
; Line 202
	cmp	DWORD PTR _i$[ebp], 8
	jl	$L568
	cmp	DWORD PTR _i$[ebp], 10			; 0000000aH
	jge	$L568
; Line 203
	mov	eax, 1
	mov	cl, BYTE PTR _i$[ebp]
	shl	eax, cl
	movsx	ecx, WORD PTR _no_global_alloc_regs$S547
	or	eax, ecx
	mov	WORD PTR _no_global_alloc_regs$S547, ax
; Line 209
$L568:
	jmp	$L566
$L567:
	mov	eax, DWORD PTR _max_regno
	shl	eax, 2
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _reg_allocno$S537, eax
; Line 211
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L570
$L571:
	inc	DWORD PTR _i$[ebp]
$L570:
	cmp	DWORD PTR _i$[ebp], 10			; 0000000aH
	jge	$L572
; Line 212
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_allocno$S537
	mov	DWORD PTR [ecx+eax*4], -1
	jmp	$L571
$L572:
; Line 214
	mov	DWORD PTR _i$[ebp], 10			; 0000000aH
	jmp	$L573
$L574:
	inc	DWORD PTR _i$[ebp]
$L573:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _max_regno, eax
	jle	$L575
; Line 218
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_n_refs
	movsx	eax, WORD PTR [ecx+eax*2]
	or	eax, eax
	je	$L576
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	or	eax, eax
	jge	$L576
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_live_length
	cmp	DWORD PTR [ecx+eax*4], -1
	je	$L576
; Line 220
	mov	eax, DWORD PTR _max_allocno$S536
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _reg_allocno$S537
	mov	DWORD PTR [edx+ecx*4], eax
	inc	DWORD PTR _max_allocno$S536
; Line 221
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_live_length
	cmp	DWORD PTR [ecx+eax*4], 0
	jne	$L577
; Line 222
	call	_abort
; Line 223
$L577:
; Line 224
	jmp	$L579
$L576:
; Line 225
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_allocno$S537
	mov	DWORD PTR [ecx+eax*4], -1
$L579:
	jmp	$L574
$L575:
; Line 227
	mov	eax, DWORD PTR _max_allocno$S536
	shl	eax, 2
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _allocno_reg$S538, eax
; Line 228
	mov	eax, DWORD PTR _max_allocno$S536
	shl	eax, 2
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _allocno_size$S540, eax
; Line 229
	mov	eax, DWORD PTR _max_allocno$S536
	shl	eax, 2
	push	eax
	push	0
	mov	eax, DWORD PTR _allocno_size$S540
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 231
	mov	DWORD PTR _i$[ebp], 10			; 0000000aH
	jmp	$L581
$L582:
	inc	DWORD PTR _i$[ebp]
$L581:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _max_regno, eax
	jle	$L583
; Line 232
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_allocno$S537
	cmp	DWORD PTR [ecx+eax*4], 0
	jl	$L584
; Line 234
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _reg_allocno$S537
	mov	ecx, DWORD PTR [edx+ecx*4]
	mov	edx, DWORD PTR _allocno_reg$S538
	mov	DWORD PTR [edx+ecx*4], eax
; Line 235
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _regno_reg_rtx
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	add	eax, 3
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _reg_allocno$S537
	mov	ecx, DWORD PTR [edx+ecx*4]
	mov	edx, DWORD PTR _allocno_size$S540
	mov	DWORD PTR [edx+ecx*4], eax
; Line 240
$L584:
	jmp	$L582
$L583:
; Line 241
	mov	eax, DWORD PTR _max_allocno$S536
	add	eax, eax
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _hard_reg_conflicts$S544, eax
; Line 242
	mov	eax, DWORD PTR _max_allocno$S536
	add	eax, eax
	push	eax
	push	0
	mov	eax, DWORD PTR _hard_reg_conflicts$S544
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 245
	mov	eax, DWORD PTR _max_allocno$S536
	add	eax, eax
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _hard_reg_preferences$S545, eax
; Line 246
	mov	eax, DWORD PTR _max_allocno$S536
	add	eax, eax
	push	eax
	push	0
	mov	eax, DWORD PTR _hard_reg_preferences$S545
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 248
	mov	eax, DWORD PTR _max_allocno$S536
	add	eax, 31					; 0000001fH
	cdq
	and	edx, 31					; 0000001fH
	add	eax, edx
	sar	eax, 5
	mov	DWORD PTR _allocno_row_words$S542, eax
; Line 251
	mov	eax, DWORD PTR _allocno_row_words$S542
	imul	eax, DWORD PTR _max_allocno$S536
	shl	eax, 2
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _conflicts$S541, eax
; Line 252
	mov	eax, DWORD PTR _allocno_row_words$S542
	imul	eax, DWORD PTR _max_allocno$S536
	shl	eax, 2
	push	eax
	push	0
	mov	eax, DWORD PTR _conflicts$S541
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 254
	mov	eax, DWORD PTR _allocno_row_words$S542
	shl	eax, 2
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _allocnos_live$S548, eax
; Line 259
	cmp	DWORD PTR _max_allocno$S536, 0
	jle	$L585
; Line 264
	call	_global_conflicts
; Line 268
	mov	eax, DWORD PTR _max_allocno$S536
	shl	eax, 2
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _allocno_order$S539, eax
; Line 269
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L586
$L587:
	inc	DWORD PTR _i$[ebp]
$L586:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _max_allocno$S536, eax
	jle	$L588
; Line 270
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _allocno_order$S539
	mov	DWORD PTR [edx+ecx*4], eax
	jmp	$L587
$L588:
; Line 274
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L589
$L590:
	inc	DWORD PTR _i$[ebp]
$L589:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _max_allocno$S536, eax
	jle	$L591
; Line 275
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _allocno_size$S540
	cmp	DWORD PTR [ecx+eax*4], 0
	jne	$L592
; Line 276
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _allocno_size$S540
	mov	DWORD PTR [ecx+eax*4], 1
; Line 278
$L592:
	jmp	$L590
$L591:
	push	OFFSET _allocno_compare
	push	4
	mov	eax, DWORD PTR _max_allocno$S536
	push	eax
	mov	eax, DWORD PTR _allocno_order$S539
	push	eax
	call	_qsort
	add	esp, 16					; 00000010H
; Line 280
	cmp	DWORD PTR _file$[ebp], 0
	je	$L594
; Line 281
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_dump_conflicts
	add	esp, 4
; Line 286
$L594:
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L595
$L596:
	inc	DWORD PTR _i$[ebp]
$L595:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _max_allocno$S536, eax
	jle	$L597
; Line 287
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _allocno_order$S539
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _allocno_reg$S538
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _reg_live_length
	cmp	DWORD PTR [ecx+eax*4], 0
	jl	$L598
; Line 295
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _allocno_order$S539
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _hard_reg_preferences$S545
	movsx	eax, WORD PTR [ecx+eax*2]
	push	eax
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _allocno_order$S539
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	call	_find_reg
	add	esp, 20					; 00000014H
; Line 296
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _allocno_order$S539
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _allocno_reg$S538
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	or	eax, eax
	jl	$L600
; Line 297
	jmp	$L596
; Line 298
$L600:
; Line 299
$L599:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _allocno_order$S539
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _allocno_reg$S538
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	call	_reg_preferred_or_nothing
	add	esp, 4
	or	eax, eax
	jne	$L602
; Line 301
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _allocno_order$S539
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _hard_reg_preferences$S545
	movsx	eax, WORD PTR [ecx+eax*2]
	push	eax
	push	0
	push	1
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _allocno_order$S539
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	call	_find_reg
	add	esp, 20					; 00000014H
; Line 302
$L602:
; Line 303
$L598:
	jmp	$L596
$L597:
; Line 308
$L585:
	cmp	DWORD PTR _n_basic_blocks, 0
	jle	$L603
; Line 309
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	push	1
	mov	eax, DWORD PTR _basic_block_head
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_reload
	add	esp, 12					; 0000000cH
; Line 310
$L603:
$L563:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_global_alloc ENDP
_TEXT	ENDS
EXTRN	__ftol:NEAR
EXTRN	__fltused:NEAR
EXTRN	_floor_log2:NEAR
CONST	SEGMENT
$T903	DQ	040c3880000000000H		; 10000
CONST	ENDS
_TEXT	SEGMENT
_v1$ = 8
_v2$ = 12
_r1$ = -16
_r2$ = -4
_pri1$ = -12
_pri2$ = -8
_allocno_compare PROC NEAR
; Line 318
	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H
	push	ebx
	push	esi
	push	edi
; Line 319
	mov	eax, DWORD PTR _v1$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _allocno_reg$S538
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _r1$[ebp], eax
; Line 320
	mov	eax, DWORD PTR _v2$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _allocno_reg$S538
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _r2$[ebp], eax
; Line 328
	mov	eax, DWORD PTR _r1$[ebp]
	mov	ecx, DWORD PTR _reg_n_refs
	movsx	eax, WORD PTR [ecx+eax*2]
	push	eax
	call	_floor_log2
	add	esp, 4
	mov	ecx, DWORD PTR _r1$[ebp]
	mov	edx, DWORD PTR _reg_n_refs
	movsx	ecx, WORD PTR [edx+ecx*2]
	imul	eax, ecx
	mov	DWORD PTR -20+[ebp], eax
	fild	DWORD PTR -20+[ebp]
	mov	eax, DWORD PTR _r1$[ebp]
	mov	ecx, DWORD PTR _reg_live_length
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _v1$[ebp]
	mov	ecx, DWORD PTR [ecx]
	mov	edx, DWORD PTR _allocno_size$S540
	imul	eax, DWORD PTR [edx+ecx*4]
	mov	DWORD PTR -24+[ebp], eax
	fidiv	DWORD PTR -24+[ebp]
	fmul	QWORD PTR $T903
	call	__ftol
	mov	DWORD PTR _pri1$[ebp], eax
; Line 332
	mov	eax, DWORD PTR _r2$[ebp]
	mov	ecx, DWORD PTR _reg_n_refs
	movsx	eax, WORD PTR [ecx+eax*2]
	push	eax
	call	_floor_log2
	add	esp, 4
	mov	ecx, DWORD PTR _r2$[ebp]
	mov	edx, DWORD PTR _reg_n_refs
	movsx	ecx, WORD PTR [edx+ecx*2]
	imul	eax, ecx
	mov	DWORD PTR -28+[ebp], eax
	fild	DWORD PTR -28+[ebp]
	mov	eax, DWORD PTR _v2$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _allocno_size$S540
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _r2$[ebp]
	mov	edx, DWORD PTR _reg_live_length
	imul	eax, DWORD PTR [edx+ecx*4]
	mov	DWORD PTR -32+[ebp], eax
	fidiv	DWORD PTR -32+[ebp]
	fmul	QWORD PTR $T903
	call	__ftol
	mov	DWORD PTR _pri2$[ebp], eax
; Line 333
	mov	eax, DWORD PTR _pri2$[ebp]
	sub	eax, DWORD PTR _pri1$[ebp]
	je	$L613
; Line 334
	mov	eax, DWORD PTR _pri2$[ebp]
	sub	eax, DWORD PTR _pri1$[ebp]
	jmp	$L607
; Line 338
$L613:
	mov	eax, DWORD PTR _v1$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _v2$[ebp]
	sub	eax, DWORD PTR [ecx]
	jmp	$L607
; Line 339
$L607:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_allocno_compare ENDP
_TEXT	ENDS
EXTRN	_note_stores:NEAR
EXTRN	_find_regno_note:NEAR
EXTRN	_regset_size:DWORD
EXTRN	_max_parallel:DWORD
EXTRN	_basic_block_end:DWORD
EXTRN	_basic_block_live_at_start:DWORD
_BSS	SEGMENT
_hard_regs_live$S543 DW 01H DUP (?)
	ALIGN	4

_regs_set$S549 DD 01H DUP (?)
_n_regs_set$S550 DD 01H DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
_code$643 = -44
_link$644 = -40
_b$ = -12
_i$ = -8
_insn$ = -4
_block_start_allocnos$ = -16
_offset$622 = -28
_bit$623 = -20
_old$624 = -32
_ax$625 = -24
_a$636 = -36
_global_conflicts PROC NEAR
; Line 345
	push	ebp
	mov	ebp, esp
	sub	esp, 44					; 0000002cH
	push	ebx
	push	esi
	push	edi
; Line 351
	mov	eax, DWORD PTR _max_parallel
	shl	eax, 3
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _regs_set$S549, eax
; Line 353
	mov	eax, DWORD PTR _max_allocno$S536
	add	eax, eax
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _block_start_allocnos$[ebp], eax
; Line 355
	mov	DWORD PTR _b$[ebp], 0
	jmp	$L619
$L620:
	inc	DWORD PTR _b$[ebp]
$L619:
	mov	eax, DWORD PTR _b$[ebp]
	cmp	DWORD PTR _n_basic_blocks, eax
	jle	$L621
; Line 357
	mov	eax, DWORD PTR _allocno_row_words$S542
	shl	eax, 2
	push	eax
	push	0
	mov	eax, DWORD PTR _allocnos_live$S548
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 374
	mov	eax, DWORD PTR _b$[ebp]
	mov	ecx, DWORD PTR _basic_block_live_at_start
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _old$624[ebp], eax
; Line 375
	mov	DWORD PTR _ax$625[ebp], 0
; Line 378
	mov	eax, DWORD PTR _old$624[ebp]
	mov	eax, DWORD PTR [eax]
	mov	WORD PTR _hard_regs_live$S543, ax
; Line 382
	mov	DWORD PTR _offset$622[ebp], 0
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L626
$L627:
	inc	DWORD PTR _offset$622[ebp]
$L626:
	mov	eax, DWORD PTR _regset_size
	cmp	DWORD PTR _offset$622[ebp], eax
	jge	$L628
; Line 383
	mov	eax, DWORD PTR _offset$622[ebp]
	mov	ecx, DWORD PTR _old$624[ebp]
	cmp	DWORD PTR [ecx+eax*4], 0
	jne	$L629
; Line 384
	add	DWORD PTR _i$[ebp], 32			; 00000020H
; Line 385
	jmp	$L630
$L629:
; Line 386
	mov	DWORD PTR _bit$623[ebp], 1
	jmp	$L631
$L632:
	shl	DWORD PTR _bit$623[ebp], 1
	inc	DWORD PTR _i$[ebp]
$L631:
	cmp	DWORD PTR _bit$623[ebp], 0
	je	$L633
; Line 388
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _max_regno, eax
	jg	$L634
; Line 389
	jmp	$L633
; Line 390
$L634:
	mov	eax, DWORD PTR _offset$622[ebp]
	mov	ecx, DWORD PTR _old$624[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	test	eax, DWORD PTR _bit$623[ebp]
	je	$L635
; Line 392
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_allocno$S537
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _a$636[ebp], eax
; Line 393
	cmp	DWORD PTR _a$636[ebp], 0
	jl	$L637
; Line 395
	mov	ebx, 1
	mov	eax, DWORD PTR _a$636[ebp]
	cdq
	xor	eax, edx
	sub	eax, edx
	and	eax, 31					; 0000001fH
	xor	eax, edx
	sub	eax, edx
	mov	cl, al
	shl	ebx, cl
	mov	eax, DWORD PTR _a$636[ebp]
	cdq
	and	edx, 31					; 0000001fH
	add	eax, edx
	sar	eax, 5
	mov	ecx, DWORD PTR _allocnos_live$S548
	or	DWORD PTR [ecx+eax*4], ebx
; Line 396
	mov	eax, DWORD PTR _a$636[ebp]
	mov	ecx, DWORD PTR _ax$625[ebp]
	mov	edx, DWORD PTR _block_start_allocnos$[ebp]
	mov	WORD PTR [edx+ecx*2], ax
	inc	DWORD PTR _ax$625[ebp]
; Line 398
	jmp	$L638
$L637:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	DWORD PTR _a$636[ebp], eax
	cmp	DWORD PTR _a$636[ebp], 0
	jl	$L639
; Line 399
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _regno_reg_rtx
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	mov	eax, DWORD PTR _a$636[ebp]
	push	eax
	call	_mark_reg_live_nc
	add	esp, 8
; Line 400
$L639:
$L638:
; Line 401
$L635:
	jmp	$L632
$L633:
$L630:
	jmp	$L627
$L628:
; Line 406
	mov	eax, DWORD PTR _ax$625[ebp]
	push	eax
	mov	eax, DWORD PTR _block_start_allocnos$[ebp]
	push	eax
	call	_record_conflicts
	add	esp, 8
; Line 409
	mov	eax, DWORD PTR _b$[ebp]
	mov	ecx, DWORD PTR _basic_block_head
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _insn$[ebp], eax
; Line 415
$L641:
; Line 417
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$643[ebp], eax
; Line 422
	mov	DWORD PTR _n_regs_set$S550, 0
; Line 424
	cmp	DWORD PTR _code$643[ebp], 13		; 0000000dH
	je	$L646
	cmp	DWORD PTR _code$643[ebp], 15		; 0000000fH
	je	$L646
	cmp	DWORD PTR _code$643[ebp], 14		; 0000000eH
	jne	$L645
$L646:
; Line 429
	push	OFFSET _mark_reg_clobber
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_note_stores
	add	esp, 8
; Line 433
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR _link$644[ebp], eax
	jmp	$L648
$L649:
	mov	eax, DWORD PTR _link$644[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _link$644[ebp], eax
$L648:
	cmp	DWORD PTR _link$644[ebp], 0
	je	$L650
; Line 434
	mov	eax, DWORD PTR _link$644[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 16777216				; 01000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L651
; Line 435
	mov	eax, DWORD PTR _link$644[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_mark_reg_death
	add	esp, 4
; Line 442
$L651:
	jmp	$L649
$L650:
	push	OFFSET _mark_reg_store
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_note_stores
	add	esp, 8
; Line 450
$L653:
	cmp	DWORD PTR _n_regs_set$S550, 0
	jle	$L654
; Line 451
	dec	DWORD PTR _n_regs_set$S550
	mov	eax, DWORD PTR _n_regs_set$S550
	mov	ecx, DWORD PTR _regs_set$S549
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	1
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_find_regno_note
	add	esp, 12					; 0000000cH
	or	eax, eax
	je	$L656
; Line 452
	mov	eax, DWORD PTR _n_regs_set$S550
	mov	ecx, DWORD PTR _regs_set$S549
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	call	_mark_reg_death
	add	esp, 4
; Line 457
$L656:
	jmp	$L653
$L654:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR _link$644[ebp], eax
	jmp	$L657
$L658:
	mov	eax, DWORD PTR _link$644[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _link$644[ebp], eax
$L657:
	cmp	DWORD PTR _link$644[ebp], 0
	je	$L659
; Line 459
	mov	eax, DWORD PTR _link$644[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 33554432				; 02000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L660
	mov	eax, DWORD PTR _link$644[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	1
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_find_regno_note
	add	esp, 12					; 0000000cH
	or	eax, eax
	je	$L660
; Line 460
	mov	eax, DWORD PTR _link$644[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_mark_reg_death
	add	esp, 4
; Line 461
$L660:
	jmp	$L658
$L659:
; Line 463
$L645:
	mov	eax, DWORD PTR _b$[ebp]
	mov	ecx, DWORD PTR _basic_block_end
	mov	edx, DWORD PTR _insn$[ebp]
	cmp	DWORD PTR [ecx+eax*4], edx
	jne	$L661
; Line 464
	jmp	$L642
; Line 465
$L661:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _insn$[ebp], eax
; Line 466
	jmp	$L641
$L642:
; Line 467
	jmp	$L620
$L621:
; Line 468
$L614:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_global_conflicts ENDP
_TEXT	ENDS
EXTRN	_call_fixed_reg_set:WORD
EXTRN	_reg_class_contents:BYTE
EXTRN	_reg_n_calls_crossed:DWORD
EXTRN	_caller_save_needed:DWORD
EXTRN	_flag_caller_saves:DWORD
EXTRN	_hard_regno_mode_ok:NEAR
EXTRN	_frame_pointer_needed:DWORD
EXTRN	_reg_preferred_class:NEAR
EXTRN	_fixed_reg_set:WORD
EXTRN	_call_used_reg_set:WORD
_TEXT	SEGMENT
_lim$707 = -56
_j$708 = -52
_this_reg$709 = -48
_allocno$ = 8
_losers$ = 12
_all_regs_p$ = 16
_accept_call_clobbered$ = 20
_prefregs$ = 24
_i$ = -16
_prefreg$ = -12
_pass$ = -8
_used$ = -24
_class$ = -20
_mode$ = -4
_j$685 = -28
_lim$686 = -32
_regno$695 = -36
_j$699 = -40
_lim$700 = -44
_find_reg PROC NEAR
; Line 490
	push	ebp
	mov	ebp, esp
	sub	esp, 68					; 00000044H
	push	ebx
	push	esi
	push	edi
; Line 498
	cmp	DWORD PTR _all_regs_p$[ebp], 0
	je	$L906
	mov	DWORD PTR _class$[ebp], 10		; 0000000aH
	jmp	$L907
$L906:
	mov	eax, DWORD PTR _allocno$[ebp]
	mov	ecx, DWORD PTR _allocno_reg$S538
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	call	_reg_preferred_class
	add	esp, 4
	mov	DWORD PTR _class$[ebp], eax
$L907:
; Line 499
	mov	eax, DWORD PTR _allocno$[ebp]
	mov	ecx, DWORD PTR _allocno_reg$S538
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _regno_reg_rtx
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	mov	DWORD PTR _mode$[ebp], eax
; Line 501
	cmp	DWORD PTR _accept_call_clobbered$[ebp], 0
	je	$L674
; Line 502
	mov	ax, WORD PTR _call_fixed_reg_set
	mov	WORD PTR _used$[ebp], ax
; Line 503
	jmp	$L675
$L674:
	mov	eax, DWORD PTR _allocno$[ebp]
	mov	ecx, DWORD PTR _allocno_reg$S538
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _reg_n_calls_crossed
	cmp	DWORD PTR [ecx+eax*4], 0
	jne	$L676
; Line 504
	mov	ax, WORD PTR _fixed_reg_set
	mov	WORD PTR _used$[ebp], ax
; Line 505
	jmp	$L677
$L676:
; Line 506
	mov	ax, WORD PTR _call_used_reg_set
	mov	WORD PTR _used$[ebp], ax
$L677:
$L675:
; Line 509
	movsx	eax, WORD PTR _used$[ebp]
	movsx	ecx, WORD PTR _no_global_alloc_regs$S547
	or	eax, ecx
	mov	WORD PTR _used$[ebp], ax
; Line 511
	mov	eax, DWORD PTR _class$[ebp]
	movsx	eax, WORD PTR _reg_class_contents[eax*2]
	not	eax
	movsx	ecx, WORD PTR _used$[ebp]
	or	eax, ecx
	mov	WORD PTR _used$[ebp], ax
; Line 512
	mov	eax, DWORD PTR _allocno$[ebp]
	mov	ecx, DWORD PTR _hard_reg_conflicts$S544
	movsx	eax, WORD PTR [ecx+eax*2]
	movsx	ecx, WORD PTR _used$[ebp]
	or	eax, ecx
	mov	WORD PTR _used$[ebp], ax
; Line 513
	cmp	DWORD PTR _frame_pointer_needed, 0
	je	$L678
; Line 514
	movsx	eax, WORD PTR _used$[ebp]
	or	eax, 64					; 00000040H
	mov	WORD PTR _used$[ebp], ax
; Line 516
$L678:
	movsx	eax, WORD PTR _used$[ebp]
	not	eax
	movsx	ecx, WORD PTR _prefregs$[ebp]
	and	eax, ecx
	mov	WORD PTR _prefregs$[ebp], ax
; Line 520
	mov	DWORD PTR _i$[ebp], -1
; Line 521
	mov	DWORD PTR _prefreg$[ebp], 0
	jmp	$L679
$L680:
	inc	DWORD PTR _prefreg$[ebp]
$L679:
	cmp	DWORD PTR _prefreg$[ebp], 10		; 0000000aH
	jge	$L681
; Line 524
	mov	eax, 1
	mov	cl, BYTE PTR _prefreg$[ebp]
	shl	eax, cl
	movsx	ecx, WORD PTR _prefregs$[ebp]
	test	eax, ecx
	je	$L683
	cmp	DWORD PTR _losers$[ebp], 0
	je	$L684
	mov	eax, DWORD PTR _prefreg$[ebp]
	mov	ecx, DWORD PTR _losers$[ebp]
	movsx	eax, WORD PTR [ecx+eax*2]
	or	eax, eax
	jge	$L683
$L684:
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	mov	eax, DWORD PTR _prefreg$[ebp]
	push	eax
	call	_hard_regno_mode_ok
	add	esp, 8
	or	eax, eax
	je	$L683
; Line 527
	cmp	DWORD PTR _prefreg$[ebp], 8
	jl	$L908
	mov	DWORD PTR -60+[ebp], 1
	jmp	$L909
$L908:
	mov	eax, DWORD PTR _mode$[ebp]
	mov	eax, DWORD PTR _mode_size[eax*4]
	add	eax, 3
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	mov	DWORD PTR -60+[ebp], eax
$L909:
	mov	eax, DWORD PTR _prefreg$[ebp]
	add	eax, DWORD PTR -60+[ebp]
	mov	DWORD PTR _lim$686[ebp], eax
; Line 532
	mov	eax, DWORD PTR _prefreg$[ebp]
	inc	eax
	mov	DWORD PTR _j$685[ebp], eax
	jmp	$L687
$L688:
	inc	DWORD PTR _j$685[ebp]
$L687:
	mov	eax, DWORD PTR _j$685[ebp]
	cmp	DWORD PTR _lim$686[ebp], eax
	jle	$L689
	mov	eax, 1
	mov	cl, BYTE PTR _j$685[ebp]
	shl	eax, cl
	movsx	ecx, WORD PTR _used$[ebp]
	test	eax, ecx
	jne	$L689
	cmp	DWORD PTR _losers$[ebp], 0
	je	$L690
	mov	eax, DWORD PTR _j$685[ebp]
	mov	ecx, DWORD PTR _losers$[ebp]
	movsx	eax, WORD PTR [ecx+eax*2]
	or	eax, eax
	jge	$L689
$L690:
	jmp	$L688
$L689:
; Line 533
	mov	eax, DWORD PTR _j$685[ebp]
	cmp	DWORD PTR _lim$686[ebp], eax
	jne	$L691
; Line 535
	mov	eax, DWORD PTR _prefreg$[ebp]
	mov	DWORD PTR _i$[ebp], eax
; Line 536
	jmp	$L681
; Line 538
$L691:
; Line 549
$L683:
	jmp	$L680
$L681:
	mov	DWORD PTR _pass$[ebp], 1
; Line 550
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L692
$L693:
	inc	DWORD PTR _i$[ebp]
$L692:
	cmp	DWORD PTR _i$[ebp], 10			; 0000000aH
	jge	$L694
; Line 555
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _regno$695[ebp], eax
; Line 560
	movsx	eax, WORD PTR _used$[ebp]
	mov	edx, 1
	mov	cl, BYTE PTR _regno$695[ebp]
	shl	edx, cl
	test	eax, edx
	jne	$L696
	cmp	DWORD PTR _losers$[ebp], 0
	je	$L697
	mov	eax, DWORD PTR _regno$695[ebp]
	mov	ecx, DWORD PTR _losers$[ebp]
	movsx	eax, WORD PTR [ecx+eax*2]
	or	eax, eax
	jge	$L696
$L697:
	cmp	DWORD PTR _pass$[ebp], 1
	je	$L698
	mov	eax, 1
	mov	cl, BYTE PTR _regno$695[ebp]
	shl	eax, cl
	movsx	ecx, WORD PTR _regs_someone_prefers$S546
	test	eax, ecx
	jne	$L696
$L698:
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	mov	eax, DWORD PTR _regno$695[ebp]
	push	eax
	call	_hard_regno_mode_ok
	add	esp, 8
	or	eax, eax
	je	$L696
; Line 563
	cmp	DWORD PTR _regno$695[ebp], 8
	jl	$L910
	mov	DWORD PTR -64+[ebp], 1
	jmp	$L911
$L910:
	mov	eax, DWORD PTR _mode$[ebp]
	mov	eax, DWORD PTR _mode_size[eax*4]
	add	eax, 3
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	mov	DWORD PTR -64+[ebp], eax
$L911:
	mov	eax, DWORD PTR _regno$695[ebp]
	add	eax, DWORD PTR -64+[ebp]
	mov	DWORD PTR _lim$700[ebp], eax
; Line 568
	mov	eax, DWORD PTR _regno$695[ebp]
	inc	eax
	mov	DWORD PTR _j$699[ebp], eax
	jmp	$L701
$L702:
	inc	DWORD PTR _j$699[ebp]
$L701:
	mov	eax, DWORD PTR _j$699[ebp]
	cmp	DWORD PTR _lim$700[ebp], eax
	jle	$L703
	mov	eax, 1
	mov	cl, BYTE PTR _j$699[ebp]
	shl	eax, cl
	movsx	ecx, WORD PTR _used$[ebp]
	test	eax, ecx
	jne	$L703
	cmp	DWORD PTR _losers$[ebp], 0
	je	$L704
	mov	eax, DWORD PTR _j$699[ebp]
	mov	ecx, DWORD PTR _losers$[ebp]
	movsx	eax, WORD PTR [ecx+eax*2]
	or	eax, eax
	jge	$L703
$L704:
	jmp	$L702
$L703:
; Line 569
	mov	eax, DWORD PTR _j$699[ebp]
	cmp	DWORD PTR _lim$700[ebp], eax
	jne	$L705
; Line 571
	mov	eax, DWORD PTR _regno$695[ebp]
	mov	DWORD PTR _i$[ebp], eax
; Line 572
	jmp	$L694
; Line 575
$L705:
	mov	eax, DWORD PTR _j$699[ebp]
	mov	DWORD PTR _i$[ebp], eax
; Line 578
$L696:
	jmp	$L693
$L694:
; Line 582
	cmp	DWORD PTR _i$[ebp], 10			; 0000000aH
	jge	$L706
; Line 588
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _allocno$[ebp]
	mov	edx, DWORD PTR _allocno_reg$S538
	mov	ecx, DWORD PTR [edx+ecx*4]
	mov	edx, DWORD PTR _reg_renumber
	mov	WORD PTR [edx+ecx*2], ax
; Line 591
	mov	WORD PTR _this_reg$709[ebp], 0
; Line 592
	cmp	DWORD PTR _i$[ebp], 8
	jl	$L912
	mov	DWORD PTR -68+[ebp], 1
	jmp	$L913
$L912:
	mov	eax, DWORD PTR _mode$[ebp]
	mov	eax, DWORD PTR _mode_size[eax*4]
	add	eax, 3
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	mov	DWORD PTR -68+[ebp], eax
$L913:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, DWORD PTR -68+[ebp]
	mov	DWORD PTR _lim$707[ebp], eax
; Line 593
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _j$708[ebp], eax
	jmp	$L710
$L711:
	inc	DWORD PTR _j$708[ebp]
$L710:
	mov	eax, DWORD PTR _lim$707[ebp]
	cmp	DWORD PTR _j$708[ebp], eax
	jge	$L712
; Line 594
	mov	eax, 1
	mov	cl, BYTE PTR _j$708[ebp]
	shl	eax, cl
	movsx	ecx, WORD PTR _this_reg$709[ebp]
	or	eax, ecx
	mov	WORD PTR _this_reg$709[ebp], ax
	jmp	$L711
$L712:
; Line 595
	mov	eax, DWORD PTR _allocno$[ebp]
	mov	DWORD PTR _lim$707[ebp], eax
; Line 596
	mov	DWORD PTR _j$708[ebp], 0
	jmp	$L713
$L714:
	inc	DWORD PTR _j$708[ebp]
$L713:
	mov	eax, DWORD PTR _max_allocno$S536
	cmp	DWORD PTR _j$708[ebp], eax
	jge	$L715
; Line 597
	mov	ebx, DWORD PTR _allocno_row_words$S542
	imul	ebx, DWORD PTR _lim$707[ebp]
	mov	eax, DWORD PTR _j$708[ebp]
	cdq
	and	edx, 31					; 0000001fH
	add	eax, edx
	sar	eax, 5
	add	ebx, eax
	mov	esi, DWORD PTR _conflicts$S541
	mov	edi, 1
	mov	eax, DWORD PTR _j$708[ebp]
	cdq
	xor	eax, edx
	sub	eax, edx
	and	eax, 31					; 0000001fH
	xor	eax, edx
	sub	eax, edx
	mov	cl, al
	shl	edi, cl
	test	DWORD PTR [esi+ebx*4], edi
	jne	$L717
	mov	ebx, DWORD PTR _allocno_row_words$S542
	imul	ebx, DWORD PTR _j$708[ebp]
	mov	eax, DWORD PTR _lim$707[ebp]
	cdq
	and	edx, 31					; 0000001fH
	add	eax, edx
	sar	eax, 5
	add	ebx, eax
	mov	esi, DWORD PTR _conflicts$S541
	mov	edi, 1
	mov	eax, DWORD PTR _lim$707[ebp]
	cdq
	xor	eax, edx
	sub	eax, edx
	and	eax, 31					; 0000001fH
	xor	eax, edx
	sub	eax, edx
	mov	cl, al
	shl	edi, cl
	test	DWORD PTR [esi+ebx*4], edi
	je	$L716
$L717:
; Line 599
	mov	eax, DWORD PTR _j$708[ebp]
	mov	ecx, DWORD PTR _hard_reg_conflicts$S544
	movsx	eax, WORD PTR [ecx+eax*2]
	movsx	ecx, WORD PTR _this_reg$709[ebp]
	or	eax, ecx
	mov	ecx, DWORD PTR _j$708[ebp]
	mov	edx, DWORD PTR _hard_reg_conflicts$S544
	mov	WORD PTR [edx+ecx*2], ax
; Line 601
$L716:
	jmp	$L714
$L715:
; Line 602
	jmp	$L718
$L706:
	cmp	DWORD PTR _flag_caller_saves, 0
	je	$L719
; Line 609
	cmp	DWORD PTR _accept_call_clobbered$[ebp], 0
	jne	$L720
	mov	eax, DWORD PTR _allocno$[ebp]
	mov	ecx, DWORD PTR _allocno_reg$S538
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _reg_n_calls_crossed
	cmp	DWORD PTR [ecx+eax*4], 0
	je	$L720
	mov	eax, DWORD PTR _allocno$[ebp]
	mov	ecx, DWORD PTR _allocno_reg$S538
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _reg_n_calls_crossed
	mov	eax, DWORD PTR [ecx+eax*4]
	shl	eax, 2
	mov	ecx, DWORD PTR _allocno$[ebp]
	mov	edx, DWORD PTR _allocno_reg$S538
	mov	ecx, DWORD PTR [edx+ecx*4]
	mov	edx, DWORD PTR _reg_n_refs
	movsx	ecx, WORD PTR [edx+ecx*2]
	cmp	eax, ecx
	jge	$L720
; Line 612
	movsx	eax, WORD PTR _prefregs$[ebp]
	push	eax
	push	1
	mov	eax, DWORD PTR _all_regs_p$[ebp]
	push	eax
	mov	eax, DWORD PTR _losers$[ebp]
	push	eax
	mov	eax, DWORD PTR _allocno$[ebp]
	push	eax
	call	_find_reg
	add	esp, 20					; 00000014H
; Line 613
	mov	eax, DWORD PTR _allocno$[ebp]
	mov	ecx, DWORD PTR _allocno_reg$S538
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	or	eax, eax
	jl	$L721
; Line 614
	mov	DWORD PTR _caller_save_needed, 1
; Line 615
$L721:
; Line 616
$L720:
; Line 617
$L719:
$L718:
$L667:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_find_reg ENDP
_TEXT	ENDS
PUBLIC	_retry_global_alloc
_TEXT	SEGMENT
_regno$ = 8
_forbidden_regs$ = 12
_allocno$ = -4
_retry_global_alloc PROC NEAR
; Line 631
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 632
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _reg_allocno$S537
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _allocno$[ebp], eax
; Line 633
	cmp	DWORD PTR _allocno$[ebp], 0
	jl	$L727
; Line 640
	mov	eax, DWORD PTR _allocno$[ebp]
	mov	ecx, DWORD PTR _hard_reg_preferences$S545
	movsx	eax, WORD PTR [ecx+eax*2]
	push	eax
	push	0
	push	0
	mov	eax, DWORD PTR _forbidden_regs$[ebp]
	push	eax
	mov	eax, DWORD PTR _allocno$[ebp]
	push	eax
	call	_find_reg
	add	esp, 20					; 00000014H
; Line 641
$L728:
; Line 642
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	or	eax, eax
	jge	$L729
	mov	eax, DWORD PTR _regno$[ebp]
	push	eax
	call	_reg_preferred_or_nothing
	add	esp, 4
	or	eax, eax
	jne	$L729
; Line 644
	mov	eax, DWORD PTR _allocno$[ebp]
	mov	ecx, DWORD PTR _hard_reg_preferences$S545
	movsx	eax, WORD PTR [ecx+eax*2]
	push	eax
	push	0
	push	1
	mov	eax, DWORD PTR _forbidden_regs$[ebp]
	push	eax
	mov	eax, DWORD PTR _allocno$[ebp]
	push	eax
	call	_find_reg
	add	esp, 20					; 00000014H
; Line 645
$L729:
; Line 646
$L727:
$L725:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_retry_global_alloc ENDP
_TEXT	ENDS
PUBLIC	_check_frame_pointer_required
EXTRN	_frame_pointer_rtx:DWORD
EXTRN	_regs_ever_live:TBYTE
EXTRN	_memcpy:NEAR
EXTRN	_reg_mentioned_p:NEAR
EXTRN	_mark_home_live:NEAR
EXTRN	_call_used_regs:TBYTE
_TEXT	SEGMENT
_reg_equiv_constant$ = 8
_reg_equiv_mem$ = 12
_reg_equiv_address$ = 16
_i$ = -24
_old_hard_reg_conflicts$ = -8
_old_reg_renumber$ = -4
_old_regs_ever_live$ = -20
_check_frame_pointer_required PROC NEAR
; Line 662
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	push	ebx
	push	esi
	push	edi
; Line 671
	mov	DWORD PTR _i$[ebp], 10			; 0000000aH
	jmp	$L739
$L740:
	inc	DWORD PTR _i$[ebp]
$L739:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _max_regno, eax
	jle	$L741
; Line 674
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	or	eax, eax
	jge	$L742
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_n_refs
	movsx	eax, WORD PTR [ecx+eax*2]
	or	eax, eax
	jle	$L742
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_equiv_mem$[ebp]
	cmp	DWORD PTR [ecx+eax*4], 0
	jne	$L742
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_equiv_constant$[ebp]
	cmp	DWORD PTR [ecx+eax*4], 0
	jne	$L742
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_equiv_address$[ebp]
	cmp	DWORD PTR [ecx+eax*4], 0
	jne	$L742
; Line 675
	mov	eax, 1
	jmp	$L734
; Line 682
$L742:
	jmp	$L740
$L741:
	mov	eax, DWORD PTR _max_regno
	add	eax, eax
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _old_reg_renumber$[ebp], eax
; Line 684
	mov	eax, DWORD PTR _max_allocno$S536
	add	eax, eax
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _old_hard_reg_conflicts$[ebp], eax
; Line 686
	mov	eax, DWORD PTR _max_regno
	add	eax, eax
	push	eax
	mov	eax, DWORD PTR _reg_renumber
	push	eax
	mov	eax, DWORD PTR _old_reg_renumber$[ebp]
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
; Line 688
	mov	eax, DWORD PTR _max_allocno$S536
	add	eax, eax
	push	eax
	mov	eax, DWORD PTR _hard_reg_conflicts$S544
	push	eax
	mov	eax, DWORD PTR _old_hard_reg_conflicts$[ebp]
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
; Line 689
	push	10					; 0000000aH
	push	OFFSET _regs_ever_live
	lea	eax, DWORD PTR _old_regs_ever_live$[ebp]
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
; Line 691
	mov	DWORD PTR _i$[ebp], 10			; 0000000aH
	jmp	$L744
$L745:
	inc	DWORD PTR _i$[ebp]
$L744:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _max_regno, eax
	jle	$L746
; Line 696
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	or	eax, eax
	jge	$L748
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_equiv_mem$[ebp]
	cmp	DWORD PTR [ecx+eax*4], 0
	je	$L750
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_equiv_mem$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	mov	eax, DWORD PTR _frame_pointer_rtx
	push	eax
	call	_reg_mentioned_p
	add	esp, 8
	or	eax, eax
	jne	$L749
$L750:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_equiv_address$[ebp]
	cmp	DWORD PTR [ecx+eax*4], 0
	je	$L748
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_equiv_address$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	mov	eax, DWORD PTR _frame_pointer_rtx
	push	eax
	call	_reg_mentioned_p
	add	esp, 8
	or	eax, eax
	je	$L748
$L749:
; Line 698
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	call	_retry_global_alloc
	add	esp, 8
; Line 704
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	or	eax, eax
	jl	$L752
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	movsx	eax, BYTE PTR _old_regs_ever_live$[ebp+eax]
	or	eax, eax
	jne	$L751
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	movsx	eax, BYTE PTR _call_used_regs[eax]
	or	eax, eax
	jne	$L751
$L752:
; Line 707
	mov	eax, DWORD PTR _max_regno
	add	eax, eax
	push	eax
	mov	eax, DWORD PTR _old_reg_renumber$[ebp]
	push	eax
	mov	eax, DWORD PTR _reg_renumber
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
; Line 709
	mov	eax, DWORD PTR _max_allocno$S536
	add	eax, eax
	push	eax
	mov	eax, DWORD PTR _old_hard_reg_conflicts$[ebp]
	push	eax
	mov	eax, DWORD PTR _hard_reg_conflicts$S544
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
; Line 710
	push	10					; 0000000aH
	lea	eax, DWORD PTR _old_regs_ever_live$[ebp]
	push	eax
	push	OFFSET _regs_ever_live
	call	_memcpy
	add	esp, 12					; 0000000cH
; Line 711
	mov	eax, 1
	jmp	$L734
; Line 713
$L751:
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	call	_mark_home_live
	add	esp, 4
; Line 716
$L748:
	jmp	$L745
$L746:
	sub	eax, eax
	jmp	$L734
; Line 717
$L734:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_check_frame_pointer_required ENDP
_regno$ = 8
_j$ = -4
_ialloc$764 = -12
_ialloc_prod$765 = -8
_record_one_conflict PROC NEAR
; Line 728
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 731
	cmp	DWORD PTR _regno$[ebp], 10		; 0000000aH
	jge	$L758
; Line 734
	mov	DWORD PTR _j$[ebp], 0
	jmp	$L759
$L760:
	inc	DWORD PTR _j$[ebp]
$L759:
	mov	eax, DWORD PTR _j$[ebp]
	cmp	DWORD PTR _max_allocno$S536, eax
	jle	$L761
; Line 736
	mov	eax, DWORD PTR _j$[ebp]
	cdq
	and	edx, 31					; 0000001fH
	add	eax, edx
	sar	eax, 5
	mov	ecx, DWORD PTR _allocnos_live$S548
	mov	ebx, DWORD PTR [ecx+eax*4]
	mov	esi, 1
	mov	eax, DWORD PTR _j$[ebp]
	cdq
	xor	eax, edx
	sub	eax, edx
	and	eax, 31					; 0000001fH
	xor	eax, edx
	sub	eax, edx
	mov	cl, al
	shl	esi, cl
	test	ebx, esi
	je	$L762
; Line 737
	mov	eax, DWORD PTR _j$[ebp]
	mov	ecx, DWORD PTR _hard_reg_conflicts$S544
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	edx, 1
	mov	cl, BYTE PTR _regno$[ebp]
	shl	edx, cl
	or	eax, edx
	mov	ecx, DWORD PTR _j$[ebp]
	mov	edx, DWORD PTR _hard_reg_conflicts$S544
	mov	WORD PTR [edx+ecx*2], ax
; Line 738
$L762:
	jmp	$L760
$L761:
; Line 739
	jmp	$L763
$L758:
; Line 744
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _reg_allocno$S537
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _ialloc$764[ebp], eax
; Line 745
	mov	eax, DWORD PTR _ialloc$764[ebp]
	imul	eax, DWORD PTR _allocno_row_words$S542
	mov	DWORD PTR _ialloc_prod$765[ebp], eax
; Line 746
	mov	eax, DWORD PTR _ialloc$764[ebp]
	mov	ecx, DWORD PTR _hard_reg_conflicts$S544
	movsx	eax, WORD PTR [ecx+eax*2]
	movsx	ecx, WORD PTR _hard_regs_live$S543
	or	eax, ecx
	mov	ecx, DWORD PTR _ialloc$764[ebp]
	mov	edx, DWORD PTR _hard_reg_conflicts$S544
	mov	WORD PTR [edx+ecx*2], ax
; Line 747
	mov	eax, DWORD PTR _allocno_row_words$S542
	dec	eax
	mov	DWORD PTR _j$[ebp], eax
	jmp	$L766
$L767:
	dec	DWORD PTR _j$[ebp]
$L766:
	cmp	DWORD PTR _j$[ebp], 0
	jl	$L768
; Line 748
	mov	eax, DWORD PTR _j$[ebp]
	mov	ecx, DWORD PTR _allocnos_live$S548
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _ialloc_prod$765[ebp]
	add	ecx, DWORD PTR _j$[ebp]
	mov	edx, DWORD PTR _conflicts$S541
	or	DWORD PTR [edx+ecx*4], eax
	jmp	$L767
$L768:
; Line 749
$L763:
; Line 750
$L756:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_record_one_conflict ENDP
_allocno_vec$ = 8
_len$ = 12
_allocno$ = -4
_j$ = -8
_ialloc_prod$ = -12
_record_conflicts PROC NEAR
; Line 761
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 766
$L776:
	dec	DWORD PTR _len$[ebp]
	js	$L777
; Line 768
	mov	eax, DWORD PTR _len$[ebp]
	mov	ecx, DWORD PTR _allocno_vec$[ebp]
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	DWORD PTR _allocno$[ebp], eax
; Line 769
	mov	eax, DWORD PTR _allocno_row_words$S542
	imul	eax, DWORD PTR _allocno$[ebp]
	mov	DWORD PTR _ialloc_prod$[ebp], eax
; Line 770
	mov	eax, DWORD PTR _allocno$[ebp]
	mov	ecx, DWORD PTR _hard_reg_conflicts$S544
	movsx	eax, WORD PTR [ecx+eax*2]
	movsx	ecx, WORD PTR _hard_regs_live$S543
	or	eax, ecx
	mov	ecx, DWORD PTR _allocno$[ebp]
	mov	edx, DWORD PTR _hard_reg_conflicts$S544
	mov	WORD PTR [edx+ecx*2], ax
; Line 771
	mov	eax, DWORD PTR _allocno_row_words$S542
	dec	eax
	mov	DWORD PTR _j$[ebp], eax
	jmp	$L778
$L779:
	dec	DWORD PTR _j$[ebp]
$L778:
	cmp	DWORD PTR _j$[ebp], 0
	jl	$L780
; Line 772
	mov	eax, DWORD PTR _j$[ebp]
	mov	ecx, DWORD PTR _allocnos_live$S548
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _ialloc_prod$[ebp]
	add	ecx, DWORD PTR _j$[ebp]
	mov	edx, DWORD PTR _conflicts$S541
	or	DWORD PTR [edx+ecx*4], eax
	jmp	$L779
$L780:
; Line 773
	jmp	$L776
$L777:
; Line 774
$L771:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_record_conflicts ENDP
_TEXT	ENDS
EXTRN	_fixed_regs:TBYTE
_TEXT	SEGMENT
_orig_reg$ = 8
_setter$ = 12
_regno$ = -8
_reg$ = -12
_word$ = -4
_last$795 = -16
_mark_reg_store PROC NEAR
; Line 795
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	push	ebx
	push	esi
	push	edi
; Line 797
	mov	eax, DWORD PTR _orig_reg$[ebp]
	mov	DWORD PTR _reg$[ebp], eax
; Line 803
	mov	DWORD PTR _word$[ebp], 0
; Line 805
	mov	eax, DWORD PTR _reg$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L787
; Line 807
	mov	eax, DWORD PTR _reg$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _word$[ebp], eax
; Line 808
	mov	eax, DWORD PTR _reg$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _reg$[ebp], eax
; Line 811
$L787:
	mov	eax, DWORD PTR _reg$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L788
; Line 812
	jmp	$L783
; Line 814
$L788:
	mov	eax, DWORD PTR _setter$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L789
; Line 817
	mov	eax, DWORD PTR _setter$[ebp]
	push	eax
	mov	eax, DWORD PTR _orig_reg$[ebp]
	push	eax
	call	_mark_reg_clobber
	add	esp, 8
; Line 818
	jmp	$L783
; Line 821
$L789:
	mov	eax, DWORD PTR _reg$[ebp]
	mov	ecx, DWORD PTR _n_regs_set$S550
	mov	edx, DWORD PTR _regs_set$S549
	mov	DWORD PTR [edx+ecx*4], eax
	inc	DWORD PTR _n_regs_set$S550
; Line 823
	mov	eax, DWORD PTR _setter$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _reg$[ebp]
	push	eax
	call	_set_preference
	add	esp, 8
; Line 825
	mov	eax, DWORD PTR _reg$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _regno$[ebp], eax
; Line 827
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	or	eax, eax
	jl	$L790
; Line 828
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	DWORD PTR _regno$[ebp], eax
; Line 832
$L790:
	cmp	DWORD PTR _regno$[ebp], 10		; 0000000aH
	jl	$L791
; Line 834
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _reg_allocno$S537
	cmp	DWORD PTR [ecx+eax*4], 0
	jl	$L792
; Line 836
	mov	ebx, 1
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _reg_allocno$S537
	mov	eax, DWORD PTR [ecx+eax*4]
	cdq
	xor	eax, edx
	sub	eax, edx
	and	eax, 31					; 0000001fH
	xor	eax, edx
	sub	eax, edx
	mov	cl, al
	shl	ebx, cl
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _reg_allocno$S537
	mov	eax, DWORD PTR [ecx+eax*4]
	cdq
	and	edx, 31					; 0000001fH
	add	eax, edx
	sar	eax, 5
	mov	ecx, DWORD PTR _allocnos_live$S548
	or	DWORD PTR [ecx+eax*4], ebx
; Line 837
	mov	eax, DWORD PTR _regno$[ebp]
	push	eax
	call	_record_one_conflict
	add	esp, 4
; Line 839
$L792:
; Line 841
	jmp	$L793
$L791:
	mov	eax, DWORD PTR _regno$[ebp]
	movsx	eax, BYTE PTR _fixed_regs[eax]
	or	eax, eax
	jne	$L794
; Line 843
	cmp	DWORD PTR _regno$[ebp], 8
	jl	$L914
	mov	DWORD PTR -20+[ebp], 1
	jmp	$L915
$L914:
	mov	eax, DWORD PTR _reg$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	add	eax, 3
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	mov	DWORD PTR -20+[ebp], eax
$L915:
	mov	eax, DWORD PTR _regno$[ebp]
	add	eax, DWORD PTR -20+[ebp]
	mov	DWORD PTR _last$795[ebp], eax
; Line 844
$L797:
	mov	eax, DWORD PTR _last$795[ebp]
	cmp	DWORD PTR _regno$[ebp], eax
	jge	$L798
; Line 846
	mov	eax, DWORD PTR _regno$[ebp]
	push	eax
	call	_record_one_conflict
	add	esp, 4
; Line 847
	movsx	eax, WORD PTR _hard_regs_live$S543
	mov	edx, 1
	mov	cl, BYTE PTR _regno$[ebp]
	shl	edx, cl
	or	eax, edx
	mov	WORD PTR _hard_regs_live$S543, ax
; Line 848
	inc	DWORD PTR _regno$[ebp]
; Line 849
	jmp	$L797
$L798:
; Line 851
$L794:
$L793:
$L783:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_mark_reg_store ENDP
_reg$ = 8
_setter$ = 12
_regno$ = -8
_word$ = -4
_last$812 = -12
_mark_reg_clobber PROC NEAR
; Line 858
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 865
	mov	DWORD PTR _word$[ebp], 0
; Line 867
	mov	eax, DWORD PTR _setter$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1769472				; 001b0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L804
; Line 868
	jmp	$L801
; Line 870
$L804:
	mov	eax, DWORD PTR _reg$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L805
; Line 872
	mov	eax, DWORD PTR _reg$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _word$[ebp], eax
; Line 873
	mov	eax, DWORD PTR _reg$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _reg$[ebp], eax
; Line 876
$L805:
	mov	eax, DWORD PTR _reg$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L806
; Line 877
	jmp	$L801
; Line 879
$L806:
	mov	eax, DWORD PTR _reg$[ebp]
	mov	ecx, DWORD PTR _n_regs_set$S550
	mov	edx, DWORD PTR _regs_set$S549
	mov	DWORD PTR [edx+ecx*4], eax
	inc	DWORD PTR _n_regs_set$S550
; Line 881
	mov	eax, DWORD PTR _reg$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _regno$[ebp], eax
; Line 883
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	or	eax, eax
	jl	$L807
; Line 884
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	DWORD PTR _regno$[ebp], eax
; Line 888
$L807:
	cmp	DWORD PTR _regno$[ebp], 10		; 0000000aH
	jl	$L808
; Line 890
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _reg_allocno$S537
	cmp	DWORD PTR [ecx+eax*4], 0
	jl	$L809
; Line 892
	mov	ebx, 1
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _reg_allocno$S537
	mov	eax, DWORD PTR [ecx+eax*4]
	cdq
	xor	eax, edx
	sub	eax, edx
	and	eax, 31					; 0000001fH
	xor	eax, edx
	sub	eax, edx
	mov	cl, al
	shl	ebx, cl
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _reg_allocno$S537
	mov	eax, DWORD PTR [ecx+eax*4]
	cdq
	and	edx, 31					; 0000001fH
	add	eax, edx
	sar	eax, 5
	mov	ecx, DWORD PTR _allocnos_live$S548
	or	DWORD PTR [ecx+eax*4], ebx
; Line 893
	mov	eax, DWORD PTR _regno$[ebp]
	push	eax
	call	_record_one_conflict
	add	esp, 4
; Line 895
$L809:
; Line 897
	jmp	$L810
$L808:
	mov	eax, DWORD PTR _regno$[ebp]
	movsx	eax, BYTE PTR _fixed_regs[eax]
	or	eax, eax
	jne	$L811
; Line 899
	cmp	DWORD PTR _regno$[ebp], 8
	jl	$L916
	mov	DWORD PTR -16+[ebp], 1
	jmp	$L917
$L916:
	mov	eax, DWORD PTR _reg$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	add	eax, 3
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	mov	DWORD PTR -16+[ebp], eax
$L917:
	mov	eax, DWORD PTR -16+[ebp]
	add	eax, DWORD PTR _regno$[ebp]
	mov	DWORD PTR _last$812[ebp], eax
; Line 900
$L814:
	mov	eax, DWORD PTR _regno$[ebp]
	cmp	DWORD PTR _last$812[ebp], eax
	jle	$L815
; Line 902
	mov	eax, DWORD PTR _regno$[ebp]
	push	eax
	call	_record_one_conflict
	add	esp, 4
; Line 903
	movsx	eax, WORD PTR _hard_regs_live$S543
	mov	edx, 1
	mov	cl, BYTE PTR _regno$[ebp]
	shl	edx, cl
	or	eax, edx
	mov	WORD PTR _hard_regs_live$S543, ax
; Line 904
	inc	DWORD PTR _regno$[ebp]
; Line 905
	jmp	$L814
$L815:
; Line 907
$L811:
$L810:
$L801:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_mark_reg_clobber ENDP
_reg$ = 8
_regno$ = -4
_last$824 = -8
_mark_reg_death PROC NEAR
; Line 915
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 916
	mov	eax, DWORD PTR _reg$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _regno$[ebp], eax
; Line 919
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	or	eax, eax
	jl	$L819
; Line 920
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	DWORD PTR _regno$[ebp], eax
; Line 924
$L819:
	cmp	DWORD PTR _regno$[ebp], 10		; 0000000aH
	jl	$L820
; Line 926
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _reg_allocno$S537
	cmp	DWORD PTR [ecx+eax*4], 0
	jl	$L821
; Line 927
	mov	ebx, 1
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _reg_allocno$S537
	mov	eax, DWORD PTR [ecx+eax*4]
	cdq
	xor	eax, edx
	sub	eax, edx
	and	eax, 31					; 0000001fH
	xor	eax, edx
	sub	eax, edx
	mov	cl, al
	shl	ebx, cl
	not	ebx
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _reg_allocno$S537
	mov	eax, DWORD PTR [ecx+eax*4]
	cdq
	and	edx, 31					; 0000001fH
	add	eax, edx
	sar	eax, 5
	mov	ecx, DWORD PTR _allocnos_live$S548
	and	DWORD PTR [ecx+eax*4], ebx
; Line 928
$L821:
; Line 930
	jmp	$L822
$L820:
	mov	eax, DWORD PTR _regno$[ebp]
	movsx	eax, BYTE PTR _fixed_regs[eax]
	or	eax, eax
	jne	$L823
; Line 934
	cmp	DWORD PTR _regno$[ebp], 8
	jl	$L918
	mov	DWORD PTR -12+[ebp], 1
	jmp	$L919
$L918:
	mov	eax, DWORD PTR _reg$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	add	eax, 3
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	mov	DWORD PTR -12+[ebp], eax
$L919:
	mov	eax, DWORD PTR _regno$[ebp]
	add	eax, DWORD PTR -12+[ebp]
	mov	DWORD PTR _last$824[ebp], eax
; Line 935
$L826:
	mov	eax, DWORD PTR _last$824[ebp]
	cmp	DWORD PTR _regno$[ebp], eax
	jge	$L827
; Line 937
	mov	eax, 1
	mov	cl, BYTE PTR _regno$[ebp]
	shl	eax, cl
	not	eax
	movsx	ecx, WORD PTR _hard_regs_live$S543
	and	eax, ecx
	mov	WORD PTR _hard_regs_live$S543, ax
; Line 938
	inc	DWORD PTR _regno$[ebp]
; Line 939
	jmp	$L826
$L827:
; Line 941
$L823:
$L822:
$L817:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_mark_reg_death ENDP
_regno$ = 8
_mode$ = 12
_last$ = -4
_mark_reg_live_nc PROC NEAR
; Line 952
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 953
	cmp	DWORD PTR _regno$[ebp], 8
	jl	$L920
	mov	DWORD PTR -8+[ebp], 1
	jmp	$L921
$L920:
	mov	eax, DWORD PTR _mode$[ebp]
	mov	eax, DWORD PTR _mode_size[eax*4]
	add	eax, 3
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	mov	DWORD PTR -8+[ebp], eax
$L921:
	mov	eax, DWORD PTR _regno$[ebp]
	add	eax, DWORD PTR -8+[ebp]
	mov	DWORD PTR _last$[ebp], eax
; Line 954
$L833:
	mov	eax, DWORD PTR _regno$[ebp]
	cmp	DWORD PTR _last$[ebp], eax
	jle	$L834
; Line 956
	mov	eax, 1
	mov	cl, BYTE PTR _regno$[ebp]
	shl	eax, cl
	movsx	ecx, WORD PTR _hard_regs_live$S543
	or	eax, ecx
	mov	WORD PTR _hard_regs_live$S543, ax
; Line 957
	inc	DWORD PTR _regno$[ebp]
; Line 958
	jmp	$L833
$L834:
; Line 959
$L830:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_mark_reg_live_nc ENDP
_TEXT	ENDS
EXTRN	_rtx_format:BYTE
_TEXT	SEGMENT
_dest$ = 8
_src$ = 12
_src_regno$ = -12
_dest_regno$ = -8
_offset$ = -4
_set_preference PROC NEAR
; Line 973
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 977
	mov	DWORD PTR _offset$[ebp], 0
; Line 979
	mov	eax, DWORD PTR _src$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	eax, DWORD PTR _rtx_format[eax*4]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 101				; 00000065H
	jne	$L841
; Line 980
	mov	eax, DWORD PTR _src$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _src$[ebp], eax
; Line 985
$L841:
	mov	eax, DWORD PTR _src$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L842
; Line 986
	mov	eax, DWORD PTR _src$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _src_regno$[ebp], eax
; Line 987
	jmp	$L843
$L842:
	mov	eax, DWORD PTR _src$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L844
	mov	eax, DWORD PTR _src$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L844
; Line 989
	mov	eax, DWORD PTR _src$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _src_regno$[ebp], eax
; Line 990
	mov	eax, DWORD PTR _src$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	DWORD PTR _offset$[ebp], eax
; Line 992
	jmp	$L845
$L844:
; Line 993
	jmp	$L837
$L845:
$L843:
; Line 995
	mov	eax, DWORD PTR _dest$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L846
; Line 996
	mov	eax, DWORD PTR _dest$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _dest_regno$[ebp], eax
; Line 997
	jmp	$L847
$L846:
	mov	eax, DWORD PTR _dest$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L848
	mov	eax, DWORD PTR _dest$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L848
; Line 999
	mov	eax, DWORD PTR _dest$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _dest_regno$[ebp], eax
; Line 1000
	sub	eax, eax
	mov	ecx, DWORD PTR _dest$[ebp]
	sub	eax, DWORD PTR [ecx+8]
	neg	eax
	sub	DWORD PTR _offset$[ebp], eax
; Line 1002
	jmp	$L849
$L848:
; Line 1003
	jmp	$L837
$L849:
$L847:
; Line 1007
	mov	eax, DWORD PTR _src_regno$[ebp]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	or	eax, eax
	jl	$L850
; Line 1008
	mov	eax, DWORD PTR _src_regno$[ebp]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	DWORD PTR _src_regno$[ebp], eax
; Line 1010
$L850:
	mov	eax, DWORD PTR _dest_regno$[ebp]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	or	eax, eax
	jl	$L851
; Line 1011
	mov	eax, DWORD PTR _dest_regno$[ebp]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	DWORD PTR _dest_regno$[ebp], eax
; Line 1016
$L851:
; Line 1017
	cmp	DWORD PTR _dest_regno$[ebp], 10		; 0000000aH
	jge	$L852
	cmp	DWORD PTR _src_regno$[ebp], 10		; 0000000aH
	jl	$L852
	mov	eax, DWORD PTR _src_regno$[ebp]
	mov	ecx, DWORD PTR _reg_allocno$S537
	cmp	DWORD PTR [ecx+eax*4], 0
	jl	$L852
; Line 1019
	sub	eax, eax
	sub	eax, DWORD PTR _offset$[ebp]
	neg	eax
	sub	DWORD PTR _dest_regno$[ebp], eax
; Line 1020
	js	$L853
	cmp	DWORD PTR _dest_regno$[ebp], 10		; 0000000aH
	jge	$L853
; Line 1023
	mov	eax, DWORD PTR _src_regno$[ebp]
	mov	ecx, DWORD PTR _reg_allocno$S537
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _hard_reg_preferences$S545
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	edx, 1
	mov	cl, BYTE PTR _dest_regno$[ebp]
	shl	edx, cl
	or	eax, edx
	mov	ecx, DWORD PTR _src_regno$[ebp]
	mov	edx, DWORD PTR _reg_allocno$S537
	mov	ecx, DWORD PTR [edx+ecx*4]
	mov	edx, DWORD PTR _hard_reg_preferences$S545
	mov	WORD PTR [edx+ecx*2], ax
; Line 1024
	mov	eax, 1
	mov	cl, BYTE PTR _dest_regno$[ebp]
	shl	eax, cl
	movsx	ecx, WORD PTR _regs_someone_prefers$S546
	or	eax, ecx
	mov	WORD PTR _regs_someone_prefers$S546, ax
; Line 1026
$L853:
; Line 1028
$L852:
; Line 1029
	cmp	DWORD PTR _src_regno$[ebp], 10		; 0000000aH
	jge	$L854
	cmp	DWORD PTR _dest_regno$[ebp], 10		; 0000000aH
	jl	$L854
	mov	eax, DWORD PTR _dest_regno$[ebp]
	mov	ecx, DWORD PTR _reg_allocno$S537
	cmp	DWORD PTR [ecx+eax*4], 0
	jl	$L854
; Line 1031
	mov	eax, DWORD PTR _offset$[ebp]
	add	DWORD PTR _src_regno$[ebp], eax
; Line 1032
	js	$L855
	cmp	DWORD PTR _src_regno$[ebp], 10		; 0000000aH
	jge	$L855
; Line 1035
	mov	eax, DWORD PTR _dest_regno$[ebp]
	mov	ecx, DWORD PTR _reg_allocno$S537
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _hard_reg_preferences$S545
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	edx, 1
	mov	cl, BYTE PTR _src_regno$[ebp]
	shl	edx, cl
	or	eax, edx
	mov	ecx, DWORD PTR _dest_regno$[ebp]
	mov	edx, DWORD PTR _reg_allocno$S537
	mov	ecx, DWORD PTR [edx+ecx*4]
	mov	edx, DWORD PTR _hard_reg_preferences$S545
	mov	WORD PTR [edx+ecx*2], ax
; Line 1036
	mov	eax, 1
	mov	cl, BYTE PTR _src_regno$[ebp]
	shl	eax, cl
	movsx	ecx, WORD PTR _regs_someone_prefers$S546
	or	eax, ecx
	mov	WORD PTR _regs_someone_prefers$S546, ax
; Line 1038
$L855:
; Line 1039
$L854:
$L837:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_set_preference ENDP
_TEXT	ENDS
EXTRN	_fprintf:NEAR
_DATA	SEGMENT
$SG859	DB	';; %d regs to allocate:', 00H
$SG863	DB	' %d', 00H
$SG865	DB	' (%d)', 00H
	ORG $+2
$SG866	DB	0aH, 00H
	ORG $+2
$SG871	DB	';; %d conflicts:', 00H
	ORG $+3
$SG877	DB	' %d', 00H
$SG882	DB	' %d', 00H
$SG883	DB	0aH, 00H
	ORG $+2
$SG884	DB	0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_file$ = 8
_i$ = -4
_j$870 = -8
_dump_conflicts PROC NEAR
; Line 1047
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 1049
	mov	eax, DWORD PTR _max_allocno$S536
	push	eax
	push	OFFSET $SG859
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 1050
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L860
$L861:
	inc	DWORD PTR _i$[ebp]
$L860:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _max_allocno$S536, eax
	jle	$L862
; Line 1052
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _allocno_order$S539
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _allocno_reg$S538
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	push	OFFSET $SG863
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 1053
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _allocno_order$S539
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _allocno_size$S540
	cmp	DWORD PTR [ecx+eax*4], 1
	je	$L864
; Line 1054
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _allocno_order$S539
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _allocno_size$S540
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	push	OFFSET $SG865
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 1055
$L864:
	jmp	$L861
$L862:
; Line 1056
	push	OFFSET $SG866
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 8
; Line 1058
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L867
$L868:
	inc	DWORD PTR _i$[ebp]
$L867:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _max_allocno$S536, eax
	jle	$L869
; Line 1061
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _allocno_reg$S538
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	push	OFFSET $SG871
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 1062
	mov	DWORD PTR _j$870[ebp], 0
	jmp	$L872
$L873:
	inc	DWORD PTR _j$870[ebp]
$L872:
	mov	eax, DWORD PTR _max_allocno$S536
	cmp	DWORD PTR _j$870[ebp], eax
	jge	$L874
; Line 1063
	mov	ebx, DWORD PTR _allocno_row_words$S542
	imul	ebx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _j$870[ebp]
	cdq
	and	edx, 31					; 0000001fH
	add	eax, edx
	sar	eax, 5
	add	ebx, eax
	mov	esi, DWORD PTR _conflicts$S541
	mov	edi, 1
	mov	eax, DWORD PTR _j$870[ebp]
	cdq
	xor	eax, edx
	sub	eax, edx
	and	eax, 31					; 0000001fH
	xor	eax, edx
	sub	eax, edx
	mov	cl, al
	shl	edi, cl
	test	DWORD PTR [esi+ebx*4], edi
	jne	$L876
	mov	ebx, DWORD PTR _j$870[ebp]
	imul	ebx, DWORD PTR _allocno_row_words$S542
	mov	eax, DWORD PTR _i$[ebp]
	cdq
	and	edx, 31					; 0000001fH
	add	eax, edx
	sar	eax, 5
	add	ebx, eax
	mov	esi, DWORD PTR _conflicts$S541
	mov	edi, 1
	mov	eax, DWORD PTR _i$[ebp]
	cdq
	xor	eax, edx
	sub	eax, edx
	and	eax, 31					; 0000001fH
	xor	eax, edx
	sub	eax, edx
	mov	cl, al
	shl	edi, cl
	test	DWORD PTR [esi+ebx*4], edi
	je	$L875
$L876:
; Line 1064
	mov	eax, DWORD PTR _j$870[ebp]
	mov	ecx, DWORD PTR _allocno_reg$S538
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	push	OFFSET $SG877
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 1065
$L875:
	jmp	$L873
$L874:
	mov	DWORD PTR _j$870[ebp], 0
	jmp	$L878
$L879:
	inc	DWORD PTR _j$870[ebp]
$L878:
	cmp	DWORD PTR _j$870[ebp], 10		; 0000000aH
	jge	$L880
; Line 1066
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _hard_reg_conflicts$S544
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	edx, 1
	mov	cl, BYTE PTR _j$870[ebp]
	shl	edx, cl
	test	eax, edx
	je	$L881
; Line 1067
	mov	eax, DWORD PTR _j$870[ebp]
	push	eax
	push	OFFSET $SG882
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 1068
$L881:
	jmp	$L879
$L880:
	push	OFFSET $SG883
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 8
; Line 1069
	jmp	$L868
$L869:
; Line 1070
	push	OFFSET $SG884
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 8
; Line 1071
$L857:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_dump_conflicts ENDP
_TEXT	ENDS
PUBLIC	_dump_global_regs
_DATA	SEGMENT
	ORG $+2
$SG889	DB	';; Register dispositions:', 00H
	ORG $+2
$SG894	DB	' %d in %d ', 00H
	ORG $+1
$SG895	DB	0aH, 0aH, ';; Hard regs used: ', 00H
	ORG $+2
$SG900	DB	' %d', 00H
$SG901	DB	0aH, 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_file$ = 8
_i$ = -4
_dump_global_regs PROC NEAR
; Line 1076
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 1079
	push	OFFSET $SG889
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 8
; Line 1080
	mov	DWORD PTR _i$[ebp], 10			; 0000000aH
	jmp	$L890
$L891:
	inc	DWORD PTR _i$[ebp]
$L890:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _max_regno, eax
	jle	$L892
; Line 1082
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	or	eax, eax
	jl	$L893
; Line 1083
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	push	OFFSET $SG894
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
; Line 1084
$L893:
	jmp	$L891
$L892:
; Line 1086
	push	OFFSET $SG895
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 8
; Line 1087
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L896
$L897:
	inc	DWORD PTR _i$[ebp]
$L896:
	cmp	DWORD PTR _i$[ebp], 10			; 0000000aH
	jge	$L898
; Line 1088
	mov	eax, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR _regs_ever_live[eax]
	or	eax, eax
	je	$L899
; Line 1089
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	push	OFFSET $SG900
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 1090
$L899:
	jmp	$L897
$L898:
	push	OFFSET $SG901
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 8
; Line 1091
$L887:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_dump_global_regs ENDP
_TEXT	ENDS
END
