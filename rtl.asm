	TITLE	rtl.c
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
PUBLIC	_spaces
PUBLIC	_mode_name
PUBLIC	_mode_class
PUBLIC	_mode_size
PUBLIC	_mode_unit_size
PUBLIC	_mode_wider_mode
PUBLIC	_reg_note_name
PUBLIC	_note_insn_name
PUBLIC	_rtx_name
PUBLIC	_rtx_format
_DATA	SEGMENT
COMM	_rtx_length:DWORD:05cH
$SG504	DB	'UnKnown', 00H
$SG505	DB	'nil', 00H
$SG506	DB	'expr_list', 00H
	ORG $+2
$SG507	DB	'insn_list', 00H
	ORG $+2
$SG508	DB	'match_operand', 00H
	ORG $+2
$SG509	DB	'match_dup', 00H
	ORG $+2
$SG510	DB	'match_operator', 00H
	ORG $+1
$SG511	DB	'define_insn', 00H
$SG512	DB	'define_peephole', 00H
$SG513	DB	'define_combine', 00H
	ORG $+1
$SG514	DB	'define_expand', 00H
	ORG $+2
$SG515	DB	'sequence', 00H
	ORG $+3
$SG516	DB	'address', 00H
$SG517	DB	'insn', 00H
	ORG $+3
$SG518	DB	'jump_insn', 00H
	ORG $+2
$SG519	DB	'call_insn', 00H
	ORG $+2
$SG520	DB	'barrier', 00H
$SG521	DB	'code_label', 00H
	ORG $+1
$SG522	DB	'note', 00H
	ORG $+3
$SG523	DB	'inline_header', 00H
	ORG $+2
$SG524	DB	'parallel', 00H
	ORG $+3
$SG525	DB	'asm_input', 00H
	ORG $+2
$SG526	DB	'asm_operands', 00H
	ORG $+3
$SG527	DB	'addr_vec', 00H
	ORG $+3
$SG528	DB	'addr_diff_vec', 00H
	ORG $+2
$SG529	DB	'set', 00H
$SG530	DB	'use', 00H
$SG531	DB	'clobber', 00H
$SG532	DB	'call', 00H
	ORG $+3
$SG533	DB	'return', 00H
	ORG $+1
$SG534	DB	'const_int', 00H
	ORG $+2
$SG535	DB	'const_double', 00H
	ORG $+3
$SG536	DB	'const', 00H
	ORG $+2
$SG537	DB	'pc', 00H
	ORG $+1
$SG538	DB	'reg', 00H
$SG539	DB	'subreg', 00H
	ORG $+1
$SG540	DB	'strict_low_part', 00H
$SG541	DB	'mem', 00H
$SG542	DB	'label_ref', 00H
	ORG $+2
$SG543	DB	'symbol_ref', 00H
	ORG $+1
$SG544	DB	'cc0', 00H
$SG545	DB	'queued', 00H
	ORG $+1
$SG546	DB	'if_then_else', 00H
	ORG $+3
$SG547	DB	'compare', 00H
$SG548	DB	'plus', 00H
	ORG $+3
$SG549	DB	'minus', 00H
	ORG $+2
$SG550	DB	'neg', 00H
$SG551	DB	'mult', 00H
	ORG $+3
$SG552	DB	'div', 00H
$SG553	DB	'mod', 00H
$SG554	DB	'umult', 00H
	ORG $+2
$SG555	DB	'udiv', 00H
	ORG $+3
$SG556	DB	'umod', 00H
	ORG $+3
$SG557	DB	'and', 00H
$SG558	DB	'ior', 00H
$SG559	DB	'xor', 00H
$SG560	DB	'not', 00H
$SG561	DB	'lshift', 00H
	ORG $+1
$SG562	DB	'ashift', 00H
	ORG $+1
$SG563	DB	'rotate', 00H
	ORG $+1
$SG564	DB	'ashiftrt', 00H
	ORG $+3
$SG565	DB	'lshiftrt', 00H
	ORG $+3
$SG566	DB	'rotatert', 00H
	ORG $+3
$SG567	DB	'pre_dec', 00H
$SG568	DB	'pre_inc', 00H
$SG569	DB	'post_dec', 00H
	ORG $+3
$SG570	DB	'post_inc', 00H
	ORG $+3
$SG571	DB	'ne', 00H
	ORG $+1
$SG572	DB	'eq', 00H
	ORG $+1
$SG573	DB	'ge', 00H
	ORG $+1
$SG574	DB	'gt', 00H
	ORG $+1
$SG575	DB	'le', 00H
	ORG $+1
$SG576	DB	'lt', 00H
	ORG $+1
$SG577	DB	'geu', 00H
$SG578	DB	'gtu', 00H
$SG579	DB	'leu', 00H
$SG580	DB	'ltu', 00H
$SG581	DB	'sign_extend', 00H
$SG582	DB	'zero_extend', 00H
$SG583	DB	'truncate', 00H
	ORG $+3
$SG584	DB	'float_extend', 00H
	ORG $+3
$SG585	DB	'float_truncate', 00H
	ORG $+1
$SG586	DB	'float', 00H
	ORG $+2
$SG587	DB	'fix', 00H
$SG588	DB	'unsigned_float', 00H
	ORG $+1
$SG589	DB	'unsigned_fix', 00H
	ORG $+3
$SG590	DB	'abs', 00H
$SG591	DB	'sqrt', 00H
	ORG $+3
$SG592	DB	'ffs', 00H
$SG593	DB	'sign_extract', 00H
	ORG $+3
$SG594	DB	'zero_extract', 00H
	ORG $+7
_rtx_name DD	$SG504
	DD	$SG505
	DD	$SG506
	DD	$SG507
	DD	$SG508
	DD	$SG509
	DD	$SG510
	DD	$SG511
	DD	$SG512
	DD	$SG513
	DD	$SG514
	DD	$SG515
	DD	$SG516
	DD	$SG517
	DD	$SG518
	DD	$SG519
	DD	$SG520
	DD	$SG521
	DD	$SG522
	DD	$SG523
	DD	$SG524
	DD	$SG525
	DD	$SG526
	DD	$SG527
	DD	$SG528
	DD	$SG529
	DD	$SG530
	DD	$SG531
	DD	$SG532
	DD	$SG533
	DD	$SG534
	DD	$SG535
	DD	$SG536
	DD	$SG537
	DD	$SG538
	DD	$SG539
	DD	$SG540
	DD	$SG541
	DD	$SG542
	DD	$SG543
	DD	$SG544
	DD	$SG545
	DD	$SG546
	DD	$SG547
	DD	$SG548
	DD	$SG549
	DD	$SG550
	DD	$SG551
	DD	$SG552
	DD	$SG553
	DD	$SG554
	DD	$SG555
	DD	$SG556
	DD	$SG557
	DD	$SG558
	DD	$SG559
	DD	$SG560
	DD	$SG561
	DD	$SG562
	DD	$SG563
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
$SG595	DB	'VOID', 00H
	ORG $+3
$SG596	DB	'QI', 00H
	ORG $+1
$SG597	DB	'HI', 00H
	ORG $+1
$SG598	DB	'PSI', 00H
$SG599	DB	'SI', 00H
	ORG $+1
$SG600	DB	'PDI', 00H
$SG601	DB	'DI', 00H
	ORG $+1
$SG602	DB	'TI', 00H
	ORG $+1
$SG603	DB	'QF', 00H
	ORG $+1
$SG604	DB	'HF', 00H
	ORG $+1
$SG605	DB	'SF', 00H
	ORG $+1
$SG606	DB	'DF', 00H
	ORG $+1
$SG607	DB	'XF', 00H
	ORG $+1
$SG608	DB	'TF', 00H
	ORG $+1
$SG609	DB	'CQI', 00H
$SG610	DB	'CHI', 00H
$SG611	DB	'CSI', 00H
$SG612	DB	'CDI', 00H
$SG613	DB	'CTI', 00H
$SG614	DB	'CQF', 00H
$SG615	DB	'CHF', 00H
$SG616	DB	'CSF', 00H
$SG617	DB	'CDF', 00H
$SG618	DB	'CXF', 00H
$SG619	DB	'CTF', 00H
$SG620	DB	'BI', 00H
	ORG $+1
$SG621	DB	'BLK', 00H
$SG622	DB	'EP', 00H
	ORG $+1
_mode_name DD	$SG595
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
_mode_class DD	00H
	DD	01H
	DD	01H
	DD	01H
	DD	01H
	DD	01H
	DD	01H
	DD	01H
	DD	02H
	DD	02H
	DD	02H
	DD	02H
	DD	02H
	DD	02H
	DD	03H
	DD	03H
	DD	03H
	DD	03H
	DD	03H
	DD	04H
	DD	04H
	DD	04H
	DD	04H
	DD	04H
	DD	04H
	DD	01H
	DD	00H
	DD	00H
_mode_size DD	00H
	DD	01H
	DD	02H
	DD	04H
	DD	04H
	DD	08H
	DD	08H
	DD	010H
	DD	01H
	DD	02H
	DD	04H
	DD	08H
	DD	0cH
	DD	010H
	DD	02H
	DD	04H
	DD	08H
	DD	010H
	DD	020H
	DD	02H
	DD	04H
	DD	08H
	DD	010H
	DD	018H
	DD	020H
	DD	00H
	DD	00H
	DD	08H
_mode_unit_size DD 00H
	DD	01H
	DD	02H
	DD	04H
	DD	04H
	DD	08H
	DD	08H
	DD	010H
	DD	01H
	DD	02H
	DD	04H
	DD	08H
	DD	0cH
	DD	010H
	DD	01H
	DD	02H
	DD	04H
	DD	08H
	DD	010H
	DD	01H
	DD	02H
	DD	04H
	DD	08H
	DD	0cH
	DD	010H
	DD	00H
	DD	00H
	DD	04H
_mode_wider_mode DD 00H
	DD	02H
	DD	04H
	DD	00H
	DD	06H
	DD	00H
	DD	07H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
