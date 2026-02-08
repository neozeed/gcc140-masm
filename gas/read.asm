	TITLE	read.c
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
PUBLIC	_s_globl
PUBLIC	_s_lcomm
PUBLIC	_s_line
PUBLIC	_s_lsym
PUBLIC	_s_org
PUBLIC	_s_set
PUBLIC	_s_space
PUBLIC	_s_text
PUBLIC	_lex_type
PUBLIC	_is_end_of_line
PUBLIC	_big_cons
PUBLIC	_cons
PUBLIC	_float_cons
PUBLIC	_new_broken_words
PUBLIC	_s_abort
PUBLIC	_s_align
PUBLIC	_s_comm
PUBLIC	_s_data
PUBLIC	_s_desc
PUBLIC	_s_file
PUBLIC	_s_fill
_DATA	SEGMENT
COMM	_broken_words:DWORD
COMM	_input_line_pointer:DWORD
_lex_type DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	03H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	03H
	DB	00H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	03H
	DB	03H
	DB	03H
	DB	03H
	DB	03H
	DB	03H
	DB	03H
	DB	03H
	DB	03H
	DB	03H
	DB	03H
	DB	03H
	DB	03H
	DB	03H
	DB	03H
	DB	03H
	DB	03H
	DB	03H
	DB	03H
	DB	03H
	DB	03H
	DB	03H
	DB	03H
	DB	03H
	DB	03H
	DB	03H
	DB	03H
	DB	00H
	DB	00H
	DB	00H
	DB	03H
	DB	00H
	DB	03H
	DB	03H
	DB	03H
	DB	03H
	DB	03H
	DB	03H
	DB	03H
	DB	03H
	DB	03H
	DB	03H
	DB	03H
	DB	03H
	DB	03H
	DB	03H
	DB	03H
	DB	03H
	DB	03H
	DB	03H
	DB	03H
	DB	03H
	DB	03H
	DB	03H
	DB	03H
	DB	03H
	DB	03H
	DB	03H
	DB	03H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	ORG $+16
_is_end_of_line DB 00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	063H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	063H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	ORG $+48
_old_buffer$S432 DD 00H
_new_broken_words DD 00H
_po_hash$S439 DD 00H
$SG457	DB	'abort', 00H
	ORG $+2
$SG458	DB	'align', 00H
	ORG $+2
$SG459	DB	'ascii', 00H
	ORG $+2
$SG460	DB	'asciz', 00H
	ORG $+2
$SG461	DB	'byte', 00H
	ORG $+3
$SG462	DB	'comm', 00H
	ORG $+3
$SG463	DB	'data', 00H
	ORG $+3
$SG464	DB	'desc', 00H
	ORG $+3
$SG465	DB	'double', 00H
	ORG $+1
$SG466	DB	'file', 00H
	ORG $+3
$SG467	DB	'fill', 00H
	ORG $+3
$SG468	DB	'float', 00H
	ORG $+2
$SG469	DB	'globl', 00H
	ORG $+2
$SG470	DB	'int', 00H
$SG471	DB	'lcomm', 00H
	ORG $+2
$SG472	DB	'line', 00H
	ORG $+3
$SG473	DB	'long', 00H
	ORG $+3
$SG474	DB	'lsym', 00H
	ORG $+3
$SG475	DB	'octa', 00H
	ORG $+3
$SG476	DB	'org', 00H
$SG477	DB	'quad', 00H
	ORG $+3
$SG478	DB	'set', 00H
$SG479	DB	'short', 00H
	ORG $+2
$SG480	DB	'single', 00H
	ORG $+1
$SG481	DB	'space', 00H
	ORG $+2
$SG482	DB	'stabd', 00H
	ORG $+2
$SG483	DB	'stabn', 00H
	ORG $+2
$SG484	DB	'stabs', 00H
	ORG $+2
$SG485	DB	'text', 00H
	ORG $+3
$SG486	DB	'word', 00H
	ORG $+3
_potable$S456 DD $SG457
	DD	_s_abort
	DD	00H
	DD	$SG458
	DD	_s_align
	DD	00H
	DD	$SG459
	DD	_stringer
	DD	00H
	DD	$SG460
	DD	_stringer
	DD	01H
	DD	$SG461
	DD	_cons
	DD	01H
	DD	$SG462
	DD	_s_comm
	DD	00H
	DD	$SG463
	DD	_s_data
	DD	00H
	DD	$SG464
	DD	_s_desc
	DD	00H
	DD	$SG465
	DD	_float_cons
	DD	064H
	DD	$SG466
	DD	_s_file
	DD	00H
	DD	$SG467
	DD	_s_fill
	DD	00H
	DD	$SG468
	DD	_float_cons
	DD	066H
	DD	$SG469
	DD	_s_globl
	DD	00H
	DD	$SG470
	DD	_cons
	DD	04H
	DD	$SG471
	DD	_s_lcomm
	DD	00H
	DD	$SG472
	DD	_s_line
	DD	00H
	DD	$SG473
	DD	_cons
	DD	04H
	DD	$SG474
	DD	_s_lsym
	DD	00H
	DD	$SG475
	DD	_big_cons
	DD	010H
	DD	$SG476
	DD	_s_org
	DD	00H
	DD	$SG477
	DD	_big_cons
	DD	08H
	DD	$SG478
	DD	_s_set
	DD	00H
	DD	$SG479
	DD	_cons
	DD	02H
	DD	$SG480
	DD	_float_cons
	DD	066H
	DD	$SG481
	DD	_s_space
	DD	00H
	DD	$SG482
	DD	_stab
	DD	064H
	DD	$SG483
	DD	_stab
	DD	06eH
	DD	$SG484
	DD	_stab
	DD	073H
	DD	$SG485
	DD	_s_text
	DD	00H
	DD	$SG486
	DD	_cons
	DD	02H
	DD	00H
	ORG $+8
_DATA	ENDS
PUBLIC	_read_begin
EXTRN	_notes:BYTE
EXTRN	_xmalloc:NEAR
EXTRN	_free:NEAR
EXTRN	__obstack_begin:NEAR
_BSS	SEGMENT
_bignum_low$S429 DD 01H DUP (?)
_bignum_limit$S430 DD 01H DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
; File read.c
_read_begin PROC NEAR
; Line 148
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 149
	call	_pobegin
; Line 150
	push	OFFSET _free
	push	OFFSET _xmalloc
	push	0
	push	5000					; 00001388H
	push	OFFSET _notes
	call	__obstack_begin
	add	esp, 20					; 00000014H
; Line 152
	push	16					; 00000010H
	call	_xmalloc
	add	esp, 4
	mov	DWORD PTR _bignum_low$S429, eax
; Line 153
	mov	eax, DWORD PTR _bignum_low$S429
	add	eax, 16					; 00000010H
	mov	DWORD PTR _bignum_limit$S430, eax
; Line 154
$L438:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_read_begin ENDP
_TEXT	ENDS
EXTRN	_md_pseudo_table:BYTE
EXTRN	_hash_new:NEAR
EXTRN	_hash_insert:NEAR
EXTRN	_as_fatal:NEAR
_DATA	SEGMENT
$SG490	DB	00H
	ORG $+3
$SG499	DB	'error constructing pseudo-op table', 00H
_DATA	ENDS
_TEXT	SEGMENT
_errtxt$ = -4
_pop$ = -8
_pobegin PROC NEAR
; Line 233
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 237
	call	_hash_new
	mov	DWORD PTR _po_hash$S439, eax
; Line 238
	mov	DWORD PTR _errtxt$[ebp], OFFSET $SG490
; Line 239
	mov	DWORD PTR _pop$[ebp], OFFSET _potable$S456
	jmp	$L491
$L492:
	add	DWORD PTR _pop$[ebp], 12		; 0000000cH
$L491:
	mov	eax, DWORD PTR _pop$[ebp]
	cmp	DWORD PTR [eax], 0
	je	$L493
	mov	eax, DWORD PTR _errtxt$[ebp]
	movsx	eax, BYTE PTR [eax]
	or	eax, eax
	jne	$L493
; Line 241
	mov	eax, DWORD PTR _pop$[ebp]
	push	eax
	mov	eax, DWORD PTR _pop$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	mov	eax, DWORD PTR _po_hash$S439
	push	eax
	call	_hash_insert
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _errtxt$[ebp], eax
; Line 242
	jmp	$L492
$L493:
; Line 244
	mov	DWORD PTR _pop$[ebp], OFFSET _md_pseudo_table
	jmp	$L494
$L495:
	add	DWORD PTR _pop$[ebp], 12		; 0000000cH
$L494:
	mov	eax, DWORD PTR _pop$[ebp]
	cmp	DWORD PTR [eax], 0
	je	$L496
	mov	eax, DWORD PTR _errtxt$[ebp]
	movsx	eax, BYTE PTR [eax]
	or	eax, eax
	jne	$L496
; Line 245
	mov	eax, DWORD PTR _pop$[ebp]
	push	eax
	mov	eax, DWORD PTR _pop$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	mov	eax, DWORD PTR _po_hash$S439
	push	eax
	call	_hash_insert
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _errtxt$[ebp], eax
	jmp	$L495
$L496:
; Line 247
	mov	eax, DWORD PTR _errtxt$[ebp]
	movsx	eax, BYTE PTR [eax]
	or	eax, eax
	je	$L497
; Line 249
	push	OFFSET $SG499
	call	_as_fatal
	add	esp, 4
; Line 251
$L497:
$L487:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_pobegin ENDP
_TEXT	ENDS
PUBLIC	_read_a_source_file
PUBLIC	_equals
PUBLIC	_demand_empty_rest_of_line
PUBLIC	_ignore_rest_of_line
EXTRN	_as_bad:NEAR
EXTRN	_get_symbol_end:NEAR
EXTRN	_xrealloc:NEAR
EXTRN	_bump_line_counters:NEAR
EXTRN	___mb_cur_max:DWORD
EXTRN	_local_colon:NEAR
EXTRN	_md_assemble:NEAR
EXTRN	_colon:NEAR
EXTRN	_strchr:NEAR
EXTRN	_input_scrub_next_buffer:NEAR
EXTRN	_strstr:NEAR
EXTRN	_scrub_from_string:NEAR
EXTRN	_hash_find:NEAR
EXTRN	_scrub_to_string:NEAR
EXTRN	_strncmp:NEAR
EXTRN	_line_comment_chars:BYTE
EXTRN	__pctype:DWORD
EXTRN	_memcpy:NEAR
EXTRN	__isctype:NEAR
EXTRN	_subseg_new:NEAR
EXTRN	_do_scrub_next_char:NEAR
EXTRN	_scrub_string:DWORD
EXTRN	_scrub_last_string:DWORD
_BSS	SEGMENT
_buffer_limit$S428 DD 01H DUP (?)
_old_input$S433 DD 01H DUP (?)
_old_limit$S434 DD 01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+1
$SG525	DB	'Unknown pseudo-op:  ''%s''', 00H
	ORG $+3
$SG538	DB	'Spurious digit %d.', 00H
	ORG $+1
$SG553	DB	'APP', 0aH, 00H
	ORG $+3
$SG554	DB	'#NO_APP', 0aH, 00H
	ORG $+3
$SG564	DB	'#NO_APP', 0aH, 00H
	ORG $+3
$SG576	DB	'Junk character %d.', 00H
_DATA	ENDS
_TEXT	SEGMENT
_ends$541 = -28
_new_buf$543 = -36
_new_tmp$544 = -32
_new_length$545 = -24
_tmp_buf$546 = -20
_tmp_len$556 = -44
_num$557 = -40
_buffer$ = 8
_c$ = -12
_s$ = -4
_temp$ = -16
_pop$ = -8
_ch$571 = -48
_read_a_source_file PROC NEAR
; Line 263
	push	ebp
	mov	ebp, esp
	sub	esp, 56					; 00000038H
	push	ebx
	push	esi
	push	edi
; Line 276
	push	0
	push	1
	call	_subseg_new
	add	esp, 8
; Line 277
$L507:
	lea	eax, DWORD PTR _buffer$[ebp]
	push	eax
	call	_input_scrub_next_buffer
	add	esp, 4
	mov	DWORD PTR _buffer_limit$S428, eax
	cmp	DWORD PTR _buffer_limit$S428, 0
	je	$L508
; Line 280
	mov	eax, DWORD PTR _buffer$[ebp]
	mov	DWORD PTR _input_line_pointer, eax
; Line 281
$contin$509:
; Line 283
$L511:
	mov	eax, DWORD PTR _buffer_limit$S428
	cmp	DWORD PTR _input_line_pointer, eax
	jae	$L512
; Line 290
	mov	eax, DWORD PTR _input_line_pointer
	movsx	eax, BYTE PTR [eax-1]
	cmp	eax, 10					; 0000000aH
	jne	$L513
; Line 292
	call	_bump_line_counters
; Line 308
$L513:
	mov	eax, DWORD PTR _input_line_pointer
	mov	al, BYTE PTR [eax]
	mov	BYTE PTR _c$[ebp], al
	inc	DWORD PTR _input_line_pointer
	movsx	eax, BYTE PTR _c$[ebp]
	cmp	eax, 9
	je	$L515
	movsx	eax, BYTE PTR _c$[ebp]
	cmp	eax, 32					; 00000020H
	je	$L515
	movsx	eax, BYTE PTR _c$[ebp]
	cmp	eax, 12					; 0000000cH
	jne	$L514
$L515:
; Line 310
	mov	eax, DWORD PTR _input_line_pointer
	mov	al, BYTE PTR [eax]
	mov	BYTE PTR _c$[ebp], al
	inc	DWORD PTR _input_line_pointer
; Line 312
$L514:
; Line 317
	movsx	eax, BYTE PTR _c$[ebp]
	movsx	eax, BYTE PTR _lex_type[eax]
	test	al, 2
	je	$L516
; Line 319
	dec	DWORD PTR _input_line_pointer
	mov	eax, DWORD PTR _input_line_pointer
	mov	DWORD PTR _s$[ebp], eax
; Line 320
	call	_get_symbol_end
	mov	BYTE PTR _c$[ebp], al
; Line 328
	movsx	eax, BYTE PTR _c$[ebp]
	cmp	eax, 58					; 0000003aH
	jne	$L517
; Line 330
	mov	eax, DWORD PTR _s$[ebp]
	push	eax
	call	_colon
	add	esp, 4
; Line 331
	mov	eax, DWORD PTR _input_line_pointer
	mov	BYTE PTR [eax], 58			; 0000003aH
	inc	DWORD PTR _input_line_pointer
; Line 335
	jmp	$L518
$L517:
	movsx	eax, BYTE PTR _c$[ebp]
	cmp	eax, 61					; 0000003dH
	je	$L520
	mov	eax, DWORD PTR _input_line_pointer
	movsx	eax, BYTE PTR [eax+1]
	cmp	eax, 61					; 0000003dH
	jne	$L519
$L520:
; Line 337
	mov	eax, DWORD PTR _s$[ebp]
	push	eax
	call	_equals
	add	esp, 4
; Line 338
	call	_demand_empty_rest_of_line
; Line 340
	jmp	$L521
