	TITLE	symbols.c
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
_BSS	SEGMENT PARA USE32 PUBLIC 'BSS'
_BSS	ENDS
_TLS	SEGMENT DWORD USE32 PUBLIC 'TLS'
_TLS	ENDS
FLAT	GROUP _DATA, CONST, _BSS
	ASSUME	CS: FLAT, DS: FLAT, SS: FLAT
endif
_DATA	SEGMENT
COMM	_notes:BYTE:024H
COMM	_local_bss_counter:DWORD
COMM	_symbol_rootP:DWORD
COMM	_symbol_lastP:DWORD
COMM	_abs_symbol:BYTE:020H
_DATA	ENDS
PUBLIC	_symbol_begin
EXTRN	_memset:NEAR
EXTRN	_hash_new:NEAR
_BSS	SEGMENT
_sy_hash$S320 DD 01H DUP (?)
_local_label_counter$S322 DW 0aH DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
; File symbols.c
_symbol_begin PROC NEAR
; Line 85
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 86
	mov	DWORD PTR _symbol_lastP, 0
; Line 87
	mov	DWORD PTR _symbol_rootP, 0
; Line 88
	call	_hash_new
	mov	DWORD PTR _sy_hash$S320, eax
; Line 89
	push	32					; 00000020H
	push	0
	push	OFFSET _abs_symbol
	call	_memset
	add	esp, 12					; 0000000cH
; Line 90
	mov	BYTE PTR _abs_symbol+4, 2
; Line 91
	push	20					; 00000014H
	push	0
	push	OFFSET _local_label_counter$S322
	call	_memset
	add	esp, 12					; 0000000cH
; Line 92
	mov	DWORD PTR _local_bss_counter, 0
; Line 93
$L324:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_symbol_begin ENDP
_TEXT	ENDS
PUBLIC	_local_label_name
_BSS	SEGMENT
_symbol_name_build$S323 DB 0cH DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
_n$ = 8
_augend$ = 12
_p$ = -16
_q$ = -20
_symbol_name_temporary$ = -12
_local_label_name PROC NEAR
; Line 105
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	push	ebx
	push	esi
	push	edi
; Line 112
	mov	DWORD PTR _p$[ebp], OFFSET _symbol_name_build$S323
; Line 113
	mov	eax, DWORD PTR _p$[ebp]
	mov	BYTE PTR [eax], 76			; 0000004cH
	inc	DWORD PTR _p$[ebp]
; Line 114
	mov	eax, DWORD PTR _n$[ebp]
	add	eax, 48					; 00000030H
	mov	ecx, DWORD PTR _p$[ebp]
	mov	BYTE PTR [ecx], al
	inc	DWORD PTR _p$[ebp]
; Line 115
	mov	eax, DWORD PTR _p$[ebp]
	mov	BYTE PTR [eax], 1
	inc	DWORD PTR _p$[ebp]
; Line 116
	mov	eax, DWORD PTR _n$[ebp]
	mov	ax, WORD PTR _local_label_counter$S322[eax*2]
	and	eax, 65535				; 0000ffffH
	add	eax, DWORD PTR _augend$[ebp]
	mov	DWORD PTR _n$[ebp], eax
; Line 123
	lea	eax, DWORD PTR _symbol_name_temporary$[ebp]
	mov	DWORD PTR _q$[ebp], eax
; Line 124
	mov	eax, DWORD PTR _q$[ebp]
	mov	BYTE PTR [eax], 0
	inc	DWORD PTR _q$[ebp]
	jmp	$L332
$L333:
	inc	DWORD PTR _q$[ebp]
$L332:
	cmp	DWORD PTR _n$[ebp], 0
	je	$L334
; Line 127
	mov	ecx, 10					; 0000000aH
	mov	eax, DWORD PTR _n$[ebp]
	cdq
	idiv	ecx
	lea	eax, DWORD PTR [edx+48]
	mov	ecx, DWORD PTR _q$[ebp]
	mov	BYTE PTR [ecx], al
; Line 128
	mov	ecx, 10					; 0000000aH
	mov	eax, DWORD PTR _n$[ebp]
	cdq
	idiv	ecx
	mov	DWORD PTR _n$[ebp], eax
; Line 129
	jmp	$L333
