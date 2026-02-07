	TITLE	genemit.c
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
_DATA	SEGMENT
COMM	_obstack:BYTE:024H
COMM	_max_opno:DWORD
COMM	_max_dup_opno:DWORD
COMM	_register_constraints:DWORD
COMM	_insn_code_number:DWORD
_rtl_obstack DD	_obstack
_DATA	ENDS
PUBLIC	_max_operand_1
EXTRN	_rtx_length:BYTE
EXTRN	_rtx_format:BYTE
_TEXT	SEGMENT
; File genemit.c
_x$ = 8
_code$ = -8
_i$ = -16
_len$ = -4
_fmt$ = -12
_j$489 = -20
_max_operand_1 PROC NEAR
; Line 47
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	push	ebx
	push	esi
	push	edi
; Line 53
	cmp	DWORD PTR _x$[ebp], 0
	jne	$L477
; Line 54
	jmp	$L472
; Line 56
$L477:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$[ebp], eax
; Line 58
	cmp	DWORD PTR _code$[ebp], 4
	jne	$L478
	mov	eax, DWORD PTR _x$[ebp]
	cmp	DWORD PTR [eax+12], 0
	je	$L478
; Line 59
	mov	DWORD PTR _register_constraints, 1
; Line 60
$L478:
	cmp	DWORD PTR _code$[ebp], 4
	je	$L480
	cmp	DWORD PTR _code$[ebp], 6
	jne	$L479
$L480:
; Line 61
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _max_opno
	cmp	eax, ecx
	jg	$L735
	mov	eax, ecx
$L735:
	mov	DWORD PTR _max_opno, eax
; Line 62
$L479:
	cmp	DWORD PTR _code$[ebp], 5
	jne	$L481
; Line 63
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _max_dup_opno
	cmp	eax, ecx
	jg	$L736
	mov	eax, ecx
$L736:
	mov	DWORD PTR _max_dup_opno, eax
; Line 65
$L481:
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_format[eax*4]
	mov	DWORD PTR _fmt$[ebp], eax
; Line 66
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_length[eax*4]
	mov	DWORD PTR _len$[ebp], eax
; Line 67
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L482
$L483:
	inc	DWORD PTR _i$[ebp]
$L482:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _len$[ebp], eax
	jle	$L484
; Line 69
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 101				; 00000065H
	je	$L486
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 117				; 00000075H
	jne	$L485
$L486:
; Line 70
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	push	eax
	call	_max_operand_1
	add	esp, 4
; Line 71
	jmp	$L487
$L485:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 69					; 00000045H
	jne	$L488
; Line 74
	mov	DWORD PTR _j$489[ebp], 0
	jmp	$L490
$L491:
	inc	DWORD PTR _j$489[ebp]
$L490:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$489[ebp]
	cmp	DWORD PTR [eax], ecx
	jbe	$L492
