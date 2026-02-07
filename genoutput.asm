	TITLE	genoutput.c
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
COMM	_max_opno:DWORD
COMM	_num_dups:DWORD
COMM	_constraints:DWORD:028H
COMM	_op_n_alternatives:DWORD:028H
COMM	_predicates:DWORD:028H
COMM	_address_p:BYTE:028H
COMM	_modes:DWORD:028H
COMM	_strict_low:BYTE:028H
COMM	_obstack:BYTE:024H
COMM	_next_code_number:DWORD
COMM	_insn_data:DWORD
COMM	_end_of_insn_data:DWORD
COMM	_have_constraints:DWORD
_rtl_obstack DD	_obstack
_DATA	ENDS
PUBLIC	_output_prologue
EXTRN	_printf:NEAR
_DATA	SEGMENT
$SG478	DB	'/* Generated automatically by the program `genoutput''', 0aH
	DB	'from the machine description file `md''.  */', 0aH, 0aH, 00H
$SG479	DB	'#include "config.h"', 0aH, 00H
	ORG $+3
$SG480	DB	'#include "rtl.h"', 0aH, 00H
	ORG $+2
$SG481	DB	'#include "regs.h"', 0aH, 00H
	ORG $+1
$SG482	DB	'#include "hard-reg-set.h"', 0aH, 00H
	ORG $+1
$SG483	DB	'#include "real.h"', 0aH, 00H
	ORG $+1
$SG484	DB	'#include "conditions.h"', 0aH, 00H
	ORG $+3
$SG485	DB	'#include "insn-flags.h"', 0aH, 00H
	ORG $+3
$SG486	DB	'#include "insn-config.h"', 0aH, 0aH, 00H
	ORG $+1
$SG487	DB	'#ifndef __STDC__', 0aH, 00H
	ORG $+2
$SG488	DB	'#define const', 0aH, 00H
	ORG $+1
$SG489	DB	'#endif', 0aH, 0aH, 00H
	ORG $+3
$SG490	DB	'#include "output.h"', 0aH, 00H
	ORG $+3
$SG491	DB	'#include "aux-output.c"', 0aH, 0aH, 00H
	ORG $+2
$SG492	DB	'#ifndef INSN_MACHINE_INFO', 0aH, 00H
	ORG $+1
$SG493	DB	'#define INSN_MACHINE_INFO struct dummy1 {int i;}', 0aH, 00H
	ORG $+2
$SG494	DB	'#endif', 0aH, 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
; File genoutput.c
_output_prologue PROC NEAR
; Line 164
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 167
	push	OFFSET $SG478
	call	_printf
	add	esp, 4
; Line 169
	push	OFFSET $SG479
	call	_printf
	add	esp, 4
; Line 170
	push	OFFSET $SG480
	call	_printf
	add	esp, 4
; Line 171
	push	OFFSET $SG481
	call	_printf
	add	esp, 4
; Line 172
	push	OFFSET $SG482
	call	_printf
	add	esp, 4
; Line 173
	push	OFFSET $SG483
	call	_printf
	add	esp, 4
; Line 174
	push	OFFSET $SG484
	call	_printf
	add	esp, 4
; Line 175
	push	OFFSET $SG485
	call	_printf
	add	esp, 4
; Line 176
	push	OFFSET $SG486
	call	_printf
	add	esp, 4
; Line 178
	push	OFFSET $SG487
	call	_printf
	add	esp, 4
; Line 179
	push	OFFSET $SG488
	call	_printf
	add	esp, 4
; Line 180
	push	OFFSET $SG489
	call	_printf
	add	esp, 4
; Line 182
	push	OFFSET $SG490
	call	_printf
	add	esp, 4
; Line 183
	push	OFFSET $SG491
	call	_printf
	add	esp, 4
; Line 186
	push	OFFSET $SG492
	call	_printf
	add	esp, 4
; Line 187
	push	OFFSET $SG493
	call	_printf
	add	esp, 4
; Line 188
	push	OFFSET $SG494
	call	_printf
	add	esp, 4
; Line 189
$L477:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_prologue ENDP
_TEXT	ENDS
PUBLIC	_error
PUBLIC	_output_epilogue
EXTRN	_mode_name:BYTE
_DATA	SEGMENT
	ORG $+3
$SG498	DB	0aH, 'char * const insn_template[] =', 0aH, '  {', 0aH, 00H
	ORG $+3
$SG503	DB	'    "%s",', 0aH, 00H
	ORG $+1
$SG505	DB	'    0,', 0aH, 00H
$SG506	DB	'  };', 0aH, 00H
	ORG $+2
$SG507	DB	0aH, 'char *(*const insn_outfun[])() =', 0aH, '  {', 0aH, 00H
	ORG $+1
$SG512	DB	'    output_%d,', 0aH, 00H
$SG514	DB	'    0,', 0aH, 00H
$SG515	DB	'  };', 0aH, 00H
	ORG $+2
$SG516	DB	0aH, 'rtx (*const insn_gen_function[]) () =', 0aH, '  {', 0aH
	DB	00H
$SG521	DB	'    gen_%s,', 0aH, 00H
	ORG $+3
$SG523	DB	'    0,', 0aH, 00H
$SG524	DB	'  };', 0aH, 00H
	ORG $+2
$SG525	DB	0aH, 'const int insn_n_operands[] =', 0aH, '  {', 0aH, 00H
$SG529	DB	'    %d,', 0aH, 00H
	ORG $+3
$SG530	DB	'  };', 0aH, 00H
	ORG $+2
$SG531	DB	0aH, 'const int insn_n_dups[] =', 0aH, '  {', 0aH, 00H
$SG535	DB	'    %d,', 0aH, 00H
	ORG $+3
$SG536	DB	'  };', 0aH, 00H
	ORG $+2
$SG538	DB	0aH, 'char *const insn_operand_constraint[][MAX_RECOG_OPE'
	DB	'RANDS] =', 0aH, '  {', 0aH, 00H
	ORG $+2
$SG545	DB	'    {', 00H
	ORG $+2
$SG553	DB	'wrong number of alternatives in operand %d of insn numbe'
	DB	'r %d', 00H
	ORG $+3
$SG558	DB	' "",', 00H
	ORG $+3
$SG560	DB	' "%s",', 00H
	ORG $+1
$SG562	DB	' 0', 00H
	ORG $+1
$SG563	DB	' },', 0aH, 00H
	ORG $+3
$SG564	DB	'  };', 0aH, 00H
	ORG $+2
$SG566	DB	0aH, 'const char insn_operand_address_p[][MAX_RECOG_OPERA'
	DB	'NDS] =', 0aH, '  {', 0aH, 00H
$SG571	DB	'    {', 00H
	ORG $+2
$SG575	DB	' %d,', 00H
	ORG $+3
$SG577	DB	' 0', 00H
	ORG $+1
$SG578	DB	' },', 0aH, 00H
	ORG $+3
$SG579	DB	'  };', 0aH, 00H
	ORG $+2
$SG580	DB	0aH, 'const enum machine_mode insn_operand_mode[][MAX_REC'
	DB	'OG_OPERANDS] =', 0aH, '  {', 0aH, 00H
$SG585	DB	'    {', 00H
	ORG $+2
$SG589	DB	' %smode,', 00H
	ORG $+3
$SG591	DB	' VOIDmode', 00H
	ORG $+2
$SG592	DB	' },', 0aH, 00H
	ORG $+3
$SG593	DB	'  };', 0aH, 00H
	ORG $+2
$SG594	DB	0aH, 'const char insn_operand_strict_low[][MAX_RECOG_OPER'
	DB	'ANDS] =', 0aH, '  {', 0aH, 00H
	ORG $+3
$SG599	DB	'    {', 00H
	ORG $+2
$SG603	DB	' %d,', 00H
	ORG $+3
$SG605	DB	' 0', 00H
	ORG $+1
$SG606	DB	' },', 0aH, 00H
	ORG $+3
$SG607	DB	'  };', 0aH, 00H
	ORG $+2
