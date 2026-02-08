	TITLE	input-scrub.c
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
PUBLIC	_input_scrub_begin
EXTRN	_input_file_begin:NEAR
EXTRN	_xmalloc:NEAR
EXTRN	_input_file_buffer_size:NEAR
EXTRN	_memcpy:NEAR
EXTRN	_do_scrub_begin:NEAR
_BSS	SEGMENT
_buffer_start$S286 DD 01H DUP (?)
_buffer_length$S290 DD 01H DUP (?)
_physical_input_file$S292 DD 01H DUP (?)
_logical_input_file$S293 DD 01H DUP (?)
_logical_input_line$S296 DD 01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG299	DB	0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
; File input-scrub.c
_input_scrub_begin PROC NEAR
; Line 98
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 102
	call	_input_file_begin
; Line 104
	call	_input_file_buffer_size
	mov	DWORD PTR _buffer_length$S290, eax
; Line 106
	mov	eax, DWORD PTR _buffer_length$S290
	add	eax, DWORD PTR _buffer_length$S290
	add	eax, 2
	push	eax
	call	_xmalloc
	add	esp, 4
	mov	DWORD PTR _buffer_start$S286, eax
; Line 107
	push	1
	push	OFFSET $SG299
	mov	eax, DWORD PTR _buffer_start$S286
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
; Line 110
	mov	DWORD PTR _logical_input_line$S296, 0
; Line 111
	mov	DWORD PTR _logical_input_file$S293, 0
; Line 112
	mov	DWORD PTR _physical_input_file$S292, 0
; Line 113
	call	_do_scrub_begin
; Line 114
$L297:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_input_scrub_begin ENDP
_TEXT	ENDS
PUBLIC	_input_scrub_end
EXTRN	_input_file_end:NEAR
_TEXT	SEGMENT
_input_scrub_end PROC NEAR
; Line 118
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 119
	call	_input_file_end
; Line 120
$L301:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_input_scrub_end ENDP
_TEXT	ENDS
PUBLIC	_input_scrub_new_file
EXTRN	_flagseen:BYTE
EXTRN	_input_file_open:NEAR
_BSS	SEGMENT
_partial_size$S288 DD 01H DUP (?)
_physical_input_line$S295 DD 01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+2
$SG304	DB	'{standard input}', 00H
_DATA	ENDS
_TEXT	SEGMENT
_filename$ = 8
_input_scrub_new_file PROC NEAR
; Line 125
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 126
	movsx	eax, BYTE PTR _flagseen+102
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	push	eax
	mov	eax, DWORD PTR _filename$[ebp]
	push	eax
	call	_input_file_open
	add	esp, 8
; Line 127
	mov	eax, DWORD PTR _filename$[ebp]
	movsx	eax, BYTE PTR [eax]
	or	eax, eax
	je	$L354
	mov	eax, DWORD PTR _filename$[ebp]
	mov	DWORD PTR _physical_input_file$S292, eax
	jmp	$L355
$L354:
	mov	DWORD PTR _physical_input_file$S292, OFFSET $SG304
$L355:
; Line 128
	mov	DWORD PTR _physical_input_line$S295, 0
; Line 130
	mov	DWORD PTR _partial_size$S288, 0
; Line 131
	mov	eax, DWORD PTR _buffer_start$S286
	inc	eax
	jmp	$L303
; Line 132
$L303:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_input_scrub_new_file ENDP
_TEXT	ENDS
PUBLIC	_input_scrub_next_buffer
EXTRN	_as_warn:NEAR
EXTRN	_input_file_give_next_buffer:NEAR
EXTRN	_as_fatal:NEAR
_BSS	SEGMENT
_partial_where$S287 DD 01H DUP (?)
_save_source$S289 DB 01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+3
$SG316	DB	'input-scrub.c', 00H
	ORG $+2
$SG317	DB	'Source line too long. Please change file %s then rebuild'
	DB	' assembler.', 00H
