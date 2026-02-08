	TITLE	omfwrite.c
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
_nbytes_r_length$S334 DB 0fH
	DB	00H
	DB	01H
	DB	0fH
	DB	09H
_DATA	ENDS
_TEXT	SEGMENT
; File omfwrite.c
_type$ = 8
_trgt_thrd$ = 12
_frm_thrd$ = 16
_threads PROC NEAR
; Line 66
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 67
	mov	eax, DWORD PTR _type$[ebp]
	mov	DWORD PTR -4+[ebp], eax
	jmp	$L349
; Line 69
$L353:
	mov	eax, DWORD PTR _trgt_thrd$[ebp]
	mov	DWORD PTR [eax], 1
; Line 70
	mov	eax, DWORD PTR _frm_thrd$[ebp]
	mov	DWORD PTR [eax], 1
; Line 71
	jmp	$L350
; Line 72
$L354:
	mov	eax, DWORD PTR _trgt_thrd$[ebp]
	mov	DWORD PTR [eax], 3
; Line 73
	mov	eax, DWORD PTR _frm_thrd$[ebp]
	mov	DWORD PTR [eax], 1
; Line 74
	jmp	$L350
; Line 75
$L355:
	mov	eax, DWORD PTR _trgt_thrd$[ebp]
	mov	DWORD PTR [eax], 2
; Line 76
	mov	eax, DWORD PTR _frm_thrd$[ebp]
	mov	DWORD PTR [eax], 0
; Line 77
	jmp	$L350
; Line 78
$L356:
	mov	eax, DWORD PTR _trgt_thrd$[ebp]
	mov	DWORD PTR [eax], 1
; Line 79
	mov	eax, DWORD PTR _frm_thrd$[ebp]
	mov	DWORD PTR [eax], 1
; Line 80
	jmp	$L350
; Line 81
$L357:
	mov	eax, DWORD PTR _trgt_thrd$[ebp]
	mov	DWORD PTR [eax], 2
; Line 82
	mov	eax, DWORD PTR _frm_thrd$[ebp]
	mov	DWORD PTR [eax], 0
; Line 83
	jmp	$L350
; Line 84
$L358:
	mov	eax, DWORD PTR _trgt_thrd$[ebp]
	mov	DWORD PTR [eax], 0
; Line 85
	mov	eax, DWORD PTR _frm_thrd$[ebp]
	mov	DWORD PTR [eax], 1
; Line 86
	jmp	$L350
; Line 87
	jmp	$L350
$L349:
	cmp	DWORD PTR -4+[ebp], 4
	je	$L355
	cmp	DWORD PTR -4+[ebp], 5
	je	$L357
	cmp	DWORD PTR -4+[ebp], 6
	je	$L353
	cmp	DWORD PTR -4+[ebp], 7
	je	$L356
	cmp	DWORD PTR -4+[ebp], 8
	je	$L354
	jmp	$L358
$L350:
; Line 88
$L348:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_threads ENDP
_TEXT	ENDS
PUBLIC	_write_object_file
EXTRN	_local_bss_counter:DWORD
EXTRN	_symbol_rootP:DWORD
EXTRN	_frag_now:DWORD
EXTRN	_omf_start_pubdef:NEAR
EXTRN	_bss_address_frag:BYTE
EXTRN	_omf_pubdef:NEAR
EXTRN	_omf_end_pubdef:NEAR
EXTRN	_omf_start_thread:NEAR
EXTRN	_omf_thread:NEAR
EXTRN	_omf_end_thread:NEAR
EXTRN	_frag_wane:NEAR
EXTRN	_frag_align:NEAR
EXTRN	_flagseen:BYTE
EXTRN	_out_file_name:DWORD
EXTRN	_module_name:DWORD
EXTRN	_strlen:NEAR
EXTRN	_relax_segment:NEAR
EXTRN	_fixup_segment:NEAR
EXTRN	_omf_start_ledata:NEAR
EXTRN	_omf_ledata:NEAR
EXTRN	_md_convert_frag:NEAR
EXTRN	_frchain_root:DWORD
EXTRN	_as_fatal:NEAR
EXTRN	_data0_frchainP:DWORD
EXTRN	_omf_end_ledata:NEAR
EXTRN	_omf_start_fixup:NEAR
EXTRN	_omf_fixup:NEAR
EXTRN	_omf_end_fixup:NEAR
EXTRN	_omf_initialize_a_out:NEAR
EXTRN	_output_file_create:NEAR
EXTRN	_output_file_close:NEAR
EXTRN	_subseg_change:NEAR
EXTRN	_omf_start_comdef:NEAR
EXTRN	_subseg_new:NEAR
EXTRN	_omf_comdef:NEAR
EXTRN	_omf_modend:NEAR
EXTRN	_omf_end_comdef:NEAR
EXTRN	_text_fix_root:DWORD
EXTRN	_data_fix_root:DWORD
EXTRN	_omf_extdef:NEAR
_BSS	SEGMENT
_text_frag_root$S335 DD 01H DUP (?)
_data_frag_root$S336 DD 01H DUP (?)
_text_last_frag$S337 DD 01H DUP (?)
_data_last_frag$S338 DD 01H DUP (?)
_string_byte_count$S340 DD 01H DUP (?)
_stab_symbol_count$S341 DD 01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+3
$SG420	DB	'omfwrite.c', 00H
	ORG $+1
$SG421	DB	'Case value %d unexpected at line %d of file "%s"', 0aH, 00H
	ORG $+2
$SG433	DB	'omfwrite.c', 00H
	ORG $+1
$SG434	DB	'Case value %d unexpected at line %d of file "%s"', 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_fill_size$512 = -128
_fixP$513 = -124
_symbolP$514 = -120
_started_fixup$515 = -112
_group$452 = -56
_segment$453 = -60
_symbol_number$393 = -52
_trgt_thrd$526 = -136
_frm_thrd$527 = -144
_external$528 = -140
_count$465 = -84
_fill_literal$466 = -68
_fill_size$467 = -80
_fixP$468 = -76
_count$533 = -172
_symbolP$469 = -72
_ncount$534 = -164
_started_fixup$470 = -64
_last_startP$535 = -148
_temp$536 = -156
_fsymP$537 = -152
_i$538 = -168
_start_fixup$539 = -160
_fcount$481 = -88
_trgt_thrd$550 = -176
_frm_thrd$551 = -184
_external$552 = -180
_frchainP$ = -28
_trgt_thrd$490 = -92
_fragP$ = -20
_frm_thrd$491 = -100
_next_frchainP$ = -48
_external$492 = -96
_prev_fragPP$ = -8
_name$ = -12
_symbolP$ = -40
_symbolPP$ = -36
_trgt_thrd$560 = -188
_text_siz$ = -32
_frm_thrd$561 = -196
_data_siz$ = -24
_external$562 = -192
_syms_siz$ = -16
_address$502 = -108
_len$503 = -104
_len$569 = -200
_count$510 = -132
_fill_literal$511 = -116
_write_object_file PROC NEAR
; Line 92
	push	ebp
	mov	ebp, esp
	sub	esp, 256				; 00000100H
	push	ebx
	push	esi
	push	edi