$L334:
; Line 130
$L336:
	mov	eax, DWORD PTR _p$[ebp]
	mov	DWORD PTR -24+[ebp], eax
	inc	DWORD PTR _p$[ebp]
	dec	DWORD PTR _q$[ebp]
	mov	eax, DWORD PTR _q$[ebp]
	mov	al, BYTE PTR [eax]
	mov	ecx, DWORD PTR -24+[ebp]
	mov	BYTE PTR [ecx], al
	mov	eax, DWORD PTR -24+[ebp]
	movsx	eax, BYTE PTR [eax]
	or	eax, eax
	je	$L337
; Line 132
	jmp	$L336
$L337:
; Line 134
	mov	eax, OFFSET _symbol_name_build$S323
	jmp	$L328
; Line 135
$L328:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_local_label_name ENDP
_TEXT	ENDS
PUBLIC	_local_colon
PUBLIC	_colon
_TEXT	SEGMENT
_n$ = 8
_local_colon PROC NEAR
; Line 141
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 142
	mov	eax, DWORD PTR _n$[ebp]
	inc	WORD PTR _local_label_counter$S322[eax*2]
; Line 146
	push	0
	mov	eax, DWORD PTR _n$[ebp]
	push	eax
	call	_local_label_name
	add	esp, 8
	push	eax
	call	_colon
	add	esp, 4
; Line 147
$L339:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_local_colon ENDP
_TEXT	ENDS
PUBLIC	_symbol_new
EXTRN	_strlen:NEAR
EXTRN	__obstack_newchunk:NEAR
EXTRN	_memcpy:NEAR
_TEXT	SEGMENT
_name$ = 8
_type$ = 12
_other$ = 16
_desc$ = 20
_value$ = 24
_frag$ = 28
_symbolP$ = -4
_preserved_copy_of_name$ = -16
_name_length$ = -12
_p$ = -8
_symbol_new PROC NEAR
; Line 172
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 178
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_strlen
	add	esp, 4
	inc	eax
	mov	DWORD PTR _name_length$[ebp], eax
; Line 179
	mov	eax, DWORD PTR _name_length$[ebp]
	mov	DWORD PTR _notes+20, eax
	mov	eax, DWORD PTR _notes+20
	add	eax, DWORD PTR _notes+12
	cmp	eax, DWORD PTR _notes+16
	jbe	$L393
	mov	eax, DWORD PTR _notes+20
	push	eax
	push	OFFSET _notes
	call	__obstack_newchunk
	add	esp, 8
	jmp	$L394
$L393:
$L394:
	mov	eax, DWORD PTR _notes+20
	push	eax
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	mov	eax, DWORD PTR _notes+12
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
	mov	eax, DWORD PTR _notes+20
	add	DWORD PTR _notes+12, eax
; Line 180
	mov	eax, DWORD PTR _notes+8
	mov	DWORD PTR _notes+20, eax
	mov	eax, DWORD PTR _notes+12
	add	eax, DWORD PTR _notes+24
	mov	ecx, DWORD PTR _notes+24
	not	ecx
	and	eax, ecx
	mov	DWORD PTR _notes+12, eax
	mov	eax, DWORD PTR _notes+12
	sub	eax, DWORD PTR _notes+4
	mov	ecx, DWORD PTR _notes+16
	sub	ecx, DWORD PTR _notes+4
	cmp	eax, ecx
	jle	$L395
	mov	eax, DWORD PTR _notes+16
	mov	DWORD PTR _notes+12, eax
	jmp	$L396
$L395:
$L396:
	mov	eax, DWORD PTR _notes+12
	mov	DWORD PTR _notes+8, eax
	mov	eax, DWORD PTR _notes+20
	mov	DWORD PTR _p$[ebp], eax
; Line 182
	mov	eax, DWORD PTR _p$[ebp]
	mov	DWORD PTR _preserved_copy_of_name$[ebp], eax
; Line 183
	mov	DWORD PTR _notes+20, 32			; 00000020H
	mov	eax, DWORD PTR _notes+16
	sub	eax, DWORD PTR _notes+12
	cmp	eax, DWORD PTR _notes+20
	jl	$L397
	jmp	$L398
$L397:
	mov	eax, DWORD PTR _notes+20
	push	eax
	push	OFFSET _notes
	call	__obstack_newchunk
	add	esp, 8