$SG623	DB	'*', 00H
	ORG $+2
$SG624	DB	'*', 00H
	ORG $+2
$SG625	DB	'ee', 00H
	ORG $+1
$SG626	DB	'ue', 00H
	ORG $+1
$SG627	DB	'iss', 00H
$SG628	DB	'i', 00H
	ORG $+2
$SG629	DB	'isE', 00H
$SG630	DB	'sEssS', 00H
	ORG $+2
$SG631	DB	'EssS', 00H
	ORG $+3
$SG632	DB	'Ess', 00H
$SG633	DB	'sEss', 00H
	ORG $+3
$SG634	DB	'E', 00H
	ORG $+2
$SG635	DB	'e', 00H
	ORG $+2
$SG636	DB	'iuueiee', 00H
$SG637	DB	'iuueiee0', 00H
	ORG $+3
$SG638	DB	'iuueiee', 00H
$SG639	DB	'iuu', 00H
$SG640	DB	'iuui0', 00H
	ORG $+2
$SG641	DB	'iuusn', 00H
	ORG $+2
$SG642	DB	'iuuiiiiiiii', 00H
$SG643	DB	'E', 00H
	ORG $+2
$SG644	DB	's', 00H
	ORG $+2
$SG645	DB	'ssiEEsi', 00H
$SG646	DB	'E', 00H
	ORG $+2
$SG647	DB	'eE', 00H
	ORG $+1
$SG648	DB	'ee', 00H
	ORG $+1
$SG649	DB	'e', 00H
	ORG $+2
$SG650	DB	'e', 00H
	ORG $+2
$SG651	DB	'ee', 00H
	ORG $+1
$SG652	DB	00H
	ORG $+3
$SG653	DB	'i', 00H
	ORG $+2
$SG654	DB	'e0ii', 00H
	ORG $+3
$SG655	DB	'e', 00H
	ORG $+2
$SG656	DB	00H
	ORG $+3
$SG657	DB	'i', 00H
	ORG $+2
$SG658	DB	'ei', 00H
	ORG $+1
$SG659	DB	'e', 00H
	ORG $+2
$SG660	DB	'e', 00H
	ORG $+2
$SG661	DB	'u00', 00H
$SG662	DB	's', 00H
	ORG $+2
$SG663	DB	00H
	ORG $+3
$SG664	DB	'eeeee', 00H
	ORG $+2
$SG665	DB	'eee', 00H
$SG666	DB	'ee', 00H
	ORG $+1
$SG667	DB	'ee', 00H
	ORG $+1
$SG668	DB	'ee', 00H
	ORG $+1
$SG669	DB	'e', 00H
	ORG $+2
$SG670	DB	'ee', 00H
	ORG $+1
$SG671	DB	'ee', 00H
	ORG $+1
$SG672	DB	'ee', 00H
	ORG $+1
$SG673	DB	'ee', 00H
	ORG $+1
$SG674	DB	'ee', 00H
	ORG $+1
$SG675	DB	'ee', 00H
	ORG $+1
$SG676	DB	'ee', 00H
	ORG $+1
$SG677	DB	'ee', 00H
	ORG $+1
$SG678	DB	'ee', 00H
	ORG $+1
$SG679	DB	'e', 00H
	ORG $+2
$SG680	DB	'ee', 00H
	ORG $+1
$SG681	DB	'ee', 00H
	ORG $+1
$SG682	DB	'ee', 00H
	ORG $+1
$SG683	DB	'ee', 00H
	ORG $+1
$SG684	DB	'ee', 00H
	ORG $+1
$SG685	DB	'ee', 00H
	ORG $+1
$SG686	DB	'e', 00H
	ORG $+2
$SG687	DB	'e', 00H
	ORG $+2
$SG688	DB	'e', 00H
	ORG $+2
$SG689	DB	'e', 00H
	ORG $+2
$SG690	DB	'ee', 00H
	ORG $+1
$SG691	DB	'ee', 00H
	ORG $+1
$SG692	DB	'ee', 00H
	ORG $+1
$SG693	DB	'ee', 00H
	ORG $+1
$SG694	DB	'ee', 00H
	ORG $+1
$SG695	DB	'ee', 00H
	ORG $+1
$SG696	DB	'ee', 00H
	ORG $+1
$SG697	DB	'ee', 00H
	ORG $+1
$SG698	DB	'ee', 00H
	ORG $+1
$SG699	DB	'ee', 00H
	ORG $+1
$SG700	DB	'e', 00H
	ORG $+2
$SG701	DB	'e', 00H
	ORG $+2
$SG702	DB	'e', 00H
	ORG $+2
$SG703	DB	'e', 00H
	ORG $+2
$SG704	DB	'e', 00H
	ORG $+2
$SG705	DB	'e', 00H
	ORG $+2
$SG706	DB	'e', 00H
	ORG $+2
$SG707	DB	'e', 00H
	ORG $+2
$SG708	DB	'e', 00H
	ORG $+2
$SG709	DB	'e', 00H
	ORG $+2
$SG710	DB	'e', 00H
	ORG $+2
$SG711	DB	'e', 00H
	ORG $+2
$SG712	DB	'eee', 00H
$SG713	DB	'eee', 00H
	ORG $+4
_rtx_format DD	$SG623
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
	DD	$SG692
	DD	$SG693
	DD	$SG694
	DD	$SG695
	DD	$SG696
	DD	$SG697
	DD	$SG698
	DD	$SG699
	DD	$SG700
	DD	$SG701
	DD	$SG702
	DD	$SG703
	DD	$SG704
	DD	$SG705
	DD	$SG706
	DD	$SG707
	DD	$SG708
	DD	$SG709
	DD	$SG710
	DD	$SG711
	DD	$SG712
	DD	$SG713
$SG714	DB	'NOTE_INSN_FUNCTION_BEG', 00H
	ORG $+1
$SG715	DB	'NOTE_INSN_DELETED', 00H
	ORG $+2
$SG716	DB	'NOTE_INSN_BLOCK_BEG', 00H
$SG717	DB	'NOTE_INSN_BLOCK_END', 00H
$SG718	DB	'NOTE_INSN_LOOP_BEG', 00H
	ORG $+1
$SG719	DB	'NOTE_INSN_LOOP_END', 00H
	ORG $+1
$SG720	DB	'NOTE_INSN_FUNCTION_END', 00H
	ORG $+1
$SG721	DB	'NOTE_INSN_SETJMP', 00H
	ORG $+3
$SG722	DB	'NOTE_INSN_LOOP_CONT', 00H
_note_insn_name DD $SG714
	DD	$SG715
	DD	$SG716
	DD	$SG717
	DD	$SG718
	DD	$SG719
	DD	$SG720
	DD	$SG721
	DD	$SG722
$SG723	DB	00H
	ORG $+3
$SG724	DB	'REG_DEAD', 00H
	ORG $+3
$SG725	DB	'REG_INC', 00H
$SG726	DB	'REG_EQUIV', 00H
	ORG $+2
$SG727	DB	'REG_WAS_0', 00H
	ORG $+2
$SG728	DB	'REG_EQUAL', 00H
	ORG $+2
$SG729	DB	'REG_RETVAL', 00H
	ORG $+1
$SG730	DB	'REG_LIBCALL', 00H
$SG731	DB	'REG_NONNEG', 00H
	ORG $+1
$SG732	DB	'REG_UNSET', 00H
	ORG $+2
_reg_note_name DD $SG723
	DD	$SG724
	DD	$SG725
	DD	$SG726
	DD	$SG727
	DD	$SG728
	DD	$SG729
	DD	$SG730
	DD	$SG731
	DD	$SG732
_spaces	DB	'                                                        '
	DB	'                                                             '
	DB	'                                           ', 00H
	ORG $+3
_sawclose$S775 DD 00H
_DATA	ENDS
PUBLIC	_rtvec_alloc
EXTRN	__obstack_newchunk:NEAR
EXTRN	_rtl_obstack:DWORD
_TEXT	SEGMENT
; File rtl.c
_n$ = 8
_rt$ = -8
_i$ = -4
_rtvec_alloc PROC NEAR
; Line 164
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 170
	mov	eax, DWORD PTR _n$[ebp]
	lea	eax, DWORD PTR [eax*4-4]
	add	eax, 8
	mov	ecx, DWORD PTR _rtl_obstack
	mov	DWORD PTR [ecx+20], eax
	mov	eax, DWORD PTR _rtl_obstack
	mov	eax, DWORD PTR [eax+20]
	mov	ecx, DWORD PTR _rtl_obstack
	add	eax, DWORD PTR [ecx+12]
	mov	ecx, DWORD PTR _rtl_obstack
	cmp	eax, DWORD PTR [ecx+16]
	jbe	$L1011
	mov	eax, DWORD PTR _rtl_obstack
	mov	eax, DWORD PTR [eax+20]
	push	eax
	mov	eax, DWORD PTR _rtl_obstack
	push	eax
	call	__obstack_newchunk
	add	esp, 8
	jmp	$L1012
$L1011:
$L1012:
	mov	eax, DWORD PTR _rtl_obstack
	mov	eax, DWORD PTR [eax+20]
	mov	ecx, DWORD PTR _rtl_obstack
	add	DWORD PTR [ecx+12], eax
	mov	eax, DWORD PTR _rtl_obstack
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _rtl_obstack
	mov	DWORD PTR [ecx+20], eax
	mov	eax, DWORD PTR _rtl_obstack
	mov	eax, DWORD PTR [eax+12]
	mov	ecx, DWORD PTR _rtl_obstack
	add	eax, DWORD PTR [ecx+24]
	mov	ecx, DWORD PTR _rtl_obstack
	mov	ecx, DWORD PTR [ecx+24]
	not	ecx
	and	eax, ecx
	mov	ecx, DWORD PTR _rtl_obstack
	mov	DWORD PTR [ecx+12], eax
	mov	eax, DWORD PTR _rtl_obstack
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _rtl_obstack
	sub	eax, DWORD PTR [ecx+4]
	mov	ecx, DWORD PTR _rtl_obstack
	mov	ecx, DWORD PTR [ecx+12]
	mov	edx, DWORD PTR _rtl_obstack
	sub	ecx, DWORD PTR [edx+4]
	cmp	eax, ecx
	jge	$L1013
	mov	eax, DWORD PTR _rtl_obstack
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _rtl_obstack
	mov	DWORD PTR [ecx+12], eax
	jmp	$L1014