$L519:
; Line 342
	mov	eax, DWORD PTR _s$[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 46					; 0000002eH
	jne	$L522
; Line 352
	mov	eax, DWORD PTR _s$[ebp]
	inc	eax
	push	eax
	mov	eax, DWORD PTR _po_hash$S439
	push	eax
	call	_hash_find
	add	esp, 8
	mov	DWORD PTR _pop$[ebp], eax
; Line 355
	cmp	DWORD PTR _pop$[ebp], 0
	jne	$L523
; Line 356
	mov	eax, DWORD PTR _s$[ebp]
	push	eax
	push	OFFSET $SG525
	call	_as_bad
	add	esp, 8
; Line 359
$L523:
	mov	al, BYTE PTR _c$[ebp]
	mov	ecx, DWORD PTR _input_line_pointer
	mov	BYTE PTR [ecx], al
; Line 362
	movsx	eax, BYTE PTR _c$[ebp]
	cmp	eax, 32					; 00000020H
	je	$L527
	movsx	eax, BYTE PTR _c$[ebp]
	cmp	eax, 9
	jne	$L526
$L527:
; Line 364
	inc	DWORD PTR _input_line_pointer
; Line 371
$L526:
	cmp	DWORD PTR _pop$[ebp], 0
	jne	$L528
; Line 372
	call	_ignore_rest_of_line
; Line 373
	jmp	$L512
; Line 375
	jmp	$L529
$L528:
; Line 376
	mov	eax, DWORD PTR _pop$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _pop$[ebp]
	call	DWORD PTR [eax+4]
	add	esp, 4
$L529:
; Line 378
	jmp	$L530
$L522:
; Line 382
	mov	al, BYTE PTR _c$[ebp]
	mov	ecx, DWORD PTR _input_line_pointer
	mov	BYTE PTR [ecx], al
; Line 383
$L532:
	mov	eax, DWORD PTR _input_line_pointer
	movsx	eax, BYTE PTR [eax]
	movsx	eax, BYTE PTR _is_end_of_line[eax]
	or	eax, eax
	jne	$L533
; Line 385
	inc	DWORD PTR _input_line_pointer
; Line 386
	jmp	$L532
$L533:
; Line 387
	mov	eax, DWORD PTR _input_line_pointer
	mov	al, BYTE PTR [eax]
	mov	BYTE PTR _c$[ebp], al
; Line 388
	mov	eax, DWORD PTR _input_line_pointer
	mov	BYTE PTR [eax], 0
; Line 389
	mov	eax, DWORD PTR _s$[ebp]
	push	eax
	call	_md_assemble
	add	esp, 4
; Line 390
	mov	al, BYTE PTR _c$[ebp]
	mov	ecx, DWORD PTR _input_line_pointer
	mov	BYTE PTR [ecx], al
	inc	DWORD PTR _input_line_pointer
; Line 392
$L530:
; Line 393
$L521:
$L518:
; Line 394
	jmp	$L511
; Line 398
$L516:
	movsx	eax, BYTE PTR _c$[ebp]
	movsx	eax, BYTE PTR _is_end_of_line[eax]
	or	eax, eax
	je	$L534
; Line 400
	jmp	$L511
; Line 403
$L534:
	cmp	DWORD PTR ___mb_cur_max, 1
	jle	$L1008
	push	4
	movsx	eax, BYTE PTR _c$[ebp]
	push	eax
	call	__isctype
	add	esp, 8
	mov	DWORD PTR -52+[ebp], eax
	jmp	$L1009
$L1008:
	movsx	eax, BYTE PTR _c$[ebp]
	mov	ecx, DWORD PTR __pctype
	mov	ax, WORD PTR [ecx+eax*2]
	and	eax, 4
	mov	DWORD PTR -52+[ebp], eax
$L1009:
	cmp	DWORD PTR -52+[ebp], 0
	je	$L535
; Line 405
	movsx	eax, BYTE PTR _c$[ebp]
	sub	eax, 48					; 00000030H
	mov	DWORD PTR _temp$[ebp], eax
; Line 410
	mov	eax, DWORD PTR _input_line_pointer
	mov	DWORD PTR -56+[ebp], eax
	inc	DWORD PTR _input_line_pointer
	mov	eax, DWORD PTR -56+[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 58					; 0000003aH
	jne	$L536
; Line 412
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_local_colon
	add	esp, 4
; Line 414
	jmp	$L537
$L536:
; Line 416
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	push	OFFSET $SG538
	call	_as_bad
	add	esp, 8
; Line 417
	dec	DWORD PTR _input_line_pointer
; Line 418
	call	_ignore_rest_of_line
; Line 419
$L537:
; Line 420
	jmp	$L511
; Line 422
$L535:
	movsx	eax, BYTE PTR _c$[ebp]
	or	eax, eax
	je	$L540
	movsx	eax, BYTE PTR _c$[ebp]
	push	eax
	push	OFFSET _line_comment_chars
	call	_strchr
	add	esp, 8
	or	eax, eax
	je	$L540
; Line 428
	mov	DWORD PTR _tmp_buf$546[ebp], 0
; Line 433
	call	_bump_line_counters
; Line 434
	mov	eax, DWORD PTR _input_line_pointer
	mov	DWORD PTR _s$[ebp], eax
; Line 435
	push	4
	push	OFFSET $SG553
	mov	eax, DWORD PTR _s$[ebp]
	push	eax
	call	_strncmp
	add	esp, 12					; 0000000cH
	or	eax, eax
	je	$L552
; Line 436
	jmp	$L511
; Line 437
$L552:
	add	DWORD PTR _s$[ebp], 4
; Line 439
	push	OFFSET $SG554
	mov	eax, DWORD PTR _s$[ebp]
	push	eax
	call	_strstr
	add	esp, 8
	mov	DWORD PTR _ends$541[ebp], eax
; Line 441
	cmp	DWORD PTR _ends$541[ebp], 0
	jne	$L555
; Line 449
	mov	eax, DWORD PTR _buffer_limit$S428
	sub	eax, DWORD PTR _s$[ebp]
	mov	DWORD PTR _tmp_len$556[ebp], eax
; Line 450
	mov	eax, DWORD PTR _tmp_len$556[ebp]
	push	eax
	call	_xmalloc
	add	esp, 4
	mov	DWORD PTR _tmp_buf$546[ebp], eax
; Line 451
	mov	eax, DWORD PTR _tmp_len$556[ebp]
	push	eax
	mov	eax, DWORD PTR _s$[ebp]
	push	eax
	mov	eax, DWORD PTR _tmp_buf$546[ebp]
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
; Line 452
$L559:
; Line 453
	lea	eax, DWORD PTR _buffer$[ebp]
	push	eax
	call	_input_scrub_next_buffer
	add	esp, 4
	mov	DWORD PTR _new_tmp$544[ebp], eax
; Line 454
	cmp	DWORD PTR _new_tmp$544[ebp], 0
	jne	$L562
; Line 455
	jmp	$L561
; Line 456
	jmp	$L563
$L562:
; Line 457
	mov	eax, DWORD PTR _new_tmp$544[ebp]
	mov	DWORD PTR _buffer_limit$S428, eax
$L563:
; Line 458
	mov	eax, DWORD PTR _buffer$[ebp]
	mov	DWORD PTR _input_line_pointer, eax
; Line 459
	push	OFFSET $SG564
	mov	eax, DWORD PTR _buffer$[ebp]
	push	eax
	call	_strstr
	add	esp, 8
	mov	DWORD PTR _ends$541[ebp], eax
; Line 460
	cmp	DWORD PTR _ends$541[ebp], 0
	je	$L565
; Line 461
	mov	eax, DWORD PTR _ends$541[ebp]
	sub	eax, DWORD PTR _buffer$[ebp]
	mov	DWORD PTR _num$557[ebp], eax
; Line 462
	jmp	$L566
$L565:
; Line 463
	mov	eax, DWORD PTR _buffer_limit$S428
	sub	eax, DWORD PTR _buffer$[ebp]
	mov	DWORD PTR _num$557[ebp], eax
$L566:
; Line 465
	mov	eax, DWORD PTR _num$557[ebp]
	add	eax, DWORD PTR _tmp_len$556[ebp]
	push	eax
	mov	eax, DWORD PTR _tmp_buf$546[ebp]
	push	eax
	call	_xrealloc
	add	esp, 8
	mov	DWORD PTR _tmp_buf$546[ebp], eax
; Line 466
	mov	eax, DWORD PTR _num$557[ebp]
	push	eax
	mov	eax, DWORD PTR _buffer$[ebp]
	push	eax
	mov	eax, DWORD PTR _tmp_len$556[ebp]
	add	eax, DWORD PTR _tmp_buf$546[ebp]
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
; Line 467
	mov	eax, DWORD PTR _num$557[ebp]
	add	DWORD PTR _tmp_len$556[ebp], eax
; Line 468
$L560:
	cmp	DWORD PTR _ends$541[ebp], 0
	je	$L559
$L561:
; Line 470
	cmp	DWORD PTR _ends$541[ebp], 0
	je	$L1010
	mov	eax, DWORD PTR _ends$541[ebp]
	add	eax, 8
	mov	DWORD PTR _input_line_pointer, eax
	jmp	$L1011
$L1010:
	mov	DWORD PTR _input_line_pointer, 0
$L1011:
; Line 472
	mov	eax, DWORD PTR _tmp_buf$546[ebp]
	mov	DWORD PTR _s$[ebp], eax
; Line 473
	mov	eax, DWORD PTR _tmp_len$556[ebp]
	add	eax, DWORD PTR _s$[ebp]
	mov	DWORD PTR _ends$541[ebp], eax
; Line 475
	jmp	$L567
$L555:
; Line 476
	mov	eax, DWORD PTR _ends$541[ebp]
	add	eax, 8
	mov	DWORD PTR _input_line_pointer, eax
; Line 477
$L567:
; Line 478
	push	100					; 00000064H
	call	_xmalloc
	add	esp, 4
	mov	DWORD PTR _new_buf$543[ebp], eax
; Line 479
	mov	DWORD PTR _new_length$545[ebp], 100	; 00000064H
; Line 480
	mov	eax, DWORD PTR _new_buf$543[ebp]
	mov	DWORD PTR _new_tmp$544[ebp], eax
; Line 482
	mov	eax, DWORD PTR _s$[ebp]
	mov	DWORD PTR _scrub_string, eax
; Line 483
	mov	eax, DWORD PTR _ends$541[ebp]
	mov	DWORD PTR _scrub_last_string, eax
; Line 484
$L569:
; Line 487
	push	OFFSET _scrub_to_string
	push	OFFSET _scrub_from_string
	call	_do_scrub_next_char
	add	esp, 8
	mov	DWORD PTR _ch$571[ebp], eax
; Line 488
	cmp	DWORD PTR _ch$571[ebp], -1
	jne	$L573
	jmp	$L570
; Line 489
$L573:
	mov	al, BYTE PTR _ch$571[ebp]
	mov	ecx, DWORD PTR _new_tmp$544[ebp]
	mov	BYTE PTR [ecx], al
	inc	DWORD PTR _new_tmp$544[ebp]
; Line 490
	mov	eax, DWORD PTR _new_length$545[ebp]
	add	eax, DWORD PTR _new_buf$543[ebp]
	cmp	eax, DWORD PTR _new_tmp$544[ebp]
	jne	$L574
; Line 491
	mov	eax, DWORD PTR _new_length$545[ebp]
	add	eax, 100				; 00000064H
	push	eax
	mov	eax, DWORD PTR _new_buf$543[ebp]
	push	eax
	call	_xrealloc
	add	esp, 8
	mov	DWORD PTR _new_buf$543[ebp], eax
; Line 492
	mov	eax, DWORD PTR _new_length$545[ebp]
	add	eax, DWORD PTR _new_buf$543[ebp]
	mov	DWORD PTR _new_tmp$544[ebp], eax
; Line 493
	add	DWORD PTR _new_length$545[ebp], 100	; 00000064H
; Line 495
$L574:
	jmp	$L569
$L570:
; Line 497
	cmp	DWORD PTR _tmp_buf$546[ebp], 0
	je	$L575
; Line 498
	mov	eax, DWORD PTR _tmp_buf$546[ebp]
	push	eax
	call	_free
	add	esp, 4
; Line 499
$L575:
	mov	eax, DWORD PTR _buffer$[ebp]
	mov	DWORD PTR _old_buffer$S432, eax
; Line 500
	mov	eax, DWORD PTR _input_line_pointer
	mov	DWORD PTR _old_input$S433, eax
; Line 501
	mov	eax, DWORD PTR _buffer_limit$S428
	mov	DWORD PTR _old_limit$S434, eax
; Line 502
	mov	eax, DWORD PTR _new_buf$543[ebp]
	mov	DWORD PTR _buffer$[ebp], eax
; Line 503
	mov	eax, DWORD PTR _new_buf$543[ebp]
	mov	DWORD PTR _input_line_pointer, eax
; Line 504
	mov	eax, DWORD PTR _new_tmp$544[ebp]
	mov	DWORD PTR _buffer_limit$S428, eax
; Line 505
	jmp	$L511
; Line 508
$L540:
	movsx	eax, BYTE PTR _c$[ebp]
	push	eax
	push	OFFSET $SG576
	call	_as_bad
	add	esp, 8
; Line 509
	call	_ignore_rest_of_line
; Line 510
	jmp	$L511
$L512:
; Line 511
	cmp	DWORD PTR _old_buffer$S432, 0
	je	$L577
; Line 512
	call	_bump_line_counters
; Line 513
	cmp	DWORD PTR _old_input$S433, 0
	jne	$L578
; Line 514
	jmp	$L501
; Line 515
$L578:
	mov	eax, DWORD PTR _old_buffer$S432
	mov	DWORD PTR _buffer$[ebp], eax
; Line 516
	mov	eax, DWORD PTR _old_input$S433
	mov	DWORD PTR _input_line_pointer, eax
; Line 517
	mov	eax, DWORD PTR _old_limit$S434
	mov	DWORD PTR _buffer_limit$S428, eax
; Line 518
	mov	DWORD PTR _old_buffer$S432, 0
; Line 519
	jmp	$contin$509
; Line 521
$L577:
	jmp	$L507
$L508:
; Line 522
$L501:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_read_a_source_file ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG580	DB	'.abort detected.  Abandoning ship.', 00H
_DATA	ENDS
_TEXT	SEGMENT
_s_abort PROC NEAR
; Line 526
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 527
	push	OFFSET $SG580
	call	_as_fatal
	add	esp, 4
; Line 528
$L579:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_s_abort ENDP
_TEXT	ENDS
PUBLIC	_get_absolute_expression
EXTRN	_frag_align:NEAR
EXTRN	_need_pass_2:DWORD
_DATA	SEGMENT
	ORG $+1
$SG585	DB	'Alignment too large: %d. assumed.', 00H
	ORG $+2
$SG588	DB	'Alignment negative. 0 assumed.', 00H
_DATA	ENDS
_TEXT	SEGMENT
_temp$ = -8
_temp_fill$ = -4
_s_align PROC NEAR
; Line 572
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 576
	call	_get_absolute_expression
	mov	DWORD PTR _temp$[ebp], eax
; Line 578
	cmp	DWORD PTR _temp$[ebp], 15		; 0000000fH
	jle	$L584
; Line 579
	mov	DWORD PTR _temp$[ebp], 15		; 0000000fH
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	push	OFFSET $SG585
	call	_as_bad
	add	esp, 8
; Line 580
	jmp	$L586
$L584:
	cmp	DWORD PTR _temp$[ebp], 0
	jge	$L587
; Line 581
	push	OFFSET $SG588
	call	_as_bad
	add	esp, 4
; Line 582
	mov	DWORD PTR _temp$[ebp], 0
; Line 584
$L587:
$L586:
	mov	eax, DWORD PTR _input_line_pointer
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 44					; 0000002cH
	jne	$L589
; Line 585
	inc	DWORD PTR _input_line_pointer
; Line 586
	call	_get_absolute_expression
	mov	DWORD PTR _temp_fill$[ebp], eax
; Line 587
	jmp	$L590
$L589:
; Line 588
	mov	DWORD PTR _temp_fill$[ebp], 0
$L590:
; Line 590
	cmp	DWORD PTR _temp$[ebp], 0
	je	$L591
	cmp	DWORD PTR _need_pass_2, 0
	jne	$L591
; Line 591
	mov	eax, DWORD PTR _temp_fill$[ebp]
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_frag_align
	add	esp, 8
; Line 592
$L591:
	call	_demand_empty_rest_of_line
; Line 593
$L581:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_s_align ENDP
_TEXT	ENDS
EXTRN	_symbol_find_or_make:NEAR
EXTRN	_as_warn:NEAR
_DATA	SEGMENT
	ORG $+1
$SG599	DB	'Expected comma after symbol-name', 00H
	ORG $+3
$SG602	DB	'.COMMon length (%d.) <0! Ignored.', 00H
	ORG $+2
$SG605	DB	'Ignoring attempt to re-define symbol', 00H
	ORG $+3
$SG608	DB	'Length of .comm "%s" is already %d. Not changed to %d.', 00H
_DATA	ENDS
_TEXT	SEGMENT
_name$ = -4
_c$ = -12
_p$ = -20
_temp$ = -16
_symbolP$ = -8
_s_comm	PROC NEAR
; Line 598
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	push	ebx
	push	esi
	push	edi
; Line 605
	mov	eax, DWORD PTR _input_line_pointer
	mov	DWORD PTR _name$[ebp], eax
; Line 606
	call	_get_symbol_end
	mov	BYTE PTR _c$[ebp], al
; Line 608
	mov	eax, DWORD PTR _input_line_pointer
	mov	DWORD PTR _p$[ebp], eax
; Line 609
	mov	al, BYTE PTR _c$[ebp]
	mov	ecx, DWORD PTR _p$[ebp]
	mov	BYTE PTR [ecx], al
; Line 611
	mov	eax, DWORD PTR _input_line_pointer
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 44					; 0000002cH
	je	$L598
; Line 612
	push	OFFSET $SG599
	call	_as_bad
	add	esp, 4
; Line 613
	call	_ignore_rest_of_line
; Line 614
	jmp	$L592
; Line 616
$L598:
	inc	DWORD PTR _input_line_pointer
; Line 617
	call	_get_absolute_expression
	mov	DWORD PTR _temp$[ebp], eax
	cmp	DWORD PTR _temp$[ebp], 0
	jge	$L600
; Line 618
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	push	OFFSET $SG602
	call	_as_warn
	add	esp, 8
; Line 619
	call	_ignore_rest_of_line
; Line 620
	jmp	$L592
; Line 622
$L600:
	mov	eax, DWORD PTR _p$[ebp]
	mov	BYTE PTR [eax], 0
; Line 623
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_symbol_find_or_make
	add	esp, 4
	mov	DWORD PTR _symbolP$[ebp], eax
; Line 624
	mov	al, BYTE PTR _c$[ebp]
	mov	ecx, DWORD PTR _p$[ebp]
	mov	BYTE PTR [ecx], al
; Line 626
	mov	eax, DWORD PTR _symbolP$[ebp]
	mov	al, BYTE PTR [eax+4]
	and	eax, 255				; 000000ffH
	test	al, 30					; 0000001eH
	jne	$L604
	mov	eax, DWORD PTR _symbolP$[ebp]
	movsx	eax, BYTE PTR [eax+5]
	or	eax, eax
	jne	$L604
	mov	eax, DWORD PTR _symbolP$[ebp]
	movsx	eax, WORD PTR [eax+6]
	or	eax, eax
	je	$L603
$L604:
; Line 627
	push	OFFSET $SG605
	call	_as_warn
	add	esp, 4
; Line 628
	call	_ignore_rest_of_line
; Line 629
	jmp	$L592
; Line 631
$L603:
	mov	eax, DWORD PTR _symbolP$[ebp]
	cmp	DWORD PTR [eax+8], 0
	je	$L606
; Line 632
	mov	eax, DWORD PTR _symbolP$[ebp]
	mov	ecx, DWORD PTR _temp$[ebp]
	cmp	DWORD PTR [eax+8], ecx
	je	$L607
; Line 634
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	mov	eax, DWORD PTR _symbolP$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _symbolP$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	push	OFFSET $SG608
	call	_as_warn
	add	esp, 16					; 00000010H
; Line 635
$L607:
	jmp	$L609
$L606:
; Line 636
	mov	eax, DWORD PTR _temp$[ebp]
	mov	ecx, DWORD PTR _symbolP$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 637
	mov	eax, DWORD PTR _symbolP$[ebp]
	mov	al, BYTE PTR [eax+4]
	and	eax, 255				; 000000ffH
	or	al, 1
	mov	ecx, DWORD PTR _symbolP$[ebp]
	mov	BYTE PTR [ecx+4], al
; Line 638
$L609:
; Line 644
	call	_demand_empty_rest_of_line
; Line 645
$L592:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_s_comm	ENDP
_temp$ = -4
_s_data	PROC NEAR
; Line 662
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 665
	call	_get_absolute_expression
	mov	DWORD PTR _temp$[ebp], eax
; Line 666
	xor	eax, eax
	mov	al, BYTE PTR _temp$[ebp]
	push	eax
	push	2
	call	_subseg_new
	add	esp, 8
; Line 670
	call	_demand_empty_rest_of_line
; Line 671
$L610:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_s_data	ENDP
_TEXT	ENDS
EXTRN	_symbol_find:NEAR
_DATA	SEGMENT
	ORG $+1
$SG619	DB	'Expected comma after name "%s"', 00H
_DATA	ENDS
_TEXT	SEGMENT
_name$ = -4
_c$ = -12
_p$ = -20
_symbolP$ = -8
_temp$ = -16
_s_desc	PROC NEAR
; Line 675
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	push	ebx
	push	esi
	push	edi
; Line 685
	mov	eax, DWORD PTR _input_line_pointer
	mov	DWORD PTR _name$[ebp], eax
; Line 686
	call	_get_symbol_end
	mov	BYTE PTR _c$[ebp], al
; Line 687
	mov	eax, DWORD PTR _input_line_pointer
	mov	DWORD PTR _p$[ebp], eax
; Line 688
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_symbol_find
	add	esp, 4
	mov	DWORD PTR _symbolP$[ebp], eax
; Line 689
	mov	al, BYTE PTR _c$[ebp]
	mov	ecx, DWORD PTR _p$[ebp]
	mov	BYTE PTR [ecx], al
; Line 691
	mov	eax, DWORD PTR _input_line_pointer
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 44					; 0000002cH
	je	$L618
; Line 692
	mov	eax, DWORD PTR _p$[ebp]
	mov	BYTE PTR [eax], 0
; Line 693
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	push	OFFSET $SG619
	call	_as_bad
	add	esp, 8
; Line 694
	mov	al, BYTE PTR _c$[ebp]
	mov	ecx, DWORD PTR _p$[ebp]
	mov	BYTE PTR [ecx], al
; Line 695
	call	_ignore_rest_of_line
; Line 696
	jmp	$L620
$L618:
; Line 697
	inc	DWORD PTR _input_line_pointer
; Line 698
	call	_get_absolute_expression
	mov	DWORD PTR _temp$[ebp], eax
; Line 699
	mov	eax, DWORD PTR _p$[ebp]
	mov	BYTE PTR [eax], 0
; Line 700
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_symbol_find_or_make
	add	esp, 4
	mov	DWORD PTR _symbolP$[ebp], eax
; Line 701
	mov	al, BYTE PTR _c$[ebp]
	mov	ecx, DWORD PTR _p$[ebp]
	mov	BYTE PTR [ecx], al
; Line 702
	mov	eax, DWORD PTR _temp$[ebp]
	mov	ecx, DWORD PTR _symbolP$[ebp]
	mov	WORD PTR [ecx+6], ax
; Line 703
$L620:
; Line 704
	call	_demand_empty_rest_of_line
; Line 705
$L612:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_s_desc	ENDP
_TEXT	ENDS
EXTRN	_module_name:DWORD
EXTRN	_new_logical_line:NEAR
_TEXT	SEGMENT
_s$ = -4
_length$ = -8
_s_file	PROC NEAR
; Line 709
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 714
	lea	eax, DWORD PTR _length$[ebp]
	push	eax
	call	_demand_copy_C_string
	add	esp, 4
	mov	DWORD PTR _s$[ebp], eax
	cmp	DWORD PTR _s$[ebp], 0
	je	$L624
; Line 715
	mov	eax, DWORD PTR _s$[ebp]
	mov	DWORD PTR _module_name, eax
; Line 716
	push	-1
	mov	eax, DWORD PTR _s$[ebp]
	push	eax
	call	_new_logical_line
	add	esp, 8
; Line 717
	call	_demand_empty_rest_of_line
; Line 719
$L624:
$L621:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_s_file	ENDP
_TEXT	ENDS
EXTRN	_memset:NEAR
EXTRN	_frag_var:NEAR
EXTRN	_md_number_to_chars:NEAR
_DATA	SEGMENT
	ORG $+1
$SG631	DB	'Expect comma after rep-size in .fill', 00H
	ORG $+3
$SG633	DB	'Expected comma after size in .fill', 00H
	ORG $+1
$SG635	DB	'.fill size clamped to %d.', 00H
	ORG $+2
$SG637	DB	'Size negative: .fill ignored.', 00H
	ORG $+2
$SG640	DB	'Repeat < 0, .fill ignored', 00H
_DATA	ENDS
_TEXT	SEGMENT
_temp_repeat$ = -8
_temp_size$ = -12
_temp_fill$ = -4
_p$ = -16
_s_fill	PROC NEAR
; Line 723
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 729
	lea	eax, DWORD PTR _temp_repeat$[ebp]
	push	eax
	call	_get_absolute_expression_and_terminator
	add	esp, 4
	movsx	eax, al
	cmp	eax, 44					; 0000002cH
	je	$L630
; Line 730
	dec	DWORD PTR _input_line_pointer
; Line 731
	push	OFFSET $SG631
	call	_as_warn
	add	esp, 4
; Line 732
	call	_ignore_rest_of_line
; Line 733
	jmp	$L625
; Line 735
$L630:
	lea	eax, DWORD PTR _temp_size$[ebp]
	push	eax
	call	_get_absolute_expression_and_terminator
	add	esp, 4
	movsx	eax, al
	cmp	eax, 44					; 0000002cH
	je	$L632
; Line 736
	dec	DWORD PTR _input_line_pointer
; Line 737
	push	OFFSET $SG633
	call	_as_warn
	add	esp, 4
; Line 738
	call	_ignore_rest_of_line
; Line 739
	jmp	$L625
; Line 745
$L632:
	cmp	DWORD PTR _temp_size$[ebp], 8
	jle	$L634
; Line 746
	push	8
	push	OFFSET $SG635
	call	_as_bad
	add	esp, 8
; Line 747
	mov	DWORD PTR _temp_size$[ebp], 8
; Line 748
$L634:
	cmp	DWORD PTR _temp_size$[ebp], 0
	jge	$L636
; Line 749
	push	OFFSET $SG637
	call	_as_warn
	add	esp, 4
; Line 750
	mov	DWORD PTR _temp_size$[ebp], 0
; Line 751
	jmp	$L638
$L636:
	cmp	DWORD PTR _temp_repeat$[ebp], 0
	jg	$L639
; Line 752
	push	OFFSET $SG640
	call	_as_warn
	add	esp, 4
; Line 753
	mov	DWORD PTR _temp_size$[ebp], 0
; Line 755
$L639:
$L638:
	call	_get_absolute_expression
	mov	DWORD PTR _temp_fill$[ebp], eax
; Line 756
	cmp	DWORD PTR _temp_size$[ebp], 0
	je	$L641
	cmp	DWORD PTR _need_pass_2, 0
	jne	$L641
; Line 757
	push	0
	mov	eax, DWORD PTR _temp_repeat$[ebp]
	push	eax
	push	0
	push	0
	mov	eax, DWORD PTR _temp_size$[ebp]
	push	eax
	mov	eax, DWORD PTR _temp_size$[ebp]
	push	eax
	push	0
	call	_frag_var
	add	esp, 28					; 0000001cH
	mov	DWORD PTR _p$[ebp], eax
; Line 758
	mov	eax, DWORD PTR _temp_size$[ebp]
	push	eax
	push	0
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 766
	mov	eax, DWORD PTR _temp_size$[ebp]
	cmp	eax, 4
	jl	$L1012
	mov	eax, 4
$L1012:
	push	eax
	mov	eax, DWORD PTR _temp_fill$[ebp]
	push	eax
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	call	_md_number_to_chars
	add	esp, 12					; 0000000cH
; Line 773
$L641:
	call	_demand_empty_rest_of_line
; Line 774
$L625:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_s_fill	ENDP
_name$ = -4
_c$ = -12
_symbolP$ = -8
_s_globl PROC NEAR
; Line 890
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 895
$L647:
; Line 896
	mov	eax, DWORD PTR _input_line_pointer
	mov	DWORD PTR _name$[ebp], eax
; Line 897
	call	_get_symbol_end
	movsx	eax, al
	mov	DWORD PTR _c$[ebp], eax
; Line 898
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_symbol_find_or_make
	add	esp, 4
	mov	DWORD PTR _symbolP$[ebp], eax
; Line 899
	mov	al, BYTE PTR _c$[ebp]
	mov	ecx, DWORD PTR _input_line_pointer
	mov	BYTE PTR [ecx], al
; Line 901
	mov	eax, DWORD PTR _symbolP$[ebp]
	mov	al, BYTE PTR [eax+4]
	and	eax, 255				; 000000ffH
	or	al, 1
	mov	ecx, DWORD PTR _symbolP$[ebp]
	mov	BYTE PTR [ecx+4], al
; Line 902
	cmp	DWORD PTR _c$[ebp], 44			; 0000002cH
	jne	$L650
; Line 903
	inc	DWORD PTR _input_line_pointer
; Line 905
	mov	eax, DWORD PTR _input_line_pointer
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 10					; 0000000aH
	jne	$L651
; Line 906
	mov	DWORD PTR _c$[ebp], 10			; 0000000aH
; Line 907
$L651:
; Line 908
$L650:
$L648:
	cmp	DWORD PTR _c$[ebp], 44			; 0000002cH
	je	$L647
$L649:
; Line 909
	call	_demand_empty_rest_of_line
; Line 910
$L643:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_s_globl ENDP
_TEXT	ENDS
EXTRN	_bss_address_frag:BYTE
EXTRN	_local_bss_counter:DWORD
_DATA	SEGMENT
	ORG $+2
$SG659	DB	'Expected comma after name', 00H
	ORG $+2
$SG661	DB	'BSS length (%d.) <0! Ignored.', 00H
	ORG $+2
$SG666	DB	'Ignoring attempt to re-define symbol from %d. to %d.', 00H
_DATA	ENDS
_TEXT	SEGMENT
_name$ = -4
_c$ = -12
_p$ = -20
_temp$ = -16
_symbolP$ = -8
_s_lcomm PROC NEAR
; Line 914
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	push	ebx
	push	esi
	push	edi
; Line 921
	mov	eax, DWORD PTR _input_line_pointer
	mov	DWORD PTR _name$[ebp], eax
; Line 922
	call	_get_symbol_end
	mov	BYTE PTR _c$[ebp], al
; Line 923
	mov	eax, DWORD PTR _input_line_pointer
	mov	DWORD PTR _p$[ebp], eax
; Line 924
	mov	al, BYTE PTR _c$[ebp]
	mov	ecx, DWORD PTR _p$[ebp]
	mov	BYTE PTR [ecx], al
; Line 926
	mov	eax, DWORD PTR _input_line_pointer
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 44					; 0000002cH
	je	$L658
; Line 927
	push	OFFSET $SG659
	call	_as_warn
	add	esp, 4
; Line 928
	call	_ignore_rest_of_line
; Line 929
	jmp	$L652
; Line 931
$L658:
	inc	DWORD PTR _input_line_pointer
; Line 932
	call	_get_absolute_expression
	mov	DWORD PTR _temp$[ebp], eax
	cmp	DWORD PTR _temp$[ebp], 0
	jge	$L660
; Line 933
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	push	OFFSET $SG661
	call	_as_warn
	add	esp, 8
; Line 934
	call	_ignore_rest_of_line
; Line 935
	jmp	$L652
; Line 937
$L660:
	mov	eax, DWORD PTR _p$[ebp]
	mov	BYTE PTR [eax], 0
; Line 938
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_symbol_find_or_make
	add	esp, 4
	mov	DWORD PTR _symbolP$[ebp], eax
; Line 939
	mov	al, BYTE PTR _c$[ebp]
	mov	ecx, DWORD PTR _p$[ebp]
	mov	BYTE PTR [ecx], al
; Line 945
	mov	eax, DWORD PTR _symbolP$[ebp]
	movsx	eax, BYTE PTR [eax+5]
	or	eax, eax
	jne	$L662
	mov	eax, DWORD PTR _symbolP$[ebp]
	movsx	eax, WORD PTR [eax+6]
	or	eax, eax
	jne	$L662
	mov	eax, DWORD PTR _symbolP$[ebp]
	mov	al, BYTE PTR [eax+4]
	and	eax, 255				; 000000ffH
	cmp	eax, 8
	jne	$L664
	mov	eax, DWORD PTR _symbolP$[ebp]
	mov	ecx, DWORD PTR _local_bss_counter
	cmp	DWORD PTR [eax+8], ecx
	je	$L663
$L664:
	mov	eax, DWORD PTR _symbolP$[ebp]
	mov	al, BYTE PTR [eax+4]
	and	eax, 255				; 000000ffH
	test	al, 30					; 0000001eH
	jne	$L662
	mov	eax, DWORD PTR _symbolP$[ebp]
	cmp	DWORD PTR [eax+8], 0
	jne	$L662
$L663:
; Line 946
	mov	eax, DWORD PTR _local_bss_counter
	mov	ecx, DWORD PTR _symbolP$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 947
	mov	eax, DWORD PTR _symbolP$[ebp]
	mov	BYTE PTR [eax+4], 8
; Line 948
	mov	eax, DWORD PTR _symbolP$[ebp]
	mov	DWORD PTR [eax+24], OFFSET _bss_address_frag
; Line 949
	mov	eax, DWORD PTR _temp$[ebp]
	add	DWORD PTR _local_bss_counter, eax
; Line 950
	jmp	$L665
$L662:
; Line 952
	mov	eax, DWORD PTR _local_bss_counter
	push	eax
	mov	eax, DWORD PTR _symbolP$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	push	OFFSET $SG666
	call	_as_warn
	add	esp, 12					; 0000000cH
$L665:
; Line 953
	call	_demand_empty_rest_of_line
; Line 954
$L652:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_s_lcomm ENDP
_s_line	PROC NEAR
; Line 958
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 962
	call	_get_absolute_expression
	push	eax
	push	0
	call	_new_logical_line
	add	esp, 8
; Line 963
	call	_demand_empty_rest_of_line
; Line 964
$L667:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_s_line	ENDP
_TEXT	ENDS
PUBLIC	_s_long
_TEXT	SEGMENT
_s_long	PROC NEAR
; Line 968
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 969
	push	4
	call	_cons
	add	esp, 4
; Line 970
$L669:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_s_long	ENDP
_TEXT	ENDS
PUBLIC	_s_int
_TEXT	SEGMENT
_s_int	PROC NEAR
; Line 974
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 975
	push	4
	call	_cons
	add	esp, 4
; Line 976
$L671:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_s_int	ENDP
_TEXT	ENDS
EXTRN	_expr:NEAR
EXTRN	_symbol_new:NEAR
EXTRN	_seg_name:BYTE
EXTRN	_seg_N_TYPE:BYTE
EXTRN	_zero_address_frag:BYTE
_DATA	SEGMENT
	ORG $+3
$SG680	DB	'Expected comma after name "%s"', 00H
	ORG $+1
$SG682	DB	'Bad expression: %s', 00H
_DATA	ENDS
_TEXT	SEGMENT
_name$ = -24
_c$ = -32
_p$ = -36
_segment$ = -20
_exp$ = -16
_symbolP$ = -28
_s_lsym	PROC NEAR
; Line 980
	push	ebp
	mov	ebp, esp
	sub	esp, 36					; 00000024H
	push	ebx
	push	esi
	push	edi
; Line 989
	mov	eax, DWORD PTR _input_line_pointer
	mov	DWORD PTR _name$[ebp], eax
; Line 990
	call	_get_symbol_end
	mov	BYTE PTR _c$[ebp], al
; Line 991
	mov	eax, DWORD PTR _input_line_pointer
	mov	DWORD PTR _p$[ebp], eax
; Line 992
	mov	al, BYTE PTR _c$[ebp]
	mov	ecx, DWORD PTR _p$[ebp]
	mov	BYTE PTR [ecx], al
; Line 994
	mov	eax, DWORD PTR _input_line_pointer
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 44					; 0000002cH
	je	$L679
; Line 995
	mov	eax, DWORD PTR _p$[ebp]
	mov	BYTE PTR [eax], 0
; Line 996
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	push	OFFSET $SG680
	call	_as_warn
	add	esp, 8
; Line 997
	mov	al, BYTE PTR _c$[ebp]
	mov	ecx, DWORD PTR _p$[ebp]
	mov	BYTE PTR [ecx], al
; Line 998
	call	_ignore_rest_of_line
; Line 999
	jmp	$L672
; Line 1001
$L679:
	inc	DWORD PTR _input_line_pointer
; Line 1002
	lea	eax, DWORD PTR _exp$[ebp]
	push	eax
	push	0
	call	_expr
	add	esp, 8
	mov	DWORD PTR _segment$[ebp], eax
; Line 1004
	cmp	DWORD PTR _segment$[ebp], 0
	je	$L681
	cmp	DWORD PTR _segment$[ebp], 2
	je	$L681
	cmp	DWORD PTR _segment$[ebp], 1
	je	$L681
	cmp	DWORD PTR _segment$[ebp], 3
	je	$L681
; Line 1005
	mov	eax, DWORD PTR _segment$[ebp]
	mov	eax, DWORD PTR _seg_name[eax*4]
	push	eax
	push	OFFSET $SG682
	call	_as_bad
	add	esp, 8
; Line 1006
	call	_ignore_rest_of_line
; Line 1007
	jmp	$L672
; Line 1009
$L681:
; Line 1010
	mov	eax, DWORD PTR _p$[ebp]
	mov	BYTE PTR [eax], 0
; Line 1012
	push	OFFSET _zero_address_frag
	mov	eax, DWORD PTR _exp$[ebp+8]
	push	eax
	push	0
	push	0
	mov	eax, DWORD PTR _segment$[ebp]
	mov	al, BYTE PTR _seg_N_TYPE[eax*4]
	and	eax, 255				; 000000ffH
	push	eax
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_symbol_new
	add	esp, 24					; 00000018H
	mov	DWORD PTR _symbolP$[ebp], eax
; Line 1013
	mov	al, BYTE PTR _c$[ebp]
	mov	ecx, DWORD PTR _p$[ebp]
	mov	BYTE PTR [ecx], al
; Line 1014
	call	_demand_empty_rest_of_line
; Line 1015
$L672:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_s_lsym	ENDP
_TEXT	ENDS
EXTRN	_now_seg:DWORD
_DATA	SEGMENT
	ORG $+1
$SG692	DB	'Illegal segment "%s". Segment "%s" assumed.', 00H
_DATA	ENDS
_TEXT	SEGMENT
_segment$ = -24
_exp$ = -16
_temp_fill$ = -20
_p$ = -28
_s_org	PROC NEAR
; Line 1019
	push	ebp
	mov	ebp, esp
	sub	esp, 28					; 0000001cH
	push	ebx
	push	esi
	push	edi
; Line 1039
	lea	eax, DWORD PTR _exp$[ebp]
	push	eax
	call	_get_known_segmented_expression
	add	esp, 4
	mov	DWORD PTR _segment$[ebp], eax
; Line 1040
	mov	eax, DWORD PTR _input_line_pointer
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 44					; 0000002cH
	jne	$L688
; Line 1041
	inc	DWORD PTR _input_line_pointer
; Line 1042
	call	_get_absolute_expression
	mov	DWORD PTR _temp_fill$[ebp], eax
; Line 1043
	jmp	$L689
$L688:
; Line 1044
	mov	DWORD PTR _temp_fill$[ebp], 0
$L689:
; Line 1045
	cmp	DWORD PTR _need_pass_2, 0
	jne	$L690
; Line 1046
	mov	eax, DWORD PTR _segment$[ebp]
	cmp	DWORD PTR _now_seg, eax
	je	$L691
	cmp	DWORD PTR _segment$[ebp], 0
	je	$L691
; Line 1048
	mov	eax, DWORD PTR _now_seg
	mov	eax, DWORD PTR _seg_name[eax*4]
	push	eax
	mov	eax, DWORD PTR _segment$[ebp]
	mov	eax, DWORD PTR _seg_name[eax*4]
	push	eax
	push	OFFSET $SG692
	call	_as_warn
	add	esp, 12					; 0000000cH
; Line 1049
$L691:
; Line 1050
	push	0
	mov	eax, DWORD PTR _exp$[ebp+8]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	push	eax
	push	0
	push	1
	push	1
	push	2
	call	_frag_var
	add	esp, 28					; 0000001cH
	mov	DWORD PTR _p$[ebp], eax
; Line 1051
	mov	al, BYTE PTR _temp_fill$[ebp]
	mov	ecx, DWORD PTR _p$[ebp]
	mov	BYTE PTR [ecx], al
; Line 1053
$L690:
	call	_demand_empty_rest_of_line
; Line 1054
$L683:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_s_org	ENDP
_TEXT	ENDS
_DATA	SEGMENT
$SG699	DB	'Expected comma after name "%s"', 00H
	ORG $+1
$SG706	DB	'Illegal segment "%s". Segment "%s" assumed.', 00H
_DATA	ENDS
_TEXT	SEGMENT
_name$ = -4
_delim$ = -16
_end_name$ = -12
_symbolP$ = -8
_segment$701 = -40
_exp$702 = -32
_ptr$703 = -36
_s_set	PROC NEAR
; Line 1058
	push	ebp
	mov	ebp, esp
	sub	esp, 40					; 00000028H
	push	ebx
	push	esi
	push	edi
; Line 1069
	mov	eax, DWORD PTR _input_line_pointer
	mov	DWORD PTR _name$[ebp], eax
; Line 1070
	call	_get_symbol_end
	mov	BYTE PTR _delim$[ebp], al
; Line 1071
	mov	eax, DWORD PTR _input_line_pointer
	mov	DWORD PTR _end_name$[ebp], eax
; Line 1072
	mov	al, BYTE PTR _delim$[ebp]
	mov	ecx, DWORD PTR _end_name$[ebp]
	mov	BYTE PTR [ecx], al
; Line 1074
	mov	eax, DWORD PTR _input_line_pointer
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 44					; 0000002cH
	je	$L698
; Line 1075
	mov	eax, DWORD PTR _end_name$[ebp]
	mov	BYTE PTR [eax], 0
; Line 1076
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	push	OFFSET $SG699
	call	_as_warn
	add	esp, 8
; Line 1077
	mov	al, BYTE PTR _delim$[ebp]
	mov	ecx, DWORD PTR _end_name$[ebp]
	mov	BYTE PTR [ecx], al
; Line 1078
	call	_ignore_rest_of_line
; Line 1079
	jmp	$L693
; Line 1081
$L698:
	inc	DWORD PTR _input_line_pointer
; Line 1082
	mov	eax, DWORD PTR _end_name$[ebp]
	mov	BYTE PTR [eax], 0
; Line 1083
	mov	eax, DWORD PTR _name$[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 46					; 0000002eH
	jne	$L700
	mov	eax, DWORD PTR _name$[ebp]
	movsx	eax, BYTE PTR [eax+1]
	or	eax, eax
	jne	$L700
; Line 1089
	lea	eax, DWORD PTR _exp$702[ebp]
	push	eax
	call	_get_known_segmented_expression
	add	esp, 4
	mov	DWORD PTR _segment$701[ebp], eax
; Line 1090
	cmp	DWORD PTR _need_pass_2, 0
	jne	$L704
; Line 1091
	mov	eax, DWORD PTR _segment$701[ebp]
	cmp	DWORD PTR _now_seg, eax
	je	$L705
	cmp	DWORD PTR _segment$701[ebp], 0
	je	$L705
; Line 1093
	mov	eax, DWORD PTR _now_seg
	mov	eax, DWORD PTR _seg_name[eax*4]
	push	eax
	mov	eax, DWORD PTR _segment$701[ebp]
	mov	eax, DWORD PTR _seg_name[eax*4]
	push	eax
	push	OFFSET $SG706
	call	_as_warn
	add	esp, 12					; 0000000cH
; Line 1094
$L705:
; Line 1095
	push	0
	mov	eax, DWORD PTR _exp$702[ebp+8]
	push	eax
	mov	eax, DWORD PTR _exp$702[ebp]
	push	eax
	push	0
	push	1
	push	1
	push	2
	call	_frag_var
	add	esp, 28					; 0000001cH
	mov	DWORD PTR _ptr$703[ebp], eax
; Line 1096
	mov	eax, DWORD PTR _ptr$703[ebp]
	mov	BYTE PTR [eax], 0
; Line 1098
$L704:
	mov	al, BYTE PTR _delim$[ebp]
	mov	ecx, DWORD PTR _end_name$[ebp]
	mov	BYTE PTR [ecx], al
; Line 1099
	jmp	$L693
; Line 1101
$L700:
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_symbol_find_or_make
	add	esp, 4
	mov	DWORD PTR _symbolP$[ebp], eax
; Line 1102
	mov	al, BYTE PTR _delim$[ebp]
	mov	ecx, DWORD PTR _end_name$[ebp]
	mov	BYTE PTR [ecx], al
; Line 1103
	mov	eax, DWORD PTR _symbolP$[ebp]
	push	eax
	call	_pseudo_set
	add	esp, 4
; Line 1104
	call	_demand_empty_rest_of_line
; Line 1105
$L693:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_s_set	ENDP
_TEXT	ENDS
_DATA	SEGMENT
$SG714	DB	'Repeat < 0, .space ignored', 00H
_DATA	ENDS
_TEXT	SEGMENT
_temp_repeat$ = -8
_temp_fill$ = -4
_p$ = -12
_s_space PROC NEAR
; Line 1109
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 1115
	lea	eax, DWORD PTR _temp_repeat$[ebp]
	push	eax
	call	_get_absolute_expression_and_terminator
	add	esp, 4
	movsx	eax, al
	cmp	eax, 44					; 0000002cH
	jne	$L711
; Line 1116
	call	_get_absolute_expression
	mov	DWORD PTR _temp_fill$[ebp], eax
; Line 1117
	jmp	$L712
$L711:
; Line 1118
	dec	DWORD PTR _input_line_pointer
; Line 1119
	mov	DWORD PTR _temp_fill$[ebp], 0
; Line 1120
$L712:
; Line 1121
	cmp	DWORD PTR _temp_repeat$[ebp], 0
	jg	$L713
; Line 1122
	push	OFFSET $SG714
	call	_as_warn
	add	esp, 4
; Line 1123
	call	_ignore_rest_of_line
; Line 1124
	jmp	$L707
; Line 1126
$L713:
	cmp	DWORD PTR _need_pass_2, 0
	jne	$L715
; Line 1128
	push	0
	mov	eax, DWORD PTR _temp_repeat$[ebp]
	push	eax
	push	0
	push	0
	push	1
	push	1
	push	0
	call	_frag_var
	add	esp, 28					; 0000001cH
	mov	DWORD PTR _p$[ebp], eax
; Line 1129
	mov	al, BYTE PTR _temp_fill$[ebp]
	mov	ecx, DWORD PTR _p$[ebp]
	mov	BYTE PTR [ecx], al
; Line 1131
$L715:
	call	_demand_empty_rest_of_line
; Line 1132
$L707:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_s_space ENDP
_temp$ = -4
_s_text	PROC NEAR
; Line 1136
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 1139
	call	_get_absolute_expression
	mov	DWORD PTR _temp$[ebp], eax
; Line 1140
	xor	eax, eax
	mov	al, BYTE PTR _temp$[ebp]
	push	eax
	push	1
	call	_subseg_new
	add	esp, 8
; Line 1141
	call	_demand_empty_rest_of_line
; Line 1142
$L716:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_s_text	ENDP
_demand_empty_rest_of_line PROC NEAR
; Line 1149
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1151
	mov	eax, DWORD PTR _input_line_pointer
	movsx	eax, BYTE PTR [eax]
	movsx	eax, BYTE PTR _is_end_of_line[eax]
	or	eax, eax
	je	$L719
; Line 1153
	inc	DWORD PTR _input_line_pointer
; Line 1155
	jmp	$L720
$L719:
; Line 1157
	call	_ignore_rest_of_line
; Line 1158
$L720:
; Line 1160
$L718:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_demand_empty_rest_of_line ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG723	DB	'Rest of line ignored. 1st junk character valued %d (%c).'
	DB	00H
_DATA	ENDS
_TEXT	SEGMENT
_ignore_rest_of_line PROC NEAR
; Line 1165
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1166
	mov	eax, DWORD PTR _input_line_pointer
	movsx	eax, BYTE PTR [eax]
	movsx	eax, BYTE PTR _is_end_of_line[eax]
	or	eax, eax
	jne	$L722
; Line 1169
	mov	eax, DWORD PTR _input_line_pointer
	movsx	eax, BYTE PTR [eax]
	push	eax
	mov	eax, DWORD PTR _input_line_pointer
	movsx	eax, BYTE PTR [eax]
	push	eax
	push	OFFSET $SG723
	call	_as_warn
	add	esp, 12					; 0000000cH
; Line 1171
$L725:
	mov	eax, DWORD PTR _buffer_limit$S428
	cmp	DWORD PTR _input_line_pointer, eax
	jae	$L726
	mov	eax, DWORD PTR _input_line_pointer
	movsx	eax, BYTE PTR [eax]
	movsx	eax, BYTE PTR _is_end_of_line[eax]
	or	eax, eax
	jne	$L726
; Line 1173
	inc	DWORD PTR _input_line_pointer
; Line 1174
	jmp	$L725
$L726:
; Line 1176
$L722:
	inc	DWORD PTR _input_line_pointer
; Line 1178
$L721:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_ignore_rest_of_line ENDP
_TEXT	ENDS
EXTRN	_frags:BYTE
EXTRN	_frag_now:DWORD
_DATA	SEGMENT
	ORG $+3
$SG738	DB	'I need a comma after symbol''s name', 00H
	ORG $+1
$SG740	DB	00H
	ORG $+3
$SG750	DB	'read.c', 00H
	ORG $+1
$SG751	DB	'Case value %d unexpected at line %d of file "%s"', 0aH, 00H
	ORG $+2
$SG754	DB	'I want a comma after the n_type expression', 00H
	ORG $+1
$SG758	DB	'I want a comma after the n_other expression', 00H
$SG763	DB	'I want a comma after the n_desc expression', 00H
_DATA	ENDS
_TEXT	SEGMENT
_what$ = 8
_symbolP$ = -12
_string$ = -16
_saved_type$ = -8
_length$ = -24
_goof$ = -4
_longint$ = -20
_stab	PROC NEAR
; Line 1202
	push	ebp
	mov	ebp, esp
	sub	esp, 28					; 0000001cH
	push	ebx
	push	esi
	push	edi
; Line 1214
	mov	DWORD PTR _goof$[ebp], 0
; Line 1215
	cmp	DWORD PTR _what$[ebp], 115		; 00000073H
	jne	$L735
; Line 1216
	lea	eax, DWORD PTR _length$[ebp]
	push	eax
	call	_demand_copy_C_string
	add	esp, 4
	mov	DWORD PTR _string$[ebp], eax
; Line 1218
	mov	eax, DWORD PTR _input_line_pointer
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 44					; 0000002cH
	jne	$L736
; Line 1219
	inc	DWORD PTR _input_line_pointer
; Line 1220
	jmp	$L737
$L736:
; Line 1221
	push	OFFSET $SG738
	call	_as_warn
	add	esp, 4
; Line 1222
	mov	DWORD PTR _goof$[ebp], 1
; Line 1223
$L737:
; Line 1224
	jmp	$L739
$L735:
; Line 1225
	mov	DWORD PTR _string$[ebp], OFFSET $SG740
$L739:
; Line 1230
	cmp	DWORD PTR _goof$[ebp], 0
	jne	$L741
; Line 1231
	push	0
	push	0
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _string$[ebp]
	push	eax
	call	_symbol_new
	add	esp, 24					; 00000018H
	mov	DWORD PTR _symbolP$[ebp], eax
; Line 1232
	mov	eax, DWORD PTR _what$[ebp]
	mov	DWORD PTR -28+[ebp], eax
	jmp	$L742
; Line 1233
$L746:
; Line 1234
	mov	eax, DWORD PTR _symbolP$[ebp]
	mov	DWORD PTR [eax], 0
; Line 1235
	mov	eax, DWORD PTR _frags+12
	mov	ecx, DWORD PTR _frag_now
	add	ecx, 38					; 00000026H
	sub	eax, ecx
	mov	ecx, DWORD PTR _symbolP$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 1236
	mov	eax, DWORD PTR _frag_now
	mov	ecx, DWORD PTR _symbolP$[ebp]
	mov	DWORD PTR [ecx+24], eax
; Line 1237
	jmp	$L743
; Line 1239
$L747:
; Line 1240
	mov	eax, DWORD PTR _symbolP$[ebp]
	mov	DWORD PTR [eax+24], OFFSET _zero_address_frag
; Line 1241
	jmp	$L743
; Line 1243
$L748:
; Line 1244
	mov	eax, DWORD PTR _symbolP$[ebp]
	mov	DWORD PTR [eax+24], OFFSET _zero_address_frag
; Line 1245
	jmp	$L743
; Line 1247
$L749:
; Line 1248
	push	OFFSET $SG750
	push	1248					; 000004e0H
	mov	eax, DWORD PTR _what$[ebp]
	push	eax
	push	OFFSET $SG751
	call	_as_fatal
	add	esp, 16					; 00000010H
; Line 1249
	jmp	$L743
; Line 1250
	jmp	$L743
$L742:
	cmp	DWORD PTR -28+[ebp], 100		; 00000064H
	je	$L746
	cmp	DWORD PTR -28+[ebp], 110		; 0000006eH
	je	$L747
	cmp	DWORD PTR -28+[ebp], 115		; 00000073H
	je	$L748
	jmp	$L749
$L743:
; Line 1251
	lea	eax, DWORD PTR _longint$[ebp]
	push	eax
	call	_get_absolute_expression_and_terminator
	add	esp, 4
	movsx	eax, al
	cmp	eax, 44					; 0000002cH
	jne	$L752
; Line 1252
	mov	eax, DWORD PTR _longint$[ebp]
	mov	DWORD PTR _saved_type$[ebp], eax
	mov	al, BYTE PTR _saved_type$[ebp]
	mov	ecx, DWORD PTR _symbolP$[ebp]
	mov	BYTE PTR [ecx+4], al
; Line 1253
	jmp	$L753
$L752:
; Line 1254
	push	OFFSET $SG754
	call	_as_warn
	add	esp, 4
; Line 1255
	mov	DWORD PTR _goof$[ebp], 1
; Line 1256
	dec	DWORD PTR _input_line_pointer
; Line 1257
$L753:
; Line 1259
$L741:
	cmp	DWORD PTR _goof$[ebp], 0
	jne	$L755
; Line 1260
	lea	eax, DWORD PTR _longint$[ebp]
	push	eax
	call	_get_absolute_expression_and_terminator
	add	esp, 4
	movsx	eax, al
	cmp	eax, 44					; 0000002cH
	jne	$L756
; Line 1261
	mov	al, BYTE PTR _longint$[ebp]
	mov	ecx, DWORD PTR _symbolP$[ebp]
	mov	BYTE PTR [ecx+5], al
; Line 1262
	jmp	$L757
$L756:
; Line 1263
	push	OFFSET $SG758
	call	_as_warn
	add	esp, 4
; Line 1264
	mov	DWORD PTR _goof$[ebp], 1
; Line 1265
	dec	DWORD PTR _input_line_pointer
; Line 1266
$L757:
; Line 1268
$L755:
	cmp	DWORD PTR _goof$[ebp], 0
	jne	$L759
; Line 1269
	call	_get_absolute_expression
	mov	ecx, DWORD PTR _symbolP$[ebp]
	mov	WORD PTR [ecx+6], ax
; Line 1270
	cmp	DWORD PTR _what$[ebp], 115		; 00000073H
	je	$L761
	cmp	DWORD PTR _what$[ebp], 110		; 0000006eH
	jne	$L760
$L761:
; Line 1271
	mov	eax, DWORD PTR _input_line_pointer
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 44					; 0000002cH
	je	$L762
; Line 1272
	push	OFFSET $SG763
	call	_as_warn
	add	esp, 4
; Line 1273
	mov	DWORD PTR _goof$[ebp], 1
; Line 1274
	jmp	$L764
$L762:
; Line 1275
	inc	DWORD PTR _input_line_pointer
; Line 1276
$L764:
; Line 1278
$L760:
; Line 1279
$L759:
	cmp	DWORD PTR _goof$[ebp], 0
	jne	$L765
	cmp	DWORD PTR _what$[ebp], 115		; 00000073H
	je	$L766
	cmp	DWORD PTR _what$[ebp], 110		; 0000006eH
	jne	$L765
$L766:
; Line 1280
	mov	eax, DWORD PTR _symbolP$[ebp]
	push	eax
	call	_pseudo_set
	add	esp, 4
; Line 1281
	mov	al, BYTE PTR _saved_type$[ebp]
	mov	ecx, DWORD PTR _symbolP$[ebp]
	mov	BYTE PTR [ecx+4], al
; Line 1283
$L765:
	cmp	DWORD PTR _goof$[ebp], 0
	je	$L767
; Line 1284
	call	_ignore_rest_of_line
; Line 1285
	jmp	$L768
$L767:
; Line 1286
	call	_demand_empty_rest_of_line
$L768:
; Line 1287
$L728:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_stab	ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG775	DB	'Missing expression: absolute 0 assumed', 00H
	ORG $+1
$SG781	DB	'Bignum', 00H
	ORG $+1
$SG782	DB	'Floating-Point', 00H
	ORG $+1
$SG783	DB	'%s number illegal. Absolute 0 assumed.', 00H
	ORG $+1
$SG785	DB	'No expression:  Using absolute 0', 00H
	ORG $+3
$SG789	DB	'Unknown expression: symbols %s and %s are in different f'
	DB	'rags.', 00H
	ORG $+2
$SG791	DB	'Complex expression. Absolute segment assumed.', 00H
	ORG $+2
$SG795	DB	'Unknown expression', 00H
	ORG $+1
$SG798	DB	'read.c', 00H
	ORG $+1
$SG799	DB	'Case value %d unexpected at line %d of file "%s"', 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_symbolP$ = 8
_exp$ = -16
_segment$ = -20
_ext$ = -24
_pseudo_set PROC NEAR
; Line 1303
	push	ebp
	mov	ebp, esp
	sub	esp, 28					; 0000001cH
	push	ebx
	push	esi
	push	edi
; Line 1309
	mov	eax, DWORD PTR _symbolP$[ebp]
	mov	al, BYTE PTR [eax+4]
	and	eax, 1
	mov	DWORD PTR _ext$[ebp], eax
; Line 1310
	lea	eax, DWORD PTR _exp$[ebp]
	push	eax
	push	0
	call	_expr
	add	esp, 8
	mov	DWORD PTR _segment$[ebp], eax
	cmp	DWORD PTR _segment$[ebp], 5
	jne	$L774
; Line 1312
	push	OFFSET $SG775
	call	_as_warn
	add	esp, 4
; Line 1313
	mov	DWORD PTR _exp$[ebp+12], 0
; Line 1314
	mov	DWORD PTR _exp$[ebp+8], 0
; Line 1316
$L774:
	mov	eax, DWORD PTR _segment$[ebp]
	mov	DWORD PTR -28+[ebp], eax
	jmp	$L776
; Line 1318
$L780:
; Line 1320
	mov	eax, OFFSET $SG781
	cmp	DWORD PTR _exp$[ebp+8], 0
	jg	$L1013
	mov	eax, OFFSET $SG782
$L1013:
	push	eax
	push	OFFSET $SG783
	call	_as_warn
	add	esp, 8
; Line 1321
	mov	eax, DWORD PTR _ext$[ebp]
	or	al, 2
	mov	ecx, DWORD PTR _symbolP$[ebp]
	mov	BYTE PTR [ecx+4], al
; Line 1322
	mov	eax, DWORD PTR _symbolP$[ebp]
	mov	DWORD PTR [eax+8], 0
; Line 1323
	mov	eax, DWORD PTR _symbolP$[ebp]
	mov	DWORD PTR [eax+24], OFFSET _zero_address_frag
; Line 1324
	jmp	$L777
; Line 1326
$L784:
; Line 1327
	push	OFFSET $SG785
	call	_as_warn
	add	esp, 4
; Line 1328
	mov	eax, DWORD PTR _ext$[ebp]
	or	al, 2
	mov	ecx, DWORD PTR _symbolP$[ebp]
	mov	BYTE PTR [ecx+4], al
; Line 1329
	mov	eax, DWORD PTR _symbolP$[ebp]
	mov	DWORD PTR [eax+8], 0
; Line 1330
	mov	eax, DWORD PTR _symbolP$[ebp]
	mov	DWORD PTR [eax+24], OFFSET _zero_address_frag
; Line 1331
	jmp	$L777
; Line 1333
$L786:
; Line 1336
	cmp	DWORD PTR _exp$[ebp], 0
	je	$L787
	cmp	DWORD PTR _exp$[ebp+4], 0
	je	$L787
	sub	eax, eax
	mov	ecx, DWORD PTR _exp$[ebp]
	mov	cl, BYTE PTR [ecx+4]
	and	ecx, 255				; 000000ffH
	mov	edx, DWORD PTR _exp$[ebp+4]
	mov	dl, BYTE PTR [edx+4]
	and	edx, 30					; 0000001eH
	xor	ecx, edx
	and	ecx, 30					; 0000001eH
	cmp	eax, ecx
	jne	$L787
; Line 1337
	mov	eax, DWORD PTR _exp$[ebp+4]
	mov	ecx, DWORD PTR _exp$[ebp]
	mov	ecx, DWORD PTR [ecx+24]
	cmp	DWORD PTR [eax+24], ecx
	je	$L788
; Line 1338
	mov	eax, DWORD PTR _exp$[ebp+4]
	mov	eax, DWORD PTR [eax]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	push	OFFSET $SG789
	call	_as_bad
	add	esp, 12					; 0000000cH
; Line 1339
	inc	DWORD PTR _need_pass_2
; Line 1341
$L788:
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _exp$[ebp+4]
	sub	eax, DWORD PTR [ecx+8]
	add	eax, DWORD PTR _exp$[ebp+8]
	mov	DWORD PTR _exp$[ebp+8], eax
; Line 1342
	jmp	$L790
$L787:
; Line 1343
	push	OFFSET $SG791
	call	_as_warn
	add	esp, 4
$L790:
; Line 1344
$L792:
; Line 1345
	mov	eax, DWORD PTR _ext$[ebp]
	or	al, 2
	mov	ecx, DWORD PTR _symbolP$[ebp]
	mov	BYTE PTR [ecx+4], al
; Line 1346
	mov	eax, DWORD PTR _exp$[ebp+8]
	mov	ecx, DWORD PTR _symbolP$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 1347
	mov	eax, DWORD PTR _symbolP$[ebp]
	mov	DWORD PTR [eax+24], OFFSET _zero_address_frag
; Line 1348
	jmp	$L777
; Line 1350
$L793:
; Line 1353
	mov	eax, DWORD PTR _segment$[ebp]
	mov	eax, DWORD PTR _seg_N_TYPE[eax*4]
	or	al, BYTE PTR _ext$[ebp]
	mov	ecx, DWORD PTR _symbolP$[ebp]
	mov	BYTE PTR [ecx+4], al
; Line 1354
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, DWORD PTR _exp$[ebp+8]
	mov	ecx, DWORD PTR _symbolP$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 1355
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	ecx, DWORD PTR _symbolP$[ebp]
	mov	DWORD PTR [ecx+24], eax
; Line 1356
	jmp	$L777
; Line 1358
$L794:
; Line 1359
	mov	eax, DWORD PTR _exp$[ebp]
	mov	ecx, DWORD PTR _symbolP$[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 1360
	push	OFFSET $SG795
	call	_as_warn
	add	esp, 4
; Line 1362
	jmp	$L777
; Line 1364
$L796:
; Line 1365
	mov	eax, DWORD PTR _exp$[ebp]
	mov	ecx, DWORD PTR _symbolP$[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 1368
	jmp	$L777
; Line 1370
$L797:
; Line 1371
	push	OFFSET $SG798
	push	1371					; 0000055bH
	mov	eax, DWORD PTR _segment$[ebp]
	push	eax
	push	OFFSET $SG799
	call	_as_fatal
	add	esp, 16					; 00000010H
; Line 1372
	jmp	$L777
; Line 1373
	jmp	$L777
$L776:
	cmp	DWORD PTR -28+[ebp], 9
	ja	$L797
	shl	DWORD PTR -28+[ebp], 2
	mov	eax, DWORD PTR -28+[ebp]
	jmp	DWORD PTR $L1014[eax]
$L1014:
	DD	OFFSET $L792
	DD	OFFSET $L793
	DD	OFFSET $L793
	DD	OFFSET $L793
	DD	OFFSET $L796
	DD	OFFSET $L784
	DD	OFFSET $L794
	DD	OFFSET $L797
	DD	OFFSET $L780
	DD	OFFSET $L786
$L777:
; Line 1374
$L770:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_pseudo_set ENDP
_TEXT	ENDS
EXTRN	_frag_more:NEAR
EXTRN	_fix_new:NEAR
EXTRN	_N_TYPE_seg:BYTE
_DATA	SEGMENT
	ORG $+2
$SG820	DB	'Subtracting symbol "%s"(segment"%s") is too hard. Absolu'
	DB	'te segment assumed.', 00H
$SG826	DB	'Bignum', 00H
	ORG $+1
$SG827	DB	'Floating-Point', 00H
	ORG $+1
$SG828	DB	'%s number illegal. Absolute 0 assumed.', 00H
	ORG $+1
$SG830	DB	'0 assumed for missing expression', 00H
	ORG $+3
$SG833	DB	'Value x%x truncated to x%x.', 00H
$SG839	DB	'read.c', 00H
	ORG $+1
$SG840	DB	'Case value %d unexpected at line %d of file "%s"', 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_x$836 = -48
_nbytes$ = 8
_c$ = -36
_mask$ = -44
_get$ = -28
_use$ = -20
_unmask$ = -32
_p$ = -40
_segment$ = -24
_exp$ = -16
_cons	PROC NEAR
; Line 1395
	push	ebp
	mov	ebp, esp
	sub	esp, 52					; 00000034H
	push	ebx
	push	esi
	push	edi
; Line 1417
	cmp	DWORD PTR _nbytes$[ebp], 4
	jb	$L811
; Line 1418
	mov	DWORD PTR _mask$[ebp], 0
; Line 1419
	jmp	$L812
$L811:
; Line 1420
	mov	eax, -1
	mov	ecx, DWORD PTR _nbytes$[ebp]
	shl	ecx, 3
	shl	eax, cl
	mov	DWORD PTR _mask$[ebp], eax
$L812:
; Line 1421
	mov	eax, DWORD PTR _mask$[ebp]
	not	eax
	mov	DWORD PTR _unmask$[ebp], eax
; Line 1432
	call	_is_it_end_of_statement
	or	eax, eax
	je	$L813
; Line 1434
	mov	BYTE PTR _c$[ebp], 0
; Line 1435
	inc	DWORD PTR _input_line_pointer
; Line 1437
	jmp	$L814
$L813:
; Line 1438
	mov	BYTE PTR _c$[ebp], 44			; 0000002cH
$L814:
; Line 1439
$L816:
	movsx	eax, BYTE PTR _c$[ebp]
	cmp	eax, 44					; 0000002cH
	jne	$L817
; Line 1441
	lea	eax, DWORD PTR _exp$[ebp]
	push	eax
	push	0
	call	_expr
	add	esp, 8
	mov	DWORD PTR _segment$[ebp], eax
; Line 1442
	cmp	DWORD PTR _need_pass_2, 0
	jne	$L818
; Line 1448
	cmp	DWORD PTR _segment$[ebp], 9
	jne	$L819
	cmp	DWORD PTR _exp$[ebp], 0
	jne	$L819
; Line 1452
	mov	eax, DWORD PTR _exp$[ebp+4]
	mov	al, BYTE PTR [eax+4]
	and	eax, 30					; 0000001eH
	mov	eax, DWORD PTR _N_TYPE_seg[eax*4]
	mov	eax, DWORD PTR _seg_name[eax*4]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp+4]
	mov	eax, DWORD PTR [eax]
	push	eax
	push	OFFSET $SG820
	call	_as_warn
	add	esp, 12					; 0000000cH
; Line 1453
	mov	DWORD PTR _segment$[ebp], 0
; Line 1456
$L819:
	mov	eax, DWORD PTR _nbytes$[ebp]
	push	eax
	call	_frag_more
	add	esp, 4
	mov	DWORD PTR _p$[ebp], eax
; Line 1457
	mov	eax, DWORD PTR _segment$[ebp]
	mov	DWORD PTR -52+[ebp], eax
	jmp	$L821
; Line 1459
$L825:
; Line 1461
	mov	eax, OFFSET $SG826
	cmp	DWORD PTR _exp$[ebp+8], 0
	jg	$L1015
	mov	eax, OFFSET $SG827
$L1015:
	push	eax
	push	OFFSET $SG828
	call	_as_warn
	add	esp, 8
; Line 1462
	mov	eax, DWORD PTR _nbytes$[ebp]
	push	eax
	push	0
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	call	_md_number_to_chars
	add	esp, 12					; 0000000cH
; Line 1463
	jmp	$L822
; Line 1465
$L829:
; Line 1466
	push	OFFSET $SG830
	call	_as_warn
	add	esp, 4
; Line 1467
	mov	DWORD PTR _exp$[ebp+8], 0
; Line 1470
$L831:
; Line 1471
	mov	eax, DWORD PTR _exp$[ebp+8]
	mov	DWORD PTR _get$[ebp], eax
; Line 1472
	mov	eax, DWORD PTR _unmask$[ebp]
	and	eax, DWORD PTR _get$[ebp]
	mov	DWORD PTR _use$[ebp], eax
; Line 1473
	mov	eax, DWORD PTR _get$[ebp]
	test	eax, DWORD PTR _mask$[ebp]
	je	$L832
	mov	eax, DWORD PTR _get$[ebp]
	and	eax, DWORD PTR _mask$[ebp]
	cmp	eax, DWORD PTR _mask$[ebp]
	je	$L832
; Line 1475
	mov	eax, DWORD PTR _use$[ebp]
	push	eax
	mov	eax, DWORD PTR _get$[ebp]
	push	eax
	push	OFFSET $SG833
	call	_as_warn
	add	esp, 12					; 0000000cH
; Line 1477
$L832:
	mov	eax, DWORD PTR _nbytes$[ebp]
	push	eax
	mov	eax, DWORD PTR _use$[ebp]
	push	eax
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	call	_md_number_to_chars
	add	esp, 12					; 0000000cH
; Line 1478
	jmp	$L822
; Line 1480
$L834:
; Line 1482
	cmp	DWORD PTR _nbytes$[ebp], 2
	jne	$L835
; Line 1485
	push	36					; 00000024H
	call	_xmalloc
	add	esp, 4
	mov	DWORD PTR _x$836[ebp], eax
; Line 1486
	mov	eax, DWORD PTR _broken_words
	mov	ecx, DWORD PTR _x$836[ebp]
	mov	DWORD PTR [ecx], eax
; Line 1487
	mov	eax, DWORD PTR _x$836[ebp]
	mov	DWORD PTR _broken_words, eax
; Line 1488
	mov	eax, DWORD PTR _frag_now
	mov	ecx, DWORD PTR _x$836[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 1489
	mov	eax, DWORD PTR _p$[ebp]
	mov	ecx, DWORD PTR _x$836[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 1490
	mov	eax, DWORD PTR _x$836[ebp]
	mov	DWORD PTR [eax+12], 0
; Line 1491
	mov	eax, DWORD PTR _exp$[ebp]
	mov	ecx, DWORD PTR _x$836[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 1492
	mov	eax, DWORD PTR _exp$[ebp+4]
	mov	ecx, DWORD PTR _x$836[ebp]
	mov	DWORD PTR [ecx+20], eax
; Line 1493
	mov	eax, DWORD PTR _exp$[ebp+8]
	mov	ecx, DWORD PTR _x$836[ebp]
	mov	DWORD PTR [ecx+24], eax
; Line 1494
	mov	eax, DWORD PTR _x$836[ebp]
	mov	DWORD PTR [eax+28], 0
; Line 1495
	inc	DWORD PTR _new_broken_words
; Line 1496
	jmp	$L822
; Line 1500
$L835:
$L837:
; Line 1517
	push	0
	mov	eax, DWORD PTR _exp$[ebp+8]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp+4]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	push	eax
	mov	eax, DWORD PTR _nbytes$[ebp]
	push	eax
	mov	eax, DWORD PTR _p$[ebp]
	mov	ecx, DWORD PTR _frag_now
	add	ecx, 38					; 00000026H
	sub	eax, ecx
	push	eax
	mov	eax, DWORD PTR _frag_now
	push	eax
	call	_fix_new
	add	esp, 28					; 0000001cH
; Line 1519
	jmp	$L822
; Line 1521
$L838:
; Line 1522
	push	OFFSET $SG839
	push	1522					; 000005f2H
	mov	eax, DWORD PTR _segment$[ebp]
	push	eax
	push	OFFSET $SG840
	call	_as_fatal
	add	esp, 16					; 00000010H
; Line 1523
	jmp	$L822
; Line 1524
	jmp	$L822
$L821:
	cmp	DWORD PTR -52+[ebp], 9
	ja	$L838
	shl	DWORD PTR -52+[ebp], 2
	mov	eax, DWORD PTR -52+[ebp]
	jmp	DWORD PTR $L1016[eax]
$L1016:
	DD	OFFSET $L831
	DD	OFFSET $L837
	DD	OFFSET $L837
	DD	OFFSET $L837
	DD	OFFSET $L837
	DD	OFFSET $L829
	DD	OFFSET $L838
	DD	OFFSET $L838
	DD	OFFSET $L825
	DD	OFFSET $L834
$L822:
; Line 1526
$L818:
	mov	eax, DWORD PTR _input_line_pointer
	mov	al, BYTE PTR [eax]
	mov	BYTE PTR _c$[ebp], al
	inc	DWORD PTR _input_line_pointer
; Line 1527
	jmp	$L816
$L817:
; Line 1528
	dec	DWORD PTR _input_line_pointer
; Line 1529
	call	_demand_empty_rest_of_line
; Line 1530
$L801:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_cons	ENDP
_TEXT	ENDS
EXTRN	_hex_value:BYTE
_BSS	SEGMENT
_bignum_high$S431 DD 01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+2
$SG862	DB	'Missing digits. 0 assumed.', 00H
	ORG $+1
$SG871	DB	'Most significant bits truncated in integer constant.', 00H
_DATA	ENDS
_TEXT	SEGMENT
_nbytes$ = 8
_c$ = -16
_radix$ = -8
_length$ = -28
_digit$ = -4
_carry$ = -20
_work$ = -12
_p$ = -24
_leading_zeroes$873 = -32
_big_cons PROC NEAR
; Line 1557
	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H
	push	ebx
	push	esi
	push	edi
; Line 1574
	call	_is_it_end_of_statement
	or	eax, eax
	je	$L851
; Line 1576
	mov	BYTE PTR _c$[ebp], 0
; Line 1578
	jmp	$L852
$L851:
; Line 1580
	mov	BYTE PTR _c$[ebp], 44			; 0000002cH
; Line 1581
	dec	DWORD PTR _input_line_pointer
; Line 1582
$L852:
; Line 1583
$L854:
	movsx	eax, BYTE PTR _c$[ebp]
	cmp	eax, 44					; 0000002cH
	jne	$L855
; Line 1585
	inc	DWORD PTR _input_line_pointer
; Line 1587
	mov	eax, DWORD PTR _input_line_pointer
	mov	al, BYTE PTR [eax]
	mov	BYTE PTR _c$[ebp], al
; Line 1589
	movsx	eax, BYTE PTR _c$[ebp]
	cmp	eax, 48					; 00000030H
	jne	$L856
; Line 1591
	inc	DWORD PTR _input_line_pointer
	mov	eax, DWORD PTR _input_line_pointer
	mov	al, BYTE PTR [eax]
	mov	BYTE PTR _c$[ebp], al
; Line 1592
	movsx	eax, BYTE PTR _c$[ebp]
	cmp	eax, 120				; 00000078H
	je	$L858
	movsx	eax, BYTE PTR _c$[ebp]
	cmp	eax, 88					; 00000058H
	jne	$L857
$L858:
; Line 1594
	inc	DWORD PTR _input_line_pointer
	mov	eax, DWORD PTR _input_line_pointer
	mov	al, BYTE PTR [eax]
	mov	BYTE PTR _c$[ebp], al
; Line 1595
	mov	DWORD PTR _radix$[ebp], 16		; 00000010H
; Line 1597
	jmp	$L859
$L857:
; Line 1599
	mov	DWORD PTR _radix$[ebp], 8
; Line 1600
$L859:
; Line 1602
	jmp	$L860
$L856:
; Line 1604
	mov	DWORD PTR _radix$[ebp], 10		; 0000000aH
; Line 1605
$L860:
; Line 1611
	movsx	eax, BYTE PTR _c$[ebp]
	movsx	eax, BYTE PTR _hex_value[eax]
	cmp	eax, DWORD PTR _radix$[ebp]
	jl	$L861
; Line 1613
	push	OFFSET $SG862
	call	_as_warn
	add	esp, 4
; Line 1615
$L861:
	mov	eax, DWORD PTR _bignum_low$S429
	dec	eax
	mov	DWORD PTR _bignum_high$S431, eax
; Line 1616
	jmp	$L863
$L864:
	inc	DWORD PTR _input_line_pointer
	mov	eax, DWORD PTR _input_line_pointer
	mov	al, BYTE PTR [eax]
	mov	BYTE PTR _c$[ebp], al
$L863:
	movsx	eax, BYTE PTR _c$[ebp]
	movsx	eax, BYTE PTR _hex_value[eax]
	mov	DWORD PTR _digit$[ebp], eax
	mov	eax, DWORD PTR _radix$[ebp]
	cmp	DWORD PTR _digit$[ebp], eax
	jge	$L865
; Line 1619
	mov	eax, DWORD PTR _digit$[ebp]
	mov	DWORD PTR _carry$[ebp], eax
; Line 1620
	mov	eax, DWORD PTR _bignum_low$S429
	mov	DWORD PTR _p$[ebp], eax
	jmp	$L866
$L867:
	inc	DWORD PTR _p$[ebp]
$L866:
	mov	eax, DWORD PTR _bignum_high$S431
	cmp	DWORD PTR _p$[ebp], eax
	ja	$L868
; Line 1622
	mov	eax, DWORD PTR _p$[ebp]
	movsx	eax, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	imul	eax, DWORD PTR _radix$[ebp]
	add	eax, DWORD PTR _carry$[ebp]
	mov	DWORD PTR _work$[ebp], eax
; Line 1623
	mov	al, BYTE PTR _work$[ebp]
	mov	ecx, DWORD PTR _p$[ebp]
	mov	BYTE PTR [ecx], al
; Line 1624
	mov	eax, DWORD PTR _work$[ebp]
	sar	eax, 8
	mov	DWORD PTR _carry$[ebp], eax
; Line 1625
	jmp	$L867
$L868:
; Line 1626
	cmp	DWORD PTR _carry$[ebp], 0
	je	$L869
; Line 1628
	call	_grow_bignum
; Line 1629
	mov	al, BYTE PTR _carry$[ebp]
	mov	ecx, DWORD PTR _bignum_high$S431
	mov	BYTE PTR [ecx], al
; Line 1632
$L869:
	jmp	$L864
$L865:
; Line 1633
	mov	eax, DWORD PTR _bignum_high$S431
	sub	eax, DWORD PTR _bignum_low$S429
	inc	eax
	mov	DWORD PTR _length$[ebp], eax
; Line 1634
	mov	eax, DWORD PTR _nbytes$[ebp]
	cmp	DWORD PTR _length$[ebp], eax
	jle	$L870
; Line 1636
	push	OFFSET $SG871
	call	_as_warn
	add	esp, 4
; Line 1638
	jmp	$L872
$L870:
; Line 1644
	mov	eax, DWORD PTR _nbytes$[ebp]
	sub	eax, DWORD PTR _length$[ebp]
	mov	DWORD PTR _leading_zeroes$873[ebp], eax
	jmp	$L874
$L875:
	dec	DWORD PTR _leading_zeroes$873[ebp]
$L874:
	cmp	DWORD PTR _leading_zeroes$873[ebp], 0
	je	$L876
; Line 1646
	call	_grow_bignum
; Line 1647
	mov	eax, DWORD PTR _bignum_high$S431
	mov	BYTE PTR [eax], 0
; Line 1648
	jmp	$L875
$L876:
; Line 1649
$L872:
; Line 1650
	cmp	DWORD PTR _need_pass_2, 0
	jne	$L877
; Line 1652
	mov	eax, DWORD PTR _nbytes$[ebp]
	push	eax
	call	_frag_more
	add	esp, 4
	mov	DWORD PTR _p$[ebp], eax
; Line 1653
	mov	eax, DWORD PTR _nbytes$[ebp]
	push	eax
	mov	eax, DWORD PTR _bignum_low$S429
	push	eax
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
; Line 1656
$L877:
; Line 1657
	mov	eax, DWORD PTR _input_line_pointer
	mov	al, BYTE PTR [eax]
	mov	BYTE PTR _c$[ebp], al
; Line 1659
	jmp	$L854
$L855:
; Line 1660
	call	_demand_empty_rest_of_line
; Line 1661
$L842:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_big_cons ENDP
_length$ = -4
_grow_bignum PROC NEAR
; Line 1665
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 1668
	inc	DWORD PTR _bignum_high$S431
; Line 1669
	mov	eax, DWORD PTR _bignum_limit$S430
	cmp	DWORD PTR _bignum_high$S431, eax
	jb	$L880
; Line 1671
	mov	eax, DWORD PTR _bignum_limit$S430
	sub	eax, DWORD PTR _bignum_low$S429
	mov	DWORD PTR _length$[ebp], eax
; Line 1672
	mov	eax, DWORD PTR _length$[ebp]
	add	eax, DWORD PTR _length$[ebp]
	push	eax
	mov	eax, DWORD PTR _bignum_low$S429
	push	eax
	call	_xrealloc
	add	esp, 8
	mov	DWORD PTR _bignum_low$S429, eax
; Line 1673
	mov	eax, DWORD PTR _length$[ebp]
	add	eax, DWORD PTR _bignum_low$S429
	mov	DWORD PTR _bignum_high$S431, eax
; Line 1674
	mov	eax, DWORD PTR _length$[ebp]
	add	eax, DWORD PTR _length$[ebp]
	add	eax, DWORD PTR _bignum_low$S429
	mov	DWORD PTR _bignum_limit$S430, eax
; Line 1676
$L880:
$L878:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_grow_bignum ENDP
_TEXT	ENDS
EXTRN	_md_atof:NEAR
_DATA	SEGMENT
	ORG $+3
$SG895	DB	'Bad floating literal: %s', 00H
_DATA	ENDS
_TEXT	SEGMENT
_float_type$ = 8
_p$ = -28
_c$ = -8
_length$ = -32
_err$ = -4
_temp$ = -24
_float_cons PROC NEAR
; Line 1702
	push	ebp
	mov	ebp, esp
	sub	esp, 36					; 00000024H
	push	ebx
	push	esi
	push	edi
; Line 1715
	call	_is_it_end_of_statement
	or	eax, eax
	je	$L888
; Line 1717
	mov	BYTE PTR _c$[ebp], 0
; Line 1718
	inc	DWORD PTR _input_line_pointer
; Line 1720
	jmp	$L889
$L888:
; Line 1722
	mov	BYTE PTR _c$[ebp], 44			; 0000002cH
; Line 1723
$L889:
; Line 1724
$L891:
	movsx	eax, BYTE PTR _c$[ebp]
	cmp	eax, 44					; 0000002cH
	jne	$L892
; Line 1734
	mov	eax, DWORD PTR _input_line_pointer
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 48					; 00000030H
	jne	$L893
	cmp	DWORD PTR ___mb_cur_max, 1
	jle	$L1017
	push	259					; 00000103H
	mov	eax, DWORD PTR _input_line_pointer
	movsx	eax, BYTE PTR [eax+1]
	push	eax
	call	__isctype
	add	esp, 8
	mov	DWORD PTR -36+[ebp], eax
	jmp	$L1018
$L1017:
	mov	eax, DWORD PTR _input_line_pointer
	movsx	eax, BYTE PTR [eax+1]
	mov	ecx, DWORD PTR __pctype
	mov	ax, WORD PTR [ecx+eax*2]
	and	eax, 259				; 00000103H
	mov	DWORD PTR -36+[ebp], eax
$L1018:
	cmp	DWORD PTR -36+[ebp], 0
	je	$L893
; Line 1735
	add	DWORD PTR _input_line_pointer, 2
; Line 1737
$L893:
	lea	eax, DWORD PTR _length$[ebp]
	push	eax
	lea	eax, DWORD PTR _temp$[ebp]
	push	eax
	mov	eax, DWORD PTR _float_type$[ebp]
	push	eax
	call	_md_atof
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _err$[ebp], eax
; Line 1740
	mov	eax, DWORD PTR _err$[ebp]
	movsx	eax, BYTE PTR [eax]
	or	eax, eax
	je	$L894
; Line 1742
	mov	eax, DWORD PTR _err$[ebp]
	push	eax
	push	OFFSET $SG895
	call	_as_warn
	add	esp, 8
; Line 1743
	call	_ignore_rest_of_line
; Line 1745
	mov	BYTE PTR _c$[ebp], 0
; Line 1747
	jmp	$L896
$L894:
; Line 1749
	cmp	DWORD PTR _need_pass_2, 0
	jne	$L897
; Line 1751
	mov	eax, DWORD PTR _length$[ebp]
	push	eax
	call	_frag_more
	add	esp, 4
	mov	DWORD PTR _p$[ebp], eax
; Line 1752
	mov	eax, DWORD PTR _length$[ebp]
	push	eax
	lea	eax, DWORD PTR _temp$[ebp]
	push	eax
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
; Line 1754
$L897:
; Line 1755
	mov	eax, DWORD PTR _input_line_pointer
	mov	al, BYTE PTR [eax]
	mov	BYTE PTR _c$[ebp], al
	inc	DWORD PTR _input_line_pointer
; Line 1758
$L896:
; Line 1759
	jmp	$L891
$L892:
; Line 1760
	dec	DWORD PTR _input_line_pointer
; Line 1761
	call	_demand_empty_rest_of_line
; Line 1762
$L882:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_float_cons ENDP
_TEXT	ENDS
EXTRN	_frag_new:NEAR
EXTRN	_frag_wane:NEAR
EXTRN	__obstack_newchunk:NEAR
_DATA	SEGMENT
	ORG $+3
$SG914	DB	'Expected "-ed string', 00H
_DATA	ENDS
_TEXT	SEGMENT
_append_zero$ = 8
_c$ = -4
_stringer PROC NEAR
; Line 1775
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 1791
	call	_is_it_end_of_statement
	or	eax, eax
	je	$L901
; Line 1793
	mov	DWORD PTR _c$[ebp], 0
; Line 1794
	inc	DWORD PTR _input_line_pointer
; Line 1796
	jmp	$L902
$L901:
; Line 1798
	mov	DWORD PTR _c$[ebp], 44			; 0000002cH
; Line 1799
$L902:
; Line 1800
	jmp	$L903
$L904:
	mov	eax, DWORD PTR _input_line_pointer
	movsx	eax, BYTE PTR [eax]
	mov	DWORD PTR _c$[ebp], eax
	inc	DWORD PTR _input_line_pointer
$L903:
	cmp	DWORD PTR _c$[ebp], 44			; 0000002cH
	jne	$L905
; Line 1803
	mov	eax, DWORD PTR _input_line_pointer
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 34					; 00000022H
	jne	$L906
; Line 1805
	inc	DWORD PTR _input_line_pointer
; Line 1806
$L908:
	call	_next_char_of_string
	mov	DWORD PTR _c$[ebp], eax
	cmp	DWORD PTR _c$[ebp], 0
	jl	$L909
; Line 1808
	mov	eax, DWORD PTR _frags+16
	sub	eax, DWORD PTR _frags+12
	cmp	eax, 1
	ja	$L910
	mov	eax, DWORD PTR _frag_now
	push	eax
	call	_frag_wane
	add	esp, 4
	push	0
	call	_frag_new
	add	esp, 4
$L910:
	mov	eax, DWORD PTR _frags+12
	inc	eax
	cmp	eax, DWORD PTR _frags+16
	jbe	$L1019
	push	1
	push	OFFSET _frags
	call	__obstack_newchunk
	add	esp, 8
	jmp	$L1020
$L1019:
$L1020:
	mov	al, BYTE PTR _c$[ebp]
	mov	ecx, DWORD PTR _frags+12
	mov	BYTE PTR [ecx], al
	inc	DWORD PTR _frags+12
; Line 1809
	jmp	$L908
$L909:
; Line 1810
	cmp	DWORD PTR _append_zero$[ebp], 0
	je	$L911
; Line 1812
	mov	eax, DWORD PTR _frags+16
	sub	eax, DWORD PTR _frags+12
	cmp	eax, 1
	ja	$L912
	mov	eax, DWORD PTR _frag_now
	push	eax
	call	_frag_wane
	add	esp, 4
	push	0
	call	_frag_new
	add	esp, 4
$L912:
	mov	eax, DWORD PTR _frags+12
	inc	eax
	cmp	eax, DWORD PTR _frags+16
	jbe	$L1021
	push	1
	push	OFFSET _frags
	call	__obstack_newchunk
	add	esp, 8
	jmp	$L1022
$L1021:
$L1022:
	mov	eax, DWORD PTR _frags+12
	mov	BYTE PTR [eax], 0
	inc	DWORD PTR _frags+12
; Line 1814
$L911:
; Line 1816
	jmp	$L913
$L906:
; Line 1818
	push	OFFSET $SG914
	call	_as_warn
	add	esp, 4
; Line 1819
$L913:
; Line 1821
	jmp	$L904
$L905:
; Line 1822
	dec	DWORD PTR _input_line_pointer
; Line 1823
	call	_demand_empty_rest_of_line
; Line 1824
$L899:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_stringer ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+3
$SG940	DB	'Bad escaped character in string, ''?'' assumed', 00H
_DATA	ENDS
_TEXT	SEGMENT
_c$ = -4
_number$934 = -8
_next_char_of_string PROC NEAR
; Line 1828
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	push	ebx
	push	esi
	push	edi
; Line 1831
	mov	eax, DWORD PTR _input_line_pointer
	movsx	eax, BYTE PTR [eax]
	mov	DWORD PTR _c$[ebp], eax
	inc	DWORD PTR _input_line_pointer
; Line 1832
	mov	eax, DWORD PTR _c$[ebp]
	mov	DWORD PTR -16+[ebp], eax
	jmp	$L917
; Line 1834
$L921:
; Line 1835
	mov	DWORD PTR _c$[ebp], -1
; Line 1836
	jmp	$L918
; Line 1838
$L922:
; Line 1839
	mov	eax, DWORD PTR _input_line_pointer
	movsx	eax, BYTE PTR [eax]
	mov	DWORD PTR _c$[ebp], eax
	inc	DWORD PTR _input_line_pointer
	mov	eax, DWORD PTR _c$[ebp]
	mov	DWORD PTR -20+[ebp], eax
	jmp	$L923
; Line 1841
$L927:
; Line 1842
	mov	DWORD PTR _c$[ebp], 8
; Line 1843
	jmp	$L924
; Line 1845
$L928:
; Line 1846
	mov	DWORD PTR _c$[ebp], 12			; 0000000cH
; Line 1847
	jmp	$L924
; Line 1849
$L929:
; Line 1850
	mov	DWORD PTR _c$[ebp], 10			; 0000000aH
; Line 1851
	jmp	$L924
; Line 1853
$L930:
; Line 1854
	mov	DWORD PTR _c$[ebp], 13			; 0000000dH
; Line 1855
	jmp	$L924
; Line 1857
$L931:
; Line 1858
	mov	DWORD PTR _c$[ebp], 9
; Line 1859
	jmp	$L924
; Line 1861
$L932:
; Line 1863
	jmp	$L924
; Line 1865
$L933:
; Line 1878
	mov	DWORD PTR _number$934[ebp], 0
	jmp	$L935
$L936:
	mov	eax, DWORD PTR _input_line_pointer
	movsx	eax, BYTE PTR [eax]
	mov	DWORD PTR _c$[ebp], eax
	inc	DWORD PTR _input_line_pointer
$L935:
	cmp	DWORD PTR ___mb_cur_max, 1
	jle	$L1023
	push	4
	mov	eax, DWORD PTR _c$[ebp]
	push	eax
	call	__isctype
	add	esp, 8
	mov	DWORD PTR -12+[ebp], eax
	jmp	$L1024
$L1023:
	mov	eax, DWORD PTR _c$[ebp]
	mov	ecx, DWORD PTR __pctype
	mov	ax, WORD PTR [ecx+eax*2]
	and	eax, 4
	mov	DWORD PTR -12+[ebp], eax
$L1024:
	cmp	DWORD PTR -12+[ebp], 0
	je	$L937
; Line 1880
	mov	eax, DWORD PTR _number$934[ebp]
	shl	eax, 3
	add	eax, DWORD PTR _c$[ebp]
	sub	eax, 48					; 00000030H
	mov	DWORD PTR _number$934[ebp], eax
; Line 1881
	jmp	$L936
$L937:
; Line 1882
	mov	eax, DWORD PTR _number$934[ebp]
	mov	DWORD PTR _c$[ebp], eax
; Line 1884
	dec	DWORD PTR _input_line_pointer
; Line 1885
	jmp	$L924
; Line 1887
$L938:
; Line 1890
	mov	DWORD PTR _c$[ebp], 10			; 0000000aH
; Line 1891
	jmp	$L924
; Line 1893
$L939:
; Line 1894
	push	OFFSET $SG940
	call	_as_warn
	add	esp, 4
; Line 1895
	mov	DWORD PTR _c$[ebp], 63			; 0000003fH
; Line 1896
	jmp	$L924
; Line 1897
	jmp	$L924
$L923:
	cmp	DWORD PTR -20+[ebp], 98			; 00000062H
	jg	$L1025
	je	$L927
	cmp	DWORD PTR -20+[ebp], 10			; 0000000aH
	je	$L938
	cmp	DWORD PTR -20+[ebp], 34			; 00000022H
	je	$L924
	cmp	DWORD PTR -20+[ebp], 48			; 00000030H
	jl	$L939
	cmp	DWORD PTR -20+[ebp], 57			; 00000039H
	jle	$L933
	cmp	DWORD PTR -20+[ebp], 92			; 0000005cH
	je	$L924
	jmp	$L939
$L1025:
	cmp	DWORD PTR -20+[ebp], 102		; 00000066H
	je	$L928
	cmp	DWORD PTR -20+[ebp], 110		; 0000006eH
	je	$L929
	cmp	DWORD PTR -20+[ebp], 114		; 00000072H
	je	$L930
	cmp	DWORD PTR -20+[ebp], 116		; 00000074H
	je	$L931
	jmp	$L939
$L924:
; Line 1898
	jmp	$L918
; Line 1900
$L941:
; Line 1901
	jmp	$L918
; Line 1902
	jmp	$L918
$L917:
	cmp	DWORD PTR -16+[ebp], 34			; 00000022H
	je	$L921
	cmp	DWORD PTR -16+[ebp], 92			; 0000005cH
	je	$L922
	jmp	$L918
$L918:
; Line 1903
	mov	eax, DWORD PTR _c$[ebp]
	jmp	$L915
; Line 1904
$L915:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_next_char_of_string ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+3
$SG948	DB	'Expected address expression: absolute 0 assumed', 00H
_DATA	ENDS
_TEXT	SEGMENT
_expP$ = 8
_retval$ = -4
_get_segmented_expression PROC NEAR
; Line 1909
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 1912
	mov	eax, DWORD PTR _expP$[ebp]
	push	eax
	push	0
	call	_expr
	add	esp, 8
	mov	DWORD PTR _retval$[ebp], eax
	cmp	DWORD PTR _retval$[ebp], 6
	je	$L947
	cmp	DWORD PTR _retval$[ebp], 5
	je	$L947
	cmp	DWORD PTR _retval$[ebp], 8
	jne	$L946
$L947:
; Line 1914
	push	OFFSET $SG948
	call	_as_warn
	add	esp, 4
; Line 1915
	mov	eax, DWORD PTR _expP$[ebp]
	mov	DWORD PTR [eax+12], 0
	mov	eax, DWORD PTR _expP$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _retval$[ebp], eax
; Line 1916
	mov	eax, DWORD PTR _expP$[ebp]
	mov	DWORD PTR [eax+8], 0
; Line 1917
	mov	eax, DWORD PTR _expP$[ebp]
	mov	DWORD PTR [eax+4], 0
	mov	eax, DWORD PTR _expP$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _expP$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 1919
$L946:
	mov	eax, DWORD PTR _retval$[ebp]
	jmp	$L944
; Line 1920
$L944:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_get_segmented_expression ENDP
_TEXT	ENDS
_DATA	SEGMENT
$SG955	DB	00H
	ORG $+3
$SG956	DB	00H
	ORG $+3
$SG958	DB	'Symbols "%s" "%s" are undefined: absolute 0 assumed.', 00H
	ORG $+3
$SG960	DB	'Symbol "%s" undefined: absolute 0 assumed.', 00H
_DATA	ENDS
_TEXT	SEGMENT
_expP$ = 8
_retval$ = -8
_name1$ = -4
_name2$ = -12
_get_known_segmented_expression PROC NEAR
; Line 1925
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 1931
	mov	eax, DWORD PTR _expP$[ebp]
	push	eax
	call	_get_segmented_expression
	add	esp, 4
	mov	DWORD PTR _retval$[ebp], eax
	cmp	DWORD PTR _retval$[ebp], 4
	jne	$L954
; Line 1933
	mov	eax, DWORD PTR _expP$[ebp]
	cmp	DWORD PTR [eax], 0
	je	$L1026
	mov	eax, DWORD PTR _expP$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _name1$[ebp], eax
	jmp	$L1027
$L1026:
	mov	DWORD PTR _name1$[ebp], OFFSET $SG955
$L1027:
; Line 1934
	mov	eax, DWORD PTR _expP$[ebp]
	cmp	DWORD PTR [eax+4], 0
	je	$L1028
	mov	eax, DWORD PTR _expP$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _name2$[ebp], eax
	jmp	$L1029
$L1028:
	mov	DWORD PTR _name2$[ebp], OFFSET $SG956
$L1029:
; Line 1935
	cmp	DWORD PTR _name1$[ebp], 0
	je	$L957
	cmp	DWORD PTR _name2$[ebp], 0
	je	$L957
; Line 1938
	mov	eax, DWORD PTR _name2$[ebp]
	push	eax
	mov	eax, DWORD PTR _name1$[ebp]
	push	eax
	push	OFFSET $SG958
	call	_as_warn
	add	esp, 12					; 0000000cH
; Line 1940
	jmp	$L959
$L957:
; Line 1943
	cmp	DWORD PTR _name1$[ebp], 0
	je	$L1030
	mov	eax, DWORD PTR _name1$[ebp]
	mov	DWORD PTR -16+[ebp], eax
	jmp	$L1031
$L1030:
	mov	eax, DWORD PTR _name2$[ebp]
	mov	DWORD PTR -16+[ebp], eax
$L1031:
	mov	eax, DWORD PTR -16+[ebp]
	push	eax
	push	OFFSET $SG960
	call	_as_warn
	add	esp, 8
; Line 1944
$L959:
; Line 1945
	mov	eax, DWORD PTR _expP$[ebp]
	mov	DWORD PTR [eax+12], 0
	mov	eax, DWORD PTR _expP$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _retval$[ebp], eax
; Line 1946
	mov	eax, DWORD PTR _expP$[ebp]
	mov	DWORD PTR [eax+8], 0
; Line 1947
	mov	eax, DWORD PTR _expP$[ebp]
	mov	DWORD PTR [eax+4], 0
	mov	eax, DWORD PTR _expP$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _expP$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 1949
$L954:
; Line 1950
	mov	eax, DWORD PTR _retval$[ebp]
	jmp	$L950
; Line 1951
$L950:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_get_known_segmented_expression ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG966	DB	'Bad Absolute Expression, absolute 0 assumed.', 00H
_DATA	ENDS
_TEXT	SEGMENT
_exp$ = -20
_s$ = -4
_get_absolute_expression PROC NEAR
; Line 1957
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	push	ebx
	push	esi
	push	edi
; Line 1961
	lea	eax, DWORD PTR _exp$[ebp]
	push	eax
	push	0
	call	_expr
	add	esp, 8
	mov	DWORD PTR _s$[ebp], eax
	cmp	DWORD PTR _s$[ebp], 0
	je	$L964
; Line 1963
	cmp	DWORD PTR _s$[ebp], 5
	je	$L965
; Line 1965
	push	OFFSET $SG966
	call	_as_warn
	add	esp, 4
; Line 1967
$L965:
	mov	DWORD PTR _exp$[ebp+8], 0
; Line 1969
$L964:
	mov	eax, DWORD PTR _exp$[ebp+8]
	jmp	$L961
; Line 1970
$L961:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_get_absolute_expression ENDP
_val_pointer$ = 8
_get_absolute_expression_and_terminator PROC NEAR
; Line 1975
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 1976
	call	_get_absolute_expression
	mov	ecx, DWORD PTR _val_pointer$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 1977
	mov	ecx, DWORD PTR _input_line_pointer
	mov	DWORD PTR -4+[ebp], ecx
	inc	DWORD PTR _input_line_pointer
	mov	ecx, DWORD PTR -4+[ebp]
	mov	al, BYTE PTR [ecx]
	jmp	$L968
; Line 1978
$L968:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_get_absolute_expression_and_terminator ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+3
$SG978	DB	'This string may not contain ''\0''', 00H
_DATA	ENDS
_TEXT	SEGMENT
_len_pointer$ = 8
_s$ = -4
_len$973 = -8
_demand_copy_C_string PROC NEAR
; Line 1989
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 1992
	mov	eax, DWORD PTR _len_pointer$[ebp]
	push	eax
	call	_demand_copy_string
	add	esp, 4
	mov	DWORD PTR _s$[ebp], eax
	cmp	DWORD PTR _s$[ebp], 0
	je	$L972
; Line 1998
	mov	eax, DWORD PTR _len_pointer$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _len$973[ebp], eax
	jmp	$L974
$L975:
	dec	DWORD PTR _len$973[ebp]
$L974:
	cmp	DWORD PTR _len$973[ebp], 0
	jle	$L976
; Line 2000
	mov	eax, DWORD PTR _s$[ebp]
	movsx	eax, BYTE PTR [eax]
	or	eax, eax
	jne	$L977
; Line 2002
	mov	DWORD PTR _s$[ebp], 0
; Line 2003
	mov	DWORD PTR _len$973[ebp], 1
; Line 2004
	mov	eax, DWORD PTR _len_pointer$[ebp]
	mov	DWORD PTR [eax], 0
; Line 2005
	push	OFFSET $SG978
	call	_as_warn
	add	esp, 4
; Line 2007
$L977:
	jmp	$L975
$L976:
; Line 2009
$L972:
	mov	eax, DWORD PTR _s$[ebp]
	jmp	$L970
; Line 2010
$L970:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_demand_copy_C_string ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+3
$SG989	DB	'Missing string', 00H
_DATA	ENDS
_TEXT	SEGMENT
_lenP$ = 8
_c$ = -8
_len$ = -12
_retval$ = -4
_demand_copy_string PROC NEAR
; Line 2021
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 2026
	mov	DWORD PTR _len$[ebp], 0
; Line 2028
	mov	eax, DWORD PTR _input_line_pointer
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 34					; 00000022H
	jne	$L984
; Line 2030
	inc	DWORD PTR _input_line_pointer
; Line 2031
$L986:
	call	_next_char_of_string
	mov	DWORD PTR _c$[ebp], eax
	cmp	DWORD PTR _c$[ebp], 0
	jl	$L987
; Line 2032
	mov	eax, DWORD PTR _notes+12
	inc	eax
	cmp	eax, DWORD PTR _notes+16
	jbe	$L1032
	push	1
	push	OFFSET _notes
	call	__obstack_newchunk
	add	esp, 8
	jmp	$L1033
$L1032:
$L1033:
	mov	al, BYTE PTR _c$[ebp]
	mov	ecx, DWORD PTR _notes+12
	mov	BYTE PTR [ecx], al
	inc	DWORD PTR _notes+12
; Line 2033
	inc	DWORD PTR _len$[ebp]
; Line 2034
	jmp	$L986
$L987:
; Line 2037
	mov	eax, DWORD PTR _notes+12
	inc	eax
	cmp	eax, DWORD PTR _notes+16
	jbe	$L1034
	push	1
	push	OFFSET _notes
	call	__obstack_newchunk
	add	esp, 8
	jmp	$L1035
$L1034:
$L1035:
	mov	eax, DWORD PTR _notes+12
	mov	BYTE PTR [eax], 0
	inc	DWORD PTR _notes+12
; Line 2038
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
	jle	$L1036
	mov	eax, DWORD PTR _notes+16
	mov	DWORD PTR _notes+12, eax
	jmp	$L1037
$L1036:
$L1037:
	mov	eax, DWORD PTR _notes+12
	mov	DWORD PTR _notes+8, eax
	mov	eax, DWORD PTR _notes+20
	mov	DWORD PTR _retval$[ebp], eax
; Line 2039
	jmp	$L988
$L984:
; Line 2040
	push	OFFSET $SG989
	call	_as_warn
	add	esp, 4
; Line 2041
	mov	DWORD PTR _retval$[ebp], 0
; Line 2042
	call	_ignore_rest_of_line
; Line 2043
$L988:
; Line 2044
	mov	eax, DWORD PTR _len$[ebp]
	mov	ecx, DWORD PTR _lenP$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 2045
	mov	eax, DWORD PTR _retval$[ebp]
	jmp	$L980
; Line 2046
$L980:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_demand_copy_string ENDP
_is_it_end_of_statement PROC NEAR
; Line 2059
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 2061
	mov	eax, DWORD PTR _input_line_pointer
	movsx	eax, BYTE PTR [eax]
	movsx	eax, BYTE PTR _is_end_of_line[eax]
	jmp	$L990
; Line 2062
$L990:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_is_it_end_of_statement ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG1005	DB	'Illegal segment "%s". Segment "%s" assumed.', 00H
_DATA	ENDS
_TEXT	SEGMENT
_sym_name$ = 8
_symbolP$ = -4
_segment$1000 = -24
_exp$1001 = -20
_p$1002 = -28
_equals	PROC NEAR
; Line 2067
	push	ebp
	mov	ebp, esp
	sub	esp, 28					; 0000001cH
	push	ebx
	push	esi
	push	edi
; Line 2070
	inc	DWORD PTR _input_line_pointer
; Line 2071
	mov	eax, DWORD PTR _input_line_pointer
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 61					; 0000003dH
	jne	$L994
; Line 2072
	inc	DWORD PTR _input_line_pointer
; Line 2074
$L994:
$L996:
	mov	eax, DWORD PTR _input_line_pointer
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 32					; 00000020H
	je	$L998
	mov	eax, DWORD PTR _input_line_pointer
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 9
	jne	$L997
$L998:
; Line 2075
	inc	DWORD PTR _input_line_pointer
	jmp	$L996
$L997:
; Line 2077
	mov	eax, DWORD PTR _sym_name$[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 46					; 0000002eH
	jne	$L999
	mov	eax, DWORD PTR _sym_name$[ebp]
	movsx	eax, BYTE PTR [eax+1]
	or	eax, eax
	jne	$L999
; Line 2083
	lea	eax, DWORD PTR _exp$1001[ebp]
	push	eax
	call	_get_known_segmented_expression
	add	esp, 4
	mov	DWORD PTR _segment$1000[ebp], eax
; Line 2084
	cmp	DWORD PTR _need_pass_2, 0
	jne	$L1003
; Line 2085
	mov	eax, DWORD PTR _segment$1000[ebp]
	cmp	DWORD PTR _now_seg, eax
	je	$L1004
	cmp	DWORD PTR _segment$1000[ebp], 0
	je	$L1004
; Line 2087
	mov	eax, DWORD PTR _now_seg
	mov	eax, DWORD PTR _seg_name[eax*4]
	push	eax
	mov	eax, DWORD PTR _segment$1000[ebp]
	mov	eax, DWORD PTR _seg_name[eax*4]
	push	eax
	push	OFFSET $SG1005
	call	_as_warn
	add	esp, 12					; 0000000cH
; Line 2088
$L1004:
; Line 2089
	push	0
	mov	eax, DWORD PTR _exp$1001[ebp+8]
	push	eax
	mov	eax, DWORD PTR _exp$1001[ebp]
	push	eax
	push	0
	push	1
	push	1
	push	2
	call	_frag_var
	add	esp, 28					; 0000001cH
	mov	DWORD PTR _p$1002[ebp], eax
; Line 2090
	mov	eax, DWORD PTR _p$1002[ebp]
	mov	BYTE PTR [eax], 0
; Line 2092
$L1003:
	jmp	$L1006
$L999:
; Line 2093
	mov	eax, DWORD PTR _sym_name$[ebp]
	push	eax
	call	_symbol_find_or_make
	add	esp, 4
	mov	DWORD PTR _symbolP$[ebp], eax
; Line 2094
	mov	eax, DWORD PTR _symbolP$[ebp]
	push	eax
	call	_pseudo_set
	add	esp, 4
; Line 2095
$L1006:
; Line 2096
$L992:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_equals	ENDP
_TEXT	ENDS
END
