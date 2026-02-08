	TITLE	atof-generic.c
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
PUBLIC	_atof_generic
EXTRN	_abort:NEAR
EXTRN	___mb_cur_max:DWORD
EXTRN	_flonum_positive_powers_of_ten:BYTE
EXTRN	_flonum_negative_powers_of_ten:BYTE
EXTRN	_table_size_of_flonum_powers_of_ten:DWORD
EXTRN	_flonum_multip:NEAR
EXTRN	_flonum_copy:NEAR
EXTRN	_strchr:NEAR
EXTRN	__ftol:NEAR
EXTRN	__fltused:NEAR
EXTRN	__pctype:DWORD
EXTRN	__isctype:NEAR
EXTRN	_malloc:NEAR
EXTRN	_memset:NEAR
_DATA	SEGMENT
$SG220	DB	'+-', 00H
_DATA	ENDS
CONST	SEGMENT
$T289	DQ	04030000000000000H		; 16
$T290	DQ	0400a934f0979a371H		; 3.32193
$T291	DQ	04000000000000000H		; 2
$T293	DQ	03ff0000000000000H		; 1
CONST	ENDS
_TEXT	SEGMENT
; File atof-generic.c
_work$257 = -144
_power_binary_low$264 = -152
_decimal_exponent_is_negative$265 = -156
_temporary_flonum$266 = -180
_temporary_binary_low$267 = -148
_size_of_power_in_littlenums$268 = -160
_size_of_power_in_chars$269 = -184
_place_number_limit$271 = -196
_place_number$272 = -188
_multiplicand$273 = -192
_digits_exponent_sign_char$218 = -44
_address_of_string_pointer$ = 8
_string_of_decimal_marks$ = 12
_string_of_decimal_exponent_marks$ = 16
_address_of_generic_floating_point_number$ = 20
_digits_binary_low$230 = -104
_precision$231 = -72
_return_value$ = -12
_maximum_useful_digits$232 = -48
_first_digit$ = -24
_number_of_digits_to_use$233 = -108
_number_of_digits_before_decimal$ = -28
_more_than_enough_bits_for_digits$234 = -76
_number_of_digits_after_decimal$ = -4
_more_than_enough_littlenums_for_digits$235 = -116
_decimal_exponent$ = -8
_size_of_digits_in_littlenums$236 = -100
_number_of_digits_available$ = -20
_size_of_digits_in_chars$237 = -112
_digits_sign_char$ = -16
_power_of_10_flonum$238 = -96
_p$174 = -32
_digits_flonum$239 = -68
_c$175 = -36
_seen_significant_digit$176 = -40
_p$244 = -120
_c$245 = -124
_count$246 = -128
_carry$251 = -136
_littlenum_pointer$252 = -132
_littlenum_limit$253 = -140
_atof_generic PROC NEAR
; Line 91
	push	ebp
	mov	ebp, esp
	sub	esp, 220				; 000000dcH
	push	ebx
	push	esi
	push	edi
; Line 115
	mov	eax, DWORD PTR _address_of_string_pointer$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _first_digit$[ebp], eax
; Line 116
	mov	eax, DWORD PTR _first_digit$[ebp]
	mov	al, BYTE PTR [eax]
	mov	BYTE PTR _c$175[ebp], al
; Line 117
	movsx	eax, BYTE PTR _c$175[ebp]
	cmp	eax, 45					; 0000002dH
	je	$L178
	movsx	eax, BYTE PTR _c$175[ebp]
	cmp	eax, 43					; 0000002bH
	jne	$L177
$L178:
; Line 119
	mov	al, BYTE PTR _c$175[ebp]
	mov	BYTE PTR _digits_sign_char$[ebp], al
; Line 120
	inc	DWORD PTR _first_digit$[ebp]
; Line 122
	jmp	$L179
$L177:
; Line 123
	mov	BYTE PTR _digits_sign_char$[ebp], 43	; 0000002bH
