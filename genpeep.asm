	TITLE	genpeep.c
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
PUBLIC	_rtl_obstack
PUBLIC	_insn_code_number
_DATA	SEGMENT
COMM	_obstack:BYTE:024H
COMM	_max_opno:DWORD
COMM	_n_operands:DWORD
_rtl_obstack DD	_obstack
_insn_code_number DD 00H
_DATA	ENDS
PUBLIC	_match_rtx
PUBLIC	_gen_peephole
EXTRN	_printf:NEAR
_DATA	SEGMENT
$SG479	DB	'  insn = ins1;', 0aH, 00H
$SG484	DB	'  do { insn = NEXT_INSN (insn);', 0aH, 00H
	ORG $+3
$SG485	DB	'       if (insn == 0) goto L%d; }', 0aH, 00H
	ORG $+1
$SG486	DB	'  while (GET_CODE (insn) == NOTE);', 0aH, 00H
$SG487	DB	'  if (GET_CODE (insn) == CODE_LABEL', 0aH, '      || GET'
	DB	'_CODE (insn) == BARRIER)', 0aH, '    goto L%d;', 0aH, 00H
$SG488	DB	'  pat = PATTERN (insn);', 0aH, 00H
	ORG $+3
$SG490	DB	'  if (! (%s)) goto L%d;', 0aH, 00H
	ORG $+3
$SG491	DB	'  PATTERN (ins1) = gen_rtx (PARALLEL, VOIDmode, gen_rtve'
	DB	'c_v (%d, operands));', 0aH, 00H
	ORG $+2
$SG492	DB	'  INSN_CODE (ins1) = %d;', 0aH, 00H
	ORG $+2
$SG494	DB	'  delete_for_peephole (NEXT_INSN (ins1), insn);', 0aH, 00H
	ORG $+3
$SG495	DB	'  return NEXT_INSN (insn);', 0aH, 00H
$SG496	DB	' L%d:', 0aH, 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
; File genpeep.c
_peep$ = 8
_ninsns$ = -4
_i$ = -8
_gen_peephole PROC NEAR
; Line 69
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 70
	mov	eax, DWORD PTR _peep$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _ninsns$[ebp], eax
; Line 73
	mov	DWORD PTR _n_operands, 0
; Line 75
	push	OFFSET $SG479
	call	_printf
	add	esp, 4
; Line 80
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L480
$L481:
	inc	DWORD PTR _i$[ebp]
$L480:
	mov	eax, DWORD PTR _ninsns$[ebp]
	cmp	DWORD PTR _i$[ebp], eax
	jge	$L482
; Line 82
	cmp	DWORD PTR _i$[ebp], 0
	jle	$L483
; Line 84
	push	OFFSET $SG484
	call	_printf
	add	esp, 4
; Line 86
	mov	eax, DWORD PTR _insn_code_number
	push	eax
	push	OFFSET $SG485
	call	_printf
	add	esp, 8
; Line 87
	push	OFFSET $SG486
	call	_printf
	add	esp, 4
; Line 91
	mov	eax, DWORD PTR _insn_code_number
	push	eax
	push	OFFSET $SG487
	call	_printf
	add	esp, 8
; Line 99
$L483:
	push	OFFSET $SG488
	call	_printf
	add	esp, 4
; Line 104
	mov	eax, DWORD PTR _insn_code_number
	push	eax
	push	0
	mov	eax, DWORD PTR _peep$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	push	eax
	call	_match_rtx
	add	esp, 12					; 0000000cH
; Line 105
	jmp	$L481
$L482:
; Line 110
	mov	eax, DWORD PTR _peep$[ebp]
	cmp	DWORD PTR [eax+8], 0
	je	$L489
	mov	eax, DWORD PTR _peep$[ebp]
	mov	eax, DWORD PTR [eax+8]
	movsx	eax, BYTE PTR [eax]
	or	eax, eax
	je	$L489
; Line 112
	mov	eax, DWORD PTR _insn_code_number
	push	eax
	mov	eax, DWORD PTR _peep$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	push	OFFSET $SG490
	call	_printf
	add	esp, 12					; 0000000cH
; Line 120
$L489:
	mov	eax, DWORD PTR _n_operands
	push	eax
	push	OFFSET $SG491
	call	_printf
	add	esp, 8
; Line 134
	mov	eax, DWORD PTR _insn_code_number
	push	eax
	push	OFFSET $SG492
	call	_printf
	add	esp, 8
