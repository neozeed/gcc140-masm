	TITLE	emit-rtl.c
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
PUBLIC	_reg_rtx_no
PUBLIC	_sequence_stack
_DATA	SEGMENT
COMM	_fconst0_rtx:DWORD
COMM	_dconst0_rtx:DWORD
COMM	_stack_pointer_rtx:DWORD
COMM	_frame_pointer_rtx:DWORD
COMM	_arg_pointer_rtx:DWORD
COMM	_struct_value_rtx:DWORD
COMM	_struct_value_incoming_rtx:DWORD
COMM	_static_chain_rtx:DWORD
COMM	_static_chain_incoming_rtx:DWORD
COMM	_regno_pointer_flag:DWORD
COMM	_regno_reg_rtx:DWORD
COMM	_cc1_rtx:DWORD
COMM	_regno_pointer_flag_length:DWORD
COMM	_pc_rtx:DWORD
COMM	_cc0_rtx:DWORD
COMM	_const0_rtx:DWORD
COMM	_const1_rtx:DWORD
_reg_rtx_no DD	0aH
_label_num$S477 DD 01H
_first_insn$S481 DD 00H
_last_insn$S482 DD 00H
_sequence_stack DD 00H
_cur_insn_uid$S484 DD 01H
_last_linenum$S485 DD 00H
_last_filename$S486 DD 00H
_unshare_copies$S607 DD 00H
_DATA	ENDS
PUBLIC	_gen_rtx
EXTRN	_abort:NEAR
EXTRN	_rtx_alloc:NEAR
EXTRN	_rtx_length:BYTE
EXTRN	_rtx_format:BYTE
_TEXT	SEGMENT
; File emit-rtl.c
_va_alist$ = 8
_p$ = -20
_code$ = -24
_mode$ = -12
_i$ = -8
_fmt$ = -4
_rt_val$ = -16
_arg$500 = -28
_gen_rtx PROC NEAR
; Line 177
	push	ebp
	mov	ebp, esp
	sub	esp, 36					; 00000024H
	push	ebx
	push	esi
	push	edi
; Line 185
	lea	eax, DWORD PTR _va_alist$[ebp]
	mov	DWORD PTR _p$[ebp], eax
; Line 186
	add	DWORD PTR _p$[ebp], 4
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax-4]
	mov	DWORD PTR _code$[ebp], eax
; Line 187
	add	DWORD PTR _p$[ebp], 4
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax-4]
	mov	DWORD PTR _mode$[ebp], eax
; Line 189
	cmp	DWORD PTR _code$[ebp], 30		; 0000001eH
	jne	$L499
; Line 191
	add	DWORD PTR _p$[ebp], 4
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax-4]
	mov	DWORD PTR _arg$500[ebp], eax
; Line 192
	cmp	DWORD PTR _arg$500[ebp], 0
	jne	$L501
; Line 193
	mov	eax, DWORD PTR _const0_rtx
	jmp	$L492
; Line 194
$L501:
	cmp	DWORD PTR _arg$500[ebp], 1
	jne	$L502
; Line 195
	mov	eax, DWORD PTR _const1_rtx
	jmp	$L492
; Line 196
$L502:
	mov	eax, DWORD PTR _code$[ebp]
	push	eax
	call	_rtx_alloc
	add	esp, 4
	mov	DWORD PTR _rt_val$[ebp], eax
; Line 197
	mov	eax, DWORD PTR _arg$500[ebp]
	mov	ecx, DWORD PTR _rt_val$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 199
	jmp	$L503
$L499:
; Line 201
	mov	eax, DWORD PTR _code$[ebp]
	push	eax
	call	_rtx_alloc
	add	esp, 4
	mov	DWORD PTR _rt_val$[ebp], eax
; Line 202
	mov	eax, DWORD PTR _rt_val$[ebp]
	mov	eax, DWORD PTR [eax]
	and	eax, -16711681				; ff00ffffH
	mov	ecx, DWORD PTR _mode$[ebp]
	and	ecx, 255				; 000000ffH
	shl	ecx, 16					; 00000010H
	or	eax, ecx
	mov	ecx, DWORD PTR _rt_val$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 204
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_format[eax*4]
	mov	DWORD PTR _fmt$[ebp], eax
; Line 205
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L504
$L505:
	inc	DWORD PTR _i$[ebp]
$L504:
	mov	eax, DWORD PTR _code$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _rtx_length[eax*4], ecx
	jle	$L506
; Line 207
	mov	eax, DWORD PTR _fmt$[ebp]
	mov	DWORD PTR -32+[ebp], eax
	inc	DWORD PTR _fmt$[ebp]
	mov	eax, DWORD PTR -32+[ebp]
	movsx	eax, BYTE PTR [eax]
	mov	DWORD PTR -36+[ebp], eax
	jmp	$L507
; Line 209
$L511:
; Line 210
	jmp	$L508
; Line 212
$L512:
; Line 213
	add	DWORD PTR _p$[ebp], 4
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax-4]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _rt_val$[ebp]
	mov	DWORD PTR [edx+ecx*4+4], eax
; Line 214
	jmp	$L508
; Line 216
$L513:
; Line 217
	add	DWORD PTR _p$[ebp], 4
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax-4]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _rt_val$[ebp]
	mov	DWORD PTR [edx+ecx*4+4], eax
; Line 218
	jmp	$L508
; Line 220
$L514:
; Line 222
	add	DWORD PTR _p$[ebp], 4
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax-4]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _rt_val$[ebp]
	mov	DWORD PTR [edx+ecx*4+4], eax
; Line 223
	jmp	$L508
; Line 225
$L515:
; Line 226
	add	DWORD PTR _p$[ebp], 4
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax-4]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _rt_val$[ebp]
	mov	DWORD PTR [edx+ecx*4+4], eax
; Line 227
	jmp	$L508
; Line 229
$L516:
; Line 230
	call	_abort
; Line 231
	jmp	$L508
$L507:
	cmp	DWORD PTR -36+[ebp], 105		; 00000069H
	jg	$L963
	je	$L512
	cmp	DWORD PTR -36+[ebp], 48			; 00000030H
	je	$L508
	cmp	DWORD PTR -36+[ebp], 69			; 00000045H
	je	$L515
	cmp	DWORD PTR -36+[ebp], 101		; 00000065H
	je	$L514
	jmp	$L516
$L963:
	cmp	DWORD PTR -36+[ebp], 115		; 00000073H
	je	$L513
	cmp	DWORD PTR -36+[ebp], 117		; 00000075H
	je	$L514
	jmp	$L516
$L508:
; Line 232
	jmp	$L505
$L506:
; Line 233
$L503:
; Line 235
	mov	eax, DWORD PTR _rt_val$[ebp]
	jmp	$L492
; Line 236
$L492:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_rtx ENDP
_TEXT	ENDS
PUBLIC	_gen_rtvec
PUBLIC	_gen_rtvec_v
EXTRN	_alloca:NEAR
_TEXT	SEGMENT
_va_alist$ = 8
_n$ = -16
_i$ = -8
_p$ = -12
_vector$ = -4
_gen_rtvec PROC NEAR
; Line 248
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 253
	lea	eax, DWORD PTR _va_alist$[ebp]
	mov	DWORD PTR _p$[ebp], eax
; Line 254
	add	DWORD PTR _p$[ebp], 4
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax-4]
	mov	DWORD PTR _n$[ebp], eax
; Line 256
	cmp	DWORD PTR _n$[ebp], 0
	jne	$L524
; Line 257
	sub	eax, eax
	jmp	$L519
; Line 259
$L524:
	mov	eax, DWORD PTR _n$[ebp]
	shl	eax, 2
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _vector$[ebp], eax
; Line 260
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L526
$L527:
	inc	DWORD PTR _i$[ebp]
$L526:
	mov	eax, DWORD PTR _n$[ebp]
	cmp	DWORD PTR _i$[ebp], eax
	jge	$L528
; Line 261
	add	DWORD PTR _p$[ebp], 4
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax-4]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _vector$[ebp]
	mov	DWORD PTR [edx+ecx*4], eax
	jmp	$L527
$L528:
; Line 264
	mov	eax, DWORD PTR _vector$[ebp]
	push	eax
	mov	eax, DWORD PTR _n$[ebp]
	push	eax
	call	_gen_rtvec_v
	add	esp, 8
	jmp	$L519
; Line 265
$L519:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_rtvec ENDP
_TEXT	ENDS
EXTRN	_rtvec_alloc:NEAR
_TEXT	SEGMENT
_n$ = 8
_argp$ = 12
_i$ = -4
_rt_val$ = -8
_gen_rtvec_v PROC NEAR
; Line 271
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 275
	cmp	DWORD PTR _n$[ebp], 0
	jne	$L534
; Line 276
	sub	eax, eax
	jmp	$L531
; Line 278
$L534:
	mov	eax, DWORD PTR _n$[ebp]
	push	eax
	call	_rtvec_alloc
	add	esp, 4
	mov	DWORD PTR _rt_val$[ebp], eax
; Line 280
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L535
$L536:
	inc	DWORD PTR _i$[ebp]
$L535:
	mov	eax, DWORD PTR _n$[ebp]
	cmp	DWORD PTR _i$[ebp], eax
	jge	$L537
; Line 281
	mov	eax, DWORD PTR _argp$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _rt_val$[ebp]
	mov	DWORD PTR [edx+ecx*4+4], eax
	add	DWORD PTR _argp$[ebp], 4
	jmp	$L536
$L537:
; Line 283
	mov	eax, DWORD PTR _rt_val$[ebp]
	jmp	$L531
; Line 284
$L531:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_rtvec_v ENDP
_TEXT	ENDS
PUBLIC	_gen_reg_rtx
EXTRN	_oballoc:NEAR
EXTRN	_memset:NEAR
EXTRN	_memcpy:NEAR
_TEXT	SEGMENT
_mode$ = 8
_val$ = -4
_new1$542 = -12
_new$543 = -8
_gen_reg_rtx PROC NEAR
; Line 292
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 298
	mov	eax, DWORD PTR _reg_rtx_no
	cmp	DWORD PTR _regno_pointer_flag_length, eax
	jne	$L541
; Line 302
	mov	eax, DWORD PTR _regno_pointer_flag_length
	add	eax, eax
	push	eax
	call	_oballoc
	add	esp, 4
	mov	DWORD PTR _new$543[ebp], eax
; Line 303
	mov	eax, DWORD PTR _regno_pointer_flag_length
	add	eax, eax
	push	eax
	push	0
	mov	eax, DWORD PTR _new$543[ebp]
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 304
	mov	eax, DWORD PTR _regno_pointer_flag_length
	push	eax
	mov	eax, DWORD PTR _regno_pointer_flag
	push	eax
	mov	eax, DWORD PTR _new$543[ebp]
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
; Line 305
	mov	eax, DWORD PTR _new$543[ebp]
	mov	DWORD PTR _regno_pointer_flag, eax
; Line 307
	mov	eax, DWORD PTR _regno_pointer_flag_length
	shl	eax, 3
	push	eax
	call	_oballoc
	add	esp, 4
	mov	DWORD PTR _new1$542[ebp], eax