$SG608	DB	0aH, 'int (*const insn_operand_predicate[][MAX_RECOG_OPER'
	DB	'ANDS])() =', 0aH, '  {', 0aH, 00H
$SG613	DB	'    {', 00H
	ORG $+2
$SG617	DB	'0', 00H
	ORG $+2
$SG618	DB	' %s,', 00H
	ORG $+3
$SG620	DB	' 0', 00H
	ORG $+1
$SG621	DB	' },', 0aH, 00H
	ORG $+3
$SG622	DB	'  };', 0aH, 00H
	ORG $+2
$SG623	DB	0aH, '#ifndef DEFAULT_MACHINE_INFO', 0aH, '#define DEFAUL'
	DB	'T_MACHINE_INFO 0', 0aH, 00H
	ORG $+2
$SG624	DB	'#endif', 0aH, 0aH, 'const INSN_MACHINE_INFO insn_machine'
	DB	'_info[] =', 0aH, '  {', 0aH, 00H
	ORG $+1
$SG629	DB	'    {%s},', 0aH, 00H
	ORG $+1
$SG631	DB	'     { DEFAULT_MACHINE_INFO },', 0aH, 00H
$SG632	DB	'  };', 0aH, 00H
	ORG $+2
$SG633	DB	0aH, 'const int insn_n_alternatives[] =', 0aH, '  {', 0aH
	DB	00H
$SG638	DB	'    %d,', 0aH, 00H
	ORG $+3
$SG640	DB	'     0,', 0aH, 00H
	ORG $+3
$SG641	DB	'  };', 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_i$584 = -24
_i$598 = -28
_i$542 = -12
_n$543 = -16
_start$544 = -8
_i$612 = -32
_d$ = -4
_i$570 = -20
_output_epilogue PROC NEAR
; Line 193
	push	ebp
	mov	ebp, esp
	sub	esp, 36					; 00000024H
	push	ebx
	push	esi
	push	edi
; Line 196
	push	OFFSET $SG498
	call	_printf
	add	esp, 4
; Line 197
	mov	eax, DWORD PTR _insn_data
	mov	DWORD PTR _d$[ebp], eax
	jmp	$L499
$L500:
	mov	eax, DWORD PTR _d$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _d$[ebp], eax
$L499:
	cmp	DWORD PTR _d$[ebp], 0
	je	$L501
; Line 199
	mov	eax, DWORD PTR _d$[ebp]
	cmp	DWORD PTR [eax+8], 0
	je	$L502
; Line 200
	mov	eax, DWORD PTR _d$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	push	OFFSET $SG503
	call	_printf
	add	esp, 8
; Line 201
	jmp	$L504
$L502:
; Line 202
	push	OFFSET $SG505
	call	_printf
	add	esp, 4
$L504:
; Line 203
	jmp	$L500
$L501:
; Line 204
	push	OFFSET $SG506
	call	_printf
	add	esp, 4
; Line 206
	push	OFFSET $SG507
	call	_printf
	add	esp, 4
; Line 207
	mov	eax, DWORD PTR _insn_data
	mov	DWORD PTR _d$[ebp], eax
	jmp	$L508
$L509:
	mov	eax, DWORD PTR _d$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _d$[ebp], eax
$L508:
	cmp	DWORD PTR _d$[ebp], 0
	je	$L510
; Line 209
	mov	eax, DWORD PTR _d$[ebp]
	movsx	eax, BYTE PTR [eax+748]
	or	eax, eax
	je	$L511
; Line 210
	mov	eax, DWORD PTR _d$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	push	OFFSET $SG512
	call	_printf
	add	esp, 8
; Line 211
	jmp	$L513
$L511:
; Line 212
	push	OFFSET $SG514
	call	_printf
	add	esp, 4
$L513:
; Line 213
	jmp	$L509
$L510:
; Line 214
	push	OFFSET $SG515
	call	_printf
	add	esp, 4
; Line 216
	push	OFFSET $SG516
	call	_printf
	add	esp, 4
; Line 217
	mov	eax, DWORD PTR _insn_data
	mov	DWORD PTR _d$[ebp], eax
	jmp	$L517
$L518:
	mov	eax, DWORD PTR _d$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _d$[ebp], eax
$L517:
	cmp	DWORD PTR _d$[ebp], 0
	je	$L519
; Line 219
	mov	eax, DWORD PTR _d$[ebp]
	cmp	DWORD PTR [eax+4], 0
	je	$L520
; Line 220
	mov	eax, DWORD PTR _d$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	OFFSET $SG521
	call	_printf
	add	esp, 8
; Line 221
	jmp	$L522
$L520:
; Line 222
	push	OFFSET $SG523
	call	_printf
	add	esp, 4
$L522:
; Line 223
	jmp	$L518
$L519:
; Line 224
	push	OFFSET $SG524
	call	_printf
	add	esp, 4
; Line 226
	push	OFFSET $SG525
	call	_printf
	add	esp, 4
; Line 227
	mov	eax, DWORD PTR _insn_data
	mov	DWORD PTR _d$[ebp], eax
	jmp	$L526
$L527:
	mov	eax, DWORD PTR _d$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _d$[ebp], eax
$L526:
	cmp	DWORD PTR _d$[ebp], 0
	je	$L528
; Line 229
	mov	eax, DWORD PTR _d$[ebp]
	mov	eax, DWORD PTR [eax+12]
	push	eax
	push	OFFSET $SG529
	call	_printf
	add	esp, 8
; Line 230
	jmp	$L527
$L528:
; Line 231
	push	OFFSET $SG530
	call	_printf
	add	esp, 4
; Line 233
	push	OFFSET $SG531
	call	_printf
	add	esp, 4
; Line 234
	mov	eax, DWORD PTR _insn_data
	mov	DWORD PTR _d$[ebp], eax
	jmp	$L532
$L533:
	mov	eax, DWORD PTR _d$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _d$[ebp], eax
$L532:
	cmp	DWORD PTR _d$[ebp], 0
	je	$L534
; Line 236
	mov	eax, DWORD PTR _d$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	push	OFFSET $SG535
	call	_printf
	add	esp, 8
; Line 237
	jmp	$L533
$L534:
; Line 238
	push	OFFSET $SG536
	call	_printf
	add	esp, 4
; Line 240
	cmp	DWORD PTR _have_constraints, 0
	je	$L537
; Line 242
	push	OFFSET $SG538
	call	_printf
	add	esp, 4
; Line 243
	mov	eax, DWORD PTR _insn_data
	mov	DWORD PTR _d$[ebp], eax
	jmp	$L539
$L540:
	mov	eax, DWORD PTR _d$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _d$[ebp], eax
$L539:
	cmp	DWORD PTR _d$[ebp], 0
	je	$L541
; Line 245
	mov	DWORD PTR _n$543[ebp], 0
; Line 246
	push	OFFSET $SG545
	call	_printf
	add	esp, 4
; Line 250
	mov	DWORD PTR _start$544[ebp], 0
	jmp	$L546
$L547:
	inc	DWORD PTR _start$544[ebp]
$L546:
	mov	eax, DWORD PTR _d$[ebp]
	mov	ecx, DWORD PTR _start$544[ebp]
	cmp	DWORD PTR [eax+12], ecx
	jle	$L548
; Line 251
	mov	eax, DWORD PTR _start$544[ebp]
	mov	ecx, DWORD PTR _d$[ebp]
	cmp	DWORD PTR [ecx+eax*4+188], 0
	jle	$L549
; Line 253
	cmp	DWORD PTR _n$543[ebp], 0
	jne	$L550
; Line 254
	mov	eax, DWORD PTR _start$544[ebp]
	mov	ecx, DWORD PTR _d$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+188]
	mov	DWORD PTR _n$543[ebp], eax
; Line 255
	jmp	$L551
$L550:
	mov	eax, DWORD PTR _start$544[ebp]
	mov	ecx, DWORD PTR _d$[ebp]
	mov	edx, DWORD PTR _n$543[ebp]
	cmp	DWORD PTR [ecx+eax*4+188], edx
	je	$L552
