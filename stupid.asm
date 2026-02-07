	TITLE	stupid.c
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
PUBLIC	_stupid_life_analysis
EXTRN	_oballoc:NEAR
EXTRN	_allocate_for_life_analysis:NEAR
EXTRN	_call_used_regs:TBYTE
EXTRN	_call_used_reg_set:WORD
EXTRN	_max_regno:DWORD
EXTRN	_reg_n_deaths:DWORD
EXTRN	_reg_n_calls_crossed:DWORD
EXTRN	_reg_renumber:DWORD
EXTRN	_regs_ever_live:TBYTE
EXTRN	_qsort:NEAR
EXTRN	_regno_reg_rtx:DWORD
EXTRN	_dump_flow_info:NEAR
EXTRN	_reg_preferred_class:NEAR
EXTRN	_memset:NEAR
EXTRN	_alloca:NEAR
_BSS	SEGMENT
_uid_suid$S485 DD 01H DUP (?)
_last_call_suid$S486 DD 01H DUP (?)
_last_jump_suid$S487 DD 01H DUP (?)
_last_label_suid$S488 DD 01H DUP (?)
_reg_where_dead$S489 DD 01H DUP (?)
_reg_where_born$S490 DD 01H DUP (?)
_reg_crosses_blocks$S491 DD 01H DUP (?)
_reg_order$S492 DD 01H DUP (?)
_regs_live$S493 DD 01H DUP (?)
_after_insn_hard_regs$S494 DD 01H DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
; File stupid.c
_p$529 = -20
_r$550 = -24
_class$551 = -28
_f$ = 8
_nregs$ = 12
_file$ = 16
_i$ = -8
_last$ = -16
_insn$ = -12
_max_uid$ = -4
_stupid_life_analysis PROC NEAR
; Line 124
	push	ebp
	mov	ebp, esp
	sub	esp, 28					; 0000001cH
	push	ebx
	push	esi
	push	edi
; Line 129
	push	10					; 0000000aH
	push	0
	push	OFFSET _regs_ever_live
	call	_memset
	add	esp, 12					; 0000000cH
; Line 131
	mov	eax, DWORD PTR _nregs$[ebp]
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _regs_live$S493, eax
; Line 136
	mov	eax, DWORD PTR _f$[ebp]
	mov	DWORD PTR _insn$[ebp], eax
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L509
$L510:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _insn$[ebp], eax
$L509:
	cmp	DWORD PTR _insn$[ebp], 0
	je	$L511
; Line 137
	mov	eax, DWORD PTR _insn$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	DWORD PTR [eax+4], ecx
	jle	$L512
; Line 138
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _i$[ebp], eax
; Line 140
$L512:
	jmp	$L510
$L511:
	mov	eax, DWORD PTR _i$[ebp]
	inc	eax
	mov	DWORD PTR _max_uid$[ebp], eax
; Line 141
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax*4+4]
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _uid_suid$S485, eax
; Line 147
	mov	DWORD PTR _last$[ebp], 0
; Line 148
	mov	eax, DWORD PTR _f$[ebp]
	mov	DWORD PTR _insn$[ebp], eax
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L513
$L514:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _insn$[ebp], eax
$L513:
	cmp	DWORD PTR _insn$[ebp], 0
	je	$L515
; Line 151
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 851968				; 000d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L517
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 983040				; 000f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L517
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 917504				; 000e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L516
$L517:
; Line 152
	mov	eax, DWORD PTR _insn$[ebp]
	mov	DWORD PTR _last$[ebp], eax
; Line 153
$L516:
	inc	DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	mov	edx, DWORD PTR _uid_suid$S485
	mov	DWORD PTR [edx+ecx*4], eax
; Line 154
	jmp	$L514
$L515:
; Line 156
	mov	eax, DWORD PTR _i$[ebp]
	inc	eax
	mov	DWORD PTR _last_call_suid$S486, eax
; Line 157
	mov	eax, DWORD PTR _i$[ebp]
	inc	eax
	mov	DWORD PTR _last_jump_suid$S487, eax
