	TITLE	c-decl.c
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
PUBLIC	_language_string
PUBLIC	_dollars_in_ident
PUBLIC	_debug_temp_inits
_DATA	SEGMENT
COMM	_int_ftype_int:DWORD
COMM	_long_ftype_long:DWORD
COMM	_void_ftype_ptr_ptr_int:DWORD
COMM	_int_ftype_ptr_ptr_int:DWORD
COMM	_void_ftype_ptr_int_int:DWORD
COMM	_value_identifier:DWORD
COMM	_integer_zero_node:DWORD
COMM	_integer_one_node:DWORD
COMM	_null_pointer_node:DWORD
COMM	_double_type_node:DWORD
COMM	_error_mark_node:DWORD
COMM	_long_double_type_node:DWORD
COMM	_void_type_node:DWORD
COMM	_float_type_node:DWORD
COMM	_integer_type_node:DWORD
COMM	_unsigned_char_type_node:DWORD
COMM	_unsigned_type_node:DWORD
COMM	_signed_char_type_node:DWORD
COMM	_char_type_node:DWORD
COMM	_short_integer_type_node:DWORD
COMM	_short_unsigned_type_node:DWORD
COMM	_long_integer_type_node:DWORD
COMM	_long_unsigned_type_node:DWORD
COMM	_long_long_integer_type_node:DWORD
COMM	_current_function_decl:DWORD
COMM	_long_long_unsigned_type_node:DWORD
COMM	_string_type_node:DWORD
COMM	_char_array_type_node:DWORD
COMM	_int_array_type_node:DWORD
COMM	_current_function_returns_value:DWORD
COMM	_current_function_returns_null:DWORD
COMM	_flag_cond_mismatch:DWORD
COMM	_flag_no_asm:DWORD
COMM	_warn_implicit:DWORD
COMM	_warn_return_type:DWORD
COMM	_warn_write_strings:DWORD
COMM	_warn_pointer_arith:DWORD
COMM	_warn_strict_prototypes:DWORD
COMM	_warn_cast_qual:DWORD
COMM	_flag_traditional:DWORD
COMM	_ptr_type_node:DWORD
COMM	_default_function_type:DWORD
COMM	_double_ftype_double:DWORD
COMM	_double_ftype_double_double:DWORD
_clear_binding_level$S722 DD 00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DB	00H
	DB	00H
	DB	00H
	ORG $+5
_dollars_in_ident DD 00H
$SG735	DB	'GNU C', 00H
	ORG $+2
_language_string DD $SG735
_debug_temp_inits DD 01H
_DATA	ENDS
PUBLIC	_lang_decode_option
EXTRN	_extra_warnings:DWORD
EXTRN	_warn_unused:DWORD
EXTRN	_warn_switch:DWORD
EXTRN	_flag_signed_char:DWORD
EXTRN	_flag_short_enums:DWORD
EXTRN	_flag_writable_strings:DWORD
EXTRN	_strcmp:NEAR
_DATA	SEGMENT
$SG742	DB	'-ftraditional', 00H
	ORG $+2
$SG743	DB	'-traditional', 00H
	ORG $+3
$SG746	DB	'-fsigned-char', 00H
	ORG $+2
$SG749	DB	'-funsigned-char', 00H
$SG752	DB	'-fno-signed-char', 00H
	ORG $+3
$SG755	DB	'-fno-unsigned-char', 00H
	ORG $+1
$SG758	DB	'-fshort-enums', 00H
	ORG $+2
$SG761	DB	'-fno-short-enums', 00H
	ORG $+3
$SG764	DB	'-fcond-mismatch', 00H
$SG767	DB	'-fno-cond-mismatch', 00H
	ORG $+1
$SG770	DB	'-fasm', 00H
	ORG $+2
$SG773	DB	'-fno-asm', 00H
	ORG $+3
$SG776	DB	'-ansi', 00H
	ORG $+2
$SG779	DB	'-Wimplicit', 00H
	ORG $+1
$SG782	DB	'-Wreturn-type', 00H
	ORG $+2
$SG785	DB	'-Wwrite-strings', 00H
$SG788	DB	'-Wcast-qual', 00H
$SG791	DB	'-Wpointer-arith', 00H
$SG794	DB	'-Wstrict-prototypes', 00H
$SG797	DB	'-Wcomment', 00H
	ORG $+2
$SG800	DB	'-Wcomments', 00H
	ORG $+1
$SG803	DB	'-Wtrigraphs', 00H
$SG806	DB	'-Wall', 00H
_DATA	ENDS
_TEXT	SEGMENT
; File c-decl.c
_p$ = 8
_lang_decode_option PROC NEAR
; Line 378
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 379
	push	OFFSET $SG742
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	je	$L741
	push	OFFSET $SG743
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L740
$L741:
; Line 380
	mov	DWORD PTR _flag_traditional, 1
	mov	DWORD PTR _dollars_in_ident, 1
	mov	DWORD PTR _flag_writable_strings, 1
; Line 381
	jmp	$L744
$L740:
	push	OFFSET $SG746
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L745
; Line 382
	mov	DWORD PTR _flag_signed_char, 1
; Line 383
	jmp	$L747
$L745:
	push	OFFSET $SG749
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L748
; Line 384
	mov	DWORD PTR _flag_signed_char, 0
; Line 385
	jmp	$L750
$L748:
	push	OFFSET $SG752
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L751
; Line 386
	mov	DWORD PTR _flag_signed_char, 0
; Line 387
	jmp	$L753
$L751:
	push	OFFSET $SG755
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L754
; Line 388
	mov	DWORD PTR _flag_signed_char, 1
; Line 389
	jmp	$L756
$L754:
	push	OFFSET $SG758
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L757
; Line 390
	mov	DWORD PTR _flag_short_enums, 1
; Line 391
	jmp	$L759
$L757:
	push	OFFSET $SG761
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L760
; Line 392
	mov	DWORD PTR _flag_short_enums, 0
; Line 393
	jmp	$L762
$L760:
	push	OFFSET $SG764
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L763
; Line 394
	mov	DWORD PTR _flag_cond_mismatch, 1
; Line 395
	jmp	$L765
$L763:
	push	OFFSET $SG767
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L766
; Line 396
	mov	DWORD PTR _flag_cond_mismatch, 0
; Line 397
	jmp	$L768
$L766:
	push	OFFSET $SG770
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L769
; Line 398
	mov	DWORD PTR _flag_no_asm, 0
; Line 399
	jmp	$L771
$L769:
	push	OFFSET $SG773
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L772
; Line 400
	mov	DWORD PTR _flag_no_asm, 1
; Line 401
	jmp	$L774
$L772:
	push	OFFSET $SG776
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L775
; Line 402
	mov	DWORD PTR _flag_no_asm, 1
	mov	DWORD PTR _dollars_in_ident, 0
; Line 403
	jmp	$L777
$L775:
	push	OFFSET $SG779
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L778
; Line 404
	mov	DWORD PTR _warn_implicit, 1
; Line 405
	jmp	$L780
$L778:
	push	OFFSET $SG782
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L781
; Line 406
	mov	DWORD PTR _warn_return_type, 1
; Line 407
	jmp	$L783
$L781:
	push	OFFSET $SG785
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L784
; Line 408
	mov	DWORD PTR _warn_write_strings, 1
; Line 409
	jmp	$L786
$L784:
	push	OFFSET $SG788
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L787
; Line 410
	mov	DWORD PTR _warn_cast_qual, 1
; Line 411
	jmp	$L789
$L787:
	push	OFFSET $SG791
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L790
; Line 412
	mov	DWORD PTR _warn_pointer_arith, 1
; Line 413
	jmp	$L792
$L790:
	push	OFFSET $SG794
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L793
; Line 414
	mov	DWORD PTR _warn_strict_prototypes, 1
; Line 415
	jmp	$L795
$L793:
	push	OFFSET $SG797
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L796
; Line 417
	jmp	$L798
$L796:
	push	OFFSET $SG800
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L799
; Line 419
	jmp	$L801
$L799:
	push	OFFSET $SG803
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L802
; Line 421
	jmp	$L804
$L802:
	push	OFFSET $SG806
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L805
; Line 423
	mov	DWORD PTR _extra_warnings, 1
; Line 424
	mov	DWORD PTR _warn_implicit, 1
; Line 425
	mov	DWORD PTR _warn_return_type, 1
; Line 426
	mov	DWORD PTR _warn_unused, 1
; Line 427
	mov	DWORD PTR _warn_switch, 1
; Line 429
	jmp	$L807
$L805:
; Line 430
	sub	eax, eax
	jmp	$L738
$L807:
$L804:
$L801:
$L798:
$L795:
$L792:
$L789:
$L786:
$L783:
$L780:
$L777:
$L774:
$L771:
$L768:
$L765:
$L762:
$L759:
$L756:
$L753:
$L750:
$L747:
$L744:
; Line 432
	mov	eax, 1
	jmp	$L738
; Line 433
$L738:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_lang_decode_option ENDP
_TEXT	ENDS
PUBLIC	_print_lang_identifier
EXTRN	_print_node:NEAR
_DATA	SEGMENT
	ORG $+2
$SG814	DB	'global', 00H
	ORG $+1
$SG815	DB	'local', 00H
	ORG $+2
$SG816	DB	'label', 00H
	ORG $+2
$SG817	DB	'implicit', 00H
	ORG $+3
$SG818	DB	'error locus', 00H
_DATA	ENDS
_TEXT	SEGMENT
_file$ = 8
_node$ = 12
_indent$ = 16
_print_lang_identifier PROC NEAR
; Line 440
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 441
	mov	eax, DWORD PTR _indent$[ebp]
	add	eax, 4
	push	eax
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	push	OFFSET $SG814
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_print_node
	add	esp, 16					; 00000010H
; Line 442
	mov	eax, DWORD PTR _indent$[ebp]
	add	eax, 4
	push	eax
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+32]
	push	eax
	push	OFFSET $SG815
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_print_node
	add	esp, 16					; 00000010H
; Line 443
	mov	eax, DWORD PTR _indent$[ebp]
	add	eax, 4
	push	eax
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+36]
	push	eax
	push	OFFSET $SG816
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_print_node
	add	esp, 16					; 00000010H
; Line 444
	mov	eax, DWORD PTR _indent$[ebp]
	add	eax, 4
	push	eax
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+40]
	push	eax
	push	OFFSET $SG817
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_print_node
	add	esp, 16					; 00000010H
; Line 445
	mov	eax, DWORD PTR _indent$[ebp]
	add	eax, 4
	push	eax
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+44]
	push	eax
	push	OFFSET $SG818
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_print_node
	add	esp, 16					; 00000010H
; Line 446
$L812:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_print_lang_identifier ENDP
_TEXT	ENDS
EXTRN	_xmalloc:NEAR
_TEXT	SEGMENT
_make_binding_level PROC NEAR
; Line 453
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 455
	push	28					; 0000001cH
	call	_xmalloc
	add	esp, 4
	jmp	$L820
; Line 456
$L820:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_make_binding_level ENDP
_TEXT	ENDS
PUBLIC	_global_bindings_p
_BSS	SEGMENT
_current_binding_level$S719 DD 01H DUP (?)
_global_binding_level$S721 DD 01H DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
_global_bindings_p PROC NEAR
; Line 462
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 463
	mov	eax, DWORD PTR _global_binding_level$S721
	sub	eax, DWORD PTR _current_binding_level$S719
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	jmp	$L823
; Line 464
$L823:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_global_bindings_p ENDP
_TEXT	ENDS
PUBLIC	_keep_next_level
_BSS	SEGMENT
_keep_next_level_flag$S723 DD 01H DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
_keep_next_level PROC NEAR
; Line 468
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 469
	mov	DWORD PTR _keep_next_level_flag$S723, 1
; Line 470
$L825:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_keep_next_level ENDP
_TEXT	ENDS
PUBLIC	_kept_level_p
_TEXT	SEGMENT
_kept_level_p PROC NEAR
; Line 476
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 480
	mov	eax, DWORD PTR _current_binding_level$S719
	movsx	eax, BYTE PTR [eax+23]
	or	eax, eax
	je	$L1944
	mov	eax, DWORD PTR _current_binding_level$S719
	cmp	DWORD PTR [eax+12], 0
	jne	$L1943
$L1944:
	mov	eax, DWORD PTR _current_binding_level$S719
	movsx	eax, BYTE PTR [eax+22]
	or	eax, eax
	jne	$L1943
	mov	eax, DWORD PTR _current_binding_level$S719
	cmp	DWORD PTR [eax], 0
	je	$L1941
$L1943:
	mov	eax, 1
	jmp	$L1942
$L1941:
	sub	eax, eax
$L1942:
	jmp	$L827
; Line 481
$L827:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_kept_level_p ENDP
_TEXT	ENDS
PUBLIC	_declare_parm_level
_TEXT	SEGMENT
_declare_parm_level PROC NEAR
; Line 487
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 488
	mov	eax, DWORD PTR _current_binding_level$S719
	mov	BYTE PTR [eax+20], 1
; Line 489
$L829:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_declare_parm_level ENDP
_TEXT	ENDS
PUBLIC	_in_parm_level_p
_TEXT	SEGMENT
_in_parm_level_p PROC NEAR
; Line 494
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 495
	mov	eax, DWORD PTR _current_binding_level$S719
	movsx	eax, BYTE PTR [eax+20]
	jmp	$L831
; Line 496
$L831:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_in_parm_level_p ENDP
_TEXT	ENDS
PUBLIC	_pushlevel
EXTRN	_abort:NEAR
_BSS	SEGMENT
_named_labels$S715 DD 01H DUP (?)
_free_binding_level$S720 DD 01H DUP (?)
_keep_next_if_subblocks$S724 DD 01H DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
_tag_transparent$ = 8
_newlevel$ = -4
_pushlevel PROC NEAR
; Line 505
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 506
	mov	DWORD PTR _newlevel$[ebp], 0
; Line 512
	mov	eax, DWORD PTR _current_binding_level$S719
	cmp	DWORD PTR _global_binding_level$S721, eax
	jne	$L835
; Line 514
	cmp	DWORD PTR _named_labels$S715, 0
	je	$L836
; Line 515
	call	_abort
; Line 516
$L836:
; Line 520
$L835:
	cmp	DWORD PTR _free_binding_level$S720, 0
	je	$L838
; Line 522
	mov	eax, DWORD PTR _free_binding_level$S720
	mov	DWORD PTR _newlevel$[ebp], eax
; Line 523
	mov	eax, DWORD PTR _free_binding_level$S720
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _free_binding_level$S720, eax
; Line 525
	jmp	$L839
$L838:
; Line 527
	call	_make_binding_level
	mov	DWORD PTR _newlevel$[ebp], eax
; Line 528
$L839:
; Line 533
	mov	esi, OFFSET _clear_binding_level$S722
	mov	edi, DWORD PTR _newlevel$[ebp]
	mov	ecx, 7
	rep	movsd
; Line 534
	mov	eax, DWORD PTR _current_binding_level$S719
	mov	ecx, DWORD PTR _newlevel$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 535
	mov	eax, DWORD PTR _newlevel$[ebp]
	mov	DWORD PTR _current_binding_level$S719, eax
; Line 536
	mov	al, BYTE PTR _tag_transparent$[ebp]
	mov	ecx, DWORD PTR _newlevel$[ebp]
	mov	BYTE PTR [ecx+21], al
; Line 537
	mov	al, BYTE PTR _keep_next_level_flag$S723
	mov	ecx, DWORD PTR _newlevel$[ebp]
	mov	BYTE PTR [ecx+22], al
; Line 538
	mov	DWORD PTR _keep_next_level_flag$S723, 0
; Line 539
	mov	al, BYTE PTR _keep_next_if_subblocks$S724
	mov	ecx, DWORD PTR _newlevel$[ebp]
	mov	BYTE PTR [ecx+23], al
; Line 540
	mov	DWORD PTR _keep_next_if_subblocks$S724, 0
; Line 541
$L833:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_pushlevel ENDP
_TEXT	ENDS
PUBLIC	_poplevel
PUBLIC	_define_label
EXTRN	_nreverse:NEAR
EXTRN	_input_filename:DWORD
EXTRN	_build_let:NEAR
EXTRN	_error:NEAR
EXTRN	_warning_with_decl:NEAR
EXTRN	_chainon:NEAR
_DATA	SEGMENT
$SG870	DB	'label `%s'' used somewhere above but not defined', 00H
$SG874	DB	'label `%s'' defined but not used', 00H
_DATA	ENDS
_TEXT	SEGMENT
_keep$ = 8
_reverse$ = 12
_functionbody$ = 16
_link$ = -8
_decls$ = -16
_tags$ = -20
_subblocks$ = -4
_block$ = -12
_level$875 = -24
_poplevel PROC NEAR
; Line 563
	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H
	push	ebx
	push	esi
	push	edi
; Line 568
	mov	eax, DWORD PTR _current_binding_level$S719
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _tags$[ebp], eax
; Line 569
	mov	eax, DWORD PTR _current_binding_level$S719
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _subblocks$[ebp], eax
; Line 570
	mov	DWORD PTR _block$[ebp], 0
; Line 572
	mov	eax, DWORD PTR _current_binding_level$S719
	movsx	eax, BYTE PTR [eax+22]
	or	DWORD PTR _keep$[ebp], eax
; Line 607
	cmp	DWORD PTR _reverse$[ebp], 0
	je	$L849
; Line 609
	mov	eax, DWORD PTR _current_binding_level$S719
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_nreverse
	add	esp, 4
	mov	DWORD PTR _decls$[ebp], eax
	mov	eax, DWORD PTR _decls$[ebp]
	mov	ecx, DWORD PTR _current_binding_level$S719
	mov	DWORD PTR [ecx], eax
; Line 610
	jmp	$L850
$L849:
; Line 611
	mov	eax, DWORD PTR _current_binding_level$S719
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _decls$[ebp], eax
$L850:
; Line 618
	cmp	DWORD PTR _keep$[ebp], 0
	jne	$L852
	cmp	DWORD PTR _functionbody$[ebp], 0
	jne	$L852
	mov	eax, DWORD PTR _current_binding_level$S719
	movsx	eax, BYTE PTR [eax+23]
	or	eax, eax
	je	$L851
	cmp	DWORD PTR _subblocks$[ebp], 0
	je	$L851
$L852:
; Line 620
	cmp	DWORD PTR _keep$[ebp], 0
	je	$L1945
	mov	eax, DWORD PTR _tags$[ebp]
	mov	DWORD PTR -28+[ebp], eax
	jmp	$L1946
$L1945:
	mov	DWORD PTR -28+[ebp], 0
$L1946:
	cmp	DWORD PTR _keep$[ebp], 0
	je	$L1947
	mov	eax, DWORD PTR _decls$[ebp]
	mov	DWORD PTR -32+[ebp], eax
	jmp	$L1948
$L1947:
	mov	DWORD PTR -32+[ebp], 0
$L1948:
	mov	eax, DWORD PTR -28+[ebp]
	push	eax
	push	0
	mov	eax, DWORD PTR _subblocks$[ebp]
	push	eax
	mov	eax, DWORD PTR -32+[ebp]
	push	eax
	push	0
	push	0
	call	_build_let
	add	esp, 24					; 00000018H
	mov	DWORD PTR _block$[ebp], eax
; Line 624
$L851:
	mov	eax, DWORD PTR _subblocks$[ebp]
	mov	DWORD PTR _link$[ebp], eax
	jmp	$L853
$L854:
	mov	eax, DWORD PTR _link$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _link$[ebp], eax
$L853:
	cmp	DWORD PTR _link$[ebp], 0
	je	$L855
; Line 625
	mov	eax, DWORD PTR _block$[ebp]
	mov	ecx, DWORD PTR _link$[ebp]
	mov	DWORD PTR [ecx+36], eax
	jmp	$L854
$L855:
; Line 630
	mov	eax, DWORD PTR _decls$[ebp]
	mov	DWORD PTR _link$[ebp], eax
	jmp	$L856
$L857:
	mov	eax, DWORD PTR _link$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _link$[ebp], eax
$L856:
	cmp	DWORD PTR _link$[ebp], 0
	je	$L858
; Line 632
	mov	eax, DWORD PTR _link$[ebp]
	cmp	DWORD PTR [eax+40], 0
	je	$L859
; Line 636
	mov	eax, DWORD PTR _link$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 15					; 0000000fH
	test	al, 1
	je	$L860
	mov	eax, DWORD PTR _link$[ebp]
	test	BYTE PTR [eax+16], 1
	je	$L860
; Line 637
	mov	eax, DWORD PTR _link$[ebp]
	mov	eax, DWORD PTR [eax+40]
	mov	eax, DWORD PTR [eax+16]
	or	eax, 32768				; 00008000H
	mov	ecx, DWORD PTR _link$[ebp]
	mov	ecx, DWORD PTR [ecx+40]
	mov	DWORD PTR [ecx+16], eax
; Line 638
$L860:
	mov	eax, DWORD PTR _link$[ebp]
	mov	eax, DWORD PTR [eax+40]
	mov	DWORD PTR [eax+32], 0
; Line 640
$L859:
	mov	eax, DWORD PTR _block$[ebp]
	mov	ecx, DWORD PTR _link$[ebp]
	mov	DWORD PTR [ecx+44], eax
; Line 641
	jmp	$L857
$L858:
; Line 646
	mov	eax, DWORD PTR _current_binding_level$S719
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _link$[ebp], eax
	jmp	$L861
$L862:
	mov	eax, DWORD PTR _link$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _link$[ebp], eax
$L861:
	cmp	DWORD PTR _link$[ebp], 0
	je	$L863
; Line 647
	mov	eax, DWORD PTR _link$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	ecx, DWORD PTR _link$[ebp]
	mov	ecx, DWORD PTR [ecx+20]
	mov	DWORD PTR [ecx+32], eax
	jmp	$L862
$L863:
; Line 652
	cmp	DWORD PTR _functionbody$[ebp], 0
	je	$L864
; Line 657
	mov	eax, DWORD PTR _named_labels$S715
	mov	DWORD PTR _link$[ebp], eax
	jmp	$L865
$L866:
	mov	eax, DWORD PTR _link$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _link$[ebp], eax
$L865:
	cmp	DWORD PTR _link$[ebp], 0
	je	$L867
; Line 659
	mov	eax, DWORD PTR _link$[ebp]
	mov	eax, DWORD PTR [eax+24]
	cmp	DWORD PTR [eax+24], 0
	jne	$L868
; Line 662
	mov	eax, DWORD PTR _link$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	eax, DWORD PTR [eax+40]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	OFFSET $SG870
	call	_error
	add	esp, 8
; Line 664
	mov	eax, DWORD PTR _link$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	eax, DWORD PTR [eax+40]
	push	eax
	push	1
	mov	eax, DWORD PTR _input_filename
	push	eax
	call	_define_label
	add	esp, 12					; 0000000cH
; Line 666
	jmp	$L871
$L868:
	cmp	DWORD PTR _warn_unused, 0
	je	$L872
	mov	eax, DWORD PTR _link$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 15					; 0000000fH
	test	al, 1
	jne	$L872
; Line 668
	push	OFFSET $SG874
	mov	eax, DWORD PTR _link$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_warning_with_decl
	add	esp, 8
; Line 669
$L872:
$L871:
	mov	eax, DWORD PTR _link$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	eax, DWORD PTR [eax+40]
	mov	DWORD PTR [eax+36], 0
; Line 670
	jmp	$L866
$L867:
; Line 672
	mov	DWORD PTR _named_labels$S715, 0
; Line 677
$L864:
; Line 678
	mov	eax, DWORD PTR _current_binding_level$S719
	mov	DWORD PTR _level$875[ebp], eax
; Line 679
	mov	eax, DWORD PTR _current_binding_level$S719
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _current_binding_level$S719, eax
; Line 681
	mov	eax, DWORD PTR _free_binding_level$S720
	mov	ecx, DWORD PTR _level$875[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 682
	mov	eax, DWORD PTR _level$875[ebp]
	mov	DWORD PTR _free_binding_level$S720, eax
; Line 685
	cmp	DWORD PTR _functionbody$[ebp], 0
	je	$L876
; Line 687
	mov	eax, DWORD PTR _block$[ebp]
	mov	ecx, DWORD PTR _current_function_decl
	mov	DWORD PTR [ecx+64], eax
; Line 692
	mov	eax, DWORD PTR _block$[ebp]
	mov	DWORD PTR [eax+32], 0
; Line 694
	jmp	$L877
$L876:
	cmp	DWORD PTR _block$[ebp], 0
	je	$L878
; Line 696
	mov	eax, DWORD PTR _block$[ebp]
	push	eax
	mov	eax, DWORD PTR _current_binding_level$S719
	mov	eax, DWORD PTR [eax+12]
	push	eax
	call	_chainon
	add	esp, 8
	mov	ecx, DWORD PTR _current_binding_level$S719
	mov	DWORD PTR [ecx+12], eax
; Line 702
	jmp	$L879
$L878:
	cmp	DWORD PTR _subblocks$[ebp], 0
	je	$L880
; Line 704
	mov	eax, DWORD PTR _subblocks$[ebp]
	push	eax
	mov	eax, DWORD PTR _current_binding_level$S719
	mov	eax, DWORD PTR [eax+12]
	push	eax
	call	_chainon
	add	esp, 8
	mov	ecx, DWORD PTR _current_binding_level$S719
	mov	DWORD PTR [ecx+12], eax
; Line 706
$L880:
$L879:
$L877:
	cmp	DWORD PTR _block$[ebp], 0
	je	$L881
; Line 707
	mov	eax, DWORD PTR _block$[ebp]
	mov	eax, DWORD PTR [eax+16]
	or	eax, 32768				; 00008000H
	mov	ecx, DWORD PTR _block$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 708
$L881:
	mov	eax, DWORD PTR _block$[ebp]
	jmp	$L843
; Line 709
$L843:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_poplevel ENDP
_TEXT	ENDS
PUBLIC	_pushtag
EXTRN	_perm_tree_cons:NEAR
EXTRN	_saveable_tree_cons:NEAR
_TEXT	SEGMENT
_name$ = 8
_type$ = 12
_b$ = -4
_pushtag PROC NEAR
; Line 721
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 722
	mov	eax, DWORD PTR _current_binding_level$S719
	mov	DWORD PTR _b$[ebp], eax
; Line 723
$L888:
	mov	eax, DWORD PTR _b$[ebp]
	movsx	eax, BYTE PTR [eax+21]
	or	eax, eax
	je	$L889
	mov	eax, DWORD PTR _b$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _b$[ebp], eax
	jmp	$L888
$L889:
; Line 725
	cmp	DWORD PTR _name$[ebp], 0
	je	$L890
; Line 729
	mov	eax, DWORD PTR _type$[ebp]
	cmp	DWORD PTR [eax+56], 0
	jne	$L891
; Line 730
	mov	eax, DWORD PTR _name$[ebp]
	mov	ecx, DWORD PTR _type$[ebp]
	mov	DWORD PTR [ecx+56], eax
; Line 732
$L891:
	mov	eax, DWORD PTR _global_binding_level$S721
	cmp	DWORD PTR _b$[ebp], eax
	jne	$L892
; Line 733
	mov	eax, DWORD PTR _b$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_perm_tree_cons
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _b$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 734
	jmp	$L893
$L892:
; Line 735
	mov	eax, DWORD PTR _b$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_saveable_tree_cons
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _b$[ebp]
	mov	DWORD PTR [ecx+4], eax
$L893:
; Line 737
$L890:
$L885:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_pushtag ENDP
_TEXT	ENDS
EXTRN	_comptypes:NEAR
EXTRN	_memcpy:NEAR
EXTRN	_error_with_decl:NEAR
EXTRN	_pedantic:DWORD
EXTRN	_layout_type:NEAR
EXTRN	_layout_decl:NEAR
EXTRN	_commontype:NEAR
_DATA	SEGMENT
$SG904	DB	'`%s'' redeclared as different kind of symbol', 00H
$SG905	DB	'previous declaration of `%s''', 00H
	ORG $+3
$SG911	DB	'conflicting types for built-in function `%s''', 00H
	ORG $+3
$SG914	DB	'built-in function `%s'' redeclared', 00H
	ORG $+2
$SG917	DB	'conflicting types for `%s''', 00H
	ORG $+1
$SG928	DB	'A parameter list with an ellipsis can''t match', 00H
	ORG $+2
$SG929	DB	'an empty parameter name list declaration.', 00H
	ORG $+2
$SG932	DB	'An argument type that has a default promotion', 00H
	ORG $+2
$SG933	DB	'can''t match an empty parameter name list declaration.', 00H
	ORG $+2
$SG934	DB	'previous declaration of `%s''', 00H
	ORG $+3
$SG938	DB	'here is the previous declaration of `%s''', 00H
	ORG $+3
$SG941	DB	'prototype for `%s''', 00H
	ORG $+1
$SG942	DB	'follows non-prototype definition here', 00H
	ORG $+2
$SG945	DB	'type qualifiers for `%s'' conflict with previous decl', 00H
_DATA	ENDS
_TEXT	SEGMENT
_types_match$ = -4
_t$921 = -8
_type$926 = -12
_errmsg$936 = -16
_new_is_definition$947 = -20
_oldtype$949 = -24
_newdecl$ = 8
_olddecl$ = 12
_duplicate_decls PROC NEAR
; Line 750
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	push	ebx
	push	esi
	push	edi
; Line 751
	mov	eax, DWORD PTR _olddecl$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _newdecl$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_comptypes
	add	esp, 8
	mov	DWORD PTR _types_match$[ebp], eax
; Line 754
	mov	eax, DWORD PTR _newdecl$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L901
	mov	eax, DWORD PTR _olddecl$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	or	eax, eax
	jne	$L900
$L901:
; Line 755
	mov	DWORD PTR _types_match$[ebp], 0
; Line 758
$L900:
	mov	eax, DWORD PTR _olddecl$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _newdecl$[ebp]
	mov	cl, BYTE PTR [ecx+12]
	and	ecx, 255				; 000000ffH
	cmp	eax, ecx
	je	$L902
; Line 760
	push	OFFSET $SG904
	mov	eax, DWORD PTR _newdecl$[ebp]
	push	eax
	call	_error_with_decl
	add	esp, 8
; Line 761
	push	OFFSET $SG905
	mov	eax, DWORD PTR _olddecl$[ebp]
	push	eax
	call	_error_with_decl
	add	esp, 8
; Line 763
	jmp	$L906
$L902:
; Line 767
	cmp	DWORD PTR _flag_traditional, 0
	je	$L907
	mov	eax, DWORD PTR _newdecl$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 39					; 00000027H
	jne	$L907
	mov	eax, DWORD PTR _newdecl$[ebp]
	mov	eax, DWORD PTR [eax+40]
	mov	ecx, DWORD PTR _olddecl$[ebp]
	cmp	DWORD PTR [eax+40], ecx
	jne	$L907
	mov	eax, DWORD PTR _olddecl$[ebp]
	cmp	DWORD PTR [eax+64], 0
	jne	$L907
; Line 771
	jmp	$L908
$L907:
; Line 772
	mov	eax, DWORD PTR _olddecl$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 39					; 00000027H
	jne	$L909
	mov	eax, DWORD PTR _olddecl$[ebp]
	cmp	DWORD PTR [eax+48], 0
	je	$L909
; Line 774
	cmp	DWORD PTR _types_match$[ebp], 0
	jne	$L910
; Line 775
	push	OFFSET $SG911
	mov	eax, DWORD PTR _newdecl$[ebp]
	push	eax
	call	_error_with_decl
	add	esp, 8
; Line 776
	jmp	$L912
$L910:
	cmp	DWORD PTR _extra_warnings, 0
	je	$L913
; Line 777
	push	OFFSET $SG914
	mov	eax, DWORD PTR _newdecl$[ebp]
	push	eax
	call	_warning_with_decl
	add	esp, 8
; Line 778
$L913:
$L912:
; Line 779
	jmp	$L915
$L909:
	cmp	DWORD PTR _types_match$[ebp], 0
	jne	$L916
; Line 781
	push	OFFSET $SG917
	mov	eax, DWORD PTR _newdecl$[ebp]
	push	eax
	call	_error_with_decl
	add	esp, 8
; Line 791
	mov	eax, DWORD PTR _olddecl$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 39					; 00000027H
	jne	$L918
	mov	eax, DWORD PTR _newdecl$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _olddecl$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_comptypes
	add	esp, 8
	or	eax, eax
	je	$L918
	mov	eax, DWORD PTR _olddecl$[ebp]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+20], 0
	jne	$L920
	mov	eax, DWORD PTR _olddecl$[ebp]
	cmp	DWORD PTR [eax+64], 0
	je	$L919
$L920:
	mov	eax, DWORD PTR _newdecl$[ebp]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+20], 0
	jne	$L918
	mov	eax, DWORD PTR _newdecl$[ebp]
	cmp	DWORD PTR [eax+64], 0
	jne	$L918
$L919:
; Line 794
	mov	eax, DWORD PTR _olddecl$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _t$921[ebp], eax
; Line 795
	cmp	DWORD PTR _t$921[ebp], 0
	jne	$L922
; Line 796
	mov	eax, DWORD PTR _newdecl$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _t$921[ebp], eax
; Line 797
$L922:
	jmp	$L923
