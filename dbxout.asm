	TITLE	dbxout.c
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
COMM	_typevec:DWORD
_DATA	ENDS
PUBLIC	_dbxout_types
PUBLIC	_dbxout_symbol
PUBLIC	_dbxout_init
EXTRN	_fprintf:NEAR
EXTRN	_xmalloc:NEAR
EXTRN	_memset:NEAR
EXTRN	_get_permanent_types:NEAR
EXTRN	_integer_type_node:DWORD
EXTRN	_char_type_node:DWORD
_BSS	SEGMENT
_typevec_len$S832 DD 01H DUP (?)
_next_type_number$S833 DD 01H DUP (?)
_next_block_number$S834 DD 01H DUP (?)
_asmfile$S826 DD 01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG854	DB	09H, '.stabs "%s",%d,0,0,Ltext', 0aH, 'Ltext:', 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
; File dbxout.c
_asm_file$ = 8
_input_file_name$ = 12
_dbxout_init PROC NEAR
; Line 181
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 182
	mov	eax, DWORD PTR _asm_file$[ebp]
	mov	DWORD PTR _asmfile$S826, eax
; Line 184
	mov	DWORD PTR _typevec_len$S832, 100	; 00000064H
; Line 185
	mov	eax, DWORD PTR _typevec_len$S832
	shl	eax, 2
	push	eax
	call	_xmalloc
	add	esp, 4
	mov	DWORD PTR _typevec, eax
; Line 186
	mov	eax, DWORD PTR _typevec_len$S832
	shl	eax, 2
	push	eax
	push	0
	mov	eax, DWORD PTR _typevec
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 191
	push	100					; 00000064H
	mov	eax, DWORD PTR _input_file_name$[ebp]
	push	eax
	push	OFFSET $SG854
	mov	eax, DWORD PTR _asmfile$S826
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
; Line 193
	mov	DWORD PTR _next_type_number$S833, 1
; Line 194
	mov	DWORD PTR _next_block_number$S834, 2
; Line 199
	push	0
	mov	eax, DWORD PTR _integer_type_node
	mov	eax, DWORD PTR [eax+56]
	push	eax
	call	_dbxout_symbol
	add	esp, 8
; Line 200
	push	0
	mov	eax, DWORD PTR _char_type_node
	mov	eax, DWORD PTR [eax+56]
	push	eax
	call	_dbxout_symbol
	add	esp, 8
; Line 204
	call	_get_permanent_types
	push	eax
	call	_dbxout_types
	add	esp, 4
; Line 205
$L851:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_dbxout_init ENDP
_TEXT	ENDS
_BSS	SEGMENT
_current_sym_nchars$S838 DD 01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+2
$SG857	DB	'\\', 00H
	ORG $+1
$SG858	DB	'.stabs "', 00H
_DATA	ENDS
_TEXT	SEGMENT
_dbxout_continue PROC NEAR
; Line 215
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 219
	push	OFFSET $SG857
	mov	eax, DWORD PTR _asmfile$S826
	push	eax
	call	_fprintf
	add	esp, 8
; Line 221
	call	_dbxout_finish_symbol
; Line 222
	push	OFFSET $SG858
	mov	eax, DWORD PTR _asmfile$S826
	push	eax
	call	_fprintf
	add	esp, 8
; Line 223
	mov	DWORD PTR _current_sym_nchars$S838, 0
; Line 224
$L856:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_dbxout_continue ENDP
_TEXT	ENDS
EXTRN	_use_gdb_dbx_extensions:DWORD
EXTRN	_strlen:NEAR
EXTRN	_error_mark_node:DWORD
EXTRN	_xrealloc:NEAR
EXTRN	_abort:NEAR
EXTRN	_size_in_bytes:NEAR
EXTRN	__flsbuf:NEAR
_DATA	SEGMENT
	ORG $+3
$SG868	DB	'%d', 00H
	ORG $+1
$SG877	DB	'=', 00H
	ORG $+2
$SG883	DB	'%d', 00H
	ORG $+1
$SG886	DB	'r2;0;127;', 00H
	ORG $+2
$SG888	DB	'r1;%d;%d;', 00H
	ORG $+2
$SG890	DB	'r1;%d;0;', 00H
	ORG $+3
$SG892	DB	'ar1;0;%d;', 00H
	ORG $+2
$SG897	DB	'xs', 00H
	ORG $+1
$SG898	DB	'xu', 00H
	ORG $+1
$SG899	DB	':', 00H
	ORG $+2
$SG900	DB	's%d', 00H
$SG901	DB	'u%d', 00H
$SG912	DB	'%s:', 00H
$SG915	DB	':%s', 00H
$SG918	DB	',0,0;', 00H
	ORG $+2
$SG920	DB	',%d,%d;', 00H
$SG925	DB	'xe', 00H
	ORG $+1
$SG926	DB	':', 00H
	ORG $+2
$SG930	DB	'%s:%d,', 00H
_DATA	ENDS
_TEXT	SEGMENT
_type$ = 8
_full$ = 12
_tem$ = -4
_dbxout_type PROC NEAR
; Line 240
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 246
	mov	eax, DWORD PTR _type$[ebp]
	cmp	DWORD PTR _error_mark_node, eax
	jne	$L863
; Line 247
	mov	eax, DWORD PTR _integer_type_node
	mov	DWORD PTR _type$[ebp], eax
; Line 248
	jmp	$L864
$L863:
; Line 249
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+68]
	mov	DWORD PTR _type$[ebp], eax
$L864:
; Line 251
	mov	eax, DWORD PTR _type$[ebp]
	cmp	DWORD PTR [eax+52], 0
	jne	$L865
; Line 254
	mov	eax, DWORD PTR _next_type_number$S833
	mov	ecx, DWORD PTR _type$[ebp]
	mov	DWORD PTR [ecx+52], eax
	inc	DWORD PTR _next_type_number$S833
; Line 258
	mov	eax, DWORD PTR _typevec_len$S832
	cmp	DWORD PTR _next_type_number$S833, eax
	jne	$L866
; Line 260
	mov	eax, DWORD PTR _typevec_len$S832
	shl	eax, 3
	push	eax
	mov	eax, DWORD PTR _typevec
	push	eax
	call	_xrealloc
	add	esp, 8
	mov	DWORD PTR _typevec, eax
; Line 261
	mov	eax, DWORD PTR _typevec_len$S832
	shl	eax, 2
	push	eax
	push	0
	mov	eax, DWORD PTR _typevec_len$S832
	shl	eax, 2
	add	eax, DWORD PTR _typevec
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 262
	shl	DWORD PTR _typevec_len$S832, 1
; Line 264
$L866:
; Line 267
$L865:
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+52]
	push	eax
	push	OFFSET $SG868
	mov	eax, DWORD PTR _asmfile$S826
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 268
	add	DWORD PTR _current_sym_nchars$S838, 3
; Line 273
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+52]
	mov	ecx, DWORD PTR _typevec
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR -12+[ebp], eax
	jmp	$L869
; Line 275
$L873:
; Line 276
	jmp	$L870
; Line 277
$L874:
; Line 278
	cmp	DWORD PTR _full$[ebp], 0
	jne	$L875
; Line 279
	jmp	$L861
; Line 280
$L875:
	jmp	$L870
; Line 281
$L876:
; Line 282
	jmp	$L861
; Line 283
	jmp	$L870
$L869:
	cmp	DWORD PTR -12+[ebp], 0
	je	$L870
	cmp	DWORD PTR -12+[ebp], 1
	je	$L874
	cmp	DWORD PTR -12+[ebp], 2
	je	$L861
	jmp	$L870
$L870:
; Line 302
	push	OFFSET $SG877
	mov	eax, DWORD PTR _asmfile$S826
	push	eax
	call	_fprintf
	add	esp, 8
; Line 303
	inc	DWORD PTR _current_sym_nchars$S838
; Line 308
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+52]
	mov	ecx, DWORD PTR _typevec
	mov	DWORD PTR [ecx+eax*4], 2
; Line 310
	mov	eax, DWORD PTR _type$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR -16+[ebp], eax
	jmp	$L878
; Line 312
$L882:
; Line 318
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+52]
	push	eax
	push	OFFSET $SG883
	mov	eax, DWORD PTR _asmfile$S826
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 319
	add	DWORD PTR _current_sym_nchars$S838, 3
; Line 320
	jmp	$L879
; Line 322
$L884:
; Line 323
	mov	eax, DWORD PTR _char_type_node
	cmp	DWORD PTR _type$[ebp], eax
	jne	$L885
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 12					; 0000000cH
	test	al, 1
	jne	$L885
; Line 327
	push	OFFSET $SG886
	mov	eax, DWORD PTR _asmfile$S826
	push	eax
	call	_fprintf
	add	esp, 8
; Line 328
	jmp	$L887
$L885:
; Line 332
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+60]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	push	OFFSET $SG888
	mov	eax, DWORD PTR _asmfile$S826
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
$L887:
; Line 333
	add	DWORD PTR _current_sym_nchars$S838, 25	; 00000019H
; Line 334
	jmp	$L879
; Line 336
$L889:
; Line 339
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_size_in_bytes
	add	esp, 4
	mov	eax, DWORD PTR [eax+20]
	push	eax
	push	OFFSET $SG890
	mov	eax, DWORD PTR _asmfile$S826
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 340
	add	DWORD PTR _current_sym_nchars$S838, 16	; 00000010H
; Line 341
	jmp	$L879
; Line 343
$L891:
; Line 351
	mov	eax, DWORD PTR _type$[ebp]
	cmp	DWORD PTR [eax+20], 0
	je	$L1112
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	eax, DWORD PTR [eax+60]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR -8+[ebp], eax
	jmp	$L1113
$L1112:
	mov	DWORD PTR -8+[ebp], -1
$L1113:
	mov	eax, DWORD PTR -8+[ebp]
	push	eax
	push	OFFSET $SG892
	mov	eax, DWORD PTR _asmfile$S826
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 352
	add	DWORD PTR _current_sym_nchars$S838, 17	; 00000011H