$L1013:
$L1014:
	mov	eax, DWORD PTR _rtl_obstack
	mov	eax, DWORD PTR [eax+12]
	mov	ecx, DWORD PTR _rtl_obstack
	mov	DWORD PTR [ecx+8], eax
	mov	eax, DWORD PTR _rtl_obstack
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _rt$[ebp], eax
; Line 173
	mov	eax, DWORD PTR _n$[ebp]
	mov	ecx, DWORD PTR _rt$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 174
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L738
$L739:
	inc	DWORD PTR _i$[ebp]
$L738:
	mov	eax, DWORD PTR _n$[ebp]
	cmp	DWORD PTR _i$[ebp], eax
	jge	$L740
; Line 175
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _rt$[ebp]
	mov	DWORD PTR [ecx+eax*4+4], 0
	jmp	$L739
$L740:
; Line 177
	mov	eax, DWORD PTR _rt$[ebp]
	jmp	$L734
; Line 178
$L734:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_rtvec_alloc ENDP
_TEXT	ENDS
PUBLIC	_rtx_alloc
_TEXT	SEGMENT
_code$ = 8
_rt$ = -8
_nelts$ = -4
_length$ = -12
_rtx_alloc PROC NEAR
; Line 186
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 188
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_length[eax*4]
	mov	DWORD PTR _nelts$[ebp], eax
; Line 190
	mov	eax, DWORD PTR _nelts$[ebp]
	lea	eax, DWORD PTR [eax*4-4]
	add	eax, 8
	mov	DWORD PTR _length$[ebp], eax
; Line 192
	mov	eax, DWORD PTR _length$[ebp]
	mov	ecx, DWORD PTR _rtl_obstack
	mov	DWORD PTR [ecx+20], eax
	mov	eax, DWORD PTR _rtl_obstack
	mov	eax, DWORD PTR [eax+20]
	mov	ecx, DWORD PTR _rtl_obstack
	add	eax, DWORD PTR [ecx+12]
	mov	ecx, DWORD PTR _rtl_obstack
	cmp	eax, DWORD PTR [ecx+16]
	jbe	$L1015
	mov	eax, DWORD PTR _rtl_obstack
	mov	eax, DWORD PTR [eax+20]
	push	eax
	mov	eax, DWORD PTR _rtl_obstack
	push	eax
	call	__obstack_newchunk
	add	esp, 8
	jmp	$L1016
$L1015:
$L1016:
	mov	eax, DWORD PTR _rtl_obstack
	mov	eax, DWORD PTR [eax+20]
	mov	ecx, DWORD PTR _rtl_obstack
	add	DWORD PTR [ecx+12], eax
	mov	eax, DWORD PTR _rtl_obstack
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _rtl_obstack
	mov	DWORD PTR [ecx+20], eax
	mov	eax, DWORD PTR _rtl_obstack
	mov	eax, DWORD PTR [eax+12]
	mov	ecx, DWORD PTR _rtl_obstack
	add	eax, DWORD PTR [ecx+24]
	mov	ecx, DWORD PTR _rtl_obstack
	mov	ecx, DWORD PTR [ecx+24]
	not	ecx
	and	eax, ecx
	mov	ecx, DWORD PTR _rtl_obstack
	mov	DWORD PTR [ecx+12], eax
	mov	eax, DWORD PTR _rtl_obstack
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _rtl_obstack
	sub	eax, DWORD PTR [ecx+4]
	mov	ecx, DWORD PTR _rtl_obstack
	mov	ecx, DWORD PTR [ecx+12]
	mov	edx, DWORD PTR _rtl_obstack
	sub	ecx, DWORD PTR [edx+4]
	cmp	eax, ecx
	jge	$L1017
	mov	eax, DWORD PTR _rtl_obstack
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _rtl_obstack
	mov	DWORD PTR [ecx+12], eax
	jmp	$L1018
$L1017:
$L1018:
	mov	eax, DWORD PTR _rtl_obstack
	mov	eax, DWORD PTR [eax+12]
	mov	ecx, DWORD PTR _rtl_obstack
	mov	DWORD PTR [ecx+8], eax
	mov	eax, DWORD PTR _rtl_obstack
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _rt$[ebp], eax
; Line 194
	mov	eax, DWORD PTR _rt$[ebp]
	mov	DWORD PTR [eax], 0
; Line 195
	mov	eax, DWORD PTR _rt$[ebp]
	mov	eax, DWORD PTR [eax]
	and	eax, -65536				; ffff0000H
	mov	ecx, DWORD PTR _code$[ebp]
	and	ecx, 65535				; 0000ffffH
	or	eax, ecx
	mov	ecx, DWORD PTR _rt$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 197
	mov	eax, DWORD PTR _rt$[ebp]
	jmp	$L742
; Line 198
$L742:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_rtx_alloc ENDP
_TEXT	ENDS
PUBLIC	_copy_rtx
_TEXT	SEGMENT
_orig$ = 8
_copy$ = -4
_i$ = -12
_j$ = -20
_code$ = -16
_format_ptr$ = -8
_copy_rtx PROC NEAR
; Line 207
	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H
	push	ebx
	push	esi
	push	edi
; Line 213
	mov	eax, DWORD PTR _orig$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$[ebp], eax
; Line 215
	mov	eax, DWORD PTR _code$[ebp]
	mov	DWORD PTR -28+[ebp], eax
	jmp	$L753
; Line 217
$L757:
; Line 225
	mov	eax, DWORD PTR _orig$[ebp]
	jmp	$L747
; Line 226
	jmp	$L754
$L753:
	sub	DWORD PTR -28+[ebp], 17			; 00000011H
	cmp	DWORD PTR -28+[ebp], 24			; 00000018H
	ja	$L754
	shl	DWORD PTR -28+[ebp], 2
	mov	eax, DWORD PTR -28+[ebp]
	jmp	DWORD PTR $L1019[eax]
$L1019:
	DD	OFFSET $L757
	DD	OFFSET $L754
	DD	OFFSET $L754
	DD	OFFSET $L754
	DD	OFFSET $L754
	DD	OFFSET $L754
	DD	OFFSET $L754
	DD	OFFSET $L754
	DD	OFFSET $L754
	DD	OFFSET $L754
	DD	OFFSET $L754
	DD	OFFSET $L754
	DD	OFFSET $L754
	DD	OFFSET $L757
	DD	OFFSET $L757
	DD	OFFSET $L754
	DD	OFFSET $L757
	DD	OFFSET $L757
	DD	OFFSET $L754
	DD	OFFSET $L754
	DD	OFFSET $L754
	DD	OFFSET $L754
	DD	OFFSET $L757
	DD	OFFSET $L757
	DD	OFFSET $L757
$L754:
; Line 228
	mov	eax, DWORD PTR _code$[ebp]
	push	eax
	call	_rtx_alloc
	add	esp, 4
	mov	DWORD PTR _copy$[ebp], eax
; Line 229
	mov	eax, DWORD PTR _orig$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	shr	eax, 24					; 00000018H
	and	eax, 255				; 000000ffH
	shl	eax, 16					; 00000010H
	mov	ecx, DWORD PTR _copy$[ebp]
	mov	ecx, DWORD PTR [ecx]
	and	ecx, -16711681				; ff00ffffH
	or	eax, ecx
	mov	ecx, DWORD PTR _copy$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 230
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
; Line 231
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
; Line 232
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
; Line 233
	mov	eax, DWORD PTR _orig$[ebp]
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
; Line 235
	mov	eax, DWORD PTR _copy$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	eax, DWORD PTR _rtx_format[eax*4]
	mov	DWORD PTR _format_ptr$[ebp], eax
; Line 237
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L758
$L759:
	inc	DWORD PTR _i$[ebp]
$L758:
	mov	eax, DWORD PTR _copy$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _rtx_length[eax*4], ecx
	jle	$L760
; Line 239
	mov	eax, DWORD PTR _format_ptr$[ebp]
	mov	DWORD PTR -24+[ebp], eax
	inc	DWORD PTR _format_ptr$[ebp]
	mov	eax, DWORD PTR -24+[ebp]
	movsx	eax, BYTE PTR [eax]
	mov	DWORD PTR -32+[ebp], eax
	jmp	$L761
; Line 241
$L765:
; Line 242
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _orig$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _copy$[ebp]
	mov	DWORD PTR [edx+ecx*4+4], eax
; Line 243
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _orig$[ebp]
	cmp	DWORD PTR [ecx+eax*4+4], 0
	je	$L766
; Line 244
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _orig$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	push	eax
	call	_copy_rtx
	add	esp, 4
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _copy$[ebp]
	mov	DWORD PTR [edx+ecx*4+4], eax
; Line 245
$L766:
	jmp	$L762
; Line 247
$L767:
; Line 248
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _orig$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _copy$[ebp]
	mov	DWORD PTR [edx+ecx*4+4], eax
; Line 249
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _orig$[ebp]
	cmp	DWORD PTR [ecx+eax*4+4], 0
	je	$L768
; Line 251
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
; Line 252
	mov	DWORD PTR _j$[ebp], 0
	jmp	$L769
$L770:
	inc	DWORD PTR _j$[ebp]
$L769:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _copy$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$[ebp]
	cmp	DWORD PTR [eax], ecx
	jbe	$L771
; Line 253
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _orig$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	push	eax
	call	_copy_rtx
	add	esp, 4
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _copy$[ebp]
	mov	ecx, DWORD PTR [edx+ecx*4+4]
	mov	edx, DWORD PTR _j$[ebp]
	mov	DWORD PTR [ecx+edx*4+4], eax
	jmp	$L770
