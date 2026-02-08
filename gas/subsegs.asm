	TITLE	subsegs.c
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
PUBLIC	_seg_name
PUBLIC	_seg_N_TYPE
PUBLIC	_N_TYPE_seg
_DATA	SEGMENT
COMM	_frchain_root:DWORD
COMM	_frchain_now:DWORD
COMM	_data0_frchainP:DWORD
_seg_N_TYPE DD	02H
	DD	04H
	DD	06H
	DD	08H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
$SG308	DB	'absolute', 00H
	ORG $+3
$SG309	DB	'text', 00H
	ORG $+3
$SG310	DB	'data', 00H
	ORG $+3
$SG311	DB	'bss', 00H
$SG312	DB	'unknown', 00H
$SG313	DB	'absent', 00H
	ORG $+1
$SG314	DB	'pass1', 00H
	ORG $+2
$SG315	DB	'ASSEMBLER-INTERNAL-LOGIC-ERROR!', 00H
$SG316	DB	'bignum/flonum', 00H
	ORG $+2
$SG317	DB	'difference', 00H
	ORG $+1
$SG318	DB	00H
	ORG $+3
_seg_name DD	$SG308
	DD	$SG309
	DD	$SG310
	DD	$SG311
	DD	$SG312
	DD	$SG313
	DD	$SG314
	DD	$SG315
	DD	$SG316
	DD	$SG317
	DD	$SG318
	ORG $+4
_N_TYPE_seg DD	04H
	DD	07H
	DD	00H
	DD	07H
	DD	01H
	DD	07H
	DD	02H
	DD	07H
	DD	03H
	DD	07H
	DD	07H
	DD	07H
	DD	07H
	DD	07H
	DD	07H
	DD	07H
	DD	07H
	DD	07H
	DD	07H
	DD	07H
	DD	07H
	DD	07H
	DD	07H
	DD	07H
	DD	07H
	DD	07H
	DD	07H
	DD	07H
	DD	07H
	DD	07H
	DD	07H
	DD	07H
_DATA	ENDS
PUBLIC	_subsegs_begin
PUBLIC	_subseg_new
EXTRN	_frag_now:DWORD
EXTRN	_zero_address_frag:BYTE
EXTRN	_xmalloc:NEAR
EXTRN	__obstack_newchunk:NEAR
EXTRN	_free:NEAR
EXTRN	__obstack_begin:NEAR
EXTRN	_frags:BYTE
EXTRN	_now_subseg:BYTE
_TEXT	SEGMENT
; File subsegs.c
_subsegs_begin PROC NEAR
; Line 86
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 102
	push	OFFSET _free
	push	OFFSET _xmalloc
	push	0
	push	1000					; 000003e8H
	push	OFFSET _frags
	call	__obstack_begin
	add	esp, 20					; 00000014H
; Line 106
	mov	DWORD PTR _frchain_root, 0
; Line 107
	mov	DWORD PTR _frchain_now, 0
; Line 111
	mov	eax, OFFSET _zero_address_frag
	add	eax, 38					; 00000026H
	sub	eax, OFFSET _zero_address_frag
	mov	DWORD PTR _frags+20, eax
	mov	eax, DWORD PTR _frags+16
	sub	eax, DWORD PTR _frags+12
	cmp	eax, DWORD PTR _frags+20
	jl	$L347
	jmp	$L348
$L347:
	mov	eax, DWORD PTR _frags+20
	push	eax
	push	OFFSET _frags
	call	__obstack_newchunk
	add	esp, 8
$L348:
	mov	eax, DWORD PTR _frags+20
	add	DWORD PTR _frags+12, eax
	mov	eax, DWORD PTR _frags+8
	mov	DWORD PTR _frags+20, eax
	mov	eax, DWORD PTR _frags+12
	add	eax, DWORD PTR _frags+24
	mov	ecx, DWORD PTR _frags+24
	not	ecx
	and	eax, ecx
	mov	DWORD PTR _frags+12, eax
	mov	eax, DWORD PTR _frags+16
	sub	eax, DWORD PTR _frags+4
	mov	ecx, DWORD PTR _frags+12
	sub	ecx, DWORD PTR _frags+4
	cmp	eax, ecx
	jge	$L349
	mov	eax, DWORD PTR _frags+16
	mov	DWORD PTR _frags+12, eax
	jmp	$L350
