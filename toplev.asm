	TITLE	toplev.c
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
PUBLIC	_rtl_dump
PUBLIC	_rtl_dump_and_exit
PUBLIC	_jump_opt_dump
PUBLIC	_cse_dump
PUBLIC	_loop_dump
PUBLIC	_flow_dump
PUBLIC	_combine_dump
PUBLIC	_local_reg_dump
PUBLIC	_global_reg_dump
PUBLIC	_jump2_opt_dump
PUBLIC	_dbr_sched_dump
PUBLIC	_write_symbols
PUBLIC	_errorcount
PUBLIC	_warningcount
PUBLIC	_optimize
PUBLIC	_sorrycount
PUBLIC	_obey_regdecls
PUBLIC	_quiet_flag
PUBLIC	_target_switches
PUBLIC	_inhibit_warnings
PUBLIC	_extra_warnings
PUBLIC	_f_options
PUBLIC	_profile_flag
PUBLIC	_flag_caller_saves
PUBLIC	_pedantic
PUBLIC	_flag_pcc_struct_return
PUBLIC	_flag_force_mem
PUBLIC	_flag_force_addr
PUBLIC	_flag_defer_pop
PUBLIC	_flag_float_store
PUBLIC	_flag_combine_regs
PUBLIC	_flag_strength_reduce
PUBLIC	_flag_writable_strings
PUBLIC	_flag_no_function_cse
PUBLIC	_flag_omit_frame_pointer
PUBLIC	_flag_no_peephole
PUBLIC	_flag_syntax_only
_DATA	SEGMENT
COMM	_varconst_time:DWORD
COMM	_main_input_filename:DWORD
COMM	_integration_time:DWORD
COMM	_lineno:DWORD
COMM	_jump_time:DWORD
COMM	_cse_time:DWORD
COMM	_input_file_stack:DWORD
COMM	_loop_time:DWORD
COMM	_input_file_stack_tick:DWORD
COMM	_flow_time:DWORD
COMM	_combine_time:DWORD
COMM	_local_alloc_time:DWORD
COMM	_global_alloc_time:DWORD
COMM	_dbr_sched_time:DWORD
COMM	_final_time:DWORD
COMM	_symout_time:DWORD
COMM	_dump_base_name:DWORD
COMM	_dump_time:DWORD
COMM	_float_handled:DWORD
COMM	_float_handler:DWORD:010H
COMM	_use_gdb_dbx_extensions:DWORD
COMM	_progname:DWORD
COMM	_save_argc:DWORD
COMM	_save_argv:DWORD
COMM	_asm_file_name:DWORD
COMM	_warn_unused:DWORD
COMM	_sym_file_name:DWORD
COMM	_warn_shadow:DWORD
COMM	_warn_switch:DWORD
COMM	_warn_id_clash:DWORD
COMM	_id_clash_len:DWORD
COMM	_profile_block_flag:DWORD
COMM	_flag_signed_char:DWORD
COMM	_flag_short_enums:DWORD
COMM	_target_flags:DWORD
COMM	_flag_volatile:DWORD
COMM	_asm_out_file:DWORD
COMM	_flag_inline_functions:DWORD
COMM	_rtl_dump_file:DWORD
COMM	_flag_keep_inline_functions:DWORD
COMM	_jump_opt_dump_file:DWORD
COMM	_cse_dump_file:DWORD
COMM	_flag_shared_data:DWORD
COMM	_loop_dump_file:DWORD
COMM	_flag_delayed_branch:DWORD
COMM	_flow_dump_file:DWORD
COMM	_combine_dump_file:DWORD
COMM	_local_reg_dump_file:DWORD
COMM	_global_reg_dump_file:DWORD
COMM	_jump2_opt_dump_file:DWORD
COMM	_dbr_sched_dump_file:DWORD
COMM	_parse_time:DWORD
COMM	_input_filename:DWORD
_rtl_dump DD	00H
_rtl_dump_and_exit DD 00H
_jump_opt_dump DD 00H
_cse_dump DD	00H
_loop_dump DD	00H
_flow_dump DD	00H
_combine_dump DD 00H
_local_reg_dump DD 00H
_global_reg_dump DD 00H
_jump2_opt_dump DD 00H
_dbr_sched_dump DD 00H
_write_symbols DD 00H
_optimize DD	00H
_flag_caller_saves DD 00H
_flag_pcc_struct_return DD 00H
_flag_force_mem DD 00H
_flag_force_addr DD 00H
_flag_defer_pop DD 01H
_flag_float_store DD 00H
_flag_combine_regs DD 00H
_flag_strength_reduce DD 00H
_flag_writable_strings DD 00H
_flag_no_function_cse DD 00H
_flag_omit_frame_pointer DD 00H
_flag_no_peephole DD 00H
_flag_syntax_only DD 00H
_obey_regdecls DD 00H
_quiet_flag DD	00H
_inhibit_warnings DD 00H
_extra_warnings DD 00H
_errorcount DD	00H
_warningcount DD 00H
_sorrycount DD	00H
_profile_flag DD 00H
_pedantic DD	00H
$SG930	DB	'float-store', 00H
$SG931	DB	'volatile', 00H
	ORG $+3
$SG932	DB	'defer-pop', 00H
	ORG $+2
$SG933	DB	'omit-frame-pointer', 00H
	ORG $+1
$SG934	DB	'strength-reduce', 00H
$SG935	DB	'writable-strings', 00H
	ORG $+3
$SG936	DB	'peephole', 00H
	ORG $+3
$SG937	DB	'force-mem', 00H
	ORG $+2
$SG938	DB	'force-addr', 00H
	ORG $+1
$SG939	DB	'combine-regs', 00H
	ORG $+3
$SG940	DB	'function-cse', 00H
	ORG $+3
$SG941	DB	'inline-functions', 00H
	ORG $+3
$SG942	DB	'keep-inline-functions', 00H
	ORG $+2
$SG943	DB	'syntax-only', 00H
$SG944	DB	'shared-data', 00H
$SG945	DB	'caller-saves', 00H
	ORG $+3
$SG946	DB	'pcc-struct-return', 00H
	ORG $+2
$SG947	DB	'delayed-branch', 00H
	ORG $+5
_f_options DD	$SG930
	DD	_flag_float_store
	DD	01H
	DD	$SG931
	DD	_flag_volatile
	DD	01H
	DD	$SG932
	DD	_flag_defer_pop
	DD	01H
	DD	$SG933
	DD	_flag_omit_frame_pointer
	DD	01H
	DD	$SG934
	DD	_flag_strength_reduce
	DD	01H
	DD	$SG935
	DD	_flag_writable_strings
	DD	01H
	DD	$SG936
	DD	_flag_no_peephole
	DD	00H
	DD	$SG937
	DD	_flag_force_mem
	DD	01H
	DD	$SG938
	DD	_flag_force_addr
	DD	01H
	DD	$SG939
	DD	_flag_combine_regs
	DD	01H
	DD	$SG940
	DD	_flag_no_function_cse
	DD	00H
	DD	$SG941
	DD	_flag_inline_functions
	DD	01H
	DD	$SG942
	DD	_flag_keep_inline_functions
	DD	01H
	DD	$SG943
	DD	_flag_syntax_only
	DD	01H
	DD	$SG944
	DD	_flag_shared_data
	DD	01H
	DD	$SG945
	DD	_flag_caller_saves
	DD	01H
	DD	$SG946
	DD	_flag_pcc_struct_return
	DD	01H
	DD	$SG947
	DD	_flag_delayed_branch
	DD	01H
_last_error_function$S1007 DD 00H
$SG1757	DB	'80387', 00H
	ORG $+2
$SG1758	DB	'soft-float', 00H
	ORG $+1
$SG1759	DB	'rtd', 00H
$SG1760	DB	'nortd', 00H
	ORG $+2
$SG1761	DB	'regparm', 00H
$SG1762	DB	'noregparm', 00H
	ORG $+2
$SG1763	DB	00H
	ORG $+7
_target_switches DD $SG1757
	DD	01H
	DD	$SG1758
	DD	0ffffffffH
	DD	$SG1759
	DD	08H
	DD	$SG1760
	DD	0fffffff8H
	DD	$SG1761
	DD	010H
	DD	$SG1762
	DD	0fffffff0H
	DD	$SG1763
	DD	01H
_DATA	ENDS
PUBLIC	_gettime
EXTRN	__fltused:NEAR
_TEXT	SEGMENT
; File toplev.c
_gettime PROC NEAR
; Line 381
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 398
	cmp	DWORD PTR _quiet_flag, 0
	je	$L975
; Line 399
	sub	eax, eax
	jmp	$L974
; Line 404
$L975:
	mov	eax, 1
	jmp	$L974
; Line 415
$L974:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gettime ENDP
_TEXT	ENDS
PUBLIC	_print_time
EXTRN	_fprintf:NEAR
EXTRN	__iob:BYTE
_DATA	SEGMENT
$SG980	DB	'time in %s: %d.%06d', 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_str$ = 8
_total$ = 12
_print_time PROC NEAR
; Line 424
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 427
	mov	ecx, 1000000				; 000f4240H
	mov	eax, DWORD PTR _total$[ebp]
	cdq
	idiv	ecx
	push	edx
	mov	ecx, 1000000				; 000f4240H
	mov	eax, DWORD PTR _total$[ebp]
	cdq
	idiv	ecx
	push	eax
	mov	eax, DWORD PTR _str$[ebp]
	push	eax
	push	OFFSET $SG980
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 20					; 00000014H
; Line 428
$L979:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_print_time ENDP
_TEXT	ENDS
PUBLIC	_count_error
_TEXT	SEGMENT
_warningp$ = 8
_count_error PROC NEAR
; Line 435
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 436
	cmp	DWORD PTR _warningp$[ebp], 0
	je	$L984
	cmp	DWORD PTR _inhibit_warnings, 0
	je	$L984
; Line 437
	sub	eax, eax
	jmp	$L983
; Line 439
$L984:
	cmp	DWORD PTR _warningp$[ebp], 0
	je	$L985
; Line 440
	inc	DWORD PTR _warningcount
; Line 441
	jmp	$L986
$L985:
; Line 442
	inc	DWORD PTR _errorcount
$L986:
; Line 444
	mov	eax, 1
	jmp	$L983
; Line 445
$L983:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_count_error ENDP
_TEXT	ENDS
PUBLIC	_pfatal_with_name
EXTRN	_perror:NEAR
EXTRN	_exit:NEAR
_DATA	SEGMENT
	ORG $+3
$SG990	DB	'%s: ', 00H
_DATA	ENDS
_TEXT	SEGMENT
_name$ = 8
_pfatal_with_name PROC NEAR
; Line 453
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 454
	mov	eax, DWORD PTR _progname
	push	eax
	push	OFFSET $SG990
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 455
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_perror
	add	esp, 4
; Line 456
	push	35					; 00000023H
	call	_exit
	add	esp, 4
; Line 457
$L989:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_pfatal_with_name ENDP
_TEXT	ENDS
PUBLIC	_fatal_io_error
_DATA	SEGMENT
	ORG $+3
$SG995	DB	'%s: %s: I/O error', 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_name$ = 8
_fatal_io_error PROC NEAR
; Line 462
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 463
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	mov	eax, DWORD PTR _progname
	push	eax
	push	OFFSET $SG995
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
; Line 464
	push	35					; 00000023H
	call	_exit
	add	esp, 4
; Line 465
$L994:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_fatal_io_error ENDP
_TEXT	ENDS
PUBLIC	_error
PUBLIC	_fatal
_TEXT	SEGMENT
_s$ = 8
_v$ = 12
_fatal	PROC NEAR
; Line 471
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 472
	push	0
	mov	eax, DWORD PTR _v$[ebp]
	push	eax
	mov	eax, DWORD PTR _s$[ebp]
	push	eax
	call	_error
	add	esp, 12					; 0000000cH
; Line 473
	push	34					; 00000022H
	call	_exit
	add	esp, 4
; Line 474
$L999:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_fatal	ENDP
_TEXT	ENDS
PUBLIC	_fatal_insn_not_found
EXTRN	_debug_rtx:NEAR
EXTRN	_abort:NEAR
_DATA	SEGMENT
	ORG $+1
$SG1003	DB	'The following insn was not recognizable:', 00H
_DATA	ENDS
_TEXT	SEGMENT
_insn$ = 8
_fatal_insn_not_found PROC NEAR
; Line 483
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 484
	push	0
	push	0
	push	OFFSET $SG1003
	call	_error
	add	esp, 12					; 0000000cH
; Line 485
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_debug_rtx
	add	esp, 4
; Line 486
	call	_abort
; Line 487
$L1002:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_fatal_insn_not_found ENDP
_TEXT	ENDS
PUBLIC	_announce_function
EXTRN	_current_function_decl:DWORD
EXTRN	_fflush:NEAR
_BSS	SEGMENT
_need_error_newline$S1006 DD 01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+3
$SG1013	DB	' %s', 00H
_DATA	ENDS
_TEXT	SEGMENT
_decl$ = 8
_announce_function PROC NEAR
; Line 505
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 506
	cmp	DWORD PTR _quiet_flag, 0
	jne	$L1012
; Line 508
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+68]
	push	eax
	push	OFFSET $SG1013
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 509
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fflush
	add	esp, 4
; Line 510
	mov	DWORD PTR _need_error_newline$S1006, 1
; Line 511
	mov	eax, DWORD PTR _current_function_decl
	mov	DWORD PTR _last_error_function$S1007, eax
; Line 513
$L1012:
$L1011:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_announce_function ENDP
_TEXT	ENDS
PUBLIC	_report_error_function
_BSS	SEGMENT
_last_error_tick$S1008 DD 01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG1019	DB	0aH, 00H
	ORG $+2
$SG1022	DB	'%s: ', 00H
	ORG $+3
$SG1024	DB	'At top level:', 0aH, 00H
	ORG $+1
$SG1027	DB	'In method %s:', 0aH, 00H
	ORG $+1
$SG1029	DB	'In function %s:', 0aH, 00H
	ORG $+3
$SG1031	DB	'In file included', 00H
	ORG $+3
$SG1035	DB	' from %s:%d', 00H
$SG1037	DB	',', 00H
	ORG $+2
$SG1038	DB	':', 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_file$ = 8
_p$ = -4
_report_error_function PROC NEAR
; Line 521
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 524
	cmp	DWORD PTR _need_error_newline$S1006, 0
	je	$L1018
; Line 526
	push	OFFSET $SG1019
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 8
; Line 527
	mov	DWORD PTR _need_error_newline$S1006, 0
; Line 530
$L1018:
	mov	eax, DWORD PTR _last_error_function$S1007
	cmp	DWORD PTR _current_function_decl, eax
	je	$L1020
; Line 532
	cmp	DWORD PTR _file$[ebp], 0
	je	$L1021
; Line 533
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	push	OFFSET $SG1022
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 535
$L1021:
	cmp	DWORD PTR _current_function_decl, 0
	jne	$L1023
; Line 536
	push	OFFSET $SG1024
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 8
; Line 537
	jmp	$L1025
$L1023:
	mov	eax, DWORD PTR _current_function_decl
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 14					; 0000000eH
	jne	$L1026
; Line 539
	mov	eax, DWORD PTR _current_function_decl
	mov	eax, DWORD PTR [eax+68]
	push	eax
	push	OFFSET $SG1027
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 540
	jmp	$L1028
$L1026:
; Line 542
	mov	eax, DWORD PTR _current_function_decl
	mov	eax, DWORD PTR [eax+68]
	push	eax
	push	OFFSET $SG1029
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
$L1028:
$L1025:
; Line 544
	mov	eax, DWORD PTR _current_function_decl
	mov	DWORD PTR _last_error_function$S1007, eax
; Line 546
$L1020:
; Line 547
	cmp	DWORD PTR _input_file_stack, 0
	je	$L1030
	mov	eax, DWORD PTR _input_file_stack
	cmp	DWORD PTR [eax+4], 0
	je	$L1030
	mov	eax, DWORD PTR _last_error_tick$S1008
	cmp	DWORD PTR _input_file_stack_tick, eax
	je	$L1030
; Line 549
	push	OFFSET $SG1031
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 8
; Line 550
	mov	eax, DWORD PTR _input_file_stack
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _p$[ebp], eax
	jmp	$L1032
$L1033:
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _p$[ebp], eax
$L1032:
	cmp	DWORD PTR _p$[ebp], 0
	je	$L1034
; Line 552
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	push	OFFSET $SG1035
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
; Line 553
	mov	eax, DWORD PTR _p$[ebp]
	cmp	DWORD PTR [eax+4], 0
	je	$L1036
; Line 554
	push	OFFSET $SG1037
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 8
; Line 555
$L1036:
	jmp	$L1033
$L1034:
; Line 556
	push	OFFSET $SG1038
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 8
; Line 557
	mov	eax, DWORD PTR _input_file_stack_tick
	mov	DWORD PTR _last_error_tick$S1008, eax