$L179:
; Line 127
	mov	eax, DWORD PTR _first_digit$[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 110				; 0000006eH
	je	$L181
	mov	eax, DWORD PTR _first_digit$[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 78					; 0000004eH
	jne	$L180
$L181:
	mov	eax, DWORD PTR _first_digit$[ebp]
	movsx	eax, BYTE PTR [eax+1]
	cmp	eax, 97					; 00000061H
	je	$L182
	mov	eax, DWORD PTR _first_digit$[ebp]
	movsx	eax, BYTE PTR [eax+1]
	cmp	eax, 65					; 00000041H
	jne	$L180
$L182:
	mov	eax, DWORD PTR _first_digit$[ebp]
	movsx	eax, BYTE PTR [eax+2]
	cmp	eax, 110				; 0000006eH
	je	$L183
	mov	eax, DWORD PTR _first_digit$[ebp]
	movsx	eax, BYTE PTR [eax+2]
	cmp	eax, 78					; 0000004eH
	jne	$L180
$L183:
; Line 128
	mov	eax, DWORD PTR _address_of_generic_floating_point_number$[ebp]
	mov	BYTE PTR [eax+16], 0
; Line 129
	mov	eax, DWORD PTR _address_of_generic_floating_point_number$[ebp]
	mov	DWORD PTR [eax+12], 0
; Line 130
	mov	eax, DWORD PTR _address_of_generic_floating_point_number$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _address_of_generic_floating_point_number$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 131
	mov	eax, DWORD PTR _first_digit$[ebp]
	add	eax, 3
	mov	ecx, DWORD PTR _address_of_string_pointer$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 132
	sub	eax, eax
	jmp	$L166
; Line 134
$L180:
; Line 136
	mov	eax, DWORD PTR _first_digit$[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 105				; 00000069H
	je	$L185
	mov	eax, DWORD PTR _first_digit$[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 73					; 00000049H
	jne	$L184
$L185:
	mov	eax, DWORD PTR _first_digit$[ebp]
	movsx	eax, BYTE PTR [eax+1]
	cmp	eax, 110				; 0000006eH
	je	$L186
	mov	eax, DWORD PTR _first_digit$[ebp]
	movsx	eax, BYTE PTR [eax+1]
	cmp	eax, 78					; 0000004eH
	jne	$L184
$L186:
	mov	eax, DWORD PTR _first_digit$[ebp]
	movsx	eax, BYTE PTR [eax+2]
	cmp	eax, 102				; 00000066H
	je	$L187
	mov	eax, DWORD PTR _first_digit$[ebp]
	movsx	eax, BYTE PTR [eax+2]
	cmp	eax, 70					; 00000046H
	jne	$L184
$L187:
; Line 137
	movsx	eax, BYTE PTR _digits_sign_char$[ebp]
	sub	eax, 43					; 0000002bH
	cmp	eax, 1
	sbb	eax, eax
	and	eax, 2
	add	eax, 78					; 0000004eH
	mov	ecx, DWORD PTR _address_of_generic_floating_point_number$[ebp]
	mov	BYTE PTR [ecx+16], al
; Line 138
	mov	eax, DWORD PTR _address_of_generic_floating_point_number$[ebp]
	mov	DWORD PTR [eax+12], 0
; Line 139
	mov	eax, DWORD PTR _address_of_generic_floating_point_number$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _address_of_generic_floating_point_number$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 144
	mov	eax, DWORD PTR _first_digit$[ebp]
	movsx	eax, BYTE PTR [eax+3]
	cmp	eax, 105				; 00000069H
	je	$L189
	mov	eax, DWORD PTR _first_digit$[ebp]
	movsx	eax, BYTE PTR [eax+3]
	cmp	eax, 73					; 00000049H
	jne	$L188
$L189:
	mov	eax, DWORD PTR _first_digit$[ebp]
	movsx	eax, BYTE PTR [eax+4]
	cmp	eax, 110				; 0000006eH
	je	$L190
	mov	eax, DWORD PTR _first_digit$[ebp]
	movsx	eax, BYTE PTR [eax+4]
	cmp	eax, 78					; 0000004eH
	jne	$L188
$L190:
	mov	eax, DWORD PTR _first_digit$[ebp]
	movsx	eax, BYTE PTR [eax+5]
	cmp	eax, 105				; 00000069H
	je	$L191
	mov	eax, DWORD PTR _first_digit$[ebp]
	movsx	eax, BYTE PTR [eax+5]
	cmp	eax, 73					; 00000049H
	jne	$L188
$L191:
	mov	eax, DWORD PTR _first_digit$[ebp]
	movsx	eax, BYTE PTR [eax+6]
	cmp	eax, 116				; 00000074H
	je	$L192
	mov	eax, DWORD PTR _first_digit$[ebp]
	movsx	eax, BYTE PTR [eax+6]
	cmp	eax, 84					; 00000054H
	jne	$L188
$L192:
	mov	eax, DWORD PTR _first_digit$[ebp]
	movsx	eax, BYTE PTR [eax+7]
	cmp	eax, 121				; 00000079H
	je	$L193
	mov	eax, DWORD PTR _first_digit$[ebp]
	movsx	eax, BYTE PTR [eax+7]
	cmp	eax, 89					; 00000059H
	jne	$L188
$L193:
; Line 145
	mov	eax, DWORD PTR _first_digit$[ebp]
	add	eax, 8
	mov	ecx, DWORD PTR _address_of_string_pointer$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 146
	jmp	$L194
$L188:
; Line 147
	mov	eax, DWORD PTR _first_digit$[ebp]
	add	eax, 3
	mov	ecx, DWORD PTR _address_of_string_pointer$[ebp]
	mov	DWORD PTR [ecx], eax
$L194:
; Line 148
	sub	eax, eax
	jmp	$L166
; Line 151
$L184:
	mov	DWORD PTR _number_of_digits_before_decimal$[ebp], 0
; Line 152
	mov	DWORD PTR _number_of_digits_after_decimal$[ebp], 0
; Line 153
	mov	DWORD PTR _decimal_exponent$[ebp], 0
; Line 154
	mov	DWORD PTR _seen_significant_digit$176[ebp], 0
; Line 159
	mov	eax, DWORD PTR _first_digit$[ebp]
	mov	DWORD PTR _p$174[ebp], eax
	jmp	$L195
$L196:
	inc	DWORD PTR _p$174[ebp]
$L195:
	mov	eax, DWORD PTR _p$174[ebp]
	mov	al, BYTE PTR [eax]
	mov	BYTE PTR _c$175[ebp], al
	movsx	eax, BYTE PTR _c$175[ebp]
	or	eax, eax
	je	$L197
	movsx	eax, BYTE PTR _c$175[ebp]
	or	eax, eax
	je	$L198
	movsx	eax, BYTE PTR _c$175[ebp]
	push	eax
	mov	eax, DWORD PTR _string_of_decimal_marks$[ebp]
	push	eax
	call	_strchr
	add	esp, 8
	or	eax, eax
	jne	$L197
$L198:
	movsx	eax, BYTE PTR _c$175[ebp]
	or	eax, eax
	je	$L199
	movsx	eax, BYTE PTR _c$175[ebp]
	push	eax
	mov	eax, DWORD PTR _string_of_decimal_exponent_marks$[ebp]
	push	eax
	call	_strchr
	add	esp, 8
	or	eax, eax
	jne	$L197
$L199:
; Line 161
	cmp	DWORD PTR ___mb_cur_max, 1
	jle	$L281
	push	4
	movsx	eax, BYTE PTR _c$175[ebp]
	push	eax
	call	__isctype
	add	esp, 8
	mov	DWORD PTR -200+[ebp], eax
	jmp	$L282
$L281:
	movsx	eax, BYTE PTR _c$175[ebp]
	mov	ecx, DWORD PTR __pctype
	mov	ax, WORD PTR [ecx+eax*2]
	and	eax, 4
	mov	DWORD PTR -200+[ebp], eax
$L282:
	cmp	DWORD PTR -200+[ebp], 0
	je	$L200
; Line 163
	cmp	DWORD PTR _seen_significant_digit$176[ebp], 0
	jne	$L202
	movsx	eax, BYTE PTR _c$175[ebp]
	cmp	eax, 48					; 00000030H
	jle	$L201
$L202:
; Line 165
	inc	DWORD PTR _number_of_digits_before_decimal$[ebp]
; Line 166
	mov	DWORD PTR _seen_significant_digit$176[ebp], 1
; Line 168
	jmp	$L203
$L201:
; Line 170
	inc	DWORD PTR _first_digit$[ebp]
; Line 171
$L203:
; Line 173
	jmp	$L204
$L200:
; Line 175
	jmp	$L197
; Line 176
$L204:
; Line 177
	jmp	$L196
$L197:
; Line 178
	movsx	eax, BYTE PTR _c$175[ebp]
	or	eax, eax
	je	$L205
	movsx	eax, BYTE PTR _c$175[ebp]
	push	eax
	mov	eax, DWORD PTR _string_of_decimal_marks$[ebp]
	push	eax
	call	_strchr
	add	esp, 8
	or	eax, eax
	je	$L205
; Line 183
	inc	DWORD PTR _p$174[ebp]
	jmp	$L206
$L207:
	inc	DWORD PTR _p$174[ebp]
$L206:
	mov	eax, DWORD PTR _p$174[ebp]
	mov	al, BYTE PTR [eax]
	mov	BYTE PTR _c$175[ebp], al
	movsx	eax, BYTE PTR _c$175[ebp]
	or	eax, eax
	je	$L208
	movsx	eax, BYTE PTR _c$175[ebp]
	or	eax, eax
	je	$L209
	movsx	eax, BYTE PTR _c$175[ebp]
	push	eax
	mov	eax, DWORD PTR _string_of_decimal_exponent_marks$[ebp]
	push	eax
	call	_strchr
	add	esp, 8
	or	eax, eax
	jne	$L208
$L209:
; Line 185
	cmp	DWORD PTR ___mb_cur_max, 1
	jle	$L283
	push	4
	movsx	eax, BYTE PTR _c$175[ebp]
	push	eax
	call	__isctype
	add	esp, 8
	mov	DWORD PTR -204+[ebp], eax
	jmp	$L284
$L283:
	movsx	eax, BYTE PTR _c$175[ebp]
	mov	ecx, DWORD PTR __pctype
	mov	ax, WORD PTR [ecx+eax*2]
	and	eax, 4
	mov	DWORD PTR -204+[ebp], eax
$L284:
	cmp	DWORD PTR -204+[ebp], 0
	je	$L210
; Line 187
	inc	DWORD PTR _number_of_digits_after_decimal$[ebp]
; Line 188
	movsx	eax, BYTE PTR _c$175[ebp]
	cmp	eax, 48					; 00000030H
	jle	$L211
; Line 190
	mov	DWORD PTR _seen_significant_digit$176[ebp], 1
; Line 192
$L211:
; Line 193
	jmp	$L212
$L210:
; Line 195
	cmp	DWORD PTR _seen_significant_digit$176[ebp], 0
	jne	$L213
; Line 197
	mov	DWORD PTR _number_of_digits_after_decimal$[ebp], 0
; Line 199
$L213:
	jmp	$L208
; Line 200
$L212:
; Line 201
	jmp	$L207
$L208:
; Line 203
$L205:
$L215:
	cmp	DWORD PTR _number_of_digits_after_decimal$[ebp], 0
	je	$L216
	mov	eax, DWORD PTR _number_of_digits_after_decimal$[ebp]
	add	eax, DWORD PTR _number_of_digits_before_decimal$[ebp]
	mov	ecx, DWORD PTR _first_digit$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 48					; 00000030H
	jne	$L216
; Line 204
	dec	DWORD PTR _number_of_digits_after_decimal$[ebp]
	jmp	$L215
$L216:
; Line 207
	movsx	eax, BYTE PTR _c$175[ebp]
	or	eax, eax
	je	$L217
	movsx	eax, BYTE PTR _c$175[ebp]
	push	eax
	mov	eax, DWORD PTR _string_of_decimal_exponent_marks$[ebp]
	push	eax
	call	_strchr
	add	esp, 8
	or	eax, eax
	je	$L217
; Line 211
	inc	DWORD PTR _p$174[ebp]
	mov	eax, DWORD PTR _p$174[ebp]
	mov	al, BYTE PTR [eax]
	mov	BYTE PTR _c$175[ebp], al
; Line 212
	movsx	eax, BYTE PTR _c$175[ebp]
	or	eax, eax
	je	$L219
	movsx	eax, BYTE PTR _c$175[ebp]
	push	eax
	push	OFFSET $SG220
	call	_strchr
	add	esp, 8
	or	eax, eax
	je	$L219
; Line 214
	mov	al, BYTE PTR _c$175[ebp]
	mov	BYTE PTR _digits_exponent_sign_char$218[ebp], al
; Line 215
	inc	DWORD PTR _p$174[ebp]
	mov	eax, DWORD PTR _p$174[ebp]
	mov	al, BYTE PTR [eax]
	mov	BYTE PTR _c$175[ebp], al
; Line 217
	jmp	$L221
$L219:
; Line 219
	mov	BYTE PTR _digits_exponent_sign_char$218[ebp], 43 ; 0000002bH
; Line 220
$L221:
; Line 223
	jmp	$L222
$L223:
	inc	DWORD PTR _p$174[ebp]
	mov	eax, DWORD PTR _p$174[ebp]
	mov	al, BYTE PTR [eax]
	mov	BYTE PTR _c$175[ebp], al
$L222:
	movsx	eax, BYTE PTR _c$175[ebp]
	or	eax, eax
	je	$L224
; Line 225
	cmp	DWORD PTR ___mb_cur_max, 1
	jle	$L285
	push	4
	movsx	eax, BYTE PTR _c$175[ebp]
	push	eax
	call	__isctype
	add	esp, 8
	mov	DWORD PTR -208+[ebp], eax
	jmp	$L286
$L285:
	movsx	eax, BYTE PTR _c$175[ebp]
	mov	ecx, DWORD PTR __pctype
	mov	ax, WORD PTR [ecx+eax*2]
	and	eax, 4
	mov	DWORD PTR -208+[ebp], eax
$L286:
	cmp	DWORD PTR -208+[ebp], 0
	je	$L225
; Line 227
	movsx	eax, BYTE PTR _c$175[ebp]
	mov	ecx, DWORD PTR _decimal_exponent$[ebp]
	lea	ecx, DWORD PTR [ecx+ecx*4]
	lea	eax, DWORD PTR [eax+ecx*2]
	sub	eax, 48					; 00000030H
	mov	DWORD PTR _decimal_exponent$[ebp], eax
; Line 232
	jmp	$L226
$L225:
; Line 234
	jmp	$L224
; Line 235
$L226:
; Line 236
	jmp	$L223
$L224:
; Line 237
	movsx	eax, BYTE PTR _digits_exponent_sign_char$218[ebp]
	cmp	eax, 45					; 0000002dH
	jne	$L227
; Line 239
	mov	eax, DWORD PTR _decimal_exponent$[ebp]
	neg	eax
	mov	DWORD PTR _decimal_exponent$[ebp], eax
; Line 241
$L227:
; Line 242
$L217:
	mov	eax, DWORD PTR _p$174[ebp]
	mov	ecx, DWORD PTR _address_of_string_pointer$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 247
	mov	eax, DWORD PTR _number_of_digits_after_decimal$[ebp]
	add	eax, DWORD PTR _number_of_digits_before_decimal$[ebp]
	mov	DWORD PTR _number_of_digits_available$[ebp], eax
; Line 248
	mov	DWORD PTR _return_value$[ebp], 0
; Line 249
	cmp	DWORD PTR _number_of_digits_available$[ebp], 0
	jne	$L228
; Line 251
	mov	eax, DWORD PTR _address_of_generic_floating_point_number$[ebp]
	mov	DWORD PTR [eax+12], 0
; Line 253
	mov	eax, DWORD PTR _address_of_generic_floating_point_number$[ebp]
	mov	eax, DWORD PTR [eax]
	sub	eax, 2
	mov	ecx, DWORD PTR _address_of_generic_floating_point_number$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 254
	mov	al, BYTE PTR _digits_sign_char$[ebp]
	mov	ecx, DWORD PTR _address_of_generic_floating_point_number$[ebp]
	mov	BYTE PTR [ecx+16], al
; Line 257
	jmp	$L229
$L228:
; Line 274
	mov	eax, DWORD PTR _address_of_generic_floating_point_number$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _address_of_generic_floating_point_number$[ebp]
	sub	eax, DWORD PTR [ecx]
	sar	eax, 1
	inc	eax
	mov	DWORD PTR _precision$231[ebp], eax
; Line 280
	mov	eax, DWORD PTR _precision$231[ebp]
	sub	eax, 2
	mov	DWORD PTR -216+[ebp], eax
	fild	DWORD PTR -216+[ebp]
	fmul	QWORD PTR $T289
	fdiv	QWORD PTR $T290
	fadd	QWORD PTR $T291
	call	__ftol
	mov	DWORD PTR _maximum_useful_digits$232[ebp], eax
; Line 281
	mov	eax, DWORD PTR _number_of_digits_available$[ebp]
	cmp	DWORD PTR _maximum_useful_digits$232[ebp], eax
	jge	$L240
; Line 283
	mov	eax, DWORD PTR _maximum_useful_digits$232[ebp]
	mov	DWORD PTR _number_of_digits_to_use$233[ebp], eax
; Line 285
	jmp	$L241
$L240:
; Line 287
	mov	eax, DWORD PTR _number_of_digits_available$[ebp]
	mov	DWORD PTR _number_of_digits_to_use$233[ebp], eax
; Line 288
$L241:
; Line 289
	mov	eax, DWORD PTR _number_of_digits_before_decimal$[ebp]
	sub	eax, DWORD PTR _number_of_digits_to_use$233[ebp]
	add	DWORD PTR _decimal_exponent$[ebp], eax
; Line 292
	mov	eax, DWORD PTR _number_of_digits_to_use$233[ebp]
	mov	DWORD PTR -220+[ebp], eax
	fild	DWORD PTR -220+[ebp]
	fmul	QWORD PTR $T290
	fadd	QWORD PTR $T293
	call	__ftol
	mov	DWORD PTR _more_than_enough_bits_for_digits$234[ebp], eax
; Line 297
	mov	eax, DWORD PTR _more_than_enough_bits_for_digits$234[ebp]
	cdq
	and	edx, 15					; 0000000fH
	add	eax, edx
	sar	eax, 4
	add	eax, 2
	mov	DWORD PTR _more_than_enough_littlenums_for_digits$235[ebp], eax
; Line 309
	mov	eax, DWORD PTR _more_than_enough_littlenums_for_digits$235[ebp]
	mov	DWORD PTR _size_of_digits_in_littlenums$236[ebp], eax
; Line 311
	mov	eax, DWORD PTR _size_of_digits_in_littlenums$236[ebp]
	add	eax, eax
	mov	DWORD PTR _size_of_digits_in_chars$237[ebp], eax
; Line 313
	mov	eax, DWORD PTR _size_of_digits_in_chars$237[ebp]
	push	eax
	call	_malloc
	add	esp, 4
	mov	DWORD PTR _digits_binary_low$230[ebp], eax
; Line 314
	mov	eax, DWORD PTR _size_of_digits_in_chars$237[ebp]
	push	eax
	push	0
	mov	eax, DWORD PTR _digits_binary_low$230[ebp]
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 333
	mov	eax, DWORD PTR _first_digit$[ebp]
	mov	DWORD PTR _p$244[ebp], eax
	mov	eax, DWORD PTR _number_of_digits_to_use$233[ebp]
	mov	DWORD PTR _count$246[ebp], eax
	jmp	$L247
$L248:
	inc	DWORD PTR _p$244[ebp]
	dec	DWORD PTR _count$246[ebp]
$L247:
	cmp	DWORD PTR _count$246[ebp], 0
	je	$L249
; Line 335
	mov	eax, DWORD PTR _p$244[ebp]
	mov	al, BYTE PTR [eax]
	mov	BYTE PTR _c$245[ebp], al
; Line 336
	cmp	DWORD PTR ___mb_cur_max, 1
	jle	$L287
	push	4
	movsx	eax, BYTE PTR _c$245[ebp]
	push	eax
	call	__isctype
	add	esp, 8
	mov	DWORD PTR -212+[ebp], eax
	jmp	$L288
$L287:
	movsx	eax, BYTE PTR _c$245[ebp]
	mov	ecx, DWORD PTR __pctype
	mov	ax, WORD PTR [ecx+eax*2]
	and	eax, 4
	mov	DWORD PTR -212+[ebp], eax
$L288:
	cmp	DWORD PTR -212+[ebp], 0
	je	$L250
; Line 350
	mov	eax, DWORD PTR _more_than_enough_littlenums_for_digits$235[ebp]
	add	eax, eax
	add	eax, DWORD PTR _digits_binary_low$230[ebp]
	sub	eax, 2
	mov	DWORD PTR _littlenum_limit$253[ebp], eax
; Line 351
	movsx	eax, BYTE PTR _c$245[ebp]
	sub	eax, 48					; 00000030H
	mov	DWORD PTR _carry$251[ebp], eax
; Line 354
	mov	eax, DWORD PTR _digits_binary_low$230[ebp]
	mov	DWORD PTR _littlenum_pointer$252[ebp], eax
	jmp	$L254
$L255:
	add	DWORD PTR _littlenum_pointer$252[ebp], 2
$L254:
	mov	eax, DWORD PTR _littlenum_limit$253[ebp]
	cmp	DWORD PTR _littlenum_pointer$252[ebp], eax
	ja	$L256
; Line 358
	mov	eax, DWORD PTR _littlenum_pointer$252[ebp]
	mov	ax, WORD PTR [eax]
	and	eax, 65535				; 0000ffffH
	lea	eax, DWORD PTR [eax+eax*4]
	add	eax, eax
	add	eax, DWORD PTR _carry$251[ebp]
	mov	DWORD PTR _work$257[ebp], eax
; Line 359
	mov	eax, DWORD PTR _work$257[ebp]
	and	eax, 65535				; 0000ffffH
	mov	ecx, DWORD PTR _littlenum_pointer$252[ebp]
	mov	WORD PTR [ecx], ax
; Line 360
	mov	eax, DWORD PTR _work$257[ebp]
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _carry$251[ebp], eax
; Line 361
	jmp	$L255
$L256:
; Line 362
	cmp	DWORD PTR _carry$251[ebp], 0
	je	$L258
; Line 368
	call	_abort
; Line 370
$L258:
; Line 371
	jmp	$L260
$L250:
; Line 373
	inc	DWORD PTR _count$246[ebp]
; Line 374
$L260:
; Line 375
	jmp	$L248
$L249:
; Line 383
$L262:
	mov	eax, DWORD PTR _size_of_digits_in_littlenums$236[ebp]
	mov	ecx, DWORD PTR _digits_binary_low$230[ebp]
	mov	ax, WORD PTR [ecx+eax*2-2]
	and	eax, 65535				; 0000ffffH
	or	eax, eax
	jne	$L263
	cmp	DWORD PTR _size_of_digits_in_littlenums$236[ebp], 2
	jl	$L263
; Line 384
	dec	DWORD PTR _size_of_digits_in_littlenums$236[ebp]
	jmp	$L262
$L263:
; Line 386
	mov	eax, DWORD PTR _digits_binary_low$230[ebp]
	mov	DWORD PTR _digits_flonum$239[ebp], eax
; Line 387
	mov	eax, DWORD PTR _size_of_digits_in_littlenums$236[ebp]
	add	eax, eax
	add	eax, DWORD PTR _digits_binary_low$230[ebp]
	sub	eax, 2
	mov	DWORD PTR _digits_flonum$239[ebp+4], eax
; Line 388
	mov	eax, DWORD PTR _digits_flonum$239[ebp+4]
	mov	DWORD PTR _digits_flonum$239[ebp+8], eax
; Line 389
	mov	DWORD PTR _digits_flonum$239[ebp+12], 0
; Line 402
	mov	BYTE PTR _digits_flonum$239[ebp+16], 43	; 0000002bH
; Line 421
	mov	eax, DWORD PTR _precision$231[ebp]
	mov	DWORD PTR _size_of_power_in_littlenums$268[ebp], eax
; Line 425
	cmp	DWORD PTR _decimal_exponent$[ebp], 0
	mov	eax, 0
	setl	al
	mov	DWORD PTR _decimal_exponent_is_negative$265[ebp], eax
; Line 426
	cmp	DWORD PTR _decimal_exponent_is_negative$265[ebp], 0
	je	$L270
; Line 428
	mov	eax, DWORD PTR _decimal_exponent$[ebp]
	neg	eax
	mov	DWORD PTR _decimal_exponent$[ebp], eax
; Line 432
$L270:
; Line 434
	mov	eax, DWORD PTR _size_of_power_in_littlenums$268[ebp]
	add	eax, eax
	add	eax, 2
	mov	DWORD PTR _size_of_power_in_chars$269[ebp], eax
; Line 435
	mov	eax, DWORD PTR _size_of_power_in_chars$269[ebp]
	push	eax
	call	_malloc
	add	esp, 4
	mov	DWORD PTR _power_binary_low$264[ebp], eax
; Line 436
	mov	eax, DWORD PTR _size_of_power_in_chars$269[ebp]
	push	eax
	call	_malloc
	add	esp, 4
	mov	DWORD PTR _temporary_binary_low$267[ebp], eax
; Line 437
	mov	eax, DWORD PTR _size_of_power_in_chars$269[ebp]
	push	eax
	push	0
	mov	eax, DWORD PTR _power_binary_low$264[ebp]
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 438
	mov	eax, DWORD PTR _power_binary_low$264[ebp]
	mov	WORD PTR [eax], 1
; Line 439
	mov	DWORD PTR _power_of_10_flonum$238[ebp+12], 0
; Line 440
	mov	eax, DWORD PTR _power_binary_low$264[ebp]
	mov	DWORD PTR _power_of_10_flonum$238[ebp], eax
; Line 441
	mov	eax, DWORD PTR _power_binary_low$264[ebp]
	mov	DWORD PTR _power_of_10_flonum$238[ebp+8], eax
; Line 442
	mov	eax, DWORD PTR _size_of_power_in_littlenums$268[ebp]
	add	eax, eax
	add	eax, DWORD PTR _power_binary_low$264[ebp]
	sub	eax, 2
	mov	DWORD PTR _power_of_10_flonum$238[ebp+4], eax
; Line 443
	mov	BYTE PTR _power_of_10_flonum$238[ebp+16], 43 ; 0000002bH
; Line 444
	mov	eax, DWORD PTR _temporary_binary_low$267[ebp]
	mov	DWORD PTR _temporary_flonum$266[ebp], eax
; Line 445
	mov	eax, DWORD PTR _size_of_power_in_littlenums$268[ebp]
	add	eax, eax
	add	eax, DWORD PTR _temporary_binary_low$267[ebp]
	sub	eax, 2
	mov	DWORD PTR _temporary_flonum$266[ebp+4], eax
; Line 467
	mov	eax, DWORD PTR _table_size_of_flonum_powers_of_ten
	mov	DWORD PTR _place_number_limit$271[ebp], eax
; Line 471
	mov	eax, OFFSET _flonum_negative_powers_of_ten
	cmp	DWORD PTR _decimal_exponent_is_negative$265[ebp], 0
	jne	$L294
	mov	eax, OFFSET _flonum_positive_powers_of_ten
$L294:
	mov	DWORD PTR _multiplicand$273[ebp], eax
; Line 475
	mov	DWORD PTR _place_number$272[ebp], 1
	jmp	$L274
$L275:
	sar	DWORD PTR _decimal_exponent$[ebp], 1
	inc	DWORD PTR _place_number$272[ebp]
$L274:
	cmp	DWORD PTR _decimal_exponent$[ebp], 0
	je	$L276
; Line 477
	test	BYTE PTR _decimal_exponent$[ebp], 1
	je	$L277
; Line 479
	mov	eax, DWORD PTR _place_number_limit$271[ebp]
	cmp	DWORD PTR _place_number$272[ebp], eax
	jle	$L278
; Line 488
	mov	DWORD PTR _return_value$[ebp], 2
; Line 492
	mov	DWORD PTR _decimal_exponent$[ebp], 0
; Line 494
	jmp	$L279
$L278:
; Line 501
	lea	eax, DWORD PTR _temporary_flonum$266[ebp]
	push	eax
	lea	eax, DWORD PTR _power_of_10_flonum$238[ebp]
	push	eax
	mov	eax, DWORD PTR _place_number$272[ebp]
	shl	eax, 2
	lea	eax, DWORD PTR [eax+eax*4]
	add	eax, DWORD PTR _multiplicand$273[ebp]
	push	eax
	call	_flonum_multip
	add	esp, 12					; 0000000cH
; Line 502
	lea	eax, DWORD PTR _power_of_10_flonum$238[ebp]
	push	eax
	lea	eax, DWORD PTR _temporary_flonum$266[ebp]
	push	eax
	call	_flonum_copy
	add	esp, 8
; Line 503
$L279:
; Line 505
$L277:
	jmp	$L275
$L276:
; Line 522
	mov	eax, DWORD PTR _address_of_generic_floating_point_number$[ebp]
	push	eax
	lea	eax, DWORD PTR _digits_flonum$239[ebp]
	push	eax
	lea	eax, DWORD PTR _power_of_10_flonum$238[ebp]
	push	eax
	call	_flonum_multip
	add	esp, 12					; 0000000cH
; Line 524
	mov	al, BYTE PTR _digits_sign_char$[ebp]
	mov	ecx, DWORD PTR _address_of_generic_floating_point_number$[ebp]
	mov	BYTE PTR [ecx+16], al
; Line 526
$L229:
; Line 527
	mov	eax, DWORD PTR _return_value$[ebp]
	jmp	$L166
; Line 528
$L166:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_atof_generic ENDP
_TEXT	ENDS
END
