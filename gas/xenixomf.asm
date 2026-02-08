	TITLE	xenixomf.c
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
PUBLIC	_lnames_tab
PUBLIC	_group_tab
PUBLIC	_fix_cmnt
_DATA	SEGMENT
_chksum$S302 DB	00H
	ORG $+3
$SG548	DB	00H
	ORG $+3
$SG549	DB	00H
	ORG $+3
$SG550	DB	'DGROUP', 00H
	ORG $+1
$SG551	DB	'_TEXT', 00H
	ORG $+2
$SG552	DB	'CODE', 00H
	ORG $+3
$SG553	DB	'_DATA', 00H
	ORG $+2
$SG554	DB	'DATA', 00H
	ORG $+3
$SG555	DB	'CONST', 00H
	ORG $+2
$SG556	DB	'_BSS', 00H
	ORG $+3
$SG557	DB	'BSS', 00H
$SG558	DB	'$$TYPES', 00H
$SG559	DB	'DEBTYP', 00H
	ORG $+1
$SG560	DB	'$$SYMBOLS', 00H
	ORG $+2
$SG561	DB	'DEBSYM', 00H
	ORG $+5
_lnames_tab DD	$SG548
	DD	$SG549
	DD	$SG550
	DD	$SG551
	DD	$SG552
	DD	$SG553
	DD	$SG554
	DD	$SG555
	DD	$SG556
	DD	$SG557
	DD	$SG558
	DD	$SG559
	DD	$SG560
	DD	$SG561
_segt$S563 DB	00H
	ORG $+3
	DD	00H
	DD	00H
	DD	00H
	DB	0a9H
	ORG $+3
	DD	00H
	DD	03H
	DD	04H
	DB	0a9H
	ORG $+3
	DD	00H
	DD	05H
	DD	06H
	DB	0a9H
	ORG $+3
	DD	00H
	DD	07H
	DD	07H
	DB	0a9H
	ORG $+3
	DD	00H
	DD	08H
	DD	09H
	DB	021H
	ORG $+3
	DD	00H
	DD	0cH
	DD	0dH
	DB	021H
	ORG $+3
	DD	00H
	DD	0aH
	DD	0bH
_group_tab DD	03H
	DD	04H
	DD	02H
	ORG $+4
_gas_comment$S566 DB 'gas-1.38.1a', 00H
	ORG $+4
_lib_comment$S567 DB 'LIBCRT', 00H
	ORG $+1
_model_comment$S568 DB '3s', 00H
	ORG $+1
_msext_comment$S569 DB 01H
	DB	043H
	DB	056H
	ORG $+1
_fix_cmnt DB	00H
	DB	08H
	ORG $+2
	DD	_gas_comment$S566
	DB	09fH
	DB	06H
	ORG $+2
	DD	_lib_comment$S567
	DB	09dH
	DB	02H
	ORG $+2
	DD	_model_comment$S568
	DB	0a1H
	DB	03H
	ORG $+2
	DD	_msext_comment$S569
_DATA	ENDS
_BSS	SEGMENT
_record_ptr$S304 DD 01H DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
; File xenixomf.c
_p$ = 8
_count$ = 12
_copy_bytes_to_record PROC NEAR
; Line 24
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 25
$L310:
	mov	eax, DWORD PTR _count$[ebp]
	mov	DWORD PTR -4+[ebp], eax
	dec	DWORD PTR _count$[ebp]
	cmp	DWORD PTR -4+[ebp], 0
	je	$L311
; Line 27
	mov	eax, DWORD PTR _p$[ebp]
	mov	al, BYTE PTR [eax]
	mov	ecx, DWORD PTR _record_ptr$S304
	mov	BYTE PTR [ecx], al
	inc	DWORD PTR _record_ptr$S304
; Line 28
	mov	eax, DWORD PTR _p$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	movsx	ecx, BYTE PTR _chksum$S302
	add	eax, ecx
	mov	BYTE PTR _chksum$S302, al
	inc	DWORD PTR _p$[ebp]
; Line 29
	jmp	$L310
$L311:
; Line 30
$L308:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_copy_bytes_to_record ENDP
_TEXT	ENDS
_BSS	SEGMENT
_recordbuff$S303 DB 03800H DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
_type$ = 8
_start_record PROC NEAR
; Line 34
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 35
	mov	BYTE PTR _chksum$S302, 0
; Line 36
	mov	DWORD PTR _record_ptr$S304, OFFSET _recordbuff$S303
; Line 37
	push	1
	lea	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_copy_bytes_to_record
	add	esp, 8
; Line 38
	add	DWORD PTR _record_ptr$S304, 2
; Line 39
$L314:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_start_record ENDP
_TEXT	ENDS
EXTRN	_out_file_name:DWORD
EXTRN	_output_file_append:NEAR
_TEXT	SEGMENT
_length$ = -8
_b$ = -4
_output_record PROC NEAR
; Line 42
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 46
	mov	eax, DWORD PTR _record_ptr$S304
	sub	eax, OFFSET _recordbuff$S303
	inc	eax
	mov	DWORD PTR _length$[ebp], eax
; Line 52
	mov	eax, DWORD PTR _length$[ebp]
	sub	eax, 3
	mov	BYTE PTR _b$[ebp], al
; Line 53
	movsx	eax, BYTE PTR _chksum$S302
	xor	ecx, ecx
	mov	cl, BYTE PTR _b$[ebp]
	add	eax, ecx
	mov	BYTE PTR _chksum$S302, al
	mov	al, BYTE PTR _b$[ebp]
	mov	BYTE PTR _recordbuff$S303+1, al
