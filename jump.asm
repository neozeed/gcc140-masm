	TITLE	jump.c
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
COMM	_jump_chain:DWORD
_DATA	ENDS
PUBLIC	_prev_real_insn
PUBLIC	_next_real_insn
PUBLIC	_simplejump_p
PUBLIC	_delete_insn
PUBLIC	_no_labels_between_p
PUBLIC	_redirect_jump
PUBLIC	_invert_jump
PUBLIC	_next_label
PUBLIC	_condjump_p
PUBLIC	_jump_optimize
PUBLIC	_true_regnum
EXTRN	_find_equiv_reg:NEAR
EXTRN	_gen_rtx:NEAR
EXTRN	_optimize:DWORD
EXTRN	_rtx_equal_p:NEAR
EXTRN	_alloca:NEAR
EXTRN	_memset:NEAR
EXTRN	_emit_barrier_after:NEAR
EXTRN	_current_function_returns_null:DWORD
EXTRN	_current_function_returns_null:DWORD
_TEXT	SEGMENT
; File jump.c
_reallabelprev$513 = -52
_temp$514 = -56
_nlabel$524 = -60
_n_labels$460 = -24
_label1$526 = -64
_range1end$527 = -68
_label2$529 = -76
_range2end$530 = -72
_range1beg$532 = -96
_range2beg$533 = -88
_range1after$534 = -80
_range2after$535 = -84
_range1before$536 = -92
_range2before$537 = -100
_newjpos$539 = -112
_newlpos$540 = -108
_next$476 = -28
_x$541 = -104
_body$478 = -32
_newjpos$546 = -120
_newlpos$547 = -116
_f$ = 8
_target$548 = -124
_cross_jump$ = 12
_noop_moves$ = 16
_insn$ = -16
_sreg$489 = -40
_changed$ = -8
_first$ = -4
_dreg$491 = -36
_max_uid$ = -20
_last_insn$ = -12
_newjpos$558 = -132
_newlpos$559 = -128
_tem$495 = -44
_target$560 = -136
_n_labels$566 = -140
_next$503 = -48
_jump_optimize PROC NEAR
; Line 117
	push	ebp
	mov	ebp, esp
	sub	esp, 148				; 00000094H
	push	ebx
	push	esi
	push	edi
; Line 120
	mov	DWORD PTR _first$[ebp], 1
; Line 121
	mov	DWORD PTR _max_uid$[ebp], 0
; Line 126
	mov	eax, DWORD PTR _f$[ebp]
	mov	DWORD PTR _insn$[ebp], eax
	jmp	$L429
$L430:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _insn$[ebp], eax
$L429:
	cmp	DWORD PTR _insn$[ebp], 0
	je	$L431
; Line 128
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1114112				; 00110000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L432
; Line 129
	mov	eax, DWORD PTR _insn$[ebp]
	mov	DWORD PTR [eax+20], 0
; Line 130
$L432:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 917504				; 000e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L433
; Line 131
	mov	eax, DWORD PTR _insn$[ebp]
	mov	DWORD PTR [eax+32], 0
; Line 132
$L433:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	ecx, DWORD PTR _max_uid$[ebp]
	cmp	DWORD PTR [eax+4], ecx
	jle	$L434
; Line 133
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _max_uid$[ebp], eax
; Line 134
$L434:
	jmp	$L430
$L431:
; Line 136
	inc	DWORD PTR _max_uid$[ebp]
; Line 138
	mov	eax, DWORD PTR _max_uid$[ebp]
	shl	eax, 2
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _jump_chain, eax
; Line 139
	mov	eax, DWORD PTR _max_uid$[ebp]
	shl	eax, 2
	push	eax
	push	0
	mov	eax, DWORD PTR _jump_chain
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 143
	mov	eax, DWORD PTR _f$[ebp]
	mov	DWORD PTR _insn$[ebp], eax
$L438:
	cmp	DWORD PTR _insn$[ebp], 0
	je	$L439
; Line 145
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1048576				; 00100000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L440
; Line 147
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _insn$[ebp], eax
; Line 148
$L442:
	cmp	DWORD PTR _insn$[ebp], 0
	je	$L443
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1114112				; 00110000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L443
; Line 151
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1179648				; 00120000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L444
	mov	eax, DWORD PTR _insn$[ebp]
	cmp	DWORD PTR [eax+20], -6			; fffffffaH
	je	$L444
; Line 152
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _insn$[ebp], eax
; Line 153
	jmp	$L445
$L444:
; Line 154
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_delete_insn
	add	esp, 4
	mov	DWORD PTR _insn$[ebp], eax
$L445:
; Line 155
	jmp	$L442
$L443:
; Line 158
	jmp	$L446
$L440:
; Line 159
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _insn$[ebp], eax
$L446:
; Line 160
	jmp	$L438
$L439:
; Line 169
	mov	eax, DWORD PTR _f$[ebp]
	mov	DWORD PTR _insn$[ebp], eax
	jmp	$L447
$L448:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _insn$[ebp], eax
$L447:
	cmp	DWORD PTR _insn$[ebp], 0
	je	$L449
; Line 170
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 917504				; 000e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L450
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shr	eax, 27					; 0000001bH
	test	al, 1
	jne	$L450
; Line 172
	mov	eax, DWORD PTR _cross_jump$[ebp]
	push	eax
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_mark_jump_label
	add	esp, 12					; 0000000cH
; Line 173
	mov	eax, DWORD PTR _insn$[ebp]
	cmp	DWORD PTR [eax+32], 0
	je	$L452
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_simplejump_p
	add	esp, 4
	or	eax, eax
	je	$L452
; Line 176
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+32]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _jump_chain
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	mov	edx, DWORD PTR _jump_chain
	mov	DWORD PTR [edx+ecx*4], eax
; Line 177
	mov	eax, DWORD PTR _insn$[ebp]
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	ecx, DWORD PTR [ecx+32]
	mov	ecx, DWORD PTR [ecx+4]
	mov	edx, DWORD PTR _jump_chain
	mov	DWORD PTR [edx+ecx*4], eax
; Line 179
$L452:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1900544				; 001d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L453
; Line 181
	mov	eax, DWORD PTR _jump_chain
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	mov	edx, DWORD PTR _jump_chain
	mov	DWORD PTR [edx+ecx*4], eax
; Line 182
	mov	eax, DWORD PTR _insn$[ebp]
	mov	ecx, DWORD PTR _jump_chain
	mov	DWORD PTR [ecx], eax
; Line 184
$L453:
; Line 189
$L450:
	jmp	$L448
$L449:
	mov	DWORD PTR _last_insn$[ebp], 0
; Line 190
	mov	eax, DWORD PTR _f$[ebp]
	mov	DWORD PTR _insn$[ebp], eax
$L455:
	cmp	DWORD PTR _insn$[ebp], 0
	je	$L456
; Line 192
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1114112				; 00110000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L457
	mov	eax, DWORD PTR _insn$[ebp]
	cmp	DWORD PTR [eax+20], 0
	jne	$L457
; Line 193
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_delete_insn
	add	esp, 4
	mov	DWORD PTR _insn$[ebp], eax
; Line 194
	jmp	$L458
$L457:
; Line 196
	mov	eax, DWORD PTR _insn$[ebp]
	mov	DWORD PTR _last_insn$[ebp], eax
; Line 197
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _insn$[ebp], eax
; Line 198
$L458:
; Line 199
	jmp	$L455
$L456:
; Line 201
	cmp	DWORD PTR _optimize, 0
	jne	$L459
; Line 206
	mov	eax, DWORD PTR _last_insn$[ebp]
	mov	DWORD PTR _insn$[ebp], eax
; Line 208
	mov	DWORD PTR _n_labels$460[ebp], 1
; Line 220
$L462:
	cmp	DWORD PTR _insn$[ebp], 0
	je	$L463
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1114112				; 00110000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L465
	mov	eax, DWORD PTR _n_labels$460[ebp]
	mov	DWORD PTR -144+[ebp], eax
	dec	DWORD PTR _n_labels$460[ebp]
	cmp	DWORD PTR -144+[ebp], 0
	jg	$L464
$L465:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 851968				; 000d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L464
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 917504				; 000e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L466
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1900544				; 001d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L464
$L466:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1179648				; 00120000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L463
	mov	eax, DWORD PTR _insn$[ebp]
	cmp	DWORD PTR [eax+20], -6			; fffffffaH
	je	$L463
$L464:
; Line 221
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _insn$[ebp], eax
	jmp	$L462
$L463:
; Line 226
	cmp	DWORD PTR _insn$[ebp], 0
	je	$L467
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1179648				; 00120000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L467
	mov	eax, DWORD PTR _insn$[ebp]
	cmp	DWORD PTR [eax+20], -6			; fffffffaH
	jne	$L467
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shr	eax, 27					; 0000001bH
	test	al, 1
	jne	$L467
; Line 229
	mov	DWORD PTR _current_function_returns_null, 1
; Line 232
$L467:
	mov	eax, DWORD PTR _f$[ebp]
	mov	DWORD PTR _insn$[ebp], eax
	jmp	$L469
$L470:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _insn$[ebp], eax
$L469:
	cmp	DWORD PTR _insn$[ebp], 0
	je	$L471
; Line 233
	mov	eax, DWORD PTR _insn$[ebp]
	and	DWORD PTR [eax], -134217729		; f7ffffffH
	jmp	$L470
$L471:
; Line 234
	jmp	$L423
; Line 237
$L459:
	cmp	DWORD PTR _noop_moves$[ebp], 0
	je	$L472
; Line 238
	mov	eax, DWORD PTR _f$[ebp]
	mov	DWORD PTR _insn$[ebp], eax
$L474:
	cmp	DWORD PTR _insn$[ebp], 0
	je	$L475
