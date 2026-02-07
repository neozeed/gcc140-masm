	TITLE	tree.c
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
PUBLIC	_tree_code_type
PUBLIC	_tree_code_length
PUBLIC	_tree_node_counter
PUBLIC	_debug_no_type_hash
_DATA	SEGMENT
COMM	_all_types_permanent:DWORD
COMM	_permanent_obstack:BYTE:024H
COMM	_maybepermanent_obstack:BYTE:024H
COMM	_temporary_obstack:BYTE:024H
COMM	_type_hash_table:DWORD:03bH
COMM	_momentary_obstack:BYTE:024H
COMM	_saveable_obstack:DWORD
COMM	_rtl_obstack:DWORD
COMM	_current_obstack:DWORD
COMM	_expression_obstack:DWORD
COMM	_maybepermanent_firstobj:DWORD
COMM	_temporary_firstobj:DWORD
COMM	_momentary_firstobj:DWORD
COMM	_momentary_stack:DWORD
$SG622	DB	'x', 00H
	ORG $+2
$SG623	DB	'x', 00H
	ORG $+2
$SG624	DB	'x', 00H
	ORG $+2
$SG625	DB	'x', 00H
	ORG $+2
$SG626	DB	't', 00H
	ORG $+2
$SG627	DB	't', 00H
	ORG $+2
$SG628	DB	't', 00H
	ORG $+2
$SG629	DB	't', 00H
	ORG $+2
$SG630	DB	't', 00H
	ORG $+2
$SG631	DB	't', 00H
	ORG $+2
$SG632	DB	't', 00H
	ORG $+2
$SG633	DB	't', 00H
	ORG $+2
$SG634	DB	't', 00H
	ORG $+2
$SG635	DB	't', 00H
	ORG $+2
$SG636	DB	't', 00H
	ORG $+2
$SG637	DB	't', 00H
	ORG $+2
$SG638	DB	't', 00H
	ORG $+2
$SG639	DB	't', 00H
	ORG $+2
$SG640	DB	't', 00H
	ORG $+2
$SG641	DB	't', 00H
	ORG $+2
$SG642	DB	't', 00H
	ORG $+2
$SG643	DB	't', 00H
	ORG $+2
$SG644	DB	't', 00H
	ORG $+2
$SG645	DB	's', 00H
	ORG $+2
$SG646	DB	's', 00H
	ORG $+2
$SG647	DB	's', 00H
	ORG $+2
$SG648	DB	's', 00H
	ORG $+2
$SG649	DB	's', 00H
	ORG $+2
$SG650	DB	's', 00H
	ORG $+2
$SG651	DB	's', 00H
	ORG $+2
$SG652	DB	's', 00H
	ORG $+2
$SG653	DB	's', 00H
	ORG $+2
$SG654	DB	's', 00H
	ORG $+2
$SG655	DB	's', 00H
	ORG $+2
$SG656	DB	's', 00H
	ORG $+2
$SG657	DB	'c', 00H
	ORG $+2
$SG658	DB	'c', 00H
	ORG $+2
$SG659	DB	'c', 00H
	ORG $+2
$SG660	DB	'c', 00H
	ORG $+2
$SG661	DB	'd', 00H
	ORG $+2
$SG662	DB	'd', 00H
	ORG $+2
$SG663	DB	'd', 00H
	ORG $+2
$SG664	DB	'd', 00H
	ORG $+2
$SG665	DB	'd', 00H
	ORG $+2
$SG666	DB	'd', 00H
	ORG $+2
$SG667	DB	'd', 00H
	ORG $+2
$SG668	DB	'd', 00H
	ORG $+2
$SG669	DB	'r', 00H
	ORG $+2
$SG670	DB	'r', 00H
	ORG $+2
$SG671	DB	'r', 00H
	ORG $+2
$SG672	DB	'r', 00H
	ORG $+2
$SG673	DB	'r', 00H
	ORG $+2
$SG674	DB	'e', 00H
	ORG $+2
$SG675	DB	'e', 00H
	ORG $+2
$SG676	DB	'e', 00H
	ORG $+2
$SG677	DB	'e', 00H
	ORG $+2
$SG678	DB	'e', 00H
	ORG $+2
$SG679	DB	'e', 00H
	ORG $+2
$SG680	DB	'e', 00H
	ORG $+2
$SG681	DB	'e', 00H
	ORG $+2
$SG682	DB	'e', 00H
	ORG $+2
$SG683	DB	'e', 00H
	ORG $+2
$SG684	DB	'e', 00H
	ORG $+2
$SG685	DB	'e', 00H
	ORG $+2
$SG686	DB	'e', 00H
	ORG $+2
$SG687	DB	'e', 00H
	ORG $+2
$SG688	DB	'e', 00H
	ORG $+2
$SG689	DB	'e', 00H
	ORG $+2
$SG690	DB	'e', 00H
	ORG $+2
$SG691	DB	'e', 00H
	ORG $+2
$SG692	DB	'e', 00H
	ORG $+2
$SG693	DB	'e', 00H
	ORG $+2
$SG694	DB	'e', 00H
	ORG $+2
$SG695	DB	'e', 00H
	ORG $+2
$SG696	DB	'e', 00H
	ORG $+2
$SG697	DB	'e', 00H
	ORG $+2
$SG698	DB	'e', 00H
	ORG $+2
$SG699	DB	'e', 00H
	ORG $+2
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
$SG712	DB	'e', 00H
	ORG $+2
$SG713	DB	'e', 00H
	ORG $+2
$SG714	DB	'e', 00H
	ORG $+2
$SG715	DB	'e', 00H
	ORG $+2
$SG716	DB	'e', 00H
	ORG $+2
$SG717	DB	'e', 00H
	ORG $+2
$SG718	DB	'e', 00H
	ORG $+2
$SG719	DB	'e', 00H
	ORG $+2
$SG720	DB	'e', 00H
	ORG $+2
$SG721	DB	'e', 00H
	ORG $+2
$SG722	DB	'e', 00H
	ORG $+2
$SG723	DB	'e', 00H
	ORG $+2
$SG724	DB	'e', 00H
	ORG $+2
$SG725	DB	'e', 00H
	ORG $+2
$SG726	DB	'e', 00H
	ORG $+2
$SG727	DB	'e', 00H
	ORG $+2
$SG728	DB	'e', 00H
	ORG $+2
$SG729	DB	'e', 00H
	ORG $+2
$SG730	DB	'e', 00H
	ORG $+2
$SG731	DB	'e', 00H
	ORG $+2
$SG732	DB	'e', 00H
	ORG $+2
$SG733	DB	'e', 00H
	ORG $+2
$SG734	DB	'e', 00H
	ORG $+2
$SG735	DB	'e', 00H
	ORG $+2
$SG736	DB	'e', 00H
	ORG $+2
$SG737	DB	'e', 00H
	ORG $+2
$SG738	DB	'e', 00H
	ORG $+2
$SG739	DB	'e', 00H
	ORG $+2
$SG740	DB	'e', 00H
	ORG $+2
$SG741	DB	'e', 00H
	ORG $+2
$SG742	DB	'e', 00H
	ORG $+2
$SG743	DB	'e', 00H
	ORG $+2
$SG744	DB	'e', 00H
	ORG $+2
$SG745	DB	'e', 00H
	ORG $+2
$SG746	DB	'e', 00H
	ORG $+2
$SG747	DB	'e', 00H
	ORG $+2
$SG748	DB	'e', 00H
	ORG $+2
$SG749	DB	'e', 00H
	ORG $+2
$SG750	DB	'e', 00H
	ORG $+6
_tree_code_type DD $SG622
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
	DD	$SG714
	DD	$SG715
	DD	$SG716
	DD	$SG717
	DD	$SG718
	DD	$SG719
	DD	$SG720
	DD	$SG721
	DD	$SG722
	DD	$SG723
	DD	$SG724
	DD	$SG725
	DD	$SG726
	DD	$SG727
	DD	$SG728
	DD	$SG729
	DD	$SG730
	DD	$SG731
	DD	$SG732
	DD	$SG733
	DD	$SG734
	DD	$SG735
	DD	$SG736
	DD	$SG737
	DD	$SG738
	DD	$SG739
	DD	$SG740
	DD	$SG741
	DD	$SG742
	DD	$SG743
	DD	$SG744
	DD	$SG745
	DD	$SG746
	DD	$SG747
	DD	$SG748
	DD	$SG749
	DD	$SG750
	ORG $+4
_tree_code_length DD 00H
	DD	07H
	DD	02H
	DD	02H
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
	DD	01H
	DD	01H
	DD	01H
	DD	01H
	DD	05H
	DD	06H
	DD	03H
	DD	01H
	DD	03H
	DD	01H
	DD	01H
	DD	01H
	DD	02H
	DD	03H
	DD	03H
	DD	03H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	02H
	DD	01H
	DD	02H
	DD	01H
	DD	02H
	DD	02H
	DD	02H
	DD	02H
	DD	02H
	DD	02H
	DD	02H
	DD	02H
	DD	02H
	DD	03H
	DD	03H
	DD	04H
	DD	03H
	DD	02H
	DD	02H
	DD	02H
	DD	02H
	DD	02H
	DD	02H
	DD	02H
	DD	02H
	DD	02H
	DD	02H
	DD	02H
	DD	02H
	DD	02H
	DD	01H
	DD	01H
	DD	01H
	DD	01H
	DD	01H
	DD	02H
	DD	01H
	DD	02H
	DD	02H
	DD	01H
	DD	01H
	DD	02H
	DD	02H
	DD	02H
	DD	02H
	DD	02H
	DD	02H
	DD	02H
	DD	02H
	DD	01H
	DD	02H
	DD	02H
	DD	02H
	DD	02H
	DD	01H
	DD	02H
	DD	02H
	DD	02H
	DD	02H
	DD	02H
	DD	02H
	DD	02H
	DD	02H
	DD	01H
	DD	02H
	DD	01H
	DD	01H
	DD	02H
	DD	02H
	DD	01H
	DD	01H
	DD	02H
	DD	02H
	DD	01H
	DD	02H
	DD	01H
	DD	01H
	DD	01H
	DD	02H
	DD	02H
	DD	02H
	DD	02H
_tree_node_counter DD 00H
_debug_no_type_hash DD 00H
_DATA	ENDS
PUBLIC	_init_tree
EXTRN	_xmalloc:NEAR
EXTRN	_free:NEAR
EXTRN	__obstack_begin:NEAR
EXTRN	__obstack_newchunk:NEAR
EXTRN	_memset:NEAR
_BSS	SEGMENT
_hash_table$S752 DD 03f1H DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
; File tree.c
_init_tree PROC NEAR
; Line 152
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 153
	push	OFFSET _free
	push	OFFSET _xmalloc
	push	0
	push	0
	push	OFFSET _permanent_obstack
	call	__obstack_begin
	add	esp, 20					; 00000014H
; Line 155
	push	OFFSET _free
	push	OFFSET _xmalloc
	push	0
	push	0
	push	OFFSET _temporary_obstack
	call	__obstack_begin
	add	esp, 20					; 00000014H
; Line 156
	mov	DWORD PTR _temporary_obstack+20, 0
	mov	eax, DWORD PTR _temporary_obstack+20
	add	eax, DWORD PTR _temporary_obstack+12
	cmp	eax, DWORD PTR _temporary_obstack+16
	jbe	$L1316
	mov	eax, DWORD PTR _temporary_obstack+20
	push	eax
	push	OFFSET _temporary_obstack
	call	__obstack_newchunk
	add	esp, 8
	jmp	$L1317
$L1316:
$L1317:
	mov	eax, DWORD PTR _temporary_obstack+20
	add	DWORD PTR _temporary_obstack+12, eax
	mov	eax, DWORD PTR _temporary_obstack+8
	mov	DWORD PTR _temporary_obstack+20, eax
	mov	eax, DWORD PTR _temporary_obstack+12
	add	eax, DWORD PTR _temporary_obstack+24
	mov	ecx, DWORD PTR _temporary_obstack+24
	not	ecx
	and	eax, ecx
	mov	DWORD PTR _temporary_obstack+12, eax
	mov	eax, DWORD PTR _temporary_obstack+16
	sub	eax, DWORD PTR _temporary_obstack+4
	mov	ecx, DWORD PTR _temporary_obstack+12
	sub	ecx, DWORD PTR _temporary_obstack+4
	cmp	eax, ecx
	jge	$L1318
	mov	eax, DWORD PTR _temporary_obstack+16
	mov	DWORD PTR _temporary_obstack+12, eax
	jmp	$L1319
$L1318:
$L1319:
	mov	eax, DWORD PTR _temporary_obstack+12
	mov	DWORD PTR _temporary_obstack+8, eax
	mov	eax, DWORD PTR _temporary_obstack+20
	mov	DWORD PTR _temporary_firstobj, eax
; Line 157
	push	OFFSET _free
	push	OFFSET _xmalloc
	push	0
	push	0
	push	OFFSET _momentary_obstack
	call	__obstack_begin
	add	esp, 20					; 00000014H
; Line 158
	mov	DWORD PTR _momentary_obstack+20, 0
	mov	eax, DWORD PTR _momentary_obstack+20
	add	eax, DWORD PTR _momentary_obstack+12
	cmp	eax, DWORD PTR _momentary_obstack+16
	jbe	$L1320
	mov	eax, DWORD PTR _momentary_obstack+20
	push	eax
	push	OFFSET _momentary_obstack
	call	__obstack_newchunk
	add	esp, 8
	jmp	$L1321
$L1320:
$L1321:
	mov	eax, DWORD PTR _momentary_obstack+20
	add	DWORD PTR _momentary_obstack+12, eax
	mov	eax, DWORD PTR _momentary_obstack+8
	mov	DWORD PTR _momentary_obstack+20, eax
	mov	eax, DWORD PTR _momentary_obstack+12
	add	eax, DWORD PTR _momentary_obstack+24
	mov	ecx, DWORD PTR _momentary_obstack+24
	not	ecx
	and	eax, ecx
	mov	DWORD PTR _momentary_obstack+12, eax
	mov	eax, DWORD PTR _momentary_obstack+12
	sub	eax, DWORD PTR _momentary_obstack+4
	mov	ecx, DWORD PTR _momentary_obstack+16
	sub	ecx, DWORD PTR _momentary_obstack+4
	cmp	eax, ecx
	jle	$L1322
	mov	eax, DWORD PTR _momentary_obstack+16
	mov	DWORD PTR _momentary_obstack+12, eax
	jmp	$L1323
$L1322:
$L1323:
	mov	eax, DWORD PTR _momentary_obstack+12
	mov	DWORD PTR _momentary_obstack+8, eax
	mov	eax, DWORD PTR _momentary_obstack+20
	mov	DWORD PTR _momentary_firstobj, eax
; Line 159
	push	OFFSET _free
	push	OFFSET _xmalloc
	push	0
	push	0
	push	OFFSET _maybepermanent_obstack
	call	__obstack_begin
	add	esp, 20					; 00000014H
; Line 161
	mov	DWORD PTR _maybepermanent_obstack+20, 0
	mov	eax, DWORD PTR _maybepermanent_obstack+20
	add	eax, DWORD PTR _maybepermanent_obstack+12
	cmp	eax, DWORD PTR _maybepermanent_obstack+16
	jbe	$L1324
	mov	eax, DWORD PTR _maybepermanent_obstack+20
	push	eax
	push	OFFSET _maybepermanent_obstack
	call	__obstack_newchunk
	add	esp, 8
	jmp	$L1325
$L1324:
$L1325:
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
	mov	eax, DWORD PTR _maybepermanent_obstack+16
	sub	eax, DWORD PTR _maybepermanent_obstack+4
	mov	ecx, DWORD PTR _maybepermanent_obstack+12
	sub	ecx, DWORD PTR _maybepermanent_obstack+4
	cmp	eax, ecx
	jge	$L1326
	mov	eax, DWORD PTR _maybepermanent_obstack+16
	mov	DWORD PTR _maybepermanent_obstack+12, eax
	jmp	$L1327
$L1326:
$L1327:
	mov	eax, DWORD PTR _maybepermanent_obstack+12
	mov	DWORD PTR _maybepermanent_obstack+8, eax
	mov	eax, DWORD PTR _maybepermanent_obstack+20
	mov	DWORD PTR _maybepermanent_firstobj, eax
; Line 163
	mov	DWORD PTR _current_obstack, OFFSET _permanent_obstack
; Line 164
	mov	DWORD PTR _expression_obstack, OFFSET _permanent_obstack
; Line 165
	mov	DWORD PTR _saveable_obstack, OFFSET _permanent_obstack
	mov	eax, DWORD PTR _saveable_obstack
	mov	DWORD PTR _rtl_obstack, eax
; Line 166
	mov	DWORD PTR _tree_node_counter, 1
; Line 167
	push	4036					; 00000fc4H
	push	0
	push	OFFSET _hash_table$S752
	call	_memset
	add	esp, 12					; 0000000cH
; Line 168
$L755:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_init_tree ENDP
_TEXT	ENDS
PUBLIC	_temporary_allocation
_TEXT	SEGMENT
_temporary_allocation PROC NEAR
; Line 177
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 178
	mov	DWORD PTR _current_obstack, OFFSET _temporary_obstack
; Line 179
	mov	DWORD PTR _expression_obstack, OFFSET _temporary_obstack
; Line 180
	mov	DWORD PTR _saveable_obstack, OFFSET _maybepermanent_obstack
	mov	eax, DWORD PTR _saveable_obstack
	mov	DWORD PTR _rtl_obstack, eax
; Line 181
	mov	DWORD PTR _momentary_stack, 0
; Line 182
$L760:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_temporary_allocation ENDP
_TEXT	ENDS
PUBLIC	_end_temporary_allocation
_TEXT	SEGMENT
_end_temporary_allocation PROC NEAR
; Line 190
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 191
	mov	DWORD PTR _current_obstack, OFFSET _permanent_obstack
; Line 192
	mov	DWORD PTR _expression_obstack, OFFSET _permanent_obstack
; Line 193
	mov	DWORD PTR _saveable_obstack, OFFSET _permanent_obstack
	mov	eax, DWORD PTR _saveable_obstack
	mov	DWORD PTR _rtl_obstack, eax
; Line 194
$L762:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_end_temporary_allocation ENDP
_TEXT	ENDS
PUBLIC	_resume_temporary_allocation
_TEXT	SEGMENT
_resume_temporary_allocation PROC NEAR
; Line 201
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 202
	mov	DWORD PTR _current_obstack, OFFSET _temporary_obstack
; Line 203
	mov	DWORD PTR _expression_obstack, OFFSET _temporary_obstack
; Line 204
	mov	DWORD PTR _saveable_obstack, OFFSET _maybepermanent_obstack
	mov	eax, DWORD PTR _saveable_obstack
	mov	DWORD PTR _rtl_obstack, eax
; Line 205
$L764:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_resume_temporary_allocation ENDP
_TEXT	ENDS
PUBLIC	_allocation_temporary_p
_TEXT	SEGMENT
_allocation_temporary_p PROC NEAR
; Line 212
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 213
	mov	eax, DWORD PTR _current_obstack
	sub	eax, OFFSET _temporary_obstack
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	jmp	$L766
; Line 214
$L766:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_allocation_temporary_p ENDP
_TEXT	ENDS
PUBLIC	_permanent_allocation
EXTRN	__obstack_free:NEAR
_TEXT	SEGMENT
_permanent_allocation PROC NEAR
; Line 222
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 224
	mov	eax, DWORD PTR _temporary_firstobj
	sub	eax, DWORD PTR _temporary_obstack+4
	mov	DWORD PTR _temporary_obstack+20, eax
	cmp	DWORD PTR _temporary_obstack+20, 0
	jl	$L1328
	mov	eax, DWORD PTR _temporary_obstack+16
	sub	eax, DWORD PTR _temporary_obstack+4
	cmp	eax, DWORD PTR _temporary_obstack+20
	jle	$L1328
	mov	eax, DWORD PTR _temporary_obstack+20
	add	eax, DWORD PTR _temporary_obstack+4
	mov	DWORD PTR _temporary_obstack+8, eax
	mov	eax, DWORD PTR _temporary_obstack+8
	mov	DWORD PTR _temporary_obstack+12, eax
	jmp	$L1329
$L1328:
	mov	eax, DWORD PTR _temporary_obstack+20
	add	eax, DWORD PTR _temporary_obstack+4
	push	eax
	push	OFFSET _temporary_obstack
	call	__obstack_free
	add	esp, 8
$L1329:
; Line 225
	mov	eax, DWORD PTR _momentary_firstobj
	sub	eax, DWORD PTR _momentary_obstack+4
	mov	DWORD PTR _momentary_obstack+20, eax
	cmp	DWORD PTR _momentary_obstack+20, 0
	jl	$L1330
	mov	eax, DWORD PTR _momentary_obstack+16
	sub	eax, DWORD PTR _momentary_obstack+4
	cmp	eax, DWORD PTR _momentary_obstack+20
	jle	$L1330
	mov	eax, DWORD PTR _momentary_obstack+20
	add	eax, DWORD PTR _momentary_obstack+4
	mov	DWORD PTR _momentary_obstack+8, eax
	mov	eax, DWORD PTR _momentary_obstack+8
	mov	DWORD PTR _momentary_obstack+12, eax
	jmp	$L1331
