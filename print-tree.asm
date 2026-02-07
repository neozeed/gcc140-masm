	TITLE	print-tree.c
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
PUBLIC	_tree_code_name
_DATA	SEGMENT
$SG563	DB	'error_mark', 00H
	ORG $+1
$SG564	DB	'identifier_node', 00H
$SG565	DB	'op_identifier', 00H
	ORG $+2
$SG566	DB	'tree_list', 00H
	ORG $+2
$SG567	DB	'void_type', 00H
	ORG $+2
$SG568	DB	'integer_type', 00H
	ORG $+3
$SG569	DB	'real_type', 00H
	ORG $+2
$SG570	DB	'complex_type', 00H
	ORG $+3
$SG571	DB	'enumeral_type', 00H
	ORG $+2
$SG572	DB	'boolean_type', 00H
	ORG $+3
$SG573	DB	'char_type', 00H
	ORG $+2
$SG574	DB	'pointer_type', 00H
	ORG $+3
$SG575	DB	'offset_type', 00H
$SG576	DB	'reference_type', 00H
	ORG $+1
$SG577	DB	'method_type', 00H
$SG578	DB	'file_type', 00H
	ORG $+2
$SG579	DB	'array_type', 00H
	ORG $+1
$SG580	DB	'set_type', 00H
	ORG $+3
$SG581	DB	'string_type', 00H
$SG582	DB	'record_type', 00H
$SG583	DB	'union_type', 00H
	ORG $+1
$SG584	DB	'function_type', 00H
	ORG $+2
$SG585	DB	'lang_type', 00H
	ORG $+2
$SG586	DB	'label_stmt', 00H
	ORG $+1
$SG587	DB	'goto_stmt', 00H
	ORG $+2
$SG588	DB	'return_stmt', 00H
$SG589	DB	'expr_stmt', 00H
	ORG $+2
$SG590	DB	'with_stmt', 00H
	ORG $+2
$SG591	DB	'let_stmt', 00H
	ORG $+3
$SG592	DB	'if_stmt', 00H
$SG593	DB	'exit_stmt', 00H
	ORG $+2
$SG594	DB	'case_stmt', 00H
	ORG $+2
$SG595	DB	'loop_stmt', 00H
	ORG $+2
$SG596	DB	'compound_stmt', 00H
	ORG $+2
$SG597	DB	'asm_stmt', 00H
	ORG $+3
$SG598	DB	'integer_cst', 00H
$SG599	DB	'real_cst', 00H
	ORG $+3
$SG600	DB	'complex_cst', 00H
$SG601	DB	'string_cst', 00H
	ORG $+1
$SG602	DB	'function_decl', 00H
	ORG $+2
$SG603	DB	'label_decl', 00H
	ORG $+1
$SG604	DB	'const_decl', 00H
	ORG $+1
$SG605	DB	'type_decl', 00H
	ORG $+2
$SG606	DB	'var_decl', 00H
	ORG $+3
$SG607	DB	'parm_decl', 00H
	ORG $+2
$SG608	DB	'result_decl', 00H
$SG609	DB	'field_decl', 00H
	ORG $+1
$SG610	DB	'component_ref', 00H
	ORG $+2
$SG611	DB	'indirect_ref', 00H
	ORG $+3
$SG612	DB	'offset_ref', 00H
	ORG $+1
$SG613	DB	'buffer_ref', 00H
	ORG $+1
$SG614	DB	'array_ref', 00H
	ORG $+2
$SG615	DB	'constructor', 00H
$SG616	DB	'compound_expr', 00H
	ORG $+2
$SG617	DB	'modify_expr', 00H
$SG618	DB	'init_expr', 00H
	ORG $+2
$SG619	DB	'new_expr', 00H
	ORG $+3
$SG620	DB	'delete_expr', 00H
$SG621	DB	'push_expr', 00H
	ORG $+2
$SG622	DB	'pop_expr', 00H
	ORG $+3
$SG623	DB	'cond_expr', 00H
	ORG $+2
$SG624	DB	'call_expr', 00H
	ORG $+2
$SG625	DB	'method_call_expr', 00H
	ORG $+3
$SG626	DB	'with_cleanup_expr', 00H
	ORG $+2
$SG627	DB	'plus_expr', 00H
	ORG $+2
$SG628	DB	'minus_expr', 00H
	ORG $+1
$SG629	DB	'mult_expr', 00H
	ORG $+2
$SG630	DB	'trunc_div_expr', 00H
	ORG $+1
$SG631	DB	'ceil_div_expr', 00H
	ORG $+2
$SG632	DB	'floor_div_expr', 00H
	ORG $+1
$SG633	DB	'round_div_expr', 00H
	ORG $+1
$SG634	DB	'trunc_mod_expr', 00H
	ORG $+1
$SG635	DB	'ceil_mod_expr', 00H
	ORG $+2
$SG636	DB	'floor_mod_expr', 00H
	ORG $+1
$SG637	DB	'round_mod_expr', 00H
	ORG $+1
$SG638	DB	'rdiv_expr', 00H
	ORG $+2
$SG639	DB	'exact_div_expr', 00H
	ORG $+1
$SG640	DB	'fix_trunc_expr', 00H
	ORG $+1
$SG641	DB	'fix_ceil_expr', 00H
	ORG $+2
$SG642	DB	'fix_floor_expr', 00H
	ORG $+1
$SG643	DB	'fix_round_expr', 00H
	ORG $+1
$SG644	DB	'float_expr', 00H
	ORG $+1
$SG645	DB	'expon_expr', 00H
	ORG $+1
$SG646	DB	'negate_expr', 00H
$SG647	DB	'min_expr', 00H
	ORG $+3
$SG648	DB	'max_expr', 00H
	ORG $+3
$SG649	DB	'abs_expr', 00H
	ORG $+3
$SG650	DB	'ffs_expr', 00H
	ORG $+3
$SG651	DB	'alshift_expr', 00H
	ORG $+3
$SG652	DB	'arshift_expr', 00H
	ORG $+3
$SG653	DB	'lrotate_expr', 00H
	ORG $+3
$SG654	DB	'rrotate_expr', 00H
	ORG $+3
$SG655	DB	'bit_ior_expr', 00H
	ORG $+3
$SG656	DB	'bit_xor_expr', 00H
	ORG $+3
$SG657	DB	'bit_and_expr', 00H
	ORG $+3
$SG658	DB	'bit_andtc_expr', 00H
	ORG $+1
$SG659	DB	'bit_not_expr', 00H
	ORG $+3
$SG660	DB	'truth_andif_expr', 00H
	ORG $+3
$SG661	DB	'truth_orif_expr', 00H
$SG662	DB	'truth_and_expr', 00H
	ORG $+1