; Line 158
	mov	eax, DWORD PTR _i$[ebp]
	inc	eax
	mov	DWORD PTR _last_label_suid$S488, eax
; Line 160
	mov	eax, DWORD PTR _nregs$[ebp]
	mov	DWORD PTR _max_regno, eax
; Line 164
	mov	eax, DWORD PTR _nregs$[ebp]
	shl	eax, 2
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _reg_where_dead$S489, eax
; Line 165
	mov	eax, DWORD PTR _nregs$[ebp]
	shl	eax, 2
	push	eax
	push	0
	mov	eax, DWORD PTR _reg_where_dead$S489
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 167
	mov	eax, DWORD PTR _nregs$[ebp]
	shl	eax, 2
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _reg_where_born$S490, eax
; Line 168
	mov	eax, DWORD PTR _nregs$[ebp]
	shl	eax, 2
	push	eax
	push	0
	mov	eax, DWORD PTR _reg_where_born$S490
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 170
	mov	eax, DWORD PTR _nregs$[ebp]
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _reg_crosses_blocks$S491, eax
; Line 171
	mov	eax, DWORD PTR _nregs$[ebp]
	push	eax
	push	0
	mov	eax, DWORD PTR _reg_crosses_blocks$S491
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 173
	mov	eax, DWORD PTR _nregs$[ebp]
	shl	eax, 2
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _reg_order$S492, eax
; Line 174
	mov	eax, DWORD PTR _nregs$[ebp]
	shl	eax, 2
	push	eax
	push	0
	mov	eax, DWORD PTR _reg_order$S492
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 176
	mov	eax, DWORD PTR _nregs$[ebp]
	add	eax, eax
	push	eax
	call	_oballoc
	add	esp, 4
	mov	DWORD PTR _reg_renumber, eax
; Line 177
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L519
$L520:
	inc	DWORD PTR _i$[ebp]
$L519:
	cmp	DWORD PTR _i$[ebp], 10			; 0000000aH
	jge	$L521
; Line 178
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _reg_renumber
	mov	WORD PTR [edx+ecx*2], ax
	jmp	$L520
$L521:
; Line 180
	mov	eax, DWORD PTR _max_uid$[ebp]
	add	eax, eax
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _after_insn_hard_regs$S494, eax
; Line 181
	mov	eax, DWORD PTR _max_uid$[ebp]
	add	eax, eax
	push	eax
	push	0
	mov	eax, DWORD PTR _after_insn_hard_regs$S494
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 186
	call	_allocate_for_life_analysis
; Line 188
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L523
$L524:
	inc	DWORD PTR _i$[ebp]
$L523:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _max_regno, eax
	jle	$L525
; Line 190
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_n_deaths
	mov	WORD PTR [ecx+eax*2], 1
; Line 191
	jmp	$L524
$L525:
; Line 193
	mov	eax, DWORD PTR _nregs$[ebp]
	push	eax
	push	0
	mov	eax, DWORD PTR _regs_live$S493
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 204
	mov	eax, DWORD PTR _last$[ebp]
	mov	DWORD PTR _insn$[ebp], eax
	jmp	$L526
$L527:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _insn$[ebp], eax
$L526:
	cmp	DWORD PTR _insn$[ebp], 0
	je	$L528
; Line 206
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _uid_suid$S485
	mov	eax, DWORD PTR [ecx+eax*4]
	add	eax, eax
	add	eax, DWORD PTR _after_insn_hard_regs$S494
	mov	DWORD PTR _p$529[ebp], eax
; Line 212
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L530
$L531:
	inc	DWORD PTR _i$[ebp]
$L530:
	cmp	DWORD PTR _i$[ebp], 10			; 0000000aH
	jge	$L532
; Line 213
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _regs_live$S493
	movsx	eax, BYTE PTR [eax+ecx]
	or	eax, eax
	je	$L533
