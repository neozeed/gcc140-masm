	TITLE	fold-const.c
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
_TEXT	SEGMENT
; File fold-const.c
_shorts$ = 8
_low$ = 12
_hi$ = 16
_encode	PROC NEAR
; Line 64
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 65
	mov	eax, DWORD PTR _low$[ebp]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _shorts$[ebp]
	mov	WORD PTR [ecx], ax
; Line 66
	mov	eax, DWORD PTR _low$[ebp]
	shr	eax, 8
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _shorts$[ebp]
	mov	WORD PTR [ecx+2], ax
; Line 67
	mov	eax, DWORD PTR _low$[ebp]
	shr	eax, 16					; 00000010H
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _shorts$[ebp]
	mov	WORD PTR [ecx+4], ax
; Line 68
	mov	eax, DWORD PTR _low$[ebp]
	shr	eax, 24					; 00000018H
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _shorts$[ebp]
	mov	WORD PTR [ecx+6], ax
; Line 69
	mov	eax, DWORD PTR _hi$[ebp]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _shorts$[ebp]
	mov	WORD PTR [ecx+8], ax
; Line 70
	mov	eax, DWORD PTR _hi$[ebp]
	shr	eax, 8
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _shorts$[ebp]
	mov	WORD PTR [ecx+10], ax
; Line 71
	mov	eax, DWORD PTR _hi$[ebp]
	shr	eax, 16					; 00000010H
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _shorts$[ebp]
	mov	WORD PTR [ecx+12], ax
; Line 72
	mov	eax, DWORD PTR _hi$[ebp]
	shr	eax, 24					; 00000018H
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _shorts$[ebp]
	mov	WORD PTR [ecx+14], ax
; Line 73
$L574:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_encode	ENDP
_low$ = 12
_hi$ = 16
_shorts$ = 8
_decode	PROC NEAR
; Line 83
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 84
	mov	eax, DWORD PTR _shorts$[ebp]
	movsx	eax, WORD PTR [eax+2]
	shl	eax, 8
	mov	ecx, DWORD PTR _shorts$[ebp]
	movsx	ecx, WORD PTR [ecx+6]
	shl	ecx, 24					; 00000018H
	or	eax, ecx
	mov	ecx, DWORD PTR _shorts$[ebp]
	movsx	ecx, WORD PTR [ecx+4]
	shl	ecx, 16					; 00000010H
	or	eax, ecx
	mov	ecx, DWORD PTR _shorts$[ebp]
	movsx	ecx, WORD PTR [ecx]
	or	eax, ecx
	mov	ecx, DWORD PTR _low$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 85
	mov	eax, DWORD PTR _shorts$[ebp]
	movsx	eax, WORD PTR [eax+12]
	shl	eax, 16					; 00000010H
	mov	ecx, DWORD PTR _shorts$[ebp]
	movsx	ecx, WORD PTR [ecx+10]
	shl	ecx, 8
	or	eax, ecx
	mov	ecx, DWORD PTR _shorts$[ebp]
	movsx	ecx, WORD PTR [ecx+14]
	shl	ecx, 24					; 00000018H
	or	eax, ecx
	mov	ecx, DWORD PTR _shorts$[ebp]
	movsx	ecx, WORD PTR [ecx+8]
	or	eax, ecx
	mov	ecx, DWORD PTR _hi$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 86
$L579:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_decode	ENDP
_t$ = 8
_prec$ = -4
_force_fit_type PROC NEAR
; Line 95
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 96
	mov	eax, DWORD PTR _t$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _prec$[ebp], eax
; Line 98
	mov	eax, DWORD PTR _t$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 11					; 0000000bH
	jne	$L584
; Line 99
	mov	DWORD PTR _prec$[ebp], 32		; 00000020H
; Line 103
$L584:
	cmp	DWORD PTR _prec$[ebp], 64		; 00000040H
	jne	$L585
; Line 105
	jmp	$L586
$L585:
	cmp	DWORD PTR _prec$[ebp], 32		; 00000020H
	jle	$L587
; Line 108
	mov	eax, -1
	mov	ecx, DWORD PTR _prec$[ebp]
	sub	ecx, 32					; 00000020H
	shl	eax, cl
	not	eax
	mov	ecx, DWORD PTR _t$[ebp]
	and	DWORD PTR [ecx+24], eax
; Line 110
	jmp	$L588
$L587:
; Line 112
	mov	eax, DWORD PTR _t$[ebp]
	mov	DWORD PTR [eax+24], 0
; Line 113
	cmp	DWORD PTR _prec$[ebp], 32		; 00000020H
	jge	$L589
; Line 115
	mov	eax, -1
	mov	cl, BYTE PTR _prec$[ebp]
	shl	eax, cl
	not	eax
	mov	ecx, DWORD PTR _t$[ebp]
	and	DWORD PTR [ecx+20], eax
; Line 116
$L589:
$L588:
$L586:
; Line 124
	mov	eax, DWORD PTR _t$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 12					; 0000000cH
	test	al, 1
	jne	$L590
	cmp	DWORD PTR _prec$[ebp], 64		; 00000040H
	je	$L590
	cmp	DWORD PTR _prec$[ebp], 32		; 00000020H
	jle	$L1193
	mov	eax, 1
	mov	ecx, DWORD PTR _prec$[ebp]
	sub	ecx, 33					; 00000021H
	shl	eax, cl
	mov	ecx, DWORD PTR _t$[ebp]
	and	eax, DWORD PTR [ecx+24]
	mov	DWORD PTR -8+[ebp], eax
	jmp	$L1194
$L1193:
	mov	eax, 1
	mov	ecx, DWORD PTR _prec$[ebp]
	dec	ecx
	shl	eax, cl
	mov	ecx, DWORD PTR _t$[ebp]
	and	eax, DWORD PTR [ecx+20]
	mov	DWORD PTR -8+[ebp], eax
$L1194:
	cmp	DWORD PTR -8+[ebp], 0
	je	$L590
; Line 128
	cmp	DWORD PTR _prec$[ebp], 32		; 00000020H
	jle	$L591
; Line 131
	mov	eax, -1
	mov	ecx, DWORD PTR _prec$[ebp]
	sub	ecx, 32					; 00000020H
	shl	eax, cl
	mov	ecx, DWORD PTR _t$[ebp]
	or	DWORD PTR [ecx+24], eax
; Line 133
	jmp	$L592
$L591:
; Line 135
	mov	eax, DWORD PTR _t$[ebp]
	mov	DWORD PTR [eax+24], -1
; Line 136
	cmp	DWORD PTR _prec$[ebp], 32		; 00000020H
	jge	$L593
; Line 138
	mov	eax, -1
	mov	cl, BYTE PTR _prec$[ebp]
	shl	eax, cl
	mov	ecx, DWORD PTR _t$[ebp]
	or	DWORD PTR [ecx+20], eax
; Line 139
$L593:
$L592:
; Line 141
$L590:
$L582:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_force_fit_type ENDP
_l1$ = 8
_h1$ = 12
_l2$ = 16
_h2$ = 20
_lv$ = 24
_hv$ = 28
_arg1$ = -20
_arg2$ = -40
_carry$ = -24
_i$ = -4
_add_double PROC NEAR
; Line 153
	push	ebp
	mov	ebp, esp
	sub	esp, 40					; 00000028H
	push	ebx
	push	esi
	push	edi
; Line 156
	mov	DWORD PTR _carry$[ebp], 0
; Line 159
	mov	eax, DWORD PTR _h1$[ebp]
	push	eax
	mov	eax, DWORD PTR _l1$[ebp]
	push	eax
	lea	eax, DWORD PTR _arg1$[ebp]
	push	eax
	call	_encode
	add	esp, 12					; 0000000cH
; Line 160
	mov	eax, DWORD PTR _h2$[ebp]
	push	eax
	mov	eax, DWORD PTR _l2$[ebp]
	push	eax
	lea	eax, DWORD PTR _arg2$[ebp]
	push	eax
	call	_encode
	add	esp, 12					; 0000000cH
; Line 162
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L606
$L607:
	inc	DWORD PTR _i$[ebp]
$L606:
	cmp	DWORD PTR _i$[ebp], 8
	jge	$L608
; Line 164
	mov	eax, DWORD PTR _i$[ebp]
	movsx	eax, WORD PTR _arg2$[ebp+eax*2]
	mov	ecx, DWORD PTR _i$[ebp]
	movsx	ecx, WORD PTR _arg1$[ebp+ecx*2]
	add	eax, ecx
	add	DWORD PTR _carry$[ebp], eax
; Line 165
	mov	eax, DWORD PTR _carry$[ebp]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _i$[ebp]
	mov	WORD PTR _arg1$[ebp+ecx*2], ax
; Line 166
	sar	DWORD PTR _carry$[ebp], 8
; Line 167
	jmp	$L607
$L608:
; Line 169
	mov	eax, DWORD PTR _hv$[ebp]
	push	eax
	mov	eax, DWORD PTR _lv$[ebp]
	push	eax
	lea	eax, DWORD PTR _arg1$[ebp]
	push	eax
	call	_decode
	add	esp, 12					; 0000000cH
; Line 170
$L601:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_add_double ENDP
_l1$ = 8
_h1$ = 12
_lv$ = 16
_hv$ = 20
_neg_double PROC NEAR
; Line 181
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 182
	cmp	DWORD PTR _l1$[ebp], 0
	jne	$L615
; Line 184
	mov	eax, DWORD PTR _lv$[ebp]
	mov	DWORD PTR [eax], 0
; Line 185
	mov	eax, DWORD PTR _h1$[ebp]
	neg	eax
	mov	ecx, DWORD PTR _hv$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 187
	jmp	$L616
$L615:
; Line 189
	mov	eax, DWORD PTR _l1$[ebp]
	neg	eax
	mov	ecx, DWORD PTR _lv$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 190
	mov	eax, DWORD PTR _h1$[ebp]
	not	eax
	mov	ecx, DWORD PTR _hv$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 191
$L616:
; Line 192
$L614:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_neg_double ENDP
_TEXT	ENDS
EXTRN	_memset:NEAR
_TEXT	SEGMENT
_l1$ = 8
_h1$ = 12
_l2$ = 16
_h2$ = 20
_lv$ = 24
_hv$ = 28
_arg1$ = -56
_arg2$ = -80
_prod$ = -36
_carry$ = -60
_i$ = -4
_j$ = -64
_k$ = -40
_temp$634 = -84
_temp$636 = -88
_temp$638 = -92
_mul_double PROC NEAR
; Line 204
	push	ebp
	mov	ebp, esp
	sub	esp, 92					; 0000005cH
	push	ebx
	push	esi
	push	edi
; Line 208
	mov	DWORD PTR _carry$[ebp], 0
; Line 213
	cmp	DWORD PTR _h2$[ebp], 0
	jne	$L632
; Line 215
	cmp	DWORD PTR _l2$[ebp], 2
	jne	$L633
; Line 217
	mov	eax, DWORD PTR _l1$[ebp]
	add	eax, DWORD PTR _l1$[ebp]
	mov	DWORD PTR _temp$634[ebp], eax
; Line 218
	mov	eax, DWORD PTR _l1$[ebp]
	cmp	DWORD PTR _temp$634[ebp], eax
	mov	eax, 0
	setb	al
	mov	ecx, DWORD PTR _h1$[ebp]
	lea	eax, DWORD PTR [eax+ecx*2]
	mov	ecx, DWORD PTR _hv$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 219
	mov	eax, DWORD PTR _temp$634[ebp]
	mov	ecx, DWORD PTR _lv$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 220
	jmp	$L624
; Line 222
$L633:
	cmp	DWORD PTR _l2$[ebp], 4
	jne	$L635
; Line 224
	mov	eax, DWORD PTR _l1$[ebp]
	add	eax, DWORD PTR _l1$[ebp]
	mov	DWORD PTR _temp$636[ebp], eax
; Line 225
	mov	eax, DWORD PTR _l1$[ebp]
	cmp	DWORD PTR _temp$636[ebp], eax
	mov	eax, 0
	setb	al
	mov	ecx, DWORD PTR _h1$[ebp]
	lea	eax, DWORD PTR [eax+ecx*4]
	add	eax, eax
	mov	DWORD PTR _h1$[ebp], eax
; Line 226
	mov	eax, DWORD PTR _temp$636[ebp]
	mov	DWORD PTR _l1$[ebp], eax
; Line 227
	mov	eax, DWORD PTR _temp$636[ebp]
	add	DWORD PTR _temp$636[ebp], eax
; Line 228
	mov	eax, DWORD PTR _l1$[ebp]
	cmp	DWORD PTR _temp$636[ebp], eax
	mov	eax, 0
	setb	al
	add	DWORD PTR _h1$[ebp], eax
; Line 229
	mov	eax, DWORD PTR _temp$636[ebp]
	mov	ecx, DWORD PTR _lv$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 230
	mov	eax, DWORD PTR _h1$[ebp]
	mov	ecx, DWORD PTR _hv$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 231
	jmp	$L624
; Line 233
$L635:
	cmp	DWORD PTR _l2$[ebp], 8
	jne	$L637
; Line 235
	mov	eax, DWORD PTR _l1$[ebp]
	add	eax, DWORD PTR _l1$[ebp]
	mov	DWORD PTR _temp$638[ebp], eax
; Line 236
	mov	eax, DWORD PTR _l1$[ebp]
	cmp	DWORD PTR _temp$638[ebp], eax
	mov	eax, 0
	setb	al
	mov	ecx, DWORD PTR _h1$[ebp]
	lea	eax, DWORD PTR [eax+ecx*8]
	shl	eax, 2
	mov	DWORD PTR _h1$[ebp], eax
; Line 237
	mov	eax, DWORD PTR _temp$638[ebp]
	mov	DWORD PTR _l1$[ebp], eax
; Line 238
	mov	eax, DWORD PTR _temp$638[ebp]
	add	DWORD PTR _temp$638[ebp], eax
; Line 239
	mov	eax, DWORD PTR _l1$[ebp]
	cmp	DWORD PTR _temp$638[ebp], eax
	mov	eax, 0
	setb	al
	add	eax, eax
	add	DWORD PTR _h1$[ebp], eax
; Line 240
	mov	eax, DWORD PTR _temp$638[ebp]
	mov	DWORD PTR _l1$[ebp], eax
; Line 241
	mov	eax, DWORD PTR _temp$638[ebp]
	add	DWORD PTR _temp$638[ebp], eax
; Line 242
	mov	eax, DWORD PTR _l1$[ebp]
	cmp	DWORD PTR _temp$638[ebp], eax
	mov	eax, 0
	setb	al
	add	DWORD PTR _h1$[ebp], eax
; Line 243
	mov	eax, DWORD PTR _temp$638[ebp]
	mov	ecx, DWORD PTR _lv$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 244
	mov	eax, DWORD PTR _h1$[ebp]
	mov	ecx, DWORD PTR _hv$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 245
	jmp	$L624
; Line 247
$L637:
; Line 249
$L632:
	mov	eax, DWORD PTR _h1$[ebp]
	push	eax
	mov	eax, DWORD PTR _l1$[ebp]
	push	eax
	lea	eax, DWORD PTR _arg1$[ebp]
	push	eax
	call	_encode
	add	esp, 12					; 0000000cH
; Line 250
	mov	eax, DWORD PTR _h2$[ebp]
	push	eax
	mov	eax, DWORD PTR _l2$[ebp]
	push	eax
	lea	eax, DWORD PTR _arg2$[ebp]
	push	eax
	call	_encode
	add	esp, 12					; 0000000cH
; Line 252
	push	32					; 00000020H
	push	0
	lea	eax, DWORD PTR _prod$[ebp]
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 254
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L640
$L641:
	inc	DWORD PTR _i$[ebp]
$L640:
	cmp	DWORD PTR _i$[ebp], 8
	jge	$L642
; Line 255
	mov	DWORD PTR _j$[ebp], 0
	jmp	$L643
$L644:
	inc	DWORD PTR _j$[ebp]
$L643:
	cmp	DWORD PTR _j$[ebp], 8
	jge	$L645
; Line 257
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _k$[ebp], eax
; Line 258
	mov	eax, DWORD PTR _j$[ebp]
	movsx	eax, WORD PTR _arg2$[ebp+eax*2]
	mov	ecx, DWORD PTR _i$[ebp]
	movsx	ecx, WORD PTR _arg1$[ebp+ecx*2]
	imul	eax, ecx
	mov	DWORD PTR _carry$[ebp], eax
; Line 259
$L647:
	cmp	DWORD PTR _carry$[ebp], 0
	je	$L648
; Line 261
	mov	eax, DWORD PTR _k$[ebp]
	movsx	eax, WORD PTR _prod$[ebp+eax*2]
	add	DWORD PTR _carry$[ebp], eax
; Line 262
	mov	eax, DWORD PTR _carry$[ebp]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _k$[ebp]
	mov	WORD PTR _prod$[ebp+ecx*2], ax
; Line 263
	sar	DWORD PTR _carry$[ebp], 8
; Line 264
	inc	DWORD PTR _k$[ebp]
; Line 265
	jmp	$L647
$L648:
; Line 266
	jmp	$L644
$L645:
	jmp	$L641
$L642:
; Line 268
	mov	eax, DWORD PTR _hv$[ebp]
	push	eax
	mov	eax, DWORD PTR _lv$[ebp]
	push	eax
	lea	eax, DWORD PTR _prod$[ebp]
	push	eax
	call	_decode
	add	esp, 12					; 0000000cH
; Line 269
$L624:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_mul_double ENDP
_l1$ = 8
_h1$ = 12
_count$ = 16
_prec$ = 20
_lv$ = 24
_hv$ = 28
_arith$ = 32
_arg1$ = -20
_i$ = -4
_carry$ = -24
_lshift_double PROC NEAR
; Line 282
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	push	ebx
	push	esi
	push	edi
; Line 287
	cmp	DWORD PTR _count$[ebp], 0
	jge	$L660
; Line 289
	mov	eax, DWORD PTR _arith$[ebp]
	push	eax
	mov	eax, DWORD PTR _hv$[ebp]
	push	eax
	mov	eax, DWORD PTR _lv$[ebp]
	push	eax
	mov	eax, DWORD PTR _prec$[ebp]
	push	eax
	mov	eax, DWORD PTR _count$[ebp]
	neg	eax
	push	eax
	mov	eax, DWORD PTR _h1$[ebp]
	push	eax
	mov	eax, DWORD PTR _l1$[ebp]
	push	eax
	call	_rshift_double
	add	esp, 28					; 0000001cH
; Line 290
	jmp	$L656
; Line 293
$L660:
	mov	eax, DWORD PTR _h1$[ebp]
	push	eax
	mov	eax, DWORD PTR _l1$[ebp]
	push	eax
	lea	eax, DWORD PTR _arg1$[ebp]
	push	eax
	call	_encode
	add	esp, 12					; 0000000cH
; Line 295
	mov	eax, DWORD PTR _count$[ebp]
	cmp	DWORD PTR _prec$[ebp], eax
	jge	$L661
; Line 296
	mov	eax, DWORD PTR _prec$[ebp]
	mov	DWORD PTR _count$[ebp], eax
; Line 298
$L661:
$L663:
	cmp	DWORD PTR _count$[ebp], 0
	jle	$L664
; Line 300
	mov	DWORD PTR _carry$[ebp], 0
; Line 301
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L665
$L666:
	inc	DWORD PTR _i$[ebp]
$L665:
	cmp	DWORD PTR _i$[ebp], 8
	jge	$L667
; Line 303
	mov	eax, DWORD PTR _i$[ebp]
	movsx	eax, WORD PTR _arg1$[ebp+eax*2]
	add	eax, eax
	add	DWORD PTR _carry$[ebp], eax
; Line 304
	mov	eax, DWORD PTR _carry$[ebp]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _i$[ebp]
	mov	WORD PTR _arg1$[ebp+ecx*2], ax
; Line 305
	sar	DWORD PTR _carry$[ebp], 8
; Line 306
	jmp	$L666
$L667:
; Line 307
	dec	DWORD PTR _count$[ebp]
; Line 308
	jmp	$L663
$L664:
; Line 310
	mov	eax, DWORD PTR _hv$[ebp]
	push	eax
	mov	eax, DWORD PTR _lv$[ebp]
	push	eax
	lea	eax, DWORD PTR _arg1$[ebp]
	push	eax
	call	_decode
	add	esp, 12					; 0000000cH
; Line 311
$L656:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_lshift_double ENDP
_l1$ = 8
_h1$ = 12
_count$ = 16
_prec$ = 20
_lv$ = 24
_hv$ = 28
_arith$ = 32
_arg1$ = -20
_i$ = -4
_carry$ = -24
_rshift_double PROC NEAR
; Line 323
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	push	ebx
	push	esi
	push	edi
; Line 328
	mov	eax, DWORD PTR _h1$[ebp]
	push	eax
	mov	eax, DWORD PTR _l1$[ebp]
	push	eax
	lea	eax, DWORD PTR _arg1$[ebp]
	push	eax
	call	_encode
	add	esp, 12					; 0000000cH
