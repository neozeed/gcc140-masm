	TITLE	gnulib_.c
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
PUBLIC	___new_handler
_DATA	SEGMENT
COMM	___avoid_ranlib_warning:DWORD
___new_handler DD FLAT:_default_new_handler
_DATA	ENDS
PUBLIC	___eprintf
EXTRN	__iob:BYTE
EXTRN	_fflush:NEAR
EXTRN	_fprintf:NEAR
EXTRN	_abort:NEAR
_TEXT	SEGMENT
; File gnulib_.c
_string$ = 8
_expression$ = 12
_line$ = 16
_filename$ = 20
___eprintf PROC NEAR
; Line 50
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 51
	mov	eax, DWORD PTR _filename$[ebp]
	push	eax
	mov	eax, DWORD PTR _line$[ebp]
	push	eax
	mov	eax, DWORD PTR _expression$[ebp]
	push	eax
	mov	eax, DWORD PTR _string$[ebp]
	push	eax
	mov	eax, OFFSET FLAT:__iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 20					; 00000014H
; Line 52
	mov	eax, OFFSET FLAT:__iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fflush
	add	esp, 4
; Line 53
	call	_abort
; Line 54
$L239:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
___eprintf ENDP
_TEXT	ENDS
PUBLIC	___umulsi3
_TEXT	SEGMENT
_a$ = 8
_b$ = 12
___umulsi3 PROC NEAR
; Line 61
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 62
	mov	eax, DWORD PTR _b$[ebp]
	imul	eax, DWORD PTR _a$[ebp]
	jmp	$L244
; Line 63
$L244:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
___umulsi3 ENDP
_TEXT	ENDS
PUBLIC	___mulsi3
_TEXT	SEGMENT
_a$ = 8
_b$ = 12
___mulsi3 PROC NEAR
; Line 70
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 71
	mov	eax, DWORD PTR _b$[ebp]
	imul	eax, DWORD PTR _a$[ebp]
	jmp	$L248
; Line 72
$L248:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
___mulsi3 ENDP
_TEXT	ENDS
PUBLIC	___udivsi3
_TEXT	SEGMENT
_a$ = 8
_b$ = 12
___udivsi3 PROC NEAR
; Line 79
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 80
	mov	eax, DWORD PTR _a$[ebp]
	sub	edx, edx
	div	DWORD PTR _b$[ebp]
	jmp	$L252
; Line 81
$L252:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
___udivsi3 ENDP
_TEXT	ENDS
PUBLIC	___divsi3
_TEXT	SEGMENT
_a$ = 8
_b$ = 12
___divsi3 PROC NEAR
; Line 88
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 89
	mov	eax, DWORD PTR _a$[ebp]
	cdq
	idiv	DWORD PTR _b$[ebp]
	jmp	$L256
; Line 90
$L256:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
___divsi3 ENDP
_TEXT	ENDS
PUBLIC	___umodsi3
_TEXT	SEGMENT
_a$ = 8
_b$ = 12
___umodsi3 PROC NEAR
; Line 97
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 98
	mov	eax, DWORD PTR _a$[ebp]
	sub	edx, edx
	div	DWORD PTR _b$[ebp]
	mov	eax, edx
	jmp	$L260
; Line 99
$L260:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
___umodsi3 ENDP
_TEXT	ENDS
PUBLIC	___modsi3
_TEXT	SEGMENT
_a$ = 8
_b$ = 12
___modsi3 PROC NEAR
; Line 106
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 107
	mov	eax, DWORD PTR _a$[ebp]
	cdq
	idiv	DWORD PTR _b$[ebp]
	mov	eax, edx
	jmp	$L264
; Line 108
$L264:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
___modsi3 ENDP
_TEXT	ENDS
PUBLIC	___lshrsi3
_TEXT	SEGMENT
_a$ = 8
_b$ = 12
___lshrsi3 PROC NEAR
; Line 115
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 116
	mov	eax, DWORD PTR _a$[ebp]
	mov	cl, BYTE PTR _b$[ebp]
	shr	eax, cl
	jmp	$L268