; Line 214
	mov	eax, DWORD PTR _p$529[ebp]
	movsx	eax, WORD PTR [eax]
	mov	edx, 1
	mov	cl, BYTE PTR _i$[ebp]
	shl	edx, cl
	or	eax, edx
	mov	ecx, DWORD PTR _p$529[ebp]
	mov	WORD PTR [ecx], ax
; Line 222
$L533:
	jmp	$L531
$L532:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 983040				; 000f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L534
; Line 224
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _uid_suid$S485
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _last_call_suid$S486, eax
; Line 226
	mov	eax, DWORD PTR _last_call_suid$S486
	mov	ecx, DWORD PTR _after_insn_hard_regs$S494
	movsx	eax, WORD PTR [ecx+eax*2]
	movsx	ecx, WORD PTR _call_used_reg_set
	or	eax, ecx
	mov	ecx, DWORD PTR _last_call_suid$S486
	mov	edx, DWORD PTR _after_insn_hard_regs$S494
	mov	WORD PTR [edx+ecx*2], ax
; Line 227
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L535
$L536:
	inc	DWORD PTR _i$[ebp]
$L535:
	cmp	DWORD PTR _i$[ebp], 10			; 0000000aH
	jge	$L537
; Line 228
	mov	eax, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR _call_used_regs[eax]
	or	eax, eax
	je	$L538
; Line 229
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _regs_live$S493
	mov	BYTE PTR [eax+ecx], 0
; Line 230
$L538:
	jmp	$L536
$L537:
; Line 232
$L534:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 917504				; 000e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L539
; Line 233
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _uid_suid$S485
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _last_jump_suid$S487, eax
; Line 235
$L539:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1114112				; 00110000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L540
; Line 236
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _uid_suid$S485
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _last_label_suid$S488, eax
; Line 242
$L540:
; Line 244
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 851968				; 000d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L542
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 983040				; 000f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L542
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 917504				; 000e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L541
$L542:
; Line 246
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_stupid_mark_refs
	add	esp, 8
; Line 248
$L541:
	jmp	$L527
$L528:
; Line 252
	mov	DWORD PTR _i$[ebp], 10			; 0000000aH
	jmp	$L543
$L544:
	inc	DWORD PTR _i$[ebp]
$L543:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _max_regno, eax
	jle	$L545
; Line 253
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _reg_order$S492
	mov	DWORD PTR [edx+ecx*4], eax
	jmp	$L544
$L545:
; Line 257
	push	OFFSET _stupid_reg_compare
	push	4
	mov	eax, DWORD PTR _max_regno
	sub	eax, 10					; 0000000aH
	push	eax
	mov	eax, DWORD PTR _reg_order$S492
	add	eax, 40					; 00000028H
	push	eax
	call	_qsort
	add	esp, 16					; 00000010H
; Line 261
	mov	DWORD PTR _i$[ebp], 10			; 0000000aH
	jmp	$L547
$L548:
	inc	DWORD PTR _i$[ebp]
$L547:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _max_regno, eax
	jle	$L549
; Line 263
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_order$S492
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _r$550[ebp], eax
; Line 267
	mov	eax, DWORD PTR _r$550[ebp]
	mov	ecx, DWORD PTR _regno_reg_rtx
	cmp	DWORD PTR [ecx+eax*4], 0
	jne	$L552
; Line 268
	jmp	$L548
; Line 271
$L552:
; Line 273
	mov	eax, DWORD PTR _r$550[ebp]
	push	eax
	call	_reg_preferred_class
	add	esp, 4
	mov	DWORD PTR _class$551[ebp], eax
