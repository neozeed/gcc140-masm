	TITLE	gcc.c
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
PUBLIC	_standard_startfile_prefix_2
PUBLIC	_compilers
PUBLIC	_link_spec
PUBLIC	_user_exec_prefix
PUBLIC	_env_exec_prefix
PUBLIC	_machine_suffix
PUBLIC	_standard_exec_prefix
PUBLIC	_standard_exec_prefix_1
PUBLIC	_standard_startfile_prefix
PUBLIC	_standard_startfile_prefix_1
_DATA	SEGMENT
COMM	_input_filename:DWORD
COMM	_input_file_number:DWORD
COMM	_input_filename_length:DWORD
COMM	_basename_length:DWORD
COMM	_input_basename:DWORD
COMM	_arg_going:DWORD
COMM	_delete_this_arg:DWORD
COMM	_switches:DWORD
COMM	_this_is_output_file:DWORD
COMM	_n_switches:DWORD
COMM	_this_is_library_file:DWORD
COMM	_infiles:DWORD
COMM	_n_infiles:DWORD
COMM	_outfiles:DWORD
COMM	_temp_filename:DWORD
COMM	_temp_filename_length:DWORD
COMM	_always_delete_queue:DWORD
COMM	_failure_delete_queue:DWORD
COMM	_obstack:BYTE:024H
COMM	_argbuf:DWORD
COMM	_argbuf_length:DWORD
COMM	_argbuf_index:DWORD
COMM	_execution_count:DWORD
COMM	_vflag:BYTE
COMM	_programname:DWORD
COMM	_last_pipe_input:DWORD
$SG420	DB	'.c', 00H
	ORG $+1
$SG421	DB	'cpp %{nostdinc} %{C} %{v} %{D*} %{U*} %{I*} %{M*} %{i*} '
	DB	'%{trigraphs} -undef         -D__GNUC__ %{ansi:-trigraphs -$ -'
	DB	'D__STRICT_ANSI__} %{!ansi:%p} %P        %c %{O:-D__OPTIMIZE__'
	DB	'} %{traditional} %{pedantic} %{P}', 09H, '%{Wcomment*} %{Wtri'
	DB	'graphs} %{Wall} %{w} %C        %i %{!M*:%{!E:%{!pipe:%g.cpp}}'
	DB	'}%{E:%W{o*}}%{M*:%W{o*}} |', 0aH, '    %{!M*:%{!E:cc1 %{!pipe'
	DB	':%g.cpp} %1 ', 09H, 09H, '   %{!Q:-quiet} -dumpbase %i %{Y*} '
	DB	'%{d*} %{m*} %{f*} %{a}', 09H, 09H, '   %{g} %{O} %{W*} %{w} %'
	DB	'{pedantic} %{ansi} %{traditional}', 09H, 09H, '   %{v:-versio'
	DB	'n} %{gg:-symout %g.sym} %{pg:-p} %{p}', 09H, 09H, '   %{pg:%{'
	DB	'fomit-frame-pointer:%e-pg and -fomit-frame-pointer are incomp'
	DB	'atible}}', 09H, 09H, '   %{S:%W{o*}%{!o*:-o %b.s}}%{!S:-o %{|'
	DB	'!pipe:%g.s}} |', 0aH, '              %{!S:as %{R} %{j} %{J} %'
	DB	'{h} %{d2} %a %{gg:-G %g.sym}', 09H, 09H, '      %{c:%W{o*}%{!'
	DB	'o*:-o %w%b.o}}%{!c:-o %d%w%b.o}                      %{!pipe:'
	DB	'%g.s}', 0aH, ' }}}', 00H
	ORG $+3
$SG422	DB	'.cc', 00H
$SG423	DB	'cpp -+ %{nostdinc} %{C} %{v} %{D*} %{U*} %{I*} %{M*} %{i'
	DB	'*}         -undef -D__GNUC__ -D__GNUG__ %p %P        %c %{O:-'
	DB	'D__OPTIMIZE__} %{traditional} %{pedantic} %{P}', 09H, '%{Wcom'
	DB	'ment*} %{Wtrigraphs} %{Wall} %{w} %C        %i %{!M*:%{!E:%{!'
	DB	'pipe:%g.cpp}}}%{E:%W{o*}}%{M*:%W{o*}} |', 0aH, '    %{!M*:%{!'
	DB	'E:cc1plus %{!pipe:%g.cpp} %1', 09H, 09H, '   %{!Q:-quiet} -du'
	DB	'mpbase %i %{Y*} %{d*} %{m*} %{f*} %{a}', 09H, 09H, '   %{g} %'
	DB	'{O} %{W*} %{w} %{pedantic} %{traditional}', 09H, 09H, '   %{v'
	DB	':-version} %{gg:-symout %g.sym} %{pg:-p} %{p}', 09H, 09H, '  '
	DB	' %{pg:%{fomit-frame-pointer:%e-pg and -fomit-frame-pointer ar'
	DB	'e incompatible}}', 09H, 09H, '   %{S:%W{o*}%{!o*:-o %b.s}}%{!'
	DB	'S:-o %{|!pipe:%g.s}} |', 0aH, '              %{!S:as %{R} %{j'
	DB	'} %{J} %{h} %{d2} %a %{gg:-G %g.sym}', 09H, 09H, '      %{c:%'
	DB	'W{o*}%{!o*:-o %w%b.o}}%{!c:-o %d%w%b.o}                      '
	DB	'%{!pipe:%g.s}', 0aH, ' }}}', 00H
$SG424	DB	'.i', 00H
	ORG $+1
$SG425	DB	'cc1 %i %1 %{!Q:-quiet} %{Y*} %{d*} %{m*} %{f*} %{a}', 09H
	DB	'%{g} %{O} %{W*} %{w} %{pedantic} %{ansi} %{traditional}', 09H
	DB	'%{v:-version} %{gg:-symout %g.sym} %{pg:-p} %{p}', 09H, '%{S:'
	DB	'%W{o*}%{!o*:-o %b.s}}%{!S:-o %{|!pipe:%g.s}} |', 0aH, '    %{'
	DB	'!S:as %{R} %{j} %{J} %{h} %{d2} %a %{gg:-G %g.sym}           '
	DB	' %{c:%W{o*}%{!o*:-o %w%b.o}}%{!c:-o %d%w%b.o} %{!pipe:%g.s}', 0aH
	DB	' }', 00H
	ORG $+2
$SG426	DB	'.s', 00H
	ORG $+1
$SG427	DB	'%{!S:as %{R} %{j} %{J} %{h} %{d2} %a             %{c:%W{'
	DB	'o*}%{!o*:-o %w%b.o}}%{!c:-o %d%w%b.o} %i', 0aH, ' }', 00H
$SG428	DB	'.S', 00H
	ORG $+1
$SG429	DB	'cpp %{nostdinc} %{C} %{v} %{D*} %{U*} %{I*} %{M*} %{trig'
	DB	'raphs}         -undef -D__GNUC__ -$ %p %P        %c %{O:-D__O'
	DB	'PTIMIZE__} %{traditional} %{pedantic} %{P}', 09H, '%{Wcomment'
	DB	'*} %{Wtrigraphs} %{Wall} %{w} %C        %i %{!M*:%{!E:%{!pipe'
	DB	':%g.s}}}%{E:%W{o*}}%{M*:%W{o*}} |', 0aH, '    %{!M*:%{!E:%{!S'
	DB	':as %{R} %{j} %{J} %{h} %{d2} %a                     %{c:%W{o'
	DB	'*}%{!o*:-o %w%b.o}}%{!c:-o %d%w%b.o}', 09H, 09H, '    %{!pipe'
	DB	':%g.s}', 0aH, ' }}}', 00H
	ORG $+6
_compilers DD	$SG420
	DD	$SG421
	DD	$SG422
	DD	$SG423
	DD	$SG424
	DD	$SG425
	DD	$SG426
	DD	$SG427
	DD	$SG428
	DD	$SG429
	DD	00H
	DD	00H
$SG431	DB	'%{!c:%{!M*:%{!E:%{!S:ld %{o*} %l %{A} %{d} %{e*} %{N} %{'
	DB	'n} %{r} %{s} %{S} %{T*} %{t} %{u*} %{X} %{x} %{z} %{y*} %{!A:'
	DB	'%{!nostdlib:%S}}  %{L*} %o %{!nostdlib:%G gnulib%s %L gnulib%'
	DB	's %{!A:%E}}', 0aH, ' }}}}', 00H
_link_spec DD	$SG431
_user_exec_prefix DD 00H
_env_exec_prefix DD 00H
_machine_suffix DD 00H
$SG442	DB	'/usr/local/lib/gcc-', 00H
_standard_exec_prefix DD $SG442
$SG444	DB	'/usr/lib/gcc-', 00H
	ORG $+2
_standard_exec_prefix_1 DD $SG444
$SG446	DB	'/usr/local/lib/', 00H
_standard_startfile_prefix DD $SG446
$SG448	DB	'/lib/', 00H
	ORG $+2
_standard_startfile_prefix_1 DD $SG448
$SG450	DB	'/usr/lib/', 00H
	ORG $+2
_standard_startfile_prefix_2 DD $SG450
_DATA	ENDS
PUBLIC	_clear_args
_TEXT	SEGMENT
; File gcc.c
_clear_args PROC NEAR
; Line 387
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 388
	mov	DWORD PTR _argbuf_index, 0
; Line 389
$L452:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_clear_args ENDP
_TEXT	ENDS
PUBLIC	_store_arg
PUBLIC	_record_temp_file
EXTRN	_realloc:NEAR
_TEXT	SEGMENT
_arg$ = 8
_delete_always$ = 12
_delete_failure$ = 16
_store_arg PROC NEAR
; Line 402
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 403
	mov	eax, DWORD PTR _argbuf_index
	inc	eax
	cmp	eax, DWORD PTR _argbuf_length
	jne	$L458
; Line 405
	shl	DWORD PTR _argbuf_length, 1
	mov	eax, DWORD PTR _argbuf_length
	shl	eax, 2
	push	eax
	mov	eax, DWORD PTR _argbuf
	push	eax
	call	_realloc
	add	esp, 8
	mov	DWORD PTR _argbuf, eax
; Line 408
$L458:
	mov	eax, DWORD PTR _arg$[ebp]
	mov	ecx, DWORD PTR _argbuf_index
	mov	edx, DWORD PTR _argbuf
	mov	DWORD PTR [edx+ecx*4], eax
	inc	DWORD PTR _argbuf_index
; Line 409
	mov	eax, DWORD PTR _argbuf_index
	mov	ecx, DWORD PTR _argbuf
	mov	DWORD PTR [ecx+eax*4], 0
; Line 411
	cmp	DWORD PTR _delete_always$[ebp], 0
	jne	$L460
	cmp	DWORD PTR _delete_failure$[ebp], 0
	je	$L459
$L460:
; Line 412
	mov	eax, DWORD PTR _delete_failure$[ebp]
	push	eax
	mov	eax, DWORD PTR _delete_always$[ebp]
	push	eax
	mov	eax, DWORD PTR _arg$[ebp]
	push	eax
	call	_record_temp_file
	add	esp, 12					; 0000000cH
; Line 413
$L459:
$L457:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_store_arg ENDP
_TEXT	ENDS
PUBLIC	_xmalloc
EXTRN	_strlen:NEAR
EXTRN	_strcpy:NEAR
EXTRN	_strcmp:NEAR
_TEXT	SEGMENT
_filename$ = 8
_always_delete$ = 12
_fail_delete$ = 16
_name$ = -4
_temp$474 = -8
_temp$482 = -12
_record_temp_file PROC NEAR
; Line 458
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 460
	mov	eax, DWORD PTR _filename$[ebp]
	push	eax
	call	_strlen
	add	esp, 4
	inc	eax
	push	eax
	call	_xmalloc
	add	esp, 4
	mov	DWORD PTR _name$[ebp], eax
; Line 461
	mov	eax, DWORD PTR _filename$[ebp]
	push	eax
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_strcpy
	add	esp, 8
; Line 463
	cmp	DWORD PTR _always_delete$[ebp], 0
	je	$L473
; Line 466
	mov	eax, DWORD PTR _always_delete_queue
	mov	DWORD PTR _temp$474[ebp], eax
	jmp	$L475
