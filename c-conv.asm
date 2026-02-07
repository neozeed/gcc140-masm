	TITLE	c-conv.c
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
PUBLIC	_convert
EXTRN	_integer_zerop:NEAR
EXTRN	_type_for_size:NEAR
EXTRN	_type_precision:NEAR
EXTRN	_error:NEAR
EXTRN	_build_int_2:NEAR
EXTRN	_null_pointer_node:DWORD
EXTRN	_build:NEAR
_DATA	SEGMENT
$SG464	DB	'cannot convert to a pointer type', 00H
_DATA	ENDS
_TEXT	SEGMENT
; File c-conv.c
_type$ = 8
_expr$ = 12
_intype$ = -4
_form$ = -8
_convert_to_pointer PROC NEAR
; Line 51
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 52
	mov	eax, DWORD PTR _expr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _intype$[ebp], eax
; Line 53
	mov	eax, DWORD PTR _intype$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _form$[ebp], eax
; Line 55
	mov	eax, DWORD PTR _expr$[ebp]
	push	eax
	call	_integer_zerop
	add	esp, 4
	or	eax, eax
	je	$L456
; Line 57
	mov	eax, DWORD PTR _null_pointer_node
	mov	ecx, DWORD PTR _type$[ebp]
	cmp	DWORD PTR [eax+8], ecx
	jne	$L457
; Line 58
	mov	eax, DWORD PTR _null_pointer_node
	jmp	$L453
; Line 59
$L457:
	push	0
	push	0
	call	_build_int_2
	add	esp, 8
	mov	DWORD PTR _expr$[ebp], eax
; Line 60
	mov	eax, DWORD PTR _type$[ebp]
	mov	ecx, DWORD PTR _expr$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 61
	mov	eax, DWORD PTR _expr$[ebp]
	jmp	$L453
; Line 64
$L456:
	cmp	DWORD PTR _form$[ebp], 11		; 0000000bH
	jne	$L458
; Line 65
	mov	eax, DWORD PTR _expr$[ebp]
	push	eax
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	push	113					; 00000071H
	call	_build
	add	esp, 12					; 0000000cH
	jmp	$L453
; Line 68
$L458:
	cmp	DWORD PTR _form$[ebp], 5
	je	$L460
	cmp	DWORD PTR _form$[ebp], 8
	jne	$L459
$L460:
; Line 70
	mov	eax, DWORD PTR _intype$[ebp]
	push	eax
	call	_type_precision
	add	esp, 4
	cmp	eax, 32					; 00000020H
	jne	$L462
; Line 71
	mov	eax, DWORD PTR _expr$[ebp]
	push	eax
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	push	112					; 00000070H
	call	_build
	add	esp, 12					; 0000000cH
	jmp	$L453
; Line 72
$L462:
; Line 74
	mov	eax, DWORD PTR _expr$[ebp]
	push	eax
	push	0
	push	32					; 00000020H
	call	_type_for_size
	add	esp, 8
	push	eax
	call	_convert
	add	esp, 8
	push	eax
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_convert_to_pointer
	add	esp, 8
	jmp	$L453
; Line 77
$L459:
	push	OFFSET $SG464
	call	_error
	add	esp, 4
; Line 79
	mov	eax, DWORD PTR _null_pointer_node
	jmp	$L453
; Line 80
$L453:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_convert_to_pointer ENDP
_TEXT	ENDS
EXTRN	_make_node:NEAR
EXTRN	__fltused:NEAR
EXTRN	_atof:NEAR
EXTRN	_flag_float_store:DWORD
_DATA	SEGMENT
	ORG $+3
$SG475	DB	'pointer value used where a float was expected', 00H
	ORG $+2
$SG477	DB	'aggregate value used where a float was expected', 00H
$SG479	DB	'0.0', 00H
_DATA	ENDS
_TEXT	SEGMENT
_type$ = 8
_expr$ = 12
_form$ = -4
_tem$478 = -8
_convert_to_real PROC NEAR
; Line 85
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 86
	mov	eax, DWORD PTR _expr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _form$[ebp], eax
; Line 89
	cmp	DWORD PTR _form$[ebp], 6
	jne	$L471
; Line 91
	mov	eax, DWORD PTR _expr$[ebp]
	push	eax
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	cmp	DWORD PTR _flag_float_store, 1
	sbb	eax, eax
	and	eax, 1
	add	eax, 112				; 00000070H
	push	eax
	call	_build
	add	esp, 12					; 0000000cH
	jmp	$L468