; Line 279
	mov	eax, DWORD PTR _r$550[ebp]
	mov	ecx, DWORD PTR _reg_crosses_blocks$S491
	movsx	eax, BYTE PTR [eax+ecx]
	push	eax
	mov	eax, DWORD PTR _r$550[ebp]
	mov	ecx, DWORD PTR _reg_where_dead$S489
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	mov	eax, DWORD PTR _r$550[ebp]
	mov	ecx, DWORD PTR _reg_where_born$S490
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	mov	eax, DWORD PTR _r$550[ebp]
	mov	ecx, DWORD PTR _regno_reg_rtx
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	mov	eax, DWORD PTR _class$551[ebp]
	push	eax
	mov	eax, DWORD PTR _r$550[ebp]
	mov	ecx, DWORD PTR _reg_n_calls_crossed
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	call	_stupid_find_reg
	add	esp, 24					; 00000018H
	mov	ecx, DWORD PTR _r$550[ebp]
	mov	edx, DWORD PTR _reg_renumber
	mov	WORD PTR [edx+ecx*2], ax
; Line 281
	jmp	$L554
$L553:
; Line 282
	mov	eax, DWORD PTR _r$550[ebp]
	mov	ecx, DWORD PTR _reg_renumber
	mov	WORD PTR [ecx+eax*2], -1
$L554:
; Line 286
	mov	eax, DWORD PTR _r$550[ebp]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	cmp	eax, -1
	jne	$L555
; Line 292
	mov	eax, DWORD PTR _r$550[ebp]
	mov	ecx, DWORD PTR _reg_crosses_blocks$S491
	movsx	eax, BYTE PTR [eax+ecx]
	push	eax
	mov	eax, DWORD PTR _r$550[ebp]
	mov	ecx, DWORD PTR _reg_where_dead$S489
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	mov	eax, DWORD PTR _r$550[ebp]
	mov	ecx, DWORD PTR _reg_where_born$S490
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	mov	eax, DWORD PTR _r$550[ebp]
	mov	ecx, DWORD PTR _regno_reg_rtx
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	10					; 0000000aH
	mov	eax, DWORD PTR _r$550[ebp]
	mov	ecx, DWORD PTR _reg_n_calls_crossed
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	call	_stupid_find_reg
	add	esp, 24					; 00000018H
	mov	ecx, DWORD PTR _r$550[ebp]
	mov	edx, DWORD PTR _reg_renumber
	mov	WORD PTR [edx+ecx*2], ax
; Line 293
$L555:
	jmp	$L548
$L549:
; Line 295
	cmp	DWORD PTR _file$[ebp], 0
	je	$L556
; Line 296
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_dump_flow_info
	add	esp, 4
; Line 297
$L556:
$L502:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_stupid_life_analysis ENDP
_TEXT	ENDS
EXTRN	_reg_n_refs:DWORD
_TEXT	SEGMENT
_r1p$ = 8
_r2p$ = 12
_r1$ = -20
_r2$ = -8
_len1$ = -16
_len2$ = -12
_tem$ = -4
_stupid_reg_compare PROC NEAR
; Line 305
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	push	ebx
	push	esi
	push	edi
; Line 306
	mov	eax, DWORD PTR _r1p$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _r1$[ebp], eax
	mov	eax, DWORD PTR _r2p$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _r2$[ebp], eax
; Line 307
	mov	eax, DWORD PTR _r1$[ebp]
	mov	ecx, DWORD PTR _reg_where_dead$S489
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _r1$[ebp]
	mov	edx, DWORD PTR _reg_where_born$S490
	sub	eax, DWORD PTR [edx+ecx*4]
	mov	DWORD PTR _len1$[ebp], eax
; Line 308
	mov	eax, DWORD PTR _r2$[ebp]
	mov	ecx, DWORD PTR _reg_where_dead$S489
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _r2$[ebp]
	mov	edx, DWORD PTR _reg_where_born$S490
	sub	eax, DWORD PTR [edx+ecx*4]
	mov	DWORD PTR _len2$[ebp], eax
; Line 311
	mov	eax, DWORD PTR _len2$[ebp]
	sub	eax, DWORD PTR _len1$[ebp]
	mov	DWORD PTR _tem$[ebp], eax
; Line 312
	cmp	DWORD PTR _tem$[ebp], 0
	je	$L566
	mov	eax, DWORD PTR _tem$[ebp]
	jmp	$L560