; Line 257
	mov	eax, DWORD PTR _d$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	mov	eax, DWORD PTR _start$544[ebp]
	push	eax
	push	OFFSET $SG553
	call	_error
	add	esp, 12					; 0000000cH
; Line 258
$L552:
$L551:
; Line 260
$L549:
	jmp	$L547
$L548:
	mov	eax, DWORD PTR _n$543[ebp]
	mov	ecx, DWORD PTR _d$[ebp]
	mov	DWORD PTR [ecx+20], eax
; Line 262
	mov	DWORD PTR _i$542[ebp], 0
	jmp	$L554
$L555:
	inc	DWORD PTR _i$542[ebp]
$L554:
	mov	eax, DWORD PTR _d$[ebp]
	mov	ecx, DWORD PTR _i$542[ebp]
	cmp	DWORD PTR [eax+12], ecx
	jle	$L556
; Line 264
	mov	eax, DWORD PTR _i$542[ebp]
	mov	ecx, DWORD PTR _d$[ebp]
	cmp	DWORD PTR [ecx+eax*4+28], 0
	jne	$L557
; Line 265
	push	OFFSET $SG558
	call	_printf
	add	esp, 4
; Line 266
	jmp	$L559
$L557:
; Line 267
	mov	eax, DWORD PTR _i$542[ebp]
	mov	ecx, DWORD PTR _d$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+28]
	push	eax
	push	OFFSET $SG560
	call	_printf
	add	esp, 8
$L559:
; Line 268
	jmp	$L555
$L556:
; Line 269
	mov	eax, DWORD PTR _d$[ebp]
	cmp	DWORD PTR [eax+12], 0
	jne	$L561
; Line 270
	push	OFFSET $SG562
	call	_printf
	add	esp, 4
; Line 271
$L561:
	push	OFFSET $SG563
	call	_printf
	add	esp, 4
; Line 272
	jmp	$L540
$L541:
; Line 273
	push	OFFSET $SG564
	call	_printf
	add	esp, 4
; Line 275
	jmp	$L565
$L537:
; Line 277
	push	OFFSET $SG566
	call	_printf
	add	esp, 4
; Line 278
	mov	eax, DWORD PTR _insn_data
	mov	DWORD PTR _d$[ebp], eax
	jmp	$L567
$L568:
	mov	eax, DWORD PTR _d$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _d$[ebp], eax
$L567:
	cmp	DWORD PTR _d$[ebp], 0
	je	$L569
; Line 281
	push	OFFSET $SG571
	call	_printf
	add	esp, 4
; Line 282
	mov	DWORD PTR _i$570[ebp], 0
	jmp	$L572
$L573:
	inc	DWORD PTR _i$570[ebp]
$L572:
	mov	eax, DWORD PTR _d$[ebp]
	mov	ecx, DWORD PTR _i$570[ebp]
	cmp	DWORD PTR [eax+12], ecx
	jle	$L574
; Line 283
	mov	eax, DWORD PTR _i$570[ebp]
	mov	ecx, DWORD PTR _d$[ebp]
	movsx	eax, BYTE PTR [eax+ecx+508]
	push	eax
	push	OFFSET $SG575
	call	_printf
	add	esp, 8
	jmp	$L573
$L574:
; Line 284
	mov	eax, DWORD PTR _d$[ebp]
	cmp	DWORD PTR [eax+12], 0
	jne	$L576
; Line 285
	push	OFFSET $SG577
	call	_printf
	add	esp, 4
; Line 286
$L576:
	push	OFFSET $SG578
	call	_printf
	add	esp, 4
; Line 287
	jmp	$L568
$L569:
; Line 288
	push	OFFSET $SG579
	call	_printf
	add	esp, 4
; Line 289
$L565:
; Line 291
	push	OFFSET $SG580
	call	_printf
	add	esp, 4
; Line 292
	mov	eax, DWORD PTR _insn_data
	mov	DWORD PTR _d$[ebp], eax
	jmp	$L581
$L582:
	mov	eax, DWORD PTR _d$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _d$[ebp], eax
$L581:
	cmp	DWORD PTR _d$[ebp], 0
	je	$L583
; Line 295
	push	OFFSET $SG585
	call	_printf
	add	esp, 4
; Line 296
	mov	DWORD PTR _i$584[ebp], 0
	jmp	$L586
$L587:
	inc	DWORD PTR _i$584[ebp]
$L586:
	mov	eax, DWORD PTR _d$[ebp]
	mov	ecx, DWORD PTR _i$584[ebp]
	cmp	DWORD PTR [eax+12], ecx
	jle	$L588
; Line 297
	mov	eax, DWORD PTR _i$584[ebp]
	mov	ecx, DWORD PTR _d$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+548]
	mov	eax, DWORD PTR _mode_name[eax*4]
	push	eax
	push	OFFSET $SG589
	call	_printf
	add	esp, 8
	jmp	$L587
$L588:
; Line 298
	mov	eax, DWORD PTR _d$[ebp]
	cmp	DWORD PTR [eax+12], 0
	jne	$L590
; Line 299
	push	OFFSET $SG591
	call	_printf
	add	esp, 4
; Line 300
$L590:
	push	OFFSET $SG592
	call	_printf
	add	esp, 4
; Line 301
	jmp	$L582
$L583:
; Line 302
	push	OFFSET $SG593
	call	_printf
	add	esp, 4
; Line 304
	push	OFFSET $SG594
	call	_printf
	add	esp, 4
; Line 305
	mov	eax, DWORD PTR _insn_data
	mov	DWORD PTR _d$[ebp], eax
	jmp	$L595
$L596:
	mov	eax, DWORD PTR _d$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _d$[ebp], eax
$L595:
	cmp	DWORD PTR _d$[ebp], 0
	je	$L597
; Line 308
	push	OFFSET $SG599
	call	_printf
	add	esp, 4
; Line 309
	mov	DWORD PTR _i$598[ebp], 0
	jmp	$L600
$L601:
	inc	DWORD PTR _i$598[ebp]
$L600:
	mov	eax, DWORD PTR _d$[ebp]
	mov	ecx, DWORD PTR _i$598[ebp]
	cmp	DWORD PTR [eax+12], ecx
	jle	$L602
; Line 310
	mov	eax, DWORD PTR _i$598[ebp]
	mov	ecx, DWORD PTR _d$[ebp]
	movsx	eax, BYTE PTR [eax+ecx+708]
	push	eax
	push	OFFSET $SG603
	call	_printf
	add	esp, 8
	jmp	$L601
$L602:
; Line 311
	mov	eax, DWORD PTR _d$[ebp]
	cmp	DWORD PTR [eax+12], 0
	jne	$L604
; Line 312
	push	OFFSET $SG605
	call	_printf
	add	esp, 4
; Line 313
$L604:
	push	OFFSET $SG606
	call	_printf
	add	esp, 4
; Line 314
	jmp	$L596
$L597:
; Line 315
	push	OFFSET $SG607
	call	_printf
	add	esp, 4
; Line 317
	push	OFFSET $SG608
	call	_printf
	add	esp, 4
; Line 318
	mov	eax, DWORD PTR _insn_data
	mov	DWORD PTR _d$[ebp], eax
	jmp	$L609
$L610:
	mov	eax, DWORD PTR _d$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _d$[ebp], eax
$L609:
	cmp	DWORD PTR _d$[ebp], 0
	je	$L611
; Line 321
	push	OFFSET $SG613
	call	_printf
	add	esp, 4
; Line 322
	mov	DWORD PTR _i$612[ebp], 0
	jmp	$L614
$L615:
	inc	DWORD PTR _i$612[ebp]
$L614:
	mov	eax, DWORD PTR _d$[ebp]
	mov	ecx, DWORD PTR _i$612[ebp]
	cmp	DWORD PTR [eax+12], ecx
	jle	$L616