$SG663	DB	'truth_or_expr', 00H
	ORG $+2
$SG664	DB	'truth_not_expr', 00H
	ORG $+1
$SG665	DB	'lt_expr', 00H
$SG666	DB	'le_expr', 00H
$SG667	DB	'gt_expr', 00H
$SG668	DB	'ge_expr', 00H
$SG669	DB	'eq_expr', 00H
$SG670	DB	'ne_expr', 00H
$SG671	DB	'in_expr', 00H
$SG672	DB	'set_le_expr', 00H
$SG673	DB	'card_expr', 00H
	ORG $+2
$SG674	DB	'range_expr', 00H
	ORG $+1
$SG675	DB	'convert_expr', 00H
	ORG $+3
$SG676	DB	'nop_expr', 00H
	ORG $+3
$SG677	DB	'save_expr', 00H
	ORG $+2
$SG678	DB	'rtl_expr', 00H
	ORG $+3
$SG679	DB	'addr_expr', 00H
	ORG $+2
$SG680	DB	'reference_expr', 00H
	ORG $+1
$SG681	DB	'wrapper_expr', 00H
	ORG $+3
$SG682	DB	'anti_wrapper_expr', 00H
	ORG $+2
$SG683	DB	'entry_value_expr', 00H
	ORG $+3
$SG684	DB	'complex_expr', 00H
	ORG $+3
$SG685	DB	'conj_expr', 00H
	ORG $+2
$SG686	DB	'realpart_expr', 00H
	ORG $+2
$SG687	DB	'imagpart_expr', 00H
	ORG $+2
$SG688	DB	'predecrement_expr', 00H
	ORG $+2
$SG689	DB	'preincrement_expr', 00H
	ORG $+2
$SG690	DB	'postdecrement_expr', 00H
	ORG $+1
$SG691	DB	'postincrement_expr', 00H
	ORG $+5
_tree_code_name DD $SG563
	DD	$SG564
	DD	$SG565
	DD	$SG566
	DD	$SG567
	DD	$SG568
	DD	$SG569
	DD	$SG570
	DD	$SG571
	DD	$SG572
	DD	$SG573
	DD	$SG574
	DD	$SG575
	DD	$SG576
	DD	$SG577
	DD	$SG578
	DD	$SG579
	DD	$SG580
	DD	$SG581
	DD	$SG582
	DD	$SG583
	DD	$SG584
	DD	$SG585
	DD	$SG586
	DD	$SG587
	DD	$SG588
	DD	$SG589
	DD	$SG590
	DD	$SG591
	DD	$SG592
	DD	$SG593
	DD	$SG594
	DD	$SG595
	DD	$SG596
	DD	$SG597
	DD	$SG598
	DD	$SG599
	DD	$SG600
	DD	$SG601
	DD	$SG602
	DD	$SG603
	DD	$SG604
	DD	$SG605
	DD	$SG606
	DD	$SG607
	DD	$SG608
	DD	$SG609
	DD	$SG610
	DD	$SG611
	DD	$SG612
	DD	$SG613
	DD	$SG614
	DD	$SG615
	DD	$SG616
	DD	$SG617
	DD	$SG618
	DD	$SG619
	DD	$SG620
	DD	$SG621
	DD	$SG622
	DD	$SG623
	DD	$SG624
	DD	$SG625
	DD	$SG626
	DD	$SG627
	DD	$SG628
	DD	$SG629
	DD	$SG630
	DD	$SG631
	DD	$SG632
	DD	$SG633
	DD	$SG634
	DD	$SG635
	DD	$SG636
	DD	$SG637
	DD	$SG638
	DD	$SG639
	DD	$SG640
	DD	$SG641
	DD	$SG642
	DD	$SG643
	DD	$SG644
	DD	$SG645
	DD	$SG646
	DD	$SG647
	DD	$SG648
	DD	$SG649
	DD	$SG650
	DD	$SG651
	DD	$SG652
	DD	$SG653
	DD	$SG654
	DD	$SG655
	DD	$SG656
	DD	$SG657
	DD	$SG658
	DD	$SG659
	DD	$SG660
	DD	$SG661
	DD	$SG662
	DD	$SG663
	DD	$SG664
	DD	$SG665
	DD	$SG666
	DD	$SG667
	DD	$SG668
	DD	$SG669
	DD	$SG670
	DD	$SG671
	DD	$SG672
	DD	$SG673
	DD	$SG674
	DD	$SG675
	DD	$SG676
	DD	$SG677
	DD	$SG678
	DD	$SG679
	DD	$SG680
	DD	$SG681
	DD	$SG682
	DD	$SG683
	DD	$SG684
	DD	$SG685
	DD	$SG686
	DD	$SG687
	DD	$SG688
	DD	$SG689
	DD	$SG690
	DD	$SG691
_DATA	ENDS
PUBLIC	_print_node
PUBLIC	_debug_tree
EXTRN	_memset:NEAR
EXTRN	_obfree:NEAR
EXTRN	__iob:BYTE
EXTRN	_oballoc:NEAR
EXTRN	_fprintf:NEAR
_BSS	SEGMENT
_table$S699 DD	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG705	DB	00H
	ORG $+3
$SG707	DB	0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
; File print-tree.c
_node$ = 8
_object$ = -4
_debug_tree PROC NEAR
; Line 69
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 70
	push	0
	call	_oballoc
	add	esp, 4
	mov	DWORD PTR _object$[ebp], eax
; Line 71
	push	148					; 00000094H
	call	_oballoc
	add	esp, 4
	mov	DWORD PTR _table$S699, eax
; Line 72
	push	148					; 00000094H
	push	0
	mov	eax, DWORD PTR _table$S699
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 73
	push	0
	mov	eax, DWORD PTR _node$[ebp]
	push	eax
	push	OFFSET $SG705
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_print_node
	add	esp, 16					; 00000010H
; Line 74
	mov	DWORD PTR _table$S699, 0
; Line 75
	mov	eax, DWORD PTR _object$[ebp]
	push	eax
	call	_obfree
	add	esp, 4
; Line 76
	push	OFFSET $SG707
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 8
; Line 77
$L702:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_debug_tree ENDP
_TEXT	ENDS
PUBLIC	_print_node_brief
EXTRN	__fltused:NEAR
EXTRN	_tree_code_type:BYTE
_DATA	SEGMENT
	ORG $+2
$SG717	DB	' ', 00H
	ORG $+2
$SG718	DB	'%s <%s %x', 00H
	ORG $+2
$SG721	DB	' %s', 00H
$SG726	DB	' %s', 00H
$SG729	DB	' %s', 00H
$SG731	DB	' %s', 00H
$SG734	DB	' %1u', 00H
	ORG $+3
$SG737	DB	' -%1u', 00H
	ORG $+2
