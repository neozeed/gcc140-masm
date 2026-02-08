	TITLE	expr.c
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
PUBLIC	_generic_floating_point_number
_DATA	SEGMENT
COMM	_generic_bignum:WORD:01aH
COMM	_generic_floating_point_magic:DWORD
_generic_floating_point_number DD _generic_bignum+12
	DD	_generic_bignum+50
	DD	00H
	DD	00H
	DB	00H
	ORG $+3
	ORG $+4
_op_encoding$S523 DD 00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	07H
	DD	00H
	DD	00H
	DD	00H
	DD	03H
	DD	09H
	DD	00H
	DD	00H
	DD	00H
	DD	01H
	DD	0aH
	DD	00H
	DD	0bH
	DD	00H
	DD	02H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	04H
	DD	00H
	DD	05H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	08H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	06H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
_op_rank$S525 DB 00H
	DB	03H
	DB	03H
	DB	03H
	DB	03H
	DB	03H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	01H
	DB	01H
_DATA	ENDS
PUBLIC	_expr
PUBLIC	_get_symbol_end
EXTRN	_atof_generic:NEAR
EXTRN	_input_line_pointer:DWORD
EXTRN	_lex_type:BYTE
EXTRN	_strchr:NEAR
EXTRN	___mb_cur_max:DWORD
EXTRN	_now_seg:DWORD
EXTRN	_seg_N_TYPE:BYTE
EXTRN	_N_TYPE_seg:BYTE
EXTRN	_as_warn:NEAR
EXTRN	_symbol_find:NEAR
EXTRN	__pctype:DWORD
EXTRN	_local_label_name:NEAR
EXTRN	__isctype:NEAR
EXTRN	_symbol_new:NEAR
EXTRN	_frag_now:DWORD
EXTRN	_zero_address_frag:BYTE
EXTRN	_symbol_table_insert:NEAR
EXTRN	_EXP_CHARS:BYTE
EXTRN	_FLT_CHARS:BYTE
EXTRN	_tolower:NEAR
EXTRN	_frags:BYTE
EXTRN	_hex_value:BYTE
_DATA	SEGMENT
$SG397	DB	'+-.0123456789', 00H
	ORG $+2
$SG427	DB	'Backw. ref to unknown label "%d:", 0 assumed.', 00H
	ORG $+2
$SG437	DB	'.', 00H
	ORG $+2
$SG440	DB	'Bad floating-point constant: exponent overflow, probably'
	DB	' assembling junk', 00H
	ORG $+3
$SG442	DB	'Bad floating-point constant: unknown error code=%d.', 00H
$SG446	DB	'L0', 01H, 00H
$SG457	DB	'Missing '')'' assumed', 00H
$SG471	DB	'Unary operator %c ignored because bad operand follows', 00H
_DATA	ENDS
_TEXT	SEGMENT
; File expr.c
_digit$384 = -16
_radix$385 = -40
_seg$450 = -64
_maxdig$386 = -32
_too_many_digits$387 = -20
_digit_2$388 = -36
_small$389 = -24
_leader$407 = -44
_pointer$408 = -52
_carry$409 = -48
_work$416 = -56
_error_code$436 = -60
_expressionP$ = 8
_c$ = -8
_name$ = -4
_symbolP$ = -12
_number$383 = -28
_operand PROC NEAR
; Line 84
	push	ebp
	mov	ebp, esp
	sub	esp, 84					; 00000054H
	push	ebx
	push	esi
	push	edi
; Line 93
	mov	eax, DWORD PTR _input_line_pointer
	mov	al, BYTE PTR [eax]
	mov	BYTE PTR _c$[ebp], al
	inc	DWORD PTR _input_line_pointer
; Line 94
	cmp	DWORD PTR ___mb_cur_max, 1
	jle	$L604
	push	4
	movsx	eax, BYTE PTR _c$[ebp]
	push	eax
	call	__isctype
	add	esp, 8
	mov	DWORD PTR -68+[ebp], eax
	jmp	$L605
$L604:
	movsx	eax, BYTE PTR _c$[ebp]
	mov	ecx, DWORD PTR __pctype
	mov	ax, WORD PTR [ecx+eax*2]
	and	eax, 4
	mov	DWORD PTR -68+[ebp], eax
$L605:
	cmp	DWORD PTR -68+[ebp], 0
	je	$L382
; Line 109
	movsx	eax, BYTE PTR _c$[ebp]
	cmp	eax, 48					; 00000030H
	jne	$L390
; Line 111
	mov	eax, DWORD PTR _input_line_pointer
	mov	al, BYTE PTR [eax]
	mov	BYTE PTR _c$[ebp], al
	inc	DWORD PTR _input_line_pointer
	movsx	eax, BYTE PTR _c$[ebp]
	cmp	eax, 120				; 00000078H
	je	$L392
	movsx	eax, BYTE PTR _c$[ebp]
	cmp	eax, 88					; 00000058H
	jne	$L391
$L392:
; Line 113
	mov	eax, DWORD PTR _input_line_pointer
	mov	al, BYTE PTR [eax]
	mov	BYTE PTR _c$[ebp], al
	inc	DWORD PTR _input_line_pointer
; Line 114
	mov	WORD PTR _radix$385[ebp], 16		; 00000010H
	mov	ax, WORD PTR _radix$385[ebp]
	mov	WORD PTR _maxdig$386[ebp], ax
; Line 115
	mov	DWORD PTR _too_many_digits$387[ebp], 9
; Line 117
	jmp	$L393
$L391:
; Line 123
	movsx	eax, BYTE PTR _c$[ebp]
	cmp	eax, 102				; 00000066H
	jne	$L395
	mov	eax, DWORD PTR _input_line_pointer
	movsx	eax, BYTE PTR [eax]
	or	eax, eax
	je	$L396
	mov	eax, DWORD PTR _input_line_pointer
	movsx	eax, BYTE PTR [eax]
	push	eax
	push	OFFSET $SG397
	call	_strchr
	add	esp, 8
	or	eax, eax
	jne	$L395
	mov	eax, DWORD PTR _input_line_pointer
	movsx	eax, BYTE PTR [eax]
	push	eax
	push	OFFSET _EXP_CHARS
	call	_strchr
	add	esp, 8
	or	eax, eax
	jne	$L395
$L396:
; Line 125
	mov	WORD PTR _radix$385[ebp], 10		; 0000000aH
	mov	ax, WORD PTR _radix$385[ebp]
	mov	WORD PTR _maxdig$386[ebp], ax
; Line 126
	mov	DWORD PTR _too_many_digits$387[ebp], 11	; 0000000bH
; Line 127
	mov	BYTE PTR _c$[ebp], 48			; 00000030H
; Line 128
	sub	DWORD PTR _input_line_pointer, 2
; Line 130
	jmp	$L398
$L395:
	movsx	eax, BYTE PTR _c$[ebp]
	or	eax, eax
	je	$L399
	movsx	eax, BYTE PTR _c$[ebp]
	push	eax
	push	OFFSET _FLT_CHARS
	call	_strchr
	add	esp, 8
	or	eax, eax
	je	$L399
