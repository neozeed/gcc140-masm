	TITLE	genextract.c
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
COMM	_insn_code_number:DWORD
COMM	_dup_count:DWORD
_rtl_obstack DD	_obstack
_DATA	ENDS
PUBLIC	_walk_rtx
PUBLIC	_gen_insn
EXTRN	_printf:NEAR
_DATA	SEGMENT
$SG475	DB	'VOID', 0aH, 'extract_%d (insn)', 0aH, '     rtx insn;', 0aH
	DB	00H
	ORG $+1
$SG476	DB	'{', 0aH, 00H
	ORG $+1
$SG483	DB	'}', 0aH, 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
; File genextract.c
_insn$ = 8
_i$ = -4
_link$482 = -16
_gen_insn PROC NEAR
; Line 64
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 67
	mov	DWORD PTR _dup_count, 0
; Line 73
	mov	eax, DWORD PTR _insn_code_number
	push	eax
	push	OFFSET $SG475
	call	_printf
	add	esp, 8
; Line 74
	push	OFFSET $SG476
	call	_printf
	add	esp, 4
; Line 79
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax], 1
	jne	$L477
; Line 80
	push	0
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_walk_rtx
	add	esp, 8
; Line 81
	jmp	$L478
$L477:
; Line 82
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	dec	eax
	mov	DWORD PTR _i$[ebp], eax
	jmp	$L479
$L480:
	dec	DWORD PTR _i$[ebp]
$L479:
	cmp	DWORD PTR _i$[ebp], 0
	jl	$L481
; Line 85
	mov	DWORD PTR _link$482[ebp], 0
; Line 86
	mov	DWORD PTR _link$482[ebp+4], 0
; Line 87
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _link$482[ebp+8], eax
; Line 88
	lea	eax, DWORD PTR _link$482[ebp]
	push	eax
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	push	eax
	call	_walk_rtx
	add	esp, 8
; Line 89
	jmp	$L480
$L481:
$L478:
; Line 90
	push	OFFSET $SG483
	call	_printf
	add	esp, 4
; Line 91
$L473:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_insn ENDP
_TEXT	ENDS
PUBLIC	_gen_peephole
_DATA	SEGMENT
$SG487	DB	'VOID', 0aH, 'extract_%d (insn)', 0aH, '     rtx insn;', 0aH
	DB	00H
	ORG $+1
$SG488	DB	'{', 0aH, 00H
	ORG $+1
$SG489	DB	'  bcopy (&XVECEXP (insn, 0, 0), recog_operand,         s'
	DB	'izeof (rtx) * XVECLEN (insn, 0));', 0aH, 00H
	ORG $+1
$SG490	DB	'}', 0aH, 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_gen_peephole PROC NEAR
; Line 98
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 100
	mov	eax, DWORD PTR _insn_code_number
	push	eax
	push	OFFSET $SG487
	call	_printf
	add	esp, 8
; Line 101
	push	OFFSET $SG488
	call	_printf
	add	esp, 4
; Line 107
	push	OFFSET $SG489
	call	_printf
	add	esp, 4
; Line 108
	push	OFFSET $SG490
	call	_printf
	add	esp, 4
; Line 109
$L486:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_peephole ENDP
_TEXT	ENDS
PUBLIC	_print_path
EXTRN	_rtx_length:BYTE
EXTRN	_rtx_format:BYTE
_DATA	SEGMENT
$SG506	DB	'  recog_operand[%d] = *(recog_operand_loc[%d]', 0aH, '  '
	DB	'  = &', 00H
	ORG $+2
$SG507	DB	');', 0aH, 00H
$SG509	DB	'  recog_dup_loc[%d] = &', 00H
$SG510	DB	';', 0aH, 00H
	ORG $+1
$SG511	DB	'  recog_dup_num[%d] = %d;', 0aH, 00H
	ORG $+1
$SG513	DB	'  recog_operand[%d] = *(recog_operand_loc[%d]', 0aH, '  '
	DB	'  = &', 00H
	ORG $+2
$SG514	DB	');', 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_j$526 = -32
_x$ = 8
_path$ = 12
_code$ = -20
_i$ = -24
_len$ = -28
_fmt$ = -16
_link$ = -12
_walk_rtx PROC NEAR
; Line 115
	push	ebp
	mov	ebp, esp
	sub	esp, 36					; 00000024H
	push	ebx
	push	esi
	push	edi
; Line 122
	cmp	DWORD PTR _x$[ebp], 0
	jne	$L499
; Line 123
	jmp	$L493
