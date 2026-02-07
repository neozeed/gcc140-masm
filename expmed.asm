	TITLE	expmed.c
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
PUBLIC	_negate_rtx
EXTRN	_mode_size:BYTE
EXTRN	_expand_unop:NEAR
EXTRN	_gen_rtx:NEAR
EXTRN	_neg_optab:DWORD
_TEXT	SEGMENT
; File expmed.c
_mode$ = 8
_x$ = 12
_val$1044 = -4
_negate_rtx PROC NEAR
; Line 45
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 46
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1043
; Line 48
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	neg	eax
	mov	DWORD PTR _val$1044[ebp], eax
; Line 49
	mov	eax, DWORD PTR _mode$[ebp]
	mov	eax, DWORD PTR _mode_size[eax*4]
	shl	eax, 3
	cmp	eax, 32					; 00000020H
	jge	$L1045
; Line 52
	mov	eax, 1
	mov	ecx, DWORD PTR _mode$[ebp]
	mov	ecx, DWORD PTR _mode_size[ecx*4]
	shl	ecx, 3
	dec	ecx
	shl	eax, cl
	test	eax, DWORD PTR _val$1044[ebp]
	je	$L1046
; Line 53
	mov	eax, -1
	mov	ecx, DWORD PTR _mode$[ebp]
	mov	ecx, DWORD PTR _mode_size[ecx*4]
	shl	ecx, 3
	shl	eax, cl
	or	DWORD PTR _val$1044[ebp], eax
; Line 54
	jmp	$L1047
$L1046:
; Line 55
	mov	eax, 1
	mov	ecx, DWORD PTR _mode$[ebp]
	mov	ecx, DWORD PTR _mode_size[ecx*4]
	shl	ecx, 3
	shl	eax, cl
	dec	eax
	and	DWORD PTR _val$1044[ebp], eax
$L1047:
; Line 57
$L1045:
	mov	eax, DWORD PTR _val$1044[ebp]
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	jmp	$L1042
; Line 59
	jmp	$L1048
$L1043:
; Line 60
	push	0
	push	0
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	mov	eax, DWORD PTR _neg_optab
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	call	_expand_unop
	add	esp, 20					; 00000014H
	jmp	$L1042
$L1048:
; Line 61
$L1042:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_negate_rtx ENDP
_TEXT	ENDS
PUBLIC	_store_bit_field
EXTRN	_convert_to_mode:NEAR
EXTRN	_flag_force_mem:DWORD
EXTRN	_insn_gen_function:BYTE
EXTRN	_gen_lowpart:NEAR
EXTRN	_gen_highpart:NEAR
EXTRN	_force_reg:NEAR
EXTRN	_force_not_mem:NEAR
EXTRN	_protect_from_queue:NEAR
EXTRN	_emit_move_insn:NEAR
EXTRN	_emit_insn:NEAR
EXTRN	_movstrict_optab:DWORD
_TEXT	SEGMENT
_str_rtx$ = 8
_bitsize$ = 12
_bitnum$ = 16
_fieldmode$ = 20
_value$ = 24
_align$ = 28
_total_size$ = 32
_unit$ = -8
_offset$ = -12
_bitpos$ = -20
_op0$ = -16
_low_size$1080 = -36
_low_pos$1081 = -32
_high_size$1082 = -28
_high_pos$1083 = -24
_store_bit_field PROC NEAR
; Line 79
	push	ebp
	mov	ebp, esp
	sub	esp, 36					; 00000024H
	push	ebx
	push	esi
	push	edi
; Line 80
	mov	eax, DWORD PTR _str_rtx$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	sub	eax, ecx
	cmp	eax, 1
	sbb	eax, eax
	and	eax, -24				; ffffffe8H
	add	eax, 32					; 00000020H
	mov	DWORD PTR _unit$[ebp], eax
; Line 81
	mov	eax, DWORD PTR _bitnum$[ebp]
	cdq
	idiv	DWORD PTR _unit$[ebp]
	mov	DWORD PTR _offset$[ebp], eax
; Line 82
	mov	eax, DWORD PTR _bitnum$[ebp]
	cdq
	idiv	DWORD PTR _unit$[ebp]
	mov	DWORD PTR _bitpos$[ebp], edx
; Line 83
	mov	eax, DWORD PTR _str_rtx$[ebp]
	mov	DWORD PTR _op0$[ebp], eax
; Line 96
	cmp	DWORD PTR _total_size$[ebp], 0
	jl	$L1062
; Line 98
	sub	ecx, ecx
	mov	eax, DWORD PTR _bitpos$[ebp]
	cdq
	and	edx, 31					; 0000001fH
	add	eax, edx
	sar	eax, 5
	shl	eax, 2
	sub	ecx, eax
	neg	ecx
	sub	DWORD PTR _total_size$[ebp], ecx
; Line 100
$L1062:
$L1064:
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1065
; Line 107
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	DWORD PTR _offset$[ebp], eax
; Line 108
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _op0$[ebp], eax
; Line 109
	jmp	$L1064
$L1065:
; Line 111
	push	0
	mov	eax, DWORD PTR _value$[ebp]
	push	eax
	call	_protect_from_queue
	add	esp, 8
	mov	DWORD PTR _value$[ebp], eax
; Line 113
	cmp	DWORD PTR _flag_force_mem, 0
	je	$L1066
; Line 114
	mov	eax, DWORD PTR _value$[ebp]
	push	eax
	call	_force_not_mem
	add	esp, 4
	mov	DWORD PTR _value$[ebp], eax
; Line 116
$L1066:
; Line 119
	mov	eax, DWORD PTR _fieldmode$[ebp]
	cmp	DWORD PTR _mode_size[eax*4], 4
	jl	$L1067
	mov	eax, DWORD PTR _fieldmode$[ebp]
	mov	eax, DWORD PTR _mode_size[eax*4]
	shl	eax, 3
	cmp	eax, DWORD PTR _bitsize$[ebp]
	jne	$L1067
	mov	eax, DWORD PTR _bitpos$[ebp]
	cdq
	xor	eax, edx
	sub	eax, edx
	and	eax, 31					; 0000001fH
	xor	eax, edx
	sub	eax, edx
	jne	$L1067
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1067
; Line 123
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	cmp	eax, DWORD PTR _fieldmode$[ebp]
	je	$L1068