; Line 117
$L268:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
___lshrsi3 ENDP
_TEXT	ENDS
PUBLIC	___lshlsi3
_TEXT	SEGMENT
_a$ = 8
_b$ = 12
___lshlsi3 PROC NEAR
; Line 124
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 125
	mov	eax, DWORD PTR _a$[ebp]
	mov	cl, BYTE PTR _b$[ebp]
	shl	eax, cl
	jmp	$L272
; Line 126
$L272:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
___lshlsi3 ENDP
_TEXT	ENDS
PUBLIC	___ashrsi3
_TEXT	SEGMENT
_a$ = 8
_b$ = 12
___ashrsi3 PROC NEAR
; Line 133
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 134
	mov	eax, DWORD PTR _a$[ebp]
	mov	cl, BYTE PTR _b$[ebp]
	sar	eax, cl
	jmp	$L276
; Line 135
$L276:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
___ashrsi3 ENDP
_TEXT	ENDS
PUBLIC	___ashlsi3
_TEXT	SEGMENT
_a$ = 8
_b$ = 12
___ashlsi3 PROC NEAR
; Line 142
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 143
	mov	eax, DWORD PTR _a$[ebp]
	mov	cl, BYTE PTR _b$[ebp]
	shl	eax, cl
	jmp	$L280
; Line 144
$L280:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
___ashlsi3 ENDP
_TEXT	ENDS
PUBLIC	___divdf3
EXTRN	__fltused:NEAR
_TEXT	SEGMENT
_a$ = 8
_b$ = 16
___divdf3 PROC NEAR
; Line 151
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 152
	fld	QWORD PTR _a$[ebp]
	fdiv	QWORD PTR _b$[ebp]
	jmp	$L284
; Line 153
$L284:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
___divdf3 ENDP
_TEXT	ENDS
PUBLIC	___muldf3
_TEXT	SEGMENT
_a$ = 8
_b$ = 16
___muldf3 PROC NEAR
; Line 160
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 161
	fld	QWORD PTR _b$[ebp]
	fmul	QWORD PTR _a$[ebp]
	jmp	$L288
; Line 162
$L288:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
___muldf3 ENDP
_TEXT	ENDS
PUBLIC	___negdf2
_TEXT	SEGMENT
_a$ = 8
___negdf2 PROC NEAR
; Line 169
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 170
	fld	QWORD PTR _a$[ebp]
	fchs
	jmp	$L291
; Line 171
$L291:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
___negdf2 ENDP
_TEXT	ENDS
PUBLIC	___adddf3
_TEXT	SEGMENT
_a$ = 8
_b$ = 16
___adddf3 PROC NEAR
; Line 178
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 179
	fld	QWORD PTR _b$[ebp]
	fadd	QWORD PTR _a$[ebp]
	jmp	$L295
; Line 180
$L295:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
___adddf3 ENDP
_TEXT	ENDS
PUBLIC	___subdf3
_TEXT	SEGMENT
_a$ = 8
_b$ = 16
___subdf3 PROC NEAR
; Line 187
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 188
	fld	QWORD PTR _a$[ebp]
	fsub	QWORD PTR _b$[ebp]
	jmp	$L299
; Line 189
$L299:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
___subdf3 ENDP
_TEXT	ENDS
PUBLIC	___cmpdf2
_TEXT	SEGMENT
_a$ = 8
_b$ = 16
___cmpdf2 PROC NEAR
; Line 196
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 197
	fld	QWORD PTR _b$[ebp]
	fcomp	QWORD PTR _a$[ebp]
	fnstsw	ax
	test	ah, 1
	je	$L304
; Line 198
	mov	eax, 1
	jmp	$L303
; Line 199
	jmp	$L305