; Line 559
$L1030:
$L1016:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_report_error_function ENDP
_TEXT	ENDS
PUBLIC	_error_with_file_and_line
_TEXT	SEGMENT
_s$ = 8
_v$ = 12
_v2$ = 16
_error	PROC NEAR
; Line 569
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 570
	mov	eax, DWORD PTR _v2$[ebp]
	push	eax
	mov	eax, DWORD PTR _v$[ebp]
	push	eax
	mov	eax, DWORD PTR _s$[ebp]
	push	eax
	mov	eax, DWORD PTR _lineno
	push	eax
	mov	eax, DWORD PTR _input_filename
	push	eax
	call	_error_with_file_and_line
	add	esp, 20					; 00000014H
; Line 571
$L1042:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_error	ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG1050	DB	'%s:%d: ', 00H
$SG1052	DB	'%s: ', 00H
	ORG $+3
$SG1053	DB	0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_file$ = 8
_line$ = 12
_s$ = 16
_v$ = 20
_v2$ = 24
_error_with_file_and_line PROC NEAR
; Line 583
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 584
	push	0
	call	_count_error
	add	esp, 4
; Line 586
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_report_error_function
	add	esp, 4
; Line 588
	cmp	DWORD PTR _file$[ebp], 0
	je	$L1049
; Line 589
	mov	eax, DWORD PTR _line$[ebp]
	push	eax
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	push	OFFSET $SG1050
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
; Line 590
	jmp	$L1051
$L1049:
; Line 591
	mov	eax, DWORD PTR _progname
	push	eax
	push	OFFSET $SG1052
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
$L1051:
; Line 592
	mov	eax, DWORD PTR _v2$[ebp]
	push	eax
	mov	eax, DWORD PTR _v$[ebp]
	push	eax
	mov	eax, DWORD PTR _s$[ebp]
	push	eax
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
; Line 593
	push	OFFSET $SG1053
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 8
; Line 594
$L1048:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_error_with_file_and_line ENDP
_TEXT	ENDS
PUBLIC	_error_with_decl
_DATA	SEGMENT
	ORG $+2
$SG1059	DB	'%s:%d: ', 00H
$SG1064	DB	'((anonymous))', 00H
	ORG $+2
$SG1065	DB	0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_decl$ = 8
_s$ = 12
_v$ = 16
_error_with_decl PROC NEAR
; Line 604
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 605
	push	0
	call	_count_error
	add	esp, 4
; Line 607
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	call	_report_error_function
	add	esp, 4
; Line 610
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	push	OFFSET $SG1059
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
; Line 612
	mov	eax, DWORD PTR _decl$[ebp]
	cmp	DWORD PTR [eax+68], 0
	je	$L1060
; Line 613
	mov	eax, DWORD PTR _v$[ebp]
	push	eax
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+68]
	push	eax
	mov	eax, DWORD PTR _s$[ebp]
	push	eax
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
; Line 614
	jmp	$L1061
$L1060:
	mov	eax, DWORD PTR _decl$[ebp]
	cmp	DWORD PTR [eax+40], 0
	je	$L1062
; Line 615
	mov	eax, DWORD PTR _v$[ebp]
	push	eax
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+40]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	mov	eax, DWORD PTR _s$[ebp]
	push	eax
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
; Line 616
	jmp	$L1063
$L1062:
; Line 617
	mov	eax, DWORD PTR _v$[ebp]
	push	eax
	push	OFFSET $SG1064
	mov	eax, DWORD PTR _s$[ebp]
	push	eax
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
$L1063:
$L1061:
; Line 618
	push	OFFSET $SG1065
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 8
; Line 619
$L1058:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_error_with_decl ENDP
_TEXT	ENDS
PUBLIC	_error_for_asm
_TEXT	SEGMENT
_insn$ = 8
_s$ = 12
_v$ = 16
_v2$ = 20
_filename$ = -16
_line$ = -8
_body$ = -20
_asmop$ = -4
_error_for_asm PROC NEAR
; Line 632
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	push	ebx
	push	esi
	push	edi
; Line 636
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _body$[ebp], eax
; Line 640
	mov	eax, DWORD PTR _body$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1077
	mov	eax, DWORD PTR _body$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1441792				; 00160000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1077
; Line 641
	mov	eax, DWORD PTR _body$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _asmop$[ebp], eax
; Line 642
	jmp	$L1078
$L1077:
	mov	eax, DWORD PTR _body$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1441792				; 00160000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1079
; Line 643
	mov	eax, DWORD PTR _body$[ebp]
	mov	DWORD PTR _asmop$[ebp], eax
; Line 644
	jmp	$L1080
$L1079:
; Line 645
	mov	eax, DWORD PTR _body$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1310720				; 00140000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1081
	mov	eax, DWORD PTR _body$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1081
; Line 646
	mov	eax, DWORD PTR _body$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _asmop$[ebp], eax
; Line 647
	jmp	$L1082
$L1081:
; Line 648
	mov	eax, DWORD PTR _body$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1310720				; 00140000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1083
	mov	eax, DWORD PTR _body$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1441792				; 00160000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1083
; Line 649
	mov	eax, DWORD PTR _body$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _asmop$[ebp], eax
; Line 651
$L1083:
$L1082:
$L1080:
$L1078:
	mov	eax, DWORD PTR _asmop$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _filename$[ebp], eax
; Line 652
	mov	eax, DWORD PTR _asmop$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR _line$[ebp], eax
; Line 654
	mov	eax, DWORD PTR _v2$[ebp]
	push	eax
	mov	eax, DWORD PTR _v$[ebp]
	push	eax
	mov	eax, DWORD PTR _s$[ebp]
	push	eax
	mov	eax, DWORD PTR _line$[ebp]
	push	eax
	mov	eax, DWORD PTR _filename$[ebp]
	push	eax
	call	_error_with_file_and_line
	add	esp, 20					; 00000014H
; Line 655
$L1071:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_error_for_asm ENDP
_TEXT	ENDS
PUBLIC	_warning_with_file_and_line
_DATA	SEGMENT
	ORG $+2
$SG1093	DB	'%s:%d: ', 00H
$SG1095	DB	'%s: ', 00H
	ORG $+3
$SG1096	DB	'warning: ', 00H
	ORG $+2
$SG1097	DB	0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_v2$ = 24
_file$ = 8
_line$ = 12
_s$ = 16
_v$ = 20
_warning_with_file_and_line PROC NEAR
; Line 667
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 668
	push	1
	call	_count_error
	add	esp, 4
	or	eax, eax
	jne	$L1091
; Line 669
	jmp	$L1090
; Line 671
$L1091:
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_report_error_function
	add	esp, 4
; Line 673
	cmp	DWORD PTR _file$[ebp], 0
	je	$L1092
; Line 674
	mov	eax, DWORD PTR _line$[ebp]
	push	eax
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	push	OFFSET $SG1093
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
; Line 675
	jmp	$L1094
$L1092:
; Line 676
	mov	eax, DWORD PTR _progname
	push	eax
	push	OFFSET $SG1095
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
$L1094:
; Line 678
	push	OFFSET $SG1096
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 8
; Line 679
	mov	eax, DWORD PTR _v2$[ebp]
	push	eax
	mov	eax, DWORD PTR _v$[ebp]
	push	eax
	mov	eax, DWORD PTR _s$[ebp]
	push	eax
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
; Line 680
	push	OFFSET $SG1097
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 8
; Line 681
$L1090:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_warning_with_file_and_line ENDP
_TEXT	ENDS
PUBLIC	_warning
_TEXT	SEGMENT
_s$ = 8
_v$ = 12
_v2$ = 16
_warning PROC NEAR
; Line 691
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 692
	mov	eax, DWORD PTR _v2$[ebp]
	push	eax
	mov	eax, DWORD PTR _v$[ebp]
	push	eax
	mov	eax, DWORD PTR _s$[ebp]
	push	eax
	mov	eax, DWORD PTR _lineno
	push	eax
	mov	eax, DWORD PTR _input_filename
	push	eax
	call	_warning_with_file_and_line
	add	esp, 20					; 00000014H
; Line 693
$L1102:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_warning ENDP
_TEXT	ENDS
PUBLIC	_warning_with_decl
_DATA	SEGMENT
	ORG $+2
$SG1109	DB	'%s:%d: ', 00H
$SG1110	DB	'warning: ', 00H
	ORG $+2
$SG1115	DB	'((anonymous))', 00H
	ORG $+2
$SG1116	DB	0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_decl$ = 8
_s$ = 12
_v$ = 16
_warning_with_decl PROC NEAR
; Line 704
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 705
	push	1
	call	_count_error
	add	esp, 4
	or	eax, eax
	jne	$L1108
; Line 706
	jmp	$L1107
; Line 708
$L1108:
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	call	_report_error_function
	add	esp, 4
; Line 711
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	push	OFFSET $SG1109
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
; Line 713
	push	OFFSET $SG1110
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 8
; Line 714
	mov	eax, DWORD PTR _decl$[ebp]
	cmp	DWORD PTR [eax+68], 0
	je	$L1111
; Line 715
	mov	eax, DWORD PTR _v$[ebp]
	push	eax
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+68]
	push	eax
	mov	eax, DWORD PTR _s$[ebp]
	push	eax
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
; Line 716
	jmp	$L1112
$L1111:
	mov	eax, DWORD PTR _decl$[ebp]
	cmp	DWORD PTR [eax+40], 0
	je	$L1113
; Line 717
	mov	eax, DWORD PTR _v$[ebp]
	push	eax
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+40]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	mov	eax, DWORD PTR _s$[ebp]
	push	eax
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
; Line 718
	jmp	$L1114
$L1113:
; Line 719
	mov	eax, DWORD PTR _v$[ebp]
	push	eax
	push	OFFSET $SG1115
	mov	eax, DWORD PTR _s$[ebp]
	push	eax
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
$L1114:
$L1112:
; Line 720
	push	OFFSET $SG1116
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 8
; Line 721
$L1107:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_warning_with_decl ENDP
_TEXT	ENDS
PUBLIC	_sorry
_DATA	SEGMENT
	ORG $+2
$SG1123	DB	'%s:%d: ', 00H
$SG1125	DB	'%s: ', 00H
	ORG $+3
$SG1126	DB	'sorry, not implemented: ', 00H
	ORG $+3
$SG1127	DB	0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_s$ = 8
_v$ = 12
_v2$ = 16
_sorry	PROC NEAR
; Line 730
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 731
	inc	DWORD PTR _sorrycount
; Line 732
	cmp	DWORD PTR _input_filename, 0
	je	$L1122
; Line 733
	mov	eax, DWORD PTR _lineno
	push	eax
	mov	eax, DWORD PTR _input_filename
	push	eax
	push	OFFSET $SG1123
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
; Line 734
	jmp	$L1124
$L1122:
; Line 735
	mov	eax, DWORD PTR _progname
	push	eax
	push	OFFSET $SG1125
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
$L1124:
; Line 737
	push	OFFSET $SG1126
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 8
; Line 738
	mov	eax, DWORD PTR _v2$[ebp]
	push	eax
	mov	eax, DWORD PTR _v$[ebp]
	push	eax
	mov	eax, DWORD PTR _s$[ebp]
	push	eax
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
; Line 739
	push	OFFSET $SG1127
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 8
; Line 740
$L1121:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_sorry	ENDP
_TEXT	ENDS
PUBLIC	_really_sorry
_DATA	SEGMENT
	ORG $+2
$SG1134	DB	'%s:%d: ', 00H
$SG1136	DB	'c++: ', 00H
	ORG $+2
$SG1137	DB	'sorry, not implemented: ', 00H
	ORG $+3
$SG1138	DB	' (fatal)', 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_s$ = 8
_v$ = 12
_v2$ = 16
_really_sorry PROC NEAR
; Line 749
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 750
	cmp	DWORD PTR _input_filename, 0
	je	$L1133
; Line 751
	mov	eax, DWORD PTR _lineno
	push	eax
	mov	eax, DWORD PTR _input_filename
	push	eax
	push	OFFSET $SG1134
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
; Line 752
	jmp	$L1135
$L1133:
; Line 753
	push	OFFSET $SG1136
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 8
$L1135:
; Line 755
	push	OFFSET $SG1137
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 8
; Line 756
	mov	eax, DWORD PTR _v2$[ebp]
	push	eax
	mov	eax, DWORD PTR _v$[ebp]
	push	eax
	mov	eax, DWORD PTR _s$[ebp]
	push	eax
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
; Line 757
	push	0
	push	OFFSET $SG1138
	call	_fatal
	add	esp, 8
; Line 758
$L1132:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_really_sorry ENDP
_TEXT	ENDS
PUBLIC	_fancy_abort
_DATA	SEGMENT
	ORG $+2
$SG1140	DB	'Internal gcc abort.', 00H
_DATA	ENDS
_TEXT	SEGMENT
_fancy_abort PROC NEAR
; Line 765
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 766
	push	0
	push	OFFSET $SG1140
	call	_fatal
	add	esp, 8
; Line 767
$L1139:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_fancy_abort ENDP
_TEXT	ENDS
PUBLIC	_botch
_TEXT	SEGMENT
_botch	PROC NEAR
; Line 774
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 775
	call	_abort
; Line 776
$L1143:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_botch	ENDP
_TEXT	ENDS
PUBLIC	_xmalloc
EXTRN	_malloc:NEAR
_DATA	SEGMENT
$SG1150	DB	'Virtual memory exhausted.', 00H
_DATA	ENDS
_TEXT	SEGMENT
_size$ = 8
_value$ = -4
_xmalloc PROC NEAR
; Line 783
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 784
	mov	eax, DWORD PTR _size$[ebp]
	push	eax
	call	_malloc
	add	esp, 4
	mov	DWORD PTR _value$[ebp], eax
; Line 785
	cmp	DWORD PTR _value$[ebp], 0
	jne	$L1149
; Line 786
	push	0
	push	OFFSET $SG1150
	call	_fatal
	add	esp, 8
; Line 787
$L1149:
	mov	eax, DWORD PTR _value$[ebp]
	jmp	$L1146
; Line 788
$L1146:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_xmalloc ENDP
_TEXT	ENDS
PUBLIC	_xrealloc
EXTRN	_realloc:NEAR
_DATA	SEGMENT
	ORG $+2
$SG1158	DB	'Virtual memory exhausted.', 00H
_DATA	ENDS
_TEXT	SEGMENT
_size$ = 12
_result$ = -4
_ptr$ = 8
_xrealloc PROC NEAR
; Line 796
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 797
	mov	eax, DWORD PTR _size$[ebp]
	push	eax
	mov	eax, DWORD PTR _ptr$[ebp]
	push	eax
	call	_realloc
	add	esp, 8
	mov	DWORD PTR _result$[ebp], eax
; Line 798
	cmp	DWORD PTR _result$[ebp], 0
	jne	$L1157
; Line 799
	push	0
	push	OFFSET $SG1158
	call	_fatal
	add	esp, 8
; Line 800
$L1157:
	mov	eax, DWORD PTR _result$[ebp]
	jmp	$L1154
; Line 801
$L1154:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_xrealloc ENDP
_TEXT	ENDS
PUBLIC	_exact_log2
_TEXT	SEGMENT
_x$ = 8
_log$ = -4
_exact_log2 PROC NEAR
; Line 809
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 810
	mov	DWORD PTR _log$[ebp], 0
; Line 811
	mov	DWORD PTR _log$[ebp], 0
	jmp	$L1163
$L1164:
	inc	DWORD PTR _log$[ebp]
$L1163:
	cmp	DWORD PTR _log$[ebp], 32		; 00000020H
	jge	$L1165
; Line 812
	mov	eax, 1
	mov	cl, BYTE PTR _log$[ebp]
	shl	eax, cl
	cmp	eax, DWORD PTR _x$[ebp]
	jne	$L1166
; Line 813
	mov	eax, DWORD PTR _log$[ebp]
	jmp	$L1161
; Line 814
$L1166:
	jmp	$L1164
$L1165:
	mov	eax, -1
	jmp	$L1161
; Line 815
$L1161:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_exact_log2 ENDP
_TEXT	ENDS
PUBLIC	_floor_log2
_TEXT	SEGMENT
_x$ = 8
_log$ = -4
_floor_log2 PROC NEAR
; Line 823
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 824
	mov	DWORD PTR _log$[ebp], 0
; Line 825
	mov	DWORD PTR _log$[ebp], 0
	jmp	$L1171
$L1172:
	inc	DWORD PTR _log$[ebp]
$L1171:
	cmp	DWORD PTR _log$[ebp], 32		; 00000020H
	jge	$L1173
; Line 826
	mov	eax, -1
	mov	cl, BYTE PTR _log$[ebp]
	shl	eax, cl
	test	eax, DWORD PTR _x$[ebp]
	jne	$L1174
; Line 827
	mov	eax, DWORD PTR _log$[ebp]
	dec	eax
	jmp	$L1169
; Line 828
$L1174:
	jmp	$L1172
$L1173:
	mov	eax, 31					; 0000001fH
	jmp	$L1169
; Line 829
$L1169:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_floor_log2 ENDP
_TEXT	ENDS
PUBLIC	_set_float_handler
EXTRN	_memcpy:NEAR
_TEXT	SEGMENT
_handler$ = 8
_set_float_handler PROC NEAR
; Line 840
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 841
	cmp	DWORD PTR _handler$[ebp], 1
	sbb	eax, eax
	inc	eax
	mov	DWORD PTR _float_handled, eax