$L771:
; Line 255
$L768:
	jmp	$L762
; Line 257
$L772:
; Line 258
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _orig$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _copy$[ebp]
	mov	DWORD PTR [edx+ecx*4+4], eax
; Line 259
	jmp	$L762
; Line 260
	jmp	$L762
$L761:
	cmp	DWORD PTR -32+[ebp], 69			; 00000045H
	je	$L767
	cmp	DWORD PTR -32+[ebp], 101		; 00000065H
	je	$L765
	jmp	$L772
$L762:
; Line 261
	jmp	$L759
$L760:
; Line 262
	mov	eax, DWORD PTR _copy$[ebp]
	jmp	$L747
; Line 263
$L747:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_copy_rtx ENDP
_TEXT	ENDS
EXTRN	_abort:NEAR
EXTRN	__iob:BYTE
EXTRN	_fprintf:NEAR
_BSS	SEGMENT
_outfile$S773 DD 01H DUP (?)
_?indent@?1??print_rtx@@9@9$S780 DD 01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG785	DB	0aH, '%s', 00H
$SG787	DB	'(nil)', 00H
	ORG $+2
$SG788	DB	'(%s', 00H
$SG790	DB	'/s', 00H
	ORG $+1
$SG792	DB	'/v', 00H
	ORG $+1
$SG794	DB	'/u', 00H
	ORG $+1
$SG796	DB	'/i', 00H
	ORG $+1
$SG800	DB	':%s', 00H
$SG802	DB	':%s', 00H
$SG812	DB	' ""', 00H
$SG814	DB	' ("%s")', 00H
$SG818	DB	' ', 00H
	ORG $+2
$SG821	DB	0aH, '%s', 00H
$SG822	DB	'[ ', 00H
	ORG $+1
$SG829	DB	0aH, '%s', 00H
$SG830	DB	'] ', 00H
	ORG $+1
$SG832	DB	' %d', 00H
$SG835	DB	' %s', 00H
$SG837	DB	' %d', 00H
$SG840	DB	' %d', 00H
$SG842	DB	' 0', 00H
	ORG $+1
$SG844	DB	'switch format wrong in rtl.print_rtx(). format was: %c.', 0aH
	DB	00H
	ORG $+3
$SG846	DB	')', 00H
_DATA	ENDS
_TEXT	SEGMENT
_in_rtx$ = 8
_i$ = -8
_j$ = -12
_format_ptr$ = -4
_print_rtx PROC NEAR
; Line 278
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	push	ebx
	push	esi
	push	edi
; Line 283
	cmp	DWORD PTR _sawclose$S775, 0
	je	$L784
; Line 286
	mov	eax, 161				; 000000a1H
	mov	ecx, DWORD PTR _?indent@?1??print_rtx@@9@9$S780
	add	ecx, ecx
	sub	eax, ecx
	add	eax, OFFSET _spaces
	push	eax
	push	OFFSET $SG785
	mov	eax, DWORD PTR _outfile$S773
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 287
	mov	DWORD PTR _sawclose$S775, 0
; Line 290
$L784:
	cmp	DWORD PTR _in_rtx$[ebp], 0
	jne	$L786
; Line 292
	push	OFFSET $SG787
	mov	eax, DWORD PTR _outfile$S773
	push	eax
	call	_fprintf
	add	esp, 8
; Line 293
	mov	DWORD PTR _sawclose$S775, 1
; Line 294
	jmp	$L778
; Line 298
$L786:
	mov	eax, DWORD PTR _in_rtx$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	eax, DWORD PTR _rtx_name[eax*4]
	push	eax
	push	OFFSET $SG788
	mov	eax, DWORD PTR _outfile$S773
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 300
	mov	eax, DWORD PTR _in_rtx$[ebp]
	mov	eax, DWORD PTR [eax]
	shr	eax, 28					; 0000001cH
	test	al, 1
	je	$L789
; Line 301
	push	OFFSET $SG790
	mov	eax, DWORD PTR _outfile$S773
	push	eax
	call	_fprintf
	add	esp, 8
; Line 303
$L789:
	mov	eax, DWORD PTR _in_rtx$[ebp]
	mov	eax, DWORD PTR [eax]
	shr	eax, 27					; 0000001bH
	test	al, 1
	je	$L791
; Line 304
	push	OFFSET $SG792
	mov	eax, DWORD PTR _outfile$S773
	push	eax
	call	_fprintf
	add	esp, 8
; Line 306
$L791:
	mov	eax, DWORD PTR _in_rtx$[ebp]
	mov	eax, DWORD PTR [eax]
	shr	eax, 26					; 0000001aH
	test	al, 1
	je	$L793
; Line 307
	push	OFFSET $SG794
	mov	eax, DWORD PTR _outfile$S773
	push	eax
	call	_fprintf
	add	esp, 8
; Line 309
$L793:
	mov	eax, DWORD PTR _in_rtx$[ebp]
	mov	eax, DWORD PTR [eax]
	shr	eax, 30					; 0000001eH
	test	al, 1
	je	$L795
; Line 310
	push	OFFSET $SG796
	mov	eax, DWORD PTR _outfile$S773
	push	eax
	call	_fprintf
	add	esp, 8
; Line 312
$L795:
	mov	eax, DWORD PTR _in_rtx$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sub	ecx, ecx
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L797
; Line 315
	mov	eax, DWORD PTR _in_rtx$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 131072				; 00020000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L799
	mov	eax, DWORD PTR _in_rtx$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 196608				; 00030000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L798
$L799:
; Line 316
	mov	eax, DWORD PTR _in_rtx$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _reg_note_name[eax]
	push	eax
	push	OFFSET $SG800
	mov	eax, DWORD PTR _outfile$S773
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 317
	jmp	$L801
$L798:
; Line 318
	mov	eax, DWORD PTR _in_rtx$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_name[eax]
	push	eax
	push	OFFSET $SG802
	mov	eax, DWORD PTR _outfile$S773
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
$L801:
; Line 321
$L797:
	mov	eax, DWORD PTR _in_rtx$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	eax, DWORD PTR _rtx_format[eax*4]
	mov	DWORD PTR _format_ptr$[ebp], eax
; Line 323
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L803
$L804:
	inc	DWORD PTR _i$[ebp]
$L803:
	mov	eax, DWORD PTR _in_rtx$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _rtx_length[eax*4], ecx
	jle	$L805
; Line 324
	mov	eax, DWORD PTR _format_ptr$[ebp]
	mov	DWORD PTR -16+[ebp], eax
	inc	DWORD PTR _format_ptr$[ebp]
	mov	eax, DWORD PTR -16+[ebp]
	movsx	eax, BYTE PTR [eax]
	mov	DWORD PTR -20+[ebp], eax
	jmp	$L806
; Line 326
$L810:
; Line 328
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _in_rtx$[ebp]
	cmp	DWORD PTR [ecx+eax*4+4], 0
	jne	$L811
; Line 329
	push	OFFSET $SG812
	mov	eax, DWORD PTR _outfile$S773
	push	eax
	call	_fprintf
	add	esp, 8
; Line 330
	jmp	$L813
$L811:
; Line 331
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _in_rtx$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	push	eax
	push	OFFSET $SG814
	mov	eax, DWORD PTR _outfile$S773
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
$L813:
; Line 332
	mov	DWORD PTR _sawclose$S775, 1
; Line 333
	jmp	$L807
; Line 336
$L815:
; Line 337
	jmp	$L807
; Line 339
$L816:
; Line 340
	add	DWORD PTR _?indent@?1??print_rtx@@9@9$S780, 2
; Line 341
	cmp	DWORD PTR _sawclose$S775, 0
	jne	$L817
; Line 342
	push	OFFSET $SG818
	mov	eax, DWORD PTR _outfile$S773
	push	eax
	call	_fprintf
	add	esp, 8
; Line 343
$L817:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _in_rtx$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	push	eax
	call	_print_rtx
	add	esp, 4
; Line 344
	sub	DWORD PTR _?indent@?1??print_rtx@@9@9$S780, 2
; Line 345
	jmp	$L807
; Line 347
$L819:
; Line 348
	add	DWORD PTR _?indent@?1??print_rtx@@9@9$S780, 2
; Line 349
	cmp	DWORD PTR _sawclose$S775, 0
	je	$L820
; Line 352
	mov	eax, 161				; 000000a1H
	mov	ecx, DWORD PTR _?indent@?1??print_rtx@@9@9$S780
	add	ecx, ecx
	sub	eax, ecx
	add	eax, OFFSET _spaces
	push	eax
	push	OFFSET $SG821
	mov	eax, DWORD PTR _outfile$S773
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 353
	mov	DWORD PTR _sawclose$S775, 0
; Line 355
$L820:
	push	OFFSET $SG822
	mov	eax, DWORD PTR _outfile$S773
	push	eax
	call	_fprintf
	add	esp, 8
; Line 356
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _in_rtx$[ebp]
	cmp	DWORD PTR [ecx+eax*4+4], 0
	je	$L823
; Line 358
	add	DWORD PTR _?indent@?1??print_rtx@@9@9$S780, 2
; Line 359
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _in_rtx$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	cmp	DWORD PTR [eax], 0
	je	$L824
; Line 360
	mov	DWORD PTR _sawclose$S775, 1
; Line 362
$L824:
	mov	DWORD PTR _j$[ebp], 0
	jmp	$L825
$L826:
	inc	DWORD PTR _j$[ebp]
$L825:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _in_rtx$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$[ebp]
	cmp	DWORD PTR [eax], ecx
	jbe	$L827
; Line 363
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _in_rtx$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	push	eax
	call	_print_rtx
	add	esp, 4
	jmp	$L826
$L827:
; Line 365
	sub	DWORD PTR _?indent@?1??print_rtx@@9@9$S780, 2
; Line 367
$L823:
	cmp	DWORD PTR _sawclose$S775, 0
	je	$L828