; Line 137
	cmp	DWORD PTR _ninsns$[ebp], 1
	jle	$L493
; Line 138
	push	OFFSET $SG494
	call	_printf
	add	esp, 4
; Line 142
$L493:
	push	OFFSET $SG495
	call	_printf
	add	esp, 4
; Line 144
	mov	eax, DWORD PTR _insn_code_number
	push	eax
	push	OFFSET $SG496
	call	_printf
	add	esp, 8
; Line 145
$L476:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_peephole ENDP
_TEXT	ENDS
PUBLIC	_print_path
PUBLIC	_print_code
EXTRN	_rtx_length:BYTE
EXTRN	_rtx_format:BYTE
EXTRN	_mode_name:BYTE
_DATA	SEGMENT
$SG514	DB	'  x = ', 00H
	ORG $+1
$SG515	DB	';', 0aH, 00H
	ORG $+1
$SG516	DB	'  operands[%d] = x;', 0aH, 00H
	ORG $+3
$SG518	DB	'  if (! %s (x, %smode)) goto L%d;', 0aH, 00H
	ORG $+1
$SG520	DB	'  x = ', 00H
	ORG $+1
$SG521	DB	';', 0aH, 00H
	ORG $+1
$SG522	DB	'  if (!rtx_equal_p (operands[%d], x)) goto L%d;', 0aH, 00H
	ORG $+3
$SG526	DB	'  x = (rtx)', 00H
$SG527	DB	';', 0aH, 00H
	ORG $+1
$SG528	DB	'  operands[%d] = x;', 0aH, 00H
	ORG $+3
$SG530	DB	'  if (! %s (x, %smode)) goto L%d;', 0aH, 00H
	ORG $+1
$SG535	DB	'  x = ', 00H
	ORG $+1
$SG536	DB	';', 0aH, 00H
	ORG $+1
$SG537	DB	'  if (GET_CODE (x) != ', 00H
	ORG $+1
$SG538	DB	') goto L%d;', 0aH, 00H
	ORG $+3
$SG540	DB	'  if (GET_MODE (x) != %smode) goto L%d;', 0aH, 00H
	ORG $+3
$SG549	DB	'  if (XVECLEN (x, %d) != %d) goto L%d;', 0aH, 00H
$SG556	DB	'  x = ', 00H
	ORG $+1
$SG557	DB	';', 0aH, 00H
	ORG $+1
$SG558	DB	'  if (XINT (x, %d) != %d) goto L%d;', 0aH, 00H
	ORG $+3
$SG562	DB	'  x = ', 00H
	ORG $+1
$SG563	DB	';', 0aH, 00H
	ORG $+1
$SG564	DB	'  if (strcmp (XSTR (x, %d), "%s")) goto L%d;', 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_j$548 = -32
_x$ = 8
_path$ = 12
_fail_label$ = 16
_code$ = -8
_i$ = -28
_len$ = -24
_fmt$ = -4
_link$ = -20
_match_rtx PROC NEAR
; Line 152
	push	ebp
	mov	ebp, esp
	sub	esp, 36					; 00000024H
	push	ebx
	push	esi
	push	edi
; Line 159
	cmp	DWORD PTR _x$[ebp], 0
	jne	$L506
; Line 160
	jmp	$L500
; Line 163
$L506:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$[ebp], eax
; Line 165
	mov	eax, DWORD PTR _code$[ebp]
	mov	DWORD PTR -36+[ebp], eax
	jmp	$L507
; Line 167
$L511:
; Line 168
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR _max_opno
	cmp	DWORD PTR [eax+4], ecx
	jle	$L512
; Line 169
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _max_opno, eax
; Line 170
$L512:
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR _n_operands
	cmp	DWORD PTR [eax+4], ecx
	jl	$L513
; Line 171
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	inc	eax
	mov	DWORD PTR _n_operands, eax
; Line 173
$L513:
	push	OFFSET $SG514
	call	_printf
	add	esp, 4
; Line 174
	mov	eax, DWORD PTR _path$[ebp]
	push	eax
	call	_print_path
	add	esp, 4
; Line 175
	push	OFFSET $SG515
	call	_printf
	add	esp, 4
; Line 177
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	OFFSET $SG516
	call	_printf
	add	esp, 8
; Line 178
	mov	eax, DWORD PTR _x$[ebp]
	cmp	DWORD PTR [eax+8], 0
	je	$L517
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	movsx	eax, BYTE PTR [eax]
	or	eax, eax
	je	$L517