; Line 124
	mov	eax, DWORD PTR _offset$[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _fieldmode$[ebp]
	push	eax
	push	35					; 00000023H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	DWORD PTR _op0$[ebp], eax
; Line 125
$L1068:
	mov	eax, DWORD PTR _value$[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	call	_emit_move_insn
	add	esp, 8
; Line 126
	mov	eax, DWORD PTR _value$[ebp]
	jmp	$L1056
; Line 147
$L1067:
; Line 155
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1069
	cmp	DWORD PTR _bitpos$[ebp], 0
	jne	$L1069
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	cmp	eax, DWORD PTR _fieldmode$[ebp]
	je	$L1070
	mov	eax, DWORD PTR _fieldmode$[ebp]
	mov	ecx, DWORD PTR _movstrict_optab
	cmp	DWORD PTR [ecx+eax*8+4], 142		; 0000008eH
	je	$L1069
$L1070:
; Line 158
	mov	eax, DWORD PTR _value$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1072
	mov	eax, DWORD PTR _value$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1071
$L1072:
; Line 159
	mov	eax, DWORD PTR _value$[ebp]
	push	eax
	mov	eax, DWORD PTR _fieldmode$[ebp]
	push	eax
	call	_gen_lowpart
	add	esp, 8
	mov	DWORD PTR _value$[ebp], eax
; Line 160
	jmp	$L1073
$L1071:
; Line 162
	mov	eax, DWORD PTR _value$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1074
	mov	eax, DWORD PTR _value$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1074
	mov	eax, DWORD PTR _value$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1074
; Line 163
	push	0
	mov	eax, DWORD PTR _value$[ebp]
	push	eax
	mov	eax, DWORD PTR _fieldmode$[ebp]
	push	eax
	call	_convert_to_mode
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _value$[ebp], eax
; Line 165
$L1074:
$L1073:
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	cmp	eax, DWORD PTR _fieldmode$[ebp]
	jne	$L1075
; Line 166
	mov	eax, DWORD PTR _value$[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	call	_emit_move_insn
	add	esp, 8
; Line 167
	jmp	$L1076
$L1075:
; Line 169
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1077
; Line 170
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax]
	and	eax, -16711681				; ff00ffffH
	mov	ecx, DWORD PTR _fieldmode$[ebp]
	and	ecx, 255				; 000000ffH
	shl	ecx, 16					; 00000010H
	or	eax, ecx
	mov	ecx, DWORD PTR _op0$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 171
	jmp	$L1078
$L1077:
; Line 172
	mov	eax, DWORD PTR _offset$[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _fieldmode$[ebp]
	push	eax
	push	35					; 00000023H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	DWORD PTR _op0$[ebp], eax
$L1078:
; Line 174
	mov	eax, DWORD PTR _value$[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _fieldmode$[ebp]
	mov	ecx, DWORD PTR _movstrict_optab
	mov	eax, DWORD PTR [ecx+eax*8+4]
	call	DWORD PTR _insn_gen_function[eax*4]
	add	esp, 8
	push	eax
	call	_emit_insn
	add	esp, 4
; Line 175
$L1076:
; Line 177
	mov	eax, DWORD PTR _value$[ebp]
	jmp	$L1056
; Line 182
$L1069:
	cmp	DWORD PTR _bitsize$[ebp], 32		; 00000020H
	jle	$L1079
; Line 184
	mov	DWORD PTR _low_size$1080[ebp], 32	; 00000020H
; Line 185
	mov	eax, DWORD PTR _offset$[ebp]
	imul	eax, DWORD PTR _unit$[ebp]
	add	eax, DWORD PTR _bitpos$[ebp]
	mov	DWORD PTR _low_pos$1081[ebp], eax
; Line 186
	mov	eax, DWORD PTR _bitsize$[ebp]
	sub	eax, DWORD PTR _low_size$1080[ebp]
	mov	DWORD PTR _high_size$1082[ebp], eax
; Line 192
	mov	eax, DWORD PTR _low_pos$1081[ebp]
	add	eax, DWORD PTR _low_size$1080[ebp]
	mov	DWORD PTR _high_pos$1083[ebp], eax
; Line 195
	mov	eax, DWORD PTR _value$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sub	ecx, ecx
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L1084
; Line 196
	mov	eax, DWORD PTR _value$[ebp]
	push	eax
	mov	eax, DWORD PTR _value$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	call	_force_reg
	add	esp, 8
	mov	DWORD PTR _value$[ebp], eax
; Line 197
$L1084:
; Line 198
	mov	eax, DWORD PTR _total_size$[ebp]
	push	eax
	mov	eax, DWORD PTR _align$[ebp]
	push	eax
	mov	eax, DWORD PTR _value$[ebp]
	push	eax
	push	4
	call	_gen_lowpart
	add	esp, 8
	push	eax
	push	4
	mov	eax, DWORD PTR _low_pos$1081[ebp]
	push	eax
	mov	eax, DWORD PTR _low_size$1080[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	call	_store_bit_field
	add	esp, 28					; 0000001cH
; Line 200
	mov	eax, DWORD PTR _total_size$[ebp]
	push	eax
	mov	eax, DWORD PTR _align$[ebp]
	push	eax
	mov	eax, DWORD PTR _value$[ebp]
	push	eax
	push	4
	call	_gen_highpart
	add	esp, 8
	push	eax
	push	4
	mov	eax, DWORD PTR _high_pos$1083[ebp]
	push	eax
	mov	eax, DWORD PTR _high_size$1082[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	call	_store_bit_field
	add	esp, 28					; 0000001cH
; Line 201
	mov	eax, DWORD PTR _value$[ebp]
	jmp	$L1056
; Line 210
$L1079:
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1086
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1085
$L1086:
; Line 214
	cmp	DWORD PTR _offset$[ebp], 0
	jne	$L1088
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	ecx, DWORD PTR _mode_size+16
	cmp	DWORD PTR _mode_size[eax], ecx
	jle	$L1087
$L1088:
; Line 216
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1089
; Line 217
	mov	eax, DWORD PTR _offset$[ebp]
	mov	ecx, DWORD PTR _op0$[ebp]
	add	DWORD PTR [ecx+8], eax
; Line 218
	jmp	$L1090
$L1089:
; Line 219
	mov	eax, DWORD PTR _offset$[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	push	4
	push	35					; 00000023H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	DWORD PTR _op0$[ebp], eax
$L1090:
; Line 221
$L1087:
	mov	DWORD PTR _offset$[ebp], 0
; Line 223
	jmp	$L1091
$L1085:
; Line 225
	push	1
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	call	_protect_from_queue
	add	esp, 8
	mov	DWORD PTR _op0$[ebp], eax
; Line 226
$L1091:
; Line 367
	mov	eax, DWORD PTR _align$[ebp]
	push	eax
	mov	eax, DWORD PTR _value$[ebp]
	push	eax
	mov	eax, DWORD PTR _bitpos$[ebp]
	push	eax
	mov	eax, DWORD PTR _bitsize$[ebp]
	push	eax
	mov	eax, DWORD PTR _offset$[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	call	_store_fixed_bit_field
	add	esp, 24					; 00000018H
; Line 368
	mov	eax, DWORD PTR _value$[ebp]
	jmp	$L1056
; Line 369
$L1056:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_store_bit_field ENDP
_TEXT	ENDS
PUBLIC	_expand_shift
PUBLIC	_expand_bit_and
EXTRN	_plus_constant:NEAR
EXTRN	_expand_binop:NEAR
EXTRN	_abort:NEAR
EXTRN	_build_int_2:NEAR
EXTRN	_change_address:NEAR
EXTRN	_ior_optab:DWORD
_TEXT	SEGMENT
_op0$ = 8
_offset$ = 12
_bitsize$ = 16
_bitpos$ = 20
_value$ = 24
_struct_align$ = 28
_mode$ = -4
_total_bits$ = -20
_subtarget$ = -16
_all_zero$ = -12
_all_one$ = -8
_v$1116 = -24
_must_and$1122 = -28
_store_fixed_bit_field PROC NEAR
; Line 389
	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H
	push	ebx
	push	esi
	push	edi
; Line 391
	mov	DWORD PTR _total_bits$[ebp], 32		; 00000020H
; Line 393
	mov	DWORD PTR _all_zero$[ebp], 0
; Line 394
	mov	DWORD PTR _all_one$[ebp], 0
; Line 407
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1105
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1104
$L1105:
; Line 409
	cmp	DWORD PTR _offset$[ebp], 0
	je	$L1106
; Line 410
	call	_abort
; Line 412
$L1106:
	mov	eax, DWORD PTR _bitpos$[ebp]
	add	eax, DWORD PTR _bitsize$[ebp]
	cmp	eax, 32					; 00000020H
	jle	$L1108
; Line 414
	push	32					; 00000020H
	mov	eax, DWORD PTR _value$[ebp]
	push	eax
	mov	eax, DWORD PTR _bitpos$[ebp]
	push	eax
	mov	eax, DWORD PTR _bitsize$[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	call	_store_split_bit_field
	add	esp, 20					; 00000014H
; Line 415
	jmp	$L1098
; Line 417
$L1108:
; Line 418
	jmp	$L1109
$L1104:
; Line 421
	mov	eax, DWORD PTR _bitpos$[ebp]
	add	eax, DWORD PTR _bitsize$[ebp]
	cmp	eax, 8
	jg	$L1110
; Line 425
	mov	DWORD PTR _total_bits$[ebp], 8
; Line 427
	mov	eax, DWORD PTR _offset$[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_plus_constant
	add	esp, 8
	push	eax
	push	1
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	call	_change_address
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _op0$[ebp], eax
; Line 429
	jmp	$L1111
$L1110:
; Line 435
	mov	eax, DWORD PTR _offset$[ebp]
	cdq
	idiv	DWORD PTR _mode_size+8
	lea	eax, DWORD PTR [edx*8]
	add	eax, DWORD PTR _bitpos$[ebp]
	add	eax, DWORD PTR _bitsize$[ebp]
	mov	ecx, DWORD PTR _mode_size+8
	shl	ecx, 3
	cmp	eax, ecx
	jg	$L1112
; Line 440
	mov	eax, DWORD PTR _mode_size+8
	shl	eax, 3
	mov	DWORD PTR _total_bits$[ebp], eax
; Line 443
	mov	eax, DWORD PTR _total_bits$[ebp]
	cdq
	and	edx, 7
	add	eax, edx
	sar	eax, 3
	mov	ecx, eax
	mov	eax, DWORD PTR _offset$[ebp]
	cdq
	idiv	ecx
	lea	eax, DWORD PTR [edx*8]
	add	DWORD PTR _bitpos$[ebp], eax
; Line 444
	sub	ecx, ecx
	mov	eax, DWORD PTR _total_bits$[ebp]
	cdq
	and	edx, 7
	add	eax, edx
	sar	eax, 3
	mov	ebx, eax
	mov	eax, DWORD PTR _offset$[ebp]
	cdq
	idiv	ebx
	sub	ecx, edx
	neg	ecx
	sub	DWORD PTR _offset$[ebp], ecx
; Line 446
	mov	eax, DWORD PTR _offset$[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_plus_constant
	add	esp, 8
	push	eax
	push	2
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	call	_change_address
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _op0$[ebp], eax
; Line 448
	jmp	$L1113
$L1112:
; Line 454
	mov	eax, DWORD PTR _offset$[ebp]
	cdq
	xor	eax, edx
	sub	eax, edx
	and	eax, 3
	xor	eax, edx
	sub	eax, edx
	shl	eax, 3
	add	DWORD PTR _bitpos$[ebp], eax
; Line 455
	sub	ecx, ecx
	mov	eax, DWORD PTR _offset$[ebp]
	cdq
	xor	eax, edx
	sub	eax, edx
	and	eax, 3
	xor	eax, edx
	sub	eax, edx
	sub	ecx, eax
	neg	ecx
	sub	DWORD PTR _offset$[ebp], ecx
; Line 457
	mov	eax, DWORD PTR _offset$[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_plus_constant
	add	esp, 8
	push	eax
	push	4
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	call	_change_address
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _op0$[ebp], eax
; Line 460
	mov	eax, DWORD PTR _bitpos$[ebp]
	add	eax, DWORD PTR _bitsize$[ebp]
	cmp	eax, 32					; 00000020H
	jle	$L1114
; Line 462
	mov	eax, DWORD PTR _struct_align$[ebp]
	push	eax
	mov	eax, DWORD PTR _value$[ebp]
	push	eax
	mov	eax, DWORD PTR _bitpos$[ebp]
	push	eax
	mov	eax, DWORD PTR _bitsize$[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	call	_store_split_bit_field
	add	esp, 20					; 00000014H
; Line 463
	jmp	$L1098
; Line 465
$L1114:
$L1113:
$L1111:
$L1109:
; Line 467
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	mov	DWORD PTR _mode$[ebp], eax
; Line 488
	mov	eax, DWORD PTR _value$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1115
; Line 490
	mov	eax, DWORD PTR _value$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _v$1116[ebp], eax
; Line 492
	cmp	DWORD PTR _bitsize$[ebp], 32		; 00000020H
	jge	$L1117
; Line 493
	mov	eax, 1
	mov	cl, BYTE PTR _bitsize$[ebp]
	shl	eax, cl
	dec	eax
	and	DWORD PTR _v$1116[ebp], eax
; Line 495
$L1117:
	cmp	DWORD PTR _v$1116[ebp], 0
	jne	$L1118
; Line 496
	mov	DWORD PTR _all_zero$[ebp], 1
; Line 497
	jmp	$L1119
$L1118:
	cmp	DWORD PTR _bitsize$[ebp], 32		; 00000020H
	jge	$L1120
	mov	eax, 1
	mov	cl, BYTE PTR _bitsize$[ebp]
	shl	eax, cl
	dec	eax
	cmp	eax, DWORD PTR _v$1116[ebp]
	jne	$L1120
; Line 498
	mov	DWORD PTR _all_one$[ebp], 1
; Line 500
$L1120:
$L1119:
	mov	eax, DWORD PTR _v$1116[ebp]
	mov	cl, BYTE PTR _bitpos$[ebp]
	shl	eax, cl
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _value$[ebp], eax
; Line 502
	jmp	$L1121
$L1115:
; Line 504
	mov	eax, DWORD PTR _value$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	shl	eax, 3
	sub	eax, DWORD PTR _bitsize$[ebp]
	cmp	eax, 1
	sbb	eax, eax
	inc	eax
	mov	DWORD PTR _must_and$1122[ebp], eax
; Line 506
	mov	eax, DWORD PTR _value$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	cmp	eax, DWORD PTR _mode$[ebp]
	je	$L1123
; Line 509
	mov	eax, DWORD PTR _value$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1125
	mov	eax, DWORD PTR _value$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1124
$L1125:
	mov	eax, DWORD PTR _value$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	ecx, DWORD PTR _mode$[ebp]
	mov	ecx, DWORD PTR _mode_size[ecx*4]
	cmp	DWORD PTR _mode_size[eax], ecx
	jle	$L1124
; Line 510
	mov	eax, DWORD PTR _value$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_gen_lowpart
	add	esp, 8
	mov	DWORD PTR _value$[ebp], eax
; Line 511
	jmp	$L1126
$L1124:
; Line 512
	push	1
	mov	eax, DWORD PTR _value$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_convert_to_mode
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _value$[ebp], eax
$L1126:
; Line 515
$L1123:
	cmp	DWORD PTR _must_and$1122[ebp], 0
	je	$L1127
	cmp	DWORD PTR _bitsize$[ebp], 32		; 00000020H
	jge	$L1127
; Line 519
	push	0
	mov	eax, 1
	mov	cl, BYTE PTR _bitsize$[ebp]
	shl	eax, cl
	dec	eax
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _value$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_expand_bit_and
	add	esp, 16					; 00000010H
	mov	DWORD PTR _value$[ebp], eax
; Line 520
$L1127:
	cmp	DWORD PTR _bitpos$[ebp], 0
	jle	$L1128
; Line 522
	push	1
	push	0
	push	0
	mov	eax, DWORD PTR _bitpos$[ebp]
	push	eax
	call	_build_int_2
	add	esp, 8
	push	eax
	mov	eax, DWORD PTR _value$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	push	88					; 00000058H
	call	_expand_shift
	add	esp, 24					; 00000018H
	mov	DWORD PTR _value$[ebp], eax
; Line 523
$L1128:
$L1121:
; Line 528
	mov	eax, DWORD PTR _op0$[ebp]
	mov	DWORD PTR _subtarget$[ebp], eax
; Line 530
	cmp	DWORD PTR _all_one$[ebp], 0
	jne	$L1129
; Line 540
	mov	eax, DWORD PTR _mode$[ebp]
	mov	eax, DWORD PTR _mode_size[eax*4]
	and	eax, 536870911				; 1fffffffH
	mov	ecx, 4
	and	ecx, 536870911				; 1fffffffH
	cmp	eax, ecx
	jne	$L1423
	mov	DWORD PTR -32+[ebp], -1
	jmp	$L1424
$L1423:
	mov	eax, 1
	mov	ecx, DWORD PTR _mode$[ebp]
	mov	ecx, DWORD PTR _mode_size[ecx*4]
	shl	ecx, 3
	shl	eax, cl
	dec	eax
	mov	DWORD PTR -32+[ebp], eax
$L1424:
	mov	eax, DWORD PTR _subtarget$[ebp]
	push	eax
	mov	eax, -1
	mov	ecx, 32					; 00000020H
	sub	ecx, DWORD PTR _bitsize$[ebp]
	shr	eax, cl
	mov	cl, BYTE PTR _bitpos$[ebp]
	shl	eax, cl
	not	eax
	and	eax, DWORD PTR -32+[ebp]
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_expand_bit_and
	add	esp, 16					; 00000010H
	mov	DWORD PTR _subtarget$[ebp], eax
; Line 544
$L1129:
	cmp	DWORD PTR _all_zero$[ebp], 0
	jne	$L1130
; Line 546
	push	3
	push	1
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _value$[ebp]
	push	eax
	mov	eax, DWORD PTR _subtarget$[ebp]
	push	eax
	mov	eax, DWORD PTR _ior_optab
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_expand_binop
	add	esp, 28					; 0000001cH
	mov	DWORD PTR _subtarget$[ebp], eax
; Line 547
$L1130:
	mov	eax, DWORD PTR _subtarget$[ebp]
	cmp	DWORD PTR _op0$[ebp], eax
	je	$L1131
; Line 548
	mov	eax, DWORD PTR _subtarget$[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	call	_emit_move_insn
	add	esp, 8
; Line 549
$L1131:
$L1098:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_store_fixed_bit_field ENDP
_TEXT	ENDS
EXTRN	_copy_to_reg:NEAR
_TEXT	SEGMENT
_op0$ = 8
_bitsize$ = 12
_bitpos$ = 16
_value$ = 20
_align$ = 24
_bitsize_1$ = -16
_bitsize_2$ = -12
_part1$ = -8
_part2$ = -4
_valalign$ = -20
_store_split_bit_field PROC NEAR
; Line 564
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	push	ebx
	push	esi
	push	edi
; Line 566
	mov	eax, 32					; 00000020H
	sub	eax, DWORD PTR _bitpos$[ebp]
	mov	DWORD PTR _bitsize_1$[ebp], eax
; Line 568
	mov	eax, DWORD PTR _bitsize$[ebp]
	sub	eax, DWORD PTR _bitsize_1$[ebp]
	mov	DWORD PTR _bitsize_2$[ebp], eax
; Line 572
	mov	eax, DWORD PTR _mode_size+16
	mov	DWORD PTR _valalign$[ebp], eax
; Line 574
	mov	eax, DWORD PTR _value$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sub	ecx, ecx
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L1143
; Line 575
	push	1
	mov	eax, DWORD PTR _value$[ebp]
	push	eax
	push	4
	call	_convert_to_mode
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _value$[ebp], eax
; Line 576
$L1143:
	mov	eax, DWORD PTR _value$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1145
	mov	eax, DWORD PTR _value$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1145
	mov	eax, DWORD PTR _value$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1145
	mov	eax, DWORD PTR _value$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1144
$L1145:
	mov	eax, DWORD PTR _value$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1144
; Line 577
	mov	eax, DWORD PTR _value$[ebp]
	push	eax
	call	_copy_to_reg
	add	esp, 4
	mov	DWORD PTR _value$[ebp], eax
; Line 599
$L1144:
	mov	eax, DWORD PTR _value$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1146
; Line 602
	mov	eax, DWORD PTR _value$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	edx, 1
	mov	cl, BYTE PTR _bitsize_1$[ebp]
	shl	edx, cl
	dec	edx
	and	eax, edx
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _part1$[ebp], eax
; Line 604
	mov	eax, DWORD PTR _value$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	cl, BYTE PTR _bitsize_1$[ebp]
	shr	eax, cl
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _part2$[ebp], eax
; Line 606
	jmp	$L1147
$L1146:
; Line 609
	mov	eax, DWORD PTR _valalign$[ebp]
	push	eax
	push	1
	push	0
	push	0
	mov	eax, DWORD PTR _bitsize_1$[ebp]
	push	eax
	push	0
	mov	eax, DWORD PTR _value$[ebp]
	push	eax
	push	4
	call	_extract_fixed_bit_field
	add	esp, 32					; 00000020H
	mov	DWORD PTR _part1$[ebp], eax
; Line 611
	mov	eax, DWORD PTR _valalign$[ebp]
	push	eax
	push	1
	push	0
	mov	eax, DWORD PTR _bitsize_1$[ebp]
	push	eax
	mov	eax, DWORD PTR _bitsize_2$[ebp]
	push	eax
	push	0
	mov	eax, DWORD PTR _value$[ebp]
	push	eax
	push	4
	call	_extract_fixed_bit_field
	add	esp, 32					; 00000020H
	mov	DWORD PTR _part2$[ebp], eax
; Line 612
$L1147:
; Line 616
	mov	eax, DWORD PTR _align$[ebp]
	push	eax
	mov	eax, DWORD PTR _part1$[ebp]
	push	eax
	mov	eax, DWORD PTR _bitpos$[ebp]
	push	eax
	mov	eax, DWORD PTR _bitsize_1$[ebp]
	push	eax
	push	0
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	call	_store_fixed_bit_field
	add	esp, 24					; 00000018H
; Line 619
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1148
; Line 621
	push	4
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_plus_constant
	add	esp, 8
	push	eax
	push	4
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	call	_change_address
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _op0$[ebp], eax
; Line 622
	jmp	$L1149
$L1148:
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1150
; Line 623
	push	1
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	push	4
	push	35					; 00000023H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	DWORD PTR _op0$[ebp], eax
; Line 624
	jmp	$L1151
$L1150:
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1152
; Line 625
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax+8]
	inc	eax
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	4
	push	35					; 00000023H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	DWORD PTR _op0$[ebp], eax
; Line 628
$L1152:
$L1151:
$L1149:
	mov	eax, DWORD PTR _align$[ebp]
	push	eax
	mov	eax, DWORD PTR _part2$[ebp]
	push	eax
	push	0
	mov	eax, DWORD PTR _bitsize_2$[ebp]
	push	eax
	push	0
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	call	_store_fixed_bit_field
	add	esp, 24					; 00000018H
; Line 629
$L1137:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_store_split_bit_field ENDP
_TEXT	ENDS
PUBLIC	_extract_bit_field
EXTRN	_gen_reg_rtx:NEAR
_TEXT	SEGMENT
_str_rtx$ = 8
_bitsize$ = 12
_bitnum$ = 16
_unsignedp$ = 20
_target$ = 24
_mode$ = 28
_tmode$ = 32
_align$ = 36
_total_size$ = 40
_unit$ = -16
_offset$ = -20
_bitpos$ = -28
_op0$ = -24
_spec_target$ = -32
_spec_target_subreg$ = -8
_mode1$1180 = -36
_low_size$1188 = -68
_low_pos$1189 = -60
_target_low_part$1190 = -40
_low_part$1191 = -56
_high_size$1192 = -52
_high_pos$1193 = -48
_target_high_part$1194 = -44
_high_part$1195 = -64
_extract_bit_field PROC NEAR
; Line 663
	push	ebp
	mov	ebp, esp
	sub	esp, 68					; 00000044H
	push	ebx
	push	esi
	push	edi
; Line 664
	mov	eax, DWORD PTR _str_rtx$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	sub	eax, ecx
	cmp	eax, 1
	sbb	eax, eax
	and	eax, -24				; ffffffe8H
	add	eax, 32					; 00000020H
	mov	DWORD PTR _unit$[ebp], eax
; Line 665
	mov	eax, DWORD PTR _bitnum$[ebp]
	cdq
	idiv	DWORD PTR _unit$[ebp]
	mov	DWORD PTR _offset$[ebp], eax
; Line 666
	mov	eax, DWORD PTR _bitnum$[ebp]
	cdq
	idiv	DWORD PTR _unit$[ebp]
	mov	DWORD PTR _bitpos$[ebp], edx
; Line 667
	mov	eax, DWORD PTR _str_rtx$[ebp]
	mov	DWORD PTR _op0$[ebp], eax
; Line 668
	mov	eax, DWORD PTR _target$[ebp]
	mov	DWORD PTR _spec_target$[ebp], eax
; Line 670
	mov	DWORD PTR _spec_target_subreg$[ebp], 0
; Line 674
	cmp	DWORD PTR _total_size$[ebp], 0
	jl	$L1171
; Line 676
	sub	ecx, ecx
	mov	eax, DWORD PTR _bitpos$[ebp]
	cdq
	and	edx, 31					; 0000001fH
	add	eax, edx
	sar	eax, 5
	shl	eax, 2
	sub	ecx, eax
	neg	ecx
	sub	DWORD PTR _total_size$[ebp], ecx
; Line 678
$L1171:
	cmp	DWORD PTR _tmode$[ebp], 0
	jne	$L1172
; Line 679
	mov	eax, DWORD PTR _mode$[ebp]
	mov	DWORD PTR _tmode$[ebp], eax
; Line 681
$L1172:
$L1174:
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1175
; Line 688
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	DWORD PTR _offset$[ebp], eax
; Line 689
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _op0$[ebp], eax
; Line 690
	jmp	$L1174
$L1175:
; Line 724
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1176
	cmp	DWORD PTR _bitsize$[ebp], 32		; 00000020H
	jl	$L1178
	mov	eax, DWORD PTR _mode$[ebp]
	mov	eax, DWORD PTR _mode_size[eax*4]
	shl	eax, 3
	cmp	eax, DWORD PTR _bitsize$[ebp]
	jne	$L1178
	mov	eax, DWORD PTR _bitpos$[ebp]
	cdq
	xor	eax, edx
	sub	eax, edx
	and	eax, 31					; 0000001fH
	xor	eax, edx
	sub	eax, edx
	je	$L1177
$L1178:
	mov	eax, DWORD PTR _mode$[ebp]
	mov	eax, DWORD PTR _mode_size[eax*4]
	shl	eax, 3
	cmp	eax, DWORD PTR _bitsize$[ebp]
	je	$L1179
	mov	eax, DWORD PTR _mode_size+4
	shl	eax, 3
	cmp	eax, DWORD PTR _bitsize$[ebp]
	je	$L1179
	mov	eax, DWORD PTR _mode_size+8
	shl	eax, 3
	cmp	eax, DWORD PTR _bitsize$[ebp]
	jne	$L1176
$L1179:
	cmp	DWORD PTR _bitpos$[ebp], 0
	jne	$L1176
$L1177:
; Line 726
	mov	eax, DWORD PTR _mode$[ebp]
	mov	DWORD PTR _mode1$1180[ebp], eax
; Line 728
	mov	eax, DWORD PTR _mode_size+4
	shl	eax, 3
	cmp	eax, DWORD PTR _bitsize$[ebp]
	jne	$L1181
; Line 729
	mov	DWORD PTR _mode1$1180[ebp], 1
; Line 730
$L1181:
	mov	eax, DWORD PTR _mode_size+8
	shl	eax, 3
	cmp	eax, DWORD PTR _bitsize$[ebp]
	jne	$L1182
; Line 731
	mov	DWORD PTR _mode1$1180[ebp], 2
; Line 733
$L1182:
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	cmp	eax, DWORD PTR _mode1$1180[ebp]
	je	$L1183
; Line 735
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1184
; Line 736
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax]
	and	eax, -16711681				; ff00ffffH
	mov	ecx, DWORD PTR _mode1$1180[ebp]
	and	ecx, 255				; 000000ffH
	shl	ecx, 16					; 00000010H
	or	eax, ecx
	mov	ecx, DWORD PTR _op0$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 737
	jmp	$L1185
$L1184:
; Line 738
	mov	eax, DWORD PTR _offset$[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode1$1180[ebp]
	push	eax
	push	35					; 00000023H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	DWORD PTR _op0$[ebp], eax
$L1185:
; Line 741
$L1183:
	mov	eax, DWORD PTR _mode1$1180[ebp]
	cmp	DWORD PTR _mode$[ebp], eax
	je	$L1186
; Line 742
	mov	eax, DWORD PTR _unsignedp$[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _tmode$[ebp]
	push	eax
	call	_convert_to_mode
	add	esp, 12					; 0000000cH
	jmp	$L1162
; Line 743
$L1186:
	mov	eax, DWORD PTR _op0$[ebp]
	jmp	$L1162
; Line 748
$L1176:
	cmp	DWORD PTR _bitsize$[ebp], 32		; 00000020H
	jle	$L1187
; Line 750
	mov	DWORD PTR _low_size$1188[ebp], 32	; 00000020H
; Line 751
	mov	eax, DWORD PTR _offset$[ebp]
	imul	eax, DWORD PTR _unit$[ebp]
	add	eax, DWORD PTR _bitpos$[ebp]
	mov	DWORD PTR _low_pos$1189[ebp], eax
; Line 753
	mov	eax, DWORD PTR _bitsize$[ebp]
	sub	eax, DWORD PTR _low_size$1188[ebp]
	mov	DWORD PTR _high_size$1192[ebp], eax
; Line 760
	mov	eax, DWORD PTR _low_pos$1189[ebp]
	add	eax, DWORD PTR _low_size$1188[ebp]
	mov	DWORD PTR _high_pos$1193[ebp], eax
; Line 763
	cmp	DWORD PTR _target$[ebp], 0
	je	$L1197
	mov	eax, DWORD PTR _target$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1196
$L1197:
; Line 764
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_gen_reg_rtx
	add	esp, 4
	mov	DWORD PTR _target$[ebp], eax
; Line 768
$L1196:
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	push	4
	call	_gen_lowpart
	add	esp, 8
	mov	DWORD PTR _target_low_part$1190[ebp], eax
; Line 771
	mov	eax, DWORD PTR _total_size$[ebp]
	push	eax
	mov	eax, DWORD PTR _align$[ebp]
	push	eax
	push	4
	push	4
	mov	eax, DWORD PTR _target_low_part$1190[ebp]
	push	eax
	push	1
	mov	eax, DWORD PTR _low_pos$1189[ebp]
	push	eax
	mov	eax, DWORD PTR _low_size$1188[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	call	_extract_bit_field
	add	esp, 36					; 00000024H
	mov	DWORD PTR _low_part$1191[ebp], eax
; Line 772
	mov	eax, DWORD PTR _target_low_part$1190[ebp]
	cmp	DWORD PTR _low_part$1191[ebp], eax
	je	$L1198
; Line 773
	mov	eax, DWORD PTR _low_part$1191[ebp]
	push	eax
	mov	eax, DWORD PTR _target_low_part$1190[ebp]
	push	eax
	call	_emit_move_insn
	add	esp, 8
; Line 776
$L1198:
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	push	4
	call	_gen_highpart
	add	esp, 8
	mov	DWORD PTR _target_high_part$1194[ebp], eax
; Line 779
	mov	eax, DWORD PTR _total_size$[ebp]
	push	eax
	mov	eax, DWORD PTR _align$[ebp]
	push	eax
	push	4
	push	4
	mov	eax, DWORD PTR _target_high_part$1194[ebp]
	push	eax
	mov	eax, DWORD PTR _unsignedp$[ebp]
	push	eax
	mov	eax, DWORD PTR _high_pos$1193[ebp]
	push	eax
	mov	eax, DWORD PTR _high_size$1192[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	call	_extract_bit_field
	add	esp, 36					; 00000024H
	mov	DWORD PTR _high_part$1195[ebp], eax
; Line 780
	mov	eax, DWORD PTR _target_high_part$1194[ebp]
	cmp	DWORD PTR _high_part$1195[ebp], eax
	je	$L1199
; Line 781
	mov	eax, DWORD PTR _high_part$1195[ebp]
	push	eax
	mov	eax, DWORD PTR _target_high_part$1194[ebp]
	push	eax
	call	_emit_move_insn
	add	esp, 8
; Line 783
$L1199:
	mov	eax, DWORD PTR _target$[ebp]
	jmp	$L1162
; Line 794
$L1187:
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1201
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1200
$L1201:
; Line 798
	cmp	DWORD PTR _offset$[ebp], 0
	jne	$L1203
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	ecx, DWORD PTR _mode_size+16
	cmp	DWORD PTR _mode_size[eax], ecx
	jle	$L1202
$L1203:
; Line 800
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1204
; Line 801
	mov	eax, DWORD PTR _offset$[ebp]
	mov	ecx, DWORD PTR _op0$[ebp]
	add	DWORD PTR [ecx+8], eax
; Line 802
	jmp	$L1205
$L1204:
; Line 803
	mov	eax, DWORD PTR _offset$[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	push	4
	push	35					; 00000023H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	DWORD PTR _op0$[ebp], eax
$L1205:
; Line 805
$L1202:
	mov	DWORD PTR _offset$[ebp], 0
; Line 807
	jmp	$L1206
$L1200:
; Line 809
	push	1
	mov	eax, DWORD PTR _str_rtx$[ebp]
	push	eax
	call	_protect_from_queue
	add	esp, 8
	mov	DWORD PTR _op0$[ebp], eax
; Line 810
$L1206:
; Line 814
	cmp	DWORD PTR _unsignedp$[ebp], 0
	je	$L1207
; Line 953
	mov	eax, DWORD PTR _align$[ebp]
	push	eax
	push	1
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	mov	eax, DWORD PTR _bitpos$[ebp]
	push	eax
	mov	eax, DWORD PTR _bitsize$[ebp]
	push	eax
	mov	eax, DWORD PTR _offset$[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _tmode$[ebp]
	push	eax
	call	_extract_fixed_bit_field
	add	esp, 32					; 00000020H
	mov	DWORD PTR _target$[ebp], eax
; Line 955
	jmp	$L1208
$L1207:
; Line 1087
	mov	eax, DWORD PTR _align$[ebp]
	push	eax
	push	0
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	mov	eax, DWORD PTR _bitpos$[ebp]
	push	eax
	mov	eax, DWORD PTR _bitsize$[ebp]
	push	eax
	mov	eax, DWORD PTR _offset$[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _tmode$[ebp]
	push	eax
	call	_extract_fixed_bit_field
	add	esp, 32					; 00000020H
	mov	DWORD PTR _target$[ebp], eax
; Line 1088
$L1208:
; Line 1089
	mov	eax, DWORD PTR _spec_target$[ebp]
	cmp	DWORD PTR _target$[ebp], eax
	jne	$L1209
; Line 1090
	mov	eax, DWORD PTR _target$[ebp]
	jmp	$L1162
; Line 1091
$L1209:
	mov	eax, DWORD PTR _spec_target_subreg$[ebp]
	cmp	DWORD PTR _target$[ebp], eax
	jne	$L1210
; Line 1092
	mov	eax, DWORD PTR _spec_target$[ebp]
	jmp	$L1162
; Line 1093
$L1210:
	mov	eax, DWORD PTR _target$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	cmp	eax, DWORD PTR _tmode$[ebp]
	je	$L1211
	mov	eax, DWORD PTR _target$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	cmp	eax, DWORD PTR _mode$[ebp]
	je	$L1211
; Line 1094
	mov	eax, DWORD PTR _unsignedp$[ebp]
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	mov	eax, DWORD PTR _tmode$[ebp]
	push	eax
	call	_convert_to_mode
	add	esp, 12					; 0000000cH
	jmp	$L1162
; Line 1095
$L1211:
	mov	eax, DWORD PTR _target$[ebp]
	jmp	$L1162
; Line 1096
$L1162:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_bit_field ENDP
_bitpos$ = 24
_target$ = 28
_unsignedp$ = 32
_align$ = 36
_total_bits$ = -8
_mode$ = -4
_amount$1234 = -16
_subtarget$1235 = -12
_amount$1243 = -24
_subtarget$1244 = -20
_tmode$ = 8
_op0$ = 12
_offset$ = 16
_bitsize$ = 20
_extract_fixed_bit_field PROC NEAR
; Line 1124
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	push	ebx
	push	esi
	push	edi
; Line 1125
	mov	DWORD PTR _total_bits$[ebp], 32		; 00000020H
; Line 1128
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1224
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1223
$L1224:
; Line 1131
	mov	eax, DWORD PTR _bitpos$[ebp]
	add	eax, DWORD PTR _bitsize$[ebp]
	cmp	eax, 32					; 00000020H
	jle	$L1225
; Line 1133
	mov	eax, DWORD PTR _align$[ebp]
	push	eax
	mov	eax, DWORD PTR _unsignedp$[ebp]
	push	eax
	mov	eax, DWORD PTR _bitpos$[ebp]
	push	eax
	mov	eax, DWORD PTR _bitsize$[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	call	_extract_split_bit_field
	add	esp, 20					; 00000014H
	jmp	$L1220
; Line 1134
$L1225:
; Line 1135
	jmp	$L1226
$L1223:
; Line 1138
	mov	eax, DWORD PTR _bitpos$[ebp]
	add	eax, DWORD PTR _bitsize$[ebp]
	cmp	eax, 8
	jg	$L1227
; Line 1142
	mov	DWORD PTR _total_bits$[ebp], 8
; Line 1144
	mov	eax, DWORD PTR _offset$[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_plus_constant
	add	esp, 8
	push	eax
	push	1
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	call	_change_address
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _op0$[ebp], eax
; Line 1146
	jmp	$L1228
$L1227:
; Line 1152
	mov	eax, DWORD PTR _offset$[ebp]
	cdq
	idiv	DWORD PTR _mode_size+8
	lea	eax, DWORD PTR [edx*8]
	add	eax, DWORD PTR _bitpos$[ebp]
	add	eax, DWORD PTR _bitsize$[ebp]
	mov	ecx, DWORD PTR _mode_size+8
	shl	ecx, 3
	cmp	eax, ecx
	jg	$L1229
; Line 1156
	mov	eax, DWORD PTR _mode_size+8
	shl	eax, 3
	mov	DWORD PTR _total_bits$[ebp], eax
; Line 1159
	mov	eax, DWORD PTR _total_bits$[ebp]
	cdq
	and	edx, 7
	add	eax, edx
	sar	eax, 3
	mov	ecx, eax
	mov	eax, DWORD PTR _offset$[ebp]
	cdq
	idiv	ecx
	lea	eax, DWORD PTR [edx*8]
	add	DWORD PTR _bitpos$[ebp], eax
; Line 1160
	sub	ecx, ecx
	mov	eax, DWORD PTR _total_bits$[ebp]
	cdq
	and	edx, 7
	add	eax, edx
	sar	eax, 3
	mov	ebx, eax
	mov	eax, DWORD PTR _offset$[ebp]
	cdq
	idiv	ebx
	sub	ecx, edx
	neg	ecx
	sub	DWORD PTR _offset$[ebp], ecx
; Line 1162
	mov	eax, DWORD PTR _offset$[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_plus_constant
	add	esp, 8
	push	eax
	push	2
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	call	_change_address
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _op0$[ebp], eax
; Line 1164
	jmp	$L1230
$L1229:
; Line 1169
	mov	eax, DWORD PTR _offset$[ebp]
	cdq
	xor	eax, edx
	sub	eax, edx
	and	eax, 3
	xor	eax, edx
	sub	eax, edx
	shl	eax, 3
	add	DWORD PTR _bitpos$[ebp], eax
; Line 1170
	sub	ecx, ecx
	mov	eax, DWORD PTR _offset$[ebp]
	cdq
	xor	eax, edx
	sub	eax, edx
	and	eax, 3
	xor	eax, edx
	sub	eax, edx
	sub	ecx, eax
	neg	ecx
	sub	DWORD PTR _offset$[ebp], ecx
; Line 1172
	mov	eax, DWORD PTR _offset$[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_plus_constant
	add	esp, 8
	push	eax
	push	4
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	call	_change_address
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _op0$[ebp], eax
; Line 1175
	mov	eax, DWORD PTR _bitpos$[ebp]
	add	eax, DWORD PTR _bitsize$[ebp]
	cmp	eax, 32					; 00000020H
	jle	$L1231
; Line 1177
	mov	eax, DWORD PTR _align$[ebp]
	push	eax
	mov	eax, DWORD PTR _unsignedp$[ebp]
	push	eax
	mov	eax, DWORD PTR _bitpos$[ebp]
	push	eax
	mov	eax, DWORD PTR _bitsize$[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	call	_extract_split_bit_field
	add	esp, 20					; 00000014H
	jmp	$L1220
; Line 1178
$L1231:
$L1230:
$L1228:
$L1226:
; Line 1180
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	mov	DWORD PTR _mode$[ebp], eax
; Line 1191
	cmp	DWORD PTR _unsignedp$[ebp], 0
	je	$L1232
; Line 1193
	cmp	DWORD PTR _bitpos$[ebp], 0
	je	$L1233
; Line 1197
	push	0
	mov	eax, DWORD PTR _bitpos$[ebp]
	push	eax
	call	_build_int_2
	add	esp, 8
	mov	DWORD PTR _amount$1234[ebp], eax
; Line 1202
	cmp	DWORD PTR _target$[ebp], 0
	je	$L1425
	mov	eax, DWORD PTR _target$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1425
	mov	eax, DWORD PTR _target$[ebp]
	mov	eax, DWORD PTR [eax]
	shr	eax, 30					; 0000001eH
	test	al, 1
	jne	$L1425
	mov	eax, DWORD PTR _target$[ebp]
	mov	DWORD PTR _subtarget$1235[ebp], eax
	jmp	$L1426
$L1425:
	mov	DWORD PTR _subtarget$1235[ebp], 0
$L1426:
; Line 1203
	mov	eax, DWORD PTR _mode$[ebp]
	cmp	DWORD PTR _tmode$[ebp], eax
	je	$L1236
	mov	DWORD PTR _subtarget$1235[ebp], 0
; Line 1204
$L1236:
	push	1
	mov	eax, DWORD PTR _subtarget$1235[ebp]
	push	eax
	mov	eax, DWORD PTR _amount$1234[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	push	89					; 00000059H
	call	_expand_shift
	add	esp, 24					; 00000018H
	mov	DWORD PTR _op0$[ebp], eax
; Line 1207
$L1233:
	mov	eax, DWORD PTR _mode$[ebp]
	cmp	DWORD PTR _tmode$[ebp], eax
	je	$L1237
; Line 1208
	push	1
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _tmode$[ebp]
	push	eax
	call	_convert_to_mode
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _op0$[ebp], eax
; Line 1213
$L1237:
; Line 1223
	mov	eax, DWORD PTR _mode$[ebp]
	mov	eax, DWORD PTR _mode_size[eax*4]
	shl	eax, 3
	mov	ecx, DWORD PTR _bitpos$[ebp]
	add	ecx, DWORD PTR _bitsize$[ebp]
	cmp	eax, ecx
	je	$L1238
	cmp	DWORD PTR _bitsize$[ebp], 32		; 00000020H
	jge	$L1238
; Line 1226
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	mov	eax, 1
	mov	cl, BYTE PTR _bitsize$[ebp]
	shl	eax, cl
	dec	eax
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	call	_expand_bit_and
	add	esp, 16					; 00000010H
	jmp	$L1220
; Line 1227
$L1238:
	mov	eax, DWORD PTR _op0$[ebp]
	jmp	$L1220
; Line 1232
$L1232:
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_force_reg
	add	esp, 8
	mov	DWORD PTR _op0$[ebp], eax
; Line 1233
	mov	eax, DWORD PTR _mode$[ebp]
	cmp	DWORD PTR _tmode$[ebp], eax
	je	$L1239
; Line 1234
	mov	DWORD PTR _target$[ebp], 0
; Line 1235
$L1239:
; Line 1236
	mov	eax, DWORD PTR _mode$[ebp]
	mov	eax, DWORD PTR _mode_size[eax*4]
	shl	eax, 3
	mov	ecx, DWORD PTR _mode_size+4
	shl	ecx, 3
	cmp	eax, ecx
	jle	$L1240
	mov	eax, DWORD PTR _mode_size+4
	shl	eax, 3
	mov	ecx, DWORD PTR _bitpos$[ebp]
	add	ecx, DWORD PTR _bitsize$[ebp]
	cmp	eax, ecx
	jl	$L1240
; Line 1237
	mov	DWORD PTR _mode$[ebp], 1
	push	0
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	push	1
	call	_convert_to_mode
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _op0$[ebp], eax
; Line 1238
$L1240:
; Line 1239
	mov	eax, DWORD PTR _mode$[ebp]
	mov	eax, DWORD PTR _mode_size[eax*4]
	shl	eax, 3
	mov	ecx, DWORD PTR _mode_size+8
	shl	ecx, 3
	cmp	eax, ecx
	jle	$L1241
	mov	eax, DWORD PTR _mode_size+8
	shl	eax, 3
	mov	ecx, DWORD PTR _bitpos$[ebp]
	add	ecx, DWORD PTR _bitsize$[ebp]
	cmp	eax, ecx
	jl	$L1241
; Line 1240
	mov	DWORD PTR _mode$[ebp], 2
	push	0
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	push	2
	call	_convert_to_mode
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _op0$[ebp], eax
; Line 1241
$L1241:
	mov	eax, DWORD PTR _mode$[ebp]
	mov	eax, DWORD PTR _mode_size[eax*4]
	shl	eax, 3
	mov	ecx, DWORD PTR _bitpos$[ebp]
	add	ecx, DWORD PTR _bitsize$[ebp]
	cmp	eax, ecx
	je	$L1242
; Line 1243
	push	0
	mov	eax, DWORD PTR _mode$[ebp]
	mov	eax, DWORD PTR _mode_size[eax*4]
	shl	eax, 3
	mov	ecx, DWORD PTR _bitpos$[ebp]
	add	ecx, DWORD PTR _bitsize$[ebp]
	sub	eax, ecx
	push	eax
	call	_build_int_2
	add	esp, 8
	mov	DWORD PTR _amount$1243[ebp], eax
; Line 1248
	cmp	DWORD PTR _target$[ebp], 0
	je	$L1427
	mov	eax, DWORD PTR _target$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1427
	mov	eax, DWORD PTR _target$[ebp]
	mov	eax, DWORD PTR [eax]
	shr	eax, 30					; 0000001eH
	test	al, 1
	jne	$L1427
	mov	eax, DWORD PTR _target$[ebp]
	mov	DWORD PTR _subtarget$1244[ebp], eax
	jmp	$L1428
$L1427:
	mov	DWORD PTR _subtarget$1244[ebp], 0
$L1428:
; Line 1249
	push	1
	mov	eax, DWORD PTR _subtarget$1244[ebp]
	push	eax
	mov	eax, DWORD PTR _amount$1243[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	push	88					; 00000058H
	call	_expand_shift
	add	esp, 24					; 00000018H
	mov	DWORD PTR _op0$[ebp], eax
; Line 1252
$L1242:
; Line 1254
	push	0
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	push	0
	mov	eax, DWORD PTR _mode$[ebp]
	mov	eax, DWORD PTR _mode_size[eax*4]
	shl	eax, 3
	sub	eax, DWORD PTR _bitsize$[ebp]
	push	eax
	call	_build_int_2
	add	esp, 8
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	push	89					; 00000059H
	call	_expand_shift
	add	esp, 24					; 00000018H
	jmp	$L1220
; Line 1255
$L1220:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_fixed_bit_field ENDP
_op0$ = 8
_bitsize$ = 12
_bitpos$ = 16
_unsignedp$ = 20
_align$ = 24
_bitsize_1$ = -16
_bitsize_2$ = -12
_part1$ = -8
_part2$ = -4
_result$ = -20
_extract_split_bit_field PROC NEAR
; Line 1268
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	push	ebx
	push	esi
	push	edi
; Line 1270
	mov	eax, 32					; 00000020H
	sub	eax, DWORD PTR _bitpos$[ebp]
	mov	DWORD PTR _bitsize_1$[ebp], eax
; Line 1272
	mov	eax, DWORD PTR _bitsize$[ebp]
	sub	eax, DWORD PTR _bitsize_1$[ebp]
	mov	DWORD PTR _bitsize_2$[ebp], eax
; Line 1277
	mov	eax, DWORD PTR _align$[ebp]
	push	eax
	push	1
	push	0
	mov	eax, DWORD PTR _bitpos$[ebp]
	push	eax
	mov	eax, DWORD PTR _bitsize_1$[ebp]
	push	eax
	push	0
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	push	4
	call	_extract_fixed_bit_field
	add	esp, 32					; 00000020H
	mov	DWORD PTR _part1$[ebp], eax
; Line 1280
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1256
; Line 1282
	push	4
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_plus_constant
	add	esp, 8
	push	eax
	push	4
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	call	_change_address
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _op0$[ebp], eax
; Line 1283
	jmp	$L1257
$L1256:
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1258
; Line 1284
	push	1
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	push	4
	push	35					; 00000023H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	DWORD PTR _op0$[ebp], eax
; Line 1285
	jmp	$L1259
$L1258:
; Line 1286
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax+8]
	inc	eax
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	4
	push	35					; 00000023H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	DWORD PTR _op0$[ebp], eax
$L1259:
$L1257:
; Line 1289
	mov	eax, DWORD PTR _align$[ebp]
	push	eax
	push	1
	push	0
	push	0
	mov	eax, DWORD PTR _bitsize_2$[ebp]
	push	eax
	push	0
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	push	4
	call	_extract_fixed_bit_field
	add	esp, 32					; 00000020H
	mov	DWORD PTR _part2$[ebp], eax
; Line 1297
	push	1
	push	0
	push	0
	mov	eax, DWORD PTR _bitsize_1$[ebp]
	push	eax
	call	_build_int_2
	add	esp, 8
	push	eax
	mov	eax, DWORD PTR _part2$[ebp]
	push	eax
	push	4
	push	88					; 00000058H
	call	_expand_shift
	add	esp, 24					; 00000018H
	mov	DWORD PTR _part2$[ebp], eax
; Line 1303
	push	3
	push	1
	push	0
	mov	eax, DWORD PTR _part2$[ebp]
	push	eax
	mov	eax, DWORD PTR _part1$[ebp]
	push	eax
	mov	eax, DWORD PTR _ior_optab
	push	eax
	push	4
	call	_expand_binop
	add	esp, 28					; 0000001cH
	mov	DWORD PTR _result$[ebp], eax
; Line 1306
	cmp	DWORD PTR _unsignedp$[ebp], 0
	je	$L1260
; Line 1307
	mov	eax, DWORD PTR _result$[ebp]
	jmp	$L1250
; Line 1309
$L1260:
; Line 1310
	push	0
	push	0
	push	0
	mov	eax, 32					; 00000020H
	sub	eax, DWORD PTR _bitsize$[ebp]
	push	eax
	call	_build_int_2
	add	esp, 8
	push	eax
	mov	eax, DWORD PTR _result$[ebp]
	push	eax
	push	4
	push	88					; 00000058H
	call	_expand_shift
	add	esp, 24					; 00000018H
	mov	DWORD PTR _result$[ebp], eax
; Line 1312
	push	0
	push	0
	push	0
	mov	eax, 32					; 00000020H
	sub	eax, DWORD PTR _bitsize$[ebp]
	push	eax
	call	_build_int_2
	add	esp, 8
	push	eax
	mov	eax, DWORD PTR _result$[ebp]
	push	eax
	push	4
	push	89					; 00000059H
	call	_expand_shift
	add	esp, 24					; 00000018H
	jmp	$L1250
; Line 1313
$L1250:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_split_bit_field ENDP
_TEXT	ENDS
PUBLIC	_expand_inc
EXTRN	_add_optab:DWORD
_TEXT	SEGMENT
_target$ = 8
_inc$ = 12
_value$ = -4
_expand_inc PROC NEAR
; Line 1320
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 1323
	push	3
	push	0
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	mov	eax, DWORD PTR _inc$[ebp]
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	mov	eax, DWORD PTR _add_optab
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	call	_expand_binop
	add	esp, 28					; 0000001cH
	mov	DWORD PTR _value$[ebp], eax
; Line 1324
	mov	eax, DWORD PTR _value$[ebp]
	cmp	DWORD PTR _target$[ebp], eax
	je	$L1266
; Line 1325
	mov	eax, DWORD PTR _value$[ebp]
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	call	_emit_move_insn
	add	esp, 8
; Line 1326
$L1266:
$L1264:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_expand_inc ENDP
_TEXT	ENDS
PUBLIC	_expand_dec
EXTRN	_sub_optab:DWORD
_TEXT	SEGMENT
_target$ = 8
_dec$ = 12
_value$ = -4
_expand_dec PROC NEAR
; Line 1333
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 1336
	push	3
	push	0
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	mov	eax, DWORD PTR _dec$[ebp]
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	mov	eax, DWORD PTR _sub_optab
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	call	_expand_binop
	add	esp, 28					; 0000001cH
	mov	DWORD PTR _value$[ebp], eax
; Line 1337
	mov	eax, DWORD PTR _target$[ebp]
	cmp	DWORD PTR _value$[ebp], eax
	je	$L1272
; Line 1338
	mov	eax, DWORD PTR _value$[ebp]
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	call	_emit_move_insn
	add	esp, 8
; Line 1339
$L1272:
$L1270:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_expand_dec ENDP
_TEXT	ENDS
EXTRN	_delete_insns_since:NEAR
EXTRN	_get_last_insn:NEAR
EXTRN	_expand_expr:NEAR
EXTRN	_ashl_optab:DWORD
EXTRN	_ashr_optab:DWORD
EXTRN	_lshl_optab:DWORD
EXTRN	_lshr_optab:DWORD
EXTRN	_rotl_optab:DWORD
EXTRN	_rotr_optab:DWORD
_TEXT	SEGMENT
_op1$ = -8
_temp$ = -24
_left$ = -16
_try$ = -4
_rotate$ = -20
_last$ = -12
_methods$1289 = -28
_methods1$1303 = -32
_code$ = 8
_mode$ = 12
_shifted$ = 16
_amount$ = 20
_target$ = 24
_unsignedp$ = 28
_expand_shift PROC NEAR
; Line 1361
	push	ebp
	mov	ebp, esp
	sub	esp, 44					; 0000002cH
	push	ebx
	push	esi
	push	edi
; Line 1362
	mov	DWORD PTR _temp$[ebp], 0
; Line 1363
	cmp	DWORD PTR _code$[ebp], 88		; 00000058H
	je	$L1431
	cmp	DWORD PTR _code$[ebp], 90		; 0000005aH
	jne	$L1429
$L1431:
	mov	DWORD PTR _left$[ebp], 1
	jmp	$L1430
$L1429:
	mov	DWORD PTR _left$[ebp], 0
$L1430:
; Line 1365
	cmp	DWORD PTR _code$[ebp], 90		; 0000005aH
	je	$L1434
	cmp	DWORD PTR _code$[ebp], 91		; 0000005bH
	jne	$L1432
$L1434:
	mov	DWORD PTR _rotate$[ebp], 1
	jmp	$L1433
$L1432:
	mov	DWORD PTR _rotate$[ebp], 0
$L1433:
; Line 1372
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _amount$[ebp]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	mov	DWORD PTR _op1$[ebp], eax
; Line 1374
	call	_get_last_insn
	mov	DWORD PTR _last$[ebp], eax
; Line 1376
	mov	DWORD PTR _try$[ebp], 0
	jmp	$L1286
$L1287:
	inc	DWORD PTR _try$[ebp]
$L1286:
	cmp	DWORD PTR _temp$[ebp], 0
	jne	$L1288
	cmp	DWORD PTR _try$[ebp], 3
	jge	$L1288
; Line 1379
	mov	eax, DWORD PTR _last$[ebp]
	push	eax
	call	_delete_insns_since
	add	esp, 4
; Line 1381
	cmp	DWORD PTR _try$[ebp], 0
	jne	$L1291
; Line 1382
	mov	DWORD PTR _methods$1289[ebp], 0
; Line 1383
	jmp	$L1292
$L1291:
	cmp	DWORD PTR _try$[ebp], 1
	jne	$L1293
; Line 1384
	mov	DWORD PTR _methods$1289[ebp], 2
; Line 1385
	jmp	$L1294
$L1293:
; Line 1386
	mov	DWORD PTR _methods$1289[ebp], 3
$L1294:
$L1292:
; Line 1388
	cmp	DWORD PTR _rotate$[ebp], 0
	je	$L1295
; Line 1391
	cmp	DWORD PTR _methods$1289[ebp], 0
	je	$L1296
; Line 1392
	mov	DWORD PTR _methods$1289[ebp], 1
; Line 1394
$L1296:
; Line 1396
	cmp	DWORD PTR _left$[ebp], 0
	je	$L1435
	mov	eax, DWORD PTR _rotl_optab
	mov	DWORD PTR -36+[ebp], eax
	jmp	$L1436
$L1435:
	mov	eax, DWORD PTR _rotr_optab
	mov	DWORD PTR -36+[ebp], eax
$L1436:
	mov	eax, DWORD PTR _methods$1289[ebp]
	push	eax
	push	-1
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	mov	eax, DWORD PTR _shifted$[ebp]
	push	eax
	mov	eax, DWORD PTR -36+[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_expand_binop
	add	esp, 28					; 0000001cH
	mov	DWORD PTR _temp$[ebp], eax
; Line 1398
	jmp	$L1297
$L1295:
	cmp	DWORD PTR _unsignedp$[ebp], 0
	je	$L1298
; Line 1402
	cmp	DWORD PTR _left$[ebp], 0
	je	$L1437
	mov	eax, DWORD PTR _lshl_optab
	mov	DWORD PTR -40+[ebp], eax
	jmp	$L1438
$L1437:
	mov	eax, DWORD PTR _lshr_optab
	mov	DWORD PTR -40+[ebp], eax
$L1438:
	mov	eax, DWORD PTR _methods$1289[ebp]
	push	eax
	mov	eax, DWORD PTR _unsignedp$[ebp]
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	mov	eax, DWORD PTR _shifted$[ebp]
	push	eax
	mov	eax, DWORD PTR -40+[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_expand_binop
	add	esp, 28					; 0000001cH
	mov	DWORD PTR _temp$[ebp], eax
; Line 1403
	cmp	DWORD PTR _temp$[ebp], 0
	jne	$L1299
	cmp	DWORD PTR _left$[ebp], 0
	je	$L1299
; Line 1405
	mov	eax, DWORD PTR _methods$1289[ebp]
	push	eax
	mov	eax, DWORD PTR _unsignedp$[ebp]
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	mov	eax, DWORD PTR _shifted$[ebp]
	push	eax
	mov	eax, DWORD PTR _ashl_optab
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_expand_binop
	add	esp, 28					; 0000001cH
	mov	DWORD PTR _temp$[ebp], eax
; Line 1406
$L1299:
	cmp	DWORD PTR _temp$[ebp], 0
	je	$L1300
; Line 1407
	mov	eax, DWORD PTR _temp$[ebp]
	jmp	$L1279
; Line 1408
$L1300:
; Line 1412
$L1298:
$L1297:
	cmp	DWORD PTR _rotate$[ebp], 0
	jne	$L1301
	cmp	DWORD PTR _unsignedp$[ebp], 0
	je	$L1302
	cmp	DWORD PTR _left$[ebp], 0
	jne	$L1301
	cmp	DWORD PTR _methods$1289[ebp], 2
	jne	$L1301
$L1302:
; Line 1414
	mov	eax, DWORD PTR _methods$1289[ebp]
	mov	DWORD PTR _methods1$1303[ebp], eax
; Line 1418
	cmp	DWORD PTR _unsignedp$[ebp], 0
	je	$L1304
; Line 1419
	mov	DWORD PTR _methods1$1303[ebp], 4
; Line 1423
$L1304:
; Line 1425
	cmp	DWORD PTR _left$[ebp], 0
	je	$L1439
	mov	eax, DWORD PTR _ashl_optab
	mov	DWORD PTR -44+[ebp], eax
	jmp	$L1440
$L1439:
	mov	eax, DWORD PTR _ashr_optab
	mov	DWORD PTR -44+[ebp], eax
$L1440:
	mov	eax, DWORD PTR _methods1$1303[ebp]
	push	eax
	mov	eax, DWORD PTR _unsignedp$[ebp]
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	mov	eax, DWORD PTR _shifted$[ebp]
	push	eax
	mov	eax, DWORD PTR -44+[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_expand_binop
	add	esp, 28					; 0000001cH
	mov	DWORD PTR _temp$[ebp], eax
; Line 1426
	cmp	DWORD PTR _temp$[ebp], 0
	je	$L1305
; Line 1427
	mov	eax, DWORD PTR _temp$[ebp]
	jmp	$L1279
; Line 1428
$L1305:
; Line 1430
$L1301:
	cmp	DWORD PTR _unsignedp$[ebp], 0
	je	$L1306
; Line 1495
$L1306:
	jmp	$L1287
$L1288:
; Line 1496
	cmp	DWORD PTR _temp$[ebp], 0
	jne	$L1307
; Line 1497
	call	_abort
; Line 1498
$L1307:
	mov	eax, DWORD PTR _temp$[ebp]
	jmp	$L1279
; Line 1499
$L1279:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_expand_shift ENDP
_TEXT	ENDS
EXTRN	_and_optab:DWORD
_TEXT	SEGMENT
_mode$ = 8
_op0$ = 12
_op1$ = 16
_target$ = 20
_temp$ = -4
_expand_bit_and PROC NEAR
; Line 1510
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 1514
	push	3
	push	1
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _and_optab
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_expand_binop
	add	esp, 28					; 0000001cH
	mov	DWORD PTR _temp$[ebp], eax
; Line 1515
	cmp	DWORD PTR _temp$[ebp], 0
	jne	$L1314
; Line 1516
	call	_abort
; Line 1517
$L1314:
	mov	eax, DWORD PTR _temp$[ebp]
	jmp	$L1312
; Line 1518
$L1312:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_expand_bit_and ENDP
_TEXT	ENDS
PUBLIC	_expand_mult
EXTRN	_force_operand:NEAR
EXTRN	_smul_optab:DWORD
EXTRN	_exact_log2:NEAR
EXTRN	_floor_log2:NEAR
_TEXT	SEGMENT
_mode$ = 8
_op0$ = 12
_op1$ = 16
_target$ = 20
_unsignedp$ = 24
_foo$1323 = -8
_bar$1324 = -16
_negate$1325 = -12
_absval$1326 = -4
_tem$1329 = -20
_tem$1334 = -24
_expand_mult PROC NEAR
; Line 1533
	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H
	push	ebx
	push	esi
	push	edi
; Line 1537
	cmp	DWORD PTR _target$[ebp], 0
	je	$L1321
	mov	eax, DWORD PTR _target$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1321
	mov	eax, DWORD PTR _target$[ebp]
	mov	eax, DWORD PTR [eax]
	shr	eax, 30					; 0000001eH
	test	al, 1
	je	$L1321
; Line 1538
	mov	DWORD PTR _target$[ebp], 0
; Line 1540
$L1321:
	mov	eax, DWORD PTR _op1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1322
; Line 1544
	mov	eax, DWORD PTR _op1$[ebp]
	cmp	DWORD PTR [eax+4], 0
	mov	eax, 0
	setl	al
	mov	DWORD PTR _negate$1325[ebp], eax
; Line 1545
	mov	eax, DWORD PTR _op1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR _negate$1325[ebp], 1
	sbb	ecx, ecx
	and	ecx, 2
	dec	ecx
	imul	eax, ecx
	mov	DWORD PTR _absval$1326[ebp], eax
; Line 1548
	mov	eax, DWORD PTR _absval$1326[ebp]
	push	eax
	call	_exact_log2
	add	esp, 4
	mov	DWORD PTR _foo$1323[ebp], eax
; Line 1549
	cmp	DWORD PTR _foo$1323[ebp], 0
	jl	$L1328
; Line 1552
	jne	$L1330
; Line 1553
	mov	eax, DWORD PTR _op0$[ebp]
	mov	DWORD PTR _tem$1329[ebp], eax
; Line 1554
	jmp	$L1331
$L1330:
; Line 1557
	push	0
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	push	0
	mov	eax, DWORD PTR _foo$1323[ebp]
	push	eax
	call	_build_int_2
	add	esp, 8
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	push	88					; 00000058H
	call	_expand_shift
	add	esp, 24					; 00000018H
	mov	DWORD PTR _tem$1329[ebp], eax
$L1331:
; Line 1560
	cmp	DWORD PTR _negate$1325[ebp], 0
	je	$L1441
	push	0
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	mov	eax, DWORD PTR _tem$1329[ebp]
	push	eax
	mov	eax, DWORD PTR _neg_optab
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_expand_unop
	add	esp, 20					; 00000014H
	jmp	$L1442
$L1441:
	mov	eax, DWORD PTR _tem$1329[ebp]
$L1442:
	jmp	$L1320
; Line 1563
$L1328:
	mov	eax, DWORD PTR _absval$1326[ebp]
	push	eax
	call	_floor_log2
	add	esp, 4
	mov	DWORD PTR _bar$1324[ebp], eax
; Line 1564
	mov	eax, DWORD PTR _absval$1326[ebp]
	mov	edx, 1
	mov	cl, BYTE PTR _bar$1324[ebp]
	shl	edx, cl
	sub	eax, edx
	push	eax
	call	_exact_log2
	add	esp, 4
	mov	DWORD PTR _foo$1323[ebp], eax
; Line 1565
	cmp	DWORD PTR _bar$1324[ebp], 0
	jl	$L1333
	cmp	DWORD PTR _foo$1323[ebp], 0
	jl	$L1333
; Line 1573
	jne	$L1443
	cmp	DWORD PTR _negate$1325[ebp], 0
	jne	$L1443
	mov	eax, DWORD PTR _target$[ebp]
	mov	DWORD PTR -28+[ebp], eax
	jmp	$L1444
$L1443:
	mov	DWORD PTR -28+[ebp], 0
$L1444:
	mov	eax, DWORD PTR -28+[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _bar$1324[ebp]
	sub	eax, DWORD PTR _foo$1323[ebp]
	push	eax
	call	_build_int_2
	add	esp, 8
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	push	88					; 00000058H
	call	_expand_shift
	add	esp, 24					; 00000018H
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	push	44					; 0000002cH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	call	_force_operand
	add	esp, 8
	mov	DWORD PTR _tem$1334[ebp], eax
; Line 1575
	cmp	DWORD PTR _foo$1323[ebp], 0
	je	$L1335
; Line 1578
	cmp	DWORD PTR _negate$1325[ebp], 0
	je	$L1445
	mov	DWORD PTR -32+[ebp], 0
	jmp	$L1446
$L1445:
	mov	eax, DWORD PTR _target$[ebp]
	mov	DWORD PTR -32+[ebp], eax
$L1446:
	push	0
	mov	eax, DWORD PTR -32+[ebp]
	push	eax
	push	0
	mov	eax, DWORD PTR _foo$1323[ebp]
	push	eax
	call	_build_int_2
	add	esp, 8
	push	eax
	mov	eax, DWORD PTR _tem$1334[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	push	88					; 00000058H
	call	_expand_shift
	add	esp, 24					; 00000018H
	mov	DWORD PTR _tem$1334[ebp], eax
; Line 1580
$L1335:
	cmp	DWORD PTR _negate$1325[ebp], 0
	je	$L1447
	push	0
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	mov	eax, DWORD PTR _tem$1334[ebp]
	push	eax
	mov	eax, DWORD PTR _neg_optab
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_expand_unop
	add	esp, 20					; 00000014H
	jmp	$L1448
$L1447:
	mov	eax, DWORD PTR _tem$1334[ebp]
$L1448:
	jmp	$L1320
; Line 1582
$L1333:
; Line 1586
$L1322:
; Line 1587
	push	3
	mov	eax, DWORD PTR _unsignedp$[ebp]
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _smul_optab
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_expand_binop
	add	esp, 28					; 0000001cH
	mov	DWORD PTR _op0$[ebp], eax
; Line 1588
	cmp	DWORD PTR _op0$[ebp], 0
	jne	$L1336
; Line 1589
	call	_abort
; Line 1590
$L1336:
	mov	eax, DWORD PTR _op0$[ebp]
	jmp	$L1320
; Line 1591
$L1320:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_expand_mult ENDP
_TEXT	ENDS
PUBLIC	_expand_divmod
EXTRN	_reg_mentioned_p:NEAR
EXTRN	_sign_expand_binop:NEAR
EXTRN	_const0_rtx:DWORD
EXTRN	_const1_rtx:DWORD
EXTRN	_integer_one_node:DWORD
EXTRN	_gen_bge:NEAR
EXTRN	_emit_cmp_insn:NEAR
EXTRN	_gen_ble:NEAR
EXTRN	_gen_label_rtx:NEAR
EXTRN	_copy_to_suggested_reg:NEAR
EXTRN	_sdiv_optab:DWORD
EXTRN	_sdivmod_optab:DWORD
EXTRN	_udiv_optab:DWORD
EXTRN	_udivmod_optab:DWORD
EXTRN	_smod_optab:DWORD
EXTRN	_umod_optab:DWORD
EXTRN	_expand_twoval_binop:NEAR
EXTRN	_emit_jump_insn:NEAR
EXTRN	_emit_label:NEAR
_TEXT	SEGMENT
_temp$ = -20
_log$ = -8
_can_clobber_op0$ = -16
_mod_insn_no_good$ = -4
_adjusted_op0$ = -12
_label$1365 = -24
_label$1369 = -28
_label$1374 = -32
_label$1382 = -36
_rem_flag$ = 8
_code$ = 12
_mode$ = 16
_op0$ = 20
_op1$ = 24
_target$ = 28
_unsignedp$ = 32
_expand_divmod PROC NEAR
; Line 1617
	push	ebp
	mov	ebp, esp
	sub	esp, 48					; 00000030H
	push	ebx
	push	esi
	push	edi
; Line 1619
	mov	DWORD PTR _log$[ebp], -1
; Line 1621
	mov	DWORD PTR _mod_insn_no_good$[ebp], 0
; Line 1622
	mov	eax, DWORD PTR _op0$[ebp]
	mov	DWORD PTR _adjusted_op0$[ebp], eax
; Line 1627
	cmp	DWORD PTR _target$[ebp], 0
	je	$L1350
	mov	eax, DWORD PTR _target$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1350
	mov	eax, DWORD PTR _target$[ebp]
	mov	eax, DWORD PTR [eax]
	shr	eax, 30					; 0000001eH
	test	al, 1
	je	$L1350
; Line 1628
	mov	DWORD PTR _target$[ebp], 0
; Line 1631
$L1350:
	cmp	DWORD PTR _target$[ebp], 0
	je	$L1351
; Line 1635
	cmp	DWORD PTR _rem_flag$[ebp], 0
	je	$L1355
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	call	_reg_mentioned_p
	add	esp, 8
	or	eax, eax
	jne	$L1354
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1356
	mov	eax, DWORD PTR _target$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1354
$L1356:
$L1355:
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	call	_reg_mentioned_p
	add	esp, 8
	or	eax, eax
	jne	$L1354
	mov	eax, DWORD PTR _op1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1353
	mov	eax, DWORD PTR _target$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1353
$L1354:
; Line 1636
	mov	DWORD PTR _target$[ebp], 0
; Line 1638
$L1353:
$L1351:
	cmp	DWORD PTR _target$[ebp], 0
	jne	$L1357
; Line 1639
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_gen_reg_rtx
	add	esp, 4
	mov	DWORD PTR _target$[ebp], eax
; Line 1641
$L1357:
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1449
	mov	eax, DWORD PTR _op0$[ebp]
	cmp	DWORD PTR _target$[ebp], eax
	jne	$L1449
	mov	DWORD PTR _can_clobber_op0$[ebp], 1
	jmp	$L1450
$L1449:
	mov	DWORD PTR _can_clobber_op0$[ebp], 0
$L1450:
; Line 1643
	mov	eax, DWORD PTR _op1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1358
; Line 1644
	mov	eax, DWORD PTR _op1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_exact_log2
	add	esp, 4
	mov	DWORD PTR _log$[ebp], eax
; Line 1655
$L1358:
	mov	eax, DWORD PTR _code$[ebp]
	mov	DWORD PTR -48+[ebp], eax
	jmp	$L1359
; Line 1657
$L1363:
; Line 1659
	cmp	DWORD PTR _log$[ebp], 0
	jl	$L1364
	cmp	DWORD PTR _unsignedp$[ebp], 0
	jne	$L1364
; Line 1661
	call	_gen_label_rtx
	mov	DWORD PTR _label$1365[ebp], eax
; Line 1662
	cmp	DWORD PTR _can_clobber_op0$[ebp], 0
	jne	$L1366
; Line 1664
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	mov	eax, DWORD PTR _adjusted_op0$[ebp]
	push	eax
	call	_copy_to_suggested_reg
	add	esp, 8
	mov	DWORD PTR _adjusted_op0$[ebp], eax
; Line 1667
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_force_reg
	add	esp, 8
	mov	DWORD PTR _op0$[ebp], eax
; Line 1669
$L1366:
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _const0_rtx
	push	eax
	mov	eax, DWORD PTR _adjusted_op0$[ebp]
	push	eax
	call	_emit_cmp_insn
	add	esp, 20					; 00000014H
; Line 1670
	mov	eax, DWORD PTR _label$1365[ebp]
	push	eax
	call	_gen_bge
	add	esp, 4
	push	eax
	call	_emit_jump_insn
	add	esp, 4
; Line 1671
	push	-1
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	call	_plus_constant
	add	esp, 8
	push	eax
	mov	eax, DWORD PTR _adjusted_op0$[ebp]
	push	eax
	call	_expand_inc
	add	esp, 8
; Line 1672
	mov	eax, DWORD PTR _label$1365[ebp]
	push	eax
	call	_emit_label
	add	esp, 4
; Line 1673
	mov	DWORD PTR _mod_insn_no_good$[ebp], 1
; Line 1675
$L1364:
	jmp	$L1360
; Line 1677
$L1367:
; Line 1679
	cmp	DWORD PTR _log$[ebp], 0
	jge	$L1368
	cmp	DWORD PTR _unsignedp$[ebp], 0
	jne	$L1368
; Line 1681
	call	_gen_label_rtx
	mov	DWORD PTR _label$1369[ebp], eax
; Line 1682
	cmp	DWORD PTR _can_clobber_op0$[ebp], 0
	jne	$L1370
; Line 1684
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	mov	eax, DWORD PTR _adjusted_op0$[ebp]
	push	eax
	call	_copy_to_suggested_reg
	add	esp, 8
	mov	DWORD PTR _adjusted_op0$[ebp], eax
; Line 1685
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_force_reg
	add	esp, 8
	mov	DWORD PTR _op0$[ebp], eax
; Line 1687
$L1370:
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _const0_rtx
	push	eax
	mov	eax, DWORD PTR _adjusted_op0$[ebp]
	push	eax
	call	_emit_cmp_insn
	add	esp, 20					; 00000014H
; Line 1688
	mov	eax, DWORD PTR _label$1369[ebp]
	push	eax
	call	_gen_bge
	add	esp, 4
	push	eax
	call	_emit_jump_insn
	add	esp, 4
; Line 1689
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	mov	eax, DWORD PTR _adjusted_op0$[ebp]
	push	eax
	call	_expand_dec
	add	esp, 8
; Line 1690
	mov	eax, DWORD PTR _const1_rtx
	push	eax
	mov	eax, DWORD PTR _adjusted_op0$[ebp]
	push	eax
	call	_expand_inc
	add	esp, 8
; Line 1691
	mov	eax, DWORD PTR _label$1369[ebp]
	push	eax
	call	_emit_label
	add	esp, 4
; Line 1692
	mov	DWORD PTR _mod_insn_no_good$[ebp], 1
; Line 1694
$L1368:
	jmp	$L1360
; Line 1696
$L1371:
; Line 1698
	cmp	DWORD PTR _can_clobber_op0$[ebp], 0
	jne	$L1372
; Line 1700
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	mov	eax, DWORD PTR _adjusted_op0$[ebp]
	push	eax
	call	_copy_to_suggested_reg
	add	esp, 8
	mov	DWORD PTR _adjusted_op0$[ebp], eax
; Line 1701
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_force_reg
	add	esp, 8
	mov	DWORD PTR _op0$[ebp], eax
; Line 1703
$L1372:
	cmp	DWORD PTR _log$[ebp], 0
	jge	$L1373
; Line 1705
	mov	DWORD PTR _label$1374[ebp], 0
; Line 1706
	cmp	DWORD PTR _unsignedp$[ebp], 0
	jne	$L1375
; Line 1708
	call	_gen_label_rtx
	mov	DWORD PTR _label$1374[ebp], eax
; Line 1709
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _const0_rtx
	push	eax
	mov	eax, DWORD PTR _adjusted_op0$[ebp]
	push	eax
	call	_emit_cmp_insn
	add	esp, 20					; 00000014H
; Line 1710
	mov	eax, DWORD PTR _label$1374[ebp]
	push	eax
	call	_gen_ble
	add	esp, 4
	push	eax
	call	_emit_jump_insn
	add	esp, 4
; Line 1712
$L1375:
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	mov	eax, DWORD PTR _adjusted_op0$[ebp]
	push	eax
	call	_expand_inc
	add	esp, 8
; Line 1713
	mov	eax, DWORD PTR _const1_rtx
	push	eax
	mov	eax, DWORD PTR _adjusted_op0$[ebp]
	push	eax
	call	_expand_dec
	add	esp, 8
; Line 1714
	cmp	DWORD PTR _unsignedp$[ebp], 0
	jne	$L1376
; Line 1715
	mov	eax, DWORD PTR _label$1374[ebp]
	push	eax
	call	_emit_label
	add	esp, 4
; Line 1716
$L1376:
; Line 1717
	jmp	$L1377
$L1373:
; Line 1721
	push	3
	push	0
	push	0
	push	-1
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	call	_plus_constant
	add	esp, 8
	push	eax
	mov	eax, DWORD PTR _adjusted_op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _add_optab
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	call	_expand_binop
	add	esp, 28					; 0000001cH
	mov	DWORD PTR _adjusted_op0$[ebp], eax
; Line 1722
$L1377:
; Line 1723
	mov	DWORD PTR _mod_insn_no_good$[ebp], 1
; Line 1724
	jmp	$L1360
; Line 1726
$L1378:
; Line 1728
	cmp	DWORD PTR _can_clobber_op0$[ebp], 0
	jne	$L1379
; Line 1730
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	mov	eax, DWORD PTR _adjusted_op0$[ebp]
	push	eax
	call	_copy_to_suggested_reg
	add	esp, 8
	mov	DWORD PTR _adjusted_op0$[ebp], eax
; Line 1731
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_force_reg
	add	esp, 8
	mov	DWORD PTR _op0$[ebp], eax
; Line 1733
$L1379:
	cmp	DWORD PTR _log$[ebp], 0
	jge	$L1380
; Line 1735
	push	0
	push	0
	mov	eax, DWORD PTR _integer_one_node
	push	eax
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	push	89					; 00000059H
	call	_expand_shift
	add	esp, 24					; 00000018H
	mov	DWORD PTR _op1$[ebp], eax
; Line 1736
	cmp	DWORD PTR _unsignedp$[ebp], 0
	jne	$L1381
; Line 1738
	call	_gen_label_rtx
	mov	DWORD PTR _label$1382[ebp], eax
; Line 1739
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _const0_rtx
	push	eax
	mov	eax, DWORD PTR _adjusted_op0$[ebp]
	push	eax
	call	_emit_cmp_insn
	add	esp, 20					; 00000014H
; Line 1740
	mov	eax, DWORD PTR _label$1382[ebp]
	push	eax
	call	_gen_bge
	add	esp, 4
	push	eax
	call	_emit_jump_insn
	add	esp, 4
; Line 1741
	push	0
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	mov	eax, DWORD PTR _neg_optab
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_expand_unop
	add	esp, 20					; 00000014H
; Line 1742
	mov	eax, DWORD PTR _label$1382[ebp]
	push	eax
	call	_emit_label
	add	esp, 4
; Line 1744
$L1381:
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	mov	eax, DWORD PTR _adjusted_op0$[ebp]
	push	eax
	call	_expand_inc
	add	esp, 8
; Line 1746
	jmp	$L1383
$L1380:
; Line 1748
	mov	eax, DWORD PTR _op1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	cdq
	sub	eax, edx
	sar	eax, 1
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _op1$[ebp], eax
; Line 1749
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	mov	eax, DWORD PTR _adjusted_op0$[ebp]
	push	eax
	call	_expand_inc
	add	esp, 8
; Line 1750
$L1383:
; Line 1751
	mov	DWORD PTR _mod_insn_no_good$[ebp], 1
; Line 1752
	jmp	$L1360
; Line 1753
	jmp	$L1360
$L1359:
	sub	DWORD PTR -48+[ebp], 67			; 00000043H
	cmp	DWORD PTR -48+[ebp], 7
	ja	$L1360
	shl	DWORD PTR -48+[ebp], 2
	mov	eax, DWORD PTR -48+[ebp]
	jmp	DWORD PTR $L1455[eax]
$L1455:
	DD	OFFSET $L1363
	DD	OFFSET $L1371
	DD	OFFSET $L1367
	DD	OFFSET $L1378
	DD	OFFSET $L1363
	DD	OFFSET $L1371
	DD	OFFSET $L1367
	DD	OFFSET $L1378
$L1360:
; Line 1755
	cmp	DWORD PTR _rem_flag$[ebp], 0
	je	$L1384
	cmp	DWORD PTR _mod_insn_no_good$[ebp], 0
	jne	$L1384
; Line 1758
	cmp	DWORD PTR _log$[ebp], 0
	jl	$L1385
; Line 1763
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	mov	eax, DWORD PTR _op1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	dec	eax
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _adjusted_op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_expand_bit_and
	add	esp, 16					; 00000010H
	jmp	$L1344
; Line 1765
	jmp	$L1386
$L1385:
; Line 1770
	push	2
	mov	eax, DWORD PTR _unsignedp$[ebp]
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	mov	eax, DWORD PTR _adjusted_op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _smod_optab
	push	eax
	mov	eax, DWORD PTR _umod_optab
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_sign_expand_binop
	add	esp, 32					; 00000020H
	mov	DWORD PTR _temp$[ebp], eax
; Line 1771
	cmp	DWORD PTR _temp$[ebp], 0
	je	$L1387
; Line 1772
	mov	eax, DWORD PTR _temp$[ebp]
	jmp	$L1344
; Line 1775
$L1387:
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_gen_reg_rtx
	add	esp, 4
	mov	DWORD PTR _temp$[ebp], eax
; Line 1778
	cmp	DWORD PTR _unsignedp$[ebp], 0
	je	$L1451
	mov	eax, DWORD PTR _udivmod_optab
	mov	DWORD PTR -40+[ebp], eax
	jmp	$L1452
$L1451:
	mov	eax, DWORD PTR _sdivmod_optab
	mov	DWORD PTR -40+[ebp], eax
$L1452:
	mov	eax, DWORD PTR _unsignedp$[ebp]
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	push	0
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	mov	eax, DWORD PTR _adjusted_op0$[ebp]
	push	eax
	mov	eax, DWORD PTR -40+[ebp]
	push	eax
	call	_expand_twoval_binop
	add	esp, 24					; 00000018H
	or	eax, eax
	je	$L1389
; Line 1779
	mov	eax, DWORD PTR _temp$[ebp]
	jmp	$L1344
; Line 1780
$L1389:
	mov	DWORD PTR _temp$[ebp], 0
; Line 1781
$L1386:
; Line 1785
$L1384:
	cmp	DWORD PTR _log$[ebp], 0
	jl	$L1390
; Line 1788
	mov	eax, DWORD PTR _unsignedp$[ebp]
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	push	0
	push	0
	mov	eax, DWORD PTR _op1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_exact_log2
	add	esp, 4
	push	eax
	call	_build_int_2
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _adjusted_op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	push	89					; 00000059H
	call	_expand_shift
	add	esp, 24					; 00000018H
	mov	DWORD PTR _temp$[ebp], eax
; Line 1789
	jmp	$L1391
$L1390:
	cmp	DWORD PTR _rem_flag$[ebp], 0
	je	$L1392
	cmp	DWORD PTR _mod_insn_no_good$[ebp], 0
	jne	$L1392
; Line 1795
	push	2
	mov	eax, DWORD PTR _unsignedp$[ebp]
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	mov	eax, DWORD PTR _adjusted_op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _sdiv_optab
	push	eax
	mov	eax, DWORD PTR _udiv_optab
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_sign_expand_binop
	add	esp, 32					; 00000020H
	mov	DWORD PTR _temp$[ebp], eax
; Line 1796
	jmp	$L1393
$L1392:
; Line 1801
	push	2
	mov	eax, DWORD PTR _unsignedp$[ebp]
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	mov	eax, DWORD PTR _adjusted_op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _sdiv_optab
	push	eax
	mov	eax, DWORD PTR _udiv_optab
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_sign_expand_binop
	add	esp, 32					; 00000020H
	mov	DWORD PTR _temp$[ebp], eax
; Line 1802
	cmp	DWORD PTR _temp$[ebp], 0
	jne	$L1394
; Line 1806
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_gen_reg_rtx
	add	esp, 4
	mov	DWORD PTR _temp$[ebp], eax
; Line 1809
	cmp	DWORD PTR _unsignedp$[ebp], 0
	je	$L1453
	mov	eax, DWORD PTR _udivmod_optab
	mov	DWORD PTR -44+[ebp], eax
	jmp	$L1454
$L1453:
	mov	eax, DWORD PTR _sdivmod_optab
	mov	DWORD PTR -44+[ebp], eax
$L1454:
	mov	eax, DWORD PTR _unsignedp$[ebp]
	push	eax
	push	0
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	mov	eax, DWORD PTR _adjusted_op0$[ebp]
	push	eax
	mov	eax, DWORD PTR -44+[ebp]
	push	eax
	call	_expand_twoval_binop
	add	esp, 24					; 00000018H
	or	eax, eax
	jne	$L1395
; Line 1810
	mov	DWORD PTR _temp$[ebp], 0
; Line 1811
$L1395:
; Line 1814
$L1394:
	cmp	DWORD PTR _temp$[ebp], 0
	jne	$L1396
; Line 1817
	push	3
	mov	eax, DWORD PTR _unsignedp$[ebp]
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	mov	eax, DWORD PTR _adjusted_op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _sdiv_optab
	push	eax
	mov	eax, DWORD PTR _udiv_optab
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_sign_expand_binop
	add	esp, 32					; 00000020H
	mov	DWORD PTR _temp$[ebp], eax
; Line 1818
$L1396:
$L1393:
$L1391:
; Line 1821
	cmp	DWORD PTR _rem_flag$[ebp], 0
	je	$L1397
; Line 1823
	cmp	DWORD PTR _temp$[ebp], 0
	jne	$L1398
; Line 1828
	push	3
	mov	eax, DWORD PTR _unsignedp$[ebp]
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _smod_optab
	push	eax
	mov	eax, DWORD PTR _umod_optab
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_sign_expand_binop
	add	esp, 32					; 00000020H
	mov	DWORD PTR _temp$[ebp], eax
; Line 1830
	jmp	$L1399
$L1398:
; Line 1833
	mov	eax, DWORD PTR _unsignedp$[ebp]
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_expand_mult
	add	esp, 20					; 00000014H
	mov	DWORD PTR _temp$[ebp], eax
; Line 1834
	cmp	DWORD PTR _temp$[ebp], 0
	jne	$L1400
	call	_abort
; Line 1835
$L1400:
; Line 1836
	push	3
	mov	eax, DWORD PTR _unsignedp$[ebp]
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _sub_optab
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_expand_binop
	add	esp, 28					; 0000001cH
	mov	DWORD PTR _temp$[ebp], eax
; Line 1837
$L1399:
; Line 1840
$L1397:
	cmp	DWORD PTR _temp$[ebp], 0
	jne	$L1401
; Line 1841
	call	_abort
; Line 1842
$L1401:
	mov	eax, DWORD PTR _temp$[ebp]
	jmp	$L1344
; Line 1843
$L1344:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_expand_divmod ENDP
_TEXT	ENDS
EXTRN	_make_node:NEAR
EXTRN	_fold:NEAR
_TEXT	SEGMENT
_type$ = 8
_x$ = 12
_t$ = -4
_make_tree PROC NEAR
; Line 1852
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 1854
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR -8+[ebp], eax
	jmp	$L1407
; Line 1856
$L1411:
; Line 1857
	push	0
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_build_int_2
	add	esp, 8
	mov	DWORD PTR _t$[ebp], eax
; Line 1858
	mov	eax, DWORD PTR _type$[ebp]
	mov	ecx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 1859
	mov	eax, DWORD PTR _t$[ebp]
	push	eax
	call	_fold
	add	esp, 4
	jmp	$L1405
; Line 1861
$L1412:
; Line 1862
	push	115					; 00000073H
	call	_make_node
	add	esp, 4
	mov	DWORD PTR _t$[ebp], eax
; Line 1863
	mov	eax, DWORD PTR _type$[ebp]
	mov	ecx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 1864
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 1867
	mov	eax, DWORD PTR _t$[ebp]
	mov	DWORD PTR [eax+24], 0
; Line 1868
	mov	eax, DWORD PTR _t$[ebp]
	jmp	$L1405
; Line 1869
	jmp	$L1408
$L1407:
	cmp	DWORD PTR -8+[ebp], 30			; 0000001eH
	je	$L1411
	jmp	$L1412
$L1408:
; Line 1870
$L1405:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_make_tree ENDP
_TEXT	ENDS
PUBLIC	_expand_mult_add
EXTRN	_type_for_size:NEAR
EXTRN	_build:NEAR
_TEXT	SEGMENT
_x$ = 8
_mult$ = 12
_add$ = 16
_mode$ = 20
_unsignedp$ = 24
_type$ = -8
_prod$ = -12
_sum$ = -4
_expand_mult_add PROC NEAR
; Line 1882
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 1883
	mov	eax, DWORD PTR _unsignedp$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	mov	eax, DWORD PTR _mode_size[eax*4]
	shl	eax, 3
	push	eax
	call	_type_for_size
	add	esp, 8
	mov	DWORD PTR _type$[ebp], eax
; Line 1885
	mov	eax, DWORD PTR _mult$[ebp]
	push	eax
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_make_tree
	add	esp, 8
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_make_tree
	add	esp, 8
	push	eax
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	push	66					; 00000042H
	call	_build
	add	esp, 16					; 00000010H
	push	eax
	call	_fold
	add	esp, 4
	mov	DWORD PTR _prod$[ebp], eax
; Line 1886
	mov	eax, DWORD PTR _add$[ebp]
	push	eax
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_make_tree
	add	esp, 8
	push	eax
	mov	eax, DWORD PTR _prod$[ebp]
	push	eax
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	push	64					; 00000040H
	call	_build
	add	esp, 16					; 00000010H
	push	eax
	call	_fold
	add	esp, 4
	mov	DWORD PTR _sum$[ebp], eax
; Line 1887
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _sum$[ebp]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	jmp	$L1418
; Line 1888
$L1418:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_expand_mult_add ENDP
_TEXT	ENDS
END