; Line 369
	mov	eax, 161				; 000000a1H
	mov	ecx, DWORD PTR _?indent@?1??print_rtx@@9@9$S780
	add	ecx, ecx
	sub	eax, ecx
	add	eax, OFFSET _spaces
	push	eax
	push	OFFSET $SG829
	mov	eax, DWORD PTR _outfile$S773
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 371
$L828:
	push	OFFSET $SG830
	mov	eax, DWORD PTR _outfile$S773
	push	eax
	call	_fprintf
	add	esp, 8
; Line 372
	mov	DWORD PTR _sawclose$S775, 1
; Line 373
	sub	DWORD PTR _?indent@?1??print_rtx@@9@9$S780, 2
; Line 374
	jmp	$L807
; Line 376
$L831:
; Line 377
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _in_rtx$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	push	eax
	push	OFFSET $SG832
	mov	eax, DWORD PTR _outfile$S773
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 378
	mov	DWORD PTR _sawclose$S775, 0
; Line 379
	jmp	$L807
; Line 383
$L833:
; Line 384
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _in_rtx$[ebp]
	cmp	DWORD PTR [ecx+eax*4+4], 0
	jg	$L834
; Line 385
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _in_rtx$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	shl	eax, 2
	neg	eax
	mov	eax, DWORD PTR _note_insn_name[eax]
	push	eax
	push	OFFSET $SG835
	mov	eax, DWORD PTR _outfile$S773
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 386
	jmp	$L836
$L834:
; Line 387
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _in_rtx$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	push	eax
	push	OFFSET $SG837
	mov	eax, DWORD PTR _outfile$S773
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
$L836:
; Line 388
	mov	DWORD PTR _sawclose$S775, 0
; Line 389
	jmp	$L807
; Line 391
$L838:
; Line 392
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _in_rtx$[ebp]
	cmp	DWORD PTR [ecx+eax*4+4], 0
	je	$L839
; Line 393
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _in_rtx$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	OFFSET $SG840
	mov	eax, DWORD PTR _outfile$S773
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 394
	jmp	$L841
$L839:
; Line 395
	push	OFFSET $SG842
	mov	eax, DWORD PTR _outfile$S773
	push	eax
	call	_fprintf
	add	esp, 8
$L841:
; Line 396
	mov	DWORD PTR _sawclose$S775, 0
; Line 397
	jmp	$L807
; Line 399
$L843:
; Line 402
	mov	eax, DWORD PTR _format_ptr$[ebp]
	movsx	eax, BYTE PTR [eax-1]
	push	eax
	push	OFFSET $SG844
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 403
	call	_abort
; Line 404
	jmp	$L807
$L806:
	cmp	DWORD PTR -20+[ebp], 105		; 00000069H
	jg	$L1020
	je	$L831
	cmp	DWORD PTR -20+[ebp], 48			; 00000030H
	je	$L807
	cmp	DWORD PTR -20+[ebp], 69			; 00000045H
	je	$L819
	cmp	DWORD PTR -20+[ebp], 83			; 00000053H
	je	$L810
	cmp	DWORD PTR -20+[ebp], 101		; 00000065H
	je	$L816
	jmp	$L843
$L1020:
	cmp	DWORD PTR -20+[ebp], 110		; 0000006eH
	je	$L833
	cmp	DWORD PTR -20+[ebp], 115		; 00000073H
	je	$L810
	cmp	DWORD PTR -20+[ebp], 117		; 00000075H
	je	$L838
	jmp	$L843
$L807:
	jmp	$L804
$L805:
; Line 406
	push	OFFSET $SG846
	mov	eax, DWORD PTR _outfile$S773
	push	eax
	call	_fprintf
	add	esp, 8
; Line 407
	mov	DWORD PTR _sawclose$S775, 1
; Line 408
$L778:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_print_rtx ENDP
_TEXT	ENDS
PUBLIC	_debug_rtx
_DATA	SEGMENT
	ORG $+2
$SG850	DB	0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_x$ = 8
_debug_rtx PROC NEAR
; Line 415
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 416
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	mov	DWORD PTR _outfile$S773, eax
; Line 417
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_print_rtx
	add	esp, 4
; Line 418
	push	OFFSET $SG850
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 8
; Line 419
$L849:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_debug_rtx ENDP
_TEXT	ENDS
PUBLIC	_print_rtl
_DATA	SEGMENT
	ORG $+2
$SG864	DB	0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_outf$ = 8
_rtx_first$ = 12
_tmp_rtx$ = -4
_print_rtl PROC NEAR
; Line 431
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 434
	mov	eax, DWORD PTR _outf$[ebp]
	mov	DWORD PTR _outfile$S773, eax
; Line 435
	mov	DWORD PTR _sawclose$S775, 0
; Line 437
	mov	eax, DWORD PTR _rtx_first$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR -8+[ebp], eax
	jmp	$L856
; Line 439
$L860:
; Line 445
	mov	eax, DWORD PTR _rtx_first$[ebp]
	mov	DWORD PTR _tmp_rtx$[ebp], eax
	jmp	$L861
$L862:
	mov	eax, DWORD PTR _tmp_rtx$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _tmp_rtx$[ebp], eax
$L861:
	cmp	DWORD PTR _tmp_rtx$[ebp], 0
	je	$L863
; Line 447
	mov	eax, DWORD PTR _tmp_rtx$[ebp]
	push	eax
	call	_print_rtx
	add	esp, 4
; Line 448
	push	OFFSET $SG864
	mov	eax, DWORD PTR _outfile$S773
	push	eax
	call	_fprintf
	add	esp, 8
; Line 449
	jmp	$L862
$L863:
; Line 450
	jmp	$L857
; Line 452
$L865:
; Line 453
	mov	eax, DWORD PTR _rtx_first$[ebp]
	push	eax
	call	_print_rtx
	add	esp, 4
; Line 454
	jmp	$L857
$L856:
	cmp	DWORD PTR -8+[ebp], 13			; 0000000dH
	jl	$L865
	cmp	DWORD PTR -8+[ebp], 18			; 00000012H
	jle	$L860
	jmp	$L865
$L857:
; Line 455
$L854:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_print_rtl ENDP
_TEXT	ENDS
EXTRN	_ftell:NEAR
EXTRN	__filbuf:NEAR
EXTRN	__flsbuf:NEAR
_DATA	SEGMENT
	ORG $+2
$SG874	DB	'Expected character %c.  Found character %c.', 00H
$SG875	DB	'  At file position: %ld', 0aH, 00H
	ORG $+3
$SG876	DB	'Following characters are:', 0aH, 09H, 00H
$SG881	DB	'Aborting.', 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_expected_c$ = 8
_actual_c$ = 12
_infile$ = 16
_c$ = -8
_i$ = -4
_dump_and_abort PROC NEAR
; Line 466
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 469
	cmp	DWORD PTR _expected_c$[ebp], 0
	jl	$L873
; Line 472
	mov	eax, DWORD PTR _actual_c$[ebp]
	push	eax
	mov	eax, DWORD PTR _expected_c$[ebp]
	push	eax
	push	OFFSET $SG874
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
; Line 473
$L873:
	mov	eax, DWORD PTR _infile$[ebp]
	push	eax
	call	_ftell
	add	esp, 4
	push	eax
	push	OFFSET $SG875
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 474
	push	OFFSET $SG876
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 8
; Line 475
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L877
$L878:
	inc	DWORD PTR _i$[ebp]
$L877:
	cmp	DWORD PTR _i$[ebp], 200			; 000000c8H
	jge	$L879
; Line 477
	mov	eax, DWORD PTR _infile$[ebp]
	dec	DWORD PTR [eax+4]
	mov	eax, DWORD PTR _infile$[ebp]
	cmp	DWORD PTR [eax+4], 0
	jl	$L1021
	mov	eax, DWORD PTR _infile$[ebp]
	mov	eax, DWORD PTR [eax]
	movsx	eax, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _c$[ebp], eax
	mov	eax, DWORD PTR _infile$[ebp]
	inc	DWORD PTR [eax]
	jmp	$L1022
$L1021:
	mov	eax, DWORD PTR _infile$[ebp]
	push	eax
	call	__filbuf
	add	esp, 4
	mov	DWORD PTR _c$[ebp], eax
$L1022:
; Line 478
	cmp	DWORD PTR _c$[ebp], -1
	jne	$L880
	jmp	$L879
; Line 479
$L880:
	dec	DWORD PTR __iob+68
	js	$L1023
	mov	al, BYTE PTR _c$[ebp]
	mov	ecx, DWORD PTR __iob+64
	mov	BYTE PTR [ecx], al
	inc	DWORD PTR __iob+64
	jmp	$L1024
$L1023:
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	mov	eax, DWORD PTR _c$[ebp]
	push	eax
	call	__flsbuf
	add	esp, 8
$L1024:
; Line 480
	jmp	$L878
$L879:
; Line 481
	push	OFFSET $SG881
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 8
; Line 482
	call	_abort
; Line 483
$L870:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_dump_and_abort ENDP
_TEXT	ENDS
PUBLIC	_read_skip_spaces
_TEXT	SEGMENT
_prevc$898 = -8
_infile$ = 8
_c$ = -4
_read_skip_spaces PROC NEAR
; Line 493
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 495
$L887:
	mov	eax, DWORD PTR _infile$[ebp]
	dec	DWORD PTR [eax+4]
	mov	eax, DWORD PTR _infile$[ebp]
	cmp	DWORD PTR [eax+4], 0
	jl	$L1025
	mov	eax, DWORD PTR _infile$[ebp]
	mov	eax, DWORD PTR [eax]
	movsx	eax, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _c$[ebp], eax
	mov	eax, DWORD PTR _infile$[ebp]
	inc	DWORD PTR [eax]
	jmp	$L1026
$L1025:
	mov	eax, DWORD PTR _infile$[ebp]
	push	eax
	call	__filbuf
	add	esp, 4
	mov	DWORD PTR _c$[ebp], eax
$L1026:
	cmp	DWORD PTR _c$[ebp], 0
	je	$L888