$L1330:
	mov	eax, DWORD PTR _momentary_obstack+20
	add	eax, DWORD PTR _momentary_obstack+4
	push	eax
	push	OFFSET _momentary_obstack
	call	__obstack_free
	add	esp, 8
$L1331:
; Line 226
	mov	eax, DWORD PTR _maybepermanent_firstobj
	sub	eax, DWORD PTR _maybepermanent_obstack+4
	mov	DWORD PTR _maybepermanent_obstack+20, eax
	cmp	DWORD PTR _maybepermanent_obstack+20, 0
	jl	$L1332
	mov	eax, DWORD PTR _maybepermanent_obstack+16
	sub	eax, DWORD PTR _maybepermanent_obstack+4
	cmp	eax, DWORD PTR _maybepermanent_obstack+20
	jle	$L1332
	mov	eax, DWORD PTR _maybepermanent_obstack+20
	add	eax, DWORD PTR _maybepermanent_obstack+4
	mov	DWORD PTR _maybepermanent_obstack+8, eax
	mov	eax, DWORD PTR _maybepermanent_obstack+8
	mov	DWORD PTR _maybepermanent_obstack+12, eax
	jmp	$L1333
$L1332:
	mov	eax, DWORD PTR _maybepermanent_obstack+20
	add	eax, DWORD PTR _maybepermanent_obstack+4
	push	eax
	push	OFFSET _maybepermanent_obstack
	call	__obstack_free
	add	esp, 8
$L1333:
; Line 228
	mov	DWORD PTR _current_obstack, OFFSET _permanent_obstack
; Line 229
	mov	DWORD PTR _expression_obstack, OFFSET _permanent_obstack
; Line 230
	mov	DWORD PTR _saveable_obstack, OFFSET _permanent_obstack
	mov	eax, DWORD PTR _saveable_obstack
	mov	DWORD PTR _rtl_obstack, eax
; Line 231
$L768:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_permanent_allocation ENDP
_TEXT	ENDS
PUBLIC	_preserve_data
_TEXT	SEGMENT
_preserve_data PROC NEAR
; Line 237
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 239
	mov	DWORD PTR _maybepermanent_obstack+20, 0
	mov	eax, DWORD PTR _maybepermanent_obstack+20
	add	eax, DWORD PTR _maybepermanent_obstack+12
	cmp	eax, DWORD PTR _maybepermanent_obstack+16
	jbe	$L1334
	mov	eax, DWORD PTR _maybepermanent_obstack+20
	push	eax
	push	OFFSET _maybepermanent_obstack
	call	__obstack_newchunk
	add	esp, 8
	jmp	$L1335
$L1334:
$L1335:
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
	mov	eax, DWORD PTR _maybepermanent_obstack+16
	sub	eax, DWORD PTR _maybepermanent_obstack+4
	mov	ecx, DWORD PTR _maybepermanent_obstack+12
	sub	ecx, DWORD PTR _maybepermanent_obstack+4
	cmp	eax, ecx
	jge	$L1336
	mov	eax, DWORD PTR _maybepermanent_obstack+16
	mov	DWORD PTR _maybepermanent_obstack+12, eax
	jmp	$L1337
$L1336:
$L1337:
	mov	eax, DWORD PTR _maybepermanent_obstack+12
	mov	DWORD PTR _maybepermanent_obstack+8, eax
	mov	eax, DWORD PTR _maybepermanent_obstack+20
	mov	DWORD PTR _maybepermanent_firstobj, eax
; Line 240
$L771:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_preserve_data ENDP
_TEXT	ENDS
PUBLIC	_oballoc
_TEXT	SEGMENT
_size$ = 8
_oballoc PROC NEAR
; Line 249
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 250
	mov	eax, DWORD PTR _size$[ebp]
	mov	ecx, DWORD PTR _current_obstack
	mov	DWORD PTR [ecx+20], eax
	mov	eax, DWORD PTR _current_obstack
	mov	eax, DWORD PTR [eax+20]
	mov	ecx, DWORD PTR _current_obstack
	add	eax, DWORD PTR [ecx+12]
	mov	ecx, DWORD PTR _current_obstack
	cmp	eax, DWORD PTR [ecx+16]
	jbe	$L1338
	mov	eax, DWORD PTR _current_obstack
	mov	eax, DWORD PTR [eax+20]
	push	eax
	mov	eax, DWORD PTR _current_obstack
	push	eax
	call	__obstack_newchunk
	add	esp, 8
	jmp	$L1339
$L1338:
$L1339:
	mov	eax, DWORD PTR _current_obstack
	mov	eax, DWORD PTR [eax+20]
	mov	ecx, DWORD PTR _current_obstack
	add	DWORD PTR [ecx+12], eax
	mov	eax, DWORD PTR _current_obstack
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _current_obstack
	mov	DWORD PTR [ecx+20], eax
	mov	eax, DWORD PTR _current_obstack
	mov	eax, DWORD PTR [eax+12]
	mov	ecx, DWORD PTR _current_obstack
	add	eax, DWORD PTR [ecx+24]
	mov	ecx, DWORD PTR _current_obstack
	mov	ecx, DWORD PTR [ecx+24]
	not	ecx
	and	eax, ecx
	mov	ecx, DWORD PTR _current_obstack
	mov	DWORD PTR [ecx+12], eax
	mov	eax, DWORD PTR _current_obstack
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _current_obstack
	sub	eax, DWORD PTR [ecx+4]
	mov	ecx, DWORD PTR _current_obstack
	mov	ecx, DWORD PTR [ecx+12]
	mov	edx, DWORD PTR _current_obstack
	sub	ecx, DWORD PTR [edx+4]
	cmp	eax, ecx
	jge	$L1340
	mov	eax, DWORD PTR _current_obstack
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _current_obstack
	mov	DWORD PTR [ecx+12], eax
	jmp	$L1341
$L1340:
$L1341:
	mov	eax, DWORD PTR _current_obstack
	mov	eax, DWORD PTR [eax+12]
	mov	ecx, DWORD PTR _current_obstack
	mov	DWORD PTR [ecx+8], eax
	mov	eax, DWORD PTR _current_obstack
	mov	eax, DWORD PTR [eax+20]
	jmp	$L773
; Line 251
$L773:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_oballoc ENDP
_TEXT	ENDS
PUBLIC	_obfree
_TEXT	SEGMENT
_ptr$ = 8
_obfree	PROC NEAR
; Line 260
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 261
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	ecx, DWORD PTR _current_obstack
	sub	eax, DWORD PTR [ecx+4]
	mov	ecx, DWORD PTR _current_obstack
	mov	DWORD PTR [ecx+20], eax
	mov	eax, DWORD PTR _current_obstack
	cmp	DWORD PTR [eax+20], 0
	jl	$L1342
	mov	eax, DWORD PTR _current_obstack
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _current_obstack
	sub	eax, DWORD PTR [ecx+4]
	mov	ecx, DWORD PTR _current_obstack
	cmp	eax, DWORD PTR [ecx+20]
	jle	$L1342
	mov	eax, DWORD PTR _current_obstack
	mov	eax, DWORD PTR [eax+20]
	mov	ecx, DWORD PTR _current_obstack
	add	eax, DWORD PTR [ecx+4]
	mov	ecx, DWORD PTR _current_obstack
	mov	DWORD PTR [ecx+8], eax
	mov	eax, DWORD PTR _current_obstack
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _current_obstack
	mov	DWORD PTR [ecx+12], eax
	jmp	$L1343
$L1342:
	mov	eax, DWORD PTR _current_obstack
	mov	eax, DWORD PTR [eax+20]
	mov	ecx, DWORD PTR _current_obstack
	add	eax, DWORD PTR [ecx+4]
	push	eax
	mov	eax, DWORD PTR _current_obstack
	push	eax
	call	__obstack_free
	add	esp, 8
$L1343:
; Line 262
$L776:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_obfree	ENDP
_TEXT	ENDS
PUBLIC	_permalloc
_TEXT	SEGMENT
_size$ = 8
_permalloc PROC NEAR
; Line 270
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 271
	mov	eax, DWORD PTR _size$[ebp]
	mov	DWORD PTR _permanent_obstack+20, eax
	mov	eax, DWORD PTR _permanent_obstack+20
	add	eax, DWORD PTR _permanent_obstack+12
	cmp	eax, DWORD PTR _permanent_obstack+16
	jbe	$L1344
	mov	eax, DWORD PTR _permanent_obstack+20
	push	eax
	push	OFFSET _permanent_obstack
	call	__obstack_newchunk
	add	esp, 8
	jmp	$L1345
$L1344:
$L1345:
	mov	eax, DWORD PTR _permanent_obstack+20
	add	DWORD PTR _permanent_obstack+12, eax
	mov	eax, DWORD PTR _permanent_obstack+8
	mov	DWORD PTR _permanent_obstack+20, eax
	mov	eax, DWORD PTR _permanent_obstack+12
	add	eax, DWORD PTR _permanent_obstack+24
	mov	ecx, DWORD PTR _permanent_obstack+24
	not	ecx
	and	eax, ecx
	mov	DWORD PTR _permanent_obstack+12, eax
	mov	eax, DWORD PTR _permanent_obstack+16
	sub	eax, DWORD PTR _permanent_obstack+4
	mov	ecx, DWORD PTR _permanent_obstack+12
	sub	ecx, DWORD PTR _permanent_obstack+4
	cmp	eax, ecx
	jge	$L1346
	mov	eax, DWORD PTR _permanent_obstack+16
	mov	DWORD PTR _permanent_obstack+12, eax
	jmp	$L1347
$L1346:
$L1347:
	mov	eax, DWORD PTR _permanent_obstack+12
	mov	DWORD PTR _permanent_obstack+8, eax
	mov	eax, DWORD PTR _permanent_obstack+20
	jmp	$L778
; Line 272
$L778:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_permalloc ENDP
_TEXT	ENDS
PUBLIC	_savealloc
_TEXT	SEGMENT
_size$ = 8
_savealloc PROC NEAR
; Line 280
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 281
	mov	eax, DWORD PTR _size$[ebp]
	mov	ecx, DWORD PTR _saveable_obstack
	mov	DWORD PTR [ecx+20], eax
	mov	eax, DWORD PTR _saveable_obstack
	mov	eax, DWORD PTR [eax+20]
	mov	ecx, DWORD PTR _saveable_obstack
	add	eax, DWORD PTR [ecx+12]
	mov	ecx, DWORD PTR _saveable_obstack
	cmp	eax, DWORD PTR [ecx+16]
	jbe	$L1348
	mov	eax, DWORD PTR _saveable_obstack
	mov	eax, DWORD PTR [eax+20]
	push	eax
	mov	eax, DWORD PTR _saveable_obstack
	push	eax
	call	__obstack_newchunk
	add	esp, 8
	jmp	$L1349
$L1348:
$L1349:
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
	mov	eax, DWORD PTR [eax+12]
	mov	ecx, DWORD PTR _saveable_obstack
	sub	eax, DWORD PTR [ecx+4]
	mov	ecx, DWORD PTR _saveable_obstack
	mov	ecx, DWORD PTR [ecx+16]
	mov	edx, DWORD PTR _saveable_obstack
	sub	ecx, DWORD PTR [edx+4]
	cmp	eax, ecx
	jle	$L1350
	mov	eax, DWORD PTR _saveable_obstack
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _saveable_obstack
	mov	DWORD PTR [ecx+12], eax
	jmp	$L1351
$L1350:
$L1351:
	mov	eax, DWORD PTR _saveable_obstack
	mov	eax, DWORD PTR [eax+12]
	mov	ecx, DWORD PTR _saveable_obstack
	mov	DWORD PTR [ecx+8], eax
	mov	eax, DWORD PTR _saveable_obstack
	mov	eax, DWORD PTR [eax+20]
	jmp	$L781
; Line 282
$L781:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_savealloc ENDP
_TEXT	ENDS
PUBLIC	_push_momentary
_TEXT	SEGMENT
_tem$ = -4
_push_momentary PROC NEAR
; Line 291
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 294
	mov	DWORD PTR _momentary_obstack+20, 12	; 0000000cH
	mov	eax, DWORD PTR _momentary_obstack+20
	add	eax, DWORD PTR _momentary_obstack+12
	cmp	eax, DWORD PTR _momentary_obstack+16
	jbe	$L1352
	mov	eax, DWORD PTR _momentary_obstack+20
	push	eax
	push	OFFSET _momentary_obstack
	call	__obstack_newchunk
	add	esp, 8
	jmp	$L1353
$L1352:
$L1353:
	mov	eax, DWORD PTR _momentary_obstack+20
	add	DWORD PTR _momentary_obstack+12, eax
	mov	eax, DWORD PTR _momentary_obstack+8
	mov	DWORD PTR _momentary_obstack+20, eax
	mov	eax, DWORD PTR _momentary_obstack+12
	add	eax, DWORD PTR _momentary_obstack+24
	mov	ecx, DWORD PTR _momentary_obstack+24
	not	ecx
	and	eax, ecx
	mov	DWORD PTR _momentary_obstack+12, eax
	mov	eax, DWORD PTR _momentary_obstack+12
	sub	eax, DWORD PTR _momentary_obstack+4
	mov	ecx, DWORD PTR _momentary_obstack+16
	sub	ecx, DWORD PTR _momentary_obstack+4
	cmp	eax, ecx
	jle	$L1354
	mov	eax, DWORD PTR _momentary_obstack+16
	mov	DWORD PTR _momentary_obstack+12, eax
	jmp	$L1355
$L1354:
$L1355:
	mov	eax, DWORD PTR _momentary_obstack+12
	mov	DWORD PTR _momentary_obstack+8, eax
	mov	eax, DWORD PTR _momentary_obstack+20
	mov	DWORD PTR _tem$[ebp], eax
; Line 295
	mov	eax, DWORD PTR _momentary_stack
	mov	ecx, DWORD PTR _tem$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 296
	mov	eax, DWORD PTR _momentary_obstack+8
	mov	ecx, DWORD PTR _tem$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 297
	mov	eax, DWORD PTR _expression_obstack
	mov	ecx, DWORD PTR _tem$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 298
	mov	eax, DWORD PTR _tem$[ebp]
	mov	DWORD PTR _momentary_stack, eax
; Line 299
	mov	DWORD PTR _expression_obstack, OFFSET _momentary_obstack
; Line 300
$L783:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_push_momentary ENDP
_TEXT	ENDS
PUBLIC	_clear_momentary
_TEXT	SEGMENT
_clear_momentary PROC NEAR
; Line 307
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 308
	mov	eax, DWORD PTR _momentary_stack
	mov	eax, DWORD PTR [eax+4]
	sub	eax, DWORD PTR _momentary_obstack+4
	mov	DWORD PTR _momentary_obstack+20, eax
	cmp	DWORD PTR _momentary_obstack+20, 0
	jl	$L1356
	mov	eax, DWORD PTR _momentary_obstack+16
	sub	eax, DWORD PTR _momentary_obstack+4
	cmp	eax, DWORD PTR _momentary_obstack+20
	jle	$L1356
	mov	eax, DWORD PTR _momentary_obstack+20
	add	eax, DWORD PTR _momentary_obstack+4
	mov	DWORD PTR _momentary_obstack+8, eax
	mov	eax, DWORD PTR _momentary_obstack+8
	mov	DWORD PTR _momentary_obstack+12, eax
	jmp	$L1357
$L1356:
	mov	eax, DWORD PTR _momentary_obstack+20
	add	eax, DWORD PTR _momentary_obstack+4
	push	eax
	push	OFFSET _momentary_obstack
	call	__obstack_free
	add	esp, 8
$L1357:
; Line 309
$L786:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_clear_momentary ENDP
_TEXT	ENDS
PUBLIC	_pop_momentary
_TEXT	SEGMENT
_tem$ = -4
_pop_momentary PROC NEAR
; Line 318
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 319
	mov	eax, DWORD PTR _momentary_stack
	mov	DWORD PTR _tem$[ebp], eax
; Line 320
	mov	eax, DWORD PTR _tem$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _momentary_stack, eax
; Line 321
	mov	eax, DWORD PTR _tem$[ebp]
	sub	eax, DWORD PTR _momentary_obstack+4
	mov	DWORD PTR _momentary_obstack+20, eax
	cmp	DWORD PTR _momentary_obstack+20, 0
	jl	$L1358
	mov	eax, DWORD PTR _momentary_obstack+16
	sub	eax, DWORD PTR _momentary_obstack+4
	cmp	eax, DWORD PTR _momentary_obstack+20
	jle	$L1358
	mov	eax, DWORD PTR _momentary_obstack+20
	add	eax, DWORD PTR _momentary_obstack+4
	mov	DWORD PTR _momentary_obstack+8, eax
	mov	eax, DWORD PTR _momentary_obstack+8
	mov	DWORD PTR _momentary_obstack+12, eax
	jmp	$L1359
$L1358:
	mov	eax, DWORD PTR _momentary_obstack+20
	add	eax, DWORD PTR _momentary_obstack+4
	push	eax
	push	OFFSET _momentary_obstack
	call	__obstack_free
	add	esp, 8
$L1359:
; Line 322
	mov	eax, DWORD PTR _tem$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _expression_obstack, eax
; Line 323
$L788:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_pop_momentary ENDP
_TEXT	ENDS
PUBLIC	_suspend_momentary
_TEXT	SEGMENT
_tem$ = -4
_suspend_momentary PROC NEAR
; Line 331
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 332
	mov	eax, DWORD PTR _expression_obstack
	sub	eax, OFFSET _momentary_obstack
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	mov	DWORD PTR _tem$[ebp], eax
; Line 333
	mov	eax, DWORD PTR _saveable_obstack
	mov	DWORD PTR _expression_obstack, eax
; Line 334
	mov	eax, DWORD PTR _tem$[ebp]
	jmp	$L791
; Line 335
$L791:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_suspend_momentary ENDP
_TEXT	ENDS
PUBLIC	_resume_momentary
_TEXT	SEGMENT
_yes$ = 8
_resume_momentary PROC NEAR
; Line 345
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 346
	cmp	DWORD PTR _yes$[ebp], 0
	je	$L796
; Line 347
	mov	DWORD PTR _expression_obstack, OFFSET _momentary_obstack
; Line 348
$L796:
$L795:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_resume_momentary ENDP
_TEXT	ENDS
PUBLIC	_make_node
EXTRN	_input_filename:DWORD
EXTRN	_lineno:DWORD
_TEXT	SEGMENT
_code$ = 8
_t$ = -16
_type$ = -4
_length$ = -20
_obstack$ = -12
_i$ = -8
_make_node PROC NEAR
; Line 360
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	push	ebx
	push	esi
	push	edi
; Line 362
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _tree_code_type[eax*4]
	movsx	eax, BYTE PTR [eax]
	mov	DWORD PTR _type$[ebp], eax
; Line 364
	mov	eax, DWORD PTR _current_obstack
	mov	DWORD PTR _obstack$[ebp], eax
; Line 367
	mov	eax, DWORD PTR _type$[ebp]
	mov	DWORD PTR -24+[ebp], eax
	jmp	$L804
; Line 369
$L808:
; Line 370
	mov	DWORD PTR _length$[ebp], 96		; 00000060H
; Line 372
	cmp	DWORD PTR _obstack$[ebp], OFFSET _permanent_obstack
	je	$L809
; Line 373
	mov	eax, DWORD PTR _saveable_obstack
	mov	DWORD PTR _obstack$[ebp], eax
; Line 377
	jmp	$L810
$L809:
	cmp	DWORD PTR _code$[ebp], 44		; 0000002cH
	jne	$L811
; Line 378
	mov	DWORD PTR _obstack$[ebp], OFFSET _maybepermanent_obstack
; Line 379
$L811:
$L810:
	jmp	$L805
; Line 381
$L812:
; Line 382
	mov	DWORD PTR _length$[ebp], 84		; 00000054H
; Line 384
	cmp	DWORD PTR _obstack$[ebp], OFFSET _permanent_obstack
	je	$L813
; Line 385
	cmp	DWORD PTR _all_types_permanent, 0
	je	$L1360
	mov	DWORD PTR _obstack$[ebp], OFFSET _permanent_obstack
	jmp	$L1361
$L1360:
	mov	eax, DWORD PTR _saveable_obstack
	mov	DWORD PTR _obstack$[ebp], eax
$L1361:
; Line 386
$L813:
	jmp	$L805
; Line 388
$L814:
; Line 391
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _tree_code_length[eax*4]
	shl	eax, 2
	add	eax, 28					; 0000001cH
	mov	DWORD PTR _length$[ebp], eax
; Line 393
	cmp	DWORD PTR _obstack$[ebp], OFFSET _permanent_obstack
	je	$L815