; Line 330
	mov	eax, DWORD PTR _count$[ebp]
	cmp	DWORD PTR _prec$[ebp], eax
	jge	$L679
; Line 331
	mov	eax, DWORD PTR _prec$[ebp]
	mov	DWORD PTR _count$[ebp], eax
; Line 333
$L679:
$L681:
	cmp	DWORD PTR _count$[ebp], 0
	jle	$L682
; Line 335
	cmp	DWORD PTR _arith$[ebp], 0
	je	$L1195
	movsx	eax, WORD PTR _arg1$[ebp+14]
	and	eax, -128				; ffffff80H
	sub	ecx, ecx
	and	ecx, -128				; ffffff80H
	cmp	eax, ecx
	je	$L1195
	mov	DWORD PTR _carry$[ebp], 1
	jmp	$L1196
$L1195:
	mov	DWORD PTR _carry$[ebp], 0
$L1196:
; Line 336
	mov	DWORD PTR _i$[ebp], 7
	jmp	$L683
$L684:
	dec	DWORD PTR _i$[ebp]
$L683:
	cmp	DWORD PTR _i$[ebp], 0
	jl	$L685
; Line 338
	shl	DWORD PTR _carry$[ebp], 8
; Line 339
	mov	eax, DWORD PTR _i$[ebp]
	movsx	eax, WORD PTR _arg1$[ebp+eax*2]
	add	DWORD PTR _carry$[ebp], eax
; Line 340
	mov	eax, DWORD PTR _carry$[ebp]
	sar	eax, 1
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _i$[ebp]
	mov	WORD PTR _arg1$[ebp+ecx*2], ax
; Line 341
	jmp	$L684
$L685:
; Line 342
	dec	DWORD PTR _count$[ebp]
; Line 343
	jmp	$L681
$L682:
; Line 345
	mov	eax, DWORD PTR _hv$[ebp]
	push	eax
	mov	eax, DWORD PTR _lv$[ebp]
	push	eax
	lea	eax, DWORD PTR _arg1$[ebp]
	push	eax
	call	_decode
	add	esp, 12					; 0000000cH
; Line 346
$L675:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_rshift_double ENDP
_l1$ = 8
_h1$ = 12
_count$ = 16
_prec$ = 20
_lv$ = 24
_hv$ = 28
_arg1$ = -20
_i$ = -4
_carry$ = -24
_lrotate_double PROC NEAR
; Line 357
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	push	ebx
	push	esi
	push	edi
; Line 362
	cmp	DWORD PTR _count$[ebp], 0
	jge	$L696
; Line 364
	mov	eax, DWORD PTR _hv$[ebp]
	push	eax
	mov	eax, DWORD PTR _lv$[ebp]
	push	eax
	mov	eax, DWORD PTR _prec$[ebp]
	push	eax
	mov	eax, DWORD PTR _count$[ebp]
	neg	eax
	push	eax
	mov	eax, DWORD PTR _h1$[ebp]
	push	eax
	mov	eax, DWORD PTR _l1$[ebp]
	push	eax
	call	_rrotate_double
	add	esp, 24					; 00000018H
; Line 365
	jmp	$L692
; Line 368
$L696:
	mov	eax, DWORD PTR _h1$[ebp]
	push	eax
	mov	eax, DWORD PTR _l1$[ebp]
	push	eax
	lea	eax, DWORD PTR _arg1$[ebp]
	push	eax
	call	_encode
	add	esp, 12					; 0000000cH
; Line 370
	mov	eax, DWORD PTR _count$[ebp]
	cmp	DWORD PTR _prec$[ebp], eax
	jge	$L697
; Line 371
	mov	eax, DWORD PTR _prec$[ebp]
	mov	DWORD PTR _count$[ebp], eax
; Line 373
$L697:
	movsx	eax, WORD PTR _arg1$[ebp+14]
	sar	eax, 7
	mov	DWORD PTR _carry$[ebp], eax
; Line 374
$L699:
	cmp	DWORD PTR _count$[ebp], 0
	jle	$L700
; Line 376
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L701
$L702:
	inc	DWORD PTR _i$[ebp]
$L701:
	cmp	DWORD PTR _i$[ebp], 8
	jge	$L703
; Line 378
	mov	eax, DWORD PTR _i$[ebp]
	movsx	eax, WORD PTR _arg1$[ebp+eax*2]
	add	eax, eax
	add	DWORD PTR _carry$[ebp], eax
; Line 379
	mov	eax, DWORD PTR _carry$[ebp]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _i$[ebp]
	mov	WORD PTR _arg1$[ebp+ecx*2], ax
; Line 380
	sar	DWORD PTR _carry$[ebp], 8
; Line 381
	jmp	$L702
$L703:
; Line 382
	dec	DWORD PTR _count$[ebp]
; Line 383
	jmp	$L699
$L700:
; Line 385
	mov	eax, DWORD PTR _hv$[ebp]
	push	eax
	mov	eax, DWORD PTR _lv$[ebp]
	push	eax
	lea	eax, DWORD PTR _arg1$[ebp]
	push	eax
	call	_decode
	add	esp, 12					; 0000000cH
; Line 386
$L692:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_lrotate_double ENDP
_l1$ = 8
_h1$ = 12
_count$ = 16
_prec$ = 20
_lv$ = 24
_hv$ = 28
_arg1$ = -20
_i$ = -4
_carry$ = -24
_rrotate_double PROC NEAR
; Line 396
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	push	ebx
	push	esi
	push	edi
; Line 401
	mov	eax, DWORD PTR _h1$[ebp]
	push	eax
	mov	eax, DWORD PTR _l1$[ebp]
	push	eax
	lea	eax, DWORD PTR _arg1$[ebp]
	push	eax
	call	_encode
	add	esp, 12					; 0000000cH
; Line 403
	mov	eax, DWORD PTR _prec$[ebp]
	cmp	DWORD PTR _count$[ebp], eax
	jle	$L714
; Line 404
	mov	eax, DWORD PTR _prec$[ebp]
	mov	DWORD PTR _count$[ebp], eax
; Line 406
$L714:
	movsx	eax, WORD PTR _arg1$[ebp]
	and	eax, 1
	mov	DWORD PTR _carry$[ebp], eax
; Line 407
$L716:
	cmp	DWORD PTR _count$[ebp], 0
	jle	$L717
; Line 409
	mov	DWORD PTR _i$[ebp], 7
	jmp	$L718
$L719:
	dec	DWORD PTR _i$[ebp]
$L718:
	cmp	DWORD PTR _i$[ebp], 0
	jl	$L720
; Line 411
	shl	DWORD PTR _carry$[ebp], 8
; Line 412
	mov	eax, DWORD PTR _i$[ebp]
	movsx	eax, WORD PTR _arg1$[ebp+eax*2]
	add	DWORD PTR _carry$[ebp], eax
; Line 413
	mov	eax, DWORD PTR _carry$[ebp]
	sar	eax, 1
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _i$[ebp]
	mov	WORD PTR _arg1$[ebp+ecx*2], ax
; Line 414
	jmp	$L719
$L720:
; Line 415
	dec	DWORD PTR _count$[ebp]
; Line 416
	jmp	$L716
$L717:
; Line 418
	mov	eax, DWORD PTR _hv$[ebp]
	push	eax
	mov	eax, DWORD PTR _lv$[ebp]
	push	eax
	lea	eax, DWORD PTR _arg1$[ebp]
	push	eax
	call	_decode
	add	esp, 12					; 0000000cH
; Line 419
$L710:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_rrotate_double ENDP
_TEXT	ENDS
EXTRN	_abort:NEAR
_TEXT	SEGMENT
_num_hi$783 = -112
_code$ = 8
_uns$ = 12
_lnum_orig$ = 16
_hnum_orig$ = 20
_lden_orig$ = 24
_hden_orig$ = 28
_lquo$ = 32
_digit$792 = -116
_hquo$ = 36
_lrem$ = 40
_hrem$ = 44
_quo_neg$ = -84
_num$ = -56
_den$ = -24
_quo$ = -76
_i$ = -4
_j$ = -60
_work$ = -28
_carry$ = -32
_lnum$ = -88
_hnum$ = -36
_lden$ = -8
_hden$ = -80
_labs_rem$815 = -136
_habs_rem$816 = -132
_labs_den$817 = -128
_habs_den$818 = -124
_ltwice$819 = -120
_htwice$820 = -140
_quo_est$758 = -108
_scale$759 = -104
_num_hi_sig$760 = -100
_den_hi_sig$761 = -96
_quo_hi_sig$762 = -92
_div_and_round_double PROC NEAR
; Line 438
	push	ebp
	mov	ebp, esp
	sub	esp, 152				; 00000098H
	push	ebx
	push	esi
	push	edi
; Line 439
	mov	DWORD PTR _quo_neg$[ebp], 0
; Line 442
	mov	DWORD PTR _carry$[ebp], 0
; Line 443
	mov	eax, DWORD PTR _lnum_orig$[ebp]
	mov	DWORD PTR _lnum$[ebp], eax
	mov	eax, DWORD PTR _hnum_orig$[ebp]
	mov	DWORD PTR _hnum$[ebp], eax
; Line 444
	mov	eax, DWORD PTR _lden_orig$[ebp]
	mov	DWORD PTR _lden$[ebp], eax
	mov	eax, DWORD PTR _hden_orig$[ebp]
	mov	DWORD PTR _hden$[ebp], eax
; Line 446
	cmp	DWORD PTR _hden$[ebp], 0
	jne	$L745
	cmp	DWORD PTR _lden$[ebp], 0
	jne	$L745
; Line 447
	call	_abort
; Line 450
$L745:
	cmp	DWORD PTR _uns$[ebp], 0
	jne	$L747
; Line 452
	cmp	DWORD PTR _hden$[ebp], 0
	jge	$L748
; Line 454
	mov	eax, DWORD PTR _quo_neg$[ebp]
	not	eax
	mov	DWORD PTR _quo_neg$[ebp], eax
; Line 455
	lea	eax, DWORD PTR _hden$[ebp]
	push	eax
	lea	eax, DWORD PTR _lden$[ebp]
	push	eax
	mov	eax, DWORD PTR _hden$[ebp]
	push	eax
	mov	eax, DWORD PTR _lden$[ebp]
	push	eax
	call	_neg_double
	add	esp, 16					; 00000010H
; Line 457
$L748:
	cmp	DWORD PTR _hnum$[ebp], 0
	jge	$L749
; Line 459
	mov	eax, DWORD PTR _quo_neg$[ebp]
	not	eax
	mov	DWORD PTR _quo_neg$[ebp], eax
; Line 460
	lea	eax, DWORD PTR _hnum$[ebp]
	push	eax
	lea	eax, DWORD PTR _lnum$[ebp]
	push	eax
	mov	eax, DWORD PTR _hnum$[ebp]
	push	eax
	mov	eax, DWORD PTR _lnum$[ebp]
	push	eax
	call	_neg_double
	add	esp, 16					; 00000010H
; Line 462
$L749:
; Line 464
$L747:
	cmp	DWORD PTR _hnum$[ebp], 0
	jne	$L750
	cmp	DWORD PTR _hden$[ebp], 0
	jne	$L750
; Line 466
	mov	eax, DWORD PTR _hrem$[ebp]
	mov	DWORD PTR [eax], 0
	mov	eax, DWORD PTR _hrem$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _hquo$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 467
	mov	eax, DWORD PTR _lnum$[ebp]
	sub	edx, edx
	div	DWORD PTR _lden$[ebp]
	mov	ecx, DWORD PTR _lquo$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 468
	jmp	$finish_up$751
; Line 471
$L750:
	cmp	DWORD PTR _hnum$[ebp], 0
	jne	$L752
; Line 474
	mov	eax, DWORD PTR _lquo$[ebp]
	mov	DWORD PTR [eax], 0
	mov	eax, DWORD PTR _lquo$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _hquo$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 475
	mov	eax, DWORD PTR _hnum$[ebp]
	mov	ecx, DWORD PTR _hrem$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 476
	mov	eax, DWORD PTR _lnum$[ebp]
	mov	ecx, DWORD PTR _lrem$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 477
	jmp	$finish_up$751
; Line 480
$L752:
	push	16					; 00000010H
	push	0
	lea	eax, DWORD PTR _quo$[ebp]
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 482
	push	18					; 00000012H
	push	0
	lea	eax, DWORD PTR _num$[ebp]
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 483
	push	16					; 00000010H
	push	0
	lea	eax, DWORD PTR _den$[ebp]
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 485
	mov	eax, DWORD PTR _hnum$[ebp]
	push	eax
	mov	eax, DWORD PTR _lnum$[ebp]
	push	eax
	lea	eax, DWORD PTR _num$[ebp]
	push	eax
	call	_encode
	add	esp, 12					; 0000000cH
; Line 486
	mov	eax, DWORD PTR _hden$[ebp]
	push	eax
	mov	eax, DWORD PTR _lden$[ebp]
	push	eax
	lea	eax, DWORD PTR _den$[ebp]
	push	eax
	call	_encode
	add	esp, 12					; 0000000cH
; Line 488
	cmp	DWORD PTR _hden$[ebp], 0
	jne	$L753
; Line 491
	mov	DWORD PTR _i$[ebp], 7
	jmp	$L754
$L755:
	dec	DWORD PTR _i$[ebp]
$L754:
	cmp	DWORD PTR _i$[ebp], 0
	jl	$L756
; Line 493
	mov	eax, DWORD PTR _i$[ebp]
	movsx	eax, WORD PTR _num$[ebp+eax*2]
	mov	ecx, DWORD PTR _carry$[ebp]
	shl	ecx, 8
	add	eax, ecx
	mov	DWORD PTR _work$[ebp], eax
; Line 494
	mov	eax, DWORD PTR _work$[ebp]
	cdq
	idiv	DWORD PTR _lden$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	WORD PTR _quo$[ebp+ecx*2], ax
; Line 495
	mov	eax, DWORD PTR _work$[ebp]
	cdq
	idiv	DWORD PTR _lden$[ebp]
	mov	DWORD PTR _carry$[ebp], edx
; Line 496
	jmp	$L755
$L756:
; Line 498
	jmp	$L757
$L753:
; Line 505
	mov	DWORD PTR _i$[ebp], 7
	jmp	$L763
$L764:
	dec	DWORD PTR _i$[ebp]
$L763:
; Line 506
	mov	eax, DWORD PTR _i$[ebp]
	movsx	eax, WORD PTR _den$[ebp+eax*2]
	or	eax, eax
	je	$L766
; Line 507
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _den_hi_sig$761[ebp], eax
; Line 508
	jmp	$L765
; Line 510
$L766:
	jmp	$L764
$L765:
	mov	DWORD PTR _i$[ebp], 7
	jmp	$L767
$L768:
	dec	DWORD PTR _i$[ebp]
$L767:
; Line 511
	mov	eax, DWORD PTR _i$[ebp]
	movsx	eax, WORD PTR _num$[ebp+eax*2]
	or	eax, eax
	je	$L770
; Line 512
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _num_hi_sig$760[ebp], eax
; Line 513
	jmp	$L769
; Line 515
$L770:
	jmp	$L768
$L769:
	mov	eax, DWORD PTR _num_hi_sig$760[ebp]
	sub	eax, DWORD PTR _den_hi_sig$761[ebp]
	inc	eax
	mov	DWORD PTR _quo_hi_sig$762[ebp], eax
; Line 520
	mov	eax, DWORD PTR _den_hi_sig$761[ebp]
	movsx	ecx, WORD PTR _den$[ebp+eax*2]
	inc	ecx
	mov	eax, 256				; 00000100H
	cdq
	idiv	ecx
	mov	DWORD PTR _scale$759[ebp], eax
; Line 521
	cmp	DWORD PTR _scale$759[ebp], 1
	jle	$L771
; Line 522
	mov	DWORD PTR _carry$[ebp], 0
; Line 523
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L772
$L773:
	inc	DWORD PTR _i$[ebp]
$L772:
	cmp	DWORD PTR _i$[ebp], 8
	jg	$L774
; Line 524
	mov	eax, DWORD PTR _i$[ebp]
	movsx	eax, WORD PTR _num$[ebp+eax*2]
	imul	eax, DWORD PTR _scale$759[ebp]
	add	eax, DWORD PTR _carry$[ebp]
	mov	DWORD PTR _work$[ebp], eax
; Line 525
	mov	eax, DWORD PTR _work$[ebp]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _i$[ebp]
	mov	WORD PTR _num$[ebp+ecx*2], ax
; Line 526
	mov	eax, DWORD PTR _work$[ebp]
	sar	eax, 8
	mov	DWORD PTR _carry$[ebp], eax
; Line 527
	mov	eax, DWORD PTR _i$[ebp]
	movsx	eax, WORD PTR _num$[ebp+eax*2]
	or	eax, eax
	je	$L775
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _num_hi_sig$760[ebp], eax
; Line 528
$L775:
	jmp	$L773
$L774:
; Line 529
	mov	DWORD PTR _carry$[ebp], 0
; Line 530
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L776
$L777:
	inc	DWORD PTR _i$[ebp]
$L776:
	cmp	DWORD PTR _i$[ebp], 7
	jg	$L778
; Line 531
	mov	eax, DWORD PTR _i$[ebp]
	movsx	eax, WORD PTR _den$[ebp+eax*2]
	imul	eax, DWORD PTR _scale$759[ebp]
	add	eax, DWORD PTR _carry$[ebp]
	mov	DWORD PTR _work$[ebp], eax
; Line 532
	mov	eax, DWORD PTR _work$[ebp]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _i$[ebp]
	mov	WORD PTR _den$[ebp+ecx*2], ax
; Line 533
	mov	eax, DWORD PTR _work$[ebp]
	sar	eax, 8
	mov	DWORD PTR _carry$[ebp], eax
; Line 534
	mov	eax, DWORD PTR _i$[ebp]
	movsx	eax, WORD PTR _den$[ebp+eax*2]
	or	eax, eax
	je	$L779
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _den_hi_sig$761[ebp], eax
; Line 535
$L779:
	jmp	$L777
$L778:
; Line 539
$L771:
	mov	eax, DWORD PTR _quo_hi_sig$762[ebp]
	mov	DWORD PTR _i$[ebp], eax
	jmp	$L780
$L781:
	dec	DWORD PTR _i$[ebp]
$L780:
	cmp	DWORD PTR _i$[ebp], 0
	jle	$L782
; Line 546
	mov	eax, DWORD PTR _den_hi_sig$761[ebp]
	add	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _num_hi$783[ebp], eax
; Line 548
	cmp	DWORD PTR _num_hi$783[ebp], 0
	je	$L1197
	mov	DWORD PTR -144+[ebp], 0
	jmp	$L1198
$L1197:
	mov	eax, DWORD PTR _num_hi$783[ebp]
	movsx	eax, WORD PTR _num$[ebp+eax*2-2]
	mov	DWORD PTR -144+[ebp], eax
$L1198:
	mov	eax, DWORD PTR _num_hi$783[ebp]
	movsx	eax, WORD PTR _num$[ebp+eax*2]
	shl	eax, 8
	add	eax, DWORD PTR -144+[ebp]
	mov	DWORD PTR _work$[ebp], eax
; Line 549
	mov	eax, DWORD PTR _num_hi$783[ebp]
	movsx	eax, WORD PTR _num$[ebp+eax*2]
	mov	ecx, DWORD PTR _den_hi_sig$761[ebp]
	movsx	ecx, WORD PTR _den$[ebp+ecx*2]
	cmp	eax, ecx
	je	$L784
; Line 550
	mov	eax, DWORD PTR _den_hi_sig$761[ebp]
	movsx	ecx, WORD PTR _den$[ebp+eax*2]
	mov	eax, DWORD PTR _work$[ebp]
	cdq
	idiv	ecx
	mov	DWORD PTR _quo_est$758[ebp], eax
; Line 552
	jmp	$L785
$L784:
; Line 553
	mov	DWORD PTR _quo_est$758[ebp], 255	; 000000ffH
; Line 554
$L785:
; Line 559
$L787:
	mov	eax, DWORD PTR _num_hi$783[ebp]
	dec	eax
	je	$L1199
	mov	DWORD PTR -148+[ebp], 0
	jmp	$L1200
$L1199:
	mov	eax, DWORD PTR _num_hi$783[ebp]
	movsx	eax, WORD PTR _num$[ebp+eax*2-4]
	mov	DWORD PTR -148+[ebp], eax
$L1200:
	mov	eax, DWORD PTR _work$[ebp]
	mov	ecx, DWORD PTR _den_hi_sig$761[ebp]
	movsx	ecx, WORD PTR _den$[ebp+ecx*2]
	imul	ecx, DWORD PTR _quo_est$758[ebp]
	sub	eax, ecx
	shl	eax, 8
	add	eax, DWORD PTR -148+[ebp]
	mov	ecx, DWORD PTR _den_hi_sig$761[ebp]
	movsx	ecx, WORD PTR _den$[ebp+ecx*2-2]
	imul	ecx, DWORD PTR _quo_est$758[ebp]
	cmp	eax, ecx
	jge	$L788
