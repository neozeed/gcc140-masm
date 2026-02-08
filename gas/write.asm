	TITLE	write.c
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
PUBLIC	_fix_new
EXTRN	_notes:BYTE
EXTRN	__obstack_newchunk:NEAR
EXTRN	_seg_fix_rootP:DWORD
_TEXT	SEGMENT
; File write.c
_frag$ = 8
_where$ = 12
_size$ = 16
_add_symbol$ = 20
_sub_symbol$ = 24
_offset$ = 28
_pcrel$ = 32
_fixP$ = -4
_fix_new PROC NEAR
; Line 128
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 131
	mov	DWORD PTR _notes+20, 40			; 00000028H
	mov	eax, DWORD PTR _notes+16
	sub	eax, DWORD PTR _notes+12
	cmp	eax, DWORD PTR _notes+20
	jl	$L509
	jmp	$L510
$L509:
	mov	eax, DWORD PTR _notes+20
	push	eax
	push	OFFSET _notes
	call	__obstack_newchunk
	add	esp, 8
$L510:
	mov	eax, DWORD PTR _notes+20
	add	DWORD PTR _notes+12, eax
	mov	eax, DWORD PTR _notes+8
	mov	DWORD PTR _notes+20, eax
	mov	eax, DWORD PTR _notes+12
	add	eax, DWORD PTR _notes+24
	mov	ecx, DWORD PTR _notes+24
	not	ecx
	and	eax, ecx
	mov	DWORD PTR _notes+12, eax
	mov	eax, DWORD PTR _notes+12
	sub	eax, DWORD PTR _notes+4
	mov	ecx, DWORD PTR _notes+16
	sub	ecx, DWORD PTR _notes+4
	cmp	eax, ecx
	jle	$L511
	mov	eax, DWORD PTR _notes+16
	mov	DWORD PTR _notes+12, eax
	jmp	$L512
$L511:
$L512:
	mov	eax, DWORD PTR _notes+12
	mov	DWORD PTR _notes+8, eax
	mov	eax, DWORD PTR _notes+20
	mov	DWORD PTR _fixP$[ebp], eax
; Line 133
	mov	eax, DWORD PTR _frag$[ebp]
	mov	ecx, DWORD PTR _fixP$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 134
	mov	eax, DWORD PTR _where$[ebp]
	mov	ecx, DWORD PTR _fixP$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 135
	mov	ax, WORD PTR _size$[ebp]
	mov	ecx, DWORD PTR _fixP$[ebp]
	mov	WORD PTR [ecx+24], ax
; Line 136
	mov	eax, DWORD PTR _add_symbol$[ebp]
	mov	ecx, DWORD PTR _fixP$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 137
	mov	eax, DWORD PTR _sub_symbol$[ebp]
	mov	ecx, DWORD PTR _fixP$[ebp]
	mov	DWORD PTR [ecx+12], eax
; Line 138
	mov	eax, DWORD PTR _offset$[ebp]
	mov	ecx, DWORD PTR _fixP$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 139
	mov	al, BYTE PTR _pcrel$[ebp]
	mov	ecx, DWORD PTR _fixP$[ebp]
	mov	BYTE PTR [ecx+26], al
; Line 140
	mov	eax, DWORD PTR _seg_fix_rootP
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _fixP$[ebp]
	mov	DWORD PTR [ecx+20], eax
; Line 143
	mov	eax, DWORD PTR _fixP$[ebp]
	mov	BYTE PTR [eax+28], 0
; Line 144
	mov	eax, DWORD PTR _fixP$[ebp]
	mov	BYTE PTR [eax+27], 0
; Line 145
	mov	eax, DWORD PTR _fixP$[ebp]
	mov	BYTE PTR [eax+36], 0
; Line 146
	mov	eax, DWORD PTR _fixP$[ebp]
	mov	DWORD PTR [eax+32], 0
; Line 152
	mov	eax, DWORD PTR _fixP$[ebp]
	mov	ecx, DWORD PTR _seg_fix_rootP
	mov	DWORD PTR [ecx], eax
; Line 153
$L342:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_fix_new ENDP
_TEXT	ENDS
PUBLIC	_relax_segment
PUBLIC	_is_dnrange
EXTRN	_as_warn:NEAR
EXTRN	_flagseen:BYTE
EXTRN	_md_relax_table:BYTE
EXTRN	_md_estimate_size_before_relax:NEAR
EXTRN	_as_fatal:NEAR
EXTRN	_seg_N_TYPE:BYTE
EXTRN	_subseg_change:NEAR
EXTRN	_md_short_jump_size:DWORD
EXTRN	_md_long_jump_size:DWORD
_DATA	SEGMENT
$SG364	DB	'write.c', 00H
$SG365	DB	'Case value %d unexpected at line %d of file "%s"', 0aH, 00H
	ORG $+2
$SG399	DB	'.word %s-%s+%ld didn''t fit', 00H
	ORG $+1