; Line 497
	cmp	DWORD PTR _c$[ebp], 32			; 00000020H
	je	$L890
	cmp	DWORD PTR _c$[ebp], 10			; 0000000aH
	je	$L890
	cmp	DWORD PTR _c$[ebp], 9
	je	$L890
	cmp	DWORD PTR _c$[ebp], 12			; 0000000cH
	jne	$L889
$L890:
; Line 499
	jmp	$L891
$L889:
	cmp	DWORD PTR _c$[ebp], 59			; 0000003bH
	jne	$L892
; Line 501
$L894:
	mov	eax, DWORD PTR _infile$[ebp]
	dec	DWORD PTR [eax+4]
	mov	eax, DWORD PTR _infile$[ebp]
	cmp	DWORD PTR [eax+4], 0
	jl	$L1027
	mov	eax, DWORD PTR _infile$[ebp]
	mov	eax, DWORD PTR [eax]
	movsx	eax, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _c$[ebp], eax
	mov	eax, DWORD PTR _infile$[ebp]
	inc	DWORD PTR [eax]
	jmp	$L1028
$L1027:
	mov	eax, DWORD PTR _infile$[ebp]
	push	eax
	call	__filbuf
	add	esp, 4
	mov	DWORD PTR _c$[ebp], eax
$L1028:
	cmp	DWORD PTR _c$[ebp], 0
	je	$L895
	cmp	DWORD PTR _c$[ebp], 10			; 0000000aH
	je	$L895
	jmp	$L894
$L895:
; Line 503
	jmp	$L896
$L892:
	cmp	DWORD PTR _c$[ebp], 47			; 0000002fH
	jne	$L897
; Line 506
	mov	eax, DWORD PTR _infile$[ebp]
	dec	DWORD PTR [eax+4]
	mov	eax, DWORD PTR _infile$[ebp]
	cmp	DWORD PTR [eax+4], 0
	jl	$L1029
	mov	eax, DWORD PTR _infile$[ebp]
	mov	eax, DWORD PTR [eax]
	movsx	eax, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _c$[ebp], eax
	mov	eax, DWORD PTR _infile$[ebp]
	inc	DWORD PTR [eax]
	jmp	$L1030
$L1029:
	mov	eax, DWORD PTR _infile$[ebp]
	push	eax
	call	__filbuf
	add	esp, 4
	mov	DWORD PTR _c$[ebp], eax
$L1030:
; Line 507
	cmp	DWORD PTR _c$[ebp], 42			; 0000002aH
	je	$L899
; Line 508
	mov	eax, DWORD PTR _infile$[ebp]
	push	eax
	mov	eax, DWORD PTR _c$[ebp]
	push	eax
	push	42					; 0000002aH
	call	_dump_and_abort
	add	esp, 12					; 0000000cH
; Line 510
$L899:
	mov	DWORD PTR _prevc$898[ebp], 0
; Line 511
$L901:
	mov	eax, DWORD PTR _infile$[ebp]
	dec	DWORD PTR [eax+4]
	mov	eax, DWORD PTR _infile$[ebp]
	cmp	DWORD PTR [eax+4], 0
	jl	$L1031
	mov	eax, DWORD PTR _infile$[ebp]
	mov	eax, DWORD PTR [eax]
	movsx	eax, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _c$[ebp], eax
	mov	eax, DWORD PTR _infile$[ebp]
	inc	DWORD PTR [eax]
	jmp	$L1032
$L1031:
	mov	eax, DWORD PTR _infile$[ebp]
	push	eax
	call	__filbuf
	add	esp, 4
	mov	DWORD PTR _c$[ebp], eax
$L1032:
	cmp	DWORD PTR _c$[ebp], 0
	je	$L902
; Line 513
	cmp	DWORD PTR _prevc$898[ebp], 42		; 0000002aH
	jne	$L903
	cmp	DWORD PTR _c$[ebp], 47			; 0000002fH
	jne	$L903
; Line 514
	jmp	$L902
; Line 515
$L903:
	mov	eax, DWORD PTR _c$[ebp]
	mov	DWORD PTR _prevc$898[ebp], eax
; Line 516
	jmp	$L901
$L902:
; Line 518
	jmp	$L904
$L897:
	jmp	$L888
$L904:
$L896:
$L891:
; Line 519
	jmp	$L887
$L888:
; Line 520
	mov	eax, DWORD PTR _c$[ebp]
	jmp	$L884
; Line 521
$L884:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_read_skip_spaces ENDP
_TEXT	ENDS
EXTRN	_ungetc:NEAR
_DATA	SEGMENT
	ORG $+1
$SG919	DB	'missing name or number', 00H
_DATA	ENDS
_TEXT	SEGMENT
_str$ = 8
_infile$ = 12
_p$ = -8
_c$ = -4
_read_name PROC NEAR
; Line 530
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 534
	mov	eax, DWORD PTR _infile$[ebp]
	push	eax
	call	_read_skip_spaces
	add	esp, 4
	mov	DWORD PTR _c$[ebp], eax
; Line 536
	mov	eax, DWORD PTR _str$[ebp]
	mov	DWORD PTR _p$[ebp], eax
; Line 537
$L912:
; Line 539
	cmp	DWORD PTR _c$[ebp], 32			; 00000020H
	je	$L915
	cmp	DWORD PTR _c$[ebp], 10			; 0000000aH
	je	$L915
	cmp	DWORD PTR _c$[ebp], 9
	je	$L915
	cmp	DWORD PTR _c$[ebp], 12			; 0000000cH
	jne	$L914
$L915:
; Line 540
	jmp	$L913
; Line 541
$L914:
; Line 542
	cmp	DWORD PTR _c$[ebp], 58			; 0000003aH
	je	$L917
	cmp	DWORD PTR _c$[ebp], 41			; 00000029H
	je	$L917
	cmp	DWORD PTR _c$[ebp], 93			; 0000005dH
	je	$L917
	cmp	DWORD PTR _c$[ebp], 34			; 00000022H
	je	$L917
	cmp	DWORD PTR _c$[ebp], 47			; 0000002fH
	je	$L917
	cmp	DWORD PTR _c$[ebp], 40			; 00000028H
	je	$L917
	cmp	DWORD PTR _c$[ebp], 91			; 0000005bH
	jne	$L916
$L917:
; Line 544
	mov	eax, DWORD PTR _infile$[ebp]
	push	eax
	mov	eax, DWORD PTR _c$[ebp]
	push	eax
	call	_ungetc
	add	esp, 8
; Line 545
	jmp	$L913
; Line 547
$L916:
	mov	al, BYTE PTR _c$[ebp]
	mov	ecx, DWORD PTR _p$[ebp]
	mov	BYTE PTR [ecx], al
	inc	DWORD PTR _p$[ebp]
; Line 548
	mov	eax, DWORD PTR _infile$[ebp]
	dec	DWORD PTR [eax+4]
	mov	eax, DWORD PTR _infile$[ebp]
	cmp	DWORD PTR [eax+4], 0
	jl	$L1033
	mov	eax, DWORD PTR _infile$[ebp]
	mov	eax, DWORD PTR [eax]
	movsx	eax, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _c$[ebp], eax
	mov	eax, DWORD PTR _infile$[ebp]
	inc	DWORD PTR [eax]
	jmp	$L1034
$L1033:
	mov	eax, DWORD PTR _infile$[ebp]
	push	eax
	call	__filbuf
	add	esp, 4
	mov	DWORD PTR _c$[ebp], eax
$L1034:
; Line 549
	jmp	$L912
$L913:
; Line 550
	mov	eax, DWORD PTR _str$[ebp]
	cmp	DWORD PTR _p$[ebp], eax
	jne	$L918
; Line 552
	push	OFFSET $SG919
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 8
; Line 553
	mov	eax, DWORD PTR _infile$[ebp]
	push	eax
	push	-1
	push	-1
	call	_dump_and_abort
	add	esp, 12					; 0000000cH
; Line 556
$L918:
	mov	eax, DWORD PTR _p$[ebp]
	mov	BYTE PTR [eax], 0
; Line 557
$L908:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_read_name ENDP
_TEXT	ENDS
PUBLIC	_read_rtx
EXTRN	_alloca:NEAR
EXTRN	_xrealloc:NEAR
EXTRN	_strcpy:NEAR
EXTRN	_atoi:NEAR
EXTRN	_strcmp:NEAR
EXTRN	_xmalloc:NEAR
_DATA	SEGMENT
	ORG $+1
$SG940	DB	'Unknown rtx read in rtl.read_rtx(). Code name was %s .', 00H
	ORG $+1
$SG992	DB	'\n\t', 00H
	ORG $+3
$SG1000	DB	'switch format wrong in rtl.read_rtx(). format was: %c.', 0aH
	DB	00H
$SG1001	DB	09H, 'file position: %ld', 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_next_rtx$962 = -300
_rtx_list_link$963 = -296
_list_rtx$964 = -304
_saw_paren$979 = -316
_stringbuf$980 = -312
_stringbufsize$981 = -308
_infile$ = 8
_i$ = -8
_j$ = -288
_list_counter$ = -280
_tmp_code$ = -284
_format_ptr$ = -4
_tmp_char$ = -276
_return_rtx$ = -20
_c$ = -12
_tmp_int$ = -16
_k$946 = -292
_read_rtx PROC NEAR
; Line 567
	push	ebp
	mov	ebp, esp
	sub	esp, 324				; 00000144H
	push	ebx
	push	esi
	push	edi
; Line 586
	mov	eax, DWORD PTR _infile$[ebp]
	push	eax
	call	_read_skip_spaces
	add	esp, 4
	mov	DWORD PTR _c$[ebp], eax
; Line 587
	cmp	DWORD PTR _c$[ebp], 40			; 00000028H
	je	$L933
; Line 588
	mov	eax, DWORD PTR _infile$[ebp]
	push	eax
	mov	eax, DWORD PTR _c$[ebp]
	push	eax
	push	40					; 00000028H
	call	_dump_and_abort
	add	esp, 12					; 0000000cH
