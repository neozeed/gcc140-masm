	TITLE	expr.c
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
PUBLIC	_do_preexpand_calls
_DATA	SEGMENT
COMM	_cse_not_expected:DWORD
COMM	_inhibit_defer_pop:DWORD
COMM	_pending_stack_adjust:DWORD
COMM	_may_call_alloca:DWORD
_do_preexpand_calls DD 01H
	ORG $+4
_comparison_code$S1078 DB 00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
_DATA	ENDS
PUBLIC	_init_comparisons
_TEXT	SEGMENT
; File expr.c
_init_comparisons PROC NEAR
; Line 131
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 132
	mov	BYTE PTR _comparison_code$S1078+106, 1
; Line 133
	mov	BYTE PTR _comparison_code$S1078+107, 1
; Line 134
	mov	BYTE PTR _comparison_code$S1078+102, 1
; Line 135
	mov	BYTE PTR _comparison_code$S1078+104, 1
; Line 136
	mov	BYTE PTR _comparison_code$S1078+103, 1
; Line 137
	mov	BYTE PTR _comparison_code$S1078+105, 1
; Line 138
$L1080:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_init_comparisons ENDP
_TEXT	ENDS
PUBLIC	_init_expr
_BSS	SEGMENT
_saveregs_value$S1061 DD 01H DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
_init_expr PROC NEAR
; Line 144
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 145
	call	_init_queue
; Line 146
	mov	DWORD PTR _may_call_alloca, 0
; Line 147
	mov	DWORD PTR _saveregs_value$S1061, 0
; Line 148
$L1082:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_init_expr ENDP
_TEXT	ENDS
EXTRN	_gen_rtx:NEAR
_BSS	SEGMENT
_pending_chain$S1083 DD 01H DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
_var$ = 8
_body$ = 12
_enqueue_insn PROC NEAR
; Line 165
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 167
	mov	eax, DWORD PTR _pending_chain$S1083
	push	eax
	mov	eax, DWORD PTR _body$[ebp]
	push	eax
	push	0
	push	0
	mov	eax, DWORD PTR _var$[ebp]
	push	eax
	mov	eax, DWORD PTR _var$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	41					; 00000029H
	call	_gen_rtx
	add	esp, 28					; 0000001cH
	mov	DWORD PTR _pending_chain$S1083, eax
; Line 168
	mov	eax, DWORD PTR _pending_chain$S1083
	jmp	$L1087
; Line 169
$L1087:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_enqueue_insn ENDP
_TEXT	ENDS
PUBLIC	_protect_from_queue
EXTRN	_gen_move_insn:NEAR
EXTRN	_gen_reg_rtx:NEAR
EXTRN	_emit_insn_before:NEAR
_TEXT	SEGMENT
_x$ = 8
_modify$ = 12
_code$ = -4
_y$1094 = -8
_temp$1096 = -12
_protect_from_queue PROC NEAR
; Line 190
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 191
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$[ebp], eax
; Line 192
	cmp	DWORD PTR _code$[ebp], 41		; 00000029H
	je	$L1092
; Line 198
	cmp	DWORD PTR _code$[ebp], 37		; 00000025H
	jne	$L1093
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2686976				; 00290000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1093
	cmp	DWORD PTR _modify$[ebp], 0
	jne	$L1093
; Line 200
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _y$1094[ebp], eax
; Line 201
	mov	eax, DWORD PTR _y$1094[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 202
	mov	eax, DWORD PTR _y$1094[ebp]
	cmp	DWORD PTR [eax+8], 0
	je	$L1095
; Line 204
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	call	_gen_reg_rtx
	add	esp, 4
	mov	DWORD PTR _temp$1096[ebp], eax
; Line 206
	mov	eax, DWORD PTR _y$1094[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	mov	eax, DWORD PTR _temp$1096[ebp]
	push	eax
	call	_gen_move_insn
	add	esp, 8
	push	eax
	call	_emit_insn_before
	add	esp, 8
; Line 207
	mov	eax, DWORD PTR _temp$1096[ebp]
	jmp	$L1090
; Line 209
$L1095:
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L1090
; Line 213
$L1093:
	cmp	DWORD PTR _code$[ebp], 37		; 00000025H
	jne	$L1097
; Line 214
	push	0
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_protect_from_queue
	add	esp, 8
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 215
	jmp	$L1098
$L1097:
	cmp	DWORD PTR _code$[ebp], 44		; 0000002cH
	je	$L1100
	cmp	DWORD PTR _code$[ebp], 47		; 0000002fH
	jne	$L1099
$L1100:
; Line 217
	push	0
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_protect_from_queue
	add	esp, 8
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 218
	push	0
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_protect_from_queue
	add	esp, 8
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 220
$L1099:
$L1098:
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L1090
; Line 223
$L1092:
	mov	eax, DWORD PTR _x$[ebp]
	cmp	DWORD PTR [eax+8], 0
	jne	$L1101
; Line 224
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	jmp	$L1090
; Line 227
$L1101:
	mov	eax, DWORD PTR _x$[ebp]
	cmp	DWORD PTR [eax+12], 0
	je	$L1102
; Line 228
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+12]
	jmp	$L1090
; Line 231
$L1102:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	call	_gen_reg_rtx
	add	esp, 4
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [ecx+12], eax
; Line 233
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+12]
	push	eax
	call	_gen_move_insn
	add	esp, 8
	push	eax
	call	_emit_insn_before
	add	esp, 8
; Line 234
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+12]
	jmp	$L1090
; Line 235
$L1090:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_protect_from_queue ENDP
_x$ = 8
_code$ = -4
_queued_subexp_p PROC NEAR
; Line 245
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 246
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$[ebp], eax
; Line 247
	mov	eax, DWORD PTR _code$[ebp]
	mov	DWORD PTR -8+[ebp], eax
	jmp	$L1107
; Line 249
$L1111:
; Line 250
	mov	eax, 1
	jmp	$L1105
; Line 251
$L1112:
; Line 252
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_queued_subexp_p
	add	esp, 4
	jmp	$L1105
; Line 253
$L1113:
; Line 257
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_queued_subexp_p
	add	esp, 4
	or	eax, eax
	jne	$L2485
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_queued_subexp_p
	add	esp, 4
	or	eax, eax
	je	$L2483
$L2485:
	mov	eax, 1
	jmp	$L2484
$L2483:
	sub	eax, eax
$L2484:
	jmp	$L1105
; Line 258
	jmp	$L1108
$L1107:
	cmp	DWORD PTR -8+[ebp], 37			; 00000025H
	je	$L1112
	cmp	DWORD PTR -8+[ebp], 41			; 00000029H
	je	$L1111
	cmp	DWORD PTR -8+[ebp], 44			; 0000002cH
	jl	$L1108
	cmp	DWORD PTR -8+[ebp], 45			; 0000002dH
	jle	$L1113
	cmp	DWORD PTR -8+[ebp], 47			; 0000002fH
	je	$L1113
	jmp	$L1108
$L1108:
; Line 259
	sub	eax, eax
	jmp	$L1105
; Line 260
$L1105:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_queued_subexp_p ENDP
_TEXT	ENDS
PUBLIC	_emit_queue
EXTRN	_emit_insn:NEAR
_TEXT	SEGMENT
_p$ = -4
_emit_queue PROC NEAR
; Line 266
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 268
$L1117:
	mov	eax, DWORD PTR _pending_chain$S1083
	mov	DWORD PTR _p$[ebp], eax
	cmp	DWORD PTR _p$[ebp], 0
	je	$L1118
; Line 270
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_emit_insn
	add	esp, 4
	mov	ecx, DWORD PTR _p$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 271
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _pending_chain$S1083, eax
; Line 272
	jmp	$L1117
$L1118:
; Line 273
$L1114:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_emit_queue ENDP
_TEXT	ENDS
EXTRN	_abort:NEAR
_TEXT	SEGMENT
_init_queue PROC NEAR
; Line 277
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 278
	cmp	DWORD PTR _pending_chain$S1083, 0
	je	$L1120
; Line 279
	call	_abort
; Line 280
$L1120:
$L1119:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_init_queue ENDP
_TEXT	ENDS
PUBLIC	_convert_move
PUBLIC	_emit_library_call
PUBLIC	_emit_move_insn
EXTRN	_mode_size:BYTE
EXTRN	_mode_dependent_address_p:NEAR
EXTRN	_gen_slt:NEAR
EXTRN	_insn_operand_mode:BYTE
EXTRN	_expand_unop:NEAR
EXTRN	_insn_operand_predicate:BYTE
EXTRN	_const0_rtx:DWORD
EXTRN	_emit_clr_insn:NEAR
EXTRN	_gen_bge:NEAR
EXTRN	_emit_cmp_insn:NEAR
EXTRN	_gen_label_rtx:NEAR
EXTRN	_gen_lowpart:NEAR
EXTRN	_gen_highpart:NEAR
EXTRN	_target_flags:DWORD
EXTRN	_hard_libcall_value:NEAR
EXTRN	_emit_unop_insn:NEAR
EXTRN	_emit_jump_insn:NEAR
EXTRN	_emit_label:NEAR
EXTRN	_one_cmpl_optab:DWORD
EXTRN	_mode_class:BYTE
_DATA	SEGMENT
	ORG $+3
$SG1139	DB	'__extendsfdf2', 00H
	ORG $+2
$SG1140	DB	'__truncdfsf2', 00H
_DATA	ENDS
_TEXT	SEGMENT
_temp$1152 = -32
_target$1153 = -40
_temp$1171 = -44
_temp$1175 = -48
_to$ = 8
_from$ = 12
_unsignedp$ = 16
_to_mode$ = -20
_from_mode$ = -16
_to_real$ = -12
_from_real$ = -8
_extending$ = -4
_temp$1145 = -24
_target$1146 = -28
_label$1151 = -36
_convert_move PROC NEAR
; Line 291
	push	ebp
	mov	ebp, esp
	sub	esp, 48					; 00000030H
	push	ebx
	push	esi
	push	edi
; Line 292
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	mov	DWORD PTR _to_mode$[ebp], eax
; Line 293
	mov	eax, DWORD PTR _from$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	mov	DWORD PTR _from_mode$[ebp], eax
; Line 294
	mov	eax, DWORD PTR _to_mode$[ebp]
	mov	eax, DWORD PTR _mode_class[eax*4]
	sub	eax, 2
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	mov	DWORD PTR _to_real$[ebp], eax
; Line 295
	mov	eax, DWORD PTR _from_mode$[ebp]
	mov	eax, DWORD PTR _mode_class[eax*4]
	sub	eax, 2
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	mov	DWORD PTR _from_real$[ebp], eax
; Line 296
	mov	eax, DWORD PTR _to_mode$[ebp]
	cmp	DWORD PTR _from_mode$[ebp], eax
	mov	eax, 0
	setl	al
	mov	DWORD PTR _extending$[ebp], eax
; Line 298
	push	1
	mov	eax, DWORD PTR _to$[ebp]
	push	eax
	call	_protect_from_queue
	add	esp, 8
	mov	DWORD PTR _to$[ebp], eax
; Line 299
	push	0
	mov	eax, DWORD PTR _from$[ebp]
	push	eax
	call	_protect_from_queue
	add	esp, 8
	mov	DWORD PTR _from$[ebp], eax
; Line 301
	mov	eax, DWORD PTR _to_real$[ebp]
	cmp	DWORD PTR _from_real$[ebp], eax
	je	$L1131
; Line 302
	call	_abort
; Line 304
$L1131:
; Line 305
	mov	eax, DWORD PTR _to_mode$[ebp]
	cmp	DWORD PTR _from_mode$[ebp], eax
	je	$L1133
	cmp	DWORD PTR _from_mode$[ebp], 0
	jne	$L1132
	mov	eax, DWORD PTR _from$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1134
	mov	eax, DWORD PTR _from$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1134
	mov	eax, DWORD PTR _from$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1134
	mov	eax, DWORD PTR _from$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1132
$L1134:
$L1133:
; Line 307
	mov	eax, DWORD PTR _from$[ebp]
	push	eax
	mov	eax, DWORD PTR _to$[ebp]
	push	eax
	call	_emit_move_insn
	add	esp, 8
; Line 308
	jmp	$L1125
; Line 311
$L1132:
	cmp	DWORD PTR _to_real$[ebp], 0
	je	$L1135
; Line 314
	test	BYTE PTR _target_flags, 1
	je	$L1136
	cmp	DWORD PTR _extending$[ebp], 0
	je	$L1136
; Line 316
	push	0
	mov	eax, DWORD PTR _from$[ebp]
	push	eax
	mov	eax, DWORD PTR _to$[ebp]
	push	eax
	push	38					; 00000026H
	call	_emit_unop_insn
	add	esp, 16					; 00000010H
; Line 317
	jmp	$L1125
; Line 321
$L1136:
	test	BYTE PTR _target_flags, 1
	je	$L1138
	cmp	DWORD PTR _extending$[ebp], 0
	jne	$L1138
; Line 323
	push	0
	mov	eax, DWORD PTR _from$[ebp]
	push	eax
	mov	eax, DWORD PTR _to$[ebp]
	push	eax
	push	39					; 00000027H
	call	_emit_unop_insn
	add	esp, 16					; 00000010H
; Line 324
	jmp	$L1125
; Line 327
$L1138:
; Line 331
	cmp	DWORD PTR _extending$[ebp], 1
	sbb	eax, eax
	and	eax, 1
	add	eax, 10					; 0000000aH
	push	eax
	mov	eax, DWORD PTR _from$[ebp]
	push	eax
	push	1
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	0
	mov	eax, OFFSET $SG1139
	cmp	DWORD PTR _extending$[ebp], 0
	jne	$L2486
	mov	eax, OFFSET $SG1140
$L2486:
	push	eax
	push	4
	push	39					; 00000027H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	call	_emit_library_call
	add	esp, 24					; 00000018H
; Line 332
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	call	_hard_libcall_value
	add	esp, 4
	push	eax
	mov	eax, DWORD PTR _to$[ebp]
	push	eax
	call	_emit_move_insn
	add	esp, 8
; Line 333
	jmp	$L1125
; Line 338
$L1135:
	cmp	DWORD PTR _to_mode$[ebp], 6
	jne	$L1141
; Line 340
	cmp	DWORD PTR _unsignedp$[ebp], 0
	je	$L1142
; Line 367
	mov	eax, DWORD PTR _to$[ebp]
	push	eax
	push	0
	push	27					; 0000001bH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	call	_emit_insn
	add	esp, 4
; Line 368
	mov	eax, DWORD PTR _unsignedp$[ebp]
	push	eax
	mov	eax, DWORD PTR _from$[ebp]
	push	eax
	mov	eax, DWORD PTR _to$[ebp]
	push	eax
	push	4
	call	_gen_lowpart
	add	esp, 8
	push	eax
	call	_convert_move
	add	esp, 12					; 0000000cH
; Line 369
	mov	eax, DWORD PTR _to$[ebp]
	push	eax
	push	4
	call	_gen_highpart
	add	esp, 8
	push	eax
	call	_emit_clr_insn
	add	esp, 4
; Line 393
	jmp	$L1143
$L1142:
	cmp	DWORD PTR _insn_operand_mode+3052, 4
	jne	$L1144
; Line 396
	mov	eax, DWORD PTR _to$[ebp]
	push	eax
	push	0
	push	27					; 0000001bH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	call	_emit_insn
	add	esp, 4
; Line 397
	mov	eax, DWORD PTR _unsignedp$[ebp]
	push	eax
	mov	eax, DWORD PTR _from$[ebp]
	push	eax
	mov	eax, DWORD PTR _to$[ebp]
	push	eax
	push	4
	call	_gen_lowpart
	add	esp, 8
	push	eax
	call	_convert_move
	add	esp, 12					; 0000000cH
; Line 398
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _const0_rtx
	push	eax
	mov	eax, DWORD PTR _to$[ebp]
	push	eax
	push	4
	call	_gen_lowpart
	add	esp, 8
	push	eax
	call	_emit_cmp_insn
	add	esp, 20					; 00000014H
; Line 399
	mov	eax, DWORD PTR _to$[ebp]
	push	eax
	push	4
	call	_gen_highpart
	add	esp, 8
	mov	DWORD PTR _target$1146[ebp], eax
; Line 400
	push	4
	mov	eax, DWORD PTR _target$1146[ebp]
	push	eax
	call	DWORD PTR _insn_operand_predicate+3052
	add	esp, 8
	or	eax, eax
	jne	$L1147
; Line 401
	push	4
	call	_gen_reg_rtx
	add	esp, 4
	mov	DWORD PTR _temp$1145[ebp], eax
; Line 402
	jmp	$L1148
$L1147:
; Line 403
	mov	eax, DWORD PTR _target$1146[ebp]
	mov	DWORD PTR _temp$1145[ebp], eax
$L1148:
; Line 404
	mov	eax, DWORD PTR _temp$1145[ebp]
	push	eax
	call	_gen_slt
	add	esp, 4
	push	eax
	call	_emit_insn
	add	esp, 4
; Line 405
	mov	eax, DWORD PTR _temp$1145[ebp]
	cmp	DWORD PTR _target$1146[ebp], eax
	je	$L1149
; Line 406
	mov	eax, DWORD PTR _temp$1145[ebp]
	push	eax
	mov	eax, DWORD PTR _target$1146[ebp]
	push	eax
	call	_emit_move_insn
	add	esp, 8
; Line 407
$L1149:
; Line 409
	jmp	$L1150
$L1144:
; Line 411
	call	_gen_label_rtx
	mov	DWORD PTR _label$1151[ebp], eax
; Line 414
	mov	eax, DWORD PTR _to$[ebp]
	push	eax
	push	0
	push	27					; 0000001bH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	call	_emit_insn
	add	esp, 4
; Line 415
	mov	eax, DWORD PTR _to$[ebp]
	push	eax
	push	4
	call	_gen_highpart
	add	esp, 8
	push	eax
	call	_emit_clr_insn
	add	esp, 4
; Line 416
	mov	eax, DWORD PTR _unsignedp$[ebp]
	push	eax
	mov	eax, DWORD PTR _from$[ebp]
	push	eax
	mov	eax, DWORD PTR _to$[ebp]
	push	eax
	push	4
	call	_gen_lowpart
	add	esp, 8
	push	eax
	call	_convert_move
	add	esp, 12					; 0000000cH
; Line 419
	push	0
	push	0
	push	0
	push	0
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _to$[ebp]
	push	eax
	push	4
	call	_gen_lowpart
	add	esp, 8
	push	eax
	call	_emit_cmp_insn
	add	esp, 20					; 00000014H
; Line 420
	inc	DWORD PTR _inhibit_defer_pop
; Line 421
	mov	eax, DWORD PTR _label$1151[ebp]
	push	eax
	call	_gen_bge
	add	esp, 4
	push	eax
	call	_emit_jump_insn
	add	esp, 4
; Line 422
	mov	eax, DWORD PTR _to$[ebp]
	push	eax
	push	4
	call	_gen_highpart
	add	esp, 8
	mov	DWORD PTR _target$1153[ebp], eax
; Line 425
	push	1
	mov	eax, DWORD PTR _to$[ebp]
	push	eax
	push	4
	call	_gen_highpart
	add	esp, 8
	push	eax
	mov	eax, DWORD PTR _target$1153[ebp]
	push	eax
	mov	eax, DWORD PTR _one_cmpl_optab
	push	eax
	push	4
	call	_expand_unop
	add	esp, 20					; 00000014H
	mov	DWORD PTR _temp$1152[ebp], eax
; Line 426
	mov	eax, DWORD PTR _temp$1152[ebp]
	cmp	DWORD PTR _target$1153[ebp], eax
	je	$L1154
; Line 427
	mov	eax, DWORD PTR _temp$1152[ebp]
	push	eax
	mov	eax, DWORD PTR _target$1153[ebp]
	push	eax
	call	_emit_move_insn
	add	esp, 8
; Line 428
$L1154:
	mov	eax, DWORD PTR _label$1151[ebp]
	push	eax
	call	_emit_label
	add	esp, 4
; Line 429
	dec	DWORD PTR _inhibit_defer_pop
; Line 430
$L1150:
$L1143:
; Line 431
	jmp	$L1125
; Line 434
$L1141:
	cmp	DWORD PTR _from_mode$[ebp], 6
	jne	$L1155
; Line 436
	push	0
	mov	eax, DWORD PTR _from$[ebp]
	push	eax
	push	4
	call	_gen_lowpart
	add	esp, 8
	push	eax
	mov	eax, DWORD PTR _to$[ebp]
	push	eax
	call	_convert_move
	add	esp, 12					; 0000000cH
; Line 437
	jmp	$L1125
; Line 444
$L1155:
; Line 451
	mov	eax, DWORD PTR _from_mode$[ebp]
	mov	eax, DWORD PTR _mode_size[eax*4]
	shl	eax, 3
	mov	ecx, DWORD PTR _to_mode$[ebp]
	mov	ecx, DWORD PTR _mode_size[ecx*4]
	shl	ecx, 3
	cmp	eax, ecx
	jle	$L1157
	mov	eax, DWORD PTR _from$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1159
	mov	eax, DWORD PTR _from$[ebp]
	mov	eax, DWORD PTR [eax]
	shr	eax, 27					; 0000001bH
	test	al, 1
	jne	$L1159
	mov	eax, DWORD PTR _from$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_mode_dependent_address_p
	add	esp, 4
	or	eax, eax
	je	$L1158
$L1159:
	mov	eax, DWORD PTR _from$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1158
	mov	eax, DWORD PTR _from$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1157
$L1158:
; Line 453
	mov	eax, DWORD PTR _from$[ebp]
	push	eax
	mov	eax, DWORD PTR _to_mode$[ebp]
	push	eax
	call	_gen_lowpart
	add	esp, 8
	push	eax
	mov	eax, DWORD PTR _to$[ebp]
	push	eax
	call	_emit_move_insn
	add	esp, 8
; Line 454
	jmp	$L1125
; Line 457
$L1157:
	cmp	DWORD PTR _to_mode$[ebp], 4
	jne	$L1160
	cmp	DWORD PTR _from_mode$[ebp], 2
	jne	$L1160
; Line 459
	cmp	DWORD PTR _unsignedp$[ebp], 0
	je	$L1161
; Line 463
	push	78					; 0000004eH
	mov	eax, DWORD PTR _from$[ebp]
	push	eax
	mov	eax, DWORD PTR _to$[ebp]
	push	eax
	push	32					; 00000020H
	call	_emit_unop_insn
	add	esp, 16					; 00000010H
; Line 464
	jmp	$L1163
$L1162:
; Line 466
	call	_abort
$L1163:
; Line 468
	jmp	$L1164
$L1161:
; Line 472
	push	77					; 0000004dH
	mov	eax, DWORD PTR _from$[ebp]
	push	eax
	mov	eax, DWORD PTR _to$[ebp]
	push	eax
	push	35					; 00000023H
	call	_emit_unop_insn
	add	esp, 16					; 00000010H
; Line 473
	jmp	$L1166
$L1165:
; Line 475
	call	_abort
$L1166:
; Line 476
$L1164:
; Line 477
	jmp	$L1125
; Line 480
$L1160:
	cmp	DWORD PTR _to_mode$[ebp], 4
	jne	$L1167
	cmp	DWORD PTR _from_mode$[ebp], 1
	jne	$L1167
; Line 482
	cmp	DWORD PTR _unsignedp$[ebp], 0
	je	$L1168
; Line 487
	push	78					; 0000004eH
	mov	eax, DWORD PTR _from$[ebp]
	push	eax
	mov	eax, DWORD PTR _to$[ebp]
	push	eax
	push	34					; 00000022H
	call	_emit_unop_insn
	add	esp, 16					; 00000010H
; Line 488
	jmp	$L1125
; Line 492
$L1169:
; Line 494
	push	2
	call	_gen_reg_rtx
	add	esp, 4
	mov	DWORD PTR _temp$1171[ebp], eax
; Line 495
	push	78					; 0000004eH
	mov	eax, DWORD PTR _from$[ebp]
	push	eax
	mov	eax, DWORD PTR _temp$1171[ebp]
	push	eax
	push	33					; 00000021H
	call	_emit_unop_insn
	add	esp, 16					; 00000010H
; Line 496
	push	77					; 0000004dH
	mov	eax, DWORD PTR _temp$1171[ebp]
	push	eax
	mov	eax, DWORD PTR _to$[ebp]
	push	eax
	push	35					; 00000023H
	call	_emit_unop_insn
	add	esp, 16					; 00000010H
; Line 497
	jmp	$L1125
; Line 500
$L1170:
; Line 501
	jmp	$L1172
$L1168:
; Line 506
	push	77					; 0000004dH
	mov	eax, DWORD PTR _from$[ebp]
	push	eax
	mov	eax, DWORD PTR _to$[ebp]
	push	eax
	push	37					; 00000025H
	call	_emit_unop_insn
	add	esp, 16					; 00000010H
; Line 507
	jmp	$L1125
; Line 511
$L1173:
; Line 513
	push	2
	call	_gen_reg_rtx
	add	esp, 4
	mov	DWORD PTR _temp$1175[ebp], eax
; Line 514
	push	77					; 0000004dH
	mov	eax, DWORD PTR _from$[ebp]
	push	eax
	mov	eax, DWORD PTR _temp$1175[ebp]
	push	eax
	push	36					; 00000024H
	call	_emit_unop_insn
	add	esp, 16					; 00000010H
; Line 515
	push	77					; 0000004dH
	mov	eax, DWORD PTR _temp$1175[ebp]
	push	eax
	mov	eax, DWORD PTR _to$[ebp]
	push	eax
	push	35					; 00000023H
	call	_emit_unop_insn
	add	esp, 16					; 00000010H
; Line 516
	jmp	$L1125
; Line 519
$L1174:
$L1172:
; Line 520
	call	_abort
; Line 523
$L1167:
	cmp	DWORD PTR _to_mode$[ebp], 2
	jne	$L1176
	cmp	DWORD PTR _from_mode$[ebp], 1
	jne	$L1176
; Line 525
	cmp	DWORD PTR _unsignedp$[ebp], 0
	je	$L1177
; Line 530
	push	78					; 0000004eH
	mov	eax, DWORD PTR _from$[ebp]
	push	eax
	mov	eax, DWORD PTR _to$[ebp]
	push	eax
	push	33					; 00000021H
	call	_emit_unop_insn
	add	esp, 16					; 00000010H
; Line 531
	jmp	$L1125
; Line 534
$L1178:
; Line 535
	jmp	$L1179
$L1177:
; Line 540
	push	77					; 0000004dH
	mov	eax, DWORD PTR _from$[ebp]
	push	eax
	mov	eax, DWORD PTR _to$[ebp]
	push	eax
	push	36					; 00000024H
	call	_emit_unop_insn
	add	esp, 16					; 00000010H
; Line 541
	jmp	$L1125
; Line 544
$L1180:
$L1179:
; Line 545
	call	_abort
; Line 584
$L1176:
	cmp	DWORD PTR _from_mode$[ebp], 4
	jne	$L1181
	cmp	DWORD PTR _to_mode$[ebp], 2
	jne	$L1181
; Line 589
	push	0
	mov	eax, DWORD PTR _from$[ebp]
	push	eax
	mov	eax, DWORD PTR _to$[ebp]
	push	eax
	push	31					; 0000001fH
	call	_emit_unop_insn
	add	esp, 16					; 00000010H
; Line 590
	jmp	$L1125
; Line 593
$L1182:
	call	_abort
; Line 596
$L1181:
	cmp	DWORD PTR _from_mode$[ebp], 4
	jne	$L1183
	cmp	DWORD PTR _to_mode$[ebp], 1
	jne	$L1183
; Line 601
	push	0
	mov	eax, DWORD PTR _from$[ebp]
	push	eax
	mov	eax, DWORD PTR _to$[ebp]
	push	eax
	push	29					; 0000001dH
	call	_emit_unop_insn
	add	esp, 16					; 00000010H
; Line 602
	jmp	$L1125
; Line 605
$L1184:
	call	_abort
; Line 608
$L1183:
	cmp	DWORD PTR _from_mode$[ebp], 2
	jne	$L1185
	cmp	DWORD PTR _to_mode$[ebp], 1
	jne	$L1185
; Line 613
	push	0
	mov	eax, DWORD PTR _from$[ebp]
	push	eax
	mov	eax, DWORD PTR _to$[ebp]
	push	eax
	push	30					; 0000001eH
	call	_emit_unop_insn
	add	esp, 16					; 00000010H
; Line 614
	jmp	$L1125
; Line 617
$L1186:
	call	_abort
; Line 621
$L1185:
	call	_abort
; Line 622
$L1125:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_convert_move ENDP
_TEXT	ENDS
PUBLIC	_convert_to_mode
PUBLIC	_integer_mode_p
_TEXT	SEGMENT
_mode$ = 8
_x$ = 12
_unsignedp$ = 16
_temp$ = -4
_convert_to_mode PROC NEAR
; Line 636
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 638
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	cmp	eax, DWORD PTR _mode$[ebp]
	jne	$L1192
; Line 639
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L1190
; Line 640
$L1192:
; Line 643
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_integer_mode_p
	add	esp, 4
	or	eax, eax
	je	$L1194
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	ecx, DWORD PTR _mode$[ebp]
	mov	ecx, DWORD PTR _mode_size[ecx*4]
	cmp	DWORD PTR _mode_size[eax], ecx
	jl	$L1194
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1195
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2031616				; 001f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1195
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1194
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shr	eax, 27					; 0000001bH
	test	al, 1
	jne	$L1194
$L1195:
; Line 644
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_gen_lowpart
	add	esp, 8
	jmp	$L1190
; Line 645
$L1194:
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_gen_reg_rtx
	add	esp, 4
	mov	DWORD PTR _temp$[ebp], eax
; Line 646
	mov	eax, DWORD PTR _unsignedp$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_convert_move
	add	esp, 12					; 0000000cH
; Line 647
	mov	eax, DWORD PTR _temp$[ebp]
	jmp	$L1190
; Line 648
$L1190:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_convert_to_mode ENDP
_mode$ = 8
_integer_mode_p PROC NEAR
; Line 653
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 654
	cmp	DWORD PTR _mode$[ebp], 0
	jle	$L2487
	cmp	DWORD PTR _mode$[ebp], 7
	jg	$L2487
	mov	eax, 1
	jmp	$L2488
$L2487:
	sub	eax, eax
$L2488:
	jmp	$L1197
; Line 655
$L1197:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_integer_mode_p ENDP
_TEXT	ENDS
EXTRN	_copy_addr_to_reg:NEAR
EXTRN	_gen_movsi:NEAR
EXTRN	_gen_movhi:NEAR
EXTRN	_gen_movqi:NEAR
EXTRN	_gen_movdi:NEAR
_TEXT	SEGMENT
_to$ = 8
_from$ = 12
_len$ = 16
_align$ = 20
_data$ = -44
_to_addr$ = -48
_from_addr$ = -52
_move_by_pieces PROC NEAR
; Line 685
	push	ebp
	mov	ebp, esp
	sub	esp, 52					; 00000034H
	push	ebx
	push	esi
	push	edi
; Line 687
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _to_addr$[ebp], eax
	mov	eax, DWORD PTR _from$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _from_addr$[ebp], eax
; Line 689
	mov	DWORD PTR _data$[ebp+36], 0
; Line 690
	mov	eax, DWORD PTR _to_addr$[ebp]
	mov	DWORD PTR _data$[ebp+4], eax
; Line 691
	mov	eax, DWORD PTR _from_addr$[ebp]
	mov	DWORD PTR _data$[ebp+20], eax
; Line 692
	mov	eax, DWORD PTR _to$[ebp]
	mov	DWORD PTR _data$[ebp], eax
; Line 693
	mov	eax, DWORD PTR _from$[ebp]
	mov	DWORD PTR _data$[ebp+16], eax
; Line 696
	mov	eax, DWORD PTR _to_addr$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 4194304				; 00400000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L2491
	mov	eax, DWORD PTR _to_addr$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 4128768				; 003f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L2491
	mov	eax, DWORD PTR _to_addr$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 4325376				; 00420000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L2491
	mov	eax, DWORD PTR _to_addr$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 4259840				; 00410000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2489
$L2491:
	mov	DWORD PTR _data$[ebp+8], 1
	jmp	$L2490
$L2489:
	mov	DWORD PTR _data$[ebp+8], 0
$L2490:
; Line 700
	mov	eax, DWORD PTR _from_addr$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 4194304				; 00400000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L2494
	mov	eax, DWORD PTR _from_addr$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 4128768				; 003f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L2494
	mov	eax, DWORD PTR _from_addr$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 4325376				; 00420000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L2494
	mov	eax, DWORD PTR _from_addr$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 4259840				; 00410000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2492
$L2494:
	mov	DWORD PTR _data$[ebp+24], 1
	jmp	$L2493
$L2492:
	mov	DWORD PTR _data$[ebp+24], 0
$L2493:
; Line 702
	mov	DWORD PTR _data$[ebp+28], 0
; Line 703
	mov	DWORD PTR _data$[ebp+12], 0
; Line 705
	mov	eax, DWORD PTR _to_addr$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 4128768				; 003f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L2497
	mov	eax, DWORD PTR _to_addr$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 4259840				; 00410000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2495
$L2497:
	mov	DWORD PTR _data$[ebp+40], 1
	jmp	$L2496
$L2495:
	mov	DWORD PTR _data$[ebp+40], 0
$L2496:
; Line 706
	cmp	DWORD PTR _data$[ebp+40], 0
	je	$L1210
	mov	eax, DWORD PTR _len$[ebp]
	mov	DWORD PTR _data$[ebp+36], eax
; Line 707
$L1210:
	mov	eax, DWORD PTR _len$[ebp]
	mov	DWORD PTR _data$[ebp+32], eax
; Line 713
	cmp	DWORD PTR _data$[ebp+24], 0
	je	$L1212
	cmp	DWORD PTR _data$[ebp+8], 0
	jne	$L1211
$L1212:
	mov	eax, DWORD PTR _align$[ebp]
	push	eax
	mov	eax, DWORD PTR _len$[ebp]
	push	eax
	call	_move_by_pieces_ninsns
	add	esp, 8
	cmp	eax, 2
	jle	$L1211
; Line 731
	cmp	DWORD PTR _data$[ebp+24], 0
	jne	$L1213
	mov	eax, DWORD PTR _from_addr$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1214
	mov	eax, DWORD PTR _from_addr$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1214
	mov	eax, DWORD PTR _from_addr$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1214
	mov	eax, DWORD PTR _from_addr$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1213
$L1214:
; Line 732
	mov	eax, DWORD PTR _from_addr$[ebp]
	push	eax
	call	_copy_addr_to_reg
	add	esp, 4
	mov	DWORD PTR _data$[ebp+20], eax
; Line 749
$L1213:
	cmp	DWORD PTR _data$[ebp+8], 0
	jne	$L1215
	mov	eax, DWORD PTR _to_addr$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1216
	mov	eax, DWORD PTR _to_addr$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1216
	mov	eax, DWORD PTR _to_addr$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1216
	mov	eax, DWORD PTR _to_addr$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1215
$L1216:
; Line 750
	mov	eax, DWORD PTR _to_addr$[ebp]
	push	eax
	call	_copy_addr_to_reg
	add	esp, 4
	mov	DWORD PTR _data$[ebp+4], eax
; Line 751
$L1215:
; Line 757
$L1211:
	mov	DWORD PTR _align$[ebp], 4
; Line 765
	mov	eax, DWORD PTR _align$[ebp]
	cmp	DWORD PTR _mode_size+24, eax
	jg	$L1217
; Line 766
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	push	6
	push	OFFSET _gen_movdi
	call	_move_by_pieces_1
	add	esp, 12					; 0000000cH
; Line 769
$L1217:
	mov	eax, DWORD PTR _align$[ebp]
	cmp	DWORD PTR _mode_size+16, eax
	jg	$L1218
; Line 770
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	push	4
	push	OFFSET _gen_movsi
	call	_move_by_pieces_1
	add	esp, 12					; 0000000cH
; Line 773
$L1218:
	mov	eax, DWORD PTR _align$[ebp]
	cmp	DWORD PTR _mode_size+8, eax
	jg	$L1219
; Line 774
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	push	2
	push	OFFSET _gen_movhi
	call	_move_by_pieces_1
	add	esp, 12					; 0000000cH
; Line 777
$L1219:
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	push	1
	push	OFFSET _gen_movqi
	call	_move_by_pieces_1
	add	esp, 12					; 0000000cH
; Line 781
$L1206:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_move_by_pieces ENDP
_l$ = 8
_align$ = 12
_n_insns$ = -4
_move_by_pieces_ninsns PROC NEAR
; Line 790
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 791
	mov	DWORD PTR _n_insns$[ebp], 0
; Line 797
	mov	DWORD PTR _align$[ebp], 4
; Line 805
	mov	eax, DWORD PTR _align$[ebp]
	cmp	DWORD PTR _mode_size+24, eax
	jg	$L1224
; Line 806
	mov	eax, DWORD PTR _l$[ebp]
	sub	edx, edx
	div	DWORD PTR _mode_size+24
	mov	ecx, DWORD PTR _n_insns$[ebp]
	add	ecx, eax
	mov	DWORD PTR _n_insns$[ebp], ecx
	mov	eax, DWORD PTR _l$[ebp]
	sub	edx, edx
	div	DWORD PTR _mode_size+24
	mov	DWORD PTR _l$[ebp], edx
; Line 809
$L1224:
	mov	eax, DWORD PTR _align$[ebp]
	cmp	DWORD PTR _mode_size+16, eax
	jg	$L1225
; Line 810
	mov	eax, DWORD PTR _l$[ebp]
	sub	edx, edx
	div	DWORD PTR _mode_size+16
	mov	ecx, DWORD PTR _n_insns$[ebp]
	add	ecx, eax
	mov	DWORD PTR _n_insns$[ebp], ecx
	mov	eax, DWORD PTR _l$[ebp]
	sub	edx, edx
	div	DWORD PTR _mode_size+16
	mov	DWORD PTR _l$[ebp], edx
; Line 813
$L1225:
	mov	eax, DWORD PTR _align$[ebp]
	cmp	DWORD PTR _mode_size+8, eax
	jg	$L1226
; Line 814
	mov	eax, DWORD PTR _l$[ebp]
	sub	edx, edx
	div	DWORD PTR _mode_size+8
	mov	ecx, DWORD PTR _n_insns$[ebp]
	add	ecx, eax
	mov	DWORD PTR _n_insns$[ebp], ecx
	mov	eax, DWORD PTR _l$[ebp]
	sub	edx, edx
	div	DWORD PTR _mode_size+8
	mov	DWORD PTR _l$[ebp], edx
; Line 816
$L1226:
	mov	eax, DWORD PTR _n_insns$[ebp]
	add	eax, DWORD PTR _l$[ebp]
	mov	DWORD PTR _n_insns$[ebp], eax
; Line 818
	mov	eax, DWORD PTR _n_insns$[ebp]
	jmp	$L1222
; Line 819
$L1222:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_move_by_pieces_ninsns ENDP
_TEXT	ENDS
EXTRN	_plus_constant:NEAR
EXTRN	_change_address:NEAR
_TEXT	SEGMENT
_genfun$ = 8
_mode$ = 12
_data$ = 16
_size$ = -12
_to1$ = -8
_from1$ = -4
_move_by_pieces_1 PROC NEAR
; Line 830
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 831
	mov	eax, DWORD PTR _mode$[ebp]
	mov	eax, DWORD PTR _mode_size[eax*4]
	mov	DWORD PTR _size$[ebp], eax
; Line 834
$L1235:
	mov	eax, DWORD PTR _data$[ebp]
	mov	ecx, DWORD PTR _size$[ebp]
	cmp	DWORD PTR [eax+32], ecx
	jl	$L1236
; Line 836
	mov	eax, DWORD PTR _data$[ebp]
	cmp	DWORD PTR [eax+40], 0
	je	$L1237
	sub	eax, eax
	sub	eax, DWORD PTR _size$[ebp]
	neg	eax
	mov	ecx, DWORD PTR _data$[ebp]
	sub	DWORD PTR [ecx+36], eax
; Line 838
$L1237:
; Line 841
	mov	eax, DWORD PTR _data$[ebp]
	cmp	DWORD PTR [eax+8], 0
	je	$L2498
	mov	eax, DWORD PTR _data$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	push	37					; 00000025H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _to1$[ebp], eax
	jmp	$L2499
$L2498:
	mov	eax, DWORD PTR _data$[ebp]
	mov	eax, DWORD PTR [eax+36]
	push	eax
	mov	eax, DWORD PTR _data$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_plus_constant
	add	esp, 8
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	mov	eax, DWORD PTR _data$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_change_address
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _to1$[ebp], eax
$L2499:
; Line 846
	mov	eax, DWORD PTR _data$[ebp]
	cmp	DWORD PTR [eax+24], 0
	je	$L2500
	mov	eax, DWORD PTR _data$[ebp]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	push	37					; 00000025H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _from1$[ebp], eax
	jmp	$L2501
$L2500:
	mov	eax, DWORD PTR _data$[ebp]
	mov	eax, DWORD PTR [eax+36]
	push	eax
	mov	eax, DWORD PTR _data$[ebp]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	call	_plus_constant
	add	esp, 8
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	mov	eax, DWORD PTR _data$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_change_address
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _from1$[ebp], eax
$L2501:
; Line 857
	mov	eax, DWORD PTR _from1$[ebp]
	push	eax
	mov	eax, DWORD PTR _to1$[ebp]
	push	eax
	call	DWORD PTR _genfun$[ebp]
	add	esp, 8
	push	eax
	call	_emit_insn
	add	esp, 4
; Line 867
	mov	eax, DWORD PTR _data$[ebp]
	cmp	DWORD PTR [eax+40], 0
	jne	$L1238
	mov	eax, DWORD PTR _size$[ebp]
	mov	ecx, DWORD PTR _data$[ebp]
	add	DWORD PTR [ecx+36], eax
; Line 869
$L1238:
	sub	eax, eax
	sub	eax, DWORD PTR _size$[ebp]
	neg	eax
	mov	ecx, DWORD PTR _data$[ebp]
	sub	DWORD PTR [ecx+32], eax
; Line 870
	jmp	$L1235
$L1236:
; Line 871
$L1230:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_move_by_pieces_1 ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+3
$SG1252	DB	'memcpy', 00H
_DATA	ENDS
_TEXT	SEGMENT
_x$ = 8
_y$ = 12
_size$ = 16
_align$ = 20
_emit_block_move PROC NEAR
; Line 888
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 889
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 436207616				; 1a000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L1245
; Line 890
	call	_abort
; Line 892
$L1245:
	mov	eax, DWORD PTR _y$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 436207616				; 1a000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L1246
; Line 893
	call	_abort
; Line 895
$L1246:
	push	1
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_protect_from_queue
	add	esp, 8
	mov	DWORD PTR _x$[ebp], eax
; Line 896
	push	0
	mov	eax, DWORD PTR _y$[ebp]
	push	eax
	call	_protect_from_queue
	add	esp, 8
	mov	DWORD PTR _y$[ebp], eax
; Line 898
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1247
; Line 899
	call	_abort
; Line 900
$L1247:
	mov	eax, DWORD PTR _y$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1248
; Line 901
	call	_abort
; Line 902
$L1248:
	cmp	DWORD PTR _size$[ebp], 0
	jne	$L1249
; Line 903
	call	_abort
; Line 905
$L1249:
; Line 907
	mov	eax, DWORD PTR _size$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1250
	mov	eax, DWORD PTR _align$[ebp]
	push	eax
	mov	eax, DWORD PTR _size$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_move_by_pieces_ninsns
	add	esp, 8
	cmp	eax, 15					; 0000000fH
	jge	$L1250
; Line 908
	mov	eax, DWORD PTR _align$[ebp]
	push	eax
	mov	eax, DWORD PTR _size$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _y$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_move_by_pieces
	add	esp, 16					; 00000010H
; Line 909
	jmp	$L1251
$L1250:
; Line 949
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
	push	0
	push	0
	push	OFFSET $SG1252
	push	4
	push	39					; 00000027H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	call	_emit_library_call
	add	esp, 40					; 00000028H
; Line 956
$L1251:
; Line 957
$L1244:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_emit_block_move ENDP
_TEXT	ENDS
EXTRN	_dconst0_rtx:DWORD
EXTRN	_memory_address:NEAR
EXTRN	_force_const_double_mem:NEAR
_TEXT	SEGMENT
_regno$ = 8
_x$ = 12
_nregs$ = 16
_i$ = -4
_move_block_to_reg PROC NEAR
; Line 967
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 969
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2031616				; 001f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1259
	mov	eax, DWORD PTR _x$[ebp]
	cmp	DWORD PTR _dconst0_rtx, eax
	je	$L1259
; Line 970
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_force_const_double_mem
	add	esp, 4
	mov	DWORD PTR _x$[ebp], eax
; Line 971
$L1259:
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L1260
$L1261:
	inc	DWORD PTR _i$[ebp]
$L1260:
	mov	eax, DWORD PTR _nregs$[ebp]
	cmp	DWORD PTR _i$[ebp], eax
	jge	$L1262
; Line 973
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1263
; Line 975
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	push	4
	push	35					; 00000023H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, DWORD PTR _regno$[ebp]
	push	eax
	push	4
	push	34					; 00000022H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	call	_emit_move_insn
	add	esp, 8
; Line 976
	jmp	$L1264
$L1263:
	mov	eax, DWORD PTR _x$[ebp]
	cmp	DWORD PTR _dconst0_rtx, eax
	je	$L1266
	mov	eax, DWORD PTR _x$[ebp]
	cmp	DWORD PTR _const0_rtx, eax
	jne	$L1265
$L1266:
; Line 978
	mov	eax, DWORD PTR _const0_rtx
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, DWORD PTR _regno$[ebp]
	push	eax
	push	4
	push	34					; 00000022H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	call	_emit_move_insn
	add	esp, 8
; Line 979
	jmp	$L1267
$L1265:
; Line 984
	mov	eax, DWORD PTR _mode_size+16
	imul	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_plus_constant
	add	esp, 8
	push	eax
	push	4
	call	_memory_address
	add	esp, 8
	push	eax
	push	4
	push	37					; 00000025H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, DWORD PTR _regno$[ebp]
	push	eax
	push	4
	push	34					; 00000022H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	call	_emit_move_insn
	add	esp, 8
$L1267:
$L1264:
; Line 985
	jmp	$L1261
$L1262:
; Line 986
$L1257:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_move_block_to_reg ENDP
_TEXT	ENDS
PUBLIC	_move_block_from_reg
_TEXT	SEGMENT
_regno$ = 8
_x$ = 12
_nregs$ = 16
_i$ = -4
_move_block_from_reg PROC NEAR
; Line 996
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 998
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L1274
$L1275:
	inc	DWORD PTR _i$[ebp]
$L1274:
	mov	eax, DWORD PTR _nregs$[ebp]
	cmp	DWORD PTR _i$[ebp], eax
	jge	$L1276
; Line 1000
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1277
; Line 1002
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, DWORD PTR _regno$[ebp]
	push	eax
	push	4
	push	34					; 00000022H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	push	4
	push	35					; 00000023H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	call	_emit_move_insn
	add	esp, 8
; Line 1003
	jmp	$L1278
$L1277:
; Line 1008
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, DWORD PTR _regno$[ebp]
	push	eax
	push	4
	push	34					; 00000022H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _mode_size+16
	imul	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_plus_constant
	add	esp, 8
	push	eax
	push	4
	call	_memory_address
	add	esp, 8
	push	eax
	push	4
	push	37					; 00000025H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	call	_emit_move_insn
	add	esp, 8
$L1278:
; Line 1009
	jmp	$L1275
$L1276:
; Line 1010
$L1272:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_move_block_from_reg ENDP
_nregs$ = 12
_i$ = -4
_regno$ = 8
_use_regs PROC NEAR
; Line 1018
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 1020
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L1284
$L1285:
	inc	DWORD PTR _i$[ebp]
$L1284:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _nregs$[ebp], eax
	jle	$L1286
; Line 1021
	mov	eax, DWORD PTR _regno$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	push	eax
	push	4
	push	34					; 00000022H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	26					; 0000001aH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	call	_emit_insn
	add	esp, 4
	jmp	$L1285
$L1286:
; Line 1022
$L1282:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_use_regs ENDP
_TEXT	ENDS
PUBLIC	_clear_storage
_DATA	SEGMENT
	ORG $+1
$SG1292	DB	'memset', 00H
_DATA	ENDS
_TEXT	SEGMENT
_object$ = 8
_size$ = 12
_clear_storage PROC NEAR
; Line 1031
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1032
	mov	eax, DWORD PTR _object$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 436207616				; 1a000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1291
; Line 1038
	push	4
	mov	eax, DWORD PTR _size$[ebp]
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	push	4
	mov	eax, DWORD PTR _const0_rtx
	push	eax
	push	4
	mov	eax, DWORD PTR _object$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	3
	push	0
	push	0
	push	OFFSET $SG1292
	push	4
	push	39					; 00000027H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	call	_emit_library_call
	add	esp, 40					; 00000028H
; Line 1046
	jmp	$L1293
$L1291:
; Line 1047
	mov	eax, DWORD PTR _const0_rtx
	push	eax
	mov	eax, DWORD PTR _object$[ebp]
	push	eax
	call	_emit_move_insn
	add	esp, 8
$L1293:
; Line 1048
$L1290:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_clear_storage ENDP
_TEXT	ENDS
EXTRN	_memory_address_p:NEAR
EXTRN	_insn_gen_function:BYTE
EXTRN	_force_const_mem:NEAR
EXTRN	_mov_optab:DWORD
_TEXT	SEGMENT
_x$ = 8
_y$ = 12
_mode$ = -4
_icode$1300 = -8
_emit_move_insn PROC NEAR
; Line 1060
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 1061
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	mov	DWORD PTR _mode$[ebp], eax
; Line 1062
	push	1
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_protect_from_queue
	add	esp, 8
	mov	DWORD PTR _x$[ebp], eax
; Line 1063
	push	0
	mov	eax, DWORD PTR _y$[ebp]
	push	eax
	call	_protect_from_queue
	add	esp, 8
	mov	DWORD PTR _y$[ebp], eax
; Line 1065
	cmp	DWORD PTR _mode$[ebp], 26		; 0000001aH
	jne	$L1298
; Line 1066
	call	_abort
; Line 1067
$L1298:
	mov	eax, DWORD PTR _mode$[ebp]
	mov	ecx, DWORD PTR _mov_optab
	cmp	DWORD PTR [ecx+eax*8+4], 142		; 0000008eH
	je	$L1299
; Line 1069
	mov	eax, DWORD PTR _mode$[ebp]
	mov	ecx, DWORD PTR _mov_optab
	mov	eax, DWORD PTR [ecx+eax*8+4]
	mov	DWORD PTR _icode$1300[ebp], eax
; Line 1071
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	mov	eax, DWORD PTR _y$[ebp]
	push	eax
	mov	eax, DWORD PTR _icode$1300[ebp]
	mov	ecx, eax
	shl	eax, 3
	sub	eax, ecx
	call	DWORD PTR _insn_operand_predicate[eax*4+4]
	add	esp, 8
	or	eax, eax
	jne	$L1301
	mov	eax, DWORD PTR _y$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1302
	mov	eax, DWORD PTR _y$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1302
	mov	eax, DWORD PTR _y$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1302
	mov	eax, DWORD PTR _y$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1302
	mov	eax, DWORD PTR _y$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2031616				; 001f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1301
$L1302:
; Line 1073
	mov	eax, DWORD PTR _y$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_force_const_mem
	add	esp, 8
	mov	DWORD PTR _y$[ebp], eax
; Line 1074
	mov	eax, DWORD PTR _y$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_memory_address_p
	add	esp, 8
	or	eax, eax
	jne	$L1304
; Line 1075
	mov	eax, DWORD PTR _y$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_memory_address
	add	esp, 8
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	push	37					; 00000025H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _y$[ebp], eax
; Line 1076
$L1304:
; Line 1077
$L1301:
	mov	eax, DWORD PTR _y$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	mov	eax, DWORD PTR _icode$1300[ebp]
	call	DWORD PTR _insn_gen_function[eax*4]
	add	esp, 8
	push	eax
	call	_emit_insn
	add	esp, 4
	jmp	$L1296
; Line 1112
	jmp	$L1305
$L1299:
; Line 1113
	call	_abort
$L1305:
; Line 1114
$L1296:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_emit_move_insn ENDP
_TEXT	ENDS
PUBLIC	_push_block
EXTRN	_expand_binop:NEAR
EXTRN	_stack_pointer_rtx:DWORD
EXTRN	_add_optab:DWORD
EXTRN	_copy_to_mode_reg:NEAR
EXTRN	_anti_adjust_stack:NEAR
_TEXT	SEGMENT
_size$ = 8
_extra$ = 12
_temp$ = -4
_temp$1316 = -8
_push_block PROC NEAR
; Line 1132
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 1134
	mov	eax, DWORD PTR _size$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1312
	mov	eax, DWORD PTR _size$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1312
	mov	eax, DWORD PTR _size$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1312
	mov	eax, DWORD PTR _size$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1311
$L1312:
; Line 1135
	mov	eax, DWORD PTR _extra$[ebp]
	push	eax
	mov	eax, DWORD PTR _size$[ebp]
	push	eax
	call	_plus_constant
	add	esp, 8
	push	eax
	call	_anti_adjust_stack
	add	esp, 4
; Line 1136
	jmp	$L1313
$L1311:
	mov	eax, DWORD PTR _size$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1314
	cmp	DWORD PTR _extra$[ebp], 0
	jne	$L1314
; Line 1137
	mov	eax, DWORD PTR _size$[ebp]
	push	eax
	call	_anti_adjust_stack
	add	esp, 4
; Line 1138
	jmp	$L1315
$L1314:
; Line 1140
	mov	eax, DWORD PTR _size$[ebp]
	push	eax
	push	4
	call	_copy_to_mode_reg
	add	esp, 8
	mov	DWORD PTR _temp$1316[ebp], eax
; Line 1141
	cmp	DWORD PTR _extra$[ebp], 0
	je	$L1317
; Line 1144
	push	3
	push	0
	mov	eax, DWORD PTR _temp$1316[ebp]
	push	eax
	mov	eax, DWORD PTR _extra$[ebp]
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _temp$1316[ebp]
	push	eax
	mov	eax, DWORD PTR _add_optab
	push	eax
	push	4
	call	_expand_binop
	add	esp, 28					; 0000001cH
	mov	DWORD PTR _temp$1316[ebp], eax
; Line 1145
$L1317:
	mov	eax, DWORD PTR _temp$1316[ebp]
	push	eax
	call	_anti_adjust_stack
	add	esp, 4
; Line 1146
$L1315:
$L1313:
; Line 1149
	mov	eax, DWORD PTR _stack_pointer_rtx
	mov	DWORD PTR _temp$[ebp], eax
; Line 1150
	cmp	DWORD PTR _extra$[ebp], 0
	je	$L1318
; Line 1151
	mov	eax, DWORD PTR _extra$[ebp]
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_plus_constant
	add	esp, 8
	mov	DWORD PTR _temp$[ebp], eax
; Line 1166
$L1318:
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	push	1
	call	_memory_address
	add	esp, 8
	jmp	$L1309
; Line 1167
$L1309:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_push_block ENDP
_gen_push_operand PROC NEAR
; Line 1171
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1179
	mov	eax, DWORD PTR _stack_pointer_rtx
	push	eax
	push	4
	push	63					; 0000003fH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	jmp	$L1320
; Line 1180
$L1320:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_push_operand ENDP
_TEXT	ENDS
EXTRN	_reg_mentioned_p:NEAR
EXTRN	_sub_optab:DWORD
EXTRN	_copy_to_reg:NEAR
_DATA	SEGMENT
	ORG $+1
$SG1360	DB	'memcpy', 00H
_DATA	ENDS
_TEXT	SEGMENT
_skip$1344 = -24
_size$1363 = -44
_i$1364 = -32
_not_stack$1365 = -52
_offset$1366 = -36
_args_offset$1367 = -48
_skip$1368 = -40
_wd$1375 = -60
_addr$1378 = -64
_x$ = 8
_addr$1386 = -68
_mode$ = 12
_size$ = 16
_align$ = 20
_partial$ = 24
_reg$ = 28
_extra$ = 32
_args_addr$ = 36
_args_so_far$ = 40
_xinner$ = -8
_stack_direction$ = -4
_where_pad$ = -12
_temp$1341 = -20
_used$1342 = -28
_offset$1343 = -16
_emit_push_insn PROC NEAR
; Line 1217
	push	ebp
	mov	ebp, esp
	sub	esp, 68					; 00000044H
	push	ebx
	push	esi
	push	edi
; Line 1221
	mov	DWORD PTR _stack_direction$[ebp], 2
; Line 1229
	mov	DWORD PTR _where_pad$[ebp], 1
; Line 1231
	push	0
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_protect_from_queue
	add	esp, 8
	mov	DWORD PTR _x$[ebp], eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	DWORD PTR _xinner$[ebp], eax
; Line 1233
	cmp	DWORD PTR _extra$[ebp], 0
	je	$L1335
; Line 1235
	cmp	DWORD PTR _args_addr$[ebp], 0
	jne	$L1336
; Line 1239
	cmp	DWORD PTR _where_pad$[ebp], 0
	je	$L1337
	mov	eax, DWORD PTR _stack_direction$[ebp]
	cmp	DWORD PTR _where_pad$[ebp], eax
	je	$L1337
; Line 1241
	mov	eax, DWORD PTR _extra$[ebp]
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	call	_anti_adjust_stack
	add	esp, 4
; Line 1242
	mov	DWORD PTR _extra$[ebp], 0
; Line 1244
$L1337:
; Line 1245
	jmp	$L1338
$L1336:
; Line 1248
	cmp	DWORD PTR _where_pad$[ebp], 2
	jne	$L1339
; Line 1250
	mov	eax, DWORD PTR _extra$[ebp]
	push	eax
	mov	eax, DWORD PTR _args_so_far$[ebp]
	push	eax
	call	_plus_constant
	add	esp, 8
	mov	DWORD PTR _args_so_far$[ebp], eax
; Line 1254
$L1339:
	mov	DWORD PTR _extra$[ebp], 0
; Line 1255
$L1338:
; Line 1258
$L1335:
	cmp	DWORD PTR _mode$[ebp], 26		; 0000001aH
	jne	$L1340
; Line 1263
	mov	eax, DWORD PTR _partial$[ebp]
	shl	eax, 2
	mov	DWORD PTR _used$1342[ebp], eax
; Line 1264
	mov	eax, DWORD PTR _used$1342[ebp]
	cdq
	xor	eax, edx
	sub	eax, edx
	and	eax, 3
	xor	eax, edx
	sub	eax, edx
	mov	DWORD PTR _offset$1343[ebp], eax
; Line 1267
	cmp	DWORD PTR _size$[ebp], 0
	jne	$L1345
; Line 1268
	call	_abort
; Line 1270
$L1345:
	sub	eax, eax
	sub	eax, DWORD PTR _offset$1343[ebp]
	neg	eax
	sub	DWORD PTR _used$1342[ebp], eax
; Line 1275
	cmp	DWORD PTR _partial$[ebp], 0
	je	$L1346
; Line 1277
	mov	eax, DWORD PTR _used$1342[ebp]
	push	eax
	mov	eax, DWORD PTR _xinner$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_plus_constant
	add	esp, 8
	push	eax
	push	26					; 0000001aH
	mov	eax, DWORD PTR _xinner$[ebp]
	push	eax
	call	_change_address
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _xinner$[ebp], eax
; Line 1284
$L1346:
	mov	DWORD PTR _skip$1344[ebp], 0
; Line 1299
	cmp	DWORD PTR _args_addr$[ebp], 0
	jne	$L1347
	mov	eax, DWORD PTR _size$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1347
	cmp	DWORD PTR _args_addr$[ebp], 0
	jne	$L1347
	cmp	DWORD PTR _skip$1344[ebp], 0
	jne	$L1347
	mov	eax, DWORD PTR _align$[ebp]
	push	eax
	mov	eax, DWORD PTR _size$[ebp]
	mov	eax, DWORD PTR [eax+4]
	sub	eax, DWORD PTR _used$1342[ebp]
	push	eax
	call	_move_by_pieces_ninsns
	add	esp, 8
	cmp	eax, 15					; 0000000fH
	jge	$L1347
	mov	eax, DWORD PTR _size$[ebp]
	mov	eax, DWORD PTR [eax+4]
	inc	eax
	and	eax, -2					; fffffffeH
	mov	ecx, DWORD PTR _size$[ebp]
	cmp	eax, DWORD PTR [ecx+4]
	jne	$L1347
; Line 1306
	mov	eax, DWORD PTR _align$[ebp]
	push	eax
	mov	eax, DWORD PTR _size$[ebp]
	mov	eax, DWORD PTR [eax+4]
	sub	eax, DWORD PTR _used$1342[ebp]
	push	eax
	mov	eax, DWORD PTR _xinner$[ebp]
	push	eax
	call	_gen_push_operand
	push	eax
	push	26					; 0000001aH
	push	37					; 00000025H
	call	_gen_rtx
	add	esp, 24					; 00000018H
	push	eax
	call	_move_by_pieces
	add	esp, 4
; Line 1307
	jmp	$L1348
$L1347:
; Line 1314
	cmp	DWORD PTR _partial$[ebp], 0
	je	$L1349
; Line 1316
	mov	eax, DWORD PTR _size$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1350
; Line 1317
	mov	eax, DWORD PTR _size$[ebp]
	mov	eax, DWORD PTR [eax+4]
	sub	eax, DWORD PTR _used$1342[ebp]
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _size$[ebp], eax
; Line 1318
	jmp	$L1351
$L1350:
; Line 1321
	push	3
	push	0
	push	0
	mov	eax, DWORD PTR _used$1342[ebp]
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _size$[ebp]
	push	eax
	mov	eax, DWORD PTR _sub_optab
	push	eax
	mov	eax, DWORD PTR _size$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	call	_expand_binop
	add	esp, 28					; 0000001cH
	mov	DWORD PTR _size$[ebp], eax
$L1351:
; Line 1325
$L1349:
	cmp	DWORD PTR _args_addr$[ebp], 0
	jne	$L1352
; Line 1327
	mov	eax, DWORD PTR _extra$[ebp]
	push	eax
	mov	eax, DWORD PTR _size$[ebp]
	push	eax
	call	_push_block
	add	esp, 8
	mov	DWORD PTR _temp$1341[ebp], eax
; Line 1328
	mov	DWORD PTR _extra$[ebp], 0
; Line 1330
	jmp	$L1353
$L1352:
	mov	eax, DWORD PTR _args_so_far$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1354
; Line 1333
	mov	eax, DWORD PTR _args_so_far$[ebp]
	mov	eax, DWORD PTR [eax+4]
	add	eax, DWORD PTR _skip$1344[ebp]
	push	eax
	mov	eax, DWORD PTR _args_addr$[ebp]
	push	eax
	call	_plus_constant
	add	esp, 8
	push	eax
	push	26					; 0000001aH
	call	_memory_address
	add	esp, 8
	mov	DWORD PTR _temp$1341[ebp], eax
; Line 1334
	jmp	$L1355
$L1354:
; Line 1338
	mov	eax, DWORD PTR _skip$1344[ebp]
	push	eax
	mov	eax, DWORD PTR _args_so_far$[ebp]
	push	eax
	mov	eax, DWORD PTR _args_addr$[ebp]
	push	eax
	push	4
	push	44					; 0000002cH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	call	_plus_constant
	add	esp, 8
	push	eax
	push	26					; 0000001aH
	call	_memory_address
	add	esp, 8
	mov	DWORD PTR _temp$1341[ebp], eax
$L1355:
$L1353:
; Line 1343
	mov	eax, DWORD PTR _size$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1356
	mov	eax, DWORD PTR _align$[ebp]
	push	eax
	mov	eax, DWORD PTR _size$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_move_by_pieces_ninsns
	add	esp, 8
	cmp	eax, 15					; 0000000fH
	jge	$L1356
; Line 1346
	mov	eax, DWORD PTR _align$[ebp]
	push	eax
	mov	eax, DWORD PTR _size$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _xinner$[ebp]
	push	eax
	mov	eax, DWORD PTR _temp$1341[ebp]
	push	eax
	push	26					; 0000001aH
	push	37					; 00000025H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	call	_move_by_pieces
	add	esp, 16					; 00000010H
; Line 1347
	jmp	$ret$1357
; Line 1386
$L1356:
	mov	eax, DWORD PTR _temp$1341[ebp]
	push	eax
	mov	eax, DWORD PTR _stack_pointer_rtx
	push	eax
	call	_reg_mentioned_p
	add	esp, 8
	or	eax, eax
	je	$L1359
; Line 1390
	mov	eax, DWORD PTR _temp$1341[ebp]
	push	eax
	call	_copy_to_reg
	add	esp, 4
	mov	DWORD PTR _temp$1341[ebp], eax
; Line 1416
$L1359:
	inc	DWORD PTR _inhibit_defer_pop
; Line 1420
	push	4
	mov	eax, DWORD PTR _size$[ebp]
	push	eax
	push	4
	mov	eax, DWORD PTR _xinner$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	4
	mov	eax, DWORD PTR _temp$1341[ebp]
	push	eax
	push	3
	push	0
	push	0
	push	OFFSET $SG1360
	push	4
	push	39					; 00000027H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	call	_emit_library_call
	add	esp, 40					; 00000028H
; Line 1426
	dec	DWORD PTR _inhibit_defer_pop
; Line 1427
$L1348:
; Line 1429
	jmp	$L1361
$L1340:
	cmp	DWORD PTR _partial$[ebp], 0
	jle	$L1362
; Line 1433
	mov	eax, DWORD PTR _mode$[ebp]
	mov	eax, DWORD PTR _mode_size[eax*4]
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	mov	DWORD PTR _size$1363[ebp], eax
; Line 1438
	mov	eax, DWORD PTR _partial$[ebp]
	cdq
	xor	eax, edx
	sub	eax, edx
	and	eax, 0
	xor	eax, edx
	sub	eax, edx
	mov	DWORD PTR _offset$1366[ebp], eax
; Line 1439
	mov	eax, DWORD PTR _args_so_far$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _args_offset$1367[ebp], eax
; Line 1445
	cmp	DWORD PTR _args_addr$[ebp], 0
	jne	$L1369
; Line 1446
	mov	DWORD PTR _offset$1366[ebp], 0
; Line 1450
$L1369:
	mov	eax, DWORD PTR _partial$[ebp]
	sub	eax, DWORD PTR _offset$1366[ebp]
	mov	DWORD PTR _not_stack$1365[ebp], eax
; Line 1457
	mov	DWORD PTR _skip$1368[ebp], 0
; Line 1462
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2031616				; 001f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1370
	mov	eax, DWORD PTR _x$[ebp]
	cmp	DWORD PTR _dconst0_rtx, eax
	je	$L1370
; Line 1463
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_force_const_double_mem
	add	esp, 4
	mov	DWORD PTR _x$[ebp], eax
; Line 1471
$L1370:
	mov	eax, DWORD PTR _size$1363[ebp]
	dec	eax
	mov	DWORD PTR _i$1364[ebp], eax
	jmp	$L1371
$L1372:
	dec	DWORD PTR _i$1364[ebp]
$L1371:
	mov	eax, DWORD PTR _i$1364[ebp]
	cmp	DWORD PTR _not_stack$1365[ebp], eax
	jg	$L1373
; Line 1473
	mov	eax, DWORD PTR _not_stack$1365[ebp]
	add	eax, DWORD PTR _offset$1366[ebp]
	cmp	eax, DWORD PTR _i$1364[ebp]
	jg	$L1374
; Line 1478
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1377
; Line 1482
	mov	eax, DWORD PTR _i$1364[ebp]
	shl	eax, 2
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_plus_constant
	add	esp, 8
	push	eax
	push	4
	call	_memory_address
	add	esp, 8
	mov	DWORD PTR _addr$1378[ebp], eax
; Line 1485
	mov	eax, DWORD PTR _addr$1378[ebp]
	push	eax
	push	4
	push	37					; 00000025H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	call	_copy_to_reg
	add	esp, 4
	mov	DWORD PTR _wd$1375[ebp], eax
; Line 1487
	jmp	$L1379
$L1377:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1380
; Line 1488
	mov	eax, DWORD PTR _i$1364[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	push	4
	push	35					; 00000023H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	DWORD PTR _wd$1375[ebp], eax
; Line 1489
	jmp	$L1381
$L1380:
	mov	eax, DWORD PTR _x$[ebp]
	cmp	DWORD PTR _dconst0_rtx, eax
	je	$L1383
	mov	eax, DWORD PTR _x$[ebp]
	cmp	DWORD PTR _const0_rtx, eax
	jne	$L1382
$L1383:
; Line 1490
	mov	eax, DWORD PTR _const0_rtx
	mov	DWORD PTR _wd$1375[ebp], eax
; Line 1491
	jmp	$L1384
$L1382:
; Line 1492
	call	_abort
$L1384:
$L1381:
$L1379:
; Line 1497
	mov	eax, DWORD PTR _i$1364[ebp]
	sub	eax, DWORD PTR _not_stack$1365[ebp]
	add	eax, DWORD PTR _skip$1368[ebp]
	shl	eax, 2
	add	eax, DWORD PTR _args_offset$1367[ebp]
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _args_addr$[ebp]
	push	eax
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _align$[ebp]
	push	eax
	push	0
	push	4
	mov	eax, DWORD PTR _wd$1375[ebp]
	push	eax
	call	_emit_push_insn
	add	esp, 36					; 00000024H
; Line 1499
$L1374:
	jmp	$L1372
$L1373:
; Line 1500
	jmp	$L1385
$L1362:
; Line 1504
	cmp	DWORD PTR _args_addr$[ebp], 0
	jne	$L1387
; Line 1505
	call	_gen_push_operand
	mov	DWORD PTR _addr$1386[ebp], eax
; Line 1506
	jmp	$L1388
$L1387:
; Line 1508
	mov	eax, DWORD PTR _args_so_far$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1389
; Line 1511
	mov	eax, DWORD PTR _args_so_far$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _args_addr$[ebp]
	push	eax
	call	_plus_constant
	add	esp, 8
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_memory_address
	add	esp, 8
	mov	DWORD PTR _addr$1386[ebp], eax
; Line 1512
	jmp	$L1390
$L1389:
; Line 1514
	mov	eax, DWORD PTR _args_so_far$[ebp]
	push	eax
	mov	eax, DWORD PTR _args_addr$[ebp]
	push	eax
	push	4
	push	44					; 0000002cH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_memory_address
	add	esp, 8
	mov	DWORD PTR _addr$1386[ebp], eax
$L1390:
$L1388:
; Line 1516
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	mov	eax, DWORD PTR _addr$1386[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	push	37					; 00000025H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	call	_emit_move_insn
	add	esp, 8
; Line 1517
$L1385:
$L1361:
; Line 1519
$ret$1357:
; Line 1523
	cmp	DWORD PTR _partial$[ebp], 0
	jle	$L1391
; Line 1524
	mov	eax, DWORD PTR _partial$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	mov	eax, DWORD PTR _reg$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_move_block_to_reg
	add	esp, 12					; 0000000cH
; Line 1526
$L1391:
	cmp	DWORD PTR _extra$[ebp], 0
	je	$L1392
; Line 1527
	mov	eax, DWORD PTR _extra$[ebp]
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	call	_anti_adjust_stack
	add	esp, 4
; Line 1528
$L1392:
$L1331:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_emit_push_insn ENDP
_TEXT	ENDS
PUBLIC	_force_operand
EXTRN	_alloca:NEAR
EXTRN	_int_size_in_bytes:NEAR
EXTRN	_get_identifier:NEAR
EXTRN	_end_sequence:NEAR
EXTRN	_start_sequence:NEAR
EXTRN	_gen_sequence:NEAR
_TEXT	SEGMENT
_argvec$ = -64
_old_inhibit_defer_pop$ = -44
_stack_padding$ = -16
_no_queue$ = -40
_use_insns$ = -20
_val$1417 = -76
_mode$1418 = -72
_mode$1429 = -88
_val$1430 = -92
_reg$1431 = -84
_partial$1432 = -96
_arg_size$1433 = -100
_va_alist$ = 8
_p$ = -60
_args_size$ = -8
_argnum$ = -68
_outmode$ = -48
_nargs$ = -36
_fun$ = -12
_orgfun$ = -56
_inc$ = -32
_count$ = -4
_regvec$ = -52
_argblock$ = -28
_args_so_far$ = -24
_emit_library_call PROC NEAR
; Line 1540
	push	ebp
	mov	ebp, esp
	sub	esp, 112				; 00000070H
	push	ebx
	push	esi
	push	edi
; Line 1542
	mov	DWORD PTR _args_size$[ebp], 0
; Line 1551
	mov	DWORD PTR _argblock$[ebp], 0
; Line 1555
	mov	eax, DWORD PTR _inhibit_defer_pop
	mov	DWORD PTR _old_inhibit_defer_pop$[ebp], eax
; Line 1556
	mov	DWORD PTR _stack_padding$[ebp], 0
; Line 1557
	mov	DWORD PTR _no_queue$[ebp], 0
; Line 1560
	lea	eax, DWORD PTR _va_alist$[ebp]
	mov	DWORD PTR _p$[ebp], eax
; Line 1561
	add	DWORD PTR _p$[ebp], 4
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax-4]
	mov	DWORD PTR _fun$[ebp], eax
	mov	eax, DWORD PTR _fun$[ebp]
	mov	DWORD PTR _orgfun$[ebp], eax
; Line 1562
	add	DWORD PTR _p$[ebp], 4
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax-4]
	mov	DWORD PTR _no_queue$[ebp], eax
; Line 1563
	add	DWORD PTR _p$[ebp], 4
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax-4]
	mov	DWORD PTR _outmode$[ebp], eax
; Line 1564
	add	DWORD PTR _p$[ebp], 4
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax-4]
	mov	DWORD PTR _nargs$[ebp], eax
; Line 1566
	mov	eax, DWORD PTR _nargs$[ebp]
	shl	eax, 2
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _regvec$[ebp], eax
; Line 1570
	mov	eax, DWORD PTR _nargs$[ebp]
	shl	eax, 4
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _argvec$[ebp], eax
; Line 1572
	mov	DWORD PTR _args_so_far$[ebp], 0
; Line 1573
	mov	DWORD PTR _count$[ebp], 0
	jmp	$L1414
$L1415:
	inc	DWORD PTR _count$[ebp]
$L1414:
	mov	eax, DWORD PTR _count$[ebp]
	cmp	DWORD PTR _nargs$[ebp], eax
	jle	$L1416
; Line 1575
	add	DWORD PTR _p$[ebp], 4
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax-4]
	mov	DWORD PTR _val$1417[ebp], eax
; Line 1576
	add	DWORD PTR _p$[ebp], 4
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax-4]
	mov	DWORD PTR _mode$1418[ebp], eax
; Line 1579
	mov	eax, DWORD PTR _val$1417[ebp]
	mov	ecx, DWORD PTR _count$[ebp]
	shl	ecx, 4
	mov	edx, DWORD PTR _argvec$[ebp]
	mov	DWORD PTR [ecx+edx], eax
; Line 1590
	mov	eax, DWORD PTR _val$1417[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	cmp	eax, DWORD PTR _mode$1418[ebp]
	je	$L1420
	mov	eax, DWORD PTR _val$1417[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sub	ecx, ecx
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L1420
; Line 1592
	mov	eax, DWORD PTR _mode$1418[ebp]
	push	eax
	call	_gen_reg_rtx
	add	esp, 4
	mov	DWORD PTR _val$1417[ebp], eax
; Line 1593
	push	0
	mov	eax, DWORD PTR _count$[ebp]
	shl	eax, 4
	mov	ecx, DWORD PTR _argvec$[ebp]
	mov	eax, DWORD PTR [eax+ecx]
	push	eax
	mov	eax, DWORD PTR _val$1417[ebp]
	push	eax
	call	_convert_move
	add	esp, 12					; 0000000cH
; Line 1595
	jmp	$L1421
$L1420:
; Line 1598
	mov	eax, DWORD PTR _val$1417[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1422
	mov	eax, DWORD PTR _val$1417[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1422
	mov	eax, DWORD PTR _val$1417[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1424
	mov	eax, DWORD PTR _val$1417[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1424
	mov	eax, DWORD PTR _val$1417[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1424
	mov	eax, DWORD PTR _val$1417[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1424
	mov	eax, DWORD PTR _val$1417[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2031616				; 001f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1423
$L1424:
	jmp	$L1422
$L1423:
; Line 1599
	push	0
	mov	eax, DWORD PTR _val$1417[ebp]
	push	eax
	call	_force_operand
	add	esp, 8
	mov	DWORD PTR _val$1417[ebp], eax
; Line 1601
$L1422:
$L1421:
	mov	eax, DWORD PTR _val$1417[ebp]
	mov	ecx, DWORD PTR _count$[ebp]
	shl	ecx, 4
	mov	edx, DWORD PTR _argvec$[ebp]
	mov	DWORD PTR [ecx+edx], eax
; Line 1602
	mov	eax, DWORD PTR _mode$1418[ebp]
	mov	ecx, DWORD PTR _count$[ebp]
	shl	ecx, 4
	mov	edx, DWORD PTR _argvec$[ebp]
	mov	DWORD PTR [ecx+edx+4], eax
; Line 1604
	test	BYTE PTR _target_flags, 16		; 00000010H
	je	$L2502
	cmp	DWORD PTR _args_so_far$[ebp], 8
	jge	$L2502
	mov	eax, DWORD PTR _args_so_far$[ebp]
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	push	eax
	mov	eax, DWORD PTR _mode$1418[ebp]
	push	eax
	push	34					; 00000022H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _count$[ebp]
	mov	edx, DWORD PTR _regvec$[ebp]
	mov	DWORD PTR [edx+ecx*4], eax
	jmp	$L2503
$L2502:
	mov	eax, DWORD PTR _count$[ebp]
	mov	ecx, DWORD PTR _regvec$[ebp]
	mov	DWORD PTR [ecx+eax*4], 0
$L2503:
; Line 1608
	test	BYTE PTR _target_flags, 16		; 00000010H
	je	$L2504
	cmp	DWORD PTR _args_so_far$[ebp], 8
	jge	$L2504
	cmp	DWORD PTR _mode$1418[ebp], 26		; 0000001aH
	jne	$L2506
	push	0
	call	_int_size_in_bytes
	add	esp, 4
	mov	DWORD PTR -104+[ebp], eax
	jmp	$L2507
$L2506:
	mov	eax, DWORD PTR _mode$1418[ebp]
	mov	eax, DWORD PTR _mode_size[eax*4]
	mov	DWORD PTR -104+[ebp], eax
$L2507:
	mov	eax, DWORD PTR _args_so_far$[ebp]
	add	eax, DWORD PTR -104+[ebp]
	cmp	eax, 8
	jle	$L2504
	mov	ecx, 2
	mov	eax, DWORD PTR _args_so_far$[ebp]
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	sub	ecx, eax
	mov	eax, DWORD PTR _count$[ebp]
	shl	eax, 4
	mov	edx, DWORD PTR _argvec$[ebp]
	mov	DWORD PTR [eax+edx+12], ecx
	jmp	$L2505
$L2504:
	mov	eax, DWORD PTR _count$[ebp]
	shl	eax, 4
	mov	ecx, DWORD PTR _argvec$[ebp]
	mov	DWORD PTR [eax+ecx+12], 0
$L2505:
; Line 1613
	cmp	DWORD PTR _mode$1418[ebp], 26		; 0000001aH
	je	$L2508
	mov	eax, DWORD PTR _mode$1418[ebp]
	mov	eax, DWORD PTR _mode_size[eax*4]
	add	eax, 3
	and	eax, -4					; fffffffcH
	add	DWORD PTR _args_so_far$[ebp], eax
	jmp	$L2509
$L2508:
	push	0
	call	_int_size_in_bytes
	add	esp, 4
	add	eax, 3
	and	eax, -4					; fffffffcH
	add	DWORD PTR _args_so_far$[ebp], eax
$L2509:
; Line 1614
	jmp	$L1415
$L1416:
; Line 1647
	mov	DWORD PTR _inc$[ebp], -1
; Line 1648
	mov	eax, DWORD PTR _nargs$[ebp]
	dec	eax
	mov	DWORD PTR _argnum$[ebp], eax
; Line 1653
	mov	eax, DWORD PTR _stack_padding$[ebp]
	mov	DWORD PTR _args_size$[ebp], eax
; Line 1655
	mov	DWORD PTR _count$[ebp], 0
	jmp	$L1426
$L1427:
	inc	DWORD PTR _count$[ebp]
	mov	eax, DWORD PTR _inc$[ebp]
	add	DWORD PTR _argnum$[ebp], eax
$L1426:
	mov	eax, DWORD PTR _count$[ebp]
	cmp	DWORD PTR _nargs$[ebp], eax
	jle	$L1428
; Line 1657
	mov	eax, DWORD PTR _argnum$[ebp]
	shl	eax, 4
	mov	ecx, DWORD PTR _argvec$[ebp]
	mov	eax, DWORD PTR [eax+ecx+4]
	mov	DWORD PTR _mode$1429[ebp], eax
; Line 1658
	mov	eax, DWORD PTR _argnum$[ebp]
	shl	eax, 4
	mov	ecx, DWORD PTR _argvec$[ebp]
	mov	eax, DWORD PTR [eax+ecx]
	mov	DWORD PTR _val$1430[ebp], eax
; Line 1659
	mov	eax, DWORD PTR _argnum$[ebp]
	mov	ecx, DWORD PTR _regvec$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _reg$1431[ebp], eax
; Line 1660
	mov	eax, DWORD PTR _argnum$[ebp]
	shl	eax, 4
	mov	ecx, DWORD PTR _argvec$[ebp]
	mov	eax, DWORD PTR [eax+ecx+12]
	mov	DWORD PTR _partial$1432[ebp], eax
; Line 1663
	cmp	DWORD PTR _reg$1431[ebp], 0
	je	$L1434
	cmp	DWORD PTR _partial$1432[ebp], 0
	jne	$L1434
; Line 1664
	mov	eax, DWORD PTR _val$1430[ebp]
	push	eax
	mov	eax, DWORD PTR _reg$1431[ebp]
	push	eax
	call	_emit_move_insn
	add	esp, 8
; Line 1665
	jmp	$L1435
$L1434:
; Line 1667
	mov	eax, DWORD PTR _args_size$[ebp]
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _argblock$[ebp]
	push	eax
	push	0
	mov	eax, DWORD PTR _reg$1431[ebp]
	push	eax
	mov	eax, DWORD PTR _partial$1432[ebp]
	push	eax
	push	0
	push	0
	mov	eax, DWORD PTR _mode$1429[ebp]
	push	eax
	mov	eax, DWORD PTR _val$1430[ebp]
	push	eax
	call	_emit_push_insn
	add	esp, 36					; 00000024H
$L1435:
; Line 1670
	cmp	DWORD PTR _reg$1431[ebp], 0
	je	$L1437
	cmp	DWORD PTR _partial$1432[ebp], 0
	je	$L1436
$L1437:
; Line 1671
	mov	eax, DWORD PTR _mode$1429[ebp]
	mov	eax, DWORD PTR _mode_size[eax*4]
	mov	DWORD PTR _arg_size$1433[ebp], eax
; Line 1672
	jmp	$L1438
$L1436:
; Line 1673
	mov	DWORD PTR _arg_size$1433[ebp], 0
$L1438:
; Line 1674
	cmp	DWORD PTR _partial$1432[ebp], 0
	je	$L1439
; Line 1678
	sub	ecx, ecx
	mov	eax, DWORD PTR _partial$1432[ebp]
	shl	eax, 2
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	shl	eax, 2
	sub	ecx, eax
	neg	ecx
	sub	DWORD PTR _arg_size$1433[ebp], ecx
; Line 1680
$L1439:
	mov	eax, DWORD PTR _arg_size$1433[ebp]
	add	DWORD PTR _args_size$[ebp], eax
; Line 1682
	inc	DWORD PTR _inhibit_defer_pop
; Line 1683
	jmp	$L1427
$L1428:
; Line 1686
	cmp	DWORD PTR _no_queue$[ebp], 0
	jne	$L1440
; Line 1687
	call	_emit_queue
; Line 1689
$L1440:
	push	0
	mov	eax, DWORD PTR _fun$[ebp]
	push	eax
	call	_prepare_call_address
	add	esp, 8
	mov	DWORD PTR _fun$[ebp], eax
; Line 1692
	call	_start_sequence
; Line 1693
	mov	DWORD PTR _count$[ebp], 0
	jmp	$L1441
$L1442:
	inc	DWORD PTR _count$[ebp]
$L1441:
	mov	eax, DWORD PTR _count$[ebp]
	cmp	DWORD PTR _nargs$[ebp], eax
	jle	$L1443
; Line 1694
	mov	eax, DWORD PTR _count$[ebp]
	mov	ecx, DWORD PTR _regvec$[ebp]
	cmp	DWORD PTR [ecx+eax*4], 0
	je	$L1444
; Line 1695
	mov	eax, DWORD PTR _count$[ebp]
	mov	ecx, DWORD PTR _regvec$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	push	0
	push	26					; 0000001aH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	call	_emit_insn
	add	esp, 4
; Line 1697
$L1444:
	jmp	$L1442
$L1443:
	call	_gen_sequence
	mov	DWORD PTR _use_insns$[ebp], eax
; Line 1698
	call	_end_sequence
; Line 1701
	mov	eax, DWORD PTR _args_size$[ebp]
	add	eax, 3
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	shl	eax, 2
	mov	DWORD PTR _args_size$[ebp], eax
; Line 1706
	inc	DWORD PTR _inhibit_defer_pop
; Line 1710
	cmp	DWORD PTR _outmode$[ebp], 0
	je	$L2510
	mov	eax, DWORD PTR _outmode$[ebp]
	push	eax
	call	_hard_libcall_value
	add	esp, 4
	mov	DWORD PTR -108+[ebp], eax
	jmp	$L2511
$L2510:
	mov	DWORD PTR -108+[ebp], 0
$L2511:
	test	BYTE PTR _target_flags, 16		; 00000010H
	je	$L2512
	cmp	DWORD PTR _args_so_far$[ebp], 8
	jge	$L2512
	mov	eax, DWORD PTR _args_so_far$[ebp]
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	push	eax
	push	0
	push	34					; 00000022H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR -112+[ebp], eax
	jmp	$L2513
$L2512:
	mov	DWORD PTR -112+[ebp], 0
$L2513:
	mov	eax, DWORD PTR _use_insns$[ebp]
	push	eax
	mov	eax, DWORD PTR _old_inhibit_defer_pop$[ebp]
	inc	eax
	push	eax
	mov	eax, DWORD PTR -108+[ebp]
	push	eax
	mov	eax, DWORD PTR -112+[ebp]
	push	eax
	mov	eax, DWORD PTR _args_size$[ebp]
	push	eax
	mov	eax, DWORD PTR _orgfun$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_get_identifier
	add	esp, 4
	push	eax
	mov	eax, DWORD PTR _fun$[ebp]
	push	eax
	call	_emit_call_1
	add	esp, 28					; 0000001cH
; Line 1711
	dec	DWORD PTR _inhibit_defer_pop
; Line 1712
$L1394:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_emit_library_call ENDP
_TEXT	ENDS
PUBLIC	_store_expr
PUBLIC	_expand_expr
PUBLIC	_expand_assignment
EXTRN	_stabilize_reference:NEAR
_TEXT	SEGMENT
_to$ = 8
_from$ = 12
_want_value$ = 16
_to_rtx$ = -4
_mode1$1456 = -28
_bitsize$1457 = -20
_volstruct$1458 = -16
_tem$1459 = -12
_bitpos$1460 = -24
_unsignedp$1461 = -8
_field$1463 = -32
_expand_assignment PROC NEAR
; Line 1731
	push	ebp
	mov	ebp, esp
	sub	esp, 36					; 00000024H
	push	ebx
	push	esi
	push	edi
; Line 1732
	mov	DWORD PTR _to_rtx$[ebp], 0
; Line 1736
	mov	eax, DWORD PTR _to$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	or	eax, eax
	jne	$L1453
; Line 1737
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _from$[ebp]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	jmp	$L1451
; Line 1744
$L1453:
; Line 1747
	mov	eax, DWORD PTR _to$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 47					; 0000002fH
	je	$L1455
	mov	eax, DWORD PTR _to$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 51					; 00000033H
	jne	$L1454
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L1454
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+28]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L1454
$L1455:
; Line 1751
	mov	DWORD PTR _volstruct$1458[ebp], 0
; Line 1752
	mov	eax, DWORD PTR _to$[ebp]
	mov	DWORD PTR _tem$1459[ebp], eax
; Line 1753
	mov	DWORD PTR _bitpos$1460[ebp], 0
; Line 1756
	mov	eax, DWORD PTR _to$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 47					; 0000002fH
	jne	$L1462
; Line 1758
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR _field$1463[ebp], eax
; Line 1759
	mov	eax, DWORD PTR _field$1463[ebp]
	mov	al, BYTE PTR [eax+36]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _field$1463[ebp]
	mov	ecx, DWORD PTR [ecx+28]
	imul	eax, DWORD PTR [ecx+20]
	mov	DWORD PTR _bitsize$1457[ebp], eax
; Line 1760
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	sar	eax, 24					; 00000018H
	mov	DWORD PTR _mode1$1456[ebp], eax
; Line 1761
	mov	eax, DWORD PTR _field$1463[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 12					; 0000000cH
	and	eax, 1
	mov	DWORD PTR _unsignedp$1461[ebp], eax
; Line 1763
	jmp	$L1464
$L1462:
; Line 1765
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	sar	eax, 24					; 00000018H
	mov	DWORD PTR _mode1$1456[ebp], eax
; Line 1766
	mov	eax, DWORD PTR _mode1$1456[ebp]
	mov	eax, DWORD PTR _mode_size[eax*4]
	shl	eax, 3
	mov	DWORD PTR _bitsize$1457[ebp], eax
; Line 1767
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 12					; 0000000cH
	and	eax, 1
	mov	DWORD PTR _unsignedp$1461[ebp], eax
; Line 1768
$L1464:
; Line 1773
$L1466:
; Line 1775
	mov	eax, DWORD PTR _tem$1459[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 47					; 0000002fH
	jne	$L1468
; Line 1777
	mov	eax, DWORD PTR _tem$1459[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax+48]
	add	DWORD PTR _bitpos$1460[ebp], eax
; Line 1778
	mov	eax, DWORD PTR _tem$1459[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 11					; 0000000bH
	test	al, 1
	je	$L1469
; Line 1779
	mov	DWORD PTR _volstruct$1458[ebp], 1
; Line 1780
$L1469:
; Line 1781
	jmp	$L1470
$L1468:
; Line 1783
	mov	eax, DWORD PTR _tem$1459[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 51					; 00000033H
	jne	$L1471
	mov	eax, DWORD PTR _tem$1459[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L1471
	mov	eax, DWORD PTR _tem$1459[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+28]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L1471
; Line 1787
	mov	eax, DWORD PTR _tem$1459[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+36]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _tem$1459[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	mov	ecx, DWORD PTR [ecx+28]
	imul	eax, DWORD PTR [ecx+20]
	mov	ecx, DWORD PTR _tem$1459[ebp]
	mov	ecx, DWORD PTR [ecx+28]
	imul	eax, DWORD PTR [ecx+20]
	add	DWORD PTR _bitpos$1460[ebp], eax
; Line 1788
	mov	eax, DWORD PTR _tem$1459[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 11					; 0000000bH
	test	al, 1
	je	$L1472
; Line 1789
	mov	DWORD PTR _volstruct$1458[ebp], 1
; Line 1790
$L1472:
; Line 1791
	jmp	$L1473
$L1471:
; Line 1792
	jmp	$L1467
$L1473:
$L1470:
; Line 1793
	mov	eax, DWORD PTR _tem$1459[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _tem$1459[ebp], eax
; Line 1794
	jmp	$L1466
$L1467:
; Line 1799
	cmp	DWORD PTR _mode1$1456[ebp], 25		; 00000019H
	jne	$L1474
	cmp	DWORD PTR _want_value$[ebp], 0
	je	$L1474
; Line 1800
	mov	eax, DWORD PTR _tem$1459[ebp]
	push	eax
	call	_stabilize_reference
	add	esp, 4
	mov	DWORD PTR _tem$1459[ebp], eax
; Line 1802
$L1474:
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _tem$1459[ebp]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	mov	DWORD PTR _to_rtx$[ebp], eax
; Line 1803
	cmp	DWORD PTR _volstruct$1458[ebp], 0
	je	$L1475
; Line 1805
	mov	eax, DWORD PTR _to_rtx$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1476
; Line 1806
	mov	eax, DWORD PTR _to_rtx$[ebp]
	mov	eax, DWORD PTR [eax]
	or	eax, 134217728				; 08000000H
	mov	ecx, DWORD PTR _to_rtx$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 1807
	jmp	$L1477
$L1476:
; Line 1808
	call	_abort
$L1477:
; Line 1811
$L1475:
; Line 1819
	cmp	DWORD PTR _want_value$[ebp], 0
	je	$L2514
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	sar	eax, 24					; 00000018H
	mov	DWORD PTR -36+[ebp], eax
	jmp	$L2515
$L2514:
	mov	DWORD PTR -36+[ebp], 0
$L2515:
	mov	eax, DWORD PTR _tem$1459[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_int_size_in_bytes
	add	esp, 4
	push	eax
	mov	eax, DWORD PTR _tem$1459[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+37]
	and	eax, 255				; 000000ffH
	sar	eax, 3
	push	eax
	mov	eax, DWORD PTR _unsignedp$1461[ebp]
	push	eax
	mov	eax, DWORD PTR -36+[ebp]
	push	eax
	mov	eax, DWORD PTR _from$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode1$1456[ebp]
	push	eax
	mov	eax, DWORD PTR _bitpos$1460[ebp]
	push	eax
	mov	eax, DWORD PTR _bitsize$1457[ebp]
	push	eax
	mov	eax, DWORD PTR _to_rtx$[ebp]
	push	eax
	call	_store_field
	add	esp, 36					; 00000024H
	jmp	$L1451
; Line 1825
$L1454:
	cmp	DWORD PTR _to_rtx$[ebp], 0
	jne	$L1478
; Line 1826
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _to$[ebp]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	mov	DWORD PTR _to_rtx$[ebp], eax
; Line 1830
$L1478:
	mov	eax, DWORD PTR _want_value$[ebp]
	push	eax
	mov	eax, DWORD PTR _to_rtx$[ebp]
	push	eax
	mov	eax, DWORD PTR _from$[ebp]
	push	eax
	call	_store_expr
	add	esp, 12					; 0000000cH
	jmp	$L1451
; Line 1831
$L1451:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_expand_assignment ENDP
_TEXT	ENDS
EXTRN	_expr_size:NEAR
_TEXT	SEGMENT
_exp$ = 8
_target$ = 12
_suggest_reg$ = 16
_temp$ = -8
_dont_return_target$ = -4
_unsignedp$1497 = -12
_store_expr PROC NEAR
; Line 1848
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 1850
	mov	DWORD PTR _dont_return_target$[ebp], 0
; Line 1854
	mov	eax, DWORD PTR _exp$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 52					; 00000034H
	jne	$L1485
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 6
	test	al, 1
	jne	$L1485
; Line 1856
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	push	eax
	call	_store_constructor
	add	esp, 8
; Line 1857
	mov	eax, DWORD PTR _target$[ebp]
	jmp	$L1482
; Line 1860
$L1485:
	cmp	DWORD PTR _suggest_reg$[ebp], 0
	je	$L1486
	mov	eax, DWORD PTR _target$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1486
	mov	eax, DWORD PTR _target$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 436207616				; 1a000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L1486
; Line 1867
	cmp	DWORD PTR _cse_not_expected, 0
	je	$L2516
	mov	DWORD PTR -16+[ebp], 0
	jmp	$L2517
$L2516:
	mov	eax, DWORD PTR _target$[ebp]
	mov	DWORD PTR -16+[ebp], eax
$L2517:
	push	0
	mov	eax, DWORD PTR _target$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	mov	eax, DWORD PTR -16+[ebp]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	mov	DWORD PTR _temp$[ebp], eax
; Line 1868
	mov	eax, DWORD PTR _temp$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 436207616				; 1a000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L1487
	mov	eax, DWORD PTR _temp$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sub	ecx, ecx
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L1487
; Line 1869
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_copy_to_reg
	add	esp, 4
	mov	DWORD PTR _temp$[ebp], eax
; Line 1870
$L1487:
	mov	DWORD PTR _dont_return_target$[ebp], 1
; Line 1872
	jmp	$L1488
$L1486:
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	call	_queued_subexp_p
	add	esp, 4
	or	eax, eax
	je	$L1489
; Line 1879
	push	0
	mov	eax, DWORD PTR _target$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	0
	mov	eax, DWORD PTR _exp$[ebp]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	mov	DWORD PTR _temp$[ebp], eax
; Line 1880
	mov	eax, DWORD PTR _temp$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 436207616				; 1a000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L1490
	mov	eax, DWORD PTR _temp$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sub	ecx, ecx
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L1490
; Line 1881
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_copy_to_reg
	add	esp, 4
	mov	DWORD PTR _temp$[ebp], eax
; Line 1882
$L1490:
	mov	DWORD PTR _dont_return_target$[ebp], 1
; Line 1884
	jmp	$L1491
$L1489:
; Line 1886
	push	0
	mov	eax, DWORD PTR _target$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	mov	DWORD PTR _temp$[ebp], eax
; Line 1891
	cmp	DWORD PTR _target$[ebp], 0
	je	$L1493
	mov	eax, DWORD PTR _target$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1493
	mov	eax, DWORD PTR _target$[ebp]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L1492
$L1493:
	mov	eax, DWORD PTR _temp$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1494
	mov	eax, DWORD PTR _temp$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1494
	mov	eax, DWORD PTR _temp$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1494
	mov	eax, DWORD PTR _temp$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1494
	mov	eax, DWORD PTR _temp$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2031616				; 001f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1492
$L1494:
; Line 1892
	mov	DWORD PTR _dont_return_target$[ebp], 1
; Line 1893
$L1492:
$L1491:
$L1488:
; Line 1898
	mov	eax, DWORD PTR _target$[ebp]
	cmp	DWORD PTR _temp$[ebp], eax
	je	$L1495
	mov	eax, DWORD PTR _exp$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L1495
; Line 1900
	push	1
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	call	_protect_from_queue
	add	esp, 8
	mov	DWORD PTR _target$[ebp], eax
; Line 1902
	mov	eax, DWORD PTR _temp$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, DWORD PTR _target$[ebp]
	mov	ecx, DWORD PTR [ecx]
	shl	ecx, 8
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L1496
	mov	eax, DWORD PTR _temp$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sub	ecx, ecx
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L1496
; Line 1904
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 12					; 0000000cH
	and	eax, 1
	mov	DWORD PTR _unsignedp$1497[ebp], eax
; Line 1905
	cmp	DWORD PTR _dont_return_target$[ebp], 0
	je	$L1498
; Line 1910
	mov	eax, DWORD PTR _unsignedp$1497[ebp]
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	call	_convert_to_mode
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _temp$[ebp], eax
; Line 1911
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	call	_emit_move_insn
	add	esp, 8
; Line 1913
	jmp	$L1499
$L1498:
; Line 1914
	mov	eax, DWORD PTR _unsignedp$1497[ebp]
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	call	_convert_move
	add	esp, 12					; 0000000cH
$L1499:
; Line 1917
	jmp	$L1500
$L1496:
	mov	eax, DWORD PTR _temp$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 436207616				; 1a000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1501
; Line 1919
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+37]
	and	eax, 255				; 000000ffH
	sar	eax, 3
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	push	eax
	call	_expr_size
	add	esp, 4
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	call	_emit_block_move
	add	esp, 16					; 00000010H
; Line 1920
	jmp	$L1502
$L1501:
; Line 1921
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	call	_emit_move_insn
	add	esp, 8
$L1502:
$L1500:
; Line 1923
$L1495:
	cmp	DWORD PTR _dont_return_target$[ebp], 0
	je	$L1503
; Line 1924
	mov	eax, DWORD PTR _temp$[ebp]
	jmp	$L1482
; Line 1925
$L1503:
	mov	eax, DWORD PTR _target$[ebp]
	jmp	$L1482
; Line 1926
$L1482:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_store_expr ENDP
_TEXT	ENDS
EXTRN	_list_length:NEAR
_TEXT	SEGMENT
_bitpos$1536 = -68
_unsignedp$1537 = -56
_exp$ = 8
_target$ = 12
_temp$1508 = -4
_elt$1510 = -8
_field$1516 = -24
_mode$1517 = -16
_bitsize$1518 = -20
_bitpos$1519 = -28
_unsignedp$1520 = -12
_elt$1523 = -48
_i$1524 = -32
_domain$1525 = -40
_minelt$1526 = -36
_maxelt$1527 = -52
_elttype$1528 = -44
_mode$1534 = -60
_bitsize$1535 = -64
_store_constructor PROC NEAR
; Line 1935
	push	ebp
	mov	ebp, esp
	sub	esp, 68					; 00000044H
	push	ebx
	push	esi
	push	edi
; Line 1939
	mov	eax, DWORD PTR _target$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1507
	mov	eax, DWORD PTR _target$[ebp]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jge	$L1507
; Line 1941
	mov	eax, DWORD PTR _target$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	call	_gen_reg_rtx
	add	esp, 4
	mov	DWORD PTR _temp$1508[ebp], eax
; Line 1942
	mov	eax, DWORD PTR _temp$1508[ebp]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	push	eax
	call	_store_constructor
	add	esp, 8
; Line 1943
	mov	eax, DWORD PTR _temp$1508[ebp]
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	call	_emit_move_insn
	add	esp, 8
; Line 1944
	jmp	$L1506
; Line 1947
$L1507:
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 19					; 00000013H
	jne	$L1509
; Line 1955
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	call	_list_length
	add	esp, 4
	mov	ebx, eax
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	call	_list_length
	add	esp, 4
	cmp	ebx, eax
	je	$L1511
; Line 1956
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_int_size_in_bytes
	add	esp, 4
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	call	_clear_storage
	add	esp, 8
; Line 1957
	jmp	$L1512
$L1511:
; Line 1959
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	push	0
	push	27					; 0000001bH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	call	_emit_insn
	add	esp, 4
$L1512:
; Line 1964
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR _elt$1510[ebp], eax
	jmp	$L1513
$L1514:
	mov	eax, DWORD PTR _elt$1510[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _elt$1510[ebp], eax
$L1513:
	cmp	DWORD PTR _elt$1510[ebp], 0
	je	$L1515
; Line 1966
	mov	eax, DWORD PTR _elt$1510[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _field$1516[ebp], eax
; Line 1972
	mov	eax, DWORD PTR _field$1516[ebp]
	mov	al, BYTE PTR [eax+36]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _field$1516[ebp]
	mov	ecx, DWORD PTR [ecx+28]
	imul	eax, DWORD PTR [ecx+20]
	mov	DWORD PTR _bitsize$1518[ebp], eax
; Line 1973
	mov	eax, DWORD PTR _field$1516[ebp]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	sar	eax, 24					; 00000018H
	mov	DWORD PTR _mode$1517[ebp], eax
; Line 1974
	mov	eax, DWORD PTR _field$1516[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 12					; 0000000cH
	and	eax, 1
	mov	DWORD PTR _unsignedp$1520[ebp], eax
; Line 1976
	mov	eax, DWORD PTR _field$1516[ebp]
	mov	eax, DWORD PTR [eax+48]
	mov	DWORD PTR _bitpos$1519[ebp], eax
; Line 1983
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_int_size_in_bytes
	add	esp, 4
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+37]
	and	eax, 255				; 000000ffH
	sar	eax, 3
	push	eax
	push	0
	push	0
	mov	eax, DWORD PTR _elt$1510[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	mov	eax, DWORD PTR _mode$1517[ebp]
	push	eax
	mov	eax, DWORD PTR _bitpos$1519[ebp]
	push	eax
	mov	eax, DWORD PTR _bitsize$1518[ebp]
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	call	_store_field
	add	esp, 36					; 00000024H
; Line 1984
	jmp	$L1514
$L1515:
; Line 1986
	jmp	$L1521
$L1509:
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 16					; 00000010H
	jne	$L1522
; Line 1990
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _domain$1525[ebp], eax
; Line 1991
	mov	eax, DWORD PTR _domain$1525[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _minelt$1526[ebp], eax
; Line 1992
	mov	eax, DWORD PTR _domain$1525[ebp]
	mov	eax, DWORD PTR [eax+60]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _maxelt$1527[ebp], eax
; Line 1993
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _elttype$1528[ebp], eax
; Line 1998
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	call	_list_length
	add	esp, 4
	mov	ecx, DWORD PTR _maxelt$1527[ebp]
	sub	ecx, DWORD PTR _minelt$1526[ebp]
	inc	ecx
	cmp	eax, ecx
	jge	$L1529
; Line 1999
	mov	eax, DWORD PTR _maxelt$1527[ebp]
	sub	eax, DWORD PTR _minelt$1526[ebp]
	inc	eax
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	call	_clear_storage
	add	esp, 8
; Line 2000
	jmp	$L1530
$L1529:
; Line 2002
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	push	0
	push	27					; 0000001bH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	call	_emit_insn
	add	esp, 4
$L1530:
; Line 2009
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR _elt$1523[ebp], eax
	mov	DWORD PTR _i$1524[ebp], 0
	jmp	$L1531
$L1532:
	mov	eax, DWORD PTR _elt$1523[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _elt$1523[ebp], eax
	inc	DWORD PTR _i$1524[ebp]
$L1531:
	cmp	DWORD PTR _elt$1523[ebp], 0
	je	$L1533
; Line 2016
	mov	eax, DWORD PTR _elttype$1528[ebp]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	sar	eax, 24					; 00000018H
	mov	DWORD PTR _mode$1534[ebp], eax
; Line 2017
	mov	eax, DWORD PTR _mode$1534[ebp]
	mov	eax, DWORD PTR _mode_size[eax*4]
	shl	eax, 3
	mov	DWORD PTR _bitsize$1535[ebp], eax
; Line 2018
	mov	eax, DWORD PTR _elttype$1528[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 12					; 0000000cH
	and	eax, 1
	mov	DWORD PTR _unsignedp$1537[ebp], eax
; Line 2021
	mov	eax, DWORD PTR _elttype$1528[ebp]
	mov	al, BYTE PTR [eax+36]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _elttype$1528[ebp]
	mov	ecx, DWORD PTR [ecx+28]
	imul	eax, DWORD PTR [ecx+20]
	imul	eax, DWORD PTR _i$1524[ebp]
	mov	DWORD PTR _bitpos$1536[ebp], eax
; Line 2028
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_int_size_in_bytes
	add	esp, 4
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+37]
	and	eax, 255				; 000000ffH
	sar	eax, 3
	push	eax
	push	0
	push	0
	mov	eax, DWORD PTR _elt$1523[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	mov	eax, DWORD PTR _mode$1534[ebp]
	push	eax
	mov	eax, DWORD PTR _bitpos$1536[ebp]
	push	eax
	mov	eax, DWORD PTR _bitsize$1535[ebp]
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	call	_store_field
	add	esp, 36					; 00000024H
; Line 2029
	jmp	$L1532
$L1533:
; Line 2031
$L1522:
$L1521:
$L1506:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_store_constructor ENDP
_TEXT	ENDS
EXTRN	_store_bit_field:NEAR
EXTRN	_extract_bit_field:NEAR
_TEXT	SEGMENT
_target$ = 8
_bitsize$ = 12
_bitpos$ = 16
_mode$ = 20
_exp$ = 24
_value_mode$ = 28
_unsignedp$ = 32
_align$ = 36
_total_size$ = 40
_addr$1552 = -8
_to_rtx$1553 = -4
_store_field PROC NEAR
; Line 2058
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 2064
	cmp	DWORD PTR _mode$[ebp], 25		; 00000019H
	je	$L1549
	mov	eax, DWORD PTR _target$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1549
	mov	eax, DWORD PTR _target$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1548
$L1549:
; Line 2069
	mov	eax, DWORD PTR _total_size$[ebp]
	push	eax
	mov	eax, DWORD PTR _align$[ebp]
	push	eax
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _exp$[ebp]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	mov	eax, DWORD PTR _bitpos$[ebp]
	push	eax
	mov	eax, DWORD PTR _bitsize$[ebp]
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	call	_store_bit_field
	add	esp, 28					; 0000001cH
; Line 2070
	cmp	DWORD PTR _value_mode$[ebp], 0
	je	$L1550
; Line 2072
	mov	eax, DWORD PTR _total_size$[ebp]
	push	eax
	mov	eax, DWORD PTR _align$[ebp]
	push	eax
	push	0
	mov	eax, DWORD PTR _value_mode$[ebp]
	push	eax
	push	0
	mov	eax, DWORD PTR _unsignedp$[ebp]
	push	eax
	mov	eax, DWORD PTR _bitpos$[ebp]
	push	eax
	mov	eax, DWORD PTR _bitsize$[ebp]
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	call	_extract_bit_field
	add	esp, 36					; 00000024H
	jmp	$L1547
; Line 2073
$L1550:
	mov	eax, DWORD PTR _const0_rtx
	jmp	$L1547
; Line 2075
	jmp	$L1551
$L1548:
; Line 2077
	mov	eax, DWORD PTR _target$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _addr$1552[ebp], eax
; Line 2084
	cmp	DWORD PTR _value_mode$[ebp], 0
	je	$L1554
	mov	eax, DWORD PTR _addr$1552[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1554
	mov	eax, DWORD PTR _addr$1552[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1554
	mov	eax, DWORD PTR _addr$1552[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1554
	mov	eax, DWORD PTR _addr$1552[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1554
	mov	eax, DWORD PTR _addr$1552[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1554
; Line 2085
	mov	eax, DWORD PTR _addr$1552[ebp]
	push	eax
	call	_copy_to_reg
	add	esp, 4
	mov	DWORD PTR _addr$1552[ebp], eax
; Line 2089
$L1554:
; Line 2091
	mov	eax, DWORD PTR _bitpos$[ebp]
	cdq
	and	edx, 7
	add	eax, edx
	sar	eax, 3
	push	eax
	mov	eax, DWORD PTR _addr$1552[ebp]
	push	eax
	call	_plus_constant
	add	esp, 8
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	call	_change_address
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _to_rtx$1553[ebp], eax
; Line 2092
	mov	eax, DWORD PTR _to_rtx$1553[ebp]
	mov	eax, DWORD PTR [eax]
	or	eax, 268435456				; 10000000H
	mov	ecx, DWORD PTR _to_rtx$1553[ebp]
	mov	DWORD PTR [ecx], eax
; Line 2094
	cmp	DWORD PTR _value_mode$[ebp], 1
	sbb	eax, eax
	inc	eax
	push	eax
	mov	eax, DWORD PTR _to_rtx$1553[ebp]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	push	eax
	call	_store_expr
	add	esp, 12					; 0000000cH
	jmp	$L1547
; Line 2095
$L1551:
; Line 2096
$L1547:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_store_field ENDP
_TEXT	ENDS
EXTRN	_expand_mult:NEAR
_TEXT	SEGMENT
_value$ = 8
_target$ = 12
_binoptab$ = -8
_op2$ = -4
_subtarget$ = -12
_force_operand PROC NEAR
; Line 2106
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 2107
	mov	DWORD PTR _binoptab$[ebp], 0
; Line 2110
	cmp	DWORD PTR _target$[ebp], 0
	je	$L2518
	mov	eax, DWORD PTR _target$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2518
	mov	eax, DWORD PTR _target$[ebp]
	mov	DWORD PTR _subtarget$[ebp], eax
	jmp	$L2519
$L2518:
	mov	DWORD PTR _subtarget$[ebp], 0
$L2519:
; Line 2112
	mov	eax, DWORD PTR _value$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1561
; Line 2113
	mov	eax, DWORD PTR _add_optab
	mov	DWORD PTR _binoptab$[ebp], eax
; Line 2114
	jmp	$L1562
$L1561:
	mov	eax, DWORD PTR _value$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2949120				; 002d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1563
; Line 2115
	mov	eax, DWORD PTR _sub_optab
	mov	DWORD PTR _binoptab$[ebp], eax
; Line 2116
	jmp	$L1564
$L1563:
	mov	eax, DWORD PTR _value$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3080192				; 002f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1565
; Line 2118
	mov	eax, DWORD PTR _value$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _op2$[ebp], eax
; Line 2120
	mov	eax, DWORD PTR _op2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1566
	mov	eax, DWORD PTR _op2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1566
	mov	eax, DWORD PTR _op2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1566
	mov	eax, DWORD PTR _op2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1566
	mov	eax, DWORD PTR _op2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1567
	mov	eax, DWORD PTR _op2$[ebp]
	cmp	DWORD PTR _subtarget$[ebp], eax
	jne	$L1566
$L1567:
; Line 2121
	mov	DWORD PTR _subtarget$[ebp], 0
; Line 2122
$L1566:
; Line 2125
	push	0
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	push	0
	mov	eax, DWORD PTR _op2$[ebp]
	push	eax
	call	_force_operand
	add	esp, 8
	push	eax
	mov	eax, DWORD PTR _subtarget$[ebp]
	push	eax
	mov	eax, DWORD PTR _value$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_force_operand
	add	esp, 8
	push	eax
	mov	eax, DWORD PTR _value$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	call	_expand_mult
	add	esp, 20					; 00000014H
	jmp	$L1557
; Line 2128
$L1565:
$L1564:
$L1562:
	cmp	DWORD PTR _binoptab$[ebp], 0
	je	$L1568
; Line 2130
	mov	eax, DWORD PTR _value$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _op2$[ebp], eax
; Line 2132
	mov	eax, DWORD PTR _op2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1569
	mov	eax, DWORD PTR _op2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1569
	mov	eax, DWORD PTR _op2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1569
	mov	eax, DWORD PTR _op2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1569
	mov	eax, DWORD PTR _op2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1570
	mov	eax, DWORD PTR _op2$[ebp]
	cmp	DWORD PTR _subtarget$[ebp], eax
	jne	$L1569
$L1570:
; Line 2133
	mov	DWORD PTR _subtarget$[ebp], 0
; Line 2134
$L1569:
; Line 2135
	mov	eax, DWORD PTR _binoptab$[ebp]
	cmp	DWORD PTR _sub_optab, eax
	jne	$L1571
	mov	eax, DWORD PTR _op2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1571
	mov	eax, DWORD PTR _op2$[ebp]
	cmp	DWORD PTR [eax+4], 0
	jge	$L1571
; Line 2137
	mov	eax, DWORD PTR _add_optab
	mov	DWORD PTR _binoptab$[ebp], eax
; Line 2138
	mov	eax, DWORD PTR _op2$[ebp]
	mov	eax, DWORD PTR [eax+4]
	neg	eax
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _op2$[ebp], eax
; Line 2140
$L1571:
; Line 2143
	push	3
	push	0
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	push	0
	mov	eax, DWORD PTR _op2$[ebp]
	push	eax
	call	_force_operand
	add	esp, 8
	push	eax
	mov	eax, DWORD PTR _subtarget$[ebp]
	push	eax
	mov	eax, DWORD PTR _value$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_force_operand
	add	esp, 8
	push	eax
	mov	eax, DWORD PTR _binoptab$[ebp]
	push	eax
	mov	eax, DWORD PTR _value$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	call	_expand_binop
	add	esp, 28					; 0000001cH
	jmp	$L1557
; Line 2147
$L1568:
	mov	eax, DWORD PTR _value$[ebp]
	jmp	$L1557
; Line 2148
$L1557:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_force_operand ENDP
_TEXT	ENDS
EXTRN	_save_expr:NEAR
EXTRN	_build_nt:NEAR
EXTRN	_assign_stack_local:NEAR
EXTRN	_build_component_ref:NEAR
EXTRN	_chainon:NEAR
EXTRN	_tree_cons:NEAR
_TEXT	SEGMENT
_lhs$ = 8
_list$ = 12
_tail$ = -4
_parts$ = -8
_part$1583 = -16
_part_type$1584 = -12
_save_noncopied_parts PROC NEAR
; Line 2184
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 2186
	mov	DWORD PTR _parts$[ebp], 0
; Line 2188
	mov	eax, DWORD PTR _list$[ebp]
	mov	DWORD PTR _tail$[ebp], eax
	jmp	$L1578
$L1579:
	mov	eax, DWORD PTR _tail$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _tail$[ebp], eax
$L1578:
	cmp	DWORD PTR _tail$[ebp], 0
	je	$L1580
; Line 2189
	mov	eax, DWORD PTR _tail$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 3
	jne	$L1581
; Line 2190
	push	0
	mov	eax, DWORD PTR _tail$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_save_noncopied_parts
	add	esp, 8
	push	eax
	mov	eax, DWORD PTR _parts$[ebp]
	push	eax
	call	_chainon
	add	esp, 8
	mov	DWORD PTR _parts$[ebp], eax
; Line 2191
	jmp	$L1582
$L1581:
; Line 2193
	mov	eax, DWORD PTR _tail$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _part$1583[ebp], eax
; Line 2194
	mov	eax, DWORD PTR _part$1583[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _part_type$1584[ebp], eax
; Line 2197
	mov	eax, DWORD PTR _parts$[ebp]
	push	eax
	mov	eax, DWORD PTR _part_type$1584[ebp]
	push	eax
	call	_int_size_in_bytes
	add	esp, 4
	push	eax
	mov	eax, DWORD PTR _part_type$1584[ebp]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	sar	eax, 24					; 00000018H
	push	eax
	call	_assign_stack_local
	add	esp, 8
	push	eax
	push	0
	push	115					; 00000073H
	call	_build_nt
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	eax, DWORD PTR _parts$[ebp]
	push	eax
	mov	eax, DWORD PTR _part$1583[ebp]
	push	eax
	mov	eax, DWORD PTR _lhs$[ebp]
	push	eax
	call	_build_component_ref
	add	esp, 16					; 00000010H
	push	eax
	call	_save_expr
	add	esp, 4
	push	eax
	call	_tree_cons
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _parts$[ebp], eax
; Line 2198
	push	0
	mov	eax, DWORD PTR _parts$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	mov	eax, DWORD PTR _parts$[ebp]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	call	_store_expr
	add	esp, 12					; 0000000cH
; Line 2199
$L1582:
	jmp	$L1579
$L1580:
; Line 2200
	mov	eax, DWORD PTR _parts$[ebp]
	jmp	$L1575
; Line 2201
$L1575:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_save_noncopied_parts ENDP
_subtarget$ = 8
_otherop$ = 12
_validate_subtarget PROC NEAR
; Line 2211
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 2212
	mov	eax, DWORD PTR _otherop$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 6
	test	al, 1
	je	$L1590
; Line 2213
	mov	eax, DWORD PTR _subtarget$[ebp]
	jmp	$L1589
; Line 2214
$L1590:
; Line 2215
	mov	eax, DWORD PTR _otherop$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 43					; 0000002bH
	jne	$L1591
	mov	eax, DWORD PTR _otherop$[ebp]
	mov	ecx, DWORD PTR _subtarget$[ebp]
	cmp	DWORD PTR [eax+76], ecx
	je	$L1591
; Line 2216
	mov	eax, DWORD PTR _subtarget$[ebp]
	jmp	$L1589
; Line 2217
$L1591:
	sub	eax, eax
	jmp	$L1589
; Line 2218
$L1589:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_validate_subtarget ENDP
_TEXT	ENDS
PUBLIC	_do_pending_stack_adjust
PUBLIC	_jumpifnot
PUBLIC	_do_jump
EXTRN	_mode_wider_mode:BYTE
EXTRN	_integer_zerop:NEAR
EXTRN	_bcc_gen_fctn:BYTE
EXTRN	_inside_loop:NEAR
EXTRN	_optimize:DWORD
EXTRN	_gen_beq:NEAR
EXTRN	_type_for_size:NEAR
EXTRN	_expand_fix:NEAR
EXTRN	_const1_rtx:DWORD
EXTRN	_expand_float:NEAR
EXTRN	_save_expr_regs:DWORD
EXTRN	_integer_zero_node:DWORD
EXTRN	_build_int_2:NEAR
EXTRN	_emit_0_to_1_insn:NEAR
EXTRN	_error_with_decl:NEAR
EXTRN	_gen_jump:NEAR
EXTRN	_integer_type_node:DWORD
EXTRN	_copy_rtx:NEAR
EXTRN	_build:NEAR
EXTRN	_char_type_node:DWORD
EXTRN	_flag_force_mem:DWORD
EXTRN	_eliminate_constant_term:NEAR
EXTRN	_flag_force_addr:DWORD
EXTRN	_int_fits_type_p:NEAR
EXTRN	_exact_log2:NEAR
EXTRN	_copy_all_regs:NEAR
EXTRN	_smul_widen_optab:DWORD
EXTRN	_build_pointer_type:NEAR
EXTRN	_umul_widen_optab:DWORD
EXTRN	_force_reg:NEAR
EXTRN	_flag_volatile:DWORD
EXTRN	_output_constant_def:NEAR
EXTRN	_immed_real_const:NEAR
EXTRN	_flodiv_optab:DWORD
EXTRN	_immed_double_const:NEAR
EXTRN	_emit_insns:NEAR
EXTRN	_build_type_variant:NEAR
EXTRN	_ior_optab:DWORD
EXTRN	_xor_optab:DWORD
EXTRN	_expand_shift:NEAR
EXTRN	_ashl_optab:DWORD
EXTRN	_expand_bit_and:NEAR
EXTRN	_ashr_optab:DWORD
EXTRN	_fold:NEAR
EXTRN	_lshl_optab:DWORD
EXTRN	_expand_divmod:NEAR
EXTRN	_lshr_optab:DWORD
EXTRN	_convert:NEAR
EXTRN	_rotl_optab:DWORD
EXTRN	_rotr_optab:DWORD
EXTRN	_size_in_bytes:NEAR
EXTRN	_emit_barrier:NEAR
EXTRN	_neg_optab:DWORD
EXTRN	_abs_optab:DWORD
EXTRN	_ffs_optab:DWORD
_BSS	SEGMENT
_cleanups_of_this_call$S1060 DD 01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+1
$SG1623	DB	'prior parameter''s size depends on `%s''', 00H
_DATA	ENDS
_TEXT	SEGMENT
_type$ = -28
_exch$1857 = -184
_mode$ = -4
_code$ = -12
_this_optab$ = -24
_variant_type$1668 = -68
_negate_1$ = -20
_array_adr$1669 = -72
_subtarget$ = -40
_index$1670 = -76
_original_target$ = -8
_thenexp$1863 = -192
_elt$1671 = -80
_ignore$ = -36
_thenv$1864 = -188
_i$1673 = -84
_arg0$1674 = -88
_arg1$1675 = -92
_tem$1740 = -136
_constant_term$1741 = -140
_index$1680 = -96
_i$1682 = -100
_init$1683 = -104
_negated$1748 = -144
_mode1$1689 = -128
_t1$1754 = -148
_volstruct$1690 = -116
_bitsize$1691 = -120
_tem$1692 = -112
_bitpos$1693 = -124
_unsignedp$1694 = -108
_field$1696 = -132
_innermode$1764 = -152
_reg$1641 = -48
_lhs$1836 = -176
_rhs$1837 = -172
_noncopied_parts$1838 = -180
_unsignedp$1774 = -156
_temp$1777 = -160
_constructor$1649 = -52
_elt$1652 = -56
_unsignedp$1782 = -164
_exp$ = 8
_temp$1785 = -168
_target$ = 12
_tmode$ = 16
_exp1$1659 = -64
_modifier$ = 20
_exp2$1660 = -60
_op0$ = -16
_op1$ = -44
_temp$ = -32
_expand_expr PROC NEAR
; Line 2226
	push	ebp
	mov	ebp, esp
	sub	esp, 216				; 000000d8H
	push	ebx
	push	esi
	push	edi
; Line 2228
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _type$[ebp], eax
; Line 2229
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	sar	eax, 24					; 00000018H
	mov	DWORD PTR _mode$[ebp], eax
; Line 2230
	mov	eax, DWORD PTR _exp$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _code$[ebp], eax
; Line 2234
	cmp	DWORD PTR _target$[ebp], 0
	je	$L2520
	mov	eax, DWORD PTR _target$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2520
	mov	eax, DWORD PTR _target$[ebp]
	mov	DWORD PTR _subtarget$[ebp], eax
	jmp	$L2521
$L2520:
	mov	DWORD PTR _subtarget$[ebp], 0
$L2521:
; Line 2235
	mov	eax, DWORD PTR _target$[ebp]
	mov	DWORD PTR _original_target$[ebp], eax
; Line 2236
	mov	eax, DWORD PTR _const0_rtx
	sub	eax, DWORD PTR _target$[ebp]
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	mov	DWORD PTR _ignore$[ebp], eax
; Line 2240
	cmp	DWORD PTR _subtarget$[ebp], 0
	je	$L1608
	mov	eax, DWORD PTR _subtarget$[ebp]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jge	$L1608
; Line 2241
	mov	DWORD PTR _subtarget$[ebp], 0
; Line 2244
$L1608:
	cmp	DWORD PTR _optimize, 0
	je	$L1610
	call	_inside_loop
	or	eax, eax
	je	$L1610
; Line 2245
	mov	DWORD PTR _subtarget$[ebp], 0
; Line 2247
$L1610:
	cmp	DWORD PTR _ignore$[ebp], 0
	je	$L1611
	mov	DWORD PTR _target$[ebp], 0
	mov	DWORD PTR _original_target$[ebp], 0
; Line 2254
$L1611:
	cmp	DWORD PTR _cse_not_expected, 0
	jne	$L1612
	cmp	DWORD PTR _mode$[ebp], 26		; 0000001aH
	je	$L1612
; Line 2255
	mov	eax, DWORD PTR _subtarget$[ebp]
	mov	DWORD PTR _target$[ebp], eax
; Line 2261
$L1612:
	cmp	DWORD PTR _mode$[ebp], 4
	je	$L1613
	cmp	DWORD PTR _modifier$[ebp], 1
	jne	$L1613
; Line 2262
	mov	DWORD PTR _modifier$[ebp], 0
; Line 2265
$L1613:
; Line 2266
	cmp	DWORD PTR _ignore$[ebp], 0
	je	$L1614
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 11					; 0000000bH
	test	al, 1
	je	$L1614
	cmp	DWORD PTR _mode$[ebp], 0
	je	$L1614
	cmp	DWORD PTR _mode$[ebp], 26		; 0000001aH
	je	$L1614
; Line 2268
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_gen_reg_rtx
	add	esp, 4
	mov	DWORD PTR _target$[ebp], eax
; Line 2269
	mov	eax, DWORD PTR _modifier$[ebp]
	push	eax
	push	0
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	mov	DWORD PTR _temp$[ebp], eax
; Line 2270
	mov	eax, DWORD PTR _target$[ebp]
	cmp	DWORD PTR _temp$[ebp], eax
	je	$L1615
; Line 2271
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	call	_emit_move_insn
	add	esp, 8
; Line 2272
$L1615:
	mov	eax, DWORD PTR _target$[ebp]
	jmp	$L1596
; Line 2275
$L1614:
	mov	eax, DWORD PTR _code$[ebp]
	mov	DWORD PTR -216+[ebp], eax
	jmp	$L1616
; Line 2277
$L1620:
; Line 2278
	mov	eax, DWORD PTR _exp$[ebp]
	cmp	DWORD PTR [eax+76], 0
	jne	$L1621
; Line 2280
	push	OFFSET $SG1623
	mov	eax, DWORD PTR _exp$[ebp]
	push	eax
	call	_error_with_decl
	add	esp, 8
; Line 2281
	mov	eax, DWORD PTR _const0_rtx
	jmp	$L1596
; Line 2284
$L1621:
$L1624:
; Line 2287
	mov	eax, DWORD PTR _exp$[ebp]
	cmp	DWORD PTR [eax+76], 0
	jne	$L1625
; Line 2288
	call	_abort
; Line 2292
$L1625:
; Line 2293
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1626
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1626
; Line 2295
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+76]
	push	eax
	call	_change_address
	add	esp, 12					; 0000000cH
	jmp	$L1596
; Line 2296
$L1626:
; Line 2297
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1627
	cmp	DWORD PTR _modifier$[ebp], 2
	je	$L1627
; Line 2304
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	sar	eax, 24					; 00000018H
	push	eax
	call	_memory_address_p
	add	esp, 8
	or	eax, eax
	je	$L1629
	cmp	DWORD PTR _flag_force_addr, 0
	je	$L1628
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1630
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1630
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1630
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1628
$L1630:
$L1629:
; Line 2306
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_copy_rtx
	add	esp, 4
	push	eax
	push	0
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+76]
	push	eax
	call	_change_address
	add	esp, 12					; 0000000cH
	jmp	$L1596
; Line 2307
$L1628:
; Line 2308
$L1627:
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+76]
	jmp	$L1596
; Line 2310
$L1631:
; Line 2311
	mov	eax, DWORD PTR _mode$[ebp]
	mov	eax, DWORD PTR _mode_size[eax*4]
	shl	eax, 3
	cmp	eax, 32					; 00000020H
	jg	$L1632
; Line 2312
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	jmp	$L1596
; Line 2315
$L1632:
; Line 2317
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	call	_immed_double_const
	add	esp, 12					; 0000000cH
	jmp	$L1596
; Line 2319
$L1633:
; Line 2320
	push	0
	push	0
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+64]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	jmp	$L1596
; Line 2322
$L1634:
; Line 2325
	cmp	DWORD PTR _cse_not_expected, 0
	jne	$L1635
; Line 2326
	mov	eax, DWORD PTR _exp$[ebp]
	push	eax
	call	_immed_real_const
	add	esp, 4
	jmp	$L1596
; Line 2327
$L1635:
$L1636:
; Line 2329
	mov	eax, DWORD PTR _exp$[ebp]
	cmp	DWORD PTR [eax+20], 0
	jne	$L1637
; Line 2330
	mov	eax, DWORD PTR _exp$[ebp]
	push	eax
	call	_output_constant_def
	add	esp, 4
; Line 2335
$L1637:
; Line 2337
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1638
	cmp	DWORD PTR _modifier$[ebp], 2
	je	$L1638
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_memory_address_p
	add	esp, 8
	or	eax, eax
	jne	$L1638
; Line 2339
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_copy_rtx
	add	esp, 4
	push	eax
	push	0
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	call	_change_address
	add	esp, 12					; 0000000cH
	jmp	$L1596
; Line 2340
$L1638:
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+20]
	jmp	$L1596
; Line 2342
$L1639:
; Line 2343
	mov	eax, DWORD PTR _exp$[ebp]
	cmp	DWORD PTR [eax+28], 0
	jne	$L1640
; Line 2345
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_gen_reg_rtx
	add	esp, 4
	mov	DWORD PTR _reg$1641[ebp], eax
; Line 2346
	mov	eax, DWORD PTR _reg$1641[ebp]
	mov	ecx, DWORD PTR _exp$[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 2347
	push	0
	mov	eax, DWORD PTR _reg$1641[ebp]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_store_expr
	add	esp, 12					; 0000000cH
; Line 2348
	cmp	DWORD PTR _optimize, 0
	jne	$L1642
; Line 2350
	mov	eax, DWORD PTR _save_expr_regs
	push	eax
	mov	eax, DWORD PTR _reg$1641[ebp]
	push	eax
	push	0
	push	2
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	DWORD PTR _save_expr_regs, eax
; Line 2351
$L1642:
; Line 2353
$L1640:
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	jmp	$L1596
; Line 2355
$L1643:
; Line 2356
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+16]
	or	eax, 32768				; 00008000H
	mov	ecx, DWORD PTR _exp$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 2357
	mov	eax, DWORD PTR _modifier$[ebp]
	push	eax
	mov	eax, DWORD PTR _tmode$[ebp]
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	mov	DWORD PTR _temp$[ebp], eax
; Line 2358
	mov	eax, DWORD PTR _temp$[ebp]
	jmp	$L1596
; Line 2360
$L1644:
; Line 2361
	mov	eax, DWORD PTR _exp$[ebp]
	mov	ecx, DWORD PTR _const0_rtx
	cmp	DWORD PTR [eax+24], ecx
	jne	$L1645
; Line 2362
	call	_abort
; Line 2363
$L1645:
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_emit_insns
	add	esp, 4
; Line 2364
	mov	eax, DWORD PTR _const0_rtx
	mov	ecx, DWORD PTR _exp$[ebp]
	mov	DWORD PTR [ecx+24], eax
; Line 2365
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	jmp	$L1596
; Line 2367
$L1647:
; Line 2369
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 2
	test	al, 1
	je	$L1648
; Line 2373
	mov	eax, DWORD PTR _exp$[ebp]
	push	eax
	call	_output_constant_def
	add	esp, 4
	mov	DWORD PTR _constructor$1649[ebp], eax
; Line 2375
	mov	eax, DWORD PTR _constructor$1649[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _constructor$1649[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	call	_memory_address_p
	add	esp, 8
	or	eax, eax
	jne	$L1650
; Line 2377
	mov	eax, DWORD PTR _constructor$1649[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	0
	mov	eax, DWORD PTR _constructor$1649[ebp]
	push	eax
	call	_change_address
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _constructor$1649[ebp], eax
; Line 2378
$L1650:
	mov	eax, DWORD PTR _constructor$1649[ebp]
	jmp	$L1596
; Line 2381
$L1648:
	cmp	DWORD PTR _ignore$[ebp], 0
	je	$L1651
; Line 2384
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR _elt$1652[ebp], eax
	jmp	$L1653
$L1654:
	mov	eax, DWORD PTR _elt$1652[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _elt$1652[ebp], eax
$L1653:
	cmp	DWORD PTR _elt$1652[ebp], 0
	je	$L1655
; Line 2385
	push	0
	push	0
	mov	eax, DWORD PTR _const0_rtx
	push	eax
	mov	eax, DWORD PTR _elt$1652[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	jmp	$L1654
$L1655:
; Line 2386
	mov	eax, DWORD PTR _const0_rtx
	jmp	$L1596
; Line 2388
	jmp	$L1656
$L1651:
; Line 2390
	cmp	DWORD PTR _target$[ebp], 0
	jne	$L1657
; Line 2393
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_int_size_in_bytes
	add	esp, 4
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	sar	eax, 24					; 00000018H
	push	eax
	call	_assign_stack_local
	add	esp, 8
	mov	DWORD PTR _target$[ebp], eax
; Line 2394
$L1657:
	push	0
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	push	eax
	call	_store_expr
	add	esp, 12					; 0000000cH
; Line 2395
	mov	eax, DWORD PTR _target$[ebp]
	jmp	$L1596
; Line 2396
$L1656:
; Line 2398
$L1658:
; Line 2400
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _exp1$1659[ebp], eax
; Line 2413
	mov	eax, DWORD PTR _exp1$1659[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 114				; 00000072H
	jne	$L1661
	mov	eax, DWORD PTR _exp1$1659[ebp]
	cmp	DWORD PTR [eax+28], 0
	jne	$L1661
	mov	eax, DWORD PTR _exp1$1659[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _exp2$1660[ebp], eax
	mov	eax, DWORD PTR _exp2$1660[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L1661
	mov	eax, DWORD PTR _exp1$1659[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	and	eax, -16777216				; ff000000H
	mov	ecx, 67108864				; 04000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1661
	mov	eax, DWORD PTR _exp2$1660[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	and	eax, -16777216				; ff000000H
	mov	ecx, 67108864				; 04000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1661
; Line 2415
	push	1
	push	0
	push	0
	mov	eax, DWORD PTR _exp1$1659[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	mov	DWORD PTR _temp$[ebp], eax
; Line 2416
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_memory_address
	add	esp, 8
	mov	DWORD PTR _op0$[ebp], eax
; Line 2417
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	call	_copy_all_regs
	add	esp, 4
	mov	DWORD PTR _op0$[ebp], eax
; Line 2418
	mov	eax, DWORD PTR _op0$[ebp]
	mov	ecx, DWORD PTR _exp1$1659[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 2420
	jmp	$L1662
$L1661:
; Line 2422
	push	1
	push	0
	push	0
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	mov	DWORD PTR _op0$[ebp], eax
; Line 2423
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_memory_address
	add	esp, 8
	mov	DWORD PTR _op0$[ebp], eax
; Line 2424
$L1662:
; Line 2426
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	push	37					; 00000025H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _temp$[ebp], eax
; Line 2431
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 64					; 00000040H
	je	$L1664
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 114				; 00000072H
	jne	$L1663
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	eax, DWORD PTR [eax+24]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 64					; 00000040H
	jne	$L1663
$L1664:
; Line 2432
	mov	eax, DWORD PTR _temp$[ebp]
	mov	eax, DWORD PTR [eax]
	or	eax, 268435456				; 10000000H
	mov	ecx, DWORD PTR _temp$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 2433
$L1663:
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 11					; 0000000bH
	test	al, 1
	jne	$L2524
	cmp	DWORD PTR _flag_volatile, 0
	je	$L2522
$L2524:
	mov	eax, DWORD PTR _temp$[ebp]
	mov	eax, DWORD PTR [eax]
	or	eax, 134217728				; 08000000H
	mov	ecx, DWORD PTR _temp$[ebp]
	mov	DWORD PTR [ecx], eax
	jmp	$L2523
$L2522:
	mov	eax, DWORD PTR _temp$[ebp]
	and	DWORD PTR [eax], -134217729		; f7ffffffH
$L2523:
; Line 2434
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 5
	and	eax, 1
	shl	eax, 26					; 0000001aH
	mov	ecx, DWORD PTR _temp$[ebp]
	mov	ecx, DWORD PTR [ecx]
	and	ecx, -67108865				; fbffffffH
	or	eax, ecx
	mov	ecx, DWORD PTR _temp$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 2435
	mov	eax, DWORD PTR _temp$[ebp]
	jmp	$L1596
; Line 2437
$L1665:
; Line 2439
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L1667
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+28]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	je	$L1666
$L1667:
; Line 2451
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 11					; 0000000bH
	and	eax, 1
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 5
	and	eax, 1
	push	eax
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_build_type_variant
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _variant_type$1668[ebp], eax
; Line 2453
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	mov	eax, DWORD PTR _variant_type$1668[ebp]
	push	eax
	call	_build_pointer_type
	add	esp, 4
	push	eax
	push	116					; 00000074H
	call	_build
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _array_adr$1669[ebp], eax
; Line 2454
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR _index$1670[ebp], eax
; Line 2459
	mov	eax, DWORD PTR _index$1670[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	cmp	eax, 32					; 00000020H
	je	$L1672
; Line 2460
	mov	eax, DWORD PTR _index$1670[ebp]
	push	eax
	push	0
	push	32					; 00000020H
	call	_type_for_size
	add	esp, 8
	push	eax
	call	_convert
	add	esp, 8
	mov	DWORD PTR _index$1670[ebp], eax
; Line 2463
$L1672:
	mov	eax, DWORD PTR _array_adr$1669[ebp]
	and	DWORD PTR [eax+16], -9			; fffffff7H
; Line 2470
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_size_in_bytes
	add	esp, 4
	push	eax
	mov	eax, DWORD PTR _index$1670[ebp]
	push	eax
	mov	eax, DWORD PTR _variant_type$1668[ebp]
	mov	eax, DWORD PTR [eax+40]
	push	eax
	push	66					; 00000042H
	call	_build
	add	esp, 16					; 00000010H
	push	eax
	call	_fold
	add	esp, 4
	push	eax
	mov	eax, DWORD PTR _array_adr$1669[ebp]
	push	eax
	mov	eax, DWORD PTR _variant_type$1668[ebp]
	mov	eax, DWORD PTR [eax+40]
	push	eax
	push	64					; 00000040H
	call	_build
	add	esp, 16					; 00000010H
	push	eax
	call	_fold
	add	esp, 4
	push	eax
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	push	48					; 00000030H
	call	_build
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _elt$1671[ebp], eax
; Line 2472
	mov	eax, DWORD PTR _modifier$[ebp]
	push	eax
	mov	eax, DWORD PTR _tmode$[ebp]
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	mov	eax, DWORD PTR _elt$1671[ebp]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	jmp	$L1596
; Line 2477
$L1666:
; Line 2479
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _arg0$1674[ebp], eax
; Line 2480
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR _arg1$1675[ebp], eax
; Line 2485
	mov	eax, DWORD PTR _arg0$1674[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 38					; 00000026H
	jne	$L1676
	mov	eax, DWORD PTR _arg1$1675[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L1676
	mov	eax, DWORD PTR _arg1$1675[ebp]
	cmp	DWORD PTR [eax+24], 0
	jne	$L1676
	mov	eax, DWORD PTR _arg1$1675[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _i$1673[ebp], eax
	mov	eax, DWORD PTR _arg0$1674[ebp]
	mov	ecx, DWORD PTR _i$1673[ebp]
	cmp	DWORD PTR [eax+24], ecx
	jle	$L1676
; Line 2487
	mov	eax, DWORD PTR _arg0$1674[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _integer_type_node
	cmp	DWORD PTR [eax+8], ecx
	jne	$L1677
; Line 2489
	push	0
	mov	eax, DWORD PTR _arg0$1674[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	ecx, DWORD PTR _i$1673[ebp]
	mov	eax, DWORD PTR [eax+ecx*4]
	push	eax
	call	_build_int_2
	add	esp, 8
	mov	DWORD PTR _exp$[ebp], eax
; Line 2490
	mov	eax, DWORD PTR _integer_type_node
	mov	ecx, DWORD PTR _exp$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 2491
	mov	eax, DWORD PTR _modifier$[ebp]
	push	eax
	mov	eax, DWORD PTR _tmode$[ebp]
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	jmp	$L1596
; Line 2493
$L1677:
	mov	eax, DWORD PTR _arg0$1674[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _char_type_node
	cmp	DWORD PTR [eax+8], ecx
	jne	$L1678
; Line 2495
	push	0
	mov	eax, DWORD PTR _arg0$1674[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	ecx, DWORD PTR _i$1673[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	push	eax
	call	_build_int_2
	add	esp, 8
	mov	DWORD PTR _exp$[ebp], eax
; Line 2496
	mov	eax, DWORD PTR _integer_type_node
	mov	ecx, DWORD PTR _exp$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 2497
	mov	eax, DWORD PTR _modifier$[ebp]
	push	eax
	mov	eax, DWORD PTR _tmode$[ebp]
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	push	eax
	mov	eax, DWORD PTR _arg0$1674[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_convert
	add	esp, 8
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	jmp	$L1596
; Line 2499
$L1678:
; Line 2500
$L1676:
; Line 2510
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 5
	test	al, 1
	je	$L1679
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 3
	test	al, 1
	jne	$L1679
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 16					; 00000010H
	jne	$L1679
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 6
	test	al, 1
	je	$L1679
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 43					; 0000002bH
	jne	$L1679
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	cmp	DWORD PTR [eax+64], 0
	je	$L1679
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	eax, DWORD PTR [eax+64]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L1679
; Line 2512
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	call	_fold
	add	esp, 4
	mov	DWORD PTR _index$1680[ebp], eax
; Line 2513
	mov	eax, DWORD PTR _index$1680[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L1681
; Line 2515
	mov	eax, DWORD PTR _index$1680[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _i$1682[ebp], eax
; Line 2516
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	eax, DWORD PTR [eax+64]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR _init$1683[ebp], eax
; Line 2518
$L1685:
	cmp	DWORD PTR _init$1683[ebp], 0
	je	$L1686
	mov	eax, DWORD PTR _i$1682[ebp]
	mov	DWORD PTR -196+[ebp], eax
	dec	DWORD PTR _i$1682[ebp]
	cmp	DWORD PTR -196+[ebp], 0
	je	$L1686
; Line 2519
	mov	eax, DWORD PTR _init$1683[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _init$1683[ebp], eax
	jmp	$L1685
$L1686:
; Line 2520
	cmp	DWORD PTR _init$1683[ebp], 0
	je	$L1687
; Line 2521
	mov	eax, DWORD PTR _modifier$[ebp]
	push	eax
	mov	eax, DWORD PTR _tmode$[ebp]
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	mov	eax, DWORD PTR _init$1683[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_fold
	add	esp, 4
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	jmp	$L1596
; Line 2522
$L1687:
; Line 2523
$L1681:
; Line 2526
$L1679:
$L1688:
; Line 2529
	mov	DWORD PTR _volstruct$1690[ebp], 0
; Line 2531
	mov	eax, DWORD PTR _exp$[ebp]
	mov	DWORD PTR _tem$1692[ebp], eax
; Line 2532
	mov	DWORD PTR _bitpos$1693[ebp], 0
; Line 2535
	mov	eax, DWORD PTR _exp$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 47					; 0000002fH
	jne	$L1695
; Line 2537
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR _field$1696[ebp], eax
; Line 2538
	mov	eax, DWORD PTR _field$1696[ebp]
	mov	al, BYTE PTR [eax+36]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _field$1696[ebp]
	mov	ecx, DWORD PTR [ecx+28]
	imul	eax, DWORD PTR [ecx+20]
	mov	DWORD PTR _bitsize$1691[ebp], eax
; Line 2539
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	sar	eax, 24					; 00000018H
	mov	DWORD PTR _mode1$1689[ebp], eax
; Line 2540
	mov	eax, DWORD PTR _field$1696[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 12					; 0000000cH
	and	eax, 1
	mov	DWORD PTR _unsignedp$1694[ebp], eax
; Line 2542
	jmp	$L1697
$L1695:
; Line 2544
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	sar	eax, 24					; 00000018H
	mov	DWORD PTR _mode1$1689[ebp], eax
; Line 2545
	mov	eax, DWORD PTR _mode1$1689[ebp]
	mov	eax, DWORD PTR _mode_size[eax*4]
	shl	eax, 3
	mov	DWORD PTR _bitsize$1691[ebp], eax
; Line 2546
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 12					; 0000000cH
	and	eax, 1
	mov	DWORD PTR _unsignedp$1694[ebp], eax
; Line 2547
$L1697:
; Line 2552
$L1699:
; Line 2554
	mov	eax, DWORD PTR _tem$1692[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 47					; 0000002fH
	jne	$L1701
; Line 2556
	mov	eax, DWORD PTR _tem$1692[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax+48]
	add	DWORD PTR _bitpos$1693[ebp], eax
; Line 2557
	mov	eax, DWORD PTR _tem$1692[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 11					; 0000000bH
	test	al, 1
	je	$L1702
; Line 2558
	mov	DWORD PTR _volstruct$1690[ebp], 1
; Line 2559
$L1702:
; Line 2560
	jmp	$L1703
$L1701:
; Line 2562
	mov	eax, DWORD PTR _tem$1692[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 51					; 00000033H
	jne	$L1704
	mov	eax, DWORD PTR _tem$1692[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L1704
	mov	eax, DWORD PTR _tem$1692[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+28]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L1704
; Line 2566
	mov	eax, DWORD PTR _tem$1692[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+36]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _tem$1692[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	mov	ecx, DWORD PTR [ecx+28]
	imul	eax, DWORD PTR [ecx+20]
	mov	ecx, DWORD PTR _tem$1692[ebp]
	mov	ecx, DWORD PTR [ecx+28]
	imul	eax, DWORD PTR [ecx+20]
	add	DWORD PTR _bitpos$1693[ebp], eax
; Line 2567
	mov	eax, DWORD PTR _tem$1692[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 11					; 0000000bH
	test	al, 1
	je	$L1705
; Line 2568
	mov	DWORD PTR _volstruct$1690[ebp], 1
; Line 2569
$L1705:
; Line 2570
	jmp	$L1706
$L1704:
; Line 2571
	jmp	$L1700
$L1706:
$L1703:
; Line 2572
	mov	eax, DWORD PTR _tem$1692[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _tem$1692[ebp], eax
; Line 2573
	jmp	$L1699
$L1700:
; Line 2577
	cmp	DWORD PTR _modifier$[ebp], 2
	jne	$L2525
	mov	eax, DWORD PTR _modifier$[ebp]
	mov	DWORD PTR -200+[ebp], eax
	jmp	$L2526
$L2525:
	mov	DWORD PTR -200+[ebp], 0
$L2526:
	mov	eax, DWORD PTR -200+[ebp]
	push	eax
	push	0
	push	0
	mov	eax, DWORD PTR _tem$1692[ebp]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	mov	DWORD PTR _op0$[ebp], eax
; Line 2580
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1707
	cmp	DWORD PTR _volstruct$1690[ebp], 0
	je	$L1707
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax]
	shr	eax, 27					; 0000001bH
	test	al, 1
	jne	$L1707
; Line 2582
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	call	_copy_rtx
	add	esp, 4
	mov	DWORD PTR _op0$[ebp], eax
; Line 2583
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax]
	or	eax, 134217728				; 08000000H
	mov	ecx, DWORD PTR _op0$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 2586
$L1707:
; Line 2587
	cmp	DWORD PTR _mode1$1689[ebp], 25		; 00000019H
	je	$L1709
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1709
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1708
$L1709:
; Line 2591
	mov	eax, DWORD PTR _tem$1692[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_int_size_in_bytes
	add	esp, 4
	push	eax
	mov	eax, DWORD PTR _tem$1692[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+37]
	and	eax, 255				; 000000ffH
	sar	eax, 3
	push	eax
	mov	eax, DWORD PTR _tmode$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	mov	eax, DWORD PTR _unsignedp$1694[ebp]
	push	eax
	mov	eax, DWORD PTR _bitpos$1693[ebp]
	push	eax
	mov	eax, DWORD PTR _bitsize$1691[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	call	_extract_bit_field
	add	esp, 36					; 00000024H
	jmp	$L1596
; Line 2593
$L1708:
	cmp	DWORD PTR _modifier$[ebp], 2
	jne	$L1710
; Line 2595
	mov	eax, DWORD PTR _bitpos$1693[ebp]
	cdq
	and	edx, 7
	add	eax, edx
	sar	eax, 3
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_plus_constant
	add	esp, 8
	push	eax
	mov	eax, DWORD PTR _mode1$1689[ebp]
	push	eax
	push	37					; 00000025H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _op0$[ebp], eax
; Line 2596
	jmp	$L1711
$L1710:
; Line 2599
	mov	eax, DWORD PTR _bitpos$1693[ebp]
	cdq
	and	edx, 7
	add	eax, edx
	sar	eax, 3
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_plus_constant
	add	esp, 8
	push	eax
	mov	eax, DWORD PTR _mode1$1689[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	call	_change_address
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _op0$[ebp], eax
$L1711:
; Line 2600
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax]
	or	eax, 268435456				; 10000000H
	mov	ecx, DWORD PTR _op0$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 2601
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax]
	shr	eax, 27					; 0000001bH
	or	eax, DWORD PTR _volstruct$1690[ebp]
	and	eax, 1
	shl	eax, 27					; 0000001bH
	mov	ecx, DWORD PTR _op0$[ebp]
	mov	ecx, DWORD PTR [ecx]
	and	ecx, -134217729				; f7ffffffH
	or	eax, ecx
	mov	ecx, DWORD PTR _op0$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 2609
	cmp	DWORD PTR _mode$[ebp], 26		; 0000001aH
	je	$L1712
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 61					; 0000003dH
	jne	$L1712
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	and	eax, -16777216				; ff000000H
	mov	ecx, 436207616				; 1a000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1712
; Line 2610
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	call	_copy_to_reg
	add	esp, 4
	mov	DWORD PTR _op0$[ebp], eax
; Line 2611
$L1712:
	mov	eax, DWORD PTR _mode$[ebp]
	cmp	DWORD PTR _mode1$1689[ebp], eax
	je	$L1714
	cmp	DWORD PTR _mode1$1689[ebp], 26		; 0000001aH
	je	$L1714
	mov	eax, DWORD PTR _tmode$[ebp]
	cmp	DWORD PTR _mode1$1689[ebp], eax
	jne	$L1713
$L1714:
; Line 2612
	mov	eax, DWORD PTR _op0$[ebp]
	jmp	$L1596
; Line 2613
$L1713:
	cmp	DWORD PTR _target$[ebp], 0
	jne	$L1715
; Line 2614
	cmp	DWORD PTR _tmode$[ebp], 0
	je	$L2527
	mov	eax, DWORD PTR _tmode$[ebp]
	mov	DWORD PTR -204+[ebp], eax
	jmp	$L2528
$L2527:
	mov	eax, DWORD PTR _mode$[ebp]
	mov	DWORD PTR -204+[ebp], eax
$L2528:
	mov	eax, DWORD PTR -204+[ebp]
	push	eax
	call	_gen_reg_rtx
	add	esp, 4
	mov	DWORD PTR _target$[ebp], eax
; Line 2615
$L1715:
	mov	eax, DWORD PTR _unsignedp$1694[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	call	_convert_move
	add	esp, 12					; 0000000cH
; Line 2616
	mov	eax, DWORD PTR _target$[ebp]
	jmp	$L1596
; Line 2622
$L1716:
; Line 2623
	call	_abort
; Line 2625
$L1717:
; Line 2627
	mov	eax, DWORD PTR _modifier$[ebp]
	push	eax
	mov	eax, DWORD PTR _tmode$[ebp]
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	mov	ecx, DWORD PTR _exp$[ebp]
	mov	ecx, DWORD PTR [ecx+28]
	mov	DWORD PTR [ecx+28], eax
; Line 2628
	mov	eax, DWORD PTR _cleanups_of_this_call$S1060
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+32]
	push	eax
	push	0
	call	_tree_cons
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _cleanups_of_this_call$S1060, eax
; Line 2629
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax+28]
	jmp	$L1596
; Line 2631
$L1718:
; Line 2636
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 116				; 00000074H
	jne	$L1719
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	eax, DWORD PTR [eax+24]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 39					; 00000027H
	jne	$L1719
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	eax, DWORD PTR [eax+24]
	cmp	DWORD PTR [eax+48], 0
	je	$L1719
; Line 2637
	mov	eax, DWORD PTR _ignore$[ebp]
	push	eax
	mov	eax, DWORD PTR _tmode$[ebp]
	push	eax
	mov	eax, DWORD PTR _subtarget$[ebp]
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	push	eax
	call	_expand_builtin
	add	esp, 20					; 00000014H
	jmp	$L1596
; Line 2640
$L1719:
	mov	eax, DWORD PTR _exp$[ebp]
	cmp	DWORD PTR [eax+32], 0
	je	$L1720
; Line 2641
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+32]
	jmp	$L1596
; Line 2642
$L1720:
	mov	eax, DWORD PTR _ignore$[ebp]
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	push	eax
	call	_expand_call
	add	esp, 12					; 0000000cH
	jmp	$L1596
; Line 2644
$L1721:
; Line 2647
	mov	eax, DWORD PTR _type$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 4
	je	$L1723
	cmp	DWORD PTR _ignore$[ebp], 0
	je	$L1722
$L1723:
; Line 2649
	mov	eax, DWORD PTR _modifier$[ebp]
	push	eax
	push	0
	mov	eax, DWORD PTR _const0_rtx
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
; Line 2650
	mov	eax, DWORD PTR _const0_rtx
	jmp	$L1596
; Line 2652
$L1722:
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	sar	eax, 24					; 00000018H
	cmp	eax, DWORD PTR _mode$[ebp]
	jne	$L1724
; Line 2653
	mov	eax, DWORD PTR _modifier$[ebp]
	push	eax
	push	0
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	jmp	$L1596
; Line 2654
$L1724:
	push	0
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	push	0
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	mov	DWORD PTR _op0$[ebp], eax
; Line 2655
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	cmp	eax, DWORD PTR _mode$[ebp]
	je	$L1726
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sub	ecx, ecx
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1725
$L1726:
; Line 2656
	mov	eax, DWORD PTR _op0$[ebp]
	jmp	$L1596
; Line 2657
$L1725:
	cmp	DWORD PTR _flag_force_mem, 0
	je	$L1727
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1727
; Line 2658
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	call	_copy_to_reg
	add	esp, 4
	mov	DWORD PTR _op0$[ebp], eax
; Line 2659
$L1727:
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sub	ecx, ecx
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1728
; Line 2662
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	sar	eax, 24					; 00000018H
	push	eax
	call	_copy_to_mode_reg
	add	esp, 8
	mov	DWORD PTR _op0$[ebp], eax
; Line 2663
$L1728:
	cmp	DWORD PTR _target$[ebp], 0
	jne	$L1729
; Line 2664
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_gen_reg_rtx
	add	esp, 4
	mov	DWORD PTR _target$[ebp], eax
; Line 2665
$L1729:
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 12					; 0000000cH
	and	eax, 1
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	call	_convert_move
	add	esp, 12					; 0000000cH
; Line 2666
	mov	eax, DWORD PTR _target$[ebp]
	jmp	$L1596
; Line 2668
$L1730:
; Line 2669
	mov	eax, DWORD PTR _exp$[ebp]
	push	eax
	call	_preexpand_calls
	add	esp, 4
; Line 2671
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L1731
	cmp	DWORD PTR _modifier$[ebp], 1
	jne	$L1731
; Line 2673
	push	1
	push	0
	mov	eax, DWORD PTR _subtarget$[ebp]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	mov	DWORD PTR _op1$[ebp], eax
; Line 2674
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	call	_plus_constant
	add	esp, 8
	mov	DWORD PTR _op1$[ebp], eax
; Line 2675
	mov	eax, DWORD PTR _op1$[ebp]
	jmp	$L1596
; Line 2677
$L1731:
	mov	DWORD PTR _negate_1$[ebp], 1
; Line 2678
$plus_minus$1732:
; Line 2680
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L1733
	cmp	DWORD PTR _modifier$[ebp], 1
	jne	$L1733
; Line 2682
	push	1
	push	0
	mov	eax, DWORD PTR _subtarget$[ebp]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	mov	DWORD PTR _op0$[ebp], eax
; Line 2684
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax+20]
	imul	eax, DWORD PTR _negate_1$[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	call	_plus_constant
	add	esp, 8
	mov	DWORD PTR _op0$[ebp], eax
; Line 2685
	mov	eax, DWORD PTR _op0$[ebp]
	jmp	$L1596
; Line 2687
$L1733:
	mov	eax, DWORD PTR _add_optab
	mov	DWORD PTR _this_optab$[ebp], eax
; Line 2688
	cmp	DWORD PTR _modifier$[ebp], 1
	je	$L1734
	jmp	$binop$1735
; Line 2689
$L1734:
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	mov	eax, DWORD PTR _subtarget$[ebp]
	push	eax
	call	_validate_subtarget
	add	esp, 8
	mov	DWORD PTR _subtarget$[ebp], eax
; Line 2690
	push	1
	push	0
	mov	eax, DWORD PTR _subtarget$[ebp]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	mov	DWORD PTR _op0$[ebp], eax
; Line 2691
	push	1
	push	0
	push	0
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	mov	DWORD PTR _op1$[ebp], eax
; Line 2704
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1736
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1737
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1737
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1737
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1736
$L1737:
; Line 2706
	mov	eax, DWORD PTR _op0$[ebp]
	mov	DWORD PTR _temp$[ebp], eax
; Line 2707
	mov	eax, DWORD PTR _op1$[ebp]
	mov	DWORD PTR _op0$[ebp], eax
; Line 2708
	mov	eax, DWORD PTR _temp$[ebp]
	mov	DWORD PTR _op1$[ebp], eax
; Line 2712
$L1736:
; Line 2713
	mov	eax, DWORD PTR _op1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1738
	mov	eax, DWORD PTR _op1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1739
	mov	eax, DWORD PTR _op1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1739
	mov	eax, DWORD PTR _op1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1739
	mov	eax, DWORD PTR _op1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1738
$L1739:
; Line 2716
	mov	DWORD PTR _constant_term$1741[ebp], 0
; Line 2718
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _op1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	push	44					; 0000002cH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	DWORD PTR _op0$[ebp], eax
; Line 2720
	lea	eax, DWORD PTR _constant_term$1741[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	call	_eliminate_constant_term
	add	esp, 8
	mov	DWORD PTR _tem$1740[ebp], eax
; Line 2721
	mov	eax, DWORD PTR _op1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1742
; Line 2723
	cmp	DWORD PTR _constant_term$1741[ebp], 0
	je	$L1743
; Line 2724
	mov	eax, DWORD PTR _op1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	add	eax, DWORD PTR _constant_term$1741[ebp]
	push	eax
	mov	eax, DWORD PTR _tem$1740[ebp]
	push	eax
	call	_plus_constant
	add	esp, 8
	jmp	$L1596
; Line 2725
	jmp	$L1744
$L1743:
; Line 2726
	mov	eax, DWORD PTR _op1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	call	_plus_constant
	add	esp, 8
	jmp	$L1596
$L1744:
; Line 2728
	jmp	$L1745
$L1742:
; Line 2729
	mov	eax, DWORD PTR _op1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	push	44					; 0000002cH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L1596
$L1745:
; Line 2732
$L1738:
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	push	44					; 0000002cH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L1596
; Line 2734
$L1746:
; Line 2735
	mov	eax, DWORD PTR _exp$[ebp]
	push	eax
	call	_preexpand_calls
	add	esp, 4
; Line 2737
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L1747
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	shl	eax, 3
	cmp	eax, 32					; 00000020H
	jg	$L1747
; Line 2740
	cmp	DWORD PTR _modifier$[ebp], 1
	jne	$L1749
; Line 2742
	mov	DWORD PTR _negate_1$[ebp], -1
; Line 2743
	jmp	$plus_minus$1732
; Line 2745
$L1749:
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	mov	eax, DWORD PTR _subtarget$[ebp]
	push	eax
	call	_validate_subtarget
	add	esp, 8
	mov	DWORD PTR _subtarget$[ebp], eax
; Line 2746
	push	0
	push	0
	mov	eax, DWORD PTR _subtarget$[ebp]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	mov	DWORD PTR _op0$[ebp], eax
; Line 2747
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax+20]
	neg	eax
	mov	DWORD PTR _negated$1748[ebp], eax
; Line 2748
	mov	eax, DWORD PTR _mode$[ebp]
	mov	eax, DWORD PTR _mode_size[eax*4]
	shl	eax, 3
	cmp	eax, 32					; 00000020H
	jge	$L1750
; Line 2749
	mov	eax, 1
	mov	edx, DWORD PTR _mode$[ebp]
	mov	edx, DWORD PTR _mode_size[edx*4]
	shl	edx, 3
	mov	cl, dl
	shl	eax, cl
	dec	eax
	and	DWORD PTR _negated$1748[ebp], eax
; Line 2750
$L1750:
	mov	eax, DWORD PTR _negated$1748[ebp]
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _op1$[ebp], eax
; Line 2751
	mov	eax, DWORD PTR _add_optab
	mov	DWORD PTR _this_optab$[ebp], eax
; Line 2752
	jmp	$binop2$1751
; Line 2754
$L1747:
	mov	eax, DWORD PTR _sub_optab
	mov	DWORD PTR _this_optab$[ebp], eax
; Line 2755
	jmp	$binop$1735
; Line 2757
$L1752:
; Line 2758
	mov	eax, DWORD PTR _exp$[ebp]
	push	eax
	call	_preexpand_calls
	add	esp, 4
; Line 2762
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L1753
; Line 2764
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _t1$1754[ebp], eax
; Line 2765
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	ecx, DWORD PTR _exp$[ebp]
	mov	DWORD PTR [ecx+24], eax
; Line 2766
	mov	eax, DWORD PTR _t1$1754[ebp]
	mov	ecx, DWORD PTR _exp$[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 2772
$L1753:
; Line 2773
	cmp	DWORD PTR _modifier$[ebp], 1
	jne	$L1755
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L1755
; Line 2775
	push	1
	push	0
	mov	eax, DWORD PTR _subtarget$[ebp]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	mov	DWORD PTR _op0$[ebp], eax
; Line 2779
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1756
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1756
; Line 2786
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _exp$[ebp]
	mov	ecx, DWORD PTR [ecx+28]
	imul	eax, DWORD PTR [ecx+20]
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	push	47					; 0000002fH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	push	44					; 0000002cH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L1596
; Line 2788
$L1756:
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1757
; Line 2789
	push	0
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	call	_force_operand
	add	esp, 8
	mov	DWORD PTR _op0$[ebp], eax
; Line 2790
$L1757:
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1758
; Line 2791
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_copy_to_mode_reg
	add	esp, 8
	mov	DWORD PTR _op0$[ebp], eax
; Line 2793
$L1758:
; Line 2795
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax+20]
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
	push	47					; 0000002fH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L1596
; Line 2797
$L1755:
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	mov	eax, DWORD PTR _subtarget$[ebp]
	push	eax
	call	_validate_subtarget
	add	esp, 8
	mov	DWORD PTR _subtarget$[ebp], eax
; Line 2820
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 113				; 00000071H
	jne	$L1761
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 5
	jne	$L1761
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	eax, DWORD PTR [eax+24]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _exp$[ebp]
	mov	ecx, DWORD PTR [ecx+24]
	mov	ecx, DWORD PTR [ecx+8]
	mov	cl, BYTE PTR [ecx+38]
	and	ecx, 255				; 000000ffH
	cmp	eax, ecx
	jge	$L1761
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L1763
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	eax, DWORD PTR [eax+24]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	call	_int_fits_type_p
	add	esp, 8
	or	eax, eax
	je	$L1763
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	call	_exact_log2
	add	esp, 4
	or	eax, eax
	jl	$L1762
$L1763:
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 113				; 00000071H
	jne	$L1761
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax+24]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _exp$[ebp]
	mov	ecx, DWORD PTR [ecx+24]
	mov	ecx, DWORD PTR [ecx+24]
	mov	ecx, DWORD PTR [ecx+8]
	mov	cl, BYTE PTR [ecx+38]
	and	ecx, 255				; 000000ffH
	cmp	eax, ecx
	jne	$L1761
	sub	eax, eax
	mov	ecx, DWORD PTR _exp$[ebp]
	mov	ecx, DWORD PTR [ecx+28]
	mov	ecx, DWORD PTR [ecx+24]
	mov	ecx, DWORD PTR [ecx+8]
	mov	ecx, DWORD PTR [ecx+16]
	shr	ecx, 12					; 0000000cH
	mov	edx, DWORD PTR _exp$[ebp]
	mov	edx, DWORD PTR [edx+24]
	mov	edx, DWORD PTR [edx+24]
	mov	edx, DWORD PTR [edx+8]
	mov	edx, DWORD PTR [edx+16]
	shr	edx, 12					; 0000000cH
	and	edx, 1
	xor	ecx, edx
	and	ecx, 1
	cmp	eax, ecx
	jne	$L1761
$L1762:
; Line 2823
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	eax, DWORD PTR [eax+24]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	sar	eax, 24					; 00000018H
	mov	DWORD PTR _innermode$1764[ebp], eax
; Line 2825
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	eax, DWORD PTR [eax+24]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 12					; 0000000cH
	test	al, 1
	je	$L2529
	mov	eax, DWORD PTR _umul_widen_optab
	mov	DWORD PTR _this_optab$[ebp], eax
	jmp	$L2530
$L2529:
	mov	eax, DWORD PTR _smul_widen_optab
	mov	DWORD PTR _this_optab$[ebp], eax
$L2530:
; Line 2827
	mov	eax, DWORD PTR _innermode$1764[ebp]
	mov	ecx, DWORD PTR _mode$[ebp]
	cmp	DWORD PTR _mode_wider_mode[eax*4], ecx
	jne	$L1765
	mov	eax, DWORD PTR _mode$[ebp]
	mov	ecx, DWORD PTR _this_optab$[ebp]
	cmp	DWORD PTR [ecx+eax*8+4], 142		; 0000008eH
	je	$L1765
; Line 2830
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	mov	DWORD PTR _op0$[ebp], eax
; Line 2831
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L1766
; Line 2832
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	mov	DWORD PTR _op1$[ebp], eax
; Line 2833
	jmp	$L1767
$L1766:
; Line 2835
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	mov	DWORD PTR _op1$[ebp], eax
$L1767:
; Line 2836
	jmp	$binop2$1751
; Line 2838
$L1765:
; Line 2839
$L1761:
	push	0
	push	0
	mov	eax, DWORD PTR _subtarget$[ebp]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	mov	DWORD PTR _op0$[ebp], eax
; Line 2840
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	mov	DWORD PTR _op1$[ebp], eax
; Line 2841
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 12					; 0000000cH
	and	eax, 1
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_expand_mult
	add	esp, 20					; 00000014H
	jmp	$L1596
; Line 2843
$L1768:
; Line 2848
	mov	eax, DWORD PTR _exp$[ebp]
	push	eax
	call	_preexpand_calls
	add	esp, 4
; Line 2849
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	mov	eax, DWORD PTR _subtarget$[ebp]
	push	eax
	call	_validate_subtarget
	add	esp, 8
	mov	DWORD PTR _subtarget$[ebp], eax
; Line 2853
	push	0
	push	0
	mov	eax, DWORD PTR _subtarget$[ebp]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	mov	DWORD PTR _op0$[ebp], eax
; Line 2854
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	mov	DWORD PTR _op1$[ebp], eax
; Line 2856
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 12					; 0000000cH
	and	eax, 1
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	mov	eax, DWORD PTR _code$[ebp]
	push	eax
	push	0
	call	_expand_divmod
	add	esp, 28					; 0000001cH
	jmp	$L1596
; Line 2858
$L1769:
; Line 2859
	mov	eax, DWORD PTR _exp$[ebp]
	push	eax
	call	_preexpand_calls
	add	esp, 4
; Line 2860
	mov	eax, DWORD PTR _flodiv_optab
	mov	DWORD PTR _this_optab$[ebp], eax
; Line 2861
	jmp	$binop$1735
; Line 2863
$L1770:
; Line 2867
	mov	eax, DWORD PTR _exp$[ebp]
	push	eax
	call	_preexpand_calls
	add	esp, 4
; Line 2868
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	mov	eax, DWORD PTR _subtarget$[ebp]
	push	eax
	call	_validate_subtarget
	add	esp, 8
	mov	DWORD PTR _subtarget$[ebp], eax
; Line 2869
	push	0
	push	0
	mov	eax, DWORD PTR _subtarget$[ebp]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	mov	DWORD PTR _op0$[ebp], eax
; Line 2870
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	mov	DWORD PTR _op1$[ebp], eax
; Line 2872
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 12					; 0000000cH
	and	eax, 1
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	mov	eax, DWORD PTR _code$[ebp]
	push	eax
	push	1
	call	_expand_divmod
	add	esp, 28					; 0000001cH
	jmp	$L1596
; Line 2897
$L1771:
; Line 2900
	call	_abort
; Line 2902
$L1772:
; Line 2903
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	mov	DWORD PTR _op0$[ebp], eax
; Line 2904
	cmp	DWORD PTR _target$[ebp], 0
	jne	$L1773
; Line 2905
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_gen_reg_rtx
	add	esp, 4
	mov	DWORD PTR _target$[ebp], eax
; Line 2906
$L1773:
; Line 2907
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 12					; 0000000cH
	and	eax, 1
	mov	DWORD PTR _unsignedp$1774[ebp], eax
; Line 2908
	cmp	DWORD PTR _mode$[ebp], 2
	je	$L1776
	cmp	DWORD PTR _mode$[ebp], 1
	jne	$L1775
$L1776:
; Line 2910
	push	4
	call	_gen_reg_rtx
	add	esp, 4
	mov	DWORD PTR _temp$1777[ebp], eax
; Line 2911
	push	0
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _temp$1777[ebp]
	push	eax
	call	_expand_fix
	add	esp, 12					; 0000000cH
; Line 2912
	push	0
	mov	eax, DWORD PTR _temp$1777[ebp]
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	call	_convert_move
	add	esp, 12					; 0000000cH
; Line 2914
	jmp	$L1778
$L1775:
; Line 2915
	mov	eax, DWORD PTR _unsignedp$1774[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	call	_expand_fix
	add	esp, 12					; 0000000cH
$L1778:
; Line 2917
	mov	eax, DWORD PTR _target$[ebp]
	jmp	$L1596
; Line 2919
$L1779:
; Line 2920
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	mov	DWORD PTR _op0$[ebp], eax
; Line 2921
	cmp	DWORD PTR _target$[ebp], 0
	jne	$L1780
; Line 2922
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_gen_reg_rtx
	add	esp, 4
	mov	DWORD PTR _target$[ebp], eax
; Line 2923
$L1780:
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sub	ecx, ecx
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1781
; Line 2926
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	sar	eax, 24					; 00000018H
	push	eax
	call	_copy_to_mode_reg
	add	esp, 8
	mov	DWORD PTR _op0$[ebp], eax
; Line 2927
$L1781:
; Line 2928
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 12					; 0000000cH
	and	eax, 1
	mov	DWORD PTR _unsignedp$1782[ebp], eax
; Line 2930
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 33554432				; 02000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L1784
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 16777216				; 01000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1783
$L1784:
; Line 2932
	push	4
	call	_gen_reg_rtx
	add	esp, 4
	mov	DWORD PTR _temp$1785[ebp], eax
; Line 2933
	mov	eax, DWORD PTR _unsignedp$1782[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _temp$1785[ebp]
	push	eax
	call	_convert_move
	add	esp, 12					; 0000000cH
; Line 2934
	push	0
	mov	eax, DWORD PTR _temp$1785[ebp]
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	call	_expand_float
	add	esp, 12					; 0000000cH
; Line 2936
	jmp	$L1786
$L1783:
; Line 2937
	mov	eax, DWORD PTR _unsignedp$1782[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	call	_expand_float
	add	esp, 12					; 0000000cH
$L1786:
; Line 2939
	mov	eax, DWORD PTR _target$[ebp]
	jmp	$L1596
; Line 2941
$L1787:
; Line 2942
	push	0
	push	0
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	mov	DWORD PTR _op0$[ebp], eax
; Line 2943
	push	0
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _neg_optab
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_expand_unop
	add	esp, 20					; 00000014H
	mov	DWORD PTR _temp$[ebp], eax
; Line 2944
	cmp	DWORD PTR _temp$[ebp], 0
	jne	$L1788
; Line 2945
	call	_abort
; Line 2946
$L1788:
	mov	eax, DWORD PTR _temp$[ebp]
	jmp	$L1596
; Line 2948
$L1789:
; Line 2951
	push	0
	push	0
	mov	eax, DWORD PTR _subtarget$[ebp]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	mov	DWORD PTR _op0$[ebp], eax
; Line 2952
	push	0
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _abs_optab
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_expand_unop
	add	esp, 20					; 00000014H
	mov	DWORD PTR _temp$[ebp], eax
; Line 2953
	cmp	DWORD PTR _temp$[ebp], 0
	je	$L1790
; Line 2954
	mov	eax, DWORD PTR _temp$[ebp]
	jmp	$L1596
; Line 2955
$L1790:
	call	_gen_label_rtx
	mov	DWORD PTR _temp$[ebp], eax
; Line 2956
	cmp	DWORD PTR _target$[ebp], 0
	je	$L1792
	mov	eax, DWORD PTR _target$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1791
$L1792:
; Line 2957
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_gen_reg_rtx
	add	esp, 4
	mov	DWORD PTR _target$[ebp], eax
; Line 2958
$L1791:
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	call	_emit_move_insn
	add	esp, 8
; Line 2962
	push	0
	push	0
	push	0
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _integer_zero_node
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_convert
	add	esp, 8
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	call	_emit_cmp_insn
	add	esp, 20					; 00000014H
; Line 2963
	inc	DWORD PTR _inhibit_defer_pop
; Line 2964
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_gen_bge
	add	esp, 4
	push	eax
	call	_emit_jump_insn
	add	esp, 4
; Line 2965
	push	0
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	mov	eax, DWORD PTR _neg_optab
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_expand_unop
	add	esp, 20					; 00000014H
	mov	DWORD PTR _op0$[ebp], eax
; Line 2966
	mov	eax, DWORD PTR _target$[ebp]
	cmp	DWORD PTR _op0$[ebp], eax
	je	$L1793
; Line 2967
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	call	_emit_move_insn
	add	esp, 8
; Line 2968
$L1793:
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_emit_label
	add	esp, 4
; Line 2969
	dec	DWORD PTR _inhibit_defer_pop
; Line 2970
	mov	eax, DWORD PTR _target$[ebp]
	jmp	$L1596
; Line 2972
$L1794:
; Line 2974
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	sar	eax, 24					; 00000018H
	mov	DWORD PTR _mode$[ebp], eax
; Line 2975
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	mov	DWORD PTR _op1$[ebp], eax
; Line 2976
	cmp	DWORD PTR _target$[ebp], 0
	je	$L1796
	mov	eax, DWORD PTR _target$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1796
	mov	eax, DWORD PTR _target$[ebp]
	cmp	DWORD PTR _op1$[ebp], eax
	jne	$L1795
$L1796:
; Line 2977
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_gen_reg_rtx
	add	esp, 4
	mov	DWORD PTR _target$[ebp], eax
; Line 2978
$L1795:
	push	0
	push	0
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	mov	DWORD PTR _op0$[ebp], eax
; Line 2979
	mov	eax, DWORD PTR _target$[ebp]
	cmp	DWORD PTR _op0$[ebp], eax
	je	$L1797
; Line 2980
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	call	_emit_move_insn
	add	esp, 8
; Line 2981
$L1797:
	call	_gen_label_rtx
	mov	DWORD PTR _op0$[ebp], eax
; Line 2982
	cmp	DWORD PTR _code$[ebp], 85		; 00000055H
	jne	$L1798
; Line 2985
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 12					; 0000000cH
	test	al, 1
	je	$L2531
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	push	1
	push	75					; 0000004bH
	push	73					; 00000049H
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	call	_compare1
	add	esp, 24					; 00000018H
	mov	DWORD PTR _temp$[ebp], eax
	jmp	$L2532
$L2531:
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	push	0
	push	71					; 00000047H
	push	69					; 00000045H
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	call	_compare1
	add	esp, 24					; 00000018H
	mov	DWORD PTR _temp$[ebp], eax
$L2532:
; Line 2986
	jmp	$L1799
$L1798:
; Line 2989
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 12					; 0000000cH
	test	al, 1
	je	$L2533
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	push	1
	push	73					; 00000049H
	push	75					; 0000004bH
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	call	_compare1
	add	esp, 24					; 00000018H
	mov	DWORD PTR _temp$[ebp], eax
	jmp	$L2534
$L2533:
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	push	0
	push	69					; 00000045H
	push	71					; 00000047H
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	call	_compare1
	add	esp, 24					; 00000018H
	mov	DWORD PTR _temp$[ebp], eax
$L2534:
$L1799:
; Line 2990
	mov	eax, DWORD PTR _temp$[ebp]
	cmp	DWORD PTR _const0_rtx, eax
	jne	$L1800
; Line 2991
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	call	_emit_move_insn
	add	esp, 8
; Line 2992
	jmp	$L1801
$L1800:
	mov	eax, DWORD PTR _temp$[ebp]
	cmp	DWORD PTR _const1_rtx, eax
	je	$L1802
; Line 2994
	mov	eax, DWORD PTR _temp$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	cmp	DWORD PTR _bcc_gen_fctn[eax*4], 0
	je	$L1803
; Line 2995
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	call	DWORD PTR _bcc_gen_fctn[eax*4]
	add	esp, 4
	push	eax
	call	_emit_jump_insn
	add	esp, 4
; Line 2996
	jmp	$L1804
$L1803:
; Line 2997
	call	_abort
$L1804:
; Line 2998
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	call	_emit_move_insn
	add	esp, 8
; Line 3000
$L1802:
$L1801:
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	call	_emit_label
	add	esp, 4
; Line 3001
	mov	eax, DWORD PTR _target$[ebp]
	jmp	$L1596
; Line 3005
$L1805:
; Line 3006
	push	0
	push	0
	mov	eax, DWORD PTR _subtarget$[ebp]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	mov	DWORD PTR _op0$[ebp], eax
; Line 3007
	push	1
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _one_cmpl_optab
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_expand_unop
	add	esp, 20					; 00000014H
	mov	DWORD PTR _temp$[ebp], eax
; Line 3008
	cmp	DWORD PTR _temp$[ebp], 0
	jne	$L1806
; Line 3009
	call	_abort
; Line 3010
$L1806:
	mov	eax, DWORD PTR _temp$[ebp]
	jmp	$L1596
; Line 3012
$L1807:
; Line 3013
	push	0
	push	0
	mov	eax, DWORD PTR _subtarget$[ebp]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	mov	DWORD PTR _op0$[ebp], eax
; Line 3014
	push	1
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _ffs_optab
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_expand_unop
	add	esp, 20					; 00000014H
	mov	DWORD PTR _temp$[ebp], eax
; Line 3015
	cmp	DWORD PTR _temp$[ebp], 0
	jne	$L1808
; Line 3016
	call	_abort
; Line 3017
$L1808:
	mov	eax, DWORD PTR _temp$[ebp]
	jmp	$L1596
; Line 3034
$L1809:
; Line 3036
	mov	eax, DWORD PTR _exp$[ebp]
	push	eax
	call	_preexpand_calls
	add	esp, 4
; Line 3037
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	mov	eax, DWORD PTR _subtarget$[ebp]
	push	eax
	call	_validate_subtarget
	add	esp, 8
	mov	DWORD PTR _subtarget$[ebp], eax
; Line 3038
	push	0
	push	0
	mov	eax, DWORD PTR _subtarget$[ebp]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	mov	DWORD PTR _op0$[ebp], eax
; Line 3039
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	mov	DWORD PTR _op1$[ebp], eax
; Line 3040
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_expand_bit_and
	add	esp, 16					; 00000010H
	jmp	$L1596
; Line 3043
$L1810:
; Line 3045
	mov	eax, DWORD PTR _exp$[ebp]
	push	eax
	call	_preexpand_calls
	add	esp, 4
; Line 3046
	mov	eax, DWORD PTR _ior_optab
	mov	DWORD PTR _this_optab$[ebp], eax
; Line 3047
	jmp	$binop$1735
; Line 3049
$L1811:
; Line 3050
	mov	eax, DWORD PTR _exp$[ebp]
	push	eax
	call	_preexpand_calls
	add	esp, 4
; Line 3051
	mov	eax, DWORD PTR _xor_optab
	mov	DWORD PTR _this_optab$[ebp], eax
; Line 3052
	jmp	$binop$1735
; Line 3054
$L1812:
; Line 3058
	mov	eax, DWORD PTR _exp$[ebp]
	push	eax
	call	_preexpand_calls
	add	esp, 4
; Line 3059
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	mov	eax, DWORD PTR _subtarget$[ebp]
	push	eax
	call	_validate_subtarget
	add	esp, 8
	mov	DWORD PTR _subtarget$[ebp], eax
; Line 3060
	push	0
	push	0
	mov	eax, DWORD PTR _subtarget$[ebp]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	mov	DWORD PTR _op0$[ebp], eax
; Line 3062
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 12					; 0000000cH
	and	eax, 1
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	mov	eax, DWORD PTR _code$[ebp]
	push	eax
	call	_expand_shift
	add	esp, 24					; 00000018H
	jmp	$L1596
; Line 3067
$L1813:
; Line 3073
	mov	eax, DWORD PTR _exp$[ebp]
	push	eax
	call	_preexpand_calls
	add	esp, 4
; Line 3074
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	push	eax
	call	_do_store_flag
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _temp$[ebp], eax
; Line 3075
	cmp	DWORD PTR _temp$[ebp], 0
	je	$L1814
; Line 3076
	mov	eax, DWORD PTR _temp$[ebp]
	jmp	$L1596
; Line 3078
$L1814:
; Line 3081
	cmp	DWORD PTR _code$[ebp], 107		; 0000006bH
	jne	$L1815
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	call	_integer_zerop
	add	esp, 4
	or	eax, eax
	je	$L1815
	cmp	DWORD PTR _subtarget$[ebp], 0
	je	$L1815
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	and	eax, -16777216				; ff000000H
	mov	ecx, DWORD PTR _subtarget$[ebp]
	mov	ecx, DWORD PTR [ecx]
	shl	ecx, 8
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1815
; Line 3083
	push	0
	push	0
	mov	eax, DWORD PTR _subtarget$[ebp]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	mov	DWORD PTR _temp$[ebp], eax
; Line 3084
	mov	eax, DWORD PTR _temp$[ebp]
	cmp	DWORD PTR _subtarget$[ebp], eax
	je	$L1816
; Line 3085
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_copy_to_reg
	add	esp, 4
	mov	DWORD PTR _temp$[ebp], eax
; Line 3086
$L1816:
	call	_gen_label_rtx
	mov	DWORD PTR _op1$[ebp], eax
; Line 3087
	push	0
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 12					; 0000000cH
	and	eax, 1
	push	eax
	push	0
	mov	eax, DWORD PTR _const0_rtx
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_emit_cmp_insn
	add	esp, 20					; 00000014H
; Line 3088
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	call	_gen_beq
	add	esp, 4
	push	eax
	call	_emit_jump_insn
	add	esp, 4
; Line 3089
	mov	eax, DWORD PTR _const1_rtx
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_emit_move_insn
	add	esp, 8
; Line 3090
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	call	_emit_label
	add	esp, 4
; Line 3091
	mov	eax, DWORD PTR _temp$[ebp]
	jmp	$L1596
; Line 3097
$L1815:
$L1817:
; Line 3099
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_gen_reg_rtx
	add	esp, 4
	mov	DWORD PTR _temp$[ebp], eax
; Line 3100
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_emit_clr_insn
	add	esp, 4
; Line 3101
	call	_gen_label_rtx
	mov	DWORD PTR _op1$[ebp], eax
; Line 3102
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	push	eax
	call	_jumpifnot
	add	esp, 8
; Line 3103
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_emit_0_to_1_insn
	add	esp, 4
; Line 3104
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	call	_emit_label
	add	esp, 4
; Line 3105
	mov	eax, DWORD PTR _temp$[ebp]
	jmp	$L1596
; Line 3107
$L1818:
; Line 3108
	push	0
	push	0
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	mov	DWORD PTR _op0$[ebp], eax
; Line 3113
	push	3
	push	1
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	push	1
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _xor_optab
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_expand_binop
	add	esp, 28					; 0000001cH
	mov	DWORD PTR _temp$[ebp], eax
; Line 3114
	cmp	DWORD PTR _temp$[ebp], 0
	jne	$L1819
; Line 3115
	call	_abort
; Line 3116
$L1819:
	mov	eax, DWORD PTR _temp$[ebp]
	jmp	$L1596
; Line 3118
$L1820:
; Line 3119
	push	0
	push	0
	mov	eax, DWORD PTR _const0_rtx
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
; Line 3120
	call	_emit_queue
; Line 3121
	push	0
	push	0
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	jmp	$L1596
; Line 3123
$L1821:
; Line 3128
	call	_gen_label_rtx
	mov	DWORD PTR _op0$[ebp], eax
; Line 3129
	call	_gen_label_rtx
	mov	DWORD PTR _op1$[ebp], eax
; Line 3131
	cmp	DWORD PTR _mode$[ebp], 0
	je	$L1823
	cmp	DWORD PTR _ignore$[ebp], 0
	je	$L1822
$L1823:
; Line 3132
	mov	DWORD PTR _temp$[ebp], 0
; Line 3133
	jmp	$L1824
$L1822:
	cmp	DWORD PTR _target$[ebp], 0
	je	$L1825
; Line 3134
	mov	eax, DWORD PTR _target$[ebp]
	mov	DWORD PTR _temp$[ebp], eax
; Line 3135
	jmp	$L1826
$L1825:
	cmp	DWORD PTR _mode$[ebp], 26		; 0000001aH
	jne	$L1827
; Line 3137
	mov	eax, DWORD PTR _type$[ebp]
	cmp	DWORD PTR [eax+28], 0
	je	$L1829
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 6
	test	al, 1
	jne	$L1828
$L1829:
; Line 3138
	call	_abort
; Line 3139
$L1828:
; Line 3143
	mov	eax, DWORD PTR _type$[ebp]
	mov	al, BYTE PTR [eax+36]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _type$[ebp]
	mov	ecx, DWORD PTR [ecx+28]
	imul	eax, DWORD PTR [ecx+20]
	add	eax, 7
	cdq
	and	edx, 7
	add	eax, edx
	sar	eax, 3
	push	eax
	push	26					; 0000001aH
	call	_assign_stack_local
	add	esp, 8
	mov	DWORD PTR _temp$[ebp], eax
; Line 3145
	jmp	$L1830
$L1827:
; Line 3146
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_gen_reg_rtx
	add	esp, 4
	mov	DWORD PTR _temp$[ebp], eax
$L1830:
$L1826:
$L1824:
; Line 3148
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_jumpifnot
	add	esp, 8
; Line 3149
	inc	DWORD PTR _inhibit_defer_pop
; Line 3150
	cmp	DWORD PTR _temp$[ebp], 0
	je	$L1831
; Line 3151
	push	0
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	call	_store_expr
	add	esp, 12					; 0000000cH
; Line 3152
	jmp	$L1832
$L1831:
; Line 3154
	cmp	DWORD PTR _ignore$[ebp], 0
	je	$L2535
	mov	eax, DWORD PTR _const0_rtx
	mov	DWORD PTR -208+[ebp], eax
	jmp	$L2536
$L2535:
	mov	DWORD PTR -208+[ebp], 0
$L2536:
	push	0
	push	0
	mov	eax, DWORD PTR -208+[ebp]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
$L1832:
; Line 3155
	call	_emit_queue
; Line 3156
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	call	_gen_jump
	add	esp, 4
	push	eax
	call	_emit_jump_insn
	add	esp, 4
; Line 3157
	call	_emit_barrier
; Line 3158
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	call	_emit_label
	add	esp, 4
; Line 3159
	cmp	DWORD PTR _temp$[ebp], 0
	je	$L1833
; Line 3160
	push	0
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+32]
	push	eax
	call	_store_expr
	add	esp, 12					; 0000000cH
; Line 3161
	jmp	$L1834
$L1833:
; Line 3163
	cmp	DWORD PTR _ignore$[ebp], 0
	je	$L2537
	mov	eax, DWORD PTR _const0_rtx
	mov	DWORD PTR -212+[ebp], eax
	jmp	$L2538
$L2537:
	mov	DWORD PTR -212+[ebp], 0
$L2538:
	push	0
	push	0
	mov	eax, DWORD PTR -212+[ebp]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+32]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
$L1834:
; Line 3164
	call	_emit_queue
; Line 3165
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	call	_emit_label
	add	esp, 4
; Line 3166
	dec	DWORD PTR _inhibit_defer_pop
; Line 3167
	mov	eax, DWORD PTR _temp$[ebp]
	jmp	$L1596
; Line 3169
$L1835:
; Line 3178
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _lhs$1836[ebp], eax
; Line 3179
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR _rhs$1837[ebp], eax
; Line 3184
	mov	eax, DWORD PTR _lhs$1836[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 43					; 0000002bH
	je	$L1839
	mov	eax, DWORD PTR _lhs$1836[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 45					; 0000002dH
	je	$L1839
	mov	eax, DWORD PTR _lhs$1836[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 44					; 0000002cH
	je	$L1839
; Line 3185
	mov	eax, DWORD PTR _exp$[ebp]
	push	eax
	call	_preexpand_calls
	add	esp, 4
; Line 3187
$L1839:
	mov	eax, DWORD PTR _lhs$1836[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+76]
	push	eax
	mov	eax, DWORD PTR _lhs$1836[ebp]
	push	eax
	call	_save_noncopied_parts
	add	esp, 8
	mov	DWORD PTR _noncopied_parts$1838[ebp], eax
; Line 3188
	cmp	DWORD PTR _original_target$[ebp], 1
	sbb	eax, eax
	inc	eax
	push	eax
	cmp	DWORD PTR _ignore$[ebp], 1
	sbb	eax, eax
	neg	eax
	push	eax
	mov	eax, DWORD PTR _rhs$1837[ebp]
	push	eax
	mov	eax, DWORD PTR _lhs$1836[ebp]
	push	eax
	call	_expand_assignment
	add	esp, 16					; 00000010H
	mov	DWORD PTR _temp$[ebp], eax
; Line 3189
$L1841:
	cmp	DWORD PTR _noncopied_parts$1838[ebp], 0
	je	$L1842
; Line 3192
	push	0
	mov	eax, DWORD PTR _noncopied_parts$1838[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	mov	eax, DWORD PTR _noncopied_parts$1838[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_store_expr
	add	esp, 12					; 0000000cH
; Line 3193
	mov	eax, DWORD PTR _noncopied_parts$1838[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _noncopied_parts$1838[ebp], eax
; Line 3194
	jmp	$L1841
$L1842:
; Line 3195
	mov	eax, DWORD PTR _temp$[ebp]
	jmp	$L1596
; Line 3198
$L1843:
; Line 3200
	push	0
	mov	eax, DWORD PTR _exp$[ebp]
	push	eax
	call	_expand_increment
	add	esp, 8
	jmp	$L1596
; Line 3202
$L1844:
; Line 3204
	push	1
	mov	eax, DWORD PTR _exp$[ebp]
	push	eax
	call	_expand_increment
	add	esp, 8
	jmp	$L1596
; Line 3206
$L1845:
; Line 3208
	push	2
	push	0
	push	0
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	mov	DWORD PTR _op0$[ebp], eax
; Line 3209
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1846
; Line 3210
	call	_abort
; Line 3211
$L1846:
	cmp	DWORD PTR _modifier$[ebp], 1
	jne	$L1847
; Line 3212
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	jmp	$L1596
; Line 3213
$L1847:
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_force_operand
	add	esp, 8
	mov	DWORD PTR _op0$[ebp], eax
; Line 3214
	cmp	DWORD PTR _flag_force_addr, 0
	je	$L1848
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1848
; Line 3215
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	push	4
	call	_force_reg
	add	esp, 8
	jmp	$L1596
; Line 3216
$L1848:
	mov	eax, DWORD PTR _op0$[ebp]
	jmp	$L1596
; Line 3218
$L1849:
; Line 3219
	call	_abort
; Line 3221
$L1850:
; Line 3222
	mov	eax, DWORD PTR _const0_rtx
	jmp	$L1596
; Line 3224
$L1851:
; Line 3225
	call	_abort
; Line 3226
	jmp	$L1617
$L1616:
	cmp	DWORD PTR -216+[ebp], 128		; 00000080H
	ja	$L1851
	shl	DWORD PTR -216+[ebp], 2
	mov	eax, DWORD PTR -216+[ebp]
	jmp	DWORD PTR $L2539[eax]
$L2539:
	DD	OFFSET $L1850
	DD	OFFSET $L1851
	DD	OFFSET $L1851
	DD	OFFSET $L1851
	DD	OFFSET $L1851
	DD	OFFSET $L1851
	DD	OFFSET $L1851
	DD	OFFSET $L1851
	DD	OFFSET $L1851
	DD	OFFSET $L1851
	DD	OFFSET $L1851
	DD	OFFSET $L1851
	DD	OFFSET $L1851
	DD	OFFSET $L1851
	DD	OFFSET $L1851
	DD	OFFSET $L1851
	DD	OFFSET $L1851
	DD	OFFSET $L1851
	DD	OFFSET $L1851
	DD	OFFSET $L1851
	DD	OFFSET $L1851
	DD	OFFSET $L1851
	DD	OFFSET $L1851
	DD	OFFSET $L1851
	DD	OFFSET $L1851
	DD	OFFSET $L1851
	DD	OFFSET $L1851
	DD	OFFSET $L1851
	DD	OFFSET $L1643
	DD	OFFSET $L1851
	DD	OFFSET $L1851
	DD	OFFSET $L1851
	DD	OFFSET $L1851
	DD	OFFSET $L1851
	DD	OFFSET $L1851
	DD	OFFSET $L1631
	DD	OFFSET $L1634
	DD	OFFSET $L1636
	DD	OFFSET $L1636
	DD	OFFSET $L1624
	DD	OFFSET $L1851
	DD	OFFSET $L1633
	DD	OFFSET $L1851
	DD	OFFSET $L1624
	DD	OFFSET $L1620
	DD	OFFSET $L1624
	DD	OFFSET $L1851
	DD	OFFSET $L1688
	DD	OFFSET $L1658
	DD	OFFSET $L1851
	DD	OFFSET $L1716
	DD	OFFSET $L1665
	DD	OFFSET $L1647
	DD	OFFSET $L1820
	DD	OFFSET $L1835
	DD	OFFSET $L1851
	DD	OFFSET $L1851
	DD	OFFSET $L1851
	DD	OFFSET $L1851
	DD	OFFSET $L1851
	DD	OFFSET $L1821
	DD	OFFSET $L1718
	DD	OFFSET $L1851
	DD	OFFSET $L1717
	DD	OFFSET $L1730
	DD	OFFSET $L1746
	DD	OFFSET $L1752
	DD	OFFSET $L1768
	DD	OFFSET $L1768
	DD	OFFSET $L1768
	DD	OFFSET $L1768
	DD	OFFSET $L1770
	DD	OFFSET $L1770
	DD	OFFSET $L1770
	DD	OFFSET $L1770
	DD	OFFSET $L1769
	DD	OFFSET $L1768
	DD	OFFSET $L1772
	DD	OFFSET $L1771
	DD	OFFSET $L1771
	DD	OFFSET $L1771
	DD	OFFSET $L1779
	DD	OFFSET $L1851
	DD	OFFSET $L1787
	DD	OFFSET $L1794
	DD	OFFSET $L1794
	DD	OFFSET $L1789
	DD	OFFSET $L1807
	DD	OFFSET $L1812
	DD	OFFSET $L1812
	DD	OFFSET $L1812
	DD	OFFSET $L1812
	DD	OFFSET $L1810
	DD	OFFSET $L1811
	DD	OFFSET $L1809
	DD	OFFSET $L1851
	DD	OFFSET $L1805
	DD	OFFSET $L1817
	DD	OFFSET $L1817
	DD	OFFSET $L1809
	DD	OFFSET $L1810
	DD	OFFSET $L1818
	DD	OFFSET $L1813
	DD	OFFSET $L1813
	DD	OFFSET $L1813
	DD	OFFSET $L1813
	DD	OFFSET $L1813
	DD	OFFSET $L1813
	DD	OFFSET $L1851
	DD	OFFSET $L1851
	DD	OFFSET $L1851
	DD	OFFSET $L1851
	DD	OFFSET $L1721
	DD	OFFSET $L1721
	DD	OFFSET $L1639
	DD	OFFSET $L1644
	DD	OFFSET $L1845
	DD	OFFSET $L1721
	DD	OFFSET $L1851
	DD	OFFSET $L1851
	DD	OFFSET $L1849
	DD	OFFSET $L1851
	DD	OFFSET $L1851
	DD	OFFSET $L1851
	DD	OFFSET $L1851
	DD	OFFSET $L1843
	DD	OFFSET $L1843
	DD	OFFSET $L1844
	DD	OFFSET $L1844
$L1617:
; Line 3230
$binop$1735:
; Line 3237
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	movsx	eax, BYTE PTR _comparison_code$S1078[eax]
	or	eax, eax
	jne	$L1853
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 60					; 0000003cH
	jne	$L1852
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	call	_integer_zerop
	add	esp, 4
	or	eax, eax
	jne	$L1854
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	eax, DWORD PTR [eax+32]
	push	eax
	call	_integer_zerop
	add	esp, 4
	or	eax, eax
	je	$L1852
$L1854:
$L1853:
; Line 3240
	mov	eax, DWORD PTR _ior_optab
	cmp	DWORD PTR _this_optab$[ebp], eax
	je	$L1856
	mov	eax, DWORD PTR _add_optab
	cmp	DWORD PTR _this_optab$[ebp], eax
	je	$L1856
	mov	eax, DWORD PTR _xor_optab
	cmp	DWORD PTR _this_optab$[ebp], eax
	jne	$L1855
$L1856:
; Line 3242
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR _exch$1857[ebp], eax
; Line 3243
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	ecx, DWORD PTR _exp$[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 3244
	mov	eax, DWORD PTR _exch$1857[ebp]
	mov	ecx, DWORD PTR _exp$[ebp]
	mov	DWORD PTR [ecx+24], eax
; Line 3246
$L1855:
; Line 3248
$L1852:
; Line 3251
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	movsx	eax, BYTE PTR _comparison_code$S1078[eax]
	or	eax, eax
	jne	$L1859
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 60					; 0000003cH
	jne	$L1858
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	call	_integer_zerop
	add	esp, 4
	or	eax, eax
	jne	$L1860
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax+32]
	push	eax
	call	_integer_zerop
	add	esp, 4
	or	eax, eax
	je	$L1858
$L1860:
$L1859:
; Line 3257
	mov	eax, DWORD PTR _ior_optab
	cmp	DWORD PTR _this_optab$[ebp], eax
	je	$L1862
	mov	eax, DWORD PTR _add_optab
	cmp	DWORD PTR _this_optab$[ebp], eax
	je	$L1862
	mov	eax, DWORD PTR _xor_optab
	cmp	DWORD PTR _this_optab$[ebp], eax
	je	$L1862
	mov	eax, DWORD PTR _sub_optab
	cmp	DWORD PTR _this_optab$[ebp], eax
	je	$L1862
	mov	eax, DWORD PTR _lshl_optab
	cmp	DWORD PTR _this_optab$[ebp], eax
	je	$L1862
	mov	eax, DWORD PTR _ashl_optab
	cmp	DWORD PTR _this_optab$[ebp], eax
	je	$L1862
	mov	eax, DWORD PTR _lshr_optab
	cmp	DWORD PTR _this_optab$[ebp], eax
	je	$L1862
	mov	eax, DWORD PTR _ashr_optab
	cmp	DWORD PTR _this_optab$[ebp], eax
	je	$L1862
	mov	eax, DWORD PTR _rotl_optab
	cmp	DWORD PTR _this_optab$[ebp], eax
	je	$L1862
	mov	eax, DWORD PTR _rotr_optab
	cmp	DWORD PTR _this_optab$[ebp], eax
	jne	$L1861
$L1862:
; Line 3260
	mov	DWORD PTR _thenv$1864[ebp], 0
; Line 3264
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	mov	eax, DWORD PTR _subtarget$[ebp]
	push	eax
	call	_validate_subtarget
	add	esp, 8
	mov	DWORD PTR _target$[ebp], eax
; Line 3265
	cmp	DWORD PTR _target$[ebp], 0
	jne	$L1865
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_gen_reg_rtx
	add	esp, 4
	mov	DWORD PTR _target$[ebp], eax
; Line 3268
$L1865:
	push	0
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_store_expr
	add	esp, 12					; 0000000cH
; Line 3269
	call	_gen_label_rtx
	mov	DWORD PTR _op0$[ebp], eax
; Line 3272
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 60					; 0000003cH
	je	$L1866
; Line 3274
	push	0
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	call	_do_jump
	add	esp, 12					; 0000000cH
; Line 3275
	mov	eax, DWORD PTR _const1_rtx
	mov	DWORD PTR _thenv$1864[ebp], eax
; Line 3277
	jmp	$L1867
$L1866:
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax+32]
	push	eax
	call	_integer_zerop
	add	esp, 4
	or	eax, eax
	je	$L1868
; Line 3279
	push	0
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_do_jump
	add	esp, 12					; 0000000cH
; Line 3280
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR _thenexp$1863[ebp], eax
; Line 3282
	jmp	$L1869
$L1868:
; Line 3284
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	push	0
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_do_jump
	add	esp, 12					; 0000000cH
; Line 3285
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax+32]
	mov	DWORD PTR _thenexp$1863[ebp], eax
; Line 3286
$L1869:
$L1867:
; Line 3288
	cmp	DWORD PTR _thenv$1864[ebp], 0
	jne	$L1870
; Line 3289
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _thenexp$1863[ebp]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	mov	DWORD PTR _thenv$1864[ebp], eax
; Line 3294
$L1870:
	mov	eax, DWORD PTR _rotl_optab
	cmp	DWORD PTR _this_optab$[ebp], eax
	je	$L1872
	mov	eax, DWORD PTR _rotr_optab
	cmp	DWORD PTR _this_optab$[ebp], eax
	jne	$L1871
$L1872:
; Line 3296
	push	1
	push	-1
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	mov	eax, DWORD PTR _thenv$1864[ebp]
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	mov	eax, DWORD PTR _this_optab$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_expand_binop
	add	esp, 28					; 0000001cH
	mov	DWORD PTR _temp$[ebp], eax
; Line 3297
	jmp	$L1873
$L1871:
	mov	eax, DWORD PTR _lshl_optab
	cmp	DWORD PTR _this_optab$[ebp], eax
	je	$L1875
	mov	eax, DWORD PTR _lshr_optab
	cmp	DWORD PTR _this_optab$[ebp], eax
	jne	$L1874
$L1875:
; Line 3299
	push	3
	push	1
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	mov	eax, DWORD PTR _thenv$1864[ebp]
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	mov	eax, DWORD PTR _this_optab$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_expand_binop
	add	esp, 28					; 0000001cH
	mov	DWORD PTR _temp$[ebp], eax
; Line 3300
	jmp	$L1876
$L1874:
; Line 3302
	push	3
	push	0
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	mov	eax, DWORD PTR _thenv$1864[ebp]
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	mov	eax, DWORD PTR _this_optab$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_expand_binop
	add	esp, 28					; 0000001cH
	mov	DWORD PTR _temp$[ebp], eax
$L1876:
$L1873:
; Line 3303
	mov	eax, DWORD PTR _target$[ebp]
	cmp	DWORD PTR _temp$[ebp], eax
	je	$L1877
; Line 3304
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	call	_emit_move_insn
	add	esp, 8
; Line 3306
$L1877:
	call	_emit_queue
; Line 3307
	call	_do_pending_stack_adjust
; Line 3308
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	call	_emit_label
	add	esp, 4
; Line 3309
	mov	eax, DWORD PTR _target$[ebp]
	jmp	$L1596
; Line 3311
$L1861:
; Line 3312
$L1858:
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	mov	eax, DWORD PTR _subtarget$[ebp]
	push	eax
	call	_validate_subtarget
	add	esp, 8
	mov	DWORD PTR _subtarget$[ebp], eax
; Line 3313
	push	0
	push	0
	mov	eax, DWORD PTR _subtarget$[ebp]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	mov	DWORD PTR _op0$[ebp], eax
; Line 3314
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	mov	DWORD PTR _op1$[ebp], eax
; Line 3315
$binop2$1751:
; Line 3317
	push	3
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 12					; 0000000cH
	and	eax, 1
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _this_optab$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_expand_binop
	add	esp, 28					; 0000001cH
	mov	DWORD PTR _temp$[ebp], eax
; Line 3318
	cmp	DWORD PTR _temp$[ebp], 0
	jne	$L1878
; Line 3319
	call	_abort
; Line 3320
$L1878:
	mov	eax, DWORD PTR _temp$[ebp]
	jmp	$L1596
; Line 3321
$L1596:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_expand_expr ENDP
_TEXT	ENDS
EXTRN	_tree_last:NEAR
EXTRN	_current_function_calls_alloca:DWORD
EXTRN	_current_function_arg_offset_rtx:DWORD
EXTRN	_arg_pointer_rtx:DWORD
EXTRN	_void_type_node:DWORD
EXTRN	_current_function_decl:DWORD
EXTRN	_get_insns:NEAR
EXTRN	_frame_pointer_needed:DWORD
EXTRN	_get_last_insn:NEAR
EXTRN	_reorder_insns:NEAR
EXTRN	_error:NEAR
EXTRN	_round_push:NEAR
_DATA	SEGMENT
	ORG $+1
$SG1903	DB	'`stdarg.h'' facilities used, but function has fixed args'
	DB	00H
_DATA	ENDS
_TEXT	SEGMENT
_exp$ = 8
_target$ = 12
_subtarget$ = 16
_ignore$ = 24
_fndecl$ = -4
_arglist$ = -12
_op0$ = -8
_last$1895 = -20
_temp$1896 = -16
_fntype$1899 = -24
_type$1906 = -32
_code$1907 = -28
_expand_builtin PROC NEAR
; Line 3336
	push	ebp
	mov	ebp, esp
	sub	esp, 36					; 00000024H
	push	ebx
	push	esi
	push	edi
; Line 3337
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _fndecl$[ebp], eax
; Line 3338
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR _arglist$[ebp], eax
; Line 3341
	mov	eax, DWORD PTR _fndecl$[ebp]
	mov	eax, DWORD PTR [eax+48]
	mov	DWORD PTR -36+[ebp], eax
	jmp	$L1888
; Line 3343
$L1892:
; Line 3347
	call	_abort
; Line 3349
$L1893:
; Line 3350
	cmp	DWORD PTR _saveregs_value$S1061, 0
	je	$L1894
; Line 3351
	mov	eax, DWORD PTR _saveregs_value$S1061
	jmp	$L1884
; Line 3352
$L1894:
; Line 3356
	call	_get_last_insn
	mov	DWORD PTR _last$1895[ebp], eax
; Line 3359
	mov	eax, DWORD PTR _ignore$[ebp]
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	push	eax
	call	_expand_call
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _temp$1896[ebp], eax
; Line 3360
	call	_get_insns
	push	eax
	call	_get_last_insn
	push	eax
	mov	eax, DWORD PTR _last$1895[ebp]
	mov	eax, DWORD PTR [eax+12]
	push	eax
	call	_reorder_insns
	add	esp, 12					; 0000000cH
; Line 3361
	mov	eax, DWORD PTR _temp$1896[ebp]
	mov	DWORD PTR _saveregs_value$S1061, eax
; Line 3362
	mov	eax, DWORD PTR _temp$1896[ebp]
	jmp	$L1884
; Line 3365
$L1898:
; Line 3367
	mov	eax, DWORD PTR _current_function_decl
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _fntype$1899[ebp], eax
; Line 3370
	mov	eax, DWORD PTR _fntype$1899[ebp]
	cmp	DWORD PTR [eax+20], 0
	je	$L1901
	mov	eax, DWORD PTR _fntype$1899[ebp]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	call	_tree_last
	add	esp, 4
	mov	ecx, DWORD PTR _void_type_node
	cmp	DWORD PTR [eax+24], ecx
	jne	$L1900
$L1901:
; Line 3372
	push	OFFSET $SG1903
	call	_error
	add	esp, 4
; Line 3373
	mov	eax, DWORD PTR _const0_rtx
	jmp	$L1884
; Line 3375
$L1900:
; Line 3379
	push	3
	push	0
	push	0
	mov	eax, DWORD PTR _current_function_arg_offset_rtx
	push	eax
	mov	eax, DWORD PTR _arg_pointer_rtx
	push	eax
	mov	eax, DWORD PTR _add_optab
	push	eax
	push	4
	call	_expand_binop
	add	esp, 28					; 0000001cH
	jmp	$L1884
; Line 3381
$L1904:
; Line 3382
	cmp	DWORD PTR _arglist$[ebp], 0
	je	$L1905
; Line 3384
	mov	eax, DWORD PTR _arglist$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _type$1906[ebp], eax
; Line 3385
	mov	eax, DWORD PTR _type$1906[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _code$1907[ebp], eax
; Line 3386
	cmp	DWORD PTR _code$1907[ebp], 4
	jne	$L1908
; Line 3387
	push	0
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	jmp	$L1884
; Line 3388
$L1908:
	cmp	DWORD PTR _code$1907[ebp], 5
	jne	$L1909
; Line 3389
	push	1
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	jmp	$L1884
; Line 3390
$L1909:
	cmp	DWORD PTR _code$1907[ebp], 10		; 0000000aH
	jne	$L1910
; Line 3391
	push	2
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	jmp	$L1884
; Line 3392
$L1910:
	cmp	DWORD PTR _code$1907[ebp], 8
	jne	$L1911
; Line 3393
	push	3
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	jmp	$L1884
; Line 3394
$L1911:
	cmp	DWORD PTR _code$1907[ebp], 9
	jne	$L1912
; Line 3395
	push	4
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	jmp	$L1884
; Line 3396
$L1912:
	cmp	DWORD PTR _code$1907[ebp], 11		; 0000000bH
	jne	$L1913
; Line 3397
	push	5
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	jmp	$L1884
; Line 3398
$L1913:
	cmp	DWORD PTR _code$1907[ebp], 13		; 0000000dH
	jne	$L1914
; Line 3399
	push	6
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	jmp	$L1884
; Line 3400
$L1914:
	cmp	DWORD PTR _code$1907[ebp], 12		; 0000000cH
	jne	$L1915
; Line 3401
	push	7
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	jmp	$L1884
; Line 3402
$L1915:
	cmp	DWORD PTR _code$1907[ebp], 6
	jne	$L1916
; Line 3403
	push	8
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	jmp	$L1884
; Line 3404
$L1916:
	cmp	DWORD PTR _code$1907[ebp], 7
	jne	$L1917
; Line 3405
	push	9
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	jmp	$L1884
; Line 3406
$L1917:
	cmp	DWORD PTR _code$1907[ebp], 21		; 00000015H
	jne	$L1918
; Line 3407
	push	10					; 0000000aH
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	jmp	$L1884
; Line 3408
$L1918:
	cmp	DWORD PTR _code$1907[ebp], 14		; 0000000eH
	jne	$L1919
; Line 3409
	push	11					; 0000000bH
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	jmp	$L1884
; Line 3410
$L1919:
	cmp	DWORD PTR _code$1907[ebp], 19		; 00000013H
	jne	$L1920
; Line 3411
	push	12					; 0000000cH
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	jmp	$L1884
; Line 3412
$L1920:
	cmp	DWORD PTR _code$1907[ebp], 20		; 00000014H
	jne	$L1921
; Line 3413
	push	13					; 0000000dH
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	jmp	$L1884
; Line 3414
$L1921:
	cmp	DWORD PTR _code$1907[ebp], 16		; 00000010H
	jne	$L1922
; Line 3415
	push	14					; 0000000eH
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	jmp	$L1884
; Line 3416
$L1922:
	cmp	DWORD PTR _code$1907[ebp], 18		; 00000012H
	jne	$L1923
; Line 3417
	push	15					; 0000000fH
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	jmp	$L1884
; Line 3418
$L1923:
	cmp	DWORD PTR _code$1907[ebp], 17		; 00000011H
	jne	$L1924
; Line 3419
	push	16					; 00000010H
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	jmp	$L1884
; Line 3420
$L1924:
	cmp	DWORD PTR _code$1907[ebp], 15		; 0000000fH
	jne	$L1925
; Line 3421
	push	17					; 00000011H
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	jmp	$L1884
; Line 3422
$L1925:
	cmp	DWORD PTR _code$1907[ebp], 22		; 00000016H
	jne	$L1926
; Line 3423
	push	18					; 00000012H
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	jmp	$L1884
; Line 3424
$L1926:
; Line 3425
$L1905:
	push	-1
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	jmp	$L1884
; Line 3427
$L1927:
; Line 3430
	cmp	DWORD PTR _arglist$[ebp], 0
	je	$L1929
	mov	eax, DWORD PTR _arglist$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 5
	je	$L1928
$L1929:
; Line 3431
	mov	eax, DWORD PTR _const0_rtx
	jmp	$L1884
; Line 3432
$L1928:
	mov	DWORD PTR _frame_pointer_needed, 1
; Line 3433
	mov	DWORD PTR _current_function_calls_alloca, 1
; Line 3435
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _arglist$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	mov	DWORD PTR _op0$[ebp], eax
; Line 3436
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1930
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1930
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1930
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1930
; Line 3438
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	call	_force_reg
	add	esp, 8
	mov	DWORD PTR _op0$[ebp], eax
; Line 3439
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 67108864				; 04000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L1931
; Line 3440
	push	1
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	push	4
	call	_convert_to_mode
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _op0$[ebp], eax
; Line 3441
$L1931:
; Line 3443
$L1930:
	call	_do_pending_stack_adjust
; Line 3455
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	call	_round_push
	add	esp, 4
	push	eax
	call	_anti_adjust_stack
	add	esp, 4
; Line 3458
	cmp	DWORD PTR _target$[ebp], 0
	je	$L1932
; Line 3459
	mov	eax, DWORD PTR _stack_pointer_rtx
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	call	_emit_move_insn
	add	esp, 8
; Line 3460
	jmp	$L1933
$L1932:
; Line 3461
	mov	eax, DWORD PTR _stack_pointer_rtx
	push	eax
	call	_copy_to_reg
	add	esp, 4
	mov	DWORD PTR _target$[ebp], eax
$L1933:
; Line 3491
	mov	eax, DWORD PTR _target$[ebp]
	jmp	$L1884
; Line 3493
$L1934:
; Line 3496
	cmp	DWORD PTR _arglist$[ebp], 0
	je	$L1936
	mov	eax, DWORD PTR _arglist$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 5
	je	$L1935
$L1936:
; Line 3497
	mov	eax, DWORD PTR _const0_rtx
	jmp	$L1884
; Line 3500
$L1935:
	push	0
	push	0
	mov	eax, DWORD PTR _subtarget$[ebp]
	push	eax
	mov	eax, DWORD PTR _arglist$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	mov	DWORD PTR _op0$[ebp], eax
; Line 3504
	push	1
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _ffs_optab
	push	eax
	mov	eax, DWORD PTR _arglist$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	sar	eax, 24					; 00000018H
	push	eax
	call	_expand_unop
	add	esp, 20					; 00000014H
	mov	DWORD PTR _target$[ebp], eax
; Line 3505
	cmp	DWORD PTR _target$[ebp], 0
	jne	$L1937
; Line 3506
	call	_abort
; Line 3507
$L1937:
	mov	eax, DWORD PTR _target$[ebp]
	jmp	$L1884
; Line 3509
$L1938:
; Line 3510
	call	_abort
; Line 3511
	jmp	$L1889
$L1888:
	dec	DWORD PTR -36+[ebp]
	cmp	DWORD PTR -36+[ebp], 19			; 00000013H
	ja	$L1938
	shl	DWORD PTR -36+[ebp], 2
	mov	eax, DWORD PTR -36+[ebp]
	jmp	DWORD PTR $L2540[eax]
$L2540:
	DD	OFFSET $L1927
	DD	OFFSET $L1892
	DD	OFFSET $L1892
	DD	OFFSET $L1892
	DD	OFFSET $L1934
	DD	OFFSET $L1938
	DD	OFFSET $L1938
	DD	OFFSET $L1938
	DD	OFFSET $L1938
	DD	OFFSET $L1938
	DD	OFFSET $L1938
	DD	OFFSET $L1938
	DD	OFFSET $L1938
	DD	OFFSET $L1938
	DD	OFFSET $L1938
	DD	OFFSET $L1938
	DD	OFFSET $L1938
	DD	OFFSET $L1893
	DD	OFFSET $L1904
	DD	OFFSET $L1898
$L1889:
; Line 3512
$L1884:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_expand_builtin ENDP
_TEXT	ENDS
EXTRN	_stabilize:NEAR
_TEXT	SEGMENT
_exp$ = 8
_post$ = 12
_op0$ = -12
_op1$ = -32
_temp$ = -24
_incremented$ = -20
_this_optab$ = -16
_icode$ = -8
_mode$ = -4
_op0_is_copy$ = -28
_newexp$1956 = -36
_expand_increment PROC NEAR
; Line 3522
	push	ebp
	mov	ebp, esp
	sub	esp, 36					; 00000024H
	push	ebx
	push	esi
	push	edi
; Line 3525
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _incremented$[ebp], eax
; Line 3526
	mov	eax, DWORD PTR _add_optab
	mov	DWORD PTR _this_optab$[ebp], eax
; Line 3528
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	sar	eax, 24					; 00000018H
	mov	DWORD PTR _mode$[ebp], eax
; Line 3529
	mov	DWORD PTR _op0_is_copy$[ebp], 0
; Line 3535
	mov	eax, DWORD PTR _incremented$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 47					; 0000002fH
	jne	$L1950
	mov	eax, DWORD PTR _incremented$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 48					; 00000030H
	jne	$L1951
	mov	eax, DWORD PTR _incremented$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	and	eax, -16777216				; ff000000H
	mov	ecx, 419430400				; 19000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1950
$L1951:
; Line 3536
	mov	eax, DWORD PTR _incremented$[ebp]
	push	eax
	call	_stabilize_reference
	add	esp, 4
	mov	DWORD PTR _incremented$[ebp], eax
; Line 3542
$L1950:
	call	_get_last_insn
	mov	DWORD PTR _temp$[ebp], eax
; Line 3543
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _incremented$[ebp]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	mov	DWORD PTR _op0$[ebp], eax
; Line 3544
	call	_get_last_insn
	cmp	eax, DWORD PTR _temp$[ebp]
	je	$L1952
; Line 3545
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L2543
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2541
$L2543:
	mov	DWORD PTR _op0_is_copy$[ebp], 1
	jmp	$L2542
$L2541:
	mov	DWORD PTR _op0_is_copy$[ebp], 0
$L2542:
; Line 3546
$L1952:
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	mov	DWORD PTR _op1$[ebp], eax
; Line 3550
	mov	eax, DWORD PTR _exp$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 127				; 0000007fH
	je	$L1954
	mov	eax, DWORD PTR _exp$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 125				; 0000007dH
	jne	$L1953
$L1954:
; Line 3551
	mov	eax, DWORD PTR _sub_optab
	mov	DWORD PTR _this_optab$[ebp], eax
; Line 3557
$L1953:
	cmp	DWORD PTR _op0_is_copy$[ebp], 0
	je	$L1955
; Line 3569
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	mov	eax, DWORD PTR _incremented$[ebp]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _this_optab$[ebp]
	sub	eax, DWORD PTR _add_optab
	cmp	eax, 1
	sbb	eax, eax
	add	eax, 65					; 00000041H
	push	eax
	call	_build
	add	esp, 16					; 00000010H
	mov	DWORD PTR _newexp$1956[ebp], eax
; Line 3570
	push	0
	cmp	DWORD PTR _post$[ebp], 1
	sbb	eax, eax
	neg	eax
	push	eax
	mov	eax, DWORD PTR _newexp$1956[ebp]
	push	eax
	mov	eax, DWORD PTR _incremented$[ebp]
	push	eax
	call	_expand_assignment
	add	esp, 16					; 00000010H
	mov	DWORD PTR _temp$[ebp], eax
; Line 3571
	cmp	DWORD PTR _post$[ebp], 0
	je	$L2544
	mov	eax, DWORD PTR _op0$[ebp]
	jmp	$L2545
$L2544:
	mov	eax, DWORD PTR _temp$[ebp]
$L2545:
	jmp	$L1941
; Line 3575
$L1955:
; Line 3576
	mov	eax, DWORD PTR _sub_optab
	cmp	DWORD PTR _this_optab$[ebp], eax
	jne	$L1957
	mov	eax, DWORD PTR _op1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1957
; Line 3578
	mov	eax, DWORD PTR _op1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	neg	eax
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _op1$[ebp], eax
; Line 3579
	mov	eax, DWORD PTR _add_optab
	mov	DWORD PTR _this_optab$[ebp], eax
; Line 3582
$L1957:
	cmp	DWORD PTR _post$[ebp], 0
	je	$L1958
; Line 3588
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	call	_stabilize
	add	esp, 4
	mov	DWORD PTR _op0$[ebp], eax
; Line 3590
	mov	eax, DWORD PTR _mode$[ebp]
	mov	ecx, DWORD PTR _this_optab$[ebp]
	mov	eax, DWORD PTR [ecx+eax*8+4]
	mov	DWORD PTR _icode$[ebp], eax
; Line 3595
	cmp	DWORD PTR _icode$[ebp], 142		; 0000008eH
	je	$L1959
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _icode$[ebp]
	mov	ecx, eax
	shl	eax, 3
	sub	eax, ecx
	call	DWORD PTR _insn_operand_predicate[eax*4]
	add	esp, 8
	or	eax, eax
	je	$L1959
	mov	eax, DWORD PTR _mode$[ebp]
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
	je	$L1959
; Line 3597
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	mov	eax, DWORD PTR _icode$[ebp]
	mov	ecx, eax
	shl	eax, 3
	sub	eax, ecx
	call	DWORD PTR _insn_operand_predicate[eax*4+8]
	add	esp, 8
	or	eax, eax
	jne	$L1960
; Line 3598
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_force_reg
	add	esp, 8
	mov	DWORD PTR _op1$[ebp], eax
; Line 3600
$L1960:
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _icode$[ebp]
	call	DWORD PTR _insn_gen_function[eax*4]
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	call	_enqueue_insn
	add	esp, 8
	jmp	$L1941
; Line 3602
$L1959:
; Line 3605
$L1958:
	cmp	DWORD PTR _post$[ebp], 0
	je	$L1961
; Line 3607
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	call	_copy_to_reg
	add	esp, 4
	mov	DWORD PTR _temp$[ebp], eax
; Line 3608
	jmp	$L1962
$L1961:
; Line 3613
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	call	_copy_rtx
	add	esp, 4
	mov	DWORD PTR _temp$[ebp], eax
$L1962:
; Line 3617
	push	3
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 12					; 0000000cH
	and	eax, 1
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _this_optab$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_expand_binop
	add	esp, 28					; 0000001cH
	mov	DWORD PTR _op1$[ebp], eax
; Line 3619
	mov	eax, DWORD PTR _op0$[ebp]
	cmp	DWORD PTR _op1$[ebp], eax
	je	$L1963
; Line 3620
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	call	_emit_move_insn
	add	esp, 8
; Line 3622
$L1963:
	mov	eax, DWORD PTR _temp$[ebp]
	jmp	$L1941
; Line 3623
$L1941:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_expand_increment ENDP
_TEXT	ENDS
EXTRN	_tree_code_type:BYTE
EXTRN	_tree_code_length:BYTE
_TEXT	SEGMENT
_type$1985 = -12
_exp$ = 8
_nops$ = -8
_i$ = -4
_preexpand_calls PROC NEAR
; Line 3638
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 3641
	cmp	DWORD PTR _do_preexpand_calls, 0
	jne	$L1968
; Line 3642
	jmp	$L1965
; Line 3646
$L1968:
; Line 3647
	mov	eax, DWORD PTR _exp$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	eax, DWORD PTR _tree_code_type[eax*4]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 101				; 00000065H
	je	$L1969
	mov	eax, DWORD PTR _exp$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	eax, DWORD PTR _tree_code_type[eax*4]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 114				; 00000072H
	je	$L1969
; Line 3648
	jmp	$L1965
; Line 3650
$L1969:
	mov	eax, DWORD PTR _exp$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR -16+[ebp], eax
	jmp	$L1970
; Line 3652
$L1974:
; Line 3657
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 116				; 00000074H
	jne	$L1975
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	eax, DWORD PTR [eax+24]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 39					; 00000027H
	jne	$L1975
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	eax, DWORD PTR [eax+24]
	cmp	DWORD PTR [eax+48], 0
	je	$L1975
; Line 3658
	jmp	$L1965
; Line 3660
$L1975:
; Line 3662
	mov	eax, DWORD PTR _exp$[ebp]
	cmp	DWORD PTR [eax+32], 0
	jne	$L1976
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	and	eax, -16777216				; ff000000H
	mov	ecx, 436207616				; 1a000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L1976
; Line 3663
	push	0
	push	0
	mov	eax, DWORD PTR _exp$[ebp]
	push	eax
	call	_expand_call
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _exp$[ebp]
	mov	DWORD PTR [ecx+32], eax
; Line 3664
$L1976:
	jmp	$L1965
; Line 3666
$L1977:
; Line 3675
	call	_do_pending_stack_adjust
; Line 3676
	jmp	$L1965
; Line 3678
$L1978:
; Line 3679
	jmp	$L1965
; Line 3681
$L1979:
; Line 3682
	mov	eax, DWORD PTR _exp$[ebp]
	cmp	DWORD PTR [eax+28], 0
	je	$L1980
; Line 3683
	jmp	$L1965
; Line 3684
$L1980:
	jmp	$L1971
$L1970:
	cmp	DWORD PTR -16+[ebp], 98			; 00000062H
	jg	$L2546
	cmp	DWORD PTR -16+[ebp], 97			; 00000061H
	jge	$L1977
	cmp	DWORD PTR -16+[ebp], 53			; 00000035H
	je	$L1977
	cmp	DWORD PTR -16+[ebp], 60			; 0000003cH
	je	$L1977
	cmp	DWORD PTR -16+[ebp], 61			; 0000003dH
	je	$L1974
	jmp	$L1971
$L2546:
	cmp	DWORD PTR -16+[ebp], 114		; 00000072H
	je	$L1979
	cmp	DWORD PTR -16+[ebp], 115		; 00000073H
	je	$L1965
	jmp	$L1971
$L1971:
; Line 3686
	mov	eax, DWORD PTR _exp$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	eax, DWORD PTR _tree_code_length[eax*4]
	mov	DWORD PTR _nops$[ebp], eax
; Line 3687
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L1981
$L1982:
	inc	DWORD PTR _i$[ebp]
$L1981:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _nops$[ebp], eax
	jle	$L1983
; Line 3688
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _exp$[ebp]
	cmp	DWORD PTR [ecx+eax*4+24], 0
	je	$L1984
; Line 3690
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+24]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	eax, DWORD PTR _tree_code_type[eax*4]
	movsx	eax, BYTE PTR [eax]
	mov	DWORD PTR _type$1985[ebp], eax
; Line 3691
	cmp	DWORD PTR _type$1985[ebp], 101		; 00000065H
	je	$L1987
	cmp	DWORD PTR _type$1985[ebp], 114		; 00000072H
	jne	$L1986
$L1987:
; Line 3692
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+24]
	push	eax
	call	_preexpand_calls
	add	esp, 4
; Line 3693
$L1986:
; Line 3694
$L1984:
	jmp	$L1982
$L1983:
$L1965:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_preexpand_calls ENDP
_TEXT	ENDS
EXTRN	_static_chain_rtx:DWORD
EXTRN	_lookup_static_chain:NEAR
_TEXT	SEGMENT
_funexp$ = 8
_context$ = 12
_prepare_call_address PROC NEAR
; Line 3704
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 3705
	push	0
	mov	eax, DWORD PTR _funexp$[ebp]
	push	eax
	call	_protect_from_queue
	add	esp, 8
	mov	DWORD PTR _funexp$[ebp], eax
; Line 3706
	cmp	DWORD PTR _context$[ebp], 0
	je	$L1991
; Line 3707
	push	0
	mov	eax, DWORD PTR _context$[ebp]
	push	eax
	call	_protect_from_queue
	add	esp, 8
	mov	DWORD PTR _context$[ebp], eax
; Line 3710
$L1991:
	mov	eax, DWORD PTR _funexp$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 452984832				; 1b000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1992
; Line 3712
	mov	eax, DWORD PTR _funexp$[ebp]
	push	eax
	push	4
	call	_gen_highpart
	add	esp, 8
	push	eax
	mov	eax, DWORD PTR _static_chain_rtx
	push	eax
	call	_emit_move_insn
	add	esp, 8
; Line 3713
	mov	eax, DWORD PTR _funexp$[ebp]
	push	eax
	push	4
	call	_gen_lowpart
	add	esp, 8
	push	eax
	push	1
	call	_memory_address
	add	esp, 8
	mov	DWORD PTR _funexp$[ebp], eax
; Line 3714
	mov	eax, DWORD PTR _static_chain_rtx
	push	eax
	push	0
	push	26					; 0000001aH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	call	_emit_insn
	add	esp, 4
; Line 3716
	jmp	$L1993
$L1992:
; Line 3718
	cmp	DWORD PTR _context$[ebp], 0
	je	$L1994
; Line 3720
	mov	eax, DWORD PTR _context$[ebp]
	push	eax
	call	_lookup_static_chain
	add	esp, 4
	push	eax
	mov	eax, DWORD PTR _static_chain_rtx
	push	eax
	call	_emit_move_insn
	add	esp, 8
; Line 3724
$L1994:
	mov	eax, DWORD PTR _funexp$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1995
; Line 3725
	mov	eax, DWORD PTR _funexp$[ebp]
	push	eax
	push	1
	call	_memory_address
	add	esp, 8
	mov	DWORD PTR _funexp$[ebp], eax
; Line 3726
	jmp	$L1996
$L1995:
; Line 3732
$L1996:
; Line 3734
	cmp	DWORD PTR _context$[ebp], 0
	je	$L1997
; Line 3735
	mov	eax, DWORD PTR _static_chain_rtx
	push	eax
	push	0
	push	26					; 0000001aH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	call	_emit_insn
	add	esp, 4
; Line 3736
$L1997:
$L1993:
; Line 3737
	mov	eax, DWORD PTR _funexp$[ebp]
	jmp	$L1990
; Line 3738
$L1990:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_prepare_call_address ENDP
_TEXT	ENDS
EXTRN	_gen_call:NEAR
EXTRN	_gen_call_value:NEAR
EXTRN	_flag_defer_pop:DWORD
EXTRN	_adjust_stack:NEAR
EXTRN	_emit_call_insn:NEAR
_TEXT	SEGMENT
_funexp$ = 8
_funtype$ = 12
_stack_size$ = 16
_next_arg_reg$ = 20
_valreg$ = 24
_old_inhibit_defer_pop$ = 28
_use_insns$ = 32
_stack_size_rtx$ = -4
_call_insn$ = -8
_emit_call_1 PROC NEAR
; Line 3780
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 3781
	mov	eax, DWORD PTR _stack_size$[ebp]
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _stack_size_rtx$[ebp], eax
; Line 3784
	cmp	DWORD PTR _valreg$[ebp], 0
	je	$L2008
; Line 3787
	mov	eax, DWORD PTR _next_arg_reg$[ebp]
	push	eax
	mov	eax, DWORD PTR _stack_size_rtx$[ebp]
	push	eax
	mov	eax, DWORD PTR _funexp$[ebp]
	push	eax
	push	1
	push	37					; 00000025H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _valreg$[ebp]
	push	eax
	call	_gen_call_value
	add	esp, 16					; 00000010H
	push	eax
	call	_emit_call_insn
	add	esp, 4
; Line 3788
	jmp	$L2009
$L2008:
; Line 3790
	mov	eax, DWORD PTR _next_arg_reg$[ebp]
	push	eax
	mov	eax, DWORD PTR _stack_size_rtx$[ebp]
	push	eax
	mov	eax, DWORD PTR _funexp$[ebp]
	push	eax
	push	1
	push	37					; 00000025H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	call	_gen_call
	add	esp, 12					; 0000000cH
	push	eax
	call	_emit_call_insn
	add	esp, 4
$L2009:
; Line 3795
	call	_get_last_insn
	mov	DWORD PTR _call_insn$[ebp], eax
	jmp	$L2010
$L2011:
	mov	eax, DWORD PTR _call_insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _call_insn$[ebp], eax
$L2010:
	cmp	DWORD PTR _call_insn$[ebp], 0
	je	$L2012
	mov	eax, DWORD PTR _call_insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 983040				; 000f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L2012
; Line 3796
	jmp	$L2011
$L2012:
; Line 3798
	cmp	DWORD PTR _call_insn$[ebp], 0
	jne	$L2013
; Line 3799
	call	_abort
; Line 3802
$L2013:
	mov	eax, DWORD PTR _call_insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _use_insns$[ebp]
	push	eax
	call	_emit_insn_before
	add	esp, 8
; Line 3804
	mov	eax, DWORD PTR _old_inhibit_defer_pop$[ebp]
	mov	DWORD PTR _inhibit_defer_pop, eax
; Line 3811
	test	BYTE PTR _target_flags, 8
	je	$L2015
	mov	eax, DWORD PTR _funtype$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 1
	je	$L2015
	mov	eax, DWORD PTR _funtype$[ebp]
	cmp	DWORD PTR [eax+20], 0
	je	$L2014
	mov	eax, DWORD PTR _funtype$[ebp]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	call	_tree_last
	add	esp, 4
	mov	ecx, DWORD PTR _void_type_node
	cmp	DWORD PTR [eax+24], ecx
	je	$L2014
$L2015:
	cmp	DWORD PTR _stack_size$[ebp], 0
	je	$L2014
; Line 3813
	cmp	DWORD PTR _flag_defer_pop, 0
	je	$L2016
	cmp	DWORD PTR _inhibit_defer_pop, 0
	jne	$L2016
; Line 3814
	mov	eax, DWORD PTR _stack_size$[ebp]
	add	DWORD PTR _pending_stack_adjust, eax
; Line 3815
	jmp	$L2017
$L2016:
; Line 3816
	mov	eax, DWORD PTR _stack_size_rtx$[ebp]
	push	eax
	call	_adjust_stack
	add	esp, 4
$L2017:
; Line 3818
$L2014:
$L2005:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_emit_call_1 ENDP
_TEXT	ENDS
PUBLIC	_init_pending_stack_adjust
_TEXT	SEGMENT
_init_pending_stack_adjust PROC NEAR
; Line 3825
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 3826
	mov	DWORD PTR _pending_stack_adjust, 0
; Line 3827
$L2019:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_init_pending_stack_adjust ENDP
_TEXT	ENDS
PUBLIC	_clear_pending_stack_adjust
EXTRN	_flag_omit_frame_pointer:DWORD
EXTRN	_flag_inline_functions:DWORD
_TEXT	SEGMENT
_clear_pending_stack_adjust PROC NEAR
; Line 3834
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 3838
	cmp	DWORD PTR _flag_omit_frame_pointer, 0
	jne	$L2022
	mov	eax, DWORD PTR _current_function_decl
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 14					; 0000000eH
	test	al, 1
	jne	$L2022
	cmp	DWORD PTR _flag_inline_functions, 0
	jne	$L2022
; Line 3839
	mov	DWORD PTR _pending_stack_adjust, 0
; Line 3841
$L2022:
$L2021:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_clear_pending_stack_adjust ENDP
_do_pending_stack_adjust PROC NEAR
; Line 3847
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 3848
	cmp	DWORD PTR _inhibit_defer_pop, 0
	jne	$L2024
; Line 3850
	cmp	DWORD PTR _pending_stack_adjust, 0
	je	$L2025
; Line 3851
	mov	eax, DWORD PTR _pending_stack_adjust
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	call	_adjust_stack
	add	esp, 4
; Line 3852
$L2025:
	mov	DWORD PTR _pending_stack_adjust, 0
; Line 3854
$L2024:
$L2023:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_do_pending_stack_adjust ENDP
_TEXT	ENDS
EXTRN	_pop_structure_value:NEAR
EXTRN	_struct_value_rtx:DWORD
EXTRN	_error_mark_node:DWORD
EXTRN	_mark_addressable:NEAR
EXTRN	_rtx_equal_p:NEAR
EXTRN	_current_function_calls_setjmp:DWORD
EXTRN	_aggregate_value_p:NEAR
EXTRN	_push_structure_value:NEAR
EXTRN	_expand_inline_function:NEAR
EXTRN	_hard_function_value:NEAR
EXTRN	_strcmp:NEAR
EXTRN	_convert_units:NEAR
EXTRN	_get_structure_value_addr:NEAR
EXTRN	_genop:NEAR
EXTRN	_emit_note:NEAR
EXTRN	_memset:NEAR
_DATA	SEGMENT
$SG2093	DB	'alloca', 00H
	ORG $+1
$SG2094	DB	'__builtin_alloca', 00H
	ORG $+3
$SG2095	DB	'setjmp', 00H
	ORG $+1
$SG2096	DB	'_setjmp', 00H
$SG2097	DB	'__builtin_new', 00H
_DATA	ENDS
_TEXT	SEGMENT
_needed$2176 = -220
_args_size$ = -24
_starting_args_size$ = -16
_type$2114 = -180
_stack_count_regparms$ = -100
_args_so_far$ = -92
_reg_parm_seen$ = -44
_must_preallocate$ = -64
_inc$ = -88
_argblock$ = -84
_needed$2184 = -224
_stack_align$ = -124
_insn_first$2249 = -236
_size$2121 = -184
_may_be_alloca$ = -148
_insn_last$2250 = -232
_is_setjmp$ = -8
_note$2251 = -228
_is_integrable$ = -168
_is_builtin_new$ = -36
_is_const$ = -60
_size$2126 = -188
_BLKmode_parms_forced$ = -52
_BLKmode_parms_first_offset$ = -164
_BLKmode_parms_sizes$ = -160
_inc$2129 = -192
_protected_stack$ = -76
_insn_before$ = -120
_old_stack_level$ = -144
_old_pending_adj$ = -32
_old_inhibit_defer_pop$ = -108
_old_cleanups$ = -72
_use_insns$ = -68
_p$ = -156
_i$ = -4
_inc$2139 = -196
_partial_seen$2144 = -200
_temp$2090 = -172
_j$2156 = -208
_struct_value_lossage$2157 = -204
_exp$ = 8
_target$ = 12
_ignore$ = 16
_actparms$ = -56
_funexp$ = -12
_funtype$ = -140
_fndecl$ = -28
_valreg$ = -116
_structure_value_addr$ = -48
_size$2167 = -216
_tem$2103 = -176
_structure_value_addr_parm$ = -152
_structval$2168 = -212
_saved_structure_value_addr$ = -136
_saved_structure_value_size$ = -132
_pcc_struct_value$ = -128
_result_copy_insn$ = -40
_num_actuals$ = -96
_n_named_args$ = -104
_argpos$ = -112
_args$ = -80
_expand_call PROC NEAR
; Line 3898
	push	ebp
	mov	ebp, esp
	sub	esp, 252				; 000000fcH
	push	ebx
	push	esi
	push	edi
; Line 3900
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR _actparms$[ebp], eax
; Line 3907
	mov	DWORD PTR _fndecl$[ebp], 0
; Line 3914
	mov	DWORD PTR _structure_value_addr$[ebp], 0
; Line 3918
	mov	DWORD PTR _structure_value_addr_parm$[ebp], 0
; Line 3924
	mov	DWORD PTR _pcc_struct_value$[ebp], 0
; Line 3927
	mov	DWORD PTR _result_copy_insn$[ebp], 0
; Line 3947
	mov	DWORD PTR _stack_count_regparms$[ebp], 0
; Line 3958
	mov	DWORD PTR _argblock$[ebp], 0
; Line 3960
	mov	DWORD PTR _stack_align$[ebp], 0
; Line 3967
	mov	DWORD PTR _is_integrable$[ebp], 0
; Line 3971
	mov	DWORD PTR _is_const$[ebp], 0
; Line 3975
	mov	DWORD PTR _BLKmode_parms_forced$[ebp], 0
; Line 3978
	mov	DWORD PTR _BLKmode_parms_first_offset$[ebp], 0
; Line 3980
	mov	DWORD PTR _BLKmode_parms_sizes$[ebp], 0
; Line 3984
	mov	DWORD PTR _protected_stack$[ebp], 0
; Line 3990
	mov	DWORD PTR _old_stack_level$[ebp], 0
; Line 3992
	mov	eax, DWORD PTR _inhibit_defer_pop
	mov	DWORD PTR _old_inhibit_defer_pop$[ebp], eax
; Line 3993
	mov	eax, DWORD PTR _cleanups_of_this_call$S1060
	mov	DWORD PTR _old_cleanups$[ebp], eax
; Line 4002
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _p$[ebp], eax
; Line 4003
	mov	eax, DWORD PTR _p$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 116				; 00000074H
	jne	$L2074
; Line 4005
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _fndecl$[ebp], eax
; Line 4006
	mov	eax, DWORD PTR _fndecl$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 39					; 00000027H
	je	$L2075
; Line 4007
	mov	DWORD PTR _fndecl$[ebp], 0
; Line 4008
	jmp	$L2076
$L2075:
; Line 4013
	mov	eax, DWORD PTR _fndecl$[ebp]
	cmp	DWORD PTR _current_function_decl, eax
	je	$L2077
	mov	eax, DWORD PTR _fndecl$[ebp]
	cmp	DWORD PTR [eax+84], 0
	je	$L2077
; Line 4014
	mov	DWORD PTR _is_integrable$[ebp], 1
; Line 4015
	jmp	$L2078
$L2077:
; Line 4019
	mov	eax, DWORD PTR _fndecl$[ebp]
	push	eax
	call	_mark_addressable
	add	esp, 4
; Line 4020
$L2078:
; Line 4022
	mov	eax, DWORD PTR _fndecl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 5
	test	al, 1
	je	$L2080
	mov	eax, DWORD PTR _fndecl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 11					; 0000000bH
	test	al, 1
	jne	$L2080
; Line 4023
	mov	DWORD PTR _is_const$[ebp], 1
; Line 4024
$L2080:
$L2076:
; Line 4029
$L2074:
	cmp	DWORD PTR _is_const$[ebp], 0
	je	$L2081
; Line 4030
	inc	DWORD PTR _inhibit_defer_pop
; Line 4035
$L2081:
	mov	eax, DWORD PTR _exp$[ebp]
	push	eax
	call	_aggregate_value_p
	add	esp, 4
	or	eax, eax
	je	$L2083
; Line 4047
	cmp	DWORD PTR _target$[ebp], 0
	je	$L2084
	mov	eax, DWORD PTR _target$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2084
; Line 4049
	mov	eax, DWORD PTR _target$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _structure_value_addr$[ebp], eax
; Line 4050
	mov	eax, DWORD PTR _structure_value_addr$[ebp]
	push	eax
	mov	eax, DWORD PTR _stack_pointer_rtx
	push	eax
	call	_reg_mentioned_p
	add	esp, 8
	or	eax, eax
	je	$L2085
; Line 4051
	mov	eax, DWORD PTR _structure_value_addr$[ebp]
	push	eax
	call	_copy_to_reg
	add	esp, 4
	mov	DWORD PTR _structure_value_addr$[ebp], eax
; Line 4052
$L2085:
; Line 4053
	jmp	$L2086
$L2084:
; Line 4056
	lea	eax, DWORD PTR _saved_structure_value_size$[ebp]
	push	eax
	lea	eax, DWORD PTR _saved_structure_value_addr$[ebp]
	push	eax
	call	_push_structure_value
	add	esp, 8
; Line 4059
	mov	eax, DWORD PTR _exp$[ebp]
	push	eax
	call	_expr_size
	add	esp, 4
	push	eax
	call	_get_structure_value_addr
	add	esp, 4
	mov	DWORD PTR _structure_value_addr$[ebp], eax
; Line 4060
	mov	DWORD PTR _target$[ebp], 0
; Line 4061
$L2086:
; Line 4067
$L2083:
	cmp	DWORD PTR _is_integrable$[ebp], 0
	je	$L2088
; Line 4074
	mov	eax, DWORD PTR _structure_value_addr$[ebp]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _ignore$[ebp]
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	mov	eax, DWORD PTR _actparms$[ebp]
	push	eax
	mov	eax, DWORD PTR _fndecl$[ebp]
	push	eax
	call	_expand_inline_function
	add	esp, 24					; 00000018H
	mov	DWORD PTR _temp$2090[ebp], eax
; Line 4077
	cmp	DWORD PTR _temp$2090[ebp], -1
	je	$L2091
; Line 4078
	mov	eax, DWORD PTR _temp$2090[ebp]
	jmp	$L2032
; Line 4082
$L2091:
	mov	eax, DWORD PTR _fndecl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	or	eax, 512				; 00000200H
	mov	ecx, DWORD PTR _fndecl$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 4083
	mov	eax, DWORD PTR _fndecl$[ebp]
	mov	eax, DWORD PTR [eax+40]
	mov	eax, DWORD PTR [eax+16]
	or	eax, 512				; 00000200H
	mov	ecx, DWORD PTR _fndecl$[ebp]
	mov	ecx, DWORD PTR [ecx+40]
	mov	DWORD PTR [ecx+16], eax
; Line 4100
$L2088:
; Line 4103
	cmp	DWORD PTR _fndecl$[ebp], 0
	je	$L2547
	push	OFFSET $SG2093
	mov	eax, DWORD PTR _fndecl$[ebp]
	mov	eax, DWORD PTR [eax+40]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	je	$L2549
	push	OFFSET $SG2094
	mov	eax, DWORD PTR _fndecl$[ebp]
	mov	eax, DWORD PTR [eax+40]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L2547
$L2549:
	mov	DWORD PTR _may_be_alloca$[ebp], 1
	jmp	$L2548
$L2547:
	mov	DWORD PTR _may_be_alloca$[ebp], 0
$L2548:
; Line 4111
	cmp	DWORD PTR _fndecl$[ebp], 0
	je	$L2550
	push	OFFSET $SG2095
	mov	eax, DWORD PTR _fndecl$[ebp]
	mov	eax, DWORD PTR [eax+40]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	je	$L2552
	push	OFFSET $SG2096
	mov	eax, DWORD PTR _fndecl$[ebp]
	mov	eax, DWORD PTR [eax+40]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L2550
$L2552:
	mov	DWORD PTR _is_setjmp$[ebp], 1
	jmp	$L2551
$L2550:
	mov	DWORD PTR _is_setjmp$[ebp], 0
$L2551:
; Line 4115
	cmp	DWORD PTR _fndecl$[ebp], 0
	je	$L2553
	push	OFFSET $SG2097
	mov	eax, DWORD PTR _fndecl$[ebp]
	mov	eax, DWORD PTR [eax+40]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L2553
	mov	DWORD PTR _is_builtin_new$[ebp], 1
	jmp	$L2554
$L2553:
	mov	DWORD PTR _is_builtin_new$[ebp], 0
$L2554:
; Line 4117
	cmp	DWORD PTR _may_be_alloca$[ebp], 0
	je	$L2098
; Line 4119
	mov	DWORD PTR _frame_pointer_needed, 1
; Line 4120
	mov	DWORD PTR _may_call_alloca, 1
; Line 4121
	mov	DWORD PTR _current_function_calls_alloca, 1
; Line 4129
$L2098:
; Line 4130
	cmp	DWORD PTR _pending_stack_adjust, 32	; 00000020H
	jge	$L2100
	cmp	DWORD PTR _is_const$[ebp], 0
	jne	$L2100
	cmp	DWORD PTR _pending_stack_adjust, 0
	jle	$L2099
	cmp	DWORD PTR _may_be_alloca$[ebp], 0
	je	$L2099
$L2100:
; Line 4131
	call	_do_pending_stack_adjust
; Line 4134
$L2099:
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _funtype$[ebp], eax
; Line 4135
	mov	eax, DWORD PTR _funtype$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 11					; 0000000bH
	je	$L2101
; Line 4136
	call	_abort
; Line 4137
$L2101:
	mov	eax, DWORD PTR _funtype$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _funtype$[ebp], eax
; Line 4149
	cmp	DWORD PTR _structure_value_addr$[ebp], 0
	je	$L2102
	cmp	DWORD PTR _struct_value_rtx, 0
	jne	$L2102
; Line 4153
	mov	DWORD PTR _args_so_far$[ebp], 0
; Line 4155
	test	BYTE PTR _target_flags, 16		; 00000010H
	je	$L2555
	cmp	DWORD PTR _args_so_far$[ebp], 8
	jge	$L2555
	mov	eax, DWORD PTR _args_so_far$[ebp]
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	push	eax
	push	4
	push	34					; 00000022H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _tem$2103[ebp], eax
	jmp	$L2556
$L2555:
	mov	DWORD PTR _tem$2103[ebp], 0
$L2556:
; Line 4156
	cmp	DWORD PTR _tem$2103[ebp], 0
	jne	$L2104
; Line 4163
	mov	eax, DWORD PTR _actparms$[ebp]
	push	eax
	mov	eax, DWORD PTR _structure_value_addr$[ebp]
	push	eax
	push	4
	call	_force_reg
	add	esp, 8
	push	eax
	push	0
	push	0
	mov	eax, DWORD PTR _mode_size+16
	shl	eax, 3
	push	eax
	call	_type_for_size
	add	esp, 8
	push	eax
	push	114					; 00000072H
	call	_build
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _error_mark_node
	push	eax
	call	_tree_cons
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _actparms$[ebp], eax
; Line 4164
	mov	DWORD PTR _structure_value_addr_parm$[ebp], 1
; Line 4174
$L2104:
; Line 4177
$L2102:
	mov	eax, DWORD PTR _actparms$[ebp]
	mov	DWORD PTR _p$[ebp], eax
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L2105
$L2106:
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _p$[ebp], eax
$L2105:
	cmp	DWORD PTR _p$[ebp], 0
	je	$L2107
	inc	DWORD PTR _i$[ebp]
	jmp	$L2106
$L2107:
; Line 4178
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _num_actuals$[ebp], eax
; Line 4184
	mov	eax, DWORD PTR _funtype$[ebp]
	cmp	DWORD PTR [eax+20], 0
	je	$L2108
; Line 4185
	mov	eax, DWORD PTR _funtype$[ebp]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	call	_list_length
	add	esp, 4
	dec	eax
	mov	DWORD PTR _n_named_args$[ebp], eax
; Line 4186
	jmp	$L2109
$L2108:
; Line 4188
	mov	eax, DWORD PTR _num_actuals$[ebp]
	mov	DWORD PTR _n_named_args$[ebp], eax
$L2109:
; Line 4191
	mov	eax, DWORD PTR _num_actuals$[ebp]
	lea	eax, DWORD PTR [eax+eax*4]
	shl	eax, 3
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _args$[ebp], eax
; Line 4192
	mov	eax, DWORD PTR _num_actuals$[ebp]
	lea	eax, DWORD PTR [eax+eax*4]
	shl	eax, 3
	push	eax
	push	0
	mov	eax, DWORD PTR _args$[ebp]
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 4194
	mov	DWORD PTR _args_size$[ebp], 0
; Line 4195
	mov	DWORD PTR _args_size$[ebp+4], 0
; Line 4200
	mov	eax, DWORD PTR _args_size$[ebp]
	mov	DWORD PTR _starting_args_size$[ebp], eax
; Line 4207
	mov	eax, DWORD PTR _num_actuals$[ebp]
	dec	eax
	mov	DWORD PTR _i$[ebp], eax
	mov	DWORD PTR _inc$[ebp], -1
; Line 4214
	mov	DWORD PTR _args_so_far$[ebp], 0
; Line 4217
	mov	eax, DWORD PTR _actparms$[ebp]
	mov	DWORD PTR _p$[ebp], eax
	mov	DWORD PTR _argpos$[ebp], 0
	jmp	$L2111
$L2112:
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _p$[ebp], eax
	mov	eax, DWORD PTR _inc$[ebp]
	add	DWORD PTR _i$[ebp], eax
	inc	DWORD PTR _argpos$[ebp]
$L2111:
	cmp	DWORD PTR _p$[ebp], 0
	je	$L2113
; Line 4219
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _type$2114[ebp], eax
; Line 4220
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	ecx, DWORD PTR _i$[ebp]
	lea	ecx, DWORD PTR [ecx+ecx*4]
	mov	edx, DWORD PTR _args$[ebp]
	mov	DWORD PTR [edx+ecx*8], eax
; Line 4221
	mov	eax, DWORD PTR _args_size$[ebp]
	mov	ecx, DWORD PTR _args_size$[ebp+4]
	mov	edx, DWORD PTR _i$[ebp]
	lea	edx, DWORD PTR [edx+edx*4]
	shl	edx, 3
	add	edx, DWORD PTR _args$[ebp]
	add	edx, 16					; 00000010H
	mov	DWORD PTR [edx], eax
	mov	DWORD PTR [edx+4], ecx
; Line 4224
	mov	eax, DWORD PTR _error_mark_node
	cmp	DWORD PTR _type$2114[ebp], eax
	je	$L2116
	mov	eax, DWORD PTR _type$2114[ebp]
	cmp	DWORD PTR [eax+28], 0
	jne	$L2115
$L2116:
; Line 4225
	jmp	$L2112
; Line 4232
$L2115:
; Line 4236
	mov	eax, DWORD PTR _type$2114[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L2117
	cmp	DWORD PTR _args_size$[ebp+4], 0
	jne	$L2117
	mov	eax, DWORD PTR _p$[ebp]
	mov	ecx, DWORD PTR _error_mark_node
	cmp	DWORD PTR [eax+20], ecx
	je	$L2117
; Line 4239
	test	BYTE PTR _target_flags, 16		; 00000010H
	je	$L2557
	cmp	DWORD PTR _args_so_far$[ebp], 8
	jge	$L2557
	mov	eax, DWORD PTR _args_so_far$[ebp]
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	push	eax
	mov	eax, DWORD PTR _type$2114[ebp]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	sar	eax, 24					; 00000018H
	push	eax
	push	34					; 00000022H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _i$[ebp]
	lea	ecx, DWORD PTR [ecx+ecx*4]
	mov	edx, DWORD PTR _args$[ebp]
	mov	DWORD PTR [edx+ecx*8+8], eax
	jmp	$L2558
$L2557:
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*4]
	mov	ecx, DWORD PTR _args$[ebp]
	mov	DWORD PTR [ecx+eax*8+8], 0
$L2558:
; Line 4275
	test	BYTE PTR _target_flags, 16		; 00000010H
	je	$L2559
	cmp	DWORD PTR _args_so_far$[ebp], 8
	jge	$L2559
	mov	eax, DWORD PTR _type$2114[ebp]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	and	eax, -16777216				; ff000000H
	mov	ecx, 436207616				; 1a000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L2561
	mov	eax, DWORD PTR _type$2114[ebp]
	push	eax
	call	_int_size_in_bytes
	add	esp, 4
	mov	DWORD PTR -240+[ebp], eax
	jmp	$L2562
$L2561:
	mov	eax, DWORD PTR _type$2114[ebp]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	mov	DWORD PTR -240+[ebp], eax
$L2562:
	mov	eax, DWORD PTR _args_so_far$[ebp]
	add	eax, DWORD PTR -240+[ebp]
	cmp	eax, 8
	jle	$L2559
	mov	ecx, 2
	mov	eax, DWORD PTR _args_so_far$[ebp]
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	sub	ecx, eax
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*4]
	mov	edx, DWORD PTR _args$[ebp]
	mov	DWORD PTR [edx+eax*8+12], ecx
	jmp	$L2560
$L2559:
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*4]
	mov	ecx, DWORD PTR _args$[ebp]
	mov	DWORD PTR [ecx+eax*8+12], 0
$L2560:
; Line 4281
$L2117:
; Line 4282
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*4]
	mov	ecx, DWORD PTR _args$[ebp]
	cmp	DWORD PTR [ecx+eax*8+8], 0
	je	$L2118
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*4]
	mov	ecx, DWORD PTR _args$[ebp]
	cmp	DWORD PTR [ecx+eax*8+12], 0
	jne	$L2118
	cmp	DWORD PTR _stack_count_regparms$[ebp], 0
	jne	$L2118
; Line 4285
	jmp	$L2119
$L2118:
	mov	eax, DWORD PTR _type$2114[ebp]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	and	eax, -16777216				; ff000000H
	mov	ecx, 436207616				; 1a000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L2120
; Line 4295
	cmp	DWORD PTR _stack_count_regparms$[ebp], 0
	je	$L2122
	cmp	DWORD PTR _args_size$[ebp], 0
	jge	$L2122
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*4]
	mov	ecx, DWORD PTR _args$[ebp]
	cmp	DWORD PTR [ecx+eax*8+8], 0
	jne	$L2122
; Line 4297
	mov	DWORD PTR _args_size$[ebp], 0
; Line 4298
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*4]
	mov	ecx, DWORD PTR _args$[ebp]
	mov	DWORD PTR [ecx+eax*8+16], 0
; Line 4300
$L2122:
	mov	eax, DWORD PTR _type$2114[ebp]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	mov	DWORD PTR _size$2121[ebp], eax
; Line 4305
	mov	eax, DWORD PTR _size$2121[ebp]
	inc	eax
	and	eax, -2					; fffffffeH
	mov	DWORD PTR _size$2121[ebp], eax
; Line 4309
	jmp	$L2123
; Line 4310
	mov	eax, DWORD PTR _size$2121[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	lea	ecx, DWORD PTR [ecx+ecx*4]
	mov	edx, DWORD PTR _args$[ebp]
	mov	DWORD PTR [edx+ecx*8+24], eax
; Line 4311
	jmp	$L2124
$L2123:
; Line 4315
	mov	eax, DWORD PTR _size$2121[ebp]
	add	eax, 3
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	shl	eax, 2
	mov	ecx, DWORD PTR _i$[ebp]
	lea	ecx, DWORD PTR [ecx+ecx*4]
	mov	edx, DWORD PTR _args$[ebp]
	mov	DWORD PTR [edx+ecx*8+24], eax
$L2124:
; Line 4317
	jmp	$L2125
$L2120:
; Line 4319
	mov	eax, DWORD PTR _type$2114[ebp]
	push	eax
	call	_size_in_bytes
	add	esp, 4
	mov	DWORD PTR _size$2126[ebp], eax
; Line 4327
	cmp	DWORD PTR _stack_count_regparms$[ebp], 0
	je	$L2127
	cmp	DWORD PTR _args_size$[ebp], 0
	jge	$L2127
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*4]
	mov	ecx, DWORD PTR _args$[ebp]
	cmp	DWORD PTR [ecx+eax*8+8], 0
	jne	$L2127
; Line 4329
	mov	DWORD PTR _args_size$[ebp], 0
; Line 4330
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*4]
	mov	ecx, DWORD PTR _args$[ebp]
	mov	DWORD PTR [ecx+eax*8+16], 0
; Line 4335
$L2127:
; Line 4340
	push	8
	push	32					; 00000020H
	push	32					; 00000020H
	push	8
	mov	eax, DWORD PTR _size$2126[ebp]
	push	eax
	call	_convert_units
	add	esp, 12					; 0000000cH
	push	eax
	call	_convert_units
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _size$2126[ebp], eax
; Line 4341
$L2128:
	mov	eax, DWORD PTR _size$2126[ebp]
	mov	DWORD PTR _inc$2129[ebp], eax
	mov	eax, DWORD PTR _inc$2129[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L2130
	mov	eax, DWORD PTR _inc$2129[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	ecx, DWORD PTR _i$[ebp]
	lea	ecx, DWORD PTR [ecx+ecx*4]
	mov	edx, DWORD PTR _args$[ebp]
	add	DWORD PTR [edx+ecx*8+24], eax
	jmp	$L2131
$L2130:
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*4]
	mov	ecx, DWORD PTR _args$[ebp]
	cmp	DWORD PTR [ecx+eax*8+28], 0
	jne	$L2132
	mov	eax, DWORD PTR _inc$2129[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	lea	ecx, DWORD PTR [ecx+ecx*4]
	mov	edx, DWORD PTR _args$[ebp]
	mov	DWORD PTR [edx+ecx*8+28], eax
	jmp	$L2133
$L2132:
	mov	eax, DWORD PTR _inc$2129[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*4]
	mov	ecx, DWORD PTR _args$[ebp]
	mov	eax, DWORD PTR [ecx+eax*8+28]
	push	eax
	push	64					; 00000040H
	call	_genop
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _i$[ebp]
	lea	ecx, DWORD PTR [ecx+ecx*4]
	mov	edx, DWORD PTR _args$[ebp]
	mov	DWORD PTR [edx+ecx*8+28], eax
$L2133:
$L2131:
; Line 4348
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 61					; 0000003dH
	je	$L2135
	mov	eax, DWORD PTR _type$2114[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 9
	test	al, 1
	je	$L2134
$L2135:
; Line 4350
	mov	eax, DWORD PTR _type$2114[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 9
	test	al, 1
	je	$L2136
; Line 4351
	mov	DWORD PTR _BLKmode_parms_forced$[ebp], 1
; Line 4353
$L2136:
	mov	eax, DWORD PTR _const0_rtx
	mov	ecx, DWORD PTR _i$[ebp]
	lea	ecx, DWORD PTR [ecx+ecx*4]
	mov	edx, DWORD PTR _args$[ebp]
	mov	DWORD PTR [edx+ecx*8+36], eax
; Line 4354
	mov	eax, DWORD PTR _size$2126[ebp]
	mov	eax, DWORD PTR [eax+20]
	add	DWORD PTR _BLKmode_parms_sizes$[ebp], eax
; Line 4367
$L2134:
$L2125:
$L2119:
; Line 4371
	cmp	DWORD PTR _stack_count_regparms$[ebp], 0
	jne	$L2137
; Line 4375
	sub	ecx, ecx
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*4]
	mov	edx, DWORD PTR _args$[ebp]
	mov	eax, DWORD PTR [edx+eax*8+12]
	shl	eax, 2
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	shl	eax, 2
	sub	ecx, eax
	neg	ecx
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*4]
	mov	edx, DWORD PTR _args$[ebp]
	sub	DWORD PTR [edx+eax*8+24], ecx
; Line 4379
$L2137:
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*4]
	mov	ecx, DWORD PTR _args$[ebp]
	mov	eax, DWORD PTR [ecx+eax*8+24]
	add	DWORD PTR _args_size$[ebp], eax
; Line 4380
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*4]
	mov	ecx, DWORD PTR _args$[ebp]
	cmp	DWORD PTR [ecx+eax*8+28], 0
	je	$L2138
; Line 4382
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*4]
	mov	ecx, DWORD PTR _args$[ebp]
	mov	eax, DWORD PTR [ecx+eax*8+28]
	mov	DWORD PTR _inc$2139[ebp], eax
	mov	eax, DWORD PTR _inc$2139[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L2140
	mov	eax, DWORD PTR _inc$2139[ebp]
	mov	eax, DWORD PTR [eax+20]
	add	DWORD PTR _args_size$[ebp], eax
	jmp	$L2141
$L2140:
	cmp	DWORD PTR _args_size$[ebp+4], 0
	jne	$L2142
	mov	eax, DWORD PTR _inc$2139[ebp]
	mov	DWORD PTR _args_size$[ebp+4], eax
	jmp	$L2143
$L2142:
	mov	eax, DWORD PTR _inc$2139[ebp]
	push	eax
	mov	eax, DWORD PTR _args_size$[ebp+4]
	push	eax
	push	64					; 00000040H
	call	_genop
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _args_size$[ebp+4], eax
$L2143:
$L2141:
; Line 4388
$L2138:
; Line 4389
	mov	eax, DWORD PTR _type$2114[ebp]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	and	eax, -16777216				; ff000000H
	mov	ecx, 436207616				; 1a000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L2563
	mov	eax, DWORD PTR _type$2114[ebp]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	and	eax, -12582913				; ff3fffffH
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	add	eax, 3
	and	eax, -4					; fffffffcH
	add	DWORD PTR _args_so_far$[ebp], eax
	jmp	$L2564
$L2563:
	mov	eax, DWORD PTR _type$2114[ebp]
	push	eax
	call	_int_size_in_bytes
	add	esp, 4
	add	eax, 3
	and	eax, -4					; fffffffcH
	add	DWORD PTR _args_so_far$[ebp], eax
$L2564:
; Line 4390
	jmp	$L2112
$L2113:
; Line 4394
	mov	DWORD PTR _must_preallocate$[ebp], 0
; Line 4396
	mov	DWORD PTR _partial_seen$2144[ebp], 0
; Line 4397
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L2145
$L2146:
	inc	DWORD PTR _i$[ebp]
$L2145:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _num_actuals$[ebp], eax
	jle	$L2147
; Line 4399
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*4]
	mov	ecx, DWORD PTR _args$[ebp]
	cmp	DWORD PTR [ecx+eax*8+12], 0
	jle	$L2148
; Line 4400
	mov	DWORD PTR _partial_seen$2144[ebp], 1
; Line 4401
	jmp	$L2149
$L2148:
	cmp	DWORD PTR _partial_seen$2144[ebp], 0
	je	$L2150
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*4]
	mov	ecx, DWORD PTR _args$[ebp]
	cmp	DWORD PTR [ecx+eax*8+8], 0
	jne	$L2150
; Line 4402
	mov	DWORD PTR _must_preallocate$[ebp], 1
; Line 4403
$L2150:
$L2149:
	jmp	$L2146
$L2147:
; Line 4410
	mov	DWORD PTR _reg_parm_seen$[ebp], 0
; Line 4411
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L2151
$L2152:
	inc	DWORD PTR _i$[ebp]
$L2151:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _num_actuals$[ebp], eax
	jle	$L2153
; Line 4412
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*4]
	mov	ecx, DWORD PTR _args$[ebp]
	cmp	DWORD PTR [ecx+eax*8+8], 0
	jne	$L2155
	cmp	DWORD PTR _is_const$[ebp], 0
	je	$L2154
$L2155:
; Line 4415
	mov	DWORD PTR _struct_value_lossage$2157[ebp], 0
; Line 4421
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*4]
	mov	ecx, DWORD PTR _args$[ebp]
	mov	eax, DWORD PTR [ecx+eax*8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	and	eax, -16777216				; ff000000H
	mov	ecx, 436207616				; 1a000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L2159
	jmp	$L2158
$L2159:
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*4]
	mov	ecx, DWORD PTR _args$[ebp]
	mov	eax, DWORD PTR [ecx+eax*8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 61					; 0000003dH
	jne	$L2158
; Line 4422
	mov	eax, DWORD PTR _i$[ebp]
	inc	eax
	mov	DWORD PTR _j$2156[ebp], eax
	jmp	$L2160
$L2161:
	inc	DWORD PTR _j$2156[ebp]
$L2160:
	mov	eax, DWORD PTR _j$2156[ebp]
	cmp	DWORD PTR _num_actuals$[ebp], eax
	jle	$L2162
; Line 4426
	mov	eax, DWORD PTR _j$2156[ebp]
	lea	eax, DWORD PTR [eax+eax*4]
	mov	ecx, DWORD PTR _args$[ebp]
	mov	eax, DWORD PTR [ecx+eax*8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	and	eax, -16777216				; ff000000H
	mov	ecx, 436207616				; 1a000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L2166
	jmp	$L2165
$L2166:
	mov	eax, DWORD PTR _j$2156[ebp]
	lea	eax, DWORD PTR [eax+eax*4]
	mov	ecx, DWORD PTR _args$[ebp]
	mov	eax, DWORD PTR [ecx+eax*8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 61					; 0000003dH
	jne	$L2165
	mov	eax, DWORD PTR _j$2156[ebp]
	lea	eax, DWORD PTR [eax+eax*4]
	mov	ecx, DWORD PTR _args$[ebp]
	cmp	DWORD PTR [ecx+eax*8+8], 0
	jne	$L2164
$L2165:
	cmp	DWORD PTR _is_const$[ebp], 0
	je	$L2163
$L2164:
; Line 4432
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*4]
	mov	ecx, DWORD PTR _args$[ebp]
	mov	eax, DWORD PTR [ecx+eax*8]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_int_size_in_bytes
	add	esp, 4
	mov	DWORD PTR _size$2167[ebp], eax
; Line 4433
	mov	eax, DWORD PTR _size$2167[ebp]
	push	eax
	push	26					; 0000001aH
	call	_assign_stack_local
	add	esp, 8
	mov	DWORD PTR _structval$2168[ebp], eax
; Line 4435
	push	0
	push	0
	mov	eax, DWORD PTR _structval$2168[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*4]
	mov	ecx, DWORD PTR _args$[ebp]
	mov	eax, DWORD PTR [ecx+eax*8]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	mov	ecx, DWORD PTR _i$[ebp]
	lea	ecx, DWORD PTR [ecx+ecx*4]
	mov	edx, DWORD PTR _args$[ebp]
	mov	DWORD PTR [edx+ecx*8+4], eax
; Line 4436
	mov	DWORD PTR _struct_value_lossage$2157[ebp], 1
; Line 4437
	jmp	$L2162
; Line 4439
$L2163:
	jmp	$L2161
$L2162:
$L2158:
	cmp	DWORD PTR _struct_value_lossage$2157[ebp], 0
	jne	$L2169
; Line 4440
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*4]
	mov	ecx, DWORD PTR _args$[ebp]
	mov	eax, DWORD PTR [ecx+eax*8]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	mov	ecx, DWORD PTR _i$[ebp]
	lea	ecx, DWORD PTR [ecx+ecx*4]
	mov	edx, DWORD PTR _args$[ebp]
	mov	DWORD PTR [edx+ecx*8+4], eax
; Line 4442
$L2169:
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*4]
	mov	ecx, DWORD PTR _args$[ebp]
	cmp	DWORD PTR [ecx+eax*8+8], 0
	je	$L2170
; Line 4443
	mov	DWORD PTR _reg_parm_seen$[ebp], 1
; Line 4445
$L2170:
; Line 4447
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*4]
	mov	ecx, DWORD PTR _args$[ebp]
	mov	eax, DWORD PTR [ecx+eax*8+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L2171
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*4]
	mov	ecx, DWORD PTR _args$[ebp]
	mov	eax, DWORD PTR [ecx+eax*8+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L2171
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*4]
	mov	ecx, DWORD PTR _args$[ebp]
	mov	eax, DWORD PTR [ecx+eax*8+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L2171
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*4]
	mov	ecx, DWORD PTR _args$[ebp]
	mov	eax, DWORD PTR [ecx+eax*8+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L2171
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*4]
	mov	ecx, DWORD PTR _args$[ebp]
	mov	eax, DWORD PTR [ecx+eax*8+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L2171
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*4]
	mov	ecx, DWORD PTR _args$[ebp]
	mov	eax, DWORD PTR [ecx+eax*8+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2031616				; 001f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L2171
; Line 4450
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*4]
	mov	ecx, DWORD PTR _args$[ebp]
	mov	eax, DWORD PTR [ecx+eax*8+4]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*4]
	mov	ecx, DWORD PTR _args$[ebp]
	mov	eax, DWORD PTR [ecx+eax*8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	sar	eax, 24					; 00000018H
	push	eax
	call	_force_reg
	add	esp, 8
	mov	ecx, DWORD PTR _i$[ebp]
	lea	ecx, DWORD PTR [ecx+ecx*4]
	mov	edx, DWORD PTR _args$[ebp]
	mov	DWORD PTR [edx+ecx*8+4], eax
; Line 4453
$L2171:
	call	_emit_queue
; Line 4457
$L2154:
	jmp	$L2152
$L2153:
	cmp	DWORD PTR _fndecl$[ebp], 0
	je	$L2172
	cmp	DWORD PTR _is_const$[ebp], 0
	je	$L2172
; Line 4460
	mov	eax, DWORD PTR _fndecl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _funexp$[ebp], eax
; Line 4474
$L2172:
	call	_get_last_insn
	mov	DWORD PTR _insn_before$[ebp], eax
; Line 4485
	cmp	DWORD PTR _args_size$[ebp+4], 0
	je	$L2173
; Line 4487
	mov	eax, DWORD PTR _stack_pointer_rtx
	push	eax
	push	4
	call	_copy_to_mode_reg
	add	esp, 8
	mov	DWORD PTR _old_stack_level$[ebp], eax
; Line 4488
	mov	eax, DWORD PTR _pending_stack_adjust
	mov	DWORD PTR _old_pending_adj$[ebp], eax
; Line 4489
	cmp	DWORD PTR _args_size$[ebp+4], 0
	jne	$L2565
	mov	eax, DWORD PTR _args_size$[ebp]
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR -244+[ebp], eax
	jmp	$L2566
$L2565:
	mov	eax, DWORD PTR _args_size$[ebp]
	push	eax
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _args_size$[ebp+4]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	push	eax
	call	_plus_constant
	add	esp, 8
	mov	DWORD PTR -244+[ebp], eax
$L2566:
	push	0
	mov	eax, DWORD PTR -244+[ebp]
	push	eax
	call	_round_push
	add	esp, 4
	push	eax
	call	_push_block
	add	esp, 8
	mov	DWORD PTR _argblock$[ebp], eax
; Line 4491
	jmp	$L2174
$L2173:
	cmp	DWORD PTR _args_size$[ebp], 0
	jle	$L2175
; Line 4493
	mov	eax, DWORD PTR _args_size$[ebp]
	mov	DWORD PTR _needed$2176[ebp], eax
; Line 4496
	mov	eax, DWORD PTR _needed$2176[ebp]
	add	eax, 3
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	shl	eax, 2
	mov	DWORD PTR _needed$2176[ebp], eax
; Line 4497
	mov	eax, DWORD PTR _needed$2176[ebp]
	sub	eax, DWORD PTR _args_size$[ebp]
	mov	DWORD PTR _stack_align$[ebp], eax
; Line 4499
	mov	eax, DWORD PTR _needed$2176[ebp]
	mov	DWORD PTR _args_size$[ebp], eax
; Line 4508
	cmp	DWORD PTR _must_preallocate$[ebp], 0
	jne	$L2178
	cmp	DWORD PTR _BLKmode_parms_forced$[ebp], 0
	jne	$L2178
	mov	eax, DWORD PTR _args_size$[ebp]
	sar	eax, 1
	cmp	eax, DWORD PTR _BLKmode_parms_sizes$[ebp]
	jge	$L2177
$L2178:
; Line 4510
	cmp	DWORD PTR _inhibit_defer_pop, 0
	jne	$L2179
; Line 4514
	mov	eax, DWORD PTR _pending_stack_adjust
	cmp	DWORD PTR _needed$2176[ebp], eax
	jle	$L2180
; Line 4516
	sub	eax, eax
	sub	eax, DWORD PTR _pending_stack_adjust
	neg	eax
	sub	DWORD PTR _needed$2176[ebp], eax
; Line 4517
	mov	DWORD PTR _pending_stack_adjust, 0
; Line 4519
	jmp	$L2181
$L2180:
; Line 4521
	sub	eax, eax
	sub	eax, DWORD PTR _needed$2176[ebp]
	neg	eax
	sub	DWORD PTR _pending_stack_adjust, eax
; Line 4522
	mov	DWORD PTR _needed$2176[ebp], 0
; Line 4523
$L2181:
; Line 4525
$L2179:
	push	0
	mov	eax, DWORD PTR _needed$2176[ebp]
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	call	_push_block
	add	esp, 8
	mov	DWORD PTR _argblock$[ebp], eax
; Line 4527
$L2177:
; Line 4548
$L2175:
$L2174:
	cmp	DWORD PTR _argblock$[ebp], 0
	je	$L2182
; Line 4549
	inc	DWORD PTR _inhibit_defer_pop
; Line 4556
$L2182:
	cmp	DWORD PTR _BLKmode_parms_first_offset$[ebp], 0
	jge	$L2183
	cmp	DWORD PTR _argblock$[ebp], 0
	je	$L2183
; Line 4558
	mov	eax, DWORD PTR _BLKmode_parms_first_offset$[ebp]
	neg	eax
	mov	DWORD PTR _needed$2184[ebp], eax
; Line 4559
	mov	eax, DWORD PTR _argblock$[ebp]
	push	eax
	call	_copy_to_reg
	add	esp, 4
	mov	DWORD PTR _argblock$[ebp], eax
; Line 4562
	mov	eax, DWORD PTR _needed$2184[ebp]
	add	eax, 3
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	shl	eax, 2
	mov	DWORD PTR _needed$2184[ebp], eax
; Line 4564
	mov	eax, DWORD PTR _needed$2184[ebp]
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _protected_stack$[ebp], eax
; Line 4565
	mov	eax, DWORD PTR _protected_stack$[ebp]
	push	eax
	call	_anti_adjust_stack
	add	esp, 4
; Line 4573
$L2183:
	cmp	DWORD PTR _argblock$[ebp], 0
	jne	$L2185
	cmp	DWORD PTR _stack_align$[ebp], 0
	jle	$L2185
; Line 4574
	mov	eax, DWORD PTR _stack_align$[ebp]
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	call	_anti_adjust_stack
	add	esp, 4
; Line 4579
$L2185:
	cmp	DWORD PTR _fndecl$[ebp], 0
	je	$L2186
; Line 4581
	mov	eax, DWORD PTR _fndecl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _funexp$[ebp], eax
; Line 4582
	jmp	$L2187
$L2186:
; Line 4585
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	mov	DWORD PTR _funexp$[ebp], eax
; Line 4586
	call	_emit_queue
; Line 4587
$L2187:
; Line 4595
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L2188
$L2189:
	inc	DWORD PTR _i$[ebp]
$L2188:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _num_actuals$[ebp], eax
	jle	$L2190
; Line 4599
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*4]
	mov	ecx, DWORD PTR _args$[ebp]
	cmp	DWORD PTR [ecx+eax*8+36], 0
	je	$L2191
	cmp	DWORD PTR _argblock$[ebp], 0
	je	$L2191
; Line 4602
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*4]
	mov	ecx, DWORD PTR _args$[ebp]
	cmp	DWORD PTR [ecx+eax*8+28], 0
	jne	$L2567
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*4]
	mov	ecx, DWORD PTR _args$[ebp]
	mov	eax, DWORD PTR [ecx+eax*8+24]
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR -248+[ebp], eax
	jmp	$L2568
$L2567:
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*4]
	mov	ecx, DWORD PTR _args$[ebp]
	mov	eax, DWORD PTR [ecx+eax*8+24]
	push	eax
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*4]
	mov	ecx, DWORD PTR _args$[ebp]
	mov	eax, DWORD PTR [ecx+eax*8+28]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	push	eax
	call	_plus_constant
	add	esp, 8
	mov	DWORD PTR -248+[ebp], eax
$L2568:
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*4]
	shl	eax, 3
	add	eax, DWORD PTR _args$[ebp]
	add	eax, 16					; 00000010H
	mov	ecx, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	ecx
	mov	eax, DWORD PTR _argblock$[ebp]
	push	eax
	mov	eax, DWORD PTR -248+[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*4]
	mov	ecx, DWORD PTR _args$[ebp]
	mov	eax, DWORD PTR [ecx+eax*8]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_target_for_arg
	add	esp, 20					; 00000014H
	mov	ecx, DWORD PTR _i$[ebp]
	lea	ecx, DWORD PTR [ecx+ecx*4]
	mov	edx, DWORD PTR _args$[ebp]
	mov	DWORD PTR [edx+ecx*8+36], eax
; Line 4603
	jmp	$L2192
$L2191:
; Line 4604
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*4]
	mov	ecx, DWORD PTR _args$[ebp]
	mov	DWORD PTR [ecx+eax*8+36], 0
$L2192:
; Line 4607
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*4]
	mov	ecx, DWORD PTR _args$[ebp]
	cmp	DWORD PTR [ecx+eax*8+8], 0
	jne	$L2193
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*4]
	mov	ecx, DWORD PTR _args$[ebp]
	mov	eax, DWORD PTR [ecx+eax*8]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+28], 0
	je	$L2193
; Line 4608
	mov	eax, DWORD PTR _may_be_alloca$[ebp]
	push	eax
	mov	eax, DWORD PTR _argblock$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*4]
	shl	eax, 3
	add	eax, DWORD PTR _args$[ebp]
	push	eax
	call	_store_one_arg
	add	esp, 12					; 0000000cH
; Line 4609
$L2193:
	jmp	$L2189
$L2190:
; Line 4613
	cmp	DWORD PTR _reg_parm_seen$[ebp], 0
	je	$L2194
; Line 4614
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L2195
$L2196:
	inc	DWORD PTR _i$[ebp]
$L2195:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _num_actuals$[ebp], eax
	jle	$L2197
; Line 4615
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*4]
	mov	ecx, DWORD PTR _args$[ebp]
	cmp	DWORD PTR [ecx+eax*8+12], 0
	je	$L2198
; Line 4616
	mov	eax, DWORD PTR _may_be_alloca$[ebp]
	push	eax
	mov	eax, DWORD PTR _argblock$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*4]
	shl	eax, 3
	add	eax, DWORD PTR _args$[ebp]
	push	eax
	call	_store_one_arg
	add	esp, 12					; 0000000cH
; Line 4618
$L2198:
	jmp	$L2196
$L2197:
$L2194:
	cmp	DWORD PTR _protected_stack$[ebp], 0
	je	$L2199
; Line 4619
	mov	eax, DWORD PTR _protected_stack$[ebp]
	push	eax
	call	_adjust_stack
	add	esp, 4
; Line 4634
$L2199:
	cmp	DWORD PTR _structure_value_addr$[ebp], 0
	je	$L2200
	cmp	DWORD PTR _structure_value_addr_parm$[ebp], 0
	jne	$L2200
; Line 4636
	push	0
	mov	eax, DWORD PTR _structure_value_addr$[ebp]
	push	eax
	call	_force_operand
	add	esp, 8
	push	eax
	push	4
	call	_force_reg
	add	esp, 8
	push	eax
	mov	eax, DWORD PTR _struct_value_rtx
	push	eax
	call	_emit_move_insn
	add	esp, 8
; Line 4639
$L2200:
	cmp	DWORD PTR _reg_parm_seen$[ebp], 0
	je	$L2201
; Line 4640
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L2202
$L2203:
	inc	DWORD PTR _i$[ebp]
$L2202:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _num_actuals$[ebp], eax
	jle	$L2204
; Line 4641
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*4]
	mov	ecx, DWORD PTR _args$[ebp]
	cmp	DWORD PTR [ecx+eax*8+8], 0
	je	$L2205
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*4]
	mov	ecx, DWORD PTR _args$[ebp]
	cmp	DWORD PTR [ecx+eax*8+12], 0
	jne	$L2205
; Line 4642
	mov	eax, DWORD PTR _may_be_alloca$[ebp]
	push	eax
	mov	eax, DWORD PTR _argblock$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*4]
	shl	eax, 3
	add	eax, DWORD PTR _args$[ebp]
	push	eax
	call	_store_one_arg
	add	esp, 12					; 0000000cH
; Line 4645
$L2205:
	jmp	$L2203
$L2204:
$L2201:
	call	_emit_queue
; Line 4650
	push	0
	mov	eax, DWORD PTR _funexp$[ebp]
	push	eax
	call	_prepare_call_address
	add	esp, 8
	mov	DWORD PTR _funexp$[ebp], eax
; Line 4653
	call	_start_sequence
; Line 4654
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L2206
$L2207:
	inc	DWORD PTR _i$[ebp]
$L2206:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _num_actuals$[ebp], eax
	jle	$L2208
; Line 4655
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*4]
	mov	ecx, DWORD PTR _args$[ebp]
	cmp	DWORD PTR [ecx+eax*8+8], 0
	je	$L2209
; Line 4657
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*4]
	mov	ecx, DWORD PTR _args$[ebp]
	cmp	DWORD PTR [ecx+eax*8+12], 0
	jle	$L2210
; Line 4658
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*4]
	mov	ecx, DWORD PTR _args$[ebp]
	mov	eax, DWORD PTR [ecx+eax*8+12]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*4]
	mov	ecx, DWORD PTR _args$[ebp]
	mov	eax, DWORD PTR [ecx+eax*8+8]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_use_regs
	add	esp, 8
; Line 4659
	jmp	$L2211
$L2210:
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*4]
	mov	ecx, DWORD PTR _args$[ebp]
	mov	eax, DWORD PTR [ecx+eax*8+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 436207616				; 1a000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L2212
; Line 4663
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*4]
	mov	ecx, DWORD PTR _args$[ebp]
	mov	eax, DWORD PTR [ecx+eax*8]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_int_size_in_bytes
	add	esp, 4
	add	eax, 3
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*4]
	mov	ecx, DWORD PTR _args$[ebp]
	mov	eax, DWORD PTR [ecx+eax*8+8]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_use_regs
	add	esp, 8
; Line 4664
	jmp	$L2213
$L2212:
; Line 4665
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*4]
	mov	ecx, DWORD PTR _args$[ebp]
	mov	eax, DWORD PTR [ecx+eax*8+8]
	push	eax
	push	0
	push	26					; 0000001aH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	call	_emit_insn
	add	esp, 4
$L2213:
$L2211:
; Line 4668
$L2209:
	jmp	$L2207
$L2208:
; Line 4669
	cmp	DWORD PTR _structure_value_addr$[ebp], 0
	je	$L2214
	cmp	DWORD PTR _structure_value_addr_parm$[ebp], 0
	jne	$L2214
	mov	eax, DWORD PTR _struct_value_rtx
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2214
; Line 4670
	mov	eax, DWORD PTR _struct_value_rtx
	push	eax
	push	0
	push	26					; 0000001aH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	call	_emit_insn
	add	esp, 4
; Line 4672
$L2214:
	call	_gen_sequence
	mov	DWORD PTR _use_insns$[ebp], eax
; Line 4673
	call	_end_sequence
; Line 4676
	mov	DWORD PTR _valreg$[ebp], 0
; Line 4678
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	and	eax, -16777216				; ff000000H
	sub	ecx, ecx
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L2215
	cmp	DWORD PTR _structure_value_addr$[ebp], 0
	jne	$L2215
; Line 4680
	cmp	DWORD PTR _pcc_struct_value$[ebp], 0
	je	$L2216
; Line 4681
	push	4
	call	_hard_libcall_value
	add	esp, 4
	mov	DWORD PTR _valreg$[ebp], eax
; Line 4682
	jmp	$L2217
$L2216:
; Line 4683
	mov	eax, DWORD PTR _fndecl$[ebp]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_hard_function_value
	add	esp, 8
	mov	DWORD PTR _valreg$[ebp], eax
$L2217:
; Line 4689
$L2215:
	cmp	DWORD PTR _args_size$[ebp], 0
	jge	$L2218
; Line 4690
	mov	DWORD PTR _args_size$[ebp], 0
; Line 4691
$L2218:
; Line 4693
	test	BYTE PTR _target_flags, 16		; 00000010H
	je	$L2569
	cmp	DWORD PTR _args_so_far$[ebp], 8
	jge	$L2569
	mov	eax, DWORD PTR _args_so_far$[ebp]
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	push	eax
	push	0
	push	34					; 00000022H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR -252+[ebp], eax
	jmp	$L2570
$L2569:
	mov	DWORD PTR -252+[ebp], 0
$L2570:
	mov	eax, DWORD PTR _use_insns$[ebp]
	push	eax
	mov	eax, DWORD PTR _old_inhibit_defer_pop$[ebp]
	push	eax
	mov	eax, DWORD PTR _valreg$[ebp]
	push	eax
	mov	eax, DWORD PTR -252+[ebp]
	push	eax
	mov	eax, DWORD PTR _args_size$[ebp]
	push	eax
	mov	eax, DWORD PTR _funtype$[ebp]
	push	eax
	mov	eax, DWORD PTR _funexp$[ebp]
	push	eax
	call	_emit_call_1
	add	esp, 28					; 0000001cH
; Line 4701
	cmp	DWORD PTR _is_setjmp$[ebp], 0
	je	$L2219
; Line 4703
	push	-7					; fffffff9H
	mov	eax, DWORD PTR _fndecl$[ebp]
	mov	eax, DWORD PTR [eax+40]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_emit_note
	add	esp, 8
; Line 4704
	mov	DWORD PTR _current_function_calls_setjmp, 1
; Line 4712
$L2219:
	cmp	DWORD PTR _fndecl$[ebp], 0
	je	$L2220
	mov	eax, DWORD PTR _fndecl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 11					; 0000000bH
	test	al, 1
	je	$L2220
; Line 4713
	call	_emit_barrier
; Line 4716
$L2220:
	cmp	DWORD PTR _is_const$[ebp], 0
	je	$L2221
; Line 4717
	call	_do_pending_stack_adjust
; Line 4730
$L2221:
; Line 4732
	mov	eax, DWORD PTR _old_cleanups$[ebp]
	cmp	DWORD PTR _cleanups_of_this_call$S1060, eax
	je	$L2222
	cmp	DWORD PTR _target$[ebp], 0
	je	$L2222
	mov	eax, DWORD PTR _target$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2222
	mov	eax, DWORD PTR _target$[ebp]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jge	$L2222
; Line 4733
	mov	DWORD PTR _target$[ebp], 0
; Line 4735
$L2222:
	mov	DWORD PTR _result_copy_insn$[ebp], 0
; Line 4738
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	and	eax, -16777216				; ff000000H
	sub	ecx, ecx
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L2224
	cmp	DWORD PTR _ignore$[ebp], 0
	je	$L2223
$L2224:
; Line 4740
	mov	eax, DWORD PTR _const0_rtx
	mov	DWORD PTR _target$[ebp], eax
; Line 4742
	jmp	$L2225
$L2223:
	cmp	DWORD PTR _structure_value_addr$[ebp], 0
	je	$L2226
; Line 4744
	cmp	DWORD PTR _target$[ebp], 0
	je	$L2228
	mov	eax, DWORD PTR _target$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L2227
$L2228:
; Line 4746
	mov	eax, DWORD PTR _structure_value_addr$[ebp]
	push	eax
	push	26					; 0000001aH
	call	_memory_address
	add	esp, 8
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
	mov	DWORD PTR _target$[ebp], eax
; Line 4747
$L2227:
; Line 4748
	jmp	$L2229
$L2226:
	cmp	DWORD PTR _pcc_struct_value$[ebp], 0
	je	$L2230
; Line 4751
	mov	eax, DWORD PTR _fndecl$[ebp]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_build_pointer_type
	add	esp, 4
	push	eax
	call	_hard_function_value
	add	esp, 8
	mov	DWORD PTR _valreg$[ebp], eax
; Line 4752
	cmp	DWORD PTR _target$[ebp], 0
	jne	$L2231
; Line 4754
	mov	eax, DWORD PTR _valreg$[ebp]
	push	eax
	call	_copy_to_reg
	add	esp, 4
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
	mov	DWORD PTR _target$[ebp], eax
; Line 4755
	jmp	$L2232
$L2231:
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	and	eax, -16777216				; ff000000H
	mov	ecx, 436207616				; 1a000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L2233
; Line 4758
	mov	eax, DWORD PTR _valreg$[ebp]
	push	eax
	call	_copy_to_reg
	add	esp, 4
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
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	call	_emit_move_insn
	add	esp, 8
	mov	DWORD PTR _result_copy_insn$[ebp], eax
; Line 4759
	jmp	$L2234
$L2233:
; Line 4767
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+37]
	and	eax, 255				; 000000ffH
	sar	eax, 3
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	push	eax
	call	_expr_size
	add	esp, 4
	push	eax
	push	0
	push	0
	mov	eax, DWORD PTR _valreg$[ebp]
	push	eax
	call	_copy_to_reg
	add	esp, 4
	push	eax
	push	26					; 0000001aH
	push	37					; 00000025H
	call	_gen_rtx
	add	esp, 20					; 00000014H
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	call	_emit_block_move
	add	esp, 16					; 00000010H
$L2234:
$L2232:
; Line 4770
	jmp	$L2235
$L2230:
	cmp	DWORD PTR _target$[ebp], 0
	je	$L2236
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	and	eax, -16777216				; ff000000H
	mov	ecx, DWORD PTR _target$[ebp]
	mov	ecx, DWORD PTR [ecx]
	shl	ecx, 8
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L2236
; Line 4772
	mov	eax, DWORD PTR _target$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L2237
	cmp	DWORD PTR _cse_not_expected, 0
	jne	$L2237
; Line 4773
	mov	eax, DWORD PTR _valreg$[ebp]
	push	eax
	call	_copy_to_reg
	add	esp, 4
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	call	_emit_move_insn
	add	esp, 8
	mov	DWORD PTR _result_copy_insn$[ebp], eax
; Line 4774
	jmp	$L2238
$L2237:
	mov	eax, DWORD PTR _valreg$[ebp]
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	call	_rtx_equal_p
	add	esp, 8
	or	eax, eax
	jne	$L2239
; Line 4775
	mov	eax, DWORD PTR _valreg$[ebp]
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	call	_emit_move_insn
	add	esp, 8
	mov	DWORD PTR _result_copy_insn$[ebp], eax
; Line 4776
	jmp	$L2240
$L2239:
; Line 4778
	mov	eax, DWORD PTR _valreg$[ebp]
	push	eax
	push	0
	push	26					; 0000001aH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	call	_emit_insn
	add	esp, 4
$L2240:
$L2238:
; Line 4780
	jmp	$L2241
$L2236:
; Line 4782
	mov	eax, DWORD PTR _valreg$[ebp]
	push	eax
	call	_copy_to_reg
	add	esp, 4
	mov	DWORD PTR _target$[ebp], eax
; Line 4783
	call	_get_last_insn
	mov	DWORD PTR _result_copy_insn$[ebp], eax
; Line 4784
$L2241:
$L2235:
$L2229:
$L2225:
; Line 4788
$L2243:
	mov	eax, DWORD PTR _old_cleanups$[ebp]
	cmp	DWORD PTR _cleanups_of_this_call$S1060, eax
	je	$L2244
; Line 4790
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _cleanups_of_this_call$S1060
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
; Line 4791
	mov	eax, DWORD PTR _cleanups_of_this_call$S1060
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _cleanups_of_this_call$S1060, eax
; Line 4792
	jmp	$L2243
$L2244:
; Line 4795
	cmp	DWORD PTR _saved_structure_value_addr$[ebp], 0
	je	$L2245
; Line 4797
	mov	eax, DWORD PTR _saved_structure_value_size$[ebp]
	push	eax
	mov	eax, DWORD PTR _saved_structure_value_addr$[ebp]
	push	eax
	call	_pop_structure_value
	add	esp, 8
; Line 4801
$L2245:
	cmp	DWORD PTR _old_stack_level$[ebp], 0
	je	$L2247
; Line 4803
	mov	eax, DWORD PTR _old_stack_level$[ebp]
	push	eax
	mov	eax, DWORD PTR _stack_pointer_rtx
	push	eax
	call	_emit_move_insn
	add	esp, 8
; Line 4804
	mov	eax, DWORD PTR _old_pending_adj$[ebp]
	mov	DWORD PTR _pending_stack_adjust, eax
; Line 4808
$L2247:
	cmp	DWORD PTR _is_const$[ebp], 0
	je	$L2248
; Line 4810
	mov	eax, DWORD PTR _insn_before$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _insn_first$2249[ebp], eax
; Line 4811
	call	_get_last_insn
	mov	DWORD PTR _insn_last$2250[ebp], eax
; Line 4812
	mov	DWORD PTR _note$2251[ebp], 0
; Line 4821
	mov	eax, DWORD PTR _insn_first$2249[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 851968				; 000d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L2253
	mov	eax, DWORD PTR _insn_first$2249[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 983040				; 000f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L2253
	mov	eax, DWORD PTR _insn_first$2249[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 917504				; 000e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2252
$L2253:
	mov	eax, DWORD PTR _insn_last$2250[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 851968				; 000d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L2254
	mov	eax, DWORD PTR _insn_last$2250[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 983040				; 000f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L2254
	mov	eax, DWORD PTR _insn_last$2250[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 917504				; 000e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2252
$L2254:
	mov	eax, DWORD PTR _result_copy_insn$[ebp]
	cmp	DWORD PTR _insn_last$2250[ebp], eax
	jne	$L2252
; Line 4826
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L2255
$L2256:
	inc	DWORD PTR _i$[ebp]
$L2255:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _num_actuals$[ebp], eax
	jle	$L2257
; Line 4827
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*4]
	mov	ecx, DWORD PTR _args$[ebp]
	cmp	DWORD PTR [ecx+eax*8+8], 0
	jne	$L2259
	cmp	DWORD PTR _is_const$[ebp], 0
	je	$L2258
$L2259:
; Line 4828
	mov	eax, DWORD PTR _note$2251[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*4]
	mov	ecx, DWORD PTR _args$[ebp]
	mov	eax, DWORD PTR [ecx+eax*8+4]
	push	eax
	push	0
	push	2
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	DWORD PTR _note$2251[ebp], eax
; Line 4829
$L2258:
	jmp	$L2256
$L2257:
; Line 4830
	mov	eax, DWORD PTR _note$2251[ebp]
	push	eax
	mov	eax, DWORD PTR _fndecl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	0
	push	2
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	DWORD PTR _note$2251[ebp], eax
; Line 4835
	mov	eax, DWORD PTR _insn_last$2250[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	mov	eax, DWORD PTR _insn_first$2249[ebp]
	push	eax
	push	6
	push	3
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _note$2251[ebp]
	push	eax
	push	5
	push	2
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	ecx, DWORD PTR _insn_last$2250[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 4838
	mov	eax, DWORD PTR _insn_first$2249[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	mov	eax, DWORD PTR _insn_last$2250[ebp]
	push	eax
	push	7
	push	3
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	ecx, DWORD PTR _insn_first$2249[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 4840
$L2252:
; Line 4842
$L2248:
	mov	eax, DWORD PTR _target$[ebp]
	jmp	$L2032
; Line 4843
$L2032:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_expand_call ENDP
_args_addr$ = 16
_offset$ = 20
_target$ = -4
_offset_rtx$ = -8
_target_for_arg PROC NEAR
; Line 4860
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 4862
	cmp	DWORD PTR _offset$[ebp+4], 0
	jne	$L2571
	mov	eax, DWORD PTR _offset$[ebp]
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _offset_rtx$[ebp], eax
	jmp	$L2572
$L2571:
	mov	eax, DWORD PTR _offset$[ebp]
	push	eax
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _offset$[ebp+4]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	push	eax
	call	_plus_constant
	add	esp, 8
	mov	DWORD PTR _offset_rtx$[ebp], eax
$L2572:
; Line 4868
	mov	eax, DWORD PTR _offset_rtx$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2267
; Line 4869
	mov	eax, DWORD PTR _offset_rtx$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _args_addr$[ebp]
	push	eax
	call	_plus_constant
	add	esp, 8
	mov	DWORD PTR _target$[ebp], eax
; Line 4870
	jmp	$L2268
$L2267:
; Line 4874
	mov	eax, DWORD PTR _offset_rtx$[ebp]
	push	eax
	mov	eax, DWORD PTR _args_addr$[ebp]
	push	eax
	push	4
	push	44					; 0000002cH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	DWORD PTR _target$[ebp], eax
; Line 4875
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	push	1
	call	_memory_address
	add	esp, 8
	mov	DWORD PTR _target$[ebp], eax
; Line 4876
$L2268:
; Line 4878
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	push	26					; 0000001aH
	push	37					; 00000025H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	jmp	$L2264
; Line 4879
$L2264:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_target_for_arg ENDP
_dec$2304 = -56
_tem$2317 = -60
_excess$2318 = -68
_size_rtx$2319 = -64
_size$2322 = -72
_arg$ = 8
_argblock$ = 12
_may_be_alloca$ = 16
_pval$ = -8
_used$ = -4
_size$2284 = -16
_tem$2285 = -12
_sizetree$2291 = -24
_s1$2292 = -20
_s2$2293 = -32
_where_pad$2294 = -28
_offset_rtx$2296 = -48
_address$2297 = -44
_stack_offset$2298 = -40
_inc$2299 = -52
_store_one_arg PROC NEAR
; Line 4894
	push	ebp
	mov	ebp, esp
	sub	esp, 84					; 00000054H
	push	ebx
	push	esi
	push	edi
; Line 4895
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _pval$[ebp], eax
; Line 4896
	mov	DWORD PTR _used$[ebp], 0
; Line 4898
	mov	eax, DWORD PTR _pval$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	or	eax, eax
	jne	$L2275
; Line 4899
	jmp	$L2272
; Line 4901
$L2275:
	mov	eax, DWORD PTR _arg$[ebp]
	cmp	DWORD PTR [eax+8], 0
	je	$L2276
	mov	eax, DWORD PTR _arg$[ebp]
	cmp	DWORD PTR [eax+12], 0
	jne	$L2276
; Line 4904
	mov	eax, DWORD PTR _arg$[ebp]
	cmp	DWORD PTR [eax+4], 0
	je	$L2277
; Line 4906
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 436207616				; 1a000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L2278
; Line 4910
	mov	eax, DWORD PTR _pval$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_int_size_in_bytes
	add	esp, 4
	add	eax, 3
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	push	eax
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_move_block_to_reg
	add	esp, 12					; 0000000cH
; Line 4911
	jmp	$L2279
$L2278:
; Line 4912
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_emit_move_insn
	add	esp, 8
$L2279:
; Line 4914
	jmp	$L2280
$L2277:
; Line 4915
	push	0
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _pval$[ebp]
	push	eax
	call	_store_expr
	add	esp, 12					; 0000000cH
$L2280:
; Line 4919
	cmp	DWORD PTR _may_be_alloca$[ebp], 0
	je	$L2281
; Line 4920
	call	_do_pending_stack_adjust
; Line 4921
$L2281:
; Line 4922
	jmp	$L2282
$L2276:
	mov	eax, DWORD PTR _pval$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	and	eax, -16777216				; ff000000H
	mov	ecx, 436207616				; 1a000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L2283
; Line 4937
	mov	eax, DWORD PTR _pval$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	mov	DWORD PTR _size$2284[ebp], eax
; Line 4942
	mov	eax, DWORD PTR _size$2284[ebp]
	inc	eax
	and	eax, -2					; fffffffeH
	mov	DWORD PTR _size$2284[ebp], eax
; Line 4944
	mov	eax, DWORD PTR _size$2284[ebp]
	mov	DWORD PTR _used$[ebp], eax
; Line 4951
	mov	eax, DWORD PTR _size$2284[ebp]
	add	eax, 3
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	shl	eax, 2
	mov	DWORD PTR _used$[ebp], eax
; Line 4953
$L2286:
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _tem$2285[ebp], eax
; Line 4954
	cmp	DWORD PTR _tem$2285[ebp], 0
	jne	$L2287
; Line 4956
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _pval$[ebp]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	mov	DWORD PTR _tem$2285[ebp], eax
; Line 4959
	call	_emit_queue
; Line 4964
$L2287:
	cmp	DWORD PTR _may_be_alloca$[ebp], 0
	je	$L2288
; Line 4965
	call	_do_pending_stack_adjust
; Line 4967
$L2288:
; Line 4969
	mov	eax, DWORD PTR _arg$[ebp]
	cmp	DWORD PTR [eax+20], 0
	jne	$L2573
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR -76+[ebp], eax
	jmp	$L2574
$L2573:
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	push	eax
	call	_plus_constant
	add	esp, 8
	mov	DWORD PTR -76+[ebp], eax
$L2574:
	mov	eax, DWORD PTR -76+[ebp]
	push	eax
	mov	eax, DWORD PTR _argblock$[ebp]
	push	eax
	mov	eax, DWORD PTR _used$[ebp]
	sub	eax, DWORD PTR _size$2284[ebp]
	push	eax
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+12]
	push	eax
	push	0
	push	0
	mov	eax, DWORD PTR _pval$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	sar	eax, 24					; 00000018H
	push	eax
	mov	eax, DWORD PTR _tem$2285[ebp]
	push	eax
	call	_emit_push_insn
	add	esp, 36					; 00000024H
; Line 4971
	jmp	$L2289
$L2283:
	mov	eax, DWORD PTR _arg$[ebp]
	cmp	DWORD PTR [eax+36], 0
	je	$L2290
; Line 4976
	mov	eax, DWORD PTR _pval$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_size_in_bytes
	add	esp, 4
	mov	DWORD PTR _sizetree$2291[ebp], eax
; Line 4978
	push	32					; 00000020H
	push	8
	mov	eax, DWORD PTR _sizetree$2291[ebp]
	push	eax
	call	_convert_units
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _s1$2292[ebp], eax
; Line 4979
	push	8
	push	32					; 00000020H
	mov	eax, DWORD PTR _s1$2292[ebp]
	push	eax
	call	_convert_units
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _s2$2293[ebp], eax
; Line 4984
	mov	DWORD PTR _where_pad$2294[ebp], 1
; Line 4989
	cmp	DWORD PTR _where_pad$2294[ebp], 2
	jne	$L2295
; Line 4992
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+36]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _address$2297[ebp], eax
; Line 4995
	mov	DWORD PTR _stack_offset$2298[ebp], 0
; Line 4996
	mov	DWORD PTR _stack_offset$2298[ebp+4], 0
; Line 4999
	mov	eax, DWORD PTR _s2$2293[ebp]
	mov	DWORD PTR _inc$2299[ebp], eax
	mov	eax, DWORD PTR _inc$2299[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L2300
	mov	eax, DWORD PTR _inc$2299[ebp]
	mov	eax, DWORD PTR [eax+20]
	add	DWORD PTR _stack_offset$2298[ebp], eax
	jmp	$L2301
$L2300:
	cmp	DWORD PTR _stack_offset$2298[ebp+4], 0
	jne	$L2302
	mov	eax, DWORD PTR _inc$2299[ebp]
	mov	DWORD PTR _stack_offset$2298[ebp+4], eax
	jmp	$L2303
$L2302:
	mov	eax, DWORD PTR _inc$2299[ebp]
	push	eax
	mov	eax, DWORD PTR _stack_offset$2298[ebp+4]
	push	eax
	push	64					; 00000040H
	call	_genop
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _stack_offset$2298[ebp+4], eax
$L2303:
$L2301:
; Line 5000
	mov	eax, DWORD PTR _sizetree$2291[ebp]
	mov	DWORD PTR _dec$2304[ebp], eax
	mov	eax, DWORD PTR _dec$2304[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L2305
	sub	eax, eax
	mov	ecx, DWORD PTR _dec$2304[ebp]
	sub	eax, DWORD PTR [ecx+20]
	neg	eax
	sub	DWORD PTR _stack_offset$2298[ebp], eax
	jmp	$L2306
$L2305:
	cmp	DWORD PTR _stack_offset$2298[ebp+4], 0
	jne	$L2307
	mov	eax, DWORD PTR _dec$2304[ebp]
	push	eax
	mov	eax, DWORD PTR _integer_zero_node
	push	eax
	push	65					; 00000041H
	call	_genop
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _stack_offset$2298[ebp+4], eax
	jmp	$L2308
$L2307:
	mov	eax, DWORD PTR _dec$2304[ebp]
	push	eax
	mov	eax, DWORD PTR _stack_offset$2298[ebp+4]
	push	eax
	push	65					; 00000041H
	call	_genop
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _stack_offset$2298[ebp+4], eax
$L2308:
$L2306:
; Line 5001
	cmp	DWORD PTR _stack_offset$2298[ebp+4], 0
	jne	$L2575
	mov	eax, DWORD PTR _stack_offset$2298[ebp]
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _offset_rtx$2296[ebp], eax
	jmp	$L2576
$L2575:
	mov	eax, DWORD PTR _stack_offset$2298[ebp]
	push	eax
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _stack_offset$2298[ebp+4]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	push	eax
	call	_plus_constant
	add	esp, 8
	mov	DWORD PTR _offset_rtx$2296[ebp], eax
$L2576:
; Line 5004
	mov	eax, DWORD PTR _offset_rtx$2296[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2309
; Line 5005
	mov	eax, DWORD PTR _offset_rtx$2296[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _address$2297[ebp]
	push	eax
	call	_plus_constant
	add	esp, 8
	mov	DWORD PTR _address$2297[ebp], eax
; Line 5006
	jmp	$L2310
$L2309:
; Line 5008
	mov	eax, DWORD PTR _offset_rtx$2296[ebp]
	push	eax
	mov	eax, DWORD PTR _address$2297[ebp]
	push	eax
	push	4
	push	44					; 0000002cH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	DWORD PTR _address$2297[ebp], eax
; Line 5009
	mov	eax, DWORD PTR _address$2297[ebp]
	push	eax
	push	1
	call	_memory_address
	add	esp, 8
	mov	DWORD PTR _address$2297[ebp], eax
; Line 5010
$L2310:
; Line 5011
	mov	eax, DWORD PTR _address$2297[ebp]
	push	eax
	push	0
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+36]
	push	eax
	call	_change_address
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _arg$[ebp]
	mov	DWORD PTR [ecx+36], eax
; Line 5016
$L2295:
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+36]
	push	eax
	mov	eax, DWORD PTR _stack_pointer_rtx
	push	eax
	call	_reg_mentioned_p
	add	esp, 8
	or	eax, eax
	je	$L2311
; Line 5018
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+36]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_copy_to_reg
	add	esp, 4
	push	eax
	push	0
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+36]
	push	eax
	call	_change_address
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _arg$[ebp]
	mov	DWORD PTR [ecx+36], eax
; Line 5020
$L2311:
	mov	eax, DWORD PTR _arg$[ebp]
	cmp	DWORD PTR [eax+4], 0
	jne	$L2312
; Line 5024
	push	0
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+36]
	push	eax
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_store_expr
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _arg$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 5025
	jmp	$L2313
$L2312:
	mov	eax, DWORD PTR _arg$[ebp]
	mov	ecx, DWORD PTR _arg$[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	cmp	DWORD PTR [eax+36], ecx
	je	$L2314
; Line 5031
	mov	eax, DWORD PTR _arg$[ebp]
	cmp	DWORD PTR [eax+28], 0
	jne	$L2577
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR -80+[ebp], eax
	jmp	$L2578
$L2577:
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	push	eax
	call	_plus_constant
	add	esp, 8
	mov	DWORD PTR -80+[ebp], eax
$L2578:
	mov	eax, DWORD PTR _pval$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+37]
	and	eax, 255				; 000000ffH
	sar	eax, 3
	push	eax
	mov	eax, DWORD PTR -80+[ebp]
	push	eax
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+36]
	push	eax
	call	_emit_block_move
	add	esp, 16					; 00000010H
; Line 5036
$L2314:
$L2313:
	mov	eax, DWORD PTR _arg$[ebp]
	cmp	DWORD PTR [eax+12], 0
	jle	$L2315
; Line 5037
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+12]
	push	eax
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+36]
	push	eax
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_move_block_to_reg
	add	esp, 12					; 0000000cH
; Line 5038
$L2315:
; Line 5039
	jmp	$L2316
$L2290:
; Line 5044
	mov	eax, DWORD PTR _arg$[ebp]
	cmp	DWORD PTR [eax+4], 0
	je	$L2579
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _tem$2317[ebp], eax
	jmp	$L2580
$L2579:
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _pval$[ebp]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	mov	DWORD PTR _tem$2317[ebp], eax
$L2580:
; Line 5055
	mov	eax, DWORD PTR _arg$[ebp]
	cmp	DWORD PTR [eax+28], 0
	je	$L2320
; Line 5057
	mov	DWORD PTR _excess$2318[ebp], 0
; Line 5058
	mov	eax, DWORD PTR _arg$[ebp]
	cmp	DWORD PTR [eax+28], 0
	jne	$L2581
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _size_rtx$2319[ebp], eax
	jmp	$L2582
$L2581:
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	push	eax
	call	_plus_constant
	add	esp, 8
	mov	DWORD PTR _size_rtx$2319[ebp], eax
$L2582:
; Line 5060
	jmp	$L2321
$L2320:
; Line 5062
	mov	eax, DWORD PTR _pval$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_size_in_bytes
	add	esp, 4
	mov	DWORD PTR _size$2322[ebp], eax
; Line 5066
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	ecx, DWORD PTR _size$2322[ebp]
	sub	eax, DWORD PTR [ecx+20]
	mov	ecx, DWORD PTR _arg$[ebp]
	mov	ecx, DWORD PTR [ecx+12]
	lea	eax, DWORD PTR [eax+ecx*4]
	mov	DWORD PTR _excess$2318[ebp], eax
; Line 5067
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _size$2322[ebp]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	mov	DWORD PTR _size_rtx$2319[ebp], eax
; Line 5068
$L2321:
; Line 5070
	mov	eax, DWORD PTR _arg$[ebp]
	cmp	DWORD PTR [eax+36], 0
	je	$L2323
; Line 5071
	call	_abort
; Line 5073
$L2323:
; Line 5076
	mov	eax, DWORD PTR _arg$[ebp]
	cmp	DWORD PTR [eax+20], 0
	jne	$L2583
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR -84+[ebp], eax
	jmp	$L2584
$L2583:
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	push	eax
	call	_plus_constant
	add	esp, 8
	mov	DWORD PTR -84+[ebp], eax
$L2584:
	mov	eax, DWORD PTR -84+[ebp]
	push	eax
	mov	eax, DWORD PTR _argblock$[ebp]
	push	eax
	mov	eax, DWORD PTR _excess$2318[ebp]
	push	eax
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+12]
	push	eax
	mov	eax, DWORD PTR _pval$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+37]
	and	eax, 255				; 000000ffH
	sar	eax, 3
	push	eax
	mov	eax, DWORD PTR _size_rtx$2319[ebp]
	push	eax
	mov	eax, DWORD PTR _pval$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	sar	eax, 24					; 00000018H
	push	eax
	mov	eax, DWORD PTR _tem$2317[ebp]
	push	eax
	call	_emit_push_insn
	add	esp, 36					; 00000024H
; Line 5077
$L2316:
$L2289:
$L2282:
; Line 5081
	inc	DWORD PTR _inhibit_defer_pop
; Line 5082
$L2272:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_store_one_arg ENDP
_exp$ = 8
_label$ = 12
_jumpifnot PROC NEAR
; Line 5094
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 5095
	push	0
	mov	eax, DWORD PTR _label$[ebp]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	push	eax
	call	_do_jump
	add	esp, 12					; 0000000cH
; Line 5096
$L2326:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_jumpifnot ENDP
_TEXT	ENDS
PUBLIC	_jumpif
_TEXT	SEGMENT
_exp$ = 8
_label$ = 12
_jumpif	PROC NEAR
; Line 5104
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 5105
	mov	eax, DWORD PTR _label$[ebp]
	push	eax
	push	0
	mov	eax, DWORD PTR _exp$[ebp]
	push	eax
	call	_do_jump
	add	esp, 12					; 0000000cH
; Line 5106
$L2329:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_jumpif	ENDP
_TEXT	ENDS
EXTRN	_fconst0_rtx:DWORD
EXTRN	_invert_exp:NEAR
EXTRN	_emit_jump:NEAR
_TEXT	SEGMENT
_pat$2383 = -28
_i$2386 = -32
_exp$ = 8
_if_false_label$ = 12
_if_true_label$ = 16
_code$ = -4
_drop_through_label$ = -16
_temp$ = -12
_comparison$ = -8
_label1$2356 = -20
_zero$2365 = -24
_do_jump PROC NEAR
; Line 5120
	push	ebp
	mov	ebp, esp
	sub	esp, 52					; 00000034H
	push	ebx
	push	esi
	push	edi
; Line 5121
	mov	eax, DWORD PTR _exp$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _code$[ebp], eax
; Line 5125
	mov	DWORD PTR _drop_through_label$[ebp], 0
; Line 5127
	mov	DWORD PTR _comparison$[ebp], 0
; Line 5129
	call	_emit_queue
; Line 5131
	mov	eax, DWORD PTR _code$[ebp]
	mov	DWORD PTR -52+[ebp], eax
	jmp	$L2338
; Line 5133
$L2342:
; Line 5134
	jmp	$L2339
; Line 5136
$L2343:
; Line 5137
	mov	eax, DWORD PTR _exp$[ebp]
	push	eax
	call	_integer_zerop
	add	esp, 4
	or	eax, eax
	je	$L2585
	mov	eax, DWORD PTR _if_false_label$[ebp]
	mov	DWORD PTR _temp$[ebp], eax
	jmp	$L2586
$L2585:
	mov	eax, DWORD PTR _if_true_label$[ebp]
	mov	DWORD PTR _temp$[ebp], eax
$L2586:
; Line 5138
	cmp	DWORD PTR _temp$[ebp], 0
	je	$L2344
; Line 5139
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_emit_jump
	add	esp, 4
; Line 5140
$L2344:
	jmp	$L2339
; Line 5142
$L2346:
; Line 5144
	cmp	DWORD PTR _if_true_label$[ebp], 0
	je	$L2347
; Line 5145
	mov	eax, DWORD PTR _if_true_label$[ebp]
	push	eax
	call	_emit_jump
	add	esp, 4
; Line 5146
$L2347:
	jmp	$L2339
; Line 5148
$L2348:
; Line 5149
	mov	eax, DWORD PTR _if_true_label$[ebp]
	push	eax
	mov	eax, DWORD PTR _if_false_label$[ebp]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_do_jump
	add	esp, 12					; 0000000cH
; Line 5150
	jmp	$L2339
; Line 5152
$L2349:
; Line 5153
	mov	eax, DWORD PTR _if_false_label$[ebp]
	push	eax
	mov	eax, DWORD PTR _if_true_label$[ebp]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_do_jump
	add	esp, 12					; 0000000cH
; Line 5154
	jmp	$L2339
; Line 5156
$L2350:
; Line 5157
	cmp	DWORD PTR _if_false_label$[ebp], 0
	jne	$L2351
; Line 5158
	call	_gen_label_rtx
	mov	DWORD PTR _drop_through_label$[ebp], eax
	mov	eax, DWORD PTR _drop_through_label$[ebp]
	mov	DWORD PTR _if_false_label$[ebp], eax
; Line 5159
$L2351:
	push	0
	mov	eax, DWORD PTR _if_false_label$[ebp]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_do_jump
	add	esp, 12					; 0000000cH
; Line 5160
	mov	eax, DWORD PTR _if_true_label$[ebp]
	push	eax
	mov	eax, DWORD PTR _if_false_label$[ebp]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	call	_do_jump
	add	esp, 12					; 0000000cH
; Line 5161
	jmp	$L2339
; Line 5163
$L2352:
; Line 5164
	cmp	DWORD PTR _if_true_label$[ebp], 0
	jne	$L2353
; Line 5165
	call	_gen_label_rtx
	mov	DWORD PTR _drop_through_label$[ebp], eax
	mov	eax, DWORD PTR _drop_through_label$[ebp]
	mov	DWORD PTR _if_true_label$[ebp], eax
; Line 5166
$L2353:
	mov	eax, DWORD PTR _if_true_label$[ebp]
	push	eax
	push	0
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_do_jump
	add	esp, 12					; 0000000cH
; Line 5167
	mov	eax, DWORD PTR _if_true_label$[ebp]
	push	eax
	mov	eax, DWORD PTR _if_false_label$[ebp]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	call	_do_jump
	add	esp, 12					; 0000000cH
; Line 5168
	jmp	$L2339
; Line 5170
$L2354:
; Line 5171
	push	0
	push	0
	mov	eax, DWORD PTR _const0_rtx
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
; Line 5172
	call	_emit_queue
; Line 5173
	mov	eax, DWORD PTR _if_true_label$[ebp]
	push	eax
	mov	eax, DWORD PTR _if_false_label$[ebp]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	call	_do_jump
	add	esp, 12					; 0000000cH
; Line 5174
	jmp	$L2339
; Line 5176
$L2355:
; Line 5178
	call	_gen_label_rtx
	mov	DWORD PTR _label1$2356[ebp], eax
; Line 5179
	call	_gen_label_rtx
	mov	DWORD PTR _drop_through_label$[ebp], eax
; Line 5180
	push	0
	mov	eax, DWORD PTR _label1$2356[ebp]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_do_jump
	add	esp, 12					; 0000000cH
; Line 5184
	cmp	DWORD PTR _if_true_label$[ebp], 0
	je	$L2587
	mov	eax, DWORD PTR _if_true_label$[ebp]
	mov	DWORD PTR -36+[ebp], eax
	jmp	$L2588
$L2587:
	mov	eax, DWORD PTR _drop_through_label$[ebp]
	mov	DWORD PTR -36+[ebp], eax
$L2588:
	cmp	DWORD PTR _if_false_label$[ebp], 0
	je	$L2589
	mov	eax, DWORD PTR _if_false_label$[ebp]
	mov	DWORD PTR -40+[ebp], eax
	jmp	$L2590
$L2589:
	mov	eax, DWORD PTR _drop_through_label$[ebp]
	mov	DWORD PTR -40+[ebp], eax
$L2590:
	mov	eax, DWORD PTR -36+[ebp]
	push	eax
	mov	eax, DWORD PTR -40+[ebp]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	call	_do_jump
	add	esp, 12					; 0000000cH
; Line 5185
	mov	eax, DWORD PTR _label1$2356[ebp]
	push	eax
	call	_emit_label
	add	esp, 4
; Line 5189
	cmp	DWORD PTR _if_true_label$[ebp], 0
	je	$L2591
	mov	eax, DWORD PTR _if_true_label$[ebp]
	mov	DWORD PTR -44+[ebp], eax
	jmp	$L2592
$L2591:
	mov	eax, DWORD PTR _drop_through_label$[ebp]
	mov	DWORD PTR -44+[ebp], eax
$L2592:
	cmp	DWORD PTR _if_false_label$[ebp], 0
	je	$L2593
	mov	eax, DWORD PTR _if_false_label$[ebp]
	mov	DWORD PTR -48+[ebp], eax
	jmp	$L2594
$L2593:
	mov	eax, DWORD PTR _drop_through_label$[ebp]
	mov	DWORD PTR -48+[ebp], eax
$L2594:
	mov	eax, DWORD PTR -44+[ebp]
	push	eax
	mov	eax, DWORD PTR -48+[ebp]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+32]
	push	eax
	call	_do_jump
	add	esp, 12					; 0000000cH
; Line 5191
	jmp	$L2339
; Line 5193
$L2357:
; Line 5194
	push	68					; 00000044H
	push	68					; 00000044H
	push	68					; 00000044H
	push	68					; 00000044H
	mov	eax, DWORD PTR _exp$[ebp]
	push	eax
	call	_compare
	add	esp, 20					; 00000014H
	mov	DWORD PTR _comparison$[ebp], eax
; Line 5195
	jmp	$L2339
; Line 5197
$L2358:
; Line 5198
	push	67					; 00000043H
	push	67					; 00000043H
	push	67					; 00000043H
	push	67					; 00000043H
	mov	eax, DWORD PTR _exp$[ebp]
	push	eax
	call	_compare
	add	esp, 20					; 00000014H
	mov	DWORD PTR _comparison$[ebp], eax
; Line 5199
	jmp	$L2339
; Line 5201
$L2359:
; Line 5202
	push	74					; 0000004aH
	push	70					; 00000046H
	push	76					; 0000004cH
	push	72					; 00000048H
	mov	eax, DWORD PTR _exp$[ebp]
	push	eax
	call	_compare
	add	esp, 20					; 00000014H
	mov	DWORD PTR _comparison$[ebp], eax
; Line 5203
	jmp	$L2339
; Line 5205
$L2360:
; Line 5206
	push	73					; 00000049H
	push	69					; 00000045H
	push	75					; 0000004bH
	push	71					; 00000047H
	mov	eax, DWORD PTR _exp$[ebp]
	push	eax
	call	_compare
	add	esp, 20					; 00000014H
	mov	DWORD PTR _comparison$[ebp], eax
; Line 5207
	jmp	$L2339
; Line 5209
$L2361:
; Line 5210
	push	76					; 0000004cH
	push	72					; 00000048H
	push	74					; 0000004aH
	push	70					; 00000046H
	mov	eax, DWORD PTR _exp$[ebp]
	push	eax
	call	_compare
	add	esp, 20					; 00000014H
	mov	DWORD PTR _comparison$[ebp], eax
; Line 5211
	jmp	$L2339
; Line 5213
$L2362:
; Line 5214
	push	75					; 0000004bH
	push	71					; 00000047H
	push	73					; 00000049H
	push	69					; 00000045H
	mov	eax, DWORD PTR _exp$[ebp]
	push	eax
	call	_compare
	add	esp, 20					; 00000014H
	mov	DWORD PTR _comparison$[ebp], eax
; Line 5215
	jmp	$L2339
; Line 5217
$L2363:
; Line 5218
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _exp$[ebp]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	mov	DWORD PTR _temp$[ebp], eax
; Line 5221
	cmp	DWORD PTR _cse_not_expected, 0
	jne	$L2364
	mov	eax, DWORD PTR _temp$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2364
; Line 5222
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_copy_to_reg
	add	esp, 4
	mov	DWORD PTR _temp$[ebp], eax
; Line 5223
$L2364:
	call	_do_pending_stack_adjust
; Line 5225
	mov	eax, DWORD PTR _temp$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 167772160				; 0a000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L2595
	mov	eax, DWORD PTR _fconst0_rtx
	mov	DWORD PTR _zero$2365[ebp], eax
	jmp	$L2596
$L2595:
	mov	eax, DWORD PTR _temp$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 184549376				; 0b000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L2597
	mov	eax, DWORD PTR _dconst0_rtx
	mov	DWORD PTR _zero$2365[ebp], eax
	jmp	$L2598
$L2597:
	mov	eax, DWORD PTR _temp$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	cmp	DWORD PTR _mode_class[eax], 1
	jne	$L2599
	mov	eax, DWORD PTR _const0_rtx
	mov	DWORD PTR _zero$2365[ebp], eax
	jmp	$L2600
$L2599:
	call	_abort
	mov	DWORD PTR _zero$2365[ebp], 0
$L2600:
$L2598:
$L2596:
; Line 5227
	mov	eax, DWORD PTR _temp$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2366
; Line 5229
	push	32					; 00000020H
	push	0
	mov	eax, DWORD PTR _temp$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	0
	push	67					; 00000043H
	call	_compare_constants
	add	esp, 20					; 00000014H
	mov	DWORD PTR _comparison$[ebp], eax
; Line 5230
	jmp	$L2367
$L2366:
	mov	eax, DWORD PTR _temp$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sub	ecx, ecx
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L2368
; Line 5231
	mov	eax, DWORD PTR _temp$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	0
	push	67					; 00000043H
	push	67					; 00000043H
	mov	eax, DWORD PTR _zero$2365[ebp]
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_compare1
	add	esp, 24					; 00000018H
	mov	DWORD PTR _comparison$[ebp], eax
; Line 5232
	jmp	$L2369
$L2368:
; Line 5233
	call	_abort
$L2369:
$L2367:
; Line 5235
	jmp	$L2339
$L2338:
	cmp	DWORD PTR -52+[ebp], 102		; 00000066H
	jg	$L2601
	je	$L2359
	cmp	DWORD PTR -52+[ebp], 60			; 0000003cH
	jg	$L2602
	je	$L2355
	cmp	DWORD PTR -52+[ebp], 0
	je	$L2339
	cmp	DWORD PTR -52+[ebp], 35			; 00000023H
	je	$L2343
	cmp	DWORD PTR -52+[ebp], 53			; 00000035H
	je	$L2354
	jmp	$L2363
$L2602:
	cmp	DWORD PTR -52+[ebp], 97			; 00000061H
	je	$L2350
	cmp	DWORD PTR -52+[ebp], 98			; 00000062H
	je	$L2352
	cmp	DWORD PTR -52+[ebp], 101		; 00000065H
	je	$L2349
	jmp	$L2363
$L2601:
	sub	DWORD PTR -52+[ebp], 103		; 00000067H
	cmp	DWORD PTR -52+[ebp], 13			; 0000000dH
	ja	$L2363
	shl	DWORD PTR -52+[ebp], 2
	mov	eax, DWORD PTR -52+[ebp]
	jmp	DWORD PTR $L2603[eax]
$L2603:
	DD	OFFSET $L2360
	DD	OFFSET $L2361
	DD	OFFSET $L2362
	DD	OFFSET $L2357
	DD	OFFSET $L2358
	DD	OFFSET $L2363
	DD	OFFSET $L2363
	DD	OFFSET $L2363
	DD	OFFSET $L2363
	DD	OFFSET $L2363
	DD	OFFSET $L2348
	DD	OFFSET $L2363
	DD	OFFSET $L2363
	DD	OFFSET $L2346
$L2339:
; Line 5238
	call	_emit_queue
; Line 5244
	mov	eax, DWORD PTR _comparison$[ebp]
	cmp	DWORD PTR _const1_rtx, eax
	jne	$L2370
; Line 5246
	cmp	DWORD PTR _if_true_label$[ebp], 0
	je	$L2371
; Line 5247
	mov	eax, DWORD PTR _if_true_label$[ebp]
	push	eax
	call	_emit_jump
	add	esp, 4
; Line 5248
$L2371:
; Line 5249
	jmp	$L2372
$L2370:
	mov	eax, DWORD PTR _comparison$[ebp]
	cmp	DWORD PTR _const0_rtx, eax
	jne	$L2373
; Line 5251
	cmp	DWORD PTR _if_false_label$[ebp], 0
	je	$L2374
; Line 5252
	mov	eax, DWORD PTR _if_false_label$[ebp]
	push	eax
	call	_emit_jump
	add	esp, 4
; Line 5253
$L2374:
; Line 5254
	jmp	$L2375
$L2373:
	cmp	DWORD PTR _comparison$[ebp], 0
	je	$L2376
; Line 5256
	cmp	DWORD PTR _if_true_label$[ebp], 0
	je	$L2377
; Line 5258
	mov	eax, DWORD PTR _comparison$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	cmp	DWORD PTR _bcc_gen_fctn[eax*4], 0
	je	$L2378
; Line 5259
	mov	eax, DWORD PTR _if_true_label$[ebp]
	push	eax
	mov	eax, DWORD PTR _comparison$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	call	DWORD PTR _bcc_gen_fctn[eax*4]
	add	esp, 4
	push	eax
	call	_emit_jump_insn
	add	esp, 4
; Line 5260
	jmp	$L2379
$L2378:
; Line 5261
	call	_abort
$L2379:
; Line 5263
	cmp	DWORD PTR _if_false_label$[ebp], 0
	je	$L2380
; Line 5264
	mov	eax, DWORD PTR _if_false_label$[ebp]
	push	eax
	call	_emit_jump
	add	esp, 4
; Line 5265
$L2380:
; Line 5266
	jmp	$L2381
$L2377:
	cmp	DWORD PTR _if_false_label$[ebp], 0
	je	$L2382
; Line 5270
	mov	eax, DWORD PTR _comparison$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	cmp	DWORD PTR _bcc_gen_fctn[eax*4], 0
	jne	$L2384
; Line 5271
	call	_abort
; Line 5273
$L2384:
	mov	eax, DWORD PTR _if_false_label$[ebp]
	push	eax
	mov	eax, DWORD PTR _comparison$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	call	DWORD PTR _bcc_gen_fctn[eax*4]
	add	esp, 4
	mov	DWORD PTR _pat$2383[ebp], eax
; Line 5277
	mov	eax, DWORD PTR _pat$2383[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 720896				; 000b0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2385
; Line 5281
	mov	DWORD PTR _i$2386[ebp], 0
	jmp	$L2387
$L2388:
	inc	DWORD PTR _i$2386[ebp]
$L2387:
	mov	eax, DWORD PTR _pat$2383[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	dec	eax
	cmp	eax, DWORD PTR _i$2386[ebp]
	jle	$L2389
; Line 5282
	mov	eax, DWORD PTR _pat$2383[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _i$2386[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 917504				; 000e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2390
; Line 5283
	call	_abort
; Line 5284
$L2390:
	jmp	$L2388
$L2389:
; Line 5285
	push	0
	push	0
	mov	eax, DWORD PTR _pat$2383[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _pat$2383[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_invert_exp
	add	esp, 12					; 0000000cH
; Line 5287
	jmp	$L2392
$L2385:
; Line 5288
	push	0
	push	0
	mov	eax, DWORD PTR _pat$2383[ebp]
	push	eax
	call	_invert_exp
	add	esp, 12					; 0000000cH
$L2392:
; Line 5290
	mov	eax, DWORD PTR _pat$2383[ebp]
	push	eax
	call	_emit_jump_insn
	add	esp, 4
; Line 5292
$L2382:
$L2381:
; Line 5294
$L2376:
$L2375:
$L2372:
	cmp	DWORD PTR _drop_through_label$[ebp], 0
	je	$L2393
; Line 5295
	mov	eax, DWORD PTR _drop_through_label$[ebp]
	push	eax
	call	_emit_label
	add	esp, 4
; Line 5296
$L2393:
$L2333:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_do_jump ENDP
_operation$ = 8
_unsignedp$ = 12
_op0$ = 16
_op1$ = 20
_width$ = 24
_val$ = -4
_compare_constants PROC NEAR
; Line 5309
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 5314
	cmp	DWORD PTR _width$[ebp], 32		; 00000020H
	jge	$L2401
; Line 5316
	mov	eax, 1
	mov	cl, BYTE PTR _width$[ebp]
	shl	eax, cl
	dec	eax
	and	DWORD PTR _op0$[ebp], eax
; Line 5317
	mov	eax, 1
	mov	cl, BYTE PTR _width$[ebp]
	shl	eax, cl
	dec	eax
	and	DWORD PTR _op1$[ebp], eax
; Line 5319
	cmp	DWORD PTR _unsignedp$[ebp], 0
	jne	$L2402
; Line 5321
	mov	eax, 1
	mov	ecx, DWORD PTR _width$[ebp]
	dec	ecx
	shl	eax, cl
	test	eax, DWORD PTR _op0$[ebp]
	je	$L2403
; Line 5322
	mov	eax, -1
	mov	cl, BYTE PTR _width$[ebp]
	shl	eax, cl
	or	DWORD PTR _op0$[ebp], eax
; Line 5323
$L2403:
	mov	eax, 1
	mov	ecx, DWORD PTR _width$[ebp]
	dec	ecx
	shl	eax, cl
	test	eax, DWORD PTR _op1$[ebp]
	je	$L2404
; Line 5324
	mov	eax, -1
	mov	cl, BYTE PTR _width$[ebp]
	shl	eax, cl
	or	DWORD PTR _op1$[ebp], eax
; Line 5325
$L2404:
; Line 5326
$L2402:
; Line 5328
$L2401:
	mov	eax, DWORD PTR _operation$[ebp]
	mov	DWORD PTR -8+[ebp], eax
	jmp	$L2405
; Line 5330
$L2409:
; Line 5331
	mov	eax, DWORD PTR _op1$[ebp]
	sub	eax, DWORD PTR _op0$[ebp]
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	mov	DWORD PTR _val$[ebp], eax
; Line 5332
	jmp	$L2406
; Line 5334
$L2410:
; Line 5335
	mov	eax, DWORD PTR _op1$[ebp]
	sub	eax, DWORD PTR _op0$[ebp]
	cmp	eax, 1
	sbb	eax, eax
	inc	eax
	mov	DWORD PTR _val$[ebp], eax
; Line 5336
	jmp	$L2406
; Line 5338
$L2411:
; Line 5340
	mov	eax, DWORD PTR _op0$[ebp]
	cmp	DWORD PTR _op1$[ebp], eax
	mov	eax, 0
	setl	al
	mov	DWORD PTR _val$[ebp], eax
; Line 5341
	jmp	$L2406
; Line 5343
$L2412:
; Line 5345
	mov	eax, DWORD PTR _op0$[ebp]
	cmp	DWORD PTR _op1$[ebp], eax
	mov	eax, 0
	setg	al
	mov	DWORD PTR _val$[ebp], eax
; Line 5346
	jmp	$L2406
; Line 5348
$L2413:
; Line 5350
	mov	eax, DWORD PTR _op0$[ebp]
	cmp	DWORD PTR _op1$[ebp], eax
	mov	eax, 0
	setle	al
	mov	DWORD PTR _val$[ebp], eax
; Line 5351
	jmp	$L2406
; Line 5353
$L2414:
; Line 5355
	mov	eax, DWORD PTR _op0$[ebp]
	cmp	DWORD PTR _op1$[ebp], eax
	mov	eax, 0
	setge	al
	mov	DWORD PTR _val$[ebp], eax
; Line 5356
	jmp	$L2406
$L2405:
	sub	DWORD PTR -8+[ebp], 67			; 00000043H
	cmp	DWORD PTR -8+[ebp], 9
	ja	$L2406
	shl	DWORD PTR -8+[ebp], 2
	mov	eax, DWORD PTR -8+[ebp]
	jmp	DWORD PTR $L2606[eax]
$L2606:
	DD	OFFSET $L2410
	DD	OFFSET $L2409
	DD	OFFSET $L2413
	DD	OFFSET $L2411
	DD	OFFSET $L2414
	DD	OFFSET $L2412
	DD	OFFSET $L2413
	DD	OFFSET $L2411
	DD	OFFSET $L2414
	DD	OFFSET $L2412
$L2406:
; Line 5358
	cmp	DWORD PTR _val$[ebp], 0
	je	$L2604
	mov	eax, DWORD PTR _const1_rtx
	jmp	$L2605
$L2604:
	mov	eax, DWORD PTR _const0_rtx
$L2605:
	jmp	$L2399
; Line 5359
$L2399:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_compare_constants ENDP
_TEXT	ENDS
EXTRN	_cc0_rtx:DWORD
EXTRN	_force_not_mem:NEAR
_TEXT	SEGMENT
_exp$ = 8
_signed_forward$ = 12
_unsigned_forward$ = 16
_signed_reverse$ = 20
_unsigned_reverse$ = 24
_op0$ = -12
_op1$ = -16
_mode$ = -8
_unsignedp$ = -4
_tem$2427 = -20
_compare PROC NEAR
; Line 5378
	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H
	push	ebx
	push	esi
	push	edi
; Line 5380
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	mov	DWORD PTR _op0$[ebp], eax
; Line 5381
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	mov	DWORD PTR _op1$[ebp], eax
; Line 5382
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	mov	DWORD PTR _mode$[ebp], eax
; Line 5388
	mov	eax, DWORD PTR _op0$[ebp]
	cmp	DWORD PTR _const0_rtx, eax
	je	$L2426
	mov	eax, DWORD PTR _mode$[ebp]
	cmp	DWORD PTR _mode_class[eax*4], 2
	jne	$L2425
	cmp	DWORD PTR _mode$[ebp], 10		; 0000000aH
	jne	$L2607
	mov	eax, DWORD PTR _fconst0_rtx
	mov	DWORD PTR -24+[ebp], eax
	jmp	$L2608
$L2607:
	cmp	DWORD PTR _mode$[ebp], 11		; 0000000bH
	jne	$L2609
	mov	eax, DWORD PTR _dconst0_rtx
	mov	DWORD PTR -24+[ebp], eax
	jmp	$L2610
$L2609:
	mov	eax, DWORD PTR _mode$[ebp]
	cmp	DWORD PTR _mode_class[eax*4], 1
	jne	$L2611
	mov	eax, DWORD PTR _const0_rtx
	mov	DWORD PTR -24+[ebp], eax
	jmp	$L2612
$L2611:
	call	_abort
	mov	DWORD PTR -24+[ebp], 0
$L2612:
$L2610:
$L2608:
	mov	eax, DWORD PTR -24+[ebp]
	cmp	DWORD PTR _op0$[ebp], eax
	jne	$L2425
$L2426:
; Line 5390
	mov	eax, DWORD PTR _op0$[ebp]
	mov	DWORD PTR _tem$2427[ebp], eax
; Line 5391
	mov	eax, DWORD PTR _op1$[ebp]
	mov	DWORD PTR _op0$[ebp], eax
; Line 5392
	mov	eax, DWORD PTR _tem$2427[ebp]
	mov	DWORD PTR _op1$[ebp], eax
; Line 5393
	mov	eax, DWORD PTR _signed_reverse$[ebp]
	mov	DWORD PTR _signed_forward$[ebp], eax
; Line 5394
	mov	eax, DWORD PTR _unsigned_reverse$[ebp]
	mov	DWORD PTR _unsigned_forward$[ebp], eax
; Line 5397
$L2425:
	cmp	DWORD PTR _flag_force_mem, 0
	je	$L2428
; Line 5399
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	call	_force_not_mem
	add	esp, 4
	mov	DWORD PTR _op0$[ebp], eax
; Line 5400
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	call	_force_not_mem
	add	esp, 4
	mov	DWORD PTR _op1$[ebp], eax
; Line 5403
$L2428:
	call	_do_pending_stack_adjust
; Line 5406
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 12					; 0000000cH
	test	al, 1
	jne	$L2615
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 12					; 0000000cH
	test	al, 1
	je	$L2613
$L2615:
	mov	DWORD PTR _unsignedp$[ebp], 1
	jmp	$L2614
$L2613:
	mov	DWORD PTR _unsignedp$[ebp], 0
$L2614:
; Line 5408
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2429
	mov	eax, DWORD PTR _op1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2429
; Line 5411
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	shl	eax, 3
	push	eax
	mov	eax, DWORD PTR _op1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _unsignedp$[ebp]
	push	eax
	mov	eax, DWORD PTR _signed_forward$[ebp]
	push	eax
	call	_compare_constants
	add	esp, 20					; 00000014H
	jmp	$L2420
; Line 5413
$L2429:
; Line 5416
	cmp	DWORD PTR _mode$[ebp], 26		; 0000001aH
	jne	$L2616
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_expr_size
	add	esp, 4
	mov	DWORD PTR -28+[ebp], eax
	jmp	$L2617
$L2616:
	mov	DWORD PTR -28+[ebp], 0
$L2617:
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+37]
	and	eax, 255				; 000000ffH
	sar	eax, 3
	push	eax
	mov	eax, DWORD PTR _unsignedp$[ebp]
	push	eax
	mov	eax, DWORD PTR -28+[ebp]
	push	eax
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	call	_emit_cmp_insn
	add	esp, 20					; 00000014H
; Line 5419
	cmp	DWORD PTR _unsignedp$[ebp], 0
	je	$L2618
	mov	eax, DWORD PTR _unsigned_forward$[ebp]
	mov	DWORD PTR -32+[ebp], eax
	jmp	$L2619
$L2618:
	mov	eax, DWORD PTR _signed_forward$[ebp]
	mov	DWORD PTR -32+[ebp], eax
$L2619:
	mov	eax, DWORD PTR _const0_rtx
	push	eax
	mov	eax, DWORD PTR _cc0_rtx
	push	eax
	push	0
	mov	eax, DWORD PTR -32+[ebp]
	push	eax
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L2420
; Line 5420
$L2420:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_compare ENDP
_forward_op$ = 16
_reverse_op$ = 20
_unsignedp$ = 24
_mode$ = 28
_tem$2439 = -4
_op0$ = 8
_op1$ = 12
_compare1 PROC NEAR
; Line 5432
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 5436
	mov	eax, DWORD PTR _op0$[ebp]
	cmp	DWORD PTR _const0_rtx, eax
	je	$L2438
	mov	eax, DWORD PTR _mode$[ebp]
	cmp	DWORD PTR _mode_class[eax*4], 2
	jne	$L2437
	cmp	DWORD PTR _mode$[ebp], 10		; 0000000aH
	jne	$L2620
	mov	eax, DWORD PTR _fconst0_rtx
	mov	DWORD PTR -8+[ebp], eax
	jmp	$L2621
$L2620:
	cmp	DWORD PTR _mode$[ebp], 11		; 0000000bH
	jne	$L2622
	mov	eax, DWORD PTR _dconst0_rtx
	mov	DWORD PTR -8+[ebp], eax
	jmp	$L2623
$L2622:
	mov	eax, DWORD PTR _mode$[ebp]
	cmp	DWORD PTR _mode_class[eax*4], 1
	jne	$L2624
	mov	eax, DWORD PTR _const0_rtx
	mov	DWORD PTR -8+[ebp], eax
	jmp	$L2625
$L2624:
	call	_abort
	mov	DWORD PTR -8+[ebp], 0
$L2625:
$L2623:
$L2621:
	mov	eax, DWORD PTR _op0$[ebp]
	cmp	DWORD PTR -8+[ebp], eax
	jne	$L2437
$L2438:
; Line 5438
	mov	eax, DWORD PTR _op0$[ebp]
	mov	DWORD PTR _tem$2439[ebp], eax
; Line 5439
	mov	eax, DWORD PTR _op1$[ebp]
	mov	DWORD PTR _op0$[ebp], eax
; Line 5440
	mov	eax, DWORD PTR _tem$2439[ebp]
	mov	DWORD PTR _op1$[ebp], eax
; Line 5441
	mov	eax, DWORD PTR _reverse_op$[ebp]
	mov	DWORD PTR _forward_op$[ebp], eax
; Line 5444
$L2437:
	cmp	DWORD PTR _flag_force_mem, 0
	je	$L2440
; Line 5446
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	call	_force_not_mem
	add	esp, 4
	mov	DWORD PTR _op0$[ebp], eax
; Line 5447
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	call	_force_not_mem
	add	esp, 4
	mov	DWORD PTR _op1$[ebp], eax
; Line 5450
$L2440:
	call	_do_pending_stack_adjust
; Line 5452
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2441
	mov	eax, DWORD PTR _op1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2441
; Line 5455
	mov	eax, DWORD PTR _mode$[ebp]
	mov	eax, DWORD PTR _mode_size[eax*4]
	shl	eax, 3
	push	eax
	mov	eax, DWORD PTR _op1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _unsignedp$[ebp]
	push	eax
	mov	eax, DWORD PTR _forward_op$[ebp]
	push	eax
	call	_compare_constants
	add	esp, 20					; 00000014H
	jmp	$L2436
; Line 5457
$L2441:
	push	0
	mov	eax, DWORD PTR _unsignedp$[ebp]
	push	eax
	push	0
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	call	_emit_cmp_insn
	add	esp, 20					; 00000014H
; Line 5459
	mov	eax, DWORD PTR _const0_rtx
	push	eax
	mov	eax, DWORD PTR _cc0_rtx
	push	eax
	push	0
	mov	eax, DWORD PTR _forward_op$[ebp]
	push	eax
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L2436
; Line 5460
$L2436:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_compare1 ENDP
_TEXT	ENDS
EXTRN	_setcc_gen_fctn:BYTE
EXTRN	_emit_insn_after:NEAR
_TEXT	SEGMENT
_exp$ = 8
_target$ = 12
_mode$ = 16
_code$ = -16
_comparison$ = -20
_compare_mode$ = -8
_prev_insn$ = -12
_icode$ = -4
_do_store_flag PROC NEAR
; Line 5474
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	push	ebx
	push	esi
	push	edi
; Line 5475
	mov	eax, DWORD PTR _exp$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _code$[ebp], eax
; Line 5476
	mov	DWORD PTR _comparison$[ebp], 0
; Line 5478
	call	_get_last_insn
	mov	DWORD PTR _prev_insn$[ebp], eax
; Line 5481
	mov	eax, DWORD PTR _code$[ebp]
	mov	DWORD PTR -24+[ebp], eax
	jmp	$L2451
; Line 5484
$L2455:
; Line 5487
	push	68					; 00000044H
	push	68					; 00000044H
	push	68					; 00000044H
	push	68					; 00000044H
	mov	eax, DWORD PTR _exp$[ebp]
	push	eax
	call	_compare
	add	esp, 20					; 00000014H
	mov	DWORD PTR _comparison$[ebp], eax
; Line 5488
	mov	DWORD PTR _icode$[ebp], 105		; 00000069H
; Line 5489
	mov	eax, DWORD PTR _insn_operand_mode+2940
	mov	DWORD PTR _compare_mode$[ebp], eax
; Line 5491
$L2456:
	jmp	$L2452
; Line 5495
$L2457:
; Line 5498
	push	67					; 00000043H
	push	67					; 00000043H
	push	67					; 00000043H
	push	67					; 00000043H
	mov	eax, DWORD PTR _exp$[ebp]
	push	eax
	call	_compare
	add	esp, 20					; 00000014H
	mov	DWORD PTR _comparison$[ebp], eax
; Line 5499
	mov	DWORD PTR _icode$[ebp], 106		; 0000006aH
; Line 5500
	mov	eax, DWORD PTR _insn_operand_mode+2968
	mov	DWORD PTR _compare_mode$[ebp], eax
; Line 5502
$L2458:
	jmp	$L2452
; Line 5506
$L2459:
; Line 5509
	push	74					; 0000004aH
	push	70					; 00000046H
	push	76					; 0000004cH
	push	72					; 00000048H
	mov	eax, DWORD PTR _exp$[ebp]
	push	eax
	call	_compare
	add	esp, 20					; 00000014H
	mov	DWORD PTR _comparison$[ebp], eax
; Line 5510
	mov	DWORD PTR _icode$[ebp], 109		; 0000006dH
; Line 5511
	mov	eax, DWORD PTR _insn_operand_mode+3052
	mov	DWORD PTR _compare_mode$[ebp], eax
; Line 5513
$L2460:
	jmp	$L2452
; Line 5515
$L2461:
; Line 5518
	push	76					; 0000004cH
	push	72					; 00000048H
	push	74					; 0000004aH
	push	70					; 00000046H
	mov	eax, DWORD PTR _exp$[ebp]
	push	eax
	call	_compare
	add	esp, 20					; 00000014H
	mov	DWORD PTR _comparison$[ebp], eax
; Line 5519
	mov	DWORD PTR _icode$[ebp], 109		; 0000006dH
; Line 5520
	mov	eax, DWORD PTR _insn_operand_mode+3052
	mov	DWORD PTR _compare_mode$[ebp], eax
; Line 5522
$L2462:
	jmp	$L2452
; Line 5526
$L2463:
; Line 5529
	push	73					; 00000049H
	push	69					; 00000045H
	push	75					; 0000004bH
	push	71					; 00000047H
	mov	eax, DWORD PTR _exp$[ebp]
	push	eax
	call	_compare
	add	esp, 20					; 00000014H
	mov	DWORD PTR _comparison$[ebp], eax
; Line 5530
	mov	DWORD PTR _icode$[ebp], 113		; 00000071H
; Line 5531
	mov	eax, DWORD PTR _insn_operand_mode+3164
	mov	DWORD PTR _compare_mode$[ebp], eax
; Line 5533
$L2464:
	jmp	$L2452
; Line 5535
$L2465:
; Line 5538
	push	75					; 0000004bH
	push	71					; 00000047H
	push	73					; 00000049H
	push	69					; 00000045H
	mov	eax, DWORD PTR _exp$[ebp]
	push	eax
	call	_compare
	add	esp, 20					; 00000014H
	mov	DWORD PTR _comparison$[ebp], eax
; Line 5539
	mov	DWORD PTR _icode$[ebp], 113		; 00000071H
; Line 5540
	mov	eax, DWORD PTR _insn_operand_mode+3164
	mov	DWORD PTR _compare_mode$[ebp], eax
; Line 5542
$L2466:
	jmp	$L2452
; Line 5544
	jmp	$L2452
$L2451:
	sub	DWORD PTR -24+[ebp], 102		; 00000066H
	cmp	DWORD PTR -24+[ebp], 5
	ja	$L2452
	shl	DWORD PTR -24+[ebp], 2
	mov	eax, DWORD PTR -24+[ebp]
	jmp	DWORD PTR $L2626[eax]
$L2626:
	DD	OFFSET $L2459
	DD	OFFSET $L2463
	DD	OFFSET $L2461
	DD	OFFSET $L2465
	DD	OFFSET $L2455
	DD	OFFSET $L2457
$L2452:
; Line 5545
	cmp	DWORD PTR _comparison$[ebp], 0
	jne	$L2467
; Line 5546
	sub	eax, eax
	jmp	$L2445
; Line 5548
$L2467:
; Line 5554
	cmp	DWORD PTR _target$[ebp], 0
	je	$L2469
	mov	eax, DWORD PTR _target$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	cmp	eax, DWORD PTR _mode$[ebp]
	jne	$L2469
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	mov	eax, DWORD PTR _icode$[ebp]
	mov	ecx, eax
	shl	eax, 3
	sub	eax, ecx
	call	DWORD PTR _insn_operand_predicate[eax*4]
	add	esp, 8
	or	eax, eax
	je	$L2469
	mov	eax, DWORD PTR _compare_mode$[ebp]
	cmp	DWORD PTR _mode$[ebp], eax
	je	$L2468
	mov	eax, DWORD PTR _comparison$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L2468
$L2469:
; Line 5555
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_gen_reg_rtx
	add	esp, 4
	mov	DWORD PTR _target$[ebp], eax
; Line 5558
$L2468:
	mov	eax, DWORD PTR _comparison$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2470
; Line 5559
	mov	eax, DWORD PTR _comparison$[ebp]
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	call	_emit_move_insn
	add	esp, 8
; Line 5560
	jmp	$L2471
$L2470:
	mov	eax, DWORD PTR _target$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	cmp	eax, DWORD PTR _compare_mode$[ebp]
	je	$L2472
; Line 5566
	mov	eax, DWORD PTR _prev_insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	push	0
	push	27					; 0000001bH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	call	_emit_insn_after
	add	esp, 8
; Line 5568
	push	0
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	mov	eax, DWORD PTR _compare_mode$[ebp]
	push	eax
	push	35					; 00000023H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _comparison$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	call	DWORD PTR _setcc_gen_fctn[eax*4]
	add	esp, 4
	push	eax
	call	_emit_insn
	add	esp, 4
; Line 5572
	mov	eax, DWORD PTR _mode$[ebp]
	mov	ecx, DWORD PTR _compare_mode$[ebp]
	mov	ecx, DWORD PTR _mode_size[ecx*4]
	cmp	DWORD PTR _mode_size[eax*4], ecx
	jle	$L2473
; Line 5573
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	mov	eax, DWORD PTR _const1_rtx
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_expand_bit_and
	add	esp, 16					; 00000010H
; Line 5575
$L2473:
; Line 5576
	jmp	$L2474
$L2472:
; Line 5577
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	mov	eax, DWORD PTR _comparison$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	call	DWORD PTR _setcc_gen_fctn[eax*4]
	add	esp, 4
	push	eax
	call	_emit_insn
	add	esp, 4
$L2474:
$L2471:
; Line 5588
	mov	eax, DWORD PTR _target$[ebp]
	jmp	$L2445
; Line 5589
$L2445:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_do_store_flag ENDP
_TEXT	ENDS
PUBLIC	_do_tablejump
EXTRN	_gen_bltu:NEAR
EXTRN	_gen_tablejump:NEAR
EXTRN	_memory_address_noforce:NEAR
_TEXT	SEGMENT
_index$ = 8
_range$ = 12
_table_label$ = 16
_default_label$ = 20
_temp$ = -4
_do_tablejump PROC NEAR
; Line 5606
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 5609
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _index$[ebp]
	push	eax
	mov	eax, DWORD PTR _range$[ebp]
	push	eax
	call	_emit_cmp_insn
	add	esp, 20					; 00000014H
; Line 5610
	mov	eax, DWORD PTR _default_label$[ebp]
	push	eax
	call	_gen_bltu
	add	esp, 4
	push	eax
	call	_emit_jump_insn
	add	esp, 4
; Line 5621
	mov	eax, DWORD PTR _table_label$[ebp]
	push	eax
	push	0
	push	38					; 00000026H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _mode_size+16
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _index$[ebp]
	push	eax
	push	4
	push	47					; 0000002fH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	push	4
	push	44					; 0000002cH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	push	4
	call	_memory_address_noforce
	add	esp, 8
	mov	DWORD PTR _index$[ebp], eax
; Line 5622
	push	4
	call	_gen_reg_rtx
	add	esp, 4
	mov	DWORD PTR _temp$[ebp], eax
; Line 5623
	push	0
	mov	eax, DWORD PTR _index$[ebp]
	push	eax
	push	4
	push	37					; 00000025H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_convert_move
	add	esp, 12					; 0000000cH
; Line 5625
	mov	eax, DWORD PTR _table_label$[ebp]
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_gen_tablejump
	add	esp, 8
	push	eax
	call	_emit_jump_insn
	add	esp, 4
; Line 5626
$L2480:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_do_tablejump ENDP
_TEXT	ENDS
END
