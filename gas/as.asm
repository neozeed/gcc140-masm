	TITLE	as.c
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
COMM	_frag_now:DWORD
COMM	_zero_address_frag:BYTE:028H
COMM	_bss_address_frag:BYTE:028H
COMM	_flagseen:BYTE:080H
COMM	_out_file_name:DWORD
COMM	_need_pass_2:DWORD
COMM	_module_name:DWORD
COMM	_text_fix_root:DWORD
COMM	_data_fix_root:DWORD
COMM	_seg_fix_rootP:DWORD
COMM	_myname:DWORD
COMM	_now_subseg:BYTE
COMM	_now_seg:DWORD
_?sig@?1??main@@9@9$S313 DD 00H
	DD	02H
	DD	00H
	DD	0fH
	DD	00H
_?here_before@?1??got_sig@@9@9$S400 DD 00H
_DATA	ENDS
PUBLIC	_got_sig
PUBLIC	_perform_an_assembly_pass
PUBLIC	_main
PUBLIC	_stralloc
EXTRN	_memset:NEAR
EXTRN	_md_begin:NEAR
EXTRN	_fprintf:NEAR
EXTRN	_as_warn:NEAR
EXTRN	_seen_at_least_1_file:NEAR
EXTRN	_strcmp:NEAR
EXTRN	_input_scrub_begin:NEAR
EXTRN	_input_scrub_end:NEAR
EXTRN	_signal:NEAR
EXTRN	_md_parse_option:NEAR
EXTRN	_version_string:BYTE
EXTRN	_md_end:NEAR
EXTRN	_exit:NEAR
EXTRN	__iob:BYTE
EXTRN	_subsegs_begin:NEAR
EXTRN	_symbol_begin:NEAR
EXTRN	_read_begin:NEAR
EXTRN	_write_object_file:NEAR
EXTRN	_bad_error:DWORD
_DATA	SEGMENT
$SG324	DB	'a.out', 00H
	ORG $+2
$SG325	DB	'unknown.s', 00H
	ORG $+2
$SG332	DB	00H
	ORG $+3
$SG338	DB	'%s: Flag option -%c has already been seen!', 00H
	ORG $+1
$SG352	DB	'%s: I expected a filename after -o. "%s" assumed.', 00H
	ORG $+2
$SG353	DB	00H
	ORG $+3
$SG358	DB	'ersion', 00H
	ORG $+1
$SG359	DB	'Unknown -v option ignored', 00H
	ORG $+2
$SG367	DB	'%s: I don''t understand ''%c'' flag!', 00H
_DATA	ENDS
_TEXT	SEGMENT
; File as.c
_argc$ = 8
_argv$ = 12
_work_argc$ = -12
_work_argv$ = -8
_arg$ = -4
_a$ = -16
_main	PROC NEAR
; Line 71
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	push	ebx
	push	esi
	push	edi
; Line 85
	mov	BYTE PTR _a$[ebp], 0
	jmp	$L319
$L320:
	inc	BYTE PTR _a$[ebp]
$L319:
	movsx	eax, BYTE PTR _a$[ebp]
	cmp	DWORD PTR _?sig@?1??main@@9@9$S313[eax*4], 0
	je	$L321
; Line 86
	push	1
	movsx	eax, BYTE PTR _a$[ebp]
	mov	eax, DWORD PTR _?sig@?1??main@@9@9$S313[eax*4]
	push	eax
	call	_signal
	add	esp, 8
	cmp	eax, 1
	je	$L322
; Line 87
	push	OFFSET _got_sig
	movsx	eax, BYTE PTR _a$[ebp]
	mov	eax, DWORD PTR _?sig@?1??main@@9@9$S313[eax*4]
	push	eax
	call	_signal
	add	esp, 8
; Line 89
$L322:
	jmp	$L320
$L321:
	mov	eax, DWORD PTR _argv$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _myname, eax
; Line 90
	push	128					; 00000080H
	push	0
	push	OFFSET _flagseen
	call	_memset
	add	esp, 12					; 0000000cH
; Line 91
	mov	DWORD PTR _out_file_name, OFFSET $SG324
; Line 92
	mov	DWORD PTR _module_name, OFFSET $SG325
; Line 93
	call	_symbol_begin
; Line 94
	call	_subsegs_begin
; Line 95
	call	_read_begin
; Line 96
	call	_md_begin
; Line 97
	call	_input_scrub_begin