$L349:
$L350:
	mov	eax, DWORD PTR _frags+12
	mov	DWORD PTR _frags+8, eax
	mov	eax, DWORD PTR _frags+20
	mov	DWORD PTR _frag_now, eax
; Line 115
	mov	BYTE PTR _now_subseg, 42		; 0000002aH
; Line 116
	push	0
	push	2
	call	_subseg_new
	add	esp, 8
; Line 117
	mov	eax, DWORD PTR _frchain_now
	mov	DWORD PTR _data0_frchainP, eax
; Line 118
$L319:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_subsegs_begin ENDP
_TEXT	ENDS
PUBLIC	_subseg_change
EXTRN	_text_fix_root:DWORD
EXTRN	_data_fix_root:DWORD
EXTRN	_seg_fix_rootP:DWORD
EXTRN	_now_seg:DWORD
_TEXT	SEGMENT
_seg$ = 8
_subseg$ = 12
_subseg_change PROC NEAR
; Line 134
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 135
	mov	eax, DWORD PTR _seg$[ebp]
	mov	DWORD PTR _now_seg, eax
; Line 136
	mov	al, BYTE PTR _subseg$[ebp]
	mov	BYTE PTR _now_subseg, al
; Line 137
	cmp	DWORD PTR _seg$[ebp], 2
	jne	$L323
; Line 139
	mov	DWORD PTR _seg_fix_rootP, OFFSET _data_fix_root
; Line 141
	jmp	$L324
$L323:
; Line 144
	mov	DWORD PTR _seg_fix_rootP, OFFSET _text_fix_root
; Line 145
$L324:
; Line 146
$L322:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_subseg_change ENDP
_TEXT	ENDS
EXTRN	_frag_wane:NEAR
_TEXT	SEGMENT
_seg$ = 8
_subseg$ = 12
_tmp$ = -4
_frcP$331 = -24
_lastPP$332 = -16
_newP$333 = -8
_former_last_fragP$334 = -20
_new_fragP$335 = -12
_subseg_new PROC NEAR
; Line 168
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	push	ebx
	push	esi
	push	edi
; Line 173
	mov	eax, DWORD PTR _seg$[ebp]
	cmp	DWORD PTR _now_seg, eax
	jne	$L330
	xor	eax, eax
	mov	al, BYTE PTR _now_subseg
	xor	ecx, ecx
	mov	cl, BYTE PTR _subseg$[ebp]
	cmp	eax, ecx
	je	$L329
$L330:
; Line 181
	cmp	DWORD PTR _frag_now, 0
	je	$L336
; Line 183
	mov	eax, DWORD PTR _frags+12
	mov	ecx, DWORD PTR _frag_now
	add	ecx, 38					; 00000026H
	sub	eax, ecx
	mov	ecx, DWORD PTR _frag_now
	mov	DWORD PTR [ecx+8], eax
; Line 184
	mov	eax, DWORD PTR _frag_now
	push	eax
	call	_frag_wane
	add	esp, 4
; Line 190
$L336:
; Line 192
	mov	eax, DWORD PTR _frags+8
	mov	DWORD PTR _frags+20, eax
	mov	eax, DWORD PTR _frags+12
	add	eax, DWORD PTR _frags+24
	mov	ecx, DWORD PTR _frags+24
	not	ecx
	and	eax, ecx
	mov	DWORD PTR _frags+12, eax
	mov	eax, DWORD PTR _frags+16
	sub	eax, DWORD PTR _frags+4
	mov	ecx, DWORD PTR _frags+12
	sub	ecx, DWORD PTR _frags+4
	cmp	eax, ecx
	jge	$L351
	mov	eax, DWORD PTR _frags+16
	mov	DWORD PTR _frags+12, eax
	jmp	$L352