$L476:
	mov	eax, DWORD PTR _temp$474[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _temp$474[ebp], eax
$L475:
	cmp	DWORD PTR _temp$474[ebp], 0
	je	$L477
; Line 467
	mov	eax, DWORD PTR _temp$474[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L479
; Line 468
	jmp	$already1$480
; Line 469
$L479:
	jmp	$L476
$L477:
	push	8
	call	_xmalloc
	add	esp, 4
	mov	DWORD PTR _temp$474[ebp], eax
; Line 470
	mov	eax, DWORD PTR _always_delete_queue
	mov	ecx, DWORD PTR _temp$474[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 471
	mov	eax, DWORD PTR _name$[ebp]
	mov	ecx, DWORD PTR _temp$474[ebp]
	mov	DWORD PTR [ecx], eax
; Line 472
	mov	eax, DWORD PTR _temp$474[ebp]
	mov	DWORD PTR _always_delete_queue, eax
; Line 473
$already1$480:
; Line 476
$L473:
	cmp	DWORD PTR _fail_delete$[ebp], 0
	je	$L481
; Line 479
	mov	eax, DWORD PTR _failure_delete_queue
	mov	DWORD PTR _temp$482[ebp], eax
	jmp	$L483
$L484:
	mov	eax, DWORD PTR _temp$482[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _temp$482[ebp], eax
$L483:
	cmp	DWORD PTR _temp$482[ebp], 0
	je	$L485
; Line 480
	mov	eax, DWORD PTR _temp$482[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L486
; Line 481
	jmp	$already2$487
; Line 482
$L486:
	jmp	$L484
$L485:
	push	8
	call	_xmalloc
	add	esp, 4
	mov	DWORD PTR _temp$482[ebp], eax
; Line 483
	mov	eax, DWORD PTR _failure_delete_queue
	mov	ecx, DWORD PTR _temp$482[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 484
	mov	eax, DWORD PTR _name$[ebp]
	mov	ecx, DWORD PTR _temp$482[ebp]
	mov	DWORD PTR [ecx], eax
; Line 485
	mov	eax, DWORD PTR _temp$482[ebp]
	mov	DWORD PTR _failure_delete_queue, eax
; Line 486
$already2$487:
; Line 488
$L481:
$L469:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_record_temp_file ENDP
_TEXT	ENDS
PUBLIC	_delete_temp_files
PUBLIC	_perror_with_name
EXTRN	_unlink:NEAR
_TEXT	SEGMENT
_temp$ = -4
_delete_temp_files PROC NEAR
; Line 494
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 497
	mov	eax, DWORD PTR _always_delete_queue
	mov	DWORD PTR _temp$[ebp], eax
	jmp	$L491
$L492:
	mov	eax, DWORD PTR _temp$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _temp$[ebp], eax
$L491:
	cmp	DWORD PTR _temp$[ebp], 0
	je	$L493
; Line 509
	mov	eax, DWORD PTR _temp$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_unlink
	add	esp, 4
	or	eax, eax
	jge	$L494
; Line 510
	xor	eax, eax
	mov	al, BYTE PTR _vflag
	or	eax, eax
	je	$L495
; Line 511
	mov	eax, DWORD PTR _temp$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_perror_with_name
	add	esp, 4
; Line 512
$L495:
$L494:
; Line 513
	jmp	$L492
$L493:
; Line 515
	mov	DWORD PTR _always_delete_queue, 0
; Line 516
$L489:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_delete_temp_files ENDP
_TEXT	ENDS
PUBLIC	_delete_failure_queue
_TEXT	SEGMENT
_temp$ = -4
_delete_failure_queue PROC NEAR
; Line 522
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 525
	mov	eax, DWORD PTR _failure_delete_queue
	mov	DWORD PTR _temp$[ebp], eax
	jmp	$L500
$L501:
	mov	eax, DWORD PTR _temp$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _temp$[ebp], eax
$L500:
	cmp	DWORD PTR _temp$[ebp], 0
	je	$L502
; Line 537
	mov	eax, DWORD PTR _temp$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_unlink
	add	esp, 4
	or	eax, eax
	jge	$L503
; Line 538
	xor	eax, eax
	mov	al, BYTE PTR _vflag
	or	eax, eax
	je	$L504
; Line 539
	mov	eax, DWORD PTR _temp$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_perror_with_name
	add	esp, 4
; Line 540
$L504:
$L503:
; Line 541
	jmp	$L501
$L502:
; Line 542
$L498:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_delete_failure_queue ENDP
_TEXT	ENDS
PUBLIC	_clear_failure_queue
_TEXT	SEGMENT
_clear_failure_queue PROC NEAR
; Line 546
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 547
	mov	DWORD PTR _failure_delete_queue, 0
; Line 548
$L506:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_clear_failure_queue ENDP
_TEXT	ENDS
PUBLIC	_choose_temp_base
EXTRN	_getenv:NEAR
EXTRN	_malloc:NEAR
EXTRN	_strcat:NEAR
EXTRN	_access:NEAR
EXTRN	_mktemp:NEAR
_DATA	SEGMENT
$SG513	DB	'GCCTMP', 00H
	ORG $+1
$SG515	DB	'TMP', 00H
$SG517	DB	'TEMP', 00H
	ORG $+3
$SG519	DB	'TMPDIR', 00H
	ORG $+1
$SG521	DB	'./', 00H
	ORG $+1
$SG528	DB	'/', 00H
	ORG $+2
$SG532	DB	'\', 00H
	ORG $+2
$SG533	DB	'\', 00H
	ORG $+2
$SG536	DB	'/usr/tmp', 00H
	ORG $+3
$SG537	DB	'/usr/tmp/', 00H
	ORG $+2
$SG539	DB	'/tmp/', 00H
	ORG $+2
$SG541	DB	'ccXXXXXX', 00H
_DATA	ENDS
_TEXT	SEGMENT
_base$ = -12
_len$ = -8
_bp$ = -4
_choose_temp_base PROC NEAR
; Line 555
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 561
	mov	DWORD PTR _base$[ebp], 0
; Line 566
	cmp	DWORD PTR _base$[ebp], 0
	jne	$L512
	push	OFFSET $SG513
	call	_getenv
	add	esp, 4
	mov	DWORD PTR _base$[ebp], eax
; Line 567
$L512:
	cmp	DWORD PTR _base$[ebp], 0
	jne	$L514
	push	OFFSET $SG515
	call	_getenv
	add	esp, 4
	mov	DWORD PTR _base$[ebp], eax
; Line 568
$L514:
	cmp	DWORD PTR _base$[ebp], 0
	jne	$L516
	push	OFFSET $SG517
	call	_getenv
	add	esp, 4
	mov	DWORD PTR _base$[ebp], eax
; Line 569
$L516:
	cmp	DWORD PTR _base$[ebp], 0
	jne	$L518
	push	OFFSET $SG519
	call	_getenv
	add	esp, 4
	mov	DWORD PTR _base$[ebp], eax
; Line 570
$L518:
	cmp	DWORD PTR _base$[ebp], 0
	jne	$L520
	mov	DWORD PTR _base$[ebp], OFFSET $SG521
; Line 571
$L520:
	mov	eax, DWORD PTR _base$[ebp]
	mov	DWORD PTR _bp$[ebp], eax
	jmp	$L522
$L523:
	inc	DWORD PTR _bp$[ebp]
$L522:
	mov	eax, DWORD PTR _bp$[ebp]
	movsx	eax, BYTE PTR [eax]
	or	eax, eax
	je	$L524
; Line 572
	mov	eax, DWORD PTR _bp$[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 92					; 0000005cH
	jne	$L525
	mov	eax, DWORD PTR _bp$[ebp]
	mov	BYTE PTR [eax], 47			; 0000002fH
; Line 573
$L525:
	jmp	$L523
$L524:
	mov	eax, DWORD PTR _bp$[ebp]
	movsx	eax, BYTE PTR [eax-1]
	cmp	eax, 47					; 0000002fH
	je	$L526
; Line 575
	mov	eax, DWORD PTR _base$[ebp]
	push	eax
	call	_strlen
	add	esp, 4
	add	eax, 2
	push	eax
	call	_malloc
	add	esp, 4
	mov	DWORD PTR _bp$[ebp], eax
; Line 576
	mov	eax, DWORD PTR _base$[ebp]
	push	eax
	mov	eax, DWORD PTR _bp$[ebp]
	push	eax
	call	_strcpy
	add	esp, 8
; Line 577
	push	OFFSET $SG528
	mov	eax, DWORD PTR _bp$[ebp]
	push	eax
	call	_strcat
	add	esp, 8
; Line 578
	mov	eax, DWORD PTR _bp$[ebp]
	mov	DWORD PTR _base$[ebp], eax
; Line 582
$L526:
	cmp	DWORD PTR _base$[ebp], 0
	jne	$L529
; Line 585
	push	6
	push	OFFSET $SG532
	call	_access
	add	esp, 8
	or	eax, eax
	jne	$L531
; Line 586
	mov	DWORD PTR _base$[ebp], OFFSET $SG533
; Line 588
$L531:
	cmp	DWORD PTR _base$[ebp], 0
	jne	$L534
; Line 590
	push	6
	push	OFFSET $SG536
	call	_access
	add	esp, 8
	or	eax, eax
	jne	$L535
; Line 591
	mov	DWORD PTR _base$[ebp], OFFSET $SG537
; Line 592
	jmp	$L538
$L535:
; Line 593
	mov	DWORD PTR _base$[ebp], OFFSET $SG539
$L538:
; Line 595
$L534:
; Line 597
$L529:
	mov	eax, DWORD PTR _base$[ebp]
	push	eax
	call	_strlen
	add	esp, 4
	mov	DWORD PTR _len$[ebp], eax
; Line 598
	mov	eax, DWORD PTR _len$[ebp]
	add	eax, 10					; 0000000aH
	push	eax
	call	_xmalloc
	add	esp, 4
	mov	DWORD PTR _temp_filename, eax
; Line 599
	mov	eax, DWORD PTR _base$[ebp]
	push	eax
	mov	eax, DWORD PTR _temp_filename
	push	eax
	call	_strcpy
	add	esp, 8
; Line 600
	cmp	DWORD PTR _len$[ebp], 0
	jle	$L540
	mov	eax, DWORD PTR _len$[ebp]
	mov	ecx, DWORD PTR _temp_filename
	movsx	eax, BYTE PTR [eax+ecx-1]
	cmp	eax, 47					; 0000002fH
	je	$L540
; Line 601
	mov	eax, DWORD PTR _len$[ebp]
	mov	ecx, DWORD PTR _temp_filename
	mov	BYTE PTR [eax+ecx], 47			; 0000002fH
	inc	DWORD PTR _len$[ebp]
; Line 602
$L540:
	push	OFFSET $SG541
	mov	eax, DWORD PTR _len$[ebp]
	add	eax, DWORD PTR _temp_filename
	push	eax
	call	_strcpy
	add	esp, 8
; Line 604
	mov	eax, DWORD PTR _temp_filename
	push	eax
	call	_mktemp
	add	esp, 4
; Line 606
	mov	eax, DWORD PTR _temp_filename
	push	eax
	call	_strlen
	add	esp, 4
	mov	DWORD PTR -16+[ebp], eax
	mov	eax, DWORD PTR -16+[ebp]
	mov	ecx, DWORD PTR _temp_filename
	mov	BYTE PTR [eax+ecx-4], 95		; 0000005fH
; Line 608
	mov	eax, DWORD PTR _temp_filename
	push	eax
	call	_strlen
	add	esp, 4
	mov	DWORD PTR _temp_filename_length, eax
; Line 609
$L508:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_choose_temp_base ENDP
_prog$ = 8
_win$ = -12
_temp$ = -8
_size$ = -4
_find_exec_file PROC NEAR
; Line 617
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 618
	mov	DWORD PTR _win$[ebp], 0
; Line 622
	mov	eax, DWORD PTR _standard_exec_prefix
	push	eax
	call	_strlen
	add	esp, 4
	mov	DWORD PTR _size$[ebp], eax
; Line 623
	cmp	DWORD PTR _user_exec_prefix, 0
	je	$L548
	mov	eax, DWORD PTR _user_exec_prefix
	push	eax
	call	_strlen
	add	esp, 4
	cmp	eax, DWORD PTR _size$[ebp]
	jle	$L548
; Line 624
	mov	eax, DWORD PTR _user_exec_prefix
	push	eax
	call	_strlen
	add	esp, 4
	mov	DWORD PTR _size$[ebp], eax
; Line 625
$L548:
	cmp	DWORD PTR _env_exec_prefix, 0
	je	$L549
	mov	eax, DWORD PTR _env_exec_prefix
	push	eax
	call	_strlen
	add	esp, 4
	cmp	eax, DWORD PTR _size$[ebp]
	jle	$L549
; Line 626
	mov	eax, DWORD PTR _env_exec_prefix
	push	eax
	call	_strlen
	add	esp, 4
	mov	DWORD PTR _size$[ebp], eax
; Line 627
$L549:
	mov	eax, DWORD PTR _standard_exec_prefix_1
	push	eax
	call	_strlen
	add	esp, 4
	cmp	eax, DWORD PTR _size$[ebp]
	jle	$L550
; Line 628
	mov	eax, DWORD PTR _standard_exec_prefix_1
	push	eax
	call	_strlen
	add	esp, 4
	mov	DWORD PTR _size$[ebp], eax
; Line 629
$L550:
	mov	eax, DWORD PTR _prog$[ebp]
	push	eax
	call	_strlen
	add	esp, 4
	inc	eax
	add	DWORD PTR _size$[ebp], eax
; Line 630
	cmp	DWORD PTR _machine_suffix, 0
	je	$L551
; Line 631
	mov	eax, DWORD PTR _machine_suffix
	push	eax
	call	_strlen
	add	esp, 4
	inc	eax
	add	DWORD PTR _size$[ebp], eax
; Line 632
$L551:
	mov	eax, DWORD PTR _size$[ebp]
	push	eax
	call	_xmalloc
	add	esp, 4
	mov	DWORD PTR _temp$[ebp], eax
; Line 636
	cmp	DWORD PTR _user_exec_prefix, 0
	je	$L552
; Line 638
	cmp	DWORD PTR _machine_suffix, 0
	je	$L553
; Line 640
	mov	eax, DWORD PTR _user_exec_prefix
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_strcpy
	add	esp, 8
; Line 641
	mov	eax, DWORD PTR _machine_suffix
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_strcat
	add	esp, 8
; Line 642
	mov	eax, DWORD PTR _prog$[ebp]
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_strcat
	add	esp, 8
; Line 643
	push	1
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_access
	add	esp, 8
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	mov	DWORD PTR _win$[ebp], eax
; Line 645
$L553:
	cmp	DWORD PTR _win$[ebp], 0
	jne	$L554
; Line 647
	mov	eax, DWORD PTR _user_exec_prefix
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_strcpy
	add	esp, 8
; Line 648
	mov	eax, DWORD PTR _prog$[ebp]
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_strcat
	add	esp, 8
; Line 649
	push	1
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_access
	add	esp, 8
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	mov	DWORD PTR _win$[ebp], eax
; Line 651
$L554:
; Line 653
$L552:
	cmp	DWORD PTR _win$[ebp], 0
	jne	$L555
	cmp	DWORD PTR _env_exec_prefix, 0
	je	$L555
; Line 655
	cmp	DWORD PTR _machine_suffix, 0
	je	$L556
; Line 657
	mov	eax, DWORD PTR _env_exec_prefix
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_strcpy
	add	esp, 8
; Line 658
	mov	eax, DWORD PTR _machine_suffix
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_strcat
	add	esp, 8
; Line 659
	mov	eax, DWORD PTR _prog$[ebp]
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_strcat
	add	esp, 8
; Line 660
	push	1
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_access
	add	esp, 8
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	mov	DWORD PTR _win$[ebp], eax
; Line 662
$L556:
	cmp	DWORD PTR _win$[ebp], 0
	jne	$L557
; Line 664
	mov	eax, DWORD PTR _env_exec_prefix
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_strcpy
	add	esp, 8
; Line 665
	mov	eax, DWORD PTR _prog$[ebp]
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_strcat
	add	esp, 8
; Line 666
	push	1
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_access
	add	esp, 8
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	mov	DWORD PTR _win$[ebp], eax
; Line 668
$L557:
; Line 670
$L555:
	cmp	DWORD PTR _win$[ebp], 0
	jne	$L558
; Line 672
	cmp	DWORD PTR _machine_suffix, 0
	je	$L559
; Line 674
	mov	eax, DWORD PTR _standard_exec_prefix
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_strcpy
	add	esp, 8
; Line 675
	mov	eax, DWORD PTR _machine_suffix
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_strcat
	add	esp, 8
; Line 676
	mov	eax, DWORD PTR _prog$[ebp]
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_strcat
	add	esp, 8
; Line 677
	push	1
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_access
	add	esp, 8
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	mov	DWORD PTR _win$[ebp], eax
; Line 679
$L559:
	cmp	DWORD PTR _win$[ebp], 0
	jne	$L560
; Line 681
	mov	eax, DWORD PTR _standard_exec_prefix
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_strcpy
	add	esp, 8
; Line 682
	mov	eax, DWORD PTR _prog$[ebp]
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_strcat
	add	esp, 8
; Line 683
	push	1
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_access
	add	esp, 8
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	mov	DWORD PTR _win$[ebp], eax
; Line 685
$L560:
; Line 687
$L558:
	cmp	DWORD PTR _win$[ebp], 0
	jne	$L561
; Line 689
	cmp	DWORD PTR _machine_suffix, 0
	je	$L562
; Line 691
	mov	eax, DWORD PTR _standard_exec_prefix_1
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_strcpy
	add	esp, 8
; Line 692
	mov	eax, DWORD PTR _machine_suffix
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_strcat
	add	esp, 8
; Line 693
	mov	eax, DWORD PTR _prog$[ebp]
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_strcat
	add	esp, 8
; Line 694
	push	1
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_access
	add	esp, 8
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	mov	DWORD PTR _win$[ebp], eax
; Line 696
$L562:
	cmp	DWORD PTR _win$[ebp], 0
	jne	$L563
; Line 698
	mov	eax, DWORD PTR _standard_exec_prefix_1
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_strcpy
	add	esp, 8
; Line 699
	mov	eax, DWORD PTR _prog$[ebp]
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_strcat
	add	esp, 8
; Line 700
	push	1
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_access
	add	esp, 8
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	mov	DWORD PTR _win$[ebp], eax
; Line 702
$L563:
; Line 704
$L561:
	cmp	DWORD PTR _win$[ebp], 0
	je	$L564
; Line 705
	mov	eax, DWORD PTR _temp$[ebp]
	jmp	$L544
; Line 706
	jmp	$L565
$L564:
; Line 707
	sub	eax, eax
	jmp	$L544
$L565:
; Line 708
$L544:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_find_exec_file ENDP
_TEXT	ENDS
EXTRN	_fopen:NEAR
EXTRN	_fputc:NEAR
EXTRN	_fputs:NEAR
EXTRN	_alloca:NEAR
EXTRN	_sprintf:NEAR
EXTRN	_errno:DWORD
EXTRN	_fclose:NEAR
_DATA	SEGMENT
	ORG $+3
$SG584	DB	'%s.gp', 00H
	ORG $+2
$SG585	DB	'w', 00H
	ORG $+2
$SG591	DB	'@%s.gp', 00H
_DATA	ENDS
_TEXT	SEGMENT
_output_desc$ = -524
_i$ = -1044
_newargv$ = -1068
_parm_f$ = -1048
_PARM_FILE$ = -1040
_APARM_FILE$ = -520
_s$ = -4
_func$ = 8
_program$ = 12
_argv$ = 16
_pid$ = -8
_input_desc$ = -528
_pexecute PROC NEAR
; Line 742
	push	ebp
	mov	ebp, esp
	sub	esp, 1068				; 0000042cH
	push	ebx
	push	esi
	push	edi
; Line 745
	mov	eax, DWORD PTR _last_pipe_input
	mov	DWORD PTR _input_desc$[ebp], eax
; Line 746
	mov	DWORD PTR _output_desc$[ebp], 1
; Line 754
	mov	eax, DWORD PTR _program$[ebp]
	push	eax
	call	_strlen
	add	esp, 4
	add	eax, 5
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _s$[ebp], eax
; Line 755
	mov	eax, DWORD PTR _program$[ebp]
	push	eax
	mov	eax, DWORD PTR _s$[ebp]
	push	eax
	call	_strcpy
	add	esp, 8
; Line 757
	mov	eax, DWORD PTR _temp_filename
	push	eax
	push	OFFSET $SG584
	lea	eax, DWORD PTR _PARM_FILE$[ebp]
	push	eax
	call	_sprintf
	add	esp, 12					; 0000000cH
; Line 759
	push	OFFSET $SG585
	lea	eax, DWORD PTR _PARM_FILE$[ebp]
	push	eax
	call	_fopen
	add	esp, 8
	mov	DWORD PTR _parm_f$[ebp], eax
; Line 760
	cmp	DWORD PTR _parm_f$[ebp], 0
	jne	$L586
; Line 762
	mov	eax, DWORD PTR _argv$[ebp]
	push	eax
	mov	eax, DWORD PTR _s$[ebp]
	push	eax
	push	0
	call	DWORD PTR _func$[ebp]
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _pid$[ebp], eax
; Line 764
	jmp	$L587
$L586:
; Line 766
	mov	DWORD PTR _i$[ebp], 1
	jmp	$L588
$L589:
	inc	DWORD PTR _i$[ebp]
$L588:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _argv$[ebp]
	cmp	DWORD PTR [ecx+eax*4], 0
	je	$L590
; Line 768
	mov	eax, DWORD PTR _parm_f$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _argv$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	call	_fputs
	add	esp, 8
; Line 769
	mov	eax, DWORD PTR _parm_f$[ebp]
	push	eax
	push	10					; 0000000aH
	call	_fputc
	add	esp, 8
; Line 770
	jmp	$L589
$L590:
; Line 771
	mov	eax, DWORD PTR _parm_f$[ebp]
	push	eax
	call	_fclose
	add	esp, 4
; Line 772
	mov	eax, DWORD PTR _argv$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _newargv$[ebp], eax
; Line 773
	mov	eax, DWORD PTR _temp_filename
	push	eax
	push	OFFSET $SG591
	lea	eax, DWORD PTR _APARM_FILE$[ebp]
	push	eax
	call	_sprintf
	add	esp, 12					; 0000000cH
; Line 774
	lea	eax, DWORD PTR _APARM_FILE$[ebp]
	mov	DWORD PTR _newargv$[ebp+4], eax
; Line 775
	mov	DWORD PTR _newargv$[ebp+8], 0
; Line 777
	mov	eax, DWORD PTR _argv$[ebp]
	push	eax
	mov	eax, DWORD PTR _s$[ebp]
	push	eax
	push	0
	call	DWORD PTR _func$[ebp]
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _pid$[ebp], eax
; Line 778
	lea	eax, DWORD PTR _PARM_FILE$[ebp]
	push	eax
	call	_unlink
	add	esp, 4
; Line 779
$L587:
; Line 780
	cmp	DWORD PTR _pid$[ebp], -1
	jne	$L592
; Line 781
	mov	eax, DWORD PTR _errno
	jmp	$L572
; Line 782
$L592:
	mov	eax, DWORD PTR _pid$[ebp]
	shl	eax, 8
	jmp	$L572
; Line 845
$L572:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_pexecute ENDP
_TEXT	ENDS
PUBLIC	_fatal
PUBLIC	_execute
EXTRN	_free:NEAR
EXTRN	_fprintf:NEAR
EXTRN	_spawnv:NEAR
EXTRN	_spawnvp:NEAR
EXTRN	__iob:BYTE
EXTRN	_fflush:NEAR
_DATA	SEGMENT
	ORG $+1
$SG605	DB	'|', 00H
	ORG $+2
$SG611	DB	'|', 00H
	ORG $+2
$SG621	DB	' %s', 00H
$SG623	DB	' |', 00H
	ORG $+1
$SG624	DB	0aH, 00H
	ORG $+2
$SG645	DB	'Program %s got fatal signal %d.', 00H
_DATA	ENDS
_TEXT	SEGMENT
_i$ = -12
_n_commands$ = -8
_string$ = -4
_commands$ = -16
_j$617 = -24
_string$628 = -28
_ret_code$630 = -32
_status$634 = -40
_pid$635 = -36
_prog$636 = -44
_j$638 = -48
_execute PROC NEAR
; Line 855
	push	ebp
	mov	ebp, esp
	sub	esp, 48					; 00000030H
	push	ebx
	push	esi
	push	edi
; Line 869
	mov	DWORD PTR _n_commands$[ebp], 1
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L601
$L602:
	inc	DWORD PTR _i$[ebp]
$L601:
	mov	eax, DWORD PTR _argbuf_index
	cmp	DWORD PTR _i$[ebp], eax
	jge	$L603
; Line 870
	push	OFFSET $SG605
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _argbuf
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L604
; Line 871
	inc	DWORD PTR _n_commands$[ebp]
; Line 874
$L604:
	jmp	$L602
$L603:
; Line 875
	mov	eax, DWORD PTR _n_commands$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	shl	eax, 2
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _commands$[ebp], eax
; Line 881
	mov	eax, DWORD PTR _argbuf
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _commands$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 882
	mov	eax, DWORD PTR _argbuf
	mov	ecx, DWORD PTR _commands$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 883
	mov	eax, DWORD PTR _commands$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_find_exec_file
	add	esp, 4
	mov	DWORD PTR _string$[ebp], eax
; Line 884
	cmp	DWORD PTR _string$[ebp], 0
	je	$L606
; Line 885
	mov	eax, DWORD PTR _string$[ebp]
	mov	ecx, DWORD PTR _commands$[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	mov	DWORD PTR [ecx], eax
; Line 887
$L606:
	mov	DWORD PTR _n_commands$[ebp], 1
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L607
$L608:
	inc	DWORD PTR _i$[ebp]
$L607:
	mov	eax, DWORD PTR _argbuf_index
	cmp	DWORD PTR _i$[ebp], eax
	jge	$L609
; Line 888
	push	OFFSET $SG611
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _argbuf
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L610
; Line 890
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _argbuf
	mov	DWORD PTR [ecx+eax*4], 0
; Line 891
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _argbuf
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _n_commands$[ebp]
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	edx, DWORD PTR _commands$[ebp]
	mov	DWORD PTR [edx+ecx*4], eax
; Line 892
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax*4+4]
	add	eax, DWORD PTR _argbuf
	mov	ecx, DWORD PTR _n_commands$[ebp]
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	edx, DWORD PTR _commands$[ebp]
	mov	DWORD PTR [edx+ecx*4+4], eax
; Line 893
	mov	eax, DWORD PTR _n_commands$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	mov	ecx, DWORD PTR _commands$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	call	_find_exec_file
	add	esp, 4
	mov	DWORD PTR _string$[ebp], eax
; Line 894
	cmp	DWORD PTR _string$[ebp], 0
	je	$L612
; Line 895
	mov	eax, DWORD PTR _string$[ebp]
	mov	ecx, DWORD PTR _n_commands$[ebp]
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	edx, DWORD PTR _commands$[ebp]
	mov	ecx, DWORD PTR [edx+ecx*4+4]
	mov	DWORD PTR [ecx], eax
; Line 896
$L612:
	inc	DWORD PTR _n_commands$[ebp]
; Line 899
$L610:
	jmp	$L608
$L609:
	mov	eax, DWORD PTR _argbuf_index
	mov	ecx, DWORD PTR _argbuf
	mov	DWORD PTR [ecx+eax*4], 0
; Line 903
	xor	eax, eax
	mov	al, BYTE PTR _vflag
	or	eax, eax
	je	$L613
; Line 906
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L614
$L615:
	inc	DWORD PTR _i$[ebp]
$L614:
	mov	eax, DWORD PTR _n_commands$[ebp]
	cmp	DWORD PTR _i$[ebp], eax
	jge	$L616
; Line 910
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	mov	ecx, DWORD PTR _commands$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	DWORD PTR _j$617[ebp], eax
	jmp	$L618
$L619:
	add	DWORD PTR _j$617[ebp], 4
$L618:
	mov	eax, DWORD PTR _j$617[ebp]
	cmp	DWORD PTR [eax], 0
	je	$L620
; Line 911
	mov	eax, DWORD PTR _j$617[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	push	OFFSET $SG621
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
	jmp	$L619
$L620:
; Line 914
	mov	eax, DWORD PTR _i$[ebp]
	inc	eax
	cmp	eax, DWORD PTR _n_commands$[ebp]
	je	$L622
; Line 915
	push	OFFSET $SG623
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 8
; Line 916
$L622:
	push	OFFSET $SG624
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 8
; Line 917
	jmp	$L615
$L616:
; Line 918
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fflush
	add	esp, 4
; Line 932
$L613:
	mov	DWORD PTR _last_pipe_input, 0
; Line 933
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L625
$L626:
	inc	DWORD PTR _i$[ebp]
$L625:
	mov	eax, DWORD PTR _n_commands$[ebp]
	cmp	DWORD PTR _i$[ebp], eax
	jge	$L627
; Line 936
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	mov	ecx, DWORD PTR _commands$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _string$628[ebp], eax
; Line 944
	mov	eax, DWORD PTR _i$[ebp]
	inc	eax
	cmp	eax, DWORD PTR _n_commands$[ebp]
	mov	eax, 0
	setl	al
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	mov	ecx, DWORD PTR _commands$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	push	eax
	mov	eax, DWORD PTR _string$628[ebp]
	push	eax
	mov	eax, OFFSET _spawnv
	mov	ecx, DWORD PTR _i$[ebp]
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	edx, DWORD PTR _commands$[ebp]
	mov	ebx, DWORD PTR _string$628[ebp]
	cmp	DWORD PTR [edx+ecx*4], ebx
	jne	$L1128
	mov	eax, OFFSET _spawnvp
$L1128:
	push	eax
	call	_pexecute
	add	esp, 16					; 00000010H
	mov	ecx, DWORD PTR _i$[ebp]
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	edx, DWORD PTR _commands$[ebp]
	mov	DWORD PTR [edx+ecx*4+8], eax
; Line 946
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	mov	ecx, DWORD PTR _commands$[ebp]
	mov	edx, DWORD PTR _string$628[ebp]
	cmp	DWORD PTR [ecx+eax*4], edx
	je	$L629
; Line 947
	mov	eax, DWORD PTR _string$628[ebp]
	push	eax
	call	_free
	add	esp, 4
; Line 948
$L629:
	jmp	$L626
$L627:
; Line 950
	inc	DWORD PTR _execution_count
; Line 957
	mov	DWORD PTR _ret_code$630[ebp], 0
; Line 959
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L631
$L632:
	inc	DWORD PTR _i$[ebp]
$L631:
	mov	eax, DWORD PTR _n_commands$[ebp]
	cmp	DWORD PTR _i$[ebp], eax
	jge	$L633
; Line 966
	mov	eax, DWORD PTR _commands$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _status$634[ebp], eax
	mov	eax, DWORD PTR _status$634[ebp]
	mov	DWORD PTR _pid$635[ebp], eax
; Line 973
	cmp	DWORD PTR _status$634[ebp], 0
	je	$L637
; Line 976
	mov	DWORD PTR _j$638[ebp], 0
	jmp	$L639
$L640:
	inc	DWORD PTR _j$638[ebp]
$L639:
	mov	eax, DWORD PTR _n_commands$[ebp]
	cmp	DWORD PTR _j$638[ebp], eax
	jge	$L641
; Line 977
	mov	eax, DWORD PTR _j$638[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	mov	ecx, DWORD PTR _commands$[ebp]
	mov	edx, DWORD PTR _pid$635[ebp]
	cmp	DWORD PTR [ecx+eax*4+8], edx
	jne	$L642
; Line 978
	mov	eax, DWORD PTR _j$638[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	mov	ecx, DWORD PTR _commands$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _prog$636[ebp], eax
; Line 980
$L642:
	jmp	$L640
$L641:
	test	BYTE PTR _status$634[ebp], 127		; 0000007fH
	je	$L643
; Line 981
	mov	eax, DWORD PTR _status$634[ebp]
	and	eax, 127				; 0000007fH
	push	eax
	mov	eax, DWORD PTR _prog$636[ebp]
	push	eax
	push	OFFSET $SG645
	call	_fatal
	add	esp, 12					; 0000000cH
; Line 982
$L643:
	mov	eax, DWORD PTR _status$634[ebp]
	and	eax, 65280				; 0000ff00H
	mov	ecx, 256				; 00000100H
	and	ecx, -256				; ffffff00H
	cmp	eax, ecx
	jl	$L646
; Line 983
	mov	DWORD PTR _ret_code$630[ebp], -1
; Line 984
$L646:
; Line 985
$L637:
	jmp	$L632
$L633:
; Line 986
	mov	eax, DWORD PTR _ret_code$630[ebp]
	jmp	$L594
; Line 988
$L594:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_execute ENDP
_TEXT	ENDS
PUBLIC	_process_command
_DATA	SEGMENT
$SG658	DB	'GCCBIN', 00H
	ORG $+1
$SG666	DB	'/', 00H
	ORG $+2
$SG668	DB	'GCC_EXEC_PREFIX', 00H
$SG687	DB	'Tdata', 00H
	ORG $+2
$SG701	DB	'Tdata', 00H
_DATA	ENDS
_TEXT	SEGMENT
_argc$ = 8
_argv$ = 12
_i$ = -4
_cp$660 = -8
_p$673 = -12
_c$674 = -16
_p$693 = -20
_c$694 = -24
_process_command PROC NEAR
; Line 1026
	push	ebp
	mov	ebp, esp
	sub	esp, 28					; 0000001cH
	push	ebx
	push	esi
	push	edi
; Line 1029
	mov	DWORD PTR _n_switches, 0
; Line 1030
	mov	DWORD PTR _n_infiles, 0
; Line 1034
	push	OFFSET $SG658
	call	_getenv
	add	esp, 4
	mov	DWORD PTR _env_exec_prefix, eax
; Line 1035
	cmp	DWORD PTR _env_exec_prefix, 0
	je	$L659
; Line 1038
	mov	eax, DWORD PTR _env_exec_prefix
	mov	DWORD PTR _cp$660[ebp], eax
	jmp	$L661
$L662:
	inc	DWORD PTR _cp$660[ebp]
$L661:
	mov	eax, DWORD PTR _cp$660[ebp]
	movsx	eax, BYTE PTR [eax]
	or	eax, eax
	je	$L663
; Line 1039
	mov	eax, DWORD PTR _cp$660[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 92					; 0000005cH
	jne	$L664
	mov	eax, DWORD PTR _cp$660[ebp]
	mov	BYTE PTR [eax], 47			; 0000002fH
; Line 1040
$L664:
	jmp	$L662
$L663:
	mov	eax, DWORD PTR _cp$660[ebp]
	movsx	eax, BYTE PTR [eax-1]
	cmp	eax, 47					; 0000002fH
	je	$L665
; Line 1042
	mov	eax, DWORD PTR _env_exec_prefix
	push	eax
	call	_strlen
	add	esp, 4
	add	eax, 2
	push	eax
	call	_malloc
	add	esp, 4
	mov	DWORD PTR _cp$660[ebp], eax
; Line 1043
	mov	eax, DWORD PTR _env_exec_prefix
	push	eax
	mov	eax, DWORD PTR _cp$660[ebp]
	push	eax
	call	_strcpy
	add	esp, 8
; Line 1044
	push	OFFSET $SG666
	mov	eax, DWORD PTR _cp$660[ebp]
	push	eax
	call	_strcat
	add	esp, 8
; Line 1045
	mov	eax, DWORD PTR _cp$660[ebp]
	mov	DWORD PTR _env_exec_prefix, eax
; Line 1047
$L665:
; Line 1049
$L659:
	cmp	DWORD PTR _env_exec_prefix, 0
	jne	$L667
; Line 1052
	push	OFFSET $SG668
	call	_getenv
	add	esp, 4
	mov	DWORD PTR _env_exec_prefix, eax
; Line 1058
$L667:
	mov	DWORD PTR _i$[ebp], 1
	jmp	$L669
$L670:
	inc	DWORD PTR _i$[ebp]
$L669:
	mov	eax, DWORD PTR _argc$[ebp]
	cmp	DWORD PTR _i$[ebp], eax
	jge	$L671
; Line 1060
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _argv$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 45					; 0000002dH
	jne	$L672
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _argv$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	movsx	eax, BYTE PTR [eax+1]
	cmp	eax, 108				; 0000006cH
	je	$L672
; Line 1062
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _argv$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	inc	eax
	mov	DWORD PTR _p$673[ebp], eax
; Line 1063
	mov	eax, DWORD PTR _p$673[ebp]
	movsx	eax, BYTE PTR [eax]
	mov	DWORD PTR _c$674[ebp], eax
; Line 1065
	mov	eax, DWORD PTR _c$674[ebp]
	mov	DWORD PTR -28+[ebp], eax
	jmp	$L675
; Line 1067
$L679:
; Line 1068
	mov	eax, DWORD PTR _p$673[ebp]
	inc	eax
	mov	DWORD PTR _machine_suffix, eax
; Line 1069
	jmp	$L676
; Line 1071
$L680:
; Line 1072
	mov	eax, DWORD PTR _p$673[ebp]
	inc	eax
	mov	DWORD PTR _user_exec_prefix, eax
; Line 1073
	jmp	$L676
; Line 1075
$L681:
; Line 1076
	inc	BYTE PTR _vflag
; Line 1077
	inc	DWORD PTR _n_switches
; Line 1078
	jmp	$L676
; Line 1080
$L682:
; Line 1081
	inc	DWORD PTR _n_switches
; Line 1083
	cmp	DWORD PTR _c$674[ebp], 68		; 00000044H
	je	$L684
	cmp	DWORD PTR _c$674[ebp], 85		; 00000055H
	je	$L684
	cmp	DWORD PTR _c$674[ebp], 111		; 0000006fH
	je	$L684
	cmp	DWORD PTR _c$674[ebp], 101		; 00000065H
	je	$L684
	cmp	DWORD PTR _c$674[ebp], 84		; 00000054H
	je	$L684
	cmp	DWORD PTR _c$674[ebp], 117		; 00000075H
	je	$L684
	cmp	DWORD PTR _c$674[ebp], 73		; 00000049H
	je	$L684
	cmp	DWORD PTR _c$674[ebp], 89		; 00000059H
	je	$L684
	cmp	DWORD PTR _c$674[ebp], 109		; 0000006dH
	je	$L684
	cmp	DWORD PTR _c$674[ebp], 76		; 0000004cH
	je	$L684
	cmp	DWORD PTR _c$674[ebp], 105		; 00000069H
	je	$L684
	cmp	DWORD PTR _c$674[ebp], 65		; 00000041H
	jne	$L683
$L684:
	mov	eax, DWORD PTR _p$673[ebp]
	movsx	eax, BYTE PTR [eax+1]
	or	eax, eax
	jne	$L683
; Line 1084
	inc	DWORD PTR _i$[ebp]
; Line 1085
	jmp	$L685
$L683:
	push	OFFSET $SG687
	mov	eax, DWORD PTR _p$673[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L686
; Line 1086
	inc	DWORD PTR _i$[ebp]
; Line 1087
$L686:
$L685:
	jmp	$L676
$L675:
	cmp	DWORD PTR -28+[ebp], 66			; 00000042H
	je	$L680
	cmp	DWORD PTR -28+[ebp], 98			; 00000062H
	je	$L679
	cmp	DWORD PTR -28+[ebp], 118		; 00000076H
	je	$L681
	jmp	$L682
$L676:
; Line 1089
	jmp	$L688
$L672:
; Line 1090
	inc	DWORD PTR _n_infiles
$L688:
; Line 1091
	jmp	$L670
$L671:
; Line 1096
	mov	eax, DWORD PTR _n_switches
	lea	eax, DWORD PTR [eax+eax*2+3]
	shl	eax, 2
	push	eax
	call	_xmalloc
	add	esp, 4
	mov	DWORD PTR _switches, eax
; Line 1097
	mov	eax, DWORD PTR _n_infiles
	lea	eax, DWORD PTR [eax*4+4]
	push	eax
	call	_xmalloc
	add	esp, 4
	mov	DWORD PTR _infiles, eax
; Line 1098
	mov	DWORD PTR _n_switches, 0
; Line 1099
	mov	DWORD PTR _n_infiles, 0
; Line 1105
	mov	DWORD PTR _i$[ebp], 1
	jmp	$L689
$L690:
	inc	DWORD PTR _i$[ebp]
$L689:
	mov	eax, DWORD PTR _argc$[ebp]
	cmp	DWORD PTR _i$[ebp], eax
	jge	$L691
; Line 1107
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _argv$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 45					; 0000002dH
	jne	$L692
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _argv$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	movsx	eax, BYTE PTR [eax+1]
	cmp	eax, 108				; 0000006cH
	je	$L692
; Line 1109
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _argv$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	inc	eax
	mov	DWORD PTR _p$693[ebp], eax
; Line 1110
	mov	eax, DWORD PTR _p$693[ebp]
	movsx	eax, BYTE PTR [eax]
	mov	DWORD PTR _c$694[ebp], eax
; Line 1112
	cmp	DWORD PTR _c$694[ebp], 66		; 00000042H
	je	$L696
	cmp	DWORD PTR _c$694[ebp], 98		; 00000062H
	jne	$L695
$L696:
; Line 1113
	jmp	$L690
; Line 1114
$L695:
	mov	eax, DWORD PTR _p$693[ebp]
	mov	ecx, DWORD PTR _n_switches
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	edx, DWORD PTR _switches
	mov	DWORD PTR [edx+ecx*4], eax
; Line 1116
	cmp	DWORD PTR _c$694[ebp], 68		; 00000044H
	je	$L700
	cmp	DWORD PTR _c$694[ebp], 85		; 00000055H
	je	$L700
	cmp	DWORD PTR _c$694[ebp], 111		; 0000006fH
	je	$L700
	cmp	DWORD PTR _c$694[ebp], 101		; 00000065H
	je	$L700
	cmp	DWORD PTR _c$694[ebp], 84		; 00000054H
	je	$L700
	cmp	DWORD PTR _c$694[ebp], 117		; 00000075H
	je	$L700
	cmp	DWORD PTR _c$694[ebp], 73		; 00000049H
	je	$L700
	cmp	DWORD PTR _c$694[ebp], 89		; 00000059H
	je	$L700
	cmp	DWORD PTR _c$694[ebp], 109		; 0000006dH
	je	$L700
	cmp	DWORD PTR _c$694[ebp], 76		; 0000004cH
	je	$L700
	cmp	DWORD PTR _c$694[ebp], 105		; 00000069H
	je	$L700
	cmp	DWORD PTR _c$694[ebp], 65		; 00000041H
	jne	$L699
$L700:
	mov	eax, DWORD PTR _p$693[ebp]
	movsx	eax, BYTE PTR [eax+1]
	or	eax, eax
	je	$L698
$L699:
	push	OFFSET $SG701
	mov	eax, DWORD PTR _p$693[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L697
$L698:
; Line 1117
	inc	DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _argv$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _n_switches
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	edx, DWORD PTR _switches
	mov	DWORD PTR [edx+ecx*4+4], eax
; Line 1118
	jmp	$L702
$L697:
	cmp	DWORD PTR _c$694[ebp], 111		; 0000006fH
	jne	$L703
; Line 1121
	mov	eax, DWORD PTR _p$693[ebp]
	push	eax
	call	_strlen
	add	esp, 4
	push	eax
	call	_xmalloc
	add	esp, 4
	mov	ecx, DWORD PTR _n_switches
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	edx, DWORD PTR _switches
	mov	DWORD PTR [edx+ecx*4+4], eax
; Line 1122
	mov	eax, DWORD PTR _p$693[ebp]
	inc	eax
	push	eax
	mov	eax, DWORD PTR _n_switches
	lea	eax, DWORD PTR [eax+eax*2]
	mov	ecx, DWORD PTR _switches
	mov	eax, DWORD PTR [ecx+eax*4+4]
	push	eax
	call	_strcpy
	add	esp, 8
; Line 1123
	mov	eax, DWORD PTR _p$693[ebp]
	mov	BYTE PTR [eax+1], 0
; Line 1124
	jmp	$L704
$L703:
; Line 1125
	mov	eax, DWORD PTR _n_switches
	lea	eax, DWORD PTR [eax+eax*2]
	mov	ecx, DWORD PTR _switches
	mov	DWORD PTR [ecx+eax*4+4], 0
$L704:
$L702:
; Line 1126
	mov	eax, DWORD PTR _n_switches
	lea	eax, DWORD PTR [eax+eax*2]
	mov	ecx, DWORD PTR _switches
	mov	DWORD PTR [ecx+eax*4+8], 0
; Line 1127
	inc	DWORD PTR _n_switches
; Line 1129
	jmp	$L705
$L692:
; Line 1130
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _argv$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _n_infiles
	mov	edx, DWORD PTR _infiles
	mov	DWORD PTR [edx+ecx*4], eax
	inc	DWORD PTR _n_infiles
$L705:
; Line 1131
	jmp	$L690
$L691:
; Line 1133
	mov	eax, DWORD PTR _n_switches
	lea	eax, DWORD PTR [eax+eax*2]
	mov	ecx, DWORD PTR _switches
	mov	DWORD PTR [ecx+eax*4], 0
; Line 1134
	mov	eax, DWORD PTR _n_infiles
	mov	ecx, DWORD PTR _infiles
	mov	DWORD PTR [ecx+eax*4], 0
; Line 1135
$L656:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_process_command ENDP
_TEXT	ENDS
PUBLIC	_do_spec
PUBLIC	_do_spec_1
_DATA	SEGMENT
	ORG $+2
$SG720	DB	'|', 00H
_DATA	ENDS
_TEXT	SEGMENT
_spec$ = 8
_value$ = -4
_do_spec PROC NEAR
; Line 1177
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 1180
	call	_clear_args
; Line 1181
	mov	DWORD PTR _arg_going, 0
; Line 1182
	mov	DWORD PTR _delete_this_arg, 0
; Line 1183
	mov	DWORD PTR _this_is_output_file, 0
; Line 1184
	mov	DWORD PTR _this_is_library_file, 0
; Line 1186
	push	0
	mov	eax, DWORD PTR _spec$[ebp]
	push	eax
	call	_do_spec_1
	add	esp, 8
	mov	DWORD PTR _value$[ebp], eax
; Line 1190
	cmp	DWORD PTR _value$[ebp], 0
	jne	$L718
; Line 1192
	cmp	DWORD PTR _argbuf_index, 0
	jle	$L719
	push	OFFSET $SG720
	mov	eax, DWORD PTR _argbuf_index
	mov	ecx, DWORD PTR _argbuf
	mov	eax, DWORD PTR [ecx+eax*4-4]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L719
; Line 1193
	dec	DWORD PTR _argbuf_index
; Line 1195
$L719:
	cmp	DWORD PTR _argbuf_index, 0
	jle	$L721
; Line 1196
	call	_execute
	mov	DWORD PTR _value$[ebp], eax
; Line 1197
$L721:
; Line 1199
$L718:
	mov	eax, DWORD PTR _value$[ebp]
	jmp	$L716
; Line 1200
$L716:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_do_spec ENDP
_TEXT	ENDS
PUBLIC	_error
PUBLIC	_handle_braces
PUBLIC	_find_file
EXTRN	_memcpy:NEAR
EXTRN	_strncpy:NEAR
EXTRN	__obstack_newchunk:NEAR
EXTRN	_abort:NEAR
EXTRN	_strncmp:NEAR
_DATA	SEGMENT
	ORG $+2
$SG741	DB	'|', 00H
	ORG $+2
$SG747	DB	'pipe', 00H
	ORG $+3
$SG767	DB	'Invalid specification!  Bug in cc.', 00H
	ORG $+1
$SG779	DB	'%s', 00H
	ORG $+1
$SG798	DB	00H
	ORG $+3
$SG800	DB	00H
	ORG $+3
$SG802	DB	'%{funsigned-char:-D__CHAR_UNSIGNED__}', 00H
	ORG $+2
$SG804	DB	00H
	ORG $+3
$SG806	DB	00H
	ORG $+3
$SG808	DB	'%{!p:%{!pg:-lc}}%{p:-lc_p}%{pg:-lc_p}', 00H
	ORG $+2
$SG810	DB	'%{g:-lg}', 00H
	ORG $+3
$SG812	DB	'-Dunix -Di386', 00H
	ORG $+2
$SG815	DB	'-Dunix -Di386', 00H
	ORG $+2
$SG818	DB	'-Dunix -Di386', 00H
	ORG $+2
$SG824	DB	'-D', 00H
	ORG $+1
$SG832	DB	'%{pg:gcrt0.o%s}%{!pg:%{p:mcrt0.o%s}%{!p:crt0.o%s}}', 00H
	ORG $+1
$SG834	DB	00H
_DATA	ENDS
_TEXT	SEGMENT
_q$772 = -24
_buf$773 = -28
_f$783 = -32
_spec$ = 8
_inswitch$ = 12
_index$789 = -36
_p$ = -4
_c$ = -12
_string$ = -8
_i$742 = -16
_x$814 = -40
_value$751 = -20
_buf$816 = -48
_y$817 = -44
_do_spec_1 PROC NEAR
; Line 1218
	push	ebp
	mov	ebp, esp
	sub	esp, 60					; 0000003cH
	push	ebx
	push	esi
	push	edi
; Line 1219
	mov	eax, DWORD PTR _spec$[ebp]
	mov	DWORD PTR _p$[ebp], eax
; Line 1223
$L729:
	mov	eax, DWORD PTR _p$[ebp]
	movsx	eax, BYTE PTR [eax]
	mov	DWORD PTR _c$[ebp], eax
	inc	DWORD PTR _p$[ebp]
	cmp	DWORD PTR _c$[ebp], 0
	je	$L730
; Line 1226
	cmp	DWORD PTR _inswitch$[ebp], 0
	je	$L1129
	mov	DWORD PTR -52+[ebp], 97			; 00000061H
	jmp	$L1130
$L1129:
	mov	eax, DWORD PTR _c$[ebp]
	mov	DWORD PTR -52+[ebp], eax
$L1130:
	mov	eax, DWORD PTR -52+[ebp]
	mov	DWORD PTR -56+[ebp], eax
	jmp	$L731
; Line 1228
$L735:
; Line 1231
	cmp	DWORD PTR _arg_going, 0
	je	$L736
; Line 1233
	mov	eax, DWORD PTR _obstack+12
	inc	eax
	cmp	eax, DWORD PTR _obstack+16
	jbe	$L1131
	push	1
	push	OFFSET _obstack
	call	__obstack_newchunk
	add	esp, 8
	jmp	$L1132
$L1131:
$L1132:
	mov	eax, DWORD PTR _obstack+12
	mov	BYTE PTR [eax], 0
	inc	DWORD PTR _obstack+12
; Line 1234
	mov	eax, DWORD PTR _obstack+8
	mov	DWORD PTR _obstack+20, eax
	mov	eax, DWORD PTR _obstack+12
	add	eax, DWORD PTR _obstack+24
	mov	ecx, DWORD PTR _obstack+24
	not	ecx
	and	eax, ecx
	mov	DWORD PTR _obstack+12, eax
	mov	eax, DWORD PTR _obstack+12
	sub	eax, DWORD PTR _obstack+4
	mov	ecx, DWORD PTR _obstack+16
	sub	ecx, DWORD PTR _obstack+4
	cmp	eax, ecx
	jle	$L1133
	mov	eax, DWORD PTR _obstack+16
	mov	DWORD PTR _obstack+12, eax
	jmp	$L1134
$L1133:
$L1134:
	mov	eax, DWORD PTR _obstack+12
	mov	DWORD PTR _obstack+8, eax
	mov	eax, DWORD PTR _obstack+20
	mov	DWORD PTR _string$[ebp], eax
; Line 1235
	cmp	DWORD PTR _this_is_library_file, 0
	je	$L738
; Line 1236
	mov	eax, DWORD PTR _string$[ebp]
	push	eax
	call	_find_file
	add	esp, 4
	mov	DWORD PTR _string$[ebp], eax
; Line 1237
$L738:
	mov	eax, DWORD PTR _this_is_output_file
	push	eax
	mov	eax, DWORD PTR _delete_this_arg
	push	eax
	mov	eax, DWORD PTR _string$[ebp]
	push	eax
	call	_store_arg
	add	esp, 12					; 0000000cH
; Line 1238
	cmp	DWORD PTR _this_is_output_file, 0
	je	$L739
; Line 1239
	mov	eax, DWORD PTR _string$[ebp]
	mov	ecx, DWORD PTR _input_file_number
	mov	edx, DWORD PTR _outfiles
	mov	DWORD PTR [edx+ecx*4], eax
; Line 1240
$L739:
; Line 1241
$L736:
	mov	DWORD PTR _arg_going, 0
; Line 1243
	cmp	DWORD PTR _argbuf_index, 0
	jle	$L740
	push	OFFSET $SG741
	mov	eax, DWORD PTR _argbuf_index
	mov	ecx, DWORD PTR _argbuf
	mov	eax, DWORD PTR [ecx+eax*4-4]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L740
; Line 1246
	mov	DWORD PTR _i$742[ebp], 0
	jmp	$L743
$L744:
	inc	DWORD PTR _i$742[ebp]
$L743:
	mov	eax, DWORD PTR _n_switches
	cmp	DWORD PTR _i$742[ebp], eax
	jge	$L745
; Line 1247
	push	OFFSET $SG747
	mov	eax, DWORD PTR _i$742[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	mov	ecx, DWORD PTR _switches
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L746
; Line 1248
	jmp	$L745
; Line 1253
$L746:
	jmp	$L744
$L745:
	mov	eax, DWORD PTR _n_switches
	cmp	DWORD PTR _i$742[ebp], eax
	jge	$L748
; Line 1255
	mov	eax, DWORD PTR _i$742[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	mov	ecx, DWORD PTR _switches
	mov	DWORD PTR [ecx+eax*4+8], 1
; Line 1256
	jmp	$L732
; Line 1258
	jmp	$L749
$L748:
; Line 1259
	dec	DWORD PTR _argbuf_index
$L749:
; Line 1262
$L740:
	cmp	DWORD PTR _argbuf_index, 0
	jle	$L750
; Line 1264
	call	_execute
	mov	DWORD PTR _value$751[ebp], eax
; Line 1265
	cmp	DWORD PTR _value$751[ebp], 0
	je	$L752
; Line 1266
	mov	eax, DWORD PTR _value$751[ebp]
	jmp	$L724
; Line 1267
$L752:
; Line 1269
$L750:
	call	_clear_args
; Line 1270
	mov	DWORD PTR _arg_going, 0
; Line 1271
	mov	DWORD PTR _delete_this_arg, 0
; Line 1272
	mov	DWORD PTR _this_is_output_file, 0
; Line 1273
	mov	DWORD PTR _this_is_library_file, 0
; Line 1274
	jmp	$L732
; Line 1276
$L753:
; Line 1278
	cmp	DWORD PTR _arg_going, 0
	je	$L754
; Line 1280
	mov	eax, DWORD PTR _obstack+12
	inc	eax
	cmp	eax, DWORD PTR _obstack+16
	jbe	$L1135
	push	1
	push	OFFSET _obstack
	call	__obstack_newchunk
	add	esp, 8
	jmp	$L1136
$L1135:
$L1136:
	mov	eax, DWORD PTR _obstack+12
	mov	BYTE PTR [eax], 0
	inc	DWORD PTR _obstack+12
; Line 1281
	mov	eax, DWORD PTR _obstack+8
	mov	DWORD PTR _obstack+20, eax
	mov	eax, DWORD PTR _obstack+12
	add	eax, DWORD PTR _obstack+24
	mov	ecx, DWORD PTR _obstack+24
	not	ecx
	and	eax, ecx
	mov	DWORD PTR _obstack+12, eax
	mov	eax, DWORD PTR _obstack+12
	sub	eax, DWORD PTR _obstack+4
	mov	ecx, DWORD PTR _obstack+16
	sub	ecx, DWORD PTR _obstack+4
	cmp	eax, ecx
	jle	$L1137
	mov	eax, DWORD PTR _obstack+16
	mov	DWORD PTR _obstack+12, eax
	jmp	$L1138
$L1137:
$L1138:
	mov	eax, DWORD PTR _obstack+12
	mov	DWORD PTR _obstack+8, eax
	mov	eax, DWORD PTR _obstack+20
	mov	DWORD PTR _string$[ebp], eax
; Line 1282
	cmp	DWORD PTR _this_is_library_file, 0
	je	$L755
; Line 1283
	mov	eax, DWORD PTR _string$[ebp]
	push	eax
	call	_find_file
	add	esp, 4
	mov	DWORD PTR _string$[ebp], eax
; Line 1284
$L755:
	mov	eax, DWORD PTR _this_is_output_file
	push	eax
	mov	eax, DWORD PTR _delete_this_arg
	push	eax
	mov	eax, DWORD PTR _string$[ebp]
	push	eax
	call	_store_arg
	add	esp, 12					; 0000000cH
; Line 1285
	cmp	DWORD PTR _this_is_output_file, 0
	je	$L756
; Line 1286
	mov	eax, DWORD PTR _string$[ebp]
	mov	ecx, DWORD PTR _input_file_number
	mov	edx, DWORD PTR _outfiles
	mov	DWORD PTR [edx+ecx*4], eax
; Line 1287
$L756:
; Line 1290
$L754:
	mov	eax, DWORD PTR _obstack+12
	inc	eax
	cmp	eax, DWORD PTR _obstack+16
	jbe	$L1139
	push	1
	push	OFFSET _obstack
	call	__obstack_newchunk
	add	esp, 8
	jmp	$L1140
$L1139:
$L1140:
	mov	al, BYTE PTR _c$[ebp]
	mov	ecx, DWORD PTR _obstack+12
	mov	BYTE PTR [ecx], al
	inc	DWORD PTR _obstack+12
; Line 1291
	mov	DWORD PTR _arg_going, 1
; Line 1292
	jmp	$L732
; Line 1294
$L757:
; Line 1297
	cmp	DWORD PTR _arg_going, 0
	je	$L758
; Line 1299
	mov	eax, DWORD PTR _obstack+12
	inc	eax
	cmp	eax, DWORD PTR _obstack+16
	jbe	$L1141
	push	1
	push	OFFSET _obstack
	call	__obstack_newchunk
	add	esp, 8
	jmp	$L1142
$L1141:
$L1142:
	mov	eax, DWORD PTR _obstack+12
	mov	BYTE PTR [eax], 0
	inc	DWORD PTR _obstack+12
; Line 1300
	mov	eax, DWORD PTR _obstack+8
	mov	DWORD PTR _obstack+20, eax
	mov	eax, DWORD PTR _obstack+12
	add	eax, DWORD PTR _obstack+24
	mov	ecx, DWORD PTR _obstack+24
	not	ecx
	and	eax, ecx
	mov	DWORD PTR _obstack+12, eax
	mov	eax, DWORD PTR _obstack+12
	sub	eax, DWORD PTR _obstack+4
	mov	ecx, DWORD PTR _obstack+16
	sub	ecx, DWORD PTR _obstack+4
	cmp	eax, ecx
	jle	$L1143
	mov	eax, DWORD PTR _obstack+16
	mov	DWORD PTR _obstack+12, eax
	jmp	$L1144
$L1143:
$L1144:
	mov	eax, DWORD PTR _obstack+12
	mov	DWORD PTR _obstack+8, eax
	mov	eax, DWORD PTR _obstack+20
	mov	DWORD PTR _string$[ebp], eax
; Line 1301
	cmp	DWORD PTR _this_is_library_file, 0
	je	$L759
; Line 1302
	mov	eax, DWORD PTR _string$[ebp]
	push	eax
	call	_find_file
	add	esp, 4
	mov	DWORD PTR _string$[ebp], eax
; Line 1303
$L759:
	mov	eax, DWORD PTR _this_is_output_file
	push	eax
	mov	eax, DWORD PTR _delete_this_arg
	push	eax
	mov	eax, DWORD PTR _string$[ebp]
	push	eax
	call	_store_arg
	add	esp, 12					; 0000000cH
; Line 1304
	cmp	DWORD PTR _this_is_output_file, 0
	je	$L760
; Line 1305
	mov	eax, DWORD PTR _string$[ebp]
	mov	ecx, DWORD PTR _input_file_number
	mov	edx, DWORD PTR _outfiles
	mov	DWORD PTR [edx+ecx*4], eax
; Line 1306
$L760:
; Line 1308
$L758:
	mov	DWORD PTR _arg_going, 0
; Line 1309
	mov	DWORD PTR _delete_this_arg, 0
; Line 1310
	mov	DWORD PTR _this_is_output_file, 0
; Line 1311
	mov	DWORD PTR _this_is_library_file, 0
; Line 1312
	jmp	$L732
; Line 1314
$L761:
; Line 1315
	mov	eax, DWORD PTR _p$[ebp]
	movsx	eax, BYTE PTR [eax]
	mov	DWORD PTR _c$[ebp], eax
	inc	DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR _c$[ebp]
	mov	DWORD PTR -60+[ebp], eax
	jmp	$L762
; Line 1317
$L766:
; Line 1318
	push	OFFSET $SG767
	call	_fatal
	add	esp, 4
; Line 1320
$L768:
; Line 1321
	mov	eax, DWORD PTR _basename_length
	mov	DWORD PTR _obstack+20, eax
	mov	eax, DWORD PTR _obstack+20
	add	eax, DWORD PTR _obstack+12
	cmp	eax, DWORD PTR _obstack+16
	jbe	$L1145
	mov	eax, DWORD PTR _obstack+20
	push	eax
	push	OFFSET _obstack
	call	__obstack_newchunk
	add	esp, 8
	jmp	$L1146
$L1145:
$L1146:
	mov	eax, DWORD PTR _obstack+20
	push	eax
	mov	eax, DWORD PTR _input_basename
	push	eax
	mov	eax, DWORD PTR _obstack+12
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
	mov	eax, DWORD PTR _obstack+20
	add	DWORD PTR _obstack+12, eax
; Line 1322
	mov	DWORD PTR _arg_going, 1
; Line 1323
	jmp	$L763
; Line 1325
$L770:
; Line 1326
	mov	DWORD PTR _delete_this_arg, 2
; Line 1327
	jmp	$L763
; Line 1329
$L771:
; Line 1333
	mov	eax, DWORD PTR _p$[ebp]
	mov	DWORD PTR _q$772[ebp], eax
; Line 1335
$L775:
	mov	eax, DWORD PTR _p$[ebp]
	movsx	eax, BYTE PTR [eax]
	or	eax, eax
	je	$L776
	mov	eax, DWORD PTR _p$[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 10					; 0000000aH
	je	$L776
	inc	DWORD PTR _p$[ebp]
	jmp	$L775
$L776:
; Line 1336
	mov	eax, DWORD PTR _p$[ebp]
	sub	eax, DWORD PTR _q$772[ebp]
	inc	eax
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _buf$773[ebp], eax
; Line 1337
	mov	eax, DWORD PTR _p$[ebp]
	sub	eax, DWORD PTR _q$772[ebp]
	push	eax
	mov	eax, DWORD PTR _q$772[ebp]
	push	eax
	mov	eax, DWORD PTR _buf$773[ebp]
	push	eax
	call	_strncpy
	add	esp, 12					; 0000000cH
; Line 1338
	mov	eax, DWORD PTR _p$[ebp]
	sub	eax, DWORD PTR _q$772[ebp]
	mov	ecx, DWORD PTR _buf$773[ebp]
	mov	BYTE PTR [eax+ecx], 0
; Line 1339
	mov	eax, DWORD PTR _buf$773[ebp]
	push	eax
	push	OFFSET $SG779
	call	_error
	add	esp, 8
; Line 1340
	mov	eax, -1
	jmp	$L724
; Line 1342
	jmp	$L763
; Line 1344
$L780:
; Line 1345
	mov	eax, DWORD PTR _temp_filename_length
	mov	DWORD PTR _obstack+20, eax
	mov	eax, DWORD PTR _obstack+20
	add	eax, DWORD PTR _obstack+12
	cmp	eax, DWORD PTR _obstack+16
	jbe	$L1147
	mov	eax, DWORD PTR _obstack+20
	push	eax
	push	OFFSET _obstack
	call	__obstack_newchunk
	add	esp, 8
	jmp	$L1148
$L1147:
$L1148:
	mov	eax, DWORD PTR _obstack+20
	push	eax
	mov	eax, DWORD PTR _temp_filename
	push	eax
	mov	eax, DWORD PTR _obstack+12
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
	mov	eax, DWORD PTR _obstack+20
	add	DWORD PTR _obstack+12, eax
; Line 1346
	mov	DWORD PTR _delete_this_arg, 1
; Line 1347
	mov	DWORD PTR _arg_going, 1
; Line 1348
	jmp	$L763
; Line 1350
$L781:
; Line 1351
	mov	eax, DWORD PTR _input_filename_length
	mov	DWORD PTR _obstack+20, eax
	mov	eax, DWORD PTR _obstack+20
	add	eax, DWORD PTR _obstack+12
	cmp	eax, DWORD PTR _obstack+16
	jbe	$L1149
	mov	eax, DWORD PTR _obstack+20
	push	eax
	push	OFFSET _obstack
	call	__obstack_newchunk
	add	esp, 8
	jmp	$L1150
$L1149:
$L1150:
	mov	eax, DWORD PTR _obstack+20
	push	eax
	mov	eax, DWORD PTR _input_filename
	push	eax
	mov	eax, DWORD PTR _obstack+12
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
	mov	eax, DWORD PTR _obstack+20
	add	DWORD PTR _obstack+12, eax
; Line 1352
	mov	DWORD PTR _arg_going, 1
; Line 1353
	jmp	$L763
; Line 1355
$L782:
; Line 1358
	mov	DWORD PTR _f$783[ebp], 0
	jmp	$L784
$L785:
	inc	DWORD PTR _f$783[ebp]
$L784:
	mov	eax, DWORD PTR _n_infiles
	cmp	DWORD PTR _f$783[ebp], eax
	jge	$L786
; Line 1359
	push	0
	push	0
	mov	eax, DWORD PTR _f$783[ebp]
	mov	ecx, DWORD PTR _outfiles
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	call	_store_arg
	add	esp, 12					; 0000000cH
	jmp	$L785
$L786:
; Line 1361
	jmp	$L763
; Line 1363
$L787:
; Line 1364
	mov	DWORD PTR _this_is_library_file, 1
; Line 1365
	jmp	$L763
; Line 1367
$L788:
; Line 1369
	mov	eax, DWORD PTR _argbuf_index
	mov	DWORD PTR _index$789[ebp], eax
; Line 1371
	mov	eax, DWORD PTR _p$[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 123				; 0000007bH
	je	$L790
; Line 1372
	call	_abort
; Line 1373
$L790:
	mov	eax, DWORD PTR _p$[ebp]
	inc	eax
	push	eax
	call	_handle_braces
	add	esp, 4
	mov	DWORD PTR _p$[ebp], eax
; Line 1374
	cmp	DWORD PTR _p$[ebp], 0
	jne	$L791
; Line 1375
	mov	eax, -1
	jmp	$L724
; Line 1378
$L791:
	mov	eax, DWORD PTR _index$789[ebp]
	cmp	DWORD PTR _argbuf_index, eax
	je	$L792
; Line 1379
	push	1
	push	0
	mov	eax, DWORD PTR _argbuf_index
	mov	ecx, DWORD PTR _argbuf
	mov	eax, DWORD PTR [ecx+eax*4-4]
	push	eax
	call	_record_temp_file
	add	esp, 12					; 0000000cH
; Line 1380
$L792:
	jmp	$L763
; Line 1383
$L793:
; Line 1384
	mov	DWORD PTR _this_is_output_file, 1
; Line 1385
	jmp	$L763
; Line 1387
$L794:
; Line 1388
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	call	_handle_braces
	add	esp, 4
	mov	DWORD PTR _p$[ebp], eax
; Line 1389
	cmp	DWORD PTR _p$[ebp], 0
	jne	$L795
; Line 1390
	mov	eax, -1
	jmp	$L724
; Line 1391
$L795:
	jmp	$L763
; Line 1393
$L796:
; Line 1394
	mov	eax, DWORD PTR _obstack+12
	inc	eax
	cmp	eax, DWORD PTR _obstack+16
	jbe	$L1151
	push	1
	push	OFFSET _obstack
	call	__obstack_newchunk
	add	esp, 8
	jmp	$L1152
$L1151:
$L1152:
	mov	eax, DWORD PTR _obstack+12
	mov	BYTE PTR [eax], 37			; 00000025H
	inc	DWORD PTR _obstack+12
; Line 1395
	jmp	$L763
; Line 1399
$L797:
; Line 1400
	push	0
	push	OFFSET $SG798
	call	_do_spec_1
	add	esp, 8
; Line 1401
	jmp	$L763
; Line 1403
$L799:
; Line 1404
	push	0
	push	OFFSET $SG800
	call	_do_spec_1
	add	esp, 8
; Line 1405
	jmp	$L763
; Line 1407
$L801:
; Line 1408
	push	0
	push	OFFSET $SG802
	call	_do_spec_1
	add	esp, 8
; Line 1409
	jmp	$L763
; Line 1411
$L803:
; Line 1412
	push	0
	push	OFFSET $SG804
	call	_do_spec_1
	add	esp, 8
; Line 1413
	jmp	$L763
; Line 1415
$L805:
; Line 1416
	push	0
	push	OFFSET $SG806
	call	_do_spec_1
	add	esp, 8
; Line 1417
	jmp	$L763
; Line 1419
$L807:
; Line 1420
	push	0
	push	OFFSET $SG808
	call	_do_spec_1
	add	esp, 8
; Line 1421
	jmp	$L763
; Line 1423
$L809:
; Line 1424
	push	0
	push	OFFSET $SG810
	call	_do_spec_1
	add	esp, 8
; Line 1425
	jmp	$L763
; Line 1427
$L811:
; Line 1428
	push	0
	push	OFFSET $SG812
	call	_do_spec_1
	add	esp, 8
; Line 1429
	jmp	$L763
; Line 1431
$L813:
; Line 1433
	push	OFFSET $SG815
	call	_strlen
	add	esp, 4
	add	eax, eax
	inc	eax
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _x$814[ebp], eax
; Line 1434
	mov	eax, DWORD PTR _x$814[ebp]
	mov	DWORD PTR _buf$816[ebp], eax
; Line 1435
	mov	DWORD PTR _y$817[ebp], OFFSET $SG818
; Line 1439
$L820:
; Line 1441
	push	2
	push	OFFSET $SG824
	mov	eax, DWORD PTR _y$817[ebp]
	push	eax
	call	_strncmp
	add	esp, 12					; 0000000cH
	or	eax, eax
	jne	$L823
; Line 1443
	mov	eax, DWORD PTR _x$814[ebp]
	mov	BYTE PTR [eax], 45			; 0000002dH
	inc	DWORD PTR _x$814[ebp]
; Line 1444
	mov	eax, DWORD PTR _x$814[ebp]
	mov	BYTE PTR [eax], 68			; 00000044H
	inc	DWORD PTR _x$814[ebp]
; Line 1445
	mov	eax, DWORD PTR _x$814[ebp]
	mov	BYTE PTR [eax], 95			; 0000005fH
	inc	DWORD PTR _x$814[ebp]
; Line 1446
	mov	eax, DWORD PTR _x$814[ebp]
	mov	BYTE PTR [eax], 95			; 0000005fH
	inc	DWORD PTR _x$814[ebp]
; Line 1447
	add	DWORD PTR _y$817[ebp], 2
; Line 1449
	jmp	$L825
$L823:
	mov	eax, DWORD PTR _y$817[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 32					; 00000020H
	je	$L827
	mov	eax, DWORD PTR _y$817[ebp]
	movsx	eax, BYTE PTR [eax]
	or	eax, eax
	jne	$L826
$L827:
; Line 1451
	mov	eax, DWORD PTR _x$814[ebp]
	mov	BYTE PTR [eax], 95			; 0000005fH
	inc	DWORD PTR _x$814[ebp]
; Line 1452
	mov	eax, DWORD PTR _x$814[ebp]
	mov	BYTE PTR [eax], 95			; 0000005fH
	inc	DWORD PTR _x$814[ebp]
; Line 1453
	mov	eax, DWORD PTR _y$817[ebp]
	movsx	eax, BYTE PTR [eax]
	or	eax, eax
	jne	$L828
; Line 1454
	jmp	$L821
; Line 1455
	jmp	$L829
$L828:
; Line 1456
	mov	eax, DWORD PTR _y$817[ebp]
	mov	al, BYTE PTR [eax]
	mov	ecx, DWORD PTR _x$814[ebp]
	mov	BYTE PTR [ecx], al
	inc	DWORD PTR _y$817[ebp]
	inc	DWORD PTR _x$814[ebp]
$L829:
; Line 1458
	jmp	$L830
$L826:
; Line 1459
	mov	eax, DWORD PTR _y$817[ebp]
	mov	al, BYTE PTR [eax]
	mov	ecx, DWORD PTR _x$814[ebp]
	mov	BYTE PTR [ecx], al
	inc	DWORD PTR _y$817[ebp]
	inc	DWORD PTR _x$814[ebp]
$L830:
$L825:
; Line 1460
	jmp	$L820
$L821:
; Line 1461
	mov	eax, DWORD PTR _x$814[ebp]
	mov	BYTE PTR [eax], 0
; Line 1463
	push	0
	mov	eax, DWORD PTR _buf$816[ebp]
	push	eax
	call	_do_spec_1
	add	esp, 8
; Line 1465
	jmp	$L763
; Line 1467
$L831:
; Line 1468
	push	0
	push	OFFSET $SG832
	call	_do_spec_1
	add	esp, 8
; Line 1469
	jmp	$L763
; Line 1471
$L833:
; Line 1472
	push	0
	push	OFFSET $SG834
	call	_do_spec_1
	add	esp, 8
; Line 1473
	jmp	$L763
; Line 1475
$L835:
; Line 1476
	call	_abort
; Line 1477
	jmp	$L763
$L762:
	cmp	DWORD PTR -60+[ebp], 98			; 00000062H
	jg	$L1155
	je	$L768
	cmp	DWORD PTR -60+[ebp], 71			; 00000047H
	jg	$L1156
	je	$L809
	cmp	DWORD PTR -60+[ebp], 0
	je	$L766
	cmp	DWORD PTR -60+[ebp], 37			; 00000025H
	je	$L796
	cmp	DWORD PTR -60+[ebp], 49			; 00000031H
	je	$L797
	cmp	DWORD PTR -60+[ebp], 67			; 00000043H
	je	$L803
	cmp	DWORD PTR -60+[ebp], 69			; 00000045H
	je	$L833
	jmp	$L835
$L1156:
	cmp	DWORD PTR -60+[ebp], 76			; 0000004cH
	je	$L807
	cmp	DWORD PTR -60+[ebp], 80			; 00000050H
	je	$L813
	cmp	DWORD PTR -60+[ebp], 83			; 00000053H
	je	$L831
	cmp	DWORD PTR -60+[ebp], 87			; 00000057H
	je	$L788
	cmp	DWORD PTR -60+[ebp], 97			; 00000061H
	je	$L799
	jmp	$L835
$L1155:
	sub	DWORD PTR -60+[ebp], 99			; 00000063H
	cmp	DWORD PTR -60+[ebp], 24			; 00000018H
	ja	$L835
	shl	DWORD PTR -60+[ebp], 2
	mov	eax, DWORD PTR -60+[ebp]
	jmp	DWORD PTR $L1157[eax]
$L1157:
	DD	OFFSET $L801
	DD	OFFSET $L770
	DD	OFFSET $L771
	DD	OFFSET $L835
	DD	OFFSET $L780
	DD	OFFSET $L835
	DD	OFFSET $L781
	DD	OFFSET $L835
	DD	OFFSET $L835
	DD	OFFSET $L805
	DD	OFFSET $L835
	DD	OFFSET $L835
	DD	OFFSET $L782
	DD	OFFSET $L811
	DD	OFFSET $L835
	DD	OFFSET $L835
	DD	OFFSET $L787
	DD	OFFSET $L835
	DD	OFFSET $L835
	DD	OFFSET $L835
	DD	OFFSET $L793
	DD	OFFSET $L835
	DD	OFFSET $L835
	DD	OFFSET $L835
	DD	OFFSET $L794
$L763:
; Line 1478
	jmp	$L732
; Line 1480
$L836:
; Line 1482
	mov	eax, DWORD PTR _obstack+12
	inc	eax
	cmp	eax, DWORD PTR _obstack+16
	jbe	$L1153
	push	1
	push	OFFSET _obstack
	call	__obstack_newchunk
	add	esp, 8
	jmp	$L1154
$L1153:
$L1154:
	mov	al, BYTE PTR _c$[ebp]
	mov	ecx, DWORD PTR _obstack+12
	mov	BYTE PTR [ecx], al
	inc	DWORD PTR _obstack+12
; Line 1483
	mov	DWORD PTR _arg_going, 1
; Line 1484
	jmp	$L732
$L731:
	cmp	DWORD PTR -56+[ebp], 9
	je	$L757
	cmp	DWORD PTR -56+[ebp], 10			; 0000000aH
	je	$L735
	cmp	DWORD PTR -56+[ebp], 32			; 00000020H
	je	$L757
	cmp	DWORD PTR -56+[ebp], 37			; 00000025H
	je	$L761
	cmp	DWORD PTR -56+[ebp], 124		; 0000007cH
	je	$L753
	jmp	$L836
$L732:
	jmp	$L729
$L730:
; Line 1486
	sub	eax, eax
	jmp	$L724
; Line 1487
$L724:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_do_spec_1 ENDP
_TEXT	ENDS
PUBLIC	_save_string
PUBLIC	_give_switch
_DATA	SEGMENT
	ORG $+3
$SG885	DB	'-', 00H
_DATA	ENDS
_TEXT	SEGMENT
_p$ = 8
_q$ = -8
_filter$ = -16
_pipe$ = -12
_negate$ = -4
_count$849 = -20
_i$860 = -24
_i$867 = -28
_present$868 = -32
_handle_braces PROC NEAR
; Line 1494
	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H
	push	ebx
	push	esi
	push	edi
; Line 1497
	mov	DWORD PTR _pipe$[ebp], 0
; Line 1498
	mov	DWORD PTR _negate$[ebp], 0
; Line 1500
	mov	eax, DWORD PTR _p$[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 124				; 0000007cH
	jne	$L843
; Line 1504
	mov	DWORD PTR _pipe$[ebp], 1
	inc	DWORD PTR _p$[ebp]
; Line 1506
$L843:
	mov	eax, DWORD PTR _p$[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 33					; 00000021H
	jne	$L844
; Line 1509
	mov	DWORD PTR _negate$[ebp], 1
	inc	DWORD PTR _p$[ebp]
; Line 1511
$L844:
	mov	eax, DWORD PTR _p$[ebp]
	mov	DWORD PTR _filter$[ebp], eax
; Line 1512
$L846:
	mov	eax, DWORD PTR _p$[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 58					; 0000003aH
	je	$L847
	mov	eax, DWORD PTR _p$[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 125				; 0000007dH
	je	$L847
	inc	DWORD PTR _p$[ebp]
	jmp	$L846
$L847:
; Line 1513
	mov	eax, DWORD PTR _p$[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 125				; 0000007dH
	je	$L848
; Line 1515
	mov	DWORD PTR _count$849[ebp], 1
; Line 1516
	mov	eax, DWORD PTR _p$[ebp]
	inc	eax
	mov	DWORD PTR _q$[ebp], eax
; Line 1517
$L851:
	cmp	DWORD PTR _count$849[ebp], 0
	jle	$L852
; Line 1519
	mov	eax, DWORD PTR _q$[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 123				; 0000007bH
	jne	$L853
; Line 1520
	inc	DWORD PTR _count$849[ebp]
; Line 1521
	jmp	$L854
$L853:
	mov	eax, DWORD PTR _q$[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 125				; 0000007dH
	jne	$L855
; Line 1522
	dec	DWORD PTR _count$849[ebp]
; Line 1523
	jmp	$L856
$L855:
	mov	eax, DWORD PTR _q$[ebp]
	movsx	eax, BYTE PTR [eax]
	or	eax, eax
	jne	$L857
; Line 1524
	call	_abort
; Line 1525
$L857:
$L856:
$L854:
	inc	DWORD PTR _q$[ebp]
; Line 1526
	jmp	$L851
$L852:
; Line 1528
	jmp	$L858
$L848:
; Line 1529
	mov	eax, DWORD PTR _p$[ebp]
	inc	eax
	mov	DWORD PTR _q$[ebp], eax
$L858:
; Line 1531
	mov	eax, DWORD PTR _p$[ebp]
	movsx	eax, BYTE PTR [eax-1]
	cmp	eax, 42					; 0000002aH
	jne	$L859
	mov	eax, DWORD PTR _p$[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 125				; 0000007dH
	jne	$L859
; Line 1535
	dec	DWORD PTR _p$[ebp]
; Line 1536
	mov	DWORD PTR _i$860[ebp], 0
	jmp	$L861
$L862:
	inc	DWORD PTR _i$860[ebp]
$L861:
	mov	eax, DWORD PTR _n_switches
	cmp	DWORD PTR _i$860[ebp], eax
	jge	$L863
; Line 1537
	mov	eax, DWORD PTR _p$[ebp]
	sub	eax, DWORD PTR _filter$[ebp]
	push	eax
	mov	eax, DWORD PTR _filter$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$860[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	mov	ecx, DWORD PTR _switches
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	call	_strncmp
	add	esp, 12					; 0000000cH
	or	eax, eax
	jne	$L864
; Line 1538
	mov	eax, DWORD PTR _i$860[ebp]
	push	eax
	call	_give_switch
	add	esp, 4
; Line 1539
$L864:
	jmp	$L862
$L863:
; Line 1540
	jmp	$L866
$L859:
; Line 1544
	mov	DWORD PTR _present$868[ebp], 0
; Line 1548
	mov	eax, DWORD PTR _p$[ebp]
	movsx	eax, BYTE PTR [eax-1]
	cmp	eax, 42					; 0000002aH
	jne	$L869
; Line 1550
	mov	DWORD PTR _i$867[ebp], 0
	jmp	$L870
$L871:
	inc	DWORD PTR _i$867[ebp]
$L870:
	mov	eax, DWORD PTR _n_switches
	cmp	DWORD PTR _i$867[ebp], eax
	jge	$L872
; Line 1552
	mov	eax, DWORD PTR _p$[ebp]
	sub	eax, DWORD PTR _filter$[ebp]
	dec	eax
	push	eax
	mov	eax, DWORD PTR _filter$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$867[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	mov	ecx, DWORD PTR _switches
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	call	_strncmp
	add	esp, 12					; 0000000cH
	or	eax, eax
	jne	$L873
; Line 1554
	mov	eax, DWORD PTR _i$867[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	mov	ecx, DWORD PTR _switches
	mov	DWORD PTR [ecx+eax*4+8], 1
; Line 1555
	mov	DWORD PTR _present$868[ebp], 1
; Line 1557
$L873:
	jmp	$L871
$L872:
; Line 1560
	jmp	$L874
$L869:
; Line 1562
	mov	DWORD PTR _i$867[ebp], 0
	jmp	$L875
$L876:
	inc	DWORD PTR _i$867[ebp]
$L875:
	mov	eax, DWORD PTR _n_switches
	cmp	DWORD PTR _i$867[ebp], eax
	jge	$L877
; Line 1565
	mov	eax, DWORD PTR _p$[ebp]
	sub	eax, DWORD PTR _filter$[ebp]
	push	eax
	mov	eax, DWORD PTR _filter$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$867[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	mov	ecx, DWORD PTR _switches
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	call	_strncmp
	add	esp, 12					; 0000000cH
	or	eax, eax
	jne	$L878
	mov	eax, DWORD PTR _i$867[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	mov	ecx, DWORD PTR _switches
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _p$[ebp]
	sub	eax, DWORD PTR _filter$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	or	eax, eax
	jne	$L878
; Line 1567
	mov	eax, DWORD PTR _i$867[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	mov	ecx, DWORD PTR _switches
	mov	DWORD PTR [ecx+eax*4+8], 1
; Line 1568
	mov	DWORD PTR _present$868[ebp], 1
; Line 1569
	jmp	$L877
; Line 1571
$L878:
	jmp	$L876
$L877:
; Line 1572
$L874:
; Line 1577
	mov	eax, DWORD PTR _negate$[ebp]
	cmp	DWORD PTR _present$868[ebp], eax
	je	$L879
; Line 1579
	mov	eax, DWORD PTR _p$[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 125				; 0000007dH
	jne	$L880
; Line 1581
	mov	eax, DWORD PTR _i$867[ebp]
	push	eax
	call	_give_switch
	add	esp, 4
; Line 1583
	jmp	$L881
$L880:
; Line 1585
	push	0
	mov	eax, DWORD PTR _q$[ebp]
	sub	eax, DWORD PTR _p$[ebp]
	sub	eax, 2
	push	eax
	mov	eax, DWORD PTR _p$[ebp]
	inc	eax
	push	eax
	call	_save_string
	add	esp, 8
	push	eax
	call	_do_spec_1
	add	esp, 8
	or	eax, eax
	jge	$L882
; Line 1586
	sub	eax, eax
	jmp	$L838
; Line 1587
$L882:
$L881:
; Line 1589
	jmp	$L883
$L879:
	cmp	DWORD PTR _pipe$[ebp], 0
	je	$L884
; Line 1593
	push	0
	push	OFFSET $SG885
	call	_do_spec_1
	add	esp, 8
; Line 1595
$L884:
$L883:
$L866:
; Line 1597
	mov	eax, DWORD PTR _q$[ebp]
	jmp	$L838
; Line 1598
$L838:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_handle_braces ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+2
$SG888	DB	'-', 00H
	ORG $+2
$SG889	DB	' ', 00H
	ORG $+2
$SG891	DB	' ', 00H
_DATA	ENDS
_TEXT	SEGMENT
_switchnum$ = 8
_give_switch PROC NEAR
; Line 1608
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1609
	push	0
	push	OFFSET $SG888
	call	_do_spec_1
	add	esp, 8
; Line 1610
	push	1
	mov	eax, DWORD PTR _switchnum$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	mov	ecx, DWORD PTR _switches
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	call	_do_spec_1
	add	esp, 8
; Line 1611
	push	0
	push	OFFSET $SG889
	call	_do_spec_1
	add	esp, 8
; Line 1612
	mov	eax, DWORD PTR _switchnum$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	mov	ecx, DWORD PTR _switches
	cmp	DWORD PTR [ecx+eax*4+4], 0
	je	$L890
; Line 1614
	push	1
	mov	eax, DWORD PTR _switchnum$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	mov	ecx, DWORD PTR _switches
	mov	eax, DWORD PTR [ecx+eax*4+4]
	push	eax
	call	_do_spec_1
	add	esp, 8
; Line 1615
	push	0
	push	OFFSET $SG891
	call	_do_spec_1
	add	esp, 8
; Line 1617
$L890:
	mov	eax, DWORD PTR _switchnum$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	mov	ecx, DWORD PTR _switches
	mov	DWORD PTR [ecx+eax*4+8], 1
; Line 1618
$L887:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_give_switch ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+2
$SG928	DB	'./', 00H
	ORG $+1
$SG930	DB	'./', 00H
_DATA	ENDS
_TEXT	SEGMENT
_win$ = -12
_name$ = 8
_size$ = -4
_temp$ = -8
_find_file PROC NEAR
; Line 1627
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 1630
	mov	DWORD PTR _win$[ebp], 0
; Line 1634
	mov	eax, DWORD PTR _standard_exec_prefix
	push	eax
	call	_strlen
	add	esp, 4
	mov	DWORD PTR _size$[ebp], eax
; Line 1635
	cmp	DWORD PTR _user_exec_prefix, 0
	je	$L897
	mov	eax, DWORD PTR _user_exec_prefix
	push	eax
	call	_strlen
	add	esp, 4
	cmp	eax, DWORD PTR _size$[ebp]
	jle	$L897
; Line 1636
	mov	eax, DWORD PTR _user_exec_prefix
	push	eax
	call	_strlen
	add	esp, 4
	mov	DWORD PTR _size$[ebp], eax
; Line 1637
$L897:
	cmp	DWORD PTR _env_exec_prefix, 0
	je	$L898
	mov	eax, DWORD PTR _env_exec_prefix
	push	eax
	call	_strlen
	add	esp, 4
	cmp	eax, DWORD PTR _size$[ebp]
	jle	$L898
; Line 1638
	mov	eax, DWORD PTR _env_exec_prefix
	push	eax
	call	_strlen
	add	esp, 4
	mov	DWORD PTR _size$[ebp], eax
; Line 1639
$L898:
	mov	eax, DWORD PTR _standard_exec_prefix
	push	eax
	call	_strlen
	add	esp, 4
	cmp	eax, DWORD PTR _size$[ebp]
	jle	$L899
; Line 1640
	mov	eax, DWORD PTR _standard_exec_prefix
	push	eax
	call	_strlen
	add	esp, 4
	mov	DWORD PTR _size$[ebp], eax
; Line 1641
$L899:
	mov	eax, DWORD PTR _standard_exec_prefix_1
	push	eax
	call	_strlen
	add	esp, 4
	cmp	eax, DWORD PTR _size$[ebp]
	jle	$L900
; Line 1642
	mov	eax, DWORD PTR _standard_exec_prefix_1
	push	eax
	call	_strlen
	add	esp, 4
	mov	DWORD PTR _size$[ebp], eax
; Line 1643
$L900:
	mov	eax, DWORD PTR _standard_startfile_prefix
	push	eax
	call	_strlen
	add	esp, 4
	cmp	eax, DWORD PTR _size$[ebp]
	jle	$L901
; Line 1644
	mov	eax, DWORD PTR _standard_startfile_prefix
	push	eax
	call	_strlen
	add	esp, 4
	mov	DWORD PTR _size$[ebp], eax
; Line 1645
$L901:
	mov	eax, DWORD PTR _standard_startfile_prefix_1
	push	eax
	call	_strlen
	add	esp, 4
	cmp	eax, DWORD PTR _size$[ebp]
	jle	$L902
; Line 1646
	mov	eax, DWORD PTR _standard_startfile_prefix_1
	push	eax
	call	_strlen
	add	esp, 4
	mov	DWORD PTR _size$[ebp], eax
; Line 1647
$L902:
	mov	eax, DWORD PTR _standard_startfile_prefix_2
	push	eax
	call	_strlen
	add	esp, 4
	cmp	eax, DWORD PTR _size$[ebp]
	jle	$L903
; Line 1648
	mov	eax, DWORD PTR _standard_startfile_prefix_2
	push	eax
	call	_strlen
	add	esp, 4
	mov	DWORD PTR _size$[ebp], eax
; Line 1649
$L903:
	cmp	DWORD PTR _machine_suffix, 0
	je	$L904
; Line 1650
	mov	eax, DWORD PTR _machine_suffix
	push	eax
	call	_strlen
	add	esp, 4
	inc	eax
	add	DWORD PTR _size$[ebp], eax
; Line 1651
$L904:
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_strlen
	add	esp, 4
	inc	eax
	add	DWORD PTR _size$[ebp], eax
; Line 1653
	mov	eax, DWORD PTR _size$[ebp]
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _temp$[ebp], eax
; Line 1655
	cmp	DWORD PTR _user_exec_prefix, 0
	je	$L905
; Line 1657
	cmp	DWORD PTR _machine_suffix, 0
	je	$L906
; Line 1659
	mov	eax, DWORD PTR _user_exec_prefix
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_strcpy
	add	esp, 8
; Line 1660
	mov	eax, DWORD PTR _machine_suffix
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_strcat
	add	esp, 8
; Line 1661
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_strcat
	add	esp, 8
; Line 1662
	push	4
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_access
	add	esp, 8
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	mov	DWORD PTR _win$[ebp], eax
; Line 1664
$L906:
	cmp	DWORD PTR _win$[ebp], 0
	jne	$L907
; Line 1666
	mov	eax, DWORD PTR _user_exec_prefix
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_strcpy
	add	esp, 8
; Line 1667
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_strcat
	add	esp, 8
; Line 1668
	push	4
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_access
	add	esp, 8
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	mov	DWORD PTR _win$[ebp], eax
; Line 1670
$L907:
; Line 1672
$L905:
	cmp	DWORD PTR _win$[ebp], 0
	jne	$L908
	cmp	DWORD PTR _env_exec_prefix, 0
	je	$L908
; Line 1674
	cmp	DWORD PTR _machine_suffix, 0
	je	$L909
; Line 1676
	mov	eax, DWORD PTR _env_exec_prefix
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_strcpy
	add	esp, 8
; Line 1677
	mov	eax, DWORD PTR _machine_suffix
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_strcat
	add	esp, 8
; Line 1678
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_strcat
	add	esp, 8
; Line 1679
	push	4
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_access
	add	esp, 8
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	mov	DWORD PTR _win$[ebp], eax
; Line 1681
$L909:
	cmp	DWORD PTR _win$[ebp], 0
	jne	$L910
; Line 1683
	mov	eax, DWORD PTR _env_exec_prefix
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_strcpy
	add	esp, 8
; Line 1684
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_strcat
	add	esp, 8
; Line 1685
	push	4
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_access
	add	esp, 8
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	mov	DWORD PTR _win$[ebp], eax
; Line 1687
$L910:
; Line 1689
$L908:
	cmp	DWORD PTR _win$[ebp], 0
	jne	$L911
; Line 1691
	cmp	DWORD PTR _machine_suffix, 0
	je	$L912
; Line 1693
	mov	eax, DWORD PTR _standard_exec_prefix
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_strcpy
	add	esp, 8
; Line 1694
	mov	eax, DWORD PTR _machine_suffix
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_strcat
	add	esp, 8
; Line 1695
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_strcat
	add	esp, 8
; Line 1696
	push	4
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_access
	add	esp, 8
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	mov	DWORD PTR _win$[ebp], eax
; Line 1698
$L912:
	cmp	DWORD PTR _win$[ebp], 0
	jne	$L913
; Line 1700
	mov	eax, DWORD PTR _standard_exec_prefix
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_strcpy
	add	esp, 8
; Line 1701
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_strcat
	add	esp, 8
; Line 1702
	push	4
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_access
	add	esp, 8
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	mov	DWORD PTR _win$[ebp], eax
; Line 1704
$L913:
; Line 1706
$L911:
	cmp	DWORD PTR _win$[ebp], 0
	jne	$L914
; Line 1708
	cmp	DWORD PTR _machine_suffix, 0
	je	$L915
; Line 1710
	mov	eax, DWORD PTR _standard_exec_prefix_1
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_strcpy
	add	esp, 8
; Line 1711
	mov	eax, DWORD PTR _machine_suffix
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_strcat
	add	esp, 8
; Line 1712
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_strcat
	add	esp, 8
; Line 1713
	push	4
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_access
	add	esp, 8
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	mov	DWORD PTR _win$[ebp], eax
; Line 1715
$L915:
	cmp	DWORD PTR _win$[ebp], 0
	jne	$L916
; Line 1717
	mov	eax, DWORD PTR _standard_exec_prefix_1
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_strcpy
	add	esp, 8
; Line 1718
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_strcat
	add	esp, 8
; Line 1719
	push	4
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_access
	add	esp, 8
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	mov	DWORD PTR _win$[ebp], eax
; Line 1721
$L916:
; Line 1723
$L914:
	cmp	DWORD PTR _win$[ebp], 0
	jne	$L917
; Line 1725
	cmp	DWORD PTR _machine_suffix, 0
	je	$L918
; Line 1727
	mov	eax, DWORD PTR _standard_startfile_prefix
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_strcpy
	add	esp, 8
; Line 1728
	mov	eax, DWORD PTR _machine_suffix
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_strcat
	add	esp, 8
; Line 1729
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_strcat
	add	esp, 8
; Line 1730
	push	4
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_access
	add	esp, 8
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	mov	DWORD PTR _win$[ebp], eax
; Line 1732
$L918:
	cmp	DWORD PTR _win$[ebp], 0
	jne	$L919
; Line 1734
	mov	eax, DWORD PTR _standard_startfile_prefix
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_strcpy
	add	esp, 8
; Line 1735
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_strcat
	add	esp, 8
; Line 1736
	push	4
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_access
	add	esp, 8
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	mov	DWORD PTR _win$[ebp], eax
; Line 1738
$L919:
; Line 1740
$L917:
	cmp	DWORD PTR _win$[ebp], 0
	jne	$L920
; Line 1742
	cmp	DWORD PTR _machine_suffix, 0
	je	$L921
; Line 1744
	mov	eax, DWORD PTR _standard_startfile_prefix_1
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_strcpy
	add	esp, 8
; Line 1745
	mov	eax, DWORD PTR _machine_suffix
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_strcat
	add	esp, 8
; Line 1746
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_strcat
	add	esp, 8
; Line 1747
	push	4
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_access
	add	esp, 8
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	mov	DWORD PTR _win$[ebp], eax
; Line 1749
$L921:
	cmp	DWORD PTR _win$[ebp], 0
	jne	$L922
; Line 1751
	mov	eax, DWORD PTR _standard_startfile_prefix_1
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_strcpy
	add	esp, 8
; Line 1752
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_strcat
	add	esp, 8
; Line 1753
	push	4
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_access
	add	esp, 8
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	mov	DWORD PTR _win$[ebp], eax
; Line 1755
$L922:
; Line 1757
$L920:
	cmp	DWORD PTR _win$[ebp], 0
	jne	$L923
; Line 1759
	cmp	DWORD PTR _machine_suffix, 0
	je	$L924
; Line 1761
	mov	eax, DWORD PTR _standard_startfile_prefix_2
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_strcpy
	add	esp, 8
; Line 1762
	mov	eax, DWORD PTR _machine_suffix
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_strcat
	add	esp, 8
; Line 1763
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_strcat
	add	esp, 8
; Line 1764
	push	4
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_access
	add	esp, 8
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	mov	DWORD PTR _win$[ebp], eax
; Line 1766
$L924:
	cmp	DWORD PTR _win$[ebp], 0
	jne	$L925
; Line 1768
	mov	eax, DWORD PTR _standard_startfile_prefix_2
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_strcpy
	add	esp, 8
; Line 1769
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_strcat
	add	esp, 8
; Line 1770
	push	4
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_access
	add	esp, 8
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	mov	DWORD PTR _win$[ebp], eax
; Line 1772
$L925:
; Line 1774
$L923:
	cmp	DWORD PTR _win$[ebp], 0
	jne	$L926
; Line 1776
	cmp	DWORD PTR _machine_suffix, 0
	je	$L927
; Line 1778
	push	OFFSET $SG928
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_strcpy
	add	esp, 8
; Line 1779
	mov	eax, DWORD PTR _machine_suffix
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_strcat
	add	esp, 8
; Line 1780
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_strcat
	add	esp, 8
; Line 1781
	push	4
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_access
	add	esp, 8
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	mov	DWORD PTR _win$[ebp], eax
; Line 1783
$L927:
	cmp	DWORD PTR _win$[ebp], 0
	jne	$L929
; Line 1785
	push	OFFSET $SG930
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_strcpy
	add	esp, 8
; Line 1786
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_strcat
	add	esp, 8
; Line 1787
	push	4
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_access
	add	esp, 8
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	mov	DWORD PTR _win$[ebp], eax
; Line 1789
$L929:
; Line 1791
$L926:
	cmp	DWORD PTR _win$[ebp], 0
	je	$L931
; Line 1792
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_strlen
	add	esp, 4
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_save_string
	add	esp, 8
	jmp	$L893
; Line 1793
$L931:
	mov	eax, DWORD PTR _name$[ebp]
	jmp	$L893
; Line 1794
$L893:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_find_file ENDP
_TEXT	ENDS
PUBLIC	_fatal_error
EXTRN	_signal:NEAR
_TEXT	SEGMENT
_signum$ = 8
_fatal_error PROC NEAR
; Line 1801
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1802
	push	0
	mov	eax, DWORD PTR _signum$[ebp]
	push	eax
	call	_signal
	add	esp, 8
; Line 1803
	call	_delete_failure_queue
; Line 1804
	call	_delete_temp_files
; Line 1810
$L934:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_fatal_error ENDP
_TEXT	ENDS
PUBLIC	_validate_all_switches
PUBLIC	_main
EXTRN	_memset:NEAR
EXTRN	_new_argc_argv:NEAR
EXTRN	_exit:NEAR
EXTRN	__obstack_begin:NEAR
EXTRN	_version_string:DWORD
_DATA	SEGMENT
	ORG $+1
$SG946	DB	'GCCLIB', 00H
	ORG $+1
$SG954	DB	'/', 00H
	ORG $+2
$SG958	DB	'gcc version %s', 0aH, 00H
$SG961	DB	'No input files specified.', 00H
	ORG $+2
$SG988	DB	'%s: linker input file unused since linking not done', 00H
$SG993	DB	'unrecognized option `-%s''', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cp$966 = -32
_this_file_error$967 = -36
_p$972 = -40
_tmp$981 = -44
_argc$ = 8
_argv$ = 12
_i$ = -20
_value$ = -16
_error_count$ = -8
_linker_was_run$ = -12
_explicit_link_files$ = -24
_env_lib_path$ = -4
_cp$948 = -28
_main	PROC NEAR
; Line 1816
	push	ebp
	mov	ebp, esp
	sub	esp, 44					; 0000002cH
	push	ebx
	push	esi
	push	edi
; Line 1819
	mov	DWORD PTR _error_count$[ebp], 0
; Line 1820
	mov	DWORD PTR _linker_was_run$[ebp], 0
; Line 1827
	lea	eax, DWORD PTR _argv$[ebp]
	push	eax
	lea	eax, DWORD PTR _argc$[ebp]
	push	eax
	call	_new_argc_argv
	add	esp, 8
; Line 1830
	mov	eax, DWORD PTR _argv$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _programname, eax
; Line 1834
	push	OFFSET $SG946
	call	_getenv
	add	esp, 4
	mov	DWORD PTR _env_lib_path$[ebp], eax
; Line 1835
	cmp	DWORD PTR _env_lib_path$[ebp], 0
	je	$L947
; Line 1838
	mov	eax, DWORD PTR _env_lib_path$[ebp]
	mov	DWORD PTR _cp$948[ebp], eax
	jmp	$L949
$L950:
	inc	DWORD PTR _cp$948[ebp]
$L949:
	mov	eax, DWORD PTR _cp$948[ebp]
	movsx	eax, BYTE PTR [eax]
	or	eax, eax
	je	$L951
; Line 1839
	mov	eax, DWORD PTR _cp$948[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 92					; 0000005cH
	jne	$L952
	mov	eax, DWORD PTR _cp$948[ebp]
	mov	BYTE PTR [eax], 47			; 0000002fH
; Line 1840
$L952:
	jmp	$L950
$L951:
	mov	eax, DWORD PTR _cp$948[ebp]
	movsx	eax, BYTE PTR [eax-1]
	cmp	eax, 47					; 0000002fH
	je	$L953
; Line 1842
	mov	eax, DWORD PTR _env_lib_path$[ebp]
	push	eax
	call	_strlen
	add	esp, 4
	add	eax, 2
	push	eax
	call	_malloc
	add	esp, 4
	mov	DWORD PTR _standard_startfile_prefix, eax
; Line 1843
	mov	eax, DWORD PTR _env_lib_path$[ebp]
	push	eax
	mov	eax, DWORD PTR _standard_startfile_prefix
	push	eax
	call	_strcpy
	add	esp, 8
; Line 1844
	push	OFFSET $SG954
	mov	eax, DWORD PTR _standard_startfile_prefix
	push	eax
	call	_strcat
	add	esp, 8
; Line 1846
$L953:
; Line 1847
	mov	eax, DWORD PTR _standard_startfile_prefix
	mov	DWORD PTR _standard_startfile_prefix_2, eax
	mov	eax, DWORD PTR _standard_startfile_prefix_2
	mov	DWORD PTR _standard_startfile_prefix_1, eax
; Line 1862
$L947:
	mov	DWORD PTR _argbuf_length, 10		; 0000000aH
; Line 1863
	mov	eax, DWORD PTR _argbuf_length
	shl	eax, 2
	push	eax
	call	_xmalloc
	add	esp, 4
	mov	DWORD PTR _argbuf, eax
; Line 1865
	push	OFFSET _free
	push	OFFSET _xmalloc
	push	0
	push	0
	push	OFFSET _obstack
	call	__obstack_begin
	add	esp, 20					; 00000014H
; Line 1867
	call	_choose_temp_base
; Line 1872
	mov	eax, DWORD PTR _argv$[ebp]
	push	eax
	mov	eax, DWORD PTR _argc$[ebp]
	push	eax
	call	_process_command
	add	esp, 8
; Line 1874
	xor	eax, eax
	mov	al, BYTE PTR _vflag
	or	eax, eax
	je	$L956
; Line 1877
	mov	eax, DWORD PTR _version_string
	push	eax
	push	OFFSET $SG958
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 1878
	cmp	DWORD PTR _n_infiles, 0
	jne	$L959
; Line 1879
	push	0
	call	_exit
	add	esp, 4
; Line 1880
$L959:
; Line 1882
$L956:
	cmp	DWORD PTR _n_infiles, 0
	jne	$L960
; Line 1883
	push	OFFSET $SG961
	call	_fatal
	add	esp, 4
; Line 1888
$L960:
	mov	eax, DWORD PTR _n_infiles
	shl	eax, 2
	push	eax
	call	_xmalloc
	add	esp, 4
	mov	DWORD PTR _outfiles, eax
; Line 1889
	mov	eax, DWORD PTR _n_infiles
	shl	eax, 2
	push	eax
	push	0
	mov	eax, DWORD PTR _outfiles
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 1893
	mov	eax, DWORD PTR _n_infiles
	push	eax
	call	_xmalloc
	add	esp, 4
	mov	DWORD PTR _explicit_link_files$[ebp], eax
; Line 1894
	mov	eax, DWORD PTR _n_infiles
	push	eax
	push	0
	mov	eax, DWORD PTR _explicit_link_files$[ebp]
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 1896
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L963
$L964:
	inc	DWORD PTR _i$[ebp]
$L963:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _n_infiles, eax
	jle	$L965
; Line 1899
	mov	DWORD PTR _this_file_error$967[ebp], 0
; Line 1903
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _infiles
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _input_filename, eax
; Line 1904
	mov	eax, DWORD PTR _input_filename
	push	eax
	call	_strlen
	add	esp, 4
	mov	DWORD PTR _input_filename_length, eax
; Line 1905
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _input_file_number, eax
; Line 1909
	mov	eax, DWORD PTR _input_filename
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _outfiles
	mov	DWORD PTR [edx+ecx*4], eax
; Line 1913
	mov	DWORD PTR _cp$966[ebp], OFFSET _compilers
	jmp	$L968
$L969:
	add	DWORD PTR _cp$966[ebp], 8
$L968:
	mov	eax, DWORD PTR _cp$966[ebp]
	cmp	DWORD PTR [eax+4], 0
	je	$L970
; Line 1918
	mov	eax, DWORD PTR _cp$966[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_strlen
	add	esp, 4
	cmp	eax, DWORD PTR _input_filename_length
	jge	$L971
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _infiles
	mov	ebx, DWORD PTR [ecx+eax*4]
	add	ebx, DWORD PTR _input_filename_length
	mov	eax, DWORD PTR _cp$966[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_strlen
	add	esp, 4
	sub	ebx, eax
	push	ebx
	mov	eax, DWORD PTR _cp$966[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L971
; Line 1924
	mov	eax, DWORD PTR _input_filename
	mov	DWORD PTR _input_basename, eax
; Line 1925
	mov	eax, DWORD PTR _input_filename
	mov	DWORD PTR _p$972[ebp], eax
	jmp	$L973
$L974:
	inc	DWORD PTR _p$972[ebp]
$L973:
	mov	eax, DWORD PTR _p$972[ebp]
	movsx	eax, BYTE PTR [eax]
	or	eax, eax
	je	$L975
; Line 1926
	mov	eax, DWORD PTR _p$972[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 47					; 0000002fH
	jne	$L976
; Line 1927
	mov	eax, DWORD PTR _p$972[ebp]
	inc	eax
	mov	DWORD PTR _input_basename, eax
; Line 1928
$L976:
	jmp	$L974
$L975:
; Line 1929
	mov	ebx, DWORD PTR _input_filename_length
	mov	eax, DWORD PTR _cp$966[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_strlen
	add	esp, 4
	sub	ebx, eax
	mov	eax, DWORD PTR _input_basename
	sub	eax, DWORD PTR _input_filename
	sub	ebx, eax
	mov	DWORD PTR _basename_length, ebx
; Line 1930
	mov	eax, DWORD PTR _cp$966[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_do_spec
	add	esp, 4
	mov	DWORD PTR _value$[ebp], eax
; Line 1931
	cmp	DWORD PTR _value$[ebp], 0
	jge	$L977
; Line 1932
	mov	DWORD PTR _this_file_error$967[ebp], 1
; Line 1933
$L977:
	jmp	$L970
; Line 1935
$L971:
	jmp	$L969
$L970:
; Line 1940
	mov	eax, DWORD PTR _cp$966[ebp]
	cmp	DWORD PTR [eax+4], 0
	jne	$L978
; Line 1941
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _explicit_link_files$[ebp]
	mov	BYTE PTR [eax+ecx], 1
; Line 1946
$L978:
	cmp	DWORD PTR _this_file_error$967[ebp], 0
	je	$L979
; Line 1948
	call	_delete_failure_queue
; Line 1949
	inc	DWORD PTR _error_count$[ebp]
; Line 1952
$L979:
	call	_clear_failure_queue
; Line 1953
	jmp	$L964
$L965:
; Line 1957
	cmp	DWORD PTR _error_count$[ebp], 0
	jne	$L980
; Line 1959
	mov	eax, DWORD PTR _execution_count
	mov	DWORD PTR _tmp$981[ebp], eax
; Line 1960
	mov	eax, DWORD PTR _link_spec
	push	eax
	call	_do_spec
	add	esp, 4
	mov	DWORD PTR _value$[ebp], eax
; Line 1961
	cmp	DWORD PTR _value$[ebp], 0
	jge	$L982
; Line 1962
	mov	DWORD PTR _error_count$[ebp], 1
; Line 1963
$L982:
	mov	eax, DWORD PTR _execution_count
	sub	eax, DWORD PTR _tmp$981[ebp]
	cmp	eax, 1
	sbb	eax, eax
	inc	eax
	mov	DWORD PTR _linker_was_run$[ebp], eax
; Line 1969
$L980:
	cmp	DWORD PTR _linker_was_run$[ebp], 0
	jne	$L983
	cmp	DWORD PTR _error_count$[ebp], 0
	jne	$L983
; Line 1970
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L984
$L985:
	inc	DWORD PTR _i$[ebp]
$L984:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _n_infiles, eax
	jle	$L986
; Line 1971
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _explicit_link_files$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	or	eax, eax
	je	$L987
; Line 1973
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _outfiles
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	push	OFFSET $SG988
	call	_error
	add	esp, 8
; Line 1977
$L987:
	jmp	$L985
$L986:
$L983:
	call	_validate_all_switches
; Line 1981
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L989
$L990:
	inc	DWORD PTR _i$[ebp]
$L989:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _n_switches, eax
	jle	$L991
; Line 1982
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	mov	ecx, DWORD PTR _switches
	cmp	DWORD PTR [ecx+eax*4+8], 0
	jne	$L992
; Line 1983
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	mov	ecx, DWORD PTR _switches
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	push	OFFSET $SG993
	call	_error
	add	esp, 8
; Line 1987
$L992:
	jmp	$L990
$L991:
	cmp	DWORD PTR _error_count$[ebp], 0
	je	$L994
; Line 1988
	call	_delete_failure_queue
; Line 1989
$L994:
	call	_delete_temp_files
; Line 1991
	mov	eax, DWORD PTR _error_count$[ebp]
	push	eax
	call	_exit
	add	esp, 4
; Line 1992
$L938:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_main	ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+2
$SG999	DB	'virtual memory exhausted', 00H
_DATA	ENDS
_TEXT	SEGMENT
_size$ = 8
_value$ = -4
_xmalloc PROC NEAR
; Line 1996
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 1997
	mov	eax, DWORD PTR _size$[ebp]
	push	eax
	call	_malloc
	add	esp, 4
	mov	DWORD PTR _value$[ebp], eax
; Line 1998
	cmp	DWORD PTR _value$[ebp], 0
	jne	$L998
; Line 1999
	push	OFFSET $SG999
	call	_fatal
	add	esp, 4
; Line 2000
$L998:
	mov	eax, DWORD PTR _value$[ebp]
	jmp	$L996
; Line 2001
$L996:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_xmalloc ENDP
_TEXT	ENDS
PUBLIC	_xrealloc
_DATA	SEGMENT
	ORG $+3
$SG1006	DB	'virtual memory exhausted', 00H
_DATA	ENDS
_TEXT	SEGMENT
_ptr$ = 8
_size$ = 12
_value$ = -4
_xrealloc PROC NEAR
; Line 2005
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 2006
	mov	eax, DWORD PTR _size$[ebp]
	push	eax
	mov	eax, DWORD PTR _ptr$[ebp]
	push	eax
	call	_realloc
	add	esp, 8
	mov	DWORD PTR _value$[ebp], eax
; Line 2007
	cmp	DWORD PTR _value$[ebp], 0
	jne	$L1005
; Line 2008
	push	OFFSET $SG1006
	call	_fatal
	add	esp, 4
; Line 2009
$L1005:
	mov	eax, DWORD PTR _value$[ebp]
	jmp	$L1003
; Line 2010
$L1003:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_xrealloc ENDP
_TEXT	ENDS
PUBLIC	_concat
_TEXT	SEGMENT
_s1$ = 8
_s2$ = 12
_s3$ = 16
_len1$ = -12
_len2$ = -4
_len3$ = -16
_result$ = -8
_concat	PROC NEAR
; Line 2017
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 2018
	mov	eax, DWORD PTR _s1$[ebp]
	push	eax
	call	_strlen
	add	esp, 4
	mov	DWORD PTR _len1$[ebp], eax
	mov	eax, DWORD PTR _s2$[ebp]
	push	eax
	call	_strlen
	add	esp, 4
	mov	DWORD PTR _len2$[ebp], eax
	mov	eax, DWORD PTR _s3$[ebp]
	push	eax
	call	_strlen
	add	esp, 4
	mov	DWORD PTR _len3$[ebp], eax
; Line 2019
	mov	eax, DWORD PTR _len3$[ebp]
	add	eax, DWORD PTR _len1$[ebp]
	add	eax, DWORD PTR _len2$[ebp]
	inc	eax
	push	eax
	call	_xmalloc
	add	esp, 4
	mov	DWORD PTR _result$[ebp], eax
; Line 2021
	mov	eax, DWORD PTR _s1$[ebp]
	push	eax
	mov	eax, DWORD PTR _result$[ebp]
	push	eax
	call	_strcpy
	add	esp, 8
; Line 2022
	mov	eax, DWORD PTR _s2$[ebp]
	push	eax
	mov	eax, DWORD PTR _len1$[ebp]
	add	eax, DWORD PTR _result$[ebp]
	push	eax
	call	_strcpy
	add	esp, 8
; Line 2023
	mov	eax, DWORD PTR _s3$[ebp]
	push	eax
	mov	eax, DWORD PTR _len1$[ebp]
	add	eax, DWORD PTR _len2$[ebp]
	add	eax, DWORD PTR _result$[ebp]
	push	eax
	call	_strcpy
	add	esp, 8
; Line 2024
	mov	eax, DWORD PTR _len3$[ebp]
	add	eax, DWORD PTR _len1$[ebp]
	add	eax, DWORD PTR _len2$[ebp]
	mov	ecx, DWORD PTR _result$[ebp]
	mov	BYTE PTR [eax+ecx], 0
; Line 2026
	mov	eax, DWORD PTR _result$[ebp]
	jmp	$L1010
; Line 2027
$L1010:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_concat	ENDP
_s$ = 8
_len$ = 12
_result$ = -4
_save_string PROC NEAR
; Line 2033
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 2034
	mov	eax, DWORD PTR _len$[ebp]
	inc	eax
	push	eax
	call	_xmalloc
	add	esp, 4
	mov	DWORD PTR _result$[ebp], eax
; Line 2036
	mov	eax, DWORD PTR _len$[ebp]
	push	eax
	mov	eax, DWORD PTR _s$[ebp]
	push	eax
	mov	eax, DWORD PTR _result$[ebp]
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
; Line 2037
	mov	eax, DWORD PTR _len$[ebp]
	mov	ecx, DWORD PTR _result$[ebp]
	mov	BYTE PTR [eax+ecx], 0
; Line 2038
	mov	eax, DWORD PTR _result$[ebp]
	jmp	$L1017
; Line 2039
$L1017:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_save_string ENDP
_TEXT	ENDS
PUBLIC	_pfatal_with_name
EXTRN	__sys_errlist:BYTE
EXTRN	__sys_nerr:DWORD
_DATA	SEGMENT
	ORG $+3
$SG1024	DB	00H
	ORG $+3
$SG1025	DB	'%s: ', 00H
	ORG $+3
$SG1027	DB	'cannot open %s', 00H
_DATA	ENDS
_TEXT	SEGMENT
_name$ = 8
_s$ = -4
_pfatal_with_name PROC NEAR
; Line 2043
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 2048
	mov	eax, DWORD PTR _errno
	cmp	DWORD PTR __sys_nerr, eax
	jle	$L1023
; Line 2049
	push	OFFSET $SG1024
	mov	eax, DWORD PTR _errno
	mov	eax, DWORD PTR __sys_errlist[eax*4]
	push	eax
	push	OFFSET $SG1025
	call	_concat
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _s$[ebp], eax
; Line 2050
	jmp	$L1026
$L1023:
; Line 2051
	mov	DWORD PTR _s$[ebp], OFFSET $SG1027
$L1026:
; Line 2052
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	mov	eax, DWORD PTR _s$[ebp]
	push	eax
	call	_fatal
	add	esp, 8
; Line 2053
$L1021:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_pfatal_with_name ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG1032	DB	00H
	ORG $+3
$SG1033	DB	'%s: ', 00H
	ORG $+3
$SG1035	DB	'cannot open %s', 00H
_DATA	ENDS
_TEXT	SEGMENT
_name$ = 8
_s$ = -4
_perror_with_name PROC NEAR
; Line 2057
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 2062
	mov	eax, DWORD PTR _errno
	cmp	DWORD PTR __sys_nerr, eax
	jle	$L1031
; Line 2063
	push	OFFSET $SG1032
	mov	eax, DWORD PTR _errno
	mov	eax, DWORD PTR __sys_errlist[eax*4]
	push	eax
	push	OFFSET $SG1033
	call	_concat
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _s$[ebp], eax
; Line 2064
	jmp	$L1034
$L1031:
; Line 2065
	mov	DWORD PTR _s$[ebp], OFFSET $SG1035
$L1034:
; Line 2066
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	mov	eax, DWORD PTR _s$[ebp]
	push	eax
	call	_error
	add	esp, 8
; Line 2067
$L1029:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_perror_with_name ENDP
_TEXT	ENDS
PUBLIC	_perror_exec
_DATA	SEGMENT
	ORG $+1
$SG1041	DB	00H
	ORG $+3
$SG1042	DB	'installation problem, cannot exec %s: ', 00H
	ORG $+1
$SG1044	DB	'installation problem, cannot exec %s', 00H
_DATA	ENDS
_TEXT	SEGMENT
_name$ = 8
_s$ = -4
_perror_exec PROC NEAR
; Line 2071
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 2076
	mov	eax, DWORD PTR _errno
	cmp	DWORD PTR __sys_nerr, eax
	jle	$L1040
; Line 2078
	push	OFFSET $SG1041
	mov	eax, DWORD PTR _errno
	mov	eax, DWORD PTR __sys_errlist[eax*4]
	push	eax
	push	OFFSET $SG1042
	call	_concat
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _s$[ebp], eax
; Line 2079
	jmp	$L1043
$L1040:
; Line 2080
	mov	DWORD PTR _s$[ebp], OFFSET $SG1044
$L1043:
; Line 2081
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	mov	eax, DWORD PTR _s$[ebp]
	push	eax
	call	_error
	add	esp, 8
; Line 2082
$L1038:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_perror_exec ENDP
_TEXT	ENDS
PUBLIC	_fancy_abort
_DATA	SEGMENT
	ORG $+3
$SG1046	DB	'Internal gcc abort.', 00H
_DATA	ENDS
_TEXT	SEGMENT
_fancy_abort PROC NEAR
; Line 2089
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 2090
	push	OFFSET $SG1046
	call	_fatal
	add	esp, 4
; Line 2091
$L1045:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_fancy_abort ENDP
_msg$ = 8
_arg1$ = 12
_arg2$ = 16
_fatal	PROC NEAR
; Line 2132
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 2133
	mov	eax, DWORD PTR _arg2$[ebp]
	push	eax
	mov	eax, DWORD PTR _arg1$[ebp]
	push	eax
	mov	eax, DWORD PTR _msg$[ebp]
	push	eax
	call	_error
	add	esp, 12					; 0000000cH
; Line 2134
	push	0
	call	_delete_temp_files
	add	esp, 4
; Line 2135
	push	1
	call	_exit
	add	esp, 4
; Line 2136
$L1050:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_fatal	ENDP
_TEXT	ENDS
_DATA	SEGMENT
$SG1055	DB	'%s: ', 00H
	ORG $+3
$SG1056	DB	0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_msg$ = 8
_arg1$ = 12
_arg2$ = 16
_error	PROC NEAR
; Line 2140
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 2141
	mov	eax, DWORD PTR _programname
	push	eax
	push	OFFSET $SG1055
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 2142
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
	add	esp, 16					; 00000010H
; Line 2143
	push	OFFSET $SG1056
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 8
; Line 2144
$L1054:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_error	ENDP
_TEXT	ENDS
PUBLIC	_validate_switches
_DATA	SEGMENT
	ORG $+2
$SG1072	DB	00H
	ORG $+3
$SG1077	DB	00H
	ORG $+3
$SG1082	DB	'%{funsigned-char:-D__CHAR_UNSIGNED__}', 00H
	ORG $+2
$SG1087	DB	00H
	ORG $+3
$SG1092	DB	00H
	ORG $+3
$SG1097	DB	'%{!p:%{!pg:-lc}}%{p:-lc_p}%{pg:-lc_p}', 00H
	ORG $+2
$SG1102	DB	'%{pg:gcrt0.o%s}%{!pg:%{p:mcrt0.o%s}%{!p:crt0.o%s}}', 00H
_DATA	ENDS
_TEXT	SEGMENT
_comp$ = -12
_p$ = -4
_c$ = -8
_validate_all_switches PROC NEAR
; Line 2151
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 2156
	mov	DWORD PTR _comp$[ebp], OFFSET _compilers
	jmp	$L1061
$L1062:
	add	DWORD PTR _comp$[ebp], 8
$L1061:
	mov	eax, DWORD PTR _comp$[ebp]
	cmp	DWORD PTR [eax+4], 0
	je	$L1063
; Line 2158
	mov	eax, DWORD PTR _comp$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _p$[ebp], eax
; Line 2159
$L1065:
	mov	eax, DWORD PTR _p$[ebp]
	mov	al, BYTE PTR [eax]
	mov	BYTE PTR _c$[ebp], al
	inc	DWORD PTR _p$[ebp]
	movsx	eax, BYTE PTR _c$[ebp]
	or	eax, eax
	je	$L1066
; Line 2160
	movsx	eax, BYTE PTR _c$[ebp]
	cmp	eax, 37					; 00000025H
	jne	$L1067
	mov	eax, DWORD PTR _p$[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 123				; 0000007bH
	jne	$L1067
; Line 2162
	mov	eax, DWORD PTR _p$[ebp]
	inc	eax
	push	eax
	call	_validate_switches
	add	esp, 4
; Line 2163
$L1067:
	jmp	$L1065
$L1066:
	jmp	$L1062
$L1063:
; Line 2165
	mov	eax, DWORD PTR _link_spec
	mov	DWORD PTR _p$[ebp], eax
; Line 2166
$L1069:
	mov	eax, DWORD PTR _p$[ebp]
	mov	al, BYTE PTR [eax]
	mov	BYTE PTR _c$[ebp], al
	inc	DWORD PTR _p$[ebp]
	movsx	eax, BYTE PTR _c$[ebp]
	or	eax, eax
	je	$L1070
; Line 2167
	movsx	eax, BYTE PTR _c$[ebp]
	cmp	eax, 37					; 00000025H
	jne	$L1071
	mov	eax, DWORD PTR _p$[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 123				; 0000007bH
	jne	$L1071
; Line 2169
	mov	eax, DWORD PTR _p$[ebp]
	inc	eax
	push	eax
	call	_validate_switches
	add	esp, 4
; Line 2174
$L1071:
	jmp	$L1069
$L1070:
	mov	DWORD PTR _p$[ebp], OFFSET $SG1072
; Line 2175
$L1074:
	mov	eax, DWORD PTR _p$[ebp]
	mov	al, BYTE PTR [eax]
	mov	BYTE PTR _c$[ebp], al
	inc	DWORD PTR _p$[ebp]
	movsx	eax, BYTE PTR _c$[ebp]
	or	eax, eax
	je	$L1075
; Line 2176
	movsx	eax, BYTE PTR _c$[ebp]
	cmp	eax, 37					; 00000025H
	jne	$L1076
	mov	eax, DWORD PTR _p$[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 123				; 0000007bH
	jne	$L1076
; Line 2178
	mov	eax, DWORD PTR _p$[ebp]
	inc	eax
	push	eax
	call	_validate_switches
	add	esp, 4
; Line 2182
$L1076:
	jmp	$L1074
$L1075:
	mov	DWORD PTR _p$[ebp], OFFSET $SG1077
; Line 2183
$L1079:
	mov	eax, DWORD PTR _p$[ebp]
	mov	al, BYTE PTR [eax]
	mov	BYTE PTR _c$[ebp], al
	inc	DWORD PTR _p$[ebp]
	movsx	eax, BYTE PTR _c$[ebp]
	or	eax, eax
	je	$L1080
; Line 2184
	movsx	eax, BYTE PTR _c$[ebp]
	cmp	eax, 37					; 00000025H
	jne	$L1081
	mov	eax, DWORD PTR _p$[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 123				; 0000007bH
	jne	$L1081
; Line 2186
	mov	eax, DWORD PTR _p$[ebp]
	inc	eax
	push	eax
	call	_validate_switches
	add	esp, 4
; Line 2190
$L1081:
	jmp	$L1079
$L1080:
	mov	DWORD PTR _p$[ebp], OFFSET $SG1082
; Line 2191
$L1084:
	mov	eax, DWORD PTR _p$[ebp]
	mov	al, BYTE PTR [eax]
	mov	BYTE PTR _c$[ebp], al
	inc	DWORD PTR _p$[ebp]
	movsx	eax, BYTE PTR _c$[ebp]
	or	eax, eax
	je	$L1085
; Line 2192
	movsx	eax, BYTE PTR _c$[ebp]
	cmp	eax, 37					; 00000025H
	jne	$L1086
	mov	eax, DWORD PTR _p$[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 123				; 0000007bH
	jne	$L1086
; Line 2194
	mov	eax, DWORD PTR _p$[ebp]
	inc	eax
	push	eax
	call	_validate_switches
	add	esp, 4
; Line 2198
$L1086:
	jmp	$L1084
$L1085:
	mov	DWORD PTR _p$[ebp], OFFSET $SG1087
; Line 2199
$L1089:
	mov	eax, DWORD PTR _p$[ebp]
	mov	al, BYTE PTR [eax]
	mov	BYTE PTR _c$[ebp], al
	inc	DWORD PTR _p$[ebp]
	movsx	eax, BYTE PTR _c$[ebp]
	or	eax, eax
	je	$L1090
; Line 2200
	movsx	eax, BYTE PTR _c$[ebp]
	cmp	eax, 37					; 00000025H
	jne	$L1091
	mov	eax, DWORD PTR _p$[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 123				; 0000007bH
	jne	$L1091
; Line 2202
	mov	eax, DWORD PTR _p$[ebp]
	inc	eax
	push	eax
	call	_validate_switches
	add	esp, 4
; Line 2206
$L1091:
	jmp	$L1089
$L1090:
	mov	DWORD PTR _p$[ebp], OFFSET $SG1092
; Line 2207
$L1094:
	mov	eax, DWORD PTR _p$[ebp]
	mov	al, BYTE PTR [eax]
	mov	BYTE PTR _c$[ebp], al
	inc	DWORD PTR _p$[ebp]
	movsx	eax, BYTE PTR _c$[ebp]
	or	eax, eax
	je	$L1095
; Line 2208
	movsx	eax, BYTE PTR _c$[ebp]
	cmp	eax, 37					; 00000025H
	jne	$L1096
	mov	eax, DWORD PTR _p$[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 123				; 0000007bH
	jne	$L1096
; Line 2210
	mov	eax, DWORD PTR _p$[ebp]
	inc	eax
	push	eax
	call	_validate_switches
	add	esp, 4
; Line 2214
$L1096:
	jmp	$L1094
$L1095:
	mov	DWORD PTR _p$[ebp], OFFSET $SG1097
; Line 2215
$L1099:
	mov	eax, DWORD PTR _p$[ebp]
	mov	al, BYTE PTR [eax]
	mov	BYTE PTR _c$[ebp], al
	inc	DWORD PTR _p$[ebp]
	movsx	eax, BYTE PTR _c$[ebp]
	or	eax, eax
	je	$L1100
; Line 2216
	movsx	eax, BYTE PTR _c$[ebp]
	cmp	eax, 37					; 00000025H
	jne	$L1101
	mov	eax, DWORD PTR _p$[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 123				; 0000007bH
	jne	$L1101
; Line 2218
	mov	eax, DWORD PTR _p$[ebp]
	inc	eax
	push	eax
	call	_validate_switches
	add	esp, 4
; Line 2222
$L1101:
	jmp	$L1099
$L1100:
	mov	DWORD PTR _p$[ebp], OFFSET $SG1102
; Line 2223
$L1104:
	mov	eax, DWORD PTR _p$[ebp]
	mov	al, BYTE PTR [eax]
	mov	BYTE PTR _c$[ebp], al
	inc	DWORD PTR _p$[ebp]
	movsx	eax, BYTE PTR _c$[ebp]
	or	eax, eax
	je	$L1105
; Line 2224
	movsx	eax, BYTE PTR _c$[ebp]
	cmp	eax, 37					; 00000025H
	jne	$L1106
	mov	eax, DWORD PTR _p$[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 123				; 0000007bH
	jne	$L1106
; Line 2226
	mov	eax, DWORD PTR _p$[ebp]
	inc	eax
	push	eax
	call	_validate_switches
	add	esp, 4
; Line 2228
$L1106:
	jmp	$L1104
$L1105:
$L1057:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_validate_all_switches ENDP
_start$ = 8
_p$ = -4
_filter$ = -12
_i$ = -8
_validate_switches PROC NEAR
; Line 2236
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 2237
	mov	eax, DWORD PTR _start$[ebp]
	mov	DWORD PTR _p$[ebp], eax
; Line 2241
	mov	eax, DWORD PTR _p$[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 124				; 0000007cH
	jne	$L1112
; Line 2242
	inc	DWORD PTR _p$[ebp]
; Line 2244
$L1112:
	mov	eax, DWORD PTR _p$[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 33					; 00000021H
	jne	$L1113
; Line 2245
	inc	DWORD PTR _p$[ebp]
; Line 2247
$L1113:
	mov	eax, DWORD PTR _p$[ebp]
	mov	DWORD PTR _filter$[ebp], eax
; Line 2248
$L1115:
	mov	eax, DWORD PTR _p$[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 58					; 0000003aH
	je	$L1116
	mov	eax, DWORD PTR _p$[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 125				; 0000007dH
	je	$L1116
	inc	DWORD PTR _p$[ebp]
	jmp	$L1115
$L1116:
; Line 2250
	mov	eax, DWORD PTR _p$[ebp]
	movsx	eax, BYTE PTR [eax-1]
	cmp	eax, 42					; 0000002aH
	jne	$L1117
; Line 2253
	dec	DWORD PTR _p$[ebp]
; Line 2254
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L1118
$L1119:
	inc	DWORD PTR _i$[ebp]
$L1118:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _n_switches, eax
	jle	$L1120
; Line 2255
	mov	eax, DWORD PTR _p$[ebp]
	sub	eax, DWORD PTR _filter$[ebp]
	push	eax
	mov	eax, DWORD PTR _filter$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	mov	ecx, DWORD PTR _switches
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	call	_strncmp
	add	esp, 12					; 0000000cH
	or	eax, eax
	jne	$L1121
; Line 2256
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	mov	ecx, DWORD PTR _switches
	mov	DWORD PTR [ecx+eax*4+8], 1
; Line 2257
$L1121:
	jmp	$L1119
$L1120:
; Line 2258
	jmp	$L1122
$L1117:
; Line 2261
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L1123
$L1124:
	inc	DWORD PTR _i$[ebp]
$L1123:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _n_switches, eax
	jle	$L1125
; Line 2264
	mov	eax, DWORD PTR _p$[ebp]
	sub	eax, DWORD PTR _filter$[ebp]
	push	eax
	mov	eax, DWORD PTR _filter$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	mov	ecx, DWORD PTR _switches
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	call	_strncmp
	add	esp, 12					; 0000000cH
	or	eax, eax
	jne	$L1126
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	mov	ecx, DWORD PTR _switches
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _p$[ebp]
	sub	eax, DWORD PTR _filter$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	or	eax, eax
	jne	$L1126
; Line 2265
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	mov	ecx, DWORD PTR _switches
	mov	DWORD PTR [ecx+eax*4+8], 1
; Line 2266
$L1126:
	jmp	$L1124
$L1125:
; Line 2267
$L1122:
; Line 2268
$L1108:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_validate_switches ENDP
_TEXT	ENDS
END
