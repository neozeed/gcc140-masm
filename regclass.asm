	TITLE	regclass.c
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
PUBLIC	_reg_class_contents
PUBLIC	_reg_names
_DATA	SEGMENT
COMM	_max_parallel:DWORD
COMM	_fixed_regs:BYTE:0aH
COMM	_fixed_reg_set:WORD
COMM	_call_used_regs:BYTE:0aH
COMM	_call_used_reg_set:WORD
COMM	_call_fixed_regs:BYTE:0aH
COMM	_call_fixed_reg_set:WORD
COMM	_global_regs:BYTE:0aH
COMM	_reg_class_size:DWORD:0dH
COMM	_reg_class_superclasses:DWORD:0a9H
COMM	_regno_first_uid:DWORD
COMM	_reg_class_subclasses:DWORD:0a9H
COMM	_regno_last_uid:DWORD
COMM	_reg_class_subunion:DWORD:0a9H
_initial_fixed_regs$S440 DB 00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	01H
	DB	01H
	DB	00H
	ORG $+6
_initial_call_used_regs$S441 DB 01H
	DB	01H
	DB	01H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	01H
	DB	01H
	DB	01H
	ORG $+6
_reg_class_contents DW 00H
	DW	01H
	DW	02H
	DW	03H
	DW	04H
	DW	08H
	DW	0fH
	DW	010H
	DW	020H
	DW	07fH
	DW	0ffH
	DW	0300H
	DW	03ffH
	ORG $+2
$SG442	DB	'ax', 00H
	ORG $+1
$SG443	DB	'dx', 00H
	ORG $+1
$SG444	DB	'cx', 00H
	ORG $+1
$SG445	DB	'bx', 00H
	ORG $+1
$SG446	DB	'si', 00H
	ORG $+1
$SG447	DB	'di', 00H
	ORG $+1
$SG448	DB	'bp', 00H
	ORG $+1
$SG449	DB	'sp', 00H
	ORG $+1
$SG450	DB	'st', 00H
	ORG $+1
$SG451	DB	'st(1)', 00H
	ORG $+2
_reg_names DD	$SG442
	DD	$SG443
	DD	$SG444
	DD	$SG445
	DD	$SG446
	DD	$SG447
	DD	$SG448
	DD	$SG449
	DD	$SG450
	DD	$SG451
_DATA	ENDS
PUBLIC	_init_reg_sets
EXTRN	_memcpy:NEAR
EXTRN	_memset:NEAR
_TEXT	SEGMENT
; File regclass.c
_i$ = -4
_j$ = -8
_c$471 = -12
_k$472 = -16
_p$491 = -20
_init_reg_sets PROC NEAR
; Line 124
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	push	ebx
	push	esi
	push	edi
; Line 127
	push	10					; 0000000aH
	push	OFFSET _initial_fixed_regs$S440
	push	OFFSET _fixed_regs
	call	_memcpy
	add	esp, 12					; 0000000cH
; Line 128
	push	10					; 0000000aH
	push	OFFSET _initial_call_used_regs$S441
	push	OFFSET _call_used_regs
	call	_memcpy
	add	esp, 12					; 0000000cH
; Line 129
	push	10					; 0000000aH
	push	0
	push	OFFSET _global_regs
	call	_memset
	add	esp, 12					; 0000000cH
; Line 133
	push	52					; 00000034H
	push	0
	push	OFFSET _reg_class_size
	call	_memset
	add	esp, 12					; 0000000cH
; Line 134
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L458
$L459:
	inc	DWORD PTR _i$[ebp]
$L458:
	cmp	DWORD PTR _i$[ebp], 13			; 0000000dH
	jge	$L460
; Line 135
	mov	DWORD PTR _j$[ebp], 0
	jmp	$L461
$L462:
	inc	DWORD PTR _j$[ebp]
$L461:
	cmp	DWORD PTR _j$[ebp], 10			; 0000000aH
	jge	$L463
; Line 136
	mov	eax, DWORD PTR _i$[ebp]
	movsx	eax, WORD PTR _reg_class_contents[eax*2]
	mov	edx, 1
	mov	cl, BYTE PTR _j$[ebp]
	shl	edx, cl
	test	eax, edx
	je	$L464
; Line 137
	mov	eax, DWORD PTR _i$[ebp]
	inc	DWORD PTR _reg_class_size[eax*4]
; Line 143
$L464:
	jmp	$L462
$L463:
	jmp	$L459
$L460:
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L465
$L466:
	inc	DWORD PTR _i$[ebp]
$L465:
	cmp	DWORD PTR _i$[ebp], 13			; 0000000dH
	jge	$L467
; Line 145
	mov	DWORD PTR _j$[ebp], 0
	jmp	$L468
$L469:
	inc	DWORD PTR _j$[ebp]
$L468:
	cmp	DWORD PTR _j$[ebp], 13			; 0000000dH
	jge	$L470
; Line 153
	mov	eax, DWORD PTR _i$[ebp]
	mov	ax, WORD PTR _reg_class_contents[eax*2]
	mov	WORD PTR _c$471[ebp], ax
; Line 154
	mov	eax, DWORD PTR _j$[ebp]
	movsx	eax, WORD PTR _reg_class_contents[eax*2]
	movsx	ecx, WORD PTR _c$471[ebp]
	or	eax, ecx
	mov	WORD PTR _c$471[ebp], ax
; Line 155
	mov	DWORD PTR _k$472[ebp], 0
	jmp	$L473
$L474:
	inc	DWORD PTR _k$472[ebp]
$L473:
	cmp	DWORD PTR _k$472[ebp], 13		; 0000000dH
	jge	$L475
; Line 157
	mov	eax, DWORD PTR _k$472[ebp]
	movsx	eax, WORD PTR _reg_class_contents[eax*2]
	movsx	ecx, WORD PTR _c$471[ebp]
	not	ecx
	test	eax, ecx
	jne	$L476
	jmp	$subclass1$477
; Line 159
$L476:
	jmp	$L474
; Line 161
$subclass1$477:
; Line 162
	mov	eax, DWORD PTR _k$472[ebp]
	mov	ecx, DWORD PTR _j$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	mov	ebx, edx
	lea	edx, DWORD PTR [edx+edx*2]
	lea	edx, DWORD PTR [ebx+edx*4]
	shl	edx, 2
	mov	DWORD PTR _reg_class_subunion[edx+ecx*4], eax
; Line 163
	jmp	$L474
$L475:
; Line 164
	jmp	$L469
$L470:
; Line 165
	jmp	$L466
$L467:
; Line 170
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L478
$L479:
	inc	DWORD PTR _i$[ebp]
$L478:
	cmp	DWORD PTR _i$[ebp], 13			; 0000000dH
	jge	$L480
; Line 172
	mov	DWORD PTR _j$[ebp], 0
	jmp	$L481
$L482:
	inc	DWORD PTR _j$[ebp]
$L481:
	cmp	DWORD PTR _j$[ebp], 13			; 0000000dH
	jge	$L483
; Line 174
	mov	eax, DWORD PTR _j$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, ecx
	lea	ecx, DWORD PTR [ecx+ecx*2]
	lea	ecx, DWORD PTR [edx+ecx*4]
	shl	ecx, 2
	mov	DWORD PTR _reg_class_superclasses[ecx+eax*4], 13 ; 0000000dH
; Line 175
	mov	eax, DWORD PTR _j$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, ecx
	lea	ecx, DWORD PTR [ecx+ecx*2]
	lea	ecx, DWORD PTR [edx+ecx*4]
	shl	ecx, 2
	mov	DWORD PTR _reg_class_subclasses[ecx+eax*4], 13 ; 0000000dH
; Line 176
	jmp	$L482
$L483:
; Line 177
	jmp	$L479
$L480:
; Line 179
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L484
$L485:
	inc	DWORD PTR _i$[ebp]
$L484:
	cmp	DWORD PTR _i$[ebp], 13			; 0000000dH
	jge	$L486
; Line 181
	cmp	DWORD PTR _i$[ebp], 0
	jne	$L487
; Line 182
	jmp	$L485
