	TITLE	hash.c
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
PUBLIC	_hash_new
EXTRN	_malloc:NEAR
_TEXT	SEGMENT
; File hash.c
_retval$ = -24
_room$ = -12
_wall$ = -4
_entry$ = -20
_ip$ = -8
_nd$ = -16
_hash_new PROC NEAR
; Line 248
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	push	ebx
	push	esi
	push	edi
; Line 257
	push	16392					; 00004008H
	call	_malloc
	add	esp, 4
	mov	DWORD PTR _room$[ebp], eax
	cmp	DWORD PTR _room$[ebp], 0
	je	$L282
; Line 260
	push	44					; 0000002cH
	call	_malloc
	add	esp, 4
	mov	DWORD PTR _retval$[ebp], eax
	cmp	DWORD PTR _retval$[ebp], 0
	je	$L283
; Line 262
	mov	eax, DWORD PTR _retval$[ebp]
	add	eax, 44					; 0000002cH
	mov	DWORD PTR _nd$[ebp], eax
; Line 263
	mov	eax, DWORD PTR _retval$[ebp]
	add	eax, 20					; 00000014H
	mov	DWORD PTR _ip$[ebp], eax
	jmp	$L284
$L285:
	add	DWORD PTR _ip$[ebp], 4
$L284:
	mov	eax, DWORD PTR _ip$[ebp]
	cmp	DWORD PTR _nd$[ebp], eax
	jbe	$L286
; Line 265
	mov	eax, DWORD PTR _ip$[ebp]
	mov	DWORD PTR [eax], 0
; Line 266
	jmp	$L285
$L286:
; Line 268
	mov	eax, DWORD PTR _retval$[ebp]
	mov	DWORD PTR [eax+20], 2048		; 00000800H
; Line 269
	mov	eax, DWORD PTR _retval$[ebp]
	mov	DWORD PTR [eax+8], 2047			; 000007ffH
; Line 270
	mov	eax, DWORD PTR _retval$[ebp]
	mov	DWORD PTR [eax+4], 11			; 0000000bH
; Line 272
	mov	eax, DWORD PTR _room$[ebp]
	mov	ecx, DWORD PTR _retval$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 274
	mov	eax, DWORD PTR _room$[ebp]
	add	eax, 16384				; 00004000H
	mov	DWORD PTR _wall$[ebp], eax
	mov	eax, DWORD PTR _wall$[ebp]
	mov	ecx, DWORD PTR _retval$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 275
	mov	eax, DWORD PTR _retval$[ebp]
	mov	DWORD PTR [eax+12], 1024		; 00000400H
; Line 276
	mov	eax, DWORD PTR _room$[ebp]
	mov	DWORD PTR _entry$[ebp], eax
	jmp	$L287
$L288:
	add	DWORD PTR _entry$[ebp], 8
$L287:
	mov	eax, DWORD PTR _wall$[ebp]
	cmp	DWORD PTR _entry$[ebp], eax
	ja	$L289
; Line 278
	mov	eax, DWORD PTR _entry$[ebp]
	mov	DWORD PTR [eax], 0
; Line 279
	jmp	$L288
$L289:
; Line 281
$L283:
; Line 282
	jmp	$L290
$L282:
; Line 284
	mov	DWORD PTR _retval$[ebp], 0
; Line 285
$L290:
; Line 286
	mov	eax, DWORD PTR _retval$[ebp]
	jmp	$L274
; Line 287
$L274:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_hash_new ENDP
_TEXT	ENDS
PUBLIC	_hash_die
EXTRN	_free:NEAR
_TEXT	SEGMENT
_handle$ = 8
_hash_die PROC NEAR
; Line 302
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 303
	mov	eax, DWORD PTR _handle$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_free
	add	esp, 4
; Line 304
	mov	eax, DWORD PTR _handle$[ebp]
	push	eax
	call	_free
	add	esp, 4
; Line 305
$L292:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_hash_die ENDP
_TEXT	ENDS
PUBLIC	_hash_say
_TEXT	SEGMENT
_handle$ = 8
_buffer$ = 12
_bufsiz$ = 16
_nd$ = -8
_ip$ = -4
_hash_say PROC NEAR
; Line 325
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 329
	mov	eax, DWORD PTR _handle$[ebp]
	add	eax, 20					; 00000014H
	mov	DWORD PTR _ip$[ebp], eax