$SG318	DB	00H, 00H
	ORG $+2
$SG322	DB	'Partial line at end of file ignored', 00H
_DATA	ENDS
_TEXT	SEGMENT
_limit$ = -4
_p$310 = -8
_input_scrub_next_buffer PROC NEAR
; Line 137
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 177
	cmp	DWORD PTR _partial_size$S288, 0
	je	$L308
; Line 179
	mov	eax, DWORD PTR _partial_size$S288
	push	eax
	mov	eax, DWORD PTR _partial_where$S287
	push	eax
	mov	eax, DWORD PTR _buffer_start$S286
	inc	eax
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
; Line 180
	push	1
	push	OFFSET _save_source$S289
	mov	eax, DWORD PTR _buffer_start$S286
	inc	eax
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
; Line 182
$L308:
	mov	eax, DWORD PTR _partial_size$S288
	add	eax, DWORD PTR _buffer_start$S286
	inc	eax
	push	eax
	call	_input_file_give_next_buffer
	add	esp, 4
	mov	DWORD PTR _limit$[ebp], eax
; Line 183
	cmp	DWORD PTR _limit$[ebp], 0
	je	$L309
; Line 187
	mov	eax, DWORD PTR _limit$[ebp]
	mov	DWORD PTR _p$310[ebp], eax