; Line 120
	mov	eax, DWORD PTR _frchain_root
	mov	DWORD PTR _frchainP$[ebp], eax
	jmp	$L377
$L378:
	mov	eax, DWORD PTR _frchainP$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _frchainP$[ebp], eax
$L377:
	cmp	DWORD PTR _frchainP$[ebp], 0
	je	$L379
; Line 122
	mov	eax, DWORD PTR _frchainP$[ebp]
	mov	al, BYTE PTR [eax+16]
	and	eax, 255				; 000000ffH
	push	eax
	mov	eax, DWORD PTR _frchainP$[ebp]
	mov	eax, DWORD PTR [eax+12]
	push	eax
	call	_subseg_new
	add	esp, 8
; Line 123
	push	0
	push	2
	call	_frag_align
	add	esp, 8
; Line 130
	mov	eax, DWORD PTR _frag_now
	push	eax
	call	_frag_wane
	add	esp, 4
; Line 131
	mov	eax, DWORD PTR _frag_now
	mov	DWORD PTR [eax+8], 0
; Line 135
	jmp	$L378
$L379:
; Line 142
	mov	DWORD PTR _prev_fragPP$[ebp], OFFSET _text_frag_root$S335
; Line 143
	mov	eax, DWORD PTR _frchain_root
	mov	DWORD PTR _frchainP$[ebp], eax
	jmp	$L380
$L381:
	mov	eax, DWORD PTR _next_frchainP$[ebp]
	mov	DWORD PTR _frchainP$[ebp], eax
$L380:
	cmp	DWORD PTR _frchainP$[ebp], 0
	je	$L382
; Line 146
	mov	eax, DWORD PTR _frchainP$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _prev_fragPP$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 147
	mov	eax, DWORD PTR _frchainP$[ebp]
	mov	eax, DWORD PTR [eax+4]
	add	eax, 4
	mov	DWORD PTR _prev_fragPP$[ebp], eax
; Line 149
	mov	eax, DWORD PTR _frchainP$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _next_frchainP$[ebp], eax
	cmp	DWORD PTR _next_frchainP$[ebp], 0
	je	$L384
	mov	eax, DWORD PTR _data0_frchainP
	cmp	DWORD PTR _next_frchainP$[ebp], eax
	jne	$L383
$L384:
; Line 151
	mov	DWORD PTR _prev_fragPP$[ebp], OFFSET _data_frag_root$S336
; Line 152
	cmp	DWORD PTR _next_frchainP$[ebp], 0
	je	$L385
; Line 154
	mov	eax, DWORD PTR _frchainP$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _text_last_frag$S337, eax
; Line 156
	jmp	$L386
$L385:
; Line 158
	mov	eax, DWORD PTR _frchainP$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _data_last_frag$S338, eax
; Line 159
$L386:
; Line 161
$L383:
	jmp	$L381
$L382:
; Line 163
	push	1
	mov	eax, DWORD PTR _text_frag_root$S335
	push	eax
	call	_relax_segment
	add	esp, 8
; Line 164
	push	2
	mov	eax, DWORD PTR _data_frag_root$S336
	push	eax
	call	_relax_segment
	add	esp, 8
; Line 169
	mov	eax, DWORD PTR _text_last_frag$S337
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _text_siz$[ebp], eax
; Line 175
	cmp	DWORD PTR _data_frag_root$S336, 0
	je	$L387
; Line 176
	mov	eax, DWORD PTR _data_last_frag$S338
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _data_siz$[ebp], eax
; Line 177
	jmp	$L388
$L387:
; Line 178
	mov	DWORD PTR _data_siz$[ebp], 0
$L388:
; Line 180
	mov	DWORD PTR _bss_address_frag, 0
; Line 202
	mov	DWORD PTR _string_byte_count$S340, 4
; Line 205
	mov	eax, DWORD PTR _symbol_rootP
	mov	DWORD PTR _symbolP$[ebp], eax
	jmp	$L389
$L390:
	mov	eax, DWORD PTR _symbolP$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _symbolP$[ebp], eax
$L389:
	cmp	DWORD PTR _symbolP$[ebp], 0
	je	$L391
; Line 206
	mov	eax, DWORD PTR _symbolP$[ebp]
	cmp	DWORD PTR [eax+28], 0
	je	$L392
; Line 207
	mov	eax, DWORD PTR _symbolP$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax+24]
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _symbolP$[ebp]
	mov	ecx, DWORD PTR [ecx+28]
	add	eax, DWORD PTR [ecx+8]
	mov	ecx, DWORD PTR _symbolP$[ebp]
	add	DWORD PTR [ecx+8], eax
; Line 208
	mov	eax, DWORD PTR _symbolP$[ebp]
	mov	DWORD PTR [eax+28], 0
; Line 210
$L392:
	jmp	$L390
$L391:
; Line 211
	mov	DWORD PTR _symbolPP$[ebp], OFFSET _symbol_rootP
; Line 215
	mov	DWORD PTR _symbol_number$393[ebp], 1
	mov	DWORD PTR _stab_symbol_count$S341, 0
; Line 217
$L395:
	mov	eax, DWORD PTR _symbolPP$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _symbolP$[ebp], eax
	cmp	DWORD PTR _symbolP$[ebp], 0
	je	$L396
; Line 219
	mov	eax, DWORD PTR _symbolP$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _name$[ebp], eax
; Line 220
	mov	eax, DWORD PTR _symbolP$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _symbolP$[ebp]
	add	DWORD PTR [ecx+8], eax
