	TITLE	atof-ieee.c
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
_mask$S119 DD	00H
	DD	01H
	DD	03H
	DD	07H
	DD	0fH
	DD	01fH
	DD	03fH
	DD	07fH
	DD	0ffH
	DD	01ffH
	DD	03ffH
	DD	07ffH
	DD	0fffH
	DD	01fffH
	DD	03fffH
	DD	07fffH
	DD	0ffffH
	DD	01ffffH
	DD	03ffffH
	DD	07ffffH
	DD	0fffffH
	DD	01fffffH
	DD	03fffffH
	DD	07fffffH
	DD	0ffffffH
	DD	01ffffffH
	DD	03ffffffH
	DD	07ffffffH
	DD	0fffffffH
	DD	01fffffffH
	DD	03fffffffH
	DD	07fffffffH
	DD	0ffffffffH
_DATA	ENDS
_BSS	SEGMENT
_bits_left_in_littlenum$S120 DD 01H DUP (?)
_littlenums_left$S121 DD 01H DUP (?)
_littlenum_pointer$S122 DD 01H DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
; File atof-ieee.c
_number_of_bits$ = 8
_return_value$ = -4
_next_bits PROC NEAR
; Line 83
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 86
	cmp	DWORD PTR _littlenums_left$S121, 0
	jne	$L127
; Line 87
	sub	eax, eax
	jmp	$L125
; Line 88
$L127:
	mov	eax, DWORD PTR _bits_left_in_littlenum$S120
	cmp	DWORD PTR _number_of_bits$[ebp], eax
	jl	$L128
; Line 90
	mov	eax, DWORD PTR _bits_left_in_littlenum$S120
	mov	eax, DWORD PTR _mask$S119[eax*4]
	mov	ecx, DWORD PTR _littlenum_pointer$S122
	mov	cx, WORD PTR [ecx]
	and	ecx, 65535				; 0000ffffH
	and	eax, ecx
	mov	DWORD PTR _return_value$[ebp], eax
; Line 91
	sub	eax, eax
	sub	eax, DWORD PTR _bits_left_in_littlenum$S120
	neg	eax
	sub	DWORD PTR _number_of_bits$[ebp], eax
; Line 92
	mov	cl, BYTE PTR _number_of_bits$[ebp]
	shl	DWORD PTR _return_value$[ebp], cl
; Line 93
	dec	DWORD PTR _littlenums_left$S121
	je	$L129
; Line 94
	mov	eax, 16					; 00000010H
	sub	eax, DWORD PTR _number_of_bits$[ebp]
	mov	DWORD PTR _bits_left_in_littlenum$S120, eax
; Line 95
	sub	DWORD PTR _littlenum_pointer$S122, 2
; Line 96
	mov	eax, DWORD PTR _number_of_bits$[ebp]
	mov	eax, DWORD PTR _mask$S119[eax*4]
	mov	ecx, DWORD PTR _littlenum_pointer$S122
	xor	edx, edx
	mov	dx, WORD PTR [ecx]
	mov	cl, BYTE PTR _bits_left_in_littlenum$S120
	sar	edx, cl
	and	eax, edx
	or	eax, DWORD PTR _return_value$[ebp]
	mov	DWORD PTR _return_value$[ebp], eax
; Line 98
$L129:
; Line 99
	jmp	$L130
$L128:
; Line 101
	sub	eax, eax
	sub	eax, DWORD PTR _number_of_bits$[ebp]
	neg	eax
	sub	DWORD PTR _bits_left_in_littlenum$S120, eax
; Line 102
	mov	eax, DWORD PTR _number_of_bits$[ebp]
	mov	eax, DWORD PTR _mask$S119[eax*4]
	mov	ecx, DWORD PTR _littlenum_pointer$S122
	xor	edx, edx
	mov	dx, WORD PTR [ecx]
	mov	cl, BYTE PTR _bits_left_in_littlenum$S120
	sar	edx, cl
	and	eax, edx
	mov	DWORD PTR _return_value$[ebp], eax
; Line 103
$L130:
; Line 104
	mov	eax, DWORD PTR _return_value$[ebp]
	jmp	$L125
; Line 105
$L125:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_next_bits ENDP
_num$ = 8
_unget_bits PROC NEAR
; Line 110
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 111
	cmp	DWORD PTR _littlenums_left$S121, 0
	jne	$L134
; Line 112
	add	DWORD PTR _littlenum_pointer$S122, 2
; Line 113
	inc	DWORD PTR _littlenums_left$S121
; Line 114
	mov	eax, DWORD PTR _num$[ebp]
	mov	DWORD PTR _bits_left_in_littlenum$S120, eax
; Line 115
	jmp	$L135
$L134:
	mov	eax, DWORD PTR _num$[ebp]
	add	eax, DWORD PTR _bits_left_in_littlenum$S120
	cmp	eax, 16					; 00000010H
	jle	$L136
