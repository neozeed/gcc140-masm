	TITLE	genconfig.c
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
PUBLIC	_rtl_obstack
_DATA	SEGMENT
COMM	_obstack:BYTE:024H
COMM	_max_recog_operands_flag:DWORD
COMM	_max_dup_operands_flag:DWORD
COMM	_max_clobbers_per_insn_flag:DWORD
COMM	_register_constraint_flag:DWORD
COMM	_clobbers_seen_this_insn:DWORD
COMM	_dup_operands_seen_this_insn:DWORD
_rtl_obstack DD	_obstack
_DATA	ENDS
PUBLIC	_walk_insn_part
EXTRN	_rtx_length:BYTE
EXTRN	_rtx_format:BYTE
_TEXT	SEGMENT
; File genconfig.c
_part$ = 8
_i$ = -16
_j$ = -4
_code$ = -12
_format_ptr$ = -8
_walk_insn_part PROC NEAR
; Line 51
	push	ebp
	mov	ebp, esp
	sub	esp, 28					; 0000001cH
	push	ebx
	push	esi
	push	edi
; Line 56
	cmp	DWORD PTR _part$[ebp], 0
	jne	$L479
; Line 57
	jmp	$L474
; Line 59
$L479:
	mov	eax, DWORD PTR _part$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$[ebp], eax
; Line 60
	mov	eax, DWORD PTR _code$[ebp]
	mov	DWORD PTR -24+[ebp], eax
	jmp	$L480
; Line 62
$L484:
; Line 63
	inc	DWORD PTR _clobbers_seen_this_insn
; Line 64
	jmp	$L481
; Line 66
$L485:
; Line 67
	mov	eax, DWORD PTR _part$[ebp]
	mov	ecx, DWORD PTR _max_recog_operands_flag
	cmp	DWORD PTR [eax+4], ecx
	jle	$L486
; Line 68
	mov	eax, DWORD PTR _part$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _max_recog_operands_flag, eax
; Line 69
$L486:
	mov	eax, DWORD PTR _part$[ebp]
	cmp	DWORD PTR [eax+12], 0
	je	$L487
	mov	eax, DWORD PTR _part$[ebp]
	mov	eax, DWORD PTR [eax+12]
	movsx	eax, BYTE PTR [eax]
	or	eax, eax
	je	$L487
; Line 70
	mov	DWORD PTR _register_constraint_flag, 1
; Line 71
$L487:
	jmp	$L474
; Line 73
$L488:
; Line 74
	mov	eax, DWORD PTR _part$[ebp]
	mov	ecx, DWORD PTR _max_recog_operands_flag
	cmp	DWORD PTR [eax+4], ecx
	jle	$L489
; Line 75
	mov	eax, DWORD PTR _part$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _max_recog_operands_flag, eax
; Line 77
$L489:
	jmp	$L481
; Line 79
$L490:
; Line 80
	mov	eax, DWORD PTR _part$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 262144				; 00040000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L491
; Line 81
	jmp	$L481
; Line 82
$L491:
	jmp	$L474
; Line 84
$L492:
; Line 85
	inc	DWORD PTR _dup_operands_seen_this_insn
; Line 86
	mov	eax, DWORD PTR _part$[ebp]
	mov	ecx, DWORD PTR _max_recog_operands_flag
	cmp	DWORD PTR [eax+4], ecx
	jle	$L493
; Line 87
	mov	eax, DWORD PTR _part$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _max_recog_operands_flag, eax
; Line 89
$L493:
$L494:
; Line 91
	jmp	$L474
; Line 92
	jmp	$L481
$L480:
	sub	DWORD PTR -24+[ebp], 4
	cmp	DWORD PTR -24+[ebp], 36			; 00000024H
	ja	$L481
	shl	DWORD PTR -24+[ebp], 2
	mov	eax, DWORD PTR -24+[ebp]
	jmp	DWORD PTR $L586[eax]
$L586:
	DD	OFFSET $L485
	DD	OFFSET $L492
	DD	OFFSET $L488
	DD	OFFSET $L481
	DD	OFFSET $L481
	DD	OFFSET $L481
	DD	OFFSET $L481
	DD	OFFSET $L481
	DD	OFFSET $L481
	DD	OFFSET $L481
	DD	OFFSET $L481
	DD	OFFSET $L481
	DD	OFFSET $L481
	DD	OFFSET $L481
	DD	OFFSET $L481
	DD	OFFSET $L481
	DD	OFFSET $L481
	DD	OFFSET $L481
	DD	OFFSET $L481
	DD	OFFSET $L481
	DD	OFFSET $L481
	DD	OFFSET $L481
	DD	OFFSET $L481
	DD	OFFSET $L484
	DD	OFFSET $L481
	DD	OFFSET $L481
	DD	OFFSET $L494
	DD	OFFSET $L481
	DD	OFFSET $L481
	DD	OFFSET $L494
	DD	OFFSET $L494
	DD	OFFSET $L481
	DD	OFFSET $L481
	DD	OFFSET $L481
	DD	OFFSET $L490
	DD	OFFSET $L494
	DD	OFFSET $L494
