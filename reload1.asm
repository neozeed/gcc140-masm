	TITLE	reload1.c
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
COMM	_reload_order:WORD:02aH
COMM	_reload_inherited:BYTE:02aH
COMM	_reload_inheritance_insn:DWORD:02aH
COMM	_reload_override_in:DWORD:02aH
COMM	_reload_spill_index:DWORD:02aH
COMM	_caller_save_needed:DWORD
COMM	_basic_block_needs:DWORD
COMM	_reg_equiv_constant:DWORD
COMM	_reg_equiv_address:DWORD
COMM	_reg_equiv_mem:DWORD
COMM	_reload_first_uid:DWORD
COMM	_double_reg_address_ok:BYTE
_DATA	ENDS
PUBLIC	_mark_home_live
PUBLIC	_reload
EXTRN	_mode_size:BYTE
EXTRN	_save_call_clobbered_regs:NEAR
EXTRN	_alloca:NEAR
EXTRN	_plus_constant:NEAR
EXTRN	_max_regno:DWORD
EXTRN	_reg_mentioned_p:NEAR
EXTRN	_reg_renumber:DWORD
EXTRN	_regs_ever_live:TBYTE
EXTRN	_n_basic_blocks:DWORD
EXTRN	_immediate_operand:NEAR
EXTRN	_regno_reg_rtx:DWORD
EXTRN	_basic_block_head:DWORD
EXTRN	_stack_pointer_rtx:DWORD
EXTRN	_frame_pointer_rtx:DWORD
EXTRN	_fixed_regs:TBYTE
EXTRN	_call_used_regs:TBYTE
EXTRN	_check_frame_pointer_required:NEAR
EXTRN	_find_reg_note:NEAR
EXTRN	_gen_rtx:NEAR
EXTRN	_reg_class_contents:BYTE
EXTRN	_reg_class_superclasses:BYTE
EXTRN	_hard_regno_mode_ok:NEAR
EXTRN	_reload_in:BYTE
EXTRN	_reload_out:BYTE
EXTRN	_reload_reg_class:BYTE
EXTRN	_reload_inmode:BYTE
EXTRN	_reload_outmode:BYTE
EXTRN	_reload_optional:BYTE
EXTRN	_abort:NEAR
EXTRN	_n_reloads:DWORD
EXTRN	_reload_reg_rtx:BYTE
EXTRN	_reload_when_needed:BYTE
EXTRN	_find_reloads:NEAR
EXTRN	_memory_address_p:NEAR
EXTRN	_frame_pointer_needed:DWORD
EXTRN	_get_max_uid:NEAR
EXTRN	_emit_note:NEAR
EXTRN	_memcpy:NEAR
EXTRN	_memset:NEAR
_BSS	SEGMENT
_reg_max_ref_width$S584 DD 01H DUP (?)
_reg_equiv_init$S585 DD 01H DUP (?)
_n_spills$S588 DD 01H DUP (?)
_spill_reg_order$S591 DW 0aH DUP (?)
_forbidden_regs$S592 DW 0aH DUP (?)
_spill_regs$S593 DB 0aH DUP (?)
	ALIGN	4

_potential_reload_regs$S594 DW 0aH DUP (?)
_regs_explicitly_used$S595 DB 0aH DUP (?)
	ALIGN	4

_counted_for_groups$S596 DB 0aH DUP (?)
	ALIGN	4

_counted_for_nongroups$S597 DB 0aH DUP (?)
	ALIGN	4

_spill_indirect_ok$S598 DB 01H DUP (?)
	ALIGN	4

_spill_stack_slot$S599 DD 0aH DUP (?)
_spill_stack_slot_width$S600 DD 0aH DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
; File reload1.c
_addr$902 = -848
_note$648 = -36
_x$650 = -40
_offset$907 = -856
_regs$908 = -852
_j$846 = -816
_other$847 = -820
_p$720 = -752
_size$721 = -748
_other_reg$914 = -860
_mode$722 = -744
_p$851 = -824
_this_groups$723 = -756
_this_needs$724 = -764
_other_reg$917 = -864
_regmask$789 = -800
_this_total_groups$725 = -760
_j$790 = -788
_other_reg$920 = -868
_other_reg$923 = -872
_j$859 = -828
_regno$925 = -876
_k$800 = -804
_j$865 = -836
_k$866 = -832
_max_needs$675 = -248
_group_size$676 = -196
_max_groups$677 = -144
_p$806 = -808
_max_nongroups$678 = -92
_reg$935 = -880
_group_mode$679 = -300
_p$874 = -840
_idx$878 = -844
_after_call$686 = -304
_first$ = 8
_p$816 = -812
_global$ = 12
_dumpfile$ = 16
_avoid_return_reg$690 = -420
_insn_needs$691 = -632
_insn_groups$692 = -580
_class$ = -8
_this_max$757 = -768
_insn_total_groups$693 = -688
_i$ = -28
_insn_needs_for_inputs$694 = -360
_insn$ = -12
_insn_groups_for_inputs$695 = -740
_something_changed$ = -32
_insn_total_groups_for_inputs$696 = -528
_something_needs_reloads$ = -16
_insn_needs_for_outputs$697 = -684
_new_basic_block_needs$ = -4
_insn_groups_for_outputs$698 = -524
_this_block$ = -24
_regno$763 = -784
_insn_total_groups_for_outputs$699 = -416
_tem$ = -20
_nregs$764 = -776
_insn_needs_for_operands$700 = -472
_r$765 = -772
_insn_groups_for_operands$701 = -412
_inc_groups$766 = -780
_insn_total_groups_for_operands$702 = -308
_reload	PROC NEAR
; Line 247
	push	ebp
	mov	ebp, esp
	sub	esp, 892				; 0000037cH
	push	ebx
	push	esi
	push	edi
; Line 265
	push	4
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	push	6
	push	4
	push	34					; 00000022H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
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
	mov	DWORD PTR _tem$[ebp], eax
; Line 267
	mov	eax, DWORD PTR _tem$[ebp]
	push	eax
	push	1
	call	_memory_address_p
	add	esp, 8
	mov	BYTE PTR _spill_indirect_ok$S598, al
; Line 271
	push	6
	push	4
	push	34					; 00000022H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	push	6
	push	4
	push	34					; 00000022H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	push	4
	push	44					; 0000002cH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	DWORD PTR _tem$[ebp], eax
; Line 273
	push	4
	mov	eax, DWORD PTR _tem$[ebp]
	push	eax
	call	_plus_constant
	add	esp, 8
	mov	DWORD PTR _tem$[ebp], eax
; Line 275
	mov	eax, DWORD PTR _tem$[ebp]
	push	eax
	push	1
	call	_memory_address_p
	add	esp, 8
	mov	BYTE PTR _double_reg_address_ok, al
; Line 278
	call	_get_max_uid
	mov	DWORD PTR _reload_first_uid, eax
; Line 280
	mov	DWORD PTR _basic_block_needs, 0
; Line 285
	push	10					; 0000000aH
	push	OFFSET _regs_ever_live
	push	OFFSET _regs_explicitly_used$S595
	call	_memcpy
	add	esp, 12					; 0000000cH
; Line 288
	push	40					; 00000028H
	push	0
	push	OFFSET _spill_stack_slot$S599
	call	_memset
	add	esp, 12					; 0000000cH
; Line 289
	push	40					; 00000028H
	push	0
	push	OFFSET _spill_stack_slot_width$S600
	call	_memset
	add	esp, 12					; 0000000cH
; Line 296
	mov	DWORD PTR _i$[ebp], 10			; 0000000aH
	jmp	$L640
$L641:
	inc	DWORD PTR _i$[ebp]
$L640:
	mov	eax, DWORD PTR _max_regno
	cmp	DWORD PTR _i$[ebp], eax
	jge	$L642
; Line 297
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	call	_mark_home_live
	add	esp, 4
	jmp	$L641
$L642:
; Line 301
	push	-1
	push	0
	call	_emit_note
	add	esp, 8
; Line 313
	mov	eax, DWORD PTR _max_regno
	shl	eax, 2
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _reg_equiv_constant, eax
; Line 314
	mov	eax, DWORD PTR _max_regno
	shl	eax, 2
	push	eax
	push	0
	mov	eax, DWORD PTR _reg_equiv_constant
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 315
	mov	eax, DWORD PTR _max_regno
	shl	eax, 2
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _reg_equiv_mem, eax
; Line 316
	mov	eax, DWORD PTR _max_regno
	shl	eax, 2
	push	eax
	push	0
	mov	eax, DWORD PTR _reg_equiv_mem
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 317
	mov	eax, DWORD PTR _max_regno
	shl	eax, 2
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _reg_equiv_init$S585, eax
; Line 318
	mov	eax, DWORD PTR _max_regno
	shl	eax, 2
	push	eax
	push	0
	mov	eax, DWORD PTR _reg_equiv_init$S585
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 319
	mov	eax, DWORD PTR _max_regno
	shl	eax, 2
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _reg_equiv_address, eax
; Line 320
	mov	eax, DWORD PTR _max_regno
	shl	eax, 2
	push	eax
	push	0
	mov	eax, DWORD PTR _reg_equiv_address
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 321
	mov	eax, DWORD PTR _max_regno
	shl	eax, 2
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _reg_max_ref_width$S584, eax
; Line 322
	mov	eax, DWORD PTR _max_regno
	shl	eax, 2
	push	eax
	push	0
	mov	eax, DWORD PTR _reg_max_ref_width$S584
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 328
	mov	eax, DWORD PTR _first$[ebp]
	mov	DWORD PTR _insn$[ebp], eax
	jmp	$L644
$L645:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _insn$[ebp], eax
$L644:
	cmp	DWORD PTR _insn$[ebp], 0
	je	$L646
; Line 332
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 851968				; 000d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L647
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L647
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L647
; Line 334
	push	0
	push	3
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_find_reg_note
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _note$648[ebp], eax
; Line 335
	cmp	DWORD PTR _note$648[ebp], 0
	je	$L649