; Line 330
	mov	eax, DWORD PTR _bufsiz$[ebp]
	dec	eax
	cmp	eax, 6
	jl	$L421
	mov	eax, 6
$L421:
	shl	eax, 2
	add	eax, DWORD PTR _ip$[ebp]
	mov	DWORD PTR _nd$[ebp], eax
; Line 331
	cmp	DWORD PTR _bufsiz$[ebp], 0
	jle	$L300
; Line 333
	mov	eax, DWORD PTR _buffer$[ebp]
	mov	DWORD PTR [eax], 6
	add	DWORD PTR _buffer$[ebp], 4
; Line 334
	jmp	$L301
$L302:
	add	DWORD PTR _ip$[ebp], 4
	add	DWORD PTR _buffer$[ebp], 4
$L301:
	mov	eax, DWORD PTR _nd$[ebp]
	cmp	DWORD PTR _ip$[ebp], eax
	jae	$L303
; Line 336
	mov	eax, DWORD PTR _ip$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _buffer$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 337
	jmp	$L302
$L303:
; Line 339
$L300:
$L297:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_hash_say ENDP
_TEXT	ENDS
PUBLIC	_hash_delete
_BSS	SEGMENT
_hash_found$S270 DB 01H DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
_handle$ = 8
_string$ = 12
_retval$ = -8
_entry$ = -4
_hash_delete PROC NEAR
; Line 355
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 359
	push	1
	mov	eax, DWORD PTR _string$[ebp]
	push	eax
	mov	eax, DWORD PTR _handle$[ebp]
	push	eax
	call	_hash_ask
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _entry$[ebp], eax
; Line 360
	movsx	eax, BYTE PTR _hash_found$S270
	or	eax, eax
	je	$L309
; Line 362
	mov	eax, DWORD PTR _entry$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _retval$[ebp], eax
; Line 363
	mov	eax, DWORD PTR _entry$[ebp]
	mov	DWORD PTR [eax], 1
; Line 364
	mov	eax, DWORD PTR _handle$[ebp]
	dec	DWORD PTR [eax+40]
; Line 372
	jmp	$L310
$L309:
; Line 374
	mov	DWORD PTR _retval$[ebp], 0
; Line 375
$L310:
; Line 376
	mov	eax, DWORD PTR _retval$[ebp]
	jmp	$L306
; Line 377
$L306:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_hash_delete ENDP
_TEXT	ENDS
PUBLIC	_hash_replace
_TEXT	SEGMENT
_handle$ = 8
_string$ = 12
_value$ = 16
_entry$ = -8
_retval$ = -4
_hash_replace PROC NEAR
; Line 392
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 396
	push	1
	mov	eax, DWORD PTR _string$[ebp]
	push	eax
	mov	eax, DWORD PTR _handle$[ebp]
	push	eax
	call	_hash_ask
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _entry$[ebp], eax
; Line 397
	movsx	eax, BYTE PTR _hash_found$S270
	or	eax, eax
	je	$L318
; Line 399
	mov	eax, DWORD PTR _entry$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _retval$[ebp], eax
; Line 400
	mov	eax, DWORD PTR _value$[ebp]
	mov	ecx, DWORD PTR _entry$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 402
	jmp	$L319
$L318:
; Line 404
	mov	DWORD PTR _retval$[ebp], 0
; Line 405
$L319:
; Line 407
	mov	eax, DWORD PTR _retval$[ebp]
	jmp	$L315
; Line 408
$L315:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_hash_replace ENDP
_TEXT	ENDS
PUBLIC	_hash_insert
_DATA	SEGMENT
$SG326	DB	00H
	ORG $+3
$SG330	DB	'exists', 00H
_DATA	ENDS
_TEXT	SEGMENT
_handle$ = 8
_string$ = 12
_value$ = 16
_entry$ = -8
_retval$ = -4
_hash_insert PROC NEAR
; Line 423
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 427
	mov	DWORD PTR _retval$[ebp], OFFSET $SG326
; Line 428
	mov	eax, DWORD PTR _handle$[ebp]
	mov	ecx, DWORD PTR _handle$[ebp]
	mov	ecx, DWORD PTR [ecx+12]
	cmp	DWORD PTR [eax+40], ecx
	jle	$L327
; Line 430
	mov	eax, DWORD PTR _handle$[ebp]
	push	eax
	call	_hash_grow
	add	esp, 4
	mov	DWORD PTR _retval$[ebp], eax
