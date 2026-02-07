	TITLE	varasm.c
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
COMM	_const_labelno:DWORD
COMM	_var_labelno:DWORD
_in_section$S1059 DD 00H
_DATA	ENDS
PUBLIC	_text_section
EXTRN	_asm_out_file:DWORD
EXTRN	_fprintf:NEAR
_DATA	SEGMENT
$SG1063	DB	'.text', 00H
	ORG $+2
$SG1064	DB	'%s', 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
; File varasm.c
_text_section PROC NEAR
; Line 91
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 92
	cmp	DWORD PTR _in_section$S1059, 1
	je	$L1062
; Line 94
	push	OFFSET $SG1063
	push	OFFSET $SG1064
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 95
	mov	DWORD PTR _in_section$S1059, 1
; Line 97
$L1062:
$L1061:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_text_section ENDP
_TEXT	ENDS
PUBLIC	_data_section
EXTRN	_flag_shared_data:DWORD
_DATA	SEGMENT
$SG1069	DB	'.data', 00H
	ORG $+2
$SG1070	DB	'%s', 0aH, 00H
$SG1072	DB	'.data', 00H
	ORG $+2
$SG1073	DB	'%s', 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_data_section PROC NEAR
; Line 103
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 104
	cmp	DWORD PTR _in_section$S1059, 2
	je	$L1067
; Line 106
	cmp	DWORD PTR _flag_shared_data, 0
	je	$L1068
; Line 111
	push	OFFSET $SG1069
	push	OFFSET $SG1070
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 114
	jmp	$L1071
$L1068:
; Line 115
	push	OFFSET $SG1072
	push	OFFSET $SG1073
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
$L1071:
; Line 117
	mov	DWORD PTR _in_section$S1059, 2
; Line 119
$L1067:
$L1066:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_data_section ENDP
_TEXT	ENDS
PUBLIC	_in_text_section
_TEXT	SEGMENT
_in_text_section PROC NEAR
; Line 125
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 126
	mov	eax, DWORD PTR _in_section$S1059
	dec	eax
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	jmp	$L1075
; Line 127
$L1075:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_in_text_section ENDP
_TEXT	ENDS
PUBLIC	_make_function_rtl
EXTRN	_gen_rtx:NEAR
_BSS	SEGMENT
_function_defined$S1048 DD 01H DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
_decl$ = 8
_make_function_rtl PROC NEAR
; Line 136
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 137
	mov	eax, DWORD PTR _decl$[ebp]
	cmp	DWORD PTR [eax+76], 0
	jne	$L1079
; Line 140
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+72]
	push	eax
	push	4
	push	39					; 00000027H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	sar	eax, 24					; 00000018H
	push	eax
	push	37					; 00000025H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _decl$[ebp]
	mov	DWORD PTR [ecx+76], eax
; Line 143
$L1079:
	mov	DWORD PTR _function_defined$S1048, 1
; Line 144
$L1078:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_make_function_rtl ENDP
_TEXT	ENDS
PUBLIC	_decode_reg_name
EXTRN	_strcmp:NEAR
EXTRN	_reg_names:BYTE
_TEXT	SEGMENT
_asmspec$ = 8
_i$1084 = -4
_decode_reg_name PROC NEAR
; Line 153
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 154
	cmp	DWORD PTR _asmspec$[ebp], 0
	je	$L1083
; Line 159
	mov	DWORD PTR _i$1084[ebp], 0
	jmp	$L1086
$L1087:
	inc	DWORD PTR _i$1084[ebp]
$L1086:
	cmp	DWORD PTR _i$1084[ebp], 10		; 0000000aH
	jge	$L1088
; Line 160
	mov	eax, DWORD PTR _i$1084[ebp]
	mov	eax, DWORD PTR _reg_names[eax*4]
	push	eax
	mov	eax, DWORD PTR _asmspec$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L1090
; Line 161
	jmp	$L1088
; Line 163
$L1090:
	jmp	$L1087
$L1088:
	cmp	DWORD PTR _i$1084[ebp], 10		; 0000000aH
	jge	$L1091
; Line 164
	mov	eax, DWORD PTR _i$1084[ebp]
	jmp	$L1082
; Line 165
	jmp	$L1092
$L1091:
; Line 166
	mov	eax, -2					; fffffffeH
	jmp	$L1082
$L1092:
; Line 169
$L1083:
	mov	eax, -1
	jmp	$L1082
; Line 170
$L1082:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_decode_reg_name ENDP
_TEXT	ENDS
PUBLIC	_make_decl_rtl
EXTRN	_fixed_regs:TBYTE
EXTRN	_global_regs:TBYTE
EXTRN	_strlen:NEAR
EXTRN	__obstack_newchunk:NEAR
EXTRN	_strcpy:NEAR
EXTRN	_pedantic:DWORD
EXTRN	_error_with_decl:NEAR
EXTRN	_saveable_obstack:DWORD
EXTRN	_error:NEAR
EXTRN	_warning:NEAR
EXTRN	_init_reg_sets_1:NEAR
EXTRN	_sprintf:NEAR
EXTRN	_alloca:NEAR
EXTRN	_mode_size:BYTE
EXTRN	_memcpy:NEAR
_DATA	SEGMENT
$SG1108	DB	'register name not specified for `%s''', 00H
	ORG $+3
$SG1111	DB	'invalid register name for `%s''', 00H
	ORG $+1
$SG1114	DB	'register name given for non-register variable `%s''', 00H
	ORG $+1
$SG1118	DB	'function declared `register''', 00H
	ORG $+3
$SG1121	DB	'data type of `%s'' isn''t suitable for a register', 00H
$SG1127	DB	'ANSI C forbids global register variables', 00H
	ORG $+3
$SG1129	DB	'global register variable has initial value', 00H
	ORG $+1
$SG1131	DB	'global register variable follows a function definition', 00H
	ORG $+1
$SG1141	DB	'%s.%d', 00H
_DATA	ENDS
_TEXT	SEGMENT
_decl$ = 8
_asmspec$ = 12
_top_level$ = 16
_name$ = -8
_reg_number$ = -4
_nregs$1124 = -12
_label$1139 = -16
_make_decl_rtl PROC NEAR
; Line 185
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 186
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+72]
	mov	DWORD PTR _name$[ebp], eax
; Line 187
	mov	eax, DWORD PTR _asmspec$[ebp]
	push	eax
	call	_decode_reg_name
	add	esp, 4
	mov	DWORD PTR _reg_number$[ebp], eax
; Line 189
	cmp	DWORD PTR _reg_number$[ebp], -2		; fffffffeH
	jne	$L1100
; Line 192
	mov	eax, DWORD PTR _asmspec$[ebp]
	push	eax
	call	_strlen
	add	esp, 4
	add	eax, 2
	mov	ecx, DWORD PTR _saveable_obstack
	mov	DWORD PTR [ecx+20], eax
	mov	eax, DWORD PTR _saveable_obstack
	mov	eax, DWORD PTR [eax+20]
	mov	ecx, DWORD PTR _saveable_obstack
	add	eax, DWORD PTR [ecx+12]
	mov	ecx, DWORD PTR _saveable_obstack
	cmp	eax, DWORD PTR [ecx+16]
	jbe	$L1769
	mov	eax, DWORD PTR _saveable_obstack
	mov	eax, DWORD PTR [eax+20]
	push	eax
	mov	eax, DWORD PTR _saveable_obstack
	push	eax
	call	__obstack_newchunk
	add	esp, 8
	jmp	$L1770
$L1769:
$L1770:
	mov	eax, DWORD PTR _saveable_obstack
	mov	eax, DWORD PTR [eax+20]
	mov	ecx, DWORD PTR _saveable_obstack
	add	DWORD PTR [ecx+12], eax
	mov	eax, DWORD PTR _saveable_obstack
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _saveable_obstack
	mov	DWORD PTR [ecx+20], eax
	mov	eax, DWORD PTR _saveable_obstack
	mov	eax, DWORD PTR [eax+12]
	mov	ecx, DWORD PTR _saveable_obstack
	add	eax, DWORD PTR [ecx+24]
	mov	ecx, DWORD PTR _saveable_obstack
	mov	ecx, DWORD PTR [ecx+24]
	not	ecx
	and	eax, ecx
	mov	ecx, DWORD PTR _saveable_obstack
	mov	DWORD PTR [ecx+12], eax
	mov	eax, DWORD PTR _saveable_obstack
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _saveable_obstack
	sub	eax, DWORD PTR [ecx+4]
	mov	ecx, DWORD PTR _saveable_obstack
	mov	ecx, DWORD PTR [ecx+12]
	mov	edx, DWORD PTR _saveable_obstack
	sub	ecx, DWORD PTR [edx+4]
	cmp	eax, ecx
	jge	$L1771
	mov	eax, DWORD PTR _saveable_obstack
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _saveable_obstack
	mov	DWORD PTR [ecx+12], eax
	jmp	$L1772
$L1771:
$L1772:
	mov	eax, DWORD PTR _saveable_obstack
	mov	eax, DWORD PTR [eax+12]
	mov	ecx, DWORD PTR _saveable_obstack
	mov	DWORD PTR [ecx+8], eax
	mov	eax, DWORD PTR _saveable_obstack
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _name$[ebp], eax
; Line 193
	mov	eax, DWORD PTR _name$[ebp]
	mov	BYTE PTR [eax], 42			; 0000002aH
; Line 194
	mov	eax, DWORD PTR _asmspec$[ebp]
	push	eax
	mov	eax, DWORD PTR _name$[ebp]
	inc	eax
	push	eax
	call	_strcpy
	add	esp, 8
; Line 201
$L1100:
; Line 202
	mov	eax, DWORD PTR _decl$[ebp]
	cmp	DWORD PTR [eax+76], 0
	je	$L1105
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, DWORD PTR _decl$[ebp]
	mov	ecx, DWORD PTR [ecx+32]
	shl	ecx, 24					; 00000018H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L1104
$L1105:
; Line 204
	mov	eax, DWORD PTR _decl$[ebp]
	mov	DWORD PTR [eax+76], 0
; Line 207
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 10					; 0000000aH
	test	al, 1
	je	$L1106
	cmp	DWORD PTR _reg_number$[ebp], -1
	jne	$L1106
; Line 209
	push	OFFSET $SG1108
	mov	eax, DWORD PTR _decl$[ebp]
	push	eax
	call	_error_with_decl
	add	esp, 8
; Line 210
	jmp	$L1109
$L1106:
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 10					; 0000000aH
	test	al, 1
	je	$L1110
	cmp	DWORD PTR _reg_number$[ebp], -2		; fffffffeH
	jne	$L1110
; Line 212
	push	OFFSET $SG1111
	mov	eax, DWORD PTR _decl$[ebp]
	push	eax
	call	_error_with_decl
	add	esp, 8
; Line 213
	jmp	$L1112
$L1110:
	cmp	DWORD PTR _reg_number$[ebp], 0
	jl	$L1113
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 10					; 0000000aH
	test	al, 1
	jne	$L1113
; Line 215
	push	OFFSET $SG1114
	mov	eax, DWORD PTR _decl$[ebp]
	push	eax
	call	_error_with_decl
	add	esp, 8
; Line 216
	jmp	$L1115
$L1113:
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 10					; 0000000aH
	test	al, 1
	je	$L1116
	mov	eax, DWORD PTR _decl$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 39					; 00000027H
	jne	$L1116
; Line 217
	push	OFFSET $SG1118
	call	_error
	add	esp, 4
; Line 218
	jmp	$L1119
$L1116:
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 10					; 0000000aH
	test	al, 1
	je	$L1120
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	and	eax, -16777216				; ff000000H
	mov	ecx, 436207616				; 1a000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1120
; Line 219
	push	OFFSET $SG1121
	mov	eax, DWORD PTR _decl$[ebp]
	push	eax
	call	_error_with_decl
	add	esp, 8
; Line 221
	jmp	$L1122
$L1120:
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 10					; 0000000aH
	test	al, 1
	je	$L1123
; Line 224
	cmp	DWORD PTR _pedantic, 0
	je	$L1125
; Line 225
	push	OFFSET $SG1127
	call	_warning
	add	esp, 4
; Line 226
$L1125:
	mov	eax, DWORD PTR _decl$[ebp]
	cmp	DWORD PTR [eax+64], 0
	je	$L1128
; Line 228
	mov	eax, DWORD PTR _decl$[ebp]
	mov	DWORD PTR [eax+64], 0
; Line 229
	push	OFFSET $SG1129
	call	_error
	add	esp, 4
; Line 231
$L1128:
; Line 232
	mov	eax, DWORD PTR _reg_number$[ebp]
	movsx	eax, BYTE PTR _fixed_regs[eax]
	or	eax, eax
	jne	$L1130
	cmp	DWORD PTR _function_defined$S1048, 0
	je	$L1130
	cmp	DWORD PTR _top_level$[ebp], 0
	je	$L1130
; Line 233
	push	OFFSET $SG1131
	call	_error
	add	esp, 4
; Line 234
$L1130:
	mov	eax, DWORD PTR _reg_number$[ebp]
	push	eax
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	sar	eax, 24					; 00000018H
	push	eax
	push	34					; 00000022H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _decl$[ebp]
	mov	DWORD PTR [ecx+76], eax
; Line 235
	cmp	DWORD PTR _top_level$[ebp], 0
	je	$L1132
; Line 238
	cmp	DWORD PTR _reg_number$[ebp], 8
	jl	$L1773
	mov	DWORD PTR _nregs$1124[ebp], 1
	jmp	$L1774
$L1773:
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	add	eax, 3
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	mov	DWORD PTR _nregs$1124[ebp], eax
$L1774:
; Line 239
$L1134:
	cmp	DWORD PTR _nregs$1124[ebp], 0
	jle	$L1135
; Line 240
	dec	DWORD PTR _nregs$1124[ebp]
	mov	eax, DWORD PTR _nregs$1124[ebp]
	mov	ecx, DWORD PTR _reg_number$[ebp]
	mov	BYTE PTR _global_regs[eax+ecx], 1
	jmp	$L1134
$L1135:
; Line 241
	call	_init_reg_sets_1
; Line 243
$L1132:
; Line 247
$L1123:
$L1122:
$L1119:
$L1115:
$L1112:
$L1109:
	mov	eax, DWORD PTR _decl$[ebp]
	cmp	DWORD PTR [eax+76], 0
	jne	$L1137
; Line 252
	cmp	DWORD PTR _top_level$[ebp], 0
	jne	$L1138
	mov	eax, DWORD PTR _decl$[ebp]
	test	BYTE PTR [eax+16], 1
	jne	$L1138
	cmp	DWORD PTR _asmspec$[ebp], 0
	jne	$L1138
; Line 256
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_strlen
	add	esp, 4
	add	eax, 10					; 0000000aH
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _label$1139[ebp], eax
	mov	eax, DWORD PTR _var_labelno
	push	eax
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	push	OFFSET $SG1141
	mov	eax, DWORD PTR _label$1139[ebp]
	push	eax
	call	_sprintf
	add	esp, 16					; 00000010H
; Line 257
	mov	eax, DWORD PTR _label$1139[ebp]
	push	eax
	call	_strlen
	add	esp, 4
	mov	ecx, DWORD PTR _saveable_obstack
	mov	DWORD PTR [ecx+20], eax
	mov	eax, DWORD PTR _saveable_obstack
	mov	eax, DWORD PTR [eax+20]
	mov	ecx, DWORD PTR _saveable_obstack
	add	eax, DWORD PTR [ecx+12]
	inc	eax
	mov	ecx, DWORD PTR _saveable_obstack
	cmp	eax, DWORD PTR [ecx+16]
	jbe	$L1775
	mov	eax, DWORD PTR _saveable_obstack
	mov	eax, DWORD PTR [eax+20]
	inc	eax
	push	eax
	mov	eax, DWORD PTR _saveable_obstack
	push	eax
	call	__obstack_newchunk
	add	esp, 8
	jmp	$L1776
$L1775:
$L1776:
	mov	eax, DWORD PTR _saveable_obstack
	mov	eax, DWORD PTR [eax+20]
	push	eax
	mov	eax, DWORD PTR _label$1139[ebp]
	push	eax
	mov	eax, DWORD PTR _saveable_obstack
	mov	eax, DWORD PTR [eax+12]
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
	mov	eax, DWORD PTR _saveable_obstack
	mov	eax, DWORD PTR [eax+20]
	mov	ecx, DWORD PTR _saveable_obstack
	add	DWORD PTR [ecx+12], eax
	mov	eax, DWORD PTR _saveable_obstack
	mov	eax, DWORD PTR [eax+12]
	mov	BYTE PTR [eax], 0
	mov	eax, DWORD PTR _saveable_obstack
	inc	DWORD PTR [eax+12]
	mov	eax, DWORD PTR _saveable_obstack
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _saveable_obstack
	mov	DWORD PTR [ecx+20], eax
	mov	eax, DWORD PTR _saveable_obstack
	mov	eax, DWORD PTR [eax+12]
	mov	ecx, DWORD PTR _saveable_obstack
	add	eax, DWORD PTR [ecx+24]
	mov	ecx, DWORD PTR _saveable_obstack
	mov	ecx, DWORD PTR [ecx+24]
	not	ecx
	and	eax, ecx
	mov	ecx, DWORD PTR _saveable_obstack
	mov	DWORD PTR [ecx+12], eax
	mov	eax, DWORD PTR _saveable_obstack
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _saveable_obstack
	sub	eax, DWORD PTR [ecx+4]
	mov	ecx, DWORD PTR _saveable_obstack
	mov	ecx, DWORD PTR [ecx+12]
	mov	edx, DWORD PTR _saveable_obstack
	sub	ecx, DWORD PTR [edx+4]
	cmp	eax, ecx
	jge	$L1777
	mov	eax, DWORD PTR _saveable_obstack
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _saveable_obstack
	mov	DWORD PTR [ecx+12], eax
	jmp	$L1778
$L1777:
$L1778:
	mov	eax, DWORD PTR _saveable_obstack
	mov	eax, DWORD PTR [eax+12]
	mov	ecx, DWORD PTR _saveable_obstack
	mov	DWORD PTR [ecx+8], eax
	mov	eax, DWORD PTR _saveable_obstack
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _name$[ebp], eax
; Line 258
	inc	DWORD PTR _var_labelno
; Line 261
$L1138:
; Line 262
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	push	4
	push	39					; 00000027H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	sar	eax, 24					; 00000018H
	push	eax
	push	37					; 00000025H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _decl$[ebp]
	mov	DWORD PTR [ecx+76], eax
; Line 265
	mov	eax, DWORD PTR _decl$[ebp]
	test	BYTE PTR [eax+16], 1
	je	$L1143
; Line 266
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	or	eax, 134217728				; 08000000H
	mov	ecx, DWORD PTR _decl$[ebp]
	mov	ecx, DWORD PTR [ecx+76]
	mov	ecx, DWORD PTR [ecx+4]
	mov	DWORD PTR [ecx], eax
; Line 268
$L1143:
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 3
	test	al, 1
	je	$L1144
; Line 269
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax]
	or	eax, 134217728				; 08000000H
	mov	ecx, DWORD PTR _decl$[ebp]
	mov	ecx, DWORD PTR [ecx+76]
	mov	DWORD PTR [ecx], eax
