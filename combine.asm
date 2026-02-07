	TITLE	combine.c
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
PUBLIC	_combine_instructions
EXTRN	_find_reg_note:NEAR
EXTRN	_alloca:NEAR
EXTRN	_memset:NEAR
EXTRN	_init_recog:NEAR
_BSS	SEGMENT
_combine_attempts$S539 DD 01H DUP (?)
_distrib_attempts$S540 DD 01H DUP (?)
_combine_merges$S541 DD 01H DUP (?)
_distrib_merges_1$S542 DD 01H DUP (?)
_distrib_merges_2$S543 DD 01H DUP (?)
_combine_extras$S544 DD 01H DUP (?)
_combine_successes$S545 DD 01H DUP (?)
_distrib_successes$S546 DD 01H DUP (?)
_total_attempts$S547 DD 01H DUP (?)
_total_merges$S548 DD 01H DUP (?)
_total_extras$S549 DD 01H DUP (?)
_total_successes$S550 DD 01H DUP (?)
_uid_cuid$S555 DD 01H DUP (?)
_reg_last_death$S556 DD 01H DUP (?)
_reg_last_set$S557 DD 01H DUP (?)
_mem_last_set$S558 DD 01H DUP (?)
_last_call_cuid$S559 DD 01H DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
; File combine.c
_f$ = 8
_nregs$ = 12
_insn$ = -16
_i$ = -4
_links$ = -20
_nextlinks$ = -12
_prev$ = -8
_try_from$637 = -24
_combine_instructions PROC NEAR
; Line 211
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	push	ebx
	push	esi
	push	edi
; Line 217
	mov	DWORD PTR _combine_attempts$S539, 0
; Line 218
	mov	DWORD PTR _combine_merges$S541, 0
; Line 219
	mov	DWORD PTR _combine_extras$S544, 0
; Line 220
	mov	DWORD PTR _combine_successes$S545, 0
; Line 221
	mov	DWORD PTR _distrib_attempts$S540, 0
; Line 222
	mov	DWORD PTR _distrib_merges_1$S542, 0
; Line 223
	mov	DWORD PTR _distrib_merges_2$S543, 0
; Line 224
	mov	DWORD PTR _distrib_successes$S546, 0
; Line 226
	mov	eax, DWORD PTR _nregs$[ebp]
	shl	eax, 2
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _reg_last_death$S556, eax
; Line 227
	mov	eax, DWORD PTR _nregs$[ebp]
	shl	eax, 2
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _reg_last_set$S557, eax
; Line 228
	mov	eax, DWORD PTR _nregs$[ebp]
	shl	eax, 2
	push	eax
	push	0
	mov	eax, DWORD PTR _reg_last_death$S556
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 229
	mov	eax, DWORD PTR _nregs$[ebp]
	shl	eax, 2
	push	eax
	push	0
	mov	eax, DWORD PTR _reg_last_set$S557
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 231
	call	_init_recog
; Line 235
	mov	eax, DWORD PTR _f$[ebp]
	mov	DWORD PTR _insn$[ebp], eax
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L597
$L598:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _insn$[ebp], eax
$L597:
	cmp	DWORD PTR _insn$[ebp], 0
	je	$L599
; Line 236
	mov	eax, DWORD PTR _insn$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	DWORD PTR [eax+4], ecx
	jle	$L600
; Line 237
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _i$[ebp], eax
; Line 239
$L600:
	jmp	$L598
$L599:
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax*4+4]
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _uid_cuid$S555, eax
; Line 245
	mov	eax, DWORD PTR _f$[ebp]
	mov	DWORD PTR _insn$[ebp], eax
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L601
$L602:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _insn$[ebp], eax
$L601:
	cmp	DWORD PTR _insn$[ebp], 0
	je	$L603
; Line 246
	inc	DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	mov	edx, DWORD PTR _uid_cuid$S555
	mov	DWORD PTR [edx+ecx*4], eax
	jmp	$L602
$L603:
; Line 250
	mov	DWORD PTR _last_call_cuid$S559, 0
; Line 251
	mov	DWORD PTR _mem_last_set$S558, 0
; Line 252
	mov	DWORD PTR _prev$[ebp], 0
; Line 254
	mov	eax, DWORD PTR _f$[ebp]
	mov	DWORD PTR _insn$[ebp], eax
	jmp	$L604
$L605:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _insn$[ebp], eax
$L604:
	cmp	DWORD PTR _insn$[ebp], 0
	je	$L606
; Line 258
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 851968				; 000d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L608
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 983040				; 000f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L608
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 917504				; 000e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L607
$L608:
; Line 260
$retry$609:
; Line 263
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _links$[ebp], eax
	jmp	$L610
$L611:
	mov	eax, DWORD PTR _links$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _links$[ebp], eax
$L610:
	cmp	DWORD PTR _links$[ebp], 0
	je	$L612
; Line 264
	push	0
	mov	eax, DWORD PTR _links$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_try_combine
	add	esp, 12					; 0000000cH
	or	eax, eax
	je	$L613
; Line 265
	jmp	$retry$609
; Line 269
$L613:
	jmp	$L611
$L612:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _links$[ebp], eax
	jmp	$L614
$L615:
	mov	eax, DWORD PTR _links$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _links$[ebp], eax
$L614:
	cmp	DWORD PTR _links$[ebp], 0
	je	$L616
; Line 270
	mov	eax, DWORD PTR _links$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1179648				; 00120000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L617
; Line 272
	mov	eax, DWORD PTR _links$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _nextlinks$[ebp], eax
	jmp	$L618
$L619:
	mov	eax, DWORD PTR _nextlinks$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _nextlinks$[ebp], eax
$L618:
	cmp	DWORD PTR _nextlinks$[ebp], 0
	je	$L620
; Line 273
	mov	eax, DWORD PTR _nextlinks$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _links$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_try_combine
	add	esp, 12					; 0000000cH
	or	eax, eax
	je	$L621
; Line 274
	jmp	$retry$609
; Line 283
$L621:
	jmp	$L619
$L620:
$L617:
	jmp	$L615
$L616:
; Line 287
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 917504				; 000e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L622
	cmp	DWORD PTR _prev$[ebp], 0
	je	$L622
	mov	eax, DWORD PTR _prev$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 851968				; 000d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L622
	mov	eax, DWORD PTR _prev$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L622
	mov	eax, DWORD PTR _prev$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2621440				; 00280000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L622
; Line 289
	push	0
	mov	eax, DWORD PTR _prev$[ebp]
	push	eax
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_try_combine
	add	esp, 12					; 0000000cH
	or	eax, eax
	je	$L623
; Line 290
	jmp	$retry$609
; Line 292
$L623:
	mov	eax, DWORD PTR _prev$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1179648				; 00120000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L624
; Line 294
	mov	eax, DWORD PTR _prev$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _nextlinks$[ebp], eax
	jmp	$L625
$L626:
	mov	eax, DWORD PTR _nextlinks$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _nextlinks$[ebp], eax
$L625:
	cmp	DWORD PTR _nextlinks$[ebp], 0
	je	$L627
; Line 295
	mov	eax, DWORD PTR _nextlinks$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _prev$[ebp]
	push	eax
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_try_combine
	add	esp, 12					; 0000000cH
	or	eax, eax
	je	$L628
; Line 296
	jmp	$retry$609
; Line 297
$L628:
	jmp	$L626
$L627:
$L624:
; Line 301
$L622:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _links$[ebp], eax
	jmp	$L629
$L630:
	mov	eax, DWORD PTR _links$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _links$[ebp], eax
$L629:
	cmp	DWORD PTR _links$[ebp], 0
	je	$L631
; Line 302
	mov	eax, DWORD PTR _links$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1179648				; 00120000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L632
; Line 303
	mov	eax, DWORD PTR _links$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _nextlinks$[ebp], eax
	jmp	$L633
$L634:
	mov	eax, DWORD PTR _nextlinks$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _nextlinks$[ebp], eax
$L633:
	cmp	DWORD PTR _nextlinks$[ebp], 0
	je	$L635
; Line 304
	mov	eax, DWORD PTR _nextlinks$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1179648				; 00120000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L636
; Line 306
	mov	DWORD PTR _try_from$637[ebp], 0
; Line 311
	mov	eax, DWORD PTR _links$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L638
	mov	eax, DWORD PTR _links$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	1
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_find_reg_note
	add	esp, 12					; 0000000cH
	or	eax, eax
	je	$L638
	mov	eax, DWORD PTR _nextlinks$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L638
	mov	eax, DWORD PTR _nextlinks$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	1
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_find_reg_note
	add	esp, 12					; 0000000cH
	or	eax, eax
	je	$L638
; Line 312
	mov	eax, DWORD PTR _nextlinks$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _links$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_try_distrib
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _try_from$637[ebp], eax
; Line 313
$L638:
	cmp	DWORD PTR _try_from$637[ebp], 0
	je	$L639
; Line 315
	mov	eax, DWORD PTR _try_from$637[ebp]
	mov	DWORD PTR _insn$[ebp], eax
; Line 316
	jmp	$retry$609
; Line 318
$L639:
; Line 340
$L636:
	jmp	$L634
$L635:
$L632:
	jmp	$L630
$L631:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1179648				; 00120000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L640
; Line 341
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_record_dead_and_set_regs
	add	esp, 4
; Line 342
$L640:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	DWORD PTR _prev$[ebp], eax
; Line 344
	jmp	$L641
$L607:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1179648				; 00120000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L642
; Line 345
	mov	DWORD PTR _prev$[ebp], 0
; Line 346
$L642:
$L641:
	jmp	$L605
$L606:
; Line 347
	mov	eax, DWORD PTR _combine_attempts$S539
	add	DWORD PTR _total_attempts$S547, eax
; Line 348
	mov	eax, DWORD PTR _combine_merges$S541
	add	DWORD PTR _total_merges$S548, eax
; Line 349
	mov	eax, DWORD PTR _combine_extras$S544
	add	DWORD PTR _total_extras$S549, eax
; Line 350
	mov	eax, DWORD PTR _combine_successes$S545
	add	DWORD PTR _total_successes$S550, eax
; Line 351
$L588:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_combine_instructions ENDP
_TEXT	ENDS
PUBLIC	_remove_death
EXTRN	_stack_pointer_rtx:DWORD
EXTRN	_recog:NEAR
EXTRN	_rtvec_alloc:NEAR
EXTRN	_gen_rtx:NEAR
EXTRN	_basic_block_live_at_start:DWORD
EXTRN	_reg_used_between_p:NEAR
EXTRN	_reg_mentioned_p:NEAR
EXTRN	_sets_cc0_p:NEAR
EXTRN	_flag_combine_regs:DWORD
EXTRN	_dead_or_set_p:NEAR
EXTRN	_max_reg_num:NEAR
EXTRN	_next_insn_tests_no_inequality:NEAR
EXTRN	_abort:NEAR
EXTRN	_reg_n_refs:DWORD
EXTRN	_reg_n_sets:DWORD
EXTRN	_oballoc:NEAR
EXTRN	_memcpy:NEAR
EXTRN	_volatile_refs_p:NEAR
EXTRN	_cc0_rtx:DWORD
_BSS	SEGMENT
_subst_insn$S560 DD 01H DUP (?)
_undobuf$S564 DB 080H DUP (?)
_n_occurrences$S565 DD 01H DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
_i3$ = 8
_i2$ = 12
_i1$ = 16
_insn$710 = -68
_end$711 = -72
_newpat$ = -48
_added_sets_1$ = -16
_regno$777 = -84
_added_sets_2$ = -28
_total_sets$ = -44
_i2_is_used$ = -40
_link$ = -36
_insn_code_number$ = -8
_i2dest$ = -32
_i2src$ = -12
_i1dest$ = -56
_i1src$ = -52
_maxreg$ = -24
_temp$ = -4
_i$ = -20
_i3dest$694 = -60
_old$762 = -76
_old$765 = -80
_insn$702 = -64
_try_combine PROC NEAR
; Line 364
	push	ebp
	mov	ebp, esp
	sub	esp, 88					; 00000058H
	push	ebx
	push	esi
	push	edi
; Line 366
	mov	DWORD PTR _added_sets_1$[ebp], 0
; Line 367
	mov	DWORD PTR _added_sets_2$[ebp], 0
; Line 378
	inc	DWORD PTR _combine_attempts$S539
; Line 383
	mov	eax, DWORD PTR _i2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1179648				; 00120000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L662
	cmp	DWORD PTR _i1$[ebp], 0
	je	$L661
	mov	eax, DWORD PTR _i1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1179648				; 00120000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L661
$L662:
; Line 384
	sub	eax, eax
	jmp	$L646
; Line 390
$L661:
; Line 391
	mov	eax, DWORD PTR _i2$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _uid_cuid$S555
	mov	edx, DWORD PTR _last_call_cuid$S559
	cmp	DWORD PTR [ecx+eax*4], edx
	jl	$L664
	cmp	DWORD PTR _i1$[ebp], 0
	je	$L663
	mov	eax, DWORD PTR _i1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _uid_cuid$S555
	mov	edx, DWORD PTR _last_call_cuid$S559
	cmp	DWORD PTR [ecx+eax*4], edx
	jge	$L663
$L664:
; Line 392
	sub	eax, eax
	jmp	$L646
; Line 411
$L663:
	mov	eax, DWORD PTR _i2$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L665
; Line 412
	sub	eax, eax
	jmp	$L646
; Line 413
$L665:
	mov	eax, DWORD PTR _i2$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _i2dest$[ebp], eax
; Line 414
	mov	eax, DWORD PTR _i2$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _i2src$[ebp], eax
; Line 415
	mov	eax, DWORD PTR _i2dest$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L666
; Line 417
	mov	eax, DWORD PTR _i2dest$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _i2dest$[ebp], eax
; Line 418
	push	0
	mov	eax, DWORD PTR _i2src$[ebp]
	push	eax
	mov	eax, DWORD PTR _i2dest$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	35					; 00000023H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	DWORD PTR _i2src$[ebp], eax
; Line 421
$L666:
	mov	eax, DWORD PTR _i2dest$[ebp]
	cmp	DWORD PTR _stack_pointer_rtx, eax
	jne	$L667
; Line 422
	sub	eax, eax
	jmp	$L646
; Line 427
$L667:
; Line 428
	mov	eax, DWORD PTR _i2src$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L668
	mov	eax, DWORD PTR _i2src$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, DWORD PTR _i2src$[ebp]
	mov	ecx, DWORD PTR [ecx]
	shl	ecx, 8
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L668
; Line 429
	sub	eax, eax
	jmp	$L646
; Line 430
$L668:
; Line 443
	mov	eax, DWORD PTR _i2dest$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2621440				; 00280000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L669
	mov	eax, DWORD PTR _i2dest$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L670
	mov	eax, DWORD PTR _i2src$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L671
	mov	eax, DWORD PTR _i3$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L672
	mov	eax, DWORD PTR _i3$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _i2src$[ebp]
	cmp	DWORD PTR [eax+4], ecx
	je	$L671
$L672:
	cmp	DWORD PTR _flag_combine_regs, 0
	je	$L670
	mov	eax, DWORD PTR _i2src$[ebp]
	cmp	DWORD PTR [eax+4], 0
	je	$L670
	mov	eax, DWORD PTR _i2src$[ebp]
	cmp	DWORD PTR [eax+4], 8
	je	$L670
$L671:
	mov	eax, DWORD PTR _i2src$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1835008				; 001c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L670
	mov	eax, DWORD PTR _i2dest$[ebp]
	push	eax
	push	2
	mov	eax, DWORD PTR _i3$[ebp]
	push	eax
	call	_find_reg_note
	add	esp, 12					; 0000000cH
	or	eax, eax
	jne	$L670
	mov	eax, DWORD PTR _i2$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _uid_cuid$S555
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	mov	eax, DWORD PTR _i2src$[ebp]
	push	eax
	call	_use_crosses_set_p
	add	esp, 8
	or	eax, eax
	je	$L669
$L670:
; Line 444
	sub	eax, eax
	jmp	$L646
; Line 445
$L669:
	mov	eax, DWORD PTR _i2src$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1441792				; 00160000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L673
	mov	eax, DWORD PTR _i2src$[ebp]
	mov	eax, DWORD PTR [eax]
	shr	eax, 27					; 0000001bH
	test	al, 1
	je	$L673
; Line 446
	sub	eax, eax
	jmp	$L646
; Line 448
$L673:
	mov	eax, DWORD PTR _i3$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1310720				; 00140000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L674
; Line 449
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L675
$L676:
	inc	DWORD PTR _i$[ebp]
$L675:
	mov	eax, DWORD PTR _i3$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	DWORD PTR [eax], ecx
	jbe	$L677
; Line 451
	mov	eax, DWORD PTR _i3$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1769472				; 001b0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L678
	mov	eax, DWORD PTR _i3$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	mov	ecx, DWORD PTR _i2dest$[ebp]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L678
; Line 452
	sub	eax, eax
	jmp	$L646
; Line 454
$L678:
	jmp	$L676
$L677:
$L674:
	cmp	DWORD PTR _i1$[ebp], 0
	je	$L679
; Line 456
	mov	eax, DWORD PTR _i1$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L680
; Line 457
	sub	eax, eax
	jmp	$L646
; Line 458
$L680:
	mov	eax, DWORD PTR _i1$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _i1dest$[ebp], eax
; Line 459
	mov	eax, DWORD PTR _i1$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _i1src$[ebp], eax
; Line 460
	mov	eax, DWORD PTR _i1dest$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L681
; Line 462
	mov	eax, DWORD PTR _i1dest$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _i1dest$[ebp], eax
; Line 463
	push	0
	mov	eax, DWORD PTR _i1src$[ebp]
	push	eax
	mov	eax, DWORD PTR _i1dest$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	35					; 00000023H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	DWORD PTR _i1src$[ebp], eax
; Line 465
$L681:
	mov	eax, DWORD PTR _stack_pointer_rtx
	cmp	DWORD PTR _i1dest$[ebp], eax
	jne	$L682
; Line 466
	sub	eax, eax
	jmp	$L646
; Line 467
$L682:
; Line 468
	mov	eax, DWORD PTR _i1src$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L683
	mov	eax, DWORD PTR _i1src$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, DWORD PTR _i1src$[ebp]
	mov	ecx, DWORD PTR [ecx]
	shl	ecx, 8
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L683
; Line 470
	sub	eax, eax
	jmp	$L646
; Line 471
$L683:
; Line 479
	mov	eax, DWORD PTR _i1dest$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2621440				; 00280000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L684
	mov	eax, DWORD PTR _i1dest$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L685
	mov	eax, DWORD PTR _i1src$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L686
	cmp	DWORD PTR _flag_combine_regs, 0
	je	$L685
	mov	eax, DWORD PTR _i1src$[ebp]
	cmp	DWORD PTR [eax+4], 0
	je	$L685
	mov	eax, DWORD PTR _i1src$[ebp]
	cmp	DWORD PTR [eax+4], 8
	je	$L685
$L686:
	mov	eax, DWORD PTR _i1src$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1835008				; 001c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L685
	mov	eax, DWORD PTR _i1dest$[ebp]
	push	eax
	push	2
	mov	eax, DWORD PTR _i3$[ebp]
	push	eax
	call	_find_reg_note
	add	esp, 12					; 0000000cH
	or	eax, eax
	jne	$L685
	mov	eax, DWORD PTR _i1dest$[ebp]
	push	eax
	push	2
	mov	eax, DWORD PTR _i2$[ebp]
	push	eax
	call	_find_reg_note
	add	esp, 12					; 0000000cH
	or	eax, eax
	jne	$L685
	mov	eax, DWORD PTR _i1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _uid_cuid$S555
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	mov	eax, DWORD PTR _i1src$[ebp]
	push	eax
	call	_use_crosses_set_p
	add	esp, 8
	or	eax, eax
	je	$L684
$L685:
; Line 480
	sub	eax, eax
	jmp	$L646
; Line 481
$L684:
	mov	eax, DWORD PTR _i1src$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1441792				; 00160000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L687
	mov	eax, DWORD PTR _i1src$[ebp]
	mov	eax, DWORD PTR [eax]
	shr	eax, 27					; 0000001bH
	test	al, 1
	je	$L687
; Line 482
	sub	eax, eax
	jmp	$L646
; Line 484
$L687:
	mov	eax, DWORD PTR _i3$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1310720				; 00140000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L688
; Line 485
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L689
$L690:
	inc	DWORD PTR _i$[ebp]
$L689:
	mov	eax, DWORD PTR _i3$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	DWORD PTR [eax], ecx
	jbe	$L691
; Line 487
	mov	eax, DWORD PTR _i3$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1769472				; 001b0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L692
	mov	eax, DWORD PTR _i3$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	mov	ecx, DWORD PTR _i1dest$[ebp]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L692
; Line 488
	sub	eax, eax
	jmp	$L646
; Line 489
$L692:
	jmp	$L690
$L691:
$L688:
; Line 493
$L679:
	mov	eax, DWORD PTR _i3$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L693
; Line 495
	mov	eax, DWORD PTR _i3$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _i3dest$694[ebp], eax
