	TITLE	local-alloc.c
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
_DATA	SEGMENT
COMM	_reg_renumber:DWORD
_DATA	ENDS
EXTRN	_reg_n_calls_crossed:DWORD
EXTRN	_reg_preferred_or_nothing:NEAR
EXTRN	_reg_preferred_class:NEAR
EXTRN	_reg_n_refs:DWORD
_BSS	SEGMENT
_next_qty$S552 DD 01H DUP (?)
_qty_n_refs$S555 DD 01H DUP (?)
_qty_min_class$S556 DD 01H DUP (?)
_qty_birth$S557 DD 01H DUP (?)
_qty_size$S559 DD 01H DUP (?)
_qty_mode$S560 DD 01H DUP (?)
_qty_n_calls_crossed$S561 DD 01H DUP (?)
_qty_preferred_or_nothing$S562 DD 01H DUP (?)
_reg_qty$S563 DD 01H DUP (?)
_reg_offset$S564 DD 01H DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
; File local-alloc.c
_regno$ = 8
_mode$ = 12
_size$ = 16
_insn_number$ = 20
_qty$ = -4
_alloc_qty PROC NEAR
; Line 205
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 206
	mov	eax, DWORD PTR _next_qty$S552
	mov	DWORD PTR _qty$[ebp], eax
	inc	DWORD PTR _next_qty$S552
; Line 207
	mov	eax, DWORD PTR _qty$[ebp]
	mov	ecx, DWORD PTR _regno$[ebp]
	mov	edx, DWORD PTR _reg_qty$S563
	mov	DWORD PTR [edx+ecx*4], eax
; Line 208
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _reg_offset$S564
	mov	DWORD PTR [ecx+eax*4], 0
; Line 209
	mov	eax, DWORD PTR _size$[ebp]
	mov	ecx, DWORD PTR _qty$[ebp]
	mov	edx, DWORD PTR _qty_size$S559
	mov	DWORD PTR [edx+ecx*4], eax
; Line 210
	mov	eax, DWORD PTR _mode$[ebp]
	mov	ecx, DWORD PTR _qty$[ebp]
	mov	edx, DWORD PTR _qty_mode$S560
	mov	DWORD PTR [edx+ecx*4], eax
; Line 211
	mov	eax, DWORD PTR _insn_number$[ebp]
	mov	ecx, DWORD PTR _qty$[ebp]
	mov	edx, DWORD PTR _qty_birth$S557
	mov	DWORD PTR [edx+ecx*4], eax
; Line 212
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _reg_n_calls_crossed
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _qty$[ebp]
	mov	edx, DWORD PTR _qty_n_calls_crossed$S561
	mov	DWORD PTR [edx+ecx*4], eax
; Line 213
	mov	eax, DWORD PTR _regno$[ebp]
	push	eax
	call	_reg_preferred_class
	add	esp, 4
	mov	ecx, DWORD PTR _qty$[ebp]
	mov	edx, DWORD PTR _qty_min_class$S556
	mov	DWORD PTR [edx+ecx*4], eax
; Line 214
	mov	eax, DWORD PTR _regno$[ebp]
	push	eax
	call	_reg_preferred_or_nothing
	add	esp, 4
	mov	ecx, DWORD PTR _qty$[ebp]
	mov	edx, DWORD PTR _qty_preferred_or_nothing$S562
	mov	BYTE PTR [ecx+edx], al
; Line 215
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _reg_n_refs
	mov	ax, WORD PTR [ecx+eax*2]
	mov	ecx, DWORD PTR _qty$[ebp]
	mov	edx, DWORD PTR _qty_n_refs$S555
	mov	WORD PTR [edx+ecx*2], ax
; Line 216
$L589:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_alloc_qty ENDP
_TEXT	ENDS
PUBLIC	_local_alloc
EXTRN	_alloca:NEAR
EXTRN	_oballoc:NEAR
EXTRN	_memset:NEAR
EXTRN	_n_basic_blocks:DWORD
EXTRN	_reg_basic_block:DWORD
EXTRN	_max_regno:DWORD
EXTRN	_reg_n_deaths:DWORD
_BSS	SEGMENT
_qty_phys_reg$S553 DD 01H DUP (?)
_qty_phys_sugg$S554 DD 01H DUP (?)
_qty_death$S558 DD 01H DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
_b$ = -4
_i$ = -8
_clear_length$618 = -12
_local_alloc PROC NEAR
; Line 222
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 229
	mov	eax, DWORD PTR _max_regno
	add	eax, eax
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _qty_phys_reg$S553, eax
; Line 230
	mov	eax, DWORD PTR _max_regno
	add	eax, eax
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _qty_phys_sugg$S554, eax
; Line 231
	mov	eax, DWORD PTR _max_regno
	shl	eax, 2
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _qty_birth$S557, eax
; Line 232
	mov	eax, DWORD PTR _max_regno
	shl	eax, 2
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _qty_death$S558, eax
; Line 233
	mov	eax, DWORD PTR _max_regno
	shl	eax, 2
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _qty_size$S559, eax
; Line 234
	mov	eax, DWORD PTR _max_regno
	shl	eax, 2
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _qty_mode$S560, eax
; Line 235
	mov	eax, DWORD PTR _max_regno
	shl	eax, 2
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _qty_n_calls_crossed$S561, eax
; Line 236
	mov	eax, DWORD PTR _max_regno
	shl	eax, 2
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _qty_min_class$S556, eax
; Line 237
	mov	eax, DWORD PTR _max_regno
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _qty_preferred_or_nothing$S562, eax
; Line 238
	mov	eax, DWORD PTR _max_regno
	add	eax, eax
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _qty_n_refs$S555, eax
; Line 240
	mov	eax, DWORD PTR _max_regno
	shl	eax, 2
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _reg_qty$S563, eax
; Line 241
	mov	eax, DWORD PTR _max_regno
	shl	eax, 2
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _reg_offset$S564, eax
; Line 243
	mov	eax, DWORD PTR _max_regno
	add	eax, eax
	push	eax
	call	_oballoc
	add	esp, 4
	mov	DWORD PTR _reg_renumber, eax
; Line 244
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L598
$L599:
	inc	DWORD PTR _i$[ebp]
$L598:
	mov	eax, DWORD PTR _max_regno
	cmp	DWORD PTR _i$[ebp], eax
	jge	$L600
; Line 245
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_renumber
	mov	WORD PTR [ecx+eax*2], -1
	jmp	$L599
$L600:
; Line 249
	mov	eax, DWORD PTR _max_regno
	mov	DWORD PTR _next_qty$S552, eax
; Line 253
	mov	DWORD PTR _b$[ebp], 0
	jmp	$L601
$L602:
	inc	DWORD PTR _b$[ebp]
$L601:
	mov	eax, DWORD PTR _n_basic_blocks
	cmp	DWORD PTR _b$[ebp], eax
	jge	$L603
; Line 255
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L604
$L605:
	inc	DWORD PTR _i$[ebp]
$L604:
	cmp	DWORD PTR _i$[ebp], 10			; 0000000aH
	jge	$L606
; Line 257
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_qty$S563
	mov	DWORD PTR [ecx+eax*4], -1
; Line 258
	jmp	$L605
$L606:
; Line 259
	mov	DWORD PTR _i$[ebp], 10			; 0000000aH
	jmp	$L607
$L608:
	inc	DWORD PTR _i$[ebp]
$L607:
	mov	eax, DWORD PTR _max_regno
	cmp	DWORD PTR _i$[ebp], eax
	jge	$L609
; Line 261
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _qty_phys_sugg$S554
	mov	WORD PTR [ecx+eax*2], -1
; Line 262
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _qty_birth$S557
	mov	DWORD PTR [ecx+eax*4], -1
; Line 263
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _qty_death$S558
	mov	DWORD PTR [ecx+eax*4], -1
; Line 265
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_basic_block
	movsx	eax, WORD PTR [ecx+eax*2]
	cmp	eax, DWORD PTR _b$[ebp]
	jne	$L610
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_n_deaths
	movsx	eax, WORD PTR [ecx+eax*2]
	cmp	eax, 1
	jne	$L610
; Line 266
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_qty$S563
	mov	DWORD PTR [ecx+eax*4], -2		; fffffffeH
; Line 267
	jmp	$L611
$L610:
; Line 268
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_qty$S563
	mov	DWORD PTR [ecx+eax*4], -1
$L611:
; Line 269
	jmp	$L608
$L609:
; Line 271
	mov	eax, DWORD PTR _max_regno
	shl	eax, 2
	push	eax
	push	0
	mov	eax, DWORD PTR _reg_offset$S564
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 277
	cmp	DWORD PTR _next_qty$S552, 16		; 00000010H
	jge	$L613
; Line 279
	mov	DWORD PTR _i$[ebp], 10			; 0000000aH
	jmp	$L614
$L615:
	inc	DWORD PTR _i$[ebp]
$L614:
	mov	eax, DWORD PTR _next_qty$S552
	cmp	DWORD PTR _i$[ebp], eax
	jge	$L616
; Line 281
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _qty_size$S559
	mov	DWORD PTR [ecx+eax*4], 0
; Line 282
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _qty_mode$S560
	mov	DWORD PTR [ecx+eax*4], 0
; Line 283
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _qty_min_class$S556
	mov	DWORD PTR [ecx+eax*4], 0
; Line 284
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _qty_preferred_or_nothing$S562
	mov	BYTE PTR [eax+ecx], 0
; Line 285
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _qty_n_calls_crossed$S561
	mov	DWORD PTR [ecx+eax*4], 0
; Line 286
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _qty_n_refs$S555
	mov	WORD PTR [ecx+eax*2], 0
; Line 287
	jmp	$L615
$L616:
; Line 289
	jmp	$L617
$L613:
; Line 291
	mov	eax, DWORD PTR _next_qty$S552
	sub	eax, 10					; 0000000aH
	mov	DWORD PTR _clear_length$618[ebp], eax
; Line 297
	mov	eax, DWORD PTR _clear_length$618[ebp]
	shl	eax, 2
	push	eax
	push	0
	mov	eax, DWORD PTR _qty_size$S559
	add	eax, 40					; 00000028H
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 298
	mov	eax, DWORD PTR _clear_length$618[ebp]
	shl	eax, 2
	push	eax
	push	0
	mov	eax, DWORD PTR _qty_mode$S560
	add	eax, 40					; 00000028H
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 299
	mov	eax, DWORD PTR _clear_length$618[ebp]
	shl	eax, 2
	push	eax
	push	0
	mov	eax, DWORD PTR _qty_min_class$S556
	add	eax, 40					; 00000028H
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 300
	mov	eax, DWORD PTR _clear_length$618[ebp]
	push	eax
	push	0
	mov	eax, DWORD PTR _qty_preferred_or_nothing$S562
	add	eax, 10					; 0000000aH
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 301
	mov	eax, DWORD PTR _clear_length$618[ebp]
	shl	eax, 2
	push	eax
	push	0
	mov	eax, DWORD PTR _qty_n_calls_crossed$S561
	add	eax, 40					; 00000028H
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 302
	mov	eax, DWORD PTR _clear_length$618[ebp]
	add	eax, eax
	push	eax
	push	0
	mov	eax, DWORD PTR _qty_n_refs$S555
	add	eax, 20					; 00000014H
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 303
$L617:
; Line 305
	mov	DWORD PTR _next_qty$S552, 10		; 0000000aH
; Line 307
	mov	eax, DWORD PTR _b$[ebp]
	push	eax
	call	_block_alloc
	add	esp, 4
; Line 311
	jmp	$L602
