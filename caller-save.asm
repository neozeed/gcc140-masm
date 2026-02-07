	TITLE	caller-save.c
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
_BSS	SEGMENT PARA USE32 PUBLIC 'BSS'
_BSS	ENDS
_TLS	SEGMENT DWORD USE32 PUBLIC 'TLS'
_TLS	ENDS
FLAT	GROUP _DATA, CONST, _BSS
	ASSUME	CS: FLAT, DS: FLAT, SS: FLAT
endif
PUBLIC	_save_call_clobbered_regs
EXTRN	_note_stores:NEAR
EXTRN	_max_regno:DWORD
EXTRN	_reg_renumber:DWORD
EXTRN	_regset_size:DWORD
EXTRN	_n_basic_blocks:DWORD
EXTRN	_basic_block_head:DWORD
EXTRN	_basic_block_end:DWORD
EXTRN	_basic_block_live_at_start:DWORD
EXTRN	_obey_regdecls:DWORD
EXTRN	_memset:NEAR
_BSS	SEGMENT
_hard_regs_live$S469 DW 01H DUP (?)
	ALIGN	4

_save_block_addr$S470 DD 01H DUP (?)
_save_block_size$S471 DD 01H DUP (?)
_save_reg_rtx$S472 DD 0aH DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
; File caller-save.c
_insn$ = -8
_b$ = -4
_regs_live$489 = -20
_offset$490 = -16
_bit$491 = -12
_i$492 = -24
_code$505 = -28
_link$509 = -32
_save_call_clobbered_regs PROC NEAR
; Line 54
	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H
	push	ebx
	push	esi
	push	edi
; Line 58
	cmp	DWORD PTR _obey_regdecls, 0
	je	$L484
; Line 59
	jmp	$L481
; Line 61
$L484:
	mov	DWORD PTR _save_block_size$S471, 0
; Line 62
	mov	DWORD PTR _save_block_addr$S470, 0
; Line 63
	push	40					; 00000028H
	push	0
	push	OFFSET _save_reg_rtx$S472
	call	_memset
	add	esp, 12					; 0000000cH
; Line 65
	mov	DWORD PTR _b$[ebp], 0
	jmp	$L486
$L487:
	inc	DWORD PTR _b$[ebp]
$L486:
	mov	eax, DWORD PTR _n_basic_blocks
	cmp	DWORD PTR _b$[ebp], eax
	jge	$L488
; Line 67
	mov	eax, DWORD PTR _b$[ebp]
	mov	ecx, DWORD PTR _basic_block_live_at_start
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _regs_live$489[ebp], eax
; Line 75
	mov	eax, DWORD PTR _regs_live$489[ebp]
	mov	eax, DWORD PTR [eax]
	mov	WORD PTR _hard_regs_live$S469, ax
; Line 80
	mov	DWORD PTR _offset$490[ebp], 0
	mov	DWORD PTR _i$492[ebp], 0
	jmp	$L493
$L494:
	inc	DWORD PTR _offset$490[ebp]
$L493:
	mov	eax, DWORD PTR _regset_size
	cmp	DWORD PTR _offset$490[ebp], eax
	jge	$L495
; Line 82
	mov	eax, DWORD PTR _offset$490[ebp]
	mov	ecx, DWORD PTR _regs_live$489[ebp]
	cmp	DWORD PTR [ecx+eax*4], 0
	jne	$L496
; Line 83
	add	DWORD PTR _i$492[ebp], 32		; 00000020H
; Line 84
	jmp	$L497
$L496:
; Line 85
	mov	DWORD PTR _bit$491[ebp], 1
	jmp	$L498
$L499:
	shl	DWORD PTR _bit$491[ebp], 1
	inc	DWORD PTR _i$492[ebp]
$L498:
	cmp	DWORD PTR _bit$491[ebp], 0
	je	$L500
	mov	eax, DWORD PTR _max_regno
	cmp	DWORD PTR _i$492[ebp], eax
	jge	$L500