$SG739	DB	' 0x%x%08x', 00H
	ORG $+2
$SG741	DB	' %e', 00H
$SG742	DB	'>', 00H
_DATA	ENDS
_TEXT	SEGMENT
_file$ = 8
_prefix$ = 12
_node$ = 16
_indent$ = 20
_class$ = -4
_print_node_brief PROC NEAR
; Line 87
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 90
	cmp	DWORD PTR _node$[ebp], 0
	jne	$L715
; Line 91
	jmp	$L713
; Line 93
$L715:
	mov	eax, DWORD PTR _node$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	eax, DWORD PTR _tree_code_type[eax*4]
	mov	al, BYTE PTR [eax]
	mov	BYTE PTR _class$[ebp], al
; Line 97
	cmp	DWORD PTR _indent$[ebp], 0
	jle	$L716
; Line 98
	push	OFFSET $SG717
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 8
; Line 99
$L716:
; Line 100
	mov	eax, DWORD PTR _node$[ebp]
	push	eax
	mov	eax, DWORD PTR _node$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	eax, DWORD PTR _tree_code_name[eax*4]
	push	eax
	mov	eax, DWORD PTR _prefix$[ebp]
	push	eax
	push	OFFSET $SG718
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 20					; 00000014H
; Line 102
	movsx	eax, BYTE PTR _class$[ebp]
	cmp	eax, 100				; 00000064H
	jne	$L719
; Line 104
	mov	eax, DWORD PTR _node$[ebp]
	cmp	DWORD PTR [eax+40], 0
	je	$L720
; Line 105
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+40]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	OFFSET $SG721
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 106
$L720:
; Line 107
	jmp	$L722
$L719:
	movsx	eax, BYTE PTR _class$[ebp]
	cmp	eax, 116				; 00000074H
	jne	$L723
; Line 109
	mov	eax, DWORD PTR _node$[ebp]
	cmp	DWORD PTR [eax+56], 0
	je	$L724
; Line 111
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+56]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 1
	jne	$L725
; Line 112
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+56]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	OFFSET $SG726
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 113
	jmp	$L727
$L725:
; Line 114
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+56]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 42					; 0000002aH
	jne	$L728
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+56]
	cmp	DWORD PTR [eax+40], 0
	je	$L728
; Line 116
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+56]
	mov	eax, DWORD PTR [eax+40]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	OFFSET $SG729
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 117
$L728:
$L727:
; Line 118
$L724:
; Line 119
$L723:
$L722:
	mov	eax, DWORD PTR _node$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 1
	jne	$L730
; Line 120
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	OFFSET $SG731
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 122
$L730:
	mov	eax, DWORD PTR _node$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L732
; Line 124
	mov	eax, DWORD PTR _node$[ebp]
	cmp	DWORD PTR [eax+24], 0
	jne	$L733
; Line 125
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	push	OFFSET $SG734
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 126
	jmp	$L735
$L733:
; Line 127
	mov	eax, DWORD PTR _node$[ebp]
	cmp	DWORD PTR [eax+24], -1
	jne	$L736
	mov	eax, DWORD PTR _node$[ebp]
	cmp	DWORD PTR [eax+20], 0
	je	$L736
; Line 128
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+20]
	neg	eax
	push	eax
	push	OFFSET $SG737
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 129
	jmp	$L738
$L736:
; Line 132
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	OFFSET $SG739
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
$L738:
$L735:
; Line 134
$L732:
	mov	eax, DWORD PTR _node$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 36					; 00000024H
	jne	$L740
; Line 137
	mov	eax, DWORD PTR _node$[ebp]
	mov	ecx, DWORD PTR [eax+28]
	push	ecx
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	OFFSET $SG741
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
; Line 150
$L740:
	push	OFFSET $SG742
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 8
; Line 151
$L713:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_print_node_brief ENDP
_TEXT	ENDS
PUBLIC	_indent_to
_DATA	SEGMENT
	ORG $+2
$SG749	DB	0aH, 00H
	ORG $+2
$SG753	DB	' ', 00H
_DATA	ENDS
_TEXT	SEGMENT
_file$ = 8
_column$ = 12
_i$ = -4
_indent_to PROC NEAR
; Line 157
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 161
	cmp	DWORD PTR _column$[ebp], 0
	jle	$L748
; Line 162
	push	OFFSET $SG749
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 8
; Line 163
$L748:
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L750
$L751:
	inc	DWORD PTR _i$[ebp]
$L750:
	mov	eax, DWORD PTR _column$[ebp]
	cmp	DWORD PTR _i$[ebp], eax
	jge	$L752
; Line 164
	push	OFFSET $SG753
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 8
	jmp	$L751
$L752:
; Line 165
$L746:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_indent_to ENDP
_TEXT	ENDS
EXTRN	_print_rtl:NEAR
EXTRN	_mode_name:BYTE
EXTRN	_sprintf:NEAR
EXTRN	_print_lang_identifier:NEAR
EXTRN	_tree_code_length:BYTE
_DATA	SEGMENT
	ORG $+2
$SG774	DB	'%s <%s %x', 00H
	ORG $+2
$SG777	DB	' %s', 00H
$SG782	DB	' %s', 00H
$SG785	DB	' %s', 00H
$SG787	DB	' %s', 00H
$SG790	DB	'type', 00H
	ORG $+3
$SG792	DB	'type', 00H
	ORG $+3
$SG795	DB	' external', 00H
	ORG $+2
$SG797	DB	' public', 00H
$SG799	DB	' static', 00H
$SG801	DB	' volatile', 00H
	ORG $+2
$SG803	DB	' packed', 00H
$SG805	DB	' readonly', 00H
	ORG $+2
$SG807	DB	' literal', 00H
	ORG $+3
$SG809	DB	' nonlocal', 00H
	ORG $+2
$SG811	DB	' permanent', 00H
	ORG $+1
$SG813	DB	' addressable', 00H
	ORG $+3
$SG815	DB	' regdecl', 00H
	ORG $+3
$SG817	DB	' this_vol', 00H
	ORG $+2
$SG819	DB	' unsigned', 00H
	ORG $+2
$SG821	DB	' asm_written', 00H
	ORG $+3
$SG823	DB	' inline', 00H
$SG825	DB	' used', 00H
	ORG $+2
$SG827	DB	' lang_flag_1', 00H
	ORG $+3
$SG829	DB	' lang_flag_2', 00H
	ORG $+3
$SG831	DB	' lang_flag_3', 00H
	ORG $+3
$SG833	DB	' lang_flag_4', 00H
	ORG $+3
$SG839	DB	' %s', 00H
$SG840	DB	' file %s line %d', 00H
	ORG $+3
$SG841	DB	'size', 00H
	ORG $+3
$SG842	DB	' align %d', 00H
	ORG $+2