$SG430	DB	'write.c', 00H
$SG431	DB	'Case value %d unexpected at line %d of file "%s"', 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_lie$387 = -48
_untruth$388 = -52
_segment_frag_root$ = 8
_this_type$409 = -68
_segment_type$ = 12
_start_type$410 = -64
_next_state$411 = -60
_this_state$412 = -56
_fragP$ = -8
_address$ = -4
_stretch$366 = -12
_stretched$367 = -16
_growth$374 = -36
_was_address$375 = -28
_offset$376 = -44
_symbolP$377 = -32
_target$378 = -24
_after$379 = -20
_aim$380 = -40
_relax_segment PROC NEAR
; Line 716
	push	ebp
	mov	ebp, esp
	sub	esp, 76					; 0000004cH
	push	ebx
	push	esi
	push	edi
; Line 725
	push	0
	mov	eax, DWORD PTR _segment_type$[ebp]
	push	eax
	call	_subseg_change
	add	esp, 8
; Line 730
	mov	DWORD PTR _address$[ebp], 0
; Line 731
	mov	eax, DWORD PTR _segment_frag_root$[ebp]
	mov	DWORD PTR _fragP$[ebp], eax
	jmp	$L350
$L351:
	mov	eax, DWORD PTR _fragP$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _fragP$[ebp], eax
$L350:
	cmp	DWORD PTR _fragP$[ebp], 0
	je	$L352
; Line 733
	mov	eax, DWORD PTR _address$[ebp]
	mov	ecx, DWORD PTR _fragP$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 734
	mov	eax, DWORD PTR _fragP$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	DWORD PTR _address$[ebp], eax
; Line 735
	mov	eax, DWORD PTR _fragP$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR -72+[ebp], eax
	jmp	$L353
; Line 737
$L357:
; Line 738
	mov	eax, DWORD PTR _fragP$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	ecx, DWORD PTR _fragP$[ebp]
	imul	eax, DWORD PTR [ecx+12]
	add	DWORD PTR _address$[ebp], eax
; Line 739
	jmp	$L354
; Line 741
$L358:
; Line 742
	mov	eax, DWORD PTR _fragP$[ebp]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	mov	eax, DWORD PTR _address$[ebp]
	push	eax
	call	_relax_align
	add	esp, 8
	add	DWORD PTR _address$[ebp], eax
; Line 743
	jmp	$L354
; Line 745
$L359:
; Line 749
	jmp	$L354
; Line 751
$L360:
; Line 753
	mov	eax, DWORD PTR _segment_type$[ebp]
	mov	eax, DWORD PTR _seg_N_TYPE[eax*4]
	push	eax
	mov	eax, DWORD PTR _fragP$[ebp]
	push	eax
	call	_md_estimate_size_before_relax
	add	esp, 8
	add	DWORD PTR _address$[ebp], eax
; Line 754
	jmp	$L354
; Line 758
$L361:
; Line 759
	jmp	$L354
; Line 762
$L362:
; Line 763
	push	OFFSET $SG364
	push	763					; 000002fbH
	mov	eax, DWORD PTR _fragP$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	push	OFFSET $SG365
	call	_as_fatal
	add	esp, 16					; 00000010H
; Line 764
	jmp	$L354
; Line 765
	jmp	$L354
$L353:
	cmp	DWORD PTR -72+[ebp], 0
	je	$L357
	cmp	DWORD PTR -72+[ebp], 1
	je	$L358
	cmp	DWORD PTR -72+[ebp], 2
	je	$L354
	cmp	DWORD PTR -72+[ebp], 3
	je	$L360
	cmp	DWORD PTR -72+[ebp], 4
	je	$L354
	jmp	$L362
$L354:
; Line 766
	jmp	$L351
$L352:
; Line 782
$L368:
; Line 784
	mov	DWORD PTR _stretched$367[ebp], 0
	mov	eax, DWORD PTR _stretched$367[ebp]
	mov	DWORD PTR _stretch$366[ebp], eax
; Line 785
	mov	eax, DWORD PTR _segment_frag_root$[ebp]
	mov	DWORD PTR _fragP$[ebp], eax
	jmp	$L371
$L372:
	mov	eax, DWORD PTR _fragP$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _fragP$[ebp], eax
$L371:
	cmp	DWORD PTR _fragP$[ebp], 0
	je	$L373
; Line 796
	mov	eax, DWORD PTR _fragP$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _was_address$375[ebp], eax
; Line 797
	mov	eax, DWORD PTR _stretch$366[ebp]
	mov	ecx, DWORD PTR _fragP$[ebp]
	add	DWORD PTR [ecx], eax
	mov	eax, DWORD PTR _fragP$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _address$[ebp], eax
; Line 798
	mov	eax, DWORD PTR _fragP$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _symbolP$377[ebp], eax
; Line 799
	mov	eax, DWORD PTR _fragP$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _offset$376[ebp], eax