; Line 308
	mov	eax, DWORD PTR _regno_pointer_flag_length
	shl	eax, 3
	push	eax
	push	0
	mov	eax, DWORD PTR _new1$542[ebp]
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 309
	mov	eax, DWORD PTR _regno_pointer_flag_length
	shl	eax, 2
	push	eax
	mov	eax, DWORD PTR _regno_reg_rtx
	push	eax
	mov	eax, DWORD PTR _new1$542[ebp]
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
; Line 310
	mov	eax, DWORD PTR _new1$542[ebp]
	mov	DWORD PTR _regno_reg_rtx, eax
; Line 312
	shl	DWORD PTR _regno_pointer_flag_length, 1
; Line 315
$L541:
	mov	eax, DWORD PTR _reg_rtx_no
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	push	34					; 00000022H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _val$[ebp], eax
; Line 316
	mov	eax, DWORD PTR _val$[ebp]
	mov	ecx, DWORD PTR _reg_rtx_no
	mov	edx, DWORD PTR _regno_reg_rtx
	mov	DWORD PTR [edx+ecx*4], eax
	inc	DWORD PTR _reg_rtx_no
; Line 317
	mov	eax, DWORD PTR _val$[ebp]
	jmp	$L539
; Line 318
$L539:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_reg_rtx ENDP
_TEXT	ENDS
PUBLIC	_mark_reg_pointer
_TEXT	SEGMENT
_reg$ = 8
_mark_reg_pointer PROC NEAR
; Line 325
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 326
	mov	eax, DWORD PTR _reg$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _regno_pointer_flag
	mov	BYTE PTR [eax+ecx], 1
; Line 327
$L549:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_mark_reg_pointer ENDP
_TEXT	ENDS
PUBLIC	_max_reg_num
_TEXT	SEGMENT
_max_reg_num PROC NEAR
; Line 333
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 334
	mov	eax, DWORD PTR _reg_rtx_no
	jmp	$L551
; Line 335
$L551:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_max_reg_num ENDP
_TEXT	ENDS
PUBLIC	_max_label_num
_TEXT	SEGMENT
_max_label_num PROC NEAR
; Line 341
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 342
	mov	eax, DWORD PTR _label_num$S477
	jmp	$L553
; Line 343
$L553:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_max_label_num ENDP
_TEXT	ENDS
PUBLIC	_get_first_label_num
_BSS	SEGMENT
_first_label_num$S478 DD 01H DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
_get_first_label_num PROC NEAR
; Line 349
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 350
	mov	eax, DWORD PTR _first_label_num$S478
	jmp	$L555
; Line 351
$L555:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_get_first_label_num ENDP
_TEXT	ENDS
PUBLIC	_gen_lowpart
PUBLIC	_change_address
EXTRN	_mode_size:BYTE
EXTRN	_mode_unit_size:BYTE
EXTRN	_plus_constant:NEAR
_TEXT	SEGMENT
_mode$ = 8
_x$ = 12
_offset$564 = -4
_gen_lowpart PROC NEAR
; Line 363
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 367
	mov	eax, DWORD PTR _mode$[ebp]
	cmp	DWORD PTR _mode_size[eax*4], 4
	jle	$L559
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	ecx, DWORD PTR _mode$[ebp]
	mov	ecx, DWORD PTR _mode_size[ecx*4]
	cmp	DWORD PTR _mode_unit_size[eax], ecx
	je	$L559
; Line 368
	call	_abort
; Line 369
$L559:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	cmp	eax, DWORD PTR _mode$[ebp]
	jne	$L560
; Line 370
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L558
; Line 371
$L560:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L561
; Line 372
	mov	eax, DWORD PTR _mode$[ebp]
	mov	eax, DWORD PTR _mode_size[eax*4]
	shl	eax, 3
	cmp	eax, 32					; 00000020H
	jl	$L964
	mov	DWORD PTR -8+[ebp], -1
	jmp	$L965
$L964:
	mov	eax, 1
	mov	ecx, DWORD PTR _mode$[ebp]
	mov	ecx, DWORD PTR _mode_size[ecx*4]
	shl	ecx, 3
	shl	eax, cl
	dec	eax
	mov	DWORD PTR -8+[ebp], eax
$L965:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	and	eax, DWORD PTR -8+[ebp]
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	jmp	$L558
; Line 373
$L561:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2031616				; 001f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L562
; Line 378
	mov	eax, DWORD PTR _mode$[ebp]
	mov	eax, DWORD PTR _mode_size[eax*4]
	shl	eax, 3
	cmp	eax, 32					; 00000020H
	jl	$L966
	mov	DWORD PTR -12+[ebp], -1
	jmp	$L967
$L966:
	mov	eax, 1
	mov	ecx, DWORD PTR _mode$[ebp]
	mov	ecx, DWORD PTR _mode_size[ecx*4]
	shl	ecx, 3
	shl	eax, cl
	dec	eax
	mov	DWORD PTR -12+[ebp], eax
$L967:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+12]
	and	eax, DWORD PTR -12+[ebp]
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	jmp	$L558
; Line 379
$L562:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L563
; Line 381
	mov	DWORD PTR _offset$564[ebp], 0