; Line 132
	mov	WORD PTR _radix$385[ebp], 0
; Line 134
	cmp	DWORD PTR ___mb_cur_max, 1
	jle	$L608
	push	1
	movsx	eax, BYTE PTR _c$[ebp]
	push	eax
	call	__isctype
	add	esp, 8
	mov	DWORD PTR -76+[ebp], eax
	jmp	$L609
$L608:
	movsx	eax, BYTE PTR _c$[ebp]
	mov	ecx, DWORD PTR __pctype
	mov	ax, WORD PTR [ecx+eax*2]
	and	eax, 1
	mov	DWORD PTR -76+[ebp], eax
$L609:
	cmp	DWORD PTR -76+[ebp], 0
	je	$L606
	movsx	eax, BYTE PTR _c$[ebp]
	push	eax
	call	_tolower
	add	esp, 4
	mov	DWORD PTR -72+[ebp], eax
	jmp	$L607
$L606:
	movsx	eax, BYTE PTR _c$[ebp]
	mov	DWORD PTR -72+[ebp], eax
$L607:
	mov	eax, DWORD PTR -72+[ebp]
	neg	eax
	mov	ecx, DWORD PTR _expressionP$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 136
	jmp	$L400
$L399:
; Line 138
	mov	WORD PTR _radix$385[ebp], 8
; Line 139
	mov	WORD PTR _maxdig$386[ebp], 10		; 0000000aH
; Line 140
	mov	DWORD PTR _too_many_digits$387[ebp], 11	; 0000000bH
; Line 141
$L400:
$L398:
; Line 142
$L393:
; Line 145
	jmp	$L401
$L390:
; Line 147
	mov	WORD PTR _radix$385[ebp], 10		; 0000000aH
	mov	ax, WORD PTR _radix$385[ebp]
	mov	WORD PTR _maxdig$386[ebp], ax
; Line 148
	mov	DWORD PTR _too_many_digits$387[ebp], 11	; 0000000bH
; Line 149
$L401:
; Line 150
	movsx	eax, WORD PTR _radix$385[ebp]
	or	eax, eax
	je	$L402
; Line 168
	mov	eax, DWORD PTR _input_line_pointer
	mov	DWORD PTR _digit_2$388[ebp], eax
; Line 169
	mov	DWORD PTR _number$383[ebp], 0
	jmp	$L403
$L404:
	mov	eax, DWORD PTR _input_line_pointer
	mov	al, BYTE PTR [eax]
	mov	BYTE PTR _c$[ebp], al
	inc	DWORD PTR _input_line_pointer
$L403:
	movsx	eax, BYTE PTR _c$[ebp]
	movsx	ax, BYTE PTR _hex_value[eax]
	mov	WORD PTR _digit$384[ebp], ax
	movsx	eax, WORD PTR _maxdig$386[ebp]
	movsx	ecx, WORD PTR _digit$384[ebp]
	cmp	eax, ecx
	jle	$L405
; Line 171
	movsx	eax, WORD PTR _radix$385[ebp]
	imul	eax, DWORD PTR _number$383[ebp]
	movsx	ecx, WORD PTR _digit$384[ebp]
	add	eax, ecx
	mov	DWORD PTR _number$383[ebp], eax
; Line 172
	jmp	$L404
$L405:
; Line 175
	mov	eax, DWORD PTR _input_line_pointer
	sub	eax, DWORD PTR _digit_2$388[ebp]
	cmp	eax, DWORD PTR _too_many_digits$387[ebp]
	mov	eax, 0
	setl	al
	mov	DWORD PTR _small$389[ebp], eax
; Line 176
	cmp	DWORD PTR _small$389[ebp], 0
	jne	$L406
; Line 185
	mov	DWORD PTR _leader$407[ebp], OFFSET _generic_bignum
; Line 186
	mov	WORD PTR _generic_bignum, 0
; Line 187
	mov	WORD PTR _generic_bignum+2, 0
; Line 189
	dec	DWORD PTR _digit_2$388[ebp]
	mov	eax, DWORD PTR _digit_2$388[ebp]
	mov	DWORD PTR _input_line_pointer, eax
; Line 190
	mov	eax, DWORD PTR _input_line_pointer
	mov	al, BYTE PTR [eax]
	mov	BYTE PTR _c$[ebp], al
	inc	DWORD PTR _input_line_pointer
; Line 191
	jmp	$L410
$L411:
	mov	eax, DWORD PTR _input_line_pointer
	mov	al, BYTE PTR [eax]
	mov	BYTE PTR _c$[ebp], al
	inc	DWORD PTR _input_line_pointer
$L410:
	movsx	eax, BYTE PTR _c$[ebp]
	movsx	eax, BYTE PTR _hex_value[eax]
	mov	DWORD PTR _carry$409[ebp], eax
	movsx	eax, WORD PTR _maxdig$386[ebp]
	cmp	eax, DWORD PTR _carry$409[ebp]
	jle	$L412
; Line 195
	mov	DWORD PTR _pointer$408[ebp], OFFSET _generic_bignum
	jmp	$L413
$L414:
	add	DWORD PTR _pointer$408[ebp], 2
$L413:
	mov	eax, DWORD PTR _pointer$408[ebp]
	cmp	DWORD PTR _leader$407[ebp], eax
	jb	$L415
; Line 199
	mov	eax, DWORD PTR _pointer$408[ebp]
	mov	ax, WORD PTR [eax]
	and	eax, 65535				; 0000ffffH
	movsx	ecx, WORD PTR _radix$385[ebp]
	imul	eax, ecx
	add	eax, DWORD PTR _carry$409[ebp]
	mov	DWORD PTR _work$416[ebp], eax
; Line 200
	mov	eax, DWORD PTR _work$416[ebp]
	and	eax, 65535				; 0000ffffH
	mov	ecx, DWORD PTR _pointer$408[ebp]
	mov	WORD PTR [ecx], ax
; Line 201
	mov	eax, DWORD PTR _work$416[ebp]
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _carry$409[ebp], eax
; Line 202
	jmp	$L414
$L415:
; Line 203
	cmp	DWORD PTR _carry$409[ebp], 0
	je	$L417
; Line 205
	mov	eax, OFFSET _generic_bignum
	add	eax, 38					; 00000026H
	cmp	eax, DWORD PTR _leader$407[ebp]
	jbe	$L418
; Line 207
	add	DWORD PTR _leader$407[ebp], 2
	mov	eax, DWORD PTR _carry$409[ebp]
	mov	ecx, DWORD PTR _leader$407[ebp]
	mov	WORD PTR [ecx], ax
; Line 209
$L418:
; Line 210
$L417:
	jmp	$L411
$L412:
; Line 216
	mov	eax, OFFSET _generic_bignum
	add	eax, 4
	cmp	eax, DWORD PTR _leader$407[ebp]
	jbe	$L419