; Line 337
	mov	eax, DWORD PTR _note$648[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x$650[ebp], eax
; Line 338
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _i$[ebp], eax
; Line 339
	cmp	DWORD PTR _i$[ebp], 10			; 0000000aH
	jl	$L651
; Line 341
	mov	eax, DWORD PTR _x$650[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L652
; Line 343
	mov	eax, DWORD PTR _x$650[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _x$650[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	call	_memory_address_p
	add	esp, 8
	or	eax, eax
	je	$L653
; Line 344
	mov	eax, DWORD PTR _x$650[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _reg_equiv_mem
	mov	DWORD PTR [edx+ecx*4], eax
; Line 345
	jmp	$L654
$L653:
; Line 346
	mov	eax, DWORD PTR _x$650[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _reg_equiv_address
	mov	DWORD PTR [edx+ecx*4], eax
$L654:
; Line 348
	jmp	$L655
$L652:
	push	0
	mov	eax, DWORD PTR _x$650[ebp]
	push	eax
	call	_immediate_operand
	add	esp, 8
	or	eax, eax
	je	$L657
; Line 349
	mov	eax, DWORD PTR _x$650[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _reg_equiv_constant
	mov	DWORD PTR [edx+ecx*4], eax
; Line 350
	jmp	$L658
$L657:
; Line 351
	jmp	$L645
$L658:
$L655:
; Line 352
	mov	eax, DWORD PTR _insn$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _reg_equiv_init$S585
	mov	DWORD PTR [edx+ecx*4], eax
; Line 354
$L651:
; Line 355
$L649:
; Line 356
$L647:
; Line 357
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 851968				; 000d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L660
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 983040				; 000f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L660
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 917504				; 000e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L659
$L660:
; Line 358
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_scan_paradoxical_subregs
	add	esp, 4
; Line 359
$L659:
	jmp	$L645
$L646:
; Line 364
	cmp	DWORD PTR _global$[ebp], 1
	sbb	eax, eax
	neg	eax
	or	DWORD PTR _frame_pointer_needed, eax
; Line 366
	jne	$L661
; Line 369
	mov	eax, DWORD PTR _reg_equiv_address
	push	eax
	mov	eax, DWORD PTR _reg_equiv_mem
	push	eax
	mov	eax, DWORD PTR _reg_equiv_constant
	push	eax
	call	_check_frame_pointer_required
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _frame_pointer_needed, eax
; Line 376
$L661:
	mov	DWORD PTR _i$[ebp], 10			; 0000000aH
	jmp	$L663
$L664:
	inc	DWORD PTR _i$[ebp]
$L663:
	mov	eax, DWORD PTR _max_regno
	cmp	DWORD PTR _i$[ebp], eax
	jge	$L665
; Line 377
	push	-1
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	call	_alter_reg
	add	esp, 8
	jmp	$L664
$L665:
; Line 397
	call	_order_regs_for_reload
; Line 400
	mov	DWORD PTR _n_spills$S588, 0
; Line 401
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L666
$L667:
	inc	DWORD PTR _i$[ebp]
$L666:
	cmp	DWORD PTR _i$[ebp], 10			; 0000000aH
	jge	$L668
; Line 403
	mov	eax, DWORD PTR _i$[ebp]
	mov	WORD PTR _spill_reg_order$S591[eax*2], -1
; Line 404
	mov	eax, DWORD PTR _i$[ebp]
	mov	WORD PTR _forbidden_regs$S592[eax*2], -1
; Line 405
	jmp	$L667
$L668:
; Line 407
	cmp	DWORD PTR _caller_save_needed, 0
	je	$L669
; Line 408
	mov	DWORD PTR _frame_pointer_needed, 1
; Line 410
$L669:
	cmp	DWORD PTR _frame_pointer_needed, 0
	je	$L670
; Line 412
	mov	WORD PTR _forbidden_regs$S592+12, 1
; Line 413
	mov	eax, DWORD PTR _dumpfile$[ebp]
	push	eax
	mov	eax, DWORD PTR _global$[ebp]
	push	eax
	push	6
	call	_spill_hard_reg
	add	esp, 12					; 0000000cH
; Line 416
$L670:
	cmp	DWORD PTR _global$[ebp], 0
	je	$L671
; Line 418
	mov	eax, DWORD PTR _n_basic_blocks
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _basic_block_needs, eax
; Line 419
	mov	eax, DWORD PTR _n_basic_blocks
	push	eax
	push	0
	mov	eax, DWORD PTR _basic_block_needs
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 429
$L671:
	mov	DWORD PTR _something_changed$[ebp], 1
; Line 431
	mov	DWORD PTR _something_needs_reloads$[ebp], 0
; Line 432
$L673:
	cmp	DWORD PTR _something_changed$[ebp], 0
	je	$L674
; Line 454
	mov	DWORD PTR _something_changed$[ebp], 0
; Line 455
	push	52					; 00000034H
	push	0
	lea	eax, DWORD PTR _max_needs$675[ebp]
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 456
	push	52					; 00000034H
	push	0
	lea	eax, DWORD PTR _max_groups$677[ebp]
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 457
	push	52					; 00000034H
	push	0
	lea	eax, DWORD PTR _max_nongroups$678[ebp]
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 458
	push	52					; 00000034H
	push	0
	lea	eax, DWORD PTR _group_size$676[ebp]
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 459
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L680
$L681:
	inc	DWORD PTR _i$[ebp]
$L680:
	cmp	DWORD PTR _i$[ebp], 13			; 0000000dH
	jge	$L682
; Line 460
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _group_mode$679[ebp+eax*4], 0
	jmp	$L681
$L682:
; Line 463
	mov	DWORD PTR _this_block$[ebp], 0
; Line 467
	mov	DWORD PTR _new_basic_block_needs$[ebp], 0
; Line 472
	mov	eax, DWORD PTR _first$[ebp]
	mov	DWORD PTR _insn$[ebp], eax
	jmp	$L683
$L684:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _insn$[ebp], eax
$L683:
	cmp	DWORD PTR _insn$[ebp], 0
	je	$L685
; Line 474
	mov	DWORD PTR _after_call$686[ebp], 0
; Line 477
	cmp	DWORD PTR _global$[ebp], 0
	je	$L687
	mov	eax, DWORD PTR _this_block$[ebp]
	inc	eax
	cmp	eax, DWORD PTR _n_basic_blocks
	jge	$L687
	mov	eax, DWORD PTR _this_block$[ebp]
	mov	ecx, DWORD PTR _basic_block_head
	mov	edx, DWORD PTR _insn$[ebp]
	cmp	DWORD PTR [ecx+eax*4+4], edx
	jne	$L687
; Line 478
	inc	DWORD PTR _this_block$[ebp]
; Line 480
$L687:
; Line 481
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 851968				; 000d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L689
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 917504				; 000e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L689
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 983040				; 000f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L688
$L689:
; Line 485
	mov	DWORD PTR _avoid_return_reg$690[ebp], 0
; Line 490
	mov	DWORD PTR _insn_total_groups$693[ebp], 0
; Line 495
	mov	DWORD PTR _insn_total_groups_for_inputs$696[ebp], 0
; Line 500
	mov	DWORD PTR _insn_total_groups_for_outputs$699[ebp], 0
; Line 505
	mov	DWORD PTR _insn_total_groups_for_operands$702[ebp], 0
; Line 507
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L703
$L704:
	inc	DWORD PTR _i$[ebp]
$L703:
	cmp	DWORD PTR _i$[ebp], 13			; 0000000dH
	jge	$L705
; Line 509
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _insn_needs$691[ebp+eax*4], 0
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _insn_groups$692[ebp+eax*4], 0
; Line 510
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _insn_needs_for_inputs$694[ebp+eax*4], 0
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _insn_groups_for_inputs$695[ebp+eax*4], 0
; Line 511
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _insn_needs_for_outputs$697[ebp+eax*4], 0
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _insn_groups_for_outputs$698[ebp+eax*4], 0
; Line 512
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _insn_needs_for_operands$700[ebp+eax*4], 0
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _insn_groups_for_operands$701[ebp+eax*4], 0
; Line 513
	jmp	$L704
$L705:
; Line 537
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 983040				; 000f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L706
; Line 539
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L707
; Line 540
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _after_call$686[ebp], eax
; Line 541
	jmp	$L708
$L707:
; Line 542
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1310720				; 00140000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L709
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
	jne	$L709
; Line 543
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _after_call$686[ebp], eax
; Line 544
	jmp	$L710
$L709:
; Line 545
	mov	DWORD PTR _after_call$686[ebp], 0
$L710:
$L708:
; Line 547
	jmp	$L711
$L706:
; Line 549
	cmp	DWORD PTR _after_call$686[ebp], 0
	je	$L712
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L713
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _stack_pointer_rtx
	cmp	DWORD PTR [eax+4], ecx
	je	$L712
$L713:
; Line 551
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	mov	eax, DWORD PTR _after_call$686[ebp]
	push	eax
	call	_reg_mentioned_p
	add	esp, 8
	or	eax, eax
	je	$L715
; Line 552
	mov	eax, DWORD PTR _after_call$686[ebp]
	mov	DWORD PTR _avoid_return_reg$690[ebp], eax
; Line 553
$L715:
	mov	DWORD PTR _after_call$686[ebp], 0
; Line 558
$L712:
$L711:
	push	OFFSET _spill_reg_order$S591
	mov	eax, DWORD PTR _global$[ebp]
	push	eax
	movsx	eax, BYTE PTR _spill_indirect_ok$S598
	push	eax
	push	0
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_find_reloads
	add	esp, 20					; 00000014H
; Line 560
	cmp	DWORD PTR _n_reloads, 0
	jne	$L716
; Line 561
	jmp	$L684
; Line 563
$L716:
	mov	DWORD PTR _something_needs_reloads$[ebp], 1
; Line 568
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L717
$L718:
	inc	DWORD PTR _i$[ebp]
$L717:
	mov	eax, DWORD PTR _n_reloads
	cmp	DWORD PTR _i$[ebp], eax
	jge	$L719
; Line 581
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _reload_reg_rtx[eax*4], 0
	je	$L726
	cmp	DWORD PTR _global$[ebp], 0
	je	$L727
	mov	eax, DWORD PTR _this_block$[ebp]
	mov	ecx, DWORD PTR _basic_block_needs
	movsx	eax, BYTE PTR [eax+ecx]
	or	eax, eax
	je	$L726
$L727:
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _reload_reg_rtx[eax*4]
	mov	eax, DWORD PTR [eax+4]
	movsx	eax, WORD PTR _spill_reg_order$S591[eax*2]
	or	eax, eax
	jl	$L726
; Line 582
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _reload_reg_rtx[eax*4], 0
; Line 588
$L726:
; Line 590
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _reload_reg_rtx[eax*4], 0
	jne	$L729
	mov	eax, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR _reload_optional[eax]
	or	eax, eax
	jne	$L729
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _reload_out[eax*4], 0
	jne	$L728
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _reload_in[eax*4], 0
	jne	$L728
$L729:
; Line 591
	jmp	$L718
; Line 594
$L728:
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _reload_when_needed[eax*4]
	mov	DWORD PTR -892+[ebp], eax
	jmp	$L730
; Line 596
$L734:
; Line 597
	lea	eax, DWORD PTR _insn_needs$691[ebp]
	mov	DWORD PTR _this_needs$724[ebp], eax
; Line 598
	lea	eax, DWORD PTR _insn_groups$692[ebp]
	mov	DWORD PTR _this_groups$723[ebp], eax
; Line 599
	lea	eax, DWORD PTR _insn_total_groups$693[ebp]
	mov	DWORD PTR _this_total_groups$725[ebp], eax
; Line 600
	jmp	$L731
; Line 602
$L735:
; Line 603
	lea	eax, DWORD PTR _insn_needs_for_inputs$694[ebp]
	mov	DWORD PTR _this_needs$724[ebp], eax
; Line 604
	lea	eax, DWORD PTR _insn_groups_for_inputs$695[ebp]
	mov	DWORD PTR _this_groups$723[ebp], eax
; Line 605
	lea	eax, DWORD PTR _insn_total_groups_for_inputs$696[ebp]
	mov	DWORD PTR _this_total_groups$725[ebp], eax
; Line 606
	jmp	$L731
; Line 608
$L736:
; Line 609
	lea	eax, DWORD PTR _insn_needs_for_outputs$697[ebp]
	mov	DWORD PTR _this_needs$724[ebp], eax
; Line 610
	lea	eax, DWORD PTR _insn_groups_for_outputs$698[ebp]
	mov	DWORD PTR _this_groups$723[ebp], eax
; Line 611
	lea	eax, DWORD PTR _insn_total_groups_for_outputs$699[ebp]
	mov	DWORD PTR _this_total_groups$725[ebp], eax
; Line 612
	jmp	$L731
; Line 614
$L737:
; Line 615
	lea	eax, DWORD PTR _insn_needs_for_operands$700[ebp]
	mov	DWORD PTR _this_needs$724[ebp], eax
; Line 616
	lea	eax, DWORD PTR _insn_groups_for_operands$701[ebp]
	mov	DWORD PTR _this_groups$723[ebp], eax
; Line 617
	lea	eax, DWORD PTR _insn_total_groups_for_operands$702[ebp]
	mov	DWORD PTR _this_total_groups$725[ebp], eax
; Line 618
	jmp	$L731
; Line 619
	jmp	$L731
$L730:
	cmp	DWORD PTR -892+[ebp], 0
	je	$L735
	cmp	DWORD PTR -892+[ebp], 1
	je	$L736
	cmp	DWORD PTR -892+[ebp], 2
	je	$L737
	cmp	DWORD PTR -892+[ebp], 3
	je	$L734
	jmp	$L731
$L731:
; Line 621
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _reload_inmode[eax*4]
	mov	DWORD PTR _mode$722[ebp], eax
; Line 622
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _reload_outmode[eax*4]
	mov	ecx, DWORD PTR _mode$722[ebp]
	mov	ecx, DWORD PTR _mode_size[ecx*4]
	cmp	DWORD PTR _mode_size[eax*4], ecx
	jle	$L738
; Line 623
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _reload_outmode[eax*4]
	mov	DWORD PTR _mode$722[ebp], eax
; Line 624
$L738:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _reload_reg_class[eax*4], 11	; 0000000bH
	jne	$L1800
	mov	DWORD PTR _size$721[ebp], 1
	jmp	$L1801
$L1800:
	mov	eax, DWORD PTR _mode$722[ebp]
	mov	eax, DWORD PTR _mode_size[eax*4]
	add	eax, 3
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	mov	DWORD PTR _size$721[ebp], eax
$L1801:
; Line 625
	cmp	DWORD PTR _size$721[ebp], 1
	jle	$L739
; Line 629
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _reload_reg_class[eax*4]
	mov	ecx, DWORD PTR _this_groups$723[ebp]
	inc	DWORD PTR [ecx+eax*4]
; Line 630
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _reload_reg_class[eax*4]
	mov	ecx, eax
	lea	eax, DWORD PTR [eax+eax*2]
	lea	eax, DWORD PTR [ecx+eax*4]
	lea	eax, DWORD PTR _reg_class_superclasses[eax*4]
	mov	DWORD PTR _p$720[ebp], eax
; Line 631
$L741:
	mov	eax, DWORD PTR _p$720[ebp]
	cmp	DWORD PTR [eax], 13			; 0000000dH
	je	$L742
; Line 632
	mov	eax, DWORD PTR _p$720[ebp]
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _this_groups$723[ebp]
	inc	DWORD PTR [ecx+eax*4]
	add	DWORD PTR _p$720[ebp], 4
	jmp	$L741
$L742:
; Line 633
	mov	eax, DWORD PTR _this_total_groups$725[ebp]
	inc	DWORD PTR [eax]
; Line 644
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _reload_reg_class[eax*4]
	cmp	DWORD PTR _group_mode$679[ebp+eax*4], 0
	je	$L743
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _reload_reg_class[eax*4]
	push	eax
	mov	eax, DWORD PTR _mode$722[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _reload_reg_class[eax*4]
	mov	eax, DWORD PTR _group_mode$679[ebp+eax*4]
	push	eax
	call	_modes_equiv_for_class_p
	add	esp, 12					; 0000000cH
	or	eax, eax
	je	$L744
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _reload_reg_class[eax*4]
	mov	ecx, DWORD PTR _size$721[ebp]
	cmp	DWORD PTR _group_size$676[ebp+eax*4], ecx
	je	$L743
$L744:
; Line 645
	call	_abort
; Line 648
$L743:
	mov	eax, DWORD PTR _size$721[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reload_reg_class[ecx*4]
	mov	DWORD PTR _group_size$676[ebp+ecx*4], eax
; Line 649
	mov	eax, DWORD PTR _mode$722[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reload_reg_class[ecx*4]
	mov	DWORD PTR _group_mode$679[ebp+ecx*4], eax
; Line 651
	jmp	$L746
$L739:
	cmp	DWORD PTR _size$721[ebp], 1
	jne	$L747
; Line 653
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _reload_reg_class[eax*4]
	mov	ecx, DWORD PTR _this_needs$724[ebp]
	inc	DWORD PTR [ecx+eax*4]
; Line 654
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _reload_reg_class[eax*4]
	mov	ecx, eax
	lea	eax, DWORD PTR [eax+eax*2]
	lea	eax, DWORD PTR [ecx+eax*4]
	lea	eax, DWORD PTR _reg_class_superclasses[eax*4]
	mov	DWORD PTR _p$720[ebp], eax
; Line 655
$L749:
	mov	eax, DWORD PTR _p$720[ebp]
	cmp	DWORD PTR [eax], 13			; 0000000dH
	je	$L750
; Line 656
	mov	eax, DWORD PTR _p$720[ebp]
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _this_needs$724[ebp]
	inc	DWORD PTR [ecx+eax*4]
	add	DWORD PTR _p$720[ebp], 4
	jmp	$L749
$L750:
; Line 658
	jmp	$L751
$L747:
; Line 659
	call	_abort
$L751:
$L746:
; Line 661
	cmp	DWORD PTR _global$[ebp], 0
	je	$L752
; Line 663
	mov	eax, DWORD PTR _this_block$[ebp]
	mov	ecx, DWORD PTR _basic_block_needs
	movsx	eax, BYTE PTR [eax+ecx]
	or	eax, eax
	jne	$L753
; Line 664
	mov	DWORD PTR _new_basic_block_needs$[ebp], 1
; Line 665
$L753:
	mov	eax, DWORD PTR _this_block$[ebp]
	mov	ecx, DWORD PTR _basic_block_needs
	mov	BYTE PTR [eax+ecx], 1
; Line 667
$L752:
	jmp	$L718
$L719:
; Line 674
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L754
$L755:
	inc	DWORD PTR _i$[ebp]
$L754:
	cmp	DWORD PTR _i$[ebp], 13			; 0000000dH
	jge	$L756
; Line 677
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _insn_needs_for_inputs$694[ebp+eax*4]
	mov	DWORD PTR _this_max$757[ebp], eax
; Line 678
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _this_max$757[ebp]
	cmp	DWORD PTR _insn_needs_for_outputs$697[ebp+eax*4], ecx
	jle	$L758
; Line 679
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _insn_needs_for_outputs$697[ebp+eax*4]
	mov	DWORD PTR _this_max$757[ebp], eax
; Line 680
$L758:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _this_max$757[ebp]
	cmp	DWORD PTR _insn_needs_for_operands$700[ebp+eax*4], ecx
	jle	$L759
; Line 681
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _insn_needs_for_operands$700[ebp+eax*4]
	mov	DWORD PTR _this_max$757[ebp], eax
; Line 682
$L759:
	mov	eax, DWORD PTR _this_max$757[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	add	DWORD PTR _insn_needs$691[ebp+ecx*4], eax
; Line 683
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _insn_groups_for_inputs$695[ebp+eax*4]
	mov	DWORD PTR _this_max$757[ebp], eax
; Line 684
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _this_max$757[ebp]
	cmp	DWORD PTR _insn_groups_for_outputs$698[ebp+eax*4], ecx
	jle	$L760
; Line 685
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _insn_groups_for_outputs$698[ebp+eax*4]
	mov	DWORD PTR _this_max$757[ebp], eax
; Line 686
$L760:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _this_max$757[ebp]
	cmp	DWORD PTR _insn_groups_for_operands$701[ebp+eax*4], ecx
	jle	$L761
; Line 687
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _insn_groups_for_operands$701[ebp+eax*4]
	mov	DWORD PTR _this_max$757[ebp], eax
; Line 688
$L761:
	mov	eax, DWORD PTR _this_max$757[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	add	DWORD PTR _insn_groups$692[ebp+ecx*4], eax
; Line 689
	jmp	$L755
$L756:
; Line 692
	mov	eax, DWORD PTR _insn_total_groups_for_operands$702[ebp]
	mov	ecx, DWORD PTR _insn_total_groups_for_outputs$699[ebp]
	cmp	eax, ecx
	jg	$L1818
	mov	eax, ecx
$L1818:
	mov	ecx, DWORD PTR _insn_total_groups_for_inputs$696[ebp]
	cmp	eax, ecx
	jg	$L1819
	mov	eax, ecx
$L1819:
	add	DWORD PTR _insn_total_groups$693[ebp], eax
; Line 696
	cmp	DWORD PTR _n_reloads, 1
	sbb	eax, eax
	inc	eax
	and	eax, 255				; 000000ffH
	shl	eax, 16					; 00000010H
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	ecx, DWORD PTR [ecx]
	and	ecx, -16711681				; ff00ffffH
	or	eax, ecx
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 705
	cmp	DWORD PTR _avoid_return_reg$690[ebp], 0
	je	$L762
; Line 707
	mov	eax, DWORD PTR _avoid_return_reg$690[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _regno$763[ebp], eax
; Line 709
	cmp	DWORD PTR _regno$763[ebp], 8
	jl	$L1802
	mov	DWORD PTR _nregs$764[ebp], 1
	jmp	$L1803
$L1802:
	mov	eax, DWORD PTR _avoid_return_reg$690[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	add	eax, 3
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	mov	DWORD PTR _nregs$764[ebp], eax
$L1803:
; Line 711
	mov	DWORD PTR _inc_groups$766[ebp], 0
; Line 712
	mov	eax, DWORD PTR _regno$763[ebp]
	mov	DWORD PTR _r$765[ebp], eax
	jmp	$L767
$L768:
	inc	DWORD PTR _r$765[ebp]
$L767:
	mov	eax, DWORD PTR _nregs$764[ebp]
	add	eax, DWORD PTR _regno$763[ebp]
	cmp	eax, DWORD PTR _r$765[ebp]
	jle	$L769
; Line 713
	mov	eax, DWORD PTR _r$765[ebp]
	movsx	eax, WORD PTR _spill_reg_order$S591[eax*2]
	or	eax, eax
	jl	$L770
; Line 714
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L771
$L772:
	inc	DWORD PTR _i$[ebp]
$L771:
	cmp	DWORD PTR _i$[ebp], 13			; 0000000dH
	jge	$L773
; Line 715
	mov	eax, DWORD PTR _i$[ebp]
	movsx	eax, WORD PTR _reg_class_contents[eax*2]
	mov	edx, 1
	mov	cl, BYTE PTR _r$765[ebp]
	shl	edx, cl
	test	eax, edx
	je	$L774
; Line 717
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _insn_needs$691[ebp+eax*4], 0
	jle	$L775
; Line 718
	mov	eax, DWORD PTR _i$[ebp]
	inc	DWORD PTR _insn_needs$691[ebp+eax*4]
; Line 719
$L775:
; Line 720
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _insn_groups$692[ebp+eax*4], 0
	jle	$L776
	cmp	DWORD PTR _nregs$764[ebp], 1
	jle	$L776
; Line 721
	mov	DWORD PTR _inc_groups$766[ebp], 1
; Line 722
$L776:
; Line 723
$L774:
	jmp	$L772
$L773:
$L770:
	jmp	$L768
$L769:
	cmp	DWORD PTR _inc_groups$766[ebp], 0
	je	$L777
; Line 724
	mov	eax, DWORD PTR _i$[ebp]
	inc	DWORD PTR _insn_groups$692[ebp+eax*4]
; Line 725
$L777:
; Line 729
$L762:
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L778
$L779:
	inc	DWORD PTR _i$[ebp]
$L778:
	cmp	DWORD PTR _i$[ebp], 13			; 0000000dH
	jge	$L780
; Line 731
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _insn_needs$691[ebp+ecx*4]
	cmp	DWORD PTR _max_needs$675[ebp+eax*4], ecx
	jge	$L781
; Line 732
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _insn_needs$691[ebp+eax*4]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	DWORD PTR _max_needs$675[ebp+ecx*4], eax
; Line 733
$L781:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _max_groups$677[ebp+ecx*4]
	cmp	DWORD PTR _insn_groups$692[ebp+eax*4], ecx
	jle	$L782
; Line 734
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _insn_groups$692[ebp+eax*4]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	DWORD PTR _max_groups$677[ebp+ecx*4], eax
; Line 735
$L782:
	cmp	DWORD PTR _insn_total_groups$693[ebp], 0
	jle	$L783
; Line 736
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _insn_needs$691[ebp+ecx*4]
	cmp	DWORD PTR _max_nongroups$678[ebp+eax*4], ecx
	jge	$L784
; Line 737
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _insn_needs$691[ebp+eax*4]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	DWORD PTR _max_nongroups$678[ebp+ecx*4], eax
; Line 738
$L784:
$L783:
	jmp	$L779
$L780:
; Line 741
$L688:
	jmp	$L684
$L685:
; Line 746
	push	10					; 0000000aH
	push	0
	push	OFFSET _counted_for_groups$S596
	call	_memset
	add	esp, 12					; 0000000cH
; Line 747
	push	10					; 0000000aH
	push	0
	push	OFFSET _counted_for_nongroups$S597
	call	_memset
	add	esp, 12					; 0000000cH
; Line 752
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L785
$L786:
	inc	DWORD PTR _i$[ebp]
$L785:
	cmp	DWORD PTR _i$[ebp], 13			; 0000000dH
	jge	$L787
; Line 753
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _group_size$676[ebp+eax*4], 1
	jle	$L788
; Line 758
	push	10					; 0000000aH
	push	0
	lea	eax, DWORD PTR _regmask$789[ebp]
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 760
	mov	DWORD PTR _j$790[ebp], 0
	jmp	$L791
$L792:
	inc	DWORD PTR _j$790[ebp]
$L791:
	mov	eax, DWORD PTR _j$790[ebp]
	cmp	DWORD PTR _n_spills$S588, eax
	jle	$L793
; Line 762
	mov	eax, 1
	mov	ecx, DWORD PTR _j$790[ebp]
	mov	cl, BYTE PTR _spill_regs$S593[ecx]
	shl	eax, cl
	mov	ecx, DWORD PTR _i$[ebp]
	movsx	ecx, WORD PTR _reg_class_contents[ecx*2]
	test	eax, ecx
	je	$L794
	mov	eax, DWORD PTR _j$790[ebp]
	movsx	eax, BYTE PTR _spill_regs$S593[eax]
	movsx	eax, BYTE PTR _counted_for_groups$S596[eax]
	or	eax, eax
	jne	$L794
; Line 763
	mov	eax, DWORD PTR _j$790[ebp]
	movsx	eax, BYTE PTR _spill_regs$S593[eax]
	mov	BYTE PTR _regmask$789[ebp+eax], 1
; Line 765
$L794:
	jmp	$L792
$L793:
	mov	DWORD PTR _j$790[ebp], 0
	jmp	$L795
$L796:
	inc	DWORD PTR _j$790[ebp]
$L795:
	cmp	DWORD PTR _j$790[ebp], 10		; 0000000aH
	jge	$L797
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _max_groups$677[ebp+eax*4], 0
	jle	$L797
; Line 769
	mov	eax, DWORD PTR _j$790[ebp]
	movsx	eax, BYTE PTR _regmask$789[ebp+eax]
	or	eax, eax
	je	$L799
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _group_size$676[ebp+eax*4]
	add	eax, DWORD PTR _j$790[ebp]
	cmp	eax, 10					; 0000000aH
	jg	$L799
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _group_mode$679[ebp+eax*4]
	push	eax
	mov	eax, DWORD PTR _j$790[ebp]
	push	eax
	call	_hard_regno_mode_ok
	add	esp, 8
	or	eax, eax
	je	$L799
; Line 772
	mov	DWORD PTR _k$800[ebp], 1
	jmp	$L801
$L802:
	inc	DWORD PTR _k$800[ebp]
$L801:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _k$800[ebp]
	cmp	DWORD PTR _group_size$676[ebp+eax*4], ecx
	jle	$L803
; Line 773
	mov	eax, DWORD PTR _k$800[ebp]
	add	eax, DWORD PTR _j$790[ebp]
	movsx	eax, BYTE PTR _regmask$789[ebp+eax]
	or	eax, eax
	jne	$L804
; Line 774
	jmp	$L803
; Line 775
$L804:
	jmp	$L802
$L803:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _k$800[ebp]
	cmp	DWORD PTR _group_size$676[ebp+eax*4], ecx
	jne	$L805
; Line 780
	mov	eax, DWORD PTR _i$[ebp]
	dec	DWORD PTR _max_groups$677[ebp+eax*4]
; Line 781
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, eax
	lea	eax, DWORD PTR [eax+eax*2]
	lea	eax, DWORD PTR [ecx+eax*4]
	lea	eax, DWORD PTR _reg_class_superclasses[eax*4]
	mov	DWORD PTR _p$806[ebp], eax
; Line 782
$L808:
	mov	eax, DWORD PTR _p$806[ebp]
	cmp	DWORD PTR [eax], 13			; 0000000dH
	je	$L809
; Line 783
	mov	eax, DWORD PTR _p$806[ebp]
	mov	eax, DWORD PTR [eax]
	dec	DWORD PTR _max_groups$677[ebp+eax*4]
	add	DWORD PTR _p$806[ebp], 4
	jmp	$L808
$L809:
; Line 785
	mov	eax, DWORD PTR _j$790[ebp]
	mov	BYTE PTR _counted_for_groups$S596[eax], 1
; Line 786
	mov	DWORD PTR _k$800[ebp], 1
	jmp	$L810
$L811:
	inc	DWORD PTR _k$800[ebp]
$L810:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _k$800[ebp]
	cmp	DWORD PTR _group_size$676[ebp+eax*4], ecx
	jle	$L812
; Line 787
	mov	eax, DWORD PTR _k$800[ebp]
	mov	ecx, DWORD PTR _j$790[ebp]
	mov	BYTE PTR _counted_for_groups$S596[eax+ecx], 1
	jmp	$L811
$L812:
; Line 789
$L805:
	mov	eax, DWORD PTR _k$800[ebp]
	add	DWORD PTR _j$790[ebp], eax
; Line 791
$L799:
	jmp	$L796
$L797:
; Line 797
$L788:
	jmp	$L786
$L787:
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L813
$L814:
	inc	DWORD PTR _i$[ebp]
$L813:
	mov	eax, DWORD PTR _n_spills$S588
	cmp	DWORD PTR _i$[ebp], eax
	jge	$L815
; Line 800
	mov	eax, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR _spill_regs$S593[eax]
	or	eax, eax
	jne	$L1804
	mov	DWORD PTR _class$[ebp], 1
	jmp	$L1805
$L1804:
	mov	eax, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR _spill_regs$S593[eax]
	cmp	eax, 1
	jne	$L1806
	mov	DWORD PTR _class$[ebp], 2
	jmp	$L1807
$L1806:
	mov	eax, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR _spill_regs$S593[eax]
	cmp	eax, 2
	jne	$L1808
	mov	DWORD PTR _class$[ebp], 4
	jmp	$L1809
$L1808:
	mov	eax, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR _spill_regs$S593[eax]
	cmp	eax, 3
	jne	$L1810
	mov	DWORD PTR _class$[ebp], 5
	jmp	$L1811
$L1810:
	mov	eax, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR _spill_regs$S593[eax]
	cmp	eax, 4
	jne	$L1812
	mov	DWORD PTR _class$[ebp], 7
	jmp	$L1813
$L1812:
	mov	eax, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR _spill_regs$S593[eax]
	cmp	eax, 5
	jne	$L1814
	mov	DWORD PTR _class$[ebp], 8
	jmp	$L1815
$L1814:
	mov	eax, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR _spill_regs$S593[eax]
	cmp	eax, 7
	jne	$L1816
	mov	DWORD PTR _class$[ebp], 10		; 0000000aH
	jmp	$L1817
$L1816:
	mov	eax, 11					; 0000000bH
	mov	ecx, DWORD PTR _i$[ebp]
	movsx	ecx, BYTE PTR _spill_regs$S593[ecx]
	cmp	ecx, 8
	jge	$L1820
	mov	eax, 9
$L1820:
	mov	DWORD PTR _class$[ebp], eax
$L1817:
$L1815:
$L1813:
$L1811:
$L1809:
$L1807:
$L1805:
; Line 802
	mov	eax, DWORD PTR _class$[ebp]
	dec	DWORD PTR _max_needs$675[ebp+eax*4]
; Line 803
	mov	eax, DWORD PTR _class$[ebp]
	mov	ecx, eax
	lea	eax, DWORD PTR [eax+eax*2]
	lea	eax, DWORD PTR [ecx+eax*4]
	lea	eax, DWORD PTR _reg_class_superclasses[eax*4]
	mov	DWORD PTR _p$816[ebp], eax
; Line 804
$L818:
	mov	eax, DWORD PTR _p$816[ebp]
	cmp	DWORD PTR [eax], 13			; 0000000dH
	je	$L819
; Line 805
	mov	eax, DWORD PTR _p$816[ebp]
	mov	eax, DWORD PTR [eax]
	dec	DWORD PTR _max_needs$675[ebp+eax*4]
	add	DWORD PTR _p$816[ebp], 4
	jmp	$L818
$L819:
; Line 807
	mov	eax, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR _spill_regs$S593[eax]
	movsx	eax, BYTE PTR _counted_for_groups$S596[eax]
	or	eax, eax
	jne	$L820
; Line 809
	mov	eax, DWORD PTR _class$[ebp]
	cmp	DWORD PTR _max_nongroups$678[ebp+eax*4], 0
	jle	$L821
; Line 810
	mov	eax, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR _spill_regs$S593[eax]
	mov	BYTE PTR _counted_for_nongroups$S597[eax], 1
; Line 811
$L821:
	mov	eax, DWORD PTR _class$[ebp]
	dec	DWORD PTR _max_nongroups$678[ebp+eax*4]
; Line 812
	mov	eax, DWORD PTR _class$[ebp]
	mov	ecx, eax
	lea	eax, DWORD PTR [eax+eax*2]
	lea	eax, DWORD PTR [ecx+eax*4]
	lea	eax, DWORD PTR _reg_class_superclasses[eax*4]
	mov	DWORD PTR _p$816[ebp], eax
; Line 813
$L823:
	mov	eax, DWORD PTR _p$816[ebp]
	cmp	DWORD PTR [eax], 13			; 0000000dH
	je	$L824
; Line 815
	mov	eax, DWORD PTR _p$816[ebp]
	mov	eax, DWORD PTR [eax]
	cmp	DWORD PTR _max_nongroups$678[ebp+eax*4], 0
	jle	$L825
; Line 816
	mov	eax, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR _spill_regs$S593[eax]
	mov	BYTE PTR _counted_for_nongroups$S597[eax], 1
; Line 817
$L825:
	mov	eax, DWORD PTR _p$816[ebp]
	mov	eax, DWORD PTR [eax]
	dec	DWORD PTR _max_nongroups$678[ebp+eax*4]
	add	DWORD PTR _p$816[ebp], 4
; Line 818
	jmp	$L823
$L824:
; Line 820
$L820:
	jmp	$L814
$L815:
; Line 824
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L826
$L827:
	inc	DWORD PTR _i$[ebp]
$L826:
	cmp	DWORD PTR _i$[ebp], 13			; 0000000dH
	jge	$L828
; Line 825
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _max_needs$675[ebp+eax*4], 0
	jg	$L830
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _max_groups$677[ebp+eax*4], 0
	jg	$L830
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _max_nongroups$678[ebp+eax*4], 0
	jle	$L829
$L830:
; Line 826
	jmp	$L828
; Line 827
$L829:
	jmp	$L827
$L828:
	cmp	DWORD PTR _i$[ebp], 13			; 0000000dH
	jne	$L831
	cmp	DWORD PTR _new_basic_block_needs$[ebp], 0
	jne	$L831
; Line 828
	jmp	$L674
; Line 836
$L831:
	cmp	DWORD PTR _new_basic_block_needs$[ebp], 0
	je	$L832
; Line 837
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L833
$L834:
	inc	DWORD PTR _i$[ebp]
$L833:
	mov	eax, DWORD PTR _n_spills$S588
	cmp	DWORD PTR _i$[ebp], eax
	jge	$L835
; Line 839
	mov	eax, DWORD PTR _dumpfile$[ebp]
	push	eax
	mov	eax, DWORD PTR _global$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR _spill_regs$S593[eax]
	push	eax
	call	_spill_hard_reg
	add	esp, 12					; 0000000cH
	or	DWORD PTR _something_changed$[ebp], eax
	jmp	$L834
$L835:
; Line 849
$L832:
	mov	DWORD PTR _class$[ebp], 0
	jmp	$L836
$L837:
	inc	DWORD PTR _class$[ebp]
$L836:
	cmp	DWORD PTR _class$[ebp], 13		; 0000000dH
	jge	$L838
; Line 854
$L840:
	mov	eax, DWORD PTR _class$[ebp]
	cmp	DWORD PTR _max_groups$677[ebp+eax*4], 0
	jle	$L841
; Line 858
	mov	eax, DWORD PTR _class$[ebp]
	cmp	DWORD PTR _group_size$676[ebp+eax*4], 2
	jne	$L842
; Line 861
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L843
$L844:
	inc	DWORD PTR _i$[ebp]
$L843:
	cmp	DWORD PTR _i$[ebp], 10			; 0000000aH
	jge	$L845
; Line 863
	mov	eax, DWORD PTR _i$[ebp]
	movsx	eax, WORD PTR _potential_reload_regs$S594[eax*2]
	mov	DWORD PTR _j$846[ebp], eax
; Line 884
	cmp	DWORD PTR _j$846[ebp], 0
	jl	$L848
	mov	eax, DWORD PTR _j$846[ebp]
	movsx	eax, BYTE PTR _fixed_regs[eax]
	or	eax, eax
	jne	$L848
	cmp	DWORD PTR _j$846[ebp], 6
	je	$L848
	mov	eax, DWORD PTR _j$846[ebp]
	movsx	eax, BYTE PTR _regs_explicitly_used$S595[eax]
	or	eax, eax
	jne	$L848
	cmp	DWORD PTR _j$846[ebp], 0
	jle	$L850
	mov	eax, DWORD PTR _j$846[ebp]
	dec	eax
	mov	DWORD PTR _other$847[ebp], eax
	mov	eax, DWORD PTR _other$847[ebp]
	movsx	eax, WORD PTR _spill_reg_order$S591[eax*2]
	or	eax, eax
	mov	eax, 0
	setge	al
	mov	DWORD PTR -884+[ebp], eax
	cmp	DWORD PTR -884+[ebp], 0
	je	$L850
	mov	eax, DWORD PTR _class$[ebp]
	movsx	eax, WORD PTR _reg_class_contents[eax*2]
	mov	edx, 1
	mov	cl, BYTE PTR _j$846[ebp]
	shl	edx, cl
	test	eax, edx
	je	$L850
	mov	eax, DWORD PTR _class$[ebp]
	movsx	eax, WORD PTR _reg_class_contents[eax*2]
	mov	edx, 1
	mov	cl, BYTE PTR _other$847[ebp]
	shl	edx, cl
	test	eax, edx
	je	$L850
	mov	eax, DWORD PTR _class$[ebp]
	mov	eax, DWORD PTR _group_mode$679[ebp+eax*4]
	push	eax
	mov	eax, DWORD PTR _other$847[ebp]
	push	eax
	call	_hard_regno_mode_ok
	add	esp, 8
	or	eax, eax
	je	$L850
	mov	eax, DWORD PTR _other$847[ebp]
	movsx	eax, BYTE PTR _counted_for_nongroups$S597[eax]
	or	eax, eax
	jne	$L850
	mov	eax, DWORD PTR _other$847[ebp]
	movsx	eax, BYTE PTR _counted_for_groups$S596[eax]
	or	eax, eax
	je	$L849
$L850:
	cmp	DWORD PTR _j$846[ebp], 9
	jge	$L848
	mov	eax, DWORD PTR _j$846[ebp]
	inc	eax
	mov	DWORD PTR _other$847[ebp], eax
	mov	eax, DWORD PTR _other$847[ebp]
	movsx	eax, WORD PTR _spill_reg_order$S591[eax*2]
	or	eax, eax
	mov	eax, 0
	setge	al
	mov	DWORD PTR -888+[ebp], eax
	cmp	DWORD PTR -888+[ebp], 0
	je	$L848
	mov	eax, DWORD PTR _class$[ebp]
	movsx	eax, WORD PTR _reg_class_contents[eax*2]
	mov	edx, 1
	mov	cl, BYTE PTR _j$846[ebp]
	shl	edx, cl
	test	eax, edx
	je	$L848
	mov	eax, DWORD PTR _class$[ebp]
	movsx	eax, WORD PTR _reg_class_contents[eax*2]
	mov	edx, 1
	mov	cl, BYTE PTR _other$847[ebp]
	shl	edx, cl
	test	eax, edx
	je	$L848
	mov	eax, DWORD PTR _class$[ebp]
	mov	eax, DWORD PTR _group_mode$679[ebp+eax*4]
	push	eax
	mov	eax, DWORD PTR _j$846[ebp]
	push	eax
	call	_hard_regno_mode_ok
	add	esp, 8
	or	eax, eax
	je	$L848
	mov	eax, DWORD PTR _other$847[ebp]
	movsx	eax, BYTE PTR _counted_for_nongroups$S597[eax]
	or	eax, eax
	jne	$L848
	mov	eax, DWORD PTR _other$847[ebp]
	movsx	eax, BYTE PTR _counted_for_groups$S596[eax]
	or	eax, eax
	jne	$L848
$L849:
; Line 890
	mov	eax, DWORD PTR _class$[ebp]
	dec	DWORD PTR _max_groups$677[ebp+eax*4]
; Line 891
	mov	eax, DWORD PTR _class$[ebp]
	mov	ecx, eax
	lea	eax, DWORD PTR [eax+eax*2]
	lea	eax, DWORD PTR [ecx+eax*4]
	lea	eax, DWORD PTR _reg_class_superclasses[eax*4]
	mov	DWORD PTR _p$851[ebp], eax
; Line 892
$L853:
	mov	eax, DWORD PTR _p$851[ebp]
	cmp	DWORD PTR [eax], 13			; 0000000dH
	je	$L854
; Line 893
	mov	eax, DWORD PTR _p$851[ebp]
	mov	eax, DWORD PTR [eax]
	dec	DWORD PTR _max_groups$677[ebp+eax*4]
	add	DWORD PTR _p$851[ebp], 4
	jmp	$L853
$L854:
; Line 896
	mov	eax, DWORD PTR _j$846[ebp]
	mov	BYTE PTR _counted_for_groups$S596[eax], 1
; Line 897
	mov	eax, DWORD PTR _other$847[ebp]
	mov	BYTE PTR _counted_for_groups$S596[eax], 1
; Line 899
	jmp	$L845
; Line 901
$L848:
	jmp	$L844
$L845:
; Line 903
	cmp	DWORD PTR _i$[ebp], 10			; 0000000aH
	jne	$L855
; Line 904
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L856
$L857:
	inc	DWORD PTR _i$[ebp]
$L856:
	cmp	DWORD PTR _i$[ebp], 10			; 0000000aH
	jge	$L858
; Line 906
	mov	eax, DWORD PTR _i$[ebp]
	movsx	eax, WORD PTR _potential_reload_regs$S594[eax*2]
	mov	DWORD PTR _j$859[ebp], eax
; Line 913
	cmp	DWORD PTR _j$859[ebp], 0
	jl	$L860
	mov	eax, DWORD PTR _j$859[ebp]
	inc	eax
	cmp	eax, 10					; 0000000aH
	jge	$L860
	mov	eax, DWORD PTR _j$859[ebp]
	movsx	eax, BYTE PTR _fixed_regs[eax]
	or	eax, eax
	jne	$L860
	cmp	DWORD PTR _j$859[ebp], 6
	je	$L860
	mov	eax, DWORD PTR _j$859[ebp]
	movsx	eax, WORD PTR _spill_reg_order$S591[eax*2]
	or	eax, eax
	jge	$L860
	mov	eax, DWORD PTR _j$859[ebp]
	movsx	eax, WORD PTR _spill_reg_order$S591[eax*2+2]
	or	eax, eax
	jge	$L860
	mov	eax, DWORD PTR _class$[ebp]
	movsx	eax, WORD PTR _reg_class_contents[eax*2]
	mov	edx, 1
	mov	cl, BYTE PTR _j$859[ebp]
	shl	edx, cl
	test	eax, edx
	je	$L860
	mov	eax, DWORD PTR _class$[ebp]
	movsx	eax, WORD PTR _reg_class_contents[eax*2]
	mov	edx, 1
	mov	ecx, DWORD PTR _j$859[ebp]
	inc	ecx
	shl	edx, cl
	test	eax, edx
	je	$L860
	mov	eax, DWORD PTR _class$[ebp]
	mov	eax, DWORD PTR _group_mode$679[ebp+eax*4]
	push	eax
	mov	eax, DWORD PTR _j$859[ebp]
	push	eax
	call	_hard_regno_mode_ok
	add	esp, 8
	or	eax, eax
	je	$L860
	mov	eax, DWORD PTR _j$859[ebp]
	movsx	eax, BYTE PTR _counted_for_nongroups$S597[eax+1]
	or	eax, eax
	jne	$L860
; Line 914
	jmp	$L858
; Line 915
$L860:
	jmp	$L857
$L858:
; Line 920
$L855:
; Line 922
	mov	eax, DWORD PTR _dumpfile$[ebp]
	push	eax
	mov	eax, DWORD PTR _global$[ebp]
	push	eax
	push	0
	lea	eax, DWORD PTR _max_needs$675[ebp]
	push	eax
	mov	eax, DWORD PTR _class$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	call	_new_spill_reg
	add	esp, 24					; 00000018H
	or	DWORD PTR _something_changed$[ebp], eax
; Line 924
	jmp	$L861
$L842:
; Line 929
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L862
$L863:
	inc	DWORD PTR _i$[ebp]
$L862:
	cmp	DWORD PTR _i$[ebp], 10			; 0000000aH
	jge	$L864
; Line 931
	mov	eax, DWORD PTR _i$[ebp]
	movsx	eax, WORD PTR _potential_reload_regs$S594[eax*2]
	mov	DWORD PTR _j$865[ebp], eax
; Line 934
	cmp	DWORD PTR _j$865[ebp], 0
	jl	$L867
	mov	eax, DWORD PTR _j$865[ebp]
	inc	eax
	cmp	eax, 10					; 0000000aH
	jge	$L867
	mov	eax, DWORD PTR _class$[ebp]
	mov	eax, DWORD PTR _group_mode$679[ebp+eax*4]
	push	eax
	mov	eax, DWORD PTR _j$865[ebp]
	push	eax
	call	_hard_regno_mode_ok
	add	esp, 8
	or	eax, eax
	je	$L867
; Line 937
	mov	DWORD PTR _k$866[ebp], 0
	jmp	$L868
$L869:
	inc	DWORD PTR _k$866[ebp]
$L868:
	mov	eax, DWORD PTR _class$[ebp]
	mov	ecx, DWORD PTR _k$866[ebp]
	cmp	DWORD PTR _group_size$676[ebp+eax*4], ecx
	jle	$L870
; Line 941
	mov	eax, DWORD PTR _k$866[ebp]
	add	eax, DWORD PTR _j$865[ebp]
	movsx	eax, WORD PTR _spill_reg_order$S591[eax*2]
	or	eax, eax
	jge	$L872
	mov	eax, DWORD PTR _k$866[ebp]
	mov	ecx, DWORD PTR _j$865[ebp]
	movsx	eax, BYTE PTR _fixed_regs[eax+ecx]
	or	eax, eax
	jne	$L872
	mov	eax, DWORD PTR _k$866[ebp]
	add	eax, DWORD PTR _j$865[ebp]
	cmp	eax, 6
	je	$L872
	mov	eax, DWORD PTR _class$[ebp]
	movsx	eax, WORD PTR _reg_class_contents[eax*2]
	mov	edx, 1
	mov	ecx, DWORD PTR _k$866[ebp]
	add	ecx, DWORD PTR _j$865[ebp]
	shl	edx, cl
	test	eax, edx
	jne	$L871
$L872:
; Line 942
	jmp	$L870
; Line 944
$L871:
	jmp	$L869
$L870:
	mov	eax, DWORD PTR _class$[ebp]
	mov	ecx, DWORD PTR _k$866[ebp]
	cmp	DWORD PTR _group_size$676[ebp+eax*4], ecx
	jne	$L873
; Line 947
	mov	DWORD PTR _k$866[ebp], 0
	jmp	$L875
$L876:
	inc	DWORD PTR _k$866[ebp]
$L875:
	mov	eax, DWORD PTR _class$[ebp]
	mov	ecx, DWORD PTR _k$866[ebp]
	cmp	DWORD PTR _group_size$676[ebp+eax*4], ecx
	jle	$L877
; Line 950
	mov	eax, DWORD PTR _k$866[ebp]
	mov	ecx, DWORD PTR _j$865[ebp]
	mov	BYTE PTR _counted_for_groups$S596[eax+ecx], 1
; Line 951
	mov	DWORD PTR _idx$878[ebp], 0
	jmp	$L879
$L880:
	inc	DWORD PTR _idx$878[ebp]
$L879:
	cmp	DWORD PTR _idx$878[ebp], 10		; 0000000aH
	jge	$L881
; Line 952
	mov	eax, DWORD PTR _idx$878[ebp]
	movsx	eax, WORD PTR _potential_reload_regs$S594[eax*2]
	mov	ecx, DWORD PTR _k$866[ebp]
	add	ecx, DWORD PTR _j$865[ebp]
	cmp	eax, ecx
	jne	$L882
; Line 953
	jmp	$L881
; Line 954
$L882:
	jmp	$L880
$L881:
; Line 956
	mov	eax, DWORD PTR _dumpfile$[ebp]
	push	eax
	mov	eax, DWORD PTR _global$[ebp]
	push	eax
	push	0
	lea	eax, DWORD PTR _max_needs$675[ebp]
	push	eax
	mov	eax, DWORD PTR _class$[ebp]
	push	eax
	mov	eax, DWORD PTR _idx$878[ebp]
	push	eax
	call	_new_spill_reg
	add	esp, 24					; 00000018H
	or	DWORD PTR _something_changed$[ebp], eax
; Line 957
	jmp	$L876
$L877:
; Line 961
	mov	eax, DWORD PTR _class$[ebp]
	dec	DWORD PTR _max_groups$677[ebp+eax*4]
; Line 962
	mov	eax, DWORD PTR _class$[ebp]
	mov	ecx, eax
	lea	eax, DWORD PTR [eax+eax*2]
	lea	eax, DWORD PTR [ecx+eax*4]
	lea	eax, DWORD PTR _reg_class_superclasses[eax*4]
	mov	DWORD PTR _p$874[ebp], eax
; Line 963
$L884:
	mov	eax, DWORD PTR _p$874[ebp]
	cmp	DWORD PTR [eax], 13			; 0000000dH
	je	$L885
; Line 964
	mov	eax, DWORD PTR _p$874[ebp]
	mov	eax, DWORD PTR [eax]
	dec	DWORD PTR _max_groups$677[ebp+eax*4]
	add	DWORD PTR _p$874[ebp], 4
	jmp	$L884
$L885:
; Line 966
	jmp	$L864
; Line 968
$L873:
; Line 969
$L867:
	jmp	$L863
$L864:
; Line 970
$L861:
; Line 971
	jmp	$L840
$L841:
; Line 975
$L887:
	mov	eax, DWORD PTR _class$[ebp]
	cmp	DWORD PTR _max_needs$675[ebp+eax*4], 0
	jg	$L889
	mov	eax, DWORD PTR _class$[ebp]
	cmp	DWORD PTR _max_nongroups$678[ebp+eax*4], 0
	jle	$L888
$L889:
; Line 981
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L890
$L891:
	inc	DWORD PTR _i$[ebp]
$L890:
	cmp	DWORD PTR _i$[ebp], 10			; 0000000aH
	jge	$L892
; Line 992
	mov	eax, DWORD PTR _i$[ebp]
	movsx	eax, WORD PTR _potential_reload_regs$S594[eax*2]
	or	eax, eax
	jl	$L893
	mov	eax, 1
	mov	ecx, DWORD PTR _i$[ebp]
	mov	cl, BYTE PTR _potential_reload_regs$S594[ecx*2]
	shl	eax, cl
	mov	ecx, DWORD PTR _class$[ebp]
	movsx	ecx, WORD PTR _reg_class_contents[ecx*2]
	test	eax, ecx
	je	$L893
	mov	eax, DWORD PTR _class$[ebp]
	cmp	DWORD PTR _max_nongroups$678[ebp+eax*4], 0
	je	$L894
	lea	eax, DWORD PTR _max_groups$677[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	movsx	eax, WORD PTR _potential_reload_regs$S594[eax*2]
	push	eax
	call	_possible_group_p
	add	esp, 8
	or	eax, eax
	je	$L893
$L894:
; Line 993
	jmp	$L892
; Line 998
$L893:
	jmp	$L891
$L892:
; Line 1000
	mov	eax, DWORD PTR _dumpfile$[ebp]
	push	eax
	mov	eax, DWORD PTR _global$[ebp]
	push	eax
	lea	eax, DWORD PTR _max_nongroups$678[ebp]
	push	eax
	lea	eax, DWORD PTR _max_needs$675[ebp]
	push	eax
	mov	eax, DWORD PTR _class$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	call	_new_spill_reg
	add	esp, 24					; 00000018H
	or	DWORD PTR _something_changed$[ebp], eax
; Line 1001
	jmp	$L887
$L888:
; Line 1002
	jmp	$L837
$L838:
; Line 1003
	jmp	$L673
$L674:
; Line 1008
	cmp	DWORD PTR _caller_save_needed, 0
	je	$L895
; Line 1009
	call	_save_call_clobbered_regs
; Line 1018
$L895:
	cmp	DWORD PTR _frame_pointer_needed, 0
	jne	$L897
; Line 1019
	mov	eax, DWORD PTR _first$[ebp]
	push	eax
	call	_eliminate_frame_pointer
	add	esp, 4
; Line 1025
$L897:
	cmp	DWORD PTR _something_needs_reloads$[ebp], 0
	je	$L898
; Line 1026
	mov	eax, DWORD PTR _global$[ebp]
	push	eax
	mov	eax, DWORD PTR _first$[ebp]
	push	eax
	call	_reload_as_needed
	add	esp, 8
; Line 1038
$L898:
	mov	DWORD PTR _i$[ebp], 10			; 0000000aH
	jmp	$L899
$L900:
	inc	DWORD PTR _i$[ebp]
$L899:
	mov	eax, DWORD PTR _max_regno
	cmp	DWORD PTR _i$[ebp], eax
	jge	$L901
; Line 1040
	mov	DWORD PTR _addr$902[ebp], 0
; Line 1041
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_equiv_mem
	cmp	DWORD PTR [ecx+eax*4], 0
	je	$L903
; Line 1042
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_equiv_mem
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _addr$902[ebp], eax
; Line 1043
$L903:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_equiv_address
	cmp	DWORD PTR [ecx+eax*4], 0
	je	$L904
; Line 1044
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_equiv_address
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _addr$902[ebp], eax
; Line 1045
$L904:
	cmp	DWORD PTR _addr$902[ebp], 0
	je	$L905
; Line 1047
	cmp	DWORD PTR _frame_pointer_needed, 0
	jne	$L906
; Line 1048
	mov	DWORD PTR _offset$907[ebp], -1
	mov	eax, DWORD PTR _stack_pointer_rtx
	mov	DWORD PTR _regs$908[ebp], eax
	mov	eax, DWORD PTR _addr$902[ebp]
	cmp	DWORD PTR _frame_pointer_rtx, eax
	jne	$L909
	mov	DWORD PTR _offset$907[ebp], 0
	jmp	$L910
$L909:
	mov	eax, DWORD PTR _addr$902[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L911
	mov	eax, DWORD PTR _addr$902[ebp]
	mov	ecx, DWORD PTR _frame_pointer_rtx
	cmp	DWORD PTR [eax+4], ecx
	jne	$L911
	mov	eax, DWORD PTR _addr$902[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L911
	mov	eax, DWORD PTR _addr$902[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _offset$907[ebp], eax
	jmp	$L912
$L911:
	mov	eax, DWORD PTR _addr$902[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L913
	mov	eax, DWORD PTR _addr$902[ebp]
	mov	ecx, DWORD PTR _frame_pointer_rtx
	cmp	DWORD PTR [eax+4], ecx
	jne	$L913
	mov	eax, DWORD PTR _addr$902[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _other_reg$914[ebp], eax
	mov	DWORD PTR _offset$907[ebp], 0
	mov	eax, DWORD PTR _other_reg$914[ebp]
	push	eax
	mov	eax, DWORD PTR _stack_pointer_rtx
	push	eax
	push	4
	push	44					; 0000002cH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	DWORD PTR _regs$908[ebp], eax
	jmp	$L915
$L913:
	mov	eax, DWORD PTR _addr$902[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L916
	mov	eax, DWORD PTR _addr$902[ebp]
	mov	ecx, DWORD PTR _frame_pointer_rtx
	cmp	DWORD PTR [eax+8], ecx
	jne	$L916
	mov	eax, DWORD PTR _addr$902[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _other_reg$917[ebp], eax
	mov	DWORD PTR _offset$907[ebp], 0
	mov	eax, DWORD PTR _other_reg$917[ebp]
	push	eax
	mov	eax, DWORD PTR _stack_pointer_rtx
	push	eax
	push	4
	push	44					; 0000002cH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	DWORD PTR _regs$908[ebp], eax
	jmp	$L918
$L916:
	mov	eax, DWORD PTR _addr$902[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L919
	mov	eax, DWORD PTR _addr$902[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L919
	mov	eax, DWORD PTR _addr$902[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _frame_pointer_rtx
	cmp	DWORD PTR [eax+4], ecx
	jne	$L919
	mov	eax, DWORD PTR _addr$902[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L919
	mov	eax, DWORD PTR _addr$902[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _other_reg$920[ebp], eax
	mov	eax, DWORD PTR _addr$902[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _offset$907[ebp], eax
	mov	eax, DWORD PTR _other_reg$920[ebp]
	push	eax
	mov	eax, DWORD PTR _stack_pointer_rtx
	push	eax
	push	4
	push	44					; 0000002cH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	DWORD PTR _regs$908[ebp], eax
	jmp	$L921
$L919:
	mov	eax, DWORD PTR _addr$902[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L922
	mov	eax, DWORD PTR _addr$902[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L922
	mov	eax, DWORD PTR _addr$902[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _frame_pointer_rtx
	cmp	DWORD PTR [eax+8], ecx
	jne	$L922
	mov	eax, DWORD PTR _addr$902[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L922
	mov	eax, DWORD PTR _addr$902[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _other_reg$923[ebp], eax
	mov	eax, DWORD PTR _addr$902[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _offset$907[ebp], eax
	mov	eax, DWORD PTR _other_reg$923[ebp]
	push	eax
	mov	eax, DWORD PTR _stack_pointer_rtx
	push	eax
	push	4
	push	44					; 0000002cH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	DWORD PTR _regs$908[ebp], eax
$L922:
$L921:
$L918:
$L915:
$L912:
$L910:
	cmp	DWORD PTR _offset$907[ebp], 0
	jl	$L924
	mov	DWORD PTR _regno$925[ebp], 8
	jmp	$L926
$L927:
	inc	DWORD PTR _regno$925[ebp]
$L926:
	cmp	DWORD PTR _regno$925[ebp], 10		; 0000000aH
	jge	$L928
	mov	eax, DWORD PTR _regno$925[ebp]
	movsx	eax, BYTE PTR _regs_ever_live[eax]
	or	eax, eax
	je	$L929
	mov	eax, DWORD PTR _regno$925[ebp]
	movsx	eax, BYTE PTR _call_used_regs[eax]
	or	eax, eax
	jne	$L929
	add	DWORD PTR _offset$907[ebp], 8
$L929:
	jmp	$L927
$L928:
	mov	DWORD PTR _regno$925[ebp], 0
	jmp	$L930
$L931:
	inc	DWORD PTR _regno$925[ebp]
$L930:
	cmp	DWORD PTR _regno$925[ebp], 8
	jge	$L932
	mov	eax, DWORD PTR _regno$925[ebp]
	movsx	eax, BYTE PTR _regs_ever_live[eax]
	or	eax, eax
	je	$L933
	mov	eax, DWORD PTR _regno$925[ebp]
	movsx	eax, BYTE PTR _call_used_regs[eax]
	or	eax, eax
	jne	$L933
	add	DWORD PTR _offset$907[ebp], 4
$L933:
	jmp	$L931
$L932:
	sub	DWORD PTR _offset$907[ebp], 4
	mov	eax, DWORD PTR _offset$907[ebp]
	push	eax
	mov	eax, DWORD PTR _regs$908[ebp]
	push	eax
	call	_plus_constant
	add	esp, 8
	mov	DWORD PTR _addr$902[ebp], eax
$L924:
$L906:
; Line 1049
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	or	eax, eax
	jge	$L934
; Line 1051
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _regno_reg_rtx
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _reg$935[ebp], eax
; Line 1052
	mov	eax, DWORD PTR _addr$902[ebp]
	mov	ecx, DWORD PTR _reg$935[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 1053
	mov	eax, DWORD PTR _reg$935[ebp]
	and	DWORD PTR [eax], -134217729		; f7ffffffH
; Line 1054
	mov	eax, DWORD PTR _reg$935[ebp]
	mov	eax, DWORD PTR [eax]
	and	eax, -65499				; ffff0025H
	or	eax, 37					; 00000025H
	mov	ecx, DWORD PTR _reg$935[ebp]
	mov	DWORD PTR [ecx], eax
; Line 1056
	jmp	$L936
$L934:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_equiv_mem
	cmp	DWORD PTR [ecx+eax*4], 0
	je	$L937
; Line 1057
	mov	eax, DWORD PTR _addr$902[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _reg_equiv_mem
	mov	ecx, DWORD PTR [edx+ecx*4]
	mov	DWORD PTR [ecx+4], eax
; Line 1058
$L937:
$L936:
; Line 1059
$L905:
	jmp	$L900
$L901:
; Line 1060
$L627:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_reload	ENDP
_regno$ = 8
_max_groups$ = 12
_i$ = -4
_group$ = -8
_possible_group_p PROC NEAR
; Line 1069
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 1071
	mov	DWORD PTR _group$[ebp], 0
; Line 1073
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L943
$L944:
	inc	DWORD PTR _i$[ebp]
$L943:
	cmp	DWORD PTR _i$[ebp], 13			; 0000000dH
	jge	$L945
; Line 1074
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _max_groups$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	or	DWORD PTR _group$[ebp], eax
	jmp	$L944
$L945:
; Line 1076
	cmp	DWORD PTR _group$[ebp], 0
	jne	$L946
; Line 1077
	mov	eax, 1
	jmp	$L940
; Line 1080
$L946:
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L947
$L948:
	inc	DWORD PTR _i$[ebp]
$L947:
	cmp	DWORD PTR _i$[ebp], 9
	jge	$L949
; Line 1082
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _regno$[ebp], eax
	je	$L951
	mov	eax, DWORD PTR _i$[ebp]
	inc	eax
	cmp	eax, DWORD PTR _regno$[ebp]
	jne	$L950
$L951:
; Line 1083
	jmp	$L948
; Line 1086
$L950:
; Line 1089
	mov	eax, DWORD PTR _i$[ebp]
	movsx	eax, WORD PTR _spill_reg_order$S591[eax*2]
	or	eax, eax
	jge	$L952
	mov	eax, DWORD PTR _i$[ebp]
	movsx	eax, WORD PTR _spill_reg_order$S591[eax*2+2]
	or	eax, eax
	jge	$L952
	mov	eax, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR _regs_explicitly_used$S595[eax]
	or	eax, eax
	jne	$L952
	mov	eax, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR _regs_explicitly_used$S595[eax+1]
	or	eax, eax
	jne	$L952
	mov	eax, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR _fixed_regs[eax]
	or	eax, eax
	jne	$L952
	cmp	DWORD PTR _i$[ebp], 6
	je	$L952
	mov	eax, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR _fixed_regs[eax+1]
	or	eax, eax
	jne	$L952
	mov	eax, DWORD PTR _i$[ebp]
	inc	eax
	cmp	eax, 6
	je	$L952
; Line 1090
	mov	eax, 1
	jmp	$L940
; Line 1094
$L952:
; Line 1098
	mov	eax, DWORD PTR _i$[ebp]
	movsx	eax, WORD PTR _spill_reg_order$S591[eax*2]
	or	eax, eax
	jge	$L953
	mov	eax, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR _regs_explicitly_used$S595[eax]
	or	eax, eax
	jne	$L953
	mov	eax, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR _fixed_regs[eax]
	or	eax, eax
	jne	$L953
	cmp	DWORD PTR _i$[ebp], 6
	je	$L953
	mov	eax, DWORD PTR _i$[ebp]
	movsx	eax, WORD PTR _spill_reg_order$S591[eax*2+2]
	or	eax, eax
	jl	$L953
	mov	eax, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR _counted_for_groups$S596[eax+1]
	or	eax, eax
	jne	$L953
	mov	eax, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR _counted_for_nongroups$S597[eax+1]
	or	eax, eax
	jne	$L953
; Line 1099
	mov	eax, 1
	jmp	$L940
; Line 1100
$L953:
; Line 1104
	mov	eax, DWORD PTR _i$[ebp]
	movsx	eax, WORD PTR _spill_reg_order$S591[eax*2+2]
	or	eax, eax
	jge	$L954
	mov	eax, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR _regs_explicitly_used$S595[eax+1]
	or	eax, eax
	jne	$L954
	mov	eax, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR _fixed_regs[eax+1]
	or	eax, eax
	jne	$L954
	mov	eax, DWORD PTR _i$[ebp]
	inc	eax
	cmp	eax, 6
	je	$L954
	mov	eax, DWORD PTR _i$[ebp]
	movsx	eax, WORD PTR _spill_reg_order$S591[eax*2]
	or	eax, eax
	jl	$L954
	mov	eax, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR _counted_for_groups$S596[eax]
	or	eax, eax
	jne	$L954
	mov	eax, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR _counted_for_nongroups$S597[eax]
	or	eax, eax
	jne	$L954
; Line 1105
	mov	eax, 1
	jmp	$L940
; Line 1106
$L954:
	jmp	$L948
$L949:
; Line 1108
	sub	eax, eax
	jmp	$L940
; Line 1109
$L940:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_possible_group_p ENDP
_mode0$ = 8
_mode1$ = 12
_class$ = 16
_regno$ = -4
_modes_equiv_for_class_p PROC NEAR
; Line 1119
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 1121
	mov	DWORD PTR _regno$[ebp], 0
	jmp	$L960
$L961:
	inc	DWORD PTR _regno$[ebp]
$L960:
	cmp	DWORD PTR _regno$[ebp], 10		; 0000000aH
	jge	$L962
; Line 1129
	mov	eax, DWORD PTR _class$[ebp]
	movsx	eax, WORD PTR _reg_class_contents[eax*2]
	mov	edx, 1
	mov	cl, BYTE PTR _regno$[ebp]
	shl	edx, cl
	test	eax, edx
	je	$L963
	mov	eax, DWORD PTR _mode0$[ebp]
	push	eax
	mov	eax, DWORD PTR _regno$[ebp]
	push	eax
	call	_hard_regno_mode_ok
	add	esp, 8
	mov	ebx, eax
	mov	eax, DWORD PTR _mode1$[ebp]
	push	eax
	mov	eax, DWORD PTR _regno$[ebp]
	push	eax
	call	_hard_regno_mode_ok
	add	esp, 8
	cmp	ebx, eax
	je	$L963
	cmp	DWORD PTR _regno$[ebp], 8
	jl	$L1821
	mov	DWORD PTR -8+[ebp], 1
	jmp	$L1822
$L1821:
	mov	eax, DWORD PTR _mode0$[ebp]
	mov	eax, DWORD PTR _mode_size[eax*4]
	add	eax, 3
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	mov	DWORD PTR -8+[ebp], eax
$L1822:
	cmp	DWORD PTR _regno$[ebp], 8
	jl	$L1823
	mov	DWORD PTR -12+[ebp], 1
	jmp	$L1824
$L1823:
	mov	eax, DWORD PTR _mode1$[ebp]
	mov	eax, DWORD PTR _mode_size[eax*4]
	add	eax, 3
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	mov	DWORD PTR -12+[ebp], eax
$L1824:
	mov	eax, DWORD PTR -12+[ebp]
	cmp	DWORD PTR -8+[ebp], eax
	je	$L963
; Line 1130
	sub	eax, eax
	jmp	$L958
; Line 1131
$L963:
	jmp	$L961
$L962:
; Line 1132
	mov	eax, 1
	jmp	$L958
; Line 1133
$L958:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_modes_equiv_for_class_p ENDP
_TEXT	ENDS
EXTRN	_fprintf:NEAR
_DATA	SEGMENT
$SG976	DB	'Spilling reg %d.', 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_i$ = 8
_class$ = 12
_max_needs$ = 16
_max_nongroups$ = 20
_global$ = 24
_dumpfile$ = 28
_p$ = -8
_val$ = -4
_regno$ = -12
_new_spill_reg PROC NEAR
; Line 1152
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 1155
	mov	eax, DWORD PTR _i$[ebp]
	movsx	eax, WORD PTR _potential_reload_regs$S594[eax*2]
	mov	DWORD PTR _regno$[ebp], eax
; Line 1157
	cmp	DWORD PTR _i$[ebp], 10			; 0000000aH
	jl	$L974
; Line 1158
	call	_abort
; Line 1162
$L974:
	mov	eax, DWORD PTR _i$[ebp]
	mov	WORD PTR _potential_reload_regs$S594[eax*2], -1
; Line 1163
	mov	al, BYTE PTR _regno$[ebp]
	mov	ecx, DWORD PTR _n_spills$S588
	mov	BYTE PTR _spill_regs$S593[ecx], al
; Line 1164
	mov	eax, DWORD PTR _n_spills$S588
	mov	ecx, DWORD PTR _regno$[ebp]
	mov	WORD PTR _spill_reg_order$S591[ecx*2], ax
; Line 1165
	mov	eax, DWORD PTR _regno$[ebp]
	mov	WORD PTR _forbidden_regs$S592[eax*2], 1
; Line 1166
	cmp	DWORD PTR _dumpfile$[ebp], 0
	je	$L975
; Line 1167
	mov	eax, DWORD PTR _n_spills$S588
	movsx	eax, BYTE PTR _spill_regs$S593[eax]
	push	eax
	push	OFFSET $SG976
	mov	eax, DWORD PTR _dumpfile$[ebp]
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 1171
$L975:
	mov	eax, DWORD PTR _class$[ebp]
	mov	ecx, DWORD PTR _max_needs$[ebp]
	dec	DWORD PTR [ecx+eax*4]
; Line 1172
	mov	eax, DWORD PTR _class$[ebp]
	mov	ecx, eax
	lea	eax, DWORD PTR [eax+eax*2]
	lea	eax, DWORD PTR [ecx+eax*4]
	lea	eax, DWORD PTR _reg_class_superclasses[eax*4]
	mov	DWORD PTR _p$[ebp], eax
; Line 1173
$L978:
	mov	eax, DWORD PTR _p$[ebp]
	cmp	DWORD PTR [eax], 13			; 0000000dH
	je	$L979
; Line 1174
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _max_needs$[ebp]
	dec	DWORD PTR [ecx+eax*4]
	add	DWORD PTR _p$[ebp], 4
	jmp	$L978
$L979:
; Line 1176
	cmp	DWORD PTR _max_nongroups$[ebp], 0
	je	$L980
	mov	eax, DWORD PTR _class$[ebp]
	mov	ecx, DWORD PTR _max_nongroups$[ebp]
	cmp	DWORD PTR [ecx+eax*4], 0
	jle	$L980
; Line 1178
	mov	eax, DWORD PTR _regno$[ebp]
	mov	BYTE PTR _counted_for_nongroups$S597[eax], 1
; Line 1179
	mov	eax, DWORD PTR _class$[ebp]
	mov	ecx, DWORD PTR _max_nongroups$[ebp]
	dec	DWORD PTR [ecx+eax*4]
; Line 1180
	mov	eax, DWORD PTR _class$[ebp]
	mov	ecx, eax
	lea	eax, DWORD PTR [eax+eax*2]
	lea	eax, DWORD PTR [ecx+eax*4]
	lea	eax, DWORD PTR _reg_class_superclasses[eax*4]
	mov	DWORD PTR _p$[ebp], eax
; Line 1181
$L982:
	mov	eax, DWORD PTR _p$[ebp]
	cmp	DWORD PTR [eax], 13			; 0000000dH
	je	$L983
; Line 1182
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _max_nongroups$[ebp]
	dec	DWORD PTR [ecx+eax*4]
	add	DWORD PTR _p$[ebp], 4
	jmp	$L982
$L983:
; Line 1188
$L980:
	mov	eax, DWORD PTR _dumpfile$[ebp]
	push	eax
	mov	eax, DWORD PTR _global$[ebp]
	push	eax
	mov	eax, DWORD PTR _n_spills$S588
	movsx	eax, BYTE PTR _spill_regs$S593[eax]
	push	eax
	call	_spill_hard_reg
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _val$[ebp], eax
; Line 1190
	mov	eax, DWORD PTR _n_spills$S588
	movsx	eax, BYTE PTR _spill_regs$S593[eax]
	mov	BYTE PTR _regs_ever_live[eax], 1
; Line 1191
	inc	DWORD PTR _n_spills$S588
; Line 1193
	mov	eax, DWORD PTR _val$[ebp]
	jmp	$L970
; Line 1194
$L970:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_new_spill_reg ENDP
_TEXT	ENDS
EXTRN	_push_operand:NEAR
_BSS	SEGMENT
_frame_pointer_address_altered$S602 DD 01H DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
_first$ = 8
_depth$ = -16
_max_uid$ = -8
_label_depth$ = -4
_i$ = -20
_insn$ = -12
_pattern$997 = -24
_delta$1008 = -28
_eliminate_frame_pointer PROC NEAR
; Line 1202
	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H
	push	ebx
	push	esi
	push	edi
; Line 1203
	mov	DWORD PTR _depth$[ebp], 0
; Line 1204
	call	_get_max_uid
	mov	DWORD PTR _max_uid$[ebp], eax
; Line 1205
	mov	eax, DWORD PTR _max_uid$[ebp]
	lea	eax, DWORD PTR [eax*4+4]
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _label_depth$[ebp], eax
; Line 1209
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L991
$L992:
	inc	DWORD PTR _i$[ebp]
$L991:
	mov	eax, DWORD PTR _max_uid$[ebp]
	cmp	DWORD PTR _i$[ebp], eax
	jg	$L993
; Line 1210
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _label_depth$[ebp]
	mov	DWORD PTR [ecx+eax*4], -1
	jmp	$L992
$L993:
; Line 1219
	mov	eax, DWORD PTR _first$[ebp]
	mov	DWORD PTR _insn$[ebp], eax
	jmp	$L994
$L995:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _insn$[ebp], eax
$L994:
	cmp	DWORD PTR _insn$[ebp], 0
	je	$L996
; Line 1221
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _pattern$997[ebp], eax
; Line 1222
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR -32+[ebp], eax
	jmp	$L998
; Line 1224
$L1002:
; Line 1225
	mov	DWORD PTR _frame_pointer_address_altered$S602, 0
; Line 1226
	mov	eax, DWORD PTR _depth$[ebp]
	push	eax
	mov	eax, DWORD PTR _pattern$997[ebp]
	push	eax
	call	_alter_frame_pointer_addresses
	add	esp, 8
; Line 1228
	cmp	DWORD PTR _frame_pointer_address_altered$S602, 0
	je	$L1003
; Line 1229
	mov	eax, DWORD PTR _insn$[ebp]
	mov	DWORD PTR [eax+20], -1
; Line 1232
$L1003:
	mov	eax, DWORD PTR _pattern$997[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1004
; Line 1236
	mov	eax, DWORD PTR _pattern$997[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	mov	eax, DWORD PTR _pattern$997[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_push_operand
	add	esp, 8
	or	eax, eax
	je	$L1006
; Line 1237
	mov	eax, DWORD PTR _pattern$997[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -12582913				; ff3fffffH
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	inc	eax
	and	eax, -2					; fffffffeH
	add	DWORD PTR _depth$[ebp], eax
; Line 1239
$L1006:
; Line 1240
	mov	eax, DWORD PTR _pattern$997[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1007
	mov	eax, DWORD PTR _pattern$997[ebp]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jne	$L1007
; Line 1245
	mov	eax, DWORD PTR _pattern$997[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1009
	mov	eax, DWORD PTR _pattern$997[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1009
	mov	eax, DWORD PTR _pattern$997[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jne	$L1009
; Line 1246
	mov	eax, DWORD PTR _pattern$997[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _delta$1008[ebp], eax
; Line 1247
	jmp	$L1010
$L1009:
; Line 1249
	mov	eax, DWORD PTR _pattern$997[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2949120				; 002d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1011
	mov	eax, DWORD PTR _pattern$997[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1011
	mov	eax, DWORD PTR _pattern$997[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jne	$L1011
; Line 1250
	mov	eax, DWORD PTR _pattern$997[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	neg	eax
	mov	DWORD PTR _delta$1008[ebp], eax
; Line 1251
	jmp	$L1012
$L1011:
	call	_abort
$L1012:
$L1010:
; Line 1253
	sub	eax, eax
	sub	eax, DWORD PTR _delta$1008[ebp]
	neg	eax
	sub	DWORD PTR _depth$[ebp], eax
; Line 1258
$L1007:
; Line 1259
$L1004:
	jmp	$L999
; Line 1261
$L1013:
; Line 1262
	mov	DWORD PTR _frame_pointer_address_altered$S602, 0
; Line 1263
	mov	eax, DWORD PTR _depth$[ebp]
	push	eax
	mov	eax, DWORD PTR _pattern$997[ebp]
	push	eax
	call	_alter_frame_pointer_addresses
	add	esp, 8
; Line 1265
	cmp	DWORD PTR _frame_pointer_address_altered$S602, 0
	je	$L1014
; Line 1266
	mov	eax, DWORD PTR _insn$[ebp]
	mov	DWORD PTR [eax+20], -1
; Line 1268
$L1014:
	mov	eax, DWORD PTR _pattern$997[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1507328				; 00170000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1015
; Line 1269
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L1016
$L1017:
	inc	DWORD PTR _i$[ebp]
$L1016:
	mov	eax, DWORD PTR _pattern$997[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	DWORD PTR [eax], ecx
	jbe	$L1018
; Line 1270
	mov	eax, DWORD PTR _depth$[ebp]
	mov	ecx, DWORD PTR _pattern$997[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	mov	edx, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR [ecx+edx*4+4]
	mov	ecx, DWORD PTR [ecx+4]
	mov	ecx, DWORD PTR [ecx+4]
	mov	edx, DWORD PTR _label_depth$[ebp]
	mov	DWORD PTR [edx+ecx*4], eax
	jmp	$L1017
$L1018:
; Line 1271
	jmp	$L1019
$L1015:
	mov	eax, DWORD PTR _pattern$997[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1572864				; 00180000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1020
; Line 1273
	mov	eax, DWORD PTR _depth$[ebp]
	mov	ecx, DWORD PTR _pattern$997[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	mov	ecx, DWORD PTR [ecx+4]
	mov	ecx, DWORD PTR [ecx+4]
	mov	edx, DWORD PTR _label_depth$[ebp]
	mov	DWORD PTR [edx+ecx*4], eax
; Line 1274
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L1021
$L1022:
	inc	DWORD PTR _i$[ebp]
$L1021:
	mov	eax, DWORD PTR _pattern$997[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	DWORD PTR [eax], ecx
	jbe	$L1023
; Line 1275
	mov	eax, DWORD PTR _depth$[ebp]
	mov	ecx, DWORD PTR _pattern$997[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	mov	edx, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR [ecx+edx*4+4]
	mov	ecx, DWORD PTR [ecx+4]
	mov	ecx, DWORD PTR [ecx+4]
	mov	edx, DWORD PTR _label_depth$[ebp]
	mov	DWORD PTR [edx+ecx*4], eax
	jmp	$L1022
$L1023:
; Line 1277
	jmp	$L1024
$L1020:
	mov	eax, DWORD PTR _insn$[ebp]
	cmp	DWORD PTR [eax+32], 0
	je	$L1025
; Line 1278
	mov	eax, DWORD PTR _depth$[ebp]
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	ecx, DWORD PTR [ecx+32]
	mov	ecx, DWORD PTR [ecx+4]
	mov	edx, DWORD PTR _label_depth$[ebp]
	mov	DWORD PTR [edx+ecx*4], eax
; Line 1279
	jmp	$L1026
$L1025:
; Line 1280
	jmp	$L999
$L1026:
$L1024:
$L1019:
; Line 1282
$L1027:
; Line 1283
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _label_depth$[ebp]
	cmp	DWORD PTR [ecx+eax*4], 0
	jl	$L1028
; Line 1284
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _label_depth$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _depth$[ebp], eax
; Line 1285
$L1028:
	jmp	$L999
; Line 1287
$L1029:
; Line 1288
	mov	DWORD PTR _frame_pointer_address_altered$S602, 0
; Line 1289
	mov	eax, DWORD PTR _depth$[ebp]
	push	eax
	mov	eax, DWORD PTR _pattern$997[ebp]
	push	eax
	call	_alter_frame_pointer_addresses
	add	esp, 8
; Line 1291
	cmp	DWORD PTR _frame_pointer_address_altered$S602, 0
	je	$L1030
; Line 1292
	mov	eax, DWORD PTR _insn$[ebp]
	mov	DWORD PTR [eax+20], -1
; Line 1293
$L1030:
	jmp	$L999
; Line 1294
	jmp	$L999
$L998:
	cmp	DWORD PTR -32+[ebp], 13			; 0000000dH
	je	$L1002
	cmp	DWORD PTR -32+[ebp], 14			; 0000000eH
	je	$L1013
	cmp	DWORD PTR -32+[ebp], 15			; 0000000fH
	je	$L1029
	cmp	DWORD PTR -32+[ebp], 17			; 00000011H
	je	$L1027
	jmp	$L999
$L999:
; Line 1295
	jmp	$L995
$L996:
; Line 1296
$L985:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_eliminate_frame_pointer ENDP
_TEXT	ENDS
EXTRN	_rtx_length:BYTE
EXTRN	_rtx_format:BYTE
_TEXT	SEGMENT
_other_reg$1090 = -76
_other_reg$1093 = -80
_regno$1095 = -84
_x$ = 8
_depth$ = 12
_i$ = -12
_fmt$ = -8
_code$ = -4
_oldx$1106 = -88
_offset$1107 = -96
_regs$1108 = -92
_oldx$1044 = -16
_offset$1045 = -24
_regs$1046 = -20
_other_reg$1114 = -100
_other_reg$1052 = -28
_other_reg$1117 = -104
_other_reg$1055 = -32
_other_reg$1120 = -108
_other_reg$1058 = -36
_other_reg$1123 = -112
_regno$1125 = -116
_other_reg$1061 = -40
_regno$1063 = -44
_addr$1074 = -48
_mem$1075 = -56
_old_addr$1076 = -52
_j$1141 = -120
_offset$1077 = -64
_regs$1078 = -60
_other_reg$1084 = -68
_other_reg$1087 = -72
_alter_frame_pointer_addresses PROC NEAR
; Line 1308
	push	ebp
	mov	ebp, esp
	sub	esp, 124				; 0000007cH
	push	ebx
	push	esi
	push	edi
; Line 1311
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$[ebp], eax
; Line 1313
	mov	eax, DWORD PTR _code$[ebp]
	mov	DWORD PTR -124+[ebp], eax
	jmp	$L1037
; Line 1315
$L1041:
; Line 1322
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L1033
; Line 1324
$L1042:
; Line 1327
	mov	eax, DWORD PTR _x$[ebp]
	cmp	DWORD PTR _frame_pointer_rtx, eax
	jne	$L1043
; Line 1329
	mov	eax, DWORD PTR _x$[ebp]
	mov	DWORD PTR _oldx$1044[ebp], eax
; Line 1330
	mov	DWORD PTR _offset$1045[ebp], -1
	mov	eax, DWORD PTR _stack_pointer_rtx
	mov	DWORD PTR _regs$1046[ebp], eax
	mov	eax, DWORD PTR _x$[ebp]
	cmp	DWORD PTR _frame_pointer_rtx, eax
	jne	$L1047
	mov	DWORD PTR _offset$1045[ebp], 0
	jmp	$L1048
$L1047:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1049
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR _frame_pointer_rtx
	cmp	DWORD PTR [eax+4], ecx
	jne	$L1049
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1049
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _offset$1045[ebp], eax
	jmp	$L1050
$L1049:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1051
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR _frame_pointer_rtx
	cmp	DWORD PTR [eax+4], ecx
	jne	$L1051
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _other_reg$1052[ebp], eax
	mov	DWORD PTR _offset$1045[ebp], 0
	mov	eax, DWORD PTR _other_reg$1052[ebp]
	push	eax
	mov	eax, DWORD PTR _stack_pointer_rtx
	push	eax
	push	4
	push	44					; 0000002cH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	DWORD PTR _regs$1046[ebp], eax
	jmp	$L1053
$L1051:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1054
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR _frame_pointer_rtx
	cmp	DWORD PTR [eax+8], ecx
	jne	$L1054
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _other_reg$1055[ebp], eax
	mov	DWORD PTR _offset$1045[ebp], 0
	mov	eax, DWORD PTR _other_reg$1055[ebp]
	push	eax
	mov	eax, DWORD PTR _stack_pointer_rtx
	push	eax
	push	4
	push	44					; 0000002cH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	DWORD PTR _regs$1046[ebp], eax
	jmp	$L1056
$L1054:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1057
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1057
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _frame_pointer_rtx
	cmp	DWORD PTR [eax+4], ecx
	jne	$L1057
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1057
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _other_reg$1058[ebp], eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _offset$1045[ebp], eax
	mov	eax, DWORD PTR _other_reg$1058[ebp]
	push	eax
	mov	eax, DWORD PTR _stack_pointer_rtx
	push	eax
	push	4
	push	44					; 0000002cH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	DWORD PTR _regs$1046[ebp], eax
	jmp	$L1059
$L1057:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1060
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1060
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _frame_pointer_rtx
	cmp	DWORD PTR [eax+8], ecx
	jne	$L1060
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1060
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _other_reg$1061[ebp], eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _offset$1045[ebp], eax
	mov	eax, DWORD PTR _other_reg$1061[ebp]
	push	eax
	mov	eax, DWORD PTR _stack_pointer_rtx
	push	eax
	push	4
	push	44					; 0000002cH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	DWORD PTR _regs$1046[ebp], eax
$L1060:
$L1059:
$L1056:
$L1053:
$L1050:
$L1048:
	cmp	DWORD PTR _offset$1045[ebp], 0
	jl	$L1062
	mov	DWORD PTR _regno$1063[ebp], 8
	jmp	$L1064
$L1065:
	inc	DWORD PTR _regno$1063[ebp]
$L1064:
	cmp	DWORD PTR _regno$1063[ebp], 10		; 0000000aH
	jge	$L1066
	mov	eax, DWORD PTR _regno$1063[ebp]
	movsx	eax, BYTE PTR _regs_ever_live[eax]
	or	eax, eax
	je	$L1067
	mov	eax, DWORD PTR _regno$1063[ebp]
	movsx	eax, BYTE PTR _call_used_regs[eax]
	or	eax, eax
	jne	$L1067
	add	DWORD PTR _offset$1045[ebp], 8
$L1067:
	jmp	$L1065
$L1066:
	mov	DWORD PTR _regno$1063[ebp], 0
	jmp	$L1068
$L1069:
	inc	DWORD PTR _regno$1063[ebp]
$L1068:
	cmp	DWORD PTR _regno$1063[ebp], 8
	jge	$L1070
	mov	eax, DWORD PTR _regno$1063[ebp]
	movsx	eax, BYTE PTR _regs_ever_live[eax]
	or	eax, eax
	je	$L1071
	mov	eax, DWORD PTR _regno$1063[ebp]
	movsx	eax, BYTE PTR _call_used_regs[eax]
	or	eax, eax
	jne	$L1071
	add	DWORD PTR _offset$1045[ebp], 4
$L1071:
	jmp	$L1069
$L1070:
	sub	DWORD PTR _offset$1045[ebp], 4
	mov	eax, DWORD PTR _depth$[ebp]
	add	eax, DWORD PTR _offset$1045[ebp]
	push	eax
	mov	eax, DWORD PTR _regs$1046[ebp]
	push	eax
	call	_plus_constant
	add	esp, 8
	mov	DWORD PTR _x$[ebp], eax
$L1062:
; Line 1331
	mov	eax, DWORD PTR _oldx$1044[ebp]
	cmp	DWORD PTR _x$[ebp], eax
	je	$L1072
; Line 1332
	mov	DWORD PTR _frame_pointer_address_altered$S602, 1
; Line 1333
$L1072:
; Line 1334
$L1043:
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L1033
; Line 1336
$L1073:
; Line 1338
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _addr$1074[ebp], eax
; Line 1340
	mov	eax, DWORD PTR _addr$1074[ebp]
	mov	DWORD PTR _old_addr$1076[ebp], eax
; Line 1341
	mov	DWORD PTR _offset$1077[ebp], -1
	mov	eax, DWORD PTR _stack_pointer_rtx
	mov	DWORD PTR _regs$1078[ebp], eax
	mov	eax, DWORD PTR _addr$1074[ebp]
	cmp	DWORD PTR _frame_pointer_rtx, eax
	jne	$L1079
	mov	DWORD PTR _offset$1077[ebp], 0
	jmp	$L1080
$L1079:
	mov	eax, DWORD PTR _addr$1074[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1081
	mov	eax, DWORD PTR _addr$1074[ebp]
	mov	ecx, DWORD PTR _frame_pointer_rtx
	cmp	DWORD PTR [eax+4], ecx
	jne	$L1081
	mov	eax, DWORD PTR _addr$1074[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1081
	mov	eax, DWORD PTR _addr$1074[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _offset$1077[ebp], eax
	jmp	$L1082
$L1081:
	mov	eax, DWORD PTR _addr$1074[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1083
	mov	eax, DWORD PTR _addr$1074[ebp]
	mov	ecx, DWORD PTR _frame_pointer_rtx
	cmp	DWORD PTR [eax+4], ecx
	jne	$L1083
	mov	eax, DWORD PTR _addr$1074[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _other_reg$1084[ebp], eax
	mov	DWORD PTR _offset$1077[ebp], 0
	mov	eax, DWORD PTR _other_reg$1084[ebp]
	push	eax
	mov	eax, DWORD PTR _stack_pointer_rtx
	push	eax
	push	4
	push	44					; 0000002cH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	DWORD PTR _regs$1078[ebp], eax
	jmp	$L1085
$L1083:
	mov	eax, DWORD PTR _addr$1074[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1086
	mov	eax, DWORD PTR _addr$1074[ebp]
	mov	ecx, DWORD PTR _frame_pointer_rtx
	cmp	DWORD PTR [eax+8], ecx
	jne	$L1086
	mov	eax, DWORD PTR _addr$1074[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _other_reg$1087[ebp], eax
	mov	DWORD PTR _offset$1077[ebp], 0
	mov	eax, DWORD PTR _other_reg$1087[ebp]
	push	eax
	mov	eax, DWORD PTR _stack_pointer_rtx
	push	eax
	push	4
	push	44					; 0000002cH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	DWORD PTR _regs$1078[ebp], eax
	jmp	$L1088
$L1086:
	mov	eax, DWORD PTR _addr$1074[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1089
	mov	eax, DWORD PTR _addr$1074[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1089
	mov	eax, DWORD PTR _addr$1074[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _frame_pointer_rtx
	cmp	DWORD PTR [eax+4], ecx
	jne	$L1089
	mov	eax, DWORD PTR _addr$1074[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1089
	mov	eax, DWORD PTR _addr$1074[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _other_reg$1090[ebp], eax
	mov	eax, DWORD PTR _addr$1074[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _offset$1077[ebp], eax
	mov	eax, DWORD PTR _other_reg$1090[ebp]
	push	eax
	mov	eax, DWORD PTR _stack_pointer_rtx
	push	eax
	push	4
	push	44					; 0000002cH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	DWORD PTR _regs$1078[ebp], eax
	jmp	$L1091
$L1089:
	mov	eax, DWORD PTR _addr$1074[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1092
	mov	eax, DWORD PTR _addr$1074[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1092
	mov	eax, DWORD PTR _addr$1074[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _frame_pointer_rtx
	cmp	DWORD PTR [eax+8], ecx
	jne	$L1092
	mov	eax, DWORD PTR _addr$1074[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1092
	mov	eax, DWORD PTR _addr$1074[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _other_reg$1093[ebp], eax
	mov	eax, DWORD PTR _addr$1074[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _offset$1077[ebp], eax
	mov	eax, DWORD PTR _other_reg$1093[ebp]
	push	eax
	mov	eax, DWORD PTR _stack_pointer_rtx
	push	eax
	push	4
	push	44					; 0000002cH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	DWORD PTR _regs$1078[ebp], eax
$L1092:
$L1091:
$L1088:
$L1085:
$L1082:
$L1080:
	cmp	DWORD PTR _offset$1077[ebp], 0
	jl	$L1094
	mov	DWORD PTR _regno$1095[ebp], 8
	jmp	$L1096
$L1097:
	inc	DWORD PTR _regno$1095[ebp]
$L1096:
	cmp	DWORD PTR _regno$1095[ebp], 10		; 0000000aH
	jge	$L1098
	mov	eax, DWORD PTR _regno$1095[ebp]
	movsx	eax, BYTE PTR _regs_ever_live[eax]
	or	eax, eax
	je	$L1099
	mov	eax, DWORD PTR _regno$1095[ebp]
	movsx	eax, BYTE PTR _call_used_regs[eax]
	or	eax, eax
	jne	$L1099
	add	DWORD PTR _offset$1077[ebp], 8
$L1099:
	jmp	$L1097
$L1098:
	mov	DWORD PTR _regno$1095[ebp], 0
	jmp	$L1100
$L1101:
	inc	DWORD PTR _regno$1095[ebp]
$L1100:
	cmp	DWORD PTR _regno$1095[ebp], 8
	jge	$L1102
	mov	eax, DWORD PTR _regno$1095[ebp]
	movsx	eax, BYTE PTR _regs_ever_live[eax]
	or	eax, eax
	je	$L1103
	mov	eax, DWORD PTR _regno$1095[ebp]
	movsx	eax, BYTE PTR _call_used_regs[eax]
	or	eax, eax
	jne	$L1103
	add	DWORD PTR _offset$1077[ebp], 4
$L1103:
	jmp	$L1101
$L1102:
	sub	DWORD PTR _offset$1077[ebp], 4
	mov	eax, DWORD PTR _depth$[ebp]
	add	eax, DWORD PTR _offset$1077[ebp]
	push	eax
	mov	eax, DWORD PTR _regs$1078[ebp]
	push	eax
	call	_plus_constant
	add	esp, 8
	mov	DWORD PTR _addr$1074[ebp], eax
$L1094:
; Line 1342
	mov	eax, DWORD PTR _old_addr$1076[ebp]
	cmp	DWORD PTR _addr$1074[ebp], eax
	je	$L1104
; Line 1343
	mov	DWORD PTR _frame_pointer_address_altered$S602, 1
; Line 1347
$L1104:
	mov	eax, DWORD PTR _addr$1074[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	37					; 00000025H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _mem$1075[ebp], eax
; Line 1348
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shr	eax, 27					; 0000001bH
	and	eax, 1
	shl	eax, 27					; 0000001bH
	mov	ecx, DWORD PTR _mem$1075[ebp]
	mov	ecx, DWORD PTR [ecx]
	and	ecx, -134217729				; f7ffffffH
	or	eax, ecx
	mov	ecx, DWORD PTR _mem$1075[ebp]
	mov	DWORD PTR [ecx], eax
; Line 1349
	mov	eax, DWORD PTR _mem$1075[ebp]
	jmp	$L1033
; Line 1352
$L1105:
; Line 1354
	mov	eax, DWORD PTR _x$[ebp]
	mov	DWORD PTR _oldx$1106[ebp], eax
; Line 1357
	mov	DWORD PTR _offset$1107[ebp], -1
	mov	eax, DWORD PTR _stack_pointer_rtx
	mov	DWORD PTR _regs$1108[ebp], eax
	mov	eax, DWORD PTR _x$[ebp]
	cmp	DWORD PTR _frame_pointer_rtx, eax
	jne	$L1109
	mov	DWORD PTR _offset$1107[ebp], 0
	jmp	$L1110
$L1109:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1111
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR _frame_pointer_rtx
	cmp	DWORD PTR [eax+4], ecx
	jne	$L1111
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1111
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _offset$1107[ebp], eax
	jmp	$L1112
$L1111:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1113
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR _frame_pointer_rtx
	cmp	DWORD PTR [eax+4], ecx
	jne	$L1113
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _other_reg$1114[ebp], eax
	mov	DWORD PTR _offset$1107[ebp], 0
	mov	eax, DWORD PTR _other_reg$1114[ebp]
	push	eax
	mov	eax, DWORD PTR _stack_pointer_rtx
	push	eax
	push	4
	push	44					; 0000002cH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	DWORD PTR _regs$1108[ebp], eax
	jmp	$L1115
$L1113:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1116
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR _frame_pointer_rtx
	cmp	DWORD PTR [eax+8], ecx
	jne	$L1116
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _other_reg$1117[ebp], eax
	mov	DWORD PTR _offset$1107[ebp], 0
	mov	eax, DWORD PTR _other_reg$1117[ebp]
	push	eax
	mov	eax, DWORD PTR _stack_pointer_rtx
	push	eax
	push	4
	push	44					; 0000002cH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	DWORD PTR _regs$1108[ebp], eax
	jmp	$L1118
$L1116:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1119
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1119
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _frame_pointer_rtx
	cmp	DWORD PTR [eax+4], ecx
	jne	$L1119
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1119
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _other_reg$1120[ebp], eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _offset$1107[ebp], eax
	mov	eax, DWORD PTR _other_reg$1120[ebp]
	push	eax
	mov	eax, DWORD PTR _stack_pointer_rtx
	push	eax
	push	4
	push	44					; 0000002cH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	DWORD PTR _regs$1108[ebp], eax
	jmp	$L1121
$L1119:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1122
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1122
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _frame_pointer_rtx
	cmp	DWORD PTR [eax+8], ecx
	jne	$L1122
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1122
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _other_reg$1123[ebp], eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _offset$1107[ebp], eax
	mov	eax, DWORD PTR _other_reg$1123[ebp]
	push	eax
	mov	eax, DWORD PTR _stack_pointer_rtx
	push	eax
	push	4
	push	44					; 0000002cH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	DWORD PTR _regs$1108[ebp], eax
$L1122:
$L1121:
$L1118:
$L1115:
$L1112:
$L1110:
	cmp	DWORD PTR _offset$1107[ebp], 0
	jl	$L1124
	mov	DWORD PTR _regno$1125[ebp], 8
	jmp	$L1126
$L1127:
	inc	DWORD PTR _regno$1125[ebp]
$L1126:
	cmp	DWORD PTR _regno$1125[ebp], 10		; 0000000aH
	jge	$L1128
	mov	eax, DWORD PTR _regno$1125[ebp]
	movsx	eax, BYTE PTR _regs_ever_live[eax]
	or	eax, eax
	je	$L1129
	mov	eax, DWORD PTR _regno$1125[ebp]
	movsx	eax, BYTE PTR _call_used_regs[eax]
	or	eax, eax
	jne	$L1129
	add	DWORD PTR _offset$1107[ebp], 8
$L1129:
	jmp	$L1127
$L1128:
	mov	DWORD PTR _regno$1125[ebp], 0
	jmp	$L1130
$L1131:
	inc	DWORD PTR _regno$1125[ebp]
$L1130:
	cmp	DWORD PTR _regno$1125[ebp], 8
	jge	$L1132
	mov	eax, DWORD PTR _regno$1125[ebp]
	movsx	eax, BYTE PTR _regs_ever_live[eax]
	or	eax, eax
	je	$L1133
	mov	eax, DWORD PTR _regno$1125[ebp]
	movsx	eax, BYTE PTR _call_used_regs[eax]
	or	eax, eax
	jne	$L1133
	add	DWORD PTR _offset$1107[ebp], 4
$L1133:
	jmp	$L1131
$L1132:
	sub	DWORD PTR _offset$1107[ebp], 4
	mov	eax, DWORD PTR _offset$1107[ebp]
	add	eax, DWORD PTR _depth$[ebp]
	push	eax
	mov	eax, DWORD PTR _regs$1108[ebp]
	push	eax
	call	_plus_constant
	add	esp, 8
	mov	DWORD PTR _x$[ebp], eax
$L1124:
; Line 1358
	mov	eax, DWORD PTR _x$[ebp]
	cmp	DWORD PTR _oldx$1106[ebp], eax
	je	$L1134
; Line 1359
	mov	DWORD PTR _frame_pointer_address_altered$S602, 1
; Line 1360
$L1134:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$[ebp], eax
; Line 1361
	jmp	$L1038
; Line 1363
	jmp	$L1038
$L1037:
	sub	DWORD PTR -124+[ebp], 30		; 0000001eH
	cmp	DWORD PTR -124+[ebp], 14		; 0000000eH
	ja	$L1038
	shl	DWORD PTR -124+[ebp], 2
	mov	eax, DWORD PTR -124+[ebp]
	jmp	DWORD PTR $L1825[eax]
$L1825:
	DD	OFFSET $L1041
	DD	OFFSET $L1041
	DD	OFFSET $L1041
	DD	OFFSET $L1041
	DD	OFFSET $L1042
	DD	OFFSET $L1038
	DD	OFFSET $L1038
	DD	OFFSET $L1073
	DD	OFFSET $L1041
	DD	OFFSET $L1041
	DD	OFFSET $L1041
	DD	OFFSET $L1038
	DD	OFFSET $L1038
	DD	OFFSET $L1038
	DD	OFFSET $L1105
$L1038:
; Line 1365
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_format[eax*4]
	mov	DWORD PTR _fmt$[ebp], eax
; Line 1366
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_length[eax*4]
	dec	eax
	mov	DWORD PTR _i$[ebp], eax
	jmp	$L1135
$L1136:
	dec	DWORD PTR _i$[ebp]
$L1135:
	cmp	DWORD PTR _i$[ebp], 0
	jl	$L1137
; Line 1368
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 101				; 00000065H
	jne	$L1138
; Line 1369
	mov	eax, DWORD PTR _depth$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	push	eax
	call	_alter_frame_pointer_addresses
	add	esp, 8
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [edx+ecx*4+4], eax
; Line 1370
	jmp	$L1139
$L1138:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 69					; 00000045H
	jne	$L1140
; Line 1373
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	eax, DWORD PTR [eax]
	dec	eax
	mov	DWORD PTR _j$1141[ebp], eax
	jmp	$L1142
$L1143:
	dec	DWORD PTR _j$1141[ebp]
$L1142:
	cmp	DWORD PTR _j$1141[ebp], 0
	jl	$L1144
; Line 1375
	mov	eax, DWORD PTR _depth$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$1141[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	push	eax
	call	_alter_frame_pointer_addresses
	add	esp, 8
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR [edx+ecx*4+4]
	mov	edx, DWORD PTR _j$1141[ebp]
	mov	DWORD PTR [ecx+edx*4+4], eax
	jmp	$L1143
$L1144:
; Line 1377
$L1140:
$L1139:
	jmp	$L1136
$L1137:
; Line 1378
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L1033
; Line 1379
$L1033:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_alter_frame_pointer_addresses ENDP
_TEXT	ENDS
EXTRN	_reg_n_refs:DWORD
EXTRN	_assign_stack_local:NEAR
_TEXT	SEGMENT
_x$1152 = -16
_addr$1153 = -4
_inherent_size$1154 = -8
_total_size$1155 = -12
_mode$1160 = -20
_i$ = 8
_from_reg$ = 12
_alter_reg PROC NEAR
; Line 1393
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	push	ebx
	push	esi
	push	edi
; Line 1396
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _regno_reg_rtx
	cmp	DWORD PTR [ecx+eax*4], 0
	jne	$L1148
; Line 1397
	jmp	$L1147
; Line 1401
$L1148:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _regno_reg_rtx
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1149
; Line 1402
	jmp	$L1147
; Line 1406
$L1149:
; Line 1407
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	or	eax, eax
	jl	$L1826
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _regno_reg_rtx
	mov	ecx, DWORD PTR [edx+ecx*4]
	mov	DWORD PTR [ecx+4], eax
	jmp	$L1827
$L1826:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _regno_reg_rtx
	mov	ecx, DWORD PTR [edx+ecx*4]
	mov	DWORD PTR [ecx+4], eax
$L1827:
; Line 1409
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	or	eax, eax
	jge	$L1150
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_equiv_init$S585
	cmp	DWORD PTR [ecx+eax*4], 0
	je	$L1150
; Line 1412
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_equiv_init$S585
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	eax, DWORD PTR [eax]
	and	eax, -65518				; ffff0012H
	or	eax, 18					; 00000012H
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _reg_equiv_init$S585
	mov	ecx, DWORD PTR [edx+ecx*4]
	mov	DWORD PTR [ecx], eax
; Line 1414
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_equiv_init$S585
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR [eax+20], -1
; Line 1415
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_equiv_init$S585
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR [eax+16], 0
; Line 1421
$L1150:
; Line 1425
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	or	eax, eax
	jge	$L1151
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_n_refs
	movsx	eax, WORD PTR [ecx+eax*2]
	or	eax, eax
	jle	$L1151
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_equiv_constant
	cmp	DWORD PTR [ecx+eax*4], 0
	jne	$L1151
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_equiv_mem
	cmp	DWORD PTR [ecx+eax*4], 0
	jne	$L1151
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_equiv_address
	cmp	DWORD PTR [ecx+eax*4], 0
	jne	$L1151
; Line 1428
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _regno_reg_rtx
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	mov	DWORD PTR _inherent_size$1154[ebp], eax
; Line 1429
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_max_ref_width$S584
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _inherent_size$1154[ebp]
	cmp	eax, ecx
	jg	$L1828
	mov	eax, ecx
$L1828:
	mov	DWORD PTR _total_size$1155[ebp], eax
; Line 1439
	cmp	DWORD PTR _from_reg$[ebp], -1
	jne	$L1156
; Line 1442
	mov	eax, DWORD PTR _total_size$1155[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _regno_reg_rtx
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	call	_assign_stack_local
	add	esp, 8
	mov	DWORD PTR _x$1152[ebp], eax
; Line 1454
	jmp	$L1157
$L1156:
; Line 1457
	mov	eax, DWORD PTR _from_reg$[ebp]
	cmp	DWORD PTR _spill_stack_slot$S599[eax*4], 0
	je	$L1158
	mov	eax, DWORD PTR _from_reg$[ebp]
	mov	ecx, DWORD PTR _total_size$1155[ebp]
	cmp	DWORD PTR _spill_stack_slot_width$S600[eax*4], ecx
	jl	$L1158
	mov	eax, DWORD PTR _from_reg$[ebp]
	mov	eax, DWORD PTR _spill_stack_slot$S599[eax*4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	ecx, DWORD PTR _inherent_size$1154[ebp]
	cmp	DWORD PTR _mode_size[eax], ecx
	jl	$L1158
; Line 1458
	mov	eax, DWORD PTR _from_reg$[ebp]
	mov	eax, DWORD PTR _spill_stack_slot$S599[eax*4]
	mov	DWORD PTR _x$1152[ebp], eax
; Line 1460
	jmp	$L1159
$L1158:
; Line 1464
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _regno_reg_rtx
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	mov	DWORD PTR _mode$1160[ebp], eax
; Line 1465
	mov	eax, DWORD PTR _from_reg$[ebp]
	cmp	DWORD PTR _spill_stack_slot$S599[eax*4], 0
	je	$L1161
; Line 1468
	mov	eax, DWORD PTR _from_reg$[ebp]
	mov	eax, DWORD PTR _spill_stack_slot$S599[eax*4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	ecx, DWORD PTR _inherent_size$1154[ebp]
	cmp	DWORD PTR _mode_size[eax], ecx
	jle	$L1162
; Line 1469
	mov	eax, DWORD PTR _from_reg$[ebp]
	mov	eax, DWORD PTR _spill_stack_slot$S599[eax*4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	mov	DWORD PTR _mode$1160[ebp], eax
; Line 1470
$L1162:
	mov	eax, DWORD PTR _from_reg$[ebp]
	mov	ecx, DWORD PTR _total_size$1155[ebp]
	cmp	DWORD PTR _spill_stack_slot_width$S600[eax*4], ecx
	jle	$L1163
; Line 1471
	mov	eax, DWORD PTR _from_reg$[ebp]
	mov	eax, DWORD PTR _spill_stack_slot_width$S600[eax*4]
	mov	DWORD PTR _total_size$1155[ebp], eax
; Line 1472
$L1163:
; Line 1474
$L1161:
	mov	eax, DWORD PTR _total_size$1155[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$1160[ebp]
	push	eax
	call	_assign_stack_local
	add	esp, 8
	mov	DWORD PTR _x$1152[ebp], eax
; Line 1484
	mov	eax, DWORD PTR _x$1152[ebp]
	mov	ecx, DWORD PTR _from_reg$[ebp]
	mov	DWORD PTR _spill_stack_slot$S599[ecx*4], eax
; Line 1485
	mov	eax, DWORD PTR _total_size$1155[ebp]
	mov	ecx, DWORD PTR _from_reg$[ebp]
	mov	DWORD PTR _spill_stack_slot_width$S600[ecx*4], eax
; Line 1486
$L1159:
$L1157:
; Line 1497
	mov	eax, DWORD PTR _x$1152[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _addr$1153[ebp], eax
; Line 1503
	mov	eax, DWORD PTR _addr$1153[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _regno_reg_rtx
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	call	_memory_address_p
	add	esp, 8
	or	eax, eax
	je	$L1164
; Line 1504
	mov	eax, DWORD PTR _x$1152[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _reg_equiv_mem
	mov	DWORD PTR [edx+ecx*4], eax
; Line 1505
	jmp	$L1165
$L1164:
; Line 1506
	mov	eax, DWORD PTR _x$1152[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _reg_equiv_address
	mov	DWORD PTR [edx+ecx*4], eax
$L1165:
; Line 1508
$L1151:
$L1147:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_alter_reg ENDP
_regno$ = 8
_i$ = -8
_lim$ = -4
_mark_home_live PROC NEAR
; Line 1516
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 1518
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	DWORD PTR _i$[ebp], eax
; Line 1519
	cmp	DWORD PTR _i$[ebp], 0
	jge	$L1170
; Line 1520
	jmp	$L1167
; Line 1521
$L1170:
	cmp	DWORD PTR _i$[ebp], 8
	jl	$L1829
	mov	DWORD PTR -12+[ebp], 1
	jmp	$L1830
$L1829:
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _regno_reg_rtx
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	add	eax, 3
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	mov	DWORD PTR -12+[ebp], eax
$L1830:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, DWORD PTR -12+[ebp]
	mov	DWORD PTR _lim$[ebp], eax
; Line 1522
$L1172:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _lim$[ebp], eax
	jle	$L1173
; Line 1523
	mov	eax, DWORD PTR _i$[ebp]
	mov	BYTE PTR _regs_ever_live[eax], 1
	inc	DWORD PTR _i$[ebp]
	jmp	$L1172
$L1173:
; Line 1524
$L1167:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_mark_home_live ENDP
_TEXT	ENDS
EXTRN	_reg_basic_block:DWORD
EXTRN	_retry_global_alloc:NEAR
_DATA	SEGMENT
	ORG $+2
$SG1190	DB	' Register %d now on stack.', 0aH, 0aH, 00H
	ORG $+3
$SG1192	DB	' Register %d now in %d.', 0aH, 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_regno$ = 8
_global$ = 12
_dumpfile$ = 16
_something_changed$ = -8
_i$ = -4
_spill_hard_reg PROC NEAR
; Line 1538
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 1539
	mov	DWORD PTR _something_changed$[ebp], 0
; Line 1545
	mov	DWORD PTR _i$[ebp], 10			; 0000000aH
	jmp	$L1180
$L1181:
	inc	DWORD PTR _i$[ebp]
$L1180:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _max_regno, eax
	jle	$L1182
; Line 1551
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	or	eax, eax
	jl	$L1183
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	cmp	eax, DWORD PTR _regno$[ebp]
	jg	$L1183
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	cmp	eax, 8
	jl	$L1831
	mov	DWORD PTR -12+[ebp], 1
	jmp	$L1832
$L1831:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _regno_reg_rtx
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	add	eax, 3
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	mov	DWORD PTR -12+[ebp], eax
$L1832:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	add	eax, DWORD PTR -12+[ebp]
	cmp	eax, DWORD PTR _regno$[ebp]
	jle	$L1183
; Line 1558
	cmp	DWORD PTR _regno$[ebp], 6
	je	$L1184
	cmp	DWORD PTR _basic_block_needs, 0
	je	$L1184
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_basic_block
	movsx	eax, WORD PTR [ecx+eax*2]
	or	eax, eax
	jl	$L1184
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_basic_block
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	ecx, DWORD PTR _basic_block_needs
	movsx	eax, BYTE PTR [eax+ecx]
	or	eax, eax
	jne	$L1184
; Line 1559
	jmp	$L1181
; Line 1562
$L1184:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_renumber
	mov	WORD PTR [ecx+eax*2], -1
; Line 1564
	mov	DWORD PTR _something_changed$[ebp], 1
; Line 1565
	cmp	DWORD PTR _global$[ebp], 0
	je	$L1185
; Line 1567
	push	OFFSET _forbidden_regs$S592
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	call	_retry_global_alloc
	add	esp, 8
; Line 1569
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	call	_mark_home_live
	add	esp, 4
; Line 1572
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	cmp	eax, -1
	jne	$L1187
	cmp	DWORD PTR _frame_pointer_needed, 0
	jne	$L1187
; Line 1574
	mov	DWORD PTR _frame_pointer_needed, 1
; Line 1575
	mov	WORD PTR _forbidden_regs$S592+12, 1
; Line 1576
	mov	eax, DWORD PTR _dumpfile$[ebp]
	push	eax
	mov	eax, DWORD PTR _global$[ebp]
	push	eax
	push	6
	call	_spill_hard_reg
	add	esp, 12					; 0000000cH
; Line 1578
$L1187:
; Line 1579
$L1185:
	mov	eax, DWORD PTR _regno$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	call	_alter_reg
	add	esp, 8
; Line 1580
	cmp	DWORD PTR _dumpfile$[ebp], 0
	je	$L1188
; Line 1582
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	cmp	eax, -1
	jne	$L1189
; Line 1583
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	push	OFFSET $SG1190
	mov	eax, DWORD PTR _dumpfile$[ebp]
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 1584
	jmp	$L1191
$L1189:
; Line 1586
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	push	OFFSET $SG1192
	mov	eax, DWORD PTR _dumpfile$[ebp]
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
$L1191:
; Line 1588
$L1188:
; Line 1590
$L1183:
	jmp	$L1181
$L1182:
	cmp	DWORD PTR _something_changed$[ebp], 0
	jne	$L1835
	mov	eax, DWORD PTR _regno$[ebp]
	movsx	eax, BYTE PTR _regs_explicitly_used$S595[eax]
	or	eax, eax
	je	$L1833
$L1835:
	mov	eax, 1
	jmp	$L1834
$L1833:
	sub	eax, eax
$L1834:
	jmp	$L1177
; Line 1591
$L1177:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_spill_hard_reg ENDP
_x$ = 8
_i$ = -12
_fmt$ = -8
_code$ = -4
_j$1211 = -16
_scan_paradoxical_subregs PROC NEAR
; Line 1598
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	push	ebx
	push	esi
	push	edi
; Line 1601
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$[ebp], eax
; Line 1603
	mov	eax, DWORD PTR _code$[ebp]
	mov	DWORD PTR -20+[ebp], eax
	jmp	$L1198
; Line 1605
$L1202:
; Line 1615
	jmp	$L1194
; Line 1617
$L1203:
; Line 1619
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1204
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	ecx, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR [ecx]
	shl	ecx, 8
	and	ecx, -16777216				; ff000000H
	sar	ecx, 22					; 00000016H
	mov	ecx, DWORD PTR _mode_size[ecx]
	cmp	DWORD PTR _mode_size[eax], ecx
	jge	$L1204
; Line 1621
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	mov	ecx, DWORD PTR [ecx+4]
	mov	edx, DWORD PTR _reg_max_ref_width$S584
	mov	DWORD PTR [edx+ecx*4], eax
; Line 1622
$L1204:
	jmp	$L1194
; Line 1623
	jmp	$L1199
$L1198:
	sub	DWORD PTR -20+[ebp], 26			; 0000001aH
	cmp	DWORD PTR -20+[ebp], 14			; 0000000eH
	ja	$L1199
	shl	DWORD PTR -20+[ebp], 2
	mov	eax, DWORD PTR -20+[ebp]
	jmp	DWORD PTR $L1836[eax]
$L1836:
	DD	OFFSET $L1202
	DD	OFFSET $L1202
	DD	OFFSET $L1199
	DD	OFFSET $L1199
	DD	OFFSET $L1202
	DD	OFFSET $L1202
	DD	OFFSET $L1202
	DD	OFFSET $L1202
	DD	OFFSET $L1202
	DD	OFFSET $L1203
	DD	OFFSET $L1199
	DD	OFFSET $L1199
	DD	OFFSET $L1202
	DD	OFFSET $L1202
	DD	OFFSET $L1202
$L1199:
; Line 1625
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_format[eax*4]
	mov	DWORD PTR _fmt$[ebp], eax
; Line 1626
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_length[eax*4]
	dec	eax
	mov	DWORD PTR _i$[ebp], eax
	jmp	$L1205
$L1206:
	dec	DWORD PTR _i$[ebp]
$L1205:
	cmp	DWORD PTR _i$[ebp], 0
	jl	$L1207
; Line 1628
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 101				; 00000065H
	jne	$L1208
; Line 1629
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	push	eax
	call	_scan_paradoxical_subregs
	add	esp, 4
; Line 1630
	jmp	$L1209
$L1208:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 69					; 00000045H
	jne	$L1210
; Line 1633
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	eax, DWORD PTR [eax]
	dec	eax
	mov	DWORD PTR _j$1211[ebp], eax
	jmp	$L1212
$L1213:
	dec	DWORD PTR _j$1211[ebp]
$L1212:
	cmp	DWORD PTR _j$1211[ebp], 0
	jl	$L1214
; Line 1634
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$1211[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	push	eax
	call	_scan_paradoxical_subregs
	add	esp, 4
	jmp	$L1213
$L1214:
; Line 1636
$L1210:
$L1209:
	jmp	$L1206
$L1207:
; Line 1637
$L1194:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_scan_paradoxical_subregs ENDP
_p1$ = 8
_p2$ = 12
_tem$ = -4
_hard_reg_use_compare PROC NEAR
; Line 1644
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 1645
	mov	eax, DWORD PTR _p1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _p2$[ebp]
	sub	eax, DWORD PTR [ecx+4]
	mov	DWORD PTR _tem$[ebp], eax
; Line 1646
	cmp	DWORD PTR _tem$[ebp], 0
	je	$L1221
	mov	eax, DWORD PTR _tem$[ebp]
	jmp	$L1219
; Line 1649
$L1221:
	mov	eax, DWORD PTR _p1$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _p2$[ebp]
	sub	eax, DWORD PTR [ecx]
	jmp	$L1219
; Line 1650
$L1219:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_hard_reg_use_compare ENDP
_TEXT	ENDS
EXTRN	_qsort:NEAR
_TEXT	SEGMENT
_i$ = -92
_o$ = -4
_large$ = -88
_hard_reg_n_uses$ = -84
_regno$1236 = -96
_lim$1238 = -100
_regno$1252 = -104
_regno$1257 = -108
_order_regs_for_reload PROC NEAR
; Line 1658
	push	ebp
	mov	ebp, esp
	sub	esp, 112				; 00000070H
	push	ebx
	push	esi
	push	edi
; Line 1660
	mov	DWORD PTR _o$[ebp], 0
; Line 1661
	mov	DWORD PTR _large$[ebp], 0
; Line 1665
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L1227
$L1228:
	inc	DWORD PTR _i$[ebp]
$L1227:
	cmp	DWORD PTR _i$[ebp], 10			; 0000000aH
	jge	$L1229
; Line 1666
	mov	eax, DWORD PTR _i$[ebp]
	mov	WORD PTR _potential_reload_regs$S594[eax*2], -1
	jmp	$L1228
$L1229:
; Line 1671
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L1230
$L1231:
	inc	DWORD PTR _i$[ebp]
$L1230:
	cmp	DWORD PTR _i$[ebp], 10			; 0000000aH
	jge	$L1232
; Line 1673
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _hard_reg_n_uses$[ebp+eax*8+4], 0
; Line 1674
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	DWORD PTR _hard_reg_n_uses$[ebp+ecx*8], eax
; Line 1675
	jmp	$L1231
$L1232:
; Line 1677
	mov	DWORD PTR _i$[ebp], 10			; 0000000aH
	jmp	$L1233
$L1234:
	inc	DWORD PTR _i$[ebp]
$L1233:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _max_regno, eax
	jle	$L1235
; Line 1679
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	DWORD PTR _regno$1236[ebp], eax
; Line 1680
	cmp	DWORD PTR _regno$1236[ebp], 0
	jl	$L1237
; Line 1682
	cmp	DWORD PTR _regno$1236[ebp], 8
	jl	$L1837
	mov	DWORD PTR -112+[ebp], 1
	jmp	$L1838
$L1837:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _regno_reg_rtx
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	add	eax, 3
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	mov	DWORD PTR -112+[ebp], eax
$L1838:
	mov	eax, DWORD PTR _regno$1236[ebp]
	add	eax, DWORD PTR -112+[ebp]
	mov	DWORD PTR _lim$1238[ebp], eax
; Line 1683
$L1240:
	mov	eax, DWORD PTR _regno$1236[ebp]
	cmp	DWORD PTR _lim$1238[ebp], eax
	jle	$L1241
; Line 1684
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_n_refs
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	ecx, DWORD PTR _regno$1236[ebp]
	add	DWORD PTR _hard_reg_n_uses$[ebp+ecx*8+4], eax
	inc	DWORD PTR _regno$1236[ebp]
	jmp	$L1240
$L1241:
; Line 1686
$L1237:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reg_n_refs
	movsx	eax, WORD PTR [ecx+eax*2]
	add	DWORD PTR _large$[ebp], eax
; Line 1687
	jmp	$L1234
$L1235:
; Line 1693
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L1242
$L1243:
	inc	DWORD PTR _i$[ebp]
$L1242:
	cmp	DWORD PTR _i$[ebp], 10			; 0000000aH
	jge	$L1244
; Line 1695
	mov	eax, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR _fixed_regs[eax]
	or	eax, eax
	je	$L1245
; Line 1696
	mov	eax, DWORD PTR _large$[ebp]
	add	eax, 2
	mov	ecx, DWORD PTR _i$[ebp]
	add	DWORD PTR _hard_reg_n_uses$[ebp+ecx*8+4], eax
; Line 1697
	jmp	$L1246
$L1245:
	mov	eax, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR _regs_explicitly_used$S595[eax]
	or	eax, eax
	je	$L1247
; Line 1698
	mov	eax, DWORD PTR _large$[ebp]
	inc	eax
	mov	ecx, DWORD PTR _i$[ebp]
	add	DWORD PTR _hard_reg_n_uses$[ebp+ecx*8+4], eax
; Line 1699
$L1247:
$L1246:
	jmp	$L1243
$L1244:
; Line 1700
	mov	eax, DWORD PTR _large$[ebp]
	add	eax, 2
	add	DWORD PTR _hard_reg_n_uses$[ebp+52], eax
; Line 1703
	push	OFFSET _hard_reg_use_compare
	push	8
	push	10					; 0000000aH
	lea	eax, DWORD PTR _hard_reg_n_uses$[ebp]
	push	eax
	call	_qsort
	add	esp, 16					; 00000010H
; Line 1708
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L1249
$L1250:
	inc	DWORD PTR _i$[ebp]
$L1249:
	cmp	DWORD PTR _i$[ebp], 10			; 0000000aH
	jge	$L1251
; Line 1713
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _regno$1252[ebp], eax
; Line 1716
	mov	eax, DWORD PTR _regno$1252[ebp]
	movsx	eax, BYTE PTR _regs_ever_live[eax]
	or	eax, eax
	jne	$L1253
	mov	eax, DWORD PTR _regno$1252[ebp]
	movsx	eax, BYTE PTR _call_used_regs[eax]
	or	eax, eax
	je	$L1253
	mov	eax, DWORD PTR _regno$1252[ebp]
	movsx	eax, BYTE PTR _fixed_regs[eax]
	or	eax, eax
	jne	$L1253
; Line 1717
	mov	eax, DWORD PTR _regno$1252[ebp]
	mov	ecx, DWORD PTR _o$[ebp]
	mov	WORD PTR _potential_reload_regs$S594[ecx*2], ax
	inc	DWORD PTR _o$[ebp]
; Line 1718
$L1253:
	jmp	$L1250
$L1251:
; Line 1720
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L1254
$L1255:
	inc	DWORD PTR _i$[ebp]
$L1254:
	cmp	DWORD PTR _i$[ebp], 10			; 0000000aH
	jge	$L1256
; Line 1725
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _regno$1257[ebp], eax
; Line 1728
	mov	eax, DWORD PTR _regno$1257[ebp]
	movsx	eax, BYTE PTR _regs_ever_live[eax]
	or	eax, eax
	jne	$L1258
	mov	eax, DWORD PTR _regno$1257[ebp]
	movsx	eax, BYTE PTR _call_used_regs[eax]
	or	eax, eax
	jne	$L1258
	cmp	DWORD PTR _regno$1257[ebp], 6
	je	$L1258
; Line 1729
	mov	eax, DWORD PTR _regno$1257[ebp]
	mov	ecx, DWORD PTR _o$[ebp]
	mov	WORD PTR _potential_reload_regs$S594[ecx*2], ax
	inc	DWORD PTR _o$[ebp]
; Line 1730
$L1258:
	jmp	$L1255
$L1256:
; Line 1735
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L1259
$L1260:
	inc	DWORD PTR _i$[ebp]
$L1259:
	cmp	DWORD PTR _i$[ebp], 10			; 0000000aH
	jge	$L1261
; Line 1736
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _hard_reg_n_uses$[ebp+eax*8]
	movsx	eax, BYTE PTR _regs_ever_live[eax]
	or	eax, eax
	je	$L1262
; Line 1737
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _hard_reg_n_uses$[ebp+eax*8]
	mov	ecx, DWORD PTR _o$[ebp]
	mov	WORD PTR _potential_reload_regs$S594[ecx*2], ax
	inc	DWORD PTR _o$[ebp]
; Line 1748
$L1262:
	jmp	$L1260
$L1261:
$L1222:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_order_regs_for_reload ENDP
_TEXT	ENDS
EXTRN	_note_stores:NEAR
EXTRN	_subst_reloads:NEAR
_BSS	SEGMENT
_reg_last_reload_reg$S581 DD 01H DUP (?)
_reg_has_output_reload$S582 DD 01H DUP (?)
_reg_is_output_reload$S583 DB 0aH DUP (?)
	ALIGN	4

_reg_reloaded_contents$S586 DD 0aH DUP (?)
_reg_reloaded_insn$S587 DD 0aH DUP (?)
_spill_reg_rtx$S589 DD 0aH DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
_avoid_return_reg$1281 = -28
_first$ = 8
_live_known$ = 12
_insn$ = -8
_i$ = -20
_this_block$ = -16
_x$ = -12
_after_call$ = -4
_next$1277 = -24
_reload_as_needed PROC NEAR
; Line 1763
	push	ebp
	mov	ebp, esp
	sub	esp, 28					; 0000001cH
	push	ebx
	push	esi
	push	edi
; Line 1766
	mov	DWORD PTR _this_block$[ebp], 0
; Line 1768
	mov	DWORD PTR _after_call$[ebp], 0
; Line 1770
	push	40					; 00000028H
	push	0
	push	OFFSET _spill_reg_rtx$S589
	call	_memset
	add	esp, 12					; 0000000cH
; Line 1771
	mov	eax, DWORD PTR _max_regno
	shl	eax, 2
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _reg_last_reload_reg$S581, eax
; Line 1772
	mov	eax, DWORD PTR _max_regno
	shl	eax, 2
	push	eax
	push	0
	mov	eax, DWORD PTR _reg_last_reload_reg$S581
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 1773
	mov	eax, DWORD PTR _max_regno
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _reg_has_output_reload$S582, eax
; Line 1774
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L1271
$L1272:
	inc	DWORD PTR _i$[ebp]
$L1271:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _n_spills$S588, eax
	jle	$L1273
; Line 1776
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _reg_reloaded_contents$S586[eax*4], -1
; Line 1777
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _reg_reloaded_insn$S587[eax*4], 0
; Line 1778
	jmp	$L1272
$L1273:
; Line 1780
	mov	eax, DWORD PTR _first$[ebp]
	mov	DWORD PTR _insn$[ebp], eax
$L1275:
	cmp	DWORD PTR _insn$[ebp], 0
	je	$L1276
; Line 1782
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _next$1277[ebp], eax
; Line 1786
	cmp	DWORD PTR _basic_block_needs, 0
	je	$L1278
	mov	eax, DWORD PTR _this_block$[ebp]
	inc	eax
	cmp	eax, DWORD PTR _n_basic_blocks
	jge	$L1278
	mov	eax, DWORD PTR _this_block$[ebp]
	mov	ecx, DWORD PTR _basic_block_head
	mov	edx, DWORD PTR _insn$[ebp]
	cmp	DWORD PTR [ecx+eax*4+4], edx
	jne	$L1278
; Line 1787
	inc	DWORD PTR _this_block$[ebp]
; Line 1789
$L1278:
; Line 1790
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 851968				; 000d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1280
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 917504				; 000e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1280
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 983040				; 000f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1279
$L1280:
; Line 1792
	mov	DWORD PTR _avoid_return_reg$1281[ebp], 0
; Line 1795
	mov	eax, DWORD PTR _max_regno
	push	eax
	push	0
	mov	eax, DWORD PTR _reg_has_output_reload$S582
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 1796
	push	10					; 0000000aH
	push	0
	push	OFFSET _reg_is_output_reload$S583
	call	_memset
	add	esp, 12					; 0000000cH
; Line 1800
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 983040				; 000f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1282
; Line 1802
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1283
; Line 1803
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _after_call$[ebp], eax
; Line 1804
	jmp	$L1284
$L1283:
; Line 1805
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1310720				; 00140000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1285
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
	jne	$L1285
; Line 1806
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _after_call$[ebp], eax
; Line 1807
	jmp	$L1286
$L1285:
; Line 1808
	mov	DWORD PTR _after_call$[ebp], 0
$L1286:
$L1284:
; Line 1810
	jmp	$L1287
$L1282:
; Line 1812
	cmp	DWORD PTR _after_call$[ebp], 0
	je	$L1288
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1289
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _stack_pointer_rtx
	cmp	DWORD PTR [eax+4], ecx
	je	$L1288
$L1289:
; Line 1814
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	mov	eax, DWORD PTR _after_call$[ebp]
	push	eax
	call	_reg_mentioned_p
	add	esp, 8
	or	eax, eax
	je	$L1290
; Line 1815
	mov	eax, DWORD PTR _after_call$[ebp]
	mov	DWORD PTR _avoid_return_reg$1281[ebp], eax
; Line 1816
$L1290:
	mov	DWORD PTR _after_call$[ebp], 0
; Line 1819
$L1288:
$L1287:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sub	ecx, ecx
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1291
; Line 1820
	mov	DWORD PTR _n_reloads, 0
; Line 1825
	jmp	$L1292
$L1291:
; Line 1826
	push	OFFSET _spill_reg_order$S591
	mov	eax, DWORD PTR _live_known$[ebp]
	push	eax
	movsx	eax, BYTE PTR _spill_indirect_ok$S598
	push	eax
	push	1
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_find_reloads
	add	esp, 20					; 00000014H
$L1292:
; Line 1828
	cmp	DWORD PTR _n_reloads, 0
	jle	$L1293
; Line 1835
	cmp	DWORD PTR _basic_block_needs, 0
	je	$L1294
	mov	eax, DWORD PTR _this_block$[ebp]
	mov	ecx, DWORD PTR _basic_block_needs
	movsx	eax, BYTE PTR [eax+ecx]
	or	eax, eax
	jne	$L1294
; Line 1837
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L1295
$L1296:
	inc	DWORD PTR _i$[ebp]
$L1295:
	mov	eax, DWORD PTR _n_reloads
	cmp	DWORD PTR _i$[ebp], eax
	jge	$L1297
; Line 1839
	mov	eax, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR _reload_optional[eax]
	or	eax, eax
	je	$L1298
; Line 1840
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _reload_out[eax*4], 0
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _reload_out[eax*4]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	DWORD PTR _reload_in[ecx*4], eax
; Line 1841
	jmp	$L1299
$L1298:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _reload_reg_rtx[eax*4], 0
	jne	$L1300
; Line 1842
	call	_abort
; Line 1843
$L1300:
$L1299:
	jmp	$L1296
$L1297:
; Line 1850
$L1294:
	mov	eax, DWORD PTR _avoid_return_reg$1281[ebp]
	push	eax
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_choose_reload_regs
	add	esp, 8
; Line 1854
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_emit_reload_insns
	add	esp, 4
; Line 1860
	call	_subst_reloads
; Line 1868
$L1293:
	push	OFFSET _forget_old_reloads_1
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_note_stores
	add	esp, 8
; Line 1873
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR _x$[ebp], eax
	jmp	$L1302
$L1303:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x$[ebp], eax
$L1302:
	cmp	DWORD PTR _x$[ebp], 0
	je	$L1304
; Line 1874
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 33554432				; 02000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1305
; Line 1879
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L1306
$L1307:
	inc	DWORD PTR _i$[ebp]
$L1306:
	mov	eax, DWORD PTR _n_reloads
	cmp	DWORD PTR _i$[ebp], eax
	jge	$L1308
; Line 1880
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reload_out[ecx*4]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L1309
; Line 1881
	jmp	$L1308
; Line 1883
$L1309:
	jmp	$L1307
$L1308:
	mov	eax, DWORD PTR _n_reloads
	cmp	DWORD PTR _i$[ebp], eax
	je	$L1310
; Line 1884
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_forget_old_reloads_1
	add	esp, 4
; Line 1885
$L1310:
; Line 1886
$L1305:
	jmp	$L1303
$L1304:
; Line 1888
$L1279:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1114112				; 00110000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1311
; Line 1889
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L1312
$L1313:
	inc	DWORD PTR _i$[ebp]
$L1312:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _n_spills$S588, eax
	jle	$L1314
; Line 1891
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _reg_reloaded_contents$S586[eax*4], -1
; Line 1892
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _reg_reloaded_insn$S587[eax*4], 0
; Line 1893
	jmp	$L1313
$L1314:
; Line 1897
$L1311:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1114112				; 00110000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1316
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 983040				; 000f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1315
$L1316:
; Line 1898
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L1317
$L1318:
	inc	DWORD PTR _i$[ebp]
$L1317:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _n_spills$S588, eax
	jle	$L1319
; Line 1899
	mov	eax, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR _spill_regs$S593[eax]
	movsx	eax, BYTE PTR _call_used_regs[eax]
	or	eax, eax
	je	$L1320
; Line 1901
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _reg_reloaded_contents$S586[eax*4], -1
; Line 1902
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _reg_reloaded_insn$S587[eax*4], 0
; Line 1909
$L1320:
	jmp	$L1318
$L1319:
$L1315:
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L1321
$L1322:
	inc	DWORD PTR _i$[ebp]
$L1321:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _n_spills$S588, eax
	jle	$L1323
; Line 1910
	mov	eax, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR _spill_regs$S593[eax]
	cmp	eax, 8
	jl	$L1324
	mov	eax, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR _spill_regs$S593[eax]
	cmp	eax, 10					; 0000000aH
	jge	$L1324
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 917504				; 000e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1325
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1048576				; 00100000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1324
$L1325:
; Line 1912
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _reg_reloaded_contents$S586[eax*4], -1
; Line 1913
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _reg_reloaded_insn$S587[eax*4], 0
; Line 1917
$L1324:
	jmp	$L1322
$L1323:
	mov	eax, DWORD PTR _next$1277[ebp]
	mov	DWORD PTR _insn$[ebp], eax
; Line 1922
	jmp	$L1275
$L1276:
; Line 1923
$L1265:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_reload_as_needed ENDP
_x$ = 8
_regno$ = -8
_nr$ = -4
_i$1333 = -12
_forget_old_reloads_1 PROC NEAR
; Line 1937
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 1941
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1330
; Line 1942
	jmp	$L1327
; Line 1944
$L1330:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _regno$[ebp], eax
; Line 1946
	cmp	DWORD PTR _regno$[ebp], 10		; 0000000aH
	jl	$L1331
; Line 1947
	mov	DWORD PTR _nr$[ebp], 1
; Line 1948
	jmp	$L1332
$L1331:
; Line 1951
	cmp	DWORD PTR _regno$[ebp], 8
	jl	$L1839
	mov	DWORD PTR _nr$[ebp], 1
	jmp	$L1840
$L1839:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	add	eax, 3
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	mov	DWORD PTR _nr$[ebp], eax
$L1840:
; Line 1956
	mov	DWORD PTR _i$1333[ebp], 0
	jmp	$L1334
$L1335:
	inc	DWORD PTR _i$1333[ebp]
$L1334:
	mov	eax, DWORD PTR _i$1333[ebp]
	cmp	DWORD PTR _nr$[ebp], eax
	jle	$L1336
; Line 1960
	mov	eax, DWORD PTR _regno$[ebp]
	add	eax, DWORD PTR _i$1333[ebp]
	movsx	eax, WORD PTR _spill_reg_order$S591[eax*2]
	or	eax, eax
	jl	$L1337
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _i$1333[ebp]
	movsx	eax, BYTE PTR _reg_is_output_reload$S583[eax+ecx]
	or	eax, eax
	jne	$L1337
; Line 1962
	mov	eax, DWORD PTR _regno$[ebp]
	add	eax, DWORD PTR _i$1333[ebp]
	movsx	eax, WORD PTR _spill_reg_order$S591[eax*2]
	mov	DWORD PTR _reg_reloaded_contents$S586[eax*4], -1
; Line 1963
	mov	eax, DWORD PTR _regno$[ebp]
	add	eax, DWORD PTR _i$1333[ebp]
	movsx	eax, WORD PTR _spill_reg_order$S591[eax*2]
	mov	DWORD PTR _reg_reloaded_insn$S587[eax*4], 0
; Line 1965
$L1337:
	jmp	$L1335
$L1336:
$L1332:
; Line 1970
$L1339:
	mov	eax, DWORD PTR _nr$[ebp]
	mov	DWORD PTR -16+[ebp], eax
	dec	DWORD PTR _nr$[ebp]
	cmp	DWORD PTR -16+[ebp], 0
	jle	$L1340
; Line 1973
	mov	eax, DWORD PTR _nr$[ebp]
	add	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _reg_has_output_reload$S582
	movsx	eax, BYTE PTR [eax+ecx]
	or	eax, eax
	jne	$L1341
; Line 1974
	mov	eax, DWORD PTR _nr$[ebp]
	add	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _reg_last_reload_reg$S581
	mov	DWORD PTR [ecx+eax*4], 0
; Line 1975
$L1341:
	jmp	$L1339
$L1340:
$L1327:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_forget_old_reloads_1 ENDP
_r1$ = -8
_r2$ = -20
_t$ = -4
_mode1$ = -12
_mode2$ = -16
_p1$ = 8
_p2$ = 12
_reload_reg_class_lower PROC NEAR
; Line 1983
	push	ebp
	mov	ebp, esp
	sub	esp, 28					; 0000001cH
	push	ebx
	push	esi
	push	edi
; Line 1984
	mov	eax, DWORD PTR _p1$[ebp]
	movsx	eax, WORD PTR [eax]
	mov	DWORD PTR _r1$[ebp], eax
	mov	eax, DWORD PTR _p2$[ebp]
	movsx	eax, WORD PTR [eax]
	mov	DWORD PTR _r2$[ebp], eax
; Line 1989
	mov	eax, DWORD PTR _r1$[ebp]
	movsx	eax, BYTE PTR _reload_optional[eax]
	mov	ecx, DWORD PTR _r2$[ebp]
	movsx	ecx, BYTE PTR _reload_optional[ecx]
	sub	eax, ecx
	mov	DWORD PTR _t$[ebp], eax
; Line 1990
	cmp	DWORD PTR _t$[ebp], 0
	je	$L1351
; Line 1991
	mov	eax, DWORD PTR _t$[ebp]
	jmp	$L1345
; Line 1995
$L1351:
	mov	eax, DWORD PTR _r1$[ebp]
	cmp	DWORD PTR _reload_inmode[eax*4], 0
	jne	$L1841
	mov	eax, DWORD PTR _r1$[ebp]
	mov	eax, DWORD PTR _reload_outmode[eax*4]
	mov	DWORD PTR _mode1$[ebp], eax
	jmp	$L1842
$L1841:
	mov	eax, DWORD PTR _r1$[ebp]
	mov	eax, DWORD PTR _reload_inmode[eax*4]
	mov	DWORD PTR _mode1$[ebp], eax
$L1842:
; Line 1996
	mov	eax, DWORD PTR _r2$[ebp]
	cmp	DWORD PTR _reload_inmode[eax*4], 0
	jne	$L1843
	mov	eax, DWORD PTR _r2$[ebp]
	mov	eax, DWORD PTR _reload_outmode[eax*4]
	mov	DWORD PTR _mode2$[ebp], eax
	jmp	$L1844
$L1843:
	mov	eax, DWORD PTR _r2$[ebp]
	mov	eax, DWORD PTR _reload_inmode[eax*4]
	mov	DWORD PTR _mode2$[ebp], eax
$L1844:
; Line 1998
	mov	eax, DWORD PTR _r2$[ebp]
	cmp	DWORD PTR _reload_reg_class[eax*4], 11	; 0000000bH
	jne	$L1845
	mov	DWORD PTR -24+[ebp], 1
	jmp	$L1846
$L1845:
	mov	eax, DWORD PTR _mode2$[ebp]
	mov	eax, DWORD PTR _mode_size[eax*4]
	add	eax, 3
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	mov	DWORD PTR -24+[ebp], eax
$L1846:
	mov	eax, DWORD PTR _r1$[ebp]
	cmp	DWORD PTR _reload_reg_class[eax*4], 11	; 0000000bH
	jne	$L1847
	mov	DWORD PTR -28+[ebp], 1
	jmp	$L1848
$L1847:
	mov	eax, DWORD PTR _mode1$[ebp]
	mov	eax, DWORD PTR _mode_size[eax*4]
	add	eax, 3
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	mov	DWORD PTR -28+[ebp], eax
$L1848:
	mov	eax, DWORD PTR -24+[ebp]
	sub	eax, DWORD PTR -28+[ebp]
	mov	DWORD PTR _t$[ebp], eax
; Line 1999
	cmp	DWORD PTR _t$[ebp], 0
	je	$L1352
; Line 2000
	mov	eax, DWORD PTR _t$[ebp]
	jmp	$L1345
; Line 2002
$L1352:
	mov	eax, DWORD PTR _r1$[ebp]
	mov	eax, DWORD PTR _reload_reg_class[eax*4]
	mov	ecx, DWORD PTR _r2$[ebp]
	sub	eax, DWORD PTR _reload_reg_class[ecx*4]
	mov	DWORD PTR _t$[ebp], eax
; Line 2003
	cmp	DWORD PTR _t$[ebp], 0
	je	$L1353
	mov	eax, DWORD PTR _t$[ebp]
	jmp	$L1345
; Line 2006
$L1353:
	mov	eax, DWORD PTR _r1$[ebp]
	sub	eax, DWORD PTR _r2$[ebp]
	jmp	$L1345
; Line 2007
$L1345:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_reload_reg_class_lower ENDP
_TEXT	ENDS
_BSS	SEGMENT
_reload_reg_in_use$S1354 DB 0aH DUP (?)
	ALIGN	4

_reload_reg_in_use_for_inputs$S1355 DB 0aH DUP (?)
	ALIGN	4

_reload_reg_in_use_for_outputs$S1356 DB 0aH DUP (?)
	ALIGN	4

_reload_reg_in_use_for_operands$S1357 DB 0aH DUP (?)
	ALIGN	4

_reload_reg_in_use_at_all$S1358 DB 0aH DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
_regno$ = 8
_when_needed$ = 12
_mark_reload_reg_in_use PROC NEAR
; Line 2030
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 2031
	mov	eax, DWORD PTR _when_needed$[ebp]
	mov	DWORD PTR -4+[ebp], eax
	jmp	$L1363
; Line 2033
$L1367:
; Line 2034
	mov	eax, DWORD PTR _regno$[ebp]
	mov	BYTE PTR _reload_reg_in_use$S1354[eax], 1
; Line 2035
	jmp	$L1364
; Line 2037
$L1368:
; Line 2038
	mov	eax, DWORD PTR _regno$[ebp]
	mov	BYTE PTR _reload_reg_in_use_for_inputs$S1355[eax], 1
; Line 2039
	jmp	$L1364
; Line 2041
$L1369:
; Line 2042
	mov	eax, DWORD PTR _regno$[ebp]
	mov	BYTE PTR _reload_reg_in_use_for_outputs$S1356[eax], 1
; Line 2043
	jmp	$L1364
; Line 2045
$L1370:
; Line 2046
	mov	eax, DWORD PTR _regno$[ebp]
	mov	BYTE PTR _reload_reg_in_use_for_operands$S1357[eax], 1
; Line 2047
	jmp	$L1364
; Line 2048
	jmp	$L1364
$L1363:
	cmp	DWORD PTR -4+[ebp], 0
	je	$L1368
	cmp	DWORD PTR -4+[ebp], 1
	je	$L1369
	cmp	DWORD PTR -4+[ebp], 2
	je	$L1370
	cmp	DWORD PTR -4+[ebp], 3
	je	$L1367
	jmp	$L1364
$L1364:
; Line 2049
	mov	eax, DWORD PTR _regno$[ebp]
	mov	BYTE PTR _reload_reg_in_use_at_all$S1358[eax], 1
; Line 2050
$L1362:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_mark_reload_reg_in_use ENDP
_regno$ = 8
_when_needed$ = 12
_reload_reg_free_p PROC NEAR
; Line 2059
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 2061
	mov	eax, DWORD PTR _regno$[ebp]
	movsx	eax, BYTE PTR _reload_reg_in_use$S1354[eax]
	or	eax, eax
	je	$L1375
; Line 2062
	sub	eax, eax
	jmp	$L1374
; Line 2063
$L1375:
	mov	eax, DWORD PTR _when_needed$[ebp]
	mov	DWORD PTR -4+[ebp], eax
	jmp	$L1376
; Line 2065
$L1380:
; Line 2067
	mov	eax, DWORD PTR _regno$[ebp]
	movsx	eax, BYTE PTR _reload_reg_in_use_at_all$S1358[eax]
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	jmp	$L1374
; Line 2070
$L1381:
; Line 2071
	mov	eax, DWORD PTR _regno$[ebp]
	movsx	eax, BYTE PTR _reload_reg_in_use_for_inputs$S1355[eax]
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	jmp	$L1374
; Line 2072
$L1382:
; Line 2073
	mov	eax, DWORD PTR _regno$[ebp]
	movsx	eax, BYTE PTR _reload_reg_in_use_for_outputs$S1356[eax]
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	jmp	$L1374
; Line 2074
$L1383:
; Line 2075
	mov	eax, DWORD PTR _regno$[ebp]
	movsx	eax, BYTE PTR _reload_reg_in_use_for_operands$S1357[eax]
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	jmp	$L1374
; Line 2076
	jmp	$L1377
$L1376:
	cmp	DWORD PTR -4+[ebp], 0
	je	$L1381
	cmp	DWORD PTR -4+[ebp], 1
	je	$L1382
	cmp	DWORD PTR -4+[ebp], 2
	je	$L1383
	cmp	DWORD PTR -4+[ebp], 3
	je	$L1380
	jmp	$L1377
$L1377:
; Line 2077
$L1374:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_reload_reg_free_p ENDP
_regno$ = 8
_when_needed$ = 12
_reload_reg_free_before_p PROC NEAR
; Line 2087
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 2088
	mov	eax, DWORD PTR _when_needed$[ebp]
	mov	DWORD PTR -4+[ebp], eax
	jmp	$L1388
; Line 2090
$L1392:
; Line 2093
	mov	eax, 1
	jmp	$L1387
; Line 2097
$L1393:
; Line 2098
	mov	eax, DWORD PTR _regno$[ebp]
	movsx	eax, BYTE PTR _reload_reg_in_use_for_operands$S1357[eax]
	or	eax, eax
	je	$L1394
; Line 2099
	sub	eax, eax
	jmp	$L1387
; Line 2100
$L1394:
$L1395:
; Line 2101
	mov	eax, DWORD PTR _regno$[ebp]
	movsx	eax, BYTE PTR _reload_reg_in_use_for_inputs$S1355[eax]
	or	eax, eax
	je	$L1396
; Line 2102
	sub	eax, eax
	jmp	$L1387
; Line 2103
$L1396:
$L1397:
; Line 2104
	mov	eax, 1
	jmp	$L1387
; Line 2105
	jmp	$L1389
$L1388:
	cmp	DWORD PTR -4+[ebp], 0
	je	$L1397
	cmp	DWORD PTR -4+[ebp], 1
	je	$L1393
	cmp	DWORD PTR -4+[ebp], 2
	je	$L1395
	cmp	DWORD PTR -4+[ebp], 3
	je	$L1392
	jmp	$L1389
$L1389:
; Line 2106
$L1387:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_reload_reg_free_before_p ENDP
_regno$ = 8
_when_needed$ = 12
_reload_reg_reaches_end_p PROC NEAR
; Line 2116
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 2117
	mov	eax, DWORD PTR _when_needed$[ebp]
	mov	DWORD PTR -4+[ebp], eax
	jmp	$L1402
; Line 2119
$L1406:
; Line 2122
	mov	eax, 1
	jmp	$L1401
; Line 2126
$L1407:
; Line 2127
	mov	eax, DWORD PTR _regno$[ebp]
	movsx	eax, BYTE PTR _reload_reg_in_use_for_operands$S1357[eax]
	or	eax, eax
	je	$L1408
; Line 2128
	sub	eax, eax
	jmp	$L1401
; Line 2129
$L1408:
$L1409:
; Line 2130
	mov	eax, DWORD PTR _regno$[ebp]
	movsx	eax, BYTE PTR _reload_reg_in_use_for_outputs$S1356[eax]
	or	eax, eax
	je	$L1410
; Line 2131
	sub	eax, eax
	jmp	$L1401
; Line 2132
$L1410:
$L1411:
; Line 2133
	mov	eax, 1
	jmp	$L1401
; Line 2134
	jmp	$L1403
$L1402:
	cmp	DWORD PTR -4+[ebp], 0
	je	$L1407
	cmp	DWORD PTR -4+[ebp], 1
	je	$L1411
	cmp	DWORD PTR -4+[ebp], 2
	je	$L1409
	cmp	DWORD PTR -4+[ebp], 3
	je	$L1406
	jmp	$L1403
$L1403:
; Line 2135
$L1401:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_reload_reg_reaches_end_p ENDP
_TEXT	ENDS
EXTRN	_find_equiv_reg:NEAR
EXTRN	_asm_noperands:NEAR
EXTRN	_error_for_asm:NEAR
EXTRN	_reg_overlap_mentioned_p:NEAR
EXTRN	_reload_in_reg:BYTE
EXTRN	_reload_strict_low:BYTE
EXTRN	_n_earlyclobbers:DWORD
EXTRN	_reload_earlyclobbers:BYTE
_DATA	SEGMENT
	ORG $+2
$SG1546	DB	'`asm'' operand constraint incompatible with operand size'
	DB	00H
_DATA	ENDS
_TEXT	SEGMENT
_regno$1474 = -248
_insn$ = 8
_avoid_return_reg$ = 12
_equiv$1484 = -252
_j$ = -180
_regno$1485 = -256
_have_groups$ = -4
_r$1550 = -288
_must_reuse$ = -176
_original_reload_reg_rtx$ = -172
_do_avoid$1425 = -188
_regno$1426 = -196
_nregs$1427 = -192
_r$1428 = -184
_r$1560 = -292
_i$1561 = -296
_nr$1499 = -260
_nregno$1564 = -300
_tem$1438 = -200
_nregno$1569 = -304
_pass$1506 = -264
_force_group$1507 = -268
_regno$1446 = -212
_nregs$1447 = -208
_nregno$1576 = -308
_r$1448 = -204
_class$1515 = -272
_nr$1518 = -276
_mode$1456 = -216
_regno$1526 = -280
_r$1463 = -224
_i$1464 = -244
_new$1465 = -240
_reload_mode$1466 = -228
_nr$1533 = -284
_choose_reload_regs PROC NEAR
; Line 2168
	push	ebp
	mov	ebp, esp
	sub	esp, 316				; 0000013cH
	push	ebx
	push	esi
	push	edi
; Line 2170
	mov	DWORD PTR _have_groups$[ebp], 0
; Line 2173
	mov	DWORD PTR _must_reuse$[ebp], 0
; Line 2178
	cmp	DWORD PTR _avoid_return_reg$[ebp], 0
	je	$L1424
; Line 2180
	mov	DWORD PTR _do_avoid$1425[ebp], 0
; Line 2181
	mov	eax, DWORD PTR _avoid_return_reg$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _regno$1426[ebp], eax
; Line 2183
	cmp	DWORD PTR _regno$1426[ebp], 8
	jl	$L1849
	mov	DWORD PTR _nregs$1427[ebp], 1
	jmp	$L1850
$L1849:
	mov	eax, DWORD PTR _avoid_return_reg$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	add	eax, 3
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	mov	DWORD PTR _nregs$1427[ebp], eax
$L1850:
; Line 2186
	mov	eax, DWORD PTR _regno$1426[ebp]
	mov	DWORD PTR _r$1428[ebp], eax
	jmp	$L1429
$L1430:
	inc	DWORD PTR _r$1428[ebp]
$L1429:
	mov	eax, DWORD PTR _nregs$1427[ebp]
	add	eax, DWORD PTR _regno$1426[ebp]
	cmp	eax, DWORD PTR _r$1428[ebp]
	jle	$L1431
; Line 2187
	mov	eax, DWORD PTR _r$1428[ebp]
	movsx	eax, WORD PTR _spill_reg_order$S591[eax*2]
	or	eax, eax
	jl	$L1432
; Line 2188
	mov	DWORD PTR _j$[ebp], 0
	jmp	$L1433
$L1434:
	inc	DWORD PTR _j$[ebp]
$L1433:
	mov	eax, DWORD PTR _j$[ebp]
	cmp	DWORD PTR _n_reloads, eax
	jle	$L1435
; Line 2191
	mov	eax, DWORD PTR _j$[ebp]
	movsx	eax, BYTE PTR _reload_optional[eax]
	or	eax, eax
	jne	$L1436
	mov	eax, DWORD PTR _j$[ebp]
	cmp	DWORD PTR _reload_reg_rtx[eax*4], 0
	jne	$L1436
	mov	eax, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR _reload_reg_class[eax*4]
	movsx	eax, WORD PTR _reg_class_contents[eax*2]
	mov	edx, 1
	mov	cl, BYTE PTR _r$1428[ebp]
	shl	edx, cl
	test	eax, edx
	je	$L1436
; Line 2192
	mov	DWORD PTR _do_avoid$1425[ebp], 1
; Line 2193
$L1436:
	jmp	$L1434
$L1435:
$L1432:
	jmp	$L1430
$L1431:
	cmp	DWORD PTR _do_avoid$1425[ebp], 0
	jne	$L1437
; Line 2194
	mov	DWORD PTR _avoid_return_reg$[ebp], 0
; Line 2195
$L1437:
; Line 2201
$L1424:
; Line 2202
	cmp	DWORD PTR _avoid_return_reg$[ebp], 1
	sbb	eax, eax
	inc	eax
	mov	DWORD PTR _tem$1438[ebp], eax
; Line 2203
	mov	DWORD PTR _j$[ebp], 0
	jmp	$L1439
$L1440:
	inc	DWORD PTR _j$[ebp]
$L1439:
	mov	eax, DWORD PTR _j$[ebp]
	cmp	DWORD PTR _n_reloads, eax
	jle	$L1441
; Line 2204
	mov	eax, DWORD PTR _j$[ebp]
	movsx	eax, BYTE PTR _reload_optional[eax]
	or	eax, eax
	jne	$L1442
	mov	eax, DWORD PTR _j$[ebp]
	cmp	DWORD PTR _reload_reg_rtx[eax*4], 0
	jne	$L1442
; Line 2205
	inc	DWORD PTR _tem$1438[ebp]
; Line 2206
$L1442:
	jmp	$L1440
$L1441:
	mov	eax, DWORD PTR _tem$1438[ebp]
	cmp	DWORD PTR _n_spills$S588, eax
	jge	$L1443
; Line 2207
	mov	DWORD PTR _must_reuse$[ebp], 1
; Line 2208
$L1443:
; Line 2210
	push	168					; 000000a8H
	push	OFFSET _reload_reg_rtx
	lea	eax, DWORD PTR _original_reload_reg_rtx$[ebp]
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
; Line 2214
$retry$1444:
; Line 2215
	push	42					; 0000002aH
	push	0
	push	OFFSET _reload_inherited
	call	_memset
	add	esp, 12					; 0000000cH
; Line 2216
	push	168					; 000000a8H
	push	0
	push	OFFSET _reload_inheritance_insn
	call	_memset
	add	esp, 12					; 0000000cH
; Line 2217
	push	168					; 000000a8H
	push	0
	push	OFFSET _reload_override_in
	call	_memset
	add	esp, 12					; 0000000cH
; Line 2218
	push	10					; 0000000aH
	push	0
	push	OFFSET _reload_reg_in_use$S1354
	call	_memset
	add	esp, 12					; 0000000cH
; Line 2219
	push	10					; 0000000aH
	push	0
	push	OFFSET _reload_reg_in_use_at_all$S1358
	call	_memset
	add	esp, 12					; 0000000cH
; Line 2220
	push	10					; 0000000aH
	push	0
	push	OFFSET _reload_reg_in_use_for_inputs$S1355
	call	_memset
	add	esp, 12					; 0000000cH
; Line 2221
	push	10					; 0000000aH
	push	0
	push	OFFSET _reload_reg_in_use_for_outputs$S1356
	call	_memset
	add	esp, 12					; 0000000cH
; Line 2222
	push	10					; 0000000aH
	push	0
	push	OFFSET _reload_reg_in_use_for_operands$S1357
	call	_memset
	add	esp, 12					; 0000000cH
; Line 2226
	cmp	DWORD PTR _avoid_return_reg$[ebp], 0
	je	$L1445
; Line 2228
	mov	eax, DWORD PTR _avoid_return_reg$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _regno$1446[ebp], eax
; Line 2230
	cmp	DWORD PTR _regno$1446[ebp], 8
	jl	$L1851
	mov	DWORD PTR _nregs$1447[ebp], 1
	jmp	$L1852
$L1851:
	mov	eax, DWORD PTR _avoid_return_reg$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	add	eax, 3
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	mov	DWORD PTR _nregs$1447[ebp], eax
$L1852:
; Line 2233
	mov	eax, DWORD PTR _regno$1446[ebp]
	mov	DWORD PTR _r$1448[ebp], eax
	jmp	$L1449
$L1450:
	inc	DWORD PTR _r$1448[ebp]
$L1449:
	mov	eax, DWORD PTR _nregs$1447[ebp]
	add	eax, DWORD PTR _regno$1446[ebp]
	cmp	eax, DWORD PTR _r$1448[ebp]
	jle	$L1451
; Line 2234
	mov	eax, DWORD PTR _r$1448[ebp]
	movsx	eax, WORD PTR _spill_reg_order$S591[eax*2]
	or	eax, eax
	jl	$L1452
; Line 2235
	mov	eax, DWORD PTR _r$1448[ebp]
	mov	BYTE PTR _reload_reg_in_use$S1354[eax], 1
; Line 2236
$L1452:
	jmp	$L1450
$L1451:
; Line 2255
$L1445:
	mov	DWORD PTR _j$[ebp], 0
	jmp	$L1453
$L1454:
	inc	DWORD PTR _j$[ebp]
$L1453:
	mov	eax, DWORD PTR _j$[ebp]
	cmp	DWORD PTR _n_reloads, eax
	jle	$L1455
; Line 2258
	mov	eax, DWORD PTR _j$[ebp]
	mov	ecx, DWORD PTR _j$[ebp]
	mov	WORD PTR _reload_order[ecx*2], ax
; Line 2259
	mov	eax, DWORD PTR _j$[ebp]
	mov	DWORD PTR _reload_spill_index[eax*4], -1
; Line 2262
	mov	eax, DWORD PTR _j$[ebp]
	cmp	DWORD PTR _reload_inmode[eax*4], 0
	je	$L1855
	mov	eax, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR _reload_outmode[eax*4]
	mov	ecx, DWORD PTR _j$[ebp]
	mov	ecx, DWORD PTR _reload_inmode[ecx*4]
	mov	ecx, DWORD PTR _mode_size[ecx*4]
	cmp	DWORD PTR _mode_size[eax*4], ecx
	jle	$L1853
$L1855:
	mov	eax, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR _reload_outmode[eax*4]
	mov	DWORD PTR _mode$1456[ebp], eax
	jmp	$L1854
$L1853:
	mov	eax, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR _reload_inmode[eax*4]
	mov	DWORD PTR _mode$1456[ebp], eax
$L1854:
; Line 2264
	mov	eax, DWORD PTR _j$[ebp]
	cmp	DWORD PTR _reload_reg_class[eax*4], 11	; 0000000bH
	jne	$L1856
	mov	DWORD PTR -312+[ebp], 1
	jmp	$L1857
$L1856:
	mov	eax, DWORD PTR _mode$1456[ebp]
	mov	eax, DWORD PTR _mode_size[eax*4]
	add	eax, 3
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	mov	DWORD PTR -312+[ebp], eax
$L1857:
	cmp	DWORD PTR -312+[ebp], 1
	jle	$L1457
; Line 2265
	mov	DWORD PTR _have_groups$[ebp], 1
; Line 2268
$L1457:
	mov	eax, DWORD PTR _j$[ebp]
	cmp	DWORD PTR _reload_reg_rtx[eax*4], 0
	je	$L1458
; Line 2269
	mov	eax, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR _reload_when_needed[eax*4]
	push	eax
	mov	eax, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR _reload_reg_rtx[eax*4]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_mark_reload_reg_in_use
	add	esp, 8
; Line 2270
$L1458:
	jmp	$L1454
$L1455:
; Line 2272
	cmp	DWORD PTR _n_reloads, 1
	jle	$L1459
; Line 2273
	push	OFFSET _reload_reg_class_lower
	push	2
	mov	eax, DWORD PTR _n_reloads
	push	eax
	push	OFFSET _reload_order
	call	_qsort
	add	esp, 16					; 00000010H
; Line 2275
$L1459:
	mov	DWORD PTR _j$[ebp], 0
	jmp	$L1460
$L1461:
	inc	DWORD PTR _j$[ebp]
$L1460:
	mov	eax, DWORD PTR _j$[ebp]
	cmp	DWORD PTR _n_reloads, eax
	jle	$L1462
; Line 2277
	mov	eax, DWORD PTR _j$[ebp]
	movsx	eax, WORD PTR _reload_order[eax*2]
	mov	DWORD PTR _r$1463[ebp], eax
; Line 2280
	mov	eax, DWORD PTR _r$1463[ebp]
	mov	eax, DWORD PTR _reload_inmode[eax*4]
	mov	DWORD PTR _reload_mode$1466[ebp], eax
; Line 2284
	mov	eax, DWORD PTR _r$1463[ebp]
	cmp	DWORD PTR _reload_out[eax*4], 0
	jne	$L1470
	mov	eax, DWORD PTR _r$1463[ebp]
	cmp	DWORD PTR _reload_in[eax*4], 0
	jne	$L1470
; Line 2285
	jmp	$L1461
; Line 2287
$L1470:
	mov	eax, DWORD PTR _r$1463[ebp]
	mov	eax, DWORD PTR _reload_outmode[eax*4]
	mov	ecx, DWORD PTR _reload_mode$1466[ebp]
	mov	ecx, DWORD PTR _mode_size[ecx*4]
	cmp	DWORD PTR _mode_size[eax*4], ecx
	jle	$L1471
; Line 2288
	mov	eax, DWORD PTR _r$1463[ebp]
	mov	eax, DWORD PTR _reload_outmode[eax*4]
	mov	DWORD PTR _reload_mode$1466[ebp], eax
; Line 2289
$L1471:
	mov	eax, DWORD PTR _r$1463[ebp]
	movsx	eax, BYTE PTR _reload_strict_low[eax]
	or	eax, eax
	je	$L1472
; Line 2290
	mov	eax, DWORD PTR _r$1463[ebp]
	mov	eax, DWORD PTR _reload_out[eax*4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	mov	DWORD PTR _reload_mode$1466[ebp], eax
; Line 2294
$L1472:
	mov	eax, DWORD PTR _r$1463[ebp]
	cmp	DWORD PTR _reload_reg_rtx[eax*4], 0
	je	$L1473
; Line 2295
	jmp	$L1461
; Line 2305
$L1473:
; Line 2306
	mov	DWORD PTR _regno$1474[ebp], -1
; Line 2308
	mov	eax, DWORD PTR _r$1463[ebp]
	cmp	DWORD PTR _reload_in[eax*4], 0
	jne	$L1475
; Line 2310
	jmp	$L1476
$L1475:
	mov	eax, DWORD PTR _r$1463[ebp]
	mov	eax, DWORD PTR _reload_in[eax*4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1477
; Line 2311
	mov	eax, DWORD PTR _r$1463[ebp]
	mov	eax, DWORD PTR _reload_in[eax*4]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _regno$1474[ebp], eax
; Line 2312
	jmp	$L1478
$L1477:
	mov	eax, DWORD PTR _r$1463[ebp]
	mov	eax, DWORD PTR _reload_in_reg[eax*4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1479
; Line 2313
	mov	eax, DWORD PTR _r$1463[ebp]
	mov	eax, DWORD PTR _reload_in_reg[eax*4]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _regno$1474[ebp], eax
; Line 2323
$L1479:
$L1478:
$L1476:
; Line 2327
	cmp	DWORD PTR _regno$1474[ebp], 0
	jl	$L1480
	mov	eax, DWORD PTR _regno$1474[ebp]
	mov	ecx, DWORD PTR _reg_last_reload_reg$S581
	cmp	DWORD PTR [ecx+eax*4], 0
	je	$L1480
	cmp	DWORD PTR _have_groups$[ebp], 0
	jne	$L1480
	cmp	DWORD PTR _must_reuse$[ebp], 0
	jne	$L1480
; Line 2329
	mov	eax, DWORD PTR _regno$1474[ebp]
	mov	ecx, DWORD PTR _reg_last_reload_reg$S581
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	eax, DWORD PTR [eax+4]
	movsx	eax, WORD PTR _spill_reg_order$S591[eax*2]
	mov	DWORD PTR _i$1464[ebp], eax
; Line 2337
	mov	eax, DWORD PTR _i$1464[ebp]
	mov	ecx, DWORD PTR _regno$1474[ebp]
	cmp	DWORD PTR _reg_reloaded_contents$S586[eax*4], ecx
	jne	$L1481
	mov	eax, DWORD PTR _reload_mode$1466[ebp]
	push	eax
	mov	eax, DWORD PTR _i$1464[ebp]
	movsx	eax, BYTE PTR _spill_regs$S593[eax]
	push	eax
	call	_hard_regno_mode_ok
	add	esp, 8
	or	eax, eax
	je	$L1481
	mov	eax, DWORD PTR _r$1463[ebp]
	mov	eax, DWORD PTR _reload_reg_class[eax*4]
	movsx	eax, WORD PTR _reg_class_contents[eax*2]
	mov	edx, 1
	mov	ebx, DWORD PTR _i$1464[ebp]
	mov	cl, BYTE PTR _spill_regs$S593[ebx]
	shl	edx, cl
	test	eax, edx
	je	$L1481
	mov	eax, DWORD PTR _r$1463[ebp]
	mov	eax, DWORD PTR _reload_when_needed[eax*4]
	push	eax
	mov	eax, DWORD PTR _i$1464[ebp]
	movsx	eax, BYTE PTR _spill_regs$S593[eax]
	push	eax
	call	_reload_reg_free_p
	add	esp, 8
	or	eax, eax
	je	$L1481
	mov	eax, DWORD PTR _r$1463[ebp]
	mov	eax, DWORD PTR _reload_when_needed[eax*4]
	push	eax
	mov	eax, DWORD PTR _i$1464[ebp]
	movsx	eax, BYTE PTR _spill_regs$S593[eax]
	push	eax
	call	_reload_reg_free_before_p
	add	esp, 8
	or	eax, eax
	je	$L1481
; Line 2340
	mov	eax, DWORD PTR _r$1463[ebp]
	mov	eax, DWORD PTR _reload_when_needed[eax*4]
	push	eax
	mov	eax, DWORD PTR _i$1464[ebp]
	movsx	eax, BYTE PTR _spill_regs$S593[eax]
	push	eax
	call	_mark_reload_reg_in_use
	add	esp, 8
; Line 2341
	mov	eax, DWORD PTR _regno$1474[ebp]
	mov	ecx, DWORD PTR _reg_last_reload_reg$S581
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _r$1463[ebp]
	mov	DWORD PTR _reload_reg_rtx[ecx*4], eax
; Line 2342
	mov	eax, DWORD PTR _r$1463[ebp]
	mov	BYTE PTR _reload_inherited[eax], 1
; Line 2343
	mov	eax, DWORD PTR _i$1464[ebp]
	mov	eax, DWORD PTR _reg_reloaded_insn$S587[eax*4]
	mov	ecx, DWORD PTR _r$1463[ebp]
	mov	DWORD PTR _reload_inheritance_insn[ecx*4], eax
; Line 2344
	mov	eax, DWORD PTR _i$1464[ebp]
	mov	ecx, DWORD PTR _r$1463[ebp]
	mov	DWORD PTR _reload_spill_index[ecx*4], eax
; Line 2346
$L1481:
; Line 2347
$L1480:
; Line 2363
	mov	eax, DWORD PTR _r$1463[ebp]
	cmp	DWORD PTR _reload_in[eax*4], 0
	je	$L1482
	mov	eax, DWORD PTR _r$1463[ebp]
	cmp	DWORD PTR _reload_reg_rtx[eax*4], 0
	jne	$L1482
	mov	eax, DWORD PTR _r$1463[ebp]
	cmp	DWORD PTR _reload_out[eax*4], 0
	jne	$L1482
	mov	eax, DWORD PTR _r$1463[ebp]
	mov	eax, DWORD PTR _reload_in[eax*4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1483
	mov	eax, DWORD PTR _r$1463[ebp]
	mov	eax, DWORD PTR _reload_in[eax*4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1483
	mov	eax, DWORD PTR _r$1463[ebp]
	mov	eax, DWORD PTR _reload_in[eax*4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1483
	mov	eax, DWORD PTR _r$1463[ebp]
	mov	eax, DWORD PTR _reload_in[eax*4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1483
	mov	eax, DWORD PTR _r$1463[ebp]
	mov	eax, DWORD PTR _reload_in[eax*4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1483
	mov	eax, DWORD PTR _r$1463[ebp]
	mov	eax, DWORD PTR _reload_in[eax*4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1483
	mov	eax, DWORD PTR _r$1463[ebp]
	mov	eax, DWORD PTR _reload_in[eax*4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1482
$L1483:
	cmp	DWORD PTR _have_groups$[ebp], 0
	jne	$L1482
	cmp	DWORD PTR _must_reuse$[ebp], 0
	jne	$L1482
; Line 2367
	mov	eax, DWORD PTR _reload_mode$1466[ebp]
	push	eax
	push	0
	push	0
	push	-1
	mov	eax, DWORD PTR _r$1463[ebp]
	mov	eax, DWORD PTR _reload_reg_class[eax*4]
	push	eax
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _r$1463[ebp]
	mov	eax, DWORD PTR _reload_in[eax*4]
	push	eax
	call	_find_equiv_reg
	add	esp, 28					; 0000001cH
	mov	DWORD PTR _equiv$1484[ebp], eax
; Line 2370
	cmp	DWORD PTR _equiv$1484[ebp], 0
	je	$L1486
; Line 2371
	mov	eax, DWORD PTR _equiv$1484[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _regno$1485[ebp], eax
; Line 2375
$L1486:
; Line 2377
	cmp	DWORD PTR _equiv$1484[ebp], 0
	je	$L1487
	mov	eax, DWORD PTR _equiv$1484[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1487
	mov	eax, DWORD PTR _regno$1485[ebp]
	movsx	eax, WORD PTR _spill_reg_order$S591[eax*2]
	or	eax, eax
	jl	$L1487
	mov	eax, DWORD PTR _r$1463[ebp]
	mov	eax, DWORD PTR _reload_when_needed[eax*4]
	push	eax
	mov	eax, DWORD PTR _regno$1485[ebp]
	push	eax
	call	_reload_reg_free_before_p
	add	esp, 8
	or	eax, eax
	je	$L1487
; Line 2379
	mov	eax, DWORD PTR _r$1463[ebp]
	mov	eax, DWORD PTR _reload_reg_class[eax*4]
	movsx	eax, WORD PTR _reg_class_contents[eax*2]
	mov	edx, 1
	mov	cl, BYTE PTR _regno$1485[ebp]
	shl	edx, cl
	test	eax, edx
	jne	$L1488
; Line 2381
	mov	DWORD PTR _equiv$1484[ebp], 0
; Line 2382
$L1488:
; Line 2384
$L1487:
	cmp	DWORD PTR _equiv$1484[ebp], 0
	je	$L1489
	mov	eax, DWORD PTR _regno$1485[ebp]
	movsx	eax, BYTE PTR _reload_reg_in_use_at_all$S1358[eax]
	or	eax, eax
	je	$L1489
; Line 2385
	mov	DWORD PTR _equiv$1484[ebp], 0
; Line 2387
$L1489:
	cmp	DWORD PTR _equiv$1484[ebp], 0
	je	$L1490
	mov	eax, DWORD PTR _reload_mode$1466[ebp]
	push	eax
	mov	eax, DWORD PTR _regno$1485[ebp]
	push	eax
	call	_hard_regno_mode_ok
	add	esp, 8
	or	eax, eax
	jne	$L1490
; Line 2388
	mov	DWORD PTR _equiv$1484[ebp], 0
; Line 2395
$L1490:
	cmp	DWORD PTR _equiv$1484[ebp], 0
	je	$L1491
; Line 2396
	mov	DWORD PTR _i$1464[ebp], 0
	jmp	$L1492
$L1493:
	inc	DWORD PTR _i$1464[ebp]
$L1492:
	mov	eax, DWORD PTR _i$1464[ebp]
	cmp	DWORD PTR _n_earlyclobbers, eax
	jle	$L1494
; Line 2397
	mov	eax, DWORD PTR _i$1464[ebp]
	mov	eax, DWORD PTR _reload_earlyclobbers[eax*4]
	push	eax
	mov	eax, DWORD PTR _equiv$1484[ebp]
	push	eax
	call	_reg_overlap_mentioned_p
	add	esp, 8
	or	eax, eax
	je	$L1496
; Line 2399
	mov	eax, DWORD PTR _equiv$1484[ebp]
	mov	ecx, DWORD PTR _r$1463[ebp]
	mov	DWORD PTR _reload_override_in[ecx*4], eax
; Line 2400
	mov	DWORD PTR _equiv$1484[ebp], 0
; Line 2401
	jmp	$L1494
; Line 2406
$L1496:
	jmp	$L1493
$L1494:
$L1491:
; Line 2407
	cmp	DWORD PTR _equiv$1484[ebp], 0
	je	$L1497
	mov	eax, DWORD PTR _equiv$1484[ebp]
	cmp	DWORD PTR [eax+4], 6
	je	$L1497
; Line 2409
	mov	eax, DWORD PTR _equiv$1484[ebp]
	mov	ecx, DWORD PTR _r$1463[ebp]
	mov	DWORD PTR _reload_reg_rtx[ecx*4], eax
; Line 2410
	mov	eax, DWORD PTR _r$1463[ebp]
	mov	BYTE PTR _reload_inherited[eax], 1
; Line 2413
	mov	eax, DWORD PTR _equiv$1484[ebp]
	mov	eax, DWORD PTR [eax+4]
	movsx	eax, WORD PTR _spill_reg_order$S591[eax*2]
	mov	DWORD PTR _i$1464[ebp], eax
; Line 2414
	cmp	DWORD PTR _i$1464[ebp], 0
	jl	$L1498
; Line 2416
	mov	eax, DWORD PTR _i$1464[ebp]
	movsx	eax, BYTE PTR _spill_regs$S593[eax]
	cmp	eax, 8
	jl	$L1858
	mov	DWORD PTR _nr$1499[ebp], 1
	jmp	$L1859
$L1858:
	mov	eax, DWORD PTR _reload_mode$1466[ebp]
	mov	eax, DWORD PTR _mode_size[eax*4]
	add	eax, 3
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	mov	DWORD PTR _nr$1499[ebp], eax
$L1859:
; Line 2417
$L1501:
	cmp	DWORD PTR _nr$1499[ebp], 0
	jle	$L1502
; Line 2419
	dec	DWORD PTR _nr$1499[ebp]
	mov	eax, DWORD PTR _r$1463[ebp]
	mov	eax, DWORD PTR _reload_when_needed[eax*4]
	push	eax
	mov	eax, DWORD PTR _equiv$1484[ebp]
	mov	eax, DWORD PTR [eax+4]
	add	eax, DWORD PTR _nr$1499[ebp]
	push	eax
	call	_mark_reload_reg_in_use
	add	esp, 8
	jmp	$L1501
$L1502:
; Line 2421
$L1498:
; Line 2422
$L1497:
; Line 2426
$L1482:
	mov	eax, DWORD PTR _r$1463[ebp]
	cmp	DWORD PTR _reload_reg_rtx[eax*4], 0
	jne	$L1504
	mov	eax, DWORD PTR _r$1463[ebp]
	movsx	eax, BYTE PTR _reload_optional[eax]
	or	eax, eax
	je	$L1503
$L1504:
; Line 2427
	jmp	$L1461
; Line 2431
$L1503:
	mov	eax, DWORD PTR _n_spills$S588
	mov	DWORD PTR _i$1464[ebp], eax
; Line 2497
	mov	eax, DWORD PTR _n_spills$S588
	cmp	DWORD PTR _i$1464[ebp], eax
	jne	$L1505
; Line 2510
	mov	eax, DWORD PTR _r$1463[ebp]
	cmp	DWORD PTR _reload_reg_class[eax*4], 11	; 0000000bH
	jne	$L1860
	mov	DWORD PTR -316+[ebp], 1
	jmp	$L1861
$L1860:
	mov	eax, DWORD PTR _reload_mode$1466[ebp]
	mov	eax, DWORD PTR _mode_size[eax*4]
	add	eax, 3
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	mov	DWORD PTR -316+[ebp], eax
$L1861:
	cmp	DWORD PTR -316+[ebp], 1
	mov	eax, 0
	setg	al
	mov	DWORD PTR _force_group$1507[ebp], eax
; Line 2513
	mov	eax, DWORD PTR _j$[ebp]
	inc	eax
	cmp	eax, DWORD PTR _n_reloads
	jne	$L1508
; Line 2514
	mov	DWORD PTR _force_group$1507[ebp], 0
; Line 2516
$L1508:
	mov	DWORD PTR _pass$1506[ebp], 0
	jmp	$L1509
$L1510:
	inc	DWORD PTR _pass$1506[ebp]
$L1509:
	cmp	DWORD PTR _pass$1506[ebp], 2
	jge	$L1511
; Line 2518
	mov	DWORD PTR _i$1464[ebp], 0
	jmp	$L1512
$L1513:
	inc	DWORD PTR _i$1464[ebp]
$L1512:
	mov	eax, DWORD PTR _n_spills$S588
	cmp	DWORD PTR _i$1464[ebp], eax
	jge	$L1514
; Line 2520
	mov	eax, DWORD PTR _r$1463[ebp]
	mov	eax, DWORD PTR _reload_reg_class[eax*4]
	mov	DWORD PTR _class$1515[ebp], eax
; Line 2525
	mov	eax, DWORD PTR _r$1463[ebp]
	mov	eax, DWORD PTR _reload_when_needed[eax*4]
	push	eax
	mov	eax, DWORD PTR _i$1464[ebp]
	movsx	eax, BYTE PTR _spill_regs$S593[eax]
	push	eax
	call	_reload_reg_free_p
	add	esp, 8
	or	eax, eax
	je	$L1516
	mov	eax, 1
	mov	edx, DWORD PTR _i$1464[ebp]
	mov	cl, BYTE PTR _spill_regs$S593[edx]
	shl	eax, cl
	mov	ecx, DWORD PTR _class$1515[ebp]
	movsx	ecx, WORD PTR _reg_class_contents[ecx*2]
	test	eax, ecx
	je	$L1516
	cmp	DWORD PTR _pass$1506[ebp], 0
	jne	$L1517
	mov	eax, DWORD PTR _i$1464[ebp]
	movsx	eax, BYTE PTR _spill_regs$S593[eax]
	movsx	eax, BYTE PTR _reload_reg_in_use_at_all$S1358[eax]
	or	eax, eax
	je	$L1516
$L1517:
; Line 2527
	mov	eax, DWORD PTR _i$1464[ebp]
	movsx	eax, BYTE PTR _spill_regs$S593[eax]
	cmp	eax, 8
	jl	$L1862
	mov	DWORD PTR _nr$1518[ebp], 1
	jmp	$L1863
$L1862:
	mov	eax, DWORD PTR _reload_mode$1466[ebp]
	mov	eax, DWORD PTR _mode_size[eax*4]
	add	eax, 3
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	mov	DWORD PTR _nr$1518[ebp], eax
$L1863:
; Line 2531
	cmp	DWORD PTR _force_group$1507[ebp], 0
	je	$L1519
; Line 2532
	mov	eax, DWORD PTR _r$1463[ebp]
	cmp	DWORD PTR _reload_reg_class[eax*4], 11	; 0000000bH
	jne	$L1864
	mov	DWORD PTR _nr$1518[ebp], 1
	jmp	$L1865
$L1864:
	mov	eax, DWORD PTR _reload_mode$1466[ebp]
	mov	eax, DWORD PTR _mode_size[eax*4]
	add	eax, 3
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	mov	DWORD PTR _nr$1518[ebp], eax
$L1865:
; Line 2534
$L1519:
	cmp	DWORD PTR _nr$1518[ebp], 1
	jne	$L1520
; Line 2537
	cmp	DWORD PTR _force_group$1507[ebp], 0
	je	$L1521
; Line 2538
	jmp	$L1513
; Line 2539
$L1521:
	jmp	$L1514
; Line 2545
$L1520:
; Line 2546
	mov	eax, DWORD PTR _reload_mode$1466[ebp]
	push	eax
	mov	eax, DWORD PTR _i$1464[ebp]
	movsx	eax, BYTE PTR _spill_regs$S593[eax]
	push	eax
	call	_hard_regno_mode_ok
	add	esp, 8
	or	eax, eax
	je	$L1522
	mov	eax, DWORD PTR _i$1464[ebp]
	movsx	eax, BYTE PTR _spill_regs$S593[eax]
	movsx	eax, BYTE PTR _counted_for_nongroups$S597[eax]
	or	eax, eax
	jne	$L1522
; Line 2547
$L1524:
	cmp	DWORD PTR _nr$1518[ebp], 1
	jle	$L1525
; Line 2549
	mov	eax, DWORD PTR _i$1464[ebp]
	movsx	eax, BYTE PTR _spill_regs$S593[eax]
	add	eax, DWORD PTR _nr$1518[ebp]
	dec	eax
	mov	DWORD PTR _regno$1526[ebp], eax
; Line 2554
	mov	eax, DWORD PTR _class$1515[ebp]
	movsx	eax, WORD PTR _reg_class_contents[eax*2]
	mov	edx, 1
	mov	cl, BYTE PTR _regno$1526[ebp]
	shl	edx, cl
	test	eax, edx
	je	$L1528
	mov	eax, DWORD PTR _regno$1526[ebp]
	movsx	eax, WORD PTR _spill_reg_order$S591[eax*2]
	or	eax, eax
	jl	$L1528
	mov	eax, DWORD PTR _r$1463[ebp]
	mov	eax, DWORD PTR _reload_when_needed[eax*4]
	push	eax
	mov	eax, DWORD PTR _regno$1526[ebp]
	push	eax
	call	_reload_reg_free_p
	add	esp, 8
	or	eax, eax
	je	$L1528
	mov	eax, DWORD PTR _regno$1526[ebp]
	movsx	eax, BYTE PTR _counted_for_nongroups$S597[eax]
	or	eax, eax
	je	$L1527
$L1528:
; Line 2555
	jmp	$L1525
; Line 2556
$L1527:
	dec	DWORD PTR _nr$1518[ebp]
; Line 2557
	jmp	$L1524
$L1525:
; Line 2558
$L1522:
	cmp	DWORD PTR _nr$1518[ebp], 1
	jne	$L1529
; Line 2559
	jmp	$L1514
; Line 2560
$L1529:
; Line 2561
$L1516:
	jmp	$L1513
$L1514:
; Line 2563
	mov	eax, DWORD PTR _n_spills$S588
	cmp	DWORD PTR _i$1464[ebp], eax
	jge	$L1530
; Line 2564
	jmp	$L1511
; Line 2565
$L1530:
	jmp	$L1510
$L1511:
; Line 2569
$L1505:
	mov	eax, DWORD PTR _n_spills$S588
	cmp	DWORD PTR _i$1464[ebp], eax
	jne	$L1531
; Line 2571
	cmp	DWORD PTR _must_reuse$[ebp], 0
	je	$L1532
; Line 2572
	call	_abort
; Line 2573
$L1532:
	push	168					; 000000a8H
	lea	eax, DWORD PTR _original_reload_reg_rtx$[ebp]
	push	eax
	push	OFFSET _reload_reg_rtx
	call	_memcpy
	add	esp, 12					; 0000000cH
; Line 2574
	mov	DWORD PTR _must_reuse$[ebp], 1
; Line 2575
	jmp	$retry$1444
; Line 2579
$L1531:
; Line 2580
	mov	eax, DWORD PTR _i$1464[ebp]
	movsx	eax, BYTE PTR _spill_regs$S593[eax]
	cmp	eax, 8
	jl	$L1866
	mov	DWORD PTR _nr$1533[ebp], 1
	jmp	$L1867
$L1866:
	mov	eax, DWORD PTR _reload_mode$1466[ebp]
	mov	eax, DWORD PTR _mode_size[eax*4]
	add	eax, 3
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	mov	DWORD PTR _nr$1533[ebp], eax
$L1867:
; Line 2581
$L1535:
	cmp	DWORD PTR _nr$1533[ebp], 0
	jle	$L1536
; Line 2584
	dec	DWORD PTR _nr$1533[ebp]
	mov	eax, DWORD PTR _r$1463[ebp]
	mov	eax, DWORD PTR _reload_when_needed[eax*4]
	push	eax
	mov	eax, DWORD PTR _i$1464[ebp]
	movsx	eax, BYTE PTR _spill_regs$S593[eax]
	add	eax, DWORD PTR _nr$1533[ebp]
	push	eax
	call	_mark_reload_reg_in_use
	add	esp, 8
; Line 2585
	mov	eax, DWORD PTR _i$1464[ebp]
	movsx	eax, BYTE PTR _spill_regs$S593[eax]
	add	eax, DWORD PTR _nr$1533[ebp]
	movsx	eax, WORD PTR _spill_reg_order$S591[eax*2]
	mov	DWORD PTR _reg_reloaded_contents$S586[eax*4], -1
; Line 2586
	mov	eax, DWORD PTR _i$1464[ebp]
	movsx	eax, BYTE PTR _spill_regs$S593[eax]
	add	eax, DWORD PTR _nr$1533[ebp]
	movsx	eax, WORD PTR _spill_reg_order$S591[eax*2]
	mov	DWORD PTR _reg_reloaded_insn$S587[eax*4], 0
; Line 2587
	jmp	$L1535
$L1536:
; Line 2590
	mov	eax, DWORD PTR _i$1464[ebp]
	mov	eax, DWORD PTR _spill_reg_rtx$S589[eax*4]
	mov	DWORD PTR _new$1465[ebp], eax
; Line 2592
	cmp	DWORD PTR _new$1465[ebp], 0
	je	$L1538
	mov	eax, DWORD PTR _new$1465[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	cmp	eax, DWORD PTR _reload_mode$1466[ebp]
	je	$L1537
$L1538:
; Line 2593
	mov	eax, DWORD PTR _i$1464[ebp]
	movsx	eax, BYTE PTR _spill_regs$S593[eax]
	push	eax
	mov	eax, DWORD PTR _reload_mode$1466[ebp]
	push	eax
	push	34					; 00000022H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _new$1465[ebp], eax
	mov	eax, DWORD PTR _new$1465[ebp]
	mov	ecx, DWORD PTR _i$1464[ebp]
	mov	DWORD PTR _spill_reg_rtx$S589[ecx*4], eax
; Line 2595
$L1537:
	mov	eax, DWORD PTR _new$1465[ebp]
	mov	ecx, DWORD PTR _r$1463[ebp]
	mov	DWORD PTR _reload_reg_rtx[ecx*4], eax
; Line 2596
	mov	eax, DWORD PTR _i$1464[ebp]
	mov	ecx, DWORD PTR _r$1463[ebp]
	mov	DWORD PTR _reload_spill_index[ecx*4], eax
; Line 2600
	mov	eax, DWORD PTR _reload_mode$1466[ebp]
	push	eax
	mov	eax, DWORD PTR _r$1463[ebp]
	mov	eax, DWORD PTR _reload_reg_rtx[eax*4]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_hard_regno_mode_ok
	add	esp, 8
	or	eax, eax
	je	$L1539
; Line 2602
	mov	eax, DWORD PTR _r$1463[ebp]
	cmp	DWORD PTR _reload_in[eax*4], 0
	je	$L1541
	mov	eax, DWORD PTR _r$1463[ebp]
	mov	eax, DWORD PTR _reload_in[eax*4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	mov	eax, DWORD PTR _r$1463[ebp]
	mov	eax, DWORD PTR _reload_reg_rtx[eax*4]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_hard_regno_mode_ok
	add	esp, 8
	or	eax, eax
	je	$L1540
$L1541:
; Line 2605
	mov	eax, DWORD PTR _r$1463[ebp]
	cmp	DWORD PTR _reload_out[eax*4], 0
	je	$L1543
	mov	eax, DWORD PTR _r$1463[ebp]
	mov	eax, DWORD PTR _reload_out[eax*4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	mov	eax, DWORD PTR _r$1463[ebp]
	mov	eax, DWORD PTR _reload_reg_rtx[eax*4]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_hard_regno_mode_ok
	add	esp, 8
	or	eax, eax
	je	$L1542
$L1543:
; Line 2608
	jmp	$L1461
; Line 2611
$L1542:
$L1540:
$L1539:
; Line 2612
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_asm_noperands
	add	esp, 4
	or	eax, eax
	jge	$L1544
; Line 2614
	call	_abort
; Line 2617
$L1544:
; Line 2618
	push	OFFSET $SG1546
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_error_for_asm
	add	esp, 8
; Line 2619
	mov	eax, DWORD PTR _r$1463[ebp]
	mov	DWORD PTR _reload_in[eax*4], 0
; Line 2620
	mov	eax, DWORD PTR _r$1463[ebp]
	mov	DWORD PTR _reload_out[eax*4], 0
; Line 2621
	mov	eax, DWORD PTR _r$1463[ebp]
	mov	DWORD PTR _reload_reg_rtx[eax*4], 0
; Line 2622
	mov	eax, DWORD PTR _r$1463[ebp]
	mov	BYTE PTR _reload_optional[eax], 1
; Line 2624
	jmp	$L1461
$L1462:
; Line 2630
	mov	DWORD PTR _j$[ebp], 0
	jmp	$L1547
$L1548:
	inc	DWORD PTR _j$[ebp]
$L1547:
	mov	eax, DWORD PTR _j$[ebp]
	cmp	DWORD PTR _n_reloads, eax
	jle	$L1549
; Line 2632
	mov	eax, DWORD PTR _j$[ebp]
	movsx	eax, WORD PTR _reload_order[eax*2]
	mov	DWORD PTR _r$1550[ebp], eax
; Line 2636
	mov	eax, DWORD PTR _r$1550[ebp]
	movsx	eax, BYTE PTR _reload_inherited[eax]
	or	eax, eax
	je	$L1551
	mov	eax, DWORD PTR _r$1550[ebp]
	cmp	DWORD PTR _reload_reg_rtx[eax*4], 0
	je	$L1551
	mov	eax, DWORD PTR _r$1550[ebp]
	mov	eax, DWORD PTR _reload_when_needed[eax*4]
	push	eax
	mov	eax, DWORD PTR _r$1550[ebp]
	mov	eax, DWORD PTR _reload_reg_rtx[eax*4]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_reload_reg_free_before_p
	add	esp, 8
	or	eax, eax
	jne	$L1551
; Line 2637
	mov	eax, DWORD PTR _r$1550[ebp]
	mov	BYTE PTR _reload_inherited[eax], 0
; Line 2641
$L1551:
; Line 2645
	mov	eax, DWORD PTR _r$1550[ebp]
	cmp	DWORD PTR _reload_override_in[eax*4], 0
	je	$L1552
	mov	eax, DWORD PTR _r$1550[ebp]
	mov	eax, DWORD PTR _reload_override_in[eax*4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1552
	mov	eax, DWORD PTR _r$1550[ebp]
	mov	eax, DWORD PTR _reload_override_in[eax*4]
	mov	eax, DWORD PTR [eax+4]
	movsx	eax, WORD PTR _spill_reg_order$S591[eax*2]
	or	eax, eax
	jl	$L1552
	mov	eax, DWORD PTR _r$1550[ebp]
	mov	eax, DWORD PTR _reload_when_needed[eax*4]
	push	eax
	mov	eax, DWORD PTR _r$1550[ebp]
	mov	eax, DWORD PTR _reload_override_in[eax*4]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_reload_reg_free_before_p
	add	esp, 8
	or	eax, eax
	jne	$L1552
; Line 2646
	mov	eax, DWORD PTR _r$1550[ebp]
	mov	DWORD PTR _reload_override_in[eax*4], 0
; Line 2647
$L1552:
	jmp	$L1548
$L1549:
; Line 2651
	mov	DWORD PTR _j$[ebp], 0
	jmp	$L1553
$L1554:
	inc	DWORD PTR _j$[ebp]
$L1553:
	mov	eax, DWORD PTR _j$[ebp]
	cmp	DWORD PTR _n_reloads, eax
	jle	$L1555
; Line 2652
	mov	eax, DWORD PTR _j$[ebp]
	cmp	DWORD PTR _reload_override_in[eax*4], 0
	je	$L1556
; Line 2653
	mov	eax, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR _reload_override_in[eax*4]
	mov	ecx, DWORD PTR _j$[ebp]
	mov	DWORD PTR _reload_in[ecx*4], eax
; Line 2659
$L1556:
	jmp	$L1554
$L1555:
	mov	DWORD PTR _j$[ebp], 0
	jmp	$L1557
$L1558:
	inc	DWORD PTR _j$[ebp]
$L1557:
	mov	eax, DWORD PTR _j$[ebp]
	cmp	DWORD PTR _n_reloads, eax
	jle	$L1559
; Line 2661
	mov	eax, DWORD PTR _j$[ebp]
	movsx	eax, WORD PTR _reload_order[eax*2]
	mov	DWORD PTR _r$1560[ebp], eax
; Line 2662
	mov	eax, DWORD PTR _r$1560[ebp]
	mov	eax, DWORD PTR _reload_spill_index[eax*4]
	mov	DWORD PTR _i$1561[ebp], eax
; Line 2667
	cmp	DWORD PTR _i$1561[ebp], 0
	jl	$L1562
	mov	eax, DWORD PTR _r$1560[ebp]
	cmp	DWORD PTR _reload_reg_rtx[eax*4], 0
	je	$L1562
; Line 2670
	mov	eax, DWORD PTR _r$1560[ebp]
	cmp	DWORD PTR _reload_out[eax*4], 0
	je	$L1563
	mov	eax, DWORD PTR _r$1560[ebp]
	mov	eax, DWORD PTR _reload_out[eax*4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1563
; Line 2672
	mov	eax, DWORD PTR _r$1560[ebp]
	mov	eax, DWORD PTR _reload_out[eax*4]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _nregno$1564[ebp], eax
; Line 2673
	mov	eax, DWORD PTR _r$1560[ebp]
	mov	eax, DWORD PTR _reload_reg_rtx[eax*4]
	mov	ecx, DWORD PTR _nregno$1564[ebp]
	mov	edx, DWORD PTR _reg_last_reload_reg$S581
	mov	DWORD PTR [edx+ecx*4], eax
; Line 2674
	mov	eax, DWORD PTR _nregno$1564[ebp]
	mov	ecx, DWORD PTR _i$1561[ebp]
	mov	DWORD PTR _reg_reloaded_contents$S586[ecx*4], eax
; Line 2675
	mov	eax, DWORD PTR _insn$[ebp]
	mov	ecx, DWORD PTR _i$1561[ebp]
	mov	DWORD PTR _reg_reloaded_insn$S587[ecx*4], eax
; Line 2676
	mov	eax, DWORD PTR _nregno$1564[ebp]
	mov	ecx, DWORD PTR _reg_has_output_reload$S582
	mov	BYTE PTR [eax+ecx], 1
; Line 2677
	mov	eax, DWORD PTR _i$1561[ebp]
	movsx	eax, BYTE PTR _spill_regs$S593[eax]
	mov	BYTE PTR _reg_is_output_reload$S583[eax], 1
; Line 2678
	mov	eax, DWORD PTR _r$1560[ebp]
	cmp	DWORD PTR _reload_when_needed[eax*4], 3
	je	$L1565
; Line 2679
	call	_abort
; Line 2680
$L1565:
; Line 2682
	jmp	$L1566
$L1563:
; Line 2684
	mov	eax, DWORD PTR _r$1560[ebp]
	cmp	DWORD PTR _reload_out[eax*4], 0
	jne	$L1567
	mov	eax, DWORD PTR _r$1560[ebp]
	mov	eax, DWORD PTR _reload_in[eax*4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1568
	mov	eax, DWORD PTR _r$1560[ebp]
	mov	eax, DWORD PTR _reload_in_reg[eax*4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1567
$L1568:
; Line 2687
	mov	eax, DWORD PTR _r$1560[ebp]
	mov	eax, DWORD PTR _reload_in[eax*4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1570
; Line 2688
	mov	eax, DWORD PTR _r$1560[ebp]
	mov	eax, DWORD PTR _reload_in[eax*4]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _nregno$1569[ebp], eax
; Line 2689
	jmp	$L1571
$L1570:
; Line 2690
	mov	eax, DWORD PTR _r$1560[ebp]
	mov	eax, DWORD PTR _reload_in_reg[eax*4]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _nregno$1569[ebp], eax
$L1571:
; Line 2697
	mov	eax, DWORD PTR _nregno$1569[ebp]
	mov	ecx, DWORD PTR _reg_has_output_reload$S582
	movsx	eax, BYTE PTR [eax+ecx]
	or	eax, eax
	jne	$L1572
; Line 2699
	mov	eax, DWORD PTR _r$1560[ebp]
	mov	eax, DWORD PTR _reload_reg_rtx[eax*4]
	mov	ecx, DWORD PTR _nregno$1569[ebp]
	mov	edx, DWORD PTR _reg_last_reload_reg$S581
	mov	DWORD PTR [edx+ecx*4], eax
; Line 2700
	mov	eax, DWORD PTR _nregno$1569[ebp]
	mov	ecx, DWORD PTR _i$1561[ebp]
	mov	DWORD PTR _reg_reloaded_contents$S586[ecx*4], eax
; Line 2701
	mov	eax, DWORD PTR _insn$[ebp]
	mov	ecx, DWORD PTR _i$1561[ebp]
	mov	DWORD PTR _reg_reloaded_insn$S587[ecx*4], eax
; Line 2706
	mov	eax, DWORD PTR _r$1560[ebp]
	mov	eax, DWORD PTR _reload_when_needed[eax*4]
	push	eax
	mov	eax, DWORD PTR _i$1561[ebp]
	movsx	eax, BYTE PTR _spill_regs$S593[eax]
	push	eax
	call	_reload_reg_reaches_end_p
	add	esp, 8
	or	eax, eax
	jne	$L1573
; Line 2708
	mov	eax, DWORD PTR _i$1561[ebp]
	mov	DWORD PTR _reg_reloaded_contents$S586[eax*4], -1
; Line 2709
	mov	eax, DWORD PTR _i$1561[ebp]
	mov	DWORD PTR _reg_reloaded_insn$S587[eax*4], 0
; Line 2711
$L1573:
; Line 2712
$L1572:
; Line 2716
	jmp	$L1574
$L1567:
; Line 2718
	mov	eax, DWORD PTR _i$1561[ebp]
	mov	DWORD PTR _reg_reloaded_contents$S586[eax*4], -1
; Line 2719
	mov	eax, DWORD PTR _i$1561[ebp]
	mov	DWORD PTR _reg_reloaded_insn$S587[eax*4], 0
; Line 2720
$L1574:
$L1566:
; Line 2731
$L1562:
	cmp	DWORD PTR _i$1561[ebp], 0
	jge	$L1575
	mov	eax, DWORD PTR _r$1560[ebp]
	cmp	DWORD PTR _reload_out[eax*4], 0
	je	$L1575
	mov	eax, DWORD PTR _r$1560[ebp]
	mov	eax, DWORD PTR _reload_out[eax*4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1575
; Line 2733
	mov	eax, DWORD PTR _r$1560[ebp]
	mov	eax, DWORD PTR _reload_out[eax*4]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _nregno$1576[ebp], eax
; Line 2734
	mov	eax, DWORD PTR _nregno$1576[ebp]
	mov	ecx, DWORD PTR _reg_last_reload_reg$S581
	mov	DWORD PTR [ecx+eax*4], 0
; Line 2735
	mov	eax, DWORD PTR _nregno$1576[ebp]
	mov	ecx, DWORD PTR _reg_has_output_reload$S582
	mov	BYTE PTR [eax+ecx], 1
; Line 2737
$L1575:
	jmp	$L1558
$L1559:
; Line 2738
$L1419:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_choose_reload_regs ENDP
_TEXT	ENDS
EXTRN	_gen_move_insn:NEAR
EXTRN	_reg_n_sets:DWORD
EXTRN	_reg_n_deaths:DWORD
EXTRN	_insn_operand_constraint:BYTE
EXTRN	_dead_or_set_p:NEAR
EXTRN	_optimize:DWORD
EXTRN	_reload_inc:BYTE
EXTRN	_remove_death:NEAR
EXTRN	_regno_dead_p:NEAR
EXTRN	_emit_insn_before:NEAR
EXTRN	_recog_memoized:NEAR
_BSS	SEGMENT
	ALIGN	4

_spill_reg_store$S590 DD 0aH DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
_k$1602 = -52
_reg_notes$1667 = -76
_prev_reg_note$1668 = -72
_next_reg_notes$1672 = -80
_insn1$1677 = -84
_source$1682 = -96
_reg_notes$1683 = -92
_prev_reg_note$1684 = -88
_next_reg_notes$1688 = -100
_temp$1627 = -56
_insn$ = 8
_j$ = -8
_first_output_reload_insn$ = -16
_reloadreg$1645 = -60
_first_other_reload_insn$ = -12
_first_operand_address_reload_insn$ = -4
_special$ = -20
_old$1587 = -28
_store_insn$1588 = -24
_reloadreg$1590 = -44
_reloadreg$1655 = -68
_oldequiv$1591 = -40
_mode$1656 = -64
_mode$1592 = -36
_where$1593 = -32
_this_reload_insn$1594 = -48
_emit_reload_insns PROC NEAR
; Line 2745
	push	ebp
	mov	ebp, esp
	sub	esp, 108				; 0000006cH
	push	ebx
	push	esi
	push	edi
; Line 2747
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _first_output_reload_insn$[ebp], eax
; Line 2748
	mov	eax, DWORD PTR _insn$[ebp]
	mov	DWORD PTR _first_other_reload_insn$[ebp], eax
; Line 2749
	mov	eax, DWORD PTR _insn$[ebp]
	mov	DWORD PTR _first_operand_address_reload_insn$[ebp], eax
; Line 2757
	mov	DWORD PTR _j$[ebp], 0
	jmp	$L1584
$L1585:
	inc	DWORD PTR _j$[ebp]
$L1584:
	mov	eax, DWORD PTR _n_reloads
	cmp	DWORD PTR _j$[ebp], eax
	jge	$L1586
; Line 2762
	mov	eax, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR _reload_in[eax*4]
	mov	DWORD PTR _old$1587[ebp], eax
; Line 2765
	cmp	DWORD PTR _old$1587[ebp], 0
	je	$L1589
	mov	eax, DWORD PTR _j$[ebp]
	movsx	eax, BYTE PTR _reload_inherited[eax]
	or	eax, eax
	jne	$L1589
	mov	eax, DWORD PTR _j$[ebp]
	mov	ecx, DWORD PTR _old$1587[ebp]
	cmp	DWORD PTR _reload_reg_rtx[eax*4], ecx
	je	$L1589
	mov	eax, DWORD PTR _j$[ebp]
	cmp	DWORD PTR _reload_reg_rtx[eax*4], 0
	je	$L1589
; Line 2767
	mov	eax, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR _reload_reg_rtx[eax*4]
	mov	DWORD PTR _reloadreg$1590[ebp], eax
; Line 2768
	mov	DWORD PTR _oldequiv$1591[ebp], 0
; Line 2771
	mov	DWORD PTR _this_reload_insn$1594[ebp], 0
; Line 2819
	mov	eax, DWORD PTR _old$1587[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	mov	DWORD PTR _mode$1592[ebp], eax
; Line 2820
	cmp	DWORD PTR _mode$1592[ebp], 0
	jne	$L1595
; Line 2821
	mov	eax, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR _reload_inmode[eax*4]
	mov	DWORD PTR _mode$1592[ebp], eax
; Line 2822
$L1595:
	mov	eax, DWORD PTR _j$[ebp]
	movsx	eax, BYTE PTR _reload_strict_low[eax]
	or	eax, eax
	je	$L1596
; Line 2823
	mov	eax, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR _reload_in[eax*4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	mov	DWORD PTR _mode$1592[ebp], eax
; Line 2833
$L1596:
; Line 2836
	mov	eax, DWORD PTR _old$1587[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1598
	mov	eax, DWORD PTR _old$1587[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1597
	mov	eax, DWORD PTR _old$1587[ebp]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L1597
	mov	eax, DWORD PTR _old$1587[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	or	eax, eax
	jge	$L1597
$L1598:
; Line 2838
	mov	eax, DWORD PTR _mode$1592[ebp]
	push	eax
	push	0
	push	0
	push	-1
	push	10					; 0000000aH
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _old$1587[ebp]
	push	eax
	call	_find_equiv_reg
	add	esp, 28					; 0000001cH
	mov	DWORD PTR _oldequiv$1591[ebp], eax
; Line 2843
$L1597:
; Line 2847
	cmp	DWORD PTR _oldequiv$1591[ebp], 0
	je	$L1599
	mov	eax, DWORD PTR _oldequiv$1591[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1599
	mov	eax, DWORD PTR _oldequiv$1591[ebp]
	mov	eax, DWORD PTR [eax+4]
	movsx	eax, WORD PTR _spill_reg_order$S591[eax*2]
	or	eax, eax
	jl	$L1599
	mov	eax, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR _reload_when_needed[eax*4]
	push	eax
	mov	eax, DWORD PTR _oldequiv$1591[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_reload_reg_free_p
	add	esp, 8
	or	eax, eax
	je	$L1600
	mov	eax, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR _reload_when_needed[eax*4]
	push	eax
	mov	eax, DWORD PTR _oldequiv$1591[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_reload_reg_free_before_p
	add	esp, 8
	or	eax, eax
	jne	$L1599
$L1600:
; Line 2848
	mov	DWORD PTR _oldequiv$1591[ebp], 0
; Line 2852
$L1599:
; Line 2853
	cmp	DWORD PTR _oldequiv$1591[ebp], 0
	je	$L1601
	mov	eax, DWORD PTR _oldequiv$1591[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1601
	mov	eax, DWORD PTR _oldequiv$1591[ebp]
	mov	eax, DWORD PTR [eax+4]
	movsx	eax, WORD PTR _spill_reg_order$S591[eax*2]
	or	eax, eax
	jge	$L1601
; Line 2856
	mov	DWORD PTR _k$1602[ebp], 0
	jmp	$L1603
$L1604:
	inc	DWORD PTR _k$1602[ebp]
$L1603:
	mov	eax, DWORD PTR _n_reloads
	cmp	DWORD PTR _k$1602[ebp], eax
	jge	$L1605
; Line 2858
	mov	eax, DWORD PTR _k$1602[ebp]
	cmp	DWORD PTR _reload_reg_rtx[eax*4], 0
	je	$L1606
	mov	eax, DWORD PTR _j$[ebp]
	cmp	DWORD PTR _k$1602[ebp], eax
	je	$L1606
	mov	eax, DWORD PTR _oldequiv$1591[ebp]
	push	eax
	mov	eax, DWORD PTR _k$1602[ebp]
	mov	eax, DWORD PTR _reload_reg_rtx[eax*4]
	push	eax
	call	_reg_overlap_mentioned_p
	add	esp, 8
	or	eax, eax
	je	$L1606
; Line 2860
	mov	DWORD PTR _oldequiv$1591[ebp], 0
; Line 2861
	jmp	$L1605
; Line 2863
$L1606:
	jmp	$L1604
$L1605:
; Line 2865
$L1601:
	cmp	DWORD PTR _oldequiv$1591[ebp], 0
	jne	$L1607
; Line 2866
	mov	eax, DWORD PTR _old$1587[ebp]
	mov	DWORD PTR _oldequiv$1591[ebp], eax
; Line 2871
$L1607:
	mov	eax, DWORD PTR _reloadreg$1590[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	cmp	eax, DWORD PTR _mode$1592[ebp]
	je	$L1608
; Line 2872
	mov	eax, DWORD PTR _reloadreg$1590[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _mode$1592[ebp]
	push	eax
	push	34					; 00000022H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _reloadreg$1590[ebp], eax
; Line 2873
$L1608:
$L1610:
	mov	eax, DWORD PTR _oldequiv$1591[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1611
	mov	eax, DWORD PTR _oldequiv$1591[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	cmp	eax, DWORD PTR _mode$1592[ebp]
	je	$L1611
; Line 2874
	mov	eax, DWORD PTR _oldequiv$1591[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _oldequiv$1591[ebp], eax
	jmp	$L1610
$L1611:
; Line 2876
	mov	eax, DWORD PTR _oldequiv$1591[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sub	ecx, ecx
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L1612
	mov	eax, DWORD PTR _oldequiv$1591[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	cmp	eax, DWORD PTR _mode$1592[ebp]
	je	$L1612
; Line 2877
	push	0
	mov	eax, DWORD PTR _oldequiv$1591[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$1592[ebp]
	push	eax
	push	35					; 00000023H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	DWORD PTR _oldequiv$1591[ebp], eax
; Line 2880
$L1612:
	mov	eax, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR _reload_when_needed[eax*4]
	mov	DWORD PTR -104+[ebp], eax
	jmp	$L1613
; Line 2882
$L1617:
; Line 2883
	mov	eax, DWORD PTR _first_operand_address_reload_insn$[ebp]
	mov	DWORD PTR _where$1593[ebp], eax
; Line 2884
	jmp	$L1614
; Line 2885
$L1618:
; Line 2886
	mov	eax, DWORD PTR _first_other_reload_insn$[ebp]
	mov	DWORD PTR _where$1593[ebp], eax
; Line 2887
	jmp	$L1614
; Line 2888
$L1619:
; Line 2889
	mov	eax, DWORD PTR _first_output_reload_insn$[ebp]
	mov	DWORD PTR _where$1593[ebp], eax
; Line 2890
	jmp	$L1614
; Line 2891
$L1620:
; Line 2892
	mov	eax, DWORD PTR _insn$[ebp]
	mov	DWORD PTR _where$1593[ebp], eax
; Line 2893
	jmp	$L1614
$L1613:
	cmp	DWORD PTR -104+[ebp], 0
	je	$L1618
	cmp	DWORD PTR -104+[ebp], 1
	je	$L1619
	cmp	DWORD PTR -104+[ebp], 2
	je	$L1620
	cmp	DWORD PTR -104+[ebp], 3
	je	$L1617
	jmp	$L1614
$L1614:
; Line 2895
	mov	DWORD PTR _special$[ebp], 0
; Line 2901
	mov	eax, DWORD PTR _oldequiv$1591[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 4325376				; 00420000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1622
	mov	eax, DWORD PTR _oldequiv$1591[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 4259840				; 00410000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1622
	mov	eax, DWORD PTR _oldequiv$1591[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 4194304				; 00400000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1622
	mov	eax, DWORD PTR _oldequiv$1591[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 4128768				; 003f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1621
$L1622:
; Line 2904
	mov	DWORD PTR _special$[ebp], 1
; Line 2907
	mov	eax, DWORD PTR _where$1593[ebp]
	push	eax
	mov	eax, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR _reload_inc[eax*4]
	push	eax
	mov	eax, DWORD PTR _oldequiv$1591[ebp]
	push	eax
	mov	eax, DWORD PTR _reloadreg$1590[ebp]
	push	eax
	call	_inc_for_reload
	add	esp, 16					; 00000010H
	mov	DWORD PTR _this_reload_insn$1594[ebp], eax
; Line 2914
	jmp	$L1623
$L1621:
; Line 2920
	cmp	DWORD PTR _optimize, 0
	je	$L1625
	mov	eax, DWORD PTR _old$1587[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1625
	mov	eax, DWORD PTR _old$1587[ebp]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L1625
	mov	eax, DWORD PTR _old$1587[ebp]
	push	eax
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_dead_or_set_p
	add	esp, 8
	or	eax, eax
	je	$L1625
	mov	eax, DWORD PTR _j$[ebp]
	cmp	DWORD PTR _reload_when_needed[eax*4], 3
	je	$L1626
	mov	eax, DWORD PTR _j$[ebp]
	cmp	DWORD PTR _reload_when_needed[eax*4], 0
	jne	$L1625
$L1626:
; Line 2922
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _temp$1627[ebp], eax
; Line 2923
$L1629:
	cmp	DWORD PTR _temp$1627[ebp], 0
	je	$L1630
	mov	eax, DWORD PTR _temp$1627[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1179648				; 00120000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1630
; Line 2924
	mov	eax, DWORD PTR _temp$1627[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _temp$1627[ebp], eax
	jmp	$L1629
$L1630:
; Line 2938
	cmp	DWORD PTR _temp$1627[ebp], 0
	je	$L1631
	mov	eax, DWORD PTR _temp$1627[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 851968				; 000d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1631
	mov	eax, DWORD PTR _temp$1627[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1631
	mov	eax, DWORD PTR _temp$1627[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _old$1587[ebp]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L1631
	mov	eax, DWORD PTR _temp$1627[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_asm_noperands
	add	esp, 4
	or	eax, eax
	jge	$L1631
	mov	eax, DWORD PTR _reloadreg$1590[ebp]
	push	eax
	mov	eax, DWORD PTR _temp$1627[ebp]
	push	eax
	call	_recog_memoized
	add	esp, 4
	lea	ecx, DWORD PTR [eax*8]
	sub	ecx, eax
	mov	eax, DWORD PTR _insn_operand_constraint[ecx*4]
	push	eax
	call	_constraint_accepts_reg_p
	add	esp, 8
	or	eax, eax
	je	$L1631
	mov	eax, DWORD PTR _old$1587[ebp]
	push	eax
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_count_occurrences
	add	esp, 8
	cmp	eax, 1
	jne	$L1631
	mov	eax, DWORD PTR _temp$1627[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _old$1587[ebp]
	push	eax
	call	_reg_mentioned_p
	add	esp, 8
	or	eax, eax
	jne	$L1631
; Line 2941
	mov	eax, DWORD PTR _reloadreg$1590[ebp]
	mov	ecx, DWORD PTR _temp$1627[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	mov	DWORD PTR [ecx+4], eax
; Line 2945
	mov	eax, DWORD PTR _old$1587[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg_n_deaths
	movsx	eax, WORD PTR [ecx+eax*2]
	cmp	eax, 1
	jne	$L1632
	mov	eax, DWORD PTR _old$1587[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg_n_sets
	movsx	eax, WORD PTR [ecx+eax*2]
	cmp	eax, 1
	jne	$L1632
; Line 2947
	mov	eax, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR _reload_reg_rtx[eax*4]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _old$1587[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	mov	edx, DWORD PTR _reg_renumber
	mov	WORD PTR [edx+ecx*2], ax
; Line 2948
	push	-1
	mov	eax, DWORD PTR _old$1587[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_alter_reg
	add	esp, 8
; Line 2950
$L1632:
	mov	DWORD PTR _special$[ebp], 1
; Line 2952
$L1631:
; Line 2962
$L1625:
$L1623:
	cmp	DWORD PTR _special$[ebp], 0
	jne	$L1633
; Line 2963
	mov	eax, DWORD PTR _where$1593[ebp]
	push	eax
	mov	eax, DWORD PTR _oldequiv$1591[ebp]
	push	eax
	mov	eax, DWORD PTR _reloadreg$1590[ebp]
	push	eax
	call	_gen_input_reload
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _this_reload_insn$1594[ebp], eax
; Line 2966
$L1633:
	cmp	DWORD PTR _this_reload_insn$1594[ebp], 0
	je	$L1634
; Line 2967
	mov	eax, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR _reload_when_needed[eax*4]
	mov	DWORD PTR -108+[ebp], eax
	jmp	$L1635
; Line 2969
$L1639:
; Line 2970
	mov	eax, DWORD PTR _first_other_reload_insn$[ebp]
	cmp	DWORD PTR _first_operand_address_reload_insn$[ebp], eax
	jne	$L1640
; Line 2971
	mov	eax, DWORD PTR _this_reload_insn$1594[ebp]
	mov	DWORD PTR _first_other_reload_insn$[ebp], eax
; Line 2972
$L1640:
	jmp	$L1636
; Line 2973
$L1641:
; Line 2974
	mov	eax, DWORD PTR _insn$[ebp]
	cmp	DWORD PTR _first_operand_address_reload_insn$[ebp], eax
	jne	$L1642
; Line 2975
	mov	eax, DWORD PTR _this_reload_insn$1594[ebp]
	mov	DWORD PTR _first_operand_address_reload_insn$[ebp], eax
; Line 2976
$L1642:
	mov	eax, DWORD PTR _insn$[ebp]
	cmp	DWORD PTR _first_other_reload_insn$[ebp], eax
	jne	$L1643
; Line 2977
	mov	eax, DWORD PTR _this_reload_insn$1594[ebp]
	mov	DWORD PTR _first_other_reload_insn$[ebp], eax
; Line 2978
$L1643:
	jmp	$L1636
$L1635:
	cmp	DWORD PTR -108+[ebp], 2
	je	$L1641
	cmp	DWORD PTR -108+[ebp], 3
	je	$L1639
	jmp	$L1636
$L1636:
; Line 2981
$L1634:
; Line 2986
$L1589:
; Line 2990
	cmp	DWORD PTR _old$1587[ebp], 0
	je	$L1644
	mov	eax, DWORD PTR _j$[ebp]
	mov	ecx, DWORD PTR _old$1587[ebp]
	cmp	DWORD PTR _reload_reg_rtx[eax*4], ecx
	je	$L1644
	mov	eax, DWORD PTR _j$[ebp]
	cmp	DWORD PTR _reload_reg_rtx[eax*4], 0
	je	$L1644
	mov	eax, DWORD PTR _j$[ebp]
	cmp	DWORD PTR _reload_out[eax*4], 0
	jne	$L1644
	mov	eax, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR _reload_reg_rtx[eax*4]
	cmp	DWORD PTR [eax+4], 8
	jl	$L1644
	mov	eax, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR _reload_reg_rtx[eax*4]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jge	$L1644
; Line 2992
	mov	eax, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR _reload_reg_rtx[eax*4]
	mov	DWORD PTR _reloadreg$1645[ebp], eax
; Line 2995
	mov	eax, DWORD PTR _j$[ebp]
	cmp	DWORD PTR _reload_when_needed[eax*4], 3
	je	$L1646
; Line 2996
	call	_abort
; Line 3000
$L1646:
	mov	eax, DWORD PTR _reloadreg$1645[ebp]
	push	eax
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_dead_or_set_p
	add	esp, 8
	or	eax, eax
	jne	$L1647
; Line 3003
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	mov	eax, DWORD PTR _reloadreg$1645[ebp]
	push	eax
	push	1
	push	2
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 3004
$L1647:
; Line 3019
$L1644:
; Line 3025
	mov	eax, DWORD PTR _j$[ebp]
	cmp	DWORD PTR _reload_reg_rtx[eax*4], 0
	je	$L1649
	mov	eax, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR _reload_reg_rtx[eax*4]
	cmp	DWORD PTR [eax+4], 8
	jl	$L1649
	mov	eax, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR _reload_reg_rtx[eax*4]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jge	$L1649
	mov	eax, DWORD PTR _j$[ebp]
	movsx	eax, BYTE PTR _reload_inherited[eax]
	or	eax, eax
	je	$L1649
	mov	eax, DWORD PTR _j$[ebp]
	cmp	DWORD PTR _reload_spill_index[eax*4], 0
	jl	$L1649
	mov	eax, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR _reload_in[eax*4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1649
	mov	eax, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR _reload_spill_index[eax*4]
	cmp	DWORD PTR _spill_reg_store$S590[eax*4], 0
	je	$L1649
	mov	eax, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR _reload_spill_index[eax*4]
	mov	eax, DWORD PTR _spill_reg_store$S590[eax*4]
	push	eax
	mov	eax, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR _reload_reg_rtx[eax*4]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_regno_dead_p
	add	esp, 8
	or	eax, eax
	je	$L1649
; Line 3028
	mov	eax, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR _reload_spill_index[eax*4]
	mov	eax, DWORD PTR _spill_reg_store$S590[eax*4]
	push	eax
	mov	eax, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR _reload_reg_rtx[eax*4]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_remove_death
	add	esp, 8
; Line 3033
$L1649:
; Line 3040
	mov	eax, DWORD PTR _j$[ebp]
	cmp	DWORD PTR _reload_reg_rtx[eax*4], 0
	je	$L1650
	mov	eax, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR _reload_reg_rtx[eax*4]
	cmp	DWORD PTR [eax+4], 8
	jl	$L1650
	mov	eax, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR _reload_reg_rtx[eax*4]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jge	$L1650
	mov	eax, DWORD PTR _j$[ebp]
	movsx	eax, BYTE PTR _reload_inherited[eax]
	or	eax, eax
	je	$L1650
	mov	eax, DWORD PTR _j$[ebp]
	cmp	DWORD PTR _reload_spill_index[eax*4], 0
	jl	$L1650
	mov	eax, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR _reload_in[eax*4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1650
	mov	eax, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR _reload_spill_index[eax*4]
	cmp	DWORD PTR _spill_reg_store$S590[eax*4], 0
	jne	$L1650
	mov	eax, DWORD PTR _j$[ebp]
	cmp	DWORD PTR _reload_inheritance_insn[eax*4], 0
	je	$L1650
	mov	eax, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR _reload_inheritance_insn[eax*4]
	push	eax
	mov	eax, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR _reload_reg_rtx[eax*4]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_regno_dead_p
	add	esp, 8
	or	eax, eax
	je	$L1650
; Line 3043
	mov	eax, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR _reload_inheritance_insn[eax*4]
	push	eax
	mov	eax, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR _reload_reg_rtx[eax*4]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_remove_death
	add	esp, 8
; Line 3051
$L1650:
; Line 3061
	cmp	DWORD PTR _optimize, 0
	je	$L1651
	mov	eax, DWORD PTR _j$[ebp]
	movsx	eax, BYTE PTR _reload_inherited[eax]
	or	eax, eax
	je	$L1651
	mov	eax, DWORD PTR _j$[ebp]
	cmp	DWORD PTR _reload_spill_index[eax*4], 0
	jl	$L1651
	mov	eax, DWORD PTR _j$[ebp]
	cmp	DWORD PTR _reload_when_needed[eax*4], 3
	je	$L1652
	mov	eax, DWORD PTR _j$[ebp]
	cmp	DWORD PTR _reload_when_needed[eax*4], 0
	jne	$L1651
$L1652:
	mov	eax, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR _reload_in[eax*4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1651
	mov	eax, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR _reload_in[eax*4]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L1651
	mov	eax, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR _reload_spill_index[eax*4]
	cmp	DWORD PTR _spill_reg_store$S590[eax*4], 0
	je	$L1651
	mov	eax, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR _reload_in[eax*4]
	push	eax
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_dead_or_set_p
	add	esp, 8
	or	eax, eax
	je	$L1651
	mov	eax, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR _reload_in[eax*4]
	push	eax
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_count_occurrences
	add	esp, 8
	cmp	eax, 1
	jne	$L1651
; Line 3062
	mov	eax, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR _reload_spill_index[eax*4]
	push	eax
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_delete_output_reload
	add	esp, 12					; 0000000cH
; Line 3067
$L1651:
	mov	eax, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR _reload_out[eax*4]
	mov	DWORD PTR _old$1587[ebp], eax
; Line 3075
	cmp	DWORD PTR _old$1587[ebp], 0
	je	$L1653
	mov	eax, DWORD PTR _j$[ebp]
	mov	ecx, DWORD PTR _old$1587[ebp]
	cmp	DWORD PTR _reload_reg_rtx[eax*4], ecx
	je	$L1653
	mov	eax, DWORD PTR _j$[ebp]
	cmp	DWORD PTR _reload_reg_rtx[eax*4], 0
	je	$L1653
	mov	eax, DWORD PTR _old$1587[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1654
	mov	eax, DWORD PTR _old$1587[ebp]
	push	eax
	push	1
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_find_reg_note
	add	esp, 12					; 0000000cH
	or	eax, eax
	jne	$L1653
$L1654:
; Line 3077
	mov	eax, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR _reload_reg_rtx[eax*4]
	mov	DWORD PTR _reloadreg$1655[ebp], eax
; Line 3093
	mov	eax, DWORD PTR _old$1587[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	mov	DWORD PTR _mode$1656[ebp], eax
; Line 3094
	cmp	DWORD PTR _mode$1656[ebp], 0
	jne	$L1657
; Line 3095
	call	_abort
; Line 3099
$L1657:
	mov	eax, DWORD PTR _j$[ebp]
	movsx	eax, BYTE PTR _reload_strict_low[eax]
	or	eax, eax
	je	$L1658
; Line 3100
	mov	eax, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR _reload_out[eax*4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	mov	DWORD PTR _mode$1656[ebp], eax
; Line 3104
$L1658:
	mov	eax, DWORD PTR _reloadreg$1655[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	cmp	eax, DWORD PTR _mode$1656[ebp]
	je	$L1659
; Line 3105
	mov	eax, DWORD PTR _reloadreg$1655[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _mode$1656[ebp]
	push	eax
	push	34					; 00000022H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _reloadreg$1655[ebp], eax
; Line 3108
$L1659:
$L1661:
	mov	eax, DWORD PTR _old$1587[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1662
	mov	eax, DWORD PTR _old$1587[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	cmp	eax, DWORD PTR _mode$1656[ebp]
	je	$L1662
; Line 3109
	mov	eax, DWORD PTR _old$1587[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _old$1587[ebp], eax
	jmp	$L1661
$L1662:
; Line 3111
	mov	eax, DWORD PTR _old$1587[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sub	ecx, ecx
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L1663
	mov	eax, DWORD PTR _old$1587[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	cmp	eax, DWORD PTR _mode$1656[ebp]
	je	$L1663
; Line 3112
	push	0
	mov	eax, DWORD PTR _old$1587[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$1656[ebp]
	push	eax
	push	35					; 00000023H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	DWORD PTR _old$1587[ebp], eax
; Line 3114
$L1663:
; Line 3115
	mov	eax, DWORD PTR _first_output_reload_insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _reloadreg$1655[ebp]
	push	eax
	mov	eax, DWORD PTR _old$1587[ebp]
	push	eax
	call	_gen_move_insn
	add	esp, 8
	push	eax
	call	_emit_insn_before
	add	esp, 8
	mov	DWORD PTR _store_insn$1588[ebp], eax
; Line 3116
	mov	eax, DWORD PTR _store_insn$1588[ebp]
	mov	DWORD PTR _first_output_reload_insn$[ebp], eax
; Line 3121
	push	OFFSET _forget_old_reloads_1
	mov	eax, DWORD PTR _store_insn$1588[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_note_stores
	add	esp, 8
; Line 3126
	mov	eax, DWORD PTR _reloadreg$1655[ebp]
	cmp	DWORD PTR [eax+4], 8
	jl	$L1665
	mov	eax, DWORD PTR _reloadreg$1655[ebp]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jge	$L1665
; Line 3129
	mov	eax, DWORD PTR _store_insn$1588[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	mov	eax, DWORD PTR _reloadreg$1655[ebp]
	push	eax
	push	1
	push	2
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	ecx, DWORD PTR _store_insn$1588[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 3134
$L1665:
	mov	eax, DWORD PTR _old$1587[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1666
; Line 3137
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR _reg_notes$1667[ebp], eax
; Line 3139
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 28					; 0000001cH
	mov	DWORD PTR _prev_reg_note$1668[ebp], eax
; Line 3141
$L1670:
	cmp	DWORD PTR _reg_notes$1667[ebp], 0
	je	$L1671
; Line 3143
	mov	eax, DWORD PTR _reg_notes$1667[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _next_reg_notes$1672[ebp], eax
; Line 3145
	mov	eax, DWORD PTR _reg_notes$1667[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 16777216				; 01000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1673
	mov	eax, DWORD PTR _old$1587[ebp]
	push	eax
	mov	eax, DWORD PTR _reg_notes$1667[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_reg_mentioned_p
	add	esp, 8
	or	eax, eax
	je	$L1673
; Line 3147
	mov	eax, DWORD PTR _next_reg_notes$1672[ebp]
	mov	ecx, DWORD PTR _prev_reg_note$1668[ebp]
	mov	DWORD PTR [ecx], eax
; Line 3148
	mov	eax, DWORD PTR _store_insn$1588[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	ecx, DWORD PTR _reg_notes$1667[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 3149
	mov	eax, DWORD PTR _reg_notes$1667[ebp]
	mov	ecx, DWORD PTR _store_insn$1588[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 3151
	jmp	$L1674
$L1673:
; Line 3152
	mov	eax, DWORD PTR _reg_notes$1667[ebp]
	add	eax, 8
	mov	DWORD PTR _prev_reg_note$1668[ebp], eax
$L1674:
; Line 3154
	mov	eax, DWORD PTR _next_reg_notes$1672[ebp]
	mov	DWORD PTR _reg_notes$1667[ebp], eax
; Line 3155
	jmp	$L1670
$L1671:
; Line 3158
$L1666:
; Line 3159
	jmp	$L1675
$L1653:
	mov	DWORD PTR _store_insn$1588[ebp], 0
$L1675:
; Line 3161
	mov	eax, DWORD PTR _j$[ebp]
	cmp	DWORD PTR _reload_spill_index[eax*4], 0
	jl	$L1676
; Line 3162
	mov	eax, DWORD PTR _store_insn$1588[ebp]
	mov	ecx, DWORD PTR _j$[ebp]
	mov	ecx, DWORD PTR _reload_spill_index[ecx*4]
	mov	DWORD PTR _spill_reg_store$S590[ecx*4], eax
; Line 3163
$L1676:
	jmp	$L1585
$L1586:
; Line 3171
	mov	eax, DWORD PTR _first_output_reload_insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _insn1$1677[ebp], eax
	jmp	$L1678
$L1679:
	mov	eax, DWORD PTR _insn1$1677[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _insn1$1677[ebp], eax
$L1678:
	mov	eax, DWORD PTR _insn1$1677[ebp]
	cmp	DWORD PTR _insn$[ebp], eax
	je	$L1680
; Line 3172
	mov	eax, DWORD PTR _insn1$1677[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 851968				; 000d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1681
	mov	eax, DWORD PTR _insn1$1677[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1681
; Line 3174
	mov	eax, DWORD PTR _insn1$1677[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _source$1682[ebp], eax
; Line 3177
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR _reg_notes$1683[ebp], eax
; Line 3179
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 28					; 0000001cH
	mov	DWORD PTR _prev_reg_note$1684[ebp], eax
; Line 3183
$L1686:
	cmp	DWORD PTR _reg_notes$1683[ebp], 0
	je	$L1687
; Line 3185
	mov	eax, DWORD PTR _reg_notes$1683[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _next_reg_notes$1688[ebp], eax
; Line 3187
	mov	eax, DWORD PTR _reg_notes$1683[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 16777216				; 01000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1689
	mov	eax, DWORD PTR _source$1682[ebp]
	push	eax
	mov	eax, DWORD PTR _reg_notes$1683[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_reg_mentioned_p
	add	esp, 8
	or	eax, eax
	je	$L1689
; Line 3189
	mov	eax, DWORD PTR _next_reg_notes$1688[ebp]
	mov	ecx, DWORD PTR _prev_reg_note$1684[ebp]
	mov	DWORD PTR [ecx], eax
; Line 3190
	mov	eax, DWORD PTR _insn1$1677[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	ecx, DWORD PTR _reg_notes$1683[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 3191
	mov	eax, DWORD PTR _reg_notes$1683[ebp]
	mov	ecx, DWORD PTR _insn1$1677[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 3193
	jmp	$L1690
$L1689:
; Line 3194
	mov	eax, DWORD PTR _reg_notes$1683[ebp]
	add	eax, 8
	mov	DWORD PTR _prev_reg_note$1684[ebp], eax
$L1690:
; Line 3196
	mov	eax, DWORD PTR _next_reg_notes$1688[ebp]
	mov	DWORD PTR _reg_notes$1683[ebp], eax
; Line 3197
	jmp	$L1686
$L1687:
; Line 3199
$L1681:
	jmp	$L1679
$L1680:
; Line 3201
$L1578:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_emit_reload_insns ENDP
_reloadreg$ = 8
_in$ = 12
_before_insn$ = 16
_gen_input_reload PROC NEAR
; Line 3214
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 3224
	mov	eax, DWORD PTR _before_insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _in$[ebp]
	push	eax
	mov	eax, DWORD PTR _reloadreg$[ebp]
	push	eax
	call	_gen_move_insn
	add	esp, 8
	push	eax
	call	_emit_insn_before
	add	esp, 8
; Line 3226
	mov	eax, DWORD PTR _before_insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	jmp	$L1694
; Line 3227
$L1694:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_input_reload ENDP
_TEXT	ENDS
EXTRN	_delete_insn:NEAR
EXTRN	_find_regno_note:NEAR
_TEXT	SEGMENT
_insn$ = 8
_j$ = 12
_spill_index$ = 16
_i1$ = -8
_reg$ = -4
_i2$1715 = -12
_delete_output_reload PROC NEAR
; Line 3243
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 3248
	mov	eax, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR _reload_in[eax*4]
	mov	DWORD PTR _reg$[ebp], eax
; Line 3249
$L1702:
	mov	eax, DWORD PTR _reg$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1703
; Line 3250
	mov	eax, DWORD PTR _reg$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _reg$[ebp], eax
	jmp	$L1702
$L1703:
; Line 3258
	mov	eax, DWORD PTR _spill_index$[ebp]
	mov	eax, DWORD PTR _spill_reg_store$S590[eax*4]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _i1$[ebp], eax
	jmp	$L1704
$L1705:
	mov	eax, DWORD PTR _i1$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _i1$[ebp], eax
$L1704:
	mov	eax, DWORD PTR _insn$[ebp]
	cmp	DWORD PTR _i1$[ebp], eax
	je	$L1706
; Line 3260
	mov	eax, DWORD PTR _i1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1114112				; 00110000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1708
	mov	eax, DWORD PTR _i1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 917504				; 000e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1707
$L1708:
; Line 3261
	jmp	$L1698
; Line 3262
$L1707:
; Line 3263
	mov	eax, DWORD PTR _i1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 851968				; 000d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1710
	mov	eax, DWORD PTR _i1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 983040				; 000f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1709
$L1710:
	mov	eax, DWORD PTR _i1$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	mov	eax, DWORD PTR _reg$[ebp]
	push	eax
	call	_reg_mentioned_p
	add	esp, 8
	or	eax, eax
	je	$L1709
; Line 3264
	jmp	$L1698
; Line 3265
$L1709:
	jmp	$L1705
$L1706:
; Line 3269
	mov	eax, DWORD PTR _j$[ebp]
	mov	ecx, DWORD PTR _j$[ebp]
	mov	ecx, DWORD PTR _reload_in[ecx*4]
	cmp	DWORD PTR _reload_out[eax*4], ecx
	jne	$L1711
; Line 3270
	mov	eax, DWORD PTR _spill_index$[ebp]
	mov	eax, DWORD PTR _spill_reg_store$S590[eax*4]
	push	eax
	call	_delete_insn
	add	esp, 4
; Line 3275
	jmp	$L1712
$L1711:
; Line 3277
	mov	eax, DWORD PTR _reg$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg_n_deaths
	movsx	eax, WORD PTR [ecx+eax*2]
	cmp	eax, 1
	jne	$L1714
	mov	eax, DWORD PTR _reg$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg_basic_block
	movsx	eax, WORD PTR [ecx+eax*2]
	or	eax, eax
	jl	$L1714
	mov	eax, DWORD PTR _reg$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	1
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_find_regno_note
	add	esp, 12					; 0000000cH
	or	eax, eax
	je	$L1714
; Line 3286
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _i2$1715[ebp], eax
	jmp	$L1716
$L1717:
	mov	eax, DWORD PTR _i2$1715[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _i2$1715[ebp], eax
$L1716:
	cmp	DWORD PTR _i2$1715[ebp], 0
	je	$L1718
; Line 3292
	mov	eax, DWORD PTR _i2$1715[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 851968				; 000d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1719
	mov	eax, DWORD PTR _i2$1715[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1719
	mov	eax, DWORD PTR _i2$1715[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _reg$[ebp]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L1719
; Line 3293
	jmp	$L1717
; Line 3294
$L1719:
; Line 3295
	mov	eax, DWORD PTR _i2$1715[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1114112				; 00110000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1721
	mov	eax, DWORD PTR _i2$1715[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 917504				; 000e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1720
$L1721:
; Line 3296
	jmp	$L1718
; Line 3297
$L1720:
; Line 3298
	mov	eax, DWORD PTR _i2$1715[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 851968				; 000d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1723
	mov	eax, DWORD PTR _i2$1715[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 983040				; 000f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1722
$L1723:
	mov	eax, DWORD PTR _i2$1715[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	mov	eax, DWORD PTR _reg$[ebp]
	push	eax
	call	_reg_mentioned_p
	add	esp, 8
	or	eax, eax
	je	$L1722
; Line 3301
	jmp	$L1698
; Line 3302
$L1722:
	jmp	$L1717
$L1718:
; Line 3305
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _i2$1715[ebp], eax
	jmp	$L1724
$L1725:
	mov	eax, DWORD PTR _i2$1715[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _i2$1715[ebp], eax
$L1724:
	cmp	DWORD PTR _i2$1715[ebp], 0
	je	$L1726
; Line 3311
	mov	eax, DWORD PTR _i2$1715[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 851968				; 000d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1727
	mov	eax, DWORD PTR _i2$1715[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1727
	mov	eax, DWORD PTR _i2$1715[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _reg$[ebp]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L1727
; Line 3312
	mov	eax, DWORD PTR _i2$1715[ebp]
	push	eax
	call	_delete_insn
	add	esp, 4
; Line 3313
$L1727:
; Line 3314
	mov	eax, DWORD PTR _i2$1715[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1114112				; 00110000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1729
	mov	eax, DWORD PTR _i2$1715[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 917504				; 000e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1728
$L1729:
; Line 3315
	jmp	$L1726
; Line 3316
$L1728:
	jmp	$L1725
$L1726:
; Line 3320
	mov	eax, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR _reload_reg_rtx[eax*4]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg$[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	mov	edx, DWORD PTR _reg_renumber
	mov	WORD PTR [edx+ecx*2], ax
; Line 3321
	push	-1
	mov	eax, DWORD PTR _reg$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_alter_reg
	add	esp, 8
; Line 3323
$L1714:
$L1712:
$L1698:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_delete_output_reload ENDP
_TEXT	ENDS
EXTRN	_gen_add2_insn:NEAR
EXTRN	_gen_sub2_insn:NEAR
_TEXT	SEGMENT
_reloadreg$ = 8
_value$ = 12
_inc_amount$ = 16
_insn$ = 20
_incloc$ = -8
_post$ = -4
_first_new$1743 = -12
_first_new$1746 = -16
_first_new$1748 = -20
_inc_for_reload PROC NEAR
; Line 3344
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	push	ebx
	push	esi
	push	edi
; Line 3346
	mov	eax, DWORD PTR _value$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _incloc$[ebp], eax
; Line 3348
	mov	eax, DWORD PTR _value$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 4259840				; 00410000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1870
	mov	eax, DWORD PTR _value$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 4325376				; 00420000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1868
$L1870:
	mov	DWORD PTR _post$[ebp], 1
	jmp	$L1869
$L1868:
	mov	DWORD PTR _post$[ebp], 0
$L1869:
; Line 3354
	mov	eax, DWORD PTR _incloc$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1737
; Line 3355
	mov	eax, DWORD PTR _incloc$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg_last_reload_reg$S581
	mov	DWORD PTR [ecx+eax*4], 0
; Line 3357
$L1737:
	mov	eax, DWORD PTR _value$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 4128768				; 003f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1739
	mov	eax, DWORD PTR _value$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 4259840				; 00410000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1738
$L1739:
; Line 3358
	mov	eax, DWORD PTR _inc_amount$[ebp]
	neg	eax
	mov	DWORD PTR _inc_amount$[ebp], eax
; Line 3361
$L1738:
	cmp	DWORD PTR _post$[ebp], 0
	jne	$L1740
; Line 3367
	mov	eax, DWORD PTR _incloc$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1741
	mov	eax, DWORD PTR _incloc$[ebp]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L1742
	mov	eax, DWORD PTR _incloc$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	or	eax, eax
	jl	$L1741
$L1742:
; Line 3373
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _inc_amount$[ebp]
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _incloc$[ebp]
	push	eax
	call	_gen_add2_insn
	add	esp, 8
	push	eax
	call	_emit_insn_before
	add	esp, 8
	mov	DWORD PTR _first_new$1743[ebp], eax
; Line 3374
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _incloc$[ebp]
	push	eax
	mov	eax, DWORD PTR _reloadreg$[ebp]
	push	eax
	call	_gen_move_insn
	add	esp, 8
	push	eax
	call	_emit_insn_before
	add	esp, 8
; Line 3375
	mov	eax, DWORD PTR _first_new$1743[ebp]
	jmp	$L1734
; Line 3377
	jmp	$L1745
$L1741:
; Line 3383
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _incloc$[ebp]
	push	eax
	mov	eax, DWORD PTR _reloadreg$[ebp]
	push	eax
	call	_gen_move_insn
	add	esp, 8
	push	eax
	call	_emit_insn_before
	add	esp, 8
	mov	DWORD PTR _first_new$1746[ebp], eax
; Line 3387
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _inc_amount$[ebp]
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _reloadreg$[ebp]
	push	eax
	call	_gen_add2_insn
	add	esp, 8
	push	eax
	call	_emit_insn_before
	add	esp, 8
; Line 3388
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _reloadreg$[ebp]
	push	eax
	mov	eax, DWORD PTR _incloc$[ebp]
	push	eax
	call	_gen_move_insn
	add	esp, 8
	push	eax
	call	_emit_insn_before
	add	esp, 8
; Line 3389
	mov	eax, DWORD PTR _first_new$1746[ebp]
	jmp	$L1734
; Line 3390
$L1745:
; Line 3396
	jmp	$L1747
$L1740:
; Line 3400
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _incloc$[ebp]
	push	eax
	mov	eax, DWORD PTR _reloadreg$[ebp]
	push	eax
	call	_gen_move_insn
	add	esp, 8
	push	eax
	call	_emit_insn_before
	add	esp, 8
	mov	DWORD PTR _first_new$1748[ebp], eax
; Line 3406
	mov	eax, DWORD PTR _incloc$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1749
	mov	eax, DWORD PTR _incloc$[ebp]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L1750
	mov	eax, DWORD PTR _incloc$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	or	eax, eax
	jl	$L1749
$L1750:
; Line 3411
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _inc_amount$[ebp]
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _incloc$[ebp]
	push	eax
	call	_gen_add2_insn
	add	esp, 8
	push	eax
	call	_emit_insn_before
	add	esp, 8
; Line 3413
	jmp	$L1751
$L1749:
; Line 3423
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _inc_amount$[ebp]
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _reloadreg$[ebp]
	push	eax
	call	_gen_add2_insn
	add	esp, 8
	push	eax
	call	_emit_insn_before
	add	esp, 8
; Line 3424
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _reloadreg$[ebp]
	push	eax
	mov	eax, DWORD PTR _incloc$[ebp]
	push	eax
	call	_gen_move_insn
	add	esp, 8
	push	eax
	call	_emit_insn_before
	add	esp, 8
; Line 3428
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _inc_amount$[ebp]
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _reloadreg$[ebp]
	push	eax
	call	_gen_sub2_insn
	add	esp, 8
	push	eax
	call	_emit_insn_before
	add	esp, 8
; Line 3429
$L1751:
; Line 3430
	mov	eax, DWORD PTR _first_new$1748[ebp]
	jmp	$L1734
; Line 3431
$L1747:
; Line 3432
$L1734:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_inc_for_reload ENDP
_TEXT	ENDS
EXTRN	_true_regnum:NEAR
_TEXT	SEGMENT
_string$ = 8
_reg$ = 12
_value$ = -8
_regno$ = -4
_constraint_accepts_reg_p PROC NEAR
; Line 3441
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 3442
	mov	DWORD PTR _value$[ebp], 0
; Line 3443
	mov	eax, DWORD PTR _reg$[ebp]
	push	eax
	call	_true_regnum
	add	esp, 4
	mov	DWORD PTR _regno$[ebp], eax
; Line 3447
	movsx	eax, WORD PTR _reg_class_contents+20
	mov	edx, 1
	mov	cl, BYTE PTR _regno$[ebp]
	shl	edx, cl
	test	eax, edx
	jne	$L1759
; Line 3448
	sub	eax, eax
	jmp	$L1755
; Line 3451
$L1759:
	mov	DWORD PTR _value$[ebp], 0
; Line 3453
$L1761:
; Line 3454
	mov	eax, DWORD PTR _string$[ebp]
	mov	DWORD PTR -12+[ebp], eax
	inc	DWORD PTR _string$[ebp]
	mov	eax, DWORD PTR -12+[ebp]
	movsx	eax, BYTE PTR [eax]
	mov	DWORD PTR -16+[ebp], eax
	jmp	$L1763
; Line 3456
$L1767:
; Line 3458
	mov	eax, DWORD PTR _value$[ebp]
	jmp	$L1755
; Line 3459
$L1768:
; Line 3461
	cmp	DWORD PTR _value$[ebp], 0
	jne	$L1769
; Line 3462
	sub	eax, eax
	jmp	$L1755
; Line 3464
$L1769:
	mov	DWORD PTR _value$[ebp], 0
; Line 3465
	jmp	$L1764
; Line 3466
$L1770:
; Line 3468
	mov	DWORD PTR _value$[ebp], 1
; Line 3469
	jmp	$L1764
$L1763:
	cmp	DWORD PTR -16+[ebp], 0
	je	$L1767
	cmp	DWORD PTR -16+[ebp], 44			; 0000002cH
	je	$L1768
	cmp	DWORD PTR -16+[ebp], 103		; 00000067H
	je	$L1770
	cmp	DWORD PTR -16+[ebp], 114		; 00000072H
	je	$L1770
	jmp	$L1764
$L1764:
	jmp	$L1761
$L1762:
; Line 3470
$L1755:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_constraint_accepts_reg_p ENDP
_x$ = 8
_find$ = 12
_i$ = -20
_j$ = -8
_code$ = -4
_format_ptr$ = -16
_count$ = -12
_count_occurrences PROC NEAR
; Line 3477
	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H
	push	ebx
	push	esi
	push	edi
; Line 3483
	mov	eax, DWORD PTR _x$[ebp]
	cmp	DWORD PTR _find$[ebp], eax
	jne	$L1779
; Line 3484
	mov	eax, 1
	jmp	$L1773
; Line 3485
$L1779:
	cmp	DWORD PTR _x$[ebp], 0
	jne	$L1780
; Line 3486
	sub	eax, eax
	jmp	$L1773
; Line 3488
$L1780:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$[ebp], eax
; Line 3490
	mov	eax, DWORD PTR _code$[ebp]
	mov	DWORD PTR -28+[ebp], eax
	jmp	$L1781
; Line 3492
$L1785:
; Line 3500
	sub	eax, eax
	jmp	$L1773
; Line 3501
	jmp	$L1782
$L1781:
	sub	DWORD PTR -28+[ebp], 17			; 00000011H
	cmp	DWORD PTR -28+[ebp], 24			; 00000018H
	ja	$L1782
	shl	DWORD PTR -28+[ebp], 2
	mov	eax, DWORD PTR -28+[ebp]
	jmp	DWORD PTR $L1871[eax]
$L1871:
	DD	OFFSET $L1785
	DD	OFFSET $L1782
	DD	OFFSET $L1782
	DD	OFFSET $L1782
	DD	OFFSET $L1782
	DD	OFFSET $L1782
	DD	OFFSET $L1782
	DD	OFFSET $L1782
	DD	OFFSET $L1782
	DD	OFFSET $L1782
	DD	OFFSET $L1782
	DD	OFFSET $L1782
	DD	OFFSET $L1782
	DD	OFFSET $L1785
	DD	OFFSET $L1785
	DD	OFFSET $L1782
	DD	OFFSET $L1785
	DD	OFFSET $L1785
	DD	OFFSET $L1782
	DD	OFFSET $L1782
	DD	OFFSET $L1782
	DD	OFFSET $L1782
	DD	OFFSET $L1785
	DD	OFFSET $L1785
	DD	OFFSET $L1785
$L1782:
; Line 3503
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_format[eax*4]
	mov	DWORD PTR _format_ptr$[ebp], eax
; Line 3504
	mov	DWORD PTR _count$[ebp], 0
; Line 3506
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L1786
$L1787:
	inc	DWORD PTR _i$[ebp]
$L1786:
	mov	eax, DWORD PTR _code$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _rtx_length[eax*4], ecx
	jle	$L1788
; Line 3508
	mov	eax, DWORD PTR _format_ptr$[ebp]
	mov	DWORD PTR -24+[ebp], eax
	inc	DWORD PTR _format_ptr$[ebp]
	mov	eax, DWORD PTR -24+[ebp]
	movsx	eax, BYTE PTR [eax]
	mov	DWORD PTR -32+[ebp], eax
	jmp	$L1789
; Line 3510
$L1793:
; Line 3511
	mov	eax, DWORD PTR _find$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	push	eax
	call	_count_occurrences
	add	esp, 8
	add	DWORD PTR _count$[ebp], eax
; Line 3512
	jmp	$L1790
; Line 3514
$L1794:
; Line 3515
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	cmp	DWORD PTR [ecx+eax*4+4], 0
	je	$L1795
; Line 3517
	mov	DWORD PTR _j$[ebp], 0
	jmp	$L1796
$L1797:
	inc	DWORD PTR _j$[ebp]
$L1796:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$[ebp]
	cmp	DWORD PTR [eax], ecx
	jbe	$L1798
; Line 3518
	mov	eax, DWORD PTR _find$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	push	eax
	call	_count_occurrences
	add	esp, 8
	add	DWORD PTR _count$[ebp], eax
	jmp	$L1797
$L1798:
; Line 3520
$L1795:
	jmp	$L1790
; Line 3521
	jmp	$L1790
$L1789:
	cmp	DWORD PTR -32+[ebp], 69			; 00000045H
	je	$L1794
	cmp	DWORD PTR -32+[ebp], 101		; 00000065H
	je	$L1793
	jmp	$L1790
$L1790:
; Line 3522
	jmp	$L1787
$L1788:
; Line 3523
	mov	eax, DWORD PTR _count$[ebp]
	jmp	$L1773
; Line 3524
$L1773:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_count_occurrences ENDP
_TEXT	ENDS
END
