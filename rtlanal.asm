	TITLE	rtlanal.c
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
COMM	_rtx_equal_function_value_matters:DWORD
_DATA	ENDS
PUBLIC	_rtx_unstable_p
EXTRN	_rtx_length:BYTE
EXTRN	_rtx_format:BYTE
_TEXT	SEGMENT
; File rtlanal.c
_x$ = 8
_code$ = -8
_i$ = -4
_fmt$ = -12
_rtx_unstable_p PROC NEAR
; Line 35
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 36
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$[ebp], eax
; Line 40
	cmp	DWORD PTR _code$[ebp], 37		; 00000025H
	jne	$L353
; Line 41
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shr	eax, 26					; 0000001aH
	and	eax, 1
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	jmp	$L349
; Line 43
$L353:
	cmp	DWORD PTR _code$[ebp], 41		; 00000029H
	jne	$L354
; Line 44
	mov	eax, 1
	jmp	$L349
; Line 46
$L354:
	cmp	DWORD PTR _code$[ebp], 32		; 00000020H
	je	$L356
	cmp	DWORD PTR _code$[ebp], 30		; 0000001eH
	jne	$L355
$L356:
; Line 47
	sub	eax, eax
	jmp	$L349
; Line 49
$L355:
	cmp	DWORD PTR _code$[ebp], 34		; 00000022H
	jne	$L357
; Line 52
	mov	eax, DWORD PTR _x$[ebp]
	cmp	DWORD PTR [eax+4], 6
	je	$L660
	mov	eax, DWORD PTR _x$[ebp]
	cmp	DWORD PTR [eax+4], 6
	je	$L660
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shr	eax, 26					; 0000001aH
	test	al, 1
	jne	$L660
	mov	eax, 1
	jmp	$L661
$L660:
	sub	eax, eax
$L661:
	jmp	$L349
; Line 54
$L357:
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_format[eax*4]
	mov	DWORD PTR _fmt$[ebp], eax
; Line 55
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_length[eax*4]
	dec	eax
	mov	DWORD PTR _i$[ebp], eax
	jmp	$L358
$L359:
	dec	DWORD PTR _i$[ebp]
$L358:
	cmp	DWORD PTR _i$[ebp], 0
	jl	$L360
; Line 56
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 101				; 00000065H
	jne	$L361
; Line 57
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	push	eax
	call	_rtx_unstable_p
	add	esp, 4
	or	eax, eax
	je	$L362
; Line 58
	mov	eax, 1
	jmp	$L349
; Line 59
$L362:
$L361:
	jmp	$L359
$L360:
	sub	eax, eax
	jmp	$L349
; Line 60
$L349:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_rtx_unstable_p ENDP
_TEXT	ENDS
PUBLIC	_rtx_varies_p
_TEXT	SEGMENT
_x$ = 8
_code$ = -8
_i$ = -4
_fmt$ = -12
_rtx_varies_p PROC NEAR
; Line 70
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 71
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$[ebp], eax
; Line 75
	cmp	DWORD PTR _code$[ebp], 37		; 00000025H
	jne	$L369
; Line 76
	mov	eax, 1
	jmp	$L365
; Line 78
$L369:
	cmp	DWORD PTR _code$[ebp], 41		; 00000029H
	jne	$L370
; Line 79
	mov	eax, 1
	jmp	$L365
; Line 81
$L370:
	cmp	DWORD PTR _code$[ebp], 32		; 00000020H
	je	$L372
	cmp	DWORD PTR _code$[ebp], 30		; 0000001eH
	jne	$L371
$L372:
; Line 82
	sub	eax, eax
	jmp	$L365
; Line 84
$L371:
	cmp	DWORD PTR _code$[ebp], 34		; 00000022H
	jne	$L373
; Line 86
	mov	eax, DWORD PTR _x$[ebp]
	cmp	DWORD PTR [eax+4], 6
	je	$L662
	mov	eax, DWORD PTR _x$[ebp]
	cmp	DWORD PTR [eax+4], 6
	je	$L662
	mov	eax, 1
	jmp	$L663
$L662:
	sub	eax, eax
$L663:
	jmp	$L365
; Line 88
$L373:
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_format[eax*4]
	mov	DWORD PTR _fmt$[ebp], eax
; Line 89
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_length[eax*4]
	dec	eax
	mov	DWORD PTR _i$[ebp], eax
	jmp	$L374
$L375:
	dec	DWORD PTR _i$[ebp]
$L374:
	cmp	DWORD PTR _i$[ebp], 0
	jl	$L376
; Line 90
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 101				; 00000065H
	jne	$L377
; Line 91
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	push	eax
	call	_rtx_varies_p
	add	esp, 4
	or	eax, eax
	je	$L378
; Line 92
	mov	eax, 1
	jmp	$L365
; Line 93
$L378:
$L377:
	jmp	$L375
$L376:
	sub	eax, eax
	jmp	$L365
; Line 94
$L365:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_rtx_varies_p ENDP
_TEXT	ENDS
PUBLIC	_rtx_addr_varies_p
_TEXT	SEGMENT
_fmt$ = -12
_x$ = 8
_code$ = -8
_i$ = -4
_rtx_addr_varies_p PROC NEAR
; Line 103
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 108
	cmp	DWORD PTR _x$[ebp], 0
	jne	$L385
; Line 109
	sub	eax, eax
	jmp	$L381
