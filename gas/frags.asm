	TITLE	frags.c
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
PUBLIC	_zero_address_frag
PUBLIC	_bss_address_frag
_DATA	SEGMENT
COMM	_frags:BYTE:024H
_zero_address_frag DD 00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DB	00H
	DB	00H
	DB	00H
	ORG $+1
_bss_address_frag DD 00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DB	00H
	DB	00H
	DB	00H
	ORG $+1
_DATA	ENDS
PUBLIC	_frag_new
PUBLIC	_frag_wane
EXTRN	_frag_now:DWORD
EXTRN	_as_fatal:NEAR
_DATA	SEGMENT
$SG312	DB	'Can''t extend frag %d. chars', 00H
_DATA	ENDS
_TEXT	SEGMENT
; File frags.c
_nchars$ = 8
_n$304 = -4
_oldn$305 = -12
_oldc$306 = -8
_frag_grow PROC NEAR
; Line 71
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 72
	mov	eax, DWORD PTR _frags+16
	sub	eax, DWORD PTR _frags+12
	cmp	eax, DWORD PTR _nchars$[ebp]
	jae	$L303
; Line 76
	mov	eax, DWORD PTR _frag_now
	push	eax
	call	_frag_wane
	add	esp, 4
; Line 77
	push	0
	call	_frag_new
	add	esp, 4
; Line 78
	mov	DWORD PTR _oldn$305[ebp], -1
; Line 79
	mov	eax, DWORD PTR _frags
	mov	DWORD PTR _oldc$306[ebp], eax
; Line 80
	mov	eax, DWORD PTR _nchars$[ebp]
	add	eax, eax
	mov	DWORD PTR _frags, eax
; Line 81
$L308:
	mov	eax, DWORD PTR _frags+16
	sub	eax, DWORD PTR _frags+12
	mov	DWORD PTR _n$304[ebp], eax
	mov	eax, DWORD PTR _nchars$[ebp]
	cmp	DWORD PTR _n$304[ebp], eax
	jae	$L309
	mov	eax, DWORD PTR _oldn$305[ebp]
	cmp	DWORD PTR _n$304[ebp], eax
	jae	$L309
; Line 82
	mov	eax, DWORD PTR _frag_now
	push	eax
	call	_frag_wane
	add	esp, 4
; Line 83
	push	0
	call	_frag_new
	add	esp, 4
; Line 84
	mov	eax, DWORD PTR _n$304[ebp]
	mov	DWORD PTR _oldn$305[ebp], eax
; Line 85
	jmp	$L308
$L309:
; Line 86
	mov	eax, DWORD PTR _oldc$306[ebp]
	mov	DWORD PTR _frags, eax
; Line 88
$L303:
	mov	eax, DWORD PTR _frags+16
	sub	eax, DWORD PTR _frags+12
	cmp	eax, DWORD PTR _nchars$[ebp]
	jae	$L310
; Line 89
	mov	eax, DWORD PTR _nchars$[ebp]
	push	eax
	push	OFFSET $SG312
	call	_as_fatal
	add	esp, 8
; Line 90
$L310:
$L302:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_frag_grow ENDP
_TEXT	ENDS
EXTRN	_frchain_now:DWORD
EXTRN	__obstack_newchunk:NEAR
EXTRN	_memset:NEAR
_TEXT	SEGMENT
_old_frags_var_max_size$ = 8
_former_last_fragP$ = -8
_frchP$ = -4
_tmp$ = -12
_frag_new PROC NEAR
; Line 114
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 121
	mov	eax, DWORD PTR _frags+12
	mov	ecx, DWORD PTR _frag_now
	add	ecx, 38					; 00000026H
	sub	eax, ecx
	sub	eax, DWORD PTR _old_frags_var_max_size$[ebp]
	mov	ecx, DWORD PTR _frag_now
	mov	DWORD PTR [ecx+8], eax
; Line 124
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
; Line 128
	mov	eax, DWORD PTR _frchain_now
	mov	DWORD PTR _frchP$[ebp], eax
; Line 130
	mov	eax, DWORD PTR _frchP$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _former_last_fragP$[ebp], eax