$L481:
; Line 94
	mov	eax, DWORD PTR _part$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	eax, DWORD PTR _rtx_format[eax*4]
	mov	DWORD PTR _format_ptr$[ebp], eax
; Line 96
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L495
$L496:
	inc	DWORD PTR _i$[ebp]
$L495:
	mov	eax, DWORD PTR _part$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _rtx_length[eax*4], ecx
	jle	$L497
; Line 97
	mov	eax, DWORD PTR _format_ptr$[ebp]
	mov	DWORD PTR -20+[ebp], eax
	inc	DWORD PTR _format_ptr$[ebp]
	mov	eax, DWORD PTR -20+[ebp]
	movsx	eax, BYTE PTR [eax]
	mov	DWORD PTR -28+[ebp], eax
	jmp	$L498
; Line 99
$L502:
; Line 101
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _part$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	push	eax
	call	_walk_insn_part
	add	esp, 4
; Line 102
	jmp	$L499
; Line 103
$L503:
; Line 104
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _part$[ebp]
	cmp	DWORD PTR [ecx+eax*4+4], 0
	je	$L504
; Line 105
	mov	DWORD PTR _j$[ebp], 0
	jmp	$L505
$L506:
	inc	DWORD PTR _j$[ebp]
$L505:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _part$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$[ebp]
	cmp	DWORD PTR [eax], ecx
	jbe	$L507
; Line 106
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _part$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	push	eax
	call	_walk_insn_part
	add	esp, 4
	jmp	$L506
$L507:
; Line 107
$L504:
	jmp	$L499
; Line 108
	jmp	$L499
$L498:
	cmp	DWORD PTR -28+[ebp], 69			; 00000045H
	je	$L503
	cmp	DWORD PTR -28+[ebp], 101		; 00000065H
	je	$L502
	cmp	DWORD PTR -28+[ebp], 117		; 00000075H
	je	$L502
	jmp	$L499
$L499:
	jmp	$L496
$L497:
; Line 109
$L474:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_walk_insn_part ENDP
_TEXT	ENDS
PUBLIC	_gen_insn
_TEXT	SEGMENT
_insn$ = 8
_i$ = -4
_gen_insn PROC NEAR
; Line 114
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 118
	mov	DWORD PTR _clobbers_seen_this_insn, 0
; Line 119
	mov	DWORD PTR _dup_operands_seen_this_insn, 0
; Line 120
	mov	eax, DWORD PTR _insn$[ebp]
	cmp	DWORD PTR [eax+8], 0
	je	$L512
; Line 121
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L513
$L514:
	inc	DWORD PTR _i$[ebp]
$L513:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	DWORD PTR [eax], ecx
	jbe	$L515
; Line 122
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	push	eax
	call	_walk_insn_part
	add	esp, 4
	jmp	$L514
$L515:
; Line 124
$L512:
	mov	eax, DWORD PTR _max_clobbers_per_insn_flag
	cmp	DWORD PTR _clobbers_seen_this_insn, eax
	jle	$L516
; Line 125
	mov	eax, DWORD PTR _clobbers_seen_this_insn
	mov	DWORD PTR _max_clobbers_per_insn_flag, eax
; Line 126
$L516:
	mov	eax, DWORD PTR _max_dup_operands_flag
	cmp	DWORD PTR _dup_operands_seen_this_insn, eax
	jle	$L517
; Line 127
	mov	eax, DWORD PTR _dup_operands_seen_this_insn
	mov	DWORD PTR _max_dup_operands_flag, eax
; Line 128
$L517:
$L510:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_insn ENDP
_TEXT	ENDS
PUBLIC	_gen_expand
_TEXT	SEGMENT
_insn$ = 8
_i$ = -4
_gen_expand PROC NEAR
; Line 135
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 142
	mov	eax, DWORD PTR _insn$[ebp]
	cmp	DWORD PTR [eax+8], 0
	je	$L522
; Line 143
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L523
$L524:
	inc	DWORD PTR _i$[ebp]
$L523:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	DWORD PTR [eax], ecx
	jbe	$L525
; Line 148
	mov	DWORD PTR _clobbers_seen_this_insn, 0
; Line 150
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	push	eax
	call	_walk_insn_part
	add	esp, 4