$L304:
	fld	QWORD PTR _b$[ebp]
	fcomp	QWORD PTR _a$[ebp]
	fnstsw	ax
	test	ah, 65					; 00000041H
	jne	$L306
; Line 200
	mov	eax, -1
	jmp	$L303
; Line 201
$L306:
$L305:
	sub	eax, eax
	jmp	$L303
; Line 202
$L303:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
___cmpdf2 ENDP
_TEXT	ENDS
PUBLIC	___fixunsdfsi
EXTRN	__ftol:NEAR
CONST	SEGMENT
$T413	DQ	041e0000000000000r		; 2.14748e+009
CONST	ENDS
_TEXT	SEGMENT
_a$ = 8
___fixunsdfsi PROC NEAR
; Line 212
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 213
	fld	QWORD PTR _a$[ebp]
	fcomp	QWORD PTR $T413
	fnstsw	ax
	test	ah, 1
	je	$L310
; Line 214
	fld	QWORD PTR _a$[ebp]
	call	__ftol
	jmp	$L309
; Line 217
	jmp	$L311
$L310:
; Line 218
	fld	QWORD PTR _a$[ebp]
	fsub	QWORD PTR $T413
	call	__ftol
	sub	eax, -2147483648			; 80000000H
	jmp	$L309
$L311:
; Line 219
$L309:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
___fixunsdfsi ENDP
_TEXT	ENDS
PUBLIC	___fixdfsi
_TEXT	SEGMENT
_a$ = 8
___fixdfsi PROC NEAR
; Line 226
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 227
	fld	QWORD PTR _a$[ebp]
	call	__ftol
	jmp	$L314
; Line 228
$L314:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
___fixdfsi ENDP
_TEXT	ENDS
PUBLIC	___floatsidf
_TEXT	SEGMENT
_a$ = 8
___floatsidf PROC NEAR
; Line 235
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 236
	mov	eax, DWORD PTR _a$[ebp]
	mov	DWORD PTR -4+[ebp], eax
	fild	DWORD PTR -4+[ebp]
	jmp	$L317
; Line 237
$L317:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
___floatsidf ENDP
_TEXT	ENDS
PUBLIC	___addsf3
_TEXT	SEGMENT
_a$ = 8
_b$ = 12
___addsf3 PROC NEAR
; Line 244
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 246
	fld	DWORD PTR _b$[ebp]
	fadd	DWORD PTR _a$[ebp]
	jmp	$L321
; Line 247
$L321:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
___addsf3 ENDP
_TEXT	ENDS
PUBLIC	___negsf2
_TEXT	SEGMENT
_a$ = 8
___negsf2 PROC NEAR
; Line 254
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 256
	fld	DWORD PTR _a$[ebp]
	fchs
	jmp	$L325
; Line 257
$L325:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
___negsf2 ENDP
_TEXT	ENDS
PUBLIC	___subsf3
_TEXT	SEGMENT
_a$ = 8
_b$ = 12
___subsf3 PROC NEAR
; Line 264
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 266
	fld	DWORD PTR _a$[ebp]
	fsub	DWORD PTR _b$[ebp]
	jmp	$L330
; Line 267
$L330:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
___subsf3 ENDP
_TEXT	ENDS
PUBLIC	___cmpsf2
_TEXT	SEGMENT
_a$ = 8
_b$ = 12
___cmpsf2 PROC NEAR
; Line 274
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 275
	fld	DWORD PTR _b$[ebp]
	fcomp	DWORD PTR _a$[ebp]
	fnstsw	ax
	test	ah, 1
	je	$L336
; Line 276
	mov	eax, 1
	jmp	$L335
; Line 277
	jmp	$L337
$L336:
	fld	DWORD PTR _b$[ebp]
	fcomp	DWORD PTR _a$[ebp]
	fnstsw	ax
	test	ah, 65					; 00000041H
	jne	$L338
; Line 278
	mov	eax, -1
	jmp	$L335
; Line 279
$L338:
$L337:
	sub	eax, eax
	jmp	$L335