; Line 125
$L499:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$[ebp], eax
; Line 127
	mov	eax, DWORD PTR _code$[ebp]
	mov	DWORD PTR -36+[ebp], eax
	jmp	$L500
; Line 129
$L504:
; Line 133
	jmp	$L493
; Line 135
$L505:
; Line 137
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	OFFSET $SG506
	call	_printf
	add	esp, 12					; 0000000cH
; Line 138
	mov	eax, DWORD PTR _path$[ebp]
	push	eax
	call	_print_path
	add	esp, 4
; Line 139
	push	OFFSET $SG507
	call	_printf
	add	esp, 4
; Line 140
	jmp	$L501
; Line 142
$L508:
; Line 143
	mov	eax, DWORD PTR _dup_count
	push	eax
	push	OFFSET $SG509
	call	_printf
	add	esp, 8
; Line 144
	mov	eax, DWORD PTR _path$[ebp]
	push	eax
	call	_print_path
	add	esp, 4
; Line 145
	push	OFFSET $SG510
	call	_printf
	add	esp, 4
; Line 146
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _dup_count
	push	eax
	push	OFFSET $SG511
	call	_printf
	add	esp, 12					; 0000000cH
; Line 147
	inc	DWORD PTR _dup_count
; Line 148
	jmp	$L501
; Line 150
$L512:
; Line 152
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	OFFSET $SG513
	call	_printf
	add	esp, 12					; 0000000cH
; Line 153
	mov	eax, DWORD PTR _path$[ebp]
	push	eax
	call	_print_path
	add	esp, 4
; Line 154
	push	OFFSET $SG514
	call	_printf
	add	esp, 4
; Line 155
	mov	eax, DWORD PTR _path$[ebp]
	mov	DWORD PTR _link$[ebp], eax
; Line 156
	mov	DWORD PTR _link$[ebp+8], -1
; Line 157
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	eax, DWORD PTR [eax]
	dec	eax
	mov	DWORD PTR _i$[ebp], eax
	jmp	$L515
$L516:
	dec	DWORD PTR _i$[ebp]
$L515:
	cmp	DWORD PTR _i$[ebp], 0
	jl	$L517
; Line 159
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _link$[ebp+4], eax
; Line 160
	lea	eax, DWORD PTR _link$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	push	eax
	call	_walk_rtx
	add	esp, 8
; Line 161
	jmp	$L516
$L517:
; Line 162
	jmp	$L493
; Line 164
$L518:
; Line 165
	mov	eax, DWORD PTR _path$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_walk_rtx
	add	esp, 8
; Line 166
	jmp	$L493
; Line 167
	jmp	$L501
$L500:
	cmp	DWORD PTR -36+[ebp], 12			; 0000000cH
	jg	$L613
	je	$L518
	cmp	DWORD PTR -36+[ebp], 4
	je	$L505
	cmp	DWORD PTR -36+[ebp], 5
	je	$L508
	cmp	DWORD PTR -36+[ebp], 6
	je	$L512
	jmp	$L501
$L613:
	cmp	DWORD PTR -36+[ebp], 30			; 0000001eH
	je	$L493
	cmp	DWORD PTR -36+[ebp], 33			; 00000021H
	je	$L493
	cmp	DWORD PTR -36+[ebp], 39			; 00000027H
	jl	$L501
	cmp	DWORD PTR -36+[ebp], 40			; 00000028H
	jle	$L493
	jmp	$L501
$L501:
; Line 169
	mov	eax, DWORD PTR _path$[ebp]
	mov	DWORD PTR _link$[ebp], eax
; Line 170
	mov	DWORD PTR _link$[ebp+8], -1
; Line 171
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_format[eax*4]
	mov	DWORD PTR _fmt$[ebp], eax
; Line 172
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_length[eax*4]
	mov	DWORD PTR _len$[ebp], eax
; Line 173
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L519
$L520:
	inc	DWORD PTR _i$[ebp]
$L519:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _len$[ebp], eax
	jle	$L521
; Line 175
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _link$[ebp+4], eax
; Line 176
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 101				; 00000065H
	je	$L523
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 117				; 00000075H
	jne	$L522
$L523:
; Line 178
	lea	eax, DWORD PTR _link$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	push	eax
	call	_walk_rtx
	add	esp, 8
; Line 180
	jmp	$L524
$L522:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 69					; 00000045H
	jne	$L525
; Line 183
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	eax, DWORD PTR [eax]
	dec	eax
	mov	DWORD PTR _j$526[ebp], eax
	jmp	$L527