; Line 394
	mov	eax, DWORD PTR _saveable_obstack
	mov	DWORD PTR _obstack$[ebp], eax
; Line 395
$L815:
	jmp	$L805
; Line 397
$L816:
; Line 399
	mov	eax, DWORD PTR _expression_obstack
	mov	DWORD PTR _obstack$[ebp], eax
; Line 401
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _tree_code_length[eax*4]
	lea	eax, DWORD PTR [eax*4-4]
	add	eax, 28					; 0000001cH
	mov	DWORD PTR _length$[ebp], eax
; Line 402
	jmp	$L805
; Line 404
$L817:
; Line 405
	mov	eax, DWORD PTR _expression_obstack
	mov	DWORD PTR _obstack$[ebp], eax
; Line 408
	cmp	DWORD PTR _code$[ebp], 36		; 00000024H
	jne	$L818
; Line 410
	mov	DWORD PTR _length$[ebp], 32		; 00000020H
; Line 411
	jmp	$L805
; Line 414
$L818:
$L819:
; Line 416
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _tree_code_length[eax*4]
	shl	eax, 2
	add	eax, 20					; 00000014H
	mov	DWORD PTR _length$[ebp], eax
; Line 419
	cmp	DWORD PTR _code$[ebp], 1
	jne	$L820
	mov	DWORD PTR _obstack$[ebp], OFFSET _permanent_obstack
; Line 420
$L820:
	jmp	$L805
$L804:
	sub	DWORD PTR -24+[ebp], 99			; 00000063H
	cmp	DWORD PTR -24+[ebp], 21			; 00000015H
	ja	$L805
	shl	DWORD PTR -24+[ebp], 2
	mov	eax, DWORD PTR -24+[ebp]
	jmp	DWORD PTR $L1366[eax]
$L1366:
	DD	OFFSET $L817
	DD	OFFSET $L808
	DD	OFFSET $L816
	DD	OFFSET $L805
	DD	OFFSET $L805
	DD	OFFSET $L805
	DD	OFFSET $L805
	DD	OFFSET $L805
	DD	OFFSET $L805
	DD	OFFSET $L805
	DD	OFFSET $L805
	DD	OFFSET $L805
	DD	OFFSET $L805
	DD	OFFSET $L805
	DD	OFFSET $L805
	DD	OFFSET $L816
	DD	OFFSET $L814
	DD	OFFSET $L812
	DD	OFFSET $L805
	DD	OFFSET $L805
	DD	OFFSET $L805
	DD	OFFSET $L819
$L805:
; Line 422
	mov	eax, DWORD PTR _length$[ebp]
	mov	ecx, DWORD PTR _obstack$[ebp]
	mov	DWORD PTR [ecx+20], eax
	mov	eax, DWORD PTR _obstack$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	ecx, DWORD PTR _obstack$[ebp]
	add	eax, DWORD PTR [ecx+12]
	mov	ecx, DWORD PTR _obstack$[ebp]
	cmp	eax, DWORD PTR [ecx+16]
	jbe	$L1362
	mov	eax, DWORD PTR _obstack$[ebp]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	mov	eax, DWORD PTR _obstack$[ebp]
	push	eax
	call	__obstack_newchunk
	add	esp, 8
	jmp	$L1363
$L1362:
$L1363:
	mov	eax, DWORD PTR _obstack$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	ecx, DWORD PTR _obstack$[ebp]
	add	DWORD PTR [ecx+12], eax
	mov	eax, DWORD PTR _obstack$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _obstack$[ebp]
	mov	DWORD PTR [ecx+20], eax
	mov	eax, DWORD PTR _obstack$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	ecx, DWORD PTR _obstack$[ebp]
	add	eax, DWORD PTR [ecx+24]
	mov	ecx, DWORD PTR _obstack$[ebp]
	mov	ecx, DWORD PTR [ecx+24]
	not	ecx
	and	eax, ecx
	mov	ecx, DWORD PTR _obstack$[ebp]
	mov	DWORD PTR [ecx+12], eax
	mov	eax, DWORD PTR _obstack$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _obstack$[ebp]
	sub	eax, DWORD PTR [ecx+4]
	mov	ecx, DWORD PTR _obstack$[ebp]
	mov	ecx, DWORD PTR [ecx+12]
	mov	edx, DWORD PTR _obstack$[ebp]
	sub	ecx, DWORD PTR [edx+4]
	cmp	eax, ecx
	jge	$L1364
	mov	eax, DWORD PTR _obstack$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _obstack$[ebp]
	mov	DWORD PTR [ecx+12], eax
	jmp	$L1365
$L1364:
$L1365:
	mov	eax, DWORD PTR _obstack$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	ecx, DWORD PTR _obstack$[ebp]
	mov	DWORD PTR [ecx+8], eax
	mov	eax, DWORD PTR _obstack$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _t$[ebp], eax
; Line 424
	mov	eax, DWORD PTR _tree_node_counter
	mov	ecx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [ecx], eax
	inc	DWORD PTR _tree_node_counter
; Line 425
	mov	eax, DWORD PTR _t$[ebp]
	mov	DWORD PTR [eax+8], 0
; Line 426
	mov	eax, DWORD PTR _t$[ebp]
	mov	DWORD PTR [eax+4], 0
; Line 429
	mov	eax, DWORD PTR _length$[ebp]
	shr	eax, 2
	dec	eax
	mov	DWORD PTR _i$[ebp], eax
	jmp	$L821
$L822:
	dec	DWORD PTR _i$[ebp]
$L821:
	cmp	DWORD PTR _i$[ebp], 4
	jb	$L823
; Line 430
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [ecx+eax*4], 0
	jmp	$L822
$L823:
; Line 432
	sub	al, al
	or	al, BYTE PTR _code$[ebp]
	mov	ecx, DWORD PTR _t$[ebp]
	mov	BYTE PTR [ecx+12], al
; Line 433
	cmp	DWORD PTR _obstack$[ebp], OFFSET _permanent_obstack
	jne	$L824
; Line 434
	mov	eax, DWORD PTR _t$[ebp]
	mov	eax, DWORD PTR [eax+16]
	or	eax, 256				; 00000100H
	mov	ecx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 436
$L824:
	cmp	DWORD PTR _type$[ebp], 100		; 00000064H
	jne	$L825
; Line 440
	mov	eax, DWORD PTR _t$[ebp]
	mov	BYTE PTR [eax+37], 1
; Line 441
	mov	eax, DWORD PTR _t$[ebp]
	mov	BYTE PTR [eax+36], 1
; Line 442
	mov	eax, DWORD PTR _t$[ebp]
	mov	BYTE PTR [eax+38], 1
; Line 443
	mov	eax, DWORD PTR _lineno
	mov	ecx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [ecx+24], eax
; Line 444
	mov	eax, DWORD PTR _input_filename
	mov	ecx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [ecx+20], eax
; Line 447
$L825:
	cmp	DWORD PTR _type$[ebp], 116		; 00000074H
	jne	$L826
; Line 449
	mov	eax, DWORD PTR _t$[ebp]
	mov	BYTE PTR [eax+37], 1
; Line 450
	mov	eax, DWORD PTR _t$[ebp]
	mov	BYTE PTR [eax+36], 1
; Line 451
	mov	eax, DWORD PTR _t$[ebp]
	mov	ecx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [ecx+68], eax
; Line 454
$L826:
	cmp	DWORD PTR _type$[ebp], 99		; 00000063H
	jne	$L827
; Line 456
	mov	eax, DWORD PTR _t$[ebp]
	mov	eax, DWORD PTR [eax+16]
	or	eax, 64					; 00000040H
	mov	ecx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 459
$L827:
	mov	eax, DWORD PTR _t$[ebp]
	jmp	$L798
; Line 460
$L798:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_make_node ENDP
_TEXT	ENDS
PUBLIC	_copy_node
_TEXT	SEGMENT
_length$ = -12
_i$ = -4
_node$ = 8
_t$ = -8
_code$ = -16
_copy_node PROC NEAR
; Line 468
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	push	ebx
	push	esi
	push	edi
; Line 470
	mov	eax, DWORD PTR _node$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _code$[ebp], eax
; Line 474
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _tree_code_type[eax*4]
	movsx	eax, BYTE PTR [eax]
	mov	DWORD PTR -20+[ebp], eax
	jmp	$L834
; Line 476
$L838:
; Line 477
	mov	DWORD PTR _length$[ebp], 96		; 00000060H
; Line 478
	jmp	$L835
; Line 480
$L839:
; Line 481
	mov	DWORD PTR _length$[ebp], 84		; 00000054H
; Line 482
	jmp	$L835
; Line 484
$L840:
; Line 487
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _tree_code_length[eax*4]
	shl	eax, 2
	add	eax, 28					; 0000001cH
	mov	DWORD PTR _length$[ebp], eax
; Line 488
	jmp	$L835
; Line 490
$L841:
; Line 493
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _tree_code_length[eax*4]
	lea	eax, DWORD PTR [eax*4-4]
	add	eax, 28					; 0000001cH
	mov	DWORD PTR _length$[ebp], eax
; Line 494
	jmp	$L835
; Line 496
$L842:
; Line 499
	cmp	DWORD PTR _code$[ebp], 36		; 00000024H
	jne	$L843
; Line 501
	mov	DWORD PTR _length$[ebp], 32		; 00000020H
; Line 502
	jmp	$L835
; Line 505
$L843:
$L844:
; Line 507
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _tree_code_length[eax*4]
	shl	eax, 2
	add	eax, 20					; 00000014H
	mov	DWORD PTR _length$[ebp], eax
; Line 508
	jmp	$L835
$L834:
	sub	DWORD PTR -20+[ebp], 99			; 00000063H
	cmp	DWORD PTR -20+[ebp], 21			; 00000015H
	ja	$L835
	shl	DWORD PTR -20+[ebp], 2
	mov	eax, DWORD PTR -20+[ebp]
	jmp	DWORD PTR $L1371[eax]
$L1371:
	DD	OFFSET $L842
	DD	OFFSET $L838
	DD	OFFSET $L841
	DD	OFFSET $L835
	DD	OFFSET $L835
	DD	OFFSET $L835
	DD	OFFSET $L835
	DD	OFFSET $L835
	DD	OFFSET $L835
	DD	OFFSET $L835
	DD	OFFSET $L835
	DD	OFFSET $L835
	DD	OFFSET $L835
	DD	OFFSET $L835
	DD	OFFSET $L835
	DD	OFFSET $L841
	DD	OFFSET $L840
	DD	OFFSET $L839
	DD	OFFSET $L835
	DD	OFFSET $L835
	DD	OFFSET $L835
	DD	OFFSET $L844
$L835:
; Line 510
	mov	eax, DWORD PTR _length$[ebp]
	mov	ecx, DWORD PTR _current_obstack
	mov	DWORD PTR [ecx+20], eax
	mov	eax, DWORD PTR _current_obstack
	mov	eax, DWORD PTR [eax+20]
	mov	ecx, DWORD PTR _current_obstack
	add	eax, DWORD PTR [ecx+12]
	mov	ecx, DWORD PTR _current_obstack
	cmp	eax, DWORD PTR [ecx+16]
	jbe	$L1367
	mov	eax, DWORD PTR _current_obstack
	mov	eax, DWORD PTR [eax+20]
	push	eax
	mov	eax, DWORD PTR _current_obstack
	push	eax
	call	__obstack_newchunk
	add	esp, 8
	jmp	$L1368
$L1367:
$L1368:
	mov	eax, DWORD PTR _current_obstack
	mov	eax, DWORD PTR [eax+20]
	mov	ecx, DWORD PTR _current_obstack
	add	DWORD PTR [ecx+12], eax
	mov	eax, DWORD PTR _current_obstack
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _current_obstack
	mov	DWORD PTR [ecx+20], eax
	mov	eax, DWORD PTR _current_obstack
	mov	eax, DWORD PTR [eax+12]
	mov	ecx, DWORD PTR _current_obstack
	add	eax, DWORD PTR [ecx+24]
	mov	ecx, DWORD PTR _current_obstack
	mov	ecx, DWORD PTR [ecx+24]
	not	ecx
	and	eax, ecx
	mov	ecx, DWORD PTR _current_obstack
	mov	DWORD PTR [ecx+12], eax
	mov	eax, DWORD PTR _current_obstack
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _current_obstack
	sub	eax, DWORD PTR [ecx+4]
	mov	ecx, DWORD PTR _current_obstack
	mov	ecx, DWORD PTR [ecx+12]
	mov	edx, DWORD PTR _current_obstack
	sub	ecx, DWORD PTR [edx+4]
	cmp	eax, ecx
	jge	$L1369
	mov	eax, DWORD PTR _current_obstack
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _current_obstack
	mov	DWORD PTR [ecx+12], eax
	jmp	$L1370
$L1369:
$L1370:
	mov	eax, DWORD PTR _current_obstack
	mov	eax, DWORD PTR [eax+12]
	mov	ecx, DWORD PTR _current_obstack
	mov	DWORD PTR [ecx+8], eax
	mov	eax, DWORD PTR _current_obstack
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _t$[ebp], eax
; Line 514
	mov	eax, DWORD PTR _length$[ebp]
	add	eax, 3
	shr	eax, 2
	dec	eax
	mov	DWORD PTR _i$[ebp], eax
	jmp	$L845
$L846:
	dec	DWORD PTR _i$[ebp]
$L845:
	cmp	DWORD PTR _i$[ebp], 0
	jl	$L847
; Line 515
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [edx+ecx*4], eax
	jmp	$L846
$L847:
; Line 517
	mov	eax, DWORD PTR _tree_node_counter
	mov	ecx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [ecx], eax
	inc	DWORD PTR _tree_node_counter
; Line 518
	mov	eax, DWORD PTR _t$[ebp]
	mov	DWORD PTR [eax+4], 0