; Line 353
	push	0
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_dbxout_type
	add	esp, 8
; Line 354
	jmp	$L879
; Line 356
$L893:
; Line 360
	mov	eax, DWORD PTR _type$[ebp]
	cmp	DWORD PTR [eax+56], 0
	je	$L896
	cmp	DWORD PTR _full$[ebp], 0
	je	$L895
$L896:
	mov	eax, DWORD PTR _type$[ebp]
	cmp	DWORD PTR [eax+28], 0
	jne	$L894
$L895:
; Line 369
	mov	eax, OFFSET $SG897
	mov	ecx, DWORD PTR _type$[ebp]
	mov	cl, BYTE PTR [ecx+12]
	and	ecx, 255				; 000000ffH
	cmp	ecx, 19					; 00000013H
	je	$L1140
	mov	eax, OFFSET $SG898
$L1140:
	push	eax
	mov	eax, DWORD PTR _asmfile$S826
	push	eax
	call	_fprintf
	add	esp, 8
; Line 370
	add	DWORD PTR _current_sym_nchars$S838, 3
; Line 378
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_dbxout_type_name
	add	esp, 4
; Line 379
	push	OFFSET $SG899
	mov	eax, DWORD PTR _asmfile$S826
	push	eax
	call	_fprintf
	add	esp, 8
; Line 380
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+52]
	mov	ecx, DWORD PTR _typevec
	mov	DWORD PTR [ecx+eax*4], 1
; Line 381
	jmp	$L879
; Line 383
$L894:
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_size_in_bytes
	add	esp, 4
	mov	DWORD PTR _tem$[ebp], eax
; Line 385
	mov	eax, DWORD PTR _tem$[ebp]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	mov	eax, OFFSET $SG900
	mov	ecx, DWORD PTR _type$[ebp]
	mov	cl, BYTE PTR [ecx+12]
	and	ecx, 255				; 000000ffH
	cmp	ecx, 19					; 00000013H
	je	$L1141
	mov	eax, OFFSET $SG901
$L1141:
	push	eax
	mov	eax, DWORD PTR _asmfile$S826
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 387
	mov	eax, DWORD PTR _type$[ebp]
	cmp	DWORD PTR [eax+72], 0
	je	$L902
	cmp	DWORD PTR _use_gdb_dbx_extensions, 0
	je	$L902
; Line 389
	mov	eax, DWORD PTR _asmfile$S826
	dec	DWORD PTR [eax+4]
	mov	eax, DWORD PTR _asmfile$S826
	cmp	DWORD PTR [eax+4], 0
	jl	$L1114
	mov	eax, DWORD PTR _asmfile$S826
	mov	eax, DWORD PTR [eax]
	mov	BYTE PTR [eax], 33			; 00000021H
	mov	eax, DWORD PTR _asmfile$S826
	inc	DWORD PTR [eax]
	jmp	$L1115
$L1114:
	mov	eax, DWORD PTR _asmfile$S826
	push	eax
	push	33					; 00000021H
	call	__flsbuf
	add	esp, 8
$L1115:
; Line 391
	mov	eax, DWORD PTR _asmfile$S826
	dec	DWORD PTR [eax+4]
	mov	eax, DWORD PTR _asmfile$S826
	cmp	DWORD PTR [eax+4], 0
	jl	$L1116
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+72]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 1
	and	eax, 1
	cmp	eax, 1
	sbb	eax, eax
	and	eax, -2					; fffffffeH
	add	eax, 50					; 00000032H
	mov	ecx, DWORD PTR _asmfile$S826
	mov	ecx, DWORD PTR [ecx]
	mov	BYTE PTR [ecx], al
	mov	eax, DWORD PTR _asmfile$S826
	inc	DWORD PTR [eax]
	jmp	$L1117
$L1116:
	mov	eax, DWORD PTR _asmfile$S826
	push	eax
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+72]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 1
	and	eax, 1
	cmp	eax, 1
	sbb	eax, eax
	and	eax, -2					; fffffffeH
	add	eax, 50					; 00000032H
	push	eax
	call	__flsbuf
	add	esp, 8
$L1117:
; Line 392
	push	0
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+72]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_dbxout_type
	add	esp, 8
; Line 393
	mov	eax, DWORD PTR _asmfile$S826
	dec	DWORD PTR [eax+4]
	mov	eax, DWORD PTR _asmfile$S826
	cmp	DWORD PTR [eax+4], 0
	jl	$L1118
	mov	eax, DWORD PTR _asmfile$S826
	mov	eax, DWORD PTR [eax]
	mov	BYTE PTR [eax], 44			; 0000002cH
	mov	eax, DWORD PTR _asmfile$S826
	inc	DWORD PTR [eax]
	jmp	$L1119
$L1118:
	mov	eax, DWORD PTR _asmfile$S826
	push	eax
	push	44					; 0000002cH
	call	__flsbuf
	add	esp, 8
$L1119:
; Line 394
	add	DWORD PTR _current_sym_nchars$S838, 3
; Line 396
$L902:
	add	DWORD PTR _current_sym_nchars$S838, 11	; 0000000bH
; Line 398
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _tem$[ebp], eax
	jmp	$L903
$L904:
	mov	eax, DWORD PTR _tem$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _tem$[ebp], eax
$L903:
	cmp	DWORD PTR _tem$[ebp], 0
	je	$L905
; Line 402
	mov	eax, DWORD PTR _tem$[ebp]
	cmp	DWORD PTR [eax+40], 0
	je	$L906
; Line 406
	mov	eax, DWORD PTR _type$[ebp]
	mov	ecx, DWORD PTR _tem$[ebp]
	cmp	DWORD PTR [eax+20], ecx
	je	$L907
; Line 407
$L908:
	cmp	DWORD PTR _current_sym_nchars$S838, 80	; 00000050H
	jle	$L911
	call	_dbxout_continue
$L911:
$L909:
$L910:
; Line 408
$L907:
	mov	eax, DWORD PTR _tem$[ebp]
	mov	eax, DWORD PTR [eax+40]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	OFFSET $SG912
	mov	eax, DWORD PTR _asmfile$S826
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 409
	mov	eax, DWORD PTR _tem$[ebp]
	mov	eax, DWORD PTR [eax+40]
	mov	eax, DWORD PTR [eax+20]
	add	eax, 2
	add	DWORD PTR _current_sym_nchars$S838, eax
; Line 438
	push	0
	mov	eax, DWORD PTR _tem$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_dbxout_type
	add	esp, 8
; Line 440
	mov	eax, DWORD PTR _tem$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 43					; 0000002bH
	jne	$L913
; Line 442
	cmp	DWORD PTR _use_gdb_dbx_extensions, 0
	je	$L914
; Line 445
	mov	eax, DWORD PTR _tem$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	OFFSET $SG915
	mov	eax, DWORD PTR _asmfile$S826
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 446
	mov	eax, DWORD PTR _tem$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_strlen
	add	esp, 4
	add	eax, 2
	add	DWORD PTR _current_sym_nchars$S838, eax
; Line 448
	jmp	$L917
$L914:
; Line 450
	push	OFFSET $SG918
	mov	eax, DWORD PTR _asmfile$S826
	push	eax
	call	_fprintf
	add	esp, 8
; Line 451
	add	DWORD PTR _current_sym_nchars$S838, 5
; Line 452
$L917:
; Line 454
	jmp	$L919
$L913:
; Line 458
	mov	eax, DWORD PTR _tem$[ebp]
	mov	al, BYTE PTR [eax+36]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _tem$[ebp]
	mov	ecx, DWORD PTR [ecx+28]
	imul	eax, DWORD PTR [ecx+20]
	push	eax
	mov	eax, DWORD PTR _tem$[ebp]
	mov	eax, DWORD PTR [eax+48]
	push	eax
	push	OFFSET $SG920
	mov	eax, DWORD PTR _asmfile$S826
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
; Line 459
	add	DWORD PTR _current_sym_nchars$S838, 23	; 00000017H
; Line 460
$L919:
; Line 463
$L906:
	jmp	$L904
$L905:
	mov	eax, DWORD PTR _asmfile$S826
	dec	DWORD PTR [eax+4]
	mov	eax, DWORD PTR _asmfile$S826
	cmp	DWORD PTR [eax+4], 0
	jl	$L1120
	mov	eax, DWORD PTR _asmfile$S826
	mov	eax, DWORD PTR [eax]
	mov	BYTE PTR [eax], 59			; 0000003bH
	mov	eax, DWORD PTR _asmfile$S826
	inc	DWORD PTR [eax]
	jmp	$L1121
$L1120:
	mov	eax, DWORD PTR _asmfile$S826
	push	eax
	push	59					; 0000003bH
	call	__flsbuf
	add	esp, 8
$L1121:
; Line 464
	inc	DWORD PTR _current_sym_nchars$S838
; Line 465
	jmp	$L879
; Line 467
$L921:
; Line 469
	mov	eax, DWORD PTR _type$[ebp]
	cmp	DWORD PTR [eax+56], 0
	je	$L924
	cmp	DWORD PTR _full$[ebp], 0
	je	$L923
$L924:
	mov	eax, DWORD PTR _type$[ebp]
	cmp	DWORD PTR [eax+28], 0
	jne	$L922
$L923:
; Line 471
	push	OFFSET $SG925
	mov	eax, DWORD PTR _asmfile$S826
	push	eax
	call	_fprintf
	add	esp, 8
; Line 472
	add	DWORD PTR _current_sym_nchars$S838, 3
; Line 473
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_dbxout_type_name
	add	esp, 4
; Line 474
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+52]
	mov	ecx, DWORD PTR _typevec
	mov	DWORD PTR [ecx+eax*4], 1
; Line 475
	push	OFFSET $SG926
	mov	eax, DWORD PTR _asmfile$S826
	push	eax
	call	_fprintf
	add	esp, 8
; Line 476
	jmp	$L861
