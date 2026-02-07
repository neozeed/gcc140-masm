	TITLE	genrecog.c
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
PUBLIC	_rtl_obstack
_DATA	SEGMENT
COMM	_obstack:BYTE:024H
COMM	_next_subroutine_number:DWORD
COMM	_next_number:DWORD
COMM	_next_insn_code:DWORD
COMM	_dupcount:DWORD
COMM	_first:DWORD
_rtl_obstack DD	_obstack
_DATA	ENDS
PUBLIC	_add_to_sequence
PUBLIC	_make_insn_sequence
EXTRN	_rtx_alloc:NEAR
_DATA	SEGMENT
$SG491	DB	00H
_DATA	ENDS
_TEXT	SEGMENT
; File genrecog.c
_insn$ = 8
_x$ = -8
_c_test$ = -12
_last$ = -4
_make_insn_sequence PROC NEAR
; Line 144
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 146
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _c_test$[ebp], eax
; Line 149
	mov	DWORD PTR _dupcount, 0
; Line 151
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax], 1
	jne	$L489
; Line 152
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x$[ebp], eax
; Line 153
	jmp	$L490
$L489:
; Line 155
	push	20					; 00000014H
	call	_rtx_alloc
	add	esp, 4
	mov	DWORD PTR _x$[ebp], eax
; Line 156
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 157
	mov	eax, DWORD PTR _x$[ebp]
	and	DWORD PTR [eax], -16711681		; ff00ffffH
; Line 158
$L490:
; Line 160
	push	OFFSET $SG491
	push	0
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_add_to_sequence
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _last$[ebp], eax
; Line 162
	mov	eax, DWORD PTR _c_test$[ebp]
	movsx	eax, BYTE PTR [eax]
	or	eax, eax
	je	$L492
; Line 163
	mov	eax, DWORD PTR _c_test$[ebp]
	mov	ecx, DWORD PTR _last$[ebp]
	mov	DWORD PTR [ecx+76], eax
; Line 164
$L492:
	mov	eax, DWORD PTR _next_insn_code
	mov	ecx, DWORD PTR _last$[ebp]
	mov	DWORD PTR [ecx+24], eax
	inc	DWORD PTR _next_insn_code
; Line 166
	mov	eax, DWORD PTR _first
	jmp	$L485
; Line 167
$L485:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_make_insn_sequence ENDP
_TEXT	ENDS
PUBLIC	_xmalloc
PUBLIC	_copystr
EXTRN	_rtx_length:BYTE
EXTRN	_rtx_format:BYTE
EXTRN	_abort:NEAR
EXTRN	_strlen:NEAR
EXTRN	_alloca:NEAR
EXTRN	_strcpy:NEAR
_DATA	SEGMENT
	ORG $+3
$SG512	DB	'0', 00H
	ORG $+2
$SG534	DB	'pc_rtx', 00H
	ORG $+1
$SG536	DB	'cc0_rtx', 00H
$SG539	DB	'const0_rtx', 00H
	ORG $+1
$SG541	DB	'const1_rtx', 00H
_DATA	ENDS
_TEXT	SEGMENT
_j$557 = -36
_pattern$ = 8
_last$ = 12
_position$ = 16
_code$ = -20
_new$ = -12
_this$ = -28
_newpos$ = -16
_fmt$ = -8
_i$ = -24
_depth$ = -4
_len$ = -32
_add_to_sequence PROC NEAR
; Line 174
	push	ebp
	mov	ebp, esp
	sub	esp, 44					; 0000002cH
	push	ebx
	push	esi
	push	edi
; Line 177
	push	96					; 00000060H
	call	_xmalloc
	add	esp, 4
	mov	DWORD PTR _new$[ebp], eax
; Line 185
	mov	eax, DWORD PTR _next_number
	mov	ecx, DWORD PTR _new$[ebp]
	mov	DWORD PTR [ecx], eax
	inc	DWORD PTR _next_number
; Line 186
	mov	eax, DWORD PTR _position$[ebp]
	push	eax
	call	_copystr
	add	esp, 4
	mov	ecx, DWORD PTR _new$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 187
	mov	eax, DWORD PTR _new$[ebp]
	mov	DWORD PTR [eax+12], 0
; Line 188
	mov	eax, DWORD PTR _new$[ebp]
	mov	DWORD PTR [eax+28], 0
; Line 189
	mov	eax, DWORD PTR _new$[ebp]
	mov	DWORD PTR [eax+32], 0
; Line 190
	mov	eax, DWORD PTR _new$[ebp]
	mov	DWORD PTR [eax+24], -1
; Line 191
	mov	eax, DWORD PTR _new$[ebp]
	mov	DWORD PTR [eax+20], 0
; Line 192
	mov	eax, DWORD PTR _new$[ebp]
	mov	DWORD PTR [eax+36], -1
; Line 193
	mov	eax, DWORD PTR _new$[ebp]
	mov	DWORD PTR [eax+40], -1
; Line 194
	mov	eax, DWORD PTR _new$[ebp]
	mov	DWORD PTR [eax+44], -1
; Line 195
	mov	eax, DWORD PTR _new$[ebp]
	mov	DWORD PTR [eax+48], 0
; Line 196
	mov	eax, DWORD PTR _new$[ebp]
	mov	DWORD PTR [eax+56], 0
; Line 197
	mov	eax, DWORD PTR _new$[ebp]
	mov	DWORD PTR [eax+52], 0
; Line 198
	mov	eax, DWORD PTR _new$[ebp]
	mov	DWORD PTR [eax+60], 0
; Line 199
	mov	eax, DWORD PTR _new$[ebp]
	mov	BYTE PTR [eax+84], 0
; Line 200
	mov	eax, DWORD PTR _new$[ebp]
	mov	DWORD PTR [eax+64], 0
; Line 201
	mov	eax, DWORD PTR _new$[ebp]
	mov	DWORD PTR [eax+68], 0
; Line 202
	mov	eax, DWORD PTR _new$[ebp]
	mov	DWORD PTR [eax+72], 0
; Line 203
	mov	eax, DWORD PTR _new$[ebp]
	mov	DWORD PTR [eax+76], 0
; Line 204
	mov	eax, DWORD PTR _new$[ebp]
	mov	DWORD PTR [eax+80], 0
; Line 205
	mov	eax, DWORD PTR _new$[ebp]
	mov	DWORD PTR [eax+88], 0
; Line 206
	mov	eax, DWORD PTR _new$[ebp]
	mov	DWORD PTR [eax+92], 0
; Line 208
	mov	eax, DWORD PTR _new$[ebp]
	mov	DWORD PTR _this$[ebp], eax
; Line 210
	cmp	DWORD PTR _last$[ebp], 0
	jne	$L505
; Line 211
	mov	eax, DWORD PTR _new$[ebp]
	mov	DWORD PTR _first, eax
; Line 212
	jmp	$L506
$L505:
; Line 213
	mov	eax, DWORD PTR _new$[ebp]
	mov	ecx, DWORD PTR _last$[ebp]
	mov	DWORD PTR [ecx+32], eax
$L506:
; Line 215
	mov	eax, DWORD PTR _position$[ebp]
	push	eax
	call	_strlen
	add	esp, 4
	mov	DWORD PTR _depth$[ebp], eax
; Line 216
	mov	eax, DWORD PTR _depth$[ebp]
	add	eax, 2
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _newpos$[ebp], eax
; Line 217
	mov	eax, DWORD PTR _position$[ebp]
	push	eax
	mov	eax, DWORD PTR _newpos$[ebp]
	push	eax
	call	_strcpy
	add	esp, 8
; Line 218
	mov	eax, DWORD PTR _depth$[ebp]
	mov	ecx, DWORD PTR _newpos$[ebp]
	mov	BYTE PTR [eax+ecx+1], 0
; Line 220
$restart$510:
; Line 222
	cmp	DWORD PTR _pattern$[ebp], 0
	jne	$L511
; Line 224
	mov	eax, DWORD PTR _new$[ebp]
	mov	DWORD PTR [eax+12], OFFSET $SG512
; Line 225
	mov	eax, DWORD PTR _new$[ebp]
	mov	DWORD PTR [eax+8], 0
; Line 226
	mov	eax, DWORD PTR _new$[ebp]
	mov	DWORD PTR [eax+16], 0
; Line 227
	mov	eax, DWORD PTR _new$[ebp]
	jmp	$L496
; Line 230
$L511:
	mov	eax, DWORD PTR _pattern$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	mov	DWORD PTR -40+[ebp], eax
	jmp	$L513
; Line 232
$L517:
; Line 233
	mov	eax, DWORD PTR _new$[ebp]
	mov	DWORD PTR [eax+16], 0
; Line 234
	jmp	$L514
; Line 236
$L518:
; Line 237
	mov	eax, DWORD PTR _pattern$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	mov	ecx, DWORD PTR _new$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 238
	jmp	$L514
; Line 239
	jmp	$L514
$L513:
	cmp	DWORD PTR -40+[ebp], 0
	je	$L517
	jmp	$L518
$L514:
; Line 241
	mov	eax, DWORD PTR _pattern$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$[ebp], eax
	mov	eax, DWORD PTR _code$[ebp]
	mov	ecx, DWORD PTR _new$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 243
	mov	eax, DWORD PTR _code$[ebp]
	mov	DWORD PTR -44+[ebp], eax
	jmp	$L519
; Line 245
$L523:
; Line 246
	mov	eax, DWORD PTR _pattern$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _new$[ebp]
	mov	DWORD PTR [ecx+36], eax
; Line 247
	mov	eax, DWORD PTR _new$[ebp]
	mov	DWORD PTR [eax+8], 0
; Line 248
	mov	eax, DWORD PTR _pattern$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _new$[ebp]
	mov	DWORD PTR [ecx+20], eax
; Line 249
	mov	eax, DWORD PTR _new$[ebp]
	mov	eax, DWORD PTR [eax+20]
	movsx	eax, BYTE PTR [eax]
	or	eax, eax
	jne	$L524
; Line 250
	mov	eax, DWORD PTR _new$[ebp]
	mov	DWORD PTR [eax+20], 0
; Line 251
$L524:
	mov	eax, DWORD PTR _pattern$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	ecx, DWORD PTR _new$[ebp]
	mov	DWORD PTR [ecx+80], eax
; Line 252
	mov	eax, DWORD PTR _new$[ebp]
	mov	eax, DWORD PTR [eax+80]
	movsx	eax, BYTE PTR [eax]
	or	eax, eax
	jne	$L525
; Line 253
	mov	eax, DWORD PTR _new$[ebp]
	mov	DWORD PTR [eax+80], 0
; Line 254
$L525:
	mov	eax, DWORD PTR _new$[ebp]
	jmp	$L496
; Line 256
$L526:
; Line 257
	mov	eax, DWORD PTR _pattern$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _new$[ebp]
	mov	DWORD PTR [ecx+36], eax
; Line 258
	mov	eax, DWORD PTR _new$[ebp]
	mov	DWORD PTR [eax+8], 0
; Line 259
	mov	eax, DWORD PTR _pattern$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _new$[ebp]
	mov	DWORD PTR [ecx+20], eax
; Line 260
	mov	eax, DWORD PTR _new$[ebp]
	mov	eax, DWORD PTR [eax+20]
	movsx	eax, BYTE PTR [eax]
	or	eax, eax
	jne	$L527
; Line 261
	mov	eax, DWORD PTR _new$[ebp]
	mov	DWORD PTR [eax+20], 0
; Line 262
$L527:
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L528
$L529:
	inc	DWORD PTR _i$[ebp]
$L528:
	mov	eax, DWORD PTR _pattern$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	DWORD PTR [eax], ecx
	jbe	$L530