; Line 220
	xor	eax, eax
	mov	ax, WORD PTR _generic_bignum+2
	shl	eax, 16					; 00000010H
	mov	cx, WORD PTR _generic_bignum
	and	ecx, 65535				; 0000ffffH
	or	eax, ecx
	mov	DWORD PTR _number$383[ebp], eax
; Line 221
	mov	DWORD PTR _small$389[ebp], 1
; Line 223
	jmp	$L420
$L419:
; Line 225
	mov	eax, DWORD PTR _leader$407[ebp]
	sub	eax, OFFSET _generic_bignum
	sar	eax, 1
	inc	eax
	mov	DWORD PTR _number$383[ebp], eax
; Line 226
$L420:
; Line 228
$L406:
	cmp	DWORD PTR _small$389[ebp], 0
	je	$L421
; Line 236
	cmp	DWORD PTR _number$383[ebp], 10		; 0000000aH
	jae	$L422
; Line 241
	movsx	eax, BYTE PTR _c$[ebp]
	cmp	eax, 98					; 00000062H
	jne	$L423
; Line 251
	push	0
	mov	eax, DWORD PTR _number$383[ebp]
	push	eax
	call	_local_label_name
	add	esp, 8
	mov	DWORD PTR _name$[ebp], eax
; Line 254
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_symbol_find
	add	esp, 4
	mov	DWORD PTR _symbolP$[ebp], eax
	cmp	DWORD PTR _symbolP$[ebp], 0
	je	$L424
	mov	eax, DWORD PTR _symbolP$[ebp]
	mov	al, BYTE PTR [eax+4]
	and	eax, 255				; 000000ffH
	test	al, 30					; 0000001eH
	je	$L424
; Line 259
	mov	eax, DWORD PTR _symbolP$[ebp]
	mov	ecx, DWORD PTR _expressionP$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 260
	mov	eax, DWORD PTR _expressionP$[ebp]
	mov	DWORD PTR [eax+8], 0
; Line 261
	mov	eax, DWORD PTR _symbolP$[ebp]
	mov	al, BYTE PTR [eax+4]
	and	eax, 255				; 000000ffH
	mov	eax, DWORD PTR _N_TYPE_seg[eax*4]
	mov	ecx, DWORD PTR _expressionP$[ebp]
	mov	DWORD PTR [ecx+12], eax
; Line 263
	jmp	$L425
$L424:
; Line 267
	mov	eax, DWORD PTR _number$383[ebp]
	push	eax
	push	OFFSET $SG427
	call	_as_warn
	add	esp, 8
; Line 268
	mov	eax, DWORD PTR _expressionP$[ebp]
	mov	DWORD PTR [eax+8], 0
; Line 269
	mov	eax, DWORD PTR _expressionP$[ebp]
	mov	DWORD PTR [eax+12], 0
; Line 270
$L425:
; Line 272
	jmp	$L428
$L423:
; Line 277
	movsx	eax, BYTE PTR _c$[ebp]
	cmp	eax, 102				; 00000066H
	jne	$L429
; Line 288
	push	1
	mov	eax, DWORD PTR _number$383[ebp]
	push	eax
	call	_local_label_name
	add	esp, 8
	mov	DWORD PTR _name$[ebp], eax
; Line 289
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_symbol_find
	add	esp, 4
	mov	DWORD PTR _symbolP$[ebp], eax
	cmp	DWORD PTR _symbolP$[ebp], 0
	je	$L430
; Line 296
	jmp	$L431
$L430:
; Line 298
	push	OFFSET _zero_address_frag
	push	0
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_symbol_new
	add	esp, 24					; 00000018H
	mov	DWORD PTR _symbolP$[ebp], eax
; Line 299
	mov	eax, DWORD PTR _symbolP$[ebp]
	push	eax
	call	_symbol_table_insert
	add	esp, 4
; Line 300
$L431:
; Line 301
	mov	eax, DWORD PTR _symbolP$[ebp]
	mov	ecx, DWORD PTR _expressionP$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 302
	mov	eax, DWORD PTR _expressionP$[ebp]
	mov	DWORD PTR [eax+12], 4
; Line 303
	mov	eax, DWORD PTR _expressionP$[ebp]
	mov	DWORD PTR [eax+4], 0
; Line 304
	mov	eax, DWORD PTR _expressionP$[ebp]
	mov	DWORD PTR [eax+8], 0
; Line 306
	jmp	$L432
$L429:
; Line 308
	mov	eax, DWORD PTR _number$383[ebp]
	mov	ecx, DWORD PTR _expressionP$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 309
	mov	eax, DWORD PTR _expressionP$[ebp]
	mov	DWORD PTR [eax+12], 0
; Line 310
	dec	DWORD PTR _input_line_pointer
; Line 311
$L432:
; Line 312
$L428:
; Line 314
	jmp	$L433
$L422:
; Line 316
	mov	eax, DWORD PTR _number$383[ebp]
	mov	ecx, DWORD PTR _expressionP$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 317
	mov	eax, DWORD PTR _expressionP$[ebp]
	mov	DWORD PTR [eax+12], 0
; Line 318
	dec	DWORD PTR _input_line_pointer
; Line 319
$L433:
; Line 321
	jmp	$L434
$L421:
; Line 323
	mov	eax, DWORD PTR _number$383[ebp]
	mov	ecx, DWORD PTR _expressionP$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 324
	mov	eax, DWORD PTR _expressionP$[ebp]
	mov	DWORD PTR [eax+12], 8
; Line 325
	dec	DWORD PTR _input_line_pointer
; Line 326
$L434:
; Line 328
	jmp	$L435
$L402:
; Line 335
	push	OFFSET _generic_floating_point_number
	push	OFFSET _EXP_CHARS
	push	OFFSET $SG437
	push	OFFSET _input_line_pointer
	call	_atof_generic
	add	esp, 16					; 00000010H
	mov	DWORD PTR _error_code$436[ebp], eax
; Line 337
	cmp	DWORD PTR _error_code$436[ebp], 0
	je	$L438
; Line 339
	cmp	DWORD PTR _error_code$436[ebp], 2
	jne	$L439
; Line 341
	push	OFFSET $SG440
	call	_as_warn
	add	esp, 4
; Line 343
	jmp	$L441
$L439:
; Line 345
	mov	eax, DWORD PTR _error_code$436[ebp]
	push	eax
	push	OFFSET $SG442
	call	_as_warn
	add	esp, 8
; Line 346
$L441:
; Line 348
$L438:
	mov	eax, DWORD PTR _expressionP$[ebp]
	mov	DWORD PTR [eax+12], 8
; Line 352
$L435:
; Line 354
	jmp	$L443
$L382:
	movsx	eax, BYTE PTR _c$[ebp]
	cmp	eax, 46					; 0000002eH
	jne	$L444
	mov	eax, DWORD PTR _input_line_pointer
	movsx	eax, BYTE PTR [eax]
	movsx	eax, BYTE PTR _lex_type[eax]
	test	al, 1
	jne	$L444