$L312:
	dec	DWORD PTR _p$310[ebp]
	mov	eax, DWORD PTR _p$310[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 10					; 0000000aH
	je	$L313
; Line 189
	jmp	$L312
$L313:
; Line 190
	inc	DWORD PTR _p$310[ebp]
; Line 191
	mov	eax, DWORD PTR _buffer_start$S286
	inc	eax
	cmp	eax, DWORD PTR _p$310[ebp]
	jb	$L314
; Line 193
	push	OFFSET $SG316
	push	OFFSET $SG317
	call	_as_fatal
	add	esp, 8
; Line 195
$L314:
	mov	eax, DWORD PTR _p$310[ebp]
	mov	DWORD PTR _partial_where$S287, eax
; Line 196
	mov	eax, DWORD PTR _limit$[ebp]
	sub	eax, DWORD PTR _p$310[ebp]
	mov	DWORD PTR _partial_size$S288, eax
; Line 197
	push	1
	mov	eax, DWORD PTR _partial_where$S287
	push	eax
	push	OFFSET _save_source$S289
	call	_memcpy
	add	esp, 12					; 0000000cH
; Line 198
	push	1
	push	OFFSET $SG318
	mov	eax, DWORD PTR _partial_where$S287
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
; Line 200
	jmp	$L319
$L309:
; Line 202
	mov	DWORD PTR _partial_where$S287, 0
; Line 203
	cmp	DWORD PTR _partial_size$S288, 0
	jle	$L320
; Line 205
	push	OFFSET $SG322
	call	_as_warn
	add	esp, 4
; Line 207
$L320:
$L319:
; Line 208
	mov	eax, DWORD PTR _partial_where$S287
	jmp	$L306
; Line 209
$L306:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_input_scrub_next_buffer ENDP
_TEXT	ENDS
PUBLIC	_seen_at_least_1_file
_TEXT	SEGMENT
_seen_at_least_1_file PROC NEAR
; Line 219
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 220
	cmp	DWORD PTR _physical_input_file$S292, 1
	sbb	eax, eax
	inc	eax
	jmp	$L323
; Line 221
$L323:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_seen_at_least_1_file ENDP
_TEXT	ENDS
PUBLIC	_bump_line_counters
_TEXT	SEGMENT
_bump_line_counters PROC NEAR
; Line 225
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 226
	inc	DWORD PTR _physical_input_line$S295
; Line 227
	inc	DWORD PTR _logical_input_line$S296
; Line 228
$L324:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_bump_line_counters ENDP
_TEXT	ENDS
PUBLIC	_new_logical_line
_TEXT	SEGMENT
_fname$ = 8
_line_number$ = 12
_new_logical_line PROC NEAR
; Line 241
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 242
	cmp	DWORD PTR _fname$[ebp], 0
	je	$L328
; Line 244
	mov	eax, DWORD PTR _fname$[ebp]
	mov	DWORD PTR _logical_input_file$S293, eax
; Line 246
$L328:
	cmp	DWORD PTR _line_number$[ebp], 0
	jl	$L329
; Line 248
	mov	eax, DWORD PTR _line_number$[ebp]
	mov	DWORD PTR _logical_input_line$S296, eax
; Line 250
$L329:
$L327:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_new_logical_line ENDP
_TEXT	ENDS
PUBLIC	_as_where
EXTRN	_fprintf:NEAR
EXTRN	_input_file_is_open:NEAR
EXTRN	__iob:BYTE
_DATA	SEGMENT
$SG335	DB	'%s:%u:', 00H
	ORG $+1
$SG337	DB	'%s:unknown:', 00H
_DATA	ENDS
_TEXT	SEGMENT
_p$ = -8
_line$ = -4
_as_where PROC NEAR
; Line 261
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 265
	cmp	DWORD PTR _physical_input_file$S292, 0
	je	$L333
; Line 267
	call	_input_file_is_open
	or	eax, eax
	je	$L334
; Line 278
	cmp	DWORD PTR _logical_input_file$S293, 0
	je	$L356
	mov	eax, DWORD PTR _logical_input_file$S293
	mov	DWORD PTR _p$[ebp], eax
	jmp	$L357
$L356:
	mov	eax, DWORD PTR _physical_input_file$S292
	mov	DWORD PTR _p$[ebp], eax
$L357:
; Line 279
	cmp	DWORD PTR _logical_input_line$S296, 0
	je	$L358
	mov	eax, DWORD PTR _logical_input_line$S296
	mov	DWORD PTR _line$[ebp], eax
	jmp	$L359
$L358:
	mov	eax, DWORD PTR _physical_input_line$S295
	mov	DWORD PTR _line$[ebp], eax
$L359:
; Line 280
	mov	eax, DWORD PTR _line$[ebp]
	push	eax
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	push	OFFSET $SG335
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
; Line 283
	jmp	$L336
$L334:
; Line 288
	cmp	DWORD PTR _logical_input_file$S293, 0
	je	$L360
	mov	eax, DWORD PTR _logical_input_file$S293
	mov	DWORD PTR _p$[ebp], eax
	jmp	$L361
$L360:
	mov	eax, DWORD PTR _physical_input_file$S292
	mov	DWORD PTR _p$[ebp], eax
$L361:
; Line 289
	cmp	DWORD PTR _logical_input_line$S296, 0
	je	$L362
	mov	eax, DWORD PTR _logical_input_line$S296
	mov	DWORD PTR _line$[ebp], eax
	jmp	$L363
$L362:
	mov	eax, DWORD PTR _physical_input_line$S295
	mov	DWORD PTR _line$[ebp], eax
$L363:
; Line 290
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	push	OFFSET $SG337
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 292
$L336:
; Line 294
	jmp	$L338
$L333:
; Line 300
$L338:
; Line 301
$L330:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_as_where ENDP
_TEXT	ENDS
PUBLIC	_as_howmuch
EXTRN	_input_line_pointer:DWORD
_TEXT	SEGMENT
_stream$ = 8
_p$ = -4
_as_howmuch PROC NEAR
; Line 316
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 320
	mov	eax, DWORD PTR _input_line_pointer
	dec	eax
	mov	DWORD PTR _p$[ebp], eax
	jmp	$L342
$L343:
	dec	DWORD PTR _p$[ebp]
$L342:
	mov	eax, DWORD PTR _p$[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 10					; 0000000aH
	je	$L344
; Line 322
	jmp	$L343
$L344:
; Line 323
	inc	DWORD PTR _p$[ebp]
; Line 324
	jmp	$L345
$L346:
	inc	DWORD PTR _p$[ebp]
$L345:
	mov	eax, DWORD PTR _p$[ebp]
	cmp	DWORD PTR _input_line_pointer, eax
	jb	$L347
; Line 328
	mov	eax, DWORD PTR _stream$[ebp]
	push	eax
	mov	eax, DWORD PTR _p$[ebp]
	movsx	eax, BYTE PTR [eax]
	push	eax
	call	_as_1_char
	add	esp, 8
; Line 329
	jmp	$L346
$L347:
; Line 330
$L340:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_as_howmuch ENDP
_TEXT	ENDS
EXTRN	__flsbuf:NEAR
_TEXT	SEGMENT
_c$ = 8
_stream$ = 12
_as_1_char PROC NEAR
; Line 336
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 337
	xor	eax, eax
	mov	al, BYTE PTR _c$[ebp]
	cmp	eax, 127				; 0000007fH
	jle	$L351
; Line 339
	mov	eax, DWORD PTR _stream$[ebp]
	dec	DWORD PTR [eax+4]
	mov	eax, DWORD PTR _stream$[ebp]
	cmp	DWORD PTR [eax+4], 0
	jl	$L364
	mov	eax, DWORD PTR _stream$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	BYTE PTR [eax], 37			; 00000025H
	mov	eax, DWORD PTR _stream$[ebp]
	inc	DWORD PTR [eax]
	jmp	$L365
$L364:
	mov	eax, DWORD PTR _stream$[ebp]
	push	eax
	push	37					; 00000025H
	call	__flsbuf
	add	esp, 8
$L365:
; Line 340
	xor	eax, eax
	mov	al, BYTE PTR _c$[ebp]
	sub	eax, 128				; 00000080H
	mov	BYTE PTR _c$[ebp], al
; Line 342
$L351:
	xor	eax, eax
	mov	al, BYTE PTR _c$[ebp]
	cmp	eax, 32					; 00000020H
	jge	$L352
; Line 344
	mov	eax, DWORD PTR _stream$[ebp]
	dec	DWORD PTR [eax+4]
	mov	eax, DWORD PTR _stream$[ebp]
	cmp	DWORD PTR [eax+4], 0
	jl	$L366
	mov	eax, DWORD PTR _stream$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	BYTE PTR [eax], 94			; 0000005eH
	mov	eax, DWORD PTR _stream$[ebp]
	inc	DWORD PTR [eax]
	jmp	$L367
$L366:
	mov	eax, DWORD PTR _stream$[ebp]
	push	eax
	push	94					; 0000005eH
	call	__flsbuf
	add	esp, 8
$L367:
; Line 345
	xor	eax, eax
	mov	al, BYTE PTR _c$[ebp]
	add	eax, 64					; 00000040H
	mov	BYTE PTR _c$[ebp], al
; Line 347
$L352:
	mov	eax, DWORD PTR _stream$[ebp]
	dec	DWORD PTR [eax+4]
	mov	eax, DWORD PTR _stream$[ebp]
	cmp	DWORD PTR [eax+4], 0
	jl	$L368
	mov	al, BYTE PTR _c$[ebp]
	mov	ecx, DWORD PTR _stream$[ebp]
	mov	ecx, DWORD PTR [ecx]
	mov	BYTE PTR [ecx], al
	mov	eax, DWORD PTR _stream$[ebp]
	inc	DWORD PTR [eax]
	jmp	$L369
$L368:
	mov	eax, DWORD PTR _stream$[ebp]
	push	eax
	xor	eax, eax
	mov	al, BYTE PTR _c$[ebp]
	push	eax
	call	__flsbuf
	add	esp, 8
$L369:
; Line 348
$L350:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_as_1_char ENDP
_TEXT	ENDS
END