; Line 324
	mov	eax, DWORD PTR _i$612[ebp]
	mov	ecx, DWORD PTR _d$[ebp]
	cmp	DWORD PTR [ecx+eax*4+348], 0
	je	$L817
	mov	eax, DWORD PTR _i$612[ebp]
	mov	ecx, DWORD PTR _d$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+348]
	movsx	eax, BYTE PTR [eax]
	or	eax, eax
	je	$L817
	mov	eax, DWORD PTR _i$612[ebp]
	mov	ecx, DWORD PTR _d$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+348]
	mov	DWORD PTR -36+[ebp], eax
	jmp	$L818
$L817:
	mov	DWORD PTR -36+[ebp], OFFSET $SG617
$L818:
	mov	eax, DWORD PTR -36+[ebp]
	push	eax
	push	OFFSET $SG618
	call	_printf
	add	esp, 8
	jmp	$L615
$L616:
; Line 325
	mov	eax, DWORD PTR _d$[ebp]
	cmp	DWORD PTR [eax+12], 0
	jne	$L619
; Line 326
	push	OFFSET $SG620
	call	_printf
	add	esp, 4
; Line 327
$L619:
	push	OFFSET $SG621
	call	_printf
	add	esp, 4
; Line 328
	jmp	$L610
$L611:
; Line 329
	push	OFFSET $SG622
	call	_printf
	add	esp, 4
; Line 331
	push	OFFSET $SG623
	call	_printf
	add	esp, 4
; Line 332
	push	OFFSET $SG624
	call	_printf
	add	esp, 4
; Line 333
	mov	eax, DWORD PTR _insn_data
	mov	DWORD PTR _d$[ebp], eax
	jmp	$L625
$L626:
	mov	eax, DWORD PTR _d$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _d$[ebp], eax
$L625:
	cmp	DWORD PTR _d$[ebp], 0
	je	$L627
; Line 335
	mov	eax, DWORD PTR _d$[ebp]
	cmp	DWORD PTR [eax+752], 0
	je	$L628
; Line 336
	mov	eax, DWORD PTR _d$[ebp]
	mov	eax, DWORD PTR [eax+752]
	push	eax
	push	OFFSET $SG629
	call	_printf
	add	esp, 8
; Line 337
	jmp	$L630
$L628:
; Line 338
	push	OFFSET $SG631
	call	_printf
	add	esp, 4
$L630:
; Line 339
	jmp	$L626
$L627:
; Line 340
	push	OFFSET $SG632
	call	_printf
	add	esp, 4
; Line 342
	push	OFFSET $SG633
	call	_printf
	add	esp, 4
; Line 343
	mov	eax, DWORD PTR _insn_data
	mov	DWORD PTR _d$[ebp], eax
	jmp	$L634
$L635:
	mov	eax, DWORD PTR _d$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _d$[ebp], eax
$L634:
	cmp	DWORD PTR _d$[ebp], 0
	je	$L636
; Line 345
	mov	eax, DWORD PTR _d$[ebp]
	cmp	DWORD PTR [eax+20], 0
	je	$L637
; Line 346
	mov	eax, DWORD PTR _d$[ebp]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	push	OFFSET $SG638
	call	_printf
	add	esp, 8
; Line 347
	jmp	$L639
$L637:
; Line 348
	push	OFFSET $SG640
	call	_printf
	add	esp, 4
$L639:
; Line 349
	jmp	$L635
$L636:
; Line 350
	push	OFFSET $SG641
	call	_printf
	add	esp, 4
; Line 351
$L496:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_epilogue ENDP
_TEXT	ENDS
PUBLIC	_scan_operands
PUBLIC	_n_occurrences
EXTRN	_rtx_length:BYTE
EXTRN	_rtx_format:BYTE
_DATA	SEGMENT
	ORG $+2
$SG664	DB	'Too many operands (%d) in one instruction pattern.', 0aH
	DB	00H
$SG671	DB	'Too many operands (%d) in one instruction pattern.', 0aH
	DB	00H
_DATA	ENDS
_TEXT	SEGMENT
_part$ = 8
_this_address_p$ = 12
_this_strict_low$ = 16
_i$ = -4
_j$ = -16
_code$ = -12
_format_ptr$ = -8
_opno$661 = -20
_opno$668 = -24
_scan_operands PROC NEAR
; Line 375
	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H
	push	ebx
	push	esi
	push	edi
; Line 380
	cmp	DWORD PTR _part$[ebp], 0
	jne	$L659
; Line 381
	jmp	$L654
; Line 383
$L659:
	mov	eax, DWORD PTR _part$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$[ebp], eax
; Line 385
	cmp	DWORD PTR _code$[ebp], 4
	jne	$L660
; Line 387
	mov	eax, DWORD PTR _part$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _opno$661[ebp], eax
; Line 388
	mov	eax, DWORD PTR _max_opno
	cmp	DWORD PTR _opno$661[ebp], eax
	jle	$L662
; Line 389
	mov	eax, DWORD PTR _opno$661[ebp]
	mov	DWORD PTR _max_opno, eax
; Line 390
$L662:
	cmp	DWORD PTR _max_opno, 40			; 00000028H
	jl	$L663
; Line 392
	push	0
	mov	eax, DWORD PTR _max_opno
	inc	eax
	push	eax
	push	OFFSET $SG664
	call	_error
	add	esp, 12					; 0000000cH
; Line 393
$L663:
	mov	eax, DWORD PTR _part$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	mov	ecx, DWORD PTR _opno$661[ebp]
	mov	DWORD PTR _modes[ecx*4], eax
; Line 394
	mov	al, BYTE PTR _this_strict_low$[ebp]
	mov	ecx, DWORD PTR _opno$661[ebp]
	mov	BYTE PTR _strict_low[ecx], al
; Line 395
	mov	eax, DWORD PTR _part$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _opno$661[ebp]
	mov	DWORD PTR _predicates[ecx*4], eax
; Line 396
	mov	eax, DWORD PTR _part$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	ecx, DWORD PTR _opno$661[ebp]
	mov	DWORD PTR _constraints[ecx*4], eax
; Line 397
	mov	eax, DWORD PTR _part$[ebp]
	cmp	DWORD PTR [eax+12], 0
	je	$L665
	mov	eax, DWORD PTR _part$[ebp]
	mov	eax, DWORD PTR [eax+12]
	movsx	eax, BYTE PTR [eax]
	or	eax, eax
	je	$L665
; Line 399
	mov	eax, DWORD PTR _part$[ebp]
	mov	eax, DWORD PTR [eax+12]
	push	eax
	push	44					; 0000002cH
	call	_n_occurrences
	add	esp, 8
	inc	eax
	mov	ecx, DWORD PTR _opno$661[ebp]
	mov	DWORD PTR _op_n_alternatives[ecx*4], eax
; Line 400
	mov	DWORD PTR _have_constraints, 1
; Line 402
$L665:
	mov	al, BYTE PTR _this_address_p$[ebp]
	mov	ecx, DWORD PTR _opno$661[ebp]
	mov	BYTE PTR _address_p[ecx], al
; Line 403
	jmp	$L654
; Line 406
$L660:
	cmp	DWORD PTR _code$[ebp], 6
	jne	$L667
; Line 408
	mov	eax, DWORD PTR _part$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _opno$668[ebp], eax
; Line 409
	mov	eax, DWORD PTR _opno$668[ebp]
	cmp	DWORD PTR _max_opno, eax
	jge	$L669
; Line 410
	mov	eax, DWORD PTR _opno$668[ebp]
	mov	DWORD PTR _max_opno, eax
; Line 411
$L669:
	cmp	DWORD PTR _max_opno, 40			; 00000028H
	jl	$L670
; Line 413
	push	0
	mov	eax, DWORD PTR _max_opno
	inc	eax
	push	eax
	push	OFFSET $SG671
	call	_error
	add	esp, 12					; 0000000cH
; Line 414
$L670:
	mov	eax, DWORD PTR _part$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	mov	ecx, DWORD PTR _opno$668[ebp]
	mov	DWORD PTR _modes[ecx*4], eax