; Line 392
	mov	eax, DWORD PTR _offset$564[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_plus_constant
	add	esp, 8
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_change_address
	add	esp, 12					; 0000000cH
	jmp	$L558
; Line 394
	jmp	$L565
$L563:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L566
; Line 397
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	cmp	eax, DWORD PTR _mode$[ebp]
	jne	$L968
	mov	eax, DWORD PTR _x$[ebp]
	cmp	DWORD PTR [eax+8], 0
	jne	$L968
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	jmp	$L969
$L968:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	push	35					; 00000023H
	call	_gen_rtx
	add	esp, 16					; 00000010H
$L969:
	jmp	$L558
; Line 398
	jmp	$L567
$L566:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L568
; Line 409
	push	0
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	push	35					; 00000023H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L558
; Line 411
	jmp	$L569
$L568:
; Line 412
	call	_abort
$L569:
$L567:
$L565:
; Line 413
$L558:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_lowpart ENDP
_TEXT	ENDS
PUBLIC	_gen_highpart
_TEXT	SEGMENT
_mode$ = 8
_x$ = 12
_offset$574 = -4
_gen_highpart PROC NEAR
; Line 421
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 422
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L573
; Line 424
	mov	DWORD PTR _offset$574[ebp], 0
; Line 427
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	cmp	eax, 4
	jg	$L970
	mov	eax, 4
$L970:
	mov	ecx, DWORD PTR _mode$[ebp]
	mov	ecx, DWORD PTR _mode_size[ecx*4]
	cmp	ecx, 4
	jg	$L971
	mov	ecx, 4
$L971:
	sub	eax, ecx
	mov	DWORD PTR _offset$574[ebp], eax
; Line 430
	mov	eax, DWORD PTR _mode$[ebp]
	cmp	DWORD PTR _mode_size[eax*4], 4
	jge	$L575
; Line 433
	sub	eax, eax
	mov	ecx, DWORD PTR _mode$[ebp]
	mov	ecx, DWORD PTR _mode_size[ecx*4]
	mov	edx, DWORD PTR _x$[ebp]
	mov	edx, DWORD PTR [edx]
	shl	edx, 8
	and	edx, -12582913				; ff3fffffH
	sar	edx, 22					; 00000016H
	mov	edx, DWORD PTR _mode_size[edx]
	cmp	edx, 4
	jl	$L972
	mov	edx, 4
$L972:
	sub	ecx, edx
	sub	eax, ecx
	neg	eax
	sub	DWORD PTR _offset$574[ebp], eax
; Line 435
$L575:
	mov	eax, DWORD PTR _offset$574[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_plus_constant
	add	esp, 8
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_change_address
	add	esp, 12					; 0000000cH
	jmp	$L572
; Line 437
	jmp	$L576
$L573:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L577
; Line 440
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	cmp	DWORD PTR _mode_size[eax], 4
	jle	$L578
; Line 445
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	mov	ecx, DWORD PTR _mode$[ebp]
	mov	ecx, DWORD PTR _mode_size[ecx*4]
	cmp	ecx, 4
	jg	$L973
	mov	ecx, 4
$L973:
	sub	eax, ecx
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	push	35					; 00000023H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L572
; Line 448
$L578:
	push	0
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	push	35					; 00000023H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L572
; Line 450
	jmp	$L579
$L577:
; Line 451
	call	_abort
$L579:
$L576:
; Line 452
$L572:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_highpart ENDP
_TEXT	ENDS
PUBLIC	_subreg_lowpart_p
_TEXT	SEGMENT
_x$ = 8
_subreg_lowpart_p PROC NEAR
; Line 461
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 462
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L582
; Line 463
	mov	eax, 1
	jmp	$L581
; Line 474
$L582:
	mov	eax, DWORD PTR _x$[ebp]
	cmp	DWORD PTR [eax+8], 1
	sbb	eax, eax
	neg	eax
	jmp	$L581
; Line 475
$L581:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_subreg_lowpart_p ENDP
_TEXT	ENDS
EXTRN	_memory_address:NEAR
_TEXT	SEGMENT
_memref$ = 8
_mode$ = 12
_addr$ = 16
_new$ = -4
_change_address PROC NEAR
; Line 487
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 490
	mov	eax, DWORD PTR _memref$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L588
; Line 491
	call	_abort
; Line 492
$L588:
	cmp	DWORD PTR _mode$[ebp], 0
	jne	$L589
; Line 493
	mov	eax, DWORD PTR _memref$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	mov	DWORD PTR _mode$[ebp], eax
; Line 494
$L589:
	cmp	DWORD PTR _addr$[ebp], 0
	jne	$L590
; Line 495
	mov	eax, DWORD PTR _memref$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _addr$[ebp], eax
; Line 497
$L590:
	mov	eax, DWORD PTR _addr$[ebp]
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
	mov	DWORD PTR _new$[ebp], eax
; Line 498
	mov	eax, DWORD PTR _memref$[ebp]
	mov	eax, DWORD PTR [eax]
	shr	eax, 27					; 0000001bH
	and	eax, 1
	shl	eax, 27					; 0000001bH
	mov	ecx, DWORD PTR _new$[ebp]
	mov	ecx, DWORD PTR [ecx]
	and	ecx, -134217729				; f7ffffffH
	or	eax, ecx
	mov	ecx, DWORD PTR _new$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 499
	mov	eax, DWORD PTR _memref$[ebp]
	mov	eax, DWORD PTR [eax]
	shr	eax, 26					; 0000001aH
	and	eax, 1
	shl	eax, 26					; 0000001aH
	mov	ecx, DWORD PTR _new$[ebp]
	mov	ecx, DWORD PTR [ecx]
	and	ecx, -67108865				; fbffffffH
	or	eax, ecx
	mov	ecx, DWORD PTR _new$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 500
	mov	eax, DWORD PTR _memref$[ebp]
	mov	eax, DWORD PTR [eax]
	shr	eax, 28					; 0000001cH
	and	eax, 1
	shl	eax, 28					; 0000001cH
	mov	ecx, DWORD PTR _new$[ebp]
	mov	ecx, DWORD PTR [ecx]
	and	ecx, -268435457				; efffffffH
	or	eax, ecx
	mov	ecx, DWORD PTR _new$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 501
	mov	eax, DWORD PTR _new$[ebp]
	jmp	$L586
; Line 502
$L586:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_change_address ENDP
_TEXT	ENDS
PUBLIC	_gen_label_rtx
_TEXT	SEGMENT
_label$ = -4
_gen_label_rtx PROC NEAR
; Line 508
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 509
	mov	eax, DWORD PTR _label_num$S477
	mov	DWORD PTR -8+[ebp], eax
	inc	DWORD PTR _label_num$S477
	mov	eax, DWORD PTR -8+[ebp]
	push	eax
	push	0
	push	0
	push	0
	push	0
	push	17					; 00000011H
	call	_gen_rtx
	add	esp, 24					; 00000018H
	mov	DWORD PTR _label$[ebp], eax
; Line 510
	mov	eax, DWORD PTR _label$[ebp]
	mov	DWORD PTR [eax+20], 0
; Line 511
	mov	eax, DWORD PTR _label$[ebp]
	jmp	$L591
; Line 512
$L591:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_label_rtx ENDP
_TEXT	ENDS
PUBLIC	_gen_inline_header_rtx
_TEXT	SEGMENT
_insn$ = 8
_last_insn$ = 12
_first_labelno$ = 16
_last_labelno$ = 20
_max_parm_regnum$ = 24
_max_regnum$ = 28
_args_size$ = 32
_stack_slots$ = 36
_header$ = -4
_gen_inline_header_rtx PROC NEAR
; Line 527
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 532
	mov	eax, DWORD PTR _cur_insn_uid$S484
	mov	DWORD PTR -8+[ebp], eax
	inc	DWORD PTR _cur_insn_uid$S484
	mov	eax, DWORD PTR _stack_slots$[ebp]
	push	eax
	mov	eax, DWORD PTR _args_size$[ebp]
	push	eax
	mov	eax, DWORD PTR _max_regnum$[ebp]
	push	eax
	mov	eax, DWORD PTR _max_parm_regnum$[ebp]
	push	eax
	mov	eax, DWORD PTR _last_labelno$[ebp]
	push	eax
	mov	eax, DWORD PTR _first_labelno$[ebp]
	push	eax
	mov	eax, DWORD PTR _last_insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	push	0
	mov	eax, DWORD PTR -8+[ebp]
	push	eax
	push	0
	push	19					; 00000013H
	call	_gen_rtx
	add	esp, 48					; 00000030H
	mov	DWORD PTR _header$[ebp], eax
; Line 533
	mov	eax, DWORD PTR _header$[ebp]
	jmp	$L601
; Line 534
$L601:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_inline_header_rtx ENDP
_TEXT	ENDS
PUBLIC	_set_new_first_and_last_insn
_TEXT	SEGMENT
_first$ = 8
_last$ = 12
_set_new_first_and_last_insn PROC NEAR
; Line 542
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 543
	mov	eax, DWORD PTR _first$[ebp]
	mov	DWORD PTR _first_insn$S481, eax
; Line 544
	mov	eax, DWORD PTR _last$[ebp]
	mov	DWORD PTR _last_insn$S482, eax
; Line 545
$L606:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_set_new_first_and_last_insn ENDP
_TEXT	ENDS
PUBLIC	_unshare_all_rtl
EXTRN	_stack_slot_list:DWORD
_TEXT	SEGMENT
_insn$ = 8
_unshare_all_rtl PROC NEAR
; Line 558
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 561
	jmp	$L613
$L614:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _insn$[ebp], eax
$L613:
	cmp	DWORD PTR _insn$[ebp], 0
	je	$L615
; Line 563
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 851968				; 000d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L617
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 917504				; 000e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L617
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 983040				; 000f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L616
$L617:
; Line 565
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_copy_rtx_if_shared
	add	esp, 4
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 566
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	call	_copy_rtx_if_shared
	add	esp, 4
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 567
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_copy_rtx_if_shared
	add	esp, 4
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	DWORD PTR [ecx+24], eax
; Line 573
$L616:
	jmp	$L614
$L615:
	mov	eax, DWORD PTR _stack_slot_list
	push	eax
	call	_copy_rtx_if_shared
	add	esp, 4
; Line 574
$L611:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_unshare_all_rtl ENDP
_copy$642 = -24
_j$653 = -28
_orig$ = 8
_x$ = -4
_i$ = -8
_code$ = -20
_format_ptr$ = -16
_copied$ = -12
_copy_rtx_if_shared PROC NEAR
; Line 582
	push	ebp
	mov	ebp, esp
	sub	esp, 40					; 00000028H
	push	ebx
	push	esi
	push	edi
; Line 583
	mov	eax, DWORD PTR _orig$[ebp]
	mov	DWORD PTR _x$[ebp], eax
; Line 587
	mov	DWORD PTR _copied$[ebp], 0
; Line 589
	cmp	DWORD PTR _x$[ebp], 0
	jne	$L625
; Line 590
	sub	eax, eax
	jmp	$L619
; Line 592
$L625:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$[ebp], eax
; Line 596
	mov	eax, DWORD PTR _code$[ebp]
	mov	DWORD PTR -36+[ebp], eax
	jmp	$L626
; Line 598
$L630:
; Line 606
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L619
; Line 608
$L631:
; Line 615
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L619
; Line 617
$L632:
; Line 620
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L634
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L634
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L634
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L633
$L634:
; Line 621
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L619
; Line 622
$L633:
; Line 625
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L635
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _frame_pointer_rtx
	cmp	DWORD PTR [eax+4], ecx
	je	$L636
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _arg_pointer_rtx
	cmp	DWORD PTR [eax+4], ecx
	jne	$L635
$L636:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L637
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L637
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L637
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L635
$L637:
; Line 629
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shr	eax, 29					; 0000001dH
	test	al, 1
	jne	$L638
; Line 630
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_copy_rtx_if_shared
	add	esp, 4
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 631
$L638:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	or	eax, 536870912				; 20000000H
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 632
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L619
; Line 634
$L635:
; Line 635
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR _frame_pointer_rtx
	cmp	DWORD PTR [eax+4], ecx
	je	$L640
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR _arg_pointer_rtx
	cmp	DWORD PTR [eax+4], ecx
	jne	$L639
$L640:
; Line 636
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L619
; Line 637
$L639:
	jmp	$L627
$L626:
	sub	DWORD PTR -36+[ebp], 13			; 0000000dH
	cmp	DWORD PTR -36+[ebp], 28			; 0000001cH
	ja	$L627
	shl	DWORD PTR -36+[ebp], 2
	mov	eax, DWORD PTR -36+[ebp]
	jmp	DWORD PTR $L974[eax]
$L974:
	DD	OFFSET $L631
	DD	OFFSET $L631
	DD	OFFSET $L631
	DD	OFFSET $L631
	DD	OFFSET $L630
	DD	OFFSET $L631
	DD	OFFSET $L627
	DD	OFFSET $L627
	DD	OFFSET $L627
	DD	OFFSET $L627
	DD	OFFSET $L627
	DD	OFFSET $L627
	DD	OFFSET $L627
	DD	OFFSET $L627
	DD	OFFSET $L627
	DD	OFFSET $L627
	DD	OFFSET $L627
	DD	OFFSET $L630
	DD	OFFSET $L630
	DD	OFFSET $L627
	DD	OFFSET $L630
	DD	OFFSET $L630
	DD	OFFSET $L627
	DD	OFFSET $L627
	DD	OFFSET $L632
	DD	OFFSET $L631
	DD	OFFSET $L630
	DD	OFFSET $L630
	DD	OFFSET $L630
$L627:
; Line 642
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shr	eax, 29					; 0000001dH
	test	al, 1
	je	$L641
; Line 646
	inc	DWORD PTR _unshare_copies$S607
; Line 648
	mov	eax, DWORD PTR _code$[ebp]
	push	eax
	call	_rtx_alloc
	add	esp, 4
	mov	DWORD PTR _copy$642[ebp], eax
; Line 650
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_length[eax*4]
	shl	eax, 2
	add	eax, 4
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	mov	eax, DWORD PTR _copy$642[ebp]
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
; Line 651
	mov	eax, DWORD PTR _copy$642[ebp]
	mov	DWORD PTR _x$[ebp], eax
; Line 652
	mov	DWORD PTR _copied$[ebp], 1
; Line 654
$L641:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	or	eax, 536870912				; 20000000H
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 661
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_format[eax*4]
	mov	DWORD PTR _format_ptr$[ebp], eax
; Line 663
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L643
$L644:
	inc	DWORD PTR _i$[ebp]
$L643:
	mov	eax, DWORD PTR _code$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _rtx_length[eax*4], ecx
	jle	$L645
; Line 665
	mov	eax, DWORD PTR _format_ptr$[ebp]
	mov	DWORD PTR -32+[ebp], eax
	inc	DWORD PTR _format_ptr$[ebp]
	mov	eax, DWORD PTR -32+[ebp]
	movsx	eax, BYTE PTR [eax]
	mov	DWORD PTR -40+[ebp], eax
	jmp	$L646
; Line 667
$L650:
; Line 668
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	push	eax
	call	_copy_rtx_if_shared
	add	esp, 4
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [edx+ecx*4+4], eax
; Line 669
	jmp	$L647
; Line 671
$L651:
; Line 672
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	cmp	DWORD PTR [ecx+eax*4+4], 0
	je	$L652
; Line 676
	cmp	DWORD PTR _copied$[ebp], 0
	je	$L654
; Line 677
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
; Line 678
$L654:
	mov	DWORD PTR _j$653[ebp], 0
	jmp	$L655
$L656:
	inc	DWORD PTR _j$653[ebp]
$L655:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$653[ebp]
	cmp	DWORD PTR [eax], ecx
	jbe	$L657
; Line 680
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$653[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	push	eax
	call	_copy_rtx_if_shared
	add	esp, 4
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR [edx+ecx*4+4]
	mov	edx, DWORD PTR _j$653[ebp]
	mov	DWORD PTR [ecx+edx*4+4], eax
	jmp	$L656
$L657:
; Line 682
$L652:
	jmp	$L647
; Line 683
	jmp	$L647
$L646:
	cmp	DWORD PTR -40+[ebp], 69			; 00000045H
	je	$L651
	cmp	DWORD PTR -40+[ebp], 101		; 00000065H
	je	$L650
	jmp	$L647
$L647:
; Line 684
	jmp	$L644
$L645:
; Line 685
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L619
; Line 686
$L619:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_copy_rtx_if_shared ENDP
_TEXT	ENDS
PUBLIC	_make_safe_from
EXTRN	_reg_mentioned_p:NEAR
EXTRN	_emit_move_insn:NEAR
_TEXT	SEGMENT
_x$ = 8
_other$ = 12
_temp$677 = -4
_make_safe_from PROC NEAR
; Line 695
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 696
$L662:
; Line 697
	mov	eax, DWORD PTR _other$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR -8+[ebp], eax
	jmp	$L664
; Line 699
$L668:
; Line 700
	mov	eax, DWORD PTR _other$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _other$[ebp], eax
; Line 701
	jmp	$L665
; Line 702
$L669:
; Line 705
	mov	eax, DWORD PTR _other$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _other$[ebp], eax
; Line 706
	jmp	$L665
; Line 707
$L670:
; Line 708
	jmp	$done$671
; Line 709
	jmp	$L665
$L664:
	cmp	DWORD PTR -8+[ebp], 35			; 00000023H
	je	$L668
	cmp	DWORD PTR -8+[ebp], 36			; 00000024H
	je	$L669
	cmp	DWORD PTR -8+[ebp], 77			; 0000004dH
	jl	$done$671
	cmp	DWORD PTR -8+[ebp], 78			; 0000004eH
	jle	$L669
	jmp	$done$671
$L665:
	jmp	$L662
$L663:
; Line 710
$done$671:
; Line 718
	mov	eax, DWORD PTR _other$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L675
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L675
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L675
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L675
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L675
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2031616				; 001f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L675
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L675
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L674
$L675:
	mov	eax, DWORD PTR _other$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L673
	mov	eax, DWORD PTR _other$[ebp]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L676
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	mov	eax, DWORD PTR _other$[ebp]
	push	eax
	call	_reg_mentioned_p
	add	esp, 8
	or	eax, eax
	je	$L673
$L676:
$L674:
; Line 720
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	call	_gen_reg_rtx
	add	esp, 4
	mov	DWORD PTR _temp$677[ebp], eax
; Line 721
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	mov	eax, DWORD PTR _temp$677[ebp]
	push	eax
	call	_emit_move_insn
	add	esp, 8
; Line 722
	mov	eax, DWORD PTR _temp$677[ebp]
	jmp	$L660
; Line 724
$L673:
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L660
; Line 725
$L660:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_make_safe_from ENDP
_TEXT	ENDS
PUBLIC	_get_insns
_TEXT	SEGMENT
_get_insns PROC NEAR
; Line 733
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 734
	mov	eax, DWORD PTR _first_insn$S481
	jmp	$L678
; Line 735
$L678:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_get_insns ENDP
_TEXT	ENDS
PUBLIC	_get_last_insn
_TEXT	SEGMENT
_get_last_insn PROC NEAR
; Line 741
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 742
	mov	eax, DWORD PTR _last_insn$S482
	jmp	$L679
; Line 743
$L679:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_get_last_insn ENDP
_TEXT	ENDS
PUBLIC	_set_last_insn
_TEXT	SEGMENT
_insn$ = 8
_set_last_insn PROC NEAR
; Line 750
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 751
	mov	eax, DWORD PTR _insn$[ebp]
	cmp	DWORD PTR [eax+12], 0
	je	$L683
; Line 752
	call	_abort
; Line 753
$L683:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	DWORD PTR _last_insn$S482, eax
; Line 754
$L682:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_set_last_insn ENDP
_TEXT	ENDS
PUBLIC	_get_max_uid
_TEXT	SEGMENT
_get_max_uid PROC NEAR
; Line 760
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 761
	mov	eax, DWORD PTR _cur_insn_uid$S484
	jmp	$L685
; Line 762
$L685:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_get_max_uid ENDP
_TEXT	ENDS
PUBLIC	_next_insn
_TEXT	SEGMENT
_insn$ = 8
_next_insn PROC NEAR
; Line 767
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 768
	cmp	DWORD PTR _insn$[ebp], 0
	je	$L689
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	jmp	$L688
; Line 769
$L689:
	sub	eax, eax
	jmp	$L688
; Line 770
$L688:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_next_insn ENDP
_TEXT	ENDS
PUBLIC	_previous_insn
_TEXT	SEGMENT
_insn$ = 8
_previous_insn PROC NEAR
; Line 775
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 776
	cmp	DWORD PTR _insn$[ebp], 0
	je	$L693
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	jmp	$L692
; Line 777
$L693:
	sub	eax, eax
	jmp	$L692
; Line 778
$L692:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_previous_insn ENDP
_pattern$ = 8
_insn$ = -4
_make_insn_raw PROC NEAR
; Line 788
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 791
	push	13					; 0000000dH
	call	_rtx_alloc
	add	esp, 4
	mov	DWORD PTR _insn$[ebp], eax
; Line 792
	mov	eax, DWORD PTR _cur_insn_uid$S484
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	DWORD PTR [ecx+4], eax
	inc	DWORD PTR _cur_insn_uid$S484
; Line 794
	mov	eax, DWORD PTR _pattern$[ebp]
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 795
	mov	eax, DWORD PTR _insn$[ebp]
	mov	DWORD PTR [eax+20], -1
; Line 796
	mov	eax, DWORD PTR _insn$[ebp]
	mov	DWORD PTR [eax+24], 0
; Line 797
	mov	eax, DWORD PTR _insn$[ebp]
	mov	DWORD PTR [eax+28], 0
; Line 799
	mov	eax, DWORD PTR _insn$[ebp]
	jmp	$L697
; Line 800
$L697:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_make_insn_raw ENDP
_pattern$ = 8
_insn$ = -4
_make_jump_insn_raw PROC NEAR
; Line 808
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 811
	push	14					; 0000000eH
	call	_rtx_alloc
	add	esp, 4
	mov	DWORD PTR _insn$[ebp], eax
; Line 812
	mov	eax, DWORD PTR _cur_insn_uid$S484
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	DWORD PTR [ecx+4], eax
	inc	DWORD PTR _cur_insn_uid$S484
; Line 814
	mov	eax, DWORD PTR _pattern$[ebp]
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 815
	mov	eax, DWORD PTR _insn$[ebp]
	mov	DWORD PTR [eax+20], -1
; Line 816
	mov	eax, DWORD PTR _insn$[ebp]
	mov	DWORD PTR [eax+24], 0
; Line 817
	mov	eax, DWORD PTR _insn$[ebp]
	mov	DWORD PTR [eax+28], 0
; Line 818
	mov	eax, DWORD PTR _insn$[ebp]
	mov	DWORD PTR [eax+32], 0
; Line 820
	mov	eax, DWORD PTR _insn$[ebp]
	jmp	$L702
; Line 821
$L702:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_make_jump_insn_raw ENDP
_insn$ = 8
_add_insn PROC NEAR
; Line 829
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 830
	mov	eax, DWORD PTR _last_insn$S482
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 831
	mov	eax, DWORD PTR _insn$[ebp]
	mov	DWORD PTR [eax+12], 0
; Line 833
	cmp	DWORD PTR _last_insn$S482, 0
	je	$L707
; Line 834
	mov	eax, DWORD PTR _insn$[ebp]
	mov	ecx, DWORD PTR _last_insn$S482
	mov	DWORD PTR [ecx+12], eax
; Line 836
$L707:
	cmp	DWORD PTR _first_insn$S481, 0
	jne	$L708
; Line 837
	mov	eax, DWORD PTR _insn$[ebp]
	mov	DWORD PTR _first_insn$S481, eax
; Line 839
$L708:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	DWORD PTR _last_insn$S482, eax
; Line 840
$L706:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_add_insn ENDP
_insn$ = 8
_after$ = 12
_stack$717 = -4
_add_insn_after PROC NEAR
; Line 848
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 849
	mov	eax, DWORD PTR _after$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	DWORD PTR [ecx+12], eax
; Line 850
	mov	eax, DWORD PTR _after$[ebp]
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 852
	mov	eax, DWORD PTR _insn$[ebp]
	cmp	DWORD PTR [eax+12], 0
	je	$L713
; Line 853
	mov	eax, DWORD PTR _insn$[ebp]
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	ecx, DWORD PTR [ecx+12]
	mov	DWORD PTR [ecx+8], eax
; Line 854
	jmp	$L714
$L713:
	mov	eax, DWORD PTR _last_insn$S482
	cmp	DWORD PTR _after$[ebp], eax
	jne	$L715
; Line 855
	mov	eax, DWORD PTR _insn$[ebp]
	mov	DWORD PTR _last_insn$S482, eax
; Line 856
	jmp	$L716
$L715:
; Line 858
	mov	eax, DWORD PTR _sequence_stack
	mov	DWORD PTR _stack$717[ebp], eax
; Line 860
	jmp	$L718
$L719:
	mov	eax, DWORD PTR _stack$717[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _stack$717[ebp], eax
$L718:
	cmp	DWORD PTR _stack$717[ebp], 0
	je	$L720
; Line 861
	mov	eax, DWORD PTR _stack$717[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _after$[ebp]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L721
; Line 862
	mov	eax, DWORD PTR _insn$[ebp]
	mov	ecx, DWORD PTR _stack$717[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	mov	DWORD PTR [ecx+4], eax
; Line 863
$L721:
	jmp	$L719
$L720:
$L716:
$L714:
; Line 865
	mov	eax, DWORD PTR _insn$[ebp]
	mov	ecx, DWORD PTR _after$[ebp]
	mov	DWORD PTR [ecx+12], eax
; Line 866
$L712:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_add_insn_after ENDP
_TEXT	ENDS
PUBLIC	_delete_insns_since
_TEXT	SEGMENT
_from$ = 8
_delete_insns_since PROC NEAR
; Line 874
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 875
	cmp	DWORD PTR _from$[ebp], 0
	jne	$L725
; Line 876
	mov	DWORD PTR _first_insn$S481, 0
; Line 877
	jmp	$L726
$L725:
; Line 878
	mov	eax, DWORD PTR _from$[ebp]
	mov	DWORD PTR [eax+12], 0
$L726:
; Line 879
	mov	eax, DWORD PTR _from$[ebp]
	mov	DWORD PTR _last_insn$S482, eax
; Line 880
$L724:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_delete_insns_since ENDP
_TEXT	ENDS
PUBLIC	_reorder_insns
_TEXT	SEGMENT
_from$ = 8
_to$ = 12
_after$ = 16
_reorder_insns PROC NEAR
; Line 889
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 891
	mov	eax, DWORD PTR _from$[ebp]
	cmp	DWORD PTR [eax+8], 0
	je	$L732
; Line 892
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	ecx, DWORD PTR _from$[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	mov	DWORD PTR [ecx+12], eax
; Line 893
$L732:
	mov	eax, DWORD PTR _to$[ebp]
	cmp	DWORD PTR [eax+12], 0
	je	$L733
; Line 894
	mov	eax, DWORD PTR _from$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _to$[ebp]
	mov	ecx, DWORD PTR [ecx+12]
	mov	DWORD PTR [ecx+8], eax
; Line 895
$L733:
	mov	eax, DWORD PTR _last_insn$S482
	cmp	DWORD PTR _to$[ebp], eax
	jne	$L734
; Line 896
	mov	eax, DWORD PTR _from$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _last_insn$S482, eax
; Line 897
$L734:
	mov	eax, DWORD PTR _first_insn$S481
	cmp	DWORD PTR _from$[ebp], eax
	jne	$L735
; Line 898
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _first_insn$S481, eax
; Line 901
$L735:
	mov	eax, DWORD PTR _after$[ebp]
	cmp	DWORD PTR [eax+12], 0
	je	$L736
; Line 903
	mov	eax, DWORD PTR _to$[ebp]
	mov	ecx, DWORD PTR _after$[ebp]
	mov	ecx, DWORD PTR [ecx+12]
	mov	DWORD PTR [ecx+8], eax
; Line 904
	mov	eax, DWORD PTR _after$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	ecx, DWORD PTR _to$[ebp]
	mov	DWORD PTR [ecx+12], eax
; Line 906
$L736:
	mov	eax, DWORD PTR _after$[ebp]
	mov	ecx, DWORD PTR _from$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 907
	mov	eax, DWORD PTR _from$[ebp]
	mov	ecx, DWORD PTR _after$[ebp]
	mov	DWORD PTR [ecx+12], eax
; Line 908
	mov	eax, DWORD PTR _last_insn$S482
	cmp	DWORD PTR _after$[ebp], eax
	jne	$L737
; Line 909
	mov	eax, DWORD PTR _to$[ebp]
	mov	DWORD PTR _last_insn$S482, eax
; Line 910
$L737:
$L731:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_reorder_insns ENDP
_TEXT	ENDS
PUBLIC	_emit_insn_before
_TEXT	SEGMENT
_pattern$ = 8
_before$ = 12
_insn$ = -4
_i$743 = -8
_emit_insn_before PROC NEAR
; Line 921
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 924
	mov	eax, DWORD PTR _pattern$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 720896				; 000b0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L742
; Line 928
	mov	eax, DWORD PTR _pattern$[ebp]
	cmp	DWORD PTR [eax+4], 0
	je	$L744
; Line 929
	mov	DWORD PTR _i$743[ebp], 0
	jmp	$L745
$L746:
	inc	DWORD PTR _i$743[ebp]
$L745:
	mov	eax, DWORD PTR _pattern$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _i$743[ebp]
	cmp	DWORD PTR [eax], ecx
	jbe	$L747
; Line 930
	mov	eax, DWORD PTR _before$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _pattern$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _i$743[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	push	eax
	call	_add_insn_after
	add	esp, 8
	jmp	$L746
$L747:
; Line 931
$L744:
	mov	eax, DWORD PTR _before$[ebp]
	mov	eax, DWORD PTR [eax+8]
	jmp	$L740
; Line 934
$L742:
	push	0
	mov	eax, DWORD PTR _pattern$[ebp]
	push	eax
	call	_make_insn_raw
	add	esp, 8
	mov	DWORD PTR _insn$[ebp], eax
; Line 936
	mov	eax, DWORD PTR _before$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 937
	mov	eax, DWORD PTR _before$[ebp]
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	DWORD PTR [ecx+12], eax
; Line 939
	mov	eax, DWORD PTR _insn$[ebp]
	cmp	DWORD PTR [eax+8], 0
	je	$L748
; Line 940
	mov	eax, DWORD PTR _insn$[ebp]
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	mov	DWORD PTR [ecx+12], eax
; Line 941
	jmp	$L749
$L748:
; Line 942
	mov	eax, DWORD PTR _insn$[ebp]
	mov	DWORD PTR _first_insn$S481, eax
$L749:
; Line 943
	mov	eax, DWORD PTR _insn$[ebp]
	mov	ecx, DWORD PTR _before$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 945
	mov	eax, DWORD PTR _insn$[ebp]
	jmp	$L740
; Line 946
$L740:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_emit_insn_before ENDP
_TEXT	ENDS
PUBLIC	_emit_jump_insn_before
_TEXT	SEGMENT
_pattern$ = 8
_before$ = 12
_insn$ = -4
_emit_jump_insn_before PROC NEAR
; Line 954
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 955
	push	0
	mov	eax, DWORD PTR _pattern$[ebp]
	push	eax
	call	_make_jump_insn_raw
	add	esp, 8
	mov	DWORD PTR _insn$[ebp], eax
; Line 957
	mov	eax, DWORD PTR _before$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 958
	mov	eax, DWORD PTR _before$[ebp]
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	DWORD PTR [ecx+12], eax
; Line 960
	mov	eax, DWORD PTR _insn$[ebp]
	cmp	DWORD PTR [eax+8], 0
	je	$L755
; Line 961
	mov	eax, DWORD PTR _insn$[ebp]
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	mov	DWORD PTR [ecx+12], eax
; Line 962
	jmp	$L756
$L755:
; Line 963
	mov	eax, DWORD PTR _insn$[ebp]
	mov	DWORD PTR _first_insn$S481, eax
$L756:
; Line 964
	mov	eax, DWORD PTR _insn$[ebp]
	mov	ecx, DWORD PTR _before$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 966
	mov	eax, DWORD PTR _insn$[ebp]
	jmp	$L753
; Line 967
$L753:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_emit_jump_insn_before ENDP
_TEXT	ENDS
PUBLIC	_emit_call_insn_before
_TEXT	SEGMENT
_pattern$ = 8
_before$ = 12
_insn$ = -4
_emit_call_insn_before PROC NEAR
; Line 975
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 976
	mov	eax, DWORD PTR _before$[ebp]
	push	eax
	mov	eax, DWORD PTR _pattern$[ebp]
	push	eax
	call	_emit_insn_before
	add	esp, 8
	mov	DWORD PTR _insn$[ebp], eax
; Line 977
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	and	eax, -65521				; ffff000fH
	or	eax, 15					; 0000000fH
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 978
	mov	eax, DWORD PTR _insn$[ebp]
	jmp	$L759
; Line 979
$L759:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_emit_call_insn_before ENDP
_TEXT	ENDS
PUBLIC	_emit_insn_after
_TEXT	SEGMENT
_insn$771 = -8
_pattern$ = 8
_after$ = 12
_i$765 = -4
_emit_insn_after PROC NEAR
; Line 987
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 988
	mov	eax, DWORD PTR _pattern$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 720896				; 000b0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L764
; Line 992
	mov	eax, DWORD PTR _pattern$[ebp]
	cmp	DWORD PTR [eax+4], 0
	je	$L766
; Line 993
	mov	DWORD PTR _i$765[ebp], 0
	jmp	$L767
$L768:
	inc	DWORD PTR _i$765[ebp]
$L767:
	mov	eax, DWORD PTR _pattern$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _i$765[ebp]
	cmp	DWORD PTR [eax], ecx
	jbe	$L769
; Line 995
	mov	eax, DWORD PTR _after$[ebp]
	push	eax
	mov	eax, DWORD PTR _pattern$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _i$765[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	push	eax
	call	_add_insn_after
	add	esp, 8
; Line 996
	mov	eax, DWORD PTR _after$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _after$[ebp], eax
; Line 997
	jmp	$L768
$L769:
; Line 998
$L766:
	mov	eax, DWORD PTR _after$[ebp]
	jmp	$L763
; Line 1000
	jmp	$L770
$L764:
; Line 1002
	push	0
	mov	eax, DWORD PTR _pattern$[ebp]
	push	eax
	call	_make_insn_raw
	add	esp, 8
	mov	DWORD PTR _insn$771[ebp], eax
; Line 1003
	mov	eax, DWORD PTR _after$[ebp]
	push	eax
	mov	eax, DWORD PTR _insn$771[ebp]
	push	eax
	call	_add_insn_after
	add	esp, 8
; Line 1004
	mov	eax, DWORD PTR _insn$771[ebp]
	jmp	$L763
; Line 1005
$L770:
; Line 1006
$L763:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_emit_insn_after ENDP
_TEXT	ENDS
PUBLIC	_emit_jump_insn_after
_TEXT	SEGMENT
_pattern$ = 8
_after$ = 12
_insn$ = -4
_emit_jump_insn_after PROC NEAR
; Line 1014
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 1015
	push	0
	mov	eax, DWORD PTR _pattern$[ebp]
	push	eax
	call	_make_jump_insn_raw
	add	esp, 8
	mov	DWORD PTR _insn$[ebp], eax
; Line 1017
	mov	eax, DWORD PTR _after$[ebp]
	push	eax
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_add_insn_after
	add	esp, 8
; Line 1018
	mov	eax, DWORD PTR _insn$[ebp]
	jmp	$L775
; Line 1019
$L775:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_emit_jump_insn_after ENDP
_TEXT	ENDS
PUBLIC	_emit_barrier_after
_TEXT	SEGMENT
_after$ = 8
_insn$ = -4
_emit_barrier_after PROC NEAR
; Line 1027
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 1028
	push	16					; 00000010H
	call	_rtx_alloc
	add	esp, 4
	mov	DWORD PTR _insn$[ebp], eax
; Line 1030
	mov	eax, DWORD PTR _cur_insn_uid$S484
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	DWORD PTR [ecx+4], eax
	inc	DWORD PTR _cur_insn_uid$S484
; Line 1032
	mov	eax, DWORD PTR _after$[ebp]
	push	eax
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_add_insn_after
	add	esp, 8
; Line 1033
	mov	eax, DWORD PTR _insn$[ebp]
	jmp	$L778
; Line 1034
$L778:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_emit_barrier_after ENDP
_TEXT	ENDS
PUBLIC	_emit_label_after
_TEXT	SEGMENT
_label$ = 8
_after$ = 12
_emit_label_after PROC NEAR
; Line 1041
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1045
	mov	eax, DWORD PTR _label$[ebp]
	cmp	DWORD PTR [eax+4], 0
	jne	$L784
; Line 1047
	mov	eax, DWORD PTR _cur_insn_uid$S484
	mov	ecx, DWORD PTR _label$[ebp]
	mov	DWORD PTR [ecx+4], eax
	inc	DWORD PTR _cur_insn_uid$S484
; Line 1048
	mov	eax, DWORD PTR _after$[ebp]
	push	eax
	mov	eax, DWORD PTR _label$[ebp]
	push	eax
	call	_add_insn_after
	add	esp, 8
; Line 1050
$L784:
$L783:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_emit_label_after ENDP
_TEXT	ENDS
PUBLIC	_emit_note_after
_TEXT	SEGMENT
_subtype$ = 8
_after$ = 12
_note$ = -4
_emit_note_after PROC NEAR
; Line 1058
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 1059
	push	18					; 00000012H
	call	_rtx_alloc
	add	esp, 4
	mov	DWORD PTR _note$[ebp], eax
; Line 1060
	mov	eax, DWORD PTR _cur_insn_uid$S484
	mov	ecx, DWORD PTR _note$[ebp]
	mov	DWORD PTR [ecx+4], eax
	inc	DWORD PTR _cur_insn_uid$S484
; Line 1061
	mov	eax, DWORD PTR _note$[ebp]
	mov	DWORD PTR [eax+16], 0
; Line 1062
	mov	eax, DWORD PTR _subtype$[ebp]
	mov	ecx, DWORD PTR _note$[ebp]
	mov	DWORD PTR [ecx+20], eax
; Line 1063
	mov	eax, DWORD PTR _after$[ebp]
	push	eax
	mov	eax, DWORD PTR _note$[ebp]
	push	eax
	call	_add_insn_after
	add	esp, 8
; Line 1064
$L788:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_emit_note_after ENDP
_TEXT	ENDS
PUBLIC	_emit_insn
_TEXT	SEGMENT
_pattern$ = 8
_insn$ = -4
_i$794 = -8
_emit_insn PROC NEAR
; Line 1076
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 1079
	mov	eax, DWORD PTR _pattern$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 720896				; 000b0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L793
; Line 1083
	mov	eax, DWORD PTR _pattern$[ebp]
	cmp	DWORD PTR [eax+4], 0
	je	$L795
; Line 1084
	mov	DWORD PTR _i$794[ebp], 0
	jmp	$L796
$L797:
	inc	DWORD PTR _i$794[ebp]
$L796:
	mov	eax, DWORD PTR _pattern$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _i$794[ebp]
	cmp	DWORD PTR [eax], ecx
	jbe	$L798
; Line 1085
	mov	eax, DWORD PTR _pattern$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _i$794[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	mov	DWORD PTR _insn$[ebp], eax
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_add_insn
	add	esp, 4
	jmp	$L797
$L798:
; Line 1086
$L795:
; Line 1087
	jmp	$L799
$L793:
; Line 1089
	push	0
	mov	eax, DWORD PTR _pattern$[ebp]
	push	eax
	call	_make_insn_raw
	add	esp, 8
	mov	DWORD PTR _insn$[ebp], eax
; Line 1090
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_add_insn
	add	esp, 4
; Line 1091
$L799:
; Line 1092
	mov	eax, DWORD PTR _insn$[ebp]
	jmp	$L791
; Line 1093
$L791:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_emit_insn ENDP
_TEXT	ENDS
PUBLIC	_emit_insns
_TEXT	SEGMENT
_insn$ = 8
_next$806 = -4
_emit_insns PROC NEAR
; Line 1100
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 1101
$L804:
	cmp	DWORD PTR _insn$[ebp], 0
	je	$L805
; Line 1103
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _next$806[ebp], eax
; Line 1104
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_add_insn
	add	esp, 4
; Line 1105
	mov	eax, DWORD PTR _next$806[ebp]
	mov	DWORD PTR _insn$[ebp], eax
; Line 1106
	jmp	$L804
$L805:
; Line 1107
$L802:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_emit_insns ENDP
_TEXT	ENDS
PUBLIC	_emit_jump_insn
_TEXT	SEGMENT
_pattern$ = 8
_insn$811 = -4
_emit_jump_insn PROC NEAR
; Line 1115
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 1116
	mov	eax, DWORD PTR _pattern$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 720896				; 000b0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L809
; Line 1117
	mov	eax, DWORD PTR _pattern$[ebp]
	push	eax
	call	_emit_insn
	add	esp, 4
	jmp	$L808
; Line 1118
	jmp	$L810
$L809:
; Line 1120
	push	0
	mov	eax, DWORD PTR _pattern$[ebp]
	push	eax
	call	_make_jump_insn_raw
	add	esp, 8
	mov	DWORD PTR _insn$811[ebp], eax
; Line 1121
	mov	eax, DWORD PTR _insn$811[ebp]
	push	eax
	call	_add_insn
	add	esp, 4
; Line 1122
	mov	eax, DWORD PTR _insn$811[ebp]
	jmp	$L808
; Line 1123
$L810:
; Line 1124
$L808:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_emit_jump_insn ENDP
_TEXT	ENDS
PUBLIC	_emit_call_insn
_TEXT	SEGMENT
_pattern$ = 8
_insn$816 = -4
_emit_call_insn PROC NEAR
; Line 1132
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 1133
	mov	eax, DWORD PTR _pattern$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 720896				; 000b0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L814
; Line 1134
	mov	eax, DWORD PTR _pattern$[ebp]
	push	eax
	call	_emit_insn
	add	esp, 4
	jmp	$L813
; Line 1135
	jmp	$L815
$L814:
; Line 1137
	push	0
	mov	eax, DWORD PTR _pattern$[ebp]
	push	eax
	call	_make_insn_raw
	add	esp, 8
	mov	DWORD PTR _insn$816[ebp], eax
; Line 1138
	mov	eax, DWORD PTR _insn$816[ebp]
	push	eax
	call	_add_insn
	add	esp, 4
; Line 1139
	mov	eax, DWORD PTR _insn$816[ebp]
	mov	eax, DWORD PTR [eax]
	and	eax, -65521				; ffff000fH
	or	eax, 15					; 0000000fH
	mov	ecx, DWORD PTR _insn$816[ebp]
	mov	DWORD PTR [ecx], eax
; Line 1140
	mov	eax, DWORD PTR _insn$816[ebp]
	jmp	$L813
; Line 1141
$L815:
; Line 1142
$L813:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_emit_call_insn ENDP
_TEXT	ENDS
PUBLIC	_emit_label
_TEXT	SEGMENT
_label$ = 8
_emit_label PROC NEAR
; Line 1149
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1153
	mov	eax, DWORD PTR _label$[ebp]
	cmp	DWORD PTR [eax+4], 0
	jne	$L819
; Line 1155
	mov	eax, DWORD PTR _cur_insn_uid$S484
	mov	ecx, DWORD PTR _label$[ebp]
	mov	DWORD PTR [ecx+4], eax
	inc	DWORD PTR _cur_insn_uid$S484
; Line 1156
	mov	eax, DWORD PTR _label$[ebp]
	push	eax
	call	_add_insn
	add	esp, 4
; Line 1158
$L819:
	mov	eax, DWORD PTR _label$[ebp]
	jmp	$L818
; Line 1159
$L818:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_emit_label ENDP
_TEXT	ENDS
PUBLIC	_emit_barrier
_TEXT	SEGMENT
_barrier$ = -4
_emit_barrier PROC NEAR
; Line 1166
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 1167
	push	16					; 00000010H
	call	_rtx_alloc
	add	esp, 4
	mov	DWORD PTR _barrier$[ebp], eax
; Line 1168
	mov	eax, DWORD PTR _cur_insn_uid$S484
	mov	ecx, DWORD PTR _barrier$[ebp]
	mov	DWORD PTR [ecx+4], eax
	inc	DWORD PTR _cur_insn_uid$S484
; Line 1169
	mov	eax, DWORD PTR _barrier$[ebp]
	push	eax
	call	_add_insn
	add	esp, 4
; Line 1170
	mov	eax, DWORD PTR _barrier$[ebp]
	jmp	$L820
; Line 1171
$L820:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_emit_barrier ENDP
_TEXT	ENDS
PUBLIC	_emit_note
PUBLIC	_emit_line_note
EXTRN	_emit_filename:DWORD
EXTRN	_emit_lineno:DWORD
_TEXT	SEGMENT
_file$ = 8
_line$ = 12
_emit_line_note PROC NEAR
; Line 1182
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1183
	mov	eax, DWORD PTR _file$[ebp]
	mov	DWORD PTR _emit_filename, eax
; Line 1184
	mov	eax, DWORD PTR _line$[ebp]
	mov	DWORD PTR _emit_lineno, eax
; Line 1191
	mov	eax, DWORD PTR _line$[ebp]
	push	eax
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_emit_note
	add	esp, 8
	jmp	$L824
; Line 1192
$L824:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_emit_line_note ENDP
_TEXT	ENDS
EXTRN	_strcmp:NEAR
_BSS	SEGMENT
_no_line_numbers$S479 DD 01H DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
_file$ = 8
_line$ = 12
_note$ = -4
_emit_note PROC NEAR
; Line 1203
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 1206
	cmp	DWORD PTR _line$[ebp], 0
	jle	$L829
; Line 1209
	cmp	DWORD PTR _file$[ebp], 0
	je	$L831
	cmp	DWORD PTR _last_filename$S486, 0
	je	$L831
	mov	eax, DWORD PTR _last_filename$S486
	push	eax
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L831
	mov	eax, DWORD PTR _line$[ebp]
	cmp	DWORD PTR _last_linenum$S485, eax
	jne	$L831
; Line 1210
	sub	eax, eax
	jmp	$L827
; Line 1211
$L831:
	mov	eax, DWORD PTR _file$[ebp]
	mov	DWORD PTR _last_filename$S486, eax
; Line 1212
	mov	eax, DWORD PTR _line$[ebp]
	mov	DWORD PTR _last_linenum$S485, eax
; Line 1215
$L829:
	cmp	DWORD PTR _no_line_numbers$S479, 0
	je	$L832
	cmp	DWORD PTR _line$[ebp], 0
	jle	$L832
; Line 1217
	inc	DWORD PTR _cur_insn_uid$S484
; Line 1218
	sub	eax, eax
	jmp	$L827
; Line 1221
$L832:
	push	18					; 00000012H
	call	_rtx_alloc
	add	esp, 4
	mov	DWORD PTR _note$[ebp], eax
; Line 1222
	mov	eax, DWORD PTR _cur_insn_uid$S484
	mov	ecx, DWORD PTR _note$[ebp]
	mov	DWORD PTR [ecx+4], eax
	inc	DWORD PTR _cur_insn_uid$S484
; Line 1223
	mov	eax, DWORD PTR _file$[ebp]
	mov	ecx, DWORD PTR _note$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 1224
	mov	eax, DWORD PTR _line$[ebp]
	mov	ecx, DWORD PTR _note$[ebp]
	mov	DWORD PTR [ecx+20], eax
; Line 1225
	mov	eax, DWORD PTR _note$[ebp]
	push	eax
	call	_add_insn
	add	esp, 4
; Line 1226
	mov	eax, DWORD PTR _note$[ebp]
	jmp	$L827
; Line 1227
$L827:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_emit_note ENDP
_TEXT	ENDS
PUBLIC	_emit_line_note_force
_TEXT	SEGMENT
_file$ = 8
_line$ = 12
_emit_line_note_force PROC NEAR
; Line 1235
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1236
	mov	DWORD PTR _last_linenum$S485, -1
; Line 1237
	mov	eax, DWORD PTR _line$[ebp]
	push	eax
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_emit_line_note
	add	esp, 8
	jmp	$L835
; Line 1238
$L835:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_emit_line_note_force ENDP
_TEXT	ENDS
PUBLIC	_force_next_line_note
_TEXT	SEGMENT
_force_next_line_note PROC NEAR
; Line 1245
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1246
	mov	DWORD PTR _last_linenum$S485, -1
; Line 1247
$L837:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_force_next_line_note ENDP
_TEXT	ENDS
PUBLIC	_classify_insn
_TEXT	SEGMENT
_x$ = 8
_j$850 = -4
_classify_insn PROC NEAR
; Line 1255
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 1256
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1114112				; 00110000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L841
; Line 1257
	mov	eax, 17					; 00000011H
	jmp	$L840
; Line 1258
$L841:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1835008				; 001c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L842
; Line 1259
	mov	eax, 15					; 0000000fH
	jmp	$L840
; Line 1260
$L842:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1900544				; 001d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L843
; Line 1261
	mov	eax, 14					; 0000000eH
	jmp	$L840
; Line 1262
$L843:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L844
; Line 1264
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR _pc_rtx
	cmp	DWORD PTR [eax+4], ecx
	jne	$L845
; Line 1265
	mov	eax, 14					; 0000000eH
	jmp	$L840
; Line 1266
	jmp	$L846
$L845:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1835008				; 001c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L847
; Line 1267
	mov	eax, 15					; 0000000fH
	jmp	$L840
; Line 1268
	jmp	$L848
$L847:
; Line 1269
	mov	eax, 13					; 0000000dH
	jmp	$L840
$L848:
$L846:
; Line 1271
$L844:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1310720				; 00140000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L849
; Line 1274
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	dec	eax
	mov	DWORD PTR _j$850[ebp], eax
	jmp	$L851
$L852:
	dec	DWORD PTR _j$850[ebp]
$L851:
	cmp	DWORD PTR _j$850[ebp], 0
	jl	$L853
; Line 1275
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _j$850[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1835008				; 001c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L854
; Line 1276
	mov	eax, 15					; 0000000fH
	jmp	$L840
; Line 1277
	jmp	$L855
$L854:
; Line 1278
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _j$850[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L856
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _j$850[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	mov	ecx, DWORD PTR _pc_rtx
	cmp	DWORD PTR [eax+4], ecx
	jne	$L856
; Line 1279
	mov	eax, 14					; 0000000eH
	jmp	$L840
; Line 1280
	jmp	$L857
$L856:
; Line 1281
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _j$850[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L858
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _j$850[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1835008				; 001c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L858
; Line 1282
	mov	eax, 15					; 0000000fH
	jmp	$L840
; Line 1283
$L858:
$L857:
$L855:
	jmp	$L852
$L853:
; Line 1284
$L849:
	mov	eax, 13					; 0000000dH
	jmp	$L840
; Line 1285
$L840:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_classify_insn ENDP
_TEXT	ENDS
PUBLIC	_emit
EXTRN	_simplejump_p:NEAR
_TEXT	SEGMENT
_x$ = 8
_code$ = -4
_insn$868 = -8
_emit	PROC NEAR
; Line 1293
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 1294
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_classify_insn
	add	esp, 4
	mov	DWORD PTR _code$[ebp], eax
; Line 1296
	cmp	DWORD PTR _code$[ebp], 17		; 00000011H
	jne	$L863
; Line 1297
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_emit_label
	add	esp, 4
; Line 1298
	jmp	$L864
$L863:
	cmp	DWORD PTR _code$[ebp], 13		; 0000000dH
	jne	$L865
; Line 1299
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_emit_insn
	add	esp, 4
; Line 1300
	jmp	$L866
$L865:
	cmp	DWORD PTR _code$[ebp], 14		; 0000000eH
	jne	$L867
; Line 1302
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_emit_jump_insn
	add	esp, 4
	mov	DWORD PTR _insn$868[ebp], eax
; Line 1303
	mov	eax, DWORD PTR _insn$868[ebp]
	push	eax
	call	_simplejump_p
	add	esp, 4
	or	eax, eax
	jne	$L871
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1900544				; 001d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L870
$L871:
; Line 1304
	call	_emit_barrier
; Line 1305
$L870:
; Line 1306
	jmp	$L872
$L867:
	cmp	DWORD PTR _code$[ebp], 15		; 0000000fH
	jne	$L873
; Line 1307
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_emit_call_insn
	add	esp, 4
; Line 1308
$L873:
$L872:
$L866:
$L864:
$L861:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_emit	ENDP
_TEXT	ENDS
PUBLIC	_start_sequence
_TEXT	SEGMENT
_start_sequence PROC NEAR
; Line 1315
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1319
	mov	eax, DWORD PTR _sequence_stack
	push	eax
	mov	eax, DWORD PTR _last_insn$S482
	push	eax
	push	0
	push	3
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _first_insn$S481
	push	eax
	push	0
	push	3
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	DWORD PTR _sequence_stack, eax
; Line 1320
	mov	DWORD PTR _first_insn$S481, 0
; Line 1321
	mov	DWORD PTR _last_insn$S482, 0
; Line 1322
	mov	eax, DWORD PTR _sequence_stack
	jmp	$L874
; Line 1323
$L874:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_start_sequence ENDP
_TEXT	ENDS
PUBLIC	_push_to_sequence
_TEXT	SEGMENT
_first$ = 8
_last$ = -4
_push_to_sequence PROC NEAR
; Line 1331
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 1333
	mov	eax, DWORD PTR _first$[ebp]
	mov	DWORD PTR _last$[ebp], eax
	jmp	$L879
$L880:
	mov	eax, DWORD PTR _last$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _last$[ebp], eax
$L879:
	cmp	DWORD PTR _last$[ebp], 0
	je	$L881
	mov	eax, DWORD PTR _last$[ebp]
	cmp	DWORD PTR [eax+12], 0
	je	$L881
	jmp	$L880
$L881:
; Line 1337
	mov	eax, DWORD PTR _sequence_stack
	push	eax
	mov	eax, DWORD PTR _last_insn$S482
	push	eax
	push	0
	push	3
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _first_insn$S481
	push	eax
	push	0
	push	3
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	DWORD PTR _sequence_stack, eax
; Line 1338
	mov	eax, DWORD PTR _first$[ebp]
	mov	DWORD PTR _first_insn$S481, eax
; Line 1339
	mov	eax, DWORD PTR _last$[ebp]
	mov	DWORD PTR _last_insn$S482, eax
; Line 1340
$L877:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_push_to_sequence ENDP
_TEXT	ENDS
PUBLIC	_end_sequence
_TEXT	SEGMENT
_end_sequence PROC NEAR
; Line 1351
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1352
	mov	eax, DWORD PTR _sequence_stack
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _first_insn$S481, eax
; Line 1353
	mov	eax, DWORD PTR _sequence_stack
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _last_insn$S482, eax
; Line 1354
	mov	eax, DWORD PTR _sequence_stack
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _sequence_stack, eax
; Line 1355
$L884:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_end_sequence ENDP
_TEXT	ENDS
PUBLIC	_gen_sequence
_TEXT	SEGMENT
_tem$ = -8
_newvec$ = -16
_i$ = -4
_len$ = -12
_gen_sequence PROC NEAR
; Line 1365
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 1372
	mov	DWORD PTR _len$[ebp], 0
; Line 1373
	mov	eax, DWORD PTR _first_insn$S481
	mov	DWORD PTR _tem$[ebp], eax
	jmp	$L890
$L891:
	mov	eax, DWORD PTR _tem$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _tem$[ebp], eax
$L890:
	cmp	DWORD PTR _tem$[ebp], 0
	je	$L892
; Line 1374
	inc	DWORD PTR _len$[ebp]
	jmp	$L891
$L892:
; Line 1377
	cmp	DWORD PTR _len$[ebp], 0
	jne	$L893
; Line 1378
	push	0
	push	0
	push	11					; 0000000bH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	jmp	$L885
; Line 1381
$L893:
; Line 1384
	cmp	DWORD PTR _len$[ebp], 1
	jne	$L894
	mov	eax, DWORD PTR _first_insn$S481
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 851968				; 000d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L895
	mov	eax, DWORD PTR _first_insn$S481
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 917504				; 000e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L895
	mov	eax, DWORD PTR _first_insn$S481
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 983040				; 000f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L894
$L895:
; Line 1385
	mov	eax, DWORD PTR _first_insn$S481
	mov	eax, DWORD PTR [eax+16]
	jmp	$L885
; Line 1388
$L894:
	mov	eax, DWORD PTR _len$[ebp]
	push	eax
	call	_rtvec_alloc
	add	esp, 4
	mov	DWORD PTR _newvec$[ebp], eax
; Line 1389
	mov	DWORD PTR _i$[ebp], 0
; Line 1390
	mov	eax, DWORD PTR _first_insn$S481
	mov	DWORD PTR _tem$[ebp], eax
	jmp	$L896
$L897:
	mov	eax, DWORD PTR _tem$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _tem$[ebp], eax
	inc	DWORD PTR _i$[ebp]
$L896:
	cmp	DWORD PTR _tem$[ebp], 0
	je	$L898
; Line 1391
	mov	eax, DWORD PTR _tem$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _newvec$[ebp]
	mov	DWORD PTR [edx+ecx*4+4], eax
	jmp	$L897
$L898:
; Line 1394
	mov	eax, DWORD PTR _newvec$[ebp]
	push	eax
	push	0
	push	11					; 0000000bH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	jmp	$L885
; Line 1395
$L885:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_sequence ENDP
_TEXT	ENDS
PUBLIC	_restore_reg_data
_TEXT	SEGMENT
_first$ = 8
_insn$ = -12
_i$ = -8
_max_uid$ = -4
_restore_reg_data PROC NEAR
; Line 1410
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 1413
	mov	DWORD PTR _max_uid$[ebp], 0
; Line 1415
	mov	eax, DWORD PTR _first$[ebp]
	mov	DWORD PTR _insn$[ebp], eax
	jmp	$L906
$L907:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _insn$[ebp], eax
$L906:
	cmp	DWORD PTR _insn$[ebp], 0
	je	$L908
; Line 1417
	mov	eax, DWORD PTR _insn$[ebp]
	mov	ecx, DWORD PTR _max_uid$[ebp]
	cmp	DWORD PTR [eax+4], ecx
	jl	$L909
; Line 1418
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _max_uid$[ebp], eax
; Line 1420
$L909:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR -16+[ebp], eax
	jmp	$L910
; Line 1422
$L914:
; Line 1425
	jmp	$L911
; Line 1427
$L915:
; Line 1430
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_restore_reg_data_1
	add	esp, 4
; Line 1431
	jmp	$L911
; Line 1432
	jmp	$L911
$L910:
	cmp	DWORD PTR -16+[ebp], 13			; 0000000dH
	jl	$L911
	cmp	DWORD PTR -16+[ebp], 15			; 0000000fH
	jle	$L915
	jmp	$L911
$L911:
; Line 1433
	jmp	$L907
$L908:
; Line 1436
	mov	eax, DWORD PTR _max_uid$[ebp]
	inc	eax
	mov	DWORD PTR _cur_insn_uid$S484, eax
; Line 1439
	mov	DWORD PTR _i$[ebp], 10			; 0000000aH
	jmp	$L916
$L917:
	inc	DWORD PTR _i$[ebp]
$L916:
	mov	eax, DWORD PTR _reg_rtx_no
	cmp	DWORD PTR _i$[ebp], eax
	jge	$L918
; Line 1440
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _regno_reg_rtx
	cmp	DWORD PTR [ecx+eax*4], 0
	jne	$L919
; Line 1441
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	push	4
	push	34					; 00000022H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _regno_reg_rtx
	mov	DWORD PTR [edx+ecx*4], eax
; Line 1442
$L919:
	jmp	$L917
$L918:
$L902:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_restore_reg_data ENDP
_orig$ = 8
_x$ = -4
_i$ = -8
_code$ = -16
_format_ptr$ = -12
_newlen$935 = -28
_new1$936 = -24
_new$937 = -20
_j$950 = -32
_restore_reg_data_1 PROC NEAR
; Line 1447
	push	ebp
	mov	ebp, esp
	sub	esp, 44					; 0000002cH
	push	ebx
	push	esi
	push	edi
; Line 1448
	mov	eax, DWORD PTR _orig$[ebp]
	mov	DWORD PTR _x$[ebp], eax
; Line 1453
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$[ebp], eax
; Line 1455
	mov	eax, DWORD PTR _code$[ebp]
	mov	DWORD PTR -40+[ebp], eax
	jmp	$L926
; Line 1457
$L930:
; Line 1465
	jmp	$L921
; Line 1467
$L931:
; Line 1468
	mov	eax, DWORD PTR _x$[ebp]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L932
; Line 1472
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR _reg_rtx_no
	cmp	DWORD PTR [eax+4], ecx
	jl	$L933
; Line 1474
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _reg_rtx_no, eax
; Line 1476
	mov	eax, DWORD PTR _reg_rtx_no
	cmp	DWORD PTR _regno_pointer_flag_length, eax
	jg	$L934
; Line 1479
	mov	eax, DWORD PTR _regno_pointer_flag_length
	add	eax, eax
	mov	ecx, DWORD PTR _reg_rtx_no
	add	ecx, 30					; 0000001eH
	cmp	eax, ecx
	jg	$L975
	mov	eax, ecx
$L975:
	mov	DWORD PTR _newlen$935[ebp], eax
; Line 1481
	mov	eax, DWORD PTR _newlen$935[ebp]
	push	eax
	call	_oballoc
	add	esp, 4
	mov	DWORD PTR _new$937[ebp], eax
; Line 1482
	mov	eax, DWORD PTR _newlen$935[ebp]
	push	eax
	push	0
	mov	eax, DWORD PTR _new$937[ebp]
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 1483
	mov	eax, DWORD PTR _regno_pointer_flag_length
	push	eax
	mov	eax, DWORD PTR _regno_pointer_flag
	push	eax
	mov	eax, DWORD PTR _new$937[ebp]
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
; Line 1485
	mov	eax, DWORD PTR _newlen$935[ebp]
	shl	eax, 2
	push	eax
	call	_oballoc
	add	esp, 4
	mov	DWORD PTR _new1$936[ebp], eax
; Line 1486
	mov	eax, DWORD PTR _newlen$935[ebp]
	shl	eax, 2
	push	eax
	push	0
	mov	eax, DWORD PTR _new1$936[ebp]
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 1487
	mov	eax, DWORD PTR _regno_pointer_flag_length
	shl	eax, 2
	push	eax
	mov	eax, DWORD PTR _regno_reg_rtx
	push	eax
	mov	eax, DWORD PTR _new1$936[ebp]
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
; Line 1489
	mov	eax, DWORD PTR _new$937[ebp]
	mov	DWORD PTR _regno_pointer_flag, eax
; Line 1490
	mov	eax, DWORD PTR _new1$936[ebp]
	mov	DWORD PTR _regno_reg_rtx, eax
; Line 1491
	mov	eax, DWORD PTR _newlen$935[ebp]
	mov	DWORD PTR _regno_pointer_flag_length, eax
; Line 1493
$L934:
	inc	DWORD PTR _reg_rtx_no
; Line 1495
$L933:
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	mov	edx, DWORD PTR _regno_reg_rtx
	mov	DWORD PTR [edx+ecx*4], eax
; Line 1497
$L932:
	jmp	$L921
; Line 1499
$L938:
; Line 1500
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L939
; Line 1501
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_mark_reg_pointer
	add	esp, 4
; Line 1502
$L939:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_restore_reg_data_1
	add	esp, 4
; Line 1503
	jmp	$L921
; Line 1504
	jmp	$L927
$L926:
	sub	DWORD PTR -40+[ebp], 17			; 00000011H
	cmp	DWORD PTR -40+[ebp], 24			; 00000018H
	ja	$L927
	shl	DWORD PTR -40+[ebp], 2
	mov	eax, DWORD PTR -40+[ebp]
	jmp	DWORD PTR $L976[eax]
$L976:
	DD	OFFSET $L930
	DD	OFFSET $L927
	DD	OFFSET $L927
	DD	OFFSET $L927
	DD	OFFSET $L927
	DD	OFFSET $L927
	DD	OFFSET $L927
	DD	OFFSET $L927
	DD	OFFSET $L927
	DD	OFFSET $L927
	DD	OFFSET $L927
	DD	OFFSET $L927
	DD	OFFSET $L927
	DD	OFFSET $L930
	DD	OFFSET $L930
	DD	OFFSET $L927
	DD	OFFSET $L930
	DD	OFFSET $L931
	DD	OFFSET $L927
	DD	OFFSET $L927
	DD	OFFSET $L938
	DD	OFFSET $L930
	DD	OFFSET $L930
	DD	OFFSET $L930
	DD	OFFSET $L930
$L927:
; Line 1508
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_format[eax*4]
	mov	DWORD PTR _format_ptr$[ebp], eax
; Line 1510
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L940
$L941:
	inc	DWORD PTR _i$[ebp]
$L940:
	mov	eax, DWORD PTR _code$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _rtx_length[eax*4], ecx
	jle	$L942
; Line 1512
	mov	eax, DWORD PTR _format_ptr$[ebp]
	mov	DWORD PTR -36+[ebp], eax
	inc	DWORD PTR _format_ptr$[ebp]
	mov	eax, DWORD PTR -36+[ebp]
	movsx	eax, BYTE PTR [eax]
	mov	DWORD PTR -44+[ebp], eax
	jmp	$L943
; Line 1514
$L947:
; Line 1515
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	push	eax
	call	_restore_reg_data_1
	add	esp, 4
; Line 1516
	jmp	$L944
; Line 1518
$L948:
; Line 1519
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	cmp	DWORD PTR [ecx+eax*4+4], 0
	je	$L949
; Line 1523
	mov	DWORD PTR _j$950[ebp], 0
	jmp	$L951
$L952:
	inc	DWORD PTR _j$950[ebp]
$L951:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$950[ebp]
	cmp	DWORD PTR [eax], ecx
	jbe	$L953
; Line 1524
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$950[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	push	eax
	call	_restore_reg_data_1
	add	esp, 4
	jmp	$L952
$L953:
; Line 1526
$L949:
	jmp	$L944
; Line 1527
	jmp	$L944
$L943:
	cmp	DWORD PTR -44+[ebp], 69			; 00000045H
	je	$L948
	cmp	DWORD PTR -44+[ebp], 101		; 00000065H
	je	$L947
	jmp	$L944
$L944:
; Line 1528
	jmp	$L941
$L942:
; Line 1529
$L921:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_restore_reg_data_1 ENDP
_TEXT	ENDS
PUBLIC	_init_emit
_TEXT	SEGMENT
_write_symbols$ = 8
_init_emit PROC NEAR
; Line 1539
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1540
	mov	DWORD PTR _first_insn$S481, 0
; Line 1541
	mov	DWORD PTR _last_insn$S482, 0
; Line 1542
	mov	DWORD PTR _sequence_stack, 0
; Line 1543
	mov	DWORD PTR _cur_insn_uid$S484, 1
; Line 1544
	mov	DWORD PTR _reg_rtx_no, 10		; 0000000aH
; Line 1545
	mov	DWORD PTR _last_linenum$S485, 0
; Line 1546
	mov	DWORD PTR _last_filename$S486, 0
; Line 1547
	mov	eax, DWORD PTR _label_num$S477
	mov	DWORD PTR _first_label_num$S478, eax
; Line 1549
	cmp	DWORD PTR _write_symbols$[ebp], 1
	sbb	eax, eax
	neg	eax
	mov	DWORD PTR _no_line_numbers$S479, eax
; Line 1553
	mov	DWORD PTR _regno_pointer_flag_length, 110 ; 0000006eH
; Line 1556
	mov	eax, DWORD PTR _regno_pointer_flag_length
	push	eax
	call	_oballoc
	add	esp, 4
	mov	DWORD PTR _regno_pointer_flag, eax
; Line 1557
	mov	eax, DWORD PTR _regno_pointer_flag_length
	push	eax
	push	0
	mov	eax, DWORD PTR _regno_pointer_flag
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 1560
	mov	eax, DWORD PTR _regno_pointer_flag_length
	shl	eax, 2
	push	eax
	call	_oballoc
	add	esp, 4
	mov	DWORD PTR _regno_reg_rtx, eax
; Line 1561
	mov	eax, DWORD PTR _regno_pointer_flag_length
	shl	eax, 2
	push	eax
	push	0
	mov	eax, DWORD PTR _regno_reg_rtx
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 1562
$L956:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_init_emit ENDP
_TEXT	ENDS
PUBLIC	_init_emit_once
EXTRN	__fltused:NEAR
CONST	SEGMENT
$T977	DQ	00000000000000000H		; 0
CONST	ENDS
_TEXT	SEGMENT
_u$959 = -8
_init_emit_once PROC NEAR
; Line 1568
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 1571
	push	0
	push	33					; 00000021H
	call	_gen_rtx
	add	esp, 8
	mov	DWORD PTR _pc_rtx, eax
; Line 1572
	push	0
	push	40					; 00000028H
	call	_gen_rtx
	add	esp, 8
	mov	DWORD PTR _cc0_rtx, eax
; Line 1576
	push	30					; 0000001eH
	call	_rtx_alloc
	add	esp, 4
	mov	DWORD PTR _const0_rtx, eax
; Line 1577
	mov	eax, DWORD PTR _const0_rtx
	mov	DWORD PTR [eax+4], 0
; Line 1578
	push	30					; 0000001eH
	call	_rtx_alloc
	add	esp, 4
	mov	DWORD PTR _const1_rtx, eax
; Line 1579
	mov	eax, DWORD PTR _const1_rtx
	mov	DWORD PTR [eax+4], 1
; Line 1581
	push	31					; 0000001fH
	call	_rtx_alloc
	add	esp, 4
	mov	DWORD PTR _fconst0_rtx, eax
; Line 1582
	push	31					; 0000001fH
	call	_rtx_alloc
	add	esp, 4
	mov	DWORD PTR _dconst0_rtx, eax
; Line 1589
	mov	eax, DWORD PTR $T977+4
	mov	DWORD PTR _u$959[ebp+4], eax
	mov	eax, DWORD PTR $T977
	mov	DWORD PTR _u$959[ebp], eax
; Line 1592
	push	8
	lea	eax, DWORD PTR _u$959[ebp]
	push	eax
	mov	eax, DWORD PTR _fconst0_rtx
	add	eax, 12					; 0000000cH
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
; Line 1593
	mov	eax, DWORD PTR _cc0_rtx
	mov	ecx, DWORD PTR _fconst0_rtx
	mov	DWORD PTR [ecx+4], eax
; Line 1594
	mov	eax, DWORD PTR _fconst0_rtx
	mov	eax, DWORD PTR [eax]
	and	eax, -16056321				; ff0affffH
	or	eax, 655360				; 000a0000H
	mov	ecx, DWORD PTR _fconst0_rtx
	mov	DWORD PTR [ecx], eax
; Line 1596
	push	8
	lea	eax, DWORD PTR _u$959[ebp]
	push	eax
	mov	eax, DWORD PTR _dconst0_rtx
	add	eax, 12					; 0000000cH
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
; Line 1597
	mov	eax, DWORD PTR _cc0_rtx
	mov	ecx, DWORD PTR _dconst0_rtx
	mov	DWORD PTR [ecx+4], eax
; Line 1598
	mov	eax, DWORD PTR _dconst0_rtx
	mov	eax, DWORD PTR [eax]
	and	eax, -15990785				; ff0bffffH
	or	eax, 720896				; 000b0000H
	mov	ecx, DWORD PTR _dconst0_rtx
	mov	DWORD PTR [ecx], eax
; Line 1601
	push	7
	push	4
	push	34					; 00000022H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _stack_pointer_rtx, eax
; Line 1602
	push	6
	push	4
	push	34					; 00000022H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _frame_pointer_rtx, eax
; Line 1604
	mov	eax, DWORD PTR _stack_pointer_rtx
	push	eax
	push	4
	push	63					; 0000003fH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	push	4
	push	37					; 00000025H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _struct_value_rtx, eax
; Line 1610
	push	8
	push	0
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
	push	eax
	push	4
	push	37					; 00000025H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _struct_value_incoming_rtx, eax
; Line 1620
	push	2
	push	4
	push	34					; 00000022H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _static_chain_rtx, eax
; Line 1627
	mov	eax, DWORD PTR _static_chain_rtx
	mov	DWORD PTR _static_chain_incoming_rtx, eax
; Line 1630
	mov	eax, DWORD PTR _frame_pointer_rtx
	mov	DWORD PTR _arg_pointer_rtx, eax
; Line 1631
	jmp	$L961
$L960:
; Line 1632
	push	6
	push	4
	push	34					; 00000022H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _arg_pointer_rtx, eax
$L961:
; Line 1633
$L958:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_init_emit_once ENDP
_TEXT	ENDS
END
