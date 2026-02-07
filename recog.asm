	TITLE	recog.c
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
COMM	_volatile_ok:DWORD
COMM	_recog_addr_dummy:DWORD
COMM	_which_alternative:DWORD
COMM	_reload_completed:DWORD
_DATA	ENDS
PUBLIC	_init_recog
EXTRN	_gen_rtx:NEAR
_TEXT	SEGMENT
; File recog.c
_init_recog PROC NEAR
; Line 61
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 62
	mov	DWORD PTR _volatile_ok, 0
; Line 63
	push	0
	push	0
	push	37					; 00000025H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _recog_addr_dummy, eax
; Line 64
$L513:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_init_recog ENDP
_TEXT	ENDS
PUBLIC	_recog_memoized
EXTRN	_recog:NEAR
_TEXT	SEGMENT
_insn$ = 8
_recog_memoized PROC NEAR
; Line 78
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 79
	mov	DWORD PTR _volatile_ok, 1
; Line 80
	mov	eax, DWORD PTR _insn$[ebp]
	cmp	DWORD PTR [eax+20], 0
	jge	$L516
; Line 81
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_recog
	add	esp, 8
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	DWORD PTR [ecx+20], eax
; Line 82
$L516:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+20]
	jmp	$L515
; Line 83
$L515:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_recog_memoized ENDP
_TEXT	ENDS
PUBLIC	_next_insn_tests_no_inequality
_TEXT	SEGMENT
_insn$ = 8
_next$ = -4
_next_insn_tests_no_inequality PROC NEAR
; Line 92
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 93
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _next$[ebp], eax
; Line 98
	mov	eax, DWORD PTR _next$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 917504				; 000e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1035
	mov	eax, DWORD PTR _next$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 851968				; 000d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1035
	mov	eax, DWORD PTR _next$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 983040				; 000f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1033
$L1035:
	mov	eax, DWORD PTR _next$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_inequality_comparisons_p
	add	esp, 4
	or	eax, eax
	jne	$L1033
	mov	eax, 1
	jmp	$L1034
$L1033:
	sub	eax, eax
$L1034:
	jmp	$L520
; Line 99
$L520:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_next_insn_tests_no_inequality ENDP
_TEXT	ENDS
PUBLIC	_next_insns_test_no_inequality
EXTRN	_cc0_rtx:DWORD
EXTRN	_reg_mentioned_p:NEAR
_TEXT	SEGMENT
_insn$ = 8
_next$ = -4
_next_insns_test_no_inequality PROC NEAR
; Line 106
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 107
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _next$[ebp], eax
; Line 109
	jmp	$L526
$L527:
	mov	eax, DWORD PTR _next$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _next$[ebp], eax
$L526:
	cmp	DWORD PTR _next$[ebp], 0
	je	$L528
; Line 112
	mov	eax, DWORD PTR _next$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1114112				; 00110000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L530
	mov	eax, DWORD PTR _next$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1048576				; 00100000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L529
$L530:
; Line 113
	mov	eax, 1
	jmp	$L524
; Line 114
$L529:
	mov	eax, DWORD PTR _next$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1179648				; 00120000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L531
; Line 115
	jmp	$L527
; Line 116
$L531:
	mov	eax, DWORD PTR _next$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_inequality_comparisons_p
	add	esp, 4
	or	eax, eax
	je	$L532
; Line 117
	sub	eax, eax
	jmp	$L524
; Line 118
$L532:
; Line 119
	mov	eax, DWORD PTR _next$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L533
	mov	eax, DWORD PTR _next$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _cc0_rtx
	cmp	DWORD PTR [eax+4], ecx
	jne	$L533
; Line 120
	mov	eax, 1
	jmp	$L524
; Line 121
$L533:
	mov	eax, DWORD PTR _next$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	mov	eax, DWORD PTR _cc0_rtx
	push	eax
	call	_reg_mentioned_p
	add	esp, 8
	or	eax, eax
	jne	$L535
; Line 122
	mov	eax, 1
	jmp	$L524
; Line 123
$L535:
	jmp	$L527
$L528:
; Line 124
	mov	eax, 1
	jmp	$L524
; Line 125
$L524:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_next_insns_test_no_inequality ENDP
_TEXT	ENDS
EXTRN	_rtx_length:BYTE
EXTRN	_rtx_format:BYTE
_TEXT	SEGMENT
_x$ = 8
_fmt$ = -16
_len$ = -4
_i$ = -8
_code$ = -12
_j$555 = -20
_inequality_comparisons_p PROC NEAR
; Line 130
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	push	ebx
	push	esi
	push	edi
; Line 133
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$[ebp], eax
; Line 135
	mov	eax, DWORD PTR _code$[ebp]
	mov	DWORD PTR -24+[ebp], eax
	jmp	$L542
; Line 137
$L546:
; Line 145
	sub	eax, eax
	jmp	$L537
; Line 147
$L547:
; Line 155
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR _cc0_rtx
	cmp	DWORD PTR [eax+4], ecx
	je	$L1038
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR _cc0_rtx
	cmp	DWORD PTR [eax+8], ecx
	jne	$L1036
$L1038:
	mov	eax, 1
	jmp	$L1037
$L1036:
	sub	eax, eax
$L1037:
	jmp	$L537
; Line 156
	jmp	$L543
$L542:
	cmp	DWORD PTR -24+[ebp], 40			; 00000028H
	jg	$L1039
	cmp	DWORD PTR -24+[ebp], 38			; 00000026H
	jge	$L546
	cmp	DWORD PTR -24+[ebp], 30			; 0000001eH
	jl	$L543
	cmp	DWORD PTR -24+[ebp], 34			; 00000022H
	jle	$L546
	jmp	$L543
$L1039:
	cmp	DWORD PTR -24+[ebp], 69			; 00000045H
	jl	$L543
	cmp	DWORD PTR -24+[ebp], 76			; 0000004cH
	jle	$L547
	jmp	$L543
$L543:
; Line 158
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_length[eax*4]
	mov	DWORD PTR _len$[ebp], eax
; Line 159
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_format[eax*4]
	mov	DWORD PTR _fmt$[ebp], eax
; Line 161
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L548
$L549:
	inc	DWORD PTR _i$[ebp]
$L548:
	mov	eax, DWORD PTR _len$[ebp]
	cmp	DWORD PTR _i$[ebp], eax
	jge	$L550
; Line 163
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 101				; 00000065H
	jne	$L551
; Line 165
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	push	eax
	call	_inequality_comparisons_p
	add	esp, 4
	or	eax, eax
	je	$L552
; Line 166
	mov	eax, 1
	jmp	$L537
; Line 167
$L552:
; Line 168
	jmp	$L553
$L551:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 69					; 00000045H
	jne	$L554
; Line 171
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	eax, DWORD PTR [eax]
	dec	eax
	mov	DWORD PTR _j$555[ebp], eax
	jmp	$L556
$L557:
	dec	DWORD PTR _j$555[ebp]
$L556:
	cmp	DWORD PTR _j$555[ebp], 0
	jl	$L558
; Line 172
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$555[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	push	eax
	call	_inequality_comparisons_p
	add	esp, 4
	or	eax, eax
	je	$L559
; Line 173
	mov	eax, 1
	jmp	$L537
; Line 174
$L559:
	jmp	$L557
$L558:
; Line 175
$L554:
$L553:
	jmp	$L549
$L550:
; Line 177
	sub	eax, eax
	jmp	$L537
; Line 178
$L537:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_inequality_comparisons_p ENDP
_TEXT	ENDS
PUBLIC	_mode_dependent_address_p
PUBLIC	_general_operand
_TEXT	SEGMENT
_y$576 = -12
_op$ = 8
_mode$ = 12
_code$ = -4
_mode_altering_drug$ = -8
_general_operand PROC NEAR
; Line 198
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 199
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$[ebp], eax
; Line 200
	mov	DWORD PTR _mode_altering_drug$[ebp], 0
; Line 202
	cmp	DWORD PTR _mode$[ebp], 0
	jne	$L566
; Line 203
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	mov	DWORD PTR _mode$[ebp], eax
; Line 205
$L566:
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L568
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L568
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L568
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L567
$L568:
; Line 207
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sub	ecx, ecx
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L1042
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	cmp	eax, DWORD PTR _mode$[ebp]
	jne	$L1040
$L1042:
	mov	eax, 1
	jmp	$L1041
$L1040:
	sub	eax, eax
$L1041:
	jmp	$L563
; Line 212
$L567:
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	cmp	eax, DWORD PTR _mode$[ebp]
	je	$L569
; Line 213
	sub	eax, eax
	jmp	$L563
; Line 215
$L569:
$L571:
	cmp	DWORD PTR _code$[ebp], 35		; 00000023H
	jne	$L572
; Line 217
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _op$[ebp], eax
; Line 218
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$[ebp], eax
; Line 224
	jmp	$L571
$L572:
; Line 225
	cmp	DWORD PTR _code$[ebp], 34		; 00000022H
	jne	$L573
; Line 226
	mov	eax, 1
	jmp	$L563
; Line 227
$L573:
	cmp	DWORD PTR _code$[ebp], 31		; 0000001fH
	jne	$L574
; Line 228
	mov	eax, 1
	jmp	$L563
; Line 229
$L574:
	cmp	DWORD PTR _code$[ebp], 37		; 00000025H
	jne	$L575
; Line 231
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _y$576[ebp], eax
; Line 232
	cmp	DWORD PTR _volatile_ok, 0
	jne	$L577
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax]
	shr	eax, 27					; 0000001bH
	test	al, 1
	je	$L577