$L351:
$L352:
	mov	eax, DWORD PTR _frags+12
	mov	DWORD PTR _frags+8, eax
; Line 201
	xor	eax, eax
	mov	al, BYTE PTR _subseg$[ebp]
	push	eax
	mov	eax, DWORD PTR _seg$[ebp]
	push	eax
	call	_subseg_change
	add	esp, 8
; Line 212
	mov	DWORD PTR _lastPP$332[ebp], OFFSET _frchain_root
	mov	eax, DWORD PTR _lastPP$332[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _frcP$331[ebp], eax
	jmp	$L337
$L338:
	mov	eax, DWORD PTR _frcP$331[ebp]
	add	eax, 8
	mov	DWORD PTR _lastPP$332[ebp], eax
	mov	eax, DWORD PTR _lastPP$332[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _frcP$331[ebp], eax
$L337:
	cmp	DWORD PTR _frcP$331[ebp], 0
	je	$L339
	mov	eax, DWORD PTR _frcP$331[ebp]
	mov	ecx, DWORD PTR _seg$[ebp]
	cmp	DWORD PTR [eax+12], ecx
	jg	$L339
; Line 215
	mov	eax, DWORD PTR _frcP$331[ebp]
	mov	ecx, DWORD PTR _seg$[ebp]
	cmp	DWORD PTR [eax+12], ecx
	jne	$L340
	mov	eax, DWORD PTR _frcP$331[ebp]
	mov	al, BYTE PTR [eax+16]
	and	eax, 255				; 000000ffH
	xor	ecx, ecx
	mov	cl, BYTE PTR _subseg$[ebp]
	cmp	eax, ecx
	jl	$L340
; Line 217
	jmp	$L339
; Line 219
$L340:
	jmp	$L338
$L339:
; Line 243
	cmp	DWORD PTR _frcP$331[ebp], 0
	je	$L342
	mov	eax, DWORD PTR _frcP$331[ebp]
	mov	ecx, DWORD PTR _seg$[ebp]
	cmp	DWORD PTR [eax+12], ecx
	jg	$L343
	mov	eax, DWORD PTR _frcP$331[ebp]
	mov	al, BYTE PTR [eax+16]
	and	eax, 255				; 000000ffH
	xor	ecx, ecx
	mov	cl, BYTE PTR _subseg$[ebp]
	cmp	eax, ecx
	jle	$L341
$L343:
$L342:
; Line 248
	mov	DWORD PTR _frags+20, 20			; 00000014H
	mov	eax, DWORD PTR _frags+16
	sub	eax, DWORD PTR _frags+12
	cmp	eax, DWORD PTR _frags+20
	jl	$L353
	jmp	$L354
$L353:
	mov	eax, DWORD PTR _frags+20
	push	eax
	push	OFFSET _frags
	call	__obstack_newchunk
	add	esp, 8
$L354:
	mov	eax, DWORD PTR _frags+20
	add	DWORD PTR _frags+12, eax
	mov	eax, DWORD PTR _frags+8
	mov	DWORD PTR _frags+20, eax
	mov	eax, DWORD PTR _frags+12
	add	eax, DWORD PTR _frags+24
	mov	ecx, DWORD PTR _frags+24
	not	ecx
	and	eax, ecx
	mov	DWORD PTR _frags+12, eax
	mov	eax, DWORD PTR _frags+16
	sub	eax, DWORD PTR _frags+4
	mov	ecx, DWORD PTR _frags+12
	sub	ecx, DWORD PTR _frags+4
	cmp	eax, ecx
	jge	$L355
	mov	eax, DWORD PTR _frags+16
	mov	DWORD PTR _frags+12, eax
	jmp	$L356
$L355:
$L356:
	mov	eax, DWORD PTR _frags+12
	mov	DWORD PTR _frags+8, eax
	mov	eax, DWORD PTR _frags+20
	mov	DWORD PTR _newP$333[ebp], eax
; Line 255
	mov	eax, DWORD PTR _newP$333[ebp]
	mov	ecx, DWORD PTR _lastPP$332[ebp]
	mov	DWORD PTR [ecx], eax
; Line 256
	mov	eax, DWORD PTR _frcP$331[ebp]
	mov	ecx, DWORD PTR _newP$333[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 257
	mov	eax, DWORD PTR _newP$333[ebp]
	mov	DWORD PTR _frcP$331[ebp], eax
	mov	al, BYTE PTR _subseg$[ebp]
	mov	ecx, DWORD PTR _frcP$331[ebp]
	mov	BYTE PTR [ecx+16], al
; Line 258
	mov	eax, DWORD PTR _seg$[ebp]
	mov	ecx, DWORD PTR _newP$333[ebp]
	mov	DWORD PTR [ecx+12], eax
; Line 259
	mov	eax, DWORD PTR _newP$333[ebp]
	mov	DWORD PTR [eax+4], 0
; Line 264
$L341:
	mov	eax, DWORD PTR _frcP$331[ebp]
	mov	DWORD PTR _frchain_now, eax
; Line 271
	mov	eax, DWORD PTR _frags+24
	mov	DWORD PTR _tmp$[ebp], eax
; Line 272
	mov	DWORD PTR _frags+24, 0
; Line 273
	mov	eax, OFFSET _zero_address_frag
	add	eax, 38					; 00000026H
	sub	eax, OFFSET _zero_address_frag
	mov	DWORD PTR _frags+20, eax
	mov	eax, DWORD PTR _frags+16
	sub	eax, DWORD PTR _frags+12
	cmp	eax, DWORD PTR _frags+20
	jl	$L357
	jmp	$L358
$L357:
	mov	eax, DWORD PTR _frags+20
	push	eax
	push	OFFSET _frags
	call	__obstack_newchunk
	add	esp, 8
$L358:
	mov	eax, DWORD PTR _frags+20
	add	DWORD PTR _frags+12, eax
	mov	eax, DWORD PTR _frags+8
	mov	DWORD PTR _frags+20, eax
	mov	eax, DWORD PTR _frags+12
	add	eax, DWORD PTR _frags+24
	mov	ecx, DWORD PTR _frags+24
	not	ecx
	and	eax, ecx
	mov	DWORD PTR _frags+12, eax
	mov	eax, DWORD PTR _frags+16
	sub	eax, DWORD PTR _frags+4
	mov	ecx, DWORD PTR _frags+12
	sub	ecx, DWORD PTR _frags+4
	cmp	eax, ecx
	jge	$L359
	mov	eax, DWORD PTR _frags+16
	mov	DWORD PTR _frags+12, eax
	jmp	$L360
$L359:
$L360:
	mov	eax, DWORD PTR _frags+12
	mov	DWORD PTR _frags+8, eax
	mov	eax, DWORD PTR _frags+20
	mov	DWORD PTR _frag_now, eax
; Line 274
	mov	eax, DWORD PTR _tmp$[ebp]
	mov	DWORD PTR _frags+24, eax
; Line 278
	mov	eax, DWORD PTR _frag_now
	mov	DWORD PTR _new_fragP$335[ebp], eax
; Line 279
	mov	eax, DWORD PTR _new_fragP$335[ebp]
	mov	DWORD PTR [eax+4], 0
; Line 283
	mov	eax, DWORD PTR _frcP$331[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _former_last_fragP$334[ebp], eax
; Line 284
	cmp	DWORD PTR _former_last_fragP$334[ebp], 0
	je	$L344
; Line 288
	mov	eax, DWORD PTR _new_fragP$335[ebp]
	mov	ecx, DWORD PTR _former_last_fragP$334[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 290
	jmp	$L345
$L344:
; Line 292
	mov	eax, DWORD PTR _new_fragP$335[ebp]
	mov	ecx, DWORD PTR _frcP$331[ebp]
	mov	DWORD PTR [ecx], eax
; Line 293
$L345:
; Line 294
	mov	eax, DWORD PTR _new_fragP$335[ebp]
	mov	ecx, DWORD PTR _frcP$331[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 296
$L329:
$L327:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_subseg_new ENDP
_TEXT	ENDS
END