; Line 222
	cmp	DWORD PTR _name$[ebp], 0
	je	$L398
	mov	eax, DWORD PTR _symbolP$[ebp]
	mov	al, BYTE PTR [eax+4]
	and	eax, 255				; 000000ffH
	test	al, 224					; 000000e0H
	jne	$L398
	mov	eax, DWORD PTR _name$[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 1
	je	$L397
	movsx	eax, BYTE PTR _flagseen+76
	or	eax, eax
	jne	$L399
	mov	eax, DWORD PTR _name$[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 76					; 0000004cH
	je	$L397
$L399:
$L398:
; Line 224
	mov	eax, DWORD PTR _symbolP$[ebp]
	mov	al, BYTE PTR [eax+4]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L401
	mov	eax, DWORD PTR _symbolP$[ebp]
	mov	al, BYTE PTR [eax+4]
	and	eax, 255				; 000000ffH
	cmp	eax, 1
	jne	$L400
$L401:
; Line 225
	mov	eax, DWORD PTR _symbol_number$393[ebp]
	mov	ecx, DWORD PTR _symbolP$[ebp]
	mov	DWORD PTR [ecx+16], eax
	inc	DWORD PTR _symbol_number$393[ebp]
; Line 226
	jmp	$L402
$L400:
; Line 227
	mov	eax, DWORD PTR _symbolP$[ebp]
	mov	DWORD PTR [eax+16], 0
$L402:
; Line 228
	mov	eax, DWORD PTR _symbolP$[ebp]
	mov	al, BYTE PTR [eax+4]
	and	eax, 255				; 000000ffH
	test	al, 224					; 000000e0H
	je	$L403
; Line 229
	inc	DWORD PTR _stab_symbol_count$S341
; Line 230
$L403:
	cmp	DWORD PTR _name$[ebp], 0
	je	$L404
	mov	eax, DWORD PTR _symbolP$[ebp]
	mov	al, BYTE PTR [eax+4]
	and	eax, 255				; 000000ffH
	test	al, 224					; 000000e0H
	je	$L404
; Line 232
	mov	eax, DWORD PTR _string_byte_count$S340
	mov	ecx, DWORD PTR _symbolP$[ebp]
	mov	DWORD PTR [ecx+12], eax
; Line 233
	mov	eax, DWORD PTR _symbolP$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_strlen
	add	esp, 4
	inc	eax
	add	DWORD PTR _string_byte_count$S340, eax
; Line 235
	jmp	$L406
$L404:
; Line 236
	mov	eax, DWORD PTR _symbolP$[ebp]
	mov	DWORD PTR [eax+12], 0
$L406:
; Line 237
	mov	eax, DWORD PTR _symbolP$[ebp]
	add	eax, 20					; 00000014H
	mov	DWORD PTR _symbolPP$[ebp], eax
; Line 239
	jmp	$L407
$L397:
; Line 240
	mov	eax, DWORD PTR _symbolP$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	ecx, DWORD PTR _symbolPP$[ebp]
	mov	DWORD PTR [ecx], eax
$L407:
; Line 241
	jmp	$L395
$L396:
; Line 243
	mov	eax, DWORD PTR _symbol_number$393[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	shl	eax, 2
	mov	DWORD PTR _syms_siz$[ebp], eax
; Line 252
	push	0
	push	1
	call	_subseg_change
	add	esp, 8
; Line 254
	mov	eax, DWORD PTR _text_frag_root$S335
	mov	DWORD PTR _fragP$[ebp], eax
	jmp	$L408
$L409:
	mov	eax, DWORD PTR _fragP$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _fragP$[ebp], eax
$L408:
	cmp	DWORD PTR _fragP$[ebp], 0
	je	$L410
; Line 256
	mov	eax, DWORD PTR _fragP$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR -252+[ebp], eax
	jmp	$L411
; Line 258
$L415:
; Line 260
	mov	eax, DWORD PTR _fragP$[ebp]
	mov	DWORD PTR [eax+28], 0
; Line 266
	mov	eax, DWORD PTR _fragP$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _fragP$[ebp]
	sub	eax, DWORD PTR [ecx]
	mov	ecx, DWORD PTR _fragP$[ebp]
	sub	eax, DWORD PTR [ecx+8]
	mov	ecx, DWORD PTR _fragP$[ebp]
	mov	DWORD PTR [ecx+20], eax
; Line 267
	jmp	$L412
; Line 269
$L416:
; Line 270
	jmp	$L412
; Line 272
$L417:
; Line 273
	mov	eax, DWORD PTR _fragP$[ebp]
	push	eax
	call	_md_convert_frag
	add	esp, 4
; Line 279
	mov	eax, DWORD PTR _fragP$[ebp]
	push	eax
	call	_frag_wane
	add	esp, 4
; Line 280
	jmp	$L412
; Line 282
$L418:
; Line 283
	push	OFFSET $SG420
	push	283					; 0000011bH
	mov	eax, DWORD PTR _fragP$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	push	OFFSET $SG421
	call	_as_fatal
	add	esp, 16					; 00000010H
; Line 284
	jmp	$L412
; Line 285
	jmp	$L412
$L411:
	cmp	DWORD PTR -252+[ebp], 0
	je	$L412
	cmp	DWORD PTR -252+[ebp], 1
	jl	$L418
	cmp	DWORD PTR -252+[ebp], 2
	jle	$L415
	cmp	DWORD PTR -252+[ebp], 3
	je	$L417
	jmp	$L418
$L412:
; Line 286
	jmp	$L409
$L410:
; Line 289
	push	0
	push	2
	call	_subseg_change
	add	esp, 8
; Line 291
	mov	eax, DWORD PTR _data_frag_root$S336
	mov	DWORD PTR _fragP$[ebp], eax
	jmp	$L422
$L423:
	mov	eax, DWORD PTR _fragP$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _fragP$[ebp], eax
$L422:
	cmp	DWORD PTR _fragP$[ebp], 0
	je	$L424
; Line 293
	mov	eax, DWORD PTR _fragP$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR -256+[ebp], eax
	jmp	$L425
; Line 295
$L429:
; Line 297
	mov	eax, DWORD PTR _fragP$[ebp]
	mov	DWORD PTR [eax+28], 0
; Line 303
	mov	eax, DWORD PTR _fragP$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _fragP$[ebp]
	sub	eax, DWORD PTR [ecx]
	mov	ecx, DWORD PTR _fragP$[ebp]
	sub	eax, DWORD PTR [ecx+8]
	mov	ecx, DWORD PTR _fragP$[ebp]
	mov	DWORD PTR [ecx+20], eax
; Line 304
	jmp	$L426
; Line 306
$L430:
; Line 307
	jmp	$L426
; Line 309
$L431:
; Line 310
	mov	eax, DWORD PTR _fragP$[ebp]
	push	eax
	call	_md_convert_frag
	add	esp, 4
; Line 316
	mov	eax, DWORD PTR _fragP$[ebp]
	push	eax
	call	_frag_wane
	add	esp, 4
; Line 317
	jmp	$L426
; Line 319
$L432:
; Line 320
	push	OFFSET $SG433
	push	320					; 00000140H
	mov	eax, DWORD PTR _fragP$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	push	OFFSET $SG434
	call	_as_fatal
	add	esp, 16					; 00000010H
; Line 321
	jmp	$L426
; Line 322
	jmp	$L426
$L425:
	cmp	DWORD PTR -256+[ebp], 0
	je	$L426
	cmp	DWORD PTR -256+[ebp], 1
	jl	$L432
	cmp	DWORD PTR -256+[ebp], 2
	jle	$L429
	cmp	DWORD PTR -256+[ebp], 3
	je	$L431
	jmp	$L432
$L426:
; Line 323
	jmp	$L423
$L424:
; Line 325
	push	0
	push	1
	call	_subseg_change
	add	esp, 8
; Line 327
	push	4
	mov	eax, DWORD PTR _text_fix_root
	push	eax
	call	_fixup_segment
	add	esp, 8
; Line 328
	push	6
	mov	eax, DWORD PTR _data_fix_root
	push	eax
	call	_fixup_segment
	add	esp, 8
; Line 329
	mov	eax, DWORD PTR _out_file_name
	push	eax
	call	_output_file_create
	add	esp, 4
; Line 333
	mov	eax, DWORD PTR _string_byte_count$S340
	push	eax
	mov	eax, DWORD PTR _stab_symbol_count$S341
	lea	eax, DWORD PTR [eax+eax*2]
	shl	eax, 2
	push	eax
	movsx	eax, BYTE PTR _flagseen+103
	push	eax
	push	0
	mov	eax, DWORD PTR _local_bss_counter
	push	eax
	mov	eax, DWORD PTR _data_siz$[ebp]
	push	eax
	mov	eax, DWORD PTR _text_siz$[ebp]
	push	eax
	mov	eax, DWORD PTR _module_name
	push	eax
	call	_omf_initialize_a_out
	add	esp, 32					; 00000020H
; Line 339
	mov	eax, DWORD PTR _symbol_rootP
	mov	DWORD PTR _symbolP$[ebp], eax
	jmp	$L436
$L437:
	mov	eax, DWORD PTR _symbolP$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _symbolP$[ebp], eax
$L436:
	cmp	DWORD PTR _symbolP$[ebp], 0
	je	$L438
; Line 341
	mov	eax, DWORD PTR _symbolP$[ebp]
	mov	al, BYTE PTR [eax+4]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L440
	mov	eax, DWORD PTR _symbolP$[ebp]
	mov	al, BYTE PTR [eax+4]
	and	eax, 255				; 000000ffH
	cmp	eax, 1
	jne	$L439
$L440:
; Line 343
	mov	eax, DWORD PTR _symbolP$[ebp]
	mov	al, BYTE PTR [eax+4]
	and	eax, 255				; 000000ffH
	cmp	eax, 1
	jne	$L441
; Line 345
	call	_omf_start_comdef
; Line 346
	push	0
	mov	eax, DWORD PTR _symbolP$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	push	98					; 00000062H
	mov	eax, DWORD PTR _symbolP$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_omf_comdef
	add	esp, 16					; 00000010H
; Line 347
	call	_omf_end_comdef
; Line 349
	jmp	$L445
$L441:
; Line 350
	push	0
	mov	eax, DWORD PTR _symbolP$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_omf_extdef
	add	esp, 8
$L445:
; Line 352
$L439:
	jmp	$L437
$L438:
; Line 357
	mov	eax, DWORD PTR _symbol_rootP
	mov	DWORD PTR _symbolP$[ebp], eax
	jmp	$L447
$L448:
	mov	eax, DWORD PTR _symbolP$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _symbolP$[ebp], eax
$L447:
	cmp	DWORD PTR _symbolP$[ebp], 0
	je	$L449
; Line 359
	mov	eax, DWORD PTR _symbolP$[ebp]
	mov	al, BYTE PTR [eax+4]
	and	eax, 255				; 000000ffH
	cmp	eax, 7
	je	$L451
	mov	eax, DWORD PTR _symbolP$[ebp]
	mov	al, BYTE PTR [eax+4]
	and	eax, 255				; 000000ffH
	cmp	eax, 5
	je	$L451
	mov	eax, DWORD PTR _symbolP$[ebp]
	mov	al, BYTE PTR [eax+4]
	and	eax, 255				; 000000ffH
	cmp	eax, 3
	jne	$L450
$L451:
; Line 361
	mov	DWORD PTR _group$452[ebp], 0
	mov	DWORD PTR _segment$453[ebp], 0
; Line 363
	mov	eax, DWORD PTR _symbolP$[ebp]
	mov	al, BYTE PTR [eax+4]
	and	eax, 255				; 000000ffH
	cmp	eax, 5
	jne	$L454
; Line 364
	mov	DWORD PTR _segment$453[ebp], 1
; Line 365
$L454:
	mov	eax, DWORD PTR _symbolP$[ebp]
	mov	al, BYTE PTR [eax+4]
	and	eax, 255				; 000000ffH
	cmp	eax, 7
	jne	$L455
; Line 367
	mov	DWORD PTR _group$452[ebp], 1
	mov	DWORD PTR _segment$453[ebp], 2
; Line 370
$L455:
	push	0
	mov	eax, DWORD PTR _segment$453[ebp]
	push	eax
	mov	eax, DWORD PTR _group$452[ebp]
	push	eax
	push	1
	call	_omf_start_pubdef
	add	esp, 16					; 00000010H
; Line 371
	push	0
	mov	eax, DWORD PTR _symbolP$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _symbolP$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	push	1
	call	_omf_pubdef
	add	esp, 16					; 00000010H
; Line 372
	call	_omf_end_pubdef
; Line 374
$L450:
	jmp	$L448
$L449:
; Line 379
	push	1
	call	_omf_start_thread
	add	esp, 4
; Line 380
	push	3
	push	0
	push	0
	push	0
	call	_omf_thread
	add	esp, 16					; 00000010H
; Line 381
	push	2
	push	0
	push	0
	push	1
	call	_omf_thread
	add	esp, 16					; 00000010H
; Line 382
	push	1
	push	0
	push	0
	push	2
	call	_omf_thread
	add	esp, 16					; 00000010H
; Line 383
	push	4
	push	0
	push	0
	push	3
	call	_omf_thread
	add	esp, 16					; 00000010H
; Line 384
	push	1
	push	0
	push	1
	push	0
	call	_omf_thread
	add	esp, 16					; 00000010H
; Line 385
	push	1
	push	1
	push	1
	push	1
	call	_omf_thread
	add	esp, 16					; 00000010H
; Line 386
	call	_omf_end_thread
; Line 392
	mov	eax, DWORD PTR _data_frag_root$S336
	mov	DWORD PTR _fragP$[ebp], eax
	jmp	$L462
$L463:
	mov	eax, DWORD PTR _fragP$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _fragP$[ebp], eax
$L462:
	cmp	DWORD PTR _fragP$[ebp], 0
	je	$L464
; Line 403
	mov	eax, DWORD PTR _fragP$[ebp]
	cmp	DWORD PTR [eax+8], 0
	jne	$L472
	mov	eax, DWORD PTR _fragP$[ebp]
	cmp	DWORD PTR [eax+20], 0
	je	$L471
$L472:
; Line 405
	mov	eax, DWORD PTR _fragP$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	push	2
	push	1
	call	_omf_start_ledata
	add	esp, 12					; 0000000cH
; Line 406
	mov	eax, DWORD PTR _fragP$[ebp]
	cmp	DWORD PTR [eax+8], 0
	je	$L474
; Line 407
	mov	eax, DWORD PTR _fragP$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _fragP$[ebp]
	add	eax, 38					; 00000026H
	push	eax
	call	_omf_ledata
	add	esp, 8
; Line 408
$L474:
	mov	eax, DWORD PTR _fragP$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, DWORD PTR _fragP$[ebp]
	add	eax, 38					; 00000026H
	mov	DWORD PTR _fill_literal$466[ebp], eax
; Line 409
	mov	eax, DWORD PTR _fragP$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _fill_size$467[ebp], eax
; Line 410
	mov	eax, DWORD PTR _fragP$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _count$465[ebp], eax
; Line 411
	mov	eax, DWORD PTR _fill_size$467[ebp]
	imul	eax, DWORD PTR _count$465[ebp]
	mov	ecx, DWORD PTR _fragP$[ebp]
	add	eax, DWORD PTR [ecx+8]
	cmp	eax, 1016				; 000003f8H
	jge	$L476
; Line 413
	jmp	$L477
$L478:
	dec	DWORD PTR _count$465[ebp]
$L477:
	cmp	DWORD PTR _count$465[ebp], 0
	je	$L479
; Line 414
	mov	eax, DWORD PTR _fill_size$467[ebp]
	push	eax
	mov	eax, DWORD PTR _fill_literal$466[ebp]
	push	eax
	call	_omf_ledata
	add	esp, 8
	jmp	$L478
$L479:
; Line 416
	jmp	$L480
$L476:
; Line 424
	mov	eax, 1016				; 000003f8H
	mov	ecx, DWORD PTR _fragP$[ebp]
	sub	eax, DWORD PTR [ecx+8]
	cdq
	idiv	DWORD PTR _fill_size$467[ebp]
	mov	DWORD PTR _fcount$481[ebp], eax
; Line 425
	sub	eax, eax
	sub	eax, DWORD PTR _fcount$481[ebp]
	neg	eax
	sub	DWORD PTR _count$465[ebp], eax
; Line 426
	jmp	$L482
$L483:
	dec	DWORD PTR _fcount$481[ebp]
$L482:
	cmp	DWORD PTR _fcount$481[ebp], 0
	jle	$L484
; Line 427
	mov	eax, DWORD PTR _fill_size$467[ebp]
	push	eax
	mov	eax, DWORD PTR _fill_literal$466[ebp]
	push	eax
	call	_omf_ledata
	add	esp, 8
	jmp	$L483
$L484:
; Line 429
$L480:
; Line 430
	call	_omf_end_ledata
; Line 435
	mov	eax, DWORD PTR _data_fix_root
	mov	DWORD PTR _fixP$468[ebp], eax
	mov	DWORD PTR _started_fixup$470[ebp], 0
; Line 436
	jmp	$L486
$L487:
	mov	eax, DWORD PTR _fixP$468[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _fixP$468[ebp], eax
$L486:
	cmp	DWORD PTR _fixP$468[ebp], 0
	je	$L488
; Line 438
	mov	eax, DWORD PTR _fixP$468[ebp]
	mov	ecx, DWORD PTR _fragP$[ebp]
	cmp	DWORD PTR [eax], ecx
	jne	$L489
	mov	eax, DWORD PTR _fixP$468[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _symbolP$469[ebp], eax
	cmp	DWORD PTR _symbolP$469[ebp], 0
	je	$L489
; Line 441
	mov	eax, DWORD PTR _symbolP$469[ebp]
	mov	al, BYTE PTR [eax+4]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L575
	mov	eax, DWORD PTR _symbolP$469[ebp]
	mov	al, BYTE PTR [eax+4]
	and	eax, 255				; 000000ffH
	cmp	eax, 1
	jne	$L573
$L575:
	mov	DWORD PTR _external$492[ebp], 1
	jmp	$L574
$L573:
	mov	DWORD PTR _external$492[ebp], 0
$L574:
; Line 443
	lea	eax, DWORD PTR _frm_thrd$491[ebp]
	push	eax
	lea	eax, DWORD PTR _trgt_thrd$490[ebp]
	push	eax
	mov	eax, DWORD PTR _symbolP$469[ebp]
	mov	al, BYTE PTR [eax+4]
	and	eax, 255				; 000000ffH
	push	eax
	call	_threads
	add	esp, 12					; 0000000cH
; Line 444
	mov	eax, DWORD PTR _fixP$468[ebp]
	movsx	eax, BYTE PTR [eax+26]
	or	eax, eax
	je	$L493
; Line 445
	mov	DWORD PTR _frm_thrd$491[ebp], 0
; Line 447
$L493:
	cmp	DWORD PTR _started_fixup$470[ebp], 0
	jne	$L494
; Line 449
	push	1
	call	_omf_start_fixup
	add	esp, 4
; Line 450
	inc	DWORD PTR _started_fixup$470[ebp]
; Line 452
$L494:
; Line 461
	mov	eax, DWORD PTR _symbolP$469[ebp]
	mov	al, BYTE PTR [eax+4]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L578
	mov	eax, DWORD PTR _symbolP$469[ebp]
	mov	al, BYTE PTR [eax+4]
	and	eax, 255				; 000000ffH
	cmp	eax, 1
	jne	$L576
$L578:
	mov	eax, DWORD PTR _symbolP$469[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR -204+[ebp], eax
	jmp	$L577
$L576:
	mov	DWORD PTR -204+[ebp], 0
$L577:
	cmp	DWORD PTR _external$492[ebp], 0
	je	$L579
	mov	DWORD PTR -208+[ebp], 2
	jmp	$L580
$L579:
	mov	eax, DWORD PTR _trgt_thrd$490[ebp]
	mov	DWORD PTR -208+[ebp], eax
$L580:
	cmp	DWORD PTR _external$492[ebp], 0
	je	$L581
	mov	DWORD PTR -212+[ebp], 5
	jmp	$L582
$L581:
	mov	eax, DWORD PTR _frm_thrd$491[ebp]
	mov	DWORD PTR -212+[ebp], eax
$L582:
	push	0
	mov	eax, DWORD PTR -204+[ebp]
	push	eax
	push	0
	push	1
	mov	eax, DWORD PTR -208+[ebp]
	push	eax
	cmp	DWORD PTR _external$492[ebp], 1
	sbb	eax, eax
	neg	eax
	push	eax
	mov	eax, DWORD PTR -212+[ebp]
	push	eax
	cmp	DWORD PTR _external$492[ebp], 1
	sbb	eax, eax
	neg	eax
	push	eax
	mov	eax, DWORD PTR _fixP$468[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _fixP$468[ebp]
	movsx	eax, WORD PTR [eax+24]
	mov	al, BYTE PTR _nbytes_r_length$S334[eax]
	and	eax, 255				; 000000ffH
	push	eax
	mov	eax, DWORD PTR _fixP$468[ebp]
	movsx	eax, BYTE PTR [eax+26]
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	push	eax
	push	1
	call	_omf_fixup
	add	esp, 48					; 00000030H
; Line 463
$L489:
	jmp	$L487
$L488:
; Line 464
	cmp	DWORD PTR _started_fixup$470[ebp], 0
	je	$L497
; Line 465
	call	_omf_end_fixup
; Line 467
$L497:
$L500:
	cmp	DWORD PTR _count$465[ebp], 0
	jle	$L501
; Line 473
	mov	eax, DWORD PTR _fragP$[ebp]
	mov	eax, DWORD PTR [eax+20]
	sub	eax, DWORD PTR _count$465[ebp]
	imul	eax, DWORD PTR _fill_size$467[ebp]
	mov	ecx, DWORD PTR _fragP$[ebp]
	add	eax, DWORD PTR [ecx+8]
	mov	ecx, DWORD PTR _fragP$[ebp]
	add	eax, DWORD PTR [ecx]
	mov	DWORD PTR _address$502[ebp], eax
; Line 474
	mov	eax, DWORD PTR _address$502[ebp]
	push	eax
	push	2
	push	1
	call	_omf_start_ledata
	add	esp, 12					; 0000000cH
; Line 475
	mov	DWORD PTR _len$503[ebp], 0
	jmp	$L504
$L505:
	dec	DWORD PTR _count$465[ebp]
	mov	eax, DWORD PTR _fill_size$467[ebp]
	add	DWORD PTR _len$503[ebp], eax
$L504:
	cmp	DWORD PTR _count$465[ebp], 0
	je	$L506
	cmp	DWORD PTR _len$503[ebp], 1000		; 000003e8H
	jae	$L506
; Line 476
	mov	eax, DWORD PTR _fill_size$467[ebp]
	push	eax
	mov	eax, DWORD PTR _fill_literal$466[ebp]
	push	eax
	call	_omf_ledata
	add	esp, 8
	jmp	$L505
$L506:
; Line 477
	call	_omf_end_ledata
; Line 478
	jmp	$L500
$L501:
; Line 480
$L471:
	jmp	$L463
$L464:
; Line 482
	mov	eax, DWORD PTR _text_frag_root$S335
	mov	DWORD PTR _fragP$[ebp], eax
	jmp	$L507
$L508:
	mov	eax, DWORD PTR _fragP$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _fragP$[ebp], eax
$L507:
	cmp	DWORD PTR _fragP$[ebp], 0
	je	$L509
; Line 493
	mov	eax, DWORD PTR _fragP$[ebp]
	cmp	DWORD PTR [eax+8], 0
	jne	$L517
	mov	eax, DWORD PTR _fragP$[ebp]
	cmp	DWORD PTR [eax+20], 0
	je	$L516
$L517:
; Line 495
	mov	eax, DWORD PTR _fragP$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	push	1
	push	1
	call	_omf_start_ledata
	add	esp, 12					; 0000000cH
; Line 496
	mov	eax, DWORD PTR _fragP$[ebp]
	cmp	DWORD PTR [eax+8], 0
	je	$L518
; Line 497
	mov	eax, DWORD PTR _fragP$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _fragP$[ebp]
	add	eax, 38					; 00000026H
	push	eax
	call	_omf_ledata
	add	esp, 8
; Line 498
$L518:
	mov	eax, DWORD PTR _fragP$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, DWORD PTR _fragP$[ebp]
	add	eax, 38					; 00000026H
	mov	DWORD PTR _fill_literal$511[ebp], eax
; Line 499
	mov	eax, DWORD PTR _fragP$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _fill_size$512[ebp], eax
; Line 500
	mov	eax, DWORD PTR _fragP$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _count$510[ebp], eax
	jmp	$L519
$L520:
	dec	DWORD PTR _count$510[ebp]
$L519:
	cmp	DWORD PTR _count$510[ebp], 0
	je	$L521
; Line 501
	mov	eax, DWORD PTR _fill_size$512[ebp]
	push	eax
	mov	eax, DWORD PTR _fill_literal$511[ebp]
	push	eax
	call	_omf_ledata
	add	esp, 8
	jmp	$L520
$L521:
; Line 502
	call	_omf_end_ledata
; Line 507
	mov	eax, DWORD PTR _text_fix_root
	mov	DWORD PTR _fixP$513[ebp], eax
	mov	DWORD PTR _started_fixup$515[ebp], 0
; Line 508
	jmp	$L522
$L523:
	mov	eax, DWORD PTR _fixP$513[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _fixP$513[ebp], eax
$L522:
	cmp	DWORD PTR _fixP$513[ebp], 0
	je	$L524
; Line 510
	mov	eax, DWORD PTR _fixP$513[ebp]
	mov	ecx, DWORD PTR _fragP$[ebp]
	cmp	DWORD PTR [eax], ecx
	jne	$L525
	mov	eax, DWORD PTR _fixP$513[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _symbolP$514[ebp], eax
	cmp	DWORD PTR _symbolP$514[ebp], 0
	je	$L525
; Line 513
	mov	eax, DWORD PTR _symbolP$514[ebp]
	mov	al, BYTE PTR [eax+4]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L585
	mov	eax, DWORD PTR _symbolP$514[ebp]
	mov	al, BYTE PTR [eax+4]
	and	eax, 255				; 000000ffH
	cmp	eax, 1
	jne	$L583
$L585:
	mov	DWORD PTR _external$528[ebp], 1
	jmp	$L584
$L583:
	mov	DWORD PTR _external$528[ebp], 0
$L584:
; Line 515
	lea	eax, DWORD PTR _frm_thrd$527[ebp]
	push	eax
	lea	eax, DWORD PTR _trgt_thrd$526[ebp]
	push	eax
	mov	eax, DWORD PTR _symbolP$514[ebp]
	mov	al, BYTE PTR [eax+4]
	and	eax, 255				; 000000ffH
	push	eax
	call	_threads
	add	esp, 12					; 0000000cH
; Line 516
	mov	eax, DWORD PTR _fixP$513[ebp]
	movsx	eax, BYTE PTR [eax+26]
	or	eax, eax
	je	$L529
; Line 517
	mov	DWORD PTR _frm_thrd$527[ebp], 0
; Line 519
$L529:
	cmp	DWORD PTR _started_fixup$515[ebp], 0
	jne	$L530
; Line 521
	push	1
	call	_omf_start_fixup
	add	esp, 4
; Line 522
	inc	DWORD PTR _started_fixup$515[ebp]
; Line 524
$L530:
; Line 533
	cmp	DWORD PTR _external$528[ebp], 0
	je	$L586
	mov	eax, DWORD PTR _symbolP$514[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR -216+[ebp], eax
	jmp	$L587
$L586:
	mov	DWORD PTR -216+[ebp], 0
$L587:
	cmp	DWORD PTR _external$528[ebp], 0
	je	$L588
	mov	DWORD PTR -220+[ebp], 2
	jmp	$L589
$L588:
	mov	eax, DWORD PTR _trgt_thrd$526[ebp]
	mov	DWORD PTR -220+[ebp], eax
$L589:
	cmp	DWORD PTR _external$528[ebp], 0
	je	$L590
	mov	DWORD PTR -224+[ebp], 5
	jmp	$L591
$L590:
	mov	eax, DWORD PTR _frm_thrd$527[ebp]
	mov	DWORD PTR -224+[ebp], eax
$L591:
	push	0
	mov	eax, DWORD PTR -216+[ebp]
	push	eax
	push	0
	push	1
	mov	eax, DWORD PTR -220+[ebp]
	push	eax
	cmp	DWORD PTR _external$528[ebp], 1
	sbb	eax, eax
	neg	eax
	push	eax
	mov	eax, DWORD PTR -224+[ebp]
	push	eax
	cmp	DWORD PTR _external$528[ebp], 1
	sbb	eax, eax
	neg	eax
	push	eax
	mov	eax, DWORD PTR _fixP$513[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _fixP$513[ebp]
	movsx	eax, WORD PTR [eax+24]
	mov	al, BYTE PTR _nbytes_r_length$S334[eax]
	and	eax, 255				; 000000ffH
	push	eax
	mov	eax, DWORD PTR _fixP$513[ebp]
	movsx	eax, BYTE PTR [eax+26]
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	push	eax
	push	1
	call	_omf_fixup
	add	esp, 48					; 00000030H
; Line 535
$L525:
	jmp	$L523
$L524:
; Line 536
	cmp	DWORD PTR _started_fixup$515[ebp], 0
	je	$L531
; Line 537
	call	_omf_end_fixup
; Line 538
$L531:
; Line 539
$L516:
	jmp	$L508
$L509:
; Line 546
	movsx	eax, BYTE PTR _flagseen+103
	or	eax, eax
	je	$L532
	cmp	DWORD PTR _stab_symbol_count$S341, 0
	je	$L532
; Line 548
	mov	DWORD PTR _count$533[ebp], 0
	mov	DWORD PTR _ncount$534[ebp], 0
; Line 553
	mov	DWORD PTR _start_fixup$539[ebp], 0
; Line 555
	push	0
	push	5
	push	1
	call	_omf_start_ledata
	add	esp, 12					; 0000000cH
; Line 556
	mov	eax, DWORD PTR _symbol_rootP
	mov	DWORD PTR _last_startP$535[ebp], eax
; Line 557
	mov	eax, DWORD PTR _symbol_rootP
	mov	DWORD PTR _symbolP$[ebp], eax
	jmp	$L540
$L541:
	mov	eax, DWORD PTR _symbolP$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _symbolP$[ebp], eax
$L540:
	cmp	DWORD PTR _symbolP$[ebp], 0
	je	$L542
; Line 559
	mov	eax, DWORD PTR _symbolP$[ebp]
	mov	al, BYTE PTR [eax+4]
	and	eax, 255				; 000000ffH
	test	al, 224					; 000000e0H
	je	$L543
; Line 561
	mov	eax, DWORD PTR _ncount$534[ebp]
	lea	eax, DWORD PTR [eax+eax*2+3]
	shl	eax, 2
	cmp	eax, 1016				; 000003f8H
	jb	$L544
; Line 563
	call	_omf_end_ledata
; Line 567
	mov	DWORD PTR _start_fixup$539[ebp], 0
; Line 568
	mov	DWORD PTR _i$538[ebp], 0
	mov	eax, DWORD PTR _last_startP$535[ebp]
	mov	DWORD PTR _fsymP$537[ebp], eax
	jmp	$L545
$L546:
	mov	eax, DWORD PTR _fsymP$537[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _fsymP$537[ebp], eax
$L545:
	mov	eax, DWORD PTR _ncount$534[ebp]
	cmp	DWORD PTR _i$538[ebp], eax
	jge	$L547
; Line 570
	mov	eax, DWORD PTR _fsymP$537[ebp]
	mov	al, BYTE PTR [eax+4]
	and	eax, 255				; 000000ffH
	test	al, 224					; 000000e0H
	je	$L548
; Line 572
	mov	eax, DWORD PTR _fsymP$537[ebp]
	mov	al, BYTE PTR [eax+4]
	and	eax, 255				; 000000ffH
	test	al, 30					; 0000001eH
	je	$L549
; Line 575
	mov	eax, DWORD PTR _fsymP$537[ebp]
	mov	al, BYTE PTR [eax+4]
	and	eax, 255				; 000000ffH
	test	al, 30					; 0000001eH
	je	$L594
	mov	eax, DWORD PTR _fsymP$537[ebp]
	mov	al, BYTE PTR [eax+4]
	and	eax, 30					; 0000001eH
	cmp	al, 1
	jne	$L592
$L594:
	mov	DWORD PTR _external$552[ebp], 1
	jmp	$L593
$L592:
	mov	DWORD PTR _external$552[ebp], 0
$L593:
; Line 577
	lea	eax, DWORD PTR _frm_thrd$551[ebp]
	push	eax
	lea	eax, DWORD PTR _trgt_thrd$550[ebp]
	push	eax
	mov	eax, DWORD PTR _fsymP$537[ebp]
	mov	al, BYTE PTR [eax+4]
	and	eax, 30					; 0000001eH
	push	eax
	call	_threads
	add	esp, 12					; 0000000cH
; Line 578
	cmp	DWORD PTR _start_fixup$539[ebp], 0
	jne	$L553
; Line 580
	push	1
	call	_omf_start_fixup
	add	esp, 4
; Line 581
	inc	DWORD PTR _start_fixup$539[ebp]
; Line 583
$L553:
; Line 592
	cmp	DWORD PTR _external$552[ebp], 0
	je	$L595
	mov	eax, DWORD PTR _fsymP$537[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR -228+[ebp], eax
	jmp	$L596
$L595:
	mov	DWORD PTR -228+[ebp], 0
$L596:
	cmp	DWORD PTR _external$552[ebp], 0
	je	$L597
	mov	DWORD PTR -232+[ebp], 2
	jmp	$L598
$L597:
	mov	eax, DWORD PTR _trgt_thrd$550[ebp]
	mov	DWORD PTR -232+[ebp], eax
$L598:
	cmp	DWORD PTR _external$552[ebp], 0
	je	$L599
	mov	DWORD PTR -236+[ebp], 5
	jmp	$L600
$L599:
	mov	eax, DWORD PTR _frm_thrd$551[ebp]
	mov	DWORD PTR -236+[ebp], eax
$L600:
	push	0
	mov	eax, DWORD PTR -228+[ebp]
	push	eax
	push	0
	push	1
	mov	eax, DWORD PTR -232+[ebp]
	push	eax
	cmp	DWORD PTR _external$552[ebp], 1
	sbb	eax, eax
	neg	eax
	push	eax
	mov	eax, DWORD PTR -236+[ebp]
	push	eax
	cmp	DWORD PTR _external$552[ebp], 1
	sbb	eax, eax
	neg	eax
	push	eax
	mov	eax, DWORD PTR _i$538[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	shl	eax, 2
	add	eax, 8
	push	eax
	push	9
	push	1
	push	1
	call	_omf_fixup
	add	esp, 48					; 00000030H
; Line 594
$L549:
	inc	DWORD PTR _i$538[ebp]
; Line 596
$L548:
	jmp	$L546
$L547:
; Line 597
	cmp	DWORD PTR _start_fixup$539[ebp], 0
	je	$L554
; Line 598
	call	_omf_end_fixup
; Line 602
$L554:
	mov	DWORD PTR _ncount$534[ebp], 0
	mov	eax, DWORD PTR _symbolP$[ebp]
	mov	DWORD PTR _last_startP$535[ebp], eax
; Line 603
	mov	eax, DWORD PTR _count$533[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	shl	eax, 2
	push	eax
	push	5
	push	1
	call	_omf_start_ledata
	add	esp, 12					; 0000000cH
; Line 605
$L544:
	mov	eax, DWORD PTR _symbolP$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _temp$536[ebp], eax
; Line 606
	mov	eax, DWORD PTR _symbolP$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	ecx, DWORD PTR _symbolP$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 607
	push	12					; 0000000cH
	mov	eax, DWORD PTR _symbolP$[ebp]
	push	eax
	call	_omf_ledata
	add	esp, 8
; Line 608
	mov	eax, DWORD PTR _temp$536[ebp]
	mov	ecx, DWORD PTR _symbolP$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 609
	inc	DWORD PTR _ncount$534[ebp]
	inc	DWORD PTR _count$533[ebp]
; Line 611
$L543:
	jmp	$L541
$L542:
; Line 612
	call	_omf_end_ledata
; Line 613
	mov	DWORD PTR _start_fixup$539[ebp], 0
; Line 614
	mov	DWORD PTR _i$538[ebp], 0
	mov	eax, DWORD PTR _last_startP$535[ebp]
	mov	DWORD PTR _fsymP$537[ebp], eax
	jmp	$L555
$L556:
	mov	eax, DWORD PTR _fsymP$537[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _fsymP$537[ebp], eax
$L555:
	mov	eax, DWORD PTR _ncount$534[ebp]
	cmp	DWORD PTR _i$538[ebp], eax
	jge	$L557
; Line 616
	mov	eax, DWORD PTR _fsymP$537[ebp]
	mov	al, BYTE PTR [eax+4]
	and	eax, 255				; 000000ffH
	test	al, 224					; 000000e0H
	je	$L558
; Line 618
	mov	eax, DWORD PTR _fsymP$537[ebp]
	mov	al, BYTE PTR [eax+4]
	and	eax, 255				; 000000ffH
	test	al, 30					; 0000001eH
	je	$L559
; Line 621
	mov	eax, DWORD PTR _fsymP$537[ebp]
	mov	al, BYTE PTR [eax+4]
	and	eax, 255				; 000000ffH
	test	al, 30					; 0000001eH
	je	$L603
	mov	eax, DWORD PTR _fsymP$537[ebp]
	mov	al, BYTE PTR [eax+4]
	and	eax, 30					; 0000001eH
	cmp	al, 1
	jne	$L601
$L603:
	mov	DWORD PTR _external$562[ebp], 1
	jmp	$L602
$L601:
	mov	DWORD PTR _external$562[ebp], 0
$L602:
; Line 623
	lea	eax, DWORD PTR _frm_thrd$561[ebp]
	push	eax
	lea	eax, DWORD PTR _trgt_thrd$560[ebp]
	push	eax
	mov	eax, DWORD PTR _fsymP$537[ebp]
	mov	al, BYTE PTR [eax+4]
	and	eax, 30					; 0000001eH
	push	eax
	call	_threads
	add	esp, 12					; 0000000cH
; Line 624
	cmp	DWORD PTR _start_fixup$539[ebp], 0
	jne	$L563
; Line 626
	push	1
	call	_omf_start_fixup
	add	esp, 4
; Line 627
	inc	DWORD PTR _start_fixup$539[ebp]
; Line 629
$L563:
; Line 638
	cmp	DWORD PTR _external$562[ebp], 0
	je	$L604
	mov	eax, DWORD PTR _fsymP$537[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR -240+[ebp], eax
	jmp	$L605
$L604:
	mov	DWORD PTR -240+[ebp], 0
$L605:
	cmp	DWORD PTR _external$562[ebp], 0
	je	$L606
	mov	DWORD PTR -244+[ebp], 2
	jmp	$L607
$L606:
	mov	eax, DWORD PTR _trgt_thrd$560[ebp]
	mov	DWORD PTR -244+[ebp], eax
$L607:
	cmp	DWORD PTR _external$562[ebp], 0
	je	$L608
	mov	DWORD PTR -248+[ebp], 5
	jmp	$L609
$L608:
	mov	eax, DWORD PTR _frm_thrd$561[ebp]
	mov	DWORD PTR -248+[ebp], eax
$L609:
	push	0
	mov	eax, DWORD PTR -240+[ebp]
	push	eax
	push	0
	push	1
	mov	eax, DWORD PTR -244+[ebp]
	push	eax
	cmp	DWORD PTR _external$562[ebp], 1
	sbb	eax, eax
	neg	eax
	push	eax
	mov	eax, DWORD PTR -248+[ebp]
	push	eax
	cmp	DWORD PTR _external$562[ebp], 1
	sbb	eax, eax
	neg	eax
	push	eax
	mov	eax, DWORD PTR _i$538[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	shl	eax, 2
	add	eax, 8
	push	eax
	push	9
	push	1
	push	1
	call	_omf_fixup
	add	esp, 48					; 00000030H
; Line 640
$L559:
	inc	DWORD PTR _i$538[ebp]
; Line 642
$L558:
	jmp	$L556
$L557:
; Line 643
	cmp	DWORD PTR _start_fixup$539[ebp], 0
	je	$L564
; Line 644
	call	_omf_end_fixup
; Line 646
$L564:
	mov	DWORD PTR _count$533[ebp], 4
	mov	eax, DWORD PTR _count$533[ebp]
	mov	DWORD PTR _ncount$534[ebp], eax
; Line 647
	push	0
	push	6
	push	1
	call	_omf_start_ledata
	add	esp, 12					; 0000000cH
; Line 648
	push	4
	push	OFFSET _string_byte_count$S340
	call	_omf_ledata
	add	esp, 8
; Line 649
	mov	eax, DWORD PTR _symbol_rootP
	mov	DWORD PTR _symbolP$[ebp], eax
	jmp	$L565
$L566:
	mov	eax, DWORD PTR _symbolP$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _symbolP$[ebp], eax
$L565:
	cmp	DWORD PTR _symbolP$[ebp], 0
	je	$L567
; Line 651
	mov	eax, DWORD PTR _symbolP$[ebp]
	mov	al, BYTE PTR [eax+4]
	and	eax, 255				; 000000ffH
	test	al, 224					; 000000e0H
	je	$L568
	mov	eax, DWORD PTR _symbolP$[ebp]
	cmp	DWORD PTR [eax], 0
	je	$L568
; Line 653
	mov	eax, DWORD PTR _symbolP$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_strlen
	add	esp, 4
	inc	eax
	mov	DWORD PTR _len$569[ebp], eax
; Line 655
	mov	eax, DWORD PTR _len$569[ebp]
	add	eax, DWORD PTR _ncount$534[ebp]
	cmp	eax, 1016				; 000003f8H
	jle	$L570
; Line 657
	call	_omf_end_ledata
; Line 658
	mov	eax, DWORD PTR _count$533[ebp]
	push	eax
	push	6
	push	1
	call	_omf_start_ledata
	add	esp, 12					; 0000000cH
; Line 659
	mov	DWORD PTR _ncount$534[ebp], 0
; Line 661
$L570:
	mov	eax, DWORD PTR _len$569[ebp]
	push	eax
	mov	eax, DWORD PTR _symbolP$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_omf_ledata
	add	esp, 8
; Line 662
	mov	eax, DWORD PTR _len$569[ebp]
	add	DWORD PTR _count$533[ebp], eax
	mov	eax, DWORD PTR _len$569[ebp]
	add	DWORD PTR _ncount$534[ebp], eax
; Line 664
$L568:
	jmp	$L566
$L567:
; Line 665
	call	_omf_end_ledata
; Line 669
$L532:
	push	1
	call	_omf_modend
	add	esp, 4
; Line 670
	mov	eax, DWORD PTR _out_file_name
	push	eax
	call	_output_file_close
	add	esp, 4
; Line 672
$L360:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_write_object_file ENDP
_TEXT	ENDS
END