; Line 54
	mov	eax, DWORD PTR _length$[ebp]
	sub	eax, 3
	mov	BYTE PTR _b$[ebp], ah
; Line 55
	movsx	eax, BYTE PTR _chksum$S302
	xor	ecx, ecx
	mov	cl, BYTE PTR _b$[ebp]
	add	eax, ecx
	mov	BYTE PTR _chksum$S302, al
	mov	al, BYTE PTR _b$[ebp]
	mov	BYTE PTR _recordbuff$S303+2, al
; Line 56
	movsx	eax, BYTE PTR _chksum$S302
	neg	eax
	mov	ecx, DWORD PTR _record_ptr$S304
	mov	BYTE PTR [ecx], al
; Line 58
	mov	eax, DWORD PTR _out_file_name
	push	eax
	mov	eax, DWORD PTR _length$[ebp]
	push	eax
	push	OFFSET _recordbuff$S303
	call	_output_file_append
	add	esp, 12					; 0000000cH
; Line 59
$L316:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_record ENDP
_TEXT	ENDS
EXTRN	_strlen:NEAR
EXTRN	__iob:BYTE
EXTRN	_strncpy:NEAR
EXTRN	_fprintf:NEAR
_DATA	SEGMENT
$SG326	DB	'Identifier truncated to %s (%d chars)', 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_s$ = 8
_len$ = -4
_tname$325 = -136
_copy_string_to_record PROC NEAR
; Line 63
	push	ebp
	mov	ebp, esp
	sub	esp, 136				; 00000088H
	push	ebx
	push	esi
	push	edi
; Line 66
	mov	eax, DWORD PTR _s$[ebp]
	push	eax
	call	_strlen
	add	esp, 4
	mov	BYTE PTR _len$[ebp], al
; Line 67
	xor	eax, eax
	mov	al, BYTE PTR _len$[ebp]
	cmp	eax, 127				; 0000007fH
	jle	$L324
; Line 71
	push	127					; 0000007fH
	mov	eax, DWORD PTR _s$[ebp]
	push	eax
	lea	eax, DWORD PTR _tname$325[ebp]
	push	eax
	call	_strncpy
	add	esp, 12					; 0000000cH
; Line 72
	mov	BYTE PTR _tname$325[ebp+127], 0
; Line 74
	push	127					; 0000007fH
	lea	eax, DWORD PTR _tname$325[ebp]
	push	eax
	push	OFFSET $SG326
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
; Line 75
	mov	BYTE PTR _len$[ebp], 127		; 0000007fH
; Line 76
	push	1
	lea	eax, DWORD PTR _len$[ebp]
	push	eax
	call	_copy_bytes_to_record
	add	esp, 8
; Line 77
	push	127					; 0000007fH
	mov	eax, DWORD PTR _s$[ebp]
	push	eax
	call	_copy_bytes_to_record
	add	esp, 8
; Line 79
	jmp	$L327
$L324:
; Line 81
	push	1
	lea	eax, DWORD PTR _len$[ebp]
	push	eax
	call	_copy_bytes_to_record
	add	esp, 8
; Line 82
	xor	eax, eax
	mov	al, BYTE PTR _len$[ebp]
	or	eax, eax
	jle	$L328
; Line 83
	xor	eax, eax
	mov	al, BYTE PTR _len$[ebp]
	push	eax
	mov	eax, DWORD PTR _s$[ebp]
	push	eax
	call	_copy_bytes_to_record
	add	esp, 8
; Line 84
$L328:
$L327:
; Line 85
$L322:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_copy_string_to_record ENDP
_index$ = 8
_b$ = -4
_copy_index_to_record PROC NEAR
; Line 89
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 92
	cmp	DWORD PTR _index$[ebp], 128		; 00000080H
	jae	$L333
; Line 94
	mov	al, BYTE PTR _index$[ebp]
	mov	BYTE PTR _b$[ebp], al
; Line 95
	push	1
	lea	eax, DWORD PTR _b$[ebp]
	push	eax
	call	_copy_bytes_to_record
	add	esp, 8
; Line 97
	jmp	$L334
$L333:
; Line 99
	mov	eax, DWORD PTR _index$[ebp]
	shr	eax, 8
	and	eax, 127				; 0000007fH
	or	al, 128					; 00000080H
	mov	BYTE PTR _b$[ebp], al
; Line 100
	push	1
	lea	eax, DWORD PTR _b$[ebp]
	push	eax
	call	_copy_bytes_to_record
	add	esp, 8
; Line 101
	mov	al, BYTE PTR _index$[ebp]
	mov	BYTE PTR _b$[ebp], al
; Line 102
	push	1
	lea	eax, DWORD PTR _b$[ebp]
	push	eax
	call	_copy_bytes_to_record
	add	esp, 8
; Line 103
$L334:
; Line 104
$L331:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_copy_index_to_record ENDP
_value$ = 8
_count$ = 12
_b$ = -4
_copy_vint_to_record PROC NEAR
; Line 109
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 112
$L341:
	mov	eax, DWORD PTR _count$[ebp]
	mov	DWORD PTR -8+[ebp], eax
	dec	DWORD PTR _count$[ebp]
	cmp	DWORD PTR -8+[ebp], 0
	je	$L342
; Line 114
	mov	al, BYTE PTR _value$[ebp]
	mov	BYTE PTR _b$[ebp], al