; Line 116
	mov	eax, DWORD PTR _num$[ebp]
	mov	ecx, 16					; 00000010H
	sub	ecx, DWORD PTR _bits_left_in_littlenum$S120
	sub	eax, ecx
	mov	DWORD PTR _bits_left_in_littlenum$S120, eax
; Line 117
	add	DWORD PTR _littlenum_pointer$S122, 2
; Line 118
	inc	DWORD PTR _littlenums_left$S121
; Line 119
	jmp	$L137
$L136:
; Line 120
	mov	eax, DWORD PTR _num$[ebp]
	add	DWORD PTR _bits_left_in_littlenum$S120, eax
$L137:
$L135:
; Line 121
$L133:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_unget_bits ENDP
_TEXT	ENDS
EXTRN	_as_warn:NEAR
_DATA	SEGMENT
$SG142	DB	'cannot create floating-point number', 00H
_DATA	ENDS
_TEXT	SEGMENT
_words$ = 8
_make_invalid_floating_point_number PROC NEAR
; Line 126
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 127
	push	OFFSET $SG142
	call	_as_warn
	add	esp, 4
; Line 128
	mov	eax, DWORD PTR _words$[ebp]
	mov	WORD PTR [eax], 65535			; 0000ffffH
; Line 129
	mov	eax, DWORD PTR _words$[ebp]
	mov	WORD PTR [eax+2], 65535			; 0000ffffH
; Line 130
	mov	eax, DWORD PTR _words$[ebp]
	mov	WORD PTR [eax+4], 65535			; 0000ffffH
; Line 131
	mov	eax, DWORD PTR _words$[ebp]
	mov	WORD PTR [eax+6], 65535			; 0000ffffH
; Line 132
	mov	eax, DWORD PTR _words$[ebp]
	mov	WORD PTR [eax+8], 65535			; 0000ffffH
; Line 133
	mov	eax, DWORD PTR _words$[ebp]
	mov	WORD PTR [eax+10], 65535		; 0000ffffH
; Line 134
$L140:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_make_invalid_floating_point_number ENDP
_TEXT	ENDS
PUBLIC	_atof_ieee
PUBLIC	_gen_to_words
EXTRN	_memset:NEAR
EXTRN	_atof_generic:NEAR
EXTRN	_generic_floating_point_number:BYTE
EXTRN	_EXP_CHARS:BYTE
_BSS	SEGMENT
_?bits@?1??atof_ieee@@9@9$S149 DW 0eH DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG164	DB	'.', 00H
_DATA	ENDS
_TEXT	SEGMENT
_str$ = 8
_what_kind$ = 12
_words$ = 16
_return_value$ = -12
_precision$ = -8
_exponent_bits$ = -4
_atof_ieee PROC NEAR
; Line 152
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 161
	mov	eax, DWORD PTR _str$[ebp]
	mov	DWORD PTR _return_value$[ebp], eax
; Line 162
	mov	eax, OFFSET _?bits@?1??atof_ieee@@9@9$S149
	add	eax, 12					; 0000000cH
	mov	DWORD PTR _generic_floating_point_number, eax
; Line 163
	mov	DWORD PTR _generic_floating_point_number+4, 0
; Line 164
	mov	DWORD PTR _generic_floating_point_number+8, 0
; Line 165
	mov	DWORD PTR _generic_floating_point_number+12, 0
; Line 166
	mov	BYTE PTR _generic_floating_point_number+16, 0
; Line 172
	push	12					; 0000000cH
	push	0
	push	OFFSET _?bits@?1??atof_ieee@@9@9$S149
	call	_memset
	add	esp, 12					; 0000000cH
; Line 174
	movsx	eax, BYTE PTR _what_kind$[ebp]
	mov	DWORD PTR -16+[ebp], eax
	jmp	$L154
; Line 175
$L158:
; Line 179
	mov	DWORD PTR _precision$[ebp], 2
; Line 180
	mov	DWORD PTR _exponent_bits$[ebp], 8
; Line 181
	jmp	$L155
; Line 183
$L159:
; Line 187
	mov	DWORD PTR _precision$[ebp], 4
; Line 188
	mov	DWORD PTR _exponent_bits$[ebp], 11	; 0000000bH
; Line 189
	jmp	$L155
; Line 191
$L160:
; Line 195
	mov	DWORD PTR _precision$[ebp], 6
; Line 196
	mov	DWORD PTR _exponent_bits$[ebp], 15	; 0000000fH
; Line 197
	jmp	$L155
; Line 199
$L161:
; Line 202
	mov	DWORD PTR _precision$[ebp], 6
; Line 203
	mov	DWORD PTR _exponent_bits$[ebp], -1
; Line 204
	jmp	$L155