; Line 801
	mov	eax, DWORD PTR _fragP$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR -76+[ebp], eax
	jmp	$L381
; Line 803
$L385:
; Line 804
	mov	DWORD PTR _growth$374[ebp], 0
; Line 805
	jmp	$L382
; Line 812
$L386:
; Line 823
	mov	DWORD PTR _growth$374[ebp], 0
; Line 826
	mov	eax, DWORD PTR _fragP$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _lie$387[ebp], eax
	jmp	$L391
$L392:
	mov	eax, DWORD PTR _lie$387[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _lie$387[ebp], eax
$L391:
	cmp	DWORD PTR _lie$387[ebp], 0
	je	$L393
	mov	eax, DWORD PTR _lie$387[ebp]
	mov	ecx, DWORD PTR _fragP$[ebp]
	cmp	DWORD PTR [eax+12], ecx
	jne	$L393
; Line 828
	mov	eax, DWORD PTR _lie$387[ebp]
	cmp	DWORD PTR [eax+28], 0
	je	$L394
; Line 829
	jmp	$L392
; Line 830
$L394:
; Line 831
	mov	eax, DWORD PTR _lie$387[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+24]
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _lie$387[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	add	eax, DWORD PTR [ecx+8]
	mov	ecx, DWORD PTR _lie$387[ebp]
	add	eax, DWORD PTR [ecx+24]
	mov	ecx, DWORD PTR _lie$387[ebp]
	mov	ecx, DWORD PTR [ecx+20]
	mov	ecx, DWORD PTR [ecx+24]
	mov	ecx, DWORD PTR [ecx]
	mov	edx, DWORD PTR _lie$387[ebp]
	mov	edx, DWORD PTR [edx+20]
	add	ecx, DWORD PTR [edx+8]
	sub	eax, ecx
	mov	DWORD PTR _offset$376[ebp], eax
; Line 832
	cmp	DWORD PTR _offset$376[ebp], -32768	; ffff8000H
	jle	$L396
	cmp	DWORD PTR _offset$376[ebp], 32767	; 00007fffH
	jl	$L395
$L396:
; Line 833
	movsx	eax, BYTE PTR _flagseen+107
	or	eax, eax
	je	$L397
; Line 834
	mov	eax, DWORD PTR _lie$387[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	mov	eax, DWORD PTR _lie$387[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	eax, DWORD PTR [eax]
	push	eax
	mov	eax, DWORD PTR _lie$387[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	push	eax
	push	OFFSET $SG399
	call	_as_warn
	add	esp, 16					; 00000010H
; Line 835
$L397:
	mov	eax, DWORD PTR _lie$387[ebp]
	mov	DWORD PTR [eax+28], 1
; Line 836
	mov	eax, DWORD PTR _fragP$[ebp]
	cmp	DWORD PTR [eax+32], 0
	jne	$L400
; Line 837
	mov	eax, DWORD PTR _fragP$[ebp]
	inc	DWORD PTR [eax+32]
; Line 838
	mov	eax, DWORD PTR _md_short_jump_size
	add	DWORD PTR _growth$374[ebp], eax
; Line 840
$L400:
	mov	eax, DWORD PTR _lie$387[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _untruth$388[ebp], eax
	jmp	$L401
$L402:
	mov	eax, DWORD PTR _untruth$388[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _untruth$388[ebp], eax
$L401:
	cmp	DWORD PTR _untruth$388[ebp], 0
	je	$L403
	mov	eax, DWORD PTR _untruth$388[ebp]
	mov	ecx, DWORD PTR _lie$387[ebp]
	mov	ecx, DWORD PTR [ecx+12]
	cmp	DWORD PTR [eax+12], ecx
	jne	$L403
; Line 841
	mov	eax, DWORD PTR _untruth$388[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _lie$387[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	mov	ecx, DWORD PTR [ecx+24]
	cmp	DWORD PTR [eax+24], ecx
	jne	$L404
	mov	eax, DWORD PTR _untruth$388[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _lie$387[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	mov	ecx, DWORD PTR [ecx+8]
	cmp	DWORD PTR [eax+8], ecx
	jne	$L404
; Line 842
	mov	eax, DWORD PTR _untruth$388[ebp]
	mov	DWORD PTR [eax+28], 2
; Line 843
	mov	eax, DWORD PTR _lie$387[ebp]
	mov	ecx, DWORD PTR _untruth$388[ebp]
	mov	DWORD PTR [ecx+32], eax
; Line 845
$L404:
	jmp	$L402
$L403:
	mov	eax, DWORD PTR _md_long_jump_size
	add	DWORD PTR _growth$374[ebp], eax
; Line 847
$L395:
	jmp	$L392
$L393:
; Line 849
	jmp	$L382
; Line 851
$L405:
; Line 853
	mov	eax, DWORD PTR _offset$376[ebp]
	push	eax
	mov	eax, DWORD PTR _fragP$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, DWORD PTR _address$[ebp]
	push	eax
	call	_relax_align
	add	esp, 8
	mov	ebx, eax
	mov	eax, DWORD PTR _offset$376[ebp]
	push	eax
	mov	eax, DWORD PTR _fragP$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, DWORD PTR _was_address$375[ebp]
	push	eax
	call	_relax_align
	add	esp, 8
	sub	ebx, eax
	mov	DWORD PTR _growth$374[ebp], ebx
; Line 854
	jmp	$L382
; Line 856
$L406:
; Line 857
	mov	eax, DWORD PTR _offset$376[ebp]
	mov	DWORD PTR _target$378[ebp], eax
; Line 858
	cmp	DWORD PTR _symbolP$377[ebp], 0
	je	$L407
; Line 865
	mov	eax, DWORD PTR _symbolP$377[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _symbolP$377[ebp]
	add	eax, DWORD PTR [ecx+8]
	add	eax, DWORD PTR _target$378[ebp]
	mov	DWORD PTR _target$378[ebp], eax
; Line 867
$L407:
; Line 868
	mov	eax, DWORD PTR _fragP$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _after$379[ebp], eax
; Line 869
	mov	eax, DWORD PTR _target$378[ebp]
	sub	eax, DWORD PTR _after$379[ebp]
	or	eax, eax
	jg	$L513
	sub	eax, eax
$L513:
	mov	DWORD PTR _growth$374[ebp], eax
; Line 874
	sub	eax, eax
	sub	eax, DWORD PTR _stretch$366[ebp]
	neg	eax
	sub	DWORD PTR _growth$374[ebp], eax
; Line 875
	jmp	$L382
; Line 877
$L408:
; Line 885
	mov	eax, DWORD PTR _fragP$[ebp]
	mov	eax, DWORD PTR [eax+32]
	mov	DWORD PTR _this_state$412[ebp], eax
	mov	eax, DWORD PTR _this_state$412[ebp]
	shl	eax, 4
	add	eax, OFFSET _md_relax_table
	mov	DWORD PTR _this_type$409[ebp], eax
	mov	eax, DWORD PTR _this_type$409[ebp]
	mov	DWORD PTR _start_type$410[ebp], eax
; Line 886
	mov	eax, DWORD PTR _offset$376[ebp]
	mov	DWORD PTR _target$378[ebp], eax
; Line 887
	cmp	DWORD PTR _symbolP$377[ebp], 0
	je	$L413
; Line 895
	mov	eax, DWORD PTR _symbolP$377[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _symbolP$377[ebp]
	add	eax, DWORD PTR [ecx+8]
	add	eax, DWORD PTR _target$378[ebp]
	mov	DWORD PTR _target$378[ebp], eax
; Line 924
	mov	eax, DWORD PTR _symbolP$377[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	ecx, DWORD PTR _was_address$375[ebp]
	cmp	DWORD PTR [eax], ecx
	jb	$L415
	mov	eax, DWORD PTR _symbolP$377[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	mov	eax, DWORD PTR _fragP$[ebp]
	push	eax
	call	_is_dnrange
	add	esp, 8
	or	eax, eax
	je	$L415
; Line 925
	mov	eax, DWORD PTR _stretch$366[ebp]
	add	DWORD PTR _target$378[ebp], eax
; Line 927
$L415:
; Line 928
$L413:
	mov	eax, DWORD PTR _target$378[ebp]
	sub	eax, DWORD PTR _address$[ebp]
	mov	ecx, DWORD PTR _fragP$[ebp]
	sub	eax, DWORD PTR [ecx+8]
	mov	DWORD PTR _aim$380[ebp], eax
; Line 939
	cmp	DWORD PTR _aim$380[ebp], 0
	jge	$L416
; Line 942
	mov	eax, DWORD PTR _this_type$409[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _next_state$411[ebp], eax
$L418:
	cmp	DWORD PTR _next_state$411[ebp], 0
	je	$L419
; Line 944
	mov	eax, DWORD PTR _this_type$409[ebp]
	mov	ecx, DWORD PTR _aim$380[ebp]
	cmp	DWORD PTR [eax+4], ecx
	jg	$L420
; Line 945
	mov	DWORD PTR _next_state$411[ebp], 0
; Line 946
	jmp	$L421
$L420:
; Line 948
	mov	eax, DWORD PTR _next_state$411[ebp]
	mov	DWORD PTR _this_state$412[ebp], eax
	mov	eax, DWORD PTR _this_state$412[ebp]
	shl	eax, 4
	add	eax, OFFSET _md_relax_table
	mov	DWORD PTR _this_type$409[ebp], eax
; Line 949
	mov	eax, DWORD PTR _this_type$409[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _next_state$411[ebp], eax
; Line 950
$L421:
; Line 951
	jmp	$L418
$L419:
; Line 953
	jmp	$L422
$L416:
; Line 964
	mov	eax, DWORD PTR _this_type$409[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _next_state$411[ebp], eax
$L424:
	cmp	DWORD PTR _next_state$411[ebp], 0
	je	$L425
; Line 966
	mov	eax, DWORD PTR _this_type$409[ebp]
	mov	ecx, DWORD PTR _aim$380[ebp]
	cmp	DWORD PTR [eax], ecx
	jl	$L426
; Line 967
	mov	DWORD PTR _next_state$411[ebp], 0
; Line 968
	jmp	$L427
$L426:
; Line 970
	mov	eax, DWORD PTR _next_state$411[ebp]
	mov	DWORD PTR _this_state$412[ebp], eax
	mov	eax, DWORD PTR _this_state$412[ebp]
	shl	eax, 4
	add	eax, OFFSET _md_relax_table
	mov	DWORD PTR _this_type$409[ebp], eax
; Line 971
	mov	eax, DWORD PTR _this_type$409[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _next_state$411[ebp], eax
; Line 972
$L427:
; Line 973
	jmp	$L424
$L425:
; Line 974
$L422:
; Line 975
	mov	eax, DWORD PTR _this_type$409[ebp]
	mov	al, BYTE PTR [eax+8]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _start_type$410[ebp]
	mov	cl, BYTE PTR [ecx+8]
	and	ecx, 255				; 000000ffH
	sub	eax, ecx
	mov	DWORD PTR _growth$374[ebp], eax
	cmp	DWORD PTR _growth$374[ebp], 0
	je	$L428
; Line 976
	mov	eax, DWORD PTR _this_state$412[ebp]
	mov	ecx, DWORD PTR _fragP$[ebp]
	mov	DWORD PTR [ecx+32], eax
; Line 977
$L428:
; Line 978
	jmp	$L382
; Line 980
$L429:
; Line 981
	push	OFFSET $SG430
	push	981					; 000003d5H
	mov	eax, DWORD PTR _fragP$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	push	OFFSET $SG431
	call	_as_fatal
	add	esp, 16					; 00000010H
; Line 982
	jmp	$L382
; Line 983
	jmp	$L382
$L381:
	cmp	DWORD PTR -76+[ebp], 0
	je	$L385
	cmp	DWORD PTR -76+[ebp], 1
	je	$L405
	cmp	DWORD PTR -76+[ebp], 2
	je	$L406
	cmp	DWORD PTR -76+[ebp], 3
	je	$L408
	cmp	DWORD PTR -76+[ebp], 4
	je	$L386
	jmp	$L429
$L382:
; Line 984
	cmp	DWORD PTR _growth$374[ebp], 0
	je	$L432
; Line 985
	mov	eax, DWORD PTR _growth$374[ebp]
	add	DWORD PTR _stretch$366[ebp], eax
; Line 986
	inc	DWORD PTR _stretched$367[ebp]
; Line 988
$L432:
	jmp	$L372
$L373:
; Line 989
$L369:
	cmp	DWORD PTR _stretched$367[ebp], 0
	jne	$L368
$L370:
; Line 1000
$L347:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_relax_segment ENDP
_address$ = 8
_alignment$ = 12
_mask$ = -4
_new_address$ = -8
_relax_align PROC NEAR
; Line 1011
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 1015
	mov	eax, -1
	mov	cl, BYTE PTR _alignment$[ebp]
	shl	eax, cl
	not	eax
	mov	DWORD PTR _mask$[ebp], eax
; Line 1016
	mov	eax, DWORD PTR _mask$[ebp]
	add	eax, DWORD PTR _address$[ebp]
	mov	ecx, DWORD PTR _mask$[ebp]
	not	ecx
	and	eax, ecx
	mov	DWORD PTR _new_address$[ebp], eax
; Line 1017
	mov	eax, DWORD PTR _new_address$[ebp]
	sub	eax, DWORD PTR _address$[ebp]
	jmp	$L435
; Line 1018
$L435:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_relax_align ENDP
_TEXT	ENDS
PUBLIC	_fixup_segment
EXTRN	_abs_symbol:BYTE
EXTRN	_md_number_to_chars:NEAR
EXTRN	_md_number_to_imm:NEAR
EXTRN	_md_number_to_disp:NEAR
EXTRN	_md_number_to_field:NEAR
EXTRN	_seg_name:BYTE
EXTRN	_N_TYPE_seg:BYTE
_DATA	SEGMENT
	ORG $+2
$SG459	DB	'Negative of non-absolute symbol %s', 00H
	ORG $+1
$SG466	DB	'Can''t emit reloc {- %s-seg symbol "%s"} @ file address '
	DB	'%d.', 00H
	ORG $+1
$SG478	DB	'write.c', 00H
$SG479	DB	'Case value %d unexpected at line %d of file "%s"', 0aH, 00H
	ORG $+2
$SG487	DB	'Fixup of %d too large for field width of %d', 00H
$SG498	DB	'Internal error in write.c in fixup_segment', 00H
_DATA	ENDS
_TEXT	SEGMENT
_where$ = -8
_pcrel$ = -16
_fragP$ = -24
_add_symbol_N_TYPE$ = -20
_fixP$ = 8
_this_segment_type$ = 12
_seg_reloc_count$ = -12
_add_symbolP$ = -28
_sub_symbolP$ = -32
_add_number$ = -40
_size$ = -4
_place$ = -36
_fixup_segment PROC NEAR
; Line 1030
	push	ebp
	mov	ebp, esp
	sub	esp, 52					; 00000034H
	push	ebx
	push	esi
	push	edi
; Line 1044
	mov	DWORD PTR _seg_reloc_count$[ebp], 0
; Line 1045
	jmp	$L452
$L453:
	mov	eax, DWORD PTR _fixP$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _fixP$[ebp], eax
$L452:
	cmp	DWORD PTR _fixP$[ebp], 0
	je	$L454
; Line 1047
	mov	eax, DWORD PTR _fixP$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _fragP$[ebp], eax
; Line 1049
	mov	eax, DWORD PTR _fixP$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _where$[ebp], eax
; Line 1050
	mov	eax, DWORD PTR _where$[ebp]
	add	eax, DWORD PTR _fragP$[ebp]
	add	eax, 38					; 00000026H
	mov	DWORD PTR _place$[ebp], eax
; Line 1051
	mov	eax, DWORD PTR _fixP$[ebp]
	movsx	eax, WORD PTR [eax+24]
	mov	DWORD PTR _size$[ebp], eax
; Line 1052
	mov	eax, DWORD PTR _fixP$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _add_symbolP$[ebp], eax
; Line 1053
	mov	eax, DWORD PTR _fixP$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _sub_symbolP$[ebp], eax
; Line 1054
	mov	eax, DWORD PTR _fixP$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _add_number$[ebp], eax
; Line 1055
	mov	eax, DWORD PTR _fixP$[ebp]
	mov	al, BYTE PTR [eax+26]
	mov	BYTE PTR _pcrel$[ebp], al
; Line 1056
	cmp	DWORD PTR _add_symbolP$[ebp], 0
	je	$L455
; Line 1057
	mov	eax, DWORD PTR _add_symbolP$[ebp]
	mov	al, BYTE PTR [eax+4]
	and	eax, 30					; 0000001eH
	mov	DWORD PTR _add_symbol_N_TYPE$[ebp], eax
; Line 1058
$L455:
	cmp	DWORD PTR _sub_symbolP$[ebp], 0
	je	$L456
; Line 1060
	cmp	DWORD PTR _add_symbolP$[ebp], 0
	jne	$L457
; Line 1062
	mov	eax, DWORD PTR _sub_symbolP$[ebp]
	mov	al, BYTE PTR [eax+4]
	and	eax, 255				; 000000ffH
	cmp	eax, 2
	je	$L458
; Line 1063
	mov	eax, DWORD PTR _sub_symbolP$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	push	OFFSET $SG459
	call	_as_warn
	add	esp, 8
; Line 1064
$L458:
	mov	eax, DWORD PTR _add_number$[ebp]
	mov	ecx, DWORD PTR _sub_symbolP$[ebp]
	sub	eax, DWORD PTR [ecx+8]
	mov	DWORD PTR _add_number$[ebp], eax
; Line 1066
	jmp	$L460
$L457:
; Line 1070
	mov	eax, DWORD PTR _sub_symbolP$[ebp]
	mov	al, BYTE PTR [eax+4]
	and	eax, 255				; 000000ffH
	xor	eax, DWORD PTR _add_symbol_N_TYPE$[ebp]
	test	al, 30					; 0000001eH
	jne	$L461
	cmp	DWORD PTR _add_symbol_N_TYPE$[ebp], 6
	je	$L462
	cmp	DWORD PTR _add_symbol_N_TYPE$[ebp], 4
	je	$L462
	cmp	DWORD PTR _add_symbol_N_TYPE$[ebp], 8
	je	$L462
	cmp	DWORD PTR _add_symbol_N_TYPE$[ebp], 2
	jne	$L461
$L462:
; Line 1075
	mov	eax, DWORD PTR _add_symbolP$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _sub_symbolP$[ebp]
	sub	eax, DWORD PTR [ecx+8]
	add	eax, DWORD PTR _add_number$[ebp]
	mov	DWORD PTR _add_number$[ebp], eax
; Line 1076
	mov	DWORD PTR _add_symbolP$[ebp], 0
; Line 1077
	mov	eax, DWORD PTR _fixP$[ebp]
	mov	DWORD PTR [eax+8], 0
; Line 1079
	jmp	$L463
$L461:
; Line 1083
	mov	eax, DWORD PTR _sub_symbolP$[ebp]
	mov	al, BYTE PTR [eax+4]
	and	eax, 255				; 000000ffH
	cmp	eax, 2
	jne	$L464
; Line 1084
	mov	eax, DWORD PTR _add_number$[ebp]
	mov	ecx, DWORD PTR _sub_symbolP$[ebp]
	sub	eax, DWORD PTR [ecx+8]
	mov	DWORD PTR _add_number$[ebp], eax
; Line 1085
	jmp	$L465
$L464:
; Line 1089
	mov	eax, DWORD PTR _fragP$[ebp]
	mov	eax, DWORD PTR [eax]
	add	eax, DWORD PTR _where$[ebp]
	push	eax
	mov	eax, DWORD PTR _sub_symbolP$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	mov	eax, DWORD PTR _sub_symbolP$[ebp]
	mov	al, BYTE PTR [eax+4]
	and	eax, 30					; 0000001eH
	mov	eax, DWORD PTR _N_TYPE_seg[eax*4]
	mov	eax, DWORD PTR _seg_name[eax*4]
	push	eax
	push	OFFSET $SG466
	call	_as_warn
	add	esp, 16					; 00000010H
; Line 1090
$L465:
; Line 1091
$L463:
$L460:
; Line 1093
$L456:
	cmp	DWORD PTR _add_symbolP$[ebp], 0
	je	$L467
; Line 1095
	mov	eax, DWORD PTR _add_symbol_N_TYPE$[ebp]
	cmp	DWORD PTR _this_segment_type$[ebp], eax
	jne	$L468
	movsx	eax, BYTE PTR _pcrel$[ebp]
	or	eax, eax
	je	$L468
; Line 1102
	mov	eax, DWORD PTR _add_symbolP$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, DWORD PTR _add_number$[ebp]
	mov	DWORD PTR _add_number$[ebp], eax
; Line 1107
	mov	eax, DWORD PTR _add_number$[ebp]
	mov	ecx, DWORD PTR _where$[ebp]
	add	ecx, DWORD PTR _size$[ebp]
	mov	edx, DWORD PTR _fragP$[ebp]
	add	ecx, DWORD PTR [edx]
	sub	eax, ecx
	mov	DWORD PTR _add_number$[ebp], eax
; Line 1114
	mov	BYTE PTR _pcrel$[ebp], 0
; Line 1115
	mov	eax, DWORD PTR _fixP$[ebp]
	mov	DWORD PTR [eax+8], 0
; Line 1124
	jmp	$L469
$L468:
; Line 1126
	mov	eax, DWORD PTR _add_symbol_N_TYPE$[ebp]
	mov	DWORD PTR -48+[ebp], eax
	jmp	$L470
; Line 1128
$L474:
; Line 1129
	mov	eax, DWORD PTR _add_symbolP$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, DWORD PTR _add_number$[ebp]
	mov	DWORD PTR _add_number$[ebp], eax
; Line 1130
	mov	eax, DWORD PTR _fixP$[ebp]
	mov	DWORD PTR [eax+8], 0
; Line 1131
	mov	DWORD PTR _add_symbolP$[ebp], 0
; Line 1132
	jmp	$L471
; Line 1134
$L475:
; Line 1137
	inc	DWORD PTR _seg_reloc_count$[ebp]
; Line 1138
	mov	eax, DWORD PTR _add_symbolP$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, DWORD PTR _add_number$[ebp]
	mov	DWORD PTR _add_number$[ebp], eax
; Line 1139
	jmp	$L471
; Line 1141
$L476:
; Line 1142
	inc	DWORD PTR _seg_reloc_count$[ebp]
; Line 1143
	jmp	$L471
; Line 1145
$L477:
; Line 1146
	push	OFFSET $SG478
	push	1146					; 0000047aH
	mov	eax, DWORD PTR _add_symbol_N_TYPE$[ebp]
	push	eax
	push	OFFSET $SG479
	call	_as_fatal
	add	esp, 16					; 00000010H
; Line 1147
	jmp	$L471
; Line 1148
	jmp	$L471
$L470:
	cmp	DWORD PTR -48+[ebp], 0
	je	$L476
	cmp	DWORD PTR -48+[ebp], 2
	je	$L474
	cmp	DWORD PTR -48+[ebp], 4
	je	$L475
	cmp	DWORD PTR -48+[ebp], 6
	je	$L475
	cmp	DWORD PTR -48+[ebp], 8
	je	$L475
	jmp	$L477
$L471:
; Line 1149
$L469:
; Line 1151
$L467:
	movsx	eax, BYTE PTR _pcrel$[ebp]
	or	eax, eax
	je	$L480
; Line 1154
	cmp	DWORD PTR _add_symbol_N_TYPE$[ebp], 0
	je	$L481
; Line 1160
	mov	eax, DWORD PTR _add_number$[ebp]
	mov	ecx, DWORD PTR _where$[ebp]
	add	ecx, DWORD PTR _size$[ebp]
	mov	edx, DWORD PTR _fragP$[ebp]
	add	ecx, DWORD PTR [edx]
	sub	eax, ecx
	mov	DWORD PTR _add_number$[ebp], eax
; Line 1161
$L481:
	cmp	DWORD PTR _add_symbolP$[ebp], 0
	jne	$L482
; Line 1163
	mov	eax, DWORD PTR _fixP$[ebp]
	mov	DWORD PTR [eax+8], OFFSET _abs_symbol
; Line 1164
	inc	DWORD PTR _seg_reloc_count$[ebp]
; Line 1166
$L482:
; Line 1168
$L480:
	mov	eax, DWORD PTR _fixP$[ebp]
	cmp	DWORD PTR [eax+32], 0
	jne	$L483
; Line 1171
	cmp	DWORD PTR _size$[ebp], 1
	jne	$L486
	test	DWORD PTR _add_number$[ebp], -256	; ffffff00H
	je	$L486
$L486:
	jmp	$L484
$L485:
; Line 1172
	mov	eax, DWORD PTR _size$[ebp]
	push	eax
	mov	eax, DWORD PTR _add_number$[ebp]
	push	eax
	push	OFFSET $SG487
	call	_as_warn
	add	esp, 12					; 0000000cH
; Line 1174
$L484:
	mov	eax, DWORD PTR _fixP$[ebp]
	movsx	eax, BYTE PTR [eax+28]
	mov	DWORD PTR -52+[ebp], eax
	jmp	$L488
; Line 1175
$L492:
; Line 1180
	mov	eax, DWORD PTR _size$[ebp]
	push	eax
	mov	eax, DWORD PTR _add_number$[ebp]
	push	eax
	mov	eax, DWORD PTR _place$[ebp]
	push	eax
	call	_md_number_to_imm
	add	esp, 12					; 0000000cH
; Line 1183
	jmp	$L489
; Line 1184
$L494:
; Line 1187
	mov	eax, DWORD PTR _fixP$[ebp]
	movsx	eax, BYTE PTR [eax+26]
	or	eax, eax
	je	$L514
	mov	eax, DWORD PTR _fixP$[ebp]
	movsx	eax, BYTE PTR [eax+27]
	add	eax, DWORD PTR _add_number$[ebp]
	mov	DWORD PTR -44+[ebp], eax
	jmp	$L515
$L514:
	mov	eax, DWORD PTR _add_number$[ebp]
	mov	DWORD PTR -44+[ebp], eax
$L515:
	mov	eax, DWORD PTR _size$[ebp]
	push	eax
	mov	eax, DWORD PTR -44+[ebp]
	push	eax
	mov	eax, DWORD PTR _place$[ebp]
	push	eax
	call	_md_number_to_disp
	add	esp, 12					; 0000000cH
; Line 1188
	jmp	$L489
; Line 1189
$L496:
; Line 1190
	mov	eax, DWORD PTR _size$[ebp]
	push	eax
	mov	eax, DWORD PTR _add_number$[ebp]
	push	eax
	mov	eax, DWORD PTR _place$[ebp]
	push	eax
	call	_md_number_to_chars
	add	esp, 12					; 0000000cH
; Line 1191
	jmp	$L489
; Line 1192
$L497:
; Line 1193
	push	OFFSET $SG498
	call	_as_fatal
	add	esp, 4
; Line 1194
	jmp	$L489
$L488:
	cmp	DWORD PTR -52+[ebp], 0
	je	$L492
	cmp	DWORD PTR -52+[ebp], 1
	je	$L494
	cmp	DWORD PTR -52+[ebp], 2
	je	$L496
	jmp	$L497
$L489:
; Line 1195
	jmp	$L499
$L483:
; Line 1196
	mov	eax, DWORD PTR _fixP$[ebp]
	mov	eax, DWORD PTR [eax+32]
	push	eax
	mov	eax, DWORD PTR _add_number$[ebp]
	push	eax
	mov	eax, DWORD PTR _place$[ebp]
	push	eax
	call	_md_number_to_field
	add	esp, 12					; 0000000cH
; Line 1197
$L499:
; Line 1198
	jmp	$L453
$L454:
; Line 1199
	mov	eax, DWORD PTR _seg_reloc_count$[ebp]
	jmp	$L441
; Line 1200
$L441:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_fixup_segment ENDP
_f1$ = 8
_f2$ = 12
_is_dnrange PROC NEAR
; Line 1269
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1270
$L505:
	cmp	DWORD PTR _f1$[ebp], 0
	je	$L506
; Line 1271
	mov	eax, DWORD PTR _f1$[ebp]
	mov	ecx, DWORD PTR _f2$[ebp]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L507
; Line 1272
	mov	eax, 1
	jmp	$L503
; Line 1273
$L507:
	mov	eax, DWORD PTR _f1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _f1$[ebp], eax
; Line 1274
	jmp	$L505
$L506:
; Line 1275
	sub	eax, eax
	jmp	$L503
; Line 1276
$L503:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_is_dnrange ENDP
_TEXT	ENDS
END