; Line 432
$L327:
	mov	eax, DWORD PTR _retval$[ebp]
	movsx	eax, BYTE PTR [eax]
	or	eax, eax
	jne	$L328
; Line 434
	push	1
	mov	eax, DWORD PTR _string$[ebp]
	push	eax
	mov	eax, DWORD PTR _handle$[ebp]
	push	eax
	call	_hash_ask
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _entry$[ebp], eax
; Line 435
	movsx	eax, BYTE PTR _hash_found$S270
	or	eax, eax
	je	$L329
; Line 437
	mov	DWORD PTR _retval$[ebp], OFFSET $SG330
; Line 439
	jmp	$L331
$L329:
; Line 441
	mov	eax, DWORD PTR _value$[ebp]
	mov	ecx, DWORD PTR _entry$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 442
	mov	eax, DWORD PTR _string$[ebp]
	mov	ecx, DWORD PTR _entry$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 443
	mov	eax, DWORD PTR _handle$[ebp]
	inc	DWORD PTR [eax+40]
; Line 444
$L331:
; Line 446
$L328:
	mov	eax, DWORD PTR _retval$[ebp]
	jmp	$L323
; Line 447
$L323:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_hash_insert ENDP
_TEXT	ENDS
PUBLIC	_hash_jam
_DATA	SEGMENT
	ORG $+1
$SG338	DB	00H
_DATA	ENDS
_TEXT	SEGMENT
_handle$ = 8
_string$ = 12
_value$ = 16
_retval$ = -8
_entry$ = -4
_hash_jam PROC NEAR
; Line 468
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 472
	mov	DWORD PTR _retval$[ebp], OFFSET $SG338
; Line 473
	mov	eax, DWORD PTR _handle$[ebp]
	mov	ecx, DWORD PTR _handle$[ebp]
	mov	ecx, DWORD PTR [ecx+12]
	cmp	DWORD PTR [eax+40], ecx
	jle	$L339
; Line 475
	mov	eax, DWORD PTR _handle$[ebp]
	push	eax
	call	_hash_grow
	add	esp, 4
	mov	DWORD PTR _retval$[ebp], eax
; Line 477
$L339:
	mov	eax, DWORD PTR _retval$[ebp]
	movsx	eax, BYTE PTR [eax]
	or	eax, eax
	jne	$L340
; Line 479
	push	1
	mov	eax, DWORD PTR _string$[ebp]
	push	eax
	mov	eax, DWORD PTR _handle$[ebp]
	push	eax
	call	_hash_ask
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _entry$[ebp], eax
; Line 480
	movsx	eax, BYTE PTR _hash_found$S270
	or	eax, eax
	jne	$L341
; Line 482
	mov	eax, DWORD PTR _string$[ebp]
	mov	ecx, DWORD PTR _entry$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 483
	mov	eax, DWORD PTR _handle$[ebp]
	inc	DWORD PTR [eax+40]
; Line 485
$L341:
	mov	eax, DWORD PTR _value$[ebp]
	mov	ecx, DWORD PTR _entry$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 487
$L340:
	mov	eax, DWORD PTR _retval$[ebp]
	jmp	$L335
; Line 488
$L335:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_hash_jam ENDP
_TEXT	ENDS
EXTRN	_xmalloc:NEAR
_DATA	SEGMENT
	ORG $+3
$SG355	DB	00H
	ORG $+3
$SG366	DB	'no room', 00H
_DATA	ENDS
_TEXT	SEGMENT
_handle$ = 8
_newwall$ = -24
_newwhere$ = -20
_newtrack$ = -12
_oldtrack$ = -4
_oldwhere$ = -40
_oldwall$ = -36
_temp$ = -28
_newsize$ = -16
_string$ = -8
_retval$ = -32
_hash_grow PROC NEAR
; Line 504
	push	ebp
	mov	ebp, esp
	sub	esp, 40					; 00000028H
	push	ebx
	push	esi
	push	edi
; Line 522
	mov	eax, DWORD PTR _handle$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _oldwhere$[ebp], eax
; Line 523
	mov	eax, DWORD PTR _handle$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _oldwall$[ebp], eax
; Line 530
	mov	eax, DWORD PTR _handle$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _temp$[ebp], eax