; Line 152
	mov	eax, DWORD PTR _max_clobbers_per_insn_flag
	cmp	DWORD PTR _clobbers_seen_this_insn, eax
	jle	$L526
; Line 153
	mov	eax, DWORD PTR _clobbers_seen_this_insn
	mov	DWORD PTR _max_clobbers_per_insn_flag, eax
; Line 154
$L526:
	jmp	$L524
$L525:
; Line 155
$L522:
$L520:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_expand ENDP
_TEXT	ENDS
PUBLIC	_gen_peephole
_TEXT	SEGMENT
_peep$ = 8
_i$ = -4
_gen_peephole PROC NEAR
; Line 160
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 165
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L531
$L532:
	inc	DWORD PTR _i$[ebp]
$L531:
	mov	eax, DWORD PTR _peep$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	DWORD PTR [eax], ecx
	jbe	$L533
; Line 166
	mov	eax, DWORD PTR _peep$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	push	eax
	call	_walk_insn_part
	add	esp, 4
	jmp	$L532
$L533:
; Line 167
$L529:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_peephole ENDP
_TEXT	ENDS
PUBLIC	_xmalloc
PUBLIC	_fatal
EXTRN	_malloc:NEAR
_DATA	SEGMENT
$SG539	DB	'virtual memory exhausted', 00H
_DATA	ENDS
_TEXT	SEGMENT
_size$ = 8
_val$ = -4
_xmalloc PROC NEAR
; Line 171
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 172
	mov	eax, DWORD PTR _size$[ebp]
	push	eax
	call	_malloc
	add	esp, 4
	mov	DWORD PTR _val$[ebp], eax
; Line 174
	cmp	DWORD PTR _val$[ebp], 0
	jne	$L538
; Line 175
	push	0
	push	0
	push	OFFSET $SG539
	call	_fatal
	add	esp, 12					; 0000000cH
; Line 177
$L538:
	mov	eax, DWORD PTR _val$[ebp]
	jmp	$L535
; Line 178
$L535:
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
	ORG $+3
$SG547	DB	'virtual memory exhausted', 00H
_DATA	ENDS
_TEXT	SEGMENT
_ptr$ = 8
_size$ = 12
_result$ = -4
_xrealloc PROC NEAR
; Line 184
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 185
	mov	eax, DWORD PTR _size$[ebp]
	push	eax
	mov	eax, DWORD PTR _ptr$[ebp]
	push	eax
	call	_realloc
	add	esp, 8
	mov	DWORD PTR _result$[ebp], eax
; Line 186
	cmp	DWORD PTR _result$[ebp], 0
	jne	$L546
; Line 187
	push	0
	push	0
	push	OFFSET $SG547
	call	_fatal
	add	esp, 12					; 0000000cH
; Line 188
$L546:
	mov	eax, DWORD PTR _result$[ebp]
	jmp	$L543
; Line 189
$L543:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_xrealloc ENDP
_TEXT	ENDS
EXTRN	_fprintf:NEAR
EXTRN	_exit:NEAR
EXTRN	__iob:BYTE
_DATA	SEGMENT
	ORG $+3
$SG552	DB	'genconfig: ', 00H
$SG553	DB	0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_s$ = 8
_a1$ = 12
_a2$ = 16
_fatal	PROC NEAR
; Line 194
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 195
	push	OFFSET $SG552
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 8
; Line 196
	mov	eax, DWORD PTR _a2$[ebp]
	push	eax
	mov	eax, DWORD PTR _a1$[ebp]
	push	eax
	mov	eax, DWORD PTR _s$[ebp]
	push	eax
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
; Line 197
	push	OFFSET $SG553
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 8
; Line 198
	push	33					; 00000021H
	call	_exit
	add	esp, 4
; Line 199
$L551:
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
$SG556	DB	'Internal gcc abort.', 00H
_DATA	ENDS
_TEXT	SEGMENT
_fancy_abort PROC NEAR
; Line 206
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 207
	push	0
	push	0
	push	OFFSET $SG556
	call	_fatal
	add	esp, 12					; 0000000cH
; Line 208
$L555:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_fancy_abort ENDP
_TEXT	ENDS
PUBLIC	_main
EXTRN	_fopen:NEAR
EXTRN	_free:NEAR
EXTRN	_perror:NEAR
EXTRN	_printf:NEAR
EXTRN	_ungetc:NEAR
EXTRN	_read_rtx:NEAR
EXTRN	__obstack_begin:NEAR
EXTRN	_init_rtl:NEAR
EXTRN	_fflush:NEAR
EXTRN	_read_skip_spaces:NEAR
_DATA	SEGMENT
$SG567	DB	'No input file name.', 00H
$SG568	DB	'r', 00H
	ORG $+2
