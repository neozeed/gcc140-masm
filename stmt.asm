	TITLE	stmt.c
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
_DATA	SEGMENT
COMM	_cond_stack:DWORD
COMM	_loop_stack:DWORD
COMM	_case_stack:DWORD
COMM	_save_expr_regs:DWORD
COMM	_nesting_stack:DWORD
COMM	_current_function_calls_alloca:DWORD
COMM	_nesting_depth:DWORD
COMM	_current_function_arg_offset_rtx:DWORD
COMM	_current_function_calls_setjmp:DWORD
COMM	_current_function_pops_args:DWORD
COMM	_current_function_returns_struct:DWORD
COMM	_current_function_returns_pcc_struct:DWORD
COMM	_current_function_needs_context:DWORD
COMM	_current_function_returns_pointer:DWORD
COMM	_current_function_args_size:DWORD
COMM	_current_function_pretend_args_size:DWORD
COMM	_current_function_name:DWORD
COMM	_cleanup_label:DWORD
COMM	_return_label:DWORD
COMM	_expr_stmts_for_value:DWORD
COMM	_stack_slot_list:DWORD
COMM	_emit_filename:DWORD
COMM	_emit_lineno:DWORD
COMM	_block_stack:DWORD
COMM	_stack_block_stack:DWORD
_DATA	ENDS
PUBLIC	_emit_nop
EXTRN	_gen_nop:NEAR
EXTRN	_get_last_insn:NEAR
EXTRN	_emit_insn:NEAR
EXTRN	_prev_real_insn:NEAR
EXTRN	_optimize:DWORD
_TEXT	SEGMENT
; File stmt.c
_last_insn$ = -4
_emit_nop PROC NEAR
; Line 372
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 373
	call	_get_last_insn
	mov	DWORD PTR _last_insn$[ebp], eax
; Line 376
	cmp	DWORD PTR _optimize, 0
	jne	$L1242
	mov	eax, DWORD PTR _last_insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1114112				; 00110000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1243
	mov	eax, DWORD PTR _last_insn$[ebp]
	push	eax
	call	_prev_real_insn
	add	esp, 4
	or	eax, eax
	jne	$L1242
$L1243:
; Line 377
	call	_gen_nop
	push	eax
	call	_emit_insn
	add	esp, 4
; Line 378
$L1242:
$L1240:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_emit_nop ENDP
_TEXT	ENDS
EXTRN	_gen_label_rtx:NEAR
EXTRN	_abort:NEAR
_TEXT	SEGMENT
_label$ = 8
_label_rtx PROC NEAR
; Line 386
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 387
	mov	eax, DWORD PTR _label$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 40					; 00000028H
	je	$L1247
; Line 388
	call	_abort
; Line 390
$L1247:
	mov	eax, DWORD PTR _label$[ebp]
	cmp	DWORD PTR [eax+76], 0
	je	$L1249
; Line 391
	mov	eax, DWORD PTR _label$[ebp]
	mov	eax, DWORD PTR [eax+76]
	jmp	$L1246
; Line 393
$L1249:
	call	_gen_label_rtx
	mov	ecx, DWORD PTR _label$[ebp]
	mov	DWORD PTR [ecx+76], eax
	mov	eax, DWORD PTR _label$[ebp]
	mov	eax, DWORD PTR [eax+76]
	jmp	$L1246
; Line 394
$L1246:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_label_rtx ENDP
_TEXT	ENDS
PUBLIC	_emit_jump
EXTRN	_gen_jump:NEAR
EXTRN	_emit_jump_insn:NEAR
EXTRN	_do_pending_stack_adjust:NEAR
EXTRN	_emit_barrier:NEAR
_TEXT	SEGMENT
_label$ = 8
_emit_jump PROC NEAR
; Line 401
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 402
	call	_do_pending_stack_adjust
; Line 403
	mov	eax, DWORD PTR _label$[ebp]
	push	eax
	call	_gen_jump
	add	esp, 4
	push	eax
	call	_emit_jump_insn
	add	esp, 4
; Line 404
	call	_emit_barrier
; Line 405
$L1252:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_emit_jump ENDP
_TEXT	ENDS
PUBLIC	_expand_label
EXTRN	_emit_label:NEAR
EXTRN	_oballoc:NEAR
_TEXT	SEGMENT
_body$ = 8
_p$ = -4
_expand_label PROC NEAR
; Line 470
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 473
	call	_do_pending_stack_adjust
; Line 474
	mov	eax, DWORD PTR _body$[ebp]
	push	eax
	call	_label_rtx
	add	esp, 4
	push	eax
	call	_emit_label
	add	esp, 4
; Line 476
	cmp	DWORD PTR _stack_block_stack, 0
	je	$L1259
; Line 478
	push	8
	call	_oballoc
	add	esp, 4
	mov	DWORD PTR _p$[ebp], eax
; Line 479
	mov	eax, DWORD PTR _stack_block_stack
	mov	eax, DWORD PTR [eax+40]
	mov	ecx, DWORD PTR _p$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 480
	mov	eax, DWORD PTR _p$[ebp]
	mov	ecx, DWORD PTR _stack_block_stack
	mov	DWORD PTR [ecx+40], eax
; Line 481
	mov	eax, DWORD PTR _body$[ebp]
	mov	ecx, DWORD PTR _p$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 483
$L1259:
$L1257:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_expand_label ENDP
_TEXT	ENDS
PUBLIC	_expand_goto
_TEXT	SEGMENT
_body$ = 8
_expand_goto PROC NEAR
; Line 492
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 493
	push	0
	mov	eax, DWORD PTR _body$[ebp]
	push	eax
	call	_label_rtx
	add	esp, 4
	push	eax
	mov	eax, DWORD PTR _body$[ebp]
	push	eax
	call	_expand_goto_internal
	add	esp, 12					; 0000000cH
; Line 494
$L1261:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_expand_goto ENDP
_TEXT	ENDS
EXTRN	_stack_pointer_rtx:DWORD
EXTRN	_emit_move_insn:NEAR
EXTRN	_error:NEAR
_DATA	SEGMENT
$SG1279	DB	'jump to `%s'' invalidly jumps into binding contour', 00H
_DATA	ENDS
_TEXT	SEGMENT
_body$ = 8
_label$ = 12
_last_insn$ = 16
_block$ = -4
_stack_level$ = -8
_expand_goto_internal PROC NEAR
; Line 506
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 508
	mov	DWORD PTR _stack_level$[ebp], 0
; Line 510
	mov	eax, DWORD PTR _label$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1114112				; 00110000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1268
; Line 511
	call	_abort
; Line 516
$L1268:
	mov	eax, DWORD PTR _label$[ebp]
	cmp	DWORD PTR [eax+8], 0
	je	$L1269
; Line 522
	mov	eax, DWORD PTR _block_stack
	mov	DWORD PTR _block$[ebp], eax
	jmp	$L1270
$L1271:
	mov	eax, DWORD PTR _block$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _block$[ebp], eax
$L1270:
	cmp	DWORD PTR _block$[ebp], 0
	je	$L1272