; Line 280
$L335:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
___cmpsf2 ENDP
_TEXT	ENDS
PUBLIC	___mulsf3
_TEXT	SEGMENT
_a$ = 8
_b$ = 12
___mulsf3 PROC NEAR
; Line 287
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 289
	fld	DWORD PTR _b$[ebp]
	fmul	DWORD PTR _a$[ebp]
	jmp	$L342
; Line 290
$L342:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
___mulsf3 ENDP
_TEXT	ENDS
PUBLIC	___divsf3
_TEXT	SEGMENT
_a$ = 8
_b$ = 12
___divsf3 PROC NEAR
; Line 297
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 300
	fld	DWORD PTR _a$[ebp]
	fdiv	DWORD PTR _b$[ebp]
	jmp	$L347
; Line 301
$L347:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
___divsf3 ENDP
_TEXT	ENDS
PUBLIC	___truncdfsf2
_TEXT	SEGMENT
_a$ = 8
___truncdfsf2 PROC NEAR
; Line 308
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 310
	fld	QWORD PTR _a$[ebp]
	jmp	$L351
; Line 311
$L351:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
___truncdfsf2 ENDP
_TEXT	ENDS
PUBLIC	___extendsfdf2
_TEXT	SEGMENT
_a$ = 8
___extendsfdf2 PROC NEAR
; Line 318
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 319
	fld	DWORD PTR _a$[ebp]
	jmp	$L355
; Line 320
$L355:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
___extendsfdf2 ENDP
_TEXT	ENDS
PUBLIC	___builtin_new
EXTRN	_malloc:NEAR
_TEXT	SEGMENT
_sz$ = 8
_p$ = -4
___builtin_new PROC NEAR
; Line 361
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 364
	mov	eax, DWORD PTR _sz$[ebp]
	push	eax
	call	_malloc
	add	esp, 4
	mov	DWORD PTR _p$[ebp], eax
; Line 365
	cmp	DWORD PTR _p$[ebp], 0
	jne	$L364
; Line 366
	call	DWORD PTR ___new_handler
; Line 367
$L364:
	mov	eax, DWORD PTR _p$[ebp]
	jmp	$L361
; Line 368
$L361:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
___builtin_new ENDP
_TEXT	ENDS
PUBLIC	___builtin_vec_new
_TEXT	SEGMENT
_p$ = 8
_maxindex$ = 12
_size$ = 16
_ctor$ = 20
_i$ = -8
_nelts$ = -4
_rval$ = -12
___builtin_vec_new PROC NEAR
; Line 384
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 385
	mov	eax, DWORD PTR _maxindex$[ebp]
	inc	eax
	mov	DWORD PTR _nelts$[ebp], eax
; Line 388
	cmp	DWORD PTR _p$[ebp], 0
	jne	$L375
; Line 389
	mov	eax, DWORD PTR _nelts$[ebp]
	imul	eax, DWORD PTR _size$[ebp]
	push	eax
	call	___builtin_new
	add	esp, 4
	mov	DWORD PTR _p$[ebp], eax
; Line 391
$L375:
	mov	eax, DWORD PTR _p$[ebp]
	mov	DWORD PTR _rval$[ebp], eax
; Line 393
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L376
$L377:
	inc	DWORD PTR _i$[ebp]
$L376:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _nelts$[ebp], eax
	jle	$L378
; Line 395
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	call	DWORD PTR _ctor$[ebp]
	add	esp, 4
; Line 396
	mov	eax, DWORD PTR _size$[ebp]
	add	DWORD PTR _p$[ebp], eax
; Line 397
	jmp	$L377
$L378:
; Line 399
	mov	eax, DWORD PTR _rval$[ebp]
	jmp	$L371