; Line 111
	mov	eax, DWORD PTR _argc$[ebp]
	dec	eax
	mov	DWORD PTR _work_argc$[ebp], eax
; Line 112
	mov	eax, DWORD PTR _argv$[ebp]
	add	eax, 4
	mov	DWORD PTR _work_argv$[ebp], eax
; Line 113
	jmp	$L327
$L328:
	add	DWORD PTR _work_argv$[ebp], 4
$L327:
	mov	eax, DWORD PTR _work_argc$[ebp]
	mov	DWORD PTR -20+[ebp], eax
	dec	DWORD PTR _work_argc$[ebp]
	cmp	DWORD PTR -20+[ebp], 0
	je	$L329
; Line 114
	mov	eax, DWORD PTR _work_argv$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _arg$[ebp], eax
; Line 116
	mov	eax, DWORD PTR _arg$[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 45					; 0000002dH
	je	$L330
; Line 117
	jmp	$L328
; Line 118
$L330:
	mov	eax, DWORD PTR _arg$[ebp]
	movsx	eax, BYTE PTR [eax+1]
	cmp	eax, 45					; 0000002dH
	jne	$L331
	mov	eax, DWORD PTR _arg$[ebp]
	movsx	eax, BYTE PTR [eax+2]
	or	eax, eax
	jne	$L331
; Line 121
	mov	eax, DWORD PTR _work_argv$[ebp]
	mov	DWORD PTR [eax], OFFSET $SG332
; Line 122
	jmp	$L328
; Line 125
$L331:
	inc	DWORD PTR _arg$[ebp]
; Line 127
$L334:
	mov	eax, DWORD PTR _arg$[ebp]
	mov	al, BYTE PTR [eax]
	mov	BYTE PTR _a$[ebp], al
	movsx	eax, BYTE PTR _a$[ebp]
	or	eax, eax
	je	$L335
; Line 128
	inc	DWORD PTR _arg$[ebp]
; Line 129
	movsx	eax, BYTE PTR _a$[ebp]
	and	al, 127					; 0000007fH
	mov	BYTE PTR _a$[ebp], al
; Line 130
	movsx	eax, BYTE PTR _a$[ebp]
	movsx	eax, BYTE PTR _flagseen[eax]
	or	eax, eax
	je	$L336
; Line 131
	movsx	eax, BYTE PTR _a$[ebp]
	push	eax
	mov	eax, DWORD PTR _myname
	push	eax
	push	OFFSET $SG338
	call	_as_warn
	add	esp, 12					; 0000000cH
; Line 132
$L336:
	movsx	eax, BYTE PTR _a$[ebp]
	mov	BYTE PTR _flagseen[eax], 1
; Line 133
	movsx	eax, BYTE PTR _a$[ebp]
	mov	DWORD PTR -24+[ebp], eax
	jmp	$L339
; Line 134
$L343:
; Line 135
	jmp	$L340
; Line 137
$L344:
; Line 140
	jmp	$L340
; Line 157
$L345:
; Line 158
	jmp	$L340
; Line 161
$L346:
; Line 162
	jmp	$L340
; Line 164
$L347:
; Line 165
	mov	eax, DWORD PTR _arg$[ebp]
	movsx	eax, BYTE PTR [eax]
	or	eax, eax
	je	$L348
; Line 166
	mov	eax, DWORD PTR _arg$[ebp]
	push	eax
	call	_stralloc
	add	esp, 4
	mov	DWORD PTR _out_file_name, eax
; Line 167
	jmp	$L349
$L348:
	cmp	DWORD PTR _work_argc$[ebp], 0
	je	$L350
; Line 168
	mov	eax, DWORD PTR _work_argv$[ebp]
	mov	DWORD PTR [eax], 0
; Line 169
	dec	DWORD PTR _work_argc$[ebp]
; Line 170
	add	DWORD PTR _work_argv$[ebp], 4
	mov	eax, DWORD PTR _work_argv$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _out_file_name, eax
; Line 171
	jmp	$L351
$L350:
; Line 172
	mov	eax, DWORD PTR _out_file_name
	push	eax
	mov	eax, DWORD PTR _myname
	push	eax
	push	OFFSET $SG352
	call	_as_warn
	add	esp, 12					; 0000000cH
$L351:
$L349:
; Line 173
	mov	DWORD PTR _arg$[ebp], OFFSET $SG353
; Line 174
	jmp	$L340
; Line 176
$L354:
; Line 178
	jmp	$L340
; Line 180
$L355:
; Line 187
	push	OFFSET _version_string
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 8
; Line 188
	mov	eax, DWORD PTR _arg$[ebp]
	movsx	eax, BYTE PTR [eax]
	or	eax, eax
	je	$L357
	push	OFFSET $SG358
	mov	eax, DWORD PTR _arg$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	je	$L357
; Line 189
	push	OFFSET $SG359
	call	_as_warn
	add	esp, 4
; Line 191
$L357:
$L361:
	mov	eax, DWORD PTR _arg$[ebp]
	movsx	eax, BYTE PTR [eax]
	or	eax, eax
	je	$L362
	inc	DWORD PTR _arg$[ebp]
	jmp	$L361
$L362:
; Line 192
	jmp	$L340
; Line 194
$L363:
; Line 196
	jmp	$L340
; Line 198
$L364:
; Line 199
	dec	DWORD PTR _arg$[ebp]
; Line 200
	lea	eax, DWORD PTR _work_argv$[ebp]
	push	eax
	lea	eax, DWORD PTR _work_argc$[ebp]
	push	eax
	lea	eax, DWORD PTR _arg$[ebp]
	push	eax
	call	_md_parse_option
	add	esp, 12					; 0000000cH
	or	eax, eax
	jne	$L366
; Line 201
	movsx	eax, BYTE PTR _a$[ebp]
	push	eax
	mov	eax, DWORD PTR _myname
	push	eax
	push	OFFSET $SG367
	call	_as_warn
	add	esp, 12					; 0000000cH
; Line 202
$L366:
	cmp	DWORD PTR _arg$[ebp], 0
	je	$L368
	mov	eax, DWORD PTR _arg$[ebp]
	movsx	eax, BYTE PTR [eax]
	or	eax, eax
	je	$L368
; Line 203
	inc	DWORD PTR _arg$[ebp]
; Line 204
$L368:
	jmp	$L340
; Line 205
	jmp	$L340
$L339:
	cmp	DWORD PTR -24+[ebp], 102		; 00000066H
	jg	$L405
	je	$L340
	cmp	DWORD PTR -24+[ebp], 68			; 00000044H
	je	$L340
	cmp	DWORD PTR -24+[ebp], 76			; 0000004cH
	je	$L340
	cmp	DWORD PTR -24+[ebp], 82			; 00000052H
	je	$L340
	cmp	DWORD PTR -24+[ebp], 87			; 00000057H
	je	$L340
	jmp	$L364
$L405:
	cmp	DWORD PTR -24+[ebp], 107		; 0000006bH
	je	$L340
	cmp	DWORD PTR -24+[ebp], 111		; 0000006fH
	je	$L347
	cmp	DWORD PTR -24+[ebp], 118		; 00000076H
	je	$L355
	jmp	$L364
$L340:
; Line 206
	jmp	$L334
$L335:
; Line 215
	mov	eax, DWORD PTR _work_argv$[ebp]
	mov	DWORD PTR [eax], 0
; Line 216
	jmp	$L328
$L329:
; Line 222
	mov	eax, DWORD PTR _argv$[ebp]
	push	eax
	mov	eax, DWORD PTR _argc$[ebp]
	push	eax
	call	_perform_an_assembly_pass
	add	esp, 8
; Line 223
	call	_seen_at_least_1_file
	or	eax, eax
	je	$L370
	cmp	DWORD PTR _bad_error, 0
	jne	$L370
; Line 224
	call	_write_object_file
; Line 225
$L370:
	call	_input_scrub_end
; Line 226
	call	_md_end
; Line 228
	mov	eax, DWORD PTR _bad_error
	push	eax
	call	_exit
	add	esp, 4
; Line 232
$L307:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_main	ENDP
_TEXT	ENDS
EXTRN	_input_scrub_new_file:NEAR
EXTRN	_read_a_source_file:NEAR
_DATA	SEGMENT
	ORG $+2
$SG386	DB	00H
_DATA	ENDS
_TEXT	SEGMENT
_argc$ = 8
_argv$ = 12
_buffer$ = -4
_saw_a_file$ = -8
_perform_an_assembly_pass PROC NEAR
; Line 249
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 252
	mov	DWORD PTR _saw_a_file$[ebp], 0
; Line 254
	mov	DWORD PTR _text_fix_root, 0
; Line 255
	mov	DWORD PTR _data_fix_root, 0
; Line 256
	mov	DWORD PTR _need_pass_2, 0
; Line 258
	add	DWORD PTR _argv$[ebp], 4
; Line 259
	dec	DWORD PTR _argc$[ebp]
; Line 260
$L380:
	mov	eax, DWORD PTR _argc$[ebp]
	mov	DWORD PTR -12+[ebp], eax
	dec	DWORD PTR _argc$[ebp]
	cmp	DWORD PTR -12+[ebp], 0
	je	$L381
; Line 261
	mov	eax, DWORD PTR _argv$[ebp]
	cmp	DWORD PTR [eax], 0
	je	$L382
; Line 263
	mov	eax, DWORD PTR _argv$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_input_scrub_new_file
	add	esp, 4
	mov	DWORD PTR _buffer$[ebp], eax
	cmp	DWORD PTR _buffer$[ebp], 0
	je	$L383
; Line 264
	inc	DWORD PTR _saw_a_file$[ebp]
; Line 265
	mov	eax, DWORD PTR _buffer$[ebp]
	push	eax
	call	_read_a_source_file
	add	esp, 4
; Line 267
$L383:
; Line 268
$L382:
	add	DWORD PTR _argv$[ebp], 4
; Line 269
	jmp	$L380
$L381:
; Line 270
	cmp	DWORD PTR _saw_a_file$[ebp], 0
	jne	$L384
; Line 271
	push	OFFSET $SG386
	call	_input_scrub_new_file
	add	esp, 4
	mov	DWORD PTR _buffer$[ebp], eax
	cmp	DWORD PTR _buffer$[ebp], 0
	je	$L385
; Line 272
	mov	eax, DWORD PTR _buffer$[ebp]
	push	eax
	call	_read_a_source_file
	add	esp, 4
; Line 273
$L385:
$L384:
$L375:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_perform_an_assembly_pass ENDP
_TEXT	ENDS
EXTRN	_strlen:NEAR
EXTRN	_strcpy:NEAR
EXTRN	_xmalloc:NEAR
_TEXT	SEGMENT
_str$ = 8
_retval$ = -4
_len$ = -8
_stralloc PROC NEAR
; Line 285
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 289
	mov	eax, DWORD PTR _str$[ebp]
	push	eax
	call	_strlen
	add	esp, 4
	inc	eax
	mov	DWORD PTR _len$[ebp], eax
; Line 290
	mov	eax, DWORD PTR _len$[ebp]
	push	eax
	call	_xmalloc
	add	esp, 4
	mov	DWORD PTR _retval$[ebp], eax
; Line 291
	mov	eax, DWORD PTR _str$[ebp]
	push	eax
	mov	eax, DWORD PTR _retval$[ebp]
	push	eax
	call	_strcpy
	add	esp, 8
; Line 292
	mov	eax, DWORD PTR _retval$[ebp]
	jmp	$L388
; Line 293
$L388:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_stralloc ENDP
_TEXT	ENDS
PUBLIC	_lose
EXTRN	_as_fatal:NEAR
_DATA	SEGMENT
	ORG $+3
$SG396	DB	'%s: 2nd pass not implemented - get your code from random'
	DB	'(3)', 00H
_DATA	ENDS
_TEXT	SEGMENT
_lose	PROC NEAR
; Line 296
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 297
	mov	eax, DWORD PTR _myname
	push	eax
	push	OFFSET $SG396
	call	_as_fatal
	add	esp, 8
; Line 298
$L394:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_lose	ENDP
_TEXT	ENDS
EXTRN	_as_bad:NEAR
_DATA	SEGMENT
$SG402	DB	'Interrupted by signal %d', 00H
_DATA	ENDS
_TEXT	SEGMENT
_sig$ = 8
_got_sig PROC NEAR
; Line 303
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 306
	mov	eax, DWORD PTR _sig$[ebp]
	push	eax
	push	OFFSET $SG402
	call	_as_bad
	add	esp, 8
; Line 307
	mov	eax, DWORD PTR _?here_before@?1??got_sig@@9@9$S400
	mov	DWORD PTR -4+[ebp], eax
	inc	DWORD PTR _?here_before@?1??got_sig@@9@9$S400
	cmp	DWORD PTR -4+[ebp], 0
	je	$L403
; Line 308
	push	1
	call	_exit
	add	esp, 4
; Line 309
$L403:
$L398:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_got_sig ENDP
_TEXT	ENDS
END
