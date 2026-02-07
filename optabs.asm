	TITLE	optabs.c
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
COMM	_bcc_gen_fctn:DWORD:05bH
COMM	_setcc_gen_fctn:DWORD:05bH
COMM	_ucmp_optab:DWORD
COMM	_add_optab:DWORD
COMM	_sub_optab:DWORD
COMM	_smul_optab:DWORD
COMM	_umul_optab:DWORD
COMM	_smul_widen_optab:DWORD
COMM	_umul_widen_optab:DWORD
COMM	_sdiv_optab:DWORD
COMM	_sdivmod_optab:DWORD
COMM	_udiv_optab:DWORD
COMM	_udivmod_optab:DWORD
COMM	_smod_optab:DWORD
COMM	_umod_optab:DWORD
COMM	_flodiv_optab:DWORD
COMM	_ftrunc_optab:DWORD
COMM	_and_optab:DWORD
COMM	_andcb_optab:DWORD
COMM	_ior_optab:DWORD
COMM	_xor_optab:DWORD
COMM	_ashl_optab:DWORD
COMM	_ashr_optab:DWORD
COMM	_lshl_optab:DWORD
COMM	_lshr_optab:DWORD
COMM	_rotl_optab:DWORD
COMM	_rotr_optab:DWORD
COMM	_mov_optab:DWORD
COMM	_movstrict_optab:DWORD
COMM	_cmp_optab:DWORD
COMM	_tst_optab:DWORD
COMM	_neg_optab:DWORD
COMM	_abs_optab:DWORD
COMM	_one_cmpl_optab:DWORD
COMM	_ffs_optab:DWORD
_DATA	ENDS
PUBLIC	_expand_binop
EXTRN	_insn_operand_mode:BYTE
EXTRN	_insn_operand_predicate:BYTE
EXTRN	_convert_move:NEAR
EXTRN	_convert_to_mode:NEAR
EXTRN	_emit_library_call:NEAR
EXTRN	_gen_rtx:NEAR
EXTRN	_flag_force_mem:DWORD
EXTRN	_gen_reg_rtx:NEAR
EXTRN	_insn_gen_function:BYTE
EXTRN	_rtx_equal_p:NEAR
EXTRN	_gen_lowpart:NEAR
EXTRN	_copy_to_reg:NEAR
EXTRN	_get_insns:NEAR
EXTRN	_get_last_insn:NEAR
EXTRN	_force_reg:NEAR
EXTRN	_force_not_mem:NEAR
EXTRN	_hard_libcall_value:NEAR
EXTRN	_delete_insns_since:NEAR
EXTRN	_protect_from_queue:NEAR
EXTRN	_emit_insn:NEAR
EXTRN	_mode_class:BYTE
_TEXT	SEGMENT
; File optabs.c
_xop0$1088 = -68
_xop1$1089 = -64
_no_extend$1090 = -60
_mode$ = 8
_binoptab$ = 12
_op0$ = 16
_op1$ = 20
_target$ = 24
_unsignedp$ = 28
_methods$ = 32
_class$ = -4
_wider_mode$ = -16
_temp$ = -12
_last$ = -8
_icode$1056 = -20
_mode0$1057 = -40
_mode1$1058 = -32
_pat$1059 = -24
_xop0$1060 = -36
_xop1$1061 = -28
_insn_before$1074 = -48
_insn_first$1075 = -56
_insn_last$1076 = -52
_funexp$1077 = -44
_expand_binop PROC NEAR
; Line 111
	push	ebp
	mov	ebp, esp
	sub	esp, 72					; 00000048H
	push	ebx
	push	esi
	push	edi
; Line 117
	mov	eax, DWORD PTR _mode$[ebp]
	mov	eax, DWORD PTR _mode_class[eax*4]
	mov	DWORD PTR _class$[ebp], eax
; Line 119
	push	0
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	call	_protect_from_queue
	add	esp, 8
	mov	DWORD PTR _op0$[ebp], eax
; Line 120
	push	0
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	call	_protect_from_queue
	add	esp, 8
	mov	DWORD PTR _op1$[ebp], eax
; Line 121
	cmp	DWORD PTR _target$[ebp], 0
	je	$L1049
; Line 122
	push	1
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	call	_protect_from_queue
	add	esp, 8
	mov	DWORD PTR _target$[ebp], eax
; Line 131
$L1049:
	cmp	DWORD PTR _flag_force_mem, 0
	je	$L1050
; Line 133
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	call	_force_not_mem
	add	esp, 4
	mov	DWORD PTR _op0$[ebp], eax
; Line 134
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	call	_force_not_mem
	add	esp, 4
	mov	DWORD PTR _op1$[ebp], eax
; Line 138
$L1050:
	call	_get_last_insn
	mov	DWORD PTR _last$[ebp], eax
; Line 151
	mov	eax, DWORD PTR _add_optab
	cmp	DWORD PTR _binoptab$[ebp], eax
	je	$L1052
	mov	eax, DWORD PTR _and_optab
	cmp	DWORD PTR _binoptab$[ebp], eax
	je	$L1052
	mov	eax, DWORD PTR _ior_optab
	cmp	DWORD PTR _binoptab$[ebp], eax
	je	$L1052
	mov	eax, DWORD PTR _xor_optab
	cmp	DWORD PTR _binoptab$[ebp], eax
	je	$L1052
	mov	eax, DWORD PTR _smul_optab
	cmp	DWORD PTR _binoptab$[ebp], eax
	je	$L1052
	mov	eax, DWORD PTR _umul_optab
	cmp	DWORD PTR _binoptab$[ebp], eax
	je	$L1052
	mov	eax, DWORD PTR _smul_widen_optab
	cmp	DWORD PTR _binoptab$[ebp], eax
	je	$L1052
	mov	eax, DWORD PTR _umul_widen_optab
	cmp	DWORD PTR _binoptab$[ebp], eax
	jne	$L1051
$L1052:
; Line 159
	cmp	DWORD PTR _target$[ebp], 0
	je	$L1522
	mov	eax, DWORD PTR _target$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1520
$L1522:
	mov	eax, DWORD PTR _op1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1526
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1525
$L1526:
	mov	eax, DWORD PTR _op1$[ebp]
	cmp	DWORD PTR _target$[ebp], eax
	jne	$L1523
$L1525:
	mov	DWORD PTR -72+[ebp], 1
	jmp	$L1524
$L1523:
	mov	DWORD PTR -72+[ebp], 0
$L1524:
	jmp	$L1521
$L1520:
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	call	_rtx_equal_p
	add	esp, 8
	mov	DWORD PTR -72+[ebp], eax
$L1521:
	cmp	DWORD PTR -72+[ebp], 0
	jne	$L1054
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1053
$L1054:
; Line 161
	mov	eax, DWORD PTR _op1$[ebp]
	mov	DWORD PTR _temp$[ebp], eax
; Line 162
	mov	eax, DWORD PTR _op0$[ebp]
	mov	DWORD PTR _op1$[ebp], eax
; Line 163
	mov	eax, DWORD PTR _temp$[ebp]
	mov	DWORD PTR _op0$[ebp], eax
; Line 165
$L1053:
; Line 169
$L1051:
; Line 170
	cmp	DWORD PTR _methods$[ebp], 4
	je	$L1055
	mov	eax, DWORD PTR _mode$[ebp]
	mov	ecx, DWORD PTR _binoptab$[ebp]
	cmp	DWORD PTR [ecx+eax*8+4], 142		; 0000008eH
	je	$L1055
; Line 172
	mov	eax, DWORD PTR _mode$[ebp]
	mov	ecx, DWORD PTR _binoptab$[ebp]
	mov	eax, DWORD PTR [ecx+eax*8+4]
	mov	DWORD PTR _icode$1056[ebp], eax
; Line 173
	mov	eax, DWORD PTR _icode$1056[ebp]
	mov	ecx, eax
	shl	eax, 3
	sub	eax, ecx
	mov	eax, DWORD PTR _insn_operand_mode[eax*4+4]
	mov	DWORD PTR _mode0$1057[ebp], eax
; Line 174
	mov	eax, DWORD PTR _icode$1056[ebp]
	mov	ecx, eax
	shl	eax, 3
	sub	eax, ecx
	mov	eax, DWORD PTR _insn_operand_mode[eax*4+8]
	mov	DWORD PTR _mode1$1058[ebp], eax
; Line 176
	mov	eax, DWORD PTR _op0$[ebp]
	mov	DWORD PTR _xop0$1060[ebp], eax
	mov	eax, DWORD PTR _op1$[ebp]
	mov	DWORD PTR _xop1$1061[ebp], eax
; Line 178
	cmp	DWORD PTR _target$[ebp], 0
	je	$L1062
; Line 179
	mov	eax, DWORD PTR _target$[ebp]
	mov	DWORD PTR _temp$[ebp], eax
; Line 180
	jmp	$L1063
$L1062:
; Line 181
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_gen_reg_rtx
	add	esp, 4
	mov	DWORD PTR _temp$[ebp], eax
$L1063:
; Line 187
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sub	ecx, ecx
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L1064
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	cmp	eax, DWORD PTR _mode0$1057[ebp]
	je	$L1064