; Line 478
$L922:
	mov	eax, DWORD PTR _asmfile$S826
	dec	DWORD PTR [eax+4]
	mov	eax, DWORD PTR _asmfile$S826
	cmp	DWORD PTR [eax+4], 0
	jl	$L1122
	mov	eax, DWORD PTR _asmfile$S826
	mov	eax, DWORD PTR [eax]
	mov	BYTE PTR [eax], 101			; 00000065H
	mov	eax, DWORD PTR _asmfile$S826
	inc	DWORD PTR [eax]
	jmp	$L1123
$L1122:
	mov	eax, DWORD PTR _asmfile$S826
	push	eax
	push	101					; 00000065H
	call	__flsbuf
	add	esp, 8
$L1123:
; Line 479
	inc	DWORD PTR _current_sym_nchars$S838
; Line 480
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _tem$[ebp], eax
	jmp	$L927
$L928:
	mov	eax, DWORD PTR _tem$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _tem$[ebp], eax
$L927:
	cmp	DWORD PTR _tem$[ebp], 0
	je	$L929
; Line 483
	mov	eax, DWORD PTR _tem$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	mov	eax, DWORD PTR _tem$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	OFFSET $SG930
	mov	eax, DWORD PTR _asmfile$S826
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
; Line 484
	mov	eax, DWORD PTR _tem$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	eax, DWORD PTR [eax+20]
	add	eax, 11					; 0000000bH
	add	DWORD PTR _current_sym_nchars$S838, eax
; Line 485
	mov	eax, DWORD PTR _tem$[ebp]
	cmp	DWORD PTR [eax+4], 0
	je	$L931
; Line 486
$L932:
	cmp	DWORD PTR _current_sym_nchars$S838, 80	; 00000050H
	jle	$L935
	call	_dbxout_continue
$L935:
$L933:
$L934:
; Line 487
$L931:
	jmp	$L928
$L929:
; Line 488
	mov	eax, DWORD PTR _asmfile$S826
	dec	DWORD PTR [eax+4]
	mov	eax, DWORD PTR _asmfile$S826
	cmp	DWORD PTR [eax+4], 0
	jl	$L1124
	mov	eax, DWORD PTR _asmfile$S826
	mov	eax, DWORD PTR [eax]
	mov	BYTE PTR [eax], 59			; 0000003bH
	mov	eax, DWORD PTR _asmfile$S826
	inc	DWORD PTR [eax]
	jmp	$L1125
$L1124:
	mov	eax, DWORD PTR _asmfile$S826
	push	eax
	push	59					; 0000003bH
	call	__flsbuf
	add	esp, 8
$L1125:
; Line 489
	inc	DWORD PTR _current_sym_nchars$S838
; Line 490
	jmp	$L879
; Line 492
$L936:
; Line 493
	mov	eax, DWORD PTR _asmfile$S826
	dec	DWORD PTR [eax+4]
	mov	eax, DWORD PTR _asmfile$S826
	cmp	DWORD PTR [eax+4], 0
	jl	$L1126
	mov	eax, DWORD PTR _asmfile$S826
	mov	eax, DWORD PTR [eax]
	mov	BYTE PTR [eax], 42			; 0000002aH
	mov	eax, DWORD PTR _asmfile$S826
	inc	DWORD PTR [eax]
	jmp	$L1127
$L1126:
	mov	eax, DWORD PTR _asmfile$S826
	push	eax
	push	42					; 0000002aH
	call	__flsbuf
	add	esp, 8
$L1127:
; Line 494
	inc	DWORD PTR _current_sym_nchars$S838
; Line 495
	push	0
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_dbxout_type
	add	esp, 8
; Line 496
	jmp	$L879
; Line 498
$L937:
; Line 499
	cmp	DWORD PTR _use_gdb_dbx_extensions, 0
	je	$L938
; Line 501
	mov	eax, DWORD PTR _asmfile$S826
	dec	DWORD PTR [eax+4]
	mov	eax, DWORD PTR _asmfile$S826
	cmp	DWORD PTR [eax+4], 0
	jl	$L1128
	mov	eax, DWORD PTR _asmfile$S826
	mov	eax, DWORD PTR [eax]
	mov	BYTE PTR [eax], 64			; 00000040H
	mov	eax, DWORD PTR _asmfile$S826
	inc	DWORD PTR [eax]
	jmp	$L1129
$L1128:
	mov	eax, DWORD PTR _asmfile$S826
	push	eax
	push	64					; 00000040H
	call	__flsbuf
	add	esp, 8
$L1129:
; Line 502
	inc	DWORD PTR _current_sym_nchars$S838
; Line 503
	push	0
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+60]
	push	eax
	call	_dbxout_type
	add	esp, 8
; Line 504
	mov	eax, DWORD PTR _asmfile$S826
	dec	DWORD PTR [eax+4]
	mov	eax, DWORD PTR _asmfile$S826
	cmp	DWORD PTR [eax+4], 0
	jl	$L1130
	mov	eax, DWORD PTR _asmfile$S826
	mov	eax, DWORD PTR [eax]
	mov	BYTE PTR [eax], 44			; 0000002cH
	mov	eax, DWORD PTR _asmfile$S826
	inc	DWORD PTR [eax]
	jmp	$L1131
$L1130:
	mov	eax, DWORD PTR _asmfile$S826
	push	eax
	push	44					; 0000002cH
	call	__flsbuf
	add	esp, 8
$L1131:
; Line 505
	inc	DWORD PTR _current_sym_nchars$S838
; Line 506
	push	0
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_dbxout_type
	add	esp, 8
; Line 508
	jmp	$L939
$L938:
; Line 511
	push	0
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_dbxout_type
	add	esp, 8
; Line 512
$L939:
; Line 513
	jmp	$L879
; Line 515
$L940:
; Line 516
	cmp	DWORD PTR _use_gdb_dbx_extensions, 0
	je	$L941
; Line 518
	mov	eax, DWORD PTR _asmfile$S826
	dec	DWORD PTR [eax+4]
	mov	eax, DWORD PTR _asmfile$S826
	cmp	DWORD PTR [eax+4], 0
	jl	$L1132
	mov	eax, DWORD PTR _asmfile$S826
	mov	eax, DWORD PTR [eax]
	mov	BYTE PTR [eax], 64			; 00000040H
	mov	eax, DWORD PTR _asmfile$S826
	inc	DWORD PTR [eax]
	jmp	$L1133
$L1132:
	mov	eax, DWORD PTR _asmfile$S826
	push	eax
	push	64					; 00000040H
	call	__flsbuf
	add	esp, 8
$L1133:
; Line 519
	inc	DWORD PTR _current_sym_nchars$S838
; Line 520
	push	0
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+60]
	push	eax
	call	_dbxout_type
	add	esp, 8
; Line 521
	mov	eax, DWORD PTR _asmfile$S826
	dec	DWORD PTR [eax+4]
	mov	eax, DWORD PTR _asmfile$S826
	cmp	DWORD PTR [eax+4], 0
	jl	$L1134
	mov	eax, DWORD PTR _asmfile$S826
	mov	eax, DWORD PTR [eax]
	mov	BYTE PTR [eax], 44			; 0000002cH
	mov	eax, DWORD PTR _asmfile$S826
	inc	DWORD PTR [eax]
	jmp	$L1135
$L1134:
	mov	eax, DWORD PTR _asmfile$S826
	push	eax
	push	44					; 0000002cH
	call	__flsbuf
	add	esp, 8
$L1135:
; Line 522
	inc	DWORD PTR _current_sym_nchars$S838
; Line 523
	push	0
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_dbxout_type
	add	esp, 8
; Line 525
	jmp	$L942
$L941:
; Line 528
	push	0
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_dbxout_type
	add	esp, 8
; Line 529
$L942:
; Line 530
	jmp	$L879
; Line 532
$L943:
; Line 533
	mov	eax, DWORD PTR _asmfile$S826
	dec	DWORD PTR [eax+4]
	mov	eax, DWORD PTR _asmfile$S826
	cmp	DWORD PTR [eax+4], 0
	jl	$L1136
	cmp	DWORD PTR _use_gdb_dbx_extensions, 1
	sbb	eax, eax
	and	eax, 4
	add	eax, 38					; 00000026H
	mov	ecx, DWORD PTR _asmfile$S826
	mov	ecx, DWORD PTR [ecx]
	mov	BYTE PTR [ecx], al
	mov	eax, DWORD PTR _asmfile$S826
	inc	DWORD PTR [eax]
	jmp	$L1137
$L1136:
	mov	eax, DWORD PTR _asmfile$S826
	push	eax
	cmp	DWORD PTR _use_gdb_dbx_extensions, 1
	sbb	eax, eax
	and	eax, 4
	add	eax, 38					; 00000026H
	push	eax
	call	__flsbuf
	add	esp, 8
$L1137:
; Line 534
	inc	DWORD PTR _current_sym_nchars$S838
; Line 535
	push	0
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_dbxout_type
	add	esp, 8
; Line 536
	jmp	$L879
; Line 538
$L944:
; Line 539
	mov	eax, DWORD PTR _asmfile$S826
	dec	DWORD PTR [eax+4]
	mov	eax, DWORD PTR _asmfile$S826
	cmp	DWORD PTR [eax+4], 0
	jl	$L1138
	mov	eax, DWORD PTR _asmfile$S826
	mov	eax, DWORD PTR [eax]
	mov	BYTE PTR [eax], 102			; 00000066H
	mov	eax, DWORD PTR _asmfile$S826
	inc	DWORD PTR [eax]
	jmp	$L1139
$L1138:
	mov	eax, DWORD PTR _asmfile$S826
	push	eax
	push	102					; 00000066H
	call	__flsbuf
	add	esp, 8
$L1139:
; Line 540
	inc	DWORD PTR _current_sym_nchars$S838
; Line 541
	push	0
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_dbxout_type
	add	esp, 8
; Line 542
	jmp	$L879
; Line 544
$L945:
; Line 545
	call	_abort
; Line 546
	jmp	$L879