; Line 133
	mov	eax, OFFSET _zero_address_frag
	add	eax, 38					; 00000026H
	sub	eax, OFFSET _zero_address_frag
	mov	DWORD PTR _frags+20, eax
	mov	eax, DWORD PTR _frags+16
	sub	eax, DWORD PTR _frags+12
	cmp	eax, DWORD PTR _frags+20
	jl	$L351
	jmp	$L352
$L351:
	mov	eax, DWORD PTR _frags+20
	push	eax
	push	OFFSET _frags
	call	__obstack_newchunk
	add	esp, 8
$L352:
	mov	eax, DWORD PTR _frags+20
	add	DWORD PTR _frags+12, eax
; Line 136
	mov	eax, DWORD PTR _frags+24
	mov	DWORD PTR _tmp$[ebp], eax
; Line 137
	mov	DWORD PTR _frags+24, 0
; Line 141
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
	jge	$L353
	mov	eax, DWORD PTR _frags+16
	mov	DWORD PTR _frags+12, eax
	jmp	$L354
$L353:
$L354:
	mov	eax, DWORD PTR _frags+12
	mov	DWORD PTR _frags+8, eax
	mov	eax, DWORD PTR _frags+20
	mov	DWORD PTR _frag_now, eax
; Line 142
	mov	eax, DWORD PTR _tmp$[ebp]
	mov	DWORD PTR _frags+24, eax
; Line 145
	mov	eax, OFFSET _zero_address_frag
	add	eax, 38					; 00000026H
	sub	eax, OFFSET _zero_address_frag
	push	eax
	push	0
	mov	eax, DWORD PTR _frag_now
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 155
	mov	eax, DWORD PTR _frag_now
	mov	ecx, DWORD PTR _former_last_fragP$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 156
	mov	eax, DWORD PTR _frag_now
	mov	ecx, DWORD PTR _frchP$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 157
	mov	eax, DWORD PTR _frag_now
	mov	DWORD PTR [eax+4], 0
; Line 158
$L314:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_frag_new ENDP
_TEXT	ENDS
PUBLIC	_frag_more
_TEXT	SEGMENT
_retval$ = -4
_nchars$ = 8
_frag_more PROC NEAR
; Line 173
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 176
	mov	eax, DWORD PTR _nchars$[ebp]
	push	eax
	call	_frag_grow
	add	esp, 4
; Line 177
	mov	eax, DWORD PTR _frags+12
	mov	DWORD PTR _retval$[ebp], eax
; Line 178
	mov	eax, DWORD PTR _nchars$[ebp]
	add	DWORD PTR _frags+12, eax
; Line 179
	mov	eax, DWORD PTR _retval$[ebp]
	jmp	$L320
; Line 180
$L320:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_frag_more ENDP
_TEXT	ENDS
PUBLIC	_frag_var
_TEXT	SEGMENT
_type$ = 8
_max_chars$ = 12
_var$ = 16
_subtype$ = 20
_symbol$ = 24
_offset$ = 28
_opcode$ = 32
_retval$ = -4
_frag_var PROC NEAR
; Line 202
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 205
	mov	eax, DWORD PTR _max_chars$[ebp]
	push	eax
	call	_frag_grow
	add	esp, 4
; Line 206
	mov	eax, DWORD PTR _frags+12
	mov	DWORD PTR _retval$[ebp], eax
; Line 207
	mov	eax, DWORD PTR _max_chars$[ebp]
	add	DWORD PTR _frags+12, eax
; Line 208
	mov	eax, DWORD PTR _var$[ebp]
	mov	ecx, DWORD PTR _frag_now
	mov	DWORD PTR [ecx+12], eax
; Line 209
	mov	eax, DWORD PTR _type$[ebp]
	mov	ecx, DWORD PTR _frag_now
	mov	DWORD PTR [ecx+28], eax
; Line 210
	mov	eax, DWORD PTR _subtype$[ebp]
	mov	ecx, DWORD PTR _frag_now
	mov	DWORD PTR [ecx+32], eax
; Line 211
	mov	eax, DWORD PTR _symbol$[ebp]
	mov	ecx, DWORD PTR _frag_now
	mov	DWORD PTR [ecx+16], eax
; Line 212
	mov	eax, DWORD PTR _offset$[ebp]
	mov	ecx, DWORD PTR _frag_now
	mov	DWORD PTR [ecx+20], eax