$L528:
	dec	DWORD PTR _j$526[ebp]
$L527:
	cmp	DWORD PTR _j$526[ebp], 0
	jl	$L529
; Line 185
	mov	eax, DWORD PTR _j$526[ebp]
	mov	DWORD PTR _link$[ebp+8], eax
; Line 186
	lea	eax, DWORD PTR _link$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$526[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	push	eax
	call	_walk_rtx
	add	esp, 8
; Line 187
	jmp	$L528
$L529:
; Line 189
$L525:
$L524:
	jmp	$L520
$L521:
; Line 190
$L493:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_walk_rtx ENDP
_TEXT	ENDS
_DATA	SEGMENT
$SG533	DB	'insn', 00H
	ORG $+3
$SG536	DB	'XVECEXP (', 00H
	ORG $+2
$SG537	DB	', %d, %d)', 00H
	ORG $+2
$SG539	DB	'XEXP (', 00H
	ORG $+1
$SG540	DB	', %d)', 00H
_DATA	ENDS
_TEXT	SEGMENT
_path$ = 8
_print_path PROC NEAR
; Line 199
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 200
	cmp	DWORD PTR _path$[ebp], 0
	jne	$L532
; Line 201
	push	OFFSET $SG533
	call	_printf
	add	esp, 4
; Line 202
	jmp	$L534
$L532:
	mov	eax, DWORD PTR _path$[ebp]
	cmp	DWORD PTR [eax+8], 0
	jl	$L535
; Line 204
	push	OFFSET $SG536
	call	_printf
	add	esp, 4
; Line 205
	mov	eax, DWORD PTR _path$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_print_path
	add	esp, 4
; Line 206
	mov	eax, DWORD PTR _path$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _path$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	OFFSET $SG537
	call	_printf
	add	esp, 12					; 0000000cH
; Line 208
	jmp	$L538
$L535:
; Line 210
	push	OFFSET $SG539
	call	_printf
	add	esp, 4
; Line 211
	mov	eax, DWORD PTR _path$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_print_path
	add	esp, 4
; Line 212
	mov	eax, DWORD PTR _path$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	OFFSET $SG540
	call	_printf
	add	esp, 8
; Line 213
$L538:
$L534:
; Line 214
$L531:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_print_path ENDP
_TEXT	ENDS
PUBLIC	_xmalloc
PUBLIC	_fatal
EXTRN	_malloc:NEAR
_DATA	SEGMENT
	ORG $+2
$SG546	DB	'virtual memory exhausted', 00H
_DATA	ENDS
_TEXT	SEGMENT
_size$ = 8
_val$ = -4
_xmalloc PROC NEAR
; Line 218
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 219
	mov	eax, DWORD PTR _size$[ebp]
	push	eax
	call	_malloc
	add	esp, 4
	mov	DWORD PTR _val$[ebp], eax
; Line 221
	cmp	DWORD PTR _val$[ebp], 0
	jne	$L545
; Line 222
	push	0
	push	0
	push	OFFSET $SG546
	call	_fatal
	add	esp, 12					; 0000000cH
; Line 223
$L545:
	mov	eax, DWORD PTR _val$[ebp]
	jmp	$L542
; Line 224
$L542:
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
$SG554	DB	'virtual memory exhausted', 00H
_DATA	ENDS
_TEXT	SEGMENT
_ptr$ = 8
_size$ = 12
_result$ = -4
_xrealloc PROC NEAR
; Line 230
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 231
	mov	eax, DWORD PTR _size$[ebp]
	push	eax
	mov	eax, DWORD PTR _ptr$[ebp]
	push	eax
	call	_realloc
	add	esp, 8
	mov	DWORD PTR _result$[ebp], eax
; Line 232
	cmp	DWORD PTR _result$[ebp], 0
	jne	$L553
; Line 233
	push	0
	push	0
	push	OFFSET $SG554
	call	_fatal
	add	esp, 12					; 0000000cH
; Line 234
$L553:
	mov	eax, DWORD PTR _result$[ebp]
	jmp	$L550
; Line 235
$L550:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_xrealloc ENDP
_TEXT	ENDS
EXTRN	_fprintf:NEAR
EXTRN	__iob:BYTE
EXTRN	_exit:NEAR
_DATA	SEGMENT
	ORG $+3
$SG559	DB	'genextract: ', 00H
	ORG $+3
$SG560	DB	0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_s$ = 8
_a1$ = 12
_a2$ = 16
_fatal	PROC NEAR
; Line 240
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 241
	push	OFFSET $SG559
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 8
; Line 242
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
; Line 243
	push	OFFSET $SG560
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 8
; Line 244
	push	33					; 00000021H
	call	_exit
	add	esp, 4
; Line 245
$L558:
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
$SG563	DB	'Internal gcc abort.', 00H
_DATA	ENDS
_TEXT	SEGMENT
_fancy_abort PROC NEAR
; Line 252
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 253
	push	0
	push	0
	push	OFFSET $SG563
	call	_fatal
	add	esp, 12					; 0000000cH
; Line 254
$L562:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_fancy_abort ENDP
_TEXT	ENDS
PUBLIC	_main
EXTRN	_init_rtl:NEAR
EXTRN	_fopen:NEAR
EXTRN	_read_skip_spaces:NEAR
EXTRN	_free:NEAR
EXTRN	_perror:NEAR
EXTRN	_ungetc:NEAR
EXTRN	_read_rtx:NEAR
EXTRN	_fflush:NEAR
EXTRN	__obstack_begin:NEAR
_DATA	SEGMENT
$SG575	DB	'No input file name.', 00H
$SG576	DB	'r', 00H
	ORG $+2
$SG579	DB	'/* Generated automatically by the program `genextract''', 0aH
	DB	'from the machine description file `md''.  */', 0aH, 0aH, 00H
	ORG $+3
$SG580	DB	'#include "config.h"', 0aH, 00H
	ORG $+3
$SG581	DB	'#include "rtl.h"', 0aH, 0aH, 00H
	ORG $+1
$SG582	DB	'extern rtx recog_operand[];', 0aH, 00H
	ORG $+3
$SG583	DB	'extern rtx *recog_operand_loc[];', 0aH, 00H
	ORG $+2
$SG584	DB	'extern rtx *recog_dup_loc[];', 0aH, 00H
	ORG $+2
$SG585	DB	'extern char recog_dup_num[];', 0aH, 0aH, 00H
	ORG $+1
$SG586	DB	'#ifdef __STDC__', 0aH, '#define VOID void', 0aH, '#else', 0aH
	DB	'#define VOID int', 0aH, '#endif', 0aH, 0aH, 00H
	ORG $+2
$SG595	DB	'VOID extract_%d () {}', 0aH, 0aH, 00H
$SG596	DB	'VOID (*insn_extract_fn[]) () =', 0aH, '{ ', 00H
	ORG $+2
$SG601	DB	', ', 00H
	ORG $+1
$SG604	DB	',', 0aH, '  ', 00H
	ORG $+3
$SG605	DB	'extract_%d', 00H
	ORG $+1
$SG606	DB	0aH, '};', 0aH, 0aH, 00H
	ORG $+2
$SG607	DB	'void fatal_insn_not_found ();', 0aH, 0aH, 00H
$SG608	DB	'void', 0aH, 'insn_extract (insn)', 0aH, 00H
	ORG $+2
$SG609	DB	'     rtx insn;', 0aH, 00H
$SG610	DB	'{', 0aH, '  if (INSN_CODE (insn) == -1) fatal_insn_not_f'
	DB	'ound (insn);', 0aH, 00H
	ORG $+2
$SG611	DB	'  (*insn_extract_fn[INSN_CODE (insn)]) (PATTERN (insn));'
	DB	0aH, '}', 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_argc$ = 8
_argv$ = 12
_desc$ = -4
_infile$ = -16
_c$ = -8
_i$ = -12
_main	PROC NEAR
; Line 260
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 266
	push	OFFSET _free
	push	OFFSET _xmalloc
	push	0
	push	0
	mov	eax, DWORD PTR _rtl_obstack
	push	eax
	call	__obstack_begin
	add	esp, 20					; 00000014H
; Line 268
	cmp	DWORD PTR _argc$[ebp], 1
	jg	$L574
; Line 269
	push	0
	push	0
	push	OFFSET $SG575
	call	_fatal
	add	esp, 12					; 0000000cH
; Line 271
$L574:
	push	OFFSET $SG576
	mov	eax, DWORD PTR _argv$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_fopen
	add	esp, 8
	mov	DWORD PTR _infile$[ebp], eax
; Line 272
	cmp	DWORD PTR _infile$[ebp], 0
	jne	$L577
; Line 274
	mov	eax, DWORD PTR _argv$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_perror
	add	esp, 4
; Line 275
	push	33					; 00000021H
	call	_exit
	add	esp, 4
; Line 278
$L577:
	call	_init_rtl
; Line 283
	mov	DWORD PTR _insn_code_number, 0
; Line 286
	push	OFFSET $SG579
	call	_printf
	add	esp, 4
; Line 288
	push	OFFSET $SG580
	call	_printf
	add	esp, 4
; Line 289
	push	OFFSET $SG581
	call	_printf
	add	esp, 4
; Line 291
	push	OFFSET $SG582
	call	_printf
	add	esp, 4
; Line 292
	push	OFFSET $SG583
	call	_printf
	add	esp, 4
; Line 293
	push	OFFSET $SG584
	call	_printf
	add	esp, 4
; Line 294
	push	OFFSET $SG585
	call	_printf
	add	esp, 4
; Line 300
	push	OFFSET $SG586
	call	_printf
	add	esp, 4
; Line 304
$L588:
; Line 306
	mov	eax, DWORD PTR _infile$[ebp]
	push	eax
	call	_read_skip_spaces
	add	esp, 4
	mov	DWORD PTR _c$[ebp], eax
; Line 307
	cmp	DWORD PTR _c$[ebp], -1
	jne	$L591
; Line 308
	jmp	$L589
; Line 309
$L591:
	mov	eax, DWORD PTR _infile$[ebp]
	push	eax
	mov	eax, DWORD PTR _c$[ebp]
	push	eax
	call	_ungetc
	add	esp, 8
; Line 311
	mov	eax, DWORD PTR _infile$[ebp]
	push	eax
	call	_read_rtx
	add	esp, 4
	mov	DWORD PTR _desc$[ebp], eax
; Line 312
	mov	eax, DWORD PTR _desc$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 458752				; 00070000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L592
; Line 314
	mov	eax, DWORD PTR _desc$[ebp]
	push	eax
	call	_gen_insn
	add	esp, 4
; Line 315
	inc	DWORD PTR _insn_code_number
; Line 317
$L592:
	mov	eax, DWORD PTR _desc$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 524288				; 00080000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L593
; Line 319
	mov	eax, DWORD PTR _desc$[ebp]
	push	eax
	call	_gen_peephole
	add	esp, 4
; Line 320
	inc	DWORD PTR _insn_code_number
; Line 322
$L593:
	mov	eax, DWORD PTR _desc$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 655360				; 000a0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L594
; Line 324
	mov	eax, DWORD PTR _insn_code_number
	push	eax
	push	OFFSET $SG595
	call	_printf
	add	esp, 8
; Line 325
	inc	DWORD PTR _insn_code_number
; Line 327
$L594:
	jmp	$L588
$L589:
; Line 329
	push	OFFSET $SG596
	call	_printf
	add	esp, 4
; Line 330
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L597
$L598:
	inc	DWORD PTR _i$[ebp]
$L597:
	mov	eax, DWORD PTR _insn_code_number
	cmp	DWORD PTR _i$[ebp], eax
	jge	$L599
; Line 332
	mov	eax, DWORD PTR _i$[ebp]
	cdq
	xor	eax, edx
	sub	eax, edx
	and	eax, 3
	xor	eax, edx
	sub	eax, edx
	je	$L600
; Line 333
	push	OFFSET $SG601
	call	_printf
	add	esp, 4
; Line 334
	jmp	$L602
$L600:
	cmp	DWORD PTR _i$[ebp], 0
	je	$L603
; Line 335
	push	OFFSET $SG604
	call	_printf
	add	esp, 4
; Line 336
$L603:
$L602:
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	push	OFFSET $SG605
	call	_printf
	add	esp, 8
; Line 337
	jmp	$L598
$L599:
; Line 338
	push	OFFSET $SG606
	call	_printf
	add	esp, 4
; Line 340
	push	OFFSET $SG607
	call	_printf
	add	esp, 4
; Line 341
	push	OFFSET $SG608
	call	_printf
	add	esp, 4
; Line 342
	push	OFFSET $SG609
	call	_printf
	add	esp, 4
; Line 343
	push	OFFSET $SG610
	call	_printf
	add	esp, 4
; Line 344
	push	OFFSET $SG611
	call	_printf
	add	esp, 4
; Line 346
	mov	eax, OFFSET __iob
	add	eax, 32					; 00000020H
	push	eax
	call	_fflush
	add	esp, 4
; Line 347
	mov	eax, DWORD PTR __iob+44
	and	eax, 32					; 00000020H
	cmp	eax, 1
	cmc
	sbb	eax, eax
	and	eax, 33					; 00000021H
	push	eax
	call	_exit
	add	esp, 4
; Line 348
$L567:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_main	ENDP
_TEXT	ENDS
END