; Line 531
	mov	eax, DWORD PTR _temp$[ebp]
	add	eax, DWORD PTR _temp$[ebp]
	lea	eax, DWORD PTR [eax*8+8]
	push	eax
	call	_xmalloc
	add	esp, 4
	mov	DWORD PTR _newwhere$[ebp], eax
	cmp	DWORD PTR _newwhere$[ebp], 0
	je	$L354
; Line 534
	mov	DWORD PTR _retval$[ebp], OFFSET $SG355
; Line 540
	mov	eax, DWORD PTR _handle$[ebp]
	mov	eax, DWORD PTR [eax+8]
	inc	eax
	mov	ecx, DWORD PTR _handle$[ebp]
	add	DWORD PTR [ecx+8], eax
; Line 541
	mov	eax, DWORD PTR _handle$[ebp]
	shl	DWORD PTR [eax+20], 1
; Line 542
	mov	eax, DWORD PTR _handle$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _newsize$[ebp], eax
; Line 543
	mov	eax, DWORD PTR _newwhere$[ebp]
	mov	ecx, DWORD PTR _handle$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 544
	mov	eax, DWORD PTR _handle$[ebp]
	shl	DWORD PTR [eax+12], 1
; Line 545
	mov	eax, DWORD PTR _handle$[ebp]
	inc	DWORD PTR [eax+4]
; Line 546
	mov	eax, DWORD PTR _handle$[ebp]
	mov	DWORD PTR [eax+40], 0
; Line 548
	mov	eax, DWORD PTR _newsize$[ebp]
	shl	eax, 3
	add	eax, DWORD PTR _newwhere$[ebp]
	mov	DWORD PTR _newwall$[ebp], eax
	mov	eax, DWORD PTR _newwall$[ebp]
	mov	ecx, DWORD PTR _handle$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 552
	mov	eax, DWORD PTR _newwhere$[ebp]
	mov	DWORD PTR _newtrack$[ebp], eax
	jmp	$L356
$L357:
	add	DWORD PTR _newtrack$[ebp], 8
$L356:
	mov	eax, DWORD PTR _newwall$[ebp]
	cmp	DWORD PTR _newtrack$[ebp], eax
	ja	$L358
; Line 554
	mov	eax, DWORD PTR _newtrack$[ebp]
	mov	DWORD PTR [eax], 0
; Line 555
	jmp	$L357
$L358:
; Line 560
	mov	eax, DWORD PTR _handle$[ebp]
	mov	DWORD PTR [eax+40], 0
; Line 561
	mov	eax, DWORD PTR _oldwhere$[ebp]
	mov	DWORD PTR _oldtrack$[ebp], eax
	jmp	$L359
$L360:
	add	DWORD PTR _oldtrack$[ebp], 8
$L359:
	mov	eax, DWORD PTR _oldtrack$[ebp]
	cmp	DWORD PTR _oldwall$[ebp], eax
	jbe	$L361
; Line 563
	mov	eax, DWORD PTR _oldtrack$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _string$[ebp], eax
	cmp	DWORD PTR _string$[ebp], 0
	je	$L362
	cmp	DWORD PTR _string$[ebp], 1
	je	$L362
; Line 565
	mov	eax, DWORD PTR _oldtrack$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _string$[ebp]
	push	eax
	mov	eax, DWORD PTR _handle$[ebp]
	push	eax
	call	_hash_jam
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _retval$[ebp], eax
	mov	eax, DWORD PTR _retval$[ebp]
	movsx	eax, BYTE PTR [eax]
	or	eax, eax
	je	$L363
; Line 567
	jmp	$L361
; Line 569
$L363:
; Line 570
$L362:
	jmp	$L360
$L361:
; Line 577
	mov	eax, DWORD PTR _retval$[ebp]
	movsx	eax, BYTE PTR [eax]
	or	eax, eax
	jne	$L364
; Line 583
	mov	eax, DWORD PTR _oldwhere$[ebp]
	push	eax
	call	_free
	add	esp, 4
; Line 588
$L364:
; Line 589
	jmp	$L365
$L354:
; Line 591
	mov	DWORD PTR _retval$[ebp], OFFSET $SG366
; Line 592
$L365:
; Line 593
	mov	eax, DWORD PTR _retval$[ebp]
	jmp	$L343
; Line 594
$L343:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_hash_grow ENDP
_TEXT	ENDS
PUBLIC	_hash_apply
_TEXT	SEGMENT
_handle$ = 8
_function$ = 12
_entry$ = -8
_wall$ = -4
_hash_apply PROC NEAR
; Line 646
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 650
	mov	eax, DWORD PTR _handle$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _wall$[ebp], eax