$SG571	DB	'/* Generated automatically by the program `genconfig''', 0aH
	DB	'from the machine description file `md''.  */', 0aH, 0aH, 00H
$SG580	DB	0aH, '#define MAX_RECOG_OPERANDS %d', 0aH, 00H
$SG582	DB	0aH, '#define MAX_DUP_OPERANDS %d', 0aH, 00H
	ORG $+2
$SG584	DB	'#define REGISTER_CONSTRAINTS', 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_argc$ = 8
_argv$ = 12
_desc$ = -4
_infile$ = -12
_c$ = -8
_main	PROC NEAR
; Line 214
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 220
	push	OFFSET _free
	push	OFFSET _xmalloc
	push	0
	push	0
	mov	eax, DWORD PTR _rtl_obstack
	push	eax
	call	__obstack_begin
	add	esp, 20					; 00000014H
; Line 222
	cmp	DWORD PTR _argc$[ebp], 1
	jg	$L566
; Line 223
	push	0
	push	0
	push	OFFSET $SG567
	call	_fatal
	add	esp, 12					; 0000000cH
; Line 225
$L566:
	push	OFFSET $SG568
	mov	eax, DWORD PTR _argv$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_fopen
	add	esp, 8
	mov	DWORD PTR _infile$[ebp], eax
; Line 226
	cmp	DWORD PTR _infile$[ebp], 0
	jne	$L569
; Line 228
	mov	eax, DWORD PTR _argv$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_perror
	add	esp, 4
; Line 229
	push	33					; 00000021H
	call	_exit
	add	esp, 4
; Line 232
$L569:
	call	_init_rtl
; Line 235
	push	OFFSET $SG571
	call	_printf
	add	esp, 4
; Line 239
$L573:
; Line 241
	mov	eax, DWORD PTR _infile$[ebp]
	push	eax
	call	_read_skip_spaces
	add	esp, 4
	mov	DWORD PTR _c$[ebp], eax
; Line 242
	cmp	DWORD PTR _c$[ebp], -1
	jne	$L576
; Line 243
	jmp	$L574
; Line 244
$L576:
	mov	eax, DWORD PTR _infile$[ebp]
	push	eax
	mov	eax, DWORD PTR _c$[ebp]
	push	eax
	call	_ungetc
	add	esp, 8
; Line 246
	mov	eax, DWORD PTR _infile$[ebp]
	push	eax
	call	_read_rtx
	add	esp, 4
	mov	DWORD PTR _desc$[ebp], eax
; Line 247
	mov	eax, DWORD PTR _desc$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 458752				; 00070000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L577
; Line 248
	mov	eax, DWORD PTR _desc$[ebp]
	push	eax
	call	_gen_insn
	add	esp, 4
; Line 249
$L577:
	mov	eax, DWORD PTR _desc$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 655360				; 000a0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L578
; Line 250
	mov	eax, DWORD PTR _desc$[ebp]
	push	eax
	call	_gen_expand
	add	esp, 4
; Line 251
$L578:
	mov	eax, DWORD PTR _desc$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 524288				; 00080000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L579
; Line 252
	mov	eax, DWORD PTR _desc$[ebp]
	push	eax
	call	_gen_peephole
	add	esp, 4
; Line 253
$L579:
	jmp	$L573
$L574:
; Line 256
	mov	eax, DWORD PTR _max_recog_operands_flag
	add	eax, 4
	push	eax
	push	OFFSET $SG580
	call	_printf
	add	esp, 8
; Line 258
	cmp	DWORD PTR _max_dup_operands_flag, 0
	jne	$L581
; Line 259
	mov	DWORD PTR _max_dup_operands_flag, 1
; Line 260
$L581:
	mov	eax, DWORD PTR _max_dup_operands_flag
	push	eax
	push	OFFSET $SG582
	call	_printf
	add	esp, 8
; Line 262
	cmp	DWORD PTR _register_constraint_flag, 0
	je	$L583
; Line 263
	push	OFFSET $SG584
	call	_printf
	add	esp, 4
; Line 265
$L583:
	mov	eax, OFFSET __iob
	add	eax, 32					; 00000020H
	push	eax
	call	_fflush
	add	esp, 4
; Line 266
	mov	eax, DWORD PTR __iob+44
	and	eax, 32					; 00000020H
	cmp	eax, 1
	cmc
	sbb	eax, eax
	and	eax, 33					; 00000021H
	push	eax
	call	_exit
	add	esp, 4
; Line 267
$L560:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_main	ENDP
_TEXT	ENDS
END
