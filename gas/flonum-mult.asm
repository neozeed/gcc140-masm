	TITLE	flonum-mult.c
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
PUBLIC	_flonum_multip
_TEXT	SEGMENT
; File flonum-mult.c
_exponent$ = -48
_q$ = -44
_significant$ = -4
_P$ = -8
_N$ = -40
_A$ = -56
_B$ = -28
_a$ = 8
_b$ = 12
_product$ = 16
_size_of_a$ = -20
_size_of_b$ = -16
_size_of_product$ = -12
_size_of_sum$ = -32
_extra_product_positions$ = -36
_work$ = -24
_carry$ = -52
_flonum_multip PROC NEAR
; Line 80
	push	ebp
	mov	ebp, esp
	sub	esp, 56					; 00000038H
	push	ebx
	push	esi
	push	edi
; Line 97
	mov	eax, DWORD PTR _a$[ebp]
	movsx	eax, BYTE PTR [eax+16]
	cmp	eax, 45					; 0000002dH
	je	$L137
	mov	eax, DWORD PTR _a$[ebp]
	movsx	eax, BYTE PTR [eax+16]
	cmp	eax, 43					; 0000002bH
	jne	$L136
$L137:
	mov	eax, DWORD PTR _b$[ebp]
	movsx	eax, BYTE PTR [eax+16]
	cmp	eax, 45					; 0000002dH
	je	$L135
	mov	eax, DWORD PTR _b$[ebp]
	movsx	eax, BYTE PTR [eax+16]
	cmp	eax, 43					; 0000002bH
	je	$L135
$L136:
; Line 100
	mov	eax, DWORD PTR _product$[ebp]
	mov	BYTE PTR [eax+16], 0
; Line 101
	jmp	$L120
; Line 103
$L135:
	mov	eax, DWORD PTR _b$[ebp]
	movsx	eax, BYTE PTR [eax+16]
	mov	ecx, DWORD PTR _a$[ebp]
	movsx	ecx, BYTE PTR [ecx+16]
	sub	eax, ecx
	cmp	eax, 1
	sbb	eax, eax
	and	eax, -2					; fffffffeH
	add	eax, 45					; 0000002dH
	mov	ecx, DWORD PTR _product$[ebp]
	mov	BYTE PTR [ecx+16], al
; Line 104
	mov	eax, DWORD PTR _a$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _a$[ebp]
	sub	eax, DWORD PTR [ecx]
	sar	eax, 1
	mov	DWORD PTR _size_of_a$[ebp], eax
; Line 105
	mov	eax, DWORD PTR _b$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _b$[ebp]
	sub	eax, DWORD PTR [ecx]
	sar	eax, 1
	mov	DWORD PTR _size_of_b$[ebp], eax
; Line 106
	mov	eax, DWORD PTR _b$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	ecx, DWORD PTR _a$[ebp]
	add	eax, DWORD PTR [ecx+12]
	mov	DWORD PTR _exponent$[ebp], eax
; Line 107
	mov	eax, DWORD PTR _product$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _product$[ebp]
	sub	eax, DWORD PTR [ecx]
	sar	eax, 1
	mov	DWORD PTR _size_of_product$[ebp], eax
; Line 108
	mov	eax, DWORD PTR _size_of_b$[ebp]
	add	eax, DWORD PTR _size_of_a$[ebp]
	mov	DWORD PTR _size_of_sum$[ebp], eax
; Line 109
	mov	eax, DWORD PTR _size_of_product$[ebp]
	sub	eax, DWORD PTR _size_of_sum$[ebp]
	mov	DWORD PTR _extra_product_positions$[ebp], eax
; Line 110
	cmp	DWORD PTR _extra_product_positions$[ebp], 0
	jge	$L138
; Line 112
	mov	eax, DWORD PTR _extra_product_positions$[ebp]
	mov	DWORD PTR _P$[ebp], eax
; Line 113
	sub	eax, eax
	sub	eax, DWORD PTR _extra_product_positions$[ebp]
	neg	eax
	sub	DWORD PTR _exponent$[ebp], eax
; Line 115
	jmp	$L139
$L138:
; Line 117
	mov	DWORD PTR _P$[ebp], 0
; Line 118
$L139:
; Line 119
	mov	DWORD PTR _carry$[ebp], 0
; Line 120
	mov	DWORD PTR _significant$[ebp], 0
; Line 123
	mov	DWORD PTR _N$[ebp], 0
	jmp	$L140
$L141:
	inc	DWORD PTR _N$[ebp]
$L140:
	mov	eax, DWORD PTR _size_of_sum$[ebp]
	cmp	DWORD PTR _N$[ebp], eax
	jg	$L142
; Line 125
	mov	eax, DWORD PTR _carry$[ebp]
	mov	DWORD PTR _work$[ebp], eax
; Line 126
	mov	DWORD PTR _carry$[ebp], 0
; Line 129
	mov	DWORD PTR _A$[ebp], 0
	jmp	$L143
$L144:
	inc	DWORD PTR _A$[ebp]
$L143:
	mov	eax, DWORD PTR _N$[ebp]
	cmp	DWORD PTR _A$[ebp], eax
	jg	$L145