; Line 590
$L933:
	mov	eax, DWORD PTR _infile$[ebp]
	push	eax
	lea	eax, DWORD PTR _tmp_char$[ebp]
	push	eax
	call	_read_name
	add	esp, 8
; Line 592
	mov	DWORD PTR _tmp_code$[ebp], 0
; Line 594
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L934
$L935:
	inc	DWORD PTR _i$[ebp]
$L934:
	cmp	DWORD PTR _i$[ebp], 91			; 0000005bH
	jge	$L936
; Line 596
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _rtx_name[eax*4]
	push	eax
	lea	eax, DWORD PTR _tmp_char$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L938
; Line 598
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _tmp_code$[ebp], eax
; Line 599
	jmp	$L936
; Line 601
$L938:
	jmp	$L935
$L936:
; Line 602
	cmp	DWORD PTR _tmp_code$[ebp], 0
	jne	$L939
; Line 606
	lea	eax, DWORD PTR _tmp_char$[ebp]
	push	eax
	push	OFFSET $SG940
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 609
$L939:
	cmp	DWORD PTR _tmp_code$[ebp], 1
	jne	$L941
; Line 612
$L943:
	mov	eax, DWORD PTR _infile$[ebp]
	dec	DWORD PTR [eax+4]
	mov	eax, DWORD PTR _infile$[ebp]
	cmp	DWORD PTR [eax+4], 0
	jl	$L1035
	mov	eax, DWORD PTR _infile$[ebp]
	mov	eax, DWORD PTR [eax]
	movsx	eax, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _c$[ebp], eax
	mov	eax, DWORD PTR _infile$[ebp]
	inc	DWORD PTR [eax]
	jmp	$L1036
$L1035:
	mov	eax, DWORD PTR _infile$[ebp]
	push	eax
	call	__filbuf
	add	esp, 4
	mov	DWORD PTR _c$[ebp], eax
$L1036:
	cmp	DWORD PTR _c$[ebp], 0
	je	$L944
	cmp	DWORD PTR _c$[ebp], 41			; 00000029H
	je	$L944
	jmp	$L943
$L944:
; Line 613
	sub	eax, eax
	jmp	$L922
; Line 616
$L941:
	mov	eax, DWORD PTR _tmp_code$[ebp]
	push	eax
	call	_rtx_alloc
	add	esp, 4
	mov	DWORD PTR _return_rtx$[ebp], eax
; Line 618
	mov	eax, DWORD PTR _return_rtx$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	eax, DWORD PTR _rtx_format[eax*4]
	mov	DWORD PTR _format_ptr$[ebp], eax
; Line 623
	mov	eax, DWORD PTR _infile$[ebp]
	push	eax
	call	_read_skip_spaces
	add	esp, 4
	mov	DWORD PTR _i$[ebp], eax
; Line 624
	cmp	DWORD PTR _i$[ebp], 58			; 0000003aH
	jne	$L945
; Line 627
	mov	eax, DWORD PTR _infile$[ebp]
	push	eax
	lea	eax, DWORD PTR _tmp_char$[ebp]
	push	eax
	call	_read_name
	add	esp, 8
; Line 628
	mov	DWORD PTR _k$946[ebp], 0
	jmp	$L947
$L948:
	inc	DWORD PTR _k$946[ebp]
$L947:
	cmp	DWORD PTR _k$946[ebp], 28		; 0000001cH
	jge	$L949
; Line 629
	lea	eax, DWORD PTR _tmp_char$[ebp]
	push	eax
	mov	eax, DWORD PTR _k$946[ebp]
	mov	eax, DWORD PTR _mode_name[eax*4]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L950
; Line 630
	jmp	$L949
; Line 632
$L950:
	jmp	$L948
$L949:
	mov	eax, DWORD PTR _return_rtx$[ebp]
	mov	eax, DWORD PTR [eax]
	and	eax, -16711681				; ff00ffffH
	mov	ecx, DWORD PTR _k$946[ebp]
	and	ecx, 255				; 000000ffH
	shl	ecx, 16					; 00000010H
	or	eax, ecx
	mov	ecx, DWORD PTR _return_rtx$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 634
	jmp	$L951
$L945:
; Line 635
	mov	eax, DWORD PTR _infile$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	call	_ungetc
	add	esp, 8
$L951:
; Line 637
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L952
$L953:
	inc	DWORD PTR _i$[ebp]
$L952:
	mov	eax, DWORD PTR _return_rtx$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _rtx_length[eax*4], ecx
	jle	$L954
; Line 638
	mov	eax, DWORD PTR _format_ptr$[ebp]
	mov	DWORD PTR -320+[ebp], eax
	inc	DWORD PTR _format_ptr$[ebp]
	mov	eax, DWORD PTR -320+[ebp]
	movsx	eax, BYTE PTR [eax]
	mov	DWORD PTR -324+[ebp], eax
	jmp	$L955
; Line 642
$L959:
; Line 643
	jmp	$L956
; Line 645
$L960:
; Line 647
	mov	eax, DWORD PTR _infile$[ebp]
	push	eax
	call	_read_rtx
	add	esp, 4
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _return_rtx$[ebp]
	mov	DWORD PTR [edx+ecx*4+4], eax
; Line 648
	jmp	$L956
; Line 650
$L961:
; Line 655
	mov	eax, DWORD PTR _infile$[ebp]
	push	eax
	call	_read_skip_spaces
	add	esp, 4
	mov	DWORD PTR _c$[ebp], eax
; Line 656
	cmp	DWORD PTR _c$[ebp], 91			; 0000005bH
	je	$L965
; Line 657
	mov	eax, DWORD PTR _infile$[ebp]
	push	eax
	mov	eax, DWORD PTR _c$[ebp]
	push	eax
	push	91					; 0000005bH
	call	_dump_and_abort
	add	esp, 12					; 0000000cH
; Line 660
$L965:
	mov	DWORD PTR _next_rtx$962[ebp], 0
; Line 661
	mov	DWORD PTR _list_counter$[ebp], 0
; Line 662
$L967:
	mov	eax, DWORD PTR _infile$[ebp]
	push	eax
	call	_read_skip_spaces
	add	esp, 4
	mov	DWORD PTR _c$[ebp], eax
	cmp	DWORD PTR _c$[ebp], 0
	je	$L968
	cmp	DWORD PTR _c$[ebp], 93			; 0000005dH
	je	$L968
; Line 664
	mov	eax, DWORD PTR _infile$[ebp]
	push	eax
	mov	eax, DWORD PTR _c$[ebp]
	push	eax
	call	_ungetc
	add	esp, 8
; Line 665
	inc	DWORD PTR _list_counter$[ebp]