; Line 314
$L566:
	mov	eax, DWORD PTR _r1$[ebp]
	mov	ecx, DWORD PTR _reg_n_refs
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	ecx, DWORD PTR _r2$[ebp]
	mov	edx, DWORD PTR _reg_n_refs
	movsx	ecx, WORD PTR [edx+ecx*2]
	sub	eax, ecx
	mov	DWORD PTR _tem$[ebp], eax
; Line 315
	cmp	DWORD PTR _tem$[ebp], 0
	je	$L567
	mov	eax, DWORD PTR _tem$[ebp]
	jmp	$L560
; Line 319
$L567:
	mov	eax, DWORD PTR _r1$[ebp]
	sub	eax, DWORD PTR _r2$[ebp]
	jmp	$L560
; Line 320
$L560:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_stupid_reg_compare ENDP
_TEXT	ENDS
EXTRN	_fixed_reg_set:WORD
EXTRN	_hard_regno_mode_ok:NEAR
EXTRN	_reg_class_contents:BYTE
EXTRN	_mode_size:BYTE
_TEXT	SEGMENT
_ins$ = -16
_used$ = -12
_this_reg$ = -8
_regno$585 = -20
_j$590 = -28
_size1$591 = -24
_call_preserved$ = 8
_class$ = 12
_mode$ = 16
_born_insn$ = 20
_dead_insn$ = 24
_crosses_blocks$ = 28
_i$ = -4
_stupid_find_reg PROC NEAR
; Line 343
	push	ebp
	mov	ebp, esp
	sub	esp, 28					; 0000001cH
	push	ebx
	push	esi
	push	edi
; Line 351
	cmp	DWORD PTR _call_preserved$[ebp], 0
	je	$L644
	mov	ax, WORD PTR _call_used_reg_set
	mov	WORD PTR _used$[ebp], ax
	jmp	$L645
$L644:
	mov	ax, WORD PTR _fixed_reg_set
	mov	WORD PTR _used$[ebp], ax
$L645:
; Line 353
	mov	eax, DWORD PTR _born_insn$[ebp]
	mov	DWORD PTR _ins$[ebp], eax
	jmp	$L579
$L580:
	inc	DWORD PTR _ins$[ebp]
$L579:
	mov	eax, DWORD PTR _dead_insn$[ebp]
	cmp	DWORD PTR _ins$[ebp], eax
	jge	$L581
; Line 354
	mov	eax, DWORD PTR _ins$[ebp]
	mov	ecx, DWORD PTR _after_insn_hard_regs$S494
	movsx	eax, WORD PTR [ecx+eax*2]
	movsx	ecx, WORD PTR _used$[ebp]
	or	eax, ecx
	mov	WORD PTR _used$[ebp], ax
	jmp	$L580
$L581:
; Line 356
	mov	eax, DWORD PTR _class$[ebp]
	movsx	eax, WORD PTR _reg_class_contents[eax*2]
	not	eax
	movsx	ecx, WORD PTR _used$[ebp]
	or	eax, ecx
	mov	WORD PTR _used$[ebp], ax
; Line 358
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L582
$L583:
	inc	DWORD PTR _i$[ebp]
$L582:
	cmp	DWORD PTR _i$[ebp], 10			; 0000000aH
	jge	$L584
; Line 363
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _regno$585[ebp], eax
; Line 370
	cmp	DWORD PTR _regno$585[ebp], 8
	jl	$L586
	cmp	DWORD PTR _regno$585[ebp], 10		; 0000000aH
	jge	$L586
	cmp	DWORD PTR _crosses_blocks$[ebp], 0
	je	$L586
; Line 371
	jmp	$L583
; Line 378
$L586:
	cmp	DWORD PTR _regno$585[ebp], 8
	jl	$L587
	cmp	DWORD PTR _regno$585[ebp], 10		; 0000000aH
	jge	$L587
; Line 379
	jmp	$L583