; Line 651
	mov	eax, DWORD PTR _handle$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _entry$[ebp], eax
	jmp	$L372
$L373:
	add	DWORD PTR _entry$[ebp], 8
$L372:
	mov	eax, DWORD PTR _entry$[ebp]
	cmp	DWORD PTR _wall$[ebp], eax
	jbe	$L374
; Line 653
	mov	eax, DWORD PTR _entry$[ebp]
	cmp	DWORD PTR [eax], 0
	je	$L375
	mov	eax, DWORD PTR _entry$[ebp]
	cmp	DWORD PTR [eax], 1
	je	$L375
; Line 655
	mov	eax, DWORD PTR _entry$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _entry$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	DWORD PTR _function$[ebp]
	add	esp, 8
; Line 657
$L375:
	jmp	$L373
$L374:
; Line 658
	sub	eax, eax
	jmp	$L369
; Line 659
$L369:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_hash_apply ENDP
_TEXT	ENDS
PUBLIC	_hash_find
_TEXT	SEGMENT
_handle$ = 8
_string$ = 12
_entry$ = -8
_retval$ = -4
_hash_find PROC NEAR
; Line 671
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 675
	push	0
	mov	eax, DWORD PTR _string$[ebp]
	push	eax
	mov	eax, DWORD PTR _handle$[ebp]
	push	eax
	call	_hash_ask
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _entry$[ebp], eax
; Line 676
	movsx	eax, BYTE PTR _hash_found$S270
	or	eax, eax
	je	$L381
; Line 678
	mov	eax, DWORD PTR _entry$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _retval$[ebp], eax
; Line 680
	jmp	$L382
$L381:
; Line 682
	mov	DWORD PTR _retval$[ebp], 0
; Line 683
$L382:
; Line 684
	mov	eax, DWORD PTR _retval$[ebp]
	jmp	$L378
; Line 685
$L378:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_hash_find ENDP
_string$ = 12
_access$ = 16
_string1$ = -16
_s$ = -12
_c$ = -20
_slot$ = -8
_collision$ = -4
_handle$ = 8
_hash_ask PROC NEAR
; Line 701
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	push	ebx
	push	esi
	push	edi
; Line 708
	mov	eax, DWORD PTR _string$[ebp]
	push	eax
	mov	eax, DWORD PTR _handle$[ebp]
	push	eax
	call	_hash_code
	add	esp, 8
	shl	eax, 3
	mov	ecx, DWORD PTR _handle$[ebp]
	add	eax, DWORD PTR [ecx]
	mov	DWORD PTR _slot$[ebp], eax
; Line 709
	mov	eax, DWORD PTR _access$[ebp]
	mov	ecx, DWORD PTR _handle$[ebp]
	inc	DWORD PTR [ecx+eax*4+24]
; Line 710
	mov	DWORD PTR _collision$[ebp], 0
; Line 711
	mov	BYTE PTR _hash_found$S270, 0
; Line 712
$L393:
	mov	eax, DWORD PTR _slot$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _s$[ebp], eax
	cmp	DWORD PTR _s$[ebp], 0
	je	$L394
	cmp	DWORD PTR _s$[ebp], 1
	je	$L394
; Line 714
	mov	eax, DWORD PTR _string$[ebp]
	mov	DWORD PTR _string1$[ebp], eax
$L396:
; Line 715
	mov	eax, DWORD PTR _s$[ebp]
	movsx	eax, BYTE PTR [eax]
	mov	DWORD PTR _c$[ebp], eax
	inc	DWORD PTR _s$[ebp]
	cmp	DWORD PTR _c$[ebp], 0
	jne	$L398
; Line 716
	mov	eax, DWORD PTR _string1$[ebp]
	movsx	eax, BYTE PTR [eax]
	or	eax, eax
	jne	$L399
; Line 717
	mov	BYTE PTR _hash_found$S270, 1
; Line 718
$L399:
	jmp	$L397