; Line 842
	cmp	DWORD PTR _handler$[ebp], 0
	je	$L1180
; Line 843
	push	64					; 00000040H
	mov	eax, DWORD PTR _handler$[ebp]
	push	eax
	push	OFFSET _float_handler
	call	_memcpy
	add	esp, 12					; 0000000cH
; Line 844
$L1180:
$L1179:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_set_float_handler ENDP
_TEXT	ENDS
PUBLIC	_rest_of_decl_compilation
EXTRN	_init_tree:NEAR
EXTRN	_init_rtl:NEAR
EXTRN	_dump_combine_total_stats:NEAR
EXTRN	_init_optabs:NEAR
EXTRN	_fopen:NEAR
EXTRN	_symout_init:NEAR
EXTRN	_fileno:NEAR
EXTRN	_dbxout_init:NEAR
EXTRN	_init_final:NEAR
EXTRN	_yyparse:NEAR
EXTRN	_dbxout_symbol:NEAR
EXTRN	_output_inline_function:NEAR
EXTRN	_ungetc:NEAR
EXTRN	_getdecls:NEAR
EXTRN	_gettags:NEAR
EXTRN	_fstat:NEAR
EXTRN	_strlen:NEAR
EXTRN	_strcmp:NEAR
EXTRN	_dbxout_tags:NEAR
EXTRN	_dbxout_types:NEAR
EXTRN	_get_permanent_types:NEAR
EXTRN	_init_emit_once:NEAR
EXTRN	_fclose:NEAR
EXTRN	_symout_types:NEAR
EXTRN	_symout_top_blocks:NEAR
EXTRN	_strcpy:NEAR
EXTRN	_symout_finish:NEAR
EXTRN	_strcat:NEAR
EXTRN	_end_final:NEAR
EXTRN	_finput:DWORD
EXTRN	_init_lex:NEAR
EXTRN	_check_newline:NEAR
EXTRN	_init_decl_processing:NEAR
_DATA	SEGMENT
	ORG $+2
$SG1196	DB	'gccdump', 00H
$SG1201	DB	'-', 00H
	ORG $+2
$SG1202	DB	'stdin', 00H
	ORG $+2
$SG1204	DB	'r', 00H
	ORG $+2
$SG1211	DB	'.rtl', 00H
	ORG $+3
$SG1212	DB	'w', 00H
	ORG $+2
$SG1216	DB	'.jump', 00H
	ORG $+2
$SG1217	DB	'w', 00H
	ORG $+2
$SG1221	DB	'.cse', 00H
	ORG $+3
$SG1222	DB	'w', 00H
	ORG $+2
$SG1226	DB	'.loop', 00H
	ORG $+2
$SG1227	DB	'w', 00H
	ORG $+2
$SG1231	DB	'.flow', 00H
	ORG $+2
$SG1232	DB	'w', 00H
	ORG $+2
$SG1236	DB	'.combine', 00H
	ORG $+3
$SG1237	DB	'w', 00H
	ORG $+2
$SG1241	DB	'.lreg', 00H
	ORG $+2
$SG1242	DB	'w', 00H
	ORG $+2
$SG1246	DB	'.greg', 00H
	ORG $+2
$SG1247	DB	'w', 00H
	ORG $+2
$SG1251	DB	'.jump2', 00H
	ORG $+1
$SG1252	DB	'w', 00H
	ORG $+2
$SG1256	DB	'.dbr', 00H
	ORG $+3
$SG1257	DB	'w', 00H
	ORG $+2
$SG1264	DB	'.c', 00H
	ORG $+1
$SG1267	DB	'.i', 00H
	ORG $+1
$SG1270	DB	'.co', 00H
$SG1271	DB	'.s', 00H
	ORG $+1
$SG1274	DB	'-', 00H
	ORG $+2
$SG1276	DB	'w', 00H
	ORG $+2
$SG1280	DB	09H, '.file', 09H, '"%s"', 0aH, 00H
	ORG $+3
$SG1281	DB	'gcc_compiled.:', 0aH, 00H
$SG1286	DB	'.c', 00H
	ORG $+1
$SG1289	DB	'.i', 00H
	ORG $+1
$SG1292	DB	'.co', 00H
$SG1293	DB	'.sym', 00H
	ORG $+3
$SG1317	DB	'`%s'' declared but never defined', 00H
$SG1320	DB	'`%s'' defined but not used', 00H
	ORG $+2
$SG1353	DB	0aH, 00H
	ORG $+2
$SG1354	DB	'parse', 00H
	ORG $+2
$SG1355	DB	'integration', 00H
$SG1356	DB	'jump', 00H
	ORG $+3
$SG1357	DB	'cse', 00H
$SG1358	DB	'loop', 00H
	ORG $+3
$SG1359	DB	'flow', 00H
	ORG $+3
$SG1360	DB	'combine', 00H
$SG1361	DB	'local-alloc', 00H
$SG1362	DB	'global-alloc', 00H
	ORG $+3
$SG1363	DB	'dbranch', 00H
$SG1364	DB	'final', 00H
	ORG $+2
$SG1365	DB	'varconst', 00H
	ORG $+3
$SG1366	DB	'symout', 00H
	ORG $+1
$SG1367	DB	'dump', 00H
_DATA	ENDS
_TEXT	SEGMENT
_dumpname$1283 = -72
_len$1284 = -68
_dumpname$1220 = -28
_dumpname$1225 = -32
_dumpname$1230 = -36
_dumpname$1235 = -40
_decl$1300 = -76
_dumpname$1240 = -44
_dumpname$1245 = -48
_otime$1312 = -80
_dumpname$1250 = -52
_name$ = 8
_dumpname$1255 = -56
_globals$ = -12
_start_time$ = -8
_dump_base_name_length$ = -4
_name_specified$ = -16
_otime$1325 = -84
_dumpname$1261 = -64
_len$1262 = -60
_otime$1333 = -88
_statbuf$1334 = -124
_dumpname$1208 = -20
_dumpname$1215 = -24
_compile_file PROC NEAR
; Line 871
	push	ebp
	mov	ebp, esp
	sub	esp, 124				; 0000007cH
	push	ebx
	push	esi
	push	edi
; Line 876
	cmp	DWORD PTR _name$[ebp], 1
	sbb	eax, eax
	inc	eax
	mov	DWORD PTR _name_specified$[ebp], eax
; Line 878
	cmp	DWORD PTR _dump_base_name, 0
	jne	$L1195
; Line 879
	cmp	DWORD PTR _name$[ebp], 0
	je	$L1786
	mov	eax, DWORD PTR _name$[ebp]
	mov	DWORD PTR _dump_base_name, eax
	jmp	$L1787
$L1786:
	mov	DWORD PTR _dump_base_name, OFFSET $SG1196
$L1787:
; Line 880
$L1195:
	mov	eax, DWORD PTR _dump_base_name
	push	eax
	call	_strlen
	add	esp, 4
	mov	DWORD PTR _dump_base_name_length$[ebp], eax
; Line 882
	mov	DWORD PTR _parse_time, 0
; Line 883
	mov	DWORD PTR _varconst_time, 0
; Line 884
	mov	DWORD PTR _integration_time, 0
; Line 885
	mov	DWORD PTR _jump_time, 0
; Line 886
	mov	DWORD PTR _cse_time, 0
; Line 887
	mov	DWORD PTR _loop_time, 0
; Line 888
	mov	DWORD PTR _flow_time, 0
; Line 889
	mov	DWORD PTR _combine_time, 0
; Line 890
	mov	DWORD PTR _local_alloc_time, 0
; Line 891
	mov	DWORD PTR _global_alloc_time, 0
; Line 892
	mov	DWORD PTR _dbr_sched_time, 0
; Line 893
	mov	DWORD PTR _final_time, 0
; Line 894
	mov	DWORD PTR _symout_time, 0
; Line 895
	mov	DWORD PTR _dump_time, 0
; Line 899
	cmp	DWORD PTR _name$[ebp], 0
	je	$L1200
	push	OFFSET $SG1201
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L1199
$L1200:
; Line 901
	mov	DWORD PTR _finput, OFFSET __iob
; Line 902
	mov	DWORD PTR _name$[ebp], OFFSET $SG1202
; Line 904
	jmp	$L1203
$L1199:
; Line 905
	push	OFFSET $SG1204
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_fopen
	add	esp, 8
	mov	DWORD PTR _finput, eax
$L1203:
; Line 906
	cmp	DWORD PTR _finput, 0
	jne	$L1205
; Line 907
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_pfatal_with_name
	add	esp, 4
; Line 911
$L1205:
	call	_init_tree
; Line 912
	call	_init_lex
; Line 913
	call	_init_rtl
; Line 914
	call	_init_emit_once
; Line 915
	call	_init_decl_processing
; Line 916
	call	_init_optabs
; Line 919
	cmp	DWORD PTR _rtl_dump, 0
	je	$L1207
; Line 921
	mov	eax, DWORD PTR _dump_base_name_length$[ebp]
	add	eax, 6
	push	eax
	call	_xmalloc
	add	esp, 4
	mov	DWORD PTR _dumpname$1208[ebp], eax
; Line 922
	mov	eax, DWORD PTR _dump_base_name
	push	eax
	mov	eax, DWORD PTR _dumpname$1208[ebp]
	push	eax
	call	_strcpy
	add	esp, 8
; Line 923
	push	OFFSET $SG1211
	mov	eax, DWORD PTR _dumpname$1208[ebp]
	push	eax
	call	_strcat
	add	esp, 8
; Line 924
	push	OFFSET $SG1212
	mov	eax, DWORD PTR _dumpname$1208[ebp]
	push	eax
	call	_fopen
	add	esp, 8
	mov	DWORD PTR _rtl_dump_file, eax
; Line 925
	cmp	DWORD PTR _rtl_dump_file, 0
	jne	$L1213
; Line 926
	mov	eax, DWORD PTR _dumpname$1208[ebp]
	push	eax
	call	_pfatal_with_name
	add	esp, 4
; Line 927
$L1213:
; Line 930
$L1207:
	cmp	DWORD PTR _jump_opt_dump, 0
	je	$L1214
; Line 932
	mov	eax, DWORD PTR _dump_base_name_length$[ebp]
	add	eax, 6
	push	eax
	call	_xmalloc
	add	esp, 4
	mov	DWORD PTR _dumpname$1215[ebp], eax
; Line 933
	mov	eax, DWORD PTR _dump_base_name
	push	eax
	mov	eax, DWORD PTR _dumpname$1215[ebp]
	push	eax
	call	_strcpy
	add	esp, 8
; Line 934
	push	OFFSET $SG1216
	mov	eax, DWORD PTR _dumpname$1215[ebp]
	push	eax
	call	_strcat
	add	esp, 8
; Line 935
	push	OFFSET $SG1217
	mov	eax, DWORD PTR _dumpname$1215[ebp]
	push	eax
	call	_fopen
	add	esp, 8
	mov	DWORD PTR _jump_opt_dump_file, eax
; Line 936
	cmp	DWORD PTR _jump_opt_dump_file, 0
	jne	$L1218
; Line 937
	mov	eax, DWORD PTR _dumpname$1215[ebp]
	push	eax
	call	_pfatal_with_name
	add	esp, 4
; Line 938
$L1218:
; Line 941
$L1214:
	cmp	DWORD PTR _cse_dump, 0
	je	$L1219
; Line 943
	mov	eax, DWORD PTR _dump_base_name_length$[ebp]
	add	eax, 6
	push	eax
	call	_xmalloc
	add	esp, 4
	mov	DWORD PTR _dumpname$1220[ebp], eax
; Line 944
	mov	eax, DWORD PTR _dump_base_name
	push	eax
	mov	eax, DWORD PTR _dumpname$1220[ebp]
	push	eax
	call	_strcpy
	add	esp, 8
; Line 945
	push	OFFSET $SG1221
	mov	eax, DWORD PTR _dumpname$1220[ebp]
	push	eax
	call	_strcat
	add	esp, 8
; Line 946
	push	OFFSET $SG1222
	mov	eax, DWORD PTR _dumpname$1220[ebp]
	push	eax
	call	_fopen
	add	esp, 8
	mov	DWORD PTR _cse_dump_file, eax
; Line 947
	cmp	DWORD PTR _cse_dump_file, 0
	jne	$L1223
; Line 948
	mov	eax, DWORD PTR _dumpname$1220[ebp]
	push	eax
	call	_pfatal_with_name
	add	esp, 4
; Line 949
$L1223:
; Line 952
$L1219:
	cmp	DWORD PTR _loop_dump, 0
	je	$L1224
; Line 954
	mov	eax, DWORD PTR _dump_base_name_length$[ebp]
	add	eax, 6
	push	eax
	call	_xmalloc
	add	esp, 4
	mov	DWORD PTR _dumpname$1225[ebp], eax
; Line 955
	mov	eax, DWORD PTR _dump_base_name
	push	eax
	mov	eax, DWORD PTR _dumpname$1225[ebp]
	push	eax
	call	_strcpy
	add	esp, 8
; Line 956
	push	OFFSET $SG1226
	mov	eax, DWORD PTR _dumpname$1225[ebp]
	push	eax
	call	_strcat
	add	esp, 8
; Line 957
	push	OFFSET $SG1227
	mov	eax, DWORD PTR _dumpname$1225[ebp]
	push	eax
	call	_fopen
	add	esp, 8
	mov	DWORD PTR _loop_dump_file, eax
; Line 958
	cmp	DWORD PTR _loop_dump_file, 0
	jne	$L1228
; Line 959
	mov	eax, DWORD PTR _dumpname$1225[ebp]
	push	eax
	call	_pfatal_with_name
	add	esp, 4
; Line 960
$L1228:
; Line 963
$L1224:
	cmp	DWORD PTR _flow_dump, 0
	je	$L1229
; Line 965
	mov	eax, DWORD PTR _dump_base_name_length$[ebp]
	add	eax, 6
	push	eax
	call	_xmalloc
	add	esp, 4
	mov	DWORD PTR _dumpname$1230[ebp], eax
; Line 966
	mov	eax, DWORD PTR _dump_base_name
	push	eax
	mov	eax, DWORD PTR _dumpname$1230[ebp]
	push	eax
	call	_strcpy
	add	esp, 8
; Line 967
	push	OFFSET $SG1231
	mov	eax, DWORD PTR _dumpname$1230[ebp]
	push	eax
	call	_strcat
	add	esp, 8
; Line 968
	push	OFFSET $SG1232
	mov	eax, DWORD PTR _dumpname$1230[ebp]
	push	eax
	call	_fopen
	add	esp, 8
	mov	DWORD PTR _flow_dump_file, eax
; Line 969
	cmp	DWORD PTR _flow_dump_file, 0
	jne	$L1233
; Line 970
	mov	eax, DWORD PTR _dumpname$1230[ebp]
	push	eax
	call	_pfatal_with_name
	add	esp, 4
; Line 971
$L1233:
; Line 974
$L1229:
	cmp	DWORD PTR _combine_dump, 0
	je	$L1234
; Line 976
	mov	eax, DWORD PTR _dump_base_name_length$[ebp]
	add	eax, 10					; 0000000aH
	push	eax
	call	_xmalloc
	add	esp, 4
	mov	DWORD PTR _dumpname$1235[ebp], eax
; Line 977
	mov	eax, DWORD PTR _dump_base_name
	push	eax
	mov	eax, DWORD PTR _dumpname$1235[ebp]
	push	eax
	call	_strcpy
	add	esp, 8
; Line 978
	push	OFFSET $SG1236
	mov	eax, DWORD PTR _dumpname$1235[ebp]
	push	eax
	call	_strcat
	add	esp, 8
; Line 979
	push	OFFSET $SG1237
	mov	eax, DWORD PTR _dumpname$1235[ebp]
	push	eax
	call	_fopen
	add	esp, 8
	mov	DWORD PTR _combine_dump_file, eax
; Line 980
	cmp	DWORD PTR _combine_dump_file, 0
	jne	$L1238
; Line 981
	mov	eax, DWORD PTR _dumpname$1235[ebp]
	push	eax
	call	_pfatal_with_name
	add	esp, 4
; Line 982
$L1238:
; Line 985
$L1234:
	cmp	DWORD PTR _local_reg_dump, 0
	je	$L1239
; Line 987
	mov	eax, DWORD PTR _dump_base_name_length$[ebp]
	add	eax, 6
	push	eax
	call	_xmalloc
	add	esp, 4
	mov	DWORD PTR _dumpname$1240[ebp], eax
; Line 988
	mov	eax, DWORD PTR _dump_base_name
	push	eax
	mov	eax, DWORD PTR _dumpname$1240[ebp]
	push	eax
	call	_strcpy
	add	esp, 8
; Line 989
	push	OFFSET $SG1241
	mov	eax, DWORD PTR _dumpname$1240[ebp]
	push	eax
	call	_strcat
	add	esp, 8
; Line 990
	push	OFFSET $SG1242
	mov	eax, DWORD PTR _dumpname$1240[ebp]
	push	eax
	call	_fopen
	add	esp, 8
	mov	DWORD PTR _local_reg_dump_file, eax