; Line 264
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 48					; 00000030H
	mov	ecx, DWORD PTR _depth$[ebp]
	mov	edx, DWORD PTR _newpos$[ebp]
	mov	BYTE PTR [ecx+edx], al
; Line 265
	mov	eax, DWORD PTR _newpos$[ebp]
	push	eax
	mov	eax, DWORD PTR _new$[ebp]
	push	eax
	mov	eax, DWORD PTR _pattern$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	push	eax
	call	_add_to_sequence
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _new$[ebp], eax
; Line 266
	jmp	$L529
$L530:
; Line 267
	mov	eax, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [eax+32]
	mov	BYTE PTR [eax+84], 0
; Line 268
	mov	eax, DWORD PTR _new$[ebp]
	jmp	$L496
; Line 270
$L531:
; Line 271
	mov	eax, DWORD PTR _pattern$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _new$[ebp]
	mov	DWORD PTR [ecx+40], eax
; Line 272
	mov	eax, DWORD PTR _dupcount
	mov	ecx, DWORD PTR _new$[ebp]
	mov	DWORD PTR [ecx+44], eax
	inc	DWORD PTR _dupcount
; Line 273
	mov	eax, DWORD PTR _new$[ebp]
	mov	DWORD PTR [eax+8], 0
; Line 274
	mov	eax, DWORD PTR _new$[ebp]
	jmp	$L496
; Line 276
$L532:
; Line 277
	mov	eax, DWORD PTR _pattern$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _pattern$[ebp], eax
; Line 278
	jmp	$restart$510
; Line 280
$L533:
; Line 281
	mov	eax, DWORD PTR _new$[ebp]
	mov	DWORD PTR [eax+12], OFFSET $SG534
; Line 282
	mov	eax, DWORD PTR _new$[ebp]
	jmp	$L496
; Line 284
$L535:
; Line 285
	mov	eax, DWORD PTR _new$[ebp]
	mov	DWORD PTR [eax+12], OFFSET $SG536
; Line 286
	mov	eax, DWORD PTR _new$[ebp]
	jmp	$L496
; Line 288
$L537:
; Line 289
	mov	eax, DWORD PTR _pattern$[ebp]
	cmp	DWORD PTR [eax+4], 0
	jne	$L538
; Line 291
	mov	eax, DWORD PTR _new$[ebp]
	mov	DWORD PTR [eax+12], OFFSET $SG539
; Line 292
	mov	eax, DWORD PTR _new$[ebp]
	jmp	$L496
; Line 294
$L538:
	mov	eax, DWORD PTR _pattern$[ebp]
	cmp	DWORD PTR [eax+4], 1
	jne	$L540
; Line 296
	mov	eax, DWORD PTR _new$[ebp]
	mov	DWORD PTR [eax+12], OFFSET $SG541
; Line 297
	mov	eax, DWORD PTR _new$[ebp]
	jmp	$L496
; Line 299
$L540:
	jmp	$L520
; Line 301
$L542:
; Line 302
	mov	eax, DWORD PTR _depth$[ebp]
	mov	ecx, DWORD PTR _newpos$[ebp]
	mov	BYTE PTR [eax+ecx], 48			; 00000030H
; Line 303
	mov	eax, DWORD PTR _newpos$[ebp]
	push	eax
	mov	eax, DWORD PTR _new$[ebp]
	push	eax
	mov	eax, DWORD PTR _pattern$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_add_to_sequence
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _new$[ebp], eax
; Line 304
	mov	eax, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [eax+32]
	mov	BYTE PTR [eax+84], 1
; Line 305
	mov	eax, DWORD PTR _depth$[ebp]
	mov	ecx, DWORD PTR _newpos$[ebp]
	mov	BYTE PTR [eax+ecx], 49			; 00000031H
; Line 306
	mov	eax, DWORD PTR _newpos$[ebp]
	push	eax
	mov	eax, DWORD PTR _new$[ebp]
	push	eax
	mov	eax, DWORD PTR _pattern$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_add_to_sequence
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _new$[ebp], eax
; Line 307
	mov	eax, DWORD PTR _new$[ebp]
	jmp	$L496
; Line 309
$L543:
; Line 310
	mov	eax, DWORD PTR _depth$[ebp]
	mov	ecx, DWORD PTR _newpos$[ebp]
	mov	BYTE PTR [eax+ecx], 48			; 00000030H
; Line 311
	mov	eax, DWORD PTR _newpos$[ebp]
	push	eax
	mov	eax, DWORD PTR _new$[ebp]
	push	eax
	mov	eax, DWORD PTR _pattern$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_add_to_sequence
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _new$[ebp], eax
; Line 312
	mov	eax, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [eax+32]
	mov	BYTE PTR [eax+84], 1
; Line 313
	mov	eax, DWORD PTR _new$[ebp]
	jmp	$L496
; Line 315
$L544:
; Line 316
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+56], 1
; Line 317
	mov	eax, DWORD PTR _pattern$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+60], eax
; Line 318
	mov	eax, DWORD PTR _depth$[ebp]
	mov	ecx, DWORD PTR _newpos$[ebp]
	mov	BYTE PTR [eax+ecx], 48			; 00000030H
; Line 319
	mov	eax, DWORD PTR _newpos$[ebp]
	push	eax
	mov	eax, DWORD PTR _new$[ebp]
	push	eax
	mov	eax, DWORD PTR _pattern$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_add_to_sequence
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _new$[ebp], eax
; Line 320
	mov	eax, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [eax+32]
	mov	BYTE PTR [eax+84], 1
; Line 321
	mov	eax, DWORD PTR _new$[ebp]
	jmp	$L496
; Line 323
$L545:
; Line 325
	mov	eax, DWORD PTR _depth$[ebp]
	mov	ecx, DWORD PTR _newpos$[ebp]
	mov	BYTE PTR [eax+ecx], 48			; 00000030H
; Line 326
	mov	eax, DWORD PTR _newpos$[ebp]
	push	eax
	mov	eax, DWORD PTR _new$[ebp]
	push	eax
	mov	eax, DWORD PTR _pattern$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_add_to_sequence
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _new$[ebp], eax
; Line 327
	mov	eax, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [eax+32]
	mov	BYTE PTR [eax+84], 1
; Line 328
	mov	eax, DWORD PTR _depth$[ebp]
	mov	ecx, DWORD PTR _newpos$[ebp]
	mov	BYTE PTR [eax+ecx], 49			; 00000031H
; Line 329
	mov	eax, DWORD PTR _newpos$[ebp]
	push	eax
	mov	eax, DWORD PTR _new$[ebp]
	push	eax
	mov	eax, DWORD PTR _pattern$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_add_to_sequence
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _new$[ebp], eax
; Line 330
	mov	eax, DWORD PTR _depth$[ebp]
	mov	ecx, DWORD PTR _newpos$[ebp]
	mov	BYTE PTR [eax+ecx], 50			; 00000032H
; Line 331
	mov	eax, DWORD PTR _newpos$[ebp]
	push	eax
	mov	eax, DWORD PTR _new$[ebp]
	push	eax
	mov	eax, DWORD PTR _pattern$[ebp]
	mov	eax, DWORD PTR [eax+12]
	push	eax
	call	_add_to_sequence
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _new$[ebp], eax
; Line 332
	mov	eax, DWORD PTR _new$[ebp]
	jmp	$L496
; Line 333
	jmp	$L520
$L519:
	cmp	DWORD PTR -44+[ebp], 30			; 0000001eH
	jg	$L931
	je	$L537
	cmp	DWORD PTR -44+[ebp], 4
	je	$L523
	cmp	DWORD PTR -44+[ebp], 5
	je	$L531
	cmp	DWORD PTR -44+[ebp], 6
	je	$L526
	cmp	DWORD PTR -44+[ebp], 12			; 0000000cH
	je	$L532
	cmp	DWORD PTR -44+[ebp], 25			; 00000019H
	je	$L542
	jmp	$L520
$L931:
	cmp	DWORD PTR -44+[ebp], 36			; 00000024H
	jg	$L932
	je	$L543
	cmp	DWORD PTR -44+[ebp], 33			; 00000021H
	je	$L533
	cmp	DWORD PTR -44+[ebp], 35			; 00000023H
	je	$L544
	jmp	$L520
$L932:
	cmp	DWORD PTR -44+[ebp], 40			; 00000028H
	je	$L535
	cmp	DWORD PTR -44+[ebp], 89			; 00000059H
	jl	$L520
	cmp	DWORD PTR -44+[ebp], 90			; 0000005aH
	jle	$L545
	jmp	$L520
$L520:
; Line 335
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_format[eax*4]
	mov	DWORD PTR _fmt$[ebp], eax
; Line 336
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_length[eax*4]
	mov	DWORD PTR _len$[ebp], eax
; Line 337
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L546
$L547:
	inc	DWORD PTR _i$[ebp]
$L546:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _len$[ebp], eax
	jle	$L548
; Line 339
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 48					; 00000030H
	mov	ecx, DWORD PTR _depth$[ebp]
	mov	edx, DWORD PTR _newpos$[ebp]
	mov	BYTE PTR [ecx+edx], al
; Line 340
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 101				; 00000065H
	je	$L550
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 117				; 00000075H
	jne	$L549
$L550:
; Line 341
	mov	eax, DWORD PTR _newpos$[ebp]
	push	eax
	mov	eax, DWORD PTR _new$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _pattern$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	push	eax
	call	_add_to_sequence
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _new$[ebp], eax
; Line 342
	jmp	$L551
$L549:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 105				; 00000069H
	jne	$L552
	cmp	DWORD PTR _i$[ebp], 0
	jne	$L552
; Line 344
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+48], 1
; Line 345
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _pattern$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+52], eax
; Line 347
	jmp	$L553
$L552:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 105				; 00000069H
	jne	$L554
	cmp	DWORD PTR _i$[ebp], 1
	jne	$L554
; Line 349
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+56], 1
; Line 350
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _pattern$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+60], eax
; Line 352
	jmp	$L555
$L554:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 69					; 00000045H
	jne	$L556
; Line 361
	cmp	DWORD PTR _i$[ebp], 0
	je	$L558
; Line 362
	call	_abort
; Line 363
$L558:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _pattern$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+88], eax
; Line 364
	mov	DWORD PTR _j$557[ebp], 0
	jmp	$L560
$L561:
	inc	DWORD PTR _j$557[ebp]
$L560:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _pattern$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$557[ebp]
	cmp	DWORD PTR [eax], ecx
	jbe	$L562
; Line 366
	mov	eax, DWORD PTR _j$557[ebp]
	add	eax, 97					; 00000061H
	mov	ecx, DWORD PTR _depth$[ebp]
	mov	edx, DWORD PTR _newpos$[ebp]
	mov	BYTE PTR [ecx+edx], al