; Line 206
$L162:
; Line 207
	mov	eax, DWORD PTR _words$[ebp]
	push	eax
	call	_make_invalid_floating_point_number
	add	esp, 4
; Line 208
	sub	eax, eax
	jmp	$L147
; Line 209
	jmp	$L155
$L154:
	sub	DWORD PTR -16+[ebp], 68			; 00000044H
	cmp	DWORD PTR -16+[ebp], 52			; 00000034H
	ja	$L162
	shl	DWORD PTR -16+[ebp], 2
	mov	eax, DWORD PTR -16+[ebp]
	jmp	DWORD PTR $L256[eax]
$L256:
	DD	OFFSET $L159
	DD	OFFSET $L160
	DD	OFFSET $L158
	DD	OFFSET $L162
	DD	OFFSET $L162
	DD	OFFSET $L162
	DD	OFFSET $L162
	DD	OFFSET $L162
	DD	OFFSET $L162
	DD	OFFSET $L162
	DD	OFFSET $L162
	DD	OFFSET $L162
	DD	OFFSET $L161
	DD	OFFSET $L162
	DD	OFFSET $L159
	DD	OFFSET $L158
	DD	OFFSET $L162
	DD	OFFSET $L162
	DD	OFFSET $L162
	DD	OFFSET $L162
	DD	OFFSET $L160
	DD	OFFSET $L162
	DD	OFFSET $L162
	DD	OFFSET $L162
	DD	OFFSET $L162
	DD	OFFSET $L162
	DD	OFFSET $L162
	DD	OFFSET $L162
	DD	OFFSET $L162
	DD	OFFSET $L162
	DD	OFFSET $L162
	DD	OFFSET $L162
	DD	OFFSET $L159
	DD	OFFSET $L160
	DD	OFFSET $L158
	DD	OFFSET $L162
	DD	OFFSET $L162
	DD	OFFSET $L162
	DD	OFFSET $L162
	DD	OFFSET $L162
	DD	OFFSET $L162
	DD	OFFSET $L162
	DD	OFFSET $L162
	DD	OFFSET $L162
	DD	OFFSET $L161
	DD	OFFSET $L162
	DD	OFFSET $L159
	DD	OFFSET $L158
	DD	OFFSET $L162
	DD	OFFSET $L162
	DD	OFFSET $L162
	DD	OFFSET $L162
	DD	OFFSET $L160
$L155:
; Line 211
	mov	eax, DWORD PTR _generic_floating_point_number
	mov	ecx, DWORD PTR _precision$[ebp]
	lea	eax, DWORD PTR [eax+ecx*2]
	add	eax, 2
	mov	DWORD PTR _generic_floating_point_number+4, eax
; Line 213
	push	OFFSET _generic_floating_point_number
	push	OFFSET _EXP_CHARS
	push	OFFSET $SG164
	lea	eax, DWORD PTR _return_value$[ebp]
	push	eax
	call	_atof_generic
	add	esp, 16					; 00000010H
	or	eax, eax
	je	$L163
; Line 215
	mov	eax, DWORD PTR _words$[ebp]
	push	eax
	call	_make_invalid_floating_point_number
	add	esp, 4
; Line 216
	sub	eax, eax
	jmp	$L147
; Line 218
$L163:
	mov	eax, DWORD PTR _exponent_bits$[ebp]
	push	eax
	mov	eax, DWORD PTR _precision$[ebp]
	push	eax
	mov	eax, DWORD PTR _words$[ebp]
	push	eax
	call	_gen_to_words
	add	esp, 12					; 0000000cH
; Line 219
	mov	eax, DWORD PTR _return_value$[ebp]
	jmp	$L147
; Line 220
$L147:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_atof_ieee ENDP
_prec_bits$196 = -36
_num_bits$197 = -40
_n$218 = -48
_tmp_bits$219 = -44
_carry$226 = -52
_words$ = 8
_precision$ = 12
_exponent_bits$ = 16
_return_value$ = -28
_exponent_1$ = -20
_exponent_2$ = -16
_exponent_3$ = -12
_exponent_4$ = -8
_exponent_skippage$ = -4
_carry$240 = -56
_word1$ = -32
_lp$ = -24
_gen_to_words PROC NEAR
; Line 227
	push	ebp
	mov	ebp, esp
	sub	esp, 56					; 00000038H
	push	ebx
	push	esi
	push	edi
; Line 228
	mov	DWORD PTR _return_value$[ebp], 0
; Line 238
	mov	eax, DWORD PTR _generic_floating_point_number
	cmp	DWORD PTR _generic_floating_point_number+8, eax
	jae	$L178
; Line 240
	movsx	eax, BYTE PTR _generic_floating_point_number+16
	cmp	eax, 43					; 0000002bH
	jne	$L179