; Line 213
	mov	eax, DWORD PTR _opcode$[ebp]
	mov	ecx, DWORD PTR _frag_now
	mov	DWORD PTR [ecx+24], eax
; Line 215
	mov	eax, DWORD PTR _frag_now
	mov	BYTE PTR [eax+36], 0
; Line 216
	mov	eax, DWORD PTR _frag_now
	mov	BYTE PTR [eax+37], 0
; Line 217
	mov	eax, DWORD PTR _max_chars$[ebp]
	push	eax
	call	_frag_new
	add	esp, 4
; Line 218
	mov	eax, DWORD PTR _retval$[ebp]
	jmp	$L329
; Line 219
$L329:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_frag_var ENDP
_TEXT	ENDS
PUBLIC	_frag_variant
_TEXT	SEGMENT
_type$ = 8
_max_chars$ = 12
_var$ = 16
_subtype$ = 20
_symbol$ = 24
_offset$ = 28
_opcode$ = 32
_pcrel_adjust$ = 36
_bsr$ = 40
_retval$ = -4
_frag_variant PROC NEAR
; Line 241
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 245
	mov	eax, DWORD PTR _frags+12
	mov	DWORD PTR _retval$[ebp], eax
; Line 247
	mov	eax, DWORD PTR _var$[ebp]
	mov	ecx, DWORD PTR _frag_now
	mov	DWORD PTR [ecx+12], eax
; Line 248
	mov	eax, DWORD PTR _type$[ebp]
	mov	ecx, DWORD PTR _frag_now
	mov	DWORD PTR [ecx+28], eax
; Line 249
	mov	eax, DWORD PTR _subtype$[ebp]
	mov	ecx, DWORD PTR _frag_now
	mov	DWORD PTR [ecx+32], eax
; Line 250
	mov	eax, DWORD PTR _symbol$[ebp]
	mov	ecx, DWORD PTR _frag_now
	mov	DWORD PTR [ecx+16], eax
; Line 251
	mov	eax, DWORD PTR _offset$[ebp]
	mov	ecx, DWORD PTR _frag_now
	mov	DWORD PTR [ecx+20], eax
; Line 252
	mov	eax, DWORD PTR _opcode$[ebp]
	mov	ecx, DWORD PTR _frag_now
	mov	DWORD PTR [ecx+24], eax
; Line 253
	mov	al, BYTE PTR _pcrel_adjust$[ebp]
	mov	ecx, DWORD PTR _frag_now
	mov	BYTE PTR [ecx+36], al
; Line 254
	mov	al, BYTE PTR _bsr$[ebp]
	mov	ecx, DWORD PTR _frag_now
	mov	BYTE PTR [ecx+37], al
; Line 255
	mov	eax, DWORD PTR _max_chars$[ebp]
	push	eax
	call	_frag_new
	add	esp, 4
; Line 256
	mov	eax, DWORD PTR _retval$[ebp]
	jmp	$L341
; Line 257
$L341:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_frag_variant ENDP
_fragP$ = 8
_frag_wane PROC NEAR
; Line 267
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 268
	mov	eax, DWORD PTR _fragP$[ebp]
	mov	DWORD PTR [eax+28], 0
; Line 269
	mov	eax, DWORD PTR _fragP$[ebp]
	mov	DWORD PTR [eax+20], 0
; Line 270
	mov	eax, DWORD PTR _fragP$[ebp]
	mov	DWORD PTR [eax+12], 0
; Line 271
$L344:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_frag_wane ENDP
_TEXT	ENDS
PUBLIC	_frag_align
_TEXT	SEGMENT
_alignment$ = 8
_fill_character$ = 12
_frag_align PROC NEAR
; Line 287
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 289
	push	0
	mov	eax, DWORD PTR _alignment$[ebp]
	push	eax
	push	0
	push	0
	push	1
	push	1
	push	1
	call	_frag_var
	add	esp, 28					; 0000001cH
	mov	DWORD PTR -4+[ebp], eax
	mov	al, BYTE PTR _fill_character$[ebp]
	mov	ecx, DWORD PTR -4+[ebp]
	mov	BYTE PTR [ecx], al
; Line 290
$L347:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_frag_align ENDP
_TEXT	ENDS
END