; Line 180
	mov	eax, DWORD PTR _fail_label$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_name[eax]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	push	OFFSET $SG518
	call	_printf
	add	esp, 16					; 00000010H
; Line 181
$L517:
	jmp	$L500
; Line 183
$L519:
; Line 184
	push	OFFSET $SG520
	call	_printf
	add	esp, 4
; Line 185
	mov	eax, DWORD PTR _path$[ebp]
	push	eax
	call	_print_path
	add	esp, 4
; Line 186
	push	OFFSET $SG521
	call	_printf
	add	esp, 4
; Line 189
	mov	eax, DWORD PTR _fail_label$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	OFFSET $SG522
	call	_printf
	add	esp, 12					; 0000000cH
; Line 190
	jmp	$L500
; Line 192
$L523:
; Line 193
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR _max_opno
	cmp	DWORD PTR [eax+4], ecx
	jle	$L524
; Line 194
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _max_opno, eax
; Line 195
$L524:
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR _n_operands
	cmp	DWORD PTR [eax+4], ecx
	jl	$L525
; Line 196
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	inc	eax
	mov	DWORD PTR _n_operands, eax
; Line 198
$L525:
	push	OFFSET $SG526
	call	_printf
	add	esp, 4
; Line 199
	mov	eax, DWORD PTR _path$[ebp]
	push	eax
	call	_print_path
	add	esp, 4
; Line 200
	push	OFFSET $SG527
	call	_printf
	add	esp, 4
; Line 202
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	OFFSET $SG528
	call	_printf
	add	esp, 8
; Line 203
	mov	eax, DWORD PTR _x$[ebp]
	cmp	DWORD PTR [eax+8], 0
	je	$L529
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	movsx	eax, BYTE PTR [eax]
	or	eax, eax
	je	$L529
; Line 205
	mov	eax, DWORD PTR _fail_label$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_name[eax]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	push	OFFSET $SG530
	call	_printf
	add	esp, 16					; 00000010H
; Line 206
$L529:
	mov	eax, DWORD PTR _path$[ebp]
	mov	DWORD PTR _link$[ebp], eax
; Line 207
	mov	DWORD PTR _link$[ebp+8], -1
; Line 208
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L531
$L532:
	inc	DWORD PTR _i$[ebp]
$L531:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	DWORD PTR [eax], ecx
	jbe	$L533
; Line 210
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _link$[ebp+4], eax
; Line 211
	mov	eax, DWORD PTR _fail_label$[ebp]
	push	eax
	lea	eax, DWORD PTR _link$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	push	eax
	call	_match_rtx
	add	esp, 12					; 0000000cH
; Line 212
	jmp	$L532
$L533:
; Line 213
	jmp	$L500
; Line 215
$L534:
; Line 216
	mov	eax, DWORD PTR _fail_label$[ebp]
	push	eax
	mov	eax, DWORD PTR _path$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_match_rtx
	add	esp, 12					; 0000000cH
; Line 217
	jmp	$L500
; Line 218
	jmp	$L508
$L507:
	cmp	DWORD PTR -36+[ebp], 4
	je	$L511
	cmp	DWORD PTR -36+[ebp], 5
	je	$L519
	cmp	DWORD PTR -36+[ebp], 6
	je	$L523
	cmp	DWORD PTR -36+[ebp], 12			; 0000000cH
	je	$L534
	jmp	$L508
$L508:
; Line 220
	push	OFFSET $SG535
	call	_printf
	add	esp, 4
; Line 221
	mov	eax, DWORD PTR _path$[ebp]
	push	eax
	call	_print_path
	add	esp, 4
; Line 222
	push	OFFSET $SG536
	call	_printf
	add	esp, 4
; Line 224
	push	OFFSET $SG537
	call	_printf
	add	esp, 4
; Line 225
	mov	eax, DWORD PTR _code$[ebp]
	push	eax
	call	_print_code
	add	esp, 4
; Line 226
	mov	eax, DWORD PTR _fail_label$[ebp]
	push	eax
	push	OFFSET $SG538
	call	_printf
	add	esp, 8
; Line 228
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sub	ecx, ecx
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L539
; Line 231
	mov	eax, DWORD PTR _fail_label$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_name[eax]
	push	eax
	push	OFFSET $SG540
	call	_printf
	add	esp, 12					; 0000000cH