; Line 115
	push	1
	lea	eax, DWORD PTR _b$[ebp]
	push	eax
	call	_copy_bytes_to_record
	add	esp, 8
; Line 116
	sar	DWORD PTR _value$[ebp], 8
; Line 117
	jmp	$L341
$L342:
; Line 118
$L338:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_copy_vint_to_record ENDP
_value$ = 8
_copy_word_to_record PROC NEAR
; Line 122
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 123
	push	2
	mov	eax, DWORD PTR _value$[ebp]
	push	eax
	call	_copy_vint_to_record
	add	esp, 8
; Line 124
$L345:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_copy_word_to_record ENDP
_i386$ = 8
_value$ = 12
_copy_offset_to_record PROC NEAR
; Line 129
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 130
	cmp	DWORD PTR _i386$[ebp], 1
	sbb	eax, eax
	and	eax, -2					; fffffffeH
	add	eax, 4
	push	eax
	mov	eax, DWORD PTR _value$[ebp]
	push	eax
	call	_copy_vint_to_record
	add	esp, 8
; Line 131
$L349:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_copy_offset_to_record ENDP
_value$ = 8
_b$ = -4
_copy_comsize_to_record PROC NEAR
; Line 135
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 138
	cmp	DWORD PTR _value$[ebp], 128		; 00000080H
	jge	$L354
; Line 139
	push	1
	mov	eax, DWORD PTR _value$[ebp]
	push	eax
	call	_copy_vint_to_record
	add	esp, 8
; Line 140
	jmp	$L355
$L354:
	cmp	DWORD PTR _value$[ebp], 65536		; 00010000H
	jge	$L356
; Line 142
	mov	BYTE PTR _b$[ebp], 129			; 00000081H
; Line 143
	push	1
	lea	eax, DWORD PTR _b$[ebp]
	push	eax
	call	_copy_bytes_to_record
	add	esp, 8
; Line 144
	push	2
	mov	eax, DWORD PTR _value$[ebp]
	push	eax
	call	_copy_vint_to_record
	add	esp, 8
; Line 146
	jmp	$L357
$L356:
	cmp	DWORD PTR _value$[ebp], 16777216	; 01000000H
	jge	$L358
; Line 148
	mov	BYTE PTR _b$[ebp], 132			; 00000084H
; Line 149
	push	1
	lea	eax, DWORD PTR _b$[ebp]
	push	eax
	call	_copy_bytes_to_record
	add	esp, 8
; Line 150
	push	3
	mov	eax, DWORD PTR _value$[ebp]
	push	eax
	call	_copy_vint_to_record
	add	esp, 8
; Line 152
	jmp	$L359
$L358:
; Line 154
	mov	BYTE PTR _b$[ebp], 136			; 00000088H
; Line 155
	push	1
	lea	eax, DWORD PTR _b$[ebp]
	push	eax
	call	_copy_bytes_to_record
	add	esp, 8
; Line 156
	push	4
	mov	eax, DWORD PTR _value$[ebp]
	push	eax
	call	_copy_vint_to_record
	add	esp, 8
; Line 157
$L359:
$L357:
$L355:
; Line 159
$L352:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_copy_comsize_to_record ENDP
_TEXT	ENDS
PUBLIC	_omf_theadr
_TEXT	SEGMENT
_name$ = 8
_omf_theadr PROC NEAR
; Line 163
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 164
	push	128					; 00000080H
	call	_start_record
	add	esp, 4
; Line 165
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_copy_string_to_record
	add	esp, 4
; Line 166
	call	_output_record
; Line 167
$L362:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_omf_theadr ENDP
_TEXT	ENDS
PUBLIC	_omf_coment
_TEXT	SEGMENT
_p$ = 8
_count$ = 12
_class$ = 16
_attrib$ = -4
_omf_coment PROC NEAR
; Line 173
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 176
	push	136					; 00000088H
	call	_start_record
	add	esp, 4
; Line 177
	mov	BYTE PTR _attrib$[ebp], 0
; Line 178
	push	1
	lea	eax, DWORD PTR _attrib$[ebp]
	push	eax
	call	_copy_bytes_to_record
	add	esp, 8
; Line 179
	push	1
	lea	eax, DWORD PTR _class$[ebp]
	push	eax
	call	_copy_bytes_to_record
	add	esp, 8
; Line 180
	mov	eax, DWORD PTR _count$[ebp]
	push	eax
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	call	_copy_bytes_to_record
	add	esp, 8
; Line 181
	call	_output_record
; Line 182
$L367:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_omf_coment ENDP
_TEXT	ENDS
PUBLIC	_omf_extdef
_TEXT	SEGMENT
_name$ = 8
_type$ = 12
_omf_extdef PROC NEAR
; Line 186
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 187
	push	140					; 0000008cH
	call	_start_record
	add	esp, 4
; Line 188
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_copy_string_to_record
	add	esp, 4
; Line 189
	push	1
	lea	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_copy_bytes_to_record
	add	esp, 8
; Line 190
	call	_output_record
; Line 191
$L372:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_omf_extdef ENDP
_TEXT	ENDS
PUBLIC	_omf_start_pubdef
_TEXT	SEGMENT
_i386$ = 8
_group$ = 12
_segment$ = 16
_frame$ = 20
_omf_start_pubdef PROC NEAR
; Line 196
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 197
	cmp	DWORD PTR _i386$[ebp], 0
	je	$L379
; Line 198
	push	145					; 00000091H
	call	_start_record
	add	esp, 4