; Line 233
	sub	eax, eax
	jmp	$L563
; Line 235
$L577:
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	mov	DWORD PTR _mode$[ebp], eax
; Line 236
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L579
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L579
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L579
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L578
$L579:
	jmp	$win$580
$L578:
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L583
	mov	eax, DWORD PTR _y$576[ebp]
	cmp	DWORD PTR [eax+4], 7
	jl	$L582
	mov	eax, DWORD PTR _y$576[ebp]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jge	$L582
$L583:
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3080192				; 002f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L581
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L581
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jl	$L584
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L581
$L584:
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L581
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 2
	je	$L585
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 4
	je	$L585
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 8
	jne	$L581
$L585:
$L582:
	jmp	$win$580
$L581:
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L586
	mov	eax, DWORD PTR _y$576[ebp]
	cmp	DWORD PTR [eax+4], 7
	jle	$L587
	mov	eax, DWORD PTR _y$576[ebp]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L586
$L587:
	jmp	$win$580
$L586:
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L588
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L590
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jl	$L589
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jge	$L589
$L590:
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3080192				; 002f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L588
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L588
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jl	$L591
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L588
$L591:
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L588
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 2
	je	$L592
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 4
	je	$L592
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 8
	jne	$L588
$L592:
$L589:
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L593
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 7
	jle	$L594
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L593
$L594:
	jmp	$win$580
$L593:
$L588:
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L595
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L597
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 7
	jl	$L596
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jge	$L596
$L597:
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3080192				; 002f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L595
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L595
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jl	$L598
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L595
$L598:
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L595
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 2
	je	$L599
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 4
	je	$L599
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 8
	jne	$L595
$L599:
$L596:
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L600
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jle	$L601
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L600
$L601:
	jmp	$win$580
$L600:
$L595:
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L602
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L604
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L604
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L604
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L603
$L604:
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L607
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jl	$L606
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jge	$L606
$L607:
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3080192				; 002f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L605
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L605
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jl	$L608
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L605
$L608:
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L605
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 2
	je	$L609
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 4
	je	$L609
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 8
	jne	$L605
$L609:
$L606:
	jmp	$win$580
$L605:
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L610
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jle	$L611
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L610
$L611:
	jmp	$win$580
$L610:
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L612
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L614
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jl	$L613
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jge	$L613
$L614:
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3080192				; 002f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L612
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L612
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jl	$L615
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L612
$L615:
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L612
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 2
	je	$L616
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 4
	je	$L616
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 8
	jne	$L612
$L616:
$L613:
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L617
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 7
	jle	$L618
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L617
$L618:
	jmp	$win$580
$L617:
$L612:
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L619
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L621
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 7
	jl	$L620
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jge	$L620
$L621:
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3080192				; 002f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L619
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L619
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jl	$L622
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L619
$L622:
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L619
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 2
	je	$L623
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 4
	je	$L623
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 8
	jne	$L619
$L623:
$L620:
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L624
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jle	$L625
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L624
$L625:
	jmp	$win$580
$L624:
$L619:
$L603:
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L627
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L627
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L627
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L626
$L627:
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L630
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 7
	jl	$L629
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jge	$L629
$L630:
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3080192				; 002f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L628
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L628
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jl	$L631
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L628
$L631:
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L628
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 2
	je	$L632
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 4
	je	$L632
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 8
	jne	$L628
$L632:
$L629:
	jmp	$win$580
$L628:
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L633
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 7
	jle	$L634
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L633
$L634:
	jmp	$win$580
$L633:
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L635
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L637
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jl	$L636
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jge	$L636
$L637:
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3080192				; 002f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L635
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L635
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jl	$L638
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L635
$L638:
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L635
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 2
	je	$L639
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 4
	je	$L639
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 8
	jne	$L635
$L639:
$L636:
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L640
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 7
	jle	$L641
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L640
$L641:
	jmp	$win$580
$L640:
$L635:
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L642
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L644
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 7
	jl	$L643
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jge	$L643
$L644:
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3080192				; 002f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L642
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L642
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jl	$L645
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L642
$L645:
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L642
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 2
	je	$L646
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 4
	je	$L646
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 8
	jne	$L642
$L646:
$L643:
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L647
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jle	$L648
	mov	eax, DWORD PTR _y$576[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L647
$L648:
	jmp	$win$580
$L647:
$L642:
$L626:
$L602:
; Line 238
$L575:
	sub	eax, eax
	jmp	$L563
; Line 240
$win$580:
; Line 241
	cmp	DWORD PTR _mode_altering_drug$[ebp], 0
	je	$L649
; Line 242
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_mode_dependent_address_p
	add	esp, 4
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	jmp	$L563
; Line 243
$L649:
	mov	eax, 1
	jmp	$L563
; Line 244
$L563:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_general_operand ENDP
_TEXT	ENDS
PUBLIC	_address_operand
PUBLIC	_memory_address_p
_TEXT	SEGMENT
_op$ = 8
_mode$ = 12
_address_operand PROC NEAR
; Line 256
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 258
	mov	eax, DWORD PTR _op$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_memory_address_p
	add	esp, 8
	or	eax, eax
	je	$L1043
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1045
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax]
	shr	eax, 27					; 0000001bH
	test	al, 1
	je	$L1045
	cmp	DWORD PTR _volatile_ok, 0
	je	$L1043
$L1045:
	mov	eax, 1
	jmp	$L1044
$L1043:
	sub	eax, eax
$L1044:
	jmp	$L654
; Line 259
$L654:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_address_operand ENDP
_TEXT	ENDS
PUBLIC	_register_operand
_TEXT	SEGMENT
_op$ = 8
_mode$ = 12
_register_operand PROC NEAR
; Line 271
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 272
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	cmp	eax, DWORD PTR _mode$[ebp]
	je	$L659
	cmp	DWORD PTR _mode$[ebp], 0
	je	$L659
; Line 273
	sub	eax, eax
	jmp	$L658
; Line 275
$L659:
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L660
; Line 283
	cmp	DWORD PTR _reload_completed, 0
	jne	$L661
; Line 284
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	mov	eax, DWORD PTR _op$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	jmp	$L658
; Line 285
$L661:
; Line 287
$L660:
$L663:
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L664
; Line 288
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _op$[ebp], eax
	jmp	$L663
$L664:
; Line 290
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	sub	eax, ecx
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	jmp	$L658
; Line 291
$L658:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_register_operand ENDP
_TEXT	ENDS
PUBLIC	_immediate_operand
_TEXT	SEGMENT
_op$ = 8
_mode$ = 12
_immediate_operand PROC NEAR
; Line 302
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 306
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1048
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1048
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1048
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1048
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2031616				; 001f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1046
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	cmp	eax, DWORD PTR _mode$[ebp]
	je	$L1049
	cmp	DWORD PTR _mode$[ebp], 0
	jne	$L1046
$L1049:
$L1048:
	mov	eax, 1
	jmp	$L1047
$L1046:
	sub	eax, eax
$L1047:
	jmp	$L668
; Line 307
$L668:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_immediate_operand ENDP
_TEXT	ENDS
PUBLIC	_nonimmediate_operand
_TEXT	SEGMENT
_op$ = 8
_mode$ = 12
_nonimmediate_operand PROC NEAR
; Line 315
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 317
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	mov	eax, DWORD PTR _op$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1050
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1050
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1050
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1050
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1050
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2031616				; 001f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1050
	mov	eax, 1
	jmp	$L1051
$L1050:
	sub	eax, eax
$L1051:
	jmp	$L672
; Line 318
$L672:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_nonimmediate_operand ENDP
_TEXT	ENDS
PUBLIC	_nonmemory_operand
_TEXT	SEGMENT
_op$ = 8
_mode$ = 12
_nonmemory_operand PROC NEAR
; Line 326
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 327
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L678
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L678
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L678
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L678
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2031616				; 001f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L677
$L678:
; Line 329
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sub	ecx, ecx
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L1054
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	cmp	eax, DWORD PTR _mode$[ebp]
	jne	$L1052
$L1054:
	mov	eax, 1
	jmp	$L1053
$L1052:
	sub	eax, eax
$L1053:
	jmp	$L676
; Line 331
$L677:
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	cmp	eax, DWORD PTR _mode$[ebp]
	je	$L679
	cmp	DWORD PTR _mode$[ebp], 0
	je	$L679
; Line 332
	sub	eax, eax
	jmp	$L676
; Line 334
$L679:
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L680
; Line 342
	cmp	DWORD PTR _reload_completed, 0
	jne	$L681
; Line 343
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	mov	eax, DWORD PTR _op$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	jmp	$L676
; Line 344
$L681:
; Line 346
$L680:
$L683:
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L684
; Line 347
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _op$[ebp], eax
	jmp	$L683