; Line 499
$L696:
	mov	eax, DWORD PTR _i3dest$694[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L698
	mov	eax, DWORD PTR _i3dest$694[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2359296				; 00240000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L698
	mov	eax, DWORD PTR _i3dest$694[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 5832704				; 00590000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L698
	mov	eax, DWORD PTR _i3dest$694[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 5898240				; 005a0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L697
$L698:
; Line 500
	mov	eax, DWORD PTR _i3dest$694[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _i3dest$694[ebp], eax
	jmp	$L696
$L697:
; Line 504
	mov	eax, DWORD PTR _i3$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _i2dest$[ebp]
	cmp	DWORD PTR [eax+8], ecx
	jne	$L699
	mov	eax, DWORD PTR _i3dest$694[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L699
	mov	eax, DWORD PTR _i3dest$694[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, DWORD PTR _i2dest$[ebp]
	mov	ecx, DWORD PTR [ecx]
	shl	ecx, 8
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L699
; Line 505
	sub	eax, eax
	jmp	$L646
; Line 506
$L699:
; Line 510
$L693:
	mov	eax, DWORD PTR _i2$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_volatile_refs_p
	add	esp, 4
	or	eax, eax
	je	$L701
; Line 513
	mov	eax, DWORD PTR _i2$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _insn$702[ebp], eax
	jmp	$L703
$L704:
	mov	eax, DWORD PTR _insn$702[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _insn$702[ebp], eax
$L703:
	mov	eax, DWORD PTR _insn$702[ebp]
	cmp	DWORD PTR _i3$[ebp], eax
	je	$L705
; Line 515
	mov	eax, DWORD PTR _insn$702[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 851968				; 000d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L707
	mov	eax, DWORD PTR _insn$702[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 983040				; 000f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L707
	mov	eax, DWORD PTR _insn$702[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 917504				; 000e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L706
$L707:
; Line 516
	mov	eax, DWORD PTR _insn$702[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_volatile_refs_p
	add	esp, 4
	or	eax, eax
	je	$L708
; Line 517
	sub	eax, eax
	jmp	$L646
; Line 518
$L708:
$L706:
	jmp	$L704
$L705:
; Line 521
$L701:
	cmp	DWORD PTR _i1$[ebp], 0
	je	$L709
	mov	eax, DWORD PTR _i1$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_volatile_refs_p
	add	esp, 4
	or	eax, eax
	je	$L709
; Line 524
	mov	eax, DWORD PTR _i2$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_volatile_refs_p
	add	esp, 4
	or	eax, eax
	je	$L1475
	mov	eax, DWORD PTR _i2$[ebp]
	mov	DWORD PTR _end$711[ebp], eax
	jmp	$L1476
$L1475:
	mov	eax, DWORD PTR _i3$[ebp]
	mov	DWORD PTR _end$711[ebp], eax
$L1476:
; Line 525
	mov	eax, DWORD PTR _i1$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _insn$710[ebp], eax
	jmp	$L712
$L713:
	mov	eax, DWORD PTR _insn$710[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _insn$710[ebp], eax
$L712:
	mov	eax, DWORD PTR _insn$710[ebp]
	cmp	DWORD PTR _end$711[ebp], eax
	je	$L714
; Line 527
	mov	eax, DWORD PTR _insn$710[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 851968				; 000d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L716
	mov	eax, DWORD PTR _insn$710[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 983040				; 000f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L716
	mov	eax, DWORD PTR _insn$710[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 917504				; 000e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L715
$L716:
; Line 528
	mov	eax, DWORD PTR _insn$710[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_volatile_refs_p
	add	esp, 4
	or	eax, eax
	je	$L717
; Line 529
	sub	eax, eax
	jmp	$L646
; Line 530
$L717:
$L715:
	jmp	$L713
$L714:
; Line 537
$L709:
	mov	eax, DWORD PTR _i2$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR _link$[ebp], eax
	jmp	$L718
$L719:
	mov	eax, DWORD PTR _link$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _link$[ebp], eax
$L718:
	cmp	DWORD PTR _link$[ebp], 0
	je	$L720
; Line 541
	mov	eax, DWORD PTR _link$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 33554432				; 02000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L723
	mov	eax, DWORD PTR _i3$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 917504				; 000e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L724
	mov	eax, DWORD PTR _i3$[ebp]
	push	eax
	mov	eax, DWORD PTR _i2$[ebp]
	push	eax
	mov	eax, DWORD PTR _link$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_reg_used_between_p
	add	esp, 12					; 0000000cH
	or	eax, eax
	jne	$L724
	mov	eax, DWORD PTR _i3$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	mov	eax, DWORD PTR _link$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_reg_mentioned_p
	add	esp, 8
	or	eax, eax
	je	$L723
$L724:
; Line 542
	sub	eax, eax
	jmp	$L646
; Line 544
$L723:
	jmp	$L719
$L720:
	cmp	DWORD PTR _i1$[ebp], 0
	je	$L725
; Line 545
	mov	eax, DWORD PTR _i1$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR _link$[ebp], eax
	jmp	$L726
$L727:
	mov	eax, DWORD PTR _link$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _link$[ebp], eax
$L726:
	cmp	DWORD PTR _link$[ebp], 0
	je	$L728
; Line 549
	mov	eax, DWORD PTR _link$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 33554432				; 02000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L729
	mov	eax, DWORD PTR _i3$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 917504				; 000e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L730
	mov	eax, DWORD PTR _i3$[ebp]
	push	eax
	mov	eax, DWORD PTR _i1$[ebp]
	push	eax
	mov	eax, DWORD PTR _link$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_reg_used_between_p
	add	esp, 12					; 0000000cH
	or	eax, eax
	jne	$L730
	mov	eax, DWORD PTR _i3$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	mov	eax, DWORD PTR _link$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_reg_mentioned_p
	add	esp, 8
	or	eax, eax
	je	$L729
$L730:
; Line 550
	sub	eax, eax
	jmp	$L646
; Line 554
$L729:
	jmp	$L727
$L728:
$L725:
; Line 558
	mov	eax, DWORD PTR _i3$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L732
	mov	eax, DWORD PTR _i3$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L732
	mov	eax, DWORD PTR _i3$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L732
	mov	eax, DWORD PTR _i3$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 4325376				; 00420000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L731
	mov	eax, DWORD PTR _i3$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 4259840				; 00410000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L731
$L732:
; Line 560
	mov	eax, DWORD PTR _i3$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR _link$[ebp], eax
	jmp	$L733
$L734:
	mov	eax, DWORD PTR _link$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _link$[ebp], eax
$L733:
	cmp	DWORD PTR _link$[ebp], 0
	je	$L735
; Line 564
	mov	eax, DWORD PTR _link$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 33554432				; 02000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L736
	mov	eax, DWORD PTR _i2$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	mov	eax, DWORD PTR _link$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_reg_mentioned_p
	add	esp, 8
	or	eax, eax
	jne	$L737
	cmp	DWORD PTR _i1$[ebp], 0
	je	$L736
	mov	eax, DWORD PTR _i1$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	mov	eax, DWORD PTR _link$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_reg_mentioned_p
	add	esp, 8
	or	eax, eax
	je	$L736
$L737:
; Line 565
	sub	eax, eax
	jmp	$L646
; Line 571
$L736:
	jmp	$L734
$L735:
$L731:
	mov	eax, DWORD PTR _i2$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _temp$[ebp], eax
; Line 572
$L739:
	cmp	DWORD PTR _temp$[ebp], 0
	je	$L740
	mov	eax, DWORD PTR _temp$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1179648				; 00120000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L740
; Line 573
	mov	eax, DWORD PTR _temp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _temp$[ebp], eax
	jmp	$L739
$L740:
; Line 574
	cmp	DWORD PTR _temp$[ebp], 0
	je	$L742
	mov	eax, DWORD PTR _temp$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 851968				; 000d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L742
	mov	eax, DWORD PTR _temp$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_sets_cc0_p
	add	esp, 4
	or	eax, eax
	je	$L742
; Line 575
	sub	eax, eax
	jmp	$L646
; Line 576
$L742:
	cmp	DWORD PTR _i1$[ebp], 0
	je	$L743
; Line 578
	mov	eax, DWORD PTR _i2$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _temp$[ebp], eax
; Line 579
$L745:
	cmp	DWORD PTR _temp$[ebp], 0
	je	$L746
	mov	eax, DWORD PTR _temp$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1179648				; 00120000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L746
; Line 580
	mov	eax, DWORD PTR _temp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _temp$[ebp], eax
	jmp	$L745
$L746:
; Line 581
	cmp	DWORD PTR _temp$[ebp], 0
	je	$L747
	mov	eax, DWORD PTR _temp$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 851968				; 000d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L747
	mov	eax, DWORD PTR _temp$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_sets_cc0_p
	add	esp, 4
	or	eax, eax
	je	$L747
; Line 582
	sub	eax, eax
	jmp	$L646
; Line 583
$L747:
; Line 587
$L743:
; Line 588
	mov	eax, DWORD PTR _i2dest$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2621440				; 00280000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1477
	mov	eax, DWORD PTR _i2dest$[ebp]
	push	eax
	mov	eax, DWORD PTR _i3$[ebp]
	push	eax
	call	_dead_or_set_p
	add	esp, 8
	or	eax, eax
	jne	$L1477
	mov	DWORD PTR _added_sets_2$[ebp], 1
	jmp	$L1478
$L1477:
	mov	DWORD PTR _added_sets_2$[ebp], 0
$L1478:
; Line 589
	cmp	DWORD PTR _i1$[ebp], 0
	je	$L749
; Line 591
	mov	eax, DWORD PTR _i1dest$[ebp]
	push	eax
	mov	eax, DWORD PTR _i3$[ebp]
	push	eax
	call	_dead_or_set_p
	add	esp, 8
	or	eax, eax
	jne	$L1479
	mov	eax, DWORD PTR _i1dest$[ebp]
	push	eax
	mov	eax, DWORD PTR _i2$[ebp]
	push	eax
	call	_dead_or_set_p
	add	esp, 8
	or	eax, eax
	jne	$L1479
	mov	DWORD PTR _added_sets_1$[ebp], 1
	jmp	$L1480
$L1479:
	mov	DWORD PTR _added_sets_1$[ebp], 0
$L1480:
; Line 593
$L749:
	inc	DWORD PTR _combine_merges$S541
; Line 595
	mov	DWORD PTR _undobuf$S564, 0
; Line 596
	mov	DWORD PTR _undobuf$S564+4, 0
; Line 600
	call	_max_reg_num
	mov	DWORD PTR _maxreg$[ebp], eax
; Line 602
	mov	eax, DWORD PTR _i3$[ebp]
	mov	DWORD PTR _subst_insn$S560, eax
; Line 603
	mov	DWORD PTR _n_occurrences$S565, 0
; Line 605
	mov	eax, DWORD PTR _i2src$[ebp]
	push	eax
	mov	eax, DWORD PTR _i2dest$[ebp]
	push	eax
	mov	eax, DWORD PTR _i3$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_subst
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _newpat$[ebp], eax
; Line 607
	mov	eax, DWORD PTR _n_occurrences$S565
	mov	DWORD PTR _i2_is_used$[ebp], eax
; Line 609
	cmp	DWORD PTR _i1$[ebp], 0
	je	$L751
; Line 611
	mov	DWORD PTR _n_occurrences$S565, 0
; Line 612
	mov	eax, DWORD PTR _i1src$[ebp]
	push	eax
	mov	eax, DWORD PTR _i1dest$[ebp]
	push	eax
	mov	eax, DWORD PTR _newpat$[ebp]
	push	eax
	call	_subst
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _newpat$[ebp], eax
; Line 615
$L751:
; Line 619
	mov	eax, DWORD PTR _i3$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L753
	mov	eax, DWORD PTR _i3$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _cc0_rtx
	cmp	DWORD PTR [eax+4], ecx
	jne	$L753
	mov	eax, DWORD PTR _i3$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3473408				; 00350000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L754
	mov	eax, DWORD PTR _i3$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3997696				; 003d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L753
$L754:
	mov	eax, DWORD PTR _i3$[ebp]
	push	eax
	call	_next_insn_tests_no_inequality
	add	esp, 4
	or	eax, eax
	je	$L753
; Line 620
	mov	eax, DWORD PTR _i3$[ebp]
	push	eax
	call	_simplify_set_cc0_and
	add	esp, 4
; Line 622
$L753:
	call	_max_reg_num
	cmp	eax, DWORD PTR _maxreg$[ebp]
	je	$L755
; Line 623
	call	_abort
; Line 630
$L755:
	cmp	DWORD PTR _added_sets_1$[ebp], 0
	jne	$L758
	cmp	DWORD PTR _added_sets_2$[ebp], 0
	je	$L757
$L758:
; Line 632
	inc	DWORD PTR _combine_extras$S544
; Line 636
	cmp	DWORD PTR _undobuf$S564+4, 0
	jne	$L759
; Line 637
	push	0
	call	_oballoc
	add	esp, 4
	mov	DWORD PTR _undobuf$S564+4, eax
; Line 639
$L759:
	mov	eax, DWORD PTR _newpat$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1310720				; 00140000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L761
; Line 641
	mov	eax, DWORD PTR _newpat$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _old$762[ebp], eax
; Line 642
	mov	eax, DWORD PTR _newpat$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	add	eax, DWORD PTR _added_sets_2$[ebp]
	add	eax, DWORD PTR _added_sets_1$[ebp]
	mov	DWORD PTR _total_sets$[ebp], eax
; Line 643
	mov	eax, DWORD PTR _total_sets$[ebp]
	push	eax
	call	_rtvec_alloc
	add	esp, 4
	push	eax
	push	0
	push	20					; 00000014H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _newpat$[ebp], eax
; Line 645
	mov	eax, DWORD PTR _old$762[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 2
	push	eax
	mov	eax, DWORD PTR _old$762[ebp]
	add	eax, 4
	push	eax
	mov	eax, DWORD PTR _newpat$[ebp]
	mov	eax, DWORD PTR [eax+4]
	add	eax, 4
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
; Line 647
	jmp	$L764
$L761:
; Line 649
	mov	eax, DWORD PTR _newpat$[ebp]
	mov	DWORD PTR _old$765[ebp], eax
; Line 650
	mov	eax, DWORD PTR _added_sets_2$[ebp]
	add	eax, DWORD PTR _added_sets_1$[ebp]
	inc	eax
	mov	DWORD PTR _total_sets$[ebp], eax
; Line 651
	mov	eax, DWORD PTR _total_sets$[ebp]
	push	eax
	call	_rtvec_alloc
	add	esp, 4
	push	eax
	push	0
	push	20					; 00000014H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _newpat$[ebp], eax
; Line 652
	mov	eax, DWORD PTR _old$765[ebp]
	mov	ecx, DWORD PTR _newpat$[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	mov	DWORD PTR [ecx+4], eax
; Line 653
$L764:
; Line 654
	cmp	DWORD PTR _added_sets_1$[ebp], 0
	je	$L766
; Line 656
	dec	DWORD PTR _total_sets$[ebp]
	mov	eax, DWORD PTR _i1$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _newpat$[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	mov	edx, DWORD PTR _total_sets$[ebp]
	mov	DWORD PTR [ecx+edx*4+4], eax
; Line 658
$L766:
	cmp	DWORD PTR _added_sets_2$[ebp], 0
	je	$L767
; Line 664
	cmp	DWORD PTR _i1$[ebp], 0
	je	$L769
	cmp	DWORD PTR _i2_is_used$[ebp], 0
	je	$L768
$L769:
; Line 666
	dec	DWORD PTR _total_sets$[ebp]
	mov	eax, DWORD PTR _i2$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _newpat$[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	mov	edx, DWORD PTR _total_sets$[ebp]
	mov	DWORD PTR [ecx+edx*4+4], eax
; Line 668
	jmp	$L770
$L768:
; Line 670
	dec	DWORD PTR _total_sets$[ebp]
	mov	eax, DWORD PTR _i1src$[ebp]
	push	eax
	mov	eax, DWORD PTR _i1dest$[ebp]
	push	eax
	mov	eax, DWORD PTR _i2$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_subst
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _newpat$[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	mov	edx, DWORD PTR _total_sets$[ebp]
	mov	DWORD PTR [ecx+edx*4+4], eax
$L770:
; Line 672
$L767:
; Line 675
$L757:
; Line 676
	cmp	DWORD PTR _i2_is_used$[ebp], 1
	jle	$L773
	push	0
	push	2
	mov	eax, DWORD PTR _i2$[ebp]
	push	eax
	call	_find_reg_note
	add	esp, 12					; 0000000cH
	or	eax, eax
	jne	$L772
$L773:
	cmp	DWORD PTR _i1$[ebp], 0
	je	$L771
	cmp	DWORD PTR _n_occurrences$S565, 1
	jle	$L771
	push	0
	push	2
	mov	eax, DWORD PTR _i1$[ebp]
	push	eax
	call	_find_reg_note
	add	esp, 12					; 0000000cH
	or	eax, eax
	je	$L771
$L772:
; Line 678
	call	_undo_all
; Line 679
	sub	eax, eax
	jmp	$L646
; Line 683
$L771:
	mov	eax, DWORD PTR _i3$[ebp]
	push	eax
	mov	eax, DWORD PTR _newpat$[ebp]
	push	eax
	call	_recog
	add	esp, 8
	mov	DWORD PTR _insn_code_number$[ebp], eax
; Line 687
	cmp	DWORD PTR _insn_code_number$[ebp], 0
	jge	$L776
	mov	eax, DWORD PTR _newpat$[ebp]
	push	eax
	call	_check_asm_operands
	add	esp, 4
	or	eax, eax
	je	$L775
	cmp	DWORD PTR _added_sets_1$[ebp], 0
	jne	$L775
	cmp	DWORD PTR _added_sets_2$[ebp], 0
	jne	$L775
$L776:
; Line 691
	mov	eax, DWORD PTR _insn_code_number$[ebp]
	mov	ecx, DWORD PTR _i3$[ebp]
	mov	DWORD PTR [ecx+20], eax
; Line 692
	mov	eax, DWORD PTR _newpat$[ebp]
	mov	ecx, DWORD PTR _i3$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 695
	call	_copy_substitutions
; Line 706
	mov	eax, DWORD PTR _i3$[ebp]
	push	eax
	mov	eax, DWORD PTR _i2$[ebp]
	push	eax
	call	_adjacent_insns_p
	add	esp, 8
	push	eax
	mov	eax, DWORD PTR _i2$[ebp]
	push	eax
	mov	eax, DWORD PTR _i3$[ebp]
	push	eax
	call	_add_links
	add	esp, 12					; 0000000cH
; Line 708
	mov	eax, DWORD PTR _i3$[ebp]
	push	eax
	mov	eax, DWORD PTR _i2$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _uid_cuid$S555
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	mov	eax, DWORD PTR _i2src$[ebp]
	push	eax
	call	_move_deaths
	add	esp, 12					; 0000000cH
; Line 709
	mov	eax, DWORD PTR _i2dest$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	edx, 2228224				; 00220000H
	and	edx, -65536				; ffff0000H
	cmp	eax, edx
	jne	$L778
; Line 713
	mov	eax, DWORD PTR _i2dest$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _regno$777[ebp], eax
; Line 714
	cmp	DWORD PTR _added_sets_2$[ebp], 0
	jne	$L779
; Line 716
	mov	eax, DWORD PTR _regno$777[ebp]
	mov	edx, DWORD PTR _reg_n_sets
	dec	WORD PTR [edx+eax*2]
; Line 720
	mov	eax, DWORD PTR _regno$777[ebp]
	mov	edx, DWORD PTR _reg_n_sets
	movsx	eax, WORD PTR [edx+eax*2]
	or	eax, eax
	jne	$L780
	mov	eax, DWORD PTR _regno$777[ebp]
	cdq
	and	edx, 31					; 0000001fH
	add	eax, edx
	sar	eax, 5
	mov	edx, DWORD PTR _basic_block_live_at_start
	mov	edx, DWORD PTR [edx]
	mov	ebx, DWORD PTR [edx+eax*4]
	mov	esi, 1
	mov	eax, DWORD PTR _regno$777[ebp]
	cdq
	xor	eax, edx
	sub	eax, edx
	and	eax, 31					; 0000001fH
	xor	eax, edx
	sub	eax, edx
	mov	cl, al
	shl	esi, cl
	test	ebx, esi
	jne	$L780
; Line 721
	mov	eax, DWORD PTR _regno$777[ebp]
	mov	ecx, DWORD PTR _reg_n_refs
	mov	WORD PTR [ecx+eax*2], 0
; Line 722
$L780:
; Line 727
$L779:
; Line 728
	cmp	DWORD PTR _added_sets_2$[ebp], 0
	jne	$L781
	mov	eax, DWORD PTR _i3$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	mov	eax, DWORD PTR _i2dest$[ebp]
	push	eax
	call	_reg_mentioned_p
	add	esp, 8
	or	eax, eax
	jne	$L781
; Line 729
	mov	eax, DWORD PTR _i3$[ebp]
	push	eax
	mov	eax, DWORD PTR _regno$777[ebp]
	push	eax
	call	_remove_death
	add	esp, 8
; Line 730
$L781:
; Line 733
$L778:
	mov	eax, DWORD PTR _i2$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	mov	eax, DWORD PTR _i3$[ebp]
	push	eax
	call	_add_incs
	add	esp, 8
; Line 734
	cmp	DWORD PTR _i1$[ebp], 0
	je	$L782
; Line 738
	mov	eax, DWORD PTR _i2$[ebp]
	push	eax
	mov	eax, DWORD PTR _i1$[ebp]
	push	eax
	call	_adjacent_insns_p
	add	esp, 8
	or	eax, eax
	je	$L1481
	mov	eax, DWORD PTR _i3$[ebp]
	push	eax
	mov	eax, DWORD PTR _i2$[ebp]
	push	eax
	call	_adjacent_insns_p
	add	esp, 8
	or	eax, eax
	je	$L1481
	mov	DWORD PTR -88+[ebp], 1
	jmp	$L1482
$L1481:
	mov	DWORD PTR -88+[ebp], 0
$L1482:
	mov	eax, DWORD PTR -88+[ebp]
	push	eax
	mov	eax, DWORD PTR _i1$[ebp]
	push	eax
	mov	eax, DWORD PTR _i3$[ebp]
	push	eax
	call	_add_links
	add	esp, 12					; 0000000cH
; Line 739
	mov	eax, DWORD PTR _i3$[ebp]
	push	eax
	mov	eax, DWORD PTR _i1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _uid_cuid$S555
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	mov	eax, DWORD PTR _i1src$[ebp]
	push	eax
	call	_move_deaths
	add	esp, 12					; 0000000cH
; Line 740
	mov	eax, DWORD PTR _i1dest$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	edx, 2228224				; 00220000H
	and	edx, -65536				; ffff0000H
	cmp	eax, edx
	jne	$L783
; Line 742
	mov	eax, DWORD PTR _i1dest$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _regno$777[ebp], eax
; Line 743
	cmp	DWORD PTR _added_sets_1$[ebp], 0
	jne	$L784
; Line 745
	mov	eax, DWORD PTR _regno$777[ebp]
	mov	edx, DWORD PTR _reg_n_sets
	dec	WORD PTR [edx+eax*2]
; Line 750
	mov	eax, DWORD PTR _regno$777[ebp]
	mov	edx, DWORD PTR _reg_n_sets
	movsx	eax, WORD PTR [edx+eax*2]
	or	eax, eax
	jne	$L785
	mov	eax, DWORD PTR _regno$777[ebp]
	cdq
	and	edx, 31					; 0000001fH
	add	eax, edx
	sar	eax, 5
	mov	edx, DWORD PTR _basic_block_live_at_start
	mov	edx, DWORD PTR [edx]
	mov	ebx, DWORD PTR [edx+eax*4]
	mov	esi, 1
	mov	eax, DWORD PTR _regno$777[ebp]
	cdq
	xor	eax, edx
	sub	eax, edx
	and	eax, 31					; 0000001fH
	xor	eax, edx
	sub	eax, edx
	mov	cl, al
	shl	esi, cl
	test	ebx, esi
	jne	$L785
; Line 752
	mov	eax, DWORD PTR _regno$777[ebp]
	mov	ecx, DWORD PTR _reg_n_refs
	mov	WORD PTR [ecx+eax*2], 0
; Line 753
$L785:
; Line 758
$L784:
; Line 759
	cmp	DWORD PTR _added_sets_1$[ebp], 0
	jne	$L786
	mov	eax, DWORD PTR _i3$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	mov	eax, DWORD PTR _i1dest$[ebp]
	push	eax
	call	_reg_mentioned_p
	add	esp, 8
	or	eax, eax
	jne	$L786
; Line 760
	mov	eax, DWORD PTR _i3$[ebp]
	push	eax
	mov	eax, DWORD PTR _regno$777[ebp]
	push	eax
	call	_remove_death
	add	esp, 8
; Line 761
$L786:
; Line 762
$L783:
	mov	eax, DWORD PTR _i1$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	mov	eax, DWORD PTR _i3$[ebp]
	push	eax
	call	_add_incs
	add	esp, 8
; Line 763
	mov	eax, DWORD PTR _i1$[ebp]
	mov	DWORD PTR [eax+24], 0
; Line 764
	mov	eax, DWORD PTR _i1$[ebp]
	mov	eax, DWORD PTR [eax]
	and	eax, -65518				; ffff0012H
	or	eax, 18					; 00000012H
	mov	ecx, DWORD PTR _i1$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 765
	mov	eax, DWORD PTR _i1$[ebp]
	mov	DWORD PTR [eax+20], -1
; Line 766
	mov	eax, DWORD PTR _i1$[ebp]
	mov	DWORD PTR [eax+16], 0
; Line 769
$L782:
	mov	eax, DWORD PTR _i2$[ebp]
	mov	DWORD PTR [eax+24], 0
; Line 770
	mov	eax, DWORD PTR _i2$[ebp]
	mov	eax, DWORD PTR [eax]
	and	eax, -65518				; ffff0012H
	or	eax, 18					; 00000012H
	mov	ecx, DWORD PTR _i2$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 771
	mov	eax, DWORD PTR _i2$[ebp]
	mov	DWORD PTR [eax+20], -1
; Line 772
	mov	eax, DWORD PTR _i2$[ebp]
	mov	DWORD PTR [eax+16], 0
; Line 774
	inc	DWORD PTR _combine_successes$S545
; Line 775
	mov	eax, 1
	jmp	$L646
; Line 779
$L775:
	call	_undo_all
; Line 781
	sub	eax, eax
	jmp	$L646
; Line 782
$L646:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_try_combine ENDP
_TEXT	ENDS
EXTRN	_obfree:NEAR
_TEXT	SEGMENT
_i$ = -4
_undo_all PROC NEAR
; Line 788
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 790
	cmp	DWORD PTR _undobuf$S564, 10		; 0000000aH
	jle	$L789
; Line 791
	mov	DWORD PTR _undobuf$S564, 10		; 0000000aH
; Line 792
$L789:
	mov	eax, DWORD PTR _undobuf$S564
	dec	eax
	mov	DWORD PTR _i$[ebp], eax
	jmp	$L790
$L791:
	dec	DWORD PTR _i$[ebp]
$L790:
	cmp	DWORD PTR _i$[ebp], 0
	jl	$L792
; Line 793
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	mov	eax, DWORD PTR _undobuf$S564[eax*4+12]
	mov	ecx, DWORD PTR _i$[ebp]
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	ecx, DWORD PTR _undobuf$S564[ecx*4+8]
	mov	DWORD PTR [ecx], eax
	jmp	$L791
$L792:
; Line 794
	cmp	DWORD PTR _undobuf$S564+4, 0
	je	$L793
; Line 795
	mov	eax, DWORD PTR _undobuf$S564+4
	push	eax
	call	_obfree
	add	esp, 4
; Line 796
$L793:
	mov	DWORD PTR _undobuf$S564, 0
; Line 797
	mov	DWORD PTR _undobuf$S564+4, 0
; Line 798
$L787:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_undo_all ENDP
_TEXT	ENDS
EXTRN	_copy_rtx:NEAR
_TEXT	SEGMENT
_i$ = -4
_copy_substitutions PROC NEAR
; Line 805
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 807
	cmp	DWORD PTR _undobuf$S564, 1
	jle	$L797
; Line 809
	mov	eax, DWORD PTR _undobuf$S564
	dec	eax
	mov	DWORD PTR _i$[ebp], eax
	jmp	$L798
$L799:
	dec	DWORD PTR _i$[ebp]
$L798:
	cmp	DWORD PTR _i$[ebp], 1
	jl	$L800
; Line 810
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	cmp	DWORD PTR _undobuf$S564[eax*4+16], 0
	jne	$L801
; Line 811
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	mov	eax, DWORD PTR _undobuf$S564[eax*4+8]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_copy_rtx
	add	esp, 4
	mov	ecx, DWORD PTR _i$[ebp]
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	ecx, DWORD PTR _undobuf$S564[ecx*4+8]
	mov	DWORD PTR [ecx], eax
; Line 812
$L801:
	jmp	$L799
$L800:
; Line 813
$L797:
$L795:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_copy_substitutions ENDP
_TEXT	ENDS
EXTRN	_rtx_length:BYTE
EXTRN	_rtx_equal_p:NEAR
EXTRN	_rtx_format:BYTE
EXTRN	_subreg_lowpart_p:NEAR
EXTRN	_mode_dependent_address_p:NEAR
EXTRN	_mode_size:BYTE
EXTRN	_plus_constant:NEAR
EXTRN	_const0_rtx:DWORD
EXTRN	_const1_rtx:DWORD
_DATA	SEGMENT
$SG819	DB	'ie', 00H
	ORG $+1
$SG821	DB	'ie', 00H
_DATA	ENDS
_TEXT	SEGMENT
_y$960 = -64
_temp$898 = -44
_new$840 = -32
_shiftcount$1035 = -88
_newmask$1036 = -84
_sum$915 = -48
_tem$1047 = -92
_intval$983 = -68
_c0$1051 = -104
_c1$1052 = -96
_combined$1053 = -100
_tmp$993 = -72
_u$866 = -36
_x$ = 8
_offset$931 = -60
_from$ = 12
_base$932 = -56
_to$ = 16
_index$933 = -52
_fmt$ = -4
_len$ = -20
_i$ = -12
_code$ = -16
_was_replaced$ = -8
_intval$1005 = -76
_endian_offset$878 = -40
_shift$1078 = -112
_newpos$1079 = -108
_tmp$1015 = -80
_j$826 = -24
_new$830 = -28
_subst	PROC NEAR
; Line 832
	push	ebp
	mov	ebp, esp
	sub	esp, 156				; 0000009cH
	push	ebx
	push	esi
	push	edi
; Line 874
	mov	eax, DWORD PTR _x$[ebp]
	cmp	DWORD PTR _from$[ebp], eax
	jne	$L811
; Line 875
	mov	eax, DWORD PTR _to$[ebp]
	jmp	$L805
; Line 883
$L811:
	mov	eax, DWORD PTR _x$[ebp]
	cmp	DWORD PTR _to$[ebp], eax
	jne	$L812
; Line 884
	mov	eax, DWORD PTR _to$[ebp]
	jmp	$L805
; Line 886
$L812:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$[ebp], eax
; Line 889
	mov	eax, DWORD PTR _code$[ebp]
	mov	DWORD PTR -152+[ebp], eax
	jmp	$L813
; Line 892
$L817:
; Line 899
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L805
; Line 900
	jmp	$L814
$L813:
	cmp	DWORD PTR -152+[ebp], 30		; 0000001eH
	je	$L817
	cmp	DWORD PTR -152+[ebp], 32		; 00000020H
	jl	$L814
	cmp	DWORD PTR -152+[ebp], 34		; 00000022H
	jle	$L817
	cmp	DWORD PTR -152+[ebp], 38		; 00000026H
	jl	$L814
	cmp	DWORD PTR -152+[ebp], 40		; 00000028H
	jle	$L817
	jmp	$L814
$L814:
; Line 902
	mov	BYTE PTR _was_replaced$[ebp], 0
; Line 903
	mov	BYTE PTR _was_replaced$[ebp+1], 0
; Line 905
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_length[eax*4]
	mov	DWORD PTR _len$[ebp], eax
; Line 906
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_format[eax*4]
	mov	DWORD PTR _fmt$[ebp], eax
; Line 909
	cmp	DWORD PTR _code$[ebp], 25		; 00000019H
	jne	$L818
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR _from$[ebp]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L818
; Line 910
	mov	DWORD PTR _fmt$[ebp], OFFSET $SG819
; Line 911
$L818:
; Line 912
	cmp	DWORD PTR _code$[ebp], 25		; 00000019H
	jne	$L820
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L820
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _from$[ebp]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L820
; Line 913
	mov	DWORD PTR _fmt$[ebp], OFFSET $SG821
; Line 915
$L820:
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L822
$L823:
	inc	DWORD PTR _i$[ebp]
$L822:
	mov	eax, DWORD PTR _len$[ebp]
	cmp	DWORD PTR _i$[ebp], eax
	jge	$L824
; Line 917
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 69					; 00000045H
	jne	$L825
; Line 920
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	eax, DWORD PTR [eax]
	dec	eax
	mov	DWORD PTR _j$826[ebp], eax
	jmp	$L827
$L828:
	dec	DWORD PTR _j$826[ebp]
$L827:
	cmp	DWORD PTR _j$826[ebp], 0
	jl	$L829
; Line 923
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$826[ebp]
	mov	edx, DWORD PTR _from$[ebp]
	cmp	DWORD PTR [eax+ecx*4+4], edx
	jne	$L831
; Line 924
	mov	eax, DWORD PTR _to$[ebp]
	mov	DWORD PTR _new$830[ebp], eax
	inc	DWORD PTR _n_occurrences$S565
; Line 925
	jmp	$L832
$L831:
; Line 926
	mov	eax, DWORD PTR _to$[ebp]
	push	eax
	mov	eax, DWORD PTR _from$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$826[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	push	eax
	call	_subst
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _new$830[ebp], eax
$L832:
; Line 927
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$826[ebp]
	mov	edx, DWORD PTR _new$830[ebp]
	cmp	DWORD PTR [eax+ecx*4+4], edx
	je	$L833
; Line 928
$L834:
	cmp	DWORD PTR _undobuf$S564, 10		; 0000000aH
	jge	$L837
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$826[ebp]
	lea	eax, DWORD PTR [eax+ecx*4]
	add	eax, 4
	mov	ecx, DWORD PTR _undobuf$S564
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	DWORD PTR _undobuf$S564[ecx*4+8], eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$826[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	mov	ecx, DWORD PTR _undobuf$S564
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	DWORD PTR _undobuf$S564[ecx*4+12], eax
	mov	eax, DWORD PTR _undobuf$S564
	lea	eax, DWORD PTR [eax+eax*2]
	mov	DWORD PTR _undobuf$S564[eax*4+16], 0
	mov	eax, DWORD PTR _new$830[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR [edx+ecx*4+4]
	mov	edx, DWORD PTR _j$826[ebp]
	mov	DWORD PTR [ecx+edx*4+4], eax
$L837:
	inc	DWORD PTR _undobuf$S564
$L835:
$L836:
; Line 929
$L833:
	jmp	$L828
$L829:
; Line 931
	jmp	$L838
$L825:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 101				; 00000065H
	jne	$L839
; Line 935
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	edx, DWORD PTR _from$[ebp]
	cmp	DWORD PTR [ecx+eax*4+4], edx
	jne	$L841
; Line 937
	mov	eax, DWORD PTR _to$[ebp]
	mov	DWORD PTR _new$840[ebp], eax
; Line 938
	inc	DWORD PTR _n_occurrences$S565
; Line 939
	cmp	DWORD PTR _i$[ebp], 2
	jge	$L842
; Line 940
	mov	eax, DWORD PTR _i$[ebp]
	mov	BYTE PTR _was_replaced$[ebp+eax], 1
; Line 941
$L842:
; Line 942
	jmp	$L843
$L841:
; Line 943
	mov	eax, DWORD PTR _to$[ebp]
	push	eax
	mov	eax, DWORD PTR _from$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	push	eax
	call	_subst
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _new$840[ebp], eax
$L843:
; Line 945
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	edx, DWORD PTR _new$840[ebp]
	cmp	DWORD PTR [ecx+eax*4+4], edx
	je	$L844
; Line 946
$L845:
	cmp	DWORD PTR _undobuf$S564, 10		; 0000000aH
	jge	$L848
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 2
	add	eax, DWORD PTR _x$[ebp]
	add	eax, 4
	mov	ecx, DWORD PTR _undobuf$S564
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	DWORD PTR _undobuf$S564[ecx*4+8], eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _undobuf$S564
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	DWORD PTR _undobuf$S564[ecx*4+12], eax
	mov	eax, DWORD PTR _undobuf$S564
	lea	eax, DWORD PTR [eax+eax*2]
	mov	DWORD PTR _undobuf$S564[eax*4+16], 0
	mov	eax, DWORD PTR _new$840[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [edx+ecx*4+4], eax
$L848:
	inc	DWORD PTR _undobuf$S564
$L846:
$L847:
; Line 947
$L844:
; Line 948
$L839:
$L838:
	jmp	$L823
$L824:
; Line 951
	mov	eax, DWORD PTR _code$[ebp]
	mov	DWORD PTR -156+[ebp], eax
	jmp	$L849
; Line 953
$L853:
; Line 957
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR _to$[ebp]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L854
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L854
; Line 959
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR [ecx]
	shl	ecx, 8
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L855
; Line 960
	mov	eax, DWORD PTR _x$[ebp]
	cmp	DWORD PTR [eax+8], 0
	jne	$L856
	mov	eax, DWORD PTR _to$[ebp]
	cmp	DWORD PTR [eax+8], 0
	jne	$L856
; Line 961
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+4]
	jmp	$L805
; Line 962
$L856:
$L855:
$L857:
	cmp	DWORD PTR _undobuf$S564, 10		; 0000000aH
	jge	$L860
	mov	eax, DWORD PTR _x$[ebp]
	add	eax, 4
	mov	ecx, DWORD PTR _undobuf$S564
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	DWORD PTR _undobuf$S564[ecx*4+8], eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _undobuf$S564
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	DWORD PTR _undobuf$S564[ecx*4+12], eax
	mov	eax, DWORD PTR _undobuf$S564
	lea	eax, DWORD PTR [eax+eax*2]
	mov	DWORD PTR _undobuf$S564[eax*4+16], 0
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [ecx+4], eax
$L860:
	inc	DWORD PTR _undobuf$S564
$L858:
$L859:
; Line 963
	mov	eax, DWORD PTR _to$[ebp]
	cmp	DWORD PTR [eax+8], 0
	je	$L861
; Line 964
$L862:
	cmp	DWORD PTR _undobuf$S564, 10		; 0000000aH
	jge	$L865
	mov	eax, DWORD PTR _undobuf$S564
	lea	eax, DWORD PTR [eax+eax*2]
	lea	eax, DWORD PTR _undobuf$S564[eax*4]
	add	eax, 8
	mov	DWORD PTR _u$866[ebp], eax
	mov	eax, DWORD PTR _x$[ebp]
	add	eax, 8
	mov	ecx, DWORD PTR _u$866[ebp]
	mov	DWORD PTR [ecx], eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _u$866[ebp]
	mov	DWORD PTR [ecx+4], eax
	mov	eax, DWORD PTR _u$866[ebp]
	mov	DWORD PTR [eax+8], 1
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _x$[ebp]
	add	DWORD PTR [ecx+8], eax
$L865:
	inc	DWORD PTR _undobuf$S564
$L863:
$L864:
; Line 965
$L861:
; Line 966
$L854:
; Line 968
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR _to$[ebp]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L867
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 5046272				; 004d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L868
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 5111808				; 004e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L867
$L868:
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_subreg_lowpart_p
	add	esp, 4
	or	eax, eax
	je	$L867
; Line 971
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR [ecx]
	shl	ecx, 8
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L869
; Line 972
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+4]
	jmp	$L805
; Line 975
$L869:
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	ecx, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR [ecx]
	shl	ecx, 8
	and	ecx, -16777216				; ff000000H
	sar	ecx, 22					; 00000016H
	mov	ecx, DWORD PTR _mode_size[ecx]
	cmp	DWORD PTR _mode_size[eax], ecx
	jge	$L870
; Line 977
	cmp	DWORD PTR _undobuf$S564+4, 0
	jne	$L871
; Line 978
	push	0
	call	_oballoc
	add	esp, 4
	mov	DWORD PTR _undobuf$S564+4, eax
; Line 979
$L871:
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	push	eax
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	jmp	$L805
; Line 983
$L870:
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	ecx, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR [ecx]
	shl	ecx, 8
	and	ecx, -16777216				; ff000000H
	sar	ecx, 22					; 00000016H
	mov	ecx, DWORD PTR _mode_size[ecx]
	cmp	DWORD PTR _mode_size[eax], ecx
	jle	$L872
; Line 985
$L873:
	cmp	DWORD PTR _undobuf$S564, 10		; 0000000aH
	jge	$L876
	mov	eax, DWORD PTR _x$[ebp]
	add	eax, 4
	mov	ecx, DWORD PTR _undobuf$S564
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	DWORD PTR _undobuf$S564[ecx*4+8], eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _undobuf$S564
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	DWORD PTR _undobuf$S564[ecx*4+12], eax
	mov	eax, DWORD PTR _undobuf$S564
	lea	eax, DWORD PTR [eax+eax*2]
	mov	DWORD PTR _undobuf$S564[eax*4+16], 0
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [ecx+4], eax
$L876:
	inc	DWORD PTR _undobuf$S564
$L874:
$L875:
; Line 987
$L872:
; Line 993
$L867:
; Line 994
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR _to$[ebp]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L877
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L877
; Line 996
	mov	DWORD PTR _endian_offset$878[ebp], 0
; Line 998
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	ecx, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR [ecx]
	shl	ecx, 8
	and	ecx, -16777216				; ff000000H
	sar	ecx, 22					; 00000016H
	mov	ecx, DWORD PTR _mode_size[ecx]
	cmp	DWORD PTR _mode_size[eax], ecx
	jge	$L879
; Line 999
	mov	eax, DWORD PTR _const0_rtx
	push	eax
	push	0
	push	27					; 0000001bH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	jmp	$L805
; Line 1002
$L879:
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_mode_dependent_address_p
	add	esp, 4
	or	eax, eax
	je	$L881
; Line 1003
	mov	eax, DWORD PTR _const0_rtx
	push	eax
	push	0
	push	27					; 0000001bH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	jmp	$L805
; Line 1010
$L881:
	cmp	DWORD PTR _undobuf$S564+4, 0
	jne	$L882
; Line 1011
	push	0
	call	_oballoc
	add	esp, 4
	mov	DWORD PTR _undobuf$S564+4, eax
; Line 1014
$L882:
; Line 1017
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	shl	eax, 2
	add	eax, DWORD PTR _endian_offset$878[ebp]
	push	eax
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_plus_constant
	add	esp, 8
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	37					; 00000025H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	jmp	$L805
; Line 1019
$L877:
	jmp	$L850
; Line 1021
$L883:
; Line 1025
	movsx	eax, BYTE PTR _was_replaced$[ebp]
	or	eax, eax
	je	$L884
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L886
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], -1
	je	$L885
$L886:
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2949120				; 002d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L884
	mov	eax, DWORD PTR _to$[ebp]
	mov	ecx, DWORD PTR _const1_rtx
	cmp	DWORD PTR [eax+8], ecx
	jne	$L884
$L885:
; Line 1027
	cmp	DWORD PTR _undobuf$S564+4, 0
	jne	$L887
; Line 1028
	push	0
	call	_oballoc
	add	esp, 4
	mov	DWORD PTR _undobuf$S564+4, eax
; Line 1029
$L887:
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	46					; 0000002eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	jmp	$L805
; Line 1032
$L884:
; Line 1033
	movsx	eax, BYTE PTR _was_replaced$[ebp]
	or	eax, eax
	je	$L888
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	cmp	eax, DWORD PTR _code$[ebp]
	jne	$L888
; Line 1034
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+4]
	jmp	$L805
; Line 1035
$L888:
	jmp	$L850
; Line 1037
$L889:
; Line 1039
	movsx	eax, BYTE PTR _was_replaced$[ebp]
	or	eax, eax
	je	$L890
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2949120				; 002d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L890
; Line 1041
	cmp	DWORD PTR _undobuf$S564+4, 0
	jne	$L891
; Line 1042
	push	0
	call	_oballoc
	add	esp, 4
	mov	DWORD PTR _undobuf$S564+4, eax
; Line 1043
$L891:
; Line 1044
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	45					; 0000002dH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L805
; Line 1047
$L890:
; Line 1048
	movsx	eax, BYTE PTR _was_replaced$[ebp]
	or	eax, eax
	je	$L892
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	cmp	eax, DWORD PTR _code$[ebp]
	jne	$L892
; Line 1049
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+4]
	jmp	$L805
; Line 1050
$L892:
	jmp	$L850
; Line 1052
$L893:
; Line 1056
	movsx	eax, BYTE PTR _was_replaced$[ebp]
	or	eax, eax
	je	$L894
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 5242880				; 00500000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L894
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR [ecx]
	shl	ecx, 8
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L894
; Line 1057
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+4]
	jmp	$L805
; Line 1058
$L894:
	jmp	$L850
; Line 1076
$L895:
; Line 1095
	movsx	eax, BYTE PTR _was_replaced$[ebp]
	or	eax, eax
	jne	$L897
	movsx	eax, BYTE PTR _was_replaced$[ebp+1]
	or	eax, eax
	je	$L896
$L897:
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3801088				; 003a0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L896
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L896
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 32			; 00000020H
	jge	$L896
; Line 1098
	cmp	DWORD PTR _undobuf$S564+4, 0
	jne	$L899
; Line 1099
	push	0
	call	_oballoc
	add	esp, 4
	mov	DWORD PTR _undobuf$S564+4, eax
; Line 1100
$L899:
; Line 1103
	mov	eax, 1
	mov	ecx, DWORD PTR _to$[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	mov	cl, BYTE PTR [ecx+4]
	shl	eax, cl
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	47					; 0000002fH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	DWORD PTR _temp$898[ebp], eax
; Line 1104
	movsx	eax, BYTE PTR _was_replaced$[ebp]
	or	eax, eax
	je	$L900
; Line 1105
$L901:
	cmp	DWORD PTR _undobuf$S564, 10		; 0000000aH
	jge	$L904
	mov	eax, DWORD PTR _x$[ebp]
	add	eax, 4
	mov	ecx, DWORD PTR _undobuf$S564
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	DWORD PTR _undobuf$S564[ecx*4+8], eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _undobuf$S564
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	DWORD PTR _undobuf$S564[ecx*4+12], eax
	mov	eax, DWORD PTR _undobuf$S564
	lea	eax, DWORD PTR [eax+eax*2]
	mov	DWORD PTR _undobuf$S564[eax*4+16], 0
	mov	eax, DWORD PTR _temp$898[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [ecx+4], eax
$L904:
	inc	DWORD PTR _undobuf$S564
$L902:
$L903:
; Line 1106
	jmp	$L905
$L900:
; Line 1107
$L906:
	cmp	DWORD PTR _undobuf$S564, 10		; 0000000aH
	jge	$L909
	mov	eax, DWORD PTR _x$[ebp]
	add	eax, 8
	mov	ecx, DWORD PTR _undobuf$S564
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	DWORD PTR _undobuf$S564[ecx*4+8], eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _undobuf$S564
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	DWORD PTR _undobuf$S564[ecx*4+12], eax
	mov	eax, DWORD PTR _undobuf$S564
	lea	eax, DWORD PTR [eax+eax*2]
	mov	DWORD PTR _undobuf$S564[eax*4+16], 0
	mov	eax, DWORD PTR _temp$898[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [ecx+8], eax
$L909:
	inc	DWORD PTR _undobuf$S564
$L907:
$L908:
$L905:
; Line 1110
$L896:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3014656				; 002e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L910
; Line 1112
	cmp	DWORD PTR _undobuf$S564+4, 0
	jne	$L911
; Line 1113
	push	0
	call	_oballoc
	add	esp, 4
	mov	DWORD PTR _undobuf$S564+4, eax
; Line 1114
$L911:
; Line 1115
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	45					; 0000002dH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L805
; Line 1118
$L910:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3014656				; 002e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L912
; Line 1120
	cmp	DWORD PTR _undobuf$S564+4, 0
	jne	$L913
; Line 1121
	push	0
	call	_oballoc
	add	esp, 4
	mov	DWORD PTR _undobuf$S564+4, eax
; Line 1122
$L913:
; Line 1123
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	45					; 0000002dH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L805
; Line 1126
$L912:
; Line 1128
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L914
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L914
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L914
; Line 1131
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	add	eax, DWORD PTR [ecx+4]
	mov	DWORD PTR _sum$915[ebp], eax
; Line 1132
	cmp	DWORD PTR _sum$915[ebp], 0
	jne	$L916
; Line 1133
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	jmp	$L805
; Line 1134
$L916:
	cmp	DWORD PTR _undobuf$S564+4, 0
	jne	$L917
; Line 1135
	push	0
	call	_oballoc
	add	esp, 4
	mov	DWORD PTR _undobuf$S564+4, eax
; Line 1136
$L917:
$L918:
	cmp	DWORD PTR _undobuf$S564, 10		; 0000000aH
	jge	$L921
	mov	eax, DWORD PTR _x$[ebp]
	add	eax, 8
	mov	ecx, DWORD PTR _undobuf$S564
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	DWORD PTR _undobuf$S564[ecx*4+8], eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _undobuf$S564
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	DWORD PTR _undobuf$S564[ecx*4+12], eax
	mov	eax, DWORD PTR _undobuf$S564
	lea	eax, DWORD PTR [eax+eax*2]
	mov	DWORD PTR _undobuf$S564[eax*4+16], 0
	mov	eax, DWORD PTR _sum$915[ebp]
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [ecx+8], eax
$L921:
	inc	DWORD PTR _undobuf$S564
$L919:
$L920:
; Line 1137
$L922:
	cmp	DWORD PTR _undobuf$S564, 10		; 0000000aH
	jge	$L925
	mov	eax, DWORD PTR _x$[ebp]
	add	eax, 4
	mov	ecx, DWORD PTR _undobuf$S564
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	DWORD PTR _undobuf$S564[ecx*4+8], eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _undobuf$S564
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	DWORD PTR _undobuf$S564[ecx*4+12], eax
	mov	eax, DWORD PTR _undobuf$S564
	lea	eax, DWORD PTR [eax+eax*2]
	mov	DWORD PTR _undobuf$S564[eax*4+16], 0
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [ecx+4], eax
$L925:
	inc	DWORD PTR _undobuf$S564
$L923:
$L924:
; Line 1138
	jmp	$L850
; Line 1144
$L914:
; Line 1148
	movsx	eax, BYTE PTR _was_replaced$[ebp]
	or	eax, eax
	je	$L928
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L927
$L928:
	movsx	eax, BYTE PTR _was_replaced$[ebp+1]
	or	eax, eax
	je	$L929
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L927
$L929:
	movsx	eax, BYTE PTR _was_replaced$[ebp]
	or	eax, eax
	jne	$L930
	movsx	eax, BYTE PTR _was_replaced$[ebp+1]
	or	eax, eax
	je	$L926
$L930:
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L926
$L927:
; Line 1150
	mov	DWORD PTR _offset$931[ebp], 0
; Line 1151
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L934
; Line 1153
	mov	eax, DWORD PTR _to$[ebp]
	mov	DWORD PTR _index$933[ebp], eax
; Line 1154
	movsx	eax, BYTE PTR _was_replaced$[ebp]
	or	eax, eax
	je	$L1483
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _base$932[ebp], eax
	jmp	$L1484
$L1483:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _base$932[ebp], eax
$L1484:
; Line 1156
	jmp	$L935
$L934:
; Line 1158
	movsx	eax, BYTE PTR _was_replaced$[ebp]
	or	eax, eax
	je	$L1485
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _index$933[ebp], eax
	jmp	$L1486
$L1485:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _index$933[ebp], eax
$L1486:
; Line 1159
	mov	eax, DWORD PTR _to$[ebp]
	mov	DWORD PTR _base$932[ebp], eax
; Line 1160
$L935:
; Line 1161
	mov	eax, DWORD PTR _base$932[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L937
	mov	eax, DWORD PTR _base$932[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L937
	mov	eax, DWORD PTR _base$932[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L937
	mov	eax, DWORD PTR _base$932[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L936
$L937:
; Line 1163
	mov	eax, DWORD PTR _base$932[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _offset$931[ebp], eax
; Line 1164
	mov	eax, DWORD PTR _base$932[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _base$932[ebp], eax
; Line 1166
	jmp	$L938
$L936:
	mov	eax, DWORD PTR _base$932[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L940
	mov	eax, DWORD PTR _base$932[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L940
	mov	eax, DWORD PTR _base$932[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L940
	mov	eax, DWORD PTR _base$932[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L939
$L940:
; Line 1168
	mov	eax, DWORD PTR _base$932[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _offset$931[ebp], eax
; Line 1169
	mov	eax, DWORD PTR _base$932[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _base$932[ebp], eax
; Line 1171
$L939:
$L938:
	cmp	DWORD PTR _offset$931[ebp], 0
	je	$L941
; Line 1173
	cmp	DWORD PTR _undobuf$S564+4, 0
	jne	$L942
; Line 1174
	push	0
	call	_oballoc
	add	esp, 4
	mov	DWORD PTR _undobuf$S564+4, eax
; Line 1175
$L942:
	mov	eax, DWORD PTR _offset$931[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L943
; Line 1178
	mov	eax, DWORD PTR _offset$931[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _index$933[ebp]
	push	eax
	mov	eax, DWORD PTR _base$932[ebp]
	push	eax
	mov	eax, DWORD PTR _index$933[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	44					; 0000002cH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	call	_plus_constant
	add	esp, 8
	jmp	$L805
; Line 1179
$L943:
	mov	eax, DWORD PTR _index$933[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L944
; Line 1182
	mov	eax, DWORD PTR _index$933[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _offset$931[ebp]
	push	eax
	mov	eax, DWORD PTR _base$932[ebp]
	push	eax
	mov	eax, DWORD PTR _offset$931[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	44					; 0000002cH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	call	_plus_constant
	add	esp, 8
	jmp	$L805
; Line 1183
$L944:
; Line 1186
	mov	eax, DWORD PTR _offset$931[ebp]
	push	eax
	mov	eax, DWORD PTR _index$933[ebp]
	push	eax
	mov	eax, DWORD PTR _base$932[ebp]
	push	eax
	mov	eax, DWORD PTR _index$933[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	44					; 0000002cH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _index$933[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	44					; 0000002cH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L805
; Line 1188
$L941:
; Line 1189
$L926:
	jmp	$L850
; Line 1191
$L945:
; Line 1197
	movsx	eax, BYTE PTR _was_replaced$[ebp]
	or	eax, eax
	je	$L946
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L946
	mov	eax, DWORD PTR _to$[ebp]
	cmp	DWORD PTR [eax+8], 0
	jne	$L946
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR _const0_rtx
	cmp	DWORD PTR [eax+8], ecx
	jne	$L946
; Line 1198
$L947:
	cmp	DWORD PTR _undobuf$S564, 10		; 0000000aH
	jge	$L950
	mov	eax, DWORD PTR _x$[ebp]
	add	eax, 4
	mov	ecx, DWORD PTR _undobuf$S564
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	DWORD PTR _undobuf$S564[ecx*4+8], eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _undobuf$S564
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	DWORD PTR _undobuf$S564[ecx*4+12], eax
	mov	eax, DWORD PTR _undobuf$S564
	lea	eax, DWORD PTR [eax+eax*2]
	mov	DWORD PTR _undobuf$S564[eax*4+16], 0
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [ecx+4], eax
$L950:
	inc	DWORD PTR _undobuf$S564
$L948:
$L949:
; Line 1203
$L946:
; Line 1205
	movsx	eax, BYTE PTR _was_replaced$[ebp]
	or	eax, eax
	je	$L951
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 5898240				; 005a0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L951
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR _const0_rtx
	cmp	DWORD PTR [eax+8], ecx
	jne	$L951
; Line 1207
	cmp	DWORD PTR _undobuf$S564+4, 0
	jne	$L952
; Line 1208
	push	0
	call	_oballoc
	add	esp, 4
	mov	DWORD PTR _undobuf$S564+4, eax
; Line 1209
$L952:
$L953:
	cmp	DWORD PTR _undobuf$S564, 10		; 0000000aH
	jge	$L956
; Line 1212
	mov	eax, DWORD PTR _x$[ebp]
	add	eax, 4
	mov	ecx, DWORD PTR _undobuf$S564
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	DWORD PTR _undobuf$S564[ecx*4+8], eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _undobuf$S564
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	DWORD PTR _undobuf$S564[ecx*4+12], eax
	mov	eax, DWORD PTR _undobuf$S564
	lea	eax, DWORD PTR [eax+eax*2]
	mov	DWORD PTR _undobuf$S564[eax*4+16], 0
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+12]
	push	eax
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	89					; 00000059H
	call	_gen_rtx
	add	esp, 20					; 00000014H
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [ecx+4], eax
$L956:
	inc	DWORD PTR _undobuf$S564
$L954:
$L955:
; Line 1218
	jmp	$L957
$L951:
; Line 1223
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR _const0_rtx
	cmp	DWORD PTR [eax+8], ecx
	jne	$L958
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3473408				; 00350000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L958
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _to$[ebp]
	cmp	DWORD PTR [eax+4], ecx
	je	$L959
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _to$[ebp]
	cmp	DWORD PTR [eax+8], ecx
	jne	$L958
$L959:
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3801088				; 003a0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L958
	mov	eax, DWORD PTR _to$[ebp]
	mov	ecx, DWORD PTR _const1_rtx
	cmp	DWORD PTR [eax+4], ecx
	jne	$L958
; Line 1226
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	sub	eax, DWORD PTR _to$[ebp]
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	mov	ecx, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	DWORD PTR _y$960[ebp], eax
; Line 1227
	cmp	DWORD PTR _undobuf$S564+4, 0
	jne	$L961
; Line 1228
	push	0
	call	_oballoc
	add	esp, 4
	mov	DWORD PTR _undobuf$S564+4, eax
; Line 1229
$L961:
$L962:
	cmp	DWORD PTR _undobuf$S564, 10		; 0000000aH
	jge	$L965
; Line 1232
	mov	eax, DWORD PTR _x$[ebp]
	add	eax, 4
	mov	ecx, DWORD PTR _undobuf$S564
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	DWORD PTR _undobuf$S564[ecx*4+8], eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _undobuf$S564
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	DWORD PTR _undobuf$S564[ecx*4+12], eax
	mov	eax, DWORD PTR _undobuf$S564
	lea	eax, DWORD PTR [eax+eax*2]
	mov	DWORD PTR _undobuf$S564[eax*4+16], 0
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _const1_rtx
	push	eax
	mov	eax, DWORD PTR _y$960[ebp]
	push	eax
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	89					; 00000059H
	call	_gen_rtx
	add	esp, 20					; 00000014H
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [ecx+4], eax
$L965:
	inc	DWORD PTR _undobuf$S564
$L963:
$L964:
; Line 1236
$L958:
$L957:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3014656				; 002e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L966
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR _const0_rtx
	cmp	DWORD PTR [eax+8], ecx
	jne	$L966
; Line 1238
$L967:
	cmp	DWORD PTR _undobuf$S564, 10		; 0000000aH
	jge	$L970
	mov	eax, DWORD PTR _x$[ebp]
	add	eax, 4
	mov	ecx, DWORD PTR _undobuf$S564
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	DWORD PTR _undobuf$S564[ecx*4+8], eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _undobuf$S564
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	DWORD PTR _undobuf$S564[ecx*4+12], eax
	mov	eax, DWORD PTR _undobuf$S564
	lea	eax, DWORD PTR [eax+eax*2]
	mov	DWORD PTR _undobuf$S564[eax*4+16], 0
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [ecx+4], eax
$L970:
	inc	DWORD PTR _undobuf$S564
$L968:
$L969:
; Line 1240
$L966:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3014656				; 002e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L971
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR _const0_rtx
	cmp	DWORD PTR [eax+4], ecx
	jne	$L971
; Line 1242
$L972:
	cmp	DWORD PTR _undobuf$S564, 10		; 0000000aH
	jge	$L975
	mov	eax, DWORD PTR _x$[ebp]
	add	eax, 8
	mov	ecx, DWORD PTR _undobuf$S564
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	DWORD PTR _undobuf$S564[ecx*4+8], eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _undobuf$S564
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	DWORD PTR _undobuf$S564[ecx*4+12], eax
	mov	eax, DWORD PTR _undobuf$S564
	lea	eax, DWORD PTR [eax+eax*2]
	mov	DWORD PTR _undobuf$S564[eax*4+16], 0
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [ecx+8], eax
$L975:
	inc	DWORD PTR _undobuf$S564
$L973:
$L974:
; Line 1244
$L971:
	jmp	$L850
; Line 1246
$L976:
; Line 1249
	movsx	eax, BYTE PTR _was_replaced$[ebp]
	or	eax, eax
	je	$L977
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 5111808				; 004e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L977
; Line 1250
$L978:
	cmp	DWORD PTR _undobuf$S564, 10		; 0000000aH
	jge	$L981
	mov	eax, DWORD PTR _x$[ebp]
	add	eax, 4
	mov	ecx, DWORD PTR _undobuf$S564
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	DWORD PTR _undobuf$S564[ecx*4+8], eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _undobuf$S564
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	DWORD PTR _undobuf$S564[ecx*4+12], eax
	mov	eax, DWORD PTR _undobuf$S564
	lea	eax, DWORD PTR [eax+eax*2]
	mov	DWORD PTR _undobuf$S564[eax*4+16], 0
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [ecx+4], eax
$L981:
	inc	DWORD PTR _undobuf$S564
$L979:
$L980:
; Line 1253
$L977:
; Line 1255
	movsx	eax, BYTE PTR _was_replaced$[ebp]
	or	eax, eax
	je	$L982
	mov	eax, DWORD PTR _from$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	shl	eax, 3
	cmp	eax, 32					; 00000020H
	jg	$L982
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L982
; Line 1257
	mov	eax, DWORD PTR _from$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	shl	eax, 3
	cmp	eax, 32					; 00000020H
	jl	$L1487
	mov	DWORD PTR -116+[ebp], -1
	jmp	$L1488
$L1487:
	mov	eax, 1
	mov	ecx, DWORD PTR _from$[ebp]
	mov	ecx, DWORD PTR [ecx]
	shl	ecx, 8
	and	ecx, -16777216				; ff000000H
	sar	ecx, 22					; 00000016H
	mov	ecx, DWORD PTR _mode_size[ecx]
	shl	ecx, 3
	shl	eax, cl
	dec	eax
	mov	DWORD PTR -116+[ebp], eax
$L1488:
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+4]
	and	eax, DWORD PTR -116+[ebp]
	mov	DWORD PTR _intval$983[ebp], eax
; Line 1258
	cmp	DWORD PTR _undobuf$S564+4, 0
	jne	$L984
; Line 1259
	push	0
	call	_oballoc
	add	esp, 4
	mov	DWORD PTR _undobuf$S564+4, eax
; Line 1260
$L984:
	mov	eax, DWORD PTR _intval$983[ebp]
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	jmp	$L805
; Line 1264
$L982:
; Line 1271
	movsx	eax, BYTE PTR _was_replaced$[ebp]
	or	eax, eax
	je	$L985
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3473408				; 00350000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L985
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L985
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	cmp	DWORD PTR _mode_size[eax], 4
	jg	$L985
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L986
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L986
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L985
$L986:
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	shl	eax, 3
	cmp	eax, 32					; 00000020H
	jl	$L1489
	mov	DWORD PTR -120+[ebp], -1
	jmp	$L1490
$L1489:
	mov	eax, 1
	mov	ecx, DWORD PTR _to$[ebp]
	mov	ecx, DWORD PTR [ecx]
	shl	ecx, 8
	and	ecx, -16777216				; ff000000H
	sar	ecx, 22					; 00000016H
	mov	ecx, DWORD PTR _mode_size[ecx]
	shl	ecx, 3
	shl	eax, cl
	dec	eax
	mov	DWORD PTR -120+[ebp], eax
$L1490:
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR -120+[ebp]
	not	ecx
	test	DWORD PTR [eax+4], ecx
	jne	$L985
; Line 1273
	cmp	DWORD PTR _undobuf$S564+4, 0
	jne	$L987
; Line 1274
	push	0
	call	_oballoc
	add	esp, 4
	mov	DWORD PTR _undobuf$S564+4, eax
; Line 1275
$L987:
; Line 1277
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	call	_gen_lowpart_for_combine
	add	esp, 8
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	53					; 00000035H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L805
; Line 1281
$L985:
; Line 1285
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L988
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 5898240				; 005a0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L988
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L988
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	mov	ecx, DWORD PTR [ecx]
	shl	ecx, 8
	and	ecx, -16777216				; ff000000H
	sar	ecx, 22					; 00000016H
	mov	ecx, DWORD PTR _mode_size[ecx]
	shl	ecx, 3
	cmp	DWORD PTR [eax+4], ecx
	jg	$L988
; Line 1287
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	jmp	$L805
; Line 1291
$L988:
; Line 1300
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L989
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _to$[ebp]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L989
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+8], 0
	jne	$L989
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3473408				; 00350000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L989
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L989
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	cmp	DWORD PTR _mode_size[eax], 4
	jg	$L989
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L990
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L990
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L989
$L990:
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	shl	eax, 3
	cmp	eax, 32					; 00000020H
	jl	$L1491
	mov	DWORD PTR -124+[ebp], -1
	jmp	$L1492
$L1491:
	mov	eax, 1
	mov	ecx, DWORD PTR _to$[ebp]
	mov	ecx, DWORD PTR [ecx]
	shl	ecx, 8
	and	ecx, -16777216				; ff000000H
	sar	ecx, 22					; 00000016H
	mov	ecx, DWORD PTR _mode_size[ecx]
	shl	ecx, 3
	shl	eax, cl
	dec	eax
	mov	DWORD PTR -124+[ebp], eax
$L1492:
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR -124+[ebp]
	not	ecx
	test	DWORD PTR [eax+4], ecx
	jne	$L989
; Line 1302
	cmp	DWORD PTR _undobuf$S564+4, 0
	jne	$L991
; Line 1303
	push	0
	call	_oballoc
	add	esp, 4
	mov	DWORD PTR _undobuf$S564+4, eax
; Line 1304
$L991:
; Line 1306
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	call	_gen_lowpart_for_combine
	add	esp, 8
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	53					; 00000035H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L805
; Line 1311
$L989:
; Line 1314
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L992
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _to$[ebp]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L992
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+8], 0
	jne	$L992
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3997696				; 003d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L992
; Line 1316
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _tmp$993[ebp], eax
; Line 1319
	mov	eax, DWORD PTR _tmp$993[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L994
; Line 1322
	mov	eax, DWORD PTR _tmp$993[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg_n_sets
	movsx	eax, WORD PTR [ecx+eax*2]
	cmp	eax, 1
	jne	$L995
	mov	eax, DWORD PTR _tmp$993[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg_last_set$S557
	cmp	DWORD PTR [ecx+eax*4], 0
	je	$L995
	mov	eax, DWORD PTR _tmp$993[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg_last_set$S557
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _tmp$993[ebp]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L995
; Line 1323
	mov	eax, DWORD PTR _tmp$993[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg_last_set$S557
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _tmp$993[ebp], eax
; Line 1324
	jmp	$L996
$L995:
; Line 1325
	jmp	$L850
$L996:
; Line 1327
$L994:
; Line 1329
	mov	eax, DWORD PTR _tmp$993[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 5111808				; 004e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L997
	mov	eax, DWORD PTR _tmp$993[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR [ecx]
	shl	ecx, 8
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L997
	mov	eax, DWORD PTR _tmp$993[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	mov	ecx, DWORD PTR [ecx]
	shl	ecx, 8
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L997
; Line 1330
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	jmp	$L805
; Line 1331
$L997:
; Line 1332
$L992:
	jmp	$L850
; Line 1334
$L998:
; Line 1337
	movsx	eax, BYTE PTR _was_replaced$[ebp]
	or	eax, eax
	je	$L999
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 5046272				; 004d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L999
; Line 1338
$L1000:
	cmp	DWORD PTR _undobuf$S564, 10		; 0000000aH
	jge	$L1003
	mov	eax, DWORD PTR _x$[ebp]
	add	eax, 4
	mov	ecx, DWORD PTR _undobuf$S564
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	DWORD PTR _undobuf$S564[ecx*4+8], eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _undobuf$S564
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	DWORD PTR _undobuf$S564[ecx*4+12], eax
	mov	eax, DWORD PTR _undobuf$S564
	lea	eax, DWORD PTR [eax+eax*2]
	mov	DWORD PTR _undobuf$S564[eax*4+16], 0
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [ecx+4], eax
$L1003:
	inc	DWORD PTR _undobuf$S564
$L1001:
$L1002:
; Line 1341
$L999:
; Line 1343
	movsx	eax, BYTE PTR _was_replaced$[ebp]
	or	eax, eax
	je	$L1004
	mov	eax, DWORD PTR _from$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	shl	eax, 3
	cmp	eax, 32					; 00000020H
	jg	$L1004
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1004
; Line 1345
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _intval$1005[ebp], eax
; Line 1346
	cmp	DWORD PTR _undobuf$S564+4, 0
	jne	$L1006
; Line 1347
	push	0
	call	_oballoc
	add	esp, 4
	mov	DWORD PTR _undobuf$S564+4, eax
; Line 1348
$L1006:
; Line 1349
	cmp	DWORD PTR _intval$1005[ebp], 0
	jle	$L1007
	mov	eax, 1
	mov	ecx, DWORD PTR _from$[ebp]
	mov	ecx, DWORD PTR [ecx]
	shl	ecx, 8
	and	ecx, -16777216				; ff000000H
	sar	ecx, 22					; 00000016H
	mov	ecx, DWORD PTR _mode_size[ecx]
	shl	ecx, 3
	dec	ecx
	shl	eax, cl
	test	eax, DWORD PTR _intval$1005[ebp]
	je	$L1007
; Line 1350
	mov	eax, DWORD PTR _from$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	shl	eax, 3
	cmp	eax, 32					; 00000020H
	jl	$L1493
	mov	DWORD PTR -128+[ebp], -1
	jmp	$L1494
$L1493:
	mov	eax, 1
	mov	ecx, DWORD PTR _from$[ebp]
	mov	ecx, DWORD PTR [ecx]
	shl	ecx, 8
	and	ecx, -16777216				; ff000000H
	sar	ecx, 22					; 00000016H
	mov	ecx, DWORD PTR _mode_size[ecx]
	shl	ecx, 3
	shl	eax, cl
	dec	eax
	mov	DWORD PTR -128+[ebp], eax
$L1494:
	mov	eax, DWORD PTR -128+[ebp]
	not	eax
	or	DWORD PTR _intval$1005[ebp], eax
; Line 1351
$L1007:
	mov	eax, DWORD PTR _intval$1005[ebp]
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	jmp	$L805
; Line 1355
$L1004:
; Line 1361
	movsx	eax, BYTE PTR _was_replaced$[ebp]
	or	eax, eax
	je	$L1008
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3473408				; 00350000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1008
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1008
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	cmp	DWORD PTR _mode_size[eax], 4
	jg	$L1008
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1009
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1009
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1008
$L1009:
	mov	eax, -1
	mov	ecx, DWORD PTR _to$[ebp]
	mov	ecx, DWORD PTR [ecx]
	shl	ecx, 8
	and	ecx, -16777216				; ff000000H
	sar	ecx, 22					; 00000016H
	mov	ecx, DWORD PTR _mode_size[ecx]
	shl	ecx, 3
	dec	ecx
	shl	eax, cl
	mov	ecx, DWORD PTR _to$[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	test	eax, DWORD PTR [ecx+4]
	jne	$L1008
; Line 1363
	cmp	DWORD PTR _undobuf$S564+4, 0
	jne	$L1010
; Line 1364
	push	0
	call	_oballoc
	add	esp, 4
	mov	DWORD PTR _undobuf$S564+4, eax
; Line 1365
$L1010:
; Line 1367
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	call	_gen_lowpart_for_combine
	add	esp, 8
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	53					; 00000035H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L805
; Line 1373
$L1008:
; Line 1381
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1011
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _to$[ebp]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L1011
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+8], 0
	jne	$L1011
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3473408				; 00350000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1011
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1011
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	cmp	DWORD PTR _mode_size[eax], 4
	jg	$L1011
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1012
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1012
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1011
$L1012:
	mov	eax, -1
	mov	ecx, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	mov	ecx, DWORD PTR [ecx]
	shl	ecx, 8
	and	ecx, -16777216				; ff000000H
	sar	ecx, 22					; 00000016H
	mov	ecx, DWORD PTR _mode_size[ecx]
	shl	ecx, 3
	dec	ecx
	shl	eax, cl
	mov	ecx, DWORD PTR _to$[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	test	eax, DWORD PTR [ecx+4]
	jne	$L1011
; Line 1383
	cmp	DWORD PTR _undobuf$S564+4, 0
	jne	$L1013
; Line 1384
	push	0
	call	_oballoc
	add	esp, 4
	mov	DWORD PTR _undobuf$S564+4, eax
; Line 1385
$L1013:
; Line 1387
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	call	_gen_lowpart_for_combine
	add	esp, 8
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	53					; 00000035H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L805
; Line 1392
$L1011:
; Line 1395
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1014
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _to$[ebp]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L1014
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+8], 0
	jne	$L1014
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3932160				; 003c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1014
; Line 1397
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _tmp$1015[ebp], eax
; Line 1400
	mov	eax, DWORD PTR _tmp$1015[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1016
; Line 1403
	mov	eax, DWORD PTR _tmp$1015[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg_n_sets
	movsx	eax, WORD PTR [ecx+eax*2]
	cmp	eax, 1
	jne	$L1017
	mov	eax, DWORD PTR _tmp$1015[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg_last_set$S557
	cmp	DWORD PTR [ecx+eax*4], 0
	je	$L1017
	mov	eax, DWORD PTR _tmp$1015[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg_last_set$S557
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _tmp$1015[ebp]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L1017
; Line 1404
	mov	eax, DWORD PTR _tmp$1015[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg_last_set$S557
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _tmp$1015[ebp], eax
; Line 1405
	jmp	$L1018
$L1017:
; Line 1406
	jmp	$L850
$L1018:
; Line 1408
$L1016:
; Line 1410
	mov	eax, DWORD PTR _tmp$1015[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 5046272				; 004d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1019
	mov	eax, DWORD PTR _tmp$1015[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR [ecx]
	shl	ecx, 8
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1019
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, DWORD PTR _tmp$1015[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	mov	ecx, DWORD PTR [ecx]
	shl	ecx, 8
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1019
; Line 1411
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	jmp	$L805
; Line 1412
$L1019:
; Line 1413
$L1014:
	jmp	$L850
; Line 1415
$L1020:
; Line 1425
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 5898240				; 005a0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1021
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1021
	movsx	eax, BYTE PTR _was_replaced$[ebp+1]
	or	eax, eax
	je	$L1021
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3473408				; 00350000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1021
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1021
	mov	eax, 1
	mov	ecx, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	mov	ecx, DWORD PTR [ecx+8]
	mov	cl, BYTE PTR [ecx+4]
	shl	eax, cl
	dec	eax
	mov	ecx, DWORD PTR _to$[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	mov	ecx, DWORD PTR [ecx+4]
	not	ecx
	test	eax, ecx
	jne	$L1021
; Line 1427
$L1022:
	cmp	DWORD PTR _undobuf$S564, 10		; 0000000aH
	jge	$L1025
	mov	eax, DWORD PTR _x$[ebp]
	add	eax, 8
	mov	ecx, DWORD PTR _undobuf$S564
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	DWORD PTR _undobuf$S564[ecx*4+8], eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _undobuf$S564
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	DWORD PTR _undobuf$S564[ecx*4+12], eax
	mov	eax, DWORD PTR _undobuf$S564
	lea	eax, DWORD PTR [eax+eax*2]
	mov	DWORD PTR _undobuf$S564[eax*4+16], 0
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [ecx+8], eax
$L1025:
	inc	DWORD PTR _undobuf$S564
$L1023:
$L1024:
; Line 1432
$L1021:
; Line 1439
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 5898240				; 005a0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1026
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1026
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1026
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+8], 0
	jne	$L1026
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3473408				; 00350000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1026
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1026
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	not	eax
	mov	edx, 1
	mov	ecx, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	mov	ecx, DWORD PTR [ecx+8]
	mov	cl, BYTE PTR [ecx+4]
	shl	edx, cl
	dec	edx
	test	eax, edx
	jne	$L1026
; Line 1441
$L1027:
	cmp	DWORD PTR _undobuf$S564, 10		; 0000000aH
	jge	$L1030
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	ecx, DWORD PTR _undobuf$S564
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	DWORD PTR _undobuf$S564[ecx*4+8], eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _undobuf$S564
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	DWORD PTR _undobuf$S564[ecx*4+12], eax
	mov	eax, DWORD PTR _undobuf$S564
	lea	eax, DWORD PTR [eax+eax*2]
	mov	DWORD PTR _undobuf$S564[eax*4+16], 0
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	mov	DWORD PTR [ecx+4], eax
$L1030:
	inc	DWORD PTR _undobuf$S564
$L1028:
$L1029:
; Line 1446
$L1026:
; Line 1460
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 5898240				; 005a0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1033
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 5832704				; 00590000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1032
$L1033:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1032
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3473408				; 00350000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1034
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3538944				; 00360000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1034
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3604480				; 00370000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1032
$L1034:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_rtx_equal_p
	add	esp, 8
	or	eax, eax
	je	$L1032
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	edx, DWORD PTR _x$[ebp]
	mov	edx, DWORD PTR [edx+4]
	mov	edx, DWORD PTR [edx]
	shl	edx, 16					; 00000010H
	and	edx, -65536				; ffff0000H
	cmp	eax, edx
	jne	$L1032
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	edx, 1966080				; 001e0000H
	and	edx, -65536				; ffff0000H
	cmp	eax, edx
	jne	$L1032
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	edx, DWORD PTR _x$[ebp]
	mov	edx, DWORD PTR [edx+4]
	mov	edx, DWORD PTR [edx+12]
	add	eax, DWORD PTR [edx+4]
	mov	edx, DWORD PTR _x$[ebp]
	mov	edx, DWORD PTR [edx+4]
	mov	edx, DWORD PTR [edx+4]
	mov	edx, DWORD PTR [edx]
	shl	edx, 8
	and	edx, -16777216				; ff000000H
	sar	edx, 22					; 00000016H
	mov	edx, DWORD PTR _mode_size[edx]
	shl	edx, 3
	cmp	eax, edx
	jge	$L1032
; Line 1470
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+12]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _shiftcount$1035[ebp], eax
; Line 1475
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	edx, 3473408				; 00350000H
	and	edx, -65536				; ffff0000H
	cmp	eax, edx
	jne	$L1495
	mov	eax, 1
	mov	cl, BYTE PTR _shiftcount$1035[ebp]
	shl	eax, cl
	dec	eax
	mov	DWORD PTR -132+[ebp], eax
	jmp	$L1496
$L1495:
	mov	DWORD PTR -132+[ebp], 0
$L1496:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	cl, BYTE PTR _shiftcount$1035[ebp]
	shl	eax, cl
	add	eax, DWORD PTR -132+[ebp]
	mov	DWORD PTR _newmask$1036[ebp], eax
; Line 1477
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	shl	eax, 3
	cmp	eax, 32					; 00000020H
	jge	$L1037
; Line 1478
	mov	eax, 1
	mov	ecx, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	mov	ecx, DWORD PTR [ecx+4]
	mov	ecx, DWORD PTR [ecx]
	shl	ecx, 8
	and	ecx, -12582913				; ff3fffffH
	sar	ecx, 22					; 00000016H
	mov	ecx, DWORD PTR _mode_size[ecx]
	shl	ecx, 3
	shl	eax, cl
	dec	eax
	and	DWORD PTR _newmask$1036[ebp], eax
; Line 1479
$L1037:
	cmp	DWORD PTR _undobuf$S564+4, 0
	jne	$L1038
; Line 1480
	push	0
	call	_oballoc
	add	esp, 4
	mov	DWORD PTR _undobuf$S564+4, eax
; Line 1481
$L1038:
; Line 1487
	mov	eax, DWORD PTR _newmask$1036[ebp]
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	push	eax
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L805
; Line 1494
$L1032:
; Line 1503
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR _cc0_rtx
	cmp	DWORD PTR [eax+4], ecx
	jne	$L1039
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2818048				; 002b0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1039
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 5111808				; 004e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1040
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 5046272				; 004d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1039
$L1040:
	mov	eax, DWORD PTR _subst_insn$S560
	push	eax
	call	_next_insn_tests_no_inequality
	add	esp, 4
	or	eax, eax
	je	$L1039
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	edx, 1966080				; 001e0000H
	and	edx, -65536				; ffff0000H
	cmp	eax, edx
	jne	$L1039
	mov	eax, 1
	mov	edx, DWORD PTR _x$[ebp]
	mov	edx, DWORD PTR [edx+8]
	mov	edx, DWORD PTR [edx+4]
	mov	edx, DWORD PTR [edx+4]
	mov	edx, DWORD PTR [edx]
	shl	edx, 8
	and	edx, -16777216				; ff000000H
	sar	edx, 22					; 00000016H
	mov	edx, DWORD PTR _mode_size[edx]
	shl	edx, 3
	dec	edx
	mov	cl, dl
	shl	eax, cl
	mov	ecx, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	mov	ecx, DWORD PTR [ecx+8]
	cmp	eax, DWORD PTR [ecx+4]
	jbe	$L1039
; Line 1504
$L1041:
	cmp	DWORD PTR _undobuf$S564, 10		; 0000000aH
	jge	$L1044
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	ecx, DWORD PTR _undobuf$S564
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	DWORD PTR _undobuf$S564[ecx*4+8], eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _undobuf$S564
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	DWORD PTR _undobuf$S564[ecx*4+12], eax
	mov	eax, DWORD PTR _undobuf$S564
	lea	eax, DWORD PTR [eax+eax*2]
	mov	DWORD PTR _undobuf$S564[eax*4+16], 0
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	mov	DWORD PTR [ecx+4], eax
$L1044:
	inc	DWORD PTR _undobuf$S564
$L1042:
$L1043:
; Line 1505
$L1039:
	jmp	$L850
; Line 1507
$L1045:
; Line 1508
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1046
; Line 1510
	mov	eax, DWORD PTR _to$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_simplify_and_const_int
	add	esp, 8
	mov	DWORD PTR _tem$1047[ebp], eax
; Line 1511
	cmp	DWORD PTR _tem$1047[ebp], 0
	je	$L1048
; Line 1512
	mov	eax, DWORD PTR _tem$1047[ebp]
	jmp	$L805
; Line 1513
$L1048:
; Line 1514
$L1046:
	jmp	$L850
; Line 1516
$L1049:
; Line 1521
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1050
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	cmp	eax, DWORD PTR _code$[ebp]
	jne	$L1050
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1050
; Line 1523
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _c0$1051[ebp], eax
; Line 1524
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _c1$1052[ebp], eax
; Line 1525
	cmp	DWORD PTR _code$[ebp], 54		; 00000036H
	jne	$L1497
	mov	eax, DWORD PTR _c1$1052[ebp]
	or	eax, DWORD PTR _c0$1051[ebp]
	mov	DWORD PTR _combined$1053[ebp], eax
	jmp	$L1498
$L1497:
	mov	eax, DWORD PTR _c1$1052[ebp]
	xor	eax, DWORD PTR _c0$1051[ebp]
	mov	DWORD PTR _combined$1053[ebp], eax
$L1498:
; Line 1527
	cmp	DWORD PTR _combined$1053[ebp], 0
	jne	$L1054
; Line 1528
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	jmp	$L805
; Line 1529
$L1054:
	cmp	DWORD PTR _undobuf$S564+4, 0
	jne	$L1055
; Line 1530
	push	0
	call	_oballoc
	add	esp, 4
	mov	DWORD PTR _undobuf$S564+4, eax
; Line 1531
$L1055:
$L1056:
	cmp	DWORD PTR _undobuf$S564, 10		; 0000000aH
	jge	$L1059
	mov	eax, DWORD PTR _x$[ebp]
	add	eax, 8
	mov	ecx, DWORD PTR _undobuf$S564
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	DWORD PTR _undobuf$S564[ecx*4+8], eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _undobuf$S564
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	DWORD PTR _undobuf$S564[ecx*4+12], eax
	mov	eax, DWORD PTR _undobuf$S564
	lea	eax, DWORD PTR [eax+eax*2]
	mov	DWORD PTR _undobuf$S564[eax*4+16], 0
	mov	eax, DWORD PTR _combined$1053[ebp]
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [ecx+8], eax
$L1059:
	inc	DWORD PTR _undobuf$S564
$L1057:
$L1058:
; Line 1532
$L1060:
	cmp	DWORD PTR _undobuf$S564, 10		; 0000000aH
	jge	$L1063
	mov	eax, DWORD PTR _x$[ebp]
	add	eax, 4
	mov	ecx, DWORD PTR _undobuf$S564
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	DWORD PTR _undobuf$S564[ecx*4+8], eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _undobuf$S564
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	DWORD PTR _undobuf$S564[ecx*4+12], eax
	mov	eax, DWORD PTR _undobuf$S564
	lea	eax, DWORD PTR [eax+eax*2]
	mov	DWORD PTR _undobuf$S564[eax*4+16], 0
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [ecx+4], eax
$L1063:
	inc	DWORD PTR _undobuf$S564
$L1061:
$L1062:
; Line 1533
	jmp	$L850
; Line 1536
$L1050:
$L1064:
; Line 1539
	movsx	eax, BYTE PTR _was_replaced$[ebp]
	or	eax, eax
	je	$L1065
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 5046272				; 004d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1065
; Line 1540
$L1066:
	cmp	DWORD PTR _undobuf$S564, 10		; 0000000aH
	jge	$L1069
	mov	eax, DWORD PTR _x$[ebp]
	add	eax, 4
	mov	ecx, DWORD PTR _undobuf$S564
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	DWORD PTR _undobuf$S564[ecx*4+8], eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _undobuf$S564
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	DWORD PTR _undobuf$S564[ecx*4+12], eax
	mov	eax, DWORD PTR _undobuf$S564
	lea	eax, DWORD PTR [eax+eax*2]
	mov	DWORD PTR _undobuf$S564[eax*4+16], 0
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [ecx+4], eax
$L1069:
	inc	DWORD PTR _undobuf$S564
$L1067:
$L1068:
; Line 1541
$L1065:
	jmp	$L850
; Line 1543
$L1070:
; Line 1547
	movsx	eax, BYTE PTR _was_replaced$[ebp]
	or	eax, eax
	je	$L1071
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 5177344				; 004f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1071
; Line 1565
$L1072:
	cmp	DWORD PTR _undobuf$S564, 10		; 0000000aH
	jge	$L1075
	mov	eax, DWORD PTR _x$[ebp]
	add	eax, 4
	mov	ecx, DWORD PTR _undobuf$S564
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	DWORD PTR _undobuf$S564[ecx*4+8], eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _undobuf$S564
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	DWORD PTR _undobuf$S564[ecx*4+12], eax
	mov	eax, DWORD PTR _undobuf$S564
	lea	eax, DWORD PTR [eax+eax*2]
	mov	DWORD PTR _undobuf$S564[eax*4+16], 0
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [ecx+4], eax
$L1075:
	inc	DWORD PTR _undobuf$S564
$L1073:
$L1074:
; Line 1570
$L1071:
; Line 1575
	movsx	eax, BYTE PTR _was_replaced$[ebp]
	or	eax, eax
	je	$L1076
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3932160				; 003c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1077
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3997696				; 003d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1077
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3801088				; 003a0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1077
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3735552				; 00390000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1076
$L1077:
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1076
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR _const1_rtx
	cmp	DWORD PTR [eax+8], ecx
	jne	$L1076
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1076
; Line 1577
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _shift$1078[ebp], eax
; Line 1579
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3801088				; 003a0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1081
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3735552				; 00390000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1080
$L1081:
; Line 1580
	mov	eax, DWORD PTR _shift$1078[ebp]
	neg	eax
	mov	DWORD PTR _shift$1078[ebp], eax
; Line 1584
$L1080:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	eax, DWORD PTR [eax+4]
	add	eax, DWORD PTR _shift$1078[ebp]
	mov	DWORD PTR _newpos$1079[ebp], eax
; Line 1586
	cmp	DWORD PTR _newpos$1079[ebp], 0
	jl	$L1082
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	shl	eax, 3
	cmp	eax, DWORD PTR _newpos$1079[ebp]
	jle	$L1082
; Line 1588
	cmp	DWORD PTR _undobuf$S564+4, 0
	jne	$L1083
; Line 1589
	push	0
	call	_oballoc
	add	esp, 4
	mov	DWORD PTR _undobuf$S564+4, eax
; Line 1590
$L1083:
; Line 1592
	mov	eax, DWORD PTR _newpos$1079[ebp]
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _const1_rtx
	push	eax
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	90					; 0000005aH
	call	_gen_rtx
	add	esp, 20					; 00000014H
	jmp	$L805
; Line 1594
$L1082:
; Line 1595
$L1076:
	jmp	$L850
; Line 1597
$L1084:
; Line 1607
	movsx	eax, BYTE PTR _was_replaced$[ebp+1]
	or	eax, eax
	je	$L1085
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 5046272				; 004d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1086
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 5111808				; 004e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1085
$L1086:
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	cmp	DWORD PTR _mode_size[eax], 4
	jg	$L1085
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1087
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1087
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1085
$L1087:
; Line 1609
	cmp	DWORD PTR _undobuf$S564+4, 0
	jne	$L1088
; Line 1610
	push	0
	call	_oballoc
	add	esp, 4
	mov	DWORD PTR _undobuf$S564+4, eax
; Line 1611
$L1088:
$L1089:
	cmp	DWORD PTR _undobuf$S564, 10		; 0000000aH
	jge	$L1092
; Line 1613
	mov	eax, DWORD PTR _x$[ebp]
	add	eax, 8
	mov	ecx, DWORD PTR _undobuf$S564
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	DWORD PTR _undobuf$S564[ecx*4+8], eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _undobuf$S564
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	DWORD PTR _undobuf$S564[ecx*4+12], eax
	mov	eax, DWORD PTR _undobuf$S564
	lea	eax, DWORD PTR [eax+eax*2]
	mov	DWORD PTR _undobuf$S564[eax*4+16], 0
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	call	_gen_lowpart_for_combine
	add	esp, 8
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [ecx+8], eax
$L1092:
	inc	DWORD PTR _undobuf$S564
$L1090:
$L1091:
; Line 1619
$L1085:
; Line 1626
	movsx	eax, BYTE PTR _was_replaced$[ebp]
	or	eax, eax
	je	$L1093
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR [ecx]
	shl	ecx, 16					; 00000010H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1093
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1093
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1093
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 0
	jle	$L1093
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 0
	jle	$L1093
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	add	eax, DWORD PTR [ecx+4]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR [ecx]
	shl	ecx, 8
	and	ecx, -16777216				; ff000000H
	sar	ecx, 22					; 00000016H
	mov	ecx, DWORD PTR _mode_size[ecx]
	shl	ecx, 3
	cmp	eax, ecx
	jge	$L1093
; Line 1628
	cmp	DWORD PTR _undobuf$S564+4, 0
	jne	$L1094
; Line 1629
	push	0
	call	_oballoc
	add	esp, 4
	mov	DWORD PTR _undobuf$S564+4, eax
; Line 1630
$L1094:
; Line 1634
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	add	eax, DWORD PTR [ecx+4]
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	push	eax
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L805
; Line 1636
$L1093:
	jmp	$L850
; Line 1638
$L1095:
; Line 1646
	movsx	eax, BYTE PTR _was_replaced$[ebp+1]
	or	eax, eax
	je	$L1096
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 5046272				; 004d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1097
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 5111808				; 004e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1096
$L1097:
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	cmp	DWORD PTR _mode_size[eax], 4
	jg	$L1096
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1098
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1098
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1096
$L1098:
; Line 1648
	cmp	DWORD PTR _undobuf$S564+4, 0
	jne	$L1099
; Line 1649
	push	0
	call	_oballoc
	add	esp, 4
	mov	DWORD PTR _undobuf$S564+4, eax
; Line 1650
$L1099:
$L1100:
	cmp	DWORD PTR _undobuf$S564, 10		; 0000000aH
	jge	$L1103
; Line 1652
	mov	eax, DWORD PTR _x$[ebp]
	add	eax, 8
	mov	ecx, DWORD PTR _undobuf$S564
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	DWORD PTR _undobuf$S564[ecx*4+8], eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _undobuf$S564
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	DWORD PTR _undobuf$S564[ecx*4+12], eax
	mov	eax, DWORD PTR _undobuf$S564
	lea	eax, DWORD PTR [eax+eax*2]
	mov	DWORD PTR _undobuf$S564[eax*4+16], 0
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	call	_gen_lowpart_for_combine
	add	esp, 8
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [ecx+8], eax
$L1103:
	inc	DWORD PTR _undobuf$S564
$L1101:
$L1102:
; Line 1659
$L1096:
; Line 1678
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3473408				; 00350000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1104
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1104
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 0
	jle	$L1104
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1104
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _to$[ebp]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L1104
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3997696				; 003d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1105
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3932160				; 003c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1104
$L1105:
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1104
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	mov	ecx, DWORD PTR [ecx+4]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L1104
; Line 1680
	cmp	DWORD PTR _undobuf$S564+4, 0
	jne	$L1106
; Line 1681
	push	0
	call	_oballoc
	add	esp, 4
	mov	DWORD PTR _undobuf$S564+4, eax
; Line 1684
$L1106:
; Line 1689
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	shl	eax, 3
	cmp	eax, 32					; 00000020H
	jl	$L1499
	mov	DWORD PTR -136+[ebp], -1
	jmp	$L1500
$L1499:
	mov	eax, 1
	mov	ecx, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR [ecx]
	shl	ecx, 8
	and	ecx, -16777216				; ff000000H
	sar	ecx, 22					; 00000016H
	mov	ecx, DWORD PTR _mode_size[ecx]
	shl	ecx, 3
	shl	eax, cl
	dec	eax
	mov	DWORD PTR -136+[ebp], eax
$L1500:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	shl	eax, 3
	cmp	eax, 32					; 00000020H
	jl	$L1501
	mov	DWORD PTR -140+[ebp], -1
	jmp	$L1502
$L1501:
	mov	eax, 1
	mov	ecx, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR [ecx]
	shl	ecx, 8
	and	ecx, -16777216				; ff000000H
	sar	ecx, 22					; 00000016H
	mov	ecx, DWORD PTR _mode_size[ecx]
	shl	ecx, 3
	shl	eax, cl
	dec	eax
	mov	DWORD PTR -140+[ebp], eax
$L1502:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	and	eax, DWORD PTR -140+[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	mov	cl, BYTE PTR [ecx+4]
	shl	eax, cl
	and	eax, DWORD PTR -136+[ebp]
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	53					; 00000035H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L805
; Line 1693
$L1104:
; Line 1700
	movsx	eax, BYTE PTR _was_replaced$[ebp]
	or	eax, eax
	je	$L1107
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3801088				; 003a0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1108
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3735552				; 00390000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1107
$L1108:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1107
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1107
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 0
	jle	$L1107
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 0
	jle	$L1107
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	add	eax, DWORD PTR [ecx+4]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR [ecx]
	shl	ecx, 8
	and	ecx, -16777216				; ff000000H
	sar	ecx, 22					; 00000016H
	mov	ecx, DWORD PTR _mode_size[ecx]
	shl	ecx, 3
	cmp	eax, ecx
	jge	$L1107
; Line 1702
	cmp	DWORD PTR _undobuf$S564+4, 0
	jne	$L1109
; Line 1703
	push	0
	call	_oballoc
	add	esp, 4
	mov	DWORD PTR _undobuf$S564+4, eax
; Line 1704
$L1109:
; Line 1708
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	add	eax, DWORD PTR [ecx+4]
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	push	eax
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L805
; Line 1715
$L1107:
; Line 1724
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1110
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 0
	jle	$L1110
	movsx	eax, BYTE PTR _was_replaced$[ebp]
	or	eax, eax
	je	$L1110
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3997696				; 003d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1113
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3932160				; 003c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1112
$L1113:
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1112
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	mov	ecx, DWORD PTR [ecx+4]
	cmp	DWORD PTR [eax+4], ecx
	je	$L1111
$L1112:
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3735552				; 00390000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1114
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3801088				; 003a0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1110
$L1114:
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1110
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	neg	eax
	mov	ecx, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	cmp	eax, DWORD PTR [ecx+4]
	jne	$L1110
$L1111:
; Line 1726
	cmp	DWORD PTR _undobuf$S564+4, 0
	jne	$L1115
; Line 1727
	push	0
	call	_oballoc
	add	esp, 4
	mov	DWORD PTR _undobuf$S564+4, eax
; Line 1730
$L1115:
; Line 1734
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	shl	eax, 3
	cmp	eax, 32					; 00000020H
	jl	$L1503
	mov	DWORD PTR -144+[ebp], -1
	jmp	$L1504
$L1503:
	mov	eax, 1
	mov	ecx, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR [ecx]
	shl	ecx, 8
	and	ecx, -16777216				; ff000000H
	sar	ecx, 22					; 00000016H
	mov	ecx, DWORD PTR _mode_size[ecx]
	shl	ecx, 3
	shl	eax, cl
	dec	eax
	mov	DWORD PTR -144+[ebp], eax
$L1504:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	shl	eax, 3
	cmp	eax, 32					; 00000020H
	jl	$L1505
	mov	DWORD PTR -148+[ebp], -1
	jmp	$L1506
$L1505:
	mov	eax, 1
	mov	ecx, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR [ecx]
	shl	ecx, 8
	and	ecx, -16777216				; ff000000H
	sar	ecx, 22					; 00000016H
	mov	ecx, DWORD PTR _mode_size[ecx]
	shl	ecx, 3
	shl	eax, cl
	dec	eax
	mov	DWORD PTR -148+[ebp], eax
$L1506:
	mov	eax, DWORD PTR -148+[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	mov	cl, BYTE PTR [ecx+4]
	shl	eax, cl
	and	eax, DWORD PTR -144+[ebp]
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	53					; 00000035H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L805
; Line 1737
$L1110:
	jmp	$L850
$L849:
	sub	DWORD PTR -156+[ebp], 25		; 00000019H
	cmp	DWORD PTR -156+[ebp], 65		; 00000041H
	ja	$L850
	shl	DWORD PTR -156+[ebp], 2
	mov	eax, DWORD PTR -156+[ebp]
	jmp	DWORD PTR $L1507[eax]
$L1507:
	DD	OFFSET $L1020
	DD	OFFSET $L850
	DD	OFFSET $L850
	DD	OFFSET $L850
	DD	OFFSET $L850
	DD	OFFSET $L850
	DD	OFFSET $L850
	DD	OFFSET $L850
	DD	OFFSET $L850
	DD	OFFSET $L850
	DD	OFFSET $L853
	DD	OFFSET $L850
	DD	OFFSET $L850
	DD	OFFSET $L850
	DD	OFFSET $L850
	DD	OFFSET $L850
	DD	OFFSET $L850
	DD	OFFSET $L850
	DD	OFFSET $L850
	DD	OFFSET $L895
	DD	OFFSET $L850
	DD	OFFSET $L889
	DD	OFFSET $L850
	DD	OFFSET $L850
	DD	OFFSET $L850
	DD	OFFSET $L850
	DD	OFFSET $L850
	DD	OFFSET $L850
	DD	OFFSET $L1045
	DD	OFFSET $L1049
	DD	OFFSET $L1049
	DD	OFFSET $L883
	DD	OFFSET $L1095
	DD	OFFSET $L1095
	DD	OFFSET $L1084
	DD	OFFSET $L1084
	DD	OFFSET $L1084
	DD	OFFSET $L1084
	DD	OFFSET $L850
	DD	OFFSET $L850
	DD	OFFSET $L850
	DD	OFFSET $L850
	DD	OFFSET $L945
	DD	OFFSET $L945
	DD	OFFSET $L850
	DD	OFFSET $L850
	DD	OFFSET $L850
	DD	OFFSET $L850
	DD	OFFSET $L850
	DD	OFFSET $L850
	DD	OFFSET $L850
	DD	OFFSET $L850
	DD	OFFSET $L998
	DD	OFFSET $L976
	DD	OFFSET $L850
	DD	OFFSET $L850
	DD	OFFSET $L893
	DD	OFFSET $L1064
	DD	OFFSET $L850
	DD	OFFSET $L850
	DD	OFFSET $L850
	DD	OFFSET $L850
	DD	OFFSET $L850
	DD	OFFSET $L850
	DD	OFFSET $L850
	DD	OFFSET $L1070
$L850:
; Line 1739
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L805
; Line 1740
$L805:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_subst	ENDP
_x$ = 8
_to$ = 12
_varop$ = -4
_constop$ = -8
_temp$1137 = -12
_simplify_and_const_int PROC NEAR
; Line 1747
	push	ebp
	mov	ebp, esp
	sub	esp, 40					; 00000028H
	push	ebx
	push	esi
	push	edi
; Line 1748
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _varop$[ebp], eax
; Line 1749
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _constop$[ebp], eax
; Line 1765
	mov	eax, DWORD PTR _varop$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1121
	mov	eax, DWORD PTR _varop$[ebp]
	mov	ecx, DWORD PTR _to$[ebp]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L1121
	mov	eax, DWORD PTR _varop$[ebp]
	push	eax
	call	_subreg_lowpart_p
	add	esp, 4
	or	eax, eax
	je	$L1121
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3473408				; 00350000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1121
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1121
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	ecx, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR [ecx]
	shl	ecx, 8
	and	ecx, -16777216				; ff000000H
	sar	ecx, 22					; 00000016H
	mov	ecx, DWORD PTR _mode_size[ecx]
	cmp	DWORD PTR _mode_size[eax], ecx
	jg	$L1122
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	shl	eax, 3
	cmp	eax, 32					; 00000020H
	jl	$L1508
	mov	DWORD PTR -16+[ebp], -1
	jmp	$L1509
$L1508:
	mov	eax, 1
	mov	ecx, DWORD PTR _to$[ebp]
	mov	ecx, DWORD PTR [ecx]
	shl	ecx, 8
	and	ecx, -16777216				; ff000000H
	sar	ecx, 22					; 00000016H
	mov	ecx, DWORD PTR _mode_size[ecx]
	shl	ecx, 3
	shl	eax, cl
	dec	eax
	mov	DWORD PTR -16+[ebp], eax
$L1509:
	mov	eax, DWORD PTR -16+[ebp]
	not	eax
	test	eax, DWORD PTR _constop$[ebp]
	jne	$L1121
$L1122:
; Line 1767
	cmp	DWORD PTR _undobuf$S564+4, 0
	jne	$L1123
; Line 1768
	push	0
	call	_oballoc
	add	esp, 4
	mov	DWORD PTR _undobuf$S564+4, eax
; Line 1769
$L1123:
; Line 1776
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	and	eax, DWORD PTR _constop$[ebp]
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	call	_gen_lowpart_for_combine
	add	esp, 8
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	53					; 00000035H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L1118
; Line 1781
$L1121:
; Line 1784
	mov	eax, DWORD PTR _varop$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 5898240				; 005a0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1124
	mov	eax, DWORD PTR _varop$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1124
	mov	eax, 1
	mov	ecx, DWORD PTR _varop$[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	mov	cl, BYTE PTR [ecx+4]
	shl	eax, cl
	dec	eax
	mov	ecx, DWORD PTR _constop$[ebp]
	not	ecx
	test	eax, ecx
	jne	$L1124
; Line 1785
	mov	eax, DWORD PTR _varop$[ebp]
	jmp	$L1118
; Line 1790
$L1124:
; Line 1792
	mov	eax, DWORD PTR _to$[ebp]
	cmp	DWORD PTR _varop$[ebp], eax
	jne	$L1125
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 5111808				; 004e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1125
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	cmp	DWORD PTR _mode_size[eax], 4
	jg	$L1125
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1126
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1126
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1125
$L1126:
; Line 1794
	cmp	DWORD PTR _undobuf$S564+4, 0
	jne	$L1127
; Line 1795
	push	0
	call	_oballoc
	add	esp, 4
	mov	DWORD PTR _undobuf$S564+4, eax
; Line 1796
$L1127:
; Line 1800
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	shl	eax, 3
	cmp	eax, 32					; 00000020H
	jl	$L1510
	mov	DWORD PTR -20+[ebp], -1
	jmp	$L1511
$L1510:
	mov	eax, 1
	mov	ecx, DWORD PTR _to$[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	mov	ecx, DWORD PTR [ecx]
	shl	ecx, 8
	and	ecx, -16777216				; ff000000H
	sar	ecx, 22					; 00000016H
	mov	ecx, DWORD PTR _mode_size[ecx]
	shl	ecx, 3
	shl	eax, cl
	dec	eax
	mov	DWORD PTR -20+[ebp], eax
$L1511:
	mov	eax, DWORD PTR _constop$[ebp]
	and	eax, DWORD PTR -20+[ebp]
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	call	_gen_lowpart_for_combine
	add	esp, 8
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	53					; 00000035H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L1118
; Line 1806
$L1125:
; Line 1809
	mov	eax, DWORD PTR _to$[ebp]
	cmp	DWORD PTR _varop$[ebp], eax
	jne	$L1128
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 5046272				; 004d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1128
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	shl	eax, 3
	cmp	eax, 32					; 00000020H
	jl	$L1512
	mov	DWORD PTR -24+[ebp], -1
	jmp	$L1513
$L1512:
	mov	eax, 1
	mov	ecx, DWORD PTR _to$[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	mov	ecx, DWORD PTR [ecx]
	shl	ecx, 8
	and	ecx, -16777216				; ff000000H
	sar	ecx, 22					; 00000016H
	mov	ecx, DWORD PTR _mode_size[ecx]
	shl	ecx, 3
	shl	eax, cl
	dec	eax
	mov	DWORD PTR -24+[ebp], eax
$L1513:
	mov	eax, DWORD PTR -24+[ebp]
	cmp	DWORD PTR _constop$[ebp], eax
	ja	$L1128
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	cmp	DWORD PTR _mode_size[eax], 4
	jg	$L1128
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1129
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1129
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1128
$L1129:
; Line 1811
	cmp	DWORD PTR _undobuf$S564+4, 0
	jne	$L1130
; Line 1812
	push	0
	call	_oballoc
	add	esp, 4
	mov	DWORD PTR _undobuf$S564+4, eax
; Line 1813
$L1130:
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	shl	eax, 3
	cmp	eax, 32					; 00000020H
	jl	$L1514
	mov	DWORD PTR -28+[ebp], -1
	jmp	$L1515
$L1514:
	mov	eax, 1
	mov	ecx, DWORD PTR _to$[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	mov	ecx, DWORD PTR [ecx]
	shl	ecx, 8
	and	ecx, -16777216				; ff000000H
	sar	ecx, 22					; 00000016H
	mov	ecx, DWORD PTR _mode_size[ecx]
	shl	ecx, 3
	shl	eax, cl
	dec	eax
	mov	DWORD PTR -28+[ebp], eax
$L1515:
	mov	eax, DWORD PTR -28+[ebp]
	cmp	DWORD PTR _constop$[ebp], eax
	jne	$L1131
; Line 1814
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	78					; 0000004eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	jmp	$L1118
; Line 1815
$L1131:
; Line 1818
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	call	_gen_lowpart_for_combine
	add	esp, 8
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	53					; 00000035H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L1118
; Line 1822
$L1128:
; Line 1824
	mov	eax, DWORD PTR _to$[ebp]
	cmp	DWORD PTR _varop$[ebp], eax
	jne	$L1132
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3473408				; 00350000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1132
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1132
; Line 1826
	cmp	DWORD PTR _undobuf$S564+4, 0
	jne	$L1133
; Line 1827
	push	0
	call	_oballoc
	add	esp, 4
	mov	DWORD PTR _undobuf$S564+4, eax
; Line 1828
$L1133:
; Line 1832
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	and	eax, DWORD PTR _constop$[ebp]
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	53					; 00000035H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L1118
; Line 1837
$L1132:
; Line 1843
	mov	eax, DWORD PTR _varop$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3932160				; 003c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1134
	mov	eax, DWORD PTR _varop$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1134
	mov	eax, DWORD PTR _varop$[ebp]
	mov	ecx, DWORD PTR _to$[ebp]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L1134
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3801088				; 003a0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1134
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1134
	mov	eax, DWORD PTR _varop$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _to$[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	mov	ecx, DWORD PTR [ecx+4]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L1134
	mov	eax, DWORD PTR _constop$[ebp]
	mov	ecx, DWORD PTR _varop$[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	mov	cl, BYTE PTR [ecx+4]
	shr	eax, cl
	or	eax, eax
	jne	$L1134
; Line 1845
	cmp	DWORD PTR _undobuf$S564+4, 0
	jne	$L1135
; Line 1846
	push	0
	call	_oballoc
	add	esp, 4
	mov	DWORD PTR _undobuf$S564+4, eax
; Line 1850
$L1135:
	mov	eax, DWORD PTR _mode_size+4
	shl	eax, 3
	cmp	eax, 32					; 00000020H
	jl	$L1516
	mov	DWORD PTR -32+[ebp], -1
	jmp	$L1517
$L1516:
	mov	eax, 1
	mov	ecx, DWORD PTR _mode_size+4
	shl	ecx, 3
	shl	eax, cl
	dec	eax
	mov	DWORD PTR -32+[ebp], eax
$L1517:
	mov	eax, DWORD PTR -32+[ebp]
	cmp	DWORD PTR _constop$[ebp], eax
	jne	$L1136
; Line 1852
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	1
	call	_gen_lowpart_for_combine
	add	esp, 8
	mov	DWORD PTR _temp$1137[ebp], eax
; Line 1853
	mov	eax, DWORD PTR _temp$1137[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1769472				; 001b0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1138
; Line 1854
	mov	eax, DWORD PTR _temp$1137[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	78					; 0000004eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	jmp	$L1118
; Line 1855
$L1138:
; Line 1856
$L1136:
; Line 1857
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	53					; 00000035H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L1118
; Line 1862
$L1134:
; Line 1869
	mov	eax, DWORD PTR _varop$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3932160				; 003c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1140
	mov	eax, DWORD PTR _varop$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3997696				; 003d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1139
$L1140:
	mov	eax, DWORD PTR _varop$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1139
	mov	eax, DWORD PTR _varop$[ebp]
	mov	ecx, DWORD PTR _to$[ebp]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L1139
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 5111808				; 004e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1141
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 5046272				; 004d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1139
$L1141:
	mov	eax, DWORD PTR _constop$[ebp]
	mov	ecx, DWORD PTR _varop$[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	mov	cl, BYTE PTR [ecx+4]
	shl	eax, cl
	mov	ecx, DWORD PTR _to$[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	mov	ecx, DWORD PTR [ecx]
	shl	ecx, 8
	and	ecx, -16777216				; ff000000H
	sar	ecx, 22					; 00000016H
	mov	ecx, DWORD PTR _mode_size[ecx]
	shl	ecx, 3
	shr	eax, cl
	or	eax, eax
	jne	$L1139
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	cmp	DWORD PTR _mode_size[eax], 4
	jg	$L1139
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1142
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1142
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1139
$L1142:
; Line 1871
	cmp	DWORD PTR _undobuf$S564+4, 0
	jne	$L1143
; Line 1872
	push	0
	call	_oballoc
	add	esp, 4
	mov	DWORD PTR _undobuf$S564+4, eax
; Line 1873
$L1143:
$L1144:
	cmp	DWORD PTR _undobuf$S564, 10		; 0000000aH
	jge	$L1147
; Line 1874
	mov	eax, DWORD PTR _varop$[ebp]
	add	eax, 4
	mov	ecx, DWORD PTR _undobuf$S564
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	DWORD PTR _undobuf$S564[ecx*4+8], eax
	mov	eax, DWORD PTR _varop$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _undobuf$S564
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	DWORD PTR _undobuf$S564[ecx*4+12], eax
	mov	eax, DWORD PTR _undobuf$S564
	lea	eax, DWORD PTR [eax+eax*2]
	mov	DWORD PTR _undobuf$S564[eax*4+16], 0
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	call	_gen_lowpart_for_combine
	add	esp, 8
	mov	ecx, DWORD PTR _varop$[ebp]
	mov	DWORD PTR [ecx+4], eax
$L1147:
	inc	DWORD PTR _undobuf$S564
$L1145:
$L1146:
; Line 1875
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L1118
; Line 1878
$L1139:
; Line 1879
	mov	eax, DWORD PTR _mode_size+4
	shl	eax, 3
	cmp	eax, 32					; 00000020H
	jl	$L1518
	mov	DWORD PTR -36+[ebp], -1
	jmp	$L1519
$L1518:
	mov	eax, 1
	mov	ecx, DWORD PTR _mode_size+4
	shl	ecx, 3
	shl	eax, cl
	dec	eax
	mov	DWORD PTR -36+[ebp], eax
$L1519:
	mov	eax, DWORD PTR -36+[ebp]
	cmp	DWORD PTR _constop$[ebp], eax
	jne	$L1148
	mov	eax, DWORD PTR _varop$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1148
; Line 1881
	cmp	DWORD PTR _undobuf$S564+4, 0
	jne	$L1149
; Line 1882
	push	0
	call	_oballoc
	add	esp, 4
	mov	DWORD PTR _undobuf$S564+4, eax
; Line 1883
$L1149:
; Line 1884
	push	0
	mov	eax, DWORD PTR _varop$[ebp]
	push	eax
	push	1
	push	35					; 00000023H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	78					; 0000004eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	jmp	$L1118
; Line 1886
$L1148:
; Line 1887
	mov	eax, DWORD PTR _mode_size+8
	shl	eax, 3
	cmp	eax, 32					; 00000020H
	jl	$L1520
	mov	DWORD PTR -40+[ebp], -1
	jmp	$L1521
$L1520:
	mov	eax, 1
	mov	ecx, DWORD PTR _mode_size+8
	shl	ecx, 3
	shl	eax, cl
	dec	eax
	mov	DWORD PTR -40+[ebp], eax
$L1521:
	mov	eax, DWORD PTR -40+[ebp]
	cmp	DWORD PTR _constop$[ebp], eax
	jne	$L1150
	mov	eax, DWORD PTR _varop$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1150
; Line 1889
	cmp	DWORD PTR _undobuf$S564+4, 0
	jne	$L1151
; Line 1890
	push	0
	call	_oballoc
	add	esp, 4
	mov	DWORD PTR _undobuf$S564+4, eax
; Line 1891
$L1151:
; Line 1892
	push	0
	mov	eax, DWORD PTR _varop$[ebp]
	push	eax
	push	2
	push	35					; 00000023H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	78					; 0000004eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	jmp	$L1118
; Line 1895
$L1150:
	sub	eax, eax
	jmp	$L1118
; Line 1896
$L1118:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_simplify_and_const_int ENDP
_TEXT	ENDS
EXTRN	_gen_lowpart:NEAR
_TEXT	SEGMENT
_mode$ = 8
_x$ = 12
_offset$1159 = -4
_gen_lowpart_for_combine PROC NEAR
; Line 1913
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 1914
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1156
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1155
$L1156:
; Line 1915
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_gen_lowpart
	add	esp, 8
	jmp	$L1154
; Line 1916
$L1155:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	cmp	eax, DWORD PTR _mode$[ebp]
	jne	$L1157
; Line 1917
	mov	eax, DWORD PTR _const0_rtx
	push	eax
	push	0
	push	27					; 0000001bH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	jmp	$L1154
; Line 1918
$L1157:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1158
; Line 1920
	mov	DWORD PTR _offset$1159[ebp], 0
; Line 1923
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shr	eax, 27					; 0000001bH
	test	al, 1
	je	$L1160
; Line 1924
	mov	eax, DWORD PTR _const0_rtx
	push	eax
	push	0
	push	27					; 0000001bH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	jmp	$L1154
; Line 1929
$L1160:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	ecx, DWORD PTR _mode$[ebp]
	mov	ecx, DWORD PTR _mode_size[ecx*4]
	cmp	DWORD PTR _mode_size[eax], ecx
	jge	$L1161
; Line 1930
	push	0
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	push	35					; 00000023H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L1154
; Line 1942
$L1161:
; Line 1943
	mov	eax, DWORD PTR _offset$1159[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_plus_constant
	add	esp, 8
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	push	37					; 00000025H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	jmp	$L1154
; Line 1945
	jmp	$L1162
$L1158:
; Line 1946
	mov	eax, DWORD PTR _const0_rtx
	push	eax
	push	0
	push	27					; 0000001bH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	jmp	$L1154
$L1162:
; Line 1947
$L1154:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_lowpart_for_combine ENDP
_TEXT	ENDS
EXTRN	_exact_log2:NEAR
_TEXT	SEGMENT
_insn$ = 8
_value$ = -8
_op0$ = -28
_op1$ = -16
_offset$ = -36
_var$ = -32
_bitnum$ = -24
_temp$ = -4
_newpat$ = -20
_simplify_set_cc0_and PROC NEAR
; Line 1957
	push	ebp
	mov	ebp, esp
	sub	esp, 44					; 0000002cH
	push	ebx
	push	esi
	push	edi
; Line 1958
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _value$[ebp], eax
; Line 1959
	mov	eax, DWORD PTR _value$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _op0$[ebp], eax
; Line 1960
	mov	eax, DWORD PTR _value$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _op1$[ebp], eax
; Line 1961
	mov	DWORD PTR _offset$[ebp], 0
; Line 1962
	mov	DWORD PTR _var$[ebp], 0
; Line 1963
	mov	DWORD PTR _bitnum$[ebp], 0
; Line 1968
	mov	eax, DWORD PTR _value$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3473408				; 00350000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1174
; Line 1970
	mov	eax, DWORD PTR _value$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _op0$[ebp], eax
; Line 1971
	mov	eax, DWORD PTR _value$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _op1$[ebp], eax
; Line 1973
	jmp	$L1175
$L1174:
	mov	eax, DWORD PTR _value$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3997696				; 003d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1176
; Line 1980
	mov	eax, DWORD PTR _value$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1177
	mov	eax, DWORD PTR _value$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	shl	eax, 3
	dec	eax
	mov	ecx, DWORD PTR _value$[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	cmp	eax, DWORD PTR [ecx+4]
	jne	$L1177
; Line 1982
	mov	eax, DWORD PTR _value$[ebp]
	mov	DWORD PTR _op0$[ebp], eax
; Line 1983
	mov	eax, DWORD PTR _const1_rtx
	mov	DWORD PTR _op1$[ebp], eax
; Line 1985
	jmp	$L1178
$L1177:
; Line 1986
	jmp	$L1164
$L1178:
; Line 1988
	jmp	$L1179
$L1176:
; Line 1989
	call	_abort
$L1179:
$L1175:
; Line 1996
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR -40+[ebp], eax
	jmp	$L1180
; Line 1998
$L1184:
; Line 1999
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_exact_log2
	add	esp, 4
	mov	DWORD PTR _temp$[ebp], eax
; Line 2000
	cmp	DWORD PTR _temp$[ebp], 0
	jge	$L1186
; Line 2001
	jmp	$L1164
; Line 2002
$L1186:
	mov	eax, DWORD PTR _temp$[ebp]
	mov	DWORD PTR _offset$[ebp], eax
; Line 2003
	mov	eax, DWORD PTR _op1$[ebp]
	mov	DWORD PTR _var$[ebp], eax
; Line 2004
	jmp	$L1181
; Line 2006
$L1187:
; Line 2008
	mov	eax, DWORD PTR _op0$[ebp]
	mov	ecx, DWORD PTR _const1_rtx
	cmp	DWORD PTR [eax+4], ecx
	jne	$L1188
; Line 2010
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _bitnum$[ebp], eax
; Line 2011
	mov	eax, DWORD PTR _op1$[ebp]
	mov	DWORD PTR _var$[ebp], eax
; Line 2013
$L1188:
	jmp	$L1181
$L1180:
	cmp	DWORD PTR -40+[ebp], 30			; 0000001eH
	je	$L1184
	cmp	DWORD PTR -40+[ebp], 57			; 00000039H
	jl	$L1181
	cmp	DWORD PTR -40+[ebp], 58			; 0000003aH
	jle	$L1187
	jmp	$L1181
$L1181:
; Line 2014
	cmp	DWORD PTR _var$[ebp], 0
	jne	$L1189
; Line 2015
	mov	eax, DWORD PTR _op1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR -44+[ebp], eax
	jmp	$L1190
; Line 2017
$L1194:
; Line 2018
	mov	eax, DWORD PTR _op1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_exact_log2
	add	esp, 4
	mov	DWORD PTR _temp$[ebp], eax
; Line 2019
	cmp	DWORD PTR _temp$[ebp], 0
	jge	$L1195
; Line 2020
	jmp	$L1164
; Line 2021
$L1195:
	mov	eax, DWORD PTR _temp$[ebp]
	mov	DWORD PTR _offset$[ebp], eax
; Line 2022
	mov	eax, DWORD PTR _op0$[ebp]
	mov	DWORD PTR _var$[ebp], eax
; Line 2023
	jmp	$L1191
; Line 2025
$L1196:
; Line 2027
	mov	eax, DWORD PTR _op1$[ebp]
	mov	ecx, DWORD PTR _const1_rtx
	cmp	DWORD PTR [eax+4], ecx
	jne	$L1197
; Line 2029
	mov	eax, DWORD PTR _op1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _bitnum$[ebp], eax
; Line 2030
	mov	eax, DWORD PTR _op0$[ebp]
	mov	DWORD PTR _var$[ebp], eax
; Line 2032
$L1197:
	jmp	$L1191
$L1190:
	cmp	DWORD PTR -44+[ebp], 30			; 0000001eH
	je	$L1194
	cmp	DWORD PTR -44+[ebp], 57			; 00000039H
	jl	$L1191
	cmp	DWORD PTR -44+[ebp], 58			; 0000003aH
	jle	$L1196
	jmp	$L1191
$L1191:
; Line 2035
$L1189:
	cmp	DWORD PTR _var$[ebp], 0
	jne	$L1198
; Line 2036
	jmp	$L1164
; Line 2038
$L1198:
	cmp	DWORD PTR _undobuf$S564+4, 0
	jne	$L1199
; Line 2039
	push	0
	call	_oballoc
	add	esp, 4
	mov	DWORD PTR _undobuf$S564+4, eax
; Line 2043
$L1199:
; Line 2044
	cmp	DWORD PTR _offset$[ebp], 0
	jne	$L1200
	mov	eax, DWORD PTR _var$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3932160				; 003c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1201
	mov	eax, DWORD PTR _var$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3997696				; 003d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1200
$L1201:
; Line 2046
	mov	eax, DWORD PTR _var$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _bitnum$[ebp], eax
; Line 2047
	mov	eax, DWORD PTR _var$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _var$[ebp], eax
; Line 2050
$L1200:
	mov	eax, DWORD PTR _var$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1202
	mov	eax, DWORD PTR _var$[ebp]
	cmp	DWORD PTR [eax+8], 0
	jne	$L1202
; Line 2051
	mov	eax, DWORD PTR _var$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _var$[ebp], eax
; Line 2066
$L1202:
	cmp	DWORD PTR _bitnum$[ebp], 0
	jne	$L1203
; Line 2067
	mov	eax, DWORD PTR _offset$[ebp]
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _bitnum$[ebp], eax
; Line 2069
$L1203:
; Line 2070
	mov	eax, DWORD PTR _bitnum$[ebp]
	push	eax
	mov	eax, DWORD PTR _const1_rtx
	push	eax
	mov	eax, DWORD PTR _var$[ebp]
	push	eax
	push	0
	push	90					; 0000005aH
	call	_gen_rtx
	add	esp, 20					; 00000014H
	push	eax
	mov	eax, DWORD PTR _cc0_rtx
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	DWORD PTR _newpat$[ebp], eax
; Line 2071
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _newpat$[ebp]
	push	eax
	call	_recog
	add	esp, 8
	or	eax, eax
	jl	$L1204
; Line 2073
	cmp	DWORD PTR _undobuf$S564, 10		; 0000000aH
	jge	$L1205
; Line 2075
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	add	eax, 8
	mov	ecx, DWORD PTR _undobuf$S564
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	DWORD PTR _undobuf$S564[ecx*4+8], eax
; Line 2076
	mov	eax, DWORD PTR _value$[ebp]
	mov	ecx, DWORD PTR _undobuf$S564
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	DWORD PTR _undobuf$S564[ecx*4+12], eax
; Line 2077
	mov	eax, DWORD PTR _newpat$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	mov	DWORD PTR [ecx+8], eax
; Line 2079
$L1205:
	inc	DWORD PTR _undobuf$S564
; Line 2081
$L1204:
$L1164:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_simplify_set_cc0_and ENDP
_i$1217 = -8
_elt$1221 = -16
_code$1222 = -12
_dest$1225 = -20
_dest$1236 = -24
_insn$ = 8
_link$ = -4
_record_dead_and_set_regs PROC NEAR
; Line 2094
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	push	ebx
	push	esi
	push	edi
; Line 2096
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR _link$[ebp], eax
	jmp	$L1209
$L1210:
	mov	eax, DWORD PTR _link$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _link$[ebp], eax
$L1209:
	cmp	DWORD PTR _link$[ebp], 0
	je	$L1211
; Line 2098
	mov	eax, DWORD PTR _link$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 16777216				; 01000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1212
; Line 2099
	mov	eax, DWORD PTR _insn$[ebp]
	mov	ecx, DWORD PTR _link$[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	mov	ecx, DWORD PTR [ecx+4]
	mov	edx, DWORD PTR _reg_last_death$S556
	mov	DWORD PTR [edx+ecx*4], eax
; Line 2100
	jmp	$L1213
$L1212:
	mov	eax, DWORD PTR _link$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 33554432				; 02000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1214
; Line 2101
	mov	eax, DWORD PTR _insn$[ebp]
	mov	ecx, DWORD PTR _link$[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	mov	ecx, DWORD PTR [ecx+4]
	mov	edx, DWORD PTR _reg_last_set$S557
	mov	DWORD PTR [edx+ecx*4], eax
; Line 2102
$L1214:
$L1213:
	jmp	$L1210
$L1211:
; Line 2104
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 983040				; 000f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1215
; Line 2105
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _uid_cuid$S555
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _mem_last_set$S558, eax
	mov	eax, DWORD PTR _mem_last_set$S558
	mov	DWORD PTR _last_call_cuid$S559, eax
; Line 2107
$L1215:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1310720				; 00140000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1216
; Line 2110
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	dec	eax
	mov	DWORD PTR _i$1217[ebp], eax
	jmp	$L1218
$L1219:
	dec	DWORD PTR _i$1217[ebp]
$L1218:
	cmp	DWORD PTR _i$1217[ebp], 0
	jl	$L1220
; Line 2112
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _i$1217[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	mov	DWORD PTR _elt$1221[ebp], eax
; Line 2113
	mov	eax, DWORD PTR _elt$1221[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$1222[ebp], eax
; Line 2114
	cmp	DWORD PTR _code$1222[ebp], 25		; 00000019H
	je	$L1224
	cmp	DWORD PTR _code$1222[ebp], 27		; 0000001bH
	jne	$L1223
$L1224:
; Line 2116
	mov	eax, DWORD PTR _elt$1221[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _dest$1225[ebp], eax
; Line 2120
$L1227:
	mov	eax, DWORD PTR _dest$1225[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1229
	mov	eax, DWORD PTR _dest$1225[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2359296				; 00240000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1229
	mov	eax, DWORD PTR _dest$1225[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 5832704				; 00590000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1229
	mov	eax, DWORD PTR _dest$1225[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 5898240				; 005a0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1228
$L1229:
; Line 2121
	mov	eax, DWORD PTR _dest$1225[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _dest$1225[ebp], eax
	jmp	$L1227
$L1228:
; Line 2123
	mov	eax, DWORD PTR _dest$1225[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1230
; Line 2124
	mov	eax, DWORD PTR _insn$[ebp]
	mov	ecx, DWORD PTR _dest$1225[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	mov	edx, DWORD PTR _reg_last_set$S557
	mov	DWORD PTR [edx+ecx*4], eax
; Line 2125
	jmp	$L1231
$L1230:
	mov	eax, DWORD PTR _dest$1225[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1232
; Line 2126
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _uid_cuid$S555
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _mem_last_set$S558, eax
; Line 2127
$L1232:
$L1231:
; Line 2128
$L1223:
	jmp	$L1219
$L1220:
; Line 2130
	jmp	$L1233
$L1216:
; Line 2131
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1235
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1769472				; 001b0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1234
$L1235:
; Line 2133
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _dest$1236[ebp], eax
; Line 2138
$L1238:
	mov	eax, DWORD PTR _dest$1236[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1240
	mov	eax, DWORD PTR _dest$1236[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2359296				; 00240000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1240
	mov	eax, DWORD PTR _dest$1236[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 5832704				; 00590000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1240
	mov	eax, DWORD PTR _dest$1236[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 5898240				; 005a0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1239
$L1240:
; Line 2139
	mov	eax, DWORD PTR _dest$1236[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _dest$1236[ebp], eax
	jmp	$L1238
$L1239:
; Line 2141
	mov	eax, DWORD PTR _dest$1236[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1241
; Line 2142
	mov	eax, DWORD PTR _insn$[ebp]
	mov	ecx, DWORD PTR _dest$1236[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	mov	edx, DWORD PTR _reg_last_set$S557
	mov	DWORD PTR [edx+ecx*4], eax
; Line 2143
	jmp	$L1242
$L1241:
	mov	eax, DWORD PTR _dest$1236[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1243
; Line 2144
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _uid_cuid$S555
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _mem_last_set$S558, eax
; Line 2145
$L1243:
$L1242:
; Line 2146
$L1234:
$L1233:
$L1207:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_record_dead_and_set_regs ENDP
_x$ = 8
_from_cuid$ = 12
_fmt$ = -4
_i$ = -8
_code$ = -12
_regno$1251 = -16
_j$1258 = -20
_use_crosses_set_p PROC NEAR
; Line 2155
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	push	ebx
	push	esi
	push	edi
; Line 2158
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$[ebp], eax
; Line 2160
	cmp	DWORD PTR _code$[ebp], 34		; 00000022H
	jne	$L1250
; Line 2162
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _regno$1251[ebp], eax
; Line 2166
	cmp	DWORD PTR _regno$1251[ebp], 7
	jne	$L1252
; Line 2167
	mov	eax, 1
	jmp	$L1246
; Line 2169
$L1252:
; Line 2170
	mov	eax, DWORD PTR _regno$1251[ebp]
	mov	ecx, DWORD PTR _reg_last_set$S557
	cmp	DWORD PTR [ecx+eax*4], 0
	je	$L1522
	mov	eax, DWORD PTR _regno$1251[ebp]
	mov	ecx, DWORD PTR _reg_last_set$S557
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _uid_cuid$S555
	mov	edx, DWORD PTR _from_cuid$[ebp]
	cmp	DWORD PTR [ecx+eax*4], edx
	jle	$L1522
	mov	eax, 1
	jmp	$L1523
$L1522:
	sub	eax, eax
$L1523:
	jmp	$L1246
; Line 2173
$L1250:
	cmp	DWORD PTR _code$[ebp], 37		; 00000025H
	jne	$L1253
	mov	eax, DWORD PTR _mem_last_set$S558
	cmp	DWORD PTR _from_cuid$[ebp], eax
	jge	$L1253
; Line 2174
	mov	eax, 1
	jmp	$L1246
; Line 2176
$L1253:
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_format[eax*4]
	mov	DWORD PTR _fmt$[ebp], eax
; Line 2178
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_length[eax*4]
	dec	eax
	mov	DWORD PTR _i$[ebp], eax
	jmp	$L1254
$L1255:
	dec	DWORD PTR _i$[ebp]
$L1254:
	cmp	DWORD PTR _i$[ebp], 0
	jl	$L1256
; Line 2180
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 69					; 00000045H
	jne	$L1257
; Line 2183
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	eax, DWORD PTR [eax]
	dec	eax
	mov	DWORD PTR _j$1258[ebp], eax
	jmp	$L1259
$L1260:
	dec	DWORD PTR _j$1258[ebp]
$L1259:
	cmp	DWORD PTR _j$1258[ebp], 0
	jl	$L1261
; Line 2184
	mov	eax, DWORD PTR _from_cuid$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$1258[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	push	eax
	call	_use_crosses_set_p
	add	esp, 8
	or	eax, eax
	je	$L1262
; Line 2185
	mov	eax, 1
	jmp	$L1246
; Line 2186
$L1262:
	jmp	$L1260
$L1261:
; Line 2187
	jmp	$L1263
$L1257:
; Line 2188
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 101				; 00000065H
	jne	$L1264
	mov	eax, DWORD PTR _from_cuid$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	push	eax
	call	_use_crosses_set_p
	add	esp, 8
	or	eax, eax
	je	$L1264
; Line 2189
	mov	eax, 1
	jmp	$L1246
; Line 2190
$L1264:
$L1263:
	jmp	$L1255
$L1256:
; Line 2191
	sub	eax, eax
	jmp	$L1246
; Line 2192
$L1246:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_use_crosses_set_p ENDP
_TEXT	ENDS
PUBLIC	_regno_dead_p
_TEXT	SEGMENT
_regno$ = 8
_insn$ = 12
_link$ = -4
_regno_dead_p PROC NEAR
; Line 2200
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 2203
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR _link$[ebp], eax
	jmp	$L1269
$L1270:
	mov	eax, DWORD PTR _link$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _link$[ebp], eax
$L1269:
	cmp	DWORD PTR _link$[ebp], 0
	je	$L1271
; Line 2206
	mov	eax, DWORD PTR _link$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 16777216				; 01000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L1273
	mov	eax, DWORD PTR _link$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 33554432				; 02000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1272
$L1273:
	mov	eax, DWORD PTR _link$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _regno$[ebp]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L1272
; Line 2207
	mov	eax, 1
	jmp	$L1267
; Line 2209
$L1272:
	jmp	$L1270
$L1271:
	sub	eax, eax
	jmp	$L1267
; Line 2210
$L1267:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_regno_dead_p ENDP
_i$ = 8
_j$ = 12
_insn$ = -4
_adjacent_insns_p PROC NEAR
; Line 2219
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 2221
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _insn$[ebp], eax
	jmp	$L1278
$L1279:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _insn$[ebp], eax
$L1278:
	mov	eax, DWORD PTR _j$[ebp]
	cmp	DWORD PTR _insn$[ebp], eax
	je	$L1280
; Line 2224
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 851968				; 000d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1282
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 983040				; 000f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1282
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 917504				; 000e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1281
$L1282:
; Line 2225
	sub	eax, eax
	jmp	$L1276
; Line 2226
$L1281:
	jmp	$L1279
$L1280:
	mov	eax, 1
	jmp	$L1276
; Line 2227
$L1276:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_adjacent_insns_p ENDP
_TEXT	ENDS
EXTRN	_general_operand:NEAR
EXTRN	_asm_noperands:NEAR
EXTRN	_decode_asm_operands:NEAR
_TEXT	SEGMENT
_x$ = 8
_noperands$ = -12
_operands$ = -8
_i$ = -4
_check_asm_operands PROC NEAR
; Line 2235
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 2236
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_asm_noperands
	add	esp, 4
	mov	DWORD PTR _noperands$[ebp], eax
; Line 2240
	cmp	DWORD PTR _noperands$[ebp], 0
	jge	$L1288
; Line 2241
	sub	eax, eax
	jmp	$L1284
; Line 2242
$L1288:
	cmp	DWORD PTR _noperands$[ebp], 0
	jne	$L1289
; Line 2243
	mov	eax, 1
	jmp	$L1284
; Line 2245
$L1289:
	mov	eax, DWORD PTR _noperands$[ebp]
	shl	eax, 2
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _operands$[ebp], eax
; Line 2246
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _operands$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_decode_asm_operands
	add	esp, 20					; 00000014H
; Line 2248
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L1290
$L1291:
	inc	DWORD PTR _i$[ebp]
$L1290:
	mov	eax, DWORD PTR _noperands$[ebp]
	cmp	DWORD PTR _i$[ebp], eax
	jge	$L1292
; Line 2249
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	jne	$L1294
; Line 2250
	sub	eax, eax
	jmp	$L1284
; Line 2252
$L1294:
	jmp	$L1291
$L1292:
	mov	eax, 1
	jmp	$L1284
; Line 2253
$L1284:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_check_asm_operands ENDP
_insn$ = 8
_oinsn$ = 12
_all_links$ = 16
_links$ = -4
_tail$1301 = -8
_target$1305 = -12
_next$1310 = -16
_prev$1311 = -20
_add_links PROC NEAR
; Line 2268
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	push	ebx
	push	esi
	push	edi
; Line 2269
	mov	eax, DWORD PTR _oinsn$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _links$[ebp], eax
; Line 2270
	cmp	DWORD PTR _all_links$[ebp], 0
	jne	$L1300
; Line 2273
	mov	eax, DWORD PTR _links$[ebp]
	mov	DWORD PTR _tail$1301[ebp], eax
	jmp	$L1302
$L1303:
	mov	eax, DWORD PTR _tail$1301[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _tail$1301[ebp], eax
$L1302:
	cmp	DWORD PTR _tail$1301[ebp], 0
	je	$L1304
; Line 2275
	mov	eax, DWORD PTR _tail$1301[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _target$1305[ebp], eax
; Line 2279
	mov	eax, DWORD PTR _target$1305[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 851968				; 000d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1307
	mov	eax, DWORD PTR _target$1305[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1307
	mov	eax, DWORD PTR _target$1305[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1307
	mov	eax, DWORD PTR _target$1305[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _oinsn$[ebp]
	push	eax
	call	_dead_or_set_p
	add	esp, 8
	or	eax, eax
	jne	$L1306
$L1307:
; Line 2282
	mov	eax, DWORD PTR _oinsn$[ebp]
	mov	ecx, DWORD PTR _tail$1301[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 2283
$L1306:
	jmp	$L1303
$L1304:
; Line 2285
$L1300:
	mov	eax, DWORD PTR _insn$[ebp]
	cmp	DWORD PTR [eax+24], 0
	jne	$L1308
; Line 2286
	mov	eax, DWORD PTR _links$[ebp]
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	DWORD PTR [ecx+24], eax
; Line 2287
	jmp	$L1309
$L1308:
; Line 2289
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _prev$1311[ebp], eax
; Line 2290
$L1313:
	mov	eax, DWORD PTR _prev$1311[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _next$1310[ebp], eax
	cmp	DWORD PTR _next$1310[ebp], 0
	je	$L1314
; Line 2291
	mov	eax, DWORD PTR _next$1310[ebp]
	mov	DWORD PTR _prev$1311[ebp], eax
	jmp	$L1313
$L1314:
; Line 2292
	mov	eax, DWORD PTR _links$[ebp]
	mov	ecx, DWORD PTR _prev$1311[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 2293
$L1309:
; Line 2294
$L1298:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_add_links ENDP
_insn$ = 8
_oinsn$ = 12
_next$ = -4
_prev$ = -8
_remove_links PROC NEAR
; Line 2301
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 2302
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _next$[ebp], eax
	mov	DWORD PTR _prev$[ebp], 0
; Line 2303
$L1321:
	cmp	DWORD PTR _next$[ebp], 0
	je	$L1322
; Line 2305
	mov	eax, DWORD PTR _next$[ebp]
	mov	ecx, DWORD PTR _oinsn$[ebp]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L1323
; Line 2307
	cmp	DWORD PTR _prev$[ebp], 0
	je	$L1324
; Line 2308
	mov	eax, DWORD PTR _next$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _prev$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 2309
	jmp	$L1325
$L1324:
; Line 2310
	mov	eax, DWORD PTR _next$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	DWORD PTR [ecx+24], eax
$L1325:
; Line 2312
	jmp	$L1326
$L1323:
; Line 2313
	mov	eax, DWORD PTR _next$[ebp]
	mov	DWORD PTR _prev$[ebp], eax
$L1326:
; Line 2314
	mov	eax, DWORD PTR _next$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _next$[ebp], eax
; Line 2315
	jmp	$L1321
$L1322:
; Line 2316
$L1317:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_remove_links ENDP
_insn$ = 8
_incs$ = 12
_tail$ = -4
_add_incs PROC NEAR
; Line 2325
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 2328
	mov	eax, DWORD PTR _incs$[ebp]
	mov	DWORD PTR _tail$[ebp], eax
	jmp	$L1331
$L1332:
	mov	eax, DWORD PTR _tail$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _tail$[ebp], eax
$L1331:
	cmp	DWORD PTR _tail$[ebp], 0
	je	$L1333
; Line 2329
	mov	eax, DWORD PTR _tail$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 33554432				; 02000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1334
; Line 2331
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	mov	eax, DWORD PTR _tail$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	2
	push	2
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 2332
$L1334:
	jmp	$L1332
$L1333:
$L1329:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_add_incs ENDP
_regno$ = 8
_insn$ = 12
_link$ = -8
_next$ = -4
_remove_death PROC NEAR
; Line 2340
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 2344
$L1341:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR _link$[ebp], eax
	cmp	DWORD PTR _link$[ebp], 0
	je	$L1342
	mov	eax, DWORD PTR _link$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 16777216				; 01000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1342
	mov	eax, DWORD PTR _link$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _regno$[ebp]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L1342
; Line 2345
	mov	eax, DWORD PTR _link$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	DWORD PTR [ecx+28], eax
	jmp	$L1341
$L1342:
; Line 2347
	cmp	DWORD PTR _link$[ebp], 0
	je	$L1343
; Line 2348
$L1345:
	mov	eax, DWORD PTR _link$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _next$[ebp], eax
	cmp	DWORD PTR _next$[ebp], 0
	je	$L1346
; Line 2351
	mov	eax, DWORD PTR _next$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 16777216				; 01000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1347
	mov	eax, DWORD PTR _next$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _regno$[ebp]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L1347
; Line 2352
	mov	eax, DWORD PTR _next$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _link$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 2353
	jmp	$L1348
$L1347:
; Line 2354
	mov	eax, DWORD PTR _next$[ebp]
	mov	DWORD PTR _link$[ebp], eax
$L1348:
; Line 2355
	jmp	$L1345
$L1346:
; Line 2356
$L1343:
$L1337:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_remove_death ENDP
_x$ = 8
_from_cuid$ = 12
_to_insn$ = 16
_fmt$ = -4
_len$ = -16
_i$ = -8
_code$ = -12
_where_dead$1358 = -20
_j$1365 = -24
_move_deaths PROC NEAR
; Line 2370
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	push	ebx
	push	esi
	push	edi
; Line 2373
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$[ebp], eax
; Line 2375
	cmp	DWORD PTR _code$[ebp], 34		; 00000022H
	jne	$L1357
; Line 2377
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg_last_death$S556
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _where_dead$1358[ebp], eax
; Line 2380
	cmp	DWORD PTR _where_dead$1358[ebp], 0
	je	$L1359
	mov	eax, DWORD PTR _where_dead$1358[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _uid_cuid$S555
	mov	edx, DWORD PTR _from_cuid$[ebp]
	cmp	DWORD PTR [ecx+eax*4], edx
	jl	$L1359
	mov	eax, DWORD PTR _where_dead$1358[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _uid_cuid$S555
	mov	edx, DWORD PTR _to_insn$[ebp]
	mov	edx, DWORD PTR [edx+4]
	mov	ebx, DWORD PTR _uid_cuid$S555
	mov	edx, DWORD PTR [ebx+edx*4]
	cmp	DWORD PTR [ecx+eax*4], edx
	jge	$L1359
; Line 2382
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg_last_death$S556
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_remove_death
	add	esp, 8
; Line 2383
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	mov	eax, DWORD PTR _to_insn$[ebp]
	push	eax
	call	_dead_or_set_p
	add	esp, 8
	or	eax, eax
	jne	$L1360
; Line 2385
	mov	eax, DWORD PTR _to_insn$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	push	1
	push	2
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	ecx, DWORD PTR _to_insn$[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 2386
$L1360:
; Line 2387
$L1359:
	jmp	$L1352
; Line 2390
$L1357:
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_length[eax*4]
	mov	DWORD PTR _len$[ebp], eax
; Line 2391
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_format[eax*4]
	mov	DWORD PTR _fmt$[ebp], eax
; Line 2393
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L1361
$L1362:
	inc	DWORD PTR _i$[ebp]
$L1361:
	mov	eax, DWORD PTR _len$[ebp]
	cmp	DWORD PTR _i$[ebp], eax
	jge	$L1363
; Line 2395
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 69					; 00000045H
	jne	$L1364
; Line 2398
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	eax, DWORD PTR [eax]
	dec	eax
	mov	DWORD PTR _j$1365[ebp], eax
	jmp	$L1366
$L1367:
	dec	DWORD PTR _j$1365[ebp]
$L1366:
	cmp	DWORD PTR _j$1365[ebp], 0
	jl	$L1368
; Line 2399
	mov	eax, DWORD PTR _to_insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _from_cuid$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$1365[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	push	eax
	call	_move_deaths
	add	esp, 12					; 0000000cH
	jmp	$L1367
$L1368:
; Line 2401
	jmp	$L1369
$L1364:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 101				; 00000065H
	jne	$L1370
; Line 2402
	mov	eax, DWORD PTR _to_insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _from_cuid$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	push	eax
	call	_move_deaths
	add	esp, 12					; 0000000cH
; Line 2403
$L1370:
$L1369:
	jmp	$L1362
$L1363:
; Line 2404
$L1352:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_move_deaths ENDP
_x$ = 8
_from_cuid$ = 12
_from_insn$ = 16
_to_insn$ = 20
_fmt$ = -4
_len$ = -16
_i$ = -8
_code$ = -12
_where_dead$1381 = -20
_j$1391 = -24
_move_deaths_2 PROC NEAR
; Line 2416
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	push	ebx
	push	esi
	push	edi
; Line 2419
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$[ebp], eax
; Line 2421
	cmp	DWORD PTR _code$[ebp], 34		; 00000022H
	jne	$L1380
; Line 2423
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg_last_death$S556
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _where_dead$1381[ebp], eax
; Line 2426
	cmp	DWORD PTR _where_dead$1381[ebp], 0
	je	$L1382
	mov	eax, DWORD PTR _where_dead$1381[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _uid_cuid$S555
	mov	edx, DWORD PTR _from_cuid$[ebp]
	cmp	DWORD PTR [ecx+eax*4], edx
	jl	$L1382
	mov	eax, DWORD PTR _where_dead$1381[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _uid_cuid$S555
	mov	edx, DWORD PTR _to_insn$[ebp]
	mov	edx, DWORD PTR [edx+4]
	mov	ebx, DWORD PTR _uid_cuid$S555
	mov	edx, DWORD PTR [ebx+edx*4]
	cmp	DWORD PTR [ecx+eax*4], edx
	jge	$L1382
; Line 2428
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg_last_death$S556
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_remove_death
	add	esp, 8
; Line 2429
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	mov	eax, DWORD PTR _to_insn$[ebp]
	push	eax
	call	_dead_or_set_p
	add	esp, 8
	or	eax, eax
	jne	$L1383
; Line 2431
	mov	eax, DWORD PTR _to_insn$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	push	1
	push	2
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	ecx, DWORD PTR _to_insn$[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 2432
$L1383:
; Line 2435
	jmp	$L1384
$L1382:
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	mov	eax, DWORD PTR _from_insn$[ebp]
	push	eax
	call	_dead_or_set_p
	add	esp, 8
	or	eax, eax
	je	$L1385
; Line 2437
	mov	eax, DWORD PTR _from_insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_remove_death
	add	esp, 8
; Line 2438
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	mov	eax, DWORD PTR _to_insn$[ebp]
	push	eax
	call	_dead_or_set_p
	add	esp, 8
	or	eax, eax
	jne	$L1386
; Line 2440
	mov	eax, DWORD PTR _to_insn$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	push	1
	push	2
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	ecx, DWORD PTR _to_insn$[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 2441
$L1386:
; Line 2442
$L1385:
$L1384:
	jmp	$L1375
; Line 2445
$L1380:
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_length[eax*4]
	mov	DWORD PTR _len$[ebp], eax
; Line 2446
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_format[eax*4]
	mov	DWORD PTR _fmt$[ebp], eax
; Line 2448
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L1387
$L1388:
	inc	DWORD PTR _i$[ebp]
$L1387:
	mov	eax, DWORD PTR _len$[ebp]
	cmp	DWORD PTR _i$[ebp], eax
	jge	$L1389
; Line 2450
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 69					; 00000045H
	jne	$L1390
; Line 2453
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	eax, DWORD PTR [eax]
	dec	eax
	mov	DWORD PTR _j$1391[ebp], eax
	jmp	$L1392
$L1393:
	dec	DWORD PTR _j$1391[ebp]
$L1392:
	cmp	DWORD PTR _j$1391[ebp], 0
	jl	$L1394
; Line 2454
	mov	eax, DWORD PTR _to_insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _from_insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _from_cuid$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$1391[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	push	eax
	call	_move_deaths_2
	add	esp, 16					; 00000010H
	jmp	$L1393
$L1394:
; Line 2456
	jmp	$L1395
$L1390:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 101				; 00000065H
	jne	$L1396
; Line 2457
	mov	eax, DWORD PTR _to_insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _from_insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _from_cuid$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	push	eax
	call	_move_deaths_2
	add	esp, 16					; 00000010H
; Line 2458
$L1396:
$L1395:
	jmp	$L1388
$L1389:
; Line 2459
$L1375:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_move_deaths_2 ENDP
_to_prev$ = -4
_to_insn$ = -32
_code$ = -40
_insn_code_number$ = -12
_prev_code_number$ = -56
_regno$ = -8
_new_insn_pat$ = -24
_new_prev_pat$ = -28
_inner1$1450 = -64
_inner2$1451 = -72
_subreg_needed$1452 = -68
_insn$ = 8
_xprev1$ = 12
_xprev2$ = 16
_pat$ = -48
_prev1$ = -20
_prev2$ = -60
_pat1$ = -44
_pat2$ = -16
_src1$ = -52
_src2$ = -36
_try_distrib PROC NEAR
; Line 2496
	push	ebp
	mov	ebp, esp
	sub	esp, 84					; 00000054H
	push	ebx
	push	esi
	push	edi
; Line 2497
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _pat$[ebp], eax
; Line 2504
	inc	DWORD PTR _distrib_attempts$S540
; Line 2512
	mov	eax, DWORD PTR _xprev1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _uid_cuid$S555
	mov	edx, DWORD PTR _xprev2$[ebp]
	mov	edx, DWORD PTR [edx+4]
	mov	ebx, DWORD PTR _uid_cuid$S555
	mov	edx, DWORD PTR [ebx+edx*4]
	cmp	DWORD PTR [ecx+eax*4], edx
	jle	$L1416
; Line 2514
	mov	eax, DWORD PTR _xprev1$[ebp]
	mov	DWORD PTR _prev1$[ebp], eax
; Line 2515
	mov	eax, DWORD PTR _xprev2$[ebp]
	mov	DWORD PTR _prev2$[ebp], eax
; Line 2517
	jmp	$L1417
$L1416:
; Line 2519
	mov	eax, DWORD PTR _xprev2$[ebp]
	mov	DWORD PTR _prev1$[ebp], eax
; Line 2520
	mov	eax, DWORD PTR _xprev1$[ebp]
	mov	DWORD PTR _prev2$[ebp], eax
; Line 2521
$L1417:
; Line 2523
	mov	eax, DWORD PTR _prev1$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _pat1$[ebp], eax
; Line 2524
	mov	eax, DWORD PTR _prev2$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _pat2$[ebp], eax
; Line 2531
	mov	eax, DWORD PTR _pat$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1419
	mov	eax, DWORD PTR _pat1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1419
	mov	eax, DWORD PTR _pat2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1418
$L1419:
; Line 2532
	sub	eax, eax
	jmp	$L1400
; Line 2534
$L1418:
	mov	eax, DWORD PTR _pat$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$[ebp], eax
; Line 2535
	mov	eax, DWORD PTR _pat1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _src1$[ebp], eax
; Line 2536
	mov	eax, DWORD PTR _pat2$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _src2$[ebp], eax
; Line 2539
	mov	eax, DWORD PTR _pat1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1421
	mov	eax, DWORD PTR _pat2$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1420
$L1421:
; Line 2540
	sub	eax, eax
	jmp	$L1400
; Line 2542
$L1420:
	mov	eax, DWORD PTR _code$[ebp]
	mov	DWORD PTR -80+[ebp], eax
	jmp	$L1422
; Line 2544
$L1426:
; Line 2545
	sub	eax, eax
	jmp	$L1400
; Line 2547
$L1427:
; Line 2552
	jmp	$L1423
$L1422:
	cmp	DWORD PTR -80+[ebp], 44			; 0000002cH
	je	$L1423
	cmp	DWORD PTR -80+[ebp], 53			; 00000035H
	jl	$L1426
	cmp	DWORD PTR -80+[ebp], 55			; 00000037H
	jle	$L1423
	jmp	$L1426
$L1423:
; Line 2560
	mov	eax, DWORD PTR _pat$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _pat1$[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L1429
	mov	eax, DWORD PTR _pat$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _pat2$[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	cmp	DWORD PTR [eax+8], ecx
	je	$L1428
$L1429:
	mov	eax, DWORD PTR _pat$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _pat2$[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L1430
	mov	eax, DWORD PTR _pat$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _pat1$[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	cmp	DWORD PTR [eax+8], ecx
	je	$L1428
$L1430:
; Line 2561
	sub	eax, eax
	jmp	$L1400
; Line 2565
$L1428:
; Line 2566
	mov	eax, DWORD PTR _pat$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _pat1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_reg_mentioned_p
	add	esp, 8
	or	eax, eax
	jne	$L1432
	mov	eax, DWORD PTR _pat$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _pat2$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_reg_mentioned_p
	add	esp, 8
	or	eax, eax
	je	$L1431
$L1432:
; Line 2567
	sub	eax, eax
	jmp	$L1400
; Line 2570
$L1431:
	mov	eax, DWORD PTR _src2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, DWORD PTR _src1$[ebp]
	mov	ecx, DWORD PTR [ecx]
	shl	ecx, 8
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L1433
; Line 2571
	sub	eax, eax
	jmp	$L1400
; Line 2592
$L1433:
	mov	eax, DWORD PTR _src2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, DWORD PTR _src1$[ebp]
	mov	ecx, DWORD PTR [ecx]
	shl	ecx, 16					; 00000010H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1434
; Line 2593
	sub	eax, eax
	jmp	$L1400
; Line 2597
$L1434:
	mov	DWORD PTR _undobuf$S564, 0
; Line 2598
	mov	DWORD PTR _undobuf$S564+4, 0
; Line 2601
	mov	eax, DWORD PTR _insn$[ebp]
	mov	DWORD PTR _subst_insn$S560, eax
; Line 2602
	mov	DWORD PTR _n_occurrences$S565, 0
; Line 2604
	mov	eax, DWORD PTR _src1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR -84+[ebp], eax
	jmp	$L1435
; Line 2607
$L1439:
; Line 2614
	cmp	DWORD PTR _code$[ebp], 44		; 0000002cH
	jne	$L1440
; Line 2615
	sub	eax, eax
	jmp	$L1400
; Line 2616
$L1440:
	jmp	$do_distrib$1441
; Line 2618
$L1442:
; Line 2631
	jmp	$do_distrib$1441
; Line 2633
$L1443:
; Line 2635
	cmp	DWORD PTR _code$[ebp], 44		; 0000002cH
	je	$L1444
; Line 2636
	sub	eax, eax
	jmp	$L1400
; Line 2638
$L1444:
$do_distrib$1441:
; Line 2641
	mov	eax, DWORD PTR _src1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1446
	mov	eax, DWORD PTR _src2$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1446
	mov	eax, DWORD PTR _src1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _src2$[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	mov	ecx, DWORD PTR [ecx+4]
	cmp	DWORD PTR [eax+4], ecx
	je	$L1445
$L1446:
; Line 2642
	sub	eax, eax
	jmp	$L1400
; Line 2648
$L1445:
	mov	eax, DWORD PTR _prev2$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _uid_cuid$S555
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	mov	eax, DWORD PTR _src2$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_use_crosses_set_p
	add	esp, 8
	or	eax, eax
	je	$L1447
; Line 2649
	sub	eax, eax
	jmp	$L1400
; Line 2652
$L1447:
; Line 2653
	mov	eax, DWORD PTR _src2$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _src1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _src1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	mov	eax, DWORD PTR _code$[ebp]
	push	eax
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	DWORD PTR _to_prev$[ebp], eax
; Line 2654
	mov	eax, DWORD PTR _src1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _pat1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _src1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	mov	eax, DWORD PTR _src1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	push	eax
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	DWORD PTR _to_insn$[ebp], eax
; Line 2655
	jmp	$L1436
; Line 2657
$L1448:
; Line 2661
	cmp	DWORD PTR _code$[ebp], 44		; 0000002cH
	jne	$L1449
; Line 2662
	sub	eax, eax
	jmp	$L1400
; Line 2663
$L1449:
; Line 2664
	mov	eax, DWORD PTR _src1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _inner1$1450[ebp], eax
	mov	eax, DWORD PTR _src2$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _inner2$1451[ebp], eax
; Line 2665
	mov	DWORD PTR _subreg_needed$1452[ebp], 0
; Line 2669
	mov	eax, DWORD PTR _inner1$1450[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1453
; Line 2671
	mov	eax, DWORD PTR _inner1$1450[ebp]
	cmp	DWORD PTR [eax+8], 0
	je	$L1454
; Line 2672
	sub	eax, eax
	jmp	$L1400
; Line 2673
	jmp	$L1455
$L1454:
; Line 2675
	mov	DWORD PTR _subreg_needed$1452[ebp], 1
; Line 2676
	mov	eax, DWORD PTR _inner1$1450[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _inner1$1450[ebp], eax
; Line 2677
$L1455:
; Line 2680
$L1453:
	mov	eax, DWORD PTR _inner2$1451[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1456
; Line 2682
	mov	eax, DWORD PTR _inner2$1451[ebp]
	cmp	DWORD PTR [eax+8], 0
	je	$L1457
; Line 2683
	sub	eax, eax
	jmp	$L1400
; Line 2684
	jmp	$L1458
$L1457:
; Line 2686
	mov	DWORD PTR _subreg_needed$1452[ebp], 1
; Line 2687
	mov	eax, DWORD PTR _inner2$1451[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _inner2$1451[ebp], eax
; Line 2688
$L1458:
; Line 2695
$L1456:
	mov	eax, DWORD PTR _prev2$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _uid_cuid$S555
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	mov	eax, DWORD PTR _inner2$1451[ebp]
	push	eax
	call	_use_crosses_set_p
	add	esp, 8
	or	eax, eax
	je	$L1459
; Line 2696
	sub	eax, eax
	jmp	$L1400
; Line 2698
$L1459:
	mov	eax, DWORD PTR _inner2$1451[ebp]
	push	eax
	mov	eax, DWORD PTR _inner1$1450[ebp]
	push	eax
	mov	eax, DWORD PTR _src1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	mov	eax, DWORD PTR _code$[ebp]
	push	eax
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	DWORD PTR _to_prev$[ebp], eax
; Line 2703
	cmp	DWORD PTR _subreg_needed$1452[ebp], 0
	je	$L1524
	push	0
	mov	eax, DWORD PTR _pat1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _src1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	35					; 00000023H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	DWORD PTR -76+[ebp], eax
	jmp	$L1525
$L1524:
	mov	eax, DWORD PTR _pat1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR -76+[ebp], eax
$L1525:
	mov	eax, DWORD PTR -76+[ebp]
	push	eax
	mov	eax, DWORD PTR _src1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	mov	eax, DWORD PTR _src1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	push	eax
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _to_insn$[ebp], eax
; Line 2705
	jmp	$L1436
; Line 2707
$L1460:
; Line 2708
	sub	eax, eax
	jmp	$L1400
; Line 2709
	jmp	$L1436
$L1435:
	sub	DWORD PTR -84+[ebp], 47			; 0000002fH
	cmp	DWORD PTR -84+[ebp], 31			; 0000001fH
	ja	$L1460
	shl	DWORD PTR -84+[ebp], 2
	mov	eax, DWORD PTR -84+[ebp]
	jmp	DWORD PTR $L1526[eax]
$L1526:
	DD	OFFSET $L1443
	DD	OFFSET $L1460
	DD	OFFSET $L1460
	DD	OFFSET $L1460
	DD	OFFSET $L1460
	DD	OFFSET $L1460
	DD	OFFSET $L1439
	DD	OFFSET $L1439
	DD	OFFSET $L1460
	DD	OFFSET $L1460
	DD	OFFSET $L1442
	DD	OFFSET $L1442
	DD	OFFSET $L1460
	DD	OFFSET $L1439
	DD	OFFSET $L1439
	DD	OFFSET $L1460
	DD	OFFSET $L1460
	DD	OFFSET $L1460
	DD	OFFSET $L1460
	DD	OFFSET $L1460
	DD	OFFSET $L1460
	DD	OFFSET $L1460
	DD	OFFSET $L1460
	DD	OFFSET $L1460
	DD	OFFSET $L1460
	DD	OFFSET $L1460
	DD	OFFSET $L1460
	DD	OFFSET $L1460
	DD	OFFSET $L1460
	DD	OFFSET $L1460
	DD	OFFSET $L1448
	DD	OFFSET $L1448
$L1436:
; Line 2713
	mov	eax, DWORD PTR _to_insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_subst
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _new_insn_pat$[ebp], eax
; Line 2714
	inc	DWORD PTR _distrib_merges_1$S542
; Line 2716
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _new_insn_pat$[ebp]
	push	eax
	call	_recog
	add	esp, 8
	mov	DWORD PTR _insn_code_number$[ebp], eax
; Line 2717
	cmp	DWORD PTR _insn_code_number$[ebp], 0
	jge	$L1461
; Line 2719
	call	_undo_all
; Line 2720
	sub	eax, eax
	jmp	$L1400
; Line 2723
$L1461:
	mov	eax, DWORD PTR _prev1$[ebp]
	mov	DWORD PTR _subst_insn$S560, eax
; Line 2724
	mov	eax, DWORD PTR _to_prev$[ebp]
	push	eax
	mov	eax, DWORD PTR _src1$[ebp]
	push	eax
	mov	eax, DWORD PTR _pat1$[ebp]
	push	eax
	call	_subst
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _new_prev_pat$[ebp], eax
; Line 2725
	inc	DWORD PTR _distrib_merges_2$S543
; Line 2727
	mov	eax, DWORD PTR _prev1$[ebp]
	push	eax
	mov	eax, DWORD PTR _new_prev_pat$[ebp]
	push	eax
	call	_recog
	add	esp, 8
	mov	DWORD PTR _prev_code_number$[ebp], eax
; Line 2728
	cmp	DWORD PTR _prev_code_number$[ebp], 0
	jge	$L1462
; Line 2730
	call	_undo_all
; Line 2731
	sub	eax, eax
	jmp	$L1400
; Line 2735
$L1462:
	mov	eax, DWORD PTR _insn_code_number$[ebp]
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	DWORD PTR [ecx+20], eax
; Line 2736
	mov	eax, DWORD PTR _new_insn_pat$[ebp]
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 2738
	mov	eax, DWORD PTR _prev_code_number$[ebp]
	mov	ecx, DWORD PTR _prev1$[ebp]
	mov	DWORD PTR [ecx+20], eax
; Line 2739
	mov	eax, DWORD PTR _new_prev_pat$[ebp]
	mov	ecx, DWORD PTR _prev1$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 2744
	mov	eax, DWORD PTR _prev2$[ebp]
	push	eax
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_remove_links
	add	esp, 8
; Line 2745
	mov	eax, DWORD PTR _prev1$[ebp]
	push	eax
	mov	eax, DWORD PTR _prev2$[ebp]
	push	eax
	call	_adjacent_insns_p
	add	esp, 8
	push	eax
	mov	eax, DWORD PTR _prev2$[ebp]
	push	eax
	mov	eax, DWORD PTR _prev1$[ebp]
	push	eax
	call	_add_links
	add	esp, 12					; 0000000cH
; Line 2749
	mov	eax, DWORD PTR _prev1$[ebp]
	push	eax
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _prev2$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _uid_cuid$S555
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	mov	eax, DWORD PTR _src2$[ebp]
	push	eax
	call	_move_deaths_2
	add	esp, 16					; 00000010H
; Line 2751
	mov	eax, DWORD PTR _pat2$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _regno$[ebp], eax
; Line 2753
	mov	eax, DWORD PTR _regno$[ebp]
	mov	edx, DWORD PTR _reg_n_sets
	dec	WORD PTR [edx+eax*2]
; Line 2756
	mov	eax, DWORD PTR _regno$[ebp]
	mov	edx, DWORD PTR _reg_n_sets
	movsx	eax, WORD PTR [edx+eax*2]
	or	eax, eax
	jne	$L1463
	mov	eax, DWORD PTR _regno$[ebp]
	cdq
	and	edx, 31					; 0000001fH
	add	eax, edx
	sar	eax, 5
	mov	edx, DWORD PTR _basic_block_live_at_start
	mov	edx, DWORD PTR [edx]
	mov	ebx, DWORD PTR [edx+eax*4]
	mov	esi, 1
	mov	eax, DWORD PTR _regno$[ebp]
	cdq
	xor	eax, edx
	sub	eax, edx
	and	eax, 31					; 0000001fH
	xor	eax, edx
	sub	eax, edx
	mov	cl, al
	shl	esi, cl
	test	ebx, esi
	jne	$L1463
; Line 2757
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _reg_n_refs
	mov	WORD PTR [ecx+eax*2], 0
; Line 2758
$L1463:
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _regno$[ebp]
	push	eax
	call	_remove_death
	add	esp, 8
; Line 2760
	mov	eax, DWORD PTR _prev2$[ebp]
	mov	eax, DWORD PTR [eax]
	and	eax, -65518				; ffff0012H
	or	eax, 18					; 00000012H
	mov	ecx, DWORD PTR _prev2$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 2761
	mov	eax, DWORD PTR _prev2$[ebp]
	mov	DWORD PTR [eax+20], -1
; Line 2762
	mov	eax, DWORD PTR _prev2$[ebp]
	mov	DWORD PTR [eax+16], 0
; Line 2764
	inc	DWORD PTR _distrib_successes$S546
; Line 2765
	mov	eax, DWORD PTR _prev1$[ebp]
	jmp	$L1400
; Line 2766
$L1400:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_try_distrib ENDP
_TEXT	ENDS
PUBLIC	_dump_combine_stats
EXTRN	_fprintf:NEAR
_DATA	SEGMENT
	ORG $+1
$SG1467	DB	';; Combiner statistics: %d attempts, %d substitutions (%'
	DB	'd requiring new space),', 0aH, ';; %d successes.', 0aH, 0aH, 00H
	ORG $+1
$SG1468	DB	';; Distributer statistics: %d attempts, %d:%d substituti'
	DB	'ons,', 0aH, ';; %d successes.', 0aH, 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_file$ = 8
_dump_combine_stats PROC NEAR
; Line 2771
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 2775
	mov	eax, DWORD PTR _combine_successes$S545
	push	eax
	mov	eax, DWORD PTR _combine_extras$S544
	push	eax
	mov	eax, DWORD PTR _combine_merges$S541
	push	eax
	mov	eax, DWORD PTR _combine_attempts$S539
	push	eax
	push	OFFSET $SG1467
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 24					; 00000018H
; Line 2780
	mov	eax, DWORD PTR _distrib_successes$S546
	push	eax
	mov	eax, DWORD PTR _distrib_merges_2$S543
	push	eax
	mov	eax, DWORD PTR _distrib_merges_1$S542
	push	eax
	mov	eax, DWORD PTR _distrib_attempts$S540
	push	eax
	push	OFFSET $SG1468
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 24					; 00000018H
; Line 2781
$L1466:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_dump_combine_stats ENDP
_TEXT	ENDS
PUBLIC	_dump_combine_total_stats
_BSS	SEGMENT
_total_distrib_attempts$S551 DD 01H DUP (?)
_total_distrib_merges_1$S552 DD 01H DUP (?)
_total_distrib_merges_2$S553 DD 01H DUP (?)
_total_distrib_successes$S554 DD 01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG1472	DB	0aH, ';; Combiner totals: %d attempts, %d substitutions ('
	DB	'%d requiring new space),', 0aH, ';; %d successes.', 0aH, 00H
	ORG $+1
$SG1473	DB	0aH, ';; Distributer totals: %d attempts, %d:%d substitut'
	DB	'ions,', 0aH, ';; %d successes.', 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_file$ = 8
_dump_combine_total_stats PROC NEAR
; Line 2786
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 2790
	mov	eax, DWORD PTR _total_successes$S550
	push	eax
	mov	eax, DWORD PTR _total_extras$S549
	push	eax
	mov	eax, DWORD PTR _total_merges$S548
	push	eax
	mov	eax, DWORD PTR _total_attempts$S547
	push	eax
	push	OFFSET $SG1472
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 24					; 00000018H
; Line 2795
	mov	eax, DWORD PTR _total_distrib_successes$S554
	push	eax
	mov	eax, DWORD PTR _total_distrib_merges_2$S553
	push	eax
	mov	eax, DWORD PTR _total_distrib_merges_1$S552
	push	eax
	mov	eax, DWORD PTR _total_distrib_attempts$S551
	push	eax
	push	OFFSET $SG1473
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 24					; 00000018H
; Line 2796
$L1471:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_dump_combine_total_stats ENDP
_TEXT	ENDS
END