; Line 560
	dec	DWORD PTR _quo_est$758[ebp]
; Line 561
	jmp	$L787
$L788:
; Line 566
	mov	DWORD PTR _carry$[ebp], 0
; Line 568
	mov	DWORD PTR _j$[ebp], 0
	jmp	$L789
$L790:
	inc	DWORD PTR _j$[ebp]
$L789:
	mov	eax, DWORD PTR _j$[ebp]
	cmp	DWORD PTR _den_hi_sig$761[ebp], eax
	jl	$L791
; Line 571
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	movsx	eax, WORD PTR _num$[ebp+eax*2]
	mov	ecx, DWORD PTR _j$[ebp]
	movsx	ecx, WORD PTR _den$[ebp+ecx*2]
	imul	ecx, DWORD PTR _quo_est$758[ebp]
	sub	eax, ecx
	add	eax, DWORD PTR _carry$[ebp]
	mov	DWORD PTR _work$[ebp], eax
; Line 572
	mov	eax, DWORD PTR _work$[ebp]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _digit$792[ebp], eax
; Line 573
	mov	eax, DWORD PTR _work$[ebp]
	sar	eax, 8
	mov	DWORD PTR _carry$[ebp], eax
; Line 574
	cmp	DWORD PTR _digit$792[ebp], 0
	jge	$L793
; Line 575
	add	DWORD PTR _digit$792[ebp], 256		; 00000100H
; Line 576
	dec	DWORD PTR _carry$[ebp]
; Line 578
$L793:
	mov	eax, DWORD PTR _digit$792[ebp]
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	WORD PTR _num$[ebp+ecx*2], ax
; Line 579
	jmp	$L790
$L791:
; Line 584
	mov	eax, DWORD PTR _num_hi$783[ebp]
	movsx	eax, WORD PTR _num$[ebp+eax*2]
	or	eax, eax
	jge	$L794
; Line 585
	dec	DWORD PTR _quo_est$758[ebp]
; Line 586
	mov	DWORD PTR _carry$[ebp], 0
; Line 587
	mov	DWORD PTR _j$[ebp], 0
	jmp	$L795
$L796:
	inc	DWORD PTR _j$[ebp]
$L795:
	mov	eax, DWORD PTR _j$[ebp]
	cmp	DWORD PTR _den_hi_sig$761[ebp], eax
	jl	$L797
; Line 588
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	movsx	eax, WORD PTR _num$[ebp+eax*2]
	mov	ecx, DWORD PTR _j$[ebp]
	movsx	ecx, WORD PTR _den$[ebp+ecx*2]
	add	eax, ecx
	add	eax, DWORD PTR _carry$[ebp]
	mov	DWORD PTR _work$[ebp], eax
; Line 589
	cmp	DWORD PTR _work$[ebp], 256		; 00000100H
	jle	$L798
; Line 590
	sub	DWORD PTR _work$[ebp], 256		; 00000100H
; Line 591
	mov	DWORD PTR _carry$[ebp], 1
; Line 593
	jmp	$L799
$L798:
; Line 594
	mov	DWORD PTR _carry$[ebp], 0
; Line 595
$L799:
; Line 596
	mov	eax, DWORD PTR _work$[ebp]
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	WORD PTR _num$[ebp+ecx*2], ax
; Line 597
	jmp	$L796
$L797:
; Line 598
	mov	eax, DWORD PTR _num_hi$783[ebp]
	movsx	eax, WORD PTR _num$[ebp+eax*2]
	add	eax, DWORD PTR _carry$[ebp]
	mov	ecx, DWORD PTR _num_hi$783[ebp]
	mov	WORD PTR _num$[ebp+ecx*2], ax