; Line 184
$L487:
	mov	eax, DWORD PTR _i$[ebp]
	inc	eax
	mov	DWORD PTR _j$[ebp], eax
	jmp	$L488
$L489:
	inc	DWORD PTR _j$[ebp]
$L488:
	cmp	DWORD PTR _j$[ebp], 13			; 0000000dH
	jge	$L490
; Line 188
	mov	eax, DWORD PTR _j$[ebp]
	movsx	eax, WORD PTR _reg_class_contents[eax*2]
	not	eax
	mov	ecx, DWORD PTR _i$[ebp]
	movsx	ecx, WORD PTR _reg_class_contents[ecx*2]
	test	eax, ecx
	jne	$L492
	jmp	$subclass$493
; Line 190
$L492:
	jmp	$L489
; Line 191
$subclass$493:
; Line 194
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, eax
	lea	eax, DWORD PTR [eax+eax*2]
	lea	eax, DWORD PTR [ecx+eax*4]
	lea	eax, DWORD PTR _reg_class_superclasses[eax*4]
	mov	DWORD PTR _p$491[ebp], eax
; Line 195
$L495:
	mov	eax, DWORD PTR _p$491[ebp]
	cmp	DWORD PTR [eax], 13			; 0000000dH
	je	$L496
	add	DWORD PTR _p$491[ebp], 4
	jmp	$L495
$L496:
; Line 196
	mov	eax, DWORD PTR _j$[ebp]
	mov	ecx, DWORD PTR _p$491[ebp]
	mov	DWORD PTR [ecx], eax
; Line 198
	mov	eax, DWORD PTR _j$[ebp]
	mov	ecx, eax
	lea	eax, DWORD PTR [eax+eax*2]
	lea	eax, DWORD PTR [ecx+eax*4]
	lea	eax, DWORD PTR _reg_class_subclasses[eax*4]
	mov	DWORD PTR _p$491[ebp], eax
; Line 199
$L498:
	mov	eax, DWORD PTR _p$491[ebp]
	cmp	DWORD PTR [eax], 13			; 0000000dH
	je	$L499
	add	DWORD PTR _p$491[ebp], 4
	jmp	$L498
$L499:
; Line 200
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _p$491[ebp]
	mov	DWORD PTR [ecx], eax
; Line 201
	jmp	$L489
$L490:
; Line 202
	jmp	$L485
$L486:
; Line 204
$L453:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_init_reg_sets ENDP
_TEXT	ENDS
PUBLIC	_init_reg_sets_1
EXTRN	_warning:NEAR
_DATA	SEGMENT
$SG509	DB	'call-clobbered register used for global register variabl'
	DB	'e', 00H
_DATA	ENDS
_TEXT	SEGMENT
_i$ = -4
_init_reg_sets_1 PROC NEAR
; Line 211
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 221
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L503
$L504:
	inc	DWORD PTR _i$[ebp]
$L503:
	cmp	DWORD PTR _i$[ebp], 10			; 0000000aH
	jge	$L505
; Line 222
	mov	eax, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR _global_regs[eax]
	or	eax, eax
	je	$L506
; Line 224
	mov	eax, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR _call_used_regs[eax]
	or	eax, eax
	je	$L507
	mov	eax, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR _fixed_regs[eax]
	or	eax, eax
	jne	$L507
; Line 225
	push	OFFSET $SG509
	call	_warning
	add	esp, 4
; Line 226
$L507:
	mov	eax, DWORD PTR _i$[ebp]
	mov	BYTE PTR _fixed_regs[eax], 1
; Line 228
	mov	eax, DWORD PTR _i$[ebp]
	mov	BYTE PTR _call_used_regs[eax], 1
; Line 233
$L506:
	jmp	$L504
$L505:
	mov	WORD PTR _fixed_reg_set, 0
; Line 234
	mov	WORD PTR _call_used_reg_set, 0
; Line 235
	mov	WORD PTR _call_fixed_reg_set, 0
; Line 237
	push	10					; 0000000aH
	push	OFFSET _fixed_regs
	push	OFFSET _call_fixed_regs
	call	_memcpy
	add	esp, 12					; 0000000cH
; Line 242
	mov	BYTE PTR _call_fixed_regs+2, 1
; Line 245
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L510
$L511:
	inc	DWORD PTR _i$[ebp]
$L510:
	cmp	DWORD PTR _i$[ebp], 10			; 0000000aH
	jge	$L512
; Line 247
	cmp	DWORD PTR _i$[ebp], 0
	je	$L514
	cmp	DWORD PTR _i$[ebp], 8
	jne	$L513
$L514:
; Line 248
	mov	eax, DWORD PTR _i$[ebp]
	mov	BYTE PTR _call_fixed_regs[eax], 1
; Line 249
$L513:
	mov	eax, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR _fixed_regs[eax]
	or	eax, eax
	je	$L515
; Line 250
	mov	eax, 1
	mov	cl, BYTE PTR _i$[ebp]
	shl	eax, cl
	movsx	ecx, WORD PTR _fixed_reg_set
	or	eax, ecx
	mov	WORD PTR _fixed_reg_set, ax
; Line 251
$L515:
	mov	eax, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR _call_used_regs[eax]
	or	eax, eax
	je	$L516
; Line 252
	mov	eax, 1
	mov	cl, BYTE PTR _i$[ebp]
	shl	eax, cl
	movsx	ecx, WORD PTR _call_used_reg_set
	or	eax, ecx
	mov	WORD PTR _call_used_reg_set, ax
; Line 253
$L516:
	mov	eax, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR _call_fixed_regs[eax]
	or	eax, eax
	je	$L517
; Line 254
	mov	eax, 1
	mov	cl, BYTE PTR _i$[ebp]
	shl	eax, cl
	movsx	ecx, WORD PTR _call_fixed_reg_set
	or	eax, ecx
	mov	WORD PTR _call_fixed_reg_set, ax
; Line 255
$L517:
	jmp	$L511
$L512:
; Line 256
$L501:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_init_reg_sets_1 ENDP
_TEXT	ENDS
PUBLIC	_fix_register
EXTRN	_strcmp:NEAR
_DATA	SEGMENT
	ORG $+2
$SG530	DB	'unknown register name: %s', 00H
_DATA	ENDS
_TEXT	SEGMENT
_name$ = 8
_fixed$ = 12
_call_used$ = 16
_i$ = -4
_fix_register PROC NEAR
; Line 266
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 272
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L524
$L525:
	inc	DWORD PTR _i$[ebp]
$L524:
	cmp	DWORD PTR _i$[ebp], 10			; 0000000aH
	jge	$L526
; Line 273
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _reg_names[eax*4]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L528
; Line 275
	mov	al, BYTE PTR _fixed$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	BYTE PTR _fixed_regs[ecx], al
; Line 276
	mov	al, BYTE PTR _call_used$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	BYTE PTR _call_used_regs[ecx], al
; Line 277
	jmp	$L526
; Line 280
$L528:
	jmp	$L525
$L526:
	cmp	DWORD PTR _i$[ebp], 10			; 0000000aH
	jne	$L529
; Line 282
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	push	OFFSET $SG530
	call	_warning
	add	esp, 8
; Line 283
	jmp	$L522
; Line 285
$L529:
$L522:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_fix_register ENDP
_TEXT	ENDS
PUBLIC	_reg_preferred_class
_BSS	SEGMENT
_prefclass$S533 DD 01H DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
_regno$ = 8
_reg_preferred_class PROC NEAR
; Line 325
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 326
	cmp	DWORD PTR _prefclass$S533, 0
	jne	$L539
; Line 327
	mov	eax, 10					; 0000000aH
	jmp	$L538
; Line 328
$L539:
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _prefclass$S533
	movsx	eax, BYTE PTR [eax+ecx]
	jmp	$L538
; Line 329
$L538:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_reg_preferred_class ENDP
_TEXT	ENDS
PUBLIC	_reg_preferred_or_nothing
_BSS	SEGMENT
_preferred_or_nothing$S534 DD 01H DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
_regno$ = 8
_reg_preferred_or_nothing PROC NEAR
; Line 333
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 334
	cmp	DWORD PTR _prefclass$S533, 0
	jne	$L543