; Line 270
$L1144:
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 5
	test	al, 1
	je	$L1145
; Line 271
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax]
	or	eax, 67108864				; 04000000H
	mov	ecx, DWORD PTR _decl$[ebp]
	mov	ecx, DWORD PTR [ecx+76]
	mov	DWORD PTR [ecx], eax
; Line 272
$L1145:
; Line 275
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 16					; 00000010H
	je	$L1781
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 19					; 00000013H
	je	$L1781
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 20					; 00000014H
	jne	$L1779
$L1781:
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax]
	or	eax, 268435456				; 10000000H
	mov	ecx, DWORD PTR _decl$[ebp]
	mov	ecx, DWORD PTR [ecx+76]
	mov	DWORD PTR [ecx], eax
	jmp	$L1780
$L1779:
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	and	DWORD PTR [eax], -268435457		; efffffffH
$L1780:
; Line 277
$L1137:
; Line 278
$L1104:
$L1097:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_make_decl_rtl ENDP
_TEXT	ENDS
PUBLIC	_assemble_asm
EXTRN	_app_enable:NEAR
_DATA	SEGMENT
	ORG $+2
$SG1150	DB	09H, '%s', 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_string$ = 8
_assemble_asm PROC NEAR
; Line 286
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 287
	call	_app_enable
; Line 289
	mov	eax, DWORD PTR _string$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	push	OFFSET $SG1150
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 290
$L1148:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_assemble_asm ENDP
_TEXT	ENDS
PUBLIC	_assemble_function
PUBLIC	_assemble_name
EXTRN	_abort:NEAR
EXTRN	_app_disable:NEAR
EXTRN	_floor_log2:NEAR
EXTRN	_fputs:NEAR
_DATA	SEGMENT
	ORG $+3
$SG1165	DB	09H, '.align %d', 0aH, 00H
$SG1167	DB	'.globl ', 00H
$SG1168	DB	0aH, 00H
	ORG $+2
$SG1169	DB	':', 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_x$ = -16
_n$ = -8
_fnname$ = -12
_align$ = -4
_decl$ = 8
_assemble_function PROC NEAR
; Line 298
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 306
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	DWORD PTR _x$[ebp], eax
; Line 307
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1158
; Line 308
	call	_abort
; Line 309
$L1158:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _n$[ebp], eax
; Line 310
	mov	eax, DWORD PTR _n$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1160
; Line 311
	call	_abort
; Line 312
$L1160:
	mov	eax, DWORD PTR _n$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _fnname$[ebp], eax
; Line 316
	call	_app_disable
; Line 318
	call	_text_section
; Line 328
	push	4
	call	_floor_log2
	add	esp, 4
	mov	DWORD PTR _align$[ebp], eax
; Line 329
	cmp	DWORD PTR _align$[ebp], 0
	jle	$L1163
; Line 330
	mov	eax, DWORD PTR _align$[ebp]
	push	eax
	push	OFFSET $SG1165
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 340
$L1164:
$L1163:
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 1
	test	al, 1
	je	$L1166
; Line 341
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	push	OFFSET $SG1167
	call	_fputs
	add	esp, 8
	mov	eax, DWORD PTR _fnname$[ebp]
	push	eax
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_assemble_name
	add	esp, 8
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	push	OFFSET $SG1168
	call	_fputs
	add	esp, 8
; Line 348
$L1166:
	mov	eax, DWORD PTR _fnname$[ebp]
	push	eax
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_assemble_name
	add	esp, 8
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	push	OFFSET $SG1169
	call	_fputs
	add	esp, 8
; Line 350
$L1153:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_assemble_function ENDP
_TEXT	ENDS
PUBLIC	_assemble_integer_zero
EXTRN	_const0_rtx:DWORD
EXTRN	__flsbuf:NEAR
EXTRN	_output_addr_const:NEAR
_DATA	SEGMENT
	ORG $+1
$SG1173	DB	09H, '.long ', 00H
_DATA	ENDS
_TEXT	SEGMENT
_assemble_integer_zero PROC NEAR
; Line 356
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 357
	push	OFFSET $SG1173
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_fprintf
	add	esp, 8
	mov	eax, DWORD PTR _const0_rtx
	push	eax
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_output_addr_const
	add	esp, 8
	mov	eax, DWORD PTR _asm_out_file
	dec	DWORD PTR [eax+4]
	mov	eax, DWORD PTR _asm_out_file
	cmp	DWORD PTR [eax+4], 0
	jl	$L1782
	mov	eax, DWORD PTR _asm_out_file
	mov	eax, DWORD PTR [eax]
	mov	BYTE PTR [eax], 10			; 0000000aH
	mov	eax, DWORD PTR _asm_out_file
	inc	DWORD PTR [eax]
	jmp	$L1783
$L1782:
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	push	10					; 0000000aH
	call	__flsbuf
	add	esp, 8
$L1783:
; Line 358
$L1171:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_assemble_integer_zero ENDP
_TEXT	ENDS
PUBLIC	_assemble_string
_DATA	SEGMENT
$SG1187	DB	09H, '.ascii "', 00H
	ORG $+2
$SG1196	DB	'\%o', 00H
$SG1198	DB	'"', 0aH, 09H, '.ascii "', 00H
$SG1199	DB	'"', 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_p$ = 8
_size$ = 12
_i$ = -8
_excess$ = -16
_pos$ = -12
_maximum$ = -4
_thissize$1185 = -20
_c$1191 = -24
_assemble_string PROC NEAR
; Line 366
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	push	ebx
	push	esi
	push	edi
; Line 368
	mov	DWORD PTR _excess$[ebp], 0
; Line 369
	mov	DWORD PTR _pos$[ebp], 0
; Line 370
	mov	DWORD PTR _maximum$[ebp], 2000		; 000007d0H
; Line 374
$L1183:
	mov	eax, DWORD PTR _pos$[ebp]
	cmp	DWORD PTR _size$[ebp], eax
	jle	$L1184
; Line 376
	mov	eax, DWORD PTR _size$[ebp]
	sub	eax, DWORD PTR _pos$[ebp]
	mov	DWORD PTR _thissize$1185[ebp], eax
; Line 377
	mov	eax, DWORD PTR _maximum$[ebp]
	cmp	DWORD PTR _thissize$1185[ebp], eax
	jle	$L1186
; Line 378
	mov	eax, DWORD PTR _maximum$[ebp]
	mov	DWORD PTR _thissize$1185[ebp], eax
; Line 383
$L1186:
	push	OFFSET $SG1187
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_fprintf
	add	esp, 8
; Line 385
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L1188
$L1189:
	inc	DWORD PTR _i$[ebp]
$L1188:
	mov	eax, DWORD PTR _thissize$1185[ebp]
	cmp	DWORD PTR _i$[ebp], eax
	jge	$L1190
; Line 387
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _p$[ebp]
	mov	al, BYTE PTR [eax+ecx]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _c$1191[ebp], eax
; Line 388
	cmp	DWORD PTR _c$1191[ebp], 34		; 00000022H
	je	$L1193
	cmp	DWORD PTR _c$1191[ebp], 92		; 0000005cH
	jne	$L1192
$L1193:
; Line 389
	mov	eax, DWORD PTR _asm_out_file
	dec	DWORD PTR [eax+4]
	mov	eax, DWORD PTR _asm_out_file
	cmp	DWORD PTR [eax+4], 0
	jl	$L1784
	mov	eax, DWORD PTR _asm_out_file
	mov	eax, DWORD PTR [eax]
	mov	BYTE PTR [eax], 92			; 0000005cH
	mov	eax, DWORD PTR _asm_out_file
	inc	DWORD PTR [eax]
	jmp	$L1785
$L1784:
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	push	92					; 0000005cH
	call	__flsbuf
	add	esp, 8
$L1785:
; Line 390
$L1192:
	cmp	DWORD PTR _c$1191[ebp], 32		; 00000020H
	jl	$L1194
	cmp	DWORD PTR _c$1191[ebp], 127		; 0000007fH
	jge	$L1194
; Line 391
	mov	eax, DWORD PTR _asm_out_file
	dec	DWORD PTR [eax+4]
	mov	eax, DWORD PTR _asm_out_file
	cmp	DWORD PTR [eax+4], 0
	jl	$L1786
	mov	al, BYTE PTR _c$1191[ebp]
	mov	ecx, DWORD PTR _asm_out_file
	mov	ecx, DWORD PTR [ecx]
	mov	BYTE PTR [ecx], al
	mov	eax, DWORD PTR _asm_out_file
	inc	DWORD PTR [eax]
	jmp	$L1787
$L1786:
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	mov	eax, DWORD PTR _c$1191[ebp]
	push	eax
	call	__flsbuf
	add	esp, 8
$L1787:
; Line 392
	jmp	$L1195
$L1194:
; Line 394
	mov	eax, DWORD PTR _c$1191[ebp]
	push	eax
	push	OFFSET $SG1196
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 401
	mov	eax, DWORD PTR _thissize$1185[ebp]
	dec	eax
	cmp	eax, DWORD PTR _i$[ebp]
	jle	$L1197
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _p$[ebp]
	mov	al, BYTE PTR [eax+ecx+1]
	and	eax, 255				; 000000ffH
	cmp	eax, 48					; 00000030H
	jl	$L1197
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _p$[ebp]
	mov	al, BYTE PTR [eax+ecx+1]
	and	eax, 255				; 000000ffH
	cmp	eax, 57					; 00000039H
	jg	$L1197
; Line 402
	push	OFFSET $SG1198
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_fprintf
	add	esp, 8
; Line 403
$L1197:
$L1195:
; Line 404
	jmp	$L1189
$L1190:
; Line 405
	push	OFFSET $SG1199
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_fprintf
	add	esp, 8
; Line 408
	mov	eax, DWORD PTR _thissize$1185[ebp]
	add	DWORD PTR _pos$[ebp], eax
; Line 409
	mov	eax, DWORD PTR _thissize$1185[ebp]
	add	DWORD PTR _p$[ebp], eax
; Line 410
	jmp	$L1183
$L1184:
; Line 411
$L1177:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_assemble_string ENDP
_TEXT	ENDS
PUBLIC	_output_addressed_constants
PUBLIC	_output_constant
PUBLIC	_assemble_variable
EXTRN	_dbxout_symbol:NEAR
EXTRN	_set_current_gdbfile:NEAR
EXTRN	_error_mark_node:DWORD
EXTRN	_int_size_in_bytes:NEAR
EXTRN	_layout_decl:NEAR
EXTRN	_error_with_file_and_line:NEAR
_DATA	SEGMENT
	ORG $+1
$SG1214	DB	'storage size of static var `%s'' isn''t known', 00H
$SG1228	DB	'.comm ', 00H
	ORG $+1
$SG1229	DB	',%u', 0aH, 00H
	ORG $+3
$SG1231	DB	'.lcomm ', 00H
$SG1232	DB	',%u', 0aH, 00H
	ORG $+3
$SG1234	DB	'.globl ', 00H
$SG1235	DB	0aH, 00H
	ORG $+2
$SG1244	DB	09H, '.align %d', 0aH, 00H
$SG1245	DB	':', 0aH, 00H
	ORG $+1
$SG1249	DB	09H, '.space %u', 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_size$1223 = -12
_rounded$1224 = -16
_decl$ = 8
_top_level$ = 12
_write_symbols$ = 16
_name$ = -8
_i$ = -4
_assemble_variable PROC NEAR
; Line 429
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 435
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1208
; Line 436
	jmp	$L1205
; Line 441
$L1208:
	mov	eax, DWORD PTR _decl$[ebp]
	test	BYTE PTR [eax+16], 1
	je	$L1209
; Line 442
	jmp	$L1205
; Line 447
$L1209:
	mov	eax, DWORD PTR _decl$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 39					; 00000027H
	jne	$L1210
; Line 448
	jmp	$L1205
; Line 453
$L1210:
	mov	eax, DWORD PTR _decl$[ebp]
	cmp	DWORD PTR [eax+28], 0
	jne	$L1211
; Line 454
	push	0
	mov	eax, DWORD PTR _decl$[ebp]
	push	eax
	call	_layout_decl
	add	esp, 8
; Line 459
$L1211:
	mov	eax, DWORD PTR _decl$[ebp]
	cmp	DWORD PTR [eax+28], 0
	jne	$L1212
; Line 464
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+40]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	OFFSET $SG1214
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	call	_error_with_file_and_line
	add	esp, 16					; 00000010H
; Line 465
	jmp	$L1205
; Line 473
$L1212:
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 13					; 0000000dH
	test	al, 1
	je	$L1215
; Line 474
	jmp	$L1205
; Line 476
$L1215:
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	or	eax, 8192				; 00002000H
	mov	ecx, DWORD PTR _decl$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 480
	cmp	DWORD PTR _write_symbols$[ebp], 2
	jne	$L1216
	cmp	DWORD PTR _top_level$[ebp], 0
	je	$L1216
; Line 481
	push	0
	mov	eax, DWORD PTR _decl$[ebp]
	push	eax
	call	_dbxout_symbol
	add	esp, 8
; Line 487
$L1216:
	cmp	DWORD PTR _write_symbols$[ebp], 1
	jne	$L1218
; Line 489
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	call	_set_current_gdbfile
	add	esp, 4
; Line 494
$L1218:
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 6
	test	al, 1
	jne	$L1220
; Line 495
	jmp	$L1205
; Line 497
$L1220:
	call	_app_disable
; Line 499
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _name$[ebp], eax
; Line 503
	mov	eax, DWORD PTR _decl$[ebp]
	cmp	DWORD PTR [eax+64], 0
	je	$L1222
	mov	eax, DWORD PTR _decl$[ebp]
	mov	ecx, DWORD PTR _error_mark_node
	cmp	DWORD PTR [eax+64], ecx
	jne	$L1221
$L1222:
; Line 507
	mov	eax, DWORD PTR _decl$[ebp]
	mov	al, BYTE PTR [eax+36]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _decl$[ebp]
	mov	ecx, DWORD PTR [ecx+28]
	imul	eax, DWORD PTR [ecx+20]
	cdq
	and	edx, 7
	add	eax, edx
	sar	eax, 3
	mov	DWORD PTR _size$1223[ebp], eax
; Line 508
	mov	eax, DWORD PTR _size$1223[ebp]
	mov	DWORD PTR _rounded$1224[ebp], eax
; Line 511
	cmp	DWORD PTR _size$1223[ebp], 0
	jne	$L1225
	mov	DWORD PTR _rounded$1224[ebp], 1
; Line 514
$L1225:
; Line 516
	mov	eax, DWORD PTR _rounded$1224[ebp]
	add	eax, 3
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	shl	eax, 2
	mov	DWORD PTR _rounded$1224[ebp], eax
; Line 517
	cmp	DWORD PTR _flag_shared_data, 0
	je	$L1226
; Line 518
	call	_data_section
; Line 519
$L1226:
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 1
	test	al, 1
	je	$L1227
; Line 520
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	push	OFFSET $SG1228
	call	_fputs
	add	esp, 8
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_assemble_name
	add	esp, 8
	mov	eax, DWORD PTR _size$1223[ebp]
	push	eax
	push	OFFSET $SG1229
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 521
	jmp	$L1230
$L1227:
; Line 522
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	push	OFFSET $SG1231
	call	_fputs
	add	esp, 8
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_assemble_name
	add	esp, 8
	mov	eax, DWORD PTR _size$1223[ebp]
	push	eax
	push	OFFSET $SG1232
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
$L1230:
; Line 523
	jmp	$L1205
; Line 529
$L1221:
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 1
	test	al, 1
	je	$L1233
	mov	eax, DWORD PTR _decl$[ebp]
	cmp	DWORD PTR [eax+40], 0
	je	$L1233
; Line 530
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	push	OFFSET $SG1234
	call	_fputs
	add	esp, 8
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_assemble_name
	add	esp, 8
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	push	OFFSET $SG1235
	call	_fputs
	add	esp, 8
; Line 542
$L1233:
	mov	eax, DWORD PTR _decl$[ebp]
	cmp	DWORD PTR [eax+64], 0
	je	$L1236
; Line 543
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+64]
	push	eax
	call	_output_addressed_constants
	add	esp, 4
; Line 549
$L1236:
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 5
	test	al, 1
	je	$L1237
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 3
	test	al, 1
	jne	$L1237
; Line 550
	call	_text_section
; Line 551
	jmp	$L1238
$L1237:
; Line 552
	call	_data_section
$L1238:
; Line 556
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L1239
$L1240:
	inc	DWORD PTR _i$[ebp]
$L1239:
	mov	eax, DWORD PTR _decl$[ebp]
	mov	al, BYTE PTR [eax+37]
	and	eax, 255				; 000000ffH
	mov	edx, 8
	mov	ecx, DWORD PTR _i$[ebp]
	inc	ecx
	shl	edx, cl
	cmp	eax, edx
	jl	$L1241
	jmp	$L1240
$L1241:
; Line 557
	cmp	DWORD PTR _i$[ebp], 0
	jle	$L1242
; Line 558
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	push	OFFSET $SG1244
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 561
$L1243:
$L1242:
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_assemble_name
	add	esp, 8
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	push	OFFSET $SG1245
	call	_fputs
	add	esp, 8
; Line 570
	mov	eax, DWORD PTR _decl$[ebp]
	cmp	DWORD PTR [eax+64], 0
	je	$L1246
; Line 572
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_int_size_in_bytes
	add	esp, 4
	push	eax
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+64]
	push	eax
	call	_output_constant
	add	esp, 8
; Line 573
	jmp	$L1248
$L1246:
; Line 575
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_int_size_in_bytes
	add	esp, 4
	push	eax
	push	OFFSET $SG1249
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
$L1248:
; Line 576
$L1205:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_assemble_variable ENDP
_TEXT	ENDS
PUBLIC	_assemble_external
_TEXT	SEGMENT
_decl$ = 8
_rtl$ = -4
_assemble_external PROC NEAR
; Line 584
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 585
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	DWORD PTR _rtl$[ebp], eax
; Line 587
	mov	eax, DWORD PTR _rtl$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1254
	mov	eax, DWORD PTR _rtl$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1254