; Line 188
	mov	eax, DWORD PTR _unsignedp$[ebp]
	push	eax
	mov	eax, DWORD PTR _xop0$1060[ebp]
	push	eax
	mov	eax, DWORD PTR _mode0$1057[ebp]
	push	eax
	call	_convert_to_mode
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _xop0$1060[ebp], eax
; Line 190
$L1064:
; Line 191
	mov	eax, DWORD PTR _xop1$1061[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sub	ecx, ecx
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L1065
	mov	eax, DWORD PTR _xop1$1061[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	cmp	eax, DWORD PTR _mode1$1058[ebp]
	je	$L1065
; Line 192
	mov	eax, DWORD PTR _unsignedp$[ebp]
	push	eax
	mov	eax, DWORD PTR _xop1$1061[ebp]
	push	eax
	mov	eax, DWORD PTR _mode1$1058[ebp]
	push	eax
	call	_convert_to_mode
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _xop1$1061[ebp], eax
; Line 196
$L1065:
	mov	eax, DWORD PTR _mode0$1057[ebp]
	push	eax
	mov	eax, DWORD PTR _xop0$1060[ebp]
	push	eax
	mov	eax, DWORD PTR _icode$1056[ebp]
	mov	ecx, eax
	shl	eax, 3
	sub	eax, ecx
	call	DWORD PTR _insn_operand_predicate[eax*4+4]
	add	esp, 8
	or	eax, eax
	jne	$L1066
; Line 197
	mov	eax, DWORD PTR _xop0$1060[ebp]
	push	eax
	mov	eax, DWORD PTR _mode0$1057[ebp]
	push	eax
	call	_force_reg
	add	esp, 8
	mov	DWORD PTR _xop0$1060[ebp], eax
; Line 199
$L1066:
	mov	eax, DWORD PTR _mode1$1058[ebp]
	push	eax
	mov	eax, DWORD PTR _xop1$1061[ebp]
	push	eax
	mov	eax, DWORD PTR _icode$1056[ebp]
	mov	ecx, eax
	shl	eax, 3
	sub	eax, ecx
	call	DWORD PTR _insn_operand_predicate[eax*4+8]
	add	esp, 8
	or	eax, eax
	jne	$L1067
; Line 200
	mov	eax, DWORD PTR _xop1$1061[ebp]
	push	eax
	mov	eax, DWORD PTR _mode1$1058[ebp]
	push	eax
	call	_force_reg
	add	esp, 8
	mov	DWORD PTR _xop1$1061[ebp], eax
; Line 202
$L1067:
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	mov	eax, DWORD PTR _icode$1056[ebp]
	mov	ecx, eax
	shl	eax, 3
	sub	eax, ecx
	call	DWORD PTR _insn_operand_predicate[eax*4]
	add	esp, 8
	or	eax, eax
	jne	$L1068
; Line 203
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_gen_reg_rtx
	add	esp, 4
	mov	DWORD PTR _temp$[ebp], eax
; Line 205
$L1068:
	mov	eax, DWORD PTR _xop1$1061[ebp]
	push	eax
	mov	eax, DWORD PTR _xop0$1060[ebp]
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	mov	eax, DWORD PTR _icode$1056[ebp]
	call	DWORD PTR _insn_gen_function[eax*4]
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _pat$1059[ebp], eax
; Line 206
	cmp	DWORD PTR _pat$1059[ebp], 0
	je	$L1069
; Line 208
	mov	eax, DWORD PTR _pat$1059[ebp]
	push	eax
	call	_emit_insn
	add	esp, 4
; Line 209
	mov	eax, DWORD PTR _temp$[ebp]
	jmp	$L1044
; Line 211
	jmp	$L1070
$L1069:
; Line 212
	mov	eax, DWORD PTR _last$[ebp]
	push	eax
	call	_delete_insns_since
	add	esp, 4
$L1070:
; Line 218
$L1055:
; Line 219
	mov	eax, DWORD PTR _mode$[ebp]
	mov	ecx, DWORD PTR _binoptab$[ebp]
	cmp	DWORD PTR [ecx+eax*8+8], 0
	je	$L1072
	cmp	DWORD PTR _methods$[ebp], 1
	je	$L1073
	cmp	DWORD PTR _methods$[ebp], 3
	jne	$L1072
$L1073:
; Line 223
	mov	eax, DWORD PTR _mode$[ebp]
	mov	ecx, DWORD PTR _binoptab$[ebp]
	mov	eax, DWORD PTR [ecx+eax*8+8]
	push	eax
	push	4
	push	39					; 00000027H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _funexp$1077[ebp], eax
; Line 234
	call	_get_last_insn
	mov	DWORD PTR _insn_before$1074[ebp], eax
; Line 243
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	push	2
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	push	1
	mov	eax, DWORD PTR _mode$[ebp]
	mov	ecx, DWORD PTR _binoptab$[ebp]
	mov	eax, DWORD PTR [ecx+eax*8+8]
	push	eax
	push	4
	push	39					; 00000027H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	call	_emit_library_call
	add	esp, 32					; 00000020H
; Line 244
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_hard_libcall_value
	add	esp, 4
	mov	DWORD PTR _target$[ebp], eax
; Line 245
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	call	_copy_to_reg
	add	esp, 4
	mov	DWORD PTR _temp$[ebp], eax
; Line 247
	cmp	DWORD PTR _insn_before$1074[ebp], 0
	jne	$L1078
; Line 248
	call	_get_insns
	mov	DWORD PTR _insn_first$1075[ebp], eax
; Line 249
	jmp	$L1079
$L1078:
; Line 250
	mov	eax, DWORD PTR _insn_before$1074[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _insn_first$1075[ebp], eax
$L1079:
; Line 251
	call	_get_last_insn
	mov	DWORD PTR _insn_last$1076[ebp], eax
; Line 257
	mov	eax, DWORD PTR _insn_last$1076[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	mov	eax, DWORD PTR _insn_first$1075[ebp]
	push	eax
	push	6
	push	3
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	mov	eax, DWORD PTR _binoptab$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	push	5
	push	2
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	ecx, DWORD PTR _insn_last$1076[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 260
	mov	eax, DWORD PTR _insn_first$1075[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	mov	eax, DWORD PTR _insn_last$1076[ebp]
	push	eax
	push	7
	push	3
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	ecx, DWORD PTR _insn_first$1075[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 261
	mov	eax, DWORD PTR _temp$[ebp]
	jmp	$L1044
; Line 264
$L1072:
	mov	eax, DWORD PTR _last$[ebp]
	push	eax
	call	_delete_insns_since
	add	esp, 4
; Line 269
	cmp	DWORD PTR _methods$[ebp], 2
	je	$L1080
	cmp	DWORD PTR _methods$[ebp], 3
	je	$L1080
	cmp	DWORD PTR _methods$[ebp], 4
	je	$L1080
; Line 270
	sub	eax, eax
	jmp	$L1044
; Line 275
$L1080:
	mov	eax, DWORD PTR _methods$[ebp]
	sub	eax, 3
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	mov	DWORD PTR _methods$[ebp], eax
; Line 281
	cmp	DWORD PTR _class$[ebp], 1
	je	$L1082
	cmp	DWORD PTR _class$[ebp], 2
	jne	$L1081
$L1082:
; Line 286
	mov	eax, DWORD PTR _mode$[ebp]
	inc	eax
	mov	DWORD PTR _wider_mode$[ebp], eax
	jmp	$L1083
$L1084:
	inc	DWORD PTR _wider_mode$[ebp]
$L1083:
	cmp	DWORD PTR _wider_mode$[ebp], 28		; 0000001cH
	jge	$L1085
	mov	eax, DWORD PTR _wider_mode$[ebp]
	mov	ecx, DWORD PTR _class$[ebp]
	cmp	DWORD PTR _mode_class[eax*4], ecx
	jne	$L1085
; Line 291
	mov	eax, DWORD PTR _wider_mode$[ebp]
	mov	ecx, DWORD PTR _binoptab$[ebp]
	cmp	DWORD PTR [ecx+eax*8+4], 142		; 0000008eH
	jne	$L1087
	cmp	DWORD PTR _methods$[ebp], 1
	jne	$L1086
	mov	eax, DWORD PTR _wider_mode$[ebp]
	mov	ecx, DWORD PTR _binoptab$[ebp]
	cmp	DWORD PTR [ecx+eax*8+8], 0
	je	$L1086
$L1087:
; Line 293
	mov	eax, DWORD PTR _op0$[ebp]
	mov	DWORD PTR _xop0$1088[ebp], eax
	mov	eax, DWORD PTR _op1$[ebp]
	mov	DWORD PTR _xop1$1089[ebp], eax
; Line 294
	mov	DWORD PTR _no_extend$1090[ebp], 0
; Line 304
	mov	eax, DWORD PTR _ior_optab
	cmp	DWORD PTR _binoptab$[ebp], eax
	je	$L1092
	mov	eax, DWORD PTR _and_optab
	cmp	DWORD PTR _binoptab$[ebp], eax
	je	$L1092
	mov	eax, DWORD PTR _xor_optab
	cmp	DWORD PTR _binoptab$[ebp], eax
	je	$L1092
	mov	eax, DWORD PTR _andcb_optab
	cmp	DWORD PTR _binoptab$[ebp], eax
	je	$L1092
	mov	eax, DWORD PTR _add_optab
	cmp	DWORD PTR _binoptab$[ebp], eax
	je	$L1092
	mov	eax, DWORD PTR _sub_optab
	cmp	DWORD PTR _binoptab$[ebp], eax
	je	$L1092
	mov	eax, DWORD PTR _smul_optab
	cmp	DWORD PTR _binoptab$[ebp], eax
	je	$L1092
	mov	eax, DWORD PTR _umul_optab
	cmp	DWORD PTR _binoptab$[ebp], eax
	je	$L1092
	mov	eax, DWORD PTR _ashl_optab
	cmp	DWORD PTR _binoptab$[ebp], eax
	je	$L1092
	mov	eax, DWORD PTR _lshl_optab
	cmp	DWORD PTR _binoptab$[ebp], eax
	jne	$L1091
$L1092:
; Line 305
	mov	DWORD PTR _no_extend$1090[ebp], 1
; Line 307
$L1091:
	mov	eax, DWORD PTR _xop0$1088[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sub	ecx, ecx
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L1093
; Line 309
	cmp	DWORD PTR _no_extend$1090[ebp], 0
	je	$L1094
; Line 311
	mov	eax, DWORD PTR _xop0$1088[ebp]
	push	eax
	mov	eax, DWORD PTR _xop0$1088[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	call	_force_reg
	add	esp, 8
	mov	DWORD PTR _temp$[ebp], eax
; Line 312
	push	0
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	mov	eax, DWORD PTR _wider_mode$[ebp]
	push	eax
	push	35					; 00000023H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	DWORD PTR _xop0$1088[ebp], eax
; Line 314
	jmp	$L1095
$L1094:
; Line 316
	mov	eax, DWORD PTR _wider_mode$[ebp]
	push	eax
	call	_gen_reg_rtx
	add	esp, 4
	mov	DWORD PTR _temp$[ebp], eax
; Line 317
	mov	eax, DWORD PTR _unsignedp$[ebp]
	push	eax
	mov	eax, DWORD PTR _xop0$1088[ebp]
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_convert_move
	add	esp, 12					; 0000000cH
; Line 318
	mov	eax, DWORD PTR _temp$[ebp]
	mov	DWORD PTR _xop0$1088[ebp], eax
; Line 319
$L1095:
; Line 321
$L1093:
	mov	eax, DWORD PTR _xop1$1089[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sub	ecx, ecx
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L1096
; Line 323
	cmp	DWORD PTR _no_extend$1090[ebp], 0
	je	$L1097
; Line 325
	mov	eax, DWORD PTR _xop1$1089[ebp]
	push	eax
	mov	eax, DWORD PTR _xop1$1089[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	call	_force_reg
	add	esp, 8
	mov	DWORD PTR _temp$[ebp], eax
; Line 326
	push	0
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	mov	eax, DWORD PTR _wider_mode$[ebp]
	push	eax
	push	35					; 00000023H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	DWORD PTR _xop1$1089[ebp], eax
; Line 328
	jmp	$L1098
$L1097:
; Line 330
	mov	eax, DWORD PTR _wider_mode$[ebp]
	push	eax
	call	_gen_reg_rtx
	add	esp, 4
	mov	DWORD PTR _temp$[ebp], eax
; Line 331
	mov	eax, DWORD PTR _unsignedp$[ebp]
	push	eax
	mov	eax, DWORD PTR _xop1$1089[ebp]
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_convert_move
	add	esp, 12					; 0000000cH
; Line 332
	mov	eax, DWORD PTR _temp$[ebp]
	mov	DWORD PTR _xop1$1089[ebp], eax
; Line 333
$L1098:
; Line 336
$L1096:
; Line 337
	mov	eax, DWORD PTR _methods$[ebp]
	push	eax
	mov	eax, DWORD PTR _unsignedp$[ebp]
	push	eax
	push	0
	mov	eax, DWORD PTR _xop1$1089[ebp]
	push	eax
	mov	eax, DWORD PTR _xop0$1088[ebp]
	push	eax
	mov	eax, DWORD PTR _binoptab$[ebp]
	push	eax
	mov	eax, DWORD PTR _wider_mode$[ebp]
	push	eax
	call	_expand_binop
	add	esp, 28					; 0000001cH
	mov	DWORD PTR _temp$[ebp], eax
; Line 338
	cmp	DWORD PTR _temp$[ebp], 0
	je	$L1099
; Line 340
	cmp	DWORD PTR _class$[ebp], 2
	jne	$L1100
; Line 342
	cmp	DWORD PTR _target$[ebp], 0
	jne	$L1101
; Line 343
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_gen_reg_rtx
	add	esp, 4
	mov	DWORD PTR _target$[ebp], eax
; Line 344
$L1101:
	push	0
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	call	_convert_move
	add	esp, 12					; 0000000cH
; Line 345
	mov	eax, DWORD PTR _target$[ebp]
	jmp	$L1044
; Line 347
	jmp	$L1102
$L1100:
; Line 348
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_gen_lowpart
	add	esp, 8
	jmp	$L1044
$L1102:
; Line 350
	jmp	$L1103
$L1099:
; Line 351
	mov	eax, DWORD PTR _last$[ebp]
	push	eax
	call	_delete_insns_since
	add	esp, 4
$L1103:
; Line 353
$L1086:
	jmp	$L1084
$L1085:
; Line 356
$L1081:
	sub	eax, eax
	jmp	$L1044
; Line 357
$L1044:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_expand_binop ENDP
_TEXT	ENDS
PUBLIC	_sign_expand_binop
_TEXT	SEGMENT
_mode$ = 8
_uoptab$ = 12
_soptab$ = 16
_op0$ = 20
_op1$ = 24
_target$ = 28
_unsignedp$ = 32
_methods$ = 36
_temp$ = -236
_direct_optab$ = -4
_wide_soptab$ = -232
_sign_expand_binop PROC NEAR
; Line 373
	push	ebp
	mov	ebp, esp
	sub	esp, 236				; 000000ecH
	push	ebx
	push	esi
	push	edi
; Line 375
	cmp	DWORD PTR _unsignedp$[ebp], 0
	je	$L1527
	mov	eax, DWORD PTR _uoptab$[ebp]
	mov	DWORD PTR _direct_optab$[ebp], eax
	jmp	$L1528
$L1527:
	mov	eax, DWORD PTR _soptab$[ebp]
	mov	DWORD PTR _direct_optab$[ebp], eax
$L1528:
; Line 380
	push	0
	mov	eax, DWORD PTR _unsignedp$[ebp]
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _direct_optab$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_expand_binop
	add	esp, 28					; 0000001cH
	mov	DWORD PTR _temp$[ebp], eax
; Line 381
	cmp	DWORD PTR _temp$[ebp], 0
	jne	$L1117
	cmp	DWORD PTR _methods$[ebp], 0
	jne	$L1116
$L1117:
; Line 382
	mov	eax, DWORD PTR _temp$[ebp]
	jmp	$L1112
; Line 386
$L1116:
	lea	edi, DWORD PTR _wide_soptab$[ebp]
	mov	esi, DWORD PTR _soptab$[ebp]
	mov	ecx, 57					; 00000039H
	rep	movsd
; Line 387
	mov	eax, DWORD PTR _mode$[ebp]
	mov	DWORD PTR _wide_soptab$[ebp+eax*8+4], 142 ; 0000008eH
; Line 388
	mov	eax, DWORD PTR _mode$[ebp]
	mov	DWORD PTR _wide_soptab$[ebp+eax*8+8], 0
; Line 391
	push	2
	mov	eax, DWORD PTR _unsignedp$[ebp]
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	lea	eax, DWORD PTR _wide_soptab$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_expand_binop
	add	esp, 28					; 0000001cH
	mov	DWORD PTR _temp$[ebp], eax
; Line 394
	cmp	DWORD PTR _temp$[ebp], 0
	jne	$L1118
	cmp	DWORD PTR _unsignedp$[ebp], 0
	je	$L1118
; Line 396
	push	2
	mov	eax, DWORD PTR _unsignedp$[ebp]
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _uoptab$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_expand_binop
	add	esp, 28					; 0000001cH
	mov	DWORD PTR _temp$[ebp], eax
; Line 397
$L1118:
	cmp	DWORD PTR _temp$[ebp], 0
	jne	$L1120
	cmp	DWORD PTR _methods$[ebp], 2
	jne	$L1119
$L1120:
; Line 398
	mov	eax, DWORD PTR _temp$[ebp]
	jmp	$L1112
; Line 401
$L1119:
	push	1
	mov	eax, DWORD PTR _unsignedp$[ebp]
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _direct_optab$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_expand_binop
	add	esp, 28					; 0000001cH
	mov	DWORD PTR _temp$[ebp], eax
; Line 402
	cmp	DWORD PTR _temp$[ebp], 0
	jne	$L1122
	cmp	DWORD PTR _methods$[ebp], 1
	jne	$L1121
$L1122:
; Line 403
	mov	eax, DWORD PTR _temp$[ebp]
	jmp	$L1112
; Line 406
$L1121:
; Line 407
	mov	eax, DWORD PTR _methods$[ebp]
	push	eax
	mov	eax, DWORD PTR _unsignedp$[ebp]
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	lea	eax, DWORD PTR _wide_soptab$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_expand_binop
	add	esp, 28					; 0000001cH
	mov	DWORD PTR _temp$[ebp], eax
; Line 408
	cmp	DWORD PTR _temp$[ebp], 0
	je	$L1123
; Line 409
	mov	eax, DWORD PTR _temp$[ebp]
	jmp	$L1112
; Line 410
$L1123:
	cmp	DWORD PTR _unsignedp$[ebp], 0
	je	$L1124
; Line 412
	mov	eax, DWORD PTR _methods$[ebp]
	push	eax
	mov	eax, DWORD PTR _unsignedp$[ebp]
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _uoptab$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_expand_binop
	add	esp, 28					; 0000001cH
	jmp	$L1112
; Line 413
$L1124:
	sub	eax, eax
	jmp	$L1112
; Line 414
$L1112:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_sign_expand_binop ENDP
_TEXT	ENDS
PUBLIC	_expand_twoval_binop
PUBLIC	_expand_twoval_binop_convert
_TEXT	SEGMENT
_binoptab$ = 8
_op0$ = 12
_op1$ = 16
_targ0$ = 20
_targ1$ = 24
_unsignedp$ = 28
_mode$ = -4
_class$ = -8
_wider_mode$ = -12
_expand_twoval_binop PROC NEAR
; Line 434
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 435
	cmp	DWORD PTR _targ0$[ebp], 0
	je	$L1529
	mov	eax, DWORD PTR _targ0$[ebp]
	mov	DWORD PTR -16+[ebp], eax
	jmp	$L1530
$L1529:
	mov	eax, DWORD PTR _targ1$[ebp]
	mov	DWORD PTR -16+[ebp], eax
$L1530:
	mov	eax, DWORD PTR -16+[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	mov	DWORD PTR _mode$[ebp], eax
; Line 439
	mov	eax, DWORD PTR _mode$[ebp]
	mov	eax, DWORD PTR _mode_class[eax*4]
	mov	DWORD PTR _class$[ebp], eax
; Line 441
	push	0
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	call	_protect_from_queue
	add	esp, 8
	mov	DWORD PTR _op0$[ebp], eax
; Line 442
	push	0
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	call	_protect_from_queue
	add	esp, 8
	mov	DWORD PTR _op1$[ebp], eax
; Line 444
	cmp	DWORD PTR _flag_force_mem, 0
	je	$L1136
; Line 446
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	call	_force_not_mem
	add	esp, 4
	mov	DWORD PTR _op0$[ebp], eax
; Line 447
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	call	_force_not_mem
	add	esp, 4
	mov	DWORD PTR _op1$[ebp], eax
; Line 450
$L1136:
	cmp	DWORD PTR _targ0$[ebp], 0
	je	$L1137
; Line 451
	push	1
	mov	eax, DWORD PTR _targ0$[ebp]
	push	eax
	call	_protect_from_queue
	add	esp, 8
	mov	DWORD PTR _targ0$[ebp], eax
; Line 452
	jmp	$L1138
$L1137:
; Line 453
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_gen_reg_rtx
	add	esp, 4
	mov	DWORD PTR _targ0$[ebp], eax
$L1138:
; Line 454
	cmp	DWORD PTR _targ1$[ebp], 0
	je	$L1139
; Line 455
	push	1
	mov	eax, DWORD PTR _targ1$[ebp]
	push	eax
	call	_protect_from_queue
	add	esp, 8
	mov	DWORD PTR _targ1$[ebp], eax
; Line 456
	jmp	$L1140
$L1139:
; Line 457
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_gen_reg_rtx
	add	esp, 4
	mov	DWORD PTR _targ1$[ebp], eax
$L1140:
; Line 459
	mov	eax, DWORD PTR _mode$[ebp]
	mov	ecx, DWORD PTR _binoptab$[ebp]
	cmp	DWORD PTR [ecx+eax*8+4], 142		; 0000008eH
	je	$L1141
; Line 462
	mov	eax, DWORD PTR _targ1$[ebp]
	push	eax
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _targ0$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	mov	ecx, DWORD PTR _binoptab$[ebp]
	mov	eax, DWORD PTR [ecx+eax*8+4]
	call	DWORD PTR _insn_gen_function[eax*4]
	add	esp, 16					; 00000010H
	push	eax
	call	_emit_insn
	add	esp, 4
; Line 463
	mov	eax, 1
	jmp	$L1132
; Line 468
$L1141:
	cmp	DWORD PTR _class$[ebp], 1
	je	$L1143
	cmp	DWORD PTR _class$[ebp], 2
	jne	$L1142
$L1143:
; Line 473
	mov	eax, DWORD PTR _mode$[ebp]
	inc	eax
	mov	DWORD PTR _wider_mode$[ebp], eax
	jmp	$L1144
$L1145:
	inc	DWORD PTR _wider_mode$[ebp]
$L1144:
	cmp	DWORD PTR _wider_mode$[ebp], 28		; 0000001cH
	jge	$L1146
	mov	eax, DWORD PTR _wider_mode$[ebp]
	mov	ecx, DWORD PTR _class$[ebp]
	cmp	DWORD PTR _mode_class[eax*4], ecx
	jne	$L1146
; Line 476
	mov	eax, DWORD PTR _wider_mode$[ebp]
	mov	ecx, DWORD PTR _binoptab$[ebp]
	cmp	DWORD PTR [ecx+eax*8+4], 142		; 0000008eH
	je	$L1147
; Line 479
	mov	eax, DWORD PTR _unsignedp$[ebp]
	push	eax
	mov	eax, DWORD PTR _targ1$[ebp]
	push	eax
	mov	eax, DWORD PTR _targ0$[ebp]
	push	eax
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _wider_mode$[ebp]
	push	eax
	mov	eax, DWORD PTR _binoptab$[ebp]
	push	eax
	call	_expand_twoval_binop_convert
	add	esp, 28					; 0000001cH
; Line 480
	mov	eax, 1
	jmp	$L1132
; Line 482
$L1147:
	jmp	$L1145
$L1146:
; Line 484
$L1142:
	sub	eax, eax
	jmp	$L1132
; Line 485
$L1132:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_expand_twoval_binop ENDP
_op1$ = 20
_targ0$ = 24
_targ1$ = 28
_unsignedp$ = 32
_t0$ = -12
_t1$ = -4
_temp$ = -8
_binoptab$ = 8
_op0$ = 16
_expand_twoval_binop_convert PROC NEAR
; Line 492
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 493
	push	4
	call	_gen_reg_rtx
	add	esp, 4
	mov	DWORD PTR _t0$[ebp], eax
; Line 494
	push	4
	call	_gen_reg_rtx
	add	esp, 4
	mov	DWORD PTR _t1$[ebp], eax
; Line 497
	push	4
	call	_gen_reg_rtx
	add	esp, 4
	mov	DWORD PTR _temp$[ebp], eax
; Line 498
	mov	eax, DWORD PTR _unsignedp$[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_convert_move
	add	esp, 12					; 0000000cH
; Line 499
	mov	eax, DWORD PTR _temp$[ebp]
	mov	DWORD PTR _op0$[ebp], eax
; Line 500
	push	4
	call	_gen_reg_rtx
	add	esp, 4
	mov	DWORD PTR _temp$[ebp], eax
; Line 501
	mov	eax, DWORD PTR _unsignedp$[ebp]
	push	eax
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_convert_move
	add	esp, 12					; 0000000cH
; Line 502
	mov	eax, DWORD PTR _temp$[ebp]
	mov	DWORD PTR _op1$[ebp], eax
; Line 504
	mov	eax, DWORD PTR _unsignedp$[ebp]
	push	eax
	mov	eax, DWORD PTR _t1$[ebp]
	push	eax
	mov	eax, DWORD PTR _t0$[ebp]
	push	eax
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _binoptab$[ebp]
	push	eax
	call	_expand_twoval_binop
	add	esp, 24					; 00000018H
; Line 505
	mov	eax, DWORD PTR _unsignedp$[ebp]
	push	eax
	mov	eax, DWORD PTR _t0$[ebp]
	push	eax
	mov	eax, DWORD PTR _targ0$[ebp]
	push	eax
	call	_convert_move
	add	esp, 12					; 0000000cH
; Line 506
	mov	eax, DWORD PTR _unsignedp$[ebp]
	push	eax
	mov	eax, DWORD PTR _t1$[ebp]
	push	eax
	mov	eax, DWORD PTR _targ1$[ebp]
	push	eax
	call	_convert_move
	add	esp, 12					; 0000000cH
; Line 507
	mov	eax, 1
	jmp	$L1156
; Line 508
$L1156:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_expand_twoval_binop_convert ENDP
_TEXT	ENDS
PUBLIC	_expand_unop
_TEXT	SEGMENT
_mode$ = 8
_unoptab$ = 12
_op0$ = 16
_target$ = 20
_unsignedp$ = 24
_class$ = -4
_wider_mode$ = -12
_temp$ = -8
_icode$1172 = -16
_mode0$1173 = -20
_insn_before$1181 = -28
_insn_last$1182 = -32
_funexp$1183 = -24
_expand_unop PROC NEAR
; Line 528
	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H
	push	ebx
	push	esi
	push	edi
; Line 533
	mov	eax, DWORD PTR _mode$[ebp]
	mov	eax, DWORD PTR _mode_class[eax*4]
	mov	DWORD PTR _class$[ebp], eax
; Line 535
	push	0
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	call	_protect_from_queue
	add	esp, 8
	mov	DWORD PTR _op0$[ebp], eax
; Line 537
	cmp	DWORD PTR _flag_force_mem, 0
	je	$L1169
; Line 539
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	call	_force_not_mem
	add	esp, 4
	mov	DWORD PTR _op0$[ebp], eax
; Line 542
$L1169:
	cmp	DWORD PTR _target$[ebp], 0
	je	$L1170
; Line 543
	push	1
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	call	_protect_from_queue
	add	esp, 8
	mov	DWORD PTR _target$[ebp], eax
; Line 545
$L1170:
	mov	eax, DWORD PTR _mode$[ebp]
	mov	ecx, DWORD PTR _unoptab$[ebp]
	cmp	DWORD PTR [ecx+eax*8+4], 142		; 0000008eH
	je	$L1171
; Line 547
	mov	eax, DWORD PTR _mode$[ebp]
	mov	ecx, DWORD PTR _unoptab$[ebp]
	mov	eax, DWORD PTR [ecx+eax*8+4]
	mov	DWORD PTR _icode$1172[ebp], eax
; Line 548
	mov	eax, DWORD PTR _icode$1172[ebp]
	mov	ecx, eax
	shl	eax, 3
	sub	eax, ecx
	mov	eax, DWORD PTR _insn_operand_mode[eax*4+4]
	mov	DWORD PTR _mode0$1173[ebp], eax
; Line 550
	cmp	DWORD PTR _target$[ebp], 0
	je	$L1174
; Line 551
	mov	eax, DWORD PTR _target$[ebp]
	mov	DWORD PTR _temp$[ebp], eax
; Line 552
	jmp	$L1175
$L1174:
; Line 553
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_gen_reg_rtx
	add	esp, 4
	mov	DWORD PTR _temp$[ebp], eax
$L1175:
; Line 556
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sub	ecx, ecx
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L1176
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	cmp	eax, DWORD PTR _mode0$1173[ebp]
	je	$L1176
; Line 557
	mov	eax, DWORD PTR _unsignedp$[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode0$1173[ebp]
	push	eax
	call	_convert_to_mode
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _op0$[ebp], eax
; Line 561
$L1176:
	mov	eax, DWORD PTR _mode0$1173[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _icode$1172[ebp]
	mov	ecx, eax
	shl	eax, 3
	sub	eax, ecx
	call	DWORD PTR _insn_operand_predicate[eax*4+4]
	add	esp, 8
	or	eax, eax
	jne	$L1177
; Line 562
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode0$1173[ebp]
	push	eax
	call	_force_reg
	add	esp, 8
	mov	DWORD PTR _op0$[ebp], eax
; Line 564
$L1177:
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	mov	eax, DWORD PTR _icode$1172[ebp]
	mov	ecx, eax
	shl	eax, 3
	sub	eax, ecx
	call	DWORD PTR _insn_operand_predicate[eax*4]
	add	esp, 8
	or	eax, eax
	jne	$L1178
; Line 565
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_gen_reg_rtx
	add	esp, 4
	mov	DWORD PTR _temp$[ebp], eax
; Line 567
$L1178:
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	mov	eax, DWORD PTR _icode$1172[ebp]
	call	DWORD PTR _insn_gen_function[eax*4]
	add	esp, 8
	push	eax
	call	_emit_insn
	add	esp, 4
; Line 568
	mov	eax, DWORD PTR _temp$[ebp]
	jmp	$L1165
; Line 570
	jmp	$L1179
$L1171:
	mov	eax, DWORD PTR _mode$[ebp]
	mov	ecx, DWORD PTR _unoptab$[ebp]
	cmp	DWORD PTR [ecx+eax*8+8], 0
	je	$L1180
; Line 574
	mov	eax, DWORD PTR _mode$[ebp]
	mov	ecx, DWORD PTR _unoptab$[ebp]
	mov	eax, DWORD PTR [ecx+eax*8+8]
	push	eax
	push	4
	push	39					; 00000027H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _funexp$1183[ebp], eax
; Line 583
	call	_get_last_insn
	mov	DWORD PTR _insn_before$1181[ebp], eax
; Line 592
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	push	1
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	push	1
	mov	eax, DWORD PTR _mode$[ebp]
	mov	ecx, DWORD PTR _unoptab$[ebp]
	mov	eax, DWORD PTR [ecx+eax*8+8]
	push	eax
	push	4
	push	39					; 00000027H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	call	_emit_library_call
	add	esp, 24					; 00000018H
; Line 593
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_hard_libcall_value
	add	esp, 4
	mov	DWORD PTR _target$[ebp], eax
; Line 594
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	call	_copy_to_reg
	add	esp, 4
	mov	DWORD PTR _temp$[ebp], eax
; Line 595
	call	_get_last_insn
	mov	DWORD PTR _insn_last$1182[ebp], eax
; Line 601
	mov	eax, DWORD PTR _insn_last$1182[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	mov	eax, DWORD PTR _insn_before$1181[ebp]
	mov	eax, DWORD PTR [eax+12]
	push	eax
	push	6
	push	3
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	mov	eax, DWORD PTR _unoptab$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	push	5
	push	2
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	ecx, DWORD PTR _insn_last$1182[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 604
	mov	eax, DWORD PTR _insn_before$1181[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	mov	eax, DWORD PTR _insn_last$1182[ebp]
	push	eax
	push	7
	push	3
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	ecx, DWORD PTR _insn_before$1181[ebp]
	mov	ecx, DWORD PTR [ecx+12]
	mov	DWORD PTR [ecx+28], eax
; Line 605
	mov	eax, DWORD PTR _temp$[ebp]
	jmp	$L1165
; Line 610
$L1180:
$L1179:
	cmp	DWORD PTR _class$[ebp], 1
	je	$L1185
	cmp	DWORD PTR _class$[ebp], 2
	jne	$L1184
$L1185:
; Line 615
	mov	eax, DWORD PTR _mode$[ebp]
	inc	eax
	mov	DWORD PTR _wider_mode$[ebp], eax
	jmp	$L1186
$L1187:
	inc	DWORD PTR _wider_mode$[ebp]
$L1186:
	cmp	DWORD PTR _wider_mode$[ebp], 28		; 0000001cH
	jge	$L1188
	mov	eax, DWORD PTR _wider_mode$[ebp]
	mov	ecx, DWORD PTR _class$[ebp]
	cmp	DWORD PTR _mode_class[eax*4], ecx
	jne	$L1188
; Line 619
	mov	eax, DWORD PTR _wider_mode$[ebp]
	mov	ecx, DWORD PTR _unoptab$[ebp]
	cmp	DWORD PTR [ecx+eax*8+4], 142		; 0000008eH
	jne	$L1190
	mov	eax, DWORD PTR _wider_mode$[ebp]
	mov	ecx, DWORD PTR _unoptab$[ebp]
	cmp	DWORD PTR [ecx+eax*8+8], 0
	je	$L1189
$L1190:
; Line 621
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sub	ecx, ecx
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L1191
; Line 623
	mov	eax, DWORD PTR _wider_mode$[ebp]
	push	eax
	call	_gen_reg_rtx
	add	esp, 4
	mov	DWORD PTR _temp$[ebp], eax
; Line 624
	mov	eax, DWORD PTR _unsignedp$[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_convert_move
	add	esp, 12					; 0000000cH
; Line 625
	mov	eax, DWORD PTR _temp$[ebp]
	mov	DWORD PTR _op0$[ebp], eax
; Line 628
$L1191:
	mov	eax, DWORD PTR _unsignedp$[ebp]
	push	eax
	push	0
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _unoptab$[ebp]
	push	eax
	mov	eax, DWORD PTR _wider_mode$[ebp]
	push	eax
	call	_expand_unop
	add	esp, 20					; 00000014H
	mov	DWORD PTR _target$[ebp], eax
; Line 629
	cmp	DWORD PTR _class$[ebp], 2
	jne	$L1192
; Line 631
	cmp	DWORD PTR _target$[ebp], 0
	jne	$L1193
; Line 632
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_gen_reg_rtx
	add	esp, 4
	mov	DWORD PTR _target$[ebp], eax
; Line 633
$L1193:
	push	0
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	call	_convert_move
	add	esp, 12					; 0000000cH
; Line 634
	mov	eax, DWORD PTR _target$[ebp]
	jmp	$L1165
; Line 636
	jmp	$L1194
$L1192:
; Line 637
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_gen_lowpart
	add	esp, 8
	jmp	$L1165
$L1194:
; Line 639
$L1189:
	jmp	$L1187
$L1188:
; Line 642
$L1184:
	sub	eax, eax
	jmp	$L1165
; Line 643
$L1165:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_expand_unop ENDP
_TEXT	ENDS
PUBLIC	_emit_unop_insn
EXTRN	_emit_move_insn:NEAR
_TEXT	SEGMENT
_icode$ = 8
_target$ = 12
_op0$ = 16
_code$ = 20
_temp$ = -12
_mode0$ = -8
_insn$ = -16
_prev_insn$ = -4
_emit_unop_insn PROC NEAR
; Line 657
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 659
	mov	eax, DWORD PTR _icode$[ebp]
	mov	ecx, eax
	shl	eax, 3
	sub	eax, ecx
	mov	eax, DWORD PTR _insn_operand_mode[eax*4+4]
	mov	DWORD PTR _mode0$[ebp], eax
; Line 663
	push	1
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	call	_protect_from_queue
	add	esp, 8
	mov	DWORD PTR _target$[ebp], eax
	mov	eax, DWORD PTR _target$[ebp]
	mov	DWORD PTR _temp$[ebp], eax
; Line 665
	push	0
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	call	_protect_from_queue
	add	esp, 8
	mov	DWORD PTR _op0$[ebp], eax
; Line 667
	cmp	DWORD PTR _flag_force_mem, 0
	je	$L1205
; Line 668
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	call	_force_not_mem
	add	esp, 4
	mov	DWORD PTR _op0$[ebp], eax
; Line 672
$L1205:
	mov	eax, DWORD PTR _mode0$[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _icode$[ebp]
	mov	ecx, eax
	shl	eax, 3
	sub	eax, ecx
	call	DWORD PTR _insn_operand_predicate[eax*4+4]
	add	esp, 8
	or	eax, eax
	jne	$L1206
; Line 673
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode0$[ebp]
	push	eax
	call	_force_reg
	add	esp, 8
	mov	DWORD PTR _op0$[ebp], eax
; Line 675
$L1206:
; Line 676
	mov	eax, DWORD PTR _temp$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	mov	eax, DWORD PTR _icode$[ebp]
	mov	ecx, eax
	shl	eax, 3
	sub	eax, ecx
	call	DWORD PTR _insn_operand_predicate[eax*4]
	add	esp, 8
	or	eax, eax
	je	$L1208
	cmp	DWORD PTR _flag_force_mem, 0
	je	$L1207
	mov	eax, DWORD PTR _temp$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1207
$L1208:
; Line 677
	mov	eax, DWORD PTR _temp$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	call	_gen_reg_rtx
	add	esp, 4
	mov	DWORD PTR _temp$[ebp], eax
; Line 679
$L1207:
	call	_get_last_insn
	mov	DWORD PTR _prev_insn$[ebp], eax
; Line 680
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	mov	eax, DWORD PTR _icode$[ebp]
	call	DWORD PTR _insn_gen_function[eax*4]
	add	esp, 8
	push	eax
	call	_emit_insn
	add	esp, 4
	mov	DWORD PTR _insn$[ebp], eax
; Line 685
	cmp	DWORD PTR _code$[ebp], 0
	je	$L1209
	mov	eax, DWORD PTR _insn$[ebp]
	mov	ecx, DWORD PTR _prev_insn$[ebp]
	cmp	DWORD PTR [eax+8], ecx
	je	$L1209
; Line 689
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	mov	eax, DWORD PTR _code$[ebp]
	push	eax
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	push	5
	push	2
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 691
$L1209:
	mov	eax, DWORD PTR _target$[ebp]
	cmp	DWORD PTR _temp$[ebp], eax
	je	$L1210
; Line 692
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	call	_emit_move_insn
	add	esp, 8
; Line 693
$L1210:
$L1200:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_emit_unop_insn ENDP
_TEXT	ENDS
PUBLIC	_emit_clr_insn
EXTRN	_const0_rtx:DWORD
_TEXT	SEGMENT
_x$ = 8
_emit_clr_insn PROC NEAR
; Line 700
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 701
	mov	eax, DWORD PTR _const0_rtx
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_emit_move_insn
	add	esp, 8
; Line 702
$L1212:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_emit_clr_insn ENDP
_TEXT	ENDS
PUBLIC	_emit_0_to_1_insn
EXTRN	_const1_rtx:DWORD
_TEXT	SEGMENT
_x$ = 8
_emit_0_to_1_insn PROC NEAR
; Line 710
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 711
	mov	eax, DWORD PTR _const1_rtx
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_emit_move_insn
	add	esp, 8
; Line 712
$L1214:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_emit_0_to_1_insn ENDP
_TEXT	ENDS
PUBLIC	_emit_cmp_insn
EXTRN	_abort:NEAR
EXTRN	_fconst0_rtx:DWORD
EXTRN	_dconst0_rtx:DWORD
EXTRN	_emit_queue:NEAR
_DATA	SEGMENT
$SG1229	DB	'memcmp', 00H
_DATA	ENDS
_TEXT	SEGMENT
_y$ = 12
_size$ = 16
_unsignedp$ = 20
_align$ = 24
_mode$ = -4
_class$ = -8
_wider_mode$ = -12
_icode$1231 = -16
_icode$1234 = -20
_string$1244 = -24
_x$ = 8
_emit_cmp_insn PROC NEAR
; Line 729
	push	ebp
	mov	ebp, esp
	sub	esp, 28					; 0000001cH
	push	ebx
	push	esi
	push	edi
; Line 730
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	mov	DWORD PTR _mode$[ebp], eax
; Line 734
	cmp	DWORD PTR _mode$[ebp], 0
	jne	$L1224
	mov	eax, DWORD PTR _y$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	mov	DWORD PTR _mode$[ebp], eax
; Line 740
$L1224:
	mov	eax, DWORD PTR _mode$[ebp]
	mov	eax, DWORD PTR _mode_class[eax*4]
	mov	DWORD PTR _class$[ebp], eax
; Line 742
	cmp	DWORD PTR _mode$[ebp], 26		; 0000001aH
	je	$L1225
	cmp	DWORD PTR _flag_force_mem, 0
	je	$L1225
; Line 744
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_force_not_mem
	add	esp, 4
	mov	DWORD PTR _x$[ebp], eax
; Line 745
	mov	eax, DWORD PTR _y$[ebp]
	push	eax
	call	_force_not_mem
	add	esp, 4
	mov	DWORD PTR _y$[ebp], eax
; Line 750
$L1225:
	cmp	DWORD PTR _mode$[ebp], 26		; 0000001aH
	jne	$L1226
; Line 752
	call	_emit_queue
; Line 753
	push	0
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_protect_from_queue
	add	esp, 8
	mov	DWORD PTR _x$[ebp], eax
; Line 754
	push	0
	mov	eax, DWORD PTR _y$[ebp]
	push	eax
	call	_protect_from_queue
	add	esp, 8
	mov	DWORD PTR _y$[ebp], eax
; Line 756
	cmp	DWORD PTR _size$[ebp], 0
	jne	$L1227
; Line 757
	call	_abort
; Line 780
$L1227:
; Line 785
	push	4
	mov	eax, DWORD PTR _size$[ebp]
	push	eax
	push	4
	mov	eax, DWORD PTR _y$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	4
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	3
	push	4
	push	0
	push	OFFSET $SG1229
	push	4
	push	39					; 00000027H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	call	_emit_library_call
	add	esp, 40					; 00000028H
; Line 792
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _const0_rtx
	push	eax
	push	4
	call	_hard_libcall_value
	add	esp, 4
	push	eax
	call	_emit_cmp_insn
	add	esp, 20					; 00000014H
; Line 794
	jmp	$L1220
; Line 799
$L1226:
; Line 800
	cmp	DWORD PTR _mode$[ebp], 10		; 0000000aH
	jne	$L1531
	mov	eax, DWORD PTR _fconst0_rtx
	mov	DWORD PTR -28+[ebp], eax
	jmp	$L1532
$L1531:
	cmp	DWORD PTR _mode$[ebp], 11		; 0000000bH
	jne	$L1533
	mov	eax, DWORD PTR _dconst0_rtx
	mov	DWORD PTR -28+[ebp], eax
	jmp	$L1534
$L1533:
	mov	eax, DWORD PTR _mode$[ebp]
	cmp	DWORD PTR _mode_class[eax*4], 1
	jne	$L1535
	mov	eax, DWORD PTR _const0_rtx
	mov	DWORD PTR -28+[ebp], eax
	jmp	$L1536
$L1535:
	call	_abort
	mov	DWORD PTR -28+[ebp], 0
$L1536:
$L1534:
$L1532:
	mov	eax, DWORD PTR -28+[ebp]
	cmp	DWORD PTR _y$[ebp], eax
	jne	$L1230
	mov	eax, DWORD PTR _mode$[ebp]
	mov	ecx, DWORD PTR _tst_optab
	cmp	DWORD PTR [ecx+eax*8+4], 142		; 0000008eH
	je	$L1230
; Line 802
	mov	eax, DWORD PTR _mode$[ebp]
	mov	ecx, DWORD PTR _tst_optab
	mov	eax, DWORD PTR [ecx+eax*8+4]
	mov	DWORD PTR _icode$1231[ebp], eax
; Line 804
	call	_emit_queue
; Line 805
	push	0
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_protect_from_queue
	add	esp, 8
	mov	DWORD PTR _x$[ebp], eax
; Line 806
	push	0
	mov	eax, DWORD PTR _y$[ebp]
	push	eax
	call	_protect_from_queue
	add	esp, 8
	mov	DWORD PTR _y$[ebp], eax
; Line 810
	mov	eax, DWORD PTR _icode$1231[ebp]
	mov	ecx, eax
	shl	eax, 3
	sub	eax, ecx
	mov	eax, DWORD PTR _insn_operand_mode[eax*4]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	mov	eax, DWORD PTR _icode$1231[ebp]
	mov	ecx, eax
	shl	eax, 3
	sub	eax, ecx
	call	DWORD PTR _insn_operand_predicate[eax*4]
	add	esp, 8
	or	eax, eax
	jne	$L1232
; Line 811
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	mov	eax, DWORD PTR _icode$1231[ebp]
	mov	ecx, eax
	shl	eax, 3
	sub	eax, ecx
	mov	eax, DWORD PTR _insn_operand_mode[eax*4]
	push	eax
	call	_force_reg
	add	esp, 8
	mov	DWORD PTR _x$[ebp], eax
; Line 813
$L1232:
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	mov	eax, DWORD PTR _icode$1231[ebp]
	call	DWORD PTR _insn_gen_function[eax*4]
	add	esp, 4
	push	eax
	call	_emit_insn
	add	esp, 4
; Line 814
	jmp	$L1220
; Line 819
$L1230:
	mov	eax, DWORD PTR _mode$[ebp]
	mov	ecx, DWORD PTR _cmp_optab
	cmp	DWORD PTR [ecx+eax*8+4], 142		; 0000008eH
	je	$L1233
; Line 821
	mov	eax, DWORD PTR _mode$[ebp]
	mov	ecx, DWORD PTR _cmp_optab
	mov	eax, DWORD PTR [ecx+eax*8+4]
	mov	DWORD PTR _icode$1234[ebp], eax
; Line 823
	call	_emit_queue
; Line 824
	push	0
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_protect_from_queue
	add	esp, 8
	mov	DWORD PTR _x$[ebp], eax
; Line 825
	push	0
	mov	eax, DWORD PTR _y$[ebp]
	push	eax
	call	_protect_from_queue
	add	esp, 8
	mov	DWORD PTR _y$[ebp], eax
; Line 829
	mov	eax, DWORD PTR _icode$1234[ebp]
	mov	ecx, eax
	shl	eax, 3
	sub	eax, ecx
	mov	eax, DWORD PTR _insn_operand_mode[eax*4]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	mov	eax, DWORD PTR _icode$1234[ebp]
	mov	ecx, eax
	shl	eax, 3
	sub	eax, ecx
	call	DWORD PTR _insn_operand_predicate[eax*4]
	add	esp, 8
	or	eax, eax
	jne	$L1235
; Line 830
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	mov	eax, DWORD PTR _icode$1234[ebp]
	mov	ecx, eax
	shl	eax, 3
	sub	eax, ecx
	mov	eax, DWORD PTR _insn_operand_mode[eax*4]
	push	eax
	call	_force_reg
	add	esp, 8
	mov	DWORD PTR _x$[ebp], eax
; Line 832
$L1235:
; Line 833
	mov	eax, DWORD PTR _icode$1234[ebp]
	mov	ecx, eax
	shl	eax, 3
	sub	eax, ecx
	mov	eax, DWORD PTR _insn_operand_mode[eax*4+4]
	push	eax
	mov	eax, DWORD PTR _y$[ebp]
	push	eax
	mov	eax, DWORD PTR _icode$1234[ebp]
	mov	ecx, eax
	shl	eax, 3
	sub	eax, ecx
	call	DWORD PTR _insn_operand_predicate[eax*4+4]
	add	esp, 8
	or	eax, eax
	jne	$L1236
; Line 834
	mov	eax, DWORD PTR _y$[ebp]
	push	eax
	mov	eax, DWORD PTR _icode$1234[ebp]
	mov	ecx, eax
	shl	eax, 3
	sub	eax, ecx
	mov	eax, DWORD PTR _insn_operand_mode[eax*4+4]
	push	eax
	call	_force_reg
	add	esp, 8
	mov	DWORD PTR _y$[ebp], eax
; Line 836
$L1236:
	mov	eax, DWORD PTR _y$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	mov	eax, DWORD PTR _icode$1234[ebp]
	call	DWORD PTR _insn_gen_function[eax*4]
	add	esp, 8
	push	eax
	call	_emit_insn
	add	esp, 4
; Line 837
	jmp	$L1220
; Line 842
$L1233:
	cmp	DWORD PTR _class$[ebp], 1
	je	$L1238
	cmp	DWORD PTR _class$[ebp], 2
	jne	$L1237
$L1238:
; Line 847
	mov	eax, DWORD PTR _mode$[ebp]
	inc	eax
	mov	DWORD PTR _wider_mode$[ebp], eax
	jmp	$L1239
$L1240:
	inc	DWORD PTR _wider_mode$[ebp]
$L1239:
	cmp	DWORD PTR _wider_mode$[ebp], 28		; 0000001cH
	jge	$L1241
	mov	eax, DWORD PTR _wider_mode$[ebp]
	mov	ecx, DWORD PTR _class$[ebp]
	cmp	DWORD PTR _mode_class[eax*4], ecx
	jne	$L1241
; Line 850
	mov	eax, DWORD PTR _wider_mode$[ebp]
	mov	ecx, DWORD PTR _cmp_optab
	cmp	DWORD PTR [ecx+eax*8+4], 142		; 0000008eH
	je	$L1242
; Line 852
	mov	eax, DWORD PTR _unsignedp$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	mov	eax, DWORD PTR _wider_mode$[ebp]
	push	eax
	call	_convert_to_mode
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _x$[ebp], eax
; Line 853
	mov	eax, DWORD PTR _unsignedp$[ebp]
	push	eax
	mov	eax, DWORD PTR _y$[ebp]
	push	eax
	mov	eax, DWORD PTR _wider_mode$[ebp]
	push	eax
	call	_convert_to_mode
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _y$[ebp], eax
; Line 854
	mov	eax, DWORD PTR _align$[ebp]
	push	eax
	mov	eax, DWORD PTR _unsignedp$[ebp]
	push	eax
	push	0
	mov	eax, DWORD PTR _y$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_emit_cmp_insn
	add	esp, 20					; 00000014H
; Line 855
	jmp	$L1220
; Line 857
$L1242:
	jmp	$L1240
$L1241:
; Line 862
$L1237:
	mov	eax, DWORD PTR _mode$[ebp]
	mov	ecx, DWORD PTR _cmp_optab
	cmp	DWORD PTR [ecx+eax*8+8], 0
	je	$L1243
; Line 864
	mov	eax, DWORD PTR _mode$[ebp]
	mov	ecx, DWORD PTR _cmp_optab
	mov	eax, DWORD PTR [ecx+eax*8+8]
	mov	DWORD PTR _string$1244[ebp], eax
; Line 867
	cmp	DWORD PTR _unsignedp$[ebp], 0
	je	$L1245
	mov	eax, DWORD PTR _mode$[ebp]
	mov	ecx, DWORD PTR _ucmp_optab
	cmp	DWORD PTR [ecx+eax*8+8], 0
	je	$L1245
; Line 868
	mov	eax, DWORD PTR _mode$[ebp]
	mov	ecx, DWORD PTR _ucmp_optab
	mov	eax, DWORD PTR [ecx+eax*8+8]
	mov	DWORD PTR _string$1244[ebp], eax
; Line 870
$L1245:
; Line 871
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	mov	eax, DWORD PTR _y$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	push	2
	push	4
	push	0
	mov	eax, DWORD PTR _string$1244[ebp]
	push	eax
	push	4
	push	39					; 00000027H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	call	_emit_library_call
	add	esp, 32					; 00000020H
; Line 876
	mov	eax, DWORD PTR _mode$[ebp]
	cmp	DWORD PTR _mode_class[eax*4], 1
	jne	$L1246
; Line 877
	push	0
	mov	eax, DWORD PTR _unsignedp$[ebp]
	push	eax
	push	0
	mov	eax, DWORD PTR _const1_rtx
	push	eax
	push	4
	call	_hard_libcall_value
	add	esp, 4
	push	eax
	call	_emit_cmp_insn
	add	esp, 20					; 00000014H
; Line 878
	jmp	$L1247
$L1246:
; Line 879
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _const0_rtx
	push	eax
	push	4
	call	_hard_libcall_value
	add	esp, 4
	push	eax
	call	_emit_cmp_insn
	add	esp, 20					; 00000014H
$L1247:
; Line 880
	jmp	$L1220
; Line 885
$L1243:
	cmp	DWORD PTR _class$[ebp], 2
	jne	$L1248
; Line 890
	mov	eax, DWORD PTR _mode$[ebp]
	inc	eax
	mov	DWORD PTR _wider_mode$[ebp], eax
	jmp	$L1249
$L1250:
	inc	DWORD PTR _wider_mode$[ebp]
$L1249:
	cmp	DWORD PTR _wider_mode$[ebp], 28		; 0000001cH
	jge	$L1251
	mov	eax, DWORD PTR _wider_mode$[ebp]
	mov	ecx, DWORD PTR _class$[ebp]
	cmp	DWORD PTR _mode_class[eax*4], ecx
	jne	$L1251
; Line 894
	mov	eax, DWORD PTR _wider_mode$[ebp]
	mov	ecx, DWORD PTR _cmp_optab
	cmp	DWORD PTR [ecx+eax*8+4], 142		; 0000008eH
	jne	$L1253
	mov	eax, DWORD PTR _wider_mode$[ebp]
	mov	ecx, DWORD PTR _cmp_optab
	cmp	DWORD PTR [ecx+eax*8+8], 0
	je	$L1252
$L1253:
; Line 896
	mov	eax, DWORD PTR _unsignedp$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	mov	eax, DWORD PTR _wider_mode$[ebp]
	push	eax
	call	_convert_to_mode
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _x$[ebp], eax
; Line 897
	mov	eax, DWORD PTR _unsignedp$[ebp]
	push	eax
	mov	eax, DWORD PTR _y$[ebp]
	push	eax
	mov	eax, DWORD PTR _wider_mode$[ebp]
	push	eax
	call	_convert_to_mode
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _y$[ebp], eax
; Line 898
	mov	eax, DWORD PTR _align$[ebp]
	push	eax
	mov	eax, DWORD PTR _unsignedp$[ebp]
	push	eax
	push	0
	mov	eax, DWORD PTR _y$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_emit_cmp_insn
	add	esp, 20					; 00000014H
; Line 900
$L1252:
	jmp	$L1250
$L1251:
; Line 901
	jmp	$L1220
; Line 904
$L1248:
	call	_abort
; Line 905
$L1220:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_emit_cmp_insn ENDP
_TEXT	ENDS
PUBLIC	_gen_add2_insn
_TEXT	SEGMENT
_x$ = 8
_y$ = 12
_gen_add2_insn PROC NEAR
; Line 919
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 921
	mov	eax, DWORD PTR _y$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 21					; 00000015H
	mov	ecx, DWORD PTR _add_optab
	mov	eax, DWORD PTR [eax+ecx+4]
	call	DWORD PTR _insn_gen_function[eax*4]
	add	esp, 12					; 0000000cH
	jmp	$L1256
; Line 922
$L1256:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_add2_insn ENDP
_TEXT	ENDS
PUBLIC	_have_add2_insn
_TEXT	SEGMENT
_mode$ = 8
_have_add2_insn PROC NEAR
; Line 927
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 928
	mov	eax, DWORD PTR _mode$[ebp]
	mov	ecx, DWORD PTR _add_optab
	mov	eax, DWORD PTR [ecx+eax*8+4]
	sub	eax, 142				; 0000008eH
	cmp	eax, 1
	sbb	eax, eax
	inc	eax
	jmp	$L1259
; Line 929
$L1259:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_have_add2_insn ENDP
_TEXT	ENDS
PUBLIC	_gen_sub2_insn
_TEXT	SEGMENT
_x$ = 8
_y$ = 12
_gen_sub2_insn PROC NEAR
; Line 936
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 938
	mov	eax, DWORD PTR _y$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 21					; 00000015H
	mov	ecx, DWORD PTR _sub_optab
	mov	eax, DWORD PTR [eax+ecx+4]
	call	DWORD PTR _insn_gen_function[eax*4]
	add	esp, 12					; 0000000cH
	jmp	$L1262
; Line 939
$L1262:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_sub2_insn ENDP
_TEXT	ENDS
PUBLIC	_have_sub2_insn
_TEXT	SEGMENT
_mode$ = 8
_have_sub2_insn PROC NEAR
; Line 944
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 945
	mov	eax, DWORD PTR _mode$[ebp]
	mov	ecx, DWORD PTR _add_optab
	mov	eax, DWORD PTR [ecx+eax*8+4]
	sub	eax, 142				; 0000008eH
	cmp	eax, 1
	sbb	eax, eax
	inc	eax
	jmp	$L1265
; Line 946
$L1265:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_have_sub2_insn ENDP
_TEXT	ENDS
PUBLIC	_gen_move_insn
_TEXT	SEGMENT
_x$ = 8
_y$ = 12
_mode$ = -4
_gen_move_insn PROC NEAR
; Line 953
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 954
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	mov	DWORD PTR _mode$[ebp], eax
; Line 955
	cmp	DWORD PTR _mode$[ebp], 0
	jne	$L1270
; Line 956
	mov	eax, DWORD PTR _y$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	mov	DWORD PTR _mode$[ebp], eax
; Line 957
$L1270:
	mov	eax, DWORD PTR _y$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	mov	ecx, DWORD PTR _mov_optab
	mov	eax, DWORD PTR [ecx+eax*8+4]
	call	DWORD PTR _insn_gen_function[eax*4]
	add	esp, 8
	jmp	$L1268
; Line 958
$L1268:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_move_insn ENDP
_TEXT	ENDS
_BSS	SEGMENT
_fixtab$S1271 DD 08H DUP (?)
_fixtrunctab$S1272 DD 08H DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
_fixmode$ = 8
_fltmode$ = 12
_unsignedp$ = 16
_truncp_ptr$ = 20
_can_fix_p PROC NEAR
; Line 1011
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1012
	mov	eax, DWORD PTR _truncp_ptr$[ebp]
	mov	DWORD PTR [eax], 0
; Line 1014
	mov	eax, DWORD PTR _fixmode$[ebp]
	sub	eax, 6
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	mov	ecx, DWORD PTR _fltmode$[ebp]
	sub	ecx, 10					; 0000000aH
	cmp	ecx, 1
	sbb	ecx, ecx
	inc	ecx
	shl	ecx, 4
	lea	eax, DWORD PTR [ecx+eax*8]
	mov	ecx, DWORD PTR _unsignedp$[ebp]
	cmp	DWORD PTR _fixtrunctab$S1272[eax+ecx*4], 142 ; 0000008eH
	je	$L1280
; Line 1015
	mov	eax, DWORD PTR _fixmode$[ebp]
	sub	eax, 6
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	mov	ecx, DWORD PTR _fltmode$[ebp]
	sub	ecx, 10					; 0000000aH
	cmp	ecx, 1
	sbb	ecx, ecx
	inc	ecx
	shl	ecx, 4
	lea	eax, DWORD PTR [ecx+eax*8]
	mov	ecx, DWORD PTR _unsignedp$[ebp]
	mov	eax, DWORD PTR _fixtrunctab$S1272[eax+ecx*4]
	jmp	$L1279
; Line 1016
$L1280:
	mov	eax, DWORD PTR _fltmode$[ebp]
	mov	ecx, DWORD PTR _ftrunc_optab
	cmp	DWORD PTR [ecx+eax*8+4], 142		; 0000008eH
	je	$L1281
; Line 1018
	mov	eax, DWORD PTR _truncp_ptr$[ebp]
	mov	DWORD PTR [eax], 1
; Line 1019
	mov	eax, DWORD PTR _fixmode$[ebp]
	sub	eax, 6
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	mov	ecx, DWORD PTR _fltmode$[ebp]
	sub	ecx, 10					; 0000000aH
	cmp	ecx, 1
	sbb	ecx, ecx
	inc	ecx
	shl	ecx, 4
	lea	eax, DWORD PTR [ecx+eax*8]
	mov	ecx, DWORD PTR _unsignedp$[ebp]
	mov	eax, DWORD PTR _fixtab$S1271[eax+ecx*4]
	jmp	$L1279
; Line 1021
$L1281:
	mov	eax, 142				; 0000008eH
	jmp	$L1279
; Line 1022
$L1279:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_can_fix_p ENDP
_TEXT	ENDS
_BSS	SEGMENT
_floattab$S1273 DD 04H DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
_fltmode$ = 8
_fixmode$ = 12
_can_float_p PROC NEAR
; Line 1027
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1028
	mov	eax, DWORD PTR _fltmode$[ebp]
	sub	eax, 10					; 0000000aH
	cmp	eax, 1
	sbb	eax, eax
	mov	ecx, DWORD PTR _fixmode$[ebp]
	sub	ecx, 6
	cmp	ecx, 1
	sbb	ecx, ecx
	neg	ecx
	shl	ecx, 2
	mov	eax, DWORD PTR _floattab$S1273[ecx+eax*8+8]
	jmp	$L1285
; Line 1029
$L1285:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_can_float_p ENDP
_TEXT	ENDS
PUBLIC	_init_fixtab
_TEXT	SEGMENT
_p$ = -4
_init_fixtab PROC NEAR
; Line 1033
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 1037
	mov	DWORD PTR _p$[ebp], OFFSET _fixtab$S1271
	jmp	$L1288
$L1289:
	add	DWORD PTR _p$[ebp], 4
$L1288:
	mov	eax, OFFSET _fixtab$S1271
	add	eax, 32					; 00000020H
	cmp	eax, DWORD PTR _p$[ebp]
	jbe	$L1290
; Line 1038
	mov	eax, DWORD PTR _p$[ebp]
	mov	DWORD PTR [eax], 142			; 0000008eH
	jmp	$L1289
$L1290:
; Line 1041
	mov	DWORD PTR _p$[ebp], OFFSET _fixtrunctab$S1272
	jmp	$L1291
$L1292:
	add	DWORD PTR _p$[ebp], 4
$L1291:
	mov	eax, OFFSET _fixtrunctab$S1272
	add	eax, 32					; 00000020H
	cmp	eax, DWORD PTR _p$[ebp]
	jbe	$L1293
; Line 1042
	mov	eax, DWORD PTR _p$[ebp]
	mov	DWORD PTR [eax], 142			; 0000008eH
	jmp	$L1292
$L1293:
; Line 1123
$L1286:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_init_fixtab ENDP
_TEXT	ENDS
PUBLIC	_init_floattab
EXTRN	_target_flags:DWORD
_TEXT	SEGMENT
_p$ = -4
_init_floattab PROC NEAR
; Line 1127
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 1131
	mov	DWORD PTR _p$[ebp], OFFSET _floattab$S1273
	jmp	$L1296
$L1297:
	add	DWORD PTR _p$[ebp], 4
$L1296:
	mov	eax, OFFSET _floattab$S1273
	add	eax, 16					; 00000010H
	cmp	eax, DWORD PTR _p$[ebp]
	jbe	$L1298
; Line 1132
	mov	eax, DWORD PTR _p$[ebp]
	mov	DWORD PTR [eax], 142			; 0000008eH
	jmp	$L1297
$L1298:
; Line 1135
	test	BYTE PTR _target_flags, 1
	je	$L1299
; Line 1136
	mov	DWORD PTR _floattab$S1273, 40		; 00000028H
; Line 1143
$L1299:
	test	BYTE PTR _target_flags, 1
	je	$L1300
; Line 1144
	mov	DWORD PTR _floattab$S1273+8, 41		; 00000029H
; Line 1150
$L1300:
$L1294:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_init_floattab ENDP
_TEXT	ENDS
PUBLIC	_expand_float
EXTRN	_mode_size:BYTE
EXTRN	__fltused:NEAR
EXTRN	_gen_bge:NEAR
EXTRN	_gen_label_rtx:NEAR
EXTRN	_immed_real_const_1:NEAR
EXTRN	_do_pending_stack_adjust:NEAR
EXTRN	_emit_jump_insn:NEAR
EXTRN	_emit_label:NEAR
EXTRN	_ldexp:NEAR
_DATA	SEGMENT
	ORG $+1
$SG1323	DB	'__floatsidf', 00H
$SG1324	DB	'__floatdidf', 00H
_DATA	ENDS
CONST	SEGMENT
$T1540	DQ	03ff0000000000000H		; 1
CONST	ENDS
_TEXT	SEGMENT
_real_to$ = 8
_from$ = 12
_unsignedp$ = 16
_icode$ = -4
_to$ = -8
_tem$1317 = -12
_label$1326 = -16
_temp$1327 = -28
_offset$1328 = -24
_expand_float PROC NEAR
; Line 1162
	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H
	push	ebx
	push	esi
	push	edi
; Line 1168
	mov	eax, DWORD PTR _from$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sub	ecx, ecx
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1307
; Line 1169
	call	_abort
; Line 1171
$L1307:
	push	1
	mov	eax, DWORD PTR _real_to$[ebp]
	push	eax
	call	_protect_from_queue
	add	esp, 8
	mov	DWORD PTR _real_to$[ebp], eax
	mov	eax, DWORD PTR _real_to$[ebp]
	mov	DWORD PTR _to$[ebp], eax
; Line 1172
	push	0
	mov	eax, DWORD PTR _from$[ebp]
	push	eax
	call	_protect_from_queue
	add	esp, 8
	mov	DWORD PTR _from$[ebp], eax
; Line 1174
	cmp	DWORD PTR _flag_force_mem, 0
	je	$L1308
; Line 1176
	mov	eax, DWORD PTR _from$[ebp]
	push	eax
	call	_force_not_mem
	add	esp, 4
	mov	DWORD PTR _from$[ebp], eax
; Line 1182
$L1308:
; Line 1183
	cmp	DWORD PTR _unsignedp$[ebp], 0
	je	$L1309
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1310
	mov	eax, DWORD PTR _to$[ebp]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jge	$L1309
$L1310:
; Line 1184
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	call	_gen_reg_rtx
	add	esp, 4
	mov	DWORD PTR _to$[ebp], eax
; Line 1190
$L1309:
; Line 1191
	mov	eax, DWORD PTR _from$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	call	_can_float_p
	add	esp, 8
	mov	DWORD PTR _icode$[ebp], eax
	cmp	DWORD PTR _icode$[ebp], 142		; 0000008eH
	je	$L1311
; Line 1193
	push	82					; 00000052H
	mov	eax, DWORD PTR _from$[ebp]
	push	eax
	mov	eax, DWORD PTR _to$[ebp]
	push	eax
	mov	eax, DWORD PTR _icode$[ebp]
	push	eax
	call	_emit_unop_insn
	add	esp, 16					; 00000010H
; Line 1195
	jmp	$L1312
$L1311:
; Line 1197
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 167772160				; 0a000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1313
	mov	eax, DWORD PTR _from$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	11					; 0000000bH
	call	_can_float_p
	add	esp, 8
	mov	DWORD PTR _icode$[ebp], eax
	cmp	DWORD PTR _icode$[ebp], 142		; 0000008eH
	je	$L1313
; Line 1199
	push	11					; 0000000bH
	call	_gen_reg_rtx
	add	esp, 4
	mov	DWORD PTR _to$[ebp], eax
; Line 1200
	push	82					; 00000052H
	mov	eax, DWORD PTR _from$[ebp]
	push	eax
	mov	eax, DWORD PTR _to$[ebp]
	push	eax
	mov	eax, DWORD PTR _icode$[ebp]
	push	eax
	call	_emit_unop_insn
	add	esp, 16					; 00000010H
; Line 1204
	jmp	$L1314
$L1313:
; Line 1206
	mov	eax, DWORD PTR _from$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 100663296				; 06000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L1315
	push	6
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	call	_can_float_p
	add	esp, 8
	cmp	eax, 142				; 0000008eH
	jne	$L1316
	push	6
	push	11					; 0000000bH
	call	_can_float_p
	add	esp, 8
	cmp	eax, 142				; 0000008eH
	je	$L1315
$L1316:
; Line 1208
	push	6
	call	_gen_reg_rtx
	add	esp, 4
	mov	DWORD PTR _tem$1317[ebp], eax
; Line 1209
	mov	eax, DWORD PTR _unsignedp$[ebp]
	push	eax
	mov	eax, DWORD PTR _from$[ebp]
	push	eax
	mov	eax, DWORD PTR _tem$1317[ebp]
	push	eax
	call	_convert_move
	add	esp, 12					; 0000000cH
; Line 1210
	mov	eax, DWORD PTR _tem$1317[ebp]
	mov	DWORD PTR _from$[ebp], eax
; Line 1213
	mov	DWORD PTR _unsignedp$[ebp], 0
; Line 1216
	mov	eax, DWORD PTR _from$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	call	_can_float_p
	add	esp, 8
	mov	DWORD PTR _icode$[ebp], eax
	cmp	DWORD PTR _icode$[ebp], 142		; 0000008eH
	je	$L1318
; Line 1218
	push	82					; 00000052H
	mov	eax, DWORD PTR _from$[ebp]
	push	eax
	mov	eax, DWORD PTR _to$[ebp]
	push	eax
	mov	eax, DWORD PTR _icode$[ebp]
	push	eax
	call	_emit_unop_insn
	add	esp, 16					; 00000010H
; Line 1220
	jmp	$L1319
$L1318:
; Line 1221
	push	6
	push	11					; 0000000bH
	call	_can_float_p
	add	esp, 8
	mov	DWORD PTR _icode$[ebp], eax
	cmp	DWORD PTR _icode$[ebp], 142		; 0000008eH
	je	$L1320
; Line 1223
	push	11					; 0000000bH
	call	_gen_reg_rtx
	add	esp, 4
	mov	DWORD PTR _to$[ebp], eax
; Line 1224
	push	82					; 00000052H
	mov	eax, DWORD PTR _from$[ebp]
	push	eax
	mov	eax, DWORD PTR _to$[ebp]
	push	eax
	mov	eax, DWORD PTR _icode$[ebp]
	push	eax
	call	_emit_unop_insn
	add	esp, 16					; 00000010H
; Line 1226
$L1320:
$L1319:
; Line 1229
	jmp	$L1321
$L1315:
; Line 1231
	mov	eax, DWORD PTR _from$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	ecx, DWORD PTR _mode_size+16
	cmp	DWORD PTR _mode_size[eax], ecx
	jge	$L1322
; Line 1233
	mov	eax, DWORD PTR _unsignedp$[ebp]
	push	eax
	mov	eax, DWORD PTR _from$[ebp]
	push	eax
	push	4
	call	_convert_to_mode
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _from$[ebp], eax
; Line 1234
	mov	DWORD PTR _unsignedp$[ebp], 0
; Line 1236
$L1322:
; Line 1239
	mov	eax, DWORD PTR _from$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	mov	eax, DWORD PTR _from$[ebp]
	push	eax
	push	1
	push	11					; 0000000bH
	push	0
	mov	eax, OFFSET $SG1323
	mov	ecx, DWORD PTR _from$[ebp]
	mov	ecx, DWORD PTR [ecx]
	shl	ecx, 8
	and	ecx, -16777216				; ff000000H
	mov	edx, 67108864				; 04000000H
	and	edx, -16777216				; ff000000H
	cmp	ecx, edx
	je	$L1539
	mov	eax, OFFSET $SG1324
$L1539:
	push	eax
	push	4
	push	39					; 00000027H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	call	_emit_library_call
	add	esp, 24					; 00000018H
; Line 1240
	push	11					; 0000000bH
	call	_hard_libcall_value
	add	esp, 4
	push	eax
	call	_copy_to_reg
	add	esp, 4
	mov	DWORD PTR _to$[ebp], eax
; Line 1241
$L1321:
$L1314:
$L1312:
; Line 1247
	cmp	DWORD PTR _unsignedp$[ebp], 0
	je	$L1325
; Line 1249
	call	_gen_label_rtx
	mov	DWORD PTR _label$1326[ebp], eax
; Line 1253
	call	_do_pending_stack_adjust
; Line 1255
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 184549376				; 0b000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1537
	mov	eax, DWORD PTR _dconst0_rtx
	mov	DWORD PTR -32+[ebp], eax
	jmp	$L1538
$L1537:
	mov	eax, DWORD PTR _fconst0_rtx
	mov	DWORD PTR -32+[ebp], eax
$L1538:
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR -32+[ebp]
	push	eax
	mov	eax, DWORD PTR _to$[ebp]
	push	eax
	call	_emit_cmp_insn
	add	esp, 20					; 00000014H
; Line 1256
	mov	eax, DWORD PTR _label$1326[ebp]
	push	eax
	call	_gen_bge
	add	esp, 4
	push	eax
	call	_emit_jump_insn
	add	esp, 4
; Line 1257
	mov	eax, DWORD PTR _from$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	shl	eax, 3
	push	eax
	mov	eax, DWORD PTR $T1540+4
	push	eax
	mov	eax, DWORD PTR $T1540
	push	eax
	call	_ldexp
	add	esp, 12					; 0000000cH
	fstp	QWORD PTR _offset$1328[ebp]
; Line 1260
	push	3
	push	0
	mov	eax, DWORD PTR _to$[ebp]
	push	eax
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	mov	eax, DWORD PTR _offset$1328[ebp+4]
	push	eax
	mov	eax, DWORD PTR _offset$1328[ebp]
	push	eax
	call	_immed_real_const_1
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _to$[ebp]
	push	eax
	mov	eax, DWORD PTR _add_optab
	push	eax
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	call	_expand_binop
	add	esp, 28					; 0000001cH
	mov	DWORD PTR _temp$1327[ebp], eax
; Line 1261
	mov	eax, DWORD PTR _to$[ebp]
	cmp	DWORD PTR _temp$1327[ebp], eax
	je	$L1330
; Line 1262
	mov	eax, DWORD PTR _temp$1327[ebp]
	push	eax
	mov	eax, DWORD PTR _to$[ebp]
	push	eax
	call	_emit_move_insn
	add	esp, 8
; Line 1263
$L1330:
	call	_do_pending_stack_adjust
; Line 1264
	mov	eax, DWORD PTR _label$1326[ebp]
	push	eax
	call	_emit_label
	add	esp, 4
; Line 1270
$L1325:
	mov	eax, DWORD PTR _real_to$[ebp]
	cmp	DWORD PTR _to$[ebp], eax
	je	$L1331
; Line 1272
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, DWORD PTR _real_to$[ebp]
	mov	ecx, DWORD PTR [ecx]
	shl	ecx, 8
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1332
; Line 1273
	mov	eax, DWORD PTR _to$[ebp]
	push	eax
	mov	eax, DWORD PTR _real_to$[ebp]
	push	eax
	call	_emit_move_insn
	add	esp, 8
; Line 1274
	jmp	$L1333
$L1332:
; Line 1275
	push	0
	mov	eax, DWORD PTR _to$[ebp]
	push	eax
	mov	eax, DWORD PTR _real_to$[ebp]
	push	eax
	call	_convert_move
	add	esp, 12					; 0000000cH
$L1333:
; Line 1277
$L1331:
$L1304:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_expand_float ENDP
_x$ = 8
_temp$ = -4
_ftruncify PROC NEAR
; Line 1285
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 1286
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	call	_gen_reg_rtx
	add	esp, 4
	mov	DWORD PTR _temp$[ebp], eax
; Line 1287
	push	0
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	mov	eax, DWORD PTR _ftrunc_optab
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	call	_expand_unop
	add	esp, 20					; 00000014H
	jmp	$L1336
; Line 1288
$L1336:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_ftruncify ENDP
_TEXT	ENDS
PUBLIC	_expand_fix
_DATA	SEGMENT
$SG1356	DB	'__fixunsdfsi', 00H
	ORG $+3
$SG1357	DB	'__fixdfsi', 00H
	ORG $+2
$SG1359	DB	'__fixunsdfdi', 00H
	ORG $+3
$SG1360	DB	'__fixdfdi', 00H
_DATA	ENDS
_TEXT	SEGMENT
_must_trunc$ = -8
_temp$1351 = -16
_to$ = 8
_from$ = 12
_unsignedp$ = 16
_icode$ = -4
_target$ = -12
_expand_fix PROC NEAR
; Line 1294
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 1297
	mov	DWORD PTR _must_trunc$[ebp], 0
; Line 1299
$L1346:
; Line 1301
	lea	eax, DWORD PTR _must_trunc$[ebp]
	push	eax
	mov	eax, DWORD PTR _unsignedp$[ebp]
	push	eax
	mov	eax, DWORD PTR _from$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	call	_can_fix_p
	add	esp, 16					; 00000010H
	mov	DWORD PTR _icode$[ebp], eax
; Line 1302
	cmp	DWORD PTR _icode$[ebp], 142		; 0000008eH
	je	$L1348
; Line 1304
	cmp	DWORD PTR _must_trunc$[ebp], 0
	je	$L1349
; Line 1305
	mov	eax, DWORD PTR _from$[ebp]
	push	eax
	call	_ftruncify
	add	esp, 4
	mov	DWORD PTR _from$[ebp], eax
; Line 1307
$L1349:
	push	83					; 00000053H
	mov	eax, DWORD PTR _from$[ebp]
	push	eax
	mov	eax, DWORD PTR _to$[ebp]
	push	eax
	mov	eax, DWORD PTR _icode$[ebp]
	push	eax
	call	_emit_unop_insn
	add	esp, 16					; 00000010H
; Line 1308
	jmp	$L1341
; Line 1352
$L1348:
	lea	eax, DWORD PTR _must_trunc$[ebp]
	push	eax
	mov	eax, DWORD PTR _unsignedp$[ebp]
	push	eax
	mov	eax, DWORD PTR _from$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	6
	call	_can_fix_p
	add	esp, 16					; 00000010H
	mov	DWORD PTR _icode$[ebp], eax
; Line 1354
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 100663296				; 06000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L1350
	cmp	DWORD PTR _icode$[ebp], 142		; 0000008eH
	je	$L1350
; Line 1356
	push	6
	call	_gen_reg_rtx
	add	esp, 4
	mov	DWORD PTR _temp$1351[ebp], eax
; Line 1358
	cmp	DWORD PTR _must_trunc$[ebp], 0
	je	$L1352
; Line 1359
	mov	eax, DWORD PTR _from$[ebp]
	push	eax
	call	_ftruncify
	add	esp, 4
	mov	DWORD PTR _from$[ebp], eax
; Line 1360
$L1352:
	push	83					; 00000053H
	mov	eax, DWORD PTR _from$[ebp]
	push	eax
	mov	eax, DWORD PTR _temp$1351[ebp]
	push	eax
	mov	eax, DWORD PTR _icode$[ebp]
	push	eax
	call	_emit_unop_insn
	add	esp, 16					; 00000010H
; Line 1361
	mov	eax, DWORD PTR _unsignedp$[ebp]
	push	eax
	mov	eax, DWORD PTR _temp$1351[ebp]
	push	eax
	mov	eax, DWORD PTR _to$[ebp]
	push	eax
	call	_convert_move
	add	esp, 12					; 0000000cH
; Line 1362
	jmp	$L1341
; Line 1366
$L1350:
	mov	eax, DWORD PTR _from$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 184549376				; 0b000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1353
; Line 1367
	jmp	$L1347
; Line 1369
$L1353:
	push	0
	mov	eax, DWORD PTR _from$[ebp]
	push	eax
	push	11					; 0000000bH
	call	_convert_to_mode
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _from$[ebp], eax
; Line 1370
	jmp	$L1346
$L1347:
; Line 1375
	push	1
	mov	eax, DWORD PTR _to$[ebp]
	push	eax
	call	_protect_from_queue
	add	esp, 8
	mov	DWORD PTR _to$[ebp], eax
; Line 1376
	push	0
	mov	eax, DWORD PTR _from$[ebp]
	push	eax
	call	_protect_from_queue
	add	esp, 8
	mov	DWORD PTR _from$[ebp], eax
; Line 1378
	cmp	DWORD PTR _flag_force_mem, 0
	je	$L1354
; Line 1379
	mov	eax, DWORD PTR _from$[ebp]
	push	eax
	call	_force_not_mem
	add	esp, 4
	mov	DWORD PTR _from$[ebp], eax
; Line 1381
$L1354:
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 100663296				; 06000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L1355
; Line 1386
	push	11					; 0000000bH
	mov	eax, DWORD PTR _from$[ebp]
	push	eax
	push	1
	push	4
	push	0
	mov	eax, OFFSET $SG1356
	cmp	DWORD PTR _unsignedp$[ebp], 0
	jne	$L1542
	mov	eax, OFFSET $SG1357
$L1542:
	push	eax
	push	4
	push	39					; 00000027H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	call	_emit_library_call
	add	esp, 24					; 00000018H
; Line 1387
	push	4
	call	_hard_libcall_value
	add	esp, 4
	mov	DWORD PTR _target$[ebp], eax
; Line 1389
	jmp	$L1358
$L1355:
; Line 1394
	push	11					; 0000000bH
	mov	eax, DWORD PTR _from$[ebp]
	push	eax
	push	1
	push	6
	push	0
	mov	eax, OFFSET $SG1359
	cmp	DWORD PTR _unsignedp$[ebp], 0
	jne	$L1543
	mov	eax, OFFSET $SG1360
$L1543:
	push	eax
	push	4
	push	39					; 00000027H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	call	_emit_library_call
	add	esp, 24					; 00000018H
; Line 1395
	push	6
	call	_hard_libcall_value
	add	esp, 4
	mov	DWORD PTR _target$[ebp], eax
; Line 1396
$L1358:
; Line 1398
	mov	eax, DWORD PTR _target$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, DWORD PTR _to$[ebp]
	mov	ecx, DWORD PTR [ecx]
	shl	ecx, 8
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1361
; Line 1399
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	mov	eax, DWORD PTR _to$[ebp]
	push	eax
	call	_emit_move_insn
	add	esp, 8
; Line 1400
	jmp	$L1362
$L1361:
; Line 1401
	push	0
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	mov	eax, DWORD PTR _to$[ebp]
	push	eax
	call	_convert_move
	add	esp, 12					; 0000000cH
$L1362:
; Line 1402
$L1341:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_expand_fix ENDP
_TEXT	ENDS
EXTRN	_malloc:NEAR
_TEXT	SEGMENT
_code$ = 8
_i$ = -4
_op$ = -8
_init_optab PROC NEAR
; Line 1407
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 1409
	push	228					; 000000e4H
	call	_malloc
	add	esp, 4
	mov	DWORD PTR _op$[ebp], eax
; Line 1410
	mov	eax, DWORD PTR _code$[ebp]
	mov	ecx, DWORD PTR _op$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 1411
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L1369
$L1370:
	inc	DWORD PTR _i$[ebp]
$L1369:
	cmp	DWORD PTR _i$[ebp], 28			; 0000001cH
	jge	$L1371
; Line 1413
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _op$[ebp]
	mov	DWORD PTR [ecx+eax*8+4], 142		; 0000008eH
; Line 1414
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _op$[ebp]
	mov	DWORD PTR [ecx+eax*8+8], 0
; Line 1415
	jmp	$L1370
$L1371:
; Line 1416
	mov	eax, DWORD PTR _op$[ebp]
	jmp	$L1365
; Line 1417
$L1365:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_init_optab ENDP
_TEXT	ENDS
PUBLIC	_init_optabs
EXTRN	_gen_seq:NEAR
EXTRN	_gen_sne:NEAR
EXTRN	_gen_sgt:NEAR
EXTRN	_gen_sgtu:NEAR
EXTRN	_gen_slt:NEAR
EXTRN	_gen_sltu:NEAR
EXTRN	_gen_sge:NEAR
EXTRN	_gen_sgeu:NEAR
EXTRN	_gen_sle:NEAR
EXTRN	_gen_sleu:NEAR
EXTRN	_gen_beq:NEAR
EXTRN	_gen_bne:NEAR
EXTRN	_gen_bgt:NEAR
EXTRN	_gen_bgtu:NEAR
EXTRN	_gen_blt:NEAR
EXTRN	_gen_bltu:NEAR
EXTRN	_gen_bgeu:NEAR
EXTRN	_gen_ble:NEAR
EXTRN	_gen_bleu:NEAR
EXTRN	_init_comparisons:NEAR
_DATA	SEGMENT
	ORG $+2
$SG1380	DB	'__adddi3', 00H
	ORG $+3
$SG1381	DB	'__addsf3', 00H
	ORG $+3
$SG1382	DB	'__adddf3', 00H
	ORG $+3
$SG1388	DB	'__subdi3', 00H
	ORG $+3
$SG1389	DB	'__subsf3', 00H
	ORG $+3
$SG1390	DB	'__subdf3', 00H
	ORG $+3
$SG1395	DB	'__mulsi3', 00H
	ORG $+3
$SG1396	DB	'__muldi3', 00H
	ORG $+3
$SG1397	DB	'__mulsf3', 00H
	ORG $+3
$SG1398	DB	'__muldf3', 00H
	ORG $+3
$SG1401	DB	'__umulsi3', 00H
	ORG $+2
$SG1402	DB	'__umuldi3', 00H
	ORG $+2
$SG1403	DB	'__umulsf3', 00H
	ORG $+2
$SG1404	DB	'__umuldf3', 00H
	ORG $+2
$SG1405	DB	'__divsi3', 00H
	ORG $+3
$SG1406	DB	'__divdi3', 00H
	ORG $+3
$SG1407	DB	'__udivsi3', 00H
	ORG $+2
$SG1408	DB	'__udivdi3', 00H
	ORG $+2
$SG1411	DB	'__modsi3', 00H
	ORG $+3
$SG1412	DB	'__moddi3', 00H
	ORG $+3
$SG1413	DB	'__umodsi3', 00H
	ORG $+2
$SG1414	DB	'__umoddi3', 00H
	ORG $+2
$SG1417	DB	'__divsf3', 00H
	ORG $+3
$SG1418	DB	'__divdf3', 00H
	ORG $+3
$SG1422	DB	'__anddi3', 00H
	ORG $+3
$SG1423	DB	'__andcbdi3', 00H
	ORG $+1
$SG1427	DB	'__iordi3', 00H
	ORG $+3
$SG1431	DB	'__xordi3', 00H
	ORG $+3
$SG1435	DB	'__ashlsi3', 00H
	ORG $+2
$SG1436	DB	'__ashldi3', 00H
	ORG $+2
$SG1440	DB	'__ashrsi3', 00H
	ORG $+2
$SG1441	DB	'__ashrdi3', 00H
	ORG $+2
$SG1445	DB	'__lshlsi3', 00H
	ORG $+2
$SG1446	DB	'__lshldi3', 00H
	ORG $+2
$SG1450	DB	'__lshrsi3', 00H
	ORG $+2
$SG1451	DB	'__lshrdi3', 00H
	ORG $+2
$SG1455	DB	'__rotlsi3', 00H
	ORG $+2
$SG1456	DB	'__rotldi3', 00H
	ORG $+2
$SG1460	DB	'__rotrsi3', 00H
	ORG $+2
$SG1461	DB	'__rotrdi3', 00H
	ORG $+2
$SG1467	DB	'__negsi2', 00H
	ORG $+3
$SG1468	DB	'__negdi2', 00H
	ORG $+3
$SG1469	DB	'__negsf2', 00H
	ORG $+3
$SG1470	DB	'__negdf2', 00H
	ORG $+3
$SG1476	DB	'__one_cmplsi2', 00H
	ORG $+2
$SG1477	DB	'__one_cmpldi2', 00H
	ORG $+2
$SG1478	DB	'ffs', 00H
$SG1495	DB	'__cmpdi2', 00H
	ORG $+3
$SG1496	DB	'__ucmpdi2', 00H
	ORG $+2
$SG1497	DB	'__cmpsf2', 00H
	ORG $+3
$SG1498	DB	'__cmpdf2', 00H
_DATA	ENDS
_TEXT	SEGMENT
_init_optabs PROC NEAR
; Line 1424
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1425
	call	_init_fixtab
; Line 1426
	call	_init_floattab
; Line 1427
	call	_init_comparisons
; Line 1430
	push	44					; 0000002cH
	call	_init_optab
	add	esp, 4
	mov	DWORD PTR _add_optab, eax
; Line 1431
	push	45					; 0000002dH
	call	_init_optab
	add	esp, 4
	mov	DWORD PTR _sub_optab, eax
; Line 1432
	push	47					; 0000002fH
	call	_init_optab
	add	esp, 4
	mov	DWORD PTR _smul_optab, eax
; Line 1433
	push	50					; 00000032H
	call	_init_optab
	add	esp, 4
	mov	DWORD PTR _umul_optab, eax
; Line 1434
	push	47					; 0000002fH
	call	_init_optab
	add	esp, 4
	mov	DWORD PTR _smul_widen_optab, eax
; Line 1435
	push	50					; 00000032H
	call	_init_optab
	add	esp, 4
	mov	DWORD PTR _umul_widen_optab, eax
; Line 1436
	push	48					; 00000030H
	call	_init_optab
	add	esp, 4
	mov	DWORD PTR _sdiv_optab, eax
; Line 1437
	push	0
	call	_init_optab
	add	esp, 4
	mov	DWORD PTR _sdivmod_optab, eax
; Line 1438
	push	51					; 00000033H
	call	_init_optab
	add	esp, 4
	mov	DWORD PTR _udiv_optab, eax
; Line 1439
	push	0
	call	_init_optab
	add	esp, 4
	mov	DWORD PTR _udivmod_optab, eax
; Line 1440
	push	49					; 00000031H
	call	_init_optab
	add	esp, 4
	mov	DWORD PTR _smod_optab, eax
; Line 1441
	push	52					; 00000034H
	call	_init_optab
	add	esp, 4
	mov	DWORD PTR _umod_optab, eax
; Line 1442
	push	48					; 00000030H
	call	_init_optab
	add	esp, 4
	mov	DWORD PTR _flodiv_optab, eax
; Line 1443
	push	0
	call	_init_optab
	add	esp, 4
	mov	DWORD PTR _ftrunc_optab, eax
; Line 1444
	push	53					; 00000035H
	call	_init_optab
	add	esp, 4
	mov	DWORD PTR _and_optab, eax
; Line 1445
	push	0
	call	_init_optab
	add	esp, 4
	mov	DWORD PTR _andcb_optab, eax
; Line 1446
	push	54					; 00000036H
	call	_init_optab
	add	esp, 4
	mov	DWORD PTR _ior_optab, eax
; Line 1447
	push	55					; 00000037H
	call	_init_optab
	add	esp, 4
	mov	DWORD PTR _xor_optab, eax
; Line 1448
	push	58					; 0000003aH
	call	_init_optab
	add	esp, 4
	mov	DWORD PTR _ashl_optab, eax
; Line 1449
	push	60					; 0000003cH
	call	_init_optab
	add	esp, 4
	mov	DWORD PTR _ashr_optab, eax
; Line 1450
	push	57					; 00000039H
	call	_init_optab
	add	esp, 4
	mov	DWORD PTR _lshl_optab, eax
; Line 1451
	push	61					; 0000003dH
	call	_init_optab
	add	esp, 4
	mov	DWORD PTR _lshr_optab, eax
; Line 1452
	push	59					; 0000003bH
	call	_init_optab
	add	esp, 4
	mov	DWORD PTR _rotl_optab, eax
; Line 1453
	push	62					; 0000003eH
	call	_init_optab
	add	esp, 4
	mov	DWORD PTR _rotr_optab, eax
; Line 1454
	push	0
	call	_init_optab
	add	esp, 4
	mov	DWORD PTR _mov_optab, eax
; Line 1455
	push	0
	call	_init_optab
	add	esp, 4
	mov	DWORD PTR _movstrict_optab, eax
; Line 1456
	push	0
	call	_init_optab
	add	esp, 4
	mov	DWORD PTR _cmp_optab, eax
; Line 1457
	push	0
	call	_init_optab
	add	esp, 4
	mov	DWORD PTR _ucmp_optab, eax
; Line 1458
	push	0
	call	_init_optab
	add	esp, 4
	mov	DWORD PTR _tst_optab, eax
; Line 1459
	push	46					; 0000002eH
	call	_init_optab
	add	esp, 4
	mov	DWORD PTR _neg_optab, eax
; Line 1460
	push	86					; 00000056H
	call	_init_optab
	add	esp, 4
	mov	DWORD PTR _abs_optab, eax
; Line 1461
	push	56					; 00000038H
	call	_init_optab
	add	esp, 4
	mov	DWORD PTR _one_cmpl_optab, eax
; Line 1462
	push	88					; 00000058H
	call	_init_optab
	add	esp, 4
	mov	DWORD PTR _ffs_optab, eax
; Line 1466
	mov	eax, DWORD PTR _add_optab
	mov	DWORD PTR [eax+12], 46			; 0000002eH
; Line 1469
$L1375:
; Line 1470
	mov	eax, DWORD PTR _add_optab
	mov	DWORD PTR [eax+20], 44			; 0000002cH
; Line 1473
$L1376:
; Line 1474
	mov	eax, DWORD PTR _add_optab
	mov	DWORD PTR [eax+36], 42			; 0000002aH
; Line 1481
$L1377:
	test	BYTE PTR _target_flags, 1
	je	$L1378
; Line 1482
	mov	eax, DWORD PTR _add_optab
	mov	DWORD PTR [eax+84], 48			; 00000030H
; Line 1485
$L1378:
	test	BYTE PTR _target_flags, 1
	je	$L1379
; Line 1486
	mov	eax, DWORD PTR _add_optab
	mov	DWORD PTR [eax+92], 47			; 0000002fH
; Line 1488
$L1379:
	mov	eax, DWORD PTR _add_optab
	mov	DWORD PTR [eax+56], OFFSET $SG1380
; Line 1489
	mov	eax, DWORD PTR _add_optab
	mov	DWORD PTR [eax+88], OFFSET $SG1381
; Line 1490
	mov	eax, DWORD PTR _add_optab
	mov	DWORD PTR [eax+96], OFFSET $SG1382
; Line 1494
	mov	eax, DWORD PTR _sub_optab
	mov	DWORD PTR [eax+12], 53			; 00000035H
; Line 1497
$L1383:
; Line 1498
	mov	eax, DWORD PTR _sub_optab
	mov	DWORD PTR [eax+20], 51			; 00000033H
; Line 1501
$L1384:
; Line 1502
	mov	eax, DWORD PTR _sub_optab
	mov	DWORD PTR [eax+36], 49			; 00000031H
; Line 1509
$L1385:
	test	BYTE PTR _target_flags, 1
	je	$L1386
; Line 1510
	mov	eax, DWORD PTR _sub_optab
	mov	DWORD PTR [eax+84], 55			; 00000037H
; Line 1513
$L1386:
	test	BYTE PTR _target_flags, 1
	je	$L1387
; Line 1514
	mov	eax, DWORD PTR _sub_optab
	mov	DWORD PTR [eax+92], 54			; 00000036H
; Line 1516
$L1387:
	mov	eax, DWORD PTR _sub_optab
	mov	DWORD PTR [eax+56], OFFSET $SG1388
; Line 1517
	mov	eax, DWORD PTR _sub_optab
	mov	DWORD PTR [eax+88], OFFSET $SG1389
; Line 1518
	mov	eax, DWORD PTR _sub_optab
	mov	DWORD PTR [eax+96], OFFSET $SG1390
; Line 1526
	mov	eax, DWORD PTR _smul_optab
	mov	DWORD PTR [eax+20], 56			; 00000038H
; Line 1529
$L1391:
; Line 1530
	mov	eax, DWORD PTR _smul_optab
	mov	DWORD PTR [eax+36], 57			; 00000039H
; Line 1537
$L1392:
	test	BYTE PTR _target_flags, 1
	je	$L1393
; Line 1538
	mov	eax, DWORD PTR _smul_optab
	mov	DWORD PTR [eax+84], 61			; 0000003dH
; Line 1541
$L1393:
	test	BYTE PTR _target_flags, 1
	je	$L1394
; Line 1542
	mov	eax, DWORD PTR _smul_optab
	mov	DWORD PTR [eax+92], 60			; 0000003cH
; Line 1548
$L1394:
	mov	eax, DWORD PTR _smul_optab
	mov	DWORD PTR [eax+40], OFFSET $SG1395
; Line 1550
	mov	eax, DWORD PTR _smul_optab
	mov	DWORD PTR [eax+56], OFFSET $SG1396
; Line 1551
	mov	eax, DWORD PTR _smul_optab
	mov	DWORD PTR [eax+88], OFFSET $SG1397
; Line 1552
	mov	eax, DWORD PTR _smul_optab
	mov	DWORD PTR [eax+96], OFFSET $SG1398
; Line 1573
	mov	eax, DWORD PTR _umul_optab
	mov	DWORD PTR [eax+20], 58			; 0000003aH
; Line 1576
$L1399:
; Line 1577
	mov	eax, DWORD PTR _umul_optab
	mov	DWORD PTR [eax+36], 59			; 0000003bH
; Line 1595
$L1400:
	mov	eax, DWORD PTR _umul_optab
	mov	DWORD PTR [eax+40], OFFSET $SG1401
; Line 1597
	mov	eax, DWORD PTR _umul_optab
	mov	DWORD PTR [eax+56], OFFSET $SG1402
; Line 1598
	mov	eax, DWORD PTR _umul_optab
	mov	DWORD PTR [eax+88], OFFSET $SG1403
; Line 1599
	mov	eax, DWORD PTR _umul_optab
	mov	DWORD PTR [eax+96], OFFSET $SG1404
; Line 1634
	mov	eax, DWORD PTR _sdiv_optab
	mov	DWORD PTR [eax+40], OFFSET $SG1405
; Line 1636
	mov	eax, DWORD PTR _sdiv_optab
	mov	DWORD PTR [eax+56], OFFSET $SG1406
; Line 1658
	mov	eax, DWORD PTR _udiv_optab
	mov	DWORD PTR [eax+40], OFFSET $SG1407
; Line 1660
	mov	eax, DWORD PTR _udiv_optab
	mov	DWORD PTR [eax+56], OFFSET $SG1408
; Line 1672
	mov	eax, DWORD PTR _sdivmod_optab
	mov	DWORD PTR [eax+36], 64			; 00000040H
; Line 1688
$L1409:
; Line 1689
	mov	eax, DWORD PTR _udivmod_optab
	mov	DWORD PTR [eax+36], 65			; 00000041H
; Line 1716
$L1410:
	mov	eax, DWORD PTR _smod_optab
	mov	DWORD PTR [eax+40], OFFSET $SG1411
; Line 1718
	mov	eax, DWORD PTR _smod_optab
	mov	DWORD PTR [eax+56], OFFSET $SG1412
; Line 1740
	mov	eax, DWORD PTR _umod_optab
	mov	DWORD PTR [eax+40], OFFSET $SG1413
; Line 1742
	mov	eax, DWORD PTR _umod_optab
	mov	DWORD PTR [eax+56], OFFSET $SG1414
; Line 1745
	test	BYTE PTR _target_flags, 1
	je	$L1415
; Line 1746
	mov	eax, DWORD PTR _flodiv_optab
	mov	DWORD PTR [eax+84], 63			; 0000003fH
; Line 1749
$L1415:
	test	BYTE PTR _target_flags, 1
	je	$L1416
; Line 1750
	mov	eax, DWORD PTR _flodiv_optab
	mov	DWORD PTR [eax+92], 62			; 0000003eH
; Line 1752
$L1416:
	mov	eax, DWORD PTR _flodiv_optab
	mov	DWORD PTR [eax+88], OFFSET $SG1417
; Line 1753
	mov	eax, DWORD PTR _flodiv_optab
	mov	DWORD PTR [eax+96], OFFSET $SG1418
; Line 1766
	mov	eax, DWORD PTR _and_optab
	mov	DWORD PTR [eax+12], 70			; 00000046H
; Line 1769
$L1419:
; Line 1770
	mov	eax, DWORD PTR _and_optab
	mov	DWORD PTR [eax+20], 69			; 00000045H
; Line 1773
$L1420:
; Line 1774
	mov	eax, DWORD PTR _and_optab
	mov	DWORD PTR [eax+36], 68			; 00000044H
; Line 1780
$L1421:
	mov	eax, DWORD PTR _and_optab
	mov	DWORD PTR [eax+56], OFFSET $SG1422
; Line 1798
	mov	eax, DWORD PTR _andcb_optab
	mov	DWORD PTR [eax+56], OFFSET $SG1423
; Line 1802
	mov	eax, DWORD PTR _ior_optab
	mov	DWORD PTR [eax+12], 73			; 00000049H
; Line 1805
$L1424:
; Line 1806
	mov	eax, DWORD PTR _ior_optab
	mov	DWORD PTR [eax+20], 72			; 00000048H
; Line 1809
$L1425:
; Line 1810
	mov	eax, DWORD PTR _ior_optab
	mov	DWORD PTR [eax+36], 71			; 00000047H
; Line 1816
$L1426:
	mov	eax, DWORD PTR _ior_optab
	mov	DWORD PTR [eax+56], OFFSET $SG1427
; Line 1820
	mov	eax, DWORD PTR _xor_optab
	mov	DWORD PTR [eax+12], 76			; 0000004cH
; Line 1823
$L1428:
; Line 1824
	mov	eax, DWORD PTR _xor_optab
	mov	DWORD PTR [eax+20], 75			; 0000004bH
; Line 1827
$L1429:
; Line 1828
	mov	eax, DWORD PTR _xor_optab
	mov	DWORD PTR [eax+36], 74			; 0000004aH
; Line 1834
$L1430:
	mov	eax, DWORD PTR _xor_optab
	mov	DWORD PTR [eax+56], OFFSET $SG1431
; Line 1838
	mov	eax, DWORD PTR _ashl_optab
	mov	DWORD PTR [eax+12], 89			; 00000059H
; Line 1841
$L1432:
; Line 1842
	mov	eax, DWORD PTR _ashl_optab
	mov	DWORD PTR [eax+20], 88			; 00000058H
; Line 1845
$L1433:
; Line 1846
	mov	eax, DWORD PTR _ashl_optab
	mov	DWORD PTR [eax+36], 87			; 00000057H
; Line 1852
$L1434:
	mov	eax, DWORD PTR _ashl_optab
	mov	DWORD PTR [eax+40], OFFSET $SG1435
; Line 1853
	mov	eax, DWORD PTR _ashl_optab
	mov	DWORD PTR [eax+56], OFFSET $SG1436
; Line 1857
	mov	eax, DWORD PTR _ashr_optab
	mov	DWORD PTR [eax+12], 92			; 0000005cH
; Line 1860
$L1437:
; Line 1861
	mov	eax, DWORD PTR _ashr_optab
	mov	DWORD PTR [eax+20], 91			; 0000005bH
; Line 1864
$L1438:
; Line 1865
	mov	eax, DWORD PTR _ashr_optab
	mov	DWORD PTR [eax+36], 90			; 0000005aH
; Line 1871
$L1439:
	mov	eax, DWORD PTR _ashr_optab
	mov	DWORD PTR [eax+40], OFFSET $SG1440
; Line 1872
	mov	eax, DWORD PTR _ashr_optab
	mov	DWORD PTR [eax+56], OFFSET $SG1441
; Line 1876
	mov	eax, DWORD PTR _lshl_optab
	mov	DWORD PTR [eax+12], 95			; 0000005fH
; Line 1879
$L1442:
; Line 1880
	mov	eax, DWORD PTR _lshl_optab
	mov	DWORD PTR [eax+20], 94			; 0000005eH
; Line 1883
$L1443:
; Line 1884
	mov	eax, DWORD PTR _lshl_optab
	mov	DWORD PTR [eax+36], 93			; 0000005dH
; Line 1890
$L1444:
	mov	eax, DWORD PTR _lshl_optab
	mov	DWORD PTR [eax+40], OFFSET $SG1445
; Line 1891
	mov	eax, DWORD PTR _lshl_optab
	mov	DWORD PTR [eax+56], OFFSET $SG1446
; Line 1895
	mov	eax, DWORD PTR _lshr_optab
	mov	DWORD PTR [eax+12], 98			; 00000062H
; Line 1898
$L1447:
; Line 1899
	mov	eax, DWORD PTR _lshr_optab
	mov	DWORD PTR [eax+20], 97			; 00000061H
; Line 1902
$L1448:
; Line 1903
	mov	eax, DWORD PTR _lshr_optab
	mov	DWORD PTR [eax+36], 96			; 00000060H
; Line 1909
$L1449:
	mov	eax, DWORD PTR _lshr_optab
	mov	DWORD PTR [eax+40], OFFSET $SG1450
; Line 1910
	mov	eax, DWORD PTR _lshr_optab
	mov	DWORD PTR [eax+56], OFFSET $SG1451
; Line 1914
	mov	eax, DWORD PTR _rotl_optab
	mov	DWORD PTR [eax+12], 101			; 00000065H
; Line 1917
$L1452:
; Line 1918
	mov	eax, DWORD PTR _rotl_optab
	mov	DWORD PTR [eax+20], 100			; 00000064H
; Line 1921
$L1453:
; Line 1922
	mov	eax, DWORD PTR _rotl_optab
	mov	DWORD PTR [eax+36], 99			; 00000063H
; Line 1928
$L1454:
	mov	eax, DWORD PTR _rotl_optab
	mov	DWORD PTR [eax+40], OFFSET $SG1455
; Line 1929
	mov	eax, DWORD PTR _rotl_optab
	mov	DWORD PTR [eax+56], OFFSET $SG1456
; Line 1933
	mov	eax, DWORD PTR _rotr_optab
	mov	DWORD PTR [eax+12], 104			; 00000068H
; Line 1936
$L1457:
; Line 1937
	mov	eax, DWORD PTR _rotr_optab
	mov	DWORD PTR [eax+20], 103			; 00000067H
; Line 1940
$L1458:
; Line 1941
	mov	eax, DWORD PTR _rotr_optab
	mov	DWORD PTR [eax+36], 102			; 00000066H
; Line 1947
$L1459:
	mov	eax, DWORD PTR _rotr_optab
	mov	DWORD PTR [eax+40], OFFSET $SG1460
; Line 1948
	mov	eax, DWORD PTR _rotr_optab
	mov	DWORD PTR [eax+56], OFFSET $SG1461
; Line 1952
	mov	eax, DWORD PTR _neg_optab
	mov	DWORD PTR [eax+12], 79			; 0000004fH
; Line 1955
$L1462:
; Line 1956
	mov	eax, DWORD PTR _neg_optab
	mov	DWORD PTR [eax+20], 78			; 0000004eH
; Line 1959
$L1463:
; Line 1960
	mov	eax, DWORD PTR _neg_optab
	mov	DWORD PTR [eax+36], 77			; 0000004dH
; Line 1967
$L1464:
	test	BYTE PTR _target_flags, 1
	je	$L1465
; Line 1968
	mov	eax, DWORD PTR _neg_optab
	mov	DWORD PTR [eax+84], 80			; 00000050H
; Line 1971
$L1465:
	test	BYTE PTR _target_flags, 1
	je	$L1466
; Line 1972
	mov	eax, DWORD PTR _neg_optab
	mov	DWORD PTR [eax+92], 81			; 00000051H
; Line 1974
$L1466:
	mov	eax, DWORD PTR _neg_optab
	mov	DWORD PTR [eax+40], OFFSET $SG1467
; Line 1975
	mov	eax, DWORD PTR _neg_optab
	mov	DWORD PTR [eax+56], OFFSET $SG1468
; Line 1976
	mov	eax, DWORD PTR _neg_optab
	mov	DWORD PTR [eax+88], OFFSET $SG1469
; Line 1977
	mov	eax, DWORD PTR _neg_optab
	mov	DWORD PTR [eax+96], OFFSET $SG1470
; Line 1996
	test	BYTE PTR _target_flags, 1
	je	$L1471
; Line 1997
	mov	eax, DWORD PTR _abs_optab
	mov	DWORD PTR [eax+84], 82			; 00000052H
; Line 2000
$L1471:
	test	BYTE PTR _target_flags, 1
	je	$L1472
; Line 2001
	mov	eax, DWORD PTR _abs_optab
	mov	DWORD PTR [eax+92], 83			; 00000053H
; Line 2007
$L1472:
; Line 2008
	mov	eax, DWORD PTR _one_cmpl_optab
	mov	DWORD PTR [eax+12], 86			; 00000056H
; Line 2011
$L1473:
; Line 2012
	mov	eax, DWORD PTR _one_cmpl_optab
	mov	DWORD PTR [eax+20], 85			; 00000055H
; Line 2015
$L1474:
; Line 2016
	mov	eax, DWORD PTR _one_cmpl_optab
	mov	DWORD PTR [eax+36], 84			; 00000054H
; Line 2022
$L1475:
	mov	eax, DWORD PTR _one_cmpl_optab
	mov	DWORD PTR [eax+40], OFFSET $SG1476
; Line 2023
	mov	eax, DWORD PTR _one_cmpl_optab
	mov	DWORD PTR [eax+56], OFFSET $SG1477
; Line 2041
	mov	eax, DWORD PTR _ffs_optab
	mov	DWORD PTR [eax+40], OFFSET $SG1478
; Line 2045
	mov	eax, DWORD PTR _mov_optab
	mov	DWORD PTR [eax+12], 18			; 00000012H
; Line 2048
$L1479:
; Line 2049
	mov	eax, DWORD PTR _mov_optab
	mov	DWORD PTR [eax+20], 16			; 00000010H
; Line 2052
$L1480:
; Line 2053
	mov	eax, DWORD PTR _mov_optab
	mov	DWORD PTR [eax+36], 14			; 0000000eH
; Line 2056
$L1481:
; Line 2057
	mov	eax, DWORD PTR _mov_optab
	mov	DWORD PTR [eax+52], 24			; 00000018H
; Line 2064
$L1482:
; Line 2065
	mov	eax, DWORD PTR _mov_optab
	mov	DWORD PTR [eax+84], 20			; 00000014H
; Line 2068
$L1483:
; Line 2069
	mov	eax, DWORD PTR _mov_optab
	mov	DWORD PTR [eax+92], 22			; 00000016H
; Line 2094
$L1484:
; Line 2095
	mov	eax, DWORD PTR _cmp_optab
	mov	DWORD PTR [eax+12], 7
; Line 2098
$L1485:
; Line 2099
	mov	eax, DWORD PTR _cmp_optab
	mov	DWORD PTR [eax+20], 6
; Line 2102
$L1486:
; Line 2103
	mov	eax, DWORD PTR _cmp_optab
	mov	DWORD PTR [eax+36], 5
; Line 2110
$L1487:
	test	BYTE PTR _target_flags, 1
	je	$L1488
; Line 2111
	mov	eax, DWORD PTR _cmp_optab
	mov	DWORD PTR [eax+84], 9
; Line 2114
$L1488:
	test	BYTE PTR _target_flags, 1
	je	$L1489
; Line 2115
	mov	eax, DWORD PTR _cmp_optab
	mov	DWORD PTR [eax+92], 8
; Line 2118
$L1489:
; Line 2119
	mov	eax, DWORD PTR _tst_optab
	mov	DWORD PTR [eax+12], 2
; Line 2122
$L1490:
; Line 2123
	mov	eax, DWORD PTR _tst_optab
	mov	DWORD PTR [eax+20], 1
; Line 2126
$L1491:
; Line 2127
	mov	eax, DWORD PTR _tst_optab
	mov	DWORD PTR [eax+36], 0
; Line 2134
$L1492:
	test	BYTE PTR _target_flags, 1
	je	$L1493
; Line 2135
	mov	eax, DWORD PTR _tst_optab
	mov	DWORD PTR [eax+84], 3
; Line 2138
$L1493:
	test	BYTE PTR _target_flags, 1
	je	$L1494
; Line 2139
	mov	eax, DWORD PTR _tst_optab
	mov	DWORD PTR [eax+92], 4
; Line 2142
$L1494:
	mov	eax, DWORD PTR _cmp_optab
	mov	DWORD PTR [eax+56], OFFSET $SG1495
; Line 2143
	mov	eax, DWORD PTR _ucmp_optab
	mov	DWORD PTR [eax+56], OFFSET $SG1496
; Line 2144
	mov	eax, DWORD PTR _cmp_optab
	mov	DWORD PTR [eax+88], OFFSET $SG1497
; Line 2145
	mov	eax, DWORD PTR _cmp_optab
	mov	DWORD PTR [eax+96], OFFSET $SG1498
; Line 2149
	mov	DWORD PTR _bcc_gen_fctn+272, OFFSET _gen_beq
; Line 2152
$L1499:
; Line 2153
	mov	DWORD PTR _bcc_gen_fctn+268, OFFSET _gen_bne
; Line 2156
$L1500:
; Line 2157
	mov	DWORD PTR _bcc_gen_fctn+280, OFFSET _gen_bgt
; Line 2160
$L1501:
; Line 2161
	mov	DWORD PTR _bcc_gen_fctn+276, OFFSET _gen_bge
; Line 2164
$L1502:
; Line 2165
	mov	DWORD PTR _bcc_gen_fctn+296, OFFSET _gen_bgtu
; Line 2168
$L1503:
; Line 2169
	mov	DWORD PTR _bcc_gen_fctn+292, OFFSET _gen_bgeu
; Line 2172
$L1504:
; Line 2173
	mov	DWORD PTR _bcc_gen_fctn+288, OFFSET _gen_blt
; Line 2176
$L1505:
; Line 2177
	mov	DWORD PTR _bcc_gen_fctn+284, OFFSET _gen_ble
; Line 2180
$L1506:
; Line 2181
	mov	DWORD PTR _bcc_gen_fctn+304, OFFSET _gen_bltu
; Line 2184
$L1507:
; Line 2185
	mov	DWORD PTR _bcc_gen_fctn+300, OFFSET _gen_bleu
; Line 2189
$L1508:
; Line 2190
	mov	DWORD PTR _setcc_gen_fctn+272, OFFSET _gen_seq
; Line 2193
$L1509:
; Line 2194
	mov	DWORD PTR _setcc_gen_fctn+268, OFFSET _gen_sne
; Line 2197
$L1510:
; Line 2198
	mov	DWORD PTR _setcc_gen_fctn+280, OFFSET _gen_sgt
; Line 2201
$L1511:
; Line 2202
	mov	DWORD PTR _setcc_gen_fctn+276, OFFSET _gen_sge
; Line 2205
$L1512:
; Line 2206
	mov	DWORD PTR _setcc_gen_fctn+296, OFFSET _gen_sgtu
; Line 2209
$L1513:
; Line 2210
	mov	DWORD PTR _setcc_gen_fctn+292, OFFSET _gen_sgeu
; Line 2213
$L1514:
; Line 2214
	mov	DWORD PTR _setcc_gen_fctn+288, OFFSET _gen_slt
; Line 2217
$L1515:
; Line 2218
	mov	DWORD PTR _setcc_gen_fctn+284, OFFSET _gen_sle
; Line 2221
$L1516:
; Line 2222
	mov	DWORD PTR _setcc_gen_fctn+304, OFFSET _gen_sltu
; Line 2225
$L1517:
; Line 2226
	mov	DWORD PTR _setcc_gen_fctn+300, OFFSET _gen_sleu
; Line 2228
$L1518:
$L1373:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_init_optabs ENDP
_TEXT	ENDS
END