$L603:
; Line 312
$L593:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_local_alloc ENDP
_TEXT	ENDS
EXTRN	_reg_first_use:DWORD
EXTRN	_qsort:NEAR
EXTRN	_reg_live_length:DWORD
EXTRN	_rtx_format:BYTE
EXTRN	_recog_memoized:NEAR
EXTRN	_general_operand:NEAR
EXTRN	_insn_n_operands:BYTE
EXTRN	_insn_operand_constraint:BYTE
EXTRN	_note_stores:NEAR
EXTRN	_frame_pointer_needed:DWORD
EXTRN	_abort:NEAR
EXTRN	_basic_block_head:DWORD
EXTRN	_basic_block_end:DWORD
EXTRN	_get_max_uid:NEAR
EXTRN	_basic_block_live_at_start:DWORD
EXTRN	_reg_n_sets:DWORD
_BSS	SEGMENT
_regs_live$S565 DW 01H DUP (?)
	ALIGN	4

_regs_live_at$S566 DD 01H DUP (?)
_call_seen$S567 DD 01H DUP (?)
_this_insn_number$S568 DD 01H DUP (?)
_this_insn$S569 DD 01H DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
_link$641 = -36
_win$642 = -52
_r0$643 = -44
_r1$644 = -56
_combined_regno$645 = -40
_insn_code_number$646 = -48
_commutative$647 = -60
_set1$658 = -64
_b$ = 8
_i$ = -24
_q$ = -8
_insn$ = -28
_insn_number$ = -20
_insn_count$ = -16
_qty_order$ = -12
_insn_map$ = -4
_body$637 = -32
_block_alloc PROC NEAR
; Line 320
	push	ebp
	mov	ebp, esp
	sub	esp, 96					; 00000060H
	push	ebx
	push	esi
	push	edi
; Line 323
	mov	DWORD PTR _insn_number$[ebp], 0
; Line 324
	mov	DWORD PTR _insn_count$[ebp], 0
; Line 328
	mov	DWORD PTR _call_seen$S567, 0
; Line 332
	mov	eax, DWORD PTR _b$[ebp]
	mov	ecx, DWORD PTR _basic_block_end
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _insn$[ebp], eax
; Line 333
$L629:
; Line 335
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1179648				; 00120000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L631
; Line 336
	inc	DWORD PTR _insn_count$[ebp]
; Line 337
$L631:
	mov	eax, DWORD PTR _b$[ebp]
	mov	ecx, DWORD PTR _basic_block_head
	mov	edx, DWORD PTR _insn$[ebp]
	cmp	DWORD PTR [ecx+eax*4], edx
	jne	$L632
; Line 338
	jmp	$L630
; Line 339
$L632:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _insn$[ebp], eax
; Line 340
	jmp	$L629
$L630:
; Line 344
	mov	eax, DWORD PTR _insn_count$[ebp]
	lea	eax, DWORD PTR [eax*2+2]
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _regs_live_at$S566, eax
; Line 345
	mov	eax, DWORD PTR _insn_count$[ebp]
	lea	eax, DWORD PTR [eax*2+2]
	push	eax
	push	0
	mov	eax, DWORD PTR _regs_live_at$S566
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 349
	call	_get_max_uid
	shl	eax, 2
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _insn_map$[ebp], eax
; Line 354
	mov	eax, DWORD PTR _b$[ebp]
	mov	ecx, DWORD PTR _basic_block_live_at_start
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	eax, DWORD PTR [eax]
	mov	WORD PTR _regs_live$S565, ax
; Line 363
	mov	eax, DWORD PTR _b$[ebp]
	mov	ecx, DWORD PTR _basic_block_head
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _insn$[ebp], eax
; Line 364
	mov	DWORD PTR _insn_number$[ebp], 0
; Line 365
$L635:
; Line 367
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _body$637[ebp], eax
; Line 369
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1179648				; 00120000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L638
; Line 370
	inc	DWORD PTR _insn_number$[ebp]
; Line 371
$L638:
	mov	eax, DWORD PTR _insn_number$[ebp]
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	mov	edx, DWORD PTR _insn_map$[ebp]
	mov	DWORD PTR [edx+ecx*4], eax
; Line 374
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 851968				; 000d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L640
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 917504				; 000e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L640
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 983040				; 000f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L639
$L640:
; Line 377
	mov	DWORD PTR _win$642[ebp], 0
; Line 379
	mov	DWORD PTR _combined_regno$645[ebp], -1
; Line 380
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_recog_memoized
	add	esp, 4
	mov	DWORD PTR _insn_code_number$646[ebp], eax
; Line 381
	mov	DWORD PTR _commutative$647[ebp], 0
; Line 383
	mov	eax, DWORD PTR _insn_number$[ebp]
	mov	DWORD PTR _this_insn_number$S568, eax
; Line 384
	mov	eax, DWORD PTR _insn$[ebp]
	mov	DWORD PTR _this_insn$S569, eax
; Line 389
	cmp	DWORD PTR _insn_code_number$646[ebp], 0
	jl	$L648
	mov	eax, DWORD PTR _insn_code_number$646[ebp]
	cmp	DWORD PTR _insn_n_operands[eax*4], 2
	jle	$L648
	mov	eax, DWORD PTR _insn_code_number$646[ebp]
	mov	ecx, eax
	shl	eax, 3
	sub	eax, ecx
	mov	eax, DWORD PTR _insn_operand_constraint[eax*4+4]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 37					; 00000025H
	jne	$L648
; Line 390
	mov	DWORD PTR _commutative$647[ebp], 1