; Line 240
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _next$476[ebp], eax
; Line 242
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 851968				; 000d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L477
; Line 244
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _body$478[ebp], eax
; Line 252
	mov	eax, DWORD PTR _body$478[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1703936				; 001a0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L480
	mov	eax, DWORD PTR _body$478[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1769472				; 001b0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L479
$L480:
; Line 253
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_delete_insn
	add	esp, 4
; Line 254
	jmp	$L481
$L479:
; Line 267
	mov	eax, DWORD PTR _body$478[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L483
	mov	eax, DWORD PTR _body$478[ebp]
	mov	ecx, DWORD PTR _body$478[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	cmp	DWORD PTR [eax+8], ecx
	je	$L484
	mov	eax, DWORD PTR _body$478[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L483
	mov	eax, DWORD PTR _body$478[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L483
	mov	eax, DWORD PTR _body$478[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _body$478[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_rtx_equal_p
	add	esp, 8
	or	eax, eax
	je	$L483
$L484:
	mov	eax, DWORD PTR _body$478[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L485
	mov	eax, DWORD PTR _body$478[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shr	eax, 27					; 0000001bH
	test	al, 1
	jne	$L483
$L485:
	mov	eax, DWORD PTR _body$478[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L486
	mov	eax, DWORD PTR _body$478[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shr	eax, 27					; 0000001bH
	test	al, 1
	jne	$L483
$L486:
; Line 268
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_delete_insn
	add	esp, 4
; Line 273
	jmp	$L487
$L483:
	mov	eax, DWORD PTR _body$478[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L488
; Line 275
	mov	eax, DWORD PTR _body$478[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_true_regnum
	add	esp, 4
	mov	DWORD PTR _sreg$489[ebp], eax
; Line 276
	mov	eax, DWORD PTR _body$478[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_true_regnum
	add	esp, 4
	mov	DWORD PTR _dreg$491[ebp], eax
; Line 278
	mov	eax, DWORD PTR _sreg$489[ebp]
	cmp	DWORD PTR _dreg$491[ebp], eax
	jne	$L492
	cmp	DWORD PTR _sreg$489[ebp], 0
	jl	$L492
; Line 279
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_delete_insn
	add	esp, 4
; Line 280
	jmp	$L493
$L492:
	cmp	DWORD PTR _sreg$489[ebp], 0
	jl	$L494
	cmp	DWORD PTR _dreg$491[ebp], 0
	jl	$L494
; Line 284
	mov	eax, DWORD PTR _body$478[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	mov	eax, DWORD PTR _dreg$491[ebp]
	push	eax
	push	0
	mov	eax, DWORD PTR _sreg$489[ebp]
	push	eax
	push	0
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	push	0
	call	_find_equiv_reg
	add	esp, 28					; 0000001cH
	mov	DWORD PTR _tem$495[ebp], eax
; Line 290
	cmp	DWORD PTR _sreg$489[ebp], 8
	jl	$L497
	cmp	DWORD PTR _sreg$489[ebp], 10		; 0000000aH
	jl	$L496
$L497:
	cmp	DWORD PTR _dreg$491[ebp], 8
	jl	$L498
	cmp	DWORD PTR _dreg$491[ebp], 10		; 0000000aH
	jl	$L496
$L498:
; Line 293
	cmp	DWORD PTR _tem$495[ebp], 0
	je	$L499
	mov	eax, DWORD PTR _body$478[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, DWORD PTR _tem$495[ebp]
	mov	ecx, DWORD PTR [ecx]
	shl	ecx, 8
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L499
; Line 294
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_delete_insn
	add	esp, 4
; Line 295
$L499:
$L496:
; Line 296
$L494:
$L493:
; Line 297
$L488:
$L487:
$L481:
; Line 298
$L477:
	mov	eax, DWORD PTR _next$476[ebp]
	mov	DWORD PTR _insn$[ebp], eax
; Line 299
	jmp	$L474
$L475:
; Line 302
$L472:
	mov	DWORD PTR _changed$[ebp], 1
; Line 303
$L501:
	cmp	DWORD PTR _changed$[ebp], 0
	je	$L502
; Line 306
	mov	DWORD PTR _changed$[ebp], 0
; Line 308
	mov	eax, DWORD PTR _f$[ebp]
	mov	DWORD PTR _insn$[ebp], eax
	jmp	$L504
$L505:
	mov	eax, DWORD PTR _next$503[ebp]
	mov	DWORD PTR _insn$[ebp], eax
$L504:
	cmp	DWORD PTR _insn$[ebp], 0
	je	$L506
; Line 324
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _next$503[ebp], eax
; Line 328
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 917504				; 000e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L507
; Line 330
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1507328				; 00170000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L508
; Line 331
	mov	eax, DWORD PTR _noop_moves$[ebp]
	push	eax
	push	0
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_tension_vector_labels
	add	esp, 12					; 0000000cH
	or	DWORD PTR _changed$[ebp], eax
; Line 332
$L508:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1572864				; 00180000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L509
; Line 333
	mov	eax, DWORD PTR _noop_moves$[ebp]
	push	eax
	push	1
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_tension_vector_labels
	add	esp, 12					; 0000000cH
	or	DWORD PTR _changed$[ebp], eax
; Line 334
$L509:
; Line 340
$L507:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 917504				; 000e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L510
; Line 348
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1572864				; 00180000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L511
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+20], 1
	jne	$L511
; Line 351
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_delete_insn
	add	esp, 4
; Line 352
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_delete_insn
	add	esp, 4
; Line 353
	mov	DWORD PTR _changed$[ebp], 1
; Line 355
$L511:
; Line 357
$L510:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 917504				; 000e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L512
	mov	eax, DWORD PTR _insn$[ebp]
	cmp	DWORD PTR [eax+32], 0
	je	$L512
; Line 359
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+32]
	push	eax
	call	_prev_real_insn
	add	esp, 4
	mov	DWORD PTR _reallabelprev$513[ebp], eax
; Line 363
	mov	eax, DWORD PTR _reallabelprev$513[ebp]
	cmp	DWORD PTR _insn$[ebp], eax
	jne	$L515
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_condjump_p
	add	esp, 4
	or	eax, eax
	je	$L515
; Line 365
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_delete_jump
	add	esp, 4
; Line 366
	mov	DWORD PTR _changed$[ebp], 1
; Line 369
	jmp	$L516
$L515:
; Line 373
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_next_real_insn
	add	esp, 4
	mov	DWORD PTR _temp$514[ebp], eax
	cmp	DWORD PTR _temp$514[ebp], 0
	je	$L517
	mov	eax, DWORD PTR _temp$514[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 917504				; 000e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L517
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_condjump_p
	add	esp, 4
	or	eax, eax
	je	$L517
	mov	eax, DWORD PTR _temp$514[ebp]
	push	eax
	call	_simplejump_p
	add	esp, 4
	or	eax, eax
	je	$L517
	mov	eax, DWORD PTR _insn$[ebp]
	mov	ecx, DWORD PTR _temp$514[ebp]
	mov	ecx, DWORD PTR [ecx+32]
	cmp	DWORD PTR [eax+32], ecx
	jne	$L517
; Line 375
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_delete_jump
	add	esp, 4
; Line 376
	mov	DWORD PTR _changed$[ebp], 1
; Line 377
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _next$503[ebp], eax
; Line 380
	jmp	$L518
$L517:
; Line 382
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_simplejump_p
	add	esp, 4
	or	eax, eax
	je	$L519
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+32]
	push	eax
	call	_next_real_insn
	add	esp, 4
	mov	DWORD PTR _temp$514[ebp], eax
	cmp	DWORD PTR _temp$514[ebp], 0
	je	$L519
	mov	eax, DWORD PTR _temp$514[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1900544				; 001d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L519
; Line 384
	mov	eax, DWORD PTR _temp$514[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 386
	mov	eax, DWORD PTR _insn$[ebp]
	mov	DWORD PTR [eax+20], -1
; Line 389
	jmp	$L520
$L519:
; Line 398
	cmp	DWORD PTR _reallabelprev$513[ebp], 0
	je	$L522
	mov	eax, DWORD PTR _reallabelprev$513[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 917504				; 000e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L522
	mov	eax, DWORD PTR _reallabelprev$513[ebp]
	push	eax
	call	_prev_real_insn
	add	esp, 4
	cmp	eax, DWORD PTR _insn$[ebp]
	jne	$L522
	mov	eax, DWORD PTR _reallabelprev$513[ebp]
	push	eax
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_no_labels_between_p
	add	esp, 8
	or	eax, eax
	je	$L522
	mov	eax, DWORD PTR _reallabelprev$513[ebp]
	push	eax
	call	_simplejump_p
	add	esp, 4
	or	eax, eax
	je	$L522
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_condjump_p
	add	esp, 4
	or	eax, eax
	je	$L522
; Line 402
	mov	eax, DWORD PTR _reallabelprev$513[ebp]
	mov	eax, DWORD PTR [eax+32]
	inc	DWORD PTR [eax+20]
; Line 403
	mov	eax, DWORD PTR _reallabelprev$513[ebp]
	push	eax
	call	_delete_insn
	add	esp, 4
; Line 409
	mov	eax, DWORD PTR _reallabelprev$513[ebp]
	mov	eax, DWORD PTR [eax+32]
	push	eax
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_invert_jump
	add	esp, 8
; Line 410
	mov	eax, DWORD PTR _reallabelprev$513[ebp]
	mov	eax, DWORD PTR [eax+32]
	dec	DWORD PTR [eax+20]
; Line 411
	mov	eax, DWORD PTR _insn$[ebp]
	mov	DWORD PTR _next$503[ebp], eax
; Line 412
	mov	DWORD PTR _changed$[ebp], 1
; Line 414
	jmp	$L523
$L522:
; Line 419
	mov	eax, DWORD PTR _noop_moves$[ebp]
	push	eax
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+32]
	push	eax
	call	_follow_jumps
	add	esp, 8
	mov	DWORD PTR _nlabel$524[ebp], eax
; Line 420
	mov	eax, DWORD PTR _insn$[ebp]
	mov	ecx, DWORD PTR _nlabel$524[ebp]
	cmp	DWORD PTR [eax+32], ecx
	je	$L525
; Line 422
	mov	eax, DWORD PTR _nlabel$524[ebp]
	push	eax
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_redirect_jump
	add	esp, 8
; Line 423
	mov	DWORD PTR _changed$[ebp], 1
; Line 424
	mov	eax, DWORD PTR _insn$[ebp]
	mov	DWORD PTR _next$503[ebp], eax
; Line 426
$L525:
; Line 438
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_next_label
	add	esp, 4
	mov	DWORD PTR _label1$526[ebp], eax
; Line 439
	cmp	DWORD PTR _label1$526[ebp], 0
	je	$L972
	mov	eax, DWORD PTR _label1$526[ebp]
	push	eax
	call	_prev_real_insn
	add	esp, 4
	mov	DWORD PTR _range1end$527[ebp], eax
	jmp	$L973
$L972:
	mov	DWORD PTR _range1end$527[ebp], 0
$L973:
; Line 449
	cmp	DWORD PTR _first$[ebp], 0
	jne	$L528
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_condjump_p
	add	esp, 4
	or	eax, eax
	je	$L528
	mov	eax, DWORD PTR _insn$[ebp]
	mov	ecx, DWORD PTR _label1$526[ebp]
	cmp	DWORD PTR [eax+32], ecx
	jne	$L528
	mov	eax, DWORD PTR _label1$526[ebp]
	cmp	DWORD PTR [eax+20], 1
	jne	$L528
	mov	eax, DWORD PTR _range1end$527[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 917504				; 000e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L528
	mov	eax, DWORD PTR _range1end$527[ebp]
	push	eax
	call	_simplejump_p
	add	esp, 4
	or	eax, eax
	je	$L528
; Line 451
	mov	eax, DWORD PTR _label1$526[ebp]
	push	eax
	call	_next_label
	add	esp, 4
	mov	DWORD PTR _label2$529[ebp], eax
; Line 452
	cmp	DWORD PTR _label2$529[ebp], 0
	je	$L974
	mov	eax, DWORD PTR _label2$529[ebp]
	push	eax
	call	_prev_real_insn
	add	esp, 4
	mov	DWORD PTR _range2end$530[ebp], eax
	jmp	$L975
$L974:
	mov	DWORD PTR _range2end$530[ebp], 0
$L975:
; Line 456
	mov	eax, DWORD PTR _range2end$530[ebp]
	cmp	DWORD PTR _range1end$527[ebp], eax
	je	$L531
	mov	eax, DWORD PTR _range1end$527[ebp]
	mov	ecx, DWORD PTR _label2$529[ebp]
	cmp	DWORD PTR [eax+32], ecx
	jne	$L531
	mov	eax, DWORD PTR _range2end$530[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 917504				; 000e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L531
	mov	eax, DWORD PTR _range2end$530[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1048576				; 00100000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L531
; Line 458
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_next_real_insn
	add	esp, 4
	mov	DWORD PTR _range1beg$532[ebp], eax
; Line 459
	mov	eax, DWORD PTR _label1$526[ebp]
	push	eax
	call	_next_real_insn
	add	esp, 4
	mov	DWORD PTR _range2beg$533[ebp], eax
; Line 465
	mov	eax, DWORD PTR _range1end$527[ebp]
	push	eax
	mov	eax, DWORD PTR _range1beg$532[ebp]
	push	eax
	call	_squeeze_block_notes
	add	esp, 8
; Line 466
	mov	eax, DWORD PTR _range2end$530[ebp]
	push	eax
	mov	eax, DWORD PTR _range2beg$533[ebp]
	push	eax
	call	_squeeze_block_notes
	add	esp, 8
; Line 469
	mov	eax, DWORD PTR _range1beg$532[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _range1before$536[ebp], eax
; Line 470
	mov	eax, DWORD PTR _range2beg$533[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _range2before$537[ebp], eax
; Line 471
	mov	eax, DWORD PTR _range1end$527[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _range1after$534[ebp], eax
; Line 472
	mov	eax, DWORD PTR _range2end$530[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _range2after$535[ebp], eax
; Line 475
	mov	eax, DWORD PTR _range2beg$533[ebp]
	mov	ecx, DWORD PTR _range1before$536[ebp]
	mov	DWORD PTR [ecx+12], eax
; Line 476
	mov	eax, DWORD PTR _range1before$536[ebp]
	mov	ecx, DWORD PTR _range2beg$533[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 477
	mov	eax, DWORD PTR _range1after$534[ebp]
	mov	ecx, DWORD PTR _range2end$530[ebp]
	mov	DWORD PTR [ecx+12], eax
; Line 478
	mov	eax, DWORD PTR _range2end$530[ebp]
	mov	ecx, DWORD PTR _range1after$534[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 480
	mov	eax, DWORD PTR _range1beg$532[ebp]
	mov	ecx, DWORD PTR _range2before$537[ebp]
	mov	DWORD PTR [ecx+12], eax
; Line 481
	mov	eax, DWORD PTR _range2before$537[ebp]
	mov	ecx, DWORD PTR _range1beg$532[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 482
	mov	eax, DWORD PTR _range2after$535[ebp]
	mov	ecx, DWORD PTR _range1end$527[ebp]
	mov	DWORD PTR [ecx+12], eax
; Line 483
	mov	eax, DWORD PTR _range1end$527[ebp]
	mov	ecx, DWORD PTR _range2after$535[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 486
	mov	eax, DWORD PTR _label1$526[ebp]
	push	eax
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_invert_jump
	add	esp, 8
; Line 487
	mov	DWORD PTR _changed$[ebp], 1
; Line 488
	jmp	$L505
; Line 490
$L531:
; Line 491
$L528:
; Line 499
	cmp	DWORD PTR _cross_jump$[ebp], 0
	je	$L538
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_condjump_p
	add	esp, 4
	or	eax, eax
	je	$L538
; Line 502
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+32]
	push	eax
	call	_prev_real_insn
	add	esp, 4
	mov	DWORD PTR _x$541[ebp], eax
; Line 508
	cmp	DWORD PTR _x$541[ebp], 0
	je	$L542
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$541[ebp]
	push	eax
	call	_jump_back_p
	add	esp, 8
	or	eax, eax
	jne	$L542
; Line 511
	mov	DWORD PTR _x$541[ebp], 0
; Line 513
$L542:
	mov	DWORD PTR _newjpos$539[ebp], 0
; Line 516
	cmp	DWORD PTR _x$541[ebp], 0
	je	$L543
; Line 518
	lea	eax, DWORD PTR _newlpos$540[ebp]
	push	eax
	lea	eax, DWORD PTR _newjpos$539[ebp]
	push	eax
	push	2
	mov	eax, DWORD PTR _x$541[ebp]
	push	eax
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_find_cross_jump
	add	esp, 20					; 00000014H
; Line 520
$L543:
	cmp	DWORD PTR _newjpos$539[ebp], 0
	je	$L544
; Line 522
	mov	eax, DWORD PTR _newlpos$540[ebp]
	push	eax
	mov	eax, DWORD PTR _newjpos$539[ebp]
	push	eax
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_do_cross_jump
	add	esp, 12					; 0000000cH
; Line 526
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+32]
	push	eax
	push	0
	push	38					; 00000026H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	mov	DWORD PTR [ecx+8], eax
; Line 527
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_emit_barrier_after
	add	esp, 4
; Line 528
	mov	DWORD PTR _changed$[ebp], 1
; Line 529
	mov	eax, DWORD PTR _insn$[ebp]
	mov	DWORD PTR _next$503[ebp], eax
; Line 531
$L544:
; Line 536
$L538:
	cmp	DWORD PTR _cross_jump$[ebp], 0
	je	$L545
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_simplejump_p
	add	esp, 4
	or	eax, eax
	je	$L545
; Line 541
	mov	DWORD PTR _newjpos$546[ebp], 0
; Line 546
	lea	eax, DWORD PTR _newlpos$547[ebp]
	push	eax
	lea	eax, DWORD PTR _newjpos$546[ebp]
	push	eax
	push	1
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+32]
	push	eax
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_find_cross_jump
	add	esp, 20					; 00000014H
; Line 552
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+32]
	mov	ecx, DWORD PTR _max_uid$[ebp]
	cmp	DWORD PTR [eax+4], ecx
	jge	$L549
; Line 555
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+32]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _jump_chain
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _target$548[ebp], eax
	jmp	$L550
$L551:
	mov	eax, DWORD PTR _target$548[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _jump_chain
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _target$548[ebp], eax
$L550:
	cmp	DWORD PTR _target$548[ebp], 0
	je	$L552
	cmp	DWORD PTR _newjpos$546[ebp], 0
	jne	$L552
; Line 559
	mov	eax, DWORD PTR _target$548[ebp]
	cmp	DWORD PTR _insn$[ebp], eax
	je	$L553
	mov	eax, DWORD PTR _insn$[ebp]
	mov	ecx, DWORD PTR _target$548[ebp]
	mov	ecx, DWORD PTR [ecx+32]
	cmp	DWORD PTR [eax+32], ecx
	jne	$L553
	mov	eax, DWORD PTR _target$548[ebp]
	mov	eax, DWORD PTR [eax]
	shr	eax, 27					; 0000001bH
	test	al, 1
	jne	$L553
; Line 561
	lea	eax, DWORD PTR _newlpos$547[ebp]
	push	eax
	lea	eax, DWORD PTR _newjpos$546[ebp]
	push	eax
	push	2
	mov	eax, DWORD PTR _target$548[ebp]
	push	eax
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_find_cross_jump
	add	esp, 20					; 00000014H
; Line 563
$L553:
	jmp	$L551
$L552:
$L549:
	cmp	DWORD PTR _newjpos$546[ebp], 0
	je	$L554
; Line 565
	mov	eax, DWORD PTR _newlpos$547[ebp]
	push	eax
	mov	eax, DWORD PTR _newjpos$546[ebp]
	push	eax
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_do_cross_jump
	add	esp, 12					; 0000000cH
; Line 566
	mov	DWORD PTR _changed$[ebp], 1
; Line 567
	mov	eax, DWORD PTR _insn$[ebp]
	mov	DWORD PTR _next$503[ebp], eax
; Line 569
$L554:
; Line 570
$L545:
$L523:
$L520:
$L518:
$L516:
; Line 572
	jmp	$L555
$L512:
; Line 573
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 917504				; 000e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L556
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1900544				; 001d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L556
; Line 577
	cmp	DWORD PTR _cross_jump$[ebp], 0
	je	$L557
; Line 581
	mov	DWORD PTR _newjpos$558[ebp], 0
; Line 589
	mov	eax, DWORD PTR _jump_chain
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _target$560[ebp], eax
	jmp	$L561
$L562:
	mov	eax, DWORD PTR _target$560[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _jump_chain
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _target$560[ebp], eax
$L561:
	cmp	DWORD PTR _target$560[ebp], 0
	je	$L563
	cmp	DWORD PTR _newjpos$558[ebp], 0
	jne	$L563
; Line 592
	mov	eax, DWORD PTR _target$560[ebp]
	cmp	DWORD PTR _insn$[ebp], eax
	je	$L564
	mov	eax, DWORD PTR _target$560[ebp]
	mov	eax, DWORD PTR [eax]
	shr	eax, 27					; 0000001bH
	test	al, 1
	jne	$L564
	mov	eax, DWORD PTR _target$560[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1900544				; 001d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L564
; Line 594
	lea	eax, DWORD PTR _newlpos$559[ebp]
	push	eax
	lea	eax, DWORD PTR _newjpos$558[ebp]
	push	eax
	push	2
	mov	eax, DWORD PTR _target$560[ebp]
	push	eax
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_find_cross_jump
	add	esp, 20					; 00000014H
; Line 596
$L564:
	jmp	$L562
$L563:
	cmp	DWORD PTR _newjpos$558[ebp], 0
	je	$L565
; Line 598
	mov	eax, DWORD PTR _newlpos$559[ebp]
	push	eax
	mov	eax, DWORD PTR _newjpos$558[ebp]
	push	eax
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_do_cross_jump
	add	esp, 12					; 0000000cH
; Line 599
	mov	DWORD PTR _changed$[ebp], 1
; Line 600
	mov	eax, DWORD PTR _insn$[ebp]
	mov	DWORD PTR _next$503[ebp], eax
; Line 602
$L565:
; Line 603
$L557:
; Line 605
$L556:
$L555:
	jmp	$L505
$L506:
; Line 607
	mov	DWORD PTR _first$[ebp], 0
; Line 608
	jmp	$L501
$L502:
; Line 613
	mov	eax, DWORD PTR _last_insn$[ebp]
	mov	DWORD PTR _insn$[ebp], eax
; Line 615
	mov	DWORD PTR _n_labels$566[ebp], 1
; Line 627
$L568:
	cmp	DWORD PTR _insn$[ebp], 0
	je	$L569
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1114112				; 00110000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L571
	mov	eax, DWORD PTR _n_labels$566[ebp]
	mov	DWORD PTR -148+[ebp], eax
	dec	DWORD PTR _n_labels$566[ebp]
	cmp	DWORD PTR -148+[ebp], 0
	jg	$L570
$L571:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 851968				; 000d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L570
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 917504				; 000e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L572
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1900544				; 001d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L570
$L572:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1179648				; 00120000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L569
	mov	eax, DWORD PTR _insn$[ebp]
	cmp	DWORD PTR [eax+20], -6			; fffffffaH
	je	$L569
$L570:
; Line 628
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _insn$[ebp], eax
	jmp	$L568
$L569:
; Line 631
	cmp	DWORD PTR _insn$[ebp], 0
	je	$L573
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1179648				; 00120000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L573
	mov	eax, DWORD PTR _insn$[ebp]
	cmp	DWORD PTR [eax+20], -6			; fffffffaH
	jne	$L573
; Line 634
	mov	DWORD PTR _current_function_returns_null, 1
; Line 635
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_delete_insn
	add	esp, 4
; Line 637
$L573:
$L423:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_jump_optimize ENDP
_TEXT	ENDS
PUBLIC	_rtx_renumbered_equal_p
PUBLIC	_sets_cc0_p
_TEXT	SEGMENT
_e2$ = 12
_minimum$ = 16
_f1$ = 20
_f2$ = 24
_i1$ = -16
_i2$ = -32
_p1$ = -12
_p2$ = -28
_last1$ = -8
_last2$ = -4
_afterlast1$ = -24
_afterlast2$ = -20
_e1$ = 8
_find_cross_jump PROC NEAR
; Line 654
	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H
	push	ebx
	push	esi
	push	edi
; Line 655
	mov	eax, DWORD PTR _e1$[ebp]
	mov	DWORD PTR _i1$[ebp], eax
	mov	eax, DWORD PTR _e2$[ebp]
	mov	DWORD PTR _i2$[ebp], eax
; Line 658
	mov	DWORD PTR _last1$[ebp], 0
	mov	DWORD PTR _last2$[ebp], 0
; Line 659
	mov	DWORD PTR _afterlast1$[ebp], 0
	mov	DWORD PTR _afterlast2$[ebp], 0
; Line 661
	mov	eax, DWORD PTR _f1$[ebp]
	mov	DWORD PTR [eax], 0
; Line 662
	mov	eax, DWORD PTR _f2$[ebp]
	mov	DWORD PTR [eax], 0
; Line 664
$L590:
; Line 666
	mov	eax, DWORD PTR _i1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _i1$[ebp], eax
; Line 667
$L593:
	cmp	DWORD PTR _i1$[ebp], 0
	je	$L594
	mov	eax, DWORD PTR _i1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1179648				; 00120000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L594
; Line 668
	mov	eax, DWORD PTR _i1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _i1$[ebp], eax
	jmp	$L593
$L594:
; Line 670
	mov	eax, DWORD PTR _i2$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _i2$[ebp], eax
; Line 671
$L596:
	cmp	DWORD PTR _i2$[ebp], 0
	je	$L597
	mov	eax, DWORD PTR _i2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1179648				; 00120000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L598
	mov	eax, DWORD PTR _i2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1114112				; 00110000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L597
$L598:
; Line 672
	mov	eax, DWORD PTR _i2$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _i2$[ebp], eax
	jmp	$L596
$L597:
; Line 674
	cmp	DWORD PTR _i1$[ebp], 0
	jne	$L599
; Line 675
	jmp	$L591
; Line 679
$L599:
	mov	eax, DWORD PTR _i2$[ebp]
	cmp	DWORD PTR _e1$[ebp], eax
	je	$L601
	mov	eax, DWORD PTR _i1$[ebp]
	cmp	DWORD PTR _e2$[ebp], eax
	jne	$L600
$L601:
; Line 680
	jmp	$L591
; Line 685
$L600:
	mov	eax, DWORD PTR _i1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1114112				; 00110000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L602
; Line 687
	dec	DWORD PTR _minimum$[ebp]
; Line 688
	jmp	$L591
; Line 691
$L602:
	cmp	DWORD PTR _i2$[ebp], 0
	je	$L604
	mov	eax, DWORD PTR _i2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, DWORD PTR _i1$[ebp]
	mov	ecx, DWORD PTR [ecx]
	shl	ecx, 16					; 00000010H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L603
$L604:
; Line 692
	jmp	$L591
; Line 694
$L603:
	mov	eax, DWORD PTR _i1$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _p1$[ebp], eax
; Line 695
	mov	eax, DWORD PTR _i2$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _p2$[ebp], eax
; Line 698
	mov	eax, DWORD PTR _p2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, DWORD PTR _p1$[ebp]
	mov	ecx, DWORD PTR [ecx]
	shl	ecx, 16					; 00000010H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L607
	mov	eax, DWORD PTR _p2$[ebp]
	push	eax
	mov	eax, DWORD PTR _p1$[ebp]
	push	eax
	call	_rtx_renumbered_equal_p
	add	esp, 8
	or	eax, eax
	jne	$L606
$L607:
; Line 707
	mov	eax, DWORD PTR _p1$[ebp]
	push	eax
	call	_sets_cc0_p
	add	esp, 4
	or	eax, eax
	jne	$L610
	mov	eax, DWORD PTR _p2$[ebp]
	push	eax
	call	_sets_cc0_p
	add	esp, 4
	or	eax, eax
	je	$L609
$L610:
; Line 708
	mov	eax, DWORD PTR _afterlast1$[ebp]
	mov	DWORD PTR _last1$[ebp], eax
	mov	eax, DWORD PTR _afterlast2$[ebp]
	mov	DWORD PTR _last2$[ebp], eax
	inc	DWORD PTR _minimum$[ebp]
; Line 712
$L609:
; Line 714
	mov	eax, DWORD PTR _i1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 917504				; 000e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L611
	mov	eax, DWORD PTR _i1$[ebp]
	cmp	DWORD PTR [eax+32], 0
	je	$L611
	mov	eax, DWORD PTR _i1$[ebp]
	mov	eax, DWORD PTR [eax+32]
	push	eax
	call	_prev_real_insn
	add	esp, 4
	cmp	eax, DWORD PTR _e1$[ebp]
	jne	$L611
; Line 715
	dec	DWORD PTR _minimum$[ebp]
; Line 716
$L611:
	jmp	$L591
; Line 719
$L606:
	mov	eax, DWORD PTR _p1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1703936				; 001a0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L612
	mov	eax, DWORD PTR _p1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1769472				; 001b0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L612
; Line 722
	mov	eax, DWORD PTR _last1$[ebp]
	mov	DWORD PTR _afterlast1$[ebp], eax
	mov	eax, DWORD PTR _last2$[ebp]
	mov	DWORD PTR _afterlast2$[ebp], eax
; Line 723
	mov	eax, DWORD PTR _i1$[ebp]
	mov	DWORD PTR _last1$[ebp], eax
	mov	eax, DWORD PTR _i2$[ebp]
	mov	DWORD PTR _last2$[ebp], eax
	dec	DWORD PTR _minimum$[ebp]
; Line 725
$L612:
	jmp	$L590
$L591:
; Line 727
	cmp	DWORD PTR _minimum$[ebp], 0
	jg	$L613
	cmp	DWORD PTR _last1$[ebp], 0
	je	$L613
; Line 728
	mov	eax, DWORD PTR _last1$[ebp]
	mov	ecx, DWORD PTR _f1$[ebp]
	mov	DWORD PTR [ecx], eax
	mov	eax, DWORD PTR _last2$[ebp]
	mov	ecx, DWORD PTR _f2$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 729
$L613:
$L580:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_find_cross_jump ENDP
_TEXT	ENDS
EXTRN	_gen_label_rtx:NEAR
EXTRN	_emit_label_after:NEAR
EXTRN	_gen_jump:NEAR
_TEXT	SEGMENT
_insn$ = 8
_newjpos$ = 12
_newlpos$ = 16
_label$ = -4
_do_cross_jump PROC NEAR
; Line 734
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 738
	mov	eax, DWORD PTR _newlpos$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _label$[ebp], eax
; Line 739
$L620:
	cmp	DWORD PTR _label$[ebp], 0
	je	$L621
	mov	eax, DWORD PTR _label$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1179648				; 00120000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L621
; Line 740
	mov	eax, DWORD PTR _label$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _label$[ebp], eax
	jmp	$L620
$L621:
; Line 742
	cmp	DWORD PTR _label$[ebp], 0
	je	$L623
	mov	eax, DWORD PTR _label$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1114112				; 00110000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L622
$L623:
; Line 744
	call	_gen_label_rtx
	mov	DWORD PTR _label$[ebp], eax
; Line 745
	mov	eax, DWORD PTR _newlpos$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _label$[ebp]
	push	eax
	call	_emit_label_after
	add	esp, 8
; Line 746
	mov	eax, DWORD PTR _label$[ebp]
	mov	DWORD PTR [eax+20], 0
; Line 749
$L622:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1900544				; 001d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L625
; Line 752
	mov	eax, DWORD PTR _label$[ebp]
	push	eax
	call	_gen_jump
	add	esp, 4
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 753
	mov	eax, DWORD PTR _insn$[ebp]
	mov	DWORD PTR [eax+20], -1
; Line 754
	mov	eax, DWORD PTR _label$[ebp]
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	DWORD PTR [ecx+32], eax
; Line 755
	mov	eax, DWORD PTR _label$[ebp]
	inc	DWORD PTR [eax+20]
; Line 757
	jmp	$L627
$L625:
; Line 758
	mov	eax, DWORD PTR _label$[ebp]
	push	eax
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_redirect_jump
	add	esp, 8
$L627:
; Line 760
	mov	eax, DWORD PTR _newjpos$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _newjpos$[ebp], eax
; Line 761
$L629:
	mov	eax, DWORD PTR _newjpos$[ebp]
	mov	ecx, DWORD PTR _insn$[ebp]
	cmp	DWORD PTR [eax+12], ecx
	je	$L630
; Line 763
	mov	eax, DWORD PTR _newjpos$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1179648				; 00120000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L631
; Line 764
	mov	eax, DWORD PTR _newjpos$[ebp]
	mov	eax, DWORD PTR [eax+12]
	push	eax
	call	_delete_insn
	add	esp, 4
; Line 765
	jmp	$L632
$L631:
; Line 766
	mov	eax, DWORD PTR _newjpos$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _newjpos$[ebp], eax
$L632:
	jmp	$L629
$L630:
; Line 767
$L617:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_do_cross_jump ENDP
_prev$643 = -12
_start$ = 8
_end$ = 12
_insn$ = -8
_next$ = -4
_squeeze_block_notes PROC NEAR
; Line 775
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 779
	mov	eax, DWORD PTR _start$[ebp]
	mov	DWORD PTR _insn$[ebp], eax
	jmp	$L638
$L639:
	mov	eax, DWORD PTR _next$[ebp]
	mov	DWORD PTR _insn$[ebp], eax
$L638:
	mov	eax, DWORD PTR _end$[ebp]
	cmp	DWORD PTR _insn$[ebp], eax
	je	$L640
; Line 781
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _next$[ebp], eax
; Line 784
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1179648				; 00120000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L641
	mov	eax, DWORD PTR _insn$[ebp]
	cmp	DWORD PTR [eax+20], -3			; fffffffdH
	je	$L642
	mov	eax, DWORD PTR _insn$[ebp]
	cmp	DWORD PTR [eax+20], -2			; fffffffeH
	jne	$L641
$L642:
; Line 786
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _prev$643[ebp], eax
; Line 787
	mov	eax, DWORD PTR _start$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 788
	mov	eax, DWORD PTR _start$[ebp]
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	DWORD PTR [ecx+12], eax
; Line 789
	mov	eax, DWORD PTR _insn$[ebp]
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	mov	DWORD PTR [ecx+12], eax
; Line 790
	mov	eax, DWORD PTR _insn$[ebp]
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	ecx, DWORD PTR [ecx+12]
	mov	DWORD PTR [ecx+8], eax
; Line 791
	mov	eax, DWORD PTR _next$[ebp]
	mov	ecx, DWORD PTR _prev$643[ebp]
	mov	DWORD PTR [ecx+12], eax
; Line 792
	mov	eax, DWORD PTR _prev$643[ebp]
	mov	ecx, DWORD PTR _next$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 794
$L641:
	jmp	$L639
$L640:
; Line 795
$L635:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_squeeze_block_notes ENDP
_TEXT	ENDS
EXTRN	_pc_rtx:DWORD
EXTRN	_cc0_rtx:DWORD
EXTRN	_mode_class:BYTE
_TEXT	SEGMENT
_insn$ = 8
_target$ = 12
_cinsn$ = -8
_ctarget$ = -4
_prev$ = -16
_codei$ = -20
_codet$ = -12
_jump_back_p PROC NEAR
; Line 804
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	push	ebx
	push	esi
	push	edi
; Line 809
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_simplejump_p
	add	esp, 4
	or	eax, eax
	jne	$L653
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_condjump_p
	add	esp, 4
	or	eax, eax
	je	$L653
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	call	_simplejump_p
	add	esp, 4
	or	eax, eax
	je	$L652
$L653:
; Line 810
	sub	eax, eax
	jmp	$L646
; Line 811
$L652:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+32]
	push	eax
	call	_prev_real_insn
	add	esp, 4
	cmp	eax, DWORD PTR _target$[ebp]
	je	$L654
; Line 812
	sub	eax, eax
	jmp	$L646
; Line 816
$L654:
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_prev_real_insn
	add	esp, 4
	mov	DWORD PTR _prev$[ebp], eax
; Line 824
	cmp	DWORD PTR _prev$[ebp], 0
	je	$L656
	mov	eax, DWORD PTR _prev$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 851968				; 000d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L656
	mov	eax, DWORD PTR _prev$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L656
	mov	eax, DWORD PTR _prev$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _cc0_rtx
	cmp	DWORD PTR [eax+4], ecx
	jne	$L656
	mov	eax, DWORD PTR _prev$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	cmp	DWORD PTR _mode_class[eax], 1
	je	$L655
	mov	eax, DWORD PTR _prev$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2818048				; 002b0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L657
	mov	eax, DWORD PTR _prev$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	cmp	DWORD PTR _mode_class[eax], 1
	je	$L655
$L657:
$L656:
; Line 825
	sub	eax, eax
	jmp	$L646
; Line 827
$L655:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _cinsn$[ebp], eax
; Line 828
	mov	eax, DWORD PTR _target$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _ctarget$[ebp], eax
; Line 830
	mov	eax, DWORD PTR _cinsn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _codei$[ebp], eax
; Line 831
	mov	eax, DWORD PTR _ctarget$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _codet$[ebp], eax
; Line 832
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _pc_rtx
	cmp	DWORD PTR [eax+8], ecx
	jne	$L658
; Line 834
	mov	eax, DWORD PTR _codei$[ebp]
	push	eax
	call	_reverse_condition
	add	esp, 4
	mov	DWORD PTR _codei$[ebp], eax
; Line 835
$L658:
	mov	eax, DWORD PTR _target$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _pc_rtx
	cmp	DWORD PTR [eax+12], ecx
	jne	$L659
; Line 836
	mov	eax, DWORD PTR _codet$[ebp]
	push	eax
	call	_reverse_condition
	add	esp, 4
	mov	DWORD PTR _codet$[ebp], eax
; Line 837
$L659:
; Line 839
	mov	eax, DWORD PTR _codei$[ebp]
	cmp	DWORD PTR _codet$[ebp], eax
	jne	$L976
	mov	eax, DWORD PTR _ctarget$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _cinsn$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_rtx_renumbered_equal_p
	add	esp, 8
	or	eax, eax
	je	$L976
	mov	eax, DWORD PTR _ctarget$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _cinsn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_rtx_renumbered_equal_p
	add	esp, 8
	or	eax, eax
	je	$L976
	mov	eax, 1
	jmp	$L977
$L976:
	sub	eax, eax
$L977:
	jmp	$L646
; Line 840
$L646:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_jump_back_p ENDP
_TEXT	ENDS
EXTRN	_abort:NEAR
_TEXT	SEGMENT
_code$ = 8
_reverse_condition PROC NEAR
; Line 851
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 852
	mov	eax, DWORD PTR _code$[ebp]
	mov	DWORD PTR -4+[ebp], eax
	jmp	$L662
; Line 854
$L666:
; Line 855
	mov	eax, 67					; 00000043H
	jmp	$L661
; Line 857
$L667:
; Line 858
	mov	eax, 68					; 00000044H
	jmp	$L661
; Line 860
$L668:
; Line 861
	mov	eax, 71					; 00000047H
	jmp	$L661
; Line 863
$L669:
; Line 864
	mov	eax, 72					; 00000048H
	jmp	$L661
; Line 866
$L670:
; Line 867
	mov	eax, 69					; 00000045H
	jmp	$L661
; Line 869
$L671:
; Line 870
	mov	eax, 70					; 00000046H
	jmp	$L661
; Line 872
$L672:
; Line 873
	mov	eax, 75					; 0000004bH
	jmp	$L661
; Line 875
$L673:
; Line 876
	mov	eax, 76					; 0000004cH
	jmp	$L661
; Line 878
$L674:
; Line 879
	mov	eax, 73					; 00000049H
	jmp	$L661
; Line 881
$L675:
; Line 882
	mov	eax, 74					; 0000004aH
	jmp	$L661
; Line 884
$L676:
; Line 885
	call	_abort
; Line 886
	sub	eax, eax
	jmp	$L661
; Line 887
	jmp	$L663
$L662:
	sub	DWORD PTR -4+[ebp], 67			; 00000043H
	cmp	DWORD PTR -4+[ebp], 9
	ja	$L676
	shl	DWORD PTR -4+[ebp], 2
	mov	eax, DWORD PTR -4+[ebp]
	jmp	DWORD PTR $L978[eax]
$L978:
	DD	OFFSET $L667
	DD	OFFSET $L666
	DD	OFFSET $L669
	DD	OFFSET $L668
	DD	OFFSET $L671
	DD	OFFSET $L670
	DD	OFFSET $L673
	DD	OFFSET $L672
	DD	OFFSET $L675
	DD	OFFSET $L674
$L663:
; Line 888
$L661:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_reverse_condition ENDP
_insn$ = 8
_x$ = -4
_simplejump_p PROC NEAR
; Line 895
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 896
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _x$[ebp], eax
; Line 897
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L681
; Line 898
	sub	eax, eax
	jmp	$L679
; Line 899
$L681:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2162688				; 00210000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L682
; Line 900
	sub	eax, eax
	jmp	$L679
; Line 901
$L682:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L683
; Line 902
	sub	eax, eax
	jmp	$L679
; Line 903
$L683:
	mov	eax, 1
	jmp	$L679
; Line 904
$L679:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_simplejump_p ENDP
_insn$ = 8
_x$ = -4
_condjump_p PROC NEAR
; Line 912
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 913
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _x$[ebp], eax
; Line 914
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L687
; Line 915
	sub	eax, eax
	jmp	$L685
; Line 916
$L687:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2162688				; 00210000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L688
; Line 917
	sub	eax, eax
	jmp	$L685
; Line 918
$L688:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L689
; Line 919
	mov	eax, 1
	jmp	$L685
; Line 920
$L689:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2752512				; 002a0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L690
; Line 921
	sub	eax, eax
	jmp	$L685
; Line 922
$L690:
; Line 923
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _pc_rtx
	cmp	DWORD PTR [eax+12], ecx
	jne	$L691
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L691
; Line 924
	mov	eax, 1
	jmp	$L685
; Line 925
$L691:
; Line 926
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _pc_rtx
	cmp	DWORD PTR [eax+8], ecx
	jne	$L692
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+12]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L692
; Line 927
	mov	eax, 1
	jmp	$L685
; Line 928
$L692:
	sub	eax, eax
	jmp	$L685
; Line 929
$L685:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_condjump_p ENDP
_x$ = 8
_i$697 = -12
_sets_cc0$698 = -8
_other_things$699 = -4
_sets_cc0_p PROC NEAR
; Line 939
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 940
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L695
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR _cc0_rtx
	cmp	DWORD PTR [eax+4], ecx
	jne	$L695
; Line 941
	mov	eax, 1
	jmp	$L694
; Line 942
$L695:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1310720				; 00140000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L696
; Line 945
	mov	DWORD PTR _sets_cc0$698[ebp], 0
; Line 946
	mov	DWORD PTR _other_things$699[ebp], 0
; Line 947
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	dec	eax
	mov	DWORD PTR _i$697[ebp], eax
	jmp	$L700
$L701:
	dec	DWORD PTR _i$697[ebp]
$L700:
	cmp	DWORD PTR _i$697[ebp], 0
	jl	$L702
; Line 950
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _i$697[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L703
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _i$697[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	mov	ecx, DWORD PTR _cc0_rtx
	cmp	DWORD PTR [eax+4], ecx
	jne	$L703
; Line 951
	mov	DWORD PTR _sets_cc0$698[ebp], 1
; Line 952
	jmp	$L704
$L703:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _i$697[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L705
; Line 953
	mov	DWORD PTR _other_things$699[ebp], 1
; Line 954
$L705:
$L704:
	jmp	$L701
$L702:
; Line 955
	cmp	DWORD PTR _sets_cc0$698[ebp], 0
	jne	$L979
	sub	eax, eax
	jmp	$L980
$L979:
	cmp	DWORD PTR _other_things$699[ebp], 1
	sbb	eax, eax
	and	eax, 2
	dec	eax
$L980:
	jmp	$L694
; Line 957
$L696:
	sub	eax, eax
	jmp	$L694
; Line 958
$L694:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_sets_cc0_p ENDP
_beg$ = 8
_end$ = 12
_p$ = -4
_no_labels_between_p PROC NEAR
; Line 965
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 967
	mov	eax, DWORD PTR _beg$[ebp]
	mov	DWORD PTR _p$[ebp], eax
	jmp	$L710
$L711:
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _p$[ebp], eax
$L710:
	mov	eax, DWORD PTR _end$[ebp]
	cmp	DWORD PTR _p$[ebp], eax
	je	$L712
; Line 968
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1114112				; 00110000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L713
; Line 969
	sub	eax, eax
	jmp	$L708
; Line 970
$L713:
	jmp	$L711
$L712:
	mov	eax, 1
	jmp	$L708
; Line 971
$L708:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_no_labels_between_p ENDP
_label$ = 8
_insn$ = -8
_code$ = -4
_prev_real_insn PROC NEAR
; Line 979
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 980
	mov	eax, DWORD PTR _label$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _insn$[ebp], eax
; Line 983
$L719:
; Line 985
	cmp	DWORD PTR _insn$[ebp], 0
	jne	$L721
; Line 986
	sub	eax, eax
	jmp	$L715
; Line 987
$L721:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$[ebp], eax
; Line 988
	cmp	DWORD PTR _code$[ebp], 13		; 0000000dH
	je	$L723
	cmp	DWORD PTR _code$[ebp], 15		; 0000000fH
	je	$L723
	cmp	DWORD PTR _code$[ebp], 14		; 0000000eH
	jne	$L722
$L723:
; Line 989
	jmp	$L720
; Line 990
$L722:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _insn$[ebp], eax
; Line 991
	jmp	$L719
$L720:
; Line 993
	mov	eax, DWORD PTR _insn$[ebp]
	jmp	$L715
; Line 994
$L715:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_prev_real_insn ENDP
_label$ = 8
_insn$ = -8
_code$ = -4
_next_real_insn PROC NEAR
; Line 1002
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 1003
	mov	eax, DWORD PTR _label$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _insn$[ebp], eax
; Line 1006
$L729:
; Line 1008
	cmp	DWORD PTR _insn$[ebp], 0
	jne	$L731
; Line 1009
	mov	eax, DWORD PTR _insn$[ebp]
	jmp	$L725
; Line 1010
$L731:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$[ebp], eax
; Line 1011
	cmp	DWORD PTR _code$[ebp], 13		; 0000000dH
	je	$L733
	cmp	DWORD PTR _code$[ebp], 15		; 0000000fH
	je	$L733
	cmp	DWORD PTR _code$[ebp], 14		; 0000000eH
	jne	$L732
$L733:
; Line 1012
	jmp	$L730
; Line 1013
$L732:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _insn$[ebp], eax
; Line 1014
	jmp	$L729
$L730:
; Line 1016
	mov	eax, DWORD PTR _insn$[ebp]
	jmp	$L725
; Line 1017
$L725:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_next_real_insn ENDP
_insn$ = 8
_next_label PROC NEAR
; Line 1024
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1025
$L736:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _insn$[ebp], eax
; Line 1026
$L737:
	cmp	DWORD PTR _insn$[ebp], 0
	je	$L739
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1114112				; 00110000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L736
$L739:
$L738:
; Line 1027
	mov	eax, DWORD PTR _insn$[ebp]
	jmp	$L735
; Line 1028
$L735:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_next_label ENDP
_label$ = 8
_ignore_loops$ = 12
_insn$ = -16
_next$ = -12
_value$ = -8
_depth$ = -4
_tem$750 = -20
_follow_jumps PROC NEAR
; Line 1039
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	push	ebx
	push	esi
	push	edi
; Line 1042
	mov	eax, DWORD PTR _label$[ebp]
	mov	DWORD PTR _value$[ebp], eax
; Line 1052
	mov	DWORD PTR _depth$[ebp], 0
	jmp	$L747
$L748:
	inc	DWORD PTR _depth$[ebp]
$L747:
	cmp	DWORD PTR _depth$[ebp], 10		; 0000000aH
	jge	$L749
	mov	eax, DWORD PTR _value$[ebp]
	push	eax
	call	_next_real_insn
	add	esp, 4
	mov	DWORD PTR _insn$[ebp], eax
	cmp	DWORD PTR _insn$[ebp], 0
	je	$L749
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 917504				; 000e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L749
	mov	eax, DWORD PTR _insn$[ebp]
	cmp	DWORD PTR [eax+32], 0
	je	$L749
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _next$[ebp], eax
	cmp	DWORD PTR _next$[ebp], 0
	je	$L749
	mov	eax, DWORD PTR _next$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1048576				; 00100000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L749
; Line 1059
	cmp	DWORD PTR _ignore_loops$[ebp], 0
	jne	$L751
; Line 1060
	mov	eax, DWORD PTR _value$[ebp]
	mov	DWORD PTR _tem$750[ebp], eax
	jmp	$L752
$L753:
	mov	eax, DWORD PTR _tem$750[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _tem$750[ebp], eax
$L752:
	mov	eax, DWORD PTR _tem$750[ebp]
	cmp	DWORD PTR _insn$[ebp], eax
	je	$L754
; Line 1062
	mov	eax, DWORD PTR _tem$750[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1179648				; 00120000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L755
	mov	eax, DWORD PTR _tem$750[ebp]
	cmp	DWORD PTR [eax+20], -4			; fffffffcH
	jne	$L755
; Line 1063
	mov	eax, DWORD PTR _value$[ebp]
	jmp	$L742
; Line 1066
$L755:
	jmp	$L753
$L754:
$L751:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	ecx, DWORD PTR _label$[ebp]
	cmp	DWORD PTR [eax+32], ecx
	jne	$L756
; Line 1067
	jmp	$L749
; Line 1068
$L756:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+32]
	mov	DWORD PTR _value$[ebp], eax
; Line 1069
	jmp	$L748
$L749:
; Line 1070
	mov	eax, DWORD PTR _value$[ebp]
	jmp	$L742
; Line 1071
$L742:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_follow_jumps ENDP
_x$ = 8
_idx$ = 12
_ignore_loops$ = 16
_changed$ = -4
_i$ = -8
_olabel$766 = -12
_nlabel$767 = -16
_tension_vector_labels PROC NEAR
; Line 1083
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 1084
	mov	DWORD PTR _changed$[ebp], 0
; Line 1086
	mov	eax, DWORD PTR _idx$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	eax, DWORD PTR [eax]
	dec	eax
	mov	DWORD PTR _i$[ebp], eax
	jmp	$L763
$L764:
	dec	DWORD PTR _i$[ebp]
$L763:
	cmp	DWORD PTR _i$[ebp], 0
	jl	$L765
; Line 1088
	mov	eax, DWORD PTR _idx$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _olabel$766[ebp], eax
; Line 1089
	mov	eax, DWORD PTR _ignore_loops$[ebp]
	push	eax
	mov	eax, DWORD PTR _olabel$766[ebp]
	push	eax
	call	_follow_jumps
	add	esp, 8
	mov	DWORD PTR _nlabel$767[ebp], eax
; Line 1090
	mov	eax, DWORD PTR _nlabel$767[ebp]
	cmp	DWORD PTR _olabel$766[ebp], eax
	je	$L768
; Line 1092
	mov	eax, DWORD PTR _nlabel$767[ebp]
	mov	ecx, DWORD PTR _idx$[ebp]
	mov	edx, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR [edx+ecx*4+4]
	mov	edx, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR [ecx+edx*4+4]
	mov	DWORD PTR [ecx+4], eax
; Line 1093
	mov	eax, DWORD PTR _nlabel$767[ebp]
	inc	DWORD PTR [eax+20]
; Line 1094
	mov	eax, DWORD PTR _olabel$766[ebp]
	dec	DWORD PTR [eax+20]
	mov	eax, DWORD PTR _olabel$766[ebp]
	cmp	DWORD PTR [eax+20], 0
	jne	$L769
; Line 1095
	mov	eax, DWORD PTR _olabel$766[ebp]
	push	eax
	call	_delete_insn
	add	esp, 4
; Line 1096
$L769:
	mov	DWORD PTR _changed$[ebp], 1
; Line 1098
$L768:
	jmp	$L764
$L765:
; Line 1099
	mov	eax, DWORD PTR _changed$[ebp]
	jmp	$L760
; Line 1100
$L760:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_tension_vector_labels ENDP
_TEXT	ENDS
EXTRN	_rtx_length:BYTE
EXTRN	_rtx_format:BYTE
_TEXT	SEGMENT
_x$ = 8
_insn$ = 12
_cross_jump$ = 16
_code$ = -8
_i$ = -12
_fmt$ = -4
_label$778 = -20
_next$779 = -16
_j$797 = -24
_mark_jump_label PROC NEAR
; Line 1119
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	push	ebx
	push	esi
	push	edi
; Line 1120
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$[ebp], eax
; Line 1124
	cmp	DWORD PTR _code$[ebp], 38		; 00000026H
	jne	$L777
; Line 1126
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _label$778[ebp], eax
; Line 1128
	mov	eax, DWORD PTR _label$778[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1114112				; 00110000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L780
; Line 1129
	jmp	$L773
; Line 1132
$L780:
	mov	eax, DWORD PTR _label$778[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _next$779[ebp], eax
	jmp	$L781
$L782:
	mov	eax, DWORD PTR _next$779[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _next$779[ebp], eax
$L781:
	cmp	DWORD PTR _next$779[ebp], 0
	je	$L783
; Line 1134
	mov	eax, DWORD PTR _next$779[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1114112				; 00110000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L784
; Line 1135
	mov	eax, DWORD PTR _next$779[ebp]
	mov	DWORD PTR _label$778[ebp], eax
; Line 1136
	jmp	$L785
$L784:
; Line 1138
	mov	eax, DWORD PTR _next$779[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1179648				; 00120000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L787
	mov	eax, DWORD PTR _next$779[ebp]
	cmp	DWORD PTR [eax+20], -4			; fffffffcH
	je	$L787
	mov	eax, DWORD PTR _next$779[ebp]
	cmp	DWORD PTR [eax+20], -6			; fffffffaH
	jne	$L786
$L787:
; Line 1139
	jmp	$L783
; Line 1140
$L786:
$L785:
	jmp	$L782
$L783:
; Line 1141
	mov	eax, DWORD PTR _label$778[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 1142
	mov	eax, DWORD PTR _label$778[ebp]
	inc	DWORD PTR [eax+20]
; Line 1143
	cmp	DWORD PTR _insn$[ebp], 0
	je	$L788
; Line 1144
	mov	eax, DWORD PTR _label$778[ebp]
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	DWORD PTR [ecx+32], eax
; Line 1145
$L788:
	jmp	$L773
; Line 1150
$L777:
	cmp	DWORD PTR _code$[ebp], 23		; 00000017H
	je	$L790
	cmp	DWORD PTR _code$[ebp], 24		; 00000018H
	jne	$L789
$L790:
; Line 1151
	mov	DWORD PTR _insn$[ebp], 0
; Line 1153
$L789:
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_format[eax*4]
	mov	DWORD PTR _fmt$[ebp], eax
; Line 1154
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_length[eax*4]
	mov	DWORD PTR _i$[ebp], eax
	jmp	$L791
$L792:
	dec	DWORD PTR _i$[ebp]
$L791:
	cmp	DWORD PTR _i$[ebp], 0
	jl	$L793
; Line 1156
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 101				; 00000065H
	jne	$L794
; Line 1157
	mov	eax, DWORD PTR _cross_jump$[ebp]
	push	eax
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	push	eax
	call	_mark_jump_label
	add	esp, 12					; 0000000cH
; Line 1158
	jmp	$L795
$L794:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 69					; 00000045H
	jne	$L796
; Line 1161
	mov	DWORD PTR _j$797[ebp], 0
	jmp	$L798
$L799:
	inc	DWORD PTR _j$797[ebp]
$L798:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$797[ebp]
	cmp	DWORD PTR [eax], ecx
	jbe	$L800
; Line 1162
	mov	eax, DWORD PTR _cross_jump$[ebp]
	push	eax
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$797[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	push	eax
	call	_mark_jump_label
	add	esp, 12					; 0000000cH
	jmp	$L799
$L800:
; Line 1164
$L796:
$L795:
	jmp	$L792
$L793:
; Line 1165
$L773:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_mark_jump_label ENDP
_TEXT	ENDS
EXTRN	_find_reg_note:NEAR
_TEXT	SEGMENT
_insn$ = 8
_x$ = -4
_prev$ = -8
_delete_jump PROC NEAR
; Line 1174
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 1175
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _x$[ebp], eax
; Line 1179
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L805
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2162688				; 00210000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L805
; Line 1181
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _prev$[ebp], eax
; Line 1182
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_delete_insn
	add	esp, 4
; Line 1189
$L807:
	cmp	DWORD PTR _prev$[ebp], 0
	je	$L808
	mov	eax, DWORD PTR _prev$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1179648				; 00120000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L808
; Line 1190
	mov	eax, DWORD PTR _prev$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _prev$[ebp], eax
	jmp	$L807
$L808:
; Line 1193
	cmp	DWORD PTR _prev$[ebp], 0
	je	$L809
	mov	eax, DWORD PTR _prev$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 851968				; 000d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L809
	mov	eax, DWORD PTR _prev$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_sets_cc0_p
	add	esp, 4
	or	eax, eax
	jle	$L809
	push	0
	push	2
	mov	eax, DWORD PTR _prev$[ebp]
	push	eax
	call	_find_reg_note
	add	esp, 12					; 0000000cH
	or	eax, eax
	jne	$L809
; Line 1194
	mov	eax, DWORD PTR _prev$[ebp]
	push	eax
	call	_delete_insn
	add	esp, 4
; Line 1195
$L809:
; Line 1196
$L805:
$L802:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_delete_jump ENDP
_TEXT	ENDS
EXTRN	_set_last_insn:NEAR
_TEXT	SEGMENT
_code$835 = -12
_insn$ = 8
_next$ = -4
_prev$ = -8
_delete_insn PROC NEAR
; Line 1207
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 1208
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _next$[ebp], eax
; Line 1209
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _prev$[ebp], eax
; Line 1211
$L815:
	cmp	DWORD PTR _next$[ebp], 0
	je	$L816
	mov	eax, DWORD PTR _next$[ebp]
	mov	eax, DWORD PTR [eax]
	shr	eax, 27					; 0000001bH
	test	al, 1
	je	$L816
; Line 1212
	mov	eax, DWORD PTR _next$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _next$[ebp], eax
	jmp	$L815
$L816:
; Line 1215
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shr	eax, 27					; 0000001bH
	test	al, 1
	je	$L817
; Line 1216
	mov	eax, DWORD PTR _next$[ebp]
	jmp	$L811
; Line 1220
$L817:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	or	eax, 134217728				; 08000000H
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 1225
	cmp	DWORD PTR _next$[ebp], 0
	je	$L818
	mov	eax, DWORD PTR _next$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1048576				; 00100000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L818
; Line 1227
	mov	eax, DWORD PTR _next$[ebp]
	mov	eax, DWORD PTR [eax]
	or	eax, 134217728				; 08000000H
	mov	ecx, DWORD PTR _next$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 1228
	mov	eax, DWORD PTR _next$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _next$[ebp], eax
; Line 1233
$L818:
	cmp	DWORD PTR _optimize, 0
	je	$L819
; Line 1235
	cmp	DWORD PTR _prev$[ebp], 0
	je	$L820
; Line 1236
	mov	eax, DWORD PTR _next$[ebp]
	mov	ecx, DWORD PTR _prev$[ebp]
	mov	DWORD PTR [ecx+12], eax
; Line 1238
$L820:
	cmp	DWORD PTR _next$[ebp], 0
	je	$L821
; Line 1239
	mov	eax, DWORD PTR _prev$[ebp]
	mov	ecx, DWORD PTR _next$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 1241
$L821:
	cmp	DWORD PTR _prev$[ebp], 0
	je	$L822
	mov	eax, DWORD PTR _prev$[ebp]
	cmp	DWORD PTR [eax+12], 0
	jne	$L822
; Line 1242
	mov	eax, DWORD PTR _prev$[ebp]
	push	eax
	call	_set_last_insn
	add	esp, 4
; Line 1243
$L822:
; Line 1248
$L819:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 917504				; 000e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L824
	mov	eax, DWORD PTR _insn$[ebp]
	cmp	DWORD PTR [eax+32], 0
	je	$L824
; Line 1249
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+32]
	dec	DWORD PTR [eax+20]
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+32]
	cmp	DWORD PTR [eax+20], 0
	jne	$L825
; Line 1254
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+32]
	push	eax
	call	_delete_insn
	add	esp, 4
; Line 1259
$L827:
	cmp	DWORD PTR _next$[ebp], 0
	je	$L828
	mov	eax, DWORD PTR _next$[ebp]
	mov	eax, DWORD PTR [eax]
	shr	eax, 27					; 0000001bH
	test	al, 1
	je	$L828
; Line 1260
	mov	eax, DWORD PTR _next$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _next$[ebp], eax
	jmp	$L827
$L828:
; Line 1261
	mov	eax, DWORD PTR _next$[ebp]
	jmp	$L811
; Line 1264
$L825:
$L824:
$L830:
	cmp	DWORD PTR _prev$[ebp], 0
	je	$L831
	mov	eax, DWORD PTR _prev$[ebp]
	mov	eax, DWORD PTR [eax]
	shr	eax, 27					; 0000001bH
	test	al, 1
	jne	$L832
	mov	eax, DWORD PTR _prev$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1179648				; 00120000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L831
$L832:
; Line 1265
	mov	eax, DWORD PTR _prev$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _prev$[ebp], eax
	jmp	$L830
$L831:
; Line 1274
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1114112				; 00110000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L833
	mov	eax, DWORD PTR _insn$[ebp]
	cmp	DWORD PTR [eax+12], 0
	je	$L833
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 917504				; 000e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L833
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1507328				; 00170000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L833
; Line 1275
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	push	eax
	call	_delete_insn
	add	esp, 4
	mov	DWORD PTR _next$[ebp], eax
; Line 1279
$L833:
; Line 1280
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1114112				; 00110000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L834
	cmp	DWORD PTR _prev$[ebp], 0
	je	$L834
	mov	eax, DWORD PTR _prev$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1048576				; 00100000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L834
; Line 1286
$L837:
	cmp	DWORD PTR _next$[ebp], 0
	je	$L838
	mov	eax, DWORD PTR _next$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$835[ebp], eax
	cmp	DWORD PTR _code$835[ebp], 13		; 0000000dH
	je	$L839
	cmp	DWORD PTR _code$835[ebp], 14		; 0000000eH
	je	$L839
	cmp	DWORD PTR _code$835[ebp], 15		; 0000000fH
	je	$L839
	cmp	DWORD PTR _code$835[ebp], 18		; 00000012H
	jne	$L838
$L839:
; Line 1289
	cmp	DWORD PTR _code$835[ebp], 18		; 00000012H
	jne	$L840
	mov	eax, DWORD PTR _next$[ebp]
	cmp	DWORD PTR [eax+20], -6			; fffffffaH
	je	$L840
; Line 1290
	mov	eax, DWORD PTR _next$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _next$[ebp], eax
; Line 1291
	jmp	$L841
$L840:
; Line 1296
	mov	eax, DWORD PTR _next$[ebp]
	push	eax
	call	_delete_insn
	add	esp, 4
	mov	DWORD PTR _next$[ebp], eax
$L841:
; Line 1297
	jmp	$L837
$L838:
; Line 1300
$L834:
	mov	eax, DWORD PTR _next$[ebp]
	jmp	$L811
; Line 1301
$L811:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_delete_insn ENDP
_TEXT	ENDS
PUBLIC	_next_nondeleted_insn
_TEXT	SEGMENT
_insn$ = 8
_next_nondeleted_insn PROC NEAR
; Line 1309
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1310
$L845:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shr	eax, 27					; 0000001bH
	test	al, 1
	je	$L846
; Line 1311
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _insn$[ebp], eax
	jmp	$L845
$L846:
; Line 1312
	mov	eax, DWORD PTR _insn$[ebp]
	jmp	$L843
; Line 1313
$L843:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_next_nondeleted_insn ENDP
_TEXT	ENDS
PUBLIC	_delete_for_peephole
_TEXT	SEGMENT
_from$ = 8
_to$ = 12
_insn$ = -4
_next$855 = -8
_prev$856 = -12
_delete_for_peephole PROC NEAR
; Line 1323
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 1324
	mov	eax, DWORD PTR _from$[ebp]
	mov	DWORD PTR _insn$[ebp], eax
; Line 1326
$L853:
; Line 1328
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _next$855[ebp], eax
; Line 1329
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _prev$856[ebp], eax
; Line 1331
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1179648				; 00120000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L857
; Line 1333
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	or	eax, 134217728				; 08000000H
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 1338
	cmp	DWORD PTR _prev$856[ebp], 0
	je	$L858
; Line 1339
	mov	eax, DWORD PTR _next$855[ebp]
	mov	ecx, DWORD PTR _prev$856[ebp]
	mov	DWORD PTR [ecx+12], eax
; Line 1341
$L858:
	cmp	DWORD PTR _next$855[ebp], 0
	je	$L859
; Line 1342
	mov	eax, DWORD PTR _prev$856[ebp]
	mov	ecx, DWORD PTR _next$855[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 1343
$L859:
; Line 1345
$L857:
	mov	eax, DWORD PTR _to$[ebp]
	cmp	DWORD PTR _insn$[ebp], eax
	jne	$L860
; Line 1346
	jmp	$L854
; Line 1347
$L860:
	mov	eax, DWORD PTR _next$855[ebp]
	mov	DWORD PTR _insn$[ebp], eax
; Line 1348
	jmp	$L853
$L854:
; Line 1354
$L850:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_delete_for_peephole ENDP
_TEXT	ENDS
PUBLIC	_invert_exp
_TEXT	SEGMENT
_jump$ = 8
_nlabel$ = 12
_olabel$ = -4
_invert_jump PROC NEAR
; Line 1362
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 1363
	mov	eax, DWORD PTR _jump$[ebp]
	mov	eax, DWORD PTR [eax+32]
	mov	DWORD PTR _olabel$[ebp], eax
; Line 1364
	mov	eax, DWORD PTR _nlabel$[ebp]
	push	eax
	mov	eax, DWORD PTR _olabel$[ebp]
	push	eax
	mov	eax, DWORD PTR _jump$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_invert_exp
	add	esp, 12					; 0000000cH
; Line 1365
	mov	eax, DWORD PTR _nlabel$[ebp]
	mov	ecx, DWORD PTR _jump$[ebp]
	mov	DWORD PTR [ecx+32], eax
; Line 1366
	mov	eax, DWORD PTR _nlabel$[ebp]
	inc	DWORD PTR [eax+20]
; Line 1367
	mov	eax, DWORD PTR _jump$[ebp]
	mov	DWORD PTR [eax+20], -1
; Line 1369
	mov	eax, DWORD PTR _olabel$[ebp]
	dec	DWORD PTR [eax+20]
	mov	eax, DWORD PTR _olabel$[ebp]
	cmp	DWORD PTR [eax+20], 0
	jne	$L865
; Line 1370
	mov	eax, DWORD PTR _olabel$[ebp]
	push	eax
	call	_delete_insn
	add	esp, 4
; Line 1371
$L865:
$L863:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_invert_jump ENDP
_x$ = 8
_olabel$ = 12
_nlabel$ = 16
_code$ = -8
_i$ = -12
_fmt$ = -4
_tem$875 = -16
_j$883 = -20
_invert_exp PROC NEAR
; Line 1381
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	push	ebx
	push	esi
	push	edi
; Line 1386
	cmp	DWORD PTR _x$[ebp], 0
	jne	$L873
; Line 1387
	jmp	$L869
; Line 1389
$L873:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$[ebp], eax
; Line 1390
	cmp	DWORD PTR _code$[ebp], 42		; 0000002aH
	jne	$L874
; Line 1394
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _tem$875[ebp], eax
; Line 1395
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 1396
	mov	eax, DWORD PTR _tem$875[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [ecx+12], eax
; Line 1399
$L874:
	cmp	DWORD PTR _code$[ebp], 38		; 00000026H
	jne	$L876
; Line 1401
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR _olabel$[ebp]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L877
; Line 1402
	mov	eax, DWORD PTR _nlabel$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 1403
$L877:
	jmp	$L869
; Line 1406
$L876:
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_format[eax*4]
	mov	DWORD PTR _fmt$[ebp], eax
; Line 1407
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_length[eax*4]
	dec	eax
	mov	DWORD PTR _i$[ebp], eax
	jmp	$L878
$L879:
	dec	DWORD PTR _i$[ebp]
$L878:
	cmp	DWORD PTR _i$[ebp], 0
	jl	$L880
; Line 1409
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 101				; 00000065H
	jne	$L881
; Line 1410
	mov	eax, DWORD PTR _nlabel$[ebp]
	push	eax
	mov	eax, DWORD PTR _olabel$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	push	eax
	call	_invert_exp
	add	esp, 12					; 0000000cH
; Line 1411
$L881:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 69					; 00000045H
	jne	$L882
; Line 1414
	mov	DWORD PTR _j$883[ebp], 0
	jmp	$L884
$L885:
	inc	DWORD PTR _j$883[ebp]
$L884:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$883[ebp]
	cmp	DWORD PTR [eax], ecx
	jbe	$L886
; Line 1415
	mov	eax, DWORD PTR _nlabel$[ebp]
	push	eax
	mov	eax, DWORD PTR _olabel$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$883[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	push	eax
	call	_invert_exp
	add	esp, 12					; 0000000cH
	jmp	$L885
$L886:
; Line 1417
$L882:
	jmp	$L879
$L880:
; Line 1418
$L869:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_invert_exp ENDP
_jump$ = 8
_nlabel$ = 12
_olabel$ = -4
_redirect_jump PROC NEAR
; Line 1427
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 1428
	mov	eax, DWORD PTR _jump$[ebp]
	mov	eax, DWORD PTR [eax+32]
	mov	DWORD PTR _olabel$[ebp], eax
; Line 1430
	mov	eax, DWORD PTR _nlabel$[ebp]
	cmp	DWORD PTR _olabel$[ebp], eax
	jne	$L891
; Line 1431
	jmp	$L889
; Line 1433
$L891:
	mov	eax, DWORD PTR _nlabel$[ebp]
	push	eax
	mov	eax, DWORD PTR _olabel$[ebp]
	push	eax
	mov	eax, DWORD PTR _jump$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_redirect_exp
	add	esp, 12					; 0000000cH
; Line 1434
	mov	eax, DWORD PTR _nlabel$[ebp]
	mov	ecx, DWORD PTR _jump$[ebp]
	mov	DWORD PTR [ecx+32], eax
; Line 1435
	mov	eax, DWORD PTR _nlabel$[ebp]
	inc	DWORD PTR [eax+20]
; Line 1436
	mov	eax, DWORD PTR _jump$[ebp]
	mov	DWORD PTR [eax+20], -1
; Line 1438
	mov	eax, DWORD PTR _olabel$[ebp]
	dec	DWORD PTR [eax+20]
	mov	eax, DWORD PTR _olabel$[ebp]
	cmp	DWORD PTR [eax+20], 0
	jne	$L892
; Line 1439
	mov	eax, DWORD PTR _olabel$[ebp]
	push	eax
	call	_delete_insn
	add	esp, 4
; Line 1440
$L892:
$L889:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_redirect_jump ENDP
_code$ = -8
_i$ = -12
_fmt$ = -4
_j$907 = -16
_x$ = 8
_olabel$ = 12
_nlabel$ = 16
_redirect_exp PROC NEAR
; Line 1449
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 1450
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$[ebp], eax
; Line 1454
	cmp	DWORD PTR _code$[ebp], 38		; 00000026H
	jne	$L900
; Line 1456
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR _olabel$[ebp]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L901
; Line 1457
	mov	eax, DWORD PTR _nlabel$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 1458
$L901:
	jmp	$L896
; Line 1461
$L900:
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_format[eax*4]
	mov	DWORD PTR _fmt$[ebp], eax
; Line 1462
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_length[eax*4]
	dec	eax
	mov	DWORD PTR _i$[ebp], eax
	jmp	$L902
$L903:
	dec	DWORD PTR _i$[ebp]
$L902:
	cmp	DWORD PTR _i$[ebp], 0
	jl	$L904
; Line 1464
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 101				; 00000065H
	jne	$L905
; Line 1465
	mov	eax, DWORD PTR _nlabel$[ebp]
	push	eax
	mov	eax, DWORD PTR _olabel$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	push	eax
	call	_redirect_exp
	add	esp, 12					; 0000000cH
; Line 1466
$L905:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 69					; 00000045H
	jne	$L906
; Line 1469
	mov	DWORD PTR _j$907[ebp], 0
	jmp	$L908
$L909:
	inc	DWORD PTR _j$907[ebp]
$L908:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$907[ebp]
	cmp	DWORD PTR [eax], ecx
	jbe	$L910
; Line 1470
	mov	eax, DWORD PTR _nlabel$[ebp]
	push	eax
	mov	eax, DWORD PTR _olabel$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$907[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	push	eax
	call	_redirect_exp
	add	esp, 12					; 0000000cH
	jmp	$L909
$L910:
; Line 1472
$L906:
	jmp	$L903
$L904:
; Line 1473
$L896:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_redirect_exp ENDP
_TEXT	ENDS
EXTRN	_reg_renumber:DWORD
EXTRN	_strcmp:NEAR
_TEXT	SEGMENT
_x$ = 8
_y$ = 12
_i$ = -12
_code$ = -8
_fmt$ = -4
_j$921 = -16
_j$944 = -20
_rtx_renumbered_equal_p PROC NEAR
; Line 1481
	push	ebp
	mov	ebp, esp
	sub	esp, 28					; 0000001cH
	push	ebx
	push	esi
	push	edi
; Line 1483
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$[ebp], eax
; Line 1486
	mov	eax, DWORD PTR _x$[ebp]
	cmp	DWORD PTR _y$[ebp], eax
	jne	$L917
; Line 1487
	mov	eax, 1
	jmp	$L913
; Line 1488
$L917:
; Line 1490
	cmp	DWORD PTR _code$[ebp], 34		; 00000022H
	je	$L919
	cmp	DWORD PTR _code$[ebp], 35		; 00000023H
	jne	$L918
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L918
$L919:
	mov	eax, DWORD PTR _y$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L920
	mov	eax, DWORD PTR _y$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L918
	mov	eax, DWORD PTR _y$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L918
$L920:
; Line 1494
	mov	eax, DWORD PTR _y$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR [ecx]
	shl	ecx, 8
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L922
; Line 1495
	sub	eax, eax
	jmp	$L913
; Line 1497
$L922:
	cmp	DWORD PTR _code$[ebp], 35		; 00000023H
	jne	$L923
; Line 1499
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _i$[ebp], eax
; Line 1500
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	or	eax, eax
	jl	$L924
; Line 1501
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	DWORD PTR _i$[ebp], eax
; Line 1502
$L924:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	DWORD PTR _i$[ebp], eax
; Line 1504
	jmp	$L925
$L923:
; Line 1506
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _i$[ebp], eax
; Line 1507
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	or	eax, eax
	jl	$L926
; Line 1508
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	DWORD PTR _i$[ebp], eax
; Line 1509
$L926:
$L925:
; Line 1510
	mov	eax, DWORD PTR _y$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L927
; Line 1512
	mov	eax, DWORD PTR _y$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _j$921[ebp], eax
; Line 1513
	mov	eax, DWORD PTR _j$921[ebp]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	or	eax, eax
	jl	$L928
; Line 1514
	mov	eax, DWORD PTR _j$921[ebp]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	DWORD PTR _j$921[ebp], eax
; Line 1515
$L928:
	mov	eax, DWORD PTR _y$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	DWORD PTR _j$921[ebp], eax
; Line 1517
	jmp	$L929
$L927:
; Line 1519
	mov	eax, DWORD PTR _y$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _j$921[ebp], eax
; Line 1520
	mov	eax, DWORD PTR _j$921[ebp]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	or	eax, eax
	jl	$L930
; Line 1521
	mov	eax, DWORD PTR _j$921[ebp]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	DWORD PTR _j$921[ebp], eax
; Line 1522
$L930:
$L929:
; Line 1523
	mov	eax, DWORD PTR _j$921[ebp]
	sub	eax, DWORD PTR _i$[ebp]
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	jmp	$L913
; Line 1527
$L918:
	mov	eax, DWORD PTR _y$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	cmp	eax, DWORD PTR _code$[ebp]
	je	$L931
; Line 1528
	sub	eax, eax
	jmp	$L913
; Line 1529
$L931:
	mov	eax, DWORD PTR _code$[ebp]
	mov	DWORD PTR -24+[ebp], eax
	jmp	$L932
; Line 1531
$L936:
; Line 1535
	sub	eax, eax
	jmp	$L913
; Line 1537
$L937:
; Line 1538
	mov	eax, DWORD PTR _y$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _x$[ebp]
	sub	eax, DWORD PTR [ecx+4]
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	jmp	$L913
; Line 1540
$L938:
; Line 1544
	mov	eax, DWORD PTR _y$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_next_real_insn
	add	esp, 4
	mov	ebx, eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_next_real_insn
	add	esp, 4
	sub	ebx, eax
	cmp	ebx, 1
	sbb	eax, eax
	neg	eax
	jmp	$L913
; Line 1546
$L939:
; Line 1547
	mov	eax, DWORD PTR _y$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _x$[ebp]
	sub	eax, DWORD PTR [ecx+4]
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	jmp	$L913
; Line 1548
	jmp	$L933
$L932:
	sub	DWORD PTR -24+[ebp], 23			; 00000017H
	cmp	DWORD PTR -24+[ebp], 17			; 00000011H
	ja	$L933
	shl	DWORD PTR -24+[ebp], 2
	mov	eax, DWORD PTR -24+[ebp]
	jmp	DWORD PTR $L981[eax]
$L981:
	DD	OFFSET $L936
	DD	OFFSET $L936
	DD	OFFSET $L933
	DD	OFFSET $L933
	DD	OFFSET $L933
	DD	OFFSET $L933
	DD	OFFSET $L933
	DD	OFFSET $L937
	DD	OFFSET $L933
	DD	OFFSET $L933
	DD	OFFSET $L936
	DD	OFFSET $L933
	DD	OFFSET $L933
	DD	OFFSET $L933
	DD	OFFSET $L933
	DD	OFFSET $L938
	DD	OFFSET $L939
	DD	OFFSET $L936
$L933:
; Line 1552
	mov	eax, DWORD PTR _y$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR [ecx]
	shl	ecx, 8
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L940
; Line 1553
	sub	eax, eax
	jmp	$L913
; Line 1558
$L940:
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_format[eax*4]
	mov	DWORD PTR _fmt$[ebp], eax
; Line 1559
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_length[eax*4]
	dec	eax
	mov	DWORD PTR _i$[ebp], eax
	jmp	$L941
$L942:
	dec	DWORD PTR _i$[ebp]
$L941:
	cmp	DWORD PTR _i$[ebp], 0
	jl	$L943
; Line 1562
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	mov	DWORD PTR -28+[ebp], eax
	jmp	$L945
; Line 1564
$L949:
; Line 1565
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _y$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	mov	ebx, DWORD PTR _x$[ebp]
	mov	edx, DWORD PTR [ebx+edx*4+4]
	cmp	DWORD PTR [ecx+eax*4+4], edx
	je	$L950
; Line 1566
	sub	eax, eax
	jmp	$L913
; Line 1567
$L950:
	jmp	$L946
; Line 1569
$L951:
; Line 1570
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
	je	$L953
; Line 1571
	sub	eax, eax
	jmp	$L913
; Line 1572
$L953:
	jmp	$L946
; Line 1574
$L954:
; Line 1575
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _y$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	push	eax
	call	_rtx_renumbered_equal_p
	add	esp, 8
	or	eax, eax
	jne	$L955
; Line 1576
	sub	eax, eax
	jmp	$L913
; Line 1577
$L955:
	jmp	$L946
; Line 1579
$L956:
; Line 1580
	jmp	$L946
; Line 1582
$L957:
; Line 1583
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _y$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR [edx+ecx*4+4]
	mov	ecx, DWORD PTR [ecx]
	cmp	DWORD PTR [eax], ecx
	je	$L958
; Line 1584
	sub	eax, eax
	jmp	$L913
; Line 1585
$L958:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	eax, DWORD PTR [eax]
	dec	eax
	mov	DWORD PTR _j$944[ebp], eax
	jmp	$L959
$L960:
	dec	DWORD PTR _j$944[ebp]
$L959:
	cmp	DWORD PTR _j$944[ebp], 0
	jl	$L961
; Line 1586
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _y$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$944[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$944[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	push	eax
	call	_rtx_renumbered_equal_p
	add	esp, 8
	or	eax, eax
	jne	$L962
; Line 1587
	sub	eax, eax
	jmp	$L913
; Line 1588
$L962:
	jmp	$L960
$L961:
	jmp	$L946
; Line 1590
$L963:
; Line 1591
	call	_abort
; Line 1592
	jmp	$L946
$L945:
	cmp	DWORD PTR -28+[ebp], 48			; 00000030H
	je	$L946
	cmp	DWORD PTR -28+[ebp], 69			; 00000045H
	je	$L957
	cmp	DWORD PTR -28+[ebp], 101		; 00000065H
	je	$L954
	cmp	DWORD PTR -28+[ebp], 105		; 00000069H
	je	$L949
	cmp	DWORD PTR -28+[ebp], 115		; 00000073H
	je	$L951
	jmp	$L963
$L946:
; Line 1593
	jmp	$L942
$L943:
; Line 1594
	mov	eax, 1
	jmp	$L913
; Line 1595
$L913:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_rtx_renumbered_equal_p ENDP
_x$ = 8
_base$969 = -4
_true_regnum PROC NEAR
; Line 1604
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 1605
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L966
; Line 1607
	mov	eax, DWORD PTR _x$[ebp]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L967
; Line 1608
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	jmp	$L965
; Line 1609
$L967:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	jmp	$L965
; Line 1611
$L966:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L968
; Line 1613
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_true_regnum
	add	esp, 4
	mov	DWORD PTR _base$969[ebp], eax
; Line 1614
	cmp	DWORD PTR _base$969[ebp], 0
	jl	$L970
	cmp	DWORD PTR _base$969[ebp], 10		; 0000000aH
	jge	$L970
; Line 1615
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, DWORD PTR _base$969[ebp]
	jmp	$L965
; Line 1616
$L970:
; Line 1617
$L968:
	mov	eax, -1
	jmp	$L965
; Line 1618
$L965:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_true_regnum ENDP
_TEXT	ENDS
END