; Line 594
$L1254:
$L1252:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_assemble_external ENDP
_TEXT	ENDS
_DATA	SEGMENT
$SG1260	DB	'_%s', 00H
_DATA	ENDS
_TEXT	SEGMENT
_file$ = 8
_name$ = 12
_assemble_name PROC NEAR
; Line 606
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 607
	mov	eax, DWORD PTR _name$[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 42					; 0000002aH
	jne	$L1258
; Line 608
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	mov	eax, DWORD PTR _name$[ebp]
	inc	eax
	push	eax
	call	_fputs
	add	esp, 8
; Line 609
	jmp	$L1259
$L1258:
; Line 610
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	push	OFFSET $SG1260
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
$L1259:
; Line 611
$L1257:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_assemble_name ENDP
_TEXT	ENDS
PUBLIC	_assemble_static_space
_DATA	SEGMENT
$SG1268	DB	'LF', 00H
	ORG $+1
$SG1269	DB	'*%s%d', 00H
	ORG $+2
$SG1270	DB	'.lcomm ', 00H
$SG1271	DB	',%u', 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_size$ = 8
_name$ = -24
_namestring$ = -8
_x$ = -12
_rounded$ = -4
_assemble_static_space PROC NEAR
; Line 619
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	push	ebx
	push	esi
	push	edi
; Line 627
	mov	eax, DWORD PTR _size$[ebp]
	add	eax, 3
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	shl	eax, 2
	mov	DWORD PTR _rounded$[ebp], eax
; Line 629
	cmp	DWORD PTR _flag_shared_data, 0
	je	$L1267
; Line 630
	call	_data_section
; Line 631
$L1267:
	mov	eax, DWORD PTR _const_labelno
	push	eax
	push	OFFSET $SG1268
	push	OFFSET $SG1269
	lea	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_sprintf
	add	esp, 16					; 00000010H
; Line 632
	inc	DWORD PTR _const_labelno
; Line 635
	lea	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_strlen
	add	esp, 4
	add	eax, 2
	mov	ecx, DWORD PTR _saveable_obstack
	mov	DWORD PTR [ecx+20], eax
	mov	eax, DWORD PTR _saveable_obstack
	mov	eax, DWORD PTR [eax+20]
	mov	ecx, DWORD PTR _saveable_obstack
	add	eax, DWORD PTR [ecx+12]
	mov	ecx, DWORD PTR _saveable_obstack
	cmp	eax, DWORD PTR [ecx+16]
	jbe	$L1788
	mov	eax, DWORD PTR _saveable_obstack
	mov	eax, DWORD PTR [eax+20]
	push	eax
	mov	eax, DWORD PTR _saveable_obstack
	push	eax
	call	__obstack_newchunk
	add	esp, 8
	jmp	$L1789
$L1788:
$L1789:
	mov	eax, DWORD PTR _saveable_obstack
	mov	eax, DWORD PTR [eax+20]
	mov	ecx, DWORD PTR _saveable_obstack
	add	DWORD PTR [ecx+12], eax
	mov	eax, DWORD PTR _saveable_obstack
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _saveable_obstack
	mov	DWORD PTR [ecx+20], eax
	mov	eax, DWORD PTR _saveable_obstack
	mov	eax, DWORD PTR [eax+12]
	mov	ecx, DWORD PTR _saveable_obstack
	add	eax, DWORD PTR [ecx+24]
	mov	ecx, DWORD PTR _saveable_obstack
	mov	ecx, DWORD PTR [ecx+24]
	not	ecx
	and	eax, ecx
	mov	ecx, DWORD PTR _saveable_obstack
	mov	DWORD PTR [ecx+12], eax
	mov	eax, DWORD PTR _saveable_obstack
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _saveable_obstack
	sub	eax, DWORD PTR [ecx+4]
	mov	ecx, DWORD PTR _saveable_obstack
	mov	ecx, DWORD PTR [ecx+12]
	mov	edx, DWORD PTR _saveable_obstack
	sub	ecx, DWORD PTR [edx+4]
	cmp	eax, ecx
	jge	$L1790
	mov	eax, DWORD PTR _saveable_obstack
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _saveable_obstack
	mov	DWORD PTR [ecx+12], eax
	jmp	$L1791
$L1790:
$L1791:
	mov	eax, DWORD PTR _saveable_obstack
	mov	eax, DWORD PTR [eax+12]
	mov	ecx, DWORD PTR _saveable_obstack
	mov	DWORD PTR [ecx+8], eax
	mov	eax, DWORD PTR _saveable_obstack
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _namestring$[ebp], eax
; Line 636
	lea	eax, DWORD PTR _name$[ebp]
	push	eax
	mov	eax, DWORD PTR _namestring$[ebp]
	push	eax
	call	_strcpy
	add	esp, 8
; Line 638
	mov	eax, DWORD PTR _namestring$[ebp]
	push	eax
	push	4
	push	39					; 00000027H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _x$[ebp], eax
; Line 639
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	push	OFFSET $SG1270
	call	_fputs
	add	esp, 8
	lea	eax, DWORD PTR _name$[ebp]
	push	eax
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_assemble_name
	add	esp, 8
	mov	eax, DWORD PTR _size$[ebp]
	push	eax
	push	OFFSET $SG1271
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 640
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L1262
; Line 641
$L1262:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_assemble_static_space ENDP
_TEXT	ENDS
PUBLIC	_immed_double_const
_BSS	SEGMENT
_real_constant_chain$S1272 DD 01H DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
_i0$ = 8
_i1$ = 12
_mode$ = 16
_r$ = -4
_immed_double_const PROC NEAR
; Line 663
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 666
	cmp	DWORD PTR _mode$[ebp], 6
	jne	$L1278
	cmp	DWORD PTR _i0$[ebp], 0
	jne	$L1278
	cmp	DWORD PTR _i1$[ebp], 0
	jne	$L1278
; Line 667
	mov	eax, DWORD PTR _const0_rtx
	jmp	$L1276
; Line 672
$L1278:
	mov	eax, DWORD PTR _real_constant_chain$S1272
	mov	DWORD PTR _r$[ebp], eax
	jmp	$L1279
$L1280:
	mov	eax, DWORD PTR _r$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _r$[ebp], eax
$L1279:
	cmp	DWORD PTR _r$[ebp], 0
	je	$L1281
; Line 674
	mov	eax, DWORD PTR _r$[ebp]
	mov	ecx, DWORD PTR _i0$[ebp]
	cmp	DWORD PTR [eax+12], ecx
	jne	$L1282
	mov	eax, DWORD PTR _r$[ebp]
	mov	ecx, DWORD PTR _i1$[ebp]
	cmp	DWORD PTR [eax+16], ecx
	jne	$L1282
	mov	eax, DWORD PTR _r$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	cmp	eax, DWORD PTR _mode$[ebp]
	jne	$L1282
; Line 675
	mov	eax, DWORD PTR _r$[ebp]
	jmp	$L1276
; Line 679
$L1282:
	jmp	$L1280
$L1281:
	mov	eax, DWORD PTR _i1$[ebp]
	push	eax
	mov	eax, DWORD PTR _i0$[ebp]
	push	eax
	push	0
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	push	31					; 0000001fH
	call	_gen_rtx
	add	esp, 20					; 00000014H
	mov	DWORD PTR _r$[ebp], eax
; Line 681
	mov	eax, DWORD PTR _real_constant_chain$S1272
	mov	ecx, DWORD PTR _r$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 682
	mov	eax, DWORD PTR _r$[ebp]
	mov	DWORD PTR _real_constant_chain$S1272, eax
; Line 687
	mov	eax, DWORD PTR _const0_rtx
	mov	ecx, DWORD PTR _r$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 689
	mov	eax, DWORD PTR _r$[ebp]
	jmp	$L1276
; Line 690
$L1276:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_immed_double_const ENDP
_TEXT	ENDS
PUBLIC	_immed_real_const_1
EXTRN	__fltused:NEAR
EXTRN	_fconst0_rtx:DWORD
EXTRN	_dconst0_rtx:DWORD
EXTRN	_memcmp:NEAR
EXTRN	_rtx_alloc:NEAR
_TEXT	SEGMENT
_d$ = 8
_mode$ = 16
_u$ = -8
_r$ = -12
_immed_real_const_1 PROC NEAR
; Line 699
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 706
	mov	eax, DWORD PTR _d$[ebp+4]
	mov	DWORD PTR _u$[ebp+4], eax
	mov	eax, DWORD PTR _d$[ebp]
	mov	DWORD PTR _u$[ebp], eax
; Line 710
	push	8
	lea	eax, DWORD PTR _u$[ebp]
	push	eax
	mov	eax, DWORD PTR _dconst0_rtx
	add	eax, 12					; 0000000cH
	push	eax
	call	_memcmp
	add	esp, 12					; 0000000cH
	or	eax, eax
	jne	$L1289
; Line 711
	cmp	DWORD PTR _mode$[ebp], 11		; 0000000bH
	jne	$L1792
	mov	eax, DWORD PTR _dconst0_rtx
	jmp	$L1793
$L1792:
	mov	eax, DWORD PTR _fconst0_rtx
$L1793:
	jmp	$L1285
; Line 713
$L1289:
; Line 714
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	mov	eax, DWORD PTR _u$[ebp+4]
	push	eax
	mov	eax, DWORD PTR _u$[ebp]
	push	eax
	call	_immed_double_const
	add	esp, 12					; 0000000cH
	jmp	$L1285
; Line 723
$L1290:
	mov	eax, DWORD PTR _real_constant_chain$S1272
	mov	DWORD PTR _r$[ebp], eax
	jmp	$L1291
$L1292:
	mov	eax, DWORD PTR _r$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _r$[ebp], eax
$L1291:
	cmp	DWORD PTR _r$[ebp], 0
	je	$L1293
; Line 725
	push	8
	lea	eax, DWORD PTR _u$[ebp]
	push	eax
	mov	eax, DWORD PTR _r$[ebp]
	add	eax, 12					; 0000000cH
	push	eax
	call	_memcmp
	add	esp, 12					; 0000000cH
	or	eax, eax
	jne	$L1294
	mov	eax, DWORD PTR _r$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	cmp	eax, DWORD PTR _mode$[ebp]
	jne	$L1294
; Line 726
	mov	eax, DWORD PTR _r$[ebp]
	jmp	$L1285
; Line 730
$L1294:
	jmp	$L1292
$L1293:
	push	31					; 0000001fH
	call	_rtx_alloc
	add	esp, 4
	mov	DWORD PTR _r$[ebp], eax
; Line 731
	mov	eax, DWORD PTR _r$[ebp]
	mov	eax, DWORD PTR [eax]
	and	eax, -16711681				; ff00ffffH
	mov	ecx, DWORD PTR _mode$[ebp]
	and	ecx, 255				; 000000ffH
	shl	ecx, 16					; 00000010H
	or	eax, ecx
	mov	ecx, DWORD PTR _r$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 732
	push	8
	lea	eax, DWORD PTR _u$[ebp]
	push	eax
	mov	eax, DWORD PTR _r$[ebp]
	add	eax, 12					; 0000000cH
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
; Line 734
	mov	eax, DWORD PTR _real_constant_chain$S1272
	mov	ecx, DWORD PTR _r$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 735
	mov	eax, DWORD PTR _r$[ebp]
	mov	DWORD PTR _real_constant_chain$S1272, eax
; Line 740
	mov	eax, DWORD PTR _const0_rtx
	mov	ecx, DWORD PTR _r$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 742
	mov	eax, DWORD PTR _r$[ebp]
	jmp	$L1285
; Line 743
$L1285:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_immed_real_const_1 ENDP
_TEXT	ENDS
PUBLIC	_immed_real_const
_TEXT	SEGMENT
_exp$ = 8
_immed_real_const PROC NEAR
; Line 751
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 752
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	sar	eax, 24					; 00000018H
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	mov	ecx, DWORD PTR [eax+28]
	push	ecx
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_immed_real_const_1
	add	esp, 12					; 0000000cH
	jmp	$L1296
; Line 753
$L1296:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_immed_real_const ENDP
_TEXT	ENDS
PUBLIC	_force_const_double_mem
PUBLIC	_force_const_mem
EXTRN	_cc0_rtx:DWORD
EXTRN	_memory_address_p:NEAR
_TEXT	SEGMENT
_r$ = 8
_force_const_double_mem PROC NEAR
; Line 763
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 764
	mov	eax, DWORD PTR _r$[ebp]
	mov	ecx, DWORD PTR _cc0_rtx
	cmp	DWORD PTR [eax+4], ecx
	jne	$L1299
; Line 766
	mov	eax, DWORD PTR _real_constant_chain$S1272
	mov	ecx, DWORD PTR _r$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 767
	mov	eax, DWORD PTR _r$[ebp]
	mov	DWORD PTR _real_constant_chain$S1272, eax
; Line 768
	mov	eax, DWORD PTR _const0_rtx
	mov	ecx, DWORD PTR _r$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 771
$L1299:
	mov	eax, DWORD PTR _r$[ebp]
	mov	ecx, DWORD PTR _const0_rtx
	cmp	DWORD PTR [eax+4], ecx
	jne	$L1300
; Line 773
	mov	eax, DWORD PTR _r$[ebp]
	push	eax
	mov	eax, DWORD PTR _r$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	call	_force_const_mem
	add	esp, 8
	mov	ecx, DWORD PTR _r$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 778
$L1300:
	mov	eax, DWORD PTR _r$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _r$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	call	_memory_address_p
	add	esp, 8
	or	eax, eax
	je	$L1302
; Line 779
	mov	eax, DWORD PTR _r$[ebp]
	mov	eax, DWORD PTR [eax+4]
	jmp	$L1298
; Line 780
$L1302:
	mov	eax, DWORD PTR _r$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _r$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	37					; 00000025H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	jmp	$L1298
; Line 781
$L1298:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_force_const_double_mem ENDP
_TEXT	ENDS
PUBLIC	_clear_const_double_mem
_TEXT	SEGMENT
_r$ = -4
_next$ = -8
_clear_const_double_mem PROC NEAR
; Line 789
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 792
	mov	eax, DWORD PTR _real_constant_chain$S1272
	mov	DWORD PTR _r$[ebp], eax
	jmp	$L1307
$L1308:
	mov	eax, DWORD PTR _next$[ebp]
	mov	DWORD PTR _r$[ebp], eax
$L1307:
	cmp	DWORD PTR _r$[ebp], 0
	je	$L1309
; Line 794
	mov	eax, DWORD PTR _r$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _next$[ebp], eax
; Line 795
	mov	eax, DWORD PTR _r$[ebp]
	mov	DWORD PTR [eax+8], 0
; Line 796
	mov	eax, DWORD PTR _cc0_rtx
	mov	ecx, DWORD PTR _r$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 797
	jmp	$L1308
$L1309:
; Line 798
	mov	DWORD PTR _real_constant_chain$S1272, 0
; Line 799
$L1304:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_clear_const_double_mem ENDP
_exp$ = 8
_value$ = 12
_target$ = -4
_offset$ = -12
_x$ = -8
_decode_addr_const PROC NEAR
; Line 816
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 817
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _target$[ebp], eax
; Line 818
	mov	DWORD PTR _offset$[ebp], 0
; Line 821
$L1319:
; Line 823
	mov	eax, DWORD PTR _target$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 47					; 0000002fH
	jne	$L1321
; Line 825
	mov	eax, DWORD PTR _target$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax+48]
	cdq
	and	edx, 7
	add	eax, edx
	sar	eax, 3
	add	DWORD PTR _offset$[ebp], eax
; Line 826
	mov	eax, DWORD PTR _target$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _target$[ebp], eax
; Line 828
	jmp	$L1322
$L1321:
	mov	eax, DWORD PTR _target$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 51					; 00000033H
	jne	$L1323
; Line 831
	mov	eax, DWORD PTR _target$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L1325
	mov	eax, DWORD PTR _target$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+28]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	je	$L1324
$L1325:
; Line 832
	call	_abort