; Line 382
$L587:
; Line 383
	movsx	eax, WORD PTR _used$[ebp]
	mov	edx, 1
	mov	cl, BYTE PTR _regno$585[ebp]
	shl	edx, cl
	test	eax, edx
	jne	$L589
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	mov	eax, DWORD PTR _regno$585[ebp]
	push	eax
	call	_hard_regno_mode_ok
	add	esp, 8
	or	eax, eax
	je	$L589
; Line 386
	cmp	DWORD PTR _regno$585[ebp], 8
	jl	$L646
	mov	DWORD PTR _size1$591[ebp], 1
	jmp	$L647
$L646:
	mov	eax, DWORD PTR _mode$[ebp]
	mov	eax, DWORD PTR _mode_size[eax*4]
	add	eax, 3
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	mov	DWORD PTR _size1$591[ebp], eax
$L647:
; Line 387
	mov	DWORD PTR _j$590[ebp], 1
	jmp	$L592
$L593:
	inc	DWORD PTR _j$590[ebp]
$L592:
	mov	eax, DWORD PTR _j$590[ebp]
	cmp	DWORD PTR _size1$591[ebp], eax
	jle	$L594
	mov	eax, 1
	mov	ecx, DWORD PTR _j$590[ebp]
	add	ecx, DWORD PTR _regno$585[ebp]
	shl	eax, cl
	movsx	ecx, WORD PTR _used$[ebp]
	test	eax, ecx
	jne	$L594
	jmp	$L593
$L594:
; Line 388
	mov	eax, DWORD PTR _j$590[ebp]
	cmp	DWORD PTR _size1$591[ebp], eax
	jne	$L595
; Line 390
	mov	WORD PTR _this_reg$[ebp], 0
; Line 391
$L597:
	dec	DWORD PTR _j$590[ebp]
	js	$L598
; Line 392
	mov	eax, 1
	mov	ecx, DWORD PTR _j$590[ebp]
	add	ecx, DWORD PTR _regno$585[ebp]
	shl	eax, cl
	movsx	ecx, WORD PTR _this_reg$[ebp]
	or	eax, ecx
	mov	WORD PTR _this_reg$[ebp], ax
	jmp	$L597
$L598:
; Line 393
	mov	eax, DWORD PTR _born_insn$[ebp]
	mov	DWORD PTR _ins$[ebp], eax
	jmp	$L599
$L600:
	inc	DWORD PTR _ins$[ebp]
$L599:
	mov	eax, DWORD PTR _dead_insn$[ebp]
	cmp	DWORD PTR _ins$[ebp], eax
	jge	$L601
; Line 395
	mov	eax, DWORD PTR _ins$[ebp]
	mov	ecx, DWORD PTR _after_insn_hard_regs$S494
	movsx	eax, WORD PTR [ecx+eax*2]
	movsx	ecx, WORD PTR _this_reg$[ebp]
	or	eax, ecx
	mov	ecx, DWORD PTR _ins$[ebp]
	mov	edx, DWORD PTR _after_insn_hard_regs$S494
	mov	WORD PTR [edx+ecx*2], ax
; Line 396
	jmp	$L600
$L601:
; Line 397
	mov	eax, DWORD PTR _regno$585[ebp]
	jmp	$L574
; Line 400
$L595:
	mov	eax, DWORD PTR _j$590[ebp]
	add	DWORD PTR _i$[ebp], eax
; Line 403
$L589:
	jmp	$L583
$L584:
; Line 404
	mov	eax, -1
	jmp	$L574
; Line 405
$L574:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_stupid_find_reg ENDP
_TEXT	ENDS
EXTRN	_rtx_length:BYTE
EXTRN	_rtx_format:BYTE
_TEXT	SEGMENT
_x$ = 8
_insn$ = 12
_code$ = -12
_fmt$ = -8
_regno$ = -16
_i$ = -4
_j$613 = -20
_where_born$619 = -24
_j$628 = -28
_j$639 = -32
_stupid_mark_refs PROC NEAR
; Line 414
	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H
	push	ebx
	push	esi
	push	edi