; Line 75
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$489[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	push	eax
	call	_max_operand_1
	add	esp, 4
	jmp	$L491
$L492:
; Line 77
$L488:
$L487:
	jmp	$L483
$L484:
; Line 78
$L472:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_max_operand_1 ENDP
_TEXT	ENDS
PUBLIC	_max_operand_vec
_TEXT	SEGMENT
_insn$ = 8
_arg$ = 12
_len$ = -4
_i$ = -8
_max_operand_vec PROC NEAR
; Line 84
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 85
	mov	eax, DWORD PTR _arg$[ebp]
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _len$[ebp], eax
; Line 88
	mov	DWORD PTR _max_opno, -1
; Line 89
	mov	DWORD PTR _max_dup_opno, -1
; Line 91
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L499
$L500:
	inc	DWORD PTR _i$[ebp]
$L499:
	mov	eax, DWORD PTR _len$[ebp]
	cmp	DWORD PTR _i$[ebp], eax
	jge	$L501
; Line 92
	mov	eax, DWORD PTR _arg$[ebp]
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	push	eax
	call	_max_operand_1
	add	esp, 4
	jmp	$L500
$L501:
; Line 94
	mov	eax, DWORD PTR _max_opno
	inc	eax
	jmp	$L496
; Line 95
$L496:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_max_operand_vec ENDP
_TEXT	ENDS
PUBLIC	_print_code
EXTRN	_rtx_name:BYTE
EXTRN	__iob:BYTE
EXTRN	__flsbuf:NEAR
_TEXT	SEGMENT
_code$ = 8
_p1$ = -4
_print_code PROC NEAR
; Line 100
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 102
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_name[eax*4]
	mov	DWORD PTR _p1$[ebp], eax
	jmp	$L506
$L507:
	inc	DWORD PTR _p1$[ebp]
$L506:
	mov	eax, DWORD PTR _p1$[ebp]
	movsx	eax, BYTE PTR [eax]
	or	eax, eax
	je	$L508
; Line 104
	mov	eax, DWORD PTR _p1$[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 97					; 00000061H
	jl	$L509
	mov	eax, DWORD PTR _p1$[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 122				; 0000007aH
	jg	$L509
; Line 105
	dec	DWORD PTR __iob+36
	js	$L737
	mov	eax, DWORD PTR _p1$[ebp]
	movsx	eax, BYTE PTR [eax]
	sub	eax, 32					; 00000020H
	mov	ecx, DWORD PTR __iob+32
	mov	BYTE PTR [ecx], al
	inc	DWORD PTR __iob+32
	jmp	$L738
$L737:
	mov	eax, OFFSET __iob
	add	eax, 32					; 00000020H
	push	eax
	mov	eax, DWORD PTR _p1$[ebp]
	movsx	eax, BYTE PTR [eax]
	sub	eax, 32					; 00000020H
	push	eax
	call	__flsbuf
	add	esp, 8
$L738:
; Line 106
	jmp	$L510
$L509:
; Line 107
	dec	DWORD PTR __iob+36
	js	$L739
	mov	eax, DWORD PTR _p1$[ebp]
	mov	al, BYTE PTR [eax]
	mov	ecx, DWORD PTR __iob+32
	mov	BYTE PTR [ecx], al
	inc	DWORD PTR __iob+32
	jmp	$L740
$L739:
	mov	eax, OFFSET __iob
	add	eax, 32					; 00000020H
	push	eax
	mov	eax, DWORD PTR _p1$[ebp]
	movsx	eax, BYTE PTR [eax]
	push	eax
	call	__flsbuf
	add	esp, 8
$L740:
$L510:
; Line 108
	jmp	$L507
$L508:
; Line 109
$L504:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_print_code ENDP
_TEXT	ENDS
PUBLIC	_gen_exp
PUBLIC	_fatal
EXTRN	_printf:NEAR
EXTRN	_mode_name:BYTE
EXTRN	_abort:NEAR
_DATA	SEGMENT
$SG519	DB	'0', 00H
	ORG $+2
$SG525	DB	'operand%d', 00H
	ORG $+2
$SG527	DB	'gen_rtx (GET_CODE (operand%d)', 00H
	ORG $+2
$SG528	DB	', %smode', 00H
	ORG $+3
$SG532	DB	',', 0aH, 09H, 09H, 00H
	ORG $+3
$SG533	DB	')', 00H
	ORG $+2
$SG535	DB	'ADDRESS expression code used in named instruction patter'
	DB	'n', 00H
	ORG $+2
$SG537	DB	'pc_rtx', 00H
	ORG $+1
$SG539	DB	'cc0_rtx', 00H
$SG542	DB	'const0_rtx', 00H
	ORG $+1
$SG544	DB	'const1_rtx', 00H
	ORG $+1
$SG545	DB	'gen_rtx (', 00H
	ORG $+2
$SG546	DB	', %smode', 00H
	ORG $+3
$SG551	DB	', ', 00H
	ORG $+1
$SG556	DB	'%d', 00H
	ORG $+1
$SG559	DB	'"%s"', 00H
	ORG $+3
$SG563	DB	'gen_rtvec (%d', 00H
	ORG $+2
$SG567	DB	',', 0aH, 09H, 09H, 00H
	ORG $+3
$SG568	DB	')', 00H
	ORG $+2
$SG571	DB	')', 00H
_DATA	ENDS
_TEXT	SEGMENT
_code$ = -8
_i$ = -16
_len$ = -4
_fmt$ = -12
_j$562 = -20
_x$ = 8
_gen_exp PROC NEAR
; Line 117
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	push	ebx
	push	esi
	push	edi
; Line 123
	cmp	DWORD PTR _x$[ebp], 0
	jne	$L518
; Line 125
	push	OFFSET $SG519
	call	_printf
	add	esp, 4
; Line 126
	jmp	$L513
; Line 129
$L518:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$[ebp], eax
; Line 131
	mov	eax, DWORD PTR _code$[ebp]
	mov	DWORD PTR -24+[ebp], eax
	jmp	$L520
; Line 133
$L524:
; Line 135
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	OFFSET $SG525
	call	_printf
	add	esp, 8
; Line 136
	jmp	$L513
; Line 138
$L526:
; Line 139
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	OFFSET $SG527
	call	_printf
	add	esp, 8
; Line 140
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_name[eax]
	push	eax
	push	OFFSET $SG528
	call	_printf
	add	esp, 8
; Line 141
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L529
$L530:
	inc	DWORD PTR _i$[ebp]
$L529:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	DWORD PTR [eax], ecx
	jbe	$L531
; Line 143
	push	OFFSET $SG532
	call	_printf
	add	esp, 4
; Line 144
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	push	eax
	call	_gen_exp
	add	esp, 4
; Line 145
	jmp	$L530
$L531:
; Line 146
	push	OFFSET $SG533
	call	_printf
	add	esp, 4
; Line 147
	jmp	$L513
; Line 149
$L534:
; Line 150
	push	0
	push	0
	push	OFFSET $SG535
	call	_fatal
	add	esp, 12					; 0000000cH
; Line 152
$L536:
; Line 153
	push	OFFSET $SG537
	call	_printf
	add	esp, 4
; Line 154
	jmp	$L513
; Line 156
$L538:
; Line 157
	push	OFFSET $SG539
	call	_printf
	add	esp, 4
; Line 158
	jmp	$L513
; Line 160
$L540:
; Line 161
	mov	eax, DWORD PTR _x$[ebp]
	cmp	DWORD PTR [eax+4], 0
	jne	$L541
; Line 163
	push	OFFSET $SG542
	call	_printf
	add	esp, 4
; Line 164
	jmp	$L513
; Line 166
$L541:
	mov	eax, DWORD PTR _x$[ebp]
	cmp	DWORD PTR [eax+4], 1
	jne	$L543
; Line 168
	push	OFFSET $SG544
	call	_printf
	add	esp, 4
; Line 169
	jmp	$L513
; Line 171
$L543:
	jmp	$L521
$L520:
	cmp	DWORD PTR -24+[ebp], 30			; 0000001eH
	jg	$L741
	je	$L540
	cmp	DWORD PTR -24+[ebp], 4
	jl	$L521
	cmp	DWORD PTR -24+[ebp], 5
	jle	$L524
	cmp	DWORD PTR -24+[ebp], 6
	je	$L526
	cmp	DWORD PTR -24+[ebp], 12			; 0000000cH
	je	$L534
	jmp	$L521
$L741:
	cmp	DWORD PTR -24+[ebp], 33			; 00000021H
	je	$L536
	cmp	DWORD PTR -24+[ebp], 40			; 00000028H
	je	$L538
	jmp	$L521
$L521:
; Line 173
	push	OFFSET $SG545
	call	_printf
	add	esp, 4
; Line 174
	mov	eax, DWORD PTR _code$[ebp]
	push	eax
	call	_print_code
	add	esp, 4
; Line 175
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_name[eax]
	push	eax
	push	OFFSET $SG546
	call	_printf
	add	esp, 8
; Line 177
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_format[eax*4]
	mov	DWORD PTR _fmt$[ebp], eax
; Line 178
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_length[eax*4]
	mov	DWORD PTR _len$[ebp], eax
; Line 179
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L547
$L548:
	inc	DWORD PTR _i$[ebp]
$L547:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _len$[ebp], eax
	jle	$L549
; Line 181
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 48					; 00000030H
	jne	$L550
; Line 182
	jmp	$L549
; Line 183
$L550:
	push	OFFSET $SG551
	call	_printf
	add	esp, 4
; Line 184
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 101				; 00000065H
	je	$L553
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 117				; 00000075H
	jne	$L552
$L553:
; Line 185
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	push	eax
	call	_gen_exp
	add	esp, 4
; Line 186
	jmp	$L554
$L552:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 105				; 00000069H
	jne	$L555
; Line 187
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	push	eax
	push	OFFSET $SG556
	call	_printf
	add	esp, 8
; Line 188
	jmp	$L557
$L555:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 115				; 00000073H
	jne	$L558
; Line 189
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	push	eax
	push	OFFSET $SG559
	call	_printf
	add	esp, 8
; Line 190
	jmp	$L560
$L558:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 69					; 00000045H
	jne	$L561
; Line 193
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	eax, DWORD PTR [eax]
	push	eax
	push	OFFSET $SG563
	call	_printf
	add	esp, 8
; Line 194
	mov	DWORD PTR _j$562[ebp], 0
	jmp	$L564
$L565:
	inc	DWORD PTR _j$562[ebp]
$L564:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$562[ebp]
	cmp	DWORD PTR [eax], ecx
	jbe	$L566
; Line 196
	push	OFFSET $SG567
	call	_printf
	add	esp, 4
; Line 197
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$562[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	push	eax
	call	_gen_exp
	add	esp, 4
; Line 198
	jmp	$L565
$L566:
; Line 199
	push	OFFSET $SG568
	call	_printf
	add	esp, 4
; Line 201
	jmp	$L569
$L561:
; Line 202
	call	_abort
$L569:
$L560:
$L557:
$L554:
; Line 203
	jmp	$L548
$L549:
; Line 204
	push	OFFSET $SG571
	call	_printf
	add	esp, 4
; Line 205
$L513:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_exp ENDP
_TEXT	ENDS
PUBLIC	_gen_insn
EXTRN	_strlen:NEAR
_DATA	SEGMENT
	ORG $+2
$SG580	DB	'match_dup operand number has no match_operand', 00H
	ORG $+2
$SG581	DB	'rtx', 0aH, 'gen_%s (', 00H
	ORG $+3
$SG585	DB	', operand%d', 00H
$SG586	DB	'operand%d', 00H
	ORG $+2
$SG587	DB	')', 0aH, 00H
	ORG $+1
$SG591	DB	'     rtx operand%d;', 0aH, 00H
	ORG $+3
$SG592	DB	'{', 0aH, 00H
	ORG $+1
$SG594	DB	'  return ', 00H
	ORG $+2
$SG595	DB	';', 0aH, '}', 0aH, 0aH, 00H
	ORG $+2
$SG597	DB	'  return gen_rtx (PARALLEL, VOIDmode, gen_rtvec (%d', 00H
$SG601	DB	',', 0aH, 09H, 09H, 00H
	ORG $+3
$SG602	DB	'));', 0aH, '}', 0aH, 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_i$ = -4
_insn$ = 8
_operands$ = -8
_gen_insn PROC NEAR
; Line 212
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 218
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_strlen
	add	esp, 4
	or	eax, eax
	jne	$L578
; Line 219
	jmp	$L574
; Line 223
$L578:
	mov	DWORD PTR _register_constraints, 0
; Line 224
	push	1
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_max_operand_vec
	add	esp, 8
	mov	DWORD PTR _operands$[ebp], eax
; Line 225
	mov	eax, DWORD PTR _max_dup_opno
	cmp	DWORD PTR _operands$[ebp], eax
	jg	$L579
; Line 226
	push	0
	push	0
	push	OFFSET $SG580
	call	_fatal
	add	esp, 12					; 0000000cH
; Line 229
$L579:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	OFFSET $SG581
	call	_printf
	add	esp, 8
; Line 230
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L582
$L583:
	inc	DWORD PTR _i$[ebp]
$L582:
	mov	eax, DWORD PTR _operands$[ebp]
	cmp	DWORD PTR _i$[ebp], eax
	jge	$L584
; Line 231
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	eax, OFFSET $SG585
	cmp	DWORD PTR _i$[ebp], 0
	jne	$L742
	mov	eax, OFFSET $SG586
$L742:
	push	eax
	call	_printf
	add	esp, 8
	jmp	$L583
$L584:
; Line 232
	push	OFFSET $SG587
	call	_printf
	add	esp, 4
; Line 233
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L588
$L589:
	inc	DWORD PTR _i$[ebp]
$L588:
	mov	eax, DWORD PTR _operands$[ebp]
	cmp	DWORD PTR _i$[ebp], eax
	jge	$L590
; Line 234
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	push	OFFSET $SG591
	call	_printf
	add	esp, 8
	jmp	$L589
$L590:
; Line 235
	push	OFFSET $SG592
	call	_printf
	add	esp, 4
; Line 239
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax], 1
	jne	$L593
; Line 241
	push	OFFSET $SG594
	call	_printf
	add	esp, 4
; Line 242
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_gen_exp
	add	esp, 4
; Line 243
	push	OFFSET $SG595
	call	_printf
	add	esp, 4
; Line 245
	jmp	$L596
$L593:
; Line 247
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	push	eax
	push	OFFSET $SG597
	call	_printf
	add	esp, 8
; Line 248
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L598
$L599:
	inc	DWORD PTR _i$[ebp]
$L598:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	DWORD PTR [eax], ecx
	jbe	$L600
; Line 250
	push	OFFSET $SG601
	call	_printf
	add	esp, 4
; Line 251
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	push	eax
	call	_gen_exp
	add	esp, 4
; Line 252
	jmp	$L599
$L600:
; Line 253
	push	OFFSET $SG602
	call	_printf
	add	esp, 4
; Line 254
$L596:
; Line 255
$L574:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_insn ENDP
_TEXT	ENDS
PUBLIC	_gen_expand
_DATA	SEGMENT
$SG609	DB	'define_expand lacks a name', 00H
	ORG $+1
$SG611	DB	'define_expand for %s lacks a pattern', 00H
	ORG $+3
$SG612	DB	'rtx', 0aH, 'gen_%s (', 00H
	ORG $+3
$SG616	DB	', operand%d', 00H
$SG617	DB	'operand%d', 00H
	ORG $+2
$SG618	DB	')', 0aH, 00H
	ORG $+1
$SG622	DB	'     rtx operand%d;', 0aH, 00H
	ORG $+3
$SG623	DB	'{', 0aH, 00H
	ORG $+1
$SG627	DB	'  rtx operand%d;', 0aH, 00H
	ORG $+2
$SG628	DB	'  rtx operands[%d];', 0aH, 00H
	ORG $+3
$SG629	DB	'  rtx _val;', 0aH, 00H
	ORG $+3
$SG630	DB	'  start_sequence ();', 0aH, 00H
	ORG $+2
$SG635	DB	'  operands[%d] = operand%d;', 0aH, 00H
	ORG $+3
$SG636	DB	'%s', 0aH, 00H
$SG641	DB	'  operand%d = operands[%d];', 0aH, 00H
	ORG $+3
$SG645	DB	'  operand%d = operands[%d];', 0aH, 00H
	ORG $+3
$SG654	DB	'  emit_jump_insn (', 00H
	ORG $+1
$SG660	DB	'  emit_call_insn (', 00H
	ORG $+1
$SG663	DB	'  emit_label (', 00H
	ORG $+1
$SG667	DB	'  emit (', 00H
	ORG $+3
$SG669	DB	'  emit_insn (', 00H
	ORG $+2
$SG670	DB	');', 0aH, 00H
$SG672	DB	'  emit_barrier ();', 00H
	ORG $+1
$SG673	DB	' _done:', 0aH, 00H
	ORG $+3
$SG674	DB	'  _val = gen_sequence ();', 0aH, 00H
	ORG $+1
$SG675	DB	'  end_sequence ();', 0aH, 00H
$SG676	DB	'  return _val;', 0aH, '}', 0aH, 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_next$649 = -12
_expand$ = 8
_operands$ = -8
_i$ = -4
_gen_expand PROC NEAR
; Line 262
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 266
	mov	eax, DWORD PTR _expand$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_strlen
	add	esp, 4
	or	eax, eax
	jne	$L608
; Line 267
	push	0
	push	0
	push	OFFSET $SG609
	call	_fatal
	add	esp, 12					; 0000000cH
; Line 268
$L608:
	mov	eax, DWORD PTR _expand$[ebp]
	cmp	DWORD PTR [eax+8], 0
	jne	$L610
; Line 269
	push	0
	mov	eax, DWORD PTR _expand$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	OFFSET $SG611
	call	_fatal
	add	esp, 12					; 0000000cH
; Line 273
$L610:
	mov	DWORD PTR _register_constraints, 0
; Line 275
	push	1
	mov	eax, DWORD PTR _expand$[ebp]
	push	eax
	call	_max_operand_vec
	add	esp, 8
	mov	DWORD PTR _operands$[ebp], eax
; Line 278
	mov	eax, DWORD PTR _expand$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	OFFSET $SG612
	call	_printf
	add	esp, 8
; Line 279
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L613
$L614:
	inc	DWORD PTR _i$[ebp]
$L613:
	mov	eax, DWORD PTR _operands$[ebp]
	cmp	DWORD PTR _i$[ebp], eax
	jge	$L615
; Line 280
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	eax, OFFSET $SG616
	cmp	DWORD PTR _i$[ebp], 0
	jne	$L743
	mov	eax, OFFSET $SG617
$L743:
	push	eax
	call	_printf
	add	esp, 8
	jmp	$L614
$L615:
; Line 281
	push	OFFSET $SG618
	call	_printf
	add	esp, 4
; Line 282
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L619
$L620:
	inc	DWORD PTR _i$[ebp]
$L619:
	mov	eax, DWORD PTR _operands$[ebp]
	cmp	DWORD PTR _i$[ebp], eax
	jge	$L621
; Line 283
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	push	OFFSET $SG622
	call	_printf
	add	esp, 8
	jmp	$L620
$L621:
; Line 284
	push	OFFSET $SG623
	call	_printf
	add	esp, 4
; Line 288
	mov	eax, DWORD PTR _operands$[ebp]
	mov	DWORD PTR _i$[ebp], eax
	jmp	$L624
$L625:
	inc	DWORD PTR _i$[ebp]
$L624:
	mov	eax, DWORD PTR _max_dup_opno
	cmp	DWORD PTR _i$[ebp], eax
	jg	$L626
; Line 289
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	push	OFFSET $SG627
	call	_printf
	add	esp, 8
	jmp	$L625
$L626:
; Line 290
	mov	eax, DWORD PTR _max_dup_opno
	inc	eax
	mov	ecx, DWORD PTR _operands$[ebp]
	cmp	eax, ecx
	jg	$L744
	mov	eax, ecx
$L744:
	push	eax
	push	OFFSET $SG628
	call	_printf
	add	esp, 8
; Line 291
	push	OFFSET $SG629
	call	_printf
	add	esp, 4
; Line 292
	push	OFFSET $SG630
	call	_printf
	add	esp, 4
; Line 300
	mov	eax, DWORD PTR _expand$[ebp]
	cmp	DWORD PTR [eax+16], 0
	je	$L631
; Line 303
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L632
$L633:
	inc	DWORD PTR _i$[ebp]
$L632:
	mov	eax, DWORD PTR _operands$[ebp]
	cmp	DWORD PTR _i$[ebp], eax
	jge	$L634
; Line 304
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	push	OFFSET $SG635
	call	_printf
	add	esp, 12					; 0000000cH
	jmp	$L633
$L634:
; Line 308
	mov	eax, DWORD PTR _expand$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	push	OFFSET $SG636
	call	_printf
	add	esp, 8
; Line 312
	mov	eax, DWORD PTR _expand$[ebp]
	cmp	DWORD PTR [eax+8], 0
	je	$L637
; Line 314
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L638
$L639:
	inc	DWORD PTR _i$[ebp]
$L638:
	mov	eax, DWORD PTR _operands$[ebp]
	cmp	DWORD PTR _i$[ebp], eax
	jge	$L640
; Line 315
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	push	OFFSET $SG641
	call	_printf
	add	esp, 12					; 0000000cH
	jmp	$L639
$L640:
; Line 316
	jmp	$L642
$L643:
	inc	DWORD PTR _i$[ebp]
$L642:
	mov	eax, DWORD PTR _max_dup_opno
	cmp	DWORD PTR _i$[ebp], eax
	jg	$L644
; Line 317
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	push	OFFSET $SG645
	call	_printf
	add	esp, 12					; 0000000cH
	jmp	$L643
$L644:
; Line 319
$L637:
; Line 325
$L631:
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L646
$L647:
	inc	DWORD PTR _i$[ebp]
$L646:
	mov	eax, DWORD PTR _expand$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	DWORD PTR [eax], ecx
	jbe	$L648
; Line 327
	mov	eax, DWORD PTR _expand$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	mov	DWORD PTR _next$649[ebp], eax
; Line 332
	mov	eax, DWORD PTR _next$649[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L652
	mov	eax, DWORD PTR _next$649[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2162688				; 00210000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L651
$L652:
	mov	eax, DWORD PTR _next$649[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1310720				; 00140000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L653
	mov	eax, DWORD PTR _next$649[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L653
	mov	eax, DWORD PTR _next$649[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2162688				; 00210000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L651
$L653:
	mov	eax, DWORD PTR _next$649[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1900544				; 001d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L650
$L651:
; Line 333
	push	OFFSET $SG654
	call	_printf
	add	esp, 4
; Line 334
	jmp	$L655
$L650:
; Line 340
	mov	eax, DWORD PTR _next$649[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L658
	mov	eax, DWORD PTR _next$649[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1835008				; 001c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L657
$L658:
	mov	eax, DWORD PTR _next$649[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1835008				; 001c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L657
	mov	eax, DWORD PTR _next$649[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1310720				; 00140000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L659
	mov	eax, DWORD PTR _next$649[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L659
	mov	eax, DWORD PTR _next$649[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1835008				; 001c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L657
$L659:
	mov	eax, DWORD PTR _next$649[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1310720				; 00140000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L656
	mov	eax, DWORD PTR _next$649[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1835008				; 001c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L656
$L657:
; Line 341
	push	OFFSET $SG660
	call	_printf
	add	esp, 4
; Line 342
	jmp	$L661
$L656:
	mov	eax, DWORD PTR _next$649[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1114112				; 00110000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L662
; Line 343
	push	OFFSET $SG663
	call	_printf
	add	esp, 4
; Line 344
	jmp	$L664
$L662:
; Line 347
	mov	eax, DWORD PTR _next$649[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 262144				; 00040000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L666
	mov	eax, DWORD PTR _next$649[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 393216				; 00060000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L666
	mov	eax, DWORD PTR _next$649[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 327680				; 00050000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L666
	mov	eax, DWORD PTR _next$649[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1310720				; 00140000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L665
$L666:
; Line 348
	push	OFFSET $SG667
	call	_printf
	add	esp, 4
; Line 349
	jmp	$L668
$L665:
; Line 350
	push	OFFSET $SG669
	call	_printf
	add	esp, 4
$L668:
$L664:
$L661:
$L655:
; Line 351
	mov	eax, DWORD PTR _next$649[ebp]
	push	eax
	call	_gen_exp
	add	esp, 4
; Line 352
	push	OFFSET $SG670
	call	_printf
	add	esp, 4
; Line 354
	mov	eax, DWORD PTR _next$649[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L671
	mov	eax, DWORD PTR _next$649[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2162688				; 00210000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L671
	mov	eax, DWORD PTR _next$649[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L671
; Line 355
	push	OFFSET $SG672
	call	_printf
	add	esp, 4
; Line 356
$L671:
	jmp	$L647
$L648:
; Line 361
	push	OFFSET $SG673
	call	_printf
	add	esp, 4
; Line 362
	push	OFFSET $SG674
	call	_printf
	add	esp, 4
; Line 363
	push	OFFSET $SG675
	call	_printf
	add	esp, 4
; Line 364
	push	OFFSET $SG676
	call	_printf
	add	esp, 4
; Line 365
$L605:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_expand ENDP
_TEXT	ENDS
PUBLIC	_xmalloc
EXTRN	_malloc:NEAR
_DATA	SEGMENT
	ORG $+1
$SG682	DB	'virtual memory exhausted', 00H
_DATA	ENDS
_TEXT	SEGMENT
_size$ = 8
_val$ = -4
_xmalloc PROC NEAR
; Line 369
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 370
	mov	eax, DWORD PTR _size$[ebp]
	push	eax
	call	_malloc
	add	esp, 4
	mov	DWORD PTR _val$[ebp], eax
; Line 372
	cmp	DWORD PTR _val$[ebp], 0
	jne	$L681
; Line 373
	push	0
	push	0
	push	OFFSET $SG682
	call	_fatal
	add	esp, 12					; 0000000cH
; Line 375
$L681:
	mov	eax, DWORD PTR _val$[ebp]
	jmp	$L678
; Line 376
$L678:
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
$SG690	DB	'virtual memory exhausted', 00H
_DATA	ENDS
_TEXT	SEGMENT
_ptr$ = 8
_size$ = 12
_result$ = -4
_xrealloc PROC NEAR
; Line 382
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 383
	mov	eax, DWORD PTR _size$[ebp]
	push	eax
	mov	eax, DWORD PTR _ptr$[ebp]
	push	eax
	call	_realloc
	add	esp, 8
	mov	DWORD PTR _result$[ebp], eax
; Line 384
	cmp	DWORD PTR _result$[ebp], 0
	jne	$L689
; Line 385
	push	0
	push	0
	push	OFFSET $SG690
	call	_fatal
	add	esp, 12					; 0000000cH
; Line 386
$L689:
	mov	eax, DWORD PTR _result$[ebp]
	jmp	$L686
; Line 387
$L686:
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
$SG695	DB	'genemit: ', 00H
	ORG $+2
$SG696	DB	0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_s$ = 8
_a1$ = 12
_a2$ = 16
_fatal	PROC NEAR
; Line 392
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 393
	push	OFFSET $SG695
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 8
; Line 394
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
; Line 395
	push	OFFSET $SG696
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 8
; Line 396
	push	33					; 00000021H
	call	_exit
	add	esp, 4
; Line 397
$L694:
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
$SG699	DB	'Internal gcc abort.', 00H
_DATA	ENDS
_TEXT	SEGMENT
_fancy_abort PROC NEAR
; Line 404
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 405
	push	0
	push	0
	push	OFFSET $SG699
	call	_fatal
	add	esp, 12					; 0000000cH
; Line 406
$L698:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_fancy_abort ENDP
_TEXT	ENDS
PUBLIC	_main
EXTRN	_read_rtx:NEAR
EXTRN	_fopen:NEAR
EXTRN	__obstack_begin:NEAR
EXTRN	_init_rtl:NEAR
EXTRN	_free:NEAR
EXTRN	_perror:NEAR
EXTRN	_read_skip_spaces:NEAR
EXTRN	_ungetc:NEAR
EXTRN	_fflush:NEAR
_DATA	SEGMENT
$SG710	DB	'No input file name.', 00H
$SG711	DB	'r', 00H
	ORG $+2
$SG714	DB	'/* Generated automatically by the program `genemit''', 0aH
	DB	'from the machine description file `md''.  */', 0aH, 0aH, 00H
	ORG $+2
$SG715	DB	'#include "config.h"', 0aH, 00H
	ORG $+3
$SG716	DB	'#include "rtl.h"', 0aH, 00H
	ORG $+2
$SG717	DB	'#include "expr.h"', 0aH, 00H
	ORG $+1
$SG718	DB	'#include "real.h"', 0aH, 00H
	ORG $+1
$SG719	DB	'#include "insn-config.h"', 0aH, 0aH, 00H
	ORG $+1
$SG720	DB	'#include "insn-flags.h"', 0aH, 0aH, 00H
	ORG $+2
$SG721	DB	'extern char *insn_operand_constraint[][MAX_RECOG_OPERAND'
	DB	'S];', 0aH, 0aH, 00H
	ORG $+2
$SG722	DB	'extern rtx recog_operand[];', 0aH, 00H
	ORG $+3
$SG723	DB	'#define operands emit_operand', 0aH, 0aH, 00H
$SG724	DB	'#define FAIL do { end_sequence (); return 0;} while (0)', 0aH
	DB	0aH, 00H
	ORG $+2
$SG725	DB	'#define DONE goto _done', 0aH, 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_desc$ = -4
_infile$ = -12
_c$ = -8
_argc$ = 8
_argv$ = 12
_main	PROC NEAR
; Line 412
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 418
	push	OFFSET _free
	push	OFFSET _xmalloc
	push	0
	push	0
	mov	eax, DWORD PTR _rtl_obstack
	push	eax
	call	__obstack_begin
	add	esp, 20					; 00000014H
; Line 420
	cmp	DWORD PTR _argc$[ebp], 1
	jg	$L709
; Line 421
	push	0
	push	0
	push	OFFSET $SG710
	call	_fatal
	add	esp, 12					; 0000000cH
; Line 423
$L709:
	push	OFFSET $SG711
	mov	eax, DWORD PTR _argv$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_fopen
	add	esp, 8
	mov	DWORD PTR _infile$[ebp], eax
; Line 424
	cmp	DWORD PTR _infile$[ebp], 0
	jne	$L712
; Line 426
	mov	eax, DWORD PTR _argv$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_perror
	add	esp, 4
; Line 427
	push	33					; 00000021H
	call	_exit
	add	esp, 4
; Line 430
$L712:
	call	_init_rtl
; Line 435
	mov	DWORD PTR _insn_code_number, 0
; Line 438
	push	OFFSET $SG714
	call	_printf
	add	esp, 4
; Line 440
	push	OFFSET $SG715
	call	_printf
	add	esp, 4
; Line 441
	push	OFFSET $SG716
	call	_printf
	add	esp, 4
; Line 442
	push	OFFSET $SG717
	call	_printf
	add	esp, 4
; Line 443
	push	OFFSET $SG718
	call	_printf
	add	esp, 4
; Line 444
	push	OFFSET $SG719
	call	_printf
	add	esp, 4
; Line 445
	push	OFFSET $SG720
	call	_printf
	add	esp, 4
; Line 446
	push	OFFSET $SG721
	call	_printf
	add	esp, 4
; Line 447
	push	OFFSET $SG722
	call	_printf
	add	esp, 4
; Line 448
	push	OFFSET $SG723
	call	_printf
	add	esp, 4
; Line 449
	push	OFFSET $SG724
	call	_printf
	add	esp, 4
; Line 450
	push	OFFSET $SG725
	call	_printf
	add	esp, 4
; Line 454
$L727:
; Line 456
	mov	eax, DWORD PTR _infile$[ebp]
	push	eax
	call	_read_skip_spaces
	add	esp, 4
	mov	DWORD PTR _c$[ebp], eax
; Line 457
	cmp	DWORD PTR _c$[ebp], -1
	jne	$L730
; Line 458
	jmp	$L728
; Line 459
$L730:
	mov	eax, DWORD PTR _infile$[ebp]
	push	eax
	mov	eax, DWORD PTR _c$[ebp]
	push	eax
	call	_ungetc
	add	esp, 8
; Line 461
	mov	eax, DWORD PTR _infile$[ebp]
	push	eax
	call	_read_rtx
	add	esp, 4
	mov	DWORD PTR _desc$[ebp], eax
; Line 462
	mov	eax, DWORD PTR _desc$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 458752				; 00070000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L731
; Line 464
	mov	eax, DWORD PTR _desc$[ebp]
	push	eax
	call	_gen_insn
	add	esp, 4
; Line 465
	inc	DWORD PTR _insn_code_number
; Line 467
$L731:
	mov	eax, DWORD PTR _desc$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 655360				; 000a0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L732
; Line 469
	mov	eax, DWORD PTR _desc$[ebp]
	push	eax
	call	_gen_expand
	add	esp, 4
; Line 470
	inc	DWORD PTR _insn_code_number
; Line 472
$L732:
	mov	eax, DWORD PTR _desc$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 524288				; 00080000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L733
; Line 474
	inc	DWORD PTR _insn_code_number
; Line 476
$L733:
	jmp	$L727
$L728:
; Line 478
	mov	eax, OFFSET __iob
	add	eax, 32					; 00000020H
	push	eax
	call	_fflush
	add	esp, 4
; Line 479
	mov	eax, DWORD PTR __iob+44
	and	eax, 32					; 00000020H
	cmp	eax, 1
	cmc
	sbb	eax, eax
	and	eax, 33					; 00000021H
	push	eax
	call	_exit
	add	esp, 4
; Line 480
$L703:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_main	ENDP
_TEXT	ENDS
END