; Line 415
	mov	eax, DWORD PTR _opno$668[ebp]
	mov	BYTE PTR _strict_low[eax], 0
; Line 416
	mov	eax, DWORD PTR _part$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _opno$668[ebp]
	mov	DWORD PTR _predicates[ecx*4], eax
; Line 417
	mov	eax, DWORD PTR _opno$668[ebp]
	mov	DWORD PTR _constraints[eax*4], 0
; Line 418
	mov	eax, DWORD PTR _opno$668[ebp]
	mov	BYTE PTR _address_p[eax], 0
; Line 419
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L672
$L673:
	inc	DWORD PTR _i$[ebp]
$L672:
	mov	eax, DWORD PTR _part$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	DWORD PTR [eax], ecx
	jbe	$L674
; Line 420
	push	0
	push	0
	mov	eax, DWORD PTR _part$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	push	eax
	call	_scan_operands
	add	esp, 12					; 0000000cH
	jmp	$L673
$L674:
; Line 421
	jmp	$L654
; Line 424
$L667:
	cmp	DWORD PTR _code$[ebp], 5
	jne	$L675
; Line 426
	inc	DWORD PTR _num_dups
; Line 427
	jmp	$L654
; Line 430
$L675:
	cmp	DWORD PTR _code$[ebp], 12		; 0000000cH
	jne	$L676
; Line 432
	push	0
	push	1
	mov	eax, DWORD PTR _part$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_scan_operands
	add	esp, 12					; 0000000cH
; Line 433
	jmp	$L654
; Line 436
$L676:
	cmp	DWORD PTR _code$[ebp], 36		; 00000024H
	jne	$L677
; Line 438
	push	1
	push	0
	mov	eax, DWORD PTR _part$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_scan_operands
	add	esp, 12					; 0000000cH
; Line 439
	jmp	$L654
; Line 442
$L677:
	mov	eax, DWORD PTR _part$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	eax, DWORD PTR _rtx_format[eax*4]
	mov	DWORD PTR _format_ptr$[ebp], eax
; Line 444
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L678
$L679:
	inc	DWORD PTR _i$[ebp]
$L678:
	mov	eax, DWORD PTR _part$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _rtx_length[eax*4], ecx
	jle	$L680
; Line 445
	mov	eax, DWORD PTR _format_ptr$[ebp]
	mov	DWORD PTR -28+[ebp], eax
	inc	DWORD PTR _format_ptr$[ebp]
	mov	eax, DWORD PTR -28+[ebp]
	movsx	eax, BYTE PTR [eax]
	mov	DWORD PTR -32+[ebp], eax
	jmp	$L681
; Line 447
$L685:
; Line 448
	push	0
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _part$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	push	eax
	call	_scan_operands
	add	esp, 12					; 0000000cH
; Line 449
	jmp	$L682
; Line 450
$L686:
; Line 451
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _part$[ebp]
	cmp	DWORD PTR [ecx+eax*4+4], 0
	je	$L687
; Line 452
	mov	DWORD PTR _j$[ebp], 0
	jmp	$L688
$L689:
	inc	DWORD PTR _j$[ebp]
$L688:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _part$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$[ebp]
	cmp	DWORD PTR [eax], ecx
	jbe	$L690
; Line 453
	push	0
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _part$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	push	eax
	call	_scan_operands
	add	esp, 12					; 0000000cH
	jmp	$L689
$L690:
; Line 454
$L687:
	jmp	$L682
; Line 455
	jmp	$L682
$L681:
	cmp	DWORD PTR -32+[ebp], 69			; 00000045H
	je	$L686
	cmp	DWORD PTR -32+[ebp], 101		; 00000065H
	je	$L685
	jmp	$L682
$L682:
	jmp	$L679
$L680:
; Line 456
$L654:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_scan_operands ENDP
_TEXT	ENDS
PUBLIC	_xmalloc
PUBLIC	_mybcopy
PUBLIC	_mybzero
PUBLIC	_gen_insn
EXTRN	__iob:BYTE
EXTRN	__flsbuf:NEAR
_DATA	SEGMENT
$SG704	DB	0aH, 'static char *', 0aH, 00H
$SG705	DB	'output_%d (operands, insn)', 0aH, 00H
$SG706	DB	'     rtx *operands;', 0aH, 00H
	ORG $+3
$SG707	DB	'     rtx insn;', 0aH, 00H
$SG708	DB	'{', 0aH, 00H
	ORG $+1
$SG713	DB	'}', 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_cp$709 = -12
_insn$ = 8
_d$ = -8
_i$ = -4
_gen_insn PROC NEAR
; Line 465
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 466
	push	756					; 000002f4H
	call	_xmalloc
	add	esp, 4
	mov	DWORD PTR _d$[ebp], eax
; Line 469
	mov	eax, DWORD PTR _next_code_number
	mov	ecx, DWORD PTR _d$[ebp]
	mov	DWORD PTR [ecx], eax
	inc	DWORD PTR _next_code_number
; Line 470
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+4]
	movsx	eax, BYTE PTR [eax]
	or	eax, eax
	je	$L696
; Line 471
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _d$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 472
	jmp	$L697
$L696:
; Line 473
	mov	eax, DWORD PTR _d$[ebp]
	mov	DWORD PTR [eax+4], 0
$L697:
; Line 477
	mov	eax, DWORD PTR _d$[ebp]
	mov	DWORD PTR [eax+24], 0
; Line 478
	cmp	DWORD PTR _end_of_insn_data, 0
	je	$L698
; Line 479
	mov	eax, DWORD PTR _d$[ebp]
	mov	ecx, DWORD PTR _end_of_insn_data
	mov	DWORD PTR [ecx+24], eax
; Line 480
	jmp	$L699
$L698:
; Line 481
	mov	eax, DWORD PTR _d$[ebp]
	mov	DWORD PTR _insn_data, eax
$L699:
; Line 483
	mov	eax, DWORD PTR _d$[ebp]
	mov	DWORD PTR _end_of_insn_data, eax
; Line 485
	mov	DWORD PTR _max_opno, -1
; Line 486
	mov	DWORD PTR _num_dups, 0
; Line 488
	push	160					; 000000a0H
	push	OFFSET _constraints
	call	_mybzero
	add	esp, 8
; Line 489
	push	160					; 000000a0H
	push	OFFSET _op_n_alternatives
	call	_mybzero
	add	esp, 8
; Line 490
	push	160					; 000000a0H
	push	OFFSET _predicates
	call	_mybzero
	add	esp, 8
; Line 491
	push	40					; 00000028H
	push	OFFSET _address_p
	call	_mybzero
	add	esp, 8
; Line 492
	push	160					; 000000a0H
	push	OFFSET _modes
	call	_mybzero
	add	esp, 8
; Line 493
	push	40					; 00000028H
	push	OFFSET _strict_low
	call	_mybzero
	add	esp, 8
; Line 494
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L700
$L701:
	inc	DWORD PTR _i$[ebp]
$L700:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	DWORD PTR [eax], ecx
	jbe	$L702
; Line 495
	push	0
	push	0
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	push	eax
	call	_scan_operands
	add	esp, 12					; 0000000cH
	jmp	$L701
$L702:
; Line 496
	mov	eax, DWORD PTR _max_opno
	inc	eax
	mov	ecx, DWORD PTR _d$[ebp]
	mov	DWORD PTR [ecx+12], eax
; Line 497
	mov	eax, DWORD PTR _num_dups
	mov	ecx, DWORD PTR _d$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 498
	push	160					; 000000a0H
	mov	eax, DWORD PTR _d$[ebp]
	add	eax, 28					; 0000001cH
	push	eax
	push	OFFSET _constraints
	call	_mybcopy
	add	esp, 12					; 0000000cH
; Line 499
	push	160					; 000000a0H
	mov	eax, DWORD PTR _d$[ebp]
	add	eax, 188				; 000000bcH
	push	eax
	push	OFFSET _op_n_alternatives
	call	_mybcopy
	add	esp, 12					; 0000000cH