; Line 400
$L371:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
___builtin_vec_new ENDP
_TEXT	ENDS
PUBLIC	___set_new_handler
_TEXT	SEGMENT
_handler$ = 8
_prev_handler$ = -4
___set_new_handler PROC NEAR
; Line 405
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 408
	mov	eax, DWORD PTR ___new_handler
	mov	DWORD PTR _prev_handler$[ebp], eax
; Line 409
	cmp	DWORD PTR _handler$[ebp], 0
	jne	$L383
	mov	DWORD PTR _handler$[ebp], OFFSET FLAT:_default_new_handler
; Line 410
$L383:
	mov	eax, DWORD PTR _handler$[ebp]
	mov	DWORD PTR ___new_handler, eax
; Line 411
	mov	eax, DWORD PTR _prev_handler$[ebp]
	jmp	$L381
; Line 412
$L381:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
___set_new_handler ENDP
_TEXT	ENDS
PUBLIC	_set_new_handler
_TEXT	SEGMENT
_handler$ = 8
_set_new_handler PROC NEAR
; Line 417
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 418
	mov	eax, DWORD PTR _handler$[ebp]
	push	eax
	call	___set_new_handler
	add	esp, 4
	jmp	$L386
; Line 419
$L386:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_set_new_handler ENDP
_TEXT	ENDS
EXTRN	__write:NEAR
EXTRN	__exit:NEAR
_DATA	SEGMENT
$SG389	DB	'default_new_handler: out of memory... aaaiiiiiieeeeeeeee'
	DB	'eeeee!', 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_default_new_handler PROC NEAR
; Line 423
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 425
	push	65					; 00000041H
	push	OFFSET FLAT:$SG389
	push	2
	call	__write
	add	esp, 12					; 0000000cH
; Line 428
	push	-1
	call	__exit
	add	esp, 4
; Line 429
$L387:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_default_new_handler ENDP
_TEXT	ENDS
PUBLIC	___builtin_delete
EXTRN	_free:NEAR
_TEXT	SEGMENT
_ptr$ = 8
___builtin_delete PROC NEAR
; Line 438
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 439
	cmp	DWORD PTR _ptr$[ebp], 0
	je	$L394
; Line 440
	mov	eax, DWORD PTR _ptr$[ebp]
	push	eax
	call	_free
	add	esp, 4
; Line 441
$L394:
$L393:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
___builtin_delete ENDP
_TEXT	ENDS
PUBLIC	___builtin_vec_delete
_TEXT	SEGMENT
_ptr$ = 8
_maxindex$ = 12
_size$ = 16
_dtor$ = 20
_auto_delete_vec$ = 24
_auto_delete$ = 28
_i$ = -8
_nelts$ = -4
_p$ = -12
___builtin_vec_delete PROC NEAR
; Line 449
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 450
	mov	eax, DWORD PTR _maxindex$[ebp]
	inc	eax
	mov	DWORD PTR _nelts$[ebp], eax
; Line 451
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	DWORD PTR _p$[ebp], eax
; Line 453
	mov	eax, DWORD PTR _nelts$[ebp]
	imul	eax, DWORD PTR _size$[ebp]
	add	DWORD PTR _ptr$[ebp], eax
; Line 455
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L407
$L408:
	inc	DWORD PTR _i$[ebp]
$L407:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _nelts$[ebp], eax
	jle	$L409
; Line 457
	sub	eax, eax
	sub	eax, DWORD PTR _size$[ebp]
	neg	eax
	sub	DWORD PTR _ptr$[ebp], eax
; Line 458
	mov	eax, DWORD PTR _auto_delete$[ebp]
	push	eax
	mov	eax, DWORD PTR _ptr$[ebp]
	push	eax
	call	DWORD PTR _dtor$[ebp]
	add	esp, 8
; Line 459
	jmp	$L408
$L409:
; Line 461
	cmp	DWORD PTR _auto_delete_vec$[ebp], 0
	je	$L410
; Line 462
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	call	_free
	add	esp, 4
; Line 463
$L410:
$L403:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
___builtin_vec_delete ENDP
_TEXT	ENDS
END