; Line 667
	push	8
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _rtx_list_link$963[ebp], eax
; Line 668
	mov	eax, DWORD PTR _infile$[ebp]
	push	eax
	call	_read_rtx
	add	esp, 4
	mov	ecx, DWORD PTR _rtx_list_link$963[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 669
	cmp	DWORD PTR _next_rtx$962[ebp], 0
	jne	$L970
; Line 670
	mov	eax, DWORD PTR _rtx_list_link$963[ebp]
	mov	DWORD PTR _list_rtx$964[ebp], eax
; Line 671
	jmp	$L971
$L970:
; Line 672
	mov	eax, DWORD PTR _rtx_list_link$963[ebp]
	mov	ecx, DWORD PTR _next_rtx$962[ebp]
	mov	DWORD PTR [ecx], eax
$L971:
; Line 673
	mov	eax, DWORD PTR _rtx_list_link$963[ebp]
	mov	DWORD PTR _next_rtx$962[ebp], eax
; Line 674
	mov	eax, DWORD PTR _rtx_list_link$963[ebp]
	mov	DWORD PTR [eax], 0
; Line 675
	jmp	$L967
$L968:
; Line 679
	cmp	DWORD PTR _list_counter$[ebp], 0
	je	$L1037
	mov	eax, DWORD PTR _list_counter$[ebp]
	push	eax
	call	_rtvec_alloc
	add	esp, 4
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _return_rtx$[ebp]
	mov	DWORD PTR [edx+ecx*4+4], eax
	jmp	$L1038
$L1037:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _return_rtx$[ebp]
	mov	DWORD PTR [ecx+eax*4+4], 0
$L1038:
; Line 680
	cmp	DWORD PTR _list_counter$[ebp], 0
	jle	$L972
; Line 682
	mov	eax, DWORD PTR _list_rtx$964[ebp]
	mov	DWORD PTR _next_rtx$962[ebp], eax
; Line 684
	mov	DWORD PTR _j$[ebp], 0
	jmp	$L973
$L974:
	inc	DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR _next_rtx$962[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _next_rtx$962[ebp], eax
$L973:
	mov	eax, DWORD PTR _j$[ebp]
	cmp	DWORD PTR _list_counter$[ebp], eax
	jle	$L975
; Line 685
	mov	eax, DWORD PTR _next_rtx$962[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _return_rtx$[ebp]
	mov	ecx, DWORD PTR [edx+ecx*4+4]
	mov	edx, DWORD PTR _j$[ebp]
	mov	DWORD PTR [ecx+edx*4+4], eax
	jmp	$L974
$L975:
; Line 688
$L972:
; Line 689
	jmp	$L956
; Line 691
$L976:
; Line 694
	mov	eax, DWORD PTR _infile$[ebp]
	push	eax
	call	_read_skip_spaces
	add	esp, 4
	mov	DWORD PTR _c$[ebp], eax
; Line 695
	mov	eax, DWORD PTR _infile$[ebp]
	push	eax
	mov	eax, DWORD PTR _c$[ebp]
	push	eax
	call	_ungetc
	add	esp, 8
; Line 696
	cmp	DWORD PTR _c$[ebp], 41			; 00000029H
	jne	$L977
; Line 698
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _return_rtx$[ebp]
	mov	DWORD PTR [ecx+eax*4+4], 0
; Line 699
	jmp	$L956
; Line 702
$L977:
$L978:
; Line 704
	mov	DWORD PTR _saw_paren$979[ebp], 0
; Line 708
	mov	eax, DWORD PTR _infile$[ebp]
	push	eax
	call	_read_skip_spaces
	add	esp, 4
	mov	DWORD PTR _c$[ebp], eax
; Line 709
	cmp	DWORD PTR _c$[ebp], 40			; 00000028H
	jne	$L982
; Line 711
	mov	DWORD PTR _saw_paren$979[ebp], 1
; Line 712
	mov	eax, DWORD PTR _infile$[ebp]
	push	eax
	call	_read_skip_spaces
	add	esp, 4
	mov	DWORD PTR _c$[ebp], eax
; Line 714
$L982:
	cmp	DWORD PTR _c$[ebp], 34			; 00000022H
	je	$L983
; Line 715
	mov	eax, DWORD PTR _infile$[ebp]
	push	eax
	mov	eax, DWORD PTR _c$[ebp]
	push	eax
	push	34					; 00000022H
	call	_dump_and_abort
	add	esp, 12					; 0000000cH
; Line 716
$L983:
	mov	DWORD PTR _j$[ebp], 0
; Line 717
	mov	DWORD PTR _stringbufsize$981[ebp], 10	; 0000000aH
; Line 718
	mov	eax, DWORD PTR _stringbufsize$981[ebp]
	inc	eax
	push	eax
	call	_xmalloc
	add	esp, 4
	mov	DWORD PTR _stringbuf$980[ebp], eax
; Line 720
$L985:
; Line 722
	mov	eax, DWORD PTR _stringbufsize$981[ebp]
	sub	eax, 4
	cmp	eax, DWORD PTR _j$[ebp]
	jg	$L987
; Line 724
	shl	DWORD PTR _stringbufsize$981[ebp], 1
; Line 725
	mov	eax, DWORD PTR _stringbufsize$981[ebp]
	inc	eax
	push	eax
	mov	eax, DWORD PTR _stringbuf$980[ebp]
	push	eax
	call	_xrealloc
	add	esp, 8
	mov	DWORD PTR _stringbuf$980[ebp], eax
; Line 727
$L987:
	mov	eax, DWORD PTR _infile$[ebp]
	dec	DWORD PTR [eax+4]
	mov	eax, DWORD PTR _infile$[ebp]
	cmp	DWORD PTR [eax+4], 0
	jl	$L1039
	mov	eax, DWORD PTR _infile$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	al, BYTE PTR [eax]
	mov	ecx, DWORD PTR _j$[ebp]
	mov	edx, DWORD PTR _stringbuf$980[ebp]
	mov	BYTE PTR [ecx+edx], al
	mov	eax, DWORD PTR _infile$[ebp]
	inc	DWORD PTR [eax]
	jmp	$L1040
$L1039:
	mov	eax, DWORD PTR _infile$[ebp]
	push	eax
	call	__filbuf
	add	esp, 4
	mov	ecx, DWORD PTR _j$[ebp]
	mov	edx, DWORD PTR _stringbuf$980[ebp]
	mov	BYTE PTR [ecx+edx], al
$L1040:
; Line 728
	mov	eax, DWORD PTR _j$[ebp]
	mov	ecx, DWORD PTR _stringbuf$980[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 92					; 0000005cH
	jne	$L989
; Line 730
	mov	eax, DWORD PTR _infile$[ebp]
	dec	DWORD PTR [eax+4]
	mov	eax, DWORD PTR _infile$[ebp]
	cmp	DWORD PTR [eax+4], 0
	jl	$L1041
	mov	eax, DWORD PTR _infile$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	al, BYTE PTR [eax]
	mov	ecx, DWORD PTR _j$[ebp]
	mov	edx, DWORD PTR _stringbuf$980[ebp]
	mov	BYTE PTR [ecx+edx], al
	mov	eax, DWORD PTR _infile$[ebp]
	inc	DWORD PTR [eax]
	jmp	$L1042
$L1041:
	mov	eax, DWORD PTR _infile$[ebp]
	push	eax
	call	__filbuf
	add	esp, 4
	mov	ecx, DWORD PTR _j$[ebp]
	mov	edx, DWORD PTR _stringbuf$980[ebp]
	mov	BYTE PTR [ecx+edx], al
$L1042:
; Line 733
	mov	eax, DWORD PTR _j$[ebp]
	mov	ecx, DWORD PTR _stringbuf$980[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 59					; 0000003bH
	jne	$L990
; Line 735
	push	OFFSET $SG992
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, DWORD PTR _stringbuf$980[ebp]
	push	eax
	call	_strcpy
	add	esp, 8
; Line 736
	add	DWORD PTR _j$[ebp], 3
; Line 738
$L990:
; Line 739
	jmp	$L993
$L989:
	mov	eax, DWORD PTR _j$[ebp]
	mov	ecx, DWORD PTR _stringbuf$980[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 34					; 00000022H
	jne	$L994
; Line 740
	jmp	$L986
; Line 741
$L994:
$L993:
	inc	DWORD PTR _j$[ebp]
; Line 742
	jmp	$L985
$L986:
; Line 744
	mov	eax, DWORD PTR _j$[ebp]
	mov	ecx, DWORD PTR _stringbuf$980[ebp]
	mov	BYTE PTR [eax+ecx], 0
; Line 745
	mov	eax, DWORD PTR _j$[ebp]
	inc	eax
	push	eax
	mov	eax, DWORD PTR _stringbuf$980[ebp]
	push	eax
	call	_xrealloc
	add	esp, 8
	mov	DWORD PTR _stringbuf$980[ebp], eax
; Line 747
	cmp	DWORD PTR _saw_paren$979[ebp], 0
	je	$L995
; Line 749
	mov	eax, DWORD PTR _infile$[ebp]
	push	eax
	call	_read_skip_spaces
	add	esp, 4
	mov	DWORD PTR _c$[ebp], eax
; Line 750
	cmp	DWORD PTR _c$[ebp], 41			; 00000029H
	je	$L996
; Line 751
	mov	eax, DWORD PTR _infile$[ebp]
	push	eax
	mov	eax, DWORD PTR _c$[ebp]
	push	eax
	push	41					; 00000029H
	call	_dump_and_abort
	add	esp, 12					; 0000000cH
; Line 752
$L996:
; Line 753
$L995:
	mov	eax, DWORD PTR _stringbuf$980[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _return_rtx$[ebp]
	mov	DWORD PTR [edx+ecx*4+4], eax
; Line 755
	jmp	$L956
; Line 757
$L997:
; Line 759
	mov	eax, DWORD PTR _infile$[ebp]
	push	eax
	lea	eax, DWORD PTR _tmp_char$[ebp]
	push	eax
	call	_read_name
	add	esp, 8
; Line 760
	lea	eax, DWORD PTR _tmp_char$[ebp]
	push	eax
	call	_atoi
	add	esp, 4
	mov	DWORD PTR _tmp_int$[ebp], eax
; Line 761
	mov	eax, DWORD PTR _tmp_int$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _return_rtx$[ebp]
	mov	DWORD PTR [edx+ecx*4+4], eax
; Line 762
	jmp	$L956
; Line 764
$L999:
; Line 767
	mov	eax, DWORD PTR _format_ptr$[ebp]
	movsx	eax, BYTE PTR [eax-1]
	push	eax
	push	OFFSET $SG1000
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 768
	mov	eax, DWORD PTR _infile$[ebp]
	push	eax
	call	_ftell
	add	esp, 4
	push	eax
	push	OFFSET $SG1001
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 769
	call	_abort
; Line 770
	jmp	$L956
$L955:
	cmp	DWORD PTR -324+[ebp], 105		; 00000069H
	jg	$L1043
	je	$L997
	cmp	DWORD PTR -324+[ebp], 48		; 00000030H
	je	$L956
	cmp	DWORD PTR -324+[ebp], 69		; 00000045H
	je	$L961
	cmp	DWORD PTR -324+[ebp], 83		; 00000053H
	je	$L976
	cmp	DWORD PTR -324+[ebp], 101		; 00000065H
	je	$L960
	jmp	$L999
$L1043:
	cmp	DWORD PTR -324+[ebp], 110		; 0000006eH
	je	$L997
	cmp	DWORD PTR -324+[ebp], 115		; 00000073H
	je	$L978
	cmp	DWORD PTR -324+[ebp], 117		; 00000075H
	je	$L960
	jmp	$L999
$L956:
	jmp	$L953
$L954:
; Line 772
	mov	eax, DWORD PTR _infile$[ebp]
	push	eax
	call	_read_skip_spaces
	add	esp, 4
	mov	DWORD PTR _c$[ebp], eax
; Line 773
	cmp	DWORD PTR _c$[ebp], 41			; 00000029H
	je	$L1002
; Line 774
	mov	eax, DWORD PTR _infile$[ebp]
	push	eax
	mov	eax, DWORD PTR _c$[ebp]
	push	eax
	push	41					; 00000029H
	call	_dump_and_abort
	add	esp, 12					; 0000000cH
; Line 776
$L1002:
	mov	eax, DWORD PTR _return_rtx$[ebp]
	jmp	$L922
; Line 777
$L922:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_read_rtx ENDP
_TEXT	ENDS
PUBLIC	_init_rtl
EXTRN	_strlen:NEAR
_TEXT	SEGMENT
_i$ = -4
_init_rtl PROC NEAR
; Line 784
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 787
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L1006
$L1007:
	inc	DWORD PTR _i$[ebp]
$L1006:
	cmp	DWORD PTR _i$[ebp], 91			; 0000005bH
	jge	$L1008
; Line 788
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _rtx_format[eax*4]
	push	eax
	call	_strlen
	add	esp, 4
	mov	ecx, DWORD PTR _i$[ebp]
	mov	DWORD PTR _rtx_length[ecx*4], eax
	jmp	$L1007
$L1008:
; Line 811
$L1004:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_init_rtl ENDP
_TEXT	ENDS
END