; Line 234
$L539:
	mov	eax, DWORD PTR _path$[ebp]
	mov	DWORD PTR _link$[ebp], eax
; Line 235
	mov	DWORD PTR _link$[ebp+8], -1
; Line 236
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_format[eax*4]
	mov	DWORD PTR _fmt$[ebp], eax
; Line 237
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_length[eax*4]
	mov	DWORD PTR _len$[ebp], eax
; Line 238
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L541
$L542:
	inc	DWORD PTR _i$[ebp]
$L541:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _len$[ebp], eax
	jle	$L543
; Line 240
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _link$[ebp+4], eax
; Line 241
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 101				; 00000065H
	je	$L545
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 117				; 00000075H
	jne	$L544
$L545:
; Line 242
	mov	eax, DWORD PTR _fail_label$[ebp]
	push	eax
	lea	eax, DWORD PTR _link$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	push	eax
	call	_match_rtx
	add	esp, 12					; 0000000cH
; Line 243
	jmp	$L546
$L544:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 69					; 00000045H
	jne	$L547
; Line 247
	mov	eax, DWORD PTR _fail_label$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	eax, DWORD PTR [eax]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	push	OFFSET $SG549
	call	_printf
	add	esp, 16					; 00000010H
; Line 248
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	eax, DWORD PTR [eax]
	dec	eax
	mov	DWORD PTR _j$548[ebp], eax
	jmp	$L550
$L551:
	dec	DWORD PTR _j$548[ebp]
$L550:
	cmp	DWORD PTR _j$548[ebp], 0
	jl	$L552
; Line 250
	mov	eax, DWORD PTR _j$548[ebp]
	mov	DWORD PTR _link$[ebp+8], eax