$L398:
	mov	eax, DWORD PTR _notes+20
	add	DWORD PTR _notes+12, eax
	mov	eax, DWORD PTR _notes+8
	mov	DWORD PTR _notes+20, eax
	mov	eax, DWORD PTR _notes+12
	add	eax, DWORD PTR _notes+24
	mov	ecx, DWORD PTR _notes+24
	not	ecx
	and	eax, ecx
	mov	DWORD PTR _notes+12, eax
	mov	eax, DWORD PTR _notes+12
	sub	eax, DWORD PTR _notes+4
	mov	ecx, DWORD PTR _notes+16
	sub	ecx, DWORD PTR _notes+4
	cmp	eax, ecx
	jle	$L399
	mov	eax, DWORD PTR _notes+16
	mov	DWORD PTR _notes+12, eax
	jmp	$L400
$L399:
$L400:
	mov	eax, DWORD PTR _notes+12
	mov	DWORD PTR _notes+8, eax
	mov	eax, DWORD PTR _notes+20
	mov	DWORD PTR _p$[ebp], eax
; Line 185
	mov	eax, DWORD PTR _p$[ebp]
	mov	DWORD PTR _symbolP$[ebp], eax
; Line 186
	mov	eax, DWORD PTR _preserved_copy_of_name$[ebp]
	mov	ecx, DWORD PTR _symbolP$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 187
	mov	al, BYTE PTR _type$[ebp]
	mov	ecx, DWORD PTR _symbolP$[ebp]
	mov	BYTE PTR [ecx+4], al
; Line 188
	mov	al, BYTE PTR _other$[ebp]
	mov	ecx, DWORD PTR _symbolP$[ebp]
	mov	BYTE PTR [ecx+5], al
; Line 189
	mov	ax, WORD PTR _desc$[ebp]
	mov	ecx, DWORD PTR _symbolP$[ebp]
	mov	WORD PTR [ecx+6], ax
; Line 190
	mov	eax, DWORD PTR _value$[ebp]
	mov	ecx, DWORD PTR _symbolP$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 191
	mov	eax, DWORD PTR _frag$[ebp]
	mov	ecx, DWORD PTR _symbolP$[ebp]
	mov	DWORD PTR [ecx+24], eax
; Line 192
	mov	eax, DWORD PTR _symbolP$[ebp]
	mov	DWORD PTR [eax+20], 0
; Line 193
	mov	eax, DWORD PTR _symbolP$[ebp]
	mov	DWORD PTR [eax+28], 0
; Line 201
	cmp	DWORD PTR _symbol_lastP, 0
	je	$L353
; Line 203
	mov	eax, DWORD PTR _symbolP$[ebp]
	mov	ecx, DWORD PTR _symbol_lastP
	mov	DWORD PTR [ecx+20], eax
; Line 205
	jmp	$L354
$L353:
; Line 207
	mov	eax, DWORD PTR _symbolP$[ebp]
	mov	DWORD PTR _symbol_rootP, eax
; Line 208
$L354:
; Line 209
	mov	eax, DWORD PTR _symbolP$[ebp]
	mov	DWORD PTR _symbol_lastP, eax
; Line 211
	mov	eax, DWORD PTR _symbolP$[ebp]
	jmp	$L346
; Line 212
$L346:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_symbol_new ENDP
_TEXT	ENDS
PUBLIC	_symbol_find
PUBLIC	_symbol_table_insert
EXTRN	_frag_now:DWORD
EXTRN	_frag_var:NEAR
EXTRN	_broken_words:DWORD
EXTRN	_now_seg:DWORD
EXTRN	_seg_name:BYTE
EXTRN	_seg_N_TYPE:BYTE
EXTRN	_N_TYPE_seg:BYTE
EXTRN	_as_fatal:NEAR
EXTRN	_frags:BYTE
EXTRN	_new_broken_words:DWORD
EXTRN	_md_short_jump_size:DWORD
EXTRN	_md_long_jump_size:DWORD
_DATA	SEGMENT
$SG377	DB	'Symbol "%s" is already defined as "%s"/%d.%d.%d.', 00H
	ORG $+3