; Line 199
	jmp	$L380
$L379:
; Line 200
	push	144					; 00000090H
	call	_start_record
	add	esp, 4
$L380:
; Line 202
	mov	eax, DWORD PTR _group$[ebp]
	push	eax
	call	_copy_index_to_record
	add	esp, 4
; Line 203
	mov	eax, DWORD PTR _segment$[ebp]
	push	eax
	call	_copy_index_to_record
	add	esp, 4
; Line 204
	cmp	DWORD PTR _group$[ebp], 0
	jne	$L381
	cmp	DWORD PTR _segment$[ebp], 0
	jne	$L381
; Line 205
	mov	eax, DWORD PTR _frame$[ebp]
	push	eax
	call	_copy_word_to_record
	add	esp, 4
; Line 206
$L381:
$L378:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_omf_start_pubdef ENDP
_TEXT	ENDS
PUBLIC	_omf_pubdef
_TEXT	SEGMENT
_offset$ = 16
_type$ = 20
_i386$ = 8
_name$ = 12
_omf_pubdef PROC NEAR
; Line 213
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 214
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_copy_string_to_record
	add	esp, 4
; Line 215
	mov	eax, DWORD PTR _offset$[ebp]
	push	eax
	mov	eax, DWORD PTR _i386$[ebp]
	push	eax
	call	_copy_offset_to_record
	add	esp, 8
; Line 216
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_copy_index_to_record
	add	esp, 4
; Line 217
$L387:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_omf_pubdef ENDP
_TEXT	ENDS
PUBLIC	_omf_end_pubdef
_TEXT	SEGMENT
_omf_end_pubdef PROC NEAR
; Line 220
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 221
	call	_output_record
; Line 222
$L389:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_omf_end_pubdef ENDP
_TEXT	ENDS
PUBLIC	_omf_start_lnames
_TEXT	SEGMENT
_omf_start_lnames PROC NEAR
; Line 225
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 226
	push	150					; 00000096H
	call	_start_record
	add	esp, 4
; Line 227
$L391:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_omf_start_lnames ENDP
_TEXT	ENDS
PUBLIC	_omf_lnames
_TEXT	SEGMENT
_name$ = 8
_omf_lnames PROC NEAR
; Line 231
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 232
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_copy_string_to_record
	add	esp, 4
; Line 233
$L394:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_omf_lnames ENDP
_TEXT	ENDS
PUBLIC	_omf_end_lnames
_TEXT	SEGMENT
_omf_end_lnames PROC NEAR
; Line 236
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 237
	call	_output_record
; Line 238
$L396:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_omf_end_lnames ENDP
_TEXT	ENDS
PUBLIC	_omf_segdef
_TEXT	SEGMENT
_i386$ = 8
_acbp$ = 12
_frame$ = 16
_offset$ = 20
_seglen$ = 24
_segname$ = 28
_segclass$ = 32
_ovlindex$ = -4
_omf_segdef PROC NEAR
; Line 247
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 248
	mov	DWORD PTR _ovlindex$[ebp], 0
; Line 249
	cmp	DWORD PTR _i386$[ebp], 0
	je	$L407
; Line 250
	push	153					; 00000099H
	call	_start_record
	add	esp, 4
; Line 251
	jmp	$L408
$L407:
; Line 252
	push	152					; 00000098H
	call	_start_record
	add	esp, 4
$L408:
; Line 254
	push	1
	lea	eax, DWORD PTR _acbp$[ebp]
	push	eax
	call	_copy_bytes_to_record
	add	esp, 8
; Line 255
	xor	eax, eax
	mov	al, BYTE PTR _acbp$[ebp]
	test	al, 224					; 000000e0H
	jne	$L409
; Line 257
	mov	eax, DWORD PTR _frame$[ebp]
	push	eax
	call	_copy_word_to_record
	add	esp, 4
; Line 258
	mov	eax, DWORD PTR _offset$[ebp]
	push	eax
	call	_copy_word_to_record
	add	esp, 4
; Line 260
$L409:
	mov	eax, DWORD PTR _seglen$[ebp]
	push	eax
	mov	eax, DWORD PTR _i386$[ebp]
	push	eax
	call	_copy_offset_to_record
	add	esp, 8
; Line 261
	mov	eax, DWORD PTR _segname$[ebp]
	push	eax
	call	_copy_index_to_record
	add	esp, 4
; Line 262
	mov	eax, DWORD PTR _segclass$[ebp]
	push	eax
	call	_copy_index_to_record
	add	esp, 4
; Line 263
	mov	eax, DWORD PTR _ovlindex$[ebp]
	push	eax
	call	_copy_index_to_record
	add	esp, 4
; Line 264
	call	_output_record
; Line 265
$L405:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_omf_segdef ENDP
_TEXT	ENDS
PUBLIC	_omf_start_grpdef
_TEXT	SEGMENT
_grpname$ = 8
_omf_start_grpdef PROC NEAR
; Line 269
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 270
	push	154					; 0000009aH
	call	_start_record
	add	esp, 4
; Line 271
	mov	eax, DWORD PTR _grpname$[ebp]
	push	eax
	call	_copy_index_to_record
	add	esp, 4
; Line 272
$L412:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_omf_start_grpdef ENDP
_TEXT	ENDS
PUBLIC	_omf_grpdef
_TEXT	SEGMENT
_segindex$ = 8
_b$ = -4
_omf_grpdef PROC NEAR
; Line 276
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 277
	mov	BYTE PTR _b$[ebp], 255			; 000000ffH