; Line 366
	mov	eax, DWORD PTR _frag_now
	push	eax
	mov	eax, DWORD PTR _frags+12
	mov	ecx, DWORD PTR _frag_now
	add	ecx, 38					; 00000026H
	sub	eax, ecx
	push	eax
	push	0
	push	0
	mov	eax, DWORD PTR _now_seg
	mov	al, BYTE PTR _seg_N_TYPE[eax*4]
	and	eax, 255				; 000000ffH
	push	eax
	push	OFFSET $SG446
	call	_symbol_new
	add	esp, 24					; 00000018H
	mov	DWORD PTR _symbolP$[ebp], eax
; Line 367
	mov	eax, DWORD PTR _expressionP$[ebp]
	mov	DWORD PTR [eax+8], 0
; Line 368
	mov	eax, DWORD PTR _symbolP$[ebp]
	mov	ecx, DWORD PTR _expressionP$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 369
	mov	eax, DWORD PTR _now_seg
	mov	ecx, DWORD PTR _expressionP$[ebp]
	mov	DWORD PTR [ecx+12], eax
; Line 371
	jmp	$L447
$L444:
	movsx	eax, BYTE PTR _c$[ebp]
	movsx	eax, BYTE PTR _lex_type[eax]
	test	al, 2
	je	$L448
; Line 377
	dec	DWORD PTR _input_line_pointer
	mov	eax, DWORD PTR _input_line_pointer
	mov	DWORD PTR _name$[ebp], eax
; Line 378
	call	_get_symbol_end
	mov	BYTE PTR _c$[ebp], al
; Line 379
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_symbol_find
	add	esp, 4
	mov	DWORD PTR _symbolP$[ebp], eax
; Line 380
	cmp	DWORD PTR _symbolP$[ebp], 0
	je	$L449
; Line 387
	mov	eax, DWORD PTR _symbolP$[ebp]
	mov	al, BYTE PTR [eax+4]
	and	eax, 30					; 0000001eH
	mov	eax, DWORD PTR _N_TYPE_seg[eax*4]
	mov	DWORD PTR _seg$450[ebp], eax
; Line 388
	mov	eax, DWORD PTR _seg$450[ebp]
	mov	ecx, DWORD PTR _expressionP$[ebp]
	mov	DWORD PTR [ecx+12], eax
	mov	eax, DWORD PTR _expressionP$[ebp]
	cmp	DWORD PTR [eax+12], 0
	jne	$L451
; Line 390
	mov	eax, DWORD PTR _symbolP$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _expressionP$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 392
	jmp	$L452
$L451:
; Line 394
	mov	eax, DWORD PTR _expressionP$[ebp]
	mov	DWORD PTR [eax+8], 0
; Line 395
	mov	eax, DWORD PTR _symbolP$[ebp]
	mov	ecx, DWORD PTR _expressionP$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 396
$L452:
; Line 398
	jmp	$L453
$L449:
; Line 402
	push	OFFSET _zero_address_frag
	push	0
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_symbol_new
	add	esp, 24					; 00000018H
	mov	DWORD PTR _symbolP$[ebp], eax
	mov	eax, DWORD PTR _symbolP$[ebp]
	mov	ecx, DWORD PTR _expressionP$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 404
	mov	eax, DWORD PTR _expressionP$[ebp]
	mov	DWORD PTR [eax+8], 0
; Line 405
	mov	eax, DWORD PTR _expressionP$[ebp]
	mov	DWORD PTR [eax+12], 4
; Line 406
	mov	eax, DWORD PTR _symbolP$[ebp]
	push	eax
	call	_symbol_table_insert
	add	esp, 4
; Line 407
$L453:
; Line 408
	mov	al, BYTE PTR _c$[ebp]
	mov	ecx, DWORD PTR _input_line_pointer
	mov	BYTE PTR [ecx], al
; Line 409
	mov	eax, DWORD PTR _expressionP$[ebp]
	mov	DWORD PTR [eax+4], 0
; Line 411
	jmp	$L454
$L448:
	movsx	eax, BYTE PTR _c$[ebp]
	cmp	eax, 40					; 00000028H
	jne	$L455
; Line 413
	mov	eax, DWORD PTR _expressionP$[ebp]
	push	eax
	push	0
	call	_expr
	add	esp, 8