$L924:
	mov	eax, DWORD PTR _t$921[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _t$921[ebp], eax
$L923:
	cmp	DWORD PTR _t$921[ebp], 0
	je	$L925
; Line 799
	mov	eax, DWORD PTR _t$921[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _type$926[ebp], eax
; Line 801
	mov	eax, DWORD PTR _t$921[ebp]
	cmp	DWORD PTR [eax+4], 0
	jne	$L927
	mov	eax, DWORD PTR _type$926[ebp]
	cmp	DWORD PTR _void_type_node, eax
	je	$L927
; Line 803
	push	OFFSET $SG928
	call	_error
	add	esp, 4
; Line 804
	push	OFFSET $SG929
	call	_error
	add	esp, 4
; Line 805
	jmp	$L925
; Line 808
$L927:
; Line 811
	mov	eax, DWORD PTR _type$926[ebp]
	cmp	DWORD PTR _float_type_node, eax
	je	$L931
	mov	eax, DWORD PTR _type$926[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 5
	jne	$L930
	mov	eax, DWORD PTR _type$926[ebp]
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _integer_type_node
	mov	cl, BYTE PTR [ecx+38]
	and	ecx, 255				; 000000ffH
	cmp	eax, ecx
	jge	$L930
$L931:
; Line 813
	push	OFFSET $SG932
	call	_error
	add	esp, 4
; Line 814
	push	OFFSET $SG933
	call	_error
	add	esp, 4
; Line 815
	jmp	$L925
; Line 817
$L930:
	jmp	$L924
$L925:
; Line 819
$L918:
	push	OFFSET $SG934
	mov	eax, DWORD PTR _olddecl$[ebp]
	push	eax
	call	_error_with_decl
	add	esp, 8
; Line 821
	jmp	$L935
$L916:
; Line 823
	mov	eax, DWORD PTR _olddecl$[ebp]
	push	eax
	mov	eax, DWORD PTR _newdecl$[ebp]
	push	eax
	call	_redeclaration_error_message
	add	esp, 8
	mov	DWORD PTR _errmsg$936[ebp], eax
; Line 824
	cmp	DWORD PTR _errmsg$936[ebp], 0
	je	$L937
; Line 826
	mov	eax, DWORD PTR _errmsg$936[ebp]
	push	eax
	mov	eax, DWORD PTR _newdecl$[ebp]
	push	eax
	call	_error_with_decl
	add	esp, 8
; Line 828
	push	OFFSET $SG938
	mov	eax, DWORD PTR _olddecl$[ebp]
	push	eax
	call	_error_with_decl
	add	esp, 8
; Line 830
	jmp	$L939
$L937:
; Line 833
	mov	eax, DWORD PTR _olddecl$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 39					; 00000027H
	jne	$L940
	mov	eax, DWORD PTR _olddecl$[ebp]
	cmp	DWORD PTR [eax+64], 0
	je	$L940
	mov	eax, DWORD PTR _olddecl$[ebp]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+20], 0
	jne	$L940
	mov	eax, DWORD PTR _newdecl$[ebp]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+20], 0
	je	$L940
; Line 836
	push	OFFSET $SG941
	mov	eax, DWORD PTR _newdecl$[ebp]
	push	eax
	call	_warning_with_decl
	add	esp, 8
; Line 838
	push	OFFSET $SG942
	mov	eax, DWORD PTR _olddecl$[ebp]
	push	eax
	call	_warning_with_decl
	add	esp, 8
; Line 842
$L940:
$L939:
; Line 844
	cmp	DWORD PTR _pedantic, 0
	je	$L943
	sub	eax, eax
	mov	ecx, DWORD PTR _newdecl$[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	shr	ecx, 5
	mov	edx, DWORD PTR _olddecl$[ebp]
	mov	edx, DWORD PTR [edx+16]
	shr	edx, 5
	and	edx, 1
	xor	ecx, edx
	and	ecx, 1
	cmp	eax, ecx
	jne	$L944
	sub	eax, eax
	mov	ecx, DWORD PTR _olddecl$[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	shr	ecx, 11					; 0000000bH
	mov	edx, DWORD PTR _newdecl$[ebp]
	mov	edx, DWORD PTR [edx+16]
	shr	edx, 11					; 0000000bH
	and	edx, 1
	xor	ecx, edx
	and	ecx, 1
	cmp	eax, ecx
	je	$L943
$L944:
; Line 845
	push	OFFSET $SG945
	mov	eax, DWORD PTR _newdecl$[ebp]
	push	eax
	call	_warning_with_decl
	add	esp, 8
; Line 846
$L943:
$L935:
$L915:
$L908:
; Line 847
$L906:
; Line 849
	mov	eax, DWORD PTR _olddecl$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _newdecl$[ebp]
	mov	cl, BYTE PTR [ecx+12]
	and	ecx, 255				; 000000ffH
	cmp	eax, ecx
	jne	$L946
; Line 852
	mov	eax, DWORD PTR _newdecl$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 39					; 00000027H
	jne	$L1949
	mov	eax, DWORD PTR _newdecl$[ebp]
	cmp	DWORD PTR [eax+64], 0
	je	$L1949
	mov	DWORD PTR _new_is_definition$947[ebp], 1
	jmp	$L1950
$L1949:
	mov	DWORD PTR _new_is_definition$947[ebp], 0
$L1950:
; Line 857
	cmp	DWORD PTR _types_match$[ebp], 0
	je	$L948
; Line 859
	mov	eax, DWORD PTR _olddecl$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _oldtype$949[ebp], eax
; Line 863
	mov	eax, DWORD PTR _olddecl$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _newdecl$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_commontype
	add	esp, 8
	mov	ecx, DWORD PTR _olddecl$[ebp]
	mov	DWORD PTR [ecx+8], eax
	mov	eax, DWORD PTR _olddecl$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _newdecl$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 866
	mov	eax, DWORD PTR _newdecl$[ebp]
	mov	ecx, DWORD PTR _oldtype$949[ebp]
	cmp	DWORD PTR [eax+8], ecx
	je	$L950
; Line 868
	mov	eax, DWORD PTR _newdecl$[ebp]
	mov	ecx, DWORD PTR _error_mark_node
	cmp	DWORD PTR [eax+8], ecx
	je	$L951
; Line 869
	mov	eax, DWORD PTR _newdecl$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_layout_type
	add	esp, 4
; Line 870
$L951:
; Line 872
	mov	eax, DWORD PTR _newdecl$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 39					; 00000027H
	je	$L952
	mov	eax, DWORD PTR _newdecl$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 42					; 0000002aH
	je	$L952
	mov	eax, DWORD PTR _newdecl$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 41					; 00000029H
	je	$L952
; Line 873
	push	0
	mov	eax, DWORD PTR _newdecl$[ebp]
	push	eax
	call	_layout_decl
	add	esp, 8
; Line 874
$L952:
; Line 875
	jmp	$L953
$L950:
; Line 878
	mov	eax, DWORD PTR _olddecl$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	ecx, DWORD PTR _newdecl$[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 879
	mov	eax, DWORD PTR _olddecl$[ebp]
	mov	al, BYTE PTR [eax+36]
	mov	ecx, DWORD PTR _newdecl$[ebp]
	mov	BYTE PTR [ecx+36], al
; Line 880
	mov	eax, DWORD PTR _olddecl$[ebp]
	mov	al, BYTE PTR [eax+37]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _newdecl$[ebp]
	mov	cl, BYTE PTR [ecx+37]
	and	ecx, 255				; 000000ffH
	cmp	eax, ecx
	jle	$L954
; Line 881
	mov	eax, DWORD PTR _olddecl$[ebp]
	mov	al, BYTE PTR [eax+37]
	mov	ecx, DWORD PTR _newdecl$[ebp]
	mov	BYTE PTR [ecx+37], al
; Line 882
$L954:
$L953:
; Line 885
	mov	eax, DWORD PTR _newdecl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 5
	test	al, 1
	je	$L955
; Line 886
	mov	eax, DWORD PTR _olddecl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	or	eax, 32					; 00000020H
	mov	ecx, DWORD PTR _olddecl$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 887
$L955:
	mov	eax, DWORD PTR _newdecl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 11					; 0000000bH
	test	al, 1
	je	$L956
; Line 888
	mov	eax, DWORD PTR _olddecl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	or	eax, 2048				; 00000800H
	mov	ecx, DWORD PTR _olddecl$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 891
$L956:
	mov	eax, DWORD PTR _newdecl$[ebp]
	cmp	DWORD PTR [eax+64], 0
	jne	$L957
; Line 892
	mov	eax, DWORD PTR _olddecl$[ebp]
	mov	eax, DWORD PTR [eax+64]
	mov	ecx, DWORD PTR _newdecl$[ebp]
	mov	DWORD PTR [ecx+64], eax
; Line 894
$L957:
	mov	eax, DWORD PTR _olddecl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	ecx, DWORD PTR _newdecl$[ebp]
	mov	DWORD PTR [ecx+76], eax
; Line 898
	jmp	$L958
$L948:
; Line 900
	mov	eax, DWORD PTR _newdecl$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _olddecl$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 901
	mov	eax, DWORD PTR _newdecl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 5
	and	eax, 1
	shl	eax, 5
	mov	ecx, DWORD PTR _olddecl$[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	and	ecx, -33				; ffffffdfH
	or	eax, ecx
	mov	ecx, DWORD PTR _olddecl$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 902
	mov	eax, DWORD PTR _newdecl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 11					; 0000000bH
	and	eax, 1
	shl	eax, 11					; 0000000bH
	mov	ecx, DWORD PTR _olddecl$[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	and	ecx, -2049				; fffff7ffH
	or	eax, ecx
	mov	ecx, DWORD PTR _olddecl$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 903
	mov	eax, DWORD PTR _newdecl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 3
	and	eax, 1
	shl	eax, 3
	mov	ecx, DWORD PTR _olddecl$[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	and	ecx, -9					; fffffff7H
	or	eax, ecx
	mov	ecx, DWORD PTR _olddecl$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 904
$L958:
; Line 907
	mov	eax, DWORD PTR _newdecl$[ebp]
	test	BYTE PTR [eax+16], 1
	je	$L959
; Line 909
	mov	eax, DWORD PTR _olddecl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 2
	and	eax, 1
	shl	eax, 2
	mov	ecx, DWORD PTR _newdecl$[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	and	ecx, -5					; fffffffbH
	or	eax, ecx
	mov	ecx, DWORD PTR _newdecl$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 910
	mov	eax, DWORD PTR _olddecl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	and	eax, 1
	mov	ecx, DWORD PTR _newdecl$[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	and	ecx, -2					; fffffffeH
	or	eax, ecx
	mov	ecx, DWORD PTR _newdecl$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 913
	mov	eax, DWORD PTR _newdecl$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 39					; 00000027H
	jne	$L960
; Line 915
	mov	eax, DWORD PTR _olddecl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 1
	mov	ecx, DWORD PTR _newdecl$[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	shr	ecx, 1
	and	eax, ecx
	and	eax, 1
	add	eax, eax
	mov	ecx, DWORD PTR _newdecl$[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	and	ecx, -3					; fffffffdH
	or	eax, ecx
	mov	ecx, DWORD PTR _newdecl$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 918
	mov	eax, DWORD PTR _newdecl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 1
	and	eax, 1
	add	eax, eax
	mov	ecx, DWORD PTR _olddecl$[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	and	ecx, -3					; fffffffdH
	or	eax, ecx
	mov	ecx, DWORD PTR _olddecl$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 920
	mov	eax, DWORD PTR _olddecl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 1
	test	al, 1
	jne	$L961
; Line 921
	mov	eax, DWORD PTR _olddecl$[ebp]
	mov	eax, DWORD PTR [eax+40]
	and	DWORD PTR [eax+16], -3			; fffffffdH
; Line 922
$L961:
; Line 923
	jmp	$L962
$L960:
; Line 924
	mov	eax, DWORD PTR _olddecl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 1
	and	eax, 1
	add	eax, eax
	mov	ecx, DWORD PTR _newdecl$[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	and	ecx, -3					; fffffffdH
	or	eax, ecx
	mov	ecx, DWORD PTR _newdecl$[ebp]
	mov	DWORD PTR [ecx+16], eax
$L962:
; Line 926
	jmp	$L963
$L959:
; Line 928
	mov	eax, DWORD PTR _newdecl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 2
	and	eax, 1
	shl	eax, 2
	mov	ecx, DWORD PTR _olddecl$[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	and	ecx, -5					; fffffffbH
	or	eax, ecx
	mov	ecx, DWORD PTR _olddecl$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 929
	mov	eax, DWORD PTR _olddecl$[ebp]
	and	DWORD PTR [eax+16], -2			; fffffffeH
; Line 930
	mov	eax, DWORD PTR _newdecl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 1
	and	eax, 1
	add	eax, eax
	mov	ecx, DWORD PTR _olddecl$[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	and	ecx, -3					; fffffffdH
	or	eax, ecx
	mov	ecx, DWORD PTR _olddecl$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 931
$L963:
; Line 935
	mov	eax, DWORD PTR _newdecl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 14					; 0000000eH
	test	al, 1
	je	$L964
	mov	eax, DWORD PTR _olddecl$[ebp]
	cmp	DWORD PTR [eax+64], 0
	jne	$L964
; Line 936
	mov	eax, DWORD PTR _olddecl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	or	eax, 16384				; 00004000H
	mov	ecx, DWORD PTR _olddecl$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 941
$L964:
	mov	eax, DWORD PTR _newdecl$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 39					; 00000027H
	jne	$L965
	cmp	DWORD PTR _new_is_definition$947[ebp], 0
	jne	$L965
; Line 943
	mov	eax, DWORD PTR _olddecl$[ebp]
	mov	eax, DWORD PTR [eax+48]
	mov	ecx, DWORD PTR _newdecl$[ebp]
	mov	DWORD PTR [ecx+48], eax
; Line 944
	mov	eax, DWORD PTR _olddecl$[ebp]
	mov	eax, DWORD PTR [eax+60]
	mov	ecx, DWORD PTR _newdecl$[ebp]
	mov	DWORD PTR [ecx+60], eax
; Line 945
	mov	eax, DWORD PTR _olddecl$[ebp]
	mov	eax, DWORD PTR [eax+64]
	mov	ecx, DWORD PTR _newdecl$[ebp]
	mov	DWORD PTR [ecx+64], eax
; Line 946
	mov	eax, DWORD PTR _olddecl$[ebp]
	mov	eax, DWORD PTR [eax+84]
	mov	ecx, DWORD PTR _newdecl$[ebp]
	mov	DWORD PTR [ecx+84], eax
; Line 947
	mov	eax, DWORD PTR _olddecl$[ebp]
	mov	eax, DWORD PTR [eax+52]
	mov	ecx, DWORD PTR _newdecl$[ebp]
	mov	DWORD PTR [ecx+52], eax
; Line 948
	mov	eax, DWORD PTR _olddecl$[ebp]
	mov	eax, DWORD PTR [eax+56]
	mov	ecx, DWORD PTR _newdecl$[ebp]
	mov	DWORD PTR [ecx+56], eax
; Line 949
	mov	eax, DWORD PTR _olddecl$[ebp]
	mov	eax, DWORD PTR [eax+80]
	mov	ecx, DWORD PTR _newdecl$[ebp]
	mov	DWORD PTR [ecx+80], eax
; Line 953
$L965:
; Line 954
	mov	eax, DWORD PTR _olddecl$[ebp]
	mov	eax, DWORD PTR [eax+88]
	mov	ecx, DWORD PTR _newdecl$[ebp]
	mov	DWORD PTR [ecx+88], eax
; Line 958
	push	76					; 0000004cH
	mov	eax, DWORD PTR _newdecl$[ebp]
	add	eax, 20					; 00000014H
	push	eax
	mov	eax, DWORD PTR _olddecl$[ebp]
	add	eax, 20					; 00000014H
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
; Line 960
	mov	eax, 1
	jmp	$L897
; Line 965
$L946:
	sub	eax, eax
	jmp	$L897
; Line 966
$L897:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_duplicate_decls ENDP
_TEXT	ENDS
PUBLIC	_lookup_name
PUBLIC	_pushdecl
EXTRN	_warn_shadow:DWORD
EXTRN	_warning:NEAR
EXTRN	_warning_with_file_and_line:NEAR
EXTRN	_tree_cons:NEAR
_DATA	SEGMENT
	ORG $+3
$SG976	DB	'`%s'' used prior to declaration', 00H
	ORG $+1
$SG981	DB	'`%s'' was declared implicitly `extern'' and later `stati'
	DB	'c''', 00H
	ORG $+3
$SG983	DB	'previous declaration of `%s''', 00H
	ORG $+3
$SG989	DB	'type mismatch with previous external decl', 00H
	ORG $+2
$SG990	DB	'previous external decl of `%s''', 00H
	ORG $+1
$SG997	DB	'Type of `extern'' decl is not global', 00H
$SG1007	DB	'`%s'' was previously implicitly declared to return `int'''
	DB	00H
$SG1010	DB	'`%s'' was declared implicitly `extern'' and later `stati'
	DB	'c''', 00H
	ORG $+3
$SG1012	DB	'`%s'' was declared `extern'' and later `static''', 00H
	ORG $+2
$SG1018	DB	'local declaration of `%s'' doesn''t match global one', 00H
	ORG $+1
$SG1024	DB	'declaration of `%s'' shadows a parameter', 00H
$SG1029	DB	'declaration of `%s'' shadows a parameter', 00H
$SG1032	DB	'declaration of `%s'' shadows previous local', 00H
	ORG $+1
$SG1035	DB	'declaration of `%s'' shadows global declaration', 00H
_DATA	ENDS
_TEXT	SEGMENT
_warnstring$1027 = -36
_x$ = 8
_t$ = -4
_name$ = -8
_b$ = -12
_file$973 = -20
_line$974 = -16
_type$992 = -24
_oldlocal$1014 = -32
_oldglobal$1015 = -28
_pushdecl PROC NEAR
; Line 979
	push	ebp
	mov	ebp, esp
	sub	esp, 36					; 00000024H
	push	ebx
	push	esi
	push	edi
; Line 981
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+40]
	mov	DWORD PTR _name$[ebp], eax
; Line 982
	mov	eax, DWORD PTR _current_binding_level$S719
	mov	DWORD PTR _b$[ebp], eax
; Line 984
	cmp	DWORD PTR _name$[ebp], 0
	je	$L972
; Line 989
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_lookup_name_current_level
	add	esp, 4
	mov	DWORD PTR _t$[ebp], eax
; Line 990
	cmp	DWORD PTR _t$[ebp], 0
	je	$L975
	mov	eax, DWORD PTR _t$[ebp]
	cmp	DWORD PTR _error_mark_node, eax
	jne	$L975
; Line 993
	mov	DWORD PTR _t$[ebp], 0
; Line 994
	push	OFFSET $SG976
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_error_with_decl
	add	esp, 8
; Line 997
$L975:
	cmp	DWORD PTR _t$[ebp], 0
	je	$L977
; Line 999
	mov	eax, DWORD PTR _t$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _file$973[ebp], eax
; Line 1000
	mov	eax, DWORD PTR _t$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _line$974[ebp], eax
; Line 1003
$L977:
	cmp	DWORD PTR _t$[ebp], 0
	je	$L978
	mov	eax, DWORD PTR _t$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_duplicate_decls
	add	esp, 8
	or	eax, eax
	je	$L978
; Line 1012
	cmp	DWORD PTR _flag_traditional, 0
	jne	$L979
	mov	eax, DWORD PTR _name$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 1
	test	al, 1
	je	$L979
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 1
	test	al, 1
	jne	$L979
	mov	eax, DWORD PTR _x$[ebp]
	test	BYTE PTR [eax+16], 1
	jne	$L979
	mov	eax, DWORD PTR _name$[ebp]
	cmp	DWORD PTR [eax+40], 0
	je	$L979
; Line 1015
	mov	eax, DWORD PTR _name$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	OFFSET $SG981
	call	_warning
	add	esp, 8
; Line 1018
	mov	eax, DWORD PTR _name$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	OFFSET $SG983
	mov	eax, DWORD PTR _line$974[ebp]
	push	eax
	mov	eax, DWORD PTR _file$973[ebp]
	push	eax
	call	_warning_with_file_and_line
	add	esp, 16					; 00000010H
; Line 1020
$L979:
	mov	eax, DWORD PTR _t$[ebp]
	jmp	$L968
; Line 1025
$L978:
	mov	eax, DWORD PTR _x$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 42					; 0000002aH
	jne	$L984
; Line 1026
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+56], 0
	jne	$L985
; Line 1027
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	mov	DWORD PTR [ecx+56], eax
; Line 1031
$L985:
$L984:
; Line 1033
	mov	eax, DWORD PTR _x$[ebp]
	test	BYTE PTR [eax+16], 1
	je	$L986
	mov	eax, DWORD PTR _name$[ebp]
	cmp	DWORD PTR [eax+28], 0
	je	$L986
	mov	eax, DWORD PTR _name$[ebp]
	mov	eax, DWORD PTR [eax+28]
	test	BYTE PTR [eax+16], 1
	jne	$L987
	mov	eax, DWORD PTR _name$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 1
	test	al, 1
	je	$L986
$L987:
; Line 1036
	mov	eax, DWORD PTR _name$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_comptypes
	add	esp, 8
	or	eax, eax
	jne	$L988
; Line 1039
	push	OFFSET $SG989
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_warning_with_decl
	add	esp, 8
; Line 1041
	push	OFFSET $SG990
	mov	eax, DWORD PTR _name$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	call	_warning_with_decl
	add	esp, 8
; Line 1043
$L988:
; Line 1047
$L986:
; Line 1048
	cmp	DWORD PTR _flag_traditional, 0
	je	$L991
	mov	eax, DWORD PTR _x$[ebp]
	test	BYTE PTR [eax+16], 1
	je	$L991
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_lookup_name
	add	esp, 4
	or	eax, eax
	jne	$L991
; Line 1050
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _type$992[ebp], eax
; Line 1053
$L994:
	cmp	DWORD PTR _type$992[ebp], 0
	je	$L995
; Line 1055
	mov	eax, DWORD PTR _type$992[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 8
	test	al, 1
	jne	$L996
; Line 1057
	push	OFFSET $SG997
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_warning_with_decl
	add	esp, 8
; Line 1058
	jmp	$L995
; Line 1060
	jmp	$L998
$L996:
; Line 1061
	mov	eax, DWORD PTR _type$992[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 21					; 00000015H
	jne	$L999
	mov	eax, DWORD PTR _type$992[ebp]
	cmp	DWORD PTR [eax+20], 0
	je	$L999
; Line 1066
	jmp	$L995
; Line 1067
$L999:
$L998:
	mov	eax, DWORD PTR _type$992[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _type$992[ebp], eax
; Line 1068
	jmp	$L994
$L995:
; Line 1070
	cmp	DWORD PTR _type$992[ebp], 0
	jne	$L1000
; Line 1071
	mov	eax, DWORD PTR _global_binding_level$S721
	mov	DWORD PTR _b$[ebp], eax
; Line 1072
$L1000:
; Line 1076
$L991:
	mov	eax, DWORD PTR _global_binding_level$S721
	cmp	DWORD PTR _b$[ebp], eax
	jne	$L1001
; Line 1082
	mov	eax, DWORD PTR _name$[ebp]
	cmp	DWORD PTR [eax+28], 0
	jne	$L1002
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 1
	test	al, 1
	je	$L1002
; Line 1083
	mov	eax, DWORD PTR _name$[ebp]
	mov	eax, DWORD PTR [eax+16]
	or	eax, 2
	mov	ecx, DWORD PTR _name$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 1085
$L1002:
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR _name$[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 1089
	mov	eax, DWORD PTR _name$[ebp]
	cmp	DWORD PTR [eax+40], 0
	je	$L1003
	mov	eax, DWORD PTR _name$[ebp]
	mov	eax, DWORD PTR [eax+40]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 15					; 0000000fH
	test	al, 1
	je	$L1003
; Line 1090
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+16]
	or	eax, 32768				; 00008000H
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [ecx+16], eax
	mov	eax, DWORD PTR _name$[ebp]
	mov	eax, DWORD PTR [eax+16]
	or	eax, 32768				; 00008000H
	mov	ecx, DWORD PTR _name$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 1093
$L1003:
; Line 1094
	mov	eax, DWORD PTR _name$[ebp]
	cmp	DWORD PTR [eax+40], 0
	je	$L1004
	mov	eax, DWORD PTR _name$[ebp]
	mov	eax, DWORD PTR [eax+40]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 9
	test	al, 1
	je	$L1004
; Line 1095
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+16]
	or	eax, 512				; 00000200H
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 1098
$L1004:
; Line 1101
	mov	eax, DWORD PTR _name$[ebp]
	cmp	DWORD PTR [eax+40], 0
	je	$L1005
	mov	eax, DWORD PTR _x$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 39					; 00000027H
	jne	$L1006
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _integer_type_node
	cmp	DWORD PTR [eax+8], ecx
	je	$L1005
$L1006:
; Line 1103
	mov	eax, DWORD PTR _name$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	OFFSET $SG1007
	call	_warning
	add	esp, 8
; Line 1107
$L1005:
; Line 1108
	mov	eax, DWORD PTR _name$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 1
	test	al, 1
	je	$L1008
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 1
	test	al, 1
	jne	$L1008
	mov	eax, DWORD PTR _x$[ebp]
	test	BYTE PTR [eax+16], 1
	jne	$L1008
; Line 1110
	mov	eax, DWORD PTR _name$[ebp]
	cmp	DWORD PTR [eax+40], 0
	je	$L1009
; Line 1112
	mov	eax, DWORD PTR _name$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	OFFSET $SG1010
	call	_warning
	add	esp, 8
; Line 1113
	jmp	$L1011
$L1009:
; Line 1115
	mov	eax, DWORD PTR _name$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	OFFSET $SG1012
	call	_warning
	add	esp, 8
$L1011:
; Line 1117
$L1008:
; Line 1118
	jmp	$L1013
$L1001:
; Line 1121
	mov	eax, DWORD PTR _name$[ebp]
	mov	eax, DWORD PTR [eax+32]
	mov	DWORD PTR _oldlocal$1014[ebp], eax
; Line 1122
	mov	eax, DWORD PTR _name$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR _oldglobal$1015[ebp], eax
; Line 1123
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR _name$[ebp]
	mov	DWORD PTR [ecx+32], eax
; Line 1130
	cmp	DWORD PTR _oldlocal$1014[ebp], 0
	jne	$L1016
	cmp	DWORD PTR _oldglobal$1015[ebp], 0
	je	$L1016
	mov	eax, DWORD PTR _x$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 39					; 00000027H
	jne	$L1016
	mov	eax, DWORD PTR _oldglobal$1015[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 39					; 00000027H
	jne	$L1016
; Line 1134
	mov	eax, DWORD PTR _name$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_comptypes
	add	esp, 8
	or	eax, eax
	jne	$L1017
; Line 1135
	push	OFFSET $SG1018
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_warning_with_decl
	add	esp, 8
; Line 1137
	jmp	$L1019
$L1017:
; Line 1140
	mov	eax, DWORD PTR _oldglobal$1015[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 14					; 0000000eH
	test	al, 1
	jne	$L1021
	mov	eax, DWORD PTR _oldglobal$1015[ebp]
	cmp	DWORD PTR [eax+48], 0
	jne	$L1021
	mov	eax, DWORD PTR _oldglobal$1015[ebp]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+20], 0
	je	$L1020
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+20], 0
	jne	$L1020
$L1021:
; Line 1141
	mov	eax, DWORD PTR _oldglobal$1015[ebp]
	mov	ecx, DWORD PTR _name$[ebp]
	mov	DWORD PTR [ecx+32], eax
; Line 1142
$L1020:
$L1019:
; Line 1146
$L1016:
; Line 1149
	cmp	DWORD PTR _oldlocal$1014[ebp], 0
	jne	$L1022
	cmp	DWORD PTR _oldglobal$1015[ebp], 0
	jne	$L1022
	mov	eax, DWORD PTR _x$[ebp]
	test	BYTE PTR [eax+16], 1
	je	$L1022
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 1
	test	al, 1
	je	$L1022
; Line 1151
	mov	eax, DWORD PTR _name$[ebp]
	mov	eax, DWORD PTR [eax+16]
	or	eax, 2
	mov	ecx, DWORD PTR _name$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 1155
$L1022:
; Line 1158
	cmp	DWORD PTR _oldlocal$1014[ebp], 0
	je	$L1023
	mov	eax, DWORD PTR _x$[ebp]
	test	BYTE PTR [eax+16], 1
	jne	$L1023
	mov	eax, DWORD PTR _oldlocal$1014[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 44					; 0000002cH
	jne	$L1023
	mov	eax, DWORD PTR _x$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 44					; 0000002cH
	je	$L1023
	mov	eax, DWORD PTR _current_binding_level$S719
	mov	eax, DWORD PTR [eax+16]
	movsx	eax, BYTE PTR [eax+20]
	or	eax, eax
	je	$L1023
; Line 1160
	mov	eax, DWORD PTR _name$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	OFFSET $SG1024
	call	_warning
	add	esp, 8
; Line 1163
	jmp	$L1025
$L1023:
; Line 1165
	cmp	DWORD PTR _warn_shadow, 0
	je	$L1026
	mov	eax, DWORD PTR _x$[ebp]
	test	BYTE PTR [eax+16], 1
	jne	$L1026
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 14					; 0000000eH
	test	al, 1
	jne	$L1026
; Line 1167
	mov	DWORD PTR _warnstring$1027[ebp], 0
; Line 1169
	cmp	DWORD PTR _oldlocal$1014[ebp], 0
	je	$L1028
	mov	eax, DWORD PTR _oldlocal$1014[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 44					; 0000002cH
	jne	$L1028
; Line 1170
	mov	DWORD PTR _warnstring$1027[ebp], OFFSET $SG1029
; Line 1171
	jmp	$L1030
$L1028:
	cmp	DWORD PTR _oldlocal$1014[ebp], 0
	je	$L1031
; Line 1172
	mov	DWORD PTR _warnstring$1027[ebp], OFFSET $SG1032
; Line 1173
	jmp	$L1033
$L1031:
	mov	eax, DWORD PTR _name$[ebp]
	cmp	DWORD PTR [eax+28], 0
	je	$L1034
; Line 1174
	mov	DWORD PTR _warnstring$1027[ebp], OFFSET $SG1035
; Line 1176
$L1034:
$L1033:
$L1030:
	cmp	DWORD PTR _warnstring$1027[ebp], 0
	je	$L1036
; Line 1177
	mov	eax, DWORD PTR _name$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	mov	eax, DWORD PTR _warnstring$1027[ebp]
	push	eax
	call	_warning
	add	esp, 8
; Line 1178
$L1036:
; Line 1182
$L1026:
$L1025:
	cmp	DWORD PTR _oldlocal$1014[ebp], 0
	je	$L1037
; Line 1183
	mov	eax, DWORD PTR _b$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _oldlocal$1014[ebp]
	push	eax
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_tree_cons
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _b$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 1184
$L1037:
$L1013:
; Line 1187
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+28], 0
	jne	$L1038
; Line 1188
	mov	eax, DWORD PTR _b$[ebp]
	inc	DWORD PTR [eax+24]
; Line 1189
$L1038:
; Line 1193
$L972:
	mov	eax, DWORD PTR _b$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 1194
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR _b$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 1196
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L968
; Line 1197
$L968:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_pushdecl ENDP
_TEXT	ENDS
PUBLIC	_implicitly_declare
EXTRN	_end_temporary_allocation:NEAR
EXTRN	_rest_of_decl_compilation:NEAR
EXTRN	_resume_temporary_allocation:NEAR
EXTRN	_build_decl:NEAR
_DATA	SEGMENT
	ORG $+1
$SG1045	DB	'implicit declaration of function `%s''', 00H
_DATA	ENDS
_TEXT	SEGMENT
_functionid$ = 8
_decl$ = -4
_implicitly_declare PROC NEAR
; Line 1205
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 1214
	call	_end_temporary_allocation
; Line 1222
	mov	eax, DWORD PTR _default_function_type
	push	eax
	mov	eax, DWORD PTR _functionid$[ebp]
	push	eax
	push	39					; 00000027H
	call	_build_decl
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _decl$[ebp], eax
; Line 1224
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	or	eax, 1
	mov	ecx, DWORD PTR _decl$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 1225
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	or	eax, 2
	mov	ecx, DWORD PTR _decl$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 1230
	mov	eax, DWORD PTR _decl$[ebp]
	push	eax
	call	_pushdecl
	add	esp, 4
; Line 1231
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _decl$[ebp]
	push	eax
	call	_rest_of_decl_compilation
	add	esp, 16					; 00000010H
; Line 1235
	cmp	DWORD PTR _warn_implicit, 0
	je	$L1044
	mov	eax, DWORD PTR _functionid$[ebp]
	cmp	DWORD PTR [eax+40], 0
	jne	$L1044
; Line 1237
	mov	eax, DWORD PTR _functionid$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	OFFSET $SG1045
	call	_warning
	add	esp, 8
; Line 1239
$L1044:
	mov	eax, DWORD PTR _decl$[ebp]
	mov	ecx, DWORD PTR _functionid$[ebp]
	mov	DWORD PTR [ecx+40], eax
; Line 1245
	call	_resume_temporary_allocation
; Line 1247
	mov	eax, DWORD PTR _decl$[ebp]
	jmp	$L1040
; Line 1248
$L1040:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_implicitly_declare ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+2
$SG1052	DB	'redefinition of `%s''', 00H
	ORG $+3
$SG1057	DB	'redefinition of `%s''', 00H
	ORG $+3
$SG1063	DB	'redefinition of `%s''', 00H
	ORG $+3
$SG1065	DB	'conflicting declarations of `%s''', 00H
	ORG $+3
$SG1069	DB	'redeclaration of `%s''', 00H
_DATA	ENDS
_TEXT	SEGMENT
_newdecl$ = 8
_olddecl$ = 12
_redeclaration_error_message PROC NEAR
; Line 1259
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1260
	mov	eax, DWORD PTR _newdecl$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 42					; 0000002aH
	jne	$L1050
; Line 1262
	cmp	DWORD PTR _flag_traditional, 0
	je	$L1051
	mov	eax, DWORD PTR _olddecl$[ebp]
	mov	ecx, DWORD PTR _newdecl$[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	cmp	DWORD PTR [eax+8], ecx
	jne	$L1051
; Line 1263
	sub	eax, eax
	jmp	$L1049
; Line 1264
$L1051:
	mov	eax, OFFSET $SG1052
	jmp	$L1049
; Line 1266
	jmp	$L1053
$L1050:
	mov	eax, DWORD PTR _newdecl$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 39					; 00000027H
	jne	$L1054
; Line 1276
	mov	eax, DWORD PTR _olddecl$[ebp]
	cmp	DWORD PTR [eax+64], 0
	je	$L1055
	mov	eax, DWORD PTR _newdecl$[ebp]
	cmp	DWORD PTR [eax+64], 0
	je	$L1055
	mov	eax, DWORD PTR _olddecl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 14					; 0000000eH
	test	al, 1
	je	$L1056
	mov	eax, DWORD PTR _olddecl$[ebp]
	test	BYTE PTR [eax+16], 1
	je	$L1056
	mov	eax, DWORD PTR _newdecl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 14					; 0000000eH
	test	al, 1
	je	$L1055
	mov	eax, DWORD PTR _newdecl$[ebp]
	test	BYTE PTR [eax+16], 1
	je	$L1055
$L1056:
; Line 1277
	mov	eax, OFFSET $SG1057
	jmp	$L1049
; Line 1278
$L1055:
	sub	eax, eax
	jmp	$L1049
; Line 1280
	jmp	$L1058
$L1054:
	mov	eax, DWORD PTR _current_binding_level$S719
	cmp	DWORD PTR _global_binding_level$S721, eax
	jne	$L1059
; Line 1284
	mov	eax, DWORD PTR _newdecl$[ebp]
	test	BYTE PTR [eax+16], 1
	jne	$L1061
	mov	eax, DWORD PTR _olddecl$[ebp]
	test	BYTE PTR [eax+16], 1
	je	$L1060
$L1061:
; Line 1285
	sub	eax, eax
	jmp	$L1049
; Line 1287
$L1060:
	mov	eax, DWORD PTR _olddecl$[ebp]
	cmp	DWORD PTR [eax+64], 0
	je	$L1062
	mov	eax, DWORD PTR _newdecl$[ebp]
	cmp	DWORD PTR [eax+64], 0
	je	$L1062
; Line 1288
	mov	eax, OFFSET $SG1063
	jmp	$L1049
; Line 1291
$L1062:
	sub	eax, eax
	mov	ecx, DWORD PTR _olddecl$[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	shr	ecx, 1
	mov	edx, DWORD PTR _newdecl$[ebp]
	mov	edx, DWORD PTR [edx+16]
	shr	edx, 1
	and	edx, 1
	xor	ecx, edx
	and	ecx, 1
	cmp	eax, ecx
	je	$L1064
; Line 1292
	mov	eax, OFFSET $SG1065
	jmp	$L1049
; Line 1293
$L1064:
	sub	eax, eax
	jmp	$L1049
; Line 1295
	jmp	$L1066
$L1059:
; Line 1300
	mov	eax, DWORD PTR _newdecl$[ebp]
	test	BYTE PTR [eax+16], 1
	je	$L1068
	mov	eax, DWORD PTR _olddecl$[ebp]
	test	BYTE PTR [eax+16], 1
	jne	$L1067
$L1068:
; Line 1301
	mov	eax, OFFSET $SG1069
	jmp	$L1049
; Line 1302
$L1067:
	sub	eax, eax
	jmp	$L1049
; Line 1303
$L1066:
$L1058:
$L1053:
; Line 1304
$L1049:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_redeclaration_error_message ENDP
_TEXT	ENDS
PUBLIC	_lookup_label
_TEXT	SEGMENT
_id$ = 8
_decl$ = -4
_lookup_label PROC NEAR
; Line 1313
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 1314
	mov	eax, DWORD PTR _id$[ebp]
	mov	eax, DWORD PTR [eax+36]
	mov	DWORD PTR _decl$[ebp], eax
; Line 1316
	cmp	DWORD PTR _decl$[ebp], 0
	je	$L1073
; Line 1317
	mov	eax, DWORD PTR _decl$[ebp]
	jmp	$L1071
; Line 1319
$L1073:
	push	0
	mov	eax, DWORD PTR _id$[ebp]
	push	eax
	push	40					; 00000028H
	call	_build_decl
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _decl$[ebp], eax
; Line 1320
	mov	eax, DWORD PTR _decl$[ebp]
	and	DWORD PTR [eax+32], -256		; ffffff00H
; Line 1322
	mov	eax, DWORD PTR _decl$[ebp]
	mov	DWORD PTR [eax+24], 0
; Line 1324
	mov	eax, DWORD PTR _decl$[ebp]
	mov	ecx, DWORD PTR _id$[ebp]
	mov	DWORD PTR [ecx+36], eax
; Line 1327
	mov	eax, DWORD PTR _named_labels$S715
	push	eax
	mov	eax, DWORD PTR _decl$[ebp]
	push	eax
	push	0
	call	_tree_cons
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _named_labels$S715, eax
; Line 1329
	mov	eax, DWORD PTR _decl$[ebp]
	jmp	$L1071
; Line 1330
$L1071:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_lookup_label ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+2
$SG1080	DB	'duplicate label `%s''', 00H
_DATA	ENDS
_TEXT	SEGMENT
_filename$ = 8
_line$ = 12
_name$ = 16
_decl$ = -4
_define_label PROC NEAR
; Line 1341
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 1342
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_lookup_label
	add	esp, 4
	mov	DWORD PTR _decl$[ebp], eax
; Line 1343
	mov	eax, DWORD PTR _decl$[ebp]
	cmp	DWORD PTR [eax+24], 0
	je	$L1079
; Line 1345
	push	OFFSET $SG1080
	mov	eax, DWORD PTR _decl$[ebp]
	push	eax
	call	_error_with_decl
	add	esp, 8
; Line 1346
	sub	eax, eax
	jmp	$L1077
; Line 1348
	jmp	$L1081
$L1079:
; Line 1351
	mov	eax, DWORD PTR _filename$[ebp]
	mov	ecx, DWORD PTR _decl$[ebp]
	mov	DWORD PTR [ecx+20], eax
; Line 1352
	mov	eax, DWORD PTR _line$[ebp]
	mov	ecx, DWORD PTR _decl$[ebp]
	mov	DWORD PTR [ecx+24], eax
; Line 1353
	mov	eax, DWORD PTR _decl$[ebp]
	jmp	$L1077
; Line 1354
$L1081:
; Line 1355
$L1077:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_define_label ENDP
_TEXT	ENDS
PUBLIC	_getdecls
_TEXT	SEGMENT
_getdecls PROC NEAR
; Line 1364
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1365
	mov	eax, DWORD PTR _current_binding_level$S719
	mov	eax, DWORD PTR [eax]
	jmp	$L1082
; Line 1366
$L1082:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_getdecls ENDP
_TEXT	ENDS
PUBLIC	_gettags
_TEXT	SEGMENT
_gettags PROC NEAR
; Line 1372
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1373
	mov	eax, DWORD PTR _current_binding_level$S719
	mov	eax, DWORD PTR [eax+4]
	jmp	$L1083
; Line 1374
$L1083:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gettags ENDP
_decls$ = 8
_storedecls PROC NEAR
; Line 1383
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1384
	mov	eax, DWORD PTR _decls$[ebp]
	mov	ecx, DWORD PTR _current_binding_level$S719
	mov	DWORD PTR [ecx], eax
; Line 1385
$L1086:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_storedecls ENDP
_tags$ = 8
_storetags PROC NEAR
; Line 1392
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1393
	mov	eax, DWORD PTR _tags$[ebp]
	mov	ecx, DWORD PTR _current_binding_level$S719
	mov	DWORD PTR [ecx+4], eax
; Line 1394
$L1089:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_storetags ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+3
$SG1105	DB	'`%s'' defined as wrong kind of tag', 00H
_DATA	ENDS
_TEXT	SEGMENT
_form$ = 8
_name$ = 12
_binding_level$ = 16
_thislevel_only$ = 20
_level$ = -4
_tail$1099 = -8
_lookup_tag PROC NEAR
; Line 1412
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 1415
	mov	eax, DWORD PTR _binding_level$[ebp]
	mov	DWORD PTR _level$[ebp], eax
	jmp	$L1096
$L1097:
	mov	eax, DWORD PTR _level$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _level$[ebp], eax
$L1096:
	cmp	DWORD PTR _level$[ebp], 0
	je	$L1098
; Line 1418
	mov	eax, DWORD PTR _level$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _tail$1099[ebp], eax
	jmp	$L1100
$L1101:
	mov	eax, DWORD PTR _tail$1099[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _tail$1099[ebp], eax
$L1100:
	cmp	DWORD PTR _tail$1099[ebp], 0
	je	$L1102
; Line 1420
	mov	eax, DWORD PTR _tail$1099[ebp]
	mov	ecx, DWORD PTR _name$[ebp]
	cmp	DWORD PTR [eax+20], ecx
	jne	$L1103
; Line 1422
	mov	eax, DWORD PTR _tail$1099[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, DWORD PTR _form$[ebp]
	je	$L1104
; Line 1426
	mov	eax, DWORD PTR _name$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	OFFSET $SG1105
	call	_error
	add	esp, 8
; Line 1428
$L1104:
	mov	eax, DWORD PTR _tail$1099[ebp]
	mov	eax, DWORD PTR [eax+24]
	jmp	$L1094
; Line 1430
$L1103:
	jmp	$L1101
$L1102:
; Line 1431
	cmp	DWORD PTR _thislevel_only$[ebp], 0
	je	$L1106
	mov	eax, DWORD PTR _level$[ebp]
	movsx	eax, BYTE PTR [eax+21]
	or	eax, eax
	jne	$L1106
; Line 1432
	sub	eax, eax
	jmp	$L1094
; Line 1433
$L1106:
	jmp	$L1097
$L1098:
; Line 1434
	sub	eax, eax
	jmp	$L1094
; Line 1435
$L1094:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_lookup_tag ENDP
_type$ = 8
_level$ = -4
_tail$1113 = -8
_lookup_tag_reverse PROC NEAR
; Line 1444
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 1447
	mov	eax, DWORD PTR _current_binding_level$S719
	mov	DWORD PTR _level$[ebp], eax
	jmp	$L1110
$L1111:
	mov	eax, DWORD PTR _level$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _level$[ebp], eax
$L1110:
	cmp	DWORD PTR _level$[ebp], 0
	je	$L1112
; Line 1450
	mov	eax, DWORD PTR _level$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _tail$1113[ebp], eax
	jmp	$L1114
$L1115:
	mov	eax, DWORD PTR _tail$1113[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _tail$1113[ebp], eax
$L1114:
	cmp	DWORD PTR _tail$1113[ebp], 0
	je	$L1116
; Line 1452
	mov	eax, DWORD PTR _tail$1113[ebp]
	mov	ecx, DWORD PTR _type$[ebp]
	cmp	DWORD PTR [eax+24], ecx
	jne	$L1117
; Line 1453
	mov	eax, DWORD PTR _tail$1113[ebp]
	mov	eax, DWORD PTR [eax+20]
	jmp	$L1108
; Line 1454
$L1117:
	jmp	$L1115
$L1116:
; Line 1455
	jmp	$L1111
$L1112:
; Line 1456
	sub	eax, eax
	jmp	$L1108
; Line 1457
$L1108:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_lookup_tag_reverse ENDP
_name$ = 8
_val$ = -4
_lookup_name PROC NEAR
; Line 1467
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 1470
	mov	eax, DWORD PTR _current_binding_level$S719
	cmp	DWORD PTR _global_binding_level$S721, eax
	je	$L1121
	mov	eax, DWORD PTR _name$[ebp]
	cmp	DWORD PTR [eax+32], 0
	je	$L1121
; Line 1471
	mov	eax, DWORD PTR _name$[ebp]
	mov	eax, DWORD PTR [eax+32]
	mov	DWORD PTR _val$[ebp], eax
; Line 1472
	jmp	$L1122
$L1121:
; Line 1473
	mov	eax, DWORD PTR _name$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR _val$[ebp], eax
$L1122:
; Line 1474
	cmp	DWORD PTR _val$[ebp], 0
	je	$L1123
	mov	eax, DWORD PTR _val$[ebp]
	mov	ecx, DWORD PTR _error_mark_node
	cmp	DWORD PTR [eax+8], ecx
	jne	$L1123
; Line 1475
	mov	eax, DWORD PTR _error_mark_node
	jmp	$L1119
; Line 1476
$L1123:
	mov	eax, DWORD PTR _val$[ebp]
	jmp	$L1119
; Line 1477
$L1119:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_lookup_name ENDP
_name$ = 8
_t$ = -4
_lookup_name_current_level PROC NEAR
; Line 1484
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 1487
	mov	eax, DWORD PTR _current_binding_level$S719
	cmp	DWORD PTR _global_binding_level$S721, eax
	jne	$L1127
; Line 1488
	mov	eax, DWORD PTR _name$[ebp]
	mov	eax, DWORD PTR [eax+28]
	jmp	$L1125
; Line 1490
$L1127:
	mov	eax, DWORD PTR _name$[ebp]
	cmp	DWORD PTR [eax+32], 0
	jne	$L1128
; Line 1491
	sub	eax, eax
	jmp	$L1125
; Line 1493
$L1128:
	mov	eax, DWORD PTR _current_binding_level$S719
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _t$[ebp], eax
	jmp	$L1129
$L1130:
	mov	eax, DWORD PTR _t$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _t$[ebp], eax
$L1129:
	cmp	DWORD PTR _t$[ebp], 0
	je	$L1131
; Line 1494
	mov	eax, DWORD PTR _t$[ebp]
	mov	ecx, DWORD PTR _name$[ebp]
	cmp	DWORD PTR [eax+40], ecx
	jne	$L1132
; Line 1495
	jmp	$L1131
; Line 1497
$L1132:
	jmp	$L1130
$L1131:
	mov	eax, DWORD PTR _t$[ebp]
	jmp	$L1125
; Line 1498
$L1125:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_lookup_name_current_level ENDP
_TEXT	ENDS
PUBLIC	_init_decl_processing
EXTRN	_start_identifier_warnings:NEAR
EXTRN	_make_node:NEAR
EXTRN	_get_identifier:NEAR
EXTRN	_size_zero_node:DWORD
EXTRN	_build_int_2:NEAR
EXTRN	_size_one_node:DWORD
EXTRN	_make_signed_type:NEAR
EXTRN	_make_unsigned_type:NEAR
EXTRN	_build_pointer_type:NEAR
EXTRN	_build_array_type:NEAR
EXTRN	_ridpointers:BYTE
EXTRN	_build_function_type:NEAR
EXTRN	_set_identifier_size:NEAR
EXTRN	_sizetype:DWORD
_DATA	SEGMENT
	ORG $+2
$SG1137	DB	'<value>', 00H
$SG1138	DB	'char', 00H
	ORG $+3
$SG1139	DB	'long int', 00H
	ORG $+3
$SG1140	DB	'unsigned int', 00H
	ORG $+3
$SG1141	DB	'long unsigned int', 00H
	ORG $+2
$SG1144	DB	'short int', 00H
	ORG $+2
$SG1145	DB	'long long int', 00H
	ORG $+2
$SG1146	DB	'short unsigned int', 00H
	ORG $+1
$SG1147	DB	'long long unsigned int', 00H
	ORG $+1
$SG1148	DB	'signed char', 00H
$SG1149	DB	'unsigned char', 00H
	ORG $+2
$SG1150	DB	'long double', 00H
$SG1151	DB	'__builtin_alloca', 00H
	ORG $+3
$SG1152	DB	'__builtin_abs', 00H
	ORG $+2
$SG1153	DB	'__builtin_fabs', 00H
	ORG $+1
$SG1154	DB	'__builtin_labs', 00H
	ORG $+1
$SG1155	DB	'__builtin_ffs', 00H
	ORG $+2
$SG1156	DB	'__builtin_saveregs', 00H
	ORG $+1
$SG1157	DB	'__builtin_classify_type', 00H
$SG1158	DB	'__builtin_next_arg', 00H
_DATA	ENDS
_TEXT	SEGMENT
_endlink$ = -4
_init_decl_processing PROC NEAR
; Line 1507
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 1511
	push	48					; 00000030H
	call	_set_identifier_size
	add	esp, 4
; Line 1513
	mov	DWORD PTR _current_function_decl, 0
; Line 1514
	mov	DWORD PTR _named_labels$S715, 0
; Line 1515
	mov	DWORD PTR _current_binding_level$S719, 0
; Line 1516
	mov	DWORD PTR _free_binding_level$S720, 0
; Line 1517
	push	0
	call	_pushlevel
	add	esp, 4
; Line 1518
	mov	eax, DWORD PTR _current_binding_level$S719
	mov	DWORD PTR _global_binding_level$S721, eax
; Line 1520
	push	OFFSET $SG1137
	call	_get_identifier
	add	esp, 4
	mov	DWORD PTR _value_identifier, eax
; Line 1524
	push	32					; 00000020H
	call	_make_signed_type
	add	esp, 4
	mov	DWORD PTR _integer_type_node, eax
; Line 1526
	mov	eax, DWORD PTR _integer_type_node
	push	eax
	mov	eax, DWORD PTR _ridpointers+4
	push	eax
	push	42					; 0000002aH
	call	_build_decl
	add	esp, 12					; 0000000cH
	push	eax
	call	_pushdecl
	add	esp, 4
; Line 1534
	cmp	DWORD PTR _flag_signed_char, 0
	je	$L1951
	push	8
	call	_make_signed_type
	add	esp, 4
	mov	DWORD PTR _char_type_node, eax
	jmp	$L1952
$L1951:
	push	8
	call	_make_unsigned_type
	add	esp, 4
	mov	DWORD PTR _char_type_node, eax
$L1952:
; Line 1536
	mov	eax, DWORD PTR _char_type_node
	push	eax
	push	OFFSET $SG1138
	call	_get_identifier
	add	esp, 4
	push	eax
	push	42					; 0000002aH
	call	_build_decl
	add	esp, 12					; 0000000cH
	push	eax
	call	_pushdecl
	add	esp, 4
; Line 1538
	push	32					; 00000020H
	call	_make_signed_type
	add	esp, 4
	mov	DWORD PTR _long_integer_type_node, eax
; Line 1540
	mov	eax, DWORD PTR _long_integer_type_node
	push	eax
	push	OFFSET $SG1139
	call	_get_identifier
	add	esp, 4
	push	eax
	push	42					; 0000002aH
	call	_build_decl
	add	esp, 12					; 0000000cH
	push	eax
	call	_pushdecl
	add	esp, 4
; Line 1542
	push	32					; 00000020H
	call	_make_unsigned_type
	add	esp, 4
	mov	DWORD PTR _unsigned_type_node, eax
; Line 1544
	mov	eax, DWORD PTR _unsigned_type_node
	push	eax
	push	OFFSET $SG1140
	call	_get_identifier
	add	esp, 4
	push	eax
	push	42					; 0000002aH
	call	_build_decl
	add	esp, 12					; 0000000cH
	push	eax
	call	_pushdecl
	add	esp, 4
; Line 1546
	push	32					; 00000020H
	call	_make_unsigned_type
	add	esp, 4
	mov	DWORD PTR _long_unsigned_type_node, eax
; Line 1548
	mov	eax, DWORD PTR _long_unsigned_type_node
	push	eax
	push	OFFSET $SG1141
	call	_get_identifier
	add	esp, 4
	push	eax
	push	42					; 0000002aH
	call	_build_decl
	add	esp, 12					; 0000000cH
	push	eax
	call	_pushdecl
	add	esp, 4
; Line 1552
	jmp	$L1142
; Line 1553
	cmp	DWORD PTR _flag_traditional, 0
	je	$L1953
	mov	eax, DWORD PTR _long_integer_type_node
	mov	DWORD PTR _sizetype, eax
	jmp	$L1954
$L1953:
	mov	eax, DWORD PTR _long_unsigned_type_node
	mov	DWORD PTR _sizetype, eax
$L1954:
; Line 1554
	jmp	$L1143
$L1142:
; Line 1555
	cmp	DWORD PTR _flag_traditional, 0
	je	$L1955
	mov	eax, DWORD PTR _integer_type_node
	mov	DWORD PTR _sizetype, eax
	jmp	$L1956
$L1955:
	mov	eax, DWORD PTR _unsigned_type_node
	mov	DWORD PTR _sizetype, eax
$L1956:
$L1143:
; Line 1557
	mov	eax, DWORD PTR _sizetype
	mov	ecx, DWORD PTR _integer_type_node
	mov	ecx, DWORD PTR [ecx+28]
	mov	DWORD PTR [ecx+8], eax
; Line 1558
	mov	eax, DWORD PTR _sizetype
	mov	ecx, DWORD PTR _char_type_node
	mov	ecx, DWORD PTR [ecx+28]
	mov	DWORD PTR [ecx+8], eax
; Line 1559
	mov	eax, DWORD PTR _sizetype
	mov	ecx, DWORD PTR _unsigned_type_node
	mov	ecx, DWORD PTR [ecx+28]
	mov	DWORD PTR [ecx+8], eax
; Line 1560
	mov	eax, DWORD PTR _sizetype
	mov	ecx, DWORD PTR _long_unsigned_type_node
	mov	ecx, DWORD PTR [ecx+28]
	mov	DWORD PTR [ecx+8], eax
; Line 1561
	mov	eax, DWORD PTR _sizetype
	mov	ecx, DWORD PTR _long_integer_type_node
	mov	ecx, DWORD PTR [ecx+28]
	mov	DWORD PTR [ecx+8], eax
; Line 1563
	push	0
	call	_make_node
	add	esp, 4
	mov	DWORD PTR _error_mark_node, eax
; Line 1564
	mov	eax, DWORD PTR _error_mark_node
	mov	ecx, DWORD PTR _error_mark_node
	mov	DWORD PTR [ecx+8], eax
; Line 1566
	push	16					; 00000010H
	call	_make_signed_type
	add	esp, 4
	mov	DWORD PTR _short_integer_type_node, eax
; Line 1568
	mov	eax, DWORD PTR _short_integer_type_node
	push	eax
	push	OFFSET $SG1144
	call	_get_identifier
	add	esp, 4
	push	eax
	push	42					; 0000002aH
	call	_build_decl
	add	esp, 12					; 0000000cH
	push	eax
	call	_pushdecl
	add	esp, 4
; Line 1570
	push	64					; 00000040H
	call	_make_signed_type
	add	esp, 4
	mov	DWORD PTR _long_long_integer_type_node, eax
; Line 1572
	mov	eax, DWORD PTR _long_long_integer_type_node
	push	eax
	push	OFFSET $SG1145
	call	_get_identifier
	add	esp, 4
	push	eax
	push	42					; 0000002aH
	call	_build_decl
	add	esp, 12					; 0000000cH
	push	eax
	call	_pushdecl
	add	esp, 4
; Line 1574
	push	16					; 00000010H
	call	_make_unsigned_type
	add	esp, 4
	mov	DWORD PTR _short_unsigned_type_node, eax
; Line 1576
	mov	eax, DWORD PTR _short_unsigned_type_node
	push	eax
	push	OFFSET $SG1146
	call	_get_identifier
	add	esp, 4
	push	eax
	push	42					; 0000002aH
	call	_build_decl
	add	esp, 12					; 0000000cH
	push	eax
	call	_pushdecl
	add	esp, 4
; Line 1578
	push	64					; 00000040H
	call	_make_unsigned_type
	add	esp, 4
	mov	DWORD PTR _long_long_unsigned_type_node, eax
; Line 1580
	mov	eax, DWORD PTR _long_long_unsigned_type_node
	push	eax
	push	OFFSET $SG1147
	call	_get_identifier
	add	esp, 4
	push	eax
	push	42					; 0000002aH
	call	_build_decl
	add	esp, 12					; 0000000cH
	push	eax
	call	_pushdecl
	add	esp, 4
; Line 1583
	push	8
	call	_make_signed_type
	add	esp, 4
	mov	DWORD PTR _signed_char_type_node, eax
; Line 1585
	mov	eax, DWORD PTR _signed_char_type_node
	push	eax
	push	OFFSET $SG1148
	call	_get_identifier
	add	esp, 4
	push	eax
	push	42					; 0000002aH
	call	_build_decl
	add	esp, 12					; 0000000cH
	push	eax
	call	_pushdecl
	add	esp, 4
; Line 1587
	push	8
	call	_make_unsigned_type
	add	esp, 4
	mov	DWORD PTR _unsigned_char_type_node, eax
; Line 1589
	mov	eax, DWORD PTR _unsigned_char_type_node
	push	eax
	push	OFFSET $SG1149
	call	_get_identifier
	add	esp, 4
	push	eax
	push	42					; 0000002aH
	call	_build_decl
	add	esp, 12					; 0000000cH
	push	eax
	call	_pushdecl
	add	esp, 4
; Line 1591
	push	6
	call	_make_node
	add	esp, 4
	mov	DWORD PTR _float_type_node, eax
; Line 1592
	mov	eax, DWORD PTR _float_type_node
	mov	BYTE PTR [eax+38], 32			; 00000020H
; Line 1594
	mov	eax, DWORD PTR _float_type_node
	push	eax
	mov	eax, DWORD PTR _ridpointers+12
	push	eax
	push	42					; 0000002aH
	call	_build_decl
	add	esp, 12					; 0000000cH
	push	eax
	call	_pushdecl
	add	esp, 4
; Line 1595
	mov	eax, DWORD PTR _float_type_node
	push	eax
	call	_layout_type
	add	esp, 4
; Line 1597
	push	6
	call	_make_node
	add	esp, 4
	mov	DWORD PTR _double_type_node, eax
; Line 1598
	mov	eax, DWORD PTR _double_type_node
	mov	BYTE PTR [eax+38], 64			; 00000040H
; Line 1600
	mov	eax, DWORD PTR _double_type_node
	push	eax
	mov	eax, DWORD PTR _ridpointers+16
	push	eax
	push	42					; 0000002aH
	call	_build_decl
	add	esp, 12					; 0000000cH
	push	eax
	call	_pushdecl
	add	esp, 4
; Line 1601
	mov	eax, DWORD PTR _double_type_node
	push	eax
	call	_layout_type
	add	esp, 4
; Line 1603
	push	6
	call	_make_node
	add	esp, 4
	mov	DWORD PTR _long_double_type_node, eax
; Line 1604
	mov	eax, DWORD PTR _long_double_type_node
	mov	BYTE PTR [eax+38], 64			; 00000040H
; Line 1606
	mov	eax, DWORD PTR _long_double_type_node
	push	eax
	push	OFFSET $SG1150
	call	_get_identifier
	add	esp, 4
	push	eax
	push	42					; 0000002aH
	call	_build_decl
	add	esp, 12					; 0000000cH
	push	eax
	call	_pushdecl
	add	esp, 4
; Line 1607
	mov	eax, DWORD PTR _long_double_type_node
	push	eax
	call	_layout_type
	add	esp, 4
; Line 1609
	push	0
	push	0
	call	_build_int_2
	add	esp, 8
	mov	DWORD PTR _integer_zero_node, eax
; Line 1610
	mov	eax, DWORD PTR _integer_type_node
	mov	ecx, DWORD PTR _integer_zero_node
	mov	DWORD PTR [ecx+8], eax
; Line 1611
	push	0
	push	1
	call	_build_int_2
	add	esp, 8
	mov	DWORD PTR _integer_one_node, eax
; Line 1612
	mov	eax, DWORD PTR _integer_type_node
	mov	ecx, DWORD PTR _integer_one_node
	mov	DWORD PTR [ecx+8], eax
; Line 1614
	push	0
	push	0
	call	_build_int_2
	add	esp, 8
	mov	DWORD PTR _size_zero_node, eax
; Line 1615
	mov	eax, DWORD PTR _sizetype
	mov	ecx, DWORD PTR _size_zero_node
	mov	DWORD PTR [ecx+8], eax
; Line 1616
	push	0
	push	1
	call	_build_int_2
	add	esp, 8
	mov	DWORD PTR _size_one_node, eax
; Line 1617
	mov	eax, DWORD PTR _sizetype
	mov	ecx, DWORD PTR _size_one_node
	mov	DWORD PTR [ecx+8], eax
; Line 1619
	push	4
	call	_make_node
	add	esp, 4
	mov	DWORD PTR _void_type_node, eax
; Line 1621
	mov	eax, DWORD PTR _void_type_node
	push	eax
	mov	eax, DWORD PTR _ridpointers+20
	push	eax
	push	42					; 0000002aH
	call	_build_decl
	add	esp, 12					; 0000000cH
	push	eax
	call	_pushdecl
	add	esp, 4
; Line 1622
	mov	eax, DWORD PTR _void_type_node
	push	eax
	call	_layout_type
	add	esp, 4
; Line 1624
	push	0
	push	0
	call	_build_int_2
	add	esp, 8
	mov	DWORD PTR _null_pointer_node, eax
; Line 1625
	mov	eax, DWORD PTR _void_type_node
	push	eax
	call	_build_pointer_type
	add	esp, 4
	mov	ecx, DWORD PTR _null_pointer_node
	mov	DWORD PTR [ecx+8], eax
; Line 1626
	mov	eax, DWORD PTR _null_pointer_node
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_layout_type
	add	esp, 4
; Line 1628
	mov	eax, DWORD PTR _char_type_node
	push	eax
	call	_build_pointer_type
	add	esp, 4
	mov	DWORD PTR _string_type_node, eax
; Line 1635
	mov	eax, DWORD PTR _unsigned_char_type_node
	push	eax
	mov	eax, DWORD PTR _char_type_node
	push	eax
	call	_build_array_type
	add	esp, 8
	mov	DWORD PTR _char_array_type_node, eax
; Line 1638
	mov	eax, DWORD PTR _unsigned_char_type_node
	push	eax
	mov	eax, DWORD PTR _integer_type_node
	push	eax
	call	_build_array_type
	add	esp, 8
	mov	DWORD PTR _int_array_type_node, eax
; Line 1641
	push	0
	mov	eax, DWORD PTR _integer_type_node
	push	eax
	call	_build_function_type
	add	esp, 8
	mov	DWORD PTR _default_function_type, eax
; Line 1643
	mov	eax, DWORD PTR _void_type_node
	push	eax
	call	_build_pointer_type
	add	esp, 4
	mov	DWORD PTR _ptr_type_node, eax
; Line 1644
	push	0
	mov	eax, DWORD PTR _void_type_node
	push	eax
	push	0
	call	_tree_cons
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _endlink$[ebp], eax
; Line 1648
	mov	eax, DWORD PTR _endlink$[ebp]
	push	eax
	mov	eax, DWORD PTR _double_type_node
	push	eax
	push	0
	call	_tree_cons
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _double_type_node
	push	eax
	call	_build_function_type
	add	esp, 8
	mov	DWORD PTR _double_ftype_double, eax
; Line 1654
	mov	eax, DWORD PTR _endlink$[ebp]
	push	eax
	mov	eax, DWORD PTR _double_type_node
	push	eax
	push	0
	call	_tree_cons
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _double_type_node
	push	eax
	push	0
	call	_tree_cons
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _double_type_node
	push	eax
	call	_build_function_type
	add	esp, 8
	mov	DWORD PTR _double_ftype_double_double, eax
; Line 1658
	mov	eax, DWORD PTR _endlink$[ebp]
	push	eax
	mov	eax, DWORD PTR _integer_type_node
	push	eax
	push	0
	call	_tree_cons
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _integer_type_node
	push	eax
	call	_build_function_type
	add	esp, 8
	mov	DWORD PTR _int_ftype_int, eax
; Line 1663
	mov	eax, DWORD PTR _endlink$[ebp]
	push	eax
	mov	eax, DWORD PTR _long_integer_type_node
	push	eax
	push	0
	call	_tree_cons
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _long_integer_type_node
	push	eax
	call	_build_function_type
	add	esp, 8
	mov	DWORD PTR _long_ftype_long, eax
; Line 1671
	mov	eax, DWORD PTR _endlink$[ebp]
	push	eax
	mov	eax, DWORD PTR _integer_type_node
	push	eax
	push	0
	call	_tree_cons
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _ptr_type_node
	push	eax
	push	0
	call	_tree_cons
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _ptr_type_node
	push	eax
	push	0
	call	_tree_cons
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _void_type_node
	push	eax
	call	_build_function_type
	add	esp, 8
	mov	DWORD PTR _void_ftype_ptr_ptr_int, eax
; Line 1679
	mov	eax, DWORD PTR _endlink$[ebp]
	push	eax
	mov	eax, DWORD PTR _integer_type_node
	push	eax
	push	0
	call	_tree_cons
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _ptr_type_node
	push	eax
	push	0
	call	_tree_cons
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _ptr_type_node
	push	eax
	push	0
	call	_tree_cons
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _integer_type_node
	push	eax
	call	_build_function_type
	add	esp, 8
	mov	DWORD PTR _int_ftype_ptr_ptr_int, eax
; Line 1687
	mov	eax, DWORD PTR _endlink$[ebp]
	push	eax
	mov	eax, DWORD PTR _integer_type_node
	push	eax
	push	0
	call	_tree_cons
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _integer_type_node
	push	eax
	push	0
	call	_tree_cons
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _ptr_type_node
	push	eax
	push	0
	call	_tree_cons
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _void_type_node
	push	eax
	call	_build_function_type
	add	esp, 8
	mov	DWORD PTR _void_ftype_ptr_int_int, eax
; Line 1694
	push	1
	mov	eax, DWORD PTR _endlink$[ebp]
	push	eax
	mov	eax, DWORD PTR _integer_type_node
	push	eax
	push	0
	call	_tree_cons
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _ptr_type_node
	push	eax
	call	_build_function_type
	add	esp, 8
	push	eax
	push	OFFSET $SG1151
	call	_builtin_function
	add	esp, 12					; 0000000cH
; Line 1696
	push	2
	mov	eax, DWORD PTR _int_ftype_int
	push	eax
	push	OFFSET $SG1152
	call	_builtin_function
	add	esp, 12					; 0000000cH
; Line 1697
	push	3
	mov	eax, DWORD PTR _double_ftype_double
	push	eax
	push	OFFSET $SG1153
	call	_builtin_function
	add	esp, 12					; 0000000cH
; Line 1698
	push	4
	mov	eax, DWORD PTR _long_ftype_long
	push	eax
	push	OFFSET $SG1154
	call	_builtin_function
	add	esp, 12					; 0000000cH
; Line 1699
	push	5
	mov	eax, DWORD PTR _int_ftype_int
	push	eax
	push	OFFSET $SG1155
	call	_builtin_function
	add	esp, 12					; 0000000cH
; Line 1701
	push	18					; 00000012H
	mov	eax, DWORD PTR _default_function_type
	push	eax
	push	OFFSET $SG1156
	call	_builtin_function
	add	esp, 12					; 0000000cH
; Line 1703
	push	19					; 00000013H
	mov	eax, DWORD PTR _default_function_type
	push	eax
	push	OFFSET $SG1157
	call	_builtin_function
	add	esp, 12					; 0000000cH
; Line 1706
	push	20					; 00000014H
	mov	eax, DWORD PTR _endlink$[ebp]
	push	eax
	mov	eax, DWORD PTR _ptr_type_node
	push	eax
	call	_build_function_type
	add	esp, 8
	push	eax
	push	OFFSET $SG1158
	call	_builtin_function
	add	esp, 12					; 0000000cH
; Line 1724
	call	_start_identifier_warnings
; Line 1725
$L1134:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_init_decl_processing ENDP
_TEXT	ENDS
EXTRN	_make_decl_rtl:NEAR
_TEXT	SEGMENT
_name$ = 8
_type$ = 12
_function_code$ = 16
_decl$ = -4
_builtin_function PROC NEAR
; Line 1737
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 1738
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_get_identifier
	add	esp, 4
	push	eax
	push	39					; 00000027H
	call	_build_decl
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _decl$[ebp], eax
; Line 1739
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	or	eax, 1
	mov	ecx, DWORD PTR _decl$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 1740
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	or	eax, 2
	mov	ecx, DWORD PTR _decl$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 1741
	push	1
	push	0
	mov	eax, DWORD PTR _decl$[ebp]
	push	eax
	call	_make_decl_rtl
	add	esp, 12					; 0000000cH
; Line 1742
	mov	eax, DWORD PTR _decl$[ebp]
	push	eax
	call	_pushdecl
	add	esp, 4
; Line 1743
	mov	eax, DWORD PTR _function_code$[ebp]
	mov	ecx, DWORD PTR _decl$[ebp]
	mov	DWORD PTR [ecx+48], eax
; Line 1744
$L1163:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_builtin_function ENDP
_TEXT	ENDS
PUBLIC	_shadow_tag
_DATA	SEGMENT
	ORG $+1
$SG1189	DB	'useless keyword or type name in declaration', 00H
$SG1192	DB	'multiple types in one declaration', 00H
	ORG $+2
$SG1194	DB	'empty declaration', 00H
_DATA	ENDS
_TEXT	SEGMENT
_declspecs$ = 8
_found_tag$ = -12
_warned$ = -8
_link$ = -4
_value$1175 = -24
_code$1176 = -20
_ok$1177 = -16
_name$1180 = -32
_t$1181 = -28
_shadow_tag PROC NEAR
; Line 1757
	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H
	push	ebx
	push	esi
	push	edi
; Line 1758
	mov	DWORD PTR _found_tag$[ebp], 0
; Line 1759
	mov	DWORD PTR _warned$[ebp], 0
; Line 1762
	mov	eax, DWORD PTR _declspecs$[ebp]
	mov	DWORD PTR _link$[ebp], eax
	jmp	$L1172
$L1173:
	mov	eax, DWORD PTR _link$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _link$[ebp], eax
$L1172:
	cmp	DWORD PTR _link$[ebp], 0
	je	$L1174
; Line 1764
	mov	eax, DWORD PTR _link$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _value$1175[ebp], eax
; Line 1765
	mov	eax, DWORD PTR _value$1175[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _code$1176[ebp], eax
; Line 1766
	mov	DWORD PTR _ok$1177[ebp], 0
; Line 1768
	cmp	DWORD PTR _code$1176[ebp], 19		; 00000013H
	je	$L1179
	cmp	DWORD PTR _code$1176[ebp], 20		; 00000014H
	je	$L1179
	cmp	DWORD PTR _code$1176[ebp], 8
	jne	$L1178
$L1179:
; Line 1772
	mov	eax, DWORD PTR _value$1175[ebp]
	push	eax
	call	_lookup_tag_reverse
	add	esp, 4
	mov	DWORD PTR _name$1180[ebp], eax
; Line 1773
	push	1
	mov	eax, DWORD PTR _current_binding_level$S719
	push	eax
	mov	eax, DWORD PTR _name$1180[ebp]
	push	eax
	mov	eax, DWORD PTR _code$1176[ebp]
	push	eax
	call	_lookup_tag
	add	esp, 16					; 00000010H
	mov	DWORD PTR _t$1181[ebp], eax
; Line 1775
	cmp	DWORD PTR _t$1181[ebp], 0
	jne	$L1182
; Line 1777
	mov	eax, DWORD PTR _code$1176[ebp]
	push	eax
	call	_make_node
	add	esp, 4
	mov	DWORD PTR _t$1181[ebp], eax
; Line 1778
	mov	eax, DWORD PTR _t$1181[ebp]
	push	eax
	mov	eax, DWORD PTR _name$1180[ebp]
	push	eax
	call	_pushtag
	add	esp, 8
; Line 1779
	mov	DWORD PTR _ok$1177[ebp], 1
; Line 1781
	jmp	$L1183
$L1182:
	cmp	DWORD PTR _name$1180[ebp], 0
	jne	$L1185
	cmp	DWORD PTR _code$1176[ebp], 8
	jne	$L1184
$L1185:
; Line 1782
	mov	DWORD PTR _ok$1177[ebp], 1
; Line 1783
$L1184:
$L1183:
; Line 1785
$L1178:
	cmp	DWORD PTR _ok$1177[ebp], 0
	je	$L1186
; Line 1786
	inc	DWORD PTR _found_tag$[ebp]
; Line 1787
	jmp	$L1187
$L1186:
; Line 1789
	cmp	DWORD PTR _warned$[ebp], 0
	jne	$L1188
; Line 1790
	push	OFFSET $SG1189
	call	_warning
	add	esp, 4
; Line 1791
$L1188:
	mov	DWORD PTR _warned$[ebp], 1
; Line 1792
$L1187:
; Line 1793
	jmp	$L1173
$L1174:
; Line 1795
	cmp	DWORD PTR _warned$[ebp], 0
	jne	$L1190
; Line 1797
	cmp	DWORD PTR _found_tag$[ebp], 1
	jle	$L1191
; Line 1798
	push	OFFSET $SG1192
	call	_warning
	add	esp, 4
; Line 1799
$L1191:
	cmp	DWORD PTR _found_tag$[ebp], 0
	jne	$L1193
; Line 1800
	push	OFFSET $SG1194
	call	_warning
	add	esp, 4
; Line 1801
$L1193:
; Line 1802
$L1190:
$L1168:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_shadow_tag ENDP
_TEXT	ENDS
PUBLIC	_groktypename
_TEXT	SEGMENT
_typename$ = 8
_groktypename PROC NEAR
; Line 1809
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1810
	mov	eax, DWORD PTR _typename$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 3
	je	$L1197
; Line 1811
	mov	eax, DWORD PTR _typename$[ebp]
	jmp	$L1196
; Line 1812
$L1197:
; Line 1814
	push	0
	push	4
	mov	eax, DWORD PTR _typename$[ebp]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	mov	eax, DWORD PTR _typename$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_grokdeclarator
	add	esp, 16					; 00000010H
	jmp	$L1196
; Line 1815
$L1196:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_groktypename ENDP
_TEXT	ENDS
PUBLIC	_start_decl
EXTRN	_list_length:NEAR
EXTRN	_expand_decl:NEAR
EXTRN	_temporary_allocation:NEAR
_DATA	SEGMENT
	ORG $+2
$SG1214	DB	'typedef `%s'' is initialized', 00H
$SG1216	DB	'function `%s'' is initialized like a variable', 00H
	ORG $+3
$SG1221	DB	'variable `%s'' has initializer but incomplete type', 00H
	ORG $+2
$SG1224	DB	'elements of array `%s'' have incomplete type', 00H
_DATA	ENDS
_TEXT	SEGMENT
_declarator$ = 8
_declspecs$ = 12
_initialized$ = 16
_decl$ = -12
_tem$ = -8
_init_written$ = -4
_start_decl PROC NEAR
; Line 1840
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 1842
	mov	eax, DWORD PTR _initialized$[ebp]
	push	eax
	push	0
	mov	eax, DWORD PTR _declspecs$[ebp]
	push	eax
	mov	eax, DWORD PTR _declarator$[ebp]
	push	eax
	call	_grokdeclarator
	add	esp, 16					; 00000010H
	mov	DWORD PTR _decl$[ebp], eax
; Line 1844
	mov	eax, DWORD PTR _initialized$[ebp]
	mov	DWORD PTR _init_written$[ebp], eax
; Line 1846
	cmp	DWORD PTR _initialized$[ebp], 0
	je	$L1206
; Line 1850
	mov	eax, DWORD PTR _decl$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR -16+[ebp], eax
	jmp	$L1207
; Line 1852
$L1211:
; Line 1856
	cmp	DWORD PTR _pedantic, 0
	jne	$L1213
	mov	eax, DWORD PTR _declspecs$[ebp]
	push	eax
	call	_list_length
	add	esp, 4
	cmp	eax, 1
	jle	$L1212
$L1213:
; Line 1859
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+40]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	OFFSET $SG1214
	call	_error
	add	esp, 8
; Line 1860
	mov	DWORD PTR _initialized$[ebp], 0
; Line 1862
$L1212:
	jmp	$L1208
; Line 1864
$L1215:
; Line 1866
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+40]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	OFFSET $SG1216
	call	_error
	add	esp, 8
; Line 1867
	mov	DWORD PTR _initialized$[ebp], 0
; Line 1868
	jmp	$L1208
; Line 1870
$L1217:
; Line 1873
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+28], 0
	je	$L1218
; Line 1875
	jmp	$L1219
$L1218:
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 16					; 00000010H
	je	$L1220
; Line 1878
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+40]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	OFFSET $SG1221
	call	_error
	add	esp, 8
; Line 1879
	mov	DWORD PTR _initialized$[ebp], 0
; Line 1881
	jmp	$L1222
$L1220:
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+28], 0
	jne	$L1223
; Line 1884
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+40]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	OFFSET $SG1224
	call	_error
	add	esp, 8
; Line 1885
	mov	DWORD PTR _initialized$[ebp], 0
; Line 1887
$L1223:
$L1222:
$L1219:
	jmp	$L1208
$L1207:
	cmp	DWORD PTR -16+[ebp], 39			; 00000027H
	je	$L1215
	cmp	DWORD PTR -16+[ebp], 42			; 0000002aH
	je	$L1211
	jmp	$L1217
$L1208:
; Line 1889
$L1206:
	cmp	DWORD PTR _initialized$[ebp], 0
	je	$L1225
; Line 1898
	mov	eax, DWORD PTR _decl$[ebp]
	and	DWORD PTR [eax+16], -2			; fffffffeH
; Line 1899
	mov	eax, DWORD PTR _current_binding_level$S719
	cmp	DWORD PTR _global_binding_level$S721, eax
	jne	$L1226
; Line 1900
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	or	eax, 4
	mov	ecx, DWORD PTR _decl$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 1905
$L1226:
	mov	eax, DWORD PTR _error_mark_node
	mov	ecx, DWORD PTR _decl$[ebp]
	mov	DWORD PTR [ecx+64], eax
; Line 1910
$L1225:
	mov	eax, DWORD PTR _decl$[ebp]
	push	eax
	call	_pushdecl
	add	esp, 4
	mov	DWORD PTR _tem$[ebp], eax
; Line 1917
	mov	eax, DWORD PTR _current_binding_level$S719
	cmp	DWORD PTR _global_binding_level$S721, eax
	je	$L1227
	mov	eax, DWORD PTR _tem$[ebp]
	cmp	DWORD PTR [eax+76], 0
	jne	$L1227
; Line 1919
	mov	eax, DWORD PTR _tem$[ebp]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+28], 0
	je	$L1228
; Line 1920
	push	0
	mov	eax, DWORD PTR _tem$[ebp]
	push	eax
	call	_expand_decl
	add	esp, 8
; Line 1921
	jmp	$L1230
$L1228:
; Line 1922
	mov	eax, DWORD PTR _tem$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 16					; 00000010H
	jne	$L1231
	mov	eax, DWORD PTR _tem$[ebp]
	cmp	DWORD PTR [eax+64], 0
	je	$L1231
; Line 1923
	push	0
	mov	eax, DWORD PTR _tem$[ebp]
	push	eax
	call	_expand_decl
	add	esp, 8
; Line 1924
$L1231:
$L1230:
; Line 1926
$L1227:
	cmp	DWORD PTR _init_written$[ebp], 0
	je	$L1232
; Line 1930
	mov	eax, DWORD PTR _current_binding_level$S719
	cmp	DWORD PTR _global_binding_level$S721, eax
	jne	$L1233
	cmp	DWORD PTR _debug_temp_inits, 0
	je	$L1233
; Line 1931
	call	_temporary_allocation
; Line 1932
$L1233:
; Line 1934
$L1232:
	mov	eax, DWORD PTR _tem$[ebp]
	jmp	$L1202
; Line 1935
$L1202:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_start_decl ENDP
_TEXT	ENDS
PUBLIC	_finish_decl
PUBLIC	_complete_array_type
EXTRN	_expand_decl_init:NEAR
EXTRN	_permanent_allocation:NEAR
EXTRN	_allocation_temporary_p:NEAR
EXTRN	_tree_int_cst_lt:NEAR
EXTRN	_store_init_value:NEAR
EXTRN	_get_pending_sizes:NEAR
_DATA	SEGMENT
$SG1255	DB	'initializer fails to determine size of `%s''', 00H
$SG1259	DB	'array size missing in `%s''', 00H
	ORG $+1
$SG1264	DB	'zero-size array `%s''', 00H
	ORG $+3
$SG1269	DB	'storage size of `%s'' isn''t known', 00H
	ORG $+3
$SG1272	DB	'storage size of `%s'' isn''t known', 00H
	ORG $+3
$SG1275	DB	'storage size of `%s'' isn''t constant', 00H
_DATA	ENDS
_TEXT	SEGMENT
_decl$ = 8
_init$ = 12
_asmspec_tree$ = 16
_type$ = -8
_was_incomplete$ = -16
_temporary$ = -4
_asmspec$ = -12
_do_default$1251 = -24
_failure$1252 = -20
_finish_decl PROC NEAR
; Line 1946
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	push	ebx
	push	esi
	push	edi
; Line 1947
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _type$[ebp], eax
; Line 1948
	mov	eax, DWORD PTR _decl$[ebp]
	cmp	DWORD PTR [eax+28], 1
	sbb	eax, eax
	neg	eax
	mov	DWORD PTR _was_incomplete$[ebp], eax
; Line 1949
	call	_allocation_temporary_p
	mov	DWORD PTR _temporary$[ebp], eax
; Line 1950
	mov	DWORD PTR _asmspec$[ebp], 0
; Line 1952
	cmp	DWORD PTR _asmspec_tree$[ebp], 0
	je	$L1244
; Line 1953
	mov	eax, DWORD PTR _asmspec_tree$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR _asmspec$[ebp], eax
; Line 1957
$L1244:
	cmp	DWORD PTR _init$[ebp], 0
	je	$L1245
	mov	eax, DWORD PTR _decl$[ebp]
	cmp	DWORD PTR [eax+64], 0
	jne	$L1245
; Line 1958
	mov	DWORD PTR _init$[ebp], 0
; Line 1960
$L1245:
	cmp	DWORD PTR _init$[ebp], 0
	je	$L1246
; Line 1962
	mov	eax, DWORD PTR _decl$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 42					; 0000002aH
	je	$L1247
; Line 1963
	mov	eax, DWORD PTR _init$[ebp]
	push	eax
	mov	eax, DWORD PTR _decl$[ebp]
	push	eax
	call	_store_init_value
	add	esp, 8
; Line 1964
	jmp	$L1248
$L1247:
; Line 1967
	mov	eax, DWORD PTR _init$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _decl$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 1968
	mov	DWORD PTR _init$[ebp], 0
	mov	eax, DWORD PTR _init$[ebp]
	mov	ecx, DWORD PTR _decl$[ebp]
	mov	DWORD PTR [ecx+64], eax
; Line 1969
$L1248:
; Line 1977
$L1246:
	mov	eax, DWORD PTR _current_binding_level$S719
	cmp	DWORD PTR _global_binding_level$S721, eax
	jne	$L1249
	cmp	DWORD PTR _temporary$[ebp], 0
	je	$L1249
; Line 1978
	call	_end_temporary_allocation
; Line 1982
$L1249:
; Line 1984
	mov	eax, DWORD PTR _type$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 16					; 00000010H
	jne	$L1250
	mov	eax, DWORD PTR _type$[ebp]
	cmp	DWORD PTR [eax+20], 0
	jne	$L1250
	mov	eax, DWORD PTR _decl$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 42					; 0000002aH
	je	$L1250
; Line 1995
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 2
	test	al, 1
	je	$L1957
	cmp	DWORD PTR _pedantic, 0
	je	$L1959
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 1
	test	al, 1
	jne	$L1959
	mov	DWORD PTR _do_default$1251[ebp], 1
	jmp	$L1960
$L1959:
	mov	DWORD PTR _do_default$1251[ebp], 0
$L1960:
	jmp	$L1958
$L1957:
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	and	eax, 1
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	mov	DWORD PTR _do_default$1251[ebp], eax
$L1958:
; Line 1997
	mov	eax, DWORD PTR _do_default$1251[ebp]
	push	eax
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+64]
	push	eax
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_complete_array_type
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _failure$1252[ebp], eax
; Line 1999
	cmp	DWORD PTR _failure$1252[ebp], 1
	jne	$L1254
; Line 2000
	push	OFFSET $SG1255
	mov	eax, DWORD PTR _decl$[ebp]
	push	eax
	call	_error_with_decl
	add	esp, 8
; Line 2002
$L1254:
	cmp	DWORD PTR _failure$1252[ebp], 2
	jne	$L1256
; Line 2004
	cmp	DWORD PTR _do_default$1251[ebp], 0
	je	$L1257
; Line 2006
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 1
	test	al, 1
	jne	$L1258
; Line 2007
	push	OFFSET $SG1259
	mov	eax, DWORD PTR _decl$[ebp]
	push	eax
	call	_error_with_decl
	add	esp, 8
; Line 2008
$L1258:
; Line 2009
	jmp	$L1260
$L1257:
	cmp	DWORD PTR _pedantic, 0
	jne	$L1261
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 2
	test	al, 1
	je	$L1261
; Line 2010
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	or	eax, 1
	mov	ecx, DWORD PTR _decl$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 2011
$L1261:
$L1260:
; Line 2013
$L1256:
; Line 2015
	cmp	DWORD PTR _pedantic, 0
	je	$L1263
	mov	eax, DWORD PTR _type$[ebp]
	cmp	DWORD PTR [eax+20], 0
	je	$L1263
	mov	eax, DWORD PTR _integer_zero_node
	push	eax
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	eax, DWORD PTR [eax+60]
	push	eax
	call	_tree_int_cst_lt
	add	esp, 8
	or	eax, eax
	je	$L1263
; Line 2016
	push	OFFSET $SG1264
	mov	eax, DWORD PTR _decl$[ebp]
	push	eax
	call	_error_with_decl
	add	esp, 8
; Line 2018
$L1263:
	push	0
	mov	eax, DWORD PTR _decl$[ebp]
	push	eax
	call	_layout_decl
	add	esp, 8
; Line 2021
$L1250:
	mov	eax, DWORD PTR _decl$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 43					; 0000002bH
	jne	$L1265
; Line 2023
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 2
	test	al, 1
	je	$L1266
	mov	eax, DWORD PTR _decl$[ebp]
	cmp	DWORD PTR [eax+28], 0
	jne	$L1266
; Line 2029
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 1
	test	al, 1
	je	$L1268
	mov	eax, DWORD PTR _decl$[ebp]
	cmp	DWORD PTR [eax+64], 0
	je	$L1267
$L1268:
; Line 2030
	push	OFFSET $SG1269
	mov	eax, DWORD PTR _decl$[ebp]
	push	eax
	call	_error_with_decl
	add	esp, 8
; Line 2031
$L1267:
; Line 2032
	jmp	$L1270
$L1266:
	mov	eax, DWORD PTR _decl$[ebp]
	test	BYTE PTR [eax+16], 1
	jne	$L1271
	mov	eax, DWORD PTR _decl$[ebp]
	cmp	DWORD PTR [eax+28], 0
	jne	$L1271
; Line 2036
	push	OFFSET $SG1272
	mov	eax, DWORD PTR _decl$[ebp]
	push	eax
	call	_error_with_decl
	add	esp, 8
; Line 2037
	mov	eax, DWORD PTR _error_mark_node
	mov	ecx, DWORD PTR _decl$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 2040
$L1271:
$L1270:
; Line 2041
	mov	eax, DWORD PTR _decl$[ebp]
	test	BYTE PTR [eax+16], 1
	jne	$L1274
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 2
	test	al, 1
	je	$L1273
$L1274:
	mov	eax, DWORD PTR _decl$[ebp]
	cmp	DWORD PTR [eax+28], 0
	je	$L1273
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 6
	test	al, 1
	jne	$L1273
; Line 2042
	push	OFFSET $SG1275
	mov	eax, DWORD PTR _decl$[ebp]
	push	eax
	call	_error_with_decl
	add	esp, 8
; Line 2043
$L1273:
; Line 2049
$L1265:
	mov	eax, DWORD PTR _decl$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 43					; 0000002bH
	je	$L1277
	mov	eax, DWORD PTR _decl$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 39					; 00000027H
	jne	$L1276
$L1277:
; Line 2051
	cmp	DWORD PTR _flag_traditional, 0
	je	$L1278
	call	_allocation_temporary_p
	or	eax, eax
	je	$L1278
; Line 2053
	call	_end_temporary_allocation
; Line 2056
	push	0
	mov	eax, DWORD PTR _global_binding_level$S721
	sub	eax, DWORD PTR _current_binding_level$S719
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	push	eax
	mov	eax, DWORD PTR _asmspec$[ebp]
	push	eax
	mov	eax, DWORD PTR _decl$[ebp]
	push	eax
	call	_rest_of_decl_compilation
	add	esp, 16					; 00000010H
; Line 2057
	call	_resume_temporary_allocation
; Line 2059
	jmp	$L1279
$L1278:
; Line 2062
	push	0
	mov	eax, DWORD PTR _global_binding_level$S721
	sub	eax, DWORD PTR _current_binding_level$S719
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	push	eax
	mov	eax, DWORD PTR _asmspec$[ebp]
	push	eax
	mov	eax, DWORD PTR _decl$[ebp]
	push	eax
	call	_rest_of_decl_compilation
	add	esp, 16					; 00000010H
$L1279:
; Line 2063
	mov	eax, DWORD PTR _current_binding_level$S719
	cmp	DWORD PTR _global_binding_level$S721, eax
	je	$L1280
; Line 2068
	cmp	DWORD PTR _was_incomplete$[ebp], 0
	je	$L1281
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 2
	test	al, 1
	jne	$L1281
	mov	eax, DWORD PTR _decl$[ebp]
	test	BYTE PTR [eax+16], 1
	jne	$L1281
; Line 2071
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 15					; 0000000fH
	and	eax, 1
	shl	eax, 9
	mov	ecx, DWORD PTR _decl$[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	and	ecx, -513				; fffffdffH
	or	eax, ecx
	mov	ecx, DWORD PTR _decl$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 2073
	mov	eax, DWORD PTR _decl$[ebp]
	cmp	DWORD PTR [eax+28], 0
	jne	$L1282
; Line 2074
	mov	eax, DWORD PTR _decl$[ebp]
	mov	DWORD PTR [eax+64], 0
; Line 2075
$L1282:
	push	0
	mov	eax, DWORD PTR _decl$[ebp]
	push	eax
	call	_expand_decl
	add	esp, 8
; Line 2078
$L1281:
	mov	eax, DWORD PTR _decl$[ebp]
	push	eax
	call	_expand_decl_init
	add	esp, 4
; Line 2080
$L1280:
; Line 2082
$L1276:
	mov	eax, DWORD PTR _decl$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 42					; 0000002aH
	jne	$L1284
; Line 2085
	push	0
	mov	eax, DWORD PTR _global_binding_level$S721
	sub	eax, DWORD PTR _current_binding_level$S719
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	push	eax
	push	0
	mov	eax, DWORD PTR _decl$[ebp]
	push	eax
	call	_rest_of_decl_compilation
	add	esp, 16					; 00000010H
; Line 2088
$L1284:
	cmp	DWORD PTR _temporary$[ebp], 0
	je	$L1285
	mov	eax, DWORD PTR _current_binding_level$S719
	cmp	DWORD PTR _global_binding_level$S721, eax
	jne	$L1285
; Line 2090
	call	_permanent_allocation
; Line 2093
	mov	eax, DWORD PTR _decl$[ebp]
	cmp	DWORD PTR [eax+64], 0
	je	$L1287
; Line 2094
	mov	eax, DWORD PTR _error_mark_node
	mov	ecx, DWORD PTR _decl$[ebp]
	mov	DWORD PTR [ecx+64], eax
; Line 2095
$L1287:
; Line 2100
$L1285:
	mov	eax, DWORD PTR _current_binding_level$S719
	cmp	DWORD PTR _global_binding_level$S721, eax
	jne	$L1288
; Line 2101
	call	_get_pending_sizes
; Line 2102
$L1288:
$L1238:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_finish_decl ENDP
_TEXT	ENDS
PUBLIC	_push_parm_decl
_TEXT	SEGMENT
_parm$ = 8
_decl$ = -4
_push_parm_decl PROC NEAR
; Line 2110
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 2112
	push	0
	push	2
	mov	eax, DWORD PTR _parm$[ebp]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	mov	eax, DWORD PTR _parm$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_grokdeclarator
	add	esp, 16					; 00000010H
	mov	DWORD PTR _decl$[ebp], eax
; Line 2115
	push	0
	push	0
	mov	eax, DWORD PTR _decl$[ebp]
	push	eax
	call	_pushdecl
	add	esp, 4
	push	eax
	call	_finish_decl
	add	esp, 12					; 0000000cH
; Line 2116
$L1291:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_push_parm_decl ENDP
_TEXT	ENDS
EXTRN	_build_index_type:NEAR
_TEXT	SEGMENT
_type$ = 8
_initial_value$ = 12
_do_default$ = 16
_maxindex$ = -8
_value$ = -12
_temporary$ = -4
_eltsize$1303 = -16
_nelts$1306 = -20
_complete_array_type PROC NEAR
; Line 2127
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	push	ebx
	push	esi
	push	edi
; Line 2128
	mov	DWORD PTR _maxindex$[ebp], 0
; Line 2129
	mov	DWORD PTR _value$[ebp], 0
; Line 2130
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 8
	test	al, 1
	je	$L1961
	call	_allocation_temporary_p
	or	eax, eax
	je	$L1961
	mov	DWORD PTR _temporary$[ebp], 1
	jmp	$L1962
$L1961:
	mov	DWORD PTR _temporary$[ebp], 0
$L1962:
; Line 2133
	cmp	DWORD PTR _temporary$[ebp], 0
	je	$L1300
; Line 2134
	call	_end_temporary_allocation
; Line 2136
$L1300:
	cmp	DWORD PTR _initial_value$[ebp], 0
	je	$L1301
; Line 2140
	mov	eax, DWORD PTR _initial_value$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 38					; 00000026H
	jne	$L1302
; Line 2142
	mov	eax, DWORD PTR _initial_value$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _eltsize$1303[ebp], eax
; Line 2143
	push	0
	mov	eax, DWORD PTR _initial_value$[ebp]
	mov	eax, DWORD PTR [eax+24]
	cdq
	idiv	DWORD PTR _eltsize$1303[ebp]
	dec	eax
	push	eax
	call	_build_int_2
	add	esp, 8
	mov	DWORD PTR _maxindex$[ebp], eax
; Line 2145
	jmp	$L1304
$L1302:
	mov	eax, DWORD PTR _initial_value$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 52					; 00000034H
	jne	$L1305
; Line 2148
	mov	eax, DWORD PTR _initial_value$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	call	_list_length
	add	esp, 4
	mov	DWORD PTR _nelts$1306[ebp], eax
; Line 2149
	push	0
	mov	eax, DWORD PTR _nelts$1306[ebp]
	dec	eax
	push	eax
	call	_build_int_2
	add	esp, 8
	mov	DWORD PTR _maxindex$[ebp], eax
; Line 2151
	jmp	$L1307
$L1305:
; Line 2154
	mov	eax, DWORD PTR _initial_value$[ebp]
	cmp	DWORD PTR _error_mark_node, eax
	je	$L1308
; Line 2155
	mov	DWORD PTR _value$[ebp], 1
; Line 2158
$L1308:
	push	0
	push	1
	call	_build_int_2
	add	esp, 8
	mov	DWORD PTR _maxindex$[ebp], eax
; Line 2159
$L1307:
$L1304:
; Line 2162
$L1301:
	cmp	DWORD PTR _maxindex$[ebp], 0
	jne	$L1309
; Line 2164
	cmp	DWORD PTR _do_default$[ebp], 0
	je	$L1310
; Line 2165
	push	0
	push	1
	call	_build_int_2
	add	esp, 8
	mov	DWORD PTR _maxindex$[ebp], eax
; Line 2166
$L1310:
	mov	DWORD PTR _value$[ebp], 2
; Line 2169
$L1309:
	cmp	DWORD PTR _maxindex$[ebp], 0
	je	$L1311
; Line 2171
	mov	eax, DWORD PTR _maxindex$[ebp]
	push	eax
	call	_build_index_type
	add	esp, 4
	mov	ecx, DWORD PTR _type$[ebp]
	mov	DWORD PTR [ecx+20], eax
; Line 2172
	mov	eax, DWORD PTR _maxindex$[ebp]
	cmp	DWORD PTR [eax+8], 0
	jne	$L1312
; Line 2173
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	ecx, DWORD PTR _maxindex$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 2174
$L1312:
; Line 2178
$L1311:
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_layout_type
	add	esp, 4
; Line 2180
	cmp	DWORD PTR _temporary$[ebp], 0
	je	$L1313
; Line 2181
	call	_resume_temporary_allocation
; Line 2183
$L1313:
	mov	eax, DWORD PTR _value$[ebp]
	jmp	$L1296
; Line 2184
$L1296:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_complete_array_type ENDP
_TEXT	ENDS
PUBLIC	_c_build_type_variant
EXTRN	_integer_zerop:NEAR
EXTRN	_build_binary_op:NEAR
EXTRN	_tree_last:NEAR
_BSS	SEGMENT
_warn_about_return_type$S716 DD 01H DUP (?)
_current_extern_inline$S717 DD 01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG1347	DB	'type name', 00H
	ORG $+2
$SG1364	DB	'duplicate `%s''', 00H
	ORG $+1
$SG1367	DB	'`long long long'' is too long for GCC', 00H
	ORG $+3
$SG1371	DB	'duplicate `%s''', 00H
	ORG $+1
$SG1374	DB	'two or more data types in declaration of `%s''', 00H
	ORG $+2
$SG1380	DB	'`%s'' fails to be a typedef or built in type', 00H
$SG1389	DB	'short, signed or unsigned invalid for `%s''', 00H
	ORG $+1
$SG1392	DB	'long, short, signed or unsigned invalid for `%s''', 00H
	ORG $+3
$SG1395	DB	'long and short specified together for `%s''', 00H
	ORG $+1
$SG1399	DB	'long or short specified with char for `%s''', 00H
	ORG $+1
$SG1402	DB	'signed and unsigned given together for `%s''', 00H
$SG1405	DB	'long, short, signed or unsigned used invalidly for `%s'''
	DB	00H
$SG1424	DB	'duplicate `const''', 00H
	ORG $+2
$SG1426	DB	'duplicate `volatile''', 00H
	ORG $+3
$SG1434	DB	'multiple storage classes in declaration of `%s''', 00H
$SG1438	DB	'function definition declared `auto''', 00H
$SG1440	DB	'function definition declared `auto''', 00H
$SG1442	DB	'function definition declared `typedef''', 00H
	ORG $+1
$SG1447	DB	'storage class specified for structure field `%s''', 00H
	ORG $+3
$SG1448	DB	'storage class specified for parameter `%s''', 00H
	ORG $+1
$SG1449	DB	'storage class specified for typename', 00H
	ORG $+3
$SG1452	DB	'`%s'' initialized and declared `extern''', 00H
	ORG $+1
$SG1455	DB	'top-level declaration of `%s'' specifies `auto''', 00H
	ORG $+1
$SG1464	DB	'declaration of `%s'' as array of voids', 00H
	ORG $+2
$SG1466	DB	'declaration of `%s'' as array of functions', 00H
	ORG $+2
$SG1472	DB	'size of array `%s'' has non-integer type', 00H
$SG1474	DB	'ANSI C forbids zero-size array `%s''', 00H
$SG1478	DB	'size of array `%s'' is negative', 00H
	ORG $+1
$SG1481	DB	'ANSI C forbids variable-size array `%s''', 00H
$SG1483	DB	'array type has incomplete element type', 00H
	ORG $+1
$SG1492	DB	'function declared to return const or volatile result', 00H
	ORG $+3
$SG1494	DB	'`%s'' declared as function returning a function', 00H
	ORG $+1
$SG1496	DB	'`%s'' declared as function returning an array', 00H
	ORG $+3
$SG1513	DB	'invalid type modifier within pointer declarator', 00H
$SG1515	DB	'duplicate `const''', 00H
	ORG $+2
$SG1517	DB	'duplicate `volatile''', 00H
	ORG $+3
$SG1530	DB	'variable or field `%s'' declared void', 00H
	ORG $+3
$SG1538	DB	'ANSI C forbids const or volatile function types', 00H
$SG1540	DB	'parameter `%s'' is initialized', 00H
	ORG $+2
$SG1550	DB	'field `%s'' declared as a function', 00H
	ORG $+2
$SG1553	DB	'field `%s'' has incomplete type', 00H
	ORG $+1
$SG1559	DB	'invalid storage class for function `%s''', 00H
$SG1561	DB	'invalid storage class for function `%s''', 00H
$SG1565	DB	'main', 00H
	ORG $+3
$SG1566	DB	'cannot inline function `main''', 00H
	ORG $+2
$SG1569	DB	'inline declaration ignored for function with `...''', 00H
	ORG $+1
$SG1576	DB	'variable `%s'' declared `inline''', 00H
$SG1580	DB	'`%s'' has both `extern'' and initializer', 00H
_DATA	ENDS
_TEXT	SEGMENT
_i$1353 = -68
_id$1354 = -64
_arg_types$1488 = -88
_nclasses$1427 = -76
_last$1563 = -104
_typemodlist$1503 = -96
_erred$1504 = -92
_t$1377 = -72
_declarator$ = 8
_declspecs$ = 12
_decl_context$ = 16
_initialized$ = 20
_specbits$ = -20
_spec$ = -12
_type$ = -40
_longlong$ = -56
_constp$ = -48
_volatilep$ = -28
_inlinep$ = -24
_explicit_int$ = -8
_explicit_char$ = -16
_name$ = -44
_typedef_type$ = -32
_funcdef_flag$ = -36
_resume_temporary$ = -52
_innermost_code$ = -4
_itype$1461 = -80
_size$1462 = -84
_decl$1335 = -60
_decl$1531 = -100
_grokdeclarator PROC NEAR
; Line 2220
	push	ebp
	mov	ebp, esp
	sub	esp, 116				; 00000074H
	push	ebx
	push	esi
	push	edi
; Line 2221
	mov	DWORD PTR _specbits$[ebp], 0
; Line 2223
	mov	DWORD PTR _type$[ebp], 0
; Line 2224
	mov	DWORD PTR _longlong$[ebp], 0
; Line 2228
	mov	DWORD PTR _explicit_int$[ebp], 0
; Line 2229
	mov	DWORD PTR _explicit_char$[ebp], 0
; Line 2231
	mov	DWORD PTR _typedef_type$[ebp], 0
; Line 2232
	mov	DWORD PTR _funcdef_flag$[ebp], 0
; Line 2233
	mov	DWORD PTR _resume_temporary$[ebp], 0
; Line 2234
	mov	DWORD PTR _innermost_code$[ebp], 0
; Line 2236
	cmp	DWORD PTR _decl_context$[ebp], 1
	jne	$L1333
; Line 2237
	mov	DWORD PTR _funcdef_flag$[ebp], 1
	mov	DWORD PTR _decl_context$[ebp], 0
; Line 2239
$L1333:
	cmp	DWORD PTR _flag_traditional, 0
	je	$L1334
	call	_allocation_temporary_p
	or	eax, eax
	je	$L1334
; Line 2241
	mov	DWORD PTR _resume_temporary$[ebp], 1
; Line 2242
	call	_end_temporary_allocation
; Line 2247
$L1334:
; Line 2248
	mov	eax, DWORD PTR _declarator$[ebp]
	mov	DWORD PTR _decl$1335[ebp], eax
; Line 2249
	mov	DWORD PTR _name$[ebp], 0
; Line 2251
$L1337:
	cmp	DWORD PTR _decl$1335[ebp], 0
	je	$L1338
; Line 2252
	mov	eax, DWORD PTR _decl$1335[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR -116+[ebp], eax
	jmp	$L1339
; Line 2254
$L1343:
; Line 2257
	mov	eax, DWORD PTR _decl$1335[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _innermost_code$[ebp], eax
; Line 2258
	mov	eax, DWORD PTR _decl$1335[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _decl$1335[ebp], eax
; Line 2259
	jmp	$L1340
; Line 2261
$L1344:
; Line 2262
	mov	eax, DWORD PTR _decl$1335[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _name$[ebp], eax
; Line 2263
	mov	DWORD PTR _decl$1335[ebp], 0
; Line 2264
	jmp	$L1340
; Line 2266
$L1345:
; Line 2267
	call	_abort
; Line 2268
	jmp	$L1340
$L1339:
	cmp	DWORD PTR -116+[ebp], 1
	je	$L1344
	cmp	DWORD PTR -116+[ebp], 48		; 00000030H
	je	$L1343
	cmp	DWORD PTR -116+[ebp], 51		; 00000033H
	je	$L1343
	cmp	DWORD PTR -116+[ebp], 61		; 0000003dH
	je	$L1343
	jmp	$L1345
$L1340:
	jmp	$L1337
$L1338:
; Line 2269
	cmp	DWORD PTR _name$[ebp], 0
	jne	$L1346
; Line 2270
	mov	DWORD PTR _name$[ebp], OFFSET $SG1347
; Line 2271
$L1346:
; Line 2276
	cmp	DWORD PTR _funcdef_flag$[ebp], 0
	je	$L1348
	cmp	DWORD PTR _innermost_code$[ebp], 61	; 0000003dH
	je	$L1348
; Line 2277
	sub	eax, eax
	jmp	$L1318
; Line 2283
$L1348:
; Line 2284
	cmp	DWORD PTR _decl_context$[ebp], 0
	jne	$L1349
	mov	eax, DWORD PTR _current_binding_level$S719
	mov	ecx, DWORD PTR _global_binding_level$S721
	cmp	DWORD PTR [eax+16], ecx
	jne	$L1349
; Line 2285
	mov	DWORD PTR _decl_context$[ebp], 2
; Line 2301
$L1349:
	mov	eax, DWORD PTR _declspecs$[ebp]
	mov	DWORD PTR _spec$[ebp], eax
	jmp	$L1350
$L1351:
	mov	eax, DWORD PTR _spec$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _spec$[ebp], eax
$L1350:
	cmp	DWORD PTR _spec$[ebp], 0
	je	$L1352
; Line 2304
	mov	eax, DWORD PTR _spec$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _id$1354[ebp], eax
; Line 2306
	mov	eax, DWORD PTR _id$1354[ebp]
	cmp	DWORD PTR _ridpointers+4, eax
	jne	$L1355
; Line 2307
	mov	DWORD PTR _explicit_int$[ebp], 1
; Line 2308
$L1355:
	mov	eax, DWORD PTR _id$1354[ebp]
	cmp	DWORD PTR _ridpointers+8, eax
	jne	$L1356
; Line 2309
	mov	DWORD PTR _explicit_char$[ebp], 1
; Line 2311
$L1356:
	mov	eax, DWORD PTR _id$1354[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 1
	jne	$L1357
; Line 2312
	mov	DWORD PTR _i$1353[ebp], 7
	jmp	$L1358
$L1359:
	inc	DWORD PTR _i$1353[ebp]
$L1358:
	cmp	DWORD PTR _i$1353[ebp], 20		; 00000014H
	jge	$L1360
; Line 2314
	mov	eax, DWORD PTR _i$1353[ebp]
	mov	ecx, DWORD PTR _id$1354[ebp]
	cmp	DWORD PTR _ridpointers[eax*4], ecx
	jne	$L1361
; Line 2316
	cmp	DWORD PTR _i$1353[ebp], 9
	jne	$L1362
	mov	eax, 1
	mov	cl, BYTE PTR _i$1353[ebp]
	shl	eax, cl
	test	eax, DWORD PTR _specbits$[ebp]
	je	$L1362
; Line 2318
	cmp	DWORD PTR _pedantic, 0
	je	$L1363
; Line 2319
	mov	eax, DWORD PTR _id$1354[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	OFFSET $SG1364
	call	_warning
	add	esp, 8
; Line 2320
	jmp	$L1365
$L1363:
	cmp	DWORD PTR _longlong$[ebp], 0
	je	$L1366
; Line 2321
	push	OFFSET $SG1367
	call	_warning
	add	esp, 4
; Line 2322
	jmp	$L1368
$L1366:
; Line 2323
	mov	DWORD PTR _longlong$[ebp], 1
$L1368:
$L1365:
; Line 2325
	jmp	$L1369
$L1362:
	mov	eax, 1
	mov	cl, BYTE PTR _i$1353[ebp]
	shl	eax, cl
	test	eax, DWORD PTR _specbits$[ebp]
	je	$L1370
; Line 2326
	mov	eax, DWORD PTR _id$1354[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	OFFSET $SG1371
	call	_warning
	add	esp, 8
; Line 2327
$L1370:
$L1369:
	mov	eax, 1
	mov	cl, BYTE PTR _i$1353[ebp]
	shl	eax, cl
	or	DWORD PTR _specbits$[ebp], eax
; Line 2328
	jmp	$found$1372
; Line 2330
$L1361:
	jmp	$L1359
$L1360:
; Line 2331
$L1357:
	cmp	DWORD PTR _type$[ebp], 0
	je	$L1373
; Line 2332
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	push	OFFSET $SG1374
	call	_error
	add	esp, 8
; Line 2333
	jmp	$L1375
$L1373:
	mov	eax, DWORD PTR _id$1354[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 1
	jne	$L1376
; Line 2335
	mov	eax, DWORD PTR _id$1354[ebp]
	push	eax
	call	_lookup_name
	add	esp, 4
	mov	DWORD PTR _t$1377[ebp], eax
; Line 2336
	cmp	DWORD PTR _t$1377[ebp], 0
	je	$L1379
	mov	eax, DWORD PTR _t$1377[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 42					; 0000002aH
	je	$L1378
$L1379:
; Line 2338
	mov	eax, DWORD PTR _id$1354[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	OFFSET $SG1380
	call	_error
	add	esp, 8
; Line 2339
	jmp	$L1381
$L1378:
	mov	eax, DWORD PTR _t$1377[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _type$[ebp], eax
$L1381:
; Line 2341
	jmp	$L1382
$L1376:
	mov	eax, DWORD PTR _id$1354[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L1383
; Line 2342
	mov	eax, DWORD PTR _id$1354[ebp]
	mov	DWORD PTR _type$[ebp], eax
; Line 2344
$L1383:
$L1382:
$L1375:
$found$1372:
; Line 2345
	jmp	$L1351
$L1352:
; Line 2347
	mov	eax, DWORD PTR _type$[ebp]
	mov	DWORD PTR _typedef_type$[ebp], eax
; Line 2352
	cmp	DWORD PTR _type$[ebp], 0
	jne	$L1384
; Line 2356
	cmp	DWORD PTR _funcdef_flag$[ebp], 0
	je	$L1385
	cmp	DWORD PTR _warn_return_type, 0
	je	$L1385
	test	DWORD PTR _specbits$[ebp], 33664	; 00008380H
	jne	$L1385
; Line 2357
	mov	DWORD PTR _warn_about_return_type$S716, 1
; Line 2358
$L1385:
	mov	DWORD PTR _explicit_int$[ebp], 1
; Line 2359
	mov	eax, DWORD PTR _integer_type_node
	mov	DWORD PTR _type$[ebp], eax
; Line 2367
$L1384:
	test	BYTE PTR _specbits$[ebp+1], 2
	je	$L1386
	mov	eax, DWORD PTR _double_type_node
	cmp	DWORD PTR _type$[ebp], eax
	jne	$L1386
; Line 2369
	and	DWORD PTR _specbits$[ebp], -513		; fffffdffH
; Line 2370
	mov	eax, DWORD PTR _long_double_type_node
	mov	DWORD PTR _type$[ebp], eax
; Line 2375
$L1386:
; Line 2376
	test	DWORD PTR _specbits$[ebp], 33664	; 00008380H
	je	$L1387
; Line 2378
	mov	eax, DWORD PTR _type$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 6
	jne	$L1388
; Line 2379
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	push	OFFSET $SG1389
	call	_error
	add	esp, 8
; Line 2380
	jmp	$L1390
$L1388:
	mov	eax, DWORD PTR _type$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 5
	je	$L1391
; Line 2381
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	push	OFFSET $SG1392
	call	_error
	add	esp, 8
; Line 2382
	jmp	$L1393
$L1391:
; Line 2383
	test	BYTE PTR _specbits$[ebp+1], 2
	je	$L1394
	test	BYTE PTR _specbits$[ebp+1], 1
	je	$L1394
; Line 2384
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	push	OFFSET $SG1395
	call	_error
	add	esp, 8
; Line 2385
	jmp	$L1396
$L1394:
; Line 2387
	test	BYTE PTR _specbits$[ebp+1], 2
	jne	$L1398
	test	BYTE PTR _specbits$[ebp+1], 1
	je	$L1397
$L1398:
	cmp	DWORD PTR _explicit_char$[ebp], 0
	je	$L1397
; Line 2388
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	push	OFFSET $SG1399
	call	_error
	add	esp, 8
; Line 2389
	jmp	$L1400
$L1397:
; Line 2390
	test	BYTE PTR _specbits$[ebp+1], 128		; 00000080H
	je	$L1401
	test	BYTE PTR _specbits$[ebp], 128		; 00000080H
	je	$L1401
; Line 2391
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	push	OFFSET $SG1402
	call	_error
	add	esp, 8
; Line 2392
	jmp	$L1403
$L1401:
; Line 2394
	cmp	DWORD PTR _explicit_int$[ebp], 0
	jne	$L1404
	cmp	DWORD PTR _explicit_char$[ebp], 0
	jne	$L1404
	cmp	DWORD PTR _pedantic, 0
	je	$L1404
; Line 2396
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	push	OFFSET $SG1405
	call	_warning
	add	esp, 8
; Line 2397
$L1404:
	test	BYTE PTR _specbits$[ebp], 128		; 00000080H
	je	$L1406
; Line 2399
	cmp	DWORD PTR _longlong$[ebp], 0
	je	$L1407
; Line 2400
	mov	eax, DWORD PTR _long_long_unsigned_type_node
	mov	DWORD PTR _type$[ebp], eax
; Line 2401
	jmp	$L1408
$L1407:
	test	BYTE PTR _specbits$[ebp+1], 2
	je	$L1409
; Line 2402
	mov	eax, DWORD PTR _long_unsigned_type_node
	mov	DWORD PTR _type$[ebp], eax
; Line 2403
	jmp	$L1410
$L1409:
	test	BYTE PTR _specbits$[ebp+1], 1
	je	$L1411
; Line 2404
	mov	eax, DWORD PTR _short_unsigned_type_node
	mov	DWORD PTR _type$[ebp], eax
; Line 2405
	jmp	$L1412
$L1411:
	mov	eax, DWORD PTR _char_type_node
	cmp	DWORD PTR _type$[ebp], eax
	jne	$L1413
; Line 2406
	mov	eax, DWORD PTR _unsigned_char_type_node
	mov	DWORD PTR _type$[ebp], eax
; Line 2407
	jmp	$L1414
$L1413:
; Line 2408
	mov	eax, DWORD PTR _unsigned_type_node
	mov	DWORD PTR _type$[ebp], eax
$L1414:
$L1412:
$L1410:
$L1408:
; Line 2410
	jmp	$L1415
$L1406:
; Line 2411
	test	BYTE PTR _specbits$[ebp+1], 128		; 00000080H
	je	$L1416
	mov	eax, DWORD PTR _char_type_node
	cmp	DWORD PTR _type$[ebp], eax
	jne	$L1416
; Line 2412
	mov	eax, DWORD PTR _signed_char_type_node
	mov	DWORD PTR _type$[ebp], eax
; Line 2413
	jmp	$L1417
$L1416:
	cmp	DWORD PTR _longlong$[ebp], 0
	je	$L1418
; Line 2414
	mov	eax, DWORD PTR _long_long_integer_type_node
	mov	DWORD PTR _type$[ebp], eax
; Line 2415
	jmp	$L1419
$L1418:
	test	BYTE PTR _specbits$[ebp+1], 2
	je	$L1420
; Line 2416
	mov	eax, DWORD PTR _long_integer_type_node
	mov	DWORD PTR _type$[ebp], eax
; Line 2417
	jmp	$L1421
$L1420:
	test	BYTE PTR _specbits$[ebp+1], 1
	je	$L1422
; Line 2418
	mov	eax, DWORD PTR _short_integer_type_node
	mov	DWORD PTR _type$[ebp], eax
; Line 2419
$L1422:
$L1421:
$L1419:
$L1417:
$L1415:
$L1403:
$L1400:
$L1396:
$L1393:
$L1390:
; Line 2426
$L1387:
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 5
	and	eax, 1
	mov	ecx, DWORD PTR _specbits$[ebp]
	and	ecx, 65536				; 00010000H
	cmp	ecx, 1
	sbb	ecx, ecx
	inc	ecx
	add	eax, ecx
	mov	DWORD PTR _constp$[ebp], eax
; Line 2427
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 3
	and	eax, 1
	mov	ecx, DWORD PTR _specbits$[ebp]
	and	ecx, 131072				; 00020000H
	cmp	ecx, 1
	sbb	ecx, ecx
	inc	ecx
	add	eax, ecx
	mov	DWORD PTR _volatilep$[ebp], eax
; Line 2428
	mov	eax, DWORD PTR _specbits$[ebp]
	and	eax, 262144				; 00040000H
	cmp	eax, 1
	sbb	eax, eax
	inc	eax
	mov	DWORD PTR _inlinep$[ebp], eax
; Line 2429
	cmp	DWORD PTR _constp$[ebp], 1
	jle	$L1423
; Line 2430
	push	OFFSET $SG1424
	call	_warning
	add	esp, 4
; Line 2431
$L1423:
	cmp	DWORD PTR _volatilep$[ebp], 1
	jle	$L1425
; Line 2432
	push	OFFSET $SG1426
	call	_warning
	add	esp, 4
; Line 2433
$L1425:
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+68]
	mov	DWORD PTR _type$[ebp], eax
; Line 2438
	mov	DWORD PTR _nclasses$1427[ebp], 0
; Line 2440
	test	BYTE PTR _specbits$[ebp+1], 4
	je	$L1428
	inc	DWORD PTR _nclasses$1427[ebp]
; Line 2441
$L1428:
	test	BYTE PTR _specbits$[ebp+1], 8
	je	$L1429
	inc	DWORD PTR _nclasses$1427[ebp]
; Line 2442
$L1429:
	test	BYTE PTR _specbits$[ebp+1], 16		; 00000010H
	je	$L1430
	inc	DWORD PTR _nclasses$1427[ebp]
; Line 2443
$L1430:
	test	BYTE PTR _specbits$[ebp+1], 32		; 00000020H
	je	$L1431
	inc	DWORD PTR _nclasses$1427[ebp]
; Line 2444
$L1431:
	test	BYTE PTR _specbits$[ebp+1], 64		; 00000040H
	je	$L1432
	inc	DWORD PTR _nclasses$1427[ebp]
; Line 2449
$L1432:
	cmp	DWORD PTR _nclasses$1427[ebp], 1
	jle	$L1433
; Line 2450
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	push	OFFSET $SG1434
	call	_error
	add	esp, 8
; Line 2451
	jmp	$L1435
$L1433:
; Line 2455
	cmp	DWORD PTR _funcdef_flag$[ebp], 0
	je	$L1436
	test	BYTE PTR _specbits$[ebp+1], 100		; 00000064H
	je	$L1436
; Line 2457
	test	BYTE PTR _specbits$[ebp+1], 4
	je	$L1437
; Line 2458
	push	OFFSET $SG1438
	call	_error
	add	esp, 4
; Line 2459
$L1437:
	test	BYTE PTR _specbits$[ebp+1], 32		; 00000020H
	je	$L1439
; Line 2460
	push	OFFSET $SG1440
	call	_error
	add	esp, 4
; Line 2461
$L1439:
	test	BYTE PTR _specbits$[ebp+1], 64		; 00000040H
	je	$L1441
; Line 2462
	push	OFFSET $SG1442
	call	_error
	add	esp, 4
; Line 2463
$L1441:
; Line 2464
	and	DWORD PTR _specbits$[ebp], -25601	; ffff9bffH
; Line 2466
	jmp	$L1443
$L1436:
	cmp	DWORD PTR _decl_context$[ebp], 0
	je	$L1444
	cmp	DWORD PTR _nclasses$1427[ebp], 0
	jle	$L1444
; Line 2468
	cmp	DWORD PTR _decl_context$[ebp], 2
	jne	$L1445
	test	BYTE PTR _specbits$[ebp+1], 32		; 00000020H
	je	$L1445
; Line 2470
	jmp	$L1446
$L1445:
; Line 2477
	cmp	DWORD PTR _decl_context$[ebp], 3
	jne	$L1963
	mov	DWORD PTR -108+[ebp], OFFSET $SG1447
	jmp	$L1964
$L1963:
	mov	eax, OFFSET $SG1448
	cmp	DWORD PTR _decl_context$[ebp], 2
	je	$L1969
	mov	eax, OFFSET $SG1449
$L1969:
	mov	DWORD PTR -108+[ebp], eax
$L1964:
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	mov	eax, DWORD PTR -108+[ebp]
	push	eax
	call	_error
	add	esp, 8
; Line 2480
	and	DWORD PTR _specbits$[ebp], -31745	; ffff83ffH
; Line 2481
$L1446:
; Line 2483
	jmp	$L1450
$L1444:
; Line 2484
	test	BYTE PTR _specbits$[ebp+1], 16		; 00000010H
	je	$L1451
	cmp	DWORD PTR _initialized$[ebp], 0
	je	$L1451
	cmp	DWORD PTR _funcdef_flag$[ebp], 0
	jne	$L1451
; Line 2485
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	push	OFFSET $SG1452
	call	_warning
	add	esp, 8
; Line 2486
	jmp	$L1453
$L1451:
; Line 2487
	mov	eax, DWORD PTR _current_binding_level$S719
	cmp	DWORD PTR _global_binding_level$S721, eax
	jne	$L1454
	test	BYTE PTR _specbits$[ebp+1], 4
	je	$L1454
; Line 2488
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	push	OFFSET $SG1455
	call	_error
	add	esp, 8
; Line 2489
$L1454:
$L1453:
$L1450:
$L1443:
$L1435:
; Line 2495
$L1457:
	cmp	DWORD PTR _declarator$[ebp], 0
	je	$L1458
	mov	eax, DWORD PTR _declarator$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 1
	je	$L1458
; Line 2497
	mov	eax, DWORD PTR _type$[ebp]
	cmp	DWORD PTR _error_mark_node, eax
	jne	$L1459
; Line 2499
	mov	eax, DWORD PTR _declarator$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _declarator$[ebp], eax
; Line 2500
	jmp	$L1457
; Line 2517
$L1459:
	mov	eax, DWORD PTR _declarator$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 51					; 00000033H
	jne	$L1460
; Line 2519
	mov	DWORD PTR _itype$1461[ebp], 0
; Line 2520
	mov	eax, DWORD PTR _declarator$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR _size$1462[ebp], eax
; Line 2522
	mov	eax, DWORD PTR _declarator$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _declarator$[ebp], eax
; Line 2526
	mov	eax, DWORD PTR _type$[ebp]
	cmp	DWORD PTR _void_type_node, eax
	jne	$L1463
; Line 2528
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	push	OFFSET $SG1464
	call	_error
	add	esp, 8
; Line 2529
	mov	eax, DWORD PTR _error_mark_node
	mov	DWORD PTR _type$[ebp], eax
; Line 2532
$L1463:
	mov	eax, DWORD PTR _type$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 21					; 00000015H
	jne	$L1465
; Line 2534
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	push	OFFSET $SG1466
	call	_error
	add	esp, 8
; Line 2535
	mov	eax, DWORD PTR _error_mark_node
	mov	DWORD PTR _type$[ebp], eax
; Line 2538
$L1465:
	mov	eax, DWORD PTR _size$1462[ebp]
	cmp	DWORD PTR _error_mark_node, eax
	jne	$L1467
; Line 2539
	mov	eax, DWORD PTR _error_mark_node
	mov	DWORD PTR _type$[ebp], eax
; Line 2541
$L1467:
	mov	eax, DWORD PTR _type$[ebp]
	cmp	DWORD PTR _error_mark_node, eax
	jne	$L1468
; Line 2542
	jmp	$L1457
; Line 2548
$L1468:
	cmp	DWORD PTR _size$1462[ebp], 0
	je	$L1469
; Line 2552
	mov	eax, DWORD PTR _size$1462[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 113				; 00000071H
	jne	$L1470
	mov	eax, DWORD PTR _size$1462[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	ecx, DWORD PTR _size$1462[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	cmp	DWORD PTR [eax+8], ecx
	jne	$L1470
; Line 2553
	mov	eax, DWORD PTR _size$1462[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _size$1462[ebp], eax
; Line 2555
$L1470:
; Line 2556
	mov	eax, DWORD PTR _size$1462[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 5
	je	$L1471
	mov	eax, DWORD PTR _size$1462[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 8
	je	$L1471
; Line 2558
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	push	OFFSET $SG1472
	call	_error
	add	esp, 8
; Line 2559
	mov	eax, DWORD PTR _integer_one_node
	mov	DWORD PTR _size$1462[ebp], eax
; Line 2561
$L1471:
	cmp	DWORD PTR _pedantic, 0
	je	$L1473
	mov	eax, DWORD PTR _size$1462[ebp]
	push	eax
	call	_integer_zerop
	add	esp, 4
	or	eax, eax
	je	$L1473
; Line 2562
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	push	OFFSET $SG1474
	call	_warning
	add	esp, 8
; Line 2563
$L1473:
	mov	eax, DWORD PTR _size$1462[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L1475
; Line 2565
	mov	eax, DWORD PTR _integer_zero_node
	mov	ecx, DWORD PTR _size$1462[ebp]
	mov	ecx, DWORD PTR [ecx+24]
	cmp	DWORD PTR [eax+24], ecx
	jg	$L1477
	mov	eax, DWORD PTR _integer_zero_node
	mov	ecx, DWORD PTR _size$1462[ebp]
	mov	ecx, DWORD PTR [ecx+24]
	cmp	DWORD PTR [eax+24], ecx
	jne	$L1476
	mov	eax, DWORD PTR _integer_zero_node
	mov	ecx, DWORD PTR _size$1462[ebp]
	mov	ecx, DWORD PTR [ecx+20]
	cmp	DWORD PTR [eax+20], ecx
	jbe	$L1476
$L1477:
; Line 2567
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	push	OFFSET $SG1478
	call	_error
	add	esp, 8
; Line 2568
	mov	eax, DWORD PTR _integer_one_node
	mov	DWORD PTR _size$1462[ebp], eax
; Line 2570
$L1476:
	push	0
	mov	eax, DWORD PTR _size$1462[ebp]
	mov	eax, DWORD PTR [eax+20]
	dec	eax
	push	eax
	call	_build_int_2
	add	esp, 8
	push	eax
	call	_build_index_type
	add	esp, 4
	mov	DWORD PTR _itype$1461[ebp], eax
; Line 2572
	jmp	$L1479
$L1475:
; Line 2574
	cmp	DWORD PTR _pedantic, 0
	je	$L1480
; Line 2575
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	push	OFFSET $SG1481
	call	_warning
	add	esp, 8
; Line 2576
$L1480:
	mov	eax, DWORD PTR _integer_one_node
	push	eax
	mov	eax, DWORD PTR _size$1462[ebp]
	push	eax
	push	65					; 00000041H
	call	_build_binary_op
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _itype$1461[ebp], eax
; Line 2577
	mov	eax, DWORD PTR _itype$1461[ebp]
	push	eax
	call	_build_index_type
	add	esp, 4
	mov	DWORD PTR _itype$1461[ebp], eax
; Line 2578
$L1479:
; Line 2583
$L1469:
; Line 2584
	mov	eax, DWORD PTR _type$[ebp]
	cmp	DWORD PTR [eax+28], 0
	jne	$L1482
	test	BYTE PTR _specbits$[ebp+1], 64		; 00000040H
	jne	$L1482
; Line 2585
	push	OFFSET $SG1483
	call	_warning
	add	esp, 4
; Line 2590
$L1482:
	cmp	DWORD PTR _constp$[ebp], 0
	jne	$L1485
	cmp	DWORD PTR _volatilep$[ebp], 0
	je	$L1484
$L1485:
; Line 2591
	mov	eax, DWORD PTR _volatilep$[ebp]
	push	eax
	mov	eax, DWORD PTR _constp$[ebp]
	push	eax
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_c_build_type_variant
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _type$[ebp], eax
; Line 2599
$L1484:
	mov	eax, DWORD PTR _itype$1461[ebp]
	push	eax
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_build_array_type
	add	esp, 8
	mov	DWORD PTR _type$[ebp], eax
; Line 2601
	jmp	$L1486
$L1460:
	mov	eax, DWORD PTR _declarator$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 61					; 0000003dH
	jne	$L1487
; Line 2607
	mov	eax, DWORD PTR _type$[ebp]
	cmp	DWORD PTR _error_mark_node, eax
	jne	$L1489
; Line 2608
	jmp	$L1457
; Line 2610
$L1489:
	cmp	DWORD PTR _pedantic, 0
	je	$L1490
	cmp	DWORD PTR _constp$[ebp], 0
	jne	$L1491
	cmp	DWORD PTR _volatilep$[ebp], 0
	je	$L1490
$L1491:
; Line 2611
	push	OFFSET $SG1492
	call	_warning
	add	esp, 4
; Line 2615
$L1490:
	mov	eax, DWORD PTR _type$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 21					; 00000015H
	jne	$L1493
; Line 2617
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	push	OFFSET $SG1494
	call	_error
	add	esp, 8
; Line 2618
	mov	eax, DWORD PTR _integer_type_node
	mov	DWORD PTR _type$[ebp], eax
; Line 2620
$L1493:
	mov	eax, DWORD PTR _type$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 16					; 00000010H
	jne	$L1495
; Line 2622
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	push	OFFSET $SG1496
	call	_error
	add	esp, 8
; Line 2623
	mov	eax, DWORD PTR _integer_type_node
	mov	DWORD PTR _type$[ebp], eax
; Line 2628
$L1495:
	cmp	DWORD PTR _flag_traditional, 0
	je	$L1497
	mov	eax, DWORD PTR _type$[ebp]
	cmp	DWORD PTR _float_type_node, eax
	jne	$L1497
; Line 2629
	mov	eax, DWORD PTR _double_type_node
	mov	DWORD PTR _type$[ebp], eax
; Line 2634
$L1497:
; Line 2639
	cmp	DWORD PTR _funcdef_flag$[ebp], 0
	je	$L1965
	mov	eax, DWORD PTR _declarator$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 1
	jne	$L1965
	mov	DWORD PTR -112+[ebp], 1
	jmp	$L1966
$L1965:
	mov	DWORD PTR -112+[ebp], 0
$L1966:
	mov	eax, DWORD PTR -112+[ebp]
	push	eax
	mov	eax, DWORD PTR _declarator$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	call	_grokparms
	add	esp, 8
	mov	DWORD PTR _arg_types$1488[ebp], eax
; Line 2649
	mov	eax, DWORD PTR _arg_types$1488[ebp]
	push	eax
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_build_function_type
	add	esp, 8
	mov	DWORD PTR _type$[ebp], eax
; Line 2650
	mov	eax, DWORD PTR _declarator$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _declarator$[ebp], eax
; Line 2652
	jmp	$L1498
$L1487:
	mov	eax, DWORD PTR _declarator$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 48					; 00000030H
	jne	$L1499
; Line 2657
	cmp	DWORD PTR _constp$[ebp], 0
	jne	$L1501
	cmp	DWORD PTR _volatilep$[ebp], 0
	je	$L1500
$L1501:
; Line 2658
	mov	eax, DWORD PTR _volatilep$[ebp]
	push	eax
	mov	eax, DWORD PTR _constp$[ebp]
	push	eax
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_c_build_type_variant
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _type$[ebp], eax
; Line 2659
$L1500:
	mov	DWORD PTR _constp$[ebp], 0
; Line 2660
	mov	DWORD PTR _volatilep$[ebp], 0
; Line 2662
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_build_pointer_type
	add	esp, 4
	mov	DWORD PTR _type$[ebp], eax
; Line 2667
	mov	eax, DWORD PTR _declarator$[ebp]
	cmp	DWORD PTR [eax+8], 0
	je	$L1502
; Line 2670
	mov	DWORD PTR _erred$1504[ebp], 0
; Line 2672
	mov	eax, DWORD PTR _declarator$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _typemodlist$1503[ebp], eax
	jmp	$L1505
$L1506:
	mov	eax, DWORD PTR _typemodlist$1503[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _typemodlist$1503[ebp], eax
$L1505:
	cmp	DWORD PTR _typemodlist$1503[ebp], 0
	je	$L1507
; Line 2674
	mov	eax, DWORD PTR _typemodlist$1503[ebp]
	mov	ecx, DWORD PTR _ridpointers+64
	cmp	DWORD PTR [eax+24], ecx
	jne	$L1508
; Line 2675
	inc	DWORD PTR _constp$[ebp]
; Line 2676
	jmp	$L1509
$L1508:
	mov	eax, DWORD PTR _typemodlist$1503[ebp]
	mov	ecx, DWORD PTR _ridpointers+68
	cmp	DWORD PTR [eax+24], ecx
	jne	$L1510
; Line 2677
	inc	DWORD PTR _volatilep$[ebp]
; Line 2678
	jmp	$L1511
$L1510:
	cmp	DWORD PTR _erred$1504[ebp], 0
	jne	$L1512
; Line 2680
	mov	DWORD PTR _erred$1504[ebp], 1
; Line 2681
	push	OFFSET $SG1513
	call	_error
	add	esp, 4
; Line 2683
$L1512:
$L1511:
$L1509:
	jmp	$L1506
$L1507:
; Line 2684
	cmp	DWORD PTR _constp$[ebp], 1
	jle	$L1514
; Line 2685
	push	OFFSET $SG1515
	call	_warning
	add	esp, 4
; Line 2686
$L1514:
	cmp	DWORD PTR _volatilep$[ebp], 1
	jle	$L1516
; Line 2687
	push	OFFSET $SG1517
	call	_warning
	add	esp, 4
; Line 2688
$L1516:
; Line 2690
$L1502:
	mov	eax, DWORD PTR _declarator$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _declarator$[ebp], eax
; Line 2692
	jmp	$L1518
$L1499:
; Line 2693
	call	_abort
$L1518:
$L1498:
$L1486:
; Line 2699
	mov	eax, DWORD PTR _type$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 39					; 00000027H
	jne	$L1519
; Line 2703
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+32]
	and	eax, -252				; ffffff04H
	or	eax, 4
	mov	ecx, DWORD PTR _type$[ebp]
	mov	DWORD PTR [ecx+32], eax
; Line 2705
$L1519:
	jmp	$L1457
$L1458:
; Line 2711
	test	BYTE PTR _specbits$[ebp+1], 64		; 00000040H
	je	$L1520
; Line 2715
	cmp	DWORD PTR _constp$[ebp], 0
	jne	$L1522
	cmp	DWORD PTR _volatilep$[ebp], 0
	je	$L1521
$L1522:
; Line 2716
	mov	eax, DWORD PTR _volatilep$[ebp]
	push	eax
	mov	eax, DWORD PTR _constp$[ebp]
	push	eax
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_c_build_type_variant
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _type$[ebp], eax
; Line 2717
$L1521:
	cmp	DWORD PTR _resume_temporary$[ebp], 0
	je	$L1523
; Line 2718
	call	_resume_temporary_allocation
; Line 2719
$L1523:
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	mov	eax, DWORD PTR _declarator$[ebp]
	push	eax
	push	42					; 0000002aH
	call	_build_decl
	add	esp, 12					; 0000000cH
	jmp	$L1318
; Line 2728
$L1520:
; Line 2730
	cmp	DWORD PTR _type$[ebp], 0
	je	$L1524
	cmp	DWORD PTR _typedef_type$[ebp], 0
	je	$L1524
	mov	eax, DWORD PTR _typedef_type$[ebp]
	mov	ecx, DWORD PTR _type$[ebp]
	mov	ecx, DWORD PTR [ecx+68]
	cmp	DWORD PTR [eax+68], ecx
	jne	$L1524
	mov	eax, DWORD PTR _type$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 16					; 00000010H
	jne	$L1524
	mov	eax, DWORD PTR _type$[ebp]
	cmp	DWORD PTR [eax+20], 0
	jne	$L1524
; Line 2731
	push	0
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_build_array_type
	add	esp, 8
	mov	DWORD PTR _type$[ebp], eax
; Line 2736
$L1524:
	cmp	DWORD PTR _decl_context$[ebp], 4
	jne	$L1525
; Line 2740
	cmp	DWORD PTR _constp$[ebp], 0
	jne	$L1527
	cmp	DWORD PTR _volatilep$[ebp], 0
	je	$L1526
$L1527:
; Line 2741
	mov	eax, DWORD PTR _volatilep$[ebp]
	push	eax
	mov	eax, DWORD PTR _constp$[ebp]
	push	eax
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_c_build_type_variant
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _type$[ebp], eax
; Line 2742
$L1526:
	cmp	DWORD PTR _resume_temporary$[ebp], 0
	je	$L1528
; Line 2743
	call	_resume_temporary_allocation
; Line 2744
$L1528:
	mov	eax, DWORD PTR _type$[ebp]
	jmp	$L1318
; Line 2752
$L1525:
	mov	eax, DWORD PTR _type$[ebp]
	cmp	DWORD PTR _void_type_node, eax
	jne	$L1529
	cmp	DWORD PTR _decl_context$[ebp], 2
	je	$L1529
; Line 2755
	mov	eax, DWORD PTR _declarator$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	OFFSET $SG1530
	call	_error
	add	esp, 8
; Line 2756
	mov	eax, DWORD PTR _integer_type_node
	mov	DWORD PTR _type$[ebp], eax
; Line 2762
$L1529:
; Line 2765
	cmp	DWORD PTR _decl_context$[ebp], 2
	jne	$L1532
; Line 2770
	mov	eax, DWORD PTR _type$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 16					; 00000010H
	jne	$L1533
; Line 2774
	mov	eax, DWORD PTR _volatilep$[ebp]
	push	eax
	mov	eax, DWORD PTR _constp$[ebp]
	push	eax
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_c_build_type_variant
	add	esp, 12					; 0000000cH
	push	eax
	call	_build_pointer_type
	add	esp, 4
	mov	DWORD PTR _type$[ebp], eax
; Line 2775
	mov	DWORD PTR _constp$[ebp], 0
	mov	eax, DWORD PTR _constp$[ebp]
	mov	DWORD PTR _volatilep$[ebp], eax
; Line 2777
	jmp	$L1534
$L1533:
	mov	eax, DWORD PTR _type$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 21					; 00000015H
	jne	$L1535
; Line 2779
	cmp	DWORD PTR _pedantic, 0
	je	$L1536
	cmp	DWORD PTR _constp$[ebp], 0
	jne	$L1537
	cmp	DWORD PTR _volatilep$[ebp], 0
	je	$L1536
$L1537:
; Line 2780
	push	OFFSET $SG1538
	call	_warning
	add	esp, 4
; Line 2781
$L1536:
	mov	eax, DWORD PTR _volatilep$[ebp]
	push	eax
	mov	eax, DWORD PTR _constp$[ebp]
	push	eax
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_c_build_type_variant
	add	esp, 12					; 0000000cH
	push	eax
	call	_build_pointer_type
	add	esp, 4
	mov	DWORD PTR _type$[ebp], eax
; Line 2782
	mov	DWORD PTR _constp$[ebp], 0
	mov	eax, DWORD PTR _constp$[ebp]
	mov	DWORD PTR _volatilep$[ebp], eax
; Line 2785
$L1535:
$L1534:
	cmp	DWORD PTR _initialized$[ebp], 0
	je	$L1539
; Line 2786
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	push	OFFSET $SG1540
	call	_error
	add	esp, 8
; Line 2788
$L1539:
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	mov	eax, DWORD PTR _declarator$[ebp]
	push	eax
	push	44					; 0000002cH
	call	_build_decl
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _decl$1531[ebp], eax
; Line 2795
	mov	eax, DWORD PTR _type$[ebp]
	mov	ecx, DWORD PTR _decl$1531[ebp]
	mov	DWORD PTR [ecx+56], eax
; Line 2796
	mov	eax, DWORD PTR _type$[ebp]
	cmp	DWORD PTR _float_type_node, eax
	jne	$L1541
; Line 2797
	mov	eax, DWORD PTR _double_type_node
	mov	ecx, DWORD PTR _decl$1531[ebp]
	mov	DWORD PTR [ecx+56], eax
; Line 2798
	jmp	$L1542
$L1541:
; Line 2803
	mov	eax, DWORD PTR _type$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 5
	jne	$L1543
	mov	eax, DWORD PTR _type$[ebp]
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _integer_type_node
	mov	cl, BYTE PTR [ecx+38]
	and	ecx, 255				; 000000ffH
	cmp	eax, ecx
	jl	$L1544
	mov	eax, DWORD PTR _type$[ebp]
	cmp	DWORD PTR _short_integer_type_node, eax
	je	$L1544
	mov	eax, DWORD PTR _type$[ebp]
	cmp	DWORD PTR _short_unsigned_type_node, eax
	jne	$L1543
$L1544:
; Line 2806
	mov	eax, DWORD PTR _type$[ebp]
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _integer_type_node
	mov	cl, BYTE PTR [ecx+38]
	and	ecx, 255				; 000000ffH
	cmp	eax, ecx
	jne	$L1545
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 12					; 0000000cH
	test	al, 1
	je	$L1545
; Line 2807
	mov	eax, DWORD PTR _unsigned_type_node
	mov	ecx, DWORD PTR _decl$1531[ebp]
	mov	DWORD PTR [ecx+56], eax
; Line 2808
	jmp	$L1546
$L1545:
; Line 2809
	mov	eax, DWORD PTR _integer_type_node
	mov	ecx, DWORD PTR _decl$1531[ebp]
	mov	DWORD PTR [ecx+56], eax
$L1546:
; Line 2811
$L1543:
$L1542:
; Line 2812
	jmp	$L1547
$L1532:
	cmp	DWORD PTR _decl_context$[ebp], 3
	jne	$L1548
; Line 2816
	mov	eax, DWORD PTR _type$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 21					; 00000015H
	jne	$L1549
; Line 2819
	mov	eax, DWORD PTR _declarator$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	OFFSET $SG1550
	call	_error
	add	esp, 8
; Line 2820
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_build_pointer_type
	add	esp, 4
	mov	DWORD PTR _type$[ebp], eax
; Line 2822
	jmp	$L1551
$L1549:
	mov	eax, DWORD PTR _type$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L1552
	mov	eax, DWORD PTR _type$[ebp]
	cmp	DWORD PTR [eax+28], 0
	jne	$L1552
; Line 2825
	mov	eax, DWORD PTR _declarator$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	OFFSET $SG1553
	call	_error
	add	esp, 8
; Line 2826
	mov	eax, DWORD PTR _error_mark_node
	mov	DWORD PTR _type$[ebp], eax
; Line 2829
$L1552:
$L1551:
	mov	eax, DWORD PTR _type$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 16					; 00000010H
	jne	$L1554
	cmp	DWORD PTR _constp$[ebp], 0
	jne	$L1555
	cmp	DWORD PTR _volatilep$[ebp], 0
	je	$L1554
$L1555:
; Line 2831
	mov	eax, DWORD PTR _volatilep$[ebp]
	push	eax
	mov	eax, DWORD PTR _constp$[ebp]
	push	eax
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_c_build_type_variant
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _type$[ebp], eax
; Line 2832
	mov	DWORD PTR _volatilep$[ebp], 0
	mov	eax, DWORD PTR _volatilep$[ebp]
	mov	DWORD PTR _constp$[ebp], eax
; Line 2836
$L1554:
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	mov	eax, DWORD PTR _declarator$[ebp]
	push	eax
	push	46					; 0000002eH
	call	_build_decl
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _decl$1531[ebp], eax
; Line 2838
	jmp	$L1556
$L1548:
	mov	eax, DWORD PTR _type$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 21					; 00000015H
	jne	$L1557
; Line 2840
	test	BYTE PTR _specbits$[ebp+1], 36		; 00000024H
	je	$L1558
; Line 2842
	mov	eax, DWORD PTR _declarator$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	OFFSET $SG1559
	call	_error
	add	esp, 8
; Line 2846
$L1558:
; Line 2848
	mov	eax, DWORD PTR _current_binding_level$S719
	cmp	DWORD PTR _global_binding_level$S721, eax
	je	$L1560
	test	DWORD PTR _specbits$[ebp], 264192	; 00040800H
	je	$L1560
	cmp	DWORD PTR _pedantic, 0
	je	$L1560
; Line 2850
	mov	eax, DWORD PTR _declarator$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	OFFSET $SG1561
	call	_warning
	add	esp, 8
; Line 2851
$L1560:
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	mov	eax, DWORD PTR _declarator$[ebp]
	push	eax
	push	39					; 00000027H
	call	_build_decl
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _decl$1531[ebp], eax
; Line 2853
	mov	eax, DWORD PTR _decl$1531[ebp]
	mov	eax, DWORD PTR [eax+16]
	or	eax, 1
	mov	ecx, DWORD PTR _decl$1531[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 2855
	mov	eax, DWORD PTR _specbits$[ebp]
	and	eax, 2048				; 00000800H
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	and	eax, 1
	add	eax, eax
	mov	ecx, DWORD PTR _decl$1531[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	and	ecx, -3					; fffffffdH
	or	eax, ecx
	mov	ecx, DWORD PTR _decl$1531[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 2857
	cmp	DWORD PTR _inlinep$[ebp], 0
	je	$L1562
; Line 2859
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	call	_tree_last
	add	esp, 4
	mov	DWORD PTR _last$1563[ebp], eax
; Line 2861
	push	OFFSET $SG1565
	mov	eax, DWORD PTR _declarator$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L1564
; Line 2862
	push	OFFSET $SG1566
	call	_warning
	add	esp, 4
; Line 2863
	jmp	$L1567
$L1564:
	cmp	DWORD PTR _last$1563[ebp], 0
	je	$L1568
	mov	eax, DWORD PTR _last$1563[ebp]
	mov	ecx, DWORD PTR _void_type_node
	cmp	DWORD PTR [eax+24], ecx
	je	$L1568
; Line 2864
	push	OFFSET $SG1569
	call	_warning
	add	esp, 4
; Line 2865
	jmp	$L1570
$L1568:
; Line 2867
	mov	eax, DWORD PTR _decl$1531[ebp]
	mov	eax, DWORD PTR [eax+16]
	or	eax, 16384				; 00004000H
	mov	ecx, DWORD PTR _decl$1531[ebp]
	mov	DWORD PTR [ecx+16], eax
$L1570:
$L1567:
; Line 2869
	test	BYTE PTR _specbits$[ebp+1], 16		; 00000010H
	je	$L1571
; Line 2870
	mov	DWORD PTR _current_extern_inline$S717, 1
; Line 2871
$L1571:
; Line 2872
$L1562:
; Line 2873
	jmp	$L1572
$L1557:
; Line 2878
	mov	eax, DWORD PTR _type$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 16					; 00000010H
	jne	$L1573
	cmp	DWORD PTR _constp$[ebp], 0
	jne	$L1574
	cmp	DWORD PTR _volatilep$[ebp], 0
	je	$L1573
$L1574:
; Line 2880
	mov	eax, DWORD PTR _volatilep$[ebp]
	push	eax
	mov	eax, DWORD PTR _constp$[ebp]
	push	eax
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_c_build_type_variant
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _type$[ebp], eax
; Line 2886
$L1573:
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	mov	eax, DWORD PTR _declarator$[ebp]
	push	eax
	push	43					; 0000002bH
	call	_build_decl
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _decl$1531[ebp], eax
; Line 2888
	cmp	DWORD PTR _inlinep$[ebp], 0
	je	$L1575
; Line 2889
	push	OFFSET $SG1576
	mov	eax, DWORD PTR _decl$1531[ebp]
	push	eax
	call	_warning_with_decl
	add	esp, 8
; Line 2892
$L1575:
; Line 2893
	cmp	DWORD PTR _initialized$[ebp], 0
	jne	$L1967
	test	BYTE PTR _specbits$[ebp+1], 16		; 00000010H
	je	$L1967
	mov	eax, DWORD PTR _decl$1531[ebp]
	mov	eax, DWORD PTR [eax+16]
	or	eax, 1
	mov	ecx, DWORD PTR _decl$1531[ebp]
	mov	DWORD PTR [ecx+16], eax
	jmp	$L1968
$L1967:
	mov	eax, DWORD PTR _decl$1531[ebp]
	and	DWORD PTR [eax+16], -2			; fffffffeH
$L1968:
; Line 2896
	mov	eax, DWORD PTR _current_binding_level$S719
	cmp	DWORD PTR _global_binding_level$S721, eax
	jne	$L1577
; Line 2898
	mov	eax, DWORD PTR _specbits$[ebp]
	and	eax, 2048				; 00000800H
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	and	eax, 1
	add	eax, eax
	mov	ecx, DWORD PTR _decl$1531[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	and	ecx, -3					; fffffffdH
	or	eax, ecx
	mov	ecx, DWORD PTR _decl$1531[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 2899
	mov	eax, DWORD PTR _decl$1531[ebp]
	mov	eax, DWORD PTR [eax+16]
	and	eax, 1
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	and	eax, 1
	shl	eax, 2
	mov	ecx, DWORD PTR _decl$1531[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	and	ecx, -5					; fffffffbH
	or	eax, ecx
	mov	ecx, DWORD PTR _decl$1531[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 2902
	jmp	$L1578
$L1577:
; Line 2904
	mov	eax, DWORD PTR _specbits$[ebp]
	and	eax, 2048				; 00000800H
	cmp	eax, 1
	sbb	eax, eax
	inc	eax
	and	eax, 1
	shl	eax, 2
	mov	ecx, DWORD PTR _decl$1531[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	and	ecx, -5					; fffffffbH
	or	eax, ecx
	mov	ecx, DWORD PTR _decl$1531[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 2905
	mov	eax, DWORD PTR _decl$1531[ebp]
	mov	eax, DWORD PTR [eax+16]
	and	eax, 1
	add	eax, eax
	mov	ecx, DWORD PTR _decl$1531[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	and	ecx, -3					; fffffffdH
	or	eax, ecx
	mov	ecx, DWORD PTR _decl$1531[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 2907
	test	BYTE PTR _specbits$[ebp+1], 16		; 00000010H
	je	$L1579
	cmp	DWORD PTR _initialized$[ebp], 0
	je	$L1579
; Line 2908
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	push	OFFSET $SG1580
	call	_error
	add	esp, 8
; Line 2909
$L1579:
$L1578:
; Line 2910
$L1572:
$L1556:
$L1547:
; Line 2915
	test	BYTE PTR _specbits$[ebp+1], 32		; 00000020H
	je	$L1581
; Line 2916
	mov	eax, DWORD PTR _decl$1531[ebp]
	mov	eax, DWORD PTR [eax+16]
	or	eax, 1024				; 00000400H
	mov	ecx, DWORD PTR _decl$1531[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 2920
$L1581:
	cmp	DWORD PTR _constp$[ebp], 0
	je	$L1582
; Line 2921
	mov	eax, DWORD PTR _decl$1531[ebp]
	mov	eax, DWORD PTR [eax+16]
	or	eax, 32					; 00000020H
	mov	ecx, DWORD PTR _decl$1531[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 2922
$L1582:
	cmp	DWORD PTR _volatilep$[ebp], 0
	je	$L1583
; Line 2924
	mov	eax, DWORD PTR _decl$1531[ebp]
	mov	eax, DWORD PTR [eax+16]
	or	eax, 8
	mov	ecx, DWORD PTR _decl$1531[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 2925
	mov	eax, DWORD PTR _decl$1531[ebp]
	mov	eax, DWORD PTR [eax+16]
	or	eax, 2048				; 00000800H
	mov	ecx, DWORD PTR _decl$1531[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 2928
$L1583:
	cmp	DWORD PTR _resume_temporary$[ebp], 0
	je	$L1584
; Line 2929
	call	_resume_temporary_allocation
; Line 2931
$L1584:
	mov	eax, DWORD PTR _decl$1531[ebp]
	jmp	$L1318
; Line 2933
$L1318:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_grokdeclarator ENDP
_TEXT	ENDS
EXTRN	_build_type_variant:NEAR
_TEXT	SEGMENT
_type$ = 8
_constp$ = 12
_volatilep$ = 16
_c_build_type_variant PROC NEAR
; Line 2942
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 2943
	mov	eax, DWORD PTR _type$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 16					; 00000010H
	je	$L1589
; Line 2944
	mov	eax, DWORD PTR _volatilep$[ebp]
	push	eax
	mov	eax, DWORD PTR _constp$[ebp]
	push	eax
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_build_type_variant
	add	esp, 12					; 0000000cH
	jmp	$L1588
; Line 2946
$L1589:
; Line 2948
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	mov	eax, DWORD PTR _volatilep$[ebp]
	push	eax
	mov	eax, DWORD PTR _constp$[ebp]
	push	eax
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_c_build_type_variant
	add	esp, 12					; 0000000cH
	push	eax
	call	_build_array_type
	add	esp, 8
	jmp	$L1588
; Line 2949
$L1588:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_c_build_type_variant ENDP
_TEXT	ENDS
_BSS	SEGMENT
_last_function_parms$S711 DD 01H DUP (?)
_last_function_parm_tags$S712 DD 01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+1
$SG1595	DB	'function declaration isn''t a prototype', 00H
	ORG $+1
$SG1598	DB	'parameter names (without types) in function declaration', 00H
$SG1609	DB	'parameter `%s'' has incomplete type', 00H
	ORG $+1
$SG1611	DB	'parameter has incomplete type', 00H
_DATA	ENDS
_TEXT	SEGMENT
_parm$1600 = -12
_typelt$1601 = -8
_type$1606 = -16
_parms_info$ = 8
_funcdef_flag$ = 12
_first_parm$ = -4
_grokparms PROC NEAR
; Line 2973
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 2974
	mov	eax, DWORD PTR _parms_info$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _first_parm$[ebp], eax
; Line 2976
	mov	eax, DWORD PTR _parms_info$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _last_function_parms$S711, eax
; Line 2977
	mov	eax, DWORD PTR _parms_info$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _last_function_parm_tags$S712, eax
; Line 2979
	cmp	DWORD PTR _warn_strict_prototypes, 0
	je	$L1594
	cmp	DWORD PTR _first_parm$[ebp], 0
	jne	$L1594
	cmp	DWORD PTR _funcdef_flag$[ebp], 0
	jne	$L1594
; Line 2980
	push	OFFSET $SG1595
	call	_warning
	add	esp, 4
; Line 2982
$L1594:
; Line 2983
	cmp	DWORD PTR _first_parm$[ebp], 0
	je	$L1596
	mov	eax, DWORD PTR _first_parm$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 1
	jne	$L1596
; Line 2985
	cmp	DWORD PTR _funcdef_flag$[ebp], 0
	jne	$L1597
; Line 2986
	push	OFFSET $SG1598
	call	_warning
	add	esp, 4
; Line 2988
$L1597:
	mov	eax, DWORD PTR _first_parm$[ebp]
	mov	DWORD PTR _last_function_parms$S711, eax
; Line 2989
	sub	eax, eax
	jmp	$L1592
; Line 2991
	jmp	$L1599
$L1596:
; Line 3007
	mov	eax, DWORD PTR _last_function_parms$S711
	mov	DWORD PTR _parm$1600[ebp], eax
	mov	eax, DWORD PTR _first_parm$[ebp]
	mov	DWORD PTR _typelt$1601[ebp], eax
	jmp	$L1602
$L1603:
	mov	eax, DWORD PTR _parm$1600[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _parm$1600[ebp], eax
$L1602:
	cmp	DWORD PTR _parm$1600[ebp], 0
	je	$L1604
; Line 3009
	mov	eax, DWORD PTR _parm$1600[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 44					; 0000002cH
	jne	$L1605
; Line 3012
	mov	eax, DWORD PTR _typelt$1601[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _type$1606[ebp], eax
; Line 3013
	mov	eax, DWORD PTR _type$1606[ebp]
	cmp	DWORD PTR [eax+28], 0
	jne	$L1607
; Line 3015
	cmp	DWORD PTR _funcdef_flag$[ebp], 0
	je	$L1608
	mov	eax, DWORD PTR _parm$1600[ebp]
	cmp	DWORD PTR [eax+40], 0
	je	$L1608
; Line 3017
	mov	eax, DWORD PTR _parm$1600[ebp]
	mov	eax, DWORD PTR [eax+40]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	OFFSET $SG1609
	call	_error
	add	esp, 8
; Line 3018
	jmp	$L1610
$L1608:
; Line 3019
	push	OFFSET $SG1611
	call	_warning
	add	esp, 4
$L1610:
; Line 3020
	cmp	DWORD PTR _funcdef_flag$[ebp], 0
	je	$L1612
; Line 3022
	mov	eax, DWORD PTR _error_mark_node
	mov	ecx, DWORD PTR _typelt$1601[ebp]
	mov	DWORD PTR [ecx+24], eax
; Line 3023
	mov	eax, DWORD PTR _error_mark_node
	mov	ecx, DWORD PTR _parm$1600[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 3025
$L1612:
; Line 3045
$L1607:
	mov	eax, DWORD PTR _typelt$1601[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _typelt$1601[ebp], eax
; Line 3048
$L1605:
	jmp	$L1603
$L1604:
	mov	eax, DWORD PTR _first_parm$[ebp]
	jmp	$L1592
; Line 3049
$L1599:
; Line 3050
$L1592:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_grokparms ENDP
_TEXT	ENDS
PUBLIC	_get_parm_info
_DATA	SEGMENT
	ORG $+2
$SG1628	DB	'`void'' in parameter list must be the entire list', 00H
_DATA	ENDS
_TEXT	SEGMENT
_void_at_end$ = 8
_decl$ = -20
_types$ = -12
_erred$ = -4
_tags$ = -16
_parms$ = -8
_type$1625 = -24
_get_parm_info PROC NEAR
; Line 3065
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	push	ebx
	push	esi
	push	edi
; Line 3067
	mov	DWORD PTR _types$[ebp], 0
; Line 3068
	mov	DWORD PTR _erred$[ebp], 0
; Line 3069
	call	_gettags
	mov	DWORD PTR _tags$[ebp], eax
; Line 3070
	call	_getdecls
	push	eax
	call	_nreverse
	add	esp, 4
	mov	DWORD PTR _parms$[ebp], eax
; Line 3076
	cmp	DWORD PTR _void_at_end$[ebp], 0
	je	$L1620
	cmp	DWORD PTR _parms$[ebp], 0
	je	$L1620
	mov	eax, DWORD PTR _parms$[ebp]
	cmp	DWORD PTR [eax+4], 0
	jne	$L1620
	mov	eax, DWORD PTR _parms$[ebp]
	mov	ecx, DWORD PTR _void_type_node
	cmp	DWORD PTR [eax+8], ecx
	jne	$L1620
	mov	eax, DWORD PTR _parms$[ebp]
	cmp	DWORD PTR [eax+40], 0
	jne	$L1620
; Line 3078
	mov	DWORD PTR _parms$[ebp], 0
; Line 3079
	push	0
	call	_storedecls
	add	esp, 4
; Line 3081
	push	0
	mov	eax, DWORD PTR _void_type_node
	push	eax
	push	0
	call	_saveable_tree_cons
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	call	_saveable_tree_cons
	add	esp, 12					; 0000000cH
	jmp	$L1614
; Line 3084
$L1620:
	mov	eax, DWORD PTR _parms$[ebp]
	push	eax
	call	_storedecls
	add	esp, 4
; Line 3086
	mov	eax, DWORD PTR _parms$[ebp]
	mov	DWORD PTR _decl$[ebp], eax
	jmp	$L1621
$L1622:
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _decl$[ebp], eax
$L1621:
	cmp	DWORD PTR _decl$[ebp], 0
	je	$L1623
; Line 3089
	mov	eax, DWORD PTR _decl$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 44					; 0000002cH
	jne	$L1624
; Line 3093
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _type$1625[ebp], eax
; Line 3094
	mov	eax, DWORD PTR _type$1625[ebp]
	mov	ecx, DWORD PTR _decl$[ebp]
	mov	DWORD PTR [ecx+56], eax
; Line 3097
	mov	eax, DWORD PTR _type$1625[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 5
	jne	$L1626
	mov	eax, DWORD PTR _type$1625[ebp]
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _integer_type_node
	mov	cl, BYTE PTR [ecx+38]
	and	ecx, 255				; 000000ffH
	cmp	eax, ecx
	jge	$L1626
; Line 3098
	mov	eax, DWORD PTR _integer_type_node
	mov	ecx, DWORD PTR _decl$[ebp]
	mov	DWORD PTR [ecx+56], eax
; Line 3101
$L1626:
	mov	eax, DWORD PTR _types$[ebp]
	push	eax
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	push	0
	call	_saveable_tree_cons
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _types$[ebp], eax
; Line 3103
	mov	eax, DWORD PTR _types$[ebp]
	mov	ecx, DWORD PTR _void_type_node
	cmp	DWORD PTR [eax+24], ecx
	jne	$L1627
	cmp	DWORD PTR _erred$[ebp], 0
	jne	$L1627
	mov	eax, DWORD PTR _decl$[ebp]
	cmp	DWORD PTR [eax+40], 0
	jne	$L1627
; Line 3105
	push	OFFSET $SG1628
	call	_error
	add	esp, 4
; Line 3106
	mov	DWORD PTR _erred$[ebp], 1
; Line 3108
$L1627:
; Line 3110
$L1624:
	jmp	$L1622
$L1623:
	cmp	DWORD PTR _void_at_end$[ebp], 0
	je	$L1629
; Line 3112
	mov	eax, DWORD PTR _types$[ebp]
	push	eax
	mov	eax, DWORD PTR _void_type_node
	push	eax
	push	0
	call	_saveable_tree_cons
	add	esp, 12					; 0000000cH
	push	eax
	call	_nreverse
	add	esp, 4
	push	eax
	mov	eax, DWORD PTR _tags$[ebp]
	push	eax
	mov	eax, DWORD PTR _parms$[ebp]
	push	eax
	call	_saveable_tree_cons
	add	esp, 12					; 0000000cH
	jmp	$L1614
; Line 3114
$L1629:
	mov	eax, DWORD PTR _types$[ebp]
	push	eax
	call	_nreverse
	add	esp, 4
	push	eax
	mov	eax, DWORD PTR _tags$[ebp]
	push	eax
	mov	eax, DWORD PTR _parms$[ebp]
	push	eax
	call	_saveable_tree_cons
	add	esp, 12					; 0000000cH
	jmp	$L1614
; Line 3115
$L1614:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_get_parm_info ENDP
_TEXT	ENDS
PUBLIC	_parmlist_tags_warning
_BSS	SEGMENT
_?already@?1??parmlist_tags_warning@@9@9$S1634 DD 01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+3
$SG1639	DB	'struct', 00H
	ORG $+1
$SG1640	DB	'union', 00H
	ORG $+2
$SG1641	DB	'enum', 00H
	ORG $+3
$SG1642	DB	'`%s %s'' declared inside parameter list', 00H
	ORG $+1
$SG1644	DB	'its scope is only this definition or declaration,', 00H
	ORG $+2
$SG1645	DB	'which is probably not what you want.', 00H
_DATA	ENDS
_TEXT	SEGMENT
_elt$ = -4
_code$1638 = -8
_parmlist_tags_warning PROC NEAR
; Line 3122
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 3126
	mov	eax, DWORD PTR _current_binding_level$S719
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _elt$[ebp], eax
	jmp	$L1635
$L1636:
	mov	eax, DWORD PTR _elt$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _elt$[ebp], eax
$L1635:
	cmp	DWORD PTR _elt$[ebp], 0
	je	$L1637
; Line 3128
	mov	eax, DWORD PTR _elt$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _code$1638[ebp], eax
; Line 3133
	cmp	DWORD PTR _code$1638[ebp], 19		; 00000013H
	jne	$L1970
	mov	DWORD PTR -12+[ebp], OFFSET $SG1639
	jmp	$L1971
$L1970:
	mov	eax, OFFSET $SG1640
	cmp	DWORD PTR _code$1638[ebp], 20		; 00000014H
	je	$L1972
	mov	eax, OFFSET $SG1641
$L1972:
	mov	DWORD PTR -12+[ebp], eax
$L1971:
	mov	eax, DWORD PTR _elt$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	mov	eax, DWORD PTR -12+[ebp]
	push	eax
	push	OFFSET $SG1642
	call	_warning
	add	esp, 12					; 0000000cH
; Line 3134
	cmp	DWORD PTR _?already@?1??parmlist_tags_warning@@9@9$S1634, 0
	jne	$L1643
; Line 3136
	push	OFFSET $SG1644
	call	_warning
	add	esp, 4
; Line 3137
	push	OFFSET $SG1645
	call	_warning
	add	esp, 4
; Line 3138
	mov	DWORD PTR _?already@?1??parmlist_tags_warning@@9@9$S1634, 1
; Line 3140
$L1643:
	jmp	$L1636
$L1637:
; Line 3141
$L1631:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_parmlist_tags_warning ENDP
_TEXT	ENDS
PUBLIC	_xref_tag
_DATA	SEGMENT
	ORG $+3
$SG1655	DB	'ANSI C forbids forward references to `enum'' types', 00H
_DATA	ENDS
_TEXT	SEGMENT
_code$ = 8
_name$ = 12
_temporary$ = -4
_ref$ = -8
_xref_tag PROC NEAR
; Line 3150
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 3151
	call	_allocation_temporary_p
	mov	DWORD PTR _temporary$[ebp], eax
; Line 3156
	push	0
	mov	eax, DWORD PTR _current_binding_level$S719
	push	eax
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	mov	eax, DWORD PTR _code$[ebp]
	push	eax
	call	_lookup_tag
	add	esp, 16					; 00000010H
	mov	DWORD PTR _ref$[ebp], eax
; Line 3157
	cmp	DWORD PTR _ref$[ebp], 0
	je	$L1651
	mov	eax, DWORD PTR _ref$[ebp]
	jmp	$L1648
; Line 3159
$L1651:
	mov	eax, DWORD PTR _current_binding_level$S719
	cmp	DWORD PTR _global_binding_level$S721, eax
	jne	$L1652
	cmp	DWORD PTR _temporary$[ebp], 0
	je	$L1652
; Line 3160
	call	_end_temporary_allocation
; Line 3167
$L1652:
	mov	eax, DWORD PTR _code$[ebp]
	push	eax
	call	_make_node
	add	esp, 4
	mov	DWORD PTR _ref$[ebp], eax
; Line 3168
	cmp	DWORD PTR _code$[ebp], 8
	jne	$L1653
; Line 3171
	cmp	DWORD PTR _pedantic, 0
	je	$L1654
; Line 3172
	push	OFFSET $SG1655
	call	_warning
	add	esp, 4
; Line 3175
$L1654:
	mov	eax, DWORD PTR _ref$[ebp]
	mov	eax, DWORD PTR [eax+32]
	and	eax, -252				; ffffff04H
	or	eax, 4
	mov	ecx, DWORD PTR _ref$[ebp]
	mov	DWORD PTR [ecx+32], eax
; Line 3176
	mov	eax, DWORD PTR _unsigned_type_node
	mov	al, BYTE PTR [eax+37]
	mov	ecx, DWORD PTR _ref$[ebp]
	mov	BYTE PTR [ecx+37], al
; Line 3177
	mov	eax, DWORD PTR _ref$[ebp]
	mov	eax, DWORD PTR [eax+16]
	or	eax, 4096				; 00001000H
	mov	ecx, DWORD PTR _ref$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 3178
	mov	eax, DWORD PTR _unsigned_type_node
	mov	al, BYTE PTR [eax+38]
	mov	ecx, DWORD PTR _ref$[ebp]
	mov	BYTE PTR [ecx+38], al
; Line 3179
	mov	eax, DWORD PTR _unsigned_type_node
	mov	eax, DWORD PTR [eax+24]
	mov	ecx, DWORD PTR _ref$[ebp]
	mov	DWORD PTR [ecx+24], eax
; Line 3180
	mov	eax, DWORD PTR _unsigned_type_node
	mov	eax, DWORD PTR [eax+60]
	mov	ecx, DWORD PTR _ref$[ebp]
	mov	DWORD PTR [ecx+60], eax
; Line 3183
$L1653:
	mov	eax, DWORD PTR _ref$[ebp]
	push	eax
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_pushtag
	add	esp, 8
; Line 3185
	mov	eax, DWORD PTR _current_binding_level$S719
	cmp	DWORD PTR _global_binding_level$S721, eax
	jne	$L1656
	cmp	DWORD PTR _temporary$[ebp], 0
	je	$L1656
; Line 3186
	call	_resume_temporary_allocation
; Line 3188
$L1656:
	mov	eax, DWORD PTR _ref$[ebp]
	jmp	$L1648
; Line 3189
$L1648:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_xref_tag ENDP
_TEXT	ENDS
PUBLIC	_start_struct
_DATA	SEGMENT
	ORG $+2
$SG1664	DB	'redefinition of `union %s''', 00H
	ORG $+1
$SG1665	DB	'redefinition of `struct %s''', 00H
_DATA	ENDS
_TEXT	SEGMENT
_code$ = 8
_name$ = 12
_ref$ = -4
_start_struct PROC NEAR
; Line 3199
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 3203
	mov	DWORD PTR _ref$[ebp], 0
; Line 3205
	cmp	DWORD PTR _name$[ebp], 0
	je	$L1661
; Line 3206
	push	1
	mov	eax, DWORD PTR _current_binding_level$S719
	push	eax
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	mov	eax, DWORD PTR _code$[ebp]
	push	eax
	call	_lookup_tag
	add	esp, 16					; 00000010H
	mov	DWORD PTR _ref$[ebp], eax
; Line 3207
$L1661:
	cmp	DWORD PTR _ref$[ebp], 0
	je	$L1662
	mov	eax, DWORD PTR _ref$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, DWORD PTR _code$[ebp]
	jne	$L1662
; Line 3209
	mov	eax, DWORD PTR _ref$[ebp]
	cmp	DWORD PTR [eax+20], 0
	je	$L1663
; Line 3212
	mov	eax, DWORD PTR _name$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	mov	eax, OFFSET $SG1664
	cmp	DWORD PTR _code$[ebp], 20		; 00000014H
	je	$L1973
	mov	eax, OFFSET $SG1665
$L1973:
	push	eax
	call	_error
	add	esp, 8
; Line 3214
$L1663:
	mov	eax, DWORD PTR _ref$[ebp]
	jmp	$L1659
; Line 3219
$L1662:
	mov	eax, DWORD PTR _code$[ebp]
	push	eax
	call	_make_node
	add	esp, 4
	mov	DWORD PTR _ref$[ebp], eax
; Line 3220
	mov	eax, DWORD PTR _ref$[ebp]
	push	eax
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_pushtag
	add	esp, 8
; Line 3221
	mov	eax, DWORD PTR _ref$[ebp]
	jmp	$L1659
; Line 3222
$L1659:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_start_struct ENDP
_TEXT	ENDS
PUBLIC	_grokfield
_TEXT	SEGMENT
_declarator$ = 16
_declspecs$ = 20
_width$ = 24
_value$ = -4
_grokfield PROC NEAR
; Line 3237
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 3238
	push	0
	push	3
	mov	eax, DWORD PTR _declspecs$[ebp]
	push	eax
	mov	eax, DWORD PTR _declarator$[ebp]
	push	eax
	call	_grokdeclarator
	add	esp, 16					; 00000010H
	mov	DWORD PTR _value$[ebp], eax
; Line 3240
	push	0
	push	0
	mov	eax, DWORD PTR _value$[ebp]
	push	eax
	call	_finish_decl
	add	esp, 12					; 0000000cH
; Line 3241
	mov	eax, DWORD PTR _width$[ebp]
	mov	ecx, DWORD PTR _value$[ebp]
	mov	DWORD PTR [ecx+64], eax
; Line 3243
	mov	eax, DWORD PTR _value$[ebp]
	jmp	$L1671
; Line 3244
$L1671:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_grokfield ENDP
_TEXT	ENDS
PUBLIC	_finish_struct
EXTRN	_suspend_momentary:NEAR
EXTRN	_resume_momentary:NEAR
_DATA	SEGMENT
$SG1680	DB	'union defined inside parms', 00H
	ORG $+1
$SG1681	DB	'structure defined inside parms', 00H
	ORG $+1
$SG1684	DB	'union has no members', 00H
	ORG $+3
$SG1685	DB	'structure has no members', 00H
	ORG $+3
$SG1698	DB	'bit-field `%s'' width not an integer constant', 00H
	ORG $+3
$SG1700	DB	'bit-field `%s'' has invalid type', 00H
$SG1702	DB	'bit-field `%s'' type invalid in ANSI C', 00H
	ORG $+2
$SG1706	DB	'negative width in bit-field `%s''', 00H
	ORG $+3
$SG1709	DB	'zero width for bit-field `%s''', 00H
	ORG $+2
$SG1712	DB	'width of `%s'' exceeds its type', 00H
	ORG $+1
$SG1741	DB	'duplicate member `%s''', 00H
_DATA	ENDS
_TEXT	SEGMENT
_y$1734 = -28
_t$ = 8
_fieldlist$ = 12
_x$ = -8
_old_momentary$ = -12
_round_up_size$ = -4
_decl$1751 = -32
_t1$1691 = -16
_toplevel$1756 = -36
_element$1760 = -40
_width$1704 = -20
_width$1714 = -24
_finish_struct PROC NEAR
; Line 3252
	push	ebp
	mov	ebp, esp
	sub	esp, 40					; 00000028H
	push	ebx
	push	esi
	push	edi
; Line 3255
	mov	DWORD PTR _round_up_size$[ebp], 1
; Line 3260
	mov	eax, DWORD PTR _t$[ebp]
	mov	DWORD PTR [eax+28], 0
; Line 3262
	call	_in_parm_level_p
	or	eax, eax
	je	$L1679
; Line 3264
	mov	eax, OFFSET $SG1680
	mov	ecx, DWORD PTR _t$[ebp]
	mov	cl, BYTE PTR [ecx+12]
	and	ecx, 255				; 000000ffH
	cmp	ecx, 20					; 00000014H
	je	$L1974
	mov	eax, OFFSET $SG1681
$L1974:
	push	eax
	call	_warning
	add	esp, 4
; Line 3266
$L1679:
	call	_suspend_momentary
	mov	DWORD PTR _old_momentary$[ebp], eax
; Line 3268
	cmp	DWORD PTR _fieldlist$[ebp], 0
	jne	$L1683
	cmp	DWORD PTR _pedantic, 0
	je	$L1683
; Line 3270
	mov	eax, OFFSET $SG1684
	mov	ecx, DWORD PTR _t$[ebp]
	mov	cl, BYTE PTR [ecx+12]
	and	ecx, 255				; 000000ffH
	cmp	ecx, 20					; 00000014H
	je	$L1975
	mov	eax, OFFSET $SG1685
$L1975:
	push	eax
	call	_warning
	add	esp, 4
; Line 3279
$L1683:
	mov	eax, DWORD PTR _fieldlist$[ebp]
	mov	DWORD PTR _x$[ebp], eax
	jmp	$L1686
$L1687:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x$[ebp], eax
$L1686:
	cmp	DWORD PTR _x$[ebp], 0
	je	$L1688
; Line 3281
	mov	eax, DWORD PTR _t$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [ecx+44], eax
; Line 3282
	mov	eax, DWORD PTR _x$[ebp]
	mov	BYTE PTR [eax+36], 0
; Line 3285
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 5
	test	al, 1
	je	$L1689
; Line 3286
	mov	eax, DWORD PTR _t$[ebp]
	mov	BYTE PTR [eax+38], 1
; Line 3287
	jmp	$L1690
$L1689:
; Line 3290
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _t1$1691[ebp], eax
; Line 3291
$L1693:
	mov	eax, DWORD PTR _t1$1691[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 16					; 00000010H
	jne	$L1694
; Line 3292
	mov	eax, DWORD PTR _t1$1691[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _t1$1691[ebp], eax
	jmp	$L1693
$L1694:
; Line 3294
	mov	eax, DWORD PTR _t1$1691[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 19					; 00000013H
	je	$L1696
	mov	eax, DWORD PTR _t1$1691[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 20					; 00000014H
	jne	$L1695
$L1696:
	mov	eax, DWORD PTR _t1$1691[ebp]
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L1695
; Line 3295
	mov	eax, DWORD PTR _t$[ebp]
	mov	BYTE PTR [eax+38], 1
; Line 3296
$L1695:
$L1690:
; Line 3299
	mov	eax, DWORD PTR _x$[ebp]
	cmp	DWORD PTR [eax+64], 0
	je	$L1697
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+64]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	je	$L1697
; Line 3301
	push	OFFSET $SG1698
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_error_with_decl
	add	esp, 8
; Line 3302
	mov	eax, DWORD PTR _x$[ebp]
	mov	DWORD PTR [eax+64], 0
; Line 3306
$L1697:
; Line 3308
	mov	eax, DWORD PTR _x$[ebp]
	cmp	DWORD PTR [eax+64], 0
	je	$L1699
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 5
	je	$L1699
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 8
	je	$L1699
; Line 3310
	push	OFFSET $SG1700
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_error_with_decl
	add	esp, 8
; Line 3311
	mov	eax, DWORD PTR _x$[ebp]
	mov	DWORD PTR [eax+64], 0
; Line 3313
$L1699:
; Line 3315
	mov	eax, DWORD PTR _x$[ebp]
	cmp	DWORD PTR [eax+64], 0
	je	$L1701
	cmp	DWORD PTR _pedantic, 0
	je	$L1701
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR _integer_type_node
	cmp	DWORD PTR [eax+8], ecx
	je	$L1701
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR _unsigned_type_node
	cmp	DWORD PTR [eax+8], ecx
	je	$L1701
; Line 3316
	push	OFFSET $SG1702
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_warning_with_decl
	add	esp, 8
; Line 3319
$L1701:
	mov	eax, DWORD PTR _x$[ebp]
	cmp	DWORD PTR [eax+64], 0
	je	$L1703
; Line 3321
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+64]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _width$1704[ebp], eax
; Line 3323
	cmp	DWORD PTR _width$1704[ebp], 0
	jge	$L1705
; Line 3325
	mov	eax, DWORD PTR _x$[ebp]
	mov	DWORD PTR [eax+64], 0
; Line 3326
	push	OFFSET $SG1706
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_warning_with_decl
	add	esp, 8
; Line 3328
	jmp	$L1707
$L1705:
	cmp	DWORD PTR _width$1704[ebp], 0
	jne	$L1708
	mov	eax, DWORD PTR _x$[ebp]
	cmp	DWORD PTR [eax+40], 0
	je	$L1708
; Line 3330
	push	OFFSET $SG1709
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_error_with_decl
	add	esp, 8
; Line 3331
	mov	eax, DWORD PTR _x$[ebp]
	mov	DWORD PTR [eax+64], 0
; Line 3333
	jmp	$L1710
$L1708:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	cmp	eax, DWORD PTR _width$1704[ebp]
	jge	$L1711
; Line 3335
	mov	eax, DWORD PTR _x$[ebp]
	mov	DWORD PTR [eax+64], 0
; Line 3336
	push	OFFSET $SG1712
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_warning_with_decl
	add	esp, 8
; Line 3338
$L1711:
$L1710:
$L1707:
; Line 3341
$L1703:
	mov	eax, DWORD PTR _x$[ebp]
	cmp	DWORD PTR [eax+64], 0
	je	$L1713
; Line 3343
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+64]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _width$1714[ebp], eax
; Line 3345
	cmp	DWORD PTR _width$1714[ebp], 0
	jne	$L1715
; Line 3348
	mov	eax, DWORD PTR _x$[ebp]
	cmp	DWORD PTR [eax+4], 0
	je	$L1716
; Line 3350
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	al, BYTE PTR [eax+37]
	and	eax, 255				; 000000ffH
	cmp	eax, 32					; 00000020H
	jg	$L1976
	mov	eax, 32					; 00000020H
$L1976:
	mov	ecx, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	mov	BYTE PTR [ecx+37], al
; Line 3352
	jmp	$L1717
$L1716:
; Line 3353
	mov	DWORD PTR _round_up_size$[ebp], 32	; 00000020H
$L1717:
; Line 3355
	jmp	$L1718
$L1715:
; Line 3357
	mov	eax, DWORD PTR _x$[ebp]
	mov	DWORD PTR [eax+64], 0
; Line 3358
	mov	al, BYTE PTR _width$1714[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	BYTE PTR [ecx+36], al
; Line 3359
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+16]
	or	eax, 16					; 00000010H
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 3363
	cmp	DWORD PTR _flag_traditional, 0
	je	$L1719
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 5
	jne	$L1719
; Line 3364
	mov	eax, DWORD PTR _unsigned_type_node
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 3365
$L1719:
$L1718:
; Line 3367
	jmp	$L1720
$L1713:
; Line 3369
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+37]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _x$[ebp]
	mov	cl, BYTE PTR [ecx+37]
	and	ecx, 255				; 000000ffH
	cmp	eax, ecx
	jg	$L1977
	mov	eax, ecx
$L1977:
	mov	ecx, DWORD PTR _x$[ebp]
	mov	BYTE PTR [ecx+37], al
$L1720:
; Line 3370
	jmp	$L1687
$L1688:
; Line 3377
$L1722:
	cmp	DWORD PTR _fieldlist$[ebp], 0
	je	$L1723
	mov	eax, DWORD PTR _fieldlist$[ebp]
	cmp	DWORD PTR [eax+64], 0
	je	$L1723
; Line 3378
	mov	eax, DWORD PTR _fieldlist$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _fieldlist$[ebp], eax
	jmp	$L1722
$L1723:
; Line 3380
	mov	eax, DWORD PTR _fieldlist$[ebp]
	mov	DWORD PTR _x$[ebp], eax
$L1725:
	cmp	DWORD PTR _x$[ebp], 0
	je	$L1726
; Line 3382
	mov	eax, DWORD PTR _x$[ebp]
	cmp	DWORD PTR [eax+4], 0
	je	$L1727
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+64], 0
	je	$L1727
; Line 3383
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 3384
	jmp	$L1728
$L1727:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x$[ebp], eax
$L1728:
; Line 3385
	jmp	$L1725
$L1726:
; Line 3388
	mov	eax, DWORD PTR _fieldlist$[ebp]
	mov	DWORD PTR _x$[ebp], eax
$L1730:
	cmp	DWORD PTR _x$[ebp], 0
	je	$L1731
	mov	eax, DWORD PTR _x$[ebp]
	cmp	DWORD PTR [eax+4], 0
	je	$L1731
; Line 3390
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+40], 0
	jne	$L1732
; Line 3391
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x$[ebp], eax
; Line 3392
	jmp	$L1733
$L1732:
; Line 3394
	mov	eax, DWORD PTR _fieldlist$[ebp]
	mov	DWORD PTR _y$1734[ebp], eax
; Line 3396
$L1736:
; Line 3398
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _y$1734[ebp]
	mov	ecx, DWORD PTR [ecx+40]
	cmp	DWORD PTR [eax+40], ecx
	jne	$L1738
; Line 3399
	jmp	$L1737
; Line 3400
$L1738:
	mov	eax, DWORD PTR _x$[ebp]
	cmp	DWORD PTR _y$1734[ebp], eax
	jne	$L1739
; Line 3401
	jmp	$L1737
; Line 3402
$L1739:
	mov	eax, DWORD PTR _y$1734[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _y$1734[ebp], eax
; Line 3403
	jmp	$L1736
$L1737:
; Line 3404
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _y$1734[ebp]
	mov	ecx, DWORD PTR [ecx+40]
	cmp	DWORD PTR [eax+40], ecx
	jne	$L1740
; Line 3406
	push	OFFSET $SG1741
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_error_with_decl
	add	esp, 8
; Line 3407
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 3409
	jmp	$L1742
$L1740:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x$[ebp], eax
$L1742:
; Line 3410
$L1733:
	jmp	$L1730
$L1731:
; Line 3415
	mov	eax, DWORD PTR _fieldlist$[ebp]
	mov	ecx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [ecx+20], eax
; Line 3419
	mov	al, BYTE PTR _round_up_size$[ebp]
	mov	ecx, DWORD PTR _t$[ebp]
	mov	BYTE PTR [ecx+37], al
; Line 3421
	mov	eax, DWORD PTR _t$[ebp]
	mov	eax, DWORD PTR [eax+68]
	mov	DWORD PTR _x$[ebp], eax
	jmp	$L1743
$L1744:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+64]
	mov	DWORD PTR _x$[ebp], eax
$L1743:
	cmp	DWORD PTR _x$[ebp], 0
	je	$L1745
; Line 3423
	mov	eax, DWORD PTR _t$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [ecx+20], eax
; Line 3424
	mov	eax, DWORD PTR _t$[ebp]
	mov	al, BYTE PTR [eax+37]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	BYTE PTR [ecx+37], al
; Line 3425
	jmp	$L1744
$L1745:
; Line 3427
	mov	eax, DWORD PTR _t$[ebp]
	push	eax
	call	_layout_type
	add	esp, 4
; Line 3430
	mov	eax, DWORD PTR _fieldlist$[ebp]
	mov	DWORD PTR _x$[ebp], eax
	jmp	$L1746
$L1747:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x$[ebp], eax
$L1746:
	cmp	DWORD PTR _x$[ebp], 0
	je	$L1748
; Line 3434
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 4
	test	al, 1
	je	$L1749
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 5
	jne	$L1749
	mov	eax, DWORD PTR _x$[ebp]
	mov	al, BYTE PTR [eax+36]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR [ecx+28]
	imul	eax, DWORD PTR [ecx+20]
	mov	ecx, DWORD PTR _integer_type_node
	mov	cl, BYTE PTR [ecx+38]
	and	ecx, 255				; 000000ffH
	cmp	eax, ecx
	jge	$L1749
; Line 3435
	mov	eax, DWORD PTR _integer_type_node
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 3440
$L1749:
	jmp	$L1747
$L1748:
	mov	eax, DWORD PTR _current_binding_level$S719
	cmp	DWORD PTR [eax+24], 0
	je	$L1750
; Line 3443
	mov	eax, DWORD PTR _current_binding_level$S719
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _decl$1751[ebp], eax
	jmp	$L1752
$L1753:
	mov	eax, DWORD PTR _decl$1751[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _decl$1751[ebp], eax
$L1752:
	cmp	DWORD PTR _decl$1751[ebp], 0
	je	$L1754
; Line 3446
	mov	eax, DWORD PTR _decl$1751[ebp]
	mov	ecx, DWORD PTR _t$[ebp]
	cmp	DWORD PTR [eax+8], ecx
	jne	$L1755
	mov	eax, DWORD PTR _decl$1751[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 42					; 0000002aH
	je	$L1755
; Line 3448
	mov	eax, DWORD PTR _global_binding_level$S721
	sub	eax, DWORD PTR _current_binding_level$S719
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	mov	DWORD PTR _toplevel$1756[ebp], eax
; Line 3449
	push	0
	mov	eax, DWORD PTR _decl$1751[ebp]
	push	eax
	call	_layout_decl
	add	esp, 8
; Line 3450
	push	0
	mov	eax, DWORD PTR _toplevel$1756[ebp]
	push	eax
	push	0
	mov	eax, DWORD PTR _decl$1751[ebp]
	push	eax
	call	_rest_of_decl_compilation
	add	esp, 16					; 00000010H
; Line 3451
	cmp	DWORD PTR _toplevel$1756[ebp], 0
	jne	$L1757
; Line 3452
	push	0
	mov	eax, DWORD PTR _decl$1751[ebp]
	push	eax
	call	_expand_decl
	add	esp, 8
; Line 3453
$L1757:
	mov	eax, DWORD PTR _current_binding_level$S719
	dec	DWORD PTR [eax+24]
; Line 3455
	jmp	$L1758
$L1755:
; Line 3456
	mov	eax, DWORD PTR _decl$1751[ebp]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+28], 0
	jne	$L1759
	mov	eax, DWORD PTR _decl$1751[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 16					; 00000010H
	jne	$L1759
; Line 3458
	mov	eax, DWORD PTR _decl$1751[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _element$1760[ebp], eax
; Line 3459
$L1762:
	mov	eax, DWORD PTR _element$1760[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 16					; 00000010H
	jne	$L1763
; Line 3460
	mov	eax, DWORD PTR _element$1760[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _element$1760[ebp], eax
	jmp	$L1762
$L1763:
; Line 3461
	mov	eax, DWORD PTR _t$[ebp]
	cmp	DWORD PTR _element$1760[ebp], eax
	jne	$L1764
; Line 3462
	mov	eax, DWORD PTR _decl$1751[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_layout_array_type
	add	esp, 4
; Line 3463
$L1764:
; Line 3464
$L1759:
$L1758:
	jmp	$L1753
$L1754:
; Line 3467
$L1750:
	mov	eax, DWORD PTR _old_momentary$[ebp]
	push	eax
	call	_resume_momentary
	add	esp, 4
; Line 3469
	mov	eax, DWORD PTR _t$[ebp]
	jmp	$L1675
; Line 3470
$L1675:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_finish_struct ENDP
_t$ = 8
_layout_array_type PROC NEAR
; Line 3477
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 3478
	mov	eax, DWORD PTR _t$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 16					; 00000010H
	jne	$L1768
; Line 3479
	mov	eax, DWORD PTR _t$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_layout_array_type
	add	esp, 4
; Line 3480
$L1768:
	mov	eax, DWORD PTR _t$[ebp]
	push	eax
	call	_layout_type
	add	esp, 4
; Line 3481
$L1767:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_layout_array_type ENDP
_TEXT	ENDS
PUBLIC	_start_enum
EXTRN	_fixup_unsigned_type:NEAR
_BSS	SEGMENT
_enum_next_value$S710 DD 01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+2
$SG1776	DB	'redeclaration of `enum %s''', 00H
_DATA	ENDS
_TEXT	SEGMENT
_name$ = 8
_enumtype$ = -4
_start_enum PROC NEAR
; Line 3492
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 3493
	mov	DWORD PTR _enumtype$[ebp], 0
; Line 3499
	cmp	DWORD PTR _name$[ebp], 0
	je	$L1772
; Line 3500
	push	1
	mov	eax, DWORD PTR _current_binding_level$S719
	push	eax
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	push	8
	call	_lookup_tag
	add	esp, 16					; 00000010H
	mov	DWORD PTR _enumtype$[ebp], eax
; Line 3502
$L1772:
	cmp	DWORD PTR _enumtype$[ebp], 0
	je	$L1774
	mov	eax, DWORD PTR _enumtype$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 8
	je	$L1773
$L1774:
; Line 3504
	push	8
	call	_make_node
	add	esp, 4
	mov	DWORD PTR _enumtype$[ebp], eax
; Line 3505
	mov	eax, DWORD PTR _enumtype$[ebp]
	push	eax
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_pushtag
	add	esp, 8
; Line 3508
$L1773:
	mov	eax, DWORD PTR _enumtype$[ebp]
	cmp	DWORD PTR [eax+20], 0
	je	$L1775
; Line 3511
	mov	eax, DWORD PTR _name$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	OFFSET $SG1776
	call	_error
	add	esp, 8
; Line 3515
	mov	eax, DWORD PTR _enumtype$[ebp]
	mov	DWORD PTR [eax+20], 0
; Line 3523
$L1775:
	mov	eax, DWORD PTR _integer_type_node
	mov	al, BYTE PTR [eax+38]
	mov	ecx, DWORD PTR _enumtype$[ebp]
	mov	BYTE PTR [ecx+38], al
; Line 3524
	mov	eax, DWORD PTR _enumtype$[ebp]
	mov	DWORD PTR [eax+28], 0
; Line 3525
	mov	eax, DWORD PTR _enumtype$[ebp]
	push	eax
	call	_fixup_unsigned_type
	add	esp, 4
; Line 3527
	mov	eax, DWORD PTR _integer_zero_node
	mov	DWORD PTR _enum_next_value$S710, eax
; Line 3529
	mov	eax, DWORD PTR _enumtype$[ebp]
	jmp	$L1770
; Line 3530
$L1770:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_start_enum ENDP
_TEXT	ENDS
PUBLIC	_finish_enum
EXTRN	_floor_log2:NEAR
EXTRN	_round_size:NEAR
_DATA	SEGMENT
	ORG $+1
$SG1787	DB	'enum defined inside parms', 00H
_DATA	ENDS
_TEXT	SEGMENT
_maxvalue$1798 = -40
_minvalue$1799 = -36
_prec$1800 = -32
_negprec$1805 = -44
_enumtype$ = 8
_values$ = 12
_pair$ = -4
_maximum$ = -20
_minimum$ = -16
_maxvalue$ = -12
_minvalue$ = -8
_value$1791 = -28
_finish_enum PROC NEAR
; Line 3540
	push	ebp
	mov	ebp, esp
	sub	esp, 44					; 0000002cH
	push	ebx
	push	esi
	push	edi
; Line 3542
	mov	DWORD PTR _maximum$[ebp], 0
	mov	DWORD PTR _minimum$[ebp], 0
; Line 3543
	mov	DWORD PTR _maxvalue$[ebp], 0
; Line 3544
	mov	DWORD PTR _minvalue$[ebp], 0
; Line 3547
	call	_in_parm_level_p
	or	eax, eax
	je	$L1786
; Line 3548
	push	OFFSET $SG1787
	call	_warning
	add	esp, 4
; Line 3550
$L1786:
	mov	eax, DWORD PTR _values$[ebp]
	mov	ecx, DWORD PTR _enumtype$[ebp]
	mov	DWORD PTR [ecx+20], eax
; Line 3555
	mov	eax, DWORD PTR _values$[ebp]
	mov	DWORD PTR _pair$[ebp], eax
	jmp	$L1788
$L1789:
	mov	eax, DWORD PTR _pair$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _pair$[ebp], eax
$L1788:
	cmp	DWORD PTR _pair$[ebp], 0
	je	$L1790
; Line 3557
	mov	eax, DWORD PTR _pair$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _value$1791[ebp], eax
; Line 3558
	mov	eax, DWORD PTR _values$[ebp]
	cmp	DWORD PTR _pair$[ebp], eax
	jne	$L1792
; Line 3559
	mov	eax, DWORD PTR _value$1791[ebp]
	mov	DWORD PTR _minimum$[ebp], eax
	mov	eax, DWORD PTR _minimum$[ebp]
	mov	DWORD PTR _maximum$[ebp], eax
; Line 3560
	jmp	$L1793
$L1792:
; Line 3562
	mov	eax, DWORD PTR _value$1791[ebp]
	push	eax
	mov	eax, DWORD PTR _maximum$[ebp]
	push	eax
	call	_tree_int_cst_lt
	add	esp, 8
	or	eax, eax
	je	$L1794
; Line 3563
	mov	eax, DWORD PTR _value$1791[ebp]
	mov	DWORD PTR _maximum$[ebp], eax
; Line 3564
$L1794:
	mov	eax, DWORD PTR _minimum$[ebp]
	push	eax
	mov	eax, DWORD PTR _value$1791[ebp]
	push	eax
	call	_tree_int_cst_lt
	add	esp, 8
	or	eax, eax
	je	$L1795
; Line 3565
	mov	eax, DWORD PTR _value$1791[ebp]
	mov	DWORD PTR _minimum$[ebp], eax
; Line 3566
$L1795:
$L1793:
; Line 3567
	jmp	$L1789
$L1790:
; Line 3569
	mov	eax, DWORD PTR _minimum$[ebp]
	mov	ecx, DWORD PTR _enumtype$[ebp]
	mov	DWORD PTR [ecx+24], eax
; Line 3570
	mov	eax, DWORD PTR _maximum$[ebp]
	mov	ecx, DWORD PTR _enumtype$[ebp]
	mov	DWORD PTR [ecx+60], eax
; Line 3573
	mov	eax, DWORD PTR _integer_zero_node
	push	eax
	mov	eax, DWORD PTR _minimum$[ebp]
	push	eax
	call	_tree_int_cst_lt
	add	esp, 8
	or	eax, eax
	je	$L1796
; Line 3574
	mov	eax, DWORD PTR _enumtype$[ebp]
	and	DWORD PTR [eax+16], -4097		; ffffefffH
; Line 3576
$L1796:
	cmp	DWORD PTR _flag_short_enums, 0
	je	$L1797
; Line 3579
	mov	eax, DWORD PTR _maximum$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _maxvalue$1798[ebp], eax
; Line 3580
	mov	eax, DWORD PTR _minimum$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _minvalue$1799[ebp], eax
; Line 3581
	mov	eax, DWORD PTR _maxvalue$1798[ebp]
	push	eax
	call	_floor_log2
	add	esp, 4
	inc	eax
	mov	DWORD PTR _prec$1800[ebp], eax
; Line 3583
	mov	eax, DWORD PTR _integer_zero_node
	push	eax
	mov	eax, DWORD PTR _minimum$[ebp]
	push	eax
	call	_tree_int_cst_lt
	add	esp, 8
	or	eax, eax
	jne	$L1802
; Line 3586
	cmp	DWORD PTR _prec$1800[ebp], 0
	jne	$L1803
; Line 3587
	mov	DWORD PTR _prec$1800[ebp], 1
; Line 3589
$L1803:
	mov	al, BYTE PTR _prec$1800[ebp]
	mov	ecx, DWORD PTR _enumtype$[ebp]
	mov	BYTE PTR [ecx+38], al
; Line 3591
	jmp	$L1804
$L1802:
; Line 3593
	mov	eax, -1
	sub	eax, DWORD PTR _minvalue$1799[ebp]
	push	eax
	call	_floor_log2
	add	esp, 4
	inc	eax
	mov	DWORD PTR _negprec$1805[ebp], eax
; Line 3595
	mov	eax, DWORD PTR _prec$1800[ebp]
	cmp	DWORD PTR _negprec$1805[ebp], eax
	jle	$L1806
; Line 3596
	mov	eax, DWORD PTR _negprec$1805[ebp]
	mov	DWORD PTR _prec$1800[ebp], eax
; Line 3597
$L1806:
	mov	eax, DWORD PTR _prec$1800[ebp]
	inc	eax
	mov	ecx, DWORD PTR _enumtype$[ebp]
	mov	BYTE PTR [ecx+38], al
; Line 3598
$L1804:
; Line 3602
	mov	eax, DWORD PTR _enumtype$[ebp]
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	push	eax
	call	_round_size
	add	esp, 4
	mov	ecx, DWORD PTR _enumtype$[ebp]
	mov	BYTE PTR [ecx+38], al
; Line 3606
	mov	eax, DWORD PTR _enumtype$[ebp]
	mov	DWORD PTR [eax+28], 0
; Line 3608
	mov	eax, DWORD PTR _enumtype$[ebp]
	push	eax
	call	_layout_type
	add	esp, 4
; Line 3611
$L1797:
	mov	eax, DWORD PTR _enumtype$[ebp]
	jmp	$L1779
; Line 3612
$L1779:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_finish_enum ENDP
_TEXT	ENDS
PUBLIC	_build_enumerator
EXTRN	_int_fits_type_p:NEAR
EXTRN	_build_binary_op_nodefault:NEAR
_DATA	SEGMENT
	ORG $+2
$SG1816	DB	'enumerator value for `%s'' not integer constant', 00H
	ORG $+1
$SG1820	DB	'enumerator value outside range of `int''', 00H
_DATA	ENDS
_TEXT	SEGMENT
_name$ = 8
_value$ = 12
_decl$ = -4
_build_enumerator PROC NEAR
; Line 3622
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 3628
$L1813:
	cmp	DWORD PTR _value$[ebp], 0
	je	$L1814
	mov	eax, DWORD PTR _value$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 113				; 00000071H
	jne	$L1814
; Line 3629
	mov	eax, DWORD PTR _value$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _value$[ebp], eax
	jmp	$L1813
$L1814:
; Line 3631
	cmp	DWORD PTR _value$[ebp], 0
	je	$L1815
	mov	eax, DWORD PTR _value$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	je	$L1815
; Line 3634
	mov	eax, DWORD PTR _name$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	OFFSET $SG1816
	call	_error
	add	esp, 8
; Line 3635
	mov	DWORD PTR _value$[ebp], 0
; Line 3639
$L1815:
	cmp	DWORD PTR _value$[ebp], 0
	jne	$L1817
; Line 3640
	mov	eax, DWORD PTR _enum_next_value$S710
	mov	DWORD PTR _value$[ebp], eax
; Line 3644
$L1817:
	mov	eax, DWORD PTR _integer_type_node
	push	eax
	mov	eax, DWORD PTR _value$[ebp]
	push	eax
	call	_int_fits_type_p
	add	esp, 8
	or	eax, eax
	jne	$L1819
; Line 3646
	push	OFFSET $SG1820
	call	_error
	add	esp, 4
; Line 3647
	mov	eax, DWORD PTR _integer_zero_node
	mov	DWORD PTR _value$[ebp], eax
; Line 3651
$L1819:
; Line 3652
	push	64					; 00000040H
	mov	eax, DWORD PTR _integer_one_node
	push	eax
	mov	eax, DWORD PTR _value$[ebp]
	push	eax
	push	64					; 00000040H
	call	_build_binary_op_nodefault
	add	esp, 16					; 00000010H
	mov	DWORD PTR _enum_next_value$S710, eax
; Line 3656
	mov	eax, DWORD PTR _integer_type_node
	push	eax
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	push	41					; 00000029H
	call	_build_decl
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _decl$[ebp], eax
; Line 3657
	mov	eax, DWORD PTR _value$[ebp]
	mov	ecx, DWORD PTR _decl$[ebp]
	mov	DWORD PTR [ecx+64], eax
; Line 3658
	mov	eax, DWORD PTR _integer_type_node
	mov	ecx, DWORD PTR _value$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 3659
	mov	eax, DWORD PTR _decl$[ebp]
	push	eax
	call	_pushdecl
	add	esp, 4
; Line 3661
	push	0
	mov	eax, DWORD PTR _value$[ebp]
	push	eax
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_saveable_tree_cons
	add	esp, 12					; 0000000cH
	jmp	$L1810
; Line 3662
$L1810:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_build_enumerator ENDP
_TEXT	ENDS
PUBLIC	_start_function
EXTRN	_announce_function:NEAR
EXTRN	_make_function_rtl:NEAR
_BSS	SEGMENT
_current_function_parms$S713 DD 01H DUP (?)
_current_function_parm_tags$S714 DD 01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG1830	DB	'return-type is an incomplete type', 00H
	ORG $+2
$SG1832	DB	'return-type defaults to `int''', 00H
_DATA	ENDS
_TEXT	SEGMENT
_declspecs$ = 8
_declarator$ = 12
_decl1$ = -12
_old_decl$ = -8
_restype$ = -4
_start_function PROC NEAR
; Line 3679
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 3683
	mov	DWORD PTR _current_function_returns_value, 0
; Line 3684
	mov	DWORD PTR _current_function_returns_null, 0
; Line 3685
	mov	DWORD PTR _warn_about_return_type$S716, 0
; Line 3686
	mov	DWORD PTR _current_extern_inline$S717, 0
; Line 3688
	push	1
	push	1
	mov	eax, DWORD PTR _declspecs$[ebp]
	push	eax
	mov	eax, DWORD PTR _declarator$[ebp]
	push	eax
	call	_grokdeclarator
	add	esp, 16					; 00000010H
	mov	DWORD PTR _decl1$[ebp], eax
; Line 3692
	cmp	DWORD PTR _decl1$[ebp], 0
	jne	$L1827
; Line 3693
	sub	eax, eax
	jmp	$L1823
; Line 3695
$L1827:
	mov	eax, DWORD PTR _decl1$[ebp]
	mov	DWORD PTR _current_function_decl, eax
; Line 3697
	mov	eax, DWORD PTR _current_function_decl
	push	eax
	call	_announce_function
	add	esp, 4
; Line 3699
	mov	eax, DWORD PTR _decl1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+28], 0
	jne	$L1829
; Line 3701
	push	OFFSET $SG1830
	call	_error
	add	esp, 4
; Line 3705
	mov	eax, DWORD PTR _decl1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	mov	eax, DWORD PTR _void_type_node
	push	eax
	call	_build_function_type
	add	esp, 8
	mov	ecx, DWORD PTR _decl1$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 3708
$L1829:
	cmp	DWORD PTR _warn_about_return_type$S716, 0
	je	$L1831
; Line 3709
	push	OFFSET $SG1832
	call	_warning
	add	esp, 4
; Line 3713
$L1831:
	mov	eax, DWORD PTR _last_function_parms$S711
	mov	DWORD PTR _current_function_parms$S713, eax
; Line 3714
	mov	eax, DWORD PTR _last_function_parm_tags$S712
	mov	DWORD PTR _current_function_parm_tags$S714, eax
; Line 3718
	mov	eax, DWORD PTR _error_mark_node
	mov	ecx, DWORD PTR _current_function_decl
	mov	DWORD PTR [ecx+64], eax
; Line 3722
	mov	eax, DWORD PTR _current_function_decl
	mov	eax, DWORD PTR [eax+40]
	push	eax
	call	_lookup_name_current_level
	add	esp, 4
	mov	DWORD PTR _old_decl$[ebp], eax
; Line 3725
	cmp	DWORD PTR _old_decl$[ebp], 0
	je	$L1833
	mov	eax, DWORD PTR _old_decl$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _current_function_decl
	mov	ecx, DWORD PTR [ecx+8]
	mov	ecx, DWORD PTR [ecx+8]
	cmp	DWORD PTR [eax+8], ecx
	jne	$L1833
	mov	eax, DWORD PTR _current_function_decl
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+20], 0
	jne	$L1833
; Line 3726
	mov	eax, DWORD PTR _old_decl$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _current_function_decl
	mov	DWORD PTR [ecx+8], eax
; Line 3732
$L1833:
	mov	eax, DWORD PTR _current_function_decl
	mov	eax, DWORD PTR [eax+16]
	and	eax, -2					; fffffffeH
	mov	ecx, DWORD PTR _current_extern_inline$S717
	and	ecx, 1
	or	eax, ecx
	mov	ecx, DWORD PTR _current_function_decl
	mov	DWORD PTR [ecx+16], eax
; Line 3736
	mov	eax, DWORD PTR _current_function_decl
	mov	eax, DWORD PTR [eax+16]
	or	eax, 4
	mov	ecx, DWORD PTR _current_function_decl
	mov	DWORD PTR [ecx+16], eax
; Line 3742
	mov	eax, DWORD PTR _current_function_decl
	push	eax
	call	_pushdecl
	add	esp, 4
	mov	DWORD PTR _current_function_decl, eax
; Line 3744
	push	0
	call	_pushlevel
	add	esp, 4
; Line 3745
	call	_declare_parm_level
; Line 3747
	mov	eax, DWORD PTR _current_function_decl
	push	eax
	call	_make_function_rtl
	add	esp, 4
; Line 3749
	mov	eax, DWORD PTR _current_function_decl
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _restype$[ebp], eax
; Line 3752
	mov	eax, DWORD PTR _restype$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 5
	jne	$L1835
	mov	eax, DWORD PTR _restype$[ebp]
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _integer_type_node
	mov	cl, BYTE PTR [ecx+38]
	and	ecx, 255				; 000000ffH
	cmp	eax, ecx
	jge	$L1835
; Line 3753
	mov	eax, DWORD PTR _integer_type_node
	mov	DWORD PTR _restype$[ebp], eax
; Line 3754
$L1835:
	mov	eax, DWORD PTR _restype$[ebp]
	mov	ecx, DWORD PTR _current_function_decl
	mov	DWORD PTR [ecx+52], eax
; Line 3756
	mov	eax, DWORD PTR _restype$[ebp]
	push	eax
	mov	eax, DWORD PTR _value_identifier
	push	eax
	push	45					; 0000002dH
	call	_build_decl
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _current_function_decl
	mov	DWORD PTR [ecx+60], eax
; Line 3760
	call	_temporary_allocation
; Line 3764
	mov	eax, DWORD PTR _current_function_decl
	mov	eax, DWORD PTR [eax+40]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 9
	test	al, 1
	je	$L1836
; Line 3765
	mov	eax, DWORD PTR _current_function_decl
	mov	eax, DWORD PTR [eax+16]
	or	eax, 512				; 00000200H
	mov	ecx, DWORD PTR _current_function_decl
	mov	DWORD PTR [ecx+16], eax
; Line 3767
$L1836:
	mov	eax, 1
	jmp	$L1823
; Line 3768
$L1823:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_start_function ENDP
_TEXT	ENDS
PUBLIC	_store_parm_decls
EXTRN	_init_function_start:NEAR
EXTRN	_expand_function_start:NEAR
EXTRN	_lineno:DWORD
_DATA	SEGMENT
	ORG $+2
$SG1848	DB	'parm types given both in parmlist and separately', 00H
	ORG $+3
$SG1853	DB	'parameter name omitted', 00H
	ORG $+1
$SG1856	DB	'parameter `%s'' declared void', 00H
	ORG $+3
$SG1875	DB	'parameter name missing from parameter list', 00H
	ORG $+1
$SG1881	DB	'multiple parameters named `%s''', 00H
	ORG $+1
$SG1883	DB	'parameter `%s'' declared void', 00H
	ORG $+3
$SG1886	DB	'type of `%s'' defaults to `int''', 00H
	ORG $+1
$SG1892	DB	'parameter `%s'' has incomplete type', 00H
	ORG $+1
$SG1896	DB	'declaration for parameter `%s'' but no such parameter', 00H
	ORG $+3
$SG1912	DB	'number of arguments doesn''t match prototype', 00H
$SG1915	DB	'argument `%s'' doesn''t match function prototype', 00H
	ORG $+1
$SG1917	DB	'a formal parameter type that promotes to `int''', 00H
	ORG $+1
$SG1918	DB	'can match only `int'' in the prototype', 00H
	ORG $+2
$SG1920	DB	'a formal parameter type that promotes to `double''', 00H
	ORG $+2
$SG1921	DB	'can match only `double'' in the prototype', 00H
_DATA	ENDS
_TEXT	SEGMENT
_tail$1872 = -36
_found$1873 = -40
_next$1890 = -44
_last$1897 = -48
_fndecl$ = -4
_parm$ = -16
_specparms$ = -24
_type$1905 = -52
_parmtags$ = -20
_parmdecls$ = -12
_nonparms$ = -8
_next$1845 = -32
_others$1846 = -28
_store_parm_decls PROC NEAR
; Line 3776
	push	ebp
	mov	ebp, esp
	sub	esp, 52					; 00000034H
	push	ebx
	push	esi
	push	edi
; Line 3777
	mov	eax, DWORD PTR _current_function_decl
	mov	DWORD PTR _fndecl$[ebp], eax
; Line 3782
	mov	eax, DWORD PTR _current_function_parms$S713
	mov	DWORD PTR _specparms$[ebp], eax
; Line 3785
	mov	eax, DWORD PTR _current_function_parm_tags$S714
	mov	DWORD PTR _parmtags$[ebp], eax
; Line 3788
	call	_getdecls
	mov	DWORD PTR _parmdecls$[ebp], eax
; Line 3793
	mov	DWORD PTR _nonparms$[ebp], 0
; Line 3795
	cmp	DWORD PTR _specparms$[ebp], 0
	je	$L1844
	mov	eax, DWORD PTR _specparms$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 3
	je	$L1844
; Line 3803
	mov	DWORD PTR _others$1846[ebp], 0
; Line 3805
	cmp	DWORD PTR _parmdecls$[ebp], 0
	je	$L1847
; Line 3807
	push	OFFSET $SG1848
	mov	eax, DWORD PTR _fndecl$[ebp]
	push	eax
	call	_error_with_decl
	add	esp, 8
; Line 3809
$L1847:
	mov	eax, DWORD PTR _specparms$[ebp]
	push	eax
	call	_nreverse
	add	esp, 4
	mov	DWORD PTR _specparms$[ebp], eax
; Line 3810
	mov	eax, DWORD PTR _specparms$[ebp]
	mov	DWORD PTR _parm$[ebp], eax
	jmp	$L1849
$L1850:
	mov	eax, DWORD PTR _next$1845[ebp]
	mov	DWORD PTR _parm$[ebp], eax
$L1849:
	cmp	DWORD PTR _parm$[ebp], 0
	je	$L1851
; Line 3812
	mov	eax, DWORD PTR _parm$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _next$1845[ebp], eax
; Line 3813
	mov	eax, DWORD PTR _parm$[ebp]
	cmp	DWORD PTR [eax+40], 0
	jne	$L1852
; Line 3814
	push	OFFSET $SG1853
	mov	eax, DWORD PTR _parm$[ebp]
	push	eax
	call	_error_with_decl
	add	esp, 8
; Line 3815
	jmp	$L1854
$L1852:
	mov	eax, DWORD PTR _parm$[ebp]
	mov	ecx, DWORD PTR _void_type_node
	cmp	DWORD PTR [eax+8], ecx
	jne	$L1855
; Line 3816
	push	OFFSET $SG1856
	mov	eax, DWORD PTR _parm$[ebp]
	push	eax
	call	_error_with_decl
	add	esp, 8
; Line 3817
	jmp	$L1857
$L1855:
	mov	eax, DWORD PTR _parm$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 44					; 0000002cH
	jne	$L1858
; Line 3818
	mov	eax, DWORD PTR _parm$[ebp]
	push	eax
	call	_pushdecl
	add	esp, 4
; Line 3819
	jmp	$L1859
$L1858:
; Line 3822
	mov	eax, DWORD PTR _parm$[ebp]
	mov	DWORD PTR [eax+4], 0
; Line 3823
	mov	eax, DWORD PTR _parm$[ebp]
	push	eax
	mov	eax, DWORD PTR _others$1846[ebp]
	push	eax
	call	_chainon
	add	esp, 8
	mov	DWORD PTR _others$1846[ebp], eax
; Line 3824
$L1859:
$L1857:
$L1854:
; Line 3825
	jmp	$L1850
$L1851:
; Line 3829
	call	_getdecls
	mov	ecx, DWORD PTR _fndecl$[ebp]
	mov	DWORD PTR [ecx+56], eax
; Line 3832
	mov	eax, DWORD PTR _others$1846[ebp]
	mov	DWORD PTR _parm$[ebp], eax
	jmp	$L1860
$L1861:
	mov	eax, DWORD PTR _next$1845[ebp]
	mov	DWORD PTR _parm$[ebp], eax
$L1860:
	cmp	DWORD PTR _parm$[ebp], 0
	je	$L1862
; Line 3834
	mov	eax, DWORD PTR _parm$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _next$1845[ebp], eax
; Line 3835
	mov	eax, DWORD PTR _parm$[ebp]
	cmp	DWORD PTR [eax+40], 0
	jne	$L1863
; Line 3837
	jmp	$L1864
$L1863:
	mov	eax, DWORD PTR _parm$[ebp]
	mov	ecx, DWORD PTR _void_type_node
	cmp	DWORD PTR [eax+8], ecx
	jne	$L1865
; Line 3839
	jmp	$L1866
$L1865:
	mov	eax, DWORD PTR _parm$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 44					; 0000002cH
	je	$L1867
; Line 3840
	mov	eax, DWORD PTR _parm$[ebp]
	push	eax
	call	_pushdecl
	add	esp, 4
; Line 3841
$L1867:
$L1866:
$L1864:
	jmp	$L1861
$L1862:
; Line 3843
	call	_gettags
	push	eax
	mov	eax, DWORD PTR _parmtags$[ebp]
	push	eax
	call	_chainon
	add	esp, 8
	push	eax
	call	_storetags
	add	esp, 4
; Line 3845
	jmp	$L1868
$L1844:
; Line 3859
	mov	eax, DWORD PTR _specparms$[ebp]
	mov	DWORD PTR _parm$[ebp], eax
	jmp	$L1869
$L1870:
	mov	eax, DWORD PTR _parm$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _parm$[ebp], eax
$L1869:
	cmp	DWORD PTR _parm$[ebp], 0
	je	$L1871
; Line 3861
	mov	DWORD PTR _found$1873[ebp], 0
; Line 3863
	mov	eax, DWORD PTR _parm$[ebp]
	cmp	DWORD PTR [eax+24], 0
	jne	$L1874
; Line 3865
	push	OFFSET $SG1875
	mov	eax, DWORD PTR _fndecl$[ebp]
	push	eax
	call	_error_with_decl
	add	esp, 8
; Line 3866
	mov	eax, DWORD PTR _parm$[ebp]
	mov	DWORD PTR [eax+20], 0
; Line 3867
	jmp	$L1870
; Line 3872
$L1874:
	mov	eax, DWORD PTR _parmdecls$[ebp]
	mov	DWORD PTR _tail$1872[ebp], eax
	jmp	$L1876
$L1877:
	mov	eax, DWORD PTR _tail$1872[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _tail$1872[ebp], eax
$L1876:
	cmp	DWORD PTR _tail$1872[ebp], 0
	je	$L1878
; Line 3874
	mov	eax, DWORD PTR _tail$1872[ebp]
	mov	ecx, DWORD PTR _parm$[ebp]
	mov	ecx, DWORD PTR [ecx+24]
	cmp	DWORD PTR [eax+40], ecx
	jne	$L1879
	mov	eax, DWORD PTR _tail$1872[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 44					; 0000002cH
	jne	$L1879
; Line 3876
	mov	eax, DWORD PTR _tail$1872[ebp]
	mov	DWORD PTR _found$1873[ebp], eax
; Line 3877
	jmp	$L1878
; Line 3882
$L1879:
	jmp	$L1877
$L1878:
	cmp	DWORD PTR _found$1873[ebp], 0
	je	$L1880
	mov	eax, DWORD PTR _found$1873[ebp]
	cmp	DWORD PTR [eax+44], 0
	je	$L1880
; Line 3884
	push	OFFSET $SG1881
	mov	eax, DWORD PTR _found$1873[ebp]
	push	eax
	call	_error_with_decl
	add	esp, 8
; Line 3885
	mov	DWORD PTR _found$1873[ebp], 0
; Line 3889
$L1880:
	cmp	DWORD PTR _found$1873[ebp], 0
	je	$L1882
	mov	eax, DWORD PTR _found$1873[ebp]
	mov	ecx, DWORD PTR _void_type_node
	cmp	DWORD PTR [eax+8], ecx
	jne	$L1882
; Line 3891
	push	OFFSET $SG1883
	mov	eax, DWORD PTR _found$1873[ebp]
	push	eax
	call	_error_with_decl
	add	esp, 8
; Line 3892
	mov	eax, DWORD PTR _integer_type_node
	mov	ecx, DWORD PTR _found$1873[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 3893
	mov	eax, DWORD PTR _integer_type_node
	mov	ecx, DWORD PTR _found$1873[ebp]
	mov	DWORD PTR [ecx+56], eax
; Line 3894
	push	0
	mov	eax, DWORD PTR _found$1873[ebp]
	push	eax
	call	_layout_decl
	add	esp, 8
; Line 3898
$L1882:
	cmp	DWORD PTR _found$1873[ebp], 0
	jne	$L1884
; Line 3901
	mov	eax, DWORD PTR _integer_type_node
	push	eax
	mov	eax, DWORD PTR _parm$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	44					; 0000002cH
	call	_build_decl
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _found$1873[ebp], eax
; Line 3902
	mov	eax, DWORD PTR _found$1873[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _found$1873[ebp]
	mov	DWORD PTR [ecx+56], eax
; Line 3903
	mov	eax, DWORD PTR _fndecl$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	ecx, DWORD PTR _found$1873[ebp]
	mov	DWORD PTR [ecx+24], eax
; Line 3904
	mov	eax, DWORD PTR _fndecl$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	ecx, DWORD PTR _found$1873[ebp]
	mov	DWORD PTR [ecx+20], eax
; Line 3905
	cmp	DWORD PTR _extra_warnings, 0
	je	$L1885
; Line 3906
	push	OFFSET $SG1886
	mov	eax, DWORD PTR _found$1873[ebp]
	push	eax
	call	_warning_with_decl
	add	esp, 8
; Line 3907
$L1885:
	mov	eax, DWORD PTR _found$1873[ebp]
	push	eax
	call	_pushdecl
	add	esp, 4
; Line 3910
$L1884:
	mov	eax, DWORD PTR _found$1873[ebp]
	mov	ecx, DWORD PTR _parm$[ebp]
	mov	DWORD PTR [ecx+20], eax
; Line 3916
	mov	eax, DWORD PTR _error_mark_node
	mov	ecx, DWORD PTR _found$1873[ebp]
	mov	DWORD PTR [ecx+44], eax
; Line 3917
	jmp	$L1870
$L1871:
; Line 3922
	mov	DWORD PTR _nonparms$[ebp], 0
; Line 3923
	mov	eax, DWORD PTR _parmdecls$[ebp]
	mov	DWORD PTR _parm$[ebp], eax
$L1888:
	cmp	DWORD PTR _parm$[ebp], 0
	je	$L1889
; Line 3925
	mov	eax, DWORD PTR _parm$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _next$1890[ebp], eax
; Line 3926
	mov	eax, DWORD PTR _parm$[ebp]
	mov	DWORD PTR [eax+4], 0
; Line 3929
	mov	eax, DWORD PTR _parm$[ebp]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+28], 0
	jne	$L1891
; Line 3931
	push	OFFSET $SG1892
	mov	eax, DWORD PTR _parm$[ebp]
	push	eax
	call	_error_with_decl
	add	esp, 8
; Line 3932
	mov	eax, DWORD PTR _error_mark_node
	mov	ecx, DWORD PTR _parm$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 3935
$L1891:
	mov	eax, DWORD PTR _parm$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 44					; 0000002cH
	je	$L1893
; Line 3936
	mov	eax, DWORD PTR _parm$[ebp]
	push	eax
	mov	eax, DWORD PTR _nonparms$[ebp]
	push	eax
	call	_chainon
	add	esp, 8
	mov	DWORD PTR _nonparms$[ebp], eax
; Line 3938
	jmp	$L1894
$L1893:
	mov	eax, DWORD PTR _parm$[ebp]
	cmp	DWORD PTR [eax+44], 0
	jne	$L1895
; Line 3941
	push	OFFSET $SG1896
	mov	eax, DWORD PTR _parm$[ebp]
	push	eax
	call	_error_with_decl
	add	esp, 8
; Line 3947
	push	0
	push	0
	mov	eax, DWORD PTR _parm$[ebp]
	push	eax
	call	_tree_cons
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _specparms$[ebp]
	push	eax
	call	_chainon
	add	esp, 8
	mov	DWORD PTR _specparms$[ebp], eax
; Line 3950
$L1895:
$L1894:
	mov	eax, DWORD PTR _next$1890[ebp]
	mov	DWORD PTR _parm$[ebp], eax
; Line 3951
	jmp	$L1888
$L1889:
; Line 3955
	mov	eax, DWORD PTR _specparms$[ebp]
	mov	DWORD PTR _parm$[ebp], eax
; Line 3956
	mov	eax, DWORD PTR _fndecl$[ebp]
	mov	DWORD PTR [eax+56], 0
; Line 3959
	mov	DWORD PTR _last$1897[ebp], 0
	jmp	$L1898
$L1899:
	mov	eax, DWORD PTR _parm$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _parm$[ebp], eax
$L1898:
	cmp	DWORD PTR _parm$[ebp], 0
	je	$L1900
; Line 3960
	mov	eax, DWORD PTR _parm$[ebp]
	cmp	DWORD PTR [eax+20], 0
	je	$L1901
; Line 3962
	cmp	DWORD PTR _last$1897[ebp], 0
	jne	$L1902
; Line 3963
	mov	eax, DWORD PTR _parm$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	ecx, DWORD PTR _fndecl$[ebp]
	mov	DWORD PTR [ecx+56], eax
; Line 3964
	jmp	$L1903
$L1902:
; Line 3965
	mov	eax, DWORD PTR _parm$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	ecx, DWORD PTR _last$1897[ebp]
	mov	DWORD PTR [ecx+4], eax
$L1903:
; Line 3966
	mov	eax, DWORD PTR _parm$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _last$1897[ebp], eax
; Line 3967
	mov	eax, DWORD PTR _last$1897[ebp]
	mov	DWORD PTR [eax+4], 0
; Line 3968
	mov	eax, DWORD PTR _last$1897[ebp]
	mov	DWORD PTR [eax+44], 0
; Line 3970
$L1901:
	jmp	$L1899
$L1900:
; Line 3976
	mov	eax, DWORD PTR _fndecl$[ebp]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+20], 0
	je	$L1904
; Line 3982
	mov	eax, DWORD PTR _fndecl$[ebp]
	mov	eax, DWORD PTR [eax+56]
	mov	DWORD PTR _parm$[ebp], eax
	mov	eax, DWORD PTR _fndecl$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _type$1905[ebp], eax
	jmp	$L1906
$L1907:
	mov	eax, DWORD PTR _parm$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _parm$[ebp], eax
	mov	eax, DWORD PTR _type$1905[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _type$1905[ebp], eax
$L1906:
	cmp	DWORD PTR _parm$[ebp], 0
	jne	$L1909
	cmp	DWORD PTR _type$1905[ebp], 0
	je	$L1908
	mov	eax, DWORD PTR _type$1905[ebp]
	mov	ecx, DWORD PTR _void_type_node
	cmp	DWORD PTR [eax+24], ecx
	je	$L1908
$L1909:
; Line 3985
	cmp	DWORD PTR _parm$[ebp], 0
	je	$L1911
	cmp	DWORD PTR _type$1905[ebp], 0
	je	$L1911
	mov	eax, DWORD PTR _type$1905[ebp]
	mov	ecx, DWORD PTR _void_type_node
	cmp	DWORD PTR [eax+24], ecx
	jne	$L1910
$L1911:
; Line 3987
	push	OFFSET $SG1912
	call	_error
	add	esp, 4
; Line 3988
	jmp	$L1908
; Line 3992
$L1910:
; Line 3997
	mov	eax, DWORD PTR _type$1905[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	mov	eax, DWORD PTR _parm$[ebp]
	mov	eax, DWORD PTR [eax+56]
	push	eax
	call	_comptypes
	add	esp, 8
	or	eax, eax
	jne	$L1913
	cmp	DWORD PTR _flag_traditional, 0
	je	$L1914
	mov	eax, DWORD PTR _parm$[ebp]
	mov	ecx, DWORD PTR _integer_type_node
	cmp	DWORD PTR [eax+56], ecx
	jne	$L1914
	mov	eax, DWORD PTR _type$1905[ebp]
	mov	ecx, DWORD PTR _unsigned_type_node
	cmp	DWORD PTR [eax+24], ecx
	je	$L1913
$L1914:
; Line 4000
	mov	eax, DWORD PTR _parm$[ebp]
	mov	eax, DWORD PTR [eax+40]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	OFFSET $SG1915
	call	_error
	add	esp, 8
; Line 4002
	mov	eax, DWORD PTR _parm$[ebp]
	mov	ecx, DWORD PTR _integer_type_node
	cmp	DWORD PTR [eax+56], ecx
	jne	$L1916
	mov	eax, DWORD PTR _parm$[ebp]
	mov	ecx, DWORD PTR _type$1905[ebp]
	mov	ecx, DWORD PTR [ecx+24]
	cmp	DWORD PTR [eax+8], ecx
	jne	$L1916
; Line 4004
	push	OFFSET $SG1917
	call	_error
	add	esp, 4
; Line 4005
	push	OFFSET $SG1918
	call	_error
	add	esp, 4
; Line 4007
$L1916:
; Line 4008
	mov	eax, DWORD PTR _parm$[ebp]
	mov	ecx, DWORD PTR _double_type_node
	cmp	DWORD PTR [eax+56], ecx
	jne	$L1919
	mov	eax, DWORD PTR _parm$[ebp]
	mov	ecx, DWORD PTR _type$1905[ebp]
	mov	ecx, DWORD PTR [ecx+24]
	cmp	DWORD PTR [eax+8], ecx
	jne	$L1919
; Line 4010
	push	OFFSET $SG1920
	call	_error
	add	esp, 4
; Line 4011
	push	OFFSET $SG1921
	call	_error
	add	esp, 4
; Line 4013
$L1919:
; Line 4014
$L1913:
	jmp	$L1907
$L1908:
; Line 4022
$L1904:
	mov	eax, DWORD PTR _fndecl$[ebp]
	mov	eax, DWORD PTR [eax+56]
	push	eax
	mov	eax, DWORD PTR _nonparms$[ebp]
	push	eax
	call	_chainon
	add	esp, 8
	push	eax
	call	_storedecls
	add	esp, 4
; Line 4023
$L1868:
; Line 4029
	mov	DWORD PTR _keep_next_if_subblocks$S724, 1
; Line 4033
	mov	eax, DWORD PTR _lineno
	push	eax
	mov	eax, DWORD PTR _input_filename
	push	eax
	mov	eax, DWORD PTR _fndecl$[ebp]
	push	eax
	call	_init_function_start
	add	esp, 12					; 0000000cH
; Line 4037
	push	0
	mov	eax, DWORD PTR _fndecl$[ebp]
	push	eax
	call	_expand_function_start
	add	esp, 8
; Line 4038
$L1837:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_store_parm_decls ENDP
_TEXT	ENDS
PUBLIC	_finish_function
EXTRN	_setjmp_protect:NEAR
EXTRN	_expand_function_end:NEAR
EXTRN	_rest_of_compilation:NEAR
EXTRN	_current_function_calls_setjmp:DWORD
_DATA	SEGMENT
	ORG $+3
$SG1932	DB	'`volatile'' function does return', 00H
$SG1935	DB	'control reaches end of non-void function', 00H
	ORG $+3
$SG1938	DB	'this function may return with or without a value', 00H
_DATA	ENDS
_TEXT	SEGMENT
_lineno$ = 8
_fndecl$ = -4
_finish_function PROC NEAR
; Line 4050
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 4051
	mov	eax, DWORD PTR _current_function_decl
	mov	DWORD PTR _fndecl$[ebp], eax
; Line 4057
	push	1
	push	0
	push	1
	call	_poplevel
	add	esp, 12					; 0000000cH
; Line 4061
	mov	eax, DWORD PTR _fndecl$[ebp]
	mov	eax, DWORD PTR [eax+64]
	mov	ecx, DWORD PTR _fndecl$[ebp]
	mov	ecx, DWORD PTR [ecx+60]
	mov	DWORD PTR [ecx+44], eax
; Line 4064
	cmp	DWORD PTR _flag_traditional, 0
	je	$L1927
	cmp	DWORD PTR _current_function_calls_setjmp, 0
	je	$L1927
; Line 4065
	mov	eax, DWORD PTR _fndecl$[ebp]
	mov	eax, DWORD PTR [eax+64]
	push	eax
	call	_setjmp_protect
	add	esp, 4
; Line 4068
$L1927:
	mov	eax, DWORD PTR _lineno$[ebp]
	push	eax
	mov	eax, DWORD PTR _input_filename
	push	eax
	call	_expand_function_end
	add	esp, 8
; Line 4071
	mov	DWORD PTR _current_function_returns_null, 0
; Line 4074
	mov	eax, DWORD PTR _fndecl$[ebp]
	push	eax
	call	_rest_of_compilation
	add	esp, 4
; Line 4076
	mov	eax, DWORD PTR _fndecl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 11					; 0000000bH
	test	al, 1
	je	$L1931
	cmp	DWORD PTR _current_function_returns_null, 0
	je	$L1931
; Line 4077
	push	OFFSET $SG1932
	call	_warning
	add	esp, 4
; Line 4078
	jmp	$L1933
$L1931:
; Line 4079
	cmp	DWORD PTR _warn_return_type, 0
	je	$L1934
	cmp	DWORD PTR _current_function_returns_null, 0
	je	$L1934
	mov	eax, DWORD PTR _fndecl$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _void_type_node
	cmp	DWORD PTR [eax+8], ecx
	je	$L1934
; Line 4082
	push	OFFSET $SG1935
	call	_warning
	add	esp, 4
; Line 4085
	jmp	$L1936
$L1934:
; Line 4086
	cmp	DWORD PTR _extra_warnings, 0
	je	$L1937
	cmp	DWORD PTR _current_function_returns_value, 0
	je	$L1937
	cmp	DWORD PTR _current_function_returns_null, 0
	je	$L1937
; Line 4087
	push	OFFSET $SG1938
	call	_warning
	add	esp, 4
; Line 4092
$L1937:
$L1936:
$L1933:
	call	_permanent_allocation
; Line 4094
	mov	eax, DWORD PTR _fndecl$[ebp]
	cmp	DWORD PTR [eax+84], 0
	jne	$L1939
; Line 4099
	mov	eax, DWORD PTR _error_mark_node
	mov	ecx, DWORD PTR _fndecl$[ebp]
	mov	DWORD PTR [ecx+64], eax
; Line 4100
	mov	eax, DWORD PTR _fndecl$[ebp]
	mov	DWORD PTR [eax+56], 0
; Line 4104
$L1939:
	mov	DWORD PTR _current_function_decl, 0
; Line 4105
$L1925:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_finish_function ENDP
_TEXT	ENDS
END