; Line 833
$L1324:
; Line 836
	mov	eax, DWORD PTR _target$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+36]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _target$[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	mov	ecx, DWORD PTR [ecx+28]
	imul	eax, DWORD PTR [ecx+20]
	mov	ecx, DWORD PTR _target$[ebp]
	mov	ecx, DWORD PTR [ecx+28]
	imul	eax, DWORD PTR [ecx+20]
	cdq
	and	edx, 7
	add	eax, edx
	sar	eax, 3
	add	DWORD PTR _offset$[ebp], eax
; Line 837
	mov	eax, DWORD PTR _target$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _target$[ebp], eax
; Line 839
	jmp	$L1326
$L1323:
	jmp	$L1320
$L1326:
$L1322:
; Line 840
	jmp	$L1319
$L1320:
; Line 843
	mov	eax, DWORD PTR _target$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 43					; 0000002bH
	je	$L1328
	mov	eax, DWORD PTR _target$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 39					; 00000027H
	jne	$L1327
$L1328:
; Line 844
	mov	eax, DWORD PTR _target$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	DWORD PTR _x$[ebp], eax
; Line 845
	jmp	$L1329
$L1327:
	mov	eax, DWORD PTR _target$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 6
	test	al, 1
	je	$L1330
; Line 846
	mov	eax, DWORD PTR _target$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _x$[ebp], eax
; Line 847
	jmp	$L1331
$L1330:
; Line 848
	call	_abort
$L1331:
$L1329:
; Line 850
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1332
; Line 851
	call	_abort
; Line 852
$L1332:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x$[ebp], eax
; Line 854
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR _value$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 855
	mov	eax, DWORD PTR _offset$[ebp]
	mov	ecx, DWORD PTR _value$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 856
$L1314:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_decode_addr_const ENDP
_TEXT	ENDS
PUBLIC	_const_hash
_TEXT	SEGMENT
_link$1352 = -24
_value$1360 = -32
_exp$ = 8
_p$ = -16
_len$ = -20
_hi$ = -8
_i$ = -12
_code$ = -4
_const_hash PROC NEAR
; Line 883
	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H
	push	ebx
	push	esi
	push	edi
; Line 886
	mov	eax, DWORD PTR _exp$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _code$[ebp], eax
; Line 888
	cmp	DWORD PTR _code$[ebp], 35		; 00000023H
	jne	$L1343
; Line 890
	mov	eax, DWORD PTR _exp$[ebp]
	add	eax, 20					; 00000014H
	mov	DWORD PTR _p$[ebp], eax
; Line 891
	mov	DWORD PTR _len$[ebp], 8
; Line 893
	jmp	$L1344
$L1343:
	cmp	DWORD PTR _code$[ebp], 36		; 00000024H
	jne	$L1345
; Line 895
	mov	eax, DWORD PTR _exp$[ebp]
	add	eax, 24					; 00000018H
	mov	DWORD PTR _p$[ebp], eax
; Line 896
	mov	DWORD PTR _len$[ebp], 8
; Line 898
	jmp	$L1346
$L1345:
	cmp	DWORD PTR _code$[ebp], 38		; 00000026H
	jne	$L1347
; Line 899
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR _p$[ebp], eax
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _len$[ebp], eax
; Line 900
	jmp	$L1348
$L1347:
	cmp	DWORD PTR _code$[ebp], 37		; 00000025H
	jne	$L1349
; Line 902
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_const_hash
	add	esp, 4
	lea	ebx, DWORD PTR [eax+eax*4]
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	call	_const_hash
	add	esp, 4
	add	eax, ebx
	jmp	$L1337
; Line 903
	jmp	$L1350
$L1349:
	cmp	DWORD PTR _code$[ebp], 52		; 00000034H
	jne	$L1351
; Line 911
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 19					; 00000013H
	jne	$L1353
; Line 912
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	and	eax, 1073741823				; 3fffffffH
	mov	ecx, 1007				; 000003efH
	cdq
	idiv	ecx
	mov	DWORD PTR _hi$[ebp], edx
; Line 913
	jmp	$L1354
$L1353:
; Line 914
	mov	DWORD PTR _hi$[ebp], 5
$L1354:
; Line 916
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR _link$1352[ebp], eax
	jmp	$L1355
$L1356:
	mov	eax, DWORD PTR _link$1352[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _link$1352[ebp], eax
$L1355:
	cmp	DWORD PTR _link$1352[ebp], 0
	je	$L1357
; Line 917
	mov	eax, DWORD PTR _link$1352[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_const_hash
	add	esp, 4
	mov	ecx, DWORD PTR _hi$[ebp]
	mov	edx, ecx
	lea	ecx, DWORD PTR [ecx+ecx*4]
	lea	ecx, DWORD PTR [ecx+ecx*4]
	lea	ecx, DWORD PTR [edx+ecx*8]
	lea	ecx, DWORD PTR [ecx+ecx*2]
	add	eax, ecx
	mov	ecx, 1007				; 000003efH
	cdq
	idiv	ecx
	mov	DWORD PTR _hi$[ebp], edx
	jmp	$L1356
$L1357:
; Line 919
	mov	eax, DWORD PTR _hi$[ebp]
	jmp	$L1337
; Line 921
	jmp	$L1358
$L1351:
	cmp	DWORD PTR _code$[ebp], 116		; 00000074H
	jne	$L1359
; Line 924
	lea	eax, DWORD PTR _value$1360[ebp]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	push	eax
	call	_decode_addr_const
	add	esp, 8
; Line 925
	lea	eax, DWORD PTR _value$1360[ebp]
	mov	DWORD PTR _p$[ebp], eax
; Line 926
	mov	DWORD PTR _len$[ebp], 8
; Line 928
	jmp	$L1361
$L1359:
	cmp	DWORD PTR _code$[ebp], 64		; 00000040H
	je	$L1363
	cmp	DWORD PTR _code$[ebp], 65		; 00000041H
	jne	$L1362
$L1363:
; Line 930
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_const_hash
	add	esp, 4
	lea	ebx, DWORD PTR [eax+eax*8]
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	call	_const_hash
	add	esp, 4
	add	eax, ebx
	jmp	$L1337
; Line 931
	jmp	$L1364
$L1362:
	cmp	DWORD PTR _code$[ebp], 113		; 00000071H
	je	$L1366
	cmp	DWORD PTR _code$[ebp], 112		; 00000070H
	jne	$L1365
$L1366:
; Line 932
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_const_hash
	add	esp, 4
	lea	ecx, DWORD PTR [eax*8]
	sub	ecx, eax
	lea	eax, DWORD PTR [ecx+2]
	jmp	$L1337
; Line 935
$L1365:
$L1364:
$L1361:
$L1358:
$L1350:
$L1348:
$L1346:
$L1344:
	mov	eax, DWORD PTR _len$[ebp]
	mov	DWORD PTR _hi$[ebp], eax
; Line 936
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L1367
$L1368:
	inc	DWORD PTR _i$[ebp]
$L1367:
	mov	eax, DWORD PTR _len$[ebp]
	cmp	DWORD PTR _i$[ebp], eax
	jge	$L1369
; Line 937
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _p$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	mov	ecx, DWORD PTR _hi$[ebp]
	mov	edx, ecx
	lea	ecx, DWORD PTR [ecx+ecx*8]
	lea	ecx, DWORD PTR [edx+ecx*2]
	lea	ecx, DWORD PTR [edx+ecx*8]
	lea	ecx, DWORD PTR [edx+ecx*4]
	add	eax, ecx
	mov	DWORD PTR _hi$[ebp], eax
	jmp	$L1368
$L1369:
; Line 939
	and	DWORD PTR _hi$[ebp], 1073741823		; 3fffffffH
; Line 940
	mov	ecx, 1007				; 000003efH
	mov	eax, DWORD PTR _hi$[ebp]
	cdq
	idiv	ecx
	mov	DWORD PTR _hi$[ebp], edx
; Line 941
	mov	eax, DWORD PTR _hi$[ebp]
	jmp	$L1337
; Line 942
$L1337:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_const_hash ENDP
_exp$ = 8
_desc$ = 12
_compare_constant PROC NEAR
; Line 951
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 952
	mov	eax, DWORD PTR _desc$[ebp]
	add	eax, 8
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	push	eax
	call	_compare_constant_1
	add	esp, 8
	cmp	eax, 1
	sbb	eax, eax
	inc	eax
	jmp	$L1373
; Line 953
$L1373:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_compare_constant ENDP
_TEXT	ENDS
EXTRN	_flag_writable_strings:DWORD
EXTRN	_list_length:NEAR
_TEXT	SEGMENT
_value$1408 = -32
_exp$ = 8
_p$ = 12
_strp$ = -8
_len$ = -12
_code$ = -4
_link$1395 = -20
_length$1396 = -16
_type$1397 = -24
_compare_constant_1 PROC NEAR
; Line 968
	push	ebp
	mov	ebp, esp
	sub	esp, 68					; 00000044H
	push	ebx
	push	esi
	push	edi
; Line 971
	mov	eax, DWORD PTR _exp$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _code$[ebp], eax
; Line 973
	mov	eax, DWORD PTR _p$[ebp]
	mov	DWORD PTR -36+[ebp], eax
	inc	DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR -36+[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, DWORD PTR _code$[ebp]
	je	$L1380
; Line 974
	sub	eax, eax
	jmp	$L1376
; Line 976
$L1380:
	cmp	DWORD PTR _code$[ebp], 35		; 00000023H
	jne	$L1381
; Line 979
	mov	eax, DWORD PTR _p$[ebp]
	mov	DWORD PTR -40+[ebp], eax
	inc	DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR -40+[ebp]
	movsx	ecx, BYTE PTR [ecx]
	cmp	eax, ecx
	je	$L1382
; Line 980
	sub	eax, eax
	jmp	$L1376
; Line 981
$L1382:
	mov	eax, DWORD PTR _exp$[ebp]
	add	eax, 20					; 00000014H
	mov	DWORD PTR _strp$[ebp], eax
; Line 982
	mov	DWORD PTR _len$[ebp], 8
; Line 984
	jmp	$L1383
$L1381:
	cmp	DWORD PTR _code$[ebp], 36		; 00000024H
	jne	$L1384
; Line 987
	mov	eax, DWORD PTR _p$[ebp]
	mov	DWORD PTR -44+[ebp], eax
	inc	DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR -44+[ebp]
	movsx	ecx, BYTE PTR [ecx]
	cmp	eax, ecx
	je	$L1385
; Line 988
	sub	eax, eax
	jmp	$L1376
; Line 989
$L1385:
	mov	eax, DWORD PTR _exp$[ebp]
	add	eax, 24					; 00000018H
	mov	DWORD PTR _strp$[ebp], eax
; Line 990
	mov	DWORD PTR _len$[ebp], 8
; Line 992
	jmp	$L1386
$L1384:
	cmp	DWORD PTR _code$[ebp], 38		; 00000026H
	jne	$L1387
; Line 994
	cmp	DWORD PTR _flag_writable_strings, 0
	je	$L1388
; Line 995
	sub	eax, eax
	jmp	$L1376
; Line 996
$L1388:
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR _strp$[ebp], eax
; Line 997
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _len$[ebp], eax
; Line 998
	push	4
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	add	eax, 24					; 00000018H
	push	eax
	call	_memcmp
	add	esp, 12					; 0000000cH
	or	eax, eax
	je	$L1389
; Line 1000
	sub	eax, eax
	jmp	$L1376
; Line 1001
$L1389:
	add	DWORD PTR _p$[ebp], 4
; Line 1003
	jmp	$L1390
$L1387:
	cmp	DWORD PTR _code$[ebp], 37		; 00000025H
	jne	$L1391
; Line 1005
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_compare_constant_1
	add	esp, 8
	mov	DWORD PTR _p$[ebp], eax
; Line 1006
	cmp	DWORD PTR _p$[ebp], 0
	jne	$L1392
	sub	eax, eax
	jmp	$L1376
; Line 1007
$L1392:
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	call	_compare_constant_1
	add	esp, 8
	mov	DWORD PTR _p$[ebp], eax
; Line 1008
	mov	eax, DWORD PTR _p$[ebp]
	jmp	$L1376
; Line 1010
	jmp	$L1393
$L1391:
	cmp	DWORD PTR _code$[ebp], 52		; 00000034H
	jne	$L1394
; Line 1013
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	call	_list_length
	add	esp, 4
	mov	DWORD PTR _length$1396[ebp], eax
; Line 1016
	push	4
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	lea	eax, DWORD PTR _length$1396[ebp]
	push	eax
	call	_memcmp
	add	esp, 12					; 0000000cH
	or	eax, eax
	je	$L1398
; Line 1017
	sub	eax, eax
	jmp	$L1376
; Line 1018
$L1398:
	add	DWORD PTR _p$[ebp], 4
; Line 1022
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 19					; 00000013H
	jne	$L1399
; Line 1023
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _type$1397[ebp], eax
; Line 1024
	jmp	$L1400
$L1399:
; Line 1025
	mov	DWORD PTR _type$1397[ebp], 0
$L1400:
; Line 1026
	push	4
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	lea	eax, DWORD PTR _type$1397[ebp]
	push	eax
	call	_memcmp
	add	esp, 12					; 0000000cH
	or	eax, eax
	je	$L1401
; Line 1027
	sub	eax, eax
	jmp	$L1376
; Line 1028
$L1401:
	add	DWORD PTR _p$[ebp], 4
; Line 1030
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR _link$1395[ebp], eax
	jmp	$L1402
$L1403:
	mov	eax, DWORD PTR _link$1395[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _link$1395[ebp], eax
$L1402:
	cmp	DWORD PTR _link$1395[ebp], 0
	je	$L1404
; Line 1031
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	mov	eax, DWORD PTR _link$1395[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_compare_constant_1
	add	esp, 8
	mov	DWORD PTR _p$[ebp], eax
	cmp	DWORD PTR _p$[ebp], 0
	jne	$L1405
; Line 1032
	sub	eax, eax
	jmp	$L1376
; Line 1033
$L1405:
	jmp	$L1403
$L1404:
	mov	eax, DWORD PTR _p$[ebp]
	jmp	$L1376
; Line 1035
	jmp	$L1406
$L1394:
	cmp	DWORD PTR _code$[ebp], 116		; 00000074H
	jne	$L1407
; Line 1038
	lea	eax, DWORD PTR _value$1408[ebp]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	push	eax
	call	_decode_addr_const
	add	esp, 8
; Line 1039
	lea	eax, DWORD PTR _value$1408[ebp]
	mov	DWORD PTR _strp$[ebp], eax
; Line 1040
	mov	DWORD PTR _len$[ebp], 8
; Line 1042
$L1410:
	dec	DWORD PTR _len$[ebp]
	js	$L1411
; Line 1043
	mov	eax, DWORD PTR _p$[ebp]
	mov	DWORD PTR -48+[ebp], eax
	inc	DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR _strp$[ebp]
	mov	DWORD PTR -52+[ebp], eax
	inc	DWORD PTR _strp$[ebp]
	mov	eax, DWORD PTR -48+[ebp]
	movsx	eax, BYTE PTR [eax]
	mov	ecx, DWORD PTR -52+[ebp]
	movsx	ecx, BYTE PTR [ecx]
	cmp	eax, ecx
	je	$L1412
; Line 1044
	sub	eax, eax
	jmp	$L1376
; Line 1046
$L1412:
	jmp	$L1410
$L1411:
	mov	eax, DWORD PTR _value$1408[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _strp$[ebp], eax
; Line 1047
	mov	eax, DWORD PTR _strp$[ebp]
	push	eax
	call	_strlen
	add	esp, 4
	inc	eax
	mov	DWORD PTR _len$[ebp], eax
; Line 1049
	jmp	$L1413
$L1407:
	cmp	DWORD PTR _code$[ebp], 64		; 00000040H
	je	$L1415
	cmp	DWORD PTR _code$[ebp], 65		; 00000041H
	jne	$L1414
$L1415:
; Line 1051
	mov	eax, DWORD PTR _p$[ebp]
	mov	DWORD PTR -56+[ebp], eax
	inc	DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR -56+[ebp]
	movsx	eax, BYTE PTR [eax]
	movsx	ecx, BYTE PTR _code$[ebp]
	cmp	eax, ecx
	je	$L1416
; Line 1052
	sub	eax, eax
	jmp	$L1376
; Line 1053
$L1416:
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_compare_constant_1
	add	esp, 8
	mov	DWORD PTR _p$[ebp], eax
; Line 1054
	cmp	DWORD PTR _p$[ebp], 0
	jne	$L1417
	sub	eax, eax
	jmp	$L1376
; Line 1055
$L1417:
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	call	_compare_constant_1
	add	esp, 8
	mov	DWORD PTR _p$[ebp], eax
; Line 1056
	mov	eax, DWORD PTR _p$[ebp]
	jmp	$L1376
; Line 1058
	jmp	$L1418
$L1414:
	cmp	DWORD PTR _code$[ebp], 113		; 00000071H
	je	$L1420
	cmp	DWORD PTR _code$[ebp], 112		; 00000070H
	jne	$L1419
$L1420:
; Line 1060
	mov	eax, DWORD PTR _p$[ebp]
	mov	DWORD PTR -60+[ebp], eax
	inc	DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR -60+[ebp]
	movsx	eax, BYTE PTR [eax]
	movsx	ecx, BYTE PTR _code$[ebp]
	cmp	eax, ecx
	je	$L1421
; Line 1061
	sub	eax, eax
	jmp	$L1376
; Line 1062
$L1421:
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_compare_constant_1
	add	esp, 8
	mov	DWORD PTR _p$[ebp], eax
; Line 1063
	mov	eax, DWORD PTR _p$[ebp]
	jmp	$L1376
; Line 1067
$L1419:
$L1418:
$L1413:
$L1406:
$L1393:
$L1390:
$L1386:
$L1383:
$L1423:
	dec	DWORD PTR _len$[ebp]
	js	$L1424
; Line 1068
	mov	eax, DWORD PTR _p$[ebp]
	mov	DWORD PTR -64+[ebp], eax
	inc	DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR _strp$[ebp]
	mov	DWORD PTR -68+[ebp], eax
	inc	DWORD PTR _strp$[ebp]
	mov	eax, DWORD PTR -64+[ebp]
	movsx	eax, BYTE PTR [eax]
	mov	ecx, DWORD PTR -68+[ebp]
	movsx	ecx, BYTE PTR [ecx]
	cmp	eax, ecx
	je	$L1425
; Line 1069
	sub	eax, eax
	jmp	$L1376
; Line 1071
$L1425:
	jmp	$L1423
$L1424:
	mov	eax, DWORD PTR _p$[ebp]
	jmp	$L1376
; Line 1072
$L1376:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_compare_constant_1 ENDP
_TEXT	ENDS
EXTRN	_permanent_obstack:BYTE
_TEXT	SEGMENT
_exp$ = 8
_ptr$ = -8
_buf$ = -4
_record_constant PROC NEAR
; Line 1080
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 1081
	mov	DWORD PTR _ptr$[ebp], 0
; Line 1084
	mov	DWORD PTR _permanent_obstack+20, 4
	mov	eax, DWORD PTR _permanent_obstack+20
	add	eax, DWORD PTR _permanent_obstack+12
	cmp	eax, DWORD PTR _permanent_obstack+16
	jbe	$L1795
	mov	eax, DWORD PTR _permanent_obstack+20
	push	eax
	push	OFFSET _permanent_obstack
	call	__obstack_newchunk
	add	esp, 8
	jmp	$L1796
$L1795:
$L1796:
	mov	eax, DWORD PTR _permanent_obstack+20
	push	eax
	lea	eax, DWORD PTR _ptr$[ebp]
	push	eax
	mov	eax, DWORD PTR _permanent_obstack+12
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
	mov	eax, DWORD PTR _permanent_obstack+20
	add	DWORD PTR _permanent_obstack+12, eax
; Line 1085
	mov	DWORD PTR _permanent_obstack+20, 4
	mov	eax, DWORD PTR _permanent_obstack+20
	add	eax, DWORD PTR _permanent_obstack+12
	cmp	eax, DWORD PTR _permanent_obstack+16
	jbe	$L1797
	mov	eax, DWORD PTR _permanent_obstack+20
	push	eax
	push	OFFSET _permanent_obstack
	call	__obstack_newchunk
	add	esp, 8
	jmp	$L1798
$L1797:
$L1798:
	mov	eax, DWORD PTR _permanent_obstack+20
	push	eax
	lea	eax, DWORD PTR _buf$[ebp]
	push	eax
	mov	eax, DWORD PTR _permanent_obstack+12
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
	mov	eax, DWORD PTR _permanent_obstack+20
	add	DWORD PTR _permanent_obstack+12, eax
; Line 1086
	mov	eax, DWORD PTR _exp$[ebp]
	push	eax
	call	_record_constant_1
	add	esp, 4
; Line 1087
	mov	eax, DWORD PTR _permanent_obstack+8
	mov	DWORD PTR _permanent_obstack+20, eax
	mov	eax, DWORD PTR _permanent_obstack+12
	add	eax, DWORD PTR _permanent_obstack+24
	mov	ecx, DWORD PTR _permanent_obstack+24
	not	ecx
	and	eax, ecx
	mov	DWORD PTR _permanent_obstack+12, eax
	mov	eax, DWORD PTR _permanent_obstack+12
	sub	eax, DWORD PTR _permanent_obstack+4
	mov	ecx, DWORD PTR _permanent_obstack+16
	sub	ecx, DWORD PTR _permanent_obstack+4
	cmp	eax, ecx
	jle	$L1799
	mov	eax, DWORD PTR _permanent_obstack+16
	mov	DWORD PTR _permanent_obstack+12, eax
	jmp	$L1800
$L1799:
$L1800:
	mov	eax, DWORD PTR _permanent_obstack+12
	mov	DWORD PTR _permanent_obstack+8, eax
	mov	eax, DWORD PTR _permanent_obstack+20
	jmp	$L1428
; Line 1088
$L1428:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_record_constant ENDP
_exp$ = 8
_strp$ = -8
_len$ = -12
_code$ = -4
_link$1446 = -20
_length$1447 = -16
_type$1448 = -24
_value$1456 = -32
_record_constant_1 PROC NEAR
; Line 1098
	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H
	push	ebx
	push	esi
	push	edi
; Line 1101
	mov	eax, DWORD PTR _exp$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _code$[ebp], eax
; Line 1103
	mov	eax, DWORD PTR _permanent_obstack+12
	inc	eax
	cmp	eax, DWORD PTR _permanent_obstack+16
	jbe	$L1801
	push	1
	push	OFFSET _permanent_obstack
	call	__obstack_newchunk
	add	esp, 8
	jmp	$L1802
$L1801:
$L1802:
	mov	al, BYTE PTR _code$[ebp]
	mov	ecx, DWORD PTR _permanent_obstack+12
	mov	BYTE PTR [ecx], al
	inc	DWORD PTR _permanent_obstack+12
; Line 1105
	cmp	DWORD PTR _code$[ebp], 35		; 00000023H
	jne	$L1436
; Line 1107
	mov	eax, DWORD PTR _permanent_obstack+12
	inc	eax
	cmp	eax, DWORD PTR _permanent_obstack+16
	jbe	$L1803
	push	1
	push	OFFSET _permanent_obstack
	call	__obstack_newchunk
	add	esp, 8
	jmp	$L1804
$L1803:
$L1804:
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+38]
	mov	ecx, DWORD PTR _permanent_obstack+12
	mov	BYTE PTR [ecx], al
	inc	DWORD PTR _permanent_obstack+12
; Line 1108
	mov	eax, DWORD PTR _exp$[ebp]
	add	eax, 20					; 00000014H
	mov	DWORD PTR _strp$[ebp], eax
; Line 1109
	mov	DWORD PTR _len$[ebp], 8
; Line 1111
	jmp	$L1437
$L1436:
	cmp	DWORD PTR _code$[ebp], 36		; 00000024H
	jne	$L1438
; Line 1113
	mov	eax, DWORD PTR _permanent_obstack+12
	inc	eax
	cmp	eax, DWORD PTR _permanent_obstack+16
	jbe	$L1805
	push	1
	push	OFFSET _permanent_obstack
	call	__obstack_newchunk
	add	esp, 8
	jmp	$L1806
$L1805:
$L1806:
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+38]
	mov	ecx, DWORD PTR _permanent_obstack+12
	mov	BYTE PTR [ecx], al
	inc	DWORD PTR _permanent_obstack+12
; Line 1114
	mov	eax, DWORD PTR _exp$[ebp]
	add	eax, 24					; 00000018H
	mov	DWORD PTR _strp$[ebp], eax
; Line 1115
	mov	DWORD PTR _len$[ebp], 8
; Line 1117
	jmp	$L1439
$L1438:
	cmp	DWORD PTR _code$[ebp], 38		; 00000026H
	jne	$L1440
; Line 1119
	cmp	DWORD PTR _flag_writable_strings, 0
	je	$L1441
; Line 1120
	jmp	$L1432
; Line 1121
$L1441:
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR _strp$[ebp], eax
; Line 1122
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _len$[ebp], eax
; Line 1124
	mov	DWORD PTR _permanent_obstack+20, 4
	mov	eax, DWORD PTR _permanent_obstack+20
	add	eax, DWORD PTR _permanent_obstack+12
	cmp	eax, DWORD PTR _permanent_obstack+16
	jbe	$L1807
	mov	eax, DWORD PTR _permanent_obstack+20
	push	eax
	push	OFFSET _permanent_obstack
	call	__obstack_newchunk
	add	esp, 8
	jmp	$L1808
$L1807:
$L1808:
	mov	eax, DWORD PTR _permanent_obstack+20
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	add	eax, 24					; 00000018H
	push	eax
	mov	eax, DWORD PTR _permanent_obstack+12
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
	mov	eax, DWORD PTR _permanent_obstack+20
	add	DWORD PTR _permanent_obstack+12, eax
; Line 1126
	jmp	$L1442
$L1440:
	cmp	DWORD PTR _code$[ebp], 37		; 00000025H
	jne	$L1443
; Line 1128
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_record_constant_1
	add	esp, 4
; Line 1129
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	call	_record_constant_1
	add	esp, 4
; Line 1130
	jmp	$L1432
; Line 1132
	jmp	$L1444
$L1443:
	cmp	DWORD PTR _code$[ebp], 52		; 00000034H
	jne	$L1445
; Line 1135
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	call	_list_length
	add	esp, 4
	mov	DWORD PTR _length$1447[ebp], eax
; Line 1138
	mov	DWORD PTR _permanent_obstack+20, 4
	mov	eax, DWORD PTR _permanent_obstack+20
	add	eax, DWORD PTR _permanent_obstack+12
	cmp	eax, DWORD PTR _permanent_obstack+16
	jbe	$L1809
	mov	eax, DWORD PTR _permanent_obstack+20
	push	eax
	push	OFFSET _permanent_obstack
	call	__obstack_newchunk
	add	esp, 8
	jmp	$L1810
$L1809:
$L1810:
	mov	eax, DWORD PTR _permanent_obstack+20
	push	eax
	lea	eax, DWORD PTR _length$1447[ebp]
	push	eax
	mov	eax, DWORD PTR _permanent_obstack+12
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
	mov	eax, DWORD PTR _permanent_obstack+20
	add	DWORD PTR _permanent_obstack+12, eax
; Line 1142
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 19					; 00000013H
	jne	$L1449
; Line 1143
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _type$1448[ebp], eax
; Line 1144
	jmp	$L1450
$L1449:
; Line 1145
	mov	DWORD PTR _type$1448[ebp], 0
$L1450:
; Line 1146
	mov	DWORD PTR _permanent_obstack+20, 4
	mov	eax, DWORD PTR _permanent_obstack+20
	add	eax, DWORD PTR _permanent_obstack+12
	cmp	eax, DWORD PTR _permanent_obstack+16
	jbe	$L1811
	mov	eax, DWORD PTR _permanent_obstack+20
	push	eax
	push	OFFSET _permanent_obstack
	call	__obstack_newchunk
	add	esp, 8
	jmp	$L1812
$L1811:
$L1812:
	mov	eax, DWORD PTR _permanent_obstack+20
	push	eax
	lea	eax, DWORD PTR _type$1448[ebp]
	push	eax
	mov	eax, DWORD PTR _permanent_obstack+12
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
	mov	eax, DWORD PTR _permanent_obstack+20
	add	DWORD PTR _permanent_obstack+12, eax
; Line 1148
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR _link$1446[ebp], eax
	jmp	$L1451
$L1452:
	mov	eax, DWORD PTR _link$1446[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _link$1446[ebp], eax
$L1451:
	cmp	DWORD PTR _link$1446[ebp], 0
	je	$L1453
; Line 1149
	mov	eax, DWORD PTR _link$1446[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_record_constant_1
	add	esp, 4
	jmp	$L1452
$L1453:
; Line 1150
	jmp	$L1432
; Line 1152
	jmp	$L1454
$L1445:
	cmp	DWORD PTR _code$[ebp], 116		; 00000074H
	jne	$L1455
; Line 1155
	lea	eax, DWORD PTR _value$1456[ebp]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	push	eax
	call	_decode_addr_const
	add	esp, 8
; Line 1157
	mov	DWORD PTR _permanent_obstack+20, 8
	mov	eax, DWORD PTR _permanent_obstack+20
	add	eax, DWORD PTR _permanent_obstack+12
	cmp	eax, DWORD PTR _permanent_obstack+16
	jbe	$L1813
	mov	eax, DWORD PTR _permanent_obstack+20
	push	eax
	push	OFFSET _permanent_obstack
	call	__obstack_newchunk
	add	esp, 8
	jmp	$L1814
$L1813:
$L1814:
	mov	eax, DWORD PTR _permanent_obstack+20
	push	eax
	lea	eax, DWORD PTR _value$1456[ebp]
	push	eax
	mov	eax, DWORD PTR _permanent_obstack+12
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
	mov	eax, DWORD PTR _permanent_obstack+20
	add	DWORD PTR _permanent_obstack+12, eax
; Line 1160
	mov	eax, DWORD PTR _value$1456[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_strlen
	add	esp, 4
	inc	eax
	mov	DWORD PTR _permanent_obstack+20, eax
	mov	eax, DWORD PTR _permanent_obstack+20
	add	eax, DWORD PTR _permanent_obstack+12
	cmp	eax, DWORD PTR _permanent_obstack+16
	jbe	$L1815
	mov	eax, DWORD PTR _permanent_obstack+20
	push	eax
	push	OFFSET _permanent_obstack
	call	__obstack_newchunk
	add	esp, 8
	jmp	$L1816
$L1815:
$L1816:
	mov	eax, DWORD PTR _permanent_obstack+20
	push	eax
	mov	eax, DWORD PTR _value$1456[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _permanent_obstack+12
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
	mov	eax, DWORD PTR _permanent_obstack+20
	add	DWORD PTR _permanent_obstack+12, eax
; Line 1161
	jmp	$L1432
; Line 1163
	jmp	$L1457
$L1455:
	cmp	DWORD PTR _code$[ebp], 64		; 00000040H
	je	$L1459
	cmp	DWORD PTR _code$[ebp], 65		; 00000041H
	jne	$L1458
$L1459:
; Line 1165
	mov	eax, DWORD PTR _permanent_obstack+12
	inc	eax
	cmp	eax, DWORD PTR _permanent_obstack+16
	jbe	$L1817
	push	1
	push	OFFSET _permanent_obstack
	call	__obstack_newchunk
	add	esp, 8
	jmp	$L1818
$L1817:
$L1818:
	mov	al, BYTE PTR _code$[ebp]
	mov	ecx, DWORD PTR _permanent_obstack+12
	mov	BYTE PTR [ecx], al
	inc	DWORD PTR _permanent_obstack+12
; Line 1166
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_record_constant_1
	add	esp, 4
; Line 1167
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	call	_record_constant_1
	add	esp, 4
; Line 1168
	jmp	$L1432
; Line 1170
	jmp	$L1460
$L1458:
	cmp	DWORD PTR _code$[ebp], 113		; 00000071H
	je	$L1462
	cmp	DWORD PTR _code$[ebp], 112		; 00000070H
	jne	$L1461
$L1462:
; Line 1172
	mov	eax, DWORD PTR _permanent_obstack+12
	inc	eax
	cmp	eax, DWORD PTR _permanent_obstack+16
	jbe	$L1819
	push	1
	push	OFFSET _permanent_obstack
	call	__obstack_newchunk
	add	esp, 8
	jmp	$L1820
$L1819:
$L1820:
	mov	al, BYTE PTR _code$[ebp]
	mov	ecx, DWORD PTR _permanent_obstack+12
	mov	BYTE PTR [ecx], al
	inc	DWORD PTR _permanent_obstack+12
; Line 1173
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_record_constant_1
	add	esp, 4
; Line 1174
	jmp	$L1432
; Line 1178
$L1461:
$L1460:
$L1457:
$L1454:
$L1444:
$L1442:
$L1439:
$L1437:
	mov	eax, DWORD PTR _len$[ebp]
	mov	DWORD PTR _permanent_obstack+20, eax
	mov	eax, DWORD PTR _permanent_obstack+20
	add	eax, DWORD PTR _permanent_obstack+12
	cmp	eax, DWORD PTR _permanent_obstack+16
	jbe	$L1821
	mov	eax, DWORD PTR _permanent_obstack+20
	push	eax
	push	OFFSET _permanent_obstack
	call	__obstack_newchunk
	add	esp, 8
	jmp	$L1822
$L1821:
$L1822:
	mov	eax, DWORD PTR _permanent_obstack+20
	push	eax
	mov	eax, DWORD PTR _strp$[ebp]
	push	eax
	mov	eax, DWORD PTR _permanent_obstack+12
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
	mov	eax, DWORD PTR _permanent_obstack+20
	add	DWORD PTR _permanent_obstack+12, eax
; Line 1179
$L1432:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_record_constant_1 ENDP
_TEXT	ENDS
_BSS	SEGMENT
_const_hash_table$S1334 DD 03efH DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+3
$SG1482	DB	09H, '.align %d', 0aH, 00H
$SG1483	DB	'LC', 00H
	ORG $+1
$SG1484	DB	'%s%d:', 0aH, 00H
	ORG $+1
$SG1485	DB	'LC', 00H
	ORG $+1
$SG1486	DB	'*%s%d', 00H
_DATA	ENDS
_TEXT	SEGMENT
_exp$ = 8
_hash$ = -8
_i$ = -12
_align$ = -4
_desc$ = -272
_label$ = -268
_get_or_assign_label PROC NEAR
; Line 1189
	push	ebp
	mov	ebp, esp
	sub	esp, 276				; 00000114H
	push	ebx
	push	esi
	push	edi
; Line 1197
	mov	eax, DWORD PTR _exp$[ebp]
	push	eax
	call	_output_addressed_constants
	add	esp, 4
; Line 1203
	mov	eax, DWORD PTR _exp$[ebp]
	push	eax
	call	_const_hash
	add	esp, 4
	mov	ecx, 1007				; 000003efH
	cdq
	idiv	ecx
	mov	DWORD PTR _hash$[ebp], edx
; Line 1205
	mov	eax, DWORD PTR _hash$[ebp]
	mov	eax, DWORD PTR _const_hash_table$S1334[eax*4]
	mov	DWORD PTR _desc$[ebp], eax
	jmp	$L1471
$L1472:
	mov	eax, DWORD PTR _desc$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _desc$[ebp], eax
$L1471:
	cmp	DWORD PTR _desc$[ebp], 0
	je	$L1473
; Line 1206
	mov	eax, DWORD PTR _desc$[ebp]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	push	eax
	call	_compare_constant
	add	esp, 8
	or	eax, eax
	je	$L1474
; Line 1207
	mov	eax, DWORD PTR _desc$[ebp]
	mov	eax, DWORD PTR [eax+4]
	jmp	$L1465
; Line 1214
$L1474:
	jmp	$L1472
$L1473:
	mov	eax, DWORD PTR _exp$[ebp]
	push	eax
	call	_record_constant
	add	esp, 4
	mov	DWORD PTR _desc$[ebp], eax
; Line 1215
	mov	eax, DWORD PTR _hash$[ebp]
	mov	eax, DWORD PTR _const_hash_table$S1334[eax*4]
	mov	ecx, DWORD PTR _desc$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 1216
	mov	eax, DWORD PTR _desc$[ebp]
	mov	ecx, DWORD PTR _hash$[ebp]
	mov	DWORD PTR _const_hash_table$S1334[ecx*4], eax
; Line 1225
	mov	eax, DWORD PTR _exp$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 38					; 00000026H
	jne	$L1475
	cmp	DWORD PTR _flag_writable_strings, 0
	je	$L1475
; Line 1226
	call	_data_section
; Line 1227
	jmp	$L1476
$L1475:
; Line 1228
	call	_text_section
$L1476:
; Line 1235
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+37]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _align$[ebp], eax
; Line 1238
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L1477
$L1478:
	inc	DWORD PTR _i$[ebp]
$L1477:
	mov	eax, 8
	mov	ecx, DWORD PTR _i$[ebp]
	inc	ecx
	shl	eax, cl
	cmp	eax, DWORD PTR _align$[ebp]
	jg	$L1479
	jmp	$L1478
$L1479:
; Line 1239
	cmp	DWORD PTR _i$[ebp], 0
	jle	$L1480
; Line 1240
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	push	OFFSET $SG1482
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 1243
$L1481:
$L1480:
	mov	eax, DWORD PTR _const_labelno
	push	eax
	push	OFFSET $SG1483
	push	OFFSET $SG1484
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
; Line 1249
	mov	eax, DWORD PTR _exp$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 38					; 00000026H
	jne	$L1823
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR -276+[ebp], eax
	jmp	$L1824
$L1823:
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_int_size_in_bytes
	add	esp, 4
	mov	DWORD PTR -276+[ebp], eax
$L1824:
	mov	eax, DWORD PTR -276+[ebp]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	push	eax
	call	_output_constant
	add	esp, 8
; Line 1252
	mov	eax, DWORD PTR _const_labelno
	push	eax
	push	OFFSET $SG1485
	push	OFFSET $SG1486
	lea	eax, DWORD PTR _label$[ebp]
	push	eax
	call	_sprintf
	add	esp, 16					; 00000010H
; Line 1254
	inc	DWORD PTR _const_labelno
; Line 1257
	lea	eax, DWORD PTR _label$[ebp]
	push	eax
	call	_strlen
	add	esp, 4
	mov	DWORD PTR _permanent_obstack+20, eax
	mov	eax, DWORD PTR _permanent_obstack+20
	add	eax, DWORD PTR _permanent_obstack+12
	inc	eax
	cmp	eax, DWORD PTR _permanent_obstack+16
	jbe	$L1825
	mov	eax, DWORD PTR _permanent_obstack+20
	inc	eax
	push	eax
	push	OFFSET _permanent_obstack
	call	__obstack_newchunk
	add	esp, 8
	jmp	$L1826
$L1825:
$L1826:
	mov	eax, DWORD PTR _permanent_obstack+20
	push	eax
	lea	eax, DWORD PTR _label$[ebp]
	push	eax
	mov	eax, DWORD PTR _permanent_obstack+12
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
	mov	eax, DWORD PTR _permanent_obstack+20
	add	DWORD PTR _permanent_obstack+12, eax
	mov	eax, DWORD PTR _permanent_obstack+12
	mov	BYTE PTR [eax], 0
	inc	DWORD PTR _permanent_obstack+12
	mov	eax, DWORD PTR _permanent_obstack+8
	mov	DWORD PTR _permanent_obstack+20, eax
	mov	eax, DWORD PTR _permanent_obstack+12
	add	eax, DWORD PTR _permanent_obstack+24
	mov	ecx, DWORD PTR _permanent_obstack+24
	not	ecx
	and	eax, ecx
	mov	DWORD PTR _permanent_obstack+12, eax
	mov	eax, DWORD PTR _permanent_obstack+12
	sub	eax, DWORD PTR _permanent_obstack+4
	mov	ecx, DWORD PTR _permanent_obstack+16
	sub	ecx, DWORD PTR _permanent_obstack+4
	cmp	eax, ecx
	jle	$L1827
	mov	eax, DWORD PTR _permanent_obstack+16
	mov	DWORD PTR _permanent_obstack+12, eax
	jmp	$L1828
$L1827:
$L1828:
	mov	eax, DWORD PTR _permanent_obstack+12
	mov	DWORD PTR _permanent_obstack+8, eax
	mov	eax, DWORD PTR _permanent_obstack+20
	mov	ecx, DWORD PTR _desc$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 1259
	mov	eax, DWORD PTR _desc$[ebp]
	mov	eax, DWORD PTR [eax+4]
	jmp	$L1465
; Line 1260
$L1465:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_get_or_assign_label ENDP
_TEXT	ENDS
PUBLIC	_output_constant_def
EXTRN	_allocation_temporary_p:NEAR
EXTRN	_end_temporary_allocation:NEAR
EXTRN	_resume_temporary_allocation:NEAR
_TEXT	SEGMENT
_exp$ = 8
_def$ = -4
_temp_p$ = -8
_output_constant_def PROC NEAR
; Line 1272
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 1274
	call	_allocation_temporary_p
	mov	DWORD PTR _temp_p$[ebp], eax
; Line 1276
	mov	eax, DWORD PTR _exp$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L1492
; Line 1277
	call	_abort
; Line 1279
$L1492:
	mov	eax, DWORD PTR _exp$[ebp]
	cmp	DWORD PTR [eax+20], 0
	je	$L1493
; Line 1280
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+20]
	jmp	$L1488
; Line 1282
$L1493:
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 8
	test	al, 1
	je	$L1494
; Line 1283
	call	_end_temporary_allocation
; Line 1285
$L1494:
	mov	eax, DWORD PTR _exp$[ebp]
	push	eax
	call	_get_or_assign_label
	add	esp, 4
	push	eax
	push	4
	push	39					; 00000027H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _def$[ebp], eax
; Line 1288
	mov	eax, DWORD PTR _def$[ebp]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	sar	eax, 24					; 00000018H
	push	eax
	push	37					; 00000025H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _exp$[ebp]
	mov	DWORD PTR [ecx+20], eax
; Line 1289
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	eax, DWORD PTR [eax]
	or	eax, 67108864				; 04000000H
	mov	ecx, DWORD PTR _exp$[ebp]
	mov	ecx, DWORD PTR [ecx+20]
	mov	DWORD PTR [ecx], eax
; Line 1291
	cmp	DWORD PTR _temp_p$[ebp], 0
	je	$L1496
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 8
	test	al, 1
	je	$L1496
; Line 1292
	call	_resume_temporary_allocation
; Line 1294
$L1496:
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+20]
	jmp	$L1488
; Line 1295
$L1488:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_constant_def ENDP
_TEXT	ENDS
PUBLIC	_init_const_rtx_hash_table
EXTRN	_memset:NEAR
_BSS	SEGMENT
_const_rtx_hash_table$S1498 DD 03dH DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
_init_const_rtx_hash_table PROC NEAR
; Line 1310
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1311
	push	244					; 000000f4H
	push	0
	push	OFFSET _const_rtx_hash_table$S1498
	call	_memset
	add	esp, 12					; 0000000cH
; Line 1312
$L1500:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_init_const_rtx_hash_table ENDP
_mode$ = 8
_x$ = 12
_value$ = 16
_p$1512 = -8
_end$1513 = -4
_decode_rtx_const PROC NEAR
; Line 1333
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 1337
	mov	eax, DWORD PTR _value$[ebp]
	mov	DWORD PTR _p$1512[ebp], eax
; Line 1338
	mov	eax, DWORD PTR _value$[ebp]
	add	eax, 16					; 00000010H
	mov	DWORD PTR _end$1513[ebp], eax
; Line 1339
$L1515:
	mov	eax, DWORD PTR _p$1512[ebp]
	cmp	DWORD PTR _end$1513[ebp], eax
	jbe	$L1516
; Line 1340
	mov	eax, DWORD PTR _p$1512[ebp]
	mov	DWORD PTR [eax], 0
	add	DWORD PTR _p$1512[ebp], 4
	jmp	$L1515
$L1516:
; Line 1343
	mov	eax, DWORD PTR _value$[ebp]
	mov	eax, DWORD PTR [eax]
	and	eax, -65535				; ffff0001H
	or	eax, 1
	mov	ecx, DWORD PTR _value$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 1344
	mov	eax, DWORD PTR _value$[ebp]
	mov	eax, DWORD PTR [eax]
	and	eax, 65535				; 0000ffffH
	mov	ecx, DWORD PTR _mode$[ebp]
	shl	ecx, 16					; 00000010H
	or	eax, ecx
	mov	ecx, DWORD PTR _value$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 1346
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR -12+[ebp], eax
	jmp	$L1517
; Line 1348
$L1521:
; Line 1349
	mov	eax, DWORD PTR _value$[ebp]
	and	DWORD PTR [eax], -65536			; ffff0000H
; Line 1350
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	shl	eax, 16					; 00000010H
	mov	ecx, DWORD PTR _value$[ebp]
	mov	ecx, DWORD PTR [ecx]
	and	ecx, 65535				; 0000ffffH
	or	eax, ecx
	mov	ecx, DWORD PTR _value$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 1351
	push	8
	mov	eax, DWORD PTR _x$[ebp]
	add	eax, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _value$[ebp]
	add	eax, 8
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
; Line 1352
	jmp	$L1518
; Line 1354
$L1522:
; Line 1355
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _value$[ebp]
	mov	DWORD PTR [ecx+12], eax
; Line 1356
	jmp	$L1518
; Line 1358
$L1523:
; Line 1359
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR _value$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 1360
	jmp	$L1518
; Line 1362
$L1524:
; Line 1363
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR _value$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 1364
	jmp	$L1518
; Line 1366
$L1525:
; Line 1367
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x$[ebp], eax
; Line 1368
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1526
; Line 1370
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _value$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 1371
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1527
; Line 1372
	call	_abort
; Line 1373
$L1527:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _value$[ebp]
	mov	DWORD PTR [ecx+12], eax
; Line 1375
	jmp	$L1528
$L1526:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2949120				; 002d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1529
; Line 1377
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _value$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 1378
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1530
; Line 1379
	call	_abort
; Line 1380
$L1530:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	neg	eax
	mov	ecx, DWORD PTR _value$[ebp]
	mov	DWORD PTR [ecx+12], eax
; Line 1382
	jmp	$L1531
$L1529:
; Line 1383
	call	_abort
$L1531:
$L1528:
; Line 1384
	jmp	$L1518
; Line 1386
$L1532:
; Line 1387
	call	_abort
; Line 1388
	jmp	$L1518
$L1517:
	cmp	DWORD PTR -12+[ebp], 30			; 0000001eH
	je	$L1522
	cmp	DWORD PTR -12+[ebp], 31			; 0000001fH
	je	$L1521
	cmp	DWORD PTR -12+[ebp], 32			; 00000020H
	je	$L1525
	cmp	DWORD PTR -12+[ebp], 38			; 00000026H
	je	$L1524
	cmp	DWORD PTR -12+[ebp], 39			; 00000027H
	je	$L1523
	jmp	$L1532
$L1518:
; Line 1390
	mov	eax, DWORD PTR _value$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 65536				; 00010000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1533
	mov	eax, DWORD PTR _value$[ebp]
	cmp	DWORD PTR [eax+8], 0
	je	$L1533
; Line 1391
	mov	eax, DWORD PTR _value$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR -16+[ebp], eax
	jmp	$L1534
; Line 1393
$L1538:
; Line 1398
	mov	eax, DWORD PTR _value$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _value$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 1399
	jmp	$L1535
$L1534:
	cmp	DWORD PTR -16+[ebp], 38			; 00000026H
	jl	$L1535
	cmp	DWORD PTR -16+[ebp], 39			; 00000027H
	jle	$L1538
	jmp	$L1535
$L1535:
; Line 1400
$L1533:
$L1511:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_decode_rtx_const ENDP
_TEXT	ENDS
PUBLIC	_const_hash_rtx
_TEXT	SEGMENT
_mode$ = 8
_x$ = 12
_hi$ = -4
_i$ = -8
_value$ = -24
_const_hash_rtx PROC NEAR
; Line 1408
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	push	ebx
	push	esi
	push	edi
; Line 1412
	lea	eax, DWORD PTR _value$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_decode_rtx_const
	add	esp, 12					; 0000000cH
; Line 1415
	mov	DWORD PTR _hi$[ebp], 0
; Line 1416
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L1546
$L1547:
	inc	DWORD PTR _i$[ebp]
$L1546:
	cmp	DWORD PTR _i$[ebp], 4
	jae	$L1548
; Line 1417
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _value$[ebp+eax*4]
	add	DWORD PTR _hi$[ebp], eax
	jmp	$L1547
$L1548:
; Line 1419
	and	DWORD PTR _hi$[ebp], 1073741823		; 3fffffffH
; Line 1420
	mov	ecx, 61					; 0000003dH
	mov	eax, DWORD PTR _hi$[ebp]
	cdq
	idiv	ecx
	mov	DWORD PTR _hi$[ebp], edx
; Line 1421
	mov	eax, DWORD PTR _hi$[ebp]
	jmp	$L1542
; Line 1422
$L1542:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_const_hash_rtx ENDP
_mode$ = 8
_x$ = 12
_desc$ = 16
_p$ = -8
_strp$ = -4
_len$ = -28
_value$ = -24
_compare_constant_rtx PROC NEAR
; Line 1432
	push	ebp
	mov	ebp, esp
	sub	esp, 36					; 00000024H
	push	ebx
	push	esi
	push	edi
; Line 1433
	mov	eax, DWORD PTR _desc$[ebp]
	add	eax, 8
	mov	DWORD PTR _p$[ebp], eax
; Line 1438
	lea	eax, DWORD PTR _value$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_decode_rtx_const
	add	esp, 12					; 0000000cH
; Line 1439
	lea	eax, DWORD PTR _value$[ebp]
	mov	DWORD PTR _strp$[ebp], eax
; Line 1440
	mov	DWORD PTR _len$[ebp], 4
; Line 1443
$L1559:
	dec	DWORD PTR _len$[ebp]
	js	$L1560
; Line 1444
	mov	eax, DWORD PTR _p$[ebp]
	mov	DWORD PTR -32+[ebp], eax
	add	DWORD PTR _p$[ebp], 4
	mov	eax, DWORD PTR _strp$[ebp]
	mov	DWORD PTR -36+[ebp], eax
	add	DWORD PTR _strp$[ebp], 4
	mov	eax, DWORD PTR -32+[ebp]
	mov	ecx, DWORD PTR -36+[ebp]
	mov	ecx, DWORD PTR [ecx]
	cmp	DWORD PTR [eax], ecx
	je	$L1561
; Line 1445
	sub	eax, eax
	jmp	$L1553
; Line 1447
$L1561:
	jmp	$L1559
$L1560:
	mov	eax, 1
	jmp	$L1553
; Line 1448
$L1553:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_compare_constant_rtx ENDP
_mode$ = 8
_x$ = 12
_ptr$ = -8
_buf$ = -4
_value$ = -24
_record_constant_rtx PROC NEAR
; Line 1457
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	push	ebx
	push	esi
	push	edi
; Line 1458
	mov	DWORD PTR _ptr$[ebp], 0
; Line 1462
	lea	eax, DWORD PTR _value$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_decode_rtx_const
	add	esp, 12					; 0000000cH
; Line 1464
	mov	eax, DWORD PTR _saveable_obstack
	mov	DWORD PTR [eax+20], 4
	mov	eax, DWORD PTR _saveable_obstack
	mov	eax, DWORD PTR [eax+20]
	mov	ecx, DWORD PTR _saveable_obstack
	add	eax, DWORD PTR [ecx+12]
	mov	ecx, DWORD PTR _saveable_obstack
	cmp	eax, DWORD PTR [ecx+16]
	jbe	$L1829
	mov	eax, DWORD PTR _saveable_obstack
	mov	eax, DWORD PTR [eax+20]
	push	eax
	mov	eax, DWORD PTR _saveable_obstack
	push	eax
	call	__obstack_newchunk
	add	esp, 8
	jmp	$L1830
$L1829:
$L1830:
	mov	eax, DWORD PTR _saveable_obstack
	mov	eax, DWORD PTR [eax+20]
	push	eax
	lea	eax, DWORD PTR _ptr$[ebp]
	push	eax
	mov	eax, DWORD PTR _saveable_obstack
	mov	eax, DWORD PTR [eax+12]
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
	mov	eax, DWORD PTR _saveable_obstack
	mov	eax, DWORD PTR [eax+20]
	mov	ecx, DWORD PTR _saveable_obstack
	add	DWORD PTR [ecx+12], eax
; Line 1465
	mov	eax, DWORD PTR _saveable_obstack
	mov	DWORD PTR [eax+20], 4
	mov	eax, DWORD PTR _saveable_obstack
	mov	eax, DWORD PTR [eax+20]
	mov	ecx, DWORD PTR _saveable_obstack
	add	eax, DWORD PTR [ecx+12]
	mov	ecx, DWORD PTR _saveable_obstack
	cmp	eax, DWORD PTR [ecx+16]
	jbe	$L1831
	mov	eax, DWORD PTR _saveable_obstack
	mov	eax, DWORD PTR [eax+20]
	push	eax
	mov	eax, DWORD PTR _saveable_obstack
	push	eax
	call	__obstack_newchunk
	add	esp, 8
	jmp	$L1832
$L1831:
$L1832:
	mov	eax, DWORD PTR _saveable_obstack
	mov	eax, DWORD PTR [eax+20]
	push	eax
	lea	eax, DWORD PTR _buf$[ebp]
	push	eax
	mov	eax, DWORD PTR _saveable_obstack
	mov	eax, DWORD PTR [eax+12]
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
	mov	eax, DWORD PTR _saveable_obstack
	mov	eax, DWORD PTR [eax+20]
	mov	ecx, DWORD PTR _saveable_obstack
	add	DWORD PTR [ecx+12], eax
; Line 1468
	mov	eax, DWORD PTR _saveable_obstack
	mov	DWORD PTR [eax+20], 16			; 00000010H
	mov	eax, DWORD PTR _saveable_obstack
	mov	eax, DWORD PTR [eax+20]
	mov	ecx, DWORD PTR _saveable_obstack
	add	eax, DWORD PTR [ecx+12]
	mov	ecx, DWORD PTR _saveable_obstack
	cmp	eax, DWORD PTR [ecx+16]
	jbe	$L1833
	mov	eax, DWORD PTR _saveable_obstack
	mov	eax, DWORD PTR [eax+20]
	push	eax
	mov	eax, DWORD PTR _saveable_obstack
	push	eax
	call	__obstack_newchunk
	add	esp, 8
	jmp	$L1834
$L1833:
$L1834:
	mov	eax, DWORD PTR _saveable_obstack
	mov	eax, DWORD PTR [eax+20]
	push	eax
	lea	eax, DWORD PTR _value$[ebp]
	push	eax
	mov	eax, DWORD PTR _saveable_obstack
	mov	eax, DWORD PTR [eax+12]
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
	mov	eax, DWORD PTR _saveable_obstack
	mov	eax, DWORD PTR [eax+20]
	mov	ecx, DWORD PTR _saveable_obstack
	add	DWORD PTR [ecx+12], eax
; Line 1470
	mov	eax, DWORD PTR _saveable_obstack
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _saveable_obstack
	mov	DWORD PTR [ecx+20], eax
	mov	eax, DWORD PTR _saveable_obstack
	mov	eax, DWORD PTR [eax+12]
	mov	ecx, DWORD PTR _saveable_obstack
	add	eax, DWORD PTR [ecx+24]
	mov	ecx, DWORD PTR _saveable_obstack
	mov	ecx, DWORD PTR [ecx+24]
	not	ecx
	and	eax, ecx
	mov	ecx, DWORD PTR _saveable_obstack
	mov	DWORD PTR [ecx+12], eax
	mov	eax, DWORD PTR _saveable_obstack
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _saveable_obstack
	sub	eax, DWORD PTR [ecx+4]
	mov	ecx, DWORD PTR _saveable_obstack
	mov	ecx, DWORD PTR [ecx+12]
	mov	edx, DWORD PTR _saveable_obstack
	sub	ecx, DWORD PTR [edx+4]
	cmp	eax, ecx
	jge	$L1835
	mov	eax, DWORD PTR _saveable_obstack
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _saveable_obstack
	mov	DWORD PTR [ecx+12], eax
	jmp	$L1836
$L1835:
$L1836:
	mov	eax, DWORD PTR _saveable_obstack
	mov	eax, DWORD PTR [eax+12]
	mov	ecx, DWORD PTR _saveable_obstack
	mov	DWORD PTR [ecx+8], eax
	mov	eax, DWORD PTR _saveable_obstack
	mov	eax, DWORD PTR [eax+20]
	jmp	$L1565
; Line 1471
$L1565:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_record_constant_rtx ENDP
_TEXT	ENDS
EXTRN	_exact_log2:NEAR
_DATA	SEGMENT
	ORG $+2
$SG1588	DB	09H, '.align %d', 0aH, 00H
$SG1589	DB	'LC', 00H
	ORG $+1
$SG1590	DB	'%s%d:', 0aH, 00H
	ORG $+1
$SG1598	DB	09H, '.long ', 00H
$SG1599	DB	09H, '.long ', 00H
$SG1601	DB	09H, '.double 0d%.20e', 0aH, 00H
	ORG $+2
$SG1608	DB	09H, '.long ', 00H
$SG1609	DB	'0x%x', 0aH, 00H
	ORG $+2
$SG1616	DB	09H, '.long ', 00H
$SG1618	DB	09H, '.word ', 00H
$SG1620	DB	09H, '.byte ', 00H
$SG1621	DB	'LC', 00H
	ORG $+1
$SG1622	DB	'*%s%d', 00H
_DATA	ENDS
_TEXT	SEGMENT
_tem$1607 = -288
_mode$ = 8
_x$ = 12
_hash$ = -4
_desc$ = -272
_label$ = -268
_found$ = -12
_def$ = -8
_align$1583 = -276
_u$1592 = -284
_force_const_mem PROC NEAR
; Line 1480
	push	ebp
	mov	ebp, esp
	sub	esp, 296				; 00000128H
	push	ebx
	push	esi
	push	edi
; Line 1484
	mov	DWORD PTR _found$[ebp], 0
; Line 1488
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2031616				; 001f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1577
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1577
; Line 1489
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	jmp	$L1571
; Line 1495
$L1577:
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_const_hash_rtx
	add	esp, 8
	mov	DWORD PTR _hash$[ebp], eax
; Line 1497
	mov	eax, DWORD PTR _hash$[ebp]
	mov	eax, DWORD PTR _const_rtx_hash_table$S1498[eax*4]
	mov	DWORD PTR _desc$[ebp], eax
	jmp	$L1578
$L1579:
	mov	eax, DWORD PTR _desc$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _desc$[ebp], eax
$L1578:
	cmp	DWORD PTR _desc$[ebp], 0
	je	$L1580
; Line 1498
	mov	eax, DWORD PTR _desc$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_compare_constant_rtx
	add	esp, 12					; 0000000cH
	or	eax, eax
	je	$L1581
; Line 1500
	mov	eax, DWORD PTR _desc$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _found$[ebp], eax
; Line 1501
	jmp	$L1580
; Line 1504
$L1581:
	jmp	$L1579
$L1580:
	cmp	DWORD PTR _found$[ebp], 0
	jne	$L1582
; Line 1513
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_record_constant_rtx
	add	esp, 8
	mov	DWORD PTR _desc$[ebp], eax
; Line 1514
	mov	eax, DWORD PTR _hash$[ebp]
	mov	eax, DWORD PTR _const_rtx_hash_table$S1498[eax*4]
	mov	ecx, DWORD PTR _desc$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 1515
	mov	eax, DWORD PTR _desc$[ebp]
	mov	ecx, DWORD PTR _hash$[ebp]
	mov	DWORD PTR _const_rtx_hash_table$S1498[ecx*4], eax
; Line 1524
	call	_text_section
; Line 1528
	cmp	DWORD PTR _mode$[ebp], 0
	jne	$L1837
	mov	DWORD PTR _align$1583[ebp], 4
	jmp	$L1838
$L1837:
	mov	eax, DWORD PTR _mode$[ebp]
	mov	eax, DWORD PTR _mode_size[eax*4]
	mov	DWORD PTR _align$1583[ebp], eax
$L1838:
; Line 1529
	cmp	DWORD PTR _align$1583[ebp], 4
	jle	$L1584
; Line 1530
	mov	DWORD PTR _align$1583[ebp], 4
; Line 1532
$L1584:
	cmp	DWORD PTR _align$1583[ebp], 1
	jle	$L1585
; Line 1533
	mov	eax, DWORD PTR _align$1583[ebp]
	push	eax
	call	_exact_log2
	add	esp, 4
	or	eax, eax
	je	$L1587
	mov	eax, DWORD PTR _align$1583[ebp]
	push	eax
	call	_exact_log2
	add	esp, 4
	push	eax
	push	OFFSET $SG1588
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 1536
$L1587:
$L1585:
	mov	eax, DWORD PTR _const_labelno
	push	eax
	push	OFFSET $SG1589
	push	OFFSET $SG1590
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
; Line 1539
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2031616				; 001f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1591
; Line 1543
	push	8
	mov	eax, DWORD PTR _x$[ebp]
	add	eax, 12					; 0000000cH
	push	eax
	lea	eax, DWORD PTR _u$1592[ebp]
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
; Line 1544
	mov	eax, DWORD PTR _mode$[ebp]
	mov	DWORD PTR -292+[ebp], eax
	jmp	$L1593
; Line 1548
$L1597:
; Line 1555
	push	OFFSET $SG1598
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_fprintf
	add	esp, 8
	mov	eax, DWORD PTR _u$1592[ebp]
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_output_addr_const
	add	esp, 8
	mov	eax, DWORD PTR _asm_out_file
	dec	DWORD PTR [eax+4]
	mov	eax, DWORD PTR _asm_out_file
	cmp	DWORD PTR [eax+4], 0
	jl	$L1839
	mov	eax, DWORD PTR _asm_out_file
	mov	eax, DWORD PTR [eax]
	mov	BYTE PTR [eax], 10			; 0000000aH
	mov	eax, DWORD PTR _asm_out_file
	inc	DWORD PTR [eax]
	jmp	$L1840
$L1839:
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	push	10					; 0000000aH
	call	__flsbuf
	add	esp, 8
$L1840:
; Line 1557
	push	OFFSET $SG1599
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_fprintf
	add	esp, 8
	mov	eax, DWORD PTR _u$1592[ebp+4]
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_output_addr_const
	add	esp, 8
	mov	eax, DWORD PTR _asm_out_file
	dec	DWORD PTR [eax+4]
	mov	eax, DWORD PTR _asm_out_file
	cmp	DWORD PTR [eax+4], 0
	jl	$L1841
	mov	eax, DWORD PTR _asm_out_file
	mov	eax, DWORD PTR [eax]
	mov	BYTE PTR [eax], 10			; 0000000aH
	mov	eax, DWORD PTR _asm_out_file
	inc	DWORD PTR [eax]
	jmp	$L1842
$L1841:
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	push	10					; 0000000aH
	call	__flsbuf
	add	esp, 8
$L1842:
; Line 1566
	jmp	$L1594
; Line 1568
$L1600:
; Line 1569
	mov	eax, DWORD PTR _u$1592[ebp+4]
	push	eax
	mov	eax, DWORD PTR _u$1592[ebp]
	push	eax
	push	OFFSET $SG1601
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
; Line 1570
	jmp	$L1594
; Line 1572
$L1602:
; Line 1573
$L1603:
	fld	QWORD PTR _u$1592[ebp]
	fstp	DWORD PTR _tem$1607[ebp]
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	push	OFFSET $SG1608
	call	_fputs
	add	esp, 8
	mov	eax, DWORD PTR _tem$1607[ebp]
	push	eax
	push	OFFSET $SG1609
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
$L1604:
$L1605:
; Line 1574
	jmp	$L1594
$L1593:
	cmp	DWORD PTR -292+[ebp], 6
	je	$L1597
	cmp	DWORD PTR -292+[ebp], 10		; 0000000aH
	je	$L1602
	cmp	DWORD PTR -292+[ebp], 11		; 0000000bH
	je	$L1600
	jmp	$L1594
$L1594:
; Line 1576
	jmp	$L1610
$L1591:
; Line 1577
	mov	eax, DWORD PTR _mode$[ebp]
	mov	DWORD PTR -296+[ebp], eax
	jmp	$L1611
; Line 1579
$L1615:
; Line 1580
	push	OFFSET $SG1616
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_fprintf
	add	esp, 8
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_output_addr_const
	add	esp, 8
	mov	eax, DWORD PTR _asm_out_file
	dec	DWORD PTR [eax+4]
	mov	eax, DWORD PTR _asm_out_file
	cmp	DWORD PTR [eax+4], 0
	jl	$L1843
	mov	eax, DWORD PTR _asm_out_file
	mov	eax, DWORD PTR [eax]
	mov	BYTE PTR [eax], 10			; 0000000aH
	mov	eax, DWORD PTR _asm_out_file
	inc	DWORD PTR [eax]
	jmp	$L1844
$L1843:
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	push	10					; 0000000aH
	call	__flsbuf
	add	esp, 8
$L1844:
; Line 1581
	jmp	$L1612
; Line 1583
$L1617:
; Line 1584
	push	OFFSET $SG1618
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_fprintf
	add	esp, 8
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_output_addr_const
	add	esp, 8
	mov	eax, DWORD PTR _asm_out_file
	dec	DWORD PTR [eax+4]
	mov	eax, DWORD PTR _asm_out_file
	cmp	DWORD PTR [eax+4], 0
	jl	$L1845
	mov	eax, DWORD PTR _asm_out_file
	mov	eax, DWORD PTR [eax]
	mov	BYTE PTR [eax], 10			; 0000000aH
	mov	eax, DWORD PTR _asm_out_file
	inc	DWORD PTR [eax]
	jmp	$L1846
$L1845:
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	push	10					; 0000000aH
	call	__flsbuf
	add	esp, 8
$L1846:
; Line 1585
	jmp	$L1612
; Line 1587
$L1619:
; Line 1588
	push	OFFSET $SG1620
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_fprintf
	add	esp, 8
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_output_addr_const
	add	esp, 8
	mov	eax, DWORD PTR _asm_out_file
	dec	DWORD PTR [eax+4]
	mov	eax, DWORD PTR _asm_out_file
	cmp	DWORD PTR [eax+4], 0
	jl	$L1847
	mov	eax, DWORD PTR _asm_out_file
	mov	eax, DWORD PTR [eax]
	mov	BYTE PTR [eax], 10			; 0000000aH
	mov	eax, DWORD PTR _asm_out_file
	inc	DWORD PTR [eax]
	jmp	$L1848
$L1847:
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	push	10					; 0000000aH
	call	__flsbuf
	add	esp, 8
$L1848:
; Line 1589
	jmp	$L1612
; Line 1590
	jmp	$L1612
$L1611:
	cmp	DWORD PTR -296+[ebp], 1
	je	$L1619
	cmp	DWORD PTR -296+[ebp], 2
	je	$L1617
	cmp	DWORD PTR -296+[ebp], 4
	je	$L1615
	jmp	$L1612
$L1612:
$L1610:
; Line 1593
	mov	eax, DWORD PTR _const_labelno
	push	eax
	push	OFFSET $SG1621
	push	OFFSET $SG1622
	lea	eax, DWORD PTR _label$[ebp]
	push	eax
	call	_sprintf
	add	esp, 16					; 00000010H
; Line 1595
	inc	DWORD PTR _const_labelno
; Line 1598
	lea	eax, DWORD PTR _label$[ebp]
	push	eax
	call	_strlen
	add	esp, 4
	mov	DWORD PTR _permanent_obstack+20, eax
	mov	eax, DWORD PTR _permanent_obstack+20
	add	eax, DWORD PTR _permanent_obstack+12
	inc	eax
	cmp	eax, DWORD PTR _permanent_obstack+16
	jbe	$L1849
	mov	eax, DWORD PTR _permanent_obstack+20
	inc	eax
	push	eax
	push	OFFSET _permanent_obstack
	call	__obstack_newchunk
	add	esp, 8
	jmp	$L1850
$L1849:
$L1850:
	mov	eax, DWORD PTR _permanent_obstack+20
	push	eax
	lea	eax, DWORD PTR _label$[ebp]
	push	eax
	mov	eax, DWORD PTR _permanent_obstack+12
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
	mov	eax, DWORD PTR _permanent_obstack+20
	add	DWORD PTR _permanent_obstack+12, eax
	mov	eax, DWORD PTR _permanent_obstack+12
	mov	BYTE PTR [eax], 0
	inc	DWORD PTR _permanent_obstack+12
	mov	eax, DWORD PTR _permanent_obstack+8
	mov	DWORD PTR _permanent_obstack+20, eax
	mov	eax, DWORD PTR _permanent_obstack+12
	add	eax, DWORD PTR _permanent_obstack+24
	mov	ecx, DWORD PTR _permanent_obstack+24
	not	ecx
	and	eax, ecx
	mov	DWORD PTR _permanent_obstack+12, eax
	mov	eax, DWORD PTR _permanent_obstack+12
	sub	eax, DWORD PTR _permanent_obstack+4
	mov	ecx, DWORD PTR _permanent_obstack+16
	sub	ecx, DWORD PTR _permanent_obstack+4
	cmp	eax, ecx
	jle	$L1851
	mov	eax, DWORD PTR _permanent_obstack+16
	mov	DWORD PTR _permanent_obstack+12, eax
	jmp	$L1852
$L1851:
$L1852:
	mov	eax, DWORD PTR _permanent_obstack+12
	mov	DWORD PTR _permanent_obstack+8, eax
	mov	eax, DWORD PTR _permanent_obstack+20
	mov	DWORD PTR _found$[ebp], eax
	mov	eax, DWORD PTR _found$[ebp]
	mov	ecx, DWORD PTR _desc$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 1603
$L1582:
	mov	eax, DWORD PTR _desc$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	4
	push	39					; 00000027H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	push	37					; 00000025H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _def$[ebp], eax
; Line 1605
	mov	eax, DWORD PTR _def$[ebp]
	mov	eax, DWORD PTR [eax]
	or	eax, 67108864				; 04000000H
	mov	ecx, DWORD PTR _def$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 1607
	mov	eax, DWORD PTR _def$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	or	eax, 67108864				; 04000000H
	mov	ecx, DWORD PTR _def$[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	mov	DWORD PTR [ecx], eax
; Line 1609
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2031616				; 001f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1623
; Line 1611
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR _cc0_rtx
	cmp	DWORD PTR [eax+4], ecx
	jne	$L1624
; Line 1613
	mov	eax, DWORD PTR _real_constant_chain$S1272
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 1614
	mov	eax, DWORD PTR _x$[ebp]
	mov	DWORD PTR _real_constant_chain$S1272, eax
; Line 1616
$L1624:
	mov	eax, DWORD PTR _def$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 1619
$L1623:
	mov	eax, DWORD PTR _def$[ebp]
	jmp	$L1571
; Line 1620
$L1571:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_force_const_mem ENDP
_exp$ = 8
_constant$1632 = -4
_link$1640 = -8
_output_addressed_constants PROC NEAR
; Line 1628
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 1629
	mov	eax, DWORD PTR _exp$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR -12+[ebp], eax
	jmp	$L1627
; Line 1631
$L1631:
; Line 1633
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _constant$1632[ebp], eax
; Line 1635
$L1634:
	mov	eax, DWORD PTR _constant$1632[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 47					; 0000002fH
	jne	$L1635
; Line 1637
	mov	eax, DWORD PTR _constant$1632[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _constant$1632[ebp], eax
; Line 1638
	jmp	$L1634
$L1635:
; Line 1640
	mov	eax, DWORD PTR _constant$1632[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 6
	test	al, 1
	je	$L1636
; Line 1643
	mov	eax, DWORD PTR _constant$1632[ebp]
	push	eax
	call	_output_constant_def
	add	esp, 4
; Line 1644
$L1636:
; Line 1645
	jmp	$L1628
; Line 1647
$L1637:
; Line 1649
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_output_addressed_constants
	add	esp, 4
; Line 1650
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	call	_output_addressed_constants
	add	esp, 4
; Line 1651
	jmp	$L1628
; Line 1653
$L1638:
; Line 1655
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_output_addressed_constants
	add	esp, 4
; Line 1656
	jmp	$L1628
; Line 1658
$L1639:
; Line 1661
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR _link$1640[ebp], eax
	jmp	$L1641
$L1642:
	mov	eax, DWORD PTR _link$1640[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _link$1640[ebp], eax
$L1641:
	cmp	DWORD PTR _link$1640[ebp], 0
	je	$L1643
; Line 1662
	mov	eax, DWORD PTR _link$1640[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_output_addressed_constants
	add	esp, 4
	jmp	$L1642
$L1643:
; Line 1664
	jmp	$L1628
; Line 1666
$L1644:
; Line 1667
	jmp	$L1628
; Line 1669
$L1645:
; Line 1670
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 6
	test	al, 1
	jne	$L1646
; Line 1671
	call	_abort
; Line 1672
$L1646:
	jmp	$L1628
$L1627:
	cmp	DWORD PTR -12+[ebp], 65			; 00000041H
	jg	$L1853
	cmp	DWORD PTR -12+[ebp], 64			; 00000040H
	jge	$L1637
	cmp	DWORD PTR -12+[ebp], 0
	je	$L1628
	cmp	DWORD PTR -12+[ebp], 52			; 00000034H
	je	$L1639
	jmp	$L1645
$L1853:
	cmp	DWORD PTR -12+[ebp], 112		; 00000070H
	jl	$L1645
	cmp	DWORD PTR -12+[ebp], 113		; 00000071H
	jle	$L1638
	cmp	DWORD PTR -12+[ebp], 116		; 00000074H
	je	$L1631
	jmp	$L1645
$L1628:
; Line 1673
$L1626:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_addressed_constants ENDP
_TEXT	ENDS
PUBLIC	_output_constructor
EXTRN	__setjmp:NEAR
EXTRN	_set_float_handler:NEAR
EXTRN	_expand_expr:NEAR
_DATA	SEGMENT
	ORG $+2
$SG1665	DB	09H, '.long ', 00H
$SG1666	DB	09H, '.long ', 00H
$SG1668	DB	'8-byte integer constant expression too complicated', 00H
	ORG $+1
$SG1670	DB	09H, '.byte ', 00H
$SG1673	DB	09H, '.word ', 00H
$SG1676	DB	09H, '.long ', 00H
$SG1680	DB	'initializer for floating value is not a floating constan'
	DB	't', 00H
	ORG $+2
$SG1685	DB	'floating point trap outputting a constant', 00H
	ORG $+2
$SG1695	DB	09H, '.long ', 00H
$SG1696	DB	'0x%x', 0aH, 00H
	ORG $+2
$SG1698	DB	09H, '.double 0d%.20e', 0aH, 00H
	ORG $+2
$SG1711	DB	09H, '.space %u', 0aH, 00H
_DATA	ENDS
CONST	SEGMENT
$T1865	DQ	00000000000000000H		; 0
CONST	ENDS
_TEXT	SEGMENT
_d$1682 = -16
_output_constant_handler$1683 = -80
_tem$1694 = -84
_excess$1704 = -88
_exp$ = 8
_size$ = 12
_code$ = -4
_x$ = -8
_output_constant PROC NEAR
; Line 1697
	push	ebp
	mov	ebp, esp
	sub	esp, 92					; 0000005cH
	push	ebx
	push	esi
	push	edi
; Line 1698
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _code$[ebp], eax
; Line 1701
	cmp	DWORD PTR _size$[ebp], 0
	jne	$L1652
; Line 1702
	jmp	$L1649
; Line 1706
$L1652:
; Line 1707
	mov	eax, DWORD PTR _exp$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 113				; 00000071H
	jne	$L1653
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	ecx, DWORD PTR _exp$[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	cmp	DWORD PTR [eax+8], ecx
	jne	$L1653
; Line 1708
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _exp$[ebp], eax
; Line 1710
$L1653:
	mov	eax, DWORD PTR _code$[ebp]
	mov	DWORD PTR -92+[ebp], eax
	jmp	$L1654
; Line 1712
$L1658:
; Line 1717
$L1660:
	mov	eax, DWORD PTR _exp$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 113				; 00000071H
	je	$L1662
	mov	eax, DWORD PTR _exp$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 112				; 00000070H
	jne	$L1661
$L1662:
; Line 1718
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _exp$[ebp], eax
	jmp	$L1660
$L1661:
; Line 1721
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	and	eax, -16777216				; ff000000H
	mov	ecx, 100663296				; 06000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1663
; Line 1723
	mov	eax, DWORD PTR _exp$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L1664
; Line 1728
	push	OFFSET $SG1665
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_fprintf
	add	esp, 8
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_output_addr_const
	add	esp, 8
	mov	eax, DWORD PTR _asm_out_file
	dec	DWORD PTR [eax+4]
	mov	eax, DWORD PTR _asm_out_file
	cmp	DWORD PTR [eax+4], 0
	jl	$L1854
	mov	eax, DWORD PTR _asm_out_file
	mov	eax, DWORD PTR [eax]
	mov	BYTE PTR [eax], 10			; 0000000aH
	mov	eax, DWORD PTR _asm_out_file
	inc	DWORD PTR [eax]
	jmp	$L1855
$L1854:
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	push	10					; 0000000aH
	call	__flsbuf
	add	esp, 8
$L1855:
; Line 1731
	push	OFFSET $SG1666
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_fprintf
	add	esp, 8
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_output_addr_const
	add	esp, 8
	mov	eax, DWORD PTR _asm_out_file
	dec	DWORD PTR [eax+4]
	mov	eax, DWORD PTR _asm_out_file
	cmp	DWORD PTR [eax+4], 0
	jl	$L1856
	mov	eax, DWORD PTR _asm_out_file
	mov	eax, DWORD PTR [eax]
	mov	BYTE PTR [eax], 10			; 0000000aH
	mov	eax, DWORD PTR _asm_out_file
	inc	DWORD PTR [eax]
	jmp	$L1857
$L1856:
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	push	10					; 0000000aH
	call	__flsbuf
	add	esp, 8
$L1857:
; Line 1740
	sub	DWORD PTR _size$[ebp], 8
; Line 1741
	jmp	$L1655
; Line 1743
	jmp	$L1667
$L1664:
; Line 1744
	push	OFFSET $SG1668
	call	_error
	add	esp, 4
$L1667:
; Line 1746
	jmp	$L1655
; Line 1750
$L1663:
	push	1
	push	0
	push	0
	mov	eax, DWORD PTR _exp$[ebp]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	mov	DWORD PTR _x$[ebp], eax
; Line 1752
	cmp	DWORD PTR _size$[ebp], 1
	jne	$L1669
; Line 1754
	push	OFFSET $SG1670
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_fprintf
	add	esp, 8
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_output_addr_const
	add	esp, 8
	mov	eax, DWORD PTR _asm_out_file
	dec	DWORD PTR [eax+4]
	mov	eax, DWORD PTR _asm_out_file
	cmp	DWORD PTR [eax+4], 0
	jl	$L1858
	mov	eax, DWORD PTR _asm_out_file
	mov	eax, DWORD PTR [eax]
	mov	BYTE PTR [eax], 10			; 0000000aH
	mov	eax, DWORD PTR _asm_out_file
	inc	DWORD PTR [eax]
	jmp	$L1859
$L1858:
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	push	10					; 0000000aH
	call	__flsbuf
	add	esp, 8
$L1859:
; Line 1755
	dec	DWORD PTR _size$[ebp]
; Line 1757
	jmp	$L1671
$L1669:
	cmp	DWORD PTR _size$[ebp], 2
	jne	$L1672
; Line 1759
	push	OFFSET $SG1673
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_fprintf
	add	esp, 8
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_output_addr_const
	add	esp, 8
	mov	eax, DWORD PTR _asm_out_file
	dec	DWORD PTR [eax+4]
	mov	eax, DWORD PTR _asm_out_file
	cmp	DWORD PTR [eax+4], 0
	jl	$L1860
	mov	eax, DWORD PTR _asm_out_file
	mov	eax, DWORD PTR [eax]
	mov	BYTE PTR [eax], 10			; 0000000aH
	mov	eax, DWORD PTR _asm_out_file
	inc	DWORD PTR [eax]
	jmp	$L1861
$L1860:
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	push	10					; 0000000aH
	call	__flsbuf
	add	esp, 8
$L1861:
; Line 1760
	sub	DWORD PTR _size$[ebp], 2
; Line 1762
	jmp	$L1674
$L1672:
	cmp	DWORD PTR _size$[ebp], 4
	jne	$L1675
; Line 1764
	push	OFFSET $SG1676
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_fprintf
	add	esp, 8
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_output_addr_const
	add	esp, 8
	mov	eax, DWORD PTR _asm_out_file
	dec	DWORD PTR [eax+4]
	mov	eax, DWORD PTR _asm_out_file
	cmp	DWORD PTR [eax+4], 0
	jl	$L1862
	mov	eax, DWORD PTR _asm_out_file
	mov	eax, DWORD PTR [eax]
	mov	BYTE PTR [eax], 10			; 0000000aH
	mov	eax, DWORD PTR _asm_out_file
	inc	DWORD PTR [eax]
	jmp	$L1863
$L1862:
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	push	10					; 0000000aH
	call	__flsbuf
	add	esp, 8
$L1863:
; Line 1765
	sub	DWORD PTR _size$[ebp], 4
; Line 1774
	jmp	$L1677
$L1675:
; Line 1775
	call	_abort
$L1677:
$L1674:
$L1671:
; Line 1777
	jmp	$L1655
; Line 1779
$L1678:
; Line 1780
	mov	eax, DWORD PTR _exp$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 36					; 00000024H
	je	$L1679
; Line 1781
	push	OFFSET $SG1680
	call	_error
	add	esp, 4
; Line 1782
	jmp	$L1681
$L1679:
; Line 1787
	mov	eax, DWORD PTR _exp$[ebp]
	mov	ecx, DWORD PTR [eax+28]
	mov	DWORD PTR _d$1682[ebp+4], ecx
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _d$1682[ebp], eax
; Line 1788
	lea	eax, DWORD PTR _output_constant_handler$1683[ebp]
	push	eax
	call	__setjmp
	add	esp, 4
	or	eax, eax
	je	$L1684
; Line 1790
	push	OFFSET $SG1685
	call	_error
	add	esp, 4
; Line 1795
	mov	eax, DWORD PTR $T1865+4
	mov	DWORD PTR _d$1682[ebp+4], eax
	mov	eax, DWORD PTR $T1865
	mov	DWORD PTR _d$1682[ebp], eax
; Line 1798
$L1684:
	lea	eax, DWORD PTR _output_constant_handler$1683[ebp]
	push	eax
	call	_set_float_handler
	add	esp, 4
; Line 1800
	cmp	DWORD PTR _size$[ebp], 4
	jge	$L1687
; Line 1801
	jmp	$L1655
; Line 1802
	jmp	$L1688
$L1687:
	cmp	DWORD PTR _size$[ebp], 8
	jge	$L1689
; Line 1804
$L1690:
	fld	QWORD PTR _d$1682[ebp]
	fstp	DWORD PTR _tem$1694[ebp]
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	push	OFFSET $SG1695
	call	_fputs
	add	esp, 8
	mov	eax, DWORD PTR _tem$1694[ebp]
	push	eax
	push	OFFSET $SG1696
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
$L1691:
$L1692:
; Line 1805
	sub	DWORD PTR _size$[ebp], 4
; Line 1807
	jmp	$L1697
$L1689:
; Line 1809
	mov	eax, DWORD PTR _d$1682[ebp+4]
	push	eax
	mov	eax, DWORD PTR _d$1682[ebp]
	push	eax
	push	OFFSET $SG1698
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
; Line 1810
	sub	DWORD PTR _size$[ebp], 8
; Line 1811
$L1697:
$L1688:
; Line 1812
	push	0
	call	_set_float_handler
	add	esp, 4
; Line 1813
$L1681:
; Line 1814
	jmp	$L1655
; Line 1816
$L1699:
; Line 1817
	mov	eax, DWORD PTR _size$[ebp]
	cdq
	sub	eax, edx
	sar	eax, 1
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_output_constant
	add	esp, 8
; Line 1818
	mov	eax, DWORD PTR _size$[ebp]
	cdq
	sub	eax, edx
	sar	eax, 1
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	call	_output_constant
	add	esp, 8
; Line 1819
	sub	ecx, ecx
	mov	eax, DWORD PTR _size$[ebp]
	cdq
	sub	eax, edx
	sar	eax, 1
	add	eax, eax
	sub	ecx, eax
	neg	ecx
	sub	DWORD PTR _size$[ebp], ecx
; Line 1820
	jmp	$L1655
; Line 1822
$L1700:
; Line 1823
	mov	eax, DWORD PTR _exp$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 52					; 00000034H
	jne	$L1701
; Line 1825
	mov	eax, DWORD PTR _size$[ebp]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	push	eax
	call	_output_constructor
	add	esp, 8
; Line 1826
	jmp	$L1649
; Line 1828
	jmp	$L1702
$L1701:
	mov	eax, DWORD PTR _exp$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 38					; 00000026H
	jne	$L1703
; Line 1830
	mov	DWORD PTR _excess$1704[ebp], 0
; Line 1832
	mov	eax, DWORD PTR _exp$[ebp]
	mov	ecx, DWORD PTR _size$[ebp]
	cmp	DWORD PTR [eax+24], ecx
	jge	$L1705
; Line 1834
	mov	eax, DWORD PTR _size$[ebp]
	mov	ecx, DWORD PTR _exp$[ebp]
	sub	eax, DWORD PTR [ecx+24]
	mov	DWORD PTR _excess$1704[ebp], eax
; Line 1835
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _size$[ebp], eax
; Line 1838
$L1705:
	mov	eax, DWORD PTR _size$[ebp]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	call	_assemble_string
	add	esp, 8
; Line 1839
	mov	eax, DWORD PTR _excess$1704[ebp]
	mov	DWORD PTR _size$[ebp], eax
; Line 1841
	jmp	$L1706
$L1703:
; Line 1842
	call	_abort
$L1706:
$L1702:
; Line 1843
	jmp	$L1655
; Line 1845
$L1707:
; Line 1847
	mov	eax, DWORD PTR _exp$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 52					; 00000034H
	jne	$L1708
; Line 1848
	mov	eax, DWORD PTR _size$[ebp]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	push	eax
	call	_output_constructor
	add	esp, 8
; Line 1849
	jmp	$L1709
$L1708:
; Line 1850
	call	_abort
$L1709:
; Line 1851
	jmp	$L1649
; Line 1852
	jmp	$L1655
$L1654:
	sub	DWORD PTR -92+[ebp], 5
	cmp	DWORD PTR -92+[ebp], 15			; 0000000fH
	ja	$L1655
	shl	DWORD PTR -92+[ebp], 2
	mov	eax, DWORD PTR -92+[ebp]
	jmp	DWORD PTR $L1866[eax]
$L1866:
	DD	OFFSET $L1658
	DD	OFFSET $L1678
	DD	OFFSET $L1699
	DD	OFFSET $L1658
	DD	OFFSET $L1655
	DD	OFFSET $L1655
	DD	OFFSET $L1658
	DD	OFFSET $L1655
	DD	OFFSET $L1658
	DD	OFFSET $L1655
	DD	OFFSET $L1655
	DD	OFFSET $L1700
	DD	OFFSET $L1655
	DD	OFFSET $L1655
	DD	OFFSET $L1707
	DD	OFFSET $L1707
$L1655:
; Line 1854
	cmp	DWORD PTR _size$[ebp], 0
	jle	$L1710
; Line 1855
	mov	eax, DWORD PTR _size$[ebp]
	push	eax
	push	OFFSET $SG1711
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 1856
$L1710:
$L1649:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_constant ENDP
_TEXT	ENDS
_DATA	SEGMENT
$SG1732	DB	09H, '.byte ', 00H
$SG1733	DB	'%s0x%x', 0aH, 00H
$SG1735	DB	09H, '.space %u', 0aH, 00H
$SG1741	DB	'invalid initial value for member `%s''', 00H
	ORG $+2
$SG1747	DB	09H, '.byte ', 00H
$SG1748	DB	'%s0x%x', 0aH, 00H
$SG1750	DB	09H, '.space %u', 0aH, 00H
$SG1761	DB	09H, '.byte ', 00H
$SG1762	DB	'%s0x%x', 0aH, 00H
$SG1764	DB	09H, '.byte ', 00H
$SG1765	DB	'%s0x%x', 0aH, 00H
$SG1767	DB	09H, '.space %u', 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_fieldsize$1730 = -28
_next_offset$1743 = -32
_end_offset$1744 = -36
_this_time$1755 = -48
_next_byte$1756 = -44
_next_bit$1757 = -40
_exp$ = 8
_size$ = 12
_link$ = -16
_field$ = -12
_total_bytes$ = -4
_byte_buffer_in_use$ = -8
_byte$ = -20
_val$1726 = -24
_output_constructor PROC NEAR
; Line 1866
	push	ebp
	mov	ebp, esp
	sub	esp, 48					; 00000030H
	push	ebx
	push	esi
	push	edi
; Line 1867
	mov	DWORD PTR _field$[ebp], 0
; Line 1870
	mov	DWORD PTR _total_bytes$[ebp], 0
; Line 1872
	mov	DWORD PTR _byte_buffer_in_use$[ebp], 0
; Line 1875
	jmp	$L1720
; Line 1876
	call	_abort
; Line 1878
$L1720:
; Line 1879
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 19					; 00000013H
	je	$L1722
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 20					; 00000014H
	jne	$L1721
$L1722:
; Line 1880
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _field$[ebp], eax
; Line 1885
$L1721:
; Line 1888
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR _link$[ebp], eax
	jmp	$L1723
$L1724:
	mov	eax, DWORD PTR _link$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _link$[ebp], eax
	cmp	DWORD PTR _field$[ebp], 0
	je	$L1867
	mov	eax, DWORD PTR _field$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _field$[ebp], eax
	jmp	$L1868
$L1867:
	mov	DWORD PTR _field$[ebp], 0
$L1868:
$L1723:
	cmp	DWORD PTR _link$[ebp], 0
	je	$L1725
; Line 1890
	mov	eax, DWORD PTR _link$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _val$1726[ebp], eax
; Line 1894
	mov	eax, DWORD PTR _val$1726[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 113				; 00000071H
	jne	$L1727
	mov	eax, DWORD PTR _val$1726[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	ecx, DWORD PTR _val$1726[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	cmp	DWORD PTR [eax+8], ecx
	jne	$L1727
; Line 1895
	mov	eax, DWORD PTR _val$1726[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _val$1726[ebp], eax
; Line 1897
$L1727:
; Line 1898
	cmp	DWORD PTR _field$[ebp], 0
	je	$L1729
	mov	eax, DWORD PTR _field$[ebp]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	and	eax, -16777216				; ff000000H
	mov	ecx, 419430400				; 19000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L1728
$L1729:
; Line 1904
	cmp	DWORD PTR _byte_buffer_in_use$[ebp], 0
	je	$L1731
; Line 1906
	mov	eax, DWORD PTR _byte$[ebp]
	push	eax
	push	OFFSET $SG1732
	push	OFFSET $SG1733
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
; Line 1907
	inc	DWORD PTR _total_bytes$[ebp]
; Line 1908
	mov	DWORD PTR _byte_buffer_in_use$[ebp], 0
; Line 1914
$L1731:
	cmp	DWORD PTR _field$[ebp], 0
	je	$L1734
	mov	eax, DWORD PTR _field$[ebp]
	mov	eax, DWORD PTR [eax+48]
	cdq
	and	edx, 7
	add	eax, edx
	sar	eax, 3
	cmp	eax, DWORD PTR _total_bytes$[ebp]
	je	$L1734
; Line 1918
	mov	eax, DWORD PTR _field$[ebp]
	mov	eax, DWORD PTR [eax+48]
	cdq
	and	edx, 7
	add	eax, edx
	sar	eax, 3
	sub	eax, DWORD PTR _total_bytes$[ebp]
	push	eax
	push	OFFSET $SG1735
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 1919
	mov	eax, DWORD PTR _field$[ebp]
	mov	eax, DWORD PTR [eax+48]
	cdq
	and	edx, 7
	add	eax, edx
	sar	eax, 3
	mov	DWORD PTR _total_bytes$[ebp], eax
; Line 1923
$L1734:
	cmp	DWORD PTR _field$[ebp], 0
	je	$L1736
; Line 1925
	mov	eax, DWORD PTR _field$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 6
	test	al, 1
	jne	$L1737
; Line 1926
	call	_abort
; Line 1927
$L1737:
; Line 1928
	mov	eax, DWORD PTR _field$[ebp]
	mov	al, BYTE PTR [eax+36]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _field$[ebp]
	mov	ecx, DWORD PTR [ecx+28]
	imul	eax, DWORD PTR [ecx+20]
	mov	DWORD PTR _fieldsize$1730[ebp], eax
; Line 1929
	mov	eax, DWORD PTR _fieldsize$1730[ebp]
	add	eax, 7
	cdq
	and	edx, 7
	add	eax, edx
	sar	eax, 3
	mov	DWORD PTR _fieldsize$1730[ebp], eax
; Line 1931
	jmp	$L1738
$L1736:
; Line 1932
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_int_size_in_bytes
	add	esp, 4
	mov	DWORD PTR _fieldsize$1730[ebp], eax
$L1738:
; Line 1935
	mov	eax, DWORD PTR _fieldsize$1730[ebp]
	push	eax
	mov	eax, DWORD PTR _val$1726[ebp]
	push	eax
	call	_output_constant
	add	esp, 8
; Line 1938
	mov	eax, DWORD PTR _fieldsize$1730[ebp]
	add	DWORD PTR _total_bytes$[ebp], eax
; Line 1940
	jmp	$L1739
$L1728:
	mov	eax, DWORD PTR _val$1726[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	je	$L1740
; Line 1942
	mov	eax, DWORD PTR _field$[ebp]
	mov	eax, DWORD PTR [eax+40]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	OFFSET $SG1741
	call	_error
	add	esp, 8
; Line 1943
	jmp	$L1742
$L1740:
; Line 1947
	mov	eax, DWORD PTR _field$[ebp]
	mov	eax, DWORD PTR [eax+48]
	mov	DWORD PTR _next_offset$1743[ebp], eax
; Line 1951
	mov	eax, DWORD PTR _field$[ebp]
	mov	al, BYTE PTR [eax+36]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _field$[ebp]
	mov	ecx, DWORD PTR [ecx+28]
	imul	eax, DWORD PTR [ecx+20]
	add	eax, DWORD PTR _next_offset$1743[ebp]
	mov	DWORD PTR _end_offset$1744[ebp], eax
; Line 1955
	mov	eax, DWORD PTR _next_offset$1743[ebp]
	cdq
	and	edx, 7
	add	eax, edx
	sar	eax, 3
	cmp	eax, DWORD PTR _total_bytes$[ebp]
	je	$L1745
; Line 1958
	cmp	DWORD PTR _byte_buffer_in_use$[ebp], 0
	je	$L1746
; Line 1960
	mov	eax, DWORD PTR _byte$[ebp]
	push	eax
	push	OFFSET $SG1747
	push	OFFSET $SG1748
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
; Line 1961
	inc	DWORD PTR _total_bytes$[ebp]
; Line 1962
	mov	DWORD PTR _byte_buffer_in_use$[ebp], 0
; Line 1966
$L1746:
	mov	eax, DWORD PTR _next_offset$1743[ebp]
	cdq
	and	edx, 7
	add	eax, edx
	sar	eax, 3
	cmp	eax, DWORD PTR _total_bytes$[ebp]
	je	$L1749
; Line 1969
	mov	eax, DWORD PTR _next_offset$1743[ebp]
	cdq
	and	edx, 7
	add	eax, edx
	sar	eax, 3
	sub	eax, DWORD PTR _total_bytes$[ebp]
	push	eax
	push	OFFSET $SG1750
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 1970
	mov	eax, DWORD PTR _next_offset$1743[ebp]
	cdq
	and	edx, 7
	add	eax, edx
	sar	eax, 3
	mov	DWORD PTR _total_bytes$[ebp], eax
; Line 1972
$L1749:
; Line 1974
$L1745:
	cmp	DWORD PTR _byte_buffer_in_use$[ebp], 0
	jne	$L1751
; Line 1975
	mov	DWORD PTR _byte$[ebp], 0
; Line 1985
$L1751:
$L1753:
	mov	eax, DWORD PTR _end_offset$1744[ebp]
	cmp	DWORD PTR _next_offset$1743[ebp], eax
	jge	$L1754
; Line 1988
	mov	eax, DWORD PTR _next_offset$1743[ebp]
	cdq
	and	edx, 7
	add	eax, edx
	sar	eax, 3
	mov	DWORD PTR _next_byte$1756[ebp], eax
; Line 1989
	mov	eax, DWORD PTR _next_offset$1743[ebp]
	cdq
	xor	eax, edx
	sub	eax, edx
	and	eax, 7
	xor	eax, edx
	sub	eax, edx
	mov	DWORD PTR _next_bit$1757[ebp], eax
; Line 1993
$L1759:
	mov	eax, DWORD PTR _total_bytes$[ebp]
	cmp	DWORD PTR _next_byte$1756[ebp], eax
	je	$L1760
; Line 1995
	mov	eax, DWORD PTR _byte$[ebp]
	push	eax
	push	OFFSET $SG1761
	push	OFFSET $SG1762
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
; Line 1996
	inc	DWORD PTR _total_bytes$[ebp]
; Line 1997
	mov	DWORD PTR _byte$[ebp], 0
; Line 1998
	jmp	$L1759
$L1760:
; Line 2003
	mov	eax, DWORD PTR _end_offset$1744[ebp]
	sub	eax, DWORD PTR _next_offset$1743[ebp]
	mov	ecx, 8
	sub	ecx, DWORD PTR _next_bit$1757[ebp]
	cmp	eax, ecx
	jl	$L1869
	mov	eax, ecx
$L1869:
	mov	DWORD PTR _this_time$1755[ebp], eax
; Line 2019
	mov	eax, DWORD PTR _val$1726[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	ecx, DWORD PTR _next_offset$1743[ebp]
	mov	edx, DWORD PTR _field$[ebp]
	sub	ecx, DWORD PTR [edx+48]
	sar	eax, cl
	mov	edx, 1
	mov	cl, BYTE PTR _this_time$1755[ebp]
	shl	edx, cl
	dec	edx
	and	eax, edx
	mov	cl, BYTE PTR _next_bit$1757[ebp]
	shl	eax, cl
	or	DWORD PTR _byte$[ebp], eax
; Line 2021
	mov	eax, DWORD PTR _this_time$1755[ebp]
	add	DWORD PTR _next_offset$1743[ebp], eax
; Line 2022
	mov	DWORD PTR _byte_buffer_in_use$[ebp], 1
; Line 2023
	jmp	$L1753
$L1754:
; Line 2024
$L1742:
$L1739:
; Line 2025
	jmp	$L1724
$L1725:
; Line 2026
	cmp	DWORD PTR _byte_buffer_in_use$[ebp], 0
	je	$L1763
; Line 2028
	mov	eax, DWORD PTR _byte$[ebp]
	push	eax
	push	OFFSET $SG1764
	push	OFFSET $SG1765
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
; Line 2029
	inc	DWORD PTR _total_bytes$[ebp]
; Line 2031
$L1763:
	mov	eax, DWORD PTR _size$[ebp]
	cmp	DWORD PTR _total_bytes$[ebp], eax
	jge	$L1766
; Line 2032
	mov	eax, DWORD PTR _size$[ebp]
	sub	eax, DWORD PTR _total_bytes$[ebp]
	push	eax
	push	OFFSET $SG1767
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 2033
$L1766:
$L1714:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_constructor ENDP
_TEXT	ENDS
END