; Line 279
	push	1
	lea	eax, DWORD PTR _b$[ebp]
	push	eax
	call	_copy_bytes_to_record
	add	esp, 8
; Line 280
	mov	eax, DWORD PTR _segindex$[ebp]
	push	eax
	call	_copy_index_to_record
	add	esp, 4
; Line 281
$L415:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_omf_grpdef ENDP
_TEXT	ENDS
PUBLIC	_omf_end_grpdef
_TEXT	SEGMENT
_omf_end_grpdef PROC NEAR
; Line 284
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 285
	call	_output_record
; Line 286
$L418:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_omf_end_grpdef ENDP
_TEXT	ENDS
PUBLIC	_omf_start_comdef
_TEXT	SEGMENT
_omf_start_comdef PROC NEAR
; Line 289
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 290
	push	176					; 000000b0H
	call	_start_record
	add	esp, 4
; Line 291
$L420:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_omf_start_comdef ENDP
_TEXT	ENDS
PUBLIC	_omf_comdef
_TEXT	SEGMENT
_name$ = 8
_dataseg_type$ = 12
_length$ = 16
_el_size$ = 20
_type$ = -4
_omf_comdef PROC NEAR
; Line 296
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 297
	mov	BYTE PTR _type$[ebp], 0
; Line 299
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_copy_string_to_record
	add	esp, 4
; Line 300
	push	1
	lea	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_copy_bytes_to_record
	add	esp, 8
; Line 301
	push	1
	lea	eax, DWORD PTR _dataseg_type$[ebp]
	push	eax
	call	_copy_bytes_to_record
	add	esp, 8
; Line 303
	mov	eax, DWORD PTR _length$[ebp]
	push	eax
	call	_copy_comsize_to_record
	add	esp, 4
; Line 304
	xor	eax, eax
	mov	al, BYTE PTR _dataseg_type$[ebp]
	cmp	eax, 97					; 00000061H
	jne	$L428
; Line 306
	mov	eax, DWORD PTR _el_size$[ebp]
	push	eax
	call	_copy_comsize_to_record
	add	esp, 4
; Line 308
$L428:
$L426:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_omf_comdef ENDP
_TEXT	ENDS
PUBLIC	_omf_end_comdef
_TEXT	SEGMENT
_omf_end_comdef PROC NEAR
; Line 311
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 312
	call	_output_record
; Line 313
$L430:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_omf_end_comdef ENDP
_TEXT	ENDS
PUBLIC	_omf_start_linnum
_TEXT	SEGMENT
_i386$ = 8
_segindex$ = 12
_grpindex$ = -4
_omf_start_linnum PROC NEAR
; Line 316
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 317
	mov	BYTE PTR _grpindex$[ebp], 0
; Line 319
	cmp	DWORD PTR _i386$[ebp], 0
	je	$L436
; Line 320
	push	149					; 00000095H
	call	_start_record
	add	esp, 4
; Line 321
	jmp	$L437
$L436:
; Line 322
	push	148					; 00000094H
	call	_start_record
	add	esp, 4
$L437:
; Line 324
	push	1
	lea	eax, DWORD PTR _grpindex$[ebp]
	push	eax
	call	_copy_bytes_to_record
	add	esp, 8
; Line 325
	mov	eax, DWORD PTR _segindex$[ebp]
	push	eax
	call	_copy_index_to_record
	add	esp, 4
; Line 326
$L434:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_omf_start_linnum ENDP
_TEXT	ENDS
PUBLIC	_omf_linnum
_TEXT	SEGMENT
_i386$ = 8
_line$ = 12
_offset$ = 16
_omf_linnum PROC NEAR
; Line 332
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 333
	mov	eax, DWORD PTR _line$[ebp]
	push	eax
	call	_copy_word_to_record
	add	esp, 4
; Line 334
	mov	eax, DWORD PTR _offset$[ebp]
	push	eax
	mov	eax, DWORD PTR _i386$[ebp]
	push	eax
	call	_copy_offset_to_record
	add	esp, 8
; Line 335
$L442:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_omf_linnum ENDP
_TEXT	ENDS
PUBLIC	_omf_end_linnum
_TEXT	SEGMENT
_omf_end_linnum PROC NEAR
; Line 338
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 339
	call	_output_record
; Line 340
$L444:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_omf_end_linnum ENDP
_TEXT	ENDS
PUBLIC	_omf_start_thread
_TEXT	SEGMENT
_i386$ = 8
_omf_start_thread PROC NEAR
; Line 343
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 344
	cmp	DWORD PTR _i386$[ebp], 0
	je	$L448
; Line 345
	push	157					; 0000009dH
	call	_start_record
	add	esp, 4
; Line 346
	jmp	$L449
$L448:
; Line 347
	push	156					; 0000009cH
	call	_start_record
	add	esp, 4
$L449:
; Line 348
$L447:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_omf_start_thread ENDP
_TEXT	ENDS
PUBLIC	_omf_thread
_TEXT	SEGMENT
_thread$ = 8
_framethread$ = 12
_method$ = 16
_index$ = 20
_thread_data$ = -4
_omf_thread PROC NEAR
; Line 355
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 358
	xor	eax, eax
	mov	al, BYTE PTR _method$[ebp]
	shl	eax, 2
	or	al, BYTE PTR _thread$[ebp]
	mov	BYTE PTR _thread_data$[ebp], al
; Line 359
	cmp	DWORD PTR _framethread$[ebp], 0
	je	$L457