; Line 520
	mov	eax, DWORD PTR _current_obstack
	sub	eax, OFFSET _permanent_obstack
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	and	eax, 1
	shl	eax, 8
	mov	ecx, DWORD PTR _t$[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	and	ecx, -257				; fffffeffH
	or	eax, ecx
	mov	ecx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 522
	mov	eax, DWORD PTR _t$[ebp]
	jmp	$L829
; Line 523
$L829:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_copy_node ENDP
_TEXT	ENDS
PUBLIC	_copy_list
_TEXT	SEGMENT
_list$ = 8
_head$ = -8
_prev$ = -12
_next$ = -4
_copy_list PROC NEAR
; Line 531
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 535
	cmp	DWORD PTR _list$[ebp], 0
	jne	$L853
; Line 536
	sub	eax, eax
	jmp	$L849
; Line 538
$L853:
	mov	eax, DWORD PTR _list$[ebp]
	push	eax
	call	_copy_node
	add	esp, 4
	mov	DWORD PTR _prev$[ebp], eax
	mov	eax, DWORD PTR _prev$[ebp]
	mov	DWORD PTR _head$[ebp], eax
; Line 539
	mov	eax, DWORD PTR _list$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _next$[ebp], eax
; Line 540
$L855:
	cmp	DWORD PTR _next$[ebp], 0
	je	$L856
; Line 542
	mov	eax, DWORD PTR _next$[ebp]
	push	eax
	call	_copy_node
	add	esp, 4
	mov	ecx, DWORD PTR _prev$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 543
	mov	eax, DWORD PTR _prev$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _prev$[ebp], eax
; Line 544
	mov	eax, DWORD PTR _next$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _next$[ebp], eax
; Line 545
	jmp	$L855
$L856:
; Line 546
	mov	eax, DWORD PTR _head$[ebp]
	jmp	$L849
; Line 547
$L849:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_copy_list ENDP
_TEXT	ENDS
PUBLIC	_get_identifier
EXTRN	_warn_id_clash:DWORD
EXTRN	_id_clash_len:DWORD
EXTRN	_strcmp:NEAR
EXTRN	_strncmp:NEAR
EXTRN	_warning:NEAR
EXTRN	_memcpy:NEAR
_BSS	SEGMENT
_do_identifier_warnings$S753 DD 01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG883	DB	'`%s'' and `%s'' identical in first n characters', 00H
_DATA	ENDS
_TEXT	SEGMENT
_text$ = 8
_hi$ = -12
_i$ = -8
_idp$ = -20
_len$ = -16
_hash_len$ = -4
_get_identifier PROC NEAR
; Line 558
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	push	ebx
	push	esi
	push	edi
; Line 565
	mov	DWORD PTR _len$[ebp], 0
	jmp	$L864
$L865:
	inc	DWORD PTR _len$[ebp]
$L864:
	mov	eax, DWORD PTR _len$[ebp]
	mov	ecx, DWORD PTR _text$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	or	eax, eax
	je	$L866
	jmp	$L865
$L866:
; Line 568
	mov	eax, DWORD PTR _len$[ebp]
	mov	DWORD PTR _hash_len$[ebp], eax
; Line 569
	cmp	DWORD PTR _warn_id_clash, 0
	je	$L867
	mov	eax, DWORD PTR _id_clash_len
	cmp	DWORD PTR _len$[ebp], eax
	jle	$L867
; Line 570
	mov	eax, DWORD PTR _id_clash_len
	mov	DWORD PTR _hash_len$[ebp], eax
; Line 573
$L867:
	mov	eax, DWORD PTR _hash_len$[ebp]
	mov	DWORD PTR _hi$[ebp], eax
; Line 574
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L868
$L869:
	inc	DWORD PTR _i$[ebp]
$L868:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _hash_len$[ebp], eax
	jle	$L870
; Line 575
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _text$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	mov	ecx, DWORD PTR _hi$[ebp]
	mov	edx, ecx
	lea	ecx, DWORD PTR [ecx+ecx*8]
	lea	ecx, DWORD PTR [edx+ecx*2]
	lea	ecx, DWORD PTR [edx+ecx*8]
	lea	ecx, DWORD PTR [edx+ecx*4]
	add	eax, ecx
	mov	DWORD PTR _hi$[ebp], eax
	jmp	$L869
$L870:
; Line 577
	and	DWORD PTR _hi$[ebp], 1073741823		; 3fffffffH
; Line 578
	mov	ecx, 1009				; 000003f1H
	mov	eax, DWORD PTR _hi$[ebp]
	cdq
	idiv	ecx
	mov	DWORD PTR _hi$[ebp], edx
; Line 581
	mov	eax, DWORD PTR _hi$[ebp]
	mov	eax, DWORD PTR _hash_table$S752[eax*4]
	mov	DWORD PTR _idp$[ebp], eax
	jmp	$L871
$L872:
	mov	eax, DWORD PTR _idp$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _idp$[ebp], eax
$L871:
	cmp	DWORD PTR _idp$[ebp], 0
	je	$L873
; Line 583
	mov	eax, DWORD PTR _idp$[ebp]
	mov	ecx, DWORD PTR _len$[ebp]
	cmp	DWORD PTR [eax+20], ecx
	jne	$L875
	mov	eax, DWORD PTR _text$[ebp]
	push	eax
	mov	eax, DWORD PTR _idp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L875
; Line 584
	mov	eax, DWORD PTR _idp$[ebp]
	jmp	$L858
; Line 587
$L875:
	jmp	$L872
$L873:
	cmp	DWORD PTR _warn_id_clash, 0
	je	$L876
	cmp	DWORD PTR _do_identifier_warnings$S753, 0
	je	$L876
	mov	eax, DWORD PTR _id_clash_len
	cmp	DWORD PTR _len$[ebp], eax
	jl	$L876
; Line 588
	mov	eax, DWORD PTR _hi$[ebp]
	mov	eax, DWORD PTR _hash_table$S752[eax*4]
	mov	DWORD PTR _idp$[ebp], eax
	jmp	$L877
$L878:
	mov	eax, DWORD PTR _idp$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _idp$[ebp], eax
$L877:
	cmp	DWORD PTR _idp$[ebp], 0
	je	$L879
; Line 589
	mov	eax, DWORD PTR _id_clash_len
	push	eax
	mov	eax, DWORD PTR _text$[ebp]
	push	eax
	mov	eax, DWORD PTR _idp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_strncmp
	add	esp, 12					; 0000000cH
	or	eax, eax
	jne	$L881
; Line 592
	mov	eax, DWORD PTR _text$[ebp]
	push	eax
	mov	eax, DWORD PTR _idp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	OFFSET $SG883
	call	_warning
	add	esp, 12					; 0000000cH
; Line 593
	jmp	$L879
; Line 597
$L881:
	jmp	$L878
$L879:
$L876:
	push	1
	call	_make_node
	add	esp, 4
	mov	DWORD PTR _idp$[ebp], eax
; Line 598
	mov	eax, DWORD PTR _len$[ebp]
	mov	ecx, DWORD PTR _idp$[ebp]
	mov	DWORD PTR [ecx+20], eax
; Line 600
	mov	eax, DWORD PTR _len$[ebp]
	mov	DWORD PTR _permanent_obstack+20, eax
	mov	eax, DWORD PTR _permanent_obstack+20
	add	eax, DWORD PTR _permanent_obstack+12
	inc	eax
	cmp	eax, DWORD PTR _permanent_obstack+16
	jbe	$L1372
	mov	eax, DWORD PTR _permanent_obstack+20
	inc	eax
	push	eax
	push	OFFSET _permanent_obstack
	call	__obstack_newchunk
	add	esp, 8
	jmp	$L1373
$L1372:
$L1373:
	mov	eax, DWORD PTR _permanent_obstack+20
	push	eax
	mov	eax, DWORD PTR _text$[ebp]
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
	mov	eax, DWORD PTR _permanent_obstack+16
	sub	eax, DWORD PTR _permanent_obstack+4
	mov	ecx, DWORD PTR _permanent_obstack+12
	sub	ecx, DWORD PTR _permanent_obstack+4
	cmp	eax, ecx
	jge	$L1374
	mov	eax, DWORD PTR _permanent_obstack+16
	mov	DWORD PTR _permanent_obstack+12, eax
	jmp	$L1375
$L1374:
$L1375:
	mov	eax, DWORD PTR _permanent_obstack+12
	mov	DWORD PTR _permanent_obstack+8, eax
	mov	eax, DWORD PTR _permanent_obstack+20
	mov	ecx, DWORD PTR _idp$[ebp]
	mov	DWORD PTR [ecx+24], eax
; Line 602
	mov	eax, DWORD PTR _hi$[ebp]
	mov	eax, DWORD PTR _hash_table$S752[eax*4]
	mov	ecx, DWORD PTR _idp$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 603
	mov	eax, DWORD PTR _idp$[ebp]
	mov	ecx, DWORD PTR _hi$[ebp]
	mov	DWORD PTR _hash_table$S752[ecx*4], eax
; Line 604
	mov	eax, DWORD PTR _idp$[ebp]
	jmp	$L858
; Line 605
$L858:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_get_identifier ENDP
_TEXT	ENDS
PUBLIC	_start_identifier_warnings
_TEXT	SEGMENT
_start_identifier_warnings PROC NEAR
; Line 612
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 613
	mov	DWORD PTR _do_identifier_warnings$S753, 1
; Line 614
$L886:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_start_identifier_warnings ENDP
_TEXT	ENDS
PUBLIC	_set_identifier_size
_TEXT	SEGMENT
_size$ = 8
_set_identifier_size PROC NEAR
; Line 622
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 623
	mov	eax, DWORD PTR _size$[ebp]
	mov	DWORD PTR _tree_code_length+4, eax
; Line 624
$L889:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_set_identifier_size ENDP
_TEXT	ENDS
PUBLIC	_build_int_2
EXTRN	_integer_type_node:DWORD
_TEXT	SEGMENT
_low$ = 8
_hi$ = 12
_t$ = -4
_build_int_2 PROC NEAR
; Line 633
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 634
	push	35					; 00000023H
	call	_make_node
	add	esp, 4
	mov	DWORD PTR _t$[ebp], eax
; Line 635
	mov	eax, DWORD PTR _low$[ebp]
	mov	ecx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [ecx+20], eax
; Line 636
	mov	eax, DWORD PTR _hi$[ebp]
	mov	ecx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [ecx+24], eax
; Line 637
	mov	eax, DWORD PTR _integer_type_node
	mov	ecx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 638
	mov	eax, DWORD PTR _t$[ebp]
	jmp	$L892
; Line 639
$L892:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_build_int_2 ENDP
_TEXT	ENDS
PUBLIC	_build_real
EXTRN	__fltused:NEAR
_TEXT	SEGMENT
_v$ = -4
_type$ = 8
_d$ = 12
_build_real PROC NEAR
; Line 647
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 656
	push	36					; 00000024H
	call	_make_node
	add	esp, 4
	mov	DWORD PTR _v$[ebp], eax
; Line 657
	mov	eax, DWORD PTR _type$[ebp]
	mov	ecx, DWORD PTR _v$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 658
	mov	eax, DWORD PTR _v$[ebp]
	mov	ecx, DWORD PTR _d$[ebp+4]
	mov	DWORD PTR [eax+28], ecx
	mov	ecx, DWORD PTR _d$[ebp]
	mov	DWORD PTR [eax+24], ecx
; Line 659
	mov	eax, DWORD PTR _v$[ebp]
	jmp	$L896
; Line 660
$L896:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_build_real ENDP
_TEXT	ENDS
PUBLIC	_real_value_from_int_cst
CONST	SEGMENT
$T1377	DQ	041f0000000000000H		; 4.29497e+009
$T1378	DQ	041e0000000000000H		; 2.14748e+009
$T1379	DQ	03ff0000000000000H		; 1
CONST	ENDS
_TEXT	SEGMENT
_i$ = 8
_d$ = -8
_real_value_from_int_cst PROC NEAR
; Line 670
	push	ebp
	mov	ebp, esp
	sub	esp, 48					; 00000030H
	push	ebx
	push	esi
	push	edi
; Line 675
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR [eax+24], 0
	jge	$L901
; Line 678
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR [eax+24]
	not	eax
	mov	DWORD PTR -12+[ebp], eax
	fild	DWORD PTR -12+[ebp]
	fst	QWORD PTR _d$[ebp]
; Line 680
	fmul	QWORD PTR $T1377
	fstp	QWORD PTR _d$[ebp]
; Line 684
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR [eax+20]
	not	eax
	test	eax, -2147483648			; 80000000H
	je	$L902
; Line 685
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR [eax+20]
	not	eax
	and	eax, 2147483647				; 7fffffffH
	mov	DWORD PTR -20+[ebp], eax
	mov	DWORD PTR -20+[ebp+4], 0
	fild	QWORD PTR -20+[ebp]
	fadd	QWORD PTR $T1378
	fadd	QWORD PTR _d$[ebp]
	fstp	QWORD PTR _d$[ebp]
; Line 686
	jmp	$L903
$L902:
; Line 687
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR [eax+20]
	not	eax
	mov	DWORD PTR -28+[ebp], eax
	mov	DWORD PTR -28+[ebp+4], 0
	fild	QWORD PTR -28+[ebp]
	fadd	QWORD PTR _d$[ebp]
	fstp	QWORD PTR _d$[ebp]
$L903:
; Line 689
	fld	QWORD PTR _d$[ebp]
	fchs
	fsub	QWORD PTR $T1379
	fstp	QWORD PTR _d$[ebp]
; Line 691
	jmp	$L904
$L901:
; Line 693
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR -32+[ebp], eax
	fild	DWORD PTR -32+[ebp]
	fst	QWORD PTR _d$[ebp]
; Line 695
	fmul	QWORD PTR $T1377
	fstp	QWORD PTR _d$[ebp]
; Line 696
	mov	eax, DWORD PTR _i$[ebp]
	test	BYTE PTR [eax+23], -128			; ffffff80H
	je	$L905
; Line 697
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR [eax+20]
	and	eax, 2147483647				; 7fffffffH
	mov	DWORD PTR -40+[ebp], eax
	mov	DWORD PTR -40+[ebp+4], 0
	fild	QWORD PTR -40+[ebp]
	fadd	QWORD PTR $T1378
	fadd	QWORD PTR _d$[ebp]
	fstp	QWORD PTR _d$[ebp]
; Line 698
	jmp	$L906
$L905:
; Line 699
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR -48+[ebp], eax
	mov	DWORD PTR -48+[ebp+4], 0
	fild	QWORD PTR -48+[ebp]
	fadd	QWORD PTR _d$[ebp]
	fstp	QWORD PTR _d$[ebp]
$L906:
; Line 700
$L904:
; Line 703
	fld	QWORD PTR _d$[ebp]
	jmp	$L899
; Line 704
$L899:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_real_value_from_int_cst ENDP
_TEXT	ENDS
PUBLIC	_build_real_from_int_cst
_TEXT	SEGMENT
_type$ = 8
_i$ = 12
_v$ = -4
_d$ = -12
_build_real_from_int_cst PROC NEAR
; Line 713
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 717
	push	36					; 00000024H
	call	_make_node
	add	esp, 4
	mov	DWORD PTR _v$[ebp], eax
; Line 718
	mov	eax, DWORD PTR _type$[ebp]
	mov	ecx, DWORD PTR _v$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 720
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	call	_real_value_from_int_cst
	add	esp, 4
	fstp	QWORD PTR _d$[ebp]
; Line 727
	mov	eax, DWORD PTR _v$[ebp]
	mov	ecx, DWORD PTR _d$[ebp+4]
	mov	DWORD PTR [eax+28], ecx
	mov	ecx, DWORD PTR _d$[ebp]
	mov	DWORD PTR [eax+24], ecx
; Line 728
	mov	eax, DWORD PTR _v$[ebp]
	jmp	$L909
; Line 729
$L909:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_build_real_from_int_cst ENDP
_TEXT	ENDS
PUBLIC	_build_string
_TEXT	SEGMENT
_len$ = 8
_str$ = 12
_s$ = -4
_build_string PROC NEAR
; Line 741
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 742
	push	38					; 00000026H
	call	_make_node
	add	esp, 4
	mov	DWORD PTR _s$[ebp], eax
; Line 743
	mov	eax, DWORD PTR _len$[ebp]
	mov	ecx, DWORD PTR _s$[ebp]
	mov	DWORD PTR [ecx+24], eax
; Line 744
	mov	eax, DWORD PTR _len$[ebp]
	mov	ecx, DWORD PTR _saveable_obstack
	mov	DWORD PTR [ecx+20], eax
	mov	eax, DWORD PTR _saveable_obstack
	mov	eax, DWORD PTR [eax+20]
	mov	ecx, DWORD PTR _saveable_obstack
	add	eax, DWORD PTR [ecx+12]
	inc	eax
	mov	ecx, DWORD PTR _saveable_obstack
	cmp	eax, DWORD PTR [ecx+16]
	jbe	$L1380
	mov	eax, DWORD PTR _saveable_obstack
	mov	eax, DWORD PTR [eax+20]
	inc	eax
	push	eax
	mov	eax, DWORD PTR _saveable_obstack
	push	eax
	call	__obstack_newchunk
	add	esp, 8
	jmp	$L1381
$L1380:
$L1381:
	mov	eax, DWORD PTR _saveable_obstack
	mov	eax, DWORD PTR [eax+20]
	push	eax
	mov	eax, DWORD PTR _str$[ebp]
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
	mov	eax, DWORD PTR [eax+12]
	mov	ecx, DWORD PTR _saveable_obstack
	sub	eax, DWORD PTR [ecx+4]
	mov	ecx, DWORD PTR _saveable_obstack
	mov	ecx, DWORD PTR [ecx+16]
	mov	edx, DWORD PTR _saveable_obstack
	sub	ecx, DWORD PTR [edx+4]
	cmp	eax, ecx
	jle	$L1382
	mov	eax, DWORD PTR _saveable_obstack
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _saveable_obstack
	mov	DWORD PTR [ecx+12], eax
	jmp	$L1383
$L1382:
$L1383:
	mov	eax, DWORD PTR _saveable_obstack
	mov	eax, DWORD PTR [eax+12]
	mov	ecx, DWORD PTR _saveable_obstack
	mov	DWORD PTR [ecx+8], eax
	mov	eax, DWORD PTR _saveable_obstack
	mov	eax, DWORD PTR [eax+20]
	mov	ecx, DWORD PTR _s$[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 745
	mov	eax, DWORD PTR _s$[ebp]
	jmp	$L914
; Line 746
$L914:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_build_string ENDP
_TEXT	ENDS
PUBLIC	_build_complex
_TEXT	SEGMENT
_real$ = 8
_imag$ = 12
_t$ = -4
_build_complex PROC NEAR
; Line 756
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 757
	push	37					; 00000025H
	call	_make_node
	add	esp, 4
	mov	DWORD PTR _t$[ebp], eax
; Line 758
	mov	eax, DWORD PTR _real$[ebp]
	mov	ecx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [ecx+24], eax
; Line 759
	mov	eax, DWORD PTR _imag$[ebp]
	mov	ecx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 760
	mov	eax, DWORD PTR _t$[ebp]
	jmp	$L918
; Line 761
$L918:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_build_complex ENDP
_TEXT	ENDS
PUBLIC	_integer_zerop
_TEXT	SEGMENT
_expr$ = 8
_integer_zerop PROC NEAR
; Line 768
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 771
	mov	eax, DWORD PTR _expr$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L1384
	mov	eax, DWORD PTR _expr$[ebp]
	cmp	DWORD PTR [eax+20], 0
	jne	$L1384
	mov	eax, DWORD PTR _expr$[ebp]
	cmp	DWORD PTR [eax+24], 0
	jne	$L1384
	mov	eax, 1
	jmp	$L1385
$L1384:
	sub	eax, eax
$L1385:
	jmp	$L921
; Line 772
$L921:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_integer_zerop ENDP
_TEXT	ENDS
PUBLIC	_integer_onep
_TEXT	SEGMENT
_expr$ = 8
_integer_onep PROC NEAR
; Line 779
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 782
	mov	eax, DWORD PTR _expr$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L1386
	mov	eax, DWORD PTR _expr$[ebp]
	cmp	DWORD PTR [eax+20], 1
	jne	$L1386
	mov	eax, DWORD PTR _expr$[ebp]
	cmp	DWORD PTR [eax+24], 0
	jne	$L1386
	mov	eax, 1
	jmp	$L1387
$L1386:
	sub	eax, eax
$L1387:
	jmp	$L923
; Line 783
$L923:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_integer_onep ENDP
_TEXT	ENDS
PUBLIC	_integer_all_onesp
_TEXT	SEGMENT
_expr$ = 8
_prec$ = -4
_uns$ = -8
_integer_all_onesp PROC NEAR
; Line 791
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 795
	mov	eax, DWORD PTR _expr$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	je	$L928
; Line 796
	sub	eax, eax
	jmp	$L925
; Line 798
$L928:
	mov	eax, DWORD PTR _expr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 12					; 0000000cH
	and	eax, 1
	mov	DWORD PTR _uns$[ebp], eax
; Line 799
	cmp	DWORD PTR _uns$[ebp], 0
	jne	$L929
; Line 800
	mov	eax, DWORD PTR _expr$[ebp]
	cmp	DWORD PTR [eax+20], -1
	jne	$L1388
	mov	eax, DWORD PTR _expr$[ebp]
	cmp	DWORD PTR [eax+24], -1
	jne	$L1388
	mov	eax, 1
	jmp	$L1389
$L1388:
	sub	eax, eax
$L1389:
	jmp	$L925
; Line 802
$L929:
	mov	eax, DWORD PTR _expr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _prec$[ebp], eax
; Line 803
	cmp	DWORD PTR _prec$[ebp], 32		; 00000020H
	jl	$L930
; Line 805
	mov	eax, DWORD PTR _expr$[ebp]
	cmp	DWORD PTR [eax+20], -1
	jne	$L1390
	mov	eax, 1
	mov	ecx, DWORD PTR _prec$[ebp]
	sub	ecx, 32					; 00000020H
	shl	eax, cl
	dec	eax
	mov	ecx, DWORD PTR _expr$[ebp]
	cmp	eax, DWORD PTR [ecx+24]
	jne	$L1390
	mov	eax, 1
	jmp	$L1391
$L1390:
	sub	eax, eax
$L1391:
	jmp	$L925
; Line 806
	jmp	$L931
$L930:
; Line 807
	mov	eax, 1
	mov	cl, BYTE PTR _prec$[ebp]
	shl	eax, cl
	dec	eax
	mov	ecx, DWORD PTR _expr$[ebp]
	sub	eax, DWORD PTR [ecx+20]
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	jmp	$L925
$L931:
; Line 808
$L925:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_integer_all_onesp ENDP
_TEXT	ENDS
PUBLIC	_list_length
_TEXT	SEGMENT
_t$ = 8
_tail$ = -4
_len$ = -8
_list_length PROC NEAR
; Line 817
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 819
	mov	DWORD PTR _len$[ebp], 0
; Line 821
	mov	eax, DWORD PTR _t$[ebp]
	mov	DWORD PTR _tail$[ebp], eax
	jmp	$L936
$L937:
	mov	eax, DWORD PTR _tail$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _tail$[ebp], eax
$L936:
	cmp	DWORD PTR _tail$[ebp], 0
	je	$L938
; Line 822
	inc	DWORD PTR _len$[ebp]
	jmp	$L937
$L938:
; Line 824
	mov	eax, DWORD PTR _len$[ebp]
	jmp	$L933
; Line 825
$L933:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_list_length ENDP
_TEXT	ENDS
PUBLIC	_chainon
EXTRN	_abort:NEAR
_TEXT	SEGMENT
_op1$ = 8
_op2$ = 12
_t$ = -4
_chainon PROC NEAR
; Line 834
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 837
	cmp	DWORD PTR _op1$[ebp], 0
	je	$L943
; Line 839
	mov	eax, DWORD PTR _op1$[ebp]
	mov	DWORD PTR _t$[ebp], eax
	jmp	$L944
$L945:
	mov	eax, DWORD PTR _t$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _t$[ebp], eax
$L944:
	mov	eax, DWORD PTR _t$[ebp]
	cmp	DWORD PTR [eax+4], 0
	je	$L946
; Line 840
	mov	eax, DWORD PTR _op2$[ebp]
	cmp	DWORD PTR _t$[ebp], eax
	jne	$L947
	call	_abort
; Line 841
$L947:
	jmp	$L945
$L946:
	mov	eax, DWORD PTR _op2$[ebp]
	mov	ecx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 842
	mov	eax, DWORD PTR _op1$[ebp]
	jmp	$L941
; Line 844
	jmp	$L949
$L943:
	mov	eax, DWORD PTR _op2$[ebp]
	jmp	$L941
$L949:
; Line 845
$L941:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_chainon ENDP
_TEXT	ENDS
PUBLIC	_build_tree_list
_TEXT	SEGMENT
_parm$ = 8
_value$ = 12
_t$ = -4
_build_tree_list PROC NEAR
; Line 853
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 854
	push	3
	call	_make_node
	add	esp, 4
	mov	DWORD PTR _t$[ebp], eax
; Line 855
	mov	eax, DWORD PTR _parm$[ebp]
	mov	ecx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [ecx+20], eax
; Line 856
	mov	eax, DWORD PTR _value$[ebp]
	mov	ecx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [ecx+24], eax
; Line 857
	mov	eax, DWORD PTR _t$[ebp]
	jmp	$L952
; Line 858
$L952:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_build_tree_list ENDP
_TEXT	ENDS
PUBLIC	_tree_cons
_TEXT	SEGMENT
_purpose$ = 8
_value$ = 12
_chain$ = 16
_node$ = -4
_tree_cons PROC NEAR
; Line 867
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 868
	push	3
	call	_make_node
	add	esp, 4
	mov	DWORD PTR _node$[ebp], eax
; Line 869
	mov	eax, DWORD PTR _chain$[ebp]
	mov	ecx, DWORD PTR _node$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 870
	mov	eax, DWORD PTR _purpose$[ebp]
	mov	ecx, DWORD PTR _node$[ebp]
	mov	DWORD PTR [ecx+20], eax
; Line 871
	mov	eax, DWORD PTR _value$[ebp]
	mov	ecx, DWORD PTR _node$[ebp]
	mov	DWORD PTR [ecx+24], eax
; Line 872
	mov	eax, DWORD PTR _node$[ebp]
	jmp	$L957
; Line 873
$L957:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_tree_cons ENDP
_TEXT	ENDS
PUBLIC	_perm_tree_cons
_TEXT	SEGMENT
_value$ = 12
_chain$ = 16
_node$ = -4
_ambient_obstack$ = -8
_purpose$ = 8
_perm_tree_cons PROC NEAR
; Line 880
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 882
	mov	eax, DWORD PTR _current_obstack
	mov	DWORD PTR _ambient_obstack$[ebp], eax
; Line 883
	mov	DWORD PTR _current_obstack, OFFSET _permanent_obstack
; Line 885
	push	3
	call	_make_node
	add	esp, 4
	mov	DWORD PTR _node$[ebp], eax
; Line 886
	mov	eax, DWORD PTR _chain$[ebp]
	mov	ecx, DWORD PTR _node$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 887
	mov	eax, DWORD PTR _purpose$[ebp]
	mov	ecx, DWORD PTR _node$[ebp]
	mov	DWORD PTR [ecx+20], eax
; Line 888
	mov	eax, DWORD PTR _value$[ebp]
	mov	ecx, DWORD PTR _node$[ebp]
	mov	DWORD PTR [ecx+24], eax
; Line 890
	mov	eax, DWORD PTR _ambient_obstack$[ebp]
	mov	DWORD PTR _current_obstack, eax
; Line 891
	mov	eax, DWORD PTR _node$[ebp]
	jmp	$L962
; Line 892
$L962:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_perm_tree_cons ENDP
_TEXT	ENDS
PUBLIC	_temp_tree_cons
_TEXT	SEGMENT
_purpose$ = 8
_value$ = 12
_chain$ = 16
_node$ = -4
_ambient_obstack$ = -8
_temp_tree_cons PROC NEAR
; Line 899
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 901
	mov	eax, DWORD PTR _current_obstack
	mov	DWORD PTR _ambient_obstack$[ebp], eax
; Line 902
	mov	DWORD PTR _current_obstack, OFFSET _temporary_obstack
; Line 904
	push	3
	call	_make_node
	add	esp, 4
	mov	DWORD PTR _node$[ebp], eax
; Line 905
	mov	eax, DWORD PTR _chain$[ebp]
	mov	ecx, DWORD PTR _node$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 906
	mov	eax, DWORD PTR _purpose$[ebp]
	mov	ecx, DWORD PTR _node$[ebp]
	mov	DWORD PTR [ecx+20], eax
; Line 907
	mov	eax, DWORD PTR _value$[ebp]
	mov	ecx, DWORD PTR _node$[ebp]
	mov	DWORD PTR [ecx+24], eax
; Line 909
	mov	eax, DWORD PTR _ambient_obstack$[ebp]
	mov	DWORD PTR _current_obstack, eax
; Line 910
	mov	eax, DWORD PTR _node$[ebp]
	jmp	$L968
; Line 911
$L968:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_temp_tree_cons ENDP
_TEXT	ENDS
PUBLIC	_saveable_tree_cons
_TEXT	SEGMENT
_purpose$ = 8
_value$ = 12
_chain$ = 16
_node$ = -4
_ambient_obstack$ = -8
_saveable_tree_cons PROC NEAR
; Line 918
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 920
	mov	eax, DWORD PTR _current_obstack
	mov	DWORD PTR _ambient_obstack$[ebp], eax
; Line 921
	mov	eax, DWORD PTR _saveable_obstack
	mov	DWORD PTR _current_obstack, eax
; Line 923
	push	3
	call	_make_node
	add	esp, 4
	mov	DWORD PTR _node$[ebp], eax
; Line 924
	mov	eax, DWORD PTR _chain$[ebp]
	mov	ecx, DWORD PTR _node$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 925
	mov	eax, DWORD PTR _purpose$[ebp]
	mov	ecx, DWORD PTR _node$[ebp]
	mov	DWORD PTR [ecx+20], eax
; Line 926
	mov	eax, DWORD PTR _value$[ebp]
	mov	ecx, DWORD PTR _node$[ebp]
	mov	DWORD PTR [ecx+24], eax
; Line 928
	mov	eax, DWORD PTR _ambient_obstack$[ebp]
	mov	DWORD PTR _current_obstack, eax
; Line 929
	mov	eax, DWORD PTR _node$[ebp]
	jmp	$L974
; Line 930
$L974:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_saveable_tree_cons ENDP
_TEXT	ENDS
PUBLIC	_tree_last
_TEXT	SEGMENT
_chain$ = 8
_next$ = -4
_tree_last PROC NEAR
; Line 937
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 939
	cmp	DWORD PTR _chain$[ebp], 0
	je	$L980
; Line 940
$L982:
	mov	eax, DWORD PTR _chain$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _next$[ebp], eax
	cmp	DWORD PTR _next$[ebp], 0
	je	$L983
; Line 941
	mov	eax, DWORD PTR _next$[ebp]
	mov	DWORD PTR _chain$[ebp], eax
	jmp	$L982
$L983:
; Line 942
$L980:
	mov	eax, DWORD PTR _chain$[ebp]
	jmp	$L978
; Line 943
$L978:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_tree_last ENDP
_TEXT	ENDS
PUBLIC	_nreverse
_TEXT	SEGMENT
_t$ = 8
_prev$ = -12
_decl$ = -8
_next$ = -4
_nreverse PROC NEAR
; Line 951
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 952
	mov	DWORD PTR _prev$[ebp], 0
; Line 953
	mov	eax, DWORD PTR _t$[ebp]
	mov	DWORD PTR _decl$[ebp], eax
	jmp	$L989
$L990:
	mov	eax, DWORD PTR _next$[ebp]
	mov	DWORD PTR _decl$[ebp], eax
$L989:
	cmp	DWORD PTR _decl$[ebp], 0
	je	$L991
; Line 955
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _next$[ebp], eax
; Line 956
	mov	eax, DWORD PTR _prev$[ebp]
	mov	ecx, DWORD PTR _decl$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 957
	mov	eax, DWORD PTR _decl$[ebp]
	mov	DWORD PTR _prev$[ebp], eax
; Line 958
	jmp	$L990
$L991:
; Line 959
	mov	eax, DWORD PTR _prev$[ebp]
	jmp	$L985
; Line 960
$L985:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_nreverse ENDP
_TEXT	ENDS
PUBLIC	_size_in_bytes
EXTRN	_integer_zero_node:DWORD
EXTRN	_error_mark_node:DWORD
EXTRN	_convert_units:NEAR
EXTRN	_incomplete_type_error:NEAR
_TEXT	SEGMENT
_type$ = 8
_size_in_bytes PROC NEAR
; Line 971
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 972
	mov	eax, DWORD PTR _type$[ebp]
	cmp	DWORD PTR _error_mark_node, eax
	jne	$L994
; Line 973
	mov	eax, DWORD PTR _integer_zero_node
	jmp	$L993
; Line 974
$L994:
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+68]
	mov	DWORD PTR _type$[ebp], eax
; Line 975
	mov	eax, DWORD PTR _type$[ebp]
	cmp	DWORD PTR [eax+28], 0
	jne	$L995
; Line 977
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	push	0
	call	_incomplete_type_error
	add	esp, 8
; Line 978
	mov	eax, DWORD PTR _integer_zero_node
	jmp	$L993
; Line 980
$L995:
; Line 981
	push	8
	mov	eax, DWORD PTR _type$[ebp]
	mov	al, BYTE PTR [eax+36]
	and	eax, 255				; 000000ffH
	push	eax
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	call	_convert_units
	add	esp, 12					; 0000000cH
	jmp	$L993
; Line 982
$L993:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_size_in_bytes ENDP
_TEXT	ENDS
PUBLIC	_int_size_in_bytes
_TEXT	SEGMENT
_type$ = 8
_size$ = -4
_int_size_in_bytes PROC NEAR
; Line 990
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 992
	mov	eax, DWORD PTR _error_mark_node
	cmp	DWORD PTR _type$[ebp], eax
	jne	$L1001
; Line 993
	sub	eax, eax
	jmp	$L999
; Line 994
$L1001:
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+68]
	mov	DWORD PTR _type$[ebp], eax