; Line 500
	push	160					; 000000a0H
	mov	eax, DWORD PTR _d$[ebp]
	add	eax, 348				; 0000015cH
	push	eax
	push	OFFSET _predicates
	call	_mybcopy
	add	esp, 12					; 0000000cH
; Line 501
	push	40					; 00000028H
	mov	eax, DWORD PTR _d$[ebp]
	add	eax, 508				; 000001fcH
	push	eax
	push	OFFSET _address_p
	call	_mybcopy
	add	esp, 12					; 0000000cH
; Line 502
	push	160					; 000000a0H
	mov	eax, DWORD PTR _d$[ebp]
	add	eax, 548				; 00000224H
	push	eax
	push	OFFSET _modes
	call	_mybcopy
	add	esp, 12					; 0000000cH
; Line 503
	push	40					; 00000028H
	mov	eax, DWORD PTR _d$[ebp]
	add	eax, 708				; 000002c4H
	push	eax
	push	OFFSET _strict_low
	call	_mybcopy
	add	esp, 12					; 0000000cH
; Line 504
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	ecx, DWORD PTR _d$[ebp]
	mov	DWORD PTR [ecx+752], eax
; Line 511
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 42					; 0000002aH
	je	$L703
; Line 513
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _d$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 514
	mov	eax, DWORD PTR _d$[ebp]
	mov	BYTE PTR [eax+748], 0
; Line 515
	jmp	$L693
; Line 518
$L703:
	mov	eax, DWORD PTR _d$[ebp]
	mov	DWORD PTR [eax+8], 0
; Line 519
	mov	eax, DWORD PTR _d$[ebp]
	mov	BYTE PTR [eax+748], 1
; Line 521
	push	OFFSET $SG704
	call	_printf
	add	esp, 4
; Line 522
	mov	eax, DWORD PTR _d$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	push	OFFSET $SG705
	call	_printf
	add	esp, 8
; Line 523
	push	OFFSET $SG706
	call	_printf
	add	esp, 4
; Line 524
	push	OFFSET $SG707
	call	_printf
	add	esp, 4
; Line 525
	push	OFFSET $SG708
	call	_printf
	add	esp, 4
; Line 530
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	inc	eax
	mov	DWORD PTR _cp$709[ebp], eax
; Line 531
$L711:
	mov	eax, DWORD PTR _cp$709[ebp]
	movsx	eax, BYTE PTR [eax]
	or	eax, eax
	je	$L712
	dec	DWORD PTR __iob+36
	js	$L819
	mov	eax, DWORD PTR _cp$709[ebp]
	mov	al, BYTE PTR [eax]
	mov	ecx, DWORD PTR __iob+32
	mov	BYTE PTR [ecx], al
	inc	DWORD PTR _cp$709[ebp]
	inc	DWORD PTR __iob+32
	jmp	$L820
$L819:
	mov	eax, DWORD PTR _cp$709[ebp]
	mov	DWORD PTR -16+[ebp], eax
	inc	DWORD PTR _cp$709[ebp]
	mov	eax, OFFSET __iob
	add	eax, 32					; 00000020H
	push	eax
	mov	eax, DWORD PTR -16+[ebp]
	movsx	eax, BYTE PTR [eax]
	push	eax
	call	__flsbuf
	add	esp, 8
$L820:
	jmp	$L711
$L712:
; Line 532
	dec	DWORD PTR __iob+36
	js	$L821
	mov	eax, DWORD PTR __iob+32
	mov	BYTE PTR [eax], 10			; 0000000aH
	inc	DWORD PTR __iob+32
	jmp	$L822
$L821:
	mov	eax, OFFSET __iob
	add	eax, 32					; 00000020H
	push	eax
	push	10					; 0000000aH
	call	__flsbuf
	add	esp, 8
$L822:
; Line 534
	push	OFFSET $SG713
	call	_printf
	add	esp, 4
; Line 535
$L693:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_insn ENDP
_TEXT	ENDS
PUBLIC	_gen_peephole
_DATA	SEGMENT
	ORG $+1
$SG725	DB	0aH, 'static char *', 0aH, 00H
$SG726	DB	'output_%d (operands, insn)', 0aH, 00H
$SG727	DB	'     rtx *operands;', 0aH, 00H
	ORG $+3
$SG728	DB	'     rtx insn;', 0aH, 00H
$SG729	DB	'{', 0aH, 00H
	ORG $+1
$SG730	DB	'%s', 0aH, 00H
$SG731	DB	'}', 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_peep$ = 8
_d$ = -8
_i$ = -4
_gen_peephole PROC NEAR
; Line 544
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 545
	push	756					; 000002f4H
	call	_xmalloc
	add	esp, 4
	mov	DWORD PTR _d$[ebp], eax
; Line 548
	mov	eax, DWORD PTR _next_code_number
	mov	ecx, DWORD PTR _d$[ebp]
	mov	DWORD PTR [ecx], eax
	inc	DWORD PTR _next_code_number
; Line 549
	mov	eax, DWORD PTR _d$[ebp]
	mov	DWORD PTR [eax+4], 0
; Line 553
	mov	eax, DWORD PTR _d$[ebp]
	mov	DWORD PTR [eax+24], 0
; Line 554
	cmp	DWORD PTR _end_of_insn_data, 0
	je	$L719
; Line 555
	mov	eax, DWORD PTR _d$[ebp]
	mov	ecx, DWORD PTR _end_of_insn_data
	mov	DWORD PTR [ecx+24], eax
; Line 556
	jmp	$L720
$L719:
; Line 557
	mov	eax, DWORD PTR _d$[ebp]
	mov	DWORD PTR _insn_data, eax
$L720:
; Line 559
	mov	eax, DWORD PTR _d$[ebp]
	mov	DWORD PTR _end_of_insn_data, eax
; Line 561
	mov	DWORD PTR _max_opno, -1
; Line 562
	push	160					; 000000a0H
	push	OFFSET _constraints
	call	_mybzero
	add	esp, 8
; Line 563
	push	160					; 000000a0H
	push	OFFSET _op_n_alternatives
	call	_mybzero
	add	esp, 8
; Line 568
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L721
$L722:
	inc	DWORD PTR _i$[ebp]
$L721:
	mov	eax, DWORD PTR _peep$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	DWORD PTR [eax], ecx
	jbe	$L723
; Line 569
	push	0
	push	0
	mov	eax, DWORD PTR _peep$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	push	eax
	call	_scan_operands
	add	esp, 12					; 0000000cH
	jmp	$L722
$L723:
; Line 571
	mov	eax, DWORD PTR _max_opno
	inc	eax
	mov	ecx, DWORD PTR _d$[ebp]
	mov	DWORD PTR [ecx+12], eax
; Line 572
	mov	eax, DWORD PTR _d$[ebp]
	mov	DWORD PTR [eax+16], 0
; Line 573
	push	160					; 000000a0H
	mov	eax, DWORD PTR _d$[ebp]
	add	eax, 28					; 0000001cH
	push	eax
	push	OFFSET _constraints
	call	_mybcopy
	add	esp, 12					; 0000000cH
; Line 574
	push	160					; 000000a0H
	mov	eax, DWORD PTR _d$[ebp]
	add	eax, 188				; 000000bcH
	push	eax
	push	OFFSET _op_n_alternatives
	call	_mybcopy
	add	esp, 12					; 0000000cH
; Line 575
	push	160					; 000000a0H
	mov	eax, DWORD PTR _d$[ebp]
	add	eax, 348				; 0000015cH
	push	eax
	call	_mybzero
	add	esp, 8
; Line 576
	push	40					; 00000028H
	mov	eax, DWORD PTR _d$[ebp]
	add	eax, 508				; 000001fcH
	push	eax
	call	_mybzero
	add	esp, 8