; Line 415
	mov	eax, DWORD PTR _input_line_pointer
	mov	DWORD PTR -80+[ebp], eax
	inc	DWORD PTR _input_line_pointer
	mov	eax, DWORD PTR -80+[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 41					; 00000029H
	je	$L456
; Line 417
	push	OFFSET $SG457
	call	_as_warn
	add	esp, 4
; Line 418
	dec	DWORD PTR _input_line_pointer
; Line 421
$L456:
; Line 422
	jmp	$L458
$L455:
	movsx	eax, BYTE PTR _c$[ebp]
	cmp	eax, 126				; 0000007eH
	je	$L460
	movsx	eax, BYTE PTR _c$[ebp]
	cmp	eax, 45					; 0000002dH
	jne	$L459
$L460:
; Line 424
	mov	eax, DWORD PTR _expressionP$[ebp]
	push	eax
	call	_operand
	add	esp, 4
	mov	DWORD PTR -84+[ebp], eax
	jmp	$L461
; Line 425
$L465:
; Line 427
	movsx	eax, BYTE PTR _c$[ebp]
	cmp	eax, 45					; 0000002dH
	jne	$L466
; Line 429
	mov	eax, DWORD PTR _expressionP$[ebp]
	mov	eax, DWORD PTR [eax+8]
	neg	eax
	mov	ecx, DWORD PTR _expressionP$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 435
	jmp	$L467
$L466:
; Line 437
	mov	eax, DWORD PTR _expressionP$[ebp]
	mov	eax, DWORD PTR [eax+8]
	not	eax
	mov	ecx, DWORD PTR _expressionP$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 438
$L467:
; Line 439
	jmp	$L462
; Line 441
$L468:
; Line 446
	movsx	eax, BYTE PTR _c$[ebp]
	cmp	eax, 45					; 0000002dH
	jne	$L469
; Line 447
	mov	eax, DWORD PTR _expressionP$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _expressionP$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 448
	mov	eax, DWORD PTR _expressionP$[ebp]
	mov	DWORD PTR [eax], 0
; Line 449
	mov	eax, DWORD PTR _expressionP$[ebp]
	mov	DWORD PTR [eax+12], 9
; Line 450
	jmp	$L462
; Line 452
$L469:
$L470:
; Line 453
	movsx	eax, BYTE PTR _c$[ebp]
	push	eax
	push	OFFSET $SG471
	call	_as_warn
	add	esp, 8
; Line 454
	jmp	$L462
; Line 456
	jmp	$L462
$L461:
	cmp	DWORD PTR -84+[ebp], 0
	je	$L465
	cmp	DWORD PTR -84+[ebp], 1
	jl	$L470
	cmp	DWORD PTR -84+[ebp], 4
	jle	$L468
	cmp	DWORD PTR -84+[ebp], 6
	je	$L468
	jmp	$L470
$L462:
; Line 458
	jmp	$L472
$L459:
	movsx	eax, BYTE PTR _c$[ebp]
	cmp	eax, 39					; 00000027H
	jne	$L473
; Line 465
	mov	eax, DWORD PTR _input_line_pointer
	movsx	eax, BYTE PTR [eax]
	mov	ecx, DWORD PTR _expressionP$[ebp]
	mov	DWORD PTR [ecx+8], eax
	inc	DWORD PTR _input_line_pointer
; Line 466
	mov	eax, DWORD PTR _expressionP$[ebp]
	mov	DWORD PTR [eax+12], 0
; Line 468
	jmp	$L474
$L473:
; Line 471
	mov	eax, DWORD PTR _expressionP$[ebp]
	mov	DWORD PTR [eax+12], 5
; Line 472
	dec	DWORD PTR _input_line_pointer
; Line 473
$L474:
$L472:
$L458:
$L454:
$L447:
$L443:
; Line 478
	mov	eax, DWORD PTR _expressionP$[ebp]
	push	eax
	call	_clean_up_expression
	add	esp, 4
; Line 481
	mov	eax, DWORD PTR _expressionP$[ebp]
	mov	eax, DWORD PTR [eax+12]
	jmp	$L377
; Line 482
$L377:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_operand ENDP
_TEXT	ENDS
EXTRN	_as_fatal:NEAR
_DATA	SEGMENT
	ORG $+2
$SG489	DB	'expr.c', 00H
	ORG $+1
$SG490	DB	'Case value %d unexpected at line %d of file "%s"', 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_expressionP$ = 8
_clean_up_expression PROC NEAR
; Line 500
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 501
	mov	eax, DWORD PTR _expressionP$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR -4+[ebp], eax
	jmp	$L477
; Line 503
$L481:
; Line 505
	mov	eax, DWORD PTR _expressionP$[ebp]
	mov	DWORD PTR [eax], 0
; Line 506
	mov	eax, DWORD PTR _expressionP$[ebp]
	mov	DWORD PTR [eax+4], 0
; Line 507
	mov	eax, DWORD PTR _expressionP$[ebp]
	mov	DWORD PTR [eax+8], 0
; Line 508
	jmp	$L478
; Line 510
$L482:
; Line 512
	mov	eax, DWORD PTR _expressionP$[ebp]
	mov	DWORD PTR [eax+4], 0
; Line 513
	mov	eax, DWORD PTR _expressionP$[ebp]
	mov	DWORD PTR [eax], 0
; Line 514
	jmp	$L478
; Line 516
$L483:
; Line 520
	mov	eax, DWORD PTR _expressionP$[ebp]
	mov	DWORD PTR [eax+4], 0
; Line 521
	jmp	$L478
; Line 523
$L484:
; Line 534
	mov	eax, DWORD PTR _expressionP$[ebp]
	mov	ecx, DWORD PTR _expressionP$[ebp]
	mov	ecx, DWORD PTR [ecx]
	cmp	DWORD PTR [eax+4], ecx
	je	$L486
	mov	eax, DWORD PTR _expressionP$[ebp]
	cmp	DWORD PTR [eax+4], 0
	je	$L485
	mov	eax, DWORD PTR _expressionP$[ebp]
	cmp	DWORD PTR [eax], 0
	je	$L485
	mov	eax, DWORD PTR _expressionP$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _expressionP$[ebp]
	mov	ecx, DWORD PTR [ecx]
	mov	ecx, DWORD PTR [ecx+24]
	cmp	DWORD PTR [eax+24], ecx
	jne	$L485
	mov	eax, DWORD PTR _expressionP$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _expressionP$[ebp]
	mov	ecx, DWORD PTR [ecx]
	mov	ecx, DWORD PTR [ecx+8]
	cmp	DWORD PTR [eax+8], ecx
	jne	$L485
$L486:
; Line 536
	mov	eax, DWORD PTR _expressionP$[ebp]
	mov	DWORD PTR [eax+4], 0
; Line 537
	mov	eax, DWORD PTR _expressionP$[ebp]
	mov	DWORD PTR [eax], 0
; Line 538
	mov	eax, DWORD PTR _expressionP$[ebp]
	mov	DWORD PTR [eax+12], 0
; Line 540
$L485:
	jmp	$L478
; Line 542
$L487:
; Line 543
	push	OFFSET $SG489
	push	543					; 0000021fH
	mov	eax, DWORD PTR _expressionP$[ebp]
	mov	eax, DWORD PTR [eax+12]
	push	eax
	push	OFFSET $SG490
	call	_as_fatal
	add	esp, 16					; 00000010H
; Line 544
	jmp	$L478
; Line 545
	jmp	$L478
$L477:
	cmp	DWORD PTR -4+[ebp], 9
	ja	$L487
	shl	DWORD PTR -4+[ebp], 2
	mov	eax, DWORD PTR -4+[ebp]
	jmp	DWORD PTR $L610[eax]
$L610:
	DD	OFFSET $L482
	DD	OFFSET $L483
	DD	OFFSET $L483
	DD	OFFSET $L483
	DD	OFFSET $L483
	DD	OFFSET $L481
	DD	OFFSET $L481
	DD	OFFSET $L487
	DD	OFFSET $L482
	DD	OFFSET $L484
$L478:
; Line 546
$L476:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_clean_up_expression ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+2
$SG504	DB	'Expression too complex, 2 symbols forgotten: "%s" "%s"', 00H
_DATA	ENDS
_TEXT	SEGMENT
_symbol_1_PP$ = 8
_symbol_2_P$ = 12
_return_value$ = -4
_expr_part PROC NEAR
; Line 563
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 578
	mov	eax, DWORD PTR _symbol_1_PP$[ebp]
	cmp	DWORD PTR [eax], 0
	je	$L496
; Line 580
	mov	eax, DWORD PTR _symbol_1_PP$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	al, BYTE PTR [eax+4]
	and	eax, 255				; 000000ffH
	test	al, 30					; 0000001eH
	jne	$L497
; Line 582
	cmp	DWORD PTR _symbol_2_P$[ebp], 0
	je	$L498
; Line 584
	mov	DWORD PTR _return_value$[ebp], 6
; Line 585
	mov	eax, DWORD PTR _symbol_1_PP$[ebp]
	mov	DWORD PTR [eax], 0
; Line 587
	jmp	$L499
$L498:
; Line 590
	mov	DWORD PTR _return_value$[ebp], 4
; Line 591
$L499:
; Line 593
	jmp	$L500
$L497:
; Line 595
	cmp	DWORD PTR _symbol_2_P$[ebp], 0
	je	$L501
; Line 597
	mov	eax, DWORD PTR _symbol_2_P$[ebp]
	mov	al, BYTE PTR [eax+4]
	and	eax, 255				; 000000ffH
	test	al, 30					; 0000001eH
	jne	$L502
; Line 599
	mov	eax, DWORD PTR _symbol_1_PP$[ebp]
	mov	DWORD PTR [eax], 0
; Line 600
	mov	DWORD PTR _return_value$[ebp], 6
; Line 602
	jmp	$L503
$L502:
; Line 606
	mov	eax, DWORD PTR _symbol_2_P$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	mov	eax, DWORD PTR _symbol_1_PP$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax]
	push	eax
	push	OFFSET $SG504
	call	_as_warn
	add	esp, 12					; 0000000cH