; Line 241
	mov	eax, DWORD PTR _words$[ebp]
	mov	WORD PTR [eax], 0
; Line 242
	jmp	$L180
$L179:
; Line 243
	mov	eax, DWORD PTR _words$[ebp]
	mov	WORD PTR [eax], 32768			; 00008000H
$L180:
; Line 244
	mov	eax, DWORD PTR _precision$[ebp]
	lea	eax, DWORD PTR [eax*2-2]
	push	eax
	push	0
	mov	eax, DWORD PTR _words$[ebp]
	add	eax, 2
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 245
	mov	eax, DWORD PTR _return_value$[ebp]
	jmp	$L169
; Line 249
$L178:
	movsx	eax, BYTE PTR _generic_floating_point_number+16
	or	eax, eax
	jne	$L181
; Line 250
	cmp	DWORD PTR _precision$[ebp], 2
	jne	$L182
; Line 251
	mov	eax, DWORD PTR _words$[ebp]
	mov	WORD PTR [eax], 32767			; 00007fffH
; Line 252
	mov	eax, DWORD PTR _words$[ebp]
	mov	WORD PTR [eax+2], 65535			; 0000ffffH
; Line 253
	jmp	$L183
$L182:
; Line 254
	mov	eax, DWORD PTR _words$[ebp]
	mov	WORD PTR [eax], 32767			; 00007fffH
; Line 255
	mov	eax, DWORD PTR _words$[ebp]
	mov	WORD PTR [eax+2], 65535			; 0000ffffH
; Line 256
	mov	eax, DWORD PTR _words$[ebp]
	mov	WORD PTR [eax+4], 65535			; 0000ffffH
; Line 257
	mov	eax, DWORD PTR _words$[ebp]
	mov	WORD PTR [eax+6], 65535			; 0000ffffH
; Line 258
$L183:
; Line 259
	mov	eax, DWORD PTR _return_value$[ebp]
	jmp	$L169
; Line 260
	jmp	$L184
$L181:
	movsx	eax, BYTE PTR _generic_floating_point_number+16
	cmp	eax, 80					; 00000050H
	jne	$L185
; Line 262
	cmp	DWORD PTR _precision$[ebp], 2
	jne	$L186
; Line 263
	mov	eax, DWORD PTR _words$[ebp]
	mov	WORD PTR [eax], 32640			; 00007f80H
; Line 264
	mov	eax, DWORD PTR _words$[ebp]
	mov	WORD PTR [eax+2], 0
; Line 265
	jmp	$L187
$L186:
; Line 266
	mov	eax, DWORD PTR _words$[ebp]
	mov	WORD PTR [eax], 32752			; 00007ff0H
; Line 267
	mov	eax, DWORD PTR _words$[ebp]
	mov	WORD PTR [eax+2], 0
; Line 268
	mov	eax, DWORD PTR _words$[ebp]
	mov	WORD PTR [eax+4], 0
; Line 269
	mov	eax, DWORD PTR _words$[ebp]
	mov	WORD PTR [eax+6], 0
; Line 270
$L187:
; Line 271
	mov	eax, DWORD PTR _return_value$[ebp]
	jmp	$L169
; Line 272
	jmp	$L188
$L185:
	movsx	eax, BYTE PTR _generic_floating_point_number+16
	cmp	eax, 78					; 0000004eH
	jne	$L189
; Line 274
	cmp	DWORD PTR _precision$[ebp], 2
	jne	$L190
; Line 275
	mov	eax, DWORD PTR _words$[ebp]
	mov	WORD PTR [eax], 65408			; 0000ff80H
; Line 276
	mov	eax, DWORD PTR _words$[ebp]
	mov	WORD PTR [eax+2], 0
; Line 277
	jmp	$L191
$L190:
; Line 278
	mov	eax, DWORD PTR _words$[ebp]
	mov	WORD PTR [eax], 65520			; 0000fff0H
; Line 279
	mov	eax, DWORD PTR _words$[ebp]
	mov	WORD PTR [eax+2], 0
; Line 280
	mov	eax, DWORD PTR _words$[ebp]
	mov	WORD PTR [eax+4], 0
; Line 281
	mov	eax, DWORD PTR _words$[ebp]
	mov	WORD PTR [eax+6], 0
; Line 282
$L191:
; Line 283
	mov	eax, DWORD PTR _return_value$[ebp]
	jmp	$L169
; Line 295
$L189:
$L188:
$L184:
	mov	DWORD PTR _bits_left_in_littlenum$S120, 16 ; 00000010H
; Line 296
	mov	eax, DWORD PTR _generic_floating_point_number+8
	mov	DWORD PTR _littlenum_pointer$S122, eax
; Line 297
	mov	eax, DWORD PTR _generic_floating_point_number+8
	add	eax, 2
	sub	eax, DWORD PTR _generic_floating_point_number
	sar	eax, 1
	mov	DWORD PTR _littlenums_left$S121, eax
