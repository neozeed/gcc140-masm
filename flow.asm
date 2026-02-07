	TITLE	flow.c
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
COMM	_regset_bytes:DWORD
COMM	_regset_size:DWORD
COMM	_n_basic_blocks:DWORD
COMM	_basic_block_head:DWORD
COMM	_basic_block_end:DWORD
COMM	_basic_block_live_at_start:DWORD
COMM	_reg_basic_block:DWORD
COMM	_max_regno:DWORD
COMM	_reg_n_refs:DWORD
COMM	_reg_n_sets:DWORD
COMM	_reg_n_deaths:DWORD
COMM	_reg_first_use:DWORD
COMM	_reg_n_calls_crossed:DWORD
COMM	_reg_live_length:DWORD
COMM	_regs_live_at_setjmp:DWORD
_DATA	ENDS
PUBLIC	_dump_flow_info
PUBLIC	_flow_analysis
EXTRN	_oballoc:NEAR
EXTRN	_alloca:NEAR
EXTRN	_memset:NEAR
_BSS	SEGMENT
_uid_block_number$S541 DD 01H DUP (?)
_uid_volatile$S542 DD 01H DUP (?)
_basic_block_drops_in$S545 DD 01H DUP (?)
_basic_block_loop_depth$S546 DD 01H DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
; File flow.c
_f$ = 8
_nregs$ = 12
_file$ = 16
_insn$ = -8
_i$ = -4
_max_uid$ = -12
_prev_code$571 = -20
_code$572 = -16
_flow_analysis PROC NEAR
; Line 282
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	push	ebx
	push	esi
	push	edi
; Line 285
	mov	DWORD PTR _max_uid$[ebp], 0
; Line 290
	mov	DWORD PTR _prev_code$571[ebp], 14	; 0000000eH
; Line 293
	mov	eax, DWORD PTR _f$[ebp]
	mov	DWORD PTR _insn$[ebp], eax
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L573
$L574:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _insn$[ebp], eax
$L573:
	cmp	DWORD PTR _insn$[ebp], 0
	je	$L575
; Line 295
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$572[ebp], eax
; Line 296
	mov	eax, DWORD PTR _insn$[ebp]
	mov	ecx, DWORD PTR _max_uid$[ebp]
	cmp	DWORD PTR [eax+4], ecx
	jle	$L576
; Line 297
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _max_uid$[ebp], eax
; Line 298
$L576:
; Line 301
	cmp	DWORD PTR _code$572[ebp], 17		; 00000011H
	je	$L578
	cmp	DWORD PTR _prev_code$571[ebp], 13	; 0000000dH
	je	$L577
	cmp	DWORD PTR _prev_code$571[ebp], 15	; 0000000fH
	je	$L577
	cmp	DWORD PTR _prev_code$571[ebp], 17	; 00000011H
	je	$L577
	cmp	DWORD PTR _code$572[ebp], 13		; 0000000dH
	je	$L579
	cmp	DWORD PTR _code$572[ebp], 15		; 0000000fH
	je	$L579
	cmp	DWORD PTR _code$572[ebp], 14		; 0000000eH
	jne	$L577
$L579:
$L578:
; Line 302
	inc	DWORD PTR _i$[ebp]
; Line 303
$L577:
	cmp	DWORD PTR _code$572[ebp], 18		; 00000012H
	je	$L580
; Line 304
	mov	eax, DWORD PTR _code$572[ebp]
	mov	DWORD PTR _prev_code$571[ebp], eax
; Line 305
$L580:
	jmp	$L574
$L575:
; Line 311
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _n_basic_blocks, eax
; Line 312
	mov	eax, DWORD PTR _n_basic_blocks
	shl	eax, 2
	push	eax
	call	_oballoc
	add	esp, 4
	mov	DWORD PTR _basic_block_head, eax
; Line 313
	mov	eax, DWORD PTR _n_basic_blocks
	shl	eax, 2
	push	eax
	call	_oballoc
	add	esp, 4
	mov	DWORD PTR _basic_block_end, eax
; Line 314
	mov	eax, DWORD PTR _n_basic_blocks
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _basic_block_drops_in$S545, eax
; Line 315
	mov	eax, DWORD PTR _n_basic_blocks
	add	eax, eax
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _basic_block_loop_depth$S546, eax
; Line 316
	mov	eax, DWORD PTR _max_uid$[ebp]
	lea	eax, DWORD PTR [eax*2+2]
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _uid_block_number$S541, eax
; Line 317
	mov	eax, DWORD PTR _max_uid$[ebp]
	inc	eax
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _uid_volatile$S542, eax
; Line 318
	mov	eax, DWORD PTR _max_uid$[ebp]
	inc	eax
	push	eax
	push	0
	mov	eax, DWORD PTR _uid_volatile$S542
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 320
	mov	eax, DWORD PTR _f$[ebp]
	push	eax
	call	_find_basic_blocks
	add	esp, 4
; Line 321
	mov	eax, DWORD PTR _nregs$[ebp]
	push	eax
	mov	eax, DWORD PTR _f$[ebp]
	push	eax
	call	_life_analysis
	add	esp, 8
; Line 322
	cmp	DWORD PTR _file$[ebp], 0
	je	$L584
; Line 323
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_dump_flow_info
	add	esp, 4
; Line 325
$L584:
	mov	DWORD PTR _basic_block_drops_in$S545, 0
; Line 326
	mov	DWORD PTR _uid_block_number$S541, 0
; Line 327
	mov	DWORD PTR _basic_block_loop_depth$S546, 0
; Line 328
$L567:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_flow_analysis ENDP
_TEXT	ENDS
EXTRN	_simplejump_p:NEAR
EXTRN	_abort:NEAR
EXTRN	_delete_insn:NEAR
_BSS	SEGMENT
_block_live_static$S547 DD 01H DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
_j$644 = -48
_label$649 = -52
_f$ = 8
_insn$ = -8
_i$ = -4
_prev_code$589 = -16
_code$590 = -12
_depth$591 = -20
_i$610 = -24
_insn$614 = -32
_temp1$615 = -28
_block_live$620 = -44
_block_marked$621 = -40
_something_marked$622 = -36
_find_basic_blocks PROC NEAR
; Line 338
	push	ebp
	mov	ebp, esp
	sub	esp, 52					; 00000034H
	push	ebx
	push	esi
	push	edi
; Line 347
	mov	DWORD PTR _prev_code$589[ebp], 14	; 0000000eH
; Line 349
	mov	DWORD PTR _depth$591[ebp], 1
; Line 351
	mov	eax, DWORD PTR _f$[ebp]
	mov	DWORD PTR _insn$[ebp], eax
	mov	DWORD PTR _i$[ebp], -1
	jmp	$L592
$L593:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _insn$[ebp], eax
$L592:
	cmp	DWORD PTR _insn$[ebp], 0
	je	$L594
; Line 353
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$590[ebp], eax
; Line 354
	cmp	DWORD PTR _code$590[ebp], 18		; 00000012H
	jne	$L595
; Line 356
	mov	eax, DWORD PTR _insn$[ebp]
	cmp	DWORD PTR [eax+20], -4			; fffffffcH
	jne	$L596
; Line 357
	inc	DWORD PTR _depth$591[ebp]
; Line 358
	jmp	$L597
$L596:
	mov	eax, DWORD PTR _insn$[ebp]
	cmp	DWORD PTR [eax+20], -5			; fffffffbH
	jne	$L598
; Line 359
	dec	DWORD PTR _depth$591[ebp]
; Line 360
$L598:
$L597:
; Line 361
	jmp	$L599
$L595:
; Line 364
	cmp	DWORD PTR _code$590[ebp], 17		; 00000011H
	je	$L601
	cmp	DWORD PTR _prev_code$589[ebp], 13	; 0000000dH
	je	$L600
	cmp	DWORD PTR _prev_code$589[ebp], 15	; 0000000fH
	je	$L600
	cmp	DWORD PTR _prev_code$589[ebp], 17	; 00000011H
	je	$L600
	cmp	DWORD PTR _code$590[ebp], 13		; 0000000dH
	je	$L602
	cmp	DWORD PTR _code$590[ebp], 15		; 0000000fH
	je	$L602
	cmp	DWORD PTR _code$590[ebp], 14		; 0000000eH
	jne	$L600
$L602:
$L601:
; Line 366
	inc	DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _insn$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _basic_block_head
	mov	DWORD PTR [edx+ecx*4], eax
; Line 367
	mov	eax, DWORD PTR _insn$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _basic_block_end
	mov	DWORD PTR [edx+ecx*4], eax