; Line 415
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$[ebp], eax
; Line 419
	cmp	DWORD PTR _code$[ebp], 25		; 00000019H
	je	$L610
	cmp	DWORD PTR _code$[ebp], 27		; 0000001bH
	jne	$L609
$L610:
; Line 421
	mov	eax, DWORD PTR _x$[ebp]
	cmp	DWORD PTR [eax+4], 0
	je	$L611
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L611
; Line 424
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _regno$[ebp], eax
; Line 427
	cmp	DWORD PTR _regno$[ebp], 10		; 0000000aH
	jge	$L612
; Line 430
	cmp	DWORD PTR _regno$[ebp], 8
	jl	$L648
	mov	DWORD PTR _j$613[ebp], 1
	jmp	$L649
$L648:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
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
	mov	DWORD PTR _j$613[ebp], eax
$L649:
; Line 431
$L615:
	dec	DWORD PTR _j$613[ebp]
	js	$L616
; Line 433
	mov	eax, DWORD PTR _j$613[ebp]
	mov	ecx, DWORD PTR _regno$[ebp]
	mov	BYTE PTR _regs_ever_live[eax+ecx], 1
; Line 434
	mov	eax, DWORD PTR _j$613[ebp]
	add	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _regs_live$S493
	mov	BYTE PTR [eax+ecx], 0
; Line 437
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _uid_suid$S485
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _after_insn_hard_regs$S494
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	edx, 1
	mov	cl, BYTE PTR _regno$[ebp]
	shl	edx, cl
	or	eax, edx
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	mov	edx, DWORD PTR _uid_suid$S485
	mov	ecx, DWORD PTR [edx+ecx*4]
	mov	edx, DWORD PTR _after_insn_hard_regs$S494
	mov	WORD PTR [edx+ecx*2], ax
; Line 440
	cmp	DWORD PTR _code$[ebp], 27		; 0000001bH
	jne	$L617
; Line 442
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _uid_suid$S485
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _after_insn_hard_regs$S494
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	edx, 1
	mov	cl, BYTE PTR _regno$[ebp]
	shl	edx, cl
	or	eax, edx
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	mov	edx, DWORD PTR _uid_suid$S485
	mov	ecx, DWORD PTR [edx+ecx*4]
	mov	edx, DWORD PTR _after_insn_hard_regs$S494
	mov	WORD PTR [edx+ecx*2], ax
; Line 443
$L617:
	jmp	$L615
$L616:
; Line 447
	jmp	$L618
$L612:
; Line 453
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _uid_suid$S485
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _code$[ebp]
	sub	ecx, 27					; 0000001bH
	cmp	ecx, 1
	sbb	ecx, ecx
	neg	ecx
	sub	eax, ecx
	mov	DWORD PTR _where_born$619[ebp], eax
; Line 455
	mov	eax, DWORD PTR _where_born$619[ebp]
	mov	ecx, DWORD PTR _regno$[ebp]
	mov	edx, DWORD PTR _reg_where_born$S490
	mov	DWORD PTR [edx+ecx*4], eax
; Line 459
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _reg_where_dead$S489
	mov	edx, DWORD PTR _where_born$619[ebp]
	inc	edx
	cmp	DWORD PTR [ecx+eax*4], edx
	jge	$L620
; Line 460
	mov	eax, DWORD PTR _where_born$619[ebp]
	inc	eax
	mov	ecx, DWORD PTR _regno$[ebp]
	mov	edx, DWORD PTR _reg_where_dead$S489
	mov	DWORD PTR [edx+ecx*4], eax
; Line 463
$L620:
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _reg_n_refs
	inc	WORD PTR [ecx+eax*2]
; Line 465
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _reg_where_dead$S489
	mov	edx, DWORD PTR _last_call_suid$S486
	cmp	DWORD PTR [ecx+eax*4], edx
	jle	$L621
; Line 466
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _reg_n_calls_crossed
	inc	DWORD PTR [ecx+eax*4]