; Line 577
	push	160					; 000000a0H
	mov	eax, DWORD PTR _d$[ebp]
	add	eax, 548				; 00000224H
	push	eax
	call	_mybzero
	add	esp, 8
; Line 578
	push	40					; 00000028H
	mov	eax, DWORD PTR _d$[ebp]
	add	eax, 708				; 000002c4H
	push	eax
	call	_mybzero
	add	esp, 8
; Line 579
	mov	eax, DWORD PTR _peep$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _d$[ebp]
	mov	DWORD PTR [ecx+752], eax
; Line 586
	mov	eax, DWORD PTR _peep$[ebp]
	mov	eax, DWORD PTR [eax+12]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 42					; 0000002aH
	je	$L724
; Line 588
	mov	eax, DWORD PTR _peep$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	ecx, DWORD PTR _d$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 589
	mov	eax, DWORD PTR _d$[ebp]
	mov	BYTE PTR [eax+748], 0
; Line 590
	jmp	$L716
; Line 593
$L724:
	mov	eax, DWORD PTR _d$[ebp]
	mov	DWORD PTR [eax+8], 0
; Line 594
	mov	eax, DWORD PTR _d$[ebp]
	mov	BYTE PTR [eax+748], 1
; Line 596
	push	OFFSET $SG725
	call	_printf
	add	esp, 4
; Line 597
	mov	eax, DWORD PTR _d$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	push	OFFSET $SG726
	call	_printf
	add	esp, 8
; Line 598
	push	OFFSET $SG727
	call	_printf
	add	esp, 4
; Line 599
	push	OFFSET $SG728
	call	_printf
	add	esp, 4
; Line 600
	push	OFFSET $SG729
	call	_printf
	add	esp, 4
; Line 601
	mov	eax, DWORD PTR _peep$[ebp]
	mov	eax, DWORD PTR [eax+12]
	inc	eax
	push	eax
	push	OFFSET $SG730
	call	_printf
	add	esp, 8
; Line 602
	push	OFFSET $SG731
	call	_printf
	add	esp, 4
; Line 603
$L716:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_peephole ENDP
_TEXT	ENDS
PUBLIC	_gen_expand
_TEXT	SEGMENT
_insn$ = 8
_d$ = -8
_i$ = -4
_gen_expand PROC NEAR
; Line 611
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 612
	push	756					; 000002f4H
	call	_xmalloc
	add	esp, 4
	mov	DWORD PTR _d$[ebp], eax
; Line 615
	mov	eax, DWORD PTR _next_code_number
	mov	ecx, DWORD PTR _d$[ebp]
	mov	DWORD PTR [ecx], eax
	inc	DWORD PTR _next_code_number
; Line 616
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+4]
	movsx	eax, BYTE PTR [eax]
	or	eax, eax
	je	$L737
; Line 617
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _d$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 618
	jmp	$L738
$L737:
; Line 619
	mov	eax, DWORD PTR _d$[ebp]
	mov	DWORD PTR [eax+4], 0
$L738:
; Line 623
	mov	eax, DWORD PTR _d$[ebp]
	mov	DWORD PTR [eax+24], 0
; Line 624
	cmp	DWORD PTR _end_of_insn_data, 0
	je	$L739
; Line 625
	mov	eax, DWORD PTR _d$[ebp]
	mov	ecx, DWORD PTR _end_of_insn_data
	mov	DWORD PTR [ecx+24], eax
; Line 626
	jmp	$L740
$L739:
; Line 627
	mov	eax, DWORD PTR _d$[ebp]
	mov	DWORD PTR _insn_data, eax
$L740:
; Line 629
	mov	eax, DWORD PTR _d$[ebp]
	mov	DWORD PTR _end_of_insn_data, eax
; Line 631
	mov	DWORD PTR _max_opno, -1
; Line 632
	mov	DWORD PTR _num_dups, 0
; Line 637
	push	160					; 000000a0H
	push	OFFSET _predicates
	call	_mybzero
	add	esp, 8
; Line 638
	push	160					; 000000a0H
	push	OFFSET _modes
	call	_mybzero
	add	esp, 8
; Line 639
	mov	eax, DWORD PTR _insn$[ebp]
	cmp	DWORD PTR [eax+8], 0
	je	$L741
; Line 640
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L742
$L743:
	inc	DWORD PTR _i$[ebp]
$L742:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	DWORD PTR [eax], ecx
	jbe	$L744
; Line 641
	push	0
	push	0
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	push	eax
	call	_scan_operands
	add	esp, 12					; 0000000cH
	jmp	$L743
$L744:
; Line 642
$L741:
	mov	eax, DWORD PTR _max_opno
	inc	eax
	mov	ecx, DWORD PTR _d$[ebp]
	mov	DWORD PTR [ecx+12], eax
; Line 643
	push	160					; 000000a0H
	mov	eax, DWORD PTR _d$[ebp]
	add	eax, 348				; 0000015cH
	push	eax
	push	OFFSET _predicates
	call	_mybcopy
	add	esp, 12					; 0000000cH
; Line 644
	push	160					; 000000a0H
	mov	eax, DWORD PTR _d$[ebp]
	add	eax, 548				; 00000224H
	push	eax
	push	OFFSET _modes
	call	_mybcopy
	add	esp, 12					; 0000000cH
; Line 646
	push	160					; 000000a0H
	mov	eax, DWORD PTR _d$[ebp]
	add	eax, 28					; 0000001cH
	push	eax
	call	_mybzero
	add	esp, 8
; Line 647
	push	160					; 000000a0H
	mov	eax, DWORD PTR _d$[ebp]
	add	eax, 188				; 000000bcH
	push	eax
	call	_mybzero
	add	esp, 8
; Line 648
	push	40					; 00000028H
	mov	eax, DWORD PTR _d$[ebp]
	add	eax, 508				; 000001fcH
	push	eax
	call	_mybzero
	add	esp, 8
; Line 649
	push	40					; 00000028H
	mov	eax, DWORD PTR _d$[ebp]
	add	eax, 708				; 000002c4H
	push	eax
	call	_mybzero
	add	esp, 8
; Line 651
	mov	eax, DWORD PTR _d$[ebp]
	mov	DWORD PTR [eax+16], 0
; Line 652
	mov	eax, DWORD PTR _d$[ebp]
	mov	DWORD PTR [eax+8], 0
; Line 653
	mov	eax, DWORD PTR _d$[ebp]
	mov	BYTE PTR [eax+748], 0
; Line 654
	mov	eax, DWORD PTR _d$[ebp]
	mov	DWORD PTR [eax+752], 0
; Line 655
$L734:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_expand ENDP
_TEXT	ENDS
PUBLIC	_fatal
EXTRN	_malloc:NEAR
_DATA	SEGMENT
	ORG $+1
$SG750	DB	'virtual memory exhausted', 00H
_DATA	ENDS
_TEXT	SEGMENT
_size$ = 8
_val$ = -4
_xmalloc PROC NEAR
; Line 659
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 660
	mov	eax, DWORD PTR _size$[ebp]
	push	eax
	call	_malloc
	add	esp, 4
	mov	DWORD PTR _val$[ebp], eax
; Line 662
	cmp	DWORD PTR _val$[ebp], 0
	jne	$L749
; Line 663
	push	0
	push	0
	push	OFFSET $SG750
	call	_fatal
	add	esp, 12					; 0000000cH
; Line 664
$L749:
	mov	eax, DWORD PTR _val$[ebp]
	jmp	$L746
; Line 665
$L746:
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
$SG758	DB	'virtual memory exhausted', 00H
_DATA	ENDS
_TEXT	SEGMENT
_ptr$ = 8
_size$ = 12
_result$ = -4
_xrealloc PROC NEAR
; Line 671
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 672
	mov	eax, DWORD PTR _size$[ebp]
	push	eax
	mov	eax, DWORD PTR _ptr$[ebp]
	push	eax
	call	_realloc
	add	esp, 8
	mov	DWORD PTR _result$[ebp], eax
; Line 673
	cmp	DWORD PTR _result$[ebp], 0
	jne	$L757