; Line 360
	xor	eax, eax
	mov	al, BYTE PTR _thread_data$[ebp]
	or	al, 64					; 00000040H
	mov	BYTE PTR _thread_data$[ebp], al
; Line 361
$L457:
	push	1
	lea	eax, DWORD PTR _thread_data$[ebp]
	push	eax
	call	_copy_bytes_to_record
	add	esp, 8
; Line 363
	cmp	DWORD PTR _framethread$[ebp], 0
	je	$L458
; Line 365
	xor	eax, eax
	mov	al, BYTE PTR _method$[ebp]
	mov	DWORD PTR -8+[ebp], eax
	jmp	$L459
; Line 367
$L463:
; Line 371
	mov	eax, DWORD PTR _index$[ebp]
	push	eax
	call	_copy_index_to_record
	add	esp, 4
; Line 372
	jmp	$L460
; Line 373
$L464:
; Line 375
	jmp	$L460
; Line 376
	jmp	$L460
$L459:
	cmp	DWORD PTR -8+[ebp], 0
	jl	$L460
	cmp	DWORD PTR -8+[ebp], 3
	jle	$L463
	jmp	$L460
$L460:
; Line 378
	jmp	$L465
$L458:
; Line 379
	mov	eax, DWORD PTR _index$[ebp]
	push	eax
	call	_copy_index_to_record
	add	esp, 4
$L465:
; Line 380
$L455:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_omf_thread ENDP
_TEXT	ENDS
PUBLIC	_omf_end_thread
_TEXT	SEGMENT
_omf_end_thread PROC NEAR
; Line 383
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 384
	call	_output_record
; Line 385
$L467:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_omf_end_thread ENDP
_TEXT	ENDS
PUBLIC	_omf_start_fixup
_TEXT	SEGMENT
_i386$ = 8
_omf_start_fixup PROC NEAR
; Line 388
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 389
	cmp	DWORD PTR _i386$[ebp], 0
	je	$L471
; Line 390
	push	157					; 0000009dH
	call	_start_record
	add	esp, 4
; Line 391
	jmp	$L472
$L471:
; Line 392
	push	156					; 0000009cH
	call	_start_record
	add	esp, 4
$L472:
; Line 393
$L470:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_omf_start_fixup ENDP
_i386$ = 8
_f_thrd$ = 12
_frame$ = 16
_t_thrd$ = 20
_trgt$ = 24
_t_sec$ = 28
_frame_index$ = 32
_target_index$ = 36
_offset$ = 40
_fixdat$ = -8
_generate_fixdat PROC NEAR
; Line 405
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 408
	cmp	DWORD PTR _f_thrd$[ebp], 1
	cmc
	sbb	eax, eax
	and	eax, 128				; 00000080H
	mov	ecx, DWORD PTR _frame$[ebp]
	shl	ecx, 4
	or	al, cl
	mov	BYTE PTR _fixdat$[ebp], al
; Line 409
	cmp	DWORD PTR _t_sec$[ebp], 1
	cmc
	sbb	eax, eax
	and	eax, 4
	cmp	DWORD PTR _t_thrd$[ebp], 1
	cmc
	sbb	ecx, ecx
	and	ecx, 8
	or	eax, ecx
	xor	ecx, ecx
	mov	cl, BYTE PTR _fixdat$[ebp]
	or	eax, ecx
	or	al, BYTE PTR _trgt$[ebp]
	mov	BYTE PTR _fixdat$[ebp], al
; Line 410
	push	1
	lea	eax, DWORD PTR _fixdat$[ebp]
	push	eax
	call	_copy_bytes_to_record
	add	esp, 8
; Line 412
	cmp	DWORD PTR _f_thrd$[ebp], 0
	jne	$L486
; Line 414
	mov	eax, DWORD PTR _frame$[ebp]
	mov	DWORD PTR -12+[ebp], eax
	jmp	$L487
; Line 416
$L491:
; Line 420
	mov	eax, DWORD PTR _frame_index$[ebp]
	push	eax
	call	_copy_index_to_record
	add	esp, 4
; Line 421
	jmp	$L488
; Line 422
$L492:
; Line 424
	jmp	$L488
; Line 425
	jmp	$L488
$L487:
	cmp	DWORD PTR -12+[ebp], 0
	jb	$L488
	cmp	DWORD PTR -12+[ebp], 3
	jbe	$L491
	jmp	$L488
$L488:
; Line 428
$L486:
	cmp	DWORD PTR _t_thrd$[ebp], 0
	jne	$L493
; Line 429
	mov	eax, DWORD PTR _target_index$[ebp]
	push	eax
	call	_copy_index_to_record
	add	esp, 4
; Line 431
$L493:
	cmp	DWORD PTR _t_sec$[ebp], 0
	jne	$L494
; Line 432
	mov	eax, DWORD PTR _offset$[ebp]
	push	eax
	mov	eax, DWORD PTR _i386$[ebp]
	push	eax
	call	_copy_offset_to_record
	add	esp, 8
; Line 433
$L494:
$L483:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_generate_fixdat ENDP
_TEXT	ENDS
PUBLIC	_omf_fixup
_TEXT	SEGMENT
_i386$ = 8
_segrel$ = 12
_loc$ = 16
_data_off$ = 20
_f_thrd$ = 24
_frame$ = 28
_t_thrd$ = 32
_trgt$ = 36
_t_sec$ = 40
_frame_index$ = 44
_target_index$ = 48
_offset$ = 52
_locat$ = -8
_b$ = -4
_omf_fixup PROC NEAR
; Line 447
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 448
	mov	DWORD PTR _locat$[ebp], 32768		; 00008000H