; Line 299
	mov	DWORD PTR _exponent_skippage$[ebp], 0
	jmp	$L192
$L193:
	inc	DWORD PTR _exponent_skippage$[ebp]
$L192:
	push	1
	call	_next_bits
	add	esp, 4
	or	eax, eax
	jne	$L194
; Line 300
	jmp	$L193
$L194:
; Line 302
	mov	eax, DWORD PTR _generic_floating_point_number+12
	add	eax, eax
	add	eax, DWORD PTR _generic_floating_point_number+8
	add	eax, 2
	sub	eax, DWORD PTR _generic_floating_point_number
	sar	eax, 1
	mov	DWORD PTR _exponent_1$[ebp], eax
; Line 304
	mov	eax, DWORD PTR _exponent_1$[ebp]
	shl	eax, 4
	mov	DWORD PTR _exponent_2$[ebp], eax
; Line 306
	mov	eax, DWORD PTR _exponent_2$[ebp]
	sub	eax, DWORD PTR _exponent_skippage$[ebp]
	mov	DWORD PTR _exponent_3$[ebp], eax
; Line 308
	mov	eax, 1
	mov	ecx, DWORD PTR _exponent_bits$[ebp]
	dec	ecx
	shl	eax, cl
	sub	eax, 2
	add	eax, DWORD PTR _exponent_3$[ebp]
	mov	DWORD PTR _exponent_4$[ebp], eax
; Line 311
	mov	eax, DWORD PTR _words$[ebp]
	mov	DWORD PTR _lp$[ebp], eax
; Line 314
	movsx	eax, BYTE PTR _generic_floating_point_number+16
	sub	eax, 43					; 0000002bH
	cmp	eax, 1
	cmc
	sbb	eax, eax
	and	eax, 32768				; 00008000H
	mov	WORD PTR _word1$[ebp], ax
; Line 317
	cmp	DWORD PTR _exponent_4$[ebp], 1
	jge	$L195
	cmp	DWORD PTR _exponent_4$[ebp], -62	; ffffffc2H
	jl	$L195
; Line 321
	push	1
	call	_unget_bits
	add	esp, 4
; Line 322
	mov	eax, DWORD PTR _exponent_4$[ebp]
	neg	eax
	mov	DWORD PTR _num_bits$197[ebp], eax
; Line 323
	mov	eax, DWORD PTR _precision$[ebp]
	shl	eax, 4
	mov	ecx, DWORD PTR _num_bits$197[ebp]
	add	ecx, DWORD PTR _exponent_bits$[ebp]
	inc	ecx
	sub	eax, ecx
	mov	DWORD PTR _prec_bits$196[ebp], eax
; Line 324
	cmp	DWORD PTR _precision$[ebp], 6
	jne	$L198
	cmp	DWORD PTR _exponent_bits$[ebp], 15	; 0000000fH
	jne	$L198
; Line 325
	sub	DWORD PTR _prec_bits$196[ebp], 17	; 00000011H
; Line 327
$L198:
	mov	eax, 16					; 00000010H
	sub	eax, DWORD PTR _exponent_bits$[ebp]
	cmp	eax, DWORD PTR _num_bits$197[ebp]
	jg	$L199
; Line 329
	sub	eax, eax
	mov	ecx, 15					; 0000000fH
	sub	ecx, DWORD PTR _exponent_bits$[ebp]
	sub	eax, ecx
	neg	eax
	sub	DWORD PTR _num_bits$197[ebp], eax
; Line 330
	mov	ax, WORD PTR _word1$[ebp]
	mov	ecx, DWORD PTR _lp$[ebp]
	mov	WORD PTR [ecx], ax
	add	DWORD PTR _lp$[ebp], 2
; Line 331
	mov	eax, DWORD PTR _num_bits$197[ebp]
	add	eax, DWORD PTR _exponent_bits$[ebp]
	inc	eax
	mov	ecx, DWORD PTR _precision$[ebp]
	shl	ecx, 4
	cmp	eax, ecx
	jl	$L200
; Line 333
	mov	eax, DWORD PTR _words$[ebp]
	push	eax
	call	_make_invalid_floating_point_number
	add	esp, 4
; Line 334
	mov	eax, DWORD PTR _return_value$[ebp]
	jmp	$L169
; Line 336
$L200:
	cmp	DWORD PTR _precision$[ebp], 6
	jne	$L201
	cmp	DWORD PTR _exponent_bits$[ebp], 15	; 0000000fH
	jne	$L201
; Line 337
	mov	eax, DWORD PTR _lp$[ebp]
	mov	WORD PTR [eax], 0
	add	DWORD PTR _lp$[ebp], 2
