	TITLE	integrate.c
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
PUBLIC	_function_cannot_inline_p
EXTRN	_void_type_node:DWORD
EXTRN	_current_function_calls_alloca:DWORD
EXTRN	_get_max_uid:NEAR
EXTRN	_tree_last:NEAR
EXTRN	_list_length:NEAR
EXTRN	_get_first_nonparm_insn:NEAR
_DATA	SEGMENT
$SG1170	DB	'varargs function cannot be inline', 00H
	ORG $+2
$SG1172	DB	'function using alloca cannot be inline', 00H
	ORG $+1
$SG1175	DB	'function too large to be inline', 00H
$SG1180	DB	'function with large aggregate parameter cannot be inline'
	DB	00H
	ORG $+3
$SG1182	DB	'no prototype, and parameter address used; cannot be inli'
	DB	'ne', 00H
	ORG $+1
$SG1185	DB	'address of an aggregate parameter is used; cannot be inl'
	DB	'ine', 00H
$SG1193	DB	'function too large to be inline', 00H
_DATA	ENDS
_TEXT	SEGMENT
; File integrate.c
_fndecl$ = 8
_insn$ = -12
_last$ = -4
_max_insns$ = -20
_ninsns$ = -16
_parms$ = -8
_function_cannot_inline_p PROC NEAR
; Line 130
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	push	ebx
	push	esi
	push	edi
; Line 132
	mov	eax, DWORD PTR _fndecl$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	call	_tree_last
	add	esp, 4
	mov	DWORD PTR _last$[ebp], eax
; Line 133
	mov	eax, DWORD PTR _fndecl$[ebp]
	mov	eax, DWORD PTR [eax+56]
	push	eax
	call	_list_length
	add	esp, 4
	lea	eax, DWORD PTR [eax*8+64]
	mov	DWORD PTR _max_insns$[ebp], eax
; Line 134
	mov	DWORD PTR _ninsns$[ebp], 0
; Line 140
	cmp	DWORD PTR _last$[ebp], 0
	je	$L1169
	mov	eax, DWORD PTR _last$[ebp]
	mov	ecx, DWORD PTR _void_type_node
	cmp	DWORD PTR [eax+24], ecx
	je	$L1169
; Line 141
	mov	eax, OFFSET $SG1170
	jmp	$L1163
; Line 143
$L1169:
	cmp	DWORD PTR _current_function_calls_alloca, 0
	je	$L1171
; Line 144
	mov	eax, OFFSET $SG1172
	jmp	$L1163
; Line 147
$L1171:
	mov	eax, DWORD PTR _fndecl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 14					; 0000000eH
	test	al, 1
	jne	$L1174
	call	_get_max_uid
	mov	ecx, DWORD PTR _max_insns$[ebp]
	lea	ecx, DWORD PTR [ecx+ecx*2]
	cmp	eax, ecx
	jle	$L1174
; Line 148
	mov	eax, OFFSET $SG1175
	jmp	$L1163
; Line 162
$L1174:
	mov	eax, DWORD PTR _fndecl$[ebp]
	mov	eax, DWORD PTR [eax+56]
	mov	DWORD PTR _parms$[ebp], eax
	jmp	$L1176
$L1177:
	mov	eax, DWORD PTR _parms$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _parms$[ebp], eax
$L1176:
	cmp	DWORD PTR _parms$[ebp], 0
	je	$L1178
; Line 164
	mov	eax, DWORD PTR _parms$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	and	eax, -16777216				; ff000000H
	mov	ecx, 436207616				; 1a000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1179
; Line 165
	mov	eax, OFFSET $SG1180
	jmp	$L1163
; Line 166
$L1179:
	cmp	DWORD PTR _last$[ebp], 0
	jne	$L1181
	mov	eax, DWORD PTR _parms$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 9
	test	al, 1
	je	$L1181
; Line 167
	mov	eax, OFFSET $SG1182
	jmp	$L1163
; Line 173
$L1181:
; Line 175
	mov	eax, DWORD PTR _parms$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 19					; 00000013H
	je	$L1184
	mov	eax, DWORD PTR _parms$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 20					; 00000014H
	jne	$L1183
$L1184:
	mov	eax, DWORD PTR _parms$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1183
; Line 176
	mov	eax, OFFSET $SG1185
	jmp	$L1163
; Line 177
$L1183:
	jmp	$L1177
$L1178:
; Line 179
	mov	eax, DWORD PTR _fndecl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 14					; 0000000eH
	test	al, 1
	jne	$L1186
	call	_get_max_uid
	cmp	eax, DWORD PTR _max_insns$[ebp]
	jle	$L1186
; Line 182
	mov	DWORD PTR _ninsns$[ebp], 0
	call	_get_first_nonparm_insn
	mov	DWORD PTR _insn$[ebp], eax
	jmp	$L1187
$L1188:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _insn$[ebp], eax
$L1187:
	cmp	DWORD PTR _insn$[ebp], 0
	je	$L1189
	mov	eax, DWORD PTR _max_insns$[ebp]
	cmp	DWORD PTR _ninsns$[ebp], eax
	jge	$L1189
; Line 186
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 851968				; 000d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1191
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 917504				; 000e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1191
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 983040				; 000f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1190
$L1191:
; Line 187
	inc	DWORD PTR _ninsns$[ebp]
; Line 188
$L1190:
	jmp	$L1188
$L1189:
; Line 190
	mov	eax, DWORD PTR _max_insns$[ebp]
	cmp	DWORD PTR _ninsns$[ebp], eax
	jl	$L1192
; Line 191
	mov	eax, OFFSET $SG1193
	jmp	$L1163
; Line 192
$L1192:
; Line 194
$L1186:
	sub	eax, eax
	jmp	$L1163
; Line 195
$L1163:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_function_cannot_inline_p ENDP
_TEXT	ENDS
PUBLIC	_save_for_inline
EXTRN	_max_label_num:NEAR
EXTRN	_rtx_alloc:NEAR
EXTRN	_get_first_label_num:NEAR
EXTRN	_rtx_length:BYTE
EXTRN	_max_parm_reg_num:NEAR
EXTRN	_max_reg_num:NEAR
EXTRN	_alloca:NEAR
EXTRN	_memset:NEAR
EXTRN	_gen_label_rtx:NEAR
EXTRN	_gen_inline_header_rtx:NEAR
EXTRN	_preserve_data:NEAR
EXTRN	_abort:NEAR
EXTRN	_get_insns:NEAR
EXTRN	__obstack_newchunk:NEAR
EXTRN	_memcpy:NEAR
EXTRN	_emit_label:NEAR
EXTRN	_get_frame_size:NEAR
EXTRN	_set_new_first_and_last_insn:NEAR
EXTRN	_return_label:DWORD
EXTRN	_maybepermanent_obstack:BYTE
EXTRN	_stack_slot_list:DWORD
EXTRN	_regno_reg_rtx:DWORD
EXTRN	_current_function_args_size:DWORD
_BSS	SEGMENT
_copy_asm_operands_vector$S1152 DD 01H DUP (?)
_reg_map$S1194 DD 01H DUP (?)
_label_map$S1195 DD 01H DUP (?)
_insn_map$S1196 DD 01H DUP (?)
_parmdecl_map$S1197 DD 01H DUP (?)
_max_parm_reg$S1198 DD 01H DUP (?)
_orig_asm_operands_vector$S1151 DD 01H DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
_len$ = -44
_max_reg$ = -8
_max_uid$ = -4
_p$1229 = -52
_copy$1261 = -56
_fndecl$ = 8
_first_insn$ = -20
_last_insn$ = -16
_insn$ = -36
_head$ = -12
_copy$ = -48
_parms$ = -28
_max_labelno$ = -32
_min_labelno$ = -40
_i$ = -24
_save_for_inline PROC NEAR
; Line 242
	push	ebp
	mov	ebp, esp
	sub	esp, 60					; 0000003cH
	push	ebx
	push	esi
	push	edi
; Line 255
	cmp	DWORD PTR _return_label, 0
	jne	$L1219
; Line 257
	call	_gen_label_rtx
	mov	DWORD PTR _return_label, eax
; Line 258
	mov	eax, DWORD PTR _return_label
	push	eax
	call	_emit_label
	add	esp, 4
; Line 263
$L1219:
	call	_max_label_num
	mov	DWORD PTR _max_labelno$[ebp], eax
; Line 264
	call	_get_first_label_num
	mov	DWORD PTR _min_labelno$[ebp], eax
; Line 265
	call	_max_parm_reg_num
	mov	DWORD PTR _max_parm_reg$S1198, eax
; Line 266
	call	_max_reg_num
	mov	DWORD PTR _max_reg$[ebp], eax
; Line 273
	mov	eax, DWORD PTR _max_parm_reg$S1198
	shl	eax, 2
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _parmdecl_map$S1197, eax
; Line 274
	mov	eax, DWORD PTR _max_parm_reg$S1198
	shl	eax, 2
	push	eax
	push	0
	mov	eax, DWORD PTR _parmdecl_map$S1197
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 276
	mov	eax, DWORD PTR _fndecl$[ebp]
	mov	eax, DWORD PTR [eax+56]
	mov	DWORD PTR _parms$[ebp], eax
	jmp	$L1226
$L1227:
	mov	eax, DWORD PTR _parms$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _parms$[ebp], eax
$L1226:
	cmp	DWORD PTR _parms$[ebp], 0
	je	$L1228
; Line 278
	mov	eax, DWORD PTR _parms$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	DWORD PTR _p$1229[ebp], eax
