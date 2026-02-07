	TITLE	cse.c
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
_DATA	SEGMENT
_?init@?1??cse_insn@@9@9$S1368 DD 00H
_?everything@?1??note_mem_written@@9@9$S1591 DD 07H
_?everything@?3??cse_basic_block@@9@9$S1679 DD 07H
_DATA	ENDS
EXTRN	_mode_size:BYTE
EXTRN	_const0_rtx:DWORD
EXTRN	_rtx_length:BYTE
EXTRN	_rtx_format:BYTE
_TEXT	SEGMENT
; File cse.c
_x$ = 8
_i$ = -20
_j$ = -16
_code$ = -8
_fmt$ = -4
_total$ = -12
_rtx_cost PROC NEAR
; Line 437
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	push	ebx
	push	esi
	push	edi
; Line 443
	cmp	DWORD PTR _x$[ebp], 0
	jne	$L480
; Line 444
	sub	eax, eax
	jmp	$L474
; Line 446
$L480:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$[ebp], eax
; Line 447
	mov	eax, DWORD PTR _code$[ebp]
	mov	DWORD PTR -24+[ebp], eax
	jmp	$L481
; Line 449
$L485:
; Line 450
	mov	eax, 1
	jmp	$L474
; Line 451
$L486:
; Line 452
	mov	eax, 2
	jmp	$L474
; Line 453
$L487:
	mov	eax, DWORD PTR _const0_rtx
	cmp	DWORD PTR _x$[ebp], eax
	jne	$L488
	sub	eax, eax
	jmp	$L474
$L488:
	mov	eax, DWORD PTR _x$[ebp]
	cmp	DWORD PTR [eax+4], 63			; 0000003fH
	jae	$L489
	mov	eax, 1
	jmp	$L474
$L489:
$L490:
	mov	eax, 3
	jmp	$L474
$L491:
	mov	eax, 5
	jmp	$L474
$L492:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L493
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L493
	mov	eax, 2
	jmp	$L474
$L493:
; Line 454
	jmp	$L482
$L481:
	sub	DWORD PTR -24+[ebp], 30			; 0000001eH
	cmp	DWORD PTR -24+[ebp], 14			; 0000000eH
	ja	$L482
	shl	DWORD PTR -24+[ebp], 2
	mov	eax, DWORD PTR -24+[ebp]
	jmp	DWORD PTR $L1692[eax]
$L1692:
	DD	OFFSET $L487
	DD	OFFSET $L491
	DD	OFFSET $L490
	DD	OFFSET $L482
	DD	OFFSET $L485
	DD	OFFSET $L486
	DD	OFFSET $L482
	DD	OFFSET $L482
	DD	OFFSET $L490
	DD	OFFSET $L490
	DD	OFFSET $L482
	DD	OFFSET $L482
	DD	OFFSET $L482
	DD	OFFSET $L482
	DD	OFFSET $L492
$L482:
; Line 456
	mov	DWORD PTR _total$[ebp], 2
; Line 457
	cmp	DWORD PTR _code$[ebp], 37		; 00000025H
	jne	$L494
; Line 458
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	add	eax, eax
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	mov	DWORD PTR _total$[ebp], eax
; Line 462
$L494:
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_format[eax*4]
	mov	DWORD PTR _fmt$[ebp], eax
; Line 463
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_length[eax*4]
	dec	eax
	mov	DWORD PTR _i$[ebp], eax
	jmp	$L495
$L496:
	dec	DWORD PTR _i$[ebp]
$L495:
	cmp	DWORD PTR _i$[ebp], 0
	jl	$L497
; Line 464
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 101				; 00000065H
	jne	$L498
; Line 465
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	push	eax
	call	_rtx_cost
	add	esp, 4
	add	DWORD PTR _total$[ebp], eax
; Line 466
	jmp	$L499
$L498:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 69					; 00000045H
	jne	$L500
; Line 467
	mov	DWORD PTR _j$[ebp], 0
	jmp	$L501
$L502:
	inc	DWORD PTR _j$[ebp]
$L501:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$[ebp]
	cmp	DWORD PTR [eax], ecx
	jbe	$L503
; Line 468
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	push	eax
	call	_rtx_cost
	add	esp, 4
	add	DWORD PTR _total$[ebp], eax
	jmp	$L502
$L503:
; Line 470
$L500:
$L499:
	jmp	$L496
$L497:
	mov	eax, DWORD PTR _total$[ebp]
	jmp	$L474
; Line 471
$L474:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_rtx_cost ENDP
_TEXT	ENDS
EXTRN	_memset:NEAR
EXTRN	_memcpy:NEAR
_BSS	SEGMENT
_table$S452 DD	01fH DUP (?)
_max_reg$S424 DD 01H DUP (?)
_max_qty$S425 DD 01H DUP (?)
_next_qty$S426 DD 01H DUP (?)
_qty_first_reg$S427 DD 01H DUP (?)
_qty_last_reg$S428 DD 01H DUP (?)
_qty_const$S429 DD 01H DUP (?)
_qty_const_insn$S430 DD 01H DUP (?)
_prev_insn_cc0$S431 DD 01H DUP (?)
_prev_insn_explicit_cc0$S432 DD 01H DUP (?)
_prev_insn$S433 DD 01H DUP (?)
_reg_qty$S435 DD 01H DUP (?)
_reg_next_eqv$S436 DD 01H DUP (?)
_reg_prev_eqv$S437 DD 01H DUP (?)
_reg_rtx$S438 DD 01H DUP (?)
_reg_tick$S439 DD 01H DUP (?)
_reg_in_table$S440 DD 01H DUP (?)
_all_minus_one$S441 DD 01H DUP (?)
_consec_ints$S442 DD 01H DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
_this$516 = -12
_next$517 = -16
_i$ = -8
_vecsize$ = -4
_new_basic_block PROC NEAR
; Line 478
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 480
	mov	eax, DWORD PTR _max_reg$S424
	shl	eax, 2
	mov	DWORD PTR _vecsize$[ebp], eax
; Line 481
	mov	eax, DWORD PTR _max_reg$S424
	mov	DWORD PTR _next_qty$S426, eax
; Line 483
	mov	eax, DWORD PTR _vecsize$[ebp]
	push	eax
	push	0
	mov	eax, DWORD PTR _reg_rtx$S438
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 484
	mov	eax, DWORD PTR _vecsize$[ebp]
	push	eax
	push	0
	mov	eax, DWORD PTR _reg_tick$S439
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 486
	mov	eax, DWORD PTR _vecsize$[ebp]
	push	eax
	mov	eax, DWORD PTR _all_minus_one$S441
	push	eax
	mov	eax, DWORD PTR _reg_in_table$S440
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
; Line 487
	mov	eax, DWORD PTR _vecsize$[ebp]
	push	eax
	mov	eax, DWORD PTR _all_minus_one$S441
	push	eax
	mov	eax, DWORD PTR _reg_next_eqv$S436
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
; Line 488
	mov	eax, DWORD PTR _vecsize$[ebp]
	push	eax
	mov	eax, DWORD PTR _all_minus_one$S441
	push	eax
	mov	eax, DWORD PTR _reg_prev_eqv$S437
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
; Line 489
	mov	eax, DWORD PTR _vecsize$[ebp]
	push	eax
	mov	eax, DWORD PTR _consec_ints$S442
	push	eax
	mov	eax, DWORD PTR _reg_qty$S435
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
; Line 491
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L510
$L511:
	inc	DWORD PTR _i$[ebp]
$L510:
	mov	eax, DWORD PTR _max_qty$S425
	cmp	DWORD PTR _i$[ebp], eax
	jge	$L512
; Line 493
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _qty_first_reg$S427
	mov	DWORD PTR [edx+ecx*4], eax
; Line 494
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _qty_last_reg$S428
	mov	DWORD PTR [edx+ecx*4], eax
; Line 495
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _qty_const$S429
	mov	DWORD PTR [ecx+eax*4], 0
; Line 496
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _qty_const_insn$S430
	mov	DWORD PTR [ecx+eax*4], 0
; Line 497
	jmp	$L511
$L512:
; Line 499
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L513
$L514:
	inc	DWORD PTR _i$[ebp]
$L513:
	cmp	DWORD PTR _i$[ebp], 31			; 0000001fH
	jge	$L515
; Line 502
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _table$S452[eax*4]
	mov	DWORD PTR _this$516[ebp], eax
	jmp	$L518
$L519:
	mov	eax, DWORD PTR _next$517[ebp]
	mov	DWORD PTR _this$516[ebp], eax
$L518:
	cmp	DWORD PTR _this$516[ebp], 0
	je	$L520