$SG379	DB	'Symbol %s already defined.', 00H
_DATA	ENDS
_TEXT	SEGMENT
_sym_name$ = 8
_symbolP$ = -4
_a$359 = -8
_possible_bytes$360 = -12
_frag_tmp$361 = -20
_frag_opcode$362 = -16
_colon	PROC NEAR
; Line 227
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	push	ebx
	push	esi
	push	edi
; Line 239
	cmp	DWORD PTR _new_broken_words, 0
	je	$L358
; Line 247
	mov	eax, DWORD PTR _new_broken_words
	imul	eax, DWORD PTR _md_long_jump_size
	add	eax, DWORD PTR _md_short_jump_size
	mov	DWORD PTR _possible_bytes$360[ebp], eax
; Line 248
	mov	eax, DWORD PTR _frag_now
	mov	DWORD PTR _frag_tmp$361[ebp], eax
; Line 249
	push	0
	push	0
	mov	eax, DWORD PTR _broken_words
	push	eax
	push	0
	mov	eax, DWORD PTR _possible_bytes$360[ebp]
	push	eax
	mov	eax, DWORD PTR _possible_bytes$360[ebp]
	push	eax
	push	4
	call	_frag_var
	add	esp, 28					; 0000001cH
	mov	DWORD PTR _frag_opcode$362[ebp], eax
; Line 253
$L366:
	cmp	DWORD PTR _frag_tmp$361[ebp], 0
	je	$L367
	mov	eax, DWORD PTR _frag_tmp$361[ebp]
	cmp	DWORD PTR [eax+28], 4
	jne	$L368
	mov	eax, DWORD PTR _frag_tmp$361[ebp]
	cmp	DWORD PTR [eax+24], 0
	je	$L367
