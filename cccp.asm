	TITLE	cccp.c
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
PUBLIC	_predefs
PUBLIC	_put_out_comments
PUBLIC	_directive_table
PUBLIC	_no_trigraphs
PUBLIC	_print_deps
PUBLIC	_indepth
PUBLIC	_system_include_depth
PUBLIC	_include_defaults
PUBLIC	_errors
PUBLIC	_dollars_in_ident
PUBLIC	_cplusplus_include_defaults
PUBLIC	_do_define
PUBLIC	_do_line
PUBLIC	_do_include
PUBLIC	_do_undef
PUBLIC	_include
PUBLIC	_if_stack
PUBLIC	_do_error
PUBLIC	_first_bracket_include
PUBLIC	_do_pragma
PUBLIC	_last_include
PUBLIC	_do_if
PUBLIC	_dont_repeat_files
PUBLIC	_do_xifdef
PUBLIC	_all_include_files
PUBLIC	_do_else
PUBLIC	_do_elif
PUBLIC	_do_endif
PUBLIC	_do_sccs
_DATA	SEGMENT
COMM	_progname:DWORD
COMM	_hashtab:DWORD:057bH
COMM	_cplusplus:DWORD
COMM	_max_include_len:DWORD
COMM	_no_line_commands:DWORD
COMM	_dump_macros:DWORD
COMM	_pedantic:DWORD
COMM	_warn_comments:DWORD
COMM	_warn_trigraphs:DWORD
COMM	_traditional:DWORD
COMM	_no_output:DWORD
COMM	_instack:BYTE:01900H
COMM	_outbuf:BYTE:020H
COMM	_is_idchar:BYTE:0100H
COMM	_is_idstart:BYTE:0100H
COMM	_is_hor_space:BYTE:0100H
COMM	_is_space:BYTE:0100H
COMM	_deps_buffer:DWORD
COMM	_deps_allocated_size:DWORD
COMM	_deps_size:DWORD
COMM	_deps_column:DWORD
COMM	_ignore_srcdir:DWORD
_put_out_comments DD 00H
_no_trigraphs DD 00H
_print_deps DD	00H
_indepth DD	0ffffffffH
_system_include_depth DD 00H
$SG547	DB	'/xenixnt/h', 00H
	ORG $+1
$SG548	DB	'/usr/include', 00H
	ORG $+3
$SG549	DB	'/usr/local/include', 00H
	ORG $+5
_include_defaults DD _include_defaults+8
	DD	$SG547
	DD	_include_defaults+16
	DD	$SG548
	DD	00H
	DD	$SG549
$SG551	DB	'/xenixnt/h', 00H
	ORG $+1
$SG552	DB	'/xenixnt/h', 00H
	ORG $+1
$SG553	DB	'/usr/include', 00H
	ORG $+3
_cplusplus_include_defaults DD _cplusplus_include_defaults+8
	DD	$SG551
	DD	_cplusplus_include_defaults+16
	DD	$SG552
	DD	00H
	DD	$SG553
_include DD	00H
_first_bracket_include DD 00H
_last_include DD 00H
_dont_repeat_files DD 00H
_all_include_files DD 00H
$SG593	DB	'-Dunix -Di386', 00H
	ORG $+2
_predefs DD	$SG593
$SG595	DB	'define', 00H
	ORG $+1
$SG596	DB	'if', 00H
	ORG $+1
$SG597	DB	'ifdef', 00H
	ORG $+2
$SG598	DB	'ifndef', 00H
	ORG $+1
$SG599	DB	'endif', 00H
	ORG $+2
$SG600	DB	'else', 00H
	ORG $+3
$SG601	DB	'elif', 00H
	ORG $+3
$SG602	DB	'line', 00H
	ORG $+3
$SG603	DB	'include', 00H
$SG604	DB	'undef', 00H
	ORG $+2
$SG605	DB	'error', 00H
	ORG $+2
$SG606	DB	'sccs', 00H
	ORG $+3
$SG607	DB	'pragma', 00H
	ORG $+1
$SG608	DB	00H
	ORG $+3
_directive_table DD 06H
	DD	_do_define
	DD	$SG595
	DD	01H
	DB	00H
	DB	01H
	ORG $+2
	DD	02H
	DD	_do_if
	DD	$SG596
	DD	05H
	ORG $+4
	DD	05H
	DD	_do_xifdef
	DD	$SG597
	DD	03H
	ORG $+4
	DD	06H
	DD	_do_xifdef
	DD	$SG598
	DD	04H
	ORG $+4
	DD	05H
	DD	_do_endif
	DD	$SG599
	DD	0cH
	ORG $+4
	DD	04H
	DD	_do_else
	DD	$SG600
	DD	06H
	ORG $+4
	DD	04H
	DD	_do_elif
	DD	$SG601
	DD	08H
	ORG $+4
	DD	04H
	DD	_do_line
	DD	$SG602
	DD	0aH
	ORG $+4
	DD	07H
	DD	_do_include
	DD	$SG603
	DD	02H
	DB	01H
	ORG $+3
	DD	05H
	DD	_do_undef
	DD	$SG604
	DD	09H
	ORG $+4
	DD	05H
	DD	_do_error
	DD	$SG605
	DD	0bH
	ORG $+4
	DD	04H
	DD	_do_sccs
	DD	$SG606
	DD	0dH
	ORG $+4
	DD	06H
	DD	_do_pragma
	DD	$SG607
	DD	07H
	DB	00H
	DB	00H
	DB	01H
	ORG $+1
	DD	0ffffffffH
	DD	00H
	DD	$SG608
	DD	01aH
	ORG $+4
_errors	DD	00H
_dollars_in_ident DD 00H
_if_stack DD	00H
$SG1343	DB	'Jan', 00H
$SG1344	DB	'Feb', 00H
$SG1345	DB	'Mar', 00H
$SG1346	DB	'Apr', 00H
$SG1347	DB	'May', 00H
$SG1348	DB	'Jun', 00H
$SG1349	DB	'Jul', 00H
$SG1350	DB	'Aug', 00H
$SG1351	DB	'Sep', 00H
$SG1352	DB	'Oct', 00H
$SG1353	DB	'Nov', 00H
$SG1354	DB	'Dec', 00H
	ORG $+4
_monthnames$S1342 DD $SG1343
	DD	$SG1344
	DD	$SG1345
	DD	$SG1346
	DD	$SG1347
	DD	$SG1348
	DD	$SG1349
	DD	$SG1350
	DD	$SG1351
	DD	$SG1352
	DD	$SG1353
	DD	$SG1354
_?timebuf@?1??special_symbol@@9@9$S1366 DD 00H
_DATA	ENDS
PUBLIC	_output_line_command
PUBLIC	_make_undef
PUBLIC	_initialize_char_syntax
PUBLIC	_finclude
PUBLIC	_trigraph_pcp
PUBLIC	_rescan
PUBLIC	_bcopy
PUBLIC	_bzero
PUBLIC	_deps_output
PUBLIC	_initialize_builtins
PUBLIC	_main
PUBLIC	_xmalloc
PUBLIC	_xrealloc
PUBLIC	_fatal
PUBLIC	_make_definition
PUBLIC	_pfatal_with_name
PUBLIC	_perror_with_name
PUBLIC	_file_size_and_mode
PUBLIC	_dump_all_macros
EXTRN	__write:NEAR
EXTRN	_fopen:NEAR
EXTRN	_fprintf:NEAR
EXTRN	_strchr:NEAR
EXTRN	_fputs:NEAR
EXTRN	_freopen:NEAR
EXTRN	_strlen:NEAR
EXTRN	_strcmp:NEAR
EXTRN	_version_string:DWORD
EXTRN	_alloca:NEAR
EXTRN	_strcpy:NEAR
EXTRN	_abort:NEAR
EXTRN	__iob:BYTE
EXTRN	__flsbuf:NEAR
EXTRN	_fclose:NEAR
EXTRN	__open:NEAR
EXTRN	_exit:NEAR
EXTRN	__read:NEAR
EXTRN	_getenv:NEAR
_DATA	SEGMENT
$SG652	DB	'Usage: %s [switches] input output', 00H
	ORG $+2
$SG665	DB	'Filename missing after -i option', 00H
	ORG $+3
$SG669	DB	'Output filename specified twice', 00H
$SG671	DB	'Filename missing after -o option', 00H
	ORG $+3
$SG674	DB	'-', 00H
	ORG $+2
$SG675	DB	00H
	ORG $+3
$SG679	DB	'-traditional', 00H
	ORG $+3
$SG682	DB	'-trigraphs', 00H
	ORG $+1
$SG686	DB	'-Wtrigraphs', 00H
$SG688	DB	'-Wcomments', 00H
	ORG $+1
$SG690	DB	'-Wcomment', 00H
	ORG $+2
$SG692	DB	'-Wall', 00H
	ORG $+2
$SG695	DB	'-M', 00H
	ORG $+1
$SG698	DB	'-MM', 00H
$SG701	DB	'GNU CPP version %s', 0aH, 00H
$SG708	DB	'Macro name missing after -D option', 00H
	ORG $+1
$SG716	DB	'Macro name missing after -U option', 00H
	ORG $+1
$SG725	DB	'-', 00H
	ORG $+2
$SG732	DB	'Directory name missing after -I option', 00H
	ORG $+1
$SG741	DB	00H
	ORG $+3
$SG744	DB	00H
	ORG $+3
$SG746	DB	'Invalid option `%s''', 00H
$SG785	DB	00H
	ORG $+3
$SG791	DB	'SUNPRO_DEPENDENCIES', 00H
$SG792	DB	'DEPENDENCIES_OUTPUT', 00H
$SG794	DB	'DEPENDENCIES_OUTPUT', 00H
$SG798	DB	'SUNPRO_DEPENDENCIES', 00H
$SG805	DB	'a', 00H
	ORG $+2
$SG812	DB	':', 00H
	ORG $+2
$SG815	DB	'-: ', 00H
$SG829	DB	'.o : ', 00H
	ORG $+2
$SG830	DB	' ', 00H
	ORG $+2
$SG855	DB	00H
	ORG $+3
$SG856	DB	'stdout', 00H
	ORG $+1
$SG859	DB	'w', 00H
	ORG $+2
$SG865	DB	'I/O error on output', 00H
$SG869	DB	'I/O error on output', 00H
$SG871	DB	'I/O error on output', 00H
_DATA	ENDS
_TEXT	SEGMENT
; File cccp.c
_p1$704 = -68
_pend_undefs$ = -12
_size$833 = -124
_inhibit_predefs$ = -16
_bsize$834 = -116
_no_standard_includes$ = -44
_cnt$835 = -112
_inhibit_output$ = -8
_bufp$836 = -120
_deps_stream$ = -32
_deps_target$ = -36
_i$844 = -128
_fd$780 = -84
_dirtmp$723 = -72
_spec$793 = -96
_s$795 = -92
_output_file$796 = -88
_p$749 = -76
_len$817 = -104
_p$818 = -100
_p1$819 = -108
_q$755 = -80
_argc$ = 8
_argv$ = 12
_st_mode$ = -56
_st_size$ = -52
_in_fname$ = -60
_out_fname$ = -48
_f$ = -40
_i$ = -28
_fp$ = -4
_pend_files$ = -24
_p$703 = -64
_pend_defs$ = -20
_main	PROC NEAR
; Line 551
	push	ebp
	mov	ebp, esp
	sub	esp, 132				; 00000084H
	push	ebx
	push	esi
	push	edi
; Line 557
	mov	eax, DWORD PTR _argc$[ebp]
	shl	eax, 2
	push	eax
	call	_xmalloc
	add	esp, 4
	mov	DWORD PTR _pend_files$[ebp], eax
; Line 558
	mov	eax, DWORD PTR _argc$[ebp]
	shl	eax, 2
	push	eax
	call	_xmalloc
	add	esp, 4
	mov	DWORD PTR _pend_defs$[ebp], eax
; Line 559
	mov	eax, DWORD PTR _argc$[ebp]
	shl	eax, 2
	push	eax
	call	_xmalloc
	add	esp, 4
	mov	DWORD PTR _pend_undefs$[ebp], eax
; Line 560
	mov	DWORD PTR _inhibit_predefs$[ebp], 0
; Line 561
	mov	DWORD PTR _no_standard_includes$[ebp], 0
; Line 564
	mov	DWORD PTR _inhibit_output$[ebp], 0
; Line 567
	mov	DWORD PTR _deps_stream$[ebp], 0
; Line 569
	mov	DWORD PTR _deps_target$[ebp], 0
; Line 584
	mov	eax, DWORD PTR _argv$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _progname, eax
; Line 602
	mov	DWORD PTR _in_fname$[ebp], 0
; Line 603
	mov	DWORD PTR _out_fname$[ebp], 0
; Line 606
	mov	DWORD PTR _dollars_in_ident, 1
; Line 607
	call	_initialize_char_syntax
; Line 608
	mov	DWORD PTR _dollars_in_ident, 0
; Line 610
	mov	DWORD PTR _no_line_commands, 0
; Line 611
	mov	DWORD PTR _no_trigraphs, 1
; Line 612
	mov	DWORD PTR _dump_macros, 0
; Line 613
	mov	DWORD PTR _no_output, 0
; Line 614
	mov	DWORD PTR _cplusplus, 0
; Line 625
	mov	DWORD PTR _max_include_len, 16		; 00000010H
; Line 631
	mov	eax, DWORD PTR _argc$[ebp]
	shl	eax, 2
	push	eax
	mov	eax, DWORD PTR _pend_files$[ebp]
	push	eax
	call	_bzero
	add	esp, 8
; Line 632
	mov	eax, DWORD PTR _argc$[ebp]
	shl	eax, 2
	push	eax
	mov	eax, DWORD PTR _pend_defs$[ebp]
	push	eax
	call	_bzero
	add	esp, 8
; Line 633
	mov	eax, DWORD PTR _argc$[ebp]
	shl	eax, 2
	push	eax
	mov	eax, DWORD PTR _pend_undefs$[ebp]
	push	eax
	call	_bzero
	add	esp, 8
; Line 637
	mov	DWORD PTR _i$[ebp], 1
	jmp	$L647
$L648:
	inc	DWORD PTR _i$[ebp]
$L647:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _argc$[ebp], eax
	jle	$L649
; Line 638
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _argv$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 45					; 0000002dH
	je	$L650
; Line 639
	cmp	DWORD PTR _out_fname$[ebp], 0
	je	$L651
; Line 640
	mov	eax, DWORD PTR _argv$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	push	OFFSET $SG652
	call	_fatal
	add	esp, 8
; Line 641
	jmp	$L653
$L651:
	cmp	DWORD PTR _in_fname$[ebp], 0
	je	$L654
; Line 642
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _argv$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _out_fname$[ebp], eax
; Line 643
	jmp	$L655
$L654:
; Line 644
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _argv$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _in_fname$[ebp], eax
$L655:
$L653:
; Line 645
	jmp	$L656
$L650:
; Line 646
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _argv$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	movsx	eax, BYTE PTR [eax+1]
	mov	DWORD PTR -132+[ebp], eax
	jmp	$L657
; Line 648
$L661:
; Line 649
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _argv$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	movsx	eax, BYTE PTR [eax+2]
	or	eax, eax
	je	$L662
; Line 650
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _argv$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	add	eax, 2
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _pend_files$[ebp]
	mov	DWORD PTR [edx+ecx*4], eax
; Line 651
	jmp	$L663
$L662:
	mov	eax, DWORD PTR _i$[ebp]
	inc	eax
	cmp	eax, DWORD PTR _argc$[ebp]
	jne	$L664
; Line 652
	push	OFFSET $SG665
	call	_fatal
	add	esp, 4
; Line 653
	jmp	$L666
$L664:
; Line 654
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _argv$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _pend_files$[ebp]
	mov	DWORD PTR [edx+ecx*4], eax
	inc	DWORD PTR _i$[ebp]
$L666:
$L663:
; Line 655
	jmp	$L658
; Line 657
$L667:
; Line 658
	cmp	DWORD PTR _out_fname$[ebp], 0
	je	$L668
; Line 659
	push	OFFSET $SG669
	call	_fatal
	add	esp, 4
; Line 660
$L668:
	mov	eax, DWORD PTR _i$[ebp]
	inc	eax
	cmp	eax, DWORD PTR _argc$[ebp]
	jne	$L670
; Line 661
	push	OFFSET $SG671
	call	_fatal
	add	esp, 4
; Line 662
$L670:
	inc	DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _argv$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _out_fname$[ebp], eax
; Line 663
	push	OFFSET $SG674
	mov	eax, DWORD PTR _out_fname$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L673
; Line 664
	mov	DWORD PTR _out_fname$[ebp], OFFSET $SG675
; Line 665
$L673:
	jmp	$L658
; Line 667
$L676:
; Line 668
	mov	DWORD PTR _pedantic, 1
; Line 669
	jmp	$L658
; Line 671
$L677:
; Line 672
	push	OFFSET $SG679
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _argv$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L678
; Line 673
	mov	DWORD PTR _traditional, 1
; Line 674
	mov	DWORD PTR _dollars_in_ident, 1
; Line 675
	jmp	$L680
$L678:
	push	OFFSET $SG682
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _argv$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L681
; Line 676
	mov	DWORD PTR _no_trigraphs, 0
; Line 678
$L681:
$L680:
	jmp	$L658
; Line 680
$L683:
; Line 681
	mov	DWORD PTR _cplusplus, 1
; Line 682
	jmp	$L658
; Line 684
$L684:
; Line 685
	push	OFFSET $SG686
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _argv$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L685
; Line 686
	mov	DWORD PTR _warn_trigraphs, 1
; Line 688
$L685:
	push	OFFSET $SG688
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _argv$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L687
; Line 689
	mov	DWORD PTR _warn_comments, 1
; Line 690
$L687:
	push	OFFSET $SG690
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _argv$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L689
; Line 691
	mov	DWORD PTR _warn_comments, 1
; Line 692
$L689:
	push	OFFSET $SG692
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _argv$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L691
; Line 693
	mov	DWORD PTR _warn_trigraphs, 1
; Line 694
	mov	DWORD PTR _warn_comments, 1
; Line 696
$L691:
	jmp	$L658
; Line 698
$L693:
; Line 699
	push	OFFSET $SG695
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _argv$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L694
; Line 700
	mov	DWORD PTR _print_deps, 2
; Line 701
	jmp	$L696
$L694:
	push	OFFSET $SG698
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _argv$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L697
; Line 702
	mov	DWORD PTR _print_deps, 1
; Line 703
$L697:
$L696:
	mov	DWORD PTR _inhibit_output$[ebp], 1
; Line 704
	jmp	$L658
; Line 706
$L699:
; Line 707
	mov	DWORD PTR _dump_macros, 1
; Line 708
	mov	DWORD PTR _no_output, 1
; Line 709
	jmp	$L658
; Line 711
$L700:
; Line 712
	mov	eax, DWORD PTR _version_string
	push	eax
	push	OFFSET $SG701
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 713
	jmp	$L658
; Line 715
$L702:
; Line 719
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _argv$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	movsx	eax, BYTE PTR [eax+2]
	or	eax, eax
	je	$L705
; Line 720
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _argv$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	add	eax, 2
	mov	DWORD PTR _p$703[ebp], eax
; Line 721
	jmp	$L706
$L705:
	mov	eax, DWORD PTR _i$[ebp]
	inc	eax
	cmp	eax, DWORD PTR _argc$[ebp]
	jne	$L707
; Line 722
	push	OFFSET $SG708
	call	_fatal
	add	esp, 4
; Line 723
	jmp	$L709
$L707:
; Line 724
	inc	DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _argv$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _p$703[ebp], eax
$L709:
$L706:
; Line 726
	push	61					; 0000003dH
	mov	eax, DWORD PTR _p$703[ebp]
	push	eax
	call	_strchr
	add	esp, 8
	mov	DWORD PTR _p1$704[ebp], eax
	cmp	DWORD PTR _p1$704[ebp], 0
	je	$L711
; Line 727
	mov	eax, DWORD PTR _p1$704[ebp]
	mov	BYTE PTR [eax], 32			; 00000020H
; Line 728
$L711:
	mov	eax, DWORD PTR _p$703[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _pend_defs$[ebp]
	mov	DWORD PTR [edx+ecx*4], eax
; Line 730
	jmp	$L658
; Line 732
$L712:
; Line 733
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _argv$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	movsx	eax, BYTE PTR [eax+2]
	or	eax, eax
	je	$L713
; Line 734
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _argv$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	add	eax, 2
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _pend_undefs$[ebp]
	mov	DWORD PTR [edx+ecx*4], eax
; Line 735
	jmp	$L714
$L713:
	mov	eax, DWORD PTR _i$[ebp]
	inc	eax
	cmp	eax, DWORD PTR _argc$[ebp]
	jne	$L715
; Line 736
	push	OFFSET $SG716
	call	_fatal
	add	esp, 4
; Line 737
	jmp	$L717
$L715:
; Line 738
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _argv$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _pend_undefs$[ebp]
	mov	DWORD PTR [edx+ecx*4], eax
	inc	DWORD PTR _i$[ebp]
$L717:
$L714:
; Line 739
	jmp	$L658
; Line 741
$L718:
; Line 742
	mov	DWORD PTR _put_out_comments, 1
; Line 743
	jmp	$L658
; Line 745
$L719:
; Line 746
	jmp	$L658
; Line 748
$L720:
; Line 749
	mov	DWORD PTR _no_line_commands, 1
; Line 750
	jmp	$L658
; Line 752
$L721:
; Line 753
	mov	DWORD PTR _dollars_in_ident, 0
; Line 754
	jmp	$L658
; Line 756
$L722:
; Line 760
	cmp	DWORD PTR _ignore_srcdir, 0
	jne	$L724
	push	OFFSET $SG725
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _argv$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	add	eax, 2
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L724
; Line 761
	mov	DWORD PTR _ignore_srcdir, 1
; Line 762
	jmp	$L726
$L724:
; Line 764
	push	8
	call	_xmalloc
	add	esp, 4
	mov	DWORD PTR _dirtmp$723[ebp], eax
; Line 765
	mov	eax, DWORD PTR _dirtmp$723[ebp]
	mov	DWORD PTR [eax], 0
; Line 766
	cmp	DWORD PTR _include, 0
	jne	$L727
; Line 767
	mov	eax, DWORD PTR _dirtmp$723[ebp]
	mov	DWORD PTR _include, eax
; Line 768
	jmp	$L728
$L727:
; Line 769
	mov	eax, DWORD PTR _dirtmp$723[ebp]
	mov	ecx, DWORD PTR _last_include
	mov	DWORD PTR [ecx], eax
$L728:
; Line 770
	mov	eax, DWORD PTR _dirtmp$723[ebp]
	mov	DWORD PTR _last_include, eax
; Line 771
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _argv$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	movsx	eax, BYTE PTR [eax+2]
	or	eax, eax
	je	$L729
; Line 772
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _argv$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	add	eax, 2
	mov	ecx, DWORD PTR _dirtmp$723[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 773
	jmp	$L730
$L729:
	mov	eax, DWORD PTR _i$[ebp]
	inc	eax
	cmp	eax, DWORD PTR _argc$[ebp]
	jne	$L731
; Line 774
	push	OFFSET $SG732
	call	_fatal
	add	esp, 4
; Line 775
	jmp	$L733
$L731:
; Line 776
	inc	DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _argv$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _dirtmp$723[ebp]
	mov	DWORD PTR [ecx+4], eax
$L733:
$L730:
; Line 777
	mov	eax, DWORD PTR _dirtmp$723[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_strlen
	add	esp, 4
	cmp	eax, DWORD PTR _max_include_len
	jle	$L735
; Line 778
	mov	eax, DWORD PTR _dirtmp$723[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_strlen
	add	esp, 4
	mov	DWORD PTR _max_include_len, eax
; Line 779
$L735:
	cmp	DWORD PTR _ignore_srcdir, 0
	je	$L736
	cmp	DWORD PTR _first_bracket_include, 0
	jne	$L736
; Line 780
	mov	eax, DWORD PTR _dirtmp$723[ebp]
	mov	DWORD PTR _first_bracket_include, eax
; Line 781
$L736:
$L726:
; Line 783
	jmp	$L658
; Line 785
$L737:
; Line 788
	mov	DWORD PTR _no_standard_includes$[ebp], 1
; Line 789
	jmp	$L658
; Line 791
$L738:
; Line 794
	mov	DWORD PTR _inhibit_predefs$[ebp], 1
; Line 795
	jmp	$L658
; Line 797
$L739:
; Line 798
	cmp	DWORD PTR _in_fname$[ebp], 0
	jne	$L740
; Line 799
	mov	DWORD PTR _in_fname$[ebp], OFFSET $SG741
; Line 800
	jmp	$L658
; Line 801
	jmp	$L742
$L740:
	cmp	DWORD PTR _out_fname$[ebp], 0
	jne	$L743
; Line 802
	mov	DWORD PTR _out_fname$[ebp], OFFSET $SG744
; Line 803
	jmp	$L658
; Line 806
$L743:
$L742:
$L745:
; Line 807
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _argv$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	push	OFFSET $SG746
	call	_fatal
	add	esp, 8
; Line 808
	jmp	$L658
$L657:
	cmp	DWORD PTR -132+[ebp], 85		; 00000055H
	jg	$L2864
	je	$L712
	cmp	DWORD PTR -132+[ebp], 68		; 00000044H
	jg	$L2865
	je	$L702
	cmp	DWORD PTR -132+[ebp], 0
	je	$L739
	cmp	DWORD PTR -132+[ebp], 36		; 00000024H
	je	$L721
	cmp	DWORD PTR -132+[ebp], 43		; 0000002bH
	je	$L683
	cmp	DWORD PTR -132+[ebp], 67		; 00000043H
	je	$L718
	jmp	$L745
$L2865:
	cmp	DWORD PTR -132+[ebp], 69		; 00000045H
	je	$L658
	cmp	DWORD PTR -132+[ebp], 73		; 00000049H
	je	$L722
	cmp	DWORD PTR -132+[ebp], 77		; 0000004dH
	je	$L693
	cmp	DWORD PTR -132+[ebp], 80		; 00000050H
	je	$L720
	jmp	$L745
$L2864:
	sub	DWORD PTR -132+[ebp], 87		; 00000057H
	cmp	DWORD PTR -132+[ebp], 31		; 0000001fH
	ja	$L745
	shl	DWORD PTR -132+[ebp], 2
	mov	eax, DWORD PTR -132+[ebp]
	jmp	DWORD PTR $L2866[eax]
$L2866:
	DD	OFFSET $L684
	DD	OFFSET $L745
	DD	OFFSET $L745
	DD	OFFSET $L745
	DD	OFFSET $L745
	DD	OFFSET $L745
	DD	OFFSET $L745
	DD	OFFSET $L745
	DD	OFFSET $L745
	DD	OFFSET $L745
	DD	OFFSET $L745
	DD	OFFSET $L745
	DD	OFFSET $L745
	DD	OFFSET $L699
	DD	OFFSET $L745
	DD	OFFSET $L745
	DD	OFFSET $L745
	DD	OFFSET $L745
	DD	OFFSET $L661
	DD	OFFSET $L745
	DD	OFFSET $L745
	DD	OFFSET $L745
	DD	OFFSET $L745
	DD	OFFSET $L737
	DD	OFFSET $L667
	DD	OFFSET $L676
	DD	OFFSET $L745
	DD	OFFSET $L745
	DD	OFFSET $L745
	DD	OFFSET $L677
	DD	OFFSET $L738
	DD	OFFSET $L700
$L658:
; Line 809
$L656:
; Line 810
	jmp	$L648
$L649:
; Line 813
	call	_initialize_char_syntax
; Line 817
	call	_initialize_builtins
; Line 821
	cmp	DWORD PTR _inhibit_predefs$[ebp], 0
	jne	$L748
; Line 822
	mov	eax, DWORD PTR _predefs
	push	eax
	call	_strlen
	add	esp, 4
	inc	eax
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _p$749[ebp], eax
; Line 823
	mov	eax, DWORD PTR _predefs
	push	eax
	mov	eax, DWORD PTR _p$749[ebp]
	push	eax
	call	_strcpy
	add	esp, 8
; Line 824
$L753:
	mov	eax, DWORD PTR _p$749[ebp]
	movsx	eax, BYTE PTR [eax]
	or	eax, eax
	je	$L754
; Line 826
	mov	eax, DWORD PTR _p$749[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 45					; 0000002dH
	jne	$L757
	mov	eax, DWORD PTR _p$749[ebp]
	movsx	eax, BYTE PTR [eax+1]
	cmp	eax, 68					; 00000044H
	je	$L756
$L757:
; Line 827
	call	_abort
; Line 828
$L756:
	mov	eax, DWORD PTR _p$749[ebp]
	add	eax, 2
	mov	DWORD PTR _q$755[ebp], eax
; Line 829
$L759:
	mov	eax, DWORD PTR _p$749[ebp]
	movsx	eax, BYTE PTR [eax]
	or	eax, eax
	je	$L760
	mov	eax, DWORD PTR _p$749[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 32					; 00000020H
	je	$L760
	inc	DWORD PTR _p$749[ebp]
	jmp	$L759
$L760:
; Line 830
	mov	eax, DWORD PTR _p$749[ebp]
	movsx	eax, BYTE PTR [eax]
	or	eax, eax
	je	$L761
; Line 831
	mov	eax, DWORD PTR _p$749[ebp]
	mov	BYTE PTR [eax], 0
	inc	DWORD PTR _p$749[ebp]
; Line 832
$L761:
	mov	eax, DWORD PTR _q$755[ebp]
	push	eax
	call	_make_definition
	add	esp, 4
; Line 833
	jmp	$L753
$L754:
; Line 837
$L748:
	mov	DWORD PTR _i$[ebp], 1
	jmp	$L763
$L764:
	inc	DWORD PTR _i$[ebp]
$L763:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _argc$[ebp], eax
	jle	$L765
; Line 838
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _pend_defs$[ebp]
	cmp	DWORD PTR [ecx+eax*4], 0
	je	$L766
; Line 839
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _pend_defs$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	call	_make_definition
	add	esp, 4
; Line 842
$L766:
	jmp	$L764
$L765:
	mov	DWORD PTR _i$[ebp], 1
	jmp	$L767
$L768:
	inc	DWORD PTR _i$[ebp]
$L767:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _argc$[ebp], eax
	jle	$L769
; Line 843
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _pend_undefs$[ebp]
	cmp	DWORD PTR [ecx+eax*4], 0
	je	$L770
; Line 844
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _pend_undefs$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	call	_make_undef
	add	esp, 4
; Line 848
$L770:
	jmp	$L768
$L769:
	cmp	DWORD PTR _no_standard_includes$[ebp], 0
	jne	$L772
; Line 849
	cmp	DWORD PTR _include, 0
	jne	$L773
; Line 850
	mov	eax, OFFSET _cplusplus_include_defaults
	cmp	DWORD PTR _cplusplus, 0
	jne	$L2867
	mov	eax, OFFSET _include_defaults
$L2867:
	mov	DWORD PTR _include, eax
; Line 851
	jmp	$L774
$L773:
; Line 853
	mov	eax, OFFSET _cplusplus_include_defaults
	cmp	DWORD PTR _cplusplus, 0
	jne	$L2868
	mov	eax, OFFSET _include_defaults
$L2868:
	mov	ecx, DWORD PTR _last_include
	mov	DWORD PTR [ecx], eax
$L774:
; Line 855
	cmp	DWORD PTR _ignore_srcdir, 0
	je	$L775
	cmp	DWORD PTR _first_bracket_include, 0
	jne	$L775
; Line 857
	mov	eax, OFFSET _cplusplus_include_defaults
	cmp	DWORD PTR _cplusplus, 0
	jne	$L2869
	mov	eax, OFFSET _include_defaults
$L2869:
	mov	DWORD PTR _first_bracket_include, eax
; Line 858
$L775:
; Line 862
$L772:
	push	10					; 0000000aH
	call	_xmalloc
	add	esp, 4
	mov	DWORD PTR _outbuf+12, eax
; Line 863
	mov	eax, DWORD PTR _outbuf+12
	mov	DWORD PTR _outbuf+16, eax
; Line 864
	mov	DWORD PTR _outbuf+8, 10			; 0000000aH
; Line 870
	inc	DWORD PTR _no_output
; Line 871
	mov	DWORD PTR _i$[ebp], 1
	jmp	$L776
$L777:
	inc	DWORD PTR _i$[ebp]
$L776:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _argc$[ebp], eax
	jle	$L778
; Line 872
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _pend_files$[ebp]
	cmp	DWORD PTR [ecx+eax*4], 0
	je	$L779
; Line 873
	push	438					; 000001b6H
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _pend_files$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	call	__open
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _fd$780[ebp], eax
; Line 874
	cmp	DWORD PTR _fd$780[ebp], 0
	jge	$L781
; Line 875
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _pend_files$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	call	_perror_with_name
	add	esp, 4
; Line 876
	mov	eax, 33					; 00000021H
	jmp	$L630
; Line 878
$L781:
	push	OFFSET _outbuf
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _pend_files$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	mov	eax, DWORD PTR _fd$780[ebp]
	push	eax
	call	_finclude
	add	esp, 12					; 0000000cH
; Line 880
$L779:
	jmp	$L777
$L778:
	dec	DWORD PTR _no_output
; Line 885
	inc	DWORD PTR _indepth
	mov	eax, DWORD PTR _indepth
	shl	eax, 5
	add	eax, OFFSET _instack
	mov	DWORD PTR _fp$[ebp], eax
; Line 888
	cmp	DWORD PTR _in_fname$[ebp], 0
	je	$L784
	mov	eax, DWORD PTR _in_fname$[ebp]
	movsx	eax, BYTE PTR [eax]
	or	eax, eax
	jne	$L783
$L784:
; Line 889
	mov	DWORD PTR _in_fname$[ebp], OFFSET $SG785
; Line 890
	mov	DWORD PTR _f$[ebp], 0
; Line 891
	jmp	$L786
$L783:
	push	438					; 000001b6H
	push	0
	mov	eax, DWORD PTR _in_fname$[ebp]
	push	eax
	call	__open
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _f$[ebp], eax
	cmp	DWORD PTR _f$[ebp], 0
	jge	$L787
; Line 892
	jmp	$perror$788
; Line 899
$L787:
$L786:
; Line 901
	cmp	DWORD PTR _print_deps, 0
	jne	$L789
	push	OFFSET $SG791
	call	_getenv
	add	esp, 4
	or	eax, eax
	jne	$L790
	push	OFFSET $SG792
	call	_getenv
	add	esp, 4
	or	eax, eax
	je	$L789
$L790:
; Line 903
	push	OFFSET $SG794
	call	_getenv
	add	esp, 4
	mov	DWORD PTR _spec$793[ebp], eax
; Line 907
	cmp	DWORD PTR _spec$793[ebp], 0
	jne	$L797
; Line 909
	push	OFFSET $SG798
	call	_getenv
	add	esp, 4
	mov	DWORD PTR _spec$793[ebp], eax
; Line 910
	mov	DWORD PTR _print_deps, 2
; Line 912
	jmp	$L799
$L797:
; Line 913
	mov	DWORD PTR _print_deps, 1
$L799:
; Line 915
	mov	eax, DWORD PTR _spec$793[ebp]
	mov	DWORD PTR _s$795[ebp], eax
; Line 918
$L801:
	mov	eax, DWORD PTR _s$795[ebp]
	movsx	eax, BYTE PTR [eax]
	or	eax, eax
	je	$L802
	mov	eax, DWORD PTR _s$795[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 32					; 00000020H
	je	$L802
	inc	DWORD PTR _s$795[ebp]
	jmp	$L801
$L802:
; Line 919
	mov	eax, DWORD PTR _s$795[ebp]
	movsx	eax, BYTE PTR [eax]
	or	eax, eax
	je	$L803
; Line 921
	mov	eax, DWORD PTR _s$795[ebp]
	inc	eax
	mov	DWORD PTR _deps_target$[ebp], eax
; Line 922
	mov	eax, DWORD PTR _s$795[ebp]
	sub	eax, DWORD PTR _spec$793[ebp]
	inc	eax
	push	eax
	call	_xmalloc
	add	esp, 4
	mov	DWORD PTR _output_file$796[ebp], eax
; Line 923
	mov	eax, DWORD PTR _s$795[ebp]
	sub	eax, DWORD PTR _spec$793[ebp]
	push	eax
	mov	eax, DWORD PTR _output_file$796[ebp]
	push	eax
	mov	eax, DWORD PTR _spec$793[ebp]
	push	eax
	call	_bcopy
	add	esp, 12					; 0000000cH
; Line 924
	mov	eax, DWORD PTR _s$795[ebp]
	sub	eax, DWORD PTR _spec$793[ebp]
	mov	ecx, DWORD PTR _output_file$796[ebp]
	mov	BYTE PTR [eax+ecx], 0
; Line 926
	jmp	$L804
$L803:
; Line 928
	mov	DWORD PTR _deps_target$[ebp], 0
; Line 929
	mov	eax, DWORD PTR _spec$793[ebp]
	mov	DWORD PTR _output_file$796[ebp], eax
; Line 930
$L804:
; Line 932
	push	OFFSET $SG805
	mov	eax, DWORD PTR _output_file$796[ebp]
	push	eax
	call	_fopen
	add	esp, 8
	mov	DWORD PTR _deps_stream$[ebp], eax
; Line 933
	cmp	DWORD PTR _deps_stream$[ebp], 0
	jne	$L806
; Line 934
	mov	eax, DWORD PTR _output_file$796[ebp]
	push	eax
	call	_pfatal_with_name
	add	esp, 4
; Line 935
$L806:
; Line 937
	jmp	$L807
$L789:
	cmp	DWORD PTR _print_deps, 0
	je	$L808
; Line 938
	mov	eax, OFFSET __iob
	add	eax, 32					; 00000020H
	mov	DWORD PTR _deps_stream$[ebp], eax
; Line 942
$L808:
$L807:
	cmp	DWORD PTR _print_deps, 0
	je	$L809
; Line 943
	mov	DWORD PTR _deps_allocated_size, 200	; 000000c8H
; Line 944
	mov	eax, DWORD PTR _deps_allocated_size
	push	eax
	call	_xmalloc
	add	esp, 4
	mov	DWORD PTR _deps_buffer, eax
; Line 945
	mov	eax, DWORD PTR _deps_buffer
	mov	BYTE PTR [eax], 0
; Line 946
	mov	DWORD PTR _deps_size, 0
; Line 947
	mov	DWORD PTR _deps_column, 0
; Line 949
	cmp	DWORD PTR _deps_target$[ebp], 0
	je	$L810
; Line 950
	push	0
	mov	eax, DWORD PTR _deps_target$[ebp]
	push	eax
	call	_deps_output
	add	esp, 8
; Line 951
	push	0
	push	OFFSET $SG812
	call	_deps_output
	add	esp, 8
; Line 952
	jmp	$L813
$L810:
	mov	eax, DWORD PTR _in_fname$[ebp]
	movsx	eax, BYTE PTR [eax]
	or	eax, eax
	jne	$L814
; Line 953
	push	0
	push	OFFSET $SG815
	call	_deps_output
	add	esp, 8
; Line 954
	jmp	$L816
$L814:
; Line 956
	mov	eax, DWORD PTR _in_fname$[ebp]
	mov	DWORD PTR _p$818[ebp], eax
; Line 957
	mov	eax, DWORD PTR _p$818[ebp]
	mov	DWORD PTR _p1$819[ebp], eax
; Line 959
$L821:
	mov	eax, DWORD PTR _p1$819[ebp]
	movsx	eax, BYTE PTR [eax]
	or	eax, eax
	je	$L822
; Line 960
	mov	eax, DWORD PTR _p1$819[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 47					; 0000002fH
	jne	$L823
; Line 961
	mov	eax, DWORD PTR _p1$819[ebp]
	inc	eax
	mov	DWORD PTR _p$818[ebp], eax
; Line 962
$L823:
	inc	DWORD PTR _p1$819[ebp]
; Line 963
	jmp	$L821
$L822:
; Line 965
	mov	eax, DWORD PTR _p$818[ebp]
	push	eax
	call	_strlen
	add	esp, 4
	mov	DWORD PTR _len$817[ebp], eax
; Line 966
	mov	eax, DWORD PTR _len$817[ebp]
	mov	ecx, DWORD PTR _p$818[ebp]
	movsx	eax, BYTE PTR [eax+ecx-2]
	cmp	eax, 46					; 0000002eH
	jne	$L824
	mov	eax, DWORD PTR _len$817[ebp]
	mov	ecx, DWORD PTR _p$818[ebp]
	movsx	eax, BYTE PTR [eax+ecx-1]
	cmp	eax, 99					; 00000063H
	je	$L825
	mov	eax, DWORD PTR _len$817[ebp]
	mov	ecx, DWORD PTR _p$818[ebp]
	movsx	eax, BYTE PTR [eax+ecx-1]
	cmp	eax, 67					; 00000043H
	jne	$L824
$L825:
; Line 967
	mov	eax, DWORD PTR _len$817[ebp]
	sub	eax, 2
	push	eax
	mov	eax, DWORD PTR _p$818[ebp]
	push	eax
	call	_deps_output
	add	esp, 8
; Line 968
	jmp	$L826
$L824:
; Line 970
	mov	eax, DWORD PTR _len$817[ebp]
	mov	ecx, DWORD PTR _p$818[ebp]
	movsx	eax, BYTE PTR [eax+ecx-3]
	cmp	eax, 46					; 0000002eH
	jne	$L827
	mov	eax, DWORD PTR _len$817[ebp]
	mov	ecx, DWORD PTR _p$818[ebp]
	movsx	eax, BYTE PTR [eax+ecx-2]
	cmp	eax, 99					; 00000063H
	jne	$L827
	mov	eax, DWORD PTR _len$817[ebp]
	mov	ecx, DWORD PTR _p$818[ebp]
	movsx	eax, BYTE PTR [eax+ecx-1]
	cmp	eax, 99					; 00000063H
	jne	$L827
; Line 971
	mov	eax, DWORD PTR _len$817[ebp]
	sub	eax, 3
	push	eax
	mov	eax, DWORD PTR _p$818[ebp]
	push	eax
	call	_deps_output
	add	esp, 8
; Line 972
	jmp	$L828
$L827:
; Line 973
	push	0
	mov	eax, DWORD PTR _p$818[ebp]
	push	eax
	call	_deps_output
	add	esp, 8
$L828:
$L826:
; Line 975
	push	0
	push	OFFSET $SG829
	call	_deps_output
	add	esp, 8
; Line 976
	push	0
	mov	eax, DWORD PTR _in_fname$[ebp]
	push	eax
	call	_deps_output
	add	esp, 8
; Line 977
	push	0
	push	OFFSET $SG830
	call	_deps_output
	add	esp, 8
; Line 978
$L816:
$L813:
; Line 981
$L809:
	lea	eax, DWORD PTR _st_size$[ebp]
	push	eax
	lea	eax, DWORD PTR _st_mode$[ebp]
	push	eax
	mov	eax, DWORD PTR _f$[ebp]
	push	eax
	call	_file_size_and_mode
	add	esp, 12					; 0000000cH
; Line 982
	mov	eax, DWORD PTR _in_fname$[ebp]
	mov	ecx, DWORD PTR _fp$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 983
	mov	eax, DWORD PTR _fp$[ebp]
	mov	DWORD PTR [eax+4], 1
; Line 985
	mov	eax, DWORD PTR _st_mode$[ebp]
	and	ah, 240					; 000000f0H
	cmp	ah, 128					; 00000080H
	je	$L832
; Line 994
	mov	DWORD PTR _bsize$834[ebp], 2000		; 000007d0H
; Line 995
	mov	DWORD PTR _size$833[ebp], 0
; Line 996
	mov	eax, DWORD PTR _bsize$834[ebp]
	add	eax, 2
	push	eax
	call	_xmalloc
	add	esp, 4
	mov	ecx, DWORD PTR _fp$[ebp]
	mov	DWORD PTR [ecx+12], eax
; Line 997
	mov	eax, DWORD PTR _fp$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _bufp$836[ebp], eax
; Line 998
$L838:
; Line 999
	mov	eax, DWORD PTR _bsize$834[ebp]
	sub	eax, DWORD PTR _size$833[ebp]
	push	eax
	mov	eax, DWORD PTR _bufp$836[ebp]
	push	eax
	mov	eax, DWORD PTR _f$[ebp]
	push	eax
	call	__read
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _cnt$835[ebp], eax
; Line 1000
	cmp	DWORD PTR _cnt$835[ebp], 0
	jge	$L840
	jmp	$perror$788
; Line 1001
$L840:
	cmp	DWORD PTR _cnt$835[ebp], 0
	jne	$L841
	jmp	$L839
; Line 1002
$L841:
	mov	eax, DWORD PTR _cnt$835[ebp]
	add	DWORD PTR _size$833[ebp], eax
; Line 1003
	mov	eax, DWORD PTR _cnt$835[ebp]
	add	DWORD PTR _bufp$836[ebp], eax
; Line 1004
	mov	eax, DWORD PTR _size$833[ebp]
	cmp	DWORD PTR _bsize$834[ebp], eax
	jne	$L842
; Line 1005
	shl	DWORD PTR _bsize$834[ebp], 1
; Line 1006
	mov	eax, DWORD PTR _bsize$834[ebp]
	add	eax, 2
	push	eax
	mov	eax, DWORD PTR _fp$[ebp]
	mov	eax, DWORD PTR [eax+12]
	push	eax
	call	_xrealloc
	add	esp, 8
	mov	ecx, DWORD PTR _fp$[ebp]
	mov	DWORD PTR [ecx+12], eax
; Line 1007
	mov	eax, DWORD PTR _fp$[ebp]
	mov	eax, DWORD PTR [eax+12]
	add	eax, DWORD PTR _size$833[ebp]
	mov	DWORD PTR _bufp$836[ebp], eax
; Line 1009
$L842:
	jmp	$L838
$L839:
; Line 1010
	mov	eax, DWORD PTR _size$833[ebp]
	mov	ecx, DWORD PTR _fp$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 1011
	jmp	$L843
$L832:
; Line 1015
	mov	eax, DWORD PTR _fp$[ebp]
	mov	DWORD PTR [eax+8], 0
; Line 1016
	mov	eax, DWORD PTR _st_size$[ebp]
	add	eax, 2
	push	eax
	call	_xmalloc
	add	esp, 4
	mov	ecx, DWORD PTR _fp$[ebp]
	mov	DWORD PTR [ecx+12], eax
; Line 1018
$L846:
	cmp	DWORD PTR _st_size$[ebp], 0
	jle	$L847
; Line 1019
	mov	eax, DWORD PTR _st_size$[ebp]
	push	eax
	mov	eax, DWORD PTR _fp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _fp$[ebp]
	add	eax, DWORD PTR [ecx+12]
	push	eax
	mov	eax, DWORD PTR _f$[ebp]
	push	eax
	call	__read
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _i$844[ebp], eax
; Line 1020
	cmp	DWORD PTR _i$844[ebp], 0
	jg	$L848
; Line 1021
	jne	$L849
	jmp	$L847
; Line 1022
$L849:
	jmp	$perror$788
; Line 1024
$L848:
	mov	eax, DWORD PTR _i$844[ebp]
	mov	ecx, DWORD PTR _fp$[ebp]
	add	DWORD PTR [ecx+8], eax
; Line 1025
	sub	eax, eax
	sub	eax, DWORD PTR _i$844[ebp]
	neg	eax
	sub	DWORD PTR _st_size$[ebp], eax
; Line 1026
	jmp	$L846
$L847:
; Line 1027
$L843:
; Line 1028
	mov	eax, DWORD PTR _fp$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	ecx, DWORD PTR _fp$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 1029
	mov	eax, DWORD PTR _if_stack
	mov	ecx, DWORD PTR _fp$[ebp]
	mov	DWORD PTR [ecx+24], eax
; Line 1033
	cmp	DWORD PTR _no_trigraphs, 0
	jne	$L850
; Line 1034
	mov	eax, DWORD PTR _fp$[ebp]
	push	eax
	call	_trigraph_pcp
	add	esp, 4
; Line 1038
$L850:
	mov	eax, DWORD PTR _fp$[ebp]
	cmp	DWORD PTR [eax+8], 0
	jle	$L852
	mov	eax, DWORD PTR _fp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _fp$[ebp]
	mov	ecx, DWORD PTR [ecx+12]
	mov	al, BYTE PTR [eax+ecx-1]
	and	eax, 255				; 000000ffH
	cmp	eax, 10					; 0000000aH
	je	$L852
; Line 1039
	mov	eax, DWORD PTR _fp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _fp$[ebp]
	mov	ecx, DWORD PTR [ecx+12]
	mov	BYTE PTR [eax+ecx], 10			; 0000000aH
	mov	eax, DWORD PTR _fp$[ebp]
	inc	DWORD PTR [eax+8]
; Line 1040
$L852:
	mov	eax, DWORD PTR _fp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _fp$[ebp]
	mov	ecx, DWORD PTR [ecx+12]
	mov	BYTE PTR [eax+ecx], 0
; Line 1044
	cmp	DWORD PTR _out_fname$[ebp], 0
	je	$L854
	push	OFFSET $SG855
	mov	eax, DWORD PTR _out_fname$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L853
$L854:
; Line 1045
	mov	DWORD PTR _out_fname$[ebp], OFFSET $SG856
; Line 1046
	jmp	$L857
$L853:
	mov	eax, OFFSET __iob
	add	eax, 32					; 00000020H
	push	eax
	push	OFFSET $SG859
	mov	eax, DWORD PTR _out_fname$[ebp]
	push	eax
	call	_freopen
	add	esp, 12					; 0000000cH
	or	eax, eax
	jne	$L858
; Line 1047
	mov	eax, DWORD PTR _out_fname$[ebp]
	push	eax
	call	_pfatal_with_name
	add	esp, 4
; Line 1049
$L858:
$L857:
	push	0
	push	0
	push	OFFSET _outbuf
	mov	eax, DWORD PTR _fp$[ebp]
	push	eax
	call	_output_line_command
	add	esp, 16					; 00000010H
; Line 1053
	push	0
	push	OFFSET _outbuf
	call	_rescan
	add	esp, 8
; Line 1059
	cmp	DWORD PTR _dump_macros, 0
	je	$L861
; Line 1060
	call	_dump_all_macros
; Line 1061
	jmp	$L862
$L861:
	cmp	DWORD PTR _inhibit_output$[ebp], 0
	jne	$L863
	mov	eax, OFFSET __iob
	add	eax, 32					; 00000020H
	cmp	eax, DWORD PTR _deps_stream$[ebp]
	je	$L863
; Line 1062
	mov	eax, DWORD PTR _outbuf+16
	sub	eax, DWORD PTR _outbuf+12
	push	eax
	mov	eax, DWORD PTR _outbuf+12
	push	eax
	mov	eax, DWORD PTR __iob+48
	push	eax
	call	__write
	add	esp, 12					; 0000000cH
	or	eax, eax
	jge	$L864
; Line 1063
	push	OFFSET $SG865
	call	_fatal
	add	esp, 4
; Line 1064
$L864:
; Line 1066
$L863:
$L862:
	cmp	DWORD PTR _print_deps, 0
	je	$L866
; Line 1067
	mov	eax, DWORD PTR _deps_stream$[ebp]
	push	eax
	mov	eax, DWORD PTR _deps_buffer
	push	eax
	call	_fputs
	add	esp, 8
; Line 1068
	mov	eax, DWORD PTR _deps_stream$[ebp]
	dec	DWORD PTR [eax+4]
	mov	eax, DWORD PTR _deps_stream$[ebp]
	cmp	DWORD PTR [eax+4], 0
	jl	$L2862
	mov	eax, DWORD PTR _deps_stream$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	BYTE PTR [eax], 10			; 0000000aH
	mov	eax, DWORD PTR _deps_stream$[ebp]
	inc	DWORD PTR [eax]
	jmp	$L2863
$L2862:
	mov	eax, DWORD PTR _deps_stream$[ebp]
	push	eax
	push	10					; 0000000aH
	call	__flsbuf
	add	esp, 8
$L2863:
; Line 1069
	mov	eax, OFFSET __iob
	add	eax, 32					; 00000020H
	cmp	eax, DWORD PTR _deps_stream$[ebp]
	je	$L867
; Line 1070
	mov	eax, DWORD PTR _deps_stream$[ebp]
	push	eax
	call	_fclose
	add	esp, 4
; Line 1071
	mov	eax, DWORD PTR _deps_stream$[ebp]
	test	BYTE PTR [eax+12], 32			; 00000020H
	je	$L868
; Line 1072
	push	OFFSET $SG869
	call	_fatal
	add	esp, 4
; Line 1073
$L868:
; Line 1074
$L867:
; Line 1076
$L866:
	test	BYTE PTR __iob+44, 32			; 00000020H
	je	$L870
; Line 1077
	push	OFFSET $SG871
	call	_fatal
	add	esp, 4
; Line 1079
$L870:
	cmp	DWORD PTR _errors, 0
	je	$L872
; Line 1080
	push	33					; 00000021H
	call	_exit
	add	esp, 4
; Line 1081
$L872:
	push	0
	call	_exit
	add	esp, 4
; Line 1083
$perror$788:
; Line 1084
	mov	eax, DWORD PTR _in_fname$[ebp]
	push	eax
	call	_pfatal_with_name
	add	esp, 4
; Line 1085
$L630:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_main	ENDP
_TEXT	ENDS
PUBLIC	_warning
_DATA	SEGMENT
$SG903	DB	'%d trigraph(s) encountered', 00H
_DATA	ENDS
_TEXT	SEGMENT
_buf$ = 8
_c$ = -16
_fptr$ = -4
_bptr$ = -20
_sptr$ = -8
_len$ = -12
_trigraph_pcp PROC NEAR
; Line 1098
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	push	ebx
	push	esi
	push	edi
; Line 1102
	mov	eax, DWORD PTR _buf$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _sptr$[ebp], eax
	mov	eax, DWORD PTR _sptr$[ebp]
	mov	DWORD PTR _bptr$[ebp], eax
	mov	eax, DWORD PTR _bptr$[ebp]
	mov	DWORD PTR _fptr$[ebp], eax
; Line 1103
$L881:
	push	63					; 0000003fH
	mov	eax, DWORD PTR _sptr$[ebp]
	push	eax
	call	_strchr
	add	esp, 8
	mov	DWORD PTR _sptr$[ebp], eax
	cmp	DWORD PTR _sptr$[ebp], 0
	je	$L882
; Line 1104
	inc	DWORD PTR _sptr$[ebp]
	mov	eax, DWORD PTR _sptr$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 63					; 0000003fH
	je	$L883
; Line 1105
	jmp	$L881
; Line 1106
$L883:
	inc	DWORD PTR _sptr$[ebp]
	mov	eax, DWORD PTR _sptr$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR -24+[ebp], eax
	jmp	$L884
; Line 1107
$L888:
; Line 1108
	mov	BYTE PTR _c$[ebp], 35			; 00000023H
; Line 1109
	jmp	$L885
; Line 1110
$L889:
; Line 1111
	mov	BYTE PTR _c$[ebp], 91			; 0000005bH
; Line 1112
	jmp	$L885
; Line 1113
$L890:
; Line 1114
	mov	BYTE PTR _c$[ebp], 92			; 0000005cH
; Line 1115
	jmp	$L885
; Line 1116
$L891:
; Line 1117
	mov	BYTE PTR _c$[ebp], 93			; 0000005dH
; Line 1118
	jmp	$L885
; Line 1119
$L892:
; Line 1120
	mov	BYTE PTR _c$[ebp], 94			; 0000005eH
; Line 1121
	jmp	$L885
; Line 1122
$L893:
; Line 1123
	mov	BYTE PTR _c$[ebp], 123			; 0000007bH
; Line 1124
	jmp	$L885
; Line 1125
$L894:
; Line 1126
	mov	BYTE PTR _c$[ebp], 124			; 0000007cH
; Line 1127
	jmp	$L885
; Line 1128
$L895:
; Line 1129
	mov	BYTE PTR _c$[ebp], 125			; 0000007dH
; Line 1130
	jmp	$L885
; Line 1131
$L896:
; Line 1132
	mov	BYTE PTR _c$[ebp], 126			; 0000007eH
; Line 1133
	jmp	$L885
; Line 1134
$L897:
; Line 1135
	dec	DWORD PTR _sptr$[ebp]
; Line 1136
	jmp	$L881
; Line 1137
$L898:
; Line 1138
	jmp	$L881
; Line 1139
	jmp	$L885
$L884:
	sub	DWORD PTR -24+[ebp], 33			; 00000021H
	cmp	DWORD PTR -24+[ebp], 30			; 0000001eH
	ja	$L881
	shl	DWORD PTR -24+[ebp], 2
	mov	eax, DWORD PTR -24+[ebp]
	jmp	DWORD PTR $L2870[eax]
$L2870:
	DD	OFFSET $L894
	DD	OFFSET $L898
	DD	OFFSET $L898
	DD	OFFSET $L898
	DD	OFFSET $L898
	DD	OFFSET $L898
	DD	OFFSET $L892
	DD	OFFSET $L889
	DD	OFFSET $L891
	DD	OFFSET $L898
	DD	OFFSET $L898
	DD	OFFSET $L898
	DD	OFFSET $L896
	DD	OFFSET $L898
	DD	OFFSET $L890
	DD	OFFSET $L898
	DD	OFFSET $L898
	DD	OFFSET $L898
	DD	OFFSET $L898
	DD	OFFSET $L898
	DD	OFFSET $L898
	DD	OFFSET $L898
	DD	OFFSET $L898
	DD	OFFSET $L898
	DD	OFFSET $L898
	DD	OFFSET $L898
	DD	OFFSET $L898
	DD	OFFSET $L893
	DD	OFFSET $L888
	DD	OFFSET $L895
	DD	OFFSET $L897
$L885:
; Line 1140
	mov	eax, DWORD PTR _sptr$[ebp]
	sub	eax, DWORD PTR _fptr$[ebp]
	sub	eax, 2
	mov	DWORD PTR _len$[ebp], eax
; Line 1141
	mov	eax, DWORD PTR _fptr$[ebp]
	cmp	DWORD PTR _bptr$[ebp], eax
	je	$L899
	cmp	DWORD PTR _len$[ebp], 0
	jle	$L899
; Line 1142
	mov	eax, DWORD PTR _len$[ebp]
	push	eax
	mov	eax, DWORD PTR _bptr$[ebp]
	push	eax
	mov	eax, DWORD PTR _fptr$[ebp]
	push	eax
	call	_bcopy
	add	esp, 12					; 0000000cH
; Line 1145
$L899:
	mov	eax, DWORD PTR _len$[ebp]
	add	DWORD PTR _bptr$[ebp], eax
; Line 1146
	mov	al, BYTE PTR _c$[ebp]
	mov	ecx, DWORD PTR _bptr$[ebp]
	mov	BYTE PTR [ecx], al
	inc	DWORD PTR _bptr$[ebp]
; Line 1147
	inc	DWORD PTR _sptr$[ebp]
	mov	eax, DWORD PTR _sptr$[ebp]
	mov	DWORD PTR _fptr$[ebp], eax
; Line 1148
	jmp	$L881
$L882:
; Line 1149
	mov	eax, DWORD PTR _buf$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _fptr$[ebp]
	mov	edx, DWORD PTR _buf$[ebp]
	sub	ecx, DWORD PTR [edx+12]
	sub	eax, ecx
	mov	DWORD PTR _len$[ebp], eax
; Line 1150
	mov	eax, DWORD PTR _fptr$[ebp]
	cmp	DWORD PTR _bptr$[ebp], eax
	je	$L900
	cmp	DWORD PTR _len$[ebp], 0
	jle	$L900
; Line 1151
	mov	eax, DWORD PTR _len$[ebp]
	push	eax
	mov	eax, DWORD PTR _bptr$[ebp]
	push	eax
	mov	eax, DWORD PTR _fptr$[ebp]
	push	eax
	call	_bcopy
	add	esp, 12					; 0000000cH
; Line 1152
$L900:
	sub	eax, eax
	mov	ecx, DWORD PTR _fptr$[ebp]
	sub	ecx, DWORD PTR _bptr$[ebp]
	sub	eax, ecx
	neg	eax
	mov	ecx, DWORD PTR _buf$[ebp]
	sub	DWORD PTR [ecx+8], eax
; Line 1153
	mov	eax, DWORD PTR _buf$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _buf$[ebp]
	mov	ecx, DWORD PTR [ecx+12]
	mov	BYTE PTR [eax+ecx], 0
; Line 1154
	cmp	DWORD PTR _warn_trigraphs, 0
	je	$L901
	mov	eax, DWORD PTR _fptr$[ebp]
	cmp	DWORD PTR _bptr$[ebp], eax
	je	$L901
; Line 1155
	mov	eax, DWORD PTR _fptr$[ebp]
	sub	eax, DWORD PTR _bptr$[ebp]
	cdq
	sub	eax, edx
	sar	eax, 1
	push	eax
	push	OFFSET $SG903
	call	_warning
	add	esp, 8
; Line 1156
$L901:
$L874:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_trigraph_pcp ENDP
_TEXT	ENDS
PUBLIC	_newline_fix
_TEXT	SEGMENT
_bp$ = 8
_p$ = -8
_count$ = -4
_newline_fix PROC NEAR
; Line 1167
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	push	ebx
	push	esi
	push	edi
; Line 1168
	mov	eax, DWORD PTR _bp$[ebp]
	mov	DWORD PTR _p$[ebp], eax
; Line 1169
	mov	DWORD PTR _count$[ebp], 0
; Line 1173
$L910:
	mov	eax, DWORD PTR _p$[ebp]
	mov	DWORD PTR -12+[ebp], eax
	inc	DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR -12+[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 92					; 0000005cH
	jne	$L911
	mov	eax, DWORD PTR _p$[ebp]
	mov	DWORD PTR -16+[ebp], eax
	inc	DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR -16+[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 10					; 0000000aH
	jne	$L911
; Line 1174
	inc	DWORD PTR _count$[ebp]
	jmp	$L910
$L911:
; Line 1176
	mov	eax, DWORD PTR _count$[ebp]
	add	eax, eax
	add	eax, DWORD PTR _bp$[ebp]
	mov	DWORD PTR _p$[ebp], eax
; Line 1180
	cmp	DWORD PTR _count$[ebp], 0
	je	$L913
	mov	eax, DWORD PTR _p$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 47					; 0000002fH
	je	$L912
	mov	eax, DWORD PTR _p$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 42					; 0000002aH
	je	$L912
$L913:
; Line 1181
	jmp	$L906
; Line 1187
$L912:
$L915:
	mov	eax, DWORD PTR _p$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 42					; 0000002aH
	je	$L917
	mov	eax, DWORD PTR _p$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 47					; 0000002fH
	jne	$L916
$L917:
; Line 1188
	mov	eax, DWORD PTR _p$[ebp]
	mov	al, BYTE PTR [eax]
	mov	ecx, DWORD PTR _bp$[ebp]
	mov	BYTE PTR [ecx], al
	inc	DWORD PTR _p$[ebp]
	inc	DWORD PTR _bp$[ebp]
	jmp	$L915
$L916:
; Line 1191
$L919:
	mov	eax, DWORD PTR _count$[ebp]
	mov	DWORD PTR -20+[ebp], eax
	dec	DWORD PTR _count$[ebp]
	cmp	DWORD PTR -20+[ebp], 0
	jle	$L920
; Line 1192
	mov	eax, DWORD PTR _bp$[ebp]
	mov	BYTE PTR [eax], 92			; 0000005cH
	inc	DWORD PTR _bp$[ebp]
; Line 1193
	mov	eax, DWORD PTR _bp$[ebp]
	mov	BYTE PTR [eax], 10			; 0000000aH
	inc	DWORD PTR _bp$[ebp]
; Line 1194
	jmp	$L919
$L920:
; Line 1195
$L906:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_newline_fix ENDP
_TEXT	ENDS
PUBLIC	_name_newline_fix
_TEXT	SEGMENT
_bp$ = 8
_p$ = -8
_count$ = -4
_name_newline_fix PROC NEAR
; Line 1202
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	push	ebx
	push	esi
	push	edi
; Line 1203
	mov	eax, DWORD PTR _bp$[ebp]
	mov	DWORD PTR _p$[ebp], eax
; Line 1204
	mov	DWORD PTR _count$[ebp], 0
; Line 1208
$L927:
	mov	eax, DWORD PTR _p$[ebp]
	mov	DWORD PTR -12+[ebp], eax
	inc	DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR -12+[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 92					; 0000005cH
	jne	$L928
	mov	eax, DWORD PTR _p$[ebp]
	mov	DWORD PTR -16+[ebp], eax
	inc	DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR -16+[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 10					; 0000000aH
	jne	$L928
; Line 1209
	inc	DWORD PTR _count$[ebp]
	jmp	$L927
$L928:
; Line 1211
	mov	eax, DWORD PTR _count$[ebp]
	add	eax, eax
	add	eax, DWORD PTR _bp$[ebp]
	mov	DWORD PTR _p$[ebp], eax
; Line 1215
	cmp	DWORD PTR _count$[ebp], 0
	je	$L930
	mov	eax, DWORD PTR _p$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	al, BYTE PTR _is_idchar[eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	jne	$L929
$L930:
; Line 1216
	jmp	$L923
; Line 1222
$L929:
$L932:
	mov	eax, DWORD PTR _p$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	al, BYTE PTR _is_idchar[eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L933
; Line 1223
	mov	eax, DWORD PTR _p$[ebp]
	mov	al, BYTE PTR [eax]
	mov	ecx, DWORD PTR _bp$[ebp]
	mov	BYTE PTR [ecx], al
	inc	DWORD PTR _p$[ebp]
	inc	DWORD PTR _bp$[ebp]
	jmp	$L932
$L933:
; Line 1226
$L935:
	mov	eax, DWORD PTR _count$[ebp]
	mov	DWORD PTR -20+[ebp], eax
	dec	DWORD PTR _count$[ebp]
	cmp	DWORD PTR -20+[ebp], 0
	jle	$L936
; Line 1227
	mov	eax, DWORD PTR _bp$[ebp]
	mov	BYTE PTR [eax], 92			; 0000005cH
	inc	DWORD PTR _bp$[ebp]
; Line 1228
	mov	eax, DWORD PTR _bp$[ebp]
	mov	BYTE PTR [eax], 10			; 0000000aH
	inc	DWORD PTR _bp$[ebp]
; Line 1229
	jmp	$L935
$L936:
; Line 1230
$L923:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_name_newline_fix ENDP
_TEXT	ENDS
PUBLIC	_skip_if_group
PUBLIC	_grow_outbuf
PUBLIC	_handle_directive
PUBLIC	_error_with_line
PUBLIC	_line_for_error
PUBLIC	_macroexpand
EXTRN	__isctype:NEAR
EXTRN	___mb_cur_max:DWORD
EXTRN	_free:NEAR
EXTRN	__pctype:DWORD
_DATA	SEGMENT
	ORG $+1
$SG1020	DB	'unterminated string or character constant', 00H
	ORG $+2
$SG1030	DB	'unterminated string or character constant', 00H
	ORG $+2
$SG1068	DB	'`/*'' within comment', 00H
$SG1077	DB	'unterminated comment', 00H
	ORG $+3
$SG1193	DB	'if', 00H
	ORG $+1
$SG1195	DB	'ifdef', 00H
	ORG $+2
$SG1197	DB	'ifndef', 00H
	ORG $+1
$SG1199	DB	'else', 00H
	ORG $+3
$SG1201	DB	'elif', 00H
	ORG $+3
$SG1202	DB	'unterminated #%s conditional', 00H
_DATA	ENDS
_TEXT	SEGMENT
_bp$973 = -48
_before_bp$1045 = -52
_before_bp$1058 = -56
_str$1187 = -88
_hp$1125 = -60
_op$ = 8
_obufp_before_macroname$1130 = -84
_output_marks$ = 12
_op_lineno_before_macroname$1131 = -72
_i$1132 = -76
_c$ = -36
_p$1133 = -68
_ident_length$ = -8
_q$1134 = -80
_hash$ = -24
_disabled$1135 = -64
_ip$ = -40
_ibp$ = -28
_limit$ = -44
_obp$ = -32
_redo_char$ = -12
_concatenated$ = -4
_start_line$ = -20
_beg_of_line$ = -16
_rescan	PROC NEAR
; Line 1271
	push	ebp
	mov	ebp, esp
	sub	esp, 132				; 00000084H
	push	ebx
	push	esi
	push	edi
; Line 1276
	mov	DWORD PTR _ident_length$[ebp], 0
; Line 1279
	mov	DWORD PTR _hash$[ebp], 0
; Line 1299
	mov	DWORD PTR _redo_char$[ebp], 0
; Line 1303
	mov	DWORD PTR _concatenated$[ebp], 0
; Line 1331
	cmp	DWORD PTR _no_output, 0
	je	$L951
	mov	eax, DWORD PTR _indepth
	shl	eax, 5
	cmp	DWORD PTR _instack[eax], 0
	je	$L951
; Line 1332
	push	1
	mov	eax, DWORD PTR _indepth
	shl	eax, 5
	add	eax, OFFSET _instack
	push	eax
	call	_skip_if_group
	add	esp, 8
; Line 1334
$L951:
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _obp$[ebp], eax
; Line 1335
$L952:
	mov	eax, DWORD PTR _indepth
	shl	eax, 5
	add	eax, OFFSET _instack
	mov	DWORD PTR _ip$[ebp], eax
	mov	eax, DWORD PTR _ip$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _ibp$[ebp], eax
	mov	eax, DWORD PTR _ip$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _ip$[ebp]
	add	eax, DWORD PTR [ecx+12]
	mov	DWORD PTR _limit$[ebp], eax
	mov	eax, DWORD PTR _obp$[ebp]
	mov	ecx, DWORD PTR _op$[ebp]
	mov	DWORD PTR [ecx+16], eax
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _op$[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	mov	edx, DWORD PTR _op$[ebp]
	sub	ecx, DWORD PTR [edx+12]
	sub	eax, ecx
	mov	ecx, DWORD PTR _limit$[ebp]
	sub	ecx, DWORD PTR _ibp$[ebp]
	cmp	eax, ecx
	jle	$L2871
	jmp	$L2872
$L2871:
	mov	eax, DWORD PTR _limit$[ebp]
	sub	eax, DWORD PTR _ibp$[ebp]
	push	eax
	mov	eax, DWORD PTR _op$[ebp]
	push	eax
	call	_grow_outbuf
	add	esp, 8
$L2872:
	mov	DWORD PTR _beg_of_line$[ebp], 0
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _obp$[ebp], eax
$L953:
$L954:
; Line 1336
	mov	eax, DWORD PTR _ibp$[ebp]
	mov	DWORD PTR _beg_of_line$[ebp], eax
; Line 1340
	mov	eax, DWORD PTR _limit$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L955
; Line 1341
	call	_abort
; Line 1343
$L955:
$L957:
; Line 1344
	mov	eax, DWORD PTR _ibp$[ebp]
	mov	al, BYTE PTR [eax]
	mov	BYTE PTR _c$[ebp], al
	inc	DWORD PTR _ibp$[ebp]
; Line 1345
	mov	al, BYTE PTR _c$[ebp]
	mov	ecx, DWORD PTR _obp$[ebp]
	mov	BYTE PTR [ecx], al
	inc	DWORD PTR _obp$[ebp]
; Line 1347
	xor	eax, eax
	mov	al, BYTE PTR _c$[ebp]
	mov	DWORD PTR -120+[ebp], eax
	jmp	$L959
; Line 1348
$L963:
; Line 1349
	mov	eax, DWORD PTR _ibp$[ebp]
	cmp	DWORD PTR _limit$[ebp], eax
	ja	$L964
; Line 1350
	jmp	$L960
; Line 1351
$L964:
	mov	eax, DWORD PTR _ibp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 10					; 0000000aH
	jne	$L965
; Line 1354
	inc	DWORD PTR _ibp$[ebp]
; Line 1355
	mov	eax, DWORD PTR _ip$[ebp]
	inc	DWORD PTR [eax+4]
; Line 1356
	dec	DWORD PTR _obp$[ebp]
; Line 1357
	jmp	$L960
; Line 1362
$L965:
	cmp	DWORD PTR _ident_length$[ebp], 0
	jle	$L966
; Line 1363
	jmp	$specialchar$967
; Line 1364
$L966:
	mov	eax, DWORD PTR _ibp$[ebp]
	mov	al, BYTE PTR [eax]
	mov	ecx, DWORD PTR _obp$[ebp]
	mov	BYTE PTR [ecx], al
	inc	DWORD PTR _ibp$[ebp]
	inc	DWORD PTR _obp$[ebp]
; Line 1365
	jmp	$L960
; Line 1367
$L968:
; Line 1370
	mov	eax, DWORD PTR _ip$[ebp]
	cmp	DWORD PTR [eax+20], 0
	je	$L969
; Line 1371
	jmp	$randomchar$970
; Line 1372
$L969:
	cmp	DWORD PTR _ident_length$[ebp], 0
	je	$L971
; Line 1373
	jmp	$specialchar$967
; Line 1376
$L971:
	cmp	DWORD PTR _beg_of_line$[ebp], 0
	jne	$L972
; Line 1377
	jmp	$randomchar$970
; Line 1378
$L972:
; Line 1384
	mov	eax, DWORD PTR _beg_of_line$[ebp]
	mov	DWORD PTR _bp$973[ebp], eax
; Line 1385
$L975:
; Line 1386
	mov	eax, DWORD PTR _bp$973[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	al, BYTE PTR _is_hor_space[eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L977
; Line 1387
	inc	DWORD PTR _bp$973[ebp]
; Line 1388
	jmp	$L978
$L977:
	mov	eax, DWORD PTR _bp$973[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 92					; 0000005cH
	jne	$L979
	mov	eax, DWORD PTR _bp$973[ebp]
	mov	al, BYTE PTR [eax+1]
	and	eax, 255				; 000000ffH
	cmp	eax, 10					; 0000000aH
	jne	$L979
; Line 1389
	add	DWORD PTR _bp$973[ebp], 2
; Line 1390
	jmp	$L980
$L979:
	mov	eax, DWORD PTR _bp$973[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 47					; 0000002fH
	jne	$L981
	mov	eax, DWORD PTR _bp$973[ebp]
	mov	al, BYTE PTR [eax+1]
	and	eax, 255				; 000000ffH
	cmp	eax, 42					; 0000002aH
	jne	$L981
; Line 1391
	add	DWORD PTR _bp$973[ebp], 2
; Line 1392
$L983:
	mov	eax, DWORD PTR _bp$973[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 42					; 0000002aH
	jne	$L985
	mov	eax, DWORD PTR _bp$973[ebp]
	mov	al, BYTE PTR [eax+1]
	and	eax, 255				; 000000ffH
	cmp	eax, 47					; 0000002fH
	je	$L984
$L985:
; Line 1393
	inc	DWORD PTR _bp$973[ebp]
	jmp	$L983
$L984:
; Line 1394
	add	DWORD PTR _bp$973[ebp], 2
; Line 1398
	jmp	$L986
$L981:
	mov	eax, DWORD PTR _bp$973[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 47					; 0000002fH
	jne	$L987
	mov	eax, DWORD PTR _bp$973[ebp]
	mov	al, BYTE PTR [eax+1]
	and	eax, 255				; 000000ffH
	cmp	eax, 47					; 0000002fH
	jne	$L987
; Line 1399
	add	DWORD PTR _bp$973[ebp], 2
; Line 1400
$L989:
	mov	eax, DWORD PTR _bp$973[ebp]
	mov	DWORD PTR -92+[ebp], eax
	inc	DWORD PTR _bp$973[ebp]
	mov	eax, DWORD PTR -92+[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 10					; 0000000aH
	je	$L990
	jmp	$L989
$L990:
; Line 1402
	jmp	$L991
$L987:
	jmp	$L976
$L991:
$L986:
$L980:
$L978:
; Line 1403
	jmp	$L975
$L976:
; Line 1404
	mov	eax, DWORD PTR _bp$973[ebp]
	inc	eax
	cmp	eax, DWORD PTR _ibp$[ebp]
	je	$L992
; Line 1405
	jmp	$randomchar$970
; Line 1406
$L992:
; Line 1410
	dec	DWORD PTR _obp$[ebp]
; Line 1412
	mov	eax, DWORD PTR _ibp$[ebp]
	mov	ecx, DWORD PTR _ip$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 1413
	mov	eax, DWORD PTR _obp$[ebp]
	mov	ecx, DWORD PTR _op$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 1414
	mov	eax, DWORD PTR _op$[ebp]
	push	eax
	mov	eax, DWORD PTR _ip$[ebp]
	push	eax
	call	_handle_directive
	add	esp, 8
	or	eax, eax
	jne	$L993
; Line 1420
	cmp	DWORD PTR _no_output, 0
	je	$L994
	mov	eax, DWORD PTR _indepth
	shl	eax, 5
	cmp	DWORD PTR _instack[eax], 0
	je	$L994
; Line 1424
	push	1
	mov	eax, DWORD PTR _indepth
	shl	eax, 5
	add	eax, OFFSET _instack
	push	eax
	call	_skip_if_group
	add	esp, 8
; Line 1425
$L995:
	mov	eax, DWORD PTR _indepth
	shl	eax, 5
	add	eax, OFFSET _instack
	mov	DWORD PTR _ip$[ebp], eax
	mov	eax, DWORD PTR _ip$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _ibp$[ebp], eax
	mov	eax, DWORD PTR _ip$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _ip$[ebp]
	add	eax, DWORD PTR [ecx+12]
	mov	DWORD PTR _limit$[ebp], eax
	mov	eax, DWORD PTR _obp$[ebp]
	mov	ecx, DWORD PTR _op$[ebp]
	mov	DWORD PTR [ecx+16], eax
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _op$[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	mov	edx, DWORD PTR _op$[ebp]
	sub	ecx, DWORD PTR [edx+12]
	sub	eax, ecx
	mov	ecx, DWORD PTR _limit$[ebp]
	sub	ecx, DWORD PTR _ibp$[ebp]
	cmp	eax, ecx
	jle	$L2873
	jmp	$L2874
$L2873:
	mov	eax, DWORD PTR _limit$[ebp]
	sub	eax, DWORD PTR _ibp$[ebp]
	push	eax
	mov	eax, DWORD PTR _op$[ebp]
	push	eax
	call	_grow_outbuf
	add	esp, 8
$L2874:
	mov	DWORD PTR _beg_of_line$[ebp], 0
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _obp$[ebp], eax
$L996:
$L997:
; Line 1426
	mov	eax, DWORD PTR _ibp$[ebp]
	mov	DWORD PTR _beg_of_line$[ebp], eax
; Line 1427
	jmp	$L960
; Line 1429
$L994:
	inc	DWORD PTR _obp$[ebp]
; Line 1430
	jmp	$randomchar$970
; Line 1438
$L993:
	cmp	DWORD PTR _no_output, 0
	je	$L998
	mov	eax, DWORD PTR _indepth
	shl	eax, 5
	cmp	DWORD PTR _instack[eax], 0
	je	$L998
; Line 1439
	push	1
	mov	eax, DWORD PTR _indepth
	shl	eax, 5
	add	eax, OFFSET _instack
	push	eax
	call	_skip_if_group
	add	esp, 8
; Line 1440
$L998:
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _obp$[ebp], eax
; Line 1441
$L999:
	mov	eax, DWORD PTR _indepth
	shl	eax, 5
	add	eax, OFFSET _instack
	mov	DWORD PTR _ip$[ebp], eax
	mov	eax, DWORD PTR _ip$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _ibp$[ebp], eax
	mov	eax, DWORD PTR _ip$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _ip$[ebp]
	add	eax, DWORD PTR [ecx+12]
	mov	DWORD PTR _limit$[ebp], eax
	mov	eax, DWORD PTR _obp$[ebp]
	mov	ecx, DWORD PTR _op$[ebp]
	mov	DWORD PTR [ecx+16], eax
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _op$[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	mov	edx, DWORD PTR _op$[ebp]
	sub	ecx, DWORD PTR [edx+12]
	sub	eax, ecx
	mov	ecx, DWORD PTR _limit$[ebp]
	sub	ecx, DWORD PTR _ibp$[ebp]
	cmp	eax, ecx
	jle	$L2875
	jmp	$L2876
$L2875:
	mov	eax, DWORD PTR _limit$[ebp]
	sub	eax, DWORD PTR _ibp$[ebp]
	push	eax
	mov	eax, DWORD PTR _op$[ebp]
	push	eax
	call	_grow_outbuf
	add	esp, 8
$L2876:
	mov	DWORD PTR _beg_of_line$[ebp], 0
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _obp$[ebp], eax
$L1000:
$L1001:
; Line 1442
	mov	eax, DWORD PTR _ibp$[ebp]
	mov	DWORD PTR _beg_of_line$[ebp], eax
; Line 1443
	jmp	$L960
; Line 1445
$L1002:
; Line 1450
	cmp	DWORD PTR _ident_length$[ebp], 0
	je	$L1003
; Line 1451
	jmp	$specialchar$967
; Line 1453
$L1003:
	mov	eax, DWORD PTR _ip$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _start_line$[ebp], eax
; Line 1457
$L1005:
; Line 1458
	mov	eax, DWORD PTR _ibp$[ebp]
	cmp	DWORD PTR _limit$[ebp], eax
	ja	$L1007
; Line 1459
	cmp	DWORD PTR _traditional, 0
	je	$L1008
; Line 1460
	mov	eax, DWORD PTR _ip$[ebp]
	cmp	DWORD PTR [eax+20], 0
	je	$L1009
; Line 1462
$L1010:
	mov	eax, DWORD PTR _ip$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR [eax+12], 23			; 00000017H
	mov	eax, DWORD PTR _ip$[ebp]
	cmp	DWORD PTR [eax+28], 0
	je	$L1013
	mov	eax, DWORD PTR _ip$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	call	_free
	add	esp, 4
$L1013:
	dec	DWORD PTR _indepth
$L1011:
$L1012:
; Line 1463
$L1014:
	mov	eax, DWORD PTR _indepth
	shl	eax, 5
	add	eax, OFFSET _instack
	mov	DWORD PTR _ip$[ebp], eax
	mov	eax, DWORD PTR _ip$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _ibp$[ebp], eax
	mov	eax, DWORD PTR _ip$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _ip$[ebp]
	add	eax, DWORD PTR [ecx+12]
	mov	DWORD PTR _limit$[ebp], eax
	mov	eax, DWORD PTR _obp$[ebp]
	mov	ecx, DWORD PTR _op$[ebp]
	mov	DWORD PTR [ecx+16], eax
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _op$[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	mov	edx, DWORD PTR _op$[ebp]
	sub	ecx, DWORD PTR [edx+12]
	sub	eax, ecx
	mov	ecx, DWORD PTR _limit$[ebp]
	sub	ecx, DWORD PTR _ibp$[ebp]
	cmp	eax, ecx
	jle	$L2877
	jmp	$L2878
$L2877:
	mov	eax, DWORD PTR _limit$[ebp]
	sub	eax, DWORD PTR _ibp$[ebp]
	push	eax
	mov	eax, DWORD PTR _op$[ebp]
	push	eax
	call	_grow_outbuf
	add	esp, 8
$L2878:
	mov	DWORD PTR _beg_of_line$[ebp], 0
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _obp$[ebp], eax
$L1015:
$L1016:
; Line 1464
	jmp	$L1005
; Line 1466
$L1009:
	jmp	$L1017
$L1008:
; Line 1468
	push	OFFSET $SG1020
	mov	eax, DWORD PTR _start_line$[ebp]
	push	eax
	call	_line_for_error
	add	esp, 4
	push	eax
	call	_error_with_line
	add	esp, 8
$L1017:
; Line 1469
	jmp	$L1006
; Line 1471
$L1007:
	mov	eax, DWORD PTR _ibp$[ebp]
	mov	al, BYTE PTR [eax]
	mov	ecx, DWORD PTR _obp$[ebp]
	mov	BYTE PTR [ecx], al
	inc	DWORD PTR _obp$[ebp]
; Line 1472
	mov	eax, DWORD PTR _ibp$[ebp]
	mov	DWORD PTR -96+[ebp], eax
	inc	DWORD PTR _ibp$[ebp]
	mov	eax, DWORD PTR -96+[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR -124+[ebp], eax
	jmp	$L1021
; Line 1473
$L1025:
; Line 1474
	mov	eax, DWORD PTR _ip$[ebp]
	inc	DWORD PTR [eax+4]
; Line 1475
	mov	eax, DWORD PTR _op$[ebp]
	inc	DWORD PTR [eax+4]
; Line 1478
	cmp	DWORD PTR _traditional, 0
	je	$L1026
; Line 1479
	mov	eax, DWORD PTR _ibp$[ebp]
	mov	DWORD PTR _beg_of_line$[ebp], eax
; Line 1480
	jmp	$while2end$1027
; Line 1482
$L1026:
	cmp	DWORD PTR _pedantic, 0
	jne	$L1029
	xor	eax, eax
	mov	al, BYTE PTR _c$[ebp]
	cmp	eax, 39					; 00000027H
	jne	$L1028
$L1029:
; Line 1484
	push	OFFSET $SG1030
	mov	eax, DWORD PTR _start_line$[ebp]
	push	eax
	call	_line_for_error
	add	esp, 4
	push	eax
	call	_error_with_line
	add	esp, 8
; Line 1485
	jmp	$while2end$1027
; Line 1487
$L1028:
	jmp	$L1022
; Line 1489
$L1031:
; Line 1490
	mov	eax, DWORD PTR _ibp$[ebp]
	cmp	DWORD PTR _limit$[ebp], eax
	ja	$L1032
; Line 1491
	jmp	$L1022
; Line 1492
$L1032:
	mov	eax, DWORD PTR _ibp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 10					; 0000000aH
	jne	$L1033
; Line 1495
	dec	DWORD PTR _obp$[ebp]
; Line 1496
	inc	DWORD PTR _ibp$[ebp]
; Line 1497
	mov	eax, DWORD PTR _ip$[ebp]
	inc	DWORD PTR [eax+4]
; Line 1498
	jmp	$L1034
$L1033:
; Line 1501
$L1036:
	mov	eax, DWORD PTR _ibp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 92					; 0000005cH
	jne	$L1037
	mov	eax, DWORD PTR _ibp$[ebp]
	mov	al, BYTE PTR [eax+1]
	and	eax, 255				; 000000ffH
	cmp	eax, 10					; 0000000aH
	jne	$L1037
; Line 1502
	add	DWORD PTR _ibp$[ebp], 2
; Line 1503
	mov	eax, DWORD PTR _ip$[ebp]
	inc	DWORD PTR [eax+4]
; Line 1504
	jmp	$L1036
$L1037:
; Line 1505
	mov	eax, DWORD PTR _ibp$[ebp]
	mov	al, BYTE PTR [eax]
	mov	ecx, DWORD PTR _obp$[ebp]
	mov	BYTE PTR [ecx], al
	inc	DWORD PTR _ibp$[ebp]
	inc	DWORD PTR _obp$[ebp]
; Line 1506
$L1034:
; Line 1507
	jmp	$L1022
; Line 1509
$L1038:
; Line 1511
	mov	eax, DWORD PTR _ibp$[ebp]
	mov	al, BYTE PTR [eax-1]
	and	eax, 255				; 000000ffH
	xor	ecx, ecx
	mov	cl, BYTE PTR _c$[ebp]
	cmp	eax, ecx
	jne	$L1039
; Line 1512
	jmp	$while2end$1027
; Line 1513
$L1039:
	jmp	$L1022
; Line 1514
	jmp	$L1022
$L1021:
	cmp	DWORD PTR -124+[ebp], 10		; 0000000aH
	je	$L1025
	cmp	DWORD PTR -124+[ebp], 34		; 00000022H
	je	$L1038
	cmp	DWORD PTR -124+[ebp], 39		; 00000027H
	je	$L1038
	cmp	DWORD PTR -124+[ebp], 92		; 0000005cH
	je	$L1031
	jmp	$L1022
$L1022:
; Line 1515
	jmp	$L1005
$L1006:
; Line 1516
$while2end$1027:
; Line 1517
	jmp	$L960
; Line 1519
$L1040:
; Line 1520
	mov	eax, DWORD PTR _ibp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 92					; 0000005cH
	jne	$L1041
	mov	eax, DWORD PTR _ibp$[ebp]
	mov	al, BYTE PTR [eax+1]
	and	eax, 255				; 000000ffH
	cmp	eax, 10					; 0000000aH
	jne	$L1041
; Line 1521
	mov	eax, DWORD PTR _ibp$[ebp]
	push	eax
	call	_newline_fix
	add	esp, 4
; Line 1524
$L1041:
	mov	eax, DWORD PTR _ibp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 47					; 0000002fH
	jne	$L1042
; Line 1526
	mov	eax, DWORD PTR _ip$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _start_line$[ebp], eax
; Line 1528
	dec	DWORD PTR _ibp$[ebp]
; Line 1529
	dec	DWORD PTR _obp$[ebp]
; Line 1532
	cmp	DWORD PTR _put_out_comments, 0
	jne	$L1043
; Line 1533
	mov	eax, DWORD PTR _obp$[ebp]
	mov	BYTE PTR [eax], 32			; 00000020H
	inc	DWORD PTR _obp$[ebp]
; Line 1534
	jmp	$L1044
$L1043:
; Line 1536
	mov	eax, DWORD PTR _obp$[ebp]
	mov	BYTE PTR [eax], 47			; 0000002fH
	inc	DWORD PTR _obp$[ebp]
; Line 1537
	mov	eax, DWORD PTR _obp$[ebp]
	mov	BYTE PTR [eax], 47			; 0000002fH
	inc	DWORD PTR _obp$[ebp]
; Line 1538
$L1044:
; Line 1540
	mov	eax, DWORD PTR _ibp$[ebp]
	add	eax, 2
	mov	DWORD PTR _before_bp$1045[ebp], eax
; Line 1542
$L1047:
	mov	eax, DWORD PTR _ibp$[ebp]
	cmp	DWORD PTR _limit$[ebp], eax
	jbe	$L1048
; Line 1543
	mov	eax, DWORD PTR _ibp$[ebp]
	mov	DWORD PTR -100+[ebp], eax
	inc	DWORD PTR _ibp$[ebp]
	mov	eax, DWORD PTR -100+[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 10					; 0000000aH
	jne	$L1049
; Line 1544
	dec	DWORD PTR _ibp$[ebp]
; Line 1545
	cmp	DWORD PTR _put_out_comments, 0
	je	$L1050
; Line 1546
	mov	eax, DWORD PTR _ibp$[ebp]
	sub	eax, DWORD PTR _before_bp$1045[ebp]
	push	eax
	mov	eax, DWORD PTR _obp$[ebp]
	push	eax
	mov	eax, DWORD PTR _before_bp$1045[ebp]
	push	eax
	call	_bcopy
	add	esp, 12					; 0000000cH
; Line 1547
	mov	eax, DWORD PTR _ibp$[ebp]
	sub	eax, DWORD PTR _before_bp$1045[ebp]
	add	DWORD PTR _obp$[ebp], eax
; Line 1549
$L1050:
	jmp	$L1048
; Line 1551
$L1049:
	jmp	$L1047
$L1048:
; Line 1552
	jmp	$L960
; Line 1555
$L1042:
	mov	eax, DWORD PTR _ibp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 42					; 0000002aH
	je	$L1051
; Line 1556
	jmp	$randomchar$970
; Line 1557
$L1051:
	mov	eax, DWORD PTR _ip$[ebp]
	cmp	DWORD PTR [eax+20], 0
	je	$L1052
; Line 1558
	jmp	$randomchar$970
; Line 1559
$L1052:
	cmp	DWORD PTR _ident_length$[ebp], 0
	je	$L1053
; Line 1560
	jmp	$specialchar$967
; Line 1564
$L1053:
	mov	eax, DWORD PTR _ip$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _start_line$[ebp], eax
; Line 1566
	inc	DWORD PTR _ibp$[ebp]
; Line 1571
	cmp	DWORD PTR _put_out_comments, 0
	jne	$L1054
; Line 1572
	cmp	DWORD PTR _traditional, 0
	je	$L1055
; Line 1573
	dec	DWORD PTR _obp$[ebp]
; Line 1574
	jmp	$L1056
$L1055:
; Line 1575
	mov	eax, DWORD PTR _obp$[ebp]
	mov	BYTE PTR [eax-1], 32			; 00000020H
$L1056:
; Line 1577
	jmp	$L1057
$L1054:
; Line 1578
	mov	eax, DWORD PTR _obp$[ebp]
	mov	BYTE PTR [eax], 42			; 0000002aH
	inc	DWORD PTR _obp$[ebp]
$L1057:
; Line 1581
	mov	eax, DWORD PTR _ibp$[ebp]
	mov	DWORD PTR _before_bp$1058[ebp], eax
; Line 1583
$L1060:
	mov	eax, DWORD PTR _ibp$[ebp]
	cmp	DWORD PTR _limit$[ebp], eax
	jbe	$L1061
; Line 1584
	mov	eax, DWORD PTR _ibp$[ebp]
	mov	DWORD PTR -104+[ebp], eax
	inc	DWORD PTR _ibp$[ebp]
	mov	eax, DWORD PTR -104+[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR -128+[ebp], eax
	jmp	$L1062
; Line 1585
$L1066:
; Line 1586
	cmp	DWORD PTR _warn_comments, 0
	je	$L1067
	mov	eax, DWORD PTR _ibp$[ebp]
	cmp	DWORD PTR _limit$[ebp], eax
	jbe	$L1067
	mov	eax, DWORD PTR _ibp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 42					; 0000002aH
	jne	$L1067
; Line 1587
	push	OFFSET $SG1068
	call	_warning
	add	esp, 4
; Line 1588
$L1067:
	jmp	$L1063
; Line 1589
$L1069:
; Line 1590
	mov	eax, DWORD PTR _ibp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 92					; 0000005cH
	jne	$L1070
	mov	eax, DWORD PTR _ibp$[ebp]
	mov	al, BYTE PTR [eax+1]
	and	eax, 255				; 000000ffH
	cmp	eax, 10					; 0000000aH
	jne	$L1070
; Line 1591
	mov	eax, DWORD PTR _ibp$[ebp]
	push	eax
	call	_newline_fix
	add	esp, 4
; Line 1592
$L1070:
	mov	eax, DWORD PTR _ibp$[ebp]
	cmp	DWORD PTR _limit$[ebp], eax
	jbe	$L1072
	mov	eax, DWORD PTR _ibp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 47					; 0000002fH
	jne	$L1071
$L1072:
; Line 1593
	jmp	$comment_end$1073
; Line 1594
$L1071:
	jmp	$L1063
; Line 1595
$L1074:
; Line 1596
	mov	eax, DWORD PTR _ip$[ebp]
	inc	DWORD PTR [eax+4]
; Line 1600
	cmp	DWORD PTR _put_out_comments, 0
	jne	$L1075
; Line 1601
	mov	eax, DWORD PTR _obp$[ebp]
	mov	BYTE PTR [eax], 10			; 0000000aH
	inc	DWORD PTR _obp$[ebp]
; Line 1602
$L1075:
	mov	eax, DWORD PTR _op$[ebp]
	inc	DWORD PTR [eax+4]
; Line 1603
	jmp	$L1063
$L1062:
	cmp	DWORD PTR -128+[ebp], 10		; 0000000aH
	je	$L1074
	cmp	DWORD PTR -128+[ebp], 42		; 0000002aH
	je	$L1069
	cmp	DWORD PTR -128+[ebp], 47		; 0000002fH
	je	$L1066
	jmp	$L1063
$L1063:
; Line 1604
	jmp	$L1060
$L1061:
; Line 1605
$comment_end$1073:
; Line 1607
	mov	eax, DWORD PTR _ibp$[ebp]
	cmp	DWORD PTR _limit$[ebp], eax
	ja	$L1076
; Line 1609
	push	OFFSET $SG1077
	mov	eax, DWORD PTR _start_line$[ebp]
	push	eax
	call	_line_for_error
	add	esp, 4
	push	eax
	call	_error_with_line
	add	esp, 8
; Line 1610
	jmp	$L1078
$L1076:
; Line 1611
	inc	DWORD PTR _ibp$[ebp]
; Line 1612
	cmp	DWORD PTR _put_out_comments, 0
	je	$L1079
; Line 1613
	mov	eax, DWORD PTR _ibp$[ebp]
	sub	eax, DWORD PTR _before_bp$1058[ebp]
	push	eax
	mov	eax, DWORD PTR _obp$[ebp]
	push	eax
	mov	eax, DWORD PTR _before_bp$1058[ebp]
	push	eax
	call	_bcopy
	add	esp, 12					; 0000000cH
; Line 1614
	mov	eax, DWORD PTR _ibp$[ebp]
	sub	eax, DWORD PTR _before_bp$1058[ebp]
	add	DWORD PTR _obp$[ebp], eax
; Line 1616
$L1079:
$L1078:
; Line 1618
	jmp	$L960
; Line 1620
$L1080:
; Line 1621
	cmp	DWORD PTR _dollars_in_ident, 0
	jne	$L1081
; Line 1622
	jmp	$randomchar$970
; Line 1623
$L1081:
	jmp	$letter$1082
; Line 1625
$L1083:
; Line 1633
	cmp	DWORD PTR _ident_length$[ebp], 0
	jne	$L1084
; Line 1634
$L1086:
	mov	eax, DWORD PTR _ibp$[ebp]
	cmp	DWORD PTR _limit$[ebp], eax
	jbe	$L1087
; Line 1635
	mov	eax, DWORD PTR _ibp$[ebp]
	mov	al, BYTE PTR [eax]
	mov	BYTE PTR _c$[ebp], al
	inc	DWORD PTR _ibp$[ebp]
; Line 1636
	cmp	DWORD PTR ___mb_cur_max, 1
	jle	$L2879
	push	263					; 00000107H
	xor	eax, eax
	mov	al, BYTE PTR _c$[ebp]
	push	eax
	call	__isctype
	add	esp, 8
	mov	DWORD PTR -108+[ebp], eax
	jmp	$L2880
$L2879:
	xor	eax, eax
	mov	al, BYTE PTR _c$[ebp]
	mov	ecx, DWORD PTR __pctype
	mov	ax, WORD PTR [ecx+eax*2]
	and	eax, 263				; 00000107H
	mov	DWORD PTR -108+[ebp], eax
$L2880:
	cmp	DWORD PTR -108+[ebp], 0
	jne	$L1088
	xor	eax, eax
	mov	al, BYTE PTR _c$[ebp]
	cmp	eax, 46					; 0000002eH
	je	$L1088
	xor	eax, eax
	mov	al, BYTE PTR _c$[ebp]
	cmp	eax, 95					; 0000005fH
	je	$L1088
; Line 1637
	dec	DWORD PTR _ibp$[ebp]
; Line 1638
	jmp	$L1087
; Line 1640
$L1088:
	mov	al, BYTE PTR _c$[ebp]
	mov	ecx, DWORD PTR _obp$[ebp]
	mov	BYTE PTR [ecx], al
	inc	DWORD PTR _obp$[ebp]
; Line 1643
	xor	eax, eax
	mov	al, BYTE PTR _c$[ebp]
	cmp	eax, 101				; 00000065H
	je	$L1090
	xor	eax, eax
	mov	al, BYTE PTR _c$[ebp]
	cmp	eax, 69					; 00000045H
	jne	$L1089
$L1090:
; Line 1644
	mov	eax, DWORD PTR _ibp$[ebp]
	cmp	DWORD PTR _limit$[ebp], eax
	jbe	$L1091
	mov	eax, DWORD PTR _ibp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 43					; 0000002bH
	je	$L1092
	mov	eax, DWORD PTR _ibp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 45					; 0000002dH
	jne	$L1091
$L1092:
; Line 1645
	mov	eax, DWORD PTR _ibp$[ebp]
	mov	al, BYTE PTR [eax]
	mov	ecx, DWORD PTR _obp$[ebp]
	mov	BYTE PTR [ecx], al
	inc	DWORD PTR _ibp$[ebp]
	inc	DWORD PTR _obp$[ebp]
; Line 1647
	cmp	DWORD PTR _traditional, 0
	je	$L1093
; Line 1648
	jmp	$L1087
; Line 1649
$L1093:
; Line 1650
$L1091:
; Line 1651
$L1089:
	jmp	$L1086
$L1087:
; Line 1652
	jmp	$L960
; Line 1656
$L1084:
$L1094:
; Line 1667
$letter$1082:
; Line 1668
	inc	DWORD PTR _ident_length$[ebp]
; Line 1670
	xor	eax, eax
	mov	al, BYTE PTR _c$[ebp]
	mov	ecx, DWORD PTR _hash$[ebp]
	lea	eax, DWORD PTR [eax+ecx*4]
	mov	DWORD PTR _hash$[ebp], eax
; Line 1671
	jmp	$L960
; Line 1673
$L1095:
; Line 1675
	mov	eax, DWORD PTR _ip$[ebp]
	cmp	DWORD PTR [eax+20], 0
	je	$L1096
; Line 1682
	mov	eax, DWORD PTR _ibp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 45					; 0000002dH
	jne	$L1097
; Line 1686
	cmp	DWORD PTR _concatenated$[ebp], 0
	jne	$L1098
; Line 1687
	mov	DWORD PTR _ident_length$[ebp], 0
; Line 1688
	mov	DWORD PTR _hash$[ebp], 0
; Line 1690
$L1098:
	inc	DWORD PTR _ibp$[ebp]
; Line 1691
	cmp	DWORD PTR _output_marks$[ebp], 0
	jne	$L1099
; Line 1692
	dec	DWORD PTR _obp$[ebp]
; Line 1693
	jmp	$L1100
$L1099:
; Line 1695
	mov	eax, DWORD PTR _obp$[ebp]
	mov	BYTE PTR [eax], 45			; 0000002dH
	inc	DWORD PTR _obp$[ebp]
; Line 1696
$L1100:
; Line 1697
	jmp	$L1101
$L1097:
	mov	eax, DWORD PTR _ibp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	al, BYTE PTR _is_space[eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L1102
; Line 1700
	cmp	DWORD PTR _ident_length$[ebp], 0
	jle	$L1103
; Line 1701
	jmp	$specialchar$967
; Line 1704
$L1103:
	cmp	DWORD PTR _output_marks$[ebp], 0
	jne	$L1104
; Line 1705
	mov	eax, DWORD PTR _ibp$[ebp]
	mov	al, BYTE PTR [eax]
	mov	ecx, DWORD PTR _obp$[ebp]
	mov	BYTE PTR [ecx-1], al
	inc	DWORD PTR _ibp$[ebp]
; Line 1707
	mov	eax, DWORD PTR _obp$[ebp]
	mov	al, BYTE PTR [eax-1]
	and	eax, 255				; 000000ffH
	cmp	eax, 10					; 0000000aH
	jne	$L1105
; Line 1708
	mov	eax, DWORD PTR _op$[ebp]
	inc	DWORD PTR [eax+4]
; Line 1709
$L1105:
	jmp	$L1106
$L1104:
; Line 1712
	mov	eax, DWORD PTR _ibp$[ebp]
	mov	al, BYTE PTR [eax]
	mov	ecx, DWORD PTR _obp$[ebp]
	mov	BYTE PTR [ecx], al
	inc	DWORD PTR _ibp$[ebp]
	inc	DWORD PTR _obp$[ebp]
; Line 1713
$L1106:
; Line 1714
	jmp	$L1107
$L1102:
	call	_abort
$L1107:
$L1101:
; Line 1715
	jmp	$L960
; Line 1719
$L1096:
	cmp	DWORD PTR _ident_length$[ebp], 0
	jle	$L1108
; Line 1720
	jmp	$specialchar$967
; Line 1722
$L1108:
	mov	eax, DWORD PTR _ibp$[ebp]
	mov	DWORD PTR _beg_of_line$[ebp], eax
; Line 1725
	mov	eax, DWORD PTR _ip$[ebp]
	inc	DWORD PTR [eax+4]
; Line 1726
	mov	eax, DWORD PTR _op$[ebp]
	inc	DWORD PTR [eax+4]
; Line 1727
	mov	eax, DWORD PTR _op$[ebp]
	mov	ecx, DWORD PTR _ip$[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	cmp	DWORD PTR [eax+4], ecx
	je	$L1109
; Line 1728
	mov	eax, DWORD PTR _obp$[ebp]
	mov	ecx, DWORD PTR _op$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 1729
	push	0
	push	1
	mov	eax, DWORD PTR _op$[ebp]
	push	eax
	mov	eax, DWORD PTR _ip$[ebp]
	push	eax
	call	_output_line_command
	add	esp, 16					; 00000010H
; Line 1730
	mov	eax, DWORD PTR _ip$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _ip$[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	mov	edx, DWORD PTR _ip$[ebp]
	sub	ecx, DWORD PTR [edx+12]
	sub	eax, ecx
	mov	ecx, DWORD PTR _op$[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	mov	edx, DWORD PTR _op$[ebp]
	mov	edx, DWORD PTR [edx+16]
	mov	ebx, DWORD PTR _op$[ebp]
	sub	edx, DWORD PTR [ebx+12]
	sub	ecx, edx
	cmp	eax, ecx
	jge	$L2881
	jmp	$L2882
$L2881:
	mov	eax, DWORD PTR _ip$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _ip$[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	mov	edx, DWORD PTR _ip$[ebp]
	sub	ecx, DWORD PTR [edx+12]
	sub	eax, ecx
	push	eax
	mov	eax, DWORD PTR _op$[ebp]
	push	eax
	call	_grow_outbuf
	add	esp, 8
$L2882:
; Line 1731
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _obp$[ebp], eax
; Line 1733
$L1109:
	jmp	$L960
; Line 1737
$L1110:
; Line 1738
	mov	eax, DWORD PTR _ibp$[ebp]
	cmp	DWORD PTR _limit$[ebp], eax
	jb	$L1111
; Line 1740
	jmp	$randomchar$970
; Line 1743
$L1111:
	mov	eax, DWORD PTR _ip$[ebp]
	cmp	DWORD PTR [eax+20], 0
	je	$L1112
; Line 1744
	dec	DWORD PTR _obp$[ebp]
; Line 1745
	dec	DWORD PTR _ibp$[ebp]
; Line 1749
	cmp	DWORD PTR _traditional, 0
	je	$L1113
	cmp	DWORD PTR _ident_length$[ebp], 0
	je	$L1113
	mov	eax, DWORD PTR _indepth
	dec	eax
	shl	eax, 5
	mov	eax, DWORD PTR _instack[eax+16]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	al, BYTE PTR _is_idchar[eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	jne	$L1113
; Line 1750
	mov	DWORD PTR _redo_char$[ebp], 1
; Line 1751
	jmp	$randomchar$970
; Line 1753
$L1113:
$L1114:
	mov	eax, DWORD PTR _ip$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR [eax+12], 23			; 00000017H
	mov	eax, DWORD PTR _ip$[ebp]
	cmp	DWORD PTR [eax+28], 0
	je	$L1117
	mov	eax, DWORD PTR _ip$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	call	_free
	add	esp, 4
$L1117:
	dec	DWORD PTR _indepth
$L1115:
$L1116:
; Line 1754
$L1118:
	mov	eax, DWORD PTR _indepth
	shl	eax, 5
	add	eax, OFFSET _instack
	mov	DWORD PTR _ip$[ebp], eax
	mov	eax, DWORD PTR _ip$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _ibp$[ebp], eax
	mov	eax, DWORD PTR _ip$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _ip$[ebp]
	add	eax, DWORD PTR [ecx+12]
	mov	DWORD PTR _limit$[ebp], eax
	mov	eax, DWORD PTR _obp$[ebp]
	mov	ecx, DWORD PTR _op$[ebp]
	mov	DWORD PTR [ecx+16], eax
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _op$[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	mov	edx, DWORD PTR _op$[ebp]
	sub	ecx, DWORD PTR [edx+12]
	sub	eax, ecx
	mov	ecx, DWORD PTR _limit$[ebp]
	sub	ecx, DWORD PTR _ibp$[ebp]
	cmp	eax, ecx
	jle	$L2883
	jmp	$L2884
$L2883:
	mov	eax, DWORD PTR _limit$[ebp]
	sub	eax, DWORD PTR _ibp$[ebp]
	push	eax
	mov	eax, DWORD PTR _op$[ebp]
	push	eax
	call	_grow_outbuf
	add	esp, 8
$L2884:
	mov	DWORD PTR _beg_of_line$[ebp], 0
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _obp$[ebp], eax
$L1119:
$L1120:
; Line 1755
	jmp	$L960
; Line 1760
$L1112:
	cmp	DWORD PTR _ident_length$[ebp], 0
	jne	$L1121
; Line 1761
	dec	DWORD PTR _obp$[ebp]
; Line 1762
	dec	DWORD PTR _ibp$[ebp]
; Line 1763
	mov	eax, DWORD PTR _obp$[ebp]
	mov	ecx, DWORD PTR _op$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 1764
	mov	eax, DWORD PTR _ibp$[ebp]
	mov	ecx, DWORD PTR _ip$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 1765
	jmp	$ending$1122
; Line 1774
$L1121:
$specialchar$967:
; Line 1781
	dec	DWORD PTR _ibp$[ebp]
; Line 1782
	dec	DWORD PTR _obp$[ebp]
; Line 1783
	mov	DWORD PTR _redo_char$[ebp], 1
; Line 1785
$L1123:
; Line 1787
$randomchar$970:
; Line 1789
	cmp	DWORD PTR _ident_length$[ebp], 0
	jle	$L1124
; Line 1809
	mov	eax, DWORD PTR _hash$[ebp]
	and	eax, 2147483647				; 7fffffffH
	mov	ecx, 1403				; 0000057bH
	sub	edx, edx
	div	ecx
	mov	eax, DWORD PTR _hashtab[edx*4]
	mov	DWORD PTR _hp$1125[ebp], eax
	jmp	$L1126
$L1127:
	mov	eax, DWORD PTR _hp$1125[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _hp$1125[ebp], eax
$L1126:
	cmp	DWORD PTR _hp$1125[ebp], 0
	je	$L1128
; Line 1811
	mov	eax, DWORD PTR _hp$1125[ebp]
	mov	ecx, DWORD PTR _ident_length$[ebp]
	cmp	DWORD PTR [eax+16], ecx
	jne	$L1129
; Line 1814
	mov	eax, DWORD PTR _ident_length$[ebp]
	mov	DWORD PTR _i$1132[ebp], eax
; Line 1815
	mov	eax, DWORD PTR _hp$1125[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _p$1133[ebp], eax
; Line 1816
	mov	eax, DWORD PTR _obp$[ebp]
	sub	eax, DWORD PTR _i$1132[ebp]
	mov	DWORD PTR _q$1134[ebp], eax
; Line 1819
	cmp	DWORD PTR _redo_char$[ebp], 0
	jne	$L1136
; Line 1820
	dec	DWORD PTR _q$1134[ebp]
; Line 1822
$L1136:
$L1137:
; Line 1823
	mov	eax, DWORD PTR _p$1133[ebp]
	mov	DWORD PTR -112+[ebp], eax
	inc	DWORD PTR _p$1133[ebp]
	mov	eax, DWORD PTR _q$1134[ebp]
	mov	DWORD PTR -116+[ebp], eax
	inc	DWORD PTR _q$1134[ebp]
	mov	eax, DWORD PTR -112+[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR -116+[ebp]
	mov	cl, BYTE PTR [ecx]
	and	ecx, 255				; 000000ffH
	cmp	eax, ecx
	je	$L1140
; Line 1824
	jmp	$hashcollision$1141
; Line 1825
$L1140:
$L1138:
	dec	DWORD PTR _i$1132[ebp]
	jne	$L1137
$L1139:
; Line 1831
	cmp	DWORD PTR _redo_char$[ebp], 0
	jne	$L1142
; Line 1832
	dec	DWORD PTR _ibp$[ebp]
; Line 1833
	dec	DWORD PTR _obp$[ebp]
; Line 1836
$L1142:
	mov	eax, DWORD PTR _obp$[ebp]
	sub	eax, DWORD PTR _ident_length$[ebp]
	mov	DWORD PTR _obufp_before_macroname$1130[ebp], eax
; Line 1837
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _op_lineno_before_macroname$1131[ebp], eax
; Line 1840
	mov	eax, DWORD PTR _hp$1125[ebp]
	mov	eax, DWORD PTR [eax+12]
	sub	eax, 24					; 00000018H
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	mov	DWORD PTR _disabled$1135[ebp], eax
; Line 1845
	cmp	DWORD PTR _disabled$1135[ebp], 0
	je	$L1143
; Line 1854
	cmp	DWORD PTR _output_marks$[ebp], 0
	je	$L1144
; Line 1855
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _op$[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	mov	edx, DWORD PTR _op$[ebp]
	sub	ecx, DWORD PTR [edx+12]
	sub	eax, ecx
	mov	ecx, DWORD PTR _limit$[ebp]
	sub	ecx, DWORD PTR _ibp$[ebp]
	add	ecx, 2
	cmp	eax, ecx
	jle	$L2885
	jmp	$L2886
$L2885:
	mov	eax, DWORD PTR _limit$[ebp]
	sub	eax, DWORD PTR _ibp$[ebp]
	add	eax, 2
	push	eax
	mov	eax, DWORD PTR _op$[ebp]
	push	eax
	call	_grow_outbuf
	add	esp, 8
$L2886:
; Line 1856
	mov	eax, DWORD PTR _obp$[ebp]
	mov	BYTE PTR [eax], 10			; 0000000aH
	inc	DWORD PTR _obp$[ebp]
; Line 1857
	mov	eax, DWORD PTR _obp$[ebp]
	mov	BYTE PTR [eax], 45			; 0000002dH
	inc	DWORD PTR _obp$[ebp]
; Line 1859
$L1144:
	jmp	$L1128
; Line 1866
$L1143:
; Line 1867
	mov	eax, DWORD PTR _hp$1125[ebp]
	cmp	DWORD PTR [eax+12], 23			; 00000017H
	je	$L1146
	mov	eax, DWORD PTR _hp$1125[ebp]
	cmp	DWORD PTR [eax+12], 24			; 00000018H
	jne	$L1145
$L1146:
	mov	eax, DWORD PTR _hp$1125[ebp]
	mov	eax, DWORD PTR [eax+24]
	cmp	DWORD PTR [eax], 0
	jl	$L1145
; Line 1869
$L1148:
; Line 1871
	mov	eax, DWORD PTR _ibp$[ebp]
	cmp	DWORD PTR _limit$[ebp], eax
	jne	$L1150
	mov	eax, DWORD PTR _ip$[ebp]
	cmp	DWORD PTR [eax+20], 0
	je	$L1150
; Line 1872
$L1151:
	mov	eax, DWORD PTR _ip$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR [eax+12], 23			; 00000017H
	mov	eax, DWORD PTR _ip$[ebp]
	cmp	DWORD PTR [eax+28], 0
	je	$L1154
	mov	eax, DWORD PTR _ip$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	call	_free
	add	esp, 4
$L1154:
	dec	DWORD PTR _indepth
$L1152:
$L1153:
; Line 1873
$L1155:
	mov	eax, DWORD PTR _indepth
	shl	eax, 5
	add	eax, OFFSET _instack
	mov	DWORD PTR _ip$[ebp], eax
	mov	eax, DWORD PTR _ip$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _ibp$[ebp], eax
	mov	eax, DWORD PTR _ip$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _ip$[ebp]
	add	eax, DWORD PTR [ecx+12]
	mov	DWORD PTR _limit$[ebp], eax
	mov	eax, DWORD PTR _obp$[ebp]
	mov	ecx, DWORD PTR _op$[ebp]
	mov	DWORD PTR [ecx+16], eax
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _op$[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	mov	edx, DWORD PTR _op$[ebp]
	sub	ecx, DWORD PTR [edx+12]
	sub	eax, ecx
	mov	ecx, DWORD PTR _limit$[ebp]
	sub	ecx, DWORD PTR _ibp$[ebp]
	cmp	eax, ecx
	jle	$L2887
	jmp	$L2888
$L2887:
	mov	eax, DWORD PTR _limit$[ebp]
	sub	eax, DWORD PTR _ibp$[ebp]
	push	eax
	mov	eax, DWORD PTR _op$[ebp]
	push	eax
	call	_grow_outbuf
	add	esp, 8
$L2888:
	mov	DWORD PTR _beg_of_line$[ebp], 0
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _obp$[ebp], eax
$L1156:
$L1157:
; Line 1876
	jmp	$L1158
$L1150:
	mov	eax, DWORD PTR _ibp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 47					; 0000002fH
	jne	$L1159
	mov	eax, DWORD PTR _ibp$[ebp]
	inc	eax
	cmp	eax, DWORD PTR _limit$[ebp]
	je	$L1159
	mov	eax, DWORD PTR _ibp$[ebp]
	mov	al, BYTE PTR [eax+1]
	and	eax, 255				; 000000ffH
	cmp	eax, 42					; 0000002aH
	jne	$L1159
; Line 1877
	cmp	DWORD PTR _put_out_comments, 0
	je	$L1160
; Line 1878
	mov	eax, DWORD PTR _obp$[ebp]
	mov	BYTE PTR [eax], 47			; 0000002fH
	inc	DWORD PTR _obp$[ebp]
; Line 1879
	mov	eax, DWORD PTR _obp$[ebp]
	mov	BYTE PTR [eax], 42			; 0000002aH
	inc	DWORD PTR _obp$[ebp]
; Line 1880
	jmp	$L1161
$L1160:
	cmp	DWORD PTR _traditional, 0
	jne	$L1162
; Line 1881
	mov	eax, DWORD PTR _obp$[ebp]
	mov	BYTE PTR [eax], 32			; 00000020H
	inc	DWORD PTR _obp$[ebp]
; Line 1883
$L1162:
$L1161:
	add	DWORD PTR _ibp$[ebp], 2
; Line 1885
$L1164:
	mov	eax, DWORD PTR _ibp$[ebp]
	inc	eax
	cmp	eax, DWORD PTR _limit$[ebp]
	je	$L1165
	mov	eax, DWORD PTR _ibp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 42					; 0000002aH
	jne	$L1166
	mov	eax, DWORD PTR _ibp$[ebp]
	mov	al, BYTE PTR [eax+1]
	and	eax, 255				; 000000ffH
	cmp	eax, 47					; 0000002fH
	je	$L1165
$L1166:
; Line 1888
	mov	eax, DWORD PTR _ibp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 10					; 0000000aH
	jne	$L1167
; Line 1890
	mov	eax, DWORD PTR _ip$[ebp]
	inc	DWORD PTR [eax+4]
; Line 1891
	mov	eax, DWORD PTR _op$[ebp]
	inc	DWORD PTR [eax+4]
; Line 1893
$L1167:
	cmp	DWORD PTR _put_out_comments, 0
	je	$L1168
; Line 1894
	mov	eax, DWORD PTR _ibp$[ebp]
	mov	al, BYTE PTR [eax]
	mov	ecx, DWORD PTR _obp$[ebp]
	mov	BYTE PTR [ecx], al
	inc	DWORD PTR _ibp$[ebp]
	inc	DWORD PTR _obp$[ebp]
; Line 1895
	jmp	$L1169
$L1168:
; Line 1896
	inc	DWORD PTR _ibp$[ebp]
$L1169:
; Line 1897
	jmp	$L1164
$L1165:
; Line 1898
	add	DWORD PTR _ibp$[ebp], 2
; Line 1899
	cmp	DWORD PTR _put_out_comments, 0
	je	$L1170
; Line 1900
	mov	eax, DWORD PTR _obp$[ebp]
	mov	BYTE PTR [eax], 42			; 0000002aH
	inc	DWORD PTR _obp$[ebp]
; Line 1901
	mov	eax, DWORD PTR _obp$[ebp]
	mov	BYTE PTR [eax], 47			; 0000002fH
	inc	DWORD PTR _obp$[ebp]
; Line 1903
$L1170:
; Line 1904
	jmp	$L1171
$L1159:
	mov	eax, DWORD PTR _ibp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	al, BYTE PTR _is_space[eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L1172
; Line 1905
	mov	eax, DWORD PTR _ibp$[ebp]
	mov	al, BYTE PTR [eax]
	mov	ecx, DWORD PTR _obp$[ebp]
	mov	BYTE PTR [ecx], al
	inc	DWORD PTR _ibp$[ebp]
	inc	DWORD PTR _obp$[ebp]
; Line 1906
	mov	eax, DWORD PTR _ibp$[ebp]
	mov	al, BYTE PTR [eax-1]
	and	eax, 255				; 000000ffH
	cmp	eax, 10					; 0000000aH
	jne	$L1173
; Line 1907
	mov	eax, DWORD PTR _ip$[ebp]
	cmp	DWORD PTR [eax+20], 0
	jne	$L1174
; Line 1909
	mov	eax, DWORD PTR _ip$[ebp]
	inc	DWORD PTR [eax+4]
; Line 1910
	mov	eax, DWORD PTR _op$[ebp]
	inc	DWORD PTR [eax+4]
; Line 1911
	jmp	$L1175
$L1174:
	cmp	DWORD PTR _output_marks$[ebp], 0
	jne	$L1176
; Line 1916
	dec	DWORD PTR _obp$[ebp]
; Line 1917
	mov	eax, DWORD PTR _ibp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 45					; 0000002dH
	jne	$L1177
; Line 1918
	inc	DWORD PTR _ibp$[ebp]
; Line 1919
	jmp	$L1178
$L1177:
; Line 1920
	mov	eax, DWORD PTR _ibp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 10					; 0000000aH
	jne	$L1179
; Line 1921
	mov	eax, DWORD PTR _op$[ebp]
	inc	DWORD PTR [eax+4]
; Line 1922
$L1179:
	mov	eax, DWORD PTR _ibp$[ebp]
	mov	al, BYTE PTR [eax]
	mov	ecx, DWORD PTR _obp$[ebp]
	mov	BYTE PTR [ecx], al
	inc	DWORD PTR _ibp$[ebp]
	inc	DWORD PTR _obp$[ebp]
; Line 1923
$L1178:
; Line 1924
	jmp	$L1180
$L1176:
; Line 1926
	mov	eax, DWORD PTR _ibp$[ebp]
	mov	al, BYTE PTR [eax]
	mov	ecx, DWORD PTR _obp$[ebp]
	mov	BYTE PTR [ecx], al
	inc	DWORD PTR _ibp$[ebp]
	inc	DWORD PTR _obp$[ebp]
; Line 1927
$L1180:
$L1175:
; Line 1929
$L1173:
; Line 1930
	jmp	$L1181
$L1172:
	jmp	$L1149
$L1181:
$L1171:
$L1158:
; Line 1931
	jmp	$L1148
$L1149:
; Line 1932
	mov	eax, DWORD PTR _ibp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 40					; 00000028H
	je	$L1182
; Line 1933
	jmp	$L1128
; Line 1934
$L1182:
; Line 1939
$L1145:
	mov	eax, DWORD PTR _obufp_before_macroname$1130[ebp]
	mov	DWORD PTR _obp$[ebp], eax
; Line 1940
	mov	eax, DWORD PTR _op_lineno_before_macroname$1131[ebp]
	mov	ecx, DWORD PTR _op$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 1944
	mov	eax, DWORD PTR _ibp$[ebp]
	mov	ecx, DWORD PTR _ip$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 1945
	mov	eax, DWORD PTR _obp$[ebp]
	mov	ecx, DWORD PTR _op$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 1946
	mov	eax, DWORD PTR _op$[ebp]
	push	eax
	mov	eax, DWORD PTR _hp$1125[ebp]
	push	eax
	call	_macroexpand
	add	esp, 8
; Line 1950
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _obp$[ebp], eax
; Line 1951
$L1183:
	mov	eax, DWORD PTR _indepth
	shl	eax, 5
	add	eax, OFFSET _instack
	mov	DWORD PTR _ip$[ebp], eax
	mov	eax, DWORD PTR _ip$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _ibp$[ebp], eax
	mov	eax, DWORD PTR _ip$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _ip$[ebp]
	add	eax, DWORD PTR [ecx+12]
	mov	DWORD PTR _limit$[ebp], eax
	mov	eax, DWORD PTR _obp$[ebp]
	mov	ecx, DWORD PTR _op$[ebp]
	mov	DWORD PTR [ecx+16], eax
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _op$[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	mov	edx, DWORD PTR _op$[ebp]
	sub	ecx, DWORD PTR [edx+12]
	sub	eax, ecx
	mov	ecx, DWORD PTR _limit$[ebp]
	sub	ecx, DWORD PTR _ibp$[ebp]
	cmp	eax, ecx
	jle	$L2889
	jmp	$L2890
$L2889:
	mov	eax, DWORD PTR _limit$[ebp]
	sub	eax, DWORD PTR _ibp$[ebp]
	push	eax
	mov	eax, DWORD PTR _op$[ebp]
	push	eax
	call	_grow_outbuf
	add	esp, 8
$L2890:
	mov	DWORD PTR _beg_of_line$[ebp], 0
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _obp$[ebp], eax
$L1184:
$L1185:
; Line 1952
	jmp	$L1128
; Line 1954
$L1129:
$hashcollision$1141:
; Line 1956
	jmp	$L1127
$L1128:
; Line 1957
	mov	DWORD PTR _hash$[ebp], 0
	mov	eax, DWORD PTR _hash$[ebp]
	mov	DWORD PTR _ident_length$[ebp], eax
; Line 1958
	mov	DWORD PTR _redo_char$[ebp], 0
; Line 1959
	mov	DWORD PTR _concatenated$[ebp], 0
; Line 1961
$L1124:
	jmp	$L960
$L959:
	cmp	DWORD PTR -120+[ebp], 47		; 0000002fH
	jg	$L2891
	je	$L1040
	cmp	DWORD PTR -120+[ebp], 35		; 00000023H
	jg	$L2892
	je	$L968
	cmp	DWORD PTR -120+[ebp], 0
	je	$L1110
	cmp	DWORD PTR -120+[ebp], 10		; 0000000aH
	je	$L1095
	cmp	DWORD PTR -120+[ebp], 34		; 00000022H
	je	$L1002
	jmp	$L1123
$L2892:
	cmp	DWORD PTR -120+[ebp], 36		; 00000024H
	je	$L1080
	cmp	DWORD PTR -120+[ebp], 39		; 00000027H
	je	$L1002
	jmp	$L1123
$L2891:
	cmp	DWORD PTR -120+[ebp], 92		; 0000005cH
	jg	$L2893
	je	$L963
	cmp	DWORD PTR -120+[ebp], 48		; 00000030H
	jl	$L1123
	cmp	DWORD PTR -120+[ebp], 57		; 00000039H
	jle	$L1083
	cmp	DWORD PTR -120+[ebp], 65		; 00000041H
	jl	$L1123
	cmp	DWORD PTR -120+[ebp], 90		; 0000005aH
	jle	$L1094
	jmp	$L1123
$L2893:
	cmp	DWORD PTR -120+[ebp], 95		; 0000005fH
	je	$L1094
	cmp	DWORD PTR -120+[ebp], 97		; 00000061H
	jl	$L1123
	cmp	DWORD PTR -120+[ebp], 122		; 0000007aH
	jle	$L1094
	jmp	$L1123
$L960:
; Line 1962
	jmp	$L957
$L958:
; Line 1966
$ending$1122:
; Line 1967
	mov	eax, DWORD PTR _ip$[ebp]
	mov	ecx, DWORD PTR _if_stack
	cmp	DWORD PTR [eax+24], ecx
	je	$L1186
; Line 1969
	mov	eax, DWORD PTR _if_stack
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR -132+[ebp], eax
	jmp	$L1188
; Line 1970
$L1192:
; Line 1971
	mov	DWORD PTR _str$1187[ebp], OFFSET $SG1193
; Line 1972
	jmp	$L1189
; Line 1973
$L1194:
; Line 1974
	mov	DWORD PTR _str$1187[ebp], OFFSET $SG1195
; Line 1975
	jmp	$L1189
; Line 1976
$L1196:
; Line 1977
	mov	DWORD PTR _str$1187[ebp], OFFSET $SG1197
; Line 1978
	jmp	$L1189
; Line 1979
$L1198:
; Line 1980
	mov	DWORD PTR _str$1187[ebp], OFFSET $SG1199
; Line 1981
	jmp	$L1189
; Line 1982
$L1200:
; Line 1983
	mov	DWORD PTR _str$1187[ebp], OFFSET $SG1201
; Line 1984
	jmp	$L1189
; Line 1985
	jmp	$L1189
$L1188:
	cmp	DWORD PTR -132+[ebp], 3
	je	$L1194
	cmp	DWORD PTR -132+[ebp], 4
	je	$L1196
	cmp	DWORD PTR -132+[ebp], 5
	je	$L1192
	cmp	DWORD PTR -132+[ebp], 6
	je	$L1198
	cmp	DWORD PTR -132+[ebp], 8
	je	$L1200
	jmp	$L1189
$L1189:
; Line 1987
	mov	eax, DWORD PTR _str$1187[ebp]
	push	eax
	push	OFFSET $SG1202
	mov	eax, DWORD PTR _if_stack
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_line_for_error
	add	esp, 4
	push	eax
	call	_error_with_line
	add	esp, 12					; 0000000cH
; Line 1989
$L1186:
	mov	eax, DWORD PTR _ip$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _if_stack, eax
; Line 1990
$L939:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_rescan	ENDP
_TEXT	ENDS
PUBLIC	_expand_to_temp_buffer
_DATA	SEGMENT
	ORG $+3
$SG1219	DB	'macro or #include recursion too deep', 00H
_DATA	ENDS
_TEXT	SEGMENT
$T2894 = 8
_buf$ = 12
_limit$ = 16
_output_marks$ = 20
_ip$ = -48
_obuf$ = -32
_length$ = -40
_buf1$ = -44
_odepth$ = -36
_p1$1213 = -56
_p2$1214 = -52
_expand_to_temp_buffer PROC NEAR
; Line 2005
	push	ebp
	mov	ebp, esp
	sub	esp, 56					; 00000038H
	push	ebx
	push	esi
	push	edi
; Line 2008
	mov	eax, DWORD PTR _limit$[ebp]
	sub	eax, DWORD PTR _buf$[ebp]
	mov	DWORD PTR _length$[ebp], eax
; Line 2010
	mov	eax, DWORD PTR _indepth
	mov	DWORD PTR _odepth$[ebp], eax
; Line 2012
	cmp	DWORD PTR _length$[ebp], 0
	jge	$L1212
; Line 2013
	call	_abort
; Line 2017
$L1212:
	mov	eax, DWORD PTR _length$[ebp]
	inc	eax
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _buf1$[ebp], eax
; Line 2019
	mov	eax, DWORD PTR _buf$[ebp]
	mov	DWORD PTR _p1$1213[ebp], eax
; Line 2020
	mov	eax, DWORD PTR _buf1$[ebp]
	mov	DWORD PTR _p2$1214[ebp], eax
; Line 2022
$L1216:
	mov	eax, DWORD PTR _p1$1213[ebp]
	cmp	DWORD PTR _limit$[ebp], eax
	je	$L1217
; Line 2023
	mov	eax, DWORD PTR _p1$1213[ebp]
	mov	al, BYTE PTR [eax]
	mov	ecx, DWORD PTR _p2$1214[ebp]
	mov	BYTE PTR [ecx], al
	inc	DWORD PTR _p1$1213[ebp]
	inc	DWORD PTR _p2$1214[ebp]
	jmp	$L1216
$L1217:
; Line 2025
	mov	eax, DWORD PTR _length$[ebp]
	mov	ecx, DWORD PTR _buf1$[ebp]
	mov	BYTE PTR [eax+ecx], 0
; Line 2029
	mov	eax, DWORD PTR _length$[ebp]
	add	eax, eax
	add	eax, 100				; 00000064H
	mov	DWORD PTR _obuf$[ebp+8], eax
; Line 2030
	mov	eax, DWORD PTR _obuf$[ebp+8]
	push	eax
	call	_xmalloc
	add	esp, 4
	mov	DWORD PTR _obuf$[ebp+12], eax
	mov	eax, DWORD PTR _obuf$[ebp+12]
	mov	DWORD PTR _obuf$[ebp+16], eax
; Line 2031
	mov	DWORD PTR _obuf$[ebp], 0
; Line 2032
	mov	DWORD PTR _obuf$[ebp+20], 0
; Line 2033
	mov	DWORD PTR _obuf$[ebp+28], 0
; Line 2035
	cmp	DWORD PTR _indepth, 199			; 000000c7H
	jl	$L1218
	push	OFFSET $SG1219
	mov	eax, DWORD PTR _indepth
	shl	eax, 5
	mov	eax, DWORD PTR _instack[eax+4]
	push	eax
	call	_line_for_error
	add	esp, 4
	push	eax
	call	_error_with_line
	add	esp, 8
	lea	esi, DWORD PTR _obuf$[ebp]
	mov	edi, DWORD PTR $T2894[ebp]
	mov	ecx, 8
	rep	movsd
	mov	eax, DWORD PTR $T2894[ebp]
	jmp	$L1206
$L1218:
; Line 2037
	inc	DWORD PTR _indepth
; Line 2039
	mov	eax, DWORD PTR _indepth
	shl	eax, 5
	add	eax, OFFSET _instack
	mov	DWORD PTR _ip$[ebp], eax
; Line 2040
	mov	eax, DWORD PTR _ip$[ebp]
	mov	DWORD PTR [eax], 0
; Line 2041
	mov	eax, DWORD PTR _ip$[ebp]
	mov	DWORD PTR [eax+20], 0
; Line 2042
	mov	eax, DWORD PTR _ip$[ebp]
	mov	DWORD PTR [eax+28], 0
; Line 2043
	mov	eax, DWORD PTR _length$[ebp]
	mov	ecx, DWORD PTR _ip$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 2044
	mov	eax, DWORD PTR _buf1$[ebp]
	mov	ecx, DWORD PTR _ip$[ebp]
	mov	DWORD PTR [ecx+16], eax
	mov	eax, DWORD PTR _ip$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _ip$[ebp]
	mov	DWORD PTR [ecx+12], eax
; Line 2045
	mov	eax, DWORD PTR _if_stack
	mov	ecx, DWORD PTR _ip$[ebp]
	mov	DWORD PTR [ecx+24], eax
; Line 2047
	mov	DWORD PTR _obuf$[ebp+4], 1
	mov	eax, DWORD PTR _obuf$[ebp+4]
	mov	ecx, DWORD PTR _ip$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 2051
	mov	eax, DWORD PTR _output_marks$[ebp]
	push	eax
	lea	eax, DWORD PTR _obuf$[ebp]
	push	eax
	call	_rescan
	add	esp, 8
; Line 2054
	dec	DWORD PTR _indepth
; Line 2056
	mov	eax, DWORD PTR _indepth
	cmp	DWORD PTR _odepth$[ebp], eax
	je	$L1220
; Line 2057
	call	_abort
; Line 2060
$L1220:
	mov	eax, DWORD PTR _obuf$[ebp+16]
	sub	eax, DWORD PTR _obuf$[ebp+12]
	mov	DWORD PTR _obuf$[ebp+8], eax
; Line 2062
	lea	esi, DWORD PTR _obuf$[ebp]
	mov	edi, DWORD PTR $T2894[ebp]
	mov	ecx, 8
	rep	movsd
	mov	eax, DWORD PTR $T2894[ebp]
	jmp	$L1206
; Line 2063
$L1206:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_expand_to_temp_buffer ENDP
_TEXT	ENDS
PUBLIC	_skip_to_end_of_comment
PUBLIC	_skip_quoted_string
EXTRN	_strncmp:NEAR
_TEXT	SEGMENT
_obp$1283 = -56
_ip$ = 8
_op$ = 12
_bp$ = -32
_xp$1289 = -60
_cp$ = -28
_kt$ = -4
_ident_length$ = -8
_resume_p$ = -24
_c$1293 = -64
_copy_command$ = -16
_ident$ = -20
_after_ident$ = -12
_buf$1255 = -44
_limit$1256 = -48
_unterminated$1257 = -36
_keep_comments$1258 = -40
_bp1$1325 = -68
_c$1262 = -52
_len$1341 = -72
_handle_directive PROC NEAR
; Line 2082
	push	ebp
	mov	ebp, esp
	sub	esp, 80					; 00000050H
	push	ebx
	push	esi
	push	edi
; Line 2090
	mov	DWORD PTR _copy_command$[ebp], 0
; Line 2094
	mov	eax, DWORD PTR _ip$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _bp$[ebp], eax
; Line 2096
$L1233:
; Line 2097
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	al, BYTE PTR _is_hor_space[eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L1235
; Line 2098
	inc	DWORD PTR _bp$[ebp]
; Line 2099
	jmp	$L1236
$L1235:
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 47					; 0000002fH
	jne	$L1237
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax+1]
	and	eax, 255				; 000000ffH
	cmp	eax, 42					; 0000002aH
	jne	$L1237
; Line 2100
	mov	eax, DWORD PTR _bp$[ebp]
	mov	ecx, DWORD PTR _ip$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 2101
	mov	eax, DWORD PTR _ip$[ebp]
	add	eax, 4
	push	eax
	mov	eax, DWORD PTR _ip$[ebp]
	push	eax
	call	_skip_to_end_of_comment
	add	esp, 8
; Line 2102
	mov	eax, DWORD PTR _ip$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _bp$[ebp], eax
; Line 2103
	jmp	$L1238
$L1237:
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 92					; 0000005cH
	jne	$L1239
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax+1]
	and	eax, 255				; 000000ffH
	cmp	eax, 10					; 0000000aH
	jne	$L1239
; Line 2104
	add	DWORD PTR _bp$[ebp], 2
	mov	eax, DWORD PTR _ip$[ebp]
	inc	DWORD PTR [eax+4]
; Line 2105
	jmp	$L1240
$L1239:
	jmp	$L1234
$L1240:
$L1238:
$L1236:
; Line 2106
	jmp	$L1233
$L1234:
; Line 2112
	mov	eax, DWORD PTR _bp$[ebp]
	mov	DWORD PTR _cp$[ebp], eax
; Line 2113
$L1242:
; Line 2114
	mov	eax, DWORD PTR _cp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	al, BYTE PTR _is_idchar[eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L1244
; Line 2115
	inc	DWORD PTR _cp$[ebp]
; Line 2116
	jmp	$L1245
$L1244:
; Line 2117
	mov	eax, DWORD PTR _cp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 92					; 0000005cH
	jne	$L1246
	mov	eax, DWORD PTR _cp$[ebp]
	mov	al, BYTE PTR [eax+1]
	and	eax, 255				; 000000ffH
	cmp	eax, 10					; 0000000aH
	jne	$L1246
; Line 2118
	mov	eax, DWORD PTR _cp$[ebp]
	push	eax
	call	_name_newline_fix
	add	esp, 4
; Line 2119
$L1246:
	mov	eax, DWORD PTR _cp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	al, BYTE PTR _is_idchar[eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L1247
; Line 2120
	inc	DWORD PTR _cp$[ebp]
; Line 2121
	jmp	$L1248
$L1247:
	jmp	$L1243
$L1248:
; Line 2122
$L1245:
; Line 2123
	jmp	$L1242
$L1243:
; Line 2124
	mov	eax, DWORD PTR _cp$[ebp]
	sub	eax, DWORD PTR _bp$[ebp]
	mov	DWORD PTR _ident_length$[ebp], eax
; Line 2125
	mov	eax, DWORD PTR _bp$[ebp]
	mov	DWORD PTR _ident$[ebp], eax
; Line 2126
	mov	eax, DWORD PTR _cp$[ebp]
	mov	DWORD PTR _after_ident$[ebp], eax
; Line 2130
	cmp	DWORD PTR _traditional, 0
	je	$L1249
	cmp	DWORD PTR _ident_length$[ebp], 0
	jne	$L1249
	mov	eax, DWORD PTR _after_ident$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 10					; 0000000aH
	jne	$L1249
; Line 2131
	mov	eax, DWORD PTR _after_ident$[ebp]
	mov	ecx, DWORD PTR _ip$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 2132
	mov	eax, 1
	jmp	$L1223
; Line 2139
$L1249:
	mov	DWORD PTR _kt$[ebp], OFFSET _directive_table
	jmp	$L1250
$L1251:
	add	DWORD PTR _kt$[ebp], 20			; 00000014H
$L1250:
	mov	eax, DWORD PTR _kt$[ebp]
	cmp	DWORD PTR [eax], 0
	jle	$L1252
; Line 2140
	mov	eax, DWORD PTR _kt$[ebp]
	mov	ecx, DWORD PTR _ident_length$[ebp]
	cmp	DWORD PTR [eax], ecx
	jne	$L1254
	mov	eax, DWORD PTR _ident_length$[ebp]
	push	eax
	mov	eax, DWORD PTR _ident$[ebp]
	push	eax
	mov	eax, DWORD PTR _kt$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_strncmp
	add	esp, 12					; 0000000cH
	or	eax, eax
	jne	$L1254
; Line 2142
	mov	eax, DWORD PTR _ip$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _ip$[ebp]
	add	eax, DWORD PTR [ecx+12]
	mov	DWORD PTR _limit$1256[ebp], eax
; Line 2143
	mov	DWORD PTR _unterminated$1257[ebp], 0
; Line 2147
	cmp	DWORD PTR _traditional, 0
	je	$L2895
	mov	eax, DWORD PTR _kt$[ebp]
	movsx	eax, BYTE PTR [eax+17]
	or	eax, eax
	je	$L2895
	mov	DWORD PTR _keep_comments$1258[ebp], 1
	jmp	$L2896
$L2895:
	mov	DWORD PTR _keep_comments$1258[ebp], 0
$L2896:
; Line 2154
	mov	eax, DWORD PTR _after_ident$[ebp]
	mov	DWORD PTR _bp$[ebp], eax
	mov	eax, DWORD PTR _bp$[ebp]
	mov	DWORD PTR _buf$1255[ebp], eax
; Line 2155
$L1260:
	mov	eax, DWORD PTR _limit$1256[ebp]
	cmp	DWORD PTR _bp$[ebp], eax
	jae	$L1261
; Line 2156
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax]
	mov	BYTE PTR _c$1262[ebp], al
	inc	DWORD PTR _bp$[ebp]
; Line 2157
	xor	eax, eax
	mov	al, BYTE PTR _c$1262[ebp]
	mov	DWORD PTR -76+[ebp], eax
	jmp	$L1263
; Line 2158
$L1267:
; Line 2159
	mov	eax, DWORD PTR _limit$1256[ebp]
	cmp	DWORD PTR _bp$[ebp], eax
	jae	$L1268
; Line 2160
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 10					; 0000000aH
	jne	$L1269
; Line 2161
	mov	eax, DWORD PTR _ip$[ebp]
	inc	DWORD PTR [eax+4]
; Line 2162
	mov	DWORD PTR _copy_command$[ebp], 1
; Line 2164
$L1269:
	inc	DWORD PTR _bp$[ebp]
; Line 2166
$L1268:
	jmp	$L1264
; Line 2168
$L1270:
; Line 2170
	lea	eax, DWORD PTR _unterminated$1257[ebp]
	push	eax
	lea	eax, DWORD PTR _copy_command$[ebp]
	push	eax
	mov	eax, DWORD PTR _ip$[ebp]
	add	eax, 4
	push	eax
	mov	eax, DWORD PTR _ip$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _limit$1256[ebp]
	push	eax
	mov	eax, DWORD PTR _bp$[ebp]
	dec	eax
	push	eax
	call	_skip_quoted_string
	add	esp, 24					; 00000018H
	mov	DWORD PTR _bp$[ebp], eax
; Line 2174
	cmp	DWORD PTR _unterminated$1257[ebp], 0
	je	$L1271
; Line 2175
	cmp	DWORD PTR _traditional, 0
	je	$L1272
; Line 2177
	mov	eax, DWORD PTR _bp$[ebp]
	mov	ecx, DWORD PTR _ip$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 2178
	jmp	$endloop1$1273
; Line 2180
$L1272:
	mov	eax, DWORD PTR _bp$[ebp]
	mov	ecx, DWORD PTR _ip$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 2181
	mov	eax, 1
	jmp	$L1223
; Line 2183
$L1271:
	jmp	$L1264
; Line 2186
$L1274:
; Line 2187
	mov	eax, DWORD PTR _kt$[ebp]
	movsx	eax, BYTE PTR [eax+16]
	or	eax, eax
	jne	$L1275
; Line 2188
	jmp	$L1264
; Line 2189
$L1275:
$L1277:
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L1278
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 62					; 0000003eH
	je	$L1278
	inc	DWORD PTR _bp$[ebp]
	jmp	$L1277
$L1278:
; Line 2190
	jmp	$L1264
; Line 2192
$L1279:
; Line 2193
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 92					; 0000005cH
	jne	$L1280
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax+1]
	and	eax, 255				; 000000ffH
	cmp	eax, 10					; 0000000aH
	jne	$L1280
; Line 2194
	mov	eax, DWORD PTR _bp$[ebp]
	push	eax
	call	_newline_fix
	add	esp, 4
; Line 2195
$L1280:
; Line 2196
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 42					; 0000002aH
	je	$L1282
	cmp	DWORD PTR _cplusplus, 0
	je	$L1281
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 47					; 0000002fH
	jne	$L1281
$L1282:
; Line 2197
	mov	eax, DWORD PTR _bp$[ebp]
	dec	eax
	mov	DWORD PTR _obp$1283[ebp], eax
; Line 2198
	mov	eax, DWORD PTR _bp$[ebp]
	inc	eax
	mov	ecx, DWORD PTR _ip$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 2199
	mov	eax, DWORD PTR _ip$[ebp]
	add	eax, 4
	push	eax
	mov	eax, DWORD PTR _ip$[ebp]
	push	eax
	call	_skip_to_end_of_comment
	add	esp, 8
; Line 2200
	mov	eax, DWORD PTR _ip$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _bp$[ebp], eax
; Line 2203
	mov	eax, DWORD PTR _limit$1256[ebp]
	cmp	DWORD PTR _bp$[ebp], eax
	je	$L1285
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 10					; 0000000aH
	jne	$L1284
$L1285:
; Line 2204
	mov	eax, DWORD PTR _obp$1283[ebp]
	mov	DWORD PTR _bp$[ebp], eax
; Line 2205
	jmp	$endloop1$1273
; Line 2208
$L1284:
	cmp	DWORD PTR _keep_comments$1258[ebp], 0
	jne	$L1286
; Line 2209
	inc	DWORD PTR _copy_command$[ebp]
; Line 2210
$L1286:
; Line 2211
$L1281:
	jmp	$L1264
; Line 2213
$L1287:
; Line 2214
	dec	DWORD PTR _bp$[ebp]
; Line 2215
	mov	eax, DWORD PTR _bp$[ebp]
	mov	ecx, DWORD PTR _ip$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 2216
	jmp	$endloop1$1273
; Line 2217
	jmp	$L1264
$L1263:
	cmp	DWORD PTR -76+[ebp], 47			; 0000002fH
	jg	$L2903
	je	$L1279
	cmp	DWORD PTR -76+[ebp], 10			; 0000000aH
	je	$L1287
	cmp	DWORD PTR -76+[ebp], 34			; 00000022H
	je	$L1270
	cmp	DWORD PTR -76+[ebp], 39			; 00000027H
	je	$L1270
	jmp	$L1264
$L2903:
	cmp	DWORD PTR -76+[ebp], 60			; 0000003cH
	je	$L1274
	cmp	DWORD PTR -76+[ebp], 92			; 0000005cH
	je	$L1267
	jmp	$L1264
$L1264:
; Line 2218
	jmp	$L1260
$L1261:
; Line 2219
	mov	eax, DWORD PTR _bp$[ebp]
	mov	ecx, DWORD PTR _ip$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 2221
$endloop1$1273:
; Line 2222
	mov	eax, DWORD PTR _ip$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _resume_p$[ebp], eax
; Line 2227
	cmp	DWORD PTR _copy_command$[ebp], 0
	je	$L1288
; Line 2228
	mov	eax, DWORD PTR _buf$1255[ebp]
	mov	DWORD PTR _xp$1289[ebp], eax
; Line 2231
	mov	eax, DWORD PTR _bp$[ebp]
	sub	eax, DWORD PTR _buf$1255[ebp]
	add	eax, 5
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _cp$[ebp], eax
; Line 2233
	mov	eax, DWORD PTR _cp$[ebp]
	mov	DWORD PTR _buf$1255[ebp], eax
; Line 2238
$L1291:
	mov	eax, DWORD PTR _xp$1289[ebp]
	cmp	DWORD PTR _bp$[ebp], eax
	jbe	$L1292
; Line 2239
	mov	eax, DWORD PTR _xp$1289[ebp]
	mov	al, BYTE PTR [eax]
	mov	BYTE PTR _c$1293[ebp], al
	inc	DWORD PTR _xp$1289[ebp]
; Line 2240
	mov	al, BYTE PTR _c$1293[ebp]
	mov	ecx, DWORD PTR _cp$[ebp]
	mov	BYTE PTR [ecx], al
	inc	DWORD PTR _cp$[ebp]
; Line 2242
	xor	eax, eax
	mov	al, BYTE PTR _c$1293[ebp]
	mov	DWORD PTR -80+[ebp], eax
	jmp	$L1294
; Line 2243
$L1298:
; Line 2244
	jmp	$L1295
; Line 2247
$L1299:
; Line 2248
	mov	eax, DWORD PTR _kt$[ebp]
	movsx	eax, BYTE PTR [eax+16]
	or	eax, eax
	jne	$L1300
; Line 2249
	jmp	$L1295
; Line 2250
$L1300:
$L1302:
	mov	eax, DWORD PTR _xp$1289[ebp]
	cmp	DWORD PTR _bp$[ebp], eax
	jbe	$L1303
	xor	eax, eax
	mov	al, BYTE PTR _c$1293[ebp]
	cmp	eax, 62					; 0000003eH
	je	$L1303
; Line 2251
	mov	eax, DWORD PTR _xp$1289[ebp]
	mov	al, BYTE PTR [eax]
	mov	BYTE PTR _c$1293[ebp], al
	inc	DWORD PTR _xp$1289[ebp]
; Line 2252
	mov	al, BYTE PTR _c$1293[ebp]
	mov	ecx, DWORD PTR _cp$[ebp]
	mov	BYTE PTR [ecx], al
	inc	DWORD PTR _cp$[ebp]
; Line 2253
	jmp	$L1302
$L1303:
; Line 2254
	jmp	$L1295
; Line 2256
$L1304:
; Line 2257
	mov	eax, DWORD PTR _xp$1289[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 10					; 0000000aH
	jne	$L1305
; Line 2258
	inc	DWORD PTR _xp$1289[ebp]
; Line 2259
	dec	DWORD PTR _cp$[ebp]
; Line 2260
	mov	eax, DWORD PTR _buf$1255[ebp]
	cmp	DWORD PTR _cp$[ebp], eax
	je	$L1306
	mov	eax, DWORD PTR _cp$[ebp]
	mov	al, BYTE PTR [eax-1]
	and	eax, 255				; 000000ffH
	mov	al, BYTE PTR _is_space[eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L1306
; Line 2261
$L1308:
	mov	eax, DWORD PTR _buf$1255[ebp]
	cmp	DWORD PTR _cp$[ebp], eax
	je	$L1309
	mov	eax, DWORD PTR _cp$[ebp]
	mov	al, BYTE PTR [eax-1]
	and	eax, 255				; 000000ffH
	mov	al, BYTE PTR _is_space[eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L1309
	dec	DWORD PTR _cp$[ebp]
	jmp	$L1308
$L1309:
; Line 2262
	inc	DWORD PTR _cp$[ebp]
; Line 2263
$L1310:
$L1314:
	mov	eax, DWORD PTR _xp$1289[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	al, BYTE PTR _is_hor_space[eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L1315
	inc	DWORD PTR _xp$1289[ebp]
	jmp	$L1314
$L1315:
$L1311:
$L1312:
; Line 2264
	jmp	$L1316
$L1306:
	mov	eax, DWORD PTR _xp$1289[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	al, BYTE PTR _is_space[eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L1317
; Line 2265
	mov	eax, DWORD PTR _xp$1289[ebp]
	mov	al, BYTE PTR [eax]
	mov	ecx, DWORD PTR _cp$[ebp]
	mov	BYTE PTR [ecx], al
	inc	DWORD PTR _xp$1289[ebp]
	inc	DWORD PTR _cp$[ebp]
; Line 2266
$L1318:
$L1322:
	mov	eax, DWORD PTR _xp$1289[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	al, BYTE PTR _is_hor_space[eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L1323
	inc	DWORD PTR _xp$1289[ebp]
	jmp	$L1322
$L1323:
$L1319:
$L1320:
; Line 2268
$L1317:
$L1316:
; Line 2269
$L1305:
	jmp	$L1295
; Line 2271
$L1324:
; Line 2275
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _ip$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _limit$1256[ebp]
	push	eax
	mov	eax, DWORD PTR _xp$1289[ebp]
	dec	eax
	push	eax
	call	_skip_quoted_string
	add	esp, 24					; 00000018H
	mov	DWORD PTR _bp1$1325[ebp], eax
; Line 2276
$L1327:
	mov	eax, DWORD PTR _xp$1289[ebp]
	cmp	DWORD PTR _bp1$1325[ebp], eax
	je	$L1328
; Line 2277
	mov	eax, DWORD PTR _xp$1289[ebp]
	mov	al, BYTE PTR [eax]
	mov	ecx, DWORD PTR _cp$[ebp]
	mov	BYTE PTR [ecx], al
	inc	DWORD PTR _xp$1289[ebp]
	inc	DWORD PTR _cp$[ebp]
	jmp	$L1327
$L1328:
; Line 2279
	jmp	$L1295
; Line 2281
$L1329:
; Line 2283
	mov	eax, DWORD PTR _xp$1289[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 42					; 0000002aH
	je	$L1331
	cmp	DWORD PTR _cplusplus, 0
	je	$L1330
	mov	eax, DWORD PTR _xp$1289[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 47					; 0000002fH
	jne	$L1330
$L1331:
; Line 2284
	mov	eax, DWORD PTR _xp$1289[ebp]
	inc	eax
	mov	ecx, DWORD PTR _ip$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 2285
	push	0
	mov	eax, DWORD PTR _ip$[ebp]
	push	eax
	call	_skip_to_end_of_comment
	add	esp, 8
; Line 2286
	cmp	DWORD PTR _keep_comments$1258[ebp], 0
	je	$L1332
; Line 2287
$L1334:
	mov	eax, DWORD PTR _ip$[ebp]
	mov	ecx, DWORD PTR _xp$1289[ebp]
	cmp	DWORD PTR [eax+16], ecx
	je	$L1335
; Line 2288
	mov	eax, DWORD PTR _xp$1289[ebp]
	mov	al, BYTE PTR [eax]
	mov	ecx, DWORD PTR _cp$[ebp]
	mov	BYTE PTR [ecx], al
	inc	DWORD PTR _xp$1289[ebp]
	inc	DWORD PTR _cp$[ebp]
	jmp	$L1334
$L1335:
; Line 2290
	jmp	$L1336
$L1332:
	cmp	DWORD PTR _traditional, 0
	je	$L1337
; Line 2291
	dec	DWORD PTR _cp$[ebp]
; Line 2292
	jmp	$L1338
$L1337:
; Line 2293
	mov	eax, DWORD PTR _cp$[ebp]
	mov	BYTE PTR [eax-1], 32			; 00000020H
$L1338:
$L1336:
; Line 2294
	mov	eax, DWORD PTR _ip$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _xp$1289[ebp], eax
; Line 2296
$L1330:
	jmp	$L1295
$L1294:
	cmp	DWORD PTR -80+[ebp], 47			; 0000002fH
	jg	$L2904
	je	$L1329
	cmp	DWORD PTR -80+[ebp], 10			; 0000000aH
	je	$L1295
	cmp	DWORD PTR -80+[ebp], 34			; 00000022H
	je	$L1324
	cmp	DWORD PTR -80+[ebp], 39			; 00000027H
	je	$L1324
	jmp	$L1295
$L2904:
	cmp	DWORD PTR -80+[ebp], 60			; 0000003cH
	je	$L1299
	cmp	DWORD PTR -80+[ebp], 92			; 0000005cH
	je	$L1304
	jmp	$L1295
$L1295:
; Line 2297
	jmp	$L1291
$L1292:
; Line 2301
	mov	eax, DWORD PTR _cp$[ebp]
	mov	BYTE PTR [eax], 0
; Line 2303
	jmp	$L1339
$L1288:
; Line 2304
	mov	eax, DWORD PTR _bp$[ebp]
	mov	DWORD PTR _cp$[ebp], eax
$L1339:
; Line 2306
	mov	eax, DWORD PTR _resume_p$[ebp]
	mov	ecx, DWORD PTR _ip$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 2311
	mov	eax, DWORD PTR _kt$[ebp]
	movsx	eax, BYTE PTR [eax+18]
	or	eax, eax
	je	$L1340
; Line 2315
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _op$[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	mov	edx, DWORD PTR _op$[ebp]
	sub	ecx, DWORD PTR [edx+12]
	sub	eax, ecx
	mov	ecx, DWORD PTR _kt$[ebp]
	mov	ecx, DWORD PTR [ecx]
	inc	ecx
	cmp	eax, ecx
	jle	$L2897
	jmp	$L2898
$L2897:
	mov	eax, DWORD PTR _kt$[ebp]
	mov	eax, DWORD PTR [eax]
	inc	eax
	push	eax
	mov	eax, DWORD PTR _op$[ebp]
	push	eax
	call	_grow_outbuf
	add	esp, 8
$L2898:
; Line 2316
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	BYTE PTR [eax], 35			; 00000023H
	mov	eax, DWORD PTR _op$[ebp]
	inc	DWORD PTR [eax+16]
; Line 2317
	mov	eax, DWORD PTR _kt$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	mov	eax, DWORD PTR _kt$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_bcopy
	add	esp, 12					; 0000000cH
; Line 2318
	mov	eax, DWORD PTR _kt$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _op$[ebp]
	add	DWORD PTR [ecx+16], eax
; Line 2321
	mov	eax, DWORD PTR _cp$[ebp]
	sub	eax, DWORD PTR _buf$1255[ebp]
	mov	DWORD PTR _len$1341[ebp], eax
; Line 2322
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _op$[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	mov	edx, DWORD PTR _op$[ebp]
	sub	ecx, DWORD PTR [edx+12]
	sub	eax, ecx
	cmp	eax, DWORD PTR _len$1341[ebp]
	jle	$L2899
	jmp	$L2900
$L2899:
	mov	eax, DWORD PTR _len$1341[ebp]
	push	eax
	mov	eax, DWORD PTR _op$[ebp]
	push	eax
	call	_grow_outbuf
	add	esp, 8
$L2900:
; Line 2323
	mov	eax, DWORD PTR _len$1341[ebp]
	push	eax
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	mov	eax, DWORD PTR _buf$1255[ebp]
	push	eax
	call	_bcopy
	add	esp, 12					; 0000000cH
; Line 2324
	mov	eax, DWORD PTR _len$1341[ebp]
	mov	ecx, DWORD PTR _op$[ebp]
	add	DWORD PTR [ecx+16], eax
; Line 2332
$L1340:
	mov	eax, DWORD PTR _kt$[ebp]
	push	eax
	mov	eax, DWORD PTR _op$[ebp]
	push	eax
	mov	eax, DWORD PTR _cp$[ebp]
	push	eax
	mov	eax, DWORD PTR _buf$1255[ebp]
	push	eax
	mov	eax, DWORD PTR _kt$[ebp]
	call	DWORD PTR [eax+4]
	add	esp, 16					; 00000010H
; Line 2333
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _op$[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	mov	edx, DWORD PTR _op$[ebp]
	sub	ecx, DWORD PTR [edx+12]
	sub	eax, ecx
	mov	ecx, DWORD PTR _ip$[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	mov	edx, DWORD PTR _ip$[ebp]
	mov	edx, DWORD PTR [edx+16]
	mov	ebx, DWORD PTR _ip$[ebp]
	sub	edx, DWORD PTR [ebx+12]
	sub	ecx, edx
	cmp	eax, ecx
	jle	$L2901
	jmp	$L2902
$L2901:
	mov	eax, DWORD PTR _ip$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _ip$[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	mov	edx, DWORD PTR _ip$[ebp]
	sub	ecx, DWORD PTR [edx+12]
	sub	eax, ecx
	push	eax
	mov	eax, DWORD PTR _op$[ebp]
	push	eax
	call	_grow_outbuf
	add	esp, 8
$L2902:
; Line 2335
	mov	eax, 1
	jmp	$L1223
; Line 2337
$L1254:
	jmp	$L1251
$L1252:
; Line 2339
	sub	eax, eax
	jmp	$L1223
; Line 2340
$L1223:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_handle_directive ENDP
_TEXT	ENDS
PUBLIC	_special_symbol
PUBLIC	_error
PUBLIC	_lookup
EXTRN	_localtime:NEAR
EXTRN	_time:NEAR
EXTRN	_sprintf:NEAR
_DATA	SEGMENT
	ORG $+3
$SG1374	DB	'cccp error: not in any file?!', 00H
	ORG $+2
$SG1384	DB	'"%s"', 00H
	ORG $+3
$SG1386	DB	'""', 00H
	ORG $+1
$SG1392	DB	'%d', 00H
	ORG $+1
$SG1394	DB	'"%s"', 00H
	ORG $+3
$SG1396	DB	'%d', 00H
	ORG $+1
$SG1398	DB	'%d', 00H
	ORG $+1
$SG1402	DB	'"%s %2d %4d"', 00H
	ORG $+3
$SG1404	DB	'"%02d:%02d:%02d"', 00H
	ORG $+3
$SG1406	DB	' 0 ', 00H
$SG1423	DB	' 1 ', 00H
$SG1435	DB	'`defined'' must be followed by ident or (ident)', 00H
	ORG $+1
$SG1437	DB	'cccp error: invalid special hash type', 00H
_DATA	ENDS
_TEXT	SEGMENT
_hp$ = 8
_op$ = 12
_buf$ = -12
_t$ = -24
_i$ = -20
_len$ = -16
_true_indepth$ = -4
_ip$ = -28
_paren$ = -8
_string$1380 = -32
_special_symbol PROC NEAR
; Line 2353
	push	ebp
	mov	ebp, esp
	sub	esp, 36					; 00000024H
	push	ebx
	push	esi
	push	edi
; Line 2358
	mov	DWORD PTR _ip$[ebp], 0
; Line 2362
	mov	DWORD PTR _paren$[ebp], 0
; Line 2364
	mov	eax, DWORD PTR _indepth
	mov	DWORD PTR _i$[ebp], eax
	jmp	$L1368
$L1369:
	dec	DWORD PTR _i$[ebp]
$L1368:
	cmp	DWORD PTR _i$[ebp], 0
	jl	$L1370
; Line 2365
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	cmp	DWORD PTR _instack[eax], 0
	je	$L1371
; Line 2366
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	add	eax, OFFSET _instack
	mov	DWORD PTR _ip$[ebp], eax
; Line 2367
	jmp	$L1370
; Line 2369
$L1371:
	jmp	$L1369
$L1370:
	cmp	DWORD PTR _ip$[ebp], 0
	jne	$L1372
; Line 2370
	push	OFFSET $SG1374
	call	_error
	add	esp, 4
; Line 2371
	jmp	$L1358
; Line 2374
$L1372:
	mov	eax, DWORD PTR _hp$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR -36+[ebp], eax
	jmp	$L1375
; Line 2375
$L1379:
; Line 2379
	mov	eax, DWORD PTR _hp$[ebp]
	cmp	DWORD PTR [eax+12], 17			; 00000011H
	jne	$L1381
; Line 2380
	mov	eax, DWORD PTR _ip$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _string$1380[ebp], eax
; Line 2381
	jmp	$L1382
$L1381:
; Line 2382
	mov	eax, DWORD PTR _instack
	mov	DWORD PTR _string$1380[ebp], eax
$L1382:
; Line 2384
	cmp	DWORD PTR _string$1380[ebp], 0
	je	$L1383
; Line 2386
	mov	eax, DWORD PTR _string$1380[ebp]
	push	eax
	call	_strlen
	add	esp, 4
	add	eax, 3
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _buf$[ebp], eax
; Line 2387
	mov	eax, DWORD PTR _string$1380[ebp]
	push	eax
	push	OFFSET $SG1384
	mov	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_sprintf
	add	esp, 12					; 0000000cH
; Line 2389
	jmp	$L1385
$L1383:
; Line 2390
	mov	DWORD PTR _buf$[ebp], OFFSET $SG1386
$L1385:
; Line 2392
	jmp	$L1376
; Line 2395
$L1387:
; Line 2396
	mov	DWORD PTR _true_indepth$[ebp], 0
; Line 2397
	mov	eax, DWORD PTR _indepth
	mov	DWORD PTR _i$[ebp], eax
	jmp	$L1388
$L1389:
	dec	DWORD PTR _i$[ebp]
$L1388:
	cmp	DWORD PTR _i$[ebp], 0
	jl	$L1390
; Line 2398
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	cmp	DWORD PTR _instack[eax], 0
	je	$L1391
; Line 2399
	inc	DWORD PTR _true_indepth$[ebp]
; Line 2401
$L1391:
	jmp	$L1389
$L1390:
	push	8
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _buf$[ebp], eax
; Line 2402
	mov	eax, DWORD PTR _true_indepth$[ebp]
	dec	eax
	push	eax
	push	OFFSET $SG1392
	mov	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_sprintf
	add	esp, 12					; 0000000cH
; Line 2403
	jmp	$L1376
; Line 2405
$L1393:
; Line 2406
	mov	eax, DWORD PTR _version_string
	push	eax
	call	_strlen
	add	esp, 4
	add	eax, 3
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _buf$[ebp], eax
; Line 2407
	mov	eax, DWORD PTR _version_string
	push	eax
	push	OFFSET $SG1394
	mov	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_sprintf
	add	esp, 12					; 0000000cH
; Line 2408
	jmp	$L1376
; Line 2410
$L1395:
; Line 2411
	push	16					; 00000010H
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _buf$[ebp], eax
; Line 2412
	mov	eax, DWORD PTR _hp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	OFFSET $SG1396
	mov	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_sprintf
	add	esp, 12					; 0000000cH
; Line 2413
	jmp	$L1376
; Line 2415
$L1397:
; Line 2416
	push	10					; 0000000aH
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _buf$[ebp], eax
; Line 2417
	mov	eax, DWORD PTR _ip$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	OFFSET $SG1398
	mov	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_sprintf
	add	esp, 12					; 0000000cH
; Line 2418
	jmp	$L1376
; Line 2420
$L1399:
; Line 2422
	cmp	DWORD PTR _?timebuf@?1??special_symbol@@9@9$S1366, 0
	jne	$L1400
; Line 2423
	push	0
	call	_time
	add	esp, 4
	mov	DWORD PTR _t$[ebp], eax
; Line 2424
	lea	eax, DWORD PTR _t$[ebp]
	push	eax
	call	_localtime
	add	esp, 4
	mov	DWORD PTR _?timebuf@?1??special_symbol@@9@9$S1366, eax
; Line 2426
$L1400:
	push	20					; 00000014H
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _buf$[ebp], eax
; Line 2427
	mov	eax, DWORD PTR _hp$[ebp]
	cmp	DWORD PTR [eax+12], 16			; 00000010H
	jne	$L1401
; Line 2429
	mov	eax, DWORD PTR _?timebuf@?1??special_symbol@@9@9$S1366
	mov	eax, DWORD PTR [eax+20]
	add	eax, 1900				; 0000076cH
	push	eax
	mov	eax, DWORD PTR _?timebuf@?1??special_symbol@@9@9$S1366
	mov	eax, DWORD PTR [eax+12]
	push	eax
	mov	eax, DWORD PTR _?timebuf@?1??special_symbol@@9@9$S1366
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR _monthnames$S1342[eax*4]
	push	eax
	push	OFFSET $SG1402
	mov	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_sprintf
	add	esp, 20					; 00000014H
; Line 2430
	jmp	$L1403
$L1401:
; Line 2432
	mov	eax, DWORD PTR _?timebuf@?1??special_symbol@@9@9$S1366
	mov	eax, DWORD PTR [eax]
	push	eax
	mov	eax, DWORD PTR _?timebuf@?1??special_symbol@@9@9$S1366
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _?timebuf@?1??special_symbol@@9@9$S1366
	mov	eax, DWORD PTR [eax+8]
	push	eax
	push	OFFSET $SG1404
	mov	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_sprintf
	add	esp, 20					; 00000014H
$L1403:
; Line 2433
	jmp	$L1376
; Line 2435
$L1405:
; Line 2436
	mov	DWORD PTR _buf$[ebp], OFFSET $SG1406
; Line 2437
	mov	eax, DWORD PTR _indepth
	shl	eax, 5
	add	eax, OFFSET _instack
	mov	DWORD PTR _ip$[ebp], eax
; Line 2438
$L1407:
$L1411:
	mov	eax, DWORD PTR _ip$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	al, BYTE PTR _is_hor_space[eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L1412
	mov	eax, DWORD PTR _ip$[ebp]
	inc	DWORD PTR [eax+16]
	jmp	$L1411
$L1412:
$L1408:
$L1409:
; Line 2439
	mov	eax, DWORD PTR _ip$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 40					; 00000028H
	jne	$L1413
; Line 2440
	inc	DWORD PTR _paren$[ebp]
; Line 2441
	mov	eax, DWORD PTR _ip$[ebp]
	inc	DWORD PTR [eax+16]
; Line 2442
$L1414:
$L1418:
	mov	eax, DWORD PTR _ip$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	al, BYTE PTR _is_hor_space[eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L1419
	mov	eax, DWORD PTR _ip$[ebp]
	inc	DWORD PTR [eax+16]
	jmp	$L1418
$L1419:
$L1415:
$L1416:
; Line 2445
$L1413:
	mov	eax, DWORD PTR _ip$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	al, BYTE PTR _is_idstart[eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	jne	$L1420
; Line 2446
	jmp	$oops$1421
; Line 2447
$L1420:
	push	-1
	push	-1
	mov	eax, DWORD PTR _ip$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_lookup
	add	esp, 12					; 0000000cH
	or	eax, eax
	je	$L1422
; Line 2448
	mov	DWORD PTR _buf$[ebp], OFFSET $SG1423
; Line 2449
$L1422:
$L1425:
	mov	eax, DWORD PTR _ip$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	al, BYTE PTR _is_idchar[eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L1426
; Line 2450
	mov	eax, DWORD PTR _ip$[ebp]
	inc	DWORD PTR [eax+16]
	jmp	$L1425
$L1426:
; Line 2451
$L1427:
$L1431:
	mov	eax, DWORD PTR _ip$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	al, BYTE PTR _is_hor_space[eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L1432
	mov	eax, DWORD PTR _ip$[ebp]
	inc	DWORD PTR [eax+16]
	jmp	$L1431
$L1432:
$L1428:
$L1429:
; Line 2452
	cmp	DWORD PTR _paren$[ebp], 0
	je	$L1433
; Line 2453
	mov	eax, DWORD PTR _ip$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 41					; 00000029H
	je	$L1434
; Line 2454
	jmp	$oops$1421
; Line 2455
$L1434:
	mov	eax, DWORD PTR _ip$[ebp]
	inc	DWORD PTR [eax+16]
; Line 2457
$L1433:
	jmp	$L1376
; Line 2459
$oops$1421:
; Line 2461
	push	OFFSET $SG1435
	call	_error
	add	esp, 4
; Line 2462
	jmp	$L1376
; Line 2464
$L1436:
; Line 2465
	push	OFFSET $SG1437
	call	_error
	add	esp, 4
; Line 2466
	call	_abort
; Line 2467
	jmp	$L1376
$L1375:
	sub	DWORD PTR -36+[ebp], 15			; 0000000fH
	cmp	DWORD PTR -36+[ebp], 10			; 0000000aH
	ja	$L1436
	shl	DWORD PTR -36+[ebp], 2
	mov	eax, DWORD PTR -36+[ebp]
	jmp	DWORD PTR $L2907[eax]
$L2907:
	DD	OFFSET $L1397
	DD	OFFSET $L1399
	DD	OFFSET $L1379
	DD	OFFSET $L1379
	DD	OFFSET $L1387
	DD	OFFSET $L1393
	DD	OFFSET $L1399
	DD	OFFSET $L1395
	DD	OFFSET $L1436
	DD	OFFSET $L1436
	DD	OFFSET $L1405
$L1376:
; Line 2468
	mov	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_strlen
	add	esp, 4
	mov	DWORD PTR _len$[ebp], eax
; Line 2469
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _op$[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	mov	edx, DWORD PTR _op$[ebp]
	sub	ecx, DWORD PTR [edx+12]
	sub	eax, ecx
	cmp	eax, DWORD PTR _len$[ebp]
	jle	$L2905
	jmp	$L2906
$L2905:
	mov	eax, DWORD PTR _len$[ebp]
	push	eax
	mov	eax, DWORD PTR _op$[ebp]
	push	eax
	call	_grow_outbuf
	add	esp, 8
$L2906:
; Line 2470
	mov	eax, DWORD PTR _len$[ebp]
	push	eax
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	mov	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_bcopy
	add	esp, 12					; 0000000cH
; Line 2471
	mov	eax, DWORD PTR _len$[ebp]
	mov	ecx, DWORD PTR _op$[ebp]
	add	DWORD PTR [ecx+16], eax
; Line 2473
	jmp	$L1358
; Line 2474
$L1358:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_special_symbol ENDP
_TEXT	ENDS
PUBLIC	_error_from_errno
PUBLIC	_savestring
EXTRN	_strrchr:NEAR
EXTRN	_strncpy:NEAR
EXTRN	_strcat:NEAR
EXTRN	_strncat:NEAR
EXTRN	__close:NEAR
_DATA	SEGMENT
	ORG $+2
$SG1495	DB	'#include expects "fname" or <fname>', 00H
$SG1504	DB	'/', 00H
	ORG $+2
$SG1512	DB	'nonexistent file <%.*s> omitted from dependency output', 00H
	ORG $+1
$SG1514	DB	' ', 00H
	ORG $+2
$SG1527	DB	' ', 00H
_DATA	ENDS
_TEXT	SEGMENT
_fp$1472 = -76
_n$1477 = -84
_ep$1478 = -88
_nam$1479 = -80
$T2908 = -128
_buf$ = 8
_limit$ = 12
_op$ = 16
_fname$ = -12
_fbeg$ = -72
_fend$ = -20
_stackp$ = -8
_dsp$ = -68
_flen$ = -16
_f$ = -28
_retried$ = -4
_trybuf$ = -60
_ptr$1516 = -92
_system_header_p$ = -24
_do_include PROC NEAR
; Line 2488
	push	ebp
	mov	ebp, esp
	sub	esp, 144				; 00000090H
	push	ebx
	push	esi
	push	edi
; Line 2492
	mov	eax, DWORD PTR _include
	mov	DWORD PTR _stackp$[ebp], eax
; Line 2498
	mov	DWORD PTR _retried$[ebp], 0
; Line 2501
	mov	DWORD PTR _system_header_p$[ebp], 0
; Line 2503
	mov	DWORD PTR _f$[ebp], -1
; Line 2505
$get_filename$1453:
; Line 2507
	mov	eax, DWORD PTR _buf$[ebp]
	mov	DWORD PTR _fbeg$[ebp], eax
; Line 2508
$L1454:
$L1458:
	mov	eax, DWORD PTR _fbeg$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	al, BYTE PTR _is_hor_space[eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L1459
	inc	DWORD PTR _fbeg$[ebp]
	jmp	$L1458
$L1459:
$L1455:
$L1456:
; Line 2511
$L1461:
	mov	eax, DWORD PTR _limit$[ebp]
	cmp	DWORD PTR _fbeg$[ebp], eax
	je	$L1462
	mov	eax, DWORD PTR _limit$[ebp]
	mov	al, BYTE PTR [eax-1]
	and	eax, 255				; 000000ffH
	mov	al, BYTE PTR _is_hor_space[eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L1462
	dec	DWORD PTR _limit$[ebp]
	jmp	$L1461
$L1462:
; Line 2513
	mov	eax, DWORD PTR _fbeg$[ebp]
	mov	DWORD PTR -96+[ebp], eax
	inc	DWORD PTR _fbeg$[ebp]
	mov	eax, DWORD PTR -96+[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR -144+[ebp], eax
	jmp	$L1463
; Line 2514
$L1467:
; Line 2515
	mov	eax, DWORD PTR _fbeg$[ebp]
	mov	DWORD PTR _fend$[ebp], eax
; Line 2516
$L1469:
	mov	eax, DWORD PTR _limit$[ebp]
	cmp	DWORD PTR _fend$[ebp], eax
	je	$L1470
	mov	eax, DWORD PTR _fend$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 34					; 00000022H
	je	$L1470
; Line 2517
	inc	DWORD PTR _fend$[ebp]
	jmp	$L1469
$L1470:
; Line 2518
	mov	eax, DWORD PTR _fend$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 34					; 00000022H
	jne	$L1471
	mov	eax, DWORD PTR _fend$[ebp]
	inc	eax
	cmp	eax, DWORD PTR _limit$[ebp]
	jne	$L1471
; Line 2525
	cmp	DWORD PTR _ignore_srcdir, 0
	je	$L1473
	jmp	$L1464
; Line 2527
$L1473:
	mov	eax, DWORD PTR _indepth
	shl	eax, 5
	add	eax, OFFSET _instack
	mov	DWORD PTR _fp$1472[ebp], eax
	jmp	$L1474
$L1475:
	sub	DWORD PTR _fp$1472[ebp], 32		; 00000020H
$L1474:
	cmp	DWORD PTR _fp$1472[ebp], OFFSET _instack
	jb	$L1476
; Line 2533
	mov	eax, DWORD PTR _fp$1472[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _nam$1479[ebp], eax
	cmp	DWORD PTR _nam$1479[ebp], 0
	je	$L1481
; Line 2536
	mov	eax, DWORD PTR _stackp$[ebp]
	mov	DWORD PTR _dsp$[ebp], eax
; Line 2537
	lea	eax, DWORD PTR _dsp$[ebp]
	mov	DWORD PTR _stackp$[ebp], eax
; Line 2539
	push	47					; 0000002fH
	mov	eax, DWORD PTR _nam$1479[ebp]
	push	eax
	call	_strrchr
	add	esp, 8
	mov	DWORD PTR _ep$1478[ebp], eax
; Line 2546
	cmp	DWORD PTR _ep$1478[ebp], 0
	je	$L1482
; Line 2547
	mov	eax, DWORD PTR _ep$1478[ebp]
	sub	eax, DWORD PTR _nam$1479[ebp]
	mov	DWORD PTR _n$1477[ebp], eax
; Line 2548
	mov	eax, DWORD PTR _n$1477[ebp]
	inc	eax
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _dsp$[ebp+4], eax
; Line 2549
	mov	eax, DWORD PTR _n$1477[ebp]
	push	eax
	mov	eax, DWORD PTR _nam$1479[ebp]
	push	eax
	mov	eax, DWORD PTR _dsp$[ebp+4]
	push	eax
	call	_strncpy
	add	esp, 12					; 0000000cH
; Line 2550
	mov	eax, DWORD PTR _dsp$[ebp+4]
	mov	ecx, DWORD PTR _n$1477[ebp]
	mov	BYTE PTR [eax+ecx], 0
; Line 2551
	mov	eax, DWORD PTR _max_include_len
	cmp	DWORD PTR _n$1477[ebp], eax
	jle	$L1484
	mov	eax, DWORD PTR _n$1477[ebp]
	mov	DWORD PTR _max_include_len, eax
; Line 2552
$L1484:
	jmp	$L1485
$L1482:
; Line 2553
	mov	DWORD PTR _dsp$[ebp+4], 0
; Line 2554
$L1485:
; Line 2555
	jmp	$L1476
; Line 2557
$L1481:
	jmp	$L1475
$L1476:
; Line 2558
	jmp	$L1464
; Line 2560
$L1471:
	jmp	$fail$1486
; Line 2562
$L1487:
; Line 2563
	mov	eax, DWORD PTR _fbeg$[ebp]
	mov	DWORD PTR _fend$[ebp], eax
; Line 2564
$L1489:
	mov	eax, DWORD PTR _limit$[ebp]
	cmp	DWORD PTR _fend$[ebp], eax
	je	$L1490
	mov	eax, DWORD PTR _fend$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 62					; 0000003eH
	je	$L1490
	inc	DWORD PTR _fend$[ebp]
	jmp	$L1489
$L1490:
; Line 2565
	mov	eax, DWORD PTR _fend$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 62					; 0000003eH
	jne	$L1491
	mov	eax, DWORD PTR _fend$[ebp]
	inc	eax
	cmp	eax, DWORD PTR _limit$[ebp]
	jne	$L1491
; Line 2566
	mov	DWORD PTR _system_header_p$[ebp], 1
; Line 2568
	cmp	DWORD PTR _first_bracket_include, 0
	je	$L1492
; Line 2569
	mov	eax, DWORD PTR _first_bracket_include
	mov	DWORD PTR _stackp$[ebp], eax
; Line 2570
$L1492:
	jmp	$L1464
; Line 2572
$L1491:
	jmp	$fail$1486
; Line 2574
$L1493:
; Line 2575
$fail$1486:
; Line 2576
	cmp	DWORD PTR _retried$[ebp], 0
	je	$L1494
; Line 2577
	push	OFFSET $SG1495
	call	_error
	add	esp, 4
; Line 2578
	jmp	$L1442
; Line 2579
	jmp	$L1496
$L1494:
; Line 2580
	push	0
	mov	eax, DWORD PTR _limit$[ebp]
	push	eax
	mov	eax, DWORD PTR _buf$[ebp]
	push	eax
	lea	eax, DWORD PTR $T2908[ebp]
	push	eax
	call	_expand_to_temp_buffer
	add	esp, 16					; 00000010H
	lea	edi, DWORD PTR _trybuf$[ebp]
	mov	esi, eax
	mov	ecx, 8
	rep	movsd
; Line 2581
	mov	eax, DWORD PTR _trybuf$[ebp+16]
	sub	eax, DWORD PTR _trybuf$[ebp+12]
	inc	eax
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _buf$[ebp], eax
; Line 2582
	mov	eax, DWORD PTR _trybuf$[ebp+16]
	sub	eax, DWORD PTR _trybuf$[ebp+12]
	push	eax
	mov	eax, DWORD PTR _buf$[ebp]
	push	eax
	mov	eax, DWORD PTR _trybuf$[ebp+12]
	push	eax
	call	_bcopy
	add	esp, 12					; 0000000cH
; Line 2583
	mov	eax, DWORD PTR _trybuf$[ebp+16]
	sub	eax, DWORD PTR _trybuf$[ebp+12]
	add	eax, DWORD PTR _buf$[ebp]
	mov	DWORD PTR _limit$[ebp], eax
; Line 2584
	mov	eax, DWORD PTR _trybuf$[ebp+12]
	push	eax
	call	_free
	add	esp, 4
; Line 2585
	inc	DWORD PTR _retried$[ebp]
; Line 2586
	jmp	$get_filename$1453
; Line 2587
$L1496:
; Line 2588
	jmp	$L1464
$L1463:
	cmp	DWORD PTR -144+[ebp], 34		; 00000022H
	je	$L1467
	cmp	DWORD PTR -144+[ebp], 60		; 0000003cH
	je	$L1487
	jmp	$L1493
$L1464:
; Line 2590
	mov	eax, DWORD PTR _fend$[ebp]
	sub	eax, DWORD PTR _fbeg$[ebp]
	mov	DWORD PTR _flen$[ebp], eax
; Line 2591
	mov	eax, DWORD PTR _flen$[ebp]
	add	eax, DWORD PTR _max_include_len
	add	eax, 2
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _fname$[ebp], eax
; Line 2596
	mov	eax, DWORD PTR _fbeg$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 47					; 0000002fH
	jne	$L1497
; Line 2597
	mov	eax, DWORD PTR _flen$[ebp]
	push	eax
	mov	eax, DWORD PTR _fbeg$[ebp]
	push	eax
	mov	eax, DWORD PTR _fname$[ebp]
	push	eax
	call	_strncpy
	add	esp, 12					; 0000000cH
; Line 2598
	mov	eax, DWORD PTR _flen$[ebp]
	mov	ecx, DWORD PTR _fname$[ebp]
	mov	BYTE PTR [eax+ecx], 0
; Line 2599
	push	438					; 000001b6H
	push	0
	mov	eax, DWORD PTR _fname$[ebp]
	push	eax
	call	__open
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _f$[ebp], eax
; Line 2600
	jmp	$L1498
$L1497:
; Line 2604
	jmp	$L1499
$L1500:
	mov	eax, DWORD PTR _stackp$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _stackp$[ebp], eax
$L1499:
	cmp	DWORD PTR _stackp$[ebp], 0
	je	$L1501
; Line 2605
	mov	eax, DWORD PTR _stackp$[ebp]
	cmp	DWORD PTR [eax+4], 0
	je	$L1502
; Line 2606
	mov	eax, DWORD PTR _stackp$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _fname$[ebp]
	push	eax
	call	_strcpy
	add	esp, 8
; Line 2607
	push	OFFSET $SG1504
	mov	eax, DWORD PTR _fname$[ebp]
	push	eax
	call	_strcat
	add	esp, 8
; Line 2608
	mov	eax, DWORD PTR _fname$[ebp]
	push	eax
	call	_strlen
	add	esp, 4
	mov	DWORD PTR -132+[ebp], eax
	mov	eax, DWORD PTR _flen$[ebp]
	add	eax, DWORD PTR -132+[ebp]
	mov	ecx, DWORD PTR _fname$[ebp]
	mov	BYTE PTR [eax+ecx], 0
; Line 2609
	jmp	$L1505
$L1502:
; Line 2610
	mov	eax, DWORD PTR _fname$[ebp]
	mov	BYTE PTR [eax], 0
; Line 2611
$L1505:
; Line 2612
	mov	eax, DWORD PTR _flen$[ebp]
	push	eax
	mov	eax, DWORD PTR _fbeg$[ebp]
	push	eax
	mov	eax, DWORD PTR _fname$[ebp]
	push	eax
	call	_strncat
	add	esp, 12					; 0000000cH
; Line 2625
	push	438					; 000001b6H
	push	0
	mov	eax, DWORD PTR _fname$[ebp]
	push	eax
	call	__open
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _f$[ebp], eax
	cmp	DWORD PTR _f$[ebp], 0
	jl	$L1507
; Line 2626
	jmp	$L1501
; Line 2627
$L1507:
	jmp	$L1500
$L1501:
; Line 2628
$L1498:
; Line 2630
	cmp	DWORD PTR _f$[ebp], 0
	jge	$L1508
; Line 2631
	mov	eax, DWORD PTR _flen$[ebp]
	push	eax
	mov	eax, DWORD PTR _fbeg$[ebp]
	push	eax
	mov	eax, DWORD PTR _fname$[ebp]
	push	eax
	call	_strncpy
	add	esp, 12					; 0000000cH
; Line 2632
	mov	eax, DWORD PTR _flen$[ebp]
	mov	ecx, DWORD PTR _fname$[ebp]
	mov	BYTE PTR [eax+ecx], 0
; Line 2633
	mov	eax, DWORD PTR _fname$[ebp]
	push	eax
	call	_error_from_errno
	add	esp, 4
; Line 2636
	cmp	DWORD PTR _system_header_p$[ebp], 0
	jne	$L2911
	cmp	DWORD PTR _system_include_depth, 0
	jle	$L2909
$L2911:
	mov	DWORD PTR -136+[ebp], 1
	jmp	$L2910
$L2909:
	mov	DWORD PTR -136+[ebp], 0
$L2910:
	mov	eax, DWORD PTR _print_deps
	cmp	DWORD PTR -136+[ebp], eax
	jge	$L1510
; Line 2637
	cmp	DWORD PTR _system_header_p$[ebp], 0
	je	$L1511
; Line 2639
	mov	eax, DWORD PTR _fbeg$[ebp]
	push	eax
	mov	eax, DWORD PTR _fend$[ebp]
	sub	eax, DWORD PTR _fbeg$[ebp]
	push	eax
	push	OFFSET $SG1512
	call	_warning
	add	esp, 12					; 0000000cH
; Line 2640
	jmp	$L1513
$L1511:
; Line 2642
	mov	eax, DWORD PTR _fend$[ebp]
	sub	eax, DWORD PTR _fbeg$[ebp]
	push	eax
	mov	eax, DWORD PTR _fbeg$[ebp]
	push	eax
	call	_deps_output
	add	esp, 8
; Line 2643
	push	0
	push	OFFSET $SG1514
	call	_deps_output
	add	esp, 8
; Line 2644
$L1513:
; Line 2646
$L1510:
	jmp	$L1515
$L1508:
; Line 2653
	mov	eax, DWORD PTR _dont_repeat_files
	mov	DWORD PTR _ptr$1516[ebp], eax
	jmp	$L1517
$L1518:
	mov	eax, DWORD PTR _ptr$1516[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _ptr$1516[ebp], eax
$L1517:
	cmp	DWORD PTR _ptr$1516[ebp], 0
	je	$L1519
; Line 2654
	mov	eax, DWORD PTR _fname$[ebp]
	push	eax
	mov	eax, DWORD PTR _ptr$1516[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L1520
; Line 2655
	mov	eax, DWORD PTR _f$[ebp]
	push	eax
	call	__close
	add	esp, 4
; Line 2656
	jmp	$L1442
; Line 2658
$L1520:
	jmp	$L1518
$L1519:
; Line 2660
	mov	eax, DWORD PTR _all_include_files
	mov	DWORD PTR _ptr$1516[ebp], eax
	jmp	$L1521
$L1522:
	mov	eax, DWORD PTR _ptr$1516[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _ptr$1516[ebp], eax
$L1521:
	cmp	DWORD PTR _ptr$1516[ebp], 0
	je	$L1523
; Line 2661
	mov	eax, DWORD PTR _fname$[ebp]
	push	eax
	mov	eax, DWORD PTR _ptr$1516[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L1524
; Line 2662
	jmp	$L1523
; Line 2663
$L1524:
	jmp	$L1522
$L1523:
; Line 2665
	cmp	DWORD PTR _ptr$1516[ebp], 0
	jne	$L1525
; Line 2669
	push	8
	call	_xmalloc
	add	esp, 4
	mov	DWORD PTR _ptr$1516[ebp], eax
; Line 2670
	mov	eax, DWORD PTR _all_include_files
	mov	ecx, DWORD PTR _ptr$1516[ebp]
	mov	DWORD PTR [ecx], eax
; Line 2671
	mov	eax, DWORD PTR _ptr$1516[ebp]
	mov	DWORD PTR _all_include_files, eax
; Line 2672
	mov	eax, DWORD PTR _fname$[ebp]
	push	eax
	call	_savestring
	add	esp, 4
	mov	ecx, DWORD PTR _ptr$1516[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 2675
	cmp	DWORD PTR _system_header_p$[ebp], 0
	jne	$L2914
	cmp	DWORD PTR _system_include_depth, 0
	jle	$L2912
$L2914:
	mov	DWORD PTR -140+[ebp], 1
	jmp	$L2913
$L2912:
	mov	DWORD PTR -140+[ebp], 0
$L2913:
	mov	eax, DWORD PTR _print_deps
	cmp	DWORD PTR -140+[ebp], eax
	jge	$L1526
; Line 2676
	mov	eax, DWORD PTR _fname$[ebp]
	push	eax
	call	_strlen
	add	esp, 4
	push	eax
	mov	eax, DWORD PTR _fname$[ebp]
	push	eax
	call	_deps_output
	add	esp, 8
; Line 2677
	push	0
	push	OFFSET $SG1527
	call	_deps_output
	add	esp, 8
; Line 2679
$L1526:
; Line 2681
$L1525:
	cmp	DWORD PTR _system_header_p$[ebp], 0
	je	$L1528
; Line 2682
	inc	DWORD PTR _system_include_depth
; Line 2685
$L1528:
	mov	eax, DWORD PTR _op$[ebp]
	push	eax
	mov	eax, DWORD PTR _fname$[ebp]
	push	eax
	mov	eax, DWORD PTR _f$[ebp]
	push	eax
	call	_finclude
	add	esp, 12					; 0000000cH
; Line 2687
	cmp	DWORD PTR _system_header_p$[ebp], 0
	je	$L1529
; Line 2688
	dec	DWORD PTR _system_include_depth
; Line 2690
$L1529:
	mov	eax, DWORD PTR _f$[ebp]
	push	eax
	call	__close
	add	esp, 4
; Line 2691
$L1515:
; Line 2692
$L1442:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_do_include ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+2
$SG1540	DB	'macro or #include recursion too deep', 00H
_DATA	ENDS
_TEXT	SEGMENT
_i$ = -12
_fp$ = -4
_success$ = -8
_bufp$1550 = -32
_basep$1551 = -28
_bsize$1552 = -24
_f$ = 8
_fname$ = 12
_op$ = 16
_st_mode$ = -20
_st_size$ = -16
_finclude PROC NEAR
; Line 2701
	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H
	push	ebx
	push	esi
	push	edi
; Line 2706
	mov	DWORD PTR _success$[ebp], 0
; Line 2708
	cmp	DWORD PTR _indepth, 199			; 000000c7H
	jl	$L1539
	push	OFFSET $SG1540
	mov	eax, DWORD PTR _indepth
	shl	eax, 5
	mov	eax, DWORD PTR _instack[eax+4]
	push	eax
	call	_line_for_error
	add	esp, 4
	push	eax
	call	_error_with_line
	add	esp, 8
	jmp	$L1533
$L1539:
; Line 2710
	lea	eax, DWORD PTR _st_size$[ebp]
	push	eax
	lea	eax, DWORD PTR _st_mode$[ebp]
	push	eax
	mov	eax, DWORD PTR _f$[ebp]
	push	eax
	call	_file_size_and_mode
	add	esp, 12					; 0000000cH
	or	eax, eax
	jge	$L1541
; Line 2711
	jmp	$nope$1542
; Line 2713
$L1541:
	mov	eax, DWORD PTR _indepth
	inc	eax
	shl	eax, 5
	add	eax, OFFSET _instack
	mov	DWORD PTR _fp$[ebp], eax
; Line 2714
	push	32					; 00000020H
	mov	eax, DWORD PTR _fp$[ebp]
	push	eax
	call	_bzero
	add	esp, 8
; Line 2715
	mov	eax, DWORD PTR _fname$[ebp]
	mov	ecx, DWORD PTR _fp$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 2716
	mov	eax, DWORD PTR _fp$[ebp]
	mov	DWORD PTR [eax+8], 0
; Line 2717
	mov	eax, DWORD PTR _fp$[ebp]
	mov	DWORD PTR [eax+4], 1
; Line 2718
	mov	eax, DWORD PTR _if_stack
	mov	ecx, DWORD PTR _fp$[ebp]
	mov	DWORD PTR [ecx+24], eax
; Line 2720
	test	BYTE PTR _st_mode$[ebp+1], 128		; 00000080H
	je	$L1543
; Line 2721
	mov	eax, DWORD PTR _st_size$[ebp]
	add	eax, 2
	push	eax
	call	_alloca
	add	esp, 4
	mov	ecx, DWORD PTR _fp$[ebp]
	mov	DWORD PTR [ecx+12], eax
; Line 2722
	mov	eax, DWORD PTR _fp$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	ecx, DWORD PTR _fp$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 2726
$L1545:
	cmp	DWORD PTR _st_size$[ebp], 0
	jle	$L1546
; Line 2727
	mov	eax, DWORD PTR _st_size$[ebp]
	push	eax
	mov	eax, DWORD PTR _fp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _fp$[ebp]
	add	eax, DWORD PTR [ecx+12]
	push	eax
	mov	eax, DWORD PTR _f$[ebp]
	push	eax
	call	__read
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _i$[ebp], eax
; Line 2728
	cmp	DWORD PTR _i$[ebp], 0
	jg	$L1547
; Line 2729
	jne	$L1548
	jmp	$L1546
; Line 2730
$L1548:
	jmp	$nope$1542
; Line 2732
$L1547:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fp$[ebp]
	add	DWORD PTR [ecx+8], eax
; Line 2733
	sub	eax, eax
	sub	eax, DWORD PTR _i$[ebp]
	neg	eax
	sub	DWORD PTR _st_size$[ebp], eax
; Line 2734
	jmp	$L1545
$L1546:
; Line 2736
	jmp	$L1549
$L1543:
; Line 2743
	mov	DWORD PTR _bsize$1552[ebp], 2000	; 000007d0H
; Line 2745
	mov	DWORD PTR _st_size$[ebp], 0
; Line 2746
	mov	eax, DWORD PTR _bsize$1552[ebp]
	add	eax, 2
	push	eax
	call	_xmalloc
	add	esp, 4
	mov	DWORD PTR _basep$1551[ebp], eax
; Line 2747
	mov	eax, DWORD PTR _basep$1551[ebp]
	mov	DWORD PTR _bufp$1550[ebp], eax
; Line 2749
$L1554:
; Line 2750
	mov	eax, DWORD PTR _bsize$1552[ebp]
	sub	eax, DWORD PTR _st_size$[ebp]
	push	eax
	mov	eax, DWORD PTR _bufp$1550[ebp]
	push	eax
	mov	eax, DWORD PTR _f$[ebp]
	push	eax
	call	__read
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _i$[ebp], eax
; Line 2751
	cmp	DWORD PTR _i$[ebp], 0
	jge	$L1556
; Line 2752
	jmp	$nope$1542
; Line 2753
$L1556:
	cmp	DWORD PTR _i$[ebp], 0
	jne	$L1557
; Line 2754
	jmp	$L1555
; Line 2755
$L1557:
	mov	eax, DWORD PTR _i$[ebp]
	add	DWORD PTR _st_size$[ebp], eax
; Line 2756
	mov	eax, DWORD PTR _i$[ebp]
	add	DWORD PTR _bufp$1550[ebp], eax
; Line 2757
	mov	eax, DWORD PTR _bsize$1552[ebp]
	cmp	DWORD PTR _st_size$[ebp], eax
	jne	$L1558
; Line 2758
	shl	DWORD PTR _bsize$1552[ebp], 1
; Line 2759
	mov	eax, DWORD PTR _bsize$1552[ebp]
	add	eax, 2
	push	eax
	mov	eax, DWORD PTR _basep$1551[ebp]
	push	eax
	call	_xrealloc
	add	esp, 8
	mov	DWORD PTR _basep$1551[ebp], eax
; Line 2760
	mov	eax, DWORD PTR _st_size$[ebp]
	add	eax, DWORD PTR _basep$1551[ebp]
	mov	DWORD PTR _bufp$1550[ebp], eax
; Line 2762
$L1558:
	jmp	$L1554
$L1555:
; Line 2763
	mov	eax, DWORD PTR _st_size$[ebp]
	add	eax, 2
	push	eax
	call	_alloca
	add	esp, 4
	mov	ecx, DWORD PTR _fp$[ebp]
	mov	DWORD PTR [ecx+12], eax
; Line 2764
	mov	eax, DWORD PTR _fp$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	ecx, DWORD PTR _fp$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 2765
	mov	eax, DWORD PTR _st_size$[ebp]
	push	eax
	mov	eax, DWORD PTR _fp$[ebp]
	mov	eax, DWORD PTR [eax+12]
	push	eax
	mov	eax, DWORD PTR _basep$1551[ebp]
	push	eax
	call	_bcopy
	add	esp, 12					; 0000000cH
; Line 2766
	mov	eax, DWORD PTR _st_size$[ebp]
	mov	ecx, DWORD PTR _fp$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 2767
	mov	eax, DWORD PTR _basep$1551[ebp]
	push	eax
	call	_free
	add	esp, 4
; Line 2768
$L1549:
; Line 2770
	cmp	DWORD PTR _no_trigraphs, 0
	jne	$L1559
; Line 2771
	mov	eax, DWORD PTR _fp$[ebp]
	push	eax
	call	_trigraph_pcp
	add	esp, 4
; Line 2773
$L1559:
	mov	eax, DWORD PTR _fp$[ebp]
	cmp	DWORD PTR [eax+8], 0
	jle	$L1560
	mov	eax, DWORD PTR _fp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _fp$[ebp]
	mov	ecx, DWORD PTR [ecx+12]
	mov	al, BYTE PTR [eax+ecx-1]
	and	eax, 255				; 000000ffH
	cmp	eax, 10					; 0000000aH
	je	$L1560
; Line 2774
	mov	eax, DWORD PTR _fp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _fp$[ebp]
	mov	ecx, DWORD PTR [ecx+12]
	mov	BYTE PTR [eax+ecx], 10			; 0000000aH
	mov	eax, DWORD PTR _fp$[ebp]
	inc	DWORD PTR [eax+8]
; Line 2775
$L1560:
	mov	eax, DWORD PTR _fp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _fp$[ebp]
	mov	ecx, DWORD PTR [ecx+12]
	mov	BYTE PTR [eax+ecx], 0
; Line 2777
	mov	DWORD PTR _success$[ebp], 1
; Line 2778
	inc	DWORD PTR _indepth
; Line 2780
	push	1
	push	0
	mov	eax, DWORD PTR _op$[ebp]
	push	eax
	mov	eax, DWORD PTR _fp$[ebp]
	push	eax
	call	_output_line_command
	add	esp, 16					; 00000010H
; Line 2781
	push	0
	mov	eax, DWORD PTR _op$[ebp]
	push	eax
	call	_rescan
	add	esp, 8
; Line 2782
	dec	DWORD PTR _indepth
; Line 2783
	push	2
	push	0
	mov	eax, DWORD PTR _op$[ebp]
	push	eax
	mov	eax, DWORD PTR _indepth
	shl	eax, 5
	add	eax, OFFSET _instack
	push	eax
	call	_output_line_command
	add	esp, 16					; 00000010H
; Line 2785
$nope$1542:
; Line 2787
	cmp	DWORD PTR _success$[ebp], 0
	jne	$L1561
; Line 2788
	mov	eax, DWORD PTR _fname$[ebp]
	push	eax
	call	_perror_with_name
	add	esp, 4
; Line 2790
$L1561:
	mov	eax, DWORD PTR _f$[ebp]
	push	eax
	call	__close
	add	esp, 4
; Line 2791
$L1533:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_finclude ENDP
_TEXT	ENDS
PUBLIC	_hashf
PUBLIC	_compare_defs
PUBLIC	_collect_expansion
PUBLIC	_install
_DATA	SEGMENT
	ORG $+3
$SG1580	DB	'invalid macro name', 00H
	ORG $+1
$SG1584	DB	'invalid macro name `%s''', 00H
$SG1599	DB	'parameter name starts with a digit in #define', 00H
	ORG $+2
$SG1611	DB	'badly punctuated parameter list in #define', 00H
	ORG $+1
$SG1621	DB	'unterminated parameter list in #define', 00H
	ORG $+1
$SG1632	DB	00H
	ORG $+3
$SG1640	DB	' redefined', 00H
_DATA	ENDS
_TEXT	SEGMENT
_temp$1624 = -48
_i$1625 = -44
_buf$ = 8
_limit$ = 12
_bp$ = -24
_symname$ = -16
_sym_length$ = -12
_hp$1634 = -52
_defn$ = -20
_arglengths$ = -8
_hashcode$ = -4
_msg$1639 = -56
_msg$1583 = -28
_arg_ptrs$1586 = -36
_argno$1587 = -32
_temp$1597 = -40
_do_define PROC NEAR
; Line 2820
	push	ebp
	mov	ebp, esp
	sub	esp, 56					; 00000038H
	push	ebx
	push	esi
	push	edi
; Line 2826
	mov	DWORD PTR _arglengths$[ebp], 0
; Line 2830
	mov	eax, DWORD PTR _buf$[ebp]
	mov	DWORD PTR _bp$[ebp], eax
; Line 2832
$L1574:
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	al, BYTE PTR _is_hor_space[eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L1575
; Line 2833
	inc	DWORD PTR _bp$[ebp]
	jmp	$L1574
$L1575:
; Line 2835
	mov	eax, DWORD PTR _bp$[ebp]
	mov	DWORD PTR _symname$[ebp], eax
; Line 2836
$L1577:
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	al, BYTE PTR _is_idchar[eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L1578
	mov	eax, DWORD PTR _limit$[ebp]
	cmp	DWORD PTR _bp$[ebp], eax
	jae	$L1578
; Line 2837
	inc	DWORD PTR _bp$[ebp]
; Line 2838
	jmp	$L1577
$L1578:
; Line 2839
	mov	eax, DWORD PTR _bp$[ebp]
	sub	eax, DWORD PTR _symname$[ebp]
	mov	DWORD PTR _sym_length$[ebp], eax
; Line 2840
	cmp	DWORD PTR _sym_length$[ebp], 0
	jne	$L1579
; Line 2841
	push	OFFSET $SG1580
	call	_error
	add	esp, 4
; Line 2842
	jmp	$L1581
$L1579:
	mov	eax, DWORD PTR _symname$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	al, BYTE PTR _is_idstart[eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	jne	$L1582
; Line 2844
	mov	eax, DWORD PTR _sym_length$[ebp]
	inc	eax
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _msg$1583[ebp], eax
; Line 2845
	mov	eax, DWORD PTR _sym_length$[ebp]
	push	eax
	mov	eax, DWORD PTR _msg$1583[ebp]
	push	eax
	mov	eax, DWORD PTR _symname$[ebp]
	push	eax
	call	_bcopy
	add	esp, 12					; 0000000cH
; Line 2846
	mov	eax, DWORD PTR _sym_length$[ebp]
	mov	ecx, DWORD PTR _msg$1583[ebp]
	mov	BYTE PTR [eax+ecx], 0
; Line 2847
	mov	eax, DWORD PTR _msg$1583[ebp]
	push	eax
	push	OFFSET $SG1584
	call	_error
	add	esp, 8
; Line 2854
$L1582:
$L1581:
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 40					; 00000028H
	jne	$L1585
; Line 2855
	mov	DWORD PTR _arg_ptrs$1586[ebp], 0
; Line 2856
	mov	DWORD PTR _argno$1587[ebp], 0
; Line 2858
	inc	DWORD PTR _bp$[ebp]
; Line 2859
$L1588:
$L1592:
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	al, BYTE PTR _is_hor_space[eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L1593
	inc	DWORD PTR _bp$[ebp]
	jmp	$L1592
$L1593:
$L1589:
$L1590:
; Line 2862
$L1595:
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 41					; 00000029H
	je	$L1596
; Line 2865
	push	16					; 00000010H
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _temp$1597[ebp], eax
; Line 2866
	mov	eax, DWORD PTR _bp$[ebp]
	mov	ecx, DWORD PTR _temp$1597[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 2867
	mov	eax, DWORD PTR _arg_ptrs$1586[ebp]
	mov	ecx, DWORD PTR _temp$1597[ebp]
	mov	DWORD PTR [ecx], eax
; Line 2868
	mov	eax, DWORD PTR _argno$1587[ebp]
	mov	ecx, DWORD PTR _temp$1597[ebp]
	mov	DWORD PTR [ecx+12], eax
	inc	DWORD PTR _argno$1587[ebp]
; Line 2869
	mov	eax, DWORD PTR _temp$1597[ebp]
	mov	DWORD PTR _arg_ptrs$1586[ebp], eax
; Line 2871
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	al, BYTE PTR _is_idstart[eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	jne	$L1598
; Line 2872
	push	OFFSET $SG1599
	call	_warning
	add	esp, 4
; Line 2875
$L1598:
$L1601:
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	al, BYTE PTR _is_idchar[eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L1602
; Line 2876
	inc	DWORD PTR _bp$[ebp]
; Line 2877
	jmp	$L1601
$L1602:
; Line 2878
	mov	eax, DWORD PTR _bp$[ebp]
	mov	ecx, DWORD PTR _temp$1597[ebp]
	sub	eax, DWORD PTR [ecx+4]
	mov	ecx, DWORD PTR _temp$1597[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 2879
	mov	eax, DWORD PTR _temp$1597[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 2
	add	DWORD PTR _arglengths$[ebp], eax
; Line 2880
$L1603:
$L1607:
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	al, BYTE PTR _is_hor_space[eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L1608
	inc	DWORD PTR _bp$[ebp]
	jmp	$L1607
$L1608:
$L1604:
$L1605:
; Line 2881
	mov	eax, DWORD PTR _temp$1597[ebp]
	cmp	DWORD PTR [eax+8], 0
	je	$L1610
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 44					; 0000002cH
	je	$L1609
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 41					; 00000029H
	je	$L1609
$L1610:
; Line 2882
	push	OFFSET $SG1611
	call	_error
	add	esp, 4
; Line 2883
	jmp	$nope$1612
; Line 2885
$L1609:
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 44					; 0000002cH
	jne	$L1613
; Line 2886
	inc	DWORD PTR _bp$[ebp]
; Line 2887
$L1614:
$L1618:
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	al, BYTE PTR _is_hor_space[eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L1619
	inc	DWORD PTR _bp$[ebp]
	jmp	$L1618
$L1619:
$L1615:
$L1616:
; Line 2889
$L1613:
	mov	eax, DWORD PTR _limit$[ebp]
	cmp	DWORD PTR _bp$[ebp], eax
	jb	$L1620
; Line 2890
	push	OFFSET $SG1621
	call	_error
	add	esp, 4
; Line 2891
	jmp	$nope$1612
; Line 2893
$L1620:
	jmp	$L1595
$L1596:
; Line 2895
	inc	DWORD PTR _bp$[ebp]
; Line 2897
	mov	eax, DWORD PTR _limit$[ebp]
	cmp	DWORD PTR _bp$[ebp], eax
	jae	$L1622
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 32					; 00000020H
	je	$L1623
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 9
	jne	$L1622
$L1623:
	inc	DWORD PTR _bp$[ebp]
; Line 2899
$L1622:
	mov	eax, DWORD PTR _arg_ptrs$1586[ebp]
	push	eax
	mov	eax, DWORD PTR _argno$1587[ebp]
	push	eax
	mov	eax, DWORD PTR _limit$[ebp]
	push	eax
	mov	eax, DWORD PTR _bp$[ebp]
	push	eax
	call	_collect_expansion
	add	esp, 16					; 00000010H
	mov	DWORD PTR _defn$[ebp], eax
; Line 2904
	mov	eax, DWORD PTR _arglengths$[ebp]
	inc	eax
	push	eax
	call	_xmalloc
	add	esp, 4
	mov	ecx, DWORD PTR _defn$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 2907
	mov	DWORD PTR _i$1625[ebp], 0
; Line 2908
	mov	eax, DWORD PTR _arg_ptrs$1586[ebp]
	mov	DWORD PTR _temp$1624[ebp], eax
	jmp	$L1626
$L1627:
	mov	eax, DWORD PTR _temp$1624[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _temp$1624[ebp], eax
$L1626:
	cmp	DWORD PTR _temp$1624[ebp], 0
	je	$L1628
; Line 2909
	mov	eax, DWORD PTR _temp$1624[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _defn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	add	eax, DWORD PTR _i$1625[ebp]
	push	eax
	mov	eax, DWORD PTR _temp$1624[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_bcopy
	add	esp, 12					; 0000000cH
; Line 2910
	mov	eax, DWORD PTR _temp$1624[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	DWORD PTR _i$1625[ebp], eax
; Line 2911
	mov	eax, DWORD PTR _temp$1624[ebp]
	cmp	DWORD PTR [eax], 0
	je	$L1629
; Line 2912
	mov	eax, DWORD PTR _defn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _i$1625[ebp]
	mov	BYTE PTR [eax+ecx], 44			; 0000002cH
	inc	DWORD PTR _i$1625[ebp]
; Line 2913
	mov	eax, DWORD PTR _defn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _i$1625[ebp]
	mov	BYTE PTR [eax+ecx], 32			; 00000020H
	inc	DWORD PTR _i$1625[ebp]
; Line 2915
$L1629:
	jmp	$L1627
$L1628:
; Line 2916
	mov	eax, DWORD PTR _defn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _i$1625[ebp]
	mov	BYTE PTR [eax+ecx], 0
; Line 2918
	jmp	$L1630
$L1585:
; Line 2920
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	al, BYTE PTR _is_hor_space[eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L1631
; Line 2921
	inc	DWORD PTR _bp$[ebp]
; Line 2923
$L1631:
	push	0
	push	-1
	mov	eax, DWORD PTR _limit$[ebp]
	push	eax
	mov	eax, DWORD PTR _bp$[ebp]
	push	eax
	call	_collect_expansion
	add	esp, 16					; 00000010H
	mov	DWORD PTR _defn$[ebp], eax
; Line 2924
	mov	eax, DWORD PTR _defn$[ebp]
	mov	DWORD PTR [eax+16], OFFSET $SG1632
; Line 2925
$L1630:
; Line 2927
	push	1403					; 0000057bH
	mov	eax, DWORD PTR _sym_length$[ebp]
	push	eax
	mov	eax, DWORD PTR _symname$[ebp]
	push	eax
	call	_hashf
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _hashcode$[ebp], eax
; Line 2931
	mov	eax, DWORD PTR _hashcode$[ebp]
	push	eax
	mov	eax, DWORD PTR _sym_length$[ebp]
	push	eax
	mov	eax, DWORD PTR _symname$[ebp]
	push	eax
	call	_lookup
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _hp$1634[ebp], eax
	cmp	DWORD PTR _hp$1634[ebp], 0
	je	$L1635
; Line 2933
	mov	eax, DWORD PTR _hp$1634[ebp]
	cmp	DWORD PTR [eax+12], 23			; 00000017H
	jne	$L1638
	mov	eax, DWORD PTR _hp$1634[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	mov	eax, DWORD PTR _defn$[ebp]
	push	eax
	call	_compare_defs
	add	esp, 8
	or	eax, eax
	je	$L1637
$L1638:
; Line 2935
	mov	eax, DWORD PTR _sym_length$[ebp]
	add	eax, 20					; 00000014H
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _msg$1639[ebp], eax
; Line 2936
	mov	eax, DWORD PTR _sym_length$[ebp]
	push	eax
	mov	eax, DWORD PTR _msg$1639[ebp]
	push	eax
	mov	eax, DWORD PTR _symname$[ebp]
	push	eax
	call	_bcopy
	add	esp, 12					; 0000000cH
; Line 2937
	push	OFFSET $SG1640
	mov	eax, DWORD PTR _sym_length$[ebp]
	add	eax, DWORD PTR _msg$1639[ebp]
	push	eax
	call	_strcpy
	add	esp, 8
; Line 2938
	mov	eax, DWORD PTR _msg$1639[ebp]
	push	eax
	call	_warning
	add	esp, 4
; Line 2941
$L1637:
	mov	eax, DWORD PTR _hp$1634[ebp]
	mov	DWORD PTR [eax+12], 23			; 00000017H
; Line 2942
	mov	eax, DWORD PTR _defn$[ebp]
	mov	ecx, DWORD PTR _hp$1634[ebp]
	mov	DWORD PTR [ecx+24], eax
; Line 2943
	jmp	$L1641
$L1635:
; Line 2944
	mov	eax, DWORD PTR _hashcode$[ebp]
	push	eax
	mov	eax, DWORD PTR _defn$[ebp]
	push	eax
	push	23					; 00000017H
	mov	eax, DWORD PTR _sym_length$[ebp]
	push	eax
	mov	eax, DWORD PTR _symname$[ebp]
	push	eax
	call	_install
	add	esp, 20					; 00000014H
$L1641:
; Line 2947
	sub	eax, eax
	jmp	$L1566
; Line 2949
$nope$1612:
; Line 2951
	mov	eax, 1
	jmp	$L1566
; Line 2952
$L1566:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_do_define ENDP
_TEXT	ENDS
PUBLIC	_comp_def_part
_TEXT	SEGMENT
_d1$ = 8
_d2$ = 12
_a1$ = -12
_a2$ = -16
_p1$ = -20
_p2$ = -8
_first$ = -4
_compare_defs PROC NEAR
; Line 2960
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	push	ebx
	push	esi
	push	edi
; Line 2962
	mov	eax, DWORD PTR _d1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _p1$[ebp], eax
; Line 2963
	mov	eax, DWORD PTR _d2$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _p2$[ebp], eax
; Line 2964
	mov	DWORD PTR _first$[ebp], 1
; Line 2966
	mov	eax, DWORD PTR _d2$[ebp]
	mov	ecx, DWORD PTR _d1$[ebp]
	mov	ecx, DWORD PTR [ecx]
	cmp	DWORD PTR [eax], ecx
	je	$L1650
; Line 2967
	mov	eax, 1
	jmp	$L1644
; Line 2968
$L1650:
	mov	eax, DWORD PTR _d2$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	mov	eax, DWORD PTR _d1$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	je	$L1651
; Line 2969
	mov	eax, 1
	jmp	$L1644
; Line 2970
$L1651:
; Line 2971
	mov	eax, DWORD PTR _d1$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _a1$[ebp], eax
	mov	eax, DWORD PTR _d2$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _a2$[ebp], eax
	jmp	$L1652
$L1653:
	mov	eax, DWORD PTR _a1$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _a1$[ebp], eax
	mov	eax, DWORD PTR _a2$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _a2$[ebp], eax
$L1652:
	cmp	DWORD PTR _a1$[ebp], 0
	je	$L1654
	cmp	DWORD PTR _a2$[ebp], 0
	je	$L1654
; Line 2977
	mov	eax, DWORD PTR _a2$[ebp]
	mov	ecx, DWORD PTR _a1$[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	cmp	DWORD PTR [eax+8], ecx
	jne	$L1659
	mov	eax, DWORD PTR _a1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _p2$[ebp]
	push	eax
	mov	eax, DWORD PTR _p1$[ebp]
	push	eax
	call	_strncmp
	add	esp, 12					; 0000000cH
	or	eax, eax
	je	$L1658
$L1659:
	push	0
	mov	eax, DWORD PTR _a2$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _p2$[ebp]
	push	eax
	mov	eax, DWORD PTR _a1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _p1$[ebp]
	push	eax
	mov	eax, DWORD PTR _first$[ebp]
	push	eax
	call	_comp_def_part
	add	esp, 24					; 00000018H
	or	eax, eax
	jne	$L1657
$L1658:
	mov	eax, DWORD PTR _a2$[ebp]
	mov	ecx, DWORD PTR _a1$[ebp]
	mov	ecx, DWORD PTR [ecx+12]
	cmp	DWORD PTR [eax+12], ecx
	jne	$L1657
	mov	eax, DWORD PTR _a1$[ebp]
	movsx	eax, BYTE PTR [eax+4]
	mov	ecx, DWORD PTR _a2$[ebp]
	movsx	ecx, BYTE PTR [ecx+4]
	cmp	eax, ecx
	jne	$L1657
	mov	eax, DWORD PTR _a2$[ebp]
	movsx	eax, BYTE PTR [eax+5]
	mov	ecx, DWORD PTR _a1$[ebp]
	movsx	ecx, BYTE PTR [ecx+5]
	cmp	eax, ecx
	jne	$L1657
	mov	eax, DWORD PTR _a2$[ebp]
	movsx	eax, BYTE PTR [eax+6]
	mov	ecx, DWORD PTR _a1$[ebp]
	movsx	ecx, BYTE PTR [ecx+6]
	cmp	eax, ecx
	je	$L1656
$L1657:
; Line 2978
	mov	eax, 1
	jmp	$L1644
; Line 2979
$L1656:
	mov	DWORD PTR _first$[ebp], 0
; Line 2980
	mov	eax, DWORD PTR _a1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	DWORD PTR _p1$[ebp], eax
; Line 2981
	mov	eax, DWORD PTR _a2$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	DWORD PTR _p2$[ebp], eax
; Line 2982
	jmp	$L1653
$L1654:
; Line 2983
	mov	eax, DWORD PTR _a1$[ebp]
	cmp	DWORD PTR _a2$[ebp], eax
	je	$L1660
; Line 2984
	mov	eax, 1
	jmp	$L1644
; Line 2985
$L1660:
; Line 2986
	push	1
	mov	eax, DWORD PTR _d2$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _p2$[ebp]
	mov	edx, DWORD PTR _d2$[ebp]
	sub	ecx, DWORD PTR [edx+8]
	sub	eax, ecx
	push	eax
	mov	eax, DWORD PTR _p2$[ebp]
	push	eax
	mov	eax, DWORD PTR _d1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _p1$[ebp]
	mov	edx, DWORD PTR _d1$[ebp]
	sub	ecx, DWORD PTR [edx+8]
	sub	eax, ecx
	push	eax
	mov	eax, DWORD PTR _p1$[ebp]
	push	eax
	mov	eax, DWORD PTR _first$[ebp]
	push	eax
	call	_comp_def_part
	add	esp, 24					; 00000018H
	or	eax, eax
	je	$L1661
; Line 2987
	mov	eax, 1
	jmp	$L1644
; Line 2988
$L1661:
	sub	eax, eax
	jmp	$L1644
; Line 2989
$L1644:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_compare_defs ENDP
_len1$ = 16
_beg2$ = 20
_len2$ = 24
_last$ = 28
_end1$ = -4
_end2$ = -8
_first$ = 8
_beg1$ = 12
_comp_def_part PROC NEAR
; Line 3005
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 3006
	mov	eax, DWORD PTR _len1$[ebp]
	add	eax, DWORD PTR _beg1$[ebp]
	mov	DWORD PTR _end1$[ebp], eax
; Line 3007
	mov	eax, DWORD PTR _len2$[ebp]
	add	eax, DWORD PTR _beg2$[ebp]
	mov	DWORD PTR _end2$[ebp], eax
; Line 3008
	cmp	DWORD PTR _first$[ebp], 0
	je	$L1671
; Line 3009
$L1673:
	mov	eax, DWORD PTR _beg1$[ebp]
	cmp	DWORD PTR _end1$[ebp], eax
	je	$L1674
	mov	eax, DWORD PTR _beg1$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	al, BYTE PTR _is_space[eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L1674
	inc	DWORD PTR _beg1$[ebp]
	jmp	$L1673
$L1674:
; Line 3010
$L1676:
	mov	eax, DWORD PTR _beg2$[ebp]
	cmp	DWORD PTR _end2$[ebp], eax
	je	$L1677
	mov	eax, DWORD PTR _beg2$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	al, BYTE PTR _is_space[eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L1677
	inc	DWORD PTR _beg2$[ebp]
	jmp	$L1676
$L1677:
; Line 3012
$L1671:
	cmp	DWORD PTR _last$[ebp], 0
	je	$L1678
; Line 3013
$L1680:
	mov	eax, DWORD PTR _beg1$[ebp]
	cmp	DWORD PTR _end1$[ebp], eax
	je	$L1681
	mov	eax, DWORD PTR _end1$[ebp]
	mov	al, BYTE PTR [eax-1]
	and	eax, 255				; 000000ffH
	mov	al, BYTE PTR _is_space[eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L1681
	dec	DWORD PTR _end1$[ebp]
	jmp	$L1680
$L1681:
; Line 3014
$L1683:
	mov	eax, DWORD PTR _beg2$[ebp]
	cmp	DWORD PTR _end2$[ebp], eax
	je	$L1684
	mov	eax, DWORD PTR _end2$[ebp]
	mov	al, BYTE PTR [eax-1]
	and	eax, 255				; 000000ffH
	mov	al, BYTE PTR _is_space[eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L1684
	dec	DWORD PTR _end2$[ebp]
	jmp	$L1683
$L1684:
; Line 3016
$L1678:
$L1686:
	mov	eax, DWORD PTR _beg1$[ebp]
	cmp	DWORD PTR _end1$[ebp], eax
	je	$L1687
	mov	eax, DWORD PTR _beg2$[ebp]
	cmp	DWORD PTR _end2$[ebp], eax
	je	$L1687
; Line 3017
	mov	eax, DWORD PTR _beg1$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	al, BYTE PTR _is_space[eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L1688
	mov	eax, DWORD PTR _beg2$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	al, BYTE PTR _is_space[eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L1688
; Line 3018
$L1690:
	mov	eax, DWORD PTR _beg1$[ebp]
	cmp	DWORD PTR _end1$[ebp], eax
	je	$L1691
	mov	eax, DWORD PTR _beg1$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	al, BYTE PTR _is_space[eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L1691
	inc	DWORD PTR _beg1$[ebp]
	jmp	$L1690
$L1691:
; Line 3019
$L1693:
	mov	eax, DWORD PTR _beg2$[ebp]
	cmp	DWORD PTR _end2$[ebp], eax
	je	$L1694
	mov	eax, DWORD PTR _beg2$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	al, BYTE PTR _is_space[eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L1694
	inc	DWORD PTR _beg2$[ebp]
	jmp	$L1693
$L1694:
; Line 3020
	jmp	$L1695
$L1688:
	mov	eax, DWORD PTR _beg2$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _beg1$[ebp]
	mov	cl, BYTE PTR [ecx]
	and	ecx, 255				; 000000ffH
	cmp	eax, ecx
	jne	$L1696
; Line 3021
	inc	DWORD PTR _beg1$[ebp]
	inc	DWORD PTR _beg2$[ebp]
; Line 3022
	jmp	$L1697
$L1696:
	jmp	$L1687
$L1697:
$L1695:
; Line 3023
	jmp	$L1686
$L1687:
; Line 3024
	mov	eax, DWORD PTR _beg1$[ebp]
	cmp	DWORD PTR _end1$[ebp], eax
	jne	$L2917
	mov	eax, DWORD PTR _beg2$[ebp]
	cmp	DWORD PTR _end2$[ebp], eax
	je	$L2915
$L2917:
	mov	eax, 1
	jmp	$L2916
$L2915:
	sub	eax, eax
$L2916:
	jmp	$L1668
; Line 3025
$L1668:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_comp_def_part ENDP
_TEXT	ENDS
PUBLIC	_xcalloc
_DATA	SEGMENT
	ORG $+1
$SG1762	DB	'# operator should be followed by a macro argument name', 0aH
	DB	00H
$SG1812	DB	'# operator should be followed by a macro argument name', 0aH
	DB	00H
_DATA	ENDS
_TEXT	SEGMENT
_tpat$1794 = -64
_p1$1798 = -68
_lim1$1807 = -72
_buf$ = 8
_end$ = 12
_nargs$ = 16
_arglist$ = 20
_defn$ = -24
_p$ = -8
_limit$ = -36
_lastp$ = -32
_exp_p$ = -20
_endpat$ = -4
_concat$ = -40
_stringify$ = -12
_maxsize$ = -28
_expected_delimiter$ = -16
_id_beg$1784 = -52
_id_len$1785 = -56
_arg$1790 = -60
_skipped_arg$1726 = -44
_c$1727 = -48
_collect_expansion PROC NEAR
; Line 3053
	push	ebp
	mov	ebp, esp
	sub	esp, 80					; 00000050H
	push	ebx
	push	esi
	push	edi
; Line 3056
	mov	DWORD PTR _endpat$[ebp], 0
; Line 3058
	mov	DWORD PTR _concat$[ebp], 0
; Line 3060
	mov	DWORD PTR _stringify$[ebp], 0
; Line 3062
	mov	DWORD PTR _expected_delimiter$[ebp], 0
; Line 3069
	mov	eax, DWORD PTR _buf$[ebp]
	cmp	DWORD PTR _end$[ebp], eax
	jae	$L1713
; Line 3070
	call	_abort
; Line 3074
$L1713:
	mov	eax, DWORD PTR _end$[ebp]
	mov	DWORD PTR _limit$[ebp], eax
; Line 3075
	mov	eax, DWORD PTR _buf$[ebp]
	mov	DWORD PTR _p$[ebp], eax
; Line 3076
$L1715:
	mov	eax, DWORD PTR _p$[ebp]
	cmp	DWORD PTR _limit$[ebp], eax
	jbe	$L1716
	mov	eax, DWORD PTR _limit$[ebp]
	mov	al, BYTE PTR [eax-1]
	and	eax, 255				; 000000ffH
	mov	al, BYTE PTR _is_space[eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L1716
	dec	DWORD PTR _limit$[ebp]
	jmp	$L1715
$L1716:
; Line 3077
$L1718:
	mov	eax, DWORD PTR _p$[ebp]
	cmp	DWORD PTR _limit$[ebp], eax
	jbe	$L1719
	mov	eax, DWORD PTR _p$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	al, BYTE PTR _is_space[eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L1719
	inc	DWORD PTR _p$[ebp]
	jmp	$L1718
$L1719:
; Line 3086
	mov	eax, DWORD PTR _end$[ebp]
	sub	eax, DWORD PTR _limit$[ebp]
	mov	ecx, DWORD PTR _p$[ebp]
	sub	ecx, DWORD PTR _buf$[ebp]
	add	ecx, ecx
	lea	eax, DWORD PTR [ecx+eax*2]
	sub	eax, DWORD PTR _p$[ebp]
	add	eax, DWORD PTR _limit$[ebp]
	add	eax, 23					; 00000017H
	mov	DWORD PTR _maxsize$[ebp], eax
; Line 3087
	mov	eax, DWORD PTR _maxsize$[ebp]
	push	eax
	push	1
	call	_xcalloc
	add	esp, 8
	mov	DWORD PTR _defn$[ebp], eax
; Line 3089
	mov	eax, DWORD PTR _nargs$[ebp]
	mov	ecx, DWORD PTR _defn$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 3090
	mov	eax, DWORD PTR _defn$[ebp]
	add	eax, 20					; 00000014H
	mov	ecx, DWORD PTR _defn$[ebp]
	mov	DWORD PTR [ecx+8], eax
	mov	eax, DWORD PTR _defn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _exp_p$[ebp], eax
; Line 3091
	mov	eax, DWORD PTR _exp_p$[ebp]
	mov	DWORD PTR _lastp$[ebp], eax
; Line 3093
	mov	eax, DWORD PTR _buf$[ebp]
	mov	DWORD PTR _p$[ebp], eax
; Line 3096
$L1721:
	mov	eax, DWORD PTR _p$[ebp]
	cmp	DWORD PTR _limit$[ebp], eax
	jbe	$L1722
	mov	eax, DWORD PTR _p$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	al, BYTE PTR _is_space[eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L1722
; Line 3097
	mov	eax, DWORD PTR _exp_p$[ebp]
	mov	BYTE PTR [eax], 10			; 0000000aH
	inc	DWORD PTR _exp_p$[ebp]
; Line 3098
	mov	eax, DWORD PTR _p$[ebp]
	mov	al, BYTE PTR [eax]
	mov	ecx, DWORD PTR _exp_p$[ebp]
	mov	BYTE PTR [ecx], al
	inc	DWORD PTR _p$[ebp]
	inc	DWORD PTR _exp_p$[ebp]
; Line 3099
	jmp	$L1721
$L1722:
; Line 3102
$L1724:
	mov	eax, DWORD PTR _p$[ebp]
	cmp	DWORD PTR _limit$[ebp], eax
	jbe	$L1725
; Line 3103
	mov	DWORD PTR _skipped_arg$1726[ebp], 0
; Line 3104
	mov	eax, DWORD PTR _p$[ebp]
	mov	al, BYTE PTR [eax]
	mov	BYTE PTR _c$1727[ebp], al
	inc	DWORD PTR _p$[ebp]
; Line 3106
	mov	al, BYTE PTR _c$1727[ebp]
	mov	ecx, DWORD PTR _exp_p$[ebp]
	mov	BYTE PTR [ecx], al
	inc	DWORD PTR _exp_p$[ebp]
; Line 3108
	cmp	DWORD PTR _traditional, 0
	jne	$L1728
; Line 3109
	xor	eax, eax
	mov	al, BYTE PTR _c$1727[ebp]
	mov	DWORD PTR -76+[ebp], eax
	jmp	$L1729
; Line 3110
$L1733:
; Line 3112
	jmp	$L1734
$L1735:
	inc	DWORD PTR _p$[ebp]
$L1734:
	mov	eax, DWORD PTR _p$[ebp]
	cmp	DWORD PTR _limit$[ebp], eax
	jbe	$L1736
	mov	eax, DWORD PTR _p$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	xor	ecx, ecx
	mov	cl, BYTE PTR _c$1727[ebp]
	cmp	eax, ecx
	je	$L1736
; Line 3113
	mov	eax, DWORD PTR _p$[ebp]
	mov	al, BYTE PTR [eax]
	mov	ecx, DWORD PTR _exp_p$[ebp]
	mov	BYTE PTR [ecx], al
	inc	DWORD PTR _exp_p$[ebp]
; Line 3114
	mov	eax, DWORD PTR _p$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 92					; 0000005cH
	jne	$L1737
; Line 3115
	inc	DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR _p$[ebp]
	mov	al, BYTE PTR [eax]
	mov	ecx, DWORD PTR _exp_p$[ebp]
	mov	BYTE PTR [ecx], al
	inc	DWORD PTR _exp_p$[ebp]
; Line 3117
$L1737:
	jmp	$L1735
$L1736:
; Line 3118
	mov	eax, DWORD PTR _p$[ebp]
	mov	al, BYTE PTR [eax]
	mov	ecx, DWORD PTR _exp_p$[ebp]
	mov	BYTE PTR [ecx], al
	inc	DWORD PTR _p$[ebp]
	inc	DWORD PTR _exp_p$[ebp]
; Line 3119
	jmp	$L1730
; Line 3125
$L1738:
; Line 3126
	mov	eax, DWORD PTR _p$[ebp]
	cmp	DWORD PTR _limit$[ebp], eax
	jbe	$L1739
	mov	eax, DWORD PTR _p$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L1739
; Line 3128
	dec	DWORD PTR _exp_p$[ebp]
; Line 3129
	mov	eax, DWORD PTR _p$[ebp]
	mov	al, BYTE PTR [eax]
	mov	ecx, DWORD PTR _exp_p$[ebp]
	mov	BYTE PTR [ecx], al
	inc	DWORD PTR _p$[ebp]
	inc	DWORD PTR _exp_p$[ebp]
; Line 3130
	jmp	$L1740
$L1739:
	mov	eax, DWORD PTR _p$[ebp]
	cmp	DWORD PTR _limit$[ebp], eax
	jbe	$L1741
; Line 3132
	mov	eax, DWORD PTR _p$[ebp]
	mov	al, BYTE PTR [eax]
	mov	ecx, DWORD PTR _exp_p$[ebp]
	mov	BYTE PTR [ecx], al
	inc	DWORD PTR _p$[ebp]
	inc	DWORD PTR _exp_p$[ebp]
; Line 3134
$L1741:
$L1740:
	jmp	$L1730
; Line 3136
$L1742:
; Line 3137
	mov	eax, DWORD PTR _p$[ebp]
	cmp	DWORD PTR _limit$[ebp], eax
	jbe	$L1743
	mov	eax, DWORD PTR _p$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L1743
; Line 3140
	dec	DWORD PTR _exp_p$[ebp]
; Line 3141
$L1745:
	mov	eax, DWORD PTR _lastp$[ebp]
	cmp	DWORD PTR _exp_p$[ebp], eax
	jbe	$L1746
	mov	eax, DWORD PTR _exp_p$[ebp]
	mov	al, BYTE PTR [eax-1]
	and	eax, 255				; 000000ffH
	mov	al, BYTE PTR _is_hor_space[eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L1746
; Line 3142
	dec	DWORD PTR _exp_p$[ebp]
	jmp	$L1745
$L1746:
; Line 3144
	inc	DWORD PTR _p$[ebp]
; Line 3146
$L1747:
$L1751:
	mov	eax, DWORD PTR _p$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	al, BYTE PTR _is_hor_space[eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L1752
	inc	DWORD PTR _p$[ebp]
	jmp	$L1751
$L1752:
$L1748:
$L1749:
; Line 3147
	mov	eax, DWORD PTR _p$[ebp]
	mov	DWORD PTR _concat$[ebp], eax
; Line 3148
	jmp	$L1753
$L1743:
; Line 3151
	dec	DWORD PTR _exp_p$[ebp]
; Line 3152
$L1754:
$L1758:
	mov	eax, DWORD PTR _p$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	al, BYTE PTR _is_hor_space[eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L1759
	inc	DWORD PTR _p$[ebp]
	jmp	$L1758
$L1759:
$L1755:
$L1756:
; Line 3153
	mov	eax, DWORD PTR _p$[ebp]
	cmp	DWORD PTR _limit$[ebp], eax
	je	$L1761
	mov	eax, DWORD PTR _p$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	al, BYTE PTR _is_idstart[eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L1761
	cmp	DWORD PTR _nargs$[ebp], 0
	jg	$L1760
$L1761:
; Line 3154
	push	OFFSET $SG1762
	call	_error
	add	esp, 4
; Line 3155
	jmp	$L1763
$L1760:
; Line 3156
	mov	eax, DWORD PTR _p$[ebp]
	mov	DWORD PTR _stringify$[ebp], eax
$L1763:
; Line 3157
$L1753:
; Line 3158
	jmp	$L1730
; Line 3159
	jmp	$L1730
$L1729:
	cmp	DWORD PTR -76+[ebp], 34			; 00000022H
	je	$L1734
	cmp	DWORD PTR -76+[ebp], 35			; 00000023H
	je	$L1742
	cmp	DWORD PTR -76+[ebp], 39			; 00000027H
	je	$L1734
	cmp	DWORD PTR -76+[ebp], 92			; 0000005cH
	je	$L1738
	jmp	$L1730
$L1730:
; Line 3160
	jmp	$L1764
$L1728:
; Line 3165
	xor	eax, eax
	mov	al, BYTE PTR _c$1727[ebp]
	mov	DWORD PTR -80+[ebp], eax
	jmp	$L1765
; Line 3166
$L1769:
; Line 3168
	cmp	DWORD PTR _expected_delimiter$[ebp], 0
	je	$L1770
; Line 3169
	xor	eax, eax
	mov	al, BYTE PTR _c$1727[ebp]
	cmp	eax, DWORD PTR _expected_delimiter$[ebp]
	jne	$L1771
; Line 3170
	mov	DWORD PTR _expected_delimiter$[ebp], 0
; Line 3171
$L1771:
	jmp	$L1772
$L1770:
; Line 3172
	xor	eax, eax
	mov	al, BYTE PTR _c$1727[ebp]
	mov	DWORD PTR _expected_delimiter$[ebp], eax
$L1772:
; Line 3173
	jmp	$L1766
; Line 3175
$L1773:
; Line 3178
	cmp	DWORD PTR _expected_delimiter$[ebp], 0
	je	$L1774
	mov	eax, DWORD PTR _p$[ebp]
	cmp	DWORD PTR _limit$[ebp], eax
	jbe	$L1774
	mov	eax, DWORD PTR _p$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, DWORD PTR _expected_delimiter$[ebp]
	je	$L1775
	mov	eax, DWORD PTR _p$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 92					; 0000005cH
	jne	$L1774
$L1775:
; Line 3179
	mov	eax, DWORD PTR _p$[ebp]
	mov	al, BYTE PTR [eax]
	mov	ecx, DWORD PTR _exp_p$[ebp]
	mov	BYTE PTR [ecx], al
	inc	DWORD PTR _p$[ebp]
	inc	DWORD PTR _exp_p$[ebp]
; Line 3180
	jmp	$L1724
; Line 3182
$L1774:
	jmp	$L1766
; Line 3184
$L1776:
; Line 3185
	cmp	DWORD PTR _expected_delimiter$[ebp], 0
	je	$L1777
; Line 3186
	jmp	$L1766
; Line 3187
$L1777:
	mov	eax, DWORD PTR _p$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 42					; 0000002aH
	jne	$L1778
; Line 3191
	dec	DWORD PTR _exp_p$[ebp]
; Line 3192
	inc	DWORD PTR _p$[ebp]
; Line 3193
$L1780:
	mov	eax, DWORD PTR _p$[ebp]
	cmp	DWORD PTR _limit$[ebp], eax
	jbe	$L1781
	mov	eax, DWORD PTR _p$[ebp]
	mov	al, BYTE PTR [eax-2]
	and	eax, 255				; 000000ffH
	cmp	eax, 42					; 0000002aH
	jne	$L1782
	mov	eax, DWORD PTR _p$[ebp]
	mov	al, BYTE PTR [eax-1]
	and	eax, 255				; 000000ffH
	cmp	eax, 47					; 0000002fH
	je	$L1781
$L1782:
; Line 3194
	inc	DWORD PTR _p$[ebp]
	jmp	$L1780
$L1781:
; Line 3196
	mov	eax, DWORD PTR _p$[ebp]
	mov	DWORD PTR _concat$[ebp], eax
; Line 3198
$L1778:
	jmp	$L1766
; Line 3199
	jmp	$L1766
$L1765:
	cmp	DWORD PTR -80+[ebp], 34			; 00000022H
	je	$L1769
	cmp	DWORD PTR -80+[ebp], 39			; 00000027H
	je	$L1769
	cmp	DWORD PTR -80+[ebp], 47			; 0000002fH
	je	$L1776
	cmp	DWORD PTR -80+[ebp], 92			; 0000005cH
	je	$L1773
	jmp	$L1766
$L1766:
; Line 3200
$L1764:
; Line 3202
	xor	eax, eax
	mov	al, BYTE PTR _c$1727[ebp]
	mov	al, BYTE PTR _is_idchar[eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L1783
	cmp	DWORD PTR _nargs$[ebp], 0
	jle	$L1783
; Line 3203
	mov	eax, DWORD PTR _p$[ebp]
	dec	eax
	mov	DWORD PTR _id_beg$1784[ebp], eax
; Line 3206
	dec	DWORD PTR _exp_p$[ebp]
; Line 3207
$L1787:
	mov	eax, DWORD PTR _p$[ebp]
	cmp	DWORD PTR _limit$[ebp], eax
	je	$L1788
	mov	eax, DWORD PTR _p$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	al, BYTE PTR _is_idchar[eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L1788
	inc	DWORD PTR _p$[ebp]
	jmp	$L1787
$L1788:
; Line 3208
	mov	eax, DWORD PTR _p$[ebp]
	sub	eax, DWORD PTR _id_beg$1784[ebp]
	mov	DWORD PTR _id_len$1785[ebp], eax
; Line 3210
	xor	eax, eax
	mov	al, BYTE PTR _c$1727[ebp]
	mov	al, BYTE PTR _is_idstart[eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L1789
; Line 3213
	mov	eax, DWORD PTR _arglist$[ebp]
	mov	DWORD PTR _arg$1790[ebp], eax
	jmp	$L1791
$L1792:
	mov	eax, DWORD PTR _arg$1790[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _arg$1790[ebp], eax
$L1791:
	cmp	DWORD PTR _arg$1790[ebp], 0
	je	$L1793
; Line 3218
	mov	eax, DWORD PTR _arg$1790[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	xor	ecx, ecx
	mov	cl, BYTE PTR _c$1727[ebp]
	cmp	eax, ecx
	jne	$L1795
	mov	eax, DWORD PTR _arg$1790[ebp]
	mov	ecx, DWORD PTR _id_len$1785[ebp]
	cmp	DWORD PTR [eax+8], ecx
	jne	$L1795
	mov	eax, DWORD PTR _id_len$1785[ebp]
	push	eax
	mov	eax, DWORD PTR _id_beg$1784[ebp]
	push	eax
	mov	eax, DWORD PTR _arg$1790[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_strncmp
	add	esp, 12					; 0000000cH
	or	eax, eax
	jne	$L1795
; Line 3221
	push	16					; 00000010H
	call	_xmalloc
	add	esp, 4
	mov	DWORD PTR _tpat$1794[ebp], eax
; Line 3222
	mov	eax, DWORD PTR _tpat$1794[ebp]
	mov	DWORD PTR [eax], 0
; Line 3223
	mov	eax, DWORD PTR _concat$[ebp]
	sub	eax, DWORD PTR _id_beg$1784[ebp]
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	mov	ecx, DWORD PTR _tpat$1794[ebp]
	mov	BYTE PTR [ecx+5], al
; Line 3224
	mov	eax, DWORD PTR _tpat$1794[ebp]
	mov	BYTE PTR [eax+6], 0
; Line 3226
	cmp	DWORD PTR _traditional, 0
	je	$L2918
	cmp	DWORD PTR _expected_delimiter$[ebp], 1
	sbb	eax, eax
	inc	eax
	mov	ecx, DWORD PTR _tpat$1794[ebp]
	mov	BYTE PTR [ecx+4], al
	jmp	$L2919
$L2918:
	mov	eax, DWORD PTR _id_beg$1784[ebp]
	sub	eax, DWORD PTR _stringify$[ebp]
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	mov	ecx, DWORD PTR _tpat$1794[ebp]
	mov	BYTE PTR [ecx+4], al
$L2919:
; Line 3228
	cmp	DWORD PTR _endpat$[ebp], 0
	jne	$L1796
; Line 3229
	mov	eax, DWORD PTR _tpat$1794[ebp]
	mov	ecx, DWORD PTR _defn$[ebp]
	mov	DWORD PTR [ecx+12], eax
; Line 3230
	jmp	$L1797
$L1796:
; Line 3231
	mov	eax, DWORD PTR _tpat$1794[ebp]
	mov	ecx, DWORD PTR _endpat$[ebp]
	mov	DWORD PTR [ecx], eax
$L1797:
; Line 3232
	mov	eax, DWORD PTR _tpat$1794[ebp]
	mov	DWORD PTR _endpat$[ebp], eax
; Line 3234
	mov	eax, DWORD PTR _arg$1790[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	ecx, DWORD PTR _tpat$1794[ebp]
	mov	DWORD PTR [ecx+12], eax
; Line 3235
	mov	eax, DWORD PTR _exp_p$[ebp]
	sub	eax, DWORD PTR _lastp$[ebp]
	mov	ecx, DWORD PTR _tpat$1794[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 3237
	mov	eax, DWORD PTR _p$[ebp]
	mov	DWORD PTR _p1$1798[ebp], eax
; Line 3238
$L1799:
$L1803:
	mov	eax, DWORD PTR _p1$1798[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	al, BYTE PTR _is_hor_space[eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L1804
	inc	DWORD PTR _p1$1798[ebp]
	jmp	$L1803
$L1804:
$L1800:
$L1801:
; Line 3239
	mov	eax, DWORD PTR _p1$1798[ebp]
	add	eax, 2
	cmp	eax, DWORD PTR _limit$[ebp]
	ja	$L1805
	mov	eax, DWORD PTR _p1$1798[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L1805
	mov	eax, DWORD PTR _p1$1798[ebp]
	mov	al, BYTE PTR [eax+1]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L1805
; Line 3240
	mov	eax, DWORD PTR _tpat$1794[ebp]
	mov	BYTE PTR [eax+6], 1
; Line 3241
$L1805:
; Line 3242
	mov	eax, DWORD PTR _exp_p$[ebp]
	mov	DWORD PTR _lastp$[ebp], eax
; Line 3243
	mov	DWORD PTR _skipped_arg$1726[ebp], 1
; Line 3244
	jmp	$L1793
; Line 3246
$L1795:
	jmp	$L1792
$L1793:
; Line 3250
$L1789:
	cmp	DWORD PTR _skipped_arg$1726[ebp], 0
	jne	$L1806
; Line 3251
	mov	eax, DWORD PTR _p$[ebp]
	mov	DWORD PTR _lim1$1807[ebp], eax
; Line 3252
	mov	eax, DWORD PTR _id_beg$1784[ebp]
	mov	DWORD PTR _p$[ebp], eax
; Line 3253
$L1809:
	mov	eax, DWORD PTR _lim1$1807[ebp]
	cmp	DWORD PTR _p$[ebp], eax
	je	$L1810
; Line 3254
	mov	eax, DWORD PTR _p$[ebp]
	mov	al, BYTE PTR [eax]
	mov	ecx, DWORD PTR _exp_p$[ebp]
	mov	BYTE PTR [ecx], al
	inc	DWORD PTR _p$[ebp]
	inc	DWORD PTR _exp_p$[ebp]
	jmp	$L1809
$L1810:
; Line 3255
	mov	eax, DWORD PTR _stringify$[ebp]
	cmp	DWORD PTR _id_beg$1784[ebp], eax
	jne	$L1811
; Line 3256
	push	OFFSET $SG1812
	call	_error
	add	esp, 4
; Line 3257
$L1811:
; Line 3258
$L1806:
; Line 3259
$L1783:
	jmp	$L1724
$L1725:
; Line 3261
	mov	eax, DWORD PTR _end$[ebp]
	cmp	DWORD PTR _limit$[ebp], eax
	jae	$L1813
; Line 3263
$L1815:
	mov	eax, DWORD PTR _end$[ebp]
	cmp	DWORD PTR _limit$[ebp], eax
	jae	$L1816
	mov	eax, DWORD PTR _limit$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	al, BYTE PTR _is_space[eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L1816
; Line 3264
	mov	eax, DWORD PTR _exp_p$[ebp]
	mov	BYTE PTR [eax], 10			; 0000000aH
	inc	DWORD PTR _exp_p$[ebp]
; Line 3265
	mov	eax, DWORD PTR _limit$[ebp]
	mov	al, BYTE PTR [eax]
	mov	ecx, DWORD PTR _exp_p$[ebp]
	mov	BYTE PTR [ecx], al
	inc	DWORD PTR _limit$[ebp]
	inc	DWORD PTR _exp_p$[ebp]
; Line 3266
	jmp	$L1815
$L1816:
; Line 3267
	jmp	$L1817
$L1813:
	cmp	DWORD PTR _traditional, 0
	jne	$L1818
; Line 3269
	mov	eax, DWORD PTR _exp_p$[ebp]
	mov	BYTE PTR [eax], 10			; 0000000aH
	inc	DWORD PTR _exp_p$[ebp]
; Line 3270
	mov	eax, DWORD PTR _exp_p$[ebp]
	mov	BYTE PTR [eax], 32			; 00000020H
	inc	DWORD PTR _exp_p$[ebp]
; Line 3273
$L1818:
$L1817:
	mov	eax, DWORD PTR _exp_p$[ebp]
	mov	BYTE PTR [eax], 0
; Line 3275
	mov	eax, DWORD PTR _exp_p$[ebp]
	mov	ecx, DWORD PTR _defn$[ebp]
	sub	eax, DWORD PTR [ecx+8]
	mov	ecx, DWORD PTR _defn$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 3278
	mov	eax, DWORD PTR _defn$[ebp]
	mov	eax, DWORD PTR [eax+4]
	inc	eax
	cmp	eax, DWORD PTR _maxsize$[ebp]
	jle	$L1819
; Line 3279
	call	_abort
; Line 3287
$L1819:
	mov	eax, DWORD PTR _defn$[ebp]
	jmp	$L1702
; Line 3288
$L1702:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_collect_expansion ENDP
_TEXT	ENDS
EXTRN	_atoi:NEAR
_BSS	SEGMENT
_?fname_table@?6??do_line@@9@9$S1851 DD 025H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG1837	DB	'invalid format #line command', 00H
	ORG $+3
$SG1842	DB	'invalid format #line command', 00H
	ORG $+3
$SG1860	DB	'invalid format #line command', 00H
	ORG $+3
$SG1872	DB	'invalid format #line command', 00H
	ORG $+3
$SG1880	DB	'invalid format #line command', 00H
	ORG $+3
$SG1888	DB	'invalid format #line command', 00H
_DATA	ENDS
_TEXT	SEGMENT
_buf$ = 8
_limit$ = 12
_op$ = 16
_bp$ = -48
_ip$ = -44
_tem$ = -40
_new_lineno$ = -8
_file_change$ = -4
$T2920 = -96
_hp$1852 = -56
_hash_bucket$1853 = -60
_fname$1854 = -52
_fname_length$1855 = -64
_do_line PROC NEAR
; Line 3300
	push	ebp
	mov	ebp, esp
	sub	esp, 104				; 00000068H
	push	ebx
	push	esi
	push	edi
; Line 3302
	mov	eax, DWORD PTR _indepth
	shl	eax, 5
	add	eax, OFFSET _instack
	mov	DWORD PTR _ip$[ebp], eax
; Line 3305
	mov	DWORD PTR _file_change$[ebp], 0
; Line 3308
	push	0
	mov	eax, DWORD PTR _limit$[ebp]
	push	eax
	mov	eax, DWORD PTR _buf$[ebp]
	push	eax
	lea	eax, DWORD PTR $T2920[ebp]
	push	eax
	call	_expand_to_temp_buffer
	add	esp, 16					; 00000010H
	lea	edi, DWORD PTR _tem$[ebp]
	mov	esi, eax
	mov	ecx, 8
	rep	movsd
; Line 3311
	mov	eax, DWORD PTR _tem$[ebp+12]
	mov	DWORD PTR _bp$[ebp], eax
; Line 3312
$L1830:
$L1834:
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	al, BYTE PTR _is_hor_space[eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L1835
	inc	DWORD PTR _bp$[ebp]
	jmp	$L1834
$L1835:
$L1831:
$L1832:
; Line 3314
	cmp	DWORD PTR ___mb_cur_max, 1
	jle	$L2921
	push	4
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	push	eax
	call	__isctype
	add	esp, 8
	mov	DWORD PTR -100+[ebp], eax
	jmp	$L2922
$L2921:
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR __pctype
	mov	ax, WORD PTR [ecx+eax*2]
	and	eax, 4
	mov	DWORD PTR -100+[ebp], eax
$L2922:
	cmp	DWORD PTR -100+[ebp], 0
	jne	$L1836
; Line 3315
	push	OFFSET $SG1837
	call	_error
	add	esp, 4
; Line 3316
	jmp	$L1824
; Line 3322
$L1836:
	mov	eax, DWORD PTR _bp$[ebp]
	push	eax
	call	_atoi
	add	esp, 4
	dec	eax
	mov	DWORD PTR _new_lineno$[ebp], eax
; Line 3325
$L1839:
	cmp	DWORD PTR ___mb_cur_max, 1
	jle	$L2923
	push	4
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	push	eax
	call	__isctype
	add	esp, 8
	mov	DWORD PTR -104+[ebp], eax
	jmp	$L2924
$L2923:
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR __pctype
	mov	ax, WORD PTR [ecx+eax*2]
	and	eax, 4
	mov	DWORD PTR -104+[ebp], eax
$L2924:
	cmp	DWORD PTR -104+[ebp], 0
	je	$L1840
; Line 3326
	inc	DWORD PTR _bp$[ebp]
	jmp	$L1839
$L1840:
; Line 3327
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L1841
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	al, BYTE PTR _is_space[eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	jne	$L1841
; Line 3328
	push	OFFSET $SG1842
	call	_error
	add	esp, 4
; Line 3329
	jmp	$L1824
; Line 3332
$L1841:
$L1843:
$L1847:
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	al, BYTE PTR _is_hor_space[eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L1848
	inc	DWORD PTR _bp$[ebp]
	jmp	$L1847
$L1848:
$L1844:
$L1845:
; Line 3334
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 34					; 00000022H
	jne	$L1849
; Line 3340
	inc	DWORD PTR _bp$[ebp]
	mov	eax, DWORD PTR _bp$[ebp]
	mov	DWORD PTR _fname$1854[ebp], eax
; Line 3342
$L1857:
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L1858
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 34					; 00000022H
	je	$L1858
; Line 3343
	inc	DWORD PTR _bp$[ebp]
	jmp	$L1857
$L1858:
; Line 3344
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 34					; 00000022H
	je	$L1859
; Line 3345
	push	OFFSET $SG1860
	call	_error
	add	esp, 4
; Line 3346
	jmp	$L1824
; Line 3349
$L1859:
	mov	eax, DWORD PTR _bp$[ebp]
	sub	eax, DWORD PTR _fname$1854[ebp]
	mov	DWORD PTR _fname_length$1855[ebp], eax
; Line 3351
	inc	DWORD PTR _bp$[ebp]
; Line 3352
$L1861:
$L1865:
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	al, BYTE PTR _is_hor_space[eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L1866
	inc	DWORD PTR _bp$[ebp]
	jmp	$L1865
$L1866:
$L1862:
$L1863:
; Line 3353
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L1867
; Line 3354
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 49					; 00000031H
	jne	$L1868
; Line 3355
	mov	DWORD PTR _file_change$[ebp], 1
; Line 3356
	jmp	$L1869
$L1868:
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 50					; 00000032H
	jne	$L1870
; Line 3357
	mov	DWORD PTR _file_change$[ebp], 2
; Line 3358
	jmp	$L1871
$L1870:
; Line 3359
	push	OFFSET $SG1872
	call	_error
	add	esp, 4
; Line 3360
	jmp	$L1824
; Line 3361
$L1871:
$L1869:
; Line 3363
	inc	DWORD PTR _bp$[ebp]
; Line 3364
$L1873:
$L1877:
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	al, BYTE PTR _is_hor_space[eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L1878
	inc	DWORD PTR _bp$[ebp]
	jmp	$L1877
$L1878:
$L1874:
$L1875:
; Line 3365
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L1879
; Line 3366
	push	OFFSET $SG1880
	call	_error
	add	esp, 4
; Line 3367
	jmp	$L1824
; Line 3369
$L1879:
; Line 3371
$L1867:
; Line 3372
	push	37					; 00000025H
	mov	eax, DWORD PTR _fname_length$1855[ebp]
	push	eax
	mov	eax, DWORD PTR _fname$1854[ebp]
	push	eax
	call	_hashf
	add	esp, 12					; 0000000cH
	lea	eax, DWORD PTR _?fname_table@?6??do_line@@9@9$S1851[eax*4]
	mov	DWORD PTR _hash_bucket$1853[ebp], eax
; Line 3373
	mov	eax, DWORD PTR _hash_bucket$1853[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _hp$1852[ebp], eax
	jmp	$L1881
$L1882:
	mov	eax, DWORD PTR _hp$1852[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _hp$1852[ebp], eax
$L1881:
	cmp	DWORD PTR _hp$1852[ebp], 0
	je	$L1883
; Line 3375
	mov	eax, DWORD PTR _hp$1852[ebp]
	mov	ecx, DWORD PTR _fname_length$1855[ebp]
	cmp	DWORD PTR [eax+16], ecx
	jne	$L1884
	mov	eax, DWORD PTR _fname_length$1855[ebp]
	push	eax
	mov	eax, DWORD PTR _fname$1854[ebp]
	push	eax
	mov	eax, DWORD PTR _hp$1852[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_strncmp
	add	esp, 12					; 0000000cH
	or	eax, eax
	jne	$L1884
; Line 3376
	mov	eax, DWORD PTR _hp$1852[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	ecx, DWORD PTR _ip$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 3377
	jmp	$L1883
; Line 3379
$L1884:
	jmp	$L1882
$L1883:
	cmp	DWORD PTR _hp$1852[ebp], 0
	jne	$L1885
; Line 3381
	mov	eax, DWORD PTR _fname_length$1855[ebp]
	add	eax, 29					; 0000001dH
	push	eax
	push	1
	call	_xcalloc
	add	esp, 8
	mov	DWORD PTR _hp$1852[ebp], eax
; Line 3382
	mov	eax, DWORD PTR _hash_bucket$1853[ebp]
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _hp$1852[ebp]
	mov	DWORD PTR [ecx], eax
; Line 3383
	mov	eax, DWORD PTR _hp$1852[ebp]
	mov	ecx, DWORD PTR _hash_bucket$1853[ebp]
	mov	DWORD PTR [ecx], eax
; Line 3385
	mov	eax, DWORD PTR _fname_length$1855[ebp]
	mov	ecx, DWORD PTR _hp$1852[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 3386
	mov	eax, DWORD PTR _hp$1852[ebp]
	add	eax, 28					; 0000001cH
	mov	ecx, DWORD PTR _hp$1852[ebp]
	mov	DWORD PTR [ecx+24], eax
	mov	eax, DWORD PTR _hp$1852[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	ecx, DWORD PTR _ip$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 3387
	mov	eax, DWORD PTR _fname_length$1855[ebp]
	push	eax
	mov	eax, DWORD PTR _hp$1852[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	mov	eax, DWORD PTR _fname$1854[ebp]
	push	eax
	call	_bcopy
	add	esp, 12					; 0000000cH
; Line 3389
$L1885:
	jmp	$L1886
$L1849:
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L1887
; Line 3390
	push	OFFSET $SG1888
	call	_error
	add	esp, 4
; Line 3391
	jmp	$L1824
; Line 3394
$L1887:
$L1886:
	mov	eax, DWORD PTR _new_lineno$[ebp]
	mov	ecx, DWORD PTR _ip$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 3395
	mov	eax, DWORD PTR _file_change$[ebp]
	push	eax
	push	0
	mov	eax, DWORD PTR _op$[ebp]
	push	eax
	mov	eax, DWORD PTR _ip$[ebp]
	push	eax
	call	_output_line_command
	add	esp, 16					; 00000010H
; Line 3396
	mov	eax, DWORD PTR _ip$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _ip$[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	mov	edx, DWORD PTR _ip$[ebp]
	sub	ecx, DWORD PTR [edx+12]
	sub	eax, ecx
	mov	ecx, DWORD PTR _op$[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	mov	edx, DWORD PTR _op$[ebp]
	mov	edx, DWORD PTR [edx+16]
	mov	ebx, DWORD PTR _op$[ebp]
	sub	edx, DWORD PTR [ebx+12]
	sub	ecx, edx
	cmp	eax, ecx
	jge	$L2925
	jmp	$L2926
$L2925:
	mov	eax, DWORD PTR _ip$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _ip$[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	mov	edx, DWORD PTR _ip$[ebp]
	sub	ecx, DWORD PTR [edx+12]
	sub	eax, ecx
	push	eax
	mov	eax, DWORD PTR _op$[ebp]
	push	eax
	call	_grow_outbuf
	add	esp, 8
$L2926:
; Line 3397
$L1824:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_do_line ENDP
_TEXT	ENDS
PUBLIC	_delete_macro
_DATA	SEGMENT
	ORG $+3
$SG1905	DB	'undefining `%s''', 00H
_DATA	ENDS
_TEXT	SEGMENT
_buf$ = 8
_hp$ = -4
_do_undef PROC NEAR
; Line 3408
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 3411
$L1895:
$L1899:
	mov	eax, DWORD PTR _buf$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	al, BYTE PTR _is_hor_space[eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L1900
	inc	DWORD PTR _buf$[ebp]
	jmp	$L1899
$L1900:
$L1896:
$L1897:
; Line 3413
$L1902:
	push	-1
	push	-1
	mov	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_lookup
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _hp$[ebp], eax
	cmp	DWORD PTR _hp$[ebp], 0
	je	$L1903
; Line 3414
	mov	eax, DWORD PTR _hp$[ebp]
	cmp	DWORD PTR [eax+12], 23			; 00000017H
	je	$L1904
; Line 3415
	mov	eax, DWORD PTR _hp$[ebp]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	push	OFFSET $SG1905
	call	_error
	add	esp, 8
; Line 3416
$L1904:
	mov	eax, DWORD PTR _hp$[ebp]
	push	eax
	call	_delete_macro
	add	esp, 4
; Line 3417
	jmp	$L1902
$L1903:
; Line 3418
$L1893:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_do_undef ENDP
_TEXT	ENDS
_DATA	SEGMENT
$SG1920	DB	'#error %s', 00H
_DATA	ENDS
_TEXT	SEGMENT
_buf$ = 8
_limit$ = 12
_length$ = -4
_copy$ = -8
_do_error PROC NEAR
; Line 3429
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 3430
	mov	eax, DWORD PTR _limit$[ebp]
	sub	eax, DWORD PTR _buf$[ebp]
	mov	DWORD PTR _length$[ebp], eax
; Line 3431
	mov	eax, DWORD PTR _length$[ebp]
	inc	eax
	push	eax
	call	_xmalloc
	add	esp, 4
	mov	DWORD PTR _copy$[ebp], eax
; Line 3432
	mov	eax, DWORD PTR _length$[ebp]
	push	eax
	mov	eax, DWORD PTR _copy$[ebp]
	push	eax
	mov	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_bcopy
	add	esp, 12					; 0000000cH
; Line 3433
	mov	eax, DWORD PTR _length$[ebp]
	mov	ecx, DWORD PTR _copy$[ebp]
	mov	BYTE PTR [eax+ecx], 0
; Line 3434
$L1914:
$L1918:
	mov	eax, DWORD PTR _copy$[ebp]
	movsx	eax, BYTE PTR [eax]
	mov	al, BYTE PTR _is_hor_space[eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L1919
	inc	DWORD PTR _copy$[ebp]
	jmp	$L1918
$L1919:
$L1915:
$L1916:
; Line 3435
	mov	eax, DWORD PTR _copy$[ebp]
	push	eax
	push	OFFSET $SG1920
	call	_error
	add	esp, 8
; Line 3436
	push	33					; 00000021H
	call	_exit
	add	esp, 4
; Line 3437
$L1911:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_do_error ENDP
_TEXT	ENDS
PUBLIC	_do_once
_TEXT	SEGMENT
_i$ = -4
_ip$ = -8
_new$1929 = -12
_do_once PROC NEAR
; Line 3443
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 3445
	mov	DWORD PTR _ip$[ebp], 0
; Line 3447
	mov	eax, DWORD PTR _indepth
	mov	DWORD PTR _i$[ebp], eax
	jmp	$L1924
$L1925:
	dec	DWORD PTR _i$[ebp]
$L1924:
	cmp	DWORD PTR _i$[ebp], 0
	jl	$L1926
; Line 3448
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	cmp	DWORD PTR _instack[eax], 0
	je	$L1927
; Line 3449
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	add	eax, OFFSET _instack
	mov	DWORD PTR _ip$[ebp], eax
; Line 3450
	jmp	$L1926
; Line 3453
$L1927:
	jmp	$L1925
$L1926:
	cmp	DWORD PTR _ip$[ebp], 0
	je	$L1928
; Line 3457
	push	8
	call	_xmalloc
	add	esp, 4
	mov	DWORD PTR _new$1929[ebp], eax
; Line 3458
	mov	eax, DWORD PTR _dont_repeat_files
	mov	ecx, DWORD PTR _new$1929[ebp]
	mov	DWORD PTR [ecx], eax
; Line 3459
	mov	eax, DWORD PTR _new$1929[ebp]
	mov	DWORD PTR _dont_repeat_files, eax
; Line 3460
	mov	eax, DWORD PTR _ip$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_savestring
	add	esp, 4
	mov	ecx, DWORD PTR _new$1929[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 3462
$L1928:
$L1921:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_do_once ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+2
$SG1938	DB	'once', 00H
_DATA	ENDS
_TEXT	SEGMENT
_buf$ = 8
_do_pragma PROC NEAR
; Line 3469
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 3470
$L1934:
	mov	eax, DWORD PTR _buf$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 32					; 00000020H
	je	$L1936
	mov	eax, DWORD PTR _buf$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 9
	jne	$L1935
$L1936:
; Line 3471
	inc	DWORD PTR _buf$[ebp]
	jmp	$L1934
$L1935:
; Line 3472
	push	4
	push	OFFSET $SG1938
	mov	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_strncmp
	add	esp, 12					; 0000000cH
	or	eax, eax
	jne	$L1937
; Line 3473
	call	_do_once
; Line 3474
$L1937:
$L1932:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_do_pragma ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+3
$SG1941	DB	'ANSI C does not allow #sccs', 00H
_DATA	ENDS
_TEXT	SEGMENT
_do_sccs PROC NEAR
; Line 3503
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 3504
	cmp	DWORD PTR _pedantic, 0
	je	$L1940
; Line 3505
	push	OFFSET $SG1941
	call	_error
	add	esp, 4
; Line 3506
$L1940:
$L1939:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_do_sccs ENDP
_TEXT	ENDS
PUBLIC	_conditional_skip
PUBLIC	_eval_if_expression
_TEXT	SEGMENT
_buf$ = 8
_limit$ = 12
_value$ = -8
_ip$ = -4
_do_if	PROC NEAR
; Line 3525
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 3527
	mov	eax, DWORD PTR _indepth
	shl	eax, 5
	add	eax, OFFSET _instack
	mov	DWORD PTR _ip$[ebp], eax
; Line 3529
	mov	eax, DWORD PTR _limit$[ebp]
	sub	eax, DWORD PTR _buf$[ebp]
	push	eax
	mov	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_eval_if_expression
	add	esp, 8
	mov	DWORD PTR _value$[ebp], eax
; Line 3530
	push	5
	cmp	DWORD PTR _value$[ebp], 1
	sbb	eax, eax
	neg	eax
	push	eax
	mov	eax, DWORD PTR _ip$[ebp]
	push	eax
	call	_conditional_skip
	add	esp, 12					; 0000000cH
; Line 3531
$L1946:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_do_if	ENDP
_TEXT	ENDS
_DATA	SEGMENT
$SG1958	DB	'#elif not within a conditional', 00H
	ORG $+1
$SG1961	DB	'#elif after #else', 00H
	ORG $+2
$SG1962	DB	' (matches line %d', 00H
	ORG $+2
$SG1964	DB	', file %s', 00H
	ORG $+2
$SG1965	DB	')', 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_buf$ = 8
_limit$ = 12
_op$ = 16
_value$ = -8
_ip$ = -4
_do_elif PROC NEAR
; Line 3542
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 3544
	mov	eax, DWORD PTR _indepth
	shl	eax, 5
	add	eax, OFFSET _instack
	mov	DWORD PTR _ip$[ebp], eax
; Line 3546
	mov	eax, DWORD PTR _indepth
	shl	eax, 5
	mov	ecx, DWORD PTR _if_stack
	cmp	DWORD PTR _instack[eax+24], ecx
	jne	$L1957
; Line 3547
	push	OFFSET $SG1958
	call	_error
	add	esp, 4
; Line 3548
	jmp	$L1954
; Line 3549
	jmp	$L1959
$L1957:
; Line 3550
	mov	eax, DWORD PTR _if_stack
	cmp	DWORD PTR [eax+16], 5
	je	$L1960
	mov	eax, DWORD PTR _if_stack
	cmp	DWORD PTR [eax+16], 8
	je	$L1960
; Line 3551
	push	OFFSET $SG1961
	call	_error
	add	esp, 4
; Line 3552
	mov	eax, DWORD PTR _if_stack
	mov	eax, DWORD PTR [eax+8]
	push	eax
	push	OFFSET $SG1962
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 3554
	mov	eax, DWORD PTR _if_stack
	cmp	DWORD PTR [eax+4], 0
	je	$L1963
	mov	eax, DWORD PTR _ip$[ebp]
	cmp	DWORD PTR [eax], 0
	je	$L1963
	mov	eax, DWORD PTR _ip$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	mov	eax, DWORD PTR _if_stack
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	je	$L1963
; Line 3555
	mov	eax, DWORD PTR _if_stack
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	OFFSET $SG1964
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 3556
$L1963:
	push	OFFSET $SG1965
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 8
; Line 3558
$L1960:
	mov	eax, DWORD PTR _if_stack
	mov	DWORD PTR [eax+16], 8
; Line 3559
$L1959:
; Line 3561
	mov	eax, DWORD PTR _if_stack
	cmp	DWORD PTR [eax+12], 0
	je	$L1966
; Line 3562
	push	0
	mov	eax, DWORD PTR _ip$[ebp]
	push	eax
	call	_skip_if_group
	add	esp, 8
; Line 3563
	jmp	$L1967
$L1966:
; Line 3564
	mov	eax, DWORD PTR _limit$[ebp]
	sub	eax, DWORD PTR _buf$[ebp]
	push	eax
	mov	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_eval_if_expression
	add	esp, 8
	mov	DWORD PTR _value$[ebp], eax
; Line 3565
	cmp	DWORD PTR _value$[ebp], 0
	jne	$L1968
; Line 3566
	push	0
	mov	eax, DWORD PTR _ip$[ebp]
	push	eax
	call	_skip_if_group
	add	esp, 8
; Line 3567
	jmp	$L1969
$L1968:
; Line 3568
	mov	eax, DWORD PTR _if_stack
	inc	DWORD PTR [eax+12]
; Line 3569
	push	0
	push	1
	mov	eax, DWORD PTR _op$[ebp]
	push	eax
	mov	eax, DWORD PTR _ip$[ebp]
	push	eax
	call	_output_line_command
	add	esp, 16					; 00000010H
; Line 3570
$L1969:
; Line 3571
$L1967:
; Line 3572
$L1954:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_do_elif ENDP
_TEXT	ENDS
EXTRN	_parse_c_expression:NEAR
_DATA	SEGMENT
	ORG $+1
$SG1976	DB	'defined', 00H
_DATA	ENDS
_TEXT	SEGMENT
$T2927 = -72
_buf$ = 8
_length$ = 12
_temp_obuf$ = -36
_save_defined$ = -4
_value$ = -40
_eval_if_expression PROC NEAR
; Line 3582
	push	ebp
	mov	ebp, esp
	sub	esp, 72					; 00000048H
	push	ebx
	push	esi
	push	edi
; Line 3587
	push	-1
	push	0
	push	25					; 00000019H
	push	-1
	push	OFFSET $SG1976
	call	_install
	add	esp, 20					; 00000014H
	mov	DWORD PTR _save_defined$[ebp], eax
; Line 3588
	push	0
	mov	eax, DWORD PTR _length$[ebp]
	add	eax, DWORD PTR _buf$[ebp]
	push	eax
	mov	eax, DWORD PTR _buf$[ebp]
	push	eax
	lea	eax, DWORD PTR $T2927[ebp]
	push	eax
	call	_expand_to_temp_buffer
	add	esp, 16					; 00000010H
	lea	edi, DWORD PTR _temp_obuf$[ebp]
	mov	esi, eax
	mov	ecx, 8
	rep	movsd
; Line 3589
	mov	eax, DWORD PTR _save_defined$[ebp]
	push	eax
	call	_delete_macro
	add	esp, 4
; Line 3591
	mov	eax, DWORD PTR _temp_obuf$[ebp+12]
	push	eax
	call	_parse_c_expression
	add	esp, 4
	mov	DWORD PTR _value$[ebp], eax
; Line 3593
	mov	eax, DWORD PTR _temp_obuf$[ebp+12]
	push	eax
	call	_free
	add	esp, 4
; Line 3595
	mov	eax, DWORD PTR _value$[ebp]
	jmp	$L1972
; Line 3596
$L1972:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_eval_if_expression ENDP
_TEXT	ENDS
_DATA	SEGMENT
$SG2000	DB	'#%s with no argument', 00H
	ORG $+3
$SG2001	DB	'#%s argument starts with punctuation', 00H
	ORG $+3
$SG2004	DB	'#%s argument starts with a digit', 00H
	ORG $+3
$SG2007	DB	'garbage at end of #%s argument', 00H
_DATA	ENDS
_TEXT	SEGMENT
_ip$ = -12
_end$ = -8
_buf$ = 8
_limit$ = 12
_keyword$ = 20
_skip$ = -4
_do_xifdef PROC NEAR
; Line 3607
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 3609
	mov	eax, DWORD PTR _indepth
	shl	eax, 5
	add	eax, OFFSET _instack
	mov	DWORD PTR _ip$[ebp], eax
; Line 3613
$L1986:
$L1990:
	mov	eax, DWORD PTR _buf$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	al, BYTE PTR _is_hor_space[eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L1991
	inc	DWORD PTR _buf$[ebp]
	jmp	$L1990
$L1991:
$L1987:
$L1988:
; Line 3614
$L1993:
	mov	eax, DWORD PTR _buf$[ebp]
	cmp	DWORD PTR _limit$[ebp], eax
	je	$L1994
	mov	eax, DWORD PTR _limit$[ebp]
	mov	al, BYTE PTR [eax-1]
	and	eax, 255				; 000000ffH
	mov	al, BYTE PTR _is_hor_space[eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L1994
	dec	DWORD PTR _limit$[ebp]
	jmp	$L1993
$L1994:
; Line 3617
	mov	eax, DWORD PTR _buf$[ebp]
	mov	DWORD PTR _end$[ebp], eax
	jmp	$L1995
$L1996:
	inc	DWORD PTR _end$[ebp]
$L1995:
	mov	eax, DWORD PTR _end$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	al, BYTE PTR _is_idchar[eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L1997
	jmp	$L1996
$L1997:
; Line 3619
	mov	eax, DWORD PTR _end$[ebp]
	cmp	DWORD PTR _buf$[ebp], eax
	jne	$L1998
; Line 3620
	mov	eax, DWORD PTR _keyword$[ebp]
	mov	eax, DWORD PTR [eax+12]
	sub	eax, 3
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	mov	DWORD PTR _skip$[ebp], eax
; Line 3621
	cmp	DWORD PTR _traditional, 0
	jne	$L1999
; Line 3624
	mov	eax, DWORD PTR _keyword$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, OFFSET $SG2000
	mov	ecx, DWORD PTR _end$[ebp]
	cmp	DWORD PTR _limit$[ebp], ecx
	je	$L2928
	mov	eax, OFFSET $SG2001
$L2928:
	push	eax
	call	_warning
	add	esp, 8
; Line 3625
$L1999:
	jmp	$L2002
$L1998:
; Line 3626
	cmp	DWORD PTR _pedantic, 0
	je	$L2003
	mov	eax, DWORD PTR _buf$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 48					; 00000030H
	jl	$L2003
	mov	eax, DWORD PTR _buf$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 57					; 00000039H
	jg	$L2003
; Line 3627
	mov	eax, DWORD PTR _keyword$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	push	OFFSET $SG2004
	call	_warning
	add	esp, 8
; Line 3628
	jmp	$L2005
$L2003:
	mov	eax, DWORD PTR _end$[ebp]
	cmp	DWORD PTR _limit$[ebp], eax
	je	$L2006
	cmp	DWORD PTR _traditional, 0
	jne	$L2006
; Line 3629
	mov	eax, DWORD PTR _keyword$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	push	OFFSET $SG2007
	call	_warning
	add	esp, 8
; Line 3631
$L2006:
$L2005:
	push	-1
	mov	eax, DWORD PTR _end$[ebp]
	sub	eax, DWORD PTR _buf$[ebp]
	push	eax
	mov	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_lookup
	add	esp, 12					; 0000000cH
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	mov	ecx, DWORD PTR _keyword$[ebp]
	mov	ecx, DWORD PTR [ecx+12]
	sub	ecx, 4
	cmp	ecx, 1
	sbb	ecx, ecx
	neg	ecx
	xor	eax, ecx
	mov	DWORD PTR _skip$[ebp], eax
; Line 3632
$L2002:
; Line 3634
	push	5
	mov	eax, DWORD PTR _skip$[ebp]
	push	eax
	mov	eax, DWORD PTR _ip$[ebp]
	push	eax
	call	_conditional_skip
	add	esp, 12					; 0000000cH
; Line 3635
$L1982:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_do_xifdef ENDP
_ip$ = 8
_skip$ = 12
_type$ = 16
_temp$ = -4
_conditional_skip PROC NEAR
; Line 3645
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 3648
	push	20					; 00000014H
	push	1
	call	_xcalloc
	add	esp, 8
	mov	DWORD PTR _temp$[ebp], eax
; Line 3649
	mov	eax, DWORD PTR _ip$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _temp$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 3650
	mov	eax, DWORD PTR _ip$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _temp$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 3651
	mov	eax, DWORD PTR _if_stack
	mov	ecx, DWORD PTR _temp$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 3652
	mov	eax, DWORD PTR _temp$[ebp]
	mov	DWORD PTR _if_stack, eax
; Line 3654
	mov	eax, DWORD PTR _type$[ebp]
	mov	ecx, DWORD PTR _if_stack
	mov	DWORD PTR [ecx+16], eax
; Line 3656
	cmp	DWORD PTR _skip$[ebp], 0
	je	$L2013
; Line 3657
	push	0
	mov	eax, DWORD PTR _ip$[ebp]
	push	eax
	call	_skip_if_group
	add	esp, 8
; Line 3658
	jmp	$L2011
; Line 3659
	jmp	$L2014
$L2013:
; Line 3660
	mov	eax, DWORD PTR _if_stack
	inc	DWORD PTR [eax+12]
; Line 3661
	push	0
	push	1
	push	OFFSET _outbuf
	mov	eax, DWORD PTR _ip$[ebp]
	push	eax
	call	_output_line_command
	add	esp, 16					; 00000010H
; Line 3662
$L2014:
; Line 3663
$L2011:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_conditional_skip ENDP
_TEXT	ENDS
PUBLIC	_validate_else
_DATA	SEGMENT
	ORG $+1
$SG2092	DB	'#%s not within a conditional', 00H
	ORG $+3
$SG2097	DB	'#else or #elif after #else', 00H
_DATA	ENDS
_TEXT	SEGMENT
_temp$2079 = -28
_ip$ = 8
_any$ = 12
_bp$ = -24
_cp$ = -16
_endb$ = -12
_kt$ = -4
_save_if_stack$ = -20
_beg_of_line$ = -8
_skip_if_group PROC NEAR
; Line 3674
	push	ebp
	mov	ebp, esp
	sub	esp, 44					; 0000002cH
	push	ebx
	push	esi
	push	edi
; Line 3675
	mov	eax, DWORD PTR _ip$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _bp$[ebp], eax
; Line 3676
	mov	eax, DWORD PTR _ip$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _ip$[ebp]
	add	eax, DWORD PTR [ecx+12]
	mov	DWORD PTR _endb$[ebp], eax
; Line 3678
	mov	eax, DWORD PTR _if_stack
	mov	DWORD PTR _save_if_stack$[ebp], eax
; Line 3679
	mov	eax, DWORD PTR _bp$[ebp]
	mov	DWORD PTR _beg_of_line$[ebp], eax
; Line 3681
$L2025:
	mov	eax, DWORD PTR _bp$[ebp]
	cmp	DWORD PTR _endb$[ebp], eax
	jbe	$L2026
; Line 3682
	mov	eax, DWORD PTR _bp$[ebp]
	mov	DWORD PTR -32+[ebp], eax
	inc	DWORD PTR _bp$[ebp]
	mov	eax, DWORD PTR -32+[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR -40+[ebp], eax
	jmp	$L2027
; Line 3683
$L2031:
; Line 3684
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 92					; 0000005cH
	jne	$L2032
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax+1]
	and	eax, 255				; 000000ffH
	cmp	eax, 10					; 0000000aH
	jne	$L2032
; Line 3685
	mov	eax, DWORD PTR _bp$[ebp]
	push	eax
	call	_newline_fix
	add	esp, 4
; Line 3686
$L2032:
; Line 3687
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 42					; 0000002aH
	je	$L2034
	cmp	DWORD PTR _cplusplus, 0
	je	$L2033
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 47					; 0000002fH
	jne	$L2033
$L2034:
; Line 3688
	inc	DWORD PTR _bp$[ebp]
	mov	eax, DWORD PTR _bp$[ebp]
	mov	ecx, DWORD PTR _ip$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 3689
	mov	eax, DWORD PTR _ip$[ebp]
	add	eax, 4
	push	eax
	mov	eax, DWORD PTR _ip$[ebp]
	push	eax
	call	_skip_to_end_of_comment
	add	esp, 8
	mov	DWORD PTR _bp$[ebp], eax
; Line 3691
$L2033:
	jmp	$L2028
; Line 3692
$L2035:
; Line 3694
	push	0
	push	0
	mov	eax, DWORD PTR _ip$[ebp]
	add	eax, 4
	push	eax
	mov	eax, DWORD PTR _ip$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _endb$[ebp]
	push	eax
	mov	eax, DWORD PTR _bp$[ebp]
	dec	eax
	push	eax
	call	_skip_quoted_string
	add	esp, 24					; 00000018H
	mov	DWORD PTR _bp$[ebp], eax
; Line 3695
	jmp	$L2028
; Line 3696
$L2036:
; Line 3698
	mov	eax, DWORD PTR _bp$[ebp]
	cmp	DWORD PTR _endb$[ebp], eax
	jbe	$L2037
; Line 3699
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 10					; 0000000aH
	jne	$L2038
; Line 3700
	mov	eax, DWORD PTR _ip$[ebp]
	inc	DWORD PTR [eax+4]
; Line 3701
$L2038:
	inc	DWORD PTR _bp$[ebp]
; Line 3703
$L2037:
	jmp	$L2028
; Line 3704
$L2039:
; Line 3705
	mov	eax, DWORD PTR _ip$[ebp]
	inc	DWORD PTR [eax+4]
; Line 3706
	mov	eax, DWORD PTR _bp$[ebp]
	mov	DWORD PTR _beg_of_line$[ebp], eax
; Line 3707
	jmp	$L2028
; Line 3708
$L2040:
; Line 3709
	mov	eax, DWORD PTR _bp$[ebp]
	dec	eax
	mov	ecx, DWORD PTR _ip$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 3712
	cmp	DWORD PTR _beg_of_line$[ebp], 0
	jne	$L2041
; Line 3713
	jmp	$L2028
; Line 3717
$L2041:
	mov	eax, DWORD PTR _beg_of_line$[ebp]
	mov	DWORD PTR _bp$[ebp], eax
; Line 3718
$L2043:
; Line 3719
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	al, BYTE PTR _is_hor_space[eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L2045
; Line 3720
	inc	DWORD PTR _bp$[ebp]
; Line 3721
	jmp	$L2046
$L2045:
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 92					; 0000005cH
	jne	$L2047
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax+1]
	and	eax, 255				; 000000ffH
	cmp	eax, 10					; 0000000aH
	jne	$L2047
; Line 3722
	add	DWORD PTR _bp$[ebp], 2
; Line 3723
	jmp	$L2048
$L2047:
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 47					; 0000002fH
	jne	$L2049
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax+1]
	and	eax, 255				; 000000ffH
	cmp	eax, 42					; 0000002aH
	jne	$L2049
; Line 3724
	add	DWORD PTR _bp$[ebp], 2
; Line 3725
$L2051:
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 42					; 0000002aH
	jne	$L2053
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax+1]
	and	eax, 255				; 000000ffH
	cmp	eax, 47					; 0000002fH
	je	$L2052
$L2053:
; Line 3726
	inc	DWORD PTR _bp$[ebp]
	jmp	$L2051
$L2052:
; Line 3727
	add	DWORD PTR _bp$[ebp], 2
; Line 3729
	jmp	$L2054
$L2049:
	cmp	DWORD PTR _cplusplus, 0
	je	$L2055
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 47					; 0000002fH
	jne	$L2055
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax+1]
	and	eax, 255				; 000000ffH
	cmp	eax, 47					; 0000002fH
	jne	$L2055
; Line 3730
	add	DWORD PTR _bp$[ebp], 2
; Line 3731
$L2057:
	mov	eax, DWORD PTR _bp$[ebp]
	mov	DWORD PTR -36+[ebp], eax
	inc	DWORD PTR _bp$[ebp]
	mov	eax, DWORD PTR -36+[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 10					; 0000000aH
	je	$L2058
	jmp	$L2057
$L2058:
; Line 3733
	jmp	$L2059
$L2055:
	jmp	$L2044
$L2059:
$L2054:
$L2048:
$L2046:
; Line 3734
	jmp	$L2043
$L2044:
; Line 3735
	mov	eax, DWORD PTR _ip$[ebp]
	mov	ecx, DWORD PTR _bp$[ebp]
	cmp	DWORD PTR [eax+16], ecx
	je	$L2060
; Line 3736
	mov	eax, DWORD PTR _ip$[ebp]
	mov	eax, DWORD PTR [eax+16]
	inc	eax
	mov	DWORD PTR _bp$[ebp], eax
; Line 3737
	jmp	$L2028
; Line 3740
$L2060:
	mov	eax, DWORD PTR _ip$[ebp]
	mov	eax, DWORD PTR [eax+16]
	inc	eax
	mov	DWORD PTR _bp$[ebp], eax
; Line 3743
$L2062:
; Line 3744
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	al, BYTE PTR _is_hor_space[eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L2064
; Line 3745
	inc	DWORD PTR _bp$[ebp]
; Line 3746
	jmp	$L2065
$L2064:
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 92					; 0000005cH
	jne	$L2066
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax+1]
	and	eax, 255				; 000000ffH
	cmp	eax, 10					; 0000000aH
	jne	$L2066
; Line 3747
	add	DWORD PTR _bp$[ebp], 2
; Line 3748
	jmp	$L2067
$L2066:
	jmp	$L2063
$L2067:
$L2065:
; Line 3749
	jmp	$L2062
$L2063:
; Line 3751
	mov	eax, DWORD PTR _bp$[ebp]
	mov	DWORD PTR _cp$[ebp], eax
; Line 3757
$L2069:
; Line 3758
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	al, BYTE PTR _is_idchar[eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L2071
; Line 3759
	inc	DWORD PTR _bp$[ebp]
; Line 3760
	jmp	$L2072
$L2071:
; Line 3761
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 92					; 0000005cH
	jne	$L2073
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax+1]
	and	eax, 255				; 000000ffH
	cmp	eax, 10					; 0000000aH
	jne	$L2073
; Line 3762
	mov	eax, DWORD PTR _bp$[ebp]
	push	eax
	call	_name_newline_fix
	add	esp, 4
; Line 3763
$L2073:
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	al, BYTE PTR _is_idchar[eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L2074
; Line 3764
	inc	DWORD PTR _bp$[ebp]
; Line 3765
	jmp	$L2075
$L2074:
	jmp	$L2070
$L2075:
; Line 3766
$L2072:
; Line 3767
	jmp	$L2069
$L2070:
; Line 3769
	mov	DWORD PTR _kt$[ebp], OFFSET _directive_table
	jmp	$L2076
$L2077:
	add	DWORD PTR _kt$[ebp], 20			; 00000014H
$L2076:
	mov	eax, DWORD PTR _kt$[ebp]
	cmp	DWORD PTR [eax], 0
	jl	$L2078
; Line 3772
	mov	eax, DWORD PTR _kt$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	mov	eax, DWORD PTR _kt$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _cp$[ebp]
	push	eax
	call	_strncmp
	add	esp, 12					; 0000000cH
	or	eax, eax
	jne	$L2080
	mov	eax, DWORD PTR _kt$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _cp$[ebp]
	mov	al, BYTE PTR [eax+ecx]
	and	eax, 255				; 000000ffH
	mov	al, BYTE PTR _is_idchar[eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	jne	$L2080
; Line 3776
	cmp	DWORD PTR _any$[ebp], 0
	je	$L2081
; Line 3777
	jmp	$L2017
; Line 3779
$L2081:
	mov	eax, DWORD PTR _kt$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR -44+[ebp], eax
	jmp	$L2082
; Line 3780
$L2086:
; Line 3783
	push	20					; 00000014H
	push	1
	call	_xcalloc
	add	esp, 8
	mov	DWORD PTR _temp$2079[ebp], eax
; Line 3784
	mov	eax, DWORD PTR _if_stack
	mov	ecx, DWORD PTR _temp$2079[ebp]
	mov	DWORD PTR [ecx], eax
; Line 3785
	mov	eax, DWORD PTR _temp$2079[ebp]
	mov	DWORD PTR _if_stack, eax
; Line 3786
	mov	eax, DWORD PTR _ip$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _temp$2079[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 3787
	mov	eax, DWORD PTR _ip$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _temp$2079[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 3788
	mov	eax, DWORD PTR _kt$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	ecx, DWORD PTR _temp$2079[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 3789
	jmp	$L2083
; Line 3790
$L2087:
; Line 3792
	cmp	DWORD PTR _pedantic, 0
	je	$L2088
	mov	eax, DWORD PTR _save_if_stack$[ebp]
	cmp	DWORD PTR _if_stack, eax
	je	$L2088
; Line 3793
	mov	eax, DWORD PTR _bp$[ebp]
	push	eax
	call	_validate_else
	add	esp, 4
; Line 3794
$L2088:
$L2090:
; Line 3795
	mov	eax, DWORD PTR _indepth
	shl	eax, 5
	mov	ecx, DWORD PTR _if_stack
	cmp	DWORD PTR _instack[eax+24], ecx
	jne	$L2091
; Line 3796
	mov	eax, DWORD PTR _kt$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	push	OFFSET $SG2092
	call	_error
	add	esp, 8
; Line 3797
	jmp	$L2083
; Line 3799
	jmp	$L2093
$L2091:
	mov	eax, DWORD PTR _save_if_stack$[ebp]
	cmp	DWORD PTR _if_stack, eax
	jne	$L2094
; Line 3800
	jmp	$L2017
; Line 3802
$L2094:
$L2093:
	mov	eax, DWORD PTR _kt$[ebp]
	cmp	DWORD PTR [eax+12], 12			; 0000000cH
	je	$L2095
; Line 3803
	mov	eax, DWORD PTR _if_stack
	cmp	DWORD PTR [eax+16], 6
	jne	$L2096
; Line 3804
	push	OFFSET $SG2097
	call	_error
	add	esp, 4
; Line 3805
$L2096:
	mov	eax, DWORD PTR _kt$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	ecx, DWORD PTR _if_stack
	mov	DWORD PTR [ecx+16], eax
; Line 3806
	jmp	$L2083
; Line 3809
$L2095:
	mov	eax, DWORD PTR _if_stack
	mov	DWORD PTR _temp$2079[ebp], eax
; Line 3810
	mov	eax, DWORD PTR _if_stack
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _if_stack, eax
; Line 3811
	mov	eax, DWORD PTR _temp$2079[ebp]
	push	eax
	call	_free
	add	esp, 4
; Line 3812
	jmp	$L2083
; Line 3813
	jmp	$L2083
$L2082:
	cmp	DWORD PTR -44+[ebp], 3
	jl	$L2083
	cmp	DWORD PTR -44+[ebp], 5
	jle	$L2086
	cmp	DWORD PTR -44+[ebp], 6
	je	$L2087
	cmp	DWORD PTR -44+[ebp], 8
	je	$L2090
	cmp	DWORD PTR -44+[ebp], 12			; 0000000cH
	je	$L2087
	jmp	$L2083
$L2083:
; Line 3814
	jmp	$L2078
; Line 3816
$L2080:
	jmp	$L2077
$L2078:
; Line 3817
	jmp	$L2028
$L2027:
	cmp	DWORD PTR -40+[ebp], 39			; 00000027H
	jg	$L2929
	je	$L2035
	cmp	DWORD PTR -40+[ebp], 10			; 0000000aH
	je	$L2039
	cmp	DWORD PTR -40+[ebp], 34			; 00000022H
	je	$L2035
	cmp	DWORD PTR -40+[ebp], 35			; 00000023H
	je	$L2040
	jmp	$L2028
$L2929:
	cmp	DWORD PTR -40+[ebp], 47			; 0000002fH
	je	$L2031
	cmp	DWORD PTR -40+[ebp], 92			; 0000005cH
	je	$L2036
	jmp	$L2028
$L2028:
; Line 3818
	jmp	$L2025
$L2026:
; Line 3819
	mov	eax, DWORD PTR _bp$[ebp]
	mov	ecx, DWORD PTR _ip$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 3823
$L2017:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_skip_if_group ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2112	DB	'text following #else violates ANSI standard', 00H
$SG2114	DB	'#else not within a conditional', 00H
	ORG $+1
$SG2117	DB	'#else after #else', 00H
	ORG $+2
$SG2118	DB	' (matches line %d', 00H
	ORG $+2
$SG2120	DB	', file %s', 00H
	ORG $+2
$SG2121	DB	')', 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_buf$ = 8
_limit$ = 12
_op$ = 16
_ip$ = -4
_do_else PROC NEAR
; Line 3835
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 3836
	mov	eax, DWORD PTR _indepth
	shl	eax, 5
	add	eax, OFFSET _instack
	mov	DWORD PTR _ip$[ebp], eax
; Line 3838
	cmp	DWORD PTR _pedantic, 0
	je	$L2104
; Line 3839
$L2105:
$L2109:
	mov	eax, DWORD PTR _buf$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	al, BYTE PTR _is_hor_space[eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L2110
	inc	DWORD PTR _buf$[ebp]
	jmp	$L2109
$L2110:
$L2106:
$L2107:
; Line 3840
	mov	eax, DWORD PTR _buf$[ebp]
	cmp	DWORD PTR _limit$[ebp], eax
	je	$L2111
; Line 3841
	push	OFFSET $SG2112
	call	_warning
	add	esp, 4
; Line 3842
$L2111:
; Line 3844
$L2104:
	mov	eax, DWORD PTR _indepth
	shl	eax, 5
	mov	ecx, DWORD PTR _if_stack
	cmp	DWORD PTR _instack[eax+24], ecx
	jne	$L2113
; Line 3845
	push	OFFSET $SG2114
	call	_error
	add	esp, 4
; Line 3846
	jmp	$L2102
; Line 3847
	jmp	$L2115
$L2113:
; Line 3848
	mov	eax, DWORD PTR _if_stack
	cmp	DWORD PTR [eax+16], 5
	je	$L2116
	mov	eax, DWORD PTR _if_stack
	cmp	DWORD PTR [eax+16], 8
	je	$L2116
; Line 3849
	push	OFFSET $SG2117
	call	_error
	add	esp, 4
; Line 3850
	mov	eax, DWORD PTR _if_stack
	mov	eax, DWORD PTR [eax+8]
	push	eax
	push	OFFSET $SG2118
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 3851
	mov	eax, DWORD PTR _ip$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	mov	eax, DWORD PTR _if_stack
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	je	$L2119
; Line 3852
	mov	eax, DWORD PTR _if_stack
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	OFFSET $SG2120
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 3853
$L2119:
	push	OFFSET $SG2121
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 8
; Line 3855
$L2116:
	mov	eax, DWORD PTR _if_stack
	mov	DWORD PTR [eax+16], 6
; Line 3856
$L2115:
; Line 3858
	mov	eax, DWORD PTR _if_stack
	cmp	DWORD PTR [eax+12], 0
	je	$L2122
; Line 3859
	push	0
	mov	eax, DWORD PTR _ip$[ebp]
	push	eax
	call	_skip_if_group
	add	esp, 8
; Line 3860
	jmp	$L2123
$L2122:
; Line 3861
	mov	eax, DWORD PTR _if_stack
	inc	DWORD PTR [eax+12]
; Line 3862
	push	0
	push	1
	mov	eax, DWORD PTR _op$[ebp]
	push	eax
	mov	eax, DWORD PTR _ip$[ebp]
	push	eax
	call	_output_line_command
	add	esp, 16					; 00000010H
; Line 3863
$L2123:
; Line 3864
$L2102:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_do_else ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2137	DB	'text following #endif violates ANSI standard', 00H
	ORG $+3
$SG2139	DB	'unbalanced #endif', 00H
_DATA	ENDS
_TEXT	SEGMENT
_buf$ = 8
_limit$ = 12
_op$ = 16
_temp$2141 = -4
_do_endif PROC NEAR
; Line 3873
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 3874
	cmp	DWORD PTR _pedantic, 0
	je	$L2129
; Line 3875
$L2130:
$L2134:
	mov	eax, DWORD PTR _buf$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	al, BYTE PTR _is_hor_space[eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L2135
	inc	DWORD PTR _buf$[ebp]
	jmp	$L2134
$L2135:
$L2131:
$L2132:
; Line 3876
	mov	eax, DWORD PTR _buf$[ebp]
	cmp	DWORD PTR _limit$[ebp], eax
	je	$L2136
; Line 3877
	push	OFFSET $SG2137
	call	_warning
	add	esp, 4
; Line 3878
$L2136:
; Line 3880
$L2129:
	mov	eax, DWORD PTR _indepth
	shl	eax, 5
	mov	ecx, DWORD PTR _if_stack
	cmp	DWORD PTR _instack[eax+24], ecx
	jne	$L2138
; Line 3881
	push	OFFSET $SG2139
	call	_error
	add	esp, 4
; Line 3882
	jmp	$L2140
$L2138:
; Line 3883
	mov	eax, DWORD PTR _if_stack
	mov	DWORD PTR _temp$2141[ebp], eax
; Line 3884
	mov	eax, DWORD PTR _if_stack
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _if_stack, eax
; Line 3885
	mov	eax, DWORD PTR _temp$2141[ebp]
	push	eax
	call	_free
	add	esp, 4
; Line 3886
	push	0
	push	1
	mov	eax, DWORD PTR _op$[ebp]
	push	eax
	mov	eax, DWORD PTR _indepth
	shl	eax, 5
	add	eax, OFFSET _instack
	push	eax
	call	_output_line_command
	add	esp, 16					; 00000010H
; Line 3887
$L2140:
; Line 3888
$L2128:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_do_endif ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+2
$SG2165	DB	'text following #else or #endif violates ANSI standard', 00H
_DATA	ENDS
_TEXT	SEGMENT
_p$ = 8
_validate_else PROC NEAR
; Line 3896
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 3898
$L2145:
; Line 3899
	mov	eax, DWORD PTR _p$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 92					; 0000005cH
	jne	$L2147
	mov	eax, DWORD PTR _p$[ebp]
	mov	al, BYTE PTR [eax+1]
	and	eax, 255				; 000000ffH
	cmp	eax, 10					; 0000000aH
	jne	$L2147
; Line 3900
	add	DWORD PTR _p$[ebp], 2
; Line 3901
$L2147:
	mov	eax, DWORD PTR _p$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	al, BYTE PTR _is_hor_space[eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L2148
; Line 3902
	inc	DWORD PTR _p$[ebp]
; Line 3903
	jmp	$L2149
$L2148:
	mov	eax, DWORD PTR _p$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 47					; 0000002fH
	jne	$L2150
; Line 3904
	mov	eax, DWORD PTR _p$[ebp]
	mov	al, BYTE PTR [eax+1]
	and	eax, 255				; 000000ffH
	cmp	eax, 92					; 0000005cH
	jne	$L2151
	mov	eax, DWORD PTR _p$[ebp]
	mov	al, BYTE PTR [eax+2]
	and	eax, 255				; 000000ffH
	cmp	eax, 10					; 0000000aH
	jne	$L2151
; Line 3905
	mov	eax, DWORD PTR _p$[ebp]
	inc	eax
	push	eax
	call	_newline_fix
	add	esp, 4
; Line 3906
$L2151:
	mov	eax, DWORD PTR _p$[ebp]
	mov	al, BYTE PTR [eax+1]
	and	eax, 255				; 000000ffH
	cmp	eax, 42					; 0000002aH
	jne	$L2152
; Line 3907
	add	DWORD PTR _p$[ebp], 2
; Line 3910
$L2154:
	mov	eax, DWORD PTR _p$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L2155
; Line 3911
	mov	eax, DWORD PTR _p$[ebp]
	mov	al, BYTE PTR [eax+1]
	and	eax, 255				; 000000ffH
	cmp	eax, 92					; 0000005cH
	jne	$L2156
	mov	eax, DWORD PTR _p$[ebp]
	mov	al, BYTE PTR [eax+2]
	and	eax, 255				; 000000ffH
	cmp	eax, 10					; 0000000aH
	jne	$L2156
; Line 3912
	mov	eax, DWORD PTR _p$[ebp]
	inc	eax
	push	eax
	call	_newline_fix
	add	esp, 4
; Line 3913
$L2156:
	mov	eax, DWORD PTR _p$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 42					; 0000002aH
	jne	$L2157
	mov	eax, DWORD PTR _p$[ebp]
	mov	al, BYTE PTR [eax+1]
	and	eax, 255				; 000000ffH
	cmp	eax, 47					; 0000002fH
	jne	$L2157
; Line 3914
	add	DWORD PTR _p$[ebp], 2
; Line 3915
	jmp	$L2155
; Line 3917
$L2157:
	inc	DWORD PTR _p$[ebp]
; Line 3918
	jmp	$L2154
$L2155:
; Line 3920
	jmp	$L2158
$L2152:
	cmp	DWORD PTR _cplusplus, 0
	je	$L2159
	mov	eax, DWORD PTR _p$[ebp]
	mov	al, BYTE PTR [eax+1]
	and	eax, 255				; 000000ffH
	cmp	eax, 47					; 0000002fH
	jne	$L2159
; Line 3921
	add	DWORD PTR _p$[ebp], 2
; Line 3922
$L2161:
	mov	eax, DWORD PTR _p$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L2162
	mov	eax, DWORD PTR _p$[ebp]
	mov	DWORD PTR -4+[ebp], eax
	inc	DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR -4+[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 10					; 0000000aH
	je	$L2162
	jmp	$L2161
$L2162:
; Line 3924
$L2159:
$L2158:
	jmp	$L2163
$L2150:
	jmp	$L2146
$L2163:
$L2149:
; Line 3925
	jmp	$L2145
$L2146:
; Line 3926
	mov	eax, DWORD PTR _p$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L2164
	mov	eax, DWORD PTR _p$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 10					; 0000000aH
	je	$L2164
; Line 3927
	push	OFFSET $SG2165
	call	_warning
	add	esp, 4
; Line 3928
$L2164:
$L2143:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_validate_else ENDP
_ip$ = 8
_line_counter$ = 12
_limit$ = -16
_bp$ = -12
_op$ = -8
_output$ = -4
_skip_to_end_of_comment PROC NEAR
; Line 3941
	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H
	push	ebx
	push	esi
	push	edi
; Line 3942
	mov	eax, DWORD PTR _ip$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _ip$[ebp]
	add	eax, DWORD PTR [ecx+12]
	mov	DWORD PTR _limit$[ebp], eax
; Line 3943
	mov	eax, DWORD PTR _ip$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _bp$[ebp], eax
; Line 3944
	mov	DWORD PTR _op$[ebp], OFFSET _outbuf
; Line 3945
	cmp	DWORD PTR _put_out_comments, 0
	je	$L2930
	cmp	DWORD PTR _line_counter$[ebp], 0
	jne	$L2930
	mov	DWORD PTR _output$[ebp], 1
	jmp	$L2931
$L2930:
	mov	DWORD PTR _output$[ebp], 0
$L2931:
; Line 3950
	cmp	DWORD PTR _output$[ebp], 0
	je	$L2173
; Line 3951
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	BYTE PTR [eax], 47			; 0000002fH
	mov	eax, DWORD PTR _op$[ebp]
	inc	DWORD PTR [eax+16]
; Line 3952
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	BYTE PTR [eax], 42			; 0000002aH
	mov	eax, DWORD PTR _op$[ebp]
	inc	DWORD PTR [eax+16]
; Line 3954
$L2173:
	cmp	DWORD PTR _cplusplus, 0
	je	$L2174
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax-1]
	and	eax, 255				; 000000ffH
	cmp	eax, 47					; 0000002fH
	jne	$L2174
; Line 3955
	cmp	DWORD PTR _output$[ebp], 0
	je	$L2175
; Line 3956
$L2177:
	mov	eax, DWORD PTR _limit$[ebp]
	cmp	DWORD PTR _bp$[ebp], eax
	jae	$L2178
; Line 3957
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR -20+[ebp], eax
	mov	eax, DWORD PTR _op$[ebp]
	inc	DWORD PTR [eax+16]
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax]
	mov	ecx, DWORD PTR -20+[ebp]
	mov	BYTE PTR [ecx], al
	inc	DWORD PTR _bp$[ebp]
	mov	eax, DWORD PTR -20+[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 10					; 0000000aH
	jne	$L2179
; Line 3958
	dec	DWORD PTR _bp$[ebp]
; Line 3959
	jmp	$L2178
; Line 3961
$L2179:
	jmp	$L2177
$L2178:
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	BYTE PTR [eax-1], 42			; 0000002aH
; Line 3962
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	BYTE PTR [eax], 47			; 0000002fH
	mov	eax, DWORD PTR _op$[ebp]
	inc	DWORD PTR [eax+16]
; Line 3963
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	BYTE PTR [eax], 10			; 0000000aH
	mov	eax, DWORD PTR _op$[ebp]
	inc	DWORD PTR [eax+16]
; Line 3964
	jmp	$L2180
$L2175:
; Line 3965
$L2182:
	mov	eax, DWORD PTR _limit$[ebp]
	cmp	DWORD PTR _bp$[ebp], eax
	jae	$L2183
; Line 3966
	mov	eax, DWORD PTR _bp$[ebp]
	mov	DWORD PTR -24+[ebp], eax
	inc	DWORD PTR _bp$[ebp]
	mov	eax, DWORD PTR -24+[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 10					; 0000000aH
	jne	$L2184
; Line 3967
	dec	DWORD PTR _bp$[ebp]
; Line 3968
	jmp	$L2183
; Line 3970
$L2184:
	jmp	$L2182
$L2183:
; Line 3971
$L2180:
; Line 3972
	mov	eax, DWORD PTR _bp$[ebp]
	mov	ecx, DWORD PTR _ip$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 3973
	mov	eax, DWORD PTR _bp$[ebp]
	jmp	$L2168
; Line 3975
$L2174:
$L2186:
	mov	eax, DWORD PTR _limit$[ebp]
	cmp	DWORD PTR _bp$[ebp], eax
	jae	$L2187
; Line 3976
	cmp	DWORD PTR _output$[ebp], 0
	je	$L2188
; Line 3977
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax]
	mov	ecx, DWORD PTR _op$[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	mov	BYTE PTR [ecx], al
	mov	eax, DWORD PTR _op$[ebp]
	inc	DWORD PTR [eax+16]
; Line 3978
$L2188:
	mov	eax, DWORD PTR _bp$[ebp]
	mov	DWORD PTR -28+[ebp], eax
	inc	DWORD PTR _bp$[ebp]
	mov	eax, DWORD PTR -28+[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR -32+[ebp], eax
	jmp	$L2189
; Line 3979
$L2193:
; Line 3980
	cmp	DWORD PTR _line_counter$[ebp], 0
	je	$L2194
; Line 3981
	mov	eax, DWORD PTR _line_counter$[ebp]
	inc	DWORD PTR [eax]
; Line 3982
$L2194:
	cmp	DWORD PTR _output$[ebp], 0
	je	$L2195
; Line 3983
	mov	eax, DWORD PTR _op$[ebp]
	inc	DWORD PTR [eax+4]
; Line 3984
$L2195:
	jmp	$L2190
; Line 3985
$L2196:
; Line 3986
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 92					; 0000005cH
	jne	$L2197
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax+1]
	and	eax, 255				; 000000ffH
	cmp	eax, 10					; 0000000aH
	jne	$L2197
; Line 3987
	mov	eax, DWORD PTR _bp$[ebp]
	push	eax
	call	_newline_fix
	add	esp, 4
; Line 3988
$L2197:
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 47					; 0000002fH
	jne	$L2198
; Line 3989
	cmp	DWORD PTR _output$[ebp], 0
	je	$L2199
; Line 3990
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	BYTE PTR [eax], 47			; 0000002fH
	mov	eax, DWORD PTR _op$[ebp]
	inc	DWORD PTR [eax+16]
; Line 3991
$L2199:
	inc	DWORD PTR _bp$[ebp]
	mov	eax, DWORD PTR _bp$[ebp]
	mov	ecx, DWORD PTR _ip$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 3992
	mov	eax, DWORD PTR _bp$[ebp]
	jmp	$L2168
; Line 3994
$L2198:
	jmp	$L2190
; Line 3995
	jmp	$L2190
$L2189:
	cmp	DWORD PTR -32+[ebp], 10			; 0000000aH
	je	$L2193
	cmp	DWORD PTR -32+[ebp], 42			; 0000002aH
	je	$L2196
	jmp	$L2190
$L2190:
; Line 3996
	jmp	$L2186
$L2187:
; Line 3997
	mov	eax, DWORD PTR _bp$[ebp]
	mov	ecx, DWORD PTR _ip$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 3998
	mov	eax, DWORD PTR _bp$[ebp]
	jmp	$L2168
; Line 3999
$L2168:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_skip_to_end_of_comment ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+2
$SG2213	DB	'unterminated string or character constant', 00H
	ORG $+2
$SG2228	DB	'unterminated character constant', 00H
_DATA	ENDS
_TEXT	SEGMENT
_bp$ = 8
_limit$ = 12
_start_line$ = 16
_count_newlines$ = 20
_backslash_newlines_p$ = 24
_eofp$ = 28
_c$ = -8
_match$ = -4
_skip_quoted_string PROC NEAR
; Line 4025
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 4028
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax]
	mov	BYTE PTR _match$[ebp], al
	inc	DWORD PTR _bp$[ebp]
; Line 4029
$L2210:
; Line 4030
	mov	eax, DWORD PTR _limit$[ebp]
	cmp	DWORD PTR _bp$[ebp], eax
	jb	$L2212
; Line 4032
	push	OFFSET $SG2213
	mov	eax, DWORD PTR _start_line$[ebp]
	push	eax
	call	_line_for_error
	add	esp, 4
	push	eax
	call	_error_with_line
	add	esp, 8
; Line 4033
	cmp	DWORD PTR _eofp$[ebp], 0
	je	$L2214
; Line 4034
	mov	eax, DWORD PTR _eofp$[ebp]
	mov	DWORD PTR [eax], 1
; Line 4035
$L2214:
	jmp	$L2211
; Line 4037
$L2212:
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax]
	mov	BYTE PTR _c$[ebp], al
	inc	DWORD PTR _bp$[ebp]
; Line 4038
	xor	eax, eax
	mov	al, BYTE PTR _c$[ebp]
	cmp	eax, 92					; 0000005cH
	jne	$L2215
; Line 4039
$L2217:
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 92					; 0000005cH
	jne	$L2218
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax+1]
	and	eax, 255				; 000000ffH
	cmp	eax, 10					; 0000000aH
	jne	$L2218
; Line 4040
	cmp	DWORD PTR _backslash_newlines_p$[ebp], 0
	je	$L2219
; Line 4041
	mov	eax, DWORD PTR _backslash_newlines_p$[ebp]
	mov	DWORD PTR [eax], 1
; Line 4042
$L2219:
	cmp	DWORD PTR _count_newlines$[ebp], 0
	je	$L2220
; Line 4043
	mov	eax, DWORD PTR _count_newlines$[ebp]
	inc	DWORD PTR [eax]
; Line 4044
$L2220:
	add	DWORD PTR _bp$[ebp], 2
; Line 4045
	jmp	$L2217
$L2218:
; Line 4046
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 10					; 0000000aH
	jne	$L2221
	cmp	DWORD PTR _count_newlines$[ebp], 0
	je	$L2221
; Line 4047
	cmp	DWORD PTR _backslash_newlines_p$[ebp], 0
	je	$L2222
; Line 4048
	mov	eax, DWORD PTR _backslash_newlines_p$[ebp]
	mov	DWORD PTR [eax], 1
; Line 4049
$L2222:
	mov	eax, DWORD PTR _count_newlines$[ebp]
	inc	DWORD PTR [eax]
; Line 4051
$L2221:
	inc	DWORD PTR _bp$[ebp]
; Line 4052
	jmp	$L2223
$L2215:
	xor	eax, eax
	mov	al, BYTE PTR _c$[ebp]
	cmp	eax, 10					; 0000000aH
	jne	$L2224
; Line 4053
	cmp	DWORD PTR _traditional, 0
	je	$L2225
; Line 4055
	dec	DWORD PTR _bp$[ebp]
; Line 4056
	cmp	DWORD PTR _eofp$[ebp], 0
	je	$L2226
; Line 4057
	mov	eax, DWORD PTR _eofp$[ebp]
	mov	DWORD PTR [eax], 1
; Line 4058
$L2226:
	jmp	$L2211
; Line 4060
$L2225:
	xor	eax, eax
	mov	al, BYTE PTR _match$[ebp]
	cmp	eax, 39					; 00000027H
	jne	$L2227
; Line 4062
	push	OFFSET $SG2228
	mov	eax, DWORD PTR _start_line$[ebp]
	push	eax
	call	_line_for_error
	add	esp, 4
	push	eax
	call	_error_with_line
	add	esp, 8
; Line 4063
	dec	DWORD PTR _bp$[ebp]
; Line 4064
	cmp	DWORD PTR _eofp$[ebp], 0
	je	$L2229
; Line 4065
	mov	eax, DWORD PTR _eofp$[ebp]
	mov	DWORD PTR [eax], 1
; Line 4066
$L2229:
	jmp	$L2211
; Line 4068
$L2227:
	cmp	DWORD PTR _traditional, 0
	je	$L2230
; Line 4069
	cmp	DWORD PTR _eofp$[ebp], 0
	je	$L2231
; Line 4070
	mov	eax, DWORD PTR _eofp$[ebp]
	mov	DWORD PTR [eax], 1
; Line 4071
$L2231:
	jmp	$L2211
; Line 4074
$L2230:
	cmp	DWORD PTR _count_newlines$[ebp], 0
	je	$L2232
; Line 4075
	mov	eax, DWORD PTR _count_newlines$[ebp]
	inc	DWORD PTR [eax]
; Line 4076
$L2232:
	jmp	$L2233
$L2224:
	xor	eax, eax
	mov	al, BYTE PTR _match$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR _c$[ebp]
	cmp	eax, ecx
	jne	$L2234
; Line 4077
	jmp	$L2211
; Line 4078
$L2234:
$L2233:
$L2223:
	jmp	$L2210
$L2211:
; Line 4079
	mov	eax, DWORD PTR _bp$[ebp]
	jmp	$L2206
; Line 4080
$L2206:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_skip_quoted_string ENDP
_TEXT	ENDS
_DATA	SEGMENT
$SG2250	DB	'# %d "%s"', 00H
	ORG $+2
$SG2252	DB	' 1', 00H
	ORG $+1
$SG2253	DB	' 2', 00H
_DATA	ENDS
_TEXT	SEGMENT
_len$ = -504
_line_cmd_buf$ = -500
_ip$ = 8
_op$ = 12
_conditional$ = 16
_file_change$ = 20
_output_line_command PROC NEAR
; Line 4095
	push	ebp
	mov	ebp, esp
	sub	esp, 504				; 000001f8H
	push	ebx
	push	esi
	push	edi
; Line 4101
	cmp	DWORD PTR _no_line_commands, 0
	jne	$L2243
	mov	eax, DWORD PTR _ip$[ebp]
	cmp	DWORD PTR [eax], 0
	je	$L2243
	cmp	DWORD PTR _no_output, 0
	je	$L2242
$L2243:
; Line 4102
	mov	eax, DWORD PTR _ip$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _op$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 4103
	jmp	$L2239
; Line 4106
$L2242:
	cmp	DWORD PTR _conditional$[ebp], 0
	je	$L2244
; Line 4107
	mov	eax, DWORD PTR _op$[ebp]
	mov	ecx, DWORD PTR _ip$[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L2245
; Line 4108
	jmp	$L2239
; Line 4112
$L2245:
	mov	eax, DWORD PTR _op$[ebp]
	mov	ecx, DWORD PTR _ip$[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	cmp	DWORD PTR [eax+4], ecx
	jge	$L2246
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax+4]
	add	eax, 8
	mov	ecx, DWORD PTR _ip$[ebp]
	cmp	eax, DWORD PTR [ecx+4]
	jle	$L2246
; Line 4113
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _op$[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	mov	edx, DWORD PTR _op$[ebp]
	sub	ecx, DWORD PTR [edx+12]
	sub	eax, ecx
	cmp	eax, 10					; 0000000aH
	jle	$L2932
	jmp	$L2933
$L2932:
	push	10					; 0000000aH
	mov	eax, DWORD PTR _op$[ebp]
	push	eax
	call	_grow_outbuf
	add	esp, 8
$L2933:
; Line 4114
$L2248:
	mov	eax, DWORD PTR _op$[ebp]
	mov	ecx, DWORD PTR _ip$[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	cmp	DWORD PTR [eax+4], ecx
	jge	$L2249
; Line 4115
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	BYTE PTR [eax], 10			; 0000000aH
	mov	eax, DWORD PTR _op$[ebp]
	inc	DWORD PTR [eax+16]
; Line 4116
	mov	eax, DWORD PTR _op$[ebp]
	inc	DWORD PTR [eax+4]
; Line 4117
	jmp	$L2248
$L2249:
; Line 4118
	jmp	$L2239
; Line 4120
$L2246:
; Line 4125
$L2244:
	mov	eax, DWORD PTR _ip$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	mov	eax, DWORD PTR _ip$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	OFFSET $SG2250
	lea	eax, DWORD PTR _line_cmd_buf$[ebp]
	push	eax
	call	_sprintf
	add	esp, 16					; 00000010H
; Line 4127
	cmp	DWORD PTR _file_change$[ebp], 0
	je	$L2251
; Line 4128
	mov	eax, OFFSET $SG2252
	cmp	DWORD PTR _file_change$[ebp], 1
	je	$L2936
	mov	eax, OFFSET $SG2253
$L2936:
	push	eax
	lea	eax, DWORD PTR _line_cmd_buf$[ebp]
	push	eax
	call	_strcat
	add	esp, 8
; Line 4129
$L2251:
	lea	eax, DWORD PTR _line_cmd_buf$[ebp]
	push	eax
	call	_strlen
	add	esp, 4
	mov	DWORD PTR _len$[ebp], eax
; Line 4130
	mov	eax, DWORD PTR _len$[ebp]
	mov	BYTE PTR _line_cmd_buf$[ebp+eax], 10	; 0000000aH
	inc	DWORD PTR _len$[ebp]
; Line 4131
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _op$[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	mov	edx, DWORD PTR _op$[ebp]
	sub	ecx, DWORD PTR [edx+12]
	sub	eax, ecx
	mov	ecx, DWORD PTR _len$[ebp]
	inc	ecx
	cmp	eax, ecx
	jle	$L2934
	jmp	$L2935
$L2934:
	mov	eax, DWORD PTR _len$[ebp]
	inc	eax
	push	eax
	mov	eax, DWORD PTR _op$[ebp]
	push	eax
	call	_grow_outbuf
	add	esp, 8
$L2935:
; Line 4132
	mov	eax, DWORD PTR _op$[ebp]
	mov	ecx, DWORD PTR _op$[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	cmp	DWORD PTR [eax+12], ecx
	jae	$L2254
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	al, BYTE PTR [eax-1]
	and	eax, 255				; 000000ffH
	cmp	eax, 10					; 0000000aH
	je	$L2254
; Line 4133
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	BYTE PTR [eax], 10			; 0000000aH
	mov	eax, DWORD PTR _op$[ebp]
	inc	DWORD PTR [eax+16]
; Line 4134
$L2254:
	mov	eax, DWORD PTR _len$[ebp]
	push	eax
	mov	eax, DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	lea	eax, DWORD PTR _line_cmd_buf$[ebp]
	push	eax
	call	_bcopy
	add	esp, 12					; 0000000cH
; Line 4135
	mov	eax, DWORD PTR _len$[ebp]
	mov	ecx, DWORD PTR _op$[ebp]
	add	DWORD PTR [ecx+16], eax
; Line 4136
	mov	eax, DWORD PTR _ip$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _op$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 4137
$L2239:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_line_command ENDP
_TEXT	ENDS
PUBLIC	_macarg
_DATA	SEGMENT
	ORG $+1
$SG2264	DB	'macro or #include recursion too deep', 00H
	ORG $+3
$SG2273	DB	00H
	ORG $+3
$SG2286	DB	'arguments given to macro `%s''', 00H
	ORG $+2
$SG2292	DB	'no args to macro `%s''', 00H
	ORG $+2
$SG2295	DB	'only 1 arg to macro `%s''', 00H
	ORG $+3
$SG2297	DB	'only %d args to macro `%s''', 00H
	ORG $+1
$SG2300	DB	'too many (%d) args to macro `%s''', 00H
	ORG $+3
$SG2357	DB	'\%03o', 00H
_DATA	ENDS
_TEXT	SEGMENT
_offset$2304 = -44
_totlen$2305 = -56
_ap$2306 = -52
_p2$2379 = -88
_arg$2318 = -60
_hp$ = 8
_op$ = 12
_nargs$ = -4
_arglen$2323 = -64
_defn$ = -16
_escaped$2324 = -76
_xbuf$ = -20
_in_string$2325 = -72
_xbuf_len$ = -12
_c$2326 = -68
_start_line$ = -8
_i$2267 = -32
_args$2268 = -28
_ip2$2397 = -92
_parse_error$2269 = -24
_bp$2279 = -40
_lim$2280 = -36
_p1$2362 = -84
_l1$2363 = -80
_exp$2303 = -48
_macroexpand PROC NEAR
; Line 4169
	push	ebp
	mov	ebp, esp
	sub	esp, 112				; 00000070H
	push	ebx
	push	esi
	push	edi
; Line 4171
	mov	eax, DWORD PTR _hp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _defn$[ebp], eax
; Line 4174
	mov	eax, DWORD PTR _indepth
	shl	eax, 5
	mov	eax, DWORD PTR _instack[eax+4]
	mov	DWORD PTR _start_line$[ebp], eax
; Line 4176
	cmp	DWORD PTR _indepth, 199			; 000000c7H
	jl	$L2263
	push	OFFSET $SG2264
	mov	eax, DWORD PTR _indepth
	shl	eax, 5
	mov	eax, DWORD PTR _instack[eax+4]
	push	eax
	call	_line_for_error
	add	esp, 4
	push	eax
	call	_error_with_line
	add	esp, 8
	jmp	$L2257
$L2263:
; Line 4179
	mov	eax, DWORD PTR _hp$[ebp]
	cmp	DWORD PTR [eax+12], 23			; 00000017H
	je	$L2265
; Line 4180
	mov	eax, DWORD PTR _op$[ebp]
	push	eax
	mov	eax, DWORD PTR _hp$[ebp]
	push	eax
	call	_special_symbol
	add	esp, 8
; Line 4181
	jmp	$L2257
; Line 4184
$L2265:
	mov	eax, DWORD PTR _defn$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _nargs$[ebp], eax
; Line 4186
	cmp	DWORD PTR _nargs$[ebp], 0
	jl	$L2266
; Line 4189
	mov	DWORD PTR _parse_error$2269[ebp], 0
; Line 4191
	mov	eax, DWORD PTR _nargs$[ebp]
	inc	eax
	shl	eax, 5
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _args$2268[ebp], eax
; Line 4193
	mov	DWORD PTR _i$2267[ebp], 0
	jmp	$L2270
$L2271:
	inc	DWORD PTR _i$2267[ebp]
$L2270:
	mov	eax, DWORD PTR _nargs$[ebp]
	cmp	DWORD PTR _i$2267[ebp], eax
	jge	$L2272
; Line 4194
	mov	eax, DWORD PTR _i$2267[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _args$2268[ebp]
	mov	DWORD PTR [eax+ecx+4], OFFSET $SG2273
	mov	eax, DWORD PTR _i$2267[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _args$2268[ebp]
	mov	eax, DWORD PTR [eax+ecx+4]
	mov	ecx, DWORD PTR _i$2267[ebp]
	shl	ecx, 5
	mov	edx, DWORD PTR _args$2268[ebp]
	mov	DWORD PTR [ecx+edx], eax
; Line 4196
	mov	eax, DWORD PTR _i$2267[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _args$2268[ebp]
	mov	DWORD PTR [eax+ecx+16], 0
	mov	eax, DWORD PTR _i$2267[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _args$2268[ebp]
	mov	eax, DWORD PTR [eax+ecx+16]
	mov	ecx, DWORD PTR _i$2267[ebp]
	shl	ecx, 5
	mov	edx, DWORD PTR _args$2268[ebp]
	mov	DWORD PTR [ecx+edx+12], eax
	mov	eax, DWORD PTR _i$2267[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _args$2268[ebp]
	mov	eax, DWORD PTR [eax+ecx+12]
	mov	ecx, DWORD PTR _i$2267[ebp]
	shl	ecx, 5
	mov	edx, DWORD PTR _args$2268[ebp]
	mov	DWORD PTR [ecx+edx+8], eax
; Line 4197
	mov	eax, DWORD PTR _i$2267[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _args$2268[ebp]
	mov	DWORD PTR [eax+ecx+24], 0
	mov	eax, DWORD PTR _i$2267[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _args$2268[ebp]
	mov	eax, DWORD PTR [eax+ecx+24]
	mov	ecx, DWORD PTR _i$2267[ebp]
	shl	ecx, 5
	mov	edx, DWORD PTR _args$2268[ebp]
	mov	DWORD PTR [ecx+edx+20], eax
; Line 4198
	jmp	$L2271
$L2272:
; Line 4203
	mov	DWORD PTR _i$2267[ebp], 0
; Line 4204
$L2274:
; Line 4206
	mov	eax, DWORD PTR _indepth
	shl	eax, 5
	inc	DWORD PTR _instack[eax+16]
; Line 4208
	mov	eax, DWORD PTR _nargs$[ebp]
	cmp	DWORD PTR _i$2267[ebp], eax
	jl	$L2939
	cmp	DWORD PTR _nargs$[ebp], 0
	jne	$L2937
	cmp	DWORD PTR _i$2267[ebp], 0
	jne	$L2937
$L2939:
	mov	eax, DWORD PTR _i$2267[ebp]
	shl	eax, 5
	add	eax, DWORD PTR _args$2268[ebp]
	mov	DWORD PTR -96+[ebp], eax
	jmp	$L2938
$L2937:
	mov	DWORD PTR -96+[ebp], 0
$L2938:
	mov	eax, DWORD PTR -96+[ebp]
	push	eax
	call	_macarg
	add	esp, 4
	mov	DWORD PTR _parse_error$2269[ebp], eax
; Line 4209
	cmp	DWORD PTR _parse_error$2269[ebp], 0
	je	$L2277
; Line 4211
	mov	eax, DWORD PTR _parse_error$2269[ebp]
	push	eax
	mov	eax, DWORD PTR _start_line$[ebp]
	push	eax
	call	_line_for_error
	add	esp, 4
	push	eax
	call	_error_with_line
	add	esp, 8
; Line 4212
	jmp	$L2276
; Line 4214
$L2277:
	inc	DWORD PTR _i$2267[ebp]
; Line 4215
$L2275:
	mov	eax, DWORD PTR _indepth
	shl	eax, 5
	mov	eax, DWORD PTR _instack[eax+16]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 41					; 00000029H
	jne	$L2274
$L2276:
; Line 4218
	cmp	DWORD PTR _i$2267[ebp], 1
	jne	$L2278
; Line 4219
	mov	eax, DWORD PTR _args$2268[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _bp$2279[ebp], eax
; Line 4220
	mov	eax, DWORD PTR _args$2268[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, DWORD PTR _bp$2279[ebp]
	mov	DWORD PTR _lim$2280[ebp], eax
; Line 4221
$L2282:
	mov	eax, DWORD PTR _bp$2279[ebp]
	cmp	DWORD PTR _lim$2280[ebp], eax
	je	$L2283
	mov	eax, DWORD PTR _bp$2279[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	al, BYTE PTR _is_space[eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L2283
	inc	DWORD PTR _bp$2279[ebp]
	jmp	$L2282
$L2283:
; Line 4222
	mov	eax, DWORD PTR _bp$2279[ebp]
	cmp	DWORD PTR _lim$2280[ebp], eax
	jne	$L2284
; Line 4223
	mov	DWORD PTR _i$2267[ebp], 0
; Line 4224
$L2284:
; Line 4226
$L2278:
	cmp	DWORD PTR _nargs$[ebp], 0
	jne	$L2285
	cmp	DWORD PTR _i$2267[ebp], 0
	jle	$L2285
; Line 4227
	mov	eax, DWORD PTR _hp$[ebp]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	push	OFFSET $SG2286
	call	_error
	add	esp, 8
; Line 4228
	jmp	$L2287
$L2285:
	mov	eax, DWORD PTR _nargs$[ebp]
	cmp	DWORD PTR _i$2267[ebp], eax
	jge	$L2288
; Line 4230
	cmp	DWORD PTR _nargs$[ebp], 1
	jne	$L2289
	cmp	DWORD PTR _i$2267[ebp], 0
	jne	$L2289
	cmp	DWORD PTR _traditional, 0
	je	$L2289
; Line 4232
	jmp	$L2290
$L2289:
	cmp	DWORD PTR _i$2267[ebp], 0
	jne	$L2291
; Line 4233
	mov	eax, DWORD PTR _hp$[ebp]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	push	OFFSET $SG2292
	call	_error
	add	esp, 8
; Line 4234
	jmp	$L2293
$L2291:
	cmp	DWORD PTR _i$2267[ebp], 1
	jne	$L2294
; Line 4235
	mov	eax, DWORD PTR _hp$[ebp]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	push	OFFSET $SG2295
	call	_error
	add	esp, 8
; Line 4236
	jmp	$L2296
$L2294:
; Line 4237
	mov	eax, DWORD PTR _hp$[ebp]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	mov	eax, DWORD PTR _i$2267[ebp]
	push	eax
	push	OFFSET $SG2297
	call	_error
	add	esp, 12					; 0000000cH
$L2296:
$L2293:
$L2290:
; Line 4238
	jmp	$L2298
$L2288:
	mov	eax, DWORD PTR _nargs$[ebp]
	cmp	DWORD PTR _i$2267[ebp], eax
	jle	$L2299
; Line 4239
	mov	eax, DWORD PTR _hp$[ebp]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	mov	eax, DWORD PTR _i$2267[ebp]
	push	eax
	push	OFFSET $SG2300
	call	_error
	add	esp, 12					; 0000000cH
; Line 4242
$L2299:
$L2298:
$L2287:
	mov	eax, DWORD PTR _indepth
	shl	eax, 5
	inc	DWORD PTR _instack[eax+16]
; Line 4246
	cmp	DWORD PTR _nargs$[ebp], 0
	jne	$L2301
; Line 4247
	mov	eax, DWORD PTR _defn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _xbuf$[ebp], eax
; Line 4248
	mov	eax, DWORD PTR _defn$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _xbuf_len$[ebp], eax
; Line 4249
	jmp	$L2302
$L2301:
; Line 4250
	mov	eax, DWORD PTR _defn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _exp$2303[ebp], eax
; Line 4260
	mov	eax, DWORD PTR _defn$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _xbuf_len$[ebp], eax
; Line 4261
	mov	eax, DWORD PTR _defn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _ap$2306[ebp], eax
	jmp	$L2307
$L2308:
	mov	eax, DWORD PTR _ap$2306[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _ap$2306[ebp], eax
$L2307:
	cmp	DWORD PTR _ap$2306[ebp], 0
	je	$L2309
; Line 4262
	mov	eax, DWORD PTR _ap$2306[ebp]
	movsx	eax, BYTE PTR [eax+4]
	or	eax, eax
	je	$L2310
; Line 4263
	mov	eax, DWORD PTR _ap$2306[ebp]
	mov	eax, DWORD PTR [eax+12]
	shl	eax, 5
	mov	ecx, DWORD PTR _args$2268[ebp]
	mov	eax, DWORD PTR [eax+ecx+16]
	add	DWORD PTR _xbuf_len$[ebp], eax
; Line 4264
	jmp	$L2311
$L2310:
	mov	eax, DWORD PTR _ap$2306[ebp]
	movsx	eax, BYTE PTR [eax+5]
	or	eax, eax
	jne	$L2313
	mov	eax, DWORD PTR _ap$2306[ebp]
	movsx	eax, BYTE PTR [eax+6]
	or	eax, eax
	je	$L2312
$L2313:
; Line 4265
	mov	eax, DWORD PTR _ap$2306[ebp]
	mov	eax, DWORD PTR [eax+12]
	shl	eax, 5
	mov	ecx, DWORD PTR _args$2268[ebp]
	mov	eax, DWORD PTR [eax+ecx+8]
	add	DWORD PTR _xbuf_len$[ebp], eax
; Line 4266
	jmp	$L2314
$L2312:
; Line 4267
	mov	eax, DWORD PTR _ap$2306[ebp]
	mov	eax, DWORD PTR [eax+12]
	shl	eax, 5
	mov	ecx, DWORD PTR _args$2268[ebp]
	mov	eax, DWORD PTR [eax+ecx+12]
	add	DWORD PTR _xbuf_len$[ebp], eax
$L2314:
$L2311:
; Line 4268
	jmp	$L2308
$L2309:
; Line 4270
	mov	eax, DWORD PTR _xbuf_len$[ebp]
	inc	eax
	push	eax
	call	_xmalloc
	add	esp, 4
	mov	DWORD PTR _xbuf$[ebp], eax
; Line 4277
	mov	DWORD PTR _totlen$2305[ebp], 0
	mov	eax, DWORD PTR _totlen$2305[ebp]
	mov	DWORD PTR _offset$2304[ebp], eax
; Line 4278
	mov	eax, DWORD PTR _defn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _ap$2306[ebp], eax
	jmp	$L2315
$L2316:
	mov	eax, DWORD PTR _ap$2306[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _ap$2306[ebp], eax
$L2315:
	cmp	DWORD PTR _ap$2306[ebp], 0
	je	$L2317
; Line 4279
	mov	eax, DWORD PTR _ap$2306[ebp]
	mov	eax, DWORD PTR [eax+12]
	shl	eax, 5
	add	eax, DWORD PTR _args$2268[ebp]
	mov	DWORD PTR _arg$2318[ebp], eax
; Line 4281
	mov	DWORD PTR _i$2267[ebp], 0
	jmp	$L2319
$L2320:
	inc	DWORD PTR _i$2267[ebp]
$L2319:
	mov	eax, DWORD PTR _ap$2306[ebp]
	mov	ecx, DWORD PTR _i$2267[ebp]
	cmp	DWORD PTR [eax+8], ecx
	jle	$L2321
; Line 4282
	mov	eax, DWORD PTR _offset$2304[ebp]
	mov	ecx, DWORD PTR _exp$2303[ebp]
	mov	al, BYTE PTR [eax+ecx]
	mov	ecx, DWORD PTR _totlen$2305[ebp]
	mov	edx, DWORD PTR _xbuf$[ebp]
	mov	BYTE PTR [ecx+edx], al
	inc	DWORD PTR _offset$2304[ebp]
	inc	DWORD PTR _totlen$2305[ebp]
	jmp	$L2320
$L2321:
; Line 4284
	mov	eax, DWORD PTR _ap$2306[ebp]
	movsx	eax, BYTE PTR [eax+4]
	or	eax, eax
	je	$L2322
; Line 4285
	mov	eax, DWORD PTR _arg$2318[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _arglen$2323[ebp], eax
; Line 4286
	mov	DWORD PTR _escaped$2324[ebp], 0
; Line 4287
	mov	DWORD PTR _in_string$2325[ebp], 0
; Line 4289
	mov	DWORD PTR _i$2267[ebp], 0
; Line 4291
$L2328:
	mov	eax, DWORD PTR _i$2267[ebp]
	cmp	DWORD PTR _arglen$2323[ebp], eax
	jle	$L2329
	mov	eax, DWORD PTR _arg$2318[ebp]
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _i$2267[ebp]
	mov	al, BYTE PTR [eax+ecx]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _c$2326[ebp], eax
	mov	eax, DWORD PTR _c$2326[ebp]
	mov	al, BYTE PTR _is_space[eax]
	mov	BYTE PTR -100+[ebp], al
	xor	eax, eax
	mov	al, BYTE PTR -100+[ebp]
	or	eax, eax
	je	$L2329
; Line 4292
	inc	DWORD PTR _i$2267[ebp]
	jmp	$L2328
$L2329:
; Line 4294
$L2331:
	mov	eax, DWORD PTR _i$2267[ebp]
	cmp	DWORD PTR _arglen$2323[ebp], eax
	jle	$L2332
	mov	eax, DWORD PTR _arglen$2323[ebp]
	mov	ecx, DWORD PTR _arg$2318[ebp]
	mov	ecx, DWORD PTR [ecx]
	mov	al, BYTE PTR [eax+ecx-1]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _c$2326[ebp], eax
	mov	eax, DWORD PTR _c$2326[ebp]
	mov	al, BYTE PTR _is_space[eax]
	mov	BYTE PTR -104+[ebp], al
	xor	eax, eax
	mov	al, BYTE PTR -104+[ebp]
	or	eax, eax
	je	$L2332
; Line 4295
	dec	DWORD PTR _arglen$2323[ebp]
	jmp	$L2331
$L2332:
; Line 4296
	cmp	DWORD PTR _traditional, 0
	jne	$L2333
; Line 4297
	mov	eax, DWORD PTR _totlen$2305[ebp]
	mov	ecx, DWORD PTR _xbuf$[ebp]
	mov	BYTE PTR [eax+ecx], 34			; 00000022H
	inc	DWORD PTR _totlen$2305[ebp]
; Line 4298
$L2333:
	jmp	$L2334
$L2335:
	inc	DWORD PTR _i$2267[ebp]
$L2334:
	mov	eax, DWORD PTR _i$2267[ebp]
	cmp	DWORD PTR _arglen$2323[ebp], eax
	jle	$L2336
; Line 4299
	mov	eax, DWORD PTR _arg$2318[ebp]
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _i$2267[ebp]
	mov	al, BYTE PTR [eax+ecx]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _c$2326[ebp], eax
; Line 4303
	cmp	DWORD PTR _c$2326[ebp], 10		; 0000000aH
	jne	$L2337
	mov	eax, DWORD PTR _i$2267[ebp]
	mov	ecx, DWORD PTR _arg$2318[ebp]
	mov	ecx, DWORD PTR [ecx]
	mov	al, BYTE PTR [eax+ecx+1]
	and	eax, 255				; 000000ffH
	cmp	eax, 10					; 0000000aH
	je	$L2337
; Line 4304
	inc	DWORD PTR _i$2267[ebp]
; Line 4305
	jmp	$L2335
; Line 4309
$L2337:
	cmp	DWORD PTR _c$2326[ebp], 10		; 0000000aH
	jne	$L2940
	mov	eax, DWORD PTR _i$2267[ebp]
	mov	ecx, DWORD PTR _arg$2318[ebp]
	mov	ecx, DWORD PTR [ecx]
	mov	al, BYTE PTR [eax+ecx+1]
	and	eax, 255				; 000000ffH
	sub	eax, 10					; 0000000aH
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	mov	DWORD PTR -108+[ebp], eax
	jmp	$L2941
$L2940:
	mov	eax, DWORD PTR _c$2326[ebp]
	mov	al, BYTE PTR _is_space[eax]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR -108+[ebp], eax
$L2941:
	cmp	DWORD PTR -108+[ebp], 0
	je	$L2338
; Line 4310
$L2340:
; Line 4311
	cmp	DWORD PTR _c$2326[ebp], 10		; 0000000aH
	jne	$L2342
	mov	eax, DWORD PTR _i$2267[ebp]
	mov	ecx, DWORD PTR _arg$2318[ebp]
	mov	ecx, DWORD PTR [ecx]
	mov	al, BYTE PTR [eax+ecx+1]
	and	eax, 255				; 000000ffH
	cmp	eax, 10					; 0000000aH
	jne	$L2342
; Line 4312
	add	DWORD PTR _i$2267[ebp], 2
; Line 4313
	jmp	$L2343
$L2342:
	cmp	DWORD PTR _c$2326[ebp], 10		; 0000000aH
	je	$L2344
	mov	eax, DWORD PTR _c$2326[ebp]
	mov	al, BYTE PTR _is_space[eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L2344
; Line 4314
	inc	DWORD PTR _i$2267[ebp]
; Line 4315
	jmp	$L2345
$L2344:
	jmp	$L2341
$L2345:
$L2343:
; Line 4316
	mov	eax, DWORD PTR _arg$2318[ebp]
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _i$2267[ebp]
	mov	al, BYTE PTR [eax+ecx]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _c$2326[ebp], eax
; Line 4317
	jmp	$L2340
$L2341:
; Line 4318
	dec	DWORD PTR _i$2267[ebp]
; Line 4319
	mov	DWORD PTR _c$2326[ebp], 32		; 00000020H
; Line 4322
$L2338:
	cmp	DWORD PTR _escaped$2324[ebp], 0
	je	$L2346
; Line 4323
	mov	DWORD PTR _escaped$2324[ebp], 0
; Line 4324
	jmp	$L2347
$L2346:
; Line 4325
	cmp	DWORD PTR _c$2326[ebp], 92		; 0000005cH
	jne	$L2348
; Line 4326
	mov	DWORD PTR _escaped$2324[ebp], 1
; Line 4327
$L2348:
	cmp	DWORD PTR _in_string$2325[ebp], 0
	je	$L2349
	mov	eax, DWORD PTR _in_string$2325[ebp]
	cmp	DWORD PTR _c$2326[ebp], eax
	jne	$L2349
; Line 4328
	mov	DWORD PTR _in_string$2325[ebp], 0
; Line 4329
	jmp	$L2350
$L2349:
	cmp	DWORD PTR _c$2326[ebp], 34		; 00000022H
	je	$L2352
	cmp	DWORD PTR _c$2326[ebp], 39		; 00000027H
	jne	$L2351
$L2352:
; Line 4330
	mov	eax, DWORD PTR _c$2326[ebp]
	mov	DWORD PTR _in_string$2325[ebp], eax
; Line 4331
$L2351:
$L2350:
$L2347:
; Line 4334
	cmp	DWORD PTR _c$2326[ebp], 34		; 00000022H
	je	$L2354
	cmp	DWORD PTR _in_string$2325[ebp], 0
	je	$L2353
	cmp	DWORD PTR _c$2326[ebp], 92		; 0000005cH
	jne	$L2353
$L2354:
; Line 4335
	mov	eax, DWORD PTR _totlen$2305[ebp]
	mov	ecx, DWORD PTR _xbuf$[ebp]
	mov	BYTE PTR [eax+ecx], 92			; 0000005cH
	inc	DWORD PTR _totlen$2305[ebp]
; Line 4336
$L2353:
	cmp	DWORD PTR ___mb_cur_max, 1
	jle	$L2942
	push	343					; 00000157H
	mov	eax, DWORD PTR _c$2326[ebp]
	push	eax
	call	__isctype
	add	esp, 8
	mov	DWORD PTR -112+[ebp], eax
	jmp	$L2943
$L2942:
	mov	eax, DWORD PTR _c$2326[ebp]
	mov	ecx, DWORD PTR __pctype
	mov	ax, WORD PTR [ecx+eax*2]
	and	eax, 343				; 00000157H
	mov	DWORD PTR -112+[ebp], eax
$L2943:
	cmp	DWORD PTR -112+[ebp], 0
	je	$L2355
; Line 4337
	mov	al, BYTE PTR _c$2326[ebp]
	mov	ecx, DWORD PTR _totlen$2305[ebp]
	mov	edx, DWORD PTR _xbuf$[ebp]
	mov	BYTE PTR [ecx+edx], al
	inc	DWORD PTR _totlen$2305[ebp]
; Line 4338
	jmp	$L2356
$L2355:
; Line 4339
	mov	eax, DWORD PTR _c$2326[ebp]
	push	eax
	push	OFFSET $SG2357
	mov	eax, DWORD PTR _totlen$2305[ebp]
	add	eax, DWORD PTR _xbuf$[ebp]
	push	eax
	call	_sprintf
	add	esp, 12					; 0000000cH
; Line 4340
	add	DWORD PTR _totlen$2305[ebp], 4
; Line 4341
$L2356:
; Line 4342
	jmp	$L2335
$L2336:
; Line 4343
	cmp	DWORD PTR _traditional, 0
	jne	$L2358
; Line 4344
	mov	eax, DWORD PTR _totlen$2305[ebp]
	mov	ecx, DWORD PTR _xbuf$[ebp]
	mov	BYTE PTR [eax+ecx], 34			; 00000022H
	inc	DWORD PTR _totlen$2305[ebp]
; Line 4345
$L2358:
	jmp	$L2359
$L2322:
	mov	eax, DWORD PTR _ap$2306[ebp]
	movsx	eax, BYTE PTR [eax+5]
	or	eax, eax
	jne	$L2361
	mov	eax, DWORD PTR _ap$2306[ebp]
	movsx	eax, BYTE PTR [eax+6]
	or	eax, eax
	je	$L2360
$L2361:
; Line 4346
	mov	eax, DWORD PTR _arg$2318[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _p1$2362[ebp], eax
; Line 4347
	mov	eax, DWORD PTR _arg$2318[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, DWORD PTR _p1$2362[ebp]
	mov	DWORD PTR _l1$2363[ebp], eax
; Line 4348
	mov	eax, DWORD PTR _ap$2306[ebp]
	movsx	eax, BYTE PTR [eax+5]
	or	eax, eax
	je	$L2364
; Line 4349
$L2366:
	mov	eax, DWORD PTR _p1$2362[ebp]
	cmp	DWORD PTR _l1$2363[ebp], eax
	je	$L2367
	mov	eax, DWORD PTR _p1$2362[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	al, BYTE PTR _is_space[eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L2367
	inc	DWORD PTR _p1$2362[ebp]
	jmp	$L2366
$L2367:
; Line 4350
$L2369:
	mov	eax, DWORD PTR _p1$2362[ebp]
	cmp	DWORD PTR _l1$2363[ebp], eax
	je	$L2370
	mov	eax, DWORD PTR _p1$2362[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	al, BYTE PTR _is_idchar[eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L2370
; Line 4351
	mov	eax, DWORD PTR _p1$2362[ebp]
	mov	al, BYTE PTR [eax]
	mov	ecx, DWORD PTR _totlen$2305[ebp]
	mov	edx, DWORD PTR _xbuf$[ebp]
	mov	BYTE PTR [ecx+edx], al
	inc	DWORD PTR _p1$2362[ebp]
	inc	DWORD PTR _totlen$2305[ebp]
	jmp	$L2369
$L2370:
; Line 4355
	mov	eax, DWORD PTR _p1$2362[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 10					; 0000000aH
	jne	$L2371
	mov	eax, DWORD PTR _p1$2362[ebp]
	mov	al, BYTE PTR [eax+1]
	and	eax, 255				; 000000ffH
	cmp	eax, 45					; 0000002dH
	jne	$L2371
; Line 4356
	add	DWORD PTR _p1$2362[ebp], 2
; Line 4357
$L2371:
; Line 4358
$L2364:
	mov	eax, DWORD PTR _ap$2306[ebp]
	movsx	eax, BYTE PTR [eax+6]
	or	eax, eax
	je	$L2372
; Line 4361
$L2374:
	mov	eax, DWORD PTR _p1$2362[ebp]
	cmp	DWORD PTR _l1$2363[ebp], eax
	je	$L2375
; Line 4362
	mov	eax, DWORD PTR _l1$2363[ebp]
	mov	al, BYTE PTR [eax-1]
	and	eax, 255				; 000000ffH
	mov	al, BYTE PTR _is_space[eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L2376
	dec	DWORD PTR _l1$2363[ebp]
; Line 4363
	jmp	$L2377
$L2376:
	mov	eax, DWORD PTR _l1$2363[ebp]
	mov	al, BYTE PTR [eax-1]
	and	eax, 255				; 000000ffH
	cmp	eax, 45					; 0000002dH
	jne	$L2378
; Line 4364
	mov	eax, DWORD PTR _l1$2363[ebp]
	dec	eax
	mov	DWORD PTR _p2$2379[ebp], eax
; Line 4367
$L2381:
	mov	eax, DWORD PTR _p1$2362[ebp]
	cmp	DWORD PTR _p2$2379[ebp], eax
	je	$L2382
	mov	eax, DWORD PTR _p2$2379[ebp]
	mov	al, BYTE PTR [eax-1]
	and	eax, 255				; 000000ffH
	cmp	eax, 10					; 0000000aH
	jne	$L2382
	dec	DWORD PTR _p2$2379[ebp]
	jmp	$L2381
$L2382:
; Line 4368
	mov	eax, DWORD PTR _l1$2363[ebp]
	inc	eax
	sub	eax, DWORD PTR _p2$2379[ebp]
	test	al, 1
	je	$L2383
; Line 4369
	sub	DWORD PTR _l1$2363[ebp], 2
; Line 4371
	jmp	$L2384
$L2383:
	jmp	$L2375
$L2384:
; Line 4373
	jmp	$L2385
$L2378:
	jmp	$L2375
$L2385:
$L2377:
; Line 4374
	jmp	$L2374
$L2375:
; Line 4376
$L2372:
	mov	eax, DWORD PTR _l1$2363[ebp]
	sub	eax, DWORD PTR _p1$2362[ebp]
	push	eax
	mov	eax, DWORD PTR _totlen$2305[ebp]
	add	eax, DWORD PTR _xbuf$[ebp]
	push	eax
	mov	eax, DWORD PTR _p1$2362[ebp]
	push	eax
	call	_bcopy
	add	esp, 12					; 0000000cH
; Line 4377
	mov	eax, DWORD PTR _l1$2363[ebp]
	sub	eax, DWORD PTR _p1$2362[ebp]
	add	DWORD PTR _totlen$2305[ebp], eax
; Line 4378
	jmp	$L2386
$L2360:
; Line 4379
	mov	eax, DWORD PTR _arg$2318[ebp]
	mov	eax, DWORD PTR [eax+12]
	push	eax
	mov	eax, DWORD PTR _totlen$2305[ebp]
	add	eax, DWORD PTR _xbuf$[ebp]
	push	eax
	mov	eax, DWORD PTR _arg$2318[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_bcopy
	add	esp, 12					; 0000000cH
; Line 4380
	mov	eax, DWORD PTR _arg$2318[ebp]
	mov	eax, DWORD PTR [eax+12]
	add	DWORD PTR _totlen$2305[ebp], eax
; Line 4381
$L2386:
$L2359:
; Line 4383
	mov	eax, DWORD PTR _xbuf_len$[ebp]
	cmp	DWORD PTR _totlen$2305[ebp], eax
	jle	$L2387
; Line 4384
	call	_abort
; Line 4385
$L2387:
	jmp	$L2316
$L2317:
; Line 4390
	mov	eax, DWORD PTR _offset$2304[ebp]
	mov	DWORD PTR _i$2267[ebp], eax
	jmp	$L2388
$L2389:
	inc	DWORD PTR _i$2267[ebp]
$L2388:
	mov	eax, DWORD PTR _defn$[ebp]
	mov	ecx, DWORD PTR _i$2267[ebp]
	cmp	DWORD PTR [eax+4], ecx
	jle	$L2390
; Line 4391
	mov	eax, DWORD PTR _i$2267[ebp]
	mov	ecx, DWORD PTR _exp$2303[ebp]
	mov	al, BYTE PTR [eax+ecx]
	mov	ecx, DWORD PTR _totlen$2305[ebp]
	mov	edx, DWORD PTR _xbuf$[ebp]
	mov	BYTE PTR [ecx+edx], al
	inc	DWORD PTR _totlen$2305[ebp]
	jmp	$L2389
$L2390:
; Line 4393
	mov	eax, DWORD PTR _totlen$2305[ebp]
	mov	ecx, DWORD PTR _xbuf$[ebp]
	mov	BYTE PTR [eax+ecx], 0
; Line 4394
	mov	eax, DWORD PTR _totlen$2305[ebp]
	mov	DWORD PTR _xbuf_len$[ebp], eax
; Line 4396
	mov	DWORD PTR _i$2267[ebp], 0
	jmp	$L2391
$L2392:
	inc	DWORD PTR _i$2267[ebp]
$L2391:
	mov	eax, DWORD PTR _nargs$[ebp]
	cmp	DWORD PTR _i$2267[ebp], eax
	jge	$L2393
; Line 4397
	mov	eax, DWORD PTR _i$2267[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _args$2268[ebp]
	cmp	DWORD PTR [eax+ecx+20], 0
	je	$L2394
; Line 4398
	mov	eax, DWORD PTR _i$2267[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _args$2268[ebp]
	mov	eax, DWORD PTR [eax+ecx+20]
	push	eax
	call	_free
	add	esp, 4
; Line 4399
$L2394:
	mov	eax, DWORD PTR _i$2267[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _args$2268[ebp]
	cmp	DWORD PTR [eax+ecx+24], 0
	je	$L2395
; Line 4400
	mov	eax, DWORD PTR _i$2267[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _args$2268[ebp]
	mov	eax, DWORD PTR [eax+ecx+24]
	push	eax
	call	_free
	add	esp, 4
; Line 4401
$L2395:
	jmp	$L2392
$L2393:
; Line 4402
$L2302:
; Line 4403
	jmp	$L2396
$L2266:
; Line 4404
	mov	eax, DWORD PTR _defn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _xbuf$[ebp], eax
; Line 4405
	mov	eax, DWORD PTR _defn$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _xbuf_len$[ebp], eax
; Line 4406
$L2396:
; Line 4413
	inc	DWORD PTR _indepth
	mov	eax, DWORD PTR _indepth
	shl	eax, 5
	add	eax, OFFSET _instack
	mov	DWORD PTR _ip2$2397[ebp], eax
; Line 4415
	mov	eax, DWORD PTR _ip2$2397[ebp]
	mov	DWORD PTR [eax], 0
; Line 4416
	mov	eax, DWORD PTR _ip2$2397[ebp]
	mov	DWORD PTR [eax+4], 0
; Line 4417
	mov	eax, DWORD PTR _xbuf$[ebp]
	mov	ecx, DWORD PTR _ip2$2397[ebp]
	mov	DWORD PTR [ecx+12], eax
; Line 4418
	mov	eax, DWORD PTR _xbuf_len$[ebp]
	mov	ecx, DWORD PTR _ip2$2397[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 4419
	mov	eax, DWORD PTR _xbuf$[ebp]
	mov	ecx, DWORD PTR _ip2$2397[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 4420
	cmp	DWORD PTR _nargs$[ebp], 0
	jle	$L2944
	mov	eax, DWORD PTR _xbuf$[ebp]
	mov	ecx, DWORD PTR _ip2$2397[ebp]
	mov	DWORD PTR [ecx+28], eax
	jmp	$L2945
$L2944:
	mov	eax, DWORD PTR _ip2$2397[ebp]
	mov	DWORD PTR [eax+28], 0
$L2945:
; Line 4421
	mov	eax, DWORD PTR _hp$[ebp]
	mov	ecx, DWORD PTR _ip2$2397[ebp]
	mov	DWORD PTR [ecx+20], eax
; Line 4422
	mov	eax, DWORD PTR _if_stack
	mov	ecx, DWORD PTR _ip2$2397[ebp]
	mov	DWORD PTR [ecx+24], eax
; Line 4428
	cmp	DWORD PTR _traditional, 0
	jne	$L2398
; Line 4429
	mov	eax, DWORD PTR _hp$[ebp]
	mov	DWORD PTR [eax+12], 24			; 00000018H
; Line 4430
$L2398:
; Line 4431
$L2257:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_macroexpand ENDP
_TEXT	ENDS
PUBLIC	_macarg1
PUBLIC	_discard_comments
_DATA	SEGMENT
	ORG $+2
$SG2418	DB	'unterminated macro call', 00H
_DATA	ENDS
_TEXT	SEGMENT
$T2946 = -116
_c$2438 = -84
_argptr$ = 8
_ip$ = -16
_paren$ = -12
_newlines$ = -8
_comments$ = -4
_bp$ = -20
_bufsize$2410 = -32
_extra$2411 = -28
_buffer$2412 = -24
_final_start$2413 = -36
_obuf$2425 = -68
_buf$2426 = -76
_lim$2427 = -72
_totlen$2428 = -80
_macarg	PROC NEAR
; Line 4441
	push	ebp
	mov	ebp, esp
	sub	esp, 120				; 00000078H
	push	ebx
	push	esi
	push	edi
; Line 4442
	mov	eax, DWORD PTR _indepth
	shl	eax, 5
	add	eax, OFFSET _instack
	mov	DWORD PTR _ip$[ebp], eax
; Line 4443
	mov	DWORD PTR _paren$[ebp], 0
; Line 4444
	mov	DWORD PTR _newlines$[ebp], 0
; Line 4445
	mov	DWORD PTR _comments$[ebp], 0
; Line 4450
	lea	eax, DWORD PTR _comments$[ebp]
	push	eax
	lea	eax, DWORD PTR _newlines$[ebp]
	push	eax
	lea	eax, DWORD PTR _paren$[ebp]
	push	eax
	mov	eax, DWORD PTR _ip$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _ip$[ebp]
	add	eax, DWORD PTR [ecx+12]
	push	eax
	mov	eax, DWORD PTR _ip$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_macarg1
	add	esp, 20					; 00000014H
	mov	DWORD PTR _bp$[ebp], eax
; Line 4455
	mov	eax, DWORD PTR _ip$[ebp]
	cmp	DWORD PTR [eax], 0
	je	$L2407
	cmp	DWORD PTR _newlines$[ebp], 0
	jne	$L2406
	cmp	DWORD PTR _comments$[ebp], 0
	jne	$L2406
$L2407:
	mov	eax, DWORD PTR _ip$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _ip$[ebp]
	add	eax, DWORD PTR [ecx+12]
	cmp	eax, DWORD PTR _bp$[ebp]
	je	$L2406
; Line 4456
	cmp	DWORD PTR _argptr$[ebp], 0
	je	$L2408
; Line 4457
	mov	eax, DWORD PTR _ip$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _argptr$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 4458
	mov	eax, DWORD PTR _bp$[ebp]
	mov	ecx, DWORD PTR _ip$[ebp]
	sub	eax, DWORD PTR [ecx+16]
	mov	ecx, DWORD PTR _argptr$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 4460
$L2408:
	mov	eax, DWORD PTR _bp$[ebp]
	mov	ecx, DWORD PTR _ip$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 4461
	jmp	$L2409
$L2406:
; Line 4466
	mov	eax, DWORD PTR _bp$[ebp]
	mov	ecx, DWORD PTR _ip$[ebp]
	sub	eax, DWORD PTR [ecx+16]
	mov	DWORD PTR _bufsize$2410[ebp], eax
; Line 4467
	mov	eax, DWORD PTR _newlines$[ebp]
	mov	DWORD PTR _extra$2411[ebp], eax
; Line 4468
	mov	eax, DWORD PTR _extra$2411[ebp]
	add	eax, DWORD PTR _bufsize$2410[ebp]
	inc	eax
	push	eax
	call	_xmalloc
	add	esp, 4
	mov	DWORD PTR _buffer$2412[ebp], eax
; Line 4469
	mov	DWORD PTR _final_start$2413[ebp], 0
; Line 4471
	mov	eax, DWORD PTR _bufsize$2410[ebp]
	push	eax
	mov	eax, DWORD PTR _buffer$2412[ebp]
	push	eax
	mov	eax, DWORD PTR _ip$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_bcopy
	add	esp, 12					; 0000000cH
; Line 4472
	mov	eax, DWORD PTR _bp$[ebp]
	mov	ecx, DWORD PTR _ip$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 4473
	mov	eax, DWORD PTR _newlines$[ebp]
	mov	ecx, DWORD PTR _ip$[ebp]
	add	DWORD PTR [ecx+4], eax
; Line 4475
$L2415:
	mov	eax, DWORD PTR _ip$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _ip$[ebp]
	add	eax, DWORD PTR [ecx+12]
	cmp	eax, DWORD PTR _bp$[ebp]
	jne	$L2416
; Line 4476
	mov	eax, DWORD PTR _indepth
	shl	eax, 5
	cmp	DWORD PTR _instack[eax+20], 0
	jne	$L2417
; Line 4477
	mov	eax, DWORD PTR _buffer$2412[ebp]
	push	eax
	call	_free
	add	esp, 4
; Line 4478
	mov	eax, OFFSET $SG2418
	jmp	$L2400
; Line 4480
$L2417:
	mov	eax, DWORD PTR _ip$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR [eax+12], 23			; 00000017H
; Line 4481
	mov	eax, DWORD PTR _ip$[ebp]
	mov	eax, DWORD PTR [eax+12]
	push	eax
	call	_free
	add	esp, 4
; Line 4482
	dec	DWORD PTR _indepth
	mov	eax, DWORD PTR _indepth
	shl	eax, 5
	add	eax, OFFSET _instack
	mov	DWORD PTR _ip$[ebp], eax
; Line 4483
	mov	DWORD PTR _newlines$[ebp], 0
; Line 4484
	mov	DWORD PTR _comments$[ebp], 0
; Line 4486
	lea	eax, DWORD PTR _comments$[ebp]
	push	eax
	lea	eax, DWORD PTR _newlines$[ebp]
	push	eax
	lea	eax, DWORD PTR _paren$[ebp]
	push	eax
	mov	eax, DWORD PTR _ip$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _ip$[ebp]
	add	eax, DWORD PTR [ecx+12]
	push	eax
	mov	eax, DWORD PTR _ip$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_macarg1
	add	esp, 20					; 00000014H
	mov	DWORD PTR _bp$[ebp], eax
; Line 4487
	mov	eax, DWORD PTR _bufsize$2410[ebp]
	mov	DWORD PTR _final_start$2413[ebp], eax
; Line 4488
	mov	eax, DWORD PTR _bp$[ebp]
	mov	ecx, DWORD PTR _ip$[ebp]
	sub	eax, DWORD PTR [ecx+16]
	add	DWORD PTR _bufsize$2410[ebp], eax
; Line 4489
	mov	eax, DWORD PTR _newlines$[ebp]
	add	DWORD PTR _extra$2411[ebp], eax
; Line 4490
	mov	eax, DWORD PTR _extra$2411[ebp]
	add	eax, DWORD PTR _bufsize$2410[ebp]
	inc	eax
	push	eax
	mov	eax, DWORD PTR _buffer$2412[ebp]
	push	eax
	call	_xrealloc
	add	esp, 8
	mov	DWORD PTR _buffer$2412[ebp], eax
; Line 4491
	mov	eax, DWORD PTR _bp$[ebp]
	mov	ecx, DWORD PTR _ip$[ebp]
	sub	eax, DWORD PTR [ecx+16]
	push	eax
	mov	eax, DWORD PTR _bufsize$2410[ebp]
	add	eax, DWORD PTR _buffer$2412[ebp]
	mov	ecx, DWORD PTR _bp$[ebp]
	mov	edx, DWORD PTR _ip$[ebp]
	sub	ecx, DWORD PTR [edx+16]
	sub	eax, ecx
	push	eax
	mov	eax, DWORD PTR _ip$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_bcopy
	add	esp, 12					; 0000000cH
; Line 4492
	mov	eax, DWORD PTR _bp$[ebp]
	mov	ecx, DWORD PTR _ip$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 4493
	mov	eax, DWORD PTR _newlines$[ebp]
	mov	ecx, DWORD PTR _ip$[ebp]
	add	DWORD PTR [ecx+4], eax
; Line 4494
	jmp	$L2415
$L2416:
; Line 4501
	cmp	DWORD PTR _argptr$[ebp], 0
	je	$L2419
; Line 4502
	mov	eax, DWORD PTR _buffer$2412[ebp]
	mov	ecx, DWORD PTR _argptr$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 4503
	mov	eax, DWORD PTR _bufsize$2410[ebp]
	mov	ecx, DWORD PTR _argptr$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 4504
	mov	eax, DWORD PTR _buffer$2412[ebp]
	mov	ecx, DWORD PTR _argptr$[ebp]
	mov	DWORD PTR [ecx+20], eax
; Line 4505
	mov	al, BYTE PTR _newlines$[ebp]
	mov	ecx, DWORD PTR _argptr$[ebp]
	mov	BYTE PTR [ecx+28], al
; Line 4506
	mov	al, BYTE PTR _comments$[ebp]
	mov	ecx, DWORD PTR _argptr$[ebp]
	mov	BYTE PTR [ecx+29], al
; Line 4507
	cmp	DWORD PTR _newlines$[ebp], 0
	jne	$L2421
	cmp	DWORD PTR _comments$[ebp], 0
	je	$L2420
$L2421:
	mov	eax, DWORD PTR _ip$[ebp]
	cmp	DWORD PTR [eax], 0
	je	$L2420
; Line 4512
	mov	eax, DWORD PTR _newlines$[ebp]
	push	eax
	mov	eax, DWORD PTR _argptr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	sub	eax, DWORD PTR _final_start$2413[ebp]
	push	eax
	mov	eax, DWORD PTR _argptr$[ebp]
	mov	eax, DWORD PTR [eax]
	add	eax, DWORD PTR _final_start$2413[ebp]
	push	eax
	call	_discard_comments
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _final_start$2413[ebp]
	add	ecx, eax
	mov	eax, DWORD PTR _argptr$[ebp]
	mov	DWORD PTR [eax+8], ecx
; Line 4513
$L2420:
	mov	eax, DWORD PTR _argptr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _argptr$[ebp]
	mov	ecx, DWORD PTR [ecx]
	mov	BYTE PTR [eax+ecx], 0
; Line 4514
	mov	eax, DWORD PTR _extra$2411[ebp]
	add	eax, DWORD PTR _bufsize$2410[ebp]
	mov	ecx, DWORD PTR _argptr$[ebp]
	cmp	eax, DWORD PTR [ecx+8]
	jge	$L2423
; Line 4515
	call	_abort
; Line 4516
$L2423:
; Line 4517
$L2419:
$L2409:
; Line 4523
	cmp	DWORD PTR _argptr$[ebp], 0
	je	$L2424
; Line 4530
	push	1
	mov	eax, DWORD PTR _argptr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _argptr$[ebp]
	add	eax, DWORD PTR [ecx]
	push	eax
	mov	eax, DWORD PTR _argptr$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	lea	eax, DWORD PTR $T2946[ebp]
	push	eax
	call	_expand_to_temp_buffer
	add	esp, 16					; 00000010H
	lea	edi, DWORD PTR _obuf$2425[ebp]
	mov	esi, eax
	mov	ecx, 8
	rep	movsd
; Line 4532
	mov	eax, DWORD PTR _obuf$2425[ebp+12]
	mov	ecx, DWORD PTR _argptr$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 4533
	mov	eax, DWORD PTR _obuf$2425[ebp+8]
	mov	ecx, DWORD PTR _argptr$[ebp]
	mov	DWORD PTR [ecx+12], eax
; Line 4534
	mov	eax, DWORD PTR _obuf$2425[ebp+12]
	mov	ecx, DWORD PTR _argptr$[ebp]
	mov	DWORD PTR [ecx+24], eax
; Line 4536
	mov	eax, DWORD PTR _argptr$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _buf$2426[ebp], eax
; Line 4537
	mov	eax, DWORD PTR _argptr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, DWORD PTR _buf$2426[ebp]
	mov	DWORD PTR _lim$2427[ebp], eax
; Line 4539
$L2430:
	mov	eax, DWORD PTR _buf$2426[ebp]
	cmp	DWORD PTR _lim$2427[ebp], eax
	je	$L2431
	mov	eax, DWORD PTR _buf$2426[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	al, BYTE PTR _is_space[eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L2431
; Line 4540
	inc	DWORD PTR _buf$2426[ebp]
	jmp	$L2430
$L2431:
; Line 4541
$L2433:
	mov	eax, DWORD PTR _buf$2426[ebp]
	cmp	DWORD PTR _lim$2427[ebp], eax
	je	$L2434
	mov	eax, DWORD PTR _lim$2427[ebp]
	mov	al, BYTE PTR [eax-1]
	and	eax, 255				; 000000ffH
	mov	al, BYTE PTR _is_space[eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L2434
; Line 4542
	dec	DWORD PTR _lim$2427[ebp]
	jmp	$L2433
$L2434:
; Line 4543
	cmp	DWORD PTR _traditional, 1
	sbb	eax, eax
	and	eax, 2
	mov	DWORD PTR _totlen$2428[ebp], eax
; Line 4544
$L2436:
	mov	eax, DWORD PTR _buf$2426[ebp]
	cmp	DWORD PTR _lim$2427[ebp], eax
	je	$L2437
; Line 4545
	mov	eax, DWORD PTR _buf$2426[ebp]
	mov	al, BYTE PTR [eax]
	mov	BYTE PTR _c$2438[ebp], al
	inc	DWORD PTR _buf$2426[ebp]
; Line 4546
	inc	DWORD PTR _totlen$2428[ebp]
; Line 4548
	xor	eax, eax
	mov	al, BYTE PTR _c$2438[ebp]
	mov	al, BYTE PTR _is_space[eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L2439
; Line 4549
$L2440:
$L2444:
	mov	eax, DWORD PTR _buf$2426[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	al, BYTE PTR _is_space[eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L2445
	inc	DWORD PTR _buf$2426[ebp]
	jmp	$L2444
$L2445:
$L2441:
$L2442:
; Line 4550
	jmp	$L2446
$L2439:
	xor	eax, eax
	mov	al, BYTE PTR _c$2438[ebp]
	cmp	eax, 34					; 00000022H
	je	$L2448
	xor	eax, eax
	mov	al, BYTE PTR _c$2438[ebp]
	cmp	eax, 92					; 0000005cH
	jne	$L2447
$L2448:
; Line 4551
	inc	DWORD PTR _totlen$2428[ebp]
; Line 4552
	jmp	$L2449
$L2447:
	cmp	DWORD PTR ___mb_cur_max, 1
	jle	$L2947
	push	343					; 00000157H
	xor	eax, eax
	mov	al, BYTE PTR _c$2438[ebp]
	push	eax
	call	__isctype
	add	esp, 8
	mov	DWORD PTR -120+[ebp], eax
	jmp	$L2948
$L2947:
	xor	eax, eax
	mov	al, BYTE PTR _c$2438[ebp]
	mov	ecx, DWORD PTR __pctype
	mov	ax, WORD PTR [ecx+eax*2]
	and	eax, 343				; 00000157H
	mov	DWORD PTR -120+[ebp], eax
$L2948:
	cmp	DWORD PTR -120+[ebp], 0
	jne	$L2450
; Line 4553
	add	DWORD PTR _totlen$2428[ebp], 3
; Line 4554
$L2450:
$L2449:
$L2446:
	jmp	$L2436
$L2437:
; Line 4555
	mov	eax, DWORD PTR _totlen$2428[ebp]
	mov	ecx, DWORD PTR _argptr$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 4557
$L2424:
	sub	eax, eax
	jmp	$L2400
; Line 4558
$L2400:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_macarg	ENDP
_start$ = 8
_limit$ = 12
_depthptr$ = 16
_newlines$ = 20
_comments$ = 24
_bp$ = -4
_quotec$2487 = -8
_macarg1 PROC NEAR
; Line 4577
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 4578
	mov	eax, DWORD PTR _start$[ebp]
	mov	DWORD PTR _bp$[ebp], eax
; Line 4580
$L2459:
	mov	eax, DWORD PTR _limit$[ebp]
	cmp	DWORD PTR _bp$[ebp], eax
	jae	$L2460
; Line 4581
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR -16+[ebp], eax
	jmp	$L2461
; Line 4582
$L2465:
; Line 4583
	mov	eax, DWORD PTR _depthptr$[ebp]
	inc	DWORD PTR [eax]
; Line 4584
	jmp	$L2462
; Line 4585
$L2466:
; Line 4586
	mov	eax, DWORD PTR _depthptr$[ebp]
	dec	DWORD PTR [eax]
	mov	eax, DWORD PTR _depthptr$[ebp]
	cmp	DWORD PTR [eax], 0
	jge	$L2467
; Line 4587
	mov	eax, DWORD PTR _bp$[ebp]
	jmp	$L2456
; Line 4588
$L2467:
	jmp	$L2462
; Line 4589
$L2468:
; Line 4591
	mov	eax, DWORD PTR _bp$[ebp]
	inc	eax
	cmp	eax, DWORD PTR _limit$[ebp]
	jae	$L2469
; Line 4593
	inc	DWORD PTR _bp$[ebp]
; Line 4595
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 10					; 0000000aH
	jne	$L2470
; Line 4596
	mov	eax, DWORD PTR _newlines$[ebp]
	inc	DWORD PTR [eax]
; Line 4597
$L2470:
; Line 4598
$L2469:
	jmp	$L2462
; Line 4599
$L2471:
; Line 4600
	mov	eax, DWORD PTR _newlines$[ebp]
	inc	DWORD PTR [eax]
; Line 4601
	jmp	$L2462
; Line 4602
$L2472:
; Line 4603
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax+1]
	and	eax, 255				; 000000ffH
	cmp	eax, 92					; 0000005cH
	jne	$L2473
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax+2]
	and	eax, 255				; 000000ffH
	cmp	eax, 10					; 0000000aH
	jne	$L2473
; Line 4604
	mov	eax, DWORD PTR _bp$[ebp]
	inc	eax
	push	eax
	call	_newline_fix
	add	esp, 4
; Line 4605
$L2473:
	cmp	DWORD PTR _cplusplus, 0
	je	$L2474
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax+1]
	and	eax, 255				; 000000ffH
	cmp	eax, 47					; 0000002fH
	jne	$L2474
; Line 4606
	mov	eax, DWORD PTR _comments$[ebp]
	mov	DWORD PTR [eax], 1
; Line 4607
	add	DWORD PTR _bp$[ebp], 2
; Line 4608
$L2476:
	mov	eax, DWORD PTR _limit$[ebp]
	cmp	DWORD PTR _bp$[ebp], eax
	jae	$L2477
	mov	eax, DWORD PTR _bp$[ebp]
	mov	DWORD PTR -12+[ebp], eax
	inc	DWORD PTR _bp$[ebp]
	mov	eax, DWORD PTR -12+[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 10					; 0000000aH
	je	$L2477
	jmp	$L2476
$L2477:
; Line 4609
	mov	eax, DWORD PTR _newlines$[ebp]
	inc	DWORD PTR [eax]
; Line 4610
	jmp	$L2462
; Line 4612
$L2474:
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax+1]
	and	eax, 255				; 000000ffH
	cmp	eax, 42					; 0000002aH
	jne	$L2479
	mov	eax, DWORD PTR _bp$[ebp]
	inc	eax
	cmp	eax, DWORD PTR _limit$[ebp]
	jb	$L2478
$L2479:
; Line 4613
	jmp	$L2462
; Line 4614
$L2478:
	mov	eax, DWORD PTR _comments$[ebp]
	mov	DWORD PTR [eax], 1
; Line 4615
	add	DWORD PTR _bp$[ebp], 2
; Line 4616
$L2481:
	mov	eax, DWORD PTR _bp$[ebp]
	inc	eax
	cmp	eax, DWORD PTR _limit$[ebp]
	jae	$L2482
; Line 4618
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 42					; 0000002aH
	jne	$L2483
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax+1]
	and	eax, 255				; 000000ffH
	cmp	eax, 92					; 0000005cH
	jne	$L2483
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax+2]
	and	eax, 255				; 000000ffH
	cmp	eax, 10					; 0000000aH
	jne	$L2483
; Line 4619
	mov	eax, DWORD PTR _bp$[ebp]
	inc	eax
	push	eax
	call	_newline_fix
	add	esp, 4
; Line 4620
$L2483:
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 42					; 0000002aH
	jne	$L2484
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax+1]
	and	eax, 255				; 000000ffH
	cmp	eax, 47					; 0000002fH
	jne	$L2484
; Line 4621
	jmp	$L2482
; Line 4622
$L2484:
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 10					; 0000000aH
	jne	$L2485
	mov	eax, DWORD PTR _newlines$[ebp]
	inc	DWORD PTR [eax]
; Line 4623
$L2485:
	inc	DWORD PTR _bp$[ebp]
; Line 4624
	jmp	$L2481
$L2482:
; Line 4625
	jmp	$L2462
; Line 4626
$L2486:
; Line 4630
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _quotec$2487[ebp], eax
	inc	DWORD PTR _bp$[ebp]
	jmp	$L2488
$L2489:
	inc	DWORD PTR _bp$[ebp]
$L2488:
	mov	eax, DWORD PTR _bp$[ebp]
	inc	eax
	cmp	eax, DWORD PTR _limit$[ebp]
	jae	$L2490
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, DWORD PTR _quotec$2487[ebp]
	je	$L2490
; Line 4631
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 92					; 0000005cH
	jne	$L2491
; Line 4632
	inc	DWORD PTR _bp$[ebp]
; Line 4633
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 10					; 0000000aH
	jne	$L2492
; Line 4634
	mov	eax, DWORD PTR _newlines$[ebp]
	inc	DWORD PTR [eax]
; Line 4635
$L2492:
$L2494:
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 92					; 0000005cH
	jne	$L2495
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax+1]
	and	eax, 255				; 000000ffH
	cmp	eax, 10					; 0000000aH
	jne	$L2495
; Line 4636
	add	DWORD PTR _bp$[ebp], 2
; Line 4637
	jmp	$L2494
$L2495:
; Line 4638
	jmp	$L2496
$L2491:
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 10					; 0000000aH
	jne	$L2497
; Line 4639
	mov	eax, DWORD PTR _newlines$[ebp]
	inc	DWORD PTR [eax]
; Line 4640
	cmp	DWORD PTR _quotec$2487[ebp], 39		; 00000027H
	jne	$L2498
; Line 4641
	jmp	$L2490
; Line 4642
$L2498:
; Line 4643
$L2497:
$L2496:
	jmp	$L2489
$L2490:
; Line 4645
	jmp	$L2462
; Line 4646
$L2499:
; Line 4647
	mov	eax, DWORD PTR _depthptr$[ebp]
	cmp	DWORD PTR [eax], 0
	jne	$L2500
; Line 4648
	mov	eax, DWORD PTR _bp$[ebp]
	jmp	$L2456
; Line 4649
$L2500:
	jmp	$L2462
; Line 4650
	jmp	$L2462
$L2461:
	cmp	DWORD PTR -16+[ebp], 41			; 00000029H
	jg	$L2949
	je	$L2466
	cmp	DWORD PTR -16+[ebp], 10			; 0000000aH
	je	$L2471
	cmp	DWORD PTR -16+[ebp], 34			; 00000022H
	je	$L2486
	cmp	DWORD PTR -16+[ebp], 39			; 00000027H
	je	$L2486
	cmp	DWORD PTR -16+[ebp], 40			; 00000028H
	je	$L2465
	jmp	$L2462
$L2949:
	cmp	DWORD PTR -16+[ebp], 44			; 0000002cH
	je	$L2499
	cmp	DWORD PTR -16+[ebp], 47			; 0000002fH
	je	$L2472
	cmp	DWORD PTR -16+[ebp], 92			; 0000005cH
	je	$L2468
	jmp	$L2462
$L2462:
; Line 4651
	inc	DWORD PTR _bp$[ebp]
; Line 4652
	jmp	$L2459
$L2460:
; Line 4654
	mov	eax, DWORD PTR _bp$[ebp]
	jmp	$L2456
; Line 4655
$L2456:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_macarg1 ENDP
_start$ = 8
_length$ = 12
_newlines$ = 16
_ibp$ = -4
_obp$ = -8
_limit$ = -16
_c$ = -12
_quotec$2535 = -20
_discard_comments PROC NEAR
; Line 4671
	push	ebp
	mov	ebp, esp
	sub	esp, 28					; 0000001cH
	push	ebx
	push	esi
	push	edi
; Line 4684
	cmp	DWORD PTR _newlines$[ebp], 0
	jle	$L2509
; Line 4685
	mov	eax, DWORD PTR _length$[ebp]
	add	eax, DWORD PTR _start$[ebp]
	mov	DWORD PTR _ibp$[ebp], eax
; Line 4686
	mov	eax, DWORD PTR _newlines$[ebp]
	add	eax, DWORD PTR _ibp$[ebp]
	mov	DWORD PTR _obp$[ebp], eax
; Line 4687
	mov	eax, DWORD PTR _start$[ebp]
	mov	DWORD PTR _limit$[ebp], eax
; Line 4688
$L2511:
	mov	eax, DWORD PTR _ibp$[ebp]
	cmp	DWORD PTR _limit$[ebp], eax
	je	$L2512
; Line 4689
	dec	DWORD PTR _obp$[ebp]
	dec	DWORD PTR _ibp$[ebp]
	mov	eax, DWORD PTR _ibp$[ebp]
	mov	al, BYTE PTR [eax]
	mov	ecx, DWORD PTR _obp$[ebp]
	mov	BYTE PTR [ecx], al
	jmp	$L2511
$L2512:
; Line 4692
$L2509:
	mov	eax, DWORD PTR _newlines$[ebp]
	add	eax, DWORD PTR _start$[ebp]
	mov	DWORD PTR _ibp$[ebp], eax
; Line 4693
	mov	eax, DWORD PTR _newlines$[ebp]
	add	eax, DWORD PTR _length$[ebp]
	add	eax, DWORD PTR _start$[ebp]
	mov	DWORD PTR _limit$[ebp], eax
; Line 4694
	mov	eax, DWORD PTR _start$[ebp]
	mov	DWORD PTR _obp$[ebp], eax
; Line 4696
$L2514:
	mov	eax, DWORD PTR _ibp$[ebp]
	cmp	DWORD PTR _limit$[ebp], eax
	jbe	$L2515
; Line 4697
	mov	eax, DWORD PTR _ibp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _c$[ebp], eax
	inc	DWORD PTR _ibp$[ebp]
	mov	al, BYTE PTR _c$[ebp]
	mov	ecx, DWORD PTR _obp$[ebp]
	mov	BYTE PTR [ecx], al
	inc	DWORD PTR _obp$[ebp]
; Line 4698
	mov	eax, DWORD PTR _c$[ebp]
	mov	DWORD PTR -28+[ebp], eax
	jmp	$L2516
; Line 4699
$L2520:
; Line 4701
	mov	eax, DWORD PTR _obp$[ebp]
	mov	BYTE PTR [eax], 10			; 0000000aH
	inc	DWORD PTR _obp$[ebp]
; Line 4702
	jmp	$L2517
; Line 4704
$L2521:
; Line 4705
	mov	eax, DWORD PTR _ibp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 92					; 0000005cH
	jne	$L2522
	mov	eax, DWORD PTR _ibp$[ebp]
	mov	al, BYTE PTR [eax+1]
	and	eax, 255				; 000000ffH
	cmp	eax, 10					; 0000000aH
	jne	$L2522
; Line 4706
	mov	eax, DWORD PTR _ibp$[ebp]
	push	eax
	call	_newline_fix
	add	esp, 4
; Line 4708
$L2522:
	cmp	DWORD PTR _cplusplus, 0
	je	$L2523
	mov	eax, DWORD PTR _ibp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 47					; 0000002fH
	jne	$L2523
; Line 4709
	dec	DWORD PTR _obp$[ebp]
; Line 4710
	inc	DWORD PTR _ibp$[ebp]
; Line 4711
$L2525:
	mov	eax, DWORD PTR _ibp$[ebp]
	cmp	DWORD PTR _limit$[ebp], eax
	jbe	$L2526
	mov	eax, DWORD PTR _ibp$[ebp]
	mov	DWORD PTR -24+[ebp], eax
	inc	DWORD PTR _ibp$[ebp]
	mov	eax, DWORD PTR -24+[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 10					; 0000000aH
	je	$L2526
	jmp	$L2525
$L2526:
; Line 4712
	jmp	$L2517
; Line 4714
$L2523:
	mov	eax, DWORD PTR _ibp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 42					; 0000002aH
	jne	$L2528
	mov	eax, DWORD PTR _ibp$[ebp]
	inc	eax
	cmp	eax, DWORD PTR _limit$[ebp]
	jb	$L2527
$L2528:
; Line 4715
	jmp	$L2517
; Line 4716
$L2527:
	dec	DWORD PTR _obp$[ebp]
; Line 4717
	inc	DWORD PTR _ibp$[ebp]
; Line 4718
$L2530:
	mov	eax, DWORD PTR _ibp$[ebp]
	inc	eax
	cmp	eax, DWORD PTR _limit$[ebp]
	jae	$L2531
; Line 4720
	mov	eax, DWORD PTR _ibp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 42					; 0000002aH
	jne	$L2532
	mov	eax, DWORD PTR _ibp$[ebp]
	mov	al, BYTE PTR [eax+1]
	and	eax, 255				; 000000ffH
	cmp	eax, 92					; 0000005cH
	jne	$L2532
	mov	eax, DWORD PTR _ibp$[ebp]
	mov	al, BYTE PTR [eax+2]
	and	eax, 255				; 000000ffH
	cmp	eax, 10					; 0000000aH
	jne	$L2532
; Line 4721
	mov	eax, DWORD PTR _ibp$[ebp]
	inc	eax
	push	eax
	call	_newline_fix
	add	esp, 4
; Line 4722
$L2532:
	mov	eax, DWORD PTR _ibp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 42					; 0000002aH
	jne	$L2533
	mov	eax, DWORD PTR _ibp$[ebp]
	mov	al, BYTE PTR [eax+1]
	and	eax, 255				; 000000ffH
	cmp	eax, 47					; 0000002fH
	jne	$L2533
; Line 4723
	jmp	$L2531
; Line 4724
$L2533:
	inc	DWORD PTR _ibp$[ebp]
; Line 4725
	jmp	$L2530
$L2531:
; Line 4726
	add	DWORD PTR _ibp$[ebp], 2
; Line 4727
	jmp	$L2517
; Line 4729
$L2534:
; Line 4735
	mov	eax, DWORD PTR _c$[ebp]
	mov	DWORD PTR _quotec$2535[ebp], eax
; Line 4736
$L2537:
	mov	eax, DWORD PTR _ibp$[ebp]
	cmp	DWORD PTR _limit$[ebp], eax
	jbe	$L2538
; Line 4737
	mov	eax, DWORD PTR _ibp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _c$[ebp], eax
	inc	DWORD PTR _ibp$[ebp]
	mov	al, BYTE PTR _c$[ebp]
	mov	ecx, DWORD PTR _obp$[ebp]
	mov	BYTE PTR [ecx], al
	inc	DWORD PTR _obp$[ebp]
; Line 4738
	mov	eax, DWORD PTR _quotec$2535[ebp]
	cmp	DWORD PTR _c$[ebp], eax
	jne	$L2539
; Line 4739
	jmp	$L2538
; Line 4740
$L2539:
	cmp	DWORD PTR _c$[ebp], 10			; 0000000aH
	jne	$L2540
	cmp	DWORD PTR _quotec$2535[ebp], 39		; 00000027H
	jne	$L2540
; Line 4741
	jmp	$L2538
; Line 4742
$L2540:
	cmp	DWORD PTR _c$[ebp], 92			; 0000005cH
	jne	$L2541
	mov	eax, DWORD PTR _ibp$[ebp]
	cmp	DWORD PTR _limit$[ebp], eax
	jbe	$L2541
; Line 4743
$L2543:
	mov	eax, DWORD PTR _ibp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 92					; 0000005cH
	jne	$L2544
	mov	eax, DWORD PTR _ibp$[ebp]
	mov	al, BYTE PTR [eax+1]
	and	eax, 255				; 000000ffH
	cmp	eax, 10					; 0000000aH
	jne	$L2544
; Line 4744
	add	DWORD PTR _ibp$[ebp], 2
	jmp	$L2543
$L2544:
; Line 4745
	mov	eax, DWORD PTR _ibp$[ebp]
	mov	al, BYTE PTR [eax]
	mov	ecx, DWORD PTR _obp$[ebp]
	mov	BYTE PTR [ecx], al
	inc	DWORD PTR _ibp$[ebp]
	inc	DWORD PTR _obp$[ebp]
; Line 4747
$L2541:
	jmp	$L2537
$L2538:
; Line 4749
	jmp	$L2517
; Line 4750
	jmp	$L2517
$L2516:
	cmp	DWORD PTR -28+[ebp], 10			; 0000000aH
	je	$L2520
	cmp	DWORD PTR -28+[ebp], 34			; 00000022H
	je	$L2534
	cmp	DWORD PTR -28+[ebp], 39			; 00000027H
	je	$L2534
	cmp	DWORD PTR -28+[ebp], 47			; 0000002fH
	je	$L2521
	jmp	$L2517
$L2517:
; Line 4751
	jmp	$L2514
$L2515:
; Line 4753
	mov	eax, DWORD PTR _obp$[ebp]
	sub	eax, DWORD PTR _start$[ebp]
	jmp	$L2504
; Line 4754
$L2504:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_discard_comments ENDP
_TEXT	ENDS
_DATA	SEGMENT
$SG2557	DB	'%s:%d: ', 00H
$SG2558	DB	0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_msg$ = 8
_arg1$ = 12
_arg2$ = 16
_arg3$ = 20
_i$ = -4
_ip$ = -8
_error	PROC NEAR
; Line 4761
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 4763
	mov	DWORD PTR _ip$[ebp], 0
; Line 4765
	mov	eax, DWORD PTR _indepth
	mov	DWORD PTR _i$[ebp], eax
	jmp	$L2552
$L2553:
	dec	DWORD PTR _i$[ebp]
$L2552:
	cmp	DWORD PTR _i$[ebp], 0
	jl	$L2554
; Line 4766
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	cmp	DWORD PTR _instack[eax], 0
	je	$L2555
; Line 4767
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	add	eax, OFFSET _instack
	mov	DWORD PTR _ip$[ebp], eax
; Line 4768
	jmp	$L2554
; Line 4771
$L2555:
	jmp	$L2553
$L2554:
	cmp	DWORD PTR _ip$[ebp], 0
	je	$L2556
; Line 4772
	mov	eax, DWORD PTR _ip$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _ip$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	push	OFFSET $SG2557
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
; Line 4773
$L2556:
	mov	eax, DWORD PTR _arg3$[ebp]
	push	eax
	mov	eax, DWORD PTR _arg2$[ebp]
	push	eax
	mov	eax, DWORD PTR _arg1$[ebp]
	push	eax
	mov	eax, DWORD PTR _msg$[ebp]
	push	eax
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 20					; 00000014H
; Line 4774
	push	OFFSET $SG2558
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 8
; Line 4775
	inc	DWORD PTR _errors
; Line 4776
	sub	eax, eax
	jmp	$L2549
; Line 4777
$L2549:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_error	ENDP
_TEXT	ENDS
EXTRN	_errno:DWORD
EXTRN	__sys_errlist:BYTE
EXTRN	__sys_nerr:DWORD
_DATA	SEGMENT
	ORG $+2
$SG2568	DB	'%s:%d: ', 00H
$SG2570	DB	'%s: %s', 0aH, 00H
$SG2572	DB	'%s: undocumented I/O error', 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_i$ = -4
_ip$ = -8
_name$ = 8
_error_from_errno PROC NEAR
; Line 4783
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 4785
	mov	DWORD PTR _ip$[ebp], 0
; Line 4789
	mov	eax, DWORD PTR _indepth
	mov	DWORD PTR _i$[ebp], eax
	jmp	$L2563
$L2564:
	dec	DWORD PTR _i$[ebp]
$L2563:
	cmp	DWORD PTR _i$[ebp], 0
	jl	$L2565
; Line 4790
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	cmp	DWORD PTR _instack[eax], 0
	je	$L2566
; Line 4791
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	add	eax, OFFSET _instack
	mov	DWORD PTR _ip$[ebp], eax
; Line 4792
	jmp	$L2565
; Line 4795
$L2566:
	jmp	$L2564
$L2565:
	cmp	DWORD PTR _ip$[ebp], 0
	je	$L2567
; Line 4796
	mov	eax, DWORD PTR _ip$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _ip$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	push	OFFSET $SG2568
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
; Line 4798
$L2567:
	mov	eax, DWORD PTR _errno
	cmp	DWORD PTR __sys_nerr, eax
	jle	$L2569
; Line 4799
	mov	eax, DWORD PTR _errno
	mov	eax, DWORD PTR __sys_errlist[eax*4]
	push	eax
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	push	OFFSET $SG2570
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
; Line 4800
	jmp	$L2571
$L2569:
; Line 4801
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	push	OFFSET $SG2572
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
$L2571:
; Line 4803
	inc	DWORD PTR _errors
; Line 4804
	sub	eax, eax
	jmp	$L2560
; Line 4805
$L2560:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_error_from_errno ENDP
_TEXT	ENDS
_DATA	SEGMENT
$SG2585	DB	'%s:%d: ', 00H
$SG2586	DB	'warning: ', 00H
	ORG $+2
$SG2587	DB	0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_msg$ = 8
_arg1$ = 12
_arg2$ = 16
_arg3$ = 20
_i$ = -4
_ip$ = -8
_warning PROC NEAR
; Line 4811
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 4813
	mov	DWORD PTR _ip$[ebp], 0
; Line 4815
	mov	eax, DWORD PTR _indepth
	mov	DWORD PTR _i$[ebp], eax
	jmp	$L2580
$L2581:
	dec	DWORD PTR _i$[ebp]
$L2580:
	cmp	DWORD PTR _i$[ebp], 0
	jl	$L2582
; Line 4816
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	cmp	DWORD PTR _instack[eax], 0
	je	$L2583
; Line 4817
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	add	eax, OFFSET _instack
	mov	DWORD PTR _ip$[ebp], eax
; Line 4818
	jmp	$L2582
; Line 4821
$L2583:
	jmp	$L2581
$L2582:
	cmp	DWORD PTR _ip$[ebp], 0
	je	$L2584
; Line 4822
	mov	eax, DWORD PTR _ip$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _ip$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	push	OFFSET $SG2585
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
; Line 4823
$L2584:
	push	OFFSET $SG2586
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 8
; Line 4824
	mov	eax, DWORD PTR _arg3$[ebp]
	push	eax
	mov	eax, DWORD PTR _arg2$[ebp]
	push	eax
	mov	eax, DWORD PTR _arg1$[ebp]
	push	eax
	mov	eax, DWORD PTR _msg$[ebp]
	push	eax
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 20					; 00000014H
; Line 4825
	push	OFFSET $SG2587
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 8
; Line 4826
	sub	eax, eax
	jmp	$L2577
; Line 4827
$L2577:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_warning ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+2
$SG2601	DB	'%s:%d: ', 00H
$SG2602	DB	0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_line$ = 8
_msg$ = 12
_arg1$ = 16
_arg2$ = 20
_arg3$ = 24
_i$ = -4
_ip$ = -8
_error_with_line PROC NEAR
; Line 4832
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 4834
	mov	DWORD PTR _ip$[ebp], 0
; Line 4836
	mov	eax, DWORD PTR _indepth
	mov	DWORD PTR _i$[ebp], eax
	jmp	$L2596
$L2597:
	dec	DWORD PTR _i$[ebp]
$L2596:
	cmp	DWORD PTR _i$[ebp], 0
	jl	$L2598
; Line 4837
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	cmp	DWORD PTR _instack[eax], 0
	je	$L2599
; Line 4838
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	add	eax, OFFSET _instack
	mov	DWORD PTR _ip$[ebp], eax
; Line 4839
	jmp	$L2598
; Line 4842
$L2599:
	jmp	$L2597
$L2598:
	cmp	DWORD PTR _ip$[ebp], 0
	je	$L2600
; Line 4843
	mov	eax, DWORD PTR _line$[ebp]
	push	eax
	mov	eax, DWORD PTR _ip$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	push	OFFSET $SG2601
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
; Line 4844
$L2600:
	mov	eax, DWORD PTR _arg3$[ebp]
	push	eax
	mov	eax, DWORD PTR _arg2$[ebp]
	push	eax
	mov	eax, DWORD PTR _arg1$[ebp]
	push	eax
	mov	eax, DWORD PTR _msg$[ebp]
	push	eax
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 20					; 00000014H
; Line 4845
	push	OFFSET $SG2602
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 8
; Line 4846
	inc	DWORD PTR _errors
; Line 4847
	sub	eax, eax
	jmp	$L2593
; Line 4848
$L2593:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_error_with_line ENDP
_line$ = 8
_i$ = -8
_line1$ = -4
_line_for_error PROC NEAR
; Line 4860
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 4862
	mov	eax, DWORD PTR _line$[ebp]
	mov	DWORD PTR _line1$[ebp], eax
; Line 4864
	mov	eax, DWORD PTR _indepth
	mov	DWORD PTR _i$[ebp], eax
$L2608:
	cmp	DWORD PTR _i$[ebp], 0
	jl	$L2609
; Line 4865
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	cmp	DWORD PTR _instack[eax], 0
	je	$L2610
; Line 4866
	mov	eax, DWORD PTR _line1$[ebp]
	jmp	$L2604
; Line 4867
$L2610:
	dec	DWORD PTR _i$[ebp]
; Line 4868
	jns	$L2611
; Line 4869
	sub	eax, eax
	jmp	$L2604
; Line 4870
$L2611:
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	eax, DWORD PTR _instack[eax+4]
	mov	DWORD PTR _line1$[ebp], eax
; Line 4871
	jmp	$L2608
$L2609:
; Line 4872
$L2604:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_line_for_error ENDP
_TEXT	ENDS
PUBLIC	_memory_full
_TEXT	SEGMENT
_obuf$ = 8
_needed$ = 12
_p$ = -4
_minsize$ = -8
_grow_outbuf PROC NEAR
; Line 4887
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 4891
	mov	eax, DWORD PTR _obuf$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _obuf$[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	mov	edx, DWORD PTR _obuf$[ebp]
	sub	ecx, DWORD PTR [edx+12]
	sub	eax, ecx
	cmp	eax, DWORD PTR _needed$[ebp]
	jle	$L2617
; Line 4892
	jmp	$L2614
; Line 4895
$L2617:
	mov	eax, DWORD PTR _obuf$[ebp]
	shl	DWORD PTR [eax+8], 1
; Line 4897
	mov	eax, DWORD PTR _obuf$[ebp]
	mov	ecx, DWORD PTR [eax+16]
	mov	eax, DWORD PTR _obuf$[ebp]
	sub	ecx, DWORD PTR [eax+12]
	mov	eax, DWORD PTR _needed$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	cdq
	sub	eax, edx
	sar	eax, 1
	add	ecx, eax
	mov	DWORD PTR _minsize$[ebp], ecx
; Line 4898
	mov	eax, DWORD PTR _obuf$[ebp]
	mov	ecx, DWORD PTR _minsize$[ebp]
	cmp	DWORD PTR [eax+8], ecx
	jge	$L2618
; Line 4899
	mov	eax, DWORD PTR _minsize$[ebp]
	mov	ecx, DWORD PTR _obuf$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 4901
$L2618:
	mov	eax, DWORD PTR _obuf$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _obuf$[ebp]
	mov	eax, DWORD PTR [eax+12]
	push	eax
	call	_xrealloc
	add	esp, 8
	mov	DWORD PTR _p$[ebp], eax
	cmp	DWORD PTR _p$[ebp], 0
	jne	$L2619
; Line 4902
	call	_memory_full
; Line 4904
$L2619:
	sub	eax, eax
	mov	ecx, DWORD PTR _obuf$[ebp]
	sub	eax, DWORD PTR [ecx+12]
	add	eax, DWORD PTR _p$[ebp]
	mov	ecx, DWORD PTR _obuf$[ebp]
	add	DWORD PTR [ecx+16], eax
; Line 4905
	mov	eax, DWORD PTR _p$[ebp]
	mov	ecx, DWORD PTR _obuf$[ebp]
	mov	DWORD PTR [ecx+12], eax
; Line 4906
$L2614:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_grow_outbuf ENDP
_hash$ = 24
_hp$ = -4
_i$ = -16
_bucket$ = -8
_p$ = -12
_q$ = -20
_name$ = 8
_len$ = 12
_type$ = 16
_value$ = 20
_install PROC NEAR
; Line 4932
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	push	ebx
	push	esi
	push	edi
; Line 4937
	cmp	DWORD PTR _len$[ebp], 0
	jge	$L2631
; Line 4938
	mov	eax, DWORD PTR _name$[ebp]
	mov	DWORD PTR _p$[ebp], eax
; Line 4939
$L2633:
	mov	eax, DWORD PTR _p$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	al, BYTE PTR _is_idchar[eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L2634
; Line 4940
	inc	DWORD PTR _p$[ebp]
	jmp	$L2633
$L2634:
; Line 4941
	mov	eax, DWORD PTR _p$[ebp]
	sub	eax, DWORD PTR _name$[ebp]
	mov	DWORD PTR _len$[ebp], eax
; Line 4944
$L2631:
	cmp	DWORD PTR _hash$[ebp], 0
	jge	$L2635
; Line 4945
	push	1403					; 0000057bH
	mov	eax, DWORD PTR _len$[ebp]
	push	eax
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_hashf
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _hash$[ebp], eax
; Line 4947
$L2635:
	mov	eax, DWORD PTR _len$[ebp]
	add	eax, 29					; 0000001dH
	mov	DWORD PTR _i$[ebp], eax
; Line 4948
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	call	_xmalloc
	add	esp, 4
	mov	DWORD PTR _hp$[ebp], eax
; Line 4949
	mov	eax, DWORD PTR _hash$[ebp]
	mov	DWORD PTR _bucket$[ebp], eax
; Line 4950
	mov	eax, DWORD PTR _bucket$[ebp]
	lea	eax, DWORD PTR _hashtab[eax*4]
	mov	ecx, DWORD PTR _hp$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 4951
	mov	eax, DWORD PTR _bucket$[ebp]
	mov	eax, DWORD PTR _hashtab[eax*4]
	mov	ecx, DWORD PTR _hp$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 4952
	mov	eax, DWORD PTR _hp$[ebp]
	mov	ecx, DWORD PTR _bucket$[ebp]
	mov	DWORD PTR _hashtab[ecx*4], eax
; Line 4953
	mov	eax, DWORD PTR _hp$[ebp]
	mov	DWORD PTR [eax+4], 0
; Line 4954
	mov	eax, DWORD PTR _hp$[ebp]
	cmp	DWORD PTR [eax], 0
	je	$L2636
; Line 4955
	mov	eax, DWORD PTR _hp$[ebp]
	mov	ecx, DWORD PTR _hp$[ebp]
	mov	ecx, DWORD PTR [ecx]
	mov	DWORD PTR [ecx+4], eax
; Line 4956
$L2636:
	mov	eax, DWORD PTR _type$[ebp]
	mov	ecx, DWORD PTR _hp$[ebp]
	mov	DWORD PTR [ecx+12], eax
; Line 4957
	mov	eax, DWORD PTR _len$[ebp]
	mov	ecx, DWORD PTR _hp$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 4958
	mov	eax, DWORD PTR _value$[ebp]
	mov	ecx, DWORD PTR _hp$[ebp]
	mov	DWORD PTR [ecx+24], eax
; Line 4959
	mov	eax, DWORD PTR _hp$[ebp]
	add	eax, 28					; 0000001cH
	mov	ecx, DWORD PTR _hp$[ebp]
	mov	DWORD PTR [ecx+20], eax
; Line 4960
	mov	eax, DWORD PTR _hp$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _p$[ebp], eax
; Line 4961
	mov	eax, DWORD PTR _name$[ebp]
	mov	DWORD PTR _q$[ebp], eax
; Line 4962
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L2637
$L2638:
	inc	DWORD PTR _i$[ebp]
$L2637:
	mov	eax, DWORD PTR _len$[ebp]
	cmp	DWORD PTR _i$[ebp], eax
	jge	$L2639
; Line 4963
	mov	eax, DWORD PTR _q$[ebp]
	mov	al, BYTE PTR [eax]
	mov	ecx, DWORD PTR _p$[ebp]
	mov	BYTE PTR [ecx], al
	inc	DWORD PTR _q$[ebp]
	inc	DWORD PTR _p$[ebp]
	jmp	$L2638
$L2639:
; Line 4964
	mov	eax, DWORD PTR _hp$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	ecx, DWORD PTR _len$[ebp]
	mov	BYTE PTR [eax+ecx], 0
; Line 4965
	mov	eax, DWORD PTR _hp$[ebp]
	jmp	$L2625
; Line 4966
$L2625:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_install ENDP
_name$ = 8
_len$ = 12
_hash$ = 16
_bp$ = -8
_bucket$ = -4
_lookup	PROC NEAR
; Line 4983
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 4987
	cmp	DWORD PTR _len$[ebp], 0
	jge	$L2646
; Line 4988
	mov	eax, DWORD PTR _name$[ebp]
	mov	DWORD PTR _bp$[ebp], eax
	jmp	$L2647
$L2648:
	inc	DWORD PTR _bp$[ebp]
$L2647:
	mov	eax, DWORD PTR _bp$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	al, BYTE PTR _is_idchar[eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L2649
	jmp	$L2648
$L2649:
; Line 4989
	mov	eax, DWORD PTR _bp$[ebp]
	sub	eax, DWORD PTR _name$[ebp]
	mov	DWORD PTR _len$[ebp], eax
; Line 4992
$L2646:
	cmp	DWORD PTR _hash$[ebp], 0
	jge	$L2650
; Line 4993
	push	1403					; 0000057bH
	mov	eax, DWORD PTR _len$[ebp]
	push	eax
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_hashf
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _hash$[ebp], eax
; Line 4995
$L2650:
	mov	eax, DWORD PTR _hash$[ebp]
	mov	eax, DWORD PTR _hashtab[eax*4]
	mov	DWORD PTR _bucket$[ebp], eax
; Line 4996
$L2652:
	cmp	DWORD PTR _bucket$[ebp], 0
	je	$L2653
; Line 4997
	mov	eax, DWORD PTR _bucket$[ebp]
	mov	ecx, DWORD PTR _len$[ebp]
	cmp	DWORD PTR [eax+16], ecx
	jne	$L2654
	mov	eax, DWORD PTR _len$[ebp]
	push	eax
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	mov	eax, DWORD PTR _bucket$[ebp]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	call	_strncmp
	add	esp, 12					; 0000000cH
	or	eax, eax
	jne	$L2654
; Line 4998
	mov	eax, DWORD PTR _bucket$[ebp]
	jmp	$L2643
; Line 4999
$L2654:
	mov	eax, DWORD PTR _bucket$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _bucket$[ebp], eax
; Line 5000
	jmp	$L2652
$L2653:
; Line 5001
	sub	eax, eax
	jmp	$L2643
; Line 5002
$L2643:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_lookup	ENDP
_hp$ = 8
_delete_macro PROC NEAR
; Line 5020
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 5022
	mov	eax, DWORD PTR _hp$[ebp]
	cmp	DWORD PTR [eax+4], 0
	je	$L2657
; Line 5023
	mov	eax, DWORD PTR _hp$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _hp$[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	mov	DWORD PTR [ecx], eax
; Line 5024
$L2657:
	mov	eax, DWORD PTR _hp$[ebp]
	cmp	DWORD PTR [eax], 0
	je	$L2658
; Line 5025
	mov	eax, DWORD PTR _hp$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _hp$[ebp]
	mov	ecx, DWORD PTR [ecx]
	mov	DWORD PTR [ecx+4], eax
; Line 5029
$L2658:
	mov	eax, DWORD PTR _hp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _hp$[ebp]
	cmp	DWORD PTR [eax], ecx
	jne	$L2659
; Line 5030
	mov	eax, DWORD PTR _hp$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _hp$[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	mov	DWORD PTR [ecx], eax
; Line 5044
$L2659:
	mov	eax, DWORD PTR _hp$[ebp]
	push	eax
	call	_free
	add	esp, 4
; Line 5045
$L2656:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_delete_macro ENDP
_name$ = 8
_len$ = 12
_hashsize$ = 16
_r$ = -4
_hashf	PROC NEAR
; Line 5056
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 5057
	mov	DWORD PTR _r$[ebp], 0
; Line 5059
$L2666:
	mov	eax, DWORD PTR _len$[ebp]
	mov	DWORD PTR -8+[ebp], eax
	dec	DWORD PTR _len$[ebp]
	cmp	DWORD PTR -8+[ebp], 0
	je	$L2667
; Line 5060
	mov	eax, DWORD PTR _name$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _r$[ebp]
	lea	eax, DWORD PTR [eax+ecx*4]
	mov	DWORD PTR _r$[ebp], eax
	inc	DWORD PTR _name$[ebp]
	jmp	$L2666
$L2667:
; Line 5062
	mov	eax, DWORD PTR _r$[ebp]
	and	eax, 2147483647				; 7fffffffH
	sub	edx, edx
	div	DWORD PTR _hashsize$[ebp]
	mov	eax, edx
	jmp	$L2663
; Line 5063
$L2663:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_hashf	ENDP
_TEXT	ENDS
PUBLIC	_dump_arg_n
PUBLIC	_dump_defn_1
EXTRN	_printf:NEAR
_DATA	SEGMENT
	ORG $+2
$SG2682	DB	'#define %s', 00H
	ORG $+1
$SG2685	DB	'(', 00H
	ORG $+2
$SG2691	DB	', ', 00H
	ORG $+1
$SG2692	DB	')', 00H
	ORG $+2
$SG2693	DB	' ', 00H
	ORG $+2
$SG2700	DB	' #', 00H
	ORG $+1
$SG2702	DB	' ## ', 00H
	ORG $+3
$SG2704	DB	' ## ', 00H
	ORG $+3
$SG2705	DB	0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_bucket$ = -4
_hp$2673 = -8
_defn$2678 = -16
_ap$2679 = -20
_offset$2680 = -12
_concat$2681 = -24
_i$2684 = -28
_dump_all_macros PROC NEAR
; Line 5069
	push	ebp
	mov	ebp, esp
	sub	esp, 28					; 0000001cH
	push	ebx
	push	esi
	push	edi
; Line 5072
	mov	DWORD PTR _bucket$[ebp], 0
	jmp	$L2670
$L2671:
	inc	DWORD PTR _bucket$[ebp]
$L2670:
	cmp	DWORD PTR _bucket$[ebp], 1403		; 0000057bH
	jge	$L2672
; Line 5075
	mov	eax, DWORD PTR _bucket$[ebp]
	mov	eax, DWORD PTR _hashtab[eax*4]
	mov	DWORD PTR _hp$2673[ebp], eax
	jmp	$L2674
$L2675:
	mov	eax, DWORD PTR _hp$2673[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _hp$2673[ebp], eax
$L2674:
	cmp	DWORD PTR _hp$2673[ebp], 0
	je	$L2676
; Line 5076
	mov	eax, DWORD PTR _hp$2673[ebp]
	cmp	DWORD PTR [eax+12], 23			; 00000017H
	jne	$L2677
; Line 5077
	mov	eax, DWORD PTR _hp$2673[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _defn$2678[ebp], eax
; Line 5085
	mov	eax, DWORD PTR _hp$2673[ebp]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	push	OFFSET $SG2682
	call	_printf
	add	esp, 8
; Line 5086
	mov	eax, DWORD PTR _defn$2678[ebp]
	cmp	DWORD PTR [eax], 0
	jl	$L2683
; Line 5089
	push	OFFSET $SG2685
	call	_printf
	add	esp, 4
; Line 5090
	mov	DWORD PTR _i$2684[ebp], 0
	jmp	$L2686
$L2687:
	inc	DWORD PTR _i$2684[ebp]
$L2686:
	mov	eax, DWORD PTR _defn$2678[ebp]
	mov	ecx, DWORD PTR _i$2684[ebp]
	cmp	DWORD PTR [eax], ecx
	jle	$L2688
; Line 5091
	mov	eax, DWORD PTR _i$2684[ebp]
	push	eax
	mov	eax, DWORD PTR _defn$2678[ebp]
	push	eax
	call	_dump_arg_n
	add	esp, 8
; Line 5092
	mov	eax, DWORD PTR _defn$2678[ebp]
	mov	ecx, DWORD PTR _i$2684[ebp]
	inc	ecx
	cmp	DWORD PTR [eax], ecx
	jle	$L2690
; Line 5093
	push	OFFSET $SG2691
	call	_printf
	add	esp, 4
; Line 5094
$L2690:
	jmp	$L2687
$L2688:
; Line 5095
	push	OFFSET $SG2692
	call	_printf
	add	esp, 4
; Line 5098
$L2683:
	push	OFFSET $SG2693
	call	_printf
	add	esp, 4
; Line 5100
	mov	DWORD PTR _offset$2680[ebp], 0
; Line 5101
	mov	DWORD PTR _concat$2681[ebp], 0
; Line 5102
	mov	eax, DWORD PTR _defn$2678[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _ap$2679[ebp], eax
	jmp	$L2694
$L2695:
	mov	eax, DWORD PTR _ap$2679[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _ap$2679[ebp], eax
$L2694:
	cmp	DWORD PTR _ap$2679[ebp], 0
	je	$L2696
; Line 5103
	mov	eax, DWORD PTR _ap$2679[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _offset$2680[ebp]
	push	eax
	mov	eax, DWORD PTR _defn$2678[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_dump_defn_1
	add	esp, 12					; 0000000cH
; Line 5104
	mov	eax, DWORD PTR _ap$2679[ebp]
	cmp	DWORD PTR [eax+8], 0
	je	$L2698
; Line 5105
	mov	DWORD PTR _concat$2681[ebp], 0
; Line 5106
$L2698:
	mov	eax, DWORD PTR _ap$2679[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	DWORD PTR _offset$2680[ebp], eax
; Line 5107
	mov	eax, DWORD PTR _ap$2679[ebp]
	movsx	eax, BYTE PTR [eax+4]
	or	eax, eax
	je	$L2699
; Line 5108
	push	OFFSET $SG2700
	call	_printf
	add	esp, 4
; Line 5109
$L2699:
	mov	eax, DWORD PTR _ap$2679[ebp]
	movsx	eax, BYTE PTR [eax+5]
	or	eax, eax
	je	$L2701
	cmp	DWORD PTR _concat$2681[ebp], 0
	jne	$L2701
; Line 5110
	push	OFFSET $SG2702
	call	_printf
	add	esp, 4
; Line 5111
$L2701:
	mov	DWORD PTR _concat$2681[ebp], 0
; Line 5112
	mov	eax, DWORD PTR _ap$2679[ebp]
	mov	eax, DWORD PTR [eax+12]
	push	eax
	mov	eax, DWORD PTR _defn$2678[ebp]
	push	eax
	call	_dump_arg_n
	add	esp, 8
; Line 5113
	mov	eax, DWORD PTR _ap$2679[ebp]
	movsx	eax, BYTE PTR [eax+6]
	or	eax, eax
	je	$L2703
; Line 5114
	push	OFFSET $SG2704
	call	_printf
	add	esp, 4
; Line 5115
	mov	DWORD PTR _concat$2681[ebp], 1
; Line 5117
$L2703:
	jmp	$L2695
$L2696:
; Line 5118
	mov	eax, DWORD PTR _defn$2678[ebp]
	mov	eax, DWORD PTR [eax+4]
	sub	eax, DWORD PTR _offset$2680[ebp]
	push	eax
	mov	eax, DWORD PTR _offset$2680[ebp]
	push	eax
	mov	eax, DWORD PTR _defn$2678[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_dump_defn_1
	add	esp, 12					; 0000000cH
; Line 5119
	push	OFFSET $SG2705
	call	_printf
	add	esp, 4
; Line 5121
$L2677:
	jmp	$L2675
$L2676:
; Line 5122
	jmp	$L2671
$L2672:
; Line 5123
$L2668:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_dump_all_macros ENDP
_TEXT	ENDS
EXTRN	_fwrite:NEAR
_TEXT	SEGMENT
_base$ = 8
_start$ = 12
_length$ = 16
_p$ = -4
_limit$ = -8
_p1$2719 = -12
_dump_defn_1 PROC NEAR
; Line 5135
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 5136
	mov	eax, DWORD PTR _start$[ebp]
	add	eax, DWORD PTR _base$[ebp]
	mov	DWORD PTR _p$[ebp], eax
; Line 5137
	mov	eax, DWORD PTR _start$[ebp]
	add	eax, DWORD PTR _length$[ebp]
	add	eax, DWORD PTR _base$[ebp]
	mov	DWORD PTR _limit$[ebp], eax
; Line 5139
$L2713:
	mov	eax, DWORD PTR _p$[ebp]
	cmp	DWORD PTR _limit$[ebp], eax
	jbe	$L2714
; Line 5140
	mov	eax, DWORD PTR _p$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 10					; 0000000aH
	je	$L2715
; Line 5141
	dec	DWORD PTR __iob+36
	js	$L2950
	mov	eax, DWORD PTR _p$[ebp]
	mov	al, BYTE PTR [eax]
	mov	ecx, DWORD PTR __iob+32
	mov	BYTE PTR [ecx], al
	inc	DWORD PTR __iob+32
	jmp	$L2951
$L2950:
	mov	eax, OFFSET __iob
	add	eax, 32					; 00000020H
	push	eax
	mov	eax, DWORD PTR _p$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	push	eax
	call	__flsbuf
	add	esp, 8
$L2951:
; Line 5142
	jmp	$L2716
$L2715:
	mov	eax, DWORD PTR _p$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 34					; 00000022H
	je	$L2718
	mov	eax, DWORD PTR _p$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 39					; 00000027H
	jne	$L2717
$L2718:
; Line 5143
	push	0
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _limit$[ebp]
	push	eax
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	call	_skip_quoted_string
	add	esp, 24					; 00000018H
	mov	DWORD PTR _p1$2719[ebp], eax
; Line 5144
	mov	eax, OFFSET __iob
	add	eax, 32					; 00000020H
	push	eax
	push	1
	mov	eax, DWORD PTR _p1$2719[ebp]
	sub	eax, DWORD PTR _p$[ebp]
	push	eax
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	call	_fwrite
	add	esp, 16					; 00000010H
; Line 5145
	mov	eax, DWORD PTR _p1$2719[ebp]
	dec	eax
	mov	DWORD PTR _p$[ebp], eax
; Line 5147
$L2717:
$L2716:
	inc	DWORD PTR _p$[ebp]
; Line 5148
	jmp	$L2713
$L2714:
; Line 5149
$L2709:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_dump_defn_1 ENDP
_defn$ = 8
_argnum$ = 12
_p$ = -4
_dump_arg_n PROC NEAR
; Line 5158
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 5159
	mov	eax, DWORD PTR _defn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _p$[ebp], eax
; Line 5160
$L2725:
	mov	eax, DWORD PTR _defn$[ebp]
	mov	ecx, DWORD PTR _argnum$[ebp]
	inc	ecx
	cmp	DWORD PTR [eax], ecx
	jle	$L2726
; Line 5161
	push	32					; 00000020H
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	call	_strchr
	add	esp, 8
	inc	eax
	mov	DWORD PTR _p$[ebp], eax
; Line 5162
	inc	DWORD PTR _argnum$[ebp]
; Line 5163
	jmp	$L2725
$L2726:
; Line 5165
$L2728:
	mov	eax, DWORD PTR _p$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L2729
	mov	eax, DWORD PTR _p$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 44					; 0000002cH
	je	$L2729
; Line 5166
	dec	DWORD PTR __iob+36
	js	$L2952
	mov	eax, DWORD PTR _p$[ebp]
	mov	al, BYTE PTR [eax]
	mov	ecx, DWORD PTR __iob+32
	mov	BYTE PTR [ecx], al
	inc	DWORD PTR __iob+32
	jmp	$L2953
$L2952:
	mov	eax, OFFSET __iob
	add	eax, 32					; 00000020H
	push	eax
	mov	eax, DWORD PTR _p$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	push	eax
	call	__flsbuf
	add	esp, 8
$L2953:
; Line 5167
	inc	DWORD PTR _p$[ebp]
; Line 5168
	jmp	$L2728
$L2729:
; Line 5169
$L2722:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_dump_arg_n ENDP
_i$ = -4
_initialize_char_syntax PROC NEAR
; Line 5174
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 5183
	mov	DWORD PTR _i$[ebp], 97			; 00000061H
	jmp	$L2732
$L2733:
	inc	DWORD PTR _i$[ebp]
$L2732:
	cmp	DWORD PTR _i$[ebp], 122			; 0000007aH
	jg	$L2734
; Line 5184
	mov	eax, DWORD PTR _i$[ebp]
	mov	BYTE PTR _is_idchar[eax-32], 1
; Line 5185
	mov	eax, DWORD PTR _i$[ebp]
	mov	BYTE PTR _is_idchar[eax], 1
; Line 5186
	mov	eax, DWORD PTR _i$[ebp]
	mov	BYTE PTR _is_idstart[eax-32], 1
; Line 5187
	mov	eax, DWORD PTR _i$[ebp]
	mov	BYTE PTR _is_idstart[eax], 1
; Line 5188
	jmp	$L2733
$L2734:
; Line 5189
	mov	DWORD PTR _i$[ebp], 48			; 00000030H
	jmp	$L2735
$L2736:
	inc	DWORD PTR _i$[ebp]
$L2735:
	cmp	DWORD PTR _i$[ebp], 57			; 00000039H
	jg	$L2737
; Line 5190
	mov	eax, DWORD PTR _i$[ebp]
	mov	BYTE PTR _is_idchar[eax], 1
	jmp	$L2736
$L2737:
; Line 5191
	mov	BYTE PTR _is_idchar+95, 1
; Line 5192
	mov	BYTE PTR _is_idstart+95, 1
; Line 5193
	mov	al, BYTE PTR _dollars_in_ident
	mov	BYTE PTR _is_idchar+36, al
; Line 5194
	mov	al, BYTE PTR _dollars_in_ident
	mov	BYTE PTR _is_idstart+36, al
; Line 5197
	mov	BYTE PTR _is_hor_space+32, 1
; Line 5198
	mov	BYTE PTR _is_hor_space+9, 1
; Line 5199
	mov	BYTE PTR _is_hor_space+11, 1
; Line 5200
	mov	BYTE PTR _is_hor_space+12, 1
; Line 5202
	mov	BYTE PTR _is_space+32, 1
; Line 5203
	mov	BYTE PTR _is_space+9, 1
; Line 5204
	mov	BYTE PTR _is_space+11, 1
; Line 5205
	mov	BYTE PTR _is_space+12, 1
; Line 5206
	mov	BYTE PTR _is_space+10, 1
; Line 5207
$L2730:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_initialize_char_syntax ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+2
$SG2739	DB	'__LINE__', 00H
	ORG $+3
$SG2740	DB	'__DATE__', 00H
	ORG $+3
$SG2741	DB	'__FILE__', 00H
	ORG $+3
$SG2742	DB	'__BASE_FILE__', 00H
	ORG $+2
$SG2743	DB	'__INCLUDE_LEVEL__', 00H
	ORG $+2
$SG2744	DB	'__VERSION__', 00H
$SG2745	DB	'__TIME__', 00H
	ORG $+3
$SG2747	DB	'__STDC__', 00H
_DATA	ENDS
_TEXT	SEGMENT
_initialize_builtins PROC NEAR
; Line 5212
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 5213
	push	-1
	push	0
	push	15					; 0000000fH
	push	-1
	push	OFFSET $SG2739
	call	_install
	add	esp, 20					; 00000014H
; Line 5214
	push	-1
	push	0
	push	16					; 00000010H
	push	-1
	push	OFFSET $SG2740
	call	_install
	add	esp, 20					; 00000014H
; Line 5215
	push	-1
	push	0
	push	17					; 00000011H
	push	-1
	push	OFFSET $SG2741
	call	_install
	add	esp, 20					; 00000014H
; Line 5216
	push	-1
	push	0
	push	18					; 00000012H
	push	-1
	push	OFFSET $SG2742
	call	_install
	add	esp, 20					; 00000014H
; Line 5217
	push	-1
	push	0
	push	19					; 00000013H
	push	-1
	push	OFFSET $SG2743
	call	_install
	add	esp, 20					; 00000014H
; Line 5218
	push	-1
	push	0
	push	20					; 00000014H
	push	-1
	push	OFFSET $SG2744
	call	_install
	add	esp, 20					; 00000014H
; Line 5219
	push	-1
	push	0
	push	21					; 00000015H
	push	-1
	push	OFFSET $SG2745
	call	_install
	add	esp, 20					; 00000014H
; Line 5220
	cmp	DWORD PTR _traditional, 0
	jne	$L2746
; Line 5221
	push	-1
	push	1
	push	22					; 00000016H
	push	-1
	push	OFFSET $SG2747
	call	_install
	add	esp, 20					; 00000014H
; Line 5225
$L2746:
$L2738:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_initialize_builtins ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+3
$SG2758	DB	'malformed option `-D %s''', 00H
	ORG $+3
$SG2760	DB	' 1', 00H
	ORG $+1
$SG2763	DB	'malformed option `-D %s''', 00H
	ORG $+3
$SG2764	DB	'*Initialization*', 00H
_DATA	ENDS
_TEXT	SEGMENT
_buf$ = -8
_p$ = -12
_str$ = 8
_ip$ = -16
_kt$ = -4
_make_definition PROC NEAR
; Line 5235
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 5240
	mov	eax, DWORD PTR _str$[ebp]
	mov	DWORD PTR _buf$[ebp], eax
; Line 5241
	mov	eax, DWORD PTR _str$[ebp]
	mov	DWORD PTR _p$[ebp], eax
; Line 5242
$L2755:
	mov	eax, DWORD PTR _p$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	al, BYTE PTR _is_idchar[eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L2756
	inc	DWORD PTR _p$[ebp]
	jmp	$L2755
$L2756:
; Line 5243
	mov	eax, DWORD PTR _str$[ebp]
	cmp	DWORD PTR _p$[ebp], eax
	jne	$L2757
; Line 5244
	mov	eax, DWORD PTR _str$[ebp]
	push	eax
	push	OFFSET $SG2758
	call	_error
	add	esp, 8
; Line 5245
	jmp	$L2749
; Line 5247
$L2757:
	mov	eax, DWORD PTR _p$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	jne	$L2759
; Line 5248
	mov	eax, DWORD PTR _p$[ebp]
	sub	eax, DWORD PTR _buf$[ebp]
	add	eax, 4
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _buf$[ebp], eax
; Line 5249
	mov	eax, DWORD PTR _str$[ebp]
	push	eax
	mov	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_strcpy
	add	esp, 8
; Line 5250
	push	OFFSET $SG2760
	mov	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_strcat
	add	esp, 8
; Line 5251
	jmp	$L2761
$L2759:
	mov	eax, DWORD PTR _p$[ebp]
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	cmp	eax, 32					; 00000020H
	je	$L2762
; Line 5252
	mov	eax, DWORD PTR _str$[ebp]
	push	eax
	push	OFFSET $SG2763
	call	_error
	add	esp, 8
; Line 5253
	jmp	$L2749
; Line 5256
$L2762:
$L2761:
	inc	DWORD PTR _indepth
	mov	eax, DWORD PTR _indepth
	shl	eax, 5
	add	eax, OFFSET _instack
	mov	DWORD PTR _ip$[ebp], eax
; Line 5257
	mov	eax, DWORD PTR _ip$[ebp]
	mov	DWORD PTR [eax], OFFSET $SG2764
; Line 5259
	mov	eax, DWORD PTR _buf$[ebp]
	mov	ecx, DWORD PTR _ip$[ebp]
	mov	DWORD PTR [ecx+16], eax
	mov	eax, DWORD PTR _ip$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _ip$[ebp]
	mov	DWORD PTR [ecx+12], eax
; Line 5260
	mov	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_strlen
	add	esp, 4
	mov	ecx, DWORD PTR _ip$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 5261
	mov	eax, DWORD PTR _ip$[ebp]
	mov	DWORD PTR [eax+4], 1
; Line 5262
	mov	eax, DWORD PTR _ip$[ebp]
	mov	DWORD PTR [eax+20], 0
; Line 5263
	mov	eax, DWORD PTR _ip$[ebp]
	mov	DWORD PTR [eax+28], 0
; Line 5264
	mov	eax, DWORD PTR _if_stack
	mov	ecx, DWORD PTR _ip$[ebp]
	mov	DWORD PTR [ecx+24], eax
; Line 5266
	mov	DWORD PTR _kt$[ebp], OFFSET _directive_table
	jmp	$L2765
$L2766:
	add	DWORD PTR _kt$[ebp], 20			; 00000014H
$L2765:
	mov	eax, DWORD PTR _kt$[ebp]
	cmp	DWORD PTR [eax+12], 1
	je	$L2767
; Line 5267
	jmp	$L2766
$L2767:
; Line 5271
	mov	eax, DWORD PTR _kt$[ebp]
	push	eax
	push	0
	mov	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_strlen
	add	esp, 4
	mov	ecx, DWORD PTR _buf$[ebp]
	add	ecx, eax
	push	ecx
	mov	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_do_define
	add	esp, 16					; 00000010H
; Line 5272
	dec	DWORD PTR _indepth
; Line 5273
$L2749:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_make_definition ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+3
$SG2772	DB	'*undef*', 00H
_DATA	ENDS
_TEXT	SEGMENT
_str$ = 8
_ip$ = -8
_kt$ = -4
_make_undef PROC NEAR
; Line 5278
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 5282
	inc	DWORD PTR _indepth
	mov	eax, DWORD PTR _indepth
	shl	eax, 5
	add	eax, OFFSET _instack
	mov	DWORD PTR _ip$[ebp], eax
; Line 5283
	mov	eax, DWORD PTR _ip$[ebp]
	mov	DWORD PTR [eax], OFFSET $SG2772
; Line 5285
	mov	eax, DWORD PTR _str$[ebp]
	mov	ecx, DWORD PTR _ip$[ebp]
	mov	DWORD PTR [ecx+16], eax
	mov	eax, DWORD PTR _ip$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _ip$[ebp]
	mov	DWORD PTR [ecx+12], eax
; Line 5286
	mov	eax, DWORD PTR _str$[ebp]
	push	eax
	call	_strlen
	add	esp, 4
	mov	ecx, DWORD PTR _ip$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 5287
	mov	eax, DWORD PTR _ip$[ebp]
	mov	DWORD PTR [eax+4], 1
; Line 5288
	mov	eax, DWORD PTR _ip$[ebp]
	mov	DWORD PTR [eax+20], 0
; Line 5289
	mov	eax, DWORD PTR _ip$[ebp]
	mov	DWORD PTR [eax+28], 0
; Line 5290
	mov	eax, DWORD PTR _if_stack
	mov	ecx, DWORD PTR _ip$[ebp]
	mov	DWORD PTR [ecx+24], eax
; Line 5292
	mov	DWORD PTR _kt$[ebp], OFFSET _directive_table
	jmp	$L2773
$L2774:
	add	DWORD PTR _kt$[ebp], 20			; 00000014H
$L2773:
	mov	eax, DWORD PTR _kt$[ebp]
	cmp	DWORD PTR [eax+12], 9
	je	$L2775
; Line 5293
	jmp	$L2774
$L2775:
; Line 5295
	mov	eax, DWORD PTR _kt$[ebp]
	push	eax
	push	0
	mov	eax, DWORD PTR _str$[ebp]
	push	eax
	call	_strlen
	add	esp, 4
	mov	ecx, DWORD PTR _str$[ebp]
	add	ecx, eax
	dec	ecx
	push	ecx
	mov	eax, DWORD PTR _str$[ebp]
	push	eax
	call	_do_undef
	add	esp, 16					; 00000010H
; Line 5296
	dec	DWORD PTR _indepth
; Line 5297
$L2769:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_make_undef ENDP
_TEXT	ENDS
_DATA	SEGMENT
$SG2780	DB	'\', 0aH, '  ', 00H
_DATA	ENDS
_TEXT	SEGMENT
_string$ = 8
_size$ = 12
_deps_output PROC NEAR
; Line 5307
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 5312
	cmp	DWORD PTR _size$[ebp], 0
	je	$L2779
	cmp	DWORD PTR _deps_column, 0
	je	$L2779
	mov	eax, DWORD PTR _deps_column
	add	eax, DWORD PTR _size$[ebp]
	cmp	eax, 75					; 0000004bH
	jle	$L2779
; Line 5313
	push	0
	push	OFFSET $SG2780
	call	_deps_output
	add	esp, 8
; Line 5314
	mov	DWORD PTR _deps_column, 0
; Line 5317
$L2779:
	cmp	DWORD PTR _size$[ebp], 0
	jne	$L2781
; Line 5318
	mov	eax, DWORD PTR _string$[ebp]
	push	eax
	call	_strlen
	add	esp, 4
	mov	DWORD PTR _size$[ebp], eax
; Line 5320
$L2781:
	mov	eax, DWORD PTR _deps_size
	add	eax, DWORD PTR _size$[ebp]
	inc	eax
	cmp	eax, DWORD PTR _deps_allocated_size
	jle	$L2782
; Line 5321
	mov	eax, DWORD PTR _deps_size
	add	eax, DWORD PTR _size$[ebp]
	add	eax, 50					; 00000032H
	mov	DWORD PTR _deps_allocated_size, eax
; Line 5322
	shl	DWORD PTR _deps_allocated_size, 1
; Line 5323
	mov	eax, DWORD PTR _deps_allocated_size
	push	eax
	mov	eax, DWORD PTR _deps_buffer
	push	eax
	call	_xrealloc
	add	esp, 8
	mov	DWORD PTR _deps_buffer, eax
; Line 5325
$L2782:
	mov	eax, DWORD PTR _size$[ebp]
	push	eax
	mov	eax, DWORD PTR _deps_size
	add	eax, DWORD PTR _deps_buffer
	push	eax
	mov	eax, DWORD PTR _string$[ebp]
	push	eax
	call	_bcopy
	add	esp, 12					; 0000000cH
; Line 5326
	mov	eax, DWORD PTR _size$[ebp]
	add	DWORD PTR _deps_size, eax
; Line 5327
	mov	eax, DWORD PTR _size$[ebp]
	add	DWORD PTR _deps_column, eax
; Line 5328
	mov	eax, DWORD PTR _deps_size
	mov	ecx, DWORD PTR _deps_buffer
	mov	BYTE PTR [eax+ecx], 0
; Line 5329
$L2778:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_deps_output ENDP
_b$ = 8
_length$ = 12
_bzero	PROC NEAR
; Line 5338
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 5350
$L2787:
	mov	eax, DWORD PTR _length$[ebp]
	mov	DWORD PTR -4+[ebp], eax
	dec	DWORD PTR _length$[ebp]
	cmp	DWORD PTR -4+[ebp], 0
	jle	$L2788
; Line 5351
	mov	eax, DWORD PTR _b$[ebp]
	mov	BYTE PTR [eax], 0
	inc	DWORD PTR _b$[ebp]
	jmp	$L2787
$L2788:
; Line 5353
$L2785:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_bzero	ENDP
_b1$ = 8
_b2$ = 12
_length$ = 16
_bcopy	PROC NEAR
; Line 5360
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 5372
$L2794:
	mov	eax, DWORD PTR _length$[ebp]
	mov	DWORD PTR -4+[ebp], eax
	dec	DWORD PTR _length$[ebp]
	cmp	DWORD PTR -4+[ebp], 0
	jle	$L2795
; Line 5373
	mov	eax, DWORD PTR _b1$[ebp]
	mov	al, BYTE PTR [eax]
	mov	ecx, DWORD PTR _b2$[ebp]
	mov	BYTE PTR [ecx], al
	inc	DWORD PTR _b1$[ebp]
	inc	DWORD PTR _b2$[ebp]
	jmp	$L2794
$L2795:
; Line 5375
$L2792:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_bcopy	ENDP
_TEXT	ENDS
PUBLIC	_bcmp
_TEXT	SEGMENT
_b1$ = 8
_b2$ = 12
_length$ = 16
_bcmp	PROC NEAR
; Line 5382
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 5389
$L2801:
	mov	eax, DWORD PTR _length$[ebp]
	mov	DWORD PTR -4+[ebp], eax
	dec	DWORD PTR _length$[ebp]
	cmp	DWORD PTR -4+[ebp], 0
	jle	$L2802
; Line 5390
	mov	eax, DWORD PTR _b1$[ebp]
	mov	DWORD PTR -8+[ebp], eax
	inc	DWORD PTR _b1$[ebp]
	mov	eax, DWORD PTR _b2$[ebp]
	mov	DWORD PTR -12+[ebp], eax
	inc	DWORD PTR _b2$[ebp]
	mov	eax, DWORD PTR -8+[ebp]
	movsx	eax, BYTE PTR [eax]
	mov	ecx, DWORD PTR -12+[ebp]
	movsx	ecx, BYTE PTR [ecx]
	cmp	eax, ecx
	je	$L2803
; Line 5391
	mov	eax, 1
	jmp	$L2799
; Line 5393
$L2803:
	jmp	$L2801
$L2802:
	sub	eax, eax
	jmp	$L2799
; Line 5395
$L2799:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_bcmp	ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+3
$SG2807	DB	'%s: ', 00H
	ORG $+3
$SG2808	DB	0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_str$ = 8
_arg$ = 12
_fatal	PROC NEAR
; Line 5403
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 5404
	mov	eax, DWORD PTR _progname
	push	eax
	push	OFFSET $SG2807
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 5405
	mov	eax, DWORD PTR _arg$[ebp]
	push	eax
	mov	eax, DWORD PTR _str$[ebp]
	push	eax
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 5406
	push	OFFSET $SG2808
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 8
; Line 5407
	push	33					; 00000021H
	call	_exit
	add	esp, 4
; Line 5408
$L2806:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_fatal	ENDP
_TEXT	ENDS
PUBLIC	_fancy_abort
_DATA	SEGMENT
	ORG $+2
$SG2810	DB	'Internal gcc abort.', 00H
_DATA	ENDS
_TEXT	SEGMENT
_fancy_abort PROC NEAR
; Line 5415
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 5416
	push	OFFSET $SG2810
	call	_fatal
	add	esp, 4
; Line 5417
$L2809:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_fancy_abort ENDP
_TEXT	ENDS
_DATA	SEGMENT
$SG2813	DB	'%s: ', 00H
	ORG $+3
$SG2815	DB	'%s: %s', 0aH, 00H
$SG2817	DB	'%s: undocumented I/O error', 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_name$ = 8
_perror_with_name PROC NEAR
; Line 5422
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 5426
	mov	eax, DWORD PTR _progname
	push	eax
	push	OFFSET $SG2813
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 5427
	mov	eax, DWORD PTR _errno
	cmp	DWORD PTR __sys_nerr, eax
	jle	$L2814
; Line 5428
	mov	eax, DWORD PTR _errno
	mov	eax, DWORD PTR __sys_errlist[eax*4]
	push	eax
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	push	OFFSET $SG2815
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
; Line 5429
	jmp	$L2816
$L2814:
; Line 5430
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	push	OFFSET $SG2817
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
$L2816:
; Line 5431
	inc	DWORD PTR _errors
; Line 5432
$L2812:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_perror_with_name ENDP
_name$ = 8
_pfatal_with_name PROC NEAR
; Line 5437
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 5438
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_perror_with_name
	add	esp, 4
; Line 5442
	push	33					; 00000021H
	call	_exit
	add	esp, 4
; Line 5444
$L2819:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_pfatal_with_name ENDP
_TEXT	ENDS
_DATA	SEGMENT
$SG2821	DB	'Memory exhausted.', 00H
_DATA	ENDS
_TEXT	SEGMENT
_memory_full PROC NEAR
; Line 5449
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 5450
	push	OFFSET $SG2821
	call	_fatal
	add	esp, 4
; Line 5451
$L2820:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_memory_full ENDP
_TEXT	ENDS
EXTRN	_malloc:NEAR
_TEXT	SEGMENT
_size$ = 8
_ptr$ = -4
_xmalloc PROC NEAR
; Line 5457
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 5459
	mov	eax, DWORD PTR _size$[ebp]
	push	eax
	call	_malloc
	add	esp, 4
	mov	DWORD PTR _ptr$[ebp], eax
; Line 5460
	cmp	DWORD PTR _ptr$[ebp], 0
	je	$L2825
	mov	eax, DWORD PTR _ptr$[ebp]
	jmp	$L2823
; Line 5461
$L2825:
	call	_memory_full
; Line 5463
$L2823:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_xmalloc ENDP
_TEXT	ENDS
EXTRN	_realloc:NEAR
_TEXT	SEGMENT
_old$ = 8
_size$ = 12
_ptr$ = -4
_xrealloc PROC NEAR
; Line 5469
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 5471
	mov	eax, DWORD PTR _size$[ebp]
	push	eax
	mov	eax, DWORD PTR _old$[ebp]
	push	eax
	call	_realloc
	add	esp, 8
	mov	DWORD PTR _ptr$[ebp], eax
; Line 5472
	cmp	DWORD PTR _ptr$[ebp], 0
	je	$L2830
	mov	eax, DWORD PTR _ptr$[ebp]
	jmp	$L2828
; Line 5473
$L2830:
	call	_memory_full
; Line 5475
$L2828:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_xrealloc ENDP
_number$ = 8
_size$ = 12
_total$ = -4
_ptr$ = -8
_zp$2839 = -12
_zl$2840 = -20
_i$2841 = -16
_xcalloc PROC NEAR
; Line 5480
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	push	ebx
	push	esi
	push	edi
; Line 5482
	mov	eax, DWORD PTR _size$[ebp]
	imul	eax, DWORD PTR _number$[ebp]
	mov	DWORD PTR _total$[ebp], eax
; Line 5483
	mov	eax, DWORD PTR _total$[ebp]
	push	eax
	call	_malloc
	add	esp, 4
	mov	DWORD PTR _ptr$[ebp], eax
; Line 5484
	cmp	DWORD PTR _ptr$[ebp], 0
	je	$L2836
; Line 5485
	cmp	DWORD PTR _total$[ebp], 100		; 00000064H
	jle	$L2837
; Line 5486
	mov	eax, DWORD PTR _total$[ebp]
	push	eax
	mov	eax, DWORD PTR _ptr$[ebp]
	push	eax
	call	_bzero
	add	esp, 8
; Line 5487
	jmp	$L2838
$L2837:
; Line 5490
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	DWORD PTR _zp$2839[ebp], eax
; Line 5491
	mov	eax, DWORD PTR _total$[ebp]
	add	eax, DWORD PTR _ptr$[ebp]
	sub	eax, 4
	mov	DWORD PTR _zl$2840[ebp], eax
; Line 5492
	mov	eax, DWORD PTR _total$[ebp]
	sub	eax, 4
	mov	DWORD PTR _i$2841[ebp], eax
; Line 5493
$L2843:
	mov	eax, DWORD PTR _zp$2839[ebp]
	cmp	DWORD PTR _zl$2840[ebp], eax
	jbe	$L2844
; Line 5494
	mov	eax, DWORD PTR _zp$2839[ebp]
	mov	DWORD PTR [eax], 0
	add	DWORD PTR _zp$2839[ebp], 4
	jmp	$L2843
$L2844:
; Line 5495
	cmp	DWORD PTR _i$2841[ebp], 0
	jge	$L2845
; Line 5496
	mov	DWORD PTR _i$2841[ebp], 0
; Line 5497
$L2845:
$L2847:
	mov	eax, DWORD PTR _i$2841[ebp]
	cmp	DWORD PTR _total$[ebp], eax
	jle	$L2848
; Line 5498
	mov	eax, DWORD PTR _i$2841[ebp]
	mov	ecx, DWORD PTR _ptr$[ebp]
	mov	BYTE PTR [eax+ecx], 0
	inc	DWORD PTR _i$2841[ebp]
	jmp	$L2847
$L2848:
; Line 5499
$L2838:
; Line 5500
	mov	eax, DWORD PTR _ptr$[ebp]
	jmp	$L2833
; Line 5502
$L2836:
	call	_memory_full
; Line 5504
$L2833:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_xcalloc ENDP
_input$ = 8
_size$ = -8
_output$ = -4
_savestring PROC NEAR
; Line 5509
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 5510
	mov	eax, DWORD PTR _input$[ebp]
	push	eax
	call	_strlen
	add	esp, 4
	mov	DWORD PTR _size$[ebp], eax
; Line 5511
	mov	eax, DWORD PTR _size$[ebp]
	inc	eax
	push	eax
	call	_xmalloc
	add	esp, 4
	mov	DWORD PTR _output$[ebp], eax
; Line 5512
	mov	eax, DWORD PTR _input$[ebp]
	push	eax
	mov	eax, DWORD PTR _output$[ebp]
	push	eax
	call	_strcpy
	add	esp, 8
; Line 5513
	mov	eax, DWORD PTR _output$[ebp]
	jmp	$L2850
; Line 5514
$L2850:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_savestring ENDP
_TEXT	ENDS
EXTRN	__fstat:NEAR
_TEXT	SEGMENT
_fd$ = 8
_mode_pointer$ = 12
_size_pointer$ = 16
_sbuf$ = -36
_file_size_and_mode PROC NEAR
; Line 5524
	push	ebp
	mov	ebp, esp
	sub	esp, 36					; 00000024H
	push	ebx
	push	esi
	push	edi
; Line 5527
	lea	eax, DWORD PTR _sbuf$[ebp]
	push	eax
	mov	eax, DWORD PTR _fd$[ebp]
	push	eax
	call	__fstat
	add	esp, 8
	or	eax, eax
	jge	$L2858
	mov	eax, -1
	jmp	$L2856
; Line 5528
$L2858:
	cmp	DWORD PTR _mode_pointer$[ebp], 0
	je	$L2859
	xor	eax, eax
	mov	ax, WORD PTR _sbuf$[ebp+6]
	mov	ecx, DWORD PTR _mode_pointer$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 5529
$L2859:
	cmp	DWORD PTR _size_pointer$[ebp], 0
	je	$L2860
	mov	eax, DWORD PTR _sbuf$[ebp+20]
	mov	ecx, DWORD PTR _size_pointer$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 5530
$L2860:
	sub	eax, eax
	jmp	$L2856
; Line 5531
$L2856:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_file_size_and_mode ENDP
_TEXT	ENDS
END