; Line 467
$L621:
; Line 468
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _reg_where_dead$S489
	mov	edx, DWORD PTR _last_jump_suid$S487
	cmp	DWORD PTR [ecx+eax*4], edx
	jg	$L623
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _reg_where_dead$S489
	mov	edx, DWORD PTR _last_label_suid$S488
	cmp	DWORD PTR [ecx+eax*4], edx
	jle	$L622
$L623:
; Line 469
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _reg_crosses_blocks$S491
	mov	BYTE PTR [eax+ecx], 1
; Line 470
$L622:
$L618:
; Line 475
$L611:
	cmp	DWORD PTR _code$[ebp], 25		; 00000019H
	jne	$L624
; Line 477
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_stupid_mark_refs
	add	esp, 8
; Line 478
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L625
; Line 479
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_stupid_mark_refs
	add	esp, 8
; Line 480
$L625:
; Line 481
$L624:
	jmp	$L604
; Line 486
$L609:
	cmp	DWORD PTR _code$[ebp], 34		; 00000022H
	jne	$L626
; Line 488
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _regno$[ebp], eax
; Line 489
	cmp	DWORD PTR _regno$[ebp], 10		; 0000000aH
	jge	$L627
; Line 492
	cmp	DWORD PTR _regno$[ebp], 8
	jl	$L650
	mov	DWORD PTR _j$628[ebp], 1
	jmp	$L651
$L650:
	mov	eax, DWORD PTR _x$[ebp]
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
	mov	DWORD PTR _j$628[ebp], eax
$L651:
; Line 493
$L630:
	dec	DWORD PTR _j$628[ebp]
	js	$L631
; Line 495
	mov	eax, DWORD PTR _j$628[ebp]
	mov	ecx, DWORD PTR _regno$[ebp]
	mov	BYTE PTR _regs_ever_live[eax+ecx], 1
; Line 496
	mov	eax, DWORD PTR _j$628[ebp]
	add	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _regs_live$S493
	mov	BYTE PTR [eax+ecx], 1
; Line 497
	jmp	$L630
$L631:
; Line 499
	jmp	$L632
$L627:
; Line 503
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _uid_suid$S485
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _regno$[ebp]
	mov	edx, DWORD PTR _reg_where_born$S490
	mov	DWORD PTR [edx+ecx*4], eax
; Line 504
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _reg_n_refs
	inc	WORD PTR [ecx+eax*2]
; Line 505
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _regs_live$S493
	movsx	eax, BYTE PTR [eax+ecx]
	or	eax, eax
	jne	$L633
; Line 507
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _regs_live$S493
	mov	BYTE PTR [eax+ecx], 1
; Line 508
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _uid_suid$S485
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _regno$[ebp]
	mov	edx, DWORD PTR _reg_where_dead$S489
	mov	DWORD PTR [edx+ecx*4], eax
; Line 510
$L633:
$L632:
; Line 511
	jmp	$L604
; Line 516
$L626:
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_format[eax*4]
	mov	DWORD PTR _fmt$[ebp], eax
; Line 517
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_length[eax*4]
	dec	eax
	mov	DWORD PTR _i$[ebp], eax
	jmp	$L634
$L635:
	dec	DWORD PTR _i$[ebp]
$L634:
	cmp	DWORD PTR _i$[ebp], 0
	jl	$L636
; Line 519
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 101				; 00000065H
	jne	$L637
; Line 520
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	push	eax
	call	_stupid_mark_refs
	add	esp, 8
; Line 521
$L637:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 69					; 00000045H
	jne	$L638
; Line 524
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	eax, DWORD PTR [eax]
	dec	eax
	mov	DWORD PTR _j$639[ebp], eax
	jmp	$L640
$L641:
	dec	DWORD PTR _j$639[ebp]
$L640:
	cmp	DWORD PTR _j$639[ebp], 0
	jl	$L642
; Line 525
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$639[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	push	eax
	call	_stupid_mark_refs
	add	esp, 8
	jmp	$L641
$L642:
; Line 527
$L638:
	jmp	$L635
$L636:
; Line 528
$L604:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_stupid_mark_refs ENDP
_TEXT	ENDS
END