; Line 995
	mov	eax, DWORD PTR _type$[ebp]
	cmp	DWORD PTR [eax+28], 0
	jne	$L1002
; Line 996
	mov	eax, -1
	jmp	$L999
; Line 997
$L1002:
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	je	$L1003
; Line 998
	mov	eax, -1
	jmp	$L999
; Line 999
$L1003:
	mov	eax, DWORD PTR _type$[ebp]
	mov	al, BYTE PTR [eax+36]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _type$[ebp]
	mov	ecx, DWORD PTR [ecx+28]
	imul	eax, DWORD PTR [ecx+20]
	mov	DWORD PTR _size$[ebp], eax
; Line 1000
	mov	eax, DWORD PTR _size$[ebp]
	add	eax, 7
	cdq
	and	edx, 7
	add	eax, edx
	sar	eax, 3
	jmp	$L999
; Line 1001
$L999:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_int_size_in_bytes ENDP
_TEXT	ENDS
PUBLIC	_build
PUBLIC	_array_type_nelts
PUBLIC	_tree_int_cst_equal
EXTRN	_fold:NEAR
_TEXT	SEGMENT
_type$ = 8
_index_type$ = -4
_array_type_nelts PROC NEAR
; Line 1009
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 1010
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _index_type$[ebp], eax
; Line 1015
	mov	eax, DWORD PTR _integer_zero_node
	push	eax
	mov	eax, DWORD PTR _index_type$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_tree_int_cst_equal
	add	esp, 8
	or	eax, eax
	je	$L1392
	mov	eax, DWORD PTR _index_type$[ebp]
	mov	eax, DWORD PTR [eax+60]
	jmp	$L1393
$L1392:
	mov	eax, DWORD PTR _index_type$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	mov	eax, DWORD PTR _index_type$[ebp]
	mov	eax, DWORD PTR [eax+60]
	push	eax
	mov	eax, DWORD PTR _integer_type_node
	push	eax
	push	65					; 00000041H
	call	_build
	add	esp, 16					; 00000010H
	push	eax
	call	_fold
	add	esp, 4
$L1393:
	jmp	$L1005
; Line 1016
$L1005:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_array_type_nelts ENDP
_TEXT	ENDS
PUBLIC	_staticp
_TEXT	SEGMENT
_arg$ = 8
_code$ = -4
_staticp PROC NEAR
; Line 1024
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 1025
	mov	eax, DWORD PTR _arg$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _code$[ebp], eax
; Line 1028
	cmp	DWORD PTR _code$[ebp], 43		; 0000002bH
	je	$L1012
	cmp	DWORD PTR _code$[ebp], 39		; 00000027H
	je	$L1012
	cmp	DWORD PTR _code$[ebp], 52		; 00000034H
	jne	$L1011
$L1012:
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 2
	test	al, 1
	jne	$L1013
	mov	eax, DWORD PTR _arg$[ebp]
	test	BYTE PTR [eax+16], 1
	je	$L1011
$L1013:
; Line 1029
	mov	eax, 1
	jmp	$L1009
; Line 1031
$L1011:
	cmp	DWORD PTR _code$[ebp], 38		; 00000026H
	jne	$L1014
; Line 1032
	mov	eax, 1
	jmp	$L1009
; Line 1034
$L1014:
	cmp	DWORD PTR _code$[ebp], 47		; 0000002fH
	jne	$L1015
; Line 1036
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+28]
	cmp	DWORD PTR [eax+52], 0
	jne	$L1394
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_staticp
	add	esp, 4
	or	eax, eax
	je	$L1394
	mov	eax, 1
	jmp	$L1395
$L1394:
	sub	eax, eax
$L1395:
	jmp	$L1009
; Line 1038
$L1015:
	cmp	DWORD PTR _code$[ebp], 48		; 00000030H
	jne	$L1016
; Line 1039
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 6
	and	eax, 1
	jmp	$L1009
; Line 1041
$L1016:
	cmp	DWORD PTR _code$[ebp], 51		; 00000033H
	jne	$L1017
; Line 1044
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+28]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L1018
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L1018
; Line 1045
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_staticp
	add	esp, 4
	jmp	$L1009
; Line 1046
$L1018:
; Line 1048
$L1017:
	sub	eax, eax
	jmp	$L1009
; Line 1049
$L1009:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_staticp ENDP
_TEXT	ENDS
PUBLIC	_lvalue_p
EXTRN	_language_lvalue_valid:NEAR
_TEXT	SEGMENT
_ref$ = 8
_code$ = -4
_lvalue_p PROC NEAR
; Line 1058
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 1059
	mov	eax, DWORD PTR _ref$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _code$[ebp], eax
; Line 1061
	mov	eax, DWORD PTR _ref$[ebp]
	push	eax
	call	_language_lvalue_valid
	add	esp, 4
	or	eax, eax
	je	$L1024
; Line 1062
	mov	eax, DWORD PTR _code$[ebp]
	mov	DWORD PTR -8+[ebp], eax
	jmp	$L1025
; Line 1064
$L1029:
; Line 1065
	mov	eax, DWORD PTR _ref$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_lvalue_p
	add	esp, 4
	jmp	$L1021
; Line 1067
$L1030:
; Line 1068
	mov	eax, 1
	jmp	$L1021
; Line 1070
$L1031:
; Line 1077
	mov	eax, DWORD PTR _ref$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 21					; 00000015H
	je	$L1032
	mov	eax, DWORD PTR _ref$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 14					; 0000000eH
	je	$L1032
; Line 1078
	mov	eax, 1
	jmp	$L1021
; Line 1079
$L1032:
	jmp	$L1026
; Line 1081
$L1033:
; Line 1082
	mov	eax, 1
	jmp	$L1021
; Line 1084
$L1034:
; Line 1085
	mov	eax, DWORD PTR _ref$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 13					; 0000000dH
	jne	$L1035
; Line 1086
	mov	eax, 1
	jmp	$L1021
; Line 1087
$L1035:
	jmp	$L1026
$L1025:
	cmp	DWORD PTR -8+[ebp], 48			; 00000030H
	jg	$L1396
	je	$L1031
	cmp	DWORD PTR -8+[ebp], 0
	je	$L1031
	cmp	DWORD PTR -8+[ebp], 38			; 00000026H
	je	$L1030
	cmp	DWORD PTR -8+[ebp], 43			; 0000002bH
	jl	$L1026
	cmp	DWORD PTR -8+[ebp], 45			; 0000002dH
	jle	$L1031
	cmp	DWORD PTR -8+[ebp], 47			; 0000002fH
	je	$L1029
	jmp	$L1026
$L1396:
	cmp	DWORD PTR -8+[ebp], 51			; 00000033H
	je	$L1031
	cmp	DWORD PTR -8+[ebp], 56			; 00000038H
	je	$L1033
	cmp	DWORD PTR -8+[ebp], 61			; 0000003dH
	je	$L1034
	jmp	$L1026
$L1026:
; Line 1088
$L1024:
	sub	eax, eax
	jmp	$L1021
; Line 1089
$L1021:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_lvalue_p ENDP
_TEXT	ENDS
PUBLIC	_lvalue_or_else
EXTRN	_error:NEAR
_DATA	SEGMENT
	ORG $+2
$SG1042	DB	'invalid lvalue in %s', 00H
_DATA	ENDS
_TEXT	SEGMENT
_ref$ = 8
_string$ = 12
_win$ = -4
_lvalue_or_else PROC NEAR
; Line 1098
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 1099
	mov	eax, DWORD PTR _ref$[ebp]
	push	eax
	call	_lvalue_p
	add	esp, 4
	mov	DWORD PTR _win$[ebp], eax
; Line 1100
	cmp	DWORD PTR _win$[ebp], 0
	jne	$L1040
; Line 1101
	mov	eax, DWORD PTR _string$[ebp]
	push	eax
	push	OFFSET $SG1042
	call	_error
	add	esp, 8
; Line 1102
$L1040:
	mov	eax, DWORD PTR _win$[ebp]
	jmp	$L1038
; Line 1103
$L1038:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_lvalue_or_else ENDP
_TEXT	ENDS
PUBLIC	_save_expr
_TEXT	SEGMENT
_expr$ = 8
_t$ = -4
_save_expr PROC NEAR
; Line 1113
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 1114
	mov	eax, DWORD PTR _expr$[ebp]
	push	eax
	call	_fold
	add	esp, 4
	mov	DWORD PTR _t$[ebp], eax
; Line 1121
	mov	eax, DWORD PTR _t$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 6
	test	al, 1
	jne	$L1047
	mov	eax, DWORD PTR _t$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 5
	test	al, 1
	jne	$L1047
	mov	eax, DWORD PTR _t$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 114				; 00000072H
	jne	$L1046
$L1047:
; Line 1122
	mov	eax, DWORD PTR _t$[ebp]
	jmp	$L1044
; Line 1124
$L1046:
	push	0
	mov	eax, DWORD PTR _t$[ebp]
	push	eax
	mov	eax, DWORD PTR _expr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	push	114					; 00000072H
	call	_build
	add	esp, 16					; 00000010H
	jmp	$L1044
; Line 1125
$L1044:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_save_expr ENDP
_TEXT	ENDS
PUBLIC	_build_nt
PUBLIC	_stabilize_reference
_TEXT	SEGMENT
_ref$ = 8
_result$ = -4
_code$ = -8
_stabilize_reference PROC NEAR
; Line 1137
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 1139
	mov	eax, DWORD PTR _ref$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _code$[ebp], eax
; Line 1141
	mov	eax, DWORD PTR _code$[ebp]
	mov	DWORD PTR -12+[ebp], eax
	jmp	$L1052
; Line 1143
$L1056:
; Line 1146
	mov	eax, DWORD PTR _ref$[ebp]
	mov	DWORD PTR _result$[ebp], eax
; Line 1147
	jmp	$L1053
; Line 1149
$L1057:
; Line 1156
	mov	eax, DWORD PTR _ref$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_stabilize_reference
	add	esp, 4
	push	eax
	mov	eax, DWORD PTR _code$[ebp]
	push	eax
	call	_build_nt
	add	esp, 8
	mov	DWORD PTR _result$[ebp], eax
; Line 1157
	jmp	$L1053
; Line 1159
$L1058:
; Line 1160
	mov	eax, DWORD PTR _ref$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_save_expr
	add	esp, 4
	push	eax
	push	48					; 00000030H
	call	_build_nt
	add	esp, 8
	mov	DWORD PTR _result$[ebp], eax
; Line 1161
	jmp	$L1053
; Line 1163
$L1059:
; Line 1166
	mov	eax, DWORD PTR _ref$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	mov	eax, DWORD PTR _ref$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_stabilize_reference
	add	esp, 4
	push	eax
	push	47					; 0000002fH
	call	_build_nt
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _result$[ebp], eax
; Line 1167
	jmp	$L1053
; Line 1169
$L1060:
; Line 1171
	mov	eax, DWORD PTR _ref$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	call	_save_expr
	add	esp, 4
	push	eax
	mov	eax, DWORD PTR _ref$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_stabilize_reference
	add	esp, 4
	push	eax
	push	51					; 00000033H
	call	_build_nt
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _result$[ebp], eax
; Line 1172
	jmp	$L1053
; Line 1176
$L1061:
; Line 1177
	mov	eax, DWORD PTR _ref$[ebp]
	jmp	$L1049
; Line 1179
$L1062:
; Line 1180
	mov	eax, DWORD PTR _error_mark_node
	jmp	$L1049
; Line 1181
	jmp	$L1053
$L1052:
	cmp	DWORD PTR -12+[ebp], 48			; 00000030H
	jg	$L1397
	je	$L1058
	cmp	DWORD PTR -12+[ebp], 0
	je	$L1062
	cmp	DWORD PTR -12+[ebp], 43			; 0000002bH
	jl	$L1061
	cmp	DWORD PTR -12+[ebp], 45			; 0000002dH
	jle	$L1056
	cmp	DWORD PTR -12+[ebp], 47			; 0000002fH
	je	$L1059
	jmp	$L1061
$L1397:
	cmp	DWORD PTR -12+[ebp], 51			; 00000033H
	je	$L1060
	cmp	DWORD PTR -12+[ebp], 77			; 0000004dH
	jl	$L1061
	cmp	DWORD PTR -12+[ebp], 81			; 00000051H
	jle	$L1057
	cmp	DWORD PTR -12+[ebp], 112		; 00000070H
	jl	$L1061
	cmp	DWORD PTR -12+[ebp], 113		; 00000071H
	jle	$L1057
	jmp	$L1061
$L1053:
; Line 1183
	mov	eax, DWORD PTR _ref$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _result$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 1184
	mov	eax, DWORD PTR _ref$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 5
	and	eax, 1
	shl	eax, 5
	mov	ecx, DWORD PTR _result$[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	and	ecx, -33				; ffffffdfH
	or	eax, ecx
	mov	ecx, DWORD PTR _result$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 1185
	mov	eax, DWORD PTR _ref$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 3
	and	eax, 1
	shl	eax, 3
	mov	ecx, DWORD PTR _result$[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	and	ecx, -9					; fffffff7H
	or	eax, ecx
	mov	ecx, DWORD PTR _result$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 1186
	mov	eax, DWORD PTR _ref$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 11					; 0000000bH
	and	eax, 1
	shl	eax, 11					; 0000000bH
	mov	ecx, DWORD PTR _result$[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	and	ecx, -2049				; fffff7ffH
	or	eax, ecx
	mov	ecx, DWORD PTR _result$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 1188
	mov	eax, DWORD PTR _result$[ebp]
	jmp	$L1049
; Line 1189
$L1049:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_stabilize_reference ENDP
_va_alist$ = 8
_p$ = -4
_code$ = -20
_t$ = -12
_length$ = -16
_i$ = -8
_arg0$1071 = -28
_arg1$1072 = -24
_operand$1077 = -32
_build	PROC NEAR
; Line 1201
	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H
	push	ebx
	push	esi
	push	edi
; Line 1208
	lea	eax, DWORD PTR _va_alist$[ebp]
	mov	DWORD PTR _p$[ebp], eax
; Line 1210
	add	DWORD PTR _p$[ebp], 4
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax-4]
	mov	DWORD PTR _code$[ebp], eax
; Line 1211
	mov	eax, DWORD PTR _code$[ebp]
	push	eax
	call	_make_node
	add	esp, 4
	mov	DWORD PTR _t$[ebp], eax
; Line 1212
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _tree_code_length[eax*4]
	mov	DWORD PTR _length$[ebp], eax
; Line 1213
	add	DWORD PTR _p$[ebp], 4
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax-4]
	mov	ecx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 1215
	cmp	DWORD PTR _length$[ebp], 2
	jne	$L1070
; Line 1218
	add	DWORD PTR _p$[ebp], 4
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax-4]
	mov	DWORD PTR _arg0$1071[ebp], eax