; Line 674
	push	0
	push	0
	push	OFFSET $SG758
	call	_fatal
	add	esp, 12					; 0000000cH
; Line 675
$L757:
	mov	eax, DWORD PTR _result$[ebp]
	jmp	$L754
; Line 676
$L754:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_xrealloc ENDP
_b$ = 8
_length$ = 12
_mybzero PROC NEAR
; Line 682
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 683
$L763:
	mov	eax, DWORD PTR _length$[ebp]
	mov	DWORD PTR -4+[ebp], eax
	dec	DWORD PTR _length$[ebp]
	cmp	DWORD PTR -4+[ebp], 0
	jle	$L764
; Line 684
	mov	eax, DWORD PTR _b$[ebp]
	mov	BYTE PTR [eax], 0
	inc	DWORD PTR _b$[ebp]
	jmp	$L763
$L764:
; Line 685
$L761:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_mybzero ENDP
_b1$ = 8
_b2$ = 12
_length$ = 16
_mybcopy PROC NEAR
; Line 692
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 693
$L770:
	mov	eax, DWORD PTR _length$[ebp]
	mov	DWORD PTR -4+[ebp], eax
	dec	DWORD PTR _length$[ebp]
	cmp	DWORD PTR -4+[ebp], 0
	jle	$L771
; Line 694
	mov	eax, DWORD PTR _b1$[ebp]
	mov	al, BYTE PTR [eax]
	mov	ecx, DWORD PTR _b2$[ebp]
	mov	BYTE PTR [ecx], al
	inc	DWORD PTR _b1$[ebp]
	inc	DWORD PTR _b2$[ebp]
	jmp	$L770
$L771:
; Line 695
$L768:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_mybcopy ENDP
_TEXT	ENDS
EXTRN	_fprintf:NEAR
EXTRN	_exit:NEAR
_DATA	SEGMENT
	ORG $+3
$SG776	DB	'genoutput: ', 00H
$SG777	DB	0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_s$ = 8
_a1$ = 12
_a2$ = 16
_fatal	PROC NEAR
; Line 700
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 701
	push	OFFSET $SG776
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 8
; Line 702
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
; Line 703
	push	OFFSET $SG777
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 8
; Line 704
	push	33					; 00000021H
	call	_exit
	add	esp, 4
; Line 705
$L775:
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
$SG780	DB	'Internal gcc abort.', 00H
_DATA	ENDS
_TEXT	SEGMENT
_fancy_abort PROC NEAR
; Line 712
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 713
	push	0
	push	0
	push	OFFSET $SG780
	call	_fatal
	add	esp, 12					; 0000000cH
; Line 714
$L779:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_fancy_abort ENDP
_TEXT	ENDS
_DATA	SEGMENT
$SG785	DB	'genoutput: ', 00H
$SG786	DB	0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_s$ = 8
_a1$ = 12
_a2$ = 16
_error	PROC NEAR
; Line 719
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 720
	push	OFFSET $SG785
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 8
; Line 721
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
; Line 722
	push	OFFSET $SG786
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 8
; Line 723
$L784:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_error	ENDP
_TEXT	ENDS
PUBLIC	_main
EXTRN	_fopen:NEAR
EXTRN	_free:NEAR
EXTRN	_perror:NEAR
EXTRN	_read_rtx:NEAR
EXTRN	__obstack_begin:NEAR
EXTRN	_init_rtl:NEAR
EXTRN	_read_skip_spaces:NEAR
EXTRN	_ungetc:NEAR
EXTRN	_fflush:NEAR
_DATA	SEGMENT
	ORG $+2
$SG797	DB	'No input file name.', 00H
$SG798	DB	'r', 00H
_DATA	ENDS
_TEXT	SEGMENT
_argc$ = 8
_argv$ = 12
_desc$ = -8
_infile$ = -4
_c$ = -12
_main	PROC NEAR
; Line 729
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 735
	push	OFFSET _free
	push	OFFSET _xmalloc
	push	0
	push	0
	mov	eax, DWORD PTR _rtl_obstack
	push	eax
	call	__obstack_begin
	add	esp, 20					; 00000014H
; Line 737
	cmp	DWORD PTR _argc$[ebp], 1
	jg	$L796
; Line 738
	push	0
	push	0
	push	OFFSET $SG797
	call	_fatal
	add	esp, 12					; 0000000cH
; Line 740
$L796:
	push	OFFSET $SG798
	mov	eax, DWORD PTR _argv$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_fopen
	add	esp, 8
	mov	DWORD PTR _infile$[ebp], eax
; Line 741
	cmp	DWORD PTR _infile$[ebp], 0
	jne	$L799
; Line 743
	mov	eax, DWORD PTR _argv$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_perror
	add	esp, 4
; Line 744
	push	33					; 00000021H
	call	_exit
	add	esp, 4
; Line 747
$L799:
	call	_init_rtl
; Line 749
	call	_output_prologue
; Line 750
	mov	DWORD PTR _next_code_number, 0
; Line 751
	mov	DWORD PTR _have_constraints, 0
; Line 755
$L802:
; Line 757
	mov	eax, DWORD PTR _infile$[ebp]
	push	eax
	call	_read_skip_spaces
	add	esp, 4
	mov	DWORD PTR _c$[ebp], eax
; Line 758
	cmp	DWORD PTR _c$[ebp], -1
	jne	$L805
; Line 759
	jmp	$L803
; Line 760
$L805:
	mov	eax, DWORD PTR _infile$[ebp]
	push	eax
	mov	eax, DWORD PTR _c$[ebp]
	push	eax
	call	_ungetc
	add	esp, 8
; Line 762
	mov	eax, DWORD PTR _infile$[ebp]
	push	eax
	call	_read_rtx
	add	esp, 4
	mov	DWORD PTR _desc$[ebp], eax
; Line 763
	mov	eax, DWORD PTR _desc$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 458752				; 00070000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L806
; Line 764
	mov	eax, DWORD PTR _desc$[ebp]
	push	eax
	call	_gen_insn
	add	esp, 4
; Line 765
$L806:
	mov	eax, DWORD PTR _desc$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 524288				; 00080000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L807
; Line 766
	mov	eax, DWORD PTR _desc$[ebp]
	push	eax
	call	_gen_peephole
	add	esp, 4
; Line 767
$L807:
	mov	eax, DWORD PTR _desc$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 655360				; 000a0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L808
; Line 768
	mov	eax, DWORD PTR _desc$[ebp]
	push	eax
	call	_gen_expand
	add	esp, 4
; Line 769
$L808:
	jmp	$L802
$L803:
; Line 771
	call	_output_epilogue
; Line 773
	mov	eax, OFFSET __iob
	add	eax, 32					; 00000020H
	push	eax
	call	_fflush
	add	esp, 4
; Line 774
	mov	eax, DWORD PTR __iob+44
	and	eax, 32					; 00000020H
	cmp	eax, 1
	cmc
	sbb	eax, eax
	and	eax, 33					; 00000021H
	push	eax
	call	_exit
	add	esp, 4
; Line 775
$L790:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_main	ENDP
_c$ = 8
_s$ = 12
_n$ = -4
_n_occurrences PROC NEAR
; Line 781
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 782
	mov	DWORD PTR _n$[ebp], 0
; Line 783
$L814:
	mov	eax, DWORD PTR _s$[ebp]
	movsx	eax, BYTE PTR [eax]
	or	eax, eax
	je	$L815
; Line 784
	mov	eax, DWORD PTR _s$[ebp]
	movsx	eax, BYTE PTR [eax]
	movsx	ecx, BYTE PTR _c$[ebp]
	sub	eax, ecx
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	add	DWORD PTR _n$[ebp], eax
	inc	DWORD PTR _s$[ebp]
	jmp	$L814
$L815:
; Line 785
	mov	eax, DWORD PTR _n$[ebp]
	jmp	$L811
; Line 786
$L811:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_n_occurrences ENDP
_TEXT	ENDS
END