; Line 991
	cmp	DWORD PTR _local_reg_dump_file, 0
	jne	$L1243
; Line 992
	mov	eax, DWORD PTR _dumpname$1240[ebp]
	push	eax
	call	_pfatal_with_name
	add	esp, 4
; Line 993
$L1243:
; Line 996
$L1239:
	cmp	DWORD PTR _global_reg_dump, 0
	je	$L1244
; Line 998
	mov	eax, DWORD PTR _dump_base_name_length$[ebp]
	add	eax, 6
	push	eax
	call	_xmalloc
	add	esp, 4
	mov	DWORD PTR _dumpname$1245[ebp], eax
; Line 999
	mov	eax, DWORD PTR _dump_base_name
	push	eax
	mov	eax, DWORD PTR _dumpname$1245[ebp]
	push	eax
	call	_strcpy
	add	esp, 8
; Line 1000
	push	OFFSET $SG1246
	mov	eax, DWORD PTR _dumpname$1245[ebp]
	push	eax
	call	_strcat
	add	esp, 8
; Line 1001
	push	OFFSET $SG1247
	mov	eax, DWORD PTR _dumpname$1245[ebp]
	push	eax
	call	_fopen
	add	esp, 8
	mov	DWORD PTR _global_reg_dump_file, eax
; Line 1002
	cmp	DWORD PTR _global_reg_dump_file, 0
	jne	$L1248
; Line 1003
	mov	eax, DWORD PTR _dumpname$1245[ebp]
	push	eax
	call	_pfatal_with_name
	add	esp, 4
; Line 1004
$L1248:
; Line 1007
$L1244:
	cmp	DWORD PTR _jump2_opt_dump, 0
	je	$L1249
; Line 1009
	mov	eax, DWORD PTR _dump_base_name_length$[ebp]
	add	eax, 7
	push	eax
	call	_xmalloc
	add	esp, 4
	mov	DWORD PTR _dumpname$1250[ebp], eax
; Line 1010
	mov	eax, DWORD PTR _dump_base_name
	push	eax
	mov	eax, DWORD PTR _dumpname$1250[ebp]
	push	eax
	call	_strcpy
	add	esp, 8
; Line 1011
	push	OFFSET $SG1251
	mov	eax, DWORD PTR _dumpname$1250[ebp]
	push	eax
	call	_strcat
	add	esp, 8
; Line 1012
	push	OFFSET $SG1252
	mov	eax, DWORD PTR _dumpname$1250[ebp]
	push	eax
	call	_fopen
	add	esp, 8
	mov	DWORD PTR _jump2_opt_dump_file, eax
; Line 1013
	cmp	DWORD PTR _jump2_opt_dump_file, 0
	jne	$L1253
; Line 1014
	mov	eax, DWORD PTR _dumpname$1250[ebp]
	push	eax
	call	_pfatal_with_name
	add	esp, 4
; Line 1015
$L1253:
; Line 1018
$L1249:
	cmp	DWORD PTR _dbr_sched_dump, 0
	je	$L1254
; Line 1020
	mov	eax, DWORD PTR _dump_base_name_length$[ebp]
	add	eax, 7
	push	eax
	call	_xmalloc
	add	esp, 4
	mov	DWORD PTR _dumpname$1255[ebp], eax
; Line 1021
	mov	eax, DWORD PTR _dump_base_name
	push	eax
	mov	eax, DWORD PTR _dumpname$1255[ebp]
	push	eax
	call	_strcpy
	add	esp, 8
; Line 1022
	push	OFFSET $SG1256
	mov	eax, DWORD PTR _dumpname$1255[ebp]
	push	eax
	call	_strcat
	add	esp, 8
; Line 1023
	push	OFFSET $SG1257
	mov	eax, DWORD PTR _dumpname$1255[ebp]
	push	eax
	call	_fopen
	add	esp, 8
	mov	DWORD PTR _dbr_sched_dump_file, eax
; Line 1024
	cmp	DWORD PTR _dbr_sched_dump_file, 0
	jne	$L1258
; Line 1025
	mov	eax, DWORD PTR _dumpname$1255[ebp]
	push	eax
	call	_pfatal_with_name
	add	esp, 4
; Line 1026
$L1258:
; Line 1030
$L1254:
	cmp	DWORD PTR _name_specified$[ebp], 0
	jne	$L1259
	cmp	DWORD PTR _asm_file_name, 0
	jne	$L1259
; Line 1031
	mov	eax, OFFSET __iob
	add	eax, 32					; 00000020H
	mov	DWORD PTR _asm_out_file, eax
; Line 1032
	jmp	$L1260
$L1259:
; Line 1034
	mov	eax, DWORD PTR _dump_base_name_length$[ebp]
	add	eax, 6
	push	eax
	call	_xmalloc
	add	esp, 4
	mov	DWORD PTR _dumpname$1261[ebp], eax
; Line 1035
	mov	eax, DWORD PTR _dump_base_name
	push	eax
	call	_strlen
	add	esp, 4
	mov	DWORD PTR _len$1262[ebp], eax
; Line 1036
	mov	eax, DWORD PTR _dump_base_name
	push	eax
	mov	eax, DWORD PTR _dumpname$1261[ebp]
	push	eax
	call	_strcpy
	add	esp, 8
; Line 1037
	cmp	DWORD PTR _len$1262[ebp], 2
	jle	$L1263
	mov	eax, DWORD PTR _len$1262[ebp]
	add	eax, DWORD PTR _dumpname$1261[ebp]
	sub	eax, 2
	push	eax
	push	OFFSET $SG1264
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L1263
; Line 1038
	mov	eax, DWORD PTR _len$1262[ebp]
	mov	ecx, DWORD PTR _dumpname$1261[ebp]
	mov	BYTE PTR [eax+ecx-2], 0
; Line 1039
	jmp	$L1265
$L1263:
	cmp	DWORD PTR _len$1262[ebp], 2
	jle	$L1266
	mov	eax, DWORD PTR _len$1262[ebp]
	add	eax, DWORD PTR _dumpname$1261[ebp]
	sub	eax, 2
	push	eax
	push	OFFSET $SG1267
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L1266
; Line 1040
	mov	eax, DWORD PTR _len$1262[ebp]
	mov	ecx, DWORD PTR _dumpname$1261[ebp]
	mov	BYTE PTR [eax+ecx-2], 0
; Line 1041
	jmp	$L1268
$L1266:
	cmp	DWORD PTR _len$1262[ebp], 3
	jle	$L1269
	mov	eax, DWORD PTR _len$1262[ebp]
	add	eax, DWORD PTR _dumpname$1261[ebp]
	sub	eax, 3
	push	eax
	push	OFFSET $SG1270
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L1269
; Line 1042
	mov	eax, DWORD PTR _len$1262[ebp]
	mov	ecx, DWORD PTR _dumpname$1261[ebp]
	mov	BYTE PTR [eax+ecx-3], 0
; Line 1043
$L1269:
$L1268:
$L1265:
	push	OFFSET $SG1271
	mov	eax, DWORD PTR _dumpname$1261[ebp]
	push	eax
	call	_strcat
	add	esp, 8
; Line 1044
	cmp	DWORD PTR _asm_file_name, 0
	jne	$L1272
; Line 1046
	mov	eax, DWORD PTR _dumpname$1261[ebp]
	push	eax
	call	_strlen
	add	esp, 4
	inc	eax
	push	eax
	call	_malloc
	add	esp, 4
	mov	DWORD PTR _asm_file_name, eax
; Line 1047
	mov	eax, DWORD PTR _dumpname$1261[ebp]
	push	eax
	mov	eax, DWORD PTR _asm_file_name
	push	eax
	call	_strcpy
	add	esp, 8
; Line 1049
$L1272:
	push	OFFSET $SG1274
	mov	eax, DWORD PTR _asm_file_name
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L1273
; Line 1050
	mov	eax, OFFSET __iob
	add	eax, 32					; 00000020H
	mov	DWORD PTR _asm_out_file, eax
; Line 1051
	jmp	$L1275
$L1273:
; Line 1052
	push	OFFSET $SG1276
	mov	eax, DWORD PTR _asm_file_name
	push	eax
	call	_fopen
	add	esp, 8
	mov	DWORD PTR _asm_out_file, eax
$L1275:
; Line 1053
	cmp	DWORD PTR _asm_out_file, 0
	jne	$L1277
; Line 1054
	mov	eax, DWORD PTR _asm_file_name
	push	eax
	call	_pfatal_with_name
	add	esp, 4
; Line 1055
$L1277:
$L1260:
; Line 1057
	mov	eax, DWORD PTR _name$[ebp]
	mov	DWORD PTR _input_filename, eax
; Line 1062
	mov	eax, DWORD PTR _finput
	push	eax
	call	_check_newline
	push	eax
	call	_ungetc
	add	esp, 8
; Line 1066
	cmp	DWORD PTR _main_input_filename, 0
	jne	$L1279
; Line 1067
	mov	eax, DWORD PTR _name$[ebp]
	mov	DWORD PTR _main_input_filename, eax
; Line 1070
$L1279:
; Line 1071
	push	12					; 0000000cH
	call	_xmalloc
	add	esp, 4
	mov	DWORD PTR _input_file_stack, eax
; Line 1072
	mov	eax, DWORD PTR _input_file_stack
	mov	DWORD PTR [eax+4], 0
; Line 1073
	mov	eax, DWORD PTR _input_filename
	mov	ecx, DWORD PTR _input_file_stack
	mov	DWORD PTR [ecx], eax
; Line 1075
	mov	eax, DWORD PTR _dump_base_name
	push	eax
	push	OFFSET $SG1280
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 1079
	push	OFFSET $SG1281
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_fprintf
	add	esp, 8
; Line 1085
	cmp	DWORD PTR _write_symbols, 1
	jne	$L1282
; Line 1087
	mov	eax, DWORD PTR _dump_base_name_length$[ebp]
	add	eax, 6
	push	eax
	call	_xmalloc
	add	esp, 4
	mov	DWORD PTR _dumpname$1283[ebp], eax
; Line 1088
	mov	eax, DWORD PTR _dump_base_name
	push	eax
	call	_strlen
	add	esp, 4
	mov	DWORD PTR _len$1284[ebp], eax
; Line 1089
	mov	eax, DWORD PTR _dump_base_name
	push	eax
	mov	eax, DWORD PTR _dumpname$1283[ebp]
	push	eax
	call	_strcpy
	add	esp, 8
; Line 1090
	cmp	DWORD PTR _len$1284[ebp], 2
	jle	$L1285
	mov	eax, DWORD PTR _len$1284[ebp]
	add	eax, DWORD PTR _dumpname$1283[ebp]
	sub	eax, 2
	push	eax
	push	OFFSET $SG1286
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L1285
; Line 1091
	mov	eax, DWORD PTR _len$1284[ebp]
	mov	ecx, DWORD PTR _dumpname$1283[ebp]
	mov	BYTE PTR [eax+ecx-2], 0
; Line 1092
	jmp	$L1287
$L1285:
	cmp	DWORD PTR _len$1284[ebp], 2
	jle	$L1288
	mov	eax, DWORD PTR _len$1284[ebp]
	add	eax, DWORD PTR _dumpname$1283[ebp]
	sub	eax, 2
	push	eax
	push	OFFSET $SG1289
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L1288
; Line 1093
	mov	eax, DWORD PTR _len$1284[ebp]
	mov	ecx, DWORD PTR _dumpname$1283[ebp]
	mov	BYTE PTR [eax+ecx-2], 0
; Line 1094
	jmp	$L1290
$L1288:
	cmp	DWORD PTR _len$1284[ebp], 3
	jle	$L1291
	mov	eax, DWORD PTR _len$1284[ebp]
	add	eax, DWORD PTR _dumpname$1283[ebp]
	sub	eax, 3
	push	eax
	push	OFFSET $SG1292
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L1291
; Line 1095
	mov	eax, DWORD PTR _len$1284[ebp]
	mov	ecx, DWORD PTR _dumpname$1283[ebp]
	mov	BYTE PTR [eax+ecx-3], 0
; Line 1096
$L1291:
$L1290:
$L1287:
	push	OFFSET $SG1293
	mov	eax, DWORD PTR _dumpname$1283[ebp]
	push	eax
	call	_strcat
	add	esp, 8
; Line 1097
	cmp	DWORD PTR _sym_file_name, 0
	jne	$L1294
; Line 1098
	mov	eax, DWORD PTR _dumpname$1283[ebp]
	mov	DWORD PTR _sym_file_name, eax
; Line 1099
$L1294:
	mov	eax, DWORD PTR _main_input_filename
	push	eax
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	mov	eax, DWORD PTR _sym_file_name
	push	eax
	call	_symout_init
	add	esp, 12					; 0000000cH
; Line 1105
$L1282:
	cmp	DWORD PTR _write_symbols, 2
	jne	$L1296
; Line 1106
	mov	eax, DWORD PTR _main_input_filename
	push	eax
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_dbxout_init
	add	esp, 8
; Line 1115
$L1296:
	mov	eax, DWORD PTR _main_input_filename
	push	eax
	call	_init_final
	add	esp, 4
; Line 1117
	call	_gettime
	mov	DWORD PTR _start_time$[ebp], eax
; Line 1122
	call	_yyparse
; Line 1127
	call	_gettime
	sub	eax, DWORD PTR _start_time$[ebp]
	add	DWORD PTR _parse_time, eax
; Line 1129
	sub	eax, eax
	sub	eax, DWORD PTR _integration_time
	neg	eax
	sub	DWORD PTR _parse_time, eax
; Line 1130
	sub	eax, eax
	sub	eax, DWORD PTR _varconst_time
	neg	eax
	sub	DWORD PTR _parse_time, eax
; Line 1132
	call	_getdecls
	mov	DWORD PTR _globals$[ebp], eax
; Line 1140
	mov	eax, DWORD PTR _globals$[ebp]
	mov	DWORD PTR _decl$1300[ebp], eax
	jmp	$L1301