; Line 1219
	add	DWORD PTR _p$[ebp], 4
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax-4]
	mov	DWORD PTR _arg1$1072[ebp], eax
; Line 1220
	mov	eax, DWORD PTR _arg0$1071[ebp]
	mov	ecx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [ecx+24], eax
; Line 1221
	mov	eax, DWORD PTR _arg1$1072[ebp]
	mov	ecx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 1223
	cmp	DWORD PTR _arg0$1071[ebp], 0
	je	$L1401
	mov	eax, DWORD PTR _arg0$1071[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 3
	test	al, 1
	jne	$L1400
$L1401:
	cmp	DWORD PTR _arg1$1072[ebp], 0
	je	$L1398
	mov	eax, DWORD PTR _arg1$1072[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 3
	test	al, 1
	je	$L1398
$L1400:
	mov	eax, DWORD PTR _t$[ebp]
	mov	eax, DWORD PTR [eax+16]
	or	eax, 8
	mov	ecx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [ecx+16], eax
	jmp	$L1399
$L1398:
	mov	eax, DWORD PTR _t$[ebp]
	and	DWORD PTR [eax+16], -9			; fffffff7H
$L1399:
; Line 1225
	jmp	$L1073
$L1070:
; Line 1227
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L1074
$L1075:
	inc	DWORD PTR _i$[ebp]
$L1074:
	mov	eax, DWORD PTR _length$[ebp]
	cmp	DWORD PTR _i$[ebp], eax
	jge	$L1076
; Line 1229
	add	DWORD PTR _p$[ebp], 4
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax-4]
	mov	DWORD PTR _operand$1077[ebp], eax
; Line 1230
	mov	eax, DWORD PTR _operand$1077[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [edx+ecx*4+24], eax
; Line 1231
	cmp	DWORD PTR _operand$1077[ebp], 0
	je	$L1078
	mov	eax, DWORD PTR _operand$1077[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 3
	test	al, 1
	je	$L1078
; Line 1232
	mov	eax, DWORD PTR _t$[ebp]
	mov	eax, DWORD PTR [eax+16]
	or	eax, 8
	mov	ecx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 1233
$L1078:
	jmp	$L1075
$L1076:
; Line 1234
$L1073:
; Line 1236
	mov	eax, DWORD PTR _t$[ebp]
	jmp	$L1064
; Line 1237
$L1064:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_build	ENDP
_va_alist$ = 8
_p$ = -4
_code$ = -20
_t$ = -12
_length$ = -16
_i$ = -8
_build_nt PROC NEAR
; Line 1247
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	push	ebx
	push	esi
	push	edi
; Line 1254
	lea	eax, DWORD PTR _va_alist$[ebp]
	mov	DWORD PTR _p$[ebp], eax
; Line 1256
	add	DWORD PTR _p$[ebp], 4
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax-4]
	mov	DWORD PTR _code$[ebp], eax
; Line 1257
	mov	eax, DWORD PTR _code$[ebp]
	push	eax
	call	_make_node
	add	esp, 4
	mov	DWORD PTR _t$[ebp], eax
; Line 1258
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _tree_code_length[eax*4]
	mov	DWORD PTR _length$[ebp], eax
; Line 1260
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L1086
$L1087:
	inc	DWORD PTR _i$[ebp]
$L1086:
	mov	eax, DWORD PTR _length$[ebp]
	cmp	DWORD PTR _i$[ebp], eax
	jge	$L1088
; Line 1261
	add	DWORD PTR _p$[ebp], 4
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax-4]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [edx+ecx*4+24], eax
	jmp	$L1087
$L1088:
; Line 1264
	mov	eax, DWORD PTR _t$[ebp]
	jmp	$L1080
; Line 1265
$L1080:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_build_nt ENDP
_TEXT	ENDS
PUBLIC	_build_op_identifier
_TEXT	SEGMENT
_op1$ = 8
_op2$ = 12
_t$ = -4
_build_op_identifier PROC NEAR
; Line 1270
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 1271
	push	2
	call	_make_node
	add	esp, 4
	mov	DWORD PTR _t$[ebp], eax
; Line 1272
	mov	eax, DWORD PTR _op1$[ebp]
	mov	ecx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [ecx+20], eax
; Line 1273
	mov	eax, DWORD PTR _op2$[ebp]
	mov	ecx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [ecx+24], eax
; Line 1274
	mov	eax, DWORD PTR _t$[ebp]
	jmp	$L1091
; Line 1275
$L1091:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_build_op_identifier ENDP
_TEXT	ENDS
PUBLIC	_build_decl
EXTRN	_layout_decl:NEAR
_TEXT	SEGMENT
_code$ = 8
_name$ = 12
_type$ = 16
_t$ = -4
_build_decl PROC NEAR
; Line 1287
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 1290
	mov	eax, DWORD PTR _code$[ebp]
	push	eax
	call	_make_node
	add	esp, 4
	mov	DWORD PTR _t$[ebp], eax
; Line 1297
	mov	eax, DWORD PTR _name$[ebp]
	mov	ecx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [ecx+40], eax
; Line 1298
	cmp	DWORD PTR _name$[ebp], 0
	je	$L1098
; Line 1300
	mov	eax, DWORD PTR _name$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	ecx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [ecx+68], eax
; Line 1301
	mov	eax, DWORD PTR _name$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	ecx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [ecx+72], eax
; Line 1303
$L1098:
	mov	eax, DWORD PTR _type$[ebp]
	mov	ecx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 1304
	mov	eax, DWORD PTR _t$[ebp]
	mov	DWORD PTR [eax+56], 0
; Line 1305
	mov	eax, DWORD PTR _t$[ebp]
	mov	DWORD PTR [eax+64], 0
; Line 1307
	cmp	DWORD PTR _code$[ebp], 43		; 0000002bH
	je	$L1100
	cmp	DWORD PTR _code$[ebp], 44		; 0000002cH
	je	$L1100
	cmp	DWORD PTR _code$[ebp], 45		; 0000002dH
	jne	$L1099
$L1100:
; Line 1308
	push	0
	mov	eax, DWORD PTR _t$[ebp]
	push	eax
	call	_layout_decl
	add	esp, 8
; Line 1309
	jmp	$L1101
$L1099:
	cmp	DWORD PTR _code$[ebp], 39		; 00000027H
	jne	$L1102
; Line 1310
	mov	eax, DWORD PTR _t$[ebp]
	mov	eax, DWORD PTR [eax+32]
	and	eax, -255				; ffffff01H
	or	eax, 1
	mov	ecx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [ecx+32], eax
; Line 1312
$L1102:
$L1101:
	mov	eax, DWORD PTR _t$[ebp]
	jmp	$L1096
; Line 1313
$L1096:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_build_decl ENDP
_TEXT	ENDS
PUBLIC	_build_let
_TEXT	SEGMENT
_filename$ = 8
_line$ = 12
_vars$ = 16
_subblocks$ = 20
_supercontext$ = 24
_tags$ = 28
_t$ = -4
_build_let PROC NEAR
; Line 1455
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 1456
	push	28					; 0000001cH
	call	_make_node
	add	esp, 4
	mov	DWORD PTR _t$[ebp], eax
; Line 1457
	mov	eax, DWORD PTR _filename$[ebp]
	mov	ecx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [ecx+20], eax
; Line 1458
	mov	eax, DWORD PTR _line$[ebp]
	mov	ecx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [ecx+24], eax
; Line 1459
	mov	eax, DWORD PTR _vars$[ebp]
	mov	ecx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [ecx+32], eax
; Line 1460
	mov	eax, DWORD PTR _subblocks$[ebp]
	mov	ecx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [ecx+48], eax
; Line 1461
	mov	eax, DWORD PTR _supercontext$[ebp]
	mov	ecx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [ecx+36], eax
; Line 1462
	mov	eax, DWORD PTR _t$[ebp]
	mov	DWORD PTR [eax+40], 0
; Line 1463
	mov	eax, DWORD PTR _tags$[ebp]
	mov	ecx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [ecx+44], eax
; Line 1464
	mov	eax, DWORD PTR _t$[ebp]
	jmp	$L1109
; Line 1465
$L1109:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_build_let ENDP
_TEXT	ENDS
PUBLIC	_build_type_variant
_TEXT	SEGMENT
_type$ = 8
_constp$ = 12
_volatilep$ = 16
_t$ = -12
_m$ = -8
_ambient_obstack$ = -4
_build_type_variant PROC NEAR
; Line 1484
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 1485
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+68]
	mov	DWORD PTR _m$[ebp], eax
; Line 1486
	mov	eax, DWORD PTR _current_obstack
	mov	DWORD PTR _ambient_obstack$[ebp], eax
; Line 1489
	cmp	DWORD PTR _constp$[ebp], 1
	sbb	eax, eax
	inc	eax
	mov	DWORD PTR _constp$[ebp], eax
; Line 1490
	cmp	DWORD PTR _volatilep$[ebp], 1
	sbb	eax, eax
	inc	eax
	mov	DWORD PTR _volatilep$[ebp], eax
; Line 1494
	mov	eax, DWORD PTR _m$[ebp]
	mov	DWORD PTR _t$[ebp], eax
	jmp	$L1118
$L1119:
	mov	eax, DWORD PTR _t$[ebp]
	mov	eax, DWORD PTR [eax+64]
	mov	DWORD PTR _t$[ebp], eax
$L1118:
	cmp	DWORD PTR _t$[ebp], 0
	je	$L1120
; Line 1496
	mov	eax, DWORD PTR _t$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 5
	and	eax, 1
	cmp	eax, DWORD PTR _constp$[ebp]
	jne	$L1121
	mov	eax, DWORD PTR _t$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 3
	and	eax, 1
	cmp	eax, DWORD PTR _volatilep$[ebp]
	jne	$L1121
; Line 1497
	mov	eax, DWORD PTR _t$[ebp]
	jmp	$L1114
; Line 1500
$L1121:
	jmp	$L1119
$L1120:
; Line 1501
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 8
	test	al, 1
	je	$L1402
	mov	DWORD PTR _current_obstack, OFFSET _permanent_obstack
	jmp	$L1403
$L1402:
	mov	eax, DWORD PTR _saveable_obstack
	mov	DWORD PTR _current_obstack, eax
$L1403:
; Line 1503
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_copy_node
	add	esp, 4
	mov	DWORD PTR _t$[ebp], eax
; Line 1504
	mov	eax, DWORD PTR _t$[ebp]
	mov	eax, DWORD PTR [eax+16]
	and	eax, -33				; ffffffdfH
	mov	ecx, DWORD PTR _constp$[ebp]
	and	ecx, 1
	shl	ecx, 5
	or	eax, ecx
	mov	ecx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 1505
	mov	eax, DWORD PTR _volatilep$[ebp]
	and	eax, 1
	shl	eax, 3
	mov	ecx, DWORD PTR _t$[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	and	ecx, -9					; fffffff7H
	or	eax, ecx
	mov	ecx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 1506
	mov	eax, DWORD PTR _t$[ebp]
	mov	DWORD PTR [eax+40], 0
; Line 1507
	mov	eax, DWORD PTR _t$[ebp]
	mov	DWORD PTR [eax+44], 0
; Line 1510
	mov	eax, DWORD PTR _m$[ebp]
	mov	eax, DWORD PTR [eax+64]
	mov	ecx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [ecx+64], eax
; Line 1511
	mov	eax, DWORD PTR _t$[ebp]
	mov	ecx, DWORD PTR _m$[ebp]
	mov	DWORD PTR [ecx+64], eax
; Line 1513
	mov	eax, DWORD PTR _ambient_obstack$[ebp]
	mov	DWORD PTR _current_obstack, eax
; Line 1514
	mov	eax, DWORD PTR _t$[ebp]
	jmp	$L1114
; Line 1515
$L1114:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_build_type_variant ENDP
_TEXT	ENDS
PUBLIC	_type_hash_list
_TEXT	SEGMENT
_list$ = 8
_hashcode$ = -8
_tail$ = -4
_type_hash_list PROC NEAR
; Line 1551
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 1554
	mov	DWORD PTR _hashcode$[ebp], 0
	mov	eax, DWORD PTR _list$[ebp]
	mov	DWORD PTR _tail$[ebp], eax
	jmp	$L1129
$L1130:
	mov	eax, DWORD PTR _tail$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _tail$[ebp], eax
$L1129:
	cmp	DWORD PTR _tail$[ebp], 0
	je	$L1131
; Line 1555
	mov	eax, DWORD PTR _tail$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	eax, DWORD PTR [eax]
	add	DWORD PTR _hashcode$[ebp], eax
	jmp	$L1130
$L1131:
; Line 1556
	mov	eax, DWORD PTR _hashcode$[ebp]
	jmp	$L1126
; Line 1557
$L1126:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_type_hash_list ENDP
_TEXT	ENDS
PUBLIC	_type_hash_lookup
PUBLIC	_type_list_equal
_TEXT	SEGMENT
_hashcode$ = 8
_type$ = 12
_h$ = -4
_type_hash_lookup PROC NEAR
; Line 1566
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 1568
	mov	ecx, 59					; 0000003bH
	mov	eax, DWORD PTR _hashcode$[ebp]
	cdq
	idiv	ecx
	mov	eax, DWORD PTR _type_hash_table[edx*4]
	mov	DWORD PTR _h$[ebp], eax
	jmp	$L1137
$L1138:
	mov	eax, DWORD PTR _h$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _h$[ebp], eax
$L1137:
	cmp	DWORD PTR _h$[ebp], 0
	je	$L1139
; Line 1581
	mov	eax, DWORD PTR _h$[ebp]
	mov	ecx, DWORD PTR _hashcode$[ebp]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L1141
	mov	eax, DWORD PTR _h$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _type$[ebp]
	mov	cl, BYTE PTR [ecx+12]
	and	ecx, 255				; 000000ffH
	cmp	eax, ecx
	jne	$L1141
	mov	eax, DWORD PTR _h$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _type$[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	cmp	DWORD PTR [eax+8], ecx
	jne	$L1141
	mov	eax, DWORD PTR _h$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _type$[ebp]
	mov	ecx, DWORD PTR [ecx+60]
	cmp	DWORD PTR [eax+60], ecx
	je	$L1142
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+60]
	push	eax
	mov	eax, DWORD PTR _h$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+60]
	push	eax
	call	_tree_int_cst_equal
	add	esp, 8
	or	eax, eax
	je	$L1141
$L1142:
	mov	eax, DWORD PTR _h$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _type$[ebp]
	mov	ecx, DWORD PTR [ecx+24]
	cmp	DWORD PTR [eax+24], ecx
	je	$L1143
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	mov	eax, DWORD PTR _h$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_tree_int_cst_equal
	add	esp, 8
	or	eax, eax
	je	$L1141
$L1143:
	mov	eax, DWORD PTR _h$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _type$[ebp]
	mov	ecx, DWORD PTR [ecx+20]
	cmp	DWORD PTR [eax+20], ecx
	je	$L1144
	mov	eax, DWORD PTR _h$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+20]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 3
	jne	$L1141
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 3
	jne	$L1141
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	mov	eax, DWORD PTR _h$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	call	_type_list_equal
	add	esp, 8
	or	eax, eax
	je	$L1141
$L1144:
; Line 1582
	mov	eax, DWORD PTR _h$[ebp]
	mov	eax, DWORD PTR [eax+8]
	jmp	$L1135
; Line 1583
$L1141:
	jmp	$L1138
$L1139:
	sub	eax, eax
	jmp	$L1135
; Line 1584
$L1135:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_type_hash_lookup ENDP
_TEXT	ENDS
PUBLIC	_type_hash_add
_TEXT	SEGMENT
_hashcode$ = 8
_type$ = 12
_h$ = -4
_type_hash_add PROC NEAR
; Line 1593
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 1596
	push	12					; 0000000cH
	call	_oballoc
	add	esp, 4
	mov	DWORD PTR _h$[ebp], eax
; Line 1597
	mov	eax, DWORD PTR _hashcode$[ebp]
	mov	ecx, DWORD PTR _h$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 1598
	mov	eax, DWORD PTR _type$[ebp]
	mov	ecx, DWORD PTR _h$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 1599
	mov	ecx, 59					; 0000003bH
	mov	eax, DWORD PTR _hashcode$[ebp]
	cdq
	idiv	ecx
	mov	eax, DWORD PTR _type_hash_table[edx*4]
	mov	ecx, DWORD PTR _h$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 1600
	mov	ecx, DWORD PTR _h$[ebp]
	mov	ebx, 59					; 0000003bH
	mov	eax, DWORD PTR _hashcode$[ebp]
	cdq
	idiv	ebx
	mov	DWORD PTR _type_hash_table[edx*4], ecx
; Line 1601
$L1148:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_type_hash_add ENDP
_TEXT	ENDS
PUBLIC	_type_hash_canon
_TEXT	SEGMENT
_type$ = 12
_t1$ = -4
_o$1157 = -8
_hashcode$ = 8
_type_hash_canon PROC NEAR
; Line 1621
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 1624
	cmp	DWORD PTR _debug_no_type_hash, 0
	je	$L1155
; Line 1625
	mov	eax, DWORD PTR _type$[ebp]
	jmp	$L1153
; Line 1627
$L1155:
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	mov	eax, DWORD PTR _hashcode$[ebp]
	push	eax
	call	_type_hash_lookup
	add	esp, 8
	mov	DWORD PTR _t1$[ebp], eax
; Line 1628
	cmp	DWORD PTR _t1$[ebp], 0
	je	$L1156
; Line 1631
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 8
	test	al, 1
	je	$L1404
	mov	DWORD PTR _o$1157[ebp], OFFSET _permanent_obstack
	jmp	$L1405
$L1404:
	mov	eax, DWORD PTR _saveable_obstack
	mov	DWORD PTR _o$1157[ebp], eax