$SG843	DB	' size_unit %d', 00H
	ORG $+2
$SG844	DB	' offset %d', 00H
	ORG $+1
$SG845	DB	'context', 00H
$SG846	DB	'voffset', 00H
$SG847	DB	'arguments', 00H
	ORG $+2
$SG848	DB	'result', 00H
	ORG $+1
$SG849	DB	'initial', 00H
$SG851	DB	'chain', 00H
	ORG $+2
$SG853	DB	'chain', 00H
	ORG $+2
$SG855	DB	' %s', 00H
$SG856	DB	'size', 00H
	ORG $+3
$SG857	DB	' align %d', 00H
	ORG $+2
$SG858	DB	' size_unit %d', 00H
	ORG $+2
$SG859	DB	' sep_unit %d', 00H
	ORG $+3
$SG860	DB	' symtab %d', 00H
	ORG $+1
$SG861	DB	'sep', 00H
$SG864	DB	'domain', 00H
	ORG $+1
$SG867	DB	' precision %d', 00H
	ORG $+2
$SG868	DB	'min', 00H
$SG869	DB	'max', 00H
$SG872	DB	' precision %d', 00H
	ORG $+2
$SG873	DB	'min', 00H
$SG874	DB	'max', 00H
$SG875	DB	'values', 00H
	ORG $+1
$SG878	DB	' precision %d', 00H
	ORG $+2
$SG882	DB	'fields', 00H
	ORG $+1
$SG886	DB	'arg-types', 00H
	ORG $+2
$SG889	DB	'pointer_to_this', 00H
$SG890	DB	'reference_to_this', 00H
	ORG $+2
$SG891	DB	'chain', 00H
	ORG $+2
$SG909	DB	'(nil)', 00H
	ORG $+2
$SG910	DB	0aH, 00H
	ORG $+2
$SG913	DB	'arg %d', 00H
	ORG $+1
$SG915	DB	' file %s line %d', 00H
	ORG $+3
$SG921	DB	'cond', 00H
	ORG $+3
$SG922	DB	'then', 00H
	ORG $+3
$SG923	DB	'else', 00H
	ORG $+3
$SG925	DB	'vars', 00H
	ORG $+3
$SG926	DB	'tags', 00H
	ORG $+3
$SG927	DB	'supercontext', 00H
	ORG $+3
$SG928	DB	'body', 00H
	ORG $+3
$SG929	DB	'subblocks', 00H
	ORG $+2
$SG931	DB	'index', 00H
	ORG $+2
$SG932	DB	'list', 00H
	ORG $+3
$SG934	DB	'body', 00H
	ORG $+3
$SG935	DB	'chain', 00H
	ORG $+2
$SG943	DB	' %1u', 00H
	ORG $+3
$SG946	DB	' -%1u', 00H
	ORG $+2
$SG948	DB	' 0x%x%08x', 00H
	ORG $+2
$SG950	DB	' %e', 00H
$SG952	DB	'real', 00H
	ORG $+3
$SG953	DB	'imag', 00H
	ORG $+3
$SG955	DB	' "%s"', 00H
	ORG $+2
$SG959	DB	'purpose', 00H
$SG960	DB	'value', 00H
	ORG $+2
$SG961	DB	'chain', 00H
	ORG $+2
$SG963	DB	'op1', 00H
$SG964	DB	'op2', 00H
$SG965	DB	'chain', 00H
_DATA	ENDS
_TEXT	SEGMENT
_temp$912 = -40
_file$ = 8
_prefix$ = 12
_node$ = 16
_indent$ = 20
_hash$ = -28
_b$ = -20
_mode$ = -12
_class$ = -8
_len$ = -4
_first_rtl$ = -16
_i$ = -24
_print_node PROC NEAR
; Line 176
	push	ebp
	mov	ebp, esp
	sub	esp, 56					; 00000038H
	push	ebx
	push	esi
	push	edi
; Line 185
	cmp	DWORD PTR _node$[ebp], 0
	jne	$L766
; Line 186
	jmp	$L758
; Line 188
$L766:
	mov	eax, DWORD PTR _node$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	eax, DWORD PTR _tree_code_type[eax*4]
	mov	al, BYTE PTR [eax]
	mov	BYTE PTR _class$[ebp], al
; Line 194
	cmp	DWORD PTR _indent$[ebp], 24		; 00000018H
	jle	$L767
; Line 196
	mov	eax, DWORD PTR _indent$[ebp]
	push	eax
	mov	eax, DWORD PTR _node$[ebp]
	push	eax
	mov	eax, DWORD PTR _prefix$[ebp]
	push	eax
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_print_node_brief
	add	esp, 16					; 00000010H
; Line 197
	jmp	$L758
; Line 200
$L767:
	cmp	DWORD PTR _indent$[ebp], 8
	jle	$L768
	movsx	eax, BYTE PTR _class$[ebp]
	cmp	eax, 116				; 00000074H
	je	$L769
	movsx	eax, BYTE PTR _class$[ebp]
	cmp	eax, 100				; 00000064H
	jne	$L768
$L769:
; Line 202
	mov	eax, DWORD PTR _indent$[ebp]
	push	eax
	mov	eax, DWORD PTR _node$[ebp]
	push	eax
	mov	eax, DWORD PTR _prefix$[ebp]
	push	eax
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_print_node_brief
	add	esp, 16					; 00000010H
; Line 203
	jmp	$L758
; Line 206
$L768:
	mov	eax, DWORD PTR _node$[ebp]
	and	eax, 2147483647				; 7fffffffH
	mov	ecx, 37					; 00000025H
	cdq
	idiv	ecx
	mov	DWORD PTR _hash$[ebp], edx
; Line 209
	mov	eax, DWORD PTR _hash$[ebp]
	mov	ecx, DWORD PTR _table$S699
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _b$[ebp], eax
	jmp	$L770
$L771:
	mov	eax, DWORD PTR _b$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _b$[ebp], eax
$L770:
	cmp	DWORD PTR _b$[ebp], 0
	je	$L772
; Line 210
	mov	eax, DWORD PTR _b$[ebp]
	mov	ecx, DWORD PTR _node$[ebp]
	cmp	DWORD PTR [eax], ecx
	jne	$L773
; Line 212
	mov	eax, DWORD PTR _indent$[ebp]
	push	eax
	mov	eax, DWORD PTR _node$[ebp]
	push	eax
	mov	eax, DWORD PTR _prefix$[ebp]
	push	eax
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_print_node_brief
	add	esp, 16					; 00000010H
; Line 213
	jmp	$L758
; Line 217
$L773:
	jmp	$L771
$L772:
	push	8
	call	_oballoc
	add	esp, 4
	mov	DWORD PTR _b$[ebp], eax