$L1302:
	mov	eax, DWORD PTR _decl$1300[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _decl$1300[ebp], eax
$L1301:
	cmp	DWORD PTR _decl$1300[ebp], 0
	je	$L1303
; Line 1143
	mov	eax, DWORD PTR _decl$1300[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 43					; 0000002bH
	jne	$L1304
	mov	eax, DWORD PTR _decl$1300[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 2
	test	al, 1
	je	$L1304
	mov	eax, DWORD PTR _decl$1300[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 13					; 0000000dH
	test	al, 1
	jne	$L1304
; Line 1153
	mov	eax, DWORD PTR _decl$1300[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 5
	test	al, 1
	je	$L1306
	mov	eax, DWORD PTR _decl$1300[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 15					; 0000000fH
	test	al, 1
	jne	$L1306
	mov	eax, DWORD PTR _decl$1300[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 1
	test	al, 1
	jne	$L1306
	mov	eax, DWORD PTR _decl$1300[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 9
	test	al, 1
	je	$L1305
$L1306:
; Line 1154
	push	1
	push	1
	push	0
	mov	eax, DWORD PTR _decl$1300[ebp]
	push	eax
	call	_rest_of_decl_compilation
	add	esp, 16					; 00000010H
; Line 1157
	jmp	$L1307
$L1305:
	mov	eax, DWORD PTR _decl$1300[ebp]
	cmp	DWORD PTR [eax+64], 0
	je	$L1308
	cmp	DWORD PTR _write_symbols, 2
	jne	$L1308
; Line 1158
$L1309:
	call	_gettime
	mov	DWORD PTR _otime$1312[ebp], eax
	push	0
	mov	eax, DWORD PTR _decl$1300[ebp]
	push	eax
	call	_dbxout_symbol
	add	esp, 8
	call	_gettime
	sub	eax, DWORD PTR _otime$1312[ebp]
	add	DWORD PTR _varconst_time, eax
$L1310:
$L1311:
; Line 1164
$L1308:
$L1307:
; Line 1165
$L1304:
; Line 1169
	mov	eax, DWORD PTR _decl$1300[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 39					; 00000027H
	jne	$L1314
	mov	eax, DWORD PTR _decl$1300[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 13					; 0000000dH
	test	al, 1
	jne	$L1314
	mov	eax, DWORD PTR _decl$1300[ebp]
	cmp	DWORD PTR [eax+64], 0
	je	$L1314
	mov	eax, DWORD PTR _decl$1300[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 9
	test	al, 1
	je	$L1314
	mov	eax, DWORD PTR _decl$1300[ebp]
	test	BYTE PTR [eax+16], 1
	jne	$L1314
; Line 1170
	mov	eax, DWORD PTR _decl$1300[ebp]
	push	eax
	call	_output_inline_function
	add	esp, 4
; Line 1173
$L1314:
; Line 1177
	cmp	DWORD PTR _warn_unused, 0
	je	$L1316
	mov	eax, DWORD PTR _decl$1300[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 39					; 00000027H
	jne	$L1316
	mov	eax, DWORD PTR _decl$1300[ebp]
	cmp	DWORD PTR [eax+64], 0
	jne	$L1316
	mov	eax, DWORD PTR _decl$1300[ebp]
	test	BYTE PTR [eax+16], 1
	je	$L1316
	mov	eax, DWORD PTR _decl$1300[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 1
	test	al, 1
	jne	$L1316
; Line 1178
	push	0
	push	OFFSET $SG1317
	mov	eax, DWORD PTR _decl$1300[ebp]
	push	eax
	call	_warning_with_decl
	add	esp, 12					; 0000000cH
; Line 1182
$L1316:
; Line 1192
	cmp	DWORD PTR _warn_unused, 0
	je	$L1318
	mov	eax, DWORD PTR _decl$1300[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 39					; 00000027H
	je	$L1319
	mov	eax, DWORD PTR _decl$1300[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 43					; 0000002bH
	jne	$L1318
$L1319:
	mov	eax, DWORD PTR _decl$1300[ebp]
	test	BYTE PTR [eax+16], 1
	jne	$L1318
	mov	eax, DWORD PTR _decl$1300[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 1
	test	al, 1
	jne	$L1318
	mov	eax, DWORD PTR _decl$1300[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 15					; 0000000fH
	test	al, 1
	jne	$L1318
	mov	eax, DWORD PTR _decl$1300[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 14					; 0000000eH
	test	al, 1
	jne	$L1318
	mov	eax, DWORD PTR _decl$1300[ebp]
	mov	eax, DWORD PTR [eax+40]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 15					; 0000000fH
	test	al, 1
	jne	$L1318
; Line 1193
	push	0
	push	OFFSET $SG1320
	mov	eax, DWORD PTR _decl$1300[ebp]
	push	eax
	call	_warning_with_decl
	add	esp, 12					; 0000000cH
; Line 1194
$L1318:
	jmp	$L1302
$L1303:
; Line 1199
	cmp	DWORD PTR _write_symbols, 2
	jne	$L1321
; Line 1200
$L1322:
; Line 1204
	call	_gettime
	mov	DWORD PTR _otime$1325[ebp], eax
	call	_gettags
	push	eax
	call	_dbxout_tags
	add	esp, 4
	call	_get_permanent_types
	push	eax
	call	_dbxout_types
	add	esp, 4
	call	_gettime
	sub	eax, DWORD PTR _otime$1325[ebp]
	add	DWORD PTR _symout_time, eax
$L1323:
$L1324:
; Line 1217
$L1321:
	cmp	DWORD PTR _write_symbols, 1
	jne	$L1329
; Line 1218
$L1330:
; Line 1225
	call	_gettime
	mov	DWORD PTR _otime$1333[ebp], eax
	lea	eax, DWORD PTR _statbuf$1334[ebp]
	push	eax
	mov	eax, DWORD PTR _finput
	push	eax
	call	_fileno
	add	esp, 4
	push	eax
	call	_fstat
	add	esp, 8
	call	_get_permanent_types
	push	eax
	call	_symout_types
	add	esp, 4
	call	_gettags
	push	eax
	mov	eax, DWORD PTR _globals$[ebp]
	push	eax
	call	_symout_top_blocks
	add	esp, 8
	mov	eax, DWORD PTR _statbuf$1334[ebp+32]
	push	eax
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_symout_finish
	add	esp, 8
	call	_gettime
	sub	eax, DWORD PTR _otime$1333[ebp]
	add	DWORD PTR _symout_time, eax
$L1331:
$L1332:
; Line 1229
$L1329:
	mov	eax, DWORD PTR _main_input_filename
	push	eax
	call	_end_final
	add	esp, 4
; Line 1237
	cmp	DWORD PTR _rtl_dump, 0
	je	$L1339
; Line 1238
	mov	eax, DWORD PTR _rtl_dump_file
	push	eax
	call	_fclose
	add	esp, 4
; Line 1240
$L1339:
	cmp	DWORD PTR _jump_opt_dump, 0
	je	$L1340
; Line 1241
	mov	eax, DWORD PTR _jump_opt_dump_file
	push	eax
	call	_fclose
	add	esp, 4
; Line 1243
$L1340:
	cmp	DWORD PTR _cse_dump, 0
	je	$L1341
; Line 1244
	mov	eax, DWORD PTR _cse_dump_file
	push	eax
	call	_fclose
	add	esp, 4
; Line 1246
$L1341:
	cmp	DWORD PTR _loop_dump, 0
	je	$L1342
; Line 1247
	mov	eax, DWORD PTR _loop_dump_file
	push	eax
	call	_fclose
	add	esp, 4
; Line 1249
$L1342:
	cmp	DWORD PTR _flow_dump, 0
	je	$L1343
; Line 1250
	mov	eax, DWORD PTR _flow_dump_file
	push	eax
	call	_fclose
	add	esp, 4
; Line 1252
$L1343:
	cmp	DWORD PTR _combine_dump, 0
	je	$L1344
; Line 1254
	mov	eax, DWORD PTR _combine_dump_file
	push	eax
	call	_dump_combine_total_stats
	add	esp, 4
; Line 1255
	mov	eax, DWORD PTR _combine_dump_file
	push	eax
	call	_fclose
	add	esp, 4
; Line 1258
$L1344:
	cmp	DWORD PTR _local_reg_dump, 0
	je	$L1346
; Line 1259
	mov	eax, DWORD PTR _local_reg_dump_file
	push	eax
	call	_fclose
	add	esp, 4
; Line 1261
$L1346:
	cmp	DWORD PTR _global_reg_dump, 0
	je	$L1347
; Line 1262
	mov	eax, DWORD PTR _global_reg_dump_file
	push	eax
	call	_fclose
	add	esp, 4
; Line 1264
$L1347:
	cmp	DWORD PTR _jump2_opt_dump, 0
	je	$L1348
; Line 1265
	mov	eax, DWORD PTR _jump2_opt_dump_file
	push	eax
	call	_fclose
	add	esp, 4
; Line 1267
$L1348:
	cmp	DWORD PTR _dbr_sched_dump, 0
	je	$L1349
; Line 1268
	mov	eax, DWORD PTR _dbr_sched_dump_file
	push	eax
	call	_fclose
	add	esp, 4
; Line 1274
$L1349:
	mov	eax, DWORD PTR _finput
	push	eax
	call	_fclose
	add	esp, 4
; Line 1275
	mov	eax, DWORD PTR _asm_out_file
	test	BYTE PTR [eax+12], 32			; 00000020H
	jne	$L1351
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_fclose
	add	esp, 4
	or	eax, eax
	je	$L1350
$L1351:
; Line 1276
	mov	eax, DWORD PTR _asm_file_name
	push	eax
	call	_fatal_io_error
	add	esp, 4
; Line 1280
$L1350:
	cmp	DWORD PTR _quiet_flag, 0
	jne	$L1352
; Line 1282
	push	OFFSET $SG1353
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 8
; Line 1283
	mov	eax, DWORD PTR _parse_time
	push	eax
	push	OFFSET $SG1354
	call	_print_time
	add	esp, 8
; Line 1284
	mov	eax, DWORD PTR _integration_time
	push	eax
	push	OFFSET $SG1355
	call	_print_time
	add	esp, 8
; Line 1285
	mov	eax, DWORD PTR _jump_time
	push	eax
	push	OFFSET $SG1356
	call	_print_time
	add	esp, 8
; Line 1286
	mov	eax, DWORD PTR _cse_time
	push	eax
	push	OFFSET $SG1357
	call	_print_time
	add	esp, 8
; Line 1287
	mov	eax, DWORD PTR _loop_time
	push	eax
	push	OFFSET $SG1358
	call	_print_time
	add	esp, 8
; Line 1288
	mov	eax, DWORD PTR _flow_time
	push	eax
	push	OFFSET $SG1359
	call	_print_time
	add	esp, 8
; Line 1289
	mov	eax, DWORD PTR _combine_time
	push	eax
	push	OFFSET $SG1360
	call	_print_time
	add	esp, 8
; Line 1290
	mov	eax, DWORD PTR _local_alloc_time
	push	eax
	push	OFFSET $SG1361
	call	_print_time
	add	esp, 8
; Line 1291
	mov	eax, DWORD PTR _global_alloc_time
	push	eax
	push	OFFSET $SG1362
	call	_print_time
	add	esp, 8
; Line 1292
	mov	eax, DWORD PTR _dbr_sched_time
	push	eax
	push	OFFSET $SG1363
	call	_print_time
	add	esp, 8
; Line 1293
	mov	eax, DWORD PTR _final_time
	push	eax
	push	OFFSET $SG1364
	call	_print_time
	add	esp, 8
; Line 1294
	mov	eax, DWORD PTR _varconst_time
	push	eax
	push	OFFSET $SG1365
	call	_print_time
	add	esp, 8
; Line 1295
	mov	eax, DWORD PTR _symout_time
	push	eax
	push	OFFSET $SG1366
	call	_print_time
	add	esp, 8
; Line 1296
	mov	eax, DWORD PTR _dump_time
	push	eax
	push	OFFSET $SG1367
	call	_print_time
	add	esp, 8
; Line 1298
$L1352:
$L1190:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_compile_file ENDP
_TEXT	ENDS
EXTRN	_error_mark_node:DWORD
EXTRN	_make_decl_rtl:NEAR
EXTRN	_assemble_variable:NEAR
EXTRN	_decode_reg_name:NEAR
EXTRN	_get_temporary_types:NEAR
_DATA	SEGMENT
	ORG $+3
$SG1388	DB	'invalid register name `%s'' for register variable', 00H
_DATA	ENDS
_TEXT	SEGMENT
_decl$ = 8
_asmspec$ = 12
_top_level$ = 16
_at_end$ = 20
_otime$1378 = -4
_otime$1394 = -8
_otime$1400 = -12
_rest_of_decl_compilation PROC NEAR
; Line 1316
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 1319
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 2
	test	al, 1
	jne	$L1374
	mov	eax, DWORD PTR _decl$[ebp]
	test	BYTE PTR [eax+16], 1
	je	$L1373
$L1374:
; Line 1320
$L1375:
; Line 1330
	call	_gettime
	mov	DWORD PTR _otime$1378[ebp], eax
	mov	eax, DWORD PTR _top_level$[ebp]
	push	eax
	mov	eax, DWORD PTR _asmspec$[ebp]
	push	eax
	mov	eax, DWORD PTR _decl$[ebp]
	push	eax
	call	_make_decl_rtl
	add	esp, 12					; 0000000cH
	cmp	DWORD PTR _at_end$[ebp], 0
	jne	$L1381
	cmp	DWORD PTR _top_level$[ebp], 0
	je	$L1381
	mov	eax, DWORD PTR _decl$[ebp]
	cmp	DWORD PTR [eax+64], 0
	je	$L1380
	mov	eax, DWORD PTR _decl$[ebp]
	mov	ecx, DWORD PTR _error_mark_node
	cmp	DWORD PTR [eax+64], ecx
	je	$L1380
$L1381:
	mov	eax, DWORD PTR _at_end$[ebp]
	push	eax
	mov	eax, DWORD PTR _write_symbols
	push	eax
	mov	eax, DWORD PTR _top_level$[ebp]
	push	eax
	mov	eax, DWORD PTR _decl$[ebp]
	push	eax
	call	_assemble_variable
	add	esp, 16					; 00000010H
$L1380:
	call	_gettime
	sub	eax, DWORD PTR _otime$1378[ebp]
	add	DWORD PTR _varconst_time, eax
$L1376:
$L1377:
; Line 1331
	jmp	$L1383
$L1373:
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 10					; 0000000aH
	test	al, 1
	je	$L1384
	cmp	DWORD PTR _asmspec$[ebp], 0
	je	$L1384
; Line 1333
	mov	eax, DWORD PTR _asmspec$[ebp]
	push	eax
	call	_decode_reg_name
	add	esp, 4
	or	eax, eax
	jl	$L1386
; Line 1335
	mov	eax, DWORD PTR _decl$[ebp]
	mov	DWORD PTR [eax+76], 0
; Line 1336
	mov	eax, DWORD PTR _top_level$[ebp]
	push	eax
	mov	eax, DWORD PTR _asmspec$[ebp]
	push	eax
	mov	eax, DWORD PTR _decl$[ebp]
	push	eax
	call	_make_decl_rtl
	add	esp, 12					; 0000000cH
; Line 1338
	jmp	$L1387
$L1386:
; Line 1339
	push	0
	mov	eax, DWORD PTR _asmspec$[ebp]
	push	eax
	push	OFFSET $SG1388
	call	_error
	add	esp, 12					; 0000000cH
$L1387:
; Line 1342
	jmp	$L1389
$L1384:
	cmp	DWORD PTR _write_symbols, 2
	jne	$L1390
	mov	eax, DWORD PTR _decl$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 42					; 0000002aH
	jne	$L1390
; Line 1343
$L1391:
	call	_gettime
	mov	DWORD PTR _otime$1394[ebp], eax
	push	0
	mov	eax, DWORD PTR _decl$[ebp]
	push	eax
	call	_dbxout_symbol
	add	esp, 8
	call	_gettime
	sub	eax, DWORD PTR _otime$1394[ebp]
	add	DWORD PTR _varconst_time, eax
$L1392:
$L1393:
; Line 1351
$L1390:
$L1389:
$L1383:
	cmp	DWORD PTR _top_level$[ebp], 0
	je	$L1395
; Line 1353
	cmp	DWORD PTR _write_symbols, 1
	jne	$L1396
; Line 1355
$L1397:
; Line 1361
	call	_gettime
	mov	DWORD PTR _otime$1400[ebp], eax
	call	_get_temporary_types
	push	eax
	call	_symout_types
	add	esp, 4
	call	_gettime
	sub	eax, DWORD PTR _otime$1400[ebp]
	add	DWORD PTR _symout_time, eax
$L1398:
$L1399:
; Line 1363
	jmp	$L1402
$L1396:
; Line 1365
	call	_get_temporary_types
$L1402:
; Line 1367
$L1395:
$L1372:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_rest_of_decl_compilation ENDP
_TEXT	ENDS
PUBLIC	_rest_of_compilation
EXTRN	_local_alloc:NEAR
EXTRN	_dump_flow_info:NEAR
EXTRN	_dump_local_alloc:NEAR
EXTRN	_warn_return_type:DWORD
EXTRN	_save_for_inline:NEAR
EXTRN	_loop_optimize:NEAR
EXTRN	_global_alloc:NEAR
EXTRN	_regclass_init:NEAR
EXTRN	_reload:NEAR
EXTRN	_print_rtl:NEAR
EXTRN	_dump_global_regs:NEAR
EXTRN	_get_insns:NEAR
EXTRN	_function_cannot_inline_p:NEAR
EXTRN	_unshare_all_rtl:NEAR
EXTRN	_regclass:NEAR
EXTRN	_stupid_life_analysis:NEAR
EXTRN	_jump_optimize:NEAR
EXTRN	_flow_analysis:NEAR
EXTRN	_uninitialized_vars_warning:NEAR
EXTRN	_assemble_function:NEAR
EXTRN	_final_start_function:NEAR
EXTRN	_final:NEAR
EXTRN	_final_end_function:NEAR
EXTRN	_reg_scan:NEAR
EXTRN	_max_reg_num:NEAR
EXTRN	_combine_instructions:NEAR
EXTRN	_symout_function:NEAR
EXTRN	_symout_function_end:NEAR
EXTRN	_cse_main:NEAR
EXTRN	_dump_combine_stats:NEAR
EXTRN	_reload_completed:DWORD
EXTRN	_dbxout_function:NEAR
EXTRN	_rtx_equal_function_value_matters:DWORD
EXTRN	_clear_const_double_mem:NEAR
_DATA	SEGMENT
	ORG $+3
$SG1427	DB	0aH, ';; Function %s', 0aH, 0aH, 00H
	ORG $+2
$SG1429	DB	';; (integrable)', 0aH, 0aH, 00H
	ORG $+2
$SG1450	DB	0aH, ';; Function %s', 0aH, 0aH, 00H
	ORG $+2
$SG1473	DB	0aH, ';; Function %s', 0aH, 0aH, 00H
	ORG $+2
$SG1479	DB	0aH, ';; Function %s', 0aH, 0aH, 00H
	ORG $+2
$SG1498	DB	0aH, ';; Function %s', 0aH, 0aH, 00H
	ORG $+2
$SG1530	DB	0aH, ';; Function %s', 0aH, 0aH, 00H
	ORG $+2
$SG1543	DB	0aH, ';; Function %s', 0aH, 0aH, 00H
	ORG $+2
$SG1549	DB	0aH, ';; Function %s', 0aH, 0aH, 00H
	ORG $+2
$SG1574	DB	0aH, ';; Function %s', 0aH, 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_otime$1536 = -92
_otime$1472 = -52
_tem$ = -8
_otime$1542 = -96
_otime$1478 = -56
_otime$1415 = -16
_specd$1416 = -24
_lose$1417 = -20
_otime$1548 = -100
_otime$1484 = -60
_otime$1553 = -104
_otime$1490 = -64
_otime$1426 = -28
_otime$1497 = -68
_otime$1562 = -108
_otime$1503 = -72
_otime$1568 = -112
_otime$1443 = -32
_otime$1573 = -116
_otime$1510 = -76
_otime$1449 = -36
_otime$1578 = -120
_otime$1518 = -80
_otime$1455 = -40
_otime$1587 = -124
_otime$1523 = -84
_otime$1461 = -44
_otime$1529 = -88
_otime$1595 = -128
_otime$1467 = -48
_decl$ = 8
_insns$ = -12
_start_time$ = -4
_rest_of_compilation PROC NEAR
; Line 1378
	push	ebp
	mov	ebp, esp
	sub	esp, 140				; 0000008cH
	push	ebx
	push	esi
	push	edi
; Line 1380
	call	_gettime
	mov	DWORD PTR _start_time$[ebp], eax
; Line 1386
	mov	eax, DWORD PTR _decl$[ebp]
	cmp	DWORD PTR [eax+84], 0
	jne	$L1409
; Line 1390
	cmp	DWORD PTR _flag_inline_functions, 0
	jne	$L1411
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 14					; 0000000eH
	test	al, 1
	je	$L1410
$L1411:
; Line 1392
$L1412:
; Line 1402
	call	_gettime
	mov	DWORD PTR _otime$1415[ebp], eax
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 14					; 0000000eH
	and	eax, 1
	mov	DWORD PTR _specd$1416[ebp], eax
	mov	eax, DWORD PTR _decl$[ebp]
	push	eax
	call	_function_cannot_inline_p
	add	esp, 4
	mov	DWORD PTR _lose$1417[ebp], eax
	cmp	DWORD PTR _lose$1417[ebp], 0
	je	$L1418
	cmp	DWORD PTR _specd$1416[ebp], 0
	je	$L1418
	push	0
	mov	eax, DWORD PTR _lose$1417[ebp]
	push	eax
	mov	eax, DWORD PTR _decl$[ebp]
	push	eax
	call	_warning_with_decl
	add	esp, 12					; 0000000cH
$L1418:
	cmp	DWORD PTR _lose$1417[ebp], 0
	jne	$L1419
	mov	eax, DWORD PTR _decl$[ebp]
	push	eax
	call	_save_for_inline
	add	esp, 4
	jmp	$L1421
$L1419:
	mov	eax, DWORD PTR _decl$[ebp]
	and	DWORD PTR [eax+16], -16385		; ffffbfffH
$L1421:
	call	_gettime
	sub	eax, DWORD PTR _otime$1415[ebp]
	add	DWORD PTR _integration_time, eax
$L1413:
$L1414:
; Line 1405
$L1410:
	call	_get_insns
	mov	DWORD PTR _insns$[ebp], eax
; Line 1409
	cmp	DWORD PTR _rtl_dump, 0
	je	$L1422
; Line 1410
$L1423:
; Line 1418
	call	_gettime
	mov	DWORD PTR _otime$1426[ebp], eax
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+40]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	OFFSET $SG1427
	mov	eax, DWORD PTR _rtl_dump_file
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
	mov	eax, DWORD PTR _decl$[ebp]
	cmp	DWORD PTR [eax+84], 0
	je	$L1428
	push	OFFSET $SG1429
	mov	eax, DWORD PTR _rtl_dump_file
	push	eax
	call	_fprintf
	add	esp, 8
$L1428:
	mov	eax, DWORD PTR _insns$[ebp]
	push	eax
	mov	eax, DWORD PTR _rtl_dump_file
	push	eax
	call	_print_rtl
	add	esp, 8
	mov	eax, DWORD PTR _rtl_dump_file
	push	eax
	call	_fflush
	add	esp, 4
	call	_gettime
	sub	eax, DWORD PTR _otime$1426[ebp]
	add	DWORD PTR _dump_time, eax
$L1424:
$L1425:
; Line 1425
$L1422:
; Line 1428
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 1
	test	al, 1
	jne	$L1433
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 9
	test	al, 1
	jne	$L1433
	cmp	DWORD PTR _flag_keep_inline_functions, 0
	je	$L1432
$L1433:
	mov	eax, DWORD PTR _decl$[ebp]
	test	BYTE PTR [eax+16], 1
	je	$L1431
$L1432:
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 14					; 0000000eH
	test	al, 1
	je	$L1431
; Line 1429
	jmp	$exit_rest_of_compilation$1434
; Line 1430
$L1431:
; Line 1432
$L1409:
	cmp	DWORD PTR _rtl_dump_and_exit, 0
	jne	$L1436
	cmp	DWORD PTR _flag_syntax_only, 0
	je	$L1435
$L1436:
; Line 1434
	call	_get_temporary_types
; Line 1435
	jmp	$exit_rest_of_compilation$1434
; Line 1438
$L1435:
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	or	eax, 8192				; 00002000H
	mov	ecx, DWORD PTR _decl$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 1440
	call	_get_insns
	mov	DWORD PTR _insns$[ebp], eax
; Line 1444
	mov	eax, DWORD PTR _insns$[ebp]
	push	eax
	call	_unshare_all_rtl
	add	esp, 4
; Line 1457
	cmp	DWORD PTR _optimize, 0
	jne	$L1439
	cmp	DWORD PTR _extra_warnings, 0
	jne	$L1439
	cmp	DWORD PTR _warn_return_type, 0
	jne	$L1439
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 11					; 0000000bH
	test	al, 1
	je	$L1438
$L1439:
; Line 1458
$L1440:
	call	_gettime
	mov	DWORD PTR _otime$1443[ebp], eax
	push	0
	push	0
	mov	eax, DWORD PTR _insns$[ebp]
	push	eax
	call	_jump_optimize
	add	esp, 12					; 0000000cH
	call	_gettime
	sub	eax, DWORD PTR _otime$1443[ebp]
	add	DWORD PTR _jump_time, eax
$L1441:
$L1442:
; Line 1462
$L1438:
	cmp	DWORD PTR _jump_opt_dump, 0
	je	$L1445
; Line 1463
$L1446:
; Line 1469
	call	_gettime
	mov	DWORD PTR _otime$1449[ebp], eax
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+40]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	OFFSET $SG1450
	mov	eax, DWORD PTR _jump_opt_dump_file
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
	mov	eax, DWORD PTR _insns$[ebp]
	push	eax
	mov	eax, DWORD PTR _jump_opt_dump_file
	push	eax
	call	_print_rtl
	add	esp, 8
	mov	eax, DWORD PTR _jump_opt_dump_file
	push	eax
	call	_fflush
	add	esp, 4
	call	_gettime
	sub	eax, DWORD PTR _otime$1449[ebp]
	add	DWORD PTR _dump_time, eax
$L1447:
$L1448:
; Line 1476
$L1445:
	cmp	DWORD PTR _optimize, 0
	je	$L1451
; Line 1478
$L1452:
	call	_gettime
	mov	DWORD PTR _otime$1455[ebp], eax
	push	0
	call	_max_reg_num
	push	eax
	mov	eax, DWORD PTR _insns$[ebp]
	push	eax
	call	_reg_scan
	add	esp, 12					; 0000000cH
	call	_gettime
	sub	eax, DWORD PTR _otime$1455[ebp]
	add	DWORD PTR _cse_time, eax
$L1453:
$L1454:
; Line 1480
$L1458:
	call	_gettime
	mov	DWORD PTR _otime$1461[ebp], eax
	call	_max_reg_num
	push	eax
	mov	eax, DWORD PTR _insns$[ebp]
	push	eax
	call	_cse_main
	add	esp, 8
	mov	DWORD PTR _tem$[ebp], eax
	call	_gettime
	sub	eax, DWORD PTR _otime$1461[ebp]
	add	DWORD PTR _cse_time, eax
$L1459:
$L1460:
; Line 1482
	cmp	DWORD PTR _tem$[ebp], 0
	je	$L1463
; Line 1483
$L1464:
	call	_gettime
	mov	DWORD PTR _otime$1467[ebp], eax
	push	0
	push	0
	mov	eax, DWORD PTR _insns$[ebp]
	push	eax
	call	_jump_optimize
	add	esp, 12					; 0000000cH
	call	_gettime
	sub	eax, DWORD PTR _otime$1467[ebp]
	add	DWORD PTR _jump_time, eax
$L1465:
$L1466:
; Line 1484
$L1463:
; Line 1488
$L1451:
	cmp	DWORD PTR _cse_dump, 0
	je	$L1468
; Line 1489
$L1469:
; Line 1495
	call	_gettime
	mov	DWORD PTR _otime$1472[ebp], eax
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+40]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	OFFSET $SG1473
	mov	eax, DWORD PTR _cse_dump_file
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
	mov	eax, DWORD PTR _insns$[ebp]
	push	eax
	mov	eax, DWORD PTR _cse_dump_file
	push	eax
	call	_print_rtl
	add	esp, 8
	mov	eax, DWORD PTR _cse_dump_file
	push	eax
	call	_fflush
	add	esp, 4
	call	_gettime
	sub	eax, DWORD PTR _otime$1472[ebp]
	add	DWORD PTR _dump_time, eax
$L1470:
$L1471:
; Line 1497
$L1468:
	cmp	DWORD PTR _loop_dump, 0
	je	$L1474
; Line 1498
$L1475:
; Line 1502
	call	_gettime
	mov	DWORD PTR _otime$1478[ebp], eax
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+40]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	OFFSET $SG1479
	mov	eax, DWORD PTR _loop_dump_file
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
	call	_gettime
	sub	eax, DWORD PTR _otime$1478[ebp]
	add	DWORD PTR _dump_time, eax
$L1476:
$L1477:
; Line 1506
$L1474:
	cmp	DWORD PTR _optimize, 0
	je	$L1480
; Line 1508
$L1481:
; Line 1512
	call	_gettime
	mov	DWORD PTR _otime$1484[ebp], eax
	push	1
	call	_max_reg_num
	push	eax
	mov	eax, DWORD PTR _insns$[ebp]
	push	eax
	call	_reg_scan
	add	esp, 12					; 0000000cH
	cmp	DWORD PTR _loop_dump, 0
	je	$L1788
	mov	eax, DWORD PTR _loop_dump_file
	mov	DWORD PTR -132+[ebp], eax
	jmp	$L1789
$L1788:
	mov	DWORD PTR -132+[ebp], 0
$L1789:
	mov	eax, DWORD PTR -132+[ebp]
	push	eax
	mov	eax, DWORD PTR _insns$[ebp]
	push	eax
	call	_loop_optimize
	add	esp, 8
	call	_gettime
	sub	eax, DWORD PTR _otime$1484[ebp]
	add	DWORD PTR _loop_time, eax
$L1482:
$L1483:
; Line 1517
$L1480:
	cmp	DWORD PTR _loop_dump, 0
	je	$L1486
; Line 1518
$L1487:
; Line 1522
	call	_gettime
	mov	DWORD PTR _otime$1490[ebp], eax
	mov	eax, DWORD PTR _insns$[ebp]
	push	eax
	mov	eax, DWORD PTR _loop_dump_file
	push	eax
	call	_print_rtl
	add	esp, 8
	mov	eax, DWORD PTR _loop_dump_file
	push	eax
	call	_fflush
	add	esp, 4
	call	_gettime
	sub	eax, DWORD PTR _otime$1490[ebp]
	add	DWORD PTR _dump_time, eax
$L1488:
$L1489:
; Line 1528
$L1486:
	cmp	DWORD PTR _optimize, 0
	je	$L1491
; Line 1529
	mov	DWORD PTR _obey_regdecls, 0
; Line 1531
$L1491:
	call	_regclass_init
; Line 1536
	cmp	DWORD PTR _flow_dump, 0
	je	$L1493
; Line 1537
$L1494:
; Line 1541
	call	_gettime
	mov	DWORD PTR _otime$1497[ebp], eax
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+40]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	OFFSET $SG1498
	mov	eax, DWORD PTR _flow_dump_file
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
	call	_gettime
	sub	eax, DWORD PTR _otime$1497[ebp]
	add	DWORD PTR _dump_time, eax
$L1495:
$L1496:
; Line 1543
$L1493:
	cmp	DWORD PTR _obey_regdecls, 0
	je	$L1499
; Line 1545
$L1500:
; Line 1550
	call	_gettime
	mov	DWORD PTR _otime$1503[ebp], eax
	call	_max_reg_num
	push	eax
	mov	eax, DWORD PTR _insns$[ebp]
	push	eax
	call	_regclass
	add	esp, 8
	mov	eax, DWORD PTR _flow_dump_file
	push	eax
	call	_max_reg_num
	push	eax
	mov	eax, DWORD PTR _insns$[ebp]
	push	eax
	call	_stupid_life_analysis
	add	esp, 12					; 0000000cH
	call	_gettime
	sub	eax, DWORD PTR _otime$1503[ebp]
	add	DWORD PTR _flow_time, eax
$L1501:
$L1502:
; Line 1552
	jmp	$L1506
$L1499:
; Line 1557
$L1507:
; Line 1558
	call	_gettime
	mov	DWORD PTR _otime$1510[ebp], eax
	mov	eax, DWORD PTR _flow_dump_file
	push	eax
	call	_max_reg_num
	push	eax
	mov	eax, DWORD PTR _insns$[ebp]
	push	eax
	call	_flow_analysis
	add	esp, 12					; 0000000cH
	call	_gettime
	sub	eax, DWORD PTR _otime$1510[ebp]
	add	DWORD PTR _flow_time, eax
$L1508:
$L1509:
; Line 1559
	cmp	DWORD PTR _extra_warnings, 0
	je	$L1512
; Line 1560
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+64]
	push	eax
	call	_uninitialized_vars_warning
	add	esp, 4
; Line 1561
$L1512:
$L1506:
; Line 1565
	cmp	DWORD PTR _flow_dump, 0
	je	$L1514
; Line 1566
$L1515:
; Line 1570
	call	_gettime
	mov	DWORD PTR _otime$1518[ebp], eax
	mov	eax, DWORD PTR _insns$[ebp]
	push	eax
	mov	eax, DWORD PTR _flow_dump_file
	push	eax
	call	_print_rtl
	add	esp, 8
	mov	eax, DWORD PTR _flow_dump_file
	push	eax
	call	_fflush
	add	esp, 4
	call	_gettime
	sub	eax, DWORD PTR _otime$1518[ebp]
	add	DWORD PTR _dump_time, eax
$L1516:
$L1517:
; Line 1574
$L1514:
	cmp	DWORD PTR _optimize, 0
	je	$L1519
; Line 1575
$L1520:
	call	_gettime
	mov	DWORD PTR _otime$1523[ebp], eax
	call	_max_reg_num
	push	eax
	mov	eax, DWORD PTR _insns$[ebp]
	push	eax
	call	_combine_instructions
	add	esp, 8
	call	_gettime
	sub	eax, DWORD PTR _otime$1523[ebp]
	add	DWORD PTR _combine_time, eax
$L1521:
$L1522:
; Line 1579
$L1519:
	cmp	DWORD PTR _combine_dump, 0
	je	$L1525
; Line 1580
$L1526:
; Line 1587
	call	_gettime
	mov	DWORD PTR _otime$1529[ebp], eax
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+40]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	OFFSET $SG1530
	mov	eax, DWORD PTR _combine_dump_file
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
	mov	eax, DWORD PTR _combine_dump_file
	push	eax
	call	_dump_combine_stats
	add	esp, 4
	mov	eax, DWORD PTR _insns$[ebp]
	push	eax
	mov	eax, DWORD PTR _combine_dump_file
	push	eax
	call	_print_rtl
	add	esp, 8
	mov	eax, DWORD PTR _combine_dump_file
	push	eax
	call	_fflush
	add	esp, 4
	call	_gettime
	sub	eax, DWORD PTR _otime$1529[ebp]
	add	DWORD PTR _dump_time, eax
$L1527:
$L1528:
; Line 1592
$L1525:
	cmp	DWORD PTR _obey_regdecls, 0
	jne	$L1532
; Line 1593
$L1533:
; Line 1597
	call	_gettime
	mov	DWORD PTR _otime$1536[ebp], eax
	call	_max_reg_num
	push	eax
	mov	eax, DWORD PTR _insns$[ebp]
	push	eax
	call	_regclass
	add	esp, 8
	call	_local_alloc
	call	_gettime
	sub	eax, DWORD PTR _otime$1536[ebp]
	add	DWORD PTR _local_alloc_time, eax
$L1534:
$L1535:
; Line 1601
$L1532:
	cmp	DWORD PTR _local_reg_dump, 0
	je	$L1538
; Line 1602
$L1539:
; Line 1610
	call	_gettime
	mov	DWORD PTR _otime$1542[ebp], eax
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+40]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	OFFSET $SG1543
	mov	eax, DWORD PTR _local_reg_dump_file
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
	mov	eax, DWORD PTR _local_reg_dump_file
	push	eax
	call	_dump_flow_info
	add	esp, 4
	mov	eax, DWORD PTR _local_reg_dump_file
	push	eax
	call	_dump_local_alloc
	add	esp, 4
	mov	eax, DWORD PTR _insns$[ebp]
	push	eax
	mov	eax, DWORD PTR _local_reg_dump_file
	push	eax
	call	_print_rtl
	add	esp, 8
	mov	eax, DWORD PTR _local_reg_dump_file
	push	eax
	call	_fflush
	add	esp, 4
	call	_gettime
	sub	eax, DWORD PTR _otime$1542[ebp]
	add	DWORD PTR _dump_time, eax
$L1540:
$L1541:
; Line 1612
$L1538:
	cmp	DWORD PTR _global_reg_dump, 0
	je	$L1544
; Line 1613
$L1545:
; Line 1615
	call	_gettime
	mov	DWORD PTR _otime$1548[ebp], eax
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+40]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	OFFSET $SG1549
	mov	eax, DWORD PTR _global_reg_dump_file
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
	call	_gettime
	sub	eax, DWORD PTR _otime$1548[ebp]
	add	DWORD PTR _dump_time, eax
$L1546:
$L1547:
; Line 1621
$L1544:
$L1550:
; Line 1628
	call	_gettime
	mov	DWORD PTR _otime$1553[ebp], eax
	cmp	DWORD PTR _obey_regdecls, 0
	jne	$L1554
	cmp	DWORD PTR _global_reg_dump, 0
	je	$L1790
	mov	eax, DWORD PTR _global_reg_dump_file
	mov	DWORD PTR -136+[ebp], eax
	jmp	$L1791
$L1790:
	mov	DWORD PTR -136+[ebp], 0
$L1791:
	mov	eax, DWORD PTR -136+[ebp]
	push	eax
	call	_global_alloc
	add	esp, 4
	jmp	$L1556
$L1554:
	cmp	DWORD PTR _global_reg_dump, 0
	je	$L1792
	mov	eax, DWORD PTR _global_reg_dump_file
	mov	DWORD PTR -140+[ebp], eax
	jmp	$L1793
$L1792:
	mov	DWORD PTR -140+[ebp], 0
$L1793:
	mov	eax, DWORD PTR -140+[ebp]
	push	eax
	push	0
	mov	eax, DWORD PTR _insns$[ebp]
	push	eax
	call	_reload
	add	esp, 12					; 0000000cH
$L1556:
	call	_gettime
	sub	eax, DWORD PTR _otime$1553[ebp]
	add	DWORD PTR _global_alloc_time, eax
$L1551:
$L1552:
; Line 1630
	cmp	DWORD PTR _global_reg_dump, 0
	je	$L1558
; Line 1631
$L1559:
; Line 1636
	call	_gettime
	mov	DWORD PTR _otime$1562[ebp], eax
	mov	eax, DWORD PTR _global_reg_dump_file
	push	eax
	call	_dump_global_regs
	add	esp, 4
	mov	eax, DWORD PTR _insns$[ebp]
	push	eax
	mov	eax, DWORD PTR _global_reg_dump_file
	push	eax
	call	_print_rtl
	add	esp, 8
	mov	eax, DWORD PTR _global_reg_dump_file
	push	eax
	call	_fflush
	add	esp, 4
	call	_gettime
	sub	eax, DWORD PTR _otime$1562[ebp]
	add	DWORD PTR _dump_time, eax
$L1560:
$L1561:
; Line 1638
$L1558:
	mov	DWORD PTR _rtx_equal_function_value_matters, 1
; Line 1639
	mov	DWORD PTR _reload_completed, 1
; Line 1646
	cmp	DWORD PTR _optimize, 0
	je	$L1564
; Line 1648
$L1565:
	call	_gettime
	mov	DWORD PTR _otime$1568[ebp], eax
	push	1
	push	1
	mov	eax, DWORD PTR _insns$[ebp]
	push	eax
	call	_jump_optimize
	add	esp, 12					; 0000000cH
	call	_gettime
	sub	eax, DWORD PTR _otime$1568[ebp]
	add	DWORD PTR _jump_time, eax
$L1566:
$L1567:
; Line 1653
$L1564:
	cmp	DWORD PTR _jump2_opt_dump, 0
	je	$L1569
; Line 1654
$L1570:
; Line 1660
	call	_gettime
	mov	DWORD PTR _otime$1573[ebp], eax
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+40]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	OFFSET $SG1574
	mov	eax, DWORD PTR _jump2_opt_dump_file
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
	mov	eax, DWORD PTR _insns$[ebp]
	push	eax
	mov	eax, DWORD PTR _jump2_opt_dump_file
	push	eax
	call	_print_rtl
	add	esp, 8
	mov	eax, DWORD PTR _jump2_opt_dump_file
	push	eax
	call	_fflush
	add	esp, 4
	call	_gettime
	sub	eax, DWORD PTR _otime$1573[ebp]
	add	DWORD PTR _dump_time, eax
$L1571:
$L1572:
; Line 1684
$L1569:
$L1575:
; Line 1694
	call	_gettime
	mov	DWORD PTR _otime$1578[ebp], eax
	mov	eax, DWORD PTR _decl$[ebp]
	push	eax
	call	_assemble_function
	add	esp, 4
	mov	eax, DWORD PTR _optimize
	push	eax
	mov	eax, DWORD PTR _write_symbols
	push	eax
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	mov	eax, DWORD PTR _insns$[ebp]
	push	eax
	call	_final_start_function
	add	esp, 16					; 00000010H
	push	0
	mov	eax, DWORD PTR _optimize
	push	eax
	mov	eax, DWORD PTR _write_symbols
	push	eax
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	mov	eax, DWORD PTR _insns$[ebp]
	push	eax
	call	_final
	add	esp, 20					; 00000014H
	mov	eax, DWORD PTR _optimize
	push	eax
	mov	eax, DWORD PTR _write_symbols
	push	eax
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	mov	eax, DWORD PTR _insns$[ebp]
	push	eax
	call	_final_end_function
	add	esp, 16					; 00000010H
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_fflush
	add	esp, 4
	call	_gettime
	sub	eax, DWORD PTR _otime$1578[ebp]
	add	DWORD PTR _final_time, eax
$L1576:
$L1577:
; Line 1698
	cmp	DWORD PTR _write_symbols, 1
	jne	$L1583
; Line 1700
$L1584:
; Line 1709
	call	_gettime
	mov	DWORD PTR _otime$1587[ebp], eax
	call	_get_permanent_types
	push	eax
	call	_symout_types
	add	esp, 4
	call	_get_temporary_types
	push	eax
	call	_symout_types
	add	esp, 4
	push	0
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+56]
	push	eax
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+64]
	push	eax
	call	_symout_function
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _decl$[ebp]
	mov	DWORD PTR [ecx+88], eax
	call	_symout_function_end
	call	_gettime
	sub	eax, DWORD PTR _otime$1587[ebp]
	add	DWORD PTR _symout_time, eax
$L1585:
$L1586:
; Line 1711
	jmp	$L1590
$L1583:
; Line 1712
	call	_get_temporary_types
$L1590:
; Line 1717
	cmp	DWORD PTR _write_symbols, 2
	jne	$L1591
; Line 1718
$L1592:
	call	_gettime
	mov	DWORD PTR _otime$1595[ebp], eax
	mov	eax, DWORD PTR _decl$[ebp]
	push	eax
	call	_dbxout_function
	add	esp, 4
	call	_gettime
	sub	eax, DWORD PTR _otime$1595[ebp]
	add	DWORD PTR _symout_time, eax
$L1593:
$L1594:
; Line 1721
$L1591:
$exit_rest_of_compilation$1434:
; Line 1723
	mov	DWORD PTR _rtx_equal_function_value_matters, 0
; Line 1724
	mov	DWORD PTR _reload_completed, 0
; Line 1729
	call	_clear_const_double_mem
; Line 1734
	sub	ebx, ebx
	call	_gettime
	sub	eax, DWORD PTR _start_time$[ebp]
	sub	ebx, eax
	neg	ebx
	sub	DWORD PTR _parse_time, ebx
; Line 1735
$L1405:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_rest_of_compilation ENDP
_TEXT	ENDS
PUBLIC	_main
PUBLIC	_set_target_switch
PUBLIC	_print_target_switch_defaults
EXTRN	_lang_decode_option:NEAR
EXTRN	_init_reg_sets:NEAR
EXTRN	_init_reg_sets_1:NEAR
EXTRN	_atoi:NEAR
EXTRN	_strncmp:NEAR
EXTRN	_yydebug:DWORD
EXTRN	_fix_register:NEAR
EXTRN	_version_string:DWORD
EXTRN	_language_string:DWORD
_DATA	SEGMENT
	ORG $+2
$SG1610	DB	00H
	ORG $+3
$SG1620	DB	'dumpbase', 00H
	ORG $+3
$SG1657	DB	'fixed-', 00H
	ORG $+1
$SG1661	DB	'call-used-', 00H
	ORG $+1
$SG1664	DB	'call-saved-', 00H
$SG1668	DB	'Invalid option `%s''', 00H
$SG1671	DB	'noreg', 00H
	ORG $+2
$SG1674	DB	'opt', 00H
$SG1677	DB	'O', 00H
	ORG $+2
$SG1680	DB	'pedantic', 00H
	ORG $+3
$SG1685	DB	'quiet', 00H
	ORG $+2
$SG1688	DB	'version', 00H
$SG1691	DB	'%s version %s', 00H
	ORG $+2
$SG1692	DB	' (80386, BSD syntax)', 00H
	ORG $+3
$SG1693	DB	' compiled by CC.', 0aH, 00H
	ORG $+2
$SG1696	DB	'w', 00H
	ORG $+2
$SG1699	DB	'W', 00H
	ORG $+2
$SG1702	DB	'Wunused', 00H
$SG1705	DB	'Wshadow', 00H
$SG1708	DB	'Wswitch', 00H
$SG1711	DB	'Wid-clash-', 00H
	ORG $+1
$SG1718	DB	'Invalid option `%s''', 00H
$SG1722	DB	'p', 00H
	ORG $+2
$SG1725	DB	'a', 00H
	ORG $+2
$SG1726	DB	'`-a'' option (basic block profile) not supported', 00H
$SG1729	DB	'gg', 00H
	ORG $+1
$SG1732	DB	'g0', 00H
	ORG $+1
$SG1735	DB	'G0', 00H
	ORG $+1
$SG1738	DB	'g', 00H
	ORG $+2
$SG1741	DB	'G', 00H
	ORG $+2
$SG1744	DB	'symout', 00H
	ORG $+1
$SG1748	DB	'o', 00H
	ORG $+2
$SG1750	DB	'Invalid option `%s''', 00H
_DATA	ENDS
_TEXT	SEGMENT
_i$ = -8
_filename$ = -12
_print_mem_flag$ = -16
_p$ = -4
_str$1615 = -20
_p$1623 = -24
_j$1645 = -36
_p$1646 = -28
_found$1647 = -32
_endp$1712 = -40
_argc$ = 8
_argv$ = 12
_main	PROC NEAR
; Line 1746
	push	ebp
	mov	ebp, esp
	sub	esp, 48					; 00000030H
	push	ebx
	push	esi
	push	edi
; Line 1748
	mov	DWORD PTR _filename$[ebp], 0
; Line 1749
	mov	DWORD PTR _print_mem_flag$[ebp], 0
; Line 1753
	mov	eax, DWORD PTR _argc$[ebp]
	mov	DWORD PTR _save_argc, eax
; Line 1754
	mov	eax, DWORD PTR _argv$[ebp]
	mov	DWORD PTR _save_argv, eax
; Line 1756
	mov	eax, DWORD PTR _argv$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_strlen
	add	esp, 4
	mov	ecx, DWORD PTR _argv$[ebp]
	mov	ecx, DWORD PTR [ecx]
	add	ecx, eax
	mov	DWORD PTR _p$[ebp], ecx
; Line 1757
$L1608:
	mov	eax, DWORD PTR _argv$[ebp]
	mov	ecx, DWORD PTR _p$[ebp]
	cmp	DWORD PTR [eax], ecx
	je	$L1609
	mov	eax, DWORD PTR _p$[ebp]
	movsx	eax, BYTE PTR [eax-1]
	cmp	eax, 47					; 0000002fH
	je	$L1609
	dec	DWORD PTR _p$[ebp]
	jmp	$L1608
$L1609:
; Line 1758
	mov	eax, DWORD PTR _p$[ebp]
	mov	DWORD PTR _progname, eax
; Line 1777
	mov	DWORD PTR _flag_signed_char, 1
; Line 1784
	mov	DWORD PTR _obey_regdecls, 1
; Line 1787
	call	_init_reg_sets
; Line 1789
	mov	DWORD PTR _target_flags, 0
; Line 1790
	push	OFFSET $SG1610
	call	_set_target_switch
	add	esp, 4
; Line 1792
	mov	DWORD PTR _i$[ebp], 1
	jmp	$L1611
$L1612:
	inc	DWORD PTR _i$[ebp]
$L1611:
	mov	eax, DWORD PTR _argc$[ebp]
	cmp	DWORD PTR _i$[ebp], eax
	jge	$L1613
; Line 1793
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _argv$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 45					; 0000002dH
	jne	$L1614
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _argv$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	movsx	eax, BYTE PTR [eax+1]
	or	eax, eax
	je	$L1614
; Line 1795
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _argv$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	inc	eax
	mov	DWORD PTR _str$1615[ebp], eax
; Line 1796
	mov	eax, DWORD PTR _str$1615[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 89					; 00000059H
	jne	$L1616
; Line 1797
	inc	DWORD PTR _str$1615[ebp]
; Line 1799
$L1616:
	mov	eax, DWORD PTR _str$1615[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 109				; 0000006dH
	jne	$L1617
; Line 1800
	mov	eax, DWORD PTR _str$1615[ebp]
	inc	eax
	push	eax
	call	_set_target_switch
	add	esp, 4
; Line 1801
	jmp	$L1618
$L1617:
	push	OFFSET $SG1620
	mov	eax, DWORD PTR _str$1615[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L1619
; Line 1803
	inc	DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _argv$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _dump_base_name, eax
; Line 1805
	jmp	$L1621
$L1619:
	mov	eax, DWORD PTR _str$1615[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 100				; 00000064H
	jne	$L1622
; Line 1807
	mov	eax, DWORD PTR _str$1615[ebp]
	inc	eax
	mov	DWORD PTR _p$1623[ebp], eax
; Line 1808
$L1625:
	mov	eax, DWORD PTR _p$1623[ebp]
	movsx	eax, BYTE PTR [eax]
	or	eax, eax
	je	$L1626
; Line 1809
	mov	eax, DWORD PTR _p$1623[ebp]
	mov	DWORD PTR -44+[ebp], eax
	inc	DWORD PTR _p$1623[ebp]
	mov	eax, DWORD PTR -44+[ebp]
	movsx	eax, BYTE PTR [eax]
	mov	DWORD PTR -48+[ebp], eax
	jmp	$L1627
; Line 1811
$L1631:
; Line 1812
	mov	DWORD PTR _combine_dump, 1
; Line 1813
	jmp	$L1628
; Line 1814
$L1632:
; Line 1815
	mov	DWORD PTR _dbr_sched_dump, 1
; Line 1816
	jmp	$L1628
; Line 1817
$L1633:
; Line 1818
	mov	DWORD PTR _flow_dump, 1
; Line 1819
	jmp	$L1628
; Line 1820
$L1634:
; Line 1821
	mov	DWORD PTR _global_reg_dump, 1
; Line 1822
	jmp	$L1628
; Line 1823
$L1635:
; Line 1824
	mov	DWORD PTR _jump_opt_dump, 1
; Line 1825
	jmp	$L1628
; Line 1826
$L1636:
; Line 1827
	mov	DWORD PTR _jump2_opt_dump, 1
; Line 1828
	jmp	$L1628
; Line 1829
$L1637:
; Line 1830
	mov	DWORD PTR _local_reg_dump, 1
; Line 1831
	jmp	$L1628
; Line 1832
$L1638:
; Line 1833
	mov	DWORD PTR _loop_dump, 1
; Line 1834
	jmp	$L1628
; Line 1835
$L1639:
; Line 1836
	mov	DWORD PTR _print_mem_flag$[ebp], 1
; Line 1837
	jmp	$L1628
; Line 1838
$L1640:
; Line 1839
	mov	DWORD PTR _rtl_dump, 1
; Line 1840
	jmp	$L1628
; Line 1841
$L1641:
; Line 1842
	mov	DWORD PTR _cse_dump, 1
; Line 1843
	jmp	$L1628
; Line 1844
$L1642:
; Line 1845
	mov	DWORD PTR _yydebug, 1
; Line 1846
	jmp	$L1628
; Line 1847
	jmp	$L1628
$L1627:
	sub	DWORD PTR -48+[ebp], 74			; 0000004aH
	cmp	DWORD PTR -48+[ebp], 47			; 0000002fH
	ja	$L1628
	shl	DWORD PTR -48+[ebp], 2
	mov	eax, DWORD PTR -48+[ebp]
	jmp	DWORD PTR $L1794[eax]
$L1794:
	DD	OFFSET $L1636
	DD	OFFSET $L1628
	DD	OFFSET $L1638
	DD	OFFSET $L1628
	DD	OFFSET $L1628
	DD	OFFSET $L1628
	DD	OFFSET $L1628
	DD	OFFSET $L1628
	DD	OFFSET $L1628
	DD	OFFSET $L1628
	DD	OFFSET $L1628
	DD	OFFSET $L1628
	DD	OFFSET $L1628
	DD	OFFSET $L1628
	DD	OFFSET $L1628
	DD	OFFSET $L1628
	DD	OFFSET $L1628
	DD	OFFSET $L1628
	DD	OFFSET $L1628
	DD	OFFSET $L1628
	DD	OFFSET $L1628
	DD	OFFSET $L1628
	DD	OFFSET $L1628
	DD	OFFSET $L1628
	DD	OFFSET $L1628
	DD	OFFSET $L1631
	DD	OFFSET $L1632
	DD	OFFSET $L1628
	DD	OFFSET $L1633
	DD	OFFSET $L1634
	DD	OFFSET $L1628
	DD	OFFSET $L1628
	DD	OFFSET $L1635
	DD	OFFSET $L1628
	DD	OFFSET $L1637
	DD	OFFSET $L1639
	DD	OFFSET $L1628
	DD	OFFSET $L1628
	DD	OFFSET $L1628
	DD	OFFSET $L1628
	DD	OFFSET $L1640
	DD	OFFSET $L1641
	DD	OFFSET $L1628
	DD	OFFSET $L1628
	DD	OFFSET $L1628
	DD	OFFSET $L1628
	DD	OFFSET $L1628
	DD	OFFSET $L1642
$L1628:
	jmp	$L1625
$L1626:
; Line 1849
	jmp	$L1643
$L1622:
	mov	eax, DWORD PTR _str$1615[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 102				; 00000066H
	jne	$L1644
; Line 1852
	mov	eax, DWORD PTR _str$1615[ebp]
	inc	eax
	mov	DWORD PTR _p$1646[ebp], eax
; Line 1853
	mov	DWORD PTR _found$1647[ebp], 0
; Line 1861
	mov	DWORD PTR _j$1645[ebp], 0
	jmp	$L1648
$L1649:
	inc	DWORD PTR _j$1645[ebp]
$L1648:
	cmp	DWORD PTR _found$1647[ebp], 0
	jne	$L1650
	cmp	DWORD PTR _j$1645[ebp], 18		; 00000012H
	jae	$L1650
; Line 1863
	mov	eax, DWORD PTR _j$1645[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	mov	eax, DWORD PTR _f_options[eax*4]
	push	eax
	mov	eax, DWORD PTR _p$1646[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L1651
; Line 1865
	mov	eax, DWORD PTR _j$1645[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	mov	eax, DWORD PTR _f_options[eax*4+8]
	mov	ecx, DWORD PTR _j$1645[ebp]
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	ecx, DWORD PTR _f_options[ecx*4+4]
	mov	DWORD PTR [ecx], eax
; Line 1868
	mov	DWORD PTR _found$1647[ebp], 1
; Line 1870
$L1651:
; Line 1871
	mov	eax, DWORD PTR _p$1646[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 110				; 0000006eH
	jne	$L1652
	mov	eax, DWORD PTR _p$1646[ebp]
	movsx	eax, BYTE PTR [eax+1]
	cmp	eax, 111				; 0000006fH
	jne	$L1652
	mov	eax, DWORD PTR _p$1646[ebp]
	movsx	eax, BYTE PTR [eax+2]
	cmp	eax, 45					; 0000002dH
	jne	$L1652
	mov	eax, DWORD PTR _j$1645[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	mov	eax, DWORD PTR _f_options[eax*4]
	push	eax
	mov	eax, DWORD PTR _p$1646[ebp]
	add	eax, 3
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L1652
; Line 1873
	mov	eax, DWORD PTR _j$1645[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	cmp	DWORD PTR _f_options[eax*4+8], 1
	sbb	eax, eax
	neg	eax
	mov	ecx, DWORD PTR _j$1645[ebp]
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	ecx, DWORD PTR _f_options[ecx*4+4]
	mov	DWORD PTR [ecx], eax
; Line 1874
	mov	DWORD PTR _found$1647[ebp], 1
; Line 1876
$L1652:
	jmp	$L1649
$L1650:
; Line 1878
	cmp	DWORD PTR _found$1647[ebp], 0
	je	$L1653
; Line 1880
	jmp	$L1654
$L1653:
	push	6
	push	OFFSET $SG1657
	mov	eax, DWORD PTR _p$1646[ebp]
	push	eax
	call	_strncmp
	add	esp, 12					; 0000000cH
	or	eax, eax
	jne	$L1656
; Line 1881
	push	1
	push	1
	mov	eax, DWORD PTR _p$1646[ebp]
	add	eax, 6
	push	eax
	call	_fix_register
	add	esp, 12					; 0000000cH
; Line 1882
	jmp	$L1659
$L1656:
	push	10					; 0000000aH
	push	OFFSET $SG1661
	mov	eax, DWORD PTR _p$1646[ebp]
	push	eax
	call	_strncmp
	add	esp, 12					; 0000000cH
	or	eax, eax
	jne	$L1660
; Line 1883
	push	1
	push	0
	mov	eax, DWORD PTR _p$1646[ebp]
	add	eax, 10					; 0000000aH
	push	eax
	call	_fix_register
	add	esp, 12					; 0000000cH
; Line 1884
	jmp	$L1662
$L1660:
	push	11					; 0000000bH
	push	OFFSET $SG1664
	mov	eax, DWORD PTR _p$1646[ebp]
	push	eax
	call	_strncmp
	add	esp, 12					; 0000000cH
	or	eax, eax
	jne	$L1663
; Line 1885
	push	0
	push	0
	mov	eax, DWORD PTR _p$1646[ebp]
	add	eax, 11					; 0000000bH
	push	eax
	call	_fix_register
	add	esp, 12					; 0000000cH
; Line 1886
	jmp	$L1665
$L1663:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _argv$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	call	_lang_decode_option
	add	esp, 4
	or	eax, eax
	jne	$L1667
; Line 1887
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _argv$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	push	OFFSET $SG1668
	call	_error
	add	esp, 12					; 0000000cH
; Line 1888
$L1667:
$L1665:
$L1662:
$L1659:
$L1654:
; Line 1889
	jmp	$L1669
$L1644:
	push	OFFSET $SG1671
	mov	eax, DWORD PTR _str$1615[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L1670
; Line 1891
	jmp	$L1672
$L1670:
	push	OFFSET $SG1674
	mov	eax, DWORD PTR _str$1615[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L1673
; Line 1892
	mov	DWORD PTR _optimize, 1
	mov	DWORD PTR _obey_regdecls, 0
; Line 1893
	jmp	$L1675
$L1673:
	push	OFFSET $SG1677
	mov	eax, DWORD PTR _str$1615[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L1676
; Line 1894
	mov	DWORD PTR _optimize, 1
	mov	DWORD PTR _obey_regdecls, 0
; Line 1895
	jmp	$L1678
$L1676:
	push	OFFSET $SG1680
	mov	eax, DWORD PTR _str$1615[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L1679
; Line 1896
	mov	DWORD PTR _pedantic, 1
; Line 1897
	jmp	$L1681
$L1679:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _argv$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	call	_lang_decode_option
	add	esp, 4
	or	eax, eax
	je	$L1682
; Line 1899
	jmp	$L1683
$L1682:
	push	OFFSET $SG1685
	mov	eax, DWORD PTR _str$1615[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L1684
; Line 1900
	mov	DWORD PTR _quiet_flag, 1
; Line 1901
	jmp	$L1686
$L1684:
	push	OFFSET $SG1688
	mov	eax, DWORD PTR _str$1615[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L1687
; Line 1904
	mov	eax, DWORD PTR _version_string
	push	eax
	mov	eax, DWORD PTR _language_string
	push	eax
	push	OFFSET $SG1691
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
; Line 1906
	push	OFFSET $SG1692
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 8
; Line 1914
	push	OFFSET $SG1693
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 8
; Line 1916
	call	_print_target_switch_defaults
; Line 1918
	jmp	$L1694
$L1687:
	push	OFFSET $SG1696
	mov	eax, DWORD PTR _str$1615[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L1695
; Line 1919
	mov	DWORD PTR _inhibit_warnings, 1
; Line 1920
	jmp	$L1697
$L1695:
	push	OFFSET $SG1699
	mov	eax, DWORD PTR _str$1615[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L1698
; Line 1921
	mov	DWORD PTR _extra_warnings, 1
; Line 1922
	jmp	$L1700
$L1698:
	push	OFFSET $SG1702
	mov	eax, DWORD PTR _str$1615[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L1701
; Line 1923
	mov	DWORD PTR _warn_unused, 1
; Line 1924
	jmp	$L1703
$L1701:
	push	OFFSET $SG1705
	mov	eax, DWORD PTR _str$1615[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L1704
; Line 1925
	mov	DWORD PTR _warn_shadow, 1
; Line 1926
	jmp	$L1706
$L1704:
	push	OFFSET $SG1708
	mov	eax, DWORD PTR _str$1615[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L1707
; Line 1927
	mov	DWORD PTR _warn_switch, 1
; Line 1928
	jmp	$L1709
$L1707:
	push	10					; 0000000aH
	push	OFFSET $SG1711
	mov	eax, DWORD PTR _str$1615[ebp]
	push	eax
	call	_strncmp
	add	esp, 12					; 0000000cH
	or	eax, eax
	jne	$L1710
; Line 1930
	mov	eax, DWORD PTR _str$1615[ebp]
	add	eax, 10					; 0000000aH
	mov	DWORD PTR _endp$1712[ebp], eax
; Line 1932
$L1714:
	mov	eax, DWORD PTR _endp$1712[ebp]
	movsx	eax, BYTE PTR [eax]
	or	eax, eax
	je	$L1715
; Line 1934
	mov	eax, DWORD PTR _endp$1712[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 48					; 00000030H
	jl	$L1716
	mov	eax, DWORD PTR _endp$1712[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 57					; 00000039H
	jg	$L1716
; Line 1935
	inc	DWORD PTR _endp$1712[ebp]
; Line 1936
	jmp	$L1717
$L1716:
; Line 1937
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _argv$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	push	OFFSET $SG1718
	call	_error
	add	esp, 12					; 0000000cH
$L1717:
; Line 1938
	jmp	$L1714
$L1715:
; Line 1939
	mov	DWORD PTR _warn_id_clash, 1
; Line 1940
	mov	eax, DWORD PTR _str$1615[ebp]
	add	eax, 10					; 0000000aH
	push	eax
	call	_atoi
	add	esp, 4
	mov	DWORD PTR _id_clash_len, eax
; Line 1942
	jmp	$L1720
$L1710:
	push	OFFSET $SG1722
	mov	eax, DWORD PTR _str$1615[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L1721
; Line 1943
	mov	DWORD PTR _profile_flag, 1
; Line 1944
	jmp	$L1723
$L1721:
	push	OFFSET $SG1725
	mov	eax, DWORD PTR _str$1615[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L1724
; Line 1947
	push	0
	push	0
	push	OFFSET $SG1726
	call	_warning
	add	esp, 12					; 0000000cH
; Line 1952
	jmp	$L1727
$L1724:
	push	OFFSET $SG1729
	mov	eax, DWORD PTR _str$1615[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L1728
; Line 1953
	mov	DWORD PTR _write_symbols, 1
; Line 1955
	jmp	$L1730
$L1728:
	push	OFFSET $SG1732
	mov	eax, DWORD PTR _str$1615[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L1731
; Line 1956
	mov	DWORD PTR _write_symbols, 2
; Line 1957
	jmp	$L1733
$L1731:
	push	OFFSET $SG1735
	mov	eax, DWORD PTR _str$1615[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L1734
; Line 1958
	mov	DWORD PTR _write_symbols, 2
; Line 1959
	jmp	$L1736
$L1734:
	push	OFFSET $SG1738
	mov	eax, DWORD PTR _str$1615[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L1737
; Line 1961
	mov	DWORD PTR _write_symbols, 2
; Line 1962
	mov	DWORD PTR _use_gdb_dbx_extensions, 1
; Line 1964
	jmp	$L1739
$L1737:
	push	OFFSET $SG1741
	mov	eax, DWORD PTR _str$1615[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L1740
; Line 1966
	mov	DWORD PTR _write_symbols, 2
; Line 1967
	mov	DWORD PTR _use_gdb_dbx_extensions, 1
; Line 1980
	jmp	$L1742
$L1740:
	push	OFFSET $SG1744
	mov	eax, DWORD PTR _str$1615[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L1743
; Line 1982
	cmp	DWORD PTR _write_symbols, 0
	jne	$L1745
; Line 1983
	mov	DWORD PTR _write_symbols, 1
; Line 1984
$L1745:
	inc	DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _argv$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _sym_file_name, eax
; Line 1986
	jmp	$L1746
$L1743:
	push	OFFSET $SG1748
	mov	eax, DWORD PTR _str$1615[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L1747
; Line 1988
	inc	DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _argv$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _asm_file_name, eax
; Line 1990
	jmp	$L1749
$L1747:
; Line 1991
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _argv$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	push	OFFSET $SG1750
	call	_error
	add	esp, 12					; 0000000cH
$L1749:
$L1746:
$L1742:
$L1739:
$L1736:
$L1733:
$L1730:
$L1727:
$L1723:
$L1720:
$L1709:
$L1706:
$L1703:
$L1700:
$L1697:
$L1694:
$L1686:
$L1683:
$L1681:
$L1678:
$L1675:
$L1672:
$L1669:
$L1643:
$L1621:
$L1618:
; Line 1993
	jmp	$L1751
$L1614:
; Line 1994
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _argv$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _filename$[ebp], eax
$L1751:
	jmp	$L1612
$L1613:
; Line 2002
	call	_init_reg_sets_1
; Line 2004
	mov	eax, DWORD PTR _filename$[ebp]
	push	eax
	call	_compile_file
	add	esp, 4
; Line 2022
	cmp	DWORD PTR _errorcount, 0
	je	$L1753
; Line 2023
	push	33					; 00000021H
	call	_exit
	add	esp, 4
; Line 2024
$L1753:
	cmp	DWORD PTR _sorrycount, 0
	je	$L1754
; Line 2025
	push	33					; 00000021H
	call	_exit
	add	esp, 4
; Line 2026
$L1754:
	push	0
	call	_exit
	add	esp, 4
; Line 2027
	mov	eax, 34					; 00000022H
	jmp	$L1602
; Line 2028
$L1602:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_main	ENDP
_TEXT	ENDS
_DATA	SEGMENT
$SG1773	DB	'Invalid option `%s''', 00H
_DATA	ENDS
_TEXT	SEGMENT
_name$ = 8
_j$ = -4
_set_target_switch PROC NEAR
; Line 2046
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 2048
	mov	DWORD PTR _j$[ebp], 0
	jmp	$L1767
$L1768:
	inc	DWORD PTR _j$[ebp]
$L1767:
	cmp	DWORD PTR _j$[ebp], 7
	jae	$L1769
; Line 2049
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	mov	eax, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR _target_switches[eax*8]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L1770
; Line 2051
	mov	eax, DWORD PTR _j$[ebp]
	cmp	DWORD PTR _target_switches[eax*8+4], 0
	jge	$L1771
; Line 2052
	mov	eax, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR _target_switches[eax*8+4]
	dec	eax
	and	DWORD PTR _target_flags, eax
; Line 2053
	jmp	$L1772
$L1771:
; Line 2054
	mov	eax, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR _target_switches[eax*8+4]
	or	DWORD PTR _target_flags, eax
$L1772:
; Line 2055
	jmp	$L1765
; Line 2057
$L1770:
	jmp	$L1768
$L1769:
	push	0
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	push	OFFSET $SG1773
	call	_error
	add	esp, 12					; 0000000cH
; Line 2058
$L1765:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_set_target_switch ENDP
_TEXT	ENDS
_DATA	SEGMENT
$SG1777	DB	'default target switches:', 00H
	ORG $+3
$SG1782	DB	' -m%s', 00H
	ORG $+2
$SG1783	DB	0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_j$ = -8
_mask$ = -4
_print_target_switch_defaults PROC NEAR
; Line 2064
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 2066
	mov	DWORD PTR _mask$[ebp], 1
; Line 2067
	push	OFFSET $SG1777
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 8
; Line 2068
	mov	DWORD PTR _j$[ebp], 0
	jmp	$L1778
$L1779:
	inc	DWORD PTR _j$[ebp]
$L1778:
	cmp	DWORD PTR _j$[ebp], 7
	jae	$L1780
; Line 2071
	mov	eax, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR _target_switches[eax*8]
	movsx	eax, BYTE PTR [eax]
	or	eax, eax
	je	$L1781
	mov	eax, DWORD PTR _j$[ebp]
	cmp	DWORD PTR _target_switches[eax*8+4], 0
	jle	$L1781
	mov	eax, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR _target_switches[eax*8+4]
	and	eax, DWORD PTR _mask$[ebp]
	mov	ecx, DWORD PTR _j$[ebp]
	cmp	eax, DWORD PTR _target_switches[ecx*8+4]
	jne	$L1781
; Line 2073
	mov	eax, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR _target_switches[eax*8]
	push	eax
	push	OFFSET $SG1782
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 2075
$L1781:
	jmp	$L1779
$L1780:
	push	OFFSET $SG1783
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 8
; Line 2076
$L1774:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_print_target_switch_defaults ENDP
_TEXT	ENDS
END