; Line 111
$L385:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$[ebp], eax
; Line 112
	cmp	DWORD PTR _code$[ebp], 37		; 00000025H
	jne	$L386
; Line 113
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 436207616				; 1a000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L666
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_rtx_varies_p
	add	esp, 4
	or	eax, eax
	je	$L664
$L666:
	mov	eax, 1
	jmp	$L665
$L664:
	sub	eax, eax
$L665:
	jmp	$L381
; Line 115
$L386:
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_format[eax*4]
	mov	DWORD PTR _fmt$[ebp], eax
; Line 116
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_length[eax*4]
	dec	eax
	mov	DWORD PTR _i$[ebp], eax
	jmp	$L387
$L388:
	dec	DWORD PTR _i$[ebp]
$L387:
	cmp	DWORD PTR _i$[ebp], 0
	jl	$L389
; Line 117
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 101				; 00000065H
	jne	$L390
; Line 118
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	push	eax
	call	_rtx_addr_varies_p
	add	esp, 4
	or	eax, eax
	je	$L391
; Line 119
	mov	eax, 1
	jmp	$L381
; Line 120
$L391:
$L390:
	jmp	$L388
$L389:
	sub	eax, eax
	jmp	$L381
; Line 121
$L381:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_rtx_addr_varies_p ENDP
_TEXT	ENDS
PUBLIC	_reg_mentioned_p
PUBLIC	_rtx_equal_p
_TEXT	SEGMENT
_reg$ = 8
_in$ = 12
_fmt$ = -12
_i$ = -8
_code$ = -4
_j$414 = -16
_reg_mentioned_p PROC NEAR
; Line 130
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	push	ebx
	push	esi
	push	edi
; Line 135
	cmp	DWORD PTR _in$[ebp], 0
	jne	$L399
; Line 136
	sub	eax, eax
	jmp	$L395
; Line 138
$L399:
	mov	eax, DWORD PTR _reg$[ebp]
	cmp	DWORD PTR _in$[ebp], eax
	jne	$L400
; Line 139
	mov	eax, 1
	jmp	$L395
; Line 141
$L400:
	mov	eax, DWORD PTR _in$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$[ebp], eax
; Line 143
	mov	eax, DWORD PTR _code$[ebp]
	mov	DWORD PTR -20+[ebp], eax
	jmp	$L401