; Line 218
	mov	eax, DWORD PTR _node$[ebp]
	mov	ecx, DWORD PTR _b$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 219
	mov	eax, DWORD PTR _hash$[ebp]
	mov	ecx, DWORD PTR _table$S699
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _b$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 220
	mov	eax, DWORD PTR _b$[ebp]
	mov	ecx, DWORD PTR _hash$[ebp]
	mov	edx, DWORD PTR _table$S699
	mov	DWORD PTR [edx+ecx*4], eax
; Line 223
	mov	eax, DWORD PTR _indent$[ebp]
	push	eax
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_indent_to
	add	esp, 8
; Line 227
	mov	eax, DWORD PTR _node$[ebp]
	push	eax
	mov	eax, DWORD PTR _node$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	eax, DWORD PTR _tree_code_name[eax*4]
	push	eax
	mov	eax, DWORD PTR _prefix$[ebp]
	push	eax
	push	OFFSET $SG774
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 20					; 00000014H
; Line 230
	movsx	eax, BYTE PTR _class$[ebp]
	cmp	eax, 100				; 00000064H
	jne	$L775
; Line 232
	mov	eax, DWORD PTR _node$[ebp]
	cmp	DWORD PTR [eax+40], 0
	je	$L776
; Line 233
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+40]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	OFFSET $SG777
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 234
$L776:
; Line 235
	jmp	$L778
$L775:
	movsx	eax, BYTE PTR _class$[ebp]
	cmp	eax, 116				; 00000074H
	jne	$L779
; Line 237
	mov	eax, DWORD PTR _node$[ebp]
	cmp	DWORD PTR [eax+56], 0
	je	$L780
; Line 239
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+56]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 1
	jne	$L781
; Line 240
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+56]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	OFFSET $SG782
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 241
	jmp	$L783
$L781:
; Line 242
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+56]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 42					; 0000002aH
	jne	$L784
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+56]
	cmp	DWORD PTR [eax+40], 0
	je	$L784
; Line 244
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+56]
	mov	eax, DWORD PTR [eax+40]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	OFFSET $SG785
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 245
$L784:
$L783:
; Line 246
$L780:
; Line 247
$L779:
$L778:
	mov	eax, DWORD PTR _node$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 1
	jne	$L786
; Line 248
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	OFFSET $SG787
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 250
$L786:
	mov	eax, DWORD PTR _node$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L788
; Line 252
	cmp	DWORD PTR _indent$[ebp], 4
	jg	$L789
; Line 253
	mov	eax, DWORD PTR _indent$[ebp]
	add	eax, 4
	push	eax
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	push	OFFSET $SG790
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_print_node_brief
	add	esp, 16					; 00000010H
; Line 254
$L789:
; Line 255
	jmp	$L791
$L788:
; Line 257
	mov	eax, DWORD PTR _indent$[ebp]
	add	eax, 4
	push	eax
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	push	OFFSET $SG792
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_print_node
	add	esp, 16					; 00000010H
; Line 258
	mov	eax, DWORD PTR _node$[ebp]
	cmp	DWORD PTR [eax+8], 0
	je	$L793
; Line 259
	mov	eax, DWORD PTR _indent$[ebp]
	add	eax, 3
	push	eax
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_indent_to
	add	esp, 8
; Line 260
$L793:
$L791:
; Line 262
	mov	eax, DWORD PTR _node$[ebp]
	test	BYTE PTR [eax+16], 1
	je	$L794
; Line 263
	push	OFFSET $SG795
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 8
; Line 264
$L794:
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 1
	test	al, 1
	je	$L796
; Line 265
	push	OFFSET $SG797
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 8
; Line 266
$L796:
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 2
	test	al, 1
	je	$L798
; Line 267
	push	OFFSET $SG799
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 8
; Line 268
$L798:
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 3
	test	al, 1
	je	$L800
; Line 269
	push	OFFSET $SG801
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 8
; Line 270
$L800:
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 4
	test	al, 1
	je	$L802
; Line 271
	push	OFFSET $SG803
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 8
; Line 272
$L802:
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 5
	test	al, 1
	je	$L804
; Line 273
	push	OFFSET $SG805
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 8
; Line 274
$L804:
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 6
	test	al, 1
	je	$L806
; Line 275
	push	OFFSET $SG807
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 8
; Line 276
$L806:
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 7
	test	al, 1
	je	$L808
; Line 277
	push	OFFSET $SG809
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 8
; Line 278
$L808:
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 8
	test	al, 1
	je	$L810
; Line 279
	push	OFFSET $SG811
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 8
; Line 280
$L810:
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 9
	test	al, 1
	je	$L812
; Line 281
	push	OFFSET $SG813
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 8
; Line 282
$L812:
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 10					; 0000000aH
	test	al, 1
	je	$L814
; Line 283
	push	OFFSET $SG815
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 8
; Line 284
$L814:
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 11					; 0000000bH
	test	al, 1
	je	$L816
; Line 285
	push	OFFSET $SG817
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 8
; Line 286
$L816:
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 12					; 0000000cH
	test	al, 1
	je	$L818
; Line 287
	push	OFFSET $SG819
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 8
; Line 288
$L818:
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 13					; 0000000dH
	test	al, 1
	je	$L820
; Line 289
	push	OFFSET $SG821
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 8
; Line 290
$L820:
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 14					; 0000000eH
	test	al, 1
	je	$L822
; Line 291
	push	OFFSET $SG823
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 8
; Line 292
$L822:
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 15					; 0000000fH
	test	al, 1
	je	$L824
; Line 293
	push	OFFSET $SG825
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 8
; Line 294
$L824:
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 16					; 00000010H
	test	al, 1
	je	$L826
; Line 295
	push	OFFSET $SG827
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 8
; Line 296
$L826:
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 17					; 00000011H
	test	al, 1
	je	$L828
; Line 297
	push	OFFSET $SG829
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 8
; Line 298
$L828:
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 18					; 00000012H
	test	al, 1
	je	$L830
; Line 299
	push	OFFSET $SG831
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 8
; Line 300
$L830:
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 19					; 00000013H
	test	al, 1
	je	$L832
; Line 301
	push	OFFSET $SG833
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 8
; Line 304
$L832:
	mov	eax, DWORD PTR _node$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	eax, DWORD PTR _tree_code_type[eax*4]
	movsx	eax, BYTE PTR [eax]
	mov	DWORD PTR -44+[ebp], eax
	jmp	$L834
; Line 306
$L838:
; Line 307
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	sar	eax, 24					; 00000018H
	mov	DWORD PTR _mode$[ebp], eax