; Line 338
	mov	eax, DWORD PTR _lp$[ebp]
	mov	WORD PTR [eax], 0
	add	DWORD PTR _lp$[ebp], 2
; Line 339
	sub	DWORD PTR _num_bits$197[ebp], 15	; 0000000fH
; Line 341
$L201:
$L203:
	cmp	DWORD PTR _num_bits$197[ebp], 16	; 00000010H
	jl	$L204
; Line 342
	sub	DWORD PTR _num_bits$197[ebp], 16	; 00000010H
; Line 343
	mov	eax, DWORD PTR _lp$[ebp]
	mov	WORD PTR [eax], 0
	add	DWORD PTR _lp$[ebp], 2
; Line 344
	jmp	$L203
$L204:
; Line 345
	cmp	DWORD PTR _num_bits$197[ebp], 0
	je	$L205
; Line 346
	mov	eax, 16					; 00000010H
	sub	eax, DWORD PTR _num_bits$197[ebp]
	push	eax
	call	_next_bits
	add	esp, 4
	mov	ecx, DWORD PTR _lp$[ebp]
	mov	WORD PTR [ecx], ax
	add	DWORD PTR _lp$[ebp], 2
; Line 347
$L205:
	jmp	$L206
$L199:
; Line 348
	cmp	DWORD PTR _precision$[ebp], 6
	jne	$L207
	cmp	DWORD PTR _exponent_bits$[ebp], 15	; 0000000fH
	jne	$L207
; Line 349
	mov	ax, WORD PTR _word1$[ebp]
	mov	ecx, DWORD PTR _lp$[ebp]
	mov	WORD PTR [ecx], ax
	add	DWORD PTR _lp$[ebp], 2
; Line 350
	mov	eax, DWORD PTR _lp$[ebp]
	mov	WORD PTR [eax], 0
	add	DWORD PTR _lp$[ebp], 2
; Line 351
	cmp	DWORD PTR _num_bits$197[ebp], 16	; 00000010H
	jne	$L208
; Line 352
	mov	eax, DWORD PTR _lp$[ebp]
	mov	WORD PTR [eax], 0
	add	DWORD PTR _lp$[ebp], 2
; Line 353
	push	15					; 0000000fH
	call	_next_bits
	add	esp, 4
	mov	ecx, DWORD PTR _lp$[ebp]
	mov	WORD PTR [ecx], ax
	add	DWORD PTR _lp$[ebp], 2
; Line 354
	jmp	$L209
$L208:
	cmp	DWORD PTR _num_bits$197[ebp], 15	; 0000000fH
	jne	$L210
; Line 355
	mov	eax, DWORD PTR _lp$[ebp]
	mov	WORD PTR [eax], 0
	add	DWORD PTR _lp$[ebp], 2
; Line 356
	jmp	$L211
$L210:
; Line 357
	mov	eax, 15					; 0000000fH
	sub	eax, DWORD PTR _num_bits$197[ebp]
	push	eax
	call	_next_bits
	add	esp, 4
	mov	ecx, DWORD PTR _lp$[ebp]
	mov	WORD PTR [ecx], ax
	add	DWORD PTR _lp$[ebp], 2
$L211:
$L209:
; Line 358
	mov	DWORD PTR _num_bits$197[ebp], 0
; Line 359
	jmp	$L212
$L207:
; Line 360
	mov	eax, 15					; 0000000fH
	mov	ecx, DWORD PTR _num_bits$197[ebp]
	add	ecx, DWORD PTR _exponent_bits$[ebp]
	sub	eax, ecx
	push	eax
	call	_next_bits
	add	esp, 4
	mov	ecx, DWORD PTR _word1$[ebp]
	and	ecx, 65535				; 0000ffffH
	or	eax, ecx
	mov	WORD PTR _word1$[ebp], ax
; Line 361
	mov	ax, WORD PTR _word1$[ebp]
	mov	ecx, DWORD PTR _lp$[ebp]
	mov	WORD PTR [ecx], ax
	add	DWORD PTR _lp$[ebp], 2
; Line 362
$L212:
; Line 363
$L206:
; Line 364
$L214:
	mov	eax, DWORD PTR _precision$[ebp]
	add	eax, eax
	add	eax, DWORD PTR _words$[ebp]
	cmp	eax, DWORD PTR _lp$[ebp]
	jbe	$L215
; Line 365
	push	16					; 00000010H
	call	_next_bits
	add	esp, 4
	mov	ecx, DWORD PTR _lp$[ebp]
	mov	WORD PTR [ecx], ax
	add	DWORD PTR _lp$[ebp], 2
	jmp	$L214
$L215:
; Line 368
	push	1
	call	_next_bits
	add	esp, 4
	or	eax, eax
	je	$L216
; Line 369
	sub	DWORD PTR _lp$[ebp], 2