; Line 402
$L648:
; Line 406
	mov	eax, DWORD PTR _body$637[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L649
	mov	eax, DWORD PTR _body$637[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _r0$643[ebp], eax
	mov	eax, DWORD PTR _r0$643[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L936
	mov	eax, DWORD PTR _r0$643[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L934
$L936:
	mov	DWORD PTR -68+[ebp], 1
	jmp	$L935
$L934:
	mov	DWORD PTR -68+[ebp], 0
$L935:
	cmp	DWORD PTR -68+[ebp], 0
	je	$L649
	mov	eax, DWORD PTR _body$637[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _r1$644[ebp], eax
	mov	eax, DWORD PTR _r1$644[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L939
	mov	eax, DWORD PTR _r1$644[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L937
$L939:
	mov	DWORD PTR -72+[ebp], 1
	jmp	$L938
$L937:
	mov	DWORD PTR -72+[ebp], 0
$L938:
	cmp	DWORD PTR -72+[ebp], 0
	je	$L649
; Line 407
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _insn_number$[ebp]
	push	eax
	mov	eax, DWORD PTR _b$[ebp]
	push	eax
	mov	eax, DWORD PTR _r0$643[ebp]
	push	eax
	mov	eax, DWORD PTR _r1$644[ebp]
	push	eax
	call	_combine_regs
	add	esp, 20					; 00000014H
	mov	DWORD PTR _win$642[ebp], eax
; Line 408
	jmp	$L650
$L649:
	mov	eax, DWORD PTR _body$637[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L651
; Line 410
	mov	eax, DWORD PTR _body$637[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _r0$643[ebp], eax
; Line 411
	mov	eax, DWORD PTR _r0$643[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L653
	mov	eax, DWORD PTR _r0$643[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L652
$L653:
; Line 415
	mov	eax, DWORD PTR _body$637[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	eax, DWORD PTR _rtx_format[eax*4]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 101				; 00000065H
	jne	$L654
	mov	eax, DWORD PTR _body$637[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _r1$644[ebp], eax
	mov	eax, DWORD PTR _r1$644[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L942
	mov	eax, DWORD PTR _r1$644[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L940
$L942:
	mov	DWORD PTR -76+[ebp], 1
	jmp	$L941
$L940:
	mov	DWORD PTR -76+[ebp], 0
$L941:
	cmp	DWORD PTR -76+[ebp], 0
	je	$L654
; Line 416
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _insn_number$[ebp]
	push	eax
	mov	eax, DWORD PTR _b$[ebp]
	push	eax
	mov	eax, DWORD PTR _r0$643[ebp]
	push	eax
	mov	eax, DWORD PTR _r1$644[ebp]
	push	eax
	call	_combine_regs
	add	esp, 20					; 00000014H
	mov	DWORD PTR _win$642[ebp], eax
; Line 417
$L654:
; Line 420
	cmp	DWORD PTR _win$642[ebp], 0
	jne	$L655
	cmp	DWORD PTR _commutative$647[ebp], 0
	je	$L655
	mov	eax, DWORD PTR _body$637[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	eax, DWORD PTR _rtx_format[eax*4]
	movsx	eax, BYTE PTR [eax+1]
	cmp	eax, 101				; 00000065H
	jne	$L655
	mov	eax, DWORD PTR _body$637[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _r1$644[ebp], eax
	mov	eax, DWORD PTR _r1$644[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L945
	mov	eax, DWORD PTR _r1$644[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L943
$L945:
	mov	DWORD PTR -80+[ebp], 1
	jmp	$L944
$L943:
	mov	DWORD PTR -80+[ebp], 0
$L944:
	cmp	DWORD PTR -80+[ebp], 0
	je	$L655
; Line 421
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _insn_number$[ebp]
	push	eax
	mov	eax, DWORD PTR _b$[ebp]
	push	eax
	mov	eax, DWORD PTR _r0$643[ebp]
	push	eax
	mov	eax, DWORD PTR _r1$644[ebp]
	push	eax
	call	_combine_regs
	add	esp, 20					; 00000014H
	mov	DWORD PTR _win$642[ebp], eax
; Line 422
$L655:
; Line 423
$L652:
; Line 424
	jmp	$L656
$L651:
	mov	eax, DWORD PTR _body$637[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1310720				; 00140000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L657
; Line 426
	mov	eax, DWORD PTR _body$637[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _set1$658[ebp], eax
; Line 432
	mov	eax, DWORD PTR _set1$658[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L659
	mov	eax, DWORD PTR _set1$658[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _r0$643[ebp], eax
	mov	eax, DWORD PTR _r0$643[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L948
	mov	eax, DWORD PTR _r0$643[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L946
$L948:
	mov	DWORD PTR -84+[ebp], 1
	jmp	$L947
$L946:
	mov	DWORD PTR -84+[ebp], 0
$L947:
	cmp	DWORD PTR -84+[ebp], 0
	je	$L659
	mov	eax, DWORD PTR _set1$658[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	eax, DWORD PTR _rtx_format[eax*4]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 101				; 00000065H
	jne	$L659
	mov	eax, DWORD PTR _set1$658[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _r1$644[ebp], eax
	mov	eax, DWORD PTR _r1$644[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L951
	mov	eax, DWORD PTR _r1$644[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L949
$L951:
	mov	DWORD PTR -88+[ebp], 1
	jmp	$L950
$L949:
	mov	DWORD PTR -88+[ebp], 0
$L950:
	cmp	DWORD PTR -88+[ebp], 0
	je	$L659
; Line 433
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _insn_number$[ebp]
	push	eax
	mov	eax, DWORD PTR _b$[ebp]
	push	eax
	mov	eax, DWORD PTR _r0$643[ebp]
	push	eax
	mov	eax, DWORD PTR _r1$644[ebp]
	push	eax
	call	_combine_regs
	add	esp, 20					; 00000014H
	mov	DWORD PTR _win$642[ebp], eax
; Line 434
$L659:
; Line 439
	cmp	DWORD PTR _win$642[ebp], 0
	jne	$L660
	cmp	DWORD PTR _commutative$647[ebp], 0
	je	$L660
	mov	eax, DWORD PTR _set1$658[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L660
	mov	eax, DWORD PTR _set1$658[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _r0$643[ebp], eax
	mov	eax, DWORD PTR _r0$643[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L954
	mov	eax, DWORD PTR _r0$643[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L952
$L954:
	mov	DWORD PTR -92+[ebp], 1
	jmp	$L953
$L952:
	mov	DWORD PTR -92+[ebp], 0
$L953:
	cmp	DWORD PTR -92+[ebp], 0
	je	$L660
	mov	eax, DWORD PTR _set1$658[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	eax, DWORD PTR _rtx_format[eax*4]
	movsx	eax, BYTE PTR [eax+1]
	cmp	eax, 101				; 00000065H
	jne	$L660
	mov	eax, DWORD PTR _set1$658[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _r1$644[ebp], eax
	mov	eax, DWORD PTR _r1$644[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L957
	mov	eax, DWORD PTR _r1$644[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L955
$L957:
	mov	DWORD PTR -96+[ebp], 1
	jmp	$L956
$L955:
	mov	DWORD PTR -96+[ebp], 0
$L956:
	cmp	DWORD PTR -96+[ebp], 0
	je	$L660
; Line 440
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _insn_number$[ebp]
	push	eax
	mov	eax, DWORD PTR _b$[ebp]
	push	eax
	mov	eax, DWORD PTR _r0$643[ebp]
	push	eax
	mov	eax, DWORD PTR _r1$644[ebp]
	push	eax
	call	_combine_regs
	add	esp, 20					; 00000014H
	mov	DWORD PTR _win$642[ebp], eax
; Line 441
$L660:
; Line 448
$L657:
$L656:
$L650:
	cmp	DWORD PTR _win$642[ebp], 0
	je	$L661
; Line 450
$L663:
	mov	eax, DWORD PTR _r1$644[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L664
; Line 451
	mov	eax, DWORD PTR _r1$644[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _r1$644[ebp], eax
	jmp	$L663
$L664:
; Line 452
	mov	eax, DWORD PTR _r1$644[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _combined_regno$645[ebp], eax
; Line 455
$L661:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR _link$641[ebp], eax
	jmp	$L665
$L666:
	mov	eax, DWORD PTR _link$641[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _link$641[ebp], eax
$L665:
	cmp	DWORD PTR _link$641[ebp], 0
	je	$L667
; Line 461
	mov	eax, DWORD PTR _link$641[ebp]
	cmp	DWORD PTR [eax+4], 0
	je	$L668
	mov	eax, DWORD PTR _link$641[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 16777216				; 01000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L668
	mov	eax, DWORD PTR _link$641[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _combined_regno$645[ebp]
	cmp	DWORD PTR [eax+4], ecx
	je	$L668
; Line 475
	mov	eax, DWORD PTR _insn_number$[ebp]
	push	eax
	mov	eax, DWORD PTR _insn_number$[ebp]
	push	eax
	mov	eax, DWORD PTR _link$641[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_wipe_dead_reg
	add	esp, 12					; 0000000cH
; Line 483
	jmp	$L669
$L668:
; Line 490
	mov	eax, DWORD PTR _link$641[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 50331648				; 03000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L671
	mov	eax, DWORD PTR _body$637[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L671
	push	0
	mov	eax, DWORD PTR _link$641[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L671
	cmp	DWORD PTR _combined_regno$645[ebp], 0
	jge	$L671
	mov	eax, DWORD PTR _body$637[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg_live_length
	cmp	DWORD PTR [ecx+eax*4], 0
	jl	$L671
; Line 492
	mov	eax, DWORD PTR _body$637[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _i$[ebp], eax
; Line 493
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_n_sets
	movsx	eax, WORD PTR [ecx+eax*2]
	cmp	eax, 1
	jle	$L672
; Line 498
	mov	eax, DWORD PTR _link$641[ebp]
	and	DWORD PTR [eax], -16711681		; ff00ffffH
; Line 500
	jmp	$L673
$L672:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_n_refs
	movsx	eax, WORD PTR [ecx+eax*2]
	cmp	eax, 2
	jg	$L674
; Line 506
	cmp	DWORD PTR _frame_pointer_needed, 0
	jne	$L675
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L675
; Line 507
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_live_length
	mov	DWORD PTR [ecx+eax*4], -2		; fffffffeH
; Line 508
	jmp	$L676
$L675:
; Line 509
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_live_length
	mov	DWORD PTR [ecx+eax*4], -1
$L676:
; Line 514
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L677
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L677
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L677
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L677
; Line 516
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_basic_block
	mov	WORD PTR [ecx+eax*2], -2		; fffffffeH
; Line 517
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_qty$S563
	mov	DWORD PTR [ecx+eax*4], -1
; Line 519
$L677:
; Line 520
	jmp	$L678
$L674:
; Line 522
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_live_length
	shl	DWORD PTR [ecx+eax*4], 1
$L678:
$L673:
; Line 524
$L671:
$L669:
	jmp	$L666
$L667:
; Line 530
	push	OFFSET _reg_is_set
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_note_stores
	add	esp, 8
; Line 532
$L639:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 983040				; 000f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L680
; Line 533
	mov	DWORD PTR _call_seen$S567, 1
; Line 534
$L680:
	mov	eax, DWORD PTR _b$[ebp]
	mov	ecx, DWORD PTR _basic_block_end
	mov	edx, DWORD PTR _insn$[ebp]
	cmp	DWORD PTR [ecx+eax*4], edx
	jne	$L681
; Line 535
	jmp	$L636
; Line 539
$L681:
	mov	eax, DWORD PTR _insn_number$[ebp]
	mov	ecx, DWORD PTR _regs_live_at$S566
	movsx	eax, WORD PTR [ecx+eax*2]
	movsx	ecx, WORD PTR _regs_live$S565
	or	eax, ecx
	mov	ecx, DWORD PTR _insn_number$[ebp]
	mov	edx, DWORD PTR _regs_live_at$S566
	mov	WORD PTR [edx+ecx*2], ax
; Line 540
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _insn$[ebp], eax
; Line 541
	jmp	$L635
$L636:
; Line 551
	mov	DWORD PTR _i$[ebp], 10			; 0000000aH
	jmp	$L682
$L683:
	inc	DWORD PTR _i$[ebp]
$L682:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _max_regno, eax
	jle	$L684
; Line 552
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_basic_block
	movsx	eax, WORD PTR [ecx+eax*2]
	cmp	eax, DWORD PTR _b$[ebp]
	jne	$L685
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_qty$S563
	cmp	DWORD PTR [ecx+eax*4], 0
	jl	$L685
; Line 557
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_first_use
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _insn_map$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	mov	ebx, DWORD PTR _reg_qty$S563
	mov	edx, DWORD PTR [ebx+edx*4]
	mov	ebx, DWORD PTR _qty_birth$S557
	mov	edx, DWORD PTR [ebx+edx*4]
	cmp	DWORD PTR [ecx+eax*4], edx
	jge	$L686
; Line 558
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_first_use
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _insn_map$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _reg_qty$S563
	mov	ecx, DWORD PTR [edx+ecx*4]
	mov	edx, DWORD PTR _qty_birth$S557
	mov	DWORD PTR [edx+ecx*4], eax
; Line 559
$L686:
; Line 561
$L685:
	jmp	$L683
$L684:
	mov	DWORD PTR _i$[ebp], 10			; 0000000aH
	jmp	$L687
$L688:
	inc	DWORD PTR _i$[ebp]
$L687:
	mov	eax, DWORD PTR _next_qty$S552
	cmp	DWORD PTR _i$[ebp], eax
	jge	$L689
; Line 563
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _qty_birth$S557
	cmp	DWORD PTR [ecx+eax*4], -1
	jne	$L690
; Line 564
	call	_abort
; Line 565
$L690:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _qty_death$S558
	cmp	DWORD PTR [ecx+eax*4], -1
	jne	$L692
; Line 566
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _qty_birth$S557
	mov	eax, DWORD PTR [ecx+eax*4]
	inc	eax
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _qty_death$S558
	mov	DWORD PTR [edx+ecx*4], eax
; Line 567
$L692:
	jmp	$L688
$L689:
; Line 571
	mov	eax, DWORD PTR _next_qty$S552
	add	eax, eax
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _qty_order$[ebp], eax
; Line 572
	mov	DWORD PTR _i$[ebp], 10			; 0000000aH
	jmp	$L693
$L694:
	inc	DWORD PTR _i$[ebp]
$L693:
	mov	eax, DWORD PTR _next_qty$S552
	cmp	DWORD PTR _i$[ebp], eax
	jge	$L695
; Line 573
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _qty_order$[ebp]
	mov	WORD PTR [edx+ecx*2], ax
	jmp	$L694
$L695:
; Line 578
	cmp	DWORD PTR _next_qty$S552, 12		; 0000000cH
	jne	$L696
; Line 580
	push	11					; 0000000bH
	push	10					; 0000000aH
	call	_qty_compare
	add	esp, 8
	or	eax, eax
	jle	$L697
; Line 581
	mov	eax, DWORD PTR _qty_order$[ebp]
	movsx	eax, WORD PTR [eax+20]
	mov	DWORD PTR _i$[ebp], eax
	mov	eax, DWORD PTR _qty_order$[ebp]
	mov	ax, WORD PTR [eax+22]
	mov	ecx, DWORD PTR _qty_order$[ebp]
	mov	WORD PTR [ecx+20], ax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _qty_order$[ebp]
	mov	WORD PTR [ecx+22], ax
$L697:
; Line 583
	jmp	$L698
$L696:
	cmp	DWORD PTR _next_qty$S552, 13		; 0000000dH
	jne	$L699
; Line 585
	push	11					; 0000000bH
	push	10					; 0000000aH
	call	_qty_compare
	add	esp, 8
	or	eax, eax
	jle	$L700
; Line 586
	mov	eax, DWORD PTR _qty_order$[ebp]
	movsx	eax, WORD PTR [eax+20]
	mov	DWORD PTR _i$[ebp], eax
	mov	eax, DWORD PTR _qty_order$[ebp]
	mov	ax, WORD PTR [eax+22]
	mov	ecx, DWORD PTR _qty_order$[ebp]
	mov	WORD PTR [ecx+20], ax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _qty_order$[ebp]
	mov	WORD PTR [ecx+22], ax
$L700:
; Line 587
	push	12					; 0000000cH
	push	11					; 0000000bH
	call	_qty_compare
	add	esp, 8
	or	eax, eax
	jle	$L701
; Line 588
	mov	eax, DWORD PTR _qty_order$[ebp]
	movsx	eax, WORD PTR [eax+24]
	mov	DWORD PTR _i$[ebp], eax
	mov	eax, DWORD PTR _qty_order$[ebp]
	mov	ax, WORD PTR [eax+22]
	mov	ecx, DWORD PTR _qty_order$[ebp]
	mov	WORD PTR [ecx+24], ax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _qty_order$[ebp]
	mov	WORD PTR [ecx+22], ax
$L701:
; Line 589
	push	11					; 0000000bH
	push	10					; 0000000aH
	call	_qty_compare
	add	esp, 8
	or	eax, eax
	jle	$L702
; Line 590
	mov	eax, DWORD PTR _qty_order$[ebp]
	movsx	eax, WORD PTR [eax+20]
	mov	DWORD PTR _i$[ebp], eax
	mov	eax, DWORD PTR _qty_order$[ebp]
	mov	ax, WORD PTR [eax+22]
	mov	ecx, DWORD PTR _qty_order$[ebp]
	mov	WORD PTR [ecx+20], ax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _qty_order$[ebp]
	mov	WORD PTR [ecx+22], ax
$L702:
; Line 592
	jmp	$L703
$L699:
	cmp	DWORD PTR _next_qty$S552, 13		; 0000000dH
	jle	$L704
; Line 594
	push	OFFSET _qty_compare_1
	push	2
	mov	eax, DWORD PTR _next_qty$S552
	sub	eax, 10					; 0000000aH
	push	eax
	mov	eax, DWORD PTR _qty_order$[ebp]
	add	eax, 20					; 00000014H
	push	eax
	call	_qsort
	add	esp, 16					; 00000010H
; Line 601
$L704:
$L703:
$L698:
	mov	DWORD PTR _i$[ebp], 10			; 0000000aH
	jmp	$L706
$L707:
	inc	DWORD PTR _i$[ebp]
$L706:
	mov	eax, DWORD PTR _next_qty$S552
	cmp	DWORD PTR _i$[ebp], eax
	jge	$L708
; Line 603
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _qty_order$[ebp]
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	DWORD PTR _q$[ebp], eax
; Line 604
	mov	eax, DWORD PTR _q$[ebp]
	mov	ecx, DWORD PTR _qty_size$S559
	cmp	DWORD PTR [ecx+eax*4], 0
	jl	$L709
; Line 610
	mov	eax, DWORD PTR _q$[ebp]
	mov	ecx, DWORD PTR _qty_death$S558
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	mov	eax, DWORD PTR _q$[ebp]
	mov	ecx, DWORD PTR _qty_birth$S557
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	push	0
	mov	eax, DWORD PTR _q$[ebp]
	push	eax
	mov	eax, DWORD PTR _q$[ebp]
	mov	ecx, DWORD PTR _qty_mode$S560
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	mov	eax, DWORD PTR _q$[ebp]
	mov	ecx, DWORD PTR _qty_min_class$S556
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	call	_find_free_reg
	add	esp, 24					; 00000018H
	mov	ecx, DWORD PTR _q$[ebp]
	mov	edx, DWORD PTR _qty_phys_reg$S553
	mov	WORD PTR [edx+ecx*2], ax
; Line 611
	mov	eax, DWORD PTR _q$[ebp]
	mov	ecx, DWORD PTR _qty_phys_reg$S553
	movsx	eax, WORD PTR [ecx+eax*2]
	or	eax, eax
	jl	$L711
; Line 612
	jmp	$L707
; Line 613
$L711:
; Line 615
$L710:
	mov	eax, DWORD PTR _q$[ebp]
	mov	ecx, DWORD PTR _qty_preferred_or_nothing$S562
	movsx	eax, BYTE PTR [eax+ecx]
	or	eax, eax
	jne	$L712
; Line 618
	mov	eax, DWORD PTR _q$[ebp]
	mov	ecx, DWORD PTR _qty_death$S558
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	mov	eax, DWORD PTR _q$[ebp]
	mov	ecx, DWORD PTR _qty_birth$S557
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	push	0
	mov	eax, DWORD PTR _q$[ebp]
	push	eax
	mov	eax, DWORD PTR _q$[ebp]
	mov	ecx, DWORD PTR _qty_mode$S560
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	push	10					; 0000000aH
	call	_find_free_reg
	add	esp, 24					; 00000018H
	mov	ecx, DWORD PTR _q$[ebp]
	mov	edx, DWORD PTR _qty_phys_reg$S553
	mov	WORD PTR [edx+ecx*2], ax
; Line 619
$L712:
; Line 620
$L709:
	jmp	$L707
$L708:
; Line 625
	mov	DWORD PTR _i$[ebp], 10			; 0000000aH
	jmp	$L713
$L714:
	inc	DWORD PTR _i$[ebp]
$L713:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _max_regno, eax
	jle	$L715
; Line 626
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_qty$S563
	cmp	DWORD PTR [ecx+eax*4], 0
	jl	$L716
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_qty$S563
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _qty_phys_reg$S553
	movsx	eax, WORD PTR [ecx+eax*2]
	or	eax, eax
	jl	$L716
; Line 628
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_qty$S563
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _qty_phys_reg$S553
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _reg_offset$S564
	add	eax, DWORD PTR [edx+ecx*4]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _reg_renumber
	mov	WORD PTR [edx+ecx*2], ax
; Line 630
$L716:
	jmp	$L714
$L715:
$L620:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_block_alloc ENDP
_q1$ = 8
_q2$ = 12
_tem$ = -4
_qty_compare PROC NEAR
; Line 643
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 644
	mov	eax, DWORD PTR _q2$[ebp]
	mov	ecx, DWORD PTR _qty_phys_sugg$S554
	movsx	eax, WORD PTR [ecx+eax*2]
	or	eax, eax
	mov	eax, 0
	setge	al
	mov	ecx, DWORD PTR _q1$[ebp]
	mov	edx, DWORD PTR _qty_phys_sugg$S554
	movsx	ecx, WORD PTR [edx+ecx*2]
	or	ecx, ecx
	mov	ecx, 0
	setge	cl
	sub	eax, ecx
	mov	DWORD PTR _tem$[ebp], eax
; Line 645
	cmp	DWORD PTR _tem$[ebp], 0
	je	$L721
	mov	eax, DWORD PTR _tem$[ebp]
	jmp	$L719
; Line 646
$L721:
; Line 647
	mov	eax, DWORD PTR _q1$[ebp]
	mov	ecx, DWORD PTR _qty_n_refs$S555
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	ecx, DWORD PTR _q1$[ebp]
	mov	edx, DWORD PTR _qty_death$S558
	add	eax, DWORD PTR [edx+ecx*4]
	mov	ecx, DWORD PTR _q1$[ebp]
	mov	edx, DWORD PTR _qty_birth$S557
	sub	eax, DWORD PTR [edx+ecx*4]
	mov	ecx, DWORD PTR _q2$[ebp]
	mov	edx, DWORD PTR _qty_size$S559
	imul	eax, DWORD PTR [edx+ecx*4]
	mov	ecx, DWORD PTR _q2$[ebp]
	mov	edx, DWORD PTR _qty_n_refs$S555
	movsx	ecx, WORD PTR [edx+ecx*2]
	mov	edx, DWORD PTR _q2$[ebp]
	mov	ebx, DWORD PTR _qty_death$S558
	add	ecx, DWORD PTR [ebx+edx*4]
	mov	edx, DWORD PTR _q2$[ebp]
	mov	ebx, DWORD PTR _qty_birth$S557
	sub	ecx, DWORD PTR [ebx+edx*4]
	mov	edx, DWORD PTR _q1$[ebp]
	mov	ebx, DWORD PTR _qty_size$S559
	imul	ecx, DWORD PTR [ebx+edx*4]
	sub	eax, ecx
	neg	eax
	jmp	$L719
; Line 648
$L719:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_qty_compare ENDP
_q1$ = 8
_q2$ = 12
_tem$ = -4
_qty_compare_1 PROC NEAR
; Line 653
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 654
	mov	eax, DWORD PTR _q2$[ebp]
	movsx	eax, WORD PTR [eax]
	mov	ecx, DWORD PTR _qty_phys_sugg$S554
	movsx	eax, WORD PTR [ecx+eax*2]
	or	eax, eax
	mov	eax, 0
	setge	al
	mov	ecx, DWORD PTR _q1$[ebp]
	movsx	ecx, WORD PTR [ecx]
	mov	edx, DWORD PTR _qty_phys_sugg$S554
	movsx	ecx, WORD PTR [edx+ecx*2]
	or	ecx, ecx
	mov	ecx, 0
	setge	cl
	sub	eax, ecx
	mov	DWORD PTR _tem$[ebp], eax
; Line 655
	cmp	DWORD PTR _tem$[ebp], 0
	je	$L726
	mov	eax, DWORD PTR _tem$[ebp]
	jmp	$L724
; Line 656
$L726:
; Line 657
	mov	eax, DWORD PTR _q1$[ebp]
	movsx	eax, WORD PTR [eax]
	mov	ecx, DWORD PTR _qty_n_refs$S555
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	ecx, DWORD PTR _q1$[ebp]
	movsx	ecx, WORD PTR [ecx]
	mov	edx, DWORD PTR _qty_death$S558
	add	eax, DWORD PTR [edx+ecx*4]
	mov	ecx, DWORD PTR _q1$[ebp]
	movsx	ecx, WORD PTR [ecx]
	mov	edx, DWORD PTR _qty_birth$S557
	sub	eax, DWORD PTR [edx+ecx*4]
	mov	ecx, DWORD PTR _q2$[ebp]
	movsx	ecx, WORD PTR [ecx]
	mov	edx, DWORD PTR _qty_size$S559
	imul	eax, DWORD PTR [edx+ecx*4]
	mov	ecx, DWORD PTR _q2$[ebp]
	movsx	ecx, WORD PTR [ecx]
	mov	edx, DWORD PTR _qty_n_refs$S555
	movsx	ecx, WORD PTR [edx+ecx*2]
	mov	edx, DWORD PTR _q2$[ebp]
	movsx	edx, WORD PTR [edx]
	mov	ebx, DWORD PTR _qty_death$S558
	add	ecx, DWORD PTR [ebx+edx*4]
	mov	edx, DWORD PTR _q2$[ebp]
	movsx	edx, WORD PTR [edx]
	mov	ebx, DWORD PTR _qty_birth$S557
	sub	ecx, DWORD PTR [ebx+edx*4]
	mov	edx, DWORD PTR _q1$[ebp]
	movsx	edx, WORD PTR [edx]
	mov	ebx, DWORD PTR _qty_size$S559
	imul	ecx, DWORD PTR [ebx+edx*4]
	sub	eax, ecx
	neg	eax
	mov	DWORD PTR _tem$[ebp], eax
; Line 658
	cmp	DWORD PTR _tem$[ebp], 0
	je	$L727
	mov	eax, DWORD PTR _tem$[ebp]
	jmp	$L724
; Line 661
$L727:
	mov	eax, DWORD PTR _q1$[ebp]
	movsx	eax, WORD PTR [eax]
	mov	ecx, DWORD PTR _q2$[ebp]
	movsx	ecx, WORD PTR [ecx]
	sub	eax, ecx
	jmp	$L724
; Line 662
$L724:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_qty_compare_1 ENDP
_TEXT	ENDS
EXTRN	_find_regno_note:NEAR
EXTRN	_fixed_regs:TBYTE
EXTRN	_call_used_regs:TBYTE
EXTRN	_mode_size:BYTE
_TEXT	SEGMENT
_i$782 = -28
_usedreg$ = 8
_setreg$ = 12
_insn_number$ = 20
_insn$ = 24
_ureg$ = -20
_sreg$ = -8
_offset$ = -24
_usize$ = -16
_ssize$ = -12
_sqty$ = -4
_combine_regs PROC NEAR
; Line 685
	push	ebp
	mov	ebp, esp
	sub	esp, 36					; 00000024H
	push	ebx
	push	esi
	push	edi
; Line 687
	mov	DWORD PTR _offset$[ebp], 0
; Line 693
$L741:
	mov	eax, DWORD PTR _usedreg$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L742
; Line 695
	mov	eax, DWORD PTR _usedreg$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	DWORD PTR _offset$[ebp], eax
; Line 696
	mov	eax, DWORD PTR _usedreg$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _usedreg$[ebp], eax
; Line 697
	jmp	$L741
$L742:
; Line 698
	mov	eax, DWORD PTR _usedreg$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L743
; Line 699
	sub	eax, eax
	jmp	$L733
; Line 700
$L743:
	mov	eax, DWORD PTR _usedreg$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _ureg$[ebp], eax
; Line 701
	mov	eax, DWORD PTR _usedreg$[ebp]
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
	mov	DWORD PTR _usize$[ebp], eax
; Line 703
$L745:
	mov	eax, DWORD PTR _setreg$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L746
; Line 705
	sub	eax, eax
	mov	ecx, DWORD PTR _setreg$[ebp]
	sub	eax, DWORD PTR [ecx+8]
	neg	eax
	sub	DWORD PTR _offset$[ebp], eax
; Line 706
	mov	eax, DWORD PTR _setreg$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _setreg$[ebp], eax
; Line 707
	jmp	$L745
$L746:
; Line 708
	mov	eax, DWORD PTR _setreg$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L747
; Line 709
	sub	eax, eax
	jmp	$L733
; Line 710
$L747:
	mov	eax, DWORD PTR _setreg$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _sreg$[ebp], eax
; Line 711
	mov	eax, DWORD PTR _setreg$[ebp]
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
	mov	DWORD PTR _ssize$[ebp], eax
; Line 714
	cmp	DWORD PTR _offset$[ebp], 0
	jle	$L748
	mov	eax, DWORD PTR _usize$[ebp]
	add	eax, DWORD PTR _offset$[ebp]
	cmp	eax, DWORD PTR _ssize$[ebp]
	jle	$L748
; Line 715
	sub	eax, eax
	jmp	$L733
; Line 716
$L748:
	cmp	DWORD PTR _offset$[ebp], 0
	jge	$L749
	mov	eax, DWORD PTR _usize$[ebp]
	add	eax, DWORD PTR _offset$[ebp]
	cmp	eax, DWORD PTR _ssize$[ebp]
	jge	$L749
; Line 717
	sub	eax, eax
	jmp	$L733
; Line 725
$L749:
; Line 726
	mov	eax, DWORD PTR _usize$[ebp]
	cmp	DWORD PTR _ssize$[ebp], eax
	jle	$L750
	mov	eax, DWORD PTR _ureg$[ebp]
	mov	ecx, DWORD PTR _reg_qty$S563
	cmp	DWORD PTR [ecx+eax*4], 10		; 0000000aH
	jl	$L750
	mov	eax, DWORD PTR _ureg$[ebp]
	mov	ecx, DWORD PTR _reg_qty$S563
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _qty_size$S559
	mov	edx, DWORD PTR _usize$[ebp]
	cmp	DWORD PTR [ecx+eax*4], edx
	jle	$L750
; Line 727
	sub	eax, eax
	jmp	$L733
; Line 733
$L750:
	cmp	DWORD PTR _ureg$[ebp], 10		; 0000000aH
	jge	$L751
; Line 735
	mov	eax, DWORD PTR _ureg$[ebp]
	movsx	eax, BYTE PTR _fixed_regs[eax]
	or	eax, eax
	je	$L752
; Line 736
	sub	eax, eax
	jmp	$L733
; Line 737
$L752:
	mov	eax, DWORD PTR _sreg$[ebp]
	mov	ecx, DWORD PTR _reg_n_calls_crossed
	cmp	DWORD PTR [ecx+eax*4], 0
	je	$L753
	mov	eax, DWORD PTR _ureg$[ebp]
	movsx	eax, BYTE PTR _call_used_regs[eax]
	or	eax, eax
	je	$L753
; Line 738
	sub	eax, eax
	jmp	$L733
; Line 739
$L753:
	mov	eax, DWORD PTR _usize$[ebp]
	cmp	DWORD PTR _ssize$[ebp], eax
	jle	$L754
; Line 740
	sub	eax, eax
	jmp	$L733
; Line 741
$L754:
; Line 743
$L751:
	cmp	DWORD PTR _sreg$[ebp], 10		; 0000000aH
	jge	$L755
; Line 745
	mov	eax, DWORD PTR _sreg$[ebp]
	movsx	eax, BYTE PTR _fixed_regs[eax]
	or	eax, eax
	je	$L756
; Line 746
	sub	eax, eax
	jmp	$L733
; Line 747
$L756:
	mov	eax, DWORD PTR _ureg$[ebp]
	mov	ecx, DWORD PTR _reg_n_calls_crossed
	cmp	DWORD PTR [ecx+eax*4], 0
	je	$L757
	mov	eax, DWORD PTR _sreg$[ebp]
	movsx	eax, BYTE PTR _call_used_regs[eax]
	or	eax, eax
	je	$L757
; Line 748
	sub	eax, eax
	jmp	$L733
; Line 749
$L757:
	mov	eax, DWORD PTR _usize$[ebp]
	cmp	DWORD PTR _ssize$[ebp], eax
	jge	$L758
; Line 750
	sub	eax, eax
	jmp	$L733
; Line 751
$L758:
; Line 757
$L755:
	mov	eax, DWORD PTR _ureg$[ebp]
	cmp	DWORD PTR _sreg$[ebp], eax
	jne	$L759
; Line 758
	sub	eax, eax
	jmp	$L733
; Line 762
$L759:
	cmp	DWORD PTR _ureg$[ebp], 10		; 0000000aH
	jge	$L760
	cmp	DWORD PTR _sreg$[ebp], 10		; 0000000aH
	jge	$L760
; Line 763
	sub	eax, eax
	jmp	$L733
; Line 768
$L760:
	mov	eax, DWORD PTR _setreg$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, DWORD PTR _usedreg$[ebp]
	mov	ecx, DWORD PTR [ecx]
	shl	ecx, 8
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L761
; Line 769
	sub	eax, eax
	jmp	$L733
; Line 778
$L761:
	cmp	DWORD PTR _ureg$[ebp], 10		; 0000000aH
	jge	$L762
; Line 780
	mov	eax, DWORD PTR _sreg$[ebp]
	mov	ecx, DWORD PTR _reg_qty$S563
	cmp	DWORD PTR [ecx+eax*4], -2		; fffffffeH
	jne	$L763
; Line 781
	mov	eax, DWORD PTR _insn_number$[ebp]
	push	eax
	mov	eax, DWORD PTR _setreg$[ebp]
	push	eax
	call	_reg_is_born
	add	esp, 8
; Line 782
$L763:
	mov	eax, DWORD PTR _ureg$[ebp]
	mov	ecx, DWORD PTR _reg_qty$S563
	cmp	DWORD PTR [ecx+eax*4], -2		; fffffffeH
	jne	$L764
; Line 783
	mov	eax, DWORD PTR _insn_number$[ebp]
	push	eax
	mov	eax, DWORD PTR _usedreg$[ebp]
	push	eax
	call	_reg_is_born
	add	esp, 8
; Line 784
$L764:
	mov	eax, DWORD PTR _sreg$[ebp]
	mov	ecx, DWORD PTR _reg_qty$S563
	cmp	DWORD PTR [ecx+eax*4], 0
	jl	$L765
; Line 785
	mov	eax, DWORD PTR _ureg$[ebp]
	mov	ecx, DWORD PTR _sreg$[ebp]
	mov	edx, DWORD PTR _reg_qty$S563
	mov	ecx, DWORD PTR [edx+ecx*4]
	mov	edx, DWORD PTR _qty_phys_sugg$S554
	mov	WORD PTR [edx+ecx*2], ax
; Line 786
$L765:
	sub	eax, eax
	jmp	$L733
; Line 788
$L762:
	cmp	DWORD PTR _sreg$[ebp], 10		; 0000000aH
	jge	$L766
; Line 790
	mov	eax, DWORD PTR _sreg$[ebp]
	mov	ecx, DWORD PTR _reg_qty$S563
	cmp	DWORD PTR [ecx+eax*4], -2		; fffffffeH
	jne	$L767
; Line 791
	mov	eax, DWORD PTR _insn_number$[ebp]
	push	eax
	mov	eax, DWORD PTR _setreg$[ebp]
	push	eax
	call	_reg_is_born
	add	esp, 8
; Line 792
$L767:
	mov	eax, DWORD PTR _ureg$[ebp]
	mov	ecx, DWORD PTR _reg_qty$S563
	cmp	DWORD PTR [ecx+eax*4], -2		; fffffffeH
	jne	$L768
; Line 793
	mov	eax, DWORD PTR _insn_number$[ebp]
	push	eax
	mov	eax, DWORD PTR _usedreg$[ebp]
	push	eax
	call	_reg_is_born
	add	esp, 8
; Line 799
$L768:
; Line 803
	mov	eax, DWORD PTR _ureg$[ebp]
	mov	ecx, DWORD PTR _reg_qty$S563
	cmp	DWORD PTR [ecx+eax*4], 0
	jl	$L769
	mov	eax, DWORD PTR _ureg$[ebp]
	mov	ecx, DWORD PTR _reg_qty$S563
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _qty_phys_sugg$S554
	movsx	eax, WORD PTR [ecx+eax*2]
	or	eax, eax
	jl	$L770
	mov	eax, DWORD PTR _ureg$[ebp]
	mov	ecx, DWORD PTR _reg_qty$S563
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _qty_n_calls_crossed$S561
	cmp	DWORD PTR [ecx+eax*4], 0
	je	$L769
	mov	eax, DWORD PTR _ureg$[ebp]
	mov	ecx, DWORD PTR _reg_qty$S563
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _qty_phys_sugg$S554
	movsx	eax, WORD PTR [ecx+eax*2]
	movsx	eax, BYTE PTR _call_used_regs[eax]
	or	eax, eax
	je	$L769
$L770:
; Line 804
	mov	eax, DWORD PTR _sreg$[ebp]
	mov	ecx, DWORD PTR _ureg$[ebp]
	mov	edx, DWORD PTR _reg_qty$S563
	mov	ecx, DWORD PTR [edx+ecx*4]
	mov	edx, DWORD PTR _qty_phys_sugg$S554
	mov	WORD PTR [edx+ecx*2], ax
; Line 805
$L769:
	sub	eax, eax
	jmp	$L733
; Line 811
$L766:
	mov	eax, DWORD PTR _sreg$[ebp]
	mov	ecx, DWORD PTR _reg_qty$S563
	cmp	DWORD PTR [ecx+eax*4], -2		; fffffffeH
	je	$L771
; Line 812
	sub	eax, eax
	jmp	$L733
; Line 819
$L771:
	mov	eax, DWORD PTR _ureg$[ebp]
	mov	ecx, DWORD PTR _reg_qty$S563
	cmp	DWORD PTR [ecx+eax*4], -1
	jne	$L772
; Line 820
	sub	eax, eax
	jmp	$L733
; Line 826
$L772:
; Line 829
	mov	eax, DWORD PTR _ureg$[ebp]
	push	eax
	push	1
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_find_regno_note
	add	esp, 12					; 0000000cH
	or	eax, eax
	je	$L774
	mov	eax, DWORD PTR _ureg$[ebp]
	mov	ecx, DWORD PTR _reg_qty$S563
	cmp	DWORD PTR [ecx+eax*4], 10		; 0000000aH
	jl	$L958
	mov	eax, DWORD PTR _ureg$[ebp]
	mov	ecx, DWORD PTR _reg_qty$S563
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _qty_min_class$S556
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	mov	eax, DWORD PTR _sreg$[ebp]
	push	eax
	call	_reg_meets_class_p
	add	esp, 8
	mov	DWORD PTR -32+[ebp], eax
	jmp	$L959
$L958:
	mov	eax, DWORD PTR _ureg$[ebp]
	push	eax
	call	_reg_preferred_class
	add	esp, 4
	push	eax
	mov	eax, DWORD PTR _sreg$[ebp]
	push	eax
	call	_reg_meets_class_p
	add	esp, 8
	mov	DWORD PTR -32+[ebp], eax
$L959:
	cmp	DWORD PTR -32+[ebp], 0
	je	$L774
; Line 838
	cmp	DWORD PTR _ureg$[ebp], 10		; 0000000aH
	jl	$L775
	cmp	DWORD PTR _sreg$[ebp], 10		; 0000000aH
	jl	$L775
	mov	eax, DWORD PTR _ureg$[ebp]
	mov	ecx, DWORD PTR _reg_qty$S563
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _qty_preferred_or_nothing$S562
	movsx	eax, BYTE PTR [eax+ecx]
	or	eax, eax
	jne	$L776
	mov	eax, DWORD PTR _sreg$[ebp]
	push	eax
	call	_reg_preferred_or_nothing
	add	esp, 4
	or	eax, eax
	je	$L775
$L776:
	mov	eax, DWORD PTR _ureg$[ebp]
	mov	ecx, DWORD PTR _reg_n_calls_crossed
	cmp	DWORD PTR [ecx+eax*4], 0
	jne	$L962
	mov	eax, DWORD PTR _sreg$[ebp]
	mov	ecx, DWORD PTR _reg_n_calls_crossed
	cmp	DWORD PTR [ecx+eax*4], 0
	je	$L960
$L962:
	mov	DWORD PTR -36+[ebp], 1
	jmp	$L961
$L960:
	mov	DWORD PTR -36+[ebp], 0
$L961:
	mov	eax, DWORD PTR -36+[ebp]
	push	eax
	mov	eax, DWORD PTR _sreg$[ebp]
	push	eax
	call	_reg_preferred_class
	add	esp, 4
	push	eax
	mov	eax, DWORD PTR _ureg$[ebp]
	push	eax
	call	_reg_preferred_class
	add	esp, 4
	push	eax
	call	_reg_classes_overlap_p
	add	esp, 12					; 0000000cH
	or	eax, eax
	jne	$L775
; Line 839
	sub	eax, eax
	jmp	$L733
; Line 840
$L775:
	mov	eax, DWORD PTR _ureg$[ebp]
	mov	ecx, DWORD PTR _reg_qty$S563
	cmp	DWORD PTR [ecx+eax*4], -2		; fffffffeH
	jne	$L777
; Line 841
	mov	eax, DWORD PTR _insn_number$[ebp]
	push	eax
	mov	eax, DWORD PTR _usedreg$[ebp]
	push	eax
	call	_reg_is_born
	add	esp, 8
; Line 842
$L777:
	mov	eax, DWORD PTR _ureg$[ebp]
	mov	ecx, DWORD PTR _reg_qty$S563
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _sreg$[ebp]
	mov	edx, DWORD PTR _reg_qty$S563
	mov	DWORD PTR [edx+ecx*4], eax
	mov	eax, DWORD PTR _sreg$[ebp]
	mov	ecx, DWORD PTR _reg_qty$S563
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _sqty$[ebp], eax
; Line 843
	cmp	DWORD PTR _sqty$[ebp], 10		; 0000000aH
	jge	$L778
	call	_abort
; Line 845
$L778:
	mov	eax, DWORD PTR _sreg$[ebp]
	push	eax
	mov	eax, DWORD PTR _sqty$[ebp]
	push	eax
	call	_update_qty_class
	add	esp, 8
; Line 846
	mov	eax, DWORD PTR _ureg$[ebp]
	mov	ecx, DWORD PTR _reg_offset$S564
	mov	eax, DWORD PTR [ecx+eax*4]
	add	eax, DWORD PTR _offset$[ebp]
	mov	ecx, DWORD PTR _sreg$[ebp]
	mov	edx, DWORD PTR _reg_offset$S564
	mov	DWORD PTR [edx+ecx*4], eax
; Line 847
	cmp	DWORD PTR _sqty$[ebp], 0
	jl	$L779
; Line 849
	mov	eax, DWORD PTR _sreg$[ebp]
	mov	ecx, DWORD PTR _reg_n_calls_crossed
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _sqty$[ebp]
	mov	edx, DWORD PTR _qty_n_calls_crossed$S561
	add	DWORD PTR [edx+ecx*4], eax
; Line 850
	mov	eax, DWORD PTR _sreg$[ebp]
	mov	ecx, DWORD PTR _reg_n_refs
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	ecx, DWORD PTR _sqty$[ebp]
	mov	edx, DWORD PTR _qty_n_refs$S555
	movsx	ecx, WORD PTR [edx+ecx*2]
	add	eax, ecx
	mov	ecx, DWORD PTR _sqty$[ebp]
	mov	edx, DWORD PTR _qty_n_refs$S555
	mov	WORD PTR [edx+ecx*2], ax
; Line 851
	mov	eax, DWORD PTR _sreg$[ebp]
	push	eax
	call	_reg_preferred_or_nothing
	add	esp, 4
	or	eax, eax
	jne	$L780
; Line 852
	mov	eax, DWORD PTR _sqty$[ebp]
	mov	ecx, DWORD PTR _qty_preferred_or_nothing$S562
	mov	BYTE PTR [eax+ecx], 0
; Line 853
$L780:
	mov	eax, DWORD PTR _usize$[ebp]
	cmp	DWORD PTR _ssize$[ebp], eax
	jle	$L781
; Line 856
	mov	DWORD PTR _i$782[ebp], 10		; 0000000aH
	jmp	$L783
$L784:
	inc	DWORD PTR _i$782[ebp]
$L783:
	mov	eax, DWORD PTR _i$782[ebp]
	cmp	DWORD PTR _max_regno, eax
	jle	$L785
; Line 857
	mov	eax, DWORD PTR _i$782[ebp]
	mov	ecx, DWORD PTR _reg_qty$S563
	mov	edx, DWORD PTR _sqty$[ebp]
	cmp	DWORD PTR [ecx+eax*4], edx
	jne	$L786
; Line 858
	sub	eax, eax
	sub	eax, DWORD PTR _offset$[ebp]
	neg	eax
	mov	ecx, DWORD PTR _i$782[ebp]
	mov	edx, DWORD PTR _reg_offset$S564
	sub	DWORD PTR [edx+ecx*4], eax
; Line 859
$L786:
	jmp	$L784
$L785:
	mov	eax, DWORD PTR _ssize$[ebp]
	mov	ecx, DWORD PTR _sqty$[ebp]
	mov	edx, DWORD PTR _qty_size$S559
	mov	DWORD PTR [edx+ecx*4], eax
; Line 860
	mov	eax, DWORD PTR _setreg$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	mov	ecx, DWORD PTR _sqty$[ebp]
	mov	edx, DWORD PTR _qty_mode$S560
	mov	DWORD PTR [edx+ecx*4], eax
; Line 862
$L781:
; Line 863
$L779:
; Line 864
	jmp	$L787
$L774:
; Line 865
	sub	eax, eax
	jmp	$L733
$L787:
; Line 867
	mov	eax, 1
	jmp	$L733
; Line 868
$L733:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_combine_regs ENDP
_reg$ = 8
_class$ = 12
_rclass$ = -4
_reg_meets_class_p PROC NEAR
; Line 878
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 879
	mov	eax, DWORD PTR _reg$[ebp]
	push	eax
	call	_reg_preferred_class
	add	esp, 4
	mov	DWORD PTR _rclass$[ebp], eax
; Line 881
	mov	eax, DWORD PTR _class$[ebp]
	push	eax
	mov	eax, DWORD PTR _rclass$[ebp]
	push	eax
	call	_reg_class_subset_p
	add	esp, 8
	or	eax, eax
	jne	$L965
	mov	eax, DWORD PTR _rclass$[ebp]
	push	eax
	mov	eax, DWORD PTR _class$[ebp]
	push	eax
	call	_reg_class_subset_p
	add	esp, 8
	or	eax, eax
	je	$L963
$L965:
	mov	eax, 1
	jmp	$L964
$L963:
	sub	eax, eax
$L964:
	jmp	$L790
; Line 882
$L790:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_reg_meets_class_p ENDP
_TEXT	ENDS
EXTRN	_reg_class_contents:BYTE
_TEXT	SEGMENT
_c1$ = 8
_c2$ = 12
_reg_class_subset_p PROC NEAR
; Line 891
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 892
	mov	eax, DWORD PTR _c1$[ebp]
	cmp	DWORD PTR _c2$[ebp], eax
	jne	$L795
	mov	eax, 1
	jmp	$L794
; Line 894
$L795:
	cmp	DWORD PTR _c2$[ebp], 12			; 0000000cH
	jne	$L796
; Line 895
$win$797:
; Line 896
	mov	eax, 1
	jmp	$L794
; Line 897
$L796:
	mov	eax, DWORD PTR _c2$[ebp]
	movsx	eax, WORD PTR _reg_class_contents[eax*2]
	not	eax
	mov	ecx, DWORD PTR _c1$[ebp]
	movsx	ecx, WORD PTR _reg_class_contents[ecx*2]
	test	eax, ecx
	jne	$L798
	jmp	$win$797
; Line 900
$L798:
	sub	eax, eax
	jmp	$L794
; Line 901
$L794:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_reg_class_subset_p ENDP
_c1$ = 8
_c2$ = 12
_call_saved$ = 16
_c$ = -4
_i$ = -8
_reg_classes_overlap_p PROC NEAR
; Line 911
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 915
	mov	eax, DWORD PTR _c1$[ebp]
	mov	ax, WORD PTR _reg_class_contents[eax*2]
	mov	WORD PTR _c$[ebp], ax
; Line 916
	mov	eax, DWORD PTR _c2$[ebp]
	movsx	eax, WORD PTR _reg_class_contents[eax*2]
	movsx	ecx, WORD PTR _c$[ebp]
	and	eax, ecx
	mov	WORD PTR _c$[ebp], ax
; Line 918
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L805
$L806:
	inc	DWORD PTR _i$[ebp]
$L805:
	cmp	DWORD PTR _i$[ebp], 10			; 0000000aH
	jge	$L807
; Line 920
	mov	eax, 1
	mov	cl, BYTE PTR _i$[ebp]
	shl	eax, cl
	movsx	ecx, WORD PTR _c$[ebp]
	test	eax, ecx
	je	$L808
	cmp	DWORD PTR _call_saved$[ebp], 0
	je	$L809
	mov	eax, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR _call_used_regs[eax]
	or	eax, eax
	jne	$L808
$L809:
; Line 921
	mov	eax, 1
	jmp	$L802
; Line 923
$L808:
	jmp	$L806
$L807:
	sub	eax, eax
	jmp	$L802
; Line 924
$L802:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_reg_classes_overlap_p ENDP
_qty$ = 8
_reg$ = 12
_rclass$ = -4
_update_qty_class PROC NEAR
; Line 932
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 933
	mov	eax, DWORD PTR _reg$[ebp]
	push	eax
	call	_reg_preferred_class
	add	esp, 4
	mov	DWORD PTR _rclass$[ebp], eax
; Line 934
	mov	eax, DWORD PTR _qty$[ebp]
	mov	ecx, DWORD PTR _qty_min_class$S556
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	mov	eax, DWORD PTR _rclass$[ebp]
	push	eax
	call	_reg_class_subset_p
	add	esp, 8
	or	eax, eax
	je	$L814
; Line 935
	mov	eax, DWORD PTR _rclass$[ebp]
	mov	ecx, DWORD PTR _qty$[ebp]
	mov	edx, DWORD PTR _qty_min_class$S556
	mov	DWORD PTR [edx+ecx*4], eax
; Line 936
$L814:
$L812:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_update_qty_class ENDP
_reg$ = 8
_setter$ = 12
_regno$ = -8
_clobber_flag$ = -4
_lim$823 = -12
_i$824 = -16
_reg_is_set PROC NEAR
; Line 948
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	push	ebx
	push	esi
	push	edi
; Line 950
	mov	eax, DWORD PTR _setter$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1769472				; 001b0000H
	and	ecx, -65536				; ffff0000H
	sub	eax, ecx
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	mov	DWORD PTR _clobber_flag$[ebp], eax
; Line 952
	cmp	DWORD PTR _reg$[ebp], 0
	je	$L821
	mov	eax, DWORD PTR _reg$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L820
$L821:
; Line 953
	jmp	$L817
; Line 955
$L820:
	mov	eax, DWORD PTR _reg$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _regno$[ebp], eax
; Line 957
	cmp	DWORD PTR _regno$[ebp], 10		; 0000000aH
	jge	$L822
; Line 965
	cmp	DWORD PTR _regno$[ebp], 8
	jl	$L966
	mov	DWORD PTR -20+[ebp], 1
	jmp	$L967
$L966:
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
$L967:
	mov	eax, DWORD PTR _regno$[ebp]
	add	eax, DWORD PTR -20+[ebp]
	mov	DWORD PTR _lim$823[ebp], eax
; Line 967
	mov	eax, DWORD PTR _regno$[ebp]
	mov	DWORD PTR _i$824[ebp], eax
	jmp	$L825
$L826:
	inc	DWORD PTR _i$824[ebp]
$L825:
	mov	eax, DWORD PTR _lim$823[ebp]
	cmp	DWORD PTR _i$824[ebp], eax
	jge	$L827
; Line 969
	mov	eax, DWORD PTR _this_insn_number$S568
	mov	ecx, DWORD PTR _regs_live_at$S566
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	edx, 1
	mov	cl, BYTE PTR _i$824[ebp]
	shl	edx, cl
	or	eax, edx
	mov	ecx, DWORD PTR _this_insn_number$S568
	mov	edx, DWORD PTR _regs_live_at$S566
	mov	WORD PTR [edx+ecx*2], ax
; Line 970
	cmp	DWORD PTR _clobber_flag$[ebp], 0
	je	$L828
; Line 971
	mov	eax, DWORD PTR _this_insn_number$S568
	mov	ecx, DWORD PTR _regs_live_at$S566
	movsx	eax, WORD PTR [ecx+eax*2-2]
	mov	edx, 1
	mov	cl, BYTE PTR _i$824[ebp]
	shl	edx, cl
	or	eax, edx
	mov	ecx, DWORD PTR _this_insn_number$S568
	mov	edx, DWORD PTR _regs_live_at$S566
	mov	WORD PTR [edx+ecx*2-2], ax
; Line 972
$L828:
	jmp	$L826
$L827:
; Line 978
	cmp	DWORD PTR _clobber_flag$[ebp], 0
	jne	$L829
	mov	eax, DWORD PTR _regno$[ebp]
	push	eax
	push	1
	mov	eax, DWORD PTR _this_insn$S569
	push	eax
	call	_find_regno_note
	add	esp, 12					; 0000000cH
	or	eax, eax
	jne	$L829
; Line 979
	mov	eax, DWORD PTR _this_insn_number$S568
	push	eax
	mov	eax, DWORD PTR _reg$[ebp]
	push	eax
	call	_reg_is_born
	add	esp, 8
; Line 980
$L829:
; Line 981
	jmp	$L830
$L822:
	cmp	DWORD PTR _clobber_flag$[ebp], 0
	jne	$L831
; Line 985
	mov	eax, DWORD PTR _this_insn_number$S568
	push	eax
	mov	eax, DWORD PTR _reg$[ebp]
	push	eax
	call	_reg_is_born
	add	esp, 8
; Line 990
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _reg_qty$S563
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _qty_death$S558
	mov	edx, DWORD PTR _this_insn_number$S568
	cmp	DWORD PTR [ecx+eax*4], edx
	jne	$L832
; Line 994
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _reg_qty$S563
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _qty_death$S558
	inc	DWORD PTR [ecx+eax*4]
; Line 996
$L832:
; Line 997
	jmp	$L833
$L831:
; Line 998
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _reg_qty$S563
	cmp	DWORD PTR [ecx+eax*4], 0
	jl	$L834
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _reg_qty$S563
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _qty_death$S558
	mov	edx, DWORD PTR _this_insn_number$S568
	cmp	DWORD PTR [ecx+eax*4], edx
	jne	$L834
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _reg_qty$S563
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _qty_birth$S557
	mov	edx, DWORD PTR _this_insn_number$S568
	cmp	DWORD PTR [ecx+eax*4], edx
	jne	$L834
; Line 1006
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _reg_qty$S563
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _qty_birth$S557
	dec	DWORD PTR [ecx+eax*4]
; Line 1008
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _reg_qty$S563
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _qty_death$S558
	inc	DWORD PTR [ecx+eax*4]
; Line 1010
$L834:
$L833:
$L830:
$L817:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_reg_is_set ENDP
_TEXT	ENDS
EXTRN	_regno_reg_rtx:DWORD
_TEXT	SEGMENT
_reg$ = 8
_insn_number$ = 12
_regno$ = -4
_reg_is_born PROC NEAR
; Line 1019
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 1020
	mov	eax, DWORD PTR _reg$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _regno$[ebp], eax
; Line 1022
	cmp	DWORD PTR _regno$[ebp], 10		; 0000000aH
	jge	$L839
; Line 1023
	push	1
	mov	eax, DWORD PTR _reg$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	mov	eax, DWORD PTR _regno$[ebp]
	push	eax
	call	_mark_life
	add	esp, 12					; 0000000cH
; Line 1024
	jmp	$L840
$L839:
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _reg_qty$S563
	cmp	DWORD PTR [ecx+eax*4], -2		; fffffffeH
	jne	$L841
; Line 1025
	mov	eax, DWORD PTR _insn_number$[ebp]
	push	eax
	mov	eax, DWORD PTR _regno$[ebp]
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
	push	eax
	mov	eax, DWORD PTR _reg$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	mov	eax, DWORD PTR _regno$[ebp]
	push	eax
	call	_alloc_qty
	add	esp, 16					; 00000010H
; Line 1026
$L841:
$L840:
$L837:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_reg_is_born ENDP
_TEXT	ENDS
EXTRN	_gen_rtx:NEAR
_TEXT	SEGMENT
_reg$ = 8
_this_insn_number$ = 12
_death_insn_number$ = 16
_regno$ = -4
_wipe_dead_reg PROC NEAR
; Line 1035
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 1036
	mov	eax, DWORD PTR _reg$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _regno$[ebp], eax
; Line 1038
	cmp	DWORD PTR _regno$[ebp], 10		; 0000000aH
	jge	$L847
; Line 1040
	push	0
	mov	eax, DWORD PTR _reg$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	mov	eax, DWORD PTR _regno$[ebp]
	push	eax
	call	_mark_life
	add	esp, 12					; 0000000cH
; Line 1041
	mov	eax, DWORD PTR _this_insn_number$[ebp]
	cmp	DWORD PTR _death_insn_number$[ebp], eax
	je	$L848
; Line 1042
	call	_abort
; Line 1047
$L848:
; Line 1048
	jmp	$L849
$L847:
; Line 1054
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _reg_qty$S563
	cmp	DWORD PTR [ecx+eax*4], -2		; fffffffeH
	jne	$L850
; Line 1056
	mov	eax, DWORD PTR _this_insn_number$[ebp]
	push	eax
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
	push	eax
	mov	eax, DWORD PTR _reg$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	mov	eax, DWORD PTR _regno$[ebp]
	push	eax
	call	_alloc_qty
	add	esp, 16					; 00000010H
; Line 1058
	mov	eax, DWORD PTR _this_insn$S569
	mov	eax, DWORD PTR [eax+28]
	push	eax
	mov	eax, DWORD PTR _reg$[ebp]
	push	eax
	push	9
	push	2
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	ecx, DWORD PTR _this_insn$S569
	mov	DWORD PTR [ecx+28], eax
; Line 1061
$L850:
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _reg_qty$S563
	cmp	DWORD PTR [ecx+eax*4], 0
	jl	$L851
; Line 1062
	mov	eax, DWORD PTR _death_insn_number$[ebp]
	mov	ecx, DWORD PTR _regno$[ebp]
	mov	edx, DWORD PTR _reg_qty$S563
	mov	ecx, DWORD PTR [edx+ecx*4]
	mov	edx, DWORD PTR _qty_death$S558
	mov	DWORD PTR [edx+ecx*4], eax
; Line 1063
$L851:
$L849:
; Line 1064
$L845:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_wipe_dead_reg ENDP
_TEXT	ENDS
EXTRN	_caller_save_needed:DWORD
EXTRN	_fixed_reg_set:WORD
EXTRN	_call_used_reg_set:WORD
EXTRN	_call_fixed_reg_set:WORD
EXTRN	_flag_caller_saves:DWORD
EXTRN	_hard_regno_mode_ok:NEAR
_TEXT	SEGMENT
_class$ = 8
_mode$ = 12
_qty$ = 16
_accept_call_clobbered$ = 20
_born_insn$ = 24
_dead_insn$ = 28
_i$ = -8
_ins$ = -12
_used$ = -4
_j$872 = -16
_size1$873 = -20
_regno$881 = -24
_j$883 = -28
_size1$884 = -32
_find_free_reg PROC NEAR
; Line 1082
	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H
	push	ebx
	push	esi
	push	edi
; Line 1089
	cmp	DWORD PTR _accept_call_clobbered$[ebp], 0
	je	$L862
; Line 1090
	mov	ax, WORD PTR _call_fixed_reg_set
	mov	WORD PTR _used$[ebp], ax
; Line 1091
	jmp	$L863
$L862:
	mov	eax, DWORD PTR _qty$[ebp]
	mov	ecx, DWORD PTR _qty_n_calls_crossed$S561
	cmp	DWORD PTR [ecx+eax*4], 0
	jne	$L864
; Line 1092
	mov	ax, WORD PTR _fixed_reg_set
	mov	WORD PTR _used$[ebp], ax
; Line 1093
	jmp	$L865
$L864:
; Line 1094
	mov	ax, WORD PTR _call_used_reg_set
	mov	WORD PTR _used$[ebp], ax
$L865:
$L863:
; Line 1096
	mov	eax, DWORD PTR _born_insn$[ebp]
	mov	DWORD PTR _ins$[ebp], eax
	jmp	$L866
$L867:
	inc	DWORD PTR _ins$[ebp]
$L866:
	mov	eax, DWORD PTR _dead_insn$[ebp]
	cmp	DWORD PTR _ins$[ebp], eax
	jge	$L868
; Line 1097
	mov	eax, DWORD PTR _ins$[ebp]
	mov	ecx, DWORD PTR _regs_live_at$S566
	movsx	eax, WORD PTR [ecx+eax*2]
	movsx	ecx, WORD PTR _used$[ebp]
	or	eax, ecx
	mov	WORD PTR _used$[ebp], ax
	jmp	$L867
$L868:
; Line 1099
	mov	eax, DWORD PTR _class$[ebp]
	movsx	eax, WORD PTR _reg_class_contents[eax*2]
	not	eax
	movsx	ecx, WORD PTR _used$[ebp]
	or	eax, ecx
	mov	WORD PTR _used$[ebp], ax
; Line 1104
	movsx	eax, WORD PTR _used$[ebp]
	or	eax, 64					; 00000040H
	mov	WORD PTR _used$[ebp], ax
; Line 1109
	mov	eax, DWORD PTR _qty$[ebp]
	mov	ecx, DWORD PTR _qty_phys_sugg$S554
	movsx	eax, WORD PTR [ecx+eax*2]
	or	eax, eax
	jl	$L869
; Line 1111
	mov	eax, DWORD PTR _qty$[ebp]
	mov	ecx, DWORD PTR _qty_phys_sugg$S554
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	DWORD PTR _i$[ebp], eax
; Line 1113
	mov	eax, 1
	mov	cl, BYTE PTR _i$[ebp]
	shl	eax, cl
	movsx	ecx, WORD PTR _used$[ebp]
	test	eax, ecx
	jne	$L871
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	call	_hard_regno_mode_ok
	add	esp, 8
	or	eax, eax
	je	$L871
; Line 1116
	cmp	DWORD PTR _i$[ebp], 8
	jl	$L968
	mov	DWORD PTR _size1$873[ebp], 1
	jmp	$L969
$L968:
	mov	eax, DWORD PTR _mode$[ebp]
	mov	eax, DWORD PTR _mode_size[eax*4]
	add	eax, 3
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	mov	DWORD PTR _size1$873[ebp], eax
$L969:
; Line 1117
	mov	DWORD PTR _j$872[ebp], 1
	jmp	$L874
$L875:
	inc	DWORD PTR _j$872[ebp]
$L874:
	mov	eax, DWORD PTR _j$872[ebp]
	cmp	DWORD PTR _size1$873[ebp], eax
	jle	$L876
	mov	eax, 1
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, DWORD PTR _j$872[ebp]
	shl	eax, cl
	movsx	ecx, WORD PTR _used$[ebp]
	test	eax, ecx
	jne	$L876
	jmp	$L875
$L876:
; Line 1118
	mov	eax, DWORD PTR _j$872[ebp]
	cmp	DWORD PTR _size1$873[ebp], eax
	jne	$L877
; Line 1120
	mov	eax, DWORD PTR _dead_insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _born_insn$[ebp]
	push	eax
	push	1
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	call	_post_mark_life
	add	esp, 20					; 00000014H
; Line 1121
	mov	eax, DWORD PTR _i$[ebp]
	jmp	$L858
; Line 1123
$L877:
; Line 1124
$L871:
; Line 1128
$L869:
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L878
$L879:
	inc	DWORD PTR _i$[ebp]
$L878:
	cmp	DWORD PTR _i$[ebp], 10			; 0000000aH
	jge	$L880
; Line 1133
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _regno$881[ebp], eax
; Line 1136
	movsx	eax, WORD PTR _used$[ebp]
	mov	edx, 1
	mov	cl, BYTE PTR _regno$881[ebp]
	shl	edx, cl
	test	eax, edx
	jne	$L882
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	mov	eax, DWORD PTR _regno$881[ebp]
	push	eax
	call	_hard_regno_mode_ok
	add	esp, 8
	or	eax, eax
	je	$L882
; Line 1139
	cmp	DWORD PTR _regno$881[ebp], 8
	jl	$L970
	mov	DWORD PTR _size1$884[ebp], 1
	jmp	$L971
$L970:
	mov	eax, DWORD PTR _mode$[ebp]
	mov	eax, DWORD PTR _mode_size[eax*4]
	add	eax, 3
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	mov	DWORD PTR _size1$884[ebp], eax
$L971:
; Line 1140
	mov	DWORD PTR _j$883[ebp], 1
	jmp	$L885
$L886:
	inc	DWORD PTR _j$883[ebp]
$L885:
	mov	eax, DWORD PTR _size1$884[ebp]
	cmp	DWORD PTR _j$883[ebp], eax
	jge	$L887
	mov	eax, 1
	mov	ecx, DWORD PTR _j$883[ebp]
	add	ecx, DWORD PTR _regno$881[ebp]
	shl	eax, cl
	movsx	ecx, WORD PTR _used$[ebp]
	test	eax, ecx
	jne	$L887
	jmp	$L886
$L887:
; Line 1141
	mov	eax, DWORD PTR _size1$884[ebp]
	cmp	DWORD PTR _j$883[ebp], eax
	jne	$L888
; Line 1143
	mov	eax, DWORD PTR _dead_insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _born_insn$[ebp]
	push	eax
	push	1
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	mov	eax, DWORD PTR _regno$881[ebp]
	push	eax
	call	_post_mark_life
	add	esp, 20					; 00000014H
; Line 1144
	mov	eax, DWORD PTR _regno$881[ebp]
	jmp	$L858
; Line 1147
$L888:
	mov	eax, DWORD PTR _j$883[ebp]
	add	DWORD PTR _i$[ebp], eax
; Line 1150
$L882:
	jmp	$L879
$L880:
; Line 1158
	cmp	DWORD PTR _accept_call_clobbered$[ebp], 0
	jne	$L889
	cmp	DWORD PTR _flag_caller_saves, 0
	je	$L889
	mov	eax, DWORD PTR _qty$[ebp]
	mov	ecx, DWORD PTR _qty_n_calls_crossed$S561
	cmp	DWORD PTR [ecx+eax*4], 0
	je	$L889
	mov	eax, DWORD PTR _qty$[ebp]
	mov	ecx, DWORD PTR _qty_n_calls_crossed$S561
	mov	eax, DWORD PTR [ecx+eax*4]
	shl	eax, 2
	mov	ecx, DWORD PTR _qty$[ebp]
	mov	edx, DWORD PTR _qty_n_refs$S555
	movsx	ecx, WORD PTR [edx+ecx*2]
	cmp	eax, ecx
	jge	$L889
; Line 1160
	mov	eax, DWORD PTR _dead_insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _born_insn$[ebp]
	push	eax
	push	1
	mov	eax, DWORD PTR _qty$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	mov	eax, DWORD PTR _class$[ebp]
	push	eax
	call	_find_free_reg
	add	esp, 24					; 00000018H
	mov	DWORD PTR _i$[ebp], eax
; Line 1161
	cmp	DWORD PTR _i$[ebp], 0
	jl	$L890
; Line 1162
	mov	DWORD PTR _caller_save_needed, 1
; Line 1163
$L890:
	mov	eax, DWORD PTR _i$[ebp]
	jmp	$L858
; Line 1165
$L889:
	mov	eax, -1
	jmp	$L858
; Line 1166
$L858:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_find_free_reg ENDP
_regno$ = 8
_mode$ = 12
_life$ = 16
_j$ = -4
_mark_life PROC NEAR
; Line 1173
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 1174
	cmp	DWORD PTR _regno$[ebp], 8
	jl	$L972
	mov	DWORD PTR _j$[ebp], 1
	jmp	$L973
$L972:
	mov	eax, DWORD PTR _mode$[ebp]
	mov	eax, DWORD PTR _mode_size[eax*4]
	add	eax, 3
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	mov	DWORD PTR _j$[ebp], eax
$L973:
; Line 1175
	cmp	DWORD PTR _life$[ebp], 0
	je	$L896
; Line 1176
$L898:
	dec	DWORD PTR _j$[ebp]
	js	$L899
; Line 1177
	mov	eax, 1
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, DWORD PTR _regno$[ebp]
	shl	eax, cl
	movsx	ecx, WORD PTR _regs_live$S565
	or	eax, ecx
	mov	WORD PTR _regs_live$S565, ax
	jmp	$L898
$L899:
; Line 1178
	jmp	$L900
$L896:
; Line 1179
$L902:
	dec	DWORD PTR _j$[ebp]
	js	$L903
; Line 1180
	mov	eax, 1
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, DWORD PTR _regno$[ebp]
	shl	eax, cl
	not	eax
	movsx	ecx, WORD PTR _regs_live$S565
	and	eax, ecx
	mov	WORD PTR _regs_live$S565, ax
	jmp	$L902
$L903:
$L900:
; Line 1181
$L894:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_mark_life ENDP
_regno$ = 8
_mode$ = 12
_life$ = 16
_birth$ = 20
_death$ = 24
_j$ = -4
_this_reg$ = -8
_post_mark_life PROC NEAR
; Line 1188
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 1189
	cmp	DWORD PTR _regno$[ebp], 8
	jl	$L974
	mov	DWORD PTR _j$[ebp], 1
	jmp	$L975
$L974:
	mov	eax, DWORD PTR _mode$[ebp]
	mov	eax, DWORD PTR _mode_size[eax*4]
	add	eax, 3
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	mov	DWORD PTR _j$[ebp], eax
$L975:
; Line 1195
	mov	WORD PTR _this_reg$[ebp], 0
; Line 1196
$L913:
	dec	DWORD PTR _j$[ebp]
	js	$L914
; Line 1197
	mov	eax, 1
	mov	ecx, DWORD PTR _regno$[ebp]
	add	ecx, DWORD PTR _j$[ebp]
	shl	eax, cl
	movsx	ecx, WORD PTR _this_reg$[ebp]
	or	eax, ecx
	mov	WORD PTR _this_reg$[ebp], ax
	jmp	$L913
$L914:
; Line 1202
	mov	eax, DWORD PTR _birth$[ebp]
	cmp	DWORD PTR _death$[ebp], eax
	jne	$L915
; Line 1203
	inc	DWORD PTR _death$[ebp]
; Line 1205
$L915:
	cmp	DWORD PTR _life$[ebp], 0
	je	$L916
; Line 1206
$L918:
	mov	eax, DWORD PTR _birth$[ebp]
	cmp	DWORD PTR _death$[ebp], eax
	jle	$L919
; Line 1208
	mov	eax, DWORD PTR _birth$[ebp]
	mov	ecx, DWORD PTR _regs_live_at$S566
	movsx	eax, WORD PTR [ecx+eax*2]
	movsx	ecx, WORD PTR _this_reg$[ebp]
	or	eax, ecx
	mov	ecx, DWORD PTR _birth$[ebp]
	mov	edx, DWORD PTR _regs_live_at$S566
	mov	WORD PTR [edx+ecx*2], ax
; Line 1209
	inc	DWORD PTR _birth$[ebp]
; Line 1210
	jmp	$L918
$L919:
; Line 1211
	jmp	$L920
$L916:
; Line 1212
$L922:
	mov	eax, DWORD PTR _birth$[ebp]
	cmp	DWORD PTR _death$[ebp], eax
	jle	$L923
; Line 1214
	mov	eax, DWORD PTR _birth$[ebp]
	mov	ecx, DWORD PTR _regs_live_at$S566
	movsx	eax, WORD PTR [ecx+eax*2]
	movsx	ecx, WORD PTR _this_reg$[ebp]
	not	ecx
	and	eax, ecx
	mov	ecx, DWORD PTR _birth$[ebp]
	mov	edx, DWORD PTR _regs_live_at$S566
	mov	WORD PTR [edx+ecx*2], ax
; Line 1215
	inc	DWORD PTR _birth$[ebp]
; Line 1216
	jmp	$L922
$L923:
$L920:
; Line 1217
$L909:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_post_mark_life ENDP
_TEXT	ENDS
PUBLIC	_dump_local_alloc
EXTRN	_fprintf:NEAR
_DATA	SEGMENT
$SG932	DB	';; Register %d in %d.', 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_file$ = 8
_i$ = -4
_dump_local_alloc PROC NEAR
; Line 1222
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 1224
	mov	DWORD PTR _i$[ebp], 10			; 0000000aH
	jmp	$L928
$L929:
	inc	DWORD PTR _i$[ebp]
$L928:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _max_regno, eax
	jle	$L930
; Line 1225
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	cmp	eax, -1
	je	$L931
; Line 1226
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	push	OFFSET $SG932
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
; Line 1227
$L931:
	jmp	$L929
$L930:
$L926:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_dump_local_alloc ENDP
_TEXT	ENDS
END