; Line 308
	mov	eax, DWORD PTR _mode$[ebp]
	mov	eax, DWORD PTR _mode_name[eax*4]
	push	eax
	push	OFFSET $SG839
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 311
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	push	OFFSET $SG840
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
; Line 313
	mov	eax, DWORD PTR _indent$[ebp]
	add	eax, 4
	push	eax
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	push	OFFSET $SG841
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_print_node
	add	esp, 16					; 00000010H
; Line 314
	mov	eax, DWORD PTR _indent$[ebp]
	add	eax, 3
	push	eax
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_indent_to
	add	esp, 8
; Line 315
	mov	eax, DWORD PTR _node$[ebp]
	mov	al, BYTE PTR [eax+37]
	and	eax, 255				; 000000ffH
	push	eax
	push	OFFSET $SG842
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 316
	mov	eax, DWORD PTR _node$[ebp]
	mov	al, BYTE PTR [eax+36]
	and	eax, 255				; 000000ffH
	push	eax
	push	OFFSET $SG843
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 317
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+48]
	push	eax
	push	OFFSET $SG844
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 318
	mov	eax, DWORD PTR _indent$[ebp]
	add	eax, 4
	push	eax
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+44]
	push	eax
	push	OFFSET $SG845
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_print_node_brief
	add	esp, 16					; 00000010H
; Line 319
	mov	eax, DWORD PTR _indent$[ebp]
	add	eax, 4
	push	eax
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+52]
	push	eax
	push	OFFSET $SG846
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_print_node_brief
	add	esp, 16					; 00000010H
; Line 321
	mov	eax, DWORD PTR _indent$[ebp]
	add	eax, 4
	push	eax
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+56]
	push	eax
	push	OFFSET $SG847
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_print_node
	add	esp, 16					; 00000010H
; Line 322
	mov	eax, DWORD PTR _indent$[ebp]
	add	eax, 4
	push	eax
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+60]
	push	eax
	push	OFFSET $SG848
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_print_node
	add	esp, 16					; 00000010H
; Line 323
	mov	eax, DWORD PTR _indent$[ebp]
	add	eax, 4
	push	eax
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+64]
	push	eax
	push	OFFSET $SG849
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_print_node_brief
	add	esp, 16					; 00000010H
; Line 326
	cmp	DWORD PTR _indent$[ebp], 4
	jne	$L850
; Line 327
	mov	eax, DWORD PTR _indent$[ebp]
	add	eax, 4
	push	eax
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	OFFSET $SG851
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_print_node
	add	esp, 16					; 00000010H
; Line 328
	jmp	$L852
$L850:
; Line 329
	mov	eax, DWORD PTR _indent$[ebp]
	add	eax, 4
	push	eax
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	OFFSET $SG853
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_print_node_brief
	add	esp, 16					; 00000010H
$L852:
; Line 330
	jmp	$L835
; Line 332
$L854:
; Line 333
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	sar	eax, 24					; 00000018H
	mov	DWORD PTR _mode$[ebp], eax
; Line 334
	mov	eax, DWORD PTR _mode$[ebp]
	mov	eax, DWORD PTR _mode_name[eax*4]
	push	eax
	push	OFFSET $SG855
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 336
	mov	eax, DWORD PTR _indent$[ebp]
	add	eax, 4
	push	eax
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	push	OFFSET $SG856
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_print_node
	add	esp, 16					; 00000010H
; Line 337
	mov	eax, DWORD PTR _indent$[ebp]
	add	eax, 3
	push	eax
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_indent_to
	add	esp, 8
; Line 339
	mov	eax, DWORD PTR _node$[ebp]
	mov	al, BYTE PTR [eax+37]
	and	eax, 255				; 000000ffH
	push	eax
	push	OFFSET $SG857
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 340
	mov	eax, DWORD PTR _node$[ebp]
	mov	al, BYTE PTR [eax+36]
	and	eax, 255				; 000000ffH
	push	eax
	push	OFFSET $SG858
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 341
	mov	eax, DWORD PTR _node$[ebp]
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	push	eax
	push	OFFSET $SG859
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 342
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+52]
	push	eax
	push	OFFSET $SG860
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 344
	mov	eax, DWORD PTR _indent$[ebp]
	add	eax, 4
	push	eax
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	OFFSET $SG861
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_print_node
	add	esp, 16					; 00000010H
; Line 346
	mov	eax, DWORD PTR _node$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 16					; 00000010H
	je	$L863
	mov	eax, DWORD PTR _node$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 17					; 00000011H
	jne	$L862
$L863:
; Line 347
	mov	eax, DWORD PTR _indent$[ebp]
	add	eax, 4
	push	eax
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	push	OFFSET $SG864
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_print_node
	add	esp, 16					; 00000010H
; Line 348
	jmp	$L865
$L862:
	mov	eax, DWORD PTR _node$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 5
	jne	$L866
; Line 350
	mov	eax, DWORD PTR _node$[ebp]
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	push	eax
	push	OFFSET $SG867
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 351
	mov	eax, DWORD PTR _indent$[ebp]
	add	eax, 4
	push	eax
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	OFFSET $SG868
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_print_node
	add	esp, 16					; 00000010H
; Line 352
	mov	eax, DWORD PTR _indent$[ebp]
	add	eax, 4
	push	eax
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+60]
	push	eax
	push	OFFSET $SG869
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_print_node
	add	esp, 16					; 00000010H
; Line 354
	jmp	$L870
$L866:
	mov	eax, DWORD PTR _node$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 8
	jne	$L871
; Line 356
	mov	eax, DWORD PTR _node$[ebp]
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	push	eax
	push	OFFSET $SG872
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 357
	mov	eax, DWORD PTR _indent$[ebp]
	add	eax, 4
	push	eax
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	OFFSET $SG873
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_print_node
	add	esp, 16					; 00000010H
; Line 358
	mov	eax, DWORD PTR _indent$[ebp]
	add	eax, 4
	push	eax
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+60]
	push	eax
	push	OFFSET $SG874
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_print_node
	add	esp, 16					; 00000010H
; Line 359
	push	0
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	push	OFFSET $SG875
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_print_node
	add	esp, 16					; 00000010H
; Line 361
	jmp	$L876
$L871:
	mov	eax, DWORD PTR _node$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 6
	jne	$L877
; Line 362
	mov	eax, DWORD PTR _node$[ebp]
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	push	eax
	push	OFFSET $SG878
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 363
	jmp	$L879
$L877:
	mov	eax, DWORD PTR _node$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 19					; 00000013H
	je	$L881
	mov	eax, DWORD PTR _node$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 20					; 00000014H
	jne	$L880
$L881:
; Line 364
	mov	eax, DWORD PTR _indent$[ebp]
	add	eax, 4
	push	eax
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	push	OFFSET $SG882
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_print_node
	add	esp, 16					; 00000010H
; Line 365
	jmp	$L883