; Line 280
	mov	eax, DWORD PTR _p$1229[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1230
; Line 282
	mov	eax, DWORD PTR _parms$[ebp]
	mov	ecx, DWORD PTR _p$1229[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	mov	edx, DWORD PTR _parmdecl_map$S1197
	mov	DWORD PTR [edx+ecx*4], eax
; Line 283
	mov	eax, DWORD PTR _parms$[ebp]
	and	DWORD PTR [eax+16], -9			; fffffff7H
; Line 285
	jmp	$L1231
$L1230:
; Line 286
	mov	eax, DWORD PTR _parms$[ebp]
	mov	eax, DWORD PTR [eax+16]
	or	eax, 8
	mov	ecx, DWORD PTR _parms$[ebp]
	mov	DWORD PTR [ecx+16], eax
$L1231:
; Line 287
	mov	eax, DWORD PTR _parms$[ebp]
	mov	eax, DWORD PTR [eax+16]
	or	eax, 32					; 00000020H
	mov	ecx, DWORD PTR _parms$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 288
	jmp	$L1227
$L1228:
; Line 301
	mov	eax, DWORD PTR _stack_slot_list
	push	eax
	mov	eax, DWORD PTR _current_function_args_size
	push	eax
	mov	eax, DWORD PTR _max_reg$[ebp]
	push	eax
	mov	eax, DWORD PTR _max_parm_reg$S1198
	push	eax
	mov	eax, DWORD PTR _max_labelno$[ebp]
	push	eax
	mov	eax, DWORD PTR _min_labelno$[ebp]
	push	eax
	push	0
	push	0
	call	_gen_inline_header_rtx
	add	esp, 32					; 00000020H
	mov	DWORD PTR _head$[ebp], eax
; Line 302
	mov	eax, DWORD PTR _head$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _max_uid$[ebp], eax
; Line 308
	call	_preserve_data
; Line 320
	call	_get_insns
	mov	DWORD PTR _insn$[ebp], eax
; Line 321
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1179648				; 00120000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1233
; Line 322
	call	_abort
; Line 323
$L1233:
	push	18					; 00000012H
	call	_rtx_alloc
	add	esp, 4
	mov	DWORD PTR _first_insn$[ebp], eax
; Line 324
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _first_insn$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 325
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	ecx, DWORD PTR _first_insn$[ebp]
	mov	DWORD PTR [ecx+20], eax
; Line 326
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _first_insn$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 327
	mov	eax, DWORD PTR _first_insn$[ebp]
	mov	DWORD PTR [eax+8], 0
; Line 328
	mov	eax, DWORD PTR _first_insn$[ebp]
	mov	DWORD PTR [eax+12], 0
; Line 329
	mov	eax, DWORD PTR _first_insn$[ebp]
	mov	DWORD PTR _last_insn$[ebp], eax
; Line 335
	mov	eax, DWORD PTR _max_reg$[ebp]
	lea	eax, DWORD PTR [eax*4+4]
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _reg_map$S1194, eax
; Line 337
	mov	eax, DWORD PTR _rtx_length+136
	lea	eax, DWORD PTR [eax*4-4]
	add	eax, 8
	mov	DWORD PTR _len$[ebp], eax
; Line 338
	mov	eax, DWORD PTR _max_reg$[ebp]
	dec	eax
	mov	DWORD PTR _i$[ebp], eax
	jmp	$L1235
$L1236:
	dec	DWORD PTR _i$[ebp]
$L1235:
	cmp	DWORD PTR _i$[ebp], 10			; 0000000aH
	jl	$L1237
; Line 339
	mov	eax, DWORD PTR _len$[ebp]
	mov	DWORD PTR _maybepermanent_obstack+20, eax
	mov	eax, DWORD PTR _maybepermanent_obstack+20
	add	eax, DWORD PTR _maybepermanent_obstack+12
	cmp	eax, DWORD PTR _maybepermanent_obstack+16
	jbe	$L1767
	mov	eax, DWORD PTR _maybepermanent_obstack+20
	push	eax
	push	OFFSET _maybepermanent_obstack
	call	__obstack_newchunk
	add	esp, 8
	jmp	$L1768
$L1767:
$L1768:
	mov	eax, DWORD PTR _maybepermanent_obstack+20
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _regno_reg_rtx
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	mov	eax, DWORD PTR _maybepermanent_obstack+12
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
	mov	eax, DWORD PTR _maybepermanent_obstack+20
	add	DWORD PTR _maybepermanent_obstack+12, eax
	mov	eax, DWORD PTR _maybepermanent_obstack+8
	mov	DWORD PTR _maybepermanent_obstack+20, eax
	mov	eax, DWORD PTR _maybepermanent_obstack+12
	add	eax, DWORD PTR _maybepermanent_obstack+24
	mov	ecx, DWORD PTR _maybepermanent_obstack+24
	not	ecx
	and	eax, ecx
	mov	DWORD PTR _maybepermanent_obstack+12, eax
	mov	eax, DWORD PTR _maybepermanent_obstack+12
	sub	eax, DWORD PTR _maybepermanent_obstack+4
	mov	ecx, DWORD PTR _maybepermanent_obstack+16
	sub	ecx, DWORD PTR _maybepermanent_obstack+4
	cmp	eax, ecx
	jle	$L1769
	mov	eax, DWORD PTR _maybepermanent_obstack+16
	mov	DWORD PTR _maybepermanent_obstack+12, eax
	jmp	$L1770
$L1769:
$L1770:
	mov	eax, DWORD PTR _maybepermanent_obstack+12
	mov	DWORD PTR _maybepermanent_obstack+8, eax
	mov	eax, DWORD PTR _maybepermanent_obstack+20
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _reg_map$S1194
	mov	DWORD PTR [edx+ecx*4], eax
	jmp	$L1236
$L1237:
; Line 342
	mov	eax, DWORD PTR _max_reg$[ebp]
	lea	eax, DWORD PTR [eax*4-40]
	push	eax
	mov	eax, DWORD PTR _reg_map$S1194
	add	eax, 40					; 00000028H
	push	eax
	mov	eax, DWORD PTR _regno_reg_rtx
	add	eax, 40					; 00000028H
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
; Line 346
	mov	eax, DWORD PTR _max_labelno$[ebp]
	sub	eax, DWORD PTR _min_labelno$[ebp]
	shl	eax, 2
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _label_map$S1195, eax
; Line 347
	sub	eax, eax
	mov	ecx, DWORD PTR _min_labelno$[ebp]
	shl	ecx, 2
	sub	eax, ecx
	neg	eax
	sub	DWORD PTR _label_map$S1195, eax
; Line 349
	mov	eax, DWORD PTR _min_labelno$[ebp]
	mov	DWORD PTR _i$[ebp], eax
	jmp	$L1240
$L1241:
	inc	DWORD PTR _i$[ebp]
$L1240:
	mov	eax, DWORD PTR _max_labelno$[ebp]
	cmp	DWORD PTR _i$[ebp], eax
	jge	$L1242
; Line 350
	call	_gen_label_rtx
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _label_map$S1195
	mov	DWORD PTR [edx+ecx*4], eax
	jmp	$L1241
$L1242:
; Line 354
	mov	eax, DWORD PTR _max_uid$[ebp]
	shl	eax, 2
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _insn_map$S1196, eax
; Line 355
	mov	eax, DWORD PTR _max_uid$[ebp]
	shl	eax, 2
	push	eax
	push	0
	mov	eax, DWORD PTR _insn_map$S1196
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 359
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _insn$[ebp], eax
	jmp	$L1243
$L1244:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _insn$[ebp], eax
$L1243:
	cmp	DWORD PTR _insn$[ebp], 0
	je	$L1245
; Line 361
	mov	DWORD PTR _orig_asm_operands_vector$S1151, 0
; Line 362
	mov	DWORD PTR _copy_asm_operands_vector$S1152, 0
; Line 364
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR -60+[ebp], eax
	jmp	$L1246
; Line 366
$L1250:
; Line 368
	mov	eax, DWORD PTR _insn$[ebp]
	cmp	DWORD PTR [eax+20], -1
	jne	$L1251
; Line 369
	jmp	$L1244
; Line 371
$L1251:
	push	18					; 00000012H
	call	_rtx_alloc
	add	esp, 4
	mov	DWORD PTR _copy$[ebp], eax
; Line 372
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _copy$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 373
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	ecx, DWORD PTR _copy$[ebp]
	mov	DWORD PTR [ecx+20], eax
; Line 374
	jmp	$L1247
; Line 376
$L1252:
; Line 379
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	push	eax
	call	_rtx_alloc
	add	esp, 4
	mov	DWORD PTR _copy$[ebp], eax
; Line 380
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_copy_for_inline
	add	esp, 4
	mov	ecx, DWORD PTR _copy$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 381
	mov	eax, DWORD PTR _copy$[ebp]
	mov	DWORD PTR [eax+20], -1
; Line 382
	mov	eax, DWORD PTR _copy$[ebp]
	mov	DWORD PTR [eax+24], 0
; Line 383
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shr	eax, 30					; 0000001eH
	and	eax, 1
	shl	eax, 30					; 0000001eH
	mov	ecx, DWORD PTR _copy$[ebp]
	mov	ecx, DWORD PTR [ecx]
	and	ecx, -1073741825			; bfffffffH
	or	eax, ecx
	mov	ecx, DWORD PTR _copy$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 384
	jmp	$L1247
; Line 386
$L1253:
; Line 387
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _label_map$S1195
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _copy$[ebp], eax
; Line 388
	jmp	$L1247
; Line 390
$L1254:
; Line 391
	push	16					; 00000010H
	call	_rtx_alloc
	add	esp, 4
	mov	DWORD PTR _copy$[ebp], eax
; Line 392
	jmp	$L1247
; Line 394
$L1255:
; Line 395
	call	_abort
; Line 396
	jmp	$L1247
$L1246:
	cmp	DWORD PTR -60+[ebp], 13			; 0000000dH
	jl	$L1255
	cmp	DWORD PTR -60+[ebp], 15			; 0000000fH
	jle	$L1252
	cmp	DWORD PTR -60+[ebp], 16			; 00000010H
	je	$L1254
	cmp	DWORD PTR -60+[ebp], 17			; 00000011H
	je	$L1253
	cmp	DWORD PTR -60+[ebp], 18			; 00000012H
	je	$L1250
	jmp	$L1255
$L1247:
; Line 397
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _copy$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 398
	mov	eax, DWORD PTR _copy$[ebp]
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	mov	edx, DWORD PTR _insn_map$S1196
	mov	DWORD PTR [edx+ecx*4], eax
; Line 399
	mov	eax, DWORD PTR _copy$[ebp]
	mov	ecx, DWORD PTR _last_insn$[ebp]
	mov	DWORD PTR [ecx+12], eax
; Line 400
	mov	eax, DWORD PTR _last_insn$[ebp]
	mov	ecx, DWORD PTR _copy$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 401
	mov	eax, DWORD PTR _copy$[ebp]
	mov	DWORD PTR _last_insn$[ebp], eax
; Line 402
	jmp	$L1244
$L1245:
; Line 406
	call	_get_insns
	mov	DWORD PTR _insn$[ebp], eax
	jmp	$L1256
$L1257:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _insn$[ebp], eax
$L1256:
	cmp	DWORD PTR _insn$[ebp], 0
	je	$L1258
; Line 408
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 851968				; 000d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1260
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 917504				; 000e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1260
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 983040				; 000f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1259
$L1260:
; Line 410
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _insn_map$S1196
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _copy$1261[ebp], eax
; Line 411
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	call	_copy_for_inline
	add	esp, 4
	mov	ecx, DWORD PTR _copy$1261[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 414
$L1259:
	jmp	$L1257
$L1258:
	mov	eax, DWORD PTR _last_insn$[ebp]
	mov	DWORD PTR [eax+12], 0
; Line 416
	call	_get_first_nonparm_insn
	mov	ecx, DWORD PTR _head$[ebp]
	mov	DWORD PTR [ecx+12], eax
; Line 417
	call	_get_insns
	mov	ecx, DWORD PTR _head$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 418
	mov	eax, DWORD PTR _head$[ebp]
	mov	ecx, DWORD PTR _fndecl$[ebp]
	mov	DWORD PTR [ecx+84], eax
; Line 419
	call	_get_frame_size
	mov	ecx, DWORD PTR _fndecl$[ebp]
	mov	DWORD PTR [ecx+80], eax
; Line 420
	mov	eax, DWORD PTR _fndecl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	or	eax, 16384				; 00004000H
	mov	ecx, DWORD PTR _fndecl$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 422
	mov	DWORD PTR _parmdecl_map$S1197, 0
; Line 423
	mov	DWORD PTR _label_map$S1195, 0
; Line 424
	mov	DWORD PTR _reg_map$S1194, 0
; Line 425
	mov	DWORD PTR _return_label, 0
; Line 427
	mov	eax, DWORD PTR _last_insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _first_insn$[ebp]
	push	eax
	call	_set_new_first_and_last_insn
	add	esp, 8
; Line 428
$L1204:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_save_for_inline ENDP
_TEXT	ENDS
EXTRN	_rtx_format:BYTE
EXTRN	_gen_rtx:NEAR
EXTRN	_gen_rtvec_v:NEAR
_BSS	SEGMENT
_copy_asm_constraints_vector$S1153 DD 01H DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
_dest$1286 = -20
_j$1299 = -24
_orig$ = 8
_x$ = -16
_i$ = -8
_code$ = -12
_format_ptr$ = -4
_copy_for_inline PROC NEAR
; Line 438
	push	ebp
	mov	ebp, esp
	sub	esp, 36					; 00000024H
	push	ebx
	push	esi
	push	edi
; Line 439
	mov	eax, DWORD PTR _orig$[ebp]
	mov	DWORD PTR _x$[ebp], eax
; Line 444
	cmp	DWORD PTR _x$[ebp], 0
	jne	$L1270
; Line 445
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L1265
; Line 447
$L1270:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$[ebp], eax
; Line 451
	mov	eax, DWORD PTR _code$[ebp]
	mov	DWORD PTR -32+[ebp], eax
	jmp	$L1271
; Line 453
$L1275:
; Line 459
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L1265
; Line 461
$L1276:
; Line 465
	mov	eax, DWORD PTR _orig$[ebp]
	mov	ecx, DWORD PTR _orig_asm_operands_vector$S1151
	cmp	DWORD PTR [eax+16], ecx
	jne	$L1277
; Line 467
	push	22					; 00000016H
	call	_rtx_alloc
	add	esp, 4
	mov	DWORD PTR _x$[ebp], eax
; Line 468
	mov	eax, DWORD PTR _orig$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 469
	mov	eax, DWORD PTR _orig$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 470
	mov	eax, DWORD PTR _orig$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [ecx+12], eax
; Line 471
	mov	eax, DWORD PTR _copy_asm_operands_vector$S1152
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 472
	mov	eax, DWORD PTR _copy_asm_constraints_vector$S1153
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [ecx+20], eax
; Line 473
	mov	eax, DWORD PTR _orig$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [ecx+24], eax
; Line 474
	mov	eax, DWORD PTR _orig$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 475
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L1265
; Line 477
$L1277:
	jmp	$L1272
; Line 479
$L1278:
; Line 482
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1280
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1280
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1280
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1279
$L1280:
; Line 483
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L1265
; Line 504
$L1279:
	jmp	$L1272
; Line 506
$L1281:
; Line 510
	mov	eax, DWORD PTR _orig$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _label_map$S1195
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	mov	eax, DWORD PTR _orig$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	38					; 00000026H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	jmp	$L1265
; Line 513
$L1282:
; Line 514
	mov	eax, DWORD PTR _x$[ebp]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L1283
; Line 515
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg_map$S1194
	mov	eax, DWORD PTR [ecx+eax*4]
	jmp	$L1265
; Line 516
	jmp	$L1284
$L1283:
; Line 517
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L1265
$L1284:
; Line 521
$L1285:
; Line 523
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _dest$1286[ebp], eax
; Line 528
	mov	eax, DWORD PTR _dest$1286[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1287
	mov	eax, DWORD PTR _dest$1286[ebp]
	mov	ecx, DWORD PTR _max_parm_reg$S1198
	cmp	DWORD PTR [eax+4], ecx
	jge	$L1287
	mov	eax, DWORD PTR _dest$1286[ebp]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L1287
	mov	eax, DWORD PTR _dest$1286[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _parmdecl_map$S1197
	cmp	DWORD PTR [ecx+eax*4], 0
	je	$L1287
; Line 529
	mov	eax, DWORD PTR _dest$1286[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _parmdecl_map$S1197
	mov	eax, DWORD PTR [ecx+eax*4]
	and	DWORD PTR [eax+16], -33			; ffffffdfH
; Line 530
$L1287:
; Line 531
	jmp	$L1272
; Line 532
	jmp	$L1272
$L1271:
	sub	DWORD PTR -32+[ebp], 22			; 00000016H
	cmp	DWORD PTR -32+[ebp], 19			; 00000013H
	ja	$L1272
	shl	DWORD PTR -32+[ebp], 2
	mov	eax, DWORD PTR -32+[ebp]
	jmp	DWORD PTR $L1771[eax]
$L1771:
	DD	OFFSET $L1276
	DD	OFFSET $L1272
	DD	OFFSET $L1272
	DD	OFFSET $L1285
	DD	OFFSET $L1272
	DD	OFFSET $L1272
	DD	OFFSET $L1272
	DD	OFFSET $L1272
	DD	OFFSET $L1275
	DD	OFFSET $L1275
	DD	OFFSET $L1272
	DD	OFFSET $L1275
	DD	OFFSET $L1282
	DD	OFFSET $L1272
	DD	OFFSET $L1272
	DD	OFFSET $L1278
	DD	OFFSET $L1281
	DD	OFFSET $L1275
	DD	OFFSET $L1275
	DD	OFFSET $L1275
$L1272:
; Line 536
	mov	eax, DWORD PTR _code$[ebp]
	push	eax
	call	_rtx_alloc
	add	esp, 4
	mov	DWORD PTR _x$[ebp], eax
; Line 538
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_length[eax*4]
	shl	eax, 2
	add	eax, 4
	push	eax
	mov	eax, DWORD PTR _orig$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
; Line 545
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_format[eax*4]
	mov	DWORD PTR _format_ptr$[ebp], eax
; Line 547
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L1288
$L1289:
	inc	DWORD PTR _i$[ebp]
$L1288:
	mov	eax, DWORD PTR _code$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _rtx_length[eax*4], ecx
	jle	$L1290
; Line 549
	mov	eax, DWORD PTR _format_ptr$[ebp]
	mov	DWORD PTR -28+[ebp], eax
	inc	DWORD PTR _format_ptr$[ebp]
	mov	eax, DWORD PTR -28+[ebp]
	movsx	eax, BYTE PTR [eax]
	mov	DWORD PTR -36+[ebp], eax
	jmp	$L1291
; Line 551
$L1295:
; Line 552
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	push	eax
	call	_copy_for_inline
	add	esp, 4
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [edx+ecx*4+4], eax
; Line 553
	jmp	$L1292
; Line 555
$L1296:
; Line 558
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _insn_map$S1196
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [edx+ecx*4+4], eax
; Line 559
	jmp	$L1292
; Line 561
$L1297:
; Line 562
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	cmp	DWORD PTR [ecx+eax*4+4], 0
	je	$L1298
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	cmp	DWORD PTR [eax], 0
	je	$L1298
; Line 566
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	add	eax, 4
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_gen_rtvec_v
	add	esp, 8
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [edx+ecx*4+4], eax
; Line 567
	mov	DWORD PTR _j$1299[ebp], 0
	jmp	$L1300
$L1301:
	inc	DWORD PTR _j$1299[ebp]
$L1300:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$1299[ebp]
	cmp	DWORD PTR [eax], ecx
	jbe	$L1302
; Line 569
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$1299[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	push	eax
	call	_copy_for_inline
	add	esp, 4
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR [edx+ecx*4+4]
	mov	edx, DWORD PTR _j$1299[ebp]
	mov	DWORD PTR [ecx+edx*4+4], eax
	jmp	$L1301
$L1302:
; Line 571
$L1298:
	jmp	$L1292
; Line 572
	jmp	$L1292
$L1291:
	cmp	DWORD PTR -36+[ebp], 69			; 00000045H
	je	$L1297
	cmp	DWORD PTR -36+[ebp], 101		; 00000065H
	je	$L1295
	cmp	DWORD PTR -36+[ebp], 117		; 00000075H
	je	$L1296
	jmp	$L1292
$L1292:
; Line 573
	jmp	$L1289
$L1290:
; Line 575
	cmp	DWORD PTR _code$[ebp], 22		; 00000016H
	jne	$L1303
	cmp	DWORD PTR _orig_asm_operands_vector$S1151, 0
	jne	$L1303
; Line 577
	mov	eax, DWORD PTR _orig$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _orig_asm_operands_vector$S1151, eax
; Line 578
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _copy_asm_operands_vector$S1152, eax
; Line 579
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _copy_asm_constraints_vector$S1153, eax
; Line 582
$L1303:
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L1265
; Line 583
$L1265:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_copy_for_inline ENDP
_TEXT	ENDS
PUBLIC	_expand_inline_function
EXTRN	_stack_pointer_rtx:DWORD
EXTRN	_gen_move_insn:NEAR
EXTRN	_frame_pointer_rtx:DWORD
EXTRN	_int_size_in_bytes:NEAR
EXTRN	_build_int_2:NEAR
EXTRN	_memory_address_p:NEAR
EXTRN	_struct_value_rtx:DWORD
EXTRN	_struct_value_incoming_rtx:DWORD
EXTRN	_store_expr:NEAR
EXTRN	_error_mark_node:DWORD
EXTRN	_convert_to_mode:NEAR
EXTRN	_find_reg_note:NEAR
EXTRN	_copy_rtx:NEAR
EXTRN	_input_filename:DWORD
EXTRN	_gen_reg_rtx:NEAR
EXTRN	_lineno:DWORD
EXTRN	_do_pending_stack_adjust:NEAR
EXTRN	_change_address:NEAR
EXTRN	_rtx_equal_p:NEAR
EXTRN	_copy_to_reg:NEAR
EXTRN	_memory_address:NEAR
EXTRN	_copy_to_mode_reg:NEAR
EXTRN	_expand_expr:NEAR
EXTRN	_emit_jump:NEAR
EXTRN	_assign_stack_local:NEAR
EXTRN	_emit_queue:NEAR
EXTRN	_emit_insn:NEAR
EXTRN	_getdecls:NEAR
EXTRN	_emit_jump_insn:NEAR
EXTRN	_emit_call_insn:NEAR
EXTRN	_emit_barrier:NEAR
EXTRN	_expand_start_bindings:NEAR
EXTRN	_tree_cons:NEAR
EXTRN	_expand_end_bindings:NEAR
EXTRN	_emit_note:NEAR
EXTRN	_emit_line_note:NEAR
EXTRN	_plus_constant:NEAR
EXTRN	_poplevel:NEAR
EXTRN	_pushlevel:NEAR
EXTRN	_cc0_rtx:DWORD
_BSS	SEGMENT
_first_parm_offset$S1199 DD 01H DUP (?)
_inline_target$S1145 DD 01H DUP (?)
_inline_fp_rtx$S1146 DD 01H DUP (?)
_parm_map$S1147 DD 01H DUP (?)
_parm_map_size$S1148 DD 01H DUP (?)
_fp_delta$S1150 DD 01H DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
_imode$1344 = -84
_copy$1345 = -88
_copy$1410 = -132
_pattern$1411 = -124
_size$1347 = -92
_next$1412 = -128
_note$1428 = -136
_decl$1364 = -96
_fndecl$ = 8
_parms$ = 12
_frtx$1370 = -100
_target$ = 16
_offset$1371 = -104
_ignore$ = 20
_type$ = 24
_structure_value_addr$ = 28
_formal$ = -8
_actual$ = -24
_header$ = -12
_insns$ = -64
_parm_insns$ = -56
_insn$ = -44
_max_regno$ = -52
_i$ = -28
_min_labelno$ = -48
_max_labelno$ = -40
_nargs$ = -36
_arg_vec$ = -16
_local_return_label$ = -4
_follows_call$ = -32
_this_struct_value_rtx$ = -60
_must_load_parms$ = -20
_departing_mode$1397 = -112
_arg$1333 = -72
_arriving_mode$1398 = -108
_mode$1334 = -68
_dest$1405 = -120
_parm_num$1406 = -116
_arg$1342 = -80
_tmode$1343 = -76
_expand_inline_function PROC NEAR
; Line 605
	push	ebp
	mov	ebp, esp
	sub	esp, 140				; 0000008cH
	push	ebx
	push	esi
	push	edi
; Line 607
	mov	eax, DWORD PTR _fndecl$[ebp]
	mov	eax, DWORD PTR [eax+84]
	mov	DWORD PTR _header$[ebp], eax
; Line 608
	mov	eax, DWORD PTR _header$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _insns$[ebp], eax
; Line 609
	mov	eax, DWORD PTR _header$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _parm_insns$[ebp], eax
; Line 611
	mov	eax, DWORD PTR _header$[ebp]
	mov	eax, DWORD PTR [eax+32]
	inc	eax
	mov	DWORD PTR _max_regno$[ebp], eax
; Line 613
	mov	eax, DWORD PTR _header$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _min_labelno$[ebp], eax
; Line 614
	mov	eax, DWORD PTR _header$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _max_labelno$[ebp], eax
; Line 617
	mov	DWORD PTR _local_return_label$[ebp], 0
; Line 618
	mov	DWORD PTR _follows_call$[ebp], 0
; Line 619
	mov	DWORD PTR _this_struct_value_rtx$[ebp], 0
; Line 621
	mov	DWORD PTR _must_load_parms$[ebp], 0
; Line 623
	cmp	DWORD PTR _max_regno$[ebp], 10		; 0000000aH
	jge	$L1328
; Line 624
	call	_abort
; Line 626
$L1328:
	mov	eax, DWORD PTR _fndecl$[ebp]
	mov	eax, DWORD PTR [eax+56]
	push	eax
	call	_list_length
	add	esp, 4
	mov	DWORD PTR _nargs$[ebp], eax
; Line 629
	mov	eax, DWORD PTR _parms$[ebp]
	push	eax
	call	_list_length
	add	esp, 4
	cmp	eax, DWORD PTR _nargs$[ebp]
	je	$L1329
; Line 630
	mov	eax, -1
	jmp	$L1311
; Line 634
$L1329:
; Line 638
	mov	eax, DWORD PTR _fndecl$[ebp]
	mov	eax, DWORD PTR [eax+56]
	mov	DWORD PTR _formal$[ebp], eax
	mov	eax, DWORD PTR _parms$[ebp]
	mov	DWORD PTR _actual$[ebp], eax
	jmp	$L1330
$L1331:
	mov	eax, DWORD PTR _formal$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _formal$[ebp], eax
	mov	eax, DWORD PTR _actual$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _actual$[ebp], eax
$L1330:
	cmp	DWORD PTR _formal$[ebp], 0
	je	$L1332
; Line 640
	mov	eax, DWORD PTR _actual$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _arg$1333[ebp], eax
; Line 641
	mov	eax, DWORD PTR _formal$[ebp]
	mov	eax, DWORD PTR [eax+56]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	sar	eax, 24					; 00000018H
	mov	DWORD PTR _mode$1334[ebp], eax
; Line 642
	mov	eax, DWORD PTR _arg$1333[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	sar	eax, 24					; 00000018H
	cmp	eax, DWORD PTR _mode$1334[ebp]
	je	$L1335
; Line 643
	mov	eax, -1
	jmp	$L1311
; Line 645
$L1335:
	cmp	DWORD PTR _mode$1334[ebp], 26		; 0000001aH
	jne	$L1336
	mov	eax, DWORD PTR _formal$[ebp]
	mov	ecx, DWORD PTR _arg$1333[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	cmp	DWORD PTR [eax+8], ecx
	je	$L1336
; Line 646
	mov	eax, -1
	jmp	$L1311
; Line 647
$L1336:
	jmp	$L1331
$L1332:
; Line 652
	push	0
	call	_pushlevel
	add	esp, 4
; Line 655
	push	0
	call	_pushlevel
	add	esp, 4
; Line 656
	push	0
	call	_expand_start_bindings
	add	esp, 4
; Line 658
	mov	eax, DWORD PTR _parm_insns$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1179648				; 00120000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1338
	mov	eax, DWORD PTR _parm_insns$[ebp]
	cmp	DWORD PTR [eax+20], 0
	jge	$L1338
; Line 659
	mov	eax, DWORD PTR _parm_insns$[ebp]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	mov	eax, DWORD PTR _parm_insns$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_emit_note
	add	esp, 8
; Line 663
$L1338:
	mov	eax, DWORD PTR _nargs$[ebp]
	shl	eax, 2
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _arg_vec$[ebp], eax
; Line 671
	mov	eax, DWORD PTR _fndecl$[ebp]
	mov	eax, DWORD PTR [eax+56]
	mov	DWORD PTR _formal$[ebp], eax
	mov	eax, DWORD PTR _parms$[ebp]
	mov	DWORD PTR _actual$[ebp], eax
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L1339
$L1340:
	mov	eax, DWORD PTR _formal$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _formal$[ebp], eax
	mov	eax, DWORD PTR _actual$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _actual$[ebp], eax
	inc	DWORD PTR _i$[ebp]
$L1339:
	cmp	DWORD PTR _formal$[ebp], 0
	je	$L1341
; Line 674
	mov	eax, DWORD PTR _actual$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _arg$1342[ebp], eax
; Line 676
	mov	eax, DWORD PTR _formal$[ebp]
	mov	eax, DWORD PTR [eax+56]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	sar	eax, 24					; 00000018H
	mov	DWORD PTR _tmode$1343[ebp], eax
; Line 678
	mov	eax, DWORD PTR _formal$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	sar	eax, 24					; 00000018H
	mov	DWORD PTR _imode$1344[ebp], eax
; Line 681
	mov	eax, DWORD PTR _formal$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	mov	eax, DWORD PTR _formal$[ebp]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	call	_emit_note
	add	esp, 8
; Line 685
	mov	eax, DWORD PTR _formal$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 9
	test	al, 1
	je	$L1346
; Line 687
	mov	eax, DWORD PTR _formal$[ebp]
	mov	eax, DWORD PTR [eax+56]
	push	eax
	call	_int_size_in_bytes
	add	esp, 4
	mov	DWORD PTR _size$1347[ebp], eax
; Line 688
	mov	eax, DWORD PTR _size$1347[ebp]
	push	eax
	mov	eax, DWORD PTR _tmode$1343[ebp]
	push	eax
	call	_assign_stack_local
	add	esp, 8
	mov	DWORD PTR _copy$1345[ebp], eax
; Line 689
	mov	eax, DWORD PTR _copy$1345[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _formal$[ebp]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	sar	eax, 24					; 00000018H
	push	eax
	call	_memory_address_p
	add	esp, 8
	or	eax, eax
	jne	$L1350
; Line 690
	mov	eax, DWORD PTR _copy$1345[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_copy_rtx
	add	esp, 4
	push	eax
	push	0
	mov	eax, DWORD PTR _copy$1345[ebp]
	push	eax
	call	_change_address
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _copy$1345[ebp], eax
; Line 691
$L1350:
	push	0
	mov	eax, DWORD PTR _copy$1345[ebp]
	push	eax
	mov	eax, DWORD PTR _arg$1342[ebp]
	push	eax
	call	_store_expr
	add	esp, 12					; 0000000cH
; Line 693
	jmp	$L1352
$L1346:
; Line 694
	mov	eax, DWORD PTR _formal$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 5
	test	al, 1
	je	$L1354
	mov	eax, DWORD PTR _formal$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 3
	test	al, 1
	je	$L1353
$L1354:
; Line 699
	mov	eax, DWORD PTR _tmode$1343[ebp]
	push	eax
	call	_gen_reg_rtx
	add	esp, 4
	mov	DWORD PTR _copy$1345[ebp], eax
; Line 700
	mov	eax, DWORD PTR _copy$1345[ebp]
	mov	eax, DWORD PTR [eax]
	or	eax, 134217728				; 08000000H
	mov	ecx, DWORD PTR _copy$1345[ebp]
	mov	DWORD PTR [ecx], eax
; Line 701
	push	0
	mov	eax, DWORD PTR _copy$1345[ebp]
	push	eax
	mov	eax, DWORD PTR _arg$1342[ebp]
	push	eax
	call	_store_expr
	add	esp, 12					; 0000000cH
; Line 703
	jmp	$L1355
$L1353:
; Line 705
	push	0
	mov	eax, DWORD PTR _tmode$1343[ebp]
	push	eax
	push	0
	mov	eax, DWORD PTR _arg$1342[ebp]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	mov	DWORD PTR _copy$1345[ebp], eax
; Line 712
	mov	eax, DWORD PTR _copy$1345[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1356
	mov	eax, DWORD PTR _copy$1345[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1356
	mov	eax, DWORD PTR _copy$1345[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1356
	mov	eax, DWORD PTR _copy$1345[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1356
	mov	eax, DWORD PTR _copy$1345[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1356
; Line 713
	mov	eax, DWORD PTR _copy$1345[ebp]
	push	eax
	call	_copy_to_reg
	add	esp, 4
	mov	DWORD PTR _copy$1345[ebp], eax
; Line 714
$L1356:
$L1355:
$L1352:
; Line 717
	mov	eax, DWORD PTR _tmode$1343[ebp]
	cmp	DWORD PTR _imode$1344[ebp], eax
	je	$L1357
; Line 718
	push	0
	mov	eax, DWORD PTR _copy$1345[ebp]
	push	eax
	mov	eax, DWORD PTR _imode$1344[ebp]
	push	eax
	call	_convert_to_mode
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _copy$1345[ebp], eax
; Line 719
$L1357:
	mov	eax, DWORD PTR _copy$1345[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _arg_vec$[ebp]
	mov	DWORD PTR [edx+ecx*4], eax
; Line 720
	jmp	$L1340
$L1341:
; Line 722
	mov	eax, DWORD PTR _arg_vec$[ebp]
	push	eax
	mov	eax, DWORD PTR _fndecl$[ebp]
	mov	eax, DWORD PTR [eax+56]
	push	eax
	call	_copy_parm_decls
	add	esp, 8
; Line 725
	call	_emit_queue
; Line 728
	call	_do_pending_stack_adjust
; Line 731
	cmp	DWORD PTR _structure_value_addr$[ebp], 0
	je	$L1359
; Line 734
	mov	eax, DWORD PTR _structure_value_addr$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1360
	cmp	DWORD PTR _struct_value_rtx, 0
	je	$L1361
	mov	eax, DWORD PTR _struct_value_rtx
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1360
$L1361:
; Line 735
	mov	eax, DWORD PTR _structure_value_addr$[ebp]
	mov	DWORD PTR _this_struct_value_rtx$[ebp], eax
; Line 736
	jmp	$L1362
$L1360:
; Line 737
	mov	eax, DWORD PTR _structure_value_addr$[ebp]
	push	eax
	push	4
	call	_copy_to_mode_reg
	add	esp, 8
	mov	DWORD PTR _this_struct_value_rtx$[ebp], eax
$L1362:
; Line 744
$L1359:
	mov	eax, DWORD PTR _max_regno$[ebp]
	shl	eax, 2
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _reg_map$S1194, eax
; Line 745
	mov	eax, DWORD PTR _max_regno$[ebp]
	shl	eax, 2
	push	eax
	push	0
	mov	eax, DWORD PTR _reg_map$S1194
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 748
	mov	eax, DWORD PTR _header$[ebp]
	mov	eax, DWORD PTR [eax+36]
	add	eax, 3
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	mov	DWORD PTR _parm_map_size$S1148, eax
; Line 749
	mov	eax, DWORD PTR _parm_map_size$S1148
	shl	eax, 2
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _parm_map$S1147, eax
; Line 750
	mov	eax, DWORD PTR _parm_map_size$S1148
	shl	eax, 2
	push	eax
	push	0
	mov	eax, DWORD PTR _parm_map$S1147
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 753
	mov	DWORD PTR _first_parm_offset$S1199, 8
; Line 754
	sub	ecx, ecx
	mov	eax, DWORD PTR _first_parm_offset$S1199
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	shl	eax, 2
	sub	ecx, eax
	neg	ecx
	sub	DWORD PTR _parm_map$S1147, ecx
; Line 755
	mov	eax, DWORD PTR _first_parm_offset$S1199
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	add	DWORD PTR _parm_map_size$S1148, eax
; Line 757
	mov	eax, DWORD PTR _fndecl$[ebp]
	cmp	DWORD PTR [eax+56], 0
	je	$L1363
; Line 759
	mov	eax, DWORD PTR _fndecl$[ebp]
	mov	eax, DWORD PTR [eax+56]
	mov	DWORD PTR _decl$1364[ebp], eax
; Line 761
	mov	eax, DWORD PTR _decl$1364[ebp]
	mov	DWORD PTR _formal$[ebp], eax
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L1365
$L1366:
	mov	eax, DWORD PTR _formal$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _formal$[ebp], eax
	inc	DWORD PTR _i$[ebp]
$L1365:
	cmp	DWORD PTR _formal$[ebp], 0
	je	$L1367
; Line 765
	mov	eax, DWORD PTR _formal$[ebp]
	cmp	DWORD PTR [eax+48], 0
	jl	$L1368
; Line 768
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _arg_vec$[ebp]
	mov	ecx, DWORD PTR [ecx+eax*4]
	mov	eax, DWORD PTR _formal$[ebp]
	mov	eax, DWORD PTR [eax+48]
	cdq
	and	edx, 31					; 0000001fH
	add	eax, edx
	sar	eax, 5
	mov	edx, DWORD PTR _parm_map$S1147
	mov	DWORD PTR [edx+eax*4], ecx
; Line 770
	jmp	$L1369
$L1368:
; Line 774
	mov	eax, DWORD PTR _formal$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	DWORD PTR _frtx$1370[ebp], eax
; Line 775
	mov	DWORD PTR _offset$1371[ebp], 0
; Line 776
	mov	eax, DWORD PTR _frtx$1370[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1372
; Line 778
	mov	eax, DWORD PTR _frtx$1370[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _frtx$1370[ebp], eax
; Line 779
	mov	eax, DWORD PTR _frtx$1370[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1373
; Line 782
	mov	eax, DWORD PTR _frtx$1370[ebp]
	mov	ecx, DWORD PTR _frame_pointer_rtx
	cmp	DWORD PTR [eax+4], ecx
	jne	$L1374
	mov	eax, DWORD PTR _frtx$1370[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1374
; Line 783
	mov	eax, DWORD PTR _frtx$1370[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _offset$1371[ebp], eax
; Line 784
	jmp	$L1375
$L1374:
; Line 785
	mov	eax, DWORD PTR _frtx$1370[ebp]
	mov	ecx, DWORD PTR _frame_pointer_rtx
	cmp	DWORD PTR [eax+8], ecx
	jne	$L1376
	mov	eax, DWORD PTR _frtx$1370[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1376
; Line 786
	mov	eax, DWORD PTR _frtx$1370[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _offset$1371[ebp], eax
; Line 799
$L1376:
$L1375:
; Line 800
$L1373:
	cmp	DWORD PTR _offset$1371[ebp], 0
	je	$L1377
	mov	eax, DWORD PTR _offset$1371[ebp]
	mov	ecx, DWORD PTR _first_parm_offset$S1199
	cmp	DWORD PTR [eax+4], ecx
	jl	$L1377
; Line 801
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _arg_vec$[ebp]
	mov	ecx, DWORD PTR [ecx+eax*4]
	mov	eax, DWORD PTR _offset$1371[ebp]
	mov	eax, DWORD PTR [eax+4]
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	mov	edx, DWORD PTR _parm_map$S1147
	mov	DWORD PTR [edx+eax*4], ecx
; Line 802
	jmp	$L1378
$L1377:
	cmp	DWORD PTR _offset$1371[ebp], 0
	je	$L1379
; Line 805
	mov	eax, DWORD PTR _must_load_parms$[ebp]
	push	eax
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	call	_build_int_2
	add	esp, 8
	push	eax
	mov	eax, DWORD PTR _formal$[ebp]
	push	eax
	call	_tree_cons
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _must_load_parms$[ebp], eax
; Line 806
	jmp	$L1380
$L1379:
	mov	eax, DWORD PTR _formal$[ebp]
	mov	ecx, DWORD PTR _error_mark_node
	cmp	DWORD PTR [eax+8], ecx
	je	$L1381
; Line 807
	call	_abort
; Line 808
$L1381:
$L1380:
$L1378:
; Line 809
	jmp	$L1382
$L1372:
	mov	eax, DWORD PTR _frtx$1370[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1383
; Line 810
	call	_abort
; Line 811
$L1383:
$L1382:
$L1369:
; Line 814
	mov	eax, DWORD PTR _formal$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1384
; Line 815
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _arg_vec$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _formal$[ebp]
	mov	ecx, DWORD PTR [ecx+76]
	mov	ecx, DWORD PTR [ecx+4]
	mov	edx, DWORD PTR _reg_map$S1194
	mov	DWORD PTR [edx+ecx*4], eax
; Line 816
$L1384:
	jmp	$L1366
$L1367:
; Line 835
$L1363:
	cmp	DWORD PTR _this_struct_value_rtx$[ebp], 0
	jne	$L1385
; Line 837
	jmp	$L1386
$L1385:
	mov	eax, DWORD PTR _struct_value_incoming_rtx
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1387
; Line 839
	mov	eax, DWORD PTR _this_struct_value_rtx$[ebp]
	mov	ecx, DWORD PTR _fndecl$[ebp]
	mov	ecx, DWORD PTR [ecx+60]
	mov	ecx, DWORD PTR [ecx+76]
	mov	ecx, DWORD PTR [ecx+4]
	mov	ecx, DWORD PTR [ecx+4]
	mov	edx, DWORD PTR _reg_map$S1194
	mov	DWORD PTR [edx+ecx*4], eax
; Line 840
	jmp	$L1388
$L1387:
; Line 842
	mov	eax, DWORD PTR _struct_value_incoming_rtx
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1389
	mov	eax, DWORD PTR _struct_value_incoming_rtx
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _frame_pointer_rtx
	cmp	DWORD PTR [eax+4], ecx
	jne	$L1389
	mov	eax, DWORD PTR _struct_value_incoming_rtx
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1389
; Line 844
	mov	eax, DWORD PTR _this_struct_value_rtx$[ebp]
	mov	ecx, DWORD PTR _fndecl$[ebp]
	mov	ecx, DWORD PTR [ecx+60]
	mov	ecx, DWORD PTR [ecx+76]
	mov	ecx, DWORD PTR [ecx+4]
	mov	ecx, DWORD PTR [ecx+4]
	mov	edx, DWORD PTR _reg_map$S1194
	mov	DWORD PTR [edx+ecx*4], eax
; Line 849
	jmp	$L1390
$L1389:
; Line 850
	call	_abort
$L1390:
$L1388:
$L1386:
; Line 852
	mov	eax, DWORD PTR _max_labelno$[ebp]
	sub	eax, DWORD PTR _min_labelno$[ebp]
	shl	eax, 2
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _label_map$S1195, eax
; Line 853
	sub	eax, eax
	mov	ecx, DWORD PTR _min_labelno$[ebp]
	shl	ecx, 2
	sub	eax, ecx
	neg	eax
	sub	DWORD PTR _label_map$S1195, eax
; Line 855
	mov	eax, DWORD PTR _min_labelno$[ebp]
	mov	DWORD PTR _i$[ebp], eax
	jmp	$L1391
$L1392:
	inc	DWORD PTR _i$[ebp]
$L1391:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _max_labelno$[ebp], eax
	jle	$L1393
; Line 856
	call	_gen_label_rtx
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _label_map$S1195
	mov	DWORD PTR [edx+ecx*4], eax
	jmp	$L1392
$L1393:
; Line 861
	mov	eax, DWORD PTR _header$[ebp]
	mov	eax, DWORD PTR [eax+4]
	shl	eax, 2
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _insn_map$S1196, eax
; Line 862
	mov	eax, DWORD PTR _header$[ebp]
	mov	eax, DWORD PTR [eax+4]
	shl	eax, 2
	push	eax
	push	0
	mov	eax, DWORD PTR _insn_map$S1196
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 866
	cmp	DWORD PTR _this_struct_value_rtx$[ebp], 0
	jne	$L1395
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	and	eax, -16777216				; ff000000H
	sub	ecx, ecx
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1394
$L1395:
; Line 867
	mov	DWORD PTR _inline_target$S1145, 0
; Line 868
	jmp	$L1396
$L1394:
; Line 871
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	sar	eax, 24					; 00000018H
	mov	DWORD PTR _departing_mode$1397[ebp], eax
; Line 875
	mov	eax, DWORD PTR _fndecl$[ebp]
	mov	eax, DWORD PTR [eax+52]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	sar	eax, 24					; 00000018H
	mov	DWORD PTR _arriving_mode$1398[ebp], eax
; Line 881
	cmp	DWORD PTR _target$[ebp], 0
	je	$L1399
	mov	eax, DWORD PTR _target$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1399
	mov	eax, DWORD PTR _target$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	cmp	eax, DWORD PTR _departing_mode$1397[ebp]
	jne	$L1399
; Line 882
	mov	eax, DWORD PTR _target$[ebp]
	mov	DWORD PTR _inline_target$S1145, eax
; Line 883
	jmp	$L1400
$L1399:
; Line 884
	mov	eax, DWORD PTR _departing_mode$1397[ebp]
	push	eax
	call	_gen_reg_rtx
	add	esp, 4
	mov	DWORD PTR _target$[ebp], eax
	mov	eax, DWORD PTR _target$[ebp]
	mov	DWORD PTR _inline_target$S1145, eax
$L1400:
; Line 889
	mov	eax, DWORD PTR _departing_mode$1397[ebp]
	cmp	DWORD PTR _arriving_mode$1398[ebp], eax
	je	$L1401
; Line 890
	push	0
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	mov	eax, DWORD PTR _arriving_mode$1398[ebp]
	push	eax
	push	35					; 00000023H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	DWORD PTR _inline_target$S1145, eax
; Line 891
$L1401:
$L1396:
; Line 901
	call	_get_frame_size
	mov	DWORD PTR _fp_delta$S1150, eax
; Line 903
	mov	eax, DWORD PTR _fp_delta$S1150
	neg	eax
	mov	DWORD PTR _fp_delta$S1150, eax
; Line 908
	mov	eax, DWORD PTR _fp_delta$S1150
	push	eax
	mov	eax, DWORD PTR _frame_pointer_rtx
	push	eax
	call	_plus_constant
	add	esp, 8
	push	eax
	push	4
	call	_copy_to_mode_reg
	add	esp, 8
	mov	DWORD PTR _inline_fp_rtx$S1146, eax
; Line 912
	mov	eax, DWORD PTR _fndecl$[ebp]
	mov	eax, DWORD PTR [eax+80]
	push	eax
	push	0
	call	_assign_stack_local
	add	esp, 8
; Line 917
$L1403:
	cmp	DWORD PTR _must_load_parms$[ebp], 0
	je	$L1404
; Line 919
	mov	eax, DWORD PTR _must_load_parms$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	eax, DWORD PTR [eax+76]
	mov	DWORD PTR _dest$1405[ebp], eax
; Line 920
	mov	eax, DWORD PTR _must_load_parms$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _parm_num$1406[ebp], eax
; Line 922
	mov	eax, DWORD PTR _parm_num$1406[ebp]
	mov	ecx, DWORD PTR _arg_vec$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	mov	eax, DWORD PTR _dest$1405[ebp]
	push	eax
	call	_copy_rtx_and_substitute
	add	esp, 4
	push	eax
	call	_gen_move_insn
	add	esp, 8
	push	eax
	call	_emit_insn
	add	esp, 4
; Line 923
	mov	eax, DWORD PTR _must_load_parms$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _must_load_parms$[ebp], eax
; Line 924
	jmp	$L1403
$L1404:
; Line 928
	mov	eax, DWORD PTR _insns$[ebp]
	mov	DWORD PTR _insn$[ebp], eax
	jmp	$L1407
$L1408:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _insn$[ebp], eax
$L1407:
	cmp	DWORD PTR _insn$[ebp], 0
	je	$L1409
; Line 930
	mov	DWORD PTR _next$1412[ebp], 0
; Line 932
	mov	DWORD PTR _orig_asm_operands_vector$S1151, 0
; Line 933
	mov	DWORD PTR _copy_asm_operands_vector$S1152, 0
; Line 935
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR -140+[ebp], eax
	jmp	$L1413
; Line 937
$L1417:
; Line 938
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _pattern$1411[ebp], eax
; Line 952
	cmp	DWORD PTR _follows_call$[ebp], 0
	je	$L1418
	mov	eax, DWORD PTR _pattern$1411[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1419
	mov	eax, DWORD PTR _pattern$1411[ebp]
	mov	ecx, DWORD PTR _stack_pointer_rtx
	cmp	DWORD PTR [eax+4], ecx
	je	$L1418
$L1419:
; Line 955
	mov	eax, DWORD PTR _pattern$1411[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1420
	mov	eax, DWORD PTR _follows_call$[ebp]
	push	eax
	mov	eax, DWORD PTR _pattern$1411[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_rtx_equal_p
	add	esp, 8
	or	eax, eax
	je	$L1420
; Line 961
	mov	eax, DWORD PTR _follows_call$[ebp]
	push	eax
	mov	eax, DWORD PTR _pattern$1411[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_copy_rtx_and_substitute
	add	esp, 4
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	call	_emit_insn
	add	esp, 4
	mov	DWORD PTR _copy$1410[ebp], eax
; Line 962
	mov	eax, DWORD PTR _copy$1410[ebp]
	mov	eax, DWORD PTR [eax]
	or	eax, 1073741824				; 40000000H
	mov	ecx, DWORD PTR _copy$1410[ebp]
	mov	DWORD PTR [ecx], eax
; Line 963
	mov	DWORD PTR _follows_call$[ebp], 0
; Line 964
	jmp	$L1414
; Line 966
	jmp	$L1421
$L1420:
; Line 967
	mov	eax, DWORD PTR _pattern$1411[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1703936				; 001a0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1422
	mov	eax, DWORD PTR _follows_call$[ebp]
	push	eax
	mov	eax, DWORD PTR _pattern$1411[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_rtx_equal_p
	add	esp, 8
	or	eax, eax
	je	$L1422
; Line 973
	mov	eax, DWORD PTR _follows_call$[ebp]
	push	eax
	mov	eax, DWORD PTR _inline_target$S1145
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	call	_emit_insn
	add	esp, 4
	mov	DWORD PTR _copy$1410[ebp], eax
; Line 974
	mov	eax, DWORD PTR _copy$1410[ebp]
	mov	eax, DWORD PTR [eax]
	or	eax, 1073741824				; 40000000H
	mov	ecx, DWORD PTR _copy$1410[ebp]
	mov	DWORD PTR [ecx], eax
; Line 975
	mov	DWORD PTR _follows_call$[ebp], 0
; Line 976
	jmp	$L1414
; Line 979
$L1422:
$L1421:
	mov	DWORD PTR _follows_call$[ebp], 0
; Line 984
$L1418:
	mov	DWORD PTR _copy$1410[ebp], 0
; Line 987
	mov	eax, DWORD PTR _pattern$1411[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1703936				; 001a0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1423
	mov	eax, DWORD PTR _pattern$1411[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1423
	mov	eax, DWORD PTR _pattern$1411[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shr	eax, 30					; 0000001eH
	test	al, 1
	je	$L1423
; Line 988
	jmp	$L1414
; Line 990
$L1423:
; Line 993
	cmp	DWORD PTR _inline_target$S1145, 0
	jne	$L1424
	mov	eax, DWORD PTR _pattern$1411[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1424
	mov	eax, DWORD PTR _pattern$1411[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1424
	mov	eax, DWORD PTR _pattern$1411[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shr	eax, 30					; 0000001eH
	test	al, 1
	je	$L1424
; Line 994
	jmp	$L1414
; Line 999
$L1424:
; Line 1000
	mov	eax, DWORD PTR _pattern$1411[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1425
	mov	eax, DWORD PTR _pattern$1411[ebp]
	mov	ecx, DWORD PTR _cc0_rtx
	cmp	DWORD PTR [eax+4], ecx
	jne	$L1425
; Line 1001
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_try_fold_cc0
	add	esp, 4
	mov	DWORD PTR _next$1412[ebp], eax
; Line 1003
$L1425:
	cmp	DWORD PTR _next$1412[ebp], 0
	je	$L1426
; Line 1005
	mov	eax, DWORD PTR _next$1412[ebp]
	mov	DWORD PTR _insn$[ebp], eax
; Line 1007
	jmp	$L1427
$L1426:
; Line 1009
	push	0
	push	3
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_find_reg_note
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _note$1428[ebp], eax
; Line 1011
	mov	eax, DWORD PTR _pattern$1411[ebp]
	push	eax
	call	_copy_rtx_and_substitute
	add	esp, 4
	push	eax
	call	_emit_insn
	add	esp, 4
	mov	DWORD PTR _copy$1410[ebp], eax
; Line 1012
	mov	eax, DWORD PTR _copy$1410[ebp]
	mov	eax, DWORD PTR [eax]
	or	eax, 1073741824				; 40000000H
	mov	ecx, DWORD PTR _copy$1410[ebp]
	mov	DWORD PTR [ecx], eax
; Line 1016
	cmp	DWORD PTR _note$1428[ebp], 0
	je	$L1429
; Line 1019
	mov	eax, DWORD PTR _copy$1410[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	mov	eax, DWORD PTR _note$1428[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	3
	push	2
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	ecx, DWORD PTR _copy$1410[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 1020
$L1429:
$L1427:
; Line 1021
	jmp	$L1414
; Line 1023
$L1430:
; Line 1024
	mov	DWORD PTR _follows_call$[ebp], 0
; Line 1025
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1900544				; 001d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1431
; Line 1027
	cmp	DWORD PTR _local_return_label$[ebp], 0
	jne	$L1432
; Line 1028
	call	_gen_label_rtx
	mov	DWORD PTR _local_return_label$[ebp], eax
; Line 1029
$L1432:
	mov	eax, DWORD PTR _local_return_label$[ebp]
	push	eax
	call	_emit_jump
	add	esp, 4
; Line 1030
	jmp	$L1414
; Line 1032
$L1431:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_copy_rtx_and_substitute
	add	esp, 4
	push	eax
	call	_emit_jump_insn
	add	esp, 4
	mov	DWORD PTR _copy$1410[ebp], eax
; Line 1033
	mov	eax, DWORD PTR _copy$1410[ebp]
	mov	eax, DWORD PTR [eax]
	or	eax, 1073741824				; 40000000H
	mov	ecx, DWORD PTR _copy$1410[ebp]
	mov	DWORD PTR [ecx], eax
; Line 1034
	jmp	$L1414
; Line 1036
$L1434:
; Line 1070
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_copy_rtx_and_substitute
	add	esp, 4
	push	eax
	call	_emit_call_insn
	add	esp, 4
	mov	DWORD PTR _copy$1410[ebp], eax
; Line 1072
	mov	eax, DWORD PTR _copy$1410[ebp]
	mov	eax, DWORD PTR [eax]
	or	eax, 1073741824				; 40000000H
	mov	ecx, DWORD PTR _copy$1410[ebp]
	mov	DWORD PTR [ecx], eax
; Line 1075
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1435
; Line 1076
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _follows_call$[ebp], eax
; Line 1077
	jmp	$L1436
$L1435:
; Line 1078
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1310720				; 00140000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1437
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1437
; Line 1079
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _follows_call$[ebp], eax
; Line 1080
$L1437:
$L1436:
	jmp	$L1414
; Line 1082
$L1438:
; Line 1083
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _label_map$S1195
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	call	_emit_label
	add	esp, 4
	mov	DWORD PTR _copy$1410[ebp], eax
; Line 1084
	mov	DWORD PTR _follows_call$[ebp], 0
; Line 1085
	jmp	$L1414
; Line 1087
$L1439:
; Line 1088
	call	_emit_barrier
	mov	DWORD PTR _copy$1410[ebp], eax
; Line 1089
	jmp	$L1414
; Line 1091
$L1440:
; Line 1093
	mov	eax, DWORD PTR _insn$[ebp]
	cmp	DWORD PTR [eax+20], -6			; fffffffaH
	je	$L1441
	mov	eax, DWORD PTR _insn$[ebp]
	cmp	DWORD PTR [eax+20], 0
	je	$L1441
; Line 1094
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_emit_note
	add	esp, 8
	mov	DWORD PTR _copy$1410[ebp], eax
; Line 1095
	jmp	$L1442
$L1441:
; Line 1096
	mov	DWORD PTR _copy$1410[ebp], 0
$L1442:
; Line 1097
	jmp	$L1414
; Line 1099
$L1443:
; Line 1100
	call	_abort
; Line 1101
	jmp	$L1414
; Line 1102
	jmp	$L1414
$L1413:
	sub	DWORD PTR -140+[ebp], 13		; 0000000dH
	cmp	DWORD PTR -140+[ebp], 5
	ja	$L1443
	shl	DWORD PTR -140+[ebp], 2
	mov	eax, DWORD PTR -140+[ebp]
	jmp	DWORD PTR $L1772[eax]
$L1772:
	DD	OFFSET $L1417
	DD	OFFSET $L1430
	DD	OFFSET $L1434
	DD	OFFSET $L1439
	DD	OFFSET $L1438
	DD	OFFSET $L1440
$L1414:
; Line 1104
	mov	eax, DWORD PTR _copy$1410[ebp]
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	mov	edx, DWORD PTR _insn_map$S1196
	mov	DWORD PTR [edx+ecx*4], eax
; Line 1105
	jmp	$L1408
$L1409:
; Line 1107
	cmp	DWORD PTR _local_return_label$[ebp], 0
	je	$L1444
; Line 1108
	mov	eax, DWORD PTR _local_return_label$[ebp]
	push	eax
	call	_emit_label
	add	esp, 4
; Line 1112
$L1444:
	push	0
	mov	eax, DWORD PTR _fndecl$[ebp]
	mov	eax, DWORD PTR [eax+64]
	push	eax
	call	_copy_decl_tree
	add	esp, 8
; Line 1116
	push	1
	push	1
	call	_getdecls
	push	eax
	call	_expand_end_bindings
	add	esp, 12					; 0000000cH
; Line 1117
	push	0
	push	1
	push	1
	call	_poplevel
	add	esp, 12					; 0000000cH
; Line 1118
	push	0
	push	0
	push	0
	call	_poplevel
	add	esp, 12					; 0000000cH
; Line 1120
	mov	eax, DWORD PTR _lineno
	push	eax
	mov	eax, DWORD PTR _input_filename
	push	eax
	call	_emit_line_note
	add	esp, 8
; Line 1121
	mov	DWORD PTR _reg_map$S1194, 0
; Line 1122
	mov	DWORD PTR _label_map$S1195, 0
; Line 1124
	cmp	DWORD PTR _ignore$[ebp], 0
	jne	$L1447
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	and	eax, -16777216				; ff000000H
	sub	ecx, ecx
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1446
$L1447:
; Line 1125
	sub	eax, eax
	jmp	$L1311
; Line 1127
$L1446:
	cmp	DWORD PTR _structure_value_addr$[ebp], 0
	je	$L1448
; Line 1129
	cmp	DWORD PTR _target$[ebp], 0
	je	$L1449
; Line 1130
	mov	eax, DWORD PTR _target$[ebp]
	jmp	$L1311
; Line 1131
$L1449:
; Line 1132
	mov	eax, DWORD PTR _structure_value_addr$[ebp]
	push	eax
	push	26					; 0000001aH
	call	_memory_address
	add	esp, 8
	push	eax
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	sar	eax, 24					; 00000018H
	push	eax
	push	37					; 00000025H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	jmp	$L1311
; Line 1135
$L1448:
	mov	eax, DWORD PTR _target$[ebp]
	jmp	$L1311
; Line 1136
$L1311:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_expand_inline_function ENDP
_TEXT	ENDS
EXTRN	_build_decl:NEAR
EXTRN	_pushdecl:NEAR
_TEXT	SEGMENT
_args$ = 8
_vec$ = 12
_tail$ = -4
_i$ = -8
_decl$1458 = -12
_copy_parm_decls PROC NEAR
; Line 1146
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 1150
	mov	eax, DWORD PTR _args$[ebp]
	mov	DWORD PTR _tail$[ebp], eax
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L1455
$L1456:
	mov	eax, DWORD PTR _tail$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _tail$[ebp], eax
	inc	DWORD PTR _i$[ebp]
$L1455:
	cmp	DWORD PTR _tail$[ebp], 0
	je	$L1457
; Line 1153
	mov	eax, DWORD PTR _tail$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _tail$[ebp]
	mov	eax, DWORD PTR [eax+40]
	push	eax
	push	43					; 0000002bH
	call	_build_decl
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _decl$1458[ebp], eax
; Line 1155
	mov	eax, DWORD PTR _decl$1458[ebp]
	mov	eax, DWORD PTR [eax+16]
	or	eax, 32768				; 00008000H
	mov	ecx, DWORD PTR _decl$1458[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 1157
	mov	eax, DWORD PTR _decl$1458[ebp]
	mov	eax, DWORD PTR [eax+16]
	or	eax, 16384				; 00004000H
	mov	ecx, DWORD PTR _decl$1458[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 1158
	mov	eax, DWORD PTR _decl$1458[ebp]
	push	eax
	call	_pushdecl
	add	esp, 4
	mov	DWORD PTR _decl$1458[ebp], eax
; Line 1159
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _vec$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _decl$1458[ebp]
	mov	DWORD PTR [ecx+76], eax
; Line 1160
	jmp	$L1456
$L1457:
; Line 1161
$L1452:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_copy_parm_decls ENDP
_let$ = 8
_level$ = 12
_t$ = -4
_node$ = -8
_d$1467 = -12
_copy_decl_tree PROC NEAR
; Line 1171
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 1174
	push	0
	call	_pushlevel
	add	esp, 4
; Line 1176
	mov	eax, DWORD PTR _let$[ebp]
	mov	eax, DWORD PTR [eax+32]
	mov	DWORD PTR _t$[ebp], eax
	jmp	$L1464
$L1465:
	mov	eax, DWORD PTR _t$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _t$[ebp], eax
$L1464:
	cmp	DWORD PTR _t$[ebp], 0
	je	$L1466
; Line 1178
	mov	eax, DWORD PTR _t$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _t$[ebp]
	mov	eax, DWORD PTR [eax+40]
	push	eax
	mov	eax, DWORD PTR _t$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	push	eax
	call	_build_decl
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _d$1467[ebp], eax
; Line 1179
	mov	eax, DWORD PTR _t$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	ecx, DWORD PTR _d$1467[ebp]
	mov	DWORD PTR [ecx+24], eax
; Line 1180
	mov	eax, DWORD PTR _t$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	ecx, DWORD PTR _d$1467[ebp]
	mov	DWORD PTR [ecx+20], eax
; Line 1181
	mov	eax, DWORD PTR _t$[ebp]
	cmp	DWORD PTR [eax+76], 0
	je	$L1468
; Line 1184
	mov	eax, DWORD PTR _t$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1469
	mov	eax, DWORD PTR _t$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1470
	mov	eax, DWORD PTR _t$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1470
	mov	eax, DWORD PTR _t$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1470
	mov	eax, DWORD PTR _t$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1469
$L1470:
; Line 1188
	mov	eax, DWORD PTR _t$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	ecx, DWORD PTR _d$1467[ebp]
	mov	DWORD PTR [ecx+76], eax
; Line 1189
	jmp	$L1471
$L1469:
; Line 1190
	mov	eax, DWORD PTR _t$[ebp]
	mov	eax, DWORD PTR [eax+76]
	push	eax
	call	_copy_rtx_and_substitute
	add	esp, 4
	mov	ecx, DWORD PTR _d$1467[ebp]
	mov	DWORD PTR [ecx+76], eax
$L1471:
; Line 1192
$L1468:
	mov	eax, DWORD PTR _t$[ebp]
	mov	eax, DWORD PTR [eax+16]
	and	eax, 1
	mov	ecx, DWORD PTR _d$1467[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	and	ecx, -2					; fffffffeH
	or	eax, ecx
	mov	ecx, DWORD PTR _d$1467[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 1193
	mov	eax, DWORD PTR _t$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 2
	and	eax, 1
	shl	eax, 2
	mov	ecx, DWORD PTR _d$1467[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	and	ecx, -5					; fffffffbH
	or	eax, ecx
	mov	ecx, DWORD PTR _d$1467[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 1194
	mov	eax, DWORD PTR _t$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 1
	and	eax, 1
	add	eax, eax
	mov	ecx, DWORD PTR _d$1467[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	and	ecx, -3					; fffffffdH
	or	eax, ecx
	mov	ecx, DWORD PTR _d$1467[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 1195
	mov	eax, DWORD PTR _t$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 6
	and	eax, 1
	shl	eax, 6
	mov	ecx, DWORD PTR _d$1467[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	and	ecx, -65				; ffffffbfH
	or	eax, ecx
	mov	ecx, DWORD PTR _d$1467[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 1196
	mov	eax, DWORD PTR _t$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 9
	and	eax, 1
	shl	eax, 9
	mov	ecx, DWORD PTR _d$1467[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	and	ecx, -513				; fffffdffH
	or	eax, ecx
	mov	ecx, DWORD PTR _d$1467[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 1197
	mov	eax, DWORD PTR _t$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 5
	and	eax, 1
	shl	eax, 5
	mov	ecx, DWORD PTR _d$1467[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	and	ecx, -33				; ffffffdfH
	or	eax, ecx
	mov	ecx, DWORD PTR _d$1467[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 1198
	mov	eax, DWORD PTR _t$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 3
	and	eax, 1
	shl	eax, 3
	mov	ecx, DWORD PTR _d$1467[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	and	ecx, -9					; fffffff7H
	or	eax, ecx
	mov	ecx, DWORD PTR _d$1467[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 1200
	mov	eax, DWORD PTR _d$1467[ebp]
	mov	eax, DWORD PTR [eax+16]
	or	eax, 32768				; 00008000H
	mov	ecx, DWORD PTR _d$1467[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 1202
	mov	eax, DWORD PTR _d$1467[ebp]
	mov	eax, DWORD PTR [eax+16]
	or	eax, 16384				; 00004000H
	mov	ecx, DWORD PTR _d$1467[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 1203
	mov	eax, DWORD PTR _d$1467[ebp]
	push	eax
	call	_pushdecl
	add	esp, 4
; Line 1204
	jmp	$L1465
$L1466:
; Line 1206
	mov	eax, DWORD PTR _let$[ebp]
	mov	eax, DWORD PTR [eax+48]
	mov	DWORD PTR _t$[ebp], eax
	jmp	$L1472
$L1473:
	mov	eax, DWORD PTR _t$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _t$[ebp], eax
$L1472:
	cmp	DWORD PTR _t$[ebp], 0
	je	$L1474
; Line 1207
	mov	eax, DWORD PTR _level$[ebp]
	inc	eax
	push	eax
	mov	eax, DWORD PTR _t$[ebp]
	push	eax
	call	_copy_decl_tree
	add	esp, 8
	jmp	$L1473
$L1474:
; Line 1209
	push	0
	push	0
	cmp	DWORD PTR _level$[ebp], 0
	mov	eax, 0
	setg	al
	push	eax
	call	_poplevel
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _node$[ebp], eax
; Line 1210
	cmp	DWORD PTR _node$[ebp], 0
	je	$L1475
; Line 1211
	mov	eax, DWORD PTR _let$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 15					; 0000000fH
	and	eax, 1
	shl	eax, 15					; 0000000fH
	mov	ecx, DWORD PTR _node$[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	and	ecx, -32769				; ffff7fffH
	or	eax, ecx
	mov	ecx, DWORD PTR _node$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 1212
$L1475:
$L1461:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_copy_decl_tree ENDP
_TEXT	ENDS
EXTRN	_arg_pointer_rtx:DWORD
_TEXT	SEGMENT
_x$ = 8
_frame_pointer_sum_p PROC NEAR
; Line 1220
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1221
	mov	eax, DWORD PTR _x$[ebp]
	cmp	DWORD PTR _frame_pointer_rtx, eax
	je	$L1479
	mov	eax, DWORD PTR _x$[ebp]
	cmp	DWORD PTR _arg_pointer_rtx, eax
	jne	$L1478
$L1479:
; Line 1222
	mov	eax, 1
	jmp	$L1477
; Line 1223
$L1478:
; Line 1225
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1480
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_frame_pointer_sum_p
	add	esp, 4
	or	eax, eax
	jne	$L1481
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_frame_pointer_sum_p
	add	esp, 4
	or	eax, eax
	je	$L1480
$L1481:
; Line 1226
	mov	eax, 1
	jmp	$L1477
; Line 1228
$L1480:
	sub	eax, eax
	jmp	$L1477
; Line 1229
$L1477:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_frame_pointer_sum_p ENDP
_TEXT	ENDS
EXTRN	_rtvec_alloc:NEAR
EXTRN	_reg_mentioned_p:NEAR
EXTRN	_force_reg:NEAR
_TEXT	SEGMENT
_reg$1541 = -44
_c$1546 = -48
_orig$ = 8
_copy$ = -32
_temp$ = -16
_i$ = -24
_j$ = -8
_code$ = -28
_mode$ = -12
_format_ptr$ = -20
_regno$ = -4
_left$1562 = -52
_right$1563 = -56
_reg$1516 = -36
_c$1521 = -40
_copy_rtx_and_substitute PROC NEAR
; Line 1238
	push	ebp
	mov	ebp, esp
	sub	esp, 68					; 00000044H
	push	ebx
	push	esi
	push	edi
; Line 1246
	cmp	DWORD PTR _orig$[ebp], 0
	jne	$L1492
; Line 1247
	sub	eax, eax
	jmp	$L1483
; Line 1249
$L1492:
	mov	eax, DWORD PTR _orig$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$[ebp], eax
; Line 1250
	mov	eax, DWORD PTR _orig$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	mov	DWORD PTR _mode$[ebp], eax
; Line 1252
	mov	eax, DWORD PTR _code$[ebp]
	mov	DWORD PTR -64+[ebp], eax
	jmp	$L1493
; Line 1254
$L1497:
; Line 1261
	mov	eax, DWORD PTR _orig$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _regno$[ebp], eax
; Line 1262
	cmp	DWORD PTR _regno$[ebp], 10		; 0000000aH
	jge	$L1498
; Line 1266
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _reg_map$S1194
	cmp	DWORD PTR [ecx+eax*4], 0
	je	$L1499
; Line 1267
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _reg_map$S1194
	mov	eax, DWORD PTR [ecx+eax*4]
	jmp	$L1483
; Line 1268
$L1499:
	mov	eax, DWORD PTR _orig$[ebp]
	mov	eax, DWORD PTR [eax]
	shr	eax, 30					; 0000001eH
	test	al, 1
	je	$L1500
; Line 1275
	cmp	DWORD PTR _inline_target$S1145, 0
	jne	$L1501
; Line 1276
	call	_abort
; Line 1277
$L1501:
	mov	eax, DWORD PTR _inline_target$S1145
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	cmp	eax, DWORD PTR _mode$[ebp]
	jne	$L1502
; Line 1278
	mov	eax, DWORD PTR _inline_target$S1145
	jmp	$L1483
; Line 1279
$L1502:
	push	0
	mov	eax, DWORD PTR _inline_target$S1145
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	push	35					; 00000023H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L1483
; Line 1281
$L1500:
	cmp	DWORD PTR _regno$[ebp], 6
	jne	$L1503
; Line 1282
	mov	eax, DWORD PTR _fp_delta$S1150
	push	eax
	mov	eax, DWORD PTR _orig$[ebp]
	push	eax
	call	_plus_constant
	add	esp, 8
	jmp	$L1483
; Line 1283
$L1503:
	mov	eax, DWORD PTR _orig$[ebp]
	jmp	$L1483
; Line 1285
$L1498:
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _reg_map$S1194
	cmp	DWORD PTR [ecx+eax*4], 0
	jne	$L1504
; Line 1287
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_gen_reg_rtx
	add	esp, 4
	mov	ecx, DWORD PTR _regno$[ebp]
	mov	edx, DWORD PTR _reg_map$S1194
	mov	DWORD PTR [edx+ecx*4], eax
; Line 1288
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _reg_map$S1194
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	eax, DWORD PTR [eax]
	and	eax, -134217729				; f7ffffffH
	mov	ecx, DWORD PTR _orig$[ebp]
	mov	ecx, DWORD PTR [ecx]
	shr	ecx, 27					; 0000001bH
	and	ecx, 1
	shl	ecx, 27					; 0000001bH
	or	eax, ecx
	mov	ecx, DWORD PTR _regno$[ebp]
	mov	edx, DWORD PTR _reg_map$S1194
	mov	ecx, DWORD PTR [edx+ecx*4]
	mov	DWORD PTR [ecx], eax
; Line 1290
$L1504:
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _reg_map$S1194
	mov	eax, DWORD PTR [ecx+eax*4]
	jmp	$L1483
; Line 1292
$L1505:
; Line 1293
	mov	eax, DWORD PTR _orig$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_copy_rtx_and_substitute
	add	esp, 4
	mov	DWORD PTR _copy$[ebp], eax
; Line 1295
	mov	eax, DWORD PTR _copy$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1506
; Line 1297
	mov	eax, DWORD PTR _copy$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _orig$[ebp]
	add	eax, DWORD PTR [ecx+8]
	push	eax
	mov	eax, DWORD PTR _copy$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _orig$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	35					; 00000023H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L1483
; Line 1298
$L1506:
; Line 1299
	mov	eax, DWORD PTR _orig$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _copy$[ebp]
	push	eax
	mov	eax, DWORD PTR _orig$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	35					; 00000023H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L1483
; Line 1301
$L1507:
; Line 1302
	mov	eax, DWORD PTR _orig$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _label_map$S1195
	mov	eax, DWORD PTR [ecx+eax*4]
	jmp	$L1483
; Line 1304
$L1508:
; Line 1305
	push	38					; 00000026H
	call	_rtx_alloc
	add	esp, 4
	mov	DWORD PTR _copy$[ebp], eax
; Line 1306
	mov	eax, DWORD PTR _copy$[ebp]
	mov	eax, DWORD PTR [eax]
	and	eax, -16711681				; ff00ffffH
	mov	ecx, DWORD PTR _mode$[ebp]
	and	ecx, 255				; 000000ffH
	shl	ecx, 16					; 00000010H
	or	eax, ecx
	mov	ecx, DWORD PTR _copy$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 1307
	mov	eax, DWORD PTR _orig$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _label_map$S1195
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _copy$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 1308
	mov	eax, DWORD PTR _copy$[ebp]
	jmp	$L1483
; Line 1310
$L1509:
; Line 1315
	mov	eax, DWORD PTR _orig$[ebp]
	jmp	$L1483
; Line 1317
$L1510:
; Line 1321
	mov	eax, DWORD PTR _orig$[ebp]
	mov	ecx, DWORD PTR _orig_asm_operands_vector$S1151
	cmp	DWORD PTR [eax+16], ecx
	jne	$L1511
; Line 1323
	push	22					; 00000016H
	call	_rtx_alloc
	add	esp, 4
	mov	DWORD PTR _copy$[ebp], eax
; Line 1324
	mov	eax, DWORD PTR _orig$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _copy$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 1325
	mov	eax, DWORD PTR _orig$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _copy$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 1326
	mov	eax, DWORD PTR _orig$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	ecx, DWORD PTR _copy$[ebp]
	mov	DWORD PTR [ecx+12], eax
; Line 1327
	mov	eax, DWORD PTR _copy_asm_operands_vector$S1152
	mov	ecx, DWORD PTR _copy$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 1328
	mov	eax, DWORD PTR _copy_asm_constraints_vector$S1153
	mov	ecx, DWORD PTR _copy$[ebp]
	mov	DWORD PTR [ecx+20], eax
; Line 1329
	mov	eax, DWORD PTR _orig$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	ecx, DWORD PTR _copy$[ebp]
	mov	DWORD PTR [ecx+24], eax
; Line 1330
	mov	eax, DWORD PTR _orig$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	ecx, DWORD PTR _copy$[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 1331
	mov	eax, DWORD PTR _copy$[ebp]
	jmp	$L1483
; Line 1333
$L1511:
	jmp	$L1494
; Line 1335
$L1512:
; Line 1346
	mov	eax, DWORD PTR _orig$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_copy_rtx_and_substitute
	add	esp, 4
	push	eax
	mov	eax, DWORD PTR _orig$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_copy_rtx_and_substitute
	add	esp, 4
	push	eax
	mov	eax, DWORD PTR _orig$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	37					; 00000025H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _orig$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	28					; 0000001cH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L1483
; Line 1347
	jmp	$L1494
; Line 1349
$L1513:
; Line 1362
	mov	eax, DWORD PTR _orig$[ebp]
	mov	ecx, DWORD PTR _frame_pointer_rtx
	cmp	DWORD PTR [eax+4], ecx
	je	$L1515
	mov	eax, DWORD PTR _orig$[ebp]
	mov	ecx, DWORD PTR _frame_pointer_rtx
	cmp	DWORD PTR [eax+8], ecx
	je	$L1515
	jmp	$L1514
$L1515:
; Line 1366
	mov	eax, DWORD PTR _orig$[ebp]
	mov	ecx, DWORD PTR _frame_pointer_rtx
	cmp	DWORD PTR [eax+4], ecx
	je	$L1518
	mov	eax, DWORD PTR _orig$[ebp]
	mov	ecx, DWORD PTR _arg_pointer_rtx
	cmp	DWORD PTR [eax+4], ecx
	jne	$L1517
$L1518:
; Line 1367
	mov	eax, DWORD PTR _orig$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _reg$1516[ebp], eax
	mov	eax, DWORD PTR _orig$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _copy$[ebp], eax
; Line 1368
	jmp	$L1519
$L1517:
; Line 1369
	mov	eax, DWORD PTR _orig$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _reg$1516[ebp], eax
	mov	eax, DWORD PTR _orig$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _copy$[ebp], eax
$L1519:
; Line 1371
	mov	eax, DWORD PTR _copy$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1520
; Line 1373
	mov	eax, DWORD PTR _copy$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _c$1521[ebp], eax
; Line 1376
	mov	eax, DWORD PTR _arg_pointer_rtx
	cmp	DWORD PTR _reg$1516[ebp], eax
	jne	$L1522
	mov	eax, DWORD PTR _c$1521[ebp]
	cmp	DWORD PTR _first_parm_offset$S1199, eax
	jg	$L1522
	mov	eax, DWORD PTR _c$1521[ebp]
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	cmp	eax, DWORD PTR _parm_map_size$S1148
	jge	$L1522
; Line 1378
	push	0
	mov	eax, DWORD PTR _c$1521[ebp]
	push	eax
	call	_access_parm_map
	add	esp, 8
	mov	DWORD PTR _copy$[ebp], eax
; Line 1379
	mov	eax, DWORD PTR _copy$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1523
; Line 1383
	call	_abort
; Line 1384
$L1523:
	mov	eax, DWORD PTR _copy$[ebp]
	mov	eax, DWORD PTR [eax+4]
	jmp	$L1483
; Line 1386
$L1522:
; Line 1389
	mov	eax, DWORD PTR _fp_delta$S1150
	add	eax, DWORD PTR _c$1521[ebp]
	push	eax
	push	4
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _frame_pointer_rtx
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	push	44					; 0000002cH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L1483
; Line 1391
$L1520:
	mov	eax, DWORD PTR _copy$[ebp]
	push	eax
	call	_copy_rtx_and_substitute
	add	esp, 4
	mov	DWORD PTR _copy$[ebp], eax
; Line 1392
	mov	eax, DWORD PTR _copy$[ebp]
	push	eax
	mov	eax, DWORD PTR _frame_pointer_rtx
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	push	44					; 0000002cH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_force_reg
	add	esp, 8
	mov	DWORD PTR _temp$[ebp], eax
; Line 1393
	mov	eax, DWORD PTR _fp_delta$S1150
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_plus_constant
	add	esp, 8
	jmp	$L1483
; Line 1395
	jmp	$L1524
$L1514:
	mov	eax, DWORD PTR _orig$[ebp]
	push	eax
	call	_frame_pointer_sum_p
	add	esp, 4
	or	eax, eax
	je	$L1525
; Line 1400
	mov	eax, DWORD PTR _orig$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_memory_address_p
	add	esp, 8
	or	eax, eax
	je	$L1526
; Line 1402
	mov	eax, DWORD PTR _orig$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1527
; Line 1404
	mov	eax, DWORD PTR _orig$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_copy_rtx_and_substitute
	add	esp, 4
	mov	DWORD PTR _copy$[ebp], eax
; Line 1405
	mov	eax, DWORD PTR _orig$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _copy$[ebp]
	push	eax
	call	_plus_constant
	add	esp, 8
	mov	DWORD PTR _temp$[ebp], eax
; Line 1407
	jmp	$L1528
$L1527:
	mov	eax, DWORD PTR _orig$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1529
; Line 1409
	mov	eax, DWORD PTR _orig$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_copy_rtx_and_substitute
	add	esp, 4
	mov	DWORD PTR _copy$[ebp], eax
; Line 1410
	mov	eax, DWORD PTR _orig$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _copy$[ebp]
	push	eax
	call	_plus_constant
	add	esp, 8
	mov	DWORD PTR _temp$[ebp], eax
; Line 1412
	jmp	$L1530
$L1529:
; Line 1416
	mov	eax, DWORD PTR _orig$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_copy_rtx_and_substitute
	add	esp, 4
	push	eax
	mov	eax, DWORD PTR _orig$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_copy_rtx_and_substitute
	add	esp, 4
	push	eax
	mov	eax, DWORD PTR _orig$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	44					; 0000002cH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	DWORD PTR _temp$[ebp], eax
; Line 1417
$L1530:
$L1528:
; Line 1418
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_memory_address
	add	esp, 8
	mov	DWORD PTR _temp$[ebp], eax
; Line 1420
	jmp	$L1531
$L1526:
; Line 1423
	mov	eax, DWORD PTR _orig$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_copy_rtx_and_substitute
	add	esp, 4
	push	eax
	mov	eax, DWORD PTR _orig$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_copy_rtx_and_substitute
	add	esp, 4
	push	eax
	mov	eax, DWORD PTR _orig$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	44					; 0000002cH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	DWORD PTR _temp$[ebp], eax
$L1531:
; Line 1425
	jmp	$L1532
$L1525:
; Line 1428
	mov	eax, DWORD PTR _orig$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_copy_rtx_and_substitute
	add	esp, 4
	push	eax
	mov	eax, DWORD PTR _orig$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_copy_rtx_and_substitute
	add	esp, 4
	push	eax
	mov	eax, DWORD PTR _orig$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	44					; 0000002cH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	DWORD PTR _temp$[ebp], eax
$L1532:
$L1524:
; Line 1430
	mov	eax, DWORD PTR _temp$[ebp]
	jmp	$L1483
; Line 1432
$L1533:
; Line 1434
	mov	eax, DWORD PTR _orig$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _copy$[ebp], eax
; Line 1435
	mov	eax, DWORD PTR _frame_pointer_rtx
	cmp	DWORD PTR _copy$[ebp], eax
	je	$L1535
	mov	eax, DWORD PTR _arg_pointer_rtx
	cmp	DWORD PTR _copy$[ebp], eax
	jne	$L1534
$L1535:
; Line 1437
	mov	eax, DWORD PTR _fp_delta$S1150
	push	eax
	mov	eax, DWORD PTR _frame_pointer_rtx
	push	eax
	call	_plus_constant
	add	esp, 8
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	push	37					; 00000025H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	jmp	$L1483
; Line 1444
$L1534:
	mov	eax, DWORD PTR _copy$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 4128768				; 003f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1536
	mov	eax, DWORD PTR _copy$[ebp]
	mov	ecx, DWORD PTR _stack_pointer_rtx
	cmp	DWORD PTR [eax+4], ecx
	jne	$L1536
; Line 1445
	mov	eax, DWORD PTR _copy$[ebp]
	push	eax
	call	_copy_rtx_and_substitute
	add	esp, 4
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	push	37					; 00000025H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	jmp	$L1483
; Line 1453
$L1536:
	mov	eax, DWORD PTR _copy$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_memory_address_p
	add	esp, 8
	or	eax, eax
	jne	$L1537
; Line 1454
	mov	eax, DWORD PTR _copy$[ebp]
	push	eax
	call	_copy_address
	add	esp, 4
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	push	37					; 00000025H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	jmp	$L1483
; Line 1456
$L1537:
	mov	eax, DWORD PTR _copy$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1538
; Line 1462
	mov	eax, DWORD PTR _copy$[ebp]
	mov	ecx, DWORD PTR _frame_pointer_rtx
	cmp	DWORD PTR [eax+4], ecx
	je	$L1540
	mov	eax, DWORD PTR _copy$[ebp]
	mov	ecx, DWORD PTR _frame_pointer_rtx
	cmp	DWORD PTR [eax+8], ecx
	je	$L1540
	jmp	$L1539
$L1540:
; Line 1466
	mov	eax, DWORD PTR _copy$[ebp]
	mov	ecx, DWORD PTR _frame_pointer_rtx
	cmp	DWORD PTR [eax+4], ecx
	je	$L1543
	mov	eax, DWORD PTR _copy$[ebp]
	mov	ecx, DWORD PTR _arg_pointer_rtx
	cmp	DWORD PTR [eax+4], ecx
	jne	$L1542
$L1543:
; Line 1467
	mov	eax, DWORD PTR _copy$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _reg$1541[ebp], eax
	mov	eax, DWORD PTR _copy$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _copy$[ebp], eax
; Line 1468
	jmp	$L1544
$L1542:
; Line 1469
	mov	eax, DWORD PTR _copy$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _reg$1541[ebp], eax
	mov	eax, DWORD PTR _copy$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _copy$[ebp], eax
$L1544:
; Line 1471
	mov	eax, DWORD PTR _copy$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1545
; Line 1473
	mov	eax, DWORD PTR _copy$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _c$1546[ebp], eax
; Line 1476
	mov	eax, DWORD PTR _reg$1541[ebp]
	cmp	DWORD PTR _arg_pointer_rtx, eax
	jne	$L1547
	mov	eax, DWORD PTR _first_parm_offset$S1199
	cmp	DWORD PTR _c$1546[ebp], eax
	jl	$L1547
	mov	eax, DWORD PTR _c$1546[ebp]
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	cmp	eax, DWORD PTR _parm_map_size$S1148
	jge	$L1547
; Line 1477
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	mov	eax, DWORD PTR _c$1546[ebp]
	push	eax
	call	_access_parm_map
	add	esp, 8
	jmp	$L1483
; Line 1479
$L1547:
; Line 1482
	mov	eax, DWORD PTR _c$1546[ebp]
	add	eax, DWORD PTR _fp_delta$S1150
	push	eax
	push	4
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _frame_pointer_rtx
	push	eax
	push	4
	push	44					; 0000002cH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	DWORD PTR _temp$[ebp], eax
; Line 1483
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	push	4
	call	_memory_address_p
	add	esp, 8
	or	eax, eax
	jne	$L1548
; Line 1484
	mov	eax, DWORD PTR _c$1546[ebp]
	push	eax
	mov	eax, DWORD PTR _inline_fp_rtx$S1146
	push	eax
	call	_plus_constant
	add	esp, 8
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	push	37					; 00000025H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	jmp	$L1483
; Line 1485
$L1548:
; Line 1486
$L1545:
	mov	eax, DWORD PTR _copy$[ebp]
	push	eax
	call	_copy_rtx_and_substitute
	add	esp, 4
	mov	DWORD PTR _copy$[ebp], eax
; Line 1487
	mov	eax, DWORD PTR _copy$[ebp]
	push	eax
	mov	eax, DWORD PTR _frame_pointer_rtx
	push	eax
	push	4
	push	44					; 0000002cH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	DWORD PTR _temp$[ebp], eax
; Line 1488
	mov	eax, DWORD PTR _fp_delta$S1150
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_plus_constant
	add	esp, 8
	mov	DWORD PTR _temp$[ebp], eax
; Line 1489
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	push	4
	call	_memory_address
	add	esp, 8
	mov	DWORD PTR _temp$[ebp], eax
; Line 1491
	jmp	$L1549
$L1539:
; Line 1493
	mov	eax, DWORD PTR _copy$[ebp]
	push	eax
	mov	eax, DWORD PTR _frame_pointer_rtx
	push	eax
	call	_reg_mentioned_p
	add	esp, 8
	or	eax, eax
	jne	$L1552
	jmp	$L1551
$L1552:
; Line 1495
	mov	eax, DWORD PTR _copy$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1553
; Line 1497
	mov	eax, DWORD PTR _copy$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_copy_rtx_and_substitute
	add	esp, 4
	mov	DWORD PTR _temp$[ebp], eax
; Line 1498
	mov	eax, DWORD PTR _copy$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_plus_constant
	add	esp, 8
	mov	DWORD PTR _temp$[ebp], eax
; Line 1500
	jmp	$L1554
$L1553:
	mov	eax, DWORD PTR _copy$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1555
; Line 1502
	mov	eax, DWORD PTR _copy$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_copy_rtx_and_substitute
	add	esp, 4
	mov	DWORD PTR _temp$[ebp], eax
; Line 1503
	mov	eax, DWORD PTR _copy$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_plus_constant
	add	esp, 8
	mov	DWORD PTR _temp$[ebp], eax
; Line 1505
	jmp	$L1556
$L1555:
; Line 1509
	mov	eax, DWORD PTR _copy$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_copy_rtx_and_substitute
	add	esp, 4
	push	eax
	mov	eax, DWORD PTR _copy$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_copy_rtx_and_substitute
	add	esp, 4
	push	eax
	mov	eax, DWORD PTR _copy$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	44					; 0000002cH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	DWORD PTR _temp$[ebp], eax
; Line 1510
$L1556:
$L1554:
; Line 1512
	jmp	$L1557
$L1551:
; Line 1514
	mov	eax, DWORD PTR _copy$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1558
; Line 1516
	mov	eax, DWORD PTR _copy$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _copy$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_copy_rtx_and_substitute
	add	esp, 4
	push	eax
	call	_plus_constant
	add	esp, 8
	mov	DWORD PTR _temp$[ebp], eax
; Line 1517
	jmp	$L1559
$L1558:
	mov	eax, DWORD PTR _copy$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1560
; Line 1519
	mov	eax, DWORD PTR _copy$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _copy$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_copy_rtx_and_substitute
	add	esp, 4
	push	eax
	call	_plus_constant
	add	esp, 8
	mov	DWORD PTR _temp$[ebp], eax
; Line 1520
	jmp	$L1561
$L1560:
; Line 1522
	mov	eax, DWORD PTR _copy$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_copy_rtx_and_substitute
	add	esp, 4
	mov	DWORD PTR _left$1562[ebp], eax
; Line 1523
	mov	eax, DWORD PTR _copy$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_copy_rtx_and_substitute
	add	esp, 4
	mov	DWORD PTR _right$1563[ebp], eax
; Line 1525
	mov	eax, DWORD PTR _right$1563[ebp]
	push	eax
	mov	eax, DWORD PTR _left$1562[ebp]
	push	eax
	mov	eax, DWORD PTR _copy$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	44					; 0000002cH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	DWORD PTR _temp$[ebp], eax
; Line 1526
$L1561:
$L1559:
; Line 1527
$L1557:
$L1549:
; Line 1529
	jmp	$L1564
$L1538:
; Line 1530
	mov	eax, DWORD PTR _copy$[ebp]
	push	eax
	call	_copy_rtx_and_substitute
	add	esp, 4
	mov	DWORD PTR _temp$[ebp], eax
$L1564:
; Line 1532
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	mov	eax, DWORD PTR _orig$[ebp]
	push	eax
	call	_change_address
	add	esp, 12					; 0000000cH
	jmp	$L1483
; Line 1534
$L1565:
; Line 1535
	call	_abort
; Line 1536
	jmp	$L1494
$L1493:
	sub	DWORD PTR -64+[ebp], 17			; 00000011H
	cmp	DWORD PTR -64+[ebp], 27			; 0000001bH
	ja	$L1494
	shl	DWORD PTR -64+[ebp], 2
	mov	eax, DWORD PTR -64+[ebp]
	jmp	DWORD PTR $L1774[eax]
$L1774:
	DD	OFFSET $L1507
	DD	OFFSET $L1494
	DD	OFFSET $L1494
	DD	OFFSET $L1494
	DD	OFFSET $L1494
	DD	OFFSET $L1510
	DD	OFFSET $L1494
	DD	OFFSET $L1494
	DD	OFFSET $L1494
	DD	OFFSET $L1494
	DD	OFFSET $L1494
	DD	OFFSET $L1512
	DD	OFFSET $L1565
	DD	OFFSET $L1509
	DD	OFFSET $L1509
	DD	OFFSET $L1494
	DD	OFFSET $L1509
	DD	OFFSET $L1497
	DD	OFFSET $L1505
	DD	OFFSET $L1494
	DD	OFFSET $L1533
	DD	OFFSET $L1508
	DD	OFFSET $L1509
	DD	OFFSET $L1509
	DD	OFFSET $L1494
	DD	OFFSET $L1494
	DD	OFFSET $L1494
	DD	OFFSET $L1513
$L1494:
; Line 1538
	mov	eax, DWORD PTR _code$[ebp]
	push	eax
	call	_rtx_alloc
	add	esp, 4
	mov	DWORD PTR _copy$[ebp], eax
; Line 1539
	mov	eax, DWORD PTR _copy$[ebp]
	mov	eax, DWORD PTR [eax]
	and	eax, -16711681				; ff00ffffH
	mov	ecx, DWORD PTR _mode$[ebp]
	and	ecx, 255				; 000000ffH
	shl	ecx, 16					; 00000010H
	or	eax, ecx
	mov	ecx, DWORD PTR _copy$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 1540
	mov	eax, DWORD PTR _orig$[ebp]
	mov	eax, DWORD PTR [eax]
	shr	eax, 28					; 0000001cH
	and	eax, 1
	shl	eax, 28					; 0000001cH
	mov	ecx, DWORD PTR _copy$[ebp]
	mov	ecx, DWORD PTR [ecx]
	and	ecx, -268435457				; efffffffH
	or	eax, ecx
	mov	ecx, DWORD PTR _copy$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 1541
	mov	eax, DWORD PTR _orig$[ebp]
	mov	eax, DWORD PTR [eax]
	shr	eax, 27					; 0000001bH
	and	eax, 1
	shl	eax, 27					; 0000001bH
	mov	ecx, DWORD PTR _copy$[ebp]
	mov	ecx, DWORD PTR [ecx]
	and	ecx, -134217729				; f7ffffffH
	or	eax, ecx
	mov	ecx, DWORD PTR _copy$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 1542
	mov	eax, DWORD PTR _orig$[ebp]
	mov	eax, DWORD PTR [eax]
	shr	eax, 26					; 0000001aH
	and	eax, 1
	shl	eax, 26					; 0000001aH
	mov	ecx, DWORD PTR _copy$[ebp]
	mov	ecx, DWORD PTR [ecx]
	and	ecx, -67108865				; fbffffffH
	or	eax, ecx
	mov	ecx, DWORD PTR _copy$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 1544
	mov	eax, DWORD PTR _copy$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	eax, DWORD PTR _rtx_format[eax*4]
	mov	DWORD PTR _format_ptr$[ebp], eax
; Line 1546
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L1566
$L1567:
	inc	DWORD PTR _i$[ebp]
$L1566:
	mov	eax, DWORD PTR _copy$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _rtx_length[eax*4], ecx
	jle	$L1568
; Line 1548
	mov	eax, DWORD PTR _format_ptr$[ebp]
	mov	DWORD PTR -60+[ebp], eax
	inc	DWORD PTR _format_ptr$[ebp]
	mov	eax, DWORD PTR -60+[ebp]
	movsx	eax, BYTE PTR [eax]
	mov	DWORD PTR -68+[ebp], eax
	jmp	$L1569
; Line 1550
$L1573:
; Line 1551
	jmp	$L1570
; Line 1553
$L1574:
; Line 1554
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _orig$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	push	eax
	call	_copy_rtx_and_substitute
	add	esp, 4
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _copy$[ebp]
	mov	DWORD PTR [edx+ecx*4+4], eax
; Line 1555
	jmp	$L1570
; Line 1557
$L1575:
; Line 1560
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _orig$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _insn_map$S1196
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _copy$[ebp]
	mov	DWORD PTR [edx+ecx*4+4], eax
; Line 1561
	jmp	$L1570
; Line 1563
$L1576:
; Line 1564
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _orig$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _copy$[ebp]
	mov	DWORD PTR [edx+ecx*4+4], eax
; Line 1565
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _orig$[ebp]
	cmp	DWORD PTR [ecx+eax*4+4], 0
	je	$L1577
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _orig$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	cmp	DWORD PTR [eax], 0
	je	$L1577
; Line 1567
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _orig$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_rtvec_alloc
	add	esp, 4
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _copy$[ebp]
	mov	DWORD PTR [edx+ecx*4+4], eax
; Line 1568
	mov	DWORD PTR _j$[ebp], 0
	jmp	$L1578
$L1579:
	inc	DWORD PTR _j$[ebp]
$L1578:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _copy$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$[ebp]
	cmp	DWORD PTR [eax], ecx
	jbe	$L1580
; Line 1569
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _orig$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	push	eax
	call	_copy_rtx_and_substitute
	add	esp, 4
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _copy$[ebp]
	mov	ecx, DWORD PTR [edx+ecx*4+4]
	mov	edx, DWORD PTR _j$[ebp]
	mov	DWORD PTR [ecx+edx*4+4], eax
	jmp	$L1579
$L1580:
; Line 1571
$L1577:
	jmp	$L1570
; Line 1573
$L1581:
; Line 1574
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _orig$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _copy$[ebp]
	mov	DWORD PTR [edx+ecx*4+4], eax
; Line 1575
	jmp	$L1570
; Line 1577
$L1582:
; Line 1578
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _orig$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _copy$[ebp]
	mov	DWORD PTR [edx+ecx*4+4], eax
; Line 1579
	jmp	$L1570
; Line 1581
$L1583:
; Line 1582
	call	_abort
; Line 1583
	jmp	$L1570
$L1569:
	cmp	DWORD PTR -68+[ebp], 105		; 00000069H
	jg	$L1773
	je	$L1581
	cmp	DWORD PTR -68+[ebp], 48			; 00000030H
	je	$L1570
	cmp	DWORD PTR -68+[ebp], 69			; 00000045H
	je	$L1576
	cmp	DWORD PTR -68+[ebp], 101		; 00000065H
	je	$L1574
	jmp	$L1583
$L1773:
	cmp	DWORD PTR -68+[ebp], 115		; 00000073H
	je	$L1582
	cmp	DWORD PTR -68+[ebp], 117		; 00000075H
	je	$L1575
	jmp	$L1583
$L1570:
; Line 1584
	jmp	$L1567
$L1568:
; Line 1586
	cmp	DWORD PTR _code$[ebp], 22		; 00000016H
	jne	$L1584
	cmp	DWORD PTR _orig_asm_operands_vector$S1151, 0
	jne	$L1584
; Line 1588
	mov	eax, DWORD PTR _orig$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _orig_asm_operands_vector$S1151, eax
; Line 1589
	mov	eax, DWORD PTR _copy$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _copy_asm_operands_vector$S1152, eax
; Line 1590
	mov	eax, DWORD PTR _copy$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _copy_asm_constraints_vector$S1153, eax
; Line 1593
$L1584:
	mov	eax, DWORD PTR _copy$[ebp]
	jmp	$L1483
; Line 1594
$L1483:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_copy_rtx_and_substitute ENDP
_word$1600 = -16
_reladdress$ = 8
_mode$ = 12
_index$ = -4
_offset$ = -12
_copy$ = -8
_access_parm_map PROC NEAR
; Line 1606
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 1608
	mov	eax, DWORD PTR _reladdress$[ebp]
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	mov	DWORD PTR _index$[ebp], eax
; Line 1611
	mov	eax, DWORD PTR _reladdress$[ebp]
	cdq
	xor	eax, edx
	sub	eax, edx
	and	eax, 3
	xor	eax, edx
	sub	eax, edx
	mov	DWORD PTR _offset$[ebp], eax
; Line 1619
$L1592:
	mov	eax, DWORD PTR _index$[ebp]
	mov	ecx, DWORD PTR _parm_map$S1147
	cmp	DWORD PTR [ecx+eax*4], 0
	jne	$L1593
; Line 1621
	dec	DWORD PTR _index$[ebp]
; Line 1622
	mov	eax, DWORD PTR _first_parm_offset$S1199
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	cmp	eax, DWORD PTR _index$[ebp]
	jle	$L1594
; Line 1627
	call	_abort
; Line 1628
$L1594:
	add	DWORD PTR _offset$[ebp], 4
; Line 1629
	jmp	$L1592
$L1593:
; Line 1631
	mov	eax, DWORD PTR _index$[ebp]
	mov	ecx, DWORD PTR _parm_map$S1147
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _copy$[ebp], eax
; Line 1643
	mov	eax, DWORD PTR _copy$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1595
; Line 1645
	cmp	DWORD PTR _offset$[ebp], 0
	je	$L1596
; Line 1648
	mov	eax, DWORD PTR _offset$[ebp]
	push	eax
	mov	eax, DWORD PTR _copy$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_plus_constant
	add	esp, 8
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	mov	eax, DWORD PTR _copy$[ebp]
	push	eax
	call	_change_address
	add	esp, 12					; 0000000cH
	jmp	$L1587
; Line 1649
$L1596:
	mov	eax, DWORD PTR _copy$[ebp]
	jmp	$L1587
; Line 1652
$L1595:
; Line 1653
	mov	eax, DWORD PTR _copy$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1597
	mov	eax, DWORD PTR _copy$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1597
	mov	eax, DWORD PTR _copy$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1597
	mov	eax, DWORD PTR _copy$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1597
	mov	eax, DWORD PTR _copy$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1597
	mov	eax, DWORD PTR _copy$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1597
; Line 1654
	call	_abort
; Line 1655
$L1597:
	cmp	DWORD PTR _mode$[ebp], 0
	jne	$L1598
; Line 1656
	call	_abort
; Line 1660
$L1598:
; Line 1661
	mov	eax, DWORD PTR _copy$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	cmp	eax, DWORD PTR _mode$[ebp]
	je	$L1599
	mov	eax, DWORD PTR _copy$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sub	ecx, ecx
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L1599
; Line 1674
	mov	eax, DWORD PTR _offset$[ebp]
	cdq
	xor	eax, edx
	sub	eax, edx
	and	eax, 3
	xor	eax, edx
	sub	eax, edx
	je	$L1601
; Line 1675
	call	_abort
; Line 1677
$L1601:
	mov	eax, DWORD PTR _offset$[ebp]
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	mov	DWORD PTR _word$1600[ebp], eax
; Line 1678
	mov	eax, DWORD PTR _copy$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1602
; Line 1679
	mov	eax, DWORD PTR _copy$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	DWORD PTR _word$1600[ebp], eax
	mov	eax, DWORD PTR _copy$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _copy$[ebp], eax
; Line 1680
$L1602:
	mov	eax, DWORD PTR _copy$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1604
	mov	eax, DWORD PTR _copy$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1604
	mov	eax, DWORD PTR _copy$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1604
	mov	eax, DWORD PTR _copy$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1603
$L1604:
; Line 1681
	mov	eax, DWORD PTR _copy$[ebp]
	push	eax
	mov	eax, DWORD PTR _copy$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	call	_force_reg
	add	esp, 8
	mov	DWORD PTR _copy$[ebp], eax
; Line 1682
$L1603:
	mov	eax, DWORD PTR _word$1600[ebp]
	push	eax
	mov	eax, DWORD PTR _copy$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	push	35					; 00000023H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L1587
; Line 1685
$L1599:
	mov	eax, DWORD PTR _copy$[ebp]
	jmp	$L1587
; Line 1686
$L1587:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_access_parm_map ENDP
_orig$ = 8
_copy$ = -24
_i$ = -16
_j$ = -4
_code$ = -20
_mode$ = -8
_format_ptr$ = -12
_copy_address PROC NEAR
; Line 1697
	push	ebp
	mov	ebp, esp
	sub	esp, 36					; 00000024H
	push	ebx
	push	esi
	push	edi
; Line 1704
	cmp	DWORD PTR _orig$[ebp], 0
	jne	$L1613
; Line 1705
	sub	eax, eax
	jmp	$L1606
; Line 1707
$L1613:
	mov	eax, DWORD PTR _orig$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$[ebp], eax
; Line 1708
	mov	eax, DWORD PTR _orig$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	mov	DWORD PTR _mode$[ebp], eax
; Line 1710
	mov	eax, DWORD PTR _code$[ebp]
	mov	DWORD PTR -32+[ebp], eax
	jmp	$L1614
; Line 1712
$L1618:
; Line 1713
	mov	eax, DWORD PTR _orig$[ebp]
	cmp	DWORD PTR [eax+4], 6
	je	$L1619
; Line 1714
	mov	eax, DWORD PTR _orig$[ebp]
	push	eax
	call	_copy_rtx_and_substitute
	add	esp, 4
	jmp	$L1606
; Line 1715
$L1619:
	mov	eax, DWORD PTR _fp_delta$S1150
	push	eax
	mov	eax, DWORD PTR _frame_pointer_rtx
	push	eax
	call	_plus_constant
	add	esp, 8
	jmp	$L1606
; Line 1717
$L1620:
; Line 1719
	mov	eax, DWORD PTR _orig$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1621
	mov	eax, DWORD PTR _orig$[ebp]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 6
	jne	$L1621
; Line 1720
	mov	eax, DWORD PTR _fp_delta$S1150
	push	eax
	mov	eax, DWORD PTR _orig$[ebp]
	push	eax
	call	_plus_constant
	add	esp, 8
	jmp	$L1606
; Line 1721
$L1621:
	jmp	$L1615
; Line 1723
$L1622:
; Line 1724
	mov	eax, DWORD PTR _orig$[ebp]
	push	eax
	call	_copy_rtx_and_substitute
	add	esp, 4
	push	eax
	call	_copy_to_reg
	add	esp, 4
	jmp	$L1606
; Line 1726
$L1623:
; Line 1728
	mov	eax, DWORD PTR _orig$[ebp]
	push	eax
	call	_copy_rtx_and_substitute
	add	esp, 4
	jmp	$L1606
; Line 1730
$L1624:
; Line 1735
	mov	eax, DWORD PTR _orig$[ebp]
	jmp	$L1606
; Line 1736
	jmp	$L1615
$L1614:
	sub	DWORD PTR -32+[ebp], 17			; 00000011H
	cmp	DWORD PTR -32+[ebp], 27			; 0000001bH
	ja	$L1615
	shl	DWORD PTR -32+[ebp], 2
	mov	eax, DWORD PTR -32+[ebp]
	jmp	DWORD PTR $L1776[eax]
$L1776:
	DD	OFFSET $L1623
	DD	OFFSET $L1615
	DD	OFFSET $L1615
	DD	OFFSET $L1615
	DD	OFFSET $L1615
	DD	OFFSET $L1615
	DD	OFFSET $L1615
	DD	OFFSET $L1615
	DD	OFFSET $L1615
	DD	OFFSET $L1615
	DD	OFFSET $L1615
	DD	OFFSET $L1615
	DD	OFFSET $L1615
	DD	OFFSET $L1624
	DD	OFFSET $L1624
	DD	OFFSET $L1615
	DD	OFFSET $L1624
	DD	OFFSET $L1618
	DD	OFFSET $L1615
	DD	OFFSET $L1615
	DD	OFFSET $L1622
	DD	OFFSET $L1623
	DD	OFFSET $L1624
	DD	OFFSET $L1624
	DD	OFFSET $L1615
	DD	OFFSET $L1615
	DD	OFFSET $L1615
	DD	OFFSET $L1620
$L1615:
; Line 1738
	mov	eax, DWORD PTR _code$[ebp]
	push	eax
	call	_rtx_alloc
	add	esp, 4
	mov	DWORD PTR _copy$[ebp], eax
; Line 1739
	mov	eax, DWORD PTR _copy$[ebp]
	mov	eax, DWORD PTR [eax]
	and	eax, -16711681				; ff00ffffH
	mov	ecx, DWORD PTR _mode$[ebp]
	and	ecx, 255				; 000000ffH
	shl	ecx, 16					; 00000010H
	or	eax, ecx
	mov	ecx, DWORD PTR _copy$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 1740
	mov	eax, DWORD PTR _orig$[ebp]
	mov	eax, DWORD PTR [eax]
	shr	eax, 28					; 0000001cH
	and	eax, 1
	shl	eax, 28					; 0000001cH
	mov	ecx, DWORD PTR _copy$[ebp]
	mov	ecx, DWORD PTR [ecx]
	and	ecx, -268435457				; efffffffH
	or	eax, ecx
	mov	ecx, DWORD PTR _copy$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 1741
	mov	eax, DWORD PTR _orig$[ebp]
	mov	eax, DWORD PTR [eax]
	shr	eax, 27					; 0000001bH
	and	eax, 1
	shl	eax, 27					; 0000001bH
	mov	ecx, DWORD PTR _copy$[ebp]
	mov	ecx, DWORD PTR [ecx]
	and	ecx, -134217729				; f7ffffffH
	or	eax, ecx
	mov	ecx, DWORD PTR _copy$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 1742
	mov	eax, DWORD PTR _orig$[ebp]
	mov	eax, DWORD PTR [eax]
	shr	eax, 26					; 0000001aH
	and	eax, 1
	shl	eax, 26					; 0000001aH
	mov	ecx, DWORD PTR _copy$[ebp]
	mov	ecx, DWORD PTR [ecx]
	and	ecx, -67108865				; fbffffffH
	or	eax, ecx
	mov	ecx, DWORD PTR _copy$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 1744
	mov	eax, DWORD PTR _copy$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	eax, DWORD PTR _rtx_format[eax*4]
	mov	DWORD PTR _format_ptr$[ebp], eax
; Line 1746
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L1625
$L1626:
	inc	DWORD PTR _i$[ebp]
$L1625:
	mov	eax, DWORD PTR _copy$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _rtx_length[eax*4], ecx
	jle	$L1627
; Line 1748
	mov	eax, DWORD PTR _format_ptr$[ebp]
	mov	DWORD PTR -28+[ebp], eax
	inc	DWORD PTR _format_ptr$[ebp]
	mov	eax, DWORD PTR -28+[ebp]
	movsx	eax, BYTE PTR [eax]
	mov	DWORD PTR -36+[ebp], eax
	jmp	$L1628
; Line 1750
$L1632:
; Line 1751
	jmp	$L1629
; Line 1753
$L1633:
; Line 1754
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _orig$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	push	eax
	call	_copy_rtx_and_substitute
	add	esp, 4
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _copy$[ebp]
	mov	DWORD PTR [edx+ecx*4+4], eax
; Line 1755
	jmp	$L1629
; Line 1757
$L1634:
; Line 1760
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _orig$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _insn_map$S1196
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _copy$[ebp]
	mov	DWORD PTR [edx+ecx*4+4], eax
; Line 1761
	jmp	$L1629
; Line 1763
$L1635:
; Line 1764
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _orig$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _copy$[ebp]
	mov	DWORD PTR [edx+ecx*4+4], eax
; Line 1765
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _orig$[ebp]
	cmp	DWORD PTR [ecx+eax*4+4], 0
	je	$L1636
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _orig$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	cmp	DWORD PTR [eax], 0
	je	$L1636
; Line 1767
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _orig$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_rtvec_alloc
	add	esp, 4
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _copy$[ebp]
	mov	DWORD PTR [edx+ecx*4+4], eax
; Line 1768
	mov	DWORD PTR _j$[ebp], 0
	jmp	$L1637
$L1638:
	inc	DWORD PTR _j$[ebp]
$L1637:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _copy$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$[ebp]
	cmp	DWORD PTR [eax], ecx
	jbe	$L1639
; Line 1769
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _orig$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	push	eax
	call	_copy_rtx_and_substitute
	add	esp, 4
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _copy$[ebp]
	mov	ecx, DWORD PTR [edx+ecx*4+4]
	mov	edx, DWORD PTR _j$[ebp]
	mov	DWORD PTR [ecx+edx*4+4], eax
	jmp	$L1638
$L1639:
; Line 1771
$L1636:
	jmp	$L1629
; Line 1773
$L1640:
; Line 1774
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _orig$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _copy$[ebp]
	mov	DWORD PTR [edx+ecx*4+4], eax
; Line 1775
	jmp	$L1629
; Line 1777
$L1641:
; Line 1778
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _orig$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _copy$[ebp]
	mov	DWORD PTR [edx+ecx*4+4], eax
; Line 1779
	jmp	$L1629
; Line 1781
$L1642:
; Line 1782
	call	_abort
; Line 1783
	jmp	$L1629
$L1628:
	cmp	DWORD PTR -36+[ebp], 105		; 00000069H
	jg	$L1775
	je	$L1640
	cmp	DWORD PTR -36+[ebp], 48			; 00000030H
	je	$L1629
	cmp	DWORD PTR -36+[ebp], 69			; 00000045H
	je	$L1635
	cmp	DWORD PTR -36+[ebp], 101		; 00000065H
	je	$L1633
	jmp	$L1642
$L1775:
	cmp	DWORD PTR -36+[ebp], 115		; 00000073H
	je	$L1641
	cmp	DWORD PTR -36+[ebp], 117		; 00000075H
	je	$L1634
	jmp	$L1642
$L1629:
; Line 1784
	jmp	$L1626
$L1627:
; Line 1785
	mov	eax, DWORD PTR _copy$[ebp]
	jmp	$L1606
; Line 1786
$L1606:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_copy_address ENDP
_TEXT	ENDS
EXTRN	_pc_rtx:DWORD
_TEXT	SEGMENT
_insn$ = 8
_cnst$ = -4
_pat$ = -8
_copy$ = -12
_cnst2$1650 = -20
_cond$1651 = -16
_tmp$1659 = -24
_try_fold_cc0 PROC NEAR
; Line 1800
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	push	ebx
	push	esi
	push	edi
; Line 1801
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_copy_rtx_and_substitute
	add	esp, 4
	mov	DWORD PTR _cnst$[ebp], eax
; Line 1810
	mov	eax, DWORD PTR _cnst$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1649
	mov	eax, DWORD PTR _cnst$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1649
	mov	eax, DWORD PTR _cnst$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1649
	mov	eax, DWORD PTR _cnst$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1648
$L1649:
	mov	eax, DWORD PTR _insn$[ebp]
	cmp	DWORD PTR [eax+12], 0
	je	$L1648
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _pat$[ebp], eax
	mov	eax, DWORD PTR _pat$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1648
	mov	eax, DWORD PTR _pat$[ebp]
	mov	ecx, DWORD PTR _pc_rtx
	cmp	DWORD PTR [eax+4], ecx
	jne	$L1648
	mov	eax, DWORD PTR _pat$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _pat$[ebp], eax
	mov	eax, DWORD PTR _pat$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2752512				; 002a0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1648
	mov	eax, DWORD PTR _pat$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	cmp	DWORD PTR _rtx_length[eax*4], 2
	jne	$L1648
; Line 1813
	mov	eax, DWORD PTR _pat$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _cond$1651[ebp], eax
; Line 1820
	mov	eax, DWORD PTR _cond$1651[ebp]
	mov	ecx, DWORD PTR _cc0_rtx
	cmp	DWORD PTR [eax+4], ecx
	jne	$L1654
	mov	eax, DWORD PTR _cond$1651[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1655
	mov	eax, DWORD PTR _cond$1651[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1655
	mov	eax, DWORD PTR _cond$1651[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1655
	mov	eax, DWORD PTR _cond$1651[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1654
$L1655:
	mov	eax, DWORD PTR _cond$1651[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _cnst2$1650[ebp], eax
	cmp	DWORD PTR _cnst2$1650[ebp], 0
	jne	$L1653
$L1654:
	mov	eax, DWORD PTR _cond$1651[ebp]
	mov	ecx, DWORD PTR _cc0_rtx
	cmp	DWORD PTR [eax+8], ecx
	jne	$L1652
	mov	eax, DWORD PTR _cond$1651[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1656
	mov	eax, DWORD PTR _cond$1651[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1656
	mov	eax, DWORD PTR _cond$1651[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1656
	mov	eax, DWORD PTR _cond$1651[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1652
$L1656:
	mov	eax, DWORD PTR _cond$1651[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _cnst2$1650[ebp], eax
	cmp	DWORD PTR _cnst2$1650[ebp], 0
	je	$L1652
$L1653:
; Line 1823
	mov	eax, DWORD PTR _cnst2$1650[ebp]
	push	eax
	mov	eax, DWORD PTR _cnst$[ebp]
	push	eax
	mov	eax, DWORD PTR _pat$[ebp]
	mov	eax, DWORD PTR [eax+12]
	push	eax
	mov	eax, DWORD PTR _pat$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _cond$1651[ebp]
	push	eax
	call	_fold_out_const_cc0
	add	esp, 20					; 00000014H
	mov	DWORD PTR _copy$[ebp], eax
; Line 1824
	cmp	DWORD PTR _copy$[ebp], 0
	je	$L1657
; Line 1826
	mov	eax, DWORD PTR _copy$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1658
; Line 1837
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _tmp$1659[ebp], eax
; Line 1838
$L1661:
	cmp	DWORD PTR _tmp$1659[ebp], 0
	je	$L1662
	mov	eax, DWORD PTR _tmp$1659[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1114112				; 00110000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1662
; Line 1839
	mov	eax, DWORD PTR _tmp$1659[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _tmp$1659[ebp], eax
	jmp	$L1661
$L1662:
; Line 1840
	cmp	DWORD PTR _tmp$1659[ebp], 0
	jne	$L1663
; Line 1841
	call	_abort
; Line 1842
$L1663:
	mov	eax, DWORD PTR _tmp$1659[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _label_map$S1195
	mov	edx, DWORD PTR _copy$[ebp]
	mov	edx, DWORD PTR [edx+4]
	cmp	DWORD PTR [ecx+eax*4], edx
	jne	$L1664
; Line 1845
	mov	eax, DWORD PTR _tmp$1659[ebp]
	mov	eax, DWORD PTR [eax+8]
	jmp	$L1644
; Line 1847
	jmp	$L1665
$L1664:
; Line 1852
	mov	eax, DWORD PTR _copy$[ebp]
	push	eax
	call	_emit_jump
	add	esp, 4
; Line 1853
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	jmp	$L1644
; Line 1854
$L1665:
; Line 1856
	jmp	$L1666
$L1658:
	mov	eax, DWORD PTR _pc_rtx
	cmp	DWORD PTR _copy$[ebp], eax
	jne	$L1667
; Line 1861
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	jmp	$L1644
; Line 1863
	jmp	$L1668
$L1667:
; Line 1864
	call	_abort
$L1668:
$L1666:
; Line 1866
$L1657:
; Line 1867
$L1652:
; Line 1868
$L1648:
	sub	eax, eax
	jmp	$L1644
; Line 1869
$L1644:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_try_fold_cc0 ENDP
_cond_rtx$ = 8
_then_rtx$ = 12
_else_rtx$ = 16
_cnst1$ = 20
_cnst2$ = 24
_value1$ = -12
_value2$ = -8
_int1$ = -4
_int2$ = -16
_fold_out_const_cc0 PROC NEAR
; Line 1878
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	push	ebx
	push	esi
	push	edi
; Line 1880
	mov	eax, DWORD PTR _cnst1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	sub	eax, ecx
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	mov	DWORD PTR _int1$[ebp], eax
; Line 1881
	mov	eax, DWORD PTR _cnst2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	sub	eax, ecx
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	mov	DWORD PTR _int2$[ebp], eax
; Line 1882
	cmp	DWORD PTR _int1$[ebp], 0
	je	$L1679
; Line 1883
	mov	eax, DWORD PTR _cnst1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _value1$[ebp], eax
; Line 1884
	jmp	$L1680
$L1679:
; Line 1885
	mov	DWORD PTR _value1$[ebp], 1
$L1680:
; Line 1886
	cmp	DWORD PTR _int2$[ebp], 0
	je	$L1681
; Line 1887
	mov	eax, DWORD PTR _cnst2$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _value2$[ebp], eax
; Line 1888
	jmp	$L1682
$L1681:
; Line 1889
	mov	DWORD PTR _value2$[ebp], 1
$L1682:
; Line 1891
	mov	eax, DWORD PTR _cond_rtx$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR -20+[ebp], eax
	jmp	$L1683
; Line 1893
$L1687:
; Line 1894
	cmp	DWORD PTR _int1$[ebp], 0
	je	$L1688
	cmp	DWORD PTR _int2$[ebp], 0
	je	$L1688
; Line 1895
	mov	eax, DWORD PTR _value2$[ebp]
	cmp	DWORD PTR _value1$[ebp], eax
	je	$L1689
; Line 1896
	mov	eax, DWORD PTR _then_rtx$[ebp]
	push	eax
	call	_copy_rtx_and_substitute
	add	esp, 4
	jmp	$L1674
; Line 1897
	jmp	$L1690
$L1689:
; Line 1898
	mov	eax, DWORD PTR _else_rtx$[ebp]
	push	eax
	call	_copy_rtx_and_substitute
	add	esp, 4
	jmp	$L1674
$L1690:
; Line 1899
$L1688:
	cmp	DWORD PTR _value1$[ebp], 0
	je	$L1692
	cmp	DWORD PTR _value2$[ebp], 0
	jne	$L1691
$L1692:
; Line 1900
	mov	eax, DWORD PTR _then_rtx$[ebp]
	push	eax
	call	_copy_rtx_and_substitute
	add	esp, 4
	jmp	$L1674
; Line 1901
$L1691:
	cmp	DWORD PTR _int1$[ebp], 0
	jne	$L1693
	cmp	DWORD PTR _int2$[ebp], 0
	jne	$L1693
; Line 1902
	mov	eax, DWORD PTR _cnst2$[ebp]
	push	eax
	mov	eax, DWORD PTR _cnst1$[ebp]
	push	eax
	call	_rtx_equal_p
	add	esp, 8
	or	eax, eax
	je	$L1694
; Line 1903
	mov	eax, DWORD PTR _else_rtx$[ebp]
	push	eax
	call	_copy_rtx_and_substitute
	add	esp, 4
	jmp	$L1674
; Line 1904
$L1694:
$L1693:
	jmp	$L1684
; Line 1905
$L1695:
; Line 1906
	cmp	DWORD PTR _int1$[ebp], 0
	je	$L1696
	cmp	DWORD PTR _int2$[ebp], 0
	je	$L1696
; Line 1907
	mov	eax, DWORD PTR _value2$[ebp]
	cmp	DWORD PTR _value1$[ebp], eax
	jne	$L1697
; Line 1908
	mov	eax, DWORD PTR _then_rtx$[ebp]
	push	eax
	call	_copy_rtx_and_substitute
	add	esp, 4
	jmp	$L1674
; Line 1909
	jmp	$L1698
$L1697:
; Line 1910
	mov	eax, DWORD PTR _else_rtx$[ebp]
	push	eax
	call	_copy_rtx_and_substitute
	add	esp, 4
	jmp	$L1674
$L1698:
; Line 1911
$L1696:
	cmp	DWORD PTR _value1$[ebp], 0
	je	$L1700
	cmp	DWORD PTR _value2$[ebp], 0
	jne	$L1699
$L1700:
; Line 1912
	mov	eax, DWORD PTR _else_rtx$[ebp]
	push	eax
	call	_copy_rtx_and_substitute
	add	esp, 4
	jmp	$L1674
; Line 1913
$L1699:
	cmp	DWORD PTR _int1$[ebp], 0
	jne	$L1701
	cmp	DWORD PTR _int2$[ebp], 0
	jne	$L1701
; Line 1914
	mov	eax, DWORD PTR _cnst2$[ebp]
	push	eax
	mov	eax, DWORD PTR _cnst1$[ebp]
	push	eax
	call	_rtx_equal_p
	add	esp, 8
	or	eax, eax
	je	$L1702
; Line 1915
	mov	eax, DWORD PTR _then_rtx$[ebp]
	push	eax
	call	_copy_rtx_and_substitute
	add	esp, 4
	jmp	$L1674
; Line 1916
$L1702:
$L1701:
	jmp	$L1684
; Line 1917
$L1703:
; Line 1918
	cmp	DWORD PTR _int1$[ebp], 0
	je	$L1704
	cmp	DWORD PTR _int2$[ebp], 0
	je	$L1704
; Line 1919
	mov	eax, DWORD PTR _value2$[ebp]
	cmp	DWORD PTR _value1$[ebp], eax
	jl	$L1705
; Line 1920
	mov	eax, DWORD PTR _then_rtx$[ebp]
	push	eax
	call	_copy_rtx_and_substitute
	add	esp, 4
	jmp	$L1674
; Line 1921
	jmp	$L1706
$L1705:
; Line 1922
	mov	eax, DWORD PTR _else_rtx$[ebp]
	push	eax
	call	_copy_rtx_and_substitute
	add	esp, 4
	jmp	$L1674
$L1706:
; Line 1923
$L1704:
	cmp	DWORD PTR _value1$[ebp], 0
	jne	$L1707
; Line 1924
	mov	eax, DWORD PTR _else_rtx$[ebp]
	push	eax
	call	_copy_rtx_and_substitute
	add	esp, 4
	jmp	$L1674
; Line 1925
$L1707:
	cmp	DWORD PTR _value2$[ebp], 0
	jne	$L1708
; Line 1926
	mov	eax, DWORD PTR _then_rtx$[ebp]
	push	eax
	call	_copy_rtx_and_substitute
	add	esp, 4
	jmp	$L1674
; Line 1927
$L1708:
	jmp	$L1684
; Line 1928
$L1709:
; Line 1929
	cmp	DWORD PTR _int1$[ebp], 0
	je	$L1710
	cmp	DWORD PTR _int2$[ebp], 0
	je	$L1710
; Line 1930
	mov	eax, DWORD PTR _value2$[ebp]
	cmp	DWORD PTR _value1$[ebp], eax
	jle	$L1711
; Line 1931
	mov	eax, DWORD PTR _then_rtx$[ebp]
	push	eax
	call	_copy_rtx_and_substitute
	add	esp, 4
	jmp	$L1674
; Line 1932
	jmp	$L1712
$L1711:
; Line 1933
	mov	eax, DWORD PTR _else_rtx$[ebp]
	push	eax
	call	_copy_rtx_and_substitute
	add	esp, 4
	jmp	$L1674
$L1712:
; Line 1934
$L1710:
	cmp	DWORD PTR _value1$[ebp], 0
	jne	$L1713
; Line 1935
	mov	eax, DWORD PTR _else_rtx$[ebp]
	push	eax
	call	_copy_rtx_and_substitute
	add	esp, 4
	jmp	$L1674
; Line 1936
$L1713:
	cmp	DWORD PTR _value2$[ebp], 0
	jne	$L1714
; Line 1937
	mov	eax, DWORD PTR _then_rtx$[ebp]
	push	eax
	call	_copy_rtx_and_substitute
	add	esp, 4
	jmp	$L1674
; Line 1938
$L1714:
	jmp	$L1684
; Line 1939
$L1715:
; Line 1940
	cmp	DWORD PTR _int1$[ebp], 0
	je	$L1716
	cmp	DWORD PTR _int2$[ebp], 0
	je	$L1716
; Line 1941
	mov	eax, DWORD PTR _value2$[ebp]
	cmp	DWORD PTR _value1$[ebp], eax
	jg	$L1717
; Line 1942
	mov	eax, DWORD PTR _then_rtx$[ebp]
	push	eax
	call	_copy_rtx_and_substitute
	add	esp, 4
	jmp	$L1674
; Line 1943
	jmp	$L1718
$L1717:
; Line 1944
	mov	eax, DWORD PTR _else_rtx$[ebp]
	push	eax
	call	_copy_rtx_and_substitute
	add	esp, 4
	jmp	$L1674
$L1718:
; Line 1945
$L1716:
	cmp	DWORD PTR _value1$[ebp], 0
	jne	$L1719
; Line 1946
	mov	eax, DWORD PTR _then_rtx$[ebp]
	push	eax
	call	_copy_rtx_and_substitute
	add	esp, 4
	jmp	$L1674
; Line 1947
$L1719:
	cmp	DWORD PTR _value2$[ebp], 0
	jne	$L1720
; Line 1948
	mov	eax, DWORD PTR _else_rtx$[ebp]
	push	eax
	call	_copy_rtx_and_substitute
	add	esp, 4
	jmp	$L1674
; Line 1949
$L1720:
	jmp	$L1684
; Line 1950
$L1721:
; Line 1951
	cmp	DWORD PTR _int1$[ebp], 0
	je	$L1722
	cmp	DWORD PTR _int2$[ebp], 0
	je	$L1722
; Line 1952
	mov	eax, DWORD PTR _value2$[ebp]
	cmp	DWORD PTR _value1$[ebp], eax
	jge	$L1723
; Line 1953
	mov	eax, DWORD PTR _then_rtx$[ebp]
	push	eax
	call	_copy_rtx_and_substitute
	add	esp, 4
	jmp	$L1674
; Line 1954
	jmp	$L1724
$L1723:
; Line 1955
	mov	eax, DWORD PTR _else_rtx$[ebp]
	push	eax
	call	_copy_rtx_and_substitute
	add	esp, 4
	jmp	$L1674
$L1724:
; Line 1956
$L1722:
	cmp	DWORD PTR _value1$[ebp], 0
	jne	$L1725
; Line 1957
	mov	eax, DWORD PTR _then_rtx$[ebp]
	push	eax
	call	_copy_rtx_and_substitute
	add	esp, 4
	jmp	$L1674
; Line 1958
$L1725:
	cmp	DWORD PTR _value2$[ebp], 0
	jne	$L1726
; Line 1959
	mov	eax, DWORD PTR _else_rtx$[ebp]
	push	eax
	call	_copy_rtx_and_substitute
	add	esp, 4
	jmp	$L1674
; Line 1960
$L1726:
	jmp	$L1684
; Line 1961
$L1727:
; Line 1962
	cmp	DWORD PTR _int1$[ebp], 0
	je	$L1728
	cmp	DWORD PTR _int2$[ebp], 0
	je	$L1728
; Line 1963
	mov	eax, DWORD PTR _value2$[ebp]
	cmp	DWORD PTR _value1$[ebp], eax
	jb	$L1729
; Line 1964
	mov	eax, DWORD PTR _then_rtx$[ebp]
	push	eax
	call	_copy_rtx_and_substitute
	add	esp, 4
	jmp	$L1674
; Line 1965
	jmp	$L1730
$L1729:
; Line 1966
	mov	eax, DWORD PTR _else_rtx$[ebp]
	push	eax
	call	_copy_rtx_and_substitute
	add	esp, 4
	jmp	$L1674
$L1730:
; Line 1967
$L1728:
	cmp	DWORD PTR _value1$[ebp], 0
	jne	$L1731
; Line 1968
	mov	eax, DWORD PTR _else_rtx$[ebp]
	push	eax
	call	_copy_rtx_and_substitute
	add	esp, 4
	jmp	$L1674
; Line 1969
$L1731:
	cmp	DWORD PTR _value2$[ebp], 0
	jne	$L1732
; Line 1970
	mov	eax, DWORD PTR _then_rtx$[ebp]
	push	eax
	call	_copy_rtx_and_substitute
	add	esp, 4
	jmp	$L1674
; Line 1971
$L1732:
	jmp	$L1684
; Line 1972
$L1733:
; Line 1973
	cmp	DWORD PTR _int1$[ebp], 0
	je	$L1734
	cmp	DWORD PTR _int2$[ebp], 0
	je	$L1734
; Line 1974
	mov	eax, DWORD PTR _value2$[ebp]
	cmp	DWORD PTR _value1$[ebp], eax
	jbe	$L1735
; Line 1975
	mov	eax, DWORD PTR _then_rtx$[ebp]
	push	eax
	call	_copy_rtx_and_substitute
	add	esp, 4
	jmp	$L1674
; Line 1976
	jmp	$L1736
$L1735:
; Line 1977
	mov	eax, DWORD PTR _else_rtx$[ebp]
	push	eax
	call	_copy_rtx_and_substitute
	add	esp, 4
	jmp	$L1674
$L1736:
; Line 1978
$L1734:
	cmp	DWORD PTR _value1$[ebp], 0
	jne	$L1737
; Line 1979
	mov	eax, DWORD PTR _else_rtx$[ebp]
	push	eax
	call	_copy_rtx_and_substitute
	add	esp, 4
	jmp	$L1674
; Line 1980
$L1737:
	cmp	DWORD PTR _value2$[ebp], 0
	jne	$L1738
; Line 1981
	mov	eax, DWORD PTR _then_rtx$[ebp]
	push	eax
	call	_copy_rtx_and_substitute
	add	esp, 4
	jmp	$L1674
; Line 1982
$L1738:
	jmp	$L1684
; Line 1983
$L1739:
; Line 1984
	cmp	DWORD PTR _int1$[ebp], 0
	je	$L1740
	cmp	DWORD PTR _int2$[ebp], 0
	je	$L1740
; Line 1985
	mov	eax, DWORD PTR _value2$[ebp]
	cmp	DWORD PTR _value1$[ebp], eax
	ja	$L1741
; Line 1986
	mov	eax, DWORD PTR _then_rtx$[ebp]
	push	eax
	call	_copy_rtx_and_substitute
	add	esp, 4
	jmp	$L1674
; Line 1987
	jmp	$L1742
$L1741:
; Line 1988
	mov	eax, DWORD PTR _else_rtx$[ebp]
	push	eax
	call	_copy_rtx_and_substitute
	add	esp, 4
	jmp	$L1674
$L1742:
; Line 1989
$L1740:
	cmp	DWORD PTR _value1$[ebp], 0
	jne	$L1743
; Line 1990
	mov	eax, DWORD PTR _then_rtx$[ebp]
	push	eax
	call	_copy_rtx_and_substitute
	add	esp, 4
	jmp	$L1674
; Line 1991
$L1743:
	cmp	DWORD PTR _value2$[ebp], 0
	jne	$L1744
; Line 1992
	mov	eax, DWORD PTR _else_rtx$[ebp]
	push	eax
	call	_copy_rtx_and_substitute
	add	esp, 4
	jmp	$L1674
; Line 1993
$L1744:
	jmp	$L1684
; Line 1994
$L1745:
; Line 1995
	cmp	DWORD PTR _int1$[ebp], 0
	je	$L1746
	cmp	DWORD PTR _int2$[ebp], 0
	je	$L1746
; Line 1996
	mov	eax, DWORD PTR _value2$[ebp]
	cmp	DWORD PTR _value1$[ebp], eax
	jae	$L1747
; Line 1997
	mov	eax, DWORD PTR _then_rtx$[ebp]
	push	eax
	call	_copy_rtx_and_substitute
	add	esp, 4
	jmp	$L1674
; Line 1998
	jmp	$L1748
$L1747:
; Line 1999
	mov	eax, DWORD PTR _else_rtx$[ebp]
	push	eax
	call	_copy_rtx_and_substitute
	add	esp, 4
	jmp	$L1674
$L1748:
; Line 2000
$L1746:
	cmp	DWORD PTR _value1$[ebp], 0
	jne	$L1749
; Line 2001
	mov	eax, DWORD PTR _then_rtx$[ebp]
	push	eax
	call	_copy_rtx_and_substitute
	add	esp, 4
	jmp	$L1674
; Line 2002
$L1749:
	cmp	DWORD PTR _value2$[ebp], 0
	jne	$L1750
; Line 2003
	mov	eax, DWORD PTR _else_rtx$[ebp]
	push	eax
	call	_copy_rtx_and_substitute
	add	esp, 4
	jmp	$L1674
; Line 2004
$L1750:
	jmp	$L1684
; Line 2005
	jmp	$L1684
$L1683:
	sub	DWORD PTR -20+[ebp], 67			; 00000043H
	cmp	DWORD PTR -20+[ebp], 9
	ja	$L1684
	shl	DWORD PTR -20+[ebp], 2
	mov	eax, DWORD PTR -20+[ebp]
	jmp	DWORD PTR $L1777[eax]
$L1777:
	DD	OFFSET $L1687
	DD	OFFSET $L1695
	DD	OFFSET $L1703
	DD	OFFSET $L1709
	DD	OFFSET $L1715
	DD	OFFSET $L1721
	DD	OFFSET $L1727
	DD	OFFSET $L1733
	DD	OFFSET $L1739
	DD	OFFSET $L1745
$L1684:
; Line 2007
	sub	eax, eax
	jmp	$L1674
; Line 2008
$L1674:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_fold_out_const_cc0 ENDP
_TEXT	ENDS
PUBLIC	_output_inline_function
EXTRN	_current_function_decl:DWORD
EXTRN	_temporary_allocation:NEAR
EXTRN	_init_function_start:NEAR
EXTRN	_restore_reg_data:NEAR
EXTRN	_expand_function_end:NEAR
EXTRN	_rest_of_compilation:NEAR
EXTRN	_permanent_allocation:NEAR
_DATA	SEGMENT
$SG1758	DB	'lossage', 00H
_DATA	ENDS
_TEXT	SEGMENT
_fndecl$ = 8
_head$ = -8
_last$ = -4
_output_inline_function PROC NEAR
; Line 2017
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 2018
	mov	eax, DWORD PTR _fndecl$[ebp]
	mov	eax, DWORD PTR [eax+84]
	mov	DWORD PTR _head$[ebp], eax
; Line 2022
	call	_temporary_allocation
; Line 2024
	mov	eax, DWORD PTR _fndecl$[ebp]
	mov	DWORD PTR _current_function_decl, eax
; Line 2027
	push	1
	push	OFFSET $SG1758
	mov	eax, DWORD PTR _fndecl$[ebp]
	push	eax
	call	_init_function_start
	add	esp, 12					; 0000000cH
; Line 2030
	mov	eax, DWORD PTR _fndecl$[ebp]
	mov	eax, DWORD PTR [eax+80]
	push	eax
	push	26					; 0000001aH
	call	_assign_stack_local
	add	esp, 8
; Line 2032
	mov	eax, DWORD PTR _head$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_restore_reg_data
	add	esp, 4
; Line 2034
	mov	eax, DWORD PTR _head$[ebp]
	mov	eax, DWORD PTR [eax+40]
	mov	DWORD PTR _stack_slot_list, eax
; Line 2036
	mov	eax, DWORD PTR _fndecl$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	mov	eax, DWORD PTR _fndecl$[ebp]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	call	_expand_function_end
	add	esp, 8
; Line 2038
	mov	eax, DWORD PTR _head$[ebp]
	mov	DWORD PTR _last$[ebp], eax
	jmp	$L1761
$L1762:
	mov	eax, DWORD PTR _last$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _last$[ebp], eax
$L1761:
	mov	eax, DWORD PTR _last$[ebp]
	cmp	DWORD PTR [eax+12], 0
	je	$L1763
; Line 2039
	jmp	$L1762
$L1763:
; Line 2041
	mov	eax, DWORD PTR _last$[ebp]
	push	eax
	mov	eax, DWORD PTR _head$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_set_new_first_and_last_insn
	add	esp, 8
; Line 2044
	mov	eax, DWORD PTR _fndecl$[ebp]
	push	eax
	call	_rest_of_compilation
	add	esp, 4
; Line 2046
	mov	DWORD PTR _current_function_decl, 0
; Line 2048
	call	_permanent_allocation
; Line 2049
$L1753:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_inline_function ENDP
_TEXT	ENDS
END