; Line 607
	mov	eax, DWORD PTR _symbol_1_PP$[ebp]
	mov	DWORD PTR [eax], 0
; Line 608
	mov	DWORD PTR _return_value$[ebp], 0
; Line 609
$L503:
; Line 611
	jmp	$L505
$L501:
; Line 613
	mov	eax, DWORD PTR _symbol_1_PP$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	al, BYTE PTR [eax+4]
	and	eax, 30					; 0000001eH
	mov	eax, DWORD PTR _N_TYPE_seg[eax*4]
	mov	DWORD PTR _return_value$[ebp], eax
; Line 614
$L505:
; Line 615
$L500:
; Line 617
	jmp	$L506
$L496:
; Line 619
	cmp	DWORD PTR _symbol_2_P$[ebp], 0
	je	$L507
; Line 621
	mov	eax, DWORD PTR _symbol_2_P$[ebp]
	mov	ecx, DWORD PTR _symbol_1_PP$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 622
	mov	eax, DWORD PTR _symbol_2_P$[ebp]
	mov	al, BYTE PTR [eax+4]
	and	eax, 30					; 0000001eH
	mov	eax, DWORD PTR _N_TYPE_seg[eax*4]
	mov	DWORD PTR _return_value$[ebp], eax
; Line 624
	jmp	$L508
$L507:
; Line 626
	mov	eax, DWORD PTR _symbol_1_PP$[ebp]
	mov	DWORD PTR [eax], 0
; Line 627
	mov	DWORD PTR _return_value$[ebp], 0
; Line 628
$L508:
; Line 629
$L506:
; Line 639
	mov	eax, DWORD PTR _return_value$[ebp]
	jmp	$L494
; Line 640
$L494:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_expr_part ENDP
_TEXT	ENDS
EXTRN	_need_pass_2:DWORD
_DATA	SEGMENT
	ORG $+1
$SG540	DB	'Missing operand value assumed absolute 0.', 00H
	ORG $+2
$SG547	DB	'bignum', 00H
	ORG $+1
$SG548	DB	'float', 00H
	ORG $+2
$SG549	DB	'Left operand of %c is a %s.  Integer 0 assumed.', 00H
$SG551	DB	'bignum', 00H
	ORG $+1
$SG552	DB	'float', 00H
	ORG $+2
$SG553	DB	'Right operand of %c is a %s.  Integer 0 assumed.', 00H
	ORG $+3
$SG566	DB	'Expression too complex: forgetting %s - %s', 00H
	ORG $+1
$SG574	DB	'Relocation error. Absolute 0 assumed.', 00H
	ORG $+2
$SG584	DB	'Division by 0. 0 assumed.', 00H
	ORG $+2
$SG590	DB	'Division by 0. 0 assumed.', 00H
	ORG $+2
$SG596	DB	'expr.c', 00H
	ORG $+1
$SG597	DB	'Case value %d unexpected at line %d of file "%s"', 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_rank$ = 8
_resultP$ = 12
_right$ = -32
_op_left$ = -16
_c_left$ = -12
_op_right$ = -8
_c_right$ = -4
_symbolP$555 = -36
_seg1$558 = -44
_seg2$559 = -40
_expr	PROC NEAR
; Line 726
	push	ebp
	mov	ebp, esp
	sub	esp, 48					; 00000030H
	push	ebx
	push	esi
	push	edi
; Line 734
	mov	eax, DWORD PTR _resultP$[ebp]
	push	eax
	call	_operand
	add	esp, 4
; Line 736
	mov	eax, DWORD PTR _input_line_pointer
	mov	al, BYTE PTR [eax]
	mov	BYTE PTR _c_left$[ebp], al
; Line 737
	movsx	eax, BYTE PTR _c_left$[ebp]
	mov	eax, DWORD PTR _op_encoding$S523[eax*4]
	mov	DWORD PTR _op_left$[ebp], eax
; Line 738
$L535:
	cmp	DWORD PTR _op_left$[ebp], 0
	je	$L536
	mov	eax, DWORD PTR _op_left$[ebp]
	movsx	eax, BYTE PTR _op_rank$S525[eax]
	movsx	ecx, BYTE PTR _rank$[ebp]
	cmp	eax, ecx
	jle	$L536
; Line 740
	inc	DWORD PTR _input_line_pointer
; Line 742
	mov	eax, DWORD PTR _input_line_pointer
	movsx	eax, BYTE PTR [eax]
	movsx	ecx, BYTE PTR _c_left$[ebp]
	cmp	eax, ecx
	jne	$L537
	movsx	eax, BYTE PTR _c_left$[ebp]
	cmp	eax, 60					; 0000003cH
	je	$L538
	movsx	eax, BYTE PTR _c_left$[ebp]
	cmp	eax, 62					; 0000003eH
	jne	$L537
$L538:
; Line 744
	inc	DWORD PTR _input_line_pointer
; Line 746
$L537:
	lea	eax, DWORD PTR _right$[ebp]
	push	eax
	mov	eax, DWORD PTR _op_left$[ebp]
	movsx	eax, BYTE PTR _op_rank$S525[eax]
	push	eax
	call	_expr
	add	esp, 8
	cmp	eax, 5
	jne	$L539
; Line 748
	push	OFFSET $SG540
	call	_as_warn
	add	esp, 4
; Line 749
	mov	eax, DWORD PTR _resultP$[ebp]
	mov	DWORD PTR [eax+8], 0
; Line 750
	mov	eax, DWORD PTR _resultP$[ebp]
	mov	DWORD PTR [eax+4], 0
; Line 751
	mov	eax, DWORD PTR _resultP$[ebp]
	mov	DWORD PTR [eax], 0
; Line 752
	mov	eax, DWORD PTR _resultP$[ebp]
	mov	DWORD PTR [eax+12], 0
; Line 754
$L539:
; Line 755
	mov	eax, DWORD PTR _input_line_pointer
	mov	al, BYTE PTR [eax]
	mov	BYTE PTR _c_right$[ebp], al
; Line 756
	movsx	eax, BYTE PTR _c_right$[ebp]
	mov	eax, DWORD PTR _op_encoding$S523[eax*4]
	mov	DWORD PTR _op_right$[ebp], eax
; Line 757
	mov	eax, DWORD PTR _input_line_pointer
	movsx	eax, BYTE PTR [eax]
	movsx	ecx, BYTE PTR _c_right$[ebp]
	cmp	eax, ecx
	jne	$L541
	movsx	eax, BYTE PTR _c_right$[ebp]
	cmp	eax, 60					; 0000003cH
	je	$L542
	movsx	eax, BYTE PTR _c_right$[ebp]
	cmp	eax, 62					; 0000003eH
	jne	$L541