; Line 720
$L398:
	mov	eax, DWORD PTR _string1$[ebp]
	mov	DWORD PTR -24+[ebp], eax
	inc	DWORD PTR _string1$[ebp]
	mov	eax, DWORD PTR -24+[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, DWORD PTR _c$[ebp]
	je	$L400
; Line 721
	jmp	$L397
; Line 722
$L400:
	jmp	$L396
$L397:
; Line 723
	movsx	eax, BYTE PTR _hash_found$S270
	or	eax, eax
	je	$L401
; Line 724
	jmp	$L394
; Line 725
$L401:
	inc	DWORD PTR _collision$[ebp]
; Line 726
	add	DWORD PTR _slot$[ebp], 8
; Line 727
	jmp	$L393
$L394:
; Line 736
	mov	eax, DWORD PTR _handle$[ebp]
	mov	ecx, DWORD PTR _slot$[ebp]
	cmp	DWORD PTR [eax+16], ecx
	jne	$L402
; Line 738
	mov	eax, DWORD PTR _handle$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _slot$[ebp], eax
; Line 739
$L404:
	mov	eax, DWORD PTR _slot$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _s$[ebp], eax
	cmp	DWORD PTR _s$[ebp], 0
	je	$L405
	cmp	DWORD PTR _s$[ebp], 1
	je	$L405
; Line 741
	mov	eax, DWORD PTR _string$[ebp]
	mov	DWORD PTR _string1$[ebp], eax
	jmp	$L406
$L407:
	inc	DWORD PTR _string1$[ebp]
	inc	DWORD PTR _s$[ebp]
$L406:
	mov	eax, DWORD PTR _s$[ebp]
	movsx	eax, BYTE PTR [eax]
	or	eax, eax
	je	$L408
; Line 742
	mov	eax, DWORD PTR _s$[ebp]
	movsx	eax, BYTE PTR [eax]
	mov	ecx, DWORD PTR _string1$[ebp]
	movsx	ecx, BYTE PTR [ecx]
	cmp	eax, ecx
	je	$L409
; Line 743
	jmp	$L408
; Line 744
$L409:
	jmp	$L407
$L408:
; Line 745
	mov	eax, DWORD PTR _s$[ebp]
	movsx	eax, BYTE PTR [eax]
	mov	ecx, DWORD PTR _string1$[ebp]
	movsx	ecx, BYTE PTR [ecx]
	cmp	eax, ecx
	jne	$L410
; Line 746
	mov	BYTE PTR _hash_found$S270, 1
; Line 747
	jmp	$L405
; Line 749
$L410:
	inc	DWORD PTR _collision$[ebp]
; Line 750
	add	DWORD PTR _slot$[ebp], 8
; Line 751
	jmp	$L404
$L405:
; Line 761
$L402:
	mov	eax, DWORD PTR _collision$[ebp]
	mov	ecx, DWORD PTR _access$[ebp]
	mov	edx, DWORD PTR _handle$[ebp]
	add	DWORD PTR [edx+ecx*4+32], eax
; Line 762
	mov	eax, DWORD PTR _slot$[ebp]
	jmp	$L386
; Line 763
$L386:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_hash_ask ENDP
_handle$ = 8
_string$ = 12
_h$ = -12
_c$ = -8
_n$ = -4
_hash_code PROC NEAR
; Line 775
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 780
	mov	eax, DWORD PTR _handle$[ebp]
	mov	eax, DWORD PTR [eax+4]
	sub	eax, 3
	mov	DWORD PTR _n$[ebp], eax
; Line 781
	mov	DWORD PTR _h$[ebp], 0
; Line 782
$L418:
	mov	eax, DWORD PTR _string$[ebp]
	movsx	eax, BYTE PTR [eax]
	mov	DWORD PTR _c$[ebp], eax
	inc	DWORD PTR _string$[ebp]
	cmp	DWORD PTR _c$[ebp], 0
	je	$L419
; Line 784
	mov	eax, DWORD PTR _c$[ebp]
	add	DWORD PTR _h$[ebp], eax
; Line 785
	mov	eax, DWORD PTR _h$[ebp]
	mov	cl, BYTE PTR _n$[ebp]
	sar	eax, cl
	mov	ecx, DWORD PTR _h$[ebp]
	lea	eax, DWORD PTR [eax+ecx*8]
	add	eax, DWORD PTR _c$[ebp]
	mov	DWORD PTR _h$[ebp], eax
; Line 786
	jmp	$L418
$L419:
; Line 787
	mov	eax, DWORD PTR _handle$[ebp]
	mov	eax, DWORD PTR [eax+8]
	and	eax, DWORD PTR _h$[ebp]
	jmp	$L413
; Line 788
$L413:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_hash_code ENDP
_TEXT	ENDS
END