$L684:
; Line 349
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	sub	eax, ecx
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	jmp	$L676
; Line 350
$L676:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_nonmemory_operand ENDP
_TEXT	ENDS
PUBLIC	_push_operand
EXTRN	_stack_pointer_rtx:DWORD
_TEXT	SEGMENT
_op$ = 8
_mode$ = 12
_push_operand PROC NEAR
; Line 362
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 363
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L689
; Line 364
	sub	eax, eax
	jmp	$L688
; Line 366
$L689:
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	cmp	eax, DWORD PTR _mode$[ebp]
	je	$L690
; Line 367
	sub	eax, eax
	jmp	$L688
; Line 369
$L690:
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _op$[ebp], eax
; Line 372
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 4128768				; 003f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L691
; Line 373
	sub	eax, eax
	jmp	$L688
; Line 378
$L691:
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax+4]
	sub	eax, DWORD PTR _stack_pointer_rtx
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	jmp	$L688
; Line 379
$L688:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_push_operand ENDP
_addr$ = 12
_memory_address_p PROC NEAR
; Line 387
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 388
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L696
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L696
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L696
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L695
$L696:
	jmp	$win$697
$L695:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L700
	mov	eax, DWORD PTR _addr$[ebp]
	cmp	DWORD PTR [eax+4], 7
	jl	$L699
	mov	eax, DWORD PTR _addr$[ebp]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jge	$L699
$L700:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3080192				; 002f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L698
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L698
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jl	$L701
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L698
$L701:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L698
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 2
	je	$L702
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 4
	je	$L702
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 8
	jne	$L698
$L702:
$L699:
	jmp	$win$697
$L698:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L703
	mov	eax, DWORD PTR _addr$[ebp]
	cmp	DWORD PTR [eax+4], 7
	jle	$L704
	mov	eax, DWORD PTR _addr$[ebp]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L703
$L704:
	jmp	$win$697
$L703:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L705
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L707
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jl	$L706
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jge	$L706
$L707:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3080192				; 002f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L705
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L705
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jl	$L708
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L705
$L708:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L705
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 2
	je	$L709
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 4
	je	$L709
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 8
	jne	$L705
$L709:
$L706:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L710
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 7
	jle	$L711
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L710
$L711:
	jmp	$win$697
$L710:
$L705:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L712
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L714
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 7
	jl	$L713
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jge	$L713
$L714:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3080192				; 002f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L712
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L712
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jl	$L715
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L712
$L715:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L712
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 2
	je	$L716
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 4
	je	$L716
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 8
	jne	$L712
$L716:
$L713:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L717
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jle	$L718
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L717
$L718:
	jmp	$win$697
$L717:
$L712:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L719
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L721
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L721
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L721
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L720
$L721:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L724
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jl	$L723
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jge	$L723
$L724:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3080192				; 002f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L722
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L722
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jl	$L725
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L722
$L725:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L722
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 2
	je	$L726
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 4
	je	$L726
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 8
	jne	$L722
$L726:
$L723:
	jmp	$win$697
$L722:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L727
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jle	$L728
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L727
$L728:
	jmp	$win$697
$L727:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L729
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L731
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jl	$L730
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jge	$L730
$L731:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3080192				; 002f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L729
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L729
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jl	$L732
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L729
$L732:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L729
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 2
	je	$L733
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 4
	je	$L733
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 8
	jne	$L729
$L733:
$L730:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L734
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 7
	jle	$L735
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L734
$L735:
	jmp	$win$697
$L734:
$L729:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L736
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L738
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 7
	jl	$L737
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jge	$L737
$L738:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3080192				; 002f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L736
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L736
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jl	$L739
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L736
$L739:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L736
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 2
	je	$L740
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 4
	je	$L740
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 8
	jne	$L736
$L740:
$L737:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L741
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jle	$L742
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L741
$L742:
	jmp	$win$697
$L741:
$L736:
$L720:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L744
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L744
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L744
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L743
$L744:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L747
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 7
	jl	$L746
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jge	$L746
$L747:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3080192				; 002f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L745
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L745
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jl	$L748
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L745
$L748:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L745
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 2
	je	$L749
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 4
	je	$L749
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 8
	jne	$L745
$L749:
$L746:
	jmp	$win$697
$L745:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L750
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 7
	jle	$L751
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L750
$L751:
	jmp	$win$697
$L750:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L752
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L754
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jl	$L753
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jge	$L753
$L754:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3080192				; 002f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L752
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L752
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jl	$L755
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L752
$L755:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L752
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 2
	je	$L756
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 4
	je	$L756
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 8
	jne	$L752
$L756:
$L753:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L757
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 7
	jle	$L758
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L757
$L758:
	jmp	$win$697
$L757:
$L752:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L759
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L761
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 7
	jl	$L760
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jge	$L760
$L761:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3080192				; 002f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L759
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L759
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jl	$L762
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L759
$L762:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L759
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 2
	je	$L763
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 4
	je	$L763
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 8
	jne	$L759
$L763:
$L760:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L764
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jle	$L765
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L764
$L765:
	jmp	$win$697
$L764:
$L759:
$L743:
$L719:
; Line 389
	sub	eax, eax
	jmp	$L694
; Line 391
$win$697:
; Line 392
	mov	eax, 1
	jmp	$L694
; Line 393
$L694:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_memory_address_p ENDP
_TEXT	ENDS
PUBLIC	_memory_operand
_TEXT	SEGMENT
_inner$ = -4
_mode_altering_drug$ = -8
_op$ = 8
_mode$ = 12
_memory_operand PROC NEAR
; Line 405
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 407
	mov	DWORD PTR _mode_altering_drug$[ebp], 0
; Line 409
	cmp	DWORD PTR _reload_completed, 0
	jne	$L772
; Line 412
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1055
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	mov	eax, DWORD PTR _op$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1055
	mov	eax, 1
	jmp	$L1056
$L1055:
	sub	eax, eax
$L1056:
	jmp	$L769
; Line 414
$L772:
	cmp	DWORD PTR _mode$[ebp], 0
	je	$L773
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	cmp	eax, DWORD PTR _mode$[ebp]
	je	$L773
; Line 415
	sub	eax, eax
	jmp	$L769
; Line 417
$L773:
	mov	eax, DWORD PTR _op$[ebp]
	mov	DWORD PTR _inner$[ebp], eax
; Line 418
$L775:
	mov	eax, DWORD PTR _inner$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L776
; Line 419
	mov	eax, DWORD PTR _inner$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _inner$[ebp], eax
	jmp	$L775
$L776:
; Line 421
	mov	eax, DWORD PTR _inner$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1057
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	mov	eax, DWORD PTR _op$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1057
	mov	eax, 1
	jmp	$L1058
$L1057:
	sub	eax, eax
$L1058:
	jmp	$L769
; Line 422
$L769:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_memory_operand ENDP
_TEXT	ENDS
PUBLIC	_indirect_operand
_TEXT	SEGMENT
_op$ = 8
_mode$ = 12
_indirect_operand PROC NEAR
; Line 431
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 433
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	cmp	eax, DWORD PTR _mode$[ebp]
	jne	$L1059
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	mov	eax, DWORD PTR _op$[ebp]
	push	eax
	call	_memory_operand
	add	esp, 8
	or	eax, eax
	je	$L1059
	push	4
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1059
	mov	eax, 1
	jmp	$L1060
$L1059:
	sub	eax, eax
$L1060:
	jmp	$L780
; Line 434
$L780:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_indirect_operand ENDP
_TEXT	ENDS
PUBLIC	_asm_noperands
_TEXT	SEGMENT
_body$ = 8
_i$787 = -8
_n_sets$788 = -4
_elt$797 = -12
_i$803 = -20
_asm_noperands PROC NEAR
; Line 443
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	push	ebx
	push	esi
	push	edi
; Line 444
	mov	eax, DWORD PTR _body$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1441792				; 00160000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L783
; Line 446
	mov	eax, DWORD PTR _body$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	jmp	$L782
; Line 447
$L783:
	mov	eax, DWORD PTR _body$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L784
	mov	eax, DWORD PTR _body$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1441792				; 00160000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L784
; Line 449
	mov	eax, DWORD PTR _body$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	inc	eax
	jmp	$L782
; Line 450
	jmp	$L785
$L784:
; Line 452
	mov	eax, DWORD PTR _body$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1310720				; 00140000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L786
	mov	eax, DWORD PTR _body$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L786
	mov	eax, DWORD PTR _body$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1441792				; 00160000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L786
; Line 460
	mov	eax, DWORD PTR _body$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _i$787[ebp], eax
	jmp	$L789
$L790:
	dec	DWORD PTR _i$787[ebp]
$L789:
	cmp	DWORD PTR _i$787[ebp], 0
	jle	$L791