; Line 131
	mov	eax, DWORD PTR _N$[ebp]
	sub	eax, DWORD PTR _A$[ebp]
	mov	DWORD PTR _B$[ebp], eax
; Line 132
	mov	eax, DWORD PTR _size_of_a$[ebp]
	cmp	DWORD PTR _A$[ebp], eax
	jg	$L146
	mov	eax, DWORD PTR _B$[ebp]
	cmp	DWORD PTR _size_of_b$[ebp], eax
	jl	$L146
	cmp	DWORD PTR _B$[ebp], 0
	jl	$L146
; Line 137
	mov	eax, DWORD PTR _B$[ebp]
	mov	ecx, DWORD PTR _b$[ebp]
	mov	ecx, DWORD PTR [ecx]
	mov	ax, WORD PTR [ecx+eax*2]
	and	eax, 65535				; 0000ffffH
	mov	ecx, DWORD PTR _A$[ebp]
	mov	edx, DWORD PTR _a$[ebp]
	mov	edx, DWORD PTR [edx]
	mov	cx, WORD PTR [edx+ecx*2]
	and	ecx, 65535				; 0000ffffH
	imul	eax, ecx
	add	DWORD PTR _work$[ebp], eax
; Line 138
	mov	eax, DWORD PTR _work$[ebp]
	shr	eax, 16					; 00000010H
	add	DWORD PTR _carry$[ebp], eax
; Line 139
	and	DWORD PTR _work$[ebp], 65535		; 0000ffffH
; Line 144
$L146:
	jmp	$L144
$L145:
; Line 145
	mov	eax, DWORD PTR _significant$[ebp]
	or	eax, DWORD PTR _work$[ebp]
	mov	DWORD PTR _significant$[ebp], eax
; Line 146
	cmp	DWORD PTR _significant$[ebp], 0
	jne	$L148
	cmp	DWORD PTR _P$[ebp], 0
	jge	$L147
$L148:
; Line 148
	cmp	DWORD PTR _P$[ebp], 0
	jl	$L149
; Line 150
	mov	eax, DWORD PTR _work$[ebp]
	mov	ecx, DWORD PTR _P$[ebp]
	mov	edx, DWORD PTR _product$[ebp]
	mov	edx, DWORD PTR [edx]
	mov	WORD PTR [edx+ecx*2], ax
; Line 155
$L149:
	inc	DWORD PTR _P$[ebp]
; Line 157
	jmp	$L150
$L147:
; Line 159
	inc	DWORD PTR _extra_product_positions$[ebp]
; Line 160
	inc	DWORD PTR _exponent$[ebp]
; Line 161
$L150:
; Line 162
	jmp	$L141
$L142:
; Line 170
	cmp	DWORD PTR _carry$[ebp], 0
	je	$L151
; Line 172
	cmp	DWORD PTR _extra_product_positions$[ebp], 0
	jle	$L152
; Line 174
	mov	eax, DWORD PTR _carry$[ebp]
	mov	ecx, DWORD PTR _P$[ebp]
	mov	edx, DWORD PTR _product$[ebp]
	mov	edx, DWORD PTR [edx]
	mov	WORD PTR [edx+ecx*2], ax
; Line 176
	jmp	$L153
$L152:
; Line 180
	inc	DWORD PTR _exponent$[ebp]
; Line 181
	dec	DWORD PTR _P$[ebp]
; Line 184
	mov	eax, DWORD PTR _P$[ebp]
	add	eax, eax
	mov	ecx, DWORD PTR _product$[ebp]
	add	eax, DWORD PTR [ecx]
	mov	DWORD PTR _q$[ebp], eax
	jmp	$L154
$L155:
	sub	DWORD PTR _q$[ebp], 2
$L154:
	mov	eax, DWORD PTR _product$[ebp]
	mov	ecx, DWORD PTR _q$[ebp]
	cmp	DWORD PTR [eax], ecx
	ja	$L156
; Line 186
	mov	eax, DWORD PTR _q$[ebp]
	mov	ax, WORD PTR [eax]
	and	eax, 65535				; 0000ffffH
	mov	DWORD PTR _work$[ebp], eax
; Line 187
	mov	eax, DWORD PTR _carry$[ebp]
	mov	ecx, DWORD PTR _q$[ebp]
	mov	WORD PTR [ecx], ax
; Line 188
	mov	eax, DWORD PTR _work$[ebp]
	mov	DWORD PTR _carry$[ebp], eax
; Line 189
	jmp	$L155
$L156:
; Line 190
$L153:
; Line 192
	jmp	$L157
$L151:
; Line 194
	dec	DWORD PTR _P$[ebp]
; Line 195
$L157:
; Line 196
	mov	eax, DWORD PTR _P$[ebp]
	add	eax, eax
	mov	ecx, DWORD PTR _product$[ebp]
	add	eax, DWORD PTR [ecx]
	mov	ecx, DWORD PTR _product$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 197
	mov	eax, DWORD PTR _exponent$[ebp]
	mov	ecx, DWORD PTR _product$[ebp]
	mov	DWORD PTR [ecx+12], eax
; Line 198
$L120:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_flonum_multip ENDP
_TEXT	ENDS
END