; Line 251
	mov	eax, DWORD PTR _fail_label$[ebp]
	push	eax
	lea	eax, DWORD PTR _link$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$548[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	push	eax
	call	_match_rtx
	add	esp, 12					; 0000000cH
; Line 252
	jmp	$L551
$L552:
; Line 254
	jmp	$L553
$L547:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 105				; 00000069H
	jne	$L554
; Line 257
	cmp	DWORD PTR _i$[ebp], 0
	je	$L555
; Line 259
	push	OFFSET $SG556
	call	_printf
	add	esp, 4
; Line 260
	mov	eax, DWORD PTR _path$[ebp]
	push	eax
	call	_print_path
	add	esp, 4
; Line 261
	push	OFFSET $SG557
	call	_printf
	add	esp, 4
; Line 264
$L555:
; Line 265
	mov	eax, DWORD PTR _fail_label$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	push	OFFSET $SG558
	call	_printf
	add	esp, 16					; 00000010H
; Line 267
	jmp	$L559
$L554:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 115				; 00000073H
	jne	$L560
; Line 270
	cmp	DWORD PTR _i$[ebp], 0
	je	$L561
; Line 272
	push	OFFSET $SG562
	call	_printf
	add	esp, 4
; Line 273
	mov	eax, DWORD PTR _path$[ebp]
	push	eax
	call	_print_path
	add	esp, 4
; Line 274
	push	OFFSET $SG563
	call	_printf
	add	esp, 4
; Line 277
$L561:
; Line 278
	mov	eax, DWORD PTR _fail_label$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	push	OFFSET $SG564
	call	_printf
	add	esp, 16					; 00000010H
; Line 280
$L560:
$L559:
$L553:
$L546:
	jmp	$L542
$L543:
; Line 281
$L500:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_match_rtx ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+2
$SG568	DB	'pat', 00H
$SG571	DB	'XVECEXP (', 00H
	ORG $+2
$SG572	DB	', %d, %d)', 00H
	ORG $+2
$SG574	DB	'XEXP (', 00H
	ORG $+1
$SG575	DB	', %d)', 00H
_DATA	ENDS
_TEXT	SEGMENT
_path$ = 8
_print_path PROC NEAR
; Line 290
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 291
	cmp	DWORD PTR _path$[ebp], 0
	jne	$L567
; Line 292
	push	OFFSET $SG568
	call	_printf
	add	esp, 4
; Line 293
	jmp	$L569
$L567:
	mov	eax, DWORD PTR _path$[ebp]
	cmp	DWORD PTR [eax+8], 0
	jl	$L570
; Line 295
	push	OFFSET $SG571
	call	_printf
	add	esp, 4
; Line 296
	mov	eax, DWORD PTR _path$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_print_path
	add	esp, 4
; Line 297
	mov	eax, DWORD PTR _path$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _path$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	OFFSET $SG572
	call	_printf
	add	esp, 12					; 0000000cH
; Line 299
	jmp	$L573
$L570:
; Line 301
	push	OFFSET $SG574
	call	_printf
	add	esp, 4
; Line 302
	mov	eax, DWORD PTR _path$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_print_path
	add	esp, 4
; Line 303
	mov	eax, DWORD PTR _path$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	OFFSET $SG575
	call	_printf
	add	esp, 8
; Line 304
$L573:
$L569:
; Line 305
$L566:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_print_path ENDP
_TEXT	ENDS
EXTRN	_rtx_name:BYTE
EXTRN	__iob:BYTE
EXTRN	__flsbuf:NEAR
_TEXT	SEGMENT
_code$ = 8
_p1$ = -4
_print_code PROC NEAR
; Line 310
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 312
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_name[eax*4]
	mov	DWORD PTR _p1$[ebp], eax
	jmp	$L579
$L580:
	inc	DWORD PTR _p1$[ebp]
$L579:
	mov	eax, DWORD PTR _p1$[ebp]
	movsx	eax, BYTE PTR [eax]
	or	eax, eax
	je	$L581
; Line 314
	mov	eax, DWORD PTR _p1$[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 97					; 00000061H
	jl	$L582
	mov	eax, DWORD PTR _p1$[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 122				; 0000007aH
	jg	$L582
; Line 315
	dec	DWORD PTR __iob+36
	js	$L646
	mov	eax, DWORD PTR _p1$[ebp]
	movsx	eax, BYTE PTR [eax]
	sub	eax, 32					; 00000020H
	mov	ecx, DWORD PTR __iob+32
	mov	BYTE PTR [ecx], al
	inc	DWORD PTR __iob+32
	jmp	$L647
$L646:
	mov	eax, OFFSET __iob
	add	eax, 32					; 00000020H
	push	eax
	mov	eax, DWORD PTR _p1$[ebp]
	movsx	eax, BYTE PTR [eax]
	sub	eax, 32					; 00000020H
	push	eax
	call	__flsbuf
	add	esp, 8
$L647:
; Line 316
	jmp	$L583
$L582:
; Line 317
	dec	DWORD PTR __iob+36
	js	$L648
	mov	eax, DWORD PTR _p1$[ebp]
	mov	al, BYTE PTR [eax]
	mov	ecx, DWORD PTR __iob+32
	mov	BYTE PTR [ecx], al
	inc	DWORD PTR __iob+32
	jmp	$L649
$L648:
	mov	eax, OFFSET __iob
	add	eax, 32					; 00000020H
	push	eax
	mov	eax, DWORD PTR _p1$[ebp]
	movsx	eax, BYTE PTR [eax]
	push	eax
	call	__flsbuf
	add	esp, 8
$L649:
$L583:
; Line 318
	jmp	$L580
$L581:
; Line 319
$L577:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_print_code ENDP
_TEXT	ENDS
PUBLIC	_xmalloc
PUBLIC	_fatal
EXTRN	_malloc:NEAR
_DATA	SEGMENT
	ORG $+2
$SG589	DB	'virtual memory exhausted', 00H
_DATA	ENDS
_TEXT	SEGMENT
_size$ = 8
_val$ = -4
_xmalloc PROC NEAR
; Line 323
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 324
	mov	eax, DWORD PTR _size$[ebp]
	push	eax
	call	_malloc
	add	esp, 4
	mov	DWORD PTR _val$[ebp], eax
; Line 326
	cmp	DWORD PTR _val$[ebp], 0
	jne	$L588
; Line 327
	push	0
	push	0
	push	OFFSET $SG589
	call	_fatal
	add	esp, 12					; 0000000cH
; Line 328
$L588:
	mov	eax, DWORD PTR _val$[ebp]
	jmp	$L585
; Line 329
$L585:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_xmalloc ENDP
_TEXT	ENDS
PUBLIC	_xrealloc
EXTRN	_realloc:NEAR
_DATA	SEGMENT
	ORG $+3
$SG597	DB	'virtual memory exhausted', 00H
_DATA	ENDS
_TEXT	SEGMENT
_ptr$ = 8
_size$ = 12
_result$ = -4
_xrealloc PROC NEAR
; Line 335
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 336
	mov	eax, DWORD PTR _size$[ebp]
	push	eax
	mov	eax, DWORD PTR _ptr$[ebp]
	push	eax
	call	_realloc
	add	esp, 8
	mov	DWORD PTR _result$[ebp], eax
; Line 337
	cmp	DWORD PTR _result$[ebp], 0
	jne	$L596
; Line 338
	push	0
	push	0
	push	OFFSET $SG597
	call	_fatal
	add	esp, 12					; 0000000cH
; Line 339
$L596:
	mov	eax, DWORD PTR _result$[ebp]
	jmp	$L593
; Line 340
$L593:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_xrealloc ENDP
_TEXT	ENDS
EXTRN	_fprintf:NEAR
EXTRN	_exit:NEAR
_DATA	SEGMENT
	ORG $+3
$SG602	DB	'genpeep: ', 00H
	ORG $+2
$SG603	DB	0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_s$ = 8
_a1$ = 12
_a2$ = 16
_fatal	PROC NEAR
; Line 345
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 346
	push	OFFSET $SG602
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 8
; Line 347
	mov	eax, DWORD PTR _a2$[ebp]
	push	eax
	mov	eax, DWORD PTR _a1$[ebp]
	push	eax
	mov	eax, DWORD PTR _s$[ebp]
	push	eax
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
; Line 348
	push	OFFSET $SG603
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 8
; Line 349
	push	33					; 00000021H
	call	_exit
	add	esp, 4
; Line 350
$L601:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_fatal	ENDP
_TEXT	ENDS
PUBLIC	_fancy_abort
_DATA	SEGMENT
	ORG $+2
$SG606	DB	'Internal gcc abort.', 00H
_DATA	ENDS
_TEXT	SEGMENT
_fancy_abort PROC NEAR
; Line 357
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 358
	push	0
	push	0
	push	OFFSET $SG606
	call	_fatal
	add	esp, 12					; 0000000cH
; Line 359
$L605:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_fancy_abort ENDP
_TEXT	ENDS
PUBLIC	_main
EXTRN	_fopen:NEAR
EXTRN	_free:NEAR
EXTRN	_perror:NEAR
EXTRN	_read_rtx:NEAR
EXTRN	_ungetc:NEAR
EXTRN	__obstack_begin:NEAR
EXTRN	_init_rtl:NEAR
EXTRN	_fflush:NEAR
EXTRN	_read_skip_spaces:NEAR
_DATA	SEGMENT
$SG617	DB	'No input file name.', 00H
$SG618	DB	'r', 00H
	ORG $+2
$SG621	DB	'/* Generated automatically by the program `genpeep''', 0aH
	DB	'from the machine description file `md''.  */', 0aH, 0aH, 00H
	ORG $+2
$SG622	DB	'#include "config.h"', 0aH, 00H
	ORG $+3
$SG623	DB	'#include "rtl.h"', 0aH, 00H
	ORG $+2
$SG624	DB	'#include "regs.h"', 0aH, 00H
	ORG $+1
$SG625	DB	'#include "real.h"', 0aH, 0aH, 00H
$SG626	DB	'extern rtx peep_operand[];', 0aH, 0aH, 00H
	ORG $+3
$SG627	DB	'#define operands peep_operand', 0aH, 0aH, 00H
$SG628	DB	'rtx', 0aH, 'peephole (ins1)', 0aH, '     rtx ins1;', 0aH
	DB	'{', 0aH, 00H
	ORG $+2
$SG629	DB	'  rtx insn, x, pat;', 0aH, 00H
	ORG $+3
$SG630	DB	'  int i;', 0aH, 0aH, 00H
	ORG $+1
$SG631	DB	'  if (NEXT_INSN (ins1)', 0aH, 00H
$SG632	DB	'      && GET_CODE (NEXT_INSN (ins1)) == BARRIER)', 0aH, 00H
	ORG $+2
$SG633	DB	'    return 0;', 0aH, 0aH, 00H
$SG642	DB	'  return 0;', 0aH, '}', 0aH, 0aH, 00H
$SG644	DB	'rtx peep_operand[%d];', 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_argc$ = 8
_argv$ = 12
_desc$ = -8
_infile$ = -4
_c$ = -12
_main	PROC NEAR
; Line 365
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 371
	mov	DWORD PTR _max_opno, -1
; Line 373
	push	OFFSET _free
	push	OFFSET _xmalloc
	push	0
	push	0
	mov	eax, DWORD PTR _rtl_obstack
	push	eax
	call	__obstack_begin
	add	esp, 20					; 00000014H
; Line 375
	cmp	DWORD PTR _argc$[ebp], 1
	jg	$L616
; Line 376
	push	0
	push	0
	push	OFFSET $SG617
	call	_fatal
	add	esp, 12					; 0000000cH
; Line 378
$L616:
	push	OFFSET $SG618
	mov	eax, DWORD PTR _argv$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_fopen
	add	esp, 8
	mov	DWORD PTR _infile$[ebp], eax
; Line 379
	cmp	DWORD PTR _infile$[ebp], 0
	jne	$L619
; Line 381
	mov	eax, DWORD PTR _argv$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_perror
	add	esp, 4
; Line 382
	push	33					; 00000021H
	call	_exit
	add	esp, 4
; Line 385
$L619:
	call	_init_rtl
; Line 388
	push	OFFSET $SG621
	call	_printf
	add	esp, 4
; Line 390
	push	OFFSET $SG622
	call	_printf
	add	esp, 4
; Line 391
	push	OFFSET $SG623
	call	_printf
	add	esp, 4
; Line 392
	push	OFFSET $SG624
	call	_printf
	add	esp, 4
; Line 393
	push	OFFSET $SG625
	call	_printf
	add	esp, 4
; Line 395
	push	OFFSET $SG626
	call	_printf
	add	esp, 4
; Line 396
	push	OFFSET $SG627
	call	_printf
	add	esp, 4
; Line 398
	push	OFFSET $SG628
	call	_printf
	add	esp, 4
; Line 399
	push	OFFSET $SG629
	call	_printf
	add	esp, 4
; Line 400
	push	OFFSET $SG630
	call	_printf
	add	esp, 4
; Line 403
	push	OFFSET $SG631
	call	_printf
	add	esp, 4
; Line 404
	push	OFFSET $SG632
	call	_printf
	add	esp, 4
; Line 405
	push	OFFSET $SG633
	call	_printf
	add	esp, 4
; Line 409
$L635:
; Line 411
	mov	eax, DWORD PTR _infile$[ebp]
	push	eax
	call	_read_skip_spaces
	add	esp, 4
	mov	DWORD PTR _c$[ebp], eax
; Line 412
	cmp	DWORD PTR _c$[ebp], -1
	jne	$L638
; Line 413
	jmp	$L636
; Line 414
$L638:
	mov	eax, DWORD PTR _infile$[ebp]
	push	eax
	mov	eax, DWORD PTR _c$[ebp]
	push	eax
	call	_ungetc
	add	esp, 8
; Line 416
	mov	eax, DWORD PTR _infile$[ebp]
	push	eax
	call	_read_rtx
	add	esp, 4
	mov	DWORD PTR _desc$[ebp], eax
; Line 417
	mov	eax, DWORD PTR _desc$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 524288				; 00080000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L639
; Line 419
	mov	eax, DWORD PTR _desc$[ebp]
	push	eax
	call	_gen_peephole
	add	esp, 4
; Line 420
	inc	DWORD PTR _insn_code_number
; Line 422
$L639:
	mov	eax, DWORD PTR _desc$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 458752				; 00070000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L641
	mov	eax, DWORD PTR _desc$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 655360				; 000a0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L640
$L641:
; Line 424
	inc	DWORD PTR _insn_code_number
; Line 426
$L640:
	jmp	$L635
$L636:
; Line 428
	push	OFFSET $SG642
	call	_printf
	add	esp, 4
; Line 430
	cmp	DWORD PTR _max_opno, -1
	jne	$L643
; Line 431
	mov	DWORD PTR _max_opno, 1
; Line 433
$L643:
	mov	eax, DWORD PTR _max_opno
	inc	eax
	push	eax
	push	OFFSET $SG644
	call	_printf
	add	esp, 8
; Line 435
	mov	eax, OFFSET __iob
	add	eax, 32					; 00000020H
	push	eax
	call	_fflush
	add	esp, 4
; Line 436
	mov	eax, DWORD PTR __iob+44
	and	eax, 32					; 00000020H
	cmp	eax, 1
	cmc
	sbb	eax, eax
	and	eax, 33					; 00000021H
	push	eax
	call	_exit
	add	esp, 4
; Line 437
$L610:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_main	ENDP
_TEXT	ENDS
END