; Line 370
	cmp	DWORD PTR _prec_bits$196[ebp], 16	; 00000010H
	jle	$L217
; Line 371
	mov	DWORD PTR _n$218[ebp], 0
; Line 374
	mov	DWORD PTR _n$218[ebp], 0
; Line 375
	mov	eax, DWORD PTR _prec_bits$196[ebp]
	mov	DWORD PTR _tmp_bits$219[ebp], eax
; Line 376
$L221:
	cmp	DWORD PTR _tmp_bits$219[ebp], 16	; 00000010H
	jle	$L222
; Line 377
	mov	eax, DWORD PTR _n$218[ebp]
	mov	ecx, DWORD PTR _lp$[ebp]
	mov	ax, WORD PTR [ecx+eax*2]
	and	eax, 65535				; 0000ffffH
	cmp	eax, 65535				; 0000ffffH
	je	$L223
; Line 378
	jmp	$L222
; Line 379
$L223:
	dec	DWORD PTR _n$218[ebp]
; Line 380
	sub	DWORD PTR _tmp_bits$219[ebp], 16	; 00000010H
; Line 381
	jmp	$L221
$L222:
; Line 382
	cmp	DWORD PTR _tmp_bits$219[ebp], 16	; 00000010H
	jg	$L225
	mov	eax, DWORD PTR _n$218[ebp]
	mov	ecx, DWORD PTR _lp$[ebp]
	mov	ax, WORD PTR [ecx+eax*2]
	and	eax, 65535				; 0000ffffH
	mov	ecx, DWORD PTR _tmp_bits$219[ebp]
	and	eax, DWORD PTR _mask$S119[ecx*4]
	mov	ecx, DWORD PTR _tmp_bits$219[ebp]
	cmp	eax, DWORD PTR _mask$S119[ecx*4]
	je	$L224
$L225:
; Line 385
	mov	DWORD PTR _carry$226[ebp], 1
	jmp	$L227
$L228:
	sub	DWORD PTR _lp$[ebp], 2
$L227:
	cmp	DWORD PTR _carry$226[ebp], 0
	je	$L229
	mov	eax, DWORD PTR _lp$[ebp]
	cmp	DWORD PTR _words$[ebp], eax
	ja	$L229
; Line 386
	mov	eax, DWORD PTR _lp$[ebp]
	mov	ax, WORD PTR [eax]
	and	eax, 65535				; 0000ffffH
	add	DWORD PTR _carry$226[ebp], eax
; Line 387
	mov	eax, DWORD PTR _carry$226[ebp]
	mov	ecx, DWORD PTR _lp$[ebp]
	mov	WORD PTR [ecx], ax
; Line 388
	shr	DWORD PTR _carry$226[ebp], 16		; 00000010H
; Line 389
	jmp	$L228
$L229:
; Line 391
$L224:
	jmp	$L230
$L217:
	mov	eax, DWORD PTR _prec_bits$196[ebp]
	mov	eax, DWORD PTR _mask$S119[eax*4]
	mov	ecx, DWORD PTR _lp$[ebp]
	mov	cx, WORD PTR [ecx]
	and	ecx, 65535				; 0000ffffH
	and	eax, ecx
	mov	ecx, DWORD PTR _prec_bits$196[ebp]
	cmp	eax, DWORD PTR _mask$S119[ecx*4]
	je	$L231
; Line 392
	add	DWORD PTR _lp$[ebp], 2
; Line 393
$L231:
$L230:
; Line 395
$L216:
	mov	eax, DWORD PTR _return_value$[ebp]
	jmp	$L169
; Line 396
	jmp	$L232
$L195:
	mov	eax, DWORD PTR _exponent_bits$[ebp]
	mov	eax, DWORD PTR _mask$S119[eax*4]
	not	eax
	test	eax, DWORD PTR _exponent_4$[ebp]
	je	$L233
; Line 406
	mov	eax, DWORD PTR _words$[ebp]
	push	eax
	call	_make_invalid_floating_point_number
	add	esp, 4
; Line 407
	mov	eax, DWORD PTR _return_value$[ebp]
	jmp	$L169
; Line 408
	jmp	$L234
$L233:
; Line 410
	mov	eax, 15					; 0000000fH
	sub	eax, DWORD PTR _exponent_bits$[ebp]
	push	eax
	call	_next_bits
	add	esp, 4
	mov	edx, DWORD PTR _exponent_4$[ebp]
	mov	ebx, 15					; 0000000fH
	sub	ebx, DWORD PTR _exponent_bits$[ebp]
	mov	cl, bl
	shl	edx, cl
	or	eax, edx
	mov	ecx, DWORD PTR _word1$[ebp]
	and	ecx, 65535				; 0000ffffH
	or	eax, ecx
	mov	WORD PTR _word1$[ebp], ax