$L542:
; Line 759
	inc	DWORD PTR _input_line_pointer
; Line 761
$L541:
; Line 767
	mov	eax, DWORD PTR _resultP$[ebp]
	cmp	DWORD PTR [eax+12], 6
	je	$L544
	cmp	DWORD PTR _right$[ebp+12], 6
	jne	$L543
$L544:
; Line 769
	mov	eax, DWORD PTR _resultP$[ebp]
	mov	DWORD PTR [eax+12], 6
; Line 771
	jmp	$L545
$L543:
; Line 773
	mov	eax, DWORD PTR _resultP$[ebp]
	cmp	DWORD PTR [eax+12], 8
	jne	$L546
; Line 776
	mov	eax, OFFSET $SG547
	mov	ecx, DWORD PTR _resultP$[ebp]
	cmp	DWORD PTR [ecx+8], 0
	jg	$L611
	mov	eax, OFFSET $SG548
$L611:
	push	eax
	movsx	eax, BYTE PTR _c_left$[ebp]
	push	eax
	push	OFFSET $SG549
	call	_as_warn
	add	esp, 12					; 0000000cH
; Line 777
	mov	eax, DWORD PTR _resultP$[ebp]
	mov	DWORD PTR [eax+12], 0
; Line 778
	mov	eax, DWORD PTR _resultP$[ebp]
	mov	DWORD PTR [eax], 0
; Line 779
	mov	eax, DWORD PTR _resultP$[ebp]
	mov	DWORD PTR [eax+4], 0
; Line 780
	mov	eax, DWORD PTR _resultP$[ebp]
	mov	DWORD PTR [eax+8], 0
; Line 782
$L546:
	cmp	DWORD PTR _right$[ebp+12], 8
	jne	$L550
; Line 785
	mov	eax, OFFSET $SG551
	cmp	DWORD PTR _right$[ebp+8], 0
	jg	$L612
	mov	eax, OFFSET $SG552
$L612:
	push	eax
	movsx	eax, BYTE PTR _c_left$[ebp]
	push	eax
	push	OFFSET $SG553
	call	_as_warn
	add	esp, 12					; 0000000cH
; Line 786
	mov	DWORD PTR _right$[ebp+12], 0
; Line 787
	mov	DWORD PTR _right$[ebp], 0
; Line 788
	mov	DWORD PTR _right$[ebp+4], 0
; Line 789
	mov	DWORD PTR _right$[ebp+8], 0
; Line 791
$L550:
	cmp	DWORD PTR _op_left$[ebp], 11		; 0000000bH
	jne	$L554
; Line 802
	mov	eax, DWORD PTR _right$[ebp+8]
	neg	eax
	mov	DWORD PTR _right$[ebp+8], eax
; Line 803
	mov	eax, DWORD PTR _right$[ebp]
	mov	DWORD PTR _symbolP$555[ebp], eax
; Line 804
	mov	eax, DWORD PTR _right$[ebp+4]
	mov	DWORD PTR _right$[ebp], eax
; Line 805
	mov	eax, DWORD PTR _symbolP$555[ebp]
	mov	DWORD PTR _right$[ebp+4], eax
; Line 806
	cmp	DWORD PTR _symbolP$555[ebp], 0
	je	$L556
; Line 808
	mov	DWORD PTR _right$[ebp+12], 9
; Line 810
$L556:
	mov	DWORD PTR _op_left$[ebp], 10		; 0000000aH
; Line 813
$L554:
	cmp	DWORD PTR _op_left$[ebp], 10		; 0000000aH
	jne	$L557
; Line 835
	lea	eax, DWORD PTR _right$[ebp]
	push	eax
	call	_clean_up_expression
	add	esp, 4
; Line 836
	mov	eax, DWORD PTR _resultP$[ebp]
	push	eax
	call	_clean_up_expression
	add	esp, 4
; Line 838
	mov	eax, DWORD PTR _right$[ebp]
	push	eax
	mov	eax, DWORD PTR _resultP$[ebp]
	push	eax
	call	_expr_part
	add	esp, 8
	mov	DWORD PTR _seg1$558[ebp], eax
; Line 839
	mov	eax, DWORD PTR _right$[ebp+4]
	push	eax
	mov	eax, DWORD PTR _resultP$[ebp]
	add	eax, 4
	push	eax
	call	_expr_part
	add	esp, 8
	mov	DWORD PTR _seg2$559[ebp], eax
; Line 840
	cmp	DWORD PTR _seg1$558[ebp], 6
	je	$L561
	cmp	DWORD PTR _seg2$559[ebp], 6
	jne	$L560
$L561:
; Line 841
	mov	DWORD PTR _need_pass_2, 1
; Line 842
	mov	eax, DWORD PTR _resultP$[ebp]
	mov	DWORD PTR [eax+12], 6
; Line 843
	jmp	$L562
$L560:
	cmp	DWORD PTR _seg2$559[ebp], 0
	jne	$L563
; Line 844
	mov	eax, DWORD PTR _seg1$558[ebp]
	mov	ecx, DWORD PTR _resultP$[ebp]
	mov	DWORD PTR [ecx+12], eax
; Line 845
	jmp	$L564
$L563:
; Line 848
	cmp	DWORD PTR _seg1$558[ebp], 4
	je	$L565
	cmp	DWORD PTR _seg1$558[ebp], 0
	je	$L565
	cmp	DWORD PTR _seg2$559[ebp], 4
	je	$L565
	mov	eax, DWORD PTR _seg1$558[ebp]
	cmp	DWORD PTR _seg2$559[ebp], eax
	je	$L565
; Line 858
	mov	eax, DWORD PTR _resultP$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	push	eax
	mov	eax, DWORD PTR _resultP$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax]
	push	eax
	push	OFFSET $SG566
	call	_as_warn
	add	esp, 12					; 0000000cH
; Line 859
	mov	eax, DWORD PTR _resultP$[ebp]
	mov	DWORD PTR [eax+12], 0
; Line 861
	jmp	$L567
$L565:
; Line 862
	mov	eax, DWORD PTR _resultP$[ebp]
	mov	DWORD PTR [eax+12], 9
$L567:
$L564:
$L562:
; Line 864
	mov	eax, DWORD PTR _right$[ebp+8]
	mov	ecx, DWORD PTR _resultP$[ebp]
	add	DWORD PTR [ecx+8], eax
; Line 865
	mov	eax, DWORD PTR _resultP$[ebp]
	push	eax
	call	_clean_up_expression
	add	esp, 4
; Line 867
	jmp	$L568
$L557:
; Line 869
	mov	eax, DWORD PTR _resultP$[ebp]
	cmp	DWORD PTR [eax+12], 4
	je	$L570
	cmp	DWORD PTR _right$[ebp+12], 4
	jne	$L569