; Line 602
$L794:
	mov	eax, DWORD PTR _quo_est$758[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	WORD PTR _quo$[ebp+ecx*2-2], ax
; Line 603
	jmp	$L781
$L782:
; Line 604
$L757:
; Line 606
	mov	eax, DWORD PTR _hquo$[ebp]
	push	eax
	mov	eax, DWORD PTR _lquo$[ebp]
	push	eax
	lea	eax, DWORD PTR _quo$[ebp]
	push	eax
	call	_decode
	add	esp, 12					; 0000000cH
; Line 608
$finish_up$751:
; Line 610
	cmp	DWORD PTR _quo_neg$[ebp], 0
	je	$L800
; Line 611
	mov	eax, DWORD PTR _hquo$[ebp]
	push	eax
	mov	eax, DWORD PTR _lquo$[ebp]
	push	eax
	mov	eax, DWORD PTR _hquo$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	mov	eax, DWORD PTR _lquo$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_neg_double
	add	esp, 16					; 00000010H
; Line 614
$L800:
	mov	eax, DWORD PTR _hrem$[ebp]
	push	eax
	mov	eax, DWORD PTR _lrem$[ebp]
	push	eax
	mov	eax, DWORD PTR _hden_orig$[ebp]
	push	eax
	mov	eax, DWORD PTR _lden_orig$[ebp]
	push	eax
	mov	eax, DWORD PTR _hquo$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	mov	eax, DWORD PTR _lquo$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_mul_double
	add	esp, 24					; 00000018H
; Line 615
	mov	eax, DWORD PTR _hrem$[ebp]
	push	eax
	mov	eax, DWORD PTR _lrem$[ebp]
	push	eax
	mov	eax, DWORD PTR _hrem$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	mov	eax, DWORD PTR _lrem$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_neg_double
	add	esp, 16					; 00000010H
; Line 616
	mov	eax, DWORD PTR _hrem$[ebp]
	push	eax
	mov	eax, DWORD PTR _lrem$[ebp]
	push	eax
	mov	eax, DWORD PTR _hrem$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	mov	eax, DWORD PTR _lrem$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	mov	eax, DWORD PTR _hnum_orig$[ebp]
	push	eax
	mov	eax, DWORD PTR _lnum_orig$[ebp]
	push	eax
	call	_add_double
	add	esp, 24					; 00000018H
; Line 618
	mov	eax, DWORD PTR _code$[ebp]
	mov	DWORD PTR -152+[ebp], eax
	jmp	$L801
; Line 620
$L805:
; Line 623
	jmp	$L732
; Line 625
$L806:
; Line 627
	cmp	DWORD PTR _quo_neg$[ebp], 0
	je	$L807
	mov	eax, DWORD PTR _lrem$[ebp]
	cmp	DWORD PTR [eax], 0
	jne	$L808
	mov	eax, DWORD PTR _hrem$[ebp]
	cmp	DWORD PTR [eax], 0
	je	$L807
$L808:
; Line 630
	mov	eax, DWORD PTR _hquo$[ebp]
	push	eax
	mov	eax, DWORD PTR _lquo$[ebp]
	push	eax
	push	-1
	push	-1
	mov	eax, DWORD PTR _hquo$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	mov	eax, DWORD PTR _lquo$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_add_double
	add	esp, 24					; 00000018H
; Line 632
	jmp	$L809
$L807:
	jmp	$L732
$L809:
; Line 633
	jmp	$L802
; Line 635
$L810:
; Line 637
	cmp	DWORD PTR _quo_neg$[ebp], 0
	jne	$L811
	mov	eax, DWORD PTR _lrem$[ebp]
	cmp	DWORD PTR [eax], 0
	jne	$L812
	mov	eax, DWORD PTR _hrem$[ebp]
	cmp	DWORD PTR [eax], 0
	je	$L811
$L812:
; Line 639
	mov	eax, DWORD PTR _hquo$[ebp]
	push	eax
	mov	eax, DWORD PTR _lquo$[ebp]
	push	eax
	push	0
	push	1
	mov	eax, DWORD PTR _hquo$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	mov	eax, DWORD PTR _lquo$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_add_double
	add	esp, 24					; 00000018H
; Line 641
	jmp	$L813
$L811:
	jmp	$L732
$L813:
; Line 642
	jmp	$L802
; Line 644
$L814:
; Line 647
	mov	eax, DWORD PTR _lrem$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _labs_rem$815[ebp], eax
	mov	eax, DWORD PTR _hrem$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _habs_rem$816[ebp], eax
; Line 648
	mov	eax, DWORD PTR _lden$[ebp]
	mov	DWORD PTR _labs_den$817[ebp], eax
	mov	eax, DWORD PTR _hden$[ebp]
	mov	DWORD PTR _habs_den$818[ebp], eax
; Line 651
	mov	eax, DWORD PTR _hrem$[ebp]
	cmp	DWORD PTR [eax], 0
	jge	$L821
	lea	eax, DWORD PTR _habs_rem$816[ebp]
	push	eax
	lea	eax, DWORD PTR _labs_rem$815[ebp]
	push	eax
	mov	eax, DWORD PTR _hrem$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	mov	eax, DWORD PTR _lrem$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_neg_double
	add	esp, 16					; 00000010H
; Line 652
$L821:
	cmp	DWORD PTR _hden$[ebp], 0
	jge	$L822
	lea	eax, DWORD PTR _habs_den$818[ebp]
	push	eax
	lea	eax, DWORD PTR _labs_den$817[ebp]
	push	eax
	mov	eax, DWORD PTR _hden$[ebp]
	push	eax
	mov	eax, DWORD PTR _lden$[ebp]
	push	eax
	call	_neg_double
	add	esp, 16					; 00000010H
; Line 655
$L822:
	lea	eax, DWORD PTR _htwice$820[ebp]
	push	eax
	lea	eax, DWORD PTR _ltwice$819[ebp]
	push	eax
	mov	eax, DWORD PTR _habs_rem$816[ebp]
	push	eax
	mov	eax, DWORD PTR _labs_rem$815[ebp]
	push	eax
	push	0
	push	2
	call	_mul_double
	add	esp, 24					; 00000018H
; Line 658
	mov	eax, DWORD PTR _htwice$820[ebp]
	cmp	DWORD PTR _habs_den$818[ebp], eax
	jb	$L824
	mov	eax, DWORD PTR _htwice$820[ebp]
	cmp	DWORD PTR _habs_den$818[ebp], eax
	jne	$L823
	mov	eax, DWORD PTR _ltwice$819[ebp]
	cmp	DWORD PTR _labs_den$817[ebp], eax
	jae	$L823
$L824:
; Line 660
	mov	eax, DWORD PTR _hquo$[ebp]
	cmp	DWORD PTR [eax], 0
	jge	$L825
; Line 662
	mov	eax, DWORD PTR _hquo$[ebp]
	push	eax
	mov	eax, DWORD PTR _lquo$[ebp]
	push	eax
	push	-1
	push	-1
	mov	eax, DWORD PTR _hquo$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	mov	eax, DWORD PTR _lquo$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_add_double
	add	esp, 24					; 00000018H
; Line 663
	jmp	$L826
$L825:
; Line 665
	mov	eax, DWORD PTR _hquo$[ebp]
	push	eax
	mov	eax, DWORD PTR _lquo$[ebp]
	push	eax
	push	0
	push	1
	mov	eax, DWORD PTR _hquo$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	mov	eax, DWORD PTR _lquo$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_add_double
	add	esp, 24					; 00000018H
$L826:
; Line 667
	jmp	$L827
$L823:
	jmp	$L732
$L827:
; Line 669
	jmp	$L802
; Line 671
$L828:
; Line 672
	call	_abort
; Line 673
	jmp	$L802
$L801:
	sub	DWORD PTR -152+[ebp], 67		; 00000043H
	cmp	DWORD PTR -152+[ebp], 9
	ja	$L828
	shl	DWORD PTR -152+[ebp], 2
	mov	eax, DWORD PTR -152+[ebp]
	jmp	DWORD PTR $L1201[eax]
$L1201:
	DD	OFFSET $L805
	DD	OFFSET $L810
	DD	OFFSET $L806
	DD	OFFSET $L814
	DD	OFFSET $L805
	DD	OFFSET $L810
	DD	OFFSET $L806
	DD	OFFSET $L814
	DD	OFFSET $L828
	DD	OFFSET $L805
$L802:
; Line 676
	mov	eax, DWORD PTR _hrem$[ebp]
	push	eax
	mov	eax, DWORD PTR _lrem$[ebp]
	push	eax
	mov	eax, DWORD PTR _hden_orig$[ebp]
	push	eax
	mov	eax, DWORD PTR _lden_orig$[ebp]
	push	eax
	mov	eax, DWORD PTR _hquo$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	mov	eax, DWORD PTR _lquo$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_mul_double
	add	esp, 24					; 00000018H
; Line 677
	mov	eax, DWORD PTR _hrem$[ebp]
	push	eax
	mov	eax, DWORD PTR _lrem$[ebp]
	push	eax
	mov	eax, DWORD PTR _hrem$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	mov	eax, DWORD PTR _lrem$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_neg_double
	add	esp, 16					; 00000010H
; Line 678
	mov	eax, DWORD PTR _hrem$[ebp]
	push	eax
	mov	eax, DWORD PTR _lrem$[ebp]
	push	eax
	mov	eax, DWORD PTR _hrem$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	mov	eax, DWORD PTR _lrem$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	mov	eax, DWORD PTR _hnum_orig$[ebp]
	push	eax
	mov	eax, DWORD PTR _lnum_orig$[ebp]
	push	eax
	call	_add_double
	add	esp, 24					; 00000018H
; Line 679
$L732:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_div_and_round_double ENDP
_TEXT	ENDS
PUBLIC	_fold
EXTRN	_build:NEAR
EXTRN	_convert:NEAR
_TEXT	SEGMENT
_conp$ = 20
_varsignp$ = 24
_outtype$ = -4
_code$845 = -8
_in$ = 8
_code$ = 12
_varp$ = 16
_split_tree PROC NEAR
; Line 701
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 702
	mov	eax, DWORD PTR _in$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _outtype$[ebp], eax
; Line 703
	mov	eax, DWORD PTR _varp$[ebp]
	mov	DWORD PTR [eax], 0
; Line 704
	mov	eax, DWORD PTR _conp$[ebp]
	mov	DWORD PTR [eax], 0
; Line 710
$L838:
	mov	eax, DWORD PTR _in$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 113				; 00000071H
	je	$L840
	mov	eax, DWORD PTR _in$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 112				; 00000070H
	jne	$L839
$L840:
	mov	eax, DWORD PTR _in$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	and	eax, -16777216				; ff000000H
	mov	ecx, DWORD PTR _in$[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	mov	ecx, DWORD PTR [ecx+32]
	shl	ecx, 24					; 00000018H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L839
; Line 711
	mov	eax, DWORD PTR _in$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _in$[ebp], eax
	jmp	$L838
$L839:
; Line 721
	mov	eax, DWORD PTR _in$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, DWORD PTR _code$[ebp]
	je	$L842
	mov	eax, DWORD PTR _in$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 6
	je	$L841
	cmp	DWORD PTR _code$[ebp], 64		; 00000040H
	jne	$L844
	mov	eax, DWORD PTR _in$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 65					; 00000041H
	je	$L843
$L844:
	cmp	DWORD PTR _code$[ebp], 65		; 00000041H
	jne	$L841
	mov	eax, DWORD PTR _in$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 64					; 00000040H
	jne	$L841
$L843:
$L842:
; Line 723
	mov	eax, DWORD PTR _in$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _code$845[ebp], eax
; Line 724
	cmp	DWORD PTR _code$845[ebp], 35		; 00000023H
	jne	$L846
; Line 726
	mov	eax, DWORD PTR _in$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	ecx, DWORD PTR _conp$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 727
	mov	eax, DWORD PTR _in$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	ecx, DWORD PTR _varp$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 728
	mov	eax, DWORD PTR _varp$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _outtype$[ebp]
	cmp	DWORD PTR [eax+8], ecx
	je	$L847
; Line 729
	mov	eax, DWORD PTR _varp$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	mov	eax, DWORD PTR _outtype$[ebp]
	push	eax
	call	_convert
	add	esp, 8
	mov	ecx, DWORD PTR _varp$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 730
$L847:
	mov	eax, DWORD PTR _in$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	sub	eax, 65					; 00000041H
	cmp	eax, 1
	sbb	eax, eax
	and	eax, -2					; fffffffeH
	inc	eax
	mov	ecx, DWORD PTR _varsignp$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 731
	mov	eax, 1
	jmp	$L835
; Line 733
$L846:
	mov	eax, DWORD PTR _in$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 6
	test	al, 1
	je	$L848
; Line 735
	mov	eax, DWORD PTR _in$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	ecx, DWORD PTR _conp$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 736
	mov	eax, DWORD PTR _in$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	ecx, DWORD PTR _varp$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 737
	mov	eax, DWORD PTR _varsignp$[ebp]
	mov	DWORD PTR [eax], 1
; Line 738
	mov	eax, DWORD PTR _varp$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _outtype$[ebp]
	cmp	DWORD PTR [eax+8], ecx
	je	$L849
; Line 739
	mov	eax, DWORD PTR _varp$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	mov	eax, DWORD PTR _outtype$[ebp]
	push	eax
	call	_convert
	add	esp, 8
	mov	ecx, DWORD PTR _varp$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 740
$L849:
	mov	eax, DWORD PTR _in$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 65					; 00000041H
	jne	$L850
; Line 747
	mov	eax, DWORD PTR _conp$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L851
; Line 748
	mov	eax, DWORD PTR _conp$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	mov	eax, DWORD PTR _conp$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	push	83					; 00000053H
	call	_build
	add	esp, 12					; 0000000cH
	push	eax
	call	_fold
	add	esp, 4
	mov	ecx, DWORD PTR _conp$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 749
	jmp	$L852
$L851:
; Line 750
	sub	eax, eax
	jmp	$L835
$L852:
; Line 752
$L850:
	mov	eax, 1
	jmp	$L835
; Line 754
$L848:
	mov	eax, DWORD PTR _in$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 6
	test	al, 1
	je	$L853
; Line 756
	mov	eax, DWORD PTR _in$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	ecx, DWORD PTR _conp$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 757
	mov	eax, DWORD PTR _in$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	ecx, DWORD PTR _varp$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 758
	mov	eax, DWORD PTR _varp$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _outtype$[ebp]
	cmp	DWORD PTR [eax+8], ecx
	je	$L854
; Line 759
	mov	eax, DWORD PTR _varp$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	mov	eax, DWORD PTR _outtype$[ebp]
	push	eax
	call	_convert
	add	esp, 8
	mov	ecx, DWORD PTR _varp$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 760
$L854:
	mov	eax, DWORD PTR _in$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	sub	eax, 65					; 00000041H
	cmp	eax, 1
	sbb	eax, eax
	and	eax, -2					; fffffffeH
	inc	eax
	mov	ecx, DWORD PTR _varsignp$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 761
	mov	eax, 1
	jmp	$L835
; Line 763
$L853:
; Line 764
$L841:
	sub	eax, eax
	jmp	$L835
; Line 765
$L835:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_split_tree ENDP
_TEXT	ENDS
PUBLIC	_combine
EXTRN	_build_int_2:NEAR
EXTRN	_build_real:NEAR
EXTRN	_build_complex:NEAR
EXTRN	_warning:NEAR
EXTRN	_set_float_handler:NEAR
EXTRN	__setjmp:NEAR
EXTRN	__fltused:NEAR
_BSS	SEGMENT
_combine_error$S855 DD 010H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG926	DB	'floating overflow in constant folding', 00H
_DATA	ENDS
CONST	SEGMENT
$T1211	DQ	00000000000000000H		; 0
CONST	ENDS
_TEXT	SEGMENT
_code$ = 8
_d1$921 = -52
_arg1$ = 12
_d2$922 = -60
_arg2$ = 16
_value$923 = -68
_int1l$861 = -12
_int1h$862 = -32
_int2l$863 = -20
_int2h$864 = -16
_low$865 = -4
_hi$866 = -24
_garbagel$867 = -36
_garbageh$868 = -28
_t$869 = -8
_uns$870 = -40
_r1$941 = -80
_i1$942 = -88
_r2$943 = -76
_i2$944 = -84
_t$945 = -72
_magsquared$954 = -92
_temp$893 = -44
_combine PROC NEAR
; Line 779
	push	ebp
	mov	ebp, esp
	sub	esp, 108				; 0000006cH
	push	ebx
	push	esi
	push	edi
; Line 780
	mov	eax, DWORD PTR _arg1$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L860
; Line 782
	mov	eax, DWORD PTR _arg1$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _int1l$861[ebp], eax
; Line 783
	mov	eax, DWORD PTR _arg1$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _int1h$862[ebp], eax
; Line 784
	mov	eax, DWORD PTR _arg2$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _int2l$863[ebp], eax
; Line 785
	mov	eax, DWORD PTR _arg2$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _int2h$864[ebp], eax
; Line 789
	mov	eax, DWORD PTR _arg1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 12					; 0000000cH
	and	eax, 1
	mov	DWORD PTR _uns$870[ebp], eax
; Line 791
	mov	eax, DWORD PTR _code$[ebp]
	mov	DWORD PTR -96+[ebp], eax
	jmp	$L871
; Line 793
$L875:
; Line 794
	mov	eax, DWORD PTR _int2h$864[ebp]
	or	eax, DWORD PTR _int1h$862[ebp]
	push	eax
	mov	eax, DWORD PTR _int2l$863[ebp]
	or	eax, DWORD PTR _int1l$861[ebp]
	push	eax
	call	_build_int_2
	add	esp, 8
	mov	DWORD PTR _t$869[ebp], eax
; Line 795
	jmp	$L872
; Line 797
$L876:
; Line 798
	mov	eax, DWORD PTR _int2h$864[ebp]
	xor	eax, DWORD PTR _int1h$862[ebp]
	push	eax
	mov	eax, DWORD PTR _int2l$863[ebp]
	xor	eax, DWORD PTR _int1l$861[ebp]
	push	eax
	call	_build_int_2
	add	esp, 8
	mov	DWORD PTR _t$869[ebp], eax
; Line 799
	jmp	$L872
; Line 801
$L877:
; Line 802
	mov	eax, DWORD PTR _int2h$864[ebp]
	and	eax, DWORD PTR _int1h$862[ebp]
	push	eax
	mov	eax, DWORD PTR _int2l$863[ebp]
	and	eax, DWORD PTR _int1l$861[ebp]
	push	eax
	call	_build_int_2
	add	esp, 8
	mov	DWORD PTR _t$869[ebp], eax
; Line 803
	jmp	$L872
; Line 805
$L878:
; Line 806
	mov	eax, DWORD PTR _int2h$864[ebp]
	not	eax
	and	eax, DWORD PTR _int1h$862[ebp]
	push	eax
	mov	eax, DWORD PTR _int2l$863[ebp]
	not	eax
	and	eax, DWORD PTR _int1l$861[ebp]
	push	eax
	call	_build_int_2
	add	esp, 8
	mov	DWORD PTR _t$869[ebp], eax
; Line 807
	jmp	$L872
; Line 809
$L879:
; Line 810
	mov	eax, DWORD PTR _int2l$863[ebp]
	neg	eax
	mov	DWORD PTR _int2l$863[ebp], eax
; Line 811
$L880:
; Line 815
	cmp	DWORD PTR _uns$870[ebp], 1
	sbb	eax, eax
	neg	eax
	push	eax
	lea	eax, DWORD PTR _hi$866[ebp]
	push	eax
	lea	eax, DWORD PTR _low$865[ebp]
	push	eax
	mov	eax, DWORD PTR _arg1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	push	eax
	mov	eax, DWORD PTR _int2l$863[ebp]
	push	eax
	mov	eax, DWORD PTR _int1h$862[ebp]
	push	eax
	mov	eax, DWORD PTR _int1l$861[ebp]
	push	eax
	call	_lshift_double
	add	esp, 28					; 0000001cH
; Line 816
	mov	eax, DWORD PTR _hi$866[ebp]
	push	eax
	mov	eax, DWORD PTR _low$865[ebp]
	push	eax
	call	_build_int_2
	add	esp, 8
	mov	DWORD PTR _t$869[ebp], eax
; Line 817
	jmp	$L872
; Line 819
$L881:
; Line 820
	mov	eax, DWORD PTR _int2l$863[ebp]
	neg	eax
	mov	DWORD PTR _int2l$863[ebp], eax
; Line 821
$L882:
; Line 824
	lea	eax, DWORD PTR _hi$866[ebp]
	push	eax
	lea	eax, DWORD PTR _low$865[ebp]
	push	eax
	mov	eax, DWORD PTR _arg1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	push	eax
	mov	eax, DWORD PTR _int2l$863[ebp]
	push	eax
	mov	eax, DWORD PTR _int1h$862[ebp]
	push	eax
	mov	eax, DWORD PTR _int1l$861[ebp]
	push	eax
	call	_lrotate_double
	add	esp, 24					; 00000018H
; Line 825
	mov	eax, DWORD PTR _hi$866[ebp]
	push	eax
	mov	eax, DWORD PTR _low$865[ebp]
	push	eax
	call	_build_int_2
	add	esp, 8
	mov	DWORD PTR _t$869[ebp], eax
; Line 826
	jmp	$L872
; Line 828
$L883:
; Line 829
	cmp	DWORD PTR _int1h$862[ebp], 0
	jne	$L884
; Line 831
	mov	eax, DWORD PTR _int1l$861[ebp]
	add	DWORD PTR _int2l$863[ebp], eax
; Line 832
	mov	eax, DWORD PTR _int1l$861[ebp]
	cmp	DWORD PTR _int2l$863[ebp], eax
	jae	$L885
; Line 833
	inc	DWORD PTR _int2h$864[ebp]
; Line 834
$L885:
	mov	eax, DWORD PTR _int2h$864[ebp]
	push	eax
	mov	eax, DWORD PTR _int2l$863[ebp]
	push	eax
	call	_build_int_2
	add	esp, 8
	mov	DWORD PTR _t$869[ebp], eax
; Line 835
	jmp	$L872
; Line 837
$L884:
	cmp	DWORD PTR _int2h$864[ebp], 0
	jne	$L886
; Line 839
	mov	eax, DWORD PTR _int2l$863[ebp]
	add	DWORD PTR _int1l$861[ebp], eax
; Line 840
	mov	eax, DWORD PTR _int1l$861[ebp]
	cmp	DWORD PTR _int2l$863[ebp], eax
	jbe	$L887
; Line 841
	inc	DWORD PTR _int1h$862[ebp]
; Line 842
$L887:
	mov	eax, DWORD PTR _int1h$862[ebp]
	push	eax
	mov	eax, DWORD PTR _int1l$861[ebp]
	push	eax
	call	_build_int_2
	add	esp, 8
	mov	DWORD PTR _t$869[ebp], eax
; Line 843
	jmp	$L872
; Line 845
$L886:
	lea	eax, DWORD PTR _hi$866[ebp]
	push	eax
	lea	eax, DWORD PTR _low$865[ebp]
	push	eax
	mov	eax, DWORD PTR _int2h$864[ebp]
	push	eax
	mov	eax, DWORD PTR _int2l$863[ebp]
	push	eax
	mov	eax, DWORD PTR _int1h$862[ebp]
	push	eax
	mov	eax, DWORD PTR _int1l$861[ebp]
	push	eax
	call	_add_double
	add	esp, 24					; 00000018H
; Line 846
	mov	eax, DWORD PTR _hi$866[ebp]
	push	eax
	mov	eax, DWORD PTR _low$865[ebp]
	push	eax
	call	_build_int_2
	add	esp, 8
	mov	DWORD PTR _t$869[ebp], eax
; Line 847
	jmp	$L872
; Line 849
$L888:
; Line 850
	cmp	DWORD PTR _int1h$862[ebp], 0
	jne	$L889
	cmp	DWORD PTR _int1l$861[ebp], 0
	jne	$L889
; Line 852
	mov	eax, DWORD PTR _int2h$864[ebp]
	neg	eax
	cmp	DWORD PTR _int2l$863[ebp], 1
	sbb	ecx, ecx
	inc	ecx
	sub	eax, ecx
	push	eax
	mov	eax, DWORD PTR _int2l$863[ebp]
	neg	eax
	push	eax
	call	_build_int_2
	add	esp, 8
	mov	DWORD PTR _t$869[ebp], eax
; Line 853
	jmp	$L872
; Line 855
$L889:
	cmp	DWORD PTR _int2h$864[ebp], 0
	jne	$L890
	cmp	DWORD PTR _int2l$863[ebp], 0
	jne	$L890
; Line 857
	mov	eax, DWORD PTR _int1h$862[ebp]
	push	eax
	mov	eax, DWORD PTR _int1l$861[ebp]
	push	eax
	call	_build_int_2
	add	esp, 8
	mov	DWORD PTR _t$869[ebp], eax
; Line 858
	jmp	$L872
; Line 860
$L890:
	lea	eax, DWORD PTR _int2h$864[ebp]
	push	eax
	lea	eax, DWORD PTR _int2l$863[ebp]
	push	eax
	mov	eax, DWORD PTR _int2h$864[ebp]
	push	eax
	mov	eax, DWORD PTR _int2l$863[ebp]
	push	eax
	call	_neg_double
	add	esp, 16					; 00000010H
; Line 861
	lea	eax, DWORD PTR _hi$866[ebp]
	push	eax
	lea	eax, DWORD PTR _low$865[ebp]
	push	eax
	mov	eax, DWORD PTR _int2h$864[ebp]
	push	eax
	mov	eax, DWORD PTR _int2l$863[ebp]
	push	eax
	mov	eax, DWORD PTR _int1h$862[ebp]
	push	eax
	mov	eax, DWORD PTR _int1l$861[ebp]
	push	eax
	call	_add_double
	add	esp, 24					; 00000018H
; Line 862
	mov	eax, DWORD PTR _hi$866[ebp]
	push	eax
	mov	eax, DWORD PTR _low$865[ebp]
	push	eax
	call	_build_int_2
	add	esp, 8
	mov	DWORD PTR _t$869[ebp], eax
; Line 863
	jmp	$L872
; Line 865
$L891:
; Line 867
	cmp	DWORD PTR _int1h$862[ebp], 0
	jne	$L892
; Line 871
	mov	eax, DWORD PTR _int1l$861[ebp]
	mov	DWORD PTR -100+[ebp], eax
	jmp	$L894
; Line 873
$L898:
; Line 874
	push	0
	push	0
	call	_build_int_2
	add	esp, 8
	mov	DWORD PTR _t$869[ebp], eax
; Line 875
	jmp	$got_it$899
; Line 876
$L900:
; Line 877
	mov	eax, DWORD PTR _int2h$864[ebp]
	push	eax
	mov	eax, DWORD PTR _int2l$863[ebp]
	push	eax
	call	_build_int_2
	add	esp, 8
	mov	DWORD PTR _t$869[ebp], eax
; Line 878
	jmp	$got_it$899
; Line 879
$L901:
; Line 880
	mov	eax, DWORD PTR _int2l$863[ebp]
	add	eax, DWORD PTR _int2l$863[ebp]
	mov	DWORD PTR _temp$893[ebp], eax
; Line 881
	mov	eax, DWORD PTR _temp$893[ebp]
	cmp	DWORD PTR _int2l$863[ebp], eax
	mov	eax, 0
	seta	al
	mov	ecx, DWORD PTR _int2h$864[ebp]
	lea	eax, DWORD PTR [eax+ecx*2]
	mov	DWORD PTR _int2h$864[ebp], eax
; Line 882
	mov	eax, DWORD PTR _int2h$864[ebp]
	push	eax
	mov	eax, DWORD PTR _temp$893[ebp]
	push	eax
	call	_build_int_2
	add	esp, 8
	mov	DWORD PTR _t$869[ebp], eax
; Line 883
	jmp	$got_it$899
; Line 884
$L902:
; Line 885
	mov	eax, DWORD PTR _int2l$863[ebp]
	add	eax, DWORD PTR _int2l$863[ebp]
	add	eax, DWORD PTR _int2l$863[ebp]
	mov	DWORD PTR _temp$893[ebp], eax
; Line 886
	mov	eax, DWORD PTR _temp$893[ebp]
	cmp	DWORD PTR _int2l$863[ebp], eax
	mov	eax, 0
	seta	al
	mov	ecx, DWORD PTR _int2h$864[ebp]
	lea	ecx, DWORD PTR [ecx+ecx*2]
	add	eax, ecx
	mov	DWORD PTR _int2h$864[ebp], eax
; Line 887
	mov	eax, DWORD PTR _int2h$864[ebp]
	push	eax
	mov	eax, DWORD PTR _temp$893[ebp]
	push	eax
	call	_build_int_2
	add	esp, 8
	mov	DWORD PTR _t$869[ebp], eax
; Line 888
	jmp	$got_it$899
; Line 889
$L903:
; Line 890
	mov	eax, DWORD PTR _int2l$863[ebp]
	add	eax, DWORD PTR _int2l$863[ebp]
	mov	DWORD PTR _temp$893[ebp], eax
; Line 891
	mov	eax, DWORD PTR _temp$893[ebp]
	cmp	DWORD PTR _int2l$863[ebp], eax
	mov	eax, 0
	seta	al
	mov	ecx, DWORD PTR _int2h$864[ebp]
	lea	eax, DWORD PTR [eax+ecx*4]
	add	eax, eax
	mov	DWORD PTR _int2h$864[ebp], eax
; Line 892
	mov	eax, DWORD PTR _temp$893[ebp]
	mov	DWORD PTR _int2l$863[ebp], eax
; Line 893
	mov	eax, DWORD PTR _temp$893[ebp]
	add	DWORD PTR _temp$893[ebp], eax
; Line 894
	mov	eax, DWORD PTR _temp$893[ebp]
	cmp	DWORD PTR _int2l$863[ebp], eax
	mov	eax, 0
	seta	al
	add	DWORD PTR _int2h$864[ebp], eax
; Line 895
	mov	eax, DWORD PTR _int2h$864[ebp]
	push	eax
	mov	eax, DWORD PTR _temp$893[ebp]
	push	eax
	call	_build_int_2
	add	esp, 8
	mov	DWORD PTR _t$869[ebp], eax
; Line 896
	jmp	$got_it$899
; Line 897
$L904:
; Line 898
	mov	eax, DWORD PTR _int2l$863[ebp]
	add	eax, DWORD PTR _int2l$863[ebp]
	mov	DWORD PTR _temp$893[ebp], eax
; Line 899
	mov	eax, DWORD PTR _temp$893[ebp]
	cmp	DWORD PTR _int2l$863[ebp], eax
	mov	eax, 0
	seta	al
	mov	ecx, DWORD PTR _int2h$864[ebp]
	lea	eax, DWORD PTR [eax+ecx*8]
	shl	eax, 2
	mov	DWORD PTR _int2h$864[ebp], eax
; Line 900
	mov	eax, DWORD PTR _temp$893[ebp]
	mov	DWORD PTR _int2l$863[ebp], eax
; Line 901
	mov	eax, DWORD PTR _temp$893[ebp]
	add	DWORD PTR _temp$893[ebp], eax
; Line 902
	mov	eax, DWORD PTR _temp$893[ebp]
	cmp	DWORD PTR _int2l$863[ebp], eax
	mov	eax, 0
	seta	al
	add	eax, eax
	add	DWORD PTR _int2h$864[ebp], eax
; Line 903
	mov	eax, DWORD PTR _temp$893[ebp]
	mov	DWORD PTR _int2l$863[ebp], eax
; Line 904
	mov	eax, DWORD PTR _temp$893[ebp]
	add	DWORD PTR _temp$893[ebp], eax
; Line 905
	mov	eax, DWORD PTR _temp$893[ebp]
	cmp	DWORD PTR _int2l$863[ebp], eax
	mov	eax, 0
	seta	al
	add	DWORD PTR _int2h$864[ebp], eax
; Line 906
	mov	eax, DWORD PTR _int2h$864[ebp]
	push	eax
	mov	eax, DWORD PTR _temp$893[ebp]
	push	eax
	call	_build_int_2
	add	esp, 8
	mov	DWORD PTR _t$869[ebp], eax
; Line 907
	jmp	$got_it$899
; Line 908
$L905:
; Line 909
	jmp	$L895
; Line 910
	jmp	$L895
$L894:
	cmp	DWORD PTR -100+[ebp], 8
	ja	$L895
	shl	DWORD PTR -100+[ebp], 2
	mov	eax, DWORD PTR -100+[ebp]
	jmp	DWORD PTR $L1208[eax]
$L1208:
	DD	OFFSET $L898
	DD	OFFSET $L900
	DD	OFFSET $L901
	DD	OFFSET $L902
	DD	OFFSET $L903
	DD	OFFSET $L905
	DD	OFFSET $L905
	DD	OFFSET $L905
	DD	OFFSET $L904
$L895:
; Line 913
$L892:
	cmp	DWORD PTR _int2h$864[ebp], 0
	jne	$L906
; Line 915
	cmp	DWORD PTR _int2l$863[ebp], 0
	jne	$L907
; Line 917
	push	0
	push	0
	call	_build_int_2
	add	esp, 8
	mov	DWORD PTR _t$869[ebp], eax
; Line 918
	jmp	$L872
; Line 920
$L907:
	cmp	DWORD PTR _int2l$863[ebp], 1
	jne	$L908
; Line 922
	mov	eax, DWORD PTR _int1h$862[ebp]
	push	eax
	mov	eax, DWORD PTR _int1l$861[ebp]
	push	eax
	call	_build_int_2
	add	esp, 8
	mov	DWORD PTR _t$869[ebp], eax
; Line 923
	jmp	$L872
; Line 925
$L908:
; Line 927
$L906:
	lea	eax, DWORD PTR _hi$866[ebp]
	push	eax
	lea	eax, DWORD PTR _low$865[ebp]
	push	eax
	mov	eax, DWORD PTR _int2h$864[ebp]
	push	eax
	mov	eax, DWORD PTR _int2l$863[ebp]
	push	eax
	mov	eax, DWORD PTR _int1h$862[ebp]
	push	eax
	mov	eax, DWORD PTR _int1l$861[ebp]
	push	eax
	call	_mul_double
	add	esp, 24					; 00000018H
; Line 928
	mov	eax, DWORD PTR _hi$866[ebp]
	push	eax
	mov	eax, DWORD PTR _low$865[ebp]
	push	eax
	call	_build_int_2
	add	esp, 8
	mov	DWORD PTR _t$869[ebp], eax
; Line 929
	jmp	$L872
; Line 931
$L909:
; Line 934
	cmp	DWORD PTR _int2h$864[ebp], 0
	jne	$L910
	cmp	DWORD PTR _int2l$863[ebp], 1
	jne	$L910
; Line 936
	mov	eax, DWORD PTR _int1h$862[ebp]
	push	eax
	mov	eax, DWORD PTR _int1l$861[ebp]
	push	eax
	call	_build_int_2
	add	esp, 8
	mov	DWORD PTR _t$869[ebp], eax
; Line 937
	jmp	$L872
; Line 939
$L910:
	mov	eax, DWORD PTR _int1l$861[ebp]
	cmp	DWORD PTR _int2l$863[ebp], eax
	jne	$L911
	mov	eax, DWORD PTR _int1h$862[ebp]
	cmp	DWORD PTR _int2h$864[ebp], eax
	jne	$L911
; Line 941
	mov	eax, DWORD PTR _int1h$862[ebp]
	or	eax, DWORD PTR _int1l$861[ebp]
	jne	$L912
; Line 942
	call	_abort
; Line 943
$L912:
	push	0
	push	1
	call	_build_int_2
	add	esp, 8
	mov	DWORD PTR _t$869[ebp], eax
; Line 944
	jmp	$L872
; Line 946
$L911:
; Line 947
	lea	eax, DWORD PTR _garbageh$868[ebp]
	push	eax
	lea	eax, DWORD PTR _garbagel$867[ebp]
	push	eax
	lea	eax, DWORD PTR _hi$866[ebp]
	push	eax
	lea	eax, DWORD PTR _low$865[ebp]
	push	eax
	mov	eax, DWORD PTR _int2h$864[ebp]
	push	eax
	mov	eax, DWORD PTR _int2l$863[ebp]
	push	eax
	mov	eax, DWORD PTR _int1h$862[ebp]
	push	eax
	mov	eax, DWORD PTR _int1l$861[ebp]
	push	eax
	mov	eax, DWORD PTR _uns$870[ebp]
	push	eax
	mov	eax, DWORD PTR _code$[ebp]
	push	eax
	call	_div_and_round_double
	add	esp, 40					; 00000028H
; Line 948
	mov	eax, DWORD PTR _hi$866[ebp]
	push	eax
	mov	eax, DWORD PTR _low$865[ebp]
	push	eax
	call	_build_int_2
	add	esp, 8
	mov	DWORD PTR _t$869[ebp], eax
; Line 949
	jmp	$L872
; Line 951
$L913:
; Line 954
	lea	eax, DWORD PTR _hi$866[ebp]
	push	eax
	lea	eax, DWORD PTR _low$865[ebp]
	push	eax
	lea	eax, DWORD PTR _garbageh$868[ebp]
	push	eax
	lea	eax, DWORD PTR _garbagel$867[ebp]
	push	eax
	mov	eax, DWORD PTR _int2h$864[ebp]
	push	eax
	mov	eax, DWORD PTR _int2l$863[ebp]
	push	eax
	mov	eax, DWORD PTR _int1h$862[ebp]
	push	eax
	mov	eax, DWORD PTR _int1l$861[ebp]
	push	eax
	mov	eax, DWORD PTR _uns$870[ebp]
	push	eax
	mov	eax, DWORD PTR _code$[ebp]
	push	eax
	call	_div_and_round_double
	add	esp, 40					; 00000028H
; Line 955
	mov	eax, DWORD PTR _hi$866[ebp]
	push	eax
	mov	eax, DWORD PTR _low$865[ebp]
	push	eax
	call	_build_int_2
	add	esp, 8
	mov	DWORD PTR _t$869[ebp], eax
; Line 956
	jmp	$L872
; Line 958
$L914:
; Line 960
	cmp	DWORD PTR _uns$870[ebp], 0
	je	$L915
; Line 964
	mov	eax, DWORD PTR _int1h$862[ebp]
	cmp	DWORD PTR _int2h$864[ebp], eax
	ja	$L1204
	mov	eax, DWORD PTR _int1h$862[ebp]
	cmp	DWORD PTR _int2h$864[ebp], eax
	jne	$L1202
	mov	eax, DWORD PTR _int1l$861[ebp]
	cmp	DWORD PTR _int2l$863[ebp], eax
	jbe	$L1202
$L1204:
	mov	DWORD PTR _low$865[ebp], 1
	jmp	$L1203
$L1202:
	mov	DWORD PTR _low$865[ebp], 0
$L1203:
; Line 966
	jmp	$L916
$L915:
; Line 970
	mov	eax, DWORD PTR _int1h$862[ebp]
	cmp	DWORD PTR _int2h$864[ebp], eax
	jg	$L1207
	mov	eax, DWORD PTR _int1h$862[ebp]
	cmp	DWORD PTR _int2h$864[ebp], eax
	jne	$L1205
	mov	eax, DWORD PTR _int1l$861[ebp]
	cmp	DWORD PTR _int2l$863[ebp], eax
	jbe	$L1205
$L1207:
	mov	DWORD PTR _low$865[ebp], 1
	jmp	$L1206
$L1205:
	mov	DWORD PTR _low$865[ebp], 0
$L1206:
; Line 971
$L916:
; Line 972
	mov	eax, DWORD PTR _code$[ebp]
	sub	eax, 84					; 00000054H
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	cmp	eax, DWORD PTR _low$865[ebp]
	jne	$L917
; Line 973
	mov	eax, DWORD PTR _int1h$862[ebp]
	push	eax
	mov	eax, DWORD PTR _int1l$861[ebp]
	push	eax
	call	_build_int_2
	add	esp, 8
	mov	DWORD PTR _t$869[ebp], eax
; Line 974
	jmp	$L918
$L917:
; Line 975
	mov	eax, DWORD PTR _int2h$864[ebp]
	push	eax
	mov	eax, DWORD PTR _int2l$863[ebp]
	push	eax
	call	_build_int_2
	add	esp, 8
	mov	DWORD PTR _t$869[ebp], eax
$L918:
; Line 976
	jmp	$L872
; Line 978
$L919:
; Line 979
	call	_abort
; Line 980
	jmp	$L872
$L871:
	sub	DWORD PTR -96+[ebp], 64			; 00000040H
	cmp	DWORD PTR -96+[ebp], 31			; 0000001fH
	ja	$L919
	shl	DWORD PTR -96+[ebp], 2
	mov	eax, DWORD PTR -96+[ebp]
	jmp	DWORD PTR $L1209[eax]
$L1209:
	DD	OFFSET $L883
	DD	OFFSET $L888
	DD	OFFSET $L891
	DD	OFFSET $L909
	DD	OFFSET $L909
	DD	OFFSET $L909
	DD	OFFSET $L909
	DD	OFFSET $L913
	DD	OFFSET $L913
	DD	OFFSET $L913
	DD	OFFSET $L913
	DD	OFFSET $L919
	DD	OFFSET $L909
	DD	OFFSET $L919
	DD	OFFSET $L919
	DD	OFFSET $L919
	DD	OFFSET $L919
	DD	OFFSET $L919
	DD	OFFSET $L919
	DD	OFFSET $L919
	DD	OFFSET $L914
	DD	OFFSET $L914
	DD	OFFSET $L919
	DD	OFFSET $L919
	DD	OFFSET $L880
	DD	OFFSET $L879
	DD	OFFSET $L882
	DD	OFFSET $L881
	DD	OFFSET $L875
	DD	OFFSET $L876
	DD	OFFSET $L877
	DD	OFFSET $L878
$L872:
; Line 981
$got_it$899:
; Line 982
	mov	eax, DWORD PTR _arg1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _t$869[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 983
	mov	eax, DWORD PTR _t$869[ebp]
	push	eax
	call	_force_fit_type
	add	esp, 4
; Line 984
	mov	eax, DWORD PTR _t$869[ebp]
	jmp	$L859
; Line 987
$L860:
	mov	eax, DWORD PTR _arg1$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 36					; 00000024H
	jne	$L920
; Line 989
	mov	eax, DWORD PTR _arg1$[ebp]
	mov	ecx, DWORD PTR [eax+28]
	mov	DWORD PTR _d1$921[ebp+4], ecx
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _d1$921[ebp], eax
; Line 990
	mov	eax, DWORD PTR _arg2$[ebp]
	mov	ecx, DWORD PTR [eax+28]
	mov	DWORD PTR _d2$922[ebp+4], ecx
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _d2$922[ebp], eax
; Line 993
	push	OFFSET _combine_error$S855
	call	__setjmp
	add	esp, 4
	or	eax, eax
	je	$L924
; Line 995
	push	OFFSET $SG926
	call	_warning
	add	esp, 4
; Line 996
	mov	eax, DWORD PTR _arg2$[ebp]
	push	eax
	mov	eax, DWORD PTR _arg1$[ebp]
	push	eax
	mov	eax, DWORD PTR _arg1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _code$[ebp]
	push	eax
	call	_build
	add	esp, 16					; 00000010H
	jmp	$L859
; Line 998
$L924:
	push	OFFSET _combine_error$S855
	call	_set_float_handler
	add	esp, 4
; Line 1003
	mov	eax, DWORD PTR _code$[ebp]
	mov	DWORD PTR -104+[ebp], eax
	jmp	$L928
; Line 1005
$L932:
; Line 1006
	fld	QWORD PTR _d1$921[ebp]
	fadd	QWORD PTR _d2$922[ebp]
	fstp	QWORD PTR _value$923[ebp]
; Line 1007
	jmp	$L929
; Line 1009
$L933:
; Line 1010
	fld	QWORD PTR _d1$921[ebp]
	fsub	QWORD PTR _d2$922[ebp]
	fstp	QWORD PTR _value$923[ebp]
; Line 1011
	jmp	$L929
; Line 1013
$L934:
; Line 1014
	fld	QWORD PTR _d1$921[ebp]
	fmul	QWORD PTR _d2$922[ebp]
	fstp	QWORD PTR _value$923[ebp]
; Line 1015
	jmp	$L929
; Line 1017
$L935:
; Line 1018
	fld	QWORD PTR _d2$922[ebp]
	fcomp	QWORD PTR $T1211
	fnstsw	ax
	test	ah, 64					; 00000040H
	je	$L936
; Line 1019
	call	_abort
; Line 1021
$L936:
	fld	QWORD PTR _d1$921[ebp]
	fdiv	QWORD PTR _d2$922[ebp]
	fstp	QWORD PTR _value$923[ebp]
; Line 1022
	jmp	$L929
; Line 1024
$L937:
; Line 1025
	fld	QWORD PTR _d1$921[ebp]
	fld	QWORD PTR _d2$922[ebp]
	fcom	ST(1)
	fnstsw	ax
	test	ah, 65					; 00000041H
	je	$L1212
	fxch	ST(1)
$L1212:
	fstp	ST(0)
	fstp	QWORD PTR _value$923[ebp]
; Line 1026
	jmp	$L929
; Line 1028
$L938:
; Line 1029
	fld	QWORD PTR _d1$921[ebp]
	fld	QWORD PTR _d2$922[ebp]
	fcom	ST(1)
	fnstsw	ax
	test	ah, 1
	jne	$L1213
	fxch	ST(1)
$L1213:
	fstp	ST(0)
	fstp	QWORD PTR _value$923[ebp]
; Line 1030
	jmp	$L929
; Line 1032
$L939:
; Line 1033
	call	_abort
; Line 1034
	jmp	$L929
$L928:
	sub	DWORD PTR -104+[ebp], 64		; 00000040H
	cmp	DWORD PTR -104+[ebp], 21		; 00000015H
	ja	$L939
	shl	DWORD PTR -104+[ebp], 2
	mov	eax, DWORD PTR -104+[ebp]
	jmp	DWORD PTR $L1214[eax]
$L1214:
	DD	OFFSET $L932
	DD	OFFSET $L933
	DD	OFFSET $L934
	DD	OFFSET $L939
	DD	OFFSET $L939
	DD	OFFSET $L939
	DD	OFFSET $L939
	DD	OFFSET $L939
	DD	OFFSET $L939
	DD	OFFSET $L939
	DD	OFFSET $L939
	DD	OFFSET $L935
	DD	OFFSET $L939
	DD	OFFSET $L939
	DD	OFFSET $L939
	DD	OFFSET $L939
	DD	OFFSET $L939
	DD	OFFSET $L939
	DD	OFFSET $L939
	DD	OFFSET $L939
	DD	OFFSET $L937
	DD	OFFSET $L938
$L929:
; Line 1036
	push	0
	call	_set_float_handler
	add	esp, 4
; Line 1037
	mov	eax, DWORD PTR _value$923[ebp+4]
	push	eax
	mov	eax, DWORD PTR _value$923[ebp]
	push	eax
	mov	eax, DWORD PTR _arg1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_build_real
	add	esp, 12					; 0000000cH
	jmp	$L859
; Line 1040
$L920:
	mov	eax, DWORD PTR _arg1$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 37					; 00000025H
	jne	$L940
; Line 1042
	mov	eax, DWORD PTR _arg1$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _r1$941[ebp], eax
; Line 1043
	mov	eax, DWORD PTR _arg1$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR _i1$942[ebp], eax
; Line 1044
	mov	eax, DWORD PTR _arg2$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _r2$943[ebp], eax
; Line 1045
	mov	eax, DWORD PTR _arg2$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR _i2$944[ebp], eax
; Line 1048
	mov	eax, DWORD PTR _code$[ebp]
	mov	DWORD PTR -108+[ebp], eax
	jmp	$L946
; Line 1050
$L950:
; Line 1052
	mov	eax, DWORD PTR _i2$944[ebp]
	push	eax
	mov	eax, DWORD PTR _i1$942[ebp]
	push	eax
	push	64					; 00000040H
	call	_combine
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _r2$943[ebp]
	push	eax
	mov	eax, DWORD PTR _r1$941[ebp]
	push	eax
	push	64					; 00000040H
	call	_combine
	add	esp, 12					; 0000000cH
	push	eax
	call	_build_complex
	add	esp, 8
	mov	DWORD PTR _t$945[ebp], eax
; Line 1053
	jmp	$L947
; Line 1055
$L951:
; Line 1057
	mov	eax, DWORD PTR _i2$944[ebp]
	push	eax
	mov	eax, DWORD PTR _i1$942[ebp]
	push	eax
	push	65					; 00000041H
	call	_combine
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _r2$943[ebp]
	push	eax
	mov	eax, DWORD PTR _r1$941[ebp]
	push	eax
	push	65					; 00000041H
	call	_combine
	add	esp, 12					; 0000000cH
	push	eax
	call	_build_complex
	add	esp, 8
	mov	DWORD PTR _t$945[ebp], eax
; Line 1058
	jmp	$L947
; Line 1060
$L952:
; Line 1066
	mov	eax, DWORD PTR _r2$943[ebp]
	push	eax
	mov	eax, DWORD PTR _i1$942[ebp]
	push	eax
	push	66					; 00000042H
	call	_combine
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _i2$944[ebp]
	push	eax
	mov	eax, DWORD PTR _r1$941[ebp]
	push	eax
	push	66					; 00000042H
	call	_combine
	add	esp, 12					; 0000000cH
	push	eax
	push	64					; 00000040H
	call	_combine
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _i2$944[ebp]
	push	eax
	mov	eax, DWORD PTR _i1$942[ebp]
	push	eax
	push	66					; 00000042H
	call	_combine
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _r2$943[ebp]
	push	eax
	mov	eax, DWORD PTR _r1$941[ebp]
	push	eax
	push	66					; 00000042H
	call	_combine
	add	esp, 12					; 0000000cH
	push	eax
	push	65					; 00000041H
	call	_combine
	add	esp, 12					; 0000000cH
	push	eax
	call	_build_complex
	add	esp, 8
	mov	DWORD PTR _t$945[ebp], eax
; Line 1067
	jmp	$L947
; Line 1069
$L953:
; Line 1074
	mov	eax, DWORD PTR _i2$944[ebp]
	push	eax
	mov	eax, DWORD PTR _i2$944[ebp]
	push	eax
	push	66					; 00000042H
	call	_combine
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _r2$943[ebp]
	push	eax
	mov	eax, DWORD PTR _r2$943[ebp]
	push	eax
	push	66					; 00000042H
	call	_combine
	add	esp, 12					; 0000000cH
	push	eax
	push	64					; 00000040H
	call	_combine
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _magsquared$954[ebp], eax
; Line 1084
	mov	eax, DWORD PTR _magsquared$954[ebp]
	push	eax
	mov	eax, DWORD PTR _i2$944[ebp]
	push	eax
	mov	eax, DWORD PTR _r1$941[ebp]
	push	eax
	push	66					; 00000042H
	call	_combine
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _r2$943[ebp]
	push	eax
	mov	eax, DWORD PTR _i1$942[ebp]
	push	eax
	push	66					; 00000042H
	call	_combine
	add	esp, 12					; 0000000cH
	push	eax
	push	65					; 00000041H
	call	_combine
	add	esp, 12					; 0000000cH
	push	eax
	push	75					; 0000004bH
	call	_combine
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _magsquared$954[ebp]
	push	eax
	mov	eax, DWORD PTR _i2$944[ebp]
	push	eax
	mov	eax, DWORD PTR _i1$942[ebp]
	push	eax
	push	66					; 00000042H
	call	_combine
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _r2$943[ebp]
	push	eax
	mov	eax, DWORD PTR _r1$941[ebp]
	push	eax
	push	66					; 00000042H
	call	_combine
	add	esp, 12					; 0000000cH
	push	eax
	push	64					; 00000040H
	call	_combine
	add	esp, 12					; 0000000cH
	push	eax
	push	75					; 0000004bH
	call	_combine
	add	esp, 12					; 0000000cH
	push	eax
	call	_build_complex
	add	esp, 8
	mov	DWORD PTR _t$945[ebp], eax
; Line 1086
	jmp	$L947
; Line 1088
$L955:
; Line 1089
	call	_abort
; Line 1090
	jmp	$L947
$L946:
	cmp	DWORD PTR -108+[ebp], 64		; 00000040H
	je	$L950
	cmp	DWORD PTR -108+[ebp], 65		; 00000041H
	je	$L951
	cmp	DWORD PTR -108+[ebp], 66		; 00000042H
	je	$L952
	cmp	DWORD PTR -108+[ebp], 75		; 0000004bH
	je	$L953
	jmp	$L955
$L947:
; Line 1091
	mov	eax, DWORD PTR _arg1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _t$945[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 1092
	mov	eax, DWORD PTR _t$945[ebp]
	jmp	$L859
; Line 1094
$L940:
	sub	eax, eax
	jmp	$L859
; Line 1095
$L859:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_combine ENDP
_TEXT	ENDS
EXTRN	__ftol:NEAR
EXTRN	_build_real_from_int_cst:NEAR
EXTRN	_real_value_from_int_cst:NEAR
_DATA	SEGMENT
	ORG $+2
$SG968	DB	'real constant out of range for integer conversion', 00H
_DATA	ENDS
_TEXT	SEGMENT
_type$ = -8
_d$969 = -28
_low$970 = -12
_high$971 = -20
_half_word$972 = -16
_t$ = 8
_arg1$ = -4
_fold_convert PROC NEAR
; Line 1103
	push	ebp
	mov	ebp, esp
	sub	esp, 48					; 00000030H
	push	ebx
	push	esi
	push	edi
; Line 1104
	mov	eax, DWORD PTR _t$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _arg1$[ebp], eax
; Line 1105
	mov	eax, DWORD PTR _t$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _type$[ebp], eax
; Line 1109
	mov	eax, DWORD PTR _type$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 11					; 0000000bH
	je	$L962
	mov	eax, DWORD PTR _type$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 5
	je	$L962
	mov	eax, DWORD PTR _type$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 8
	jne	$L961
$L962:
; Line 1111
	mov	eax, DWORD PTR _arg1$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L963
; Line 1116
	mov	eax, DWORD PTR _arg1$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	mov	eax, DWORD PTR _arg1$[ebp]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	call	_build_int_2
	add	esp, 8
	mov	DWORD PTR _t$[ebp], eax
; Line 1117
	mov	eax, DWORD PTR _type$[ebp]
	mov	ecx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 1118
	mov	eax, DWORD PTR _t$[ebp]
	push	eax
	call	_force_fit_type
	add	esp, 4
; Line 1121
	jmp	$L964
$L963:
	mov	eax, DWORD PTR _arg1$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 36					; 00000024H
	jne	$L965
; Line 1125
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+60]
	push	eax
	call	_real_value_from_int_cst
	add	esp, 4
	mov	eax, DWORD PTR _arg1$[ebp]
	fcomp	QWORD PTR [eax+24]
	fnstsw	ax
	test	ah, 1
	jne	$L967
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_real_value_from_int_cst
	add	esp, 4
	mov	eax, DWORD PTR _arg1$[ebp]
	fcomp	QWORD PTR [eax+24]
	fnstsw	ax
	test	ah, 65					; 00000041H
	jne	$L966
$L967:
; Line 1128
	push	OFFSET $SG968
	call	_warning
	add	esp, 4
; Line 1129
	mov	eax, DWORD PTR _t$[ebp]
	jmp	$L958
; Line 1132
$L966:
; Line 1135
	mov	DWORD PTR _half_word$972[ebp], 65536	; 00010000H
; Line 1137
	mov	eax, DWORD PTR _arg1$[ebp]
	mov	ecx, DWORD PTR [eax+28]
	mov	DWORD PTR _d$969[ebp+4], ecx
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _d$969[ebp], eax
; Line 1138
	fld	QWORD PTR _d$969[ebp]
	fcomp	QWORD PTR $T1211
	fnstsw	ax
	test	ah, 1
	je	$L973
; Line 1139
	fld	QWORD PTR _d$969[ebp]
	fchs
	fstp	QWORD PTR _d$969[ebp]
; Line 1141
$L973:
	fld	QWORD PTR _d$969[ebp]
	mov	eax, DWORD PTR _half_word$972[ebp]
	mov	DWORD PTR -32+[ebp], eax
	fidiv	DWORD PTR -32+[ebp]
	mov	eax, DWORD PTR _half_word$972[ebp]
	mov	DWORD PTR -36+[ebp], eax
	fidiv	DWORD PTR -36+[ebp]
	call	__ftol
	mov	DWORD PTR _high$971[ebp], eax
; Line 1142
	mov	eax, DWORD PTR _half_word$972[ebp]
	mov	DWORD PTR -40+[ebp], eax
	fild	DWORD PTR -40+[ebp]
	mov	eax, DWORD PTR _half_word$972[ebp]
	mov	DWORD PTR -44+[ebp], eax
	fimul	DWORD PTR -44+[ebp]
	mov	eax, DWORD PTR _high$971[ebp]
	mov	DWORD PTR -48+[ebp], eax
	fimul	DWORD PTR -48+[ebp]
	fsubr	QWORD PTR _d$969[ebp]
	fst	QWORD PTR _d$969[ebp]
; Line 1143
	call	__ftol
	mov	DWORD PTR _low$970[ebp], eax
; Line 1144
	mov	eax, DWORD PTR _arg1$[ebp]
	fld	QWORD PTR [eax+24]
	fcomp	QWORD PTR $T1211
	fnstsw	ax
	test	ah, 1
	je	$L974
; Line 1145
	lea	eax, DWORD PTR _high$971[ebp]
	push	eax
	lea	eax, DWORD PTR _low$970[ebp]
	push	eax
	mov	eax, DWORD PTR _high$971[ebp]
	push	eax
	mov	eax, DWORD PTR _low$970[ebp]
	push	eax
	call	_neg_double
	add	esp, 16					; 00000010H
; Line 1146
$L974:
	mov	eax, DWORD PTR _high$971[ebp]
	push	eax
	mov	eax, DWORD PTR _low$970[ebp]
	push	eax
	call	_build_int_2
	add	esp, 8
	mov	DWORD PTR _t$[ebp], eax
; Line 1155
	mov	eax, DWORD PTR _type$[ebp]
	mov	ecx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 1156
	mov	eax, DWORD PTR _t$[ebp]
	push	eax
	call	_force_fit_type
	add	esp, 4
; Line 1159
$L965:
$L964:
	mov	eax, DWORD PTR _type$[ebp]
	mov	ecx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 1161
	jmp	$L975
$L961:
	mov	eax, DWORD PTR _type$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 6
	jne	$L976
; Line 1164
	mov	eax, DWORD PTR _arg1$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L977
; Line 1165
	mov	eax, DWORD PTR _arg1$[ebp]
	push	eax
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_build_real_from_int_cst
	add	esp, 8
	jmp	$L958
; Line 1167
$L977:
	mov	eax, DWORD PTR _arg1$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 36					; 00000024H
	jne	$L978
; Line 1168
	mov	eax, DWORD PTR _arg1$[ebp]
	mov	ecx, DWORD PTR [eax+28]
	push	ecx
	mov	eax, DWORD PTR [eax+24]
	push	eax
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_build_real
	add	esp, 12					; 0000000cH
	jmp	$L958
; Line 1169
$L978:
; Line 1170
$L976:
$L975:
	mov	eax, DWORD PTR _t$[ebp]
	mov	eax, DWORD PTR [eax+16]
	or	eax, 64					; 00000040H
	mov	ecx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 1171
	mov	eax, DWORD PTR _t$[ebp]
	jmp	$L958
; Line 1172
$L958:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_fold_convert ENDP
_arg0$ = 8
_arg1$ = 12
_operand_equal_p PROC NEAR
; Line 1181
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1184
$L984:
	mov	eax, DWORD PTR _arg0$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 113				; 00000071H
	je	$L986
	mov	eax, DWORD PTR _arg0$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 112				; 00000070H
	jne	$L985
$L986:
	mov	eax, DWORD PTR _arg0$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	and	eax, -16777216				; ff000000H
	mov	ecx, DWORD PTR _arg0$[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	mov	ecx, DWORD PTR [ecx+32]
	shl	ecx, 24					; 00000018H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L985
; Line 1185
	mov	eax, DWORD PTR _arg0$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _arg0$[ebp], eax
	jmp	$L984
$L985:
; Line 1188
$L988:
	mov	eax, DWORD PTR _arg1$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 113				; 00000071H
	je	$L990
	mov	eax, DWORD PTR _arg1$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 112				; 00000070H
	jne	$L989
$L990:
	mov	eax, DWORD PTR _arg1$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	and	eax, -16777216				; ff000000H
	mov	ecx, DWORD PTR _arg1$[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	mov	ecx, DWORD PTR [ecx+32]
	shl	ecx, 24					; 00000018H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L989
; Line 1189
	mov	eax, DWORD PTR _arg1$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _arg1$[ebp], eax
	jmp	$L988
$L989:
; Line 1193
	mov	eax, DWORD PTR _arg0$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _arg1$[ebp]
	mov	cl, BYTE PTR [ecx+12]
	and	ecx, 255				; 000000ffH
	cmp	eax, ecx
	jne	$L991
	mov	eax, DWORD PTR _arg0$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 116				; 00000074H
	jne	$L991
	mov	eax, DWORD PTR _arg0$[ebp]
	mov	ecx, DWORD PTR _arg1$[ebp]
	mov	ecx, DWORD PTR [ecx+24]
	cmp	DWORD PTR [eax+24], ecx
	jne	$L991
; Line 1194
	mov	eax, 1
	jmp	$L982
; Line 1195
$L991:
	sub	eax, eax
	jmp	$L982
; Line 1196
$L982:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_operand_equal_p ENDP
_arg$ = 8
_real_zerop PROC NEAR
; Line 1207
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1212
	mov	eax, DWORD PTR _arg$[ebp]
	fld	QWORD PTR [eax+24]
	fcomp	QWORD PTR $T1211
	fnstsw	ax
	test	ah, 64					; 00000040H
	mov	eax, 0
	setne	al
	jmp	$L994
; Line 1214
$L994:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_real_zerop ENDP
_TEXT	ENDS
EXTRN	_tree_int_cst_lt:NEAR
EXTRN	_integer_zero_node:DWORD
EXTRN	_integer_one_node:DWORD
EXTRN	_integer_type_node:DWORD
EXTRN	_tree_code_type:BYTE
EXTRN	_tree_code_length:BYTE
EXTRN	_integer_zerop:NEAR
EXTRN	_integer_onep:NEAR
EXTRN	_integer_all_onesp:NEAR
_TEXT	SEGMENT
_prec$1095 = -68
_prec$1098 = -72
_temp$1173 = -96
_var$1053 = -48
_con$1054 = -56
_tem$1055 = -52
_varsign$1056 = -44
_expr$ = 8
_t$ = -4
_type$ = -32
_arg0$ = -16
_arg1$ = -8
_tem1$1065 = -60
_code$ = -24
_kind$ = -12
_wins$ = -28
_loses$ = -20
_t1$1071 = -64
_len$1009 = -40
_i$1010 = -36
_constop$1139 = -76
_varop$1140 = -84
_constoploc$1141 = -80
_newconst$1145 = -88
_newconst$1150 = -92
_fold	PROC NEAR
; Line 1228
	push	ebp
	mov	ebp, esp
	sub	esp, 124				; 0000007cH
	push	ebx
	push	esi
	push	edi
; Line 1229
	mov	eax, DWORD PTR _expr$[ebp]
	mov	DWORD PTR _t$[ebp], eax
; Line 1230
	mov	eax, DWORD PTR _expr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _type$[ebp], eax
; Line 1232
	mov	eax, DWORD PTR _t$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _code$[ebp], eax
; Line 1244
	mov	DWORD PTR _wins$[ebp], 1
; Line 1245
	mov	DWORD PTR _loses$[ebp], 0
; Line 1248
	mov	eax, DWORD PTR _t$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 6
	test	al, 1
	je	$L1005
; Line 1250
	cmp	DWORD PTR _code$[ebp], 41		; 00000029H
	jne	$L1006
; Line 1251
	mov	eax, DWORD PTR _t$[ebp]
	mov	eax, DWORD PTR [eax+64]
	jmp	$L996
; Line 1252
$L1006:
	mov	eax, DWORD PTR _t$[ebp]
	jmp	$L996
; Line 1255
$L1005:
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _tree_code_type[eax*4]
	movsx	eax, BYTE PTR [eax]
	mov	DWORD PTR _kind$[ebp], eax
; Line 1256
	cmp	DWORD PTR _kind$[ebp], 101		; 00000065H
	je	$L1008
	cmp	DWORD PTR _kind$[ebp], 114		; 00000072H
	jne	$L1007
$L1008:
; Line 1258
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _tree_code_length[eax*4]
	mov	DWORD PTR _len$1009[ebp], eax
; Line 1260
	mov	DWORD PTR _i$1010[ebp], 0
	jmp	$L1011
$L1012:
	inc	DWORD PTR _i$1010[ebp]
$L1011:
	mov	eax, DWORD PTR _len$1009[ebp]
	cmp	DWORD PTR _i$1010[ebp], eax
	jge	$L1013
; Line 1262
	mov	eax, DWORD PTR _i$1010[ebp]
	mov	ecx, DWORD PTR _t$[ebp]
	cmp	DWORD PTR [ecx+eax*4+24], 0
	jne	$L1014
; Line 1263
	jmp	$L1012
; Line 1264
$L1014:
; Line 1268
	mov	eax, DWORD PTR _i$1010[ebp]
	mov	ecx, DWORD PTR _t$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+24]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	je	$L1015
	mov	eax, DWORD PTR _i$1010[ebp]
	mov	ecx, DWORD PTR _t$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+24]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 36					; 00000024H
	je	$L1015
; Line 1272
	mov	DWORD PTR _wins$[ebp], 0
; Line 1273
$L1015:
	mov	eax, DWORD PTR _i$1010[ebp]
	mov	ecx, DWORD PTR _t$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+24]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 3
	test	al, 1
	je	$L1016
; Line 1274
	mov	DWORD PTR _loses$[ebp], 1
; Line 1275
$L1016:
	jmp	$L1012
$L1013:
; Line 1276
	mov	eax, DWORD PTR _t$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _arg0$[ebp], eax
; Line 1277
	cmp	DWORD PTR _len$1009[ebp], 1
	jle	$L1017
; Line 1278
	mov	eax, DWORD PTR _t$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR _arg1$[ebp], eax
; Line 1279
$L1017:
; Line 1285
$L1007:
	mov	eax, DWORD PTR _code$[ebp]
	mov	DWORD PTR -112+[ebp], eax
	jmp	$L1018
; Line 1287
$L1022:
; Line 1292
	mov	eax, DWORD PTR _t$[ebp]
	jmp	$L996
; Line 1294
$L1023:
; Line 1295
	mov	eax, DWORD PTR _t$[ebp]
	mov	eax, DWORD PTR [eax+64]
	push	eax
	call	_fold
	add	esp, 4
	jmp	$L996
; Line 1297
$L1024:
; Line 1302
	cmp	DWORD PTR _wins$[ebp], 0
	jne	$L1025
; Line 1304
	mov	eax, DWORD PTR _arg0$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 6
	and	eax, 1
	shl	eax, 6
	mov	ecx, DWORD PTR _t$[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	and	ecx, -65				; ffffffbfH
	or	eax, ecx
	mov	ecx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 1305
	mov	eax, DWORD PTR _t$[ebp]
	jmp	$L996
; Line 1307
$L1025:
	mov	eax, DWORD PTR _t$[ebp]
	push	eax
	call	_fold_convert
	add	esp, 4
	jmp	$L996
; Line 1328
$L1026:
; Line 1329
	mov	eax, DWORD PTR _t$[ebp]
	mov	eax, DWORD PTR [eax+16]
	and	eax, -65				; ffffffbfH
	mov	ecx, DWORD PTR _wins$[ebp]
	and	ecx, 1
	shl	ecx, 6
	or	eax, ecx
	mov	ecx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 1330
	mov	eax, DWORD PTR _t$[ebp]
	jmp	$L996
; Line 1332
$L1027:
; Line 1333
	cmp	DWORD PTR _wins$[ebp], 0
	je	$L1028
; Line 1335
	mov	eax, DWORD PTR _arg0$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L1029
; Line 1337
	mov	eax, DWORD PTR _arg0$[ebp]
	cmp	DWORD PTR [eax+20], 0
	jne	$L1030
; Line 1338
	mov	eax, DWORD PTR _arg0$[ebp]
	mov	eax, DWORD PTR [eax+24]
	neg	eax
	push	eax
	push	0
	call	_build_int_2
	add	esp, 8
	mov	DWORD PTR _t$[ebp], eax
; Line 1339
	jmp	$L1031
$L1030:
; Line 1341
	mov	eax, DWORD PTR _arg0$[ebp]
	mov	eax, DWORD PTR [eax+24]
	not	eax
	push	eax
	mov	eax, DWORD PTR _arg0$[ebp]
	mov	eax, DWORD PTR [eax+20]
	neg	eax
	push	eax
	call	_build_int_2
	add	esp, 8
	mov	DWORD PTR _t$[ebp], eax
$L1031:
; Line 1342
	mov	eax, DWORD PTR _type$[ebp]
	mov	ecx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 1343
	mov	eax, DWORD PTR _t$[ebp]
	push	eax
	call	_force_fit_type
	add	esp, 4
; Line 1345
	jmp	$L1032
$L1029:
	mov	eax, DWORD PTR _arg0$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 36					; 00000024H
	jne	$L1033
; Line 1346
	mov	eax, DWORD PTR _arg0$[ebp]
	fld	QWORD PTR [eax+24]
	fchs
	sub	esp, 8
	fstp	QWORD PTR [esp]
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_build_real
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _t$[ebp], eax
; Line 1347
$L1033:
$L1032:
	mov	eax, DWORD PTR _type$[ebp]
	mov	ecx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 1349
$L1028:
	mov	eax, DWORD PTR _t$[ebp]
	jmp	$L996
; Line 1351
$L1034:
; Line 1352
	cmp	DWORD PTR _wins$[ebp], 0
	je	$L1035
; Line 1354
	mov	eax, DWORD PTR _arg0$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L1036
; Line 1357
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 12					; 0000000cH
	test	al, 1
	jne	$L1037
	mov	eax, DWORD PTR _arg0$[ebp]
	cmp	DWORD PTR [eax+24], 0
	jge	$L1037
; Line 1359
	mov	eax, DWORD PTR _arg0$[ebp]
	cmp	DWORD PTR [eax+20], 0
	jne	$L1038
; Line 1360
	mov	eax, DWORD PTR _arg0$[ebp]
	mov	eax, DWORD PTR [eax+24]
	neg	eax
	push	eax
	push	0
	call	_build_int_2
	add	esp, 8
	mov	DWORD PTR _t$[ebp], eax
; Line 1361
	jmp	$L1039
$L1038:
; Line 1363
	mov	eax, DWORD PTR _arg0$[ebp]
	mov	eax, DWORD PTR [eax+24]
	not	eax
	push	eax
	mov	eax, DWORD PTR _arg0$[ebp]
	mov	eax, DWORD PTR [eax+20]
	neg	eax
	push	eax
	call	_build_int_2
	add	esp, 8
	mov	DWORD PTR _t$[ebp], eax
$L1039:
; Line 1365
$L1037:
; Line 1366
	jmp	$L1040
$L1036:
	mov	eax, DWORD PTR _arg0$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 36					; 00000024H
	jne	$L1041
; Line 1375
	mov	eax, DWORD PTR _arg0$[ebp]
	fld	QWORD PTR [eax+24]
	fcomp	QWORD PTR $T1211
	fnstsw	ax
	test	ah, 1
	je	$L1042
; Line 1377
	mov	eax, DWORD PTR _arg0$[ebp]
	fld	QWORD PTR [eax+24]
	fchs
	sub	esp, 8
	fstp	QWORD PTR [esp]
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_build_real
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _t$[ebp], eax
; Line 1378
$L1042:
; Line 1379
$L1041:
$L1040:
	mov	eax, DWORD PTR _type$[ebp]
	mov	ecx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 1381
$L1035:
	mov	eax, DWORD PTR _t$[ebp]
	jmp	$L996
; Line 1383
$L1043:
; Line 1384
	cmp	DWORD PTR _wins$[ebp], 0
	je	$L1044
; Line 1386
	mov	eax, DWORD PTR _arg0$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L1045
; Line 1388
	mov	eax, DWORD PTR _arg0$[ebp]
	mov	eax, DWORD PTR [eax+24]
	not	eax
	push	eax
	mov	eax, DWORD PTR _arg0$[ebp]
	mov	eax, DWORD PTR [eax+20]
	not	eax
	push	eax
	call	_build_int_2
	add	esp, 8
	mov	DWORD PTR _t$[ebp], eax
; Line 1389
$L1045:
	mov	eax, DWORD PTR _type$[ebp]
	mov	ecx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 1390
	mov	eax, DWORD PTR _t$[ebp]
	push	eax
	call	_force_fit_type
	add	esp, 4
; Line 1392
$L1044:
	mov	eax, DWORD PTR _t$[ebp]
	jmp	$L996
; Line 1394
$L1046:
; Line 1395
	mov	eax, DWORD PTR _arg0$[ebp]
	push	eax
	call	_integer_zerop
	add	esp, 4
	or	eax, eax
	je	$L1047
; Line 1396
	mov	eax, DWORD PTR _arg1$[ebp]
	push	eax
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_convert
	add	esp, 8
	jmp	$L996
; Line 1397
$L1047:
	mov	eax, DWORD PTR _arg1$[ebp]
	push	eax
	call	_integer_zerop
	add	esp, 4
	or	eax, eax
	je	$L1048
; Line 1398
	mov	eax, DWORD PTR _arg0$[ebp]
	push	eax
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_convert
	add	esp, 8
	jmp	$L996
; Line 1399
$L1048:
$associate$1049:
; Line 1403
	mov	eax, DWORD PTR _type$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 6
	jne	$L1050
; Line 1404
	jmp	$binary$1051
; Line 1408
$L1050:
	cmp	DWORD PTR _wins$[ebp], 0
	jne	$L1052
; Line 1413
	lea	eax, DWORD PTR _varsign$1056[ebp]
	push	eax
	lea	eax, DWORD PTR _con$1054[ebp]
	push	eax
	lea	eax, DWORD PTR _var$1053[ebp]
	push	eax
	mov	eax, DWORD PTR _code$[ebp]
	push	eax
	mov	eax, DWORD PTR _arg0$[ebp]
	push	eax
	call	_split_tree
	add	esp, 20					; 00000014H
	or	eax, eax
	je	$L1057
; Line 1415
	cmp	DWORD PTR _varsign$1056[ebp], -1
	jne	$L1058
; Line 1419
	cmp	DWORD PTR _code$[ebp], 64		; 00000040H
	jne	$L1059
	mov	eax, DWORD PTR _arg1$[ebp]
	push	eax
	mov	eax, DWORD PTR _var$1053[ebp]
	push	eax
	call	_operand_equal_p
	add	esp, 8
	or	eax, eax
	je	$L1059
; Line 1420
	mov	eax, DWORD PTR _con$1054[ebp]
	push	eax
	mov	eax, DWORD PTR _t$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_convert
	add	esp, 8
	jmp	$L996
; Line 1423
$L1059:
	mov	eax, DWORD PTR _t$[ebp]
	mov	BYTE PTR [eax+12], 65			; 00000041H
; Line 1424
	mov	eax, DWORD PTR _var$1053[ebp]
	mov	ecx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 1426
	mov	eax, DWORD PTR _arg1$[ebp]
	push	eax
	mov	eax, DWORD PTR _con$1054[ebp]
	push	eax
	mov	eax, DWORD PTR _t$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _code$[ebp]
	push	eax
	call	_build
	add	esp, 16					; 00000010H
	push	eax
	call	_fold
	add	esp, 4
	mov	ecx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [ecx+24], eax
; Line 1428
	jmp	$L1060
$L1058:
; Line 1432
	cmp	DWORD PTR _code$[ebp], 65		; 00000041H
	jne	$L1061
	mov	eax, DWORD PTR _arg1$[ebp]
	push	eax
	mov	eax, DWORD PTR _var$1053[ebp]
	push	eax
	call	_operand_equal_p
	add	esp, 8
	or	eax, eax
	je	$L1061
; Line 1433
	mov	eax, DWORD PTR _con$1054[ebp]
	push	eax
	mov	eax, DWORD PTR _t$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_convert
	add	esp, 8
	jmp	$L996
; Line 1436
$L1061:
; Line 1437
	mov	eax, DWORD PTR _con$1054[ebp]
	push	eax
	mov	eax, DWORD PTR _arg1$[ebp]
	push	eax
	mov	eax, DWORD PTR _t$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _code$[ebp]
	push	eax
	call	_build
	add	esp, 16					; 00000010H
	push	eax
	call	_fold
	add	esp, 4
	mov	DWORD PTR _tem$1055[ebp], eax
	mov	eax, DWORD PTR _tem$1055[ebp]
	mov	ecx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 1438
	mov	eax, DWORD PTR _var$1053[ebp]
	mov	ecx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [ecx+24], eax
; Line 1440
	mov	eax, DWORD PTR _tem$1055[ebp]
	push	eax
	call	_integer_zerop
	add	esp, 4
	or	eax, eax
	je	$L1062
	cmp	DWORD PTR _code$[ebp], 64		; 00000040H
	je	$L1063
	cmp	DWORD PTR _code$[ebp], 65		; 00000041H
	jne	$L1062
$L1063:
; Line 1441
	mov	eax, DWORD PTR _var$1053[ebp]
	jmp	$L996
; Line 1446
$L1062:
; Line 1447
	mov	eax, DWORD PTR _tem$1055[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 65					; 00000041H
	jne	$L1064
	mov	eax, DWORD PTR _tem$1055[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L1064
; Line 1449
	mov	eax, DWORD PTR _tem$1055[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR _tem1$1065[ebp], eax
; Line 1450
	mov	eax, DWORD PTR _tem$1055[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	ecx, DWORD PTR _tem$1055[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 1451
	mov	eax, DWORD PTR _tem1$1065[ebp]
	mov	ecx, DWORD PTR _tem$1055[ebp]
	mov	DWORD PTR [ecx+24], eax
; Line 1453
	mov	eax, DWORD PTR _code$[ebp]
	sub	eax, 64					; 00000040H
	cmp	eax, 1
	sbb	eax, eax
	and	eax, 1
	add	eax, 64					; 00000040H
	mov	ecx, DWORD PTR _t$[ebp]
	mov	BYTE PTR [ecx+12], al
; Line 1455
$L1064:
$L1060:
; Line 1456
	mov	eax, DWORD PTR _t$[ebp]
	jmp	$L996
; Line 1459
$L1057:
	lea	eax, DWORD PTR _varsign$1056[ebp]
	push	eax
	lea	eax, DWORD PTR _con$1054[ebp]
	push	eax
	lea	eax, DWORD PTR _var$1053[ebp]
	push	eax
	mov	eax, DWORD PTR _code$[ebp]
	push	eax
	mov	eax, DWORD PTR _arg1$[ebp]
	push	eax
	call	_split_tree
	add	esp, 20					; 00000014H
	or	eax, eax
	je	$L1066
; Line 1462
	cmp	DWORD PTR _varsign$1056[ebp], -1
	jne	$L1067
; Line 1464
	mov	eax, DWORD PTR _code$[ebp]
	sub	eax, 64					; 00000040H
	cmp	eax, 1
	sbb	eax, eax
	and	eax, 1
	add	eax, 64					; 00000040H
	mov	ecx, DWORD PTR _t$[ebp]
	mov	BYTE PTR [ecx+12], al
; Line 1465
$L1067:
	mov	eax, DWORD PTR _t$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 65					; 00000041H
	jne	$L1068
	mov	eax, DWORD PTR _arg0$[ebp]
	push	eax
	mov	eax, DWORD PTR _var$1053[ebp]
	push	eax
	call	_operand_equal_p
	add	esp, 8
	or	eax, eax
	je	$L1068
; Line 1468
	cmp	DWORD PTR _code$[ebp], 64		; 00000040H
	jne	$L1069
; Line 1469
	mov	eax, DWORD PTR _con$1054[ebp]
	push	eax
	mov	eax, DWORD PTR _t$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_convert
	add	esp, 8
	jmp	$L996
; Line 1470
$L1069:
; Line 1471
	mov	eax, DWORD PTR _con$1054[ebp]
	push	eax
	mov	eax, DWORD PTR _t$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_convert
	add	esp, 8
	push	eax
	mov	eax, DWORD PTR _t$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	push	83					; 00000053H
	call	_build
	add	esp, 12					; 0000000cH
	push	eax
	call	_fold
	add	esp, 4
	jmp	$L996
; Line 1473
$L1068:
; Line 1474
	mov	eax, DWORD PTR _con$1054[ebp]
	push	eax
	mov	eax, DWORD PTR _arg0$[ebp]
	push	eax
	mov	eax, DWORD PTR _t$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _code$[ebp]
	push	eax
	call	_build
	add	esp, 16					; 00000010H
	push	eax
	call	_fold
	add	esp, 4
	mov	ecx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [ecx+24], eax
; Line 1475
	mov	eax, DWORD PTR _var$1053[ebp]
	mov	ecx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 1477
	mov	eax, DWORD PTR _t$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_integer_zerop
	add	esp, 4
	or	eax, eax
	je	$L1070
	mov	eax, DWORD PTR _t$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 64					; 00000040H
	jne	$L1070
; Line 1478
	mov	eax, DWORD PTR _var$1053[ebp]
	push	eax
	mov	eax, DWORD PTR _t$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_convert
	add	esp, 8
	jmp	$L996
; Line 1479
$L1070:
	mov	eax, DWORD PTR _t$[ebp]
	jmp	$L996
; Line 1481
$L1066:
; Line 1482
$L1052:
$binary$1051:
; Line 1488
	mov	DWORD PTR _t1$1071[ebp], 0
; Line 1489
	cmp	DWORD PTR _wins$[ebp], 0
	je	$L1072
; Line 1490
	mov	eax, DWORD PTR _arg1$[ebp]
	push	eax
	mov	eax, DWORD PTR _arg0$[ebp]
	push	eax
	mov	eax, DWORD PTR _code$[ebp]
	push	eax
	call	_combine
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _t1$1071[ebp], eax
; Line 1491
$L1072:
	cmp	DWORD PTR _t1$1071[ebp], 0
	je	$L1073
	mov	eax, DWORD PTR _t1$1071[ebp]
	jmp	$L996
; Line 1492
$L1073:
	mov	eax, DWORD PTR _t$[ebp]
	jmp	$L996
; Line 1495
$L1074:
; Line 1496
	cmp	DWORD PTR _wins$[ebp], 0
	jne	$L1075
	mov	eax, DWORD PTR _arg0$[ebp]
	push	eax
	call	_integer_zerop
	add	esp, 4
	or	eax, eax
	je	$L1075
; Line 1497
	mov	eax, DWORD PTR _arg1$[ebp]
	push	eax
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	push	83					; 00000053H
	call	_build
	add	esp, 12					; 0000000cH
	jmp	$L996
; Line 1498
$L1075:
	mov	eax, DWORD PTR _arg1$[ebp]
	push	eax
	call	_integer_zerop
	add	esp, 4
	or	eax, eax
	je	$L1076
; Line 1499
	mov	eax, DWORD PTR _arg0$[ebp]
	push	eax
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_convert
	add	esp, 8
	jmp	$L996
; Line 1501
$L1076:
	mov	eax, DWORD PTR _arg1$[ebp]
	push	eax
	mov	eax, DWORD PTR _arg0$[ebp]
	push	eax
	call	_operand_equal_p
	add	esp, 8
	or	eax, eax
	je	$L1077
; Line 1502
	mov	eax, DWORD PTR _integer_zero_node
	push	eax
	mov	eax, DWORD PTR _t$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_convert
	add	esp, 8
	jmp	$L996
; Line 1503
$L1077:
	jmp	$associate$1049
; Line 1505
$L1078:
; Line 1506
	cmp	DWORD PTR _loses$[ebp], 0
	jne	$L1079
	mov	eax, DWORD PTR _arg0$[ebp]
	push	eax
	call	_integer_zerop
	add	esp, 4
	or	eax, eax
	je	$L1079
; Line 1507
	mov	eax, DWORD PTR _arg0$[ebp]
	push	eax
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_convert
	add	esp, 8
	jmp	$L996
; Line 1508
$L1079:
	cmp	DWORD PTR _loses$[ebp], 0
	jne	$L1080
	mov	eax, DWORD PTR _arg1$[ebp]
	push	eax
	call	_integer_zerop
	add	esp, 4
	or	eax, eax
	je	$L1080
; Line 1509
	mov	eax, DWORD PTR _arg1$[ebp]
	push	eax
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_convert
	add	esp, 8
	jmp	$L996
; Line 1510
$L1080:
	mov	eax, DWORD PTR _arg0$[ebp]
	push	eax
	call	_integer_onep
	add	esp, 4
	or	eax, eax
	je	$L1081
; Line 1511
	mov	eax, DWORD PTR _arg1$[ebp]
	push	eax
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_convert
	add	esp, 8
	jmp	$L996
; Line 1512
$L1081:
	mov	eax, DWORD PTR _arg1$[ebp]
	push	eax
	call	_integer_onep
	add	esp, 4
	or	eax, eax
	je	$L1082
; Line 1513
	mov	eax, DWORD PTR _arg0$[ebp]
	push	eax
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_convert
	add	esp, 8
	jmp	$L996
; Line 1514
$L1082:
	jmp	$associate$1049
; Line 1516
$L1083:
; Line 1517
	cmp	DWORD PTR _loses$[ebp], 0
	jne	$L1084
	mov	eax, DWORD PTR _arg0$[ebp]
	push	eax
	call	_integer_all_onesp
	add	esp, 4
	or	eax, eax
	je	$L1084
; Line 1518
	mov	eax, DWORD PTR _arg0$[ebp]
	push	eax
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_convert
	add	esp, 8
	jmp	$L996
; Line 1519
$L1084:
	cmp	DWORD PTR _loses$[ebp], 0
	jne	$L1085
	mov	eax, DWORD PTR _arg1$[ebp]
	push	eax
	call	_integer_all_onesp
	add	esp, 4
	or	eax, eax
	je	$L1085
; Line 1520
	mov	eax, DWORD PTR _arg1$[ebp]
	push	eax
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_convert
	add	esp, 8
	jmp	$L996
; Line 1521
$L1085:
$L1086:
; Line 1522
	mov	eax, DWORD PTR _arg0$[ebp]
	push	eax
	call	_integer_zerop
	add	esp, 4
	or	eax, eax
	je	$L1087
; Line 1523
	mov	eax, DWORD PTR _arg1$[ebp]
	push	eax
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_convert
	add	esp, 8
	jmp	$L996
; Line 1524
$L1087:
	mov	eax, DWORD PTR _arg1$[ebp]
	push	eax
	call	_integer_zerop
	add	esp, 4
	or	eax, eax
	je	$L1088
; Line 1525
	mov	eax, DWORD PTR _arg0$[ebp]
	push	eax
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_convert
	add	esp, 8
	jmp	$L996
; Line 1526
$L1088:
	jmp	$associate$1049
; Line 1528
$L1089:
; Line 1529
	mov	eax, DWORD PTR _arg0$[ebp]
	push	eax
	call	_integer_all_onesp
	add	esp, 4
	or	eax, eax
	je	$L1090
; Line 1530
	mov	eax, DWORD PTR _arg1$[ebp]
	push	eax
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_convert
	add	esp, 8
	jmp	$L996
; Line 1531
$L1090:
	mov	eax, DWORD PTR _arg1$[ebp]
	push	eax
	call	_integer_all_onesp
	add	esp, 4
	or	eax, eax
	je	$L1091
; Line 1532
	mov	eax, DWORD PTR _arg0$[ebp]
	push	eax
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_convert
	add	esp, 8
	jmp	$L996
; Line 1533
$L1091:
	cmp	DWORD PTR _loses$[ebp], 0
	jne	$L1092
	mov	eax, DWORD PTR _arg0$[ebp]
	push	eax
	call	_integer_zerop
	add	esp, 4
	or	eax, eax
	je	$L1092
; Line 1534
	mov	eax, DWORD PTR _arg0$[ebp]
	push	eax
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_convert
	add	esp, 8
	jmp	$L996
; Line 1535
$L1092:
	cmp	DWORD PTR _loses$[ebp], 0
	jne	$L1093
	mov	eax, DWORD PTR _arg1$[ebp]
	push	eax
	call	_integer_zerop
	add	esp, 4
	or	eax, eax
	je	$L1093
; Line 1536
	mov	eax, DWORD PTR _arg1$[ebp]
	push	eax
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_convert
	add	esp, 8
	jmp	$L996
; Line 1538
$L1093:
; Line 1539
	mov	eax, DWORD PTR _arg0$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L1094
	mov	eax, DWORD PTR _arg1$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 113				; 00000071H
	jne	$L1094
	mov	eax, DWORD PTR _arg1$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 12					; 0000000cH
	test	al, 1
	je	$L1094
; Line 1541
	mov	eax, DWORD PTR _arg1$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _prec$1095[ebp], eax
; Line 1543
	cmp	DWORD PTR _prec$1095[ebp], 32		; 00000020H
	jge	$L1096
	mov	eax, DWORD PTR _arg0$[ebp]
	mov	eax, DWORD PTR [eax+20]
	not	eax
	mov	edx, 1
	mov	cl, BYTE PTR _prec$1095[ebp]
	shl	edx, cl
	dec	edx
	test	eax, edx
	jne	$L1096
; Line 1544
	mov	eax, DWORD PTR _arg1$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	push	113					; 00000071H
	call	_build
	add	esp, 12					; 0000000cH
	jmp	$L996
; Line 1545
$L1096:
; Line 1546
$L1094:
; Line 1547
	mov	eax, DWORD PTR _arg1$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L1097
	mov	eax, DWORD PTR _arg0$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 113				; 00000071H
	jne	$L1097
	mov	eax, DWORD PTR _arg0$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 12					; 0000000cH
	test	al, 1
	je	$L1097
; Line 1549
	mov	eax, DWORD PTR _arg0$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _prec$1098[ebp], eax
; Line 1551
	cmp	DWORD PTR _prec$1098[ebp], 32		; 00000020H
	jge	$L1099
	mov	eax, DWORD PTR _arg1$[ebp]
	mov	eax, DWORD PTR [eax+20]
	not	eax
	mov	edx, 1
	mov	cl, BYTE PTR _prec$1098[ebp]
	shl	edx, cl
	dec	edx
	test	eax, edx
	jne	$L1099
; Line 1552
	mov	eax, DWORD PTR _arg0$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	push	113					; 00000071H
	call	_build
	add	esp, 12					; 0000000cH
	jmp	$L996
; Line 1553
$L1099:
; Line 1554
$L1097:
	jmp	$associate$1049
; Line 1556
$L1100:
; Line 1557
	mov	eax, DWORD PTR _arg0$[ebp]
	push	eax
	call	_integer_all_onesp
	add	esp, 4
	or	eax, eax
	je	$L1101
; Line 1558
	mov	eax, DWORD PTR _arg1$[ebp]
	push	eax
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_convert
	add	esp, 8
	jmp	$L996
; Line 1559
$L1101:
	mov	eax, DWORD PTR _arg1$[ebp]
	push	eax
	call	_integer_zerop
	add	esp, 4
	or	eax, eax
	je	$L1102
; Line 1560
	mov	eax, DWORD PTR _arg0$[ebp]
	push	eax
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_convert
	add	esp, 8
	jmp	$L996
; Line 1561
$L1102:
	cmp	DWORD PTR _loses$[ebp], 0
	jne	$L1103
	mov	eax, DWORD PTR _arg0$[ebp]
	push	eax
	call	_integer_zerop
	add	esp, 4
	or	eax, eax
	je	$L1103
; Line 1562
	mov	eax, DWORD PTR _arg0$[ebp]
	push	eax
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_convert
	add	esp, 8
	jmp	$L996
; Line 1563
$L1103:
	cmp	DWORD PTR _loses$[ebp], 0
	jne	$L1104
	mov	eax, DWORD PTR _arg1$[ebp]
	push	eax
	call	_integer_all_onesp
	add	esp, 4
	or	eax, eax
	je	$L1104
; Line 1564
	mov	eax, DWORD PTR _arg1$[ebp]
	push	eax
	mov	eax, DWORD PTR _arg1$[ebp]
	push	eax
	mov	eax, DWORD PTR _code$[ebp]
	push	eax
	call	_combine
	add	esp, 12					; 0000000cH
	jmp	$L996
; Line 1565
$L1104:
	jmp	$binary$1051
; Line 1567
$L1105:
; Line 1573
	mov	eax, DWORD PTR _arg1$[ebp]
	push	eax
	call	_integer_onep
	add	esp, 4
	or	eax, eax
	je	$L1106
; Line 1574
	mov	eax, DWORD PTR _arg0$[ebp]
	push	eax
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_convert
	add	esp, 8
	jmp	$L996
; Line 1575
$L1106:
	mov	eax, DWORD PTR _arg1$[ebp]
	push	eax
	call	_integer_zerop
	add	esp, 4
	or	eax, eax
	je	$L1107
; Line 1576
	mov	eax, DWORD PTR _t$[ebp]
	jmp	$L996
; Line 1578
$L1107:
; Line 1579
	mov	eax, DWORD PTR _arg1$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 36					; 00000024H
	jne	$L1108
	mov	eax, DWORD PTR _arg1$[ebp]
	push	eax
	call	_real_zerop
	add	esp, 4
	or	eax, eax
	je	$L1108
; Line 1580
	mov	eax, DWORD PTR _t$[ebp]
	jmp	$L996
; Line 1583
$L1108:
	jmp	$binary$1051
; Line 1585
$L1109:
; Line 1589
	cmp	DWORD PTR _loses$[ebp], 0
	jne	$L1110
	mov	eax, DWORD PTR _arg1$[ebp]
	push	eax
	call	_integer_onep
	add	esp, 4
	or	eax, eax
	je	$L1110
; Line 1590
	mov	eax, DWORD PTR _arg1$[ebp]
	push	eax
	mov	eax, DWORD PTR _arg1$[ebp]
	push	eax
	mov	eax, DWORD PTR _code$[ebp]
	push	eax
	call	_combine
	add	esp, 12					; 0000000cH
	jmp	$L996
; Line 1591
$L1110:
	mov	eax, DWORD PTR _arg1$[ebp]
	push	eax
	call	_integer_zerop
	add	esp, 4
	or	eax, eax
	je	$L1111
; Line 1592
	mov	eax, DWORD PTR _t$[ebp]
	jmp	$L996
; Line 1593
$L1111:
	jmp	$binary$1051
; Line 1595
$L1112:
; Line 1599
	mov	eax, DWORD PTR _arg1$[ebp]
	push	eax
	call	_integer_zerop
	add	esp, 4
	or	eax, eax
	je	$L1113
; Line 1600
	mov	eax, DWORD PTR _arg0$[ebp]
	push	eax
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_convert
	add	esp, 8
	jmp	$L996
; Line 1601
$L1113:
	jmp	$binary$1051
; Line 1603
$L1114:
; Line 1604
	jmp	$associate$1049
; Line 1606
$L1115:
; Line 1611
	mov	eax, DWORD PTR _arg0$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L1116
; Line 1615
	mov	eax, DWORD PTR _arg0$[ebp]
	cmp	DWORD PTR [eax+20], 0
	jne	$L1217
	mov	eax, DWORD PTR _arg0$[ebp]
	cmp	DWORD PTR [eax+24], 0
	jne	$L1217
	mov	DWORD PTR -100+[ebp], 1
	jmp	$L1218
$L1217:
	mov	DWORD PTR -100+[ebp], 0
$L1218:
	push	0
	mov	eax, DWORD PTR -100+[ebp]
	push	eax
	call	_build_int_2
	add	esp, 8
	mov	DWORD PTR _t$[ebp], eax
; Line 1616
	mov	eax, DWORD PTR _integer_type_node
	mov	ecx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 1618
$L1116:
	mov	eax, DWORD PTR _t$[ebp]
	jmp	$L996
; Line 1620
$L1117:
; Line 1625
	mov	eax, DWORD PTR _arg0$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L1118
	mov	eax, DWORD PTR _arg0$[ebp]
	push	eax
	call	_integer_zerop
	add	esp, 4
	or	eax, eax
	je	$L1118
; Line 1626
	mov	eax, DWORD PTR _arg0$[ebp]
	jmp	$L996
; Line 1627
$L1118:
$L1119:
; Line 1629
	mov	eax, DWORD PTR _arg0$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L1120
	mov	eax, DWORD PTR _arg0$[ebp]
	push	eax
	call	_integer_zerop
	add	esp, 4
	or	eax, eax
	jne	$L1120
; Line 1630
	mov	eax, DWORD PTR _arg1$[ebp]
	jmp	$L996
; Line 1631
$L1120:
	mov	eax, DWORD PTR _arg1$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L1121
	mov	eax, DWORD PTR _arg1$[ebp]
	push	eax
	call	_integer_zerop
	add	esp, 4
	or	eax, eax
	jne	$L1121
; Line 1632
	mov	eax, DWORD PTR _arg0$[ebp]
	jmp	$L996
; Line 1634
$L1121:
	mov	eax, DWORD PTR _arg0$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L1122
	mov	eax, DWORD PTR _arg1$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L1122
; Line 1635
	mov	eax, DWORD PTR _arg0$[ebp]
	jmp	$L996
; Line 1636
$L1122:
	mov	eax, DWORD PTR _t$[ebp]
	jmp	$L996
; Line 1638
$L1123:
; Line 1643
	mov	eax, DWORD PTR _arg0$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L1124
	mov	eax, DWORD PTR _arg0$[ebp]
	push	eax
	call	_integer_zerop
	add	esp, 4
	or	eax, eax
	jne	$L1124
; Line 1644
	mov	eax, DWORD PTR _arg0$[ebp]
	jmp	$L996
; Line 1645
$L1124:
$L1125:
; Line 1647
	mov	eax, DWORD PTR _arg0$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L1126
	mov	eax, DWORD PTR _arg0$[ebp]
	push	eax
	call	_integer_zerop
	add	esp, 4
	or	eax, eax
	je	$L1126
; Line 1648
	mov	eax, DWORD PTR _arg1$[ebp]
	jmp	$L996
; Line 1649
$L1126:
	mov	eax, DWORD PTR _arg1$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L1127
	mov	eax, DWORD PTR _arg1$[ebp]
	push	eax
	call	_integer_zerop
	add	esp, 4
	or	eax, eax
	je	$L1127
; Line 1650
	mov	eax, DWORD PTR _arg0$[ebp]
	jmp	$L996
; Line 1652
$L1127:
	mov	eax, DWORD PTR _arg0$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L1128
	mov	eax, DWORD PTR _arg1$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L1128
; Line 1653
	mov	eax, DWORD PTR _arg0$[ebp]
	jmp	$L996
; Line 1654
$L1128:
	mov	eax, DWORD PTR _t$[ebp]
	jmp	$L996
; Line 1656
$L1129:
; Line 1664
	mov	eax, DWORD PTR _arg0$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L1130
	mov	eax, DWORD PTR _arg1$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	je	$L1130
; Line 1666
	mov	eax, DWORD PTR _arg1$[ebp]
	mov	ecx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [ecx+24], eax
; Line 1667
	mov	eax, DWORD PTR _arg0$[ebp]
	mov	ecx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 1668
	mov	eax, DWORD PTR _t$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _arg0$[ebp], eax
; Line 1669
	mov	eax, DWORD PTR _t$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR _arg1$[ebp], eax
; Line 1670
	mov	eax, DWORD PTR _code$[ebp]
	mov	DWORD PTR -116+[ebp], eax
	jmp	$L1131
; Line 1672
$L1135:
; Line 1673
	mov	DWORD PTR _code$[ebp], 102		; 00000066H
; Line 1674
	jmp	$L1132
; Line 1675
$L1136:
; Line 1676
	mov	DWORD PTR _code$[ebp], 103		; 00000067H
; Line 1677
	jmp	$L1132
; Line 1678
$L1137:
; Line 1679
	mov	DWORD PTR _code$[ebp], 104		; 00000068H
; Line 1680
	jmp	$L1132
; Line 1681
$L1138:
; Line 1682
	mov	DWORD PTR _code$[ebp], 105		; 00000069H
; Line 1683
	jmp	$L1132
; Line 1684
	jmp	$L1132
$L1131:
	cmp	DWORD PTR -116+[ebp], 102		; 00000066H
	je	$L1137
	cmp	DWORD PTR -116+[ebp], 103		; 00000067H
	je	$L1138
	cmp	DWORD PTR -116+[ebp], 104		; 00000068H
	je	$L1135
	cmp	DWORD PTR -116+[ebp], 105		; 00000069H
	je	$L1136
	jmp	$L1132
$L1132:
; Line 1685
	sub	al, al
	or	al, BYTE PTR _code$[ebp]
	mov	ecx, DWORD PTR _t$[ebp]
	mov	BYTE PTR [ecx+12], al
; Line 1691
$L1130:
; Line 1692
	mov	DWORD PTR _constop$1139[ebp], 0
; Line 1695
	mov	eax, DWORD PTR _arg1$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 6
	test	al, 1
	je	$L1142
; Line 1696
	mov	eax, DWORD PTR _t$[ebp]
	add	eax, 28					; 0000001cH
	mov	DWORD PTR _constoploc$1141[ebp], eax
	mov	eax, DWORD PTR _arg1$[ebp]
	mov	DWORD PTR _constop$1139[ebp], eax
	mov	eax, DWORD PTR _arg0$[ebp]
	mov	DWORD PTR _varop$1140[ebp], eax
; Line 1697
$L1142:
	mov	eax, DWORD PTR _arg0$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 6
	test	al, 1
	je	$L1143
; Line 1698
	mov	eax, DWORD PTR _t$[ebp]
	add	eax, 24					; 00000018H
	mov	DWORD PTR _constoploc$1141[ebp], eax
	mov	eax, DWORD PTR _arg0$[ebp]
	mov	DWORD PTR _constop$1139[ebp], eax
	mov	eax, DWORD PTR _arg1$[ebp]
	mov	DWORD PTR _varop$1140[ebp], eax
; Line 1700
$L1143:
	cmp	DWORD PTR _constop$1139[ebp], 0
	je	$L1144
	mov	eax, DWORD PTR _varop$1140[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 128				; 00000080H
	jne	$L1144
; Line 1704
	mov	eax, DWORD PTR _varop$1140[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	mov	eax, DWORD PTR _constop$1139[ebp]
	push	eax
	mov	eax, DWORD PTR _constop$1139[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	push	64					; 00000040H
	call	_build
	add	esp, 16					; 00000010H
	push	eax
	call	_fold
	add	esp, 4
	mov	DWORD PTR _newconst$1145[ebp], eax
; Line 1709
	mov	eax, DWORD PTR _varop$1140[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 11					; 0000000bH
	je	$L1147
	cmp	DWORD PTR _code$[ebp], 106		; 0000006aH
	je	$L1147
	cmp	DWORD PTR _code$[ebp], 107		; 0000006bH
	jne	$L1146
$L1147:
; Line 1711
	mov	eax, DWORD PTR _varop$1140[ebp]
	mov	BYTE PTR [eax+12], 126			; 0000007eH
; Line 1712
	mov	eax, DWORD PTR _newconst$1145[ebp]
	mov	ecx, DWORD PTR _constoploc$1141[ebp]
	mov	DWORD PTR [ecx], eax
; Line 1713
	mov	eax, DWORD PTR _t$[ebp]
	jmp	$L996
; Line 1715
$L1146:
; Line 1716
	jmp	$L1148
$L1144:
	cmp	DWORD PTR _constop$1139[ebp], 0
	je	$L1149
	mov	eax, DWORD PTR _varop$1140[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 127				; 0000007fH
	jne	$L1149
; Line 1720
	mov	eax, DWORD PTR _varop$1140[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	mov	eax, DWORD PTR _constop$1139[ebp]
	push	eax
	mov	eax, DWORD PTR _constop$1139[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	push	65					; 00000041H
	call	_build
	add	esp, 16					; 00000010H
	push	eax
	call	_fold
	add	esp, 4
	mov	DWORD PTR _newconst$1150[ebp], eax
; Line 1722
	mov	eax, DWORD PTR _varop$1140[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 11					; 0000000bH
	je	$L1152
	cmp	DWORD PTR _code$[ebp], 106		; 0000006aH
	je	$L1152
	cmp	DWORD PTR _code$[ebp], 107		; 0000006bH
	jne	$L1151
$L1152:
; Line 1724
	mov	eax, DWORD PTR _varop$1140[ebp]
	mov	BYTE PTR [eax+12], 125			; 0000007dH
; Line 1725
	mov	eax, DWORD PTR _newconst$1150[ebp]
	mov	ecx, DWORD PTR _constoploc$1141[ebp]
	mov	DWORD PTR [ecx], eax
; Line 1726
	mov	eax, DWORD PTR _t$[ebp]
	jmp	$L996
; Line 1728
$L1151:
; Line 1729
$L1149:
$L1148:
; Line 1734
	mov	eax, DWORD PTR _arg1$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L1154
	mov	eax, DWORD PTR _arg0$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	je	$L1154
	mov	eax, DWORD PTR _integer_one_node
	push	eax
	mov	eax, DWORD PTR _arg1$[ebp]
	push	eax
	call	_tree_int_cst_lt
	add	esp, 8
	or	eax, eax
	jne	$L1154
; Line 1736
	mov	eax, DWORD PTR _t$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR -120+[ebp], eax
	jmp	$L1155
; Line 1738
$L1159:
; Line 1739
	mov	DWORD PTR _code$[ebp], 104		; 00000068H
; Line 1740
	sub	al, al
	or	al, BYTE PTR _code$[ebp]
	mov	ecx, DWORD PTR _t$[ebp]
	mov	BYTE PTR [ecx+12], al
; Line 1741
	mov	eax, DWORD PTR _integer_one_node
	push	eax
	mov	eax, DWORD PTR _arg1$[ebp]
	push	eax
	push	65					; 00000041H
	call	_combine
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _arg1$[ebp], eax
; Line 1742
	mov	eax, DWORD PTR _arg1$[ebp]
	mov	ecx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 1743
	jmp	$L1156
; Line 1745
$L1160:
; Line 1746
	mov	DWORD PTR _code$[ebp], 103		; 00000067H
; Line 1747
	sub	al, al
	or	al, BYTE PTR _code$[ebp]
	mov	ecx, DWORD PTR _t$[ebp]
	mov	BYTE PTR [ecx+12], al
; Line 1748
	mov	eax, DWORD PTR _integer_one_node
	push	eax
	mov	eax, DWORD PTR _arg1$[ebp]
	push	eax
	push	65					; 00000041H
	call	_combine
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _arg1$[ebp], eax
; Line 1749
	mov	eax, DWORD PTR _arg1$[ebp]
	mov	ecx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 1750
	jmp	$L1156
$L1155:
	cmp	DWORD PTR -120+[ebp], 102		; 00000066H
	je	$L1160
	cmp	DWORD PTR -120+[ebp], 105		; 00000069H
	je	$L1159
	jmp	$L1156
$L1156:
; Line 1754
$L1154:
; Line 1757
	mov	eax, DWORD PTR _arg1$[ebp]
	push	eax
	call	_integer_zerop
	add	esp, 4
	or	eax, eax
	je	$L1161
	mov	eax, DWORD PTR _arg1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 5
	je	$L1162
	mov	eax, DWORD PTR _arg1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 11					; 0000000bH
	jne	$L1161
$L1162:
	mov	eax, DWORD PTR _arg1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 12					; 0000000cH
	test	al, 1
	je	$L1161
; Line 1759
	mov	eax, DWORD PTR _t$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR -124+[ebp], eax
	jmp	$L1163
; Line 1761
$L1167:
; Line 1762
	mov	eax, DWORD PTR _t$[ebp]
	mov	BYTE PTR [eax+12], 107			; 0000006bH
; Line 1763
	jmp	$L1164
; Line 1764
$L1168:
; Line 1765
	mov	eax, DWORD PTR _t$[ebp]
	mov	BYTE PTR [eax+12], 106			; 0000006aH
; Line 1766
	jmp	$L1164
; Line 1767
$L1169:
; Line 1769
	mov	eax, DWORD PTR _integer_one_node
	push	eax
	mov	eax, DWORD PTR _arg0$[ebp]
	push	eax
	mov	eax, DWORD PTR _integer_type_node
	push	eax
	push	53					; 00000035H
	call	_build
	add	esp, 16					; 00000010H
	jmp	$L996
; Line 1770
$L1170:
; Line 1772
	mov	eax, DWORD PTR _integer_zero_node
	push	eax
	mov	eax, DWORD PTR _arg0$[ebp]
	push	eax
	mov	eax, DWORD PTR _integer_type_node
	push	eax
	push	53					; 00000035H
	call	_build
	add	esp, 16					; 00000010H
	jmp	$L996
; Line 1773
	jmp	$L1164
$L1163:
	cmp	DWORD PTR -124+[ebp], 102		; 00000066H
	je	$L1170
	cmp	DWORD PTR -124+[ebp], 103		; 00000067H
	je	$L1168
	cmp	DWORD PTR -124+[ebp], 104		; 00000068H
	je	$L1167
	cmp	DWORD PTR -124+[ebp], 105		; 00000069H
	je	$L1169
	jmp	$L1164
$L1164:
; Line 1780
$L1161:
	cmp	DWORD PTR _code$[ebp], 103		; 00000067H
	je	$L1172
	cmp	DWORD PTR _code$[ebp], 104		; 00000068H
	jne	$L1171
$L1172:
; Line 1782
	mov	eax, DWORD PTR _arg0$[ebp]
	mov	DWORD PTR _temp$1173[ebp], eax
; Line 1783
	mov	eax, DWORD PTR _arg1$[ebp]
	mov	DWORD PTR _arg0$[ebp], eax
; Line 1784
	mov	eax, DWORD PTR _temp$1173[ebp]
	mov	DWORD PTR _arg1$[ebp], eax
; Line 1789
$L1171:
; Line 1790
	mov	eax, DWORD PTR _arg0$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L1174
	mov	eax, DWORD PTR _arg1$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L1174
; Line 1792
	cmp	DWORD PTR _code$[ebp], 106		; 0000006aH
	je	$L1176
	cmp	DWORD PTR _code$[ebp], 107		; 0000006bH
	jne	$L1175
$L1176:
; Line 1796
	mov	eax, DWORD PTR _arg1$[ebp]
	mov	ecx, DWORD PTR _arg0$[ebp]
	mov	ecx, DWORD PTR [ecx+20]
	cmp	DWORD PTR [eax+20], ecx
	jne	$L1219
	mov	eax, DWORD PTR _arg1$[ebp]
	mov	ecx, DWORD PTR _arg0$[ebp]
	mov	ecx, DWORD PTR [ecx+24]
	cmp	DWORD PTR [eax+24], ecx
	jne	$L1219
	mov	DWORD PTR -104+[ebp], 1
	jmp	$L1220
$L1219:
	mov	DWORD PTR -104+[ebp], 0
$L1220:
	push	0
	mov	eax, DWORD PTR -104+[ebp]
	push	eax
	call	_build_int_2
	add	esp, 8
	mov	DWORD PTR _t$[ebp], eax
; Line 1797
	jmp	$L1177
$L1175:
; Line 1801
	mov	eax, DWORD PTR _arg0$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 12					; 0000000cH
	test	al, 1
	je	$L1221
	mov	eax, DWORD PTR _arg1$[ebp]
	mov	ecx, DWORD PTR _arg0$[ebp]
	mov	ecx, DWORD PTR [ecx+24]
	cmp	DWORD PTR [eax+24], ecx
	ja	$L1225
	mov	eax, DWORD PTR _arg1$[ebp]
	mov	ecx, DWORD PTR _arg0$[ebp]
	mov	ecx, DWORD PTR [ecx+24]
	cmp	DWORD PTR [eax+24], ecx
	jne	$L1223
	mov	eax, DWORD PTR _arg1$[ebp]
	mov	ecx, DWORD PTR _arg0$[ebp]
	mov	ecx, DWORD PTR [ecx+20]
	cmp	DWORD PTR [eax+20], ecx
	jbe	$L1223
$L1225:
	mov	DWORD PTR -108+[ebp], 1
	jmp	$L1224
$L1223:
	mov	DWORD PTR -108+[ebp], 0
$L1224:
	jmp	$L1222
$L1221:
	mov	eax, DWORD PTR _arg1$[ebp]
	mov	ecx, DWORD PTR _arg0$[ebp]
	mov	ecx, DWORD PTR [ecx+24]
	cmp	DWORD PTR [eax+24], ecx
	jg	$L1228
	mov	eax, DWORD PTR _arg1$[ebp]
	mov	ecx, DWORD PTR _arg0$[ebp]
	mov	ecx, DWORD PTR [ecx+24]
	cmp	DWORD PTR [eax+24], ecx
	jne	$L1226
	mov	eax, DWORD PTR _arg1$[ebp]
	mov	ecx, DWORD PTR _arg0$[ebp]
	mov	ecx, DWORD PTR [ecx+20]
	cmp	DWORD PTR [eax+20], ecx
	jbe	$L1226
$L1228:
	mov	DWORD PTR -108+[ebp], 1
	jmp	$L1227
$L1226:
	mov	DWORD PTR -108+[ebp], 0
$L1227:
$L1222:
	push	0
	mov	eax, DWORD PTR -108+[ebp]
	push	eax
	call	_build_int_2
	add	esp, 8
	mov	DWORD PTR _t$[ebp], eax
$L1177:
; Line 1803
	jmp	$L1178
$L1174:
; Line 1806
	mov	eax, DWORD PTR _arg1$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L1179
	mov	eax, DWORD PTR _arg0$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 6
	test	al, 1
	je	$L1179
	mov	eax, DWORD PTR _arg0$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 116				; 00000074H
	jne	$L1179
	cmp	DWORD PTR _code$[ebp], 106		; 0000006aH
	je	$L1180
	cmp	DWORD PTR _code$[ebp], 107		; 0000006bH
	jne	$L1179
$L1180:
; Line 1808
	push	0
	push	0
	call	_build_int_2
	add	esp, 8
	mov	DWORD PTR _t$[ebp], eax
; Line 1810
	jmp	$L1181
$L1179:
; Line 1811
	mov	eax, DWORD PTR _arg0$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 36					; 00000024H
	jne	$L1182
	mov	eax, DWORD PTR _arg1$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 36					; 00000024H
	jne	$L1182
; Line 1813
	cmp	DWORD PTR _code$[ebp], 106		; 0000006aH
	je	$L1184
	cmp	DWORD PTR _code$[ebp], 107		; 0000006bH
	jne	$L1183
$L1184:
; Line 1816
	push	0
	mov	eax, DWORD PTR _arg1$[ebp]
	fld	QWORD PTR [eax+24]
	mov	eax, DWORD PTR _arg0$[ebp]
	fcomp	QWORD PTR [eax+24]
	fnstsw	ax
	test	ah, 64					; 00000040H
	mov	eax, 0
	setne	al
	push	eax
	call	_build_int_2
	add	esp, 8
	mov	DWORD PTR _t$[ebp], eax
; Line 1817
	jmp	$L1185
$L1183:
; Line 1820
	push	0
	mov	eax, DWORD PTR _arg1$[ebp]
	fld	QWORD PTR [eax+24]
	mov	eax, DWORD PTR _arg0$[ebp]
	fcomp	QWORD PTR [eax+24]
	fnstsw	ax
	test	ah, 65					; 00000041H
	mov	eax, 0
	sete	al
	push	eax
	call	_build_int_2
	add	esp, 8
	mov	DWORD PTR _t$[ebp], eax
$L1185:
; Line 1822
	jmp	$L1186
$L1182:
; Line 1823
	mov	eax, DWORD PTR _t$[ebp]
	jmp	$L996
$L1186:
$L1181:
$L1178:
; Line 1826
	cmp	DWORD PTR _code$[ebp], 105		; 00000069H
	je	$L1188
	cmp	DWORD PTR _code$[ebp], 103		; 00000067H
	je	$L1188
	cmp	DWORD PTR _code$[ebp], 107		; 0000006bH
	jne	$L1187
$L1188:
; Line 1827
	mov	eax, DWORD PTR _t$[ebp]
	xor	DWORD PTR [eax+20], 1
; Line 1828
$L1187:
	mov	eax, DWORD PTR _type$[ebp]
	mov	ecx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 1829
	mov	eax, DWORD PTR _t$[ebp]
	jmp	$L996
; Line 1831
$L1189:
; Line 1832
	mov	eax, DWORD PTR _arg0$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 6
	test	al, 1
	je	$L1190
; Line 1833
	mov	eax, DWORD PTR _arg0$[ebp]
	push	eax
	call	_integer_zerop
	add	esp, 4
	cmp	eax, 1
	sbb	eax, eax
	mov	ecx, DWORD PTR _expr$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+32]
	jmp	$L996
; Line 1834
$L1190:
	mov	eax, DWORD PTR _t$[ebp]
	jmp	$L996
; Line 1836
$L1191:
; Line 1837
	mov	eax, DWORD PTR _t$[ebp]
	jmp	$L996
; Line 1838
	jmp	$L1019
$L1018:
	sub	DWORD PTR -112+[ebp], 35		; 00000023H
	cmp	DWORD PTR -112+[ebp], 78		; 0000004eH
	ja	$L1191
	shl	DWORD PTR -112+[ebp], 2
	mov	eax, DWORD PTR -112+[ebp]
	jmp	DWORD PTR $L1229[eax]
$L1229:
	DD	OFFSET $L1022
	DD	OFFSET $L1022
	DD	OFFSET $L1022
	DD	OFFSET $L1022
	DD	OFFSET $L1191
	DD	OFFSET $L1191
	DD	OFFSET $L1023
	DD	OFFSET $L1191
	DD	OFFSET $L1191
	DD	OFFSET $L1191
	DD	OFFSET $L1191
	DD	OFFSET $L1191
	DD	OFFSET $L1191
	DD	OFFSET $L1191
	DD	OFFSET $L1191
	DD	OFFSET $L1191
	DD	OFFSET $L1191
	DD	OFFSET $L1022
	DD	OFFSET $L1191
	DD	OFFSET $L1191
	DD	OFFSET $L1191
	DD	OFFSET $L1191
	DD	OFFSET $L1191
	DD	OFFSET $L1191
	DD	OFFSET $L1191
	DD	OFFSET $L1189
	DD	OFFSET $L1191
	DD	OFFSET $L1191
	DD	OFFSET $L1191
	DD	OFFSET $L1046
	DD	OFFSET $L1074
	DD	OFFSET $L1078
	DD	OFFSET $L1105
	DD	OFFSET $L1105
	DD	OFFSET $L1105
	DD	OFFSET $L1105
	DD	OFFSET $L1109
	DD	OFFSET $L1109
	DD	OFFSET $L1109
	DD	OFFSET $L1109
	DD	OFFSET $L1105
	DD	OFFSET $L1105
	DD	OFFSET $L1024
	DD	OFFSET $L1191
	DD	OFFSET $L1191
	DD	OFFSET $L1191
	DD	OFFSET $L1024
	DD	OFFSET $L1191
	DD	OFFSET $L1027
	DD	OFFSET $L1114
	DD	OFFSET $L1114
	DD	OFFSET $L1034
	DD	OFFSET $L1191
	DD	OFFSET $L1112
	DD	OFFSET $L1112
	DD	OFFSET $L1112
	DD	OFFSET $L1112
	DD	OFFSET $L1083
	DD	OFFSET $L1086
	DD	OFFSET $L1089
	DD	OFFSET $L1100
	DD	OFFSET $L1043
	DD	OFFSET $L1117
	DD	OFFSET $L1123
	DD	OFFSET $L1119
	DD	OFFSET $L1125
	DD	OFFSET $L1115
	DD	OFFSET $L1129
	DD	OFFSET $L1129
	DD	OFFSET $L1129
	DD	OFFSET $L1129
	DD	OFFSET $L1129
	DD	OFFSET $L1129
	DD	OFFSET $L1191
	DD	OFFSET $L1191
	DD	OFFSET $L1191
	DD	OFFSET $L1026
	DD	OFFSET $L1024
	DD	OFFSET $L1024
$L1019:
; Line 1839
$L996:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_fold	ENDP
_TEXT	ENDS
END