; Line 93
$L471:
	cmp	DWORD PTR _form$[ebp], 5
	je	$L473
	cmp	DWORD PTR _form$[ebp], 8
	jne	$L472
$L473:
; Line 94
	mov	eax, DWORD PTR _expr$[ebp]
	push	eax
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	push	81					; 00000051H
	call	_build
	add	esp, 12					; 0000000cH
	jmp	$L468
; Line 96
$L472:
	cmp	DWORD PTR _form$[ebp], 11		; 0000000bH
	jne	$L474
; Line 97
	push	OFFSET $SG475
	call	_error
	add	esp, 4
; Line 98
	jmp	$L476
$L474:
; Line 99
	push	OFFSET $SG477
	call	_error
	add	esp, 4
$L476:
; Line 102
	push	36					; 00000024H
	call	_make_node
	add	esp, 4
	mov	DWORD PTR _tem$478[ebp], eax
; Line 103
	mov	eax, DWORD PTR _type$[ebp]
	mov	ecx, DWORD PTR _tem$478[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 104
	push	OFFSET $SG479
	call	_atof
	add	esp, 4
	mov	eax, DWORD PTR _tem$478[ebp]
	fstp	QWORD PTR [eax+24]
; Line 105
	mov	eax, DWORD PTR _tem$478[ebp]
	jmp	$L468
; Line 107
$L468:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_convert_to_real ENDP
_TEXT	ENDS
EXTRN	_get_unwidened:NEAR
EXTRN	_unsigned_type:NEAR
EXTRN	_signed_type:NEAR
EXTRN	_integer_zero_node:DWORD
EXTRN	_build_binary_op_nodefault:NEAR
EXTRN	_build_unary_op:NEAR
EXTRN	_fold:NEAR
_DATA	SEGMENT
$SG535	DB	'aggregate value used where an integer was expected', 00H
_DATA	ENDS
_TEXT	SEGMENT
_arg0$513 = -36
_arg1$514 = -32
_typex$517 = -40
_typex$522 = -44
_arg1$527 = -48
_arg2$528 = -52
_typex$531 = -56
_tem$536 = -60
_type$ = 8
_expr$ = 12
_intype$ = -4
_form$ = -8
_outprec$493 = -12
_inprec$494 = -20
_ex_form$495 = -16
_arg0$509 = -28
_arg1$510 = -24
_convert_to_integer PROC NEAR
; Line 115
	push	ebp
	mov	ebp, esp
	sub	esp, 64					; 00000040H
	push	ebx
	push	esi
	push	edi
; Line 116
	mov	eax, DWORD PTR _expr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _intype$[ebp], eax
; Line 117
	mov	eax, DWORD PTR _intype$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _form$[ebp], eax
; Line 121
	cmp	DWORD PTR _form$[ebp], 11		; 0000000bH
	jne	$L487
; Line 123
	mov	eax, DWORD PTR _expr$[ebp]
	push	eax
	call	_integer_zerop
	add	esp, 4
	or	eax, eax
	je	$L488
; Line 124
	mov	eax, DWORD PTR _integer_zero_node
	mov	DWORD PTR _expr$[ebp], eax
; Line 125
	jmp	$L489
$L488:
; Line 127
	mov	eax, DWORD PTR _expr$[ebp]
	push	eax
	push	0
	push	32					; 00000020H
	call	_type_for_size
	add	esp, 8
	push	eax
	push	112					; 00000070H
	call	_build
	add	esp, 12					; 0000000cH
	push	eax
	call	_fold
	add	esp, 4
	mov	DWORD PTR _expr$[ebp], eax
$L489:
; Line 128
	mov	eax, DWORD PTR _expr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _intype$[ebp], eax
; Line 129
	mov	eax, DWORD PTR _intype$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _form$[ebp], eax
; Line 130
	mov	eax, DWORD PTR _type$[ebp]
	cmp	DWORD PTR _intype$[ebp], eax
	jne	$L490
; Line 131
	mov	eax, DWORD PTR _expr$[ebp]
	jmp	$L483
; Line 132
$L490:
; Line 134
$L487:
	cmp	DWORD PTR _form$[ebp], 5
	je	$L492
	cmp	DWORD PTR _form$[ebp], 8
	jne	$L491
$L492:
; Line 136
	mov	eax, DWORD PTR _type$[ebp]
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _outprec$493[ebp], eax
; Line 137
	mov	eax, DWORD PTR _intype$[ebp]
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _inprec$494[ebp], eax
; Line 138
	mov	eax, DWORD PTR _expr$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _ex_form$495[ebp], eax
; Line 140
	mov	eax, DWORD PTR _outprec$493[ebp]
	cmp	DWORD PTR _inprec$494[ebp], eax
	jg	$L496
; Line 141
	mov	eax, DWORD PTR _expr$[ebp]
	push	eax
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	push	113					; 00000071H
	call	_build
	add	esp, 12					; 0000000cH
	jmp	$L483
; Line 163
$L496:
	mov	eax, DWORD PTR _ex_form$495[ebp]
	mov	DWORD PTR -64+[ebp], eax
	jmp	$L497
; Line 165
$L501:
; Line 169
	mov	eax, DWORD PTR _expr$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L503
	mov	eax, DWORD PTR _expr$[ebp]
	mov	eax, DWORD PTR [eax+28]
	cmp	DWORD PTR [eax+20], 0
	jle	$L502
$L503:
; Line 170
	jmp	$L498
; Line 171
$L502:
	jmp	$trunc1$504
; Line 173
$L505:
; Line 177
	mov	eax, DWORD PTR _expr$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L507
	mov	eax, DWORD PTR _expr$[ebp]
	mov	eax, DWORD PTR [eax+28]
	cmp	DWORD PTR [eax+20], 0
	jge	$L506
$L507:
; Line 178
	jmp	$L498
; Line 180
$L506:
	jmp	$trunc1$504
; Line 182
$L508:
; Line 186
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	mov	eax, DWORD PTR _expr$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_get_unwidened
	add	esp, 8
	mov	DWORD PTR _arg0$509[ebp], eax
; Line 187
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	mov	eax, DWORD PTR _expr$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	call	_get_unwidened
	add	esp, 8
	mov	DWORD PTR _arg1$510[ebp], eax
; Line 197
	mov	eax, DWORD PTR _arg0$509[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	cmp	eax, DWORD PTR _outprec$493[ebp]
	jg	$L511
	mov	eax, DWORD PTR _arg1$510[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	cmp	eax, DWORD PTR _outprec$493[ebp]
	jg	$L511
	sub	eax, eax
	mov	ecx, DWORD PTR _arg0$509[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	mov	ecx, DWORD PTR [ecx+16]
	shr	ecx, 12					; 0000000cH
	mov	edx, DWORD PTR _arg1$510[ebp]
	mov	edx, DWORD PTR [edx+8]
	mov	edx, DWORD PTR [edx+16]
	shr	edx, 12					; 0000000cH
	and	edx, 1
	xor	ecx, edx
	and	ecx, 1
	cmp	eax, ecx
	jne	$L511
; Line 198
	jmp	$trunc1$504
; Line 199
$L511:
	jmp	$L498
; Line 202
$L512:
; Line 208
$trunc1$504:
; Line 210
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	mov	eax, DWORD PTR _expr$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_get_unwidened
	add	esp, 8
	mov	DWORD PTR _arg0$513[ebp], eax
; Line 211
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	mov	eax, DWORD PTR _expr$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	call	_get_unwidened
	add	esp, 8
	mov	DWORD PTR _arg1$514[ebp], eax
; Line 216
	jmp	$L516
	mov	eax, DWORD PTR _arg0$513[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	cmp	eax, DWORD PTR _inprec$494[ebp]
	jl	$L516
	mov	eax, DWORD PTR _arg1$514[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	cmp	eax, DWORD PTR _inprec$494[ebp]
	jge	$L515
$L516:
; Line 220
	mov	eax, DWORD PTR _type$[ebp]
	mov	DWORD PTR _typex$517[ebp], eax
; Line 224
	mov	eax, DWORD PTR _typex$517[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 8
	jne	$L518
; Line 226
	mov	eax, DWORD PTR _typex$517[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 12					; 0000000cH
	and	eax, 1
	push	eax
	mov	eax, DWORD PTR _typex$517[ebp]
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	push	eax
	call	_type_for_size
	add	esp, 8
	mov	DWORD PTR _typex$517[ebp], eax
; Line 231
$L518:
	mov	eax, DWORD PTR _typex$517[ebp]
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	cmp	eax, DWORD PTR _inprec$494[ebp]
	je	$L519
; Line 241
	mov	eax, DWORD PTR _expr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 12					; 0000000cH
	test	al, 1
	jne	$L557
	mov	eax, DWORD PTR _arg0$513[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 12					; 0000000cH
	test	al, 1
	je	$L555
$L557:
	mov	eax, DWORD PTR _typex$517[ebp]
	push	eax
	call	_unsigned_type
	add	esp, 4
	mov	DWORD PTR _typex$517[ebp], eax
	jmp	$L556
$L555:
	mov	eax, DWORD PTR _typex$517[ebp]
	push	eax
	call	_signed_type
	add	esp, 4
	mov	DWORD PTR _typex$517[ebp], eax
$L556:
; Line 246
	mov	eax, DWORD PTR _ex_form$495[ebp]
	push	eax
	mov	eax, DWORD PTR _arg1$514[ebp]
	push	eax
	mov	eax, DWORD PTR _typex$517[ebp]
	push	eax
	call	_convert
	add	esp, 8
	push	eax
	mov	eax, DWORD PTR _arg0$513[ebp]
	push	eax
	mov	eax, DWORD PTR _typex$517[ebp]
	push	eax
	call	_convert
	add	esp, 8
	push	eax
	mov	eax, DWORD PTR _ex_form$495[ebp]
	push	eax
	call	_build_binary_op_nodefault
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_convert
	add	esp, 8
	jmp	$L483
; Line 248
$L519:
; Line 249
$L515:
; Line 250
	jmp	$L498
; Line 252
$L520:
; Line 265
	mov	eax, DWORD PTR _type$[ebp]
	mov	ecx, DWORD PTR _expr$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 266
	mov	eax, DWORD PTR _expr$[ebp]
	jmp	$L483
; Line 268
$L521:
; Line 272
	mov	eax, DWORD PTR _type$[ebp]
	mov	DWORD PTR _typex$522[ebp], eax
; Line 276
	mov	eax, DWORD PTR _typex$522[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 8
	jne	$L523
; Line 278
	mov	eax, DWORD PTR _typex$522[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 12					; 0000000cH
	and	eax, 1
	push	eax
	mov	eax, DWORD PTR _typex$522[ebp]
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	push	eax
	call	_type_for_size
	add	esp, 8
	mov	DWORD PTR _typex$522[ebp], eax
; Line 283
$L523:
	mov	eax, DWORD PTR _typex$522[ebp]
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	cmp	eax, DWORD PTR _inprec$494[ebp]
	je	$L524
; Line 288
	mov	eax, DWORD PTR _expr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 12					; 0000000cH
	test	al, 1
	je	$L558
	mov	eax, DWORD PTR _typex$522[ebp]
	push	eax
	call	_unsigned_type
	add	esp, 4
	mov	DWORD PTR _typex$522[ebp], eax
	jmp	$L559
$L558:
	mov	eax, DWORD PTR _typex$522[ebp]
	push	eax
	call	_signed_type
	add	esp, 4
	mov	DWORD PTR _typex$522[ebp], eax
$L559:
; Line 292
	push	1
	mov	eax, DWORD PTR _expr$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	mov	eax, DWORD PTR _typex$522[ebp]
	push	eax
	call	_convert
	add	esp, 8
	push	eax
	mov	eax, DWORD PTR _ex_form$495[ebp]
	push	eax
	call	_build_unary_op
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_convert
	add	esp, 8
	jmp	$L483
; Line 294
$L524:
; Line 296
$L525:
; Line 299
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	mov	eax, DWORD PTR _expr$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_get_unwidened
	add	esp, 8
	push	eax
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_convert
	add	esp, 8
	jmp	$L483
; Line 301
$L526:
; Line 305
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	mov	eax, DWORD PTR _expr$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	call	_get_unwidened
	add	esp, 8
	mov	DWORD PTR _arg1$527[ebp], eax
; Line 306
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	mov	eax, DWORD PTR _expr$[ebp]
	mov	eax, DWORD PTR [eax+32]
	push	eax
	call	_get_unwidened
	add	esp, 8
	mov	DWORD PTR _arg2$528[ebp], eax
; Line 311
	jmp	$L530
	mov	eax, DWORD PTR _arg1$527[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	cmp	eax, DWORD PTR _inprec$494[ebp]
	jl	$L530
	mov	eax, DWORD PTR _arg2$528[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	cmp	eax, DWORD PTR _inprec$494[ebp]
	jge	$L529
$L530:
; Line 315
	mov	eax, DWORD PTR _type$[ebp]
	mov	DWORD PTR _typex$531[ebp], eax
; Line 319
	mov	eax, DWORD PTR _typex$531[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 8
	jne	$L532
; Line 321
	mov	eax, DWORD PTR _typex$531[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 12					; 0000000cH
	and	eax, 1
	push	eax
	mov	eax, DWORD PTR _typex$531[ebp]
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	push	eax
	call	_type_for_size
	add	esp, 8
	mov	DWORD PTR _typex$531[ebp], eax
; Line 326
$L532:
	mov	eax, DWORD PTR _typex$531[ebp]
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	cmp	eax, DWORD PTR _inprec$494[ebp]
	je	$L533
; Line 331
	mov	eax, DWORD PTR _expr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 12					; 0000000cH
	test	al, 1
	je	$L560
	mov	eax, DWORD PTR _typex$531[ebp]
	push	eax
	call	_unsigned_type
	add	esp, 4
	mov	DWORD PTR _typex$531[ebp], eax
	jmp	$L561
$L560:
	mov	eax, DWORD PTR _typex$531[ebp]
	push	eax
	call	_signed_type
	add	esp, 4
	mov	DWORD PTR _typex$531[ebp], eax
$L561:
; Line 336
	mov	eax, DWORD PTR _arg2$528[ebp]
	push	eax
	mov	eax, DWORD PTR _typex$531[ebp]
	push	eax
	call	_convert
	add	esp, 8
	push	eax
	mov	eax, DWORD PTR _arg1$527[ebp]
	push	eax
	mov	eax, DWORD PTR _typex$531[ebp]
	push	eax
	call	_convert
	add	esp, 8
	push	eax
	mov	eax, DWORD PTR _expr$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	mov	eax, DWORD PTR _typex$531[ebp]
	push	eax
	push	60					; 0000003cH
	call	_build
	add	esp, 20					; 00000014H
	push	eax
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_convert
	add	esp, 8
	jmp	$L483
; Line 338
$L533:
; Line 339
$L529:
; Line 341
	jmp	$L498
$L497:
	sub	DWORD PTR -64+[ebp], 60			; 0000003cH
	cmp	DWORD PTR -64+[ebp], 53			; 00000035H
	ja	$L498
	shl	DWORD PTR -64+[ebp], 2
	mov	eax, DWORD PTR -64+[ebp]
	jmp	DWORD PTR $L562[eax]
$L562:
	DD	OFFSET $L526
	DD	OFFSET $L498
	DD	OFFSET $L498
	DD	OFFSET $L498
	DD	OFFSET $L512
	DD	OFFSET $L512
	DD	OFFSET $L508
	DD	OFFSET $L498
	DD	OFFSET $L498
	DD	OFFSET $L498
	DD	OFFSET $L498
	DD	OFFSET $L498
	DD	OFFSET $L498
	DD	OFFSET $L498
	DD	OFFSET $L498
	DD	OFFSET $L498
	DD	OFFSET $L498
	DD	OFFSET $L498
	DD	OFFSET $L498
	DD	OFFSET $L498
	DD	OFFSET $L498
	DD	OFFSET $L498
	DD	OFFSET $L498
	DD	OFFSET $L521
	DD	OFFSET $L508
	DD	OFFSET $L508
	DD	OFFSET $L521
	DD	OFFSET $L498
	DD	OFFSET $L505
	DD	OFFSET $L501
	DD	OFFSET $L498
	DD	OFFSET $L498
	DD	OFFSET $L512
	DD	OFFSET $L512
	DD	OFFSET $L512
	DD	OFFSET $L512
	DD	OFFSET $L521
	DD	OFFSET $L520
	DD	OFFSET $L520
	DD	OFFSET $L520
	DD	OFFSET $L520
	DD	OFFSET $L520
	DD	OFFSET $L520
	DD	OFFSET $L520
	DD	OFFSET $L520
	DD	OFFSET $L520
	DD	OFFSET $L520
	DD	OFFSET $L520
	DD	OFFSET $L498
	DD	OFFSET $L498
	DD	OFFSET $L498
	DD	OFFSET $L498
	DD	OFFSET $L498
	DD	OFFSET $L525
$L498:
; Line 343
	mov	eax, DWORD PTR _expr$[ebp]
	push	eax
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	push	113					; 00000071H
	call	_build
	add	esp, 12					; 0000000cH
	jmp	$L483
; Line 346
$L491:
	cmp	DWORD PTR _form$[ebp], 6
	jne	$L534
; Line 347
	mov	eax, DWORD PTR _expr$[ebp]
	push	eax
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	push	77					; 0000004dH
	call	_build
	add	esp, 12					; 0000000cH
	jmp	$L483
; Line 349
$L534:
	push	OFFSET $SG535
	call	_error
	add	esp, 4
; Line 352
	push	0
	push	0
	call	_build_int_2
	add	esp, 8
	mov	DWORD PTR _tem$536[ebp], eax
; Line 353
	mov	eax, DWORD PTR _type$[ebp]
	mov	ecx, DWORD PTR _tem$536[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 354
	mov	eax, DWORD PTR _tem$536[ebp]
	jmp	$L483
; Line 356
$L483:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_convert_to_integer ENDP
_TEXT	ENDS
EXTRN	_error_mark_node:DWORD
_DATA	SEGMENT
	ORG $+1
$SG546	DB	'void value not ignored as it ought to be', 00H
	ORG $+3
$SG552	DB	'conversion to non-scalar type requested', 00H
_DATA	ENDS
_TEXT	SEGMENT
_type$ = 8
_expr$ = 12
_e$ = -8
_code$ = -4
_convert PROC NEAR
; Line 367
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 368
	mov	eax, DWORD PTR _expr$[ebp]
	mov	DWORD PTR _e$[ebp], eax
; Line 369
	mov	eax, DWORD PTR _type$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _code$[ebp], eax
; Line 371
	mov	eax, DWORD PTR _expr$[ebp]
	mov	ecx, DWORD PTR _type$[ebp]
	cmp	DWORD PTR [eax+8], ecx
	je	$L543
	mov	eax, DWORD PTR _expr$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	or	eax, eax
	jne	$L542
$L543:
; Line 372
	mov	eax, DWORD PTR _expr$[ebp]
	jmp	$L539
; Line 373
$L542:
	mov	eax, DWORD PTR _expr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	or	eax, eax
	jne	$L544
; Line 374
	mov	eax, DWORD PTR _error_mark_node
	jmp	$L539
; Line 375
$L544:
	mov	eax, DWORD PTR _expr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 4
	jne	$L545
; Line 377
	push	OFFSET $SG546
	call	_error
	add	esp, 4
; Line 378
	mov	eax, DWORD PTR _error_mark_node
	jmp	$L539
; Line 380
$L545:
	cmp	DWORD PTR _code$[ebp], 4
	jne	$L547
; Line 381
	mov	eax, DWORD PTR _e$[ebp]
	push	eax
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	push	112					; 00000070H
	call	_build
	add	esp, 12					; 0000000cH
	jmp	$L539
; Line 388
$L547:
	cmp	DWORD PTR _code$[ebp], 5
	je	$L549
	cmp	DWORD PTR _code$[ebp], 8
	jne	$L548
$L549:
; Line 389
	mov	eax, DWORD PTR _e$[ebp]
	push	eax
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_convert_to_integer
	add	esp, 8
	push	eax
	call	_fold
	add	esp, 4
	jmp	$L539
; Line 390
$L548:
	cmp	DWORD PTR _code$[ebp], 11		; 0000000bH
	jne	$L550
; Line 391
	mov	eax, DWORD PTR _e$[ebp]
	push	eax
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_convert_to_pointer
	add	esp, 8
	push	eax
	call	_fold
	add	esp, 4
	jmp	$L539
; Line 392
$L550:
	cmp	DWORD PTR _code$[ebp], 6
	jne	$L551
; Line 393
	mov	eax, DWORD PTR _e$[ebp]
	push	eax
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_convert_to_real
	add	esp, 8
	push	eax
	call	_fold
	add	esp, 4
	jmp	$L539
; Line 395
$L551:
	push	OFFSET $SG552
	call	_error
	add	esp, 4
; Line 396
	mov	eax, DWORD PTR _error_mark_node
	jmp	$L539
; Line 397
$L539:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_convert ENDP
_TEXT	ENDS
END