; Line 411
$L234:
$L232:
; Line 413
	mov	ax, WORD PTR _word1$[ebp]
	mov	ecx, DWORD PTR _lp$[ebp]
	mov	WORD PTR [ecx], ax
	add	DWORD PTR _lp$[ebp], 2
; Line 417
	cmp	DWORD PTR _exponent_bits$[ebp], 15	; 0000000fH
	jne	$L235
	cmp	DWORD PTR _precision$[ebp], 6
	jne	$L235
; Line 418
	mov	eax, DWORD PTR _lp$[ebp]
	mov	WORD PTR [eax], 0
	add	DWORD PTR _lp$[ebp], 2
; Line 419
	push	15					; 0000000fH
	call	_next_bits
	add	esp, 4
	or	eax, 65536				; 00010000H
	mov	ecx, DWORD PTR _lp$[ebp]
	mov	WORD PTR [ecx], ax
	add	DWORD PTR _lp$[ebp], 2
; Line 423
$L235:
$L237:
	mov	eax, DWORD PTR _precision$[ebp]
	add	eax, eax
	add	eax, DWORD PTR _words$[ebp]
	cmp	eax, DWORD PTR _lp$[ebp]
	jbe	$L238
; Line 424
	push	16					; 00000010H
	call	_next_bits
	add	esp, 4
	mov	ecx, DWORD PTR _lp$[ebp]
	mov	WORD PTR [ecx], ax
	add	DWORD PTR _lp$[ebp], 2
	jmp	$L237
$L238:
; Line 426
	push	1
	call	_next_bits
	add	esp, 4
	or	eax, eax
	je	$L239
; Line 445
	mov	DWORD PTR _carry$240[ebp], 1
	sub	DWORD PTR _lp$[ebp], 2
	jmp	$L241
$L242:
	sub	DWORD PTR _lp$[ebp], 2
$L241:
	cmp	DWORD PTR _carry$240[ebp], 0
	je	$L243
	mov	eax, DWORD PTR _lp$[ebp]
	cmp	DWORD PTR _words$[ebp], eax
	ja	$L243
; Line 446
	mov	eax, DWORD PTR _lp$[ebp]
	mov	ax, WORD PTR [eax]
	and	eax, 65535				; 0000ffffH
	add	DWORD PTR _carry$240[ebp], eax
; Line 447
	mov	eax, DWORD PTR _carry$240[ebp]
	mov	ecx, DWORD PTR _lp$[ebp]
	mov	WORD PTR [ecx], ax
; Line 448
	shr	DWORD PTR _carry$240[ebp], 16		; 00000010H
; Line 449
	jmp	$L242
$L243:
; Line 450
	mov	eax, DWORD PTR _words$[ebp]
	mov	ax, WORD PTR [eax]
	and	eax, 65535				; 0000ffffH
	mov	ecx, DWORD PTR _word1$[ebp]
	and	ecx, 65535				; 0000ffffH
	xor	eax, ecx
	test	ah, 128					; 00000080H
	je	$L244
; Line 455
	mov	eax, DWORD PTR _words$[ebp]
	mov	ax, WORD PTR [eax]
	and	eax, 32767				; 00007fffH
	mov	ecx, DWORD PTR _words$[ebp]
	mov	WORD PTR [ecx], ax
; Line 459
$L244:
; Line 460
$L239:
	mov	eax, DWORD PTR _return_value$[ebp]
	jmp	$L169
; Line 461
$L169:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_to_words ENDP
_TEXT	ENDS
PUBLIC	_int_to_gen
EXTRN	_sprintf:NEAR
_DATA	SEGMENT
	ORG $+2
$SG251	DB	'%ld', 00H
$SG253	DB	'.', 00H
	ORG $+2
$SG254	DB	'Error converting number to floating point (Exponent over'
	DB	'flow?)', 00H
_DATA	ENDS
_TEXT	SEGMENT
_x$ = 8
_buf$ = -20
_bufp$ = -24
_int_to_gen PROC NEAR
; Line 470
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	push	ebx
	push	esi
	push	edi
; Line 474
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	push	OFFSET $SG251
	lea	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_sprintf
	add	esp, 12					; 0000000cH
; Line 475
	lea	eax, DWORD PTR _buf$[ebp]
	mov	DWORD PTR _bufp$[ebp], eax
; Line 476
	push	OFFSET _generic_floating_point_number
	push	OFFSET _EXP_CHARS
	push	OFFSET $SG253
	lea	eax, DWORD PTR _bufp$[ebp]
	push	eax
	call	_atof_generic
	add	esp, 16					; 00000010H
	or	eax, eax
	je	$L252
; Line 477
	push	OFFSET $SG254
	call	_as_warn
	add	esp, 4
; Line 478
$L252:
$L247:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_int_to_gen ENDP
_TEXT	ENDS
END