; Line 524
	mov	eax, DWORD PTR _block$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	ecx, DWORD PTR _label$[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	cmp	DWORD PTR [eax+4], ecx
	jge	$L1273
; Line 525
	jmp	$L1272
; Line 526
$L1273:
	mov	eax, DWORD PTR _block$[ebp]
	cmp	DWORD PTR [eax+20], 0
	je	$L1274
; Line 527
	mov	eax, DWORD PTR _block$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _stack_level$[ebp], eax
; Line 529
$L1274:
	mov	eax, DWORD PTR _block$[ebp]
	cmp	DWORD PTR [eax+32], 0
	je	$L1275
; Line 530
	push	0
	mov	eax, DWORD PTR _block$[ebp]
	mov	eax, DWORD PTR [eax+32]
	push	eax
	call	_expand_cleanups
	add	esp, 8
; Line 531
$L1275:
	jmp	$L1271
$L1272:
; Line 533
	cmp	DWORD PTR _stack_level$[ebp], 0
	je	$L1276
; Line 534
	mov	eax, DWORD PTR _stack_level$[ebp]
	push	eax
	mov	eax, DWORD PTR _stack_pointer_rtx
	push	eax
	call	_emit_move_insn
	add	esp, 8
; Line 536
$L1276:
	cmp	DWORD PTR _body$[ebp], 0
	je	$L1277
	mov	eax, DWORD PTR _body$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 4
	test	al, 1
	je	$L1277
; Line 538
	mov	eax, DWORD PTR _body$[ebp]
	mov	eax, DWORD PTR [eax+40]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	OFFSET $SG1279
	call	_error
	add	esp, 8
; Line 539
$L1277:
; Line 542
	jmp	$L1280
$L1269:
	mov	eax, DWORD PTR _last_insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _label$[ebp]
	push	eax
	mov	eax, DWORD PTR _body$[ebp]
	push	eax
	call	_expand_fixup
	add	esp, 12					; 0000000cH
	or	eax, eax
	jne	$L1281
; Line 546
	cmp	DWORD PTR _body$[ebp], 0
	je	$L1282
; Line 547
	mov	eax, DWORD PTR _body$[ebp]
	mov	eax, DWORD PTR [eax+16]
	or	eax, 512				; 00000200H
	mov	ecx, DWORD PTR _body$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 548
$L1282:
; Line 550
$L1281:
$L1280:
	mov	eax, DWORD PTR _label$[ebp]
	push	eax
	call	_emit_jump
	add	esp, 4
; Line 551
$L1265:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_expand_goto_internal ENDP
_TEXT	ENDS
EXTRN	_tree_cons:NEAR
_BSS	SEGMENT
_goto_fixup_chain$S1255 DD 01H DUP (?)
_block_start_count$S1191 DD 01H DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
_tree_label$ = 8
_rtl_label$ = 12
_last_insn$ = 16
_block$ = -4
_end_block$ = -8
_next_block$1296 = -12
_fixup$1311 = -16
_expand_fixup PROC NEAR
; Line 570
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 580
	cmp	DWORD PTR _cond_stack, 0
	je	$L1289
	mov	eax, DWORD PTR _cond_stack
	mov	ecx, DWORD PTR _rtl_label$[ebp]
	cmp	DWORD PTR [eax+16], ecx
	je	$L1290
	mov	eax, DWORD PTR _cond_stack
	mov	ecx, DWORD PTR _rtl_label$[ebp]
	cmp	DWORD PTR [eax+20], ecx
	jne	$L1289
$L1290:
; Line 581
	mov	eax, DWORD PTR _cond_stack
	mov	DWORD PTR _end_block$[ebp], eax
; Line 585
	jmp	$L1291
$L1289:
; Line 588
	cmp	DWORD PTR _loop_stack, 0
	je	$L1292
	mov	eax, DWORD PTR _loop_stack
	mov	ecx, DWORD PTR _rtl_label$[ebp]
	cmp	DWORD PTR [eax+16], ecx
	je	$L1293
	mov	eax, DWORD PTR _loop_stack
	mov	ecx, DWORD PTR _rtl_label$[ebp]
	cmp	DWORD PTR [eax+20], ecx
	je	$L1293
	mov	eax, DWORD PTR _loop_stack
	mov	ecx, DWORD PTR _rtl_label$[ebp]
	cmp	DWORD PTR [eax+24], ecx
	jne	$L1292
$L1293:
; Line 589
	mov	eax, DWORD PTR _loop_stack
	mov	DWORD PTR _end_block$[ebp], eax
; Line 590
	jmp	$L1294
$L1292:
; Line 591
	mov	DWORD PTR _end_block$[ebp], 0
$L1294:
$L1291:
; Line 595
	cmp	DWORD PTR _end_block$[ebp], 0
	je	$L1295
; Line 597
	mov	eax, DWORD PTR _end_block$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _next_block$1296[ebp], eax
; Line 598
	mov	eax, DWORD PTR _block_stack
	mov	DWORD PTR _block$[ebp], eax
; Line 602
$L1298:
	cmp	DWORD PTR _next_block$1296[ebp], 0
	je	$L1299
	mov	eax, DWORD PTR _block$[ebp]
	cmp	DWORD PTR _next_block$1296[ebp], eax
	je	$L1299
; Line 603
	mov	eax, DWORD PTR _next_block$1296[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _next_block$1296[ebp], eax
	jmp	$L1298
$L1299:
; Line 605
	cmp	DWORD PTR _next_block$1296[ebp], 0
	je	$L1300
; Line 606
	sub	eax, eax
	jmp	$L1286
; Line 610
$L1300:
	mov	eax, DWORD PTR _block_stack
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _next_block$1296[ebp], eax
; Line 611
	mov	eax, DWORD PTR _block_stack
	mov	DWORD PTR _block$[ebp], eax
	jmp	$L1301
$L1302:
	mov	eax, DWORD PTR _block$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _block$[ebp], eax
$L1301:
	mov	eax, DWORD PTR _block$[ebp]
	cmp	DWORD PTR _end_block$[ebp], eax
	je	$L1303
; Line 612
	mov	eax, DWORD PTR _block$[ebp]
	cmp	DWORD PTR _next_block$1296[ebp], eax
	jne	$L1304
; Line 613
	mov	eax, DWORD PTR _next_block$1296[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _next_block$1296[ebp], eax
; Line 614
$L1304:
	jmp	$L1302
$L1303:
	mov	eax, DWORD PTR _next_block$1296[ebp]
	mov	DWORD PTR _end_block$[ebp], eax
; Line 620
$L1295:
	mov	eax, DWORD PTR _block_stack
	mov	DWORD PTR _block$[ebp], eax
	jmp	$L1305
$L1306:
	mov	eax, DWORD PTR _block$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _block$[ebp], eax
$L1305:
	mov	eax, DWORD PTR _block$[ebp]
	cmp	DWORD PTR _end_block$[ebp], eax
	je	$L1307
; Line 622
	mov	eax, DWORD PTR _block$[ebp]
	cmp	DWORD PTR [eax+20], 0
	jne	$L1309
	mov	eax, DWORD PTR _block$[ebp]
	cmp	DWORD PTR [eax+32], 0
	je	$L1308
$L1309:
; Line 623
	jmp	$L1307
; Line 625
$L1308:
	jmp	$L1306
$L1307:
	mov	eax, DWORD PTR _block$[ebp]
	cmp	DWORD PTR _end_block$[ebp], eax
	je	$L1310
; Line 629
	push	28					; 0000001cH
	call	_oballoc
	add	esp, 4
	mov	DWORD PTR _fixup$1311[ebp], eax
; Line 632
	call	_do_pending_stack_adjust
; Line 633
	cmp	DWORD PTR _last_insn$[ebp], 0
	je	$L2516
	mov	eax, DWORD PTR _last_insn$[ebp]
	mov	ecx, DWORD PTR _fixup$1311[ebp]
	mov	DWORD PTR [ecx+4], eax
	jmp	$L2517
$L2516:
	call	_get_last_insn
	mov	ecx, DWORD PTR _fixup$1311[ebp]
	mov	DWORD PTR [ecx+4], eax
$L2517:
; Line 634
	mov	eax, DWORD PTR _tree_label$[ebp]
	mov	ecx, DWORD PTR _fixup$1311[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 635
	mov	eax, DWORD PTR _rtl_label$[ebp]
	mov	ecx, DWORD PTR _fixup$1311[ebp]
	mov	DWORD PTR [ecx+12], eax
; Line 636
	mov	eax, DWORD PTR _block_start_count$S1191
	mov	ecx, DWORD PTR _fixup$1311[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 637
	mov	eax, DWORD PTR _fixup$1311[ebp]
	mov	DWORD PTR [eax+20], 0
; Line 642
	mov	eax, DWORD PTR _block$[ebp]
	cmp	DWORD PTR [eax+36], 0
	jne	$L2520
	mov	eax, DWORD PTR _block$[ebp]
	cmp	DWORD PTR [eax+32], 0
	je	$L2518
$L2520:
	mov	eax, DWORD PTR _block$[ebp]
	mov	eax, DWORD PTR [eax+36]
	push	eax
	mov	eax, DWORD PTR _block$[ebp]
	mov	eax, DWORD PTR [eax+32]
	push	eax
	push	0
	call	_tree_cons
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _fixup$1311[ebp]
	mov	DWORD PTR [ecx+24], eax
	jmp	$L2519
$L2518:
	mov	eax, DWORD PTR _fixup$1311[ebp]
	mov	DWORD PTR [eax+24], 0
$L2519:
; Line 643
	mov	eax, DWORD PTR _goto_fixup_chain$S1255
	mov	ecx, DWORD PTR _fixup$1311[ebp]
	mov	DWORD PTR [ecx], eax
; Line 644
	mov	eax, DWORD PTR _fixup$1311[ebp]
	mov	DWORD PTR _goto_fixup_chain$S1255, eax
; Line 647
$L1310:
	cmp	DWORD PTR _block$[ebp], 1
	sbb	eax, eax
	inc	eax
	jmp	$L1286
; Line 648
$L1286:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_expand_fixup ENDP
_TEXT	ENDS
EXTRN	_gen_move_insn:NEAR
EXTRN	_emit_insn_after:NEAR
EXTRN	_error_with_decl:NEAR
_DATA	SEGMENT
	ORG $+2
$SG1335	DB	'label `%s'' used before containing binding contour', 00H
_DATA	ENDS
_TEXT	SEGMENT
_lists$1345 = -20
_thisblock$ = 8
_stack_level$ = 12
_cleanup_list$ = 16
_first_insn$ = 20
_dont_jump_in$ = 24
_f$ = -4
_prev$ = -8
_after_label$1327 = -12
_lists$1337 = -16
_fixup_gotos PROC NEAR
; Line 670
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	push	ebx
	push	esi
	push	edi
; Line 675
	mov	DWORD PTR _prev$[ebp], 0
	mov	eax, DWORD PTR _goto_fixup_chain$S1255
	mov	DWORD PTR _f$[ebp], eax
	jmp	$L1320
$L1321:
	mov	eax, DWORD PTR _f$[ebp]
	mov	DWORD PTR _prev$[ebp], eax
	mov	eax, DWORD PTR _f$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _f$[ebp], eax
$L1320:
	cmp	DWORD PTR _f$[ebp], 0
	je	$L1322
; Line 678
	mov	eax, DWORD PTR _f$[ebp]
	cmp	DWORD PTR [eax+4], 0
	jne	$L1323
; Line 681
	cmp	DWORD PTR _prev$[ebp], 0
	je	$L1324
; Line 682
	mov	eax, DWORD PTR _f$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _prev$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 683
$L1324:
; Line 686
	jmp	$L1325
$L1323:
	mov	eax, DWORD PTR _f$[ebp]
	mov	eax, DWORD PTR [eax+12]
	cmp	DWORD PTR [eax+8], 0
	je	$L1326
; Line 688
	mov	eax, DWORD PTR _f$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _after_label$1327[ebp], eax
; Line 689
$L1329:
	cmp	DWORD PTR _after_label$1327[ebp], 0
	je	$L1330
	mov	eax, DWORD PTR _after_label$1327[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1114112				; 00110000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1330
; Line 690
	mov	eax, DWORD PTR _after_label$1327[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _after_label$1327[ebp], eax
	jmp	$L1329
$L1330:
; Line 705
	mov	eax, DWORD PTR _f$[ebp]
	cmp	DWORD PTR [eax+8], 0
	je	$L1331
	cmp	DWORD PTR _dont_jump_in$[ebp], 0
	jne	$L1332
	cmp	DWORD PTR _stack_level$[ebp], 0
	jne	$L1332
	cmp	DWORD PTR _cleanup_list$[ebp], 0
	je	$L1331
$L1332:
	cmp	DWORD PTR _after_label$1327[ebp], 0
	je	$L1333
	mov	eax, DWORD PTR _first_insn$[ebp]
	mov	ecx, DWORD PTR _after_label$1327[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	cmp	DWORD PTR [eax+4], ecx
	jge	$L1331
$L1333:
	mov	eax, DWORD PTR _f$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _first_insn$[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	cmp	DWORD PTR [eax+4], ecx
	jge	$L1331
	mov	eax, DWORD PTR _f$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 10					; 0000000aH
	test	al, 1
	jne	$L1331
; Line 708
	push	OFFSET $SG1335
	mov	eax, DWORD PTR _f$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_error_with_decl
	add	esp, 8
; Line 710
	mov	eax, DWORD PTR _f$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+16]
	or	eax, 1024				; 00000400H
	mov	ecx, DWORD PTR _f$[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	mov	DWORD PTR [ecx+16], eax
; Line 714
$L1331:
	mov	eax, DWORD PTR _f$[ebp]
	cmp	DWORD PTR [eax+24], 0
	je	$L1336
; Line 717
	mov	eax, DWORD PTR _f$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _lists$1337[ebp], eax
	jmp	$L1338
$L1339:
	mov	eax, DWORD PTR _lists$1337[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _lists$1337[ebp], eax
$L1338:
	cmp	DWORD PTR _lists$1337[ebp], 0
	je	$L1340
; Line 721
	mov	eax, DWORD PTR _lists$1337[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 9
	test	al, 1
	je	$L1341
	mov	eax, DWORD PTR _lists$1337[ebp]
	cmp	DWORD PTR [eax+24], 0
	je	$L1341
; Line 722
	mov	eax, DWORD PTR _f$[ebp]
	add	eax, 4
	push	eax
	mov	eax, DWORD PTR _lists$1337[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_fixup_cleanups
	add	esp, 8
; Line 723
$L1341:
	jmp	$L1339
$L1340:
; Line 727
$L1336:
	mov	eax, DWORD PTR _f$[ebp]
	cmp	DWORD PTR [eax+20], 0
	je	$L1342
; Line 729
	mov	eax, DWORD PTR _f$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _f$[ebp]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	mov	eax, DWORD PTR _stack_pointer_rtx
	push	eax
	call	_gen_move_insn
	add	esp, 8
	push	eax
	call	_emit_insn_after
	add	esp, 8
; Line 730
$L1342:
	mov	eax, DWORD PTR _f$[ebp]
	mov	DWORD PTR [eax+4], 0
; Line 741
	jmp	$L1343
$L1326:
; Line 743
	cmp	DWORD PTR _thisblock$[ebp], 0
	je	$L1344
	mov	eax, DWORD PTR _thisblock$[ebp]
	mov	ecx, DWORD PTR _f$[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	cmp	DWORD PTR [eax+16], ecx
	jge	$L1344
; Line 745
	mov	eax, DWORD PTR _f$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _lists$1345[ebp], eax
; Line 746
	jmp	$L1346
$L1347:
	mov	eax, DWORD PTR _lists$1345[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _lists$1345[ebp], eax
$L1346:
	cmp	DWORD PTR _lists$1345[ebp], 0
	je	$L1348
; Line 749
	mov	eax, DWORD PTR _thisblock$[ebp]
	mov	ecx, DWORD PTR _lists$1345[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	cmp	DWORD PTR [eax+36], ecx
	jne	$L1349
; Line 750
	mov	eax, DWORD PTR _lists$1345[ebp]
	mov	eax, DWORD PTR [eax+16]
	or	eax, 512				; 00000200H
	mov	ecx, DWORD PTR _lists$1345[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 752
$L1349:
	jmp	$L1347
$L1348:
	cmp	DWORD PTR _stack_level$[ebp], 0
	je	$L1350
; Line 753
	mov	eax, DWORD PTR _stack_level$[ebp]
	mov	ecx, DWORD PTR _f$[ebp]
	mov	DWORD PTR [ecx+20], eax
; Line 754
$L1350:
; Line 755
$L1344:
$L1343:
$L1325:
	jmp	$L1321
$L1322:
; Line 756
$L1317:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_fixup_gotos ENDP
_TEXT	ENDS
PUBLIC	_expand_asm
EXTRN	_gen_rtx:NEAR
_BSS	SEGMENT
_last_expr_type$S1196 DD 01H DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
_body$ = 8
_expand_asm PROC NEAR
; Line 764
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 766
	mov	eax, DWORD PTR _body$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	push	0
	push	21					; 00000015H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	call	_emit_insn
	add	esp, 4
; Line 767
	mov	DWORD PTR _last_expr_type$S1196, 0
; Line 768
$L1352:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_expand_asm ENDP
_TEXT	ENDS
PUBLIC	_expand_asm_operands
EXTRN	_rtvec_alloc:NEAR
EXTRN	_error_mark_node:DWORD
EXTRN	_build_nt:NEAR
EXTRN	_gen_reg_rtx:NEAR
EXTRN	_expand_expr:NEAR
EXTRN	_alloca:NEAR
EXTRN	_strcmp:NEAR
EXTRN	_protect_from_queue:NEAR
EXTRN	_list_length:NEAR
EXTRN	_reg_names:BYTE
_DATA	SEGMENT
	ORG $+2
$SG1385	DB	'output operand constraint contains `+''', 00H
	ORG $+1
$SG1388	DB	'output operand constraint lacks `=''', 00H
$SG1398	DB	'more than %d operands in `asm''', 00H
	ORG $+1
$SG1399	DB	00H
	ORG $+3
$SG1406	DB	'hard register `%s'' listed as input operand to `asm''', 00H
$SG1412	DB	'input operand constraint contains `%c''', 00H
	ORG $+1
$SG1441	DB	'unknown register name `%s'' in `asm''', 00H
_DATA	ENDS
_TEXT	SEGMENT
_string$ = 8
_outputs$ = 12
_inputs$ = 16
_clobbers$ = 20
_vol$ = 24
_filename$ = 28
_obody$1423 = -76
_line$ = 32
_num$1424 = -72
_argvec$ = -36
_constraints$ = -24
_body$ = -20
_ninputs$ = -32
_noutputs$ = -12
_nclobbers$ = -8
_tail$ = -4
_j$1433 = -80
_i$ = -16
_regname$1434 = -84
_output_rtx$ = -40
_insn$ = -28
_val$1376 = -44
_val1$1377 = -52
_j$1378 = -48
_found_equal$1379 = -56
_reg$1394 = -60
_t$1395 = -64
_j$1403 = -68
_expand_asm_operands PROC NEAR
; Line 791
	push	ebp
	mov	ebp, esp
	sub	esp, 84					; 00000054H
	push	ebx
	push	esi
	push	edi
; Line 794
	mov	eax, DWORD PTR _inputs$[ebp]
	push	eax
	call	_list_length
	add	esp, 4
	mov	DWORD PTR _ninputs$[ebp], eax
; Line 795
	mov	eax, DWORD PTR _outputs$[ebp]
	push	eax
	call	_list_length
	add	esp, 4
	mov	DWORD PTR _noutputs$[ebp], eax
; Line 796
	mov	eax, DWORD PTR _clobbers$[ebp]
	push	eax
	call	_list_length
	add	esp, 4
	mov	DWORD PTR _nclobbers$[ebp], eax
; Line 800
	mov	eax, DWORD PTR _noutputs$[ebp]
	shl	eax, 2
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _output_rtx$[ebp], eax
; Line 804
	mov	DWORD PTR _last_expr_type$S1196, 0
; Line 806
	mov	DWORD PTR _i$[ebp], 0
	mov	eax, DWORD PTR _outputs$[ebp]
	mov	DWORD PTR _tail$[ebp], eax
	jmp	$L1373
$L1374:
	mov	eax, DWORD PTR _tail$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _tail$[ebp], eax
	inc	DWORD PTR _i$[ebp]
$L1373:
	cmp	DWORD PTR _tail$[ebp], 0
	je	$L1375
; Line 808
	mov	eax, DWORD PTR _tail$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _val$1376[ebp], eax
; Line 814
	mov	eax, DWORD PTR _val$1376[ebp]
	mov	ecx, DWORD PTR _error_mark_node
	cmp	DWORD PTR [eax+8], ecx
	jne	$L1380
; Line 815
	jmp	$L1361
; Line 819
$L1380:
	mov	DWORD PTR _found_equal$1379[ebp], 0
; Line 820
	mov	DWORD PTR _j$1378[ebp], 0
	jmp	$L1381
$L1382:
	inc	DWORD PTR _j$1378[ebp]
$L1381:
	mov	eax, DWORD PTR _tail$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	ecx, DWORD PTR _j$1378[ebp]
	cmp	DWORD PTR [eax+24], ecx
	jle	$L1383
; Line 822
	mov	eax, DWORD PTR _tail$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	eax, DWORD PTR [eax+28]
	mov	ecx, DWORD PTR _j$1378[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 43					; 0000002bH
	jne	$L1384
; Line 824
	push	OFFSET $SG1385
	call	_error
	add	esp, 4
; Line 825
	jmp	$L1361
; Line 827
$L1384:
	mov	eax, DWORD PTR _tail$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	eax, DWORD PTR [eax+28]
	mov	ecx, DWORD PTR _j$1378[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 61					; 0000003dH
	jne	$L1386
; Line 828
	mov	DWORD PTR _found_equal$1379[ebp], 1
; Line 829
$L1386:
	jmp	$L1382
$L1383:
; Line 830
	cmp	DWORD PTR _found_equal$1379[ebp], 0
	jne	$L1387
; Line 832
	push	OFFSET $SG1388
	call	_error
	add	esp, 4
; Line 833
	jmp	$L1361
; Line 843
$L1387:
	mov	eax, DWORD PTR _val$1376[ebp]
	mov	DWORD PTR _val1$1377[ebp], eax
; Line 845
$L1390:
	mov	eax, DWORD PTR _val1$1377[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 47					; 0000002fH
	je	$L1392
	mov	eax, DWORD PTR _val1$1377[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 51					; 00000033H
	jne	$L1391
$L1392:
; Line 846
	mov	eax, DWORD PTR _val1$1377[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _val1$1377[ebp], eax
	jmp	$L1390
$L1391:
; Line 850
	mov	eax, DWORD PTR _val1$1377[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 43					; 0000002bH
	je	$L1393
	mov	eax, DWORD PTR _val1$1377[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 44					; 0000002cH
	je	$L1393
	mov	eax, DWORD PTR _val1$1377[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 48					; 00000030H
	je	$L1393
; Line 852
	mov	eax, DWORD PTR _val$1376[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	sar	eax, 24					; 00000018H
	push	eax
	call	_gen_reg_rtx
	add	esp, 4
	mov	DWORD PTR _reg$1394[ebp], eax
; Line 854
	mov	eax, DWORD PTR _reg$1394[ebp]
	push	eax
	mov	eax, DWORD PTR _val$1376[ebp]
	push	eax
	push	114					; 00000072H
	call	_build_nt
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _t$1395[ebp], eax
; Line 856
	mov	eax, DWORD PTR _reg$1394[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 436207616				; 1a000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1396
; Line 857
	call	_abort
; Line 859
$L1396:
	mov	eax, DWORD PTR _save_expr_regs
	push	eax
	mov	eax, DWORD PTR _reg$1394[ebp]
	push	eax
	push	0
	push	2
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	DWORD PTR _save_expr_regs, eax
; Line 860
	mov	eax, DWORD PTR _t$1395[ebp]
	mov	ecx, DWORD PTR _tail$[ebp]
	mov	DWORD PTR [ecx+24], eax
; Line 861
	mov	eax, DWORD PTR _val$1376[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _t$1395[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 863
$L1393:
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _tail$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _output_rtx$[ebp]
	mov	DWORD PTR [edx+ecx*4], eax
; Line 864
	jmp	$L1374
$L1375:
; Line 866
	mov	eax, DWORD PTR _ninputs$[ebp]
	add	eax, DWORD PTR _noutputs$[ebp]
	cmp	eax, 7
	jle	$L1397
; Line 868
	push	7
	push	OFFSET $SG1398
	call	_error
	add	esp, 8
; Line 869
	jmp	$L1361
; Line 874
$L1397:
	mov	eax, DWORD PTR _ninputs$[ebp]
	push	eax
	call	_rtvec_alloc
	add	esp, 4
	mov	DWORD PTR _argvec$[ebp], eax
; Line 875
	mov	eax, DWORD PTR _ninputs$[ebp]
	push	eax
	call	_rtvec_alloc
	add	esp, 4
	mov	DWORD PTR _constraints$[ebp], eax
; Line 879
	mov	eax, DWORD PTR _line$[ebp]
	push	eax
	mov	eax, DWORD PTR _filename$[ebp]
	push	eax
	mov	eax, DWORD PTR _constraints$[ebp]
	push	eax
	mov	eax, DWORD PTR _argvec$[ebp]
	push	eax
	push	0
	push	OFFSET $SG1399
	mov	eax, DWORD PTR _string$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	push	0
	push	22					; 00000016H
	call	_gen_rtx
	add	esp, 36					; 00000024H
	mov	DWORD PTR _body$[ebp], eax
; Line 880
	mov	eax, DWORD PTR _body$[ebp]
	mov	eax, DWORD PTR [eax]
	and	eax, -134217729				; f7ffffffH
	mov	ecx, DWORD PTR _vol$[ebp]
	and	ecx, 1
	shl	ecx, 27					; 0000001bH
	or	eax, ecx
	mov	ecx, DWORD PTR _body$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 885
	mov	DWORD PTR _i$[ebp], 0
; Line 886
	mov	eax, DWORD PTR _inputs$[ebp]
	mov	DWORD PTR _tail$[ebp], eax
	jmp	$L1400
$L1401:
	mov	eax, DWORD PTR _tail$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _tail$[ebp], eax
$L1400:
	cmp	DWORD PTR _tail$[ebp], 0
	je	$L1402
; Line 893
	mov	eax, DWORD PTR _tail$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	ecx, DWORD PTR _error_mark_node
	cmp	DWORD PTR [eax+8], ecx
	jne	$L1404
; Line 894
	jmp	$L1361
; Line 895
$L1404:
	mov	eax, DWORD PTR _tail$[ebp]
	cmp	DWORD PTR [eax+20], 0
	jne	$L1405
; Line 898
	mov	eax, DWORD PTR _tail$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	push	OFFSET $SG1406
	call	_error
	add	esp, 8
; Line 899
	jmp	$L1361
; Line 904
$L1405:
	mov	DWORD PTR _j$1403[ebp], 0
	jmp	$L1407
$L1408:
	inc	DWORD PTR _j$1403[ebp]
$L1407:
	mov	eax, DWORD PTR _tail$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	ecx, DWORD PTR _j$1403[ebp]
	cmp	DWORD PTR [eax+24], ecx
	jle	$L1409
; Line 906
	mov	eax, DWORD PTR _tail$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	eax, DWORD PTR [eax+28]
	mov	ecx, DWORD PTR _j$1403[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 61					; 0000003dH
	je	$L1411
	mov	eax, DWORD PTR _tail$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	eax, DWORD PTR [eax+28]
	mov	ecx, DWORD PTR _j$1403[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 43					; 0000002bH
	jne	$L1410
$L1411:
; Line 909
	mov	eax, DWORD PTR _tail$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	eax, DWORD PTR [eax+28]
	mov	ecx, DWORD PTR _j$1403[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	push	eax
	push	OFFSET $SG1412
	call	_error
	add	esp, 8
; Line 910
	jmp	$L1361
; Line 913
$L1410:
	jmp	$L1408
$L1409:
; Line 914
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _tail$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	mov	ecx, DWORD PTR _body$[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	mov	edx, DWORD PTR _i$[ebp]
	mov	DWORD PTR [ecx+edx*4+4], eax
; Line 917
	mov	eax, DWORD PTR _tail$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	mov	eax, DWORD PTR _tail$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	sar	eax, 24					; 00000018H
	push	eax
	push	21					; 00000015H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _body$[ebp]
	mov	ecx, DWORD PTR [ecx+20]
	mov	edx, DWORD PTR _i$[ebp]
	mov	DWORD PTR [ecx+edx*4+4], eax
; Line 918
	inc	DWORD PTR _i$[ebp]
; Line 919
	jmp	$L1401
$L1402:
; Line 924
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L1413
$L1414:
	inc	DWORD PTR _i$[ebp]
$L1413:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _ninputs$[ebp], eax
	jle	$L1415
; Line 925
	push	0
	mov	eax, DWORD PTR _body$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	push	eax
	call	_protect_from_queue
	add	esp, 8
	mov	ecx, DWORD PTR _body$[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	mov	edx, DWORD PTR _i$[ebp]
	mov	DWORD PTR [ecx+edx*4+4], eax
	jmp	$L1414
$L1415:
; Line 927
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L1416
$L1417:
	inc	DWORD PTR _i$[ebp]
$L1416:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _noutputs$[ebp], eax
	jle	$L1418
; Line 928
	push	1
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _output_rtx$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	call	_protect_from_queue
	add	esp, 8
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _output_rtx$[ebp]
	mov	DWORD PTR [edx+ecx*4], eax
	jmp	$L1417
$L1418:
; Line 935
	cmp	DWORD PTR _noutputs$[ebp], 1
	jne	$L1419
	cmp	DWORD PTR _nclobbers$[ebp], 0
	jne	$L1419
; Line 937
	mov	eax, DWORD PTR _outputs$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	eax, DWORD PTR [eax+28]
	mov	ecx, DWORD PTR _body$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 938
	mov	eax, DWORD PTR _body$[ebp]
	push	eax
	mov	eax, DWORD PTR _output_rtx$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	call	_emit_insn
	add	esp, 4
	mov	DWORD PTR _insn$[ebp], eax
; Line 940
	jmp	$L1420
$L1419:
	cmp	DWORD PTR _noutputs$[ebp], 0
	jne	$L1421
	cmp	DWORD PTR _nclobbers$[ebp], 0
	jne	$L1421
; Line 943
	mov	eax, DWORD PTR _body$[ebp]
	push	eax
	call	_emit_insn
	add	esp, 4
	mov	DWORD PTR _insn$[ebp], eax
; Line 945
	jmp	$L1422
$L1421:
; Line 947
	mov	eax, DWORD PTR _body$[ebp]
	mov	DWORD PTR _obody$1423[ebp], eax
; Line 948
	mov	eax, DWORD PTR _noutputs$[ebp]
	mov	DWORD PTR _num$1424[ebp], eax
; Line 949
	cmp	DWORD PTR _num$1424[ebp], 0
	jne	$L1425
	mov	DWORD PTR _num$1424[ebp], 1
; Line 950
$L1425:
	mov	eax, DWORD PTR _nclobbers$[ebp]
	add	eax, DWORD PTR _num$1424[ebp]
	push	eax
	call	_rtvec_alloc
	add	esp, 4
	push	eax
	push	0
	push	20					; 00000014H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _body$[ebp], eax
; Line 954
	mov	DWORD PTR _i$[ebp], 0
	mov	eax, DWORD PTR _outputs$[ebp]
	mov	DWORD PTR _tail$[ebp], eax
	jmp	$L1426
$L1427:
	mov	eax, DWORD PTR _tail$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _tail$[ebp], eax
	inc	DWORD PTR _i$[ebp]
$L1426:
	cmp	DWORD PTR _tail$[ebp], 0
	je	$L1428
; Line 963
	mov	eax, DWORD PTR _line$[ebp]
	push	eax
	mov	eax, DWORD PTR _filename$[ebp]
	push	eax
	mov	eax, DWORD PTR _constraints$[ebp]
	push	eax
	mov	eax, DWORD PTR _argvec$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	eax, DWORD PTR _tail$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	mov	eax, DWORD PTR _string$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	push	0
	push	22					; 00000016H
	call	_gen_rtx
	add	esp, 36					; 00000024H
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _output_rtx$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	ecx, DWORD PTR _body$[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	mov	edx, DWORD PTR _i$[ebp]
	mov	DWORD PTR [ecx+edx*4+4], eax
; Line 964
	mov	eax, DWORD PTR _body$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	and	eax, -134217729				; f7ffffffH
	mov	ecx, DWORD PTR _vol$[ebp]
	and	ecx, 1
	shl	ecx, 27					; 0000001bH
	or	eax, ecx
	mov	ecx, DWORD PTR _body$[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	mov	edx, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR [ecx+edx*4+4]
	mov	ecx, DWORD PTR [ecx+8]
	mov	DWORD PTR [ecx], eax
; Line 965
	jmp	$L1427
$L1428:
; Line 970
	cmp	DWORD PTR _i$[ebp], 0
	jne	$L1429
; Line 971
	mov	eax, DWORD PTR _obody$1423[ebp]
	mov	ecx, DWORD PTR _body$[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	mov	edx, DWORD PTR _i$[ebp]
	mov	DWORD PTR [ecx+edx*4+4], eax
	inc	DWORD PTR _i$[ebp]
; Line 975
$L1429:
	mov	eax, DWORD PTR _clobbers$[ebp]
	mov	DWORD PTR _tail$[ebp], eax
	jmp	$L1430
$L1431:
	mov	eax, DWORD PTR _tail$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _tail$[ebp], eax
	inc	DWORD PTR _i$[ebp]
$L1430:
	cmp	DWORD PTR _tail$[ebp], 0
	je	$L1432
; Line 978
	mov	eax, DWORD PTR _tail$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR _regname$1434[ebp], eax
; Line 981
	mov	DWORD PTR _j$1433[ebp], 0
	jmp	$L1435
$L1436:
	inc	DWORD PTR _j$1433[ebp]
$L1435:
	cmp	DWORD PTR _j$1433[ebp], 10		; 0000000aH
	jge	$L1437
; Line 982
	mov	eax, DWORD PTR _j$1433[ebp]
	mov	eax, DWORD PTR _reg_names[eax*4]
	push	eax
	mov	eax, DWORD PTR _regname$1434[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L1439
; Line 983
	jmp	$L1437
; Line 985
$L1439:
	jmp	$L1436
$L1437:
	cmp	DWORD PTR _j$1433[ebp], 10		; 0000000aH
	jne	$L1440
; Line 987
	mov	eax, DWORD PTR _regname$1434[ebp]
	push	eax
	push	OFFSET $SG1441
	call	_error
	add	esp, 8
; Line 988
	jmp	$L1361
; Line 992
$L1440:
; Line 993
	mov	eax, DWORD PTR _j$1433[ebp]
	push	eax
	push	1
	push	34					; 00000022H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	27					; 0000001bH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _body$[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	mov	edx, DWORD PTR _i$[ebp]
	mov	DWORD PTR [ecx+edx*4+4], eax
; Line 994
	jmp	$L1431
$L1432:
; Line 996
	mov	eax, DWORD PTR _body$[ebp]
	push	eax
	call	_emit_insn
	add	esp, 4
	mov	DWORD PTR _insn$[ebp], eax
; Line 997
$L1422:
$L1420:
; Line 999
	mov	DWORD PTR _last_expr_type$S1196, 0
; Line 1000
$L1361:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_expand_asm_operands ENDP
_TEXT	ENDS
PUBLIC	_expand_expr_stmt
EXTRN	_extra_warnings:DWORD
EXTRN	_warn_unused:DWORD
EXTRN	_flag_syntax_only:DWORD
EXTRN	_emit_queue:NEAR
EXTRN	_warning_with_file_and_line:NEAR
EXTRN	_const0_rtx:DWORD
_BSS	SEGMENT
_last_expr_value$S1197 DD 01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG1449	DB	'statement with no effect', 00H
_DATA	ENDS
_TEXT	SEGMENT
_exp$ = 8
_expand_expr_stmt PROC NEAR
; Line 1013
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 1016
	cmp	DWORD PTR _expr_stmts_for_value, 0
	jne	$L1445
	mov	eax, DWORD PTR _exp$[ebp]
	cmp	DWORD PTR _error_mark_node, eax
	je	$L1445
; Line 1018
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 3
	test	al, 1
	jne	$L1446
	cmp	DWORD PTR _extra_warnings, 0
	jne	$L1447
	cmp	DWORD PTR _warn_unused, 0
	je	$L1446
$L1447:
; Line 1020
	push	OFFSET $SG1449
	mov	eax, DWORD PTR _emit_lineno
	push	eax
	mov	eax, DWORD PTR _emit_filename
	push	eax
	call	_warning_with_file_and_line
	add	esp, 12					; 0000000cH
; Line 1021
	jmp	$L1450
$L1446:
	cmp	DWORD PTR _warn_unused, 0
	je	$L1451
; Line 1022
	mov	eax, DWORD PTR _exp$[ebp]
	push	eax
	call	_warn_if_unused_value
	add	esp, 4
; Line 1023
$L1451:
$L1450:
; Line 1024
$L1445:
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _last_expr_type$S1196, eax
; Line 1025
	cmp	DWORD PTR _flag_syntax_only, 0
	jne	$L1452
; Line 1027
	cmp	DWORD PTR _expr_stmts_for_value, 0
	je	$L2521
	mov	DWORD PTR -4+[ebp], 0
	jmp	$L2522
$L2521:
	mov	eax, DWORD PTR _const0_rtx
	mov	DWORD PTR -4+[ebp], eax
$L2522:
	push	0
	push	0
	mov	eax, DWORD PTR -4+[ebp]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	mov	DWORD PTR _last_expr_value$S1197, eax
; Line 1028
$L1452:
	call	_emit_queue
; Line 1029
$L1444:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_expand_expr_stmt ENDP
_TEXT	ENDS
EXTRN	_void_type_node:DWORD
_DATA	SEGMENT
	ORG $+3
$SG1467	DB	'value computed is not used', 00H
_DATA	ENDS
_TEXT	SEGMENT
_exp$ = 8
_warn_if_unused_value PROC NEAR
; Line 1037
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 1038
	mov	eax, DWORD PTR _exp$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR -4+[ebp], eax
	jmp	$L1455
; Line 1040
$L1459:
; Line 1059
	sub	eax, eax
	jmp	$L1454
; Line 1061
$L1460:
; Line 1064
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	call	_warn_if_unused_value
	add	esp, 4
	jmp	$L1454
; Line 1066
$L1461:
; Line 1067
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_warn_if_unused_value
	add	esp, 4
	or	eax, eax
	je	$L1462
; Line 1068
	mov	eax, 1
	jmp	$L1454
; Line 1069
$L1462:
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	call	_warn_if_unused_value
	add	esp, 4
	jmp	$L1454
; Line 1071
$L1463:
; Line 1074
	mov	eax, DWORD PTR _exp$[ebp]
	mov	ecx, DWORD PTR _void_type_node
	cmp	DWORD PTR [eax+8], ecx
	jne	$L1464
; Line 1075
	sub	eax, eax
	jmp	$L1454
; Line 1078
$L1464:
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 54					; 00000036H
	jne	$L1465
; Line 1079
	sub	eax, eax
	jmp	$L1454
; Line 1081
$L1465:
$L1466:
; Line 1083
	push	OFFSET $SG1467
	mov	eax, DWORD PTR _emit_lineno
	push	eax
	mov	eax, DWORD PTR _emit_filename
	push	eax
	call	_warning_with_file_and_line
	add	esp, 12					; 0000000cH
; Line 1084
	mov	eax, 1
	jmp	$L1454
; Line 1085
	jmp	$L1456
$L1455:
	cmp	DWORD PTR -4+[ebp], 113			; 00000071H
	jg	$L2523
	cmp	DWORD PTR -4+[ebp], 112			; 00000070H
	jge	$L1463
	cmp	DWORD PTR -4+[ebp], 53			; 00000035H
	je	$L1461
	cmp	DWORD PTR -4+[ebp], 54			; 00000036H
	jl	$L1466
	cmp	DWORD PTR -4+[ebp], 63			; 0000003fH
	jle	$L1459
	cmp	DWORD PTR -4+[ebp], 97			; 00000061H
	jl	$L1466
	cmp	DWORD PTR -4+[ebp], 98			; 00000062H
	jle	$L1460
	jmp	$L1466
$L2523:
	cmp	DWORD PTR -4+[ebp], 115			; 00000073H
	je	$L1459
	cmp	DWORD PTR -4+[ebp], 118			; 00000076H
	jl	$L1466
	cmp	DWORD PTR -4+[ebp], 119			; 00000077H
	jle	$L1459
	cmp	DWORD PTR -4+[ebp], 125			; 0000007dH
	jl	$L1466
	cmp	DWORD PTR -4+[ebp], 128			; 00000080H
	jle	$L1459
	jmp	$L1466
$L1456:
; Line 1086
$L1454:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_warn_if_unused_value ENDP
_TEXT	ENDS
PUBLIC	_clear_last_expr
_TEXT	SEGMENT
_clear_last_expr PROC NEAR
; Line 1092
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1093
	mov	DWORD PTR _last_expr_type$S1196, 0
; Line 1094
$L1468:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_clear_last_expr ENDP
_TEXT	ENDS
PUBLIC	_expand_start_stmt_expr
EXTRN	_suspend_momentary:NEAR
EXTRN	_make_node:NEAR
EXTRN	_resume_momentary:NEAR
EXTRN	_inhibit_defer_pop:DWORD
EXTRN	_start_sequence:NEAR
_TEXT	SEGMENT
_t$ = -12
_save$ = -4
_momentary$ = -8
_expand_start_stmt_expr PROC NEAR
; Line 1102
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 1103
	call	_start_sequence
	mov	DWORD PTR _save$[ebp], eax
; Line 1106
	call	_suspend_momentary
	mov	DWORD PTR _momentary$[ebp], eax
; Line 1107
	push	115					; 00000073H
	call	_make_node
	add	esp, 4
	mov	DWORD PTR _t$[ebp], eax
; Line 1108
	mov	eax, DWORD PTR _momentary$[ebp]
	push	eax
	call	_resume_momentary
	add	esp, 4
; Line 1109
	mov	eax, DWORD PTR _save$[ebp]
	mov	ecx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 1110
	inc	DWORD PTR _inhibit_defer_pop
; Line 1111
	inc	DWORD PTR _expr_stmts_for_value
; Line 1112
	mov	eax, DWORD PTR _t$[ebp]
	jmp	$L1469
; Line 1113
$L1469:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_expand_start_stmt_expr ENDP
_TEXT	ENDS
PUBLIC	_expand_end_stmt_expr
EXTRN	_end_sequence:NEAR
EXTRN	_volatile_refs_p:NEAR
EXTRN	_get_insns:NEAR
_BSS	SEGMENT
_rtl_expr_chain$S1198 DD 01H DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
_t$ = 8
_saved$ = -4
_expand_end_stmt_expr PROC NEAR
; Line 1130
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 1131
	mov	eax, DWORD PTR _t$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR _saved$[ebp], eax
; Line 1133
	dec	DWORD PTR _inhibit_defer_pop
; Line 1135
	cmp	DWORD PTR _last_expr_type$S1196, 0
	jne	$L1478
; Line 1137
	mov	eax, DWORD PTR _void_type_node
	mov	DWORD PTR _last_expr_type$S1196, eax
; Line 1138
	mov	eax, DWORD PTR _const0_rtx
	mov	DWORD PTR _last_expr_value$S1197, eax
; Line 1140
$L1478:
	mov	eax, DWORD PTR _last_expr_type$S1196
	mov	ecx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 1141
	mov	eax, DWORD PTR _last_expr_value$S1197
	mov	ecx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 1142
	call	_get_insns
	mov	ecx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [ecx+24], eax
; Line 1144
	mov	eax, DWORD PTR _rtl_expr_chain$S1198
	push	eax
	mov	eax, DWORD PTR _t$[ebp]
	push	eax
	push	0
	call	_tree_cons
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _rtl_expr_chain$S1198, eax
; Line 1146
	mov	eax, DWORD PTR _saved$[ebp]
	push	eax
	call	_end_sequence
	add	esp, 4
; Line 1149
	mov	eax, DWORD PTR _t$[ebp]
	mov	eax, DWORD PTR [eax+16]
	or	eax, 8
	mov	ecx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 1151
	mov	eax, DWORD PTR _last_expr_value$S1197
	push	eax
	call	_volatile_refs_p
	add	esp, 4
	and	eax, 1
	shl	eax, 11					; 0000000bH
	mov	ecx, DWORD PTR _t$[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	and	ecx, -2049				; fffff7ffH
	or	eax, ecx
	mov	ecx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 1153
	mov	DWORD PTR _last_expr_type$S1196, 0
; Line 1154
	dec	DWORD PTR _expr_stmts_for_value
; Line 1156
	mov	eax, DWORD PTR _t$[ebp]
	jmp	$L1476
; Line 1157
$L1476:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_expand_end_stmt_expr ENDP
_TEXT	ENDS
PUBLIC	_expand_start_cond
EXTRN	_xmalloc:NEAR
EXTRN	_do_jump:NEAR
_TEXT	SEGMENT
_cond$ = 8
_exitflag$ = 12
_thiscond$ = -4
_expand_start_cond PROC NEAR
; Line 1169
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 1171
	push	44					; 0000002cH
	call	_xmalloc
	add	esp, 4
	mov	DWORD PTR _thiscond$[ebp], eax
; Line 1175
	mov	eax, DWORD PTR _cond_stack
	mov	ecx, DWORD PTR _thiscond$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 1176
	mov	eax, DWORD PTR _nesting_stack
	mov	ecx, DWORD PTR _thiscond$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 1177
	inc	DWORD PTR _nesting_depth
	mov	eax, DWORD PTR _nesting_depth
	mov	ecx, DWORD PTR _thiscond$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 1178
	mov	eax, DWORD PTR _thiscond$[ebp]
	mov	DWORD PTR [eax+20], 0
; Line 1179
	call	_gen_label_rtx
	mov	ecx, DWORD PTR _thiscond$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 1180
	cmp	DWORD PTR _exitflag$[ebp], 0
	je	$L2524
	mov	eax, DWORD PTR _thiscond$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _thiscond$[ebp]
	mov	DWORD PTR [ecx+12], eax
	jmp	$L2525
$L2524:
	mov	eax, DWORD PTR _thiscond$[ebp]
	mov	DWORD PTR [eax+12], 0
$L2525:
; Line 1181
	mov	eax, DWORD PTR _thiscond$[ebp]
	mov	DWORD PTR _cond_stack, eax
; Line 1182
	mov	eax, DWORD PTR _thiscond$[ebp]
	mov	DWORD PTR _nesting_stack, eax
; Line 1184
	push	0
	mov	eax, DWORD PTR _thiscond$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	mov	eax, DWORD PTR _cond$[ebp]
	push	eax
	call	_do_jump
	add	esp, 12					; 0000000cH
; Line 1185
$L1483:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_expand_start_cond ENDP
_TEXT	ENDS
PUBLIC	_expand_end_cond
EXTRN	_free:NEAR
_TEXT	SEGMENT
_thiscond$ = -4
_initial_depth$1491 = -8
_this$1495 = -12
_expand_end_cond PROC NEAR
; Line 1192
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 1193
	mov	eax, DWORD PTR _cond_stack
	mov	DWORD PTR _thiscond$[ebp], eax
; Line 1195
	call	_do_pending_stack_adjust
; Line 1196
	mov	eax, DWORD PTR _thiscond$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_emit_label
	add	esp, 4
; Line 1198
$L1488:
	mov	eax, DWORD PTR _nesting_stack
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _initial_depth$1491[ebp], eax
$L1492:
	mov	eax, DWORD PTR _cond_stack
	mov	DWORD PTR _this$1495[ebp], eax
	mov	eax, DWORD PTR _this$1495[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _cond_stack, eax
	mov	eax, DWORD PTR _this$1495[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _nesting_stack, eax
	mov	eax, DWORD PTR _this$1495[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _nesting_depth, eax
	mov	eax, DWORD PTR _this$1495[ebp]
	push	eax
	call	_free
	add	esp, 4
$L1493:
	mov	eax, DWORD PTR _initial_depth$1491[ebp]
	cmp	DWORD PTR _nesting_depth, eax
	jg	$L1492
$L1494:
$L1489:
$L1490:
; Line 1199
	mov	DWORD PTR _last_expr_type$S1196, 0
; Line 1200
$L1486:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_expand_end_cond ENDP
_TEXT	ENDS
PUBLIC	_expand_start_else
_TEXT	SEGMENT
_expand_start_else PROC NEAR
; Line 1207
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1208
	call	_gen_label_rtx
	mov	ecx, DWORD PTR _cond_stack
	mov	DWORD PTR [ecx+20], eax
; Line 1209
	mov	eax, DWORD PTR _cond_stack
	cmp	DWORD PTR [eax+12], 0
	je	$L1498
; Line 1210
	mov	eax, DWORD PTR _cond_stack
	mov	eax, DWORD PTR [eax+20]
	mov	ecx, DWORD PTR _cond_stack
	mov	DWORD PTR [ecx+12], eax
; Line 1211
$L1498:
	mov	eax, DWORD PTR _cond_stack
	mov	eax, DWORD PTR [eax+20]
	push	eax
	call	_emit_jump
	add	esp, 4
; Line 1212
	mov	eax, DWORD PTR _cond_stack
	cmp	DWORD PTR [eax+16], 0
	je	$L1499
; Line 1213
	mov	eax, DWORD PTR _cond_stack
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_emit_label
	add	esp, 4
; Line 1214
$L1499:
$L1497:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_expand_start_else ENDP
_TEXT	ENDS
PUBLIC	_expand_end_else
_TEXT	SEGMENT
_thiscond$ = -4
_initial_depth$1506 = -8
_this$1510 = -12
_expand_end_else PROC NEAR
; Line 1221
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 1222
	mov	eax, DWORD PTR _cond_stack
	mov	DWORD PTR _thiscond$[ebp], eax
; Line 1224
	call	_do_pending_stack_adjust
; Line 1227
	mov	eax, DWORD PTR _thiscond$[ebp]
	cmp	DWORD PTR [eax+20], 0
	je	$L1502
; Line 1228
	mov	eax, DWORD PTR _thiscond$[ebp]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	call	_emit_label
	add	esp, 4
; Line 1230
$L1502:
$L1503:
	mov	eax, DWORD PTR _nesting_stack
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _initial_depth$1506[ebp], eax
$L1507:
	mov	eax, DWORD PTR _cond_stack
	mov	DWORD PTR _this$1510[ebp], eax
	mov	eax, DWORD PTR _this$1510[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _cond_stack, eax
	mov	eax, DWORD PTR _this$1510[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _nesting_stack, eax
	mov	eax, DWORD PTR _this$1510[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _nesting_depth, eax
	mov	eax, DWORD PTR _this$1510[ebp]
	push	eax
	call	_free
	add	esp, 4
$L1508:
	mov	eax, DWORD PTR _initial_depth$1506[ebp]
	cmp	DWORD PTR _nesting_depth, eax
	jg	$L1507
$L1509:
$L1504:
$L1505:
; Line 1231
	mov	DWORD PTR _last_expr_type$S1196, 0
; Line 1232
$L1500:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_expand_end_else ENDP
_TEXT	ENDS
PUBLIC	_expand_start_loop
EXTRN	_emit_note:NEAR
_TEXT	SEGMENT
_exit_flag$ = 8
_thisloop$ = -4
_expand_start_loop PROC NEAR
; Line 1244
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 1246
	push	44					; 0000002cH
	call	_xmalloc
	add	esp, 4
	mov	DWORD PTR _thisloop$[ebp], eax
; Line 1250
	mov	eax, DWORD PTR _loop_stack
	mov	ecx, DWORD PTR _thisloop$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 1251
	mov	eax, DWORD PTR _nesting_stack
	mov	ecx, DWORD PTR _thisloop$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 1252
	inc	DWORD PTR _nesting_depth
	mov	eax, DWORD PTR _nesting_depth
	mov	ecx, DWORD PTR _thisloop$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 1253
	call	_gen_label_rtx
	mov	ecx, DWORD PTR _thisloop$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 1254
	call	_gen_label_rtx
	mov	ecx, DWORD PTR _thisloop$[ebp]
	mov	DWORD PTR [ecx+20], eax
; Line 1255
	mov	eax, DWORD PTR _thisloop$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _thisloop$[ebp]
	mov	DWORD PTR [ecx+24], eax
; Line 1256
	cmp	DWORD PTR _exit_flag$[ebp], 0
	je	$L2526
	mov	eax, DWORD PTR _thisloop$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	ecx, DWORD PTR _thisloop$[ebp]
	mov	DWORD PTR [ecx+12], eax
	jmp	$L2527
$L2526:
	mov	eax, DWORD PTR _thisloop$[ebp]
	mov	DWORD PTR [eax+12], 0
$L2527:
; Line 1257
	mov	eax, DWORD PTR _thisloop$[ebp]
	mov	DWORD PTR _loop_stack, eax
; Line 1258
	mov	eax, DWORD PTR _thisloop$[ebp]
	mov	DWORD PTR _nesting_stack, eax
; Line 1260
	call	_do_pending_stack_adjust
; Line 1261
	call	_emit_queue
; Line 1262
	push	-4					; fffffffcH
	push	0
	call	_emit_note
	add	esp, 8
; Line 1263
	mov	eax, DWORD PTR _thisloop$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_emit_label
	add	esp, 4
; Line 1264
$L1512:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_expand_start_loop ENDP
_TEXT	ENDS
PUBLIC	_expand_start_loop_continue_elsewhere
_TEXT	SEGMENT
_exit_flag$ = 8
_expand_start_loop_continue_elsewhere PROC NEAR
; Line 1272
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1273
	mov	eax, DWORD PTR _exit_flag$[ebp]
	push	eax
	call	_expand_start_loop
	add	esp, 4
; Line 1274
	call	_gen_label_rtx
	mov	ecx, DWORD PTR _loop_stack
	mov	DWORD PTR [ecx+24], eax
; Line 1275
$L1515:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_expand_start_loop_continue_elsewhere ENDP
_TEXT	ENDS
PUBLIC	_expand_loop_continue_here
_TEXT	SEGMENT
_expand_loop_continue_here PROC NEAR
; Line 1284
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1285
	call	_do_pending_stack_adjust
; Line 1286
	push	-8					; fffffff8H
	push	0
	call	_emit_note
	add	esp, 8
; Line 1287
	mov	eax, DWORD PTR _loop_stack
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_emit_label
	add	esp, 4
; Line 1288
$L1516:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_expand_loop_continue_here ENDP
_TEXT	ENDS
PUBLIC	_expand_end_loop
EXTRN	_emit_barrier_after:NEAR
EXTRN	_pc_rtx:DWORD
EXTRN	_emit_label_after:NEAR
EXTRN	_reorder_insns:NEAR
EXTRN	_emit_jump_insn_after:NEAR
_TEXT	SEGMENT
_initial_depth$1539 = -16
_this$1543 = -20
_insn$ = -4
_start_label$ = -8
_newstart_label$1532 = -12
_expand_end_loop PROC NEAR
; Line 1295
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	push	ebx
	push	esi
	push	edi
; Line 1296
	call	_get_last_insn
	mov	DWORD PTR _insn$[ebp], eax
; Line 1297
	mov	eax, DWORD PTR _loop_stack
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _start_label$[ebp], eax
; Line 1299
	call	_do_pending_stack_adjust
; Line 1301
$L1521:
	cmp	DWORD PTR _insn$[ebp], 0
	je	$L1522
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1179648				; 00120000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1522
; Line 1302
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _insn$[ebp], eax
	jmp	$L1521
$L1522:
; Line 1316
	cmp	DWORD PTR _optimize, 0
	je	$L1523
	cmp	DWORD PTR _insn$[ebp], 0
	je	$L1523
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 917504				; 000e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1524
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1524
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _pc_rtx
	cmp	DWORD PTR [eax+4], ecx
	jne	$L1524
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2752512				; 002a0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1523
$L1524:
; Line 1320
	mov	eax, DWORD PTR _loop_stack
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _insn$[ebp], eax
	jmp	$L1525
$L1526:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _insn$[ebp], eax
$L1525:
	cmp	DWORD PTR _insn$[ebp], 0
	je	$L1527
; Line 1331
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 917504				; 000e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1528
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1528
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _pc_rtx
	cmp	DWORD PTR [eax+4], ecx
	jne	$L1528
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2752512				; 002a0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1528
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1530
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _loop_stack
	mov	ecx, DWORD PTR [ecx+20]
	cmp	DWORD PTR [eax+4], ecx
	je	$L1529
$L1530:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+12]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1528
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+12]
	mov	ecx, DWORD PTR _loop_stack
	mov	ecx, DWORD PTR [ecx+20]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L1528
$L1529:
; Line 1332
	jmp	$L1527
; Line 1333
$L1528:
	jmp	$L1526
$L1527:
	cmp	DWORD PTR _insn$[ebp], 0
	je	$L1531
; Line 1338
	call	_gen_label_rtx
	mov	DWORD PTR _newstart_label$1532[ebp], eax
; Line 1340
	mov	eax, DWORD PTR _start_label$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _newstart_label$1532[ebp]
	push	eax
	call	_emit_label_after
	add	esp, 8
; Line 1341
	call	_get_last_insn
	push	eax
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _start_label$[ebp]
	push	eax
	call	_reorder_insns
	add	esp, 12					; 0000000cH
; Line 1342
	mov	eax, DWORD PTR _newstart_label$1532[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _start_label$[ebp]
	push	eax
	call	_gen_jump
	add	esp, 4
	push	eax
	call	_emit_jump_insn_after
	add	esp, 8
; Line 1343
	mov	eax, DWORD PTR _newstart_label$1532[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_emit_barrier_after
	add	esp, 4
; Line 1344
	mov	eax, DWORD PTR _newstart_label$1532[ebp]
	mov	DWORD PTR _start_label$[ebp], eax
; Line 1346
$L1531:
; Line 1348
$L1523:
	mov	eax, DWORD PTR _start_label$[ebp]
	push	eax
	call	_emit_jump
	add	esp, 4
; Line 1349
	push	-5					; fffffffbH
	push	0
	call	_emit_note
	add	esp, 8
; Line 1350
	mov	eax, DWORD PTR _loop_stack
	mov	eax, DWORD PTR [eax+20]
	push	eax
	call	_emit_label
	add	esp, 4
; Line 1352
$L1536:
	mov	eax, DWORD PTR _nesting_stack
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _initial_depth$1539[ebp], eax
$L1540:
	mov	eax, DWORD PTR _loop_stack
	mov	DWORD PTR _this$1543[ebp], eax
	mov	eax, DWORD PTR _this$1543[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _loop_stack, eax
	mov	eax, DWORD PTR _this$1543[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _nesting_stack, eax
	mov	eax, DWORD PTR _this$1543[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _nesting_depth, eax
	mov	eax, DWORD PTR _this$1543[ebp]
	push	eax
	call	_free
	add	esp, 4
$L1541:
	mov	eax, DWORD PTR _initial_depth$1539[ebp]
	cmp	DWORD PTR _nesting_depth, eax
	jg	$L1540
$L1542:
$L1537:
$L1538:
; Line 1354
	mov	DWORD PTR _last_expr_type$S1196, 0
; Line 1355
$L1517:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_expand_end_loop ENDP
_TEXT	ENDS
PUBLIC	_expand_continue_loop
_TEXT	SEGMENT
_expand_continue_loop PROC NEAR
; Line 1364
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1365
	mov	DWORD PTR _last_expr_type$S1196, 0
; Line 1366
	cmp	DWORD PTR _loop_stack, 0
	jne	$L1545
; Line 1367
	sub	eax, eax
	jmp	$L1544
; Line 1368
$L1545:
	push	0
	mov	eax, DWORD PTR _loop_stack
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	0
	call	_expand_goto_internal
	add	esp, 12					; 0000000cH
; Line 1369
	mov	eax, 1
	jmp	$L1544
; Line 1370
$L1544:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_expand_continue_loop ENDP
_TEXT	ENDS
PUBLIC	_expand_exit_loop
_TEXT	SEGMENT
_expand_exit_loop PROC NEAR
; Line 1377
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1378
	mov	DWORD PTR _last_expr_type$S1196, 0
; Line 1379
	cmp	DWORD PTR _loop_stack, 0
	jne	$L1547
; Line 1380
	sub	eax, eax
	jmp	$L1546
; Line 1381
$L1547:
	push	0
	mov	eax, DWORD PTR _loop_stack
	mov	eax, DWORD PTR [eax+20]
	push	eax
	push	0
	call	_expand_goto_internal
	add	esp, 12					; 0000000cH
; Line 1382
	mov	eax, 1
	jmp	$L1546
; Line 1383
$L1546:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_expand_exit_loop ENDP
_TEXT	ENDS
PUBLIC	_expand_exit_loop_if_false
_TEXT	SEGMENT
_cond$ = 8
_expand_exit_loop_if_false PROC NEAR
; Line 1392
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1393
	mov	DWORD PTR _last_expr_type$S1196, 0
; Line 1394
	cmp	DWORD PTR _loop_stack, 0
	jne	$L1550
; Line 1395
	sub	eax, eax
	jmp	$L1549
; Line 1396
$L1550:
	push	0
	mov	eax, DWORD PTR _loop_stack
	mov	eax, DWORD PTR [eax+20]
	push	eax
	mov	eax, DWORD PTR _cond$[ebp]
	push	eax
	call	_do_jump
	add	esp, 12					; 0000000cH
; Line 1397
	mov	eax, 1
	jmp	$L1549
; Line 1398
$L1549:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_expand_exit_loop_if_false ENDP
_TEXT	ENDS
PUBLIC	_inside_loop
_TEXT	SEGMENT
_inside_loop PROC NEAR
; Line 1404
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1405
	cmp	DWORD PTR _loop_stack, 1
	sbb	eax, eax
	inc	eax
	jmp	$L1552
; Line 1406
$L1552:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_inside_loop ENDP
_TEXT	ENDS
PUBLIC	_expand_exit_something
_TEXT	SEGMENT
_n$ = -4
_expand_exit_something PROC NEAR
; Line 1419
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 1421
	mov	DWORD PTR _last_expr_type$S1196, 0
; Line 1422
	mov	eax, DWORD PTR _nesting_stack
	mov	DWORD PTR _n$[ebp], eax
	jmp	$L1555
$L1556:
	mov	eax, DWORD PTR _n$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _n$[ebp], eax
$L1555:
	cmp	DWORD PTR _n$[ebp], 0
	je	$L1557
; Line 1423
	mov	eax, DWORD PTR _n$[ebp]
	cmp	DWORD PTR [eax+12], 0
	je	$L1558
; Line 1425
	push	0
	mov	eax, DWORD PTR _n$[ebp]
	mov	eax, DWORD PTR [eax+12]
	push	eax
	push	0
	call	_expand_goto_internal
	add	esp, 12					; 0000000cH
; Line 1426
	mov	eax, 1
	jmp	$L1553
; Line 1429
$L1558:
	jmp	$L1556
$L1557:
	sub	eax, eax
	jmp	$L1553
; Line 1430
$L1553:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_expand_exit_something ENDP
_TEXT	ENDS
PUBLIC	_expand_null_return
_TEXT	SEGMENT
_block$ = -8
_last_insn$ = -4
_expand_null_return PROC NEAR
; Line 1437
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 1438
	mov	eax, DWORD PTR _block_stack
	mov	DWORD PTR _block$[ebp], eax
; Line 1439
	mov	DWORD PTR _last_insn$[ebp], 0
; Line 1443
$L1563:
	cmp	DWORD PTR _block$[ebp], 0
	je	$L1564
	mov	eax, DWORD PTR _block$[ebp]
	cmp	DWORD PTR [eax+32], 0
	jne	$L1564
; Line 1444
	mov	eax, DWORD PTR _block$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _block$[ebp], eax
	jmp	$L1563
$L1564:
; Line 1448
	cmp	DWORD PTR _block$[ebp], 1
	sbb	eax, eax
	inc	eax
	push	eax
	mov	eax, DWORD PTR _last_insn$[ebp]
	push	eax
	call	_expand_null_return_1
	add	esp, 8
; Line 1449
$L1559:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_expand_null_return ENDP
_TEXT	ENDS
EXTRN	_clear_pending_stack_adjust:NEAR
_TEXT	SEGMENT
_last_insn$ = 8
_use_goto$ = 12
_end_label$ = -4
_expand_null_return_1 PROC NEAR
; Line 1461
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 1462
	cmp	DWORD PTR _cleanup_label, 0
	je	$L2528
	mov	eax, DWORD PTR _cleanup_label
	mov	DWORD PTR _end_label$[ebp], eax
	jmp	$L2529
$L2528:
	mov	eax, DWORD PTR _return_label
	mov	DWORD PTR _end_label$[ebp], eax
$L2529:
; Line 1464
	call	_clear_pending_stack_adjust
; Line 1465
	call	_do_pending_stack_adjust
; Line 1466
	mov	DWORD PTR _last_expr_type$S1196, 0
; Line 1469
	cmp	DWORD PTR _current_function_returns_pcc_struct, 0
	jne	$L1571
	cmp	DWORD PTR _use_goto$[ebp], 0
	je	$L1570
$L1571:
; Line 1471
	cmp	DWORD PTR _end_label$[ebp], 0
	jne	$L1572
; Line 1472
	call	_gen_label_rtx
	mov	DWORD PTR _return_label, eax
	mov	eax, DWORD PTR _return_label
	mov	DWORD PTR _end_label$[ebp], eax
; Line 1473
$L1572:
	mov	eax, DWORD PTR _last_insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _end_label$[ebp]
	push	eax
	push	0
	call	_expand_goto_internal
	add	esp, 12					; 0000000cH
; Line 1474
	jmp	$L1567
; Line 1489
$L1570:
	mov	eax, DWORD PTR _last_insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _end_label$[ebp]
	push	eax
	push	0
	call	_expand_goto_internal
	add	esp, 12					; 0000000cH
; Line 1490
$L1567:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_expand_null_return_1 ENDP
_TEXT	ENDS
PUBLIC	_expand_return
_BSS	SEGMENT
_this_function$S1190 DD 01H DUP (?)
_frame_offset$S1192 DD 01H DUP (?)
_tail_recursion_label$S1194 DD 01H DUP (?)
_tail_recursion_reentry$S1195 DD 01H DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
_retval$ = 8
_last_insn$ = -8
_val$ = -12
_retval_rhs$ = -4
_cleanups$ = -16
_block$ = -20
_last_insn$1597 = -28
_expand_return PROC NEAR
; Line 1498
	push	ebp
	mov	ebp, esp
	sub	esp, 28					; 0000001cH
	push	ebx
	push	esi
	push	edi
; Line 1507
	mov	DWORD PTR _last_insn$[ebp], 0
; Line 1508
	mov	DWORD PTR _val$[ebp], 0
; Line 1515
	mov	DWORD PTR _cleanups$[ebp], 0
; Line 1516
	mov	eax, DWORD PTR _block_stack
	mov	DWORD PTR _block$[ebp], eax
	jmp	$L1581
$L1582:
	mov	eax, DWORD PTR _block$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _block$[ebp], eax
$L1581:
	cmp	DWORD PTR _block$[ebp], 0
	je	$L1583
; Line 1517
	mov	eax, DWORD PTR _block$[ebp]
	cmp	DWORD PTR [eax+32], 0
	je	$L1584
; Line 1519
	mov	DWORD PTR _cleanups$[ebp], 1
; Line 1520
	jmp	$L1583
; Line 1523
$L1584:
	jmp	$L1582
$L1583:
	mov	eax, DWORD PTR _retval$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 45					; 0000002dH
	jne	$L1585
; Line 1524
	mov	eax, DWORD PTR _retval$[ebp]
	mov	DWORD PTR _retval_rhs$[ebp], eax
; Line 1525
	jmp	$L1586
$L1585:
; Line 1526
	mov	eax, DWORD PTR _retval$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 54					; 00000036H
	je	$L1588
	mov	eax, DWORD PTR _retval$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 55					; 00000037H
	jne	$L1587
$L1588:
	mov	eax, DWORD PTR _retval$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 45					; 0000002dH
	jne	$L1587
; Line 1527
	mov	eax, DWORD PTR _retval$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR _retval_rhs$[ebp], eax
; Line 1528
	jmp	$L1589
$L1587:
	mov	eax, DWORD PTR _retval$[ebp]
	mov	ecx, DWORD PTR _void_type_node
	cmp	DWORD PTR [eax+8], ecx
	jne	$L1590
; Line 1530
	mov	eax, DWORD PTR _retval$[ebp]
	mov	DWORD PTR _retval_rhs$[ebp], eax
; Line 1531
	jmp	$L1591
$L1590:
; Line 1532
	mov	DWORD PTR _retval_rhs$[ebp], 0
$L1591:
$L1589:
$L1586:
; Line 1535
	cmp	DWORD PTR _cleanups$[ebp], 0
	jne	$L1593
	cmp	DWORD PTR _cleanup_label, 0
	je	$L1592
$L1593:
; Line 1536
	call	_get_last_insn
	mov	DWORD PTR _last_insn$[ebp], eax
; Line 1543
$L1592:
; Line 1551
	cmp	DWORD PTR _optimize, 0
	je	$L1594
	cmp	DWORD PTR _retval_rhs$[ebp], 0
	je	$L1594
	cmp	DWORD PTR _frame_offset$S1192, 0
	jne	$L1594
	mov	eax, DWORD PTR _retval_rhs$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 61					; 0000003dH
	jne	$L1594
	mov	eax, DWORD PTR _retval_rhs$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 116				; 00000074H
	jne	$L1594
	mov	eax, DWORD PTR _retval_rhs$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	ecx, DWORD PTR _this_function$S1190
	cmp	DWORD PTR [eax+24], ecx
	jne	$L1594
	mov	eax, DWORD PTR _this_function$S1190
	mov	eax, DWORD PTR [eax+56]
	push	eax
	mov	eax, DWORD PTR _retval_rhs$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	call	_tail_recursion_args
	add	esp, 8
	or	eax, eax
	je	$L1594
; Line 1553
	cmp	DWORD PTR _tail_recursion_label$S1194, 0
	jne	$L1595
; Line 1555
	call	_gen_label_rtx
	mov	DWORD PTR _tail_recursion_label$S1194, eax
; Line 1557
	mov	eax, DWORD PTR _tail_recursion_reentry$S1195
	push	eax
	mov	eax, DWORD PTR _tail_recursion_label$S1194
	push	eax
	call	_emit_label_after
	add	esp, 8
; Line 1559
$L1595:
	mov	eax, DWORD PTR _last_insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _tail_recursion_label$S1194
	push	eax
	push	0
	call	_expand_goto_internal
	add	esp, 12					; 0000000cH
; Line 1560
	call	_emit_barrier
; Line 1561
	jmp	$L1574
; Line 1604
$L1594:
; Line 1607
	cmp	DWORD PTR _cleanups$[ebp], 0
	je	$L1596
	cmp	DWORD PTR _retval_rhs$[ebp], 0
	je	$L1596
	mov	eax, DWORD PTR _retval_rhs$[ebp]
	mov	ecx, DWORD PTR _void_type_node
	cmp	DWORD PTR [eax+8], ecx
	je	$L1596
	mov	eax, DWORD PTR _this_function$S1190
	mov	eax, DWORD PTR [eax+60]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1596
; Line 1611
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _retval_rhs$[ebp]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	mov	DWORD PTR _val$[ebp], eax
; Line 1612
	call	_emit_queue
; Line 1614
	call	_get_last_insn
	mov	DWORD PTR _last_insn$1597[ebp], eax
; Line 1616
	mov	eax, DWORD PTR _val$[ebp]
	push	eax
	mov	eax, DWORD PTR _this_function$S1190
	mov	eax, DWORD PTR [eax+60]
	mov	eax, DWORD PTR [eax+76]
	push	eax
	call	_emit_move_insn
	add	esp, 8
; Line 1617
	mov	eax, DWORD PTR _this_function$S1190
	mov	eax, DWORD PTR [eax+60]
	mov	eax, DWORD PTR [eax+76]
	mov	DWORD PTR _val$[ebp], eax
; Line 1619
	mov	eax, DWORD PTR _val$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1598
; Line 1620
	mov	eax, DWORD PTR _val$[ebp]
	push	eax
	push	0
	push	26					; 0000001aH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	call	_emit_insn
	add	esp, 4
; Line 1621
$L1598:
	mov	eax, DWORD PTR _cleanups$[ebp]
	push	eax
	mov	eax, DWORD PTR _last_insn$1597[ebp]
	push	eax
	call	_expand_null_return_1
	add	esp, 8
; Line 1623
	jmp	$L1599
$L1596:
; Line 1628
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _retval$[ebp]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	mov	DWORD PTR _val$[ebp], eax
; Line 1629
	call	_emit_queue
; Line 1631
	mov	eax, DWORD PTR _this_function$S1190
	mov	eax, DWORD PTR [eax+60]
	mov	eax, DWORD PTR [eax+76]
	mov	DWORD PTR _val$[ebp], eax
; Line 1632
	cmp	DWORD PTR _val$[ebp], 0
	je	$L1600
	mov	eax, DWORD PTR _val$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1600
; Line 1633
	mov	eax, DWORD PTR _val$[ebp]
	push	eax
	push	0
	push	26					; 0000001aH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	call	_emit_insn
	add	esp, 4
; Line 1634
$L1600:
	call	_expand_null_return
; Line 1635
$L1599:
; Line 1636
$L1574:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_expand_return ENDP
_TEXT	ENDS
PUBLIC	_drop_through_at_end_p
_TEXT	SEGMENT
_insn$ = -4
_drop_through_at_end_p PROC NEAR
; Line 1643
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 1644
	call	_get_last_insn
	mov	DWORD PTR _insn$[ebp], eax
; Line 1645
$L1605:
	cmp	DWORD PTR _insn$[ebp], 0
	je	$L1606
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1179648				; 00120000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1606
; Line 1646
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _insn$[ebp], eax
	jmp	$L1605
$L1606:
; Line 1647
	cmp	DWORD PTR _insn$[ebp], 0
	je	$L2530
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1048576				; 00100000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L2530
	mov	eax, 1
	jmp	$L2531
$L2530:
	sub	eax, eax
$L2531:
	jmp	$L1602
; Line 1648
$L1602:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_drop_through_at_end_p ENDP
_TEXT	ENDS
EXTRN	_convert_move:NEAR
EXTRN	_copy_to_reg:NEAR
EXTRN	_reg_mentioned_p:NEAR
_TEXT	SEGMENT
_actuals$ = 8
_formals$ = 12
_a$ = -4
_f$ = -12
_i$ = -8
_argvec$ = -16
_copy$1628 = -24
_j$1629 = -20
_tail_recursion_args PROC NEAR
; Line 1659
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	push	ebx
	push	esi
	push	edi
; Line 1660
	mov	eax, DWORD PTR _actuals$[ebp]
	mov	DWORD PTR _a$[ebp], eax
	mov	eax, DWORD PTR _formals$[ebp]
	mov	DWORD PTR _f$[ebp], eax
; Line 1671
	mov	eax, DWORD PTR _actuals$[ebp]
	mov	DWORD PTR _a$[ebp], eax
	mov	eax, DWORD PTR _formals$[ebp]
	mov	DWORD PTR _f$[ebp], eax
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L1614
$L1615:
	mov	eax, DWORD PTR _a$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _a$[ebp], eax
	mov	eax, DWORD PTR _f$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _f$[ebp], eax
	inc	DWORD PTR _i$[ebp]
$L1614:
	cmp	DWORD PTR _a$[ebp], 0
	je	$L1616
	cmp	DWORD PTR _f$[ebp], 0
	je	$L1616
; Line 1673
	mov	eax, DWORD PTR _a$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	ecx, DWORD PTR _f$[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	cmp	DWORD PTR [eax+8], ecx
	je	$L1617
; Line 1674
	sub	eax, eax
	jmp	$L1609
; Line 1675
$L1617:
	mov	eax, DWORD PTR _f$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1619
	mov	eax, DWORD PTR _f$[ebp]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	and	eax, -16777216				; ff000000H
	mov	ecx, 436207616				; 1a000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1618
$L1619:
; Line 1676
	sub	eax, eax
	jmp	$L1609
; Line 1677
$L1618:
	jmp	$L1615
$L1616:
; Line 1678
	cmp	DWORD PTR _a$[ebp], 0
	jne	$L1621
	cmp	DWORD PTR _f$[ebp], 0
	je	$L1620
$L1621:
; Line 1679
	sub	eax, eax
	jmp	$L1609
; Line 1683
$L1620:
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 2
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _argvec$[ebp], eax
; Line 1685
	mov	eax, DWORD PTR _actuals$[ebp]
	mov	DWORD PTR _a$[ebp], eax
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L1622
$L1623:
	mov	eax, DWORD PTR _a$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _a$[ebp], eax
	inc	DWORD PTR _i$[ebp]
$L1622:
	cmp	DWORD PTR _a$[ebp], 0
	je	$L1624
; Line 1686
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _a$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _argvec$[ebp]
	mov	DWORD PTR [edx+ecx*4], eax
	jmp	$L1623
$L1624:
; Line 1691
	mov	eax, DWORD PTR _actuals$[ebp]
	mov	DWORD PTR _a$[ebp], eax
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L1625
$L1626:
	mov	eax, DWORD PTR _a$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _a$[ebp], eax
	inc	DWORD PTR _i$[ebp]
$L1625:
	cmp	DWORD PTR _a$[ebp], 0
	je	$L1627
; Line 1693
	mov	DWORD PTR _copy$1628[ebp], 0
; Line 1695
	mov	eax, DWORD PTR _formals$[ebp]
	mov	DWORD PTR _f$[ebp], eax
	mov	DWORD PTR _j$1629[ebp], 0
	jmp	$L1630
$L1631:
	mov	eax, DWORD PTR _f$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _f$[ebp], eax
	inc	DWORD PTR _j$1629[ebp]
$L1630:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _j$1629[ebp], eax
	jge	$L1632
; Line 1696
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _argvec$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	mov	eax, DWORD PTR _f$[ebp]
	mov	eax, DWORD PTR [eax+76]
	push	eax
	call	_reg_mentioned_p
	add	esp, 8
	or	eax, eax
	je	$L1634
; Line 1697
	mov	DWORD PTR _copy$1628[ebp], 1
	jmp	$L1632
; Line 1698
$L1634:
	jmp	$L1631
$L1632:
	cmp	DWORD PTR _copy$1628[ebp], 0
	je	$L1635
; Line 1699
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _argvec$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	call	_copy_to_reg
	add	esp, 4
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _argvec$[ebp]
	mov	DWORD PTR [edx+ecx*4], eax
; Line 1700
$L1635:
	jmp	$L1626
$L1627:
; Line 1705
	mov	eax, DWORD PTR _formals$[ebp]
	mov	DWORD PTR _f$[ebp], eax
	mov	eax, DWORD PTR _actuals$[ebp]
	mov	DWORD PTR _a$[ebp], eax
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L1636
$L1637:
	mov	eax, DWORD PTR _f$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _f$[ebp], eax
	mov	eax, DWORD PTR _a$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _a$[ebp], eax
	inc	DWORD PTR _i$[ebp]
$L1636:
	cmp	DWORD PTR _f$[ebp], 0
	je	$L1638
; Line 1707
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _argvec$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, DWORD PTR _f$[ebp]
	mov	ecx, DWORD PTR [ecx+32]
	shl	ecx, 24					; 00000018H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1639
; Line 1708
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _argvec$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	mov	eax, DWORD PTR _f$[ebp]
	mov	eax, DWORD PTR [eax+76]
	push	eax
	call	_emit_move_insn
	add	esp, 8
; Line 1709
	jmp	$L1640
$L1639:
; Line 1711
	mov	eax, DWORD PTR _a$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 12					; 0000000cH
	and	eax, 1
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _argvec$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	mov	eax, DWORD PTR _f$[ebp]
	mov	eax, DWORD PTR [eax+76]
	push	eax
	call	_convert_move
	add	esp, 12					; 0000000cH
$L1640:
; Line 1712
	jmp	$L1637
$L1638:
; Line 1714
	mov	eax, 1
	jmp	$L1609
; Line 1715
$L1609:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_tail_recursion_args ENDP
_TEXT	ENDS
PUBLIC	_expand_start_bindings
_TEXT	SEGMENT
_exit_flag$ = 8
_thisblock$ = -4
_note$ = -8
_expand_start_bindings PROC NEAR
; Line 1726
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 1728
	push	44					; 0000002cH
	call	_xmalloc
	add	esp, 4
	mov	DWORD PTR _thisblock$[ebp], eax
; Line 1730
	push	-2					; fffffffeH
	push	0
	call	_emit_note
	add	esp, 8
	mov	DWORD PTR _note$[ebp], eax
; Line 1734
	mov	eax, DWORD PTR _block_stack
	mov	ecx, DWORD PTR _thisblock$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 1735
	mov	eax, DWORD PTR _nesting_stack
	mov	ecx, DWORD PTR _thisblock$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 1736
	inc	DWORD PTR _nesting_depth
	mov	eax, DWORD PTR _nesting_depth
	mov	ecx, DWORD PTR _thisblock$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 1737
	mov	eax, DWORD PTR _thisblock$[ebp]
	mov	DWORD PTR [eax+20], 0
; Line 1738
	mov	eax, DWORD PTR _thisblock$[ebp]
	mov	DWORD PTR [eax+32], 0
; Line 1746
	cmp	DWORD PTR _block_stack, 0
	je	$L2532
	mov	eax, DWORD PTR _block_stack
	mov	eax, DWORD PTR [eax+36]
	push	eax
	mov	eax, DWORD PTR _block_stack
	mov	eax, DWORD PTR [eax+32]
	push	eax
	push	0
	call	_tree_cons
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _thisblock$[ebp]
	mov	DWORD PTR [ecx+36], eax
	jmp	$L2533
$L2532:
	mov	eax, DWORD PTR _thisblock$[ebp]
	mov	DWORD PTR [eax+36], 0
$L2533:
; Line 1747
	mov	eax, DWORD PTR _thisblock$[ebp]
	mov	DWORD PTR [eax+40], 0
; Line 1748
	mov	eax, DWORD PTR _stack_block_stack
	mov	ecx, DWORD PTR _thisblock$[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 1749
	mov	eax, DWORD PTR _note$[ebp]
	mov	ecx, DWORD PTR _thisblock$[ebp]
	mov	DWORD PTR [ecx+24], eax
; Line 1750
	inc	DWORD PTR _block_start_count$S1191
	mov	eax, DWORD PTR _block_start_count$S1191
	mov	ecx, DWORD PTR _thisblock$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 1751
	cmp	DWORD PTR _exit_flag$[ebp], 0
	je	$L2534
	call	_gen_label_rtx
	mov	ecx, DWORD PTR _thisblock$[ebp]
	mov	DWORD PTR [ecx+12], eax
	jmp	$L2535
$L2534:
	mov	eax, DWORD PTR _thisblock$[ebp]
	mov	DWORD PTR [eax+12], 0
$L2535:
; Line 1753
	mov	eax, DWORD PTR _thisblock$[ebp]
	mov	DWORD PTR _block_stack, eax
; Line 1754
	mov	eax, DWORD PTR _thisblock$[ebp]
	mov	DWORD PTR _nesting_stack, eax
; Line 1755
$L1642:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_expand_start_bindings ENDP
_TEXT	ENDS
PUBLIC	_use_variable
EXTRN	_frame_pointer_rtx:DWORD
EXTRN	_arg_pointer_rtx:DWORD
_TEXT	SEGMENT
_rtl$ = 8
_use_variable PROC NEAR
; Line 1764
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1765
	mov	eax, DWORD PTR _rtl$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1648
; Line 1767
	mov	eax, DWORD PTR _rtl$[ebp]
	push	eax
	push	0
	push	26					; 0000001aH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	call	_emit_insn
	add	esp, 4
; Line 1768
	jmp	$L1649
$L1648:
	mov	eax, DWORD PTR _rtl$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1650
; Line 1769
	mov	eax, DWORD PTR _rtl$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_use_variable
	add	esp, 4
; Line 1770
	jmp	$L1651
$L1650:
; Line 1773
	mov	eax, DWORD PTR _rtl$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1652
	mov	eax, DWORD PTR _rtl$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1652
	mov	eax, DWORD PTR _rtl$[ebp]
	mov	ecx, DWORD PTR _frame_pointer_rtx
	cmp	DWORD PTR [eax+4], ecx
	je	$L1652
	mov	eax, DWORD PTR _rtl$[ebp]
	mov	ecx, DWORD PTR _arg_pointer_rtx
	cmp	DWORD PTR [eax+4], ecx
	je	$L1652
; Line 1775
	mov	eax, DWORD PTR _rtl$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	0
	push	26					; 0000001aH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	call	_emit_insn
	add	esp, 4
; Line 1776
$L1652:
$L1651:
$L1649:
$L1647:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_use_variable ENDP
_rtl$ = 8
_insn$ = 12
_use_variable_after PROC NEAR
; Line 1784
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1785
	mov	eax, DWORD PTR _rtl$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1657
; Line 1787
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _rtl$[ebp]
	push	eax
	push	0
	push	26					; 0000001aH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	call	_emit_insn_after
	add	esp, 8
; Line 1788
	jmp	$L1658
$L1657:
	mov	eax, DWORD PTR _rtl$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1659
; Line 1789
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _rtl$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_use_variable_after
	add	esp, 8
; Line 1790
	jmp	$L1660
$L1659:
; Line 1793
	mov	eax, DWORD PTR _rtl$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1661
	mov	eax, DWORD PTR _rtl$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1661
	mov	eax, DWORD PTR _rtl$[ebp]
	mov	ecx, DWORD PTR _frame_pointer_rtx
	cmp	DWORD PTR [eax+4], ecx
	je	$L1661
	mov	eax, DWORD PTR _rtl$[ebp]
	mov	ecx, DWORD PTR _arg_pointer_rtx
	cmp	DWORD PTR [eax+4], ecx
	je	$L1661
; Line 1795
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _rtl$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	0
	push	26					; 0000001aH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	call	_emit_insn_after
	add	esp, 8
; Line 1796
$L1661:
$L1660:
$L1658:
$L1656:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_use_variable_after ENDP
_TEXT	ENDS
PUBLIC	_expand_end_bindings
EXTRN	_warning_with_decl:NEAR
EXTRN	_obey_regdecls:DWORD
_DATA	SEGMENT
	ORG $+1
$SG1674	DB	'unused variable `%s''', 00H
	ORG $+3
$SG1685	DB	'label `%s'' used before containing binding contour', 00H
_DATA	ENDS
_TEXT	SEGMENT
_dont_jump_in$ = 16
_thisblock$ = -8
_decl$ = -4
_chain$1680 = -12
_rtl$1693 = -16
_initial_depth$1698 = -20
_this$1702 = -24
_vars$ = 8
_mark_ends$ = 12
_expand_end_bindings PROC NEAR
; Line 1812
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	push	ebx
	push	esi
	push	edi
; Line 1813
	mov	eax, DWORD PTR _block_stack
	mov	DWORD PTR _thisblock$[ebp], eax
; Line 1816
	cmp	DWORD PTR _warn_unused, 0
	je	$L1668
; Line 1817
	mov	eax, DWORD PTR _vars$[ebp]
	mov	DWORD PTR _decl$[ebp], eax
	jmp	$L1669
$L1670:
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _decl$[ebp], eax
$L1669:
	cmp	DWORD PTR _decl$[ebp], 0
	je	$L1671
; Line 1818
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 15					; 0000000fH
	test	al, 1
	jne	$L1672
	mov	eax, DWORD PTR _decl$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 43					; 0000002bH
	jne	$L1672
; Line 1819
	push	OFFSET $SG1674
	mov	eax, DWORD PTR _decl$[ebp]
	push	eax
	call	_warning_with_decl
	add	esp, 8
; Line 1823
$L1672:
	jmp	$L1670
$L1671:
$L1668:
	cmp	DWORD PTR _mark_ends$[ebp], 0
	je	$L1675
; Line 1824
	push	-3					; fffffffdH
	push	0
	call	_emit_note
	add	esp, 8
; Line 1825
	jmp	$L1676
$L1675:
; Line 1827
	mov	eax, DWORD PTR _thisblock$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR [eax+20], -1
$L1676:
; Line 1829
	mov	eax, DWORD PTR _thisblock$[ebp]
	cmp	DWORD PTR [eax+12], 0
	je	$L1677
; Line 1831
	call	_do_pending_stack_adjust
; Line 1832
	mov	eax, DWORD PTR _thisblock$[ebp]
	mov	eax, DWORD PTR [eax+12]
	push	eax
	call	_emit_label
	add	esp, 4
; Line 1835
$L1677:
; Line 1837
	cmp	DWORD PTR _dont_jump_in$[ebp], 0
	jne	$L1679
	mov	eax, DWORD PTR _thisblock$[ebp]
	cmp	DWORD PTR [eax+20], 0
	jne	$L1679
	mov	eax, DWORD PTR _thisblock$[ebp]
	cmp	DWORD PTR [eax+32], 0
	je	$L1678
$L1679:
; Line 1843
	mov	eax, DWORD PTR _thisblock$[ebp]
	mov	eax, DWORD PTR [eax+40]
	mov	DWORD PTR _chain$1680[ebp], eax
	jmp	$L1681
$L1682:
	mov	eax, DWORD PTR _chain$1680[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _chain$1680[ebp], eax
$L1681:
	cmp	DWORD PTR _chain$1680[ebp], 0
	je	$L1683
; Line 1845
	mov	eax, DWORD PTR _chain$1680[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+16]
	or	eax, 16					; 00000010H
	mov	ecx, DWORD PTR _chain$1680[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	mov	DWORD PTR [ecx+16], eax
; Line 1849
	mov	eax, DWORD PTR _chain$1680[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 9
	test	al, 1
	je	$L1684
; Line 1851
	push	OFFSET $SG1685
	mov	eax, DWORD PTR _chain$1680[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_error_with_decl
	add	esp, 8
; Line 1852
$L1684:
	jmp	$L1682
$L1683:
; Line 1858
$L1678:
; Line 1859
	mov	eax, DWORD PTR _thisblock$[ebp]
	cmp	DWORD PTR [eax+20], 0
	jne	$L1687
	mov	eax, DWORD PTR _thisblock$[ebp]
	cmp	DWORD PTR [eax+32], 0
	je	$L1686
$L1687:
; Line 1863
	push	0
	mov	eax, DWORD PTR _thisblock$[ebp]
	mov	eax, DWORD PTR [eax+32]
	push	eax
	call	_expand_cleanups
	add	esp, 8
; Line 1867
	mov	eax, DWORD PTR _thisblock$[ebp]
	cmp	DWORD PTR [eax+20], 0
	je	$L1688
; Line 1869
	call	_do_pending_stack_adjust
; Line 1871
	mov	eax, DWORD PTR _thisblock$[ebp]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	mov	eax, DWORD PTR _stack_pointer_rtx
	push	eax
	call	_emit_move_insn
	add	esp, 8
; Line 1876
$L1688:
; Line 1880
	mov	eax, DWORD PTR _dont_jump_in$[ebp]
	push	eax
	mov	eax, DWORD PTR _thisblock$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	mov	eax, DWORD PTR _thisblock$[ebp]
	mov	eax, DWORD PTR [eax+32]
	push	eax
	mov	eax, DWORD PTR _thisblock$[ebp]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	mov	eax, DWORD PTR _thisblock$[ebp]
	push	eax
	call	_fixup_gotos
	add	esp, 20					; 00000014H
; Line 1886
$L1686:
	cmp	DWORD PTR _obey_regdecls, 0
	je	$L1689
; Line 1887
	mov	eax, DWORD PTR _vars$[ebp]
	mov	DWORD PTR _decl$[ebp], eax
	jmp	$L1690
$L1691:
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _decl$[ebp], eax
$L1690:
	cmp	DWORD PTR _decl$[ebp], 0
	je	$L1692
; Line 1889
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	DWORD PTR _rtl$1693[ebp], eax
; Line 1890
	mov	eax, DWORD PTR _decl$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 43					; 0000002bH
	jne	$L1694
	cmp	DWORD PTR _rtl$1693[ebp], 0
	je	$L1694
; Line 1891
	mov	eax, DWORD PTR _rtl$1693[ebp]
	push	eax
	call	_use_variable
	add	esp, 4
; Line 1892
$L1694:
	jmp	$L1691
$L1692:
; Line 1896
$L1689:
	mov	eax, DWORD PTR _thisblock$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR _stack_block_stack, eax
; Line 1897
$L1695:
	mov	eax, DWORD PTR _nesting_stack
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _initial_depth$1698[ebp], eax
$L1699:
	mov	eax, DWORD PTR _block_stack
	mov	DWORD PTR _this$1702[ebp], eax
	mov	eax, DWORD PTR _this$1702[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _block_stack, eax
	mov	eax, DWORD PTR _this$1702[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _nesting_stack, eax
	mov	eax, DWORD PTR _this$1702[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _nesting_depth, eax
	mov	eax, DWORD PTR _this$1702[ebp]
	push	eax
	call	_free
	add	esp, 4
$L1700:
	mov	eax, DWORD PTR _initial_depth$1698[ebp]
	cmp	DWORD PTR _nesting_depth, eax
	jg	$L1699
$L1701:
$L1696:
$L1697:
; Line 1898
$L1665:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_expand_end_bindings ENDP
_TEXT	ENDS
PUBLIC	_assign_stack_local
PUBLIC	_expand_decl
EXTRN	_force_operand:NEAR
EXTRN	_flag_float_store:DWORD
EXTRN	_frame_pointer_needed:DWORD
EXTRN	_anti_adjust_stack:NEAR
EXTRN	_round_push:NEAR
EXTRN	_convert_units:NEAR
EXTRN	_temp_tree_cons:NEAR
EXTRN	_mark_reg_pointer:NEAR
_TEXT	SEGMENT
_oldaddr$1728 = -16
_addr$1729 = -12
_address$1735 = -20
_size$1736 = -24
_decl$ = 8
_cleanup$ = 12
_thisblock$ = -4
_type$ = -8
_expand_decl PROC NEAR
; Line 1922
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	push	ebx
	push	esi
	push	edi
; Line 1923
	mov	eax, DWORD PTR _block_stack
	mov	DWORD PTR _thisblock$[ebp], eax
; Line 1928
	cmp	DWORD PTR _cleanup$[ebp], 0
	je	$L1709
; Line 1931
	mov	eax, DWORD PTR _thisblock$[ebp]
	mov	eax, DWORD PTR [eax+32]
	push	eax
	mov	eax, DWORD PTR _cleanup$[ebp]
	push	eax
	mov	eax, DWORD PTR _decl$[ebp]
	push	eax
	call	_temp_tree_cons
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _thisblock$[ebp]
	mov	DWORD PTR [ecx+32], eax
; Line 1933
	mov	eax, DWORD PTR _thisblock$[ebp]
	mov	DWORD PTR _stack_block_stack, eax
; Line 1936
$L1709:
	cmp	DWORD PTR _decl$[ebp], 0
	jne	$L1710
; Line 1939
	cmp	DWORD PTR _cleanup$[ebp], 0
	jne	$L1711
; Line 1940
	call	_abort
; Line 1941
$L1711:
	jmp	$L1706
; Line 1944
$L1710:
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _type$[ebp], eax
; Line 1952
	mov	eax, DWORD PTR _decl$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 43					; 0000002bH
	je	$L1712
; Line 1953
	jmp	$L1706
; Line 1954
$L1712:
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 2
	test	al, 1
	jne	$L1714
	mov	eax, DWORD PTR _decl$[ebp]
	test	BYTE PTR [eax+16], 1
	je	$L1713
$L1714:
; Line 1955
	jmp	$L1706
; Line 1959
$L1713:
	mov	eax, DWORD PTR _error_mark_node
	cmp	DWORD PTR _type$[ebp], eax
	jne	$L1715
; Line 1960
	mov	eax, DWORD PTR _const0_rtx
	push	eax
	push	26					; 0000001aH
	push	37					; 00000025H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _decl$[ebp]
	mov	DWORD PTR [ecx+76], eax
; Line 1961
	jmp	$L1716
$L1715:
	mov	eax, DWORD PTR _decl$[ebp]
	cmp	DWORD PTR [eax+28], 0
	jne	$L1717
; Line 1964
	mov	eax, DWORD PTR _decl$[ebp]
	cmp	DWORD PTR [eax+64], 0
	jne	$L1718
; Line 1966
	push	0
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	sar	eax, 24					; 00000018H
	push	eax
	call	_assign_stack_local
	add	esp, 8
	mov	ecx, DWORD PTR _decl$[ebp]
	mov	DWORD PTR [ecx+76], eax
; Line 1967
	jmp	$L1719
$L1718:
; Line 1970
	push	4
	call	_gen_reg_rtx
	add	esp, 4
	push	eax
	push	26					; 0000001aH
	push	37					; 00000025H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _decl$[ebp]
	mov	DWORD PTR [ecx+76], eax
$L1719:
; Line 1972
	jmp	$L1720
$L1717:
; Line 1979
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	and	eax, -16777216				; ff000000H
	mov	ecx, 436207616				; 1a000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L1721
	cmp	DWORD PTR _flag_float_store, 0
	je	$L1722
	mov	eax, DWORD PTR _type$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 6
	je	$L1721
$L1722:
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 3
	test	al, 1
	jne	$L1721
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 9
	test	al, 1
	jne	$L1721
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 10					; 0000000aH
	test	al, 1
	jne	$L1723
	cmp	DWORD PTR _obey_regdecls, 0
	jne	$L1721
$L1723:
; Line 1982
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	sar	eax, 24					; 00000018H
	push	eax
	call	_gen_reg_rtx
	add	esp, 4
	mov	ecx, DWORD PTR _decl$[ebp]
	mov	DWORD PTR [ecx+76], eax
; Line 1983
	mov	eax, DWORD PTR _type$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 11					; 0000000bH
	jne	$L1724
; Line 1984
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	push	eax
	call	_mark_reg_pointer
	add	esp, 4
; Line 1985
$L1724:
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax]
	or	eax, 134217728				; 08000000H
	mov	ecx, DWORD PTR _decl$[ebp]
	mov	ecx, DWORD PTR [ecx+76]
	mov	DWORD PTR [ecx], eax
; Line 1987
	jmp	$L1726
$L1721:
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 6
	test	al, 1
	je	$L1727
; Line 1989
	mov	DWORD PTR _oldaddr$1728[ebp], 0
; Line 1996
	mov	eax, DWORD PTR _decl$[ebp]
	cmp	DWORD PTR [eax+76], 0
	je	$L1730
; Line 1999
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1732
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1731
$L1732:
; Line 2000
	call	_abort
; Line 2001
$L1731:
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _oldaddr$1728[ebp], eax
; Line 2005
$L1730:
; Line 2010
	mov	eax, DWORD PTR _decl$[ebp]
	mov	al, BYTE PTR [eax+36]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _decl$[ebp]
	mov	ecx, DWORD PTR [ecx+28]
	imul	eax, DWORD PTR [ecx+20]
	add	eax, 7
	cdq
	and	edx, 7
	add	eax, edx
	sar	eax, 3
	push	eax
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	sar	eax, 24					; 00000018H
	push	eax
	call	_assign_stack_local
	add	esp, 8
	mov	ecx, DWORD PTR _decl$[ebp]
	mov	DWORD PTR [ecx+76], eax
; Line 2011
	cmp	DWORD PTR _oldaddr$1728[ebp], 0
	je	$L1733
; Line 2013
	mov	eax, DWORD PTR _oldaddr$1728[ebp]
	push	eax
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_force_operand
	add	esp, 8
	mov	DWORD PTR _addr$1729[ebp], eax
; Line 2014
	mov	eax, DWORD PTR _addr$1729[ebp]
	push	eax
	mov	eax, DWORD PTR _oldaddr$1728[ebp]
	push	eax
	call	_emit_move_insn
	add	esp, 8
; Line 2019
$L1733:
; Line 2022
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 16					; 00000010H
	je	$L2538
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 19					; 00000013H
	je	$L2538
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 20					; 00000014H
	jne	$L2536
$L2538:
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax]
	or	eax, 268435456				; 10000000H
	mov	ecx, DWORD PTR _decl$[ebp]
	mov	ecx, DWORD PTR [ecx+76]
	mov	DWORD PTR [ecx], eax
	jmp	$L2537
$L2536:
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	and	DWORD PTR [eax], -268435457		; efffffffH
$L2537:
; Line 2031
	jmp	$L1734
$L1727:
; Line 2036
	mov	DWORD PTR _frame_pointer_needed, 1
; Line 2040
	mov	eax, DWORD PTR _thisblock$[ebp]
	cmp	DWORD PTR [eax+20], 0
	jne	$L1737
; Line 2042
	call	_do_pending_stack_adjust
; Line 2044
	mov	eax, DWORD PTR _stack_pointer_rtx
	push	eax
	call	_copy_to_reg
	add	esp, 4
	mov	ecx, DWORD PTR _thisblock$[ebp]
	mov	DWORD PTR [ecx+20], eax
; Line 2045
	mov	eax, DWORD PTR _thisblock$[ebp]
	mov	DWORD PTR _stack_block_stack, eax
; Line 2049
$L1737:
; Line 2052
	push	0
	push	0
	push	0
	push	8
	mov	eax, DWORD PTR _decl$[ebp]
	mov	al, BYTE PTR [eax+36]
	and	eax, 255				; 000000ffH
	push	eax
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	call	_convert_units
	add	esp, 12					; 0000000cH
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	mov	DWORD PTR _size$1736[ebp], eax
; Line 2057
	mov	eax, DWORD PTR _decl$[ebp]
	mov	al, BYTE PTR [eax+36]
	and	eax, 255				; 000000ffH
	cdq
	xor	eax, edx
	sub	eax, edx
	and	eax, 31					; 0000001fH
	xor	eax, edx
	sub	eax, edx
	je	$L1738
; Line 2066
	mov	eax, DWORD PTR _size$1736[ebp]
	push	eax
	call	_round_push
	add	esp, 4
	mov	DWORD PTR _size$1736[ebp], eax
; Line 2072
$L1738:
	mov	eax, DWORD PTR _size$1736[ebp]
	push	eax
	call	_anti_adjust_stack
	add	esp, 4
; Line 2074
	mov	eax, DWORD PTR _stack_pointer_rtx
	push	eax
	call	_copy_to_reg
	add	esp, 4
	mov	DWORD PTR _address$1735[ebp], eax
; Line 2107
	mov	eax, DWORD PTR _address$1735[ebp]
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
; Line 2108
$L1734:
$L1726:
$L1720:
$L1716:
; Line 2110
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 3
	test	al, 1
	je	$L1739
; Line 2111
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax]
	or	eax, 134217728				; 08000000H
	mov	ecx, DWORD PTR _decl$[ebp]
	mov	ecx, DWORD PTR [ecx+76]
	mov	DWORD PTR [ecx], eax
; Line 2112
$L1739:
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 5
	test	al, 1
	je	$L1740
; Line 2113
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax]
	or	eax, 67108864				; 04000000H
	mov	ecx, DWORD PTR _decl$[ebp]
	mov	ecx, DWORD PTR [ecx+76]
	mov	DWORD PTR [ecx], eax
; Line 2118
$L1740:
	cmp	DWORD PTR _obey_regdecls, 0
	je	$L1741
; Line 2119
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	push	eax
	call	_use_variable
	add	esp, 4
; Line 2120
$L1741:
$L1706:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_expand_decl ENDP
_TEXT	ENDS
PUBLIC	_expand_decl_init
EXTRN	_integer_zero_node:DWORD
EXTRN	_expand_assignment:NEAR
EXTRN	_convert:NEAR
EXTRN	_emit_line_note:NEAR
_TEXT	SEGMENT
_decl$ = 8
_code$1747 = -4
_expand_decl_init PROC NEAR
; Line 2127
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 2128
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 2
	test	al, 1
	je	$L1745
; Line 2129
	jmp	$L1744
; Line 2133
$L1745:
	mov	eax, DWORD PTR _decl$[ebp]
	mov	ecx, DWORD PTR _error_mark_node
	cmp	DWORD PTR [eax+64], ecx
	jne	$L1746
; Line 2135
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _code$1747[ebp], eax
; Line 2137
	cmp	DWORD PTR _code$1747[ebp], 5
	je	$L1749
	cmp	DWORD PTR _code$1747[ebp], 6
	je	$L1749
	cmp	DWORD PTR _code$1747[ebp], 8
	je	$L1749
	cmp	DWORD PTR _code$1747[ebp], 11		; 0000000bH
	jne	$L1748
$L1749:
; Line 2139
	push	0
	push	0
	mov	eax, DWORD PTR _integer_zero_node
	push	eax
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_convert
	add	esp, 8
	push	eax
	mov	eax, DWORD PTR _decl$[ebp]
	push	eax
	call	_expand_assignment
	add	esp, 16					; 00000010H
; Line 2140
$L1748:
	call	_emit_queue
; Line 2142
	jmp	$L1751
$L1746:
	mov	eax, DWORD PTR _decl$[ebp]
	cmp	DWORD PTR [eax+64], 0
	je	$L1752
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+64]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 3
	je	$L1752
; Line 2144
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	call	_emit_line_note
	add	esp, 8
; Line 2145
	push	0
	push	0
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+64]
	push	eax
	mov	eax, DWORD PTR _decl$[ebp]
	push	eax
	call	_expand_assignment
	add	esp, 16					; 00000010H
; Line 2146
	call	_emit_queue
; Line 2148
$L1752:
$L1751:
$L1744:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_expand_decl_init ENDP
_TEXT	ENDS
PUBLIC	_expand_anon_union_decl
_TEXT	SEGMENT
_decl$ = 8
_cleanup$ = 12
_decl_elts$ = 16
_thisblock$ = -4
_x$ = -8
_decl_elt$1763 = -16
_cleanup_elt$1764 = -12
_expand_anon_union_decl PROC NEAR
; Line 2157
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 2158
	mov	eax, DWORD PTR _block_stack
	mov	DWORD PTR _thisblock$[ebp], eax
; Line 2161
	mov	eax, DWORD PTR _cleanup$[ebp]
	push	eax
	mov	eax, DWORD PTR _decl$[ebp]
	push	eax
	call	_expand_decl
	add	esp, 8
; Line 2162
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	DWORD PTR _x$[ebp], eax
; Line 2164
$L1761:
	cmp	DWORD PTR _decl_elts$[ebp], 0
	je	$L1762
; Line 2166
	mov	eax, DWORD PTR _decl_elts$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _decl_elt$1763[ebp], eax
; Line 2167
	mov	eax, DWORD PTR _decl_elts$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _cleanup_elt$1764[ebp], eax
; Line 2176
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 436207616				; 1a000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L2539
	push	0
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	mov	eax, DWORD PTR _decl_elt$1763[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	sar	eax, 24					; 00000018H
	push	eax
	push	35					; 00000023H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	ecx, DWORD PTR _decl_elt$1763[ebp]
	mov	DWORD PTR [ecx+76], eax
	jmp	$L2540
$L2539:
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR _decl_elt$1763[ebp]
	mov	DWORD PTR [ecx+76], eax
$L2540:
; Line 2180
	cmp	DWORD PTR _cleanup$[ebp], 0
	je	$L1765
; Line 2183
	mov	eax, DWORD PTR _thisblock$[ebp]
	mov	eax, DWORD PTR [eax+32]
	push	eax
	mov	eax, DWORD PTR _cleanup_elt$1764[ebp]
	push	eax
	mov	eax, DWORD PTR _decl_elt$1763[ebp]
	push	eax
	call	_temp_tree_cons
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _thisblock$[ebp]
	mov	DWORD PTR [ecx+32], eax
; Line 2185
$L1765:
	mov	eax, DWORD PTR _decl_elts$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _decl_elts$[ebp], eax
; Line 2186
	jmp	$L1761
$L1762:
; Line 2187
$L1757:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_expand_anon_union_decl ENDP
_list$ = 8
_dont_do$ = 12
_tail$ = -4
_expand_cleanups PROC NEAR
; Line 2201
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 2203
	mov	eax, DWORD PTR _list$[ebp]
	mov	DWORD PTR _tail$[ebp], eax
	jmp	$L1770
$L1771:
	mov	eax, DWORD PTR _tail$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _tail$[ebp], eax
$L1770:
	cmp	DWORD PTR _tail$[ebp], 0
	je	$L1772
; Line 2204
	cmp	DWORD PTR _dont_do$[ebp], 0
	je	$L1774
	mov	eax, DWORD PTR _tail$[ebp]
	mov	ecx, DWORD PTR _dont_do$[ebp]
	cmp	DWORD PTR [eax+20], ecx
	je	$L1773
$L1774:
; Line 2206
	mov	eax, DWORD PTR _tail$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 3
	jne	$L1775
; Line 2207
	mov	eax, DWORD PTR _dont_do$[ebp]
	push	eax
	mov	eax, DWORD PTR _tail$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_expand_cleanups
	add	esp, 8
; Line 2208
	jmp	$L1776
$L1775:
; Line 2209
	push	0
	push	0
	mov	eax, DWORD PTR _const0_rtx
	push	eax
	mov	eax, DWORD PTR _tail$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
$L1776:
; Line 2211
$L1773:
	jmp	$L1771
$L1772:
$L1768:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_expand_cleanups ENDP
_list$ = 8
_before_jump$ = 12
_beyond_jump$ = -4
_new_before_jump$ = -8
_fixup_cleanups PROC NEAR
; Line 2221
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 2222
	call	_get_last_insn
	mov	DWORD PTR _beyond_jump$[ebp], eax
; Line 2225
	push	0
	mov	eax, DWORD PTR _list$[ebp]
	push	eax
	call	_expand_cleanups
	add	esp, 8
; Line 2226
	call	_get_last_insn
	mov	DWORD PTR _new_before_jump$[ebp], eax
; Line 2228
	mov	eax, DWORD PTR _before_jump$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	mov	eax, DWORD PTR _new_before_jump$[ebp]
	push	eax
	mov	eax, DWORD PTR _beyond_jump$[ebp]
	mov	eax, DWORD PTR [eax+12]
	push	eax
	call	_reorder_insns
	add	esp, 12					; 0000000cH
; Line 2229
	mov	eax, DWORD PTR _new_before_jump$[ebp]
	mov	ecx, DWORD PTR _before_jump$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 2230
$L1779:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_fixup_cleanups ENDP
_TEXT	ENDS
PUBLIC	_move_cleanups_up
EXTRN	_chainon:NEAR
_TEXT	SEGMENT
_block$ = -4
_outer$ = -8
_move_cleanups_up PROC NEAR
; Line 2240
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 2241
	mov	eax, DWORD PTR _block_stack
	mov	DWORD PTR _block$[ebp], eax
; Line 2242
	mov	eax, DWORD PTR _block$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _outer$[ebp], eax
; Line 2246
	mov	eax, DWORD PTR _outer$[ebp]
	mov	eax, DWORD PTR [eax+32]
	push	eax
	mov	eax, DWORD PTR _block$[ebp]
	mov	eax, DWORD PTR [eax+32]
	push	eax
	call	_chainon
	add	esp, 8
	mov	ecx, DWORD PTR _outer$[ebp]
	mov	DWORD PTR [ecx+32], eax
; Line 2247
	mov	eax, DWORD PTR _block$[ebp]
	mov	DWORD PTR [eax+32], 0
; Line 2248
$L1783:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_move_cleanups_up ENDP
_TEXT	ENDS
PUBLIC	_this_contour_has_cleanups_p
_TEXT	SEGMENT
_this_contour_has_cleanups_p PROC NEAR
; Line 2252
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 2253
	cmp	DWORD PTR _block_stack, 0
	je	$L2541
	mov	eax, DWORD PTR _block_stack
	cmp	DWORD PTR [eax+32], 0
	je	$L2541
	mov	eax, 1
	jmp	$L2542
$L2541:
	sub	eax, eax
$L2542:
	jmp	$L1787
; Line 2254
$L1787:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_this_contour_has_cleanups_p ENDP
_TEXT	ENDS
PUBLIC	_expand_start_case
_TEXT	SEGMENT
_thiscase$ = -4
_exit_flag$ = 8
_expr$ = 12
_type$ = 16
_expand_start_case PROC NEAR
; Line 2273
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 2275
	push	44					; 0000002cH
	call	_xmalloc
	add	esp, 4
	mov	DWORD PTR _thiscase$[ebp], eax
; Line 2279
	mov	eax, DWORD PTR _case_stack
	mov	ecx, DWORD PTR _thiscase$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 2280
	mov	eax, DWORD PTR _nesting_stack
	mov	ecx, DWORD PTR _thiscase$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 2281
	inc	DWORD PTR _nesting_depth
	mov	eax, DWORD PTR _nesting_depth
	mov	ecx, DWORD PTR _thiscase$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 2282
	cmp	DWORD PTR _exit_flag$[ebp], 0
	je	$L2543
	call	_gen_label_rtx
	mov	ecx, DWORD PTR _thiscase$[ebp]
	mov	DWORD PTR [ecx+12], eax
	jmp	$L2544
$L2543:
	mov	eax, DWORD PTR _thiscase$[ebp]
	mov	DWORD PTR [eax+12], 0
$L2544:
; Line 2283
	mov	eax, DWORD PTR _thiscase$[ebp]
	mov	DWORD PTR [eax+20], 0
; Line 2284
	mov	eax, DWORD PTR _expr$[ebp]
	mov	ecx, DWORD PTR _thiscase$[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 2285
	mov	eax, DWORD PTR _type$[ebp]
	mov	ecx, DWORD PTR _thiscase$[ebp]
	mov	DWORD PTR [ecx+32], eax
; Line 2286
	mov	eax, DWORD PTR _thiscase$[ebp]
	mov	DWORD PTR [eax+24], 0
; Line 2287
	mov	eax, DWORD PTR _thiscase$[ebp]
	mov	WORD PTR [eax+36], 0
; Line 2288
	mov	eax, DWORD PTR _thiscase$[ebp]
	mov	DWORD PTR _case_stack, eax
; Line 2289
	mov	eax, DWORD PTR _thiscase$[ebp]
	mov	DWORD PTR _nesting_stack, eax
; Line 2291
	call	_do_pending_stack_adjust
; Line 2295
	push	-1
	push	0
	call	_emit_note
	add	esp, 8
; Line 2297
	call	_get_last_insn
	mov	ecx, DWORD PTR _thiscase$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 2298
$L1791:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_expand_start_case ENDP
_TEXT	ENDS
PUBLIC	_expand_start_case_dummy
_TEXT	SEGMENT
_thiscase$ = -4
_expand_start_case_dummy PROC NEAR
; Line 2307
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 2309
	push	44					; 0000002cH
	call	_xmalloc
	add	esp, 4
	mov	DWORD PTR _thiscase$[ebp], eax
; Line 2313
	mov	eax, DWORD PTR _case_stack
	mov	ecx, DWORD PTR _thiscase$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 2314
	mov	eax, DWORD PTR _nesting_stack
	mov	ecx, DWORD PTR _thiscase$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 2315
	inc	DWORD PTR _nesting_depth
	mov	eax, DWORD PTR _nesting_depth
	mov	ecx, DWORD PTR _thiscase$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 2316
	mov	eax, DWORD PTR _thiscase$[ebp]
	mov	DWORD PTR [eax+12], 0
; Line 2317
	mov	eax, DWORD PTR _thiscase$[ebp]
	mov	DWORD PTR [eax+20], 0
; Line 2318
	mov	eax, DWORD PTR _thiscase$[ebp]
	mov	DWORD PTR [eax+16], 0
; Line 2319
	mov	eax, DWORD PTR _thiscase$[ebp]
	mov	DWORD PTR [eax+32], 0
; Line 2320
	mov	eax, DWORD PTR _thiscase$[ebp]
	mov	DWORD PTR [eax+24], 0
; Line 2321
	mov	eax, DWORD PTR _thiscase$[ebp]
	mov	WORD PTR [eax+36], 0
; Line 2322
	mov	eax, DWORD PTR _thiscase$[ebp]
	mov	DWORD PTR _case_stack, eax
; Line 2323
	mov	eax, DWORD PTR _thiscase$[ebp]
	mov	DWORD PTR _nesting_stack, eax
; Line 2324
$L1794:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_expand_start_case_dummy ENDP
_TEXT	ENDS
PUBLIC	_expand_end_case_dummy
_TEXT	SEGMENT
_initial_depth$1801 = -4
_this$1805 = -8
_expand_end_case_dummy PROC NEAR
; Line 2330
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 2331
$L1798:
	mov	eax, DWORD PTR _nesting_stack
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _initial_depth$1801[ebp], eax
$L1802:
	mov	eax, DWORD PTR _case_stack
	mov	DWORD PTR _this$1805[ebp], eax
	mov	eax, DWORD PTR _this$1805[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _case_stack, eax
	mov	eax, DWORD PTR _this$1805[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _nesting_stack, eax
	mov	eax, DWORD PTR _this$1805[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _nesting_depth, eax
	mov	eax, DWORD PTR _this$1805[ebp]
	push	eax
	call	_free
	add	esp, 4
$L1803:
	mov	eax, DWORD PTR _initial_depth$1801[ebp]
	cmp	DWORD PTR _nesting_depth, eax
	jg	$L1802
$L1804:
$L1799:
$L1800:
; Line 2332
$L1797:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_expand_end_case_dummy ENDP
_TEXT	ENDS
PUBLIC	_pushcase
EXTRN	_copy_node:NEAR
EXTRN	_int_fits_type_p:NEAR
EXTRN	_tree_int_cst_lt:NEAR
_TEXT	SEGMENT
_value$ = 8
_label$ = 12
_l$ = -16
_n$ = -12
_index_type$ = -8
_nominal_type$ = -4
_pushcase PROC NEAR
; Line 2350
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 2357
	cmp	DWORD PTR _case_stack, 0
	je	$L1814
	mov	eax, DWORD PTR _case_stack
	cmp	DWORD PTR [eax+16], 0
	jne	$L1813
$L1814:
; Line 2358
	mov	eax, 1
	jmp	$L1808
; Line 2360
$L1813:
	mov	eax, DWORD PTR _case_stack
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _index_type$[ebp], eax
; Line 2361
	mov	eax, DWORD PTR _case_stack
	mov	eax, DWORD PTR [eax+32]
	mov	DWORD PTR _nominal_type$[ebp], eax
; Line 2364
	mov	eax, DWORD PTR _error_mark_node
	cmp	DWORD PTR _index_type$[ebp], eax
	jne	$L1815
; Line 2365
	sub	eax, eax
	jmp	$L1808
; Line 2368
$L1815:
	cmp	DWORD PTR _value$[ebp], 0
	je	$L1816
; Line 2369
	mov	eax, DWORD PTR _value$[ebp]
	push	eax
	mov	eax, DWORD PTR _nominal_type$[ebp]
	push	eax
	call	_convert
	add	esp, 8
	mov	DWORD PTR _value$[ebp], eax
; Line 2373
$L1816:
	cmp	DWORD PTR _value$[ebp], 0
	je	$L1818
	mov	eax, DWORD PTR _index_type$[ebp]
	push	eax
	mov	eax, DWORD PTR _value$[ebp]
	push	eax
	call	_int_fits_type_p
	add	esp, 8
	or	eax, eax
	jne	$L1818
; Line 2374
	mov	eax, 3
	jmp	$L1808
; Line 2377
$L1818:
	cmp	DWORD PTR _value$[ebp], 0
	jne	$L1819
; Line 2379
	mov	eax, DWORD PTR _case_stack
	cmp	DWORD PTR [eax+24], 0
	je	$L1820
; Line 2380
	mov	eax, 2
	jmp	$L1808
; Line 2381
$L1820:
	mov	eax, DWORD PTR _label$[ebp]
	mov	ecx, DWORD PTR _case_stack
	mov	DWORD PTR [ecx+24], eax
; Line 2383
	jmp	$L1821
$L1819:
; Line 2391
	mov	eax, DWORD PTR _case_stack
	add	eax, 20					; 00000014H
	mov	DWORD PTR _l$[ebp], eax
	jmp	$L1823
$L1824:
	mov	eax, DWORD PTR _l$[ebp]
	mov	eax, DWORD PTR [eax]
	add	eax, 4
	mov	DWORD PTR _l$[ebp], eax
$L1823:
	mov	eax, DWORD PTR _l$[ebp]
	cmp	DWORD PTR [eax], 0
	je	$L1825
	mov	eax, DWORD PTR _value$[ebp]
	push	eax
	mov	eax, DWORD PTR _l$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_tree_int_cst_lt
	add	esp, 8
	or	eax, eax
	je	$L1825
; Line 2392
	jmp	$L1824
$L1825:
; Line 2393
	mov	eax, DWORD PTR _l$[ebp]
	cmp	DWORD PTR [eax], 0
	je	$L1826
; Line 2397
	mov	eax, DWORD PTR _l$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+12]
	push	eax
	mov	eax, DWORD PTR _value$[ebp]
	push	eax
	call	_tree_int_cst_lt
	add	esp, 8
	or	eax, eax
	jne	$L1827
; Line 2398
	mov	eax, 2
	jmp	$L1808
; Line 2399
$L1827:
; Line 2404
$L1826:
	push	28					; 0000001cH
	call	_oballoc
	add	esp, 4
	mov	DWORD PTR _n$[ebp], eax
; Line 2405
	mov	eax, DWORD PTR _n$[ebp]
	mov	DWORD PTR [eax], 0
; Line 2406
	mov	eax, DWORD PTR _l$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _n$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 2407
	mov	eax, DWORD PTR _value$[ebp]
	push	eax
	call	_copy_node
	add	esp, 4
	mov	ecx, DWORD PTR _n$[ebp]
	mov	DWORD PTR [ecx+12], eax
	mov	eax, DWORD PTR _n$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	ecx, DWORD PTR _n$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 2408
	mov	eax, DWORD PTR _label$[ebp]
	mov	ecx, DWORD PTR _n$[ebp]
	mov	DWORD PTR [ecx+24], eax
; Line 2409
	mov	eax, DWORD PTR _n$[ebp]
	mov	DWORD PTR [eax+20], 0
; Line 2410
	mov	eax, DWORD PTR _n$[ebp]
	mov	ecx, DWORD PTR _l$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 2411
$L1821:
; Line 2413
	mov	eax, DWORD PTR _label$[ebp]
	push	eax
	call	_expand_label
	add	esp, 4
; Line 2414
	sub	eax, eax
	jmp	$L1808
; Line 2415
$L1808:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_pushcase ENDP
_TEXT	ENDS
PUBLIC	_pushcase_range
EXTRN	_tree_int_cst_equal:NEAR
_TEXT	SEGMENT
_value1$ = 8
_value2$ = 12
_label$ = 16
_l$ = -16
_n$ = -12
_index_type$ = -8
_nominal_type$ = -4
_pushcase_range PROC NEAR
; Line 2430
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 2437
	cmp	DWORD PTR _case_stack, 0
	je	$L1837
	mov	eax, DWORD PTR _case_stack
	cmp	DWORD PTR [eax+16], 0
	jne	$L1836
$L1837:
; Line 2438
	mov	eax, 1
	jmp	$L1831
; Line 2440
$L1836:
	mov	eax, DWORD PTR _case_stack
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _index_type$[ebp], eax
; Line 2441
	mov	eax, DWORD PTR _case_stack
	mov	eax, DWORD PTR [eax+32]
	mov	DWORD PTR _nominal_type$[ebp], eax
; Line 2444
	mov	eax, DWORD PTR _index_type$[ebp]
	cmp	DWORD PTR _error_mark_node, eax
	jne	$L1838
; Line 2445
	sub	eax, eax
	jmp	$L1831
; Line 2448
$L1838:
	cmp	DWORD PTR _value1$[ebp], 0
	je	$L1839
; Line 2449
	mov	eax, DWORD PTR _value1$[ebp]
	push	eax
	mov	eax, DWORD PTR _nominal_type$[ebp]
	push	eax
	call	_convert
	add	esp, 8
	mov	DWORD PTR _value1$[ebp], eax
; Line 2450
$L1839:
	cmp	DWORD PTR _value2$[ebp], 0
	je	$L1840
; Line 2451
	mov	eax, DWORD PTR _value2$[ebp]
	push	eax
	mov	eax, DWORD PTR _nominal_type$[ebp]
	push	eax
	call	_convert
	add	esp, 8
	mov	DWORD PTR _value2$[ebp], eax
; Line 2454
$L1840:
	cmp	DWORD PTR _value1$[ebp], 0
	je	$L1841
	mov	eax, DWORD PTR _index_type$[ebp]
	push	eax
	mov	eax, DWORD PTR _value1$[ebp]
	push	eax
	call	_int_fits_type_p
	add	esp, 8
	or	eax, eax
	jne	$L1841
; Line 2455
	mov	eax, 3
	jmp	$L1831
; Line 2457
$L1841:
	cmp	DWORD PTR _value2$[ebp], 0
	je	$L1842
	mov	eax, DWORD PTR _index_type$[ebp]
	push	eax
	mov	eax, DWORD PTR _value2$[ebp]
	push	eax
	call	_int_fits_type_p
	add	esp, 8
	or	eax, eax
	jne	$L1842
; Line 2458
	mov	eax, 3
	jmp	$L1831
; Line 2461
$L1842:
	mov	eax, DWORD PTR _value1$[ebp]
	push	eax
	mov	eax, DWORD PTR _value2$[ebp]
	push	eax
	call	_tree_int_cst_lt
	add	esp, 8
	or	eax, eax
	je	$L1843
; Line 2462
	mov	eax, 4
	jmp	$L1831
; Line 2465
$L1843:
	mov	eax, DWORD PTR _value2$[ebp]
	push	eax
	mov	eax, DWORD PTR _value1$[ebp]
	push	eax
	call	_tree_int_cst_equal
	add	esp, 8
	or	eax, eax
	je	$L1845
; Line 2466
	mov	eax, DWORD PTR _label$[ebp]
	push	eax
	mov	eax, DWORD PTR _value1$[ebp]
	push	eax
	call	_pushcase
	add	esp, 8
	jmp	$L1831
; Line 2471
$L1845:
; Line 2474
	mov	eax, DWORD PTR _case_stack
	add	eax, 20					; 00000014H
	mov	DWORD PTR _l$[ebp], eax
	jmp	$L1846
$L1847:
	mov	eax, DWORD PTR _l$[ebp]
	mov	eax, DWORD PTR [eax]
	add	eax, 4
	mov	DWORD PTR _l$[ebp], eax
$L1846:
	mov	eax, DWORD PTR _l$[ebp]
	cmp	DWORD PTR [eax], 0
	je	$L1848
	mov	eax, DWORD PTR _value1$[ebp]
	push	eax
	mov	eax, DWORD PTR _l$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_tree_int_cst_lt
	add	esp, 8
	or	eax, eax
	je	$L1848
; Line 2475
	jmp	$L1847
$L1848:
; Line 2476
	mov	eax, DWORD PTR _l$[ebp]
	cmp	DWORD PTR [eax], 0
	je	$L1849
; Line 2480
	mov	eax, DWORD PTR _l$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+12]
	push	eax
	mov	eax, DWORD PTR _value2$[ebp]
	push	eax
	call	_tree_int_cst_lt
	add	esp, 8
	or	eax, eax
	jne	$L1850
; Line 2481
	mov	eax, 2
	jmp	$L1831
; Line 2482
$L1850:
; Line 2488
$L1849:
	push	28					; 0000001cH
	call	_oballoc
	add	esp, 4
	mov	DWORD PTR _n$[ebp], eax
; Line 2489
	mov	eax, DWORD PTR _n$[ebp]
	mov	DWORD PTR [eax], 0
; Line 2490
	mov	eax, DWORD PTR _l$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _n$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 2491
	mov	eax, DWORD PTR _value1$[ebp]
	push	eax
	call	_copy_node
	add	esp, 4
	mov	ecx, DWORD PTR _n$[ebp]
	mov	DWORD PTR [ecx+12], eax
; Line 2492
	mov	eax, DWORD PTR _value2$[ebp]
	push	eax
	call	_copy_node
	add	esp, 4
	mov	ecx, DWORD PTR _n$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 2493
	mov	eax, DWORD PTR _label$[ebp]
	mov	ecx, DWORD PTR _n$[ebp]
	mov	DWORD PTR [ecx+24], eax
; Line 2494
	mov	eax, DWORD PTR _n$[ebp]
	mov	DWORD PTR [eax+20], 0
; Line 2495
	mov	eax, DWORD PTR _n$[ebp]
	mov	ecx, DWORD PTR _l$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 2497
	mov	eax, DWORD PTR _label$[ebp]
	push	eax
	call	_expand_label
	add	esp, 4
; Line 2499
	mov	eax, DWORD PTR _case_stack
	inc	WORD PTR [eax+36]
; Line 2501
	sub	eax, eax
	jmp	$L1831
; Line 2502
$L1831:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_pushcase_range ENDP
_TEXT	ENDS
EXTRN	_warning:NEAR
_DATA	SEGMENT
	ORG $+2
$SG1865	DB	'enumerated value `%s'' not handled in switch', 00H
$SG1873	DB	'case value `%d'' not in enumerated type `%s''', 00H
_DATA	ENDS
_TEXT	SEGMENT
_type$ = 8
_n$ = -8
_chain$ = -4
_check_for_full_enumeration_handling PROC NEAR
; Line 2511
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 2521
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _chain$[ebp], eax
	jmp	$L1856
$L1857:
	mov	eax, DWORD PTR _chain$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _chain$[ebp], eax
$L1856:
	cmp	DWORD PTR _chain$[ebp], 0
	je	$L1858
; Line 2530
	mov	eax, DWORD PTR _case_stack
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _n$[ebp], eax
	jmp	$L1859
$L1860:
	mov	eax, DWORD PTR _n$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _n$[ebp], eax
$L1859:
	cmp	DWORD PTR _n$[ebp], 0
	je	$L1861
	mov	eax, DWORD PTR _chain$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	mov	eax, DWORD PTR _n$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_tree_int_cst_lt
	add	esp, 8
	or	eax, eax
	je	$L1861
; Line 2531
	jmp	$L1860
$L1861:
; Line 2533
	cmp	DWORD PTR _n$[ebp], 0
	je	$L1863
	mov	eax, DWORD PTR _chain$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	mov	eax, DWORD PTR _n$[ebp]
	mov	eax, DWORD PTR [eax+12]
	push	eax
	call	_tree_int_cst_equal
	add	esp, 8
	or	eax, eax
	jne	$L1862
$L1863:
; Line 2535
	mov	eax, DWORD PTR _chain$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	OFFSET $SG1865
	call	_warning
	add	esp, 8
; Line 2536
$L1862:
	jmp	$L1857
$L1858:
; Line 2543
	mov	eax, DWORD PTR _case_stack
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _n$[ebp], eax
	jmp	$L1866
$L1867:
	mov	eax, DWORD PTR _n$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _n$[ebp], eax
$L1866:
	cmp	DWORD PTR _n$[ebp], 0
	je	$L1868
; Line 2547
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _chain$[ebp], eax
	jmp	$L1869
$L1870:
	mov	eax, DWORD PTR _chain$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _chain$[ebp], eax
$L1869:
	cmp	DWORD PTR _chain$[ebp], 0
	je	$L1871
	mov	eax, DWORD PTR _chain$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	mov	eax, DWORD PTR _n$[ebp]
	mov	eax, DWORD PTR [eax+12]
	push	eax
	call	_tree_int_cst_equal
	add	esp, 8
	or	eax, eax
	jne	$L1871
; Line 2548
	jmp	$L1870
$L1871:
; Line 2550
	cmp	DWORD PTR _chain$[ebp], 0
	jne	$L1872
; Line 2555
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+56]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 1
	jne	$L2545
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+56]
	mov	DWORD PTR -12+[ebp], eax
	jmp	$L2546
$L2545:
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+56]
	mov	eax, DWORD PTR [eax+40]
	mov	DWORD PTR -12+[ebp], eax
$L2546:
	mov	eax, DWORD PTR -12+[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	mov	eax, DWORD PTR _n$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	push	OFFSET $SG1873
	call	_warning
	add	esp, 12					; 0000000cH
; Line 2556
$L1872:
	jmp	$L1867
$L1868:
; Line 2557
$L1853:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_check_for_full_enumeration_handling ENDP
_TEXT	ENDS
PUBLIC	_expand_end_case
EXTRN	_warn_switch:DWORD
EXTRN	_build_int_2:NEAR
EXTRN	_do_tablejump:NEAR
EXTRN	_memset:NEAR
EXTRN	_convert_to_mode:NEAR
EXTRN	_build:NEAR
EXTRN	_gen_rtvec_v:NEAR
EXTRN	_build_decl:NEAR
EXTRN	_combine:NEAR
EXTRN	_cmp_optab:DWORD
EXTRN	_mode_size:BYTE
EXTRN	_type_for_size:NEAR
_TEXT	SEGMENT
_i$1931 = -64
_orig_index$ = 8
_minval$ = -12
_maxval$ = -56
_range$ = -36
_initial_depth$1943 = -68
_default_label$ = -52
_n$ = -28
_count$ = -24
_index$ = -16
_this$1947 = -72
_table_label$ = -60
_ncases$ = -8
_labelvec$ = -48
_i$ = -32
_before_case$ = -40
_thiscase$ = -20
_index_expr$ = -4
_unsignedp$ = -44
_expand_end_case PROC NEAR
; Line 2566
	push	ebp
	mov	ebp, esp
	sub	esp, 80					; 00000050H
	push	ebx
	push	esi
	push	edi
; Line 2568
	mov	DWORD PTR _default_label$[ebp], 0
; Line 2572
	call	_gen_label_rtx
	mov	DWORD PTR _table_label$[ebp], eax
; Line 2577
	mov	eax, DWORD PTR _case_stack
	mov	DWORD PTR _thiscase$[ebp], eax
; Line 2578
	mov	eax, DWORD PTR _thiscase$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR _index_expr$[ebp], eax
; Line 2579
	mov	eax, DWORD PTR _index_expr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 12					; 0000000cH
	and	eax, 1
	mov	DWORD PTR _unsignedp$[ebp], eax
; Line 2581
	call	_do_pending_stack_adjust
; Line 2584
	mov	eax, DWORD PTR _index_expr$[ebp]
	mov	ecx, DWORD PTR _error_mark_node
	cmp	DWORD PTR [eax+8], ecx
	je	$L1891
; Line 2593
	mov	eax, DWORD PTR _thiscase$[ebp]
	cmp	DWORD PTR [eax+24], 0
	jne	$L1892
	mov	eax, DWORD PTR _orig_index$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 8
	jne	$L1892
	mov	eax, DWORD PTR _index_expr$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	je	$L1892
	cmp	DWORD PTR _warn_switch, 0
	je	$L1892
; Line 2594
	mov	eax, DWORD PTR _orig_index$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_check_for_full_enumeration_handling
	add	esp, 4
; Line 2598
$L1892:
	mov	eax, DWORD PTR _thiscase$[ebp]
	cmp	DWORD PTR [eax+24], 0
	jne	$L1893
; Line 2601
	push	0
	push	0
	push	40					; 00000028H
	call	_build_decl
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _thiscase$[ebp]
	mov	DWORD PTR [ecx+24], eax
; Line 2602
	mov	eax, DWORD PTR _thiscase$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_expand_label
	add	esp, 4
; Line 2604
$L1893:
	mov	eax, DWORD PTR _thiscase$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_label_rtx
	add	esp, 4
	mov	DWORD PTR _default_label$[ebp], eax
; Line 2606
	call	_get_last_insn
	mov	DWORD PTR _before_case$[ebp], eax
; Line 2609
	mov	eax, DWORD PTR _thiscase$[ebp]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	call	_group_case_nodes
	add	esp, 4
; Line 2614
	mov	DWORD PTR _count$[ebp], 0
; Line 2615
	mov	eax, DWORD PTR _thiscase$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _n$[ebp], eax
	jmp	$L1894
$L1895:
	mov	eax, DWORD PTR _n$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _n$[ebp], eax
$L1894:
	cmp	DWORD PTR _n$[ebp], 0
	je	$L1896
; Line 2618
	mov	eax, DWORD PTR _n$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	je	$L1897
; Line 2619
	call	_abort
; Line 2620
$L1897:
	mov	eax, DWORD PTR _n$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	je	$L1898
; Line 2621
	call	_abort
; Line 2623
$L1898:
	mov	eax, DWORD PTR _n$[ebp]
	mov	eax, DWORD PTR [eax+12]
	push	eax
	mov	eax, DWORD PTR _index_expr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_convert
	add	esp, 8
	mov	ecx, DWORD PTR _n$[ebp]
	mov	DWORD PTR [ecx+12], eax
; Line 2624
	mov	eax, DWORD PTR _n$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	mov	eax, DWORD PTR _index_expr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_convert
	add	esp, 8
	mov	ecx, DWORD PTR _n$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 2628
	mov	eax, DWORD PTR _count$[ebp]
	mov	DWORD PTR -76+[ebp], eax
	inc	DWORD PTR _count$[ebp]
	cmp	DWORD PTR -76+[ebp], 0
	jne	$L1899
; Line 2630
	mov	eax, DWORD PTR _n$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _minval$[ebp], eax
; Line 2631
	mov	eax, DWORD PTR _n$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _maxval$[ebp], eax
; Line 2633
	jmp	$L1900
$L1899:
; Line 2635
	mov	eax, DWORD PTR _n$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	ecx, DWORD PTR _minval$[ebp]
	mov	ecx, DWORD PTR [ecx+24]
	cmp	DWORD PTR [eax+24], ecx
	jl	$L1902
	mov	eax, DWORD PTR _n$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	ecx, DWORD PTR _minval$[ebp]
	mov	ecx, DWORD PTR [ecx+24]
	cmp	DWORD PTR [eax+24], ecx
	jne	$L1901
	mov	eax, DWORD PTR _n$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	ecx, DWORD PTR _minval$[ebp]
	mov	ecx, DWORD PTR [ecx+20]
	cmp	DWORD PTR [eax+20], ecx
	jae	$L1901
$L1902:
; Line 2636
	mov	eax, DWORD PTR _n$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _minval$[ebp], eax
; Line 2637
$L1901:
	mov	eax, DWORD PTR _n$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _maxval$[ebp]
	mov	ecx, DWORD PTR [ecx+24]
	cmp	DWORD PTR [eax+24], ecx
	jg	$L1904
	mov	eax, DWORD PTR _n$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _maxval$[ebp]
	mov	ecx, DWORD PTR [ecx+24]
	cmp	DWORD PTR [eax+24], ecx
	jne	$L1903
	mov	eax, DWORD PTR _n$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _maxval$[ebp]
	mov	ecx, DWORD PTR [ecx+20]
	cmp	DWORD PTR [eax+20], ecx
	jbe	$L1903
$L1904:
; Line 2638
	mov	eax, DWORD PTR _n$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _maxval$[ebp], eax
; Line 2639
$L1903:
$L1900:
; Line 2641
	mov	eax, DWORD PTR _n$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	mov	eax, DWORD PTR _n$[ebp]
	mov	eax, DWORD PTR [eax+12]
	push	eax
	call	_tree_int_cst_equal
	add	esp, 8
	or	eax, eax
	jne	$L1905
; Line 2642
	inc	DWORD PTR _count$[ebp]
; Line 2643
$L1905:
	jmp	$L1895
$L1896:
; Line 2646
	cmp	DWORD PTR _count$[ebp], 0
	je	$L1906
; Line 2647
	mov	eax, DWORD PTR _minval$[ebp]
	push	eax
	mov	eax, DWORD PTR _maxval$[ebp]
	push	eax
	push	65					; 00000041H
	call	_combine
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _range$[ebp], eax
; Line 2649
$L1906:
	cmp	DWORD PTR _count$[ebp], 0
	je	$L1908
	mov	eax, DWORD PTR _index_expr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	or	eax, eax
	jne	$L1907
$L1908:
; Line 2651
	push	0
	push	0
	mov	eax, DWORD PTR _const0_rtx
	push	eax
	mov	eax, DWORD PTR _index_expr$[ebp]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
; Line 2652
	call	_emit_queue
; Line 2653
	mov	eax, DWORD PTR _default_label$[ebp]
	push	eax
	call	_emit_jump
	add	esp, 4
; Line 2659
	jmp	$L1909
$L1907:
; Line 2669
	mov	eax, DWORD PTR _range$[ebp]
	cmp	DWORD PTR [eax+24], 0
	jne	$L1911
	cmp	DWORD PTR _count$[ebp], 5
	jl	$L1911
	mov	eax, DWORD PTR _range$[ebp]
	mov	ecx, DWORD PTR _count$[ebp]
	lea	ecx, DWORD PTR [ecx+ecx*4]
	add	ecx, ecx
	cmp	DWORD PTR [eax+20], ecx
	ja	$L1911
	mov	eax, DWORD PTR _index_expr$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L1910
$L1911:
; Line 2671
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _index_expr$[ebp]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	mov	DWORD PTR _index$[ebp], eax
; Line 2680
	mov	eax, DWORD PTR _index$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 16777216				; 01000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L1913
	mov	eax, DWORD PTR _index$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 33554432				; 02000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1912
$L1913:
	mov	eax, DWORD PTR _index$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 21					; 00000015H
	mov	ecx, DWORD PTR _cmp_optab
	cmp	DWORD PTR [eax+ecx+4], 142		; 0000008eH
	jne	$L1912
; Line 2681
	mov	eax, DWORD PTR _unsignedp$[ebp]
	push	eax
	mov	eax, DWORD PTR _index$[ebp]
	push	eax
	push	4
	call	_convert_to_mode
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _index$[ebp], eax
; Line 2683
$L1912:
	call	_emit_queue
; Line 2684
	call	_do_pending_stack_adjust
; Line 2686
	push	0
	mov	eax, DWORD PTR _index$[ebp]
	push	eax
	call	_protect_from_queue
	add	esp, 8
	mov	DWORD PTR _index$[ebp], eax
; Line 2687
	mov	eax, DWORD PTR _index$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1914
; Line 2688
	mov	eax, DWORD PTR _index$[ebp]
	push	eax
	call	_copy_to_reg
	add	esp, 4
	mov	DWORD PTR _index$[ebp], eax
; Line 2689
$L1914:
; Line 2690
	mov	eax, DWORD PTR _index$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1916
	mov	eax, DWORD PTR _index_expr$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L1915
$L1916:
; Line 2694
	mov	eax, DWORD PTR _index_expr$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	je	$L1917
; Line 2698
	cmp	DWORD PTR _unsignedp$[ebp], 0
	jne	$L2547
	mov	eax, DWORD PTR _index$[ebp]
	cmp	DWORD PTR [eax+4], 0
	jl	$L2547
	mov	DWORD PTR -80+[ebp], 0
	jmp	$L2548
$L2547:
	mov	DWORD PTR -80+[ebp], -1
$L2548:
	mov	eax, DWORD PTR -80+[ebp]
	push	eax
	mov	eax, DWORD PTR _index$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_build_int_2
	add	esp, 8
	mov	DWORD PTR _index_expr$[ebp], eax
; Line 2699
	mov	eax, DWORD PTR _index_expr$[ebp]
	push	eax
	mov	eax, DWORD PTR _index_expr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_convert
	add	esp, 8
	mov	DWORD PTR _index_expr$[ebp], eax
; Line 2707
$L1917:
; Line 2709
	mov	eax, DWORD PTR _thiscase$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _n$[ebp], eax
	jmp	$L1918
$L1919:
	mov	eax, DWORD PTR _n$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _n$[ebp], eax
$L1918:
	cmp	DWORD PTR _n$[ebp], 0
	je	$L1920
; Line 2712
	mov	eax, DWORD PTR _n$[ebp]
	mov	eax, DWORD PTR [eax+12]
	push	eax
	mov	eax, DWORD PTR _index_expr$[ebp]
	push	eax
	call	_tree_int_cst_lt
	add	esp, 8
	or	eax, eax
	jne	$L1921
	mov	eax, DWORD PTR _index_expr$[ebp]
	push	eax
	mov	eax, DWORD PTR _n$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_tree_int_cst_lt
	add	esp, 8
	or	eax, eax
	jne	$L1921
; Line 2713
	jmp	$L1920
; Line 2714
$L1921:
	jmp	$L1919
$L1920:
; Line 2715
	cmp	DWORD PTR _n$[ebp], 0
	je	$L1922
; Line 2716
	mov	eax, DWORD PTR _n$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_label_rtx
	add	esp, 4
	push	eax
	call	_emit_jump
	add	esp, 4
; Line 2717
	jmp	$L1923
$L1922:
; Line 2718
	mov	eax, DWORD PTR _default_label$[ebp]
	push	eax
	call	_emit_jump
	add	esp, 4
$L1923:
; Line 2720
	jmp	$L1924
$L1915:
; Line 2735
	push	0
	mov	eax, DWORD PTR _thiscase$[ebp]
	add	eax, 20					; 00000014H
	push	eax
	call	_balance_case_nodes
	add	esp, 8
; Line 2737
	mov	eax, DWORD PTR _unsignedp$[ebp]
	push	eax
	mov	eax, DWORD PTR _default_label$[ebp]
	push	eax
	mov	eax, DWORD PTR _thiscase$[ebp]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	mov	eax, DWORD PTR _index$[ebp]
	push	eax
	call	_emit_case_nodes
	add	esp, 16					; 00000010H
; Line 2738
	mov	eax, DWORD PTR _default_label$[ebp]
	push	eax
	call	_emit_jump_if_reachable
	add	esp, 4
; Line 2739
$L1924:
; Line 2741
	jmp	$L1925
$L1910:
; Line 2766
	mov	eax, DWORD PTR _minval$[ebp]
	push	eax
	mov	eax, DWORD PTR _index_expr$[ebp]
	push	eax
	mov	eax, DWORD PTR _index_expr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	push	65					; 00000041H
	call	_build
	add	esp, 16					; 00000010H
	push	eax
	push	0
	mov	eax, DWORD PTR _mode_size+16
	shl	eax, 3
	push	eax
	call	_type_for_size
	add	esp, 8
	push	eax
	call	_convert
	add	esp, 8
	mov	DWORD PTR _index_expr$[ebp], eax
; Line 2767
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _index_expr$[ebp]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	mov	DWORD PTR _index$[ebp], eax
; Line 2768
	call	_emit_queue
; Line 2769
	push	0
	mov	eax, DWORD PTR _index$[ebp]
	push	eax
	call	_protect_from_queue
	add	esp, 8
	mov	DWORD PTR _index$[ebp], eax
; Line 2770
	call	_do_pending_stack_adjust
; Line 2774
	mov	eax, DWORD PTR _default_label$[ebp]
	push	eax
	mov	eax, DWORD PTR _table_label$[ebp]
	push	eax
	mov	eax, DWORD PTR _range$[ebp]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _index$[ebp]
	push	eax
	call	_do_tablejump
	add	esp, 16					; 00000010H
; Line 2782
	mov	eax, DWORD PTR _range$[ebp]
	mov	eax, DWORD PTR [eax+20]
	inc	eax
	mov	DWORD PTR _ncases$[ebp], eax
; Line 2783
	mov	eax, DWORD PTR _ncases$[ebp]
	shl	eax, 2
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _labelvec$[ebp], eax
; Line 2784
	mov	eax, DWORD PTR _ncases$[ebp]
	shl	eax, 2
	push	eax
	push	0
	mov	eax, DWORD PTR _labelvec$[ebp]
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 2786
	mov	eax, DWORD PTR _thiscase$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _n$[ebp], eax
	jmp	$L1928
$L1929:
	mov	eax, DWORD PTR _n$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _n$[ebp], eax
$L1928:
	cmp	DWORD PTR _n$[ebp], 0
	je	$L1930
; Line 2789
	mov	eax, DWORD PTR _n$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	eax, DWORD PTR [eax+20]
	mov	ecx, DWORD PTR _minval$[ebp]
	sub	eax, DWORD PTR [ecx+20]
	mov	DWORD PTR _i$1931[ebp], eax
; Line 2792
$L1933:
	mov	eax, DWORD PTR _minval$[ebp]
	mov	eax, DWORD PTR [eax+20]
	add	eax, DWORD PTR _i$1931[ebp]
	mov	ecx, DWORD PTR _n$[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	cmp	eax, DWORD PTR [ecx+20]
	jg	$L1934
; Line 2794
	mov	eax, DWORD PTR _n$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_label_rtx
	add	esp, 4
	push	eax
	push	4
	push	38					; 00000026H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _i$1931[ebp]
	mov	edx, DWORD PTR _labelvec$[ebp]
	mov	DWORD PTR [edx+ecx*4], eax
	inc	DWORD PTR _i$1931[ebp]
	jmp	$L1933
$L1934:
; Line 2795
	jmp	$L1929
$L1930:
; Line 2798
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L1935
$L1936:
	inc	DWORD PTR _i$[ebp]
$L1935:
	mov	eax, DWORD PTR _ncases$[ebp]
	cmp	DWORD PTR _i$[ebp], eax
	jge	$L1937
; Line 2799
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _labelvec$[ebp]
	cmp	DWORD PTR [ecx+eax*4], 0
	jne	$L1938
; Line 2800
	mov	eax, DWORD PTR _default_label$[ebp]
	push	eax
	push	4
	push	38					; 00000026H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _labelvec$[ebp]
	mov	DWORD PTR [edx+ecx*4], eax
; Line 2803
$L1938:
	jmp	$L1936
$L1937:
	mov	eax, DWORD PTR _table_label$[ebp]
	push	eax
	call	_emit_label
	add	esp, 4
; Line 2811
	mov	eax, DWORD PTR _labelvec$[ebp]
	push	eax
	mov	eax, DWORD PTR _ncases$[ebp]
	push	eax
	call	_gen_rtvec_v
	add	esp, 8
	push	eax
	push	4
	push	23					; 00000017H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	call	_emit_jump_insn
	add	esp, 4
; Line 2819
	call	_emit_barrier
; Line 2821
$L1925:
$L1909:
; Line 2824
	mov	eax, DWORD PTR _thiscase$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_get_last_insn
	push	eax
	mov	eax, DWORD PTR _before_case$[ebp]
	mov	eax, DWORD PTR [eax+12]
	push	eax
	call	_reorder_insns
	add	esp, 12					; 0000000cH
; Line 2826
$L1891:
	mov	eax, DWORD PTR _thiscase$[ebp]
	cmp	DWORD PTR [eax+12], 0
	je	$L1939
; Line 2827
	mov	eax, DWORD PTR _thiscase$[ebp]
	mov	eax, DWORD PTR [eax+12]
	push	eax
	call	_emit_label
	add	esp, 4
; Line 2829
$L1939:
$L1940:
	mov	eax, DWORD PTR _nesting_stack
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _initial_depth$1943[ebp], eax
$L1944:
	mov	eax, DWORD PTR _case_stack
	mov	DWORD PTR _this$1947[ebp], eax
	mov	eax, DWORD PTR _this$1947[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _case_stack, eax
	mov	eax, DWORD PTR _this$1947[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _nesting_stack, eax
	mov	eax, DWORD PTR _this$1947[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _nesting_depth, eax
	mov	eax, DWORD PTR _this$1947[ebp]
	push	eax
	call	_free
	add	esp, 4
$L1945:
	mov	eax, DWORD PTR _nesting_depth
	cmp	DWORD PTR _initial_depth$1943[ebp], eax
	jl	$L1944
$L1946:
$L1941:
$L1942:
; Line 2830
$L1875:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_expand_end_case ENDP
_TEXT	ENDS
EXTRN	_emit_cmp_insn:NEAR
EXTRN	_gen_beq:NEAR
_TEXT	SEGMENT
_op1$ = 8
_op2$ = 12
_label$ = 16
_unsignedp$ = 20
_do_jump_if_equal PROC NEAR
; Line 2838
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 2840
	mov	eax, DWORD PTR _op1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1953
	mov	eax, DWORD PTR _op2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1953
; Line 2842
	mov	eax, DWORD PTR _op2$[ebp]
	mov	ecx, DWORD PTR _op1$[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L1954
; Line 2843
	mov	eax, DWORD PTR _label$[ebp]
	push	eax
	call	_emit_jump
	add	esp, 4
; Line 2844
$L1954:
; Line 2845
	jmp	$L1955
$L1953:
; Line 2847
	push	0
	mov	eax, DWORD PTR _unsignedp$[ebp]
	push	eax
	push	0
	mov	eax, DWORD PTR _op2$[ebp]
	push	eax
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	call	_emit_cmp_insn
	add	esp, 20					; 00000014H
; Line 2848
	mov	eax, DWORD PTR _label$[ebp]
	push	eax
	call	_gen_beq
	add	esp, 4
	push	eax
	call	_emit_jump_insn
	add	esp, 4
; Line 2849
$L1955:
; Line 2850
$L1952:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_do_jump_if_equal ENDP
_TEXT	ENDS
EXTRN	_next_real_insn:NEAR
_TEXT	SEGMENT
_head$ = 8
_node$ = -4
_lb$1962 = -8
_np$1963 = -12
_group_case_nodes PROC NEAR
; Line 2860
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 2861
	mov	eax, DWORD PTR _head$[ebp]
	mov	DWORD PTR _node$[ebp], eax
; Line 2863
$L1960:
	cmp	DWORD PTR _node$[ebp], 0
	je	$L1961
; Line 2865
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_label_rtx
	add	esp, 4
	push	eax
	call	_next_real_insn
	add	esp, 4
	mov	DWORD PTR _lb$1962[ebp], eax
; Line 2866
	mov	eax, DWORD PTR _node$[ebp]
	mov	DWORD PTR _np$1963[ebp], eax
; Line 2879
$L1965:
	mov	eax, DWORD PTR _np$1963[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _np$1963[ebp], eax
	cmp	DWORD PTR _np$1963[ebp], 0
	je	$L1966
	mov	eax, DWORD PTR _np$1963[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_label_rtx
	add	esp, 4
	push	eax
	call	_next_real_insn
	add	esp, 4
	cmp	eax, DWORD PTR _lb$1962[ebp]
	jne	$L1966
	push	0
	push	1
	call	_build_int_2
	add	esp, 8
	push	eax
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	push	64					; 00000040H
	call	_combine
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _np$1963[ebp]
	mov	eax, DWORD PTR [eax+12]
	push	eax
	call	_tree_int_cst_equal
	add	esp, 8
	or	eax, eax
	je	$L1966
	push	0
	push	1
	call	_build_int_2
	add	esp, 8
	push	eax
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	push	64					; 00000040H
	call	_combine
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_tree_int_cst_lt
	add	esp, 8
	or	eax, eax
	je	$L1966
; Line 2881
	mov	eax, DWORD PTR _np$1963[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _node$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 2882
	jmp	$L1965
$L1966:
; Line 2885
	mov	eax, DWORD PTR _np$1963[ebp]
	mov	ecx, DWORD PTR _node$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 2886
	mov	eax, DWORD PTR _np$1963[ebp]
	mov	DWORD PTR _node$[ebp], eax
; Line 2887
	jmp	$L1960
$L1961:
; Line 2888
$L1957:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_group_case_nodes ENDP
_head$ = 8
_parent$ = 12
_np$ = -4
_i$1972 = -16
_ranges$1973 = -12
_npp$1974 = -8
_left$1975 = -20
_balance_case_nodes PROC NEAR
; Line 2904
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	push	ebx
	push	esi
	push	edi
; Line 2907
	mov	eax, DWORD PTR _head$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _np$[ebp], eax
; Line 2908
	cmp	DWORD PTR _np$[ebp], 0
	je	$L1971
; Line 2910
	mov	DWORD PTR _i$1972[ebp], 0
; Line 2911
	mov	DWORD PTR _ranges$1973[ebp], 0
; Line 2917
$L1977:
	cmp	DWORD PTR _np$[ebp], 0
	je	$L1978
; Line 2919
	mov	eax, DWORD PTR _np$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	mov	eax, DWORD PTR _np$[ebp]
	mov	eax, DWORD PTR [eax+12]
	push	eax
	call	_tree_int_cst_equal
	add	esp, 8
	or	eax, eax
	jne	$L1979
; Line 2920
	inc	DWORD PTR _ranges$1973[ebp]
; Line 2921
$L1979:
	inc	DWORD PTR _i$1972[ebp]
; Line 2922
	mov	eax, DWORD PTR _np$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _np$[ebp], eax
; Line 2923
	jmp	$L1977
$L1978:
; Line 2924
	cmp	DWORD PTR _i$1972[ebp], 2
	jle	$L1980
; Line 2927
	mov	eax, DWORD PTR _head$[ebp]
	mov	DWORD PTR _npp$1974[ebp], eax
; Line 2928
	mov	eax, DWORD PTR _npp$1974[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _left$1975[ebp], eax
; Line 2930
	cmp	DWORD PTR _i$1972[ebp], 3
	jne	$L1981
; Line 2931
	mov	eax, DWORD PTR _npp$1974[ebp]
	mov	eax, DWORD PTR [eax]
	add	eax, 4
	mov	DWORD PTR _npp$1974[ebp], eax
; Line 2932
	jmp	$L1982
$L1981:
; Line 2937
	mov	eax, DWORD PTR _ranges$1973[ebp]
	mov	ecx, DWORD PTR _i$1972[ebp]
	lea	eax, DWORD PTR [eax+ecx+1]
	cdq
	sub	eax, edx
	sar	eax, 1
	mov	DWORD PTR _i$1972[ebp], eax
; Line 2938
$L1984:
; Line 2941
	mov	eax, DWORD PTR _npp$1974[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	mov	eax, DWORD PTR _npp$1974[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+12]
	push	eax
	call	_tree_int_cst_equal
	add	esp, 8
	or	eax, eax
	jne	$L1986
; Line 2942
	dec	DWORD PTR _i$1972[ebp]
; Line 2943
$L1986:
	dec	DWORD PTR _i$1972[ebp]
; Line 2944
	cmp	DWORD PTR _i$1972[ebp], 0
	jg	$L1987
; Line 2945
	jmp	$L1985
; Line 2946
$L1987:
	mov	eax, DWORD PTR _npp$1974[ebp]
	mov	eax, DWORD PTR [eax]
	add	eax, 4
	mov	DWORD PTR _npp$1974[ebp], eax
; Line 2947
	jmp	$L1984
$L1985:
; Line 2948
$L1982:
; Line 2949
	mov	eax, DWORD PTR _npp$1974[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _np$[ebp], eax
	mov	eax, DWORD PTR _np$[ebp]
	mov	ecx, DWORD PTR _head$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 2950
	mov	eax, DWORD PTR _npp$1974[ebp]
	mov	DWORD PTR [eax], 0
; Line 2951
	mov	eax, DWORD PTR _parent$[ebp]
	mov	ecx, DWORD PTR _np$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 2952
	mov	eax, DWORD PTR _left$1975[ebp]
	mov	ecx, DWORD PTR _np$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 2955
	mov	eax, DWORD PTR _np$[ebp]
	push	eax
	mov	eax, DWORD PTR _np$[ebp]
	push	eax
	call	_balance_case_nodes
	add	esp, 8
; Line 2956
	mov	eax, DWORD PTR _np$[ebp]
	push	eax
	mov	eax, DWORD PTR _np$[ebp]
	add	eax, 4
	push	eax
	call	_balance_case_nodes
	add	esp, 8
; Line 2958
	jmp	$L1988
$L1980:
; Line 2962
	mov	eax, DWORD PTR _head$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _np$[ebp], eax
; Line 2963
	mov	eax, DWORD PTR _parent$[ebp]
	mov	ecx, DWORD PTR _np$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 2964
	jmp	$L1989
$L1990:
	mov	eax, DWORD PTR _np$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _np$[ebp], eax
$L1989:
	mov	eax, DWORD PTR _np$[ebp]
	cmp	DWORD PTR [eax+4], 0
	je	$L1991
; Line 2965
	mov	eax, DWORD PTR _np$[ebp]
	mov	ecx, DWORD PTR _np$[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	mov	DWORD PTR [ecx+8], eax
	jmp	$L1990
$L1991:
; Line 2966
$L1988:
; Line 2968
$L1971:
$L1969:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_balance_case_nodes ENDP
_node$ = 8
_low_minus_one$ = -4
_pnode$ = -8
_node_has_low_bound PROC NEAR
; Line 2982
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 2986
	mov	eax, DWORD PTR _node$[ebp]
	cmp	DWORD PTR [eax], 0
	je	$L1997
; Line 2988
	push	0
	push	1
	call	_build_int_2
	add	esp, 8
	push	eax
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+12]
	push	eax
	push	65					; 00000041H
	call	_combine
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _low_minus_one$[ebp], eax
; Line 2990
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+12]
	push	eax
	mov	eax, DWORD PTR _low_minus_one$[ebp]
	push	eax
	call	_tree_int_cst_lt
	add	esp, 8
	or	eax, eax
	je	$L1998
; Line 2991
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _pnode$[ebp], eax
	jmp	$L1999
$L2000:
	mov	eax, DWORD PTR _pnode$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _pnode$[ebp], eax
$L1999:
	cmp	DWORD PTR _pnode$[ebp], 0
	je	$L2001
; Line 2993
	mov	eax, DWORD PTR _pnode$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	mov	eax, DWORD PTR _low_minus_one$[ebp]
	push	eax
	call	_tree_int_cst_equal
	add	esp, 8
	or	eax, eax
	je	$L2002
; Line 2994
	mov	eax, 1
	jmp	$L1994
; Line 2998
$L2002:
	mov	eax, DWORD PTR _node$[ebp]
	cmp	DWORD PTR [eax], 0
	je	$L2003
; Line 2999
	jmp	$L2001
; Line 3000
$L2003:
	jmp	$L2000
$L2001:
; Line 3001
$L1998:
; Line 3002
$L1997:
	sub	eax, eax
	jmp	$L1994
; Line 3003
$L1994:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_node_has_low_bound ENDP
_node$ = 8
_high_plus_one$ = -8
_pnode$ = -4
_node_has_high_bound PROC NEAR
; Line 3017
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 3021
	mov	eax, DWORD PTR _node$[ebp]
	cmp	DWORD PTR [eax+4], 0
	jne	$L2009
; Line 3023
	push	0
	push	1
	call	_build_int_2
	add	esp, 8
	push	eax
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	push	64					; 00000040H
	call	_combine
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _high_plus_one$[ebp], eax
; Line 3025
	mov	eax, DWORD PTR _high_plus_one$[ebp]
	push	eax
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_tree_int_cst_lt
	add	esp, 8
	or	eax, eax
	je	$L2010
; Line 3026
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _pnode$[ebp], eax
	jmp	$L2011
$L2012:
	mov	eax, DWORD PTR _pnode$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _pnode$[ebp], eax
$L2011:
	cmp	DWORD PTR _pnode$[ebp], 0
	je	$L2013
; Line 3028
	mov	eax, DWORD PTR _pnode$[ebp]
	mov	eax, DWORD PTR [eax+12]
	push	eax
	mov	eax, DWORD PTR _high_plus_one$[ebp]
	push	eax
	call	_tree_int_cst_equal
	add	esp, 8
	or	eax, eax
	je	$L2014
; Line 3029
	mov	eax, 1
	jmp	$L2006
; Line 3033
$L2014:
	mov	eax, DWORD PTR _node$[ebp]
	cmp	DWORD PTR [eax+4], 0
	je	$L2015
; Line 3034
	jmp	$L2013
; Line 3035
$L2015:
	jmp	$L2012
$L2013:
; Line 3036
$L2010:
; Line 3037
$L2009:
	sub	eax, eax
	jmp	$L2006
; Line 3038
$L2006:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_node_has_high_bound ENDP
_node$ = 8
_node_is_bounded PROC NEAR
; Line 3047
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 3048
	mov	eax, DWORD PTR _node$[ebp]
	cmp	DWORD PTR [eax], 0
	jne	$L2020
	mov	eax, DWORD PTR _node$[ebp]
	cmp	DWORD PTR [eax+4], 0
	je	$L2019
$L2020:
; Line 3049
	sub	eax, eax
	jmp	$L2018
; Line 3050
$L2019:
	mov	eax, DWORD PTR _node$[ebp]
	push	eax
	call	_node_has_low_bound
	add	esp, 4
	or	eax, eax
	je	$L2549
	mov	eax, DWORD PTR _node$[ebp]
	push	eax
	call	_node_has_high_bound
	add	esp, 4
	or	eax, eax
	je	$L2549
	mov	eax, 1
	jmp	$L2550
$L2549:
	sub	eax, eax
$L2550:
	jmp	$L2018
; Line 3051
$L2018:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_node_is_bounded ENDP
_label$ = 8
_emit_jump_if_reachable PROC NEAR
; Line 3058
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 3061
	call	_get_last_insn
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1048576				; 00100000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L2024
; Line 3062
	mov	eax, DWORD PTR _label$[ebp]
	push	eax
	call	_emit_jump
	add	esp, 4
; Line 3063
$L2024:
$L2022:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_emit_jump_if_reachable ENDP
_TEXT	ENDS
EXTRN	_gen_bgtu:NEAR
EXTRN	_gen_blt:NEAR
EXTRN	_gen_bltu:NEAR
EXTRN	_gen_bge:NEAR
EXTRN	_gen_bgeu:NEAR
EXTRN	_gen_ble:NEAR
EXTRN	_gen_bleu:NEAR
EXTRN	_gen_bgt:NEAR
_TEXT	SEGMENT
_index$ = 8
_node$ = 12
_default_label$ = 16
_unsignedp$ = 20
_gen_bgt_pat$ = -4
_gen_bge_pat$ = -8
_gen_blt_pat$ = -12
_gen_ble_pat$ = -16
_emit_case_nodes PROC NEAR
; Line 3089
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 3092
	mov	eax, OFFSET _gen_bgtu
	cmp	DWORD PTR _unsignedp$[ebp], 0
	jne	$L2551
	mov	eax, OFFSET _gen_bgt
$L2551:
	mov	DWORD PTR _gen_bgt_pat$[ebp], eax
; Line 3093
	mov	eax, OFFSET _gen_bgeu
	cmp	DWORD PTR _unsignedp$[ebp], 0
	jne	$L2552
	mov	eax, OFFSET _gen_bge
$L2552:
	mov	DWORD PTR _gen_bge_pat$[ebp], eax
; Line 3094
	mov	eax, OFFSET _gen_bltu
	cmp	DWORD PTR _unsignedp$[ebp], 0
	jne	$L2553
	mov	eax, OFFSET _gen_blt
$L2553:
	mov	DWORD PTR _gen_blt_pat$[ebp], eax
; Line 3095
	mov	eax, OFFSET _gen_bleu
	cmp	DWORD PTR _unsignedp$[ebp], 0
	jne	$L2554
	mov	eax, OFFSET _gen_ble
$L2554:
	mov	DWORD PTR _gen_ble_pat$[ebp], eax
; Line 3097
	mov	eax, DWORD PTR _node$[ebp]
	cmp	DWORD PTR [eax+20], 0
	je	$L2035
; Line 3103
	mov	eax, DWORD PTR _default_label$[ebp]
	push	eax
	call	_emit_jump_if_reachable
	add	esp, 4
; Line 3104
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	call	_expand_label
	add	esp, 4
; Line 3106
$L2035:
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+12]
	push	eax
	call	_tree_int_cst_equal
	add	esp, 8
	or	eax, eax
	je	$L2036
; Line 3110
	mov	eax, DWORD PTR _unsignedp$[ebp]
	push	eax
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_label_rtx
	add	esp, 4
	push	eax
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+12]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _index$[ebp]
	push	eax
	call	_do_jump_if_equal
	add	esp, 16					; 00000010H
; Line 3111
	mov	eax, DWORD PTR _node$[ebp]
	cmp	DWORD PTR [eax+4], 0
	je	$L2037
; Line 3113
	mov	eax, DWORD PTR _node$[ebp]
	cmp	DWORD PTR [eax], 0
	je	$L2038
; Line 3116
	push	0
	mov	eax, DWORD PTR _unsignedp$[ebp]
	push	eax
	push	0
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _index$[ebp]
	push	eax
	call	_emit_cmp_insn
	add	esp, 20					; 00000014H
; Line 3118
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_node_is_bounded
	add	esp, 4
	or	eax, eax
	je	$L2039
; Line 3120
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_label_rtx
	add	esp, 4
	push	eax
	call	DWORD PTR _gen_bgt_pat$[ebp]
	add	esp, 4
	push	eax
	call	_emit_jump_insn
	add	esp, 4
; Line 3121
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_node_is_bounded
	add	esp, 4
	or	eax, eax
	je	$L2040
; Line 3122
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_label_rtx
	add	esp, 4
	push	eax
	call	_emit_jump
	add	esp, 4
; Line 3123
	jmp	$L2041
$L2040:
; Line 3125
	mov	eax, DWORD PTR _unsignedp$[ebp]
	push	eax
	mov	eax, DWORD PTR _default_label$[ebp]
	push	eax
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	mov	eax, DWORD PTR _index$[ebp]
	push	eax
	call	_emit_case_nodes
	add	esp, 16					; 00000010H
$L2041:
; Line 3127
	jmp	$L2042
$L2039:
; Line 3129
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_node_is_bounded
	add	esp, 4
	or	eax, eax
	je	$L2043
; Line 3130
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_label_rtx
	add	esp, 4
	push	eax
	call	DWORD PTR _gen_blt_pat$[ebp]
	add	esp, 4
	push	eax
	call	_emit_jump_insn
	add	esp, 4
; Line 3131
	jmp	$L2044
$L2043:
; Line 3134
	push	0
	push	0
	push	40					; 00000028H
	call	_build_decl
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _node$[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	mov	DWORD PTR [ecx+20], eax
; Line 3135
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	call	_label_rtx
	add	esp, 4
	push	eax
	call	DWORD PTR _gen_bgt_pat$[ebp]
	add	esp, 4
	push	eax
	call	_emit_jump_insn
	add	esp, 4
; Line 3137
	mov	eax, DWORD PTR _unsignedp$[ebp]
	push	eax
	mov	eax, DWORD PTR _default_label$[ebp]
	push	eax
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	mov	eax, DWORD PTR _index$[ebp]
	push	eax
	call	_emit_case_nodes
	add	esp, 16					; 00000010H
; Line 3138
$L2044:
; Line 3140
	mov	eax, DWORD PTR _unsignedp$[ebp]
	push	eax
	mov	eax, DWORD PTR _default_label$[ebp]
	push	eax
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _index$[ebp]
	push	eax
	call	_emit_case_nodes
	add	esp, 16					; 00000010H
; Line 3141
$L2042:
; Line 3143
	jmp	$L2045
$L2038:
; Line 3152
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 0
	je	$L2046
	mov	eax, DWORD PTR _node$[ebp]
	push	eax
	call	_node_has_low_bound
	add	esp, 4
	or	eax, eax
	jne	$L2046
; Line 3154
	push	0
	mov	eax, DWORD PTR _unsignedp$[ebp]
	push	eax
	push	0
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _index$[ebp]
	push	eax
	call	_emit_cmp_insn
	add	esp, 20					; 00000014H
; Line 3155
	mov	eax, DWORD PTR _default_label$[ebp]
	push	eax
	call	DWORD PTR _gen_blt_pat$[ebp]
	add	esp, 4
	push	eax
	call	_emit_jump_insn
	add	esp, 4
; Line 3157
$L2046:
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_node_is_bounded
	add	esp, 4
	or	eax, eax
	je	$L2047
; Line 3158
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_label_rtx
	add	esp, 4
	push	eax
	call	_emit_jump
	add	esp, 4
; Line 3159
	jmp	$L2048
$L2047:
; Line 3160
	mov	eax, DWORD PTR _unsignedp$[ebp]
	push	eax
	mov	eax, DWORD PTR _default_label$[ebp]
	push	eax
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _index$[ebp]
	push	eax
	call	_emit_case_nodes
	add	esp, 16					; 00000010H
$L2048:
; Line 3161
$L2045:
; Line 3163
	jmp	$L2049
$L2037:
	mov	eax, DWORD PTR _node$[ebp]
	cmp	DWORD PTR [eax], 0
	je	$L2050
; Line 3165
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_node_is_bounded
	add	esp, 4
	or	eax, eax
	je	$L2051
; Line 3166
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_label_rtx
	add	esp, 4
	push	eax
	call	_emit_jump
	add	esp, 4
; Line 3167
	jmp	$L2052
$L2051:
; Line 3168
	mov	eax, DWORD PTR _unsignedp$[ebp]
	push	eax
	mov	eax, DWORD PTR _default_label$[ebp]
	push	eax
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	mov	eax, DWORD PTR _index$[ebp]
	push	eax
	call	_emit_case_nodes
	add	esp, 16					; 00000010H
$L2052:
; Line 3170
$L2050:
$L2049:
; Line 3171
	jmp	$L2053
$L2036:
; Line 3174
	mov	eax, DWORD PTR _node$[ebp]
	cmp	DWORD PTR [eax+4], 0
	je	$L2054
; Line 3176
	mov	eax, DWORD PTR _node$[ebp]
	cmp	DWORD PTR [eax], 0
	je	$L2055
; Line 3178
	push	0
	mov	eax, DWORD PTR _unsignedp$[ebp]
	push	eax
	push	0
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _index$[ebp]
	push	eax
	call	_emit_cmp_insn
	add	esp, 20					; 00000014H
; Line 3179
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_node_is_bounded
	add	esp, 4
	or	eax, eax
	je	$L2056
; Line 3184
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_label_rtx
	add	esp, 4
	push	eax
	call	DWORD PTR _gen_bgt_pat$[ebp]
	add	esp, 4
	push	eax
	call	_emit_jump_insn
	add	esp, 4
; Line 3186
	jmp	$L2057
$L2056:
; Line 3191
	push	0
	push	0
	push	40					; 00000028H
	call	_build_decl
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _node$[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	mov	DWORD PTR [ecx+20], eax
; Line 3192
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	call	_label_rtx
	add	esp, 4
	push	eax
	call	DWORD PTR _gen_bgt_pat$[ebp]
	add	esp, 4
	push	eax
	call	_emit_jump_insn
	add	esp, 4
; Line 3193
$L2057:
; Line 3194
	push	0
	mov	eax, DWORD PTR _unsignedp$[ebp]
	push	eax
	push	0
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+12]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _index$[ebp]
	push	eax
	call	_emit_cmp_insn
	add	esp, 20					; 00000014H
; Line 3195
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_label_rtx
	add	esp, 4
	push	eax
	call	DWORD PTR _gen_bge_pat$[ebp]
	add	esp, 4
	push	eax
	call	_emit_jump_insn
	add	esp, 4
; Line 3196
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_node_is_bounded
	add	esp, 4
	or	eax, eax
	je	$L2058
; Line 3201
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_label_rtx
	add	esp, 4
	push	eax
	call	_emit_jump
	add	esp, 4
; Line 3203
	jmp	$L2059
$L2058:
; Line 3204
	mov	eax, DWORD PTR _unsignedp$[ebp]
	push	eax
	mov	eax, DWORD PTR _default_label$[ebp]
	push	eax
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	mov	eax, DWORD PTR _index$[ebp]
	push	eax
	call	_emit_case_nodes
	add	esp, 16					; 00000010H
$L2059:
; Line 3207
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+20], 0
	je	$L2060
; Line 3208
	mov	eax, DWORD PTR _unsignedp$[ebp]
	push	eax
	mov	eax, DWORD PTR _default_label$[ebp]
	push	eax
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _index$[ebp]
	push	eax
	call	_emit_case_nodes
	add	esp, 16					; 00000010H
; Line 3209
$L2060:
; Line 3210
	jmp	$L2061
$L2055:
; Line 3212
	mov	eax, DWORD PTR _node$[ebp]
	push	eax
	call	_node_has_low_bound
	add	esp, 4
	or	eax, eax
	jne	$L2062
; Line 3214
	push	0
	mov	eax, DWORD PTR _unsignedp$[ebp]
	push	eax
	push	0
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+12]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _index$[ebp]
	push	eax
	call	_emit_cmp_insn
	add	esp, 20					; 00000014H
; Line 3215
	mov	eax, DWORD PTR _default_label$[ebp]
	push	eax
	call	DWORD PTR _gen_blt_pat$[ebp]
	add	esp, 4
	push	eax
	call	_emit_jump_insn
	add	esp, 4
; Line 3217
$L2062:
	push	0
	mov	eax, DWORD PTR _unsignedp$[ebp]
	push	eax
	push	0
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _index$[ebp]
	push	eax
	call	_emit_cmp_insn
	add	esp, 20					; 00000014H
; Line 3218
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_label_rtx
	add	esp, 4
	push	eax
	call	DWORD PTR _gen_ble_pat$[ebp]
	add	esp, 4
	push	eax
	call	_emit_jump_insn
	add	esp, 4
; Line 3219
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_node_is_bounded
	add	esp, 4
	or	eax, eax
	je	$L2063
; Line 3224
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_label_rtx
	add	esp, 4
	push	eax
	call	_emit_jump
	add	esp, 4
; Line 3226
	jmp	$L2064
$L2063:
; Line 3227
	mov	eax, DWORD PTR _unsignedp$[ebp]
	push	eax
	mov	eax, DWORD PTR _default_label$[ebp]
	push	eax
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _index$[ebp]
	push	eax
	call	_emit_case_nodes
	add	esp, 16					; 00000010H
$L2064:
; Line 3228
$L2061:
; Line 3230
	jmp	$L2065
$L2054:
	mov	eax, DWORD PTR _node$[ebp]
	cmp	DWORD PTR [eax], 0
	je	$L2066
; Line 3232
	mov	eax, DWORD PTR _node$[ebp]
	push	eax
	call	_node_has_high_bound
	add	esp, 4
	or	eax, eax
	jne	$L2067
; Line 3234
	push	0
	mov	eax, DWORD PTR _unsignedp$[ebp]
	push	eax
	push	0
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _index$[ebp]
	push	eax
	call	_emit_cmp_insn
	add	esp, 20					; 00000014H
; Line 3235
	mov	eax, DWORD PTR _default_label$[ebp]
	push	eax
	call	DWORD PTR _gen_bgt_pat$[ebp]
	add	esp, 4
	push	eax
	call	_emit_jump_insn
	add	esp, 4
; Line 3237
$L2067:
	push	0
	mov	eax, DWORD PTR _unsignedp$[ebp]
	push	eax
	push	0
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+12]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _index$[ebp]
	push	eax
	call	_emit_cmp_insn
	add	esp, 20					; 00000014H
; Line 3238
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_label_rtx
	add	esp, 4
	push	eax
	call	DWORD PTR _gen_bge_pat$[ebp]
	add	esp, 4
	push	eax
	call	_emit_jump_insn
	add	esp, 4
; Line 3239
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_node_is_bounded
	add	esp, 4
	or	eax, eax
	je	$L2068
; Line 3244
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_label_rtx
	add	esp, 4
	push	eax
	call	_emit_jump
	add	esp, 4
; Line 3246
	jmp	$L2069
$L2068:
; Line 3247
	mov	eax, DWORD PTR _unsignedp$[ebp]
	push	eax
	mov	eax, DWORD PTR _default_label$[ebp]
	push	eax
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	mov	eax, DWORD PTR _index$[ebp]
	push	eax
	call	_emit_case_nodes
	add	esp, 16					; 00000010H
$L2069:
; Line 3249
	jmp	$L2070
$L2066:
; Line 3255
	mov	eax, DWORD PTR _node$[ebp]
	push	eax
	call	_node_has_high_bound
	add	esp, 4
	or	eax, eax
	jne	$L2071
; Line 3257
	push	0
	mov	eax, DWORD PTR _unsignedp$[ebp]
	push	eax
	push	0
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _index$[ebp]
	push	eax
	call	_emit_cmp_insn
	add	esp, 20					; 00000014H
; Line 3258
	mov	eax, DWORD PTR _default_label$[ebp]
	push	eax
	call	DWORD PTR _gen_bgt_pat$[ebp]
	add	esp, 4
	push	eax
	call	_emit_jump_insn
	add	esp, 4
; Line 3260
$L2071:
	mov	eax, DWORD PTR _node$[ebp]
	push	eax
	call	_node_has_low_bound
	add	esp, 4
	or	eax, eax
	jne	$L2072
; Line 3262
	push	0
	mov	eax, DWORD PTR _unsignedp$[ebp]
	push	eax
	push	0
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+12]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _index$[ebp]
	push	eax
	call	_emit_cmp_insn
	add	esp, 20					; 00000014H
; Line 3263
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_label_rtx
	add	esp, 4
	push	eax
	call	DWORD PTR _gen_bge_pat$[ebp]
	add	esp, 4
	push	eax
	call	_emit_jump_insn
	add	esp, 4
; Line 3269
$L2072:
$L2070:
$L2065:
; Line 3270
$L2053:
; Line 3271
$L2029:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_emit_case_nodes ENDP
_TEXT	ENDS
PUBLIC	_get_frame_size
_TEXT	SEGMENT
_get_frame_size PROC NEAR
; Line 3279
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 3281
	mov	eax, DWORD PTR _frame_offset$S1192
	neg	eax
	jmp	$L2074
; Line 3285
$L2074:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_get_frame_size ENDP
_TEXT	ENDS
EXTRN	_memory_address_p:NEAR
_BSS	SEGMENT
_invalid_stack_slot$S1193 DD 01H DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
_mode$ = 8
_size$ = 12
_x$ = -12
_addr$ = -4
_bigend_correction$ = -8
_assign_stack_local PROC NEAR
; Line 3294
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 3296
	mov	DWORD PTR _bigend_correction$[ebp], 0
; Line 3298
	mov	DWORD PTR _frame_pointer_needed, 1
; Line 3303
	mov	eax, DWORD PTR _size$[ebp]
	add	eax, 3
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	shl	eax, 2
	mov	DWORD PTR _size$[ebp], eax
; Line 3313
	sub	eax, eax
	sub	eax, DWORD PTR _size$[ebp]
	neg	eax
	sub	DWORD PTR _frame_offset$S1192, eax
; Line 3317
	mov	eax, DWORD PTR _frame_offset$S1192
	add	eax, DWORD PTR _bigend_correction$[ebp]
	push	eax
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
	mov	DWORD PTR _addr$[ebp], eax
; Line 3322
	mov	eax, DWORD PTR _addr$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_memory_address_p
	add	esp, 8
	or	eax, eax
	jne	$L2082
; Line 3323
	mov	DWORD PTR _invalid_stack_slot$S1193, 1
; Line 3325
$L2082:
	mov	eax, DWORD PTR _addr$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	push	37					; 00000025H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _x$[ebp], eax
; Line 3327
	mov	eax, DWORD PTR _stack_slot_list
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	push	0
	push	2
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	DWORD PTR _stack_slot_list, eax
; Line 3329
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L2077
; Line 3330
$L2077:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_assign_stack_local ENDP
_TEXT	ENDS
PUBLIC	_put_var_into_stack
_TEXT	SEGMENT
_decl$ = 8
_reg$ = -4
_new$ = -8
_put_var_into_stack PROC NEAR
; Line 3338
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 3339
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	DWORD PTR _reg$[ebp], eax
; Line 3345
	cmp	DWORD PTR _reg$[ebp], 0
	jne	$L2088
; Line 3346
	jmp	$L2085
; Line 3347
$L2088:
	mov	eax, DWORD PTR _reg$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L2089
; Line 3348
	jmp	$L2085
; Line 3350
$L2089:
	mov	eax, DWORD PTR _reg$[ebp]
	push	eax
	call	_parm_stack_loc
	add	esp, 4
	mov	DWORD PTR _new$[ebp], eax
; Line 3351
	cmp	DWORD PTR _new$[ebp], 0
	jne	$L2090
; Line 3352
	mov	eax, DWORD PTR _reg$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	push	eax
	mov	eax, DWORD PTR _reg$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	call	_assign_stack_local
	add	esp, 8
	mov	DWORD PTR _new$[ebp], eax
; Line 3354
$L2090:
	mov	eax, DWORD PTR _new$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 3356
	mov	eax, DWORD PTR _reg$[ebp]
	and	DWORD PTR [eax], -134217729		; f7ffffffH
; Line 3357
	mov	eax, DWORD PTR _reg$[ebp]
	mov	eax, DWORD PTR [eax]
	and	eax, -65499				; ffff0025H
	or	eax, 37					; 00000025H
	mov	ecx, DWORD PTR _reg$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 3364
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 16					; 00000010H
	je	$L2557
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 19					; 00000013H
	je	$L2557
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 20					; 00000014H
	jne	$L2555
$L2557:
	mov	eax, DWORD PTR _reg$[ebp]
	mov	eax, DWORD PTR [eax]
	or	eax, 268435456				; 10000000H
	mov	ecx, DWORD PTR _reg$[ebp]
	mov	DWORD PTR [ecx], eax
	jmp	$L2556
$L2555:
	mov	eax, DWORD PTR _reg$[ebp]
	and	DWORD PTR [eax], -268435457		; efffffffH
$L2556:
; Line 3366
	mov	eax, DWORD PTR _reg$[ebp]
	push	eax
	call	_fixup_var_refs
	add	esp, 4
; Line 3367
$L2085:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_put_var_into_stack ENDP
_TEXT	ENDS
EXTRN	_push_to_sequence:NEAR
EXTRN	_sequence_stack:DWORD
_TEXT	SEGMENT
_var$ = 8
_stack$ = -8
_pending$ = -4
_seq$2103 = -12
_fixup_var_refs PROC NEAR
; Line 3372
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 3374
	mov	eax, DWORD PTR _sequence_stack
	mov	DWORD PTR _stack$[ebp], eax
; Line 3377
	mov	eax, DWORD PTR _sequence_stack
	mov	DWORD PTR _stack$[ebp], eax
; Line 3380
	cmp	DWORD PTR _stack$[ebp], 1
	sbb	eax, eax
	neg	eax
	push	eax
	call	_get_insns
	push	eax
	mov	eax, DWORD PTR _var$[ebp]
	push	eax
	call	_fixup_var_refs_insns
	add	esp, 12					; 0000000cH
; Line 3383
	jmp	$L2096
$L2097:
	mov	eax, DWORD PTR _stack$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _stack$[ebp], eax
$L2096:
	cmp	DWORD PTR _stack$[ebp], 0
	je	$L2098
; Line 3385
	mov	eax, DWORD PTR _stack$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_push_to_sequence
	add	esp, 4
; Line 3387
	mov	eax, DWORD PTR _stack$[ebp]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+8], 1
	sbb	eax, eax
	neg	eax
	push	eax
	mov	eax, DWORD PTR _stack$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _var$[ebp]
	push	eax
	call	_fixup_var_refs_insns
	add	esp, 12					; 0000000cH
; Line 3390
	call	_get_last_insn
	mov	ecx, DWORD PTR _stack$[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	mov	DWORD PTR [ecx+4], eax
; Line 3391
	call	_end_sequence
; Line 3392
	jmp	$L2097
$L2098:
; Line 3395
	mov	eax, DWORD PTR _rtl_expr_chain$S1198
	mov	DWORD PTR _pending$[ebp], eax
	jmp	$L2100
$L2101:
	mov	eax, DWORD PTR _pending$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _pending$[ebp], eax
$L2100:
	cmp	DWORD PTR _pending$[ebp], 0
	je	$L2102
; Line 3397
	mov	eax, DWORD PTR _pending$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _seq$2103[ebp], eax
; Line 3398
	mov	eax, DWORD PTR _const0_rtx
	cmp	DWORD PTR _seq$2103[ebp], eax
	je	$L2104
	cmp	DWORD PTR _seq$2103[ebp], 0
	je	$L2104
; Line 3400
	mov	eax, DWORD PTR _seq$2103[ebp]
	push	eax
	call	_push_to_sequence
	add	esp, 4
; Line 3401
	push	0
	mov	eax, DWORD PTR _seq$2103[ebp]
	push	eax
	mov	eax, DWORD PTR _var$[ebp]
	push	eax
	call	_fixup_var_refs_insns
	add	esp, 12					; 0000000cH
; Line 3402
	call	_end_sequence
; Line 3404
$L2104:
	jmp	$L2101
$L2102:
; Line 3405
$L2092:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_fixup_var_refs ENDP
_TEXT	ENDS
EXTRN	_rtx_equal_p:NEAR
EXTRN	_delete_insn:NEAR
_BSS	SEGMENT
_last_parm_insn$S1199 DD 01H DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
_next$2112 = -4
_note$2113 = -8
_var$ = 8
_insn$ = 12
_toplevel$ = 16
_fixup_var_refs_insns PROC NEAR
; Line 3416
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 3417
$L2110:
	cmp	DWORD PTR _insn$[ebp], 0
	je	$L2111
; Line 3419
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _next$2112[ebp], eax
; Line 3422
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 851968				; 000d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L2115
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 983040				; 000f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L2115
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 917504				; 000e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2114
$L2115:
; Line 3429
	cmp	DWORD PTR _toplevel$[ebp], 0
	je	$L2116
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2116
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _var$[ebp]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L2116
	mov	eax, DWORD PTR _var$[ebp]
	push	eax
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_rtx_equal_p
	add	esp, 8
	or	eax, eax
	je	$L2116
; Line 3431
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_delete_insn
	add	esp, 4
	mov	DWORD PTR _next$2112[ebp], eax
; Line 3432
	mov	eax, DWORD PTR _insn$[ebp]
	cmp	DWORD PTR _last_parm_insn$S1199, eax
	jne	$L2117
; Line 3433
	mov	eax, DWORD PTR _next$2112[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _last_parm_insn$S1199, eax
; Line 3434
$L2117:
; Line 3435
	jmp	$L2118
$L2116:
; Line 3436
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	mov	eax, DWORD PTR _var$[ebp]
	push	eax
	call	_fixup_var_refs_1
	add	esp, 12					; 0000000cH
$L2118:
; Line 3440
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR _note$2113[ebp], eax
	jmp	$L2119
$L2120:
	mov	eax, DWORD PTR _note$2113[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _note$2113[ebp], eax
$L2119:
	cmp	DWORD PTR _note$2113[ebp], 0
	je	$L2121
; Line 3441
	mov	eax, DWORD PTR _note$2113[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 196608				; 00030000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L2122
; Line 3442
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _note$2113[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_walk_fixup_memory_subreg
	add	esp, 8
	mov	ecx, DWORD PTR _note$2113[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 3443
$L2122:
	jmp	$L2120
$L2121:
; Line 3444
$L2114:
	mov	eax, DWORD PTR _next$2112[ebp]
	mov	DWORD PTR _insn$[ebp], eax
; Line 3445
	jmp	$L2110
$L2111:
; Line 3446
$L2108:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_fixup_var_refs_insns ENDP
_TEXT	ENDS
EXTRN	_rtx_length:BYTE
EXTRN	_rtx_format:BYTE
EXTRN	_copy_rtx:NEAR
EXTRN	_emit_insn_before:NEAR
EXTRN	_adj_offsettable_operand:NEAR
EXTRN	_offsettable_memref_p:NEAR
_TEXT	SEGMENT
_count$2179 = -40
_temp$2187 = -48
_var$ = 8
_fixeddest$2188 = -44
_x$ = 12
_insn$ = 16
_i$ = -12
_code$ = -8
_fmt$ = -4
_tem$ = -16
_j$2196 = -52
_dest$2154 = -20
_src$2155 = -32
_outerdest$2156 = -28
_outersrc$2157 = -24
_count$2175 = -36
_fixup_var_refs_1 PROC NEAR
; Line 3453
	push	ebp
	mov	ebp, esp
	sub	esp, 56					; 00000038H
	push	ebx
	push	esi
	push	edi
; Line 3455
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$[ebp], eax
; Line 3459
	mov	eax, DWORD PTR _code$[ebp]
	mov	DWORD PTR -56+[ebp], eax
	jmp	$L2131
; Line 3461
$L2135:
; Line 3462
	mov	eax, DWORD PTR _var$[ebp]
	cmp	DWORD PTR _x$[ebp], eax
	jne	$L2136
; Line 3464
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_fixup_stack_1
	add	esp, 8
	mov	DWORD PTR _x$[ebp], eax
; Line 3465
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	call	_gen_reg_rtx
	add	esp, 4
	mov	DWORD PTR _tem$[ebp], eax
; Line 3467
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 983040				; 000f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2137
; Line 3469
$L2139:
	mov	eax, DWORD PTR _insn$[ebp]
	cmp	DWORD PTR [eax+8], 0
	je	$L2140
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 851968				; 000d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2140
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1703936				; 001a0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2140
; Line 3470
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _insn$[ebp], eax
	jmp	$L2139
$L2140:
; Line 3471
$L2137:
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	mov	eax, DWORD PTR _tem$[ebp]
	push	eax
	call	_gen_move_insn
	add	esp, 8
	push	eax
	call	_emit_insn_before
	add	esp, 8
; Line 3472
	mov	eax, DWORD PTR _tem$[ebp]
	jmp	$L2126
; Line 3474
$L2136:
	jmp	$L2132
; Line 3476
$L2141:
; Line 3484
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L2126
; Line 3486
$L2142:
; Line 3491
	mov	eax, DWORD PTR _x$[ebp]
	mov	DWORD PTR _tem$[ebp], eax
; Line 3493
$L2144:
	mov	eax, DWORD PTR _tem$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L2146
	mov	eax, DWORD PTR _tem$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 5832704				; 00590000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L2146
	mov	eax, DWORD PTR _tem$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 5898240				; 005a0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2145
$L2146:
; Line 3494
	mov	eax, DWORD PTR _tem$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _tem$[ebp], eax
	jmp	$L2144
$L2145:
; Line 3495
	mov	eax, DWORD PTR _var$[ebp]
	cmp	DWORD PTR _tem$[ebp], eax
	jne	$L2147
; Line 3497
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_fixup_stack_1
	add	esp, 8
	mov	DWORD PTR _x$[ebp], eax
; Line 3498
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	call	_gen_reg_rtx
	add	esp, 4
	mov	DWORD PTR _tem$[ebp], eax
; Line 3499
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2148
; Line 3500
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_fixup_memory_subreg
	add	esp, 8
	mov	DWORD PTR _x$[ebp], eax
; Line 3501
$L2148:
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	mov	eax, DWORD PTR _tem$[ebp]
	push	eax
	call	_gen_move_insn
	add	esp, 8
	push	eax
	call	_emit_insn_before
	add	esp, 8
; Line 3502
	mov	eax, DWORD PTR _tem$[ebp]
	jmp	$L2126
; Line 3504
$L2147:
	jmp	$L2132
; Line 3506
$L2149:
; Line 3509
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 5832704				; 00590000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L2151
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 5898240				; 005a0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2150
$L2151:
; Line 3510
	push	0
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_optimize_bit_field
	add	esp, 12					; 0000000cH
; Line 3511
$L2150:
; Line 3512
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 5832704				; 00590000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L2153
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 5898240				; 005a0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2152
$L2153:
; Line 3513
	push	0
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_optimize_bit_field
	add	esp, 12					; 0000000cH
; Line 3515
$L2152:
; Line 3516
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _dest$2154[ebp], eax
; Line 3517
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _src$2155[ebp], eax
; Line 3518
	mov	eax, DWORD PTR _dest$2154[ebp]
	mov	DWORD PTR _outerdest$2156[ebp], eax
; Line 3519
	mov	eax, DWORD PTR _src$2155[ebp]
	mov	DWORD PTR _outersrc$2157[ebp], eax
; Line 3523
$L2159:
	mov	eax, DWORD PTR _dest$2154[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L2161
	mov	eax, DWORD PTR _dest$2154[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2359296				; 00240000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L2161
	mov	eax, DWORD PTR _dest$2154[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 5832704				; 00590000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L2161
	mov	eax, DWORD PTR _dest$2154[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 5898240				; 005a0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2160
$L2161:
; Line 3524
	mov	eax, DWORD PTR _dest$2154[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _dest$2154[ebp], eax
	jmp	$L2159
$L2160:
; Line 3527
$L2163:
	mov	eax, DWORD PTR _src$2155[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L2165
	mov	eax, DWORD PTR _src$2155[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 5832704				; 00590000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L2165
	mov	eax, DWORD PTR _src$2155[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 5898240				; 005a0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2164
$L2165:
; Line 3528
	mov	eax, DWORD PTR _src$2155[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _src$2155[ebp], eax
	jmp	$L2163
$L2164:
; Line 3533
	mov	eax, DWORD PTR _var$[ebp]
	cmp	DWORD PTR _src$2155[ebp], eax
	je	$L2166
	mov	eax, DWORD PTR _var$[ebp]
	cmp	DWORD PTR _dest$2154[ebp], eax
	je	$L2166
; Line 3534
	jmp	$L2132
; Line 3540
$L2166:
; Line 3543
	mov	eax, DWORD PTR _outerdest$2156[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 5832704				; 00590000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L2168
	mov	eax, DWORD PTR _outerdest$2156[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 5898240				; 005a0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2167
$L2168:
	mov	eax, DWORD PTR _outerdest$2156[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2167
	mov	eax, DWORD PTR _outerdest$2156[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _var$[ebp]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L2167
; Line 3544
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _outerdest$2156[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_fixup_memory_subreg
	add	esp, 8
	mov	ecx, DWORD PTR _outerdest$2156[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 3546
$L2167:
; Line 3549
	mov	eax, DWORD PTR _outersrc$2157[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 5832704				; 00590000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L2170
	mov	eax, DWORD PTR _outersrc$2157[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 5898240				; 005a0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2169
$L2170:
	mov	eax, DWORD PTR _outersrc$2157[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2169
	mov	eax, DWORD PTR _outersrc$2157[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _var$[ebp]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L2169
; Line 3550
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _outersrc$2157[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_fixup_memory_subreg
	add	esp, 8
	mov	ecx, DWORD PTR _outersrc$2157[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 3584
$L2169:
; Line 3587
	mov	eax, DWORD PTR _outerdest$2156[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 5832704				; 00590000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L2172
	mov	eax, DWORD PTR _outerdest$2156[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 5898240				; 005a0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2171
$L2172:
	mov	eax, DWORD PTR _outerdest$2156[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2171
	mov	eax, DWORD PTR _outerdest$2156[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 16777216				; 01000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L2171
; Line 3589
	mov	eax, DWORD PTR _outerdest$2156[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_copy_rtx
	add	esp, 4
	mov	ecx, DWORD PTR _outerdest$2156[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 3590
	mov	eax, DWORD PTR _outerdest$2156[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	and	eax, -16646145				; ff01ffffH
	or	eax, 65536				; 00010000H
	mov	ecx, DWORD PTR _outerdest$2156[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	mov	DWORD PTR [ecx], eax
; Line 3594
	mov	eax, DWORD PTR _outerdest$2156[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2174
	mov	eax, DWORD PTR _outerdest$2156[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_offsettable_memref_p
	add	esp, 4
	or	eax, eax
	je	$L2174
; Line 3596
	mov	eax, DWORD PTR _outerdest$2156[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _count$2175[ebp], eax
; Line 3599
	mov	ecx, DWORD PTR _mode_size+4
	shl	ecx, 3
	mov	eax, DWORD PTR _count$2175[ebp]
	cdq
	idiv	ecx
	push	eax
	mov	eax, DWORD PTR _outerdest$2156[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_adj_offsettable_operand
	add	esp, 8
	mov	ecx, DWORD PTR _outerdest$2156[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 3602
	mov	ecx, DWORD PTR _mode_size+4
	shl	ecx, 3
	mov	eax, DWORD PTR _count$2175[ebp]
	cdq
	idiv	ecx
	push	edx
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _outerdest$2156[ebp]
	mov	DWORD PTR [ecx+12], eax
; Line 3604
$L2174:
; Line 3606
$L2171:
; Line 3609
	mov	eax, DWORD PTR _outersrc$2157[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 5832704				; 00590000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L2177
	mov	eax, DWORD PTR _outersrc$2157[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 5898240				; 005a0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2176
$L2177:
	mov	eax, DWORD PTR _outersrc$2157[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2176
	mov	eax, DWORD PTR _outersrc$2157[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 16777216				; 01000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L2176
; Line 3611
	mov	eax, DWORD PTR _outersrc$2157[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_copy_rtx
	add	esp, 4
	mov	ecx, DWORD PTR _outersrc$2157[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 3612
	mov	eax, DWORD PTR _outersrc$2157[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	and	eax, -16646145				; ff01ffffH
	or	eax, 65536				; 00010000H
	mov	ecx, DWORD PTR _outersrc$2157[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	mov	DWORD PTR [ecx], eax
; Line 3616
	mov	eax, DWORD PTR _outersrc$2157[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2178
	mov	eax, DWORD PTR _outersrc$2157[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_offsettable_memref_p
	add	esp, 4
	or	eax, eax
	je	$L2178
; Line 3618
	mov	eax, DWORD PTR _outersrc$2157[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _count$2179[ebp], eax
; Line 3621
	mov	ecx, DWORD PTR _mode_size+4
	shl	ecx, 3
	mov	eax, DWORD PTR _count$2179[ebp]
	cdq
	idiv	ecx
	push	eax
	mov	eax, DWORD PTR _outersrc$2157[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_adj_offsettable_operand
	add	esp, 8
	mov	ecx, DWORD PTR _outersrc$2157[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 3624
	mov	ecx, DWORD PTR _mode_size+4
	shl	ecx, 3
	mov	eax, DWORD PTR _count$2179[ebp]
	cdq
	idiv	ecx
	push	edx
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _outersrc$2157[ebp]
	mov	DWORD PTR [ecx+12], eax
; Line 3626
$L2178:
; Line 3632
$L2176:
	mov	eax, DWORD PTR _var$[ebp]
	cmp	DWORD PTR _dest$2154[ebp], eax
	jne	$L2180
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2359296				; 00240000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2180
; Line 3633
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 3641
$L2180:
; Line 3645
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L2182
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L2182
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2183
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L2182
$L2183:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2181
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2181
$L2182:
; Line 3647
	mov	eax, DWORD PTR _var$[ebp]
	cmp	DWORD PTR _src$2155[ebp], eax
	jne	$L2184
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2184
; Line 3648
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_fixup_memory_subreg
	add	esp, 8
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 3649
$L2184:
	mov	eax, DWORD PTR _var$[ebp]
	cmp	DWORD PTR _dest$2154[ebp], eax
	jne	$L2185
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2185
; Line 3650
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_fixup_memory_subreg
	add	esp, 8
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 3651
$L2185:
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_fixup_stack_1
	add	esp, 8
	jmp	$L2126
; Line 3658
$L2181:
	mov	eax, DWORD PTR _var$[ebp]
	cmp	DWORD PTR _dest$2154[ebp], eax
	jne	$L2186
; Line 3662
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _tem$[ebp], eax
; Line 3664
	mov	eax, DWORD PTR _tem$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2359296				; 00240000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2189
; Line 3665
	mov	eax, DWORD PTR _tem$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _tem$[ebp], eax
; Line 3667
$L2189:
	mov	eax, DWORD PTR _tem$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2190
; Line 3668
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _tem$[ebp]
	push	eax
	call	_fixup_memory_subreg
	add	esp, 8
	mov	DWORD PTR _tem$[ebp], eax
; Line 3669
$L2190:
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _tem$[ebp]
	push	eax
	call	_fixup_stack_1
	add	esp, 8
	mov	DWORD PTR _fixeddest$2188[ebp], eax
; Line 3670
	mov	eax, DWORD PTR _tem$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	call	_gen_reg_rtx
	add	esp, 4
	mov	DWORD PTR _temp$2187[ebp], eax
; Line 3671
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _temp$2187[ebp]
	push	eax
	mov	eax, DWORD PTR _fixeddest$2188[ebp]
	push	eax
	call	_gen_move_insn
	add	esp, 8
	push	eax
	call	_emit_insn_after
	add	esp, 8
; Line 3672
	mov	eax, DWORD PTR _temp$2187[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 3674
$L2186:
; Line 3675
	jmp	$L2132
$L2131:
	cmp	DWORD PTR -56+[ebp], 37			; 00000025H
	jg	$L2558
	je	$L2135
	cmp	DWORD PTR -56+[ebp], 25			; 00000019H
	je	$L2149
	cmp	DWORD PTR -56+[ebp], 30			; 0000001eH
	jl	$L2132
	cmp	DWORD PTR -56+[ebp], 34			; 00000022H
	jle	$L2141
	cmp	DWORD PTR -56+[ebp], 35			; 00000023H
	je	$L2142
	jmp	$L2132
$L2558:
	cmp	DWORD PTR -56+[ebp], 38			; 00000026H
	jl	$L2132
	cmp	DWORD PTR -56+[ebp], 40			; 00000028H
	jle	$L2141
	cmp	DWORD PTR -56+[ebp], 89			; 00000059H
	jl	$L2132
	cmp	DWORD PTR -56+[ebp], 90			; 0000005aH
	jle	$L2142
	jmp	$L2132
$L2132:
; Line 3679
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_format[eax*4]
	mov	DWORD PTR _fmt$[ebp], eax
; Line 3680
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_length[eax*4]
	dec	eax
	mov	DWORD PTR _i$[ebp], eax
	jmp	$L2191
$L2192:
	dec	DWORD PTR _i$[ebp]
$L2191:
	cmp	DWORD PTR _i$[ebp], 0
	jl	$L2193
; Line 3682
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 101				; 00000065H
	jne	$L2194
; Line 3683
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	push	eax
	mov	eax, DWORD PTR _var$[ebp]
	push	eax
	call	_fixup_var_refs_1
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [edx+ecx*4+4], eax
; Line 3684
$L2194:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 69					; 00000045H
	jne	$L2195
; Line 3687
	mov	DWORD PTR _j$2196[ebp], 0
	jmp	$L2197
$L2198:
	inc	DWORD PTR _j$2196[ebp]
$L2197:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$2196[ebp]
	cmp	DWORD PTR [eax], ecx
	jbe	$L2199
; Line 3689
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$2196[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	push	eax
	mov	eax, DWORD PTR _var$[ebp]
	push	eax
	call	_fixup_var_refs_1
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR [edx+ecx*4+4]
	mov	edx, DWORD PTR _j$2196[ebp]
	mov	DWORD PTR [ecx+edx*4+4], eax
	jmp	$L2198
$L2199:
; Line 3691
$L2195:
	jmp	$L2192
$L2193:
; Line 3692
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L2126
; Line 3693
$L2126:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_fixup_var_refs_1 ENDP
_TEXT	ENDS
EXTRN	_change_address:NEAR
EXTRN	_gen_sequence:NEAR
EXTRN	_plus_constant:NEAR
_TEXT	SEGMENT
_x$ = 8
_insn$ = 12
_offset$ = -20
_addr$ = -8
_mode$ = -4
_saved$ = -16
_result$ = -12
_fixup_memory_subreg PROC NEAR
; Line 3703
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	push	ebx
	push	esi
	push	edi
; Line 3704
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	shl	eax, 2
	mov	DWORD PTR _offset$[ebp], eax
; Line 3705
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _addr$[ebp], eax
; Line 3706
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	mov	DWORD PTR _mode$[ebp], eax
; Line 3713
	mov	eax, DWORD PTR _offset$[ebp]
	push	eax
	mov	eax, DWORD PTR _addr$[ebp]
	push	eax
	call	_plus_constant
	add	esp, 8
	mov	DWORD PTR _addr$[ebp], eax
; Line 3714
	mov	eax, DWORD PTR _addr$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_memory_address_p
	add	esp, 8
	or	eax, eax
	je	$L2208
; Line 3715
	mov	eax, DWORD PTR _addr$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_change_address
	add	esp, 12					; 0000000cH
	jmp	$L2202
; Line 3716
$L2208:
	call	_start_sequence
	mov	DWORD PTR _saved$[ebp], eax
; Line 3717
	mov	eax, DWORD PTR _addr$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_change_address
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _result$[ebp], eax
; Line 3718
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_gen_sequence
	push	eax
	call	_emit_insn_before
	add	esp, 8
; Line 3719
	mov	eax, DWORD PTR _saved$[ebp]
	push	eax
	call	_end_sequence
	add	esp, 4
; Line 3720
	mov	eax, DWORD PTR _result$[ebp]
	jmp	$L2202
; Line 3721
$L2202:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_fixup_memory_subreg ENDP
_x$ = 8
_insn$ = 12
_code$ = -12
_fmt$ = -4
_i$ = -8
_j$2222 = -16
_walk_fixup_memory_subreg PROC NEAR
; Line 3734
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 3739
	cmp	DWORD PTR _x$[ebp], 0
	jne	$L2215
; Line 3740
	sub	eax, eax
	jmp	$L2211
; Line 3742
$L2215:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$[ebp], eax
; Line 3744
	cmp	DWORD PTR _code$[ebp], 35		; 00000023H
	jne	$L2216
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2216
; Line 3745
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_fixup_memory_subreg
	add	esp, 8
	jmp	$L2211
; Line 3749
$L2216:
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_format[eax*4]
	mov	DWORD PTR _fmt$[ebp], eax
; Line 3750
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_length[eax*4]
	dec	eax
	mov	DWORD PTR _i$[ebp], eax
	jmp	$L2217
$L2218:
	dec	DWORD PTR _i$[ebp]
$L2217:
	cmp	DWORD PTR _i$[ebp], 0
	jl	$L2219
; Line 3752
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 101				; 00000065H
	jne	$L2220
; Line 3753
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	push	eax
	call	_walk_fixup_memory_subreg
	add	esp, 8
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [edx+ecx*4+4], eax
; Line 3754
$L2220:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 69					; 00000045H
	jne	$L2221
; Line 3757
	mov	DWORD PTR _j$2222[ebp], 0
	jmp	$L2223
$L2224:
	inc	DWORD PTR _j$2222[ebp]
$L2223:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$2222[ebp]
	cmp	DWORD PTR [eax], ecx
	jbe	$L2225
; Line 3759
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$2222[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	push	eax
	call	_walk_fixup_memory_subreg
	add	esp, 8
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR [edx+ecx*4+4]
	mov	edx, DWORD PTR _j$2222[ebp]
	mov	DWORD PTR [ecx+edx*4+4], eax
	jmp	$L2224
$L2225:
; Line 3761
$L2221:
	jmp	$L2218
$L2219:
; Line 3762
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L2211
; Line 3763
$L2211:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_walk_fixup_memory_subreg ENDP
_j$2242 = -24
_x$ = 8
_insn$ = 12
_i$ = -12
_code$ = -8
_fmt$ = -4
_ad$2233 = -16
_temp$2235 = -20
_fixup_stack_1 PROC NEAR
; Line 3797
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	push	ebx
	push	esi
	push	edi
; Line 3799
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$[ebp], eax
; Line 3802
	cmp	DWORD PTR _code$[ebp], 37		; 00000025H
	jne	$L2232
; Line 3804
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _ad$2233[ebp], eax
; Line 3809
	mov	eax, DWORD PTR _ad$2233[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2234
	mov	eax, DWORD PTR _ad$2233[ebp]
	mov	ecx, DWORD PTR _frame_pointer_rtx
	cmp	DWORD PTR [eax+4], ecx
	jne	$L2234
	mov	eax, DWORD PTR _ad$2233[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2234
; Line 3812
	mov	eax, DWORD PTR _ad$2233[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	call	_memory_address_p
	add	esp, 8
	or	eax, eax
	je	$L2236
; Line 3813
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L2228
; Line 3814
$L2236:
	mov	eax, DWORD PTR _ad$2233[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	call	_gen_reg_rtx
	add	esp, 4
	mov	DWORD PTR _temp$2235[ebp], eax
; Line 3815
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _ad$2233[ebp]
	push	eax
	mov	eax, DWORD PTR _temp$2235[ebp]
	push	eax
	call	_gen_move_insn
	add	esp, 8
	push	eax
	call	_emit_insn_before
	add	esp, 8
; Line 3816
	mov	eax, DWORD PTR _temp$2235[ebp]
	push	eax
	push	0
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_change_address
	add	esp, 12					; 0000000cH
	jmp	$L2228
; Line 3818
$L2234:
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L2228
; Line 3821
$L2232:
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_format[eax*4]
	mov	DWORD PTR _fmt$[ebp], eax
; Line 3822
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_length[eax*4]
	dec	eax
	mov	DWORD PTR _i$[ebp], eax
	jmp	$L2237
$L2238:
	dec	DWORD PTR _i$[ebp]
$L2237:
	cmp	DWORD PTR _i$[ebp], 0
	jl	$L2239
; Line 3824
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 101				; 00000065H
	jne	$L2240
; Line 3825
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	push	eax
	call	_fixup_stack_1
	add	esp, 8
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [edx+ecx*4+4], eax
; Line 3826
$L2240:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 69					; 00000045H
	jne	$L2241
; Line 3829
	mov	DWORD PTR _j$2242[ebp], 0
	jmp	$L2243
$L2244:
	inc	DWORD PTR _j$2242[ebp]
$L2243:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$2242[ebp]
	cmp	DWORD PTR [eax], ecx
	jbe	$L2245
; Line 3830
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$2242[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	push	eax
	call	_fixup_stack_1
	add	esp, 8
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR [edx+ecx*4+4]
	mov	edx, DWORD PTR _j$2242[ebp]
	mov	DWORD PTR [ecx+edx*4+4], eax
	jmp	$L2244
$L2245:
; Line 3832
$L2241:
	jmp	$L2238
$L2239:
; Line 3833
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L2228
; Line 3834
$L2228:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_fixup_stack_1 ENDP
_TEXT	ENDS
EXTRN	_gen_lowpart:NEAR
EXTRN	_mode_dependent_address_p:NEAR
EXTRN	_offsettable_address_p:NEAR
_TEXT	SEGMENT
_body$ = 8
_insn$ = 12
_equiv_mem$ = 16
_bitfield$ = -8
_destflag$ = -4
_memref$2257 = -12
_offset$2268 = -16
_src$2272 = -20
_dest$2280 = -24
_last$2286 = -32
_newreg$2287 = -28
_optimize_bit_field PROC NEAR
; Line 3851
	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H
	push	ebx
	push	esi
	push	edi
; Line 3856
	mov	eax, DWORD PTR _body$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 5832704				; 00590000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L2253
	mov	eax, DWORD PTR _body$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 5898240				; 005a0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2252
$L2253:
; Line 3857
	mov	eax, DWORD PTR _body$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _bitfield$[ebp], eax
	mov	DWORD PTR _destflag$[ebp], 1
; Line 3858
	jmp	$L2254
$L2252:
; Line 3859
	mov	eax, DWORD PTR _body$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _bitfield$[ebp], eax
	mov	DWORD PTR _destflag$[ebp], 0
$L2254:
; Line 3868
	mov	eax, DWORD PTR _bitfield$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2255
	mov	eax, DWORD PTR _bitfield$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2255
	mov	eax, DWORD PTR _bitfield$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _mode_size+4
	shl	ecx, 3
	cmp	DWORD PTR [eax+4], ecx
	je	$L2256
	mov	eax, DWORD PTR _bitfield$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _mode_size+8
	shl	ecx, 3
	cmp	DWORD PTR [eax+4], ecx
	jne	$L2255
$L2256:
	mov	eax, DWORD PTR _bitfield$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	ecx, DWORD PTR _bitfield$[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	mov	eax, DWORD PTR [eax+4]
	cdq
	idiv	DWORD PTR [ecx+4]
	or	edx, edx
	jne	$L2255
; Line 3870
	mov	DWORD PTR _memref$2257[ebp], 0
; Line 3876
	mov	eax, DWORD PTR _bitfield$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2258
; Line 3877
	mov	eax, DWORD PTR _bitfield$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _memref$2257[ebp], eax
; Line 3878
	jmp	$L2259
$L2258:
; Line 3879
	mov	eax, DWORD PTR _bitfield$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2260
	cmp	DWORD PTR _equiv_mem$[ebp], 0
	je	$L2260
; Line 3880
	mov	eax, DWORD PTR _bitfield$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _equiv_mem$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _memref$2257[ebp], eax
; Line 3881
	jmp	$L2261
$L2260:
; Line 3882
	mov	eax, DWORD PTR _bitfield$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2262
	mov	eax, DWORD PTR _bitfield$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2262
; Line 3883
	mov	eax, DWORD PTR _bitfield$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _memref$2257[ebp], eax
; Line 3884
	jmp	$L2263
$L2262:
; Line 3886
	mov	eax, DWORD PTR _bitfield$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2264
	cmp	DWORD PTR _equiv_mem$[ebp], 0
	je	$L2264
	mov	eax, DWORD PTR _bitfield$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2264
; Line 3887
	mov	eax, DWORD PTR _bitfield$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _equiv_mem$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _memref$2257[ebp], eax
; Line 3889
$L2264:
$L2263:
$L2261:
$L2259:
; Line 3891
	cmp	DWORD PTR _memref$2257[ebp], 0
	je	$L2267
	mov	eax, DWORD PTR _memref$2257[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_mode_dependent_address_p
	add	esp, 4
	or	eax, eax
	jne	$L2267
	mov	eax, DWORD PTR _memref$2257[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _bitfield$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	0
	call	_offsettable_address_p
	add	esp, 12					; 0000000cH
	or	eax, eax
	je	$L2267
; Line 3898
	mov	eax, DWORD PTR _bitfield$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	ecx, DWORD PTR _mode_size+4
	shl	ecx, 3
	mov	eax, DWORD PTR [eax+4]
	cdq
	idiv	ecx
	mov	DWORD PTR _offset$2268[ebp], eax
; Line 3899
	mov	eax, DWORD PTR _bitfield$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2269
; Line 3901
	mov	eax, DWORD PTR _bitfield$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	shl	eax, 2
	add	DWORD PTR _offset$2268[ebp], eax
; Line 3910
$L2269:
; Line 3913
	mov	eax, DWORD PTR _memref$2257[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _bitfield$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _mode_size+4
	shl	ecx, 3
	sub	eax, ecx
	cmp	eax, 1
	sbb	eax, eax
	add	eax, 2
	push	eax
	push	37					; 00000025H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _memref$2257[ebp], eax
; Line 3918
	cmp	DWORD PTR _destflag$[ebp], 0
	je	$L2270
; Line 3921
	mov	eax, DWORD PTR _offset$2268[ebp]
	push	eax
	mov	eax, DWORD PTR _memref$2257[ebp]
	push	eax
	call	_adj_offsettable_operand
	add	esp, 8
	mov	ecx, DWORD PTR _body$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 3922
	mov	eax, DWORD PTR _body$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L2271
	mov	eax, DWORD PTR _body$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L2271
	mov	eax, DWORD PTR _body$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L2271
	mov	eax, DWORD PTR _body$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L2271
; Line 3924
	mov	eax, DWORD PTR _body$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _src$2272[ebp], eax
; Line 3926
$L2274:
	mov	eax, DWORD PTR _src$2272[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2275
	mov	eax, DWORD PTR _src$2272[ebp]
	cmp	DWORD PTR [eax+8], 0
	jne	$L2275
; Line 3927
	mov	eax, DWORD PTR _src$2272[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _src$2272[ebp], eax
	jmp	$L2274
$L2275:
; Line 3928
	mov	eax, DWORD PTR _src$2272[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, DWORD PTR _memref$2257[ebp]
	mov	ecx, DWORD PTR [ecx]
	shl	ecx, 8
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L2276
; Line 3929
	mov	eax, DWORD PTR _body$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _memref$2257[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	call	_gen_lowpart
	add	esp, 8
	mov	DWORD PTR _src$2272[ebp], eax
; Line 3930
$L2276:
	mov	eax, DWORD PTR _src$2272[ebp]
	mov	ecx, DWORD PTR _body$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 3932
	jmp	$L2277
$L2271:
; Line 3933
	mov	eax, DWORD PTR _body$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sub	ecx, ecx
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L2278
	mov	eax, DWORD PTR _body$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, DWORD PTR _memref$2257[ebp]
	mov	ecx, DWORD PTR [ecx]
	shl	ecx, 8
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L2278
; Line 3940
	call	_abort
; Line 3941
$L2278:
$L2277:
; Line 3942
	jmp	$L2279
$L2270:
; Line 3944
	mov	eax, DWORD PTR _body$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _dest$2280[ebp], eax
; Line 3947
$L2282:
	mov	eax, DWORD PTR _dest$2280[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2283
	mov	eax, DWORD PTR _dest$2280[ebp]
	cmp	DWORD PTR [eax+8], 0
	jne	$L2283
; Line 3948
	mov	eax, DWORD PTR _dest$2280[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _dest$2280[ebp], eax
	jmp	$L2282
$L2283:
; Line 3949
	mov	eax, DWORD PTR _dest$2280[ebp]
	mov	ecx, DWORD PTR _body$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 3951
	mov	eax, DWORD PTR _offset$2268[ebp]
	push	eax
	mov	eax, DWORD PTR _memref$2257[ebp]
	push	eax
	call	_adj_offsettable_operand
	add	esp, 8
	mov	DWORD PTR _memref$2257[ebp], eax
; Line 3952
	mov	eax, DWORD PTR _dest$2280[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, DWORD PTR _memref$2257[ebp]
	mov	ecx, DWORD PTR [ecx]
	shl	ecx, 8
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L2284
; Line 3953
	mov	eax, DWORD PTR _memref$2257[ebp]
	mov	ecx, DWORD PTR _body$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 3954
	jmp	$L2285
$L2284:
; Line 3957
	call	_get_last_insn
	mov	DWORD PTR _last$2286[ebp], eax
; Line 3958
	mov	eax, DWORD PTR _dest$2280[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	call	_gen_reg_rtx
	add	esp, 4
	mov	DWORD PTR _newreg$2287[ebp], eax
; Line 3960
	mov	eax, DWORD PTR _body$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 5898240				; 005a0000H
	and	ecx, -65536				; ffff0000H
	sub	eax, ecx
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	push	eax
	mov	eax, DWORD PTR _memref$2257[ebp]
	push	eax
	mov	eax, DWORD PTR _newreg$2287[ebp]
	push	eax
	call	_convert_move
	add	esp, 12					; 0000000cH
; Line 3963
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_get_last_insn
	push	eax
	mov	eax, DWORD PTR _last$2286[ebp]
	mov	eax, DWORD PTR [eax+12]
	push	eax
	call	_reorder_insns
	add	esp, 12					; 0000000cH
; Line 3964
	mov	eax, DWORD PTR _newreg$2287[ebp]
	mov	ecx, DWORD PTR _body$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 3965
$L2285:
; Line 3966
$L2279:
; Line 3970
	mov	eax, DWORD PTR _insn$[ebp]
	mov	DWORD PTR [eax+20], -1
; Line 3972
$L2267:
; Line 3973
$L2255:
$L2249:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_optimize_bit_field ENDP
_TEXT	ENDS
PUBLIC	_max_parm_reg_num
_BSS	SEGMENT
_max_parm_reg$S2288 DD 01H DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
_max_parm_reg_num PROC NEAR
; Line 3987
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 3988
	mov	eax, DWORD PTR _max_parm_reg$S2288
	jmp	$L2291
; Line 3989
$L2291:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_max_parm_reg_num ENDP
_TEXT	ENDS
PUBLIC	_get_first_nonparm_insn
_TEXT	SEGMENT
_get_first_nonparm_insn PROC NEAR
; Line 3995
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 3996
	cmp	DWORD PTR _last_parm_insn$S1199, 0
	je	$L2293
; Line 3997
	mov	eax, DWORD PTR _last_parm_insn$S1199
	mov	eax, DWORD PTR [eax+12]
	jmp	$L2292
; Line 3998
$L2293:
	call	_get_insns
	jmp	$L2292
; Line 3999
$L2292:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_get_first_nonparm_insn ENDP
_TEXT	ENDS
_BSS	SEGMENT
_parm_reg_stack_loc$S2289 DD 01H DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
_reg$ = 8
_parm_stack_loc PROC NEAR
; Line 4008
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 4009
	mov	eax, DWORD PTR _reg$[ebp]
	mov	ecx, DWORD PTR _max_parm_reg$S2288
	cmp	DWORD PTR [eax+4], ecx
	jge	$L2296
; Line 4010
	mov	eax, DWORD PTR _reg$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _parm_reg_stack_loc$S2289
	mov	eax, DWORD PTR [ecx+eax*4]
	jmp	$L2295
; Line 4011
$L2296:
	sub	eax, eax
	jmp	$L2295
; Line 4012
$L2295:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_parm_stack_loc ENDP
_TEXT	ENDS
PUBLIC	_aggregate_value_p
EXTRN	_flag_pcc_struct_return:DWORD
_TEXT	SEGMENT
_exp$ = 8
_aggregate_value_p PROC NEAR
; Line 4020
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 4021
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	and	eax, -16777216				; ff000000H
	mov	ecx, 436207616				; 1a000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L2300
; Line 4022
	mov	eax, 1
	jmp	$L2299
; Line 4023
$L2300:
	jmp	$L2301
; Line 4024
	mov	eax, 1
	jmp	$L2299
; Line 4025
$L2301:
; Line 4027
	cmp	DWORD PTR _flag_pcc_struct_return, 0
	je	$L2302
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 19					; 00000013H
	je	$L2303
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 20					; 00000014H
	jne	$L2302
$L2303:
; Line 4028
	mov	eax, 1
	jmp	$L2299
; Line 4029
$L2302:
	sub	eax, eax
	jmp	$L2299
; Line 4030
$L2299:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_aggregate_value_p ENDP
_TEXT	ENDS
PUBLIC	_validize_mem
EXTRN	_memory_address:NEAR
_TEXT	SEGMENT
_ref$ = 8
_validize_mem PROC NEAR
; Line 4038
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 4039
	mov	eax, DWORD PTR _ref$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L2307
; Line 4040
	mov	eax, DWORD PTR _ref$[ebp]
	jmp	$L2306
; Line 4041
$L2307:
	mov	eax, DWORD PTR _ref$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _ref$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	call	_memory_address_p
	add	esp, 8
	or	eax, eax
	je	$L2308
; Line 4042
	mov	eax, DWORD PTR _ref$[ebp]
	jmp	$L2306
; Line 4044
$L2308:
; Line 4045
	mov	eax, DWORD PTR _ref$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _ref$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	call	_memory_address
	add	esp, 8
	push	eax
	mov	eax, DWORD PTR _ref$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	37					; 00000025H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	jmp	$L2306
; Line 4046
$L2306:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_validize_mem ENDP
_TEXT	ENDS
EXTRN	_struct_value_incoming_rtx:DWORD
EXTRN	_move_block_from_reg:NEAR
EXTRN	_memcpy:NEAR
EXTRN	_max_reg_num:NEAR
EXTRN	_size_in_bytes:NEAR
EXTRN	_genop:NEAR
EXTRN	_target_flags:DWORD
EXTRN	_tree_last:NEAR
EXTRN	_int_size_in_bytes:NEAR
_DATA	SEGMENT
$SG2325	DB	'__builtin_va_alist', 00H
_DATA	ENDS
_TEXT	SEGMENT
_sizetree$2369 = -120
_old_bytes$2371 = -124
_s1$2373 = -128
_fndecl$ = 8
_inc$2374 = -132
_parm$ = -12
_entry_parm$ = -44
_stack_parm$ = -40
_args_so_far$ = -36
_passed_mode$ = -52
_nominal_mode$ = -60
_stack_args_size$ = -8
_first_parm_offset$ = -20
_first_parm_caller_offset$ = -32
_fntype$ = -24
_internal_arg_pointer$ = -16
_nparmregs$ = -56
_vararg$ = -48
_parmreg$2389 = -136
_arg_pointer_copied$ = -28
_new$2393 = -140
_aggregate$2331 = -72
_stack_offset$2332 = -68
_stack_offset_rtx$2333 = -76
_where_pad$2334 = -80
_sizetree$2341 = -92
_s1$2342 = -88
_s2$2343 = -84
_inc$2344 = -96
_dec$2349 = -100
_last_named$2356 = -104
_nregs$2358 = -108
_i$2359 = -112
_valid_stack_parm$2362 = -116
_assign_parms PROC NEAR
; Line 4055
	push	ebp
	mov	ebp, esp
	sub	esp, 148				; 00000094H
	push	ebx
	push	esi
	push	edi
; Line 4064
	mov	DWORD PTR _first_parm_offset$[ebp], 8
; Line 4069
	mov	eax, DWORD PTR _first_parm_offset$[ebp]
	mov	DWORD PTR _first_parm_caller_offset$[ebp], eax
; Line 4071
	mov	eax, DWORD PTR _fndecl$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _fntype$[ebp], eax
; Line 4076
	mov	eax, DWORD PTR _fndecl$[ebp]
	mov	eax, DWORD PTR [eax+56]
	push	eax
	call	_list_length
	add	esp, 4
	add	eax, 10					; 0000000aH
	mov	DWORD PTR _nparmregs$[ebp], eax
; Line 4092
	mov	eax, DWORD PTR _fndecl$[ebp]
	cmp	DWORD PTR [eax+56], 0
	je	$L2562
	mov	eax, DWORD PTR _fndecl$[ebp]
	mov	eax, DWORD PTR [eax+56]
	cmp	DWORD PTR [eax+40], 0
	je	$L2562
	push	OFFSET $SG2325
	mov	eax, DWORD PTR _fndecl$[ebp]
	mov	eax, DWORD PTR [eax+56]
	mov	eax, DWORD PTR [eax+40]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	je	$L2561
$L2562:
	mov	eax, DWORD PTR _fntype$[ebp]
	cmp	DWORD PTR [eax+20], 0
	je	$L2559
	mov	eax, DWORD PTR _fntype$[ebp]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	call	_tree_last
	add	esp, 4
	mov	ecx, DWORD PTR _void_type_node
	cmp	DWORD PTR [eax+24], ecx
	je	$L2559
$L2561:
	mov	DWORD PTR _vararg$[ebp], 1
	jmp	$L2560
$L2559:
	mov	DWORD PTR _vararg$[ebp], 0
$L2560:
; Line 4093
	mov	DWORD PTR _arg_pointer_copied$[ebp], 0
; Line 4096
	mov	eax, DWORD PTR _arg_pointer_rtx
	mov	DWORD PTR _internal_arg_pointer$[ebp], eax
; Line 4109
	mov	DWORD PTR _stack_args_size$[ebp], 0
; Line 4110
	mov	DWORD PTR _stack_args_size$[ebp+4], 0
; Line 4114
	mov	eax, DWORD PTR _fndecl$[ebp]
	mov	eax, DWORD PTR [eax+60]
	push	eax
	call	_aggregate_value_p
	add	esp, 4
	or	eax, eax
	je	$L2327
	mov	eax, DWORD PTR _struct_value_incoming_rtx
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2327
; Line 4123
	mov	eax, DWORD PTR _mode_size+16
	add	DWORD PTR _stack_args_size$[ebp], eax
; Line 4126
$L2327:
	mov	eax, DWORD PTR _nparmregs$[ebp]
	shl	eax, 2
	push	eax
	call	_oballoc
	add	esp, 4
	mov	DWORD PTR _parm_reg_stack_loc$S2289, eax
; Line 4127
	mov	eax, DWORD PTR _nparmregs$[ebp]
	shl	eax, 2
	push	eax
	push	0
	mov	eax, DWORD PTR _parm_reg_stack_loc$S2289
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 4129
	mov	DWORD PTR _args_so_far$[ebp], 0
; Line 4131
	mov	eax, DWORD PTR _fndecl$[ebp]
	mov	eax, DWORD PTR [eax+56]
	mov	DWORD PTR _parm$[ebp], eax
	jmp	$L2328
$L2329:
	mov	eax, DWORD PTR _parm$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _parm$[ebp], eax
$L2328:
	cmp	DWORD PTR _parm$[ebp], 0
	je	$L2330
; Line 4136
	mov	eax, DWORD PTR _parm$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 16					; 00000010H
	je	$L2565
	mov	eax, DWORD PTR _parm$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 19					; 00000013H
	je	$L2565
	mov	eax, DWORD PTR _parm$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 20					; 00000014H
	jne	$L2563
$L2565:
	mov	DWORD PTR _aggregate$2331[ebp], 1
	jmp	$L2564
$L2563:
	mov	DWORD PTR _aggregate$2331[ebp], 0
$L2564:
; Line 4141
	mov	eax, DWORD PTR _parm$[ebp]
	mov	DWORD PTR [eax+48], -1
; Line 4147
	mov	eax, DWORD PTR _parm$[ebp]
	mov	ecx, DWORD PTR _error_mark_node
	cmp	DWORD PTR [eax+8], ecx
	je	$L2336
	mov	eax, DWORD PTR _parm$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 44					; 0000002cH
	jne	$L2336
	mov	eax, DWORD PTR _parm$[ebp]
	cmp	DWORD PTR [eax+56], 0
	jne	$L2335
$L2336:
; Line 4149
	mov	eax, DWORD PTR _const0_rtx
	push	eax
	push	26					; 0000001aH
	push	37					; 00000025H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _parm$[ebp]
	mov	DWORD PTR [ecx+76], eax
; Line 4150
	mov	eax, DWORD PTR _parm$[ebp]
	mov	eax, DWORD PTR [eax+16]
	or	eax, 32768				; 00008000H
	mov	ecx, DWORD PTR _parm$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 4151
	jmp	$L2329
; Line 4156
$L2335:
	mov	eax, DWORD PTR _parm$[ebp]
	mov	eax, DWORD PTR [eax+56]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	sar	eax, 24					; 00000018H
	mov	DWORD PTR _passed_mode$[ebp], eax
; Line 4157
	mov	eax, DWORD PTR _parm$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	sar	eax, 24					; 00000018H
	mov	DWORD PTR _nominal_mode$[ebp], eax
; Line 4160
	mov	eax, DWORD PTR _stack_args_size$[ebp]
	mov	ecx, DWORD PTR _stack_args_size$[ebp+4]
	mov	DWORD PTR _stack_offset$2332[ebp], eax
	mov	DWORD PTR _stack_offset$2332[ebp+4], ecx
; Line 4161
	mov	eax, DWORD PTR _first_parm_offset$[ebp]
	add	DWORD PTR _stack_offset$2332[ebp], eax
; Line 4200
	mov	DWORD PTR _where_pad$2334[ebp], 1
; Line 4208
	cmp	DWORD PTR _where_pad$2334[ebp], 2
	jne	$L2337
; Line 4210
	cmp	DWORD PTR _passed_mode$[ebp], 26	; 0000001aH
	je	$L2338
; Line 4212
	mov	eax, DWORD PTR _passed_mode$[ebp]
	mov	eax, DWORD PTR _mode_size[eax*4]
	shl	eax, 3
	cdq
	xor	eax, edx
	sub	eax, edx
	and	eax, 31					; 0000001fH
	xor	eax, edx
	sub	eax, edx
	je	$L2339
; Line 4216
	mov	eax, DWORD PTR _passed_mode$[ebp]
	mov	eax, DWORD PTR _mode_size[eax*4]
	lea	eax, DWORD PTR [eax*8+31]
	cdq
	and	edx, 31					; 0000001fH
	add	eax, edx
	sar	eax, 5
	shl	eax, 5
	cdq
	and	edx, 7
	add	eax, edx
	sar	eax, 3
	mov	ecx, DWORD PTR _passed_mode$[ebp]
	sub	eax, DWORD PTR _mode_size[ecx*4]
	add	DWORD PTR _stack_offset$2332[ebp], eax
; Line 4217
$L2339:
; Line 4218
	jmp	$L2340
$L2338:
; Line 4220
	mov	eax, DWORD PTR _parm$[ebp]
	mov	eax, DWORD PTR [eax+56]
	push	eax
	call	_size_in_bytes
	add	esp, 4
	mov	DWORD PTR _sizetree$2341[ebp], eax
; Line 4222
	push	32					; 00000020H
	push	8
	mov	eax, DWORD PTR _sizetree$2341[ebp]
	push	eax
	call	_convert_units
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _s1$2342[ebp], eax
; Line 4223
	push	8
	push	32					; 00000020H
	mov	eax, DWORD PTR _s1$2342[ebp]
	push	eax
	call	_convert_units
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _s2$2343[ebp], eax
; Line 4225
	mov	eax, DWORD PTR _s2$2343[ebp]
	mov	DWORD PTR _inc$2344[ebp], eax
	mov	eax, DWORD PTR _inc$2344[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L2345
	mov	eax, DWORD PTR _inc$2344[ebp]
	mov	eax, DWORD PTR [eax+20]
	add	DWORD PTR _stack_offset$2332[ebp], eax
	jmp	$L2346
$L2345:
	cmp	DWORD PTR _stack_offset$2332[ebp+4], 0
	jne	$L2347
	mov	eax, DWORD PTR _inc$2344[ebp]
	mov	DWORD PTR _stack_offset$2332[ebp+4], eax
	jmp	$L2348
$L2347:
	mov	eax, DWORD PTR _inc$2344[ebp]
	push	eax
	mov	eax, DWORD PTR _stack_offset$2332[ebp+4]
	push	eax
	push	64					; 00000040H
	call	_genop
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _stack_offset$2332[ebp+4], eax
$L2348:
$L2346:
; Line 4226
	mov	eax, DWORD PTR _sizetree$2341[ebp]
	mov	DWORD PTR _dec$2349[ebp], eax
	mov	eax, DWORD PTR _dec$2349[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L2350
	sub	eax, eax
	mov	ecx, DWORD PTR _dec$2349[ebp]
	sub	eax, DWORD PTR [ecx+20]
	neg	eax
	sub	DWORD PTR _stack_offset$2332[ebp], eax
	jmp	$L2351
$L2350:
	cmp	DWORD PTR _stack_offset$2332[ebp+4], 0
	jne	$L2352
	mov	eax, DWORD PTR _dec$2349[ebp]
	push	eax
	mov	eax, DWORD PTR _integer_zero_node
	push	eax
	push	65					; 00000041H
	call	_genop
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _stack_offset$2332[ebp+4], eax
	jmp	$L2353
$L2352:
	mov	eax, DWORD PTR _dec$2349[ebp]
	push	eax
	mov	eax, DWORD PTR _stack_offset$2332[ebp+4]
	push	eax
	push	65					; 00000041H
	call	_genop
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _stack_offset$2332[ebp+4], eax
$L2353:
$L2351:
; Line 4227
$L2340:
; Line 4232
$L2337:
	mov	DWORD PTR _entry_parm$[ebp], 0
; Line 4235
	mov	eax, DWORD PTR _parm$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+28]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	je	$L2355
	cmp	DWORD PTR _stack_offset$2332[ebp+4], 0
	je	$L2354
$L2355:
; Line 4239
	mov	eax, DWORD PTR _parm$[ebp]
	cmp	DWORD PTR [eax+4], 0
	jne	$L2566
	cmp	DWORD PTR _vararg$[ebp], 0
	je	$L2566
	mov	DWORD PTR _last_named$2356[ebp], 1
	jmp	$L2567
$L2566:
	mov	DWORD PTR _last_named$2356[ebp], 0
$L2567:
; Line 4247
	test	BYTE PTR _target_flags, 16		; 00000010H
	je	$L2568
	cmp	DWORD PTR _args_so_far$[ebp], 8
	jge	$L2568
	mov	eax, DWORD PTR _args_so_far$[ebp]
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	push	eax
	mov	eax, DWORD PTR _passed_mode$[ebp]
	push	eax
	push	34					; 00000022H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _entry_parm$[ebp], eax
	jmp	$L2569
$L2568:
	mov	DWORD PTR _entry_parm$[ebp], 0
$L2569:
; Line 4264
$L2354:
	cmp	DWORD PTR _stack_offset$2332[ebp+4], 0
	jne	$L2570
	mov	eax, DWORD PTR _stack_offset$2332[ebp]
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _stack_offset_rtx$2333[ebp], eax
	jmp	$L2571
$L2570:
	mov	eax, DWORD PTR _stack_offset$2332[ebp]
	push	eax
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _stack_offset$2332[ebp+4]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	push	eax
	call	_plus_constant
	add	esp, 8
	mov	DWORD PTR _stack_offset_rtx$2333[ebp], eax
$L2571:
; Line 4276
	mov	eax, DWORD PTR _stack_offset_rtx$2333[ebp]
	push	eax
	mov	eax, DWORD PTR _internal_arg_pointer$[ebp]
	push	eax
	push	4
	push	44					; 0000002cH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _passed_mode$[ebp]
	push	eax
	push	37					; 00000025H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _stack_parm$[ebp], eax
; Line 4280
	mov	eax, DWORD PTR _stack_parm$[ebp]
	mov	eax, DWORD PTR [eax]
	and	eax, -268435457				; efffffffH
	mov	ecx, DWORD PTR _aggregate$2331[ebp]
	and	ecx, 1
	shl	ecx, 28					; 0000001cH
	or	eax, ecx
	mov	ecx, DWORD PTR _stack_parm$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 4290
	cmp	DWORD PTR _entry_parm$[ebp], 0
	je	$L2357
; Line 4292
	mov	DWORD PTR _nregs$2358[ebp], 0
; Line 4296
	test	BYTE PTR _target_flags, 16		; 00000010H
	je	$L2572
	cmp	DWORD PTR _args_so_far$[ebp], 8
	jge	$L2572
	cmp	DWORD PTR _passed_mode$[ebp], 26	; 0000001aH
	jne	$L2574
	mov	eax, DWORD PTR _parm$[ebp]
	mov	eax, DWORD PTR [eax+56]
	push	eax
	call	_int_size_in_bytes
	add	esp, 4
	mov	DWORD PTR -144+[ebp], eax
	jmp	$L2575
$L2574:
	mov	eax, DWORD PTR _passed_mode$[ebp]
	mov	eax, DWORD PTR _mode_size[eax*4]
	mov	DWORD PTR -144+[ebp], eax
$L2575:
	mov	eax, DWORD PTR _args_so_far$[ebp]
	add	eax, DWORD PTR -144+[ebp]
	cmp	eax, 8
	jle	$L2572
	mov	ecx, 2
	mov	eax, DWORD PTR _args_so_far$[ebp]
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	sub	ecx, eax
	mov	DWORD PTR _nregs$2358[ebp], ecx
	jmp	$L2573
$L2572:
	mov	DWORD PTR _nregs$2358[ebp], 0
$L2573:
; Line 4314
	cmp	DWORD PTR _nregs$2358[ebp], 0
	jle	$L2361
; Line 4316
	mov	eax, DWORD PTR _stack_parm$[ebp]
	push	eax
	call	_validize_mem
	add	esp, 4
	mov	DWORD PTR _valid_stack_parm$2362[ebp], eax
; Line 4320
	mov	eax, DWORD PTR _nregs$2358[ebp]
	lea	eax, DWORD PTR [eax*4+3]
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	shl	eax, 2
	mov	DWORD PTR _current_function_pretend_args_size, eax
; Line 4322
	mov	eax, DWORD PTR _nregs$2358[ebp]
	mov	DWORD PTR _i$2359[ebp], eax
; Line 4323
$L2364:
	dec	DWORD PTR _i$2359[ebp]
	js	$L2365
; Line 4327
	mov	eax, DWORD PTR _entry_parm$[ebp]
	mov	eax, DWORD PTR [eax+4]
	add	eax, DWORD PTR _i$2359[ebp]
	push	eax
	push	4
	push	34					; 00000022H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _mode_size+16
	imul	eax, DWORD PTR _i$2359[ebp]
	push	eax
	mov	eax, DWORD PTR _valid_stack_parm$2362[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_plus_constant
	add	esp, 8
	push	eax
	push	4
	push	37					; 00000025H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	call	_emit_move_insn
	add	esp, 8
	jmp	$L2364
$L2365:
; Line 4328
	mov	eax, DWORD PTR _stack_parm$[ebp]
	mov	DWORD PTR _entry_parm$[ebp], eax
; Line 4330
$L2361:
; Line 4334
$L2357:
	cmp	DWORD PTR _entry_parm$[ebp], 0
	jne	$L2366
; Line 4335
	mov	eax, DWORD PTR _stack_parm$[ebp]
	mov	DWORD PTR _entry_parm$[ebp], eax
; Line 4339
$L2366:
	mov	eax, DWORD PTR _stack_parm$[ebp]
	cmp	DWORD PTR _entry_parm$[ebp], eax
	jne	$L2367
; Line 4340
	mov	eax, DWORD PTR _stack_offset$2332[ebp]
	shl	eax, 3
	mov	ecx, DWORD PTR _parm$[ebp]
	mov	DWORD PTR [ecx+48], eax
; Line 4346
$L2367:
; Line 4352
	mov	eax, DWORD PTR _stack_parm$[ebp]
	cmp	DWORD PTR _entry_parm$[ebp], eax
	jne	$L2368
; Line 4354
	mov	eax, DWORD PTR _parm$[ebp]
	mov	eax, DWORD PTR [eax+56]
	push	eax
	call	_size_in_bytes
	add	esp, 4
	mov	DWORD PTR _sizetree$2369[ebp], eax
; Line 4358
	mov	eax, DWORD PTR _parm$[ebp]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	and	eax, -16777216				; ff000000H
	mov	ecx, 436207616				; 1a000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L2370
; Line 4360
	mov	eax, DWORD PTR _parm$[ebp]
	mov	eax, DWORD PTR [eax+56]
	push	eax
	call	_int_size_in_bytes
	add	esp, 4
	mov	DWORD PTR _old_bytes$2371[ebp], eax
; Line 4361
	push	0
	mov	eax, DWORD PTR _old_bytes$2371[ebp]
	inc	eax
	and	eax, -2					; fffffffeH
	push	eax
	call	_build_int_2
	add	esp, 8
	mov	DWORD PTR _sizetree$2369[ebp], eax
; Line 4364
$L2370:
	cmp	DWORD PTR _where_pad$2334[ebp], 0
	je	$L2372
; Line 4367
	push	32					; 00000020H
	push	8
	mov	eax, DWORD PTR _sizetree$2369[ebp]
	push	eax
	call	_convert_units
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _s1$2373[ebp], eax
; Line 4368
	push	8
	push	32					; 00000020H
	mov	eax, DWORD PTR _s1$2373[ebp]
	push	eax
	call	_convert_units
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _sizetree$2369[ebp], eax
; Line 4371
$L2372:
	mov	eax, DWORD PTR _sizetree$2369[ebp]
	mov	DWORD PTR _inc$2374[ebp], eax
	mov	eax, DWORD PTR _inc$2374[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L2375
	mov	eax, DWORD PTR _inc$2374[ebp]
	mov	eax, DWORD PTR [eax+20]
	add	DWORD PTR _stack_args_size$[ebp], eax
	jmp	$L2376
$L2375:
	cmp	DWORD PTR _stack_args_size$[ebp+4], 0
	jne	$L2377
	mov	eax, DWORD PTR _inc$2374[ebp]
	mov	DWORD PTR _stack_args_size$[ebp+4], eax
	jmp	$L2378
$L2377:
	mov	eax, DWORD PTR _inc$2374[ebp]
	push	eax
	mov	eax, DWORD PTR _stack_args_size$[ebp+4]
	push	eax
	push	64					; 00000040H
	call	_genop
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _stack_args_size$[ebp+4], eax
$L2378:
$L2376:
; Line 4373
	jmp	$L2379
$L2368:
; Line 4375
	mov	DWORD PTR _stack_parm$[ebp], 0
$L2379:
; Line 4384
	cmp	DWORD PTR _nominal_mode$[ebp], 26	; 0000001aH
	je	$L2380
	mov	eax, DWORD PTR _passed_mode$[ebp]
	cmp	DWORD PTR _nominal_mode$[ebp], eax
	je	$L2380
	cmp	DWORD PTR _stack_parm$[ebp], 0
	je	$L2380
; Line 4400
	mov	eax, DWORD PTR _stack_offset_rtx$2333[ebp]
	push	eax
	mov	eax, DWORD PTR _arg_pointer_rtx
	push	eax
	push	4
	push	44					; 0000002cH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _nominal_mode$[ebp]
	push	eax
	push	37					; 00000025H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _stack_parm$[ebp], eax
; Line 4404
	mov	eax, DWORD PTR _stack_parm$[ebp]
	mov	eax, DWORD PTR [eax]
	and	eax, -268435457				; efffffffH
	mov	ecx, DWORD PTR _aggregate$2331[ebp]
	and	ecx, 1
	shl	ecx, 28					; 0000001cH
	or	eax, ecx
	mov	ecx, DWORD PTR _stack_parm$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 4421
$L2380:
	cmp	DWORD PTR _nominal_mode$[ebp], 26	; 0000001aH
	jne	$L2381
; Line 4424
	mov	eax, DWORD PTR _entry_parm$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2382
; Line 4448
	cmp	DWORD PTR _stack_parm$[ebp], 0
	jne	$L2383
; Line 4451
	mov	eax, DWORD PTR _parm$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_int_size_in_bytes
	add	esp, 4
	push	eax
	mov	eax, DWORD PTR _entry_parm$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	call	_assign_stack_local
	add	esp, 8
	mov	DWORD PTR _stack_parm$[ebp], eax
; Line 4453
$L2383:
; Line 4457
	mov	eax, DWORD PTR _parm$[ebp]
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
	mov	eax, DWORD PTR _stack_parm$[ebp]
	push	eax
	call	_validize_mem
	add	esp, 4
	push	eax
	mov	eax, DWORD PTR _entry_parm$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_move_block_from_reg
	add	esp, 12					; 0000000cH
; Line 4459
$L2382:
	mov	eax, DWORD PTR _stack_parm$[ebp]
	mov	ecx, DWORD PTR _parm$[ebp]
	mov	DWORD PTR [ecx+76], eax
; Line 4461
	jmp	$L2385
$L2381:
; Line 4469
	cmp	DWORD PTR _obey_regdecls, 0
	je	$L2387
	mov	eax, DWORD PTR _parm$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 10					; 0000000aH
	test	al, 1
	jne	$L2387
	mov	eax, DWORD PTR _fndecl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 14					; 0000000eH
	test	al, 1
	je	$L2386
$L2387:
	mov	eax, DWORD PTR _parm$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 9
	test	al, 1
	jne	$L2386
	mov	eax, DWORD PTR _parm$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 3
	test	al, 1
	jne	$L2386
	cmp	DWORD PTR _flag_float_store, 0
	je	$L2388
	mov	eax, DWORD PTR _parm$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 6
	je	$L2386
$L2388:
; Line 4472
	mov	eax, DWORD PTR _nominal_mode$[ebp]
	push	eax
	call	_gen_reg_rtx
	add	esp, 4
	mov	DWORD PTR _parmreg$2389[ebp], eax
; Line 4474
	mov	eax, DWORD PTR _parmreg$2389[ebp]
	mov	eax, DWORD PTR [eax]
	or	eax, 134217728				; 08000000H
	mov	ecx, DWORD PTR _parmreg$2389[ebp]
	mov	DWORD PTR [ecx], eax
; Line 4475
	mov	eax, DWORD PTR _parmreg$2389[ebp]
	mov	ecx, DWORD PTR _parm$[ebp]
	mov	DWORD PTR [ecx+76], eax
; Line 4478
	mov	eax, DWORD PTR _parmreg$2389[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, DWORD PTR _entry_parm$[ebp]
	mov	ecx, DWORD PTR [ecx]
	shl	ecx, 8
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L2390
; Line 4479
	push	0
	mov	eax, DWORD PTR _entry_parm$[ebp]
	push	eax
	call	_validize_mem
	add	esp, 4
	push	eax
	mov	eax, DWORD PTR _parmreg$2389[ebp]
	push	eax
	call	_convert_move
	add	esp, 12					; 0000000cH
; Line 4480
	jmp	$L2391
$L2390:
; Line 4481
	mov	eax, DWORD PTR _entry_parm$[ebp]
	push	eax
	call	_validize_mem
	add	esp, 4
	push	eax
	mov	eax, DWORD PTR _parmreg$2389[ebp]
	push	eax
	call	_emit_move_insn
	add	esp, 8
$L2391:
; Line 4485
	mov	eax, DWORD PTR _parmreg$2389[ebp]
	mov	ecx, DWORD PTR _nparmregs$[ebp]
	cmp	DWORD PTR [eax+4], ecx
	jl	$L2392
; Line 4488
	mov	eax, DWORD PTR _parmreg$2389[ebp]
	mov	eax, DWORD PTR [eax+4]
	add	eax, 5
	mov	DWORD PTR _nparmregs$[ebp], eax
; Line 4489
	mov	eax, DWORD PTR _nparmregs$[ebp]
	shl	eax, 2
	push	eax
	call	_oballoc
	add	esp, 4
	mov	DWORD PTR _new$2393[ebp], eax
; Line 4490
	mov	eax, DWORD PTR _nparmregs$[ebp]
	shl	eax, 2
	push	eax
	mov	eax, DWORD PTR _parm_reg_stack_loc$S2289
	push	eax
	mov	eax, DWORD PTR _new$2393[ebp]
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
; Line 4491
	mov	eax, DWORD PTR _new$2393[ebp]
	mov	DWORD PTR _parm_reg_stack_loc$S2289, eax
; Line 4493
$L2392:
	mov	eax, DWORD PTR _stack_parm$[ebp]
	mov	ecx, DWORD PTR _parmreg$2389[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	mov	edx, DWORD PTR _parm_reg_stack_loc$S2289
	mov	DWORD PTR [edx+ecx*4], eax
; Line 4503
	mov	eax, DWORD PTR _passed_mode$[ebp]
	cmp	DWORD PTR _nominal_mode$[ebp], eax
	jne	$L2395
	mov	eax, DWORD PTR _entry_parm$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2395
	cmp	DWORD PTR _stack_offset$2332[ebp+4], 0
	jne	$L2395
	cmp	DWORD PTR _arg_pointer_copied$[ebp], 0
	jne	$L2395
; Line 4506
	call	_get_last_insn
	mov	DWORD PTR -148+[ebp], eax
	call	_get_last_insn
	mov	eax, DWORD PTR [eax+28]
	push	eax
	mov	eax, DWORD PTR _entry_parm$[ebp]
	push	eax
	push	3
	push	2
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	ecx, DWORD PTR -148+[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 4509
$L2395:
	mov	eax, DWORD PTR _parm$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 11					; 0000000bH
	jne	$L2396
; Line 4510
	mov	eax, DWORD PTR _parmreg$2389[ebp]
	push	eax
	call	_mark_reg_pointer
	add	esp, 4
; Line 4511
$L2396:
; Line 4512
	jmp	$L2397
$L2386:
; Line 4517
	mov	eax, DWORD PTR _passed_mode$[ebp]
	cmp	DWORD PTR _nominal_mode$[ebp], eax
	je	$L2398
; Line 4520
	push	0
	mov	eax, DWORD PTR _entry_parm$[ebp]
	push	eax
	call	_validize_mem
	add	esp, 4
	push	eax
	mov	eax, DWORD PTR _nominal_mode$[ebp]
	push	eax
	call	_convert_to_mode
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _entry_parm$[ebp], eax
; Line 4522
$L2398:
	mov	eax, DWORD PTR _stack_parm$[ebp]
	cmp	DWORD PTR _entry_parm$[ebp], eax
	je	$L2399
; Line 4524
	cmp	DWORD PTR _stack_parm$[ebp], 0
	jne	$L2400
; Line 4526
	mov	eax, DWORD PTR _entry_parm$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	push	eax
	mov	eax, DWORD PTR _entry_parm$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	call	_assign_stack_local
	add	esp, 8
	mov	DWORD PTR _stack_parm$[ebp], eax
; Line 4527
$L2400:
; Line 4528
	mov	eax, DWORD PTR _entry_parm$[ebp]
	push	eax
	call	_validize_mem
	add	esp, 4
	push	eax
	mov	eax, DWORD PTR _stack_parm$[ebp]
	push	eax
	call	_validize_mem
	add	esp, 4
	push	eax
	call	_emit_move_insn
	add	esp, 8
; Line 4531
$L2399:
	mov	eax, DWORD PTR _stack_parm$[ebp]
	mov	ecx, DWORD PTR _parm$[ebp]
	mov	DWORD PTR [ecx+76], eax
; Line 4532
	mov	DWORD PTR _frame_pointer_needed, 1
; Line 4533
$L2397:
$L2385:
; Line 4535
	mov	eax, DWORD PTR _parm$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 3
	test	al, 1
	je	$L2401
; Line 4536
	mov	eax, DWORD PTR _parm$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax]
	or	eax, 134217728				; 08000000H
	mov	ecx, DWORD PTR _parm$[ebp]
	mov	ecx, DWORD PTR [ecx+76]
	mov	DWORD PTR [ecx], eax
; Line 4537
$L2401:
	mov	eax, DWORD PTR _parm$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 5
	test	al, 1
	je	$L2402
; Line 4538
	mov	eax, DWORD PTR _parm$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax]
	or	eax, 67108864				; 04000000H
	mov	ecx, DWORD PTR _parm$[ebp]
	mov	ecx, DWORD PTR [ecx+76]
	mov	DWORD PTR [ecx], eax
; Line 4542
$L2402:
	cmp	DWORD PTR _passed_mode$[ebp], 26	; 0000001aH
	je	$L2576
	mov	eax, DWORD PTR _passed_mode$[ebp]
	mov	eax, DWORD PTR _mode_size[eax*4]
	add	eax, 3
	and	eax, -4					; fffffffcH
	add	DWORD PTR _args_so_far$[ebp], eax
	jmp	$L2577
$L2576:
	mov	eax, DWORD PTR _parm$[ebp]
	mov	eax, DWORD PTR [eax+56]
	push	eax
	call	_int_size_in_bytes
	add	esp, 4
	add	eax, 3
	and	eax, -4					; fffffffcH
	add	DWORD PTR _args_so_far$[ebp], eax
$L2577:
; Line 4543
	jmp	$L2329
$L2330:
; Line 4545
	call	_max_reg_num
	mov	DWORD PTR _max_parm_reg$S2288, eax
; Line 4546
	call	_get_last_insn
	mov	DWORD PTR _last_parm_insn$S1199, eax
; Line 4548
	mov	eax, DWORD PTR _stack_args_size$[ebp]
	mov	DWORD PTR _current_function_args_size, eax
; Line 4550
	mov	eax, DWORD PTR _first_parm_offset$[ebp]
	add	DWORD PTR _stack_args_size$[ebp], eax
; Line 4551
	cmp	DWORD PTR _stack_args_size$[ebp+4], 0
	jne	$L2578
	mov	eax, DWORD PTR _stack_args_size$[ebp]
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _current_function_arg_offset_rtx, eax
	jmp	$L2579
$L2578:
	mov	eax, DWORD PTR _stack_args_size$[ebp]
	push	eax
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _stack_args_size$[ebp+4]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	push	eax
	call	_plus_constant
	add	esp, 8
	mov	DWORD PTR _current_function_arg_offset_rtx, eax
$L2579:
; Line 4552
$L2311:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_assign_parms ENDP
_TEXT	ENDS
PUBLIC	_get_structure_value_addr
_BSS	SEGMENT
_max_structure_value_size$S2404 DD 01H DUP (?)
_structure_value$S2405 DD 01H DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
_sizex$ = 8
_size$ = -4
_get_structure_value_addr PROC NEAR
; Line 4574
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 4576
	mov	eax, DWORD PTR _sizex$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L2409
; Line 4577
	call	_abort
; Line 4578
$L2409:
	mov	eax, DWORD PTR _sizex$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _size$[ebp], eax
; Line 4583
	mov	eax, DWORD PTR _size$[ebp]
	add	eax, 3
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	shl	eax, 2
	mov	DWORD PTR _size$[ebp], eax
; Line 4587
	mov	eax, DWORD PTR _max_structure_value_size$S2404
	cmp	DWORD PTR _size$[ebp], eax
	jle	$L2410
; Line 4589
	mov	eax, DWORD PTR _size$[ebp]
	mov	DWORD PTR _max_structure_value_size$S2404, eax
; Line 4590
	mov	eax, DWORD PTR _size$[ebp]
	push	eax
	push	26					; 0000001aH
	call	_assign_stack_local
	add	esp, 8
	mov	DWORD PTR _structure_value$S2405, eax
; Line 4591
	mov	eax, DWORD PTR _structure_value$S2405
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2411
; Line 4592
	mov	eax, DWORD PTR _structure_value$S2405
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _structure_value$S2405, eax
; Line 4593
$L2411:
; Line 4595
$L2410:
	mov	eax, DWORD PTR _structure_value$S2405
	jmp	$L2407
; Line 4596
$L2407:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_get_structure_value_addr ENDP
_TEXT	ENDS
PUBLIC	_push_structure_value
_TEXT	SEGMENT
_rtx_ptr$ = 8
_size_ptr$ = 12
_push_structure_value PROC NEAR
; Line 4604
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 4605
	mov	eax, DWORD PTR _structure_value$S2405
	mov	ecx, DWORD PTR _rtx_ptr$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 4606
	mov	eax, DWORD PTR _max_structure_value_size$S2404
	mov	ecx, DWORD PTR _size_ptr$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 4607
	mov	DWORD PTR _max_structure_value_size$S2404, 0
; Line 4608
	mov	DWORD PTR _structure_value$S2405, 0
; Line 4609
$L2415:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_push_structure_value ENDP
_TEXT	ENDS
PUBLIC	_pop_structure_value
_TEXT	SEGMENT
_rtx_value$ = 8
_size$ = 12
_pop_structure_value PROC NEAR
; Line 4615
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 4616
	mov	eax, DWORD PTR _rtx_value$[ebp]
	mov	DWORD PTR _structure_value$S2405, eax
; Line 4617
	mov	eax, DWORD PTR _size$[ebp]
	mov	DWORD PTR _max_structure_value_size$S2404, eax
; Line 4618
$L2419:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_pop_structure_value ENDP
_TEXT	ENDS
PUBLIC	_uninitialized_vars_warning
EXTRN	_regno_uninitialized:NEAR
EXTRN	_regno_clobbered_at_setjmp:NEAR
_DATA	SEGMENT
	ORG $+1
$SG2430	DB	'`%s'' may be used uninitialized in this function', 00H
$SG2433	DB	'variable `%s'' may be clobbered by `longjmp''', 00H
_DATA	ENDS
_TEXT	SEGMENT
_block$ = 8
_decl$ = -4
_sub$ = -8
_uninitialized_vars_warning PROC NEAR
; Line 4629
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 4631
	mov	eax, DWORD PTR _block$[ebp]
	mov	eax, DWORD PTR [eax+32]
	mov	DWORD PTR _decl$[ebp], eax
	jmp	$L2425
$L2426:
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _decl$[ebp], eax
$L2425:
	cmp	DWORD PTR _decl$[ebp], 0
	je	$L2427
; Line 4643
	mov	eax, DWORD PTR _decl$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 43					; 0000002bH
	jne	$L2429
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 19					; 00000013H
	je	$L2429
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 20					; 00000014H
	je	$L2429
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 16					; 00000010H
	je	$L2429
	mov	eax, DWORD PTR _decl$[ebp]
	cmp	DWORD PTR [eax+76], 0
	je	$L2429
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2429
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_regno_uninitialized
	add	esp, 4
	or	eax, eax
	je	$L2429
; Line 4645
	push	OFFSET $SG2430
	mov	eax, DWORD PTR _decl$[ebp]
	push	eax
	call	_warning_with_decl
	add	esp, 8
; Line 4646
$L2429:
; Line 4649
	mov	eax, DWORD PTR _decl$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 43					; 0000002bH
	jne	$L2432
	mov	eax, DWORD PTR _decl$[ebp]
	cmp	DWORD PTR [eax+76], 0
	je	$L2432
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2432
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_regno_clobbered_at_setjmp
	add	esp, 4
	or	eax, eax
	je	$L2432
; Line 4651
	push	OFFSET $SG2433
	mov	eax, DWORD PTR _decl$[ebp]
	push	eax
	call	_warning_with_decl
	add	esp, 8
; Line 4652
$L2432:
	jmp	$L2426
$L2427:
; Line 4653
	mov	eax, DWORD PTR _block$[ebp]
	mov	eax, DWORD PTR [eax+48]
	mov	DWORD PTR _sub$[ebp], eax
	jmp	$L2434
$L2435:
	mov	eax, DWORD PTR _sub$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _sub$[ebp], eax
$L2434:
	cmp	DWORD PTR _sub$[ebp], 0
	je	$L2436
; Line 4654
	mov	eax, DWORD PTR _sub$[ebp]
	push	eax
	call	_uninitialized_vars_warning
	add	esp, 4
	jmp	$L2435
$L2436:
; Line 4655
$L2422:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_uninitialized_vars_warning ENDP
_TEXT	ENDS
PUBLIC	_setjmp_protect
_TEXT	SEGMENT
_block$ = 8
_decl$ = -4
_sub$ = -8
_setjmp_protect PROC NEAR
; Line 4663
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 4665
	mov	eax, DWORD PTR _block$[ebp]
	mov	eax, DWORD PTR [eax+32]
	mov	DWORD PTR _decl$[ebp], eax
	jmp	$L2442
$L2443:
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _decl$[ebp], eax
$L2442:
	cmp	DWORD PTR _decl$[ebp], 0
	je	$L2444
; Line 4670
	mov	eax, DWORD PTR _decl$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 43					; 0000002bH
	je	$L2446
	mov	eax, DWORD PTR _decl$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 44					; 0000002cH
	jne	$L2445
$L2446:
	mov	eax, DWORD PTR _decl$[ebp]
	cmp	DWORD PTR [eax+76], 0
	je	$L2445
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2445
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 10					; 0000000aH
	test	al, 1
	jne	$L2445
; Line 4671
	mov	eax, DWORD PTR _decl$[ebp]
	push	eax
	call	_put_var_into_stack
	add	esp, 4
; Line 4672
$L2445:
	jmp	$L2443
$L2444:
	mov	eax, DWORD PTR _block$[ebp]
	mov	eax, DWORD PTR [eax+48]
	mov	DWORD PTR _sub$[ebp], eax
	jmp	$L2447
$L2448:
	mov	eax, DWORD PTR _sub$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _sub$[ebp], eax
$L2447:
	cmp	DWORD PTR _sub$[ebp], 0
	je	$L2449
; Line 4673
	mov	eax, DWORD PTR _sub$[ebp]
	push	eax
	call	_setjmp_protect
	add	esp, 4
	jmp	$L2448
$L2449:
; Line 4674
$L2439:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_setjmp_protect ENDP
_TEXT	ENDS
PUBLIC	_init_function_start
EXTRN	_cse_not_expected:DWORD
EXTRN	_immediate_size_expand:DWORD
EXTRN	_current_function_decl:DWORD
EXTRN	_flag_omit_frame_pointer:DWORD
EXTRN	_init_emit:NEAR
EXTRN	_init_expr:NEAR
EXTRN	_init_const_rtx_hash_table:NEAR
EXTRN	_init_pending_stack_adjust:NEAR
EXTRN	_caller_save_needed:DWORD
EXTRN	_write_symbols:DWORD
_TEXT	SEGMENT
_subr$ = 8
_filename$ = 12
_line$ = 16
_init_function_start PROC NEAR
; Line 4685
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 4686
	mov	eax, DWORD PTR _subr$[ebp]
	mov	DWORD PTR _this_function$S1190, eax
; Line 4687
	cmp	DWORD PTR _optimize, 1
	sbb	eax, eax
	neg	eax
	mov	DWORD PTR _cse_not_expected, eax
; Line 4693
	cmp	DWORD PTR _flag_omit_frame_pointer, 1
	sbb	eax, eax
	neg	eax
	mov	DWORD PTR _frame_pointer_needed, eax
; Line 4696
	mov	DWORD PTR _caller_save_needed, 0
; Line 4699
	mov	DWORD PTR _goto_fixup_chain$S1255, 0
; Line 4702
	mov	DWORD PTR _stack_slot_list, 0
; Line 4705
	mov	DWORD PTR _invalid_stack_slot$S1193, 0
; Line 4709
	mov	DWORD PTR _max_parm_reg$S2288, 10	; 0000000aH
; Line 4712
	mov	eax, DWORD PTR _write_symbols
	push	eax
	call	_init_emit
	add	esp, 4
; Line 4716
	call	_init_expr
; Line 4718
	call	_init_const_rtx_hash_table
; Line 4722
	test	BYTE PTR _target_flags, 8
	je	$L2580
	mov	eax, DWORD PTR _subr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 1
	je	$L2580
	mov	eax, DWORD PTR _subr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+20], 0
	je	$L2582
	mov	eax, DWORD PTR _subr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	call	_tree_last
	add	esp, 4
	mov	ecx, DWORD PTR _void_type_node
	cmp	DWORD PTR [eax+24], ecx
	jne	$L2580
$L2582:
	mov	DWORD PTR _current_function_pops_args, 1
	jmp	$L2581
$L2580:
	mov	DWORD PTR _current_function_pops_args, 0
$L2581:
; Line 4724
	mov	eax, DWORD PTR _subr$[ebp]
	mov	eax, DWORD PTR [eax+68]
	mov	DWORD PTR _current_function_name, eax
; Line 4730
	mov	eax, DWORD PTR _current_function_decl
	cmp	DWORD PTR [eax+44], 0
	je	$L2583
	mov	eax, DWORD PTR _current_function_decl
	mov	eax, DWORD PTR [eax+44]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 28					; 0000001cH
	jne	$L2583
	mov	DWORD PTR _current_function_needs_context, 1
	jmp	$L2584
$L2583:
	mov	DWORD PTR _current_function_needs_context, 0
$L2584:
; Line 4734
	mov	DWORD PTR _current_function_calls_setjmp, 0
; Line 4735
	mov	DWORD PTR _current_function_calls_alloca, 0
; Line 4737
	mov	DWORD PTR _current_function_returns_pcc_struct, 0
; Line 4738
	mov	DWORD PTR _current_function_returns_struct, 0
; Line 4741
	mov	DWORD PTR _max_structure_value_size$S2404, -1
; Line 4742
	mov	DWORD PTR _structure_value$S2405, 0
; Line 4745
	mov	DWORD PTR _block_stack, 0
; Line 4746
	mov	DWORD PTR _loop_stack, 0
; Line 4747
	mov	DWORD PTR _case_stack, 0
; Line 4748
	mov	DWORD PTR _cond_stack, 0
; Line 4749
	mov	DWORD PTR _nesting_stack, 0
; Line 4750
	mov	DWORD PTR _nesting_depth, 0
; Line 4752
	mov	DWORD PTR _block_start_count$S1191, 0
; Line 4755
	mov	DWORD PTR _tail_recursion_label$S1194, 0
; Line 4758
	mov	DWORD PTR _frame_offset$S1192, 0
; Line 4761
	mov	DWORD PTR _save_expr_regs, 0
; Line 4764
	mov	DWORD PTR _rtl_expr_chain$S1198, 0
; Line 4767
	inc	DWORD PTR _immediate_size_expand
; Line 4769
	call	_init_pending_stack_adjust
; Line 4770
	mov	DWORD PTR _inhibit_defer_pop, 0
; Line 4771
	mov	DWORD PTR _current_function_pretend_args_size, 0
; Line 4775
	mov	eax, DWORD PTR _line$[ebp]
	push	eax
	mov	eax, DWORD PTR _filename$[ebp]
	push	eax
	call	_emit_line_note
	add	esp, 8
; Line 4779
	push	-1
	push	0
	call	_emit_note
	add	esp, 8
; Line 4782
	push	0
	push	0
	call	_emit_note
	add	esp, 8
; Line 4785
	mov	eax, DWORD PTR _subr$[ebp]
	mov	eax, DWORD PTR [eax+60]
	push	eax
	call	_aggregate_value_p
	add	esp, 4
	or	eax, eax
	je	$L2459
; Line 4792
	mov	DWORD PTR _current_function_returns_struct, 1
; Line 4794
$L2459:
$L2454:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_init_function_start ENDP
_TEXT	ENDS
PUBLIC	_expand_function_start
EXTRN	_init_recog:NEAR
EXTRN	_get_pending_sizes:NEAR
EXTRN	_force_next_line_note:NEAR
EXTRN	_regno_reg_rtx:DWORD
_BSS	SEGMENT
_parm_birth_insn$S1189 DD 01H DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
_subr$ = 8
_parms_have_cleanups$ = 12
_i$ = -4
_tem$ = -8
_value_address$2470 = -12
_expand_function_start PROC NEAR
; Line 4806
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 4812
	call	_init_recog
; Line 4817
	cmp	DWORD PTR _parms_have_cleanups$[ebp], 0
	je	$L2467
; Line 4818
	call	_gen_label_rtx
	mov	DWORD PTR _cleanup_label, eax
; Line 4819
	jmp	$L2468
$L2467:
; Line 4820
	mov	DWORD PTR _cleanup_label, 0
$L2468:
; Line 4833
	call	_gen_label_rtx
	mov	DWORD PTR _return_label, eax
; Line 4841
	mov	eax, DWORD PTR _subr$[ebp]
	mov	eax, DWORD PTR [eax+60]
	push	eax
	call	_aggregate_value_p
	add	esp, 4
	or	eax, eax
	je	$L2469
; Line 4857
	push	4
	call	_gen_reg_rtx
	add	esp, 4
	mov	DWORD PTR _value_address$2470[ebp], eax
; Line 4858
	mov	eax, DWORD PTR _struct_value_incoming_rtx
	push	eax
	mov	eax, DWORD PTR _value_address$2470[ebp]
	push	eax
	call	_emit_move_insn
	add	esp, 8
; Line 4859
	mov	DWORD PTR _current_function_returns_struct, 1
; Line 4863
	mov	eax, DWORD PTR _value_address$2470[ebp]
	push	eax
	mov	eax, DWORD PTR _subr$[ebp]
	mov	eax, DWORD PTR [eax+60]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	sar	eax, 24					; 00000018H
	push	eax
	push	37					; 00000025H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _subr$[ebp]
	mov	ecx, DWORD PTR [ecx+60]
	mov	DWORD PTR [ecx+76], eax
; Line 4865
	jmp	$L2471
$L2469:
	mov	eax, DWORD PTR _subr$[ebp]
	mov	eax, DWORD PTR [eax+60]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	and	eax, -16777216				; ff000000H
	sub	ecx, ecx
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L2472
; Line 4867
	mov	eax, DWORD PTR _subr$[ebp]
	mov	eax, DWORD PTR [eax+60]
	mov	DWORD PTR [eax+76], 0
; Line 4868
	jmp	$L2473
$L2472:
	cmp	DWORD PTR _parms_have_cleanups$[ebp], 0
	je	$L2474
; Line 4874
	mov	eax, DWORD PTR _subr$[ebp]
	mov	eax, DWORD PTR [eax+60]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	sar	eax, 24					; 00000018H
	push	eax
	call	_gen_reg_rtx
	add	esp, 4
	mov	ecx, DWORD PTR _subr$[ebp]
	mov	ecx, DWORD PTR [ecx+60]
	mov	DWORD PTR [ecx+76], eax
; Line 4875
	jmp	$L2475
$L2474:
; Line 4883
	mov	eax, DWORD PTR _subr$[ebp]
	mov	eax, DWORD PTR [eax+60]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	and	eax, -16777216				; ff000000H
	mov	ecx, 167772160				; 0a000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L2587
	mov	eax, DWORD PTR _subr$[ebp]
	mov	eax, DWORD PTR [eax+60]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	and	eax, -16777216				; ff000000H
	mov	ecx, 184549376				; 0b000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L2585
$L2587:
	mov	DWORD PTR -16+[ebp], 8
	jmp	$L2586
$L2585:
	mov	DWORD PTR -16+[ebp], 0
$L2586:
	mov	eax, DWORD PTR -16+[ebp]
	push	eax
	mov	eax, DWORD PTR _subr$[ebp]
	mov	eax, DWORD PTR [eax+60]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	sar	eax, 24					; 00000018H
	push	eax
	push	34					; 00000022H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _subr$[ebp]
	mov	ecx, DWORD PTR [ecx+60]
	mov	DWORD PTR [ecx+76], eax
; Line 4887
	mov	eax, DWORD PTR _subr$[ebp]
	mov	eax, DWORD PTR [eax+52]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	sub	eax, 11					; 0000000bH
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	mov	DWORD PTR _current_function_returns_pointer, eax
; Line 4890
	mov	eax, DWORD PTR _subr$[ebp]
	mov	eax, DWORD PTR [eax+60]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2476
; Line 4891
	mov	eax, DWORD PTR _subr$[ebp]
	mov	eax, DWORD PTR [eax+60]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax]
	or	eax, 1073741824				; 40000000H
	mov	ecx, DWORD PTR _subr$[ebp]
	mov	ecx, DWORD PTR [ecx+60]
	mov	ecx, DWORD PTR [ecx+76]
	mov	DWORD PTR [ecx], eax
; Line 4892
$L2476:
$L2475:
$L2473:
$L2471:
; Line 4897
	mov	eax, DWORD PTR _subr$[ebp]
	push	eax
	call	_assign_parms
	add	esp, 4
; Line 4901
	call	_get_last_insn
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1179648				; 00120000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L2477
; Line 4902
	push	-1
	push	0
	call	_emit_note
	add	esp, 8
; Line 4903
$L2477:
	call	_get_last_insn
	mov	DWORD PTR _parm_birth_insn$S1189, eax
; Line 4905
	cmp	DWORD PTR _obey_regdecls, 0
	je	$L2478
; Line 4907
	mov	DWORD PTR _i$[ebp], 10			; 0000000aH
	jmp	$L2479
$L2480:
	inc	DWORD PTR _i$[ebp]
$L2479:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _max_parm_reg$S2288, eax
	jle	$L2481
; Line 4908
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _regno_reg_rtx
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	call	_use_variable
	add	esp, 4
	jmp	$L2480
$L2481:
; Line 4913
$L2478:
	call	_get_last_insn
	mov	DWORD PTR _tail_recursion_reentry$S1195, eax
; Line 4916
	call	_get_pending_sizes
	mov	DWORD PTR _tem$[ebp], eax
	jmp	$L2482
$L2483:
	mov	eax, DWORD PTR _tem$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _tem$[ebp], eax
$L2482:
	cmp	DWORD PTR _tem$[ebp], 0
	je	$L2484
; Line 4917
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _tem$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	jmp	$L2483
$L2484:
; Line 4922
	call	_force_next_line_note
; Line 4923
$L2463:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_expand_function_start ENDP
_TEXT	ENDS
PUBLIC	_expand_function_end
EXTRN	_build_pointer_type:NEAR
EXTRN	_hard_function_value:NEAR
EXTRN	_emit_line_note_force:NEAR
EXTRN	_sequence_stack:DWORD
_TEXT	SEGMENT
_tem$2497 = -12
_tem$2507 = -16
_real_decl_result$2509 = -20
_value_address$2512 = -28
_type$2513 = -32
_outgoing$2514 = -24
_filename$ = 8
_line$ = 12
_i$ = -8
_expand_function_end PROC NEAR
; Line 4934
	push	ebp
	mov	ebp, esp
	sub	esp, 36					; 00000024H
	push	ebx
	push	esi
	push	edi
; Line 4949
$L2494:
	cmp	DWORD PTR _sequence_stack, 0
	je	$L2495
; Line 4950
	push	0
	call	_end_sequence
	add	esp, 4
	jmp	$L2494
$L2495:
; Line 4954
	dec	DWORD PTR _immediate_size_expand
; Line 4959
	cmp	DWORD PTR _obey_regdecls, 0
	je	$L2496
; Line 4962
	mov	DWORD PTR _i$[ebp], 10			; 0000000aH
	jmp	$L2498
$L2499:
	inc	DWORD PTR _i$[ebp]
$L2498:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _max_parm_reg$S2288, eax
	jle	$L2500
; Line 4963
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _regno_reg_rtx
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	call	_use_variable
	add	esp, 4
	jmp	$L2499
$L2500:
; Line 4967
	mov	eax, DWORD PTR _save_expr_regs
	mov	DWORD PTR _tem$2497[ebp], eax
	jmp	$L2501
$L2502:
	mov	eax, DWORD PTR _tem$2497[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _tem$2497[ebp], eax
$L2501:
	cmp	DWORD PTR _tem$2497[ebp], 0
	je	$L2503
; Line 4970
	mov	eax, DWORD PTR _tem$2497[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_use_variable
	add	esp, 4
; Line 4971
	mov	eax, DWORD PTR _parm_birth_insn$S1189
	push	eax
	mov	eax, DWORD PTR _tem$2497[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_use_variable_after
	add	esp, 8
; Line 4972
	jmp	$L2502
$L2503:
; Line 4975
$L2496:
	call	_clear_pending_stack_adjust
; Line 4976
	call	_do_pending_stack_adjust
; Line 4981
	push	-6					; fffffffaH
	push	0
	call	_emit_note
	add	esp, 8
; Line 4985
	mov	eax, DWORD PTR _line$[ebp]
	push	eax
	mov	eax, DWORD PTR _filename$[ebp]
	push	eax
	call	_emit_line_note_force
	add	esp, 8
; Line 4993
	cmp	DWORD PTR _return_label, 0
	je	$L2504
; Line 4994
	mov	eax, DWORD PTR _return_label
	push	eax
	call	_emit_label
	add	esp, 4
; Line 5000
$L2504:
	jmp	$L2505
; Line 5002
	cmp	DWORD PTR _current_function_calls_alloca, 0
	je	$L2506
; Line 5004
	push	4
	call	_gen_reg_rtx
	add	esp, 4
	mov	DWORD PTR _tem$2507[ebp], eax
; Line 5006
	mov	eax, DWORD PTR _parm_birth_insn$S1189
	push	eax
	mov	eax, DWORD PTR _stack_pointer_rtx
	push	eax
	mov	eax, DWORD PTR _tem$2507[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	call	_emit_insn_after
	add	esp, 8
; Line 5007
	mov	eax, DWORD PTR _tem$2507[ebp]
	push	eax
	mov	eax, DWORD PTR _stack_pointer_rtx
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	call	_emit_insn
	add	esp, 4
; Line 5012
$L2506:
$L2505:
; Line 5015
	mov	eax, DWORD PTR _current_function_decl
	mov	eax, DWORD PTR [eax+60]
	cmp	DWORD PTR [eax+76], 0
	je	$L2508
	mov	eax, DWORD PTR _current_function_decl
	mov	eax, DWORD PTR [eax+60]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2508
	mov	eax, DWORD PTR _current_function_decl
	mov	eax, DWORD PTR [eax+60]
	mov	eax, DWORD PTR [eax+76]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L2508
; Line 5026
	mov	eax, DWORD PTR _current_function_decl
	mov	eax, DWORD PTR [eax+60]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	and	eax, -16777216				; ff000000H
	mov	ecx, 167772160				; 0a000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L2590
	mov	eax, DWORD PTR _current_function_decl
	mov	eax, DWORD PTR [eax+60]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	and	eax, -16777216				; ff000000H
	mov	ecx, 184549376				; 0b000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L2588
$L2590:
	mov	DWORD PTR -36+[ebp], 8
	jmp	$L2589
$L2588:
	mov	DWORD PTR -36+[ebp], 0
$L2589:
	mov	eax, DWORD PTR -36+[ebp]
	push	eax
	mov	eax, DWORD PTR _current_function_decl
	mov	eax, DWORD PTR [eax+60]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	sar	eax, 24					; 00000018H
	push	eax
	push	34					; 00000022H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _real_decl_result$2509[ebp], eax
; Line 5028
	mov	eax, DWORD PTR _real_decl_result$2509[ebp]
	mov	eax, DWORD PTR [eax]
	or	eax, 1073741824				; 40000000H
	mov	ecx, DWORD PTR _real_decl_result$2509[ebp]
	mov	DWORD PTR [ecx], eax
; Line 5030
	mov	eax, DWORD PTR _current_function_decl
	mov	eax, DWORD PTR [eax+60]
	mov	eax, DWORD PTR [eax+76]
	push	eax
	mov	eax, DWORD PTR _real_decl_result$2509[ebp]
	push	eax
	call	_emit_move_insn
	add	esp, 8
; Line 5031
	mov	eax, DWORD PTR _real_decl_result$2509[ebp]
	push	eax
	push	0
	push	26					; 0000001aH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	call	_emit_insn
	add	esp, 4
; Line 5039
$L2508:
; Line 5040
	cmp	DWORD PTR _current_function_returns_struct, 0
	jne	$L2511
	cmp	DWORD PTR _current_function_returns_pcc_struct, 0
	je	$L2510
$L2511:
; Line 5042
	mov	eax, DWORD PTR _current_function_decl
	mov	eax, DWORD PTR [eax+60]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _value_address$2512[ebp], eax
; Line 5043
	mov	eax, DWORD PTR _current_function_decl
	mov	eax, DWORD PTR [eax+60]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _type$2513[ebp], eax
; Line 5051
	mov	eax, DWORD PTR _current_function_decl
	push	eax
	mov	eax, DWORD PTR _type$2513[ebp]
	push	eax
	call	_build_pointer_type
	add	esp, 4
	push	eax
	call	_hard_function_value
	add	esp, 8
	mov	DWORD PTR _outgoing$2514[ebp], eax
; Line 5054
	mov	eax, DWORD PTR _outgoing$2514[ebp]
	mov	eax, DWORD PTR [eax]
	or	eax, 1073741824				; 40000000H
	mov	ecx, DWORD PTR _outgoing$2514[ebp]
	mov	DWORD PTR [ecx], eax
; Line 5055
	mov	eax, DWORD PTR _value_address$2512[ebp]
	push	eax
	mov	eax, DWORD PTR _outgoing$2514[ebp]
	push	eax
	call	_emit_move_insn
	add	esp, 8
; Line 5056
	mov	eax, DWORD PTR _outgoing$2514[ebp]
	push	eax
	call	_use_variable
	add	esp, 4
; Line 5075
$L2510:
	push	0
	call	_get_insns
	push	eax
	push	0
	push	0
	push	0
	call	_fixup_gotos
	add	esp, 20					; 00000014H
; Line 5076
$L2489:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_expand_function_end ENDP
_TEXT	ENDS
END