$L880:
	mov	eax, DWORD PTR _node$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 21					; 00000015H
	je	$L885
	mov	eax, DWORD PTR _node$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 14					; 0000000eH
	jne	$L884
$L885:
; Line 366
	mov	eax, DWORD PTR _indent$[ebp]
	add	eax, 4
	push	eax
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	push	OFFSET $SG886
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_print_node
	add	esp, 16					; 00000010H
; Line 368
$L884:
$L883:
$L879:
$L876:
$L870:
$L865:
	mov	eax, DWORD PTR _node$[ebp]
	cmp	DWORD PTR [eax+40], 0
	jne	$L888
	mov	eax, DWORD PTR _node$[ebp]
	cmp	DWORD PTR [eax+4], 0
	je	$L887
$L888:
; Line 369
	mov	eax, DWORD PTR _indent$[ebp]
	add	eax, 3
	push	eax
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_indent_to
	add	esp, 8
; Line 370
$L887:
	mov	eax, DWORD PTR _indent$[ebp]
	add	eax, 4
	push	eax
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+40]
	push	eax
	push	OFFSET $SG889
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_print_node_brief
	add	esp, 16					; 00000010H
; Line 371
	mov	eax, DWORD PTR _indent$[ebp]
	add	eax, 4
	push	eax
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+44]
	push	eax
	push	OFFSET $SG890
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_print_node_brief
	add	esp, 16					; 00000010H
; Line 372
	mov	eax, DWORD PTR _indent$[ebp]
	add	eax, 4
	push	eax
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	OFFSET $SG891
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_print_node_brief
	add	esp, 16					; 00000010H
; Line 373
	jmp	$L835
; Line 375
$L892:
; Line 380
	mov	eax, DWORD PTR _node$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	eax, DWORD PTR _tree_code_length[eax*4]
	mov	DWORD PTR _len$[ebp], eax
	mov	eax, DWORD PTR _len$[ebp]
	mov	DWORD PTR _first_rtl$[ebp], eax
; Line 383
	mov	eax, DWORD PTR _node$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR -48+[ebp], eax
	jmp	$L893
; Line 385
$L897:
; Line 386
	mov	DWORD PTR _first_rtl$[ebp], 1
; Line 387
	jmp	$L894
; Line 388
$L898:
; Line 389
	mov	DWORD PTR _first_rtl$[ebp], 2
; Line 390
	jmp	$L894
; Line 391
$L899:
; Line 392
	mov	DWORD PTR _first_rtl$[ebp], 3
; Line 393
	jmp	$L894
; Line 394
$L900:
; Line 396
	mov	DWORD PTR _first_rtl$[ebp], 1
; Line 397
	jmp	$L894
; Line 398
$L901:
; Line 399
	mov	DWORD PTR _first_rtl$[ebp], 0
; Line 400
	jmp	$L894
$L893:
	cmp	DWORD PTR -48+[ebp], 61			; 0000003dH
	je	$L898
	cmp	DWORD PTR -48+[ebp], 62			; 0000003eH
	je	$L899
	cmp	DWORD PTR -48+[ebp], 63			; 0000003fH
	je	$L900
	cmp	DWORD PTR -48+[ebp], 114		; 00000072H
	je	$L897
	cmp	DWORD PTR -48+[ebp], 115		; 00000073H
	je	$L901
	jmp	$L894
$L894:
; Line 401
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L902
$L903:
	inc	DWORD PTR _i$[ebp]
$L902:
	mov	eax, DWORD PTR _len$[ebp]
	cmp	DWORD PTR _i$[ebp], eax
	jge	$L904
; Line 403
	mov	eax, DWORD PTR _first_rtl$[ebp]
	cmp	DWORD PTR _i$[ebp], eax
	jl	$L905
; Line 405
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _node$[ebp]
	cmp	DWORD PTR [ecx+eax*4+24], 0
	je	$L906
; Line 406
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+24]
	push	eax
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_print_rtl
	add	esp, 8
; Line 407
	jmp	$L908
$L906:
; Line 408
	push	OFFSET $SG909
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 8
$L908:
; Line 409
	push	OFFSET $SG910
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 8
; Line 411
	jmp	$L911
$L905:
; Line 415
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	push	OFFSET $SG913
	lea	eax, DWORD PTR _temp$912[ebp]
	push	eax
	call	_sprintf
	add	esp, 12					; 0000000cH
; Line 416
	mov	eax, DWORD PTR _indent$[ebp]
	add	eax, 4
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+24]
	push	eax
	lea	eax, DWORD PTR _temp$912[ebp]
	push	eax
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_print_node
	add	esp, 16					; 00000010H
; Line 417
$L911:
; Line 418
	jmp	$L903
$L904:
; Line 419
	jmp	$L835
; Line 421
$L914:
; Line 423
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	push	OFFSET $SG915
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
; Line 425
	mov	eax, DWORD PTR _node$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR -52+[ebp], eax
	jmp	$L916
; Line 427
$L920:
; Line 428
	mov	eax, DWORD PTR _indent$[ebp]
	add	eax, 4
	push	eax
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	push	OFFSET $SG921
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_print_node
	add	esp, 16					; 00000010H
; Line 429
	mov	eax, DWORD PTR _indent$[ebp]
	add	eax, 4
	push	eax
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+32]
	push	eax
	push	OFFSET $SG922
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_print_node
	add	esp, 16					; 00000010H
; Line 430
	mov	eax, DWORD PTR _indent$[ebp]
	add	eax, 4
	push	eax
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+36]
	push	eax
	push	OFFSET $SG923
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_print_node
	add	esp, 16					; 00000010H
; Line 431
	jmp	$L917
; Line 433
$L924:
; Line 435
	mov	eax, DWORD PTR _indent$[ebp]
	add	eax, 4
	push	eax
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+32]
	push	eax
	push	OFFSET $SG925
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_print_node
	add	esp, 16					; 00000010H
; Line 436
	mov	eax, DWORD PTR _indent$[ebp]
	add	eax, 4
	push	eax
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+44]
	push	eax
	push	OFFSET $SG926
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_print_node
	add	esp, 16					; 00000010H
; Line 437
	mov	eax, DWORD PTR _indent$[ebp]
	add	eax, 4
	push	eax
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+36]
	push	eax
	push	OFFSET $SG927
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_print_node
	add	esp, 16					; 00000010H
; Line 438
	mov	eax, DWORD PTR _indent$[ebp]
	add	eax, 4
	push	eax
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	push	OFFSET $SG928
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_print_node
	add	esp, 16					; 00000010H
; Line 439
	mov	eax, DWORD PTR _indent$[ebp]
	add	eax, 4
	push	eax
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+48]
	push	eax
	push	OFFSET $SG929
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_print_node
	add	esp, 16					; 00000010H