; Line 452
	cmp	DWORD PTR _segrel$[ebp], 1
	cmc
	sbb	eax, eax
	and	eax, 16384				; 00004000H
	xor	ecx, ecx
	mov	cl, BYTE PTR _loc$[ebp]
	shl	ecx, 10					; 0000000aH
	or	eax, ecx
	mov	ecx, DWORD PTR _data_off$[ebp]
	and	ecx, 1023				; 000003ffH
	or	eax, ecx
	or	DWORD PTR _locat$[ebp], eax
; Line 453
	mov	al, BYTE PTR _locat$[ebp+1]
	mov	BYTE PTR _b$[ebp], al
	push	1
	lea	eax, DWORD PTR _b$[ebp]
	push	eax
	call	_copy_bytes_to_record
	add	esp, 8
; Line 454
	mov	al, BYTE PTR _locat$[ebp]
	mov	BYTE PTR _b$[ebp], al
	push	1
	lea	eax, DWORD PTR _b$[ebp]
	push	eax
	call	_copy_bytes_to_record
	add	esp, 8
; Line 456
	mov	eax, DWORD PTR _offset$[ebp]
	push	eax
	mov	eax, DWORD PTR _target_index$[ebp]
	push	eax
	mov	eax, DWORD PTR _frame_index$[ebp]
	push	eax
	mov	eax, DWORD PTR _t_sec$[ebp]
	push	eax
	mov	eax, DWORD PTR _trgt$[ebp]
	push	eax
	mov	eax, DWORD PTR _t_thrd$[ebp]
	push	eax
	mov	eax, DWORD PTR _frame$[ebp]
	push	eax
	mov	eax, DWORD PTR _f_thrd$[ebp]
	push	eax
	mov	eax, DWORD PTR _i386$[ebp]
	push	eax
	call	_generate_fixdat
	add	esp, 36					; 00000024H
; Line 457
$L508:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_omf_fixup ENDP
_TEXT	ENDS
PUBLIC	_omf_end_fixup
_TEXT	SEGMENT
_omf_end_fixup PROC NEAR
; Line 460
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 461
	call	_output_record
; Line 462
$L513:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_omf_end_fixup ENDP
_TEXT	ENDS
PUBLIC	_omf_start_ledata
_TEXT	SEGMENT
_i386$ = 8
_segindex$ = 12
_start_offset$ = 16
_omf_start_ledata PROC NEAR
; Line 468
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 469
	cmp	DWORD PTR _i386$[ebp], 0
	je	$L519
; Line 470
	push	161					; 000000a1H
	call	_start_record
	add	esp, 4
; Line 471
	jmp	$L520
$L519:
; Line 472
	push	160					; 000000a0H
	call	_start_record
	add	esp, 4
$L520:
; Line 474
	mov	eax, DWORD PTR _segindex$[ebp]
	push	eax
	call	_copy_index_to_record
	add	esp, 4
; Line 475
	mov	eax, DWORD PTR _start_offset$[ebp]
	push	eax
	mov	eax, DWORD PTR _i386$[ebp]
	push	eax
	call	_copy_offset_to_record
	add	esp, 8
; Line 476
$L518:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_omf_start_ledata ENDP
_TEXT	ENDS
PUBLIC	_omf_ledata
_TEXT	SEGMENT
_data$ = 8
_count$ = 12
_omf_ledata PROC NEAR
; Line 481
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 482
	mov	eax, DWORD PTR _count$[ebp]
	push	eax
	mov	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_copy_bytes_to_record
	add	esp, 8
; Line 484
$L524:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_omf_ledata ENDP
_TEXT	ENDS
PUBLIC	_omf_end_ledata
_TEXT	SEGMENT
_omf_end_ledata PROC NEAR
; Line 487
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 488
	call	_output_record
; Line 489
$L526:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_omf_end_ledata ENDP
_TEXT	ENDS
PUBLIC	_omf_main_modend
_TEXT	SEGMENT
_i386$ = 8
_f_thrd$ = 12
_frame$ = 16
_t_thrd$ = 20
_trgt$ = 24
_t_sec$ = 28
_frame_index$ = 32
_target_index$ = 36
_offset$ = 40
_mtype$ = -4
_omf_main_modend PROC NEAR
; Line 501
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 502
	mov	BYTE PTR _mtype$[ebp], 193		; 000000c1H
; Line 504
	cmp	DWORD PTR _i386$[ebp], 0
	je	$L539
; Line 505
	push	139					; 0000008bH
	call	_start_record
	add	esp, 4
; Line 506
	jmp	$L540
$L539:
; Line 507
	push	138					; 0000008aH
	call	_start_record
	add	esp, 4
$L540:
; Line 509
	push	1
	lea	eax, DWORD PTR _mtype$[ebp]
	push	eax
	call	_copy_bytes_to_record
	add	esp, 8
; Line 512
	mov	eax, DWORD PTR _offset$[ebp]
	push	eax
	mov	eax, DWORD PTR _target_index$[ebp]
	push	eax
	mov	eax, DWORD PTR _frame_index$[ebp]
	push	eax
	mov	eax, DWORD PTR _t_sec$[ebp]
	push	eax
	mov	eax, DWORD PTR _trgt$[ebp]
	push	eax
	mov	eax, DWORD PTR _t_thrd$[ebp]
	push	eax
	mov	eax, DWORD PTR _frame$[ebp]
	push	eax
	mov	eax, DWORD PTR _f_thrd$[ebp]
	push	eax
	mov	eax, DWORD PTR _i386$[ebp]
	push	eax
	call	_generate_fixdat
	add	esp, 36					; 00000024H