; Line 335
	sub	eax, eax
	jmp	$L542
; Line 336
$L543:
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _preferred_or_nothing$S534
	movsx	eax, BYTE PTR [eax+ecx]
	jmp	$L542
; Line 337
$L542:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_reg_preferred_or_nothing ENDP
_TEXT	ENDS
PUBLIC	_regclass_init
_TEXT	SEGMENT
_regclass_init PROC NEAR
; Line 344
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 345
	mov	DWORD PTR _prefclass$S533, 0
; Line 346
$L545:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_regclass_init ENDP
_TEXT	ENDS
PUBLIC	_reg_class_record
PUBLIC	_regclass
EXTRN	_prev_real_insn:NEAR
EXTRN	_gen_move_insn:NEAR
EXTRN	_asm_noperands:NEAR
EXTRN	_decode_asm_operands:NEAR
EXTRN	_n_basic_blocks:DWORD
EXTRN	_basic_block_head:DWORD
EXTRN	_reg_n_refs:DWORD
EXTRN	_reg_n_sets:DWORD
EXTRN	_recog_memoized:NEAR
EXTRN	_init_recog:NEAR
EXTRN	_insn_extract:NEAR
EXTRN	_alloca:NEAR
EXTRN	_recog_operand:BYTE
EXTRN	_recog_operand_loc:BYTE
EXTRN	_recog_dup_loc:BYTE
EXTRN	_recog_dup_num:BYTE
EXTRN	_optimize:DWORD
EXTRN	_insn_n_operands:BYTE
EXTRN	_insn_n_dups:BYTE
EXTRN	_insn_operand_constraint:BYTE
EXTRN	_oballoc:NEAR
EXTRN	_emit_insn_before:NEAR
EXTRN	_obfree:NEAR
EXTRN	_rtx_equal_p:NEAR
_BSS	SEGMENT
_savings$S532 DD 01H DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
_previnsn$578 = -32
_newinsn$579 = -28
_b$583 = -36
_best_savings$595 = -48
_best$596 = -52
_class$597 = -44
_p$598 = -40
_f$ = 8
_nregs$ = 12
_insn$ = -4
_i$ = -8
_noperands$562 = -20
_operands$563 = -16
_constraints$565 = -12
_insn_code_number$571 = -24
_regclass PROC NEAR
; Line 357
	push	ebp
	mov	ebp, esp
	sub	esp, 52					; 00000034H
	push	ebx
	push	esi
	push	edi
; Line 362
	call	_init_recog
; Line 366
	mov	eax, DWORD PTR _nregs$[ebp]
	add	eax, eax
	lea	eax, DWORD PTR [eax+eax*2]
	lea	eax, DWORD PTR [eax+eax*4]
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _savings$S532, eax
; Line 367
	mov	eax, DWORD PTR _nregs$[ebp]
	add	eax, eax
	lea	eax, DWORD PTR [eax+eax*2]
	lea	eax, DWORD PTR [eax+eax*4]
	push	eax
	push	0
	mov	eax, DWORD PTR _savings$S532
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 372
	mov	eax, DWORD PTR _f$[ebp]
	mov	DWORD PTR _insn$[ebp], eax
	jmp	$L554
$L555:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _insn$[ebp], eax
$L554:
	cmp	DWORD PTR _insn$[ebp], 0
	je	$L556
; Line 380
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 851968				; 000d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L559
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1703936				; 001a0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L559
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1769472				; 001b0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L559
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1376256				; 00150000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L558
$L559:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 917504				; 000e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L560
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1507328				; 00170000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L560
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1572864				; 00180000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L558
$L560:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 983040				; 000f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L557
$L558:
; Line 382
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 851968				; 000d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L561
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_asm_noperands
	add	esp, 4
	or	eax, eax
	jl	$L561
; Line 384
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_asm_noperands
	add	esp, 4
	mov	DWORD PTR _noperands$562[ebp], eax
; Line 387
	mov	eax, DWORD PTR _noperands$562[ebp]
	shl	eax, 2
	push	eax
	call	_oballoc
	add	esp, 4
	mov	DWORD PTR _operands$563[ebp], eax
; Line 389
	mov	eax, DWORD PTR _noperands$562[ebp]
	shl	eax, 2
	push	eax
	call	_oballoc
	add	esp, 4
	mov	DWORD PTR _constraints$565[ebp], eax
; Line 391
	push	0
	mov	eax, DWORD PTR _constraints$565[ebp]
	push	eax
	push	0
	mov	eax, DWORD PTR _operands$563[ebp]
	push	eax
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_decode_asm_operands
	add	esp, 20					; 00000014H
; Line 393
	mov	eax, DWORD PTR _noperands$562[ebp]
	dec	eax
	mov	DWORD PTR _i$[ebp], eax
	jmp	$L566
$L567:
	dec	DWORD PTR _i$[ebp]
$L566:
	cmp	DWORD PTR _i$[ebp], 0
	jl	$L568