$L878:
	sub	DWORD PTR -16+[ebp], 4
	cmp	DWORD PTR -16+[ebp], 17			; 00000011H
	ja	$L945
	shl	DWORD PTR -16+[ebp], 2
	mov	eax, DWORD PTR -16+[ebp]
	jmp	DWORD PTR $L1142[eax]
$L1142:
	DD	OFFSET $L882
	DD	OFFSET $L884
	DD	OFFSET $L889
	DD	OFFSET $L945
	DD	OFFSET $L921
	DD	OFFSET $L945
	DD	OFFSET $L945
	DD	OFFSET $L936
	DD	OFFSET $L940
	DD	OFFSET $L943
	DD	OFFSET $L937
	DD	OFFSET $L945
	DD	OFFSET $L891
	DD	OFFSET $L945
	DD	OFFSET $L945
	DD	OFFSET $L893
	DD	OFFSET $L893
	DD	OFFSET $L944
$L879:
; Line 547
$L861:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_dbxout_type ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG955	DB	'%s', 00H
_DATA	ENDS
_TEXT	SEGMENT
_type$ = 8
_t$ = -4
_dbxout_type_name PROC NEAR
; Line 556
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 558
	mov	eax, DWORD PTR _type$[ebp]
	cmp	DWORD PTR [eax+56], 0
	jne	$L950
; Line 559
	call	_abort
; Line 560
$L950:
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+56]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 1
	jne	$L951
; Line 562
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+56]
	mov	DWORD PTR _t$[ebp], eax
; Line 564
	jmp	$L952
$L951:
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+56]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 42					; 0000002aH
	jne	$L953
; Line 566
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+56]
	mov	eax, DWORD PTR [eax+40]
	mov	DWORD PTR _t$[ebp], eax
; Line 568
	jmp	$L954
$L953:
; Line 569
	call	_abort
$L954:
$L952:
; Line 571
	mov	eax, DWORD PTR _t$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	OFFSET $SG955
	mov	eax, DWORD PTR _asmfile$S826
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 572
	mov	eax, DWORD PTR _t$[ebp]
	mov	eax, DWORD PTR [eax+20]
	add	DWORD PTR _current_sym_nchars$S838, eax
; Line 573
$L948:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_dbxout_type_name ENDP
_TEXT	ENDS
PUBLIC	_dbxout_tags
EXTRN	_gettags:NEAR
EXTRN	_make_node:NEAR
EXTRN	_void_type_node:DWORD
_BSS	SEGMENT
_current_sym_code$S835 DD 01H DUP (?)
_current_sym_value$S836 DD 01H DUP (?)
_current_sym_addr$S837 DD 01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+1
$SG973	DB	'.stabs "%s:%c', 00H
	ORG $+2
$SG978	DB	'.stabs "%s:t', 00H
	ORG $+3
$SG1011	DB	'.stabs "%s:', 00H
_DATA	ENDS
_TEXT	SEGMENT
_type$ = -4
_value$996 = -16
_offset$997 = -12
_decl$ = 8
_local$ = 12
_letter$ = -8
_dbxout_symbol PROC NEAR
; Line 584
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	push	ebx
	push	esi
	push	edi
; Line 585
	mov	DWORD PTR _letter$[ebp], 0
; Line 586
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _type$[ebp], eax
; Line 592
	cmp	DWORD PTR _local$[ebp], 0
	jne	$L961
; Line 594
	call	_gettags
	push	eax
	call	_dbxout_tags
	add	esp, 4
; Line 595
	call	_get_permanent_types
	push	eax
	call	_dbxout_types
	add	esp, 4
; Line 598
$L961:
	mov	DWORD PTR _current_sym_code$S835, 0
; Line 599
	mov	DWORD PTR _current_sym_value$S836, 0
; Line 600
	mov	DWORD PTR _current_sym_addr$S837, 0
; Line 605
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+40]
	mov	eax, DWORD PTR [eax+20]
	add	eax, 2
	mov	DWORD PTR _current_sym_nchars$S838, eax
; Line 607
	mov	eax, DWORD PTR _decl$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR -20+[ebp], eax
	jmp	$L963
; Line 609
$L967:
; Line 611
	jmp	$L964
; Line 613
$L968:
; Line 614
	mov	eax, DWORD PTR _decl$[ebp]
	cmp	DWORD PTR [eax+76], 0
	jne	$L969
; Line 615
	jmp	$L958
; Line 616
$L969:
	mov	eax, DWORD PTR _decl$[ebp]
	test	BYTE PTR [eax+16], 1
	je	$L970
; Line 617
	jmp	$L964
; Line 618
$L970:
; Line 619
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L972
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L971
$L972:
; Line 620
	jmp	$L964
; Line 621
$L971:
; Line 624
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 1
	and	eax, 1
	cmp	eax, 1
	sbb	eax, eax
	and	eax, 32					; 00000020H
	add	eax, 70					; 00000046H
	push	eax
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+40]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	OFFSET $SG973
	mov	eax, DWORD PTR _asmfile$S826
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
; Line 626
	mov	DWORD PTR _current_sym_code$S835, 36	; 00000024H
; Line 627
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _current_sym_addr$S837, eax
; Line 629
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+8], 0
	je	$L974
; Line 630
	push	0
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_dbxout_type
	add	esp, 8
; Line 631
	jmp	$L975
$L974:
; Line 632
	push	0
	mov	eax, DWORD PTR _void_type_node
	push	eax
	call	_dbxout_type
	add	esp, 8
$L975:
; Line 633
	call	_dbxout_finish_symbol
; Line 634
	jmp	$L964
; Line 636
$L976:
; Line 650
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 13					; 0000000dH
	test	al, 1
	je	$L977
; Line 651
	jmp	$L958
; Line 654
$L977:
; Line 656
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+40]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	OFFSET $SG978
	mov	eax, DWORD PTR _asmfile$S826
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 658
	mov	DWORD PTR _current_sym_code$S835, 128	; 00000080H
; Line 660
	push	1
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_dbxout_type
	add	esp, 8
; Line 661
	call	_dbxout_finish_symbol
; Line 664
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	or	eax, 8192				; 00002000H
	mov	ecx, DWORD PTR _decl$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 665
	jmp	$L964
; Line 667
$L979:
; Line 670
	call	_abort
; Line 672
$L980:
; Line 673
	mov	eax, DWORD PTR _decl$[ebp]
	cmp	DWORD PTR [eax+76], 0
	jne	$L981
; Line 674
	jmp	$L958
; Line 677
$L981:
	mov	eax, DWORD PTR _decl$[ebp]
	test	BYTE PTR [eax+16], 1
	je	$L982
; Line 678
	jmp	$L964
; Line 682
$L982:
; Line 684
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L983
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	cmp	DWORD PTR [eax+4], 0
	jl	$L984
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L983
$L984:
; Line 685
	jmp	$L964
; Line 700
$L983:
; Line 701
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L985
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L985
; Line 703
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 1
	test	al, 1
	je	$L986
; Line 705
	mov	DWORD PTR _letter$[ebp], 71		; 00000047H
; Line 706
	mov	DWORD PTR _current_sym_code$S835, 32	; 00000020H
; Line 708
	jmp	$L987
$L986:
; Line 710
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _current_sym_addr$S837, eax
; Line 712
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 8
	and	eax, 1
	cmp	eax, 1
	sbb	eax, eax
	and	eax, 3
	add	eax, 83					; 00000053H
	mov	DWORD PTR _letter$[ebp], eax
; Line 714
	mov	eax, DWORD PTR _decl$[ebp]
	cmp	DWORD PTR [eax+64], 0
	jne	$L988
; Line 715
	mov	DWORD PTR _current_sym_code$S835, 40	; 00000028H
; Line 716
	jmp	$L989
$L988:
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 5
	test	al, 1
	je	$L990
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 3
	test	al, 1
	jne	$L990
; Line 719
	mov	DWORD PTR _current_sym_code$S835, 36	; 00000024H
; Line 720
	jmp	$L991
$L990:
; Line 726
	mov	DWORD PTR _current_sym_code$S835, 38	; 00000026H
; Line 727
$L991:
$L989:
; Line 728
$L987:
; Line 730
	jmp	$L992
$L985:
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L993
; Line 732
	mov	DWORD PTR _letter$[ebp], 114		; 00000072H
; Line 733
	mov	DWORD PTR _current_sym_code$S835, 64	; 00000040H
; Line 734
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	cmp	DWORD PTR [eax+4], 0
	jne	$L1143
	mov	DWORD PTR _current_sym_value$S836, 0
	jmp	$L1144
$L1143:
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	cmp	DWORD PTR [eax+4], 1
	jne	$L1145
	mov	DWORD PTR _current_sym_value$S836, 2
	jmp	$L1146
$L1145:
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	cmp	DWORD PTR [eax+4], 2
	jne	$L1147
	mov	DWORD PTR _current_sym_value$S836, 1
	jmp	$L1148
$L1147:
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	cmp	DWORD PTR [eax+4], 3
	jne	$L1149
	mov	DWORD PTR _current_sym_value$S836, 3
	jmp	$L1150
$L1149:
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	cmp	DWORD PTR [eax+4], 4
	jne	$L1151
	mov	DWORD PTR _current_sym_value$S836, 6
	jmp	$L1152
$L1151:
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	cmp	DWORD PTR [eax+4], 5
	jne	$L1153
	mov	DWORD PTR _current_sym_value$S836, 7
	jmp	$L1154
$L1153:
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	cmp	DWORD PTR [eax+4], 6
	jne	$L1155
	mov	DWORD PTR _current_sym_value$S836, 4
	jmp	$L1156
$L1155:
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	cmp	DWORD PTR [eax+4], 7
	jne	$L1157
	mov	DWORD PTR _current_sym_value$S836, 5
	jmp	$L1158
$L1157:
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	cmp	DWORD PTR [eax+4], 8
	jne	$L1159
	mov	DWORD PTR _current_sym_value$S836, 12	; 0000000cH
	jmp	$L1160