$L368:
; Line 254
	mov	eax, DWORD PTR _frag_tmp$361[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _frag_tmp$361[ebp], eax
	jmp	$L366
$L367:
; Line 256
	mov	eax, DWORD PTR _frag_opcode$362[ebp]
	mov	ecx, DWORD PTR _frag_tmp$361[ebp]
	mov	DWORD PTR [ecx+24], eax
; Line 257
	mov	DWORD PTR _new_broken_words, 0
; Line 259
	mov	eax, DWORD PTR _broken_words
	mov	DWORD PTR _a$359[ebp], eax
	jmp	$L369
$L370:
	mov	eax, DWORD PTR _a$359[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _a$359[ebp], eax
$L369:
	cmp	DWORD PTR _a$359[ebp], 0
	je	$L371
	mov	eax, DWORD PTR _a$359[ebp]
	cmp	DWORD PTR [eax+12], 0
	jne	$L371
; Line 260
	mov	eax, DWORD PTR _frag_tmp$361[ebp]
	mov	ecx, DWORD PTR _a$359[ebp]
	mov	DWORD PTR [ecx+12], eax
	jmp	$L370
$L371:
; Line 263
$L358:
	mov	eax, DWORD PTR _sym_name$[ebp]
	push	eax
	call	_symbol_find
	add	esp, 4
	mov	DWORD PTR _symbolP$[ebp], eax
	cmp	DWORD PTR _symbolP$[ebp], 0
	je	$L372
; Line 289
	mov	eax, DWORD PTR _symbolP$[ebp]
	mov	al, BYTE PTR [eax+4]
	and	eax, 255				; 000000ffH
	test	al, 30					; 0000001eH
	jne	$L373
; Line 293
	mov	eax, DWORD PTR _symbolP$[ebp]
	movsx	eax, BYTE PTR [eax+5]
	or	eax, eax
	jne	$L374
	mov	eax, DWORD PTR _symbolP$[ebp]
	movsx	eax, WORD PTR [eax+6]
	or	eax, eax
	jne	$L374
	mov	eax, DWORD PTR _symbolP$[ebp]
	cmp	DWORD PTR [eax+8], 0
	jne	$L374
; Line 295
	mov	eax, DWORD PTR _frag_now
	mov	ecx, DWORD PTR _symbolP$[ebp]
	mov	DWORD PTR [ecx+24], eax
; Line 299
	mov	eax, DWORD PTR _frags+12
	mov	ecx, DWORD PTR _frag_now
	add	ecx, 38					; 00000026H
	sub	eax, ecx
	mov	ecx, DWORD PTR _symbolP$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 301
	mov	eax, DWORD PTR _symbolP$[ebp]
	mov	al, BYTE PTR [eax+4]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _now_seg
	or	al, BYTE PTR _seg_N_TYPE[ecx*4]
	mov	ecx, DWORD PTR _symbolP$[ebp]
	mov	BYTE PTR [ecx+4], al
; Line 303
	jmp	$L375
$L374:
; Line 350
	mov	eax, DWORD PTR _symbolP$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _symbolP$[ebp]
	movsx	eax, WORD PTR [eax+6]
	push	eax
	mov	eax, DWORD PTR _symbolP$[ebp]
	movsx	eax, BYTE PTR [eax+5]
	push	eax
	mov	eax, DWORD PTR _symbolP$[ebp]
	mov	al, BYTE PTR [eax+4]
	and	eax, 30					; 0000001eH
	mov	eax, DWORD PTR _N_TYPE_seg[eax*4]
	mov	eax, DWORD PTR _seg_name[eax*4]
	push	eax
	mov	eax, DWORD PTR _sym_name$[ebp]
	push	eax
	push	OFFSET $SG377
	call	_as_fatal
	add	esp, 24					; 00000018H
; Line 354
$L375:
; Line 356
	jmp	$L378
$L373:
; Line 358
	mov	eax, DWORD PTR _sym_name$[ebp]
	push	eax
	push	OFFSET $SG379
	call	_as_fatal
	add	esp, 8
; Line 359
$L378:
; Line 361
	jmp	$L380
$L372:
; Line 372
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
	mov	eax, DWORD PTR _sym_name$[ebp]
	push	eax
	call	_symbol_new
	add	esp, 24					; 00000018H
	mov	DWORD PTR _symbolP$[ebp], eax
; Line 373
	mov	eax, DWORD PTR _symbolP$[ebp]
	push	eax
	call	_symbol_table_insert
	add	esp, 4
; Line 374
$L380:
; Line 375
$L356:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_colon	ENDP
_TEXT	ENDS
EXTRN	_hash_jam:NEAR
_DATA	SEGMENT
	ORG $+1
$SG385	DB	'Inserting "%s" into symbol table failed: %s', 00H
_DATA	ENDS
_TEXT	SEGMENT
_symbolP$ = 8
_error_string$ = -4
_symbol_table_insert PROC NEAR
; Line 388
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 393
	mov	eax, DWORD PTR _symbolP$[ebp]
	push	eax
	mov	eax, DWORD PTR _symbolP$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	mov	eax, DWORD PTR _sy_hash$S320
	push	eax
	call	_hash_jam
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _error_string$[ebp], eax
	mov	eax, DWORD PTR _error_string$[ebp]
	movsx	eax, BYTE PTR [eax]
	or	eax, eax
	je	$L384
; Line 396
	mov	eax, DWORD PTR _error_string$[ebp]
	push	eax
	mov	eax, DWORD PTR _symbolP$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	push	OFFSET $SG385
	call	_as_fatal
	add	esp, 12					; 0000000cH
; Line 398
$L384:
$L382:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_symbol_table_insert ENDP
_TEXT	ENDS
PUBLIC	_symbol_find_or_make
EXTRN	_zero_address_frag:BYTE
_TEXT	SEGMENT
_name$ = 8
_symbolP$ = -4
_symbol_find_or_make PROC NEAR
; Line 409
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 412
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_symbol_find
	add	esp, 4
	mov	DWORD PTR _symbolP$[ebp], eax
; Line 413
	cmp	DWORD PTR _symbolP$[ebp], 0
	jne	$L389
; Line 415
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
; Line 416
	mov	eax, DWORD PTR _symbolP$[ebp]
	push	eax
	call	_symbol_table_insert
	add	esp, 4
; Line 418
$L389:
	mov	eax, DWORD PTR _symbolP$[ebp]
	jmp	$L387
; Line 419
$L387:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_symbol_find_or_make ENDP
_TEXT	ENDS
EXTRN	_hash_find:NEAR
_TEXT	SEGMENT
_name$ = 8
_symbol_find PROC NEAR
; Line 433
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 434
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	mov	eax, DWORD PTR _sy_hash$S320
	push	eax
	call	_hash_find
	add	esp, 8
	jmp	$L391
; Line 435
$L391:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_symbol_find ENDP
_TEXT	ENDS
END