; Line 394
	mov	eax, DWORD PTR _constraints$565[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _operands$563[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	call	_reg_class_record
	add	esp, 12					; 0000000cH
	jmp	$L567
$L568:
; Line 396
	mov	eax, DWORD PTR _operands$563[ebp]
	push	eax
	call	_obfree
	add	esp, 4
; Line 398
	jmp	$L570
$L561:
; Line 400
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_recog_memoized
	add	esp, 4
	mov	DWORD PTR _insn_code_number$571[ebp], eax
; Line 402
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_insn_extract
	add	esp, 4
; Line 404
	mov	eax, DWORD PTR _insn_code_number$571[ebp]
	mov	eax, DWORD PTR _insn_n_operands[eax*4]
	dec	eax
	mov	DWORD PTR _i$[ebp], eax
	jmp	$L572
$L573:
	dec	DWORD PTR _i$[ebp]
$L572:
	cmp	DWORD PTR _i$[ebp], 0
	jl	$L574
; Line 406
	mov	eax, DWORD PTR _insn_code_number$571[ebp]
	mov	ecx, eax
	shl	eax, 3
	sub	eax, ecx
	lea	eax, DWORD PTR _insn_operand_constraint[eax*4]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _recog_operand[eax*4]
	push	eax
	call	_reg_class_record
	add	esp, 12					; 0000000cH
	jmp	$L573
$L574:
; Line 422
	cmp	DWORD PTR _optimize, 0
	je	$L576
	mov	eax, DWORD PTR _insn_code_number$571[ebp]
	cmp	DWORD PTR _insn_n_operands[eax*4], 3
	jl	$L576
	mov	eax, DWORD PTR _insn_code_number$571[ebp]
	mov	ecx, eax
	shl	eax, 3
	sub	eax, ecx
	mov	eax, DWORD PTR _insn_operand_constraint[eax*4+4]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 48					; 00000030H
	jne	$L576
	mov	eax, DWORD PTR _insn_code_number$571[ebp]
	mov	ecx, eax
	shl	eax, 3
	sub	eax, ecx
	mov	eax, DWORD PTR _insn_operand_constraint[eax*4+4]
	movsx	eax, BYTE PTR [eax+1]
	or	eax, eax
	jne	$L576
	mov	eax, DWORD PTR _recog_operand+4
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L577
	mov	eax, DWORD PTR _recog_operand+4
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L577
	mov	eax, DWORD PTR _recog_operand+4
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L577
	mov	eax, DWORD PTR _recog_operand+4
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L576
$L577:
	mov	eax, DWORD PTR _recog_operand+4
	push	eax
	mov	eax, DWORD PTR _recog_operand
	push	eax
	call	_rtx_equal_p
	add	esp, 8
	or	eax, eax
	jne	$L576
	mov	eax, DWORD PTR _recog_operand+8
	push	eax
	mov	eax, DWORD PTR _recog_operand
	push	eax
	call	_rtx_equal_p
	add	esp, 8
	or	eax, eax
	jne	$L576
	mov	eax, DWORD PTR _recog_operand
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L576
; Line 424
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_prev_real_insn
	add	esp, 4
	mov	DWORD PTR _previnsn$578[ebp], eax
; Line 428
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _recog_operand+4
	push	eax
	mov	eax, DWORD PTR _recog_operand
	push	eax
	call	_gen_move_insn
	add	esp, 8
	push	eax
	call	_emit_insn_before
	add	esp, 8
	mov	DWORD PTR _newinsn$579[ebp], eax
; Line 432
	cmp	DWORD PTR _previnsn$578[ebp], 0
	je	$L582
	mov	eax, DWORD PTR _previnsn$578[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 917504				; 000e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L581
$L582:
; Line 435
	mov	DWORD PTR _b$583[ebp], 0
	jmp	$L584
$L585:
	inc	DWORD PTR _b$583[ebp]
$L584:
	mov	eax, DWORD PTR _b$583[ebp]
	cmp	DWORD PTR _n_basic_blocks, eax
	jle	$L586
; Line 436
	mov	eax, DWORD PTR _b$583[ebp]
	mov	ecx, DWORD PTR _basic_block_head
	mov	edx, DWORD PTR _insn$[ebp]
	cmp	DWORD PTR [ecx+eax*4], edx
	jne	$L587
; Line 437
	mov	eax, DWORD PTR _newinsn$579[ebp]
	mov	ecx, DWORD PTR _b$583[ebp]
	mov	edx, DWORD PTR _basic_block_head
	mov	DWORD PTR [edx+ecx*4], eax
; Line 438
$L587:
	jmp	$L585
$L586:
; Line 441
$L581:
	mov	eax, DWORD PTR _recog_operand
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg_n_sets
	inc	WORD PTR [ecx+eax*2]
; Line 443
	mov	eax, DWORD PTR _recog_operand
	mov	ecx, DWORD PTR _recog_operand_loc+4
	mov	DWORD PTR [ecx], eax
; Line 444
	mov	eax, DWORD PTR _insn_code_number$571[ebp]
	mov	eax, DWORD PTR _insn_n_dups[eax*4]
	dec	eax
	mov	DWORD PTR _i$[ebp], eax
	jmp	$L588
$L589:
	dec	DWORD PTR _i$[ebp]
$L588:
	cmp	DWORD PTR _i$[ebp], 0
	jl	$L590
; Line 445
	mov	eax, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR _recog_dup_num[eax]
	cmp	eax, 1
	jne	$L591
; Line 446
	mov	eax, DWORD PTR _recog_operand
	mov	ecx, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _recog_dup_loc[ecx*4]
	mov	DWORD PTR [ecx], eax
; Line 449
$L591:
	jmp	$L589
$L590:
; Line 450
$L576:
$L570:
; Line 456
$L557:
	jmp	$L555
$L556:
	mov	eax, DWORD PTR _nregs$[ebp]
	push	eax
	call	_oballoc
	add	esp, 4
	mov	DWORD PTR _prefclass$S533, eax
; Line 458
	mov	eax, DWORD PTR _nregs$[ebp]
	push	eax
	call	_oballoc
	add	esp, 4
	mov	DWORD PTR _preferred_or_nothing$S534, eax
; Line 460
	mov	DWORD PTR _i$[ebp], 10			; 0000000aH
	jmp	$L592
$L593:
	inc	DWORD PTR _i$[ebp]
$L592:
	mov	eax, DWORD PTR _nregs$[ebp]
	cmp	DWORD PTR _i$[ebp], eax
	jge	$L594
; Line 462
	mov	DWORD PTR _best_savings$595[ebp], 0
; Line 463
	mov	DWORD PTR _best$596[ebp], 12		; 0000000cH
; Line 468
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, eax
	lea	eax, DWORD PTR [eax+eax*2]
	lea	eax, DWORD PTR [eax+eax*4]
	add	eax, DWORD PTR _savings$S532
	mov	DWORD PTR _p$598[ebp], eax
; Line 470
	mov	DWORD PTR _class$597[ebp], 11		; 0000000bH
	jmp	$L599
$L600:
	dec	DWORD PTR _class$597[ebp]
$L599:
	cmp	DWORD PTR _class$597[ebp], 0
	jle	$L601
; Line 472
	mov	eax, DWORD PTR _class$597[ebp]
	mov	ecx, DWORD PTR _p$598[ebp]
	movsx	eax, WORD PTR [ecx+eax*2]
	cmp	eax, DWORD PTR _best_savings$595[ebp]
	jle	$L602
; Line 474
	mov	eax, DWORD PTR _class$597[ebp]
	mov	ecx, DWORD PTR _p$598[ebp]
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	DWORD PTR _best_savings$595[ebp], eax
; Line 475
	mov	eax, DWORD PTR _class$597[ebp]
	mov	DWORD PTR _best$596[ebp], eax
; Line 477
	jmp	$L603
$L602:
	mov	eax, DWORD PTR _class$597[ebp]
	mov	ecx, DWORD PTR _p$598[ebp]
	movsx	eax, WORD PTR [ecx+eax*2]
	cmp	eax, DWORD PTR _best_savings$595[ebp]
	jne	$L604
; Line 479
	mov	eax, DWORD PTR _best$596[ebp]
	mov	ecx, eax
	lea	eax, DWORD PTR [eax+eax*2]
	lea	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _class$597[ebp]
	shl	ecx, 2
	mov	eax, DWORD PTR _reg_class_subunion[ecx+eax*4]
	mov	DWORD PTR _best$596[ebp], eax
; Line 481
$L604:
$L603:
	jmp	$L600
$L601:
; Line 492
	mov	al, BYTE PTR _best$596[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _prefclass$S533
	mov	BYTE PTR [ecx+edx], al
; Line 500
	cmp	DWORD PTR _reg_n_refs, 0
	je	$L605
; Line 503
	mov	eax, DWORD PTR _p$598[ebp]
	movsx	eax, WORD PTR [eax+26]
	mov	ecx, DWORD PTR _p$598[ebp]
	movsx	ecx, WORD PTR [ecx+28]
	add	eax, ecx
	mov	ecx, DWORD PTR _best_savings$595[ebp]
	mov	edx, DWORD PTR _p$598[ebp]
	movsx	edx, WORD PTR [edx+20]
	sub	ecx, edx
	cmp	eax, ecx
	mov	eax, 0
	setle	al
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _preferred_or_nothing$S534
	mov	BYTE PTR [ecx+edx], al
; Line 504
$L605:
	jmp	$L593
$L594:
; Line 506
$L549:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_regclass ENDP
_TEXT	ENDS
PUBLIC	_record_address_regs
_TEXT	SEGMENT
_i$640 = -28
_pp$641 = -40
_class1$642 = -36
_cost$643 = -32
_op$ = 8
_opno$ = 12
_constraints$ = 16
_constraint$ = -8
_p$ = -16
_class$ = -12
_next$ = -4
_memok$ = -24
_double_cost$ = -20
_reg_class_record PROC NEAR
; Line 523
	push	ebp
	mov	ebp, esp
	sub	esp, 48					; 00000030H
	push	ebx
	push	esi
	push	edi
; Line 524
	mov	eax, DWORD PTR _opno$[ebp]
	mov	ecx, DWORD PTR _constraints$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _constraint$[ebp], eax
; Line 526
	mov	DWORD PTR _class$[ebp], 0
; Line 527
	mov	DWORD PTR _next$[ebp], 0
; Line 528
	mov	DWORD PTR _memok$[ebp], 0
; Line 529
	mov	DWORD PTR _double_cost$[ebp], 0
; Line 531
$L617:
; Line 533
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L619
; Line 534
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _op$[ebp], eax
; Line 535
	jmp	$L620
$L619:
	jmp	$L618
$L620:
; Line 536
	jmp	$L617
$L618:
; Line 540
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L621
; Line 541
	push	0
	push	2
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_record_address_regs
	add	esp, 12					; 0000000cH
; Line 543
$L621:
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L622
; Line 548
	cmp	DWORD PTR _constraint$[ebp], 0
	je	$L623
	mov	eax, DWORD PTR _constraint$[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 112				; 00000070H
	jne	$L623
; Line 549
	push	0
	push	2
	mov	eax, DWORD PTR _op$[ebp]
	push	eax
	call	_record_address_regs
	add	esp, 12					; 0000000cH
; Line 550
$L623:
	jmp	$L609
; Line 555
$L622:
	mov	eax, DWORD PTR _constraint$[ebp]
	mov	DWORD PTR _p$[ebp], eax
	jmp	$L624
$L625:
	inc	DWORD PTR _p$[ebp]
$L624:
	mov	eax, DWORD PTR _p$[ebp]
	movsx	eax, BYTE PTR [eax]
	or	eax, eax
	jne	$L627
	cmp	DWORD PTR _next$[ebp], 0
	je	$L626
$L627:
; Line 557
	mov	eax, DWORD PTR _p$[ebp]
	movsx	eax, BYTE PTR [eax]
	or	eax, eax
	jne	$L628
; Line 559
	mov	eax, DWORD PTR _next$[ebp]
	mov	DWORD PTR _p$[ebp], eax
; Line 560
	mov	DWORD PTR _next$[ebp], 0
; Line 562
$L628:
	mov	eax, DWORD PTR _p$[ebp]
	movsx	eax, BYTE PTR [eax]
	mov	DWORD PTR -48+[ebp], eax
	jmp	$L629
; Line 564
$L633:
; Line 578
	jmp	$L630
; Line 580
$L634:
; Line 582
	mov	DWORD PTR _double_cost$[ebp], 1
; Line 583
	jmp	$L630
; Line 585
$L635:
; Line 587
	mov	DWORD PTR _memok$[ebp], 1
; Line 588
	jmp	$L630
; Line 592
$L636:
; Line 593
	inc	DWORD PTR _p$[ebp]
; Line 594
	jmp	$L630
; Line 596
$L637:
; Line 599
	mov	eax, DWORD PTR _class$[ebp]
	mov	ecx, eax
	lea	eax, DWORD PTR [eax+eax*2]
	lea	eax, DWORD PTR [ecx+eax*4]
	mov	eax, DWORD PTR _reg_class_subunion[eax*4+40]
	mov	DWORD PTR _class$[ebp], eax
; Line 600
	jmp	$L630
; Line 602
$L638:
; Line 609
	mov	eax, DWORD PTR _p$[ebp]
	movsx	eax, BYTE PTR [eax]
	mov	ecx, DWORD PTR _constraints$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4-192]
	mov	DWORD PTR _next$[ebp], eax
; Line 610
	jmp	$L630
; Line 612
$L639:
; Line 614
	mov	eax, DWORD PTR _p$[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 114				; 00000072H
	jne	$L765
	mov	DWORD PTR -44+[ebp], 10			; 0000000aH
	jmp	$L766
$L765:
	mov	eax, DWORD PTR _p$[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 113				; 00000071H
	jne	$L767
	mov	DWORD PTR -44+[ebp], 6
	jmp	$L768
$L767:
	mov	eax, DWORD PTR _p$[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 102				; 00000066H
	jne	$L769
	mov	DWORD PTR -44+[ebp], 11			; 0000000bH
	jmp	$L770
$L769:
	mov	eax, DWORD PTR _p$[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 97					; 00000061H
	jne	$L771
	mov	DWORD PTR -44+[ebp], 1
	jmp	$L772
$L771:
	mov	eax, DWORD PTR _p$[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 98					; 00000062H
	jne	$L773
	mov	DWORD PTR -44+[ebp], 5
	jmp	$L774
$L773:
	mov	eax, DWORD PTR _p$[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 99					; 00000063H
	jne	$L775
	mov	DWORD PTR -44+[ebp], 4
	jmp	$L776
$L775:
	mov	eax, DWORD PTR _p$[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 100				; 00000064H
	jne	$L777
	mov	DWORD PTR -44+[ebp], 2
	jmp	$L778
$L777:
	mov	eax, DWORD PTR _p$[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 65					; 00000041H
	jne	$L779
	mov	DWORD PTR -44+[ebp], 3
	jmp	$L780
$L779:
	mov	eax, DWORD PTR _p$[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 83					; 00000053H
	jne	$L781
	mov	DWORD PTR -44+[ebp], 7
	jmp	$L782
$L781:
	mov	eax, DWORD PTR _p$[ebp]
	movsx	eax, BYTE PTR [eax]
	sub	eax, 68					; 00000044H
	cmp	eax, 1
	sbb	eax, eax
	and	eax, 8
	mov	DWORD PTR -44+[ebp], eax
$L782:
$L780:
$L778:
$L776:
$L774:
$L772:
$L770:
$L768:
$L766:
	mov	eax, DWORD PTR -44+[ebp]
	mov	ecx, DWORD PTR _class$[ebp]
	mov	edx, ecx
	lea	ecx, DWORD PTR [ecx+ecx*2]
	lea	ecx, DWORD PTR [edx+ecx*4]
	shl	ecx, 2
	mov	eax, DWORD PTR _reg_class_subunion[ecx+eax*4]
	mov	DWORD PTR _class$[ebp], eax
; Line 615
	jmp	$L630
$L629:
	sub	DWORD PTR -48+[ebp], 33			; 00000021H
	cmp	DWORD PTR -48+[ebp], 82			; 00000052H
	ja	$L639
	shl	DWORD PTR -48+[ebp], 2
	mov	eax, DWORD PTR -48+[ebp]
	jmp	DWORD PTR $L783[eax]
$L783:
	DD	OFFSET $L633
	DD	OFFSET $L639
	DD	OFFSET $L633
	DD	OFFSET $L639
	DD	OFFSET $L633
	DD	OFFSET $L633
	DD	OFFSET $L639
	DD	OFFSET $L639
	DD	OFFSET $L639
	DD	OFFSET $L636
	DD	OFFSET $L634
	DD	OFFSET $L633
	DD	OFFSET $L639
	DD	OFFSET $L639
	DD	OFFSET $L639
	DD	OFFSET $L638
	DD	OFFSET $L638
	DD	OFFSET $L638
	DD	OFFSET $L638
	DD	OFFSET $L638
	DD	OFFSET $L639
	DD	OFFSET $L639
	DD	OFFSET $L639
	DD	OFFSET $L639
	DD	OFFSET $L639
	DD	OFFSET $L639
	DD	OFFSET $L639
	DD	OFFSET $L639
	DD	OFFSET $L633
	DD	OFFSET $L639
	DD	OFFSET $L633
	DD	OFFSET $L639
	DD	OFFSET $L639
	DD	OFFSET $L639
	DD	OFFSET $L639
	DD	OFFSET $L639
	DD	OFFSET $L639
	DD	OFFSET $L633
	DD	OFFSET $L633
	DD	OFFSET $L633
	DD	OFFSET $L639
	DD	OFFSET $L639
	DD	OFFSET $L639
	DD	OFFSET $L639
	DD	OFFSET $L639
	DD	OFFSET $L639
	DD	OFFSET $L639
	DD	OFFSET $L639
	DD	OFFSET $L639
	DD	OFFSET $L639
	DD	OFFSET $L639
	DD	OFFSET $L639
	DD	OFFSET $L639
	DD	OFFSET $L639
	DD	OFFSET $L639
	DD	OFFSET $L639
	DD	OFFSET $L639
	DD	OFFSET $L639
	DD	OFFSET $L639
	DD	OFFSET $L639
	DD	OFFSET $L639
	DD	OFFSET $L639
	DD	OFFSET $L639
	DD	OFFSET $L639
	DD	OFFSET $L639
	DD	OFFSET $L639
	DD	OFFSET $L639
	DD	OFFSET $L639
	DD	OFFSET $L639
	DD	OFFSET $L639
	DD	OFFSET $L637
	DD	OFFSET $L639
	DD	OFFSET $L633
	DD	OFFSET $L639
	DD	OFFSET $L639
	DD	OFFSET $L639
	DD	OFFSET $L635
	DD	OFFSET $L633
	DD	OFFSET $L635
	DD	OFFSET $L633
	DD	OFFSET $L639
	DD	OFFSET $L637
	DD	OFFSET $L633
$L630:
; Line 616
	jmp	$L625
$L626:
; Line 622
	mov	eax, DWORD PTR _double_cost$[ebp]
	lea	eax, DWORD PTR [eax*2+2]
	mov	DWORD PTR _cost$643[ebp], eax
; Line 623
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax+4]
	add	eax, eax
	lea	eax, DWORD PTR [eax+eax*2]
	lea	eax, DWORD PTR [eax+eax*4]
	add	eax, DWORD PTR _savings$S532
	mov	DWORD PTR _pp$641[ebp], eax
; Line 628
	cmp	DWORD PTR _class$[ebp], 0
	je	$L644
	cmp	DWORD PTR _class$[ebp], 12		; 0000000cH
	je	$L644
; Line 630
	mov	eax, DWORD PTR _class$[ebp]
	mov	ecx, DWORD PTR _pp$641[ebp]
	movsx	eax, WORD PTR [ecx+eax*2]
	add	eax, DWORD PTR _cost$643[ebp]
	mov	ecx, DWORD PTR _class$[ebp]
	mov	edx, DWORD PTR _pp$641[ebp]
	mov	WORD PTR [edx+ecx*2], ax
; Line 631
	mov	DWORD PTR _i$640[ebp], 0
	jmp	$L645
$L646:
	inc	DWORD PTR _i$640[ebp]
$L645:
; Line 633
	mov	eax, DWORD PTR _i$640[ebp]
	mov	ecx, DWORD PTR _class$[ebp]
	mov	edx, ecx
	lea	ecx, DWORD PTR [ecx+ecx*2]
	lea	ecx, DWORD PTR [edx+ecx*4]
	shl	ecx, 2
	mov	eax, DWORD PTR _reg_class_subclasses[ecx+eax*4]
	mov	DWORD PTR _class1$642[ebp], eax
; Line 634
	cmp	DWORD PTR _class1$642[ebp], 13		; 0000000dH
	jne	$L648
; Line 635
	jmp	$L647
; Line 636
$L648:
	mov	eax, DWORD PTR _class1$642[ebp]
	mov	ecx, DWORD PTR _pp$641[ebp]
	movsx	eax, WORD PTR [ecx+eax*2]
	add	eax, DWORD PTR _cost$643[ebp]
	mov	ecx, DWORD PTR _class1$642[ebp]
	mov	edx, DWORD PTR _pp$641[ebp]
	mov	WORD PTR [edx+ecx*2], ax
; Line 637
	jmp	$L646
$L647:
; Line 640
$L644:
	cmp	DWORD PTR _memok$[ebp], 0
	jne	$L649
; Line 641
	mov	eax, DWORD PTR _pp$641[ebp]
	movsx	eax, WORD PTR [eax+26]
	mov	ecx, DWORD PTR _double_cost$[ebp]
	lea	eax, DWORD PTR [eax+ecx*2]
	inc	eax
	mov	ecx, DWORD PTR _pp$641[ebp]
	mov	WORD PTR [ecx+26], ax
; Line 642
$L649:
	mov	eax, DWORD PTR _pp$641[ebp]
	inc	WORD PTR [eax+28]
; Line 644
$L609:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_reg_class_record ENDP
_TEXT	ENDS
EXTRN	_rtx_length:BYTE
EXTRN	_rtx_format:BYTE
EXTRN	_regno_pointer_flag:DWORD
_TEXT	SEGMENT
_class1$704 = -44
_i$706 = -52
_i$712 = -56
_x$ = 8
_bcost$ = 12
_icost$ = 16
_fmt$718 = -60
_code$ = -4
_i$719 = -64
_arg0$661 = -32
_arg1$662 = -20
_code0$663 = -24
_code1$664 = -8
_icost0$665 = -36
_icost1$666 = -28
_suppress1$667 = -16
_suppress0$668 = -12
_pp$702 = -48
_class$703 = -40
_record_address_regs PROC NEAR
; Line 655
	push	ebp
	mov	ebp, esp
	sub	esp, 68					; 00000044H
	push	ebx
	push	esi
	push	edi
; Line 656
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$[ebp], eax
; Line 658
	mov	eax, DWORD PTR _code$[ebp]
	mov	DWORD PTR -68+[ebp], eax
	jmp	$L655
; Line 660
$L659:
; Line 666
	jmp	$L653
; Line 668
$L660:
; Line 675
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _arg0$661[ebp], eax
; Line 676
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _arg1$662[ebp], eax
; Line 677
	mov	eax, DWORD PTR _arg0$661[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code0$663[ebp], eax
; Line 678
	mov	eax, DWORD PTR _arg1$662[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code1$664[ebp], eax
; Line 679
	mov	DWORD PTR _icost0$665[ebp], 0
; Line 680
	mov	DWORD PTR _icost1$666[ebp], 0
; Line 681
	mov	DWORD PTR _suppress1$667[ebp], 0
; Line 682
	mov	DWORD PTR _suppress0$668[ebp], 0
; Line 685
$L670:
	cmp	DWORD PTR _code0$663[ebp], 35		; 00000023H
	jne	$L671
; Line 686
	mov	eax, DWORD PTR _arg0$661[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _arg0$661[ebp], eax
	mov	eax, DWORD PTR _arg0$661[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code0$663[ebp], eax
	jmp	$L670
$L671:
; Line 687
$L673:
	cmp	DWORD PTR _code1$664[ebp], 35		; 00000023H
	jne	$L674
; Line 688
	mov	eax, DWORD PTR _arg1$662[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _arg1$662[ebp], eax
	mov	eax, DWORD PTR _arg1$662[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code1$664[ebp], eax
	jmp	$L673
$L674:
; Line 690
	cmp	DWORD PTR _code0$663[ebp], 47		; 0000002fH
	je	$L676
	cmp	DWORD PTR _code1$664[ebp], 37		; 00000025H
	jne	$L675
$L676:
; Line 691
	mov	DWORD PTR _icost0$665[ebp], 2
; Line 692
	jmp	$L677
$L675:
	cmp	DWORD PTR _code1$664[ebp], 47		; 0000002fH
	je	$L679
	cmp	DWORD PTR _code0$663[ebp], 37		; 00000025H
	jne	$L678
$L679:
; Line 693
	mov	DWORD PTR _icost1$666[ebp], 2
; Line 694
	jmp	$L680
$L678:
	cmp	DWORD PTR _code0$663[ebp], 30		; 0000001eH
	jne	$L681
; Line 695
	mov	DWORD PTR _suppress0$668[ebp], 1
; Line 696
	jmp	$L682
$L681:
	cmp	DWORD PTR _code1$664[ebp], 30		; 0000001eH
	jne	$L683
; Line 697
	mov	DWORD PTR _suppress1$667[ebp], 1
; Line 698
	jmp	$L684
$L683:
	cmp	DWORD PTR _code0$663[ebp], 34		; 00000022H
	jne	$L685
	cmp	DWORD PTR _code1$664[ebp], 34		; 00000022H
	jne	$L685
; Line 700
	mov	eax, DWORD PTR _arg0$661[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _regno_pointer_flag
	movsx	eax, BYTE PTR [eax+ecx]
	or	eax, eax
	je	$L686
; Line 701
	mov	DWORD PTR _icost1$666[ebp], 2
; Line 702
	jmp	$L687
$L686:
	mov	eax, DWORD PTR _arg1$662[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _regno_pointer_flag
	movsx	eax, BYTE PTR [eax+ecx]
	or	eax, eax
	je	$L688
; Line 703
	mov	DWORD PTR _icost0$665[ebp], 2
; Line 704
	jmp	$L689
$L688:
; Line 705
	mov	DWORD PTR _icost1$666[ebp], 1
	mov	eax, DWORD PTR _icost1$666[ebp]
	mov	DWORD PTR _icost0$665[ebp], eax
$L689:
$L687:
; Line 707
	jmp	$L690
$L685:
	cmp	DWORD PTR _code0$663[ebp], 34		; 00000022H
	jne	$L691
; Line 710
	cmp	DWORD PTR _code1$664[ebp], 44		; 0000002cH
	jne	$L692
	mov	eax, DWORD PTR _arg0$661[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _regno_pointer_flag
	movsx	eax, BYTE PTR [eax+ecx]
	or	eax, eax
	jne	$L692
; Line 711
	mov	DWORD PTR _icost0$665[ebp], 2
; Line 712
	jmp	$L693
$L692:
; Line 713
	mov	eax, DWORD PTR _arg0$661[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _regno_pointer_flag
	mov	BYTE PTR [eax+ecx], 1
$L693:
; Line 715
	jmp	$L694
$L691:
	cmp	DWORD PTR _code1$664[ebp], 34		; 00000022H
	jne	$L695
; Line 718
	cmp	DWORD PTR _code0$663[ebp], 44		; 0000002cH
	jne	$L696
	mov	eax, DWORD PTR _arg1$662[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _regno_pointer_flag
	movsx	eax, BYTE PTR [eax+ecx]
	or	eax, eax
	jne	$L696
; Line 719
	mov	DWORD PTR _icost1$666[ebp], 2
; Line 720
	jmp	$L697
$L696:
; Line 721
	mov	eax, DWORD PTR _arg1$662[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _regno_pointer_flag
	mov	BYTE PTR [eax+ecx], 1
$L697:
; Line 729
$L695:
$L694:
$L690:
$L684:
$L682:
$L680:
$L677:
	cmp	DWORD PTR _suppress0$668[ebp], 0
	jne	$L698
; Line 730
	mov	eax, DWORD PTR _icost0$665[ebp]
	push	eax
	mov	eax, 2
	sub	eax, DWORD PTR _icost0$665[ebp]
	push	eax
	mov	eax, DWORD PTR _arg0$661[ebp]
	push	eax
	call	_record_address_regs
	add	esp, 12					; 0000000cH
; Line 731
$L698:
	cmp	DWORD PTR _suppress1$667[ebp], 0
	jne	$L699
; Line 732
	mov	eax, DWORD PTR _icost1$666[ebp]
	push	eax
	mov	eax, 2
	sub	eax, DWORD PTR _icost1$666[ebp]
	push	eax
	mov	eax, DWORD PTR _arg1$662[ebp]
	push	eax
	call	_record_address_regs
	add	esp, 12					; 0000000cH
; Line 733
$L699:
; Line 734
	jmp	$L656
; Line 736
$L700:
; Line 743
	mov	eax, DWORD PTR _icost$[ebp]
	add	eax, eax
	push	eax
	mov	eax, DWORD PTR _bcost$[ebp]
	add	eax, eax
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_record_address_regs
	add	esp, 12					; 0000000cH
; Line 744
	jmp	$L656
; Line 746
$L701:
; Line 750
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	add	eax, eax
	lea	eax, DWORD PTR [eax+eax*2]
	lea	eax, DWORD PTR [eax+eax*4]
	add	eax, DWORD PTR _savings$S532
	mov	DWORD PTR _pp$702[ebp], eax
; Line 751
	mov	eax, DWORD PTR _pp$702[ebp]
	inc	WORD PTR [eax+28]
; Line 758
	mov	DWORD PTR _class$703[ebp], 10		; 0000000aH
; Line 759
	cmp	DWORD PTR _class$703[ebp], 0
	je	$L705
	cmp	DWORD PTR _class$703[ebp], 12		; 0000000cH
	je	$L705
; Line 762
	mov	eax, DWORD PTR _class$703[ebp]
	mov	ecx, DWORD PTR _pp$702[ebp]
	movsx	eax, WORD PTR [ecx+eax*2]
	add	eax, DWORD PTR _bcost$[ebp]
	mov	ecx, DWORD PTR _class$703[ebp]
	mov	edx, DWORD PTR _pp$702[ebp]
	mov	WORD PTR [edx+ecx*2], ax
; Line 763
	mov	DWORD PTR _i$706[ebp], 0
	jmp	$L707
$L708:
	inc	DWORD PTR _i$706[ebp]
$L707:
; Line 765
	mov	eax, DWORD PTR _i$706[ebp]
	mov	ecx, DWORD PTR _class$703[ebp]
	mov	edx, ecx
	lea	ecx, DWORD PTR [ecx+ecx*2]
	lea	ecx, DWORD PTR [edx+ecx*4]
	shl	ecx, 2
	mov	eax, DWORD PTR _reg_class_subclasses[ecx+eax*4]
	mov	DWORD PTR _class1$704[ebp], eax
; Line 766
	cmp	DWORD PTR _class1$704[ebp], 13		; 0000000dH
	jne	$L710
; Line 767
	jmp	$L709
; Line 768
$L710:
	mov	eax, DWORD PTR _class1$704[ebp]
	mov	ecx, DWORD PTR _pp$702[ebp]
	movsx	eax, WORD PTR [ecx+eax*2]
	add	eax, DWORD PTR _bcost$[ebp]
	mov	ecx, DWORD PTR _class1$704[ebp]
	mov	edx, DWORD PTR _pp$702[ebp]
	mov	WORD PTR [edx+ecx*2], ax
; Line 769
	jmp	$L708
$L709:
; Line 775
$L705:
	mov	DWORD PTR _class$703[ebp], 9
; Line 776
	cmp	DWORD PTR _icost$[ebp], 0
	je	$L711
	cmp	DWORD PTR _class$703[ebp], 0
	je	$L711
	cmp	DWORD PTR _class$703[ebp], 12		; 0000000cH
	je	$L711
; Line 779
	mov	eax, DWORD PTR _class$703[ebp]
	mov	ecx, DWORD PTR _pp$702[ebp]
	movsx	eax, WORD PTR [ecx+eax*2]
	add	eax, DWORD PTR _icost$[ebp]
	mov	ecx, DWORD PTR _class$703[ebp]
	mov	edx, DWORD PTR _pp$702[ebp]
	mov	WORD PTR [edx+ecx*2], ax
; Line 780
	mov	DWORD PTR _i$712[ebp], 0
	jmp	$L713
$L714:
	inc	DWORD PTR _i$712[ebp]
$L713:
; Line 782
	mov	eax, DWORD PTR _i$712[ebp]
	mov	ecx, DWORD PTR _class$703[ebp]
	mov	edx, ecx
	lea	ecx, DWORD PTR [ecx+ecx*2]
	lea	ecx, DWORD PTR [edx+ecx*4]
	shl	ecx, 2
	mov	eax, DWORD PTR _reg_class_subclasses[ecx+eax*4]
	mov	DWORD PTR _class1$704[ebp], eax
; Line 783
	cmp	DWORD PTR _class1$704[ebp], 13		; 0000000dH
	jne	$L716
; Line 784
	jmp	$L715
; Line 785
$L716:
	mov	eax, DWORD PTR _class1$704[ebp]
	mov	ecx, DWORD PTR _pp$702[ebp]
	movsx	eax, WORD PTR [ecx+eax*2]
	add	eax, DWORD PTR _icost$[ebp]
	mov	ecx, DWORD PTR _class1$704[ebp]
	mov	edx, DWORD PTR _pp$702[ebp]
	mov	WORD PTR [edx+ecx*2], ax
; Line 786
	jmp	$L714
$L715:
; Line 788
$L711:
; Line 789
	jmp	$L656
; Line 791
$L717:
; Line 793
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_format[eax*4]
	mov	DWORD PTR _fmt$718[ebp], eax
; Line 795
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_length[eax*4]
	dec	eax
	mov	DWORD PTR _i$719[ebp], eax
	jmp	$L720
$L721:
	dec	DWORD PTR _i$719[ebp]
$L720:
	cmp	DWORD PTR _i$719[ebp], 0
	jl	$L722
; Line 796
	mov	eax, DWORD PTR _i$719[ebp]
	mov	ecx, DWORD PTR _fmt$718[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 101				; 00000065H
	jne	$L723
; Line 797
	mov	eax, DWORD PTR _icost$[ebp]
	push	eax
	mov	eax, DWORD PTR _bcost$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$719[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	push	eax
	call	_record_address_regs
	add	esp, 12					; 0000000cH
; Line 798
$L723:
	jmp	$L721
$L722:
; Line 799
	jmp	$L656
$L655:
	sub	DWORD PTR -68+[ebp], 30			; 0000001eH
	cmp	DWORD PTR -68+[ebp], 36			; 00000024H
	ja	$L717
	shl	DWORD PTR -68+[ebp], 2
	mov	eax, DWORD PTR -68+[ebp]
	jmp	DWORD PTR $L784[eax]
$L784:
	DD	OFFSET $L659
	DD	OFFSET $L717
	DD	OFFSET $L659
	DD	OFFSET $L659
	DD	OFFSET $L701
	DD	OFFSET $L717
	DD	OFFSET $L717
	DD	OFFSET $L717
	DD	OFFSET $L659
	DD	OFFSET $L659
	DD	OFFSET $L659
	DD	OFFSET $L717
	DD	OFFSET $L717
	DD	OFFSET $L717
	DD	OFFSET $L660
	DD	OFFSET $L717
	DD	OFFSET $L717
	DD	OFFSET $L717
	DD	OFFSET $L717
	DD	OFFSET $L717
	DD	OFFSET $L717
	DD	OFFSET $L717
	DD	OFFSET $L717
	DD	OFFSET $L717
	DD	OFFSET $L717
	DD	OFFSET $L717
	DD	OFFSET $L717
	DD	OFFSET $L717
	DD	OFFSET $L717
	DD	OFFSET $L717
	DD	OFFSET $L717
	DD	OFFSET $L717
	DD	OFFSET $L717
	DD	OFFSET $L700
	DD	OFFSET $L700
	DD	OFFSET $L700
	DD	OFFSET $L700
$L656:
; Line 800
$L653:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_record_address_regs ENDP
_TEXT	ENDS
PUBLIC	_reg_scan_mark_refs
PUBLIC	_reg_scan
_TEXT	SEGMENT
_f$ = 8
_nregs$ = 12
_repeat$ = 16
_insn$ = -4
_reg_scan PROC NEAR
; Line 833
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 836
	cmp	DWORD PTR _repeat$[ebp], 0
	jne	$L731
; Line 837
	mov	eax, DWORD PTR _nregs$[ebp]
	add	eax, eax
	push	eax
	call	_oballoc
	add	esp, 4
	mov	DWORD PTR _regno_first_uid, eax
; Line 838
$L731:
	mov	eax, DWORD PTR _nregs$[ebp]
	add	eax, eax
	push	eax
	push	0
	mov	eax, DWORD PTR _regno_first_uid
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 840
	cmp	DWORD PTR _repeat$[ebp], 0
	jne	$L732
; Line 841
	mov	eax, DWORD PTR _nregs$[ebp]
	add	eax, eax
	push	eax
	call	_oballoc
	add	esp, 4
	mov	DWORD PTR _regno_last_uid, eax
; Line 842
$L732:
	mov	eax, DWORD PTR _nregs$[ebp]
	add	eax, eax
	push	eax
	push	0
	mov	eax, DWORD PTR _regno_last_uid
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 844
	mov	DWORD PTR _max_parallel, 3
; Line 846
	mov	eax, DWORD PTR _f$[ebp]
	mov	DWORD PTR _insn$[ebp], eax
	jmp	$L733
$L734:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _insn$[ebp], eax
$L733:
	cmp	DWORD PTR _insn$[ebp], 0
	je	$L735
; Line 849
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 851968				; 000d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L737
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 983040				; 000f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L737
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 917504				; 000e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L736
$L737:
; Line 852
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1310720				; 00140000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L738
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _max_parallel
	cmp	DWORD PTR [eax], ecx
	jbe	$L738
; Line 853
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _max_parallel, eax
; Line 854
$L738:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_reg_scan_mark_refs
	add	esp, 8
; Line 856
$L736:
	jmp	$L734
$L735:
$L729:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_reg_scan ENDP
_x$ = 8
_uid$ = 12
_code$ = -4
_regno$749 = -8
_fmt$752 = -12
_i$753 = -16
_j$760 = -20
_reg_scan_mark_refs PROC NEAR
; Line 862
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	push	ebx
	push	esi
	push	edi
; Line 863
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$[ebp], eax
; Line 865
	mov	eax, DWORD PTR _code$[ebp]
	mov	DWORD PTR -24+[ebp], eax
	jmp	$L743
; Line 867
$L747:
; Line 876
	jmp	$L741
; Line 878
$L748:
; Line 880
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _regno$749[ebp], eax
; Line 882
	mov	eax, DWORD PTR _uid$[ebp]
	mov	ecx, DWORD PTR _regno$749[ebp]
	mov	edx, DWORD PTR _regno_last_uid
	mov	WORD PTR [edx+ecx*2], ax
; Line 883
	mov	eax, DWORD PTR _regno$749[ebp]
	mov	ecx, DWORD PTR _regno_first_uid
	movsx	eax, WORD PTR [ecx+eax*2]
	or	eax, eax
	jne	$L750
; Line 884
	mov	eax, DWORD PTR _uid$[ebp]
	mov	ecx, DWORD PTR _regno$749[ebp]
	mov	edx, DWORD PTR _regno_first_uid
	mov	WORD PTR [edx+ecx*2], ax
; Line 885
$L750:
; Line 886
	jmp	$L744
; Line 888
$L751:
; Line 890
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_format[eax*4]
	mov	DWORD PTR _fmt$752[ebp], eax
; Line 892
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_length[eax*4]
	dec	eax
	mov	DWORD PTR _i$753[ebp], eax
	jmp	$L754
$L755:
	dec	DWORD PTR _i$753[ebp]
$L754:
	cmp	DWORD PTR _i$753[ebp], 0
	jl	$L756
; Line 894
	mov	eax, DWORD PTR _i$753[ebp]
	mov	ecx, DWORD PTR _fmt$752[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 101				; 00000065H
	jne	$L757
; Line 895
	mov	eax, DWORD PTR _uid$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$753[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	push	eax
	call	_reg_scan_mark_refs
	add	esp, 8
; Line 896
	jmp	$L758
$L757:
	mov	eax, DWORD PTR _i$753[ebp]
	mov	ecx, DWORD PTR _fmt$752[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 69					; 00000045H
	jne	$L759
	mov	eax, DWORD PTR _i$753[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	cmp	DWORD PTR [ecx+eax*4+4], 0
	je	$L759
; Line 899
	mov	eax, DWORD PTR _i$753[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	eax, DWORD PTR [eax]
	dec	eax
	mov	DWORD PTR _j$760[ebp], eax
	jmp	$L761
$L762:
	dec	DWORD PTR _j$760[ebp]
$L761:
	cmp	DWORD PTR _j$760[ebp], 0
	jl	$L763
; Line 900
	mov	eax, DWORD PTR _uid$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$753[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$760[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	push	eax
	call	_reg_scan_mark_refs
	add	esp, 8
	jmp	$L762
$L763:
; Line 902
$L759:
$L758:
	jmp	$L755
$L756:
; Line 904
	jmp	$L744
$L743:
	sub	DWORD PTR -24+[ebp], 23			; 00000017H
	cmp	DWORD PTR -24+[ebp], 17			; 00000011H
	ja	$L751
	shl	DWORD PTR -24+[ebp], 2
	mov	eax, DWORD PTR -24+[ebp]
	jmp	DWORD PTR $L785[eax]
$L785:
	DD	OFFSET $L747
	DD	OFFSET $L747
	DD	OFFSET $L751
	DD	OFFSET $L751
	DD	OFFSET $L751
	DD	OFFSET $L751
	DD	OFFSET $L751
	DD	OFFSET $L747
	DD	OFFSET $L747
	DD	OFFSET $L747
	DD	OFFSET $L747
	DD	OFFSET $L748
	DD	OFFSET $L751
	DD	OFFSET $L751
	DD	OFFSET $L751
	DD	OFFSET $L747
	DD	OFFSET $L747
	DD	OFFSET $L747
$L744:
; Line 905
$L741:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_reg_scan_mark_refs ENDP
_TEXT	ENDS
END