$L1159:
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	cmp	DWORD PTR [eax+4], 9
	jne	$L1161
	mov	DWORD PTR _current_sym_value$S836, 12	; 0000000cH
	jmp	$L1162
$L1161:
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _current_sym_value$S836, eax
$L1162:
$L1160:
$L1158:
$L1156:
$L1154:
$L1152:
$L1150:
$L1148:
$L1146:
$L1144:
; Line 736
	jmp	$L994
$L993:
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L995
; Line 738
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	DWORD PTR _value$996[ebp], eax
; Line 739
	mov	DWORD PTR _offset$997[ebp], 0
; Line 740
$L999:
	mov	eax, DWORD PTR _value$996[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1000
; Line 742
	mov	eax, DWORD PTR _value$996[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	DWORD PTR _offset$997[ebp], eax
; Line 743
	mov	eax, DWORD PTR _value$996[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _value$996[ebp], eax
; Line 744
	jmp	$L999
$L1000:
; Line 745
	mov	DWORD PTR _letter$[ebp], 114		; 00000072H
; Line 746
	mov	DWORD PTR _current_sym_code$S835, 64	; 00000040H
; Line 747
	mov	eax, DWORD PTR _value$996[ebp]
	mov	eax, DWORD PTR [eax+4]
	add	eax, DWORD PTR _offset$997[ebp]
	jne	$L1163
	mov	DWORD PTR _current_sym_value$S836, 0
	jmp	$L1164
$L1163:
	mov	eax, DWORD PTR _value$996[ebp]
	mov	eax, DWORD PTR [eax+4]
	add	eax, DWORD PTR _offset$997[ebp]
	cmp	eax, 1
	jne	$L1165
	mov	DWORD PTR _current_sym_value$S836, 2
	jmp	$L1166
$L1165:
	mov	eax, DWORD PTR _value$996[ebp]
	mov	eax, DWORD PTR [eax+4]
	add	eax, DWORD PTR _offset$997[ebp]
	cmp	eax, 2
	jne	$L1167
	mov	DWORD PTR _current_sym_value$S836, 1
	jmp	$L1168
$L1167:
	mov	eax, DWORD PTR _value$996[ebp]
	mov	eax, DWORD PTR [eax+4]
	add	eax, DWORD PTR _offset$997[ebp]
	cmp	eax, 3
	jne	$L1169
	mov	DWORD PTR _current_sym_value$S836, 3
	jmp	$L1170
$L1169:
	mov	eax, DWORD PTR _value$996[ebp]
	mov	eax, DWORD PTR [eax+4]
	add	eax, DWORD PTR _offset$997[ebp]
	cmp	eax, 4
	jne	$L1171
	mov	DWORD PTR _current_sym_value$S836, 6
	jmp	$L1172
$L1171:
	mov	eax, DWORD PTR _value$996[ebp]
	mov	eax, DWORD PTR [eax+4]
	add	eax, DWORD PTR _offset$997[ebp]
	cmp	eax, 5
	jne	$L1173
	mov	DWORD PTR _current_sym_value$S836, 7
	jmp	$L1174
$L1173:
	mov	eax, DWORD PTR _value$996[ebp]
	mov	eax, DWORD PTR [eax+4]
	add	eax, DWORD PTR _offset$997[ebp]
	cmp	eax, 6
	jne	$L1175
	mov	DWORD PTR _current_sym_value$S836, 4
	jmp	$L1176
$L1175:
	mov	eax, DWORD PTR _value$996[ebp]
	mov	eax, DWORD PTR [eax+4]
	add	eax, DWORD PTR _offset$997[ebp]
	cmp	eax, 7
	jne	$L1177
	mov	DWORD PTR _current_sym_value$S836, 5
	jmp	$L1178
$L1177:
	mov	eax, DWORD PTR _value$996[ebp]
	mov	eax, DWORD PTR [eax+4]
	add	eax, DWORD PTR _offset$997[ebp]
	cmp	eax, 8
	jne	$L1179
	mov	DWORD PTR _current_sym_value$S836, 12	; 0000000cH
	jmp	$L1180
$L1179:
	mov	eax, DWORD PTR _value$996[ebp]
	mov	eax, DWORD PTR [eax+4]
	add	eax, DWORD PTR _offset$997[ebp]
	cmp	eax, 9
	jne	$L1181
	mov	DWORD PTR _current_sym_value$S836, 12	; 0000000cH
	jmp	$L1182
$L1181:
	mov	eax, DWORD PTR _value$996[ebp]
	mov	eax, DWORD PTR [eax+4]
	add	eax, DWORD PTR _offset$997[ebp]
	mov	DWORD PTR _current_sym_value$S836, eax
$L1182:
$L1180:
$L1178:
$L1176:
$L1174:
$L1172:
$L1170:
$L1168:
$L1166:
$L1164:
; Line 749
	jmp	$L1001
$L995:
; Line 752
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1002
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1003
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1002
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 6
	je	$L1002
$L1003:
; Line 761
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1004
; Line 763
	mov	DWORD PTR _letter$[ebp], 114		; 00000072H
; Line 764
	mov	DWORD PTR _current_sym_code$S835, 64	; 00000040H
; Line 765
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 0
	jne	$L1183
	mov	DWORD PTR _current_sym_value$S836, 0
	jmp	$L1184
$L1183:
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 1
	jne	$L1185
	mov	DWORD PTR _current_sym_value$S836, 2
	jmp	$L1186
$L1185:
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 2
	jne	$L1187
	mov	DWORD PTR _current_sym_value$S836, 1
	jmp	$L1188
$L1187:
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 3
	jne	$L1189
	mov	DWORD PTR _current_sym_value$S836, 3
	jmp	$L1190
$L1189:
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 4
	jne	$L1191
	mov	DWORD PTR _current_sym_value$S836, 6
	jmp	$L1192
$L1191:
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 5
	jne	$L1193
	mov	DWORD PTR _current_sym_value$S836, 7
	jmp	$L1194
$L1193:
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 6
	jne	$L1195
	mov	DWORD PTR _current_sym_value$S836, 4
	jmp	$L1196
$L1195:
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jne	$L1197
	mov	DWORD PTR _current_sym_value$S836, 5
	jmp	$L1198
$L1197:
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 8
	jne	$L1199
	mov	DWORD PTR _current_sym_value$S836, 12	; 0000000cH
	jmp	$L1200
$L1199:
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 9
	jne	$L1201
	mov	DWORD PTR _current_sym_value$S836, 12	; 0000000cH
	jmp	$L1202
$L1201:
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _current_sym_value$S836, eax
$L1202:
$L1200:
$L1198:
$L1196:
$L1194:
$L1192:
$L1190:
$L1188:
$L1186:
$L1184:
; Line 767
	jmp	$L1005
$L1004:
; Line 769
	mov	DWORD PTR _current_sym_code$S835, 128	; 00000080H
; Line 772
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _current_sym_value$S836, eax
; Line 773
$L1005:
; Line 778
	push	11					; 0000000bH
	call	_make_node
	add	esp, 4
	mov	DWORD PTR _type$[ebp], eax
; Line 779
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _type$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 781
	jmp	$L1006
$L1002:
; Line 782
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1007
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1007
; Line 784
	mov	DWORD PTR _current_sym_code$S835, 128	; 00000080H
; Line 785
	mov	DWORD PTR _current_sym_value$S836, 0
; Line 787
	jmp	$L1008
$L1007:
; Line 789
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1009
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1009
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1009
; Line 791
	mov	DWORD PTR _current_sym_code$S835, 128	; 00000080H
; Line 794
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _current_sym_value$S836, eax
; Line 796
	jmp	$L1010
$L1009:
; Line 800
	jmp	$L964
$L1010:
$L1008:
$L1006:
$L1001:
$L994:
$L992:
; Line 805
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+40]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	OFFSET $SG1011
	mov	eax, DWORD PTR _asmfile$S826
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 806
	cmp	DWORD PTR _letter$[ebp], 0
	je	$L1012
	mov	eax, DWORD PTR _asmfile$S826
	dec	DWORD PTR [eax+4]
	mov	eax, DWORD PTR _asmfile$S826
	cmp	DWORD PTR [eax+4], 0
	jl	$L1203
	mov	al, BYTE PTR _letter$[ebp]
	mov	ecx, DWORD PTR _asmfile$S826
	mov	ecx, DWORD PTR [ecx]
	mov	BYTE PTR [ecx], al
	mov	eax, DWORD PTR _asmfile$S826
	inc	DWORD PTR [eax]
	jmp	$L1204
$L1203:
	mov	eax, DWORD PTR _asmfile$S826
	push	eax
	mov	eax, DWORD PTR _letter$[ebp]
	push	eax
	call	__flsbuf
	add	esp, 8
$L1204:
; Line 807
$L1012:
	push	0
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_dbxout_type
	add	esp, 8
; Line 808
	call	_dbxout_finish_symbol
; Line 809
	jmp	$L964
; Line 810
	jmp	$L964
$L963:
	cmp	DWORD PTR -20+[ebp], 39			; 00000027H
	je	$L968
	cmp	DWORD PTR -20+[ebp], 41			; 00000029H
	je	$L964
	cmp	DWORD PTR -20+[ebp], 42			; 0000002aH
	je	$L976
	cmp	DWORD PTR -20+[ebp], 43			; 0000002bH
	je	$L980
	cmp	DWORD PTR -20+[ebp], 44			; 0000002cH
	je	$L979
	jmp	$L964
$L964:
; Line 811
$L958:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_dbxout_symbol ENDP
_TEXT	ENDS
EXTRN	_output_addr_const:NEAR
_DATA	SEGMENT
$SG1014	DB	'",%d,0,0,', 00H
	ORG $+2
$SG1018	DB	'%d', 00H
_DATA	ENDS
_TEXT	SEGMENT
_dbxout_finish_symbol PROC NEAR
; Line 815
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 816
	mov	eax, DWORD PTR _current_sym_code$S835
	push	eax
	push	OFFSET $SG1014
	mov	eax, DWORD PTR _asmfile$S826
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 817
	cmp	DWORD PTR _current_sym_addr$S837, 0
	je	$L1015
; Line 818
	mov	eax, DWORD PTR _current_sym_addr$S837
	push	eax
	mov	eax, DWORD PTR _asmfile$S826
	push	eax
	call	_output_addr_const
	add	esp, 8
; Line 819
	jmp	$L1017
$L1015:
; Line 820
	mov	eax, DWORD PTR _current_sym_value$S836
	push	eax
	push	OFFSET $SG1018
	mov	eax, DWORD PTR _asmfile$S826
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
$L1017:
; Line 821
	mov	eax, DWORD PTR _asmfile$S826
	dec	DWORD PTR [eax+4]
	mov	eax, DWORD PTR _asmfile$S826
	cmp	DWORD PTR [eax+4], 0
	jl	$L1205
	mov	eax, DWORD PTR _asmfile$S826
	mov	eax, DWORD PTR [eax]
	mov	BYTE PTR [eax], 10			; 0000000aH
	mov	eax, DWORD PTR _asmfile$S826
	inc	DWORD PTR [eax]
	jmp	$L1206
$L1205:
	mov	eax, DWORD PTR _asmfile$S826
	push	eax
	push	10					; 0000000aH
	call	__flsbuf
	add	esp, 8
$L1206:
; Line 822
$L1013:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_dbxout_finish_symbol ENDP
_syms$ = 8
_dbxout_syms PROC NEAR
; Line 829
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 830
$L1023:
	cmp	DWORD PTR _syms$[ebp], 0
	je	$L1024
; Line 832
	push	1
	mov	eax, DWORD PTR _syms$[ebp]
	push	eax
	call	_dbxout_symbol
	add	esp, 8
; Line 833
	mov	eax, DWORD PTR _syms$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _syms$[ebp], eax
; Line 834
	jmp	$L1023
$L1024:
; Line 835
$L1021:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_dbxout_syms ENDP
_TEXT	ENDS
EXTRN	_const0_rtx:DWORD
_DATA	SEGMENT
	ORG $+1
$SG1032	DB	'.stabs "%s:p', 00H
	ORG $+3
$SG1039	DB	'.stabs "%s:P', 00H
	ORG $+3
$SG1042	DB	'.stabs "%s:p', 00H
_DATA	ENDS
_TEXT	SEGMENT
_parms$ = 8
_dbxout_parms PROC NEAR
; Line 852
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 853
	jmp	$L1028
$L1029:
	mov	eax, DWORD PTR _parms$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _parms$[ebp], eax
$L1028:
	cmp	DWORD PTR _parms$[ebp], 0
	je	$L1030
; Line 855
	mov	eax, DWORD PTR _parms$[ebp]
	cmp	DWORD PTR [eax+48], 0
	jl	$L1031
; Line 857
	mov	DWORD PTR _current_sym_code$S835, 160	; 000000a0H
; Line 858
	mov	eax, DWORD PTR _parms$[ebp]
	mov	eax, DWORD PTR [eax+48]
	cdq
	and	edx, 7
	add	eax, edx
	sar	eax, 3
	mov	DWORD PTR _current_sym_value$S836, eax
; Line 859
	mov	DWORD PTR _current_sym_addr$S837, 0
; Line 860
	mov	eax, DWORD PTR _parms$[ebp]
	mov	eax, DWORD PTR [eax+40]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_strlen
	add	esp, 4
	add	eax, 2
	mov	DWORD PTR _current_sym_nchars$S838, eax
; Line 864
	mov	eax, DWORD PTR _parms$[ebp]
	mov	eax, DWORD PTR [eax+40]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	OFFSET $SG1032
	mov	eax, DWORD PTR _asmfile$S826
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 868
	mov	eax, DWORD PTR _parms$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1033
	mov	eax, DWORD PTR _parms$[ebp]
	mov	eax, DWORD PTR [eax+76]
	cmp	DWORD PTR [eax+4], 0
	jl	$L1033
	mov	eax, DWORD PTR _parms$[ebp]
	mov	eax, DWORD PTR [eax+76]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jge	$L1033
; Line 869
	push	0
	mov	eax, DWORD PTR _parms$[ebp]
	mov	eax, DWORD PTR [eax+56]
	push	eax
	call	_dbxout_type
	add	esp, 8
; Line 870
	jmp	$L1034
$L1033:
; Line 887
	mov	eax, DWORD PTR _parms$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1035
	mov	eax, DWORD PTR _parms$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1035
	mov	eax, DWORD PTR _parms$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1035
	mov	eax, DWORD PTR _parms$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _current_sym_value$S836
	cmp	DWORD PTR [eax+4], ecx
	jne	$L1035
; Line 888
	push	0
	mov	eax, DWORD PTR _parms$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_dbxout_type
	add	esp, 8
; Line 889
	jmp	$L1036
$L1035:
; Line 891
	mov	eax, DWORD PTR _parms$[ebp]
	mov	eax, DWORD PTR [eax+48]
	cdq
	and	edx, 7
	add	eax, edx
	sar	eax, 3
	mov	DWORD PTR _current_sym_value$S836, eax
; Line 892
	push	0
	mov	eax, DWORD PTR _parms$[ebp]
	mov	eax, DWORD PTR [eax+56]
	push	eax
	call	_dbxout_type
	add	esp, 8
; Line 893
$L1036:
; Line 894
$L1034:
; Line 895
	call	_dbxout_finish_symbol
; Line 900
	jmp	$L1037
$L1031:
; Line 902
	mov	eax, DWORD PTR _parms$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1038
	mov	eax, DWORD PTR _parms$[ebp]
	mov	eax, DWORD PTR [eax+76]
	cmp	DWORD PTR [eax+4], 0
	jl	$L1038
	mov	eax, DWORD PTR _parms$[ebp]
	mov	eax, DWORD PTR [eax+76]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jge	$L1038
; Line 904
	mov	DWORD PTR _current_sym_code$S835, 64	; 00000040H
; Line 905
	mov	eax, DWORD PTR _parms$[ebp]
	mov	eax, DWORD PTR [eax+76]
	cmp	DWORD PTR [eax+4], 0
	jne	$L1207
	mov	DWORD PTR _current_sym_value$S836, 0
	jmp	$L1208
$L1207:
	mov	eax, DWORD PTR _parms$[ebp]
	mov	eax, DWORD PTR [eax+76]
	cmp	DWORD PTR [eax+4], 1
	jne	$L1209
	mov	DWORD PTR _current_sym_value$S836, 2
	jmp	$L1210
$L1209:
	mov	eax, DWORD PTR _parms$[ebp]
	mov	eax, DWORD PTR [eax+76]
	cmp	DWORD PTR [eax+4], 2
	jne	$L1211
	mov	DWORD PTR _current_sym_value$S836, 1
	jmp	$L1212
$L1211:
	mov	eax, DWORD PTR _parms$[ebp]
	mov	eax, DWORD PTR [eax+76]
	cmp	DWORD PTR [eax+4], 3
	jne	$L1213
	mov	DWORD PTR _current_sym_value$S836, 3
	jmp	$L1214
$L1213:
	mov	eax, DWORD PTR _parms$[ebp]
	mov	eax, DWORD PTR [eax+76]
	cmp	DWORD PTR [eax+4], 4
	jne	$L1215
	mov	DWORD PTR _current_sym_value$S836, 6
	jmp	$L1216
$L1215:
	mov	eax, DWORD PTR _parms$[ebp]
	mov	eax, DWORD PTR [eax+76]
	cmp	DWORD PTR [eax+4], 5
	jne	$L1217
	mov	DWORD PTR _current_sym_value$S836, 7
	jmp	$L1218
$L1217:
	mov	eax, DWORD PTR _parms$[ebp]
	mov	eax, DWORD PTR [eax+76]
	cmp	DWORD PTR [eax+4], 6
	jne	$L1219
	mov	DWORD PTR _current_sym_value$S836, 4
	jmp	$L1220
$L1219:
	mov	eax, DWORD PTR _parms$[ebp]
	mov	eax, DWORD PTR [eax+76]
	cmp	DWORD PTR [eax+4], 7
	jne	$L1221
	mov	DWORD PTR _current_sym_value$S836, 5
	jmp	$L1222
$L1221:
	mov	eax, DWORD PTR _parms$[ebp]
	mov	eax, DWORD PTR [eax+76]
	cmp	DWORD PTR [eax+4], 8
	jne	$L1223
	mov	DWORD PTR _current_sym_value$S836, 12	; 0000000cH
	jmp	$L1224
$L1223:
	mov	eax, DWORD PTR _parms$[ebp]
	mov	eax, DWORD PTR [eax+76]
	cmp	DWORD PTR [eax+4], 9
	jne	$L1225
	mov	DWORD PTR _current_sym_value$S836, 12	; 0000000cH
	jmp	$L1226
$L1225:
	mov	eax, DWORD PTR _parms$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _current_sym_value$S836, eax
$L1226:
$L1224:
$L1222:
$L1220:
$L1218:
$L1216:
$L1214:
$L1212:
$L1210:
$L1208:
; Line 906
	mov	DWORD PTR _current_sym_addr$S837, 0
; Line 907
	mov	eax, DWORD PTR _parms$[ebp]
	mov	eax, DWORD PTR [eax+40]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_strlen
	add	esp, 4
	add	eax, 2
	mov	DWORD PTR _current_sym_nchars$S838, eax
; Line 911
	mov	eax, DWORD PTR _parms$[ebp]
	mov	eax, DWORD PTR [eax+40]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	OFFSET $SG1039
	mov	eax, DWORD PTR _asmfile$S826
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 913
	push	0
	mov	eax, DWORD PTR _parms$[ebp]
	mov	eax, DWORD PTR [eax+56]
	push	eax
	call	_dbxout_type
	add	esp, 8
; Line 914
	call	_dbxout_finish_symbol
; Line 916
	jmp	$L1040
$L1038:
; Line 917
	mov	eax, DWORD PTR _parms$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1041
	mov	eax, DWORD PTR _parms$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	ecx, DWORD PTR _const0_rtx
	cmp	DWORD PTR [eax+4], ecx
	je	$L1041
; Line 919
	mov	DWORD PTR _current_sym_code$S835, 128	; 00000080H
; Line 922
	mov	eax, DWORD PTR _parms$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _current_sym_value$S836, eax
; Line 923
	mov	DWORD PTR _current_sym_addr$S837, 0
; Line 924
	mov	eax, DWORD PTR _parms$[ebp]
	mov	eax, DWORD PTR [eax+40]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_strlen
	add	esp, 4
	add	eax, 2
	mov	DWORD PTR _current_sym_nchars$S838, eax
; Line 928
	mov	eax, DWORD PTR _parms$[ebp]
	mov	eax, DWORD PTR [eax+40]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	OFFSET $SG1042
	mov	eax, DWORD PTR _asmfile$S826
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 947
	push	0
	mov	eax, DWORD PTR _parms$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_dbxout_type
	add	esp, 8
; Line 948
	call	_dbxout_finish_symbol
; Line 950
$L1041:
$L1040:
$L1037:
	jmp	$L1029
$L1030:
; Line 951
$L1027:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_dbxout_parms ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+3
$SG1050	DB	'.stabs "%s:r', 00H
	ORG $+3
$SG1055	DB	'.stabs "%s:', 00H
_DATA	ENDS
_TEXT	SEGMENT
_parms$ = 8
_offset$1053 = -4
_dbxout_reg_parms PROC NEAR
; Line 960
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 961
$L1047:
	cmp	DWORD PTR _parms$[ebp], 0
	je	$L1048
; Line 967
	mov	eax, DWORD PTR _parms$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1049
	mov	eax, DWORD PTR _parms$[ebp]
	mov	eax, DWORD PTR [eax+76]
	cmp	DWORD PTR [eax+4], 0
	jl	$L1049
	mov	eax, DWORD PTR _parms$[ebp]
	mov	eax, DWORD PTR [eax+76]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jge	$L1049
	mov	eax, DWORD PTR _parms$[ebp]
	cmp	DWORD PTR [eax+48], 0
	jl	$L1049
; Line 969
	mov	DWORD PTR _current_sym_code$S835, 64	; 00000040H
; Line 970
	mov	eax, DWORD PTR _parms$[ebp]
	mov	eax, DWORD PTR [eax+76]
	cmp	DWORD PTR [eax+4], 0
	jne	$L1227
	mov	DWORD PTR _current_sym_value$S836, 0
	jmp	$L1228
$L1227:
	mov	eax, DWORD PTR _parms$[ebp]
	mov	eax, DWORD PTR [eax+76]
	cmp	DWORD PTR [eax+4], 1
	jne	$L1229
	mov	DWORD PTR _current_sym_value$S836, 2
	jmp	$L1230
$L1229:
	mov	eax, DWORD PTR _parms$[ebp]
	mov	eax, DWORD PTR [eax+76]
	cmp	DWORD PTR [eax+4], 2
	jne	$L1231
	mov	DWORD PTR _current_sym_value$S836, 1
	jmp	$L1232
$L1231:
	mov	eax, DWORD PTR _parms$[ebp]
	mov	eax, DWORD PTR [eax+76]
	cmp	DWORD PTR [eax+4], 3
	jne	$L1233
	mov	DWORD PTR _current_sym_value$S836, 3
	jmp	$L1234
$L1233:
	mov	eax, DWORD PTR _parms$[ebp]
	mov	eax, DWORD PTR [eax+76]
	cmp	DWORD PTR [eax+4], 4
	jne	$L1235
	mov	DWORD PTR _current_sym_value$S836, 6
	jmp	$L1236
$L1235:
	mov	eax, DWORD PTR _parms$[ebp]
	mov	eax, DWORD PTR [eax+76]
	cmp	DWORD PTR [eax+4], 5
	jne	$L1237
	mov	DWORD PTR _current_sym_value$S836, 7
	jmp	$L1238
$L1237:
	mov	eax, DWORD PTR _parms$[ebp]
	mov	eax, DWORD PTR [eax+76]
	cmp	DWORD PTR [eax+4], 6
	jne	$L1239
	mov	DWORD PTR _current_sym_value$S836, 4
	jmp	$L1240
$L1239:
	mov	eax, DWORD PTR _parms$[ebp]
	mov	eax, DWORD PTR [eax+76]
	cmp	DWORD PTR [eax+4], 7
	jne	$L1241
	mov	DWORD PTR _current_sym_value$S836, 5
	jmp	$L1242
$L1241:
	mov	eax, DWORD PTR _parms$[ebp]
	mov	eax, DWORD PTR [eax+76]
	cmp	DWORD PTR [eax+4], 8
	jne	$L1243
	mov	DWORD PTR _current_sym_value$S836, 12	; 0000000cH
	jmp	$L1244
$L1243:
	mov	eax, DWORD PTR _parms$[ebp]
	mov	eax, DWORD PTR [eax+76]
	cmp	DWORD PTR [eax+4], 9
	jne	$L1245
	mov	DWORD PTR _current_sym_value$S836, 12	; 0000000cH
	jmp	$L1246
$L1245:
	mov	eax, DWORD PTR _parms$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _current_sym_value$S836, eax
$L1246:
$L1244:
$L1242:
$L1240:
$L1238:
$L1236:
$L1234:
$L1232:
$L1230:
$L1228:
; Line 971
	mov	DWORD PTR _current_sym_addr$S837, 0
; Line 972
	mov	eax, DWORD PTR _parms$[ebp]
	mov	eax, DWORD PTR [eax+40]
	mov	eax, DWORD PTR [eax+20]
	add	eax, 2
	mov	DWORD PTR _current_sym_nchars$S838, eax
; Line 975
	mov	eax, DWORD PTR _parms$[ebp]
	mov	eax, DWORD PTR [eax+40]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	OFFSET $SG1050
	mov	eax, DWORD PTR _asmfile$S826
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 976
	push	0
	mov	eax, DWORD PTR _parms$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_dbxout_type
	add	esp, 8
; Line 977
	call	_dbxout_finish_symbol
; Line 980
	jmp	$L1051
$L1049:
; Line 982
	mov	eax, DWORD PTR _parms$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1052
	mov	eax, DWORD PTR _parms$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1052
	mov	eax, DWORD PTR _parms$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1052
; Line 984
	mov	eax, DWORD PTR _parms$[ebp]
	mov	eax, DWORD PTR [eax+48]
	cdq
	and	edx, 7
	add	eax, edx
	sar	eax, 3
	mov	DWORD PTR _offset$1053[ebp], eax
; Line 993
	mov	eax, DWORD PTR _parms$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _offset$1053[ebp]
	cmp	DWORD PTR [eax+4], ecx
	je	$L1054
; Line 995
	mov	DWORD PTR _current_sym_code$S835, 128	; 00000080H
; Line 996
	mov	eax, DWORD PTR _parms$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _current_sym_value$S836, eax
; Line 997
	mov	DWORD PTR _current_sym_addr$S837, 0
; Line 998
	mov	eax, DWORD PTR _parms$[ebp]
	mov	eax, DWORD PTR [eax+40]
	mov	eax, DWORD PTR [eax+20]
	add	eax, 2
	mov	DWORD PTR _current_sym_nchars$S838, eax
; Line 1001
	mov	eax, DWORD PTR _parms$[ebp]
	mov	eax, DWORD PTR [eax+40]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	OFFSET $SG1055
	mov	eax, DWORD PTR _asmfile$S826
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 1002
	push	0
	mov	eax, DWORD PTR _parms$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_dbxout_type
	add	esp, 8
; Line 1003
	call	_dbxout_finish_symbol
; Line 1005
$L1054:
; Line 1006
$L1052:
$L1051:
	mov	eax, DWORD PTR _parms$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _parms$[ebp], eax
; Line 1007
	jmp	$L1047
$L1048:
; Line 1008
$L1045:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_dbxout_reg_parms ENDP
_TEXT	ENDS
PUBLIC	_dbxout_args
_TEXT	SEGMENT
_args$ = 8
_dbxout_args PROC NEAR
; Line 1016
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1017
$L1059:
	cmp	DWORD PTR _args$[ebp], 0
	je	$L1060
; Line 1019
	mov	eax, DWORD PTR _asmfile$S826
	dec	DWORD PTR [eax+4]
	mov	eax, DWORD PTR _asmfile$S826
	cmp	DWORD PTR [eax+4], 0
	jl	$L1247
	mov	eax, DWORD PTR _asmfile$S826
	mov	eax, DWORD PTR [eax]
	mov	BYTE PTR [eax], 44			; 0000002cH
	mov	eax, DWORD PTR _asmfile$S826
	inc	DWORD PTR [eax]
	jmp	$L1248
$L1247:
	mov	eax, DWORD PTR _asmfile$S826
	push	eax
	push	44					; 0000002cH
	call	__flsbuf
	add	esp, 8
$L1248:
; Line 1020
	push	0
	mov	eax, DWORD PTR _args$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_dbxout_type
	add	esp, 8
; Line 1021
	inc	DWORD PTR _current_sym_nchars$S838
; Line 1022
	mov	eax, DWORD PTR _args$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _args$[ebp], eax
; Line 1023
	jmp	$L1059
$L1060:
; Line 1024
$L1057:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_dbxout_args ENDP
_types$ = 8
_dbxout_types PROC NEAR
; Line 1033
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1034
$L1064:
	cmp	DWORD PTR _types$[ebp], 0
	je	$L1065
; Line 1038
	mov	eax, DWORD PTR _types$[ebp]
	cmp	DWORD PTR [eax+56], 0
	je	$L1066
	mov	eax, DWORD PTR _types$[ebp]
	mov	eax, DWORD PTR [eax+56]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 42					; 0000002aH
	jne	$L1066
	mov	eax, DWORD PTR _types$[ebp]
	mov	eax, DWORD PTR [eax+56]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 13					; 0000000dH
	test	al, 1
	jne	$L1066
; Line 1039
	push	1
	mov	eax, DWORD PTR _types$[ebp]
	mov	eax, DWORD PTR [eax+56]
	push	eax
	call	_dbxout_symbol
	add	esp, 8
; Line 1040
$L1066:
	mov	eax, DWORD PTR _types$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _types$[ebp], eax
; Line 1041
	jmp	$L1064
$L1065:
; Line 1042
$L1062:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_dbxout_types ENDP
_TEXT	ENDS
_DATA	SEGMENT
$SG1075	DB	'.stabs "%s:T', 00H
_DATA	ENDS
_TEXT	SEGMENT
_tags$ = 8
_link$ = -4
_type$1073 = -8
_dbxout_tags PROC NEAR
; Line 1052
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 1054
	mov	eax, DWORD PTR _tags$[ebp]
	mov	DWORD PTR _link$[ebp], eax
	jmp	$L1070
$L1071:
	mov	eax, DWORD PTR _link$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _link$[ebp], eax
$L1070:
	cmp	DWORD PTR _link$[ebp], 0
	je	$L1072
; Line 1056
	mov	eax, DWORD PTR _link$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	eax, DWORD PTR [eax+68]
	mov	DWORD PTR _type$1073[ebp], eax
; Line 1059
	mov	eax, DWORD PTR _link$[ebp]
	cmp	DWORD PTR [eax+20], 0
	je	$L1074
	mov	eax, DWORD PTR _link$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 13					; 0000000dH
	test	al, 1
	jne	$L1074
	mov	eax, DWORD PTR _type$1073[ebp]
	cmp	DWORD PTR [eax+28], 0
	je	$L1074
; Line 1061
	mov	eax, DWORD PTR _link$[ebp]
	mov	eax, DWORD PTR [eax+16]
	or	eax, 8192				; 00002000H
	mov	ecx, DWORD PTR _link$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 1062
	mov	DWORD PTR _current_sym_code$S835, 128	; 00000080H
; Line 1063
	mov	DWORD PTR _current_sym_value$S836, 0
; Line 1064
	mov	DWORD PTR _current_sym_addr$S837, 0
; Line 1065
	mov	eax, DWORD PTR _link$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	eax, DWORD PTR [eax+20]
	add	eax, 2
	mov	DWORD PTR _current_sym_nchars$S838, eax
; Line 1069
	mov	eax, DWORD PTR _link$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	OFFSET $SG1075
	mov	eax, DWORD PTR _asmfile$S826
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 1070
	push	1
	mov	eax, DWORD PTR _type$1073[ebp]
	push	eax
	call	_dbxout_type
	add	esp, 8
; Line 1071
	call	_dbxout_finish_symbol
; Line 1073
$L1074:
	jmp	$L1071
$L1072:
; Line 1074
$L1068:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_dbxout_tags ENDP
_TEXT	ENDS
EXTRN	_assemble_name:NEAR
EXTRN	_sprintf:NEAR
_DATA	SEGMENT
	ORG $+3
$SG1096	DB	'LBB', 00H
$SG1097	DB	'*%s%d', 00H
	ORG $+2
$SG1098	DB	'.stabn %d,0,0,', 00H
	ORG $+1
$SG1100	DB	0aH, 00H
	ORG $+2
$SG1103	DB	'LBE', 00H
$SG1104	DB	'*%s%d', 00H
	ORG $+2
$SG1105	DB	'.stabn %d,0,0,', 00H
	ORG $+1
$SG1106	DB	0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_buf$1095 = -24
_buf$1102 = -44
_stmt$ = 8
_depth$ = 12
_args$ = 16
_blocknum$ = -4
_dbxout_block PROC NEAR
; Line 1095
	push	ebp
	mov	ebp, esp
	sub	esp, 48					; 00000030H
	push	ebx
	push	esi
	push	edi
; Line 1098
$L1083:
	cmp	DWORD PTR _stmt$[ebp], 0
	je	$L1084
; Line 1100
	mov	eax, DWORD PTR _stmt$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR -48+[ebp], eax
	jmp	$L1085
; Line 1102
$L1089:
; Line 1104
	push	0
	mov	eax, DWORD PTR _depth$[ebp]
	push	eax
	mov	eax, DWORD PTR _stmt$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	call	_dbxout_block
	add	esp, 12					; 0000000cH
; Line 1105
	jmp	$L1086
; Line 1107
$L1090:
; Line 1108
	push	0
	mov	eax, DWORD PTR _depth$[ebp]
	push	eax
	mov	eax, DWORD PTR _stmt$[ebp]
	mov	eax, DWORD PTR [eax+32]
	push	eax
	call	_dbxout_block
	add	esp, 12					; 0000000cH
; Line 1109
	push	0
	mov	eax, DWORD PTR _depth$[ebp]
	push	eax
	mov	eax, DWORD PTR _stmt$[ebp]
	mov	eax, DWORD PTR [eax+36]
	push	eax
	call	_dbxout_block
	add	esp, 12					; 0000000cH
; Line 1110
	jmp	$L1086
; Line 1112
$L1091:
; Line 1114
	mov	eax, DWORD PTR _stmt$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 15					; 0000000fH
	test	al, 1
	jne	$L1092
; Line 1115
	jmp	$L1086
; Line 1117
$L1092:
	mov	eax, DWORD PTR _stmt$[ebp]
	mov	eax, DWORD PTR [eax+44]
	push	eax
	call	_dbxout_tags
	add	esp, 4
; Line 1118
	mov	eax, DWORD PTR _stmt$[ebp]
	mov	eax, DWORD PTR [eax+32]
	push	eax
	call	_dbxout_syms
	add	esp, 4
; Line 1119
	cmp	DWORD PTR _args$[ebp], 0
	je	$L1093
; Line 1120
	mov	eax, DWORD PTR _args$[ebp]
	push	eax
	call	_dbxout_reg_parms
	add	esp, 4
; Line 1126
$L1093:
	cmp	DWORD PTR _depth$[ebp], 0
	jle	$L1094
; Line 1129
	mov	eax, DWORD PTR _next_block_number$S834
	mov	DWORD PTR _blocknum$[ebp], eax
	inc	DWORD PTR _next_block_number$S834
; Line 1130
	mov	eax, DWORD PTR _blocknum$[ebp]
	push	eax
	push	OFFSET $SG1096
	push	OFFSET $SG1097
	lea	eax, DWORD PTR _buf$1095[ebp]
	push	eax
	call	_sprintf
	add	esp, 16					; 00000010H
; Line 1131
	push	192					; 000000c0H
	push	OFFSET $SG1098
	mov	eax, DWORD PTR _asmfile$S826
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 1132
	lea	eax, DWORD PTR _buf$1095[ebp]
	push	eax
	mov	eax, DWORD PTR _asmfile$S826
	push	eax
	call	_assemble_name
	add	esp, 8
; Line 1133
	push	OFFSET $SG1100
	mov	eax, DWORD PTR _asmfile$S826
	push	eax
	call	_fprintf
	add	esp, 8
; Line 1137
$L1094:
	push	0
	mov	eax, DWORD PTR _depth$[ebp]
	inc	eax
	push	eax
	mov	eax, DWORD PTR _stmt$[ebp]
	mov	eax, DWORD PTR [eax+48]
	push	eax
	call	_dbxout_block
	add	esp, 12					; 0000000cH
; Line 1140
	cmp	DWORD PTR _depth$[ebp], 0
	jle	$L1101
; Line 1143
	mov	eax, DWORD PTR _blocknum$[ebp]
	push	eax
	push	OFFSET $SG1103
	push	OFFSET $SG1104
	lea	eax, DWORD PTR _buf$1102[ebp]
	push	eax
	call	_sprintf
	add	esp, 16					; 00000010H
; Line 1144
	push	224					; 000000e0H
	push	OFFSET $SG1105
	mov	eax, DWORD PTR _asmfile$S826
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 1145
	lea	eax, DWORD PTR _buf$1102[ebp]
	push	eax
	mov	eax, DWORD PTR _asmfile$S826
	push	eax
	call	_assemble_name
	add	esp, 8
; Line 1146
	push	OFFSET $SG1106
	mov	eax, DWORD PTR _asmfile$S826
	push	eax
	call	_fprintf
	add	esp, 8
; Line 1148
$L1101:
	jmp	$L1086
$L1085:
	cmp	DWORD PTR -48+[ebp], 28			; 0000001cH
	je	$L1091
	cmp	DWORD PTR -48+[ebp], 29			; 0000001dH
	je	$L1090
	cmp	DWORD PTR -48+[ebp], 32			; 00000020H
	jl	$L1086
	cmp	DWORD PTR -48+[ebp], 33			; 00000021H
	jle	$L1089
	jmp	$L1086
$L1086:
; Line 1149
	mov	eax, DWORD PTR _stmt$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _stmt$[ebp], eax
; Line 1150
	jmp	$L1083
$L1084:
; Line 1151
$L1080:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_dbxout_block ENDP
_TEXT	ENDS
PUBLIC	_dbxout_function
EXTRN	_get_temporary_types:NEAR
_TEXT	SEGMENT
_decl$ = 8
_dbxout_function PROC NEAR
; Line 1162
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1163
	push	0
	mov	eax, DWORD PTR _decl$[ebp]
	push	eax
	call	_dbxout_symbol
	add	esp, 8
; Line 1164
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+56]
	push	eax
	call	_dbxout_parms
	add	esp, 4
; Line 1165
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+56]
	push	eax
	push	0
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+64]
	push	eax
	call	_dbxout_block
	add	esp, 12					; 0000000cH
; Line 1169
	call	_get_temporary_types
	push	eax
	call	_dbxout_types
	add	esp, 4
; Line 1170
$L1109:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_dbxout_function ENDP
_TEXT	ENDS
END