$L570:
; Line 871
	mov	eax, DWORD PTR _resultP$[ebp]
	mov	DWORD PTR [eax+12], 6
; Line 872
	mov	DWORD PTR _need_pass_2, 1
; Line 874
	jmp	$L571
$L569:
; Line 876
	mov	eax, DWORD PTR _resultP$[ebp]
	mov	DWORD PTR [eax+4], 0
; Line 877
	mov	eax, DWORD PTR _resultP$[ebp]
	mov	DWORD PTR [eax], 0
; Line 879
	mov	eax, DWORD PTR _resultP$[ebp]
	cmp	DWORD PTR [eax+12], 0
	jne	$L573
	cmp	DWORD PTR _right$[ebp+12], 0
	je	$L572
$L573:
; Line 881
	push	OFFSET $SG574
	call	_as_warn
	add	esp, 4
; Line 882
	mov	eax, DWORD PTR _resultP$[ebp]
	mov	DWORD PTR [eax+12], 0
; Line 883
	mov	eax, DWORD PTR _resultP$[ebp]
	mov	DWORD PTR [eax+8], 0
; Line 885
	jmp	$L575
$L572:
; Line 887
	mov	eax, DWORD PTR _op_left$[ebp]
	mov	DWORD PTR -48+[ebp], eax
	jmp	$L576
; Line 889
$L580:
; Line 890
	mov	eax, DWORD PTR _right$[ebp+8]
	mov	ecx, DWORD PTR _resultP$[ebp]
	or	DWORD PTR [ecx+8], eax
; Line 891
	jmp	$L577
; Line 893
$L581:
; Line 894
	cmp	DWORD PTR _right$[ebp+8], 0
	je	$L582
; Line 896
	mov	eax, DWORD PTR _resultP$[ebp]
	mov	eax, DWORD PTR [eax+8]
	cdq
	idiv	DWORD PTR _right$[ebp+8]
	mov	eax, DWORD PTR _resultP$[ebp]
	mov	DWORD PTR [eax+8], edx
; Line 898
	jmp	$L583
$L582:
; Line 900
	push	OFFSET $SG584
	call	_as_warn
	add	esp, 4
; Line 901
	mov	eax, DWORD PTR _resultP$[ebp]
	mov	DWORD PTR [eax+8], 0
; Line 902
$L583:
; Line 903
	jmp	$L577
; Line 905
$L585:
; Line 906
	mov	eax, DWORD PTR _right$[ebp+8]
	mov	ecx, DWORD PTR _resultP$[ebp]
	and	DWORD PTR [ecx+8], eax
; Line 907
	jmp	$L577
; Line 909
$L586:
; Line 910
	mov	eax, DWORD PTR _resultP$[ebp]
	mov	eax, DWORD PTR [eax+8]
	imul	eax, DWORD PTR _right$[ebp+8]
	mov	ecx, DWORD PTR _resultP$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 911
	jmp	$L577
; Line 913
$L587:
; Line 914
	cmp	DWORD PTR _right$[ebp+8], 0
	je	$L588
; Line 916
	mov	eax, DWORD PTR _resultP$[ebp]
	mov	eax, DWORD PTR [eax+8]
	cdq
	idiv	DWORD PTR _right$[ebp+8]
	mov	ecx, DWORD PTR _resultP$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 918
	jmp	$L589
$L588:
; Line 920
	push	OFFSET $SG590
	call	_as_warn
	add	esp, 4
; Line 921
	mov	eax, DWORD PTR _resultP$[ebp]
	mov	DWORD PTR [eax+8], 0
; Line 922
$L589:
; Line 923
	jmp	$L577
; Line 925
$L591:
; Line 926
	mov	eax, DWORD PTR _resultP$[ebp]
	mov	cl, BYTE PTR _right$[ebp+8]
	shl	DWORD PTR [eax+8], cl
; Line 927
	jmp	$L577
; Line 929
$L592:
; Line 930
	mov	eax, DWORD PTR _resultP$[ebp]
	mov	cl, BYTE PTR _right$[ebp+8]
	sar	DWORD PTR [eax+8], cl
; Line 931
	jmp	$L577
; Line 933
$L593:
; Line 934
	mov	eax, DWORD PTR _right$[ebp+8]
	mov	ecx, DWORD PTR _resultP$[ebp]
	xor	DWORD PTR [ecx+8], eax
; Line 935
	jmp	$L577
; Line 937
$L594:
; Line 938
	mov	eax, DWORD PTR _right$[ebp+8]
	not	eax
	mov	ecx, DWORD PTR _resultP$[ebp]
	or	DWORD PTR [ecx+8], eax
; Line 939
	jmp	$L577
; Line 941
$L595:
; Line 942
	push	OFFSET $SG596
	push	942					; 000003aeH
	mov	eax, DWORD PTR _op_left$[ebp]
	push	eax
	push	OFFSET $SG597
	call	_as_fatal
	add	esp, 16					; 00000010H
; Line 943
	jmp	$L577
; Line 944
	jmp	$L577
$L576:
	dec	DWORD PTR -48+[ebp]
	cmp	DWORD PTR -48+[ebp], 8
	ja	$L595
	shl	DWORD PTR -48+[ebp], 2
	mov	eax, DWORD PTR -48+[ebp]
	jmp	DWORD PTR $L613[eax]
$L613:
	DD	OFFSET $L586
	DD	OFFSET $L587
	DD	OFFSET $L581
	DD	OFFSET $L591
	DD	OFFSET $L592
	DD	OFFSET $L580
	DD	OFFSET $L594
	DD	OFFSET $L593
	DD	OFFSET $L585
$L577:
; Line 945
$L575:
; Line 946
$L571:
; Line 947
$L568:
; Line 948
$L545:
; Line 949
	mov	eax, DWORD PTR _op_right$[ebp]
	mov	DWORD PTR _op_left$[ebp], eax
; Line 950
	jmp	$L535
$L536:
; Line 951
	mov	eax, DWORD PTR _resultP$[ebp]
	mov	eax, DWORD PTR [eax+12]
	jmp	$L528
; Line 952
$L528:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_expr	ENDP
_c$ = -4
_get_symbol_end PROC NEAR
; Line 971
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 974
$L601:
	mov	eax, DWORD PTR _input_line_pointer
	mov	al, BYTE PTR [eax]
	mov	BYTE PTR _c$[ebp], al
	inc	DWORD PTR _input_line_pointer
	movsx	eax, BYTE PTR _c$[ebp]
	movsx	eax, BYTE PTR _lex_type[eax]
	test	al, 1
	je	$L602
; Line 975
	jmp	$L601
$L602:
; Line 976
	dec	DWORD PTR _input_line_pointer
	mov	eax, DWORD PTR _input_line_pointer
	mov	BYTE PTR [eax], 0
; Line 977
	mov	al, BYTE PTR _c$[ebp]
	jmp	$L598
; Line 978
$L598:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_get_symbol_end ENDP
_TEXT	ENDS
END