; Line 368
	mov	eax, DWORD PTR _depth$591[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _basic_block_loop_depth$S546
	mov	WORD PTR [edx+ecx*2], ax
; Line 369
	cmp	DWORD PTR _code$590[ebp], 17		; 00000011H
	jne	$L603
; Line 370
	mov	eax, DWORD PTR _insn$[ebp]
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	DWORD PTR [ecx+20], eax
; Line 371
$L603:
; Line 372
	jmp	$L604
$L600:
	cmp	DWORD PTR _code$590[ebp], 13		; 0000000dH
	je	$L606
	cmp	DWORD PTR _code$590[ebp], 15		; 0000000fH
	je	$L606
	cmp	DWORD PTR _code$590[ebp], 14		; 0000000eH
	jne	$L605
$L606:
; Line 373
	mov	eax, DWORD PTR _insn$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _basic_block_end
	mov	DWORD PTR [edx+ecx*4], eax
; Line 374
$L605:
$L604:
$L599:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	mov	edx, DWORD PTR _uid_block_number$S541
	mov	WORD PTR [edx+ecx*2], ax
; Line 375
	cmp	DWORD PTR _code$590[ebp], 18		; 00000012H
	je	$L607
; Line 376
	mov	eax, DWORD PTR _code$590[ebp]
	mov	DWORD PTR _prev_code$589[ebp], eax
; Line 377
$L607:
	jmp	$L593
$L594:
; Line 378
	mov	eax, DWORD PTR _i$[ebp]
	inc	eax
	cmp	eax, DWORD PTR _n_basic_blocks
	je	$L608
; Line 379
	call	_abort
; Line 380
$L608:
; Line 386
	mov	DWORD PTR _i$610[ebp], 0
	jmp	$L611
$L612:
	inc	DWORD PTR _i$610[ebp]
$L611:
	mov	eax, DWORD PTR _n_basic_blocks
	cmp	DWORD PTR _i$610[ebp], eax
	jge	$L613
; Line 388
	mov	eax, DWORD PTR _i$610[ebp]
	mov	ecx, DWORD PTR _basic_block_head
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _insn$614[ebp], eax
; Line 391
$L617:
	cmp	DWORD PTR _insn$614[ebp], 0
	je	$L618
	mov	eax, DWORD PTR _insn$614[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1179648				; 00120000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L618
; Line 392
	mov	eax, DWORD PTR _insn$614[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _insn$614[ebp], eax
	jmp	$L617
$L618:
; Line 393
	cmp	DWORD PTR _insn$614[ebp], 0
	je	$L1151
	mov	eax, DWORD PTR _insn$614[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1048576				; 00100000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1151
	mov	DWORD PTR _temp1$615[ebp], 1
	jmp	$L1152
$L1151:
	mov	DWORD PTR _temp1$615[ebp], 0
$L1152:
; Line 394
	mov	al, BYTE PTR _temp1$615[ebp]
	mov	ecx, DWORD PTR _i$610[ebp]
	mov	edx, DWORD PTR _basic_block_drops_in$S545
	mov	BYTE PTR [ecx+edx], al
; Line 395
	jmp	$L612
$L613:
; Line 402
	cmp	DWORD PTR _n_basic_blocks, 0
	jle	$L619
; Line 404
	mov	eax, DWORD PTR _n_basic_blocks
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _block_live$620[ebp], eax
; Line 405
	mov	eax, DWORD PTR _n_basic_blocks
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _block_marked$621[ebp], eax
; Line 406
	mov	DWORD PTR _something_marked$622[ebp], 1
; Line 410
	mov	eax, DWORD PTR _n_basic_blocks
	push	eax
	push	0
	mov	eax, DWORD PTR _block_live$620[ebp]
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 411
	mov	eax, DWORD PTR _n_basic_blocks
	push	eax
	push	0
	mov	eax, DWORD PTR _block_marked$621[ebp]
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 412
	mov	eax, DWORD PTR _block_live$620[ebp]
	mov	BYTE PTR [eax], 1
; Line 413
	mov	eax, DWORD PTR _block_live$620[ebp]
	mov	DWORD PTR _block_live_static$S547, eax
; Line 421
$L624:
	cmp	DWORD PTR _something_marked$622[ebp], 0
	je	$L625
; Line 423
	mov	DWORD PTR _something_marked$622[ebp], 0
; Line 424
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L626
$L627:
	inc	DWORD PTR _i$[ebp]
$L626:
	mov	eax, DWORD PTR _n_basic_blocks
	cmp	DWORD PTR _i$[ebp], eax
	jge	$L628
; Line 425
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _block_live$620[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	or	eax, eax
	je	$L629
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _block_marked$621[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	or	eax, eax
	jne	$L629
; Line 427
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _block_marked$621[ebp]
	mov	BYTE PTR [eax+ecx], 1
; Line 428
	mov	DWORD PTR _something_marked$622[ebp], 1
; Line 429
	mov	eax, DWORD PTR _i$[ebp]
	inc	eax
	cmp	eax, DWORD PTR _n_basic_blocks
	jge	$L630
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _basic_block_drops_in$S545
	movsx	eax, BYTE PTR [eax+ecx+1]
	or	eax, eax
	je	$L630
; Line 430
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _block_live$620[ebp]
	mov	BYTE PTR [eax+ecx+1], 1
; Line 431
$L630:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _basic_block_end
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _insn$[ebp], eax
; Line 432
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 917504				; 000e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L631
; Line 433
	push	0
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_mark_label_ref
	add	esp, 12					; 0000000cH
; Line 434
$L631:
; Line 435
$L629:
	jmp	$L627
$L628:
	jmp	$L624
$L625:
; Line 441
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L632
$L633:
	inc	DWORD PTR _i$[ebp]
$L632:
	mov	eax, DWORD PTR _n_basic_blocks
	cmp	DWORD PTR _i$[ebp], eax
	jge	$L634
; Line 442
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _block_live$620[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	or	eax, eax
	jne	$L635
; Line 444
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _basic_block_head
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _insn$[ebp], eax
; Line 445
$L637:
; Line 447
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1048576				; 00100000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L639
; Line 448
	call	_abort
; Line 449
$L639:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1179648				; 00120000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L640
; Line 451
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	and	eax, -65518				; ffff0012H
	or	eax, 18					; 00000012H
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 452
	mov	eax, DWORD PTR _insn$[ebp]
	mov	DWORD PTR [eax+20], -1
; Line 453
	mov	eax, DWORD PTR _insn$[ebp]
	mov	DWORD PTR [eax+16], 0
; Line 455
$L640:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _basic_block_end
	mov	edx, DWORD PTR _insn$[ebp]
	cmp	DWORD PTR [ecx+eax*4], edx
	jne	$L641
; Line 463
	mov	eax, DWORD PTR _insn$[ebp]
	cmp	DWORD PTR [eax+12], 0
	je	$L642
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1048576				; 00100000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L642
; Line 464
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	push	eax
	call	_delete_insn
	add	esp, 4
; Line 465
$L642:
	jmp	$L638
; Line 467
$L641:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _insn$[ebp], eax
; Line 468
	jmp	$L637
$L638:
; Line 473
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _block_live$620[ebp]
	movsx	eax, BYTE PTR [eax+ecx-1]
	or	eax, eax
	je	$L643
; Line 476
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _j$644[ebp], eax
	jmp	$L645
$L646:
	inc	DWORD PTR _j$644[ebp]
$L645:
	mov	eax, DWORD PTR _n_basic_blocks
	cmp	DWORD PTR _j$644[ebp], eax
	jge	$L647
; Line 477
	mov	eax, DWORD PTR _j$644[ebp]
	mov	ecx, DWORD PTR _block_live$620[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	or	eax, eax
	je	$L648
; Line 480
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _basic_block_end
	mov	eax, DWORD PTR [ecx+eax*4-4]
	mov	DWORD PTR _insn$[ebp], eax
; Line 488
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 917504				; 000e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L651
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_simplejump_p
	add	esp, 4
	or	eax, eax
	je	$L651
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _label$649[ebp], eax
	mov	eax, DWORD PTR _label$649[ebp]
	cmp	DWORD PTR [eax+4], 0
	je	$L651
	mov	eax, DWORD PTR _label$649[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _uid_block_number$S541
	movsx	eax, WORD PTR [ecx+eax*2]
	cmp	eax, DWORD PTR _j$644[ebp]
	jne	$L651
; Line 490
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	and	eax, -65518				; ffff0012H
	or	eax, 18					; 00000012H
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 491
	mov	eax, DWORD PTR _insn$[ebp]
	mov	DWORD PTR [eax+20], -1
; Line 492
	mov	eax, DWORD PTR _insn$[ebp]
	mov	DWORD PTR [eax+16], 0
; Line 493
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1048576				; 00100000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L652
; Line 494
	call	_abort
; Line 495
$L652:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	push	eax
	call	_delete_insn
	add	esp, 4
; Line 497
$L651:
	jmp	$L647
; Line 499
$L648:
	jmp	$L646
$L647:
; Line 500
$L643:
; Line 501
$L635:
	jmp	$L633
$L634:
; Line 502
$L619:
$L586:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_find_basic_blocks ENDP
_TEXT	ENDS
EXTRN	_rtx_length:BYTE
EXTRN	_rtx_format:BYTE
_TEXT	SEGMENT
_x$ = 8
_insn$ = 12
_checkdup$ = 16
_code$ = -12
_i$ = -4
_fmt$ = -8
_label$661 = -20
_y$662 = -16
_j$675 = -24
_mark_label_ref PROC NEAR
; Line 516
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	push	ebx
	push	esi
	push	edi
; Line 517
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$[ebp], eax
; Line 521
	cmp	DWORD PTR _code$[ebp], 38		; 00000026H
	jne	$L660
; Line 523
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _label$661[ebp], eax
; Line 525
	mov	eax, DWORD PTR _label$661[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1114112				; 00110000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L663
; Line 526
	call	_abort
; Line 531
$L663:
	mov	eax, DWORD PTR _label$661[ebp]
	cmp	DWORD PTR [eax+4], 0
	jne	$L664
; Line 532
	jmp	$L656
; Line 533
$L664:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [ecx+12], eax
; Line 536
	cmp	DWORD PTR _checkdup$[ebp], 0
	je	$L665
; Line 537
	mov	eax, DWORD PTR _label$661[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _y$662[ebp], eax
	jmp	$L666
$L667:
	mov	eax, DWORD PTR _y$662[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _y$662[ebp], eax
$L666:
	mov	eax, DWORD PTR _label$661[ebp]
	cmp	DWORD PTR _y$662[ebp], eax
	je	$L668
; Line 538
	mov	eax, DWORD PTR _y$662[ebp]
	mov	ecx, DWORD PTR _insn$[ebp]
	cmp	DWORD PTR [eax+12], ecx
	jne	$L669
; Line 539
	jmp	$L656
; Line 540
$L669:
	jmp	$L667
$L668:
$L665:
	mov	eax, DWORD PTR _label$661[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 541
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR _label$661[ebp]
	mov	DWORD PTR [ecx+20], eax
; Line 542
	mov	eax, DWORD PTR _label$661[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _uid_block_number$S541
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	ecx, DWORD PTR _block_live_static$S547
	mov	BYTE PTR [eax+ecx], 1
; Line 543
	jmp	$L656
; Line 546
$L660:
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_format[eax*4]
	mov	DWORD PTR _fmt$[ebp], eax
; Line 547
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_length[eax*4]
	dec	eax
	mov	DWORD PTR _i$[ebp], eax
	jmp	$L670
$L671:
	dec	DWORD PTR _i$[ebp]
$L670:
	cmp	DWORD PTR _i$[ebp], 0
	jl	$L672
; Line 549
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 101				; 00000065H
	jne	$L673
; Line 550
	push	0
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	push	eax
	call	_mark_label_ref
	add	esp, 12					; 0000000cH
; Line 551
$L673:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 69					; 00000045H
	jne	$L674
; Line 554
	mov	DWORD PTR _j$675[ebp], 0
	jmp	$L676
$L677:
	inc	DWORD PTR _j$675[ebp]
$L676:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$675[ebp]
	cmp	DWORD PTR [eax], ecx
	jbe	$L678
; Line 555
	push	1
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$675[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	push	eax
	call	_mark_label_ref
	add	esp, 12					; 0000000cH
	jmp	$L677
$L678:
; Line 557
$L674:
	jmp	$L671
$L672:
; Line 558
$L656:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_mark_label_ref ENDP
_TEXT	ENDS
PUBLIC	_allocate_for_life_analysis
EXTRN	_volatile_refs_p:NEAR
EXTRN	_stack_pointer_rtx:DWORD
EXTRN	_frame_pointer_needed:DWORD
EXTRN	_regs_ever_live:TBYTE
EXTRN	_xmalloc:NEAR
EXTRN	_memcpy:NEAR
EXTRN	_free:NEAR
EXTRN	_regno_reg_rtx:DWORD
EXTRN	__obstack_begin:NEAR
EXTRN	__obstack_newchunk:NEAR
EXTRN	__obstack_free:NEAR
_BSS	SEGMENT
_reg_next_use$S543 DD 01H DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
_consider$716 = -80
_must_rescan$717 = -76
_j$718 = -84
_x$722 = -88
_x$730 = -92
_jump$733 = -100
_head$734 = -96
_from_block$736 = -108
_j$737 = -104
_f$ = 8
_nregs$ = 12
_from_block$745 = -116
_j$746 = -112
_tem$ = -16
_first_pass$ = -8
_changed$ = -4
_basic_block_live_at_end$ = -68
_basic_block_new_live_at_end$ = -56
_basic_block_significant$ = -60
_i$ = -12
_insn$ = -64
_flow_obstack$ = -52
_code1$696 = -72
_life_analysis PROC NEAR
; Line 571
	push	ebp
	mov	ebp, esp
	sub	esp, 120				; 00000078H
	push	ebx
	push	esi
	push	edi
; Line 594
	push	OFFSET _free
	push	OFFSET _xmalloc
	push	0
	push	0
	lea	eax, DWORD PTR _flow_obstack$[ebp]
	push	eax
	call	__obstack_begin
	add	esp, 20					; 00000014H
; Line 596
	mov	eax, DWORD PTR _nregs$[ebp]
	mov	DWORD PTR _max_regno, eax
; Line 598
	push	10					; 0000000aH
	push	0
	push	OFFSET _regs_ever_live
	call	_memset
	add	esp, 12					; 0000000cH
; Line 603
	call	_allocate_for_life_analysis
; Line 605
	mov	eax, DWORD PTR _nregs$[ebp]
	shl	eax, 2
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _reg_next_use$S543, eax
; Line 606
	mov	eax, DWORD PTR _nregs$[ebp]
	shl	eax, 2
	push	eax
	push	0
	mov	eax, DWORD PTR _reg_next_use$S543
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 611
	mov	eax, DWORD PTR _n_basic_blocks
	shl	eax, 2
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _basic_block_live_at_end$[ebp], eax
; Line 616
	mov	eax, DWORD PTR _regset_bytes
	imul	eax, DWORD PTR _n_basic_blocks
	mov	DWORD PTR _flow_obstack$[ebp+20], eax
	mov	eax, DWORD PTR _flow_obstack$[ebp+20]
	add	eax, DWORD PTR _flow_obstack$[ebp+12]
	cmp	eax, DWORD PTR _flow_obstack$[ebp+16]
	jbe	$L1153
	mov	eax, DWORD PTR _flow_obstack$[ebp+20]
	push	eax
	lea	eax, DWORD PTR _flow_obstack$[ebp]
	push	eax
	call	__obstack_newchunk
	add	esp, 8
	jmp	$L1154
$L1153:
$L1154:
	mov	eax, DWORD PTR _flow_obstack$[ebp+20]
	add	DWORD PTR _flow_obstack$[ebp+12], eax
	mov	eax, DWORD PTR _flow_obstack$[ebp+8]
	mov	DWORD PTR _flow_obstack$[ebp+20], eax
	mov	eax, DWORD PTR _flow_obstack$[ebp+12]
	add	eax, DWORD PTR _flow_obstack$[ebp+24]
	mov	ecx, DWORD PTR _flow_obstack$[ebp+24]
	not	ecx
	and	eax, ecx
	mov	DWORD PTR _flow_obstack$[ebp+12], eax
	mov	eax, DWORD PTR _flow_obstack$[ebp+12]
	sub	eax, DWORD PTR _flow_obstack$[ebp+4]
	mov	ecx, DWORD PTR _flow_obstack$[ebp+16]
	sub	ecx, DWORD PTR _flow_obstack$[ebp+4]
	cmp	eax, ecx
	jle	$L1155
	mov	eax, DWORD PTR _flow_obstack$[ebp+16]
	mov	DWORD PTR _flow_obstack$[ebp+12], eax
	jmp	$L1156
$L1155:
$L1156:
	mov	eax, DWORD PTR _flow_obstack$[ebp+12]
	mov	DWORD PTR _flow_obstack$[ebp+8], eax
	mov	eax, DWORD PTR _flow_obstack$[ebp+20]
	mov	DWORD PTR _tem$[ebp], eax
; Line 617
	mov	eax, DWORD PTR _regset_bytes
	imul	eax, DWORD PTR _n_basic_blocks
	push	eax
	push	0
	mov	eax, DWORD PTR _tem$[ebp]
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 618
	mov	eax, DWORD PTR _regset_bytes
	push	eax
	mov	eax, DWORD PTR _n_basic_blocks
	push	eax
	mov	eax, DWORD PTR _tem$[ebp]
	push	eax
	mov	eax, DWORD PTR _basic_block_live_at_end$[ebp]
	push	eax
	call	_init_regset_vector
	add	esp, 16					; 00000010H
; Line 620
	mov	eax, DWORD PTR _n_basic_blocks
	shl	eax, 2
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _basic_block_new_live_at_end$[ebp], eax
; Line 621
	mov	eax, DWORD PTR _regset_bytes
	imul	eax, DWORD PTR _n_basic_blocks
	mov	DWORD PTR _flow_obstack$[ebp+20], eax
	mov	eax, DWORD PTR _flow_obstack$[ebp+20]
	add	eax, DWORD PTR _flow_obstack$[ebp+12]
	cmp	eax, DWORD PTR _flow_obstack$[ebp+16]
	jbe	$L1157
	mov	eax, DWORD PTR _flow_obstack$[ebp+20]
	push	eax
	lea	eax, DWORD PTR _flow_obstack$[ebp]
	push	eax
	call	__obstack_newchunk
	add	esp, 8
	jmp	$L1158
$L1157:
$L1158:
	mov	eax, DWORD PTR _flow_obstack$[ebp+20]
	add	DWORD PTR _flow_obstack$[ebp+12], eax
	mov	eax, DWORD PTR _flow_obstack$[ebp+8]
	mov	DWORD PTR _flow_obstack$[ebp+20], eax
	mov	eax, DWORD PTR _flow_obstack$[ebp+12]
	add	eax, DWORD PTR _flow_obstack$[ebp+24]
	mov	ecx, DWORD PTR _flow_obstack$[ebp+24]
	not	ecx
	and	eax, ecx
	mov	DWORD PTR _flow_obstack$[ebp+12], eax
	mov	eax, DWORD PTR _flow_obstack$[ebp+12]
	sub	eax, DWORD PTR _flow_obstack$[ebp+4]
	mov	ecx, DWORD PTR _flow_obstack$[ebp+16]
	sub	ecx, DWORD PTR _flow_obstack$[ebp+4]
	cmp	eax, ecx
	jle	$L1159
	mov	eax, DWORD PTR _flow_obstack$[ebp+16]
	mov	DWORD PTR _flow_obstack$[ebp+12], eax
	jmp	$L1160
$L1159:
$L1160:
	mov	eax, DWORD PTR _flow_obstack$[ebp+12]
	mov	DWORD PTR _flow_obstack$[ebp+8], eax
	mov	eax, DWORD PTR _flow_obstack$[ebp+20]
	mov	DWORD PTR _tem$[ebp], eax
; Line 622
	mov	eax, DWORD PTR _regset_bytes
	imul	eax, DWORD PTR _n_basic_blocks
	push	eax
	push	0
	mov	eax, DWORD PTR _tem$[ebp]
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 623
	mov	eax, DWORD PTR _regset_bytes
	push	eax
	mov	eax, DWORD PTR _n_basic_blocks
	push	eax
	mov	eax, DWORD PTR _tem$[ebp]
	push	eax
	mov	eax, DWORD PTR _basic_block_new_live_at_end$[ebp]
	push	eax
	call	_init_regset_vector
	add	esp, 16					; 00000010H
; Line 625
	mov	eax, DWORD PTR _n_basic_blocks
	shl	eax, 2
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _basic_block_significant$[ebp], eax
; Line 626
	mov	eax, DWORD PTR _regset_bytes
	imul	eax, DWORD PTR _n_basic_blocks
	mov	DWORD PTR _flow_obstack$[ebp+20], eax
	mov	eax, DWORD PTR _flow_obstack$[ebp+20]
	add	eax, DWORD PTR _flow_obstack$[ebp+12]
	cmp	eax, DWORD PTR _flow_obstack$[ebp+16]
	jbe	$L1161
	mov	eax, DWORD PTR _flow_obstack$[ebp+20]
	push	eax
	lea	eax, DWORD PTR _flow_obstack$[ebp]
	push	eax
	call	__obstack_newchunk
	add	esp, 8
	jmp	$L1162
$L1161:
$L1162:
	mov	eax, DWORD PTR _flow_obstack$[ebp+20]
	add	DWORD PTR _flow_obstack$[ebp+12], eax
	mov	eax, DWORD PTR _flow_obstack$[ebp+8]
	mov	DWORD PTR _flow_obstack$[ebp+20], eax
	mov	eax, DWORD PTR _flow_obstack$[ebp+12]
	add	eax, DWORD PTR _flow_obstack$[ebp+24]
	mov	ecx, DWORD PTR _flow_obstack$[ebp+24]
	not	ecx
	and	eax, ecx
	mov	DWORD PTR _flow_obstack$[ebp+12], eax
	mov	eax, DWORD PTR _flow_obstack$[ebp+12]
	sub	eax, DWORD PTR _flow_obstack$[ebp+4]
	mov	ecx, DWORD PTR _flow_obstack$[ebp+16]
	sub	ecx, DWORD PTR _flow_obstack$[ebp+4]
	cmp	eax, ecx
	jle	$L1163
	mov	eax, DWORD PTR _flow_obstack$[ebp+16]
	mov	DWORD PTR _flow_obstack$[ebp+12], eax
	jmp	$L1164
$L1163:
$L1164:
	mov	eax, DWORD PTR _flow_obstack$[ebp+12]
	mov	DWORD PTR _flow_obstack$[ebp+8], eax
	mov	eax, DWORD PTR _flow_obstack$[ebp+20]
	mov	DWORD PTR _tem$[ebp], eax
; Line 627
	mov	eax, DWORD PTR _regset_bytes
	imul	eax, DWORD PTR _n_basic_blocks
	push	eax
	push	0
	mov	eax, DWORD PTR _tem$[ebp]
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 628
	mov	eax, DWORD PTR _regset_bytes
	push	eax
	mov	eax, DWORD PTR _n_basic_blocks
	push	eax
	mov	eax, DWORD PTR _tem$[ebp]
	push	eax
	mov	eax, DWORD PTR _basic_block_significant$[ebp]
	push	eax
	call	_init_regset_vector
	add	esp, 16					; 00000010H
; Line 634
	mov	eax, DWORD PTR _f$[ebp]
	mov	DWORD PTR _insn$[ebp], eax
	jmp	$L693
$L694:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _insn$[ebp], eax
$L693:
	cmp	DWORD PTR _insn$[ebp], 0
	je	$L695
; Line 636
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code1$696[ebp], eax
; Line 637
	cmp	DWORD PTR _code1$696[ebp], 15		; 0000000fH
	jne	$L697
; Line 638
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _uid_volatile$S542
	mov	BYTE PTR [eax+ecx], 1
; Line 639
	jmp	$L698
$L697:
	cmp	DWORD PTR _code1$696[ebp], 13		; 0000000dH
	je	$L700
	cmp	DWORD PTR _code1$696[ebp], 14		; 0000000eH
	jne	$L699
$L700:
; Line 645
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L701
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L701
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L701
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	mov	ecx, DWORD PTR [ecx+4]
	mov	ecx, DWORD PTR [ecx+4]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L701
; Line 647
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	and	eax, -65518				; ffff0012H
	or	eax, 18					; 00000012H
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 648
	mov	eax, DWORD PTR _insn$[ebp]
	mov	DWORD PTR [eax+20], -1
; Line 649
	mov	eax, DWORD PTR _insn$[ebp]
	mov	DWORD PTR [eax+16], 0
; Line 651
	jmp	$L702
$L701:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1703936				; 001a0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L703
; Line 652
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_volatile_refs_p
	add	esp, 4
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	mov	edx, DWORD PTR _uid_volatile$S542
	mov	BYTE PTR [ecx+edx], al
; Line 659
	jmp	$L705
$L703:
; Line 666
	cmp	DWORD PTR _code1$696[ebp], 13		; 0000000dH
	jne	$L706
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L706
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _stack_pointer_rtx
	cmp	DWORD PTR [eax+4], ecx
	jne	$L706
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2949120				; 002d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L706
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _stack_pointer_rtx
	cmp	DWORD PTR [eax+4], ecx
	jne	$L706
; Line 667
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _uid_volatile$S542
	mov	BYTE PTR [eax+ecx], 1
; Line 668
$L706:
$L705:
$L702:
; Line 669
$L699:
$L698:
	jmp	$L694
$L695:
; Line 671
	cmp	DWORD PTR _n_basic_blocks, 0
	jle	$L707
; Line 673
	cmp	DWORD PTR _frame_pointer_needed, 0
	jne	$L708
$L709:
; Line 680
	mov	eax, DWORD PTR _n_basic_blocks
	mov	ecx, DWORD PTR _basic_block_live_at_end$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4-4]
	or	DWORD PTR [eax], 128			; 00000080H
; Line 683
	mov	eax, DWORD PTR _n_basic_blocks
	mov	ecx, DWORD PTR _basic_block_new_live_at_end$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4-4]
	or	DWORD PTR [eax], 128			; 00000080H
; Line 696
$L708:
$L707:
	mov	DWORD PTR _first_pass$[ebp], 1
; Line 697
	mov	DWORD PTR _changed$[ebp], 1
; Line 698
$L711:
	cmp	DWORD PTR _changed$[ebp], 0
	je	$L712
; Line 700
	mov	DWORD PTR _changed$[ebp], 0
; Line 701
	mov	eax, DWORD PTR _n_basic_blocks
	dec	eax
	mov	DWORD PTR _i$[ebp], eax
	jmp	$L713
$L714:
	dec	DWORD PTR _i$[ebp]
$L713:
	cmp	DWORD PTR _i$[ebp], 0
	jl	$L715
; Line 703
	mov	eax, DWORD PTR _first_pass$[ebp]
	mov	DWORD PTR _consider$716[ebp], eax
; Line 704
	mov	eax, DWORD PTR _first_pass$[ebp]
	mov	DWORD PTR _must_rescan$717[ebp], eax
; Line 716
	mov	DWORD PTR _j$718[ebp], 0
	jmp	$L719
$L720:
	inc	DWORD PTR _j$718[ebp]
$L719:
	mov	eax, DWORD PTR _regset_size
	cmp	DWORD PTR _j$718[ebp], eax
	jge	$L721
; Line 719
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _basic_block_live_at_end$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _j$718[ebp]
	mov	eax, DWORD PTR [eax+ecx*4]
	not	eax
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _basic_block_new_live_at_end$[ebp]
	mov	ecx, DWORD PTR [edx+ecx*4]
	mov	edx, DWORD PTR _j$718[ebp]
	and	eax, DWORD PTR [ecx+edx*4]
	mov	DWORD PTR _x$722[ebp], eax
; Line 720
	cmp	DWORD PTR _x$722[ebp], 0
	je	$L723
; Line 721
	mov	DWORD PTR _consider$716[ebp], 1
; Line 722
$L723:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _basic_block_significant$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _j$718[ebp]
	mov	eax, DWORD PTR [eax+ecx*4]
	test	eax, DWORD PTR _x$722[ebp]
	je	$L724
; Line 724
	mov	DWORD PTR _must_rescan$717[ebp], 1
; Line 725
	mov	DWORD PTR _consider$716[ebp], 1
; Line 726
	jmp	$L721
; Line 728
$L724:
	jmp	$L720
$L721:
; Line 730
	cmp	DWORD PTR _consider$716[ebp], 0
	jne	$L725
; Line 731
	jmp	$L714
; Line 735
$L725:
	mov	DWORD PTR _changed$[ebp], 1
; Line 737
	cmp	DWORD PTR _must_rescan$717[ebp], 0
	jne	$L726
; Line 742
	mov	DWORD PTR _j$718[ebp], 0
	jmp	$L727
$L728:
	inc	DWORD PTR _j$718[ebp]
$L727:
	mov	eax, DWORD PTR _regset_size
	cmp	DWORD PTR _j$718[ebp], eax
	jge	$L729
; Line 745
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _basic_block_live_at_end$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _j$718[ebp]
	mov	eax, DWORD PTR [eax+ecx*4]
	not	eax
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _basic_block_new_live_at_end$[ebp]
	mov	ecx, DWORD PTR [edx+ecx*4]
	mov	edx, DWORD PTR _j$718[ebp]
	and	eax, DWORD PTR [ecx+edx*4]
	mov	DWORD PTR _x$730[ebp], eax
; Line 746
	mov	eax, DWORD PTR _x$730[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _basic_block_live_at_start
	mov	ecx, DWORD PTR [edx+ecx*4]
	mov	edx, DWORD PTR _j$718[ebp]
	or	DWORD PTR [ecx+edx*4], eax
; Line 747
	mov	eax, DWORD PTR _x$730[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _basic_block_live_at_end$[ebp]
	mov	ecx, DWORD PTR [edx+ecx*4]
	mov	edx, DWORD PTR _j$718[ebp]
	or	DWORD PTR [ecx+edx*4], eax
; Line 748
	jmp	$L728
$L729:
; Line 750
	jmp	$L731
$L726:
; Line 755
	mov	eax, DWORD PTR _regset_bytes
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _basic_block_new_live_at_end$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _basic_block_live_at_end$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
; Line 757
	mov	eax, DWORD PTR _regset_bytes
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _basic_block_live_at_end$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _basic_block_live_at_start
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
; Line 761
	cmp	DWORD PTR _first_pass$[ebp], 0
	je	$L1165
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _basic_block_significant$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR -120+[ebp], eax
	jmp	$L1166
$L1165:
	mov	DWORD PTR -120+[ebp], 0
$L1166:
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	eax, DWORD PTR -120+[ebp]
	push	eax
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _basic_block_end
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _basic_block_head
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _basic_block_live_at_start
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	call	_propagate_block
	add	esp, 24					; 00000018H
; Line 762
$L731:
; Line 768
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _basic_block_head
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _head$734[ebp], eax
; Line 769
	mov	eax, DWORD PTR _head$734[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _jump$733[ebp], eax
; Line 770
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _basic_block_drops_in$S545
	movsx	eax, BYTE PTR [eax+ecx]
	or	eax, eax
	je	$L735
; Line 772
	mov	eax, DWORD PTR _jump$733[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _uid_block_number$S541
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	DWORD PTR _from_block$736[ebp], eax
; Line 774
	mov	DWORD PTR _j$737[ebp], 0
	jmp	$L738
$L739:
	inc	DWORD PTR _j$737[ebp]
$L738:
	mov	eax, DWORD PTR _regset_size
	cmp	DWORD PTR _j$737[ebp], eax
	jge	$L740
; Line 776
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _basic_block_live_at_start
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _j$737[ebp]
	mov	eax, DWORD PTR [eax+ecx*4]
	mov	ecx, DWORD PTR _from_block$736[ebp]
	mov	edx, DWORD PTR _basic_block_new_live_at_end$[ebp]
	mov	ecx, DWORD PTR [edx+ecx*4]
	mov	edx, DWORD PTR _j$737[ebp]
	or	DWORD PTR [ecx+edx*4], eax
	jmp	$L739
$L740:
; Line 780
$L735:
	mov	eax, DWORD PTR _head$734[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1114112				; 00110000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L741
; Line 783
	mov	eax, DWORD PTR _head$734[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _jump$733[ebp], eax
	jmp	$L742
$L743:
	mov	eax, DWORD PTR _jump$733[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _jump$733[ebp], eax
$L742:
	mov	eax, DWORD PTR _jump$733[ebp]
	cmp	DWORD PTR _head$734[ebp], eax
	je	$L744
; Line 785
	mov	eax, DWORD PTR _jump$733[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _uid_block_number$S541
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	DWORD PTR _from_block$745[ebp], eax
; Line 787
	mov	DWORD PTR _j$746[ebp], 0
	jmp	$L747
$L748:
	inc	DWORD PTR _j$746[ebp]
$L747:
	mov	eax, DWORD PTR _regset_size
	cmp	DWORD PTR _j$746[ebp], eax
	jge	$L749
; Line 789
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _basic_block_live_at_start
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _j$746[ebp]
	mov	eax, DWORD PTR [eax+ecx*4]
	mov	ecx, DWORD PTR _from_block$745[ebp]
	mov	edx, DWORD PTR _basic_block_new_live_at_end$[ebp]
	mov	ecx, DWORD PTR [edx+ecx*4]
	mov	edx, DWORD PTR _j$746[ebp]
	or	DWORD PTR [ecx+edx*4], eax
	jmp	$L748
$L749:
; Line 790
	jmp	$L743
$L744:
; Line 791
$L741:
; Line 795
	jmp	$L714
$L715:
; Line 796
	mov	DWORD PTR _first_pass$[ebp], 0
; Line 797
	jmp	$L711
$L712:
; Line 822
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L750
$L751:
	inc	DWORD PTR _i$[ebp]
$L750:
	mov	eax, DWORD PTR _n_basic_blocks
	cmp	DWORD PTR _i$[ebp], eax
	jge	$L752
; Line 825
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	push	0
	push	1
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _basic_block_end
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _basic_block_head
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _basic_block_live_at_end$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	call	_propagate_block
	add	esp, 24					; 00000018H
; Line 829
	jmp	$L751
$L752:
; Line 857
	mov	DWORD PTR _i$[ebp], 10			; 0000000aH
	jmp	$L753
$L754:
	inc	DWORD PTR _i$[ebp]
$L753:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _nregs$[ebp], eax
	jle	$L755
; Line 859
	mov	eax, DWORD PTR _i$[ebp]
	cdq
	and	edx, 31					; 0000001fH
	add	eax, edx
	sar	eax, 5
	mov	ecx, DWORD PTR _regs_live_at_setjmp
	mov	ebx, DWORD PTR [ecx+eax*4]
	mov	esi, 1
	mov	eax, DWORD PTR _i$[ebp]
	cdq
	xor	eax, edx
	sub	eax, edx
	and	eax, 31					; 0000001fH
	xor	eax, edx
	sub	eax, edx
	mov	cl, al
	shl	esi, cl
	test	ebx, esi
	je	$L756
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _regno_reg_rtx
	cmp	DWORD PTR [ecx+eax*4], 0
	je	$L756
; Line 861
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_live_length
	mov	DWORD PTR [ecx+eax*4], -1
; Line 862
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_basic_block
	mov	WORD PTR [ecx+eax*2], -1
; Line 865
$L756:
	jmp	$L754
$L755:
	sub	eax, eax
	sub	eax, DWORD PTR _flow_obstack$[ebp+4]
	mov	DWORD PTR _flow_obstack$[ebp+20], eax
	cmp	DWORD PTR _flow_obstack$[ebp+20], 0
	jl	$L1167
	mov	eax, DWORD PTR _flow_obstack$[ebp+16]
	sub	eax, DWORD PTR _flow_obstack$[ebp+4]
	cmp	eax, DWORD PTR _flow_obstack$[ebp+20]
	jle	$L1167
	mov	eax, DWORD PTR _flow_obstack$[ebp+20]
	add	eax, DWORD PTR _flow_obstack$[ebp+4]
	mov	DWORD PTR _flow_obstack$[ebp+8], eax
	mov	eax, DWORD PTR _flow_obstack$[ebp+8]
	mov	DWORD PTR _flow_obstack$[ebp+12], eax
	jmp	$L1168
$L1167:
	mov	eax, DWORD PTR _flow_obstack$[ebp+20]
	add	eax, DWORD PTR _flow_obstack$[ebp+4]
	push	eax
	lea	eax, DWORD PTR _flow_obstack$[ebp]
	push	eax
	call	__obstack_free
	add	esp, 8
$L1168:
; Line 866
$L681:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_life_analysis ENDP
_i$ = -4
_tem$ = -8
_allocate_for_life_analysis PROC NEAR
; Line 875
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 879
	mov	eax, DWORD PTR _max_regno
	add	eax, 31					; 0000001fH
	cdq
	and	edx, 31					; 0000001fH
	add	eax, edx
	sar	eax, 5
	mov	DWORD PTR _regset_size, eax
; Line 880
	mov	eax, DWORD PTR _regset_size
	shl	eax, 2
	mov	DWORD PTR _regset_bytes, eax
; Line 882
	mov	eax, DWORD PTR _max_regno
	add	eax, eax
	push	eax
	call	_oballoc
	add	esp, 4
	mov	DWORD PTR _reg_n_refs, eax
; Line 883
	mov	eax, DWORD PTR _max_regno
	add	eax, eax
	push	eax
	push	0
	mov	eax, DWORD PTR _reg_n_refs
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 885
	mov	eax, DWORD PTR _max_regno
	add	eax, eax
	push	eax
	call	_oballoc
	add	esp, 4
	mov	DWORD PTR _reg_n_sets, eax
; Line 886
	mov	eax, DWORD PTR _max_regno
	add	eax, eax
	push	eax
	push	0
	mov	eax, DWORD PTR _reg_n_sets
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 888
	mov	eax, DWORD PTR _max_regno
	add	eax, eax
	push	eax
	call	_oballoc
	add	esp, 4
	mov	DWORD PTR _reg_n_deaths, eax
; Line 889
	mov	eax, DWORD PTR _max_regno
	add	eax, eax
	push	eax
	push	0
	mov	eax, DWORD PTR _reg_n_deaths
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 891
	mov	eax, DWORD PTR _max_regno
	shl	eax, 2
	push	eax
	call	_oballoc
	add	esp, 4
	mov	DWORD PTR _reg_first_use, eax
; Line 892
	mov	eax, DWORD PTR _max_regno
	shl	eax, 2
	push	eax
	push	0
	mov	eax, DWORD PTR _reg_first_use
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 894
	mov	eax, DWORD PTR _max_regno
	shl	eax, 2
	push	eax
	call	_oballoc
	add	esp, 4
	mov	DWORD PTR _reg_live_length, eax
; Line 895
	mov	eax, DWORD PTR _max_regno
	shl	eax, 2
	push	eax
	push	0
	mov	eax, DWORD PTR _reg_live_length
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 897
	mov	eax, DWORD PTR _max_regno
	shl	eax, 2
	push	eax
	call	_oballoc
	add	esp, 4
	mov	DWORD PTR _reg_n_calls_crossed, eax
; Line 898
	mov	eax, DWORD PTR _max_regno
	shl	eax, 2
	push	eax
	push	0
	mov	eax, DWORD PTR _reg_n_calls_crossed
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 900
	mov	eax, DWORD PTR _max_regno
	add	eax, eax
	push	eax
	call	_oballoc
	add	esp, 4
	mov	DWORD PTR _reg_basic_block, eax
; Line 901
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L761
$L762:
	inc	DWORD PTR _i$[ebp]
$L761:
	mov	eax, DWORD PTR _max_regno
	cmp	DWORD PTR _i$[ebp], eax
	jge	$L763
; Line 902
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_basic_block
	mov	WORD PTR [ecx+eax*2], -1
	jmp	$L762
$L763:
; Line 904
	mov	eax, DWORD PTR _n_basic_blocks
	shl	eax, 2
	push	eax
	call	_oballoc
	add	esp, 4
	mov	DWORD PTR _basic_block_live_at_start, eax
; Line 905
	mov	eax, DWORD PTR _regset_bytes
	imul	eax, DWORD PTR _n_basic_blocks
	push	eax
	call	_oballoc
	add	esp, 4
	mov	DWORD PTR _tem$[ebp], eax
; Line 906
	mov	eax, DWORD PTR _regset_bytes
	imul	eax, DWORD PTR _n_basic_blocks
	push	eax
	push	0
	mov	eax, DWORD PTR _tem$[ebp]
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 907
	mov	eax, DWORD PTR _regset_bytes
	push	eax
	mov	eax, DWORD PTR _n_basic_blocks
	push	eax
	mov	eax, DWORD PTR _tem$[ebp]
	push	eax
	mov	eax, DWORD PTR _basic_block_live_at_start
	push	eax
	call	_init_regset_vector
	add	esp, 16					; 00000010H
; Line 909
	mov	eax, DWORD PTR _regset_bytes
	push	eax
	call	_oballoc
	add	esp, 4
	mov	DWORD PTR _regs_live_at_setjmp, eax
; Line 910
	mov	eax, DWORD PTR _regset_bytes
	push	eax
	push	0
	mov	eax, DWORD PTR _regs_live_at_setjmp
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 911
$L758:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_allocate_for_life_analysis ENDP
_i$ = -8
_p$ = -4
_vector$ = 8
_space$ = 12
_nelts$ = 16
_bytes_per_elt$ = 20
_init_regset_vector PROC NEAR
; Line 924
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 926
	mov	eax, DWORD PTR _space$[ebp]
	mov	DWORD PTR _p$[ebp], eax
; Line 928
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L771
$L772:
	inc	DWORD PTR _i$[ebp]
$L771:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _nelts$[ebp], eax
	jle	$L773
; Line 930
	mov	eax, DWORD PTR _p$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _vector$[ebp]
	mov	DWORD PTR [edx+ecx*4], eax
; Line 931
	mov	eax, DWORD PTR _bytes_per_elt$[ebp]
	and	eax, -4					; fffffffcH
	add	DWORD PTR _p$[ebp], eax
; Line 932
	jmp	$L772
$L773:
; Line 933
$L768:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_init_regset_vector ENDP
_TEXT	ENDS
EXTRN	_find_reg_note:NEAR
EXTRN	_call_used_regs:TBYTE
_BSS	SEGMENT
_loop_depth$S548 DD 01H DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
_old$ = 8
_i$839 = -68
_first$ = 12
_last$ = 16
_final$ = 20
_significant$ = 24
_bnum$ = 28
_insn$ = -20
_prev$ = -16
_live$ = -28
_p$848 = -72
_dead$ = -8
_regs_sometimes_live$ = -4
_sometimes_max$ = -12
_maxlive$ = -24
_i$790 = -32
_offset$791 = -40
_bit$792 = -36
_diff$857 = -76
_regno$859 = -80
_p$864 = -84
_i$808 = -44
_i$814 = -48
_note$815 = -52
_oldpat$817 = -56
_first$819 = -60
_prev$820 = -64
_propagate_block PROC NEAR
; Line 962
	push	ebp
	mov	ebp, esp
	sub	esp, 88					; 00000058H
	push	ebx
	push	esi
	push	edi
; Line 976
	mov	DWORD PTR _sometimes_max$[ebp], 0
; Line 981
	mov	eax, DWORD PTR _bnum$[ebp]
	mov	ecx, DWORD PTR _basic_block_loop_depth$S546
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	DWORD PTR _loop_depth$S548, eax
; Line 983
	mov	eax, DWORD PTR _regset_bytes
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _dead$[ebp], eax
; Line 984
	mov	eax, DWORD PTR _regset_bytes
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _live$[ebp], eax
; Line 986
	cmp	DWORD PTR _final$[ebp], 0
	je	$L789
; Line 990
	mov	eax, DWORD PTR _regset_bytes
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _maxlive$[ebp], eax
; Line 991
	mov	eax, DWORD PTR _regset_bytes
	push	eax
	mov	eax, DWORD PTR _old$[ebp]
	push	eax
	mov	eax, DWORD PTR _maxlive$[ebp]
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
; Line 993
	mov	eax, DWORD PTR _max_regno
	shl	eax, 2
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _regs_sometimes_live$[ebp], eax
; Line 999
	mov	DWORD PTR _offset$791[ebp], 0
	mov	DWORD PTR _i$790[ebp], 0
	jmp	$L793
$L794:
	inc	DWORD PTR _offset$791[ebp]
$L793:
	mov	eax, DWORD PTR _regset_size
	cmp	DWORD PTR _offset$791[ebp], eax
	jge	$L795
; Line 1000
	mov	DWORD PTR _bit$792[ebp], 1
	jmp	$L796
$L797:
	shl	DWORD PTR _bit$792[ebp], 1
	inc	DWORD PTR _i$790[ebp]
$L796:
	cmp	DWORD PTR _bit$792[ebp], 0
	je	$L798
; Line 1002
	mov	eax, DWORD PTR _i$790[ebp]
	cmp	DWORD PTR _max_regno, eax
	jne	$L799
; Line 1003
	jmp	$L798
; Line 1004
$L799:
	mov	eax, DWORD PTR _offset$791[ebp]
	mov	ecx, DWORD PTR _old$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	test	eax, DWORD PTR _bit$792[ebp]
	je	$L800
; Line 1006
	mov	eax, DWORD PTR _i$790[ebp]
	mov	ecx, DWORD PTR _reg_basic_block
	mov	WORD PTR [ecx+eax*2], -2		; fffffffeH
; Line 1007
	mov	eax, DWORD PTR _offset$791[ebp]
	mov	ecx, DWORD PTR _sometimes_max$[ebp]
	mov	edx, DWORD PTR _regs_sometimes_live$[ebp]
	mov	WORD PTR [edx+ecx*4], ax
; Line 1008
	mov	eax, DWORD PTR _i$790[ebp]
	cdq
	xor	eax, edx
	sub	eax, edx
	and	eax, 31					; 0000001fH
	xor	eax, edx
	sub	eax, edx
	mov	ecx, DWORD PTR _sometimes_max$[ebp]
	mov	edx, DWORD PTR _regs_sometimes_live$[ebp]
	mov	WORD PTR [edx+ecx*4+2], ax
; Line 1009
	inc	DWORD PTR _sometimes_max$[ebp]
; Line 1011
$L800:
	jmp	$L797
$L798:
	jmp	$L794
$L795:
; Line 1017
$L789:
$L802:
	mov	eax, DWORD PTR _last$[ebp]
	cmp	DWORD PTR [eax+12], 0
	je	$L803
	mov	eax, DWORD PTR _last$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1179648				; 00120000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L803
; Line 1018
	mov	eax, DWORD PTR _last$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _last$[ebp], eax
	jmp	$L802
$L803:
; Line 1022
	mov	eax, DWORD PTR _last$[ebp]
	mov	DWORD PTR _insn$[ebp], eax
	jmp	$L804
$L805:
	mov	eax, DWORD PTR _prev$[ebp]
	mov	DWORD PTR _insn$[ebp], eax
$L804:
; Line 1024
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _prev$[ebp], eax
; Line 1030
	cmp	DWORD PTR _final$[ebp], 0
	je	$L807
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1179648				; 00120000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L807
	mov	eax, DWORD PTR _insn$[ebp]
	cmp	DWORD PTR [eax+20], -7			; fffffff9H
	jne	$L807
; Line 1033
	mov	DWORD PTR _i$808[ebp], 0
	jmp	$L809
$L810:
	inc	DWORD PTR _i$808[ebp]
$L809:
	mov	eax, DWORD PTR _regset_size
	cmp	DWORD PTR _i$808[ebp], eax
	jge	$L811
; Line 1034
	mov	eax, DWORD PTR _i$808[ebp]
	mov	ecx, DWORD PTR _old$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _i$808[ebp]
	mov	edx, DWORD PTR _regs_live_at_setjmp
	or	DWORD PTR [edx+ecx*4], eax
	jmp	$L810
$L811:
; Line 1044
$L807:
; Line 1046
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 851968				; 000d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L813
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 917504				; 000e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L813
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 983040				; 000f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L812
$L813:
; Line 1049
	push	0
	push	6
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_find_reg_note
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _note$815[ebp], eax
; Line 1057
	cmp	DWORD PTR _final$[ebp], 0
	je	$L816
	push	1
	mov	eax, DWORD PTR _old$[ebp]
	push	eax
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_insn_dead_p
	add	esp, 12					; 0000000cH
	or	eax, eax
	je	$L816
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _uid_volatile$S542
	movsx	eax, BYTE PTR [eax+ecx]
	or	eax, eax
	jne	$L816
; Line 1059
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _oldpat$817[ebp], eax
; Line 1060
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	and	eax, -65518				; ffff0012H
	or	eax, 18					; 00000012H
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 1061
	mov	eax, DWORD PTR _insn$[ebp]
	mov	DWORD PTR [eax+20], -1
; Line 1062
	mov	eax, DWORD PTR _insn$[ebp]
	mov	DWORD PTR [eax+16], 0
; Line 1065
	cmp	DWORD PTR _note$815[ebp], 0
	je	$L818
	mov	eax, DWORD PTR _old$[ebp]
	push	eax
	mov	eax, DWORD PTR _oldpat$817[ebp]
	push	eax
	call	_libcall_dead_p
	add	esp, 8
	or	eax, eax
	je	$L818
; Line 1067
	mov	eax, DWORD PTR _note$815[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _first$819[ebp], eax
; Line 1068
	mov	eax, DWORD PTR _insn$[ebp]
	mov	DWORD PTR _prev$820[ebp], eax
; Line 1069
$L822:
	mov	eax, DWORD PTR _first$819[ebp]
	mov	eax, DWORD PTR [eax]
	shr	eax, 27					; 0000001bH
	test	al, 1
	je	$L823
; Line 1070
	mov	eax, DWORD PTR _first$819[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _first$819[ebp], eax
	jmp	$L822
$L823:
; Line 1071
$L825:
	mov	eax, DWORD PTR _first$819[ebp]
	cmp	DWORD PTR _prev$820[ebp], eax
	je	$L826
; Line 1073
	mov	eax, DWORD PTR _prev$820[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _prev$820[ebp], eax
; Line 1074
	mov	eax, DWORD PTR _prev$820[ebp]
	mov	eax, DWORD PTR [eax]
	and	eax, -65518				; ffff0012H
	or	eax, 18					; 00000012H
	mov	ecx, DWORD PTR _prev$820[ebp]
	mov	DWORD PTR [ecx], eax
; Line 1075
	mov	eax, DWORD PTR _prev$820[ebp]
	mov	DWORD PTR [eax+20], -1
; Line 1076
	mov	eax, DWORD PTR _prev$820[ebp]
	mov	DWORD PTR [eax+16], 0
; Line 1077
	jmp	$L825
$L826:
; Line 1079
$L818:
	jmp	$flushed$827
; Line 1082
$L816:
	mov	DWORD PTR _i$814[ebp], 0
	jmp	$L828
$L829:
	inc	DWORD PTR _i$814[ebp]
$L828:
	mov	eax, DWORD PTR _regset_size
	cmp	DWORD PTR _i$814[ebp], eax
	jge	$L830
; Line 1084
	mov	eax, DWORD PTR _i$814[ebp]
	mov	ecx, DWORD PTR _dead$[ebp]
	mov	DWORD PTR [ecx+eax*4], 0
; Line 1085
	mov	eax, DWORD PTR _i$814[ebp]
	mov	ecx, DWORD PTR _live$[ebp]
	mov	DWORD PTR [ecx+eax*4], 0
; Line 1086
	jmp	$L829
$L830:
; Line 1114
	cmp	DWORD PTR _note$815[ebp], 0
	je	$L831
	push	1
	mov	eax, DWORD PTR _old$[ebp]
	push	eax
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_insn_dead_p
	add	esp, 12					; 0000000cH
	or	eax, eax
	je	$L831
	mov	eax, DWORD PTR _old$[ebp]
	push	eax
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_libcall_dead_p
	add	esp, 8
	or	eax, eax
	je	$L831
; Line 1117
	mov	eax, DWORD PTR _significant$[ebp]
	push	eax
	push	0
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	mov	eax, DWORD PTR _dead$[ebp]
	push	eax
	mov	eax, DWORD PTR _old$[ebp]
	push	eax
	call	_mark_set_regs
	add	esp, 20					; 00000014H
; Line 1119
	mov	eax, DWORD PTR _note$815[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _insn$[ebp], eax
; Line 1120
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _prev$[ebp], eax
; Line 1122
	jmp	$L832
$L831:
; Line 1126
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L833
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _stack_pointer_rtx
	cmp	DWORD PTR [eax+4], ecx
	jne	$L833
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L833
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _stack_pointer_rtx
	cmp	DWORD PTR [eax+4], ecx
	jne	$L833
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L833
; Line 1132
	jmp	$L834
$L833:
; Line 1136
	cmp	DWORD PTR _final$[ebp], 0
	je	$L1169
	mov	eax, DWORD PTR _insn$[ebp]
	mov	DWORD PTR -88+[ebp], eax
	jmp	$L1170
$L1169:
	mov	DWORD PTR -88+[ebp], 0
$L1170:
	mov	eax, DWORD PTR _significant$[ebp]
	push	eax
	mov	eax, DWORD PTR -88+[ebp]
	push	eax
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	mov	eax, DWORD PTR _dead$[ebp]
	push	eax
	mov	eax, DWORD PTR _old$[ebp]
	push	eax
	call	_mark_set_regs
	add	esp, 20					; 00000014H
; Line 1137
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _final$[ebp]
	push	eax
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	mov	eax, DWORD PTR _live$[ebp]
	push	eax
	mov	eax, DWORD PTR _old$[ebp]
	push	eax
	call	_mark_used_regs
	add	esp, 20					; 00000014H
; Line 1140
	mov	DWORD PTR _i$814[ebp], 0
	jmp	$L835
$L836:
	inc	DWORD PTR _i$814[ebp]
$L835:
	mov	eax, DWORD PTR _regset_size
	cmp	DWORD PTR _i$814[ebp], eax
	jge	$L837
; Line 1142
	mov	eax, DWORD PTR _i$814[ebp]
	mov	ecx, DWORD PTR _dead$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	not	eax
	mov	ecx, DWORD PTR _i$814[ebp]
	mov	edx, DWORD PTR _old$[ebp]
	and	DWORD PTR [edx+ecx*4], eax
; Line 1143
	mov	eax, DWORD PTR _i$814[ebp]
	mov	ecx, DWORD PTR _live$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _i$814[ebp]
	mov	edx, DWORD PTR _old$[ebp]
	or	DWORD PTR [edx+ecx*4], eax
; Line 1144
	jmp	$L836
$L837:
; Line 1146
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 983040				; 000f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L838
; Line 1153
	mov	DWORD PTR _i$839[ebp], 0
	jmp	$L840
$L841:
	inc	DWORD PTR _i$839[ebp]
$L840:
	cmp	DWORD PTR _i$839[ebp], 10		; 0000000aH
	jge	$L842
; Line 1154
	mov	eax, DWORD PTR _i$839[ebp]
	movsx	eax, BYTE PTR _call_used_regs[eax]
	or	eax, eax
	je	$L843
; Line 1156
	mov	ebx, 1
	mov	eax, DWORD PTR _i$839[ebp]
	cdq
	xor	eax, edx
	sub	eax, edx
	and	eax, 31					; 0000001fH
	xor	eax, edx
	sub	eax, edx
	mov	cl, al
	shl	ebx, cl
	mov	eax, DWORD PTR _i$839[ebp]
	cdq
	and	edx, 31					; 0000001fH
	add	eax, edx
	sar	eax, 5
	mov	ecx, DWORD PTR _dead$[ebp]
	or	DWORD PTR [ecx+eax*4], ebx
; Line 1159
$L843:
	jmp	$L841
$L842:
; Line 1160
	mov	eax, DWORD PTR _live$[ebp]
	or	DWORD PTR [eax], 128			; 00000080H
; Line 1164
$L838:
	mov	DWORD PTR _i$814[ebp], 0
	jmp	$L844
$L845:
	inc	DWORD PTR _i$814[ebp]
$L844:
	mov	eax, DWORD PTR _regset_size
	cmp	DWORD PTR _i$814[ebp], eax
	jge	$L846
; Line 1166
	mov	eax, DWORD PTR _i$814[ebp]
	mov	ecx, DWORD PTR _dead$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	not	eax
	mov	ecx, DWORD PTR _i$814[ebp]
	mov	edx, DWORD PTR _old$[ebp]
	and	DWORD PTR [edx+ecx*4], eax
; Line 1167
	mov	eax, DWORD PTR _i$814[ebp]
	mov	ecx, DWORD PTR _live$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _i$814[ebp]
	mov	edx, DWORD PTR _old$[ebp]
	or	DWORD PTR [edx+ecx*4], eax
; Line 1168
	jmp	$L845
$L846:
; Line 1170
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 983040				; 000f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L847
	cmp	DWORD PTR _final$[ebp], 0
	je	$L847
; Line 1176
	mov	eax, DWORD PTR _regs_sometimes_live$[ebp]
	mov	DWORD PTR _p$848[ebp], eax
; Line 1178
	mov	DWORD PTR _i$814[ebp], 0
	jmp	$L849
$L850:
	inc	DWORD PTR _i$814[ebp]
	add	DWORD PTR _p$848[ebp], 4
$L849:
	mov	eax, DWORD PTR _sometimes_max$[ebp]
	cmp	DWORD PTR _i$814[ebp], eax
	jge	$L851
; Line 1179
	mov	eax, DWORD PTR _p$848[ebp]
	movsx	eax, WORD PTR [eax]
	mov	edx, DWORD PTR _old$[ebp]
	mov	ebx, 1
	mov	ecx, DWORD PTR _p$848[ebp]
	mov	cl, BYTE PTR [ecx+2]
	shl	ebx, cl
	test	DWORD PTR [edx+eax*4], ebx
	je	$L852
; Line 1180
	mov	eax, DWORD PTR _p$848[ebp]
	movsx	eax, WORD PTR [eax+2]
	mov	ecx, DWORD PTR _p$848[ebp]
	movsx	ecx, WORD PTR [ecx]
	shl	ecx, 5
	add	eax, ecx
	mov	ecx, DWORD PTR _reg_n_calls_crossed
	inc	DWORD PTR [ecx+eax*4]
; Line 1181
$L852:
	jmp	$L850
$L851:
; Line 1182
$L847:
$L834:
$L832:
; Line 1188
	cmp	DWORD PTR _final$[ebp], 0
	je	$L853
; Line 1190
	mov	DWORD PTR _i$814[ebp], 0
	jmp	$L854
$L855:
	inc	DWORD PTR _i$814[ebp]
$L854:
	mov	eax, DWORD PTR _regset_size
	cmp	DWORD PTR _i$814[ebp], eax
	jge	$L856
; Line 1192
	mov	eax, DWORD PTR _i$814[ebp]
	mov	ecx, DWORD PTR _maxlive$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	not	eax
	mov	ecx, DWORD PTR _i$814[ebp]
	mov	edx, DWORD PTR _live$[ebp]
	and	eax, DWORD PTR [edx+ecx*4]
	mov	DWORD PTR _diff$857[ebp], eax
; Line 1194
	cmp	DWORD PTR _diff$857[ebp], 0
	je	$L858
; Line 1197
	mov	eax, DWORD PTR _diff$857[ebp]
	mov	ecx, DWORD PTR _i$814[ebp]
	mov	edx, DWORD PTR _maxlive$[ebp]
	or	DWORD PTR [edx+ecx*4], eax
; Line 1198
	mov	DWORD PTR _regno$859[ebp], 0
	jmp	$L860
$L861:
	inc	DWORD PTR _regno$859[ebp]
$L860:
	cmp	DWORD PTR _diff$857[ebp], 0
	je	$L862
	cmp	DWORD PTR _regno$859[ebp], 32		; 00000020H
	jge	$L862
; Line 1199
	mov	eax, 1
	mov	cl, BYTE PTR _regno$859[ebp]
	shl	eax, cl
	test	eax, DWORD PTR _diff$857[ebp]
	je	$L863
; Line 1201
	mov	eax, DWORD PTR _i$814[ebp]
	mov	ecx, DWORD PTR _sometimes_max$[ebp]
	mov	edx, DWORD PTR _regs_sometimes_live$[ebp]
	mov	WORD PTR [edx+ecx*4], ax
; Line 1202
	mov	eax, DWORD PTR _regno$859[ebp]
	mov	ecx, DWORD PTR _sometimes_max$[ebp]
	mov	edx, DWORD PTR _regs_sometimes_live$[ebp]
	mov	WORD PTR [edx+ecx*4+2], ax
; Line 1203
	mov	eax, 1
	mov	cl, BYTE PTR _regno$859[ebp]
	shl	eax, cl
	not	eax
	and	DWORD PTR _diff$857[ebp], eax
; Line 1204
	inc	DWORD PTR _sometimes_max$[ebp]
; Line 1206
$L863:
	jmp	$L861
$L862:
; Line 1207
$L858:
	jmp	$L855
$L856:
; Line 1210
	mov	eax, DWORD PTR _regs_sometimes_live$[ebp]
	mov	DWORD PTR _p$864[ebp], eax
; Line 1211
	mov	DWORD PTR _i$814[ebp], 0
	jmp	$L865
$L866:
	inc	DWORD PTR _i$814[ebp]
	add	DWORD PTR _p$864[ebp], 4
$L865:
	mov	eax, DWORD PTR _sometimes_max$[ebp]
	cmp	DWORD PTR _i$814[ebp], eax
	jge	$L867
; Line 1213
	mov	eax, DWORD PTR _p$864[ebp]
	movsx	eax, WORD PTR [eax]
	mov	edx, DWORD PTR _old$[ebp]
	mov	ebx, 1
	mov	ecx, DWORD PTR _p$864[ebp]
	mov	cl, BYTE PTR [ecx+2]
	shl	ebx, cl
	test	DWORD PTR [edx+eax*4], ebx
	je	$L868
; Line 1214
	mov	eax, DWORD PTR _p$864[ebp]
	movsx	eax, WORD PTR [eax]
	shl	eax, 5
	mov	ecx, DWORD PTR _p$864[ebp]
	movsx	ecx, WORD PTR [ecx+2]
	add	eax, ecx
	mov	ecx, DWORD PTR _reg_live_length
	inc	DWORD PTR [ecx+eax*4]
; Line 1215
$L868:
	jmp	$L866
$L867:
; Line 1218
$L853:
; Line 1219
$L812:
$flushed$827:
; Line 1220
	mov	eax, DWORD PTR _first$[ebp]
	cmp	DWORD PTR _insn$[ebp], eax
	jne	$L869
; Line 1221
	jmp	$L806
; Line 1222
$L869:
	jmp	$L805
$L806:
; Line 1223
$L780:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_propagate_block ENDP
_TEXT	ENDS
EXTRN	_global_regs:TBYTE
_TEXT	SEGMENT
_x$ = 8
_needed$ = 12
_strict_low_ok$ = 16
_code$ = -4
_r$876 = -8
_regno$884 = -12
_offset$885 = -20
_bit$886 = -16
_i$889 = -24
_elt$893 = -28
_insn_dead_p PROC NEAR
; Line 1234
	push	ebp
	mov	ebp, esp
	sub	esp, 28					; 0000001cH
	push	ebx
	push	esi
	push	edi
; Line 1235
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$[ebp], eax
; Line 1245
	cmp	DWORD PTR _code$[ebp], 25		; 00000019H
	jne	$L875
; Line 1247
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _r$876[ebp], eax
; Line 1249
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1835008				; 001c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L877
; Line 1250
	sub	eax, eax
	jmp	$L873
; Line 1251
$L877:
; Line 1254
$L879:
	mov	eax, DWORD PTR _r$876[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L881
	cmp	DWORD PTR _strict_low_ok$[ebp], 0
	je	$L882
	mov	eax, DWORD PTR _r$876[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2359296				; 00240000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L881
$L882:
	mov	eax, DWORD PTR _r$876[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 5898240				; 005a0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L881
	mov	eax, DWORD PTR _r$876[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 5832704				; 00590000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L880
$L881:
; Line 1255
	mov	eax, DWORD PTR _r$876[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _r$876[ebp], eax
	jmp	$L879
$L880:
; Line 1256
	mov	eax, DWORD PTR _r$876[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L883
; Line 1258
	mov	eax, DWORD PTR _r$876[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _regno$884[ebp], eax
; Line 1259
	mov	eax, DWORD PTR _regno$884[ebp]
	cdq
	and	edx, 31					; 0000001fH
	add	eax, edx
	sar	eax, 5
	mov	DWORD PTR _offset$885[ebp], eax
; Line 1260
	mov	ebx, 1
	mov	eax, DWORD PTR _regno$884[ebp]
	cdq
	xor	eax, edx
	sub	eax, edx
	and	eax, 31					; 0000001fH
	xor	eax, edx
	sub	eax, edx
	mov	cl, al
	shl	ebx, cl
	mov	DWORD PTR _bit$886[ebp], ebx
; Line 1262
	cmp	DWORD PTR _regno$884[ebp], 10		; 0000000aH
	jge	$L1173
	mov	eax, DWORD PTR _regno$884[ebp]
	movsx	eax, BYTE PTR _global_regs[eax]
	or	eax, eax
	jne	$L1171
$L1173:
	mov	eax, DWORD PTR _offset$885[ebp]
	mov	ecx, DWORD PTR _needed$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	test	eax, DWORD PTR _bit$886[ebp]
	jne	$L1171
	mov	eax, 1
	jmp	$L1172
$L1171:
	sub	eax, eax
$L1172:
	jmp	$L873
; Line 1264
$L883:
; Line 1269
	jmp	$L887
$L875:
	cmp	DWORD PTR _code$[ebp], 20		; 00000014H
	jne	$L888
; Line 1271
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _i$889[ebp], eax
; Line 1272
	dec	DWORD PTR _i$889[ebp]
	jmp	$L890
$L891:
	dec	DWORD PTR _i$889[ebp]
$L890:
	cmp	DWORD PTR _i$889[ebp], 0
	jl	$L892
; Line 1274
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _i$889[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	mov	DWORD PTR _elt$893[ebp], eax
; Line 1277
	mov	eax, DWORD PTR _strict_low_ok$[ebp]
	push	eax
	mov	eax, DWORD PTR _needed$[ebp]
	push	eax
	mov	eax, DWORD PTR _elt$893[ebp]
	push	eax
	call	_insn_dead_p
	add	esp, 12					; 0000000cH
	or	eax, eax
	jne	$L894
	mov	eax, DWORD PTR _elt$893[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1769472				; 001b0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L894
	mov	eax, DWORD PTR _elt$893[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1703936				; 001a0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L894
; Line 1278
	sub	eax, eax
	jmp	$L873
; Line 1279
$L894:
	jmp	$L891
$L892:
; Line 1280
	mov	eax, 1
	jmp	$L873
; Line 1285
$L888:
$L887:
	sub	eax, eax
	jmp	$L873
; Line 1286
$L873:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_insn_dead_p ENDP
_needed$ = 12
_code$ = -4
_r$900 = -8
_regno$902 = -12
_offset$903 = -20
_bit$904 = -16
_x$ = 8
_libcall_dead_p PROC NEAR
; Line 1301
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	push	ebx
	push	esi
	push	edi
; Line 1302
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$[ebp], eax
; Line 1304
	cmp	DWORD PTR _code$[ebp], 25		; 00000019H
	jne	$L899
; Line 1306
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _r$900[ebp], eax
; Line 1307
	mov	eax, DWORD PTR _r$900[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L901
; Line 1309
	mov	eax, DWORD PTR _r$900[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _regno$902[ebp], eax
; Line 1310
	mov	eax, DWORD PTR _regno$902[ebp]
	cdq
	and	edx, 31					; 0000001fH
	add	eax, edx
	sar	eax, 5
	mov	DWORD PTR _offset$903[ebp], eax
; Line 1311
	mov	ebx, 1
	mov	eax, DWORD PTR _regno$902[ebp]
	cdq
	xor	eax, edx
	sub	eax, edx
	and	eax, 31					; 0000001fH
	xor	eax, edx
	sub	eax, edx
	mov	cl, al
	shl	ebx, cl
	mov	DWORD PTR _bit$904[ebp], ebx
; Line 1312
	mov	eax, DWORD PTR _offset$903[ebp]
	mov	ecx, DWORD PTR _needed$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	and	eax, DWORD PTR _bit$904[ebp]
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	jmp	$L897
; Line 1314
$L901:
; Line 1315
$L899:
	mov	eax, 1
	jmp	$L897
; Line 1316
$L897:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_libcall_dead_p ENDP
_TEXT	ENDS
PUBLIC	_regno_uninitialized
_TEXT	SEGMENT
_regno$ = 8
_regno_uninitialized PROC NEAR
; Line 1324
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1325
	cmp	DWORD PTR _n_basic_blocks, 0
	jne	$L908
; Line 1326
	sub	eax, eax
	jmp	$L907
; Line 1328
$L908:
; Line 1329
	mov	eax, DWORD PTR _regno$[ebp]
	cdq
	and	edx, 31					; 0000001fH
	add	eax, edx
	sar	eax, 5
	mov	ecx, DWORD PTR _basic_block_live_at_start
	mov	ecx, DWORD PTR [ecx]
	mov	ebx, DWORD PTR [ecx+eax*4]
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
	and	ebx, esi
	mov	eax, ebx
	jmp	$L907
; Line 1330
$L907:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_regno_uninitialized ENDP
_TEXT	ENDS
PUBLIC	_regno_clobbered_at_setjmp
_TEXT	SEGMENT
_regno$ = 8
_regno_clobbered_at_setjmp PROC NEAR
; Line 1338
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1341
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _reg_n_sets
	movsx	eax, WORD PTR [ecx+eax*2]
	cmp	eax, 1
	jle	$L1174
	mov	eax, DWORD PTR _regno$[ebp]
	cdq
	and	edx, 31					; 0000001fH
	add	eax, edx
	sar	eax, 5
	mov	ecx, DWORD PTR _regs_live_at_setjmp
	mov	ebx, DWORD PTR [ecx+eax*4]
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
	je	$L1174
	mov	eax, 1
	jmp	$L1175
$L1174:
	sub	eax, eax
$L1175:
	jmp	$L911
; Line 1342
$L911:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_regno_clobbered_at_setjmp ENDP
_needed$ = 8
_dead$ = 12
_x$ = 16
_insn$ = 20
_significant$ = 24
_code$ = -4
_i$924 = -8
_mark_set_regs PROC NEAR
; Line 1362
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 1363
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$[ebp], eax
; Line 1365
	cmp	DWORD PTR _code$[ebp], 25		; 00000019H
	je	$L921
	cmp	DWORD PTR _code$[ebp], 27		; 0000001bH
	jne	$L920
$L921:
; Line 1366
	mov	eax, DWORD PTR _significant$[ebp]
	push	eax
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	mov	eax, DWORD PTR _dead$[ebp]
	push	eax
	mov	eax, DWORD PTR _needed$[ebp]
	push	eax
	call	_mark_set_1
	add	esp, 20					; 00000014H
; Line 1367
	jmp	$L922
$L920:
	cmp	DWORD PTR _code$[ebp], 20		; 00000014H
	jne	$L923
; Line 1370
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	dec	eax
	mov	DWORD PTR _i$924[ebp], eax
	jmp	$L925
$L926:
	dec	DWORD PTR _i$924[ebp]
$L925:
	cmp	DWORD PTR _i$924[ebp], 0
	jl	$L927
; Line 1372
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _i$924[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$[ebp], eax
; Line 1373
	cmp	DWORD PTR _code$[ebp], 25		; 00000019H
	je	$L929
	cmp	DWORD PTR _code$[ebp], 27		; 0000001bH
	jne	$L928
$L929:
; Line 1374
	mov	eax, DWORD PTR _significant$[ebp]
	push	eax
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _i$924[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	push	eax
	mov	eax, DWORD PTR _dead$[ebp]
	push	eax
	mov	eax, DWORD PTR _needed$[ebp]
	push	eax
	call	_mark_set_1
	add	esp, 20					; 00000014H
; Line 1375
$L928:
	jmp	$L926
$L927:
; Line 1377
$L923:
$L922:
$L918:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_mark_set_regs ENDP
_TEXT	ENDS
EXTRN	_gen_rtx:NEAR
EXTRN	_mode_size:BYTE
_TEXT	SEGMENT
_y$961 = -32
_blocknum$962 = -36
_i$964 = -40
_needed$ = 8
_dead$ = 12
_x$ = 16
_insn$ = 20
_significant$ = 24
_regno$ = -4
_reg$ = -8
_subreg_p$ = -12
_offset$948 = -24
_bit$949 = -16
_is_needed$950 = -20
_n$954 = -28
_mark_set_1 PROC NEAR
; Line 1388
	push	ebp
	mov	ebp, esp
	sub	esp, 44					; 0000002cH
	push	ebx
	push	esi
	push	edi
; Line 1390
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _reg$[ebp], eax
; Line 1391
	mov	DWORD PTR _subreg_p$[ebp], 0
; Line 1393
	cmp	DWORD PTR _reg$[ebp], 0
	jne	$L939
; Line 1394
	jmp	$L935
; Line 1400
$L939:
; Line 1402
$L941:
	mov	eax, DWORD PTR _reg$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L943
	mov	eax, DWORD PTR _reg$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 5898240				; 005a0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L943
	mov	eax, DWORD PTR _reg$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 5832704				; 00590000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L943
	mov	eax, DWORD PTR _reg$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2359296				; 00240000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L942
$L943:
; Line 1407
	mov	eax, DWORD PTR _reg$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 5898240				; 005a0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L945
	mov	eax, DWORD PTR _reg$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 5832704				; 00590000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L945
	mov	eax, DWORD PTR _reg$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L944
	mov	eax, DWORD PTR _reg$[ebp]
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
	mov	ecx, eax
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
	cmp	ecx, eax
	jle	$L944
$L945:
; Line 1408
	mov	DWORD PTR _subreg_p$[ebp], 1
; Line 1410
$L944:
	mov	eax, DWORD PTR _reg$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _reg$[ebp], eax
; Line 1411
	jmp	$L941
$L942:
; Line 1416
	mov	eax, DWORD PTR _reg$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L946
	mov	eax, DWORD PTR _reg$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _regno$[ebp], eax
	mov	eax, DWORD PTR _regno$[ebp]
	sub	eax, 6
	cmp	eax, 1
	sbb	eax, eax
	inc	eax
	mov	DWORD PTR -44+[ebp], eax
	cmp	DWORD PTR -44+[ebp], 0
	je	$L946
	cmp	DWORD PTR _regno$[ebp], 6
	je	$L946
	cmp	DWORD PTR _regno$[ebp], 10		; 0000000aH
	jge	$L947
	mov	eax, DWORD PTR _regno$[ebp]
	movsx	eax, BYTE PTR _global_regs[eax]
	or	eax, eax
	jne	$L946
$L947:
; Line 1419
	mov	eax, DWORD PTR _regno$[ebp]
	cdq
	and	edx, 31					; 0000001fH
	add	eax, edx
	sar	eax, 5
	mov	DWORD PTR _offset$948[ebp], eax
; Line 1420
	mov	ebx, 1
	mov	eax, DWORD PTR _regno$[ebp]
	cdq
	xor	eax, edx
	sub	eax, edx
	and	eax, 31					; 0000001fH
	xor	eax, edx
	sub	eax, edx
	mov	cl, al
	shl	ebx, cl
	mov	DWORD PTR _bit$949[ebp], ebx
; Line 1421
	mov	DWORD PTR _is_needed$950[ebp], 0
; Line 1424
	cmp	DWORD PTR _significant$[ebp], 0
	je	$L951
; Line 1425
	mov	eax, DWORD PTR _bit$949[ebp]
	mov	ecx, DWORD PTR _offset$948[ebp]
	mov	edx, DWORD PTR _significant$[ebp]
	or	DWORD PTR [edx+ecx*4], eax
; Line 1427
$L951:
	cmp	DWORD PTR _subreg_p$[ebp], 0
	je	$L952
; Line 1428
	jmp	$L935
; Line 1431
$L952:
	mov	eax, DWORD PTR _bit$949[ebp]
	mov	ecx, DWORD PTR _offset$948[ebp]
	mov	edx, DWORD PTR _dead$[ebp]
	or	DWORD PTR [edx+ecx*4], eax
; Line 1434
	cmp	DWORD PTR _regno$[ebp], 10		; 0000000aH
	jge	$L953
; Line 1440
	cmp	DWORD PTR _regno$[ebp], 7
	jne	$L955
; Line 1441
	jmp	$L935
; Line 1443
$L955:
	cmp	DWORD PTR _regno$[ebp], 8
	jl	$L1176
	mov	DWORD PTR _n$954[ebp], 1
	jmp	$L1177
$L1176:
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
	mov	DWORD PTR _n$954[ebp], eax
$L1177:
; Line 1444
$L957:
	dec	DWORD PTR _n$954[ebp]
	cmp	DWORD PTR _n$954[ebp], 0
	jle	$L958
; Line 1447
	mov	ebx, 1
	mov	eax, DWORD PTR _n$954[ebp]
	add	eax, DWORD PTR _regno$[ebp]
	cdq
	xor	eax, edx
	sub	eax, edx
	and	eax, 31					; 0000001fH
	xor	eax, edx
	sub	eax, edx
	mov	cl, al
	shl	ebx, cl
	mov	eax, DWORD PTR _n$954[ebp]
	add	eax, DWORD PTR _regno$[ebp]
	cdq
	and	edx, 31					; 0000001fH
	add	eax, edx
	sar	eax, 5
	mov	ecx, DWORD PTR _dead$[ebp]
	or	DWORD PTR [ecx+eax*4], ebx
; Line 1448
	cmp	DWORD PTR _significant$[ebp], 0
	je	$L959
; Line 1450
	mov	ebx, 1
	mov	eax, DWORD PTR _n$954[ebp]
	add	eax, DWORD PTR _regno$[ebp]
	cdq
	xor	eax, edx
	sub	eax, edx
	and	eax, 31					; 0000001fH
	xor	eax, edx
	sub	eax, edx
	mov	cl, al
	shl	ebx, cl
	mov	eax, DWORD PTR _n$954[ebp]
	add	eax, DWORD PTR _regno$[ebp]
	cdq
	and	edx, 31					; 0000001fH
	add	eax, edx
	sar	eax, 5
	mov	ecx, DWORD PTR _significant$[ebp]
	or	DWORD PTR [ecx+eax*4], ebx
; Line 1451
$L959:
; Line 1452
	mov	eax, DWORD PTR _n$954[ebp]
	add	eax, DWORD PTR _regno$[ebp]
	cdq
	and	edx, 31					; 0000001fH
	add	eax, edx
	sar	eax, 5
	mov	ecx, DWORD PTR _needed$[ebp]
	mov	ebx, DWORD PTR [ecx+eax*4]
	mov	esi, 1
	mov	eax, DWORD PTR _n$954[ebp]
	add	eax, DWORD PTR _regno$[ebp]
	cdq
	xor	eax, edx
	sub	eax, edx
	and	eax, 31					; 0000001fH
	xor	eax, edx
	sub	eax, edx
	mov	cl, al
	shl	esi, cl
	and	ebx, esi
	or	DWORD PTR _is_needed$950[ebp], ebx
; Line 1453
	jmp	$L957
$L958:
; Line 1456
$L953:
	cmp	DWORD PTR _insn$[ebp], 0
	je	$L960
; Line 1458
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _reg_next_use$S543
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _y$961[ebp], eax
; Line 1459
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _uid_block_number$S541
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	DWORD PTR _blocknum$962[ebp], eax
; Line 1465
	cmp	DWORD PTR _regno$[ebp], 10		; 0000000aH
	jge	$L963
; Line 1468
	cmp	DWORD PTR _regno$[ebp], 8
	jl	$L1178
	mov	DWORD PTR _i$964[ebp], 1
	jmp	$L1179
$L1178:
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
	mov	DWORD PTR _i$964[ebp], eax
$L1179:
; Line 1469
	cmp	DWORD PTR _i$964[ebp], 0
	jne	$L965
; Line 1470
	mov	DWORD PTR _i$964[ebp], 1
; Line 1471
$L965:
$L966:
; Line 1472
	dec	DWORD PTR _i$964[ebp]
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _i$964[ebp]
	mov	BYTE PTR _regs_ever_live[eax+ecx], 1
; Line 1473
$L967:
	cmp	DWORD PTR _i$964[ebp], 0
	jg	$L966
$L968:
; Line 1475
	mov	eax, DWORD PTR _offset$948[ebp]
	mov	ecx, DWORD PTR _needed$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	test	eax, DWORD PTR _bit$949[ebp]
	jne	$L969
	cmp	DWORD PTR _is_needed$950[ebp], 0
	jne	$L969
; Line 1483
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	mov	eax, DWORD PTR _reg$[ebp]
	push	eax
	push	1
	push	2
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 1484
	mov	eax, DWORD PTR _reg$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg_n_deaths
	inc	WORD PTR [ecx+eax*2]
; Line 1486
$L969:
	jmp	$L935
; Line 1491
$L963:
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _reg_basic_block
	movsx	eax, WORD PTR [ecx+eax*2]
	cmp	eax, -1
	jne	$L970
; Line 1492
	mov	eax, DWORD PTR _blocknum$962[ebp]
	mov	ecx, DWORD PTR _regno$[ebp]
	mov	edx, DWORD PTR _reg_basic_block
	mov	WORD PTR [edx+ecx*2], ax
; Line 1493
	jmp	$L971
$L970:
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _reg_basic_block
	movsx	eax, WORD PTR [ecx+eax*2]
	cmp	eax, DWORD PTR _blocknum$962[ebp]
	je	$L972
; Line 1494
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _reg_basic_block
	mov	WORD PTR [ecx+eax*2], -2		; fffffffeH
; Line 1497
$L972:
$L971:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	ecx, DWORD PTR _regno$[ebp]
	mov	edx, DWORD PTR _reg_first_use
	mov	DWORD PTR [edx+ecx*4], eax
; Line 1500
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _reg_n_refs
	movsx	eax, WORD PTR [ecx+eax*2]
	add	eax, DWORD PTR _loop_depth$S548
	mov	ecx, DWORD PTR _regno$[ebp]
	mov	edx, DWORD PTR _reg_n_refs
	mov	WORD PTR [edx+ecx*2], ax
; Line 1501
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _reg_n_sets
	inc	WORD PTR [ecx+eax*2]
; Line 1503
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _reg_next_use$S543
	mov	DWORD PTR [ecx+eax*4], 0
; Line 1507
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _reg_live_length
	inc	DWORD PTR [ecx+eax*4]
; Line 1508
	mov	eax, DWORD PTR _offset$948[ebp]
	mov	ecx, DWORD PTR _needed$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	test	eax, DWORD PTR _bit$949[ebp]
	jne	$L974
	cmp	DWORD PTR _is_needed$950[ebp], 0
	je	$L973
$L974:
; Line 1513
	cmp	DWORD PTR _y$961[ebp], 0
	je	$L975
	mov	eax, DWORD PTR _y$961[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _uid_block_number$S541
	movsx	eax, WORD PTR [ecx+eax*2]
	cmp	eax, DWORD PTR _blocknum$962[ebp]
	jne	$L975
; Line 1515
	mov	eax, DWORD PTR _y$961[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	push	0
	push	3
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	ecx, DWORD PTR _y$961[ebp]
	mov	DWORD PTR [ecx+24], eax
; Line 1516
$L975:
; Line 1517
	jmp	$L976
$L973:
; Line 1525
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	mov	eax, DWORD PTR _reg$[ebp]
	push	eax
	push	1
	push	2
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 1526
	mov	eax, DWORD PTR _reg$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg_n_deaths
	inc	WORD PTR [ecx+eax*2]
; Line 1527
$L976:
; Line 1529
$L960:
; Line 1530
$L946:
$L935:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_mark_set_1 ENDP
_TEXT	ENDS
EXTRN	_find_regno_note:NEAR
_TEXT	SEGMENT
_offset$1029 = -48
_bit$1030 = -44
_fmt$1034 = -56
_i$1035 = -52
_needed$ = 8
_live$ = 12
_j$1043 = -60
_x$ = 16
_final$ = 20
_insn$ = 24
_code$ = -8
_regno$ = -4
_offset$993 = -20
_bit$994 = -12
_is_needed$995 = -16
_n$997 = -24
_i$1006 = -28
_blocknum$1012 = -32
_testreg$1019 = -40
_mark_dest$1020 = -36
_mark_used_regs PROC NEAR
; Line 1548
	push	ebp
	mov	ebp, esp
	sub	esp, 68					; 00000044H
	push	ebx
	push	esi
	push	edi
; Line 1552
$retry$985:
; Line 1553
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$[ebp], eax
; Line 1554
	mov	eax, DWORD PTR _code$[ebp]
	mov	DWORD PTR -68+[ebp], eax
	jmp	$L986
; Line 1556
$L990:
; Line 1567
	jmp	$L982
; Line 1645
$L991:
; Line 1649
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _regno$[ebp], eax
; Line 1650
	cmp	DWORD PTR _regno$[ebp], 6
	je	$L992
; Line 1654
	mov	eax, DWORD PTR _regno$[ebp]
	cdq
	and	edx, 31					; 0000001fH
	add	eax, edx
	sar	eax, 5
	mov	DWORD PTR _offset$993[ebp], eax
; Line 1655
	mov	ebx, 1
	mov	eax, DWORD PTR _regno$[ebp]
	cdq
	xor	eax, edx
	sub	eax, edx
	and	eax, 31					; 0000001fH
	xor	eax, edx
	sub	eax, edx
	mov	cl, al
	shl	ebx, cl
	mov	DWORD PTR _bit$994[ebp], ebx
; Line 1656
	mov	DWORD PTR _is_needed$995[ebp], 0
; Line 1658
	mov	eax, DWORD PTR _bit$994[ebp]
	mov	ecx, DWORD PTR _offset$993[ebp]
	mov	edx, DWORD PTR _live$[ebp]
	or	DWORD PTR [edx+ecx*4], eax
; Line 1661
	cmp	DWORD PTR _regno$[ebp], 10		; 0000000aH
	jge	$L996
; Line 1668
	cmp	DWORD PTR _regno$[ebp], 7
	je	$L999
	cmp	DWORD PTR _regno$[ebp], 6
	jne	$L998
$L999:
; Line 1669
	jmp	$L982
; Line 1672
$L998:
	mov	eax, DWORD PTR _regno$[ebp]
	movsx	eax, BYTE PTR _global_regs[eax]
	or	eax, eax
	je	$L1000
; Line 1673
	jmp	$L982
; Line 1675
$L1000:
	cmp	DWORD PTR _regno$[ebp], 8
	jl	$L1180
	mov	DWORD PTR _n$997[ebp], 1
	jmp	$L1181
$L1180:
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
	mov	DWORD PTR _n$997[ebp], eax
$L1181:
; Line 1676
$L1002:
	dec	DWORD PTR _n$997[ebp]
	cmp	DWORD PTR _n$997[ebp], 0
	jle	$L1003
; Line 1679
	mov	ebx, 1
	mov	eax, DWORD PTR _regno$[ebp]
	add	eax, DWORD PTR _n$997[ebp]
	cdq
	xor	eax, edx
	sub	eax, edx
	and	eax, 31					; 0000001fH
	xor	eax, edx
	sub	eax, edx
	mov	cl, al
	shl	ebx, cl
	mov	eax, DWORD PTR _regno$[ebp]
	add	eax, DWORD PTR _n$997[ebp]
	cdq
	and	edx, 31					; 0000001fH
	add	eax, edx
	sar	eax, 5
	mov	ecx, DWORD PTR _live$[ebp]
	or	DWORD PTR [ecx+eax*4], ebx
; Line 1681
	mov	eax, DWORD PTR _regno$[ebp]
	add	eax, DWORD PTR _n$997[ebp]
	cdq
	and	edx, 31					; 0000001fH
	add	eax, edx
	sar	eax, 5
	mov	ecx, DWORD PTR _needed$[ebp]
	mov	ebx, DWORD PTR [ecx+eax*4]
	mov	esi, 1
	mov	eax, DWORD PTR _regno$[ebp]
	add	eax, DWORD PTR _n$997[ebp]
	cdq
	xor	eax, edx
	sub	eax, edx
	and	eax, 31					; 0000001fH
	xor	eax, edx
	sub	eax, edx
	mov	cl, al
	shl	esi, cl
	and	ebx, esi
	or	DWORD PTR _is_needed$995[ebp], ebx
; Line 1682
	jmp	$L1002
$L1003:
; Line 1684
$L996:
	cmp	DWORD PTR _final$[ebp], 0
	je	$L1004
; Line 1686
	cmp	DWORD PTR _regno$[ebp], 10		; 0000000aH
	jge	$L1005
; Line 1692
	cmp	DWORD PTR _regno$[ebp], 8
	jl	$L1182
	mov	DWORD PTR _i$1006[ebp], 1
	jmp	$L1183
$L1182:
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
	mov	DWORD PTR _i$1006[ebp], eax
$L1183:
; Line 1693
	cmp	DWORD PTR _i$1006[ebp], 0
	jne	$L1007
; Line 1694
	mov	DWORD PTR _i$1006[ebp], 1
; Line 1695
$L1007:
$L1008:
; Line 1696
	dec	DWORD PTR _i$1006[ebp]
	mov	eax, DWORD PTR _i$1006[ebp]
	mov	ecx, DWORD PTR _regno$[ebp]
	mov	BYTE PTR _regs_ever_live[eax+ecx], 1
; Line 1697
$L1009:
	cmp	DWORD PTR _i$1006[ebp], 0
	jg	$L1008
$L1010:
; Line 1699
	jmp	$L1011
$L1005:
; Line 1703
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _uid_block_number$S541
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	DWORD PTR _blocknum$1012[ebp], eax
; Line 1705
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _reg_basic_block
	movsx	eax, WORD PTR [ecx+eax*2]
	cmp	eax, -1
	jne	$L1013
; Line 1706
	mov	eax, DWORD PTR _blocknum$1012[ebp]
	mov	ecx, DWORD PTR _regno$[ebp]
	mov	edx, DWORD PTR _reg_basic_block
	mov	WORD PTR [edx+ecx*2], ax
; Line 1707
	jmp	$L1014
$L1013:
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _reg_basic_block
	movsx	eax, WORD PTR [ecx+eax*2]
	cmp	eax, DWORD PTR _blocknum$1012[ebp]
	je	$L1015
; Line 1708
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _reg_basic_block
	mov	WORD PTR [ecx+eax*2], -2		; fffffffeH
; Line 1715
$L1015:
$L1014:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	ecx, DWORD PTR _regno$[ebp]
	mov	edx, DWORD PTR _reg_first_use
	mov	DWORD PTR [edx+ecx*4], eax
; Line 1720
	mov	eax, DWORD PTR _insn$[ebp]
	mov	ecx, DWORD PTR _regno$[ebp]
	mov	edx, DWORD PTR _reg_next_use$S543
	mov	DWORD PTR [edx+ecx*4], eax
; Line 1724
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _reg_n_refs
	movsx	eax, WORD PTR [ecx+eax*2]
	add	eax, DWORD PTR _loop_depth$S548
	mov	ecx, DWORD PTR _regno$[ebp]
	mov	edx, DWORD PTR _reg_n_refs
	mov	WORD PTR [edx+ecx*2], ax
; Line 1725
$L1011:
; Line 1732
	mov	eax, DWORD PTR _offset$993[ebp]
	mov	ecx, DWORD PTR _needed$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	test	eax, DWORD PTR _bit$994[ebp]
	jne	$L1017
	cmp	DWORD PTR _is_needed$995[ebp], 0
	jne	$L1017
	mov	eax, DWORD PTR _regno$[ebp]
	push	eax
	push	1
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_find_regno_note
	add	esp, 12					; 0000000cH
	or	eax, eax
	jne	$L1017
; Line 1735
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	push	1
	push	2
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 1736
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _reg_n_deaths
	inc	WORD PTR [ecx+eax*2]
; Line 1738
$L1017:
; Line 1739
$L1004:
; Line 1740
$L992:
	jmp	$L982
; Line 1742
$L1018:
; Line 1744
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _testreg$1019[ebp], eax
; Line 1745
	mov	DWORD PTR _mark_dest$1020[ebp], 0
; Line 1756
$L1022:
	mov	eax, DWORD PTR _testreg$1019[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2359296				; 00240000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1024
	mov	eax, DWORD PTR _testreg$1019[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 5898240				; 005a0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1024
	mov	eax, DWORD PTR _testreg$1019[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 5832704				; 00590000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1024
	mov	eax, DWORD PTR _testreg$1019[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1023
$L1024:
; Line 1762
	mov	eax, DWORD PTR _testreg$1019[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1025
	mov	eax, DWORD PTR _testreg$1019[ebp]
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
	mov	ecx, eax
	mov	eax, DWORD PTR _testreg$1019[ebp]
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
	cmp	ecx, eax
	jg	$L1025
; Line 1764
	jmp	$L1026
$L1025:
; Line 1765
	mov	DWORD PTR _mark_dest$1020[ebp], 1
$L1026:
; Line 1767
	mov	eax, DWORD PTR _testreg$1019[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _testreg$1019[ebp], eax
; Line 1768
	jmp	$L1022
$L1023:
; Line 1779
	mov	eax, DWORD PTR _testreg$1019[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1027
	mov	eax, DWORD PTR _testreg$1019[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _regno$[ebp], eax
	mov	eax, DWORD PTR _regno$[ebp]
	sub	eax, 6
	cmp	eax, 1
	sbb	eax, eax
	inc	eax
	mov	DWORD PTR -64+[ebp], eax
	cmp	DWORD PTR -64+[ebp], 0
	je	$L1027
	cmp	DWORD PTR _regno$[ebp], 6
	je	$L1027
	cmp	DWORD PTR _regno$[ebp], 10		; 0000000aH
	jge	$L1028
	mov	eax, DWORD PTR _regno$[ebp]
	movsx	eax, BYTE PTR _global_regs[eax]
	or	eax, eax
	jne	$L1027
$L1028:
; Line 1786
	mov	eax, DWORD PTR _regno$[ebp]
	cdq
	and	edx, 31					; 0000001fH
	add	eax, edx
	sar	eax, 5
	mov	DWORD PTR _offset$1029[ebp], eax
; Line 1787
	mov	ebx, 1
	mov	eax, DWORD PTR _regno$[ebp]
	cdq
	xor	eax, edx
	sub	eax, edx
	and	eax, 31					; 0000001fH
	xor	eax, edx
	sub	eax, edx
	mov	cl, al
	shl	ebx, cl
	mov	DWORD PTR _bit$1030[ebp], ebx
; Line 1791
	mov	eax, DWORD PTR _offset$1029[ebp]
	mov	ecx, DWORD PTR _needed$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	test	eax, DWORD PTR _bit$1030[ebp]
	jne	$L1032
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _uid_volatile$S542
	movsx	eax, BYTE PTR [eax+ecx]
	or	eax, eax
	je	$L1031
$L1032:
; Line 1793
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _final$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _live$[ebp]
	push	eax
	mov	eax, DWORD PTR _needed$[ebp]
	push	eax
	call	_mark_used_regs
	add	esp, 20					; 00000014H
; Line 1794
	cmp	DWORD PTR _mark_dest$1020[ebp], 0
	je	$L1033
; Line 1795
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _final$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _live$[ebp]
	push	eax
	mov	eax, DWORD PTR _needed$[ebp]
	push	eax
	call	_mark_used_regs
	add	esp, 20					; 00000014H
; Line 1796
$L1033:
; Line 1797
$L1031:
	jmp	$L982
; Line 1799
$L1027:
; Line 1800
	jmp	$L987
; Line 1801
	jmp	$L987
$L986:
	sub	DWORD PTR -68+[ebp], 21			; 00000015H
	cmp	DWORD PTR -68+[ebp], 19			; 00000013H
	ja	$L987
	shl	DWORD PTR -68+[ebp], 2
	mov	eax, DWORD PTR -68+[ebp]
	jmp	DWORD PTR $L1184[eax]
$L1184:
	DD	OFFSET $L990
	DD	OFFSET $L987
	DD	OFFSET $L990
	DD	OFFSET $L990
	DD	OFFSET $L1018
	DD	OFFSET $L987
	DD	OFFSET $L990
	DD	OFFSET $L987
	DD	OFFSET $L987
	DD	OFFSET $L990
	DD	OFFSET $L990
	DD	OFFSET $L990
	DD	OFFSET $L990
	DD	OFFSET $L991
	DD	OFFSET $L987
	DD	OFFSET $L987
	DD	OFFSET $L987
	DD	OFFSET $L990
	DD	OFFSET $L990
	DD	OFFSET $L990
$L987:
; Line 1806
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_format[eax*4]
	mov	DWORD PTR _fmt$1034[ebp], eax
; Line 1809
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_length[eax*4]
	dec	eax
	mov	DWORD PTR _i$1035[ebp], eax
	jmp	$L1036
$L1037:
	dec	DWORD PTR _i$1035[ebp]
$L1036:
	cmp	DWORD PTR _i$1035[ebp], 0
	jl	$L1038
; Line 1811
	mov	eax, DWORD PTR _i$1035[ebp]
	mov	ecx, DWORD PTR _fmt$1034[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 101				; 00000065H
	jne	$L1039
; Line 1814
	cmp	DWORD PTR _i$1035[ebp], 0
	jne	$L1040
; Line 1816
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x$[ebp], eax
; Line 1817
	jmp	$retry$985
; Line 1819
$L1040:
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _final$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$1035[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	push	eax
	mov	eax, DWORD PTR _live$[ebp]
	push	eax
	mov	eax, DWORD PTR _needed$[ebp]
	push	eax
	call	_mark_used_regs
	add	esp, 20					; 00000014H
; Line 1821
	jmp	$L1041
$L1039:
	mov	eax, DWORD PTR _i$1035[ebp]
	mov	ecx, DWORD PTR _fmt$1034[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 69					; 00000045H
	jne	$L1042
; Line 1824
	mov	DWORD PTR _j$1043[ebp], 0
	jmp	$L1044
$L1045:
	inc	DWORD PTR _j$1043[ebp]
$L1044:
	mov	eax, DWORD PTR _i$1035[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$1043[ebp]
	cmp	DWORD PTR [eax], ecx
	jbe	$L1046
; Line 1825
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _final$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$1035[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$1043[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	push	eax
	mov	eax, DWORD PTR _live$[ebp]
	push	eax
	mov	eax, DWORD PTR _needed$[ebp]
	push	eax
	call	_mark_used_regs
	add	esp, 20					; 00000014H
	jmp	$L1045
$L1046:
; Line 1827
$L1042:
$L1041:
	jmp	$L1037
$L1038:
; Line 1829
$L982:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_mark_used_regs ENDP
_x$ = 8
_reg$ = 12
_plusconst$ = 16
_code$ = -20
_fmt$ = -12
_i$ = -4
_value$ = -16
_tem$ = -8
_j$1070 = -24
_find_use_as_address PROC NEAR
; Line 1962
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	push	ebx
	push	esi
	push	edi
; Line 1963
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$[ebp], eax
; Line 1964
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_format[eax*4]
	mov	DWORD PTR _fmt$[ebp], eax
; Line 1966
	mov	DWORD PTR _value$[ebp], 0
; Line 1969
	cmp	DWORD PTR _code$[ebp], 37		; 00000025H
	jne	$L1056
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR _reg$[ebp]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L1056
	cmp	DWORD PTR _plusconst$[ebp], 0
	jne	$L1056
; Line 1970
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L1050
; Line 1972
$L1056:
; Line 1975
	cmp	DWORD PTR _code$[ebp], 37		; 00000025H
	jne	$L1057
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1057
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg$[ebp]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L1057
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1057
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _plusconst$[ebp]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L1057
; Line 1976
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L1050
; Line 1978
$L1057:
	cmp	DWORD PTR _code$[ebp], 89		; 00000059H
	je	$L1059
	cmp	DWORD PTR _code$[ebp], 90		; 0000005aH
	jne	$L1058
$L1059:
; Line 1982
	push	0
	mov	eax, DWORD PTR _reg$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_find_use_as_address
	add	esp, 12					; 0000000cH
	or	eax, eax
	je	$L1060
; Line 1983
	mov	eax, 1
	jmp	$L1050
; Line 1984
$L1060:
; Line 1986
$L1058:
	mov	eax, DWORD PTR _x$[ebp]
	cmp	DWORD PTR _reg$[ebp], eax
	jne	$L1061
; Line 1987
	mov	eax, 1
	jmp	$L1050
; Line 1989
$L1061:
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_length[eax*4]
	dec	eax
	mov	DWORD PTR _i$[ebp], eax
	jmp	$L1062
$L1063:
	dec	DWORD PTR _i$[ebp]
$L1062:
	cmp	DWORD PTR _i$[ebp], 0
	jl	$L1064
; Line 1991
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 101				; 00000065H
	jne	$L1065
; Line 1993
	mov	eax, DWORD PTR _plusconst$[ebp]
	push	eax
	mov	eax, DWORD PTR _reg$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	push	eax
	call	_find_use_as_address
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _tem$[ebp], eax
; Line 1994
	cmp	DWORD PTR _value$[ebp], 0
	jne	$L1066
; Line 1995
	mov	eax, DWORD PTR _tem$[ebp]
	mov	DWORD PTR _value$[ebp], eax
; Line 1996
	jmp	$L1067
$L1066:
	cmp	DWORD PTR _tem$[ebp], 0
	je	$L1068
; Line 1997
	mov	eax, 1
	jmp	$L1050
; Line 1998
$L1068:
$L1067:
; Line 1999
$L1065:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 69					; 00000045H
	jne	$L1069
; Line 2002
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	eax, DWORD PTR [eax]
	dec	eax
	mov	DWORD PTR _j$1070[ebp], eax
	jmp	$L1071
$L1072:
	dec	DWORD PTR _j$1070[ebp]
$L1071:
	cmp	DWORD PTR _j$1070[ebp], 0
	jl	$L1073
; Line 2004
	mov	eax, DWORD PTR _plusconst$[ebp]
	push	eax
	mov	eax, DWORD PTR _reg$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$1070[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	push	eax
	call	_find_use_as_address
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _tem$[ebp], eax
; Line 2005
	cmp	DWORD PTR _value$[ebp], 0
	jne	$L1074
; Line 2006
	mov	eax, DWORD PTR _tem$[ebp]
	mov	DWORD PTR _value$[ebp], eax
; Line 2007
	jmp	$L1075
$L1074:
	cmp	DWORD PTR _tem$[ebp], 0
	je	$L1076
; Line 2008
	mov	eax, 1
	jmp	$L1050
; Line 2009
$L1076:
$L1075:
	jmp	$L1072
$L1073:
; Line 2011
$L1069:
	jmp	$L1063
$L1064:
; Line 2013
	mov	eax, DWORD PTR _value$[ebp]
	jmp	$L1050
; Line 2014
$L1050:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_find_use_as_address ENDP
_TEXT	ENDS
EXTRN	_fprintf:NEAR
EXTRN	_reg_preferred_or_nothing:NEAR
EXTRN	_regno_pointer_flag:DWORD
EXTRN	_reg_preferred_class:NEAR
_DATA	SEGMENT
$SG1082	DB	'NO_REGS', 00H
$SG1083	DB	'AREG', 00H
	ORG $+3
$SG1084	DB	'DREG', 00H
	ORG $+3
$SG1085	DB	'ADREG', 00H
	ORG $+2
$SG1086	DB	'CREG', 00H
	ORG $+3
$SG1087	DB	'BREG', 00H
	ORG $+3
$SG1088	DB	'Q_REGS', 00H
	ORG $+1
$SG1089	DB	'SIREG', 00H
	ORG $+2
$SG1090	DB	'DIREG', 00H
	ORG $+2
$SG1091	DB	'INDEX_REGS', 00H
	ORG $+1
$SG1092	DB	'GENERAL_REGS', 00H
	ORG $+3
$SG1093	DB	'FLOAT_REGS', 00H
	ORG $+1
$SG1094	DB	'ALL_REGS', 00H
	ORG $+7
_?reg_class_names@?1??dump_flow_info@@9@9$S1081 DD $SG1082
	DD	$SG1083
	DD	$SG1084
	DD	$SG1085
	DD	$SG1086
	DD	$SG1087
	DD	$SG1088
	DD	$SG1089
	DD	$SG1090
	DD	$SG1091
	DD	$SG1092
	DD	$SG1093
	DD	$SG1094
$SG1095	DB	'%d registers.', 0aH, 00H
	ORG $+1
$SG1101	DB	0aH, 'Register %d used %d times across %d insns', 00H
	ORG $+1
$SG1103	DB	' in block %d', 00H
	ORG $+3
$SG1105	DB	'; dies in %d places', 00H
$SG1107	DB	'; crosses 1 call', 00H
	ORG $+3
$SG1110	DB	'; crosses %d calls', 00H
	ORG $+1
$SG1112	DB	'; %d bytes', 00H
	ORG $+1
$SG1116	DB	'; %s or none', 00H
	ORG $+3
$SG1118	DB	'; pref %s', 00H
	ORG $+2
$SG1120	DB	'; pointer', 00H
	ORG $+2
$SG1121	DB	'.', 0aH, 00H
	ORG $+1
$SG1122	DB	0aH, '%d basic blocks.', 0aH, 00H
	ORG $+1
$SG1129	DB	0aH, 'Basic block %d: first insn %d, last %d.', 0aH, 00H
	ORG $+2
$SG1131	DB	'Reached from blocks: ', 00H
	ORG $+2
$SG1137	DB	' %d', 00H
$SG1139	DB	' previous', 00H
	ORG $+2
$SG1140	DB	0aH, 'Registers live at start:', 00H
	ORG $+2
$SG1147	DB	' %d', 00H
$SG1148	DB	0aH, 00H
	ORG $+2
$SG1149	DB	0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_class$1100 = -8
_head$1126 = -16
_jump$1127 = -20
_regno$1128 = -12
_from_block$1136 = -24
_file$ = 8
_i$ = -4
_offset$1144 = -32
_bit$1145 = -28
_dump_flow_info PROC NEAR
; Line 2022
	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H
	push	ebx
	push	esi
	push	edi
; Line 2026
	mov	eax, DWORD PTR _max_regno
	push	eax
	push	OFFSET $SG1095
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 2028
	mov	DWORD PTR _i$[ebp], 10			; 0000000aH
	jmp	$L1096
$L1097:
	inc	DWORD PTR _i$[ebp]
$L1096:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _max_regno, eax
	jle	$L1098
; Line 2029
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_n_refs
	movsx	eax, WORD PTR [ecx+eax*2]
	or	eax, eax
	je	$L1099
; Line 2033
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_live_length
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_n_refs
	movsx	eax, WORD PTR [ecx+eax*2]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	push	OFFSET $SG1101
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 20					; 00000014H
; Line 2034
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_basic_block
	movsx	eax, WORD PTR [ecx+eax*2]
	or	eax, eax
	jl	$L1102
; Line 2035
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_basic_block
	movsx	eax, WORD PTR [ecx+eax*2]
	push	eax
	push	OFFSET $SG1103
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 2036
$L1102:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_n_deaths
	movsx	eax, WORD PTR [ecx+eax*2]
	cmp	eax, 1
	je	$L1104
; Line 2037
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_n_deaths
	movsx	eax, WORD PTR [ecx+eax*2]
	push	eax
	push	OFFSET $SG1105
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 2038
$L1104:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_n_calls_crossed
	cmp	DWORD PTR [ecx+eax*4], 1
	jne	$L1106
; Line 2039
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_n_calls_crossed
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	push	OFFSET $SG1107
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 2040
	jmp	$L1108
$L1106:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_n_calls_crossed
	cmp	DWORD PTR [ecx+eax*4], 0
	je	$L1109
; Line 2041
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_n_calls_crossed
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	push	OFFSET $SG1110
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 2042
$L1109:
$L1108:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _regno_reg_rtx
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	cmp	DWORD PTR _mode_size[eax], 4
	je	$L1111
; Line 2043
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _regno_reg_rtx
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	push	eax
	push	OFFSET $SG1112
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 2044
$L1111:
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	call	_reg_preferred_class
	add	esp, 4
	mov	DWORD PTR _class$1100[ebp], eax
; Line 2045
	cmp	DWORD PTR _class$1100[ebp], 10		; 0000000aH
	je	$L1113
; Line 2047
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	call	_reg_preferred_or_nothing
	add	esp, 4
	or	eax, eax
	je	$L1115
; Line 2048
	mov	eax, DWORD PTR _class$1100[ebp]
	mov	eax, DWORD PTR _?reg_class_names@?1??dump_flow_info@@9@9$S1081[eax*4]
	push	eax
	push	OFFSET $SG1116
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 2049
	jmp	$L1117
$L1115:
; Line 2050
	mov	eax, DWORD PTR _class$1100[ebp]
	mov	eax, DWORD PTR _?reg_class_names@?1??dump_flow_info@@9@9$S1081[eax*4]
	push	eax
	push	OFFSET $SG1118
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
$L1117:
; Line 2052
$L1113:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _regno_pointer_flag
	movsx	eax, BYTE PTR [eax+ecx]
	or	eax, eax
	je	$L1119
; Line 2053
	push	OFFSET $SG1120
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 8
; Line 2054
$L1119:
	push	OFFSET $SG1121
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 8
; Line 2056
$L1099:
	jmp	$L1097
$L1098:
	mov	eax, DWORD PTR _n_basic_blocks
	push	eax
	push	OFFSET $SG1122
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 2057
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L1123
$L1124:
	inc	DWORD PTR _i$[ebp]
$L1123:
	mov	eax, DWORD PTR _n_basic_blocks
	cmp	DWORD PTR _i$[ebp], eax
	jge	$L1125
; Line 2064
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _basic_block_end
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _basic_block_head
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	push	OFFSET $SG1129
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 20					; 00000014H
; Line 2068
	cmp	DWORD PTR _basic_block_drops_in$S545, 0
	je	$L1130
; Line 2070
	push	OFFSET $SG1131
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 8
; Line 2071
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _basic_block_head
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _head$1126[ebp], eax
; Line 2072
	mov	eax, DWORD PTR _head$1126[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1114112				; 00110000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1132
; Line 2075
	mov	eax, DWORD PTR _head$1126[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _jump$1127[ebp], eax
	jmp	$L1133
$L1134:
	mov	eax, DWORD PTR _jump$1127[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _jump$1127[ebp], eax
$L1133:
	mov	eax, DWORD PTR _head$1126[ebp]
	cmp	DWORD PTR _jump$1127[ebp], eax
	je	$L1135
; Line 2077
	mov	eax, DWORD PTR _jump$1127[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _uid_block_number$S541
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	DWORD PTR _from_block$1136[ebp], eax
; Line 2078
	mov	eax, DWORD PTR _from_block$1136[ebp]
	push	eax
	push	OFFSET $SG1137
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 2079
	jmp	$L1134
$L1135:
; Line 2080
$L1132:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _basic_block_drops_in$S545
	movsx	eax, BYTE PTR [eax+ecx]
	or	eax, eax
	je	$L1138
; Line 2081
	push	OFFSET $SG1139
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 8
; Line 2082
$L1138:
; Line 2083
$L1130:
	push	OFFSET $SG1140
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 8
; Line 2084
	mov	DWORD PTR _regno$1128[ebp], 0
	jmp	$L1141
$L1142:
	inc	DWORD PTR _regno$1128[ebp]
$L1141:
	mov	eax, DWORD PTR _regno$1128[ebp]
	cmp	DWORD PTR _max_regno, eax
	jle	$L1143
; Line 2086
	mov	eax, DWORD PTR _regno$1128[ebp]
	cdq
	and	edx, 31					; 0000001fH
	add	eax, edx
	sar	eax, 5
	mov	DWORD PTR _offset$1144[ebp], eax
; Line 2087
	mov	ebx, 1
	mov	eax, DWORD PTR _regno$1128[ebp]
	cdq
	xor	eax, edx
	sub	eax, edx
	and	eax, 31					; 0000001fH
	xor	eax, edx
	sub	eax, edx
	mov	cl, al
	shl	ebx, cl
	mov	DWORD PTR _bit$1145[ebp], ebx
; Line 2088
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _basic_block_live_at_start
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _offset$1144[ebp]
	mov	eax, DWORD PTR [eax+ecx*4]
	test	eax, DWORD PTR _bit$1145[ebp]
	je	$L1146
; Line 2089
	mov	eax, DWORD PTR _regno$1128[ebp]
	push	eax
	push	OFFSET $SG1147
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 2090
$L1146:
	jmp	$L1142
$L1143:
; Line 2091
	push	OFFSET $SG1148
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 8
; Line 2092
	jmp	$L1124
$L1125:
; Line 2093
	push	OFFSET $SG1149
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 8
; Line 2094
$L1078:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_dump_flow_info ENDP
_TEXT	ENDS
END