; Line 146
$L405:
; Line 147
	mov	eax, DWORD PTR _reg$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L667
	mov	eax, DWORD PTR _in$[ebp]
	mov	ecx, DWORD PTR _reg$[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L667
	mov	eax, 1
	jmp	$L668
$L667:
	sub	eax, eax
$L668:
	jmp	$L395
; Line 151
$L406:
; Line 153
	sub	eax, eax
	jmp	$L395
; Line 155
$L407:
; Line 156
	mov	eax, DWORD PTR _reg$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L669
	mov	eax, DWORD PTR _in$[ebp]
	mov	ecx, DWORD PTR _reg$[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L669
	mov	eax, 1
	jmp	$L670
$L669:
	sub	eax, eax
$L670:
	jmp	$L395
; Line 157
	jmp	$L402
$L401:
	cmp	DWORD PTR -20+[ebp], 30			; 0000001eH
	je	$L407
	cmp	DWORD PTR -20+[ebp], 33			; 00000021H
	je	$L406
	cmp	DWORD PTR -20+[ebp], 34			; 00000022H
	je	$L405
	cmp	DWORD PTR -20+[ebp], 40			; 00000028H
	je	$L406
	jmp	$L402
$L402:
; Line 159
	mov	eax, DWORD PTR _reg$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	cmp	eax, DWORD PTR _code$[ebp]
	jne	$L409
	mov	eax, DWORD PTR _in$[ebp]
	push	eax
	mov	eax, DWORD PTR _reg$[ebp]
	push	eax
	call	_rtx_equal_p
	add	esp, 8
	or	eax, eax
	je	$L409
; Line 160
	mov	eax, 1
	jmp	$L395
; Line 162
$L409:
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_format[eax*4]
	mov	DWORD PTR _fmt$[ebp], eax
; Line 164
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_length[eax*4]
	dec	eax
	mov	DWORD PTR _i$[ebp], eax
	jmp	$L410
$L411:
	dec	DWORD PTR _i$[ebp]
$L410:
	cmp	DWORD PTR _i$[ebp], 0
	jl	$L412
; Line 166
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 69					; 00000045H
	jne	$L413
; Line 169
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _in$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	eax, DWORD PTR [eax]
	dec	eax
	mov	DWORD PTR _j$414[ebp], eax
	jmp	$L415
$L416:
	dec	DWORD PTR _j$414[ebp]
$L415:
	cmp	DWORD PTR _j$414[ebp], 0
	jl	$L417
; Line 170
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _in$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$414[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	push	eax
	mov	eax, DWORD PTR _reg$[ebp]
	push	eax
	call	_reg_mentioned_p
	add	esp, 8
	or	eax, eax
	je	$L418
; Line 171
	mov	eax, 1
	jmp	$L395
; Line 172
$L418:
	jmp	$L416
$L417:
; Line 173
	jmp	$L419
$L413:
; Line 174
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 101				; 00000065H
	jne	$L420
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _in$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	push	eax
	mov	eax, DWORD PTR _reg$[ebp]
	push	eax
	call	_reg_mentioned_p
	add	esp, 8
	or	eax, eax
	je	$L420
; Line 175
	mov	eax, 1
	jmp	$L395
; Line 176
$L420:
$L419:
	jmp	$L411
$L412:
; Line 177
	sub	eax, eax
	jmp	$L395
; Line 178
$L395:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_reg_mentioned_p ENDP
_TEXT	ENDS
PUBLIC	_reg_used_between_p
_TEXT	SEGMENT
_reg$ = 8
_from_insn$ = 12
_to_insn$ = 16
_insn$ = -8
_code$ = -4
_reg_used_between_p PROC NEAR
; Line 186
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 189
	mov	eax, DWORD PTR _from_insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _insn$[ebp], eax
	jmp	$L428
$L429:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _insn$[ebp], eax
$L428:
	mov	eax, DWORD PTR _insn$[ebp]
	cmp	DWORD PTR _to_insn$[ebp], eax
	je	$L430
; Line 192
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$[ebp], eax
	cmp	DWORD PTR _code$[ebp], 13		; 0000000dH
	je	$L432
	cmp	DWORD PTR _code$[ebp], 14		; 0000000eH
	je	$L432
	cmp	DWORD PTR _code$[ebp], 15		; 0000000fH
	jne	$L431
$L432:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	mov	eax, DWORD PTR _reg$[ebp]
	push	eax
	call	_reg_mentioned_p
	add	esp, 8
	or	eax, eax
	je	$L431
; Line 193
	mov	eax, 1
	jmp	$L425
; Line 194
$L431:
	jmp	$L429
$L430:
	sub	eax, eax
	jmp	$L425
; Line 195
$L425:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_reg_used_between_p ENDP
_TEXT	ENDS
PUBLIC	_reg_set_between_p
_TEXT	SEGMENT
_reg$ = 8
_from_insn$ = 12
_to_insn$ = 16
_insn$ = -8
_code$ = -4
_reg_set_between_p PROC NEAR
; Line 204
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 207
	mov	eax, DWORD PTR _from_insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _insn$[ebp], eax
	jmp	$L440
$L441:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _insn$[ebp], eax
$L440:
	mov	eax, DWORD PTR _to_insn$[ebp]
	cmp	DWORD PTR _insn$[ebp], eax
	je	$L442
; Line 210
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$[ebp], eax
	cmp	DWORD PTR _code$[ebp], 13		; 0000000dH
	je	$L444
	cmp	DWORD PTR _code$[ebp], 14		; 0000000eH
	je	$L444
	cmp	DWORD PTR _code$[ebp], 15		; 0000000fH
	jne	$L443
$L444:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	mov	eax, DWORD PTR _reg$[ebp]
	push	eax
	call	_reg_set_p
	add	esp, 8
	or	eax, eax
	je	$L443
; Line 211
	mov	eax, 1
	jmp	$L437
; Line 212
$L443:
	jmp	$L441
$L442:
	sub	eax, eax
	jmp	$L437
; Line 213
$L437:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_reg_set_between_p ENDP
_TEXT	ENDS
PUBLIC	_reg_overlap_mentioned_p
_BSS	SEGMENT
_reg_set_reg$S445 DD 01H DUP (?)
_reg_set_flag$S446 DD 01H DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
_x$ = 8
_reg_set_p_1 PROC NEAR
; Line 223
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 224
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	mov	eax, DWORD PTR _reg_set_reg$S445
	push	eax
	call	_reg_overlap_mentioned_p
	add	esp, 8
	or	eax, eax
	je	$L451
; Line 225
	mov	DWORD PTR _reg_set_flag$S446, 1
; Line 226
$L451:
$L449:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_reg_set_p_1 ENDP
_TEXT	ENDS
PUBLIC	_note_stores
_TEXT	SEGMENT
_reg$ = 8
_insn$ = 12
_reg_set_p PROC NEAR
; Line 231
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 232
	mov	eax, DWORD PTR _reg$[ebp]
	mov	DWORD PTR _reg_set_reg$S445, eax
; Line 233
	mov	DWORD PTR _reg_set_flag$S446, 0
; Line 234
	push	OFFSET _reg_set_p_1
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_note_stores
	add	esp, 8
; Line 235
	mov	eax, DWORD PTR _reg_set_flag$S446
	jmp	$L454
; Line 236
$L454:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_reg_set_p ENDP
_TEXT	ENDS
PUBLIC	_refers_to_regno_p
EXTRN	_mode_size:BYTE
_TEXT	SEGMENT
_regno$ = 8
_endregno$ = 12
_x$ = 16
_loc$ = 20
_i$ = -8
_code$ = -4
_fmt$ = -12
_j$480 = -16
_refers_to_regno_p PROC NEAR
; Line 250
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	push	ebx
	push	esi
	push	edi
; Line 255
$repeat$464:
; Line 256
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$[ebp], eax
; Line 257
	cmp	DWORD PTR _code$[ebp], 34		; 00000022H
	jne	$L465
; Line 259
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _i$[ebp], eax
; Line 260
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _endregno$[ebp], eax
	jle	$L671
	cmp	DWORD PTR _i$[ebp], 8
	jl	$L673
	mov	DWORD PTR -20+[ebp], 1
	jmp	$L674
$L673:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	add	eax, 3
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	mov	DWORD PTR -20+[ebp], eax
$L674:
	mov	eax, DWORD PTR -20+[ebp]
	add	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _regno$[ebp]
	jle	$L671
	mov	eax, 1
	jmp	$L672
$L671:
	sub	eax, eax
$L672:
	jmp	$L460
; Line 263
$L465:
	cmp	DWORD PTR _code$[ebp], 25		; 00000019H
	jne	$L466
; Line 267
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L467
	mov	eax, DWORD PTR _loc$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _endregno$[ebp]
	push	eax
	mov	eax, DWORD PTR _regno$[ebp]
	push	eax
	call	_refers_to_regno_p
	add	esp, 16					; 00000010H
	or	eax, eax
	je	$L467
; Line 268
	mov	eax, 1
	jmp	$L460
; Line 269
$L467:
	mov	eax, DWORD PTR _x$[ebp]
	add	eax, 8
	cmp	eax, DWORD PTR _loc$[ebp]
	jne	$L468
; Line 270
	sub	eax, eax
	jmp	$L460
; Line 271
$L468:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x$[ebp], eax
; Line 272
	jmp	$repeat$464
; Line 275
$L466:
	cmp	DWORD PTR _code$[ebp], 27		; 0000001bH
	jne	$L469
; Line 278
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L470
	mov	eax, DWORD PTR _loc$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _endregno$[ebp]
	push	eax
	mov	eax, DWORD PTR _regno$[ebp]
	push	eax
	call	_refers_to_regno_p
	add	esp, 16					; 00000010H
	or	eax, eax
	je	$L470
; Line 279
	mov	eax, 1
	jmp	$L460
; Line 280
$L470:
	sub	eax, eax
	jmp	$L460
; Line 285
$L469:
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_format[eax*4]
	mov	DWORD PTR _fmt$[ebp], eax
; Line 286
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_length[eax*4]
	dec	eax
	mov	DWORD PTR _i$[ebp], eax
	jmp	$L471
$L472:
	dec	DWORD PTR _i$[ebp]
$L471:
	cmp	DWORD PTR _i$[ebp], 0
	jl	$L473
; Line 288
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 101				; 00000065H
	jne	$L474
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 2
	add	eax, DWORD PTR _x$[ebp]
	add	eax, 4
	cmp	eax, DWORD PTR _loc$[ebp]
	je	$L474
; Line 290
	cmp	DWORD PTR _i$[ebp], 0
	jne	$L475
; Line 292
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x$[ebp], eax
; Line 293
	jmp	$repeat$464
; Line 295
	jmp	$L476
$L475:
; Line 296
	mov	eax, DWORD PTR _loc$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	push	eax
	mov	eax, DWORD PTR _endregno$[ebp]
	push	eax
	mov	eax, DWORD PTR _regno$[ebp]
	push	eax
	call	_refers_to_regno_p
	add	esp, 16					; 00000010H
	or	eax, eax
	je	$L477
; Line 297
	mov	eax, 1
	jmp	$L460
; Line 298
$L477:
$L476:
; Line 299
	jmp	$L478
$L474:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 69					; 00000045H
	jne	$L479
; Line 302
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	eax, DWORD PTR [eax]
	dec	eax
	mov	DWORD PTR _j$480[ebp], eax
	jmp	$L481
$L482:
	dec	DWORD PTR _j$480[ebp]
$L481:
	cmp	DWORD PTR _j$480[ebp], 0
	jl	$L483
; Line 304
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$480[ebp]
	lea	eax, DWORD PTR [eax+ecx*4]
	add	eax, 4
	cmp	eax, DWORD PTR _loc$[ebp]
	je	$L484
	mov	eax, DWORD PTR _loc$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$480[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	push	eax
	mov	eax, DWORD PTR _endregno$[ebp]
	push	eax
	mov	eax, DWORD PTR _regno$[ebp]
	push	eax
	call	_refers_to_regno_p
	add	esp, 16					; 00000010H
	or	eax, eax
	je	$L484
; Line 305
	mov	eax, 1
	jmp	$L460
; Line 306
$L484:
	jmp	$L482
$L483:
; Line 307
$L479:
$L478:
	jmp	$L472
$L473:
; Line 308
	sub	eax, eax
	jmp	$L460
; Line 309
$L460:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_refers_to_regno_p ENDP
_reg$ = 8
_x$ = 12
_regno$ = -4
_endregno$ = -8
_reg_overlap_mentioned_p PROC NEAR
; Line 316
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 317
	mov	eax, DWORD PTR _reg$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _regno$[ebp], eax
; Line 318
	cmp	DWORD PTR _regno$[ebp], 8
	jl	$L675
	mov	DWORD PTR -12+[ebp], 1
	jmp	$L676
$L675:
	mov	eax, DWORD PTR _reg$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	add	eax, 3
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	mov	DWORD PTR -12+[ebp], eax
$L676:
	mov	eax, DWORD PTR _regno$[ebp]
	add	eax, DWORD PTR -12+[ebp]
	mov	DWORD PTR _endregno$[ebp], eax
; Line 319
	push	0
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	mov	eax, DWORD PTR _endregno$[ebp]
	push	eax
	mov	eax, DWORD PTR _regno$[ebp]
	push	eax
	call	_refers_to_regno_p
	add	esp, 16					; 00000010H
	jmp	$L487
; Line 320
$L487:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_reg_overlap_mentioned_p ENDP
_TEXT	ENDS
EXTRN	_strcmp:NEAR
EXTRN	_abort:NEAR
_TEXT	SEGMENT
_x$ = 8
_y$ = 12
_i$ = -8
_j$ = -16
_code$ = -4
_fmt$ = -12
_rtx_equal_p PROC NEAR
; Line 331
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	push	ebx
	push	esi
	push	edi
; Line 337
	mov	eax, DWORD PTR _x$[ebp]
	cmp	DWORD PTR _y$[ebp], eax
	jne	$L498
; Line 338
	mov	eax, 1
	jmp	$L493
; Line 339
$L498:
	cmp	DWORD PTR _x$[ebp], 0
	je	$L500
	cmp	DWORD PTR _y$[ebp], 0
	jne	$L499
$L500:
; Line 340
	sub	eax, eax
	jmp	$L493
; Line 342
$L499:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$[ebp], eax
; Line 344
	mov	eax, DWORD PTR _y$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	cmp	eax, DWORD PTR _code$[ebp]
	je	$L501
; Line 345
	sub	eax, eax
	jmp	$L493
; Line 350
$L501:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, DWORD PTR _y$[ebp]
	mov	ecx, DWORD PTR [ecx]
	shl	ecx, 8
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L502
; Line 351
	sub	eax, eax
	jmp	$L493
; Line 359
$L502:
	cmp	DWORD PTR _code$[ebp], 34		; 00000022H
	jne	$L503
; Line 362
	mov	eax, DWORD PTR _y$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L677
	cmp	DWORD PTR _rtx_equal_function_value_matters, 0
	je	$L679
	sub	eax, eax
	mov	ecx, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR [ecx]
	shr	ecx, 30					; 0000001eH
	mov	edx, DWORD PTR _y$[ebp]
	mov	edx, DWORD PTR [edx]
	shr	edx, 30					; 0000001eH
	and	edx, 1
	xor	ecx, edx
	and	ecx, 1
	cmp	eax, ecx
	jne	$L677
$L679:
	mov	eax, 1
	jmp	$L678
$L677:
	sub	eax, eax
$L678:
	jmp	$L493
; Line 363
$L503:
	cmp	DWORD PTR _code$[ebp], 38		; 00000026H
	jne	$L504
; Line 364
	mov	eax, DWORD PTR _y$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _x$[ebp]
	sub	eax, DWORD PTR [ecx+4]
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	jmp	$L493
; Line 365
$L504:
	cmp	DWORD PTR _code$[ebp], 39		; 00000027H
	jne	$L505
; Line 366
	mov	eax, DWORD PTR _y$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _x$[ebp]
	sub	eax, DWORD PTR [ecx+4]
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	jmp	$L493
; Line 371
$L505:
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_format[eax*4]
	mov	DWORD PTR _fmt$[ebp], eax
; Line 372
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_length[eax*4]
	dec	eax
	mov	DWORD PTR _i$[ebp], eax
	jmp	$L506
$L507:
	dec	DWORD PTR _i$[ebp]
$L506:
	cmp	DWORD PTR _i$[ebp], 0
	jl	$L508
; Line 374
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	mov	DWORD PTR -20+[ebp], eax
	jmp	$L509
; Line 376
$L513:
; Line 377
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _y$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	mov	ebx, DWORD PTR _x$[ebp]
	mov	edx, DWORD PTR [ebx+edx*4+4]
	cmp	DWORD PTR [ecx+eax*4+4], edx
	je	$L514
; Line 378
	sub	eax, eax
	jmp	$L493
; Line 379
$L514:
	jmp	$L510
; Line 381
$L515:
; Line 383
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _y$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR [edx+ecx*4+4]
	mov	ecx, DWORD PTR [ecx]
	cmp	DWORD PTR [eax], ecx
	je	$L516
; Line 384
	sub	eax, eax
	jmp	$L493
; Line 387
$L516:
	mov	DWORD PTR _j$[ebp], 0
	jmp	$L517
$L518:
	inc	DWORD PTR _j$[ebp]
$L517:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$[ebp]
	cmp	DWORD PTR [eax], ecx
	jbe	$L519
; Line 388
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _y$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	push	eax
	call	_rtx_equal_p
	add	esp, 8
	or	eax, eax
	jne	$L520
; Line 389
	sub	eax, eax
	jmp	$L493
; Line 390
$L520:
	jmp	$L518
$L519:
	jmp	$L510
; Line 392
$L521:
; Line 393
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _y$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	push	eax
	call	_rtx_equal_p
	add	esp, 8
	or	eax, eax
	jne	$L522
; Line 394
	sub	eax, eax
	jmp	$L493
; Line 395
$L522:
	jmp	$L510
; Line 397
$L523:
; Line 398
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _y$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	je	$L525
; Line 399
	sub	eax, eax
	jmp	$L493
; Line 400
$L525:
	jmp	$L510
; Line 402
$L526:
; Line 404
	jmp	$L510
; Line 406
$L527:
; Line 407
	jmp	$L510
; Line 412
$L528:
; Line 413
	call	_abort
; Line 414
	jmp	$L510
$L509:
	cmp	DWORD PTR -20+[ebp], 105		; 00000069H
	jg	$L680
	je	$L513
	cmp	DWORD PTR -20+[ebp], 48			; 00000030H
	je	$L510
	cmp	DWORD PTR -20+[ebp], 69			; 00000045H
	je	$L515
	cmp	DWORD PTR -20+[ebp], 101		; 00000065H
	je	$L521
	jmp	$L528
$L680:
	cmp	DWORD PTR -20+[ebp], 115		; 00000073H
	je	$L523
	cmp	DWORD PTR -20+[ebp], 117		; 00000075H
	je	$L510
	jmp	$L528
$L510:
; Line 415
	jmp	$L507
$L508:
; Line 416
	mov	eax, 1
	jmp	$L493
; Line 417
$L493:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_rtx_equal_p ENDP
_x$ = 8
_fun$ = 12
_dest$535 = -4
_i$542 = -8
_y$546 = -12
_dest$549 = -16
_note_stores PROC NEAR
; Line 429
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 430
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L534
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1769472				; 001b0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L533
$L534:
; Line 432
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _dest$535[ebp], eax
; Line 436
$L537:
	mov	eax, DWORD PTR _dest$535[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L539
	mov	eax, DWORD PTR _dest$535[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 5898240				; 005a0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L539
	mov	eax, DWORD PTR _dest$535[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 5832704				; 00590000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L539
	mov	eax, DWORD PTR _dest$535[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2359296				; 00240000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L538
$L539:
; Line 437
	mov	eax, DWORD PTR _dest$535[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _dest$535[ebp], eax
	jmp	$L537
$L538:
; Line 438
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	mov	eax, DWORD PTR _dest$535[ebp]
	push	eax
	call	DWORD PTR _fun$[ebp]
	add	esp, 8
; Line 440
	jmp	$L540
$L533:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1310720				; 00140000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L541
; Line 443
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	dec	eax
	mov	DWORD PTR _i$542[ebp], eax
	jmp	$L543
$L544:
	dec	DWORD PTR _i$542[ebp]
$L543:
	cmp	DWORD PTR _i$542[ebp], 0
	jl	$L545
; Line 445
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _i$542[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	mov	DWORD PTR _y$546[ebp], eax
; Line 446
	mov	eax, DWORD PTR _y$546[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L548
	mov	eax, DWORD PTR _y$546[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1769472				; 001b0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L547
$L548:
; Line 448
	mov	eax, DWORD PTR _y$546[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _dest$549[ebp], eax
; Line 452
$L551:
	mov	eax, DWORD PTR _dest$549[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L553
	mov	eax, DWORD PTR _dest$549[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 5898240				; 005a0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L553
	mov	eax, DWORD PTR _dest$549[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 5832704				; 00590000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L553
	mov	eax, DWORD PTR _dest$549[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2359296				; 00240000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L552
$L553:
; Line 453
	mov	eax, DWORD PTR _dest$549[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _dest$549[ebp], eax
	jmp	$L551
$L552:
; Line 454
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _i$542[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	push	eax
	mov	eax, DWORD PTR _dest$549[ebp]
	push	eax
	call	DWORD PTR _fun$[ebp]
	add	esp, 8
; Line 456
$L547:
	jmp	$L544
$L545:
; Line 458
$L541:
$L540:
$L532:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_note_stores ENDP
_TEXT	ENDS
PUBLIC	_dead_or_set_p
_TEXT	SEGMENT
_insn$ = 8
_reg$ = 12
_link$ = -8
_regno$ = -4
_i$568 = -12
_dead_or_set_p PROC NEAR
; Line 475
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 477
	mov	eax, DWORD PTR _reg$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _regno$[ebp], eax
; Line 479
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR _link$[ebp], eax
	jmp	$L560
$L561:
	mov	eax, DWORD PTR _link$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _link$[ebp], eax
$L560:
	cmp	DWORD PTR _link$[ebp], 0
	je	$L562
; Line 482
	mov	eax, DWORD PTR _link$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 16777216				; 01000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L564
	mov	eax, DWORD PTR _link$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 33554432				; 02000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L563
$L564:
	mov	eax, DWORD PTR _link$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _regno$[ebp]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L563
; Line 483
	mov	eax, 1
	jmp	$L557
; Line 485
$L563:
	jmp	$L561
$L562:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L565
; Line 487
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L681
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _regno$[ebp]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L681
	mov	eax, 1
	jmp	$L682
$L681:
	sub	eax, eax
$L682:
	jmp	$L557
; Line 488
	jmp	$L566
$L565:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1310720				; 00140000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L567
; Line 491
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	dec	eax
	mov	DWORD PTR _i$568[ebp], eax
	jmp	$L569
$L570:
	dec	DWORD PTR _i$568[ebp]
$L569:
	cmp	DWORD PTR _i$568[ebp], 0
	jl	$L571
; Line 495
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _i$568[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L572
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _i$568[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L572
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _i$568[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _regno$[ebp]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L572
; Line 496
	mov	eax, 1
	jmp	$L557
; Line 497
$L572:
	jmp	$L570
$L571:
; Line 499
$L567:
$L566:
	sub	eax, eax
	jmp	$L557
; Line 500
$L557:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_dead_or_set_p ENDP
_TEXT	ENDS
PUBLIC	_find_reg_note
_TEXT	SEGMENT
_link$ = -4
_insn$ = 8
_kind$ = 12
_datum$ = 16
_find_reg_note PROC NEAR
; Line 510
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 513
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR _link$[ebp], eax
	jmp	$L578
$L579:
	mov	eax, DWORD PTR _link$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _link$[ebp], eax
$L578:
	cmp	DWORD PTR _link$[ebp], 0
	je	$L580
; Line 515
	mov	eax, DWORD PTR _link$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	cmp	eax, DWORD PTR _kind$[ebp]
	jne	$L581
	cmp	DWORD PTR _datum$[ebp], 0
	je	$L582
	mov	eax, DWORD PTR _link$[ebp]
	mov	ecx, DWORD PTR _datum$[ebp]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L581
$L582:
; Line 516
	mov	eax, DWORD PTR _link$[ebp]
	jmp	$L576
; Line 517
$L581:
	jmp	$L579
$L580:
	sub	eax, eax
	jmp	$L576
; Line 518
$L576:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_find_reg_note ENDP
_TEXT	ENDS
PUBLIC	_find_regno_note
_TEXT	SEGMENT
_insn$ = 8
_kind$ = 12
_regno$ = 16
_link$ = -4
_find_regno_note PROC NEAR
; Line 528
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 531
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR _link$[ebp], eax
	jmp	$L589
$L590:
	mov	eax, DWORD PTR _link$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _link$[ebp], eax
$L589:
	cmp	DWORD PTR _link$[ebp], 0
	je	$L591
; Line 533
	mov	eax, DWORD PTR _link$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	cmp	eax, DWORD PTR _kind$[ebp]
	jne	$L592
	mov	eax, DWORD PTR _link$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _regno$[ebp]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L592
; Line 534
	mov	eax, DWORD PTR _link$[ebp]
	jmp	$L587
; Line 535
$L592:
	jmp	$L590
$L591:
	sub	eax, eax
	jmp	$L587
; Line 536
$L587:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_find_regno_note ENDP
_TEXT	ENDS
PUBLIC	_no_labels_between
_TEXT	SEGMENT
_from$ = 8
_to$ = 12
_p$ = -4
_no_labels_between PROC NEAR
; Line 543
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 544
	mov	eax, DWORD PTR _to$[ebp]
	mov	DWORD PTR _p$[ebp], eax
; Line 546
$L599:
; Line 548
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _p$[ebp], eax
; Line 549
	cmp	DWORD PTR _p$[ebp], 0
	jne	$L601
; Line 550
	sub	eax, eax
	jmp	$L596
; Line 551
$L601:
	mov	eax, DWORD PTR _p$[ebp]
	cmp	DWORD PTR _from$[ebp], eax
	jne	$L602
; Line 552
	mov	eax, 1
	jmp	$L596
; Line 553
$L602:
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1114112				; 00110000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L603
; Line 554
	sub	eax, eax
	jmp	$L596
; Line 555
$L603:
	jmp	$L599
$L600:
; Line 556
$L596:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_no_labels_between ENDP
_TEXT	ENDS
PUBLIC	_volatile_refs_p
_TEXT	SEGMENT
_x$ = 8
_code$ = -4
_fmt$616 = -12
_i$617 = -8
_j$624 = -16
_volatile_refs_p PROC NEAR
; Line 564
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	push	ebx
	push	esi
	push	edi
; Line 567
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$[ebp], eax
; Line 568
	mov	eax, DWORD PTR _code$[ebp]
	mov	DWORD PTR -20+[ebp], eax
	jmp	$L608
; Line 570
$L612:
; Line 582
	sub	eax, eax
	jmp	$L606
; Line 584
$L613:
; Line 585
	mov	eax, 1
	jmp	$L606
; Line 587
$L614:
; Line 589
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shr	eax, 27					; 0000001bH
	test	al, 1
	je	$L615
; Line 590
	mov	eax, 1
	jmp	$L606
; Line 591
$L615:
	jmp	$L609
$L608:
	sub	DWORD PTR -20+[ebp], 21			; 00000015H
	cmp	DWORD PTR -20+[ebp], 19			; 00000013H
	ja	$L609
	shl	DWORD PTR -20+[ebp], 2
	mov	eax, DWORD PTR -20+[ebp]
	jmp	DWORD PTR $L683[eax]
$L683:
	DD	OFFSET $L612
	DD	OFFSET $L614
	DD	OFFSET $L612
	DD	OFFSET $L612
	DD	OFFSET $L609
	DD	OFFSET $L609
	DD	OFFSET $L612
	DD	OFFSET $L613
	DD	OFFSET $L609
	DD	OFFSET $L612
	DD	OFFSET $L612
	DD	OFFSET $L612
	DD	OFFSET $L612
	DD	OFFSET $L612
	DD	OFFSET $L609
	DD	OFFSET $L609
	DD	OFFSET $L614
	DD	OFFSET $L612
	DD	OFFSET $L612
	DD	OFFSET $L612
$L609:
; Line 596
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_format[eax*4]
	mov	DWORD PTR _fmt$616[ebp], eax
; Line 599
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_length[eax*4]
	dec	eax
	mov	DWORD PTR _i$617[ebp], eax
	jmp	$L618
$L619:
	dec	DWORD PTR _i$617[ebp]
$L618:
	cmp	DWORD PTR _i$617[ebp], 0
	jl	$L620
; Line 601
	mov	eax, DWORD PTR _i$617[ebp]
	mov	ecx, DWORD PTR _fmt$616[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 101				; 00000065H
	jne	$L621
; Line 603
	mov	eax, DWORD PTR _i$617[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	push	eax
	call	_volatile_refs_p
	add	esp, 4
	or	eax, eax
	je	$L622
; Line 604
	mov	eax, 1
	jmp	$L606
; Line 605
$L622:
; Line 606
$L621:
	mov	eax, DWORD PTR _i$617[ebp]
	mov	ecx, DWORD PTR _fmt$616[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 69					; 00000045H
	jne	$L623
; Line 609
	mov	DWORD PTR _j$624[ebp], 0
	jmp	$L625
$L626:
	inc	DWORD PTR _j$624[ebp]
$L625:
	mov	eax, DWORD PTR _i$617[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$624[ebp]
	cmp	DWORD PTR [eax], ecx
	jbe	$L627
; Line 610
	mov	eax, DWORD PTR _i$617[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$624[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	push	eax
	call	_volatile_refs_p
	add	esp, 4
	or	eax, eax
	je	$L628
; Line 611
	mov	eax, 1
	jmp	$L606
; Line 612
$L628:
	jmp	$L626
$L627:
; Line 613
$L623:
	jmp	$L619
$L620:
; Line 615
	sub	eax, eax
	jmp	$L606
; Line 616
$L606:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_volatile_refs_p ENDP
_TEXT	ENDS
PUBLIC	_may_trap_p
EXTRN	_const0_rtx:DWORD
EXTRN	_mode_class:BYTE
_TEXT	SEGMENT
_j$654 = -16
_x$ = 8
_i$ = -8
_code$ = -4
_fmt$ = -12
_may_trap_p PROC NEAR
; Line 623
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	push	ebx
	push	esi
	push	edi
; Line 628
	cmp	DWORD PTR _x$[ebp], 0
	jne	$L635
; Line 629
	sub	eax, eax
	jmp	$L631
; Line 630
$L635:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$[ebp], eax
; Line 631
	mov	eax, DWORD PTR _code$[ebp]
	mov	DWORD PTR -20+[ebp], eax
	jmp	$L636
; Line 634
$L640:
; Line 642
	sub	eax, eax
	jmp	$L631
; Line 645
$L641:
; Line 646
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_rtx_varies_p
	add	esp, 4
	jmp	$L631
; Line 649
$L642:
; Line 654
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L643
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L643
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L643
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L643
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2031616				; 001f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L643
; Line 655
	mov	eax, 1
	jmp	$L631
; Line 656
$L643:
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR _const0_rtx
	cmp	DWORD PTR [eax+8], ecx
	jne	$L644
; Line 657
	mov	eax, 1
	jmp	$L631
; Line 658
$L644:
$L645:
; Line 660
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	cmp	DWORD PTR _mode_class[eax], 2
	jne	$L646
; Line 661
	mov	eax, 1
	jmp	$L631
; Line 662
$L646:
	jmp	$L637
$L636:
	sub	DWORD PTR -20+[ebp], 30			; 0000001eH
	cmp	DWORD PTR -20+[ebp], 22			; 00000016H
	ja	$L645
	shl	DWORD PTR -20+[ebp], 2
	mov	eax, DWORD PTR -20+[ebp]
	jmp	DWORD PTR $L684[eax]
$L684:
	DD	OFFSET $L640
	DD	OFFSET $L640
	DD	OFFSET $L640
	DD	OFFSET $L640
	DD	OFFSET $L640
	DD	OFFSET $L645
	DD	OFFSET $L645
	DD	OFFSET $L641
	DD	OFFSET $L640
	DD	OFFSET $L640
	DD	OFFSET $L640
	DD	OFFSET $L645
	DD	OFFSET $L645
	DD	OFFSET $L645
	DD	OFFSET $L645
	DD	OFFSET $L645
	DD	OFFSET $L645
	DD	OFFSET $L645
	DD	OFFSET $L642
	DD	OFFSET $L642
	DD	OFFSET $L645
	DD	OFFSET $L642
	DD	OFFSET $L642
$L637:
; Line 664
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_format[eax*4]
	mov	DWORD PTR _fmt$[ebp], eax
; Line 665
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_length[eax*4]
	dec	eax
	mov	DWORD PTR _i$[ebp], eax
	jmp	$L647
$L648:
	dec	DWORD PTR _i$[ebp]
$L647:
	cmp	DWORD PTR _i$[ebp], 0
	jl	$L649
; Line 667
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 101				; 00000065H
	jne	$L650
; Line 669
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	push	eax
	call	_may_trap_p
	add	esp, 4
	or	eax, eax
	je	$L651
; Line 670
	mov	eax, 1
	jmp	$L631
; Line 671
$L651:
; Line 672
	jmp	$L652
$L650:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 69					; 00000045H
	jne	$L653
; Line 675
	mov	DWORD PTR _j$654[ebp], 0
	jmp	$L655
$L656:
	inc	DWORD PTR _j$654[ebp]
$L655:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$654[ebp]
	cmp	DWORD PTR [eax], ecx
	jbe	$L657
; Line 676
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$654[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	push	eax
	call	_may_trap_p
	add	esp, 4
	or	eax, eax
	je	$L658
; Line 677
	mov	eax, 1
	jmp	$L631
; Line 678
$L658:
	jmp	$L656
$L657:
; Line 679
$L653:
$L652:
	jmp	$L648
$L649:
; Line 680
	sub	eax, eax
	jmp	$L631
; Line 681
$L631:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_may_trap_p ENDP
_TEXT	ENDS
END