; Line 440
	jmp	$L917
; Line 442
$L930:
; Line 443
	mov	eax, DWORD PTR _indent$[ebp]
	add	eax, 4
	push	eax
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	push	OFFSET $SG931
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_print_node
	add	esp, 16					; 00000010H
; Line 444
	mov	eax, DWORD PTR _indent$[ebp]
	add	eax, 4
	push	eax
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+32]
	push	eax
	push	OFFSET $SG932
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_print_node
	add	esp, 16					; 00000010H
; Line 445
	jmp	$L917
; Line 447
$L933:
; Line 448
	mov	eax, DWORD PTR _indent$[ebp]
	add	eax, 4
	push	eax
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	push	OFFSET $SG934
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_print_node
	add	esp, 16					; 00000010H
; Line 449
	jmp	$L917
; Line 450
	jmp	$L917
$L916:
	cmp	DWORD PTR -52+[ebp], 27			; 0000001bH
	jl	$L933
	cmp	DWORD PTR -52+[ebp], 28			; 0000001cH
	jle	$L924
	cmp	DWORD PTR -52+[ebp], 29			; 0000001dH
	je	$L920
	cmp	DWORD PTR -52+[ebp], 31			; 0000001fH
	je	$L930
	jmp	$L933
$L917:
; Line 451
	mov	eax, DWORD PTR _indent$[ebp]
	add	eax, 4
	push	eax
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	OFFSET $SG935
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_print_node
	add	esp, 16					; 00000010H
; Line 452
	jmp	$L835
; Line 454
$L936:
; Line 456
	mov	eax, DWORD PTR _node$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR -56+[ebp], eax
	jmp	$L937
; Line 458
$L941:
; Line 459
	mov	eax, DWORD PTR _node$[ebp]
	cmp	DWORD PTR [eax+24], 0
	jne	$L942
; Line 460
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	push	OFFSET $SG943
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 461
	jmp	$L944
$L942:
; Line 462
	mov	eax, DWORD PTR _node$[ebp]
	cmp	DWORD PTR [eax+24], -1
	jne	$L945
	mov	eax, DWORD PTR _node$[ebp]
	cmp	DWORD PTR [eax+20], 0
	je	$L945
; Line 463
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+20]
	neg	eax
	push	eax
	push	OFFSET $SG946
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 464
	jmp	$L947
$L945:
; Line 467
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	OFFSET $SG948
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
$L947:
$L944:
; Line 468
	jmp	$L938
; Line 470
$L949:
; Line 472
	mov	eax, DWORD PTR _node$[ebp]
	mov	ecx, DWORD PTR [eax+28]
	push	ecx
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	OFFSET $SG950
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
; Line 482
	jmp	$L938
; Line 484
$L951:
; Line 485
	mov	eax, DWORD PTR _indent$[ebp]
	add	eax, 4
	push	eax
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	OFFSET $SG952
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_print_node
	add	esp, 16					; 00000010H
; Line 486
	mov	eax, DWORD PTR _indent$[ebp]
	add	eax, 4
	push	eax
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	push	OFFSET $SG953
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_print_node
	add	esp, 16					; 00000010H
; Line 487
	jmp	$L938
; Line 489
$L954:
; Line 490
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	push	OFFSET $SG955
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 491
	jmp	$L938
; Line 493
$L956:
; Line 494
	mov	eax, DWORD PTR _indent$[ebp]
	push	eax
	mov	eax, DWORD PTR _node$[ebp]
	push	eax
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_print_lang_identifier
	add	esp, 12					; 0000000cH
; Line 495
	jmp	$L938
; Line 497
$L958:
; Line 498
	mov	eax, DWORD PTR _indent$[ebp]
	add	eax, 4
	push	eax
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	push	OFFSET $SG959
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_print_node
	add	esp, 16					; 00000010H
; Line 499
	mov	eax, DWORD PTR _indent$[ebp]
	add	eax, 4
	push	eax
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	OFFSET $SG960
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_print_node
	add	esp, 16					; 00000010H
; Line 500
	mov	eax, DWORD PTR _indent$[ebp]
	add	eax, 4
	push	eax
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	OFFSET $SG961
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_print_node
	add	esp, 16					; 00000010H
; Line 501
	jmp	$L938
; Line 503
$L962:
; Line 504
	mov	eax, DWORD PTR _indent$[ebp]
	add	eax, 4
	push	eax
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	push	OFFSET $SG963
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_print_node
	add	esp, 16					; 00000010H
; Line 505
	mov	eax, DWORD PTR _indent$[ebp]
	add	eax, 4
	push	eax
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	OFFSET $SG964
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_print_node
	add	esp, 16					; 00000010H
; Line 506
	jmp	$L938
$L937:
	cmp	DWORD PTR -56+[ebp], 35			; 00000023H
	jg	$L968
	je	$L941
	cmp	DWORD PTR -56+[ebp], 1
	je	$L956
	cmp	DWORD PTR -56+[ebp], 2
	je	$L962
	cmp	DWORD PTR -56+[ebp], 3
	je	$L958
	jmp	$L938
$L968:
	cmp	DWORD PTR -56+[ebp], 36			; 00000024H
	je	$L949
	cmp	DWORD PTR -56+[ebp], 37			; 00000025H
	je	$L951
	cmp	DWORD PTR -56+[ebp], 38			; 00000026H
	je	$L954
	jmp	$L938
$L938:
; Line 508
	mov	eax, DWORD PTR _indent$[ebp]
	add	eax, 4
	push	eax
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	OFFSET $SG965
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_print_node
	add	esp, 16					; 00000010H
; Line 509
	jmp	$L835
; Line 510
	jmp	$L835
$L834:
	cmp	DWORD PTR -44+[ebp], 101		; 00000065H
	jg	$L969
	je	$L892
	cmp	DWORD PTR -44+[ebp], 49			; 00000031H
	jl	$L835
	cmp	DWORD PTR -44+[ebp], 50			; 00000032H
	jle	$L892
	cmp	DWORD PTR -44+[ebp], 60			; 0000003cH
	je	$L892
	cmp	DWORD PTR -44+[ebp], 99			; 00000063H
	je	$L936
	cmp	DWORD PTR -44+[ebp], 100		; 00000064H
	je	$L838
	jmp	$L835
$L969:
	cmp	DWORD PTR -44+[ebp], 114		; 00000072H
	je	$L892
	cmp	DWORD PTR -44+[ebp], 115		; 00000073H
	je	$L914
	cmp	DWORD PTR -44+[ebp], 116		; 00000074H
	je	$L854
	cmp	DWORD PTR -44+[ebp], 120		; 00000078H
	je	$L936
	jmp	$L835
$L835:
; Line 511
$L758:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_print_node ENDP
_TEXT	ENDS
END