; Line 368
	mov	eax, DWORD PTR _newpos$[ebp]
	push	eax
	mov	eax, DWORD PTR _new$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _pattern$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$557[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	push	eax
	call	_add_to_sequence
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _new$[ebp], eax
; Line 369
	jmp	$L561
$L562:
; Line 371
	jmp	$L563
$L556:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 48					; 00000030H
	je	$L564
; Line 372
	call	_abort
; Line 373
$L564:
$L563:
$L555:
$L553:
$L551:
	jmp	$L547
$L548:
; Line 374
	mov	eax, DWORD PTR _new$[ebp]
	jmp	$L496
; Line 375
$L496:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_add_to_sequence ENDP
_TEXT	ENDS
PUBLIC	_try_merge_2
PUBLIC	_merge_trees
PUBLIC	_try_merge_1
_TEXT	SEGMENT
_old$ = 8
_add$ = 12
_next$572 = -4
_merge_trees PROC NEAR
; Line 384
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 385
$L570:
	cmp	DWORD PTR _add$[ebp], 0
	je	$L571
; Line 387
	mov	eax, DWORD PTR _add$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR _next$572[ebp], eax
; Line 388
	mov	eax, DWORD PTR _add$[ebp]
	mov	DWORD PTR [eax+28], 0
; Line 389
	mov	eax, DWORD PTR _add$[ebp]
	push	eax
	mov	eax, DWORD PTR _old$[ebp]
	push	eax
	call	_try_merge_1
	add	esp, 8
	or	eax, eax
	jne	$L574
; Line 390
	mov	eax, DWORD PTR _add$[ebp]
	push	eax
	mov	eax, DWORD PTR _old$[ebp]
	push	eax
	call	_try_merge_2
	add	esp, 8
	mov	DWORD PTR _old$[ebp], eax
; Line 391
$L574:
	mov	eax, DWORD PTR _next$572[ebp]
	mov	DWORD PTR _add$[ebp], eax
; Line 392
	jmp	$L570
$L571:
; Line 393
	mov	eax, DWORD PTR _old$[ebp]
	jmp	$L568
; Line 394
$L568:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_merge_trees ENDP
_TEXT	ENDS
PUBLIC	_no_same_mode
PUBLIC	_fatal
EXTRN	_strcmp:NEAR
_DATA	SEGMENT
	ORG $+1
$SG589	DB	'Two actions at one point in tree.', 00H
_DATA	ENDS
_TEXT	SEGMENT
_add$ = 12
_old$ = 8
_try_merge_1 PROC NEAR
; Line 404
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 405
$L579:
	cmp	DWORD PTR _old$[ebp], 0
	je	$L580
; Line 424
	mov	eax, DWORD PTR _add$[ebp]
	mov	ecx, DWORD PTR _old$[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	cmp	DWORD PTR [eax+4], ecx
	je	$L584
	mov	eax, DWORD PTR _old$[ebp]
	cmp	DWORD PTR [eax+4], 0
	je	$L583
	mov	eax, DWORD PTR _add$[ebp]
	cmp	DWORD PTR [eax+4], 0
	je	$L583
	mov	eax, DWORD PTR _add$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _old$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L583
$L584:
	mov	eax, DWORD PTR _add$[ebp]
	mov	ecx, DWORD PTR _old$[ebp]
	mov	ecx, DWORD PTR [ecx+20]
	cmp	DWORD PTR [eax+20], ecx
	je	$L585
	mov	eax, DWORD PTR _old$[ebp]
	cmp	DWORD PTR [eax+20], 0
	je	$L583
	mov	eax, DWORD PTR _add$[ebp]
	cmp	DWORD PTR [eax+20], 0
	je	$L583
	mov	eax, DWORD PTR _add$[ebp]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	mov	eax, DWORD PTR _old$[ebp]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L583
$L585:
	mov	eax, DWORD PTR _add$[ebp]
	mov	ecx, DWORD PTR _old$[ebp]
	mov	ecx, DWORD PTR [ecx+76]
	cmp	DWORD PTR [eax+76], ecx
	je	$L586
	mov	eax, DWORD PTR _old$[ebp]
	cmp	DWORD PTR [eax+76], 0
	je	$L583
	mov	eax, DWORD PTR _add$[ebp]
	cmp	DWORD PTR [eax+76], 0
	je	$L583
	mov	eax, DWORD PTR _add$[ebp]
	mov	eax, DWORD PTR [eax+76]
	push	eax
	mov	eax, DWORD PTR _old$[ebp]
	mov	eax, DWORD PTR [eax+76]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L583
$L586:
	mov	eax, DWORD PTR _add$[ebp]
	mov	ecx, DWORD PTR _old$[ebp]
	mov	ecx, DWORD PTR [ecx+48]
	cmp	DWORD PTR [eax+48], ecx
	jne	$L583
	mov	eax, DWORD PTR _add$[ebp]
	mov	ecx, DWORD PTR _old$[ebp]
	mov	ecx, DWORD PTR [ecx+52]
	cmp	DWORD PTR [eax+52], ecx
	jne	$L583
	mov	eax, DWORD PTR _add$[ebp]
	mov	ecx, DWORD PTR _old$[ebp]
	mov	ecx, DWORD PTR [ecx+56]
	cmp	DWORD PTR [eax+56], ecx
	jne	$L583
	mov	eax, DWORD PTR _add$[ebp]
	mov	ecx, DWORD PTR _old$[ebp]
	mov	ecx, DWORD PTR [ecx+60]
	cmp	DWORD PTR [eax+60], ecx
	jne	$L583
	mov	eax, DWORD PTR _add$[ebp]
	mov	ecx, DWORD PTR _old$[ebp]
	mov	ecx, DWORD PTR [ecx+88]
	cmp	DWORD PTR [eax+88], ecx
	jne	$L583
	mov	eax, DWORD PTR _add$[ebp]
	mov	ecx, DWORD PTR _old$[ebp]
	mov	ecx, DWORD PTR [ecx+40]
	cmp	DWORD PTR [eax+40], ecx
	jne	$L583
	mov	eax, DWORD PTR _add$[ebp]
	mov	ecx, DWORD PTR _old$[ebp]
	mov	ecx, DWORD PTR [ecx+36]
	cmp	DWORD PTR [eax+36], ecx
	jne	$L583
	mov	eax, DWORD PTR _old$[ebp]
	cmp	DWORD PTR [eax+20], 0
	je	$L587
	mov	eax, DWORD PTR _add$[ebp]
	movsx	eax, BYTE PTR [eax+84]
	or	eax, eax
	je	$L933
	mov	eax, DWORD PTR _old$[ebp]
	push	eax
	call	_no_same_mode
	add	esp, 4
	mov	DWORD PTR -4+[ebp], eax
	jmp	$L934
$L933:
	mov	eax, DWORD PTR _old$[ebp]
	cmp	DWORD PTR [eax+28], 1
	sbb	eax, eax
	neg	eax
	mov	DWORD PTR -4+[ebp], eax
$L934:
	cmp	DWORD PTR -4+[ebp], 0
	je	$L583
$L587:
	mov	eax, DWORD PTR _add$[ebp]
	mov	ecx, DWORD PTR _old$[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	cmp	DWORD PTR [eax+8], ecx
	jne	$L583
	mov	eax, DWORD PTR _add$[ebp]
	mov	ecx, DWORD PTR _old$[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	cmp	DWORD PTR [eax+16], ecx
	jne	$L583
; Line 426
	mov	eax, DWORD PTR _add$[ebp]
	mov	eax, DWORD PTR [eax+32]
	push	eax
	mov	eax, DWORD PTR _old$[ebp]
	mov	eax, DWORD PTR [eax+32]
	push	eax
	call	_merge_trees
	add	esp, 8
	mov	ecx, DWORD PTR _old$[ebp]
	mov	DWORD PTR [ecx+32], eax
; Line 427
	mov	eax, DWORD PTR _old$[ebp]
	cmp	DWORD PTR [eax+24], 0
	jl	$L588
	mov	eax, DWORD PTR _add$[ebp]
	cmp	DWORD PTR [eax+24], 0
	jl	$L588
; Line 428
	push	0
	push	0
	push	OFFSET $SG589
	call	_fatal
	add	esp, 12					; 0000000cH
; Line 429
$L588:
	mov	eax, DWORD PTR _old$[ebp]
	cmp	DWORD PTR [eax+24], -1
	jne	$L590
; Line 430
	mov	eax, DWORD PTR _add$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	ecx, DWORD PTR _old$[ebp]
	mov	DWORD PTR [ecx+24], eax
; Line 431
$L590:
	mov	eax, 1
	jmp	$L577
; Line 433
$L583:
	mov	eax, DWORD PTR _old$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR _old$[ebp], eax
; Line 434
	jmp	$L579
$L580:
; Line 435
	sub	eax, eax
	jmp	$L577
; Line 436
$L577:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_try_merge_1 ENDP
_old$ = 8
_add$ = 12
_p$ = -16
_last$ = -4
_last_same_place$ = -8
_operand$ = -12
_try_merge_2 PROC NEAR
; Line 448
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 450
	mov	DWORD PTR _last$[ebp], 0
; Line 451
	mov	DWORD PTR _last_same_place$[ebp], 0
; Line 464
	mov	eax, DWORD PTR _add$[ebp]
	cmp	DWORD PTR [eax+20], 1
	sbb	eax, eax
	inc	eax
	mov	DWORD PTR _operand$[ebp], eax
; Line 466
	mov	eax, DWORD PTR _old$[ebp]
	mov	DWORD PTR _p$[ebp], eax
	jmp	$L598
$L599:
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR _p$[ebp], eax
$L598:
	cmp	DWORD PTR _p$[ebp], 0
	je	$L600
; Line 470
	mov	eax, DWORD PTR _p$[ebp]
	mov	ecx, DWORD PTR _add$[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	cmp	DWORD PTR [eax+4], ecx
	je	$L602
	mov	eax, DWORD PTR _p$[ebp]
	cmp	DWORD PTR [eax+4], 0
	je	$L601
	mov	eax, DWORD PTR _add$[ebp]
	cmp	DWORD PTR [eax+4], 0
	je	$L601
	mov	eax, DWORD PTR _add$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L601
$L602:
; Line 472
	mov	eax, DWORD PTR _p$[ebp]
	mov	DWORD PTR _last_same_place$[ebp], eax
; Line 474
	mov	eax, DWORD PTR _p$[ebp]
	movsx	eax, BYTE PTR [eax+84]
	or	eax, eax
	je	$L603
	mov	eax, DWORD PTR _add$[ebp]
	mov	ecx, DWORD PTR _p$[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	cmp	DWORD PTR [eax+16], ecx
	jge	$L603
; Line 475
	jmp	$L600
; Line 483
$L603:
; Line 486
	jmp	$L604
$L601:
	cmp	DWORD PTR _last_same_place$[ebp], 0
	je	$L605
; Line 487
	jmp	$L600
; Line 488
$L605:
$L604:
	mov	eax, DWORD PTR _p$[ebp]
	mov	DWORD PTR _last$[ebp], eax
; Line 489
	jmp	$L599
$L600:
; Line 493
	cmp	DWORD PTR _last$[ebp], 0
	je	$L606
; Line 495
	mov	eax, DWORD PTR _last$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	ecx, DWORD PTR _add$[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 496
	mov	eax, DWORD PTR _add$[ebp]
	mov	ecx, DWORD PTR _last$[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 497
	mov	eax, DWORD PTR _old$[ebp]
	jmp	$L593
; Line 500
$L606:
	mov	eax, DWORD PTR _old$[ebp]
	mov	ecx, DWORD PTR _add$[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 501
	mov	eax, DWORD PTR _add$[ebp]
	jmp	$L593
; Line 502
$L593:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_try_merge_2 ENDP
_node$ = 8
_p$ = -8
_mode$ = -4
_no_same_mode PROC NEAR
; Line 507
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 509
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _mode$[ebp], eax
; Line 511
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR _p$[ebp], eax
	jmp	$L611
$L612:
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR _p$[ebp], eax
$L611:
	cmp	DWORD PTR _p$[ebp], 0
	je	$L613
; Line 512
	mov	eax, DWORD PTR _p$[ebp]
	mov	ecx, DWORD PTR _mode$[ebp]
	cmp	DWORD PTR [eax+16], ecx
	jne	$L614
; Line 513
	sub	eax, eax
	jmp	$L608
; Line 515
$L614:
	jmp	$L612
$L613:
	mov	eax, 1
	jmp	$L608
; Line 516
$L608:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_no_same_mode ENDP
_TEXT	ENDS
PUBLIC	_write_subroutine
PUBLIC	_break_out_subroutines
_TEXT	SEGMENT
_node$ = 8
_size$ = -8
_sub$ = -4
_break_out_subroutines PROC NEAR
; Line 525
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 526
	mov	DWORD PTR _size$[ebp], 0
; Line 528
	mov	eax, DWORD PTR _node$[ebp]
	mov	DWORD PTR _sub$[ebp], eax
	jmp	$L620
$L621:
	mov	eax, DWORD PTR _sub$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR _sub$[ebp], eax
$L620:
	cmp	DWORD PTR _sub$[ebp], 0
	je	$L622
; Line 529
	mov	eax, DWORD PTR _sub$[ebp]
	mov	eax, DWORD PTR [eax+32]
	push	eax
	call	_break_out_subroutines
	add	esp, 4
	inc	eax
	add	DWORD PTR _size$[ebp], eax
	jmp	$L621
$L622:
; Line 530
	cmp	DWORD PTR _size$[ebp], 50		; 00000032H
	jle	$L623
; Line 532
	inc	DWORD PTR _next_subroutine_number
	mov	eax, DWORD PTR _next_subroutine_number
	mov	ecx, DWORD PTR _node$[ebp]
	mov	DWORD PTR [ecx+92], eax
; Line 533
	mov	eax, DWORD PTR _node$[ebp]
	push	eax
	call	_write_subroutine
	add	esp, 4
; Line 534
	mov	DWORD PTR _size$[ebp], 1
; Line 536
$L623:
	mov	eax, DWORD PTR _size$[ebp]
	jmp	$L617
; Line 537
$L617:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_break_out_subroutines ENDP
_TEXT	ENDS
PUBLIC	_write_tree
EXTRN	_printf:NEAR
_DATA	SEGMENT
	ORG $+2
$SG626	DB	'int', 0aH, 'recog_%d (x0, insn)', 0aH, '     register rt'
	DB	'x x0;', 0aH, '     rtx insn;', 0aH, '{', 0aH, 00H
$SG627	DB	'  register rtx x1, x2, x3, x4, x5;', 0aH, '  rtx x6, x7,'
	DB	' x8, x9, x10, x11;', 0aH, 00H
$SG628	DB	'  int tem;', 0aH, 00H
$SG629	DB	00H
	ORG $+3
$SG630	DB	00H
	ORG $+3
$SG631	DB	' ret0: return -1;', 0aH, '}', 0aH, 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_tree$ = 8
_write_subroutine PROC NEAR
; Line 542
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 544
	mov	eax, DWORD PTR _tree$[ebp]
	mov	eax, DWORD PTR [eax+92]
	push	eax
	push	OFFSET $SG626
	call	_printf
	add	esp, 8
; Line 545
	push	OFFSET $SG627
	call	_printf
	add	esp, 4
; Line 546
	push	OFFSET $SG628
	call	_printf
	add	esp, 4
; Line 547
	push	1
	push	OFFSET $SG629
	push	0
	push	OFFSET $SG630
	mov	eax, DWORD PTR _tree$[ebp]
	push	eax
	call	_write_tree
	add	esp, 20					; 00000014H
; Line 548
	push	OFFSET $SG631
	call	_printf
	add	esp, 4
; Line 549
$L625:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_write_subroutine ENDP
_TEXT	ENDS
PUBLIC	_print_code
PUBLIC	_clear_codes
PUBLIC	_clear_modes
PUBLIC	_change_state
PUBLIC	_mybzero
PUBLIC	_same_modes
PUBLIC	_same_codes
EXTRN	_mode_name:BYTE
_DATA	SEGMENT
	ORG $+2
$SG651	DB	' L%d:', 0aH, 00H
	ORG $+1
$SG653	DB	'  tem = recog_%d (x0, insn);', 0aH, 00H
	ORG $+2
$SG654	DB	'  if (tem >= 0) return tem;', 0aH, 00H
	ORG $+3
$SG655	DB	'  goto L%d;', 0aH, 00H
	ORG $+3
$SG657	DB	'  return recog_%d (x0, insn);', 0aH, 00H
	ORG $+1
$SG672	DB	'  }', 0aH, 00H
	ORG $+3
$SG674	DB	'  }', 0aH, 00H
	ORG $+3
$SG676	DB	' L%d:', 0aH, 00H
	ORG $+1
$SG681	DB	'  if (GET_MODE (x%d) != %smode)', 0aH, 00H
	ORG $+3
$SG683	DB	'    {', 0aH, '    ', 00H
	ORG $+1
$SG684	DB	'      goto L%d;', 0aH, '    }', 0aH, 00H
	ORG $+1
$SG686	DB	'    goto ret0;', 0aH, 00H
$SG689	DB	'  if (GET_CODE (x%d) != ', 00H
	ORG $+3
$SG690	DB	')', 0aH, 00H
	ORG $+1
$SG692	DB	'    {', 00H
	ORG $+2
$SG693	DB	'    goto L%d; }', 0aH, 00H
	ORG $+3
$SG695	DB	'    goto ret0;', 0aH, 00H
$SG705	DB	' switch (GET_MODE (x%d))', 0aH, '  {', 0aH, 00H
	ORG $+2
$SG714	DB	' switch (GET_CODE (x%d))', 0aH, '  {', 0aH, 00H
	ORG $+2
$SG717	DB	'  case %smode:', 0aH, 00H
$SG720	DB	'  case ', 00H
$SG721	DB	':', 0aH, 00H
	ORG $+1
$SG722	DB	'  if (', 00H
	ORG $+1
$SG726	DB	'x%d == %s', 00H
	ORG $+2
$SG728	DB	'GET_CODE (x%d) == ', 00H
	ORG $+1
$SG729	DB	' && ', 00H
	ORG $+3
$SG731	DB	'GET_MODE (x%d) == %smode && ', 00H
	ORG $+3
$SG733	DB	'XINT (x%d, 0) == %d && ', 00H
$SG735	DB	'XVECLEN (x%d, 0) == %d && ', 00H
	ORG $+1
$SG737	DB	'XINT (x%d, 1) == %d && ', 00H
$SG739	DB	'rtx_equal_p (x%d, recog_operand[%d]) && ', 00H
	ORG $+3
$SG741	DB	'%s (x%d, %smode)', 00H
	ORG $+3
$SG743	DB	'1', 00H
	ORG $+2
$SG745	DB	')', 0aH, '    { recog_operand[%d] = x%d; ', 00H
	ORG $+2
$SG747	DB	')', 0aH, '    ', 00H
	ORG $+1
$SG749	DB	'if (%s) ', 00H
	ORG $+3
$SG751	DB	'return %d;', 00H
	ORG $+1
$SG753	DB	'goto L%d;', 00H
	ORG $+2
$SG755	DB	' }', 0aH, 00H
$SG757	DB	0aH, 00H
	ORG $+2
$SG766	DB	'  break;', 0aH, 00H
	ORG $+2
$SG769	DB	' goto L%d;', 0aH, 00H
$SG778	DB	'  break;', 0aH, 00H
	ORG $+2
$SG781	DB	' goto L%d;', 0aH, 00H
$SG783	DB	'  }', 0aH, 00H
	ORG $+3
$SG785	DB	'  goto L%d;', 0aH, 00H
	ORG $+3
$SG787	DB	'  goto ret0;', 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_pos$ = -12
_depth$ = -8
_ignmode$ = -108
_i$707 = -156
_in_switch$ = -140
_modemap$ = -136
_codemap$ = -104
_tree$ = 8
_i$697 = -152
_prevpos$ = 12
_lose$698 = -148
_afterward$ = 16
_afterpos$ = 20
_initial$ = 24
_p$ = -144
_p1$ = -4
_write_tree PROC NEAR
; Line 560
	push	ebp
	mov	ebp, esp
	sub	esp, 164				; 000000a4H
	push	ebx
	push	esi
	push	edi
; Line 565
	mov	DWORD PTR _in_switch$[ebp], 0
; Line 569
	mov	eax, DWORD PTR _prevpos$[ebp]
	mov	DWORD PTR _pos$[ebp], eax
; Line 571
	mov	eax, DWORD PTR _tree$[ebp]
	cmp	DWORD PTR [eax+92], 0
	jle	$L650
	cmp	DWORD PTR _initial$[ebp], 0
	jne	$L650
; Line 573
	mov	eax, DWORD PTR _tree$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	push	OFFSET $SG651
	call	_printf
	add	esp, 8
; Line 575
	cmp	DWORD PTR _afterward$[ebp], 0
	je	$L652
; Line 578
	mov	eax, DWORD PTR _tree$[ebp]
	mov	eax, DWORD PTR [eax+92]
	push	eax
	push	OFFSET $SG653
	call	_printf
	add	esp, 8
; Line 579
	push	OFFSET $SG654
	call	_printf
	add	esp, 4
; Line 580
	mov	eax, DWORD PTR _afterpos$[ebp]
	push	eax
	mov	eax, DWORD PTR _pos$[ebp]
	push	eax
	call	_change_state
	add	esp, 8
; Line 581
	mov	eax, DWORD PTR _afterward$[ebp]
	push	eax
	push	OFFSET $SG655
	call	_printf
	add	esp, 8
; Line 583
	jmp	$L656
$L652:
; Line 585
	mov	eax, DWORD PTR _tree$[ebp]
	mov	eax, DWORD PTR [eax+92]
	push	eax
	push	OFFSET $SG657
	call	_printf
	add	esp, 8
$L656:
; Line 586
	jmp	$L637
; Line 589
$L650:
	mov	eax, DWORD PTR _tree$[ebp]
	mov	DWORD PTR [eax+72], 1
; Line 590
	mov	eax, DWORD PTR _tree$[ebp]
	mov	DWORD PTR _p$[ebp], eax
	jmp	$L658
$L659:
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR _p$[ebp], eax
$L658:
	cmp	DWORD PTR _p$[ebp], 0
	je	$L660
; Line 600
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR _p1$[ebp], eax
	jmp	$L661
$L662:
	mov	eax, DWORD PTR _p1$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR _p1$[ebp], eax
$L661:
	cmp	DWORD PTR _p1$[ebp], 0
	je	$L663
; Line 605
	mov	eax, DWORD PTR _p$[ebp]
	cmp	DWORD PTR [eax+8], 0
	je	$L667
	mov	eax, DWORD PTR _p1$[ebp]
	cmp	DWORD PTR [eax+8], 0
	je	$L667
	mov	eax, DWORD PTR _p1$[ebp]
	mov	ecx, DWORD PTR _p$[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	cmp	DWORD PTR [eax+8], ecx
	jne	$L666
$L667:
	mov	eax, DWORD PTR _p$[ebp]
	cmp	DWORD PTR [eax+16], 0
	je	$L665
	mov	eax, DWORD PTR _p1$[ebp]
	cmp	DWORD PTR [eax+16], 0
	je	$L665
	mov	eax, DWORD PTR _p1$[ebp]
	mov	ecx, DWORD PTR _p$[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	cmp	DWORD PTR [eax+16], ecx
	je	$L665
	cmp	DWORD PTR _in_switch$[ebp], 2
	je	$L668
	mov	eax, DWORD PTR _p$[ebp]
	cmp	DWORD PTR [eax+20], 0
	jne	$L665
	mov	eax, DWORD PTR _p1$[ebp]
	cmp	DWORD PTR [eax+20], 0
	jne	$L665
$L668:
$L666:
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _p1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	je	$L664
$L665:
; Line 606
	jmp	$L663
; Line 607
$L664:
	jmp	$L662
$L663:
	mov	eax, DWORD PTR _p1$[ebp]
	mov	ecx, DWORD PTR _p$[ebp]
	mov	DWORD PTR [ecx+68], eax
; Line 608
	cmp	DWORD PTR _p1$[ebp], 0
	je	$L669
	mov	eax, DWORD PTR _p1$[ebp]
	mov	DWORD PTR [eax+72], 1
; Line 610
$L669:
; Line 611
	cmp	DWORD PTR _in_switch$[ebp], 2
	jne	$L670
	mov	eax, DWORD PTR _p$[ebp]
	cmp	DWORD PTR [eax+16], 0
	je	$L671
	mov	eax, DWORD PTR _p$[ebp]
	movsx	eax, BYTE PTR [eax+84]
	or	eax, eax
	jne	$L670
	mov	eax, DWORD PTR _p$[ebp]
	cmp	DWORD PTR [eax+20], 0
	je	$L670
$L671:
; Line 613
	mov	DWORD PTR _in_switch$[ebp], 0
; Line 614
	push	OFFSET $SG672
	call	_printf
	add	esp, 4
; Line 616
$L670:
	cmp	DWORD PTR _in_switch$[ebp], 1
	jne	$L673
	mov	eax, DWORD PTR _p$[ebp]
	cmp	DWORD PTR [eax+8], 0
	jne	$L673
; Line 618
	mov	DWORD PTR _in_switch$[ebp], 0
; Line 619
	push	OFFSET $SG674
	call	_printf
	add	esp, 4
; Line 622
$L673:
	mov	eax, DWORD PTR _p$[ebp]
	cmp	DWORD PTR [eax+72], 0
	je	$L675
; Line 623
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	push	OFFSET $SG676
	call	_printf
	add	esp, 8
; Line 625
$L675:
	mov	eax, DWORD PTR _p$[ebp]
	cmp	DWORD PTR [eax+32], 0
	jne	$L677
	mov	eax, DWORD PTR _p$[ebp]
	cmp	DWORD PTR [eax+24], 0
	jge	$L677
; Line 626
	call	_abort
; Line 628
$L677:
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _pos$[ebp]
	push	eax
	call	_change_state
	add	esp, 8
; Line 629
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _pos$[ebp], eax
; Line 630
	mov	eax, DWORD PTR _pos$[ebp]
	push	eax
	call	_strlen
	add	esp, 4
	mov	DWORD PTR _depth$[ebp], eax
; Line 632
	mov	eax, DWORD PTR _p$[ebp]
	cmp	DWORD PTR [eax+64], 0
	jne	$L937
	mov	eax, DWORD PTR _depth$[ebp]
	mov	ecx, DWORD PTR _pos$[ebp]
	movsx	eax, BYTE PTR [eax+ecx-1]
	cmp	eax, 42					; 0000002aH
	je	$L937
	mov	eax, DWORD PTR _p$[ebp]
	cmp	DWORD PTR [eax+20], 0
	je	$L935
$L937:
	mov	DWORD PTR _ignmode$[ebp], 1
	jmp	$L936
$L935:
	mov	DWORD PTR _ignmode$[ebp], 0
$L936:
; Line 634
	cmp	DWORD PTR _in_switch$[ebp], 0
	jne	$L678
; Line 638
	cmp	DWORD PTR _ignmode$[ebp], 0
	jne	$L680
	mov	eax, DWORD PTR _p$[ebp]
	cmp	DWORD PTR [eax+16], 0
	je	$L680
	mov	eax, DWORD PTR _p$[ebp]
	cmp	DWORD PTR [eax+28], 0
	je	$L680
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	call	_same_modes
	add	esp, 8
	or	eax, eax
	je	$L680
; Line 641
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR _mode_name[eax*4]
	push	eax
	mov	eax, DWORD PTR _depth$[ebp]
	push	eax
	push	OFFSET $SG681
	call	_printf
	add	esp, 12					; 0000000cH
; Line 642
	cmp	DWORD PTR _afterward$[ebp], 0
	je	$L682
; Line 644
	push	OFFSET $SG683
	call	_printf
	add	esp, 4
; Line 645
	mov	eax, DWORD PTR _afterpos$[ebp]
	push	eax
	mov	eax, DWORD PTR _pos$[ebp]
	push	eax
	call	_change_state
	add	esp, 8
; Line 646
	mov	eax, DWORD PTR _afterward$[ebp]
	push	eax
	push	OFFSET $SG684
	call	_printf
	add	esp, 8
; Line 648
	jmp	$L685
$L682:
; Line 649
	push	OFFSET $SG686
	call	_printf
	add	esp, 4
$L685:
; Line 650
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	call	_clear_modes
	add	esp, 4
; Line 651
	mov	DWORD PTR _ignmode$[ebp], 1
; Line 656
$L680:
	mov	eax, DWORD PTR _p$[ebp]
	cmp	DWORD PTR [eax+8], 0
	je	$L688
	mov	eax, DWORD PTR _p$[ebp]
	cmp	DWORD PTR [eax+28], 0
	je	$L688
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	call	_same_codes
	add	esp, 8
	or	eax, eax
	je	$L688
; Line 658
	mov	eax, DWORD PTR _depth$[ebp]
	push	eax
	push	OFFSET $SG689
	call	_printf
	add	esp, 8
; Line 659
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_print_code
	add	esp, 4
; Line 660
	push	OFFSET $SG690
	call	_printf
	add	esp, 4
; Line 661
	cmp	DWORD PTR _afterward$[ebp], 0
	je	$L691
; Line 663
	push	OFFSET $SG692
	call	_printf
	add	esp, 4
; Line 664
	mov	eax, DWORD PTR _afterpos$[ebp]
	push	eax
	mov	eax, DWORD PTR _pos$[ebp]
	push	eax
	call	_change_state
	add	esp, 8
; Line 665
	mov	eax, DWORD PTR _afterward$[ebp]
	push	eax
	push	OFFSET $SG693
	call	_printf
	add	esp, 8
; Line 667
	jmp	$L694
$L691:
; Line 668
	push	OFFSET $SG695
	call	_printf
	add	esp, 4
$L694:
; Line 669
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	call	_clear_codes
	add	esp, 4
; Line 671
$L688:
; Line 675
$L678:
	cmp	DWORD PTR _in_switch$[ebp], 0
	jne	$L696
	mov	eax, DWORD PTR _depth$[ebp]
	mov	ecx, DWORD PTR _pos$[ebp]
	movsx	eax, BYTE PTR [eax+ecx-1]
	cmp	eax, 42					; 0000002aH
	je	$L696
; Line 678
	mov	DWORD PTR _lose$698[ebp], 0
; Line 680
	push	28					; 0000001cH
	lea	eax, DWORD PTR _modemap$[ebp]
	push	eax
	call	_mybzero
	add	esp, 8
; Line 684
	mov	eax, DWORD PTR _p$[ebp]
	mov	DWORD PTR _p1$[ebp], eax
	mov	DWORD PTR _i$697[ebp], 0
	jmp	$L699
$L700:
	mov	eax, DWORD PTR _p1$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR _p1$[ebp], eax
	inc	DWORD PTR _i$697[ebp]
$L699:
	cmp	DWORD PTR _p1$[ebp], 0
	je	$L701
	mov	eax, DWORD PTR _p1$[ebp]
	cmp	DWORD PTR [eax+16], 0
	je	$L701
	mov	eax, DWORD PTR _p1$[ebp]
	cmp	DWORD PTR [eax+20], 0
	je	$L702
	mov	eax, DWORD PTR _p1$[ebp]
	movsx	eax, BYTE PTR [eax+84]
	or	eax, eax
	je	$L701
$L702:
; Line 686
	mov	eax, DWORD PTR _p$[ebp]
	movsx	eax, BYTE PTR [eax+84]
	or	eax, eax
	jne	$L703
	mov	eax, DWORD PTR _p1$[ebp]
	mov	eax, DWORD PTR [eax+16]
	movsx	eax, BYTE PTR _modemap$[ebp+eax]
	or	eax, eax
	je	$L703
; Line 688
	mov	DWORD PTR _lose$698[ebp], 1
; Line 689
	jmp	$L701
; Line 691
$L703:
	mov	eax, DWORD PTR _p1$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	BYTE PTR _modemap$[ebp+eax], 1
; Line 692
	jmp	$L700
$L701:
; Line 693
	cmp	DWORD PTR _lose$698[ebp], 0
	jne	$L704
	cmp	DWORD PTR _i$697[ebp], 4
	jl	$L704
; Line 695
	mov	DWORD PTR _in_switch$[ebp], 2
; Line 696
	mov	eax, DWORD PTR _depth$[ebp]
	push	eax
	push	OFFSET $SG705
	call	_printf
	add	esp, 8
; Line 698
$L704:
; Line 700
$L696:
	cmp	DWORD PTR _in_switch$[ebp], 0
	jne	$L706
; Line 703
	push	91					; 0000005bH
	lea	eax, DWORD PTR _codemap$[ebp]
	push	eax
	call	_mybzero
	add	esp, 8
; Line 704
	mov	eax, DWORD PTR _p$[ebp]
	mov	DWORD PTR _p1$[ebp], eax
	mov	DWORD PTR _i$707[ebp], 0
	jmp	$L708
$L709:
	mov	eax, DWORD PTR _p1$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR _p1$[ebp], eax
	inc	DWORD PTR _i$707[ebp]
$L708:
	cmp	DWORD PTR _p1$[ebp], 0
	je	$L710
	mov	eax, DWORD PTR _p1$[ebp]
	cmp	DWORD PTR [eax+8], 0
	je	$L710
; Line 706
	mov	eax, DWORD PTR _p1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	movsx	eax, BYTE PTR _codemap$[ebp+eax]
	or	eax, eax
	je	$L711
; Line 707
	jmp	$L710
; Line 708
$L711:
	mov	eax, DWORD PTR _p1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	BYTE PTR _codemap$[ebp+eax], 1
; Line 709
	jmp	$L709
$L710:
; Line 710
	cmp	DWORD PTR _p1$[ebp], 0
	je	$L713
	mov	eax, DWORD PTR _p1$[ebp]
	cmp	DWORD PTR [eax+8], 0
	jne	$L712
$L713:
	cmp	DWORD PTR _i$707[ebp], 4
	jl	$L712
; Line 712
	mov	DWORD PTR _in_switch$[ebp], 1
; Line 713
	mov	eax, DWORD PTR _depth$[ebp]
	push	eax
	push	OFFSET $SG714
	call	_printf
	add	esp, 8
; Line 715
$L712:
; Line 717
$L706:
	cmp	DWORD PTR _in_switch$[ebp], 2
	jne	$L715
; Line 719
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	movsx	eax, BYTE PTR _modemap$[ebp+eax]
	or	eax, eax
	je	$L716
; Line 721
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR _mode_name[eax*4]
	push	eax
	push	OFFSET $SG717
	call	_printf
	add	esp, 8
; Line 722
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	BYTE PTR _modemap$[ebp+eax], 0
; Line 724
$L716:
; Line 725
$L715:
	cmp	DWORD PTR _in_switch$[ebp], 1
	jne	$L718
; Line 727
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+8]
	movsx	eax, BYTE PTR _codemap$[ebp+eax]
	or	eax, eax
	je	$L719
; Line 729
	push	OFFSET $SG720
	call	_printf
	add	esp, 4
; Line 730
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_print_code
	add	esp, 4
; Line 731
	push	OFFSET $SG721
	call	_printf
	add	esp, 4
; Line 732
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	BYTE PTR _codemap$[ebp+eax], 0
; Line 734
$L719:
; Line 736
$L718:
	push	OFFSET $SG722
	call	_printf
	add	esp, 4
; Line 737
	mov	eax, DWORD PTR _p$[ebp]
	cmp	DWORD PTR [eax+12], 0
	jne	$L724
	mov	eax, DWORD PTR _p$[ebp]
	cmp	DWORD PTR [eax+8], 0
	je	$L723
	cmp	DWORD PTR _in_switch$[ebp], 1
	je	$L723
$L724:
; Line 739
	mov	eax, DWORD PTR _p$[ebp]
	cmp	DWORD PTR [eax+12], 0
	je	$L725
; Line 740
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+12]
	push	eax
	mov	eax, DWORD PTR _depth$[ebp]
	push	eax
	push	OFFSET $SG726
	call	_printf
	add	esp, 12					; 0000000cH
; Line 741
	jmp	$L727
$L725:
; Line 743
	mov	eax, DWORD PTR _depth$[ebp]
	push	eax
	push	OFFSET $SG728
	call	_printf
	add	esp, 8
; Line 744
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_print_code
	add	esp, 4
; Line 745
$L727:
; Line 746
	push	OFFSET $SG729
	call	_printf
	add	esp, 4
; Line 748
$L723:
	mov	eax, DWORD PTR _p$[ebp]
	cmp	DWORD PTR [eax+16], 0
	je	$L730
	cmp	DWORD PTR _ignmode$[ebp], 0
	jne	$L730
	cmp	DWORD PTR _in_switch$[ebp], 2
	je	$L730
; Line 750
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR _mode_name[eax*4]
	push	eax
	mov	eax, DWORD PTR _depth$[ebp]
	push	eax
	push	OFFSET $SG731
	call	_printf
	add	esp, 12					; 0000000cH
; Line 751
$L730:
	mov	eax, DWORD PTR _p$[ebp]
	cmp	DWORD PTR [eax+48], 0
	je	$L732
; Line 752
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+52]
	push	eax
	mov	eax, DWORD PTR _depth$[ebp]
	push	eax
	push	OFFSET $SG733
	call	_printf
	add	esp, 12					; 0000000cH
; Line 753
$L732:
	mov	eax, DWORD PTR _p$[ebp]
	cmp	DWORD PTR [eax+88], 0
	je	$L734
; Line 754
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+88]
	push	eax
	mov	eax, DWORD PTR _depth$[ebp]
	push	eax
	push	OFFSET $SG735
	call	_printf
	add	esp, 12					; 0000000cH
; Line 755
$L734:
	mov	eax, DWORD PTR _p$[ebp]
	cmp	DWORD PTR [eax+56], 0
	je	$L736
; Line 756
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+60]
	push	eax
	mov	eax, DWORD PTR _depth$[ebp]
	push	eax
	push	OFFSET $SG737
	call	_printf
	add	esp, 12					; 0000000cH
; Line 757
$L736:
	mov	eax, DWORD PTR _p$[ebp]
	cmp	DWORD PTR [eax+40], 0
	jl	$L738
; Line 758
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+40]
	push	eax
	mov	eax, DWORD PTR _depth$[ebp]
	push	eax
	push	OFFSET $SG739
	call	_printf
	add	esp, 12					; 0000000cH
; Line 759
$L738:
	mov	eax, DWORD PTR _p$[ebp]
	cmp	DWORD PTR [eax+20], 0
	je	$L740
; Line 761
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR _mode_name[eax*4]
	push	eax
	mov	eax, DWORD PTR _depth$[ebp]
	push	eax
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	push	OFFSET $SG741
	call	_printf
	add	esp, 16					; 00000010H
; Line 762
	jmp	$L742
$L740:
; Line 763
	push	OFFSET $SG743
	call	_printf
	add	esp, 4
$L742:
; Line 765
	mov	eax, DWORD PTR _p$[ebp]
	cmp	DWORD PTR [eax+36], 0
	jl	$L744
; Line 767
	mov	eax, DWORD PTR _depth$[ebp]
	push	eax
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+36]
	push	eax
	push	OFFSET $SG745
	call	_printf
	add	esp, 12					; 0000000cH
; Line 768
	jmp	$L746
$L744:
; Line 769
	push	OFFSET $SG747
	call	_printf
	add	esp, 4
$L746:
; Line 771
	mov	eax, DWORD PTR _p$[ebp]
	cmp	DWORD PTR [eax+76], 0
	je	$L748
; Line 772
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+76]
	push	eax
	push	OFFSET $SG749
	call	_printf
	add	esp, 8
; Line 774
$L748:
	mov	eax, DWORD PTR _p$[ebp]
	cmp	DWORD PTR [eax+24], 0
	jl	$L750
; Line 775
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	OFFSET $SG751
	call	_printf
	add	esp, 8
; Line 776
	jmp	$L752
$L750:
; Line 777
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+32]
	mov	eax, DWORD PTR [eax]
	push	eax
	push	OFFSET $SG753
	call	_printf
	add	esp, 8
$L752:
; Line 779
	mov	eax, DWORD PTR _p$[ebp]
	cmp	DWORD PTR [eax+36], 0
	jl	$L754
; Line 780
	push	OFFSET $SG755
	call	_printf
	add	esp, 4
; Line 781
	jmp	$L756
$L754:
; Line 782
	push	OFFSET $SG757
	call	_printf
	add	esp, 4
$L756:
; Line 787
	cmp	DWORD PTR _in_switch$[ebp], 1
	jne	$L758
; Line 791
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR _p1$[ebp], eax
	jmp	$L759
$L760:
	mov	eax, DWORD PTR _p1$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR _p1$[ebp], eax
$L759:
	cmp	DWORD PTR _p1$[ebp], 0
	je	$L761
; Line 792
	mov	eax, DWORD PTR _p1$[ebp]
	cmp	DWORD PTR [eax+8], 0
	je	$L763
	mov	eax, DWORD PTR _p1$[ebp]
	mov	ecx, DWORD PTR _p$[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	cmp	DWORD PTR [eax+8], ecx
	jne	$L762
$L763:
; Line 793
	jmp	$L761
; Line 794
$L762:
	jmp	$L760
$L761:
	cmp	DWORD PTR _p1$[ebp], 0
	je	$L765
	mov	eax, DWORD PTR _p1$[ebp]
	cmp	DWORD PTR [eax+8], 0
	jne	$L764
$L765:
; Line 795
	push	OFFSET $SG766
	call	_printf
	add	esp, 4
; Line 796
	jmp	$L767
$L764:
	mov	eax, DWORD PTR _p$[ebp]
	mov	ecx, DWORD PTR _p1$[ebp]
	cmp	DWORD PTR [eax+28], ecx
	je	$L768
; Line 798
	mov	eax, DWORD PTR _p1$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	push	OFFSET $SG769
	call	_printf
	add	esp, 8
; Line 799
	mov	eax, DWORD PTR _p1$[ebp]
	mov	DWORD PTR [eax+72], 1
; Line 801
$L768:
$L767:
; Line 803
$L758:
	cmp	DWORD PTR _in_switch$[ebp], 2
	jne	$L770
; Line 807
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR _p1$[ebp], eax
	jmp	$L771
$L772:
	mov	eax, DWORD PTR _p1$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR _p1$[ebp], eax
$L771:
	cmp	DWORD PTR _p1$[ebp], 0
	je	$L773
; Line 808
	mov	eax, DWORD PTR _p1$[ebp]
	cmp	DWORD PTR [eax+16], 0
	je	$L775
	mov	eax, DWORD PTR _p1$[ebp]
	mov	ecx, DWORD PTR _p$[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	cmp	DWORD PTR [eax+16], ecx
	jne	$L774
$L775:
; Line 809
	jmp	$L773
; Line 810
$L774:
	jmp	$L772
$L773:
	cmp	DWORD PTR _p1$[ebp], 0
	je	$L777
	mov	eax, DWORD PTR _p1$[ebp]
	cmp	DWORD PTR [eax+16], 0
	jne	$L776
$L777:
; Line 811
	push	OFFSET $SG778
	call	_printf
	add	esp, 4
; Line 812
	jmp	$L779
$L776:
	mov	eax, DWORD PTR _p$[ebp]
	mov	ecx, DWORD PTR _p1$[ebp]
	cmp	DWORD PTR [eax+28], ecx
	je	$L780
; Line 814
	mov	eax, DWORD PTR _p1$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	push	OFFSET $SG781
	call	_printf
	add	esp, 8
; Line 815
	mov	eax, DWORD PTR _p1$[ebp]
	mov	DWORD PTR [eax+72], 1
; Line 817
$L780:
$L779:
; Line 818
$L770:
	jmp	$L659
$L660:
; Line 820
	cmp	DWORD PTR _in_switch$[ebp], 0
	je	$L782
; Line 821
	push	OFFSET $SG783
	call	_printf
	add	esp, 4
; Line 823
$L782:
	cmp	DWORD PTR _afterward$[ebp], 0
	je	$L784
; Line 825
	mov	eax, DWORD PTR _afterpos$[ebp]
	push	eax
	mov	eax, DWORD PTR _pos$[ebp]
	push	eax
	call	_change_state
	add	esp, 8
; Line 826
	mov	eax, DWORD PTR _afterward$[ebp]
	push	eax
	push	OFFSET $SG785
	call	_printf
	add	esp, 8
; Line 828
	jmp	$L786
$L784:
; Line 829
	push	OFFSET $SG787
	call	_printf
	add	esp, 4
$L786:
; Line 831
	mov	eax, DWORD PTR _tree$[ebp]
	mov	DWORD PTR _p$[ebp], eax
	jmp	$L788
$L789:
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR _p$[ebp], eax
$L788:
	cmp	DWORD PTR _p$[ebp], 0
	je	$L790
; Line 832
	mov	eax, DWORD PTR _p$[ebp]
	cmp	DWORD PTR [eax+32], 0
	je	$L791
; Line 835
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _pos$[ebp], eax
; Line 839
	mov	eax, DWORD PTR _p$[ebp]
	cmp	DWORD PTR [eax+68], 0
	je	$L938
	mov	eax, DWORD PTR _pos$[ebp]
	mov	DWORD PTR -160+[ebp], eax
	jmp	$L939
$L938:
	mov	eax, DWORD PTR _afterpos$[ebp]
	mov	DWORD PTR -160+[ebp], eax
$L939:
	mov	eax, DWORD PTR _p$[ebp]
	cmp	DWORD PTR [eax+68], 0
	je	$L940
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+68]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR -164+[ebp], eax
	jmp	$L941
$L940:
	mov	eax, DWORD PTR _afterward$[ebp]
	mov	DWORD PTR -164+[ebp], eax
$L941:
	push	0
	mov	eax, DWORD PTR -160+[ebp]
	push	eax
	mov	eax, DWORD PTR -164+[ebp]
	push	eax
	mov	eax, DWORD PTR _pos$[ebp]
	push	eax
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+32]
	push	eax
	call	_write_tree
	add	esp, 20					; 00000014H
; Line 842
$L791:
	jmp	$L789
$L790:
$L637:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_write_tree ENDP
_TEXT	ENDS
EXTRN	_rtx_name:BYTE
EXTRN	__iob:BYTE
EXTRN	__flsbuf:NEAR
_TEXT	SEGMENT
_code$ = 8
_p1$ = -4
_print_code PROC NEAR
; Line 847
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 849
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_name[eax*4]
	mov	DWORD PTR _p1$[ebp], eax
	jmp	$L795
$L796:
	inc	DWORD PTR _p1$[ebp]
$L795:
	mov	eax, DWORD PTR _p1$[ebp]
	movsx	eax, BYTE PTR [eax]
	or	eax, eax
	je	$L797
; Line 851
	mov	eax, DWORD PTR _p1$[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 97					; 00000061H
	jl	$L798
	mov	eax, DWORD PTR _p1$[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 122				; 0000007aH
	jg	$L798
; Line 852
	dec	DWORD PTR __iob+36
	js	$L942
	mov	eax, DWORD PTR _p1$[ebp]
	movsx	eax, BYTE PTR [eax]
	sub	eax, 32					; 00000020H
	mov	ecx, DWORD PTR __iob+32
	mov	BYTE PTR [ecx], al
	inc	DWORD PTR __iob+32
	jmp	$L943
$L942:
	mov	eax, OFFSET __iob
	add	eax, 32					; 00000020H
	push	eax
	mov	eax, DWORD PTR _p1$[ebp]
	movsx	eax, BYTE PTR [eax]
	sub	eax, 32					; 00000020H
	push	eax
	call	__flsbuf
	add	esp, 8
$L943:
; Line 853
	jmp	$L799
$L798:
; Line 854
	dec	DWORD PTR __iob+36
	js	$L944
	mov	eax, DWORD PTR _p1$[ebp]
	mov	al, BYTE PTR [eax]
	mov	ecx, DWORD PTR __iob+32
	mov	BYTE PTR [ecx], al
	inc	DWORD PTR __iob+32
	jmp	$L945
$L944:
	mov	eax, OFFSET __iob
	add	eax, 32					; 00000020H
	push	eax
	mov	eax, DWORD PTR _p1$[ebp]
	movsx	eax, BYTE PTR [eax]
	push	eax
	call	__flsbuf
	add	esp, 8
$L945:
$L799:
; Line 855
	jmp	$L796
$L797:
; Line 856
$L793:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_print_code ENDP
_p$ = 8
_code$ = 12
_same_codes PROC NEAR
; Line 862
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 863
	jmp	$L803
$L804:
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR _p$[ebp], eax
$L803:
	cmp	DWORD PTR _p$[ebp], 0
	je	$L805
; Line 864
	mov	eax, DWORD PTR _p$[ebp]
	mov	ecx, DWORD PTR _code$[ebp]
	cmp	DWORD PTR [eax+8], ecx
	je	$L806
; Line 865
	sub	eax, eax
	jmp	$L802
; Line 867
$L806:
	jmp	$L804
$L805:
	mov	eax, 1
	jmp	$L802
; Line 868
$L802:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_same_codes ENDP
_p$ = 8
_clear_codes PROC NEAR
; Line 873
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 874
	jmp	$L809
$L810:
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR _p$[ebp], eax
$L809:
	cmp	DWORD PTR _p$[ebp], 0
	je	$L811
; Line 875
	mov	eax, DWORD PTR _p$[ebp]
	mov	DWORD PTR [eax+8], 0
	jmp	$L810
$L811:
; Line 876
$L808:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_clear_codes ENDP
_p$ = 8
_mode$ = 12
_same_modes PROC NEAR
; Line 882
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 883
	jmp	$L815
$L816:
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR _p$[ebp], eax
$L815:
	cmp	DWORD PTR _p$[ebp], 0
	je	$L817
; Line 884
	mov	eax, DWORD PTR _p$[ebp]
	mov	ecx, DWORD PTR _mode$[ebp]
	cmp	DWORD PTR [eax+16], ecx
	jne	$L819
	mov	eax, DWORD PTR _p$[ebp]
	cmp	DWORD PTR [eax+20], 0
	je	$L818
$L819:
; Line 885
	sub	eax, eax
	jmp	$L814
; Line 887
$L818:
	jmp	$L816
$L817:
	mov	eax, 1
	jmp	$L814
; Line 888
$L814:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_same_modes ENDP
_p$ = 8
_clear_modes PROC NEAR
; Line 893
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 894
	jmp	$L822
$L823:
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR _p$[ebp], eax
$L822:
	cmp	DWORD PTR _p$[ebp], 0
	je	$L824
; Line 895
	mov	eax, DWORD PTR _p$[ebp]
	mov	DWORD PTR [eax+64], 1
	jmp	$L823
$L824:
; Line 896
$L821:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_clear_modes ENDP
_TEXT	ENDS
EXTRN	_strncmp:NEAR
_DATA	SEGMENT
	ORG $+2
$SG839	DB	'  x%d = recog_addr_dummy;', 0aH, '  XEXP (x%d, 0) = x%d;'
	DB	0aH, 00H
	ORG $+2
$SG842	DB	'  x%d = XVECEXP (x%d, 0, %d);', 0aH, 00H
	ORG $+1
$SG844	DB	'  x%d = XEXP (x%d, %c);', 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_oldpos$ = 8
_newpos$ = 12
_odepth$ = -12
_depth$ = -4
_ndepth$ = -8
_change_state PROC NEAR
; Line 902
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 903
	mov	eax, DWORD PTR _oldpos$[ebp]
	push	eax
	call	_strlen
	add	esp, 4
	mov	DWORD PTR _odepth$[ebp], eax
; Line 904
	mov	eax, DWORD PTR _odepth$[ebp]
	mov	DWORD PTR _depth$[ebp], eax
; Line 905
	mov	eax, DWORD PTR _newpos$[ebp]
	push	eax
	call	_strlen
	add	esp, 4
	mov	DWORD PTR _ndepth$[ebp], eax
; Line 909
$L833:
	mov	eax, DWORD PTR _depth$[ebp]
	push	eax
	mov	eax, DWORD PTR _newpos$[ebp]
	push	eax
	mov	eax, DWORD PTR _oldpos$[ebp]
	push	eax
	call	_strncmp
	add	esp, 12					; 0000000cH
	or	eax, eax
	je	$L834
; Line 910
	dec	DWORD PTR _depth$[ebp]
	jmp	$L833
$L834:
; Line 914
$L836:
	mov	eax, DWORD PTR _depth$[ebp]
	cmp	DWORD PTR _ndepth$[ebp], eax
	jle	$L837
; Line 916
	mov	eax, DWORD PTR _depth$[ebp]
	mov	ecx, DWORD PTR _newpos$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 42					; 0000002aH
	jne	$L838
; Line 918
	mov	eax, DWORD PTR _depth$[ebp]
	push	eax
	mov	eax, DWORD PTR _depth$[ebp]
	inc	eax
	push	eax
	mov	eax, DWORD PTR _depth$[ebp]
	inc	eax
	push	eax
	push	OFFSET $SG839
	call	_printf
	add	esp, 16					; 00000010H
; Line 919
	jmp	$L840
$L838:
	mov	eax, DWORD PTR _depth$[ebp]
	mov	ecx, DWORD PTR _newpos$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 97					; 00000061H
	jl	$L841
	mov	eax, DWORD PTR _depth$[ebp]
	mov	ecx, DWORD PTR _newpos$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 122				; 0000007aH
	jg	$L841
; Line 921
	mov	eax, DWORD PTR _depth$[ebp]
	mov	ecx, DWORD PTR _newpos$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	sub	eax, 97					; 00000061H
	push	eax
	mov	eax, DWORD PTR _depth$[ebp]
	push	eax
	mov	eax, DWORD PTR _depth$[ebp]
	inc	eax
	push	eax
	push	OFFSET $SG842
	call	_printf
	add	esp, 16					; 00000010H
; Line 922
	jmp	$L843
$L841:
; Line 924
	mov	eax, DWORD PTR _depth$[ebp]
	mov	ecx, DWORD PTR _newpos$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	push	eax
	mov	eax, DWORD PTR _depth$[ebp]
	push	eax
	mov	eax, DWORD PTR _depth$[ebp]
	inc	eax
	push	eax
	push	OFFSET $SG844
	call	_printf
	add	esp, 16					; 00000010H
$L843:
$L840:
; Line 925
	inc	DWORD PTR _depth$[ebp]
; Line 926
	jmp	$L836
$L837:
; Line 927
$L827:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_change_state ENDP
_s1$ = 8
_tem$ = -4
_copystr PROC NEAR
; Line 932
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 935
	cmp	DWORD PTR _s1$[ebp], 0
	jne	$L848
; Line 936
	sub	eax, eax
	jmp	$L846
; Line 938
$L848:
	mov	eax, DWORD PTR _s1$[ebp]
	push	eax
	call	_strlen
	add	esp, 4
	inc	eax
	push	eax
	call	_xmalloc
	add	esp, 4
	mov	DWORD PTR _tem$[ebp], eax
; Line 939
	mov	eax, DWORD PTR _s1$[ebp]
	push	eax
	mov	eax, DWORD PTR _tem$[ebp]
	push	eax
	call	_strcpy
	add	esp, 8
; Line 941
	mov	eax, DWORD PTR _tem$[ebp]
	jmp	$L846
; Line 942
$L846:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_copystr ENDP
_b$ = 8
_length$ = 12
_mybzero PROC NEAR
; Line 948
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 949
$L853:
	mov	eax, DWORD PTR _length$[ebp]
	mov	DWORD PTR -4+[ebp], eax
	dec	DWORD PTR _length$[ebp]
	cmp	DWORD PTR -4+[ebp], 0
	jle	$L854
; Line 950
	mov	eax, DWORD PTR _b$[ebp]
	mov	BYTE PTR [eax], 0
	inc	DWORD PTR _b$[ebp]
	jmp	$L853
$L854:
; Line 951
$L851:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_mybzero ENDP
_TEXT	ENDS
PUBLIC	_concat
EXTRN	_strcat:NEAR
_DATA	SEGMENT
	ORG $+3
$SG862	DB	' ', 00H
_DATA	ENDS
_TEXT	SEGMENT
_s1$ = 8
_s2$ = 12
_tem$ = -4
_concat	PROC NEAR
; Line 956
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 959
	cmp	DWORD PTR _s1$[ebp], 0
	jne	$L859
; Line 960
	mov	eax, DWORD PTR _s2$[ebp]
	jmp	$L857
; Line 961
$L859:
	cmp	DWORD PTR _s2$[ebp], 0
	jne	$L860
; Line 962
	mov	eax, DWORD PTR _s1$[ebp]
	jmp	$L857
; Line 964
$L860:
	mov	eax, DWORD PTR _s2$[ebp]
	push	eax
	call	_strlen
	add	esp, 4
	mov	ebx, eax
	mov	eax, DWORD PTR _s1$[ebp]
	push	eax
	call	_strlen
	add	esp, 4
	add	ebx, eax
	add	ebx, 2
	push	ebx
	call	_xmalloc
	add	esp, 4
	mov	DWORD PTR _tem$[ebp], eax
; Line 965
	mov	eax, DWORD PTR _s1$[ebp]
	push	eax
	mov	eax, DWORD PTR _tem$[ebp]
	push	eax
	call	_strcpy
	add	esp, 8
; Line 966
	push	OFFSET $SG862
	mov	eax, DWORD PTR _tem$[ebp]
	push	eax
	call	_strcat
	add	esp, 8
; Line 967
	mov	eax, DWORD PTR _s2$[ebp]
	push	eax
	mov	eax, DWORD PTR _tem$[ebp]
	push	eax
	call	_strcat
	add	esp, 8
; Line 969
	mov	eax, DWORD PTR _tem$[ebp]
	jmp	$L857
; Line 970
$L857:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_concat	ENDP
_TEXT	ENDS
PUBLIC	_xrealloc
EXTRN	_realloc:NEAR
_DATA	SEGMENT
	ORG $+2
$SG870	DB	'virtual memory exhausted', 00H
_DATA	ENDS
_TEXT	SEGMENT
_ptr$ = 8
_size$ = 12
_result$ = -4
_xrealloc PROC NEAR
; Line 976
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 977
	mov	eax, DWORD PTR _size$[ebp]
	push	eax
	mov	eax, DWORD PTR _ptr$[ebp]
	push	eax
	call	_realloc
	add	esp, 8
	mov	DWORD PTR _result$[ebp], eax
; Line 978
	cmp	DWORD PTR _result$[ebp], 0
	jne	$L869
; Line 979
	push	0
	push	0
	push	OFFSET $SG870
	call	_fatal
	add	esp, 12					; 0000000cH
; Line 980
$L869:
	mov	eax, DWORD PTR _result$[ebp]
	jmp	$L866
; Line 981
$L866:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_xrealloc ENDP
_TEXT	ENDS
EXTRN	_malloc:NEAR
_DATA	SEGMENT
	ORG $+3
$SG876	DB	'virtual memory exhausted', 00H
_DATA	ENDS
_TEXT	SEGMENT
_size$ = 8
_val$ = -4
_xmalloc PROC NEAR
; Line 985
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 986
	mov	eax, DWORD PTR _size$[ebp]
	push	eax
	call	_malloc
	add	esp, 4
	mov	DWORD PTR _val$[ebp], eax
; Line 988
	cmp	DWORD PTR _val$[ebp], 0
	jne	$L875
; Line 989
	push	0
	push	0
	push	OFFSET $SG876
	call	_fatal
	add	esp, 12					; 0000000cH
; Line 990
$L875:
	mov	eax, DWORD PTR _val$[ebp]
	jmp	$L872
; Line 991
$L872:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_xmalloc ENDP
_TEXT	ENDS
EXTRN	_fprintf:NEAR
EXTRN	_exit:NEAR
_DATA	SEGMENT
	ORG $+3
$SG881	DB	'genrecog: ', 00H
	ORG $+1
$SG882	DB	0aH, 00H
	ORG $+2
$SG883	DB	'after %d instruction definitions', 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_s$ = 8
_a1$ = 12
_a2$ = 16
_fatal	PROC NEAR
; Line 996
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 997
	push	OFFSET $SG881
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 8
; Line 998
	mov	eax, DWORD PTR _a2$[ebp]
	push	eax
	mov	eax, DWORD PTR _a1$[ebp]
	push	eax
	mov	eax, DWORD PTR _s$[ebp]
	push	eax
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
; Line 999
	push	OFFSET $SG882
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 8
; Line 1001
	mov	eax, DWORD PTR _next_insn_code
	push	eax
	push	OFFSET $SG883
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 1002
	push	33					; 00000021H
	call	_exit
	add	esp, 4
; Line 1003
$L880:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_fatal	ENDP
_TEXT	ENDS
PUBLIC	_fancy_abort
_DATA	SEGMENT
	ORG $+2
$SG886	DB	'Internal gcc abort.', 00H
_DATA	ENDS
_TEXT	SEGMENT
_fancy_abort PROC NEAR
; Line 1010
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1011
	push	0
	push	0
	push	OFFSET $SG886
	call	_fatal
	add	esp, 12					; 0000000cH
; Line 1012
$L885:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_fancy_abort ENDP
_TEXT	ENDS
PUBLIC	_main
EXTRN	__obstack_begin:NEAR
EXTRN	_fopen:NEAR
EXTRN	_init_rtl:NEAR
EXTRN	_read_skip_spaces:NEAR
EXTRN	_free:NEAR
EXTRN	_perror:NEAR
EXTRN	_ungetc:NEAR
EXTRN	_fflush:NEAR
EXTRN	_read_rtx:NEAR
_DATA	SEGMENT
$SG898	DB	'No input file name.', 00H
$SG899	DB	'r', 00H
	ORG $+2
$SG902	DB	'/* Generated automatically by the program `genrecog''', 0aH
	DB	'from the machine description file `md''.  */', 0aH, 0aH, 00H
	ORG $+1
$SG911	DB	'#include "config.h"', 0aH, 00H
	ORG $+3
$SG912	DB	'#include "rtl.h"', 0aH, 00H
	ORG $+2
$SG913	DB	'#include "insn-config.h"', 0aH, 00H
	ORG $+2
$SG914	DB	'#include "recog.h"', 0aH, 00H
$SG915	DB	'#include "real.h"', 0aH, 00H
	ORG $+1
$SG916	DB	0aH, '/* `recog'' contains a decision tree', 0aH, '   tha'
	DB	't recognizes whether the rtx X0 is a valid instruction.', 0aH
	DB	0aH, '   recog returns -1 if the rtx is not valid.', 0aH, '   '
	DB	'If the rtx is valid, recog returns a nonnegative number', 0aH
	DB	'   which is the insn code number for the pattern that matched'
	DB	'.', 0aH, 00H
$SG917	DB	'   This is the same as the order in the machine descript'
	DB	'ion of', 0aH, '   the entry that matched.  This number can be'
	DB	' used as an index into', 0aH, '   insn_templates and insn_n_o'
	DB	'perands (found in insn-output.c)', 0aH, '   or as an argument'
	DB	' to output_insn_hairy (also in insn-output.c).  */', 0aH, 0aH
	DB	00H
$SG918	DB	'rtx recog_operand[MAX_RECOG_OPERANDS];', 0aH, 0aH, 00H
	ORG $+3
$SG919	DB	'rtx *recog_operand_loc[MAX_RECOG_OPERANDS];', 0aH, 0aH, 00H
	ORG $+2
$SG920	DB	'rtx *recog_dup_loc[MAX_DUP_OPERANDS];', 0aH, 0aH, 00H
$SG921	DB	'char recog_dup_num[MAX_DUP_OPERANDS];', 0aH, 0aH, 00H
$SG922	DB	'extern rtx recog_addr_dummy;', 0aH, 0aH, 00H
	ORG $+1
$SG923	DB	'#define operands recog_operand', 0aH, 0aH, 00H
	ORG $+3
$SG924	DB	'int', 0aH, 'recog (x0, insn)', 0aH, '     register rtx x'
	DB	'0;', 0aH, '     rtx insn;', 0aH, '{', 0aH, 00H
	ORG $+3
$SG925	DB	'  register rtx x1, x2, x3, x4, x5;', 0aH, '  rtx x6, x7,'
	DB	' x8, x9, x10, x11;', 0aH, 00H
$SG926	DB	'  int tem;', 0aH, 00H
$SG927	DB	00H
	ORG $+3
$SG928	DB	00H
	ORG $+3
$SG929	DB	' ret0: return -1;', 0aH, '}', 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_argc$ = 8
_argv$ = 12
_desc$ = -4
_tree$ = -16
_infile$ = -12
_c$ = -8
_main	PROC NEAR
; Line 1018
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 1020
	mov	DWORD PTR _tree$[ebp], 0
; Line 1025
	push	OFFSET _free
	push	OFFSET _xmalloc
	push	0
	push	0
	mov	eax, DWORD PTR _rtl_obstack
	push	eax
	call	__obstack_begin
	add	esp, 20					; 00000014H
; Line 1027
	cmp	DWORD PTR _argc$[ebp], 1
	jg	$L897
; Line 1028
	push	0
	push	0
	push	OFFSET $SG898
	call	_fatal
	add	esp, 12					; 0000000cH
; Line 1030
$L897:
	push	OFFSET $SG899
	mov	eax, DWORD PTR _argv$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_fopen
	add	esp, 8
	mov	DWORD PTR _infile$[ebp], eax
; Line 1031
	cmp	DWORD PTR _infile$[ebp], 0
	jne	$L900
; Line 1033
	mov	eax, DWORD PTR _argv$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_perror
	add	esp, 4
; Line 1034
	push	33					; 00000021H
	call	_exit
	add	esp, 4
; Line 1037
$L900:
	call	_init_rtl
; Line 1038
	mov	DWORD PTR _next_insn_code, 0
; Line 1041
	push	OFFSET $SG902
	call	_printf
	add	esp, 4
; Line 1045
$L904:
; Line 1047
	mov	eax, DWORD PTR _infile$[ebp]
	push	eax
	call	_read_skip_spaces
	add	esp, 4
	mov	DWORD PTR _c$[ebp], eax
; Line 1048
	cmp	DWORD PTR _c$[ebp], -1
	jne	$L907
; Line 1049
	jmp	$L905
; Line 1050
$L907:
	mov	eax, DWORD PTR _infile$[ebp]
	push	eax
	mov	eax, DWORD PTR _c$[ebp]
	push	eax
	call	_ungetc
	add	esp, 8
; Line 1052
	mov	eax, DWORD PTR _infile$[ebp]
	push	eax
	call	_read_rtx
	add	esp, 4
	mov	DWORD PTR _desc$[ebp], eax
; Line 1053
	mov	eax, DWORD PTR _desc$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 458752				; 00070000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L908
; Line 1054
	mov	eax, DWORD PTR _desc$[ebp]
	push	eax
	call	_make_insn_sequence
	add	esp, 4
	push	eax
	mov	eax, DWORD PTR _tree$[ebp]
	push	eax
	call	_merge_trees
	add	esp, 8
	mov	DWORD PTR _tree$[ebp], eax
; Line 1055
$L908:
; Line 1056
	mov	eax, DWORD PTR _desc$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 524288				; 00080000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L910
	mov	eax, DWORD PTR _desc$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 655360				; 000a0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L909
$L910:
; Line 1057
	inc	DWORD PTR _next_insn_code
; Line 1058
$L909:
	jmp	$L904
$L905:
; Line 1060
	push	OFFSET $SG911
	call	_printf
	add	esp, 4
; Line 1061
	push	OFFSET $SG912
	call	_printf
	add	esp, 4
; Line 1062
	push	OFFSET $SG913
	call	_printf
	add	esp, 4
; Line 1063
	push	OFFSET $SG914
	call	_printf
	add	esp, 4
; Line 1064
	push	OFFSET $SG915
	call	_printf
	add	esp, 4
; Line 1071
	push	OFFSET $SG916
	call	_printf
	add	esp, 4
; Line 1075
	push	OFFSET $SG917
	call	_printf
	add	esp, 4
; Line 1077
	push	OFFSET $SG918
	call	_printf
	add	esp, 4
; Line 1078
	push	OFFSET $SG919
	call	_printf
	add	esp, 4
; Line 1079
	push	OFFSET $SG920
	call	_printf
	add	esp, 4
; Line 1080
	push	OFFSET $SG921
	call	_printf
	add	esp, 4
; Line 1081
	push	OFFSET $SG922
	call	_printf
	add	esp, 4
; Line 1082
	push	OFFSET $SG923
	call	_printf
	add	esp, 4
; Line 1084
	mov	eax, DWORD PTR _tree$[ebp]
	push	eax
	call	_break_out_subroutines
	add	esp, 4
; Line 1086
	push	OFFSET $SG924
	call	_printf
	add	esp, 4
; Line 1087
	push	OFFSET $SG925
	call	_printf
	add	esp, 4
; Line 1088
	push	OFFSET $SG926
	call	_printf
	add	esp, 4
; Line 1090
	push	1
	push	OFFSET $SG927
	push	0
	push	OFFSET $SG928
	mov	eax, DWORD PTR _tree$[ebp]
	push	eax
	call	_write_tree
	add	esp, 20					; 00000014H
; Line 1091
	push	OFFSET $SG929
	call	_printf
	add	esp, 4
; Line 1093
	mov	eax, OFFSET __iob
	add	eax, 32					; 00000020H
	push	eax
	call	_fflush
	add	esp, 4
; Line 1094
	mov	eax, DWORD PTR __iob+44
	and	eax, 32					; 00000020H
	cmp	eax, 1
	cmc
	sbb	eax, eax
	and	eax, 33					; 00000021H
	push	eax
	call	_exit
	add	esp, 4
; Line 1095
$L890:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_main	ENDP
_TEXT	ENDS
END