; Line 86
	mov	eax, DWORD PTR _offset$490[ebp]
	mov	ecx, DWORD PTR _regs_live$489[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	test	eax, DWORD PTR _bit$491[ebp]
	je	$L501
	mov	eax, DWORD PTR _i$492[ebp]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	or	eax, eax
	jl	$L501
; Line 87
	mov	eax, 1
	mov	ecx, DWORD PTR _i$492[ebp]
	mov	edx, DWORD PTR _reg_renumber
	mov	cl, BYTE PTR [edx+ecx*2]
	shl	eax, cl
	movsx	ecx, WORD PTR _hard_regs_live$S469
	or	eax, ecx
	mov	WORD PTR _hard_regs_live$S469, ax
; Line 88
$L501:
	jmp	$L499
$L500:
$L497:
	jmp	$L494
$L495:
; Line 94
	mov	eax, DWORD PTR _b$[ebp]
	mov	ecx, DWORD PTR _basic_block_head
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _insn$[ebp], eax
	jmp	$L502
$L503:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _insn$[ebp], eax
$L502:
; Line 96
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$505[ebp], eax
; Line 98
	cmp	DWORD PTR _code$505[ebp], 15		; 0000000fH
	jne	$L506
; Line 99
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_insert_call_saves
	add	esp, 4
; Line 101
$L506:
	cmp	DWORD PTR _code$505[ebp], 13		; 0000000dH
	je	$L508
	cmp	DWORD PTR _code$505[ebp], 15		; 0000000fH
	je	$L508
	cmp	DWORD PTR _code$505[ebp], 14		; 0000000eH
	jne	$L507
$L508:
; Line 112
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR _link$509[ebp], eax
	jmp	$L510
$L511:
	mov	eax, DWORD PTR _link$509[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _link$509[ebp], eax
$L510:
	cmp	DWORD PTR _link$509[ebp], 0
	je	$L512
; Line 113
	mov	eax, DWORD PTR _link$509[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 16777216				; 01000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L513
; Line 114
	mov	eax, DWORD PTR _link$509[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_clear_reg_live
	add	esp, 4
; Line 116
$L513:
	jmp	$L511
$L512:
	push	OFFSET _set_reg_live
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_note_stores
	add	esp, 8
; Line 119
$L507:
	mov	eax, DWORD PTR _b$[ebp]
	mov	ecx, DWORD PTR _basic_block_end
	mov	edx, DWORD PTR _insn$[ebp]
	cmp	DWORD PTR [ecx+eax*4], edx
	jne	$L515
; Line 120
	jmp	$L504
; Line 121
$L515:
	jmp	$L503
$L504:
; Line 122
	jmp	$L487
$L488:
; Line 123
$L481:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_save_call_clobbered_regs ENDP
_TEXT	ENDS
EXTRN	_mode_size:BYTE
EXTRN	_call_fixed_regs:TBYTE
_TEXT	SEGMENT
_reg$ = 8
_regno$ = -4
_word$ = -8
_last$525 = -12
_set_reg_live PROC NEAR
; Line 131
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 138
	mov	DWORD PTR _word$[ebp], 0
; Line 140
	mov	eax, DWORD PTR _reg$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L521
; Line 142
	mov	eax, DWORD PTR _reg$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _word$[ebp], eax
; Line 143
	mov	eax, DWORD PTR _reg$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _reg$[ebp], eax
; Line 146
$L521:
	mov	eax, DWORD PTR _reg$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L522
; Line 147
	jmp	$L518
; Line 149
$L522:
	mov	eax, DWORD PTR _reg$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _regno$[ebp], eax
; Line 152
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	or	eax, eax
	jl	$L523
; Line 153
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	DWORD PTR _regno$[ebp], eax
; Line 156
$L523:
	cmp	DWORD PTR _regno$[ebp], 10		; 0000000aH
	jge	$L524
	mov	eax, DWORD PTR _regno$[ebp]
	movsx	eax, BYTE PTR _call_fixed_regs[eax]
	or	eax, eax
	jne	$L524
; Line 158
	cmp	DWORD PTR _regno$[ebp], 8
	jl	$L672
	mov	DWORD PTR -16+[ebp], 1
	jmp	$L673
$L672:
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
$L673:
	mov	eax, DWORD PTR _regno$[ebp]
	add	eax, DWORD PTR -16+[ebp]
	mov	DWORD PTR _last$525[ebp], eax
; Line 159
$L527:
	mov	eax, DWORD PTR _regno$[ebp]
	cmp	DWORD PTR _last$525[ebp], eax
	jle	$L528
; Line 161
	mov	eax, 1
	mov	cl, BYTE PTR _regno$[ebp]
	shl	eax, cl
	movsx	ecx, WORD PTR _hard_regs_live$S469
	or	eax, ecx
	mov	WORD PTR _hard_regs_live$S469, ax
; Line 162
	inc	DWORD PTR _regno$[ebp]
; Line 163
	jmp	$L527
$L528:
; Line 165
$L524:
$L518:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_set_reg_live ENDP
_reg$ = 8
_regno$ = -4
_last$534 = -8
_clear_reg_live PROC NEAR
; Line 173
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 174
	mov	eax, DWORD PTR _reg$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _regno$[ebp], eax
; Line 177
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	or	eax, eax
	jl	$L532
; Line 178
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	DWORD PTR _regno$[ebp], eax
; Line 181
$L532:
	cmp	DWORD PTR _regno$[ebp], 10		; 0000000aH
	jge	$L533
	mov	eax, DWORD PTR _regno$[ebp]
	movsx	eax, BYTE PTR _call_fixed_regs[eax]
	or	eax, eax
	jne	$L533
; Line 185
	cmp	DWORD PTR _regno$[ebp], 8
	jl	$L674
	mov	DWORD PTR -12+[ebp], 1
	jmp	$L675
$L674:
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
$L675:
	mov	eax, DWORD PTR -12+[ebp]
	add	eax, DWORD PTR _regno$[ebp]
	mov	DWORD PTR _last$534[ebp], eax
; Line 186
$L536:
	mov	eax, DWORD PTR _regno$[ebp]
	cmp	DWORD PTR _last$534[ebp], eax
	jle	$L537
; Line 188
	mov	eax, 1
	mov	cl, BYTE PTR _regno$[ebp]
	shl	eax, cl
	not	eax
	movsx	ecx, WORD PTR _hard_regs_live$S469
	and	eax, ecx
	mov	WORD PTR _hard_regs_live$S469, ax
; Line 189
	inc	DWORD PTR _regno$[ebp]
; Line 190
	jmp	$L536
$L537:
; Line 192
$L533:
$L530:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_clear_reg_live ENDP
_TEXT	ENDS
EXTRN	_mode_unit_size:BYTE
EXTRN	_call_used_regs:TBYTE
EXTRN	_gen_rtx:NEAR
_TEXT	SEGMENT
_insn$ = 8
_regno$ = -8
_save_block_size_needed$ = -4
_save_block_offset$ = -48
_mode$547 = -52
_align$548 = -56
_insert_call_saves PROC NEAR
; Line 200
	push	ebp
	mov	ebp, esp
	sub	esp, 56					; 00000038H
	push	ebx
	push	esi
	push	edi
; Line 205
	mov	DWORD PTR _save_block_size_needed$[ebp], 0
; Line 207
	mov	DWORD PTR _regno$[ebp], 0
	jmp	$L543
$L544:
	inc	DWORD PTR _regno$[ebp]
$L543:
	cmp	DWORD PTR _regno$[ebp], 10		; 0000000aH
	jge	$L545
; Line 209
	mov	eax, DWORD PTR _regno$[ebp]
	mov	DWORD PTR _save_block_offset$[ebp+eax*4], -1
; Line 211
	mov	eax, DWORD PTR _regno$[ebp]
	movsx	eax, BYTE PTR _call_used_regs[eax]
	or	eax, eax
	je	$L546
	mov	eax, DWORD PTR _regno$[ebp]
	movsx	eax, BYTE PTR _call_fixed_regs[eax]
	or	eax, eax
	jne	$L546
	movsx	eax, WORD PTR _hard_regs_live$S469
	mov	edx, 1
	mov	cl, BYTE PTR _regno$[ebp]
	shl	edx, cl
	test	eax, edx
	je	$L546
; Line 213
	mov	eax, DWORD PTR _regno$[ebp]
	push	eax
	call	_choose_hard_reg_mode
	add	esp, 4
	mov	DWORD PTR _mode$547[ebp], eax
; Line 214
	mov	eax, DWORD PTR _mode$547[ebp]
	mov	eax, DWORD PTR _mode_unit_size[eax*4]
	mov	DWORD PTR _align$548[ebp], eax
; Line 215
	cmp	DWORD PTR _align$548[ebp], 4
	jle	$L549
; Line 216
	mov	DWORD PTR _align$548[ebp], 4
; Line 217
$L549:
; Line 218
	mov	eax, DWORD PTR _save_block_size_needed$[ebp]
	mov	ecx, DWORD PTR _align$548[ebp]
	lea	eax, DWORD PTR [eax+ecx-1]
	cdq
	idiv	DWORD PTR _align$548[ebp]
	imul	eax, DWORD PTR _align$548[ebp]
	mov	DWORD PTR _save_block_size_needed$[ebp], eax
; Line 219
	mov	eax, DWORD PTR _save_block_size_needed$[ebp]
	mov	ecx, DWORD PTR _regno$[ebp]
	mov	DWORD PTR _save_block_offset$[ebp+ecx*4], eax
; Line 220
	mov	eax, DWORD PTR _mode$547[ebp]
	mov	eax, DWORD PTR _mode_size[eax*4]
	add	DWORD PTR _save_block_size_needed$[ebp], eax
; Line 221
	mov	eax, DWORD PTR _regno$[ebp]
	cmp	DWORD PTR _save_reg_rtx$S472[eax*4], 0
	jne	$L550
; Line 222
	mov	eax, DWORD PTR _regno$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$547[ebp]
	push	eax
	push	34					; 00000022H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _regno$[ebp]
	mov	DWORD PTR _save_reg_rtx$S472[ecx*4], eax
; Line 223
$L550:
; Line 224
$L546:
	jmp	$L544
$L545:
; Line 226
	mov	eax, DWORD PTR _save_block_size$S471
	cmp	DWORD PTR _save_block_size_needed$[ebp], eax
	jle	$L551
; Line 228
	mov	eax, DWORD PTR _save_block_size_needed$[ebp]
	push	eax
	mov	eax, DWORD PTR _save_block_addr$S470
	push	eax
	call	_grow_save_block
	add	esp, 8
	mov	DWORD PTR _save_block_addr$S470, eax
; Line 229
$L551:
	lea	eax, DWORD PTR _save_block_offset$[ebp]
	push	eax
	mov	eax, DWORD PTR _save_block_addr$S470
	push	eax
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_emit_mult_save
	add	esp, 12					; 0000000cH
; Line 230
	lea	eax, DWORD PTR _save_block_offset$[ebp]
	push	eax
	mov	eax, DWORD PTR _save_block_addr$S470
	push	eax
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_emit_mult_restore
	add	esp, 12					; 0000000cH
; Line 231
$L539:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_insert_call_saves ENDP
_TEXT	ENDS
EXTRN	_plus_constant:NEAR
EXTRN	_gen_add2_insn:NEAR
EXTRN	_gen_move_insn:NEAR
EXTRN	_stack_pointer_rtx:DWORD
EXTRN	_fixed_regs:TBYTE
EXTRN	_abort:NEAR
EXTRN	_emit_insn_before:NEAR
EXTRN	_memory_address_p:NEAR
EXTRN	_hard_regno_mode_ok:NEAR
EXTRN	_strict_memory_address_p:NEAR
_TEXT	SEGMENT
_reg$594 = -48
_addr1$595 = -44
_temp$596 = -52
_insn$ = 8
_addr$ = 12
_offset$ = 16
_regno$ = -4
_tempreg$ = -32
_can_push_reg$ = -24
_needpush$ = -28
_decrement$ = -20
_already_saved$ = -16
_reg$567 = -40
_addr1$568 = -36
_emit_mult_save PROC NEAR
; Line 244
	push	ebp
	mov	ebp, esp
	sub	esp, 52					; 00000034H
	push	ebx
	push	esi
	push	edi
; Line 257
	push	10					; 0000000aH
	push	0
	lea	eax, DWORD PTR _already_saved$[ebp]
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 275
$retry$562:
; Line 276
	mov	DWORD PTR _needpush$[ebp], 0
; Line 277
	mov	DWORD PTR _tempreg$[ebp], 0
; Line 278
	mov	DWORD PTR _can_push_reg$[ebp], 0
; Line 283
	mov	DWORD PTR _regno$[ebp], 0
	jmp	$L563
$L564:
	inc	DWORD PTR _regno$[ebp]
$L563:
	cmp	DWORD PTR _regno$[ebp], 10		; 0000000aH
	jge	$L565
; Line 285
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _offset$[ebp]
	cmp	DWORD PTR [ecx+eax*4], 0
	jl	$L566
	mov	eax, DWORD PTR _regno$[ebp]
	movsx	eax, BYTE PTR _already_saved$[ebp+eax]
	or	eax, eax
	jne	$L566
; Line 287
	mov	eax, DWORD PTR _regno$[ebp]
	mov	eax, DWORD PTR _save_reg_rtx$S472[eax*4]
	mov	DWORD PTR _reg$567[ebp], eax
; Line 288
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _offset$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	mov	eax, DWORD PTR _addr$[ebp]
	push	eax
	call	_plus_constant
	add	esp, 8
	mov	DWORD PTR _addr1$568[ebp], eax
; Line 289
	mov	eax, DWORD PTR _addr1$568[ebp]
	push	eax
	mov	eax, DWORD PTR _reg$567[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	call	_memory_address_p
	add	esp, 8
	or	eax, eax
	je	$L570
; Line 290
	mov	DWORD PTR _needpush$[ebp], 1
; Line 291
$L570:
; Line 295
$L566:
; Line 297
	cmp	DWORD PTR _tempreg$[ebp], 0
	jne	$L572
	mov	eax, DWORD PTR _regno$[ebp]
	movsx	eax, BYTE PTR _call_used_regs[eax]
	or	eax, eax
	je	$L572
	mov	eax, DWORD PTR _regno$[ebp]
	movsx	eax, BYTE PTR _fixed_regs[eax]
	or	eax, eax
	jne	$L572
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _offset$[ebp]
	cmp	DWORD PTR [ecx+eax*4], 0
	jl	$L573
	mov	eax, DWORD PTR _regno$[ebp]
	movsx	eax, BYTE PTR _already_saved$[ebp+eax]
	or	eax, eax
	je	$L572
$L573:
	push	4
	mov	eax, DWORD PTR _regno$[ebp]
	push	eax
	call	_hard_regno_mode_ok
	add	esp, 8
	or	eax, eax
	je	$L572
; Line 299
	mov	eax, DWORD PTR _regno$[ebp]
	push	eax
	push	4
	push	34					; 00000022H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _tempreg$[ebp], eax
; Line 301
	mov	eax, DWORD PTR _tempreg$[ebp]
	push	eax
	push	1
	call	_strict_memory_address_p
	add	esp, 8
	or	eax, eax
	jne	$L575
; Line 302
	mov	DWORD PTR _tempreg$[ebp], 0
; Line 303
$L575:
; Line 306
$L572:
; Line 307
	cmp	DWORD PTR _can_push_reg$[ebp], 0
	jne	$L576
	mov	eax, DWORD PTR _regno$[ebp]
	movsx	eax, BYTE PTR _call_used_regs[eax]
	or	eax, eax
	jne	$L576
	push	4
	mov	eax, DWORD PTR _regno$[ebp]
	push	eax
	call	_hard_regno_mode_ok
	add	esp, 8
	or	eax, eax
	je	$L576
; Line 309
	mov	eax, DWORD PTR _regno$[ebp]
	push	eax
	push	4
	push	34					; 00000022H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _can_push_reg$[ebp], eax
; Line 311
	mov	eax, DWORD PTR _can_push_reg$[ebp]
	push	eax
	push	1
	call	_strict_memory_address_p
	add	esp, 8
	or	eax, eax
	jne	$L577
; Line 312
	mov	DWORD PTR _can_push_reg$[ebp], 0
; Line 313
$L577:
; Line 314
$L576:
	jmp	$L564
$L565:
; Line 317
	cmp	DWORD PTR _tempreg$[ebp], 0
	je	$L578
; Line 318
	mov	DWORD PTR _needpush$[ebp], 0
; Line 321
$L578:
	cmp	DWORD PTR _needpush$[ebp], 0
	je	$L579
; Line 324
	cmp	DWORD PTR _can_push_reg$[ebp], 0
	je	$L580
; Line 325
	mov	eax, DWORD PTR _can_push_reg$[ebp]
	mov	DWORD PTR _tempreg$[ebp], eax
; Line 326
	jmp	$L581
$L580:
; Line 328
	mov	DWORD PTR _regno$[ebp], 0
	jmp	$L582
$L583:
	inc	DWORD PTR _regno$[ebp]
$L582:
	cmp	DWORD PTR _regno$[ebp], 10		; 0000000aH
	jge	$L584
; Line 330
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _offset$[ebp]
	cmp	DWORD PTR [ecx+eax*4], 0
	jl	$L585
	mov	eax, DWORD PTR _regno$[ebp]
	movsx	eax, BYTE PTR _already_saved$[ebp+eax]
	or	eax, eax
	jne	$L585
	push	4
	mov	eax, DWORD PTR _regno$[ebp]
	push	eax
	call	_hard_regno_mode_ok
	add	esp, 8
	or	eax, eax
	je	$L585
; Line 332
	mov	eax, DWORD PTR _regno$[ebp]
	push	eax
	push	4
	push	34					; 00000022H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _tempreg$[ebp], eax
; Line 334
	mov	eax, DWORD PTR _tempreg$[ebp]
	push	eax
	push	1
	call	_strict_memory_address_p
	add	esp, 8
	or	eax, eax
	jne	$L586
; Line 335
	mov	DWORD PTR _tempreg$[ebp], 0
; Line 336
	jmp	$L587
$L586:
; Line 337
	jmp	$L584
$L587:
; Line 339
$L585:
	jmp	$L583
$L584:
$L581:
; Line 343
	mov	DWORD PTR _decrement$[ebp], 4
; Line 350
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _decrement$[ebp]
	neg	eax
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _stack_pointer_rtx
	push	eax
	call	_gen_add2_insn
	add	esp, 8
	push	eax
	call	_emit_insn_before
	add	esp, 8
; Line 353
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _tempreg$[ebp]
	push	eax
	mov	eax, DWORD PTR _stack_pointer_rtx
	push	eax
	push	4
	push	37					; 00000025H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	call	_gen_move_insn
	add	esp, 8
	push	eax
	call	_emit_insn_before
	add	esp, 8
; Line 358
$L579:
	mov	DWORD PTR _regno$[ebp], 0
	jmp	$L590
$L591:
	inc	DWORD PTR _regno$[ebp]
$L590:
	cmp	DWORD PTR _regno$[ebp], 10		; 0000000aH
	jge	$L592
; Line 360
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _offset$[ebp]
	cmp	DWORD PTR [ecx+eax*4], 0
	jl	$L593
	mov	eax, DWORD PTR _regno$[ebp]
	movsx	eax, BYTE PTR _already_saved$[ebp+eax]
	or	eax, eax
	jne	$L593
	cmp	DWORD PTR _tempreg$[ebp], 0
	je	$L593
	mov	eax, DWORD PTR _tempreg$[ebp]
	mov	ecx, DWORD PTR _regno$[ebp]
	cmp	DWORD PTR [eax+4], ecx
	je	$L593
; Line 362
	mov	eax, DWORD PTR _regno$[ebp]
	mov	eax, DWORD PTR _save_reg_rtx$S472[eax*4]
	mov	DWORD PTR _reg$594[ebp], eax
; Line 363
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _offset$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	mov	eax, DWORD PTR _addr$[ebp]
	push	eax
	call	_plus_constant
	add	esp, 8
	mov	DWORD PTR _addr1$595[ebp], eax
; Line 365
	mov	eax, DWORD PTR _addr1$595[ebp]
	push	eax
	mov	eax, DWORD PTR _reg$594[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	call	_memory_address_p
	add	esp, 8
	or	eax, eax
	jne	$L597
; Line 367
	mov	eax, DWORD PTR _addr1$595[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L598
; Line 368
	call	_abort
; Line 369
$L598:
; Line 370
	mov	eax, DWORD PTR _addr1$595[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L601
	mov	eax, DWORD PTR _addr1$595[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L600
$L601:
; Line 371
	call	_abort
; Line 372
$L600:
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _addr1$595[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _tempreg$[ebp]
	push	eax
	call	_gen_move_insn
	add	esp, 8
	push	eax
	call	_emit_insn_before
	add	esp, 8
; Line 373
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _addr1$595[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _tempreg$[ebp]
	push	eax
	call	_gen_add2_insn
	add	esp, 8
	push	eax
	call	_emit_insn_before
	add	esp, 8
; Line 374
	mov	eax, DWORD PTR _tempreg$[ebp]
	mov	DWORD PTR _addr1$595[ebp], eax
; Line 376
$L597:
	mov	eax, DWORD PTR _addr1$595[ebp]
	push	eax
	mov	eax, DWORD PTR _reg$594[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	37					; 00000025H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _temp$596[ebp], eax
; Line 377
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _reg$594[ebp]
	push	eax
	mov	eax, DWORD PTR _temp$596[ebp]
	push	eax
	call	_gen_move_insn
	add	esp, 8
	push	eax
	call	_emit_insn_before
	add	esp, 8
; Line 378
	mov	eax, DWORD PTR _regno$[ebp]
	mov	BYTE PTR _already_saved$[ebp+eax], 1
; Line 382
$L593:
	jmp	$L591
$L592:
	cmp	DWORD PTR _needpush$[ebp], 0
	je	$L602
; Line 386
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _stack_pointer_rtx
	push	eax
	push	4
	push	37					; 00000025H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _tempreg$[ebp]
	push	eax
	call	_gen_move_insn
	add	esp, 8
	push	eax
	call	_emit_insn_before
	add	esp, 8
; Line 389
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _decrement$[ebp]
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _stack_pointer_rtx
	push	eax
	call	_gen_add2_insn
	add	esp, 8
	push	eax
	call	_emit_insn_before
	add	esp, 8
; Line 394
$L602:
; Line 395
	cmp	DWORD PTR _tempreg$[ebp], 0
	je	$L603
	mov	eax, DWORD PTR _tempreg$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _offset$[ebp]
	cmp	DWORD PTR [ecx+eax*4], 0
	jl	$L603
	mov	eax, DWORD PTR _tempreg$[ebp]
	mov	eax, DWORD PTR [eax+4]
	movsx	eax, BYTE PTR _already_saved$[ebp+eax]
	or	eax, eax
	jne	$L603
; Line 396
	jmp	$retry$562
; Line 397
$L603:
$L555:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_emit_mult_save ENDP
_reg$640 = -56
_addr1$641 = -52
_temp$642 = -60
_insn$ = 8
_addr$ = 12
_offset$ = 16
_regno$ = -4
_restore_count$ = -8
_tempreg$ = -28
_maybe_tempreg$ = -20
_can_push_reg$ = -16
_needpush$ = -24
_decrement$ = -12
_already_restored$ = -40
_reg$622 = -48
_addr1$623 = -44
_emit_mult_restore PROC NEAR
; Line 410
	push	ebp
	mov	ebp, esp
	sub	esp, 60					; 0000003cH
	push	ebx
	push	esi
	push	edi
; Line 428
	push	10					; 0000000aH
	push	0
	lea	eax, DWORD PTR _already_restored$[ebp]
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 432
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _insn$[ebp], eax
; Line 433
	cmp	DWORD PTR _insn$[ebp], 0
	jne	$L616
; Line 434
	call	_abort
; Line 451
$L616:
$retry$617:
; Line 452
	mov	DWORD PTR _needpush$[ebp], 0
; Line 453
	mov	DWORD PTR _tempreg$[ebp], 0
; Line 454
	mov	DWORD PTR _can_push_reg$[ebp], 0
; Line 455
	mov	DWORD PTR _restore_count$[ebp], 0
; Line 462
	mov	DWORD PTR _regno$[ebp], 0
	jmp	$L618
$L619:
	inc	DWORD PTR _regno$[ebp]
$L618:
	cmp	DWORD PTR _regno$[ebp], 10		; 0000000aH
	jge	$L620
; Line 464
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _offset$[ebp]
	cmp	DWORD PTR [ecx+eax*4], 0
	jl	$L621
	mov	eax, DWORD PTR _regno$[ebp]
	movsx	eax, BYTE PTR _already_restored$[ebp+eax]
	or	eax, eax
	jne	$L621
; Line 466
	mov	eax, DWORD PTR _regno$[ebp]
	mov	eax, DWORD PTR _save_reg_rtx$S472[eax*4]
	mov	DWORD PTR _reg$622[ebp], eax
; Line 467
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _offset$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	mov	eax, DWORD PTR _addr$[ebp]
	push	eax
	call	_plus_constant
	add	esp, 8
	mov	DWORD PTR _addr1$623[ebp], eax
; Line 469
	inc	DWORD PTR _restore_count$[ebp]
; Line 471
	mov	eax, DWORD PTR _addr1$623[ebp]
	push	eax
	mov	eax, DWORD PTR _reg$622[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	call	_memory_address_p
	add	esp, 8
	or	eax, eax
	je	$L624
; Line 472
	mov	DWORD PTR _needpush$[ebp], 1
; Line 476
$L624:
	cmp	DWORD PTR _maybe_tempreg$[ebp], 0
	jne	$L625
; Line 478
	mov	eax, DWORD PTR _regno$[ebp]
	push	eax
	push	4
	push	34					; 00000022H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _maybe_tempreg$[ebp], eax
; Line 480
	mov	eax, DWORD PTR _maybe_tempreg$[ebp]
	push	eax
	push	1
	call	_strict_memory_address_p
	add	esp, 8
	or	eax, eax
	jne	$L626
; Line 481
	mov	DWORD PTR _maybe_tempreg$[ebp], 0
; Line 482
$L626:
; Line 483
$L625:
; Line 487
$L621:
; Line 489
	cmp	DWORD PTR _tempreg$[ebp], 0
	jne	$L627
	mov	eax, DWORD PTR _regno$[ebp]
	movsx	eax, BYTE PTR _call_used_regs[eax]
	or	eax, eax
	je	$L627
	mov	eax, DWORD PTR _regno$[ebp]
	movsx	eax, BYTE PTR _fixed_regs[eax]
	or	eax, eax
	jne	$L627
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _offset$[ebp]
	cmp	DWORD PTR [ecx+eax*4], 1
	sbb	eax, eax
	neg	eax
	or	eax, eax
	jl	$L627
	push	4
	mov	eax, DWORD PTR _regno$[ebp]
	push	eax
	call	_hard_regno_mode_ok
	add	esp, 8
	or	eax, eax
	je	$L627
; Line 491
	mov	eax, DWORD PTR _regno$[ebp]
	push	eax
	push	4
	push	34					; 00000022H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _tempreg$[ebp], eax
; Line 493
	mov	eax, DWORD PTR _tempreg$[ebp]
	push	eax
	push	1
	call	_strict_memory_address_p
	add	esp, 8
	or	eax, eax
	jne	$L628
; Line 494
	mov	DWORD PTR _tempreg$[ebp], 0
; Line 495
$L628:
; Line 499
$L627:
; Line 500
	cmp	DWORD PTR _can_push_reg$[ebp], 0
	jne	$L629
	mov	eax, DWORD PTR _regno$[ebp]
	movsx	eax, BYTE PTR _call_used_regs[eax]
	or	eax, eax
	jne	$L629
	push	4
	mov	eax, DWORD PTR _regno$[ebp]
	push	eax
	call	_hard_regno_mode_ok
	add	esp, 8
	or	eax, eax
	je	$L629
; Line 502
	mov	eax, DWORD PTR _regno$[ebp]
	push	eax
	push	4
	push	34					; 00000022H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _can_push_reg$[ebp], eax
; Line 504
	mov	eax, DWORD PTR _can_push_reg$[ebp]
	push	eax
	push	1
	call	_strict_memory_address_p
	add	esp, 8
	or	eax, eax
	jne	$L630
; Line 505
	mov	DWORD PTR _can_push_reg$[ebp], 0
; Line 506
$L630:
; Line 509
$L629:
; Line 510
	cmp	DWORD PTR _can_push_reg$[ebp], 0
	jne	$L631
	mov	eax, DWORD PTR _regno$[ebp]
	movsx	eax, BYTE PTR _already_restored$[ebp+eax]
	or	eax, eax
	je	$L631
	push	4
	mov	eax, DWORD PTR _regno$[ebp]
	push	eax
	call	_hard_regno_mode_ok
	add	esp, 8
	or	eax, eax
	je	$L631
; Line 512
	mov	eax, DWORD PTR _regno$[ebp]
	push	eax
	push	4
	push	34					; 00000022H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _can_push_reg$[ebp], eax
; Line 514
	mov	eax, DWORD PTR _can_push_reg$[ebp]
	push	eax
	push	1
	call	_strict_memory_address_p
	add	esp, 8
	or	eax, eax
	jne	$L632
; Line 515
	mov	DWORD PTR _can_push_reg$[ebp], 0
; Line 516
$L632:
; Line 517
$L631:
	jmp	$L619
$L620:
; Line 521
	cmp	DWORD PTR _tempreg$[ebp], 0
	jne	$L633
	cmp	DWORD PTR _maybe_tempreg$[ebp], 0
	je	$L633
	cmp	DWORD PTR _restore_count$[ebp], 1
	jle	$L633
; Line 522
	mov	eax, DWORD PTR _maybe_tempreg$[ebp]
	mov	DWORD PTR _tempreg$[ebp], eax
; Line 525
$L633:
	cmp	DWORD PTR _tempreg$[ebp], 0
	je	$L634
; Line 526
	mov	DWORD PTR _needpush$[ebp], 0
; Line 529
$L634:
	cmp	DWORD PTR _needpush$[ebp], 0
	je	$L635
; Line 531
	mov	eax, DWORD PTR _can_push_reg$[ebp]
	mov	DWORD PTR _tempreg$[ebp], eax
; Line 535
	mov	DWORD PTR _decrement$[ebp], 4
; Line 542
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _decrement$[ebp]
	neg	eax
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _stack_pointer_rtx
	push	eax
	call	_gen_add2_insn
	add	esp, 8
	push	eax
	call	_emit_insn_before
	add	esp, 8
; Line 545
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _tempreg$[ebp]
	push	eax
	mov	eax, DWORD PTR _stack_pointer_rtx
	push	eax
	push	4
	push	37					; 00000025H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	call	_gen_move_insn
	add	esp, 8
	push	eax
	call	_emit_insn_before
	add	esp, 8
; Line 550
$L635:
	mov	DWORD PTR _regno$[ebp], 0
	jmp	$L636
$L637:
	inc	DWORD PTR _regno$[ebp]
$L636:
	cmp	DWORD PTR _regno$[ebp], 10		; 0000000aH
	jge	$L638
; Line 552
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _offset$[ebp]
	cmp	DWORD PTR [ecx+eax*4], 0
	jl	$L639
	mov	eax, DWORD PTR _regno$[ebp]
	movsx	eax, BYTE PTR _already_restored$[ebp+eax]
	or	eax, eax
	jne	$L639
	cmp	DWORD PTR _tempreg$[ebp], 0
	je	$L639
	mov	eax, DWORD PTR _tempreg$[ebp]
	mov	ecx, DWORD PTR _regno$[ebp]
	cmp	DWORD PTR [eax+4], ecx
	je	$L639
; Line 554
	mov	eax, DWORD PTR _regno$[ebp]
	mov	eax, DWORD PTR _save_reg_rtx$S472[eax*4]
	mov	DWORD PTR _reg$640[ebp], eax
; Line 555
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _offset$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	mov	eax, DWORD PTR _addr$[ebp]
	push	eax
	call	_plus_constant
	add	esp, 8
	mov	DWORD PTR _addr1$641[ebp], eax
; Line 557
	mov	eax, DWORD PTR _addr1$641[ebp]
	push	eax
	mov	eax, DWORD PTR _reg$640[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	call	_memory_address_p
	add	esp, 8
	or	eax, eax
	jne	$L643
; Line 559
	mov	eax, DWORD PTR _addr1$641[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L644
; Line 560
	call	_abort
; Line 561
$L644:
; Line 562
	mov	eax, DWORD PTR _addr1$641[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L646
	mov	eax, DWORD PTR _addr1$641[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L645
$L646:
; Line 563
	call	_abort
; Line 564
$L645:
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _addr1$641[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _tempreg$[ebp]
	push	eax
	call	_gen_move_insn
	add	esp, 8
	push	eax
	call	_emit_insn_before
	add	esp, 8
; Line 565
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _addr1$641[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _tempreg$[ebp]
	push	eax
	call	_gen_add2_insn
	add	esp, 8
	push	eax
	call	_emit_insn_before
	add	esp, 8
; Line 566
	mov	eax, DWORD PTR _tempreg$[ebp]
	mov	DWORD PTR _addr1$641[ebp], eax
; Line 568
$L643:
	mov	eax, DWORD PTR _addr1$641[ebp]
	push	eax
	mov	eax, DWORD PTR _reg$640[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	37					; 00000025H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _temp$642[ebp], eax
; Line 569
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _temp$642[ebp]
	push	eax
	mov	eax, DWORD PTR _reg$640[ebp]
	push	eax
	call	_gen_move_insn
	add	esp, 8
	push	eax
	call	_emit_insn_before
	add	esp, 8
; Line 570
	mov	eax, DWORD PTR _regno$[ebp]
	mov	BYTE PTR _already_restored$[ebp+eax], 1
; Line 574
$L639:
	jmp	$L637
$L638:
	cmp	DWORD PTR _needpush$[ebp], 0
	je	$L647
; Line 578
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _stack_pointer_rtx
	push	eax
	push	4
	push	37					; 00000025H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _tempreg$[ebp]
	push	eax
	call	_gen_move_insn
	add	esp, 8
	push	eax
	call	_emit_insn_before
	add	esp, 8
; Line 581
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _decrement$[ebp]
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _stack_pointer_rtx
	push	eax
	call	_gen_add2_insn
	add	esp, 8
	push	eax
	call	_emit_insn_before
	add	esp, 8
; Line 586
$L647:
; Line 587
	cmp	DWORD PTR _tempreg$[ebp], 0
	je	$L648
	mov	eax, DWORD PTR _tempreg$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _offset$[ebp]
	cmp	DWORD PTR [ecx+eax*4], 0
	jl	$L648
	mov	eax, DWORD PTR _tempreg$[ebp]
	mov	eax, DWORD PTR [eax+4]
	movsx	eax, BYTE PTR _already_restored$[ebp+eax]
	or	eax, eax
	jne	$L648
; Line 588
	jmp	$retry$617
; Line 589
$L648:
$L607:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_emit_mult_restore ENDP
_TEXT	ENDS
EXTRN	_frame_pointer_rtx:DWORD
EXTRN	_assign_stack_local:NEAR
_TEXT	SEGMENT
_addr$ = 8
_size$ = 12
_newaddr$ = -4
_grow_save_block PROC NEAR
; Line 598
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 604
	mov	eax, DWORD PTR _size$[ebp]
	add	eax, 3
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	shl	eax, 2
	mov	DWORD PTR _size$[ebp], eax
; Line 607
	cmp	DWORD PTR _addr$[ebp], 0
	jne	$L653
; Line 609
	mov	eax, DWORD PTR _size$[ebp]
	mov	DWORD PTR _save_block_size$S471, eax
; Line 610
	mov	eax, DWORD PTR _size$[ebp]
	push	eax
	push	26					; 0000001aH
	call	_assign_stack_local
	add	esp, 8
	mov	eax, DWORD PTR [eax+4]
	jmp	$L651
; Line 614
$L653:
	mov	eax, DWORD PTR _size$[ebp]
	sub	eax, DWORD PTR _save_block_size$S471
	push	eax
	push	26					; 0000001aH
	call	_assign_stack_local
	add	esp, 8
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _newaddr$[ebp], eax
; Line 624
	mov	eax, DWORD PTR _newaddr$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L654
	mov	eax, DWORD PTR _newaddr$[ebp]
	mov	ecx, DWORD PTR _frame_pointer_rtx
	cmp	DWORD PTR [eax+4], ecx
	jne	$L654
	mov	eax, DWORD PTR _newaddr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L654
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L654
	mov	eax, DWORD PTR _addr$[ebp]
	mov	ecx, DWORD PTR _frame_pointer_rtx
	cmp	DWORD PTR [eax+4], ecx
	jne	$L654
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L654
	mov	eax, DWORD PTR _newaddr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _addr$[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	sub	eax, DWORD PTR [ecx+4]
	mov	ecx, DWORD PTR _size$[ebp]
	sub	ecx, DWORD PTR _save_block_size$S471
	cmp	eax, ecx
	je	$L655
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _newaddr$[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	sub	eax, DWORD PTR [ecx+4]
	mov	ecx, DWORD PTR _size$[ebp]
	sub	ecx, DWORD PTR _save_block_size$S471
	cmp	eax, ecx
	jne	$L654
$L655:
; Line 626
	mov	eax, DWORD PTR _size$[ebp]
	mov	DWORD PTR _save_block_size$S471, eax
; Line 627
	mov	eax, DWORD PTR _newaddr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _addr$[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	mov	ecx, DWORD PTR [ecx+4]
	cmp	DWORD PTR [eax+4], ecx
	jge	$L656
; Line 628
	mov	eax, DWORD PTR _newaddr$[ebp]
	jmp	$L651
; Line 629
	jmp	$L657
$L656:
; Line 630
	mov	eax, DWORD PTR _addr$[ebp]
	jmp	$L651
$L657:
; Line 634
$L654:
	call	_abort
; Line 636
	mov	eax, DWORD PTR _size$[ebp]
	mov	DWORD PTR _save_block_size$S471, eax
; Line 637
	mov	eax, DWORD PTR _size$[ebp]
	push	eax
	push	26					; 0000001aH
	call	_assign_stack_local
	add	esp, 8
	mov	eax, DWORD PTR [eax+4]
	jmp	$L651
; Line 638
$L651:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_grow_save_block ENDP
_regno$ = 8
_class$ = -4
_choose_hard_reg_mode PROC NEAR
; Line 646
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	push	ebx
	push	esi
	push	edi
; Line 647
	cmp	DWORD PTR _regno$[ebp], 0
	jne	$L676
	mov	DWORD PTR _class$[ebp], 1
	jmp	$L677
$L676:
	cmp	DWORD PTR _regno$[ebp], 1
	jne	$L678
	mov	DWORD PTR _class$[ebp], 2
	jmp	$L679
$L678:
	cmp	DWORD PTR _regno$[ebp], 2
	jne	$L680
	mov	DWORD PTR _class$[ebp], 4
	jmp	$L681
$L680:
	cmp	DWORD PTR _regno$[ebp], 3
	jne	$L682
	mov	DWORD PTR _class$[ebp], 5
	jmp	$L683
$L682:
	cmp	DWORD PTR _regno$[ebp], 4
	jne	$L684
	mov	DWORD PTR _class$[ebp], 7
	jmp	$L685
$L684:
	cmp	DWORD PTR _regno$[ebp], 5
	jne	$L686
	mov	DWORD PTR _class$[ebp], 8
	jmp	$L687
$L686:
	cmp	DWORD PTR _regno$[ebp], 7
	jne	$L688
	mov	DWORD PTR _class$[ebp], 10		; 0000000aH
	jmp	$L689
$L688:
	mov	eax, 11					; 0000000bH
	cmp	DWORD PTR _regno$[ebp], 8
	jge	$L700
	mov	eax, 9
$L700:
	mov	DWORD PTR _class$[ebp], eax
$L689:
$L687:
$L685:
$L683:
$L681:
$L679:
$L677:
; Line 650
	cmp	DWORD PTR _class$[ebp], 11		; 0000000bH
	jne	$L690
	mov	DWORD PTR -8+[ebp], 1
	jmp	$L691
$L690:
	mov	eax, DWORD PTR _mode_size+24
	add	eax, 3
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	mov	DWORD PTR -8+[ebp], eax
$L691:
	cmp	DWORD PTR -8+[ebp], 1
	jne	$L661
	push	6
	mov	eax, DWORD PTR _regno$[ebp]
	push	eax
	call	_hard_regno_mode_ok
	add	esp, 8
	or	eax, eax
	je	$L661
; Line 651
	mov	eax, 6
	jmp	$L659
; Line 652
	jmp	$L662
$L661:
; Line 653
	cmp	DWORD PTR _class$[ebp], 11		; 0000000bH
	jne	$L692
	mov	DWORD PTR -12+[ebp], 1
	jmp	$L693
$L692:
	mov	eax, DWORD PTR _mode_size+44
	add	eax, 3
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	mov	DWORD PTR -12+[ebp], eax
$L693:
	cmp	DWORD PTR -12+[ebp], 1
	jne	$L663
	push	11					; 0000000bH
	mov	eax, DWORD PTR _regno$[ebp]
	push	eax
	call	_hard_regno_mode_ok
	add	esp, 8
	or	eax, eax
	je	$L663
; Line 654
	mov	eax, 11					; 0000000bH
	jmp	$L659
; Line 655
	jmp	$L664
$L663:
; Line 656
	cmp	DWORD PTR _class$[ebp], 11		; 0000000bH
	jne	$L694
	mov	DWORD PTR -16+[ebp], 1
	jmp	$L695
$L694:
	mov	eax, DWORD PTR _mode_size+16
	add	eax, 3
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	mov	DWORD PTR -16+[ebp], eax
$L695:
	cmp	DWORD PTR -16+[ebp], 1
	jne	$L665
	push	4
	mov	eax, DWORD PTR _regno$[ebp]
	push	eax
	call	_hard_regno_mode_ok
	add	esp, 8
	or	eax, eax
	je	$L665
; Line 657
	mov	eax, 4
	jmp	$L659
; Line 658
	jmp	$L666
$L665:
; Line 659
	cmp	DWORD PTR _class$[ebp], 11		; 0000000bH
	jne	$L696
	mov	DWORD PTR -20+[ebp], 1
	jmp	$L697
$L696:
	mov	eax, DWORD PTR _mode_size+40
	add	eax, 3
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	mov	DWORD PTR -20+[ebp], eax
$L697:
	cmp	DWORD PTR -20+[ebp], 1
	jne	$L667
	push	10					; 0000000aH
	mov	eax, DWORD PTR _regno$[ebp]
	push	eax
	call	_hard_regno_mode_ok
	add	esp, 8
	or	eax, eax
	je	$L667
; Line 660
	mov	eax, 10					; 0000000aH
	jmp	$L659
; Line 661
	jmp	$L668
$L667:
; Line 662
	cmp	DWORD PTR _class$[ebp], 11		; 0000000bH
	jne	$L698
	mov	DWORD PTR -24+[ebp], 1
	jmp	$L699
$L698:
	mov	eax, DWORD PTR _mode_size+8
	add	eax, 3
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	mov	DWORD PTR -24+[ebp], eax
$L699:
	cmp	DWORD PTR -24+[ebp], 1
	jne	$L669
	push	2
	mov	eax, DWORD PTR _regno$[ebp]
	push	eax
	call	_hard_regno_mode_ok
	add	esp, 8
	or	eax, eax
	je	$L669
; Line 663
	mov	eax, 2
	jmp	$L659
; Line 664
	jmp	$L670
$L669:
; Line 665
	call	_abort
$L670:
$L668:
$L666:
$L664:
$L662:
; Line 666
$L659:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_choose_hard_reg_mode ENDP
_TEXT	ENDS
END