; Line 513
	call	_output_record
; Line 514
$L537:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_omf_main_modend ENDP
_TEXT	ENDS
PUBLIC	_omf_modend
_TEXT	SEGMENT
_i386$ = 8
_mtype$ = -4
_omf_modend PROC NEAR
; Line 518
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 519
	mov	BYTE PTR _mtype$[ebp], 0
; Line 521
	cmp	DWORD PTR _i386$[ebp], 0
	je	$L545
; Line 522
	push	139					; 0000008bH
	call	_start_record
	add	esp, 4
; Line 523
	jmp	$L546
$L545:
; Line 524
	push	138					; 0000008aH
	call	_start_record
	add	esp, 4
$L546:
; Line 526
	push	1
	lea	eax, DWORD PTR _mtype$[ebp]
	push	eax
	call	_copy_bytes_to_record
	add	esp, 8
; Line 527
	call	_output_record
; Line 528
$L543:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_omf_modend ENDP
_TEXT	ENDS
PUBLIC	_omf_initialize_a_out
_TEXT	SEGMENT
_gdb$ = 28
_syms_size$ = 32
_str_size$ = 36
_i$ = -4
_name$ = 8
_text_size$ = 12
_data_size$ = 16
_bss_size$ = 20
_const_size$ = 24
_omf_initialize_a_out PROC NEAR
; Line 625
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 628
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_omf_theadr
	add	esp, 4
; Line 632
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L582
$L583:
	inc	DWORD PTR _i$[ebp]
$L582:
	cmp	DWORD PTR _i$[ebp], 4
	jge	$L584
; Line 633
	mov	eax, DWORD PTR _i$[ebp]
	mov	al, BYTE PTR _fix_cmnt[eax*8]
	and	eax, 255				; 000000ffH
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	al, BYTE PTR _fix_cmnt[eax*8+1]
	and	eax, 255				; 000000ffH
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _fix_cmnt[eax*8+4]
	push	eax
	call	_omf_coment
	add	esp, 12					; 0000000cH
	jmp	$L583
$L584:
; Line 637
	call	_omf_start_lnames
; Line 638
	mov	DWORD PTR _i$[ebp], 1
	jmp	$L585
$L586:
	inc	DWORD PTR _i$[ebp]
$L585:
	cmp	DWORD PTR _gdb$[ebp], 1
	sbb	eax, eax
	and	eax, -4					; fffffffcH
	add	eax, 13					; 0000000dH
	cmp	eax, DWORD PTR _i$[ebp]
	jl	$L587
; Line 639
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _lnames_tab[eax*4]
	push	eax
	call	_omf_lnames
	add	esp, 4
	jmp	$L586
$L587:
; Line 640
	call	_omf_end_lnames
; Line 644
	mov	eax, DWORD PTR _text_size$[ebp]
	mov	DWORD PTR _segt$S563+20, eax
; Line 645
	mov	eax, DWORD PTR _data_size$[ebp]
	mov	DWORD PTR _segt$S563+36, eax
; Line 646
	mov	eax, DWORD PTR _bss_size$[ebp]
	mov	DWORD PTR _segt$S563+68, eax
; Line 647
	mov	eax, DWORD PTR _const_size$[ebp]
	mov	DWORD PTR _segt$S563+52, eax
; Line 648
	cmp	DWORD PTR _gdb$[ebp], 0
	je	$L588
; Line 650
	mov	eax, DWORD PTR _syms_size$[ebp]
	mov	DWORD PTR _segt$S563+84, eax
; Line 651
	mov	eax, DWORD PTR _str_size$[ebp]
	mov	DWORD PTR _segt$S563+100, eax
; Line 653
$L588:
	mov	DWORD PTR _i$[ebp], 1
	jmp	$L589
$L590:
	inc	DWORD PTR _i$[ebp]
$L589:
	cmp	DWORD PTR _gdb$[ebp], 1
	sbb	eax, eax
	and	eax, -2					; fffffffeH
	add	eax, 6
	cmp	eax, DWORD PTR _i$[ebp]
	jl	$L591
; Line 655
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 4
	mov	eax, DWORD PTR _segt$S563[eax+12]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 4
	mov	eax, DWORD PTR _segt$S563[eax+8]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 4
	mov	eax, DWORD PTR _segt$S563[eax+4]
	push	eax
	push	0
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 4
	mov	al, BYTE PTR _segt$S563[eax]
	and	eax, 255				; 000000ffH
	push	eax
	push	1
	call	_omf_segdef
	add	esp, 28					; 0000001cH
	jmp	$L590
$L591:
; Line 658
	push	2
	call	_omf_start_grpdef
	add	esp, 4
; Line 659
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L592
$L593:
	inc	DWORD PTR _i$[ebp]
$L592:
	cmp	DWORD PTR _i$[ebp], 3
	jge	$L594
; Line 660
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _group_tab[eax*4]
	push	eax
	call	_omf_grpdef
	add	esp, 4
	jmp	$L593
$L594:
; Line 661
	call	_omf_end_grpdef
; Line 662
$L580:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_omf_initialize_a_out ENDP
_TEXT	ENDS
END