; Line 504
	mov	eax, DWORD PTR _this$516[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _next$517[ebp], eax
; Line 505
	mov	eax, DWORD PTR _this$516[ebp]
	push	eax
	call	_free_element
	add	esp, 4
; Line 506
	jmp	$L519
$L520:
; Line 507
	jmp	$L514
$L515:
; Line 509
	push	124					; 0000007cH
	push	0
	push	OFFSET _table$S452
	call	_memset
	add	esp, 12					; 0000000cH
; Line 511
	mov	DWORD PTR _prev_insn_cc0$S431, 0
; Line 512
	mov	DWORD PTR _prev_insn_explicit_cc0$S432, 0
; Line 513
	mov	DWORD PTR _prev_insn$S433, 0
; Line 514
$L505:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_new_basic_block ENDP
_reg$ = 8
_q$ = -4
_make_new_qty PROC NEAR
; Line 521
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 524
	mov	eax, DWORD PTR _next_qty$S426
	mov	ecx, DWORD PTR _reg$[ebp]
	mov	edx, DWORD PTR _reg_qty$S435
	mov	DWORD PTR [edx+ecx*4], eax
	inc	DWORD PTR _next_qty$S426
	mov	eax, DWORD PTR _reg$[ebp]
	mov	ecx, DWORD PTR _reg_qty$S435
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _q$[ebp], eax
; Line 525
	mov	eax, DWORD PTR _reg$[ebp]
	mov	ecx, DWORD PTR _q$[ebp]
	mov	edx, DWORD PTR _qty_first_reg$S427
	mov	DWORD PTR [edx+ecx*4], eax
; Line 526
	mov	eax, DWORD PTR _reg$[ebp]
	mov	ecx, DWORD PTR _q$[ebp]
	mov	edx, DWORD PTR _qty_last_reg$S428
	mov	DWORD PTR [edx+ecx*4], eax
; Line 527
$L523:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_make_new_qty ENDP
_TEXT	ENDS
EXTRN	_abort:NEAR
EXTRN	_regno_first_uid:DWORD
EXTRN	_regno_last_uid:DWORD
_BSS	SEGMENT
_cse_basic_block_start$S444 DD 01H DUP (?)
_cse_basic_block_end$S445 DD 01H DUP (?)
_uid_cuid$S446 DD 01H DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
_new$ = 8
_old$ = 12
_lastr$ = -12
_firstr$ = -8
_q$ = -4
_make_regs_eqv PROC NEAR
; Line 535
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 537
	mov	eax, DWORD PTR _old$[ebp]
	mov	ecx, DWORD PTR _reg_qty$S435
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _q$[ebp], eax
; Line 540
	mov	eax, DWORD PTR _q$[ebp]
	cmp	DWORD PTR _old$[ebp], eax
	jne	$L532
; Line 541
	call	_abort
; Line 543
$L532:
	mov	eax, DWORD PTR _q$[ebp]
	mov	ecx, DWORD PTR _new$[ebp]
	mov	edx, DWORD PTR _reg_qty$S435
	mov	DWORD PTR [edx+ecx*4], eax
; Line 544
	mov	eax, DWORD PTR _q$[ebp]
	mov	ecx, DWORD PTR _qty_first_reg$S427
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _firstr$[ebp], eax
; Line 545
	mov	eax, DWORD PTR _q$[ebp]
	mov	ecx, DWORD PTR _qty_last_reg$S428
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _lastr$[ebp], eax
; Line 556
	cmp	DWORD PTR _new$[ebp], 10		; 0000000aH
	jl	$L534
	cmp	DWORD PTR _firstr$[ebp], 10		; 0000000aH
	jl	$L535
	mov	eax, DWORD PTR _new$[ebp]
	mov	ecx, DWORD PTR _regno_last_uid
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	ecx, DWORD PTR _uid_cuid$S446
	movsx	eax, WORD PTR [ecx+eax*2]
	cmp	eax, DWORD PTR _cse_basic_block_end$S445
	jg	$L536
	mov	eax, DWORD PTR _new$[ebp]
	mov	ecx, DWORD PTR _regno_first_uid
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	ecx, DWORD PTR _uid_cuid$S446
	movsx	eax, WORD PTR [ecx+eax*2]
	cmp	eax, DWORD PTR _cse_basic_block_start$S444
	jge	$L534
$L536:
	mov	eax, DWORD PTR _firstr$[ebp]
	mov	ecx, DWORD PTR _regno_last_uid
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	ecx, DWORD PTR _uid_cuid$S446
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	ecx, DWORD PTR _new$[ebp]
	mov	edx, DWORD PTR _regno_last_uid
	movsx	ecx, WORD PTR [edx+ecx*2]
	mov	edx, DWORD PTR _uid_cuid$S446
	movsx	ecx, WORD PTR [edx+ecx*2]
	cmp	eax, ecx
	jge	$L534
$L535:
; Line 558
	mov	eax, DWORD PTR _new$[ebp]
	mov	ecx, DWORD PTR _firstr$[ebp]
	mov	edx, DWORD PTR _reg_prev_eqv$S437
	mov	DWORD PTR [edx+ecx*4], eax
; Line 559
	mov	eax, DWORD PTR _firstr$[ebp]
	mov	ecx, DWORD PTR _new$[ebp]
	mov	edx, DWORD PTR _reg_next_eqv$S436
	mov	DWORD PTR [edx+ecx*4], eax
; Line 560
	mov	eax, DWORD PTR _new$[ebp]
	mov	ecx, DWORD PTR _reg_prev_eqv$S437
	mov	DWORD PTR [ecx+eax*4], -1
; Line 561
	mov	eax, DWORD PTR _new$[ebp]
	mov	ecx, DWORD PTR _q$[ebp]
	mov	edx, DWORD PTR _qty_first_reg$S427
	mov	DWORD PTR [edx+ecx*4], eax
; Line 563
	jmp	$L537
$L534:
; Line 567
$L539:
	cmp	DWORD PTR _lastr$[ebp], 10		; 0000000aH
	jge	$L540
	cmp	DWORD PTR _new$[ebp], 10		; 0000000aH
	jl	$L540
; Line 568
	mov	eax, DWORD PTR _lastr$[ebp]
	mov	ecx, DWORD PTR _reg_prev_eqv$S437
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _lastr$[ebp], eax
	jmp	$L539
$L540:
; Line 569
	mov	eax, DWORD PTR _lastr$[ebp]
	mov	ecx, DWORD PTR _reg_next_eqv$S436
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _new$[ebp]
	mov	edx, DWORD PTR _reg_next_eqv$S436
	mov	DWORD PTR [edx+ecx*4], eax
; Line 570
	mov	eax, DWORD PTR _lastr$[ebp]
	mov	ecx, DWORD PTR _reg_next_eqv$S436
	cmp	DWORD PTR [ecx+eax*4], 0
	jl	$L541
; Line 571
	mov	eax, DWORD PTR _new$[ebp]
	mov	ecx, DWORD PTR _lastr$[ebp]
	mov	edx, DWORD PTR _reg_next_eqv$S436
	mov	ecx, DWORD PTR [edx+ecx*4]
	mov	edx, DWORD PTR _reg_prev_eqv$S437
	mov	DWORD PTR [edx+ecx*4], eax
; Line 572
	jmp	$L542
$L541:
; Line 573
	mov	eax, DWORD PTR _new$[ebp]
	mov	ecx, DWORD PTR _q$[ebp]
	mov	edx, DWORD PTR _qty_last_reg$S428
	mov	DWORD PTR [edx+ecx*4], eax
$L542:
; Line 574
	mov	eax, DWORD PTR _new$[ebp]
	mov	ecx, DWORD PTR _lastr$[ebp]
	mov	edx, DWORD PTR _reg_next_eqv$S436
	mov	DWORD PTR [edx+ecx*4], eax
; Line 575
	mov	eax, DWORD PTR _lastr$[ebp]
	mov	ecx, DWORD PTR _new$[ebp]
	mov	edx, DWORD PTR _reg_prev_eqv$S437
	mov	DWORD PTR [edx+ecx*4], eax
; Line 576
$L537:
; Line 577
$L528:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_make_regs_eqv ENDP
_reg$ = 8
_n$ = -8
_p$ = -12
_q$ = -4
_reg_invalidate PROC NEAR
; Line 584
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 585
	mov	eax, DWORD PTR _reg$[ebp]
	mov	ecx, DWORD PTR _reg_next_eqv$S436
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _n$[ebp], eax
; Line 586
	mov	eax, DWORD PTR _reg$[ebp]
	mov	ecx, DWORD PTR _reg_prev_eqv$S437
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _p$[ebp], eax
; Line 587
	mov	eax, DWORD PTR _reg$[ebp]
	mov	ecx, DWORD PTR _reg_qty$S435
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _q$[ebp], eax
; Line 589
	mov	eax, DWORD PTR _reg$[ebp]
	mov	ecx, DWORD PTR _reg_tick$S439
	inc	DWORD PTR [ecx+eax*4]
; Line 591
	mov	eax, DWORD PTR _q$[ebp]
	cmp	DWORD PTR _reg$[ebp], eax
	jne	$L549
; Line 595
	mov	eax, DWORD PTR _q$[ebp]
	mov	ecx, DWORD PTR _reg_prev_eqv$S437
	cmp	DWORD PTR [ecx+eax*4], -1
	je	$L550
; Line 596
	call	_abort
; Line 597
$L550:
	mov	eax, DWORD PTR _q$[ebp]
	mov	ecx, DWORD PTR _reg_next_eqv$S436
	cmp	DWORD PTR [ecx+eax*4], -1
	je	$L551
; Line 598
	call	_abort
; Line 599
$L551:
	jmp	$L545
; Line 602
$L549:
	cmp	DWORD PTR _n$[ebp], -1
	je	$L552
; Line 603
	mov	eax, DWORD PTR _p$[ebp]
	mov	ecx, DWORD PTR _n$[ebp]
	mov	edx, DWORD PTR _reg_prev_eqv$S437
	mov	DWORD PTR [edx+ecx*4], eax
; Line 604
	jmp	$L553
$L552:
; Line 605
	mov	eax, DWORD PTR _p$[ebp]
	mov	ecx, DWORD PTR _q$[ebp]
	mov	edx, DWORD PTR _qty_last_reg$S428
	mov	DWORD PTR [edx+ecx*4], eax
$L553:
; Line 606
	cmp	DWORD PTR _p$[ebp], -1
	je	$L554
; Line 607
	mov	eax, DWORD PTR _n$[ebp]
	mov	ecx, DWORD PTR _p$[ebp]
	mov	edx, DWORD PTR _reg_next_eqv$S436
	mov	DWORD PTR [edx+ecx*4], eax
; Line 608
	jmp	$L555
$L554:
; Line 609
	mov	eax, DWORD PTR _n$[ebp]
	mov	ecx, DWORD PTR _q$[ebp]
	mov	edx, DWORD PTR _qty_first_reg$S427
	mov	DWORD PTR [edx+ecx*4], eax
$L555:
; Line 611
	mov	eax, DWORD PTR _reg$[ebp]
	mov	ecx, DWORD PTR _reg$[ebp]
	mov	edx, DWORD PTR _reg_qty$S435
	mov	DWORD PTR [edx+ecx*4], eax
; Line 612
	mov	eax, DWORD PTR _reg$[ebp]
	mov	ecx, DWORD PTR _reg$[ebp]
	mov	edx, DWORD PTR _qty_first_reg$S427
	mov	DWORD PTR [edx+ecx*4], eax
; Line 613
	mov	eax, DWORD PTR _reg$[ebp]
	mov	ecx, DWORD PTR _reg$[ebp]
	mov	edx, DWORD PTR _qty_last_reg$S428
	mov	DWORD PTR [edx+ecx*4], eax
; Line 614
	mov	eax, DWORD PTR _reg$[ebp]
	mov	ecx, DWORD PTR _reg_next_eqv$S436
	mov	DWORD PTR [ecx+eax*4], -1
; Line 615
	mov	eax, DWORD PTR _reg$[ebp]
	mov	ecx, DWORD PTR _reg_prev_eqv$S437
	mov	DWORD PTR [ecx+eax*4], -1
; Line 616
$L545:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_reg_invalidate ENDP
_x$ = 8
_code$ = -8
_i$ = -16
_j$ = -12
_fmt$ = -4
_regno$565 = -20
_mention_regs PROC NEAR
; Line 630
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	push	ebx
	push	esi
	push	edi
; Line 635
	cmp	DWORD PTR _x$[ebp], 0
	jne	$L563
; Line 636
	jmp	$L558
; Line 638
$L563:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$[ebp], eax
; Line 639
	cmp	DWORD PTR _code$[ebp], 34		; 00000022H
	jne	$L564
; Line 641
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _regno$565[ebp], eax
; Line 642
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR _regno$565[ebp]
	mov	edx, DWORD PTR _reg_rtx$S438
	mov	DWORD PTR [edx+ecx*4], eax
; Line 644
	mov	eax, DWORD PTR _regno$565[ebp]
	mov	ecx, DWORD PTR _reg_in_table$S440
	cmp	DWORD PTR [ecx+eax*4], 0
	jl	$L566
	mov	eax, DWORD PTR _regno$565[ebp]
	mov	ecx, DWORD PTR _reg_in_table$S440
	mov	edx, DWORD PTR _regno$565[ebp]
	mov	ebx, DWORD PTR _reg_tick$S439
	mov	edx, DWORD PTR [ebx+edx*4]
	cmp	DWORD PTR [ecx+eax*4], edx
	je	$L566
; Line 645
	mov	eax, DWORD PTR _regno$565[ebp]
	push	eax
	call	_remove_invalid_refs
	add	esp, 4
; Line 647
$L566:
	mov	eax, DWORD PTR _regno$565[ebp]
	mov	ecx, DWORD PTR _reg_tick$S439
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _regno$565[ebp]
	mov	edx, DWORD PTR _reg_in_table$S440
	mov	DWORD PTR [edx+ecx*4], eax
; Line 649
	jmp	$L558
; Line 652
$L564:
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_format[eax*4]
	mov	DWORD PTR _fmt$[ebp], eax
; Line 653
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_length[eax*4]
	dec	eax
	mov	DWORD PTR _i$[ebp], eax
	jmp	$L567
$L568:
	dec	DWORD PTR _i$[ebp]
$L567:
	cmp	DWORD PTR _i$[ebp], 0
	jl	$L569
; Line 654
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 101				; 00000065H
	jne	$L570
; Line 655
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	push	eax
	call	_mention_regs
	add	esp, 4
; Line 656
	jmp	$L571
$L570:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 69					; 00000045H
	jne	$L572
; Line 657
	mov	DWORD PTR _j$[ebp], 0
	jmp	$L573
$L574:
	inc	DWORD PTR _j$[ebp]
$L573:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$[ebp]
	cmp	DWORD PTR [eax], ecx
	jbe	$L575
; Line 658
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	push	eax
	call	_mention_regs
	add	esp, 4
	jmp	$L574
$L575:
; Line 659
$L572:
$L571:
	jmp	$L568
$L569:
$L558:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_mention_regs ENDP
_x$ = 8
_classp$ = 12
_modified$ = 16
_regno$582 = -4
_oregno$591 = -8
_insert_regs PROC NEAR
; Line 676
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 677
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L581
; Line 679
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _regno$582[ebp], eax
; Line 680
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR _regno$582[ebp]
	mov	edx, DWORD PTR _reg_rtx$S438
	mov	DWORD PTR [edx+ecx*4], eax
; Line 681
	cmp	DWORD PTR _modified$[ebp], 0
	jne	$L584
	mov	eax, DWORD PTR _regno$582[ebp]
	mov	ecx, DWORD PTR _reg_qty$S435
	mov	edx, DWORD PTR _regno$582[ebp]
	cmp	DWORD PTR [ecx+eax*4], edx
	jne	$L583
$L584:
; Line 683
	cmp	DWORD PTR _classp$[ebp], 0
	je	$L585
	mov	eax, DWORD PTR _classp$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L585
; Line 685
	mov	eax, DWORD PTR _classp$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _regno$582[ebp]
	push	eax
	call	_make_regs_eqv
	add	esp, 8
; Line 688
	mov	eax, DWORD PTR _classp$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _classp$[ebp]
	mov	ecx, DWORD PTR [ecx]
	mov	ecx, DWORD PTR [ecx+4]
	mov	edx, DWORD PTR _reg_rtx$S438
	mov	DWORD PTR [edx+ecx*4], eax
; Line 690
	jmp	$L586
$L585:
; Line 691
	mov	eax, DWORD PTR _regno$582[ebp]
	push	eax
	call	_make_new_qty
	add	esp, 4
$L586:
; Line 692
	mov	eax, 1
	jmp	$L580
; Line 694
$L583:
; Line 699
	jmp	$L587
$L581:
; Line 703
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L588
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L588
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	cmp	DWORD PTR _mode_size[eax], 4
	jg	$L588
	cmp	DWORD PTR _modified$[ebp], 0
	jne	$L589
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg_qty$S435
	mov	edx, DWORD PTR _x$[ebp]
	mov	edx, DWORD PTR [edx+4]
	mov	edx, DWORD PTR [edx+4]
	cmp	DWORD PTR [ecx+eax*4], edx
	jne	$L588
$L589:
; Line 707
	cmp	DWORD PTR _classp$[ebp], 0
	je	$L590
	mov	eax, DWORD PTR _classp$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L590
	mov	eax, DWORD PTR _classp$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L590
	mov	eax, DWORD PTR _classp$[ebp]
	mov	eax, DWORD PTR [eax]
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
	jne	$L590
; Line 709
	mov	eax, DWORD PTR _classp$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _oregno$591[ebp], eax
; Line 710
	mov	eax, DWORD PTR _oregno$591[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_make_regs_eqv
	add	esp, 8
; Line 713
	mov	eax, DWORD PTR _classp$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _oregno$591[ebp]
	mov	edx, DWORD PTR _reg_rtx$S438
	mov	DWORD PTR [edx+ecx*4], eax
; Line 715
	jmp	$L592
$L590:
; Line 716
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_make_new_qty
	add	esp, 4
$L592:
; Line 717
	mov	eax, 1
	jmp	$L580
; Line 719
	jmp	$L593
$L588:
; Line 720
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_mention_regs
	add	esp, 4
$L593:
$L587:
; Line 721
	sub	eax, eax
	jmp	$L580
; Line 722
$L580:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_insert_regs ENDP
_TEXT	ENDS
_BSS	SEGMENT
_free_element_chain$S453 DD 01H DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
_elt$ = 8
_free_element PROC NEAR
; Line 731
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 732
	mov	eax, DWORD PTR _free_element_chain$S453
	mov	ecx, DWORD PTR _elt$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 733
	mov	eax, DWORD PTR _elt$[ebp]
	mov	DWORD PTR _free_element_chain$S453, eax
; Line 734
$L595:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_free_element ENDP
_TEXT	ENDS
EXTRN	_oballoc:NEAR
_BSS	SEGMENT
_n_elements_made$S454 DD 01H DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
_elt$ = -4
_get_element PROC NEAR
; Line 740
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 741
	mov	eax, DWORD PTR _free_element_chain$S453
	mov	DWORD PTR _elt$[ebp], eax
; Line 742
	cmp	DWORD PTR _elt$[ebp], 0
	je	$L599
; Line 744
	mov	eax, DWORD PTR _elt$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _free_element_chain$S453, eax
; Line 745
	mov	eax, DWORD PTR _elt$[ebp]
	jmp	$L597
; Line 747
$L599:
	inc	DWORD PTR _n_elements_made$S454
; Line 748
	push	40					; 00000028H
	call	_oballoc
	add	esp, 4
	jmp	$L597
; Line 749
$L597:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_get_element ENDP
_elt$ = 8
_hash$ = 12
_prev$606 = -4
_next$607 = -8
_newfirst$611 = -12
_prev$615 = -16
_next$616 = -20
_p$621 = -24
_remove	PROC NEAR
; Line 760
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	push	ebx
	push	esi
	push	edi
; Line 761
	cmp	DWORD PTR _elt$[ebp], 0
	jne	$L605
; Line 762
	jmp	$L604
; Line 765
$L605:
	mov	eax, DWORD PTR _elt$[ebp]
	mov	DWORD PTR [eax+20], 0
; Line 770
	mov	eax, DWORD PTR _elt$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _prev$606[ebp], eax
; Line 771
	mov	eax, DWORD PTR _elt$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _next$607[ebp], eax
; Line 773
	cmp	DWORD PTR _next$607[ebp], 0
	je	$L608
	mov	eax, DWORD PTR _prev$606[ebp]
	mov	ecx, DWORD PTR _next$607[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 775
$L608:
	cmp	DWORD PTR _prev$606[ebp], 0
	je	$L609
; Line 776
	mov	eax, DWORD PTR _next$607[ebp]
	mov	ecx, DWORD PTR _prev$606[ebp]
	mov	DWORD PTR [ecx+12], eax
; Line 777
	jmp	$L610
$L609:
; Line 779
	mov	eax, DWORD PTR _next$607[ebp]
	mov	DWORD PTR _newfirst$611[ebp], eax
; Line 780
$L613:
	cmp	DWORD PTR _next$607[ebp], 0
	je	$L614
; Line 782
	mov	eax, DWORD PTR _newfirst$611[ebp]
	mov	ecx, DWORD PTR _next$607[ebp]
	mov	DWORD PTR [ecx+20], eax
; Line 783
	mov	eax, DWORD PTR _next$607[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _next$607[ebp], eax
; Line 784
	jmp	$L613
$L614:
; Line 785
$L610:
; Line 791
	mov	eax, DWORD PTR _elt$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _prev$615[ebp], eax
; Line 792
	mov	eax, DWORD PTR _elt$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _next$616[ebp], eax
; Line 794
	cmp	DWORD PTR _next$616[ebp], 0
	je	$L617
	mov	eax, DWORD PTR _prev$615[ebp]
	mov	ecx, DWORD PTR _next$616[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 796
$L617:
	cmp	DWORD PTR _prev$615[ebp], 0
	je	$L618
; Line 797
	mov	eax, DWORD PTR _next$616[ebp]
	mov	ecx, DWORD PTR _prev$615[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 798
	jmp	$L619
$L618:
; Line 799
	mov	eax, DWORD PTR _next$616[ebp]
	mov	ecx, DWORD PTR _hash$[ebp]
	mov	DWORD PTR _table$S452[ecx*4], eax
$L619:
; Line 804
	mov	eax, DWORD PTR _elt$[ebp]
	cmp	DWORD PTR [eax+24], 0
	je	$L620
	mov	eax, DWORD PTR _elt$[ebp]
	mov	ecx, DWORD PTR _elt$[ebp]
	cmp	DWORD PTR [eax+24], ecx
	je	$L620
; Line 806
	mov	eax, DWORD PTR _elt$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _p$621[ebp], eax
; Line 807
$L623:
	mov	eax, DWORD PTR _p$621[ebp]
	mov	ecx, DWORD PTR _elt$[ebp]
	cmp	DWORD PTR [eax+24], ecx
	je	$L624
; Line 808
	mov	eax, DWORD PTR _p$621[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _p$621[ebp], eax
	jmp	$L623
$L624:
; Line 809
	mov	eax, DWORD PTR _elt$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	ecx, DWORD PTR _p$621[ebp]
	mov	DWORD PTR [ecx+24], eax
; Line 810
	mov	eax, DWORD PTR _p$621[ebp]
	mov	ecx, DWORD PTR _p$621[ebp]
	cmp	DWORD PTR [eax+24], ecx
	jne	$L625
; Line 811
	mov	eax, DWORD PTR _p$621[ebp]
	mov	DWORD PTR [eax+24], 0
; Line 812
$L625:
; Line 814
$L620:
	mov	eax, DWORD PTR _elt$[ebp]
	push	eax
	call	_free_element
	add	esp, 4
; Line 815
$L604:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_remove	ENDP
_x$ = 8
_hash$ = 12
_mode$ = 16
_p$ = -4
_lookup	PROC NEAR
; Line 831
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 834
	mov	eax, DWORD PTR _hash$[ebp]
	mov	eax, DWORD PTR _table$S452[eax*4]
	mov	DWORD PTR _p$[ebp], eax
	jmp	$L631
$L632:
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _p$[ebp], eax
$L631:
	cmp	DWORD PTR _p$[ebp], 0
	je	$L633
; Line 835
	mov	eax, DWORD PTR _p$[ebp]
	mov	ecx, DWORD PTR _mode$[ebp]
	cmp	DWORD PTR [eax+32], ecx
	jne	$L634
	mov	eax, DWORD PTR _p$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	cmp	DWORD PTR [eax], ecx
	je	$L635
	push	1
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_exp_equiv_p
	add	esp, 12					; 0000000cH
	or	eax, eax
	je	$L634
$L635:
; Line 836
	mov	eax, DWORD PTR _p$[ebp]
	jmp	$L629
; Line 838
$L634:
	jmp	$L632
$L633:
	sub	eax, eax
	jmp	$L629
; Line 839
$L629:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_lookup	ENDP
_p$ = -4
_regno$643 = -8
_x$ = 8
_hash$ = 12
_mode$ = 16
_lookup_for_remove PROC NEAR
; Line 849
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 852
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L642
; Line 854
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _regno$643[ebp], eax
; Line 857
	mov	eax, DWORD PTR _hash$[ebp]
	mov	eax, DWORD PTR _table$S452[eax*4]
	mov	DWORD PTR _p$[ebp], eax
	jmp	$L644
$L645:
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _p$[ebp], eax
$L644:
	cmp	DWORD PTR _p$[ebp], 0
	je	$L646
; Line 859
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L647
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _regno$643[ebp]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L647
; Line 860
	mov	eax, DWORD PTR _p$[ebp]
	jmp	$L640
; Line 861
$L647:
	jmp	$L645
$L646:
; Line 862
	jmp	$L648
$L642:
; Line 864
	mov	eax, DWORD PTR _hash$[ebp]
	mov	eax, DWORD PTR _table$S452[eax*4]
	mov	DWORD PTR _p$[ebp], eax
	jmp	$L649
$L650:
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _p$[ebp], eax
$L649:
	cmp	DWORD PTR _p$[ebp], 0
	je	$L651
; Line 865
	mov	eax, DWORD PTR _p$[ebp]
	mov	ecx, DWORD PTR _mode$[ebp]
	cmp	DWORD PTR [eax+32], ecx
	jne	$L652
	mov	eax, DWORD PTR _p$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	cmp	DWORD PTR [eax], ecx
	je	$L653
	push	0
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_exp_equiv_p
	add	esp, 12					; 0000000cH
	or	eax, eax
	je	$L652
$L653:
; Line 866
	mov	eax, DWORD PTR _p$[ebp]
	jmp	$L640
; Line 867
$L652:
	jmp	$L650
$L651:
$L648:
; Line 869
	sub	eax, eax
	jmp	$L640
; Line 870
$L640:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_lookup_for_remove ENDP
_x$ = 8
_code$ = 12
_p$ = -4
_lookup_as_function PROC NEAR
; Line 879
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 881
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	0
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_safe_hash
	add	esp, 8
	mov	ecx, 31					; 0000001fH
	cdq
	idiv	ecx
	push	edx
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_lookup
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _p$[ebp], eax
; Line 882
	cmp	DWORD PTR _p$[ebp], 0
	jne	$L659
; Line 883
	sub	eax, eax
	jmp	$L657
; Line 885
$L659:
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _p$[ebp], eax
	jmp	$L660
$L661:
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _p$[ebp], eax
$L660:
	cmp	DWORD PTR _p$[ebp], 0
	je	$L662
; Line 889
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	cmp	eax, DWORD PTR _code$[ebp]
	jne	$L663
	push	1
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_exp_equiv_p
	add	esp, 12					; 0000000cH
	or	eax, eax
	je	$L663
; Line 890
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	jmp	$L657
; Line 891
$L663:
	jmp	$L661
$L662:
; Line 893
	sub	eax, eax
	jmp	$L657
; Line 894
$L657:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_lookup_as_function ENDP
_TEXT	ENDS
EXTRN	_frame_pointer_rtx:DWORD
EXTRN	_arg_pointer_rtx:DWORD
_BSS	SEGMENT
_this_insn$S434 DD 01H DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
_subelt$704 = -28
_subelt_prev$705 = -24
_x$ = 8
_classp$ = 12
_hash$ = 16
_mode$ = 20
_elt$ = -4
_p$677 = -8
_p$682 = -12
_next$683 = -16
_subexp$702 = -20
_subhash$703 = -32
_insert	PROC NEAR
; Line 933
	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H
	push	ebx
	push	esi
	push	edi
; Line 938
	call	_get_element
	mov	DWORD PTR _elt$[ebp], eax
; Line 939
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR _elt$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 940
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_rtx_cost
	add	esp, 4
	add	eax, eax
	mov	ecx, DWORD PTR _elt$[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 942
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L671
	mov	eax, DWORD PTR _x$[ebp]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L671
; Line 943
	mov	eax, DWORD PTR _elt$[ebp]
	dec	DWORD PTR [eax+28]
; Line 944
$L671:
	mov	eax, DWORD PTR _elt$[ebp]
	mov	DWORD PTR [eax+12], 0
; Line 945
	mov	eax, DWORD PTR _elt$[ebp]
	mov	DWORD PTR [eax+16], 0
; Line 946
	mov	eax, DWORD PTR _hash$[ebp]
	mov	eax, DWORD PTR _table$S452[eax*4]
	mov	ecx, DWORD PTR _elt$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 947
	mov	eax, DWORD PTR _elt$[ebp]
	mov	DWORD PTR [eax+8], 0
; Line 948
	mov	eax, DWORD PTR _elt$[ebp]
	mov	DWORD PTR [eax+24], 0
; Line 949
	mov	eax, DWORD PTR _elt$[ebp]
	mov	BYTE PTR [eax+36], 0
; Line 950
	mov	eax, DWORD PTR _elt$[ebp]
	mov	BYTE PTR [eax+38], 0
; Line 951
	mov	eax, DWORD PTR _mode$[ebp]
	mov	ecx, DWORD PTR _elt$[ebp]
	mov	DWORD PTR [ecx+32], eax
; Line 952
	mov	eax, DWORD PTR _hash$[ebp]
	cmp	DWORD PTR _table$S452[eax*4], 0
	je	$L672
; Line 953
	mov	eax, DWORD PTR _elt$[ebp]
	mov	ecx, DWORD PTR _hash$[ebp]
	mov	ecx, DWORD PTR _table$S452[ecx*4]
	mov	DWORD PTR [ecx+8], eax
; Line 954
$L672:
	mov	eax, DWORD PTR _elt$[ebp]
	mov	ecx, DWORD PTR _hash$[ebp]
	mov	DWORD PTR _table$S452[ecx*4], eax
; Line 957
	cmp	DWORD PTR _classp$[ebp], 0
	je	$L673
; Line 959
	mov	eax, DWORD PTR _elt$[ebp]
	mov	ecx, DWORD PTR _classp$[ebp]
	mov	ecx, DWORD PTR [ecx+28]
	cmp	DWORD PTR [eax+28], ecx
	jl	$L675
	mov	eax, DWORD PTR _elt$[ebp]
	mov	ecx, DWORD PTR _classp$[ebp]
	mov	ecx, DWORD PTR [ecx+28]
	cmp	DWORD PTR [eax+28], ecx
	jne	$L674
	mov	eax, DWORD PTR _elt$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L674
	mov	eax, DWORD PTR _classp$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L674
	mov	eax, DWORD PTR _elt$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _regno_last_uid
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	ecx, DWORD PTR _uid_cuid$S446
	movsx	eax, WORD PTR [ecx+eax*2]
	cmp	eax, DWORD PTR _cse_basic_block_end$S445
	jg	$L676
	mov	eax, DWORD PTR _elt$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _regno_first_uid
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	ecx, DWORD PTR _uid_cuid$S446
	movsx	eax, WORD PTR [ecx+eax*2]
	cmp	eax, DWORD PTR _cse_basic_block_start$S444
	jge	$L674
$L676:
	mov	eax, DWORD PTR _elt$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _regno_last_uid
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	ecx, DWORD PTR _uid_cuid$S446
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	ecx, DWORD PTR _classp$[ebp]
	mov	ecx, DWORD PTR [ecx]
	mov	ecx, DWORD PTR [ecx+4]
	mov	edx, DWORD PTR _regno_last_uid
	movsx	ecx, WORD PTR [edx+ecx*2]
	mov	edx, DWORD PTR _uid_cuid$S446
	movsx	ecx, WORD PTR [edx+ecx*2]
	cmp	eax, ecx
	jle	$L674
$L675:
; Line 963
	mov	eax, DWORD PTR _classp$[ebp]
	mov	ecx, DWORD PTR _elt$[ebp]
	mov	DWORD PTR [ecx+12], eax
; Line 964
	mov	eax, DWORD PTR _elt$[ebp]
	mov	ecx, DWORD PTR _classp$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 965
	mov	eax, DWORD PTR _elt$[ebp]
	mov	ecx, DWORD PTR _elt$[ebp]
	mov	DWORD PTR [ecx+20], eax
; Line 967
	mov	eax, DWORD PTR _classp$[ebp]
	mov	DWORD PTR _p$677[ebp], eax
	jmp	$L678
$L679:
	mov	eax, DWORD PTR _p$677[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _p$677[ebp], eax
$L678:
	cmp	DWORD PTR _p$677[ebp], 0
	je	$L680
; Line 968
	mov	eax, DWORD PTR _elt$[ebp]
	mov	ecx, DWORD PTR _p$677[ebp]
	mov	DWORD PTR [ecx+20], eax
	jmp	$L679
$L680:
; Line 970
	jmp	$L681
$L674:
; Line 976
	mov	eax, DWORD PTR _classp$[ebp]
	mov	DWORD PTR _p$682[ebp], eax
	jmp	$L684
$L685:
	mov	eax, DWORD PTR _next$683[ebp]
	mov	DWORD PTR _p$682[ebp], eax
$L684:
	mov	eax, DWORD PTR _p$682[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _next$683[ebp], eax
	cmp	DWORD PTR _next$683[ebp], 0
	je	$L686
	mov	eax, DWORD PTR _elt$[ebp]
	mov	ecx, DWORD PTR _next$683[ebp]
	mov	ecx, DWORD PTR [ecx+28]
	cmp	DWORD PTR [eax+28], ecx
	jg	$L687
	mov	eax, DWORD PTR _elt$[ebp]
	mov	ecx, DWORD PTR _next$683[ebp]
	mov	ecx, DWORD PTR [ecx+28]
	cmp	DWORD PTR [eax+28], ecx
	jne	$L686
	mov	eax, DWORD PTR _next$683[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L686
	mov	eax, DWORD PTR _elt$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L686
	mov	eax, DWORD PTR _next$683[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _regno_last_uid
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	ecx, DWORD PTR _uid_cuid$S446
	movsx	eax, WORD PTR [ecx+eax*2]
	cmp	eax, DWORD PTR _cse_basic_block_end$S445
	jg	$L688
	mov	eax, DWORD PTR _next$683[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _regno_first_uid
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	ecx, DWORD PTR _uid_cuid$S446
	movsx	eax, WORD PTR [ecx+eax*2]
	cmp	eax, DWORD PTR _cse_basic_block_start$S444
	jge	$L686
$L688:
	mov	eax, DWORD PTR _elt$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _regno_last_uid
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	ecx, DWORD PTR _uid_cuid$S446
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	ecx, DWORD PTR _next$683[ebp]
	mov	ecx, DWORD PTR [ecx]
	mov	ecx, DWORD PTR [ecx+4]
	mov	edx, DWORD PTR _regno_last_uid
	movsx	ecx, WORD PTR [edx+ecx*2]
	mov	edx, DWORD PTR _uid_cuid$S446
	movsx	ecx, WORD PTR [edx+ecx*2]
	cmp	eax, ecx
	jge	$L686
$L687:
	jmp	$L685
$L686:
; Line 978
	mov	eax, DWORD PTR _next$683[ebp]
	mov	ecx, DWORD PTR _elt$[ebp]
	mov	DWORD PTR [ecx+12], eax
; Line 979
	cmp	DWORD PTR _next$683[ebp], 0
	je	$L689
; Line 980
	mov	eax, DWORD PTR _elt$[ebp]
	mov	ecx, DWORD PTR _next$683[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 981
$L689:
	mov	eax, DWORD PTR _p$682[ebp]
	mov	ecx, DWORD PTR _elt$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 982
	mov	eax, DWORD PTR _elt$[ebp]
	mov	ecx, DWORD PTR _p$682[ebp]
	mov	DWORD PTR [ecx+12], eax
; Line 983
	mov	eax, DWORD PTR _classp$[ebp]
	mov	ecx, DWORD PTR _elt$[ebp]
	mov	DWORD PTR [ecx+20], eax
; Line 984
$L681:
; Line 986
	jmp	$L690
$L673:
; Line 987
	mov	eax, DWORD PTR _elt$[ebp]
	mov	ecx, DWORD PTR _elt$[ebp]
	mov	DWORD PTR [ecx+20], eax
$L690:
; Line 990
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L692
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L692
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L692
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L692
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2031616				; 001f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L692
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L691
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L691
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR _frame_pointer_rtx
	cmp	DWORD PTR [eax+4], ecx
	je	$L693
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR _arg_pointer_rtx
	cmp	DWORD PTR [eax+4], ecx
	jne	$L691
$L693:
$L692:
	mov	eax, DWORD PTR _elt$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L691
; Line 992
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR _elt$[ebp]
	mov	ecx, DWORD PTR [ecx+20]
	mov	ecx, DWORD PTR [ecx]
	mov	ecx, DWORD PTR [ecx+4]
	mov	edx, DWORD PTR _reg_qty$S435
	mov	ecx, DWORD PTR [edx+ecx*4]
	mov	edx, DWORD PTR _qty_const$S429
	mov	DWORD PTR [edx+ecx*4], eax
; Line 993
	mov	eax, DWORD PTR _this_insn$S434
	mov	ecx, DWORD PTR _elt$[ebp]
	mov	ecx, DWORD PTR [ecx+20]
	mov	ecx, DWORD PTR [ecx]
	mov	ecx, DWORD PTR [ecx+4]
	mov	edx, DWORD PTR _reg_qty$S435
	mov	ecx, DWORD PTR [edx+ecx*4]
	mov	edx, DWORD PTR _qty_const_insn$S430
	mov	DWORD PTR [edx+ecx*4], eax
; Line 996
$L691:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L694
; Line 1001
	mov	eax, DWORD PTR _elt$[ebp]
	cmp	DWORD PTR [eax+12], 0
	je	$L695
	mov	eax, DWORD PTR _elt$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L696
	mov	eax, DWORD PTR _elt$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L696
	mov	eax, DWORD PTR _elt$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L696
	mov	eax, DWORD PTR _elt$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L696
	mov	eax, DWORD PTR _elt$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2031616				; 001f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L696
	mov	eax, DWORD PTR _elt$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L695
	mov	eax, DWORD PTR _elt$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L695
	mov	eax, DWORD PTR _elt$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _frame_pointer_rtx
	cmp	DWORD PTR [eax+4], ecx
	je	$L697
	mov	eax, DWORD PTR _elt$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _arg_pointer_rtx
	cmp	DWORD PTR [eax+4], ecx
	jne	$L695
$L697:
$L696:
; Line 1003
	mov	eax, DWORD PTR _elt$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	mov	edx, DWORD PTR _reg_qty$S435
	mov	ecx, DWORD PTR [edx+ecx*4]
	mov	edx, DWORD PTR _qty_const$S429
	mov	DWORD PTR [edx+ecx*4], eax
; Line 1004
	mov	eax, DWORD PTR _this_insn$S434
	mov	ecx, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	mov	edx, DWORD PTR _reg_qty$S435
	mov	ecx, DWORD PTR [edx+ecx*4]
	mov	edx, DWORD PTR _qty_const_insn$S430
	mov	DWORD PTR [edx+ecx*4], eax
; Line 1006
$L695:
; Line 1008
	mov	eax, DWORD PTR _elt$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L699
	mov	eax, DWORD PTR _elt$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L699
	mov	eax, DWORD PTR _elt$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L699
	mov	eax, DWORD PTR _elt$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L699
	mov	eax, DWORD PTR _elt$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2031616				; 001f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L699
	mov	eax, DWORD PTR _elt$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L698
	mov	eax, DWORD PTR _elt$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L698
	mov	eax, DWORD PTR _elt$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _frame_pointer_rtx
	cmp	DWORD PTR [eax+4], ecx
	je	$L700
	mov	eax, DWORD PTR _elt$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _arg_pointer_rtx
	cmp	DWORD PTR [eax+4], ecx
	jne	$L698
$L700:
$L699:
; Line 1010
	mov	eax, DWORD PTR _elt$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	mov	edx, DWORD PTR _reg_qty$S435
	mov	ecx, DWORD PTR [edx+ecx*4]
	mov	edx, DWORD PTR _qty_const$S429
	mov	DWORD PTR [edx+ecx*4], eax
; Line 1011
	mov	eax, DWORD PTR _this_insn$S434
	mov	ecx, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	mov	edx, DWORD PTR _reg_qty$S435
	mov	ecx, DWORD PTR [edx+ecx*4]
	mov	edx, DWORD PTR _qty_const_insn$S430
	mov	DWORD PTR [edx+ecx*4], eax
; Line 1013
$L698:
; Line 1018
$L694:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L701
; Line 1020
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_get_related_value
	add	esp, 4
	mov	DWORD PTR _subexp$702[ebp], eax
; Line 1024
	cmp	DWORD PTR _subexp$702[ebp], 0
	je	$L706
; Line 1027
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	mov	eax, DWORD PTR _subexp$702[ebp]
	push	eax
	call	_safe_hash
	add	esp, 8
	mov	ecx, 31					; 0000001fH
	cdq
	idiv	ecx
	mov	DWORD PTR _subhash$703[ebp], edx
; Line 1028
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	mov	eax, DWORD PTR _subhash$703[ebp]
	push	eax
	mov	eax, DWORD PTR _subexp$702[ebp]
	push	eax
	call	_lookup
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _subelt$704[ebp], eax
; Line 1029
	cmp	DWORD PTR _subelt$704[ebp], 0
	jne	$L707
; Line 1030
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	mov	eax, DWORD PTR _subhash$703[ebp]
	push	eax
	push	0
	mov	eax, DWORD PTR _subexp$702[ebp]
	push	eax
	call	_insert
	add	esp, 16					; 00000010H
	mov	DWORD PTR _subelt$704[ebp], eax
; Line 1032
$L707:
	mov	eax, DWORD PTR _subelt$704[ebp]
	cmp	DWORD PTR [eax+24], 0
	jne	$L708
; Line 1033
	mov	eax, DWORD PTR _subelt$704[ebp]
	mov	ecx, DWORD PTR _subelt$704[ebp]
	mov	DWORD PTR [ecx+24], eax
; Line 1035
$L708:
	mov	eax, DWORD PTR _subelt$704[ebp]
	mov	DWORD PTR _subelt_prev$705[ebp], eax
; Line 1036
$L710:
	mov	eax, DWORD PTR _subelt_prev$705[ebp]
	mov	ecx, DWORD PTR _subelt$704[ebp]
	cmp	DWORD PTR [eax+24], ecx
	je	$L711
; Line 1037
	mov	eax, DWORD PTR _subelt_prev$705[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _subelt_prev$705[ebp], eax
	jmp	$L710
$L711:
; Line 1040
	mov	eax, DWORD PTR _subelt_prev$705[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	ecx, DWORD PTR _elt$[ebp]
	mov	DWORD PTR [ecx+24], eax
; Line 1041
	mov	eax, DWORD PTR _elt$[ebp]
	mov	ecx, DWORD PTR _subelt_prev$705[ebp]
	mov	DWORD PTR [ecx+24], eax
; Line 1043
$L706:
; Line 1045
$L701:
	mov	eax, DWORD PTR _elt$[ebp]
	jmp	$L669
; Line 1046
$L669:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_insert	ENDP
_TEXT	ENDS
PUBLIC	_refers_to_mem_p
_TEXT	SEGMENT
_x$ = 8
_i$ = -20
_p$ = -12
_base$ = -8
_start$ = -4
_end$ = -16
_hash$721 = -24
_next$731 = -28
_invalidate PROC NEAR
; Line 1062
	push	ebp
	mov	ebp, esp
	sub	esp, 28					; 0000001cH
	push	ebx
	push	esi
	push	edi
; Line 1074
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L720
; Line 1076
	push	0
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_canon_hash
	add	esp, 8
	mov	ecx, 31					; 0000001fH
	cdq
	idiv	ecx
	mov	DWORD PTR _hash$721[ebp], edx
; Line 1077
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_reg_invalidate
	add	esp, 4
; Line 1078
	mov	eax, DWORD PTR _hash$721[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	mov	eax, DWORD PTR _hash$721[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_lookup_for_remove
	add	esp, 12					; 0000000cH
	push	eax
	call	_remove
	add	esp, 8
; Line 1079
	jmp	$L714
; Line 1082
$L720:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L722
; Line 1084
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L723
; Line 1085
	call	_abort
; Line 1086
$L723:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_invalidate
	add	esp, 4
; Line 1087
	jmp	$L714
; Line 1094
$L722:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L724
; Line 1095
	call	_abort
; Line 1096
$L724:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _base$[ebp], eax
; Line 1097
	mov	DWORD PTR _start$[ebp], 0
; Line 1102
	mov	eax, DWORD PTR _base$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L725
	mov	eax, DWORD PTR _base$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg_qty$S435
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _qty_const$S429
	cmp	DWORD PTR [ecx+eax*4], 0
	je	$L725
; Line 1103
	mov	eax, DWORD PTR _base$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg_qty$S435
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _qty_const$S429
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _base$[ebp], eax
; Line 1105
$L725:
	mov	eax, DWORD PTR _base$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L726
; Line 1106
	mov	eax, DWORD PTR _base$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _base$[ebp], eax
; Line 1107
$L726:
; Line 1108
	mov	eax, DWORD PTR _base$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L727
	mov	eax, DWORD PTR _base$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L727
; Line 1110
	mov	eax, DWORD PTR _base$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _start$[ebp], eax
; Line 1111
	mov	eax, DWORD PTR _base$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _base$[ebp], eax
; Line 1114
$L727:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	add	eax, DWORD PTR _start$[ebp]
	mov	DWORD PTR _end$[ebp], eax
; Line 1115
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L728
$L729:
	inc	DWORD PTR _i$[ebp]
$L728:
	cmp	DWORD PTR _i$[ebp], 31			; 0000001fH
	jge	$L730
; Line 1118
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _table$S452[eax*4]
	mov	DWORD PTR _p$[ebp], eax
	jmp	$L732
$L733:
	mov	eax, DWORD PTR _next$731[ebp]
	mov	DWORD PTR _p$[ebp], eax
$L732:
	cmp	DWORD PTR _p$[ebp], 0
	je	$L734
; Line 1120
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _next$731[ebp], eax
; Line 1121
	mov	eax, DWORD PTR _end$[ebp]
	push	eax
	mov	eax, DWORD PTR _start$[ebp]
	push	eax
	mov	eax, DWORD PTR _base$[ebp]
	push	eax
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_refers_to_mem_p
	add	esp, 16					; 00000010H
	or	eax, eax
	je	$L735
; Line 1122
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	call	_remove
	add	esp, 8
; Line 1123
$L735:
	jmp	$L733
$L734:
; Line 1124
	jmp	$L729
$L730:
; Line 1125
$L714:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_invalidate ENDP
_TEXT	ENDS
PUBLIC	_refers_to_p
_TEXT	SEGMENT
_regno$ = 8
_i$ = -16
_p$ = -8
_next$ = -12
_x$ = -4
_remove_invalid_refs PROC NEAR
; Line 1135
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 1138
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _reg_rtx$S438
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _x$[ebp], eax
; Line 1140
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L742
$L743:
	inc	DWORD PTR _i$[ebp]
$L742:
	cmp	DWORD PTR _i$[ebp], 31			; 0000001fH
	jge	$L744
; Line 1141
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _table$S452[eax*4]
	mov	DWORD PTR _p$[ebp], eax
	jmp	$L745
$L746:
	mov	eax, DWORD PTR _next$[ebp]
	mov	DWORD PTR _p$[ebp], eax
$L745:
	cmp	DWORD PTR _p$[ebp], 0
	je	$L747
; Line 1143
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _next$[ebp], eax
; Line 1144
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L748
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_refers_to_p
	add	esp, 8
	or	eax, eax
	je	$L748
; Line 1145
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	call	_remove
	add	esp, 8
; Line 1146
$L748:
	jmp	$L746
$L747:
	jmp	$L743
$L744:
; Line 1147
$L737:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_remove_invalid_refs ENDP
_writes$ = 8
_i$ = -20
_p$ = -8
_next$ = -12
_all$ = -16
_nonscalar$ = -4
_invalidate_memory PROC NEAR
; Line 1155
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	push	ebx
	push	esi
	push	edi
; Line 1158
	mov	eax, DWORD PTR _writes$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 29					; 0000001dH
	sar	eax, 31					; 0000001fH
	mov	DWORD PTR _all$[ebp], eax
; Line 1159
	mov	eax, DWORD PTR _writes$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 30					; 0000001eH
	sar	eax, 31					; 0000001fH
	mov	DWORD PTR _nonscalar$[ebp], eax
; Line 1161
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L757
$L758:
	inc	DWORD PTR _i$[ebp]
$L757:
	cmp	DWORD PTR _i$[ebp], 31			; 0000001fH
	jge	$L759
; Line 1162
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _table$S452[eax*4]
	mov	DWORD PTR _p$[ebp], eax
	jmp	$L760
$L761:
	mov	eax, DWORD PTR _next$[ebp]
	mov	DWORD PTR _p$[ebp], eax
$L760:
	cmp	DWORD PTR _p$[ebp], 0
	je	$L762
; Line 1164
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _next$[ebp], eax
; Line 1168
	mov	eax, DWORD PTR _p$[ebp]
	movsx	eax, BYTE PTR [eax+36]
	or	eax, eax
	je	$L763
	cmp	DWORD PTR _all$[ebp], 0
	jne	$L764
	cmp	DWORD PTR _nonscalar$[ebp], 0
	je	$L765
	mov	eax, DWORD PTR _p$[ebp]
	movsx	eax, BYTE PTR [eax+37]
	or	eax, eax
	jne	$L764
$L765:
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_cse_rtx_addr_varies_p
	add	esp, 4
	or	eax, eax
	je	$L763
$L764:
; Line 1169
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	call	_remove
	add	esp, 8
; Line 1170
$L763:
	jmp	$L761
$L762:
	jmp	$L758
$L759:
; Line 1171
$L751:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_invalidate_memory ENDP
_x$ = 8
_get_integer_term PROC NEAR
; Line 1182
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1183
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L768
; Line 1184
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x$[ebp], eax
; Line 1186
$L768:
; Line 1187
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2949120				; 002d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L769
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L769
; Line 1188
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	neg	eax
	jmp	$L767
; Line 1189
$L769:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L770
; Line 1190
	sub	eax, eax
	jmp	$L767
; Line 1191
$L770:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L771
; Line 1192
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	jmp	$L767
; Line 1193
$L771:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L772
; Line 1194
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	jmp	$L767
; Line 1195
$L772:
	sub	eax, eax
	jmp	$L767
; Line 1196
$L767:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_get_integer_term ENDP
_x$ = 8
_get_related_value PROC NEAR
; Line 1201
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1202
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L775
; Line 1203
	sub	eax, eax
	jmp	$L774
; Line 1204
$L775:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x$[ebp], eax
; Line 1205
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L776
; Line 1207
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L777
; Line 1208
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	jmp	$L774
; Line 1209
$L777:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L778
; Line 1210
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	jmp	$L774
; Line 1211
$L778:
; Line 1212
	jmp	$L779
$L776:
; Line 1213
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2949120				; 002d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L780
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L780
; Line 1214
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	jmp	$L774
; Line 1215
$L780:
$L779:
	sub	eax, eax
	jmp	$L774
; Line 1216
$L774:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_get_related_value ENDP
_TEXT	ENDS
EXTRN	_plus_constant:NEAR
EXTRN	_memory_address_p:NEAR
_TEXT	SEGMENT
_x$ = 8
_elt$ = 12
_relt$ = -4
_p$ = -16
_offset$ = -12
_addr$ = -8
_subexp$792 = -20
_use_related_value PROC NEAR
; Line 1228
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	push	ebx
	push	esi
	push	edi
; Line 1229
	mov	DWORD PTR _relt$[ebp], 0
; Line 1238
	cmp	DWORD PTR _elt$[ebp], 0
	je	$L789
	mov	eax, DWORD PTR _elt$[ebp]
	cmp	DWORD PTR [eax+24], 0
	je	$L789
; Line 1239
	mov	eax, DWORD PTR _elt$[ebp]
	mov	DWORD PTR _relt$[ebp], eax
; Line 1240
	jmp	$L790
$L789:
	cmp	DWORD PTR _elt$[ebp], 0
	jne	$L791
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L791
; Line 1242
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_get_related_value
	add	esp, 4
	mov	DWORD PTR _subexp$792[ebp], eax
; Line 1243
	cmp	DWORD PTR _subexp$792[ebp], 0
	je	$L793
; Line 1246
	mov	eax, DWORD PTR _subexp$792[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	mov	eax, DWORD PTR _subexp$792[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	mov	eax, DWORD PTR _subexp$792[ebp]
	push	eax
	call	_safe_hash
	add	esp, 8
	mov	ecx, 31					; 0000001fH
	cdq
	idiv	ecx
	push	edx
	mov	eax, DWORD PTR _subexp$792[ebp]
	push	eax
	call	_lookup
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _relt$[ebp], eax
; Line 1247
$L793:
; Line 1249
$L791:
$L790:
	cmp	DWORD PTR _relt$[ebp], 0
	jne	$L794
; Line 1250
	sub	eax, eax
	jmp	$L784
; Line 1255
$L794:
	mov	eax, DWORD PTR _relt$[ebp]
	mov	DWORD PTR _p$[ebp], eax
; Line 1256
$L796:
; Line 1259
	mov	eax, DWORD PTR _p$[ebp]
	cmp	DWORD PTR [eax+20], 0
	je	$L798
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L798
; Line 1260
	jmp	$L797
; Line 1261
$L798:
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _p$[ebp], eax
; Line 1265
	mov	eax, DWORD PTR _relt$[ebp]
	cmp	DWORD PTR _p$[ebp], eax
	jne	$L799
; Line 1266
	sub	eax, eax
	jmp	$L784
; Line 1269
$L799:
	cmp	DWORD PTR _p$[ebp], 0
	jne	$L800
; Line 1270
	sub	eax, eax
	jmp	$L784
; Line 1271
$L800:
	jmp	$L796
$L797:
; Line 1274
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_get_integer_term
	add	esp, 4
	mov	ebx, eax
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_get_integer_term
	add	esp, 4
	sub	ebx, eax
	mov	DWORD PTR _offset$[ebp], ebx
; Line 1275
	mov	eax, DWORD PTR _offset$[ebp]
	push	eax
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_plus_constant
	add	esp, 8
	mov	DWORD PTR _addr$[ebp], eax
; Line 1276
	mov	eax, DWORD PTR _addr$[ebp]
	push	eax
	push	1
	call	_memory_address_p
	add	esp, 8
	or	eax, eax
	je	$L802
; Line 1277
	mov	eax, DWORD PTR _addr$[ebp]
	jmp	$L784
; Line 1278
$L802:
	sub	eax, eax
	jmp	$L784
; Line 1279
$L784:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_use_related_value ENDP
_TEXT	ENDS
EXTRN	_global_regs:TBYTE
_BSS	SEGMENT
_do_not_record$S448 DD 01H DUP (?)
_hash_arg_in_memory$S449 DD 01H DUP (?)
_hash_arg_in_struct$S450 DD 01H DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
_p$850 = -36
_tem$855 = -40
_tem$857 = -44
_x$ = 8
_mode$ = 12
_i$ = -20
_j$ = -16
_hash$ = -12
_code$ = -8
_fmt$ = -4
_regno$818 = -24
_i$824 = -28
_tem$828 = -32
_canon_hash PROC NEAR
; Line 1306
	push	ebp
	mov	ebp, esp
	sub	esp, 48					; 00000030H
	push	ebx
	push	esi
	push	edi
; Line 1308
	mov	DWORD PTR _hash$[ebp], 0
; Line 1313
$repeat$811:
; Line 1314
	cmp	DWORD PTR _x$[ebp], 0
	jne	$L812
; Line 1315
	mov	eax, DWORD PTR _hash$[ebp]
	jmp	$L805
; Line 1317
$L812:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$[ebp], eax
; Line 1318
	mov	eax, DWORD PTR _code$[ebp]
	mov	DWORD PTR -48+[ebp], eax
	jmp	$L813
; Line 1320
$L817:
; Line 1327
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _regno$818[ebp], eax
; Line 1329
	cmp	DWORD PTR _regno$818[ebp], 7
	je	$L820
	cmp	DWORD PTR _regno$818[ebp], 10		; 0000000aH
	jge	$L819
	mov	eax, DWORD PTR _regno$818[ebp]
	movsx	eax, BYTE PTR _global_regs[eax]
	or	eax, eax
	je	$L819
$L820:
; Line 1331
	mov	DWORD PTR _do_not_record$S448, 1
; Line 1332
	sub	eax, eax
	jmp	$L805
; Line 1335
$L819:
	cmp	DWORD PTR _regno$818[ebp], 10		; 0000000aH
	jge	$L821
; Line 1337
	mov	DWORD PTR _do_not_record$S448, 1
; Line 1338
	sub	eax, eax
	jmp	$L805
; Line 1341
$L821:
	mov	eax, DWORD PTR _regno$818[ebp]
	mov	ecx, DWORD PTR _reg_qty$S435
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _hash$[ebp]
	lea	eax, DWORD PTR [eax+ecx+4352]
	jmp	$L805
; Line 1344
$L822:
; Line 1346
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	sar	eax, 16					; 00000010H
	mov	ecx, DWORD PTR _x$[ebp]
	add	eax, DWORD PTR [ecx+4]
	add	eax, DWORD PTR _mode$[ebp]
	add	eax, 3840				; 00000f00H
	add	DWORD PTR _hash$[ebp], eax
; Line 1347
	mov	eax, DWORD PTR _hash$[ebp]
	and	eax, 65535				; 0000ffffH
	jmp	$L805
; Line 1349
$L823:
; Line 1352
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	add	eax, DWORD PTR _code$[ebp]
	add	DWORD PTR _hash$[ebp], eax
; Line 1355
	mov	DWORD PTR _i$824[ebp], 2
	jmp	$L825
$L826:
	inc	DWORD PTR _i$824[ebp]
$L825:
	mov	eax, DWORD PTR _i$824[ebp]
	cmp	DWORD PTR _rtx_length+124, eax
	jle	$L827
; Line 1357
	mov	eax, DWORD PTR _i$824[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	DWORD PTR _tem$828[ebp], eax
; Line 1358
	mov	eax, DWORD PTR _tem$828[ebp]
	sar	eax, 16					; 00000010H
	add	eax, DWORD PTR _tem$828[ebp]
	and	eax, 65535				; 0000ffffH
	add	DWORD PTR _hash$[ebp], eax
; Line 1359
	jmp	$L826
$L827:
; Line 1361
	mov	eax, DWORD PTR _hash$[ebp]
	jmp	$L805
; Line 1364
$L829:
; Line 1367
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	and	eax, 65535				; 0000ffffH
	mov	ecx, DWORD PTR _hash$[ebp]
	lea	eax, DWORD PTR [eax+ecx+4864]
	jmp	$L805
; Line 1369
$L830:
; Line 1371
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	and	eax, 65535				; 0000ffffH
	mov	ecx, DWORD PTR _hash$[ebp]
	lea	eax, DWORD PTR [eax+ecx+4992]
	jmp	$L805
; Line 1373
$L831:
; Line 1374
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shr	eax, 27					; 0000001bH
	test	al, 1
	je	$L832
; Line 1376
	mov	DWORD PTR _do_not_record$S448, 1
; Line 1377
	sub	eax, eax
	jmp	$L805
; Line 1379
$L832:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shr	eax, 26					; 0000001aH
	test	al, 1
	jne	$L833
; Line 1381
	mov	DWORD PTR _hash_arg_in_memory$S449, 1
; Line 1382
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shr	eax, 28					; 0000001cH
	test	al, 1
	je	$L834
	mov	DWORD PTR _hash_arg_in_struct$S450, 1
; Line 1383
$L834:
; Line 1386
$L833:
	add	DWORD PTR _hash$[ebp], 37		; 00000025H
; Line 1387
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x$[ebp], eax
; Line 1388
	jmp	$repeat$811
; Line 1390
$L835:
; Line 1397
	mov	DWORD PTR _do_not_record$S448, 1
; Line 1398
	sub	eax, eax
	jmp	$L805
; Line 1400
$L836:
; Line 1401
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shr	eax, 27					; 0000001bH
	test	al, 1
	je	$L837
; Line 1403
	mov	DWORD PTR _do_not_record$S448, 1
; Line 1404
	sub	eax, eax
	jmp	$L805
; Line 1406
$L837:
	jmp	$L814
$L813:
	sub	DWORD PTR -48+[ebp], 22			; 00000016H
	cmp	DWORD PTR -48+[ebp], 44			; 0000002cH
	ja	$L814
	shl	DWORD PTR -48+[ebp], 2
	mov	eax, DWORD PTR -48+[ebp]
	jmp	DWORD PTR $L1693[eax]
$L1693:
	DD	OFFSET $L836
	DD	OFFSET $L814
	DD	OFFSET $L814
	DD	OFFSET $L814
	DD	OFFSET $L814
	DD	OFFSET $L814
	DD	OFFSET $L835
	DD	OFFSET $L814
	DD	OFFSET $L822
	DD	OFFSET $L823
	DD	OFFSET $L814
	DD	OFFSET $L835
	DD	OFFSET $L817
	DD	OFFSET $L814
	DD	OFFSET $L814
	DD	OFFSET $L831
	DD	OFFSET $L829
	DD	OFFSET $L830
	DD	OFFSET $L835
	DD	OFFSET $L814
	DD	OFFSET $L814
	DD	OFFSET $L814
	DD	OFFSET $L814
	DD	OFFSET $L814
	DD	OFFSET $L814
	DD	OFFSET $L814
	DD	OFFSET $L814
	DD	OFFSET $L814
	DD	OFFSET $L814
	DD	OFFSET $L814
	DD	OFFSET $L814
	DD	OFFSET $L814
	DD	OFFSET $L814
	DD	OFFSET $L814
	DD	OFFSET $L814
	DD	OFFSET $L814
	DD	OFFSET $L814
	DD	OFFSET $L814
	DD	OFFSET $L814
	DD	OFFSET $L814
	DD	OFFSET $L814
	DD	OFFSET $L835
	DD	OFFSET $L835
	DD	OFFSET $L835
	DD	OFFSET $L835
$L814:
; Line 1408
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_length[eax*4]
	dec	eax
	mov	DWORD PTR _i$[ebp], eax
; Line 1409
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	add	eax, DWORD PTR _code$[ebp]
	add	DWORD PTR _hash$[ebp], eax
; Line 1410
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_format[eax*4]
	mov	DWORD PTR _fmt$[ebp], eax
; Line 1411
	jmp	$L838
$L839:
	dec	DWORD PTR _i$[ebp]
$L838:
	cmp	DWORD PTR _i$[ebp], 0
	jl	$L840
; Line 1413
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 101				; 00000065H
	jne	$L841
; Line 1418
	cmp	DWORD PTR _i$[ebp], 0
	jne	$L842
; Line 1420
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x$[ebp], eax
; Line 1421
	jmp	$repeat$811
; Line 1423
$L842:
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	push	eax
	call	_canon_hash
	add	esp, 8
	add	DWORD PTR _hash$[ebp], eax
; Line 1425
	jmp	$L843
$L841:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 69					; 00000045H
	jne	$L844
; Line 1426
	mov	DWORD PTR _j$[ebp], 0
	jmp	$L845
$L846:
	inc	DWORD PTR _j$[ebp]
$L845:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$[ebp]
	cmp	DWORD PTR [eax], ecx
	jbe	$L847
; Line 1427
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	push	eax
	call	_canon_hash
	add	esp, 8
	add	DWORD PTR _hash$[ebp], eax
	jmp	$L846
$L847:
; Line 1428
	jmp	$L848
$L844:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 115				; 00000073H
	jne	$L849
; Line 1430
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	DWORD PTR _p$850[ebp], eax
; Line 1431
	cmp	DWORD PTR _p$850[ebp], 0
	je	$L851
; Line 1432
$L853:
	mov	eax, DWORD PTR _p$850[ebp]
	movsx	eax, BYTE PTR [eax]
	or	eax, eax
	je	$L854
; Line 1434
	mov	eax, DWORD PTR _p$850[ebp]
	movsx	eax, BYTE PTR [eax]
	mov	DWORD PTR _tem$855[ebp], eax
	inc	DWORD PTR _p$850[ebp]
; Line 1435
	mov	eax, DWORD PTR _tem$855[ebp]
	sar	eax, 16					; 00000010H
	add	eax, DWORD PTR _tem$855[ebp]
	and	eax, 65535				; 0000ffffH
	add	DWORD PTR _hash$[ebp], eax
; Line 1436
	jmp	$L853
$L854:
; Line 1437
$L851:
; Line 1438
	jmp	$L856
$L849:
; Line 1440
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	DWORD PTR _tem$857[ebp], eax
; Line 1441
	mov	eax, DWORD PTR _tem$857[ebp]
	sar	eax, 16					; 00000010H
	add	eax, DWORD PTR _tem$857[ebp]
	and	eax, 65535				; 0000ffffH
	add	DWORD PTR _hash$[ebp], eax
; Line 1442
$L856:
$L848:
$L843:
; Line 1443
	jmp	$L839
$L840:
; Line 1444
	mov	eax, DWORD PTR _hash$[ebp]
	jmp	$L805
; Line 1445
$L805:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_canon_hash ENDP
_x$ = 8
_mode$ = 12
_save_do_not_record$ = -12
_save_hash_arg_in_memory$ = -8
_save_hash_arg_in_struct$ = -4
_hash$ = -16
_safe_hash PROC NEAR
; Line 1453
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 1454
	mov	eax, DWORD PTR _do_not_record$S448
	mov	DWORD PTR _save_do_not_record$[ebp], eax
; Line 1455
	mov	eax, DWORD PTR _hash_arg_in_memory$S449
	mov	DWORD PTR _save_hash_arg_in_memory$[ebp], eax
; Line 1456
	mov	eax, DWORD PTR _hash_arg_in_struct$S450
	mov	DWORD PTR _save_hash_arg_in_struct$[ebp], eax
; Line 1457
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_canon_hash
	add	esp, 8
	mov	DWORD PTR _hash$[ebp], eax
; Line 1458
	mov	eax, DWORD PTR _save_hash_arg_in_memory$[ebp]
	mov	DWORD PTR _hash_arg_in_memory$S449, eax
; Line 1459
	mov	eax, DWORD PTR _save_hash_arg_in_struct$[ebp]
	mov	DWORD PTR _hash_arg_in_struct$S450, eax
; Line 1460
	mov	eax, DWORD PTR _save_do_not_record$[ebp]
	mov	DWORD PTR _do_not_record$S448, eax
; Line 1461
	mov	eax, DWORD PTR _hash$[ebp]
	jmp	$L860
; Line 1462
$L860:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_safe_hash ENDP
_TEXT	ENDS
EXTRN	_strcmp:NEAR
_TEXT	SEGMENT
_x$ = 8
_y$ = 12
_validate$ = 16
_i$ = -12
_code$ = -8
_fmt$ = -4
_j$892 = -16
_exp_equiv_p PROC NEAR
; Line 1475
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	push	ebx
	push	esi
	push	edi
; Line 1482
	mov	eax, DWORD PTR _x$[ebp]
	cmp	DWORD PTR _y$[ebp], eax
	jne	$L872
	cmp	DWORD PTR _validate$[ebp], 0
	jne	$L872
; Line 1483
	mov	eax, 1
	jmp	$L868
; Line 1484
$L872:
	cmp	DWORD PTR _x$[ebp], 0
	je	$L874
	cmp	DWORD PTR _y$[ebp], 0
	jne	$L873
$L874:
; Line 1485
	mov	eax, DWORD PTR _y$[ebp]
	sub	eax, DWORD PTR _x$[ebp]
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	jmp	$L868
; Line 1486
$L873:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$[ebp], eax
; Line 1487
	mov	eax, DWORD PTR _y$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	cmp	eax, DWORD PTR _code$[ebp]
	je	$L875
; Line 1488
	sub	eax, eax
	jmp	$L868
; Line 1490
$L875:
	mov	eax, DWORD PTR _code$[ebp]
	mov	DWORD PTR -20+[ebp], eax
	jmp	$L876
; Line 1492
$L880:
; Line 1494
	mov	eax, DWORD PTR _y$[ebp]
	sub	eax, DWORD PTR _x$[ebp]
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	jmp	$L868
; Line 1496
$L881:
; Line 1497
	mov	eax, DWORD PTR _y$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _x$[ebp]
	sub	eax, DWORD PTR [ecx+4]
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	jmp	$L868
; Line 1499
$L882:
; Line 1501
	mov	eax, DWORD PTR _y$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _x$[ebp]
	sub	eax, DWORD PTR [ecx+4]
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	jmp	$L868
; Line 1503
$L883:
; Line 1506
	mov	eax, DWORD PTR _y$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg_qty$S435
	mov	edx, DWORD PTR _x$[ebp]
	mov	edx, DWORD PTR [edx+4]
	mov	ebx, DWORD PTR _reg_qty$S435
	mov	edx, DWORD PTR [ebx+edx*4]
	cmp	DWORD PTR [ecx+eax*4], edx
	jne	$L1694
	cmp	DWORD PTR _validate$[ebp], 0
	je	$L1696
	mov	eax, DWORD PTR _y$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg_in_table$S440
	mov	edx, DWORD PTR _y$[ebp]
	mov	edx, DWORD PTR [edx+4]
	mov	ebx, DWORD PTR _reg_tick$S439
	mov	edx, DWORD PTR [ebx+edx*4]
	cmp	DWORD PTR [ecx+eax*4], edx
	jne	$L1694
$L1696:
	mov	eax, 1
	jmp	$L1695
$L1694:
	sub	eax, eax
$L1695:
	jmp	$L868
; Line 1507
	jmp	$L877
$L876:
	sub	DWORD PTR -20+[ebp], 30			; 0000001eH
	cmp	DWORD PTR -20+[ebp], 10			; 0000000aH
	ja	$L877
	shl	DWORD PTR -20+[ebp], 2
	mov	eax, DWORD PTR -20+[ebp]
	jmp	DWORD PTR $L1697[eax]
$L1697:
	DD	OFFSET $L881
	DD	OFFSET $L877
	DD	OFFSET $L877
	DD	OFFSET $L880
	DD	OFFSET $L883
	DD	OFFSET $L877
	DD	OFFSET $L877
	DD	OFFSET $L877
	DD	OFFSET $L882
	DD	OFFSET $L882
	DD	OFFSET $L880
$L877:
; Line 1511
	mov	eax, DWORD PTR _y$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR [ecx]
	shl	ecx, 8
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L884
; Line 1512
	sub	eax, eax
	jmp	$L868
; Line 1517
$L884:
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_format[eax*4]
	mov	DWORD PTR _fmt$[ebp], eax
; Line 1518
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_length[eax*4]
	dec	eax
	mov	DWORD PTR _i$[ebp], eax
	jmp	$L885
$L886:
	dec	DWORD PTR _i$[ebp]
$L885:
	cmp	DWORD PTR _i$[ebp], 0
	jl	$L887
; Line 1520
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 101				; 00000065H
	jne	$L888
; Line 1522
	mov	eax, DWORD PTR _validate$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _y$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	push	eax
	call	_exp_equiv_p
	add	esp, 12					; 0000000cH
	or	eax, eax
	jne	$L889
; Line 1523
	sub	eax, eax
	jmp	$L868
; Line 1524
$L889:
; Line 1525
	jmp	$L890
$L888:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 69					; 00000045H
	jne	$L891
; Line 1528
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _y$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR [edx+ecx*4+4]
	mov	ecx, DWORD PTR [ecx]
	cmp	DWORD PTR [eax], ecx
	je	$L893
; Line 1529
	sub	eax, eax
	jmp	$L868
; Line 1530
$L893:
	mov	DWORD PTR _j$892[ebp], 0
	jmp	$L894
$L895:
	inc	DWORD PTR _j$892[ebp]
$L894:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$892[ebp]
	cmp	DWORD PTR [eax], ecx
	jbe	$L896
; Line 1531
	mov	eax, DWORD PTR _validate$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _y$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$892[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$892[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	push	eax
	call	_exp_equiv_p
	add	esp, 12					; 0000000cH
	or	eax, eax
	jne	$L897
; Line 1532
	sub	eax, eax
	jmp	$L868
; Line 1533
$L897:
	jmp	$L895
$L896:
; Line 1534
	jmp	$L898
$L891:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 115				; 00000073H
	jne	$L899
; Line 1536
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _y$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	je	$L901
; Line 1537
	sub	eax, eax
	jmp	$L868
; Line 1538
$L901:
; Line 1539
	jmp	$L902
$L899:
; Line 1541
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _y$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	mov	ebx, DWORD PTR _x$[ebp]
	mov	edx, DWORD PTR [ebx+edx*4+4]
	cmp	DWORD PTR [ecx+eax*4+4], edx
	je	$L903
; Line 1542
	sub	eax, eax
	jmp	$L868
; Line 1543
$L903:
$L902:
$L898:
$L890:
; Line 1544
	jmp	$L886
$L887:
; Line 1545
	mov	eax, 1
	jmp	$L868
; Line 1546
$L868:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_exp_equiv_p ENDP
_x$ = 8
_y$ = 12
_i$ = -12
_code$ = -8
_fmt$ = -4
_j$925 = -16
_refers_to_p PROC NEAR
; Line 1555
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 1560
$repeat$910:
; Line 1561
	mov	eax, DWORD PTR _y$[ebp]
	cmp	DWORD PTR _x$[ebp], eax
	jne	$L911
; Line 1562
	mov	eax, 1
	jmp	$L906
; Line 1563
$L911:
	cmp	DWORD PTR _x$[ebp], 0
	je	$L913
	cmp	DWORD PTR _y$[ebp], 0
	jne	$L912
$L913:
; Line 1564
	sub	eax, eax
	jmp	$L906
; Line 1566
$L912:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$[ebp], eax
; Line 1569
	mov	eax, DWORD PTR _y$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	cmp	eax, DWORD PTR _code$[ebp]
	jne	$L914
; Line 1571
	push	0
	mov	eax, DWORD PTR _y$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_exp_equiv_p
	add	esp, 12					; 0000000cH
	or	eax, eax
	je	$L915
; Line 1572
	mov	eax, 1
	jmp	$L906
; Line 1573
$L915:
; Line 1577
$L914:
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_format[eax*4]
	mov	DWORD PTR _fmt$[ebp], eax
; Line 1578
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_length[eax*4]
	dec	eax
	mov	DWORD PTR _i$[ebp], eax
	jmp	$L916
$L917:
	dec	DWORD PTR _i$[ebp]
$L916:
	cmp	DWORD PTR _i$[ebp], 0
	jl	$L918
; Line 1579
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 101				; 00000065H
	jne	$L919
; Line 1581
	cmp	DWORD PTR _i$[ebp], 0
	jne	$L920
; Line 1583
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x$[ebp], eax
; Line 1584
	jmp	$repeat$910
; Line 1586
	jmp	$L921
$L920:
; Line 1587
	mov	eax, DWORD PTR _y$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	push	eax
	call	_refers_to_p
	add	esp, 8
	or	eax, eax
	je	$L922
; Line 1588
	mov	eax, 1
	jmp	$L906
; Line 1589
$L922:
$L921:
; Line 1590
	jmp	$L923
$L919:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 69					; 00000045H
	jne	$L924
; Line 1593
	mov	DWORD PTR _j$925[ebp], 0
	jmp	$L926
$L927:
	inc	DWORD PTR _j$925[ebp]
$L926:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$925[ebp]
	cmp	DWORD PTR [eax], ecx
	jbe	$L928
; Line 1594
	mov	eax, DWORD PTR _y$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$925[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	push	eax
	call	_refers_to_p
	add	esp, 8
	or	eax, eax
	je	$L929
; Line 1595
	mov	eax, 1
	jmp	$L906
; Line 1596
$L929:
	jmp	$L927
$L928:
; Line 1598
$L924:
$L923:
	jmp	$L917
$L918:
	sub	eax, eax
	jmp	$L906
; Line 1599
$L906:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_refers_to_p ENDP
_j$961 = -24
_x$ = 8
_reg$ = 12
_start$ = 16
_end$ = 20
_i$ = -12
_code$ = -8
_fmt$ = -4
_addr$942 = -20
_myend$943 = -16
_refers_to_mem_p PROC NEAR
; Line 1618
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	push	ebx
	push	esi
	push	edi
; Line 1623
	mov	eax, DWORD PTR _reg$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L938
; Line 1625
	mov	eax, DWORD PTR _reg$[ebp]
	mov	eax, DWORD PTR [eax+4]
	add	DWORD PTR _start$[ebp], eax
; Line 1626
	mov	eax, DWORD PTR _reg$[ebp]
	mov	eax, DWORD PTR [eax+4]
	add	DWORD PTR _end$[ebp], eax
; Line 1627
	mov	eax, DWORD PTR _const0_rtx
	mov	DWORD PTR _reg$[ebp], eax
; Line 1630
$L938:
$repeat$939:
; Line 1631
	cmp	DWORD PTR _x$[ebp], 0
	jne	$L940
; Line 1632
	sub	eax, eax
	jmp	$L934
; Line 1634
$L940:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$[ebp], eax
; Line 1635
	cmp	DWORD PTR _code$[ebp], 37		; 00000025H
	jne	$L941
; Line 1637
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _addr$942[ebp], eax
; Line 1643
	mov	eax, DWORD PTR _addr$942[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L944
	cmp	DWORD PTR _qty_const$S429, 0
	je	$L944
	mov	eax, DWORD PTR _addr$942[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg_qty$S435
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _qty_const$S429
	cmp	DWORD PTR [ecx+eax*4], 0
	je	$L944
; Line 1644
	mov	eax, DWORD PTR _addr$942[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg_qty$S435
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _qty_const$S429
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _addr$942[ebp], eax
; Line 1645
$L944:
	mov	eax, DWORD PTR _addr$942[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L945
; Line 1646
	mov	eax, DWORD PTR _addr$942[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _addr$942[ebp], eax
; Line 1650
$L945:
	mov	eax, DWORD PTR _addr$942[ebp]
	cmp	DWORD PTR _reg$[ebp], eax
	jne	$L946
; Line 1651
	mov	DWORD PTR _i$[ebp], 0
; Line 1652
	jmp	$L947
$L946:
; Line 1654
	mov	eax, DWORD PTR _addr$942[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L948
	mov	eax, DWORD PTR _addr$942[ebp]
	mov	ecx, DWORD PTR _reg$[ebp]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L948
	mov	eax, DWORD PTR _addr$942[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L948
; Line 1655
	mov	eax, DWORD PTR _addr$942[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _i$[ebp], eax
; Line 1656
	jmp	$L949
$L948:
	mov	eax, DWORD PTR _addr$942[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L950
	mov	eax, DWORD PTR _reg$[ebp]
	cmp	DWORD PTR _const0_rtx, eax
	jne	$L950
; Line 1657
	mov	eax, DWORD PTR _addr$942[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _i$[ebp], eax
; Line 1658
	jmp	$L951
$L950:
; Line 1659
	sub	eax, eax
	jmp	$L934
$L951:
$L949:
$L947:
; Line 1661
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	add	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _myend$943[ebp], eax
; Line 1662
	mov	eax, DWORD PTR _myend$943[ebp]
	cmp	DWORD PTR _start$[ebp], eax
	jge	$L1698
	mov	eax, DWORD PTR _end$[ebp]
	cmp	DWORD PTR _i$[ebp], eax
	jge	$L1698
	mov	eax, 1
	jmp	$L1699
$L1698:
	sub	eax, eax
$L1699:
	jmp	$L934
; Line 1667
$L941:
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_format[eax*4]
	mov	DWORD PTR _fmt$[ebp], eax
; Line 1668
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_length[eax*4]
	dec	eax
	mov	DWORD PTR _i$[ebp], eax
	jmp	$L952
$L953:
	dec	DWORD PTR _i$[ebp]
$L952:
	cmp	DWORD PTR _i$[ebp], 0
	jl	$L954
; Line 1669
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 101				; 00000065H
	jne	$L955
; Line 1671
	cmp	DWORD PTR _i$[ebp], 0
	jne	$L956
; Line 1673
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x$[ebp], eax
; Line 1674
	jmp	$repeat$939
; Line 1676
	jmp	$L957
$L956:
; Line 1677
	mov	eax, DWORD PTR _end$[ebp]
	push	eax
	mov	eax, DWORD PTR _start$[ebp]
	push	eax
	mov	eax, DWORD PTR _reg$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	push	eax
	call	_refers_to_mem_p
	add	esp, 16					; 00000010H
	or	eax, eax
	je	$L958
; Line 1678
	mov	eax, 1
	jmp	$L934
; Line 1679
$L958:
$L957:
; Line 1680
	jmp	$L959
$L955:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 69					; 00000045H
	jne	$L960
; Line 1683
	mov	DWORD PTR _j$961[ebp], 0
	jmp	$L962
$L963:
	inc	DWORD PTR _j$961[ebp]
$L962:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$961[ebp]
	cmp	DWORD PTR [eax], ecx
	jbe	$L964
; Line 1684
	mov	eax, DWORD PTR _end$[ebp]
	push	eax
	mov	eax, DWORD PTR _start$[ebp]
	push	eax
	mov	eax, DWORD PTR _reg$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$961[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	push	eax
	call	_refers_to_mem_p
	add	esp, 16					; 00000010H
	or	eax, eax
	je	$L965
; Line 1685
	mov	eax, 1
	jmp	$L934
; Line 1686
$L965:
	jmp	$L963
$L964:
; Line 1688
$L960:
$L959:
	jmp	$L953
$L954:
	sub	eax, eax
	jmp	$L934
; Line 1689
$L934:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_refers_to_mem_p ENDP
_TEXT	ENDS
EXTRN	_rtx_addr_varies_p:NEAR
_TEXT	SEGMENT
_x$ = 8
_cse_rtx_addr_varies_p PROC NEAR
; Line 1698
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1701
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L968
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L968
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg_qty$S435
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _qty_const$S429
	cmp	DWORD PTR [ecx+eax*4], 0
	je	$L968
; Line 1702
	sub	eax, eax
	jmp	$L967
; Line 1703
$L968:
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_rtx_addr_varies_p
	add	esp, 4
	jmp	$L967
; Line 1704
$L967:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_cse_rtx_addr_varies_p ENDP
_x$ = 8
_i$ = -12
_code$ = -8
_fmt$ = -4
_new$983 = -16
_j$988 = -20
_canon_reg PROC NEAR
; Line 1713
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	push	ebx
	push	esi
	push	edi
; Line 1718
	cmp	DWORD PTR _x$[ebp], 0
	jne	$L976
; Line 1719
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L972
; Line 1721
$L976:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$[ebp], eax
; Line 1722
	mov	eax, DWORD PTR _code$[ebp]
	mov	DWORD PTR -24+[ebp], eax
	jmp	$L977
; Line 1724
$L981:
; Line 1733
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L972
; Line 1735
$L982:
; Line 1742
	mov	eax, DWORD PTR _x$[ebp]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jge	$L984
; Line 1743
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L972
; Line 1744
$L984:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg_qty$S435
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _qty_first_reg$S427
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _reg_rtx$S438
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _new$983[ebp], eax
; Line 1745
	cmp	DWORD PTR _new$983[ebp], 0
	je	$L1700
	mov	eax, DWORD PTR _new$983[ebp]
	jmp	$L1701
$L1700:
	mov	eax, DWORD PTR _x$[ebp]
$L1701:
	jmp	$L972
; Line 1747
	jmp	$L978
$L977:
	sub	DWORD PTR -24+[ebp], 23			; 00000017H
	cmp	DWORD PTR -24+[ebp], 17			; 00000011H
	ja	$L978
	shl	DWORD PTR -24+[ebp], 2
	mov	eax, DWORD PTR -24+[ebp]
	jmp	DWORD PTR $L1702[eax]
$L1702:
	DD	OFFSET $L981
	DD	OFFSET $L981
	DD	OFFSET $L978
	DD	OFFSET $L978
	DD	OFFSET $L978
	DD	OFFSET $L978
	DD	OFFSET $L978
	DD	OFFSET $L981
	DD	OFFSET $L981
	DD	OFFSET $L981
	DD	OFFSET $L981
	DD	OFFSET $L982
	DD	OFFSET $L978
	DD	OFFSET $L978
	DD	OFFSET $L978
	DD	OFFSET $L981
	DD	OFFSET $L981
	DD	OFFSET $L981
$L978:
; Line 1749
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_format[eax*4]
	mov	DWORD PTR _fmt$[ebp], eax
; Line 1750
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_length[eax*4]
	dec	eax
	mov	DWORD PTR _i$[ebp], eax
	jmp	$L985
$L986:
	dec	DWORD PTR _i$[ebp]
$L985:
	cmp	DWORD PTR _i$[ebp], 0
	jl	$L987
; Line 1754
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 101				; 00000065H
	jne	$L989
; Line 1755
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	push	eax
	call	_canon_reg
	add	esp, 4
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [edx+ecx*4+4], eax
; Line 1756
	jmp	$L990
$L989:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 69					; 00000045H
	jne	$L991
; Line 1757
	mov	DWORD PTR _j$988[ebp], 0
	jmp	$L992
$L993:
	inc	DWORD PTR _j$988[ebp]
$L992:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$988[ebp]
	cmp	DWORD PTR [eax], ecx
	jbe	$L994
; Line 1758
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$988[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	push	eax
	call	_canon_reg
	add	esp, 4
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR [edx+ecx*4+4]
	mov	edx, DWORD PTR _j$988[ebp]
	mov	DWORD PTR [ecx+edx*4+4], eax
	jmp	$L993
$L994:
; Line 1759
$L991:
$L990:
	jmp	$L986
$L987:
; Line 1761
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L972
; Line 1762
$L972:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_canon_reg ENDP
_TEXT	ENDS
EXTRN	__setjmp:NEAR
EXTRN	_cc0_rtx:DWORD
EXTRN	_const1_rtx:DWORD
EXTRN	_fconst0_rtx:DWORD
EXTRN	__fltused:NEAR
EXTRN	_dconst0_rtx:DWORD
EXTRN	_rtx_alloc:NEAR
EXTRN	_gen_rtx:NEAR
EXTRN	_copy_rtx:NEAR
EXTRN	_immed_real_const_1:NEAR
EXTRN	_warning:NEAR
EXTRN	_set_float_handler:NEAR
EXTRN	_mode_class:BYTE
_DATA	SEGMENT
$SG1082	DB	'floating point trap in constant folding', 00H
_DATA	ENDS
_TEXT	SEGMENT
_arg1$1088 = -176
_arg0s$1089 = -164
_tem$1025 = -48
_arg1s$1090 = -160
_arithwidth$1091 = -172
_j$1027 = -56
_new$1028 = -52
_const_arg$1033 = -60
_size$1226 = -180
_tem$1050 = -64
_arg0$1055 = -68
_x$ = 8
_new$1252 = -184
_copyflag$ = 12
_code$ = -16
_mode$1064 = -72
_fmt$ = -12
_i$ = -40
_val$ = -36
_new$ = -20
_copied$ = -8
_mode$1069 = -76
_width$ = -4
_const_arg0$ = -32
_const_arg1$ = -28
_const_arg2$ = -24
_u$1077 = -84
_arg0$1078 = -156
_handler$1079 = -148
_newaddr$1016 = -44
_arg0$1087 = -168
_fold_rtx PROC NEAR
; Line 1785
	push	ebp
	mov	ebp, esp
	sub	esp, 260				; 00000104H
	push	ebx
	push	esi
	push	edi
; Line 1789
	mov	DWORD PTR _new$[ebp], 0
; Line 1790
	cmp	DWORD PTR _copyflag$[ebp], 1
	sbb	eax, eax
	neg	eax
	mov	DWORD PTR _copied$[ebp], eax
; Line 1799
	cmp	DWORD PTR _x$[ebp], 0
	jne	$L1009
; Line 1800
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L998
; Line 1802
$L1009:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	shl	eax, 3
	mov	DWORD PTR _width$[ebp], eax
; Line 1804
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$[ebp], eax
; Line 1805
	mov	eax, DWORD PTR _code$[ebp]
	mov	DWORD PTR -236+[ebp], eax
	jmp	$L1010
; Line 1807
$L1014:
; Line 1819
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L998
; Line 1824
$L1015:
; Line 1826
	push	1
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_fold_rtx
	add	esp, 8
	mov	DWORD PTR _newaddr$1016[ebp], eax
; Line 1828
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR _newaddr$1016[ebp]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L1017
; Line 1829
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L998
; Line 1831
$L1017:
; Line 1832
	mov	eax, DWORD PTR _newaddr$1016[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	call	_memory_address_p
	add	esp, 8
	or	eax, eax
	jne	$L1018
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	call	_memory_address_p
	add	esp, 8
	or	eax, eax
	je	$L1018
; Line 1833
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L998
; Line 1836
$L1018:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_rtx_cost
	add	esp, 4
	mov	ebx, eax
	mov	eax, DWORD PTR _newaddr$1016[ebp]
	push	eax
	call	_rtx_cost
	add	esp, 4
	cmp	ebx, eax
	jge	$L1019
; Line 1837
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L998
; Line 1839
$L1019:
	cmp	DWORD PTR _copyflag$[ebp], 0
	je	$L1020
; Line 1840
	mov	eax, DWORD PTR _newaddr$1016[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	37					; 00000025H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	jmp	$L998
; Line 1841
$L1020:
	mov	eax, DWORD PTR _newaddr$1016[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 1842
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L998
; Line 1844
	jmp	$L1011
$L1010:
	cmp	DWORD PTR -236+[ebp], 37		; 00000025H
	jg	$L1739
	je	$L1015
	cmp	DWORD PTR -236+[ebp], 2
	je	$L1014
	cmp	DWORD PTR -236+[ebp], 30		; 0000001eH
	jl	$L1011
	cmp	DWORD PTR -236+[ebp], 34		; 00000022H
	jle	$L1014
	jmp	$L1011
$L1739:
	cmp	DWORD PTR -236+[ebp], 38		; 00000026H
	jl	$L1011
	cmp	DWORD PTR -236+[ebp], 40		; 00000028H
	jle	$L1014
	jmp	$L1011
$L1011:
; Line 1846
	mov	DWORD PTR _const_arg0$[ebp], 0
; Line 1847
	mov	DWORD PTR _const_arg1$[ebp], 0
; Line 1848
	mov	DWORD PTR _const_arg2$[ebp], 0
; Line 1853
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_format[eax*4]
	mov	DWORD PTR _fmt$[ebp], eax
; Line 1854
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_length[eax*4]
	dec	eax
	mov	DWORD PTR _i$[ebp], eax
	jmp	$L1021
$L1022:
	dec	DWORD PTR _i$[ebp]
$L1021:
	cmp	DWORD PTR _i$[ebp], 0
	jl	$L1023
; Line 1855
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 101				; 00000065H
	jne	$L1024
; Line 1857
	mov	eax, DWORD PTR _copyflag$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	push	eax
	call	_fold_rtx
	add	esp, 8
	mov	DWORD PTR _tem$1025[ebp], eax
; Line 1861
	cmp	DWORD PTR _copied$[ebp], 0
	jne	$L1026
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	edx, DWORD PTR _tem$1025[ebp]
	cmp	DWORD PTR [ecx+eax*4+4], edx
	je	$L1026
; Line 1864
	mov	eax, DWORD PTR _code$[ebp]
	push	eax
	call	_rtx_alloc
	add	esp, 4
	mov	DWORD PTR _new$1028[ebp], eax
; Line 1865
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	shr	eax, 24					; 00000018H
	and	eax, 255				; 000000ffH
	shl	eax, 16					; 00000010H
	mov	ecx, DWORD PTR _new$1028[ebp]
	mov	ecx, DWORD PTR [ecx]
	and	ecx, -16711681				; ff00ffffH
	or	eax, ecx
	mov	ecx, DWORD PTR _new$1028[ebp]
	mov	DWORD PTR [ecx], eax
; Line 1866
	mov	DWORD PTR _j$1027[ebp], 0
	jmp	$L1029
$L1030:
	inc	DWORD PTR _j$1027[ebp]
$L1029:
	mov	eax, DWORD PTR _code$[ebp]
	mov	ecx, DWORD PTR _j$1027[ebp]
	cmp	DWORD PTR _rtx_length[eax*4], ecx
	jle	$L1031
; Line 1867
	mov	eax, DWORD PTR _j$1027[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$1027[ebp]
	mov	edx, DWORD PTR _new$1028[ebp]
	mov	DWORD PTR [edx+ecx*4+4], eax
	jmp	$L1030
$L1031:
; Line 1868
	mov	eax, DWORD PTR _new$1028[ebp]
	mov	DWORD PTR _x$[ebp], eax
; Line 1869
	mov	DWORD PTR _copied$[ebp], 1
; Line 1873
$L1026:
	mov	eax, DWORD PTR _tem$1025[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [edx+ecx*4+4], eax
; Line 1877
	cmp	DWORD PTR _i$[ebp], 3
	jge	$L1032
; Line 1879
	mov	eax, DWORD PTR _tem$1025[ebp]
	push	eax
	call	_equiv_constant
	add	esp, 4
	mov	DWORD PTR _const_arg$1033[ebp], eax
; Line 1881
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR -240+[ebp], eax
	jmp	$L1034
; Line 1883
$L1038:
; Line 1884
	mov	eax, DWORD PTR _const_arg$1033[ebp]
	mov	DWORD PTR _const_arg0$[ebp], eax
; Line 1885
	jmp	$L1035
; Line 1886
$L1039:
; Line 1887
	mov	eax, DWORD PTR _const_arg$1033[ebp]
	mov	DWORD PTR _const_arg1$[ebp], eax
; Line 1888
	jmp	$L1035
; Line 1889
$L1040:
; Line 1890
	mov	eax, DWORD PTR _const_arg$1033[ebp]
	mov	DWORD PTR _const_arg2$[ebp], eax
; Line 1891
	jmp	$L1035
; Line 1892
	jmp	$L1035
$L1034:
	cmp	DWORD PTR -240+[ebp], 0
	je	$L1038
	cmp	DWORD PTR -240+[ebp], 1
	je	$L1039
	cmp	DWORD PTR -240+[ebp], 2
	je	$L1040
	jmp	$L1035
$L1035:
; Line 1894
$L1032:
; Line 1895
	jmp	$L1041
$L1024:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 69					; 00000045H
	jne	$L1042
; Line 1904
$L1042:
$L1041:
	jmp	$L1022
$L1023:
	mov	eax, DWORD PTR _code$[ebp]
	mov	DWORD PTR -244+[ebp], eax
	jmp	$L1043
; Line 1906
$L1047:
; Line 1917
	cmp	DWORD PTR _const_arg0$[ebp], 0
	je	$L1048
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR _const_arg0$[ebp]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L1048
	cmp	DWORD PTR _const_arg1$[ebp], 0
	je	$L1049
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR _const_arg1$[ebp]
	cmp	DWORD PTR [eax+8], ecx
	jne	$L1049
	mov	eax, DWORD PTR _const_arg0$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1048
	mov	eax, DWORD PTR _const_arg1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1048
$L1049:
; Line 1921
	cmp	DWORD PTR _copied$[ebp], 0
	jne	$L1051
; Line 1922
	mov	DWORD PTR _copied$[ebp], 1
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_copy_rtx
	add	esp, 4
	mov	DWORD PTR _x$[ebp], eax
; Line 1923
$L1051:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _tem$1050[ebp], eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [ecx+4], eax
	mov	eax, DWORD PTR _tem$1050[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 1924
	mov	eax, DWORD PTR _const_arg0$[ebp]
	mov	DWORD PTR _tem$1050[ebp], eax
	mov	eax, DWORD PTR _const_arg1$[ebp]
	mov	DWORD PTR _const_arg0$[ebp], eax
	mov	eax, DWORD PTR _tem$1050[ebp]
	mov	DWORD PTR _const_arg1$[ebp], eax
; Line 1926
$L1048:
	jmp	$L1044
; Line 1927
	jmp	$L1044
$L1043:
	sub	DWORD PTR -244+[ebp], 44		; 0000002cH
	cmp	DWORD PTR -244+[ebp], 24		; 00000018H
	ja	$L1044
	shl	DWORD PTR -244+[ebp], 2
	mov	eax, DWORD PTR -244+[ebp]
	jmp	DWORD PTR $L1740[eax]
$L1740:
	DD	OFFSET $L1047
	DD	OFFSET $L1044
	DD	OFFSET $L1044
	DD	OFFSET $L1047
	DD	OFFSET $L1044
	DD	OFFSET $L1044
	DD	OFFSET $L1047
	DD	OFFSET $L1044
	DD	OFFSET $L1044
	DD	OFFSET $L1047
	DD	OFFSET $L1047
	DD	OFFSET $L1047
	DD	OFFSET $L1044
	DD	OFFSET $L1044
	DD	OFFSET $L1044
	DD	OFFSET $L1044
	DD	OFFSET $L1044
	DD	OFFSET $L1044
	DD	OFFSET $L1044
	DD	OFFSET $L1044
	DD	OFFSET $L1044
	DD	OFFSET $L1044
	DD	OFFSET $L1044
	DD	OFFSET $L1047
	DD	OFFSET $L1047
$L1044:
; Line 1935
	mov	eax, DWORD PTR _code$[ebp]
	cmp	DWORD PTR _rtx_length[eax*4], 1
	jne	$L1052
; Line 1937
	cmp	DWORD PTR _const_arg0$[ebp], 0
	jne	$L1053
; Line 1938
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L998
; Line 1940
$L1053:
	mov	eax, DWORD PTR _const_arg0$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1054
; Line 1942
	mov	eax, DWORD PTR _const_arg0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _arg0$1055[ebp], eax
; Line 1944
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR -248+[ebp], eax
	jmp	$L1056
; Line 1946
$L1060:
; Line 1947
	mov	eax, DWORD PTR _arg0$1055[ebp]
	not	eax
	mov	DWORD PTR _val$[ebp], eax
; Line 1948
	jmp	$L1057
; Line 1950
$L1061:
; Line 1951
	mov	eax, DWORD PTR _arg0$1055[ebp]
	neg	eax
	mov	DWORD PTR _val$[ebp], eax
; Line 1952
	jmp	$L1057
; Line 1954
$L1062:
; Line 1955
	mov	eax, DWORD PTR _arg0$1055[ebp]
	mov	DWORD PTR _val$[ebp], eax
; Line 1956
	jmp	$L1057
; Line 1958
$L1063:
; Line 1960
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	mov	DWORD PTR _mode$1064[ebp], eax
; Line 1961
	cmp	DWORD PTR _mode$1064[ebp], 0
	jne	$L1065
; Line 1962
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L998
; Line 1963
$L1065:
	mov	eax, DWORD PTR _mode$1064[ebp]
	mov	eax, DWORD PTR _mode_size[eax*4]
	shl	eax, 3
	cmp	eax, 32					; 00000020H
	jge	$L1066
; Line 1964
	mov	eax, -1
	mov	ecx, DWORD PTR _mode$1064[ebp]
	mov	ecx, DWORD PTR _mode_size[ecx*4]
	shl	ecx, 3
	shl	eax, cl
	not	eax
	and	eax, DWORD PTR _arg0$1055[ebp]
	mov	DWORD PTR _val$[ebp], eax
; Line 1965
	jmp	$L1067
$L1066:
; Line 1966
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L998
$L1067:
; Line 1967
	jmp	$L1057
; Line 1970
$L1068:
; Line 1972
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	mov	DWORD PTR _mode$1069[ebp], eax
; Line 1973
	cmp	DWORD PTR _mode$1069[ebp], 0
	jne	$L1070
; Line 1974
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L998
; Line 1975
$L1070:
	mov	eax, DWORD PTR _mode$1069[ebp]
	mov	eax, DWORD PTR _mode_size[eax*4]
	shl	eax, 3
	cmp	eax, 32					; 00000020H
	jge	$L1071
; Line 1977
	mov	eax, -1
	mov	ecx, DWORD PTR _mode$1069[ebp]
	mov	ecx, DWORD PTR _mode_size[ecx*4]
	shl	ecx, 3
	shl	eax, cl
	not	eax
	and	eax, DWORD PTR _arg0$1055[ebp]
	mov	DWORD PTR _val$[ebp], eax
; Line 1978
	mov	eax, 1
	mov	ecx, DWORD PTR _mode$1069[ebp]
	mov	ecx, DWORD PTR _mode_size[ecx*4]
	shl	ecx, 3
	dec	ecx
	shl	eax, cl
	test	eax, DWORD PTR _val$[ebp]
	je	$L1072
; Line 1979
	sub	eax, eax
	mov	edx, 1
	mov	ecx, DWORD PTR _mode$1069[ebp]
	mov	ecx, DWORD PTR _mode_size[ecx*4]
	shl	ecx, 3
	shl	edx, cl
	sub	eax, edx
	neg	eax
	sub	DWORD PTR _val$[ebp], eax
; Line 1980
$L1072:
; Line 1981
	jmp	$L1073
$L1071:
; Line 1982
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L998
$L1073:
; Line 1983
	jmp	$L1057
; Line 1986
$L1074:
; Line 1987
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L998
; Line 1988
	jmp	$L1057
$L1056:
	cmp	DWORD PTR -248+[ebp], 46		; 0000002eH
	je	$L1061
	cmp	DWORD PTR -248+[ebp], 56		; 00000038H
	je	$L1060
	cmp	DWORD PTR -248+[ebp], 77		; 0000004dH
	je	$L1068
	cmp	DWORD PTR -248+[ebp], 78		; 0000004eH
	je	$L1063
	cmp	DWORD PTR -248+[ebp], 79		; 0000004fH
	je	$L1062
	jmp	$L1074
$L1057:
; Line 1991
	jmp	$L1075
$L1054:
; Line 1993
	mov	eax, DWORD PTR _const_arg0$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2031616				; 001f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1076
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3014656				; 002e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1076
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	cmp	DWORD PTR _mode_class[eax], 2
	jne	$L1076
; Line 1999
	lea	eax, DWORD PTR _handler$1079[ebp]
	push	eax
	call	__setjmp
	add	esp, 4
	or	eax, eax
	je	$L1080
; Line 2001
	push	OFFSET $SG1082
	call	_warning
	add	esp, 4
; Line 2002
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L998
; Line 2004
$L1080:
	lea	eax, DWORD PTR _handler$1079[ebp]
	push	eax
	call	_set_float_handler
	add	esp, 4
; Line 2005
	push	8
	mov	eax, DWORD PTR _const_arg0$[ebp]
	add	eax, 12					; 0000000cH
	push	eax
	lea	eax, DWORD PTR _u$1077[ebp]
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
; Line 2006
	mov	eax, DWORD PTR _u$1077[ebp+4]
	mov	DWORD PTR _arg0$1078[ebp+4], eax
	mov	eax, DWORD PTR _u$1077[ebp]
	mov	DWORD PTR _arg0$1078[ebp], eax
; Line 2008
	fld	QWORD PTR _arg0$1078[ebp]
	fchs
	fstp	QWORD PTR _u$1077[ebp]
; Line 2009
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	mov	eax, DWORD PTR _u$1077[ebp+4]
	push	eax
	mov	eax, DWORD PTR _u$1077[ebp]
	push	eax
	call	_immed_real_const_1
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _x$[ebp], eax
; Line 2010
	push	0
	call	_set_float_handler
	add	esp, 4
; Line 2011
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L998
; Line 2014
	jmp	$L1084
$L1076:
; Line 2015
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L998
$L1084:
$L1075:
; Line 2017
	jmp	$L1085
$L1052:
	mov	eax, DWORD PTR _code$[ebp]
	cmp	DWORD PTR _rtx_length[eax*4], 2
	jne	$L1086
; Line 2020
	mov	eax, DWORD PTR _width$[ebp]
	mov	DWORD PTR _arithwidth$1091[ebp], eax
; Line 2027
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR _cc0_rtx
	cmp	DWORD PTR [eax+4], ecx
	je	$L1093
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2818048				; 002b0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1092
$L1093:
; Line 2029
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR _cc0_rtx
	cmp	DWORD PTR [eax+4], ecx
	jne	$L1094
; Line 2030
	mov	eax, DWORD PTR _prev_insn_cc0$S431
	mov	DWORD PTR _arg0$1087[ebp], eax
; Line 2031
	jmp	$L1095
$L1094:
; Line 2032
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	0
	call	_fold_cc0
	add	esp, 8
	mov	DWORD PTR _arg0$1087[ebp], eax
$L1095:
; Line 2038
	cmp	DWORD PTR _arg0$1087[ebp], 0
	je	$L1097
	mov	eax, DWORD PTR _const_arg1$[ebp]
	cmp	DWORD PTR _const0_rtx, eax
	jne	$L1097
	test	BYTE PTR _arg0$1087[ebp], 128		; 00000080H
	je	$L1096
	cmp	DWORD PTR _code$[ebp], 68		; 00000044H
	je	$L1096
	cmp	DWORD PTR _code$[ebp], 67		; 00000043H
	je	$L1096
$L1097:
; Line 2039
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L998
; Line 2042
$L1096:
	cmp	DWORD PTR _code$[ebp], 75		; 0000004bH
	je	$L1099
	cmp	DWORD PTR _code$[ebp], 76		; 0000004cH
	je	$L1099
	cmp	DWORD PTR _code$[ebp], 73		; 00000049H
	je	$L1099
	cmp	DWORD PTR _code$[ebp], 74		; 0000004aH
	jne	$L1098
$L1099:
; Line 2043
	and	DWORD PTR _arg0$1087[ebp], 7
; Line 2044
	jmp	$L1100
$L1098:
; Line 2045
	mov	eax, DWORD PTR _arg0$1087[ebp]
	shr	eax, 3
	and	eax, 7
	mov	DWORD PTR _arg0$1087[ebp], eax
$L1100:
; Line 2046
	cmp	DWORD PTR _arg0$1087[ebp], 7
	jne	$L1101
	mov	DWORD PTR _arg0$1087[ebp], -1
; Line 2048
$L1101:
	mov	eax, DWORD PTR _code$[ebp]
	mov	DWORD PTR -252+[ebp], eax
	jmp	$L1102
; Line 2050
$L1106:
; Line 2052
	cmp	DWORD PTR _arg0$1087[ebp], 0
	jle	$L1703
	mov	eax, DWORD PTR _const0_rtx
	jmp	$L1704
$L1703:
	mov	eax, DWORD PTR _const1_rtx
$L1704:
	jmp	$L998
; Line 2053
$L1107:
; Line 2055
	cmp	DWORD PTR _arg0$1087[ebp], 0
	jl	$L1705
	mov	eax, DWORD PTR _const0_rtx
	jmp	$L1706
$L1705:
	mov	eax, DWORD PTR _const1_rtx
$L1706:
	jmp	$L998
; Line 2056
$L1108:
; Line 2058
	cmp	DWORD PTR _arg0$1087[ebp], 0
	jl	$L1707
	mov	eax, DWORD PTR _const1_rtx
	jmp	$L1708
$L1707:
	mov	eax, DWORD PTR _const0_rtx
$L1708:
	jmp	$L998
; Line 2059
$L1109:
; Line 2061
	cmp	DWORD PTR _arg0$1087[ebp], 0
	jle	$L1709
	mov	eax, DWORD PTR _const1_rtx
	jmp	$L1710
$L1709:
	mov	eax, DWORD PTR _const0_rtx
$L1710:
	jmp	$L998
; Line 2062
$L1110:
; Line 2063
	cmp	DWORD PTR _arg0$1087[ebp], 0
	je	$L1711
	mov	eax, DWORD PTR _const1_rtx
	jmp	$L1712
$L1711:
	mov	eax, DWORD PTR _const0_rtx
$L1712:
	jmp	$L998
; Line 2064
$L1111:
; Line 2065
	cmp	DWORD PTR _arg0$1087[ebp], 0
	jne	$L1713
	mov	eax, DWORD PTR _const1_rtx
	jmp	$L1714
$L1713:
	mov	eax, DWORD PTR _const0_rtx
$L1714:
	jmp	$L998
; Line 2066
$L1112:
; Line 2067
	call	_abort
; Line 2068
	jmp	$L1103
$L1102:
	sub	DWORD PTR -252+[ebp], 67		; 00000043H
	cmp	DWORD PTR -252+[ebp], 9
	ja	$L1112
	shl	DWORD PTR -252+[ebp], 2
	mov	eax, DWORD PTR -252+[ebp]
	jmp	DWORD PTR $L1742[eax]
$L1742:
	DD	OFFSET $L1110
	DD	OFFSET $L1111
	DD	OFFSET $L1108
	DD	OFFSET $L1109
	DD	OFFSET $L1106
	DD	OFFSET $L1107
	DD	OFFSET $L1108
	DD	OFFSET $L1109
	DD	OFFSET $L1106
	DD	OFFSET $L1107
$L1103:
; Line 2071
$L1092:
; Line 2073
	cmp	DWORD PTR _const_arg0$[ebp], 0
	je	$L1114
	cmp	DWORD PTR _const_arg1$[ebp], 0
	je	$L1114
	mov	eax, DWORD PTR _const_arg0$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1114
	mov	eax, DWORD PTR _const_arg1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1113
$L1114:
; Line 2080
	mov	eax, DWORD PTR _code$[ebp]
	mov	DWORD PTR -256+[ebp], eax
	jmp	$L1115
; Line 2082
$L1119:
; Line 2085
	mov	eax, DWORD PTR _const0_rtx
	cmp	DWORD PTR _const_arg0$[ebp], eax
	je	$L1121
	mov	eax, DWORD PTR _fconst0_rtx
	cmp	DWORD PTR _const_arg0$[ebp], eax
	je	$L1121
	mov	eax, DWORD PTR _dconst0_rtx
	cmp	DWORD PTR _const_arg0$[ebp], eax
	jne	$L1120
$L1121:
; Line 2086
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	jmp	$L998
; Line 2087
$L1120:
; Line 2089
	mov	eax, DWORD PTR _const_arg1$[ebp]
	cmp	DWORD PTR _const0_rtx, eax
	je	$L1123
	mov	eax, DWORD PTR _const_arg1$[ebp]
	cmp	DWORD PTR _fconst0_rtx, eax
	je	$L1123
	mov	eax, DWORD PTR _const_arg1$[ebp]
	cmp	DWORD PTR _dconst0_rtx, eax
	jne	$L1122
$L1123:
; Line 2090
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	jmp	$L998
; Line 2093
$L1122:
; Line 2096
	cmp	DWORD PTR _const_arg0$[ebp], 0
	je	$L1124
	cmp	DWORD PTR _const_arg1$[ebp], 0
	je	$L1124
	mov	eax, DWORD PTR _const_arg0$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2031616				; 001f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1124
	mov	eax, DWORD PTR _const_arg1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2031616				; 001f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1124
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	cmp	DWORD PTR _mode_class[eax], 1
	jne	$L1124
; Line 2098
	mov	eax, DWORD PTR _const_arg1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1125
; Line 2099
	mov	eax, DWORD PTR _const_arg1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _const_arg0$[ebp]
	push	eax
	call	_plus_constant
	add	esp, 8
	mov	DWORD PTR _new$[ebp], eax
; Line 2100
	jmp	$L1126
$L1125:
; Line 2102
	mov	eax, DWORD PTR _const0_rtx
	push	eax
	mov	eax, DWORD PTR _const0_rtx
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	44					; 0000002cH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	DWORD PTR _new$[ebp], eax
; Line 2103
	mov	eax, DWORD PTR _const_arg0$[ebp]
	mov	ecx, DWORD PTR _new$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 2104
	mov	eax, DWORD PTR _const_arg0$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1127
; Line 2105
	mov	eax, DWORD PTR _const_arg0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _new$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 2106
$L1127:
	mov	eax, DWORD PTR _const_arg1$[ebp]
	mov	ecx, DWORD PTR _new$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 2107
	mov	eax, DWORD PTR _const_arg1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1128
; Line 2108
	mov	eax, DWORD PTR _const_arg1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _new$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 2109
$L1128:
	mov	eax, DWORD PTR _new$[ebp]
	push	eax
	mov	eax, DWORD PTR _new$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	32					; 00000020H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _new$[ebp], eax
; Line 2110
$L1126:
; Line 2112
	jmp	$L1129
$L1124:
; Line 2116
	cmp	DWORD PTR _const_arg1$[ebp], 0
	je	$L1130
	mov	eax, DWORD PTR _const_arg1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1130
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1130
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1131
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1131
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1131
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1131
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1132
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1132
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1132
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1130
$L1132:
$L1131:
; Line 2122
	mov	eax, DWORD PTR _const_arg1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_plus_constant
	add	esp, 8
	mov	DWORD PTR _new$[ebp], eax
; Line 2123
$L1130:
$L1129:
	jmp	$L1116
; Line 2125
$L1133:
; Line 2126
	mov	eax, DWORD PTR _const_arg1$[ebp]
	cmp	DWORD PTR _const0_rtx, eax
	jne	$L1134
; Line 2127
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	jmp	$L998
; Line 2129
$L1134:
; Line 2130
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	cmp	DWORD PTR [eax+4], ecx
	je	$L1136
	cmp	DWORD PTR _const_arg0$[ebp], 0
	je	$L1135
	mov	eax, DWORD PTR _const_arg1$[ebp]
	cmp	DWORD PTR _const_arg0$[ebp], eax
	jne	$L1135
$L1136:
; Line 2133
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	cmp	DWORD PTR _mode_class[eax], 1
	jne	$L1137
; Line 2134
	mov	eax, DWORD PTR _const0_rtx
	jmp	$L998
; Line 2135
$L1137:
; Line 2136
$L1135:
	jmp	$L1116
; Line 2138
$L1138:
; Line 2141
	mov	eax, DWORD PTR _const_arg1$[ebp]
	cmp	DWORD PTR _const0_rtx, eax
	je	$L1140
	mov	eax, DWORD PTR _const_arg1$[ebp]
	cmp	DWORD PTR _fconst0_rtx, eax
	je	$L1140
	mov	eax, DWORD PTR _const_arg1$[ebp]
	cmp	DWORD PTR _dconst0_rtx, eax
	jne	$L1139
$L1140:
; Line 2142
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	jmp	$L998
; Line 2144
$L1139:
; Line 2145
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	cmp	DWORD PTR [eax+4], ecx
	je	$L1142
	cmp	DWORD PTR _const_arg0$[ebp], 0
	je	$L1141
	mov	eax, DWORD PTR _const_arg1$[ebp]
	cmp	DWORD PTR _const_arg0$[ebp], eax
	jne	$L1141
$L1142:
; Line 2148
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	cmp	DWORD PTR _mode_class[eax], 1
	jne	$L1143
; Line 2149
	mov	eax, DWORD PTR _const0_rtx
	jmp	$L998
; Line 2150
$L1143:
; Line 2153
$L1141:
	mov	eax, DWORD PTR _const0_rtx
	cmp	DWORD PTR _const_arg0$[ebp], eax
	jne	$L1144
; Line 2154
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	46					; 0000002eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	jmp	$L998
; Line 2157
$L1144:
; Line 2158
	cmp	DWORD PTR _const_arg0$[ebp], 0
	je	$L1145
	cmp	DWORD PTR _const_arg1$[ebp], 0
	je	$L1145
	mov	eax, DWORD PTR _const_arg1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1145
; Line 2159
	mov	eax, DWORD PTR _const_arg1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	neg	eax
	push	eax
	mov	eax, DWORD PTR _const_arg0$[ebp]
	push	eax
	call	_plus_constant
	add	esp, 8
	mov	DWORD PTR _new$[ebp], eax
; Line 2160
$L1145:
	jmp	$L1116
; Line 2162
$L1146:
; Line 2167
	cmp	DWORD PTR _const_arg1$[ebp], 0
	je	$L1147
	mov	eax, DWORD PTR _const_arg1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1147
	mov	eax, DWORD PTR _const_arg1$[ebp]
	cmp	DWORD PTR [eax+4], -1
	jne	$L1147
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR [ecx]
	shl	ecx, 8
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1147
; Line 2168
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	46					; 0000002eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	jmp	$L998
; Line 2169
$L1147:
; Line 2171
	cmp	DWORD PTR _const_arg0$[ebp], 0
	je	$L1148
	mov	eax, DWORD PTR _const_arg0$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1148
	mov	eax, DWORD PTR _const_arg0$[ebp]
	cmp	DWORD PTR [eax+4], -1
	jne	$L1148
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR [ecx]
	shl	ecx, 8
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1148
; Line 2172
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	46					; 0000002eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	jmp	$L998
; Line 2173
$L1148:
	mov	eax, DWORD PTR _const_arg1$[ebp]
	cmp	DWORD PTR _const0_rtx, eax
	je	$L1150
	mov	eax, DWORD PTR _const0_rtx
	cmp	DWORD PTR _const_arg0$[ebp], eax
	jne	$L1149
$L1150:
; Line 2174
	mov	eax, DWORD PTR _const0_rtx
	mov	DWORD PTR _new$[ebp], eax
; Line 2175
$L1149:
	mov	eax, DWORD PTR _const_arg1$[ebp]
	cmp	DWORD PTR _fconst0_rtx, eax
	je	$L1152
	mov	eax, DWORD PTR _fconst0_rtx
	cmp	DWORD PTR _const_arg0$[ebp], eax
	jne	$L1151
$L1152:
; Line 2176
	mov	eax, DWORD PTR _fconst0_rtx
	mov	DWORD PTR _new$[ebp], eax
; Line 2177
$L1151:
	mov	eax, DWORD PTR _const_arg1$[ebp]
	cmp	DWORD PTR _dconst0_rtx, eax
	je	$L1154
	mov	eax, DWORD PTR _dconst0_rtx
	cmp	DWORD PTR _const_arg0$[ebp], eax
	jne	$L1153
$L1154:
; Line 2178
	mov	eax, DWORD PTR _dconst0_rtx
	mov	DWORD PTR _new$[ebp], eax
; Line 2179
$L1153:
	mov	eax, DWORD PTR _const_arg1$[ebp]
	cmp	DWORD PTR _const1_rtx, eax
	jne	$L1155
; Line 2180
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	jmp	$L998
; Line 2181
$L1155:
	mov	eax, DWORD PTR _const1_rtx
	cmp	DWORD PTR _const_arg0$[ebp], eax
	jne	$L1156
; Line 2182
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	jmp	$L998
; Line 2183
$L1156:
	jmp	$L1116
; Line 2185
$L1157:
; Line 2186
	mov	eax, DWORD PTR _const_arg1$[ebp]
	cmp	DWORD PTR _const0_rtx, eax
	jne	$L1158
; Line 2187
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	jmp	$L998
; Line 2188
$L1158:
	mov	eax, DWORD PTR _const0_rtx
	cmp	DWORD PTR _const_arg0$[ebp], eax
	jne	$L1159
; Line 2189
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	jmp	$L998
; Line 2190
$L1159:
; Line 2192
	cmp	DWORD PTR _const_arg1$[ebp], 0
	je	$L1160
	mov	eax, DWORD PTR _const_arg1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1160
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	shl	eax, 3
	cmp	eax, 32					; 00000020H
	jl	$L1715
	mov	DWORD PTR -188+[ebp], -1
	jmp	$L1716
$L1715:
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
	mov	DWORD PTR -188+[ebp], eax
$L1716:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	shl	eax, 3
	cmp	eax, 32					; 00000020H
	jl	$L1717
	mov	DWORD PTR -192+[ebp], -1
	jmp	$L1718
$L1717:
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
	mov	DWORD PTR -192+[ebp], eax
$L1718:
	mov	eax, DWORD PTR _const_arg1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	and	eax, DWORD PTR -188+[ebp]
	cmp	eax, DWORD PTR -192+[ebp]
	jne	$L1160
; Line 2193
	mov	eax, DWORD PTR _const_arg1$[ebp]
	mov	DWORD PTR _new$[ebp], eax
; Line 2194
$L1160:
; Line 2196
	cmp	DWORD PTR _const_arg0$[ebp], 0
	je	$L1161
	mov	eax, DWORD PTR _const_arg0$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1161
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	shl	eax, 3
	cmp	eax, 32					; 00000020H
	jl	$L1719
	mov	DWORD PTR -196+[ebp], -1
	jmp	$L1720
$L1719:
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
	mov	DWORD PTR -196+[ebp], eax
$L1720:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	shl	eax, 3
	cmp	eax, 32					; 00000020H
	jl	$L1721
	mov	DWORD PTR -200+[ebp], -1
	jmp	$L1722
$L1721:
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
	mov	DWORD PTR -200+[ebp], eax
$L1722:
	mov	eax, DWORD PTR _const_arg0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	and	eax, DWORD PTR -196+[ebp]
	cmp	eax, DWORD PTR -200+[ebp]
	jne	$L1161
; Line 2197
	mov	eax, DWORD PTR _const_arg0$[ebp]
	mov	DWORD PTR _new$[ebp], eax
; Line 2198
$L1161:
	jmp	$L1116
; Line 2200
$L1162:
; Line 2201
	mov	eax, DWORD PTR _const_arg1$[ebp]
	cmp	DWORD PTR _const0_rtx, eax
	jne	$L1163
; Line 2202
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	jmp	$L998
; Line 2203
$L1163:
	mov	eax, DWORD PTR _const0_rtx
	cmp	DWORD PTR _const_arg0$[ebp], eax
	jne	$L1164
; Line 2204
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	jmp	$L998
; Line 2205
$L1164:
; Line 2207
	cmp	DWORD PTR _const_arg1$[ebp], 0
	je	$L1165
	mov	eax, DWORD PTR _const_arg1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1165
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	shl	eax, 3
	cmp	eax, 32					; 00000020H
	jl	$L1723
	mov	DWORD PTR -204+[ebp], -1
	jmp	$L1724
$L1723:
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
	mov	DWORD PTR -204+[ebp], eax
$L1724:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	shl	eax, 3
	cmp	eax, 32					; 00000020H
	jl	$L1725
	mov	DWORD PTR -208+[ebp], -1
	jmp	$L1726
$L1725:
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
	mov	DWORD PTR -208+[ebp], eax
$L1726:
	mov	eax, DWORD PTR _const_arg1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	and	eax, DWORD PTR -204+[ebp]
	cmp	eax, DWORD PTR -208+[ebp]
	jne	$L1165
; Line 2208
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	56					; 00000038H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	jmp	$L998
; Line 2209
$L1165:
; Line 2211
	cmp	DWORD PTR _const_arg0$[ebp], 0
	je	$L1166
	mov	eax, DWORD PTR _const_arg0$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1166
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	shl	eax, 3
	cmp	eax, 32					; 00000020H
	jl	$L1727
	mov	DWORD PTR -212+[ebp], -1
	jmp	$L1728
$L1727:
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
	mov	DWORD PTR -212+[ebp], eax
$L1728:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	shl	eax, 3
	cmp	eax, 32					; 00000020H
	jl	$L1729
	mov	DWORD PTR -216+[ebp], -1
	jmp	$L1730
$L1729:
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
	mov	DWORD PTR -216+[ebp], eax
$L1730:
	mov	eax, DWORD PTR _const_arg0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	and	eax, DWORD PTR -212+[ebp]
	cmp	eax, DWORD PTR -216+[ebp]
	jne	$L1166
; Line 2212
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	56					; 00000038H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	jmp	$L998
; Line 2213
$L1166:
	jmp	$L1116
; Line 2215
$L1167:
; Line 2216
	mov	eax, DWORD PTR _const_arg1$[ebp]
	cmp	DWORD PTR _const0_rtx, eax
	je	$L1169
	mov	eax, DWORD PTR _const0_rtx
	cmp	DWORD PTR _const_arg0$[ebp], eax
	jne	$L1168
$L1169:
; Line 2217
	mov	eax, DWORD PTR _const0_rtx
	mov	DWORD PTR _new$[ebp], eax
; Line 2218
$L1168:
; Line 2220
	cmp	DWORD PTR _const_arg1$[ebp], 0
	je	$L1170
	mov	eax, DWORD PTR _const_arg1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1170
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	shl	eax, 3
	cmp	eax, 32					; 00000020H
	jl	$L1731
	mov	DWORD PTR -220+[ebp], -1
	jmp	$L1732
$L1731:
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
	mov	DWORD PTR -220+[ebp], eax
$L1732:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	shl	eax, 3
	cmp	eax, 32					; 00000020H
	jl	$L1733
	mov	DWORD PTR -224+[ebp], -1
	jmp	$L1734
$L1733:
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
	mov	DWORD PTR -224+[ebp], eax
$L1734:
	mov	eax, DWORD PTR _const_arg1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	and	eax, DWORD PTR -220+[ebp]
	cmp	eax, DWORD PTR -224+[ebp]
	jne	$L1170
; Line 2221
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	jmp	$L998
; Line 2222
$L1170:
; Line 2224
	cmp	DWORD PTR _const_arg0$[ebp], 0
	je	$L1171
	mov	eax, DWORD PTR _const_arg0$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1171
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	shl	eax, 3
	cmp	eax, 32					; 00000020H
	jl	$L1735
	mov	DWORD PTR -228+[ebp], -1
	jmp	$L1736
$L1735:
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
	mov	DWORD PTR -228+[ebp], eax
$L1736:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	shl	eax, 3
	cmp	eax, 32					; 00000020H
	jl	$L1737
	mov	DWORD PTR -232+[ebp], -1
	jmp	$L1738
$L1737:
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
	mov	DWORD PTR -232+[ebp], eax
$L1738:
	mov	eax, DWORD PTR _const_arg0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	and	eax, DWORD PTR -228+[ebp]
	cmp	eax, DWORD PTR -232+[ebp]
	jne	$L1171
; Line 2225
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	jmp	$L998
; Line 2226
$L1171:
	jmp	$L1116
; Line 2228
$L1172:
; Line 2230
	mov	eax, DWORD PTR _const_arg1$[ebp]
	cmp	DWORD PTR _const1_rtx, eax
	jne	$L1173
; Line 2231
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	jmp	$L998
; Line 2232
$L1173:
	mov	eax, DWORD PTR _const0_rtx
	cmp	DWORD PTR _const_arg0$[ebp], eax
	jne	$L1174
; Line 2233
	mov	eax, DWORD PTR _const0_rtx
	mov	DWORD PTR _new$[ebp], eax
; Line 2234
$L1174:
	jmp	$L1116
; Line 2236
$L1175:
; Line 2238
	mov	eax, DWORD PTR _const0_rtx
	cmp	DWORD PTR _const_arg0$[ebp], eax
	je	$L1177
	mov	eax, DWORD PTR _const_arg1$[ebp]
	cmp	DWORD PTR _const1_rtx, eax
	jne	$L1176
$L1177:
; Line 2239
	mov	eax, DWORD PTR _const0_rtx
	mov	DWORD PTR _new$[ebp], eax
; Line 2240
$L1176:
	jmp	$L1116
; Line 2242
$L1178:
; Line 2248
	mov	eax, DWORD PTR _const_arg1$[ebp]
	cmp	DWORD PTR _const0_rtx, eax
	jne	$L1179
; Line 2249
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	jmp	$L998
; Line 2250
$L1179:
	mov	eax, DWORD PTR _const0_rtx
	cmp	DWORD PTR _const_arg0$[ebp], eax
	jne	$L1180
; Line 2251
	mov	eax, DWORD PTR _const_arg0$[ebp]
	mov	DWORD PTR _new$[ebp], eax
; Line 2252
$L1180:
	jmp	$L1116
; Line 2253
	jmp	$L1116
$L1115:
	sub	DWORD PTR -256+[ebp], 43		; 0000002bH
	cmp	DWORD PTR -256+[ebp], 19		; 00000013H
	ja	$L1116
	shl	DWORD PTR -256+[ebp], 2
	mov	eax, DWORD PTR -256+[ebp]
	jmp	DWORD PTR $L1743[eax]
$L1743:
	DD	OFFSET $L1133
	DD	OFFSET $L1119
	DD	OFFSET $L1138
	DD	OFFSET $L1116
	DD	OFFSET $L1146
	DD	OFFSET $L1172
	DD	OFFSET $L1175
	DD	OFFSET $L1146
	DD	OFFSET $L1172
	DD	OFFSET $L1175
	DD	OFFSET $L1167
	DD	OFFSET $L1157
	DD	OFFSET $L1162
	DD	OFFSET $L1116
	DD	OFFSET $L1178
	DD	OFFSET $L1178
	DD	OFFSET $L1178
	DD	OFFSET $L1178
	DD	OFFSET $L1178
	DD	OFFSET $L1178
$L1116:
; Line 2255
	cmp	DWORD PTR _new$[ebp], 0
	je	$L1181
; Line 2256
	mov	eax, DWORD PTR _new$[ebp]
	jmp	$L998
; Line 2257
$L1181:
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L998
; Line 2260
$L1113:
	cmp	DWORD PTR _arithwidth$1091[ebp], 0
	jne	$L1182
; Line 2262
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sub	ecx, ecx
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L1183
; Line 2263
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	shl	eax, 3
	mov	DWORD PTR _arithwidth$1091[ebp], eax
; Line 2264
$L1183:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sub	ecx, ecx
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L1184
; Line 2265
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	shl	eax, 3
	mov	DWORD PTR _arithwidth$1091[ebp], eax
; Line 2266
$L1184:
; Line 2271
$L1182:
	mov	eax, DWORD PTR _const_arg0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _arg0$1087[ebp], eax
; Line 2272
	mov	eax, DWORD PTR _const_arg1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _arg1$1088[ebp], eax
; Line 2274
	cmp	DWORD PTR _arithwidth$1091[ebp], 32	; 00000020H
	jge	$L1185
	cmp	DWORD PTR _arithwidth$1091[ebp], 0
	jle	$L1185
; Line 2276
	mov	eax, 1
	mov	cl, BYTE PTR _arithwidth$1091[ebp]
	shl	eax, cl
	dec	eax
	and	DWORD PTR _arg0$1087[ebp], eax
; Line 2277
	mov	eax, 1
	mov	cl, BYTE PTR _arithwidth$1091[ebp]
	shl	eax, cl
	dec	eax
	and	DWORD PTR _arg1$1088[ebp], eax
; Line 2279
	mov	eax, DWORD PTR _arg0$1087[ebp]
	mov	DWORD PTR _arg0s$1089[ebp], eax
; Line 2280
	mov	eax, 1
	mov	ecx, DWORD PTR _arithwidth$1091[ebp]
	dec	ecx
	shl	eax, cl
	test	eax, DWORD PTR _arg0s$1089[ebp]
	je	$L1186
; Line 2281
	mov	eax, -1
	mov	cl, BYTE PTR _arithwidth$1091[ebp]
	shl	eax, cl
	or	DWORD PTR _arg0s$1089[ebp], eax
; Line 2283
$L1186:
	mov	eax, DWORD PTR _arg1$1088[ebp]
	mov	DWORD PTR _arg1s$1090[ebp], eax
; Line 2284
	mov	eax, 1
	mov	ecx, DWORD PTR _arithwidth$1091[ebp]
	dec	ecx
	shl	eax, cl
	test	eax, DWORD PTR _arg1s$1090[ebp]
	je	$L1187
; Line 2285
	mov	eax, -1
	mov	cl, BYTE PTR _arithwidth$1091[ebp]
	shl	eax, cl
	or	DWORD PTR _arg1s$1090[ebp], eax
; Line 2286
$L1187:
; Line 2287
	jmp	$L1188
$L1185:
; Line 2289
	mov	eax, DWORD PTR _arg0$1087[ebp]
	mov	DWORD PTR _arg0s$1089[ebp], eax
; Line 2290
	mov	eax, DWORD PTR _arg1$1088[ebp]
	mov	DWORD PTR _arg1s$1090[ebp], eax
; Line 2291
$L1188:
; Line 2295
	mov	eax, DWORD PTR _code$[ebp]
	mov	DWORD PTR -260+[ebp], eax
	jmp	$L1189
; Line 2297
$L1193:
; Line 2298
	mov	eax, DWORD PTR _arg1$1088[ebp]
	add	eax, DWORD PTR _arg0$1087[ebp]
	mov	DWORD PTR _val$[ebp], eax
; Line 2299
	jmp	$L1190
; Line 2301
$L1194:
; Line 2302
	mov	eax, DWORD PTR _arg0$1087[ebp]
	sub	eax, DWORD PTR _arg1$1088[ebp]
	mov	DWORD PTR _val$[ebp], eax
; Line 2303
	jmp	$L1190
; Line 2305
$L1195:
; Line 2306
	mov	eax, DWORD PTR _arg1s$1090[ebp]
	imul	eax, DWORD PTR _arg0s$1089[ebp]
	mov	DWORD PTR _val$[ebp], eax
; Line 2307
	jmp	$L1190
; Line 2309
$L1196:
; Line 2310
	cmp	DWORD PTR _arg1s$1090[ebp], 0
	jne	$L1197
; Line 2311
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L998
; Line 2312
$L1197:
	mov	eax, DWORD PTR _arg0s$1089[ebp]
	cdq
	idiv	DWORD PTR _arg1s$1090[ebp]
	mov	DWORD PTR _val$[ebp], eax
; Line 2313
	jmp	$L1190
; Line 2315
$L1198:
; Line 2316
	cmp	DWORD PTR _arg1s$1090[ebp], 0
	jne	$L1199
; Line 2317
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L998
; Line 2318
$L1199:
	mov	eax, DWORD PTR _arg0s$1089[ebp]
	cdq
	idiv	DWORD PTR _arg1s$1090[ebp]
	mov	DWORD PTR _val$[ebp], edx
; Line 2319
	jmp	$L1190
; Line 2321
$L1200:
; Line 2322
	mov	eax, DWORD PTR _arg1$1088[ebp]
	imul	eax, DWORD PTR _arg0$1087[ebp]
	mov	DWORD PTR _val$[ebp], eax
; Line 2323
	jmp	$L1190
; Line 2325
$L1201:
; Line 2326
	cmp	DWORD PTR _arg1$1088[ebp], 0
	jne	$L1202
; Line 2327
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L998
; Line 2328
$L1202:
	mov	eax, DWORD PTR _arg0$1087[ebp]
	sub	edx, edx
	div	DWORD PTR _arg1$1088[ebp]
	mov	DWORD PTR _val$[ebp], eax
; Line 2329
	jmp	$L1190
; Line 2331
$L1203:
; Line 2332
	cmp	DWORD PTR _arg1$1088[ebp], 0
	jne	$L1204
; Line 2333
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L998
; Line 2334
$L1204:
	mov	eax, DWORD PTR _arg0$1087[ebp]
	sub	edx, edx
	div	DWORD PTR _arg1$1088[ebp]
	mov	DWORD PTR _val$[ebp], edx
; Line 2335
	jmp	$L1190
; Line 2337
$L1205:
; Line 2338
	mov	eax, DWORD PTR _arg1$1088[ebp]
	and	eax, DWORD PTR _arg0$1087[ebp]
	mov	DWORD PTR _val$[ebp], eax
; Line 2339
	jmp	$L1190
; Line 2341
$L1206:
; Line 2342
	mov	eax, DWORD PTR _arg1$1088[ebp]
	or	eax, DWORD PTR _arg0$1087[ebp]
	mov	DWORD PTR _val$[ebp], eax
; Line 2343
	jmp	$L1190
; Line 2345
$L1207:
; Line 2346
	mov	eax, DWORD PTR _arg1$1088[ebp]
	xor	eax, DWORD PTR _arg0$1087[ebp]
	mov	DWORD PTR _val$[ebp], eax
; Line 2347
	jmp	$L1190
; Line 2349
$L1208:
; Line 2350
	mov	eax, DWORD PTR _arg1$1088[ebp]
	sub	eax, DWORD PTR _arg0$1087[ebp]
	cmp	eax, 1
	sbb	eax, eax
	inc	eax
	mov	DWORD PTR _val$[ebp], eax
; Line 2351
	jmp	$L1190
; Line 2353
$L1209:
; Line 2354
	mov	eax, DWORD PTR _arg1$1088[ebp]
	sub	eax, DWORD PTR _arg0$1087[ebp]
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	mov	DWORD PTR _val$[ebp], eax
; Line 2355
	jmp	$L1190
; Line 2357
$L1210:
; Line 2358
	mov	eax, DWORD PTR _arg0s$1089[ebp]
	cmp	DWORD PTR _arg1s$1090[ebp], eax
	mov	eax, 0
	setge	al
	mov	DWORD PTR _val$[ebp], eax
; Line 2359
	jmp	$L1190
; Line 2361
$L1211:
; Line 2362
	mov	eax, DWORD PTR _arg0s$1089[ebp]
	cmp	DWORD PTR _arg1s$1090[ebp], eax
	mov	eax, 0
	setg	al
	mov	DWORD PTR _val$[ebp], eax
; Line 2363
	jmp	$L1190
; Line 2365
$L1212:
; Line 2366
	mov	eax, DWORD PTR _arg0s$1089[ebp]
	cmp	DWORD PTR _arg1s$1090[ebp], eax
	mov	eax, 0
	setle	al
	mov	DWORD PTR _val$[ebp], eax
; Line 2367
	jmp	$L1190
; Line 2369
$L1213:
; Line 2370
	mov	eax, DWORD PTR _arg0s$1089[ebp]
	cmp	DWORD PTR _arg1s$1090[ebp], eax
	mov	eax, 0
	setl	al
	mov	DWORD PTR _val$[ebp], eax
; Line 2371
	jmp	$L1190
; Line 2373
$L1214:
; Line 2374
	mov	eax, DWORD PTR _arg0$1087[ebp]
	cmp	DWORD PTR _arg1$1088[ebp], eax
	mov	eax, 0
	setae	al
	mov	DWORD PTR _val$[ebp], eax
; Line 2375
	jmp	$L1190
; Line 2377
$L1215:
; Line 2378
	mov	eax, DWORD PTR _arg0$1087[ebp]
	cmp	DWORD PTR _arg1$1088[ebp], eax
	mov	eax, 0
	seta	al
	mov	DWORD PTR _val$[ebp], eax
; Line 2379
	jmp	$L1190
; Line 2381
$L1216:
; Line 2382
	mov	eax, DWORD PTR _arg0$1087[ebp]
	cmp	DWORD PTR _arg1$1088[ebp], eax
	mov	eax, 0
	setbe	al
	mov	DWORD PTR _val$[ebp], eax
; Line 2383
	jmp	$L1190
; Line 2385
$L1217:
; Line 2386
	mov	eax, DWORD PTR _arg0$1087[ebp]
	cmp	DWORD PTR _arg1$1088[ebp], eax
	mov	eax, 0
	setb	al
	mov	DWORD PTR _val$[ebp], eax
; Line 2387
	jmp	$L1190
; Line 2389
$L1218:
; Line 2392
	cmp	DWORD PTR _arg1$1088[ebp], 0
	jge	$L1219
; Line 2393
	mov	eax, DWORD PTR _arg0$1087[ebp]
	mov	ecx, DWORD PTR _arg1$1088[ebp]
	neg	ecx
	shr	eax, cl
	mov	DWORD PTR _val$[ebp], eax
; Line 2394
	jmp	$L1220
$L1219:
; Line 2395
	mov	eax, DWORD PTR _arg0$1087[ebp]
	mov	cl, BYTE PTR _arg1$1088[ebp]
	shl	eax, cl
	mov	DWORD PTR _val$[ebp], eax
$L1220:
; Line 2396
	jmp	$L1190
; Line 2398
$L1221:
; Line 2399
	cmp	DWORD PTR _arg1$1088[ebp], 0
	jge	$L1222
; Line 2400
	mov	eax, DWORD PTR _arg0s$1089[ebp]
	mov	ecx, DWORD PTR _arg1$1088[ebp]
	neg	ecx
	sar	eax, cl
	mov	DWORD PTR _val$[ebp], eax
; Line 2401
	jmp	$L1223
$L1222:
; Line 2402
	mov	eax, DWORD PTR _arg0s$1089[ebp]
	mov	cl, BYTE PTR _arg1$1088[ebp]
	shl	eax, cl
	mov	DWORD PTR _val$[ebp], eax
$L1223:
; Line 2403
	jmp	$L1190
; Line 2405
$L1224:
; Line 2406
	mov	eax, DWORD PTR _arg1$1088[ebp]
	neg	eax
	mov	DWORD PTR _arg1$1088[ebp], eax
; Line 2407
$L1225:
; Line 2409
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	shl	eax, 3
	mov	DWORD PTR _size$1226[ebp], eax
; Line 2410
	cmp	DWORD PTR _arg1$1088[ebp], 0
	jle	$L1227
; Line 2412
	mov	eax, DWORD PTR _arg1$1088[ebp]
	cdq
	idiv	DWORD PTR _size$1226[ebp]
	mov	DWORD PTR _arg1$1088[ebp], edx
; Line 2414
	mov	eax, DWORD PTR _arg0$1087[ebp]
	mov	ecx, DWORD PTR _size$1226[ebp]
	sub	ecx, DWORD PTR _arg1$1088[ebp]
	shr	eax, cl
	mov	edx, DWORD PTR _arg0$1087[ebp]
	mov	cl, BYTE PTR _arg1$1088[ebp]
	shl	edx, cl
	or	eax, edx
	mov	DWORD PTR _val$[ebp], eax
; Line 2416
	jmp	$L1228
$L1227:
	cmp	DWORD PTR _arg1$1088[ebp], 0
	jge	$L1229
; Line 2418
	mov	eax, DWORD PTR _arg1$1088[ebp]
	neg	eax
	cdq
	idiv	DWORD PTR _size$1226[ebp]
	mov	DWORD PTR _arg1$1088[ebp], edx
; Line 2420
	mov	eax, DWORD PTR _arg0$1087[ebp]
	mov	ecx, DWORD PTR _size$1226[ebp]
	sub	ecx, DWORD PTR _arg1$1088[ebp]
	shl	eax, cl
	mov	edx, DWORD PTR _arg0$1087[ebp]
	mov	cl, BYTE PTR _arg1$1088[ebp]
	shr	edx, cl
	or	eax, edx
	mov	DWORD PTR _val$[ebp], eax
; Line 2422
	jmp	$L1230
$L1229:
; Line 2423
	mov	eax, DWORD PTR _arg0$1087[ebp]
	mov	DWORD PTR _val$[ebp], eax
$L1230:
$L1228:
; Line 2425
	jmp	$L1190
; Line 2427
$L1231:
; Line 2430
	cmp	DWORD PTR _arg1$1088[ebp], 0
	jge	$L1232
; Line 2431
	mov	eax, DWORD PTR _arg0$1087[ebp]
	mov	ecx, DWORD PTR _arg1$1088[ebp]
	neg	ecx
	shl	eax, cl
	mov	DWORD PTR _val$[ebp], eax
; Line 2432
	jmp	$L1233
$L1232:
; Line 2433
	mov	eax, DWORD PTR _arg0$1087[ebp]
	mov	cl, BYTE PTR _arg1$1088[ebp]
	shr	eax, cl
	mov	DWORD PTR _val$[ebp], eax
$L1233:
; Line 2434
	jmp	$L1190
; Line 2436
$L1234:
; Line 2437
	cmp	DWORD PTR _arg1$1088[ebp], 0
	jge	$L1235
; Line 2438
	mov	eax, DWORD PTR _arg0s$1089[ebp]
	mov	ecx, DWORD PTR _arg1$1088[ebp]
	neg	ecx
	shl	eax, cl
	mov	DWORD PTR _val$[ebp], eax
; Line 2439
	jmp	$L1236
$L1235:
; Line 2440
	mov	eax, DWORD PTR _arg0s$1089[ebp]
	mov	cl, BYTE PTR _arg1$1088[ebp]
	sar	eax, cl
	mov	DWORD PTR _val$[ebp], eax
$L1236:
; Line 2441
	jmp	$L1190
; Line 2443
$L1237:
; Line 2444
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L998
; Line 2445
	jmp	$L1190
$L1189:
	sub	DWORD PTR -260+[ebp], 44		; 0000002cH
	cmp	DWORD PTR -260+[ebp], 32		; 00000020H
	ja	$L1237
	shl	DWORD PTR -260+[ebp], 2
	mov	eax, DWORD PTR -260+[ebp]
	jmp	DWORD PTR $L1744[eax]
$L1744:
	DD	OFFSET $L1193
	DD	OFFSET $L1194
	DD	OFFSET $L1237
	DD	OFFSET $L1195
	DD	OFFSET $L1196
	DD	OFFSET $L1198
	DD	OFFSET $L1200
	DD	OFFSET $L1201
	DD	OFFSET $L1203
	DD	OFFSET $L1205
	DD	OFFSET $L1206
	DD	OFFSET $L1207
	DD	OFFSET $L1237
	DD	OFFSET $L1218
	DD	OFFSET $L1221
	DD	OFFSET $L1225
	DD	OFFSET $L1234
	DD	OFFSET $L1231
	DD	OFFSET $L1224
	DD	OFFSET $L1237
	DD	OFFSET $L1237
	DD	OFFSET $L1237
	DD	OFFSET $L1237
	DD	OFFSET $L1208
	DD	OFFSET $L1209
	DD	OFFSET $L1212
	DD	OFFSET $L1213
	DD	OFFSET $L1210
	DD	OFFSET $L1211
	DD	OFFSET $L1216
	DD	OFFSET $L1217
	DD	OFFSET $L1214
	DD	OFFSET $L1215
$L1190:
; Line 2447
	jmp	$L1238
$L1086:
; Line 2448
	cmp	DWORD PTR _code$[ebp], 42		; 0000002aH
	jne	$L1239
	cmp	DWORD PTR _const_arg0$[ebp], 0
	je	$L1239
	mov	eax, DWORD PTR _const_arg0$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1239
; Line 2449
	mov	eax, DWORD PTR _const_arg0$[ebp]
	cmp	DWORD PTR [eax+4], 1
	sbb	eax, eax
	and	eax, 1
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+8]
	jmp	$L998
; Line 2450
	jmp	$L1240
$L1239:
; Line 2451
	cmp	DWORD PTR _code$[ebp], 42		; 0000002aH
	jne	$L1241
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR _cc0_rtx
	cmp	DWORD PTR [eax+4], ecx
	jne	$L1241
	cmp	DWORD PTR _prev_insn_explicit_cc0$S432, 0
	je	$L1241
; Line 2452
	mov	eax, DWORD PTR _prev_insn_explicit_cc0$S432
	cmp	DWORD PTR [eax+4], 1
	sbb	eax, eax
	and	eax, 1
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+8]
	jmp	$L998
; Line 2453
	jmp	$L1242
$L1241:
	cmp	DWORD PTR _code$[ebp], 89		; 00000059H
	je	$L1244
	cmp	DWORD PTR _code$[ebp], 90		; 0000005aH
	jne	$L1243
$L1244:
; Line 2458
	cmp	DWORD PTR _const_arg0$[ebp], 0
	je	$L1245
	cmp	DWORD PTR _const_arg1$[ebp], 0
	je	$L1245
	cmp	DWORD PTR _const_arg2$[ebp], 0
	je	$L1245
	mov	eax, DWORD PTR _const_arg0$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1245
	mov	eax, DWORD PTR _const_arg1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1245
	mov	eax, DWORD PTR _const_arg2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1245
; Line 2461
	mov	eax, DWORD PTR _const_arg0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _val$[ebp], eax
; Line 2466
	mov	eax, DWORD PTR _const_arg2$[ebp]
	mov	cl, BYTE PTR [eax+4]
	sar	DWORD PTR _val$[ebp], cl
; Line 2468
	mov	eax, DWORD PTR _const_arg1$[ebp]
	cmp	DWORD PTR [eax+4], 32			; 00000020H
	je	$L1246
; Line 2471
	mov	eax, 1
	mov	ecx, DWORD PTR _const_arg1$[ebp]
	mov	cl, BYTE PTR [ecx+4]
	shl	eax, cl
	dec	eax
	and	DWORD PTR _val$[ebp], eax
; Line 2474
	cmp	DWORD PTR _code$[ebp], 89		; 00000059H
	jne	$L1247
	mov	eax, 1
	mov	ecx, DWORD PTR _const_arg1$[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	dec	ecx
	shl	eax, cl
	test	eax, DWORD PTR _val$[ebp]
	je	$L1247
; Line 2475
	mov	eax, 1
	mov	ecx, DWORD PTR _const_arg1$[ebp]
	mov	cl, BYTE PTR [ecx+4]
	shl	eax, cl
	not	eax
	or	DWORD PTR _val$[ebp], eax
; Line 2476
$L1247:
; Line 2477
$L1246:
; Line 2478
	jmp	$L1248
$L1245:
; Line 2479
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L998
$L1248:
; Line 2481
	jmp	$L1249
$L1243:
; Line 2482
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L998
$L1249:
$L1242:
$L1240:
$L1238:
$L1085:
; Line 2488
	cmp	DWORD PTR _width$[ebp], 32		; 00000020H
	jge	$L1250
	cmp	DWORD PTR _width$[ebp], 0
	jle	$L1250
; Line 2491
	mov	eax, -1
	mov	ecx, DWORD PTR _width$[ebp]
	dec	ecx
	shl	eax, cl
	and	eax, DWORD PTR _val$[ebp]
	mov	edx, -1
	mov	ecx, DWORD PTR _width$[ebp]
	dec	ecx
	shl	edx, cl
	cmp	eax, edx
	je	$L1251
; Line 2492
	mov	eax, 1
	mov	cl, BYTE PTR _width$[ebp]
	shl	eax, cl
	dec	eax
	and	DWORD PTR _val$[ebp], eax
; Line 2493
$L1251:
; Line 2496
$L1250:
; Line 2497
	mov	eax, DWORD PTR _val$[ebp]
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _new$1252[ebp], eax
; Line 2498
	mov	eax, DWORD PTR _new$1252[ebp]
	jmp	$L998
; Line 2500
$L998:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_fold_rtx ENDP
_x$ = 8
_tem1$ = -4
_value$1262 = -8
_equiv_constant PROC NEAR
; Line 2508
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 2511
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1257
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1257
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1257
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1257
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2031616				; 001f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1256
$L1257:
; Line 2512
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L1254
; Line 2513
	jmp	$L1258
$L1256:
; Line 2516
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1259
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg_qty$S435
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _qty_const$S429
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _tem1$[ebp], eax
	cmp	DWORD PTR _tem1$[ebp], 0
	je	$L1259
	mov	eax, DWORD PTR _tem1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1259
	mov	eax, DWORD PTR _tem1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1259
; Line 2517
	mov	eax, DWORD PTR _tem1$[ebp]
	jmp	$L1254
; Line 2520
	jmp	$L1260
$L1259:
; Line 2526
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1261
	mov	eax, DWORD PTR _x$[ebp]
	cmp	DWORD PTR [eax+8], 0
	jne	$L1261
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg_qty$S435
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _qty_const$S429
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _tem1$[ebp], eax
	cmp	DWORD PTR _tem1$[ebp], 0
	je	$L1261
	mov	eax, DWORD PTR _tem1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1261
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	cmp	DWORD PTR _mode_size[eax], 32		; 00000020H
	jg	$L1261
	mov	eax, DWORD PTR _x$[ebp]
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
	jle	$L1261
; Line 2528
	mov	eax, DWORD PTR _tem1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _value$1262[ebp], eax
; Line 2529
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	and	eax, 536870911				; 1fffffffH
	mov	ecx, 4
	and	ecx, 536870911				; 1fffffffH
	cmp	eax, ecx
	je	$L1263
; Line 2530
	mov	eax, 1
	mov	ecx, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR [ecx]
	shl	ecx, 8
	and	ecx, -12582913				; ff3fffffH
	sar	ecx, 22					; 00000016H
	mov	ecx, DWORD PTR _mode_size[ecx]
	shl	ecx, 3
	shl	eax, cl
	dec	eax
	and	DWORD PTR _value$1262[ebp], eax
; Line 2532
$L1263:
	mov	eax, DWORD PTR _tem1$[ebp]
	mov	ecx, DWORD PTR _value$1262[ebp]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L1264
; Line 2533
	mov	eax, DWORD PTR _tem1$[ebp]
	jmp	$L1254
; Line 2534
	jmp	$L1265
$L1264:
; Line 2535
	mov	eax, DWORD PTR _value$1262[ebp]
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	jmp	$L1254
$L1265:
; Line 2537
$L1261:
$L1260:
$L1258:
	sub	eax, eax
	jmp	$L1254
; Line 2538
$L1254:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_equiv_constant ENDP
_TEXT	ENDS
_DATA	SEGMENT
$SG1290	DB	'floating point trap in constant folding', 00H
_DATA	ENDS
_TEXT	SEGMENT
_u0$1285 = -40
_u1$1286 = -116
_value$1287 = -108
_handler$1288 = -104
_width$1293 = -120
_y0$1297 = -136
_u0$1298 = -132
_s0$1299 = -128
_m$1300 = -124
_width$1309 = -140
_mode$ = 8
_x$ = 12
_y0$1270 = -16
_y1$1271 = -28
_u0$1272 = -12
_u1$1273 = -24
_s0$1274 = -8
_s1$1275 = -20
_m$1276 = -4
_tem$1277 = -32
_fold_cc0 PROC NEAR
; Line 2552
	push	ebp
	mov	ebp, esp
	sub	esp, 156				; 0000009cH
	push	ebx
	push	esi
	push	edi
; Line 2553
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2818048				; 002b0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1269
; Line 2555
	push	0
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_fold_rtx
	add	esp, 8
	mov	DWORD PTR _y0$1270[ebp], eax
; Line 2556
	push	0
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_fold_rtx
	add	esp, 8
	mov	DWORD PTR _y1$1271[ebp], eax
; Line 2561
	mov	eax, DWORD PTR _y0$1270[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	mov	DWORD PTR _m$1276[ebp], eax
; Line 2562
	cmp	DWORD PTR _m$1276[ebp], 0
	jne	$L1278
; Line 2563
	mov	eax, DWORD PTR _y1$1271[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	mov	DWORD PTR _m$1276[ebp], eax
; Line 2564
$L1278:
	cmp	DWORD PTR _m$1276[ebp], 0
	jne	$L1279
; Line 2565
	sub	eax, eax
	jmp	$L1268
; Line 2567
$L1279:
	mov	eax, DWORD PTR _y0$1270[ebp]
	push	eax
	call	_equiv_constant
	add	esp, 4
	mov	DWORD PTR _tem$1277[ebp], eax
; Line 2568
	cmp	DWORD PTR _tem$1277[ebp], 0
	je	$L1280
; Line 2569
	mov	eax, DWORD PTR _tem$1277[ebp]
	mov	DWORD PTR _y0$1270[ebp], eax
; Line 2571
$L1280:
	cmp	DWORD PTR _y0$1270[ebp], 0
	jne	$L1281
; Line 2572
	sub	eax, eax
	jmp	$L1268
; Line 2574
$L1281:
	mov	eax, DWORD PTR _y1$1271[ebp]
	push	eax
	call	_equiv_constant
	add	esp, 4
	mov	DWORD PTR _tem$1277[ebp], eax
; Line 2575
	cmp	DWORD PTR _tem$1277[ebp], 0
	je	$L1282
; Line 2576
	mov	eax, DWORD PTR _tem$1277[ebp]
	mov	DWORD PTR _y1$1271[ebp], eax
; Line 2578
$L1282:
	cmp	DWORD PTR _y1$1271[ebp], 0
	jne	$L1283
; Line 2579
	sub	eax, eax
	jmp	$L1268
; Line 2583
$L1283:
; Line 2585
	mov	eax, DWORD PTR _y0$1270[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2031616				; 001f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1284
	mov	eax, DWORD PTR _y1$1271[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2031616				; 001f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1284
	mov	eax, DWORD PTR _y0$1270[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	cmp	DWORD PTR _mode_class[eax], 2
	jne	$L1284
; Line 2591
	lea	eax, DWORD PTR _handler$1288[ebp]
	push	eax
	call	__setjmp
	add	esp, 4
	or	eax, eax
	je	$L1289
; Line 2593
	push	OFFSET $SG1290
	call	_warning
	add	esp, 4
; Line 2594
	sub	eax, eax
	jmp	$L1268
; Line 2596
$L1289:
	lea	eax, DWORD PTR _handler$1288[ebp]
	push	eax
	call	_set_float_handler
	add	esp, 4
; Line 2597
	push	8
	mov	eax, DWORD PTR _y0$1270[ebp]
	add	eax, 12					; 0000000cH
	push	eax
	lea	eax, DWORD PTR _u0$1285[ebp]
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
; Line 2598
	push	8
	mov	eax, DWORD PTR _y1$1271[ebp]
	add	eax, 12					; 0000000cH
	push	eax
	lea	eax, DWORD PTR _u1$1286[ebp]
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
; Line 2600
	fld	QWORD PTR _u0$1285[ebp]
	fcomp	QWORD PTR _u1$1286[ebp]
	fnstsw	ax
	test	ah, 1
	jne	$L1746
	sub	ecx, ecx
	fld	QWORD PTR _u1$1286[ebp]
	fcomp	QWORD PTR _u0$1285[ebp]
	fnstsw	ax
	test	ah, 1
	je	$L1754
	mov	ecx, 8
$L1754:
	mov	DWORD PTR -144+[ebp], ecx
	jmp	$L1747
$L1746:
	mov	DWORD PTR -144+[ebp], 56		; 00000038H
$L1747:
	mov	eax, DWORD PTR -144+[ebp]
	add	eax, 64					; 00000040H
	mov	DWORD PTR _value$1287[ebp], eax
; Line 2601
	push	0
	call	_set_float_handler
	add	esp, 4
; Line 2602
	mov	eax, DWORD PTR _value$1287[ebp]
	jmp	$L1268
; Line 2607
$L1284:
	mov	eax, DWORD PTR _y0$1270[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1291
; Line 2608
	sub	eax, eax
	jmp	$L1268
; Line 2610
$L1291:
	mov	eax, DWORD PTR _y1$1271[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1292
; Line 2611
	sub	eax, eax
	jmp	$L1268
; Line 2613
$L1292:
	mov	eax, DWORD PTR _y0$1270[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _u0$1272[ebp], eax
	mov	eax, DWORD PTR _u0$1272[ebp]
	mov	DWORD PTR _s0$1274[ebp], eax
; Line 2614
	mov	eax, DWORD PTR _y1$1271[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _u1$1273[ebp], eax
	mov	eax, DWORD PTR _u1$1273[ebp]
	mov	DWORD PTR _s1$1275[ebp], eax
; Line 2617
	mov	eax, DWORD PTR _m$1276[ebp]
	mov	eax, DWORD PTR _mode_size[eax*4]
	shl	eax, 3
	mov	DWORD PTR _width$1293[ebp], eax
; Line 2618
	cmp	DWORD PTR _width$1293[ebp], 32		; 00000020H
	jge	$L1294
; Line 2620
	mov	eax, -1
	mov	cl, BYTE PTR _width$1293[ebp]
	shl	eax, cl
	not	eax
	and	DWORD PTR _u0$1272[ebp], eax
	mov	eax, DWORD PTR _u0$1272[ebp]
	mov	DWORD PTR _s0$1274[ebp], eax
; Line 2621
	mov	eax, -1
	mov	cl, BYTE PTR _width$1293[ebp]
	shl	eax, cl
	not	eax
	and	DWORD PTR _u1$1273[ebp], eax
	mov	eax, DWORD PTR _u1$1273[ebp]
	mov	DWORD PTR _s1$1275[ebp], eax
; Line 2622
	mov	eax, 1
	mov	ecx, DWORD PTR _width$1293[ebp]
	dec	ecx
	shl	eax, cl
	test	eax, DWORD PTR _u0$1272[ebp]
	je	$L1295
; Line 2623
	mov	eax, -1
	mov	cl, BYTE PTR _width$1293[ebp]
	shl	eax, cl
	or	DWORD PTR _s0$1274[ebp], eax
; Line 2624
$L1295:
	mov	eax, 1
	mov	ecx, DWORD PTR _width$1293[ebp]
	dec	ecx
	shl	eax, cl
	test	eax, DWORD PTR _u1$1273[ebp]
	je	$L1296
; Line 2625
	mov	eax, -1
	mov	cl, BYTE PTR _width$1293[ebp]
	shl	eax, cl
	or	DWORD PTR _s1$1275[ebp], eax
; Line 2626
$L1296:
; Line 2627
$L1294:
; Line 2631
	mov	eax, DWORD PTR _s0$1274[ebp]
	cmp	DWORD PTR _s1$1275[ebp], eax
	jg	$L1748
	mov	eax, DWORD PTR _s0$1274[ebp]
	cmp	DWORD PTR _s1$1275[ebp], eax
	mov	eax, 0
	setl	al
	mov	DWORD PTR -148+[ebp], eax
	jmp	$L1749
$L1748:
	mov	DWORD PTR -148+[ebp], 7
$L1749:
	mov	eax, DWORD PTR _u0$1272[ebp]
	cmp	DWORD PTR _u1$1273[ebp], eax
	ja	$L1750
	mov	eax, DWORD PTR _u0$1272[ebp]
	cmp	DWORD PTR _u1$1273[ebp], eax
	mov	eax, 0
	setb	al
	mov	DWORD PTR -152+[ebp], eax
	jmp	$L1751
$L1750:
	mov	DWORD PTR -152+[ebp], 7
$L1751:
	mov	eax, DWORD PTR -148+[ebp]
	mov	ecx, DWORD PTR -152+[ebp]
	lea	eax, DWORD PTR [ecx+eax*8+64]
	jmp	$L1268
; Line 2633
$L1269:
; Line 2638
	push	0
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_fold_rtx
	add	esp, 8
	mov	DWORD PTR _y0$1297[ebp], eax
; Line 2640
	mov	eax, DWORD PTR _y0$1297[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	mov	DWORD PTR _m$1300[ebp], eax
; Line 2641
	cmp	DWORD PTR _m$1300[ebp], 0
	jne	$L1301
; Line 2642
	mov	eax, DWORD PTR _mode$[ebp]
	mov	DWORD PTR _m$1300[ebp], eax
; Line 2644
$L1301:
	mov	eax, DWORD PTR _y0$1297[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1302
; Line 2645
	mov	eax, DWORD PTR _y0$1297[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg_qty$S435
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _qty_const$S429
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _y0$1297[ebp], eax
; Line 2648
$L1302:
	cmp	DWORD PTR _y0$1297[ebp], 0
	jne	$L1303
; Line 2649
	sub	eax, eax
	jmp	$L1268
; Line 2652
$L1303:
	cmp	DWORD PTR _m$1300[ebp], 0
	jne	$L1304
; Line 2653
	sub	eax, eax
	jmp	$L1268
; Line 2657
$L1304:
; Line 2659
	mov	eax, DWORD PTR _y0$1297[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1307
	mov	eax, DWORD PTR _y0$1297[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1307
	mov	eax, DWORD PTR _y0$1297[ebp]
	mov	ecx, DWORD PTR _frame_pointer_rtx
	cmp	DWORD PTR [eax+4], ecx
	je	$L1306
	mov	eax, DWORD PTR _y0$1297[ebp]
	mov	ecx, DWORD PTR _arg_pointer_rtx
	cmp	DWORD PTR [eax+4], ecx
	je	$L1306
$L1307:
	mov	eax, DWORD PTR _y0$1297[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1306
	mov	eax, DWORD PTR _y0$1297[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1306
	mov	eax, DWORD PTR _y0$1297[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1305
$L1306:
; Line 2660
	mov	eax, 201				; 000000c9H
	jmp	$L1268
; Line 2663
$L1305:
	mov	eax, DWORD PTR _y0$1297[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1308
; Line 2664
	sub	eax, eax
	jmp	$L1268
; Line 2666
$L1308:
	mov	eax, DWORD PTR _y0$1297[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _u0$1298[ebp], eax
	mov	eax, DWORD PTR _u0$1298[ebp]
	mov	DWORD PTR _s0$1299[ebp], eax
; Line 2668
	mov	eax, DWORD PTR _m$1300[ebp]
	mov	eax, DWORD PTR _mode_size[eax*4]
	shl	eax, 3
	mov	DWORD PTR _width$1309[ebp], eax
; Line 2669
	cmp	DWORD PTR _width$1309[ebp], 32		; 00000020H
	jge	$L1310
; Line 2671
	mov	eax, -1
	mov	ecx, DWORD PTR _m$1300[ebp]
	mov	ecx, DWORD PTR _mode_size[ecx*4]
	shl	ecx, 3
	shl	eax, cl
	not	eax
	and	DWORD PTR _u0$1298[ebp], eax
	mov	eax, DWORD PTR _u0$1298[ebp]
	mov	DWORD PTR _s0$1299[ebp], eax
; Line 2672
	mov	eax, 1
	mov	ecx, DWORD PTR _m$1300[ebp]
	mov	ecx, DWORD PTR _mode_size[ecx*4]
	shl	ecx, 3
	dec	ecx
	shl	eax, cl
	test	eax, DWORD PTR _u0$1298[ebp]
	je	$L1311
; Line 2673
	mov	eax, -1
	mov	ecx, DWORD PTR _m$1300[ebp]
	mov	ecx, DWORD PTR _mode_size[ecx*4]
	shl	ecx, 3
	shl	eax, cl
	or	DWORD PTR _s0$1299[ebp], eax
; Line 2674
$L1311:
; Line 2675
$L1310:
; Line 2676
	cmp	DWORD PTR _s0$1299[ebp], 0
	jl	$L1752
	cmp	DWORD PTR _s0$1299[ebp], 0
	mov	eax, 0
	setg	al
	mov	DWORD PTR -156+[ebp], eax
	jmp	$L1753
$L1752:
	mov	DWORD PTR -156+[ebp], 7
$L1753:
	cmp	DWORD PTR _u0$1298[ebp], 1
	sbb	eax, eax
	mov	ecx, DWORD PTR -156+[ebp]
	lea	eax, DWORD PTR [eax+ecx*8+65]
	jmp	$L1268
; Line 2678
$L1268:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_fold_cc0 ENDP
_TEXT	ENDS
EXTRN	_delete_insn:NEAR
EXTRN	_emit_label_after:NEAR
EXTRN	_pc_rtx:DWORD
EXTRN	_redirect_jump:NEAR
EXTRN	_gen_label_rtx:NEAR
EXTRN	_simplejump_p:NEAR
_TEXT	SEGMENT
_target$1346 = -24
_label$1354 = -28
_insn$ = 8
_jump$ = -16
_p$ = -12
_loop_top_label$ = -20
_disposition$ = -4
_count$ = -8
_predecide_loop_entry PROC NEAR
; Line 2687
	push	ebp
	mov	ebp, esp
	sub	esp, 28					; 0000001cH
	push	ebx
	push	esi
	push	edi
; Line 2688
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _jump$[ebp], eax
; Line 2690
	mov	eax, DWORD PTR _jump$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _loop_top_label$[ebp], eax
; Line 2691
	mov	DWORD PTR _disposition$[ebp], 0
; Line 2692
	mov	DWORD PTR _count$[ebp], 0
; Line 2695
	mov	eax, DWORD PTR _jump$[ebp]
	push	eax
	call	_simplejump_p
	add	esp, 4
	or	eax, eax
	jne	$L1325
; Line 2696
	jmp	$L1314
; Line 2699
$L1325:
; Line 2700
$L1327:
	mov	eax, DWORD PTR _loop_top_label$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1048576				; 00100000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1329
	mov	eax, DWORD PTR _loop_top_label$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1179648				; 00120000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1328
$L1329:
; Line 2702
	mov	eax, DWORD PTR _loop_top_label$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _loop_top_label$[ebp], eax
; Line 2704
	cmp	DWORD PTR _loop_top_label$[ebp], 0
	jne	$L1330
; Line 2705
	jmp	$L1314
; Line 2706
$L1330:
	jmp	$L1327
$L1328:
; Line 2707
	mov	eax, DWORD PTR _loop_top_label$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1114112				; 00110000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1331
; Line 2708
	call	_abort
; Line 2711
$L1331:
	mov	eax, DWORD PTR _jump$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _p$[ebp], eax
; Line 2712
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1114112				; 00110000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1332
; Line 2713
	call	_abort
; Line 2717
$L1332:
	mov	DWORD PTR _prev_insn_cc0$S431, 0
; Line 2718
	mov	DWORD PTR _prev_insn_explicit_cc0$S432, 0
; Line 2720
$L1334:
	cmp	DWORD PTR _count$[ebp], 10		; 0000000aH
	jge	$L1335
; Line 2725
	cmp	DWORD PTR _p$[ebp], 0
	jne	$L1336
; Line 2726
	jmp	$L1335
; Line 2728
$L1336:
; Line 2729
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1179648				; 00120000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1337
	mov	eax, DWORD PTR _p$[ebp]
	cmp	DWORD PTR [eax+20], -5			; fffffffbH
	jne	$L1337
; Line 2731
	mov	DWORD PTR _disposition$[ebp], 1
; Line 2732
	jmp	$L1335
; Line 2734
	jmp	$L1338
$L1337:
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1114112				; 00110000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1340
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1179648				; 00120000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1339
$L1340:
; Line 2738
	jmp	$L1341
$L1339:
; Line 2739
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 851968				; 000d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1342
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1342
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _cc0_rtx
	cmp	DWORD PTR [eax+4], ecx
	jne	$L1342
; Line 2742
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_copy_rtx
	add	esp, 4
	push	eax
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	call	_fold_cc0
	add	esp, 8
	mov	DWORD PTR _prev_insn_cc0$S431, eax
; Line 2743
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1343
; Line 2744
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _prev_insn_explicit_cc0$S432, eax
; Line 2745
$L1343:
; Line 2746
	jmp	$L1344
$L1342:
; Line 2748
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 917504				; 000e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1345
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1345
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _pc_rtx
	cmp	DWORD PTR [eax+4], ecx
	jne	$L1345
; Line 2751
	push	1
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_fold_rtx
	add	esp, 8
	mov	DWORD PTR _target$1346[ebp], eax
; Line 2752
	mov	eax, DWORD PTR _target$1346[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1347
; Line 2753
	mov	eax, DWORD PTR _target$1346[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _p$[ebp], eax
; Line 2754
	jmp	$L1348
$L1347:
	mov	eax, DWORD PTR _pc_rtx
	cmp	DWORD PTR _target$1346[ebp], eax
	je	$L1349
; Line 2756
	jmp	$L1335
; Line 2757
$L1349:
$L1348:
	inc	DWORD PTR _count$[ebp]
; Line 2761
	jmp	$L1350
$L1345:
; Line 2762
	jmp	$L1335
$L1350:
$L1344:
$L1341:
$L1338:
; Line 2767
	mov	eax, DWORD PTR _p$[ebp]
	cmp	DWORD PTR _loop_top_label$[ebp], eax
	jne	$L1351
; Line 2769
	mov	DWORD PTR _disposition$[ebp], 2
; Line 2770
	jmp	$L1335
; Line 2773
$L1351:
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _p$[ebp], eax
; Line 2774
	jmp	$L1334
$L1335:
; Line 2775
	cmp	DWORD PTR _disposition$[ebp], 2
	jne	$L1352
; Line 2780
	mov	eax, DWORD PTR _jump$[ebp]
	push	eax
	call	_delete_insn
	add	esp, 4
; Line 2782
$L1352:
	cmp	DWORD PTR _disposition$[ebp], 1
	jne	$L1353
; Line 2789
	call	_gen_label_rtx
	mov	DWORD PTR _label$1354[ebp], eax
; Line 2790
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	mov	eax, DWORD PTR _label$1354[ebp]
	push	eax
	call	_emit_label_after
	add	esp, 8
; Line 2791
	mov	eax, DWORD PTR _label$1354[ebp]
	push	eax
	mov	eax, DWORD PTR _jump$[ebp]
	push	eax
	call	_redirect_jump
	add	esp, 8
; Line 2793
$L1353:
$L1314:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_predecide_loop_entry ENDP
_TEXT	ENDS
EXTRN	_flag_float_store:DWORD
EXTRN	_find_reg_note:NEAR
EXTRN	_alloca:NEAR
EXTRN	_rtx_equal_p:NEAR
EXTRN	_general_operand:NEAR
EXTRN	_emit_barrier_after:NEAR
_BSS	SEGMENT
_cse_skip_to_next_block$S443 DD 01H DUP (?)
_cse_jumps_altered$S447 DD 01H DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
_src$1413 = -80
_dest$1414 = -76
_elt$1415 = -72
_mode$1416 = -68
_elt$1545 = -160
_addr$1481 = -112
_hash$1482 = -116
_tem$1418 = -84
_insn$ = 8
_eqvmode$1423 = -88
_dest$1553 = -168
_x$ = -32
_elt$1554 = -164
_i$ = -48
_n_sets$ = -20
_this_insn_cc0$ = -12
_this_insn_explicit_cc0$ = -16
_writes_memory$ = -8
_src_eqv$ = -40
_temp$1434 = -92
_src_eqv_elt$ = -28
_width$1499 = -120
_src_eqv_in_memory$ = -36
_prev$1564 = -172
_value$1500 = -124
_src_eqv_in_struct$ = -4
_src_eqv_hash_code$ = -24
_y$1438 = -96
_sets$ = -44
_tem$1376 = -52
_dest$1569 = -180
_note$1570 = -176
_elt$1511 = -132
_dest$1512 = -136
_eqvmode$1513 = -128
_label$1578 = -184
_lim$1387 = -56
_newsrc$1454 = -100
_y$1391 = -60
_oldsrc$1457 = -104
_src$1523 = -152
_dest$1524 = -148
_y$1396 = -64
_elt$1525 = -144
_mode$1526 = -140
_note$1467 = -108
_dest$1532 = -156
_cse_insn PROC NEAR
; Line 2831
	push	ebp
	mov	ebp, esp
	sub	esp, 196				; 000000c4H
	push	ebx
	push	esi
	push	edi
; Line 2832
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _x$[ebp], eax
; Line 2834
	mov	DWORD PTR _n_sets$[ebp], 0
; Line 2838
	mov	DWORD PTR _this_insn_cc0$[ebp], 0
; Line 2840
	mov	DWORD PTR _this_insn_explicit_cc0$[ebp], 0
; Line 2844
	mov	DWORD PTR _src_eqv$[ebp], 0
; Line 2845
	mov	DWORD PTR _src_eqv_elt$[ebp], 0
; Line 2852
	mov	eax, DWORD PTR _insn$[ebp]
	mov	DWORD PTR _this_insn$S434, eax
; Line 2853
	mov	eax, DWORD PTR _?init@?1??cse_insn@@9@9$S1368
	mov	DWORD PTR _writes_memory$[ebp], eax
; Line 2860
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1375
; Line 2863
	mov	DWORD PTR _n_sets$[ebp], 1
; Line 2864
	push	32					; 00000020H
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _sets$[ebp], eax
; Line 2865
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR _sets$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 2867
	mov	eax, DWORD PTR _insn$[ebp]
	cmp	DWORD PTR [eax+28], 0
	je	$L1378
; Line 2870
	push	0
	push	3
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_find_reg_note
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _tem$1376[ebp], eax
; Line 2871
	cmp	DWORD PTR _tem$1376[ebp], 0
	jne	$L1379
; Line 2872
	push	0
	push	5
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_find_reg_note
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _tem$1376[ebp], eax
; Line 2873
$L1379:
	cmp	DWORD PTR _tem$1376[ebp], 0
	je	$L1380
	mov	eax, DWORD PTR _tem$1376[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _src_eqv$[ebp], eax
; Line 2877
$L1380:
	cmp	DWORD PTR _src_eqv$[ebp], 0
	je	$L1382
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _src_eqv$[ebp]
	push	eax
	call	_rtx_equal_p
	add	esp, 8
	or	eax, eax
	je	$L1382
; Line 2878
	mov	DWORD PTR _src_eqv$[ebp], 0
; Line 2879
$L1382:
; Line 2888
$L1378:
; Line 2889
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR _pc_rtx
	cmp	DWORD PTR [eax+4], ecx
	jne	$L1383
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1383
; Line 2890
	jmp	$L1360
; Line 2895
$L1383:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1835008				; 001c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1384
; Line 2897
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_canon_reg
	add	esp, 4
; Line 2898
	jmp	$L1360
; Line 2900
$L1384:
; Line 2901
	jmp	$L1385
$L1375:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1310720				; 00140000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1386
; Line 2903
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _lim$1387[ebp], eax
; Line 2905
	mov	eax, DWORD PTR _lim$1387[ebp]
	shl	eax, 5
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _sets$[ebp], eax
; Line 2914
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L1388
$L1389:
	inc	DWORD PTR _i$[ebp]
$L1388:
	mov	eax, DWORD PTR _lim$1387[ebp]
	cmp	DWORD PTR _i$[ebp], eax
	jge	$L1390
; Line 2916
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	mov	DWORD PTR _y$1391[ebp], eax
; Line 2917
	mov	eax, DWORD PTR _y$1391[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1769472				; 001b0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1392
	mov	eax, DWORD PTR _y$1391[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1392
; Line 2918
	mov	eax, DWORD PTR _y$1391[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_invalidate
	add	esp, 4
; Line 2919
$L1392:
	jmp	$L1389
$L1390:
; Line 2921
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L1393
$L1394:
	inc	DWORD PTR _i$[ebp]
$L1393:
	mov	eax, DWORD PTR _lim$1387[ebp]
	cmp	DWORD PTR _i$[ebp], eax
	jge	$L1395
; Line 2923
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	mov	DWORD PTR _y$1396[ebp], eax
; Line 2924
	mov	eax, DWORD PTR _y$1396[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1397
; Line 2925
	mov	eax, DWORD PTR _y$1396[ebp]
	mov	ecx, DWORD PTR _n_sets$[ebp]
	shl	ecx, 5
	mov	edx, DWORD PTR _sets$[ebp]
	mov	DWORD PTR [ecx+edx], eax
	inc	DWORD PTR _n_sets$[ebp]
; Line 2926
	jmp	$L1398
$L1397:
	mov	eax, DWORD PTR _y$1396[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1769472				; 001b0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1399
; Line 2932
	mov	eax, DWORD PTR _y$1396[ebp]
	push	eax
	call	_canon_reg
	add	esp, 4
; Line 2933
	lea	eax, DWORD PTR _writes_memory$[ebp]
	push	eax
	mov	eax, DWORD PTR _y$1396[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_note_mem_written
	add	esp, 8
; Line 2935
	jmp	$L1400
$L1399:
; Line 2937
	mov	eax, DWORD PTR _y$1396[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1703936				; 001a0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1401
	mov	eax, DWORD PTR _y$1396[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1402
	mov	eax, DWORD PTR _y$1396[ebp]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L1401
$L1402:
; Line 2938
	mov	eax, DWORD PTR _y$1396[ebp]
	push	eax
	call	_canon_reg
	add	esp, 4
; Line 2939
	jmp	$L1403
$L1401:
	mov	eax, DWORD PTR _y$1396[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1835008				; 001c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1404
; Line 2940
	mov	eax, DWORD PTR _y$1396[ebp]
	push	eax
	call	_canon_reg
	add	esp, 4
; Line 2941
$L1404:
$L1403:
$L1400:
$L1398:
	jmp	$L1394
$L1395:
; Line 2943
	jmp	$L1405
$L1386:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1769472				; 001b0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1406
; Line 2944
	lea	eax, DWORD PTR _writes_memory$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_note_mem_written
	add	esp, 8
; Line 2945
	jmp	$L1407
$L1406:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1835008				; 001c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1408
; Line 2946
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_canon_reg
	add	esp, 4
; Line 2948
$L1408:
$L1407:
$L1405:
$L1385:
	cmp	DWORD PTR _n_sets$[ebp], 0
	jne	$L1409
; Line 2950
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	lea	eax, DWORD PTR _writes_memory$[ebp]
	push	eax
	call	_invalidate_from_clobbers
	add	esp, 8
; Line 2951
	jmp	$L1360
; Line 2962
$L1409:
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L1410
$L1411:
	inc	DWORD PTR _i$[ebp]
$L1410:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _n_sets$[ebp], eax
	jle	$L1412
; Line 2968
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sets$[ebp]
	mov	eax, DWORD PTR [eax+ecx]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _dest$1414[ebp], eax
; Line 2969
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sets$[ebp]
	mov	eax, DWORD PTR [eax+ecx]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _src$1413[ebp], eax
; Line 2975
	mov	eax, DWORD PTR _src$1413[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sub	ecx, ecx
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1755
	mov	eax, DWORD PTR _dest$1414[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	mov	DWORD PTR _mode$1416[ebp], eax
	jmp	$L1756
$L1755:
	mov	eax, DWORD PTR _src$1413[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	mov	DWORD PTR _mode$1416[ebp], eax
$L1756:
; Line 2976
	mov	eax, DWORD PTR _mode$1416[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	shl	ecx, 5
	mov	edx, DWORD PTR _sets$[ebp]
	mov	DWORD PTR [ecx+edx+28], eax
; Line 2981
	mov	eax, DWORD PTR _dest$1414[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1417
; Line 2983
	mov	eax, DWORD PTR _dest$1414[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg_qty$S435
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _tem$1418[ebp], eax
; Line 2984
	mov	eax, DWORD PTR _dest$1414[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _dest$1414[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	mov	edx, DWORD PTR _reg_qty$S435
	mov	DWORD PTR [edx+ecx*4], eax
; Line 2985
	mov	eax, DWORD PTR _src$1413[ebp]
	push	eax
	call	_canon_reg
	add	esp, 4
	mov	DWORD PTR _src$1413[ebp], eax
; Line 2987
	cmp	DWORD PTR _src_eqv$[ebp], 0
	je	$L1419
; Line 2988
	mov	eax, DWORD PTR _src_eqv$[ebp]
	push	eax
	call	_canon_reg
	add	esp, 4
	mov	DWORD PTR _src_eqv$[ebp], eax
; Line 2990
$L1419:
	mov	eax, DWORD PTR _tem$1418[ebp]
	mov	ecx, DWORD PTR _dest$1414[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	mov	edx, DWORD PTR _reg_qty$S435
	mov	DWORD PTR [edx+ecx*4], eax
; Line 2992
	jmp	$L1420
$L1417:
; Line 2994
	mov	eax, DWORD PTR _src$1413[ebp]
	push	eax
	call	_canon_reg
	add	esp, 4
	mov	DWORD PTR _src$1413[ebp], eax
; Line 2996
	cmp	DWORD PTR _src_eqv$[ebp], 0
	je	$L1421
; Line 2997
	mov	eax, DWORD PTR _src_eqv$[ebp]
	push	eax
	call	_canon_reg
	add	esp, 4
	mov	DWORD PTR _src_eqv$[ebp], eax
; Line 2998
$L1421:
$L1420:
; Line 3000
	cmp	DWORD PTR _src_eqv$[ebp], 0
	je	$L1422
; Line 3002
	mov	eax, DWORD PTR _mode$1416[ebp]
	mov	DWORD PTR _eqvmode$1423[ebp], eax
; Line 3003
	mov	eax, DWORD PTR _dest$1414[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2359296				; 00240000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1424
; Line 3004
	mov	eax, DWORD PTR _dest$1414[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	mov	DWORD PTR _eqvmode$1423[ebp], eax
; Line 3005
$L1424:
	mov	DWORD PTR _do_not_record$S448, 0
; Line 3006
	mov	DWORD PTR _hash_arg_in_memory$S449, 0
; Line 3007
	mov	DWORD PTR _hash_arg_in_struct$S450, 0
; Line 3008
	push	0
	mov	eax, DWORD PTR _src_eqv$[ebp]
	push	eax
	call	_fold_rtx
	add	esp, 8
	mov	DWORD PTR _src_eqv$[ebp], eax
; Line 3009
	mov	eax, DWORD PTR _eqvmode$1423[ebp]
	push	eax
	mov	eax, DWORD PTR _src_eqv$[ebp]
	push	eax
	call	_canon_hash
	add	esp, 8
	mov	ecx, 31					; 0000001fH
	cdq
	idiv	ecx
	mov	DWORD PTR _src_eqv_hash_code$[ebp], edx
; Line 3013
	cmp	DWORD PTR _do_not_record$S448, 0
	jne	$L1425
; Line 3015
	mov	eax, DWORD PTR _eqvmode$1423[ebp]
	push	eax
	mov	eax, DWORD PTR _src_eqv_hash_code$[ebp]
	push	eax
	mov	eax, DWORD PTR _src_eqv$[ebp]
	push	eax
	call	_lookup
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _elt$1415[ebp], eax
; Line 3016
	cmp	DWORD PTR _elt$1415[ebp], 0
	je	$L1426
	mov	eax, DWORD PTR _elt$1415[ebp]
	mov	ecx, DWORD PTR _elt$1415[ebp]
	cmp	DWORD PTR [eax+20], ecx
	je	$L1426
; Line 3018
	mov	eax, DWORD PTR _elt$1415[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _elt$1415[ebp], eax
; Line 3022
$L1428:
	mov	eax, DWORD PTR _elt$1415[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1431
	push	1
	mov	eax, DWORD PTR _elt$1415[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	mov	eax, DWORD PTR _elt$1415[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_exp_equiv_p
	add	esp, 12					; 0000000cH
	or	eax, eax
	je	$L1430
$L1431:
	mov	eax, DWORD PTR _elt$1415[ebp]
	movsx	eax, BYTE PTR [eax+38]
	or	eax, eax
	je	$L1429
$L1430:
; Line 3023
	mov	eax, DWORD PTR _elt$1415[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _elt$1415[ebp], eax
	jmp	$L1428
$L1429:
; Line 3024
	mov	eax, DWORD PTR _elt$1415[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_copy_rtx
	add	esp, 4
	mov	DWORD PTR _src_eqv$[ebp], eax
; Line 3025
	mov	DWORD PTR _hash_arg_in_memory$S449, 0
; Line 3026
	mov	DWORD PTR _hash_arg_in_struct$S450, 0
; Line 3027
	mov	eax, DWORD PTR _elt$1415[ebp]
	mov	eax, DWORD PTR [eax+32]
	push	eax
	mov	eax, DWORD PTR _src_eqv$[ebp]
	push	eax
	call	_canon_hash
	add	esp, 8
	mov	ecx, 31					; 0000001fH
	cdq
	idiv	ecx
	mov	DWORD PTR _src_eqv_hash_code$[ebp], edx
; Line 3029
$L1426:
	mov	eax, DWORD PTR _elt$1415[ebp]
	mov	DWORD PTR _src_eqv_elt$[ebp], eax
; Line 3031
	jmp	$L1432
$L1425:
; Line 3032
	mov	DWORD PTR _src_eqv$[ebp], 0
$L1432:
; Line 3034
	mov	eax, DWORD PTR _hash_arg_in_memory$S449
	mov	DWORD PTR _src_eqv_in_memory$[ebp], eax
; Line 3035
	mov	eax, DWORD PTR _hash_arg_in_struct$S450
	mov	DWORD PTR _src_eqv_in_struct$[ebp], eax
; Line 3041
$L1422:
	mov	DWORD PTR _do_not_record$S448, 0
; Line 3042
	mov	DWORD PTR _hash_arg_in_memory$S449, 0
; Line 3043
	mov	DWORD PTR _hash_arg_in_struct$S450, 0
; Line 3044
	push	0
	mov	eax, DWORD PTR _src$1413[ebp]
	push	eax
	call	_fold_rtx
	add	esp, 8
	mov	DWORD PTR _src$1413[ebp], eax
; Line 3047
	mov	eax, DWORD PTR _src$1413[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1433
; Line 3049
	mov	eax, DWORD PTR _src$1413[ebp]
	push	eax
	call	_equiv_constant
	add	esp, 4
	mov	DWORD PTR _temp$1434[ebp], eax
; Line 3050
	cmp	DWORD PTR _temp$1434[ebp], 0
	je	$L1435
; Line 3051
	mov	eax, DWORD PTR _temp$1434[ebp]
	mov	DWORD PTR _src$1413[ebp], eax
; Line 3052
$L1435:
; Line 3055
$L1433:
	mov	eax, DWORD PTR _src$1413[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3670016				; 00380000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1437
	mov	eax, DWORD PTR _src$1413[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3014656				; 002e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1436
$L1437:
; Line 3057
	mov	eax, DWORD PTR _src$1413[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _src$1413[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_lookup_as_function
	add	esp, 8
	mov	DWORD PTR _y$1438[ebp], eax
; Line 3058
	cmp	DWORD PTR _y$1438[ebp], 0
	je	$L1439
; Line 3059
	mov	eax, DWORD PTR _y$1438[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_copy_rtx
	add	esp, 4
	mov	DWORD PTR _src$1413[ebp], eax
; Line 3060
$L1439:
; Line 3065
$L1436:
; Line 3067
	mov	eax, DWORD PTR _src$1413[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1440
	mov	eax, DWORD PTR _dest$1414[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1440
	mov	eax, DWORD PTR _dest$1414[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg_qty$S435
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _qty_const$S429
	mov	edx, DWORD PTR _const0_rtx
	cmp	DWORD PTR [ecx+eax*4], edx
	jne	$L1440
; Line 3070
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	mov	eax, DWORD PTR _dest$1414[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg_qty$S435
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _qty_const_insn$S430
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	push	4
	push	3
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 3072
$L1440:
	mov	eax, DWORD PTR _mode$1416[ebp]
	push	eax
	mov	eax, DWORD PTR _src$1413[ebp]
	push	eax
	call	_canon_hash
	add	esp, 8
	mov	ecx, 31					; 0000001fH
	cdq
	idiv	ecx
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sets$[ebp]
	mov	DWORD PTR [eax+ecx+8], edx
; Line 3074
	mov	al, BYTE PTR _do_not_record$S448
	mov	ecx, DWORD PTR _i$[ebp]
	shl	ecx, 5
	mov	edx, DWORD PTR _sets$[ebp]
	mov	BYTE PTR [ecx+edx+26], al
; Line 3094
	mov	eax, DWORD PTR _src$1413[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1441
	mov	eax, DWORD PTR _src$1413[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	ecx, DWORD PTR _src$1413[ebp]
	mov	ecx, DWORD PTR [ecx]
	shl	ecx, 8
	and	ecx, -16777216				; ff000000H
	sar	ecx, 22					; 00000016H
	mov	ecx, DWORD PTR _mode_size[ecx]
	cmp	DWORD PTR _mode_size[eax], ecx
	jge	$L1441
; Line 3095
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sets$[ebp]
	mov	BYTE PTR [eax+ecx+26], 1
; Line 3096
	jmp	$L1442
$L1441:
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sets$[ebp]
	movsx	eax, BYTE PTR [eax+ecx+26]
	or	eax, eax
	jne	$L1443
; Line 3100
	mov	eax, DWORD PTR _mode$1416[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sets$[ebp]
	mov	eax, DWORD PTR [eax+ecx+8]
	push	eax
	mov	eax, DWORD PTR _src$1413[ebp]
	push	eax
	call	_lookup
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _elt$1415[ebp], eax
; Line 3101
	cmp	DWORD PTR _elt$1415[ebp], 0
	je	$L1444
	mov	eax, DWORD PTR _elt$1415[ebp]
	mov	ecx, DWORD PTR _elt$1415[ebp]
	cmp	DWORD PTR [eax+20], ecx
	je	$L1444
; Line 3103
	mov	eax, DWORD PTR _elt$1415[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _elt$1415[ebp], eax
; Line 3107
$L1446:
	mov	eax, DWORD PTR _elt$1415[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1449
	push	1
	mov	eax, DWORD PTR _elt$1415[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	mov	eax, DWORD PTR _elt$1415[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_exp_equiv_p
	add	esp, 12					; 0000000cH
	or	eax, eax
	je	$L1448
$L1449:
	mov	eax, DWORD PTR _elt$1415[ebp]
	movsx	eax, BYTE PTR [eax+38]
	or	eax, eax
	je	$L1447
$L1448:
; Line 3108
	mov	eax, DWORD PTR _elt$1415[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _elt$1415[ebp], eax
	jmp	$L1446
$L1447:
; Line 3113
	push	0
	mov	eax, DWORD PTR _elt$1415[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	jne	$L1452
	mov	eax, DWORD PTR _dest$1414[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1451
$L1452:
; Line 3115
	mov	eax, DWORD PTR _elt$1415[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_copy_rtx
	add	esp, 4
	mov	DWORD PTR _src$1413[ebp], eax
; Line 3116
	mov	DWORD PTR _hash_arg_in_memory$S449, 0
; Line 3117
	mov	DWORD PTR _hash_arg_in_struct$S450, 0
; Line 3118
	mov	eax, DWORD PTR _elt$1415[ebp]
	mov	eax, DWORD PTR [eax+32]
	push	eax
	mov	eax, DWORD PTR _src$1413[ebp]
	push	eax
	call	_canon_hash
	add	esp, 8
	mov	ecx, 31					; 0000001fH
	cdq
	idiv	ecx
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sets$[ebp]
	mov	DWORD PTR [eax+ecx+8], edx
; Line 3120
$L1451:
; Line 3126
$L1444:
; Line 3127
	mov	eax, DWORD PTR _src$1413[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1453
	cmp	DWORD PTR _n_sets$[ebp], 1
	jne	$L1453
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sets$[ebp]
	mov	eax, DWORD PTR [eax+ecx]
	mov	ecx, DWORD PTR _cc0_rtx
	cmp	DWORD PTR [eax+4], ecx
	je	$L1453
; Line 3129
	mov	eax, DWORD PTR _elt$1415[ebp]
	push	eax
	mov	eax, DWORD PTR _src$1413[ebp]
	push	eax
	call	_use_related_value
	add	esp, 8
	mov	DWORD PTR _newsrc$1454[ebp], eax
; Line 3130
	cmp	DWORD PTR _newsrc$1454[ebp], 0
	jne	$L1455
	cmp	DWORD PTR _src_eqv$[ebp], 0
	je	$L1455
; Line 3131
	mov	eax, DWORD PTR _src_eqv_elt$[ebp]
	push	eax
	mov	eax, DWORD PTR _src_eqv$[ebp]
	push	eax
	call	_use_related_value
	add	esp, 8
	mov	DWORD PTR _newsrc$1454[ebp], eax
; Line 3132
$L1455:
	cmp	DWORD PTR _newsrc$1454[ebp], 0
	je	$L1456
; Line 3134
	mov	eax, DWORD PTR _src$1413[ebp]
	mov	DWORD PTR _oldsrc$1457[ebp], eax
; Line 3135
	mov	eax, DWORD PTR _newsrc$1454[ebp]
	mov	DWORD PTR _src$1413[ebp], eax
; Line 3136
	mov	DWORD PTR _hash_arg_in_memory$S449, 0
; Line 3137
	mov	DWORD PTR _hash_arg_in_struct$S450, 0
; Line 3138
	mov	eax, DWORD PTR _src$1413[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	mov	eax, DWORD PTR _src$1413[ebp]
	push	eax
	call	_canon_hash
	add	esp, 8
	mov	ecx, 31					; 0000001fH
	cdq
	idiv	ecx
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sets$[ebp]
	mov	DWORD PTR [eax+ecx+8], edx
; Line 3142
	cmp	DWORD PTR _elt$1415[ebp], 0
	je	$L1458
; Line 3144
	mov	eax, DWORD PTR _elt$1415[ebp]
	mov	eax, DWORD PTR [eax+32]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sets$[ebp]
	mov	eax, DWORD PTR [eax+ecx+8]
	push	eax
	mov	eax, DWORD PTR _elt$1415[ebp]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	mov	eax, DWORD PTR _src$1413[ebp]
	push	eax
	call	_insert
	add	esp, 16					; 00000010H
	mov	DWORD PTR _elt$1415[ebp], eax
; Line 3145
	jmp	$L1459
$L1458:
; Line 3148
	mov	eax, DWORD PTR _mode$1416[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sets$[ebp]
	mov	eax, DWORD PTR [eax+ecx+8]
	push	eax
	mov	eax, DWORD PTR _src$1413[ebp]
	push	eax
	call	_lookup
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _elt$1415[ebp], eax
; Line 3150
	cmp	DWORD PTR _elt$1415[ebp], 0
	je	$L1460
	mov	eax, DWORD PTR _elt$1415[ebp]
	mov	ecx, DWORD PTR _elt$1415[ebp]
	cmp	DWORD PTR [eax+20], ecx
	je	$L1460
; Line 3152
	mov	eax, DWORD PTR _elt$1415[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _elt$1415[ebp], eax
; Line 3156
$L1462:
	mov	eax, DWORD PTR _elt$1415[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1465
	push	1
	mov	eax, DWORD PTR _elt$1415[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	mov	eax, DWORD PTR _elt$1415[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_exp_equiv_p
	add	esp, 12					; 0000000cH
	or	eax, eax
	je	$L1464
$L1465:
	mov	eax, DWORD PTR _elt$1415[ebp]
	movsx	eax, BYTE PTR [eax+38]
	or	eax, eax
	je	$L1463
$L1464:
; Line 3157
	mov	eax, DWORD PTR _elt$1415[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _elt$1415[ebp], eax
	jmp	$L1462
$L1463:
; Line 3158
	mov	eax, DWORD PTR _elt$1415[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_copy_rtx
	add	esp, 4
	mov	DWORD PTR _src$1413[ebp], eax
; Line 3159
	mov	DWORD PTR _hash_arg_in_memory$S449, 0
; Line 3160
	mov	DWORD PTR _hash_arg_in_struct$S450, 0
; Line 3161
	mov	eax, DWORD PTR _elt$1415[ebp]
	mov	eax, DWORD PTR [eax+32]
	push	eax
	mov	eax, DWORD PTR _src$1413[ebp]
	push	eax
	call	_canon_hash
	add	esp, 8
	mov	ecx, 31					; 0000001fH
	cdq
	idiv	ecx
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sets$[ebp]
	mov	DWORD PTR [eax+ecx+8], edx
; Line 3163
$L1460:
$L1459:
; Line 3174
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sets$[ebp]
	mov	eax, DWORD PTR [eax+ecx]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1466
; Line 3178
	push	0
	push	3
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_find_reg_note
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _note$1467[ebp], eax
; Line 3179
	cmp	DWORD PTR _note$1467[ebp], 0
	je	$L1468
; Line 3180
	mov	eax, DWORD PTR _oldsrc$1457[ebp]
	mov	ecx, DWORD PTR _note$1467[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 3181
	jmp	$L1469
$L1468:
; Line 3183
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	mov	eax, DWORD PTR _oldsrc$1457[ebp]
	push	eax
	push	5
	push	2
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	DWORD PTR [ecx+28], eax
$L1469:
; Line 3185
$L1466:
; Line 3186
$L1456:
; Line 3188
$L1453:
	mov	eax, DWORD PTR _elt$1415[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	shl	ecx, 5
	mov	edx, DWORD PTR _sets$[ebp]
	mov	DWORD PTR [ecx+edx+4], eax
; Line 3189
	mov	al, BYTE PTR _hash_arg_in_memory$S449
	mov	ecx, DWORD PTR _i$[ebp]
	shl	ecx, 5
	mov	edx, DWORD PTR _sets$[ebp]
	mov	BYTE PTR [ecx+edx+24], al
; Line 3190
	mov	al, BYTE PTR _hash_arg_in_struct$S450
	mov	ecx, DWORD PTR _i$[ebp]
	shl	ecx, 5
	mov	edx, DWORD PTR _sets$[ebp]
	mov	BYTE PTR [ecx+edx+25], al
; Line 3202
$L1443:
$L1442:
	cmp	DWORD PTR _n_sets$[ebp], 1
	jne	$L1470
; Line 3209
	mov	eax, DWORD PTR _src$1413[ebp]
	mov	ecx, DWORD PTR _sets$[ebp]
	mov	ecx, DWORD PTR [ecx]
	mov	DWORD PTR [ecx+8], eax
; Line 3211
$L1470:
	mov	DWORD PTR _do_not_record$S448, 0
; Line 3212
	mov	eax, DWORD PTR _sets$[ebp]
	mov	eax, DWORD PTR [eax]
	add	eax, 4
	mov	ecx, DWORD PTR _i$[ebp]
	shl	ecx, 5
	mov	edx, DWORD PTR _sets$[ebp]
	mov	DWORD PTR [ecx+edx+20], eax
; Line 3216
$L1472:
; Line 3219
	mov	eax, DWORD PTR _dest$1414[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 5832704				; 00590000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1475
	mov	eax, DWORD PTR _dest$1414[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 5898240				; 005a0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1474
$L1475:
; Line 3221
	mov	eax, DWORD PTR _dest$1414[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_canon_reg
	add	esp, 4
	mov	ecx, DWORD PTR _dest$1414[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 3222
	mov	eax, DWORD PTR _dest$1414[ebp]
	mov	eax, DWORD PTR [eax+12]
	push	eax
	call	_canon_reg
	add	esp, 4
	mov	ecx, DWORD PTR _dest$1414[ebp]
	mov	DWORD PTR [ecx+12], eax
; Line 3223
	mov	eax, DWORD PTR _dest$1414[ebp]
	add	eax, 4
	mov	ecx, DWORD PTR _i$[ebp]
	shl	ecx, 5
	mov	edx, DWORD PTR _sets$[ebp]
	mov	DWORD PTR [ecx+edx+20], eax
; Line 3224
	mov	eax, DWORD PTR _dest$1414[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _dest$1414[ebp], eax
; Line 3226
	jmp	$L1476
$L1474:
; Line 3227
	mov	eax, DWORD PTR _dest$1414[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1478
	mov	eax, DWORD PTR _dest$1414[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2359296				; 00240000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1477
$L1478:
; Line 3229
	mov	eax, DWORD PTR _dest$1414[ebp]
	add	eax, 4
	mov	ecx, DWORD PTR _i$[ebp]
	shl	ecx, 5
	mov	edx, DWORD PTR _sets$[ebp]
	mov	DWORD PTR [ecx+edx+20], eax
; Line 3230
	mov	eax, DWORD PTR _dest$1414[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _dest$1414[ebp], eax
; Line 3232
	jmp	$L1479
$L1477:
; Line 3233
	jmp	$L1473
$L1479:
$L1476:
; Line 3234
	jmp	$L1472
$L1473:
; Line 3236
	mov	eax, DWORD PTR _dest$1414[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	shl	ecx, 5
	mov	edx, DWORD PTR _sets$[ebp]
	mov	DWORD PTR [ecx+edx+16], eax
; Line 3243
	mov	eax, DWORD PTR _dest$1414[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1480
; Line 3248
	mov	eax, DWORD PTR _dest$1414[ebp]
	push	eax
	call	_canon_reg
	add	esp, 4
; Line 3249
	push	0
	mov	eax, DWORD PTR _dest$1414[ebp]
	push	eax
	call	_fold_rtx
	add	esp, 8
	mov	DWORD PTR _dest$1414[ebp], eax
; Line 3250
	mov	eax, DWORD PTR _dest$1414[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _addr$1481[ebp], eax
; Line 3256
	mov	eax, DWORD PTR _addr$1481[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 4128768				; 003f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1484
	mov	eax, DWORD PTR _addr$1481[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 4194304				; 00400000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1484
	mov	eax, DWORD PTR _addr$1481[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 4259840				; 00410000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1484
	mov	eax, DWORD PTR _addr$1481[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 4325376				; 00420000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1483
$L1484:
	mov	eax, DWORD PTR _addr$1481[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1483
	mov	eax, DWORD PTR _addr$1481[ebp]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jne	$L1483
; Line 3258
	jmp	$L1485
$L1483:
; Line 3263
	lea	eax, DWORD PTR _writes_memory$[ebp]
	push	eax
	mov	eax, DWORD PTR _dest$1414[ebp]
	push	eax
	call	_note_mem_written
	add	esp, 8
$L1485:
; Line 3277
	mov	eax, DWORD PTR _addr$1481[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1488
	mov	eax, DWORD PTR _addr$1481[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1488
	mov	eax, DWORD PTR _addr$1481[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1488
	mov	eax, DWORD PTR _addr$1481[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _hash$1482[ebp], eax
	cmp	DWORD PTR _hash$1482[ebp], 6
	je	$L1759
	jmp	$L1757
$L1759:
	mov	DWORD PTR -188+[ebp], 1
	jmp	$L1758
$L1757:
	mov	DWORD PTR -188+[ebp], 0
$L1758:
	cmp	DWORD PTR -188+[ebp], 0
	jne	$L1487
$L1488:
	mov	eax, DWORD PTR _addr$1481[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1486
	mov	eax, DWORD PTR _addr$1481[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _hash$1482[ebp], eax
	cmp	DWORD PTR _hash$1482[ebp], 6
	je	$L1762
	jmp	$L1760
$L1762:
	mov	DWORD PTR -192+[ebp], 1
	jmp	$L1761
$L1760:
	mov	DWORD PTR -192+[ebp], 0
$L1761:
	cmp	DWORD PTR -192+[ebp], 0
	je	$L1486
$L1487:
; Line 3278
	mov	eax, DWORD PTR _dest$1414[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	mov	eax, DWORD PTR _addr$1481[ebp]
	push	eax
	call	_canon_hash
	add	esp, 8
	add	eax, 37					; 00000025H
	mov	ecx, 31					; 0000001fH
	cdq
	idiv	ecx
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sets$[ebp]
	mov	DWORD PTR [eax+ecx+12], edx
; Line 3279
	jmp	$L1489
$L1486:
; Line 3282
	push	4
	mov	eax, DWORD PTR _addr$1481[ebp]
	push	eax
	call	_canon_hash
	add	esp, 8
	mov	ecx, 31					; 0000001fH
	cdq
	idiv	ecx
	mov	DWORD PTR _hash$1482[ebp], edx
; Line 3283
	cmp	DWORD PTR _do_not_record$S448, 0
	jne	$L1490
; Line 3285
	push	4
	mov	eax, DWORD PTR _hash$1482[ebp]
	push	eax
	mov	eax, DWORD PTR _addr$1481[ebp]
	push	eax
	call	_lookup
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _elt$1415[ebp], eax
; Line 3286
	mov	eax, DWORD PTR _hash$1482[ebp]
	mov	ecx, 31					; 0000001fH
	add	eax, 37					; 00000025H
	cdq
	idiv	ecx
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sets$[ebp]
	mov	DWORD PTR [eax+ecx+12], edx
; Line 3288
	cmp	DWORD PTR _elt$1415[ebp], 0
	je	$L1491
	mov	eax, DWORD PTR _elt$1415[ebp]
	mov	ecx, DWORD PTR _elt$1415[ebp]
	cmp	DWORD PTR [eax+20], ecx
	je	$L1491
; Line 3290
	mov	eax, DWORD PTR _elt$1415[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _elt$1415[ebp], eax
; Line 3294
$L1493:
	mov	eax, DWORD PTR _elt$1415[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1496
	push	1
	mov	eax, DWORD PTR _elt$1415[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	mov	eax, DWORD PTR _elt$1415[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_exp_equiv_p
	add	esp, 12					; 0000000cH
	or	eax, eax
	je	$L1495
$L1496:
	mov	eax, DWORD PTR _elt$1415[ebp]
	movsx	eax, BYTE PTR [eax+38]
	or	eax, eax
	je	$L1494
$L1495:
; Line 3295
	mov	eax, DWORD PTR _elt$1415[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _elt$1415[ebp], eax
	jmp	$L1493
$L1494:
; Line 3297
	mov	eax, DWORD PTR _elt$1415[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_copy_rtx
	add	esp, 4
	mov	DWORD PTR _addr$1481[ebp], eax
; Line 3300
	mov	eax, DWORD PTR _addr$1481[ebp]
	push	eax
	mov	eax, DWORD PTR _dest$1414[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	37					; 00000025H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _dest$1414[ebp], eax
; Line 3302
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sets$[ebp]
	mov	eax, DWORD PTR [eax+ecx+16]
	mov	eax, DWORD PTR [eax]
	shr	eax, 27					; 0000001bH
	and	eax, 1
	shl	eax, 27					; 0000001bH
	mov	ecx, DWORD PTR _dest$1414[ebp]
	mov	ecx, DWORD PTR [ecx]
	and	ecx, -134217729				; f7ffffffH
	or	eax, ecx
	mov	ecx, DWORD PTR _dest$1414[ebp]
	mov	DWORD PTR [ecx], eax
; Line 3304
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sets$[ebp]
	mov	eax, DWORD PTR [eax+ecx+16]
	mov	eax, DWORD PTR [eax]
	shr	eax, 28					; 0000001cH
	and	eax, 1
	shl	eax, 28					; 0000001cH
	mov	ecx, DWORD PTR _dest$1414[ebp]
	mov	ecx, DWORD PTR [ecx]
	and	ecx, -268435457				; efffffffH
	or	eax, ecx
	mov	ecx, DWORD PTR _dest$1414[ebp]
	mov	DWORD PTR [ecx], eax
; Line 3305
	mov	eax, DWORD PTR _dest$1414[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	shl	ecx, 5
	mov	edx, DWORD PTR _sets$[ebp]
	mov	ecx, DWORD PTR [ecx+edx+20]
	mov	DWORD PTR [ecx], eax
; Line 3306
	mov	eax, DWORD PTR _dest$1414[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	shl	ecx, 5
	mov	edx, DWORD PTR _sets$[ebp]
	mov	DWORD PTR [ecx+edx+16], eax
; Line 3308
$L1491:
; Line 3309
$L1490:
$L1489:
; Line 3316
$L1480:
; Line 3317
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sets$[ebp]
	mov	eax, DWORD PTR [eax+ecx]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 5898240				; 005a0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1498
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sets$[ebp]
	mov	eax, DWORD PTR [eax+ecx]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 5832704				; 00590000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1497
$L1498:
; Line 3319
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sets$[ebp]
	mov	eax, DWORD PTR [eax+ecx]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _width$1499[ebp], eax
; Line 3320
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sets$[ebp]
	mov	eax, DWORD PTR [eax+ecx]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_equiv_constant
	add	esp, 4
	mov	DWORD PTR _value$1500[ebp], eax
; Line 3325
	cmp	DWORD PTR _value$1500[ebp], 0
	je	$L1501
	mov	eax, DWORD PTR _value$1500[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	edx, 1966080				; 001e0000H
	and	edx, -65536				; ffff0000H
	cmp	eax, edx
	jne	$L1501
	mov	eax, DWORD PTR _width$1499[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	edx, 1966080				; 001e0000H
	and	edx, -65536				; ffff0000H
	cmp	eax, edx
	jne	$L1501
	mov	eax, DWORD PTR _width$1499[ebp]
	cmp	DWORD PTR [eax+4], 32			; 00000020H
	jge	$L1501
	mov	eax, -1
	mov	edx, DWORD PTR _width$1499[ebp]
	mov	cl, BYTE PTR [edx+4]
	shl	eax, cl
	mov	ecx, DWORD PTR _value$1500[ebp]
	test	eax, DWORD PTR [ecx+4]
	jne	$L1501
; Line 3329
	jmp	$L1502
$L1501:
; Line 3330
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sets$[ebp]
	mov	BYTE PTR [eax+ecx+26], 1
	mov	DWORD PTR _src_eqv$[ebp], 0
$L1502:
; Line 3337
	jmp	$L1503
$L1497:
; Line 3341
	cmp	DWORD PTR _do_not_record$S448, 0
	jne	$L1505
	mov	eax, DWORD PTR _dest$1414[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1763
	mov	eax, DWORD PTR _dest$1414[ebp]
	mov	eax, DWORD PTR [eax+4]
	sub	eax, 7
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	mov	DWORD PTR -196+[ebp], eax
	jmp	$L1764
$L1763:
	mov	eax, DWORD PTR _dest$1414[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	sub	eax, ecx
	cmp	eax, 1
	sbb	eax, eax
	inc	eax
	mov	DWORD PTR -196+[ebp], eax
$L1764:
	cmp	DWORD PTR -196+[ebp], 0
	jne	$L1505
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sets$[ebp]
	mov	eax, DWORD PTR [eax+ecx]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sets$[ebp]
	mov	eax, DWORD PTR [eax+ecx]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_rtx_equal_p
	add	esp, 8
	or	eax, eax
	je	$L1504
$L1505:
; Line 3342
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sets$[ebp]
	mov	DWORD PTR [eax+ecx], 0
; Line 3344
$L1504:
$L1503:
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sets$[ebp]
	cmp	DWORD PTR [eax+ecx], 0
	je	$L1506
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sets$[ebp]
	mov	eax, DWORD PTR [eax+ecx]
	mov	ecx, DWORD PTR _dest$1414[ebp]
	cmp	DWORD PTR [eax+4], ecx
	je	$L1506
; Line 3345
	mov	eax, DWORD PTR _mode$1416[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sets$[ebp]
	mov	eax, DWORD PTR [eax+ecx]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_canon_hash
	add	esp, 8
	mov	ecx, 31					; 0000001fH
	cdq
	idiv	ecx
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sets$[ebp]
	mov	DWORD PTR [eax+ecx+12], edx
; Line 3347
$L1506:
; Line 3350
	mov	eax, DWORD PTR _cc0_rtx
	cmp	DWORD PTR _dest$1414[ebp], eax
	jne	$L1507
	mov	eax, DWORD PTR _src$1413[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2818048				; 002b0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1508
	mov	eax, DWORD PTR _src$1413[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1508
	mov	eax, DWORD PTR _src$1413[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1508
	mov	eax, DWORD PTR _src$1413[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1508
	mov	eax, DWORD PTR _src$1413[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1508
	mov	eax, DWORD PTR _src$1413[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1507
$L1508:
; Line 3351
	mov	eax, DWORD PTR _src$1413[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sets$[ebp]
	mov	eax, DWORD PTR [eax+ecx+28]
	push	eax
	call	_fold_cc0
	add	esp, 8
	mov	DWORD PTR _this_insn_cc0$[ebp], eax
; Line 3353
$L1507:
	mov	eax, DWORD PTR _cc0_rtx
	cmp	DWORD PTR _dest$1414[ebp], eax
	jne	$L1509
	mov	eax, DWORD PTR _src$1413[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1509
; Line 3354
	mov	eax, DWORD PTR _src$1413[ebp]
	mov	DWORD PTR _this_insn_explicit_cc0$[ebp], eax
; Line 3355
$L1509:
	jmp	$L1411
$L1412:
; Line 3364
	cmp	DWORD PTR _src_eqv$[ebp], 0
	je	$L1510
	cmp	DWORD PTR _src_eqv_elt$[ebp], 0
	jne	$L1510
	mov	eax, DWORD PTR _sets$[ebp]
	cmp	DWORD PTR [eax], 0
	je	$L1510
; Line 3367
	mov	eax, DWORD PTR _sets$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _dest$1512[ebp], eax
; Line 3368
	mov	eax, DWORD PTR _dest$1512[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	mov	DWORD PTR _eqvmode$1513[ebp], eax
; Line 3370
	mov	eax, DWORD PTR _dest$1512[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2359296				; 00240000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1514
; Line 3371
	mov	eax, DWORD PTR _dest$1512[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	mov	DWORD PTR _eqvmode$1513[ebp], eax
; Line 3372
$L1514:
	push	0
	push	0
	mov	eax, DWORD PTR _src_eqv$[ebp]
	push	eax
	call	_insert_regs
	add	esp, 12					; 0000000cH
	or	eax, eax
	je	$L1515
; Line 3373
	mov	eax, DWORD PTR _eqvmode$1513[ebp]
	push	eax
	mov	eax, DWORD PTR _src_eqv$[ebp]
	push	eax
	call	_canon_hash
	add	esp, 8
	mov	ecx, 31					; 0000001fH
	cdq
	idiv	ecx
	mov	DWORD PTR _src_eqv_hash_code$[ebp], edx
; Line 3374
$L1515:
	mov	eax, DWORD PTR _eqvmode$1513[ebp]
	push	eax
	mov	eax, DWORD PTR _src_eqv_hash_code$[ebp]
	push	eax
	push	0
	mov	eax, DWORD PTR _src_eqv$[ebp]
	push	eax
	call	_insert
	add	esp, 16					; 00000010H
	mov	DWORD PTR _elt$1511[ebp], eax
; Line 3375
	mov	al, BYTE PTR _src_eqv_in_memory$[ebp]
	mov	ecx, DWORD PTR _elt$1511[ebp]
	mov	BYTE PTR [ecx+36], al
; Line 3376
	mov	al, BYTE PTR _src_eqv_in_struct$[ebp]
	mov	ecx, DWORD PTR _elt$1511[ebp]
	mov	BYTE PTR [ecx+37], al
; Line 3377
	mov	eax, DWORD PTR _elt$1511[ebp]
	mov	BYTE PTR [eax+38], 1
; Line 3378
	mov	eax, DWORD PTR _elt$1511[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _src_eqv_elt$[ebp], eax
; Line 3381
$L1510:
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L1516
$L1517:
	inc	DWORD PTR _i$[ebp]
$L1516:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _n_sets$[ebp], eax
	jle	$L1518
; Line 3382
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sets$[ebp]
	cmp	DWORD PTR [eax+ecx], 0
	je	$L1519
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sets$[ebp]
	movsx	eax, BYTE PTR [eax+ecx+26]
	or	eax, eax
	jne	$L1519
; Line 3384
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sets$[ebp]
	mov	eax, DWORD PTR [eax+ecx]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2359296				; 00240000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1520
; Line 3391
	mov	eax, DWORD PTR _src_eqv_elt$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	shl	ecx, 5
	mov	edx, DWORD PTR _sets$[ebp]
	mov	DWORD PTR [ecx+edx+4], eax
; Line 3392
	mov	eax, DWORD PTR _src_eqv_hash_code$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	shl	ecx, 5
	mov	edx, DWORD PTR _sets$[ebp]
	mov	DWORD PTR [ecx+edx+8], eax
; Line 3394
	jmp	$L1521
$L1520:
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sets$[ebp]
	cmp	DWORD PTR [eax+ecx+4], 0
	jne	$L1522
; Line 3396
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sets$[ebp]
	mov	eax, DWORD PTR [eax+ecx]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _src$1523[ebp], eax
; Line 3397
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sets$[ebp]
	mov	eax, DWORD PTR [eax+ecx]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _dest$1524[ebp], eax
; Line 3400
	mov	eax, DWORD PTR _src$1523[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sub	ecx, ecx
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1765
	mov	eax, DWORD PTR _dest$1524[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	mov	DWORD PTR _mode$1526[ebp], eax
	jmp	$L1766
$L1765:
	mov	eax, DWORD PTR _src$1523[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	mov	DWORD PTR _mode$1526[ebp], eax
$L1766:
; Line 3405
	push	0
	push	0
	mov	eax, DWORD PTR _src$1523[ebp]
	push	eax
	call	_insert_regs
	add	esp, 12					; 0000000cH
	or	eax, eax
	je	$L1527
; Line 3406
	mov	eax, DWORD PTR _mode$1526[ebp]
	push	eax
	mov	eax, DWORD PTR _src$1523[ebp]
	push	eax
	call	_canon_hash
	add	esp, 8
	mov	ecx, 31					; 0000001fH
	cdq
	idiv	ecx
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sets$[ebp]
	mov	DWORD PTR [eax+ecx+8], edx
; Line 3407
$L1527:
	mov	eax, DWORD PTR _mode$1526[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sets$[ebp]
	mov	eax, DWORD PTR [eax+ecx+8]
	push	eax
	mov	eax, DWORD PTR _src_eqv_elt$[ebp]
	push	eax
	mov	eax, DWORD PTR _src$1523[ebp]
	push	eax
	call	_insert
	add	esp, 16					; 00000010H
	mov	DWORD PTR _elt$1525[ebp], eax
; Line 3408
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sets$[ebp]
	mov	al, BYTE PTR [eax+ecx+24]
	mov	ecx, DWORD PTR _elt$1525[ebp]
	mov	BYTE PTR [ecx+36], al
; Line 3409
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sets$[ebp]
	mov	al, BYTE PTR [eax+ecx+25]
	mov	ecx, DWORD PTR _elt$1525[ebp]
	mov	BYTE PTR [ecx+37], al
; Line 3410
	mov	eax, DWORD PTR _elt$1525[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	ecx, DWORD PTR _i$[ebp]
	shl	ecx, 5
	mov	edx, DWORD PTR _sets$[ebp]
	mov	DWORD PTR [ecx+edx+4], eax
; Line 3412
$L1522:
$L1521:
; Line 3414
$L1519:
	jmp	$L1517
$L1518:
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	lea	eax, DWORD PTR _writes_memory$[ebp]
	push	eax
	call	_invalidate_from_clobbers
	add	esp, 8
; Line 3421
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L1528
$L1529:
	inc	DWORD PTR _i$[ebp]
$L1528:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _n_sets$[ebp], eax
	jle	$L1530
; Line 3422
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sets$[ebp]
	cmp	DWORD PTR [eax+ecx], 0
	je	$L1531
; Line 3424
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sets$[ebp]
	mov	eax, DWORD PTR [eax+ecx+16]
	mov	DWORD PTR _dest$1532[ebp], eax
; Line 3431
	mov	eax, DWORD PTR _dest$1532[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1534
	mov	eax, DWORD PTR _dest$1532[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1534
	mov	eax, DWORD PTR _writes_memory$[ebp]
	shl	eax, 29					; 0000001dH
	and	eax, -2147483648			; 80000000H
	sub	ecx, ecx
	and	ecx, -2147483648			; 80000000H
	cmp	eax, ecx
	jne	$L1533
	mov	eax, DWORD PTR _dest$1532[ebp]
	push	eax
	call	_cse_rtx_addr_varies_p
	add	esp, 4
	or	eax, eax
	jne	$L1533
$L1534:
; Line 3432
	mov	eax, DWORD PTR _dest$1532[ebp]
	push	eax
	call	_invalidate
	add	esp, 4
; Line 3433
$L1533:
; Line 3440
$L1531:
	jmp	$L1529
$L1530:
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L1535
$L1536:
	inc	DWORD PTR _i$[ebp]
$L1535:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _n_sets$[ebp], eax
	jle	$L1537
; Line 3441
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sets$[ebp]
	cmp	DWORD PTR [eax+ecx], 0
	je	$L1538
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sets$[ebp]
	mov	eax, DWORD PTR [eax+ecx]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1538
; Line 3442
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sets$[ebp]
	mov	eax, DWORD PTR [eax+ecx]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_mention_regs
	add	esp, 4
; Line 3447
$L1538:
	jmp	$L1536
$L1537:
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L1539
$L1540:
	inc	DWORD PTR _i$[ebp]
$L1539:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _n_sets$[ebp], eax
	jle	$L1541
; Line 3448
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sets$[ebp]
	cmp	DWORD PTR [eax+ecx], 0
	je	$L1542
; Line 3452
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sets$[ebp]
	movsx	eax, BYTE PTR [eax+ecx+26]
	or	eax, eax
	je	$L1543
; Line 3453
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sets$[ebp]
	mov	DWORD PTR [eax+ecx+4], 0
; Line 3455
$L1543:
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sets$[ebp]
	cmp	DWORD PTR [eax+ecx+4], 0
	je	$L1544
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sets$[ebp]
	mov	eax, DWORD PTR [eax+ecx+4]
	cmp	DWORD PTR [eax+20], 0
	jne	$L1544
; Line 3459
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sets$[ebp]
	mov	eax, DWORD PTR [eax+ecx+4]
	mov	DWORD PTR _elt$1545[ebp], eax
; Line 3461
$L1547:
	cmp	DWORD PTR _elt$1545[ebp], 0
	je	$L1548
	mov	eax, DWORD PTR _elt$1545[ebp]
	cmp	DWORD PTR [eax+20], 0
	jne	$L1548
; Line 3462
	mov	eax, DWORD PTR _elt$1545[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _elt$1545[ebp], eax
	jmp	$L1547
$L1548:
; Line 3463
	cmp	DWORD PTR _elt$1545[ebp], 0
	je	$L1767
	mov	eax, DWORD PTR _elt$1545[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	ecx, DWORD PTR _i$[ebp]
	shl	ecx, 5
	mov	edx, DWORD PTR _sets$[ebp]
	mov	DWORD PTR [ecx+edx+4], eax
	jmp	$L1768
$L1767:
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sets$[ebp]
	mov	DWORD PTR [eax+ecx+4], 0
$L1768:
; Line 3465
$L1544:
; Line 3469
$L1542:
	jmp	$L1540
$L1541:
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L1549
$L1550:
	inc	DWORD PTR _i$[ebp]
$L1549:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _n_sets$[ebp], eax
	jle	$L1551
; Line 3470
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sets$[ebp]
	cmp	DWORD PTR [eax+ecx], 0
	je	$L1552
; Line 3472
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sets$[ebp]
	mov	eax, DWORD PTR [eax+ecx]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _dest$1553[ebp], eax
; Line 3477
	cmp	DWORD PTR _flag_float_store, 0
	je	$L1555
	mov	eax, DWORD PTR _dest$1553[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1555
	mov	eax, DWORD PTR _dest$1553[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 167772160				; 0a000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L1556
	mov	eax, DWORD PTR _dest$1553[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 184549376				; 0b000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1555
$L1556:
; Line 3478
	jmp	$L1550
; Line 3483
$L1555:
	mov	eax, DWORD PTR _dest$1553[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2359296				; 00240000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1557
; Line 3484
	mov	eax, DWORD PTR _dest$1553[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _dest$1553[ebp], eax
; Line 3486
$L1557:
	mov	eax, DWORD PTR _dest$1553[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1558
; Line 3488
	push	1
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sets$[ebp]
	mov	eax, DWORD PTR [eax+ecx+4]
	push	eax
	mov	eax, DWORD PTR _dest$1553[ebp]
	push	eax
	call	_insert_regs
	add	esp, 12					; 0000000cH
	or	eax, eax
	je	$L1559
; Line 3491
	mov	eax, DWORD PTR _dest$1553[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg_qty$S435
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, 31					; 0000001fH
	add	eax, 4352				; 00001100H
	cdq
	idiv	ecx
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sets$[ebp]
	mov	DWORD PTR [eax+ecx+12], edx
; Line 3493
$L1559:
$L1558:
	mov	eax, DWORD PTR _dest$1553[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1560
; Line 3495
	push	1
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sets$[ebp]
	mov	eax, DWORD PTR [eax+ecx+4]
	push	eax
	mov	eax, DWORD PTR _dest$1553[ebp]
	push	eax
	call	_insert_regs
	add	esp, 12					; 0000000cH
	or	eax, eax
	je	$L1561
; Line 3499
	mov	eax, DWORD PTR _dest$1553[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	mov	eax, DWORD PTR _dest$1553[ebp]
	push	eax
	call	_canon_hash
	add	esp, 8
	mov	ecx, 31					; 0000001fH
	cdq
	idiv	ecx
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sets$[ebp]
	mov	DWORD PTR [eax+ecx+12], edx
; Line 3501
$L1561:
$L1560:
	mov	eax, DWORD PTR _dest$1553[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sets$[ebp]
	mov	eax, DWORD PTR [eax+ecx+12]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sets$[ebp]
	mov	eax, DWORD PTR [eax+ecx+4]
	push	eax
	mov	eax, DWORD PTR _dest$1553[ebp]
	push	eax
	call	_insert
	add	esp, 16					; 00000010H
	mov	DWORD PTR _elt$1554[ebp], eax
; Line 3502
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sets$[ebp]
	mov	eax, DWORD PTR [eax+ecx+16]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	sub	eax, ecx
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	mov	ecx, DWORD PTR _elt$1554[ebp]
	mov	BYTE PTR [ecx+36], al
; Line 3503
	mov	eax, DWORD PTR _elt$1554[ebp]
	movsx	eax, BYTE PTR [eax+36]
	or	eax, eax
	je	$L1562
; Line 3506
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sets$[ebp]
	mov	eax, DWORD PTR [eax+ecx+16]
	mov	eax, DWORD PTR [eax]
	shr	eax, 28					; 0000001cH
	test	al, 1
	jne	$L1771
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sets$[ebp]
	mov	eax, DWORD PTR [eax+ecx]
	mov	ecx, DWORD PTR _i$[ebp]
	shl	ecx, 5
	mov	edx, DWORD PTR _sets$[ebp]
	mov	ecx, DWORD PTR [ecx+edx+16]
	cmp	DWORD PTR [eax+4], ecx
	je	$L1769
$L1771:
	mov	eax, DWORD PTR _elt$1554[ebp]
	mov	BYTE PTR [eax+37], 1
	jmp	$L1770
$L1769:
	mov	eax, DWORD PTR _elt$1554[ebp]
	mov	BYTE PTR [eax+37], 0
$L1770:
; Line 3508
$L1562:
; Line 3517
$L1552:
	jmp	$L1550
$L1551:
; Line 3519
	cmp	DWORD PTR _n_sets$[ebp], 1
	jne	$L1563
	mov	eax, DWORD PTR _sets$[ebp]
	cmp	DWORD PTR [eax], 0
	je	$L1563
	mov	eax, DWORD PTR _sets$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1563
	mov	eax, DWORD PTR _sets$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1563
	mov	eax, DWORD PTR _sets$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _sets$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_canon_reg
	add	esp, 4
	push	eax
	call	_rtx_equal_p
	add	esp, 8
	or	eax, eax
	je	$L1563
; Line 3521
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _prev$1564[ebp], eax
; Line 3522
$L1566:
	cmp	DWORD PTR _prev$1564[ebp], 0
	je	$L1567
	mov	eax, DWORD PTR _prev$1564[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1179648				; 00120000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1567
; Line 3523
	mov	eax, DWORD PTR _prev$1564[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _prev$1564[ebp], eax
	jmp	$L1566
$L1567:
; Line 3526
	cmp	DWORD PTR _prev$1564[ebp], 0
	je	$L1568
	mov	eax, DWORD PTR _prev$1564[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 851968				; 000d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1568
	mov	eax, DWORD PTR _prev$1564[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1568
	mov	eax, DWORD PTR _prev$1564[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _sets$[ebp]
	mov	ecx, DWORD PTR [ecx]
	mov	ecx, DWORD PTR [ecx+8]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L1568
; Line 3528
	mov	eax, DWORD PTR _sets$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _dest$1569[ebp], eax
; Line 3529
	push	0
	push	3
	mov	eax, DWORD PTR _prev$1564[ebp]
	push	eax
	call	_find_reg_note
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _note$1570[ebp], eax
; Line 3531
	mov	eax, DWORD PTR _dest$1569[ebp]
	mov	ecx, DWORD PTR _prev$1564[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	mov	DWORD PTR [ecx+4], eax
; Line 3532
	mov	eax, DWORD PTR _sets$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _sets$[ebp]
	mov	ecx, DWORD PTR [ecx]
	mov	DWORD PTR [ecx+4], eax
; Line 3533
	mov	eax, DWORD PTR _dest$1569[ebp]
	mov	ecx, DWORD PTR _sets$[ebp]
	mov	ecx, DWORD PTR [ecx]
	mov	DWORD PTR [ecx+8], eax
; Line 3535
	cmp	DWORD PTR _note$1570[ebp], 0
	je	$L1571
; Line 3536
	mov	eax, DWORD PTR _note$1570[ebp]
	mov	eax, DWORD PTR [eax]
	and	eax, -16384001				; ff05ffffH
	or	eax, 327680				; 00050000H
	mov	ecx, DWORD PTR _note$1570[ebp]
	mov	DWORD PTR [ecx], eax
; Line 3537
$L1571:
; Line 3538
$L1568:
; Line 3541
$L1563:
; Line 3543
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 917504				; 000e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1572
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1572
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR _pc_rtx
	cmp	DWORD PTR [eax+4], ecx
	jne	$L1572
; Line 3545
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR _pc_rtx
	cmp	DWORD PTR [eax+8], ecx
	jne	$L1573
; Line 3547
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	and	eax, -65518				; ffff0012H
	or	eax, 18					; 00000012H
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 3548
	mov	eax, DWORD PTR _insn$[ebp]
	mov	DWORD PTR [eax+20], -1
; Line 3549
	mov	eax, DWORD PTR _insn$[ebp]
	mov	DWORD PTR [eax+16], 0
; Line 3550
	mov	DWORD PTR _cse_jumps_altered$S447, 1
; Line 3552
	cmp	DWORD PTR _prev_insn_cc0$S431, 0
	jne	$L1575
	cmp	DWORD PTR _prev_insn_explicit_cc0$S432, 0
	je	$L1574
$L1575:
; Line 3554
	mov	eax, DWORD PTR _prev_insn$S433
	mov	eax, DWORD PTR [eax]
	and	eax, -65518				; ffff0012H
	or	eax, 18					; 00000012H
	mov	ecx, DWORD PTR _prev_insn$S433
	mov	DWORD PTR [ecx], eax
; Line 3555
	mov	eax, DWORD PTR _prev_insn$S433
	mov	DWORD PTR [eax+20], -1
; Line 3556
	mov	eax, DWORD PTR _prev_insn$S433
	mov	DWORD PTR [eax+16], 0
; Line 3559
$L1574:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+32]
	dec	DWORD PTR [eax+20]
; Line 3561
	jmp	$L1576
$L1573:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1577
; Line 3565
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_emit_barrier_after
	add	esp, 4
; Line 3566
	mov	DWORD PTR _cse_jumps_altered$S447, 1
; Line 3568
	cmp	DWORD PTR _prev_insn_cc0$S431, 0
	jne	$L1580
	cmp	DWORD PTR _prev_insn_explicit_cc0$S432, 0
	je	$L1579
$L1580:
; Line 3570
	mov	eax, DWORD PTR _prev_insn$S433
	mov	eax, DWORD PTR [eax]
	and	eax, -65518				; ffff0012H
	or	eax, 18					; 00000012H
	mov	ecx, DWORD PTR _prev_insn$S433
	mov	DWORD PTR [ecx], eax
; Line 3571
	mov	eax, DWORD PTR _prev_insn$S433
	mov	DWORD PTR [eax+20], -1
; Line 3572
	mov	eax, DWORD PTR _prev_insn$S433
	mov	DWORD PTR [eax+16], 0
; Line 3576
$L1579:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	DWORD PTR _label$1578[ebp], eax
; Line 3577
$L1582:
	cmp	DWORD PTR _label$1578[ebp], 0
	je	$L1583
	mov	eax, DWORD PTR _label$1578[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1114112				; 00110000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1583
; Line 3578
	mov	eax, DWORD PTR _label$1578[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _label$1578[ebp], eax
	jmp	$L1582
$L1583:
; Line 3580
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _label$1578[ebp]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L1584
	mov	eax, DWORD PTR _label$1578[ebp]
	cmp	DWORD PTR [eax+20], 1
	jne	$L1584
; Line 3581
	mov	DWORD PTR _cse_skip_to_next_block$S443, 1
; Line 3582
$L1584:
; Line 3583
$L1577:
$L1576:
; Line 3589
$L1572:
; Line 3590
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1585
	cmp	DWORD PTR _prev_insn_cc0$S431, 0
	je	$L1585
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1586
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1586
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1586
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1585
$L1586:
; Line 3592
	mov	eax, DWORD PTR _prev_insn$S433
	mov	eax, DWORD PTR [eax]
	and	eax, -65518				; ffff0012H
	or	eax, 18					; 00000012H
	mov	ecx, DWORD PTR _prev_insn$S433
	mov	DWORD PTR [ecx], eax
; Line 3593
	mov	eax, DWORD PTR _prev_insn$S433
	mov	DWORD PTR [eax+20], -1
; Line 3594
	mov	eax, DWORD PTR _prev_insn$S433
	mov	DWORD PTR [eax+16], 0
; Line 3597
$L1585:
	mov	eax, DWORD PTR _this_insn_explicit_cc0$[ebp]
	mov	DWORD PTR _prev_insn_explicit_cc0$S432, eax
; Line 3598
	mov	eax, DWORD PTR _this_insn_cc0$[ebp]
	mov	DWORD PTR _prev_insn_cc0$S431, eax
; Line 3599
	mov	eax, DWORD PTR _insn$[ebp]
	mov	DWORD PTR _prev_insn$S433, eax
; Line 3600
$L1360:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_cse_insn ENDP
_written$ = 8
_writes_ptr$ = 12
_addr$1595 = -4
_note_mem_written PROC NEAR
; Line 3610
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 3613
	cmp	DWORD PTR _written$[ebp], 0
	jne	$L1592
; Line 3614
	mov	eax, DWORD PTR _?everything@?1??note_mem_written@@9@9$S1591
	mov	ecx, DWORD PTR _writes_ptr$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 3615
	jmp	$L1593
$L1592:
	mov	eax, DWORD PTR _written$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1594
; Line 3618
	mov	eax, DWORD PTR _written$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _addr$1595[ebp], eax
; Line 3622
	mov	eax, DWORD PTR _addr$1595[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 4128768				; 003f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1597
	mov	eax, DWORD PTR _addr$1595[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 4194304				; 00400000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1597
	mov	eax, DWORD PTR _addr$1595[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 4259840				; 00410000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1597
	mov	eax, DWORD PTR _addr$1595[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 4325376				; 00420000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1596
$L1597:
	mov	eax, DWORD PTR _addr$1595[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1596
	mov	eax, DWORD PTR _addr$1595[ebp]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jne	$L1596
; Line 3623
	jmp	$L1589
; Line 3624
$L1596:
	mov	eax, DWORD PTR _written$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 436207616				; 1a000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1598
; Line 3625
	mov	eax, DWORD PTR _?everything@?1??note_mem_written@@9@9$S1591
	mov	ecx, DWORD PTR _writes_ptr$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 3626
	jmp	$L1599
$L1598:
	mov	eax, DWORD PTR _written$[ebp]
	push	eax
	call	_cse_rtx_addr_varies_p
	add	esp, 4
	or	eax, eax
	je	$L1600
; Line 3632
	mov	eax, DWORD PTR _written$[ebp]
	mov	eax, DWORD PTR [eax]
	shr	eax, 28					; 0000001cH
	test	al, 1
	jne	$L1601
	mov	eax, DWORD PTR _written$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1601
; Line 3633
	mov	eax, DWORD PTR _writes_ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	or	eax, 4
	mov	ecx, DWORD PTR _writes_ptr$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 3634
$L1601:
	mov	eax, DWORD PTR _writes_ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	or	eax, 2
	mov	ecx, DWORD PTR _writes_ptr$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 3636
$L1600:
$L1599:
	mov	eax, DWORD PTR _writes_ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	or	eax, 1
	mov	ecx, DWORD PTR _writes_ptr$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 3638
$L1594:
$L1593:
$L1589:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_note_mem_written ENDP
_w$ = 8
_x$ = 12
_ref$1607 = -4
_i$1612 = -8
_y$1616 = -12
_ref$1618 = -16
_invalidate_from_clobbers PROC NEAR
; Line 3653
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 3657
	mov	eax, DWORD PTR _w$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 31					; 0000001fH
	and	eax, -2147483648			; 80000000H
	sub	ecx, ecx
	and	ecx, -2147483648			; 80000000H
	cmp	eax, ecx
	je	$L1605
; Line 3658
	mov	eax, DWORD PTR _w$[ebp]
	push	eax
	call	_invalidate_memory
	add	esp, 4
; Line 3660
$L1605:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1769472				; 001b0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1606
; Line 3662
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _ref$1607[ebp], eax
; Line 3665
	cmp	DWORD PTR _ref$1607[ebp], 0
	je	$L1608
	mov	eax, DWORD PTR _ref$1607[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1609
	mov	eax, DWORD PTR _ref$1607[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1609
	mov	eax, DWORD PTR _ref$1607[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1608
	mov	eax, DWORD PTR _w$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 29					; 0000001dH
	and	eax, -2147483648			; 80000000H
	sub	ecx, ecx
	and	ecx, -2147483648			; 80000000H
	cmp	eax, ecx
	jne	$L1608
$L1609:
; Line 3666
	mov	eax, DWORD PTR _ref$1607[ebp]
	push	eax
	call	_invalidate
	add	esp, 4
; Line 3667
$L1608:
; Line 3668
	jmp	$L1610
$L1606:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1310720				; 00140000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1611
; Line 3671
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	dec	eax
	mov	DWORD PTR _i$1612[ebp], eax
	jmp	$L1613
$L1614:
	dec	DWORD PTR _i$1612[ebp]
$L1613:
	cmp	DWORD PTR _i$1612[ebp], 0
	jl	$L1615
; Line 3673
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _i$1612[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	mov	DWORD PTR _y$1616[ebp], eax
; Line 3674
	mov	eax, DWORD PTR _y$1616[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1769472				; 001b0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1617
; Line 3676
	mov	eax, DWORD PTR _y$1616[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _ref$1618[ebp], eax
; Line 3679
	cmp	DWORD PTR _ref$1618[ebp], 0
	je	$L1619
	mov	eax, DWORD PTR _ref$1618[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1620
	mov	eax, DWORD PTR _ref$1618[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1620
	mov	eax, DWORD PTR _ref$1618[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1619
	mov	eax, DWORD PTR _w$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 29					; 0000001dH
	and	eax, -2147483648			; 80000000H
	sub	ecx, ecx
	and	ecx, -2147483648			; 80000000H
	cmp	eax, ecx
	jne	$L1619
$L1620:
; Line 3680
	mov	eax, DWORD PTR _ref$1618[ebp]
	push	eax
	call	_invalidate
	add	esp, 4
; Line 3681
$L1619:
; Line 3682
$L1617:
	jmp	$L1614
$L1615:
; Line 3684
$L1611:
$L1610:
$L1604:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_invalidate_from_clobbers ENDP
_insn$ = 12
_p$ = -4
_val$ = -24
_nsets$ = -8
_last_uid$ = -12
$T1772 = 8
_cse_end_of_basic_block PROC NEAR
; Line 3694
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	push	ebx
	push	esi
	push	edi
; Line 3695
	mov	eax, DWORD PTR _insn$[ebp]
	mov	DWORD PTR _p$[ebp], eax
; Line 3697
	mov	DWORD PTR _nsets$[ebp], 0
; Line 3698
	mov	DWORD PTR _last_uid$[ebp], 0
; Line 3701
$L1630:
	cmp	DWORD PTR _p$[ebp], 0
	je	$L1631
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1114112				; 00110000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1631
; Line 3715
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1179648				; 00120000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1632
	mov	eax, DWORD PTR _p$[ebp]
	cmp	DWORD PTR [eax+20], -5			; fffffffbH
	jne	$L1632
; Line 3716
	jmp	$L1631
; Line 3721
$L1632:
; Line 3722
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1179648				; 00120000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1633
	mov	eax, DWORD PTR _p$[ebp]
	cmp	DWORD PTR [eax+20], -7			; fffffff9H
	jne	$L1633
; Line 3723
	jmp	$L1631
; Line 3727
$L1633:
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 851968				; 000d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1634
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1310720				; 00140000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1634
; Line 3728
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	add	eax, DWORD PTR _nsets$[ebp]
	mov	DWORD PTR _nsets$[ebp], eax
; Line 3729
	jmp	$L1635
$L1634:
; Line 3730
	inc	DWORD PTR _nsets$[ebp]
$L1635:
; Line 3732
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _last_uid$[ebp], eax
; Line 3733
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _p$[ebp], eax
; Line 3734
	jmp	$L1630
$L1631:
; Line 3735
	mov	eax, DWORD PTR _last_uid$[ebp]
	mov	ecx, DWORD PTR _uid_cuid$S446
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	DWORD PTR _val$[ebp], eax
; Line 3736
	mov	eax, DWORD PTR _nsets$[ebp]
	mov	DWORD PTR _val$[ebp+4], eax
; Line 3737
	mov	eax, DWORD PTR _p$[ebp]
	mov	DWORD PTR _val$[ebp+8], eax
; Line 3739
	lea	eax, DWORD PTR _val$[ebp]
	mov	ecx, DWORD PTR $T1772[ebp]
	mov	edx, DWORD PTR [eax]
	mov	DWORD PTR [ecx], edx
	mov	edx, DWORD PTR [eax+4]
	mov	DWORD PTR [ecx+4], edx
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR [ecx+8], eax
	mov	eax, DWORD PTR $T1772[ebp]
	jmp	$L1624
; Line 3740
$L1624:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_cse_end_of_basic_block ENDP
_TEXT	ENDS
PUBLIC	_cse_main
EXTRN	_init_recog:NEAR
_BSS	SEGMENT
_max_elements_made$S455 DD 01H DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
_f$ = 8
_nregs$ = 12
_insn$ = -4
_i$ = -8
$T1773 = -32
_val$1660 = -20
_cse_main PROC NEAR
; Line 3757
	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H
	push	ebx
	push	esi
	push	edi
; Line 3758
	mov	eax, DWORD PTR _f$[ebp]
	mov	DWORD PTR _insn$[ebp], eax
; Line 3761
	mov	DWORD PTR _cse_jumps_altered$S447, 0
; Line 3763
	call	_init_recog
; Line 3765
	mov	eax, DWORD PTR _nregs$[ebp]
	mov	DWORD PTR _max_reg$S424, eax
; Line 3767
	mov	eax, DWORD PTR _nregs$[ebp]
	shl	eax, 2
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _all_minus_one$S441, eax
; Line 3768
	mov	eax, DWORD PTR _nregs$[ebp]
	shl	eax, 2
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _consec_ints$S442, eax
; Line 3769
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L1644
$L1645:
	inc	DWORD PTR _i$[ebp]
$L1644:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _nregs$[ebp], eax
	jle	$L1646
; Line 3771
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _all_minus_one$S441
	mov	DWORD PTR [ecx+eax*4], -1
; Line 3772
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _consec_ints$S442
	mov	DWORD PTR [edx+ecx*4], eax
; Line 3773
	jmp	$L1645
$L1646:
; Line 3775
	mov	eax, DWORD PTR _nregs$[ebp]
	shl	eax, 2
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _reg_next_eqv$S436, eax
; Line 3776
	mov	eax, DWORD PTR _nregs$[ebp]
	shl	eax, 2
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _reg_prev_eqv$S437, eax
; Line 3777
	mov	eax, DWORD PTR _nregs$[ebp]
	shl	eax, 2
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _reg_qty$S435, eax
; Line 3778
	mov	eax, DWORD PTR _nregs$[ebp]
	shl	eax, 2
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _reg_rtx$S438, eax
; Line 3779
	mov	eax, DWORD PTR _nregs$[ebp]
	shl	eax, 2
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _reg_in_table$S440, eax
; Line 3780
	mov	eax, DWORD PTR _nregs$[ebp]
	shl	eax, 2
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _reg_tick$S439, eax
; Line 3784
	push	124					; 0000007cH
	push	0
	push	OFFSET _table$S452
	call	_memset
	add	esp, 12					; 0000000cH
; Line 3785
	mov	DWORD PTR _free_element_chain$S453, 0
; Line 3786
	mov	DWORD PTR _n_elements_made$S454, 0
; Line 3790
	mov	eax, DWORD PTR _f$[ebp]
	mov	DWORD PTR _insn$[ebp], eax
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L1647
$L1648:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _insn$[ebp], eax
$L1647:
	cmp	DWORD PTR _insn$[ebp], 0
	je	$L1649
; Line 3791
	mov	eax, DWORD PTR _insn$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	DWORD PTR [eax+4], ecx
	jle	$L1650
; Line 3792
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _i$[ebp], eax
; Line 3794
$L1650:
	jmp	$L1648
$L1649:
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax*2+2]
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _uid_cuid$S446, eax
; Line 3795
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax*2+2]
	push	eax
	push	0
	mov	eax, DWORD PTR _uid_cuid$S446
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 3803
	mov	eax, DWORD PTR _f$[ebp]
	mov	DWORD PTR _insn$[ebp], eax
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L1651
$L1652:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _insn$[ebp], eax
$L1651:
	cmp	DWORD PTR _insn$[ebp], 0
	je	$L1653
; Line 3806
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1179648				; 00120000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1655
	mov	eax, DWORD PTR _insn$[ebp]
	cmp	DWORD PTR [eax+20], 0
	jge	$L1654
$L1655:
; Line 3807
	inc	DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	mov	edx, DWORD PTR _uid_cuid$S446
	mov	WORD PTR [edx+ecx*2], ax
; Line 3808
	jmp	$L1656
$L1654:
; Line 3810
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	mov	edx, DWORD PTR _uid_cuid$S446
	mov	WORD PTR [edx+ecx*2], ax
$L1656:
; Line 3811
	jmp	$L1652
$L1653:
; Line 3816
	mov	eax, DWORD PTR _f$[ebp]
	mov	DWORD PTR _insn$[ebp], eax
; Line 3817
$L1658:
	cmp	DWORD PTR _insn$[ebp], 0
	je	$L1659
; Line 3821
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	lea	eax, DWORD PTR $T1773[ebp]
	push	eax
	call	_cse_end_of_basic_block
	add	esp, 8
	lea	ecx, DWORD PTR _val$1660[ebp]
	mov	edx, DWORD PTR [eax]
	mov	DWORD PTR [ecx], edx
	mov	edx, DWORD PTR [eax+4]
	mov	DWORD PTR [ecx+4], edx
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR [ecx+8], eax
; Line 3823
	mov	eax, DWORD PTR _val$1660[ebp]
	mov	DWORD PTR _cse_basic_block_end$S445, eax
; Line 3824
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _uid_cuid$S446
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	DWORD PTR _cse_basic_block_start$S444, eax
; Line 3825
	mov	eax, DWORD PTR _val$1660[ebp+4]
	add	eax, eax
	mov	DWORD PTR _max_qty$S425, eax
; Line 3829
	cmp	DWORD PTR _max_qty$S425, 500		; 000001f4H
	jge	$L1661
; Line 3830
	mov	DWORD PTR _max_qty$S425, 500		; 000001f4H
; Line 3832
$L1661:
	mov	eax, DWORD PTR _max_reg$S424
	add	DWORD PTR _max_qty$S425, eax
; Line 3834
	mov	eax, DWORD PTR _val$1660[ebp+8]
	push	eax
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_cse_basic_block
	add	esp, 8
	mov	DWORD PTR _insn$[ebp], eax
; Line 3838
	jmp	$L1658
$L1659:
; Line 3841
	mov	DWORD PTR _qty_const$S429, 0
; Line 3843
	mov	eax, DWORD PTR _n_elements_made$S454
	cmp	DWORD PTR _max_elements_made$S455, eax
	jge	$L1662
; Line 3844
	mov	eax, DWORD PTR _n_elements_made$S454
	mov	DWORD PTR _max_elements_made$S455, eax
; Line 3846
$L1662:
	mov	eax, DWORD PTR _cse_jumps_altered$S447
	jmp	$L1640
; Line 3847
$L1640:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_cse_main ENDP
_TEXT	ENDS
EXTRN	_call_used_regs:TBYTE
_TEXT	SEGMENT
_to$ = 12
_insn$ = -8
_qv1$ = -4
_qv2$ = -16
_qv3$ = -12
_code$1673 = -20
_i$1677 = -24
_val$1687 = -36
$T1774 = -48
_from$ = 8
_cse_basic_block PROC NEAR
; Line 3852
	push	ebp
	mov	ebp, esp
	sub	esp, 48					; 00000030H
	push	ebx
	push	esi
	push	edi
; Line 3854
	mov	eax, DWORD PTR _max_qty$S425
	shl	eax, 2
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _qv1$[ebp], eax
; Line 3855
	mov	eax, DWORD PTR _max_qty$S425
	shl	eax, 2
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _qv2$[ebp], eax
; Line 3856
	mov	eax, DWORD PTR _max_qty$S425
	shl	eax, 2
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _qv3$[ebp], eax
; Line 3858
	mov	eax, DWORD PTR _qv1$[ebp]
	mov	DWORD PTR _qty_first_reg$S427, eax
; Line 3859
	mov	eax, DWORD PTR _qv2$[ebp]
	mov	DWORD PTR _qty_last_reg$S428, eax
; Line 3860
	mov	eax, DWORD PTR _qv3$[ebp]
	mov	DWORD PTR _qty_const$S429, eax
; Line 3861
	mov	eax, DWORD PTR _max_qty$S425
	shl	eax, 2
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _qty_const_insn$S430, eax
; Line 3863
	call	_new_basic_block
; Line 3865
	mov	DWORD PTR _cse_skip_to_next_block$S443, 0
; Line 3867
	mov	eax, DWORD PTR _from$[ebp]
	mov	DWORD PTR _insn$[ebp], eax
	jmp	$L1670
$L1671:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _insn$[ebp], eax
$L1670:
	mov	eax, DWORD PTR _to$[ebp]
	cmp	DWORD PTR _insn$[ebp], eax
	je	$L1672
; Line 3871
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$1673[ebp], eax
; Line 3873
	cmp	DWORD PTR _code$1673[ebp], 13		; 0000000dH
	je	$L1675
	cmp	DWORD PTR _code$1673[ebp], 14		; 0000000eH
	je	$L1675
	cmp	DWORD PTR _code$1673[ebp], 15		; 0000000fH
	jne	$L1674
$L1675:
; Line 3874
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_cse_insn
	add	esp, 4
; Line 3876
$L1674:
	cmp	DWORD PTR _code$1673[ebp], 15		; 0000000fH
	jne	$L1676
; Line 3880
	push	OFFSET _?everything@?3??cse_basic_block@@9@9$S1679
	call	_invalidate_memory
	add	esp, 4
; Line 3881
	mov	DWORD PTR _i$1677[ebp], 0
	jmp	$L1680
$L1681:
	inc	DWORD PTR _i$1677[ebp]
$L1680:
	cmp	DWORD PTR _i$1677[ebp], 10		; 0000000aH
	jge	$L1682
; Line 3884
	mov	eax, DWORD PTR _i$1677[ebp]
	movsx	eax, BYTE PTR _call_used_regs[eax]
	or	eax, eax
	je	$L1683
	mov	eax, DWORD PTR _i$1677[ebp]
	mov	ecx, DWORD PTR _reg_rtx$S438
	cmp	DWORD PTR [ecx+eax*4], 0
	je	$L1683
	cmp	DWORD PTR _i$1677[ebp], 6
	je	$L1683
; Line 3885
	mov	eax, DWORD PTR _i$1677[ebp]
	mov	ecx, DWORD PTR _reg_rtx$S438
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	call	_invalidate
	add	esp, 4
; Line 3886
$L1683:
	jmp	$L1681
$L1682:
; Line 3892
$L1676:
; Line 3894
	cmp	DWORD PTR _code$1673[ebp], 18		; 00000012H
	jne	$L1684
	mov	eax, DWORD PTR _insn$[ebp]
	cmp	DWORD PTR [eax+20], -4			; fffffffcH
	jne	$L1684
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 917504				; 000e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1684
; Line 3896
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_predecide_loop_entry
	add	esp, 4
; Line 3901
	jmp	$L1672
; Line 3906
$L1684:
; Line 3907
	cmp	DWORD PTR _cse_skip_to_next_block$S443, 0
	jne	$L1686
	cmp	DWORD PTR _to$[ebp], 0
	je	$L1685
	mov	eax, DWORD PTR _insn$[ebp]
	mov	ecx, DWORD PTR _to$[ebp]
	cmp	DWORD PTR [eax+12], ecx
	jne	$L1685
	mov	eax, DWORD PTR _to$[ebp]
	cmp	DWORD PTR [eax+20], 0
	jne	$L1685
$L1686:
; Line 3912
	mov	DWORD PTR _cse_skip_to_next_block$S443, 0
; Line 3913
	mov	eax, DWORD PTR _to$[ebp]
	mov	DWORD PTR _insn$[ebp], eax
; Line 3914
	cmp	DWORD PTR _insn$[ebp], 0
	jne	$L1688
; Line 3915
	jmp	$L1672
; Line 3918
$L1688:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	push	eax
	lea	eax, DWORD PTR $T1774[ebp]
	push	eax
	call	_cse_end_of_basic_block
	add	esp, 8
	lea	ecx, DWORD PTR _val$1687[ebp]
	mov	edx, DWORD PTR [eax]
	mov	DWORD PTR [ecx], edx
	mov	edx, DWORD PTR [eax+4]
	mov	DWORD PTR [ecx+4], edx
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR [ecx+8], eax
; Line 3924
	mov	eax, DWORD PTR _val$1687[ebp+4]
	add	eax, eax
	add	eax, DWORD PTR _next_qty$S426
	cmp	eax, DWORD PTR _max_qty$S425
	jle	$L1689
; Line 3925
	jmp	$L1672
; Line 3927
$L1689:
	mov	eax, DWORD PTR _val$1687[ebp]
	mov	DWORD PTR _cse_basic_block_end$S445, eax
; Line 3928
	mov	eax, DWORD PTR _val$1687[ebp+8]
	mov	DWORD PTR _to$[ebp], eax
; Line 3930
$L1685:
	jmp	$L1671
$L1672:
; Line 3932
	mov	eax, DWORD PTR _max_qty$S425
	cmp	DWORD PTR _next_qty$S426, eax
	jle	$L1690
; Line 3933
	call	_abort
; Line 3935
$L1690:
	cmp	DWORD PTR _to$[ebp], 0
	je	$L1775
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+12]
	jmp	$L1776
$L1775:
	sub	eax, eax
$L1776:
	jmp	$L1665
; Line 3936
$L1665:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_cse_basic_block ENDP
_TEXT	ENDS
END