$L1405:
; Line 1632
	mov	eax, DWORD PTR _type$[ebp]
	mov	ecx, DWORD PTR _o$1157[ebp]
	sub	eax, DWORD PTR [ecx+4]
	mov	ecx, DWORD PTR _o$1157[ebp]
	mov	DWORD PTR [ecx+20], eax
	mov	eax, DWORD PTR _o$1157[ebp]
	cmp	DWORD PTR [eax+20], 0
	jl	$L1406
	mov	eax, DWORD PTR _o$1157[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _o$1157[ebp]
	sub	eax, DWORD PTR [ecx+4]
	mov	ecx, DWORD PTR _o$1157[ebp]
	cmp	eax, DWORD PTR [ecx+20]
	jle	$L1406
	mov	eax, DWORD PTR _o$1157[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	ecx, DWORD PTR _o$1157[ebp]
	add	eax, DWORD PTR [ecx+4]
	mov	ecx, DWORD PTR _o$1157[ebp]
	mov	DWORD PTR [ecx+8], eax
	mov	eax, DWORD PTR _o$1157[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _o$1157[ebp]
	mov	DWORD PTR [ecx+12], eax
	jmp	$L1407
$L1406:
	mov	eax, DWORD PTR _o$1157[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	ecx, DWORD PTR _o$1157[ebp]
	add	eax, DWORD PTR [ecx+4]
	push	eax
	mov	eax, DWORD PTR _o$1157[ebp]
	push	eax
	call	__obstack_free
	add	esp, 8
$L1407:
; Line 1633
	mov	eax, DWORD PTR _t1$[ebp]
	jmp	$L1153
; Line 1637
$L1156:
	cmp	DWORD PTR _current_obstack, OFFSET _permanent_obstack
	jne	$L1158
; Line 1638
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	mov	eax, DWORD PTR _hashcode$[ebp]
	push	eax
	call	_type_hash_add
	add	esp, 8
; Line 1640
$L1158:
	mov	eax, DWORD PTR _type$[ebp]
	jmp	$L1153
; Line 1641
$L1153:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_type_hash_canon ENDP
_TEXT	ENDS
PUBLIC	_simple_cst_equal
_TEXT	SEGMENT
_l1$ = 8
_l2$ = 12
_t1$ = -8
_t2$ = -4
_type_list_equal PROC NEAR
; Line 1651
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 1653
	mov	eax, DWORD PTR _l1$[ebp]
	mov	DWORD PTR _t1$[ebp], eax
	mov	eax, DWORD PTR _l2$[ebp]
	mov	DWORD PTR _t2$[ebp], eax
	jmp	$L1164
$L1165:
	mov	eax, DWORD PTR _t1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _t1$[ebp], eax
	mov	eax, DWORD PTR _t2$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _t2$[ebp], eax
$L1164:
	cmp	DWORD PTR _t1$[ebp], 0
	je	$L1166
	cmp	DWORD PTR _t2$[ebp], 0
	je	$L1166
; Line 1655
	mov	eax, DWORD PTR _t2$[ebp]
	mov	ecx, DWORD PTR _t1$[ebp]
	mov	ecx, DWORD PTR [ecx+24]
	cmp	DWORD PTR [eax+24], ecx
	je	$L1167
; Line 1656
	sub	eax, eax
	jmp	$L1161
; Line 1657
$L1167:
; Line 1658
	mov	eax, DWORD PTR _t1$[ebp]
	mov	ecx, DWORD PTR _t2$[ebp]
	mov	ecx, DWORD PTR [ecx+20]
	cmp	DWORD PTR [eax+20], ecx
	je	$L1169
	mov	eax, DWORD PTR _t2$[ebp]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	mov	eax, DWORD PTR _t1$[ebp]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	call	_simple_cst_equal
	add	esp, 8
	or	eax, eax
	jne	$L1169
; Line 1659
	sub	eax, eax
	jmp	$L1161
; Line 1660
$L1169:
	jmp	$L1165
$L1166:
; Line 1662
	mov	eax, DWORD PTR _t2$[ebp]
	sub	eax, DWORD PTR _t1$[ebp]
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	jmp	$L1161
; Line 1663
$L1161:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_type_list_equal ENDP
_t1$ = 8
_t2$ = 12
_tree_int_cst_equal PROC NEAR
; Line 1671
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1672
	mov	eax, DWORD PTR _t1$[ebp]
	cmp	DWORD PTR _t2$[ebp], eax
	jne	$L1173
; Line 1673
	mov	eax, 1
	jmp	$L1172
; Line 1674
$L1173:
	cmp	DWORD PTR _t1$[ebp], 0
	je	$L1175
	cmp	DWORD PTR _t2$[ebp], 0
	jne	$L1174
$L1175:
; Line 1675
	sub	eax, eax
	jmp	$L1172
; Line 1676
$L1174:
; Line 1679
	mov	eax, DWORD PTR _t1$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L1176
	mov	eax, DWORD PTR _t2$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L1176
	mov	eax, DWORD PTR _t2$[ebp]
	mov	ecx, DWORD PTR _t1$[ebp]
	mov	ecx, DWORD PTR [ecx+20]
	cmp	DWORD PTR [eax+20], ecx
	jne	$L1176
	mov	eax, DWORD PTR _t2$[ebp]
	mov	ecx, DWORD PTR _t1$[ebp]
	mov	ecx, DWORD PTR [ecx+24]
	cmp	DWORD PTR [eax+24], ecx
	jne	$L1176
; Line 1680
	mov	eax, 1
	jmp	$L1172
; Line 1681
$L1176:
	sub	eax, eax
	jmp	$L1172
; Line 1682
$L1172:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_tree_int_cst_equal ENDP
_TEXT	ENDS
PUBLIC	_tree_int_cst_lt
_TEXT	SEGMENT
_t1$ = 8
_t2$ = 12
_tree_int_cst_lt PROC NEAR
; Line 1690
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1691
	mov	eax, DWORD PTR _t1$[ebp]
	cmp	DWORD PTR _t2$[ebp], eax
	jne	$L1181
; Line 1692
	sub	eax, eax
	jmp	$L1180
; Line 1694
$L1181:
	mov	eax, DWORD PTR _t1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 12					; 0000000cH
	test	al, 1
	jne	$L1182
; Line 1695
	mov	eax, DWORD PTR _t2$[ebp]
	mov	ecx, DWORD PTR _t1$[ebp]
	mov	ecx, DWORD PTR [ecx+24]
	cmp	DWORD PTR [eax+24], ecx
	jg	$L1410
	mov	eax, DWORD PTR _t2$[ebp]
	mov	ecx, DWORD PTR _t1$[ebp]
	mov	ecx, DWORD PTR [ecx+24]
	cmp	DWORD PTR [eax+24], ecx
	jne	$L1408
	mov	eax, DWORD PTR _t2$[ebp]
	mov	ecx, DWORD PTR _t1$[ebp]
	mov	ecx, DWORD PTR [ecx+20]
	cmp	DWORD PTR [eax+20], ecx
	jbe	$L1408
$L1410:
	mov	eax, 1
	jmp	$L1409
$L1408:
	sub	eax, eax
$L1409:
	jmp	$L1180
; Line 1696
$L1182:
	mov	eax, DWORD PTR _t2$[ebp]
	mov	ecx, DWORD PTR _t1$[ebp]
	mov	ecx, DWORD PTR [ecx+24]
	cmp	DWORD PTR [eax+24], ecx
	ja	$L1413
	mov	eax, DWORD PTR _t2$[ebp]
	mov	ecx, DWORD PTR _t1$[ebp]
	mov	ecx, DWORD PTR [ecx+24]
	cmp	DWORD PTR [eax+24], ecx
	jne	$L1411
	mov	eax, DWORD PTR _t2$[ebp]
	mov	ecx, DWORD PTR _t1$[ebp]
	mov	ecx, DWORD PTR [ecx+20]
	cmp	DWORD PTR [eax+20], ecx
	jbe	$L1411
$L1413:
	mov	eax, 1
	jmp	$L1412
$L1411:
	sub	eax, eax
$L1412:
	jmp	$L1180
; Line 1697
$L1180:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_tree_int_cst_lt ENDP
_t1$ = 8
_t2$ = 12
_code1$ = -8
_code2$ = -4
_simple_cst_equal PROC NEAR
; Line 1704
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 1707
	mov	eax, DWORD PTR _t1$[ebp]
	cmp	DWORD PTR _t2$[ebp], eax
	jne	$L1188
; Line 1708
	mov	eax, 1
	jmp	$L1185
; Line 1709
$L1188:
	cmp	DWORD PTR _t1$[ebp], 0
	je	$L1190
	cmp	DWORD PTR _t2$[ebp], 0
	jne	$L1189
$L1190:
; Line 1710
	sub	eax, eax
	jmp	$L1185
; Line 1712
$L1189:
	mov	eax, DWORD PTR _t1$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _code1$[ebp], eax
; Line 1713
	mov	eax, DWORD PTR _t2$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _code2$[ebp], eax
; Line 1715
	cmp	DWORD PTR _code1$[ebp], 113		; 00000071H
	je	$L1192
	cmp	DWORD PTR _code1$[ebp], 112		; 00000070H
	jne	$L1191
$L1192:
; Line 1716
	cmp	DWORD PTR _code2$[ebp], 113		; 00000071H
	je	$L1194
	cmp	DWORD PTR _code2$[ebp], 112		; 00000070H
	jne	$L1193
$L1194:
; Line 1717
	mov	eax, DWORD PTR _t2$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	mov	eax, DWORD PTR _t1$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_simple_cst_equal
	add	esp, 8
	jmp	$L1185
; Line 1718
	jmp	$L1195
$L1193:
; Line 1719
	mov	eax, DWORD PTR _t2$[ebp]
	push	eax
	mov	eax, DWORD PTR _t1$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_simple_cst_equal
	add	esp, 8
	jmp	$L1185
$L1195:
; Line 1720
	jmp	$L1196
$L1191:
	cmp	DWORD PTR _code2$[ebp], 113		; 00000071H
	je	$L1198
	cmp	DWORD PTR _code2$[ebp], 112		; 00000070H
	jne	$L1197
$L1198:
; Line 1721
	mov	eax, DWORD PTR _t2$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	mov	eax, DWORD PTR _t1$[ebp]
	push	eax
	call	_simple_cst_equal
	add	esp, 8
	jmp	$L1185
; Line 1723
$L1197:
$L1196:
	mov	eax, DWORD PTR _code1$[ebp]
	cmp	DWORD PTR _code2$[ebp], eax
	je	$L1199
; Line 1724
	sub	eax, eax
	jmp	$L1185
; Line 1726
$L1199:
	mov	eax, DWORD PTR _code1$[ebp]
	mov	DWORD PTR -12+[ebp], eax
	jmp	$L1200
; Line 1728
$L1204:
; Line 1730
	mov	eax, DWORD PTR _t2$[ebp]
	mov	ecx, DWORD PTR _t1$[ebp]
	mov	ecx, DWORD PTR [ecx+20]
	cmp	DWORD PTR [eax+20], ecx
	jne	$L1414
	mov	eax, DWORD PTR _t1$[ebp]
	mov	ecx, DWORD PTR _t2$[ebp]
	mov	ecx, DWORD PTR [ecx+24]
	cmp	DWORD PTR [eax+24], ecx
	jne	$L1414
	mov	eax, 1
	jmp	$L1415
$L1414:
	sub	eax, eax
$L1415:
	jmp	$L1185
; Line 1732
$L1205:
; Line 1733
	mov	eax, DWORD PTR _t2$[ebp]
	fld	QWORD PTR [eax+24]
	mov	eax, DWORD PTR _t1$[ebp]
	fcomp	QWORD PTR [eax+24]
	fnstsw	ax
	test	ah, 64					; 00000040H
	mov	eax, 0
	setne	al
	jmp	$L1185
; Line 1735
$L1206:
; Line 1737
	mov	eax, DWORD PTR _t1$[ebp]
	mov	ecx, DWORD PTR _t2$[ebp]
	mov	ecx, DWORD PTR [ecx+24]
	cmp	DWORD PTR [eax+24], ecx
	jne	$L1416
	mov	eax, DWORD PTR _t2$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	mov	eax, DWORD PTR _t1$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L1416
	mov	eax, 1
	jmp	$L1417
$L1416:
	sub	eax, eax
$L1417:
	jmp	$L1185
; Line 1739
$L1207:
; Line 1740
	call	_abort
; Line 1742
$L1208:
; Line 1745
	sub	eax, eax
	jmp	$L1185
; Line 1747
$L1209:
; Line 1755
	mov	eax, DWORD PTR _t2$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	mov	eax, DWORD PTR _t1$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_simple_cst_equal
	add	esp, 8
	or	eax, eax
	je	$L1418
	mov	eax, DWORD PTR _t2$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	mov	eax, DWORD PTR _t1$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	call	_simple_cst_equal
	add	esp, 8
	or	eax, eax
	je	$L1418
	mov	eax, 1
	jmp	$L1419
$L1418:
	sub	eax, eax
$L1419:
	jmp	$L1185
; Line 1757
$L1210:
; Line 1761
	mov	eax, DWORD PTR _t2$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	mov	eax, DWORD PTR _t1$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_simple_cst_equal
	add	esp, 8
	jmp	$L1185
; Line 1763
$L1211:
; Line 1764
	call	_abort
; Line 1765
	jmp	$L1201
$L1200:
	cmp	DWORD PTR -12+[ebp], 52			; 00000034H
	jg	$L1420
	je	$L1207
	sub	DWORD PTR -12+[ebp], 35			; 00000023H
	cmp	DWORD PTR -12+[ebp], 13			; 0000000dH
	ja	$L1211
	shl	DWORD PTR -12+[ebp], 2
	mov	eax, DWORD PTR -12+[ebp]
	jmp	DWORD PTR $L1422[eax]
$L1422:
	DD	OFFSET $L1204
	DD	OFFSET $L1205
	DD	OFFSET $L1211
	DD	OFFSET $L1206
	DD	OFFSET $L1211
	DD	OFFSET $L1211
	DD	OFFSET $L1208
	DD	OFFSET $L1211
	DD	OFFSET $L1208
	DD	OFFSET $L1208
	DD	OFFSET $L1211
	DD	OFFSET $L1211
	DD	OFFSET $L1211
	DD	OFFSET $L1210
$L1420:
	cmp	DWORD PTR -12+[ebp], 83			; 00000053H
	jg	$L1421
	je	$L1210
	cmp	DWORD PTR -12+[ebp], 64			; 00000040H
	jl	$L1211
	cmp	DWORD PTR -12+[ebp], 67			; 00000043H
	jle	$L1209
	cmp	DWORD PTR -12+[ebp], 71			; 00000047H
	je	$L1209
	jmp	$L1211
$L1421:
	cmp	DWORD PTR -12+[ebp], 88			; 00000058H
	jl	$L1211
	cmp	DWORD PTR -12+[ebp], 89			; 00000059H
	jle	$L1209
	cmp	DWORD PTR -12+[ebp], 116		; 00000074H
	jl	$L1211
	cmp	DWORD PTR -12+[ebp], 117		; 00000075H
	jle	$L1210
	jmp	$L1211
$L1201:
; Line 1766
$L1185:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_simple_cst_equal ENDP
_TEXT	ENDS
PUBLIC	_build_pointer_type
EXTRN	_layout_type:NEAR
_TEXT	SEGMENT
_ambient_saveable_obstack$ = -8
_to_type$ = 8
_t$ = -12
_ambient_obstack$ = -4
_build_pointer_type PROC NEAR
; Line 1778
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 1779
	mov	eax, DWORD PTR _to_type$[ebp]
	mov	eax, DWORD PTR [eax+40]
	mov	DWORD PTR _t$[ebp], eax
; Line 1780
	mov	eax, DWORD PTR _current_obstack
	mov	DWORD PTR _ambient_obstack$[ebp], eax
; Line 1781
	mov	eax, DWORD PTR _saveable_obstack
	mov	DWORD PTR _ambient_saveable_obstack$[ebp], eax
; Line 1785
	cmp	DWORD PTR _t$[ebp], 0
	je	$L1217
; Line 1786
	mov	eax, DWORD PTR _t$[ebp]
	jmp	$L1213
; Line 1789
$L1217:
	mov	eax, DWORD PTR _to_type$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 8
	test	al, 1
	je	$L1218
; Line 1791
	mov	DWORD PTR _current_obstack, OFFSET _permanent_obstack
; Line 1792
	mov	DWORD PTR _saveable_obstack, OFFSET _permanent_obstack
; Line 1795
$L1218:
	push	11					; 0000000bH
	call	_make_node
	add	esp, 4
	mov	DWORD PTR _t$[ebp], eax
; Line 1796
	mov	eax, DWORD PTR _to_type$[ebp]
	mov	ecx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 1799
	mov	eax, DWORD PTR _t$[ebp]
	mov	ecx, DWORD PTR _to_type$[ebp]
	mov	DWORD PTR [ecx+40], eax
; Line 1804
	mov	eax, DWORD PTR _t$[ebp]
	push	eax
	call	_layout_type
	add	esp, 4
; Line 1806
	mov	eax, DWORD PTR _ambient_obstack$[ebp]
	mov	DWORD PTR _current_obstack, eax
; Line 1807
	mov	eax, DWORD PTR _ambient_saveable_obstack$[ebp]
	mov	DWORD PTR _saveable_obstack, eax
; Line 1808
	mov	eax, DWORD PTR _t$[ebp]
	jmp	$L1213
; Line 1809
$L1213:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_build_pointer_type ENDP
_TEXT	ENDS
PUBLIC	_build_index_type
EXTRN	_convert:NEAR
EXTRN	_sizetype:DWORD
_TEXT	SEGMENT
_maxval$ = 8
_itype$ = -4
_maxint$1223 = -8
_build_index_type PROC NEAR
; Line 1818
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 1819
	push	5
	call	_make_node
	add	esp, 4
	mov	DWORD PTR _itype$[ebp], eax
; Line 1820
	mov	eax, DWORD PTR _itype$[ebp]
	mov	BYTE PTR [eax+38], 32			; 00000020H
; Line 1821
	push	0
	push	0
	call	_build_int_2
	add	esp, 8
	mov	ecx, DWORD PTR _itype$[ebp]
	mov	DWORD PTR [ecx+24], eax
; Line 1822
	mov	eax, DWORD PTR _sizetype
	mov	ecx, DWORD PTR _itype$[ebp]
	mov	ecx, DWORD PTR [ecx+24]
	mov	DWORD PTR [ecx+8], eax
; Line 1823
	mov	eax, DWORD PTR _maxval$[ebp]
	push	eax
	mov	eax, DWORD PTR _sizetype
	push	eax
	call	_convert
	add	esp, 8
	mov	ecx, DWORD PTR _itype$[ebp]
	mov	DWORD PTR [ecx+60], eax
; Line 1824
	mov	eax, DWORD PTR _itype$[ebp]
	mov	eax, DWORD PTR [eax+32]
	and	eax, -252				; ffffff04H
	or	eax, 4
	mov	ecx, DWORD PTR _itype$[ebp]
	mov	DWORD PTR [ecx+32], eax
; Line 1825
	mov	eax, DWORD PTR _sizetype
	mov	eax, DWORD PTR [eax+28]
	mov	ecx, DWORD PTR _itype$[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 1826
	mov	eax, DWORD PTR _sizetype
	mov	al, BYTE PTR [eax+36]
	mov	ecx, DWORD PTR _itype$[ebp]
	mov	BYTE PTR [ecx+36], al
; Line 1827
	mov	eax, DWORD PTR _sizetype
	mov	al, BYTE PTR [eax+37]
	mov	ecx, DWORD PTR _itype$[ebp]
	mov	BYTE PTR [ecx+37], al
; Line 1828
	mov	eax, DWORD PTR _maxval$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L1222
; Line 1830
	mov	eax, DWORD PTR _maxval$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _maxint$1223[ebp], eax
; Line 1831
	mov	eax, DWORD PTR _itype$[ebp]
	push	eax
	mov	eax, DWORD PTR _maxint$1223[ebp]
	cdq
	xor	eax, edx
	sub	eax, edx
	push	eax
	call	_type_hash_canon
	add	esp, 8
	jmp	$L1220
; Line 1833
	jmp	$L1224
$L1222:
; Line 1834
	mov	eax, DWORD PTR _itype$[ebp]
	jmp	$L1220
$L1224:
; Line 1835
$L1220:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_build_index_type ENDP
_TEXT	ENDS
PUBLIC	_build_array_type
_DATA	SEGMENT
	ORG $+3
$SG1231	DB	'arrays of functions are not meaningful', 00H
_DATA	ENDS
_TEXT	SEGMENT
_elt_type$ = 8
_index_type$ = 12
_t$ = -4
_hashcode$ = -8
_build_array_type PROC NEAR
; Line 1844
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 1845
	push	16					; 00000010H
	call	_make_node
	add	esp, 4
	mov	DWORD PTR _t$[ebp], eax
; Line 1848
	mov	eax, DWORD PTR _elt_type$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 21					; 00000015H
	jne	$L1230
; Line 1850
	push	OFFSET $SG1231
	call	_error
	add	esp, 4
; Line 1851
	mov	eax, DWORD PTR _integer_type_node
	mov	DWORD PTR _elt_type$[ebp], eax
; Line 1854
$L1230:
	mov	eax, DWORD PTR _elt_type$[ebp]
	mov	ecx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 1855
	mov	eax, DWORD PTR _index_type$[ebp]
	mov	ecx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [ecx+20], eax
; Line 1858
	mov	eax, DWORD PTR _elt_type$[ebp]
	push	eax
	call	_build_pointer_type
	add	esp, 4
; Line 1864
	cmp	DWORD PTR _index_type$[ebp], 0
	jne	$L1232
; Line 1865
	mov	eax, DWORD PTR _t$[ebp]
	jmp	$L1227
; Line 1867
$L1232:
	mov	eax, DWORD PTR _index_type$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _elt_type$[ebp]
	add	eax, DWORD PTR [ecx]
	mov	DWORD PTR _hashcode$[ebp], eax
; Line 1868
	mov	eax, DWORD PTR _t$[ebp]
	push	eax
	mov	eax, DWORD PTR _hashcode$[ebp]
	push	eax
	call	_type_hash_canon
	add	esp, 8
	mov	DWORD PTR _t$[ebp], eax
; Line 1870
	mov	eax, DWORD PTR _t$[ebp]
	cmp	DWORD PTR [eax+28], 0
	jne	$L1233
; Line 1871
	mov	eax, DWORD PTR _t$[ebp]
	push	eax
	call	_layout_type
	add	esp, 4
; Line 1872
$L1233:
	mov	eax, DWORD PTR _t$[ebp]
	jmp	$L1227
; Line 1873
$L1227:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_build_array_type ENDP
_TEXT	ENDS
PUBLIC	_build_function_type
_DATA	SEGMENT
	ORG $+1
$SG1241	DB	'function return type cannot be function or array', 00H
_DATA	ENDS
_TEXT	SEGMENT
_value_type$ = 8
_arg_types$ = 12
_t$ = -4
_hashcode$ = -8
_build_function_type PROC NEAR
; Line 1885
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 1890
	mov	eax, DWORD PTR _value_type$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 21					; 00000015H
	je	$L1240
	mov	eax, DWORD PTR _value_type$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 16					; 00000010H
	jne	$L1239
$L1240:
; Line 1892
	push	OFFSET $SG1241
	call	_error
	add	esp, 4
; Line 1893
	mov	eax, DWORD PTR _integer_type_node
	mov	DWORD PTR _value_type$[ebp], eax
; Line 1897
$L1239:
	push	21					; 00000015H
	call	_make_node
	add	esp, 4
	mov	DWORD PTR _t$[ebp], eax
; Line 1898
	mov	eax, DWORD PTR _value_type$[ebp]
	mov	ecx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 1899
	mov	eax, DWORD PTR _arg_types$[ebp]
	mov	ecx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [ecx+20], eax
; Line 1902
	mov	eax, DWORD PTR _arg_types$[ebp]
	push	eax
	call	_type_hash_list
	add	esp, 4
	mov	ecx, DWORD PTR _value_type$[ebp]
	mov	ecx, DWORD PTR [ecx]
	add	ecx, eax
	mov	DWORD PTR _hashcode$[ebp], ecx
; Line 1903
	mov	eax, DWORD PTR _t$[ebp]
	push	eax
	mov	eax, DWORD PTR _hashcode$[ebp]
	push	eax
	call	_type_hash_canon
	add	esp, 8
	mov	DWORD PTR _t$[ebp], eax
; Line 1905
	mov	eax, DWORD PTR _t$[ebp]
	cmp	DWORD PTR [eax+28], 0
	jne	$L1242
; Line 1906
	mov	eax, DWORD PTR _t$[ebp]
	push	eax
	call	_layout_type
	add	esp, 4
; Line 1907
$L1242:
	mov	eax, DWORD PTR _t$[ebp]
	jmp	$L1236
; Line 1908
$L1236:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_build_function_type ENDP
_TEXT	ENDS
PUBLIC	_build_reference_type
_TEXT	SEGMENT
_to_type$ = 8
_t$ = -12
_ambient_obstack$ = -4
_ambient_saveable_obstack$ = -8
_build_reference_type PROC NEAR
; Line 1915
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 1916
	mov	eax, DWORD PTR _to_type$[ebp]
	mov	eax, DWORD PTR [eax+44]
	mov	DWORD PTR _t$[ebp], eax
; Line 1917
	mov	eax, DWORD PTR _current_obstack
	mov	DWORD PTR _ambient_obstack$[ebp], eax
; Line 1918
	mov	eax, DWORD PTR _saveable_obstack
	mov	DWORD PTR _ambient_saveable_obstack$[ebp], eax
; Line 1922
	cmp	DWORD PTR _t$[ebp], 0
	je	$L1248
; Line 1923
	mov	eax, DWORD PTR _t$[ebp]
	jmp	$L1244
; Line 1926
$L1248:
	mov	eax, DWORD PTR _to_type$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 8
	test	al, 1
	je	$L1249
; Line 1928
	mov	DWORD PTR _current_obstack, OFFSET _permanent_obstack
; Line 1929
	mov	DWORD PTR _saveable_obstack, OFFSET _permanent_obstack
; Line 1932
$L1249:
	push	13					; 0000000dH
	call	_make_node
	add	esp, 4
	mov	DWORD PTR _t$[ebp], eax
; Line 1933
	mov	eax, DWORD PTR _to_type$[ebp]
	mov	ecx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 1936
	mov	eax, DWORD PTR _t$[ebp]
	mov	ecx, DWORD PTR _to_type$[ebp]
	mov	DWORD PTR [ecx+44], eax
; Line 1938
	mov	eax, DWORD PTR _t$[ebp]
	push	eax
	call	_layout_type
	add	esp, 4
; Line 1940
	mov	eax, DWORD PTR _ambient_obstack$[ebp]
	mov	DWORD PTR _current_obstack, eax
; Line 1941
	mov	eax, DWORD PTR _ambient_saveable_obstack$[ebp]
	mov	DWORD PTR _saveable_obstack, eax
; Line 1942
	mov	eax, DWORD PTR _t$[ebp]
	jmp	$L1244
; Line 1943
$L1244:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_build_reference_type ENDP
_TEXT	ENDS
PUBLIC	_build_method_type
_TEXT	SEGMENT
_basetype$ = 8
_type$ = 12
_t$ = -4
_hashcode$ = -8
_build_method_type PROC NEAR
; Line 1953
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 1958
	push	14					; 0000000eH
	call	_make_node
	add	esp, 4
	mov	DWORD PTR _t$[ebp], eax
; Line 1960
	mov	eax, DWORD PTR _type$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 21					; 00000015H
	je	$L1255
; Line 1961
	call	_abort
; Line 1963
$L1255:
	mov	eax, DWORD PTR _basetype$[ebp]
	mov	ecx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [ecx+60], eax
; Line 1964
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 1970
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	mov	eax, DWORD PTR _basetype$[ebp]
	push	eax
	call	_build_pointer_type
	add	esp, 4
	push	eax
	push	0
	call	_tree_cons
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [ecx+20], eax
; Line 1973
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _basetype$[ebp]
	add	eax, DWORD PTR [ecx]
	mov	DWORD PTR _hashcode$[ebp], eax
; Line 1974
	mov	eax, DWORD PTR _t$[ebp]
	push	eax
	mov	eax, DWORD PTR _hashcode$[ebp]
	push	eax
	call	_type_hash_canon
	add	esp, 8
	mov	DWORD PTR _t$[ebp], eax
; Line 1976
	mov	eax, DWORD PTR _t$[ebp]
	cmp	DWORD PTR [eax+28], 0
	jne	$L1256
; Line 1977
	mov	eax, DWORD PTR _t$[ebp]
	push	eax
	call	_layout_type
	add	esp, 4
; Line 1979
$L1256:
	mov	eax, DWORD PTR _t$[ebp]
	jmp	$L1252
; Line 1980
$L1252:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_build_method_type ENDP
_TEXT	ENDS
PUBLIC	_build_offset_type
_TEXT	SEGMENT
_basetype$ = 8
_type$ = 12
_t$ = -4
_hashcode$ = -8
_build_offset_type PROC NEAR
; Line 1990
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 1995
	push	12					; 0000000cH
	call	_make_node
	add	esp, 4
	mov	DWORD PTR _t$[ebp], eax
; Line 1997
	mov	eax, DWORD PTR _basetype$[ebp]
	mov	ecx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [ecx+60], eax
; Line 1998
	mov	eax, DWORD PTR _type$[ebp]
	mov	ecx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 2001
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _basetype$[ebp]
	add	eax, DWORD PTR [ecx]
	mov	DWORD PTR _hashcode$[ebp], eax
; Line 2002
	mov	eax, DWORD PTR _t$[ebp]
	push	eax
	mov	eax, DWORD PTR _hashcode$[ebp]
	push	eax
	call	_type_hash_canon
	add	esp, 8
	mov	DWORD PTR _t$[ebp], eax
; Line 2004
	mov	eax, DWORD PTR _t$[ebp]
	cmp	DWORD PTR [eax+28], 0
	jne	$L1262
; Line 2005
	mov	eax, DWORD PTR _t$[ebp]
	push	eax
	call	_layout_type
	add	esp, 4
; Line 2007
$L1262:
	mov	eax, DWORD PTR _t$[ebp]
	jmp	$L1259
; Line 2008
$L1259:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_build_offset_type ENDP
_TEXT	ENDS
PUBLIC	_get_unwidened
EXTRN	_type_for_size:NEAR
_TEXT	SEGMENT
_innerprec$1281 = -24
_op$ = 8
_for_type$ = 12
_type$ = -4
_final_prec$ = -12
_uns$ = -8
_win$ = -16
_bitschange$1273 = -20
_get_unwidened PROC NEAR
; Line 2037
	push	ebp
	mov	ebp, esp
	sub	esp, 28					; 0000001cH
	push	ebx
	push	esi
	push	edi
; Line 2041
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _type$[ebp], eax
; Line 2042
	cmp	DWORD PTR _for_type$[ebp], 0
	je	$L1423
	mov	eax, DWORD PTR _for_type$[ebp]
	mov	DWORD PTR -28+[ebp], eax
	jmp	$L1424
$L1423:
	mov	eax, DWORD PTR _type$[ebp]
	mov	DWORD PTR -28+[ebp], eax
$L1424:
	mov	eax, DWORD PTR -28+[ebp]
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _final_prec$[ebp], eax
; Line 2046
	cmp	DWORD PTR _for_type$[ebp], 0
	je	$L1425
	mov	eax, DWORD PTR _for_type$[ebp]
	cmp	DWORD PTR _type$[ebp], eax
	je	$L1425
	mov	eax, DWORD PTR _type$[ebp]
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	cmp	eax, DWORD PTR _final_prec$[ebp]
	jge	$L1425
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 12					; 0000000cH
	test	al, 1
	je	$L1425
	mov	DWORD PTR _uns$[ebp], 1
	jmp	$L1426
$L1425:
	mov	DWORD PTR _uns$[ebp], 0
$L1426:
; Line 2047
	mov	eax, DWORD PTR _op$[ebp]
	mov	DWORD PTR _win$[ebp], eax
; Line 2049
$L1271:
	mov	eax, DWORD PTR _op$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 113				; 00000071H
	jne	$L1272
; Line 2053
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _op$[ebp]
	mov	ecx, DWORD PTR [ecx+24]
	mov	ecx, DWORD PTR [ecx+8]
	mov	cl, BYTE PTR [ecx+38]
	and	ecx, 255				; 000000ffH
	sub	eax, ecx
	mov	DWORD PTR _bitschange$1273[ebp], eax
; Line 2058
	cmp	DWORD PTR _bitschange$1273[ebp], 0
	jge	$L1274
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	cmp	eax, DWORD PTR _final_prec$[ebp]
	jge	$L1274
; Line 2059
	jmp	$L1272
; Line 2063
$L1274:
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _op$[ebp], eax
; Line 2072
	cmp	DWORD PTR _bitschange$1273[ebp], 0
	jle	$L1275
; Line 2074
	cmp	DWORD PTR _uns$[ebp], 0
	je	$L1277
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	cmp	eax, DWORD PTR _final_prec$[ebp]
	jl	$L1276
$L1277:
; Line 2075
	mov	eax, DWORD PTR _op$[ebp]
	mov	DWORD PTR _win$[ebp], eax
; Line 2079
$L1276:
; Line 2080
	cmp	DWORD PTR _uns$[ebp], 0
	jne	$L1279
	mov	eax, DWORD PTR _op$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 113				; 00000071H
	jne	$L1278
$L1279:
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 12					; 0000000cH
	test	al, 1
	je	$L1278
; Line 2082
	mov	DWORD PTR _uns$[ebp], 1
; Line 2083
	mov	eax, DWORD PTR _op$[ebp]
	mov	DWORD PTR _win$[ebp], eax
; Line 2085
$L1278:
; Line 2086
$L1275:
	jmp	$L1271
$L1272:
; Line 2090
	mov	eax, DWORD PTR _op$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 47					; 0000002fH
	jne	$L1280
	mov	eax, DWORD PTR _type$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 6
	je	$L1280
; Line 2093
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	al, BYTE PTR [eax+36]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _op$[ebp]
	mov	ecx, DWORD PTR [ecx+28]
	mov	ecx, DWORD PTR [ecx+28]
	imul	eax, DWORD PTR [ecx+20]
	mov	DWORD PTR _innerprec$1281[ebp], eax
; Line 2094
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 12					; 0000000cH
	and	eax, 1
	push	eax
	mov	eax, DWORD PTR _innerprec$1281[ebp]
	push	eax
	call	_type_for_size
	add	esp, 8
	mov	DWORD PTR _type$[ebp], eax
; Line 2106
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	cmp	eax, DWORD PTR _innerprec$1281[ebp]
	jle	$L1282
	cmp	DWORD PTR _for_type$[ebp], 0
	jne	$L1283
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	and	eax, -16777216				; ff000000H
	mov	ecx, 419430400				; 19000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L1282
$L1283:
	cmp	DWORD PTR _uns$[ebp], 0
	je	$L1284
	mov	eax, DWORD PTR _final_prec$[ebp]
	cmp	DWORD PTR _innerprec$1281[ebp], eax
	jge	$L1284
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 12					; 0000000cH
	test	al, 1
	je	$L1282
$L1284:
	cmp	DWORD PTR _type$[ebp], 0
	je	$L1282
; Line 2109
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	push	47					; 0000002fH
	call	_build
	add	esp, 16					; 00000010H
	mov	DWORD PTR _win$[ebp], eax
; Line 2110
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 3
	and	eax, 1
	shl	eax, 3
	mov	ecx, DWORD PTR _win$[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	and	ecx, -9					; fffffff7H
	or	eax, ecx
	mov	ecx, DWORD PTR _win$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 2111
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 11					; 0000000bH
	and	eax, 1
	shl	eax, 11					; 0000000bH
	mov	ecx, DWORD PTR _win$[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	and	ecx, -2049				; fffff7ffH
	or	eax, ecx
	mov	ecx, DWORD PTR _win$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 2113
$L1282:
; Line 2114
$L1280:
	mov	eax, DWORD PTR _win$[ebp]
	jmp	$L1265
; Line 2115
$L1265:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_get_unwidened ENDP
_TEXT	ENDS
PUBLIC	_get_narrower
_TEXT	SEGMENT
_op$ = 8
_unsignedp_ptr$ = 12
_uns$ = -4
_first$ = -8
_win$ = -12
_bitschange$1294 = -16
_innerprec$1301 = -24
_type$1302 = -20
_get_narrower PROC NEAR
; Line 2126
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	push	ebx
	push	esi
	push	edi
; Line 2127
	mov	DWORD PTR _uns$[ebp], 0
; Line 2128
	mov	DWORD PTR _first$[ebp], 1
; Line 2129
	mov	eax, DWORD PTR _op$[ebp]
	mov	DWORD PTR _win$[ebp], eax
; Line 2131
$L1292:
	mov	eax, DWORD PTR _op$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 113				; 00000071H
	jne	$L1293
; Line 2135
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _op$[ebp]
	mov	ecx, DWORD PTR [ecx+24]
	mov	ecx, DWORD PTR [ecx+8]
	mov	cl, BYTE PTR [ecx+38]
	and	ecx, 255				; 000000ffH
	sub	eax, ecx
	mov	DWORD PTR _bitschange$1294[ebp], eax
; Line 2138
	cmp	DWORD PTR _bitschange$1294[ebp], 0
	jge	$L1295
; Line 2139
	jmp	$L1293
; Line 2143
$L1295:
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _op$[ebp], eax
; Line 2145
	cmp	DWORD PTR _bitschange$1294[ebp], 0
	jle	$L1296
; Line 2149
	cmp	DWORD PTR _first$[ebp], 0
	je	$L1297
; Line 2150
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 12					; 0000000cH
	and	eax, 1
	mov	DWORD PTR _uns$[ebp], eax
; Line 2154
	jmp	$L1298
$L1297:
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 12					; 0000000cH
	and	eax, 1
	cmp	eax, DWORD PTR _uns$[ebp]
	je	$L1299
; Line 2155
	jmp	$L1293
; Line 2156
$L1299:
$L1298:
	mov	DWORD PTR _first$[ebp], 0
; Line 2160
$L1296:
	mov	eax, DWORD PTR _op$[ebp]
	mov	DWORD PTR _win$[ebp], eax
; Line 2161
	jmp	$L1292
$L1293:
; Line 2165
	mov	eax, DWORD PTR _op$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 47					; 0000002fH
	jne	$L1300
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 6
	je	$L1300
; Line 2168
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	al, BYTE PTR [eax+36]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _op$[ebp]
	mov	ecx, DWORD PTR [ecx+28]
	mov	ecx, DWORD PTR [ecx+28]
	imul	eax, DWORD PTR [ecx+20]
	mov	DWORD PTR _innerprec$1301[ebp], eax
; Line 2169
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 12					; 0000000cH
	and	eax, 1
	push	eax
	mov	eax, DWORD PTR _innerprec$1301[ebp]
	push	eax
	call	_type_for_size
	add	esp, 8
	mov	DWORD PTR _type$1302[ebp], eax
; Line 2182
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	cmp	eax, DWORD PTR _innerprec$1301[ebp]
	jle	$L1303
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	and	eax, -16777216				; ff000000H
	mov	ecx, 419430400				; 19000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L1303
	cmp	DWORD PTR _first$[ebp], 0
	jne	$L1304
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 12					; 0000000cH
	and	eax, 1
	cmp	eax, DWORD PTR _uns$[ebp]
	jne	$L1303
$L1304:
	cmp	DWORD PTR _type$1302[ebp], 0
	je	$L1303
; Line 2184
	cmp	DWORD PTR _first$[ebp], 0
	je	$L1305
; Line 2185
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 12					; 0000000cH
	and	eax, 1
	mov	DWORD PTR _uns$[ebp], eax
; Line 2186
$L1305:
; Line 2187
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	mov	eax, DWORD PTR _type$1302[ebp]
	push	eax
	push	47					; 0000002fH
	call	_build
	add	esp, 16					; 00000010H
	mov	DWORD PTR _win$[ebp], eax
; Line 2188
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 3
	and	eax, 1
	shl	eax, 3
	mov	ecx, DWORD PTR _win$[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	and	ecx, -9					; fffffff7H
	or	eax, ecx
	mov	ecx, DWORD PTR _win$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 2189
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 11					; 0000000bH
	and	eax, 1
	shl	eax, 11					; 0000000bH
	mov	ecx, DWORD PTR _win$[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	and	ecx, -2049				; fffff7ffH
	or	eax, ecx
	mov	ecx, DWORD PTR _win$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 2191
$L1303:
; Line 2192
$L1300:
	mov	eax, DWORD PTR _uns$[ebp]
	mov	ecx, DWORD PTR _unsignedp_ptr$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 2193
	mov	eax, DWORD PTR _win$[ebp]
	jmp	$L1287
; Line 2194
$L1287:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_get_narrower ENDP
_TEXT	ENDS
PUBLIC	_type_precision
_TEXT	SEGMENT
_type$ = 8
_type_precision PROC NEAR
; Line 2204
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 2208
	mov	eax, DWORD PTR _type$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 5
	je	$L1429
	mov	eax, DWORD PTR _type$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 8
	je	$L1429
	mov	eax, DWORD PTR _type$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 6
	jne	$L1427
$L1429:
	mov	eax, DWORD PTR _type$[ebp]
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	jmp	$L1428
$L1427:
	mov	eax, 32					; 00000020H
$L1428:
	jmp	$L1308
; Line 2209
$L1308:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_type_precision ENDP
_TEXT	ENDS
PUBLIC	_int_fits_type_p
_TEXT	SEGMENT
_c$ = 8
_type$ = 12
_int_fits_type_p PROC NEAR
; Line 2217
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 2218
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 12					; 0000000cH
	test	al, 1
	je	$L1313
; Line 2220
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+60]
	mov	ecx, DWORD PTR _c$[ebp]
	mov	ecx, DWORD PTR [ecx+24]
	cmp	DWORD PTR [eax+24], ecx
	jb	$L1430
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+60]
	mov	ecx, DWORD PTR _c$[ebp]
	mov	ecx, DWORD PTR [ecx+24]
	cmp	DWORD PTR [eax+24], ecx
	jne	$L1432
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+60]
	mov	ecx, DWORD PTR _c$[ebp]
	mov	ecx, DWORD PTR [ecx+20]
	cmp	DWORD PTR [eax+20], ecx
	jb	$L1430
$L1432:
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	ecx, DWORD PTR _c$[ebp]
	mov	ecx, DWORD PTR [ecx+24]
	cmp	DWORD PTR [eax+24], ecx
	ja	$L1430
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	ecx, DWORD PTR _c$[ebp]
	mov	ecx, DWORD PTR [ecx+24]
	cmp	DWORD PTR [eax+24], ecx
	jne	$L1433
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	ecx, DWORD PTR _c$[ebp]
	mov	ecx, DWORD PTR [ecx+20]
	cmp	DWORD PTR [eax+20], ecx
	ja	$L1430
$L1433:
	mov	eax, 1
	jmp	$L1431
$L1430:
	sub	eax, eax
$L1431:
	jmp	$L1312
; Line 2221
	jmp	$L1314
$L1313:
; Line 2223
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+60]
	mov	ecx, DWORD PTR _c$[ebp]
	mov	ecx, DWORD PTR [ecx+24]
	cmp	DWORD PTR [eax+24], ecx
	jl	$L1434
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+60]
	mov	ecx, DWORD PTR _c$[ebp]
	mov	ecx, DWORD PTR [ecx+24]
	cmp	DWORD PTR [eax+24], ecx
	jne	$L1436
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+60]
	mov	ecx, DWORD PTR _c$[ebp]
	mov	ecx, DWORD PTR [ecx+20]
	cmp	DWORD PTR [eax+20], ecx
	jb	$L1434
$L1436:
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	ecx, DWORD PTR _c$[ebp]
	mov	ecx, DWORD PTR [ecx+24]
	cmp	DWORD PTR [eax+24], ecx
	jg	$L1434
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	ecx, DWORD PTR _c$[ebp]
	mov	ecx, DWORD PTR [ecx+24]
	cmp	DWORD PTR [eax+24], ecx
	jne	$L1437
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	ecx, DWORD PTR _c$[ebp]
	mov	ecx, DWORD PTR [ecx+20]
	cmp	DWORD PTR [eax+20], ecx
	ja	$L1434
$L1437:
	mov	eax, 1
	jmp	$L1435
$L1434:
	sub	eax, eax
$L1435:
	jmp	$L1312
$L1314:
; Line 2224
$L1312:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_int_fits_type_p ENDP
_TEXT	ENDS
END