; Line 462
	mov	eax, DWORD PTR _body$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _i$787[ebp]
	mov	eax, DWORD PTR [eax+ecx*4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L792
; Line 463
	jmp	$L791
; Line 464
$L792:
	mov	eax, DWORD PTR _body$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _i$787[ebp]
	mov	eax, DWORD PTR [eax+ecx*4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1769472				; 001b0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L793
; Line 465
	mov	eax, -1
	jmp	$L782
; Line 466
$L793:
	jmp	$L790
$L791:
; Line 469
	mov	eax, DWORD PTR _i$787[ebp]
	mov	DWORD PTR _n_sets$788[ebp], eax
; Line 474
	mov	DWORD PTR _i$787[ebp], 0
	jmp	$L794
$L795:
	inc	DWORD PTR _i$787[ebp]
$L794:
	mov	eax, DWORD PTR _n_sets$788[ebp]
	cmp	DWORD PTR _i$787[ebp], eax
	jge	$L796
; Line 476
	mov	eax, DWORD PTR _body$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _i$787[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	mov	DWORD PTR _elt$797[ebp], eax
; Line 477
	mov	eax, DWORD PTR _elt$797[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L798
; Line 478
	mov	eax, -1
	jmp	$L782
; Line 479
$L798:
	mov	eax, DWORD PTR _elt$797[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1441792				; 00160000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L799
; Line 480
	mov	eax, -1
	jmp	$L782
; Line 483
$L799:
; Line 484
	mov	eax, DWORD PTR _body$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _elt$797[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	mov	ecx, DWORD PTR [ecx+16]
	cmp	DWORD PTR [eax+16], ecx
	je	$L800
; Line 485
	mov	eax, -1
	jmp	$L782
; Line 486
$L800:
	jmp	$L795
$L796:
; Line 487
	mov	eax, DWORD PTR _body$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	add	eax, DWORD PTR _n_sets$788[ebp]
	jmp	$L782
; Line 489
	jmp	$L801
$L786:
; Line 490
	mov	eax, DWORD PTR _body$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1310720				; 00140000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L802
	mov	eax, DWORD PTR _body$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1441792				; 00160000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L802
; Line 498
	mov	eax, DWORD PTR _body$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	dec	eax
	mov	DWORD PTR _i$803[ebp], eax
	jmp	$L805
$L806:
	dec	DWORD PTR _i$803[ebp]
$L805:
	cmp	DWORD PTR _i$803[ebp], 0
	jle	$L807
; Line 499
	mov	eax, DWORD PTR _body$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _i$803[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1769472				; 001b0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L808
; Line 500
	mov	eax, -1
	jmp	$L782
; Line 502
$L808:
	jmp	$L806
$L807:
	mov	eax, DWORD PTR _body$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	jmp	$L782
; Line 504
	jmp	$L809
$L802:
; Line 505
	mov	eax, -1
	jmp	$L782
$L809:
$L801:
$L785:
; Line 506
$L782:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_asm_noperands ENDP
_TEXT	ENDS
PUBLIC	_decode_asm_operands
_TEXT	SEGMENT
_asmop$834 = -20
_asmop$844 = -32
_nparallel$845 = -24
_nin$846 = -36
_nout$847 = -28
_asmop$865 = -40
_nin$866 = -44
_body$ = 8
_operands$ = 12
_operand_locs$ = 16
_constraints$ = 20
_modes$ = 24
_i$ = -12
_noperands$ = -8
_template$ = -4
_asmop$820 = -16
_decode_asm_operands PROC NEAR
; Line 525
	push	ebp
	mov	ebp, esp
	sub	esp, 44					; 0000002cH
	push	ebx
	push	esi
	push	edi
; Line 528
	mov	DWORD PTR _template$[ebp], 0
; Line 530
	mov	eax, DWORD PTR _body$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L819
	mov	eax, DWORD PTR _body$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1441792				; 00160000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L819
; Line 532
	mov	eax, DWORD PTR _body$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _asmop$820[ebp], eax
; Line 535
	mov	eax, DWORD PTR _asmop$820[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	inc	eax
	mov	DWORD PTR _noperands$[ebp], eax
; Line 539
	mov	DWORD PTR _i$[ebp], 1
	jmp	$L821
$L822:
	inc	DWORD PTR _i$[ebp]
$L821:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _noperands$[ebp], eax
	jle	$L823
; Line 541
	cmp	DWORD PTR _operand_locs$[ebp], 0
	je	$L824
; Line 542
	mov	eax, DWORD PTR _asmop$820[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+ecx*4-4]
	add	eax, 4
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _operand_locs$[ebp]
	mov	DWORD PTR [edx+ecx*4], eax
; Line 543
$L824:
	cmp	DWORD PTR _operands$[ebp], 0
	je	$L825
; Line 544
	mov	eax, DWORD PTR _asmop$820[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR [eax+ecx*4]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _operands$[ebp]
	mov	DWORD PTR [edx+ecx*4], eax
; Line 545
$L825:
	cmp	DWORD PTR _constraints$[ebp], 0
	je	$L826
; Line 546
	mov	eax, DWORD PTR _asmop$820[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR [eax+ecx*4]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _constraints$[ebp]
	mov	DWORD PTR [edx+ecx*4], eax
; Line 547
$L826:
	cmp	DWORD PTR _modes$[ebp], 0
	je	$L827
; Line 548
	mov	eax, DWORD PTR _asmop$820[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR [eax+ecx*4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _modes$[ebp]
	mov	DWORD PTR [edx+ecx*4], eax
; Line 549
$L827:
	jmp	$L822
$L823:
; Line 553
	cmp	DWORD PTR _operands$[ebp], 0
	je	$L828
; Line 554
	mov	eax, DWORD PTR _body$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _operands$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 555
$L828:
	cmp	DWORD PTR _operand_locs$[ebp], 0
	je	$L829
; Line 556
	mov	eax, DWORD PTR _body$[ebp]
	add	eax, 4
	mov	ecx, DWORD PTR _operand_locs$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 557
$L829:
	cmp	DWORD PTR _constraints$[ebp], 0
	je	$L830
; Line 558
	mov	eax, DWORD PTR _asmop$820[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _constraints$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 559
$L830:
	cmp	DWORD PTR _modes$[ebp], 0
	je	$L831
; Line 560
	mov	eax, DWORD PTR _body$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	mov	ecx, DWORD PTR _modes$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 561
$L831:
	mov	eax, DWORD PTR _asmop$820[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _template$[ebp], eax
; Line 563
	jmp	$L832
$L819:
	mov	eax, DWORD PTR _body$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1441792				; 00160000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L833
; Line 565
	mov	eax, DWORD PTR _body$[ebp]
	mov	DWORD PTR _asmop$834[ebp], eax
; Line 568
	mov	eax, DWORD PTR _asmop$834[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _noperands$[ebp], eax
; Line 572
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L835
$L836:
	inc	DWORD PTR _i$[ebp]
$L835:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _noperands$[ebp], eax
	jle	$L837
; Line 574
	cmp	DWORD PTR _operand_locs$[ebp], 0
	je	$L838
; Line 575
	mov	eax, DWORD PTR _asmop$834[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+ecx*4]
	add	eax, 4
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _operand_locs$[ebp]
	mov	DWORD PTR [edx+ecx*4], eax
; Line 576
$L838:
	cmp	DWORD PTR _operands$[ebp], 0
	je	$L839
; Line 577
	mov	eax, DWORD PTR _asmop$834[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _operands$[ebp]
	mov	DWORD PTR [edx+ecx*4], eax
; Line 578
$L839:
	cmp	DWORD PTR _constraints$[ebp], 0
	je	$L840
; Line 579
	mov	eax, DWORD PTR _asmop$834[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _constraints$[ebp]
	mov	DWORD PTR [edx+ecx*4], eax
; Line 580
$L840:
	cmp	DWORD PTR _modes$[ebp], 0
	je	$L841
; Line 581
	mov	eax, DWORD PTR _asmop$834[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _modes$[ebp]
	mov	DWORD PTR [edx+ecx*4], eax
; Line 582
$L841:
	jmp	$L836
$L837:
; Line 583
	mov	eax, DWORD PTR _asmop$834[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _template$[ebp], eax
; Line 585
	jmp	$L842
$L833:
; Line 586
	mov	eax, DWORD PTR _body$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1310720				; 00140000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L843
	mov	eax, DWORD PTR _body$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L843
; Line 588
	mov	eax, DWORD PTR _body$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _asmop$844[ebp], eax
; Line 589
	mov	eax, DWORD PTR _body$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _nparallel$845[ebp], eax
; Line 590
	mov	eax, DWORD PTR _asmop$844[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _nin$846[ebp], eax
; Line 591
	mov	DWORD PTR _nout$847[ebp], 0
; Line 597
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L848
$L849:
	inc	DWORD PTR _i$[ebp]
$L848:
	mov	eax, DWORD PTR _nparallel$845[ebp]
	cmp	DWORD PTR _i$[ebp], eax
	jge	$L850
; Line 599
	mov	eax, DWORD PTR _body$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1769472				; 001b0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L851
; Line 600
	jmp	$L850
; Line 602
$L851:
	cmp	DWORD PTR _operands$[ebp], 0
	je	$L852
; Line 603
	mov	eax, DWORD PTR _body$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _operands$[ebp]
	mov	DWORD PTR [edx+ecx*4], eax
; Line 604
$L852:
	cmp	DWORD PTR _operand_locs$[ebp], 0
	je	$L853
; Line 605
	mov	eax, DWORD PTR _body$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	add	eax, 4
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _operand_locs$[ebp]
	mov	DWORD PTR [edx+ecx*4], eax
; Line 606
$L853:
	cmp	DWORD PTR _constraints$[ebp], 0
	je	$L854
; Line 607
	mov	eax, DWORD PTR _body$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _constraints$[ebp]
	mov	DWORD PTR [edx+ecx*4], eax
; Line 608
$L854:
	cmp	DWORD PTR _modes$[ebp], 0
	je	$L855
; Line 609
	mov	eax, DWORD PTR _body$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _modes$[ebp]
	mov	DWORD PTR [edx+ecx*4], eax
; Line 610
$L855:
	inc	DWORD PTR _nout$847[ebp]
; Line 611
	jmp	$L849
$L850:
; Line 615
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L856
$L857:
	inc	DWORD PTR _i$[ebp]
$L856:
	mov	eax, DWORD PTR _nin$846[ebp]
	cmp	DWORD PTR _i$[ebp], eax
	jge	$L858
; Line 617
	cmp	DWORD PTR _operand_locs$[ebp], 0
	je	$L859
; Line 618
	mov	eax, DWORD PTR _asmop$844[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+ecx*4]
	add	eax, 4
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, DWORD PTR _nout$847[ebp]
	mov	edx, DWORD PTR _operand_locs$[ebp]
	mov	DWORD PTR [edx+ecx*4], eax
; Line 619
$L859:
	cmp	DWORD PTR _operands$[ebp], 0
	je	$L860
; Line 620
	mov	eax, DWORD PTR _asmop$844[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, DWORD PTR _nout$847[ebp]
	mov	edx, DWORD PTR _operands$[ebp]
	mov	DWORD PTR [edx+ecx*4], eax
; Line 621
$L860:
	cmp	DWORD PTR _constraints$[ebp], 0
	je	$L861
; Line 622
	mov	eax, DWORD PTR _asmop$844[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, DWORD PTR _nout$847[ebp]
	mov	edx, DWORD PTR _constraints$[ebp]
	mov	DWORD PTR [edx+ecx*4], eax
; Line 623
$L861:
	cmp	DWORD PTR _modes$[ebp], 0
	je	$L862
; Line 624
	mov	eax, DWORD PTR _asmop$844[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, DWORD PTR _nout$847[ebp]
	mov	edx, DWORD PTR _modes$[ebp]
	mov	DWORD PTR [edx+ecx*4], eax
; Line 625
$L862:
	jmp	$L857
$L858:
; Line 627
	mov	eax, DWORD PTR _asmop$844[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _template$[ebp], eax
; Line 629
	jmp	$L863
$L843:
; Line 630
	mov	eax, DWORD PTR _body$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1310720				; 00140000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L864
	mov	eax, DWORD PTR _body$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1441792				; 00160000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L864
; Line 634
	mov	eax, DWORD PTR _body$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _asmop$865[ebp], eax
; Line 635
	mov	eax, DWORD PTR _asmop$865[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _nin$866[ebp], eax
; Line 639
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L867
$L868:
	inc	DWORD PTR _i$[ebp]
$L867:
	mov	eax, DWORD PTR _nin$866[ebp]
	cmp	DWORD PTR _i$[ebp], eax
	jge	$L869
; Line 641
	cmp	DWORD PTR _operand_locs$[ebp], 0
	je	$L870
; Line 642
	mov	eax, DWORD PTR _asmop$865[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+ecx*4]
	add	eax, 4
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _operand_locs$[ebp]
	mov	DWORD PTR [edx+ecx*4], eax
; Line 643
$L870:
	cmp	DWORD PTR _operands$[ebp], 0
	je	$L871
; Line 644
	mov	eax, DWORD PTR _asmop$865[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _operands$[ebp]
	mov	DWORD PTR [edx+ecx*4], eax
; Line 645
$L871:
	cmp	DWORD PTR _constraints$[ebp], 0
	je	$L872
; Line 646
	mov	eax, DWORD PTR _asmop$865[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _constraints$[ebp]
	mov	DWORD PTR [edx+ecx*4], eax
; Line 647
$L872:
	cmp	DWORD PTR _modes$[ebp], 0
	je	$L873
; Line 648
	mov	eax, DWORD PTR _asmop$865[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _modes$[ebp]
	mov	DWORD PTR [edx+ecx*4], eax
; Line 649
$L873:
	jmp	$L868
$L869:
; Line 651
	mov	eax, DWORD PTR _asmop$865[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _template$[ebp], eax
; Line 654
$L864:
$L863:
$L842:
$L832:
	mov	eax, DWORD PTR _template$[ebp]
	jmp	$L815
; Line 655
$L815:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_decode_asm_operands ENDP
_p$ = 8
_tem$ = -4
_code$ = -8
_find_constant_term_loc PROC NEAR
; Line 667
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 669
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$[ebp], eax
; Line 674
	cmp	DWORD PTR _code$[ebp], 30		; 0000001eH
	je	$L880
	cmp	DWORD PTR _code$[ebp], 39		; 00000027H
	je	$L880
	cmp	DWORD PTR _code$[ebp], 38		; 00000026H
	je	$L880
	cmp	DWORD PTR _code$[ebp], 32		; 00000020H
	jne	$L879
$L880:
; Line 675
	mov	eax, DWORD PTR _p$[ebp]
	jmp	$L876
; Line 679
$L879:
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L881
; Line 680
	sub	eax, eax
	jmp	$L876
; Line 684
$L881:
; Line 685
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	cmp	DWORD PTR [eax+4], 0
	je	$L882
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L883
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L883
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L883
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L882
$L883:
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	cmp	DWORD PTR [eax+8], 0
	je	$L882
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L884
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L884
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L884
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L882
$L884:
; Line 686
	mov	eax, DWORD PTR _p$[ebp]
	jmp	$L876
; Line 690
$L882:
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	cmp	DWORD PTR [eax+4], 0
	je	$L885
; Line 692
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	add	eax, 4
	push	eax
	call	_find_constant_term_loc
	add	esp, 4
	mov	DWORD PTR _tem$[ebp], eax
; Line 693
	cmp	DWORD PTR _tem$[ebp], 0
	je	$L886
; Line 694
	mov	eax, DWORD PTR _tem$[ebp]
	jmp	$L876
; Line 695
$L886:
; Line 697
$L885:
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	cmp	DWORD PTR [eax+8], 0
	je	$L887
; Line 699
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	add	eax, 8
	push	eax
	call	_find_constant_term_loc
	add	esp, 4
	mov	DWORD PTR _tem$[ebp], eax
; Line 700
	cmp	DWORD PTR _tem$[ebp], 0
	je	$L888
; Line 701
	mov	eax, DWORD PTR _tem$[ebp]
	jmp	$L876
; Line 702
$L888:
; Line 704
$L887:
	sub	eax, eax
	jmp	$L876
; Line 705
$L876:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_find_constant_term_loc ENDP
_TEXT	ENDS
PUBLIC	_offsettable_memref_p
PUBLIC	_offsettable_address_p
_TEXT	SEGMENT
_op$ = 8
_offsettable_memref_p PROC NEAR
; Line 721
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 723
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1061
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	1
	call	_offsettable_address_p
	add	esp, 12					; 0000000cH
	or	eax, eax
	je	$L1061
	mov	eax, 1
	jmp	$L1062
$L1061:
	sub	eax, eax
$L1062:
	jmp	$L891
; Line 724
$L891:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_offsettable_memref_p ENDP
_TEXT	ENDS
EXTRN	_mode_size:BYTE
EXTRN	_plus_constant:NEAR
EXTRN	_strict_memory_address_p:NEAR
_TEXT	SEGMENT
_ycode$ = -4
_z$ = -20
_y1$ = -12
_y2$ = -16
_addressp$ = -8
_old$905 = -28
_good$906 = -24
_strictp$ = 8
_mode$ = 12
_y$ = 16
_offsettable_address_p PROC NEAR
; Line 741
	push	ebp
	mov	ebp, esp
	sub	esp, 28					; 0000001cH
	push	ebx
	push	esi
	push	edi
; Line 742
	mov	eax, DWORD PTR _y$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _ycode$[ebp], eax
; Line 744
	mov	eax, DWORD PTR _y$[ebp]
	mov	DWORD PTR _y1$[ebp], eax
; Line 746
	mov	eax, OFFSET _strict_memory_address_p
	cmp	DWORD PTR _strictp$[ebp], 0
	jne	$L1063
	mov	eax, OFFSET _memory_address_p
$L1063:
	mov	DWORD PTR _addressp$[ebp], eax
; Line 748
	mov	eax, DWORD PTR _y$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L903
	mov	eax, DWORD PTR _y$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L903
	mov	eax, DWORD PTR _y$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L903
	mov	eax, DWORD PTR _y$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L902
$L903:
; Line 749
	mov	eax, 1
	jmp	$L896
; Line 757
$L902:
	cmp	DWORD PTR _ycode$[ebp], 44		; 0000002cH
	jne	$L904
	lea	eax, DWORD PTR _y1$[ebp]
	push	eax
	call	_find_constant_term_loc
	add	esp, 4
	mov	DWORD PTR _y2$[ebp], eax
	cmp	DWORD PTR _y2$[ebp], 0
	je	$L904
; Line 759
	mov	eax, DWORD PTR _y2$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _y1$[ebp], eax
	mov	eax, DWORD PTR _y1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _old$905[ebp], eax
; Line 761
	mov	eax, DWORD PTR _mode$[ebp]
	mov	eax, DWORD PTR _mode_size[eax*4]
	dec	eax
	mov	ecx, DWORD PTR _y1$[ebp]
	add	DWORD PTR [ecx+4], eax
; Line 762
	mov	eax, DWORD PTR _y$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	DWORD PTR _addressp$[ebp]
	add	esp, 8
	mov	DWORD PTR _good$906[ebp], eax
; Line 764
	mov	eax, DWORD PTR _old$905[ebp]
	mov	ecx, DWORD PTR _y1$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 765
	mov	eax, DWORD PTR _good$906[ebp]
	jmp	$L896
; Line 768
$L904:
; Line 769
	cmp	DWORD PTR _ycode$[ebp], 63		; 0000003fH
	je	$L908
	cmp	DWORD PTR _ycode$[ebp], 64		; 00000040H
	je	$L908
	cmp	DWORD PTR _ycode$[ebp], 65		; 00000041H
	je	$L908
	cmp	DWORD PTR _ycode$[ebp], 66		; 00000042H
	jne	$L907
$L908:
; Line 770
	sub	eax, eax
	jmp	$L896
; Line 777
$L907:
	mov	eax, DWORD PTR _mode$[ebp]
	mov	eax, DWORD PTR _mode_size[eax*4]
	dec	eax
	push	eax
	mov	eax, DWORD PTR _y$[ebp]
	push	eax
	call	_plus_constant
	add	esp, 8
	mov	DWORD PTR _z$[ebp], eax
; Line 779
	mov	eax, DWORD PTR _z$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	DWORD PTR _addressp$[ebp]
	add	esp, 8
	jmp	$L896
; Line 781
$L896:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_offsettable_address_p ENDP
_addr$ = 8
_mode_dependent_address_p PROC NEAR
; Line 792
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 793
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 4325376				; 00420000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L912
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 4259840				; 00410000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L911
$L912:
	jmp	$win$913
; Line 794
$L911:
	sub	eax, eax
	jmp	$L910
; Line 795
$win$913:
; Line 796
	mov	eax, 1
	jmp	$L910
; Line 797
$L910:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_mode_dependent_address_p ENDP
_TEXT	ENDS
PUBLIC	_mode_independent_operand
_TEXT	SEGMENT
_op$ = 8
_mode$ = 12
_addr$ = -4
_mode_independent_operand PROC NEAR
; Line 806
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 809
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	mov	eax, DWORD PTR _op$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	jne	$L919
; Line 810
	sub	eax, eax
	jmp	$L917
; Line 812
$L919:
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L920
; Line 813
	mov	eax, 1
	jmp	$L917
; Line 815
$L920:
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _addr$[ebp], eax
; Line 816
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 4325376				; 00420000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L922
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 4259840				; 00410000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L921
$L922:
	jmp	$lose$923
; Line 817
$L921:
	mov	eax, 1
	jmp	$L917
; Line 818
$lose$923:
; Line 819
	sub	eax, eax
	jmp	$L917
; Line 820
$L917:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_mode_independent_operand ENDP
_TEXT	ENDS
PUBLIC	_adj_offsettable_operand
EXTRN	_copy_rtx:NEAR
EXTRN	_abort:NEAR
_TEXT	SEGMENT
_op$ = 8
_offset$ = 12
_code$ = -4
_y$929 = -8
_z$933 = -16
_const_loc$934 = -12
_adj_offsettable_operand PROC NEAR
; Line 832
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 833
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$[ebp], eax
; Line 835
	cmp	DWORD PTR _code$[ebp], 37		; 00000025H
	jne	$L928
; Line 837
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _y$929[ebp], eax
; Line 839
	mov	eax, DWORD PTR _y$929[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L931
	mov	eax, DWORD PTR _y$929[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L931
	mov	eax, DWORD PTR _y$929[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L931
	mov	eax, DWORD PTR _y$929[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L930
$L931:
; Line 840
	mov	eax, DWORD PTR _offset$[ebp]
	push	eax
	mov	eax, DWORD PTR _y$929[ebp]
	push	eax
	call	_plus_constant
	add	esp, 8
	push	eax
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	37					; 00000025H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	jmp	$L926
; Line 842
$L930:
	mov	eax, DWORD PTR _y$929[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L932
; Line 844
	mov	eax, DWORD PTR _y$929[ebp]
	mov	DWORD PTR _z$933[ebp], eax
; Line 847
	mov	eax, DWORD PTR _op$[ebp]
	push	eax
	call	_copy_rtx
	add	esp, 4
	mov	DWORD PTR _op$[ebp], eax
; Line 848
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _z$933[ebp], eax
; Line 849
	lea	eax, DWORD PTR _z$933[ebp]
	push	eax
	call	_find_constant_term_loc
	add	esp, 4
	mov	DWORD PTR _const_loc$934[ebp], eax
; Line 850
	cmp	DWORD PTR _const_loc$934[ebp], 0
	je	$L935
; Line 852
	mov	eax, DWORD PTR _offset$[ebp]
	push	eax
	mov	eax, DWORD PTR _const_loc$934[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_plus_constant
	add	esp, 8
	mov	ecx, DWORD PTR _const_loc$934[ebp]
	mov	DWORD PTR [ecx], eax
; Line 853
	mov	eax, DWORD PTR _op$[ebp]
	jmp	$L926
; Line 855
$L935:
; Line 857
$L932:
	mov	eax, DWORD PTR _offset$[ebp]
	push	eax
	mov	eax, DWORD PTR _y$929[ebp]
	push	eax
	call	_plus_constant
	add	esp, 8
	push	eax
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	37					; 00000025H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	jmp	$L926
; Line 859
$L928:
	call	_abort
; Line 860
$L926:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_adj_offsettable_operand ENDP
_TEXT	ENDS
PUBLIC	_reg_fits_class_p
PUBLIC	_constrain_operands
EXTRN	_recog_operand:BYTE
EXTRN	_insn_n_operands:BYTE
EXTRN	_operands_match_p:NEAR
EXTRN	_insn_n_alternatives:BYTE
EXTRN	_insn_operand_constraint:BYTE
EXTRN	_standard_80387_constant_p:NEAR
EXTRN	_target_flags:DWORD
_TEXT	SEGMENT
_op$960 = -112
_p$961 = -124
_win$962 = -120
_val$963 = -116
_insn_code_num$ = 8
_constraints$ = -36
_c$ = -100
_noperands$ = -4
_funny_match$ = -96
_funny_match_index$ = -8
_nalternatives$ = -40
_opno$955 = -108
_lose$956 = -104
_constrain_operands PROC NEAR
; Line 888
	push	ebp
	mov	ebp, esp
	sub	esp, 140				; 0000008cH
	push	ebx
	push	esi
	push	edi
; Line 891
	mov	eax, DWORD PTR _insn_code_num$[ebp]
	mov	eax, DWORD PTR _insn_n_operands[eax*4]
	mov	DWORD PTR _noperands$[ebp], eax
; Line 895
	mov	eax, DWORD PTR _insn_code_num$[ebp]
	mov	eax, DWORD PTR _insn_n_alternatives[eax*4]
	mov	DWORD PTR _nalternatives$[ebp], eax
; Line 897
	cmp	DWORD PTR _noperands$[ebp], 0
	je	$L948
	cmp	DWORD PTR _nalternatives$[ebp], 0
	jne	$L947
$L948:
; Line 898
	mov	eax, 1
	jmp	$L940
; Line 900
$L947:
	mov	DWORD PTR _c$[ebp], 0
	jmp	$L949
$L950:
	inc	DWORD PTR _c$[ebp]
$L949:
	mov	eax, DWORD PTR _c$[ebp]
	cmp	DWORD PTR _noperands$[ebp], eax
	jle	$L951
; Line 901
	mov	eax, DWORD PTR _c$[ebp]
	mov	ecx, DWORD PTR _insn_code_num$[ebp]
	mov	edx, ecx
	shl	ecx, 3
	sub	ecx, edx
	shl	ecx, 2
	mov	eax, DWORD PTR _insn_operand_constraint[ecx+eax*4]
	mov	ecx, DWORD PTR _c$[ebp]
	mov	DWORD PTR _constraints$[ebp+ecx*4], eax
	jmp	$L950
$L951:
; Line 903
	mov	DWORD PTR _which_alternative, 0
; Line 905
$L953:
	mov	eax, DWORD PTR _which_alternative
	cmp	DWORD PTR _nalternatives$[ebp], eax
	jle	$L954
; Line 908
	mov	DWORD PTR _lose$956[ebp], 0
; Line 909
	mov	DWORD PTR _funny_match_index$[ebp], 0
; Line 911
	mov	DWORD PTR _opno$955[ebp], 0
	jmp	$L957
$L958:
	inc	DWORD PTR _opno$955[ebp]
$L957:
	mov	eax, DWORD PTR _noperands$[ebp]
	cmp	DWORD PTR _opno$955[ebp], eax
	jge	$L959
; Line 913
	mov	eax, DWORD PTR _opno$955[ebp]
	mov	eax, DWORD PTR _recog_operand[eax*4]
	mov	DWORD PTR _op$960[ebp], eax
; Line 914
	mov	eax, DWORD PTR _opno$955[ebp]
	mov	eax, DWORD PTR _constraints$[ebp+eax*4]
	mov	DWORD PTR _p$961[ebp], eax
; Line 915
	mov	DWORD PTR _win$962[ebp], 0
; Line 920
$L965:
	mov	eax, DWORD PTR _op$960[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L966
; Line 921
	call	_abort
	jmp	$L965
$L966:
; Line 925
	mov	eax, DWORD PTR _p$961[ebp]
	movsx	eax, BYTE PTR [eax]
	or	eax, eax
	je	$L968
	mov	eax, DWORD PTR _p$961[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 44					; 0000002cH
	jne	$L967
$L968:
; Line 926
	mov	DWORD PTR _win$962[ebp], 1
; Line 928
$L967:
$L970:
	mov	eax, DWORD PTR _p$961[ebp]
	movsx	eax, BYTE PTR [eax]
	or	eax, eax
	je	$L971
	mov	eax, DWORD PTR _p$961[ebp]
	movsx	eax, BYTE PTR [eax]
	mov	DWORD PTR _c$[ebp], eax
	inc	DWORD PTR _p$961[ebp]
	cmp	DWORD PTR _c$[ebp], 44			; 0000002cH
	je	$L971
; Line 929
	mov	eax, DWORD PTR _c$[ebp]
	mov	DWORD PTR -140+[ebp], eax
	jmp	$L972
; Line 931
$L976:
; Line 939
	jmp	$L973
; Line 941
$L977:
; Line 951
	mov	eax, DWORD PTR _opno$955[ebp]
	mov	eax, DWORD PTR _recog_operand[eax*4]
	push	eax
	mov	eax, DWORD PTR _c$[ebp]
	mov	eax, DWORD PTR _recog_operand[eax*4-192]
	push	eax
	call	_operands_match_p
	add	esp, 8
	mov	DWORD PTR _val$963[ebp], eax
; Line 952
	cmp	DWORD PTR _val$963[ebp], 0
	je	$L979
; Line 953
	mov	DWORD PTR _win$962[ebp], 1
; Line 957
$L979:
	cmp	DWORD PTR _val$963[ebp], 2
	jne	$L980
; Line 959
	mov	eax, DWORD PTR _opno$955[ebp]
	mov	ecx, DWORD PTR _funny_match_index$[ebp]
	mov	DWORD PTR _funny_match$[ebp+ecx*8], eax
; Line 960
	mov	eax, DWORD PTR _c$[ebp]
	sub	eax, 48					; 00000030H
	mov	ecx, DWORD PTR _funny_match_index$[ebp]
	mov	DWORD PTR _funny_match$[ebp+ecx*8+4], eax
	inc	DWORD PTR _funny_match_index$[ebp]
; Line 962
$L980:
	jmp	$L973
; Line 964
$L981:
; Line 967
	mov	DWORD PTR _win$962[ebp], 1
; Line 968
	jmp	$L973
; Line 972
$L982:
; Line 977
	mov	eax, DWORD PTR _op$960[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L985
	mov	eax, DWORD PTR _op$960[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	0
	push	10					; 0000000aH
	mov	eax, DWORD PTR _op$960[ebp]
	push	eax
	call	_reg_fits_class_p
	add	esp, 16					; 00000010H
	or	eax, eax
	je	$L984
$L985:
; Line 978
	mov	DWORD PTR _win$962[ebp], 1
; Line 979
$L984:
	jmp	$L973
; Line 981
$L986:
; Line 984
	mov	eax, DWORD PTR _op$960[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L987
	mov	eax, DWORD PTR _op$960[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	0
	push	10					; 0000000aH
	mov	eax, DWORD PTR _op$960[ebp]
	push	eax
	call	_reg_fits_class_p
	add	esp, 16					; 00000010H
	or	eax, eax
	je	$L987
$L988:
; Line 985
	mov	DWORD PTR _win$962[ebp], 1
; Line 986
$L987:
	jmp	$L973
; Line 988
$L989:
; Line 989
	mov	eax, DWORD PTR _op$960[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L990
; Line 990
	mov	DWORD PTR _win$962[ebp], 1
; Line 991
$L990:
	jmp	$L973
; Line 993
$L991:
; Line 996
	mov	eax, DWORD PTR _op$960[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L992
	mov	eax, DWORD PTR _op$960[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 4128768				; 003f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L993
	mov	eax, DWORD PTR _op$960[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 4259840				; 00410000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L992
$L993:
; Line 997
	mov	DWORD PTR _win$962[ebp], 1
; Line 998
$L992:
	jmp	$L973
; Line 1000
$L994:
; Line 1003
	mov	eax, DWORD PTR _op$960[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L995
	mov	eax, DWORD PTR _op$960[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 4194304				; 00400000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L996
	mov	eax, DWORD PTR _op$960[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 4325376				; 00420000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L995
$L996:
; Line 1004
	mov	DWORD PTR _win$962[ebp], 1
; Line 1005
$L995:
	jmp	$L973
; Line 1007
$L997:
; Line 1008
	mov	eax, DWORD PTR _op$960[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2031616				; 001f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L998
; Line 1009
	mov	DWORD PTR _win$962[ebp], 1
; Line 1010
$L998:
	jmp	$L973
; Line 1012
$L999:
; Line 1015
	mov	eax, DWORD PTR _op$960[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2031616				; 001f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1001
	cmp	DWORD PTR _c$[ebp], 71			; 00000047H
	jne	$L1064
	test	BYTE PTR _target_flags, 1
	je	$L1068
	mov	eax, DWORD PTR _op$960[ebp]
	push	eax
	call	_standard_80387_constant_p
	add	esp, 4
	or	eax, eax
	jne	$L1066
$L1068:
	mov	DWORD PTR -128+[ebp], 1
	jmp	$L1067
$L1066:
	mov	DWORD PTR -128+[ebp], 0
$L1067:
	jmp	$L1065
$L1064:
	mov	DWORD PTR -128+[ebp], 1
$L1065:
	cmp	DWORD PTR -128+[ebp], 0
	je	$L1001
; Line 1016
	mov	DWORD PTR _win$962[ebp], 1
; Line 1017
$L1001:
	jmp	$L973
; Line 1019
$L1002:
; Line 1020
	mov	eax, DWORD PTR _op$960[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1003
; Line 1021
	jmp	$L973
; Line 1022
$L1003:
$L1004:
; Line 1023
	mov	eax, DWORD PTR _op$960[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1006
	mov	eax, DWORD PTR _op$960[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1006
	mov	eax, DWORD PTR _op$960[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1006
	mov	eax, DWORD PTR _op$960[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1005
$L1006:
; Line 1024
	mov	DWORD PTR _win$962[ebp], 1
; Line 1025
$L1005:
	jmp	$L973
; Line 1027
$L1007:
; Line 1028
	mov	eax, DWORD PTR _op$960[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1008
; Line 1029
	mov	DWORD PTR _win$962[ebp], 1
; Line 1030
$L1008:
	jmp	$L973
; Line 1032
$L1009:
; Line 1038
	mov	eax, DWORD PTR _op$960[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1010
	cmp	DWORD PTR _c$[ebp], 73			; 00000049H
	jne	$L1069
	mov	eax, DWORD PTR _op$960[ebp]
	cmp	DWORD PTR [eax+4], 0
	jl	$L1071
	mov	eax, DWORD PTR _op$960[ebp]
	cmp	DWORD PTR [eax+4], 31			; 0000001fH
	jg	$L1071
	mov	DWORD PTR -132+[ebp], 1
	jmp	$L1072
$L1071:
	mov	DWORD PTR -132+[ebp], 0
$L1072:
	jmp	$L1070
$L1069:
	mov	DWORD PTR -132+[ebp], 0
$L1070:
	cmp	DWORD PTR -132+[ebp], 0
	je	$L1010
; Line 1039
	mov	DWORD PTR _win$962[ebp], 1
; Line 1040
$L1010:
	jmp	$L973
; Line 1042
$L1011:
; Line 1043
	mov	eax, DWORD PTR _op$960[ebp]
	push	eax
	call	_offsettable_memref_p
	add	esp, 4
	or	eax, eax
	je	$L1012
; Line 1044
	mov	DWORD PTR _win$962[ebp], 1
; Line 1045
$L1012:
	jmp	$L973
; Line 1047
$L1013:
; Line 1050
	mov	eax, DWORD PTR _op$960[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1014
	cmp	DWORD PTR _c$[ebp], 114			; 00000072H
	jne	$L1073
	mov	DWORD PTR -136+[ebp], 10		; 0000000aH
	jmp	$L1074
$L1073:
	cmp	DWORD PTR _c$[ebp], 113			; 00000071H
	jne	$L1075
	mov	DWORD PTR -136+[ebp], 6
	jmp	$L1076
$L1075:
	cmp	DWORD PTR _c$[ebp], 102			; 00000066H
	jne	$L1077
	mov	DWORD PTR -136+[ebp], 11		; 0000000bH
	jmp	$L1078
$L1077:
	cmp	DWORD PTR _c$[ebp], 97			; 00000061H
	jne	$L1079
	mov	DWORD PTR -136+[ebp], 1
	jmp	$L1080
$L1079:
	cmp	DWORD PTR _c$[ebp], 98			; 00000062H
	jne	$L1081
	mov	DWORD PTR -136+[ebp], 5
	jmp	$L1082
$L1081:
	cmp	DWORD PTR _c$[ebp], 99			; 00000063H
	jne	$L1083
	mov	DWORD PTR -136+[ebp], 4
	jmp	$L1084
$L1083:
	cmp	DWORD PTR _c$[ebp], 100			; 00000064H
	jne	$L1085
	mov	DWORD PTR -136+[ebp], 2
	jmp	$L1086
$L1085:
	cmp	DWORD PTR _c$[ebp], 65			; 00000041H
	jne	$L1087
	mov	DWORD PTR -136+[ebp], 3
	jmp	$L1088
$L1087:
	cmp	DWORD PTR _c$[ebp], 83			; 00000053H
	jne	$L1089
	mov	DWORD PTR -136+[ebp], 7
	jmp	$L1090
$L1089:
	mov	eax, DWORD PTR _c$[ebp]
	sub	eax, 68					; 00000044H
	cmp	eax, 1
	sbb	eax, eax
	and	eax, 8
	mov	DWORD PTR -136+[ebp], eax
$L1090:
$L1088:
$L1086:
$L1084:
$L1082:
$L1080:
$L1078:
$L1076:
$L1074:
	mov	eax, DWORD PTR _op$960[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	0
	mov	eax, DWORD PTR -136+[ebp]
	push	eax
	mov	eax, DWORD PTR _op$960[ebp]
	push	eax
	call	_reg_fits_class_p
	add	esp, 16					; 00000010H
	or	eax, eax
	je	$L1014
; Line 1051
	mov	DWORD PTR _win$962[ebp], 1
; Line 1052
$L1014:
	jmp	$L973
$L972:
	sub	DWORD PTR -140+[ebp], 33		; 00000021H
	cmp	DWORD PTR -140+[ebp], 82		; 00000052H
	ja	$L1013
	shl	DWORD PTR -140+[ebp], 2
	mov	eax, DWORD PTR -140+[ebp]
	jmp	DWORD PTR $L1091[eax]
$L1091:
	DD	OFFSET $L976
	DD	OFFSET $L1013
	DD	OFFSET $L976
	DD	OFFSET $L1013
	DD	OFFSET $L976
	DD	OFFSET $L976
	DD	OFFSET $L1013
	DD	OFFSET $L1013
	DD	OFFSET $L1013
	DD	OFFSET $L976
	DD	OFFSET $L976
	DD	OFFSET $L1013
	DD	OFFSET $L1013
	DD	OFFSET $L1013
	DD	OFFSET $L1013
	DD	OFFSET $L977
	DD	OFFSET $L977
	DD	OFFSET $L977
	DD	OFFSET $L977
	DD	OFFSET $L977
	DD	OFFSET $L1013
	DD	OFFSET $L1013
	DD	OFFSET $L1013
	DD	OFFSET $L1013
	DD	OFFSET $L1013
	DD	OFFSET $L1013
	DD	OFFSET $L1013
	DD	OFFSET $L991
	DD	OFFSET $L976
	DD	OFFSET $L994
	DD	OFFSET $L976
	DD	OFFSET $L1013
	DD	OFFSET $L1013
	DD	OFFSET $L1013
	DD	OFFSET $L1013
	DD	OFFSET $L1013
	DD	OFFSET $L1013
	DD	OFFSET $L997
	DD	OFFSET $L999
	DD	OFFSET $L999
	DD	OFFSET $L1009
	DD	OFFSET $L1009
	DD	OFFSET $L1009
	DD	OFFSET $L1009
	DD	OFFSET $L1009
	DD	OFFSET $L1013
	DD	OFFSET $L1013
	DD	OFFSET $L1013
	DD	OFFSET $L1013
	DD	OFFSET $L1013
	DD	OFFSET $L1013
	DD	OFFSET $L1013
	DD	OFFSET $L1013
	DD	OFFSET $L1013
	DD	OFFSET $L1013
	DD	OFFSET $L1013
	DD	OFFSET $L1013
	DD	OFFSET $L1013
	DD	OFFSET $L1013
	DD	OFFSET $L1013
	DD	OFFSET $L1013
	DD	OFFSET $L1013
	DD	OFFSET $L1013
	DD	OFFSET $L1013
	DD	OFFSET $L1013
	DD	OFFSET $L1013
	DD	OFFSET $L1013
	DD	OFFSET $L1013
	DD	OFFSET $L1013
	DD	OFFSET $L1013
	DD	OFFSET $L982
	DD	OFFSET $L1013
	DD	OFFSET $L1004
	DD	OFFSET $L1013
	DD	OFFSET $L1013
	DD	OFFSET $L1013
	DD	OFFSET $L989
	DD	OFFSET $L1007
	DD	OFFSET $L1011
	DD	OFFSET $L981
	DD	OFFSET $L1013
	DD	OFFSET $L986
	DD	OFFSET $L1002
$L973:
	jmp	$L970
$L971:
; Line 1054
	mov	eax, DWORD PTR _p$961[ebp]
	mov	ecx, DWORD PTR _opno$955[ebp]
	mov	DWORD PTR _constraints$[ebp+ecx*4], eax
; Line 1057
	cmp	DWORD PTR _win$962[ebp], 0
	jne	$L1015
; Line 1058
	mov	DWORD PTR _lose$956[ebp], 1
; Line 1059
$L1015:
	jmp	$L958
$L959:
; Line 1062
	cmp	DWORD PTR _lose$956[ebp], 0
	jne	$L1016
; Line 1064
$L1018:
	dec	DWORD PTR _funny_match_index$[ebp]
	js	$L1019
; Line 1067
	mov	eax, DWORD PTR _funny_match_index$[ebp]
	mov	eax, DWORD PTR _funny_match$[ebp+eax*8]
	mov	eax, DWORD PTR _recog_operand[eax*4]
	mov	ecx, DWORD PTR _funny_match_index$[ebp]
	mov	ecx, DWORD PTR _funny_match$[ebp+ecx*8+4]
	mov	DWORD PTR _recog_operand[ecx*4], eax
; Line 1068
	jmp	$L1018
$L1019:
; Line 1069
	mov	eax, 1
	jmp	$L940
; Line 1072
$L1016:
	inc	DWORD PTR _which_alternative
; Line 1073
	jmp	$L953
$L954:
; Line 1074
	sub	eax, eax
	jmp	$L940
; Line 1075
$L940:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_constrain_operands ENDP
_TEXT	ENDS
EXTRN	_reg_class_contents:BYTE
_TEXT	SEGMENT
_regno$ = -4
_sr$1027 = -8
_operand$ = 8
_class$ = 12
_offset$ = 16
_mode$ = 20
_reg_fits_class_p PROC NEAR
; Line 1088
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 1089
	mov	eax, DWORD PTR _operand$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _regno$[ebp], eax
; Line 1091
	cmp	DWORD PTR _regno$[ebp], 10		; 0000000aH
	jge	$L1026
	mov	eax, DWORD PTR _class$[ebp]
	movsx	eax, WORD PTR _reg_class_contents[eax*2]
	mov	edx, 1
	mov	ecx, DWORD PTR _offset$[ebp]
	add	ecx, DWORD PTR _regno$[ebp]
	shl	edx, cl
	test	eax, edx
	je	$L1026
; Line 1095
	mov	eax, DWORD PTR _offset$[ebp]
	add	DWORD PTR _regno$[ebp], eax
; Line 1097
	cmp	DWORD PTR _regno$[ebp], 8
	jl	$L1092
	mov	DWORD PTR -12+[ebp], 1
	jmp	$L1093
$L1092:
	mov	eax, DWORD PTR _mode$[ebp]
	mov	eax, DWORD PTR _mode_size[eax*4]
	add	eax, 3
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	mov	DWORD PTR -12+[ebp], eax
$L1093:
	mov	eax, DWORD PTR -12+[ebp]
	dec	eax
	mov	DWORD PTR _sr$1027[ebp], eax
	jmp	$L1028
$L1029:
	dec	DWORD PTR _sr$1027[ebp]
$L1028:
	cmp	DWORD PTR _sr$1027[ebp], 0
	jle	$L1030
; Line 1098
	mov	eax, DWORD PTR _class$[ebp]
	movsx	eax, WORD PTR _reg_class_contents[eax*2]
	mov	edx, 1
	mov	ecx, DWORD PTR _sr$1027[ebp]
	add	ecx, DWORD PTR _regno$[ebp]
	shl	edx, cl
	test	eax, edx
	jne	$L1031
; Line 1100
	jmp	$L1030
; Line 1101
$L1031:
	jmp	$L1029
$L1030:
	cmp	DWORD PTR _sr$1027[ebp], 1
	sbb	eax, eax
	neg	eax
	jmp	$L1024
; Line 1103
$L1026:
	sub	eax, eax
	jmp	$L1024
; Line 1104
$L1024:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_reg_fits_class_p ENDP
_TEXT	ENDS
END
