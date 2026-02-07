	TITLE	reload.c
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
_DATA	SEGMENT
COMM	_reload_earlyclobbers:DWORD:07H
COMM	_reload_nocombine:BYTE:02aH
COMM	_reload_in:DWORD:02aH
COMM	_reload_out:DWORD:02aH
COMM	_reload_in_reg:DWORD:02aH
COMM	_reload_reg_class:DWORD:02aH
COMM	_reload_inmode:DWORD:02aH
COMM	_reload_outmode:DWORD:02aH
COMM	_reload_strict_low:BYTE:02aH
COMM	_reload_optional:BYTE:02aH
COMM	_reload_inc:DWORD:02aH
COMM	_reload_needed_for_multiple:DWORD:02aH
COMM	_reload_needed_for:DWORD:02aH
COMM	_n_reloads:DWORD
COMM	_reload_reg_rtx:DWORD:02aH
COMM	_reload_when_needed:DWORD:02aH
COMM	_n_earlyclobbers:DWORD
_DATA	ENDS
PUBLIC	_find_equiv_reg
EXTRN	_mode_size:BYTE
EXTRN	_abort:NEAR
EXTRN	_reg_overlap_mentioned_p:NEAR
EXTRN	_reg_renumber:DWORD
EXTRN	_gen_rtx:NEAR
EXTRN	_reg_equiv_constant:DWORD
EXTRN	_rtx_equal_p:NEAR
_BSS	SEGMENT
_replace_reloads$S466 DD 01H DUP (?)
_replacements$S468 DB 01a4H DUP (?)
_n_replacements$S469 DD 01H DUP (?)
_this_insn$S472 DD 01H DUP (?)
_static_reload_reg_p$S475 DD 01H DUP (?)
_output_reloadnum$S477 DD 01H DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
; File reload.c
_in$ = 8
_out$ = 12
_inloc$ = 16
_outloc$ = 20
_class$ = 24
_r$556 = -20
_inmode$ = 28
_outmode$ = 32
_r$558 = -24
_strict_low$ = 36
_optional$ = 40
_needed_for$ = 44
_i$ = -4
_dont_share$ = -8
_regno$504 = -12
_regno$507 = -16
_push_reload PROC NEAR
; Line 262
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	push	ebx
	push	esi
	push	edi
; Line 264
	mov	DWORD PTR _dont_share$[ebp], 0
; Line 272
	cmp	DWORD PTR _inmode$[ebp], 0
	jne	$L501
	cmp	DWORD PTR _in$[ebp], 0
	je	$L501
; Line 273
	mov	eax, DWORD PTR _in$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	mov	DWORD PTR _inmode$[ebp], eax
; Line 274
$L501:
	cmp	DWORD PTR _outmode$[ebp], 0
	jne	$L502
	cmp	DWORD PTR _out$[ebp], 0
	je	$L502
; Line 275
	mov	eax, DWORD PTR _out$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	mov	DWORD PTR _outmode$[ebp], eax
; Line 281
$L502:
	cmp	DWORD PTR _in$[ebp], 0
	je	$L503
	mov	eax, DWORD PTR _in$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L503
; Line 283
	mov	eax, DWORD PTR _in$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _regno$504[ebp], eax
; Line 286
	cmp	DWORD PTR _regno$504[ebp], 10		; 0000000aH
	jl	$L505
	mov	eax, DWORD PTR _regno$504[ebp]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	or	eax, eax
	jge	$L505
	mov	eax, DWORD PTR _regno$504[ebp]
	mov	ecx, DWORD PTR _reg_equiv_constant
	cmp	DWORD PTR [ecx+eax*4], 0
	je	$L505
; Line 287
	mov	eax, DWORD PTR _regno$504[ebp]
	mov	ecx, DWORD PTR _reg_equiv_constant
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _in$[ebp], eax
; Line 288
$L505:
; Line 293
$L503:
	cmp	DWORD PTR _out$[ebp], 0
	je	$L506
	mov	eax, DWORD PTR _out$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L506
; Line 295
	mov	eax, DWORD PTR _out$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _regno$507[ebp], eax
; Line 298
	cmp	DWORD PTR _regno$507[ebp], 10		; 0000000aH
	jl	$L508
	mov	eax, DWORD PTR _regno$507[ebp]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	or	eax, eax
	jge	$L508
	mov	eax, DWORD PTR _regno$507[ebp]
	mov	ecx, DWORD PTR _reg_equiv_constant
	cmp	DWORD PTR [ecx+eax*4], 0
	je	$L508
; Line 299
	mov	eax, DWORD PTR _regno$507[ebp]
	mov	ecx, DWORD PTR _reg_equiv_constant
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _out$[ebp], eax
; Line 300
$L508:
; Line 304
$L506:
	cmp	DWORD PTR _in$[ebp], 0
	je	$L510
	cmp	DWORD PTR _out$[ebp], 0
	je	$L510
	mov	eax, DWORD PTR _in$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L510
	mov	eax, DWORD PTR _out$[ebp]
	push	eax
	mov	eax, DWORD PTR _in$[ebp]
	push	eax
	call	_rtx_equal_p
	add	esp, 8
	or	eax, eax
	je	$L510
; Line 307
	mov	eax, DWORD PTR _in$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 4325376				; 00420000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L512
	mov	eax, DWORD PTR _in$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 4259840				; 00410000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L511
$L512:
; Line 308
	mov	eax, DWORD PTR _in$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _in$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	37					; 00000025H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _in$[ebp], eax
; Line 309
$L511:
; Line 310
	mov	eax, DWORD PTR _in$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 4194304				; 00400000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L514
	mov	eax, DWORD PTR _in$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 4128768				; 003f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L513
$L514:
; Line 311
	mov	eax, DWORD PTR _out$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _out$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	37					; 00000025H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _out$[ebp], eax
; Line 312
$L513:
; Line 319
$L510:
	cmp	DWORD PTR _in$[ebp], 0
	je	$L515
	mov	eax, DWORD PTR _in$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L515
	mov	eax, DWORD PTR _in$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L515
; Line 321
	mov	eax, DWORD PTR _in$[ebp]
	add	eax, 4
	mov	DWORD PTR _inloc$[ebp], eax
; Line 322
	mov	eax, DWORD PTR _inloc$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _in$[ebp], eax
; Line 323
	mov	eax, DWORD PTR _in$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L516
; Line 326
	mov	eax, DWORD PTR _in$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	ecx, DWORD PTR _inmode$[ebp]
	mov	ecx, DWORD PTR _mode_size[ecx*4]
	cmp	DWORD PTR _mode_size[eax], ecx
	jle	$L517
; Line 327
	call	_abort
; Line 328
$L517:
$L516:
	mov	eax, DWORD PTR _in$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	mov	DWORD PTR _inmode$[ebp], eax
; Line 332
$L515:
	cmp	DWORD PTR _in$[ebp], 0
	je	$L520
	cmp	DWORD PTR _out$[ebp], 0
	je	$L520
	mov	eax, DWORD PTR _out$[ebp]
	push	eax
	mov	eax, DWORD PTR _in$[ebp]
	push	eax
	call	_reg_overlap_mentioned_p
	add	esp, 8
	or	eax, eax
	je	$L520
; Line 333
	mov	DWORD PTR _dont_share$[ebp], 1
; Line 337
$L520:
	cmp	DWORD PTR _in$[ebp], 0
	je	$L521
; Line 338
	mov	eax, DWORD PTR _in$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2031616				; 001f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1517
	cmp	DWORD PTR _class$[ebp], 10		; 0000000aH
	je	$L1521
	cmp	DWORD PTR _class$[ebp], 12		; 0000000cH
	jne	$L1519
$L1521:
	mov	DWORD PTR _class$[ebp], 10		; 0000000aH
	jmp	$L1520
$L1519:
	mov	DWORD PTR _class$[ebp], 0
$L1520:
	jmp	$L1518
$L1517:
	mov	eax, DWORD PTR _in$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 16777216				; 01000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1522
	cmp	DWORD PTR _class$[ebp], 10		; 0000000aH
	je	$L1526
	cmp	DWORD PTR _class$[ebp], 12		; 0000000cH
	jne	$L1524
$L1526:
	mov	DWORD PTR _class$[ebp], 6
	jmp	$L1525
$L1524:
	cmp	DWORD PTR _class$[ebp], 9
	jne	$L1527
	call	_abort
	mov	DWORD PTR _class$[ebp], 9
	jmp	$L1528
$L1527:
$L1528:
$L1525:
	jmp	$L1523
$L1522:
$L1523:
$L1518:
; Line 340
$L521:
	cmp	DWORD PTR _class$[ebp], 0
	jne	$L522
; Line 341
	call	_abort
; Line 347
$L522:
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L523
$L524:
	inc	DWORD PTR _i$[ebp]
$L523:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _n_reloads, eax
	jle	$L525
; Line 354
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _class$[ebp]
	cmp	DWORD PTR _reload_reg_class[eax*4], ecx
	jne	$L526
	mov	eax, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR _reload_strict_low[eax]
	cmp	eax, DWORD PTR _strict_low$[ebp]
	jne	$L526
	cmp	DWORD PTR _in$[ebp], 0
	je	$L528
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _in$[ebp]
	cmp	DWORD PTR _reload_in[eax*4], ecx
	je	$L529
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _reload_in[eax*4], 0
	je	$L528
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _reload_in[eax*4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L528
	mov	eax, DWORD PTR _in$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _reload_in[eax*4]
	push	eax
	call	_rtx_equal_p
	add	esp, 8
	or	eax, eax
	je	$L528
$L529:
	cmp	DWORD PTR _dont_share$[ebp], 0
	jne	$L528
	cmp	DWORD PTR _out$[ebp], 0
	je	$L527
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _reload_out[eax*4], 0
	je	$L527
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _out$[ebp]
	cmp	DWORD PTR _reload_out[eax*4], ecx
	je	$L527
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _reload_out[eax*4], 0
	je	$L530
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _reload_out[eax*4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L530
	mov	eax, DWORD PTR _out$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _reload_out[eax*4]
	push	eax
	call	_rtx_equal_p
	add	esp, 8
	or	eax, eax
	jne	$L527
$L530:
$L528:
	cmp	DWORD PTR _out$[ebp], 0
	je	$L526
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _out$[ebp]
	cmp	DWORD PTR _reload_out[eax*4], ecx
	je	$L531
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _reload_out[eax*4], 0
	je	$L526
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _reload_out[eax*4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L526
	mov	eax, DWORD PTR _out$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _reload_out[eax*4]
	push	eax
	call	_rtx_equal_p
	add	esp, 8
	or	eax, eax
	je	$L526
$L531:
	cmp	DWORD PTR _in$[ebp], 0
	je	$L532
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _reload_in[eax*4], 0
	je	$L532
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _in$[ebp]
	cmp	DWORD PTR _reload_in[eax*4], ecx
	je	$L533
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _reload_in[eax*4], 0
	je	$L526
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _reload_in[eax*4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L526
	mov	eax, DWORD PTR _in$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _reload_in[eax*4]
	push	eax
	call	_rtx_equal_p
	add	esp, 8
	or	eax, eax
	je	$L526
$L533:
$L532:
$L527:
; Line 355
	jmp	$L525
; Line 362
$L526:
	jmp	$L524
$L525:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _n_reloads, eax
	jne	$L534
; Line 363
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L535
$L536:
	inc	DWORD PTR _i$[ebp]
$L535:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _n_reloads, eax
	jle	$L537
; Line 379
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _class$[ebp]
	cmp	DWORD PTR _reload_reg_class[eax*4], ecx
	jne	$L538
	mov	eax, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR _reload_strict_low[eax]
	cmp	eax, DWORD PTR _strict_low$[ebp]
	jne	$L538
	cmp	DWORD PTR _out$[ebp], 0
	jne	$L538
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _reload_out[eax*4], 0
	jne	$L538
	mov	eax, DWORD PTR _in$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L540
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _reload_in[eax*4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 4325376				; 00420000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L541
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _reload_in[eax*4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 4259840				; 00410000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L541
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _reload_in[eax*4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 4194304				; 00400000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L541
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _reload_in[eax*4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 4128768				; 003f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L540
$L541:
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _reload_in[eax*4]
	mov	ecx, DWORD PTR _in$[ebp]
	cmp	DWORD PTR [eax+4], ecx
	je	$L539
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _reload_in[eax*4]
	cmp	DWORD PTR [eax+4], 0
	je	$L542
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _reload_in[eax*4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L542
	mov	eax, DWORD PTR _in$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _reload_in[eax*4]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_rtx_equal_p
	add	esp, 8
	or	eax, eax
	jne	$L539
$L542:
$L540:
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _reload_in[eax*4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L538
	mov	eax, DWORD PTR _in$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 4325376				; 00420000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L543
	mov	eax, DWORD PTR _in$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 4259840				; 00410000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L543
	mov	eax, DWORD PTR _in$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 4194304				; 00400000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L543
	mov	eax, DWORD PTR _in$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 4128768				; 003f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L538
$L543:
	mov	eax, DWORD PTR _in$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reload_in[ecx*4]
	cmp	DWORD PTR [eax+4], ecx
	je	$L544
	mov	eax, DWORD PTR _in$[ebp]
	cmp	DWORD PTR [eax+4], 0
	je	$L538
	mov	eax, DWORD PTR _in$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L538
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _reload_in[eax*4]
	push	eax
	mov	eax, DWORD PTR _in$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_rtx_equal_p
	add	esp, 8
	or	eax, eax
	je	$L538
$L544:
$L539:
; Line 383
	mov	eax, DWORD PTR _in$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L545
; Line 384
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _reload_in[eax*4]
	mov	DWORD PTR _in$[ebp], eax
; Line 385
$L545:
	jmp	$L537
; Line 388
$L538:
	jmp	$L536
$L537:
$L534:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _n_reloads, eax
	jne	$L546
; Line 393
	mov	eax, DWORD PTR _in$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	DWORD PTR _reload_in[ecx*4], eax
; Line 394
	mov	eax, DWORD PTR _out$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	DWORD PTR _reload_out[ecx*4], eax
; Line 395
	mov	eax, DWORD PTR _class$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	DWORD PTR _reload_reg_class[ecx*4], eax
; Line 396
	mov	eax, DWORD PTR _inmode$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	DWORD PTR _reload_inmode[ecx*4], eax
; Line 397
	mov	eax, DWORD PTR _outmode$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	DWORD PTR _reload_outmode[ecx*4], eax
; Line 398
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _reload_reg_rtx[eax*4], 0
; Line 399
	mov	al, BYTE PTR _optional$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	BYTE PTR _reload_optional[ecx], al
; Line 400
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _reload_inc[eax*4], 0
; Line 401
	mov	al, BYTE PTR _strict_low$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	BYTE PTR _reload_strict_low[ecx], al
; Line 402
	mov	eax, DWORD PTR _i$[ebp]
	mov	BYTE PTR _reload_nocombine[eax], 0
; Line 403
	mov	eax, DWORD PTR _inloc$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	DWORD PTR _reload_in_reg[ecx*4], eax
; Line 404
	mov	eax, DWORD PTR _needed_for$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	DWORD PTR _reload_needed_for[ecx*4], eax
; Line 405
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _reload_needed_for_multiple[eax*4], 0
; Line 407
	inc	DWORD PTR _n_reloads
; Line 409
	jmp	$L547
$L546:
; Line 416
	cmp	DWORD PTR _inmode$[ebp], 0
	je	$L548
; Line 417
	mov	eax, DWORD PTR _inmode$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	DWORD PTR _reload_inmode[ecx*4], eax
; Line 418
$L548:
	cmp	DWORD PTR _outmode$[ebp], 0
	je	$L549
; Line 419
	mov	eax, DWORD PTR _outmode$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	DWORD PTR _reload_outmode[ecx*4], eax
; Line 420
$L549:
	cmp	DWORD PTR _in$[ebp], 0
	je	$L550
; Line 421
	mov	eax, DWORD PTR _in$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	DWORD PTR _reload_in[ecx*4], eax
; Line 422
$L550:
	cmp	DWORD PTR _out$[ebp], 0
	je	$L551
; Line 423
	mov	eax, DWORD PTR _out$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	DWORD PTR _reload_out[ecx*4], eax
; Line 424
$L551:
	mov	eax, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR _reload_optional[eax]
	and	eax, DWORD PTR _optional$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	BYTE PTR _reload_optional[ecx], al
; Line 425
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _needed_for$[ebp]
	cmp	DWORD PTR _reload_needed_for[eax*4], ecx
	je	$L552
; Line 426
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _reload_needed_for_multiple[eax*4], 1
; Line 427
$L552:
$L547:
; Line 433
	cmp	DWORD PTR _in$[ebp], 0
	je	$L553
	mov	eax, DWORD PTR _inloc$[ebp]
	mov	ecx, DWORD PTR _in$[ebp]
	cmp	DWORD PTR [eax], ecx
	je	$L553
; Line 434
	mov	eax, DWORD PTR _i$[ebp]
	mov	BYTE PTR _reload_nocombine[eax], 1
; Line 462
$L553:
	cmp	DWORD PTR _replace_reloads$S466, 0
	je	$L554
; Line 464
	cmp	DWORD PTR _inloc$[ebp], 0
	je	$L555
; Line 466
	mov	eax, DWORD PTR _n_replacements$S469
	lea	eax, DWORD PTR [eax+eax*2]
	lea	eax, DWORD PTR _replacements$S468[eax*4]
	mov	DWORD PTR _r$556[ebp], eax
	inc	DWORD PTR _n_replacements$S469
; Line 467
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _r$556[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 468
	mov	eax, DWORD PTR _inloc$[ebp]
	mov	ecx, DWORD PTR _r$556[ebp]
	mov	DWORD PTR [ecx], eax
; Line 469
	mov	eax, DWORD PTR _inmode$[ebp]
	mov	ecx, DWORD PTR _r$556[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 471
$L555:
	cmp	DWORD PTR _outloc$[ebp], 0
	je	$L557
	mov	eax, DWORD PTR _inloc$[ebp]
	cmp	DWORD PTR _outloc$[ebp], eax
	je	$L557
; Line 473
	mov	eax, DWORD PTR _n_replacements$S469
	lea	eax, DWORD PTR [eax+eax*2]
	lea	eax, DWORD PTR _replacements$S468[eax*4]
	mov	DWORD PTR _r$558[ebp], eax
	inc	DWORD PTR _n_replacements$S469
; Line 474
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _r$558[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 475
	mov	eax, DWORD PTR _outloc$[ebp]
	mov	ecx, DWORD PTR _r$558[ebp]
	mov	DWORD PTR [ecx], eax
; Line 476
	mov	eax, DWORD PTR _outmode$[ebp]
	mov	ecx, DWORD PTR _r$558[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 478
$L557:
; Line 488
$L554:
	cmp	DWORD PTR _in$[ebp], 0
	je	$L559
	cmp	DWORD PTR _out$[ebp], 0
	je	$L559
	mov	eax, DWORD PTR _in$[ebp]
	cmp	DWORD PTR _out$[ebp], eax
	je	$L559
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _reload_reg_rtx[eax*4], 0
	jne	$L559
; Line 491
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _reload_reg_class[eax*4]
	push	eax
	mov	eax, DWORD PTR _outloc$[ebp]
	push	eax
	mov	eax, DWORD PTR _inloc$[ebp]
	push	eax
	mov	eax, DWORD PTR _out$[ebp]
	push	eax
	mov	eax, DWORD PTR _in$[ebp]
	push	eax
	call	_find_dummy_reload
	add	esp, 24					; 00000018H
	mov	ecx, DWORD PTR _i$[ebp]
	mov	DWORD PTR _reload_reg_rtx[ecx*4], eax
; Line 500
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _out$[ebp]
	cmp	DWORD PTR _reload_reg_rtx[eax*4], ecx
	jne	$L560
	mov	eax, DWORD PTR _in$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L561
	mov	eax, DWORD PTR _in$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L562
	mov	eax, DWORD PTR _in$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L562
	mov	eax, DWORD PTR _in$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L562
	mov	eax, DWORD PTR _in$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L560
$L562:
$L561:
	mov	eax, DWORD PTR _inmode$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	eax, DWORD PTR _static_reload_reg_p$S475
	push	eax
	mov	eax, DWORD PTR _out$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	0
	mov	eax, DWORD PTR _this_insn$S472
	push	eax
	mov	eax, DWORD PTR _in$[ebp]
	push	eax
	call	_find_equiv_reg
	add	esp, 28					; 0000001cH
	or	eax, eax
	je	$L560
; Line 501
	mov	eax, DWORD PTR _out$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	DWORD PTR _reload_in[ecx*4], eax
; Line 502
$L560:
; Line 504
$L559:
	cmp	DWORD PTR _out$[ebp], 0
	je	$L563
; Line 505
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _output_reloadnum$S477, eax
; Line 507
$L563:
	mov	eax, DWORD PTR _i$[ebp]
	jmp	$L498
; Line 508
$L498:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_push_reload ENDP
_loc$ = 8
_reloadnum$ = 12
_mode$ = 16
_r$570 = -4
_push_replacement PROC NEAR
; Line 521
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 522
	cmp	DWORD PTR _replace_reloads$S466, 0
	je	$L569
; Line 524
	mov	eax, DWORD PTR _n_replacements$S469
	lea	eax, DWORD PTR [eax+eax*2]
	lea	eax, DWORD PTR _replacements$S468[eax*4]
	mov	DWORD PTR _r$570[ebp], eax
	inc	DWORD PTR _n_replacements$S469
; Line 525
	mov	eax, DWORD PTR _reloadnum$[ebp]
	mov	ecx, DWORD PTR _r$570[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 526
	mov	eax, DWORD PTR _loc$[ebp]
	mov	ecx, DWORD PTR _r$570[ebp]
	mov	DWORD PTR [ecx], eax
; Line 527
	mov	eax, DWORD PTR _mode$[ebp]
	mov	ecx, DWORD PTR _r$570[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 529
$L569:
$L568:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_push_replacement ENDP
_j$587 = -12
_i$ = -4
_output_reload$ = -8
_combine_reloads PROC NEAR
; Line 541
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 543
	mov	DWORD PTR _output_reload$[ebp], -1
; Line 548
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L575
$L576:
	inc	DWORD PTR _i$[ebp]
$L575:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _n_reloads, eax
	jle	$L577
; Line 549
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _reload_out[eax*4], 0
	je	$L578
; Line 551
	cmp	DWORD PTR _output_reload$[ebp], 0
	jl	$L579
; Line 552
	jmp	$L572
; Line 553
$L579:
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _output_reload$[ebp], eax
; Line 556
$L578:
	jmp	$L576
$L577:
	cmp	DWORD PTR _output_reload$[ebp], 0
	jl	$L581
	mov	eax, DWORD PTR _output_reload$[ebp]
	movsx	eax, BYTE PTR _reload_optional[eax]
	or	eax, eax
	je	$L580
$L581:
; Line 557
	jmp	$L572
; Line 561
$L580:
	mov	eax, DWORD PTR _output_reload$[ebp]
	cmp	DWORD PTR _reload_in[eax*4], 0
	je	$L582
; Line 562
	jmp	$L572
; Line 566
$L582:
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L583
$L584:
	inc	DWORD PTR _i$[ebp]
$L583:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _n_reloads, eax
	jle	$L585
; Line 575
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _reload_in[eax*4], 0
	je	$L586
	mov	eax, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR _reload_optional[eax]
	or	eax, eax
	jne	$L586
	mov	eax, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR _reload_nocombine[eax]
	or	eax, eax
	jne	$L586
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _reload_when_needed[eax*4], 1
	je	$L586
	mov	eax, DWORD PTR _output_reload$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reload_inmode[ecx*4]
	cmp	DWORD PTR _reload_outmode[eax*4], ecx
	jne	$L586
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _reload_inc[eax*4], 0
	jne	$L586
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _reload_reg_rtx[eax*4], 0
	jne	$L586
	mov	eax, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR _reload_strict_low[eax]
	or	eax, eax
	jne	$L586
	mov	eax, DWORD PTR _output_reload$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _reload_reg_class[ecx*4]
	cmp	DWORD PTR _reload_reg_class[eax*4], ecx
	jne	$L586
	mov	eax, DWORD PTR _output_reload$[ebp]
	mov	eax, DWORD PTR _reload_out[eax*4]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _reload_in[eax*4]
	push	eax
	call	_reg_overlap_mentioned_p
	add	esp, 8
	or	eax, eax
	jne	$L586
; Line 580
	mov	eax, DWORD PTR _output_reload$[ebp]
	mov	eax, DWORD PTR _reload_out[eax*4]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	DWORD PTR _reload_out[ecx*4], eax
; Line 581
	mov	eax, DWORD PTR _output_reload$[ebp]
	mov	eax, DWORD PTR _reload_outmode[eax*4]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	DWORD PTR _reload_outmode[ecx*4], eax
; Line 583
	mov	eax, DWORD PTR _output_reload$[ebp]
	mov	DWORD PTR _reload_out[eax*4], 0
; Line 585
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _reload_needed_for_multiple[eax*4], 1
; Line 586
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _reload_when_needed[eax*4], 3
; Line 589
	mov	DWORD PTR _j$587[ebp], 0
	jmp	$L588
$L589:
	inc	DWORD PTR _j$587[ebp]
$L588:
	mov	eax, DWORD PTR _j$587[ebp]
	cmp	DWORD PTR _n_replacements$S469, eax
	jle	$L590
; Line 590
	mov	eax, DWORD PTR _j$587[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	mov	ecx, DWORD PTR _output_reload$[ebp]
	cmp	DWORD PTR _replacements$S468[eax*4+4], ecx
	jne	$L591
; Line 591
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _j$587[ebp]
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	DWORD PTR _replacements$S468[ecx*4+4], eax
; Line 593
$L591:
	jmp	$L589
$L590:
	jmp	$L572
; Line 595
$L586:
	jmp	$L584
$L585:
$L572:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_combine_reloads ENDP
_TEXT	ENDS
EXTRN	_const0_rtx:DWORD
EXTRN	_fixed_regs:TBYTE
EXTRN	_find_reg_note:NEAR
EXTRN	_reg_class_contents:BYTE
EXTRN	_refers_to_regno_p:NEAR
EXTRN	_find_regno_note:NEAR
_BSS	SEGMENT
_hard_regs_live_known$S474 DD 01H DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
_in$ = 8
_out$ = 12
_inloc$ = 16
_outloc$ = 20
_class$ = 24
_for_real$ = 28
_value$ = -4
_orig_in$ = -8
_regno$610 = -12
_regno$619 = -16
_find_dummy_reload PROC NEAR
; Line 618
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	push	ebx
	push	esi
	push	edi
; Line 619
	mov	DWORD PTR _value$[ebp], 0
; Line 620
	mov	eax, DWORD PTR _in$[ebp]
	mov	DWORD PTR _orig_in$[ebp], eax
; Line 622
$L602:
	mov	eax, DWORD PTR _out$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L603
; Line 623
	mov	eax, DWORD PTR _out$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _out$[ebp], eax
	jmp	$L602
$L603:
; Line 624
$L605:
	mov	eax, DWORD PTR _in$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L606
; Line 625
	mov	eax, DWORD PTR _in$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _in$[ebp], eax
	jmp	$L605
$L606:
; Line 631
	mov	eax, DWORD PTR _out$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	ecx, DWORD PTR _in$[ebp]
	mov	ecx, DWORD PTR [ecx]
	shl	ecx, 8
	and	ecx, -16777216				; ff000000H
	sar	ecx, 22					; 00000016H
	mov	ecx, DWORD PTR _mode_size[ecx]
	cmp	DWORD PTR _mode_size[eax], ecx
	je	$L607
	mov	eax, DWORD PTR _out$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	cmp	DWORD PTR _mode_size[eax], 4
	jg	$L608
	mov	eax, DWORD PTR _in$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	cmp	DWORD PTR _mode_size[eax], 4
	jle	$L607
$L608:
; Line 632
	sub	eax, eax
	jmp	$L598
; Line 635
$L607:
	mov	eax, DWORD PTR _out$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L609
; Line 637
	mov	eax, DWORD PTR _out$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _regno$610[ebp], eax
; Line 648
	mov	eax, DWORD PTR _const0_rtx
	mov	ecx, DWORD PTR _inloc$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 650
	mov	eax, DWORD PTR _regno$610[ebp]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	or	eax, eax
	jl	$L611
; Line 651
	mov	eax, DWORD PTR _regno$610[ebp]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	DWORD PTR _regno$610[ebp], eax
; Line 652
$L611:
; Line 660
	cmp	DWORD PTR _regno$610[ebp], 10		; 0000000aH
	jge	$L613
	mov	eax, DWORD PTR _regno$610[ebp]
	movsx	eax, BYTE PTR _fixed_regs[eax]
	or	eax, eax
	je	$L614
	cmp	DWORD PTR _regno$610[ebp], 8
	jl	$L615
	cmp	DWORD PTR _regno$610[ebp], 10		; 0000000aH
	jl	$L613
$L615:
$L614:
	cmp	DWORD PTR _regno$610[ebp], 8
	jl	$L1529
	mov	DWORD PTR -20+[ebp], 1
	jmp	$L1530
$L1529:
	mov	eax, DWORD PTR _out$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	add	eax, 3
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	mov	DWORD PTR -20+[ebp], eax
$L1530:
	mov	eax, DWORD PTR _outloc$[ebp]
	push	eax
	mov	eax, DWORD PTR _this_insn$S472
	mov	eax, DWORD PTR [eax+16]
	push	eax
	mov	eax, DWORD PTR _regno$610[ebp]
	add	eax, DWORD PTR -20+[ebp]
	push	eax
	mov	eax, DWORD PTR _regno$610[ebp]
	push	eax
	call	_refers_to_regno_p
	add	esp, 16					; 00000010H
	or	eax, eax
	jne	$L613
	mov	eax, DWORD PTR _class$[ebp]
	movsx	eax, WORD PTR _reg_class_contents[eax*2]
	mov	edx, 1
	mov	cl, BYTE PTR _regno$610[ebp]
	shl	edx, cl
	test	eax, edx
	je	$L613
; Line 661
	mov	eax, DWORD PTR _out$[ebp]
	mov	DWORD PTR _value$[ebp], eax
; Line 663
$L613:
	mov	eax, DWORD PTR _orig_in$[ebp]
	mov	ecx, DWORD PTR _inloc$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 671
$L609:
; Line 675
	cmp	DWORD PTR _hard_regs_live_known$S474, 0
	je	$L617
	mov	eax, DWORD PTR _in$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L617
	mov	eax, DWORD PTR _in$[ebp]
	push	eax
	push	9
	mov	eax, DWORD PTR _this_insn$S472
	push	eax
	call	_find_reg_note
	add	esp, 12					; 0000000cH
	or	eax, eax
	jne	$L617
	cmp	DWORD PTR _value$[ebp], 0
	je	$L618
	mov	eax, DWORD PTR _value$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	1
	mov	eax, DWORD PTR _this_insn$S472
	push	eax
	call	_find_regno_note
	add	esp, 12					; 0000000cH
	or	eax, eax
	je	$L617
$L618:
; Line 677
	mov	eax, DWORD PTR _in$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _regno$619[ebp], eax
; Line 678
	mov	eax, DWORD PTR _regno$619[ebp]
	push	eax
	push	1
	mov	eax, DWORD PTR _this_insn$S472
	push	eax
	call	_find_regno_note
	add	esp, 12					; 0000000cH
	or	eax, eax
	je	$L620
; Line 680
	mov	eax, DWORD PTR _regno$619[ebp]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	or	eax, eax
	jl	$L621
; Line 681
	mov	eax, DWORD PTR _regno$619[ebp]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	DWORD PTR _regno$619[ebp], eax
; Line 682
$L621:
; Line 687
	cmp	DWORD PTR _regno$619[ebp], 10		; 0000000aH
	jge	$L622
	cmp	DWORD PTR _regno$619[ebp], 8
	jl	$L1531
	mov	DWORD PTR -24+[ebp], 1
	jmp	$L1532
$L1531:
	mov	eax, DWORD PTR _in$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	add	eax, 3
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	mov	DWORD PTR -24+[ebp], eax
$L1532:
	push	0
	mov	eax, DWORD PTR _out$[ebp]
	push	eax
	mov	eax, DWORD PTR _regno$619[ebp]
	add	eax, DWORD PTR -24+[ebp]
	push	eax
	mov	eax, DWORD PTR _regno$619[ebp]
	push	eax
	call	_refers_to_regno_p
	add	esp, 16					; 00000010H
	or	eax, eax
	jne	$L622
	mov	eax, DWORD PTR _this_insn$S472
	mov	eax, DWORD PTR [eax+16]
	push	eax
	mov	eax, DWORD PTR _regno$619[ebp]
	push	eax
	call	_hard_reg_set_here_p
	add	esp, 8
	or	eax, eax
	jne	$L622
	mov	eax, DWORD PTR _class$[ebp]
	movsx	eax, WORD PTR _reg_class_contents[eax*2]
	mov	edx, 1
	mov	cl, BYTE PTR _regno$619[ebp]
	shl	edx, cl
	test	eax, edx
	je	$L622
; Line 692
	cmp	DWORD PTR _for_real$[ebp], 0
	jl	$L623
	mov	eax, DWORD PTR _value$[ebp]
	cmp	DWORD PTR _out$[ebp], eax
	jne	$L623
; Line 693
	mov	eax, DWORD PTR _for_real$[ebp]
	mov	DWORD PTR _reload_out[eax*4], 0
; Line 694
$L623:
	mov	eax, DWORD PTR _in$[ebp]
	mov	DWORD PTR _value$[ebp], eax
; Line 696
$L622:
; Line 697
$L620:
; Line 699
$L617:
	mov	eax, DWORD PTR _value$[ebp]
	jmp	$L598
; Line 700
$L598:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_find_dummy_reload ENDP
_regno$ = 8
_x$ = 12
_op0$629 = -4
_r$634 = -8
_i$638 = -12
_hard_reg_set_here_p PROC NEAR
; Line 714
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 715
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L628
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1769472				; 001b0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L627
$L628:
; Line 717
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _op0$629[ebp], eax
; Line 718
$L631:
	mov	eax, DWORD PTR _op0$629[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L632
; Line 719
	mov	eax, DWORD PTR _op0$629[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _op0$629[ebp], eax
	jmp	$L631
$L632:
; Line 720
	mov	eax, DWORD PTR _op0$629[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L633
; Line 722
	mov	eax, DWORD PTR _op0$629[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _r$634[ebp], eax
; Line 724
	mov	eax, DWORD PTR _r$634[ebp]
	cmp	DWORD PTR _regno$[ebp], eax
	jl	$L635
	cmp	DWORD PTR _r$634[ebp], 8
	jl	$L1533
	mov	DWORD PTR -16+[ebp], 1
	jmp	$L1534
$L1533:
	mov	eax, DWORD PTR _op0$629[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	add	eax, 3
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	mov	DWORD PTR -16+[ebp], eax
$L1534:
	mov	eax, DWORD PTR _r$634[ebp]
	add	eax, DWORD PTR -16+[ebp]
	cmp	eax, DWORD PTR _regno$[ebp]
	jle	$L635
; Line 725
	mov	eax, 1
	jmp	$L626
; Line 726
$L635:
; Line 727
$L633:
; Line 728
	jmp	$L636
$L627:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1310720				; 00140000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L637
; Line 730
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	dec	eax
	mov	DWORD PTR _i$638[ebp], eax
; Line 731
	jmp	$L639
$L640:
	dec	DWORD PTR _i$638[ebp]
$L639:
	cmp	DWORD PTR _i$638[ebp], 0
	jl	$L641
; Line 732
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _i$638[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	push	eax
	mov	eax, DWORD PTR _regno$[ebp]
	push	eax
	call	_hard_reg_set_here_p
	add	esp, 8
	or	eax, eax
	je	$L642
; Line 733
	mov	eax, 1
	jmp	$L626
; Line 734
$L642:
	jmp	$L640
$L641:
; Line 736
$L637:
$L636:
	sub	eax, eax
	jmp	$L626
; Line 737
$L626:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_hard_reg_set_here_p ENDP
_TEXT	ENDS
PUBLIC	_strict_memory_address_p
_TEXT	SEGMENT
_addr$ = 12
_strict_memory_address_p PROC NEAR
; Line 747
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 748
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L648
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L648
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L648
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L647
$L648:
	jmp	$win$649
$L647:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L652
	mov	eax, DWORD PTR _addr$[ebp]
	cmp	DWORD PTR [eax+4], 7
	jl	$L651
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	cmp	eax, 7
	jb	$L651
$L652:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3080192				; 002f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L650
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L650
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jl	$L653
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	cmp	eax, 7
	jae	$L650
$L653:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L650
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 2
	je	$L654
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 4
	je	$L654
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 8
	jne	$L650
$L654:
$L651:
	jmp	$win$649
$L650:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L655
	mov	eax, DWORD PTR _addr$[ebp]
	cmp	DWORD PTR [eax+4], 7
	jle	$L656
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	cmp	eax, 7
	ja	$L655
$L656:
	jmp	$win$649
$L655:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L657
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L659
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jl	$L658
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	cmp	eax, 7
	jb	$L658
$L659:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3080192				; 002f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L657
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L657
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jl	$L660
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	cmp	eax, 7
	jae	$L657
$L660:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L657
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 2
	je	$L661
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 4
	je	$L661
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 8
	jne	$L657
$L661:
$L658:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L662
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 7
	jle	$L663
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	cmp	eax, 7
	ja	$L662
$L663:
	jmp	$win$649
$L662:
$L657:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L664
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L666
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 7
	jl	$L665
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	cmp	eax, 7
	jb	$L665
$L666:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3080192				; 002f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L664
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L664
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jl	$L667
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	cmp	eax, 7
	jae	$L664
$L667:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L664
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 2
	je	$L668
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 4
	je	$L668
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 8
	jne	$L664
$L668:
$L665:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L669
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jle	$L670
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	cmp	eax, 7
	ja	$L669
$L670:
	jmp	$win$649
$L669:
$L664:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L671
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L673
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L673
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L673
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L672
$L673:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L676
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jl	$L675
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	cmp	eax, 7
	jb	$L675
$L676:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3080192				; 002f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L674
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L674
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jl	$L677
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	cmp	eax, 7
	jae	$L674
$L677:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L674
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 2
	je	$L678
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 4
	je	$L678
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 8
	jne	$L674
$L678:
$L675:
	jmp	$win$649
$L674:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L679
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jle	$L680
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	cmp	eax, 7
	ja	$L679
$L680:
	jmp	$win$649
$L679:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L681
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L683
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jl	$L682
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	cmp	eax, 7
	jb	$L682
$L683:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3080192				; 002f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L681
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L681
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jl	$L684
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	cmp	eax, 7
	jae	$L681
$L684:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L681
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 2
	je	$L685
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 4
	je	$L685
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 8
	jne	$L681
$L685:
$L682:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L686
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 7
	jle	$L687
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	cmp	eax, 7
	ja	$L686
$L687:
	jmp	$win$649
$L686:
$L681:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L688
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L690
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 7
	jl	$L689
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	cmp	eax, 7
	jb	$L689
$L690:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3080192				; 002f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L688
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L688
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jl	$L691
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	cmp	eax, 7
	jae	$L688
$L691:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L688
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 2
	je	$L692
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 4
	je	$L692
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 8
	jne	$L688
$L692:
$L689:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L693
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jle	$L694
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	cmp	eax, 7
	ja	$L693
$L694:
	jmp	$win$649
$L693:
$L688:
$L672:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L696
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L696
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L696
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L695
$L696:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L699
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 7
	jl	$L698
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	cmp	eax, 7
	jb	$L698
$L699:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3080192				; 002f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L697
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L697
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jl	$L700
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	cmp	eax, 7
	jae	$L697
$L700:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L697
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 2
	je	$L701
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 4
	je	$L701
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 8
	jne	$L697
$L701:
$L698:
	jmp	$win$649
$L697:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L702
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 7
	jle	$L703
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	cmp	eax, 7
	ja	$L702
$L703:
	jmp	$win$649
$L702:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L704
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L706
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jl	$L705
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	cmp	eax, 7
	jb	$L705
$L706:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3080192				; 002f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L704
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L704
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jl	$L707
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	cmp	eax, 7
	jae	$L704
$L707:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L704
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 2
	je	$L708
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 4
	je	$L708
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 8
	jne	$L704
$L708:
$L705:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L709
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 7
	jle	$L710
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	cmp	eax, 7
	ja	$L709
$L710:
	jmp	$win$649
$L709:
$L704:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L711
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L713
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 7
	jl	$L712
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	cmp	eax, 7
	jb	$L712
$L713:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3080192				; 002f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L711
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L711
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jl	$L714
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	cmp	eax, 7
	jae	$L711
$L714:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L711
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 2
	je	$L715
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 4
	je	$L715
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 8
	jne	$L711
$L715:
$L712:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L716
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jle	$L717
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	cmp	eax, 7
	ja	$L716
$L717:
	jmp	$win$649
$L716:
$L711:
$L695:
$L671:
; Line 749
	sub	eax, eax
	jmp	$L646
; Line 751
$win$649:
; Line 752
	mov	eax, 1
	jmp	$L646
; Line 753
$L646:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_strict_memory_address_p ENDP
_TEXT	ENDS
PUBLIC	_operands_match_p
EXTRN	_rtx_length:BYTE
EXTRN	_rtx_format:BYTE
_TEXT	SEGMENT
_x$ = 8
_y$ = 12
_i$ = -8
_code$ = -12
_fmt$ = -16
_success_2$ = -4
_j$730 = -20
_val$749 = -24
_operands_match_p PROC NEAR
; Line 774
	push	ebp
	mov	ebp, esp
	sub	esp, 28					; 0000001cH
	push	ebx
	push	esi
	push	edi
; Line 776
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$[ebp], eax
; Line 780
	mov	eax, DWORD PTR _x$[ebp]
	cmp	DWORD PTR _y$[ebp], eax
	jne	$L726
; Line 781
	mov	eax, 1
	jmp	$L721
; Line 782
$L726:
; Line 784
	cmp	DWORD PTR _code$[ebp], 34		; 00000022H
	je	$L728
	cmp	DWORD PTR _code$[ebp], 35		; 00000023H
	jne	$L727
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L727
$L728:
	mov	eax, DWORD PTR _y$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L729
	mov	eax, DWORD PTR _y$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L727
	mov	eax, DWORD PTR _y$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L727
$L729:
; Line 788
	cmp	DWORD PTR _code$[ebp], 35		; 00000023H
	jne	$L731
; Line 790
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _i$[ebp], eax
; Line 791
	cmp	DWORD PTR _i$[ebp], 10			; 0000000aH
	jl	$L732
; Line 792
	jmp	$slow$733
; Line 793
$L732:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	DWORD PTR _i$[ebp], eax
; Line 795
	jmp	$L734
$L731:
; Line 796
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _i$[ebp], eax
$L734:
; Line 798
	mov	eax, DWORD PTR _y$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L735
; Line 800
	mov	eax, DWORD PTR _y$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _j$730[ebp], eax
; Line 801
	cmp	DWORD PTR _j$730[ebp], 10		; 0000000aH
	jl	$L736
; Line 802
	jmp	$slow$733
; Line 803
$L736:
	mov	eax, DWORD PTR _y$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	DWORD PTR _j$730[ebp], eax
; Line 805
	jmp	$L737
$L735:
; Line 806
	mov	eax, DWORD PTR _y$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _j$730[ebp], eax
$L737:
; Line 808
	mov	eax, DWORD PTR _j$730[ebp]
	sub	eax, DWORD PTR _i$[ebp]
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	jmp	$L721
; Line 815
$L727:
	cmp	DWORD PTR _code$[ebp], 65		; 00000041H
	je	$L739
	cmp	DWORD PTR _code$[ebp], 66		; 00000042H
	jne	$L738
$L739:
; Line 816
	mov	eax, DWORD PTR _y$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_operands_match_p
	add	esp, 8
	jmp	$L721
; Line 823
$L738:
	mov	eax, DWORD PTR _y$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 4128768				; 003f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L741
	mov	eax, DWORD PTR _y$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 4194304				; 00400000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L740
$L741:
; Line 824
	mov	eax, DWORD PTR _y$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_operands_match_p
	add	esp, 8
	cmp	eax, 1
	cmc
	sbb	eax, eax
	and	eax, 2
	jmp	$L721
; Line 826
$L740:
$slow$733:
; Line 830
	mov	eax, DWORD PTR _y$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	cmp	eax, DWORD PTR _code$[ebp]
	je	$L742
; Line 831
	sub	eax, eax
	jmp	$L721
; Line 832
$L742:
	cmp	DWORD PTR _code$[ebp], 38		; 00000026H
	jne	$L743
; Line 833
	mov	eax, DWORD PTR _y$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _x$[ebp]
	sub	eax, DWORD PTR [ecx+4]
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	jmp	$L721
; Line 834
$L743:
	cmp	DWORD PTR _code$[ebp], 39		; 00000027H
	jne	$L744
; Line 835
	mov	eax, DWORD PTR _y$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _x$[ebp]
	sub	eax, DWORD PTR [ecx+4]
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	jmp	$L721
; Line 839
$L744:
	mov	eax, DWORD PTR _y$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR [ecx]
	shl	ecx, 8
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L745
; Line 840
	sub	eax, eax
	jmp	$L721
; Line 845
$L745:
	mov	DWORD PTR _success_2$[ebp], 0
; Line 846
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_format[eax*4]
	mov	DWORD PTR _fmt$[ebp], eax
; Line 847
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_length[eax*4]
	dec	eax
	mov	DWORD PTR _i$[ebp], eax
	jmp	$L746
$L747:
	dec	DWORD PTR _i$[ebp]
$L746:
	cmp	DWORD PTR _i$[ebp], 0
	jl	$L748
; Line 850
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	mov	DWORD PTR -28+[ebp], eax
	jmp	$L750
; Line 852
$L754:
; Line 853
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _y$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	mov	ebx, DWORD PTR _x$[ebp]
	mov	edx, DWORD PTR [ebx+edx*4+4]
	cmp	DWORD PTR [ecx+eax*4+4], edx
	je	$L755
; Line 854
	sub	eax, eax
	jmp	$L721
; Line 855
$L755:
	jmp	$L751
; Line 857
$L756:
; Line 858
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _y$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	push	eax
	call	_operands_match_p
	add	esp, 8
	mov	DWORD PTR _val$749[ebp], eax
; Line 859
	cmp	DWORD PTR _val$749[ebp], 0
	jne	$L757
; Line 860
	sub	eax, eax
	jmp	$L721
; Line 863
$L757:
	cmp	DWORD PTR _val$749[ebp], 2
	jne	$L758
; Line 864
	mov	DWORD PTR _success_2$[ebp], 1
; Line 865
$L758:
	jmp	$L751
; Line 867
$L759:
; Line 868
	jmp	$L751
; Line 873
$L760:
; Line 874
	call	_abort
; Line 875
	jmp	$L751
$L750:
	cmp	DWORD PTR -28+[ebp], 48			; 00000030H
	je	$L751
	cmp	DWORD PTR -28+[ebp], 101		; 00000065H
	je	$L756
	cmp	DWORD PTR -28+[ebp], 105		; 00000069H
	je	$L754
	jmp	$L760
$L751:
; Line 876
	jmp	$L747
$L748:
; Line 877
	mov	eax, DWORD PTR _success_2$[ebp]
	inc	eax
	jmp	$L721
; Line 878
$L721:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_operands_match_p ENDP
_c$ = 8
_s$ = 12
_n$ = -4
_n_occurrences PROC NEAR
; Line 886
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 887
	mov	DWORD PTR _n$[ebp], 0
; Line 888
$L767:
	mov	eax, DWORD PTR _s$[ebp]
	movsx	eax, BYTE PTR [eax]
	or	eax, eax
	je	$L768
; Line 889
	mov	eax, DWORD PTR _s$[ebp]
	movsx	eax, BYTE PTR [eax]
	movsx	ecx, BYTE PTR _c$[ebp]
	sub	eax, ecx
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	add	DWORD PTR _n$[ebp], eax
	inc	DWORD PTR _s$[ebp]
	jmp	$L767
$L768:
; Line 890
	mov	eax, DWORD PTR _n$[ebp]
	jmp	$L764
; Line 891
$L764:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_n_occurrences ENDP
_TEXT	ENDS
EXTRN	_true_regnum:NEAR
_TEXT	SEGMENT
$T1538 = -60
_x$ = 12
$T1539 = -80
_val$ = -24
_all_const$ = -4
_base$776 = -36
_offset$777 = -32
_addr$778 = -28
$T1535 = 8
_decompose PROC NEAR
; Line 913
	push	ebp
	mov	ebp, esp
	sub	esp, 84					; 00000054H
	push	ebx
	push	esi
	push	edi
; Line 915
	mov	DWORD PTR _all_const$[ebp], 0
; Line 917
	mov	DWORD PTR _val$[ebp], 0
; Line 918
	mov	DWORD PTR _val$[ebp+4], 0
; Line 919
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L775
; Line 921
	mov	DWORD PTR _offset$777[ebp], 0
; Line 922
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _addr$778[ebp], eax
; Line 925
	mov	eax, DWORD PTR _addr$778[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 4128768				; 003f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L780
	mov	eax, DWORD PTR _addr$778[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 4194304				; 00400000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L780
	mov	eax, DWORD PTR _addr$778[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 4259840				; 00410000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L780
	mov	eax, DWORD PTR _addr$778[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 4325376				; 00420000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L779
$L780:
; Line 927
	mov	eax, DWORD PTR _addr$778[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _val$[ebp+8], eax
; Line 928
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	neg	eax
	mov	DWORD PTR _val$[ebp+12], eax
; Line 929
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	mov	DWORD PTR _val$[ebp+16], eax
; Line 930
	mov	eax, DWORD PTR _val$[ebp+8]
	mov	eax, DWORD PTR [eax+4]
	sub	eax, 7
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	mov	DWORD PTR _val$[ebp+4], eax
; Line 931
	lea	esi, DWORD PTR _val$[ebp]
	mov	edi, DWORD PTR $T1535[ebp]
	mov	ecx, 5
	rep	movsd
	mov	eax, DWORD PTR $T1535[ebp]
	jmp	$L772
; Line 934
$L779:
	mov	eax, DWORD PTR _addr$778[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L781
; Line 936
	mov	eax, DWORD PTR _addr$778[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _addr$778[ebp], eax
; Line 937
	mov	DWORD PTR _all_const$[ebp], 1
; Line 939
$L781:
	mov	eax, DWORD PTR _addr$778[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L782
; Line 941
	mov	eax, DWORD PTR _addr$778[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L784
	mov	eax, DWORD PTR _addr$778[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L784
	mov	eax, DWORD PTR _addr$778[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L784
	mov	eax, DWORD PTR _addr$778[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L783
$L784:
; Line 943
	mov	eax, DWORD PTR _addr$778[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _base$776[ebp], eax
; Line 944
	mov	eax, DWORD PTR _addr$778[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _offset$777[ebp], eax
; Line 946
	jmp	$L785
$L783:
	mov	eax, DWORD PTR _addr$778[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L787
	mov	eax, DWORD PTR _addr$778[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L787
	mov	eax, DWORD PTR _addr$778[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L787
	mov	eax, DWORD PTR _addr$778[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L786
$L787:
; Line 948
	mov	eax, DWORD PTR _addr$778[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _base$776[ebp], eax
; Line 949
	mov	eax, DWORD PTR _addr$778[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _offset$777[ebp], eax
; Line 951
$L786:
$L785:
; Line 953
$L782:
	cmp	DWORD PTR _offset$777[ebp], 0
	jne	$L788
; Line 955
	mov	eax, DWORD PTR _addr$778[ebp]
	mov	DWORD PTR _base$776[ebp], eax
; Line 956
	mov	eax, DWORD PTR _const0_rtx
	mov	DWORD PTR _offset$777[ebp], eax
; Line 958
$L788:
	mov	eax, DWORD PTR _offset$777[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L789
; Line 959
	mov	eax, DWORD PTR _offset$777[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _offset$777[ebp], eax
; Line 960
$L789:
	mov	eax, DWORD PTR _offset$777[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L790
; Line 962
	mov	eax, DWORD PTR _offset$777[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L791
; Line 964
	mov	eax, DWORD PTR _offset$777[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _base$776[ebp]
	push	eax
	mov	eax, DWORD PTR _base$776[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	44					; 0000002cH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	DWORD PTR _base$776[ebp], eax
; Line 965
	mov	eax, DWORD PTR _offset$777[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _offset$777[ebp], eax
; Line 967
	jmp	$L792
$L791:
	mov	eax, DWORD PTR _offset$777[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L793
; Line 969
	mov	eax, DWORD PTR _offset$777[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _base$776[ebp]
	push	eax
	mov	eax, DWORD PTR _base$776[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	44					; 0000002cH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	DWORD PTR _base$776[ebp], eax
; Line 970
	mov	eax, DWORD PTR _offset$777[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _offset$777[ebp], eax
; Line 972
	jmp	$L794
$L793:
; Line 974
	mov	eax, DWORD PTR _offset$777[ebp]
	push	eax
	mov	eax, DWORD PTR _base$776[ebp]
	push	eax
	mov	eax, DWORD PTR _base$776[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	44					; 0000002cH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	DWORD PTR _base$776[ebp], eax
; Line 975
	mov	eax, DWORD PTR _const0_rtx
	mov	DWORD PTR _offset$777[ebp], eax
; Line 976
$L794:
$L792:
; Line 978
	jmp	$L795
$L790:
	mov	eax, DWORD PTR _offset$777[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L796
; Line 980
	mov	eax, DWORD PTR _offset$777[ebp]
	push	eax
	mov	eax, DWORD PTR _base$776[ebp]
	push	eax
	mov	eax, DWORD PTR _base$776[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	44					; 0000002cH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	DWORD PTR _base$776[ebp], eax
; Line 981
	mov	eax, DWORD PTR _const0_rtx
	mov	DWORD PTR _offset$777[ebp], eax
; Line 984
$L796:
$L795:
	cmp	DWORD PTR _all_const$[ebp], 0
	je	$L797
	mov	eax, DWORD PTR _base$776[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L797
; Line 985
	mov	eax, DWORD PTR _base$776[ebp]
	push	eax
	mov	eax, DWORD PTR _base$776[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	32					; 00000020H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _base$776[ebp], eax
; Line 987
$L797:
	mov	eax, DWORD PTR _offset$777[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L798
; Line 988
	call	_abort
; Line 990
$L798:
	mov	eax, DWORD PTR _offset$777[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _val$[ebp+12], eax
; Line 991
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	add	eax, DWORD PTR _val$[ebp+12]
	mov	DWORD PTR _val$[ebp+16], eax
; Line 992
	mov	eax, DWORD PTR _base$776[ebp]
	mov	DWORD PTR _val$[ebp+8], eax
; Line 993
	lea	esi, DWORD PTR _val$[ebp]
	mov	edi, DWORD PTR $T1535[ebp]
	mov	ecx, 5
	rep	movsd
	mov	eax, DWORD PTR $T1535[ebp]
	jmp	$L772
; Line 995
	jmp	$L799
$L775:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L800
; Line 997
	mov	DWORD PTR _val$[ebp], 1
; Line 998
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_true_regnum
	add	esp, 4
	mov	DWORD PTR _val$[ebp+12], eax
; Line 999
	cmp	DWORD PTR _val$[ebp+12], 0
	jge	$L802
; Line 1002
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _val$[ebp+12], eax
; Line 1003
	mov	eax, DWORD PTR _val$[ebp+12]
	inc	eax
	mov	DWORD PTR _val$[ebp+16], eax
; Line 1005
	jmp	$L803
$L802:
; Line 1007
	cmp	DWORD PTR _val$[ebp+12], 8
	jl	$L1536
	mov	DWORD PTR -40+[ebp], 1
	jmp	$L1537
$L1536:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	add	eax, 3
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	mov	DWORD PTR -40+[ebp], eax
$L1537:
	mov	eax, DWORD PTR _val$[ebp+12]
	add	eax, DWORD PTR -40+[ebp]
	mov	DWORD PTR _val$[ebp+16], eax
$L803:
; Line 1009
	jmp	$L804
$L800:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L805
; Line 1011
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L806
; Line 1013
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	lea	eax, DWORD PTR $T1538[ebp]
	push	eax
	call	_decompose
	add	esp, 8
	mov	edi, DWORD PTR $T1535[ebp]
	mov	esi, eax
	mov	ecx, 5
	rep	movsd
	mov	eax, DWORD PTR $T1535[ebp]
	jmp	$L772
; Line 1014
$L806:
	mov	DWORD PTR _val$[ebp], 1
; Line 1015
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_true_regnum
	add	esp, 4
	mov	DWORD PTR _val$[ebp+12], eax
; Line 1016
	cmp	DWORD PTR _val$[ebp+12], 0
	jge	$L807
; Line 1017
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	lea	eax, DWORD PTR $T1539[ebp]
	push	eax
	call	_decompose
	add	esp, 8
	mov	edi, DWORD PTR $T1535[ebp]
	mov	esi, eax
	mov	ecx, 5
	rep	movsd
	mov	eax, DWORD PTR $T1535[ebp]
	jmp	$L772
; Line 1018
	jmp	$L808
$L807:
; Line 1020
	cmp	DWORD PTR _val$[ebp+12], 8
	jl	$L1540
	mov	DWORD PTR -84+[ebp], 1
	jmp	$L1541
$L1540:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	add	eax, 3
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	mov	DWORD PTR -84+[ebp], eax
$L1541:
	mov	eax, DWORD PTR _val$[ebp+12]
	add	eax, DWORD PTR -84+[ebp]
	mov	DWORD PTR _val$[ebp+16], eax
$L808:
; Line 1022
	jmp	$L809
$L805:
; Line 1023
	call	_abort
$L809:
$L804:
$L799:
; Line 1024
	lea	esi, DWORD PTR _val$[ebp]
	mov	edi, DWORD PTR $T1535[ebp]
	mov	ecx, 5
	rep	movsd
	mov	eax, DWORD PTR $T1535[ebp]
	jmp	$L772
; Line 1025
$L772:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_decompose ENDP
_TEXT	ENDS
EXTRN	_stack_pointer_rtx:DWORD
EXTRN	_frame_pointer_rtx:DWORD
_TEXT	SEGMENT
$T1542 = -40
_x$ = 8
_y$ = 12
_ydata$ = 16
_xdata$ = -20
_immune_p PROC NEAR
; Line 1034
	push	ebp
	mov	ebp, esp
	sub	esp, 40					; 00000028H
	push	ebx
	push	esi
	push	edi
; Line 1037
	cmp	DWORD PTR _ydata$[ebp], 0
	je	$L816
; Line 1038
	push	0
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	mov	eax, DWORD PTR _ydata$[ebp+16]
	push	eax
	mov	eax, DWORD PTR _ydata$[ebp+12]
	push	eax
	call	_refers_to_regno_p
	add	esp, 16					; 00000010H
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	jmp	$L814
; Line 1039
$L816:
	cmp	DWORD PTR _ydata$[ebp+4], 0
	je	$L817
; Line 1040
	mov	eax, 1
	jmp	$L814
; Line 1042
$L817:
	mov	eax, DWORD PTR _y$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L818
; Line 1043
	call	_abort
; Line 1045
$L818:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L819
; Line 1046
	mov	eax, 1
	jmp	$L814
; Line 1048
$L819:
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	lea	eax, DWORD PTR $T1542[ebp]
	push	eax
	call	_decompose
	add	esp, 8
	lea	edi, DWORD PTR _xdata$[ebp]
	mov	esi, eax
	mov	ecx, 5
	rep	movsd
; Line 1050
	mov	eax, DWORD PTR _ydata$[ebp+8]
	push	eax
	mov	eax, DWORD PTR _xdata$[ebp+8]
	push	eax
	call	_rtx_equal_p
	add	esp, 8
	or	eax, eax
	jne	$L820
; Line 1053
	mov	eax, DWORD PTR _xdata$[ebp+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L822
	mov	eax, DWORD PTR _xdata$[ebp+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L822
	mov	eax, DWORD PTR _xdata$[ebp+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L822
	mov	eax, DWORD PTR _xdata$[ebp+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L821
$L822:
	mov	eax, DWORD PTR _ydata$[ebp+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L823
	mov	eax, DWORD PTR _ydata$[ebp+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L823
	mov	eax, DWORD PTR _ydata$[ebp+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L823
	mov	eax, DWORD PTR _ydata$[ebp+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L821
$L823:
; Line 1054
	mov	eax, 1
	jmp	$L814
; Line 1056
$L821:
; Line 1058
	mov	eax, DWORD PTR _xdata$[ebp+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L825
	mov	eax, DWORD PTR _xdata$[ebp+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L825
	mov	eax, DWORD PTR _xdata$[ebp+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L825
	mov	eax, DWORD PTR _xdata$[ebp+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L824
$L825:
	mov	eax, DWORD PTR _frame_pointer_rtx
	cmp	DWORD PTR _ydata$[ebp+8], eax
	je	$L826
	mov	eax, DWORD PTR _stack_pointer_rtx
	cmp	DWORD PTR _ydata$[ebp+8], eax
	jne	$L824
$L826:
; Line 1059
	mov	eax, 1
	jmp	$L814
; Line 1060
$L824:
; Line 1062
	mov	eax, DWORD PTR _ydata$[ebp+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L828
	mov	eax, DWORD PTR _ydata$[ebp+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L828
	mov	eax, DWORD PTR _ydata$[ebp+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L828
	mov	eax, DWORD PTR _ydata$[ebp+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L827
$L828:
	mov	eax, DWORD PTR _frame_pointer_rtx
	cmp	DWORD PTR _xdata$[ebp+8], eax
	je	$L829
	mov	eax, DWORD PTR _stack_pointer_rtx
	cmp	DWORD PTR _xdata$[ebp+8], eax
	jne	$L827
$L829:
; Line 1063
	mov	eax, 1
	jmp	$L814
; Line 1065
$L827:
	sub	eax, eax
	jmp	$L814
; Line 1069
$L820:
	mov	eax, DWORD PTR _ydata$[ebp+16]
	cmp	DWORD PTR _xdata$[ebp+12], eax
	jge	$L1545
	mov	eax, DWORD PTR _xdata$[ebp+16]
	cmp	DWORD PTR _ydata$[ebp+12], eax
	jl	$L1543
$L1545:
	mov	eax, 1
	jmp	$L1544
$L1543:
	sub	eax, eax
$L1544:
	jmp	$L814
; Line 1070
$L814:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_immune_p ENDP
_TEXT	ENDS
PUBLIC	_find_reloads
EXTRN	_reg_fits_class_p:NEAR
EXTRN	_asm_noperands:NEAR
EXTRN	_decode_asm_operands:NEAR
EXTRN	_recog_memoized:NEAR
EXTRN	_insn_extract:NEAR
EXTRN	_recog_operand:BYTE
EXTRN	_recog_operand_loc:BYTE
EXTRN	_recog_dup_loc:BYTE
EXTRN	_recog_dup_num:BYTE
EXTRN	_reg_class_size:BYTE
EXTRN	_insn_n_operands:BYTE
EXTRN	_reg_class_subunion:BYTE
EXTRN	_insn_n_dups:BYTE
EXTRN	_insn_n_alternatives:BYTE
EXTRN	_insn_operand_constraint:BYTE
EXTRN	_offsettable_memref_p:NEAR
EXTRN	_insn_operand_mode:BYTE
EXTRN	_insn_operand_strict_low:BYTE
EXTRN	_target_flags:DWORD
EXTRN	_optimize:DWORD
EXTRN	_force_const_double_mem:NEAR
EXTRN	_force_const_mem:NEAR
EXTRN	_standard_80387_constant_p:NEAR
EXTRN	_memcpy:NEAR
EXTRN	_error_for_asm:NEAR
EXTRN	_reg_equiv_address:DWORD
_BSS	SEGMENT
_n_memlocs$S471 DD 01H DUP (?)
_indirect_ok$S473 DD 01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG890	DB	'operand constraints differ in number of alternatives', 00H
	ORG $+3
$SG1070	DB	'inconsistent operand constraints in an `asm''', 00H
	ORG $+3
$SG1107	DB	'inconsistent operand constraints in an `asm''', 00H
_DATA	ENDS
_TEXT	SEGMENT
_ind_ok$ = 16
_mode$1089 = -600
_live_known$ = 20
_reload_reg_p$ = 24
_p$900 = -496
_c$901 = -492
_insn_code_number$ = -64
_i$ = -128
_noperands$ = -332
_constraints1$ = -272
_constraints$ = -360
_early_data$1038 = -588
_address_reloaded$ = -400
_j$1039 = -592
_other$911 = -500
_n_alternatives$ = -488
_value$976 = -568
_this_alternative$ = -124
_this_alternative_win$ = -372
_other$914 = -504
_this_alternative_offmemok$ = -96
_this_alternative_earlyclobber$ = -72
_this_alternative_matches$ = -188
_swapped$ = -88
_operand$1110 = -604
_code$918 = -508
_goal_alternative$ = -60
_this_alternative_number$ = -244
_goal_alternative_number$ = -84
_operand_reloadnum$ = -32
_goal_alternative_matches$ = -328
_goal_alternative_matched$ = -160
_goal_alternative_win$ = -80
_goal_alternative_offmemok$ = -476
_goal_alternative_earlyclobber$ = -440
_regno$927 = -512
_goal_alternative_swapped$ = -484
_modified$ = -468
_best$ = -432
_commutative$ = -132
_operands_match$ = -240
_substed_operand$ = -428
_body$ = -480
_losers$934 = -524
_goal_earlyclobber$ = -364
_bad$935 = -520
_this_earlyclobber$ = -4
_opno$1128 = -608
_reject$936 = -516
_operand_mode$ = -300
_p$940 = -556
_win$941 = -560
$T1582 = -668
_j$1134 = -620
_badop$942 = -564
_output_address$1135 = -616
_winreg$943 = -552
_input_address$1136 = -624
_c$944 = -548
_operand_address$1137 = -612
_operand$945 = -544
_offset$946 = -540
_force_reload$947 = -532
_offmemok$948 = -536
_earlyclobber$949 = -528
_tem$1079 = -596
_insn$ = 8
_replace$ = 12
_find_reloads PROC NEAR
; Line 1094
	push	ebp
	mov	ebp, esp
	sub	esp, 744				; 000002e8H
	push	ebx
	push	esi
	push	edi
; Line 1131
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _body$[ebp], eax
; Line 1135
	mov	eax, DWORD PTR _insn$[ebp]
	mov	DWORD PTR _this_insn$S472, eax
; Line 1136
	mov	DWORD PTR _n_reloads, 0
; Line 1137
	mov	DWORD PTR _n_replacements$S469, 0
; Line 1138
	mov	DWORD PTR _n_memlocs$S471, 0
; Line 1139
	mov	DWORD PTR _n_earlyclobbers, 0
; Line 1140
	mov	eax, DWORD PTR _replace$[ebp]
	mov	DWORD PTR _replace_reloads$S466, eax
; Line 1141
	mov	eax, DWORD PTR _ind_ok$[ebp]
	mov	DWORD PTR _indirect_ok$S473, eax
; Line 1142
	mov	eax, DWORD PTR _live_known$[ebp]
	mov	DWORD PTR _hard_regs_live_known$S474, eax
; Line 1143
	mov	eax, DWORD PTR _reload_reg_p$[ebp]
	mov	DWORD PTR _static_reload_reg_p$S475, eax
; Line 1153
	mov	eax, DWORD PTR _body$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR -740+[ebp], eax
	jmp	$L873
; Line 1155
$L877:
; Line 1160
	jmp	$L835
; Line 1162
$L878:
; Line 1167
	mov	eax, DWORD PTR _body$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L879
	mov	eax, DWORD PTR _body$[ebp]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jge	$L879
	mov	eax, DWORD PTR _body$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L879
	mov	eax, DWORD PTR _body$[ebp]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jge	$L879
; Line 1168
	jmp	$L835
; Line 1169
$L879:
$L880:
; Line 1171
	mov	eax, DWORD PTR _body$[ebp]
	push	eax
	call	_asm_noperands
	add	esp, 4
	mov	DWORD PTR _noperands$[ebp], eax
; Line 1172
	cmp	DWORD PTR _noperands$[ebp], 0
	jl	$L881
; Line 1176
	mov	DWORD PTR _insn_code_number$[ebp], -1
; Line 1179
	cmp	DWORD PTR _noperands$[ebp], 7
	jle	$L882
; Line 1180
	call	_abort
; Line 1184
$L882:
; Line 1185
	lea	eax, DWORD PTR _operand_mode$[ebp]
	push	eax
	lea	eax, DWORD PTR _constraints$[ebp]
	push	eax
	push	OFFSET _recog_operand_loc
	push	OFFSET _recog_operand
	mov	eax, DWORD PTR _body$[ebp]
	push	eax
	call	_decode_asm_operands
	add	esp, 20					; 00000014H
; Line 1186
	cmp	DWORD PTR _noperands$[ebp], 0
	jle	$L883
; Line 1188
	mov	eax, DWORD PTR _noperands$[ebp]
	shl	eax, 2
	push	eax
	lea	eax, DWORD PTR _constraints$[ebp]
	push	eax
	lea	eax, DWORD PTR _constraints1$[ebp]
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
; Line 1189
	mov	eax, DWORD PTR _constraints$[ebp]
	push	eax
	push	44					; 0000002cH
	call	_n_occurrences
	add	esp, 8
	inc	eax
	mov	DWORD PTR _n_alternatives$[ebp], eax
; Line 1190
	mov	DWORD PTR _i$[ebp], 1
	jmp	$L885
$L886:
	inc	DWORD PTR _i$[ebp]
$L885:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _noperands$[ebp], eax
	jle	$L887
; Line 1191
	mov	eax, DWORD PTR _constraints$[ebp]
	push	eax
	push	44					; 0000002cH
	call	_n_occurrences
	add	esp, 8
	inc	eax
	cmp	eax, DWORD PTR _n_alternatives$[ebp]
	je	$L888
; Line 1193
	push	OFFSET $SG890
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_error_for_asm
	add	esp, 8
; Line 1195
	mov	eax, DWORD PTR _const0_rtx
	push	eax
	push	0
	push	26					; 0000001aH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 1196
	mov	DWORD PTR _n_reloads, 0
; Line 1197
	jmp	$L835
; Line 1199
$L888:
	jmp	$L886
$L887:
; Line 1200
$L883:
	jmp	$L874
; Line 1203
$L881:
$L891:
; Line 1207
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_recog_memoized
	add	esp, 4
	mov	DWORD PTR _insn_code_number$[ebp], eax
; Line 1208
	mov	eax, DWORD PTR _insn_code_number$[ebp]
	mov	eax, DWORD PTR _insn_n_operands[eax*4]
	mov	DWORD PTR _noperands$[ebp], eax
; Line 1209
	mov	eax, DWORD PTR _insn_code_number$[ebp]
	mov	eax, DWORD PTR _insn_n_alternatives[eax*4]
	mov	DWORD PTR _n_alternatives$[ebp], eax
; Line 1211
	cmp	DWORD PTR _n_alternatives$[ebp], 0
	jne	$L892
; Line 1212
	jmp	$L835
; Line 1213
$L892:
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_insn_extract
	add	esp, 4
; Line 1214
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L893
$L894:
	inc	DWORD PTR _i$[ebp]
$L893:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _noperands$[ebp], eax
	jle	$L895
; Line 1217
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _insn_code_number$[ebp]
	mov	edx, ecx
	shl	ecx, 3
	sub	ecx, edx
	shl	ecx, 2
	mov	eax, DWORD PTR _insn_operand_constraint[ecx+eax*4]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	DWORD PTR _constraints1$[ebp+ecx*4], eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _constraints1$[ebp+eax*4]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	DWORD PTR _constraints$[ebp+ecx*4], eax
; Line 1218
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _insn_code_number$[ebp]
	mov	edx, ecx
	shl	ecx, 3
	sub	ecx, edx
	shl	ecx, 2
	mov	eax, DWORD PTR _insn_operand_mode[ecx+eax*4]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	DWORD PTR _operand_mode$[ebp+ecx*4], eax
; Line 1219
	jmp	$L894
$L895:
; Line 1220
	jmp	$L874
$L873:
	sub	DWORD PTR -740+[ebp], 20		; 00000014H
	cmp	DWORD PTR -740+[ebp], 7
	ja	$L891
	shl	DWORD PTR -740+[ebp], 2
	mov	eax, DWORD PTR -740+[ebp]
	jmp	DWORD PTR $L1629[eax]
$L1629:
	DD	OFFSET $L880
	DD	OFFSET $L877
	DD	OFFSET $L880
	DD	OFFSET $L877
	DD	OFFSET $L877
	DD	OFFSET $L878
	DD	OFFSET $L877
	DD	OFFSET $L877
$L874:
; Line 1222
	cmp	DWORD PTR _noperands$[ebp], 0
	jne	$L896
; Line 1223
	jmp	$L835
; Line 1225
$L896:
	mov	DWORD PTR _commutative$[ebp], -1
; Line 1232
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L897
$L898:
	inc	DWORD PTR _i$[ebp]
$L897:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _noperands$[ebp], eax
	jle	$L899
; Line 1237
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _recog_operand[eax*4]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	DWORD PTR _substed_operand$[ebp+ecx*4], eax
; Line 1238
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _constraints$[ebp+eax*4]
	mov	DWORD PTR _p$900[ebp], eax
; Line 1242
$L903:
	mov	eax, DWORD PTR _p$900[ebp]
	movsx	eax, BYTE PTR [eax]
	mov	DWORD PTR _c$901[ebp], eax
	inc	DWORD PTR _p$900[ebp]
	cmp	DWORD PTR _c$901[ebp], 0
	je	$L904
; Line 1243
	cmp	DWORD PTR _c$901[ebp], 37		; 00000025H
	jne	$L905
; Line 1244
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _commutative$[ebp], eax
; Line 1245
	jmp	$L906
$L905:
	cmp	DWORD PTR _c$901[ebp], 48		; 00000030H
	jl	$L907
	cmp	DWORD PTR _c$901[ebp], 57		; 00000039H
	jg	$L907
; Line 1247
	sub	DWORD PTR _c$901[ebp], 48		; 00000030H
; Line 1249
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _recog_operand[eax*4]
	push	eax
	mov	eax, DWORD PTR _c$901[ebp]
	mov	eax, DWORD PTR _recog_operand[eax*4]
	push	eax
	call	_operands_match_p
	add	esp, 8
	mov	ecx, DWORD PTR _c$901[ebp]
	mov	edx, ecx
	shl	ecx, 3
	sub	ecx, edx
	add	ecx, DWORD PTR _i$[ebp]
	mov	BYTE PTR _operands_match$[ebp+ecx], al
; Line 1252
	cmp	DWORD PTR _commutative$[ebp], 0
	jl	$L908
; Line 1254
	mov	eax, DWORD PTR _commutative$[ebp]
	cmp	DWORD PTR _c$901[ebp], eax
	je	$L910
	mov	eax, DWORD PTR _commutative$[ebp]
	inc	eax
	cmp	eax, DWORD PTR _c$901[ebp]
	jne	$L909
$L910:
; Line 1256
	mov	eax, DWORD PTR _c$901[ebp]
	sub	eax, DWORD PTR _commutative$[ebp]
	cmp	eax, 1
	sbb	eax, eax
	and	eax, 2
	dec	eax
	add	eax, DWORD PTR _c$901[ebp]
	mov	DWORD PTR _other$911[ebp], eax
; Line 1258
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _recog_operand[eax*4]
	push	eax
	mov	eax, DWORD PTR _other$911[ebp]
	mov	eax, DWORD PTR _recog_operand[eax*4]
	push	eax
	call	_operands_match_p
	add	esp, 8
	mov	ecx, DWORD PTR _other$911[ebp]
	mov	edx, ecx
	shl	ecx, 3
	sub	ecx, edx
	add	ecx, DWORD PTR _i$[ebp]
	mov	BYTE PTR _operands_match$[ebp+ecx], al
; Line 1260
$L909:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _commutative$[ebp], eax
	je	$L913
	mov	eax, DWORD PTR _commutative$[ebp]
	inc	eax
	cmp	eax, DWORD PTR _i$[ebp]
	jne	$L912
$L913:
; Line 1262
	mov	eax, DWORD PTR _commutative$[ebp]
	sub	eax, DWORD PTR _i$[ebp]
	cmp	eax, 1
	sbb	eax, eax
	and	eax, 2
	dec	eax
	add	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _other$914[ebp], eax
; Line 1264
	mov	eax, DWORD PTR _other$914[ebp]
	mov	eax, DWORD PTR _recog_operand[eax*4]
	push	eax
	mov	eax, DWORD PTR _c$901[ebp]
	mov	eax, DWORD PTR _recog_operand[eax*4]
	push	eax
	call	_operands_match_p
	add	esp, 8
	mov	ecx, DWORD PTR _c$901[ebp]
	mov	edx, ecx
	shl	ecx, 3
	sub	ecx, edx
	add	ecx, DWORD PTR _other$914[ebp]
	mov	BYTE PTR _operands_match$[ebp+ecx], al
; Line 1269
$L912:
; Line 1270
$L908:
; Line 1271
$L907:
$L906:
	jmp	$L903
$L904:
	jmp	$L898
$L899:
; Line 1280
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L915
$L916:
	inc	DWORD PTR _i$[ebp]
$L915:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _noperands$[ebp], eax
	jle	$L917
; Line 1282
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _recog_operand[eax*4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$918[ebp], eax
; Line 1283
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _modified$[ebp+eax*4], 1
; Line 1284
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _address_reloaded$[ebp+eax*4], 0
; Line 1285
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _constraints$[ebp+eax*4]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 112				; 00000070H
	jne	$L919
; Line 1289
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _recog_operand[eax*4]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _recog_operand_loc[eax*4]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _recog_operand[eax*4]
	push	eax
	push	0
	push	0
	call	_find_reloads_address
	add	esp, 20					; 00000014H
; Line 1290
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _recog_operand_loc[eax*4]
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	DWORD PTR _recog_operand[ecx*4], eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _recog_operand[eax*4]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	DWORD PTR _substed_operand$[ebp+ecx*4], eax
; Line 1292
	jmp	$L920
$L919:
	cmp	DWORD PTR _code$918[ebp], 37		; 00000025H
	jne	$L921
; Line 1298
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _recog_operand[eax*4]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _recog_operand[eax*4]
	add	eax, 4
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _recog_operand[eax*4]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _recog_operand_loc[eax*4]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _recog_operand[eax*4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	call	_find_reloads_address
	add	esp, 20					; 00000014H
	or	eax, eax
	je	$L922
; Line 1299
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _address_reloaded$[ebp+eax*4], 1
; Line 1300
$L922:
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _recog_operand_loc[eax*4]
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	DWORD PTR _recog_operand[ecx*4], eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _recog_operand[eax*4]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	DWORD PTR _substed_operand$[ebp+ecx*4], eax
; Line 1302
	jmp	$L923
$L921:
	cmp	DWORD PTR _code$918[ebp], 35		; 00000023H
	jne	$L924
; Line 1304
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _recog_operand[eax*4]
	push	eax
	call	_find_reloads_toplev
	add	esp, 4
	mov	ecx, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _recog_operand_loc[ecx*4]
	mov	DWORD PTR [ecx], eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _recog_operand_loc[eax*4]
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	DWORD PTR _recog_operand[ecx*4], eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _recog_operand[eax*4]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	DWORD PTR _substed_operand$[ebp+ecx*4], eax
; Line 1305
	jmp	$L925
$L924:
	cmp	DWORD PTR _code$918[ebp], 34		; 00000022H
	jne	$L926
; Line 1309
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _recog_operand[eax*4]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _regno$927[ebp], eax
; Line 1310
	mov	eax, DWORD PTR _regno$927[ebp]
	mov	ecx, DWORD PTR _reg_equiv_constant
	cmp	DWORD PTR [ecx+eax*4], 0
	je	$L928
; Line 1312
	mov	eax, DWORD PTR _regno$927[ebp]
	mov	ecx, DWORD PTR _reg_equiv_constant
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	DWORD PTR _recog_operand[ecx*4], eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _recog_operand[eax*4]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	DWORD PTR _substed_operand$[ebp+ecx*4], eax
; Line 1319
$L928:
	mov	eax, DWORD PTR _regno$927[ebp]
	mov	ecx, DWORD PTR _reg_equiv_address
	cmp	DWORD PTR [ecx+eax*4], 0
	je	$L929
; Line 1323
	mov	eax, DWORD PTR _regno$927[ebp]
	mov	ecx, DWORD PTR _reg_equiv_address
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _recog_operand[eax*4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	37					; 00000025H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _i$[ebp]
	mov	DWORD PTR _recog_operand[ecx*4], eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _recog_operand[eax*4]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _recog_operand_loc[ecx*4]
	mov	DWORD PTR [ecx], eax
; Line 1328
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _recog_operand[eax*4]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _recog_operand[eax*4]
	add	eax, 4
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _recog_operand[eax*4]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _recog_operand_loc[eax*4]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _recog_operand[eax*4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	call	_find_reloads_address
	add	esp, 20					; 00000014H
; Line 1329
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _recog_operand_loc[eax*4]
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	DWORD PTR _recog_operand[ecx*4], eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _recog_operand[eax*4]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	DWORD PTR _substed_operand$[ebp+ecx*4], eax
; Line 1331
$L929:
; Line 1332
$L926:
$L925:
$L923:
$L920:
	jmp	$L916
$L917:
; Line 1338
	mov	DWORD PTR _best$[ebp], 107		; 0000006bH
; Line 1340
	mov	DWORD PTR _swapped$[ebp], 0
; Line 1341
$try_swapped$930:
; Line 1352
	mov	DWORD PTR _this_alternative_number$[ebp], 0
	jmp	$L931
$L932:
	inc	DWORD PTR _this_alternative_number$[ebp]
$L931:
	mov	eax, DWORD PTR _this_alternative_number$[ebp]
	cmp	DWORD PTR _n_alternatives$[ebp], eax
	jle	$L933
; Line 1357
	mov	DWORD PTR _losers$934[ebp], 0
; Line 1360
	mov	DWORD PTR _bad$935[ebp], 0
; Line 1365
	mov	DWORD PTR _reject$936[ebp], 0
; Line 1367
	mov	DWORD PTR _this_earlyclobber$[ebp], 0
; Line 1369
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L937
$L938:
	inc	DWORD PTR _i$[ebp]
$L937:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _noperands$[ebp], eax
	jle	$L939
; Line 1371
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _constraints$[ebp+eax*4]
	mov	DWORD PTR _p$940[ebp], eax
; Line 1372
	mov	DWORD PTR _win$941[ebp], 0
; Line 1374
	mov	DWORD PTR _badop$942[ebp], 1
; Line 1376
	mov	DWORD PTR _winreg$943[ebp], 0
; Line 1378
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _recog_operand[eax*4]
	mov	DWORD PTR _operand$945[ebp], eax
; Line 1379
	mov	DWORD PTR _offset$946[ebp], 0
; Line 1382
	mov	DWORD PTR _force_reload$947[ebp], 0
; Line 1383
	mov	DWORD PTR _offmemok$948[ebp], 0
; Line 1384
	mov	DWORD PTR _earlyclobber$949[ebp], 0
; Line 1390
$L951:
	mov	eax, DWORD PTR _operand$945[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L952
; Line 1392
	mov	eax, DWORD PTR _operand$945[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	DWORD PTR _offset$946[ebp], eax
; Line 1393
	mov	eax, DWORD PTR _operand$945[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _operand$945[ebp], eax
; Line 1394
	mov	eax, DWORD PTR _operand$945[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L953
; Line 1395
	mov	DWORD PTR _force_reload$947[ebp], 1
; Line 1396
$L953:
	jmp	$L951
$L952:
; Line 1398
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _this_alternative$[ebp+eax*4], 0
; Line 1399
	mov	eax, DWORD PTR _i$[ebp]
	mov	BYTE PTR _this_alternative_win$[ebp+eax], 0
; Line 1400
	mov	eax, DWORD PTR _i$[ebp]
	mov	BYTE PTR _this_alternative_offmemok$[ebp+eax], 0
; Line 1401
	mov	eax, DWORD PTR _i$[ebp]
	mov	BYTE PTR _this_alternative_earlyclobber$[ebp+eax], 0
; Line 1402
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _this_alternative_matches$[ebp+eax*4], -1
; Line 1406
	mov	eax, DWORD PTR _p$940[ebp]
	movsx	eax, BYTE PTR [eax]
	or	eax, eax
	je	$L955
	mov	eax, DWORD PTR _p$940[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 44					; 0000002cH
	jne	$L954
$L955:
; Line 1407
	mov	DWORD PTR _win$941[ebp], 1
	mov	DWORD PTR _badop$942[ebp], 0
; Line 1416
$L954:
$L957:
	mov	eax, DWORD PTR _p$940[ebp]
	movsx	eax, BYTE PTR [eax]
	or	eax, eax
	je	$L958
	mov	eax, DWORD PTR _p$940[ebp]
	movsx	eax, BYTE PTR [eax]
	mov	DWORD PTR _c$944[ebp], eax
	inc	DWORD PTR _p$940[ebp]
	cmp	DWORD PTR _c$944[ebp], 44		; 0000002cH
	je	$L958
; Line 1417
	mov	eax, DWORD PTR _c$944[ebp]
	mov	DWORD PTR -744+[ebp], eax
	jmp	$L959
; Line 1419
$L963:
; Line 1420
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _modified$[ebp+eax*4], 3
; Line 1421
	jmp	$L960
; Line 1423
$L964:
; Line 1424
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _modified$[ebp+eax*4], 2
; Line 1425
	jmp	$L960
; Line 1427
$L965:
; Line 1428
	jmp	$L960
; Line 1430
$L966:
; Line 1431
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _commutative$[ebp], eax
; Line 1432
	jmp	$L960
; Line 1434
$L967:
; Line 1435
	inc	DWORD PTR _reject$936[ebp]
; Line 1436
	jmp	$L960
; Line 1438
$L968:
; Line 1439
	mov	DWORD PTR _reject$936[ebp], 100		; 00000064H
; Line 1440
	jmp	$L960
; Line 1442
$L969:
; Line 1445
$L971:
	mov	eax, DWORD PTR _p$940[ebp]
	movsx	eax, BYTE PTR [eax]
	or	eax, eax
	je	$L972
	mov	eax, DWORD PTR _p$940[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 44					; 0000002cH
	je	$L972
	inc	DWORD PTR _p$940[ebp]
	jmp	$L971
$L972:
; Line 1446
	jmp	$L960
; Line 1448
$L973:
; Line 1453
	sub	DWORD PTR _c$944[ebp], 48		; 00000030H
; Line 1454
	mov	eax, DWORD PTR _c$944[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	DWORD PTR _this_alternative_matches$[ebp+ecx*4], eax
; Line 1474
	cmp	DWORD PTR _swapped$[ebp], 0
	je	$L1546
	mov	eax, DWORD PTR _c$944[ebp]
	cmp	DWORD PTR _commutative$[ebp], eax
	jne	$L1548
	mov	eax, DWORD PTR _commutative$[ebp]
	inc	eax
	cmp	eax, DWORD PTR _i$[ebp]
	je	$L1546
$L1548:
	mov	eax, DWORD PTR _c$944[ebp]
	cmp	DWORD PTR _commutative$[ebp], eax
	je	$L1551
	mov	eax, DWORD PTR _commutative$[ebp]
	inc	eax
	cmp	eax, DWORD PTR _c$944[ebp]
	jne	$L1549
$L1551:
	mov	eax, DWORD PTR _commutative$[ebp]
	add	eax, eax
	inc	eax
	sub	eax, DWORD PTR _c$944[ebp]
	mov	DWORD PTR -632+[ebp], eax
	jmp	$L1550
$L1549:
	mov	eax, DWORD PTR _c$944[ebp]
	mov	DWORD PTR -632+[ebp], eax
$L1550:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _commutative$[ebp], eax
	je	$L1554
	mov	eax, DWORD PTR _commutative$[ebp]
	inc	eax
	cmp	eax, DWORD PTR _i$[ebp]
	jne	$L1552
$L1554:
	mov	eax, DWORD PTR _commutative$[ebp]
	add	eax, eax
	inc	eax
	sub	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR -636+[ebp], eax
	jmp	$L1553
$L1552:
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR -636+[ebp], eax
$L1553:
	mov	eax, DWORD PTR -636+[ebp]
	mov	ecx, DWORD PTR -632+[ebp]
	sub	eax, ecx
	lea	eax, DWORD PTR [eax+ecx*8]
	movsx	eax, BYTE PTR _operands_match$[ebp+eax]
	mov	DWORD PTR -628+[ebp], eax
	jmp	$L1547
$L1546:
	mov	eax, DWORD PTR _c$944[ebp]
	mov	ecx, eax
	shl	eax, 3
	sub	eax, ecx
	add	eax, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR _operands_match$[ebp+eax]
	mov	DWORD PTR -628+[ebp], eax
$L1547:
	cmp	DWORD PTR -628+[ebp], 0
	je	$L974
; Line 1475
	mov	eax, DWORD PTR _c$944[ebp]
	movsx	eax, BYTE PTR _this_alternative_win$[ebp+eax]
	mov	DWORD PTR _win$941[ebp], eax
; Line 1476
	jmp	$L975
$L974:
; Line 1482
	mov	eax, DWORD PTR _c$944[ebp]
	movsx	eax, BYTE PTR _this_alternative_win$[ebp+eax]
	or	eax, eax
	je	$L977
; Line 1483
	inc	DWORD PTR _losers$934[ebp]
; Line 1484
$L977:
	mov	eax, DWORD PTR _c$944[ebp]
	mov	BYTE PTR _this_alternative_win$[ebp+eax], 0
; Line 1485
	mov	eax, DWORD PTR _c$944[ebp]
	cmp	DWORD PTR _this_alternative$[ebp+eax*4], 0
	jne	$L978
; Line 1486
	mov	DWORD PTR _bad$935[ebp], 1
; Line 1489
$L978:
; Line 1492
	push	-1
	mov	eax, DWORD PTR _c$944[ebp]
	mov	eax, DWORD PTR _this_alternative$[ebp+eax*4]
	push	eax
	mov	eax, DWORD PTR _c$944[ebp]
	mov	eax, DWORD PTR _recog_operand_loc[eax*4]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _recog_operand_loc[eax*4]
	push	eax
	mov	eax, DWORD PTR _c$944[ebp]
	mov	eax, DWORD PTR _recog_operand[eax*4]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _recog_operand[eax*4]
	push	eax
	call	_find_dummy_reload
	add	esp, 24					; 00000018H
	mov	DWORD PTR _value$976[ebp], eax
; Line 1494
	cmp	DWORD PTR _value$976[ebp], 0
	je	$L979
; Line 1495
	dec	DWORD PTR _losers$934[ebp]
; Line 1496
$L979:
$L975:
; Line 1499
	mov	DWORD PTR _badop$942[ebp], 0
; Line 1500
	mov	eax, DWORD PTR _c$944[ebp]
	mov	eax, DWORD PTR _this_alternative$[ebp+eax*4]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	DWORD PTR _this_alternative$[ebp+ecx*4], eax
; Line 1501
	jmp	$L960
; Line 1503
$L980:
; Line 1506
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _this_alternative$[ebp+eax*4], 12 ; 0000000cH
; Line 1507
	mov	DWORD PTR _win$941[ebp], 1
; Line 1508
	jmp	$L960
; Line 1510
$L981:
; Line 1511
	cmp	DWORD PTR _force_reload$947[ebp], 0
	je	$L982
; Line 1512
	jmp	$L960
; Line 1513
$L982:
; Line 1516
	mov	eax, DWORD PTR _operand$945[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L984
	mov	eax, DWORD PTR _operand$945[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L983
	mov	eax, DWORD PTR _operand$945[ebp]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L983
	mov	eax, DWORD PTR _operand$945[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	or	eax, eax
	jge	$L983
$L984:
; Line 1517
	mov	DWORD PTR _win$941[ebp], 1
; Line 1518
$L983:
; Line 1519
	mov	eax, DWORD PTR _operand$945[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2031616				; 001f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L986
	mov	eax, DWORD PTR _operand$945[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L987
	mov	eax, DWORD PTR _operand$945[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L987
	mov	eax, DWORD PTR _operand$945[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L987
	mov	eax, DWORD PTR _operand$945[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L985
$L987:
$L986:
; Line 1520
	mov	DWORD PTR _badop$942[ebp], 0
; Line 1521
$L985:
	jmp	$L960
; Line 1523
$L988:
; Line 1527
	mov	eax, DWORD PTR _operand$945[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L989
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _address_reloaded$[ebp+eax*4], 0
	jne	$L989
	mov	eax, DWORD PTR _operand$945[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 4128768				; 003f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L990
	mov	eax, DWORD PTR _operand$945[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 4259840				; 00410000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L989
$L990:
; Line 1528
	mov	DWORD PTR _win$941[ebp], 1
; Line 1529
$L989:
	jmp	$L960
; Line 1531
$L991:
; Line 1535
	mov	eax, DWORD PTR _operand$945[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L992
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _address_reloaded$[ebp+eax*4], 0
	jne	$L992
	mov	eax, DWORD PTR _operand$945[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 4194304				; 00400000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L993
	mov	eax, DWORD PTR _operand$945[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 4325376				; 00420000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L992
$L993:
; Line 1536
	mov	DWORD PTR _win$941[ebp], 1
; Line 1537
$L992:
	jmp	$L960
; Line 1540
$L994:
; Line 1541
	cmp	DWORD PTR _force_reload$947[ebp], 0
	je	$L995
; Line 1542
	jmp	$L960
; Line 1543
$L995:
; Line 1555
	mov	eax, DWORD PTR _operand$945[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L999
	mov	eax, DWORD PTR _operand$945[ebp]
	push	eax
	call	_offsettable_memref_p
	add	esp, 4
	or	eax, eax
	jne	$L998
$L999:
	mov	eax, DWORD PTR _operand$945[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1000
	mov	eax, DWORD PTR _operand$945[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1000
	cmp	DWORD PTR _ind_ok$[ebp], 0
	je	$L998
	mov	eax, DWORD PTR _operand$945[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg_equiv_address
	cmp	DWORD PTR [ecx+eax*4], 0
	jne	$L998
$L1000:
	mov	eax, DWORD PTR _operand$945[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L997
	mov	eax, DWORD PTR _operand$945[ebp]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L997
	mov	eax, DWORD PTR _operand$945[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	or	eax, eax
	jge	$L997
$L998:
; Line 1556
	mov	DWORD PTR _win$941[ebp], 1
; Line 1557
$L997:
; Line 1559
	mov	eax, DWORD PTR _operand$945[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2031616				; 001f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1002
	mov	eax, DWORD PTR _operand$945[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1002
	mov	eax, DWORD PTR _operand$945[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1002
	mov	eax, DWORD PTR _operand$945[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1002
	mov	eax, DWORD PTR _operand$945[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1002
	mov	eax, DWORD PTR _operand$945[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1001
$L1002:
; Line 1560
	mov	DWORD PTR _badop$942[ebp], 0
; Line 1561
$L1001:
	mov	DWORD PTR _offmemok$948[ebp], 1
; Line 1562
	jmp	$L960
; Line 1564
$L1003:
; Line 1568
	mov	eax, DWORD PTR _operand$945[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1005
	mov	eax, DWORD PTR _operand$945[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1004
$L1005:
; Line 1569
	mov	DWORD PTR _earlyclobber$949[ebp], 1
	mov	DWORD PTR _this_earlyclobber$[ebp], 1
; Line 1570
$L1004:
	jmp	$L960
; Line 1572
$L1006:
; Line 1573
	mov	eax, DWORD PTR _operand$945[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2031616				; 001f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1007
; Line 1574
	mov	DWORD PTR _win$941[ebp], 1
; Line 1575
$L1007:
	jmp	$L960
; Line 1577
$L1008:
; Line 1580
	mov	eax, DWORD PTR _operand$945[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2031616				; 001f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1010
	cmp	DWORD PTR _c$944[ebp], 71		; 00000047H
	jne	$L1555
	test	BYTE PTR _target_flags, 1
	je	$L1559
	mov	eax, DWORD PTR _operand$945[ebp]
	push	eax
	call	_standard_80387_constant_p
	add	esp, 4
	or	eax, eax
	jne	$L1557
$L1559:
	mov	DWORD PTR -640+[ebp], 1
	jmp	$L1558
$L1557:
	mov	DWORD PTR -640+[ebp], 0
$L1558:
	jmp	$L1556
$L1555:
	mov	DWORD PTR -640+[ebp], 1
$L1556:
	cmp	DWORD PTR -640+[ebp], 0
	je	$L1010
; Line 1581
	mov	DWORD PTR _win$941[ebp], 1
; Line 1582
$L1010:
	jmp	$L960
; Line 1584
$L1011:
; Line 1585
	mov	eax, DWORD PTR _operand$945[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1012
; Line 1586
	jmp	$L960
; Line 1587
$L1012:
$L1013:
; Line 1588
	mov	eax, DWORD PTR _operand$945[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1015
	mov	eax, DWORD PTR _operand$945[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1015
	mov	eax, DWORD PTR _operand$945[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1015
	mov	eax, DWORD PTR _operand$945[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1014
$L1015:
; Line 1589
	mov	DWORD PTR _win$941[ebp], 1
; Line 1590
$L1014:
	jmp	$L960
; Line 1592
$L1016:
; Line 1593
	mov	eax, DWORD PTR _operand$945[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1017
; Line 1594
	mov	DWORD PTR _win$941[ebp], 1
; Line 1595
$L1017:
	jmp	$L960
; Line 1597
$L1018:
; Line 1603
	mov	eax, DWORD PTR _operand$945[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1019
	cmp	DWORD PTR _c$944[ebp], 73		; 00000049H
	jne	$L1560
	mov	eax, DWORD PTR _operand$945[ebp]
	cmp	DWORD PTR [eax+4], 0
	jl	$L1562
	mov	eax, DWORD PTR _operand$945[ebp]
	cmp	DWORD PTR [eax+4], 31			; 0000001fH
	jg	$L1562
	mov	DWORD PTR -644+[ebp], 1
	jmp	$L1563
$L1562:
	mov	DWORD PTR -644+[ebp], 0
$L1563:
	jmp	$L1561
$L1560:
	mov	DWORD PTR -644+[ebp], 0
$L1561:
	cmp	DWORD PTR -644+[ebp], 0
	je	$L1019
; Line 1604
	mov	DWORD PTR _win$941[ebp], 1
; Line 1605
$L1019:
	jmp	$L960
; Line 1607
$L1020:
; Line 1612
	cmp	DWORD PTR _force_reload$947[ebp], 0
	jne	$L1021
	mov	eax, DWORD PTR _operand$945[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1022
	mov	eax, DWORD PTR _operand$945[ebp]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L1021
	mov	eax, DWORD PTR _operand$945[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	or	eax, eax
	jge	$L1021
$L1022:
; Line 1613
	mov	DWORD PTR _win$941[ebp], 1
; Line 1616
$L1021:
$L1023:
; Line 1618
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _this_alternative$[ebp+eax*4]
	mov	ecx, eax
	lea	eax, DWORD PTR [eax+eax*2]
	lea	eax, DWORD PTR [ecx+eax*4]
	mov	eax, DWORD PTR _reg_class_subunion[eax*4+40]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	DWORD PTR _this_alternative$[ebp+ecx*4], eax
; Line 1619
	jmp	$reg$1024
; Line 1621
$L1025:
; Line 1623
	cmp	DWORD PTR _c$944[ebp], 114		; 00000072H
	jne	$L1564
	mov	DWORD PTR -648+[ebp], 10		; 0000000aH
	jmp	$L1565
$L1564:
	cmp	DWORD PTR _c$944[ebp], 113		; 00000071H
	jne	$L1566
	mov	DWORD PTR -648+[ebp], 6
	jmp	$L1567
$L1566:
	cmp	DWORD PTR _c$944[ebp], 102		; 00000066H
	jne	$L1568
	mov	DWORD PTR -648+[ebp], 11		; 0000000bH
	jmp	$L1569
$L1568:
	cmp	DWORD PTR _c$944[ebp], 97		; 00000061H
	jne	$L1570
	mov	DWORD PTR -648+[ebp], 1
	jmp	$L1571
$L1570:
	cmp	DWORD PTR _c$944[ebp], 98		; 00000062H
	jne	$L1572
	mov	DWORD PTR -648+[ebp], 5
	jmp	$L1573
$L1572:
	cmp	DWORD PTR _c$944[ebp], 99		; 00000063H
	jne	$L1574
	mov	DWORD PTR -648+[ebp], 4
	jmp	$L1575
$L1574:
	cmp	DWORD PTR _c$944[ebp], 100		; 00000064H
	jne	$L1576
	mov	DWORD PTR -648+[ebp], 2
	jmp	$L1577
$L1576:
	cmp	DWORD PTR _c$944[ebp], 65		; 00000041H
	jne	$L1578
	mov	DWORD PTR -648+[ebp], 3
	jmp	$L1579
$L1578:
	cmp	DWORD PTR _c$944[ebp], 83		; 00000053H
	jne	$L1580
	mov	DWORD PTR -648+[ebp], 7
	jmp	$L1581
$L1580:
	mov	eax, DWORD PTR _c$944[ebp]
	sub	eax, 68					; 00000044H
	cmp	eax, 1
	sbb	eax, eax
	and	eax, 8
	mov	DWORD PTR -648+[ebp], eax
$L1581:
$L1579:
$L1577:
$L1575:
$L1573:
$L1571:
$L1569:
$L1567:
$L1565:
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _this_alternative$[ebp+eax*4]
	mov	ecx, eax
	lea	eax, DWORD PTR [eax+eax*2]
	lea	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR -648+[ebp]
	shl	ecx, 2
	mov	eax, DWORD PTR _reg_class_subunion[ecx+eax*4]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	DWORD PTR _this_alternative$[ebp+ecx*4], eax
; Line 1625
$reg$1024:
; Line 1626
	mov	eax, DWORD PTR _operand$945[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 436207616				; 1a000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1026
; Line 1627
	jmp	$L960
; Line 1628
$L1026:
	mov	DWORD PTR _winreg$943[ebp], 1
; Line 1631
	mov	eax, DWORD PTR _operand$945[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1028
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _recog_operand[eax*4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	mov	eax, DWORD PTR _offset$946[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _this_alternative$[ebp+eax*4]
	push	eax
	mov	eax, DWORD PTR _operand$945[ebp]
	push	eax
	call	_reg_fits_class_p
	add	esp, 16					; 00000010H
	or	eax, eax
	je	$L1028
; Line 1632
	mov	DWORD PTR _win$941[ebp], 1
; Line 1633
$L1028:
	jmp	$L960
; Line 1634
	jmp	$L960
$L959:
	sub	DWORD PTR -744+[ebp], 33		; 00000021H
	cmp	DWORD PTR -744+[ebp], 82		; 00000052H
	ja	$L1025
	shl	DWORD PTR -744+[ebp], 2
	mov	eax, DWORD PTR -744+[ebp]
	jmp	DWORD PTR $L1630[eax]
$L1630:
	DD	OFFSET $L968
	DD	OFFSET $L1025
	DD	OFFSET $L969
	DD	OFFSET $L1025
	DD	OFFSET $L966
	DD	OFFSET $L1003
	DD	OFFSET $L1025
	DD	OFFSET $L1025
	DD	OFFSET $L1025
	DD	OFFSET $L965
	DD	OFFSET $L964
	DD	OFFSET $L1025
	DD	OFFSET $L1025
	DD	OFFSET $L1025
	DD	OFFSET $L1025
	DD	OFFSET $L973
	DD	OFFSET $L973
	DD	OFFSET $L973
	DD	OFFSET $L973
	DD	OFFSET $L973
	DD	OFFSET $L1025
	DD	OFFSET $L1025
	DD	OFFSET $L1025
	DD	OFFSET $L1025
	DD	OFFSET $L1025
	DD	OFFSET $L1025
	DD	OFFSET $L1025
	DD	OFFSET $L988
	DD	OFFSET $L963
	DD	OFFSET $L991
	DD	OFFSET $L967
	DD	OFFSET $L1025
	DD	OFFSET $L1025
	DD	OFFSET $L1025
	DD	OFFSET $L1025
	DD	OFFSET $L1025
	DD	OFFSET $L1025
	DD	OFFSET $L1006
	DD	OFFSET $L1008
	DD	OFFSET $L1008
	DD	OFFSET $L1018
	DD	OFFSET $L1018
	DD	OFFSET $L1018
	DD	OFFSET $L1018
	DD	OFFSET $L1018
	DD	OFFSET $L1025
	DD	OFFSET $L1025
	DD	OFFSET $L1025
	DD	OFFSET $L1025
	DD	OFFSET $L1025
	DD	OFFSET $L1025
	DD	OFFSET $L1025
	DD	OFFSET $L1025
	DD	OFFSET $L1025
	DD	OFFSET $L1025
	DD	OFFSET $L1025
	DD	OFFSET $L1025
	DD	OFFSET $L1025
	DD	OFFSET $L1025
	DD	OFFSET $L1025
	DD	OFFSET $L1025
	DD	OFFSET $L1025
	DD	OFFSET $L1025
	DD	OFFSET $L1025
	DD	OFFSET $L1025
	DD	OFFSET $L1025
	DD	OFFSET $L1025
	DD	OFFSET $L1025
	DD	OFFSET $L1025
	DD	OFFSET $L1025
	DD	OFFSET $L1020
	DD	OFFSET $L1025
	DD	OFFSET $L1013
	DD	OFFSET $L1025
	DD	OFFSET $L1025
	DD	OFFSET $L1025
	DD	OFFSET $L981
	DD	OFFSET $L1016
	DD	OFFSET $L994
	DD	OFFSET $L980
	DD	OFFSET $L1025
	DD	OFFSET $L1023
	DD	OFFSET $L1011
$L960:
	jmp	$L957
$L958:
; Line 1636
	mov	eax, DWORD PTR _p$940[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	DWORD PTR _constraints$[ebp+ecx*4], eax
; Line 1640
	cmp	DWORD PTR _winreg$943[ebp], 0
	je	$L1029
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _this_alternative$[ebp+eax*4], 0
	je	$L1029
; Line 1641
	mov	DWORD PTR _badop$942[ebp], 0
; Line 1644
$L1029:
	mov	al, BYTE PTR _earlyclobber$949[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	BYTE PTR _this_alternative_earlyclobber$[ebp+ecx], al
; Line 1645
	cmp	DWORD PTR _win$941[ebp], 0
	je	$L1030
	cmp	DWORD PTR _force_reload$947[ebp], 0
	jne	$L1030
; Line 1646
	mov	eax, DWORD PTR _i$[ebp]
	mov	BYTE PTR _this_alternative_win$[ebp+eax], 1
; Line 1647
	jmp	$L1031
$L1030:
; Line 1649
	mov	al, BYTE PTR _offmemok$948[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	BYTE PTR _this_alternative_offmemok$[ebp+ecx], al
; Line 1650
	inc	DWORD PTR _losers$934[ebp]
; Line 1651
	cmp	DWORD PTR _badop$942[ebp], 0
	je	$L1032
; Line 1652
	mov	DWORD PTR _bad$935[ebp], 1
; Line 1654
$L1032:
; Line 1656
	mov	eax, DWORD PTR _operand$945[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1033
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _this_alternative$[ebp+eax*4], 0
	jne	$L1033
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _this_alternative_matches$[ebp+eax*4], 0
	jge	$L1033
; Line 1657
	mov	DWORD PTR _bad$935[ebp], 1
; Line 1658
$L1033:
$L1031:
; Line 1659
	jmp	$L938
$L939:
; Line 1665
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L1034
$L1035:
	inc	DWORD PTR _i$[ebp]
$L1034:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _noperands$[ebp], eax
	jle	$L1036
; Line 1667
	mov	eax, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR _this_alternative_earlyclobber$[ebp+eax]
	or	eax, eax
	je	$L1037
	mov	eax, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR _this_alternative_win$[ebp+eax]
	or	eax, eax
	je	$L1037
; Line 1672
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _recog_operand[eax*4]
	push	eax
	lea	eax, DWORD PTR $T1582[ebp]
	push	eax
	call	_decompose
	add	esp, 8
	lea	edi, DWORD PTR _early_data$1038[ebp]
	mov	esi, eax
	mov	ecx, 5
	rep	movsd
; Line 1674
	mov	DWORD PTR _j$1039[ebp], 0
	jmp	$L1040
$L1041:
	inc	DWORD PTR _j$1039[ebp]
$L1040:
	mov	eax, DWORD PTR _noperands$[ebp]
	cmp	DWORD PTR _j$1039[ebp], eax
	jge	$L1042
; Line 1684
	mov	eax, DWORD PTR _j$1039[ebp]
	mov	eax, DWORD PTR _recog_operand[eax*4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1044
	mov	eax, DWORD PTR _j$1039[ebp]
	cmp	DWORD PTR _modified$[ebp+eax*4], 3
	je	$L1043
$L1044:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _j$1039[ebp], eax
	je	$L1043
	mov	eax, DWORD PTR _j$1039[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _this_alternative_matches$[ebp+eax*4], ecx
	jne	$L1045
	mov	eax, DWORD PTR _j$1039[ebp]
	mov	eax, DWORD PTR _recog_operand[eax*4]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _recog_operand[eax*4]
	push	eax
	call	_rtx_equal_p
	add	esp, 8
	or	eax, eax
	jne	$L1043
$L1045:
	mov	eax, DWORD PTR _early_data$1038[ebp+16]
	push	eax
	mov	eax, DWORD PTR _early_data$1038[ebp+12]
	push	eax
	mov	eax, DWORD PTR _early_data$1038[ebp+8]
	push	eax
	mov	eax, DWORD PTR _early_data$1038[ebp+4]
	push	eax
	mov	eax, DWORD PTR _early_data$1038[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _recog_operand[eax*4]
	push	eax
	mov	eax, DWORD PTR _j$1039[ebp]
	mov	eax, DWORD PTR _recog_operand[eax*4]
	push	eax
	call	_immune_p
	add	esp, 28					; 0000001cH
	or	eax, eax
	jne	$L1043
; Line 1690
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _this_alternative$[ebp+eax*4]
	cmp	DWORD PTR _reg_class_size[eax*4], 1
	jne	$L1046
	mov	eax, DWORD PTR _j$1039[ebp]
	mov	eax, DWORD PTR _recog_operand[eax*4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1047
	mov	eax, DWORD PTR _j$1039[ebp]
	mov	eax, DWORD PTR _recog_operand[eax*4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1046
$L1047:
; Line 1692
	inc	DWORD PTR _losers$934[ebp]
; Line 1693
	mov	eax, DWORD PTR _j$1039[ebp]
	mov	BYTE PTR _this_alternative_win$[ebp+eax], 0
; Line 1695
	jmp	$L1048
$L1046:
; Line 1696
	jmp	$L1042
$L1048:
; Line 1700
$L1043:
	jmp	$L1041
$L1042:
	mov	eax, DWORD PTR _noperands$[ebp]
	cmp	DWORD PTR _j$1039[ebp], eax
	je	$L1049
; Line 1702
	inc	DWORD PTR _losers$934[ebp]
; Line 1703
	mov	eax, DWORD PTR _i$[ebp]
	mov	BYTE PTR _this_alternative_win$[ebp+eax], 0
; Line 1704
	mov	DWORD PTR _j$1039[ebp], 0
	jmp	$L1050
$L1051:
	inc	DWORD PTR _j$1039[ebp]
$L1050:
	mov	eax, DWORD PTR _noperands$[ebp]
	cmp	DWORD PTR _j$1039[ebp], eax
	jge	$L1052
; Line 1706
	mov	eax, DWORD PTR _j$1039[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _this_alternative_matches$[ebp+eax*4], ecx
	jne	$L1053
	mov	eax, DWORD PTR _j$1039[ebp]
	movsx	eax, BYTE PTR _this_alternative_win$[ebp+eax]
	or	eax, eax
	je	$L1053
; Line 1708
	mov	eax, DWORD PTR _j$1039[ebp]
	mov	BYTE PTR _this_alternative_win$[ebp+eax], 0
; Line 1709
	inc	DWORD PTR _losers$934[ebp]
; Line 1711
$L1053:
	jmp	$L1051
$L1052:
; Line 1712
$L1049:
; Line 1716
$L1037:
	jmp	$L1035
$L1036:
	cmp	DWORD PTR _losers$934[ebp], 0
	jne	$L1054
; Line 1719
	cmp	DWORD PTR _commutative$[ebp], 0
	jl	$L1055
; Line 1721
	mov	eax, DWORD PTR _commutative$[ebp]
	mov	eax, DWORD PTR _substed_operand$[ebp+eax*4]
	mov	ecx, DWORD PTR _commutative$[ebp]
	mov	DWORD PTR _recog_operand[ecx*4], eax
; Line 1723
	mov	eax, DWORD PTR _commutative$[ebp]
	mov	eax, DWORD PTR _substed_operand$[ebp+eax*4+4]
	mov	ecx, DWORD PTR _commutative$[ebp]
	mov	DWORD PTR _recog_operand[ecx*4+4], eax
; Line 1725
$L1055:
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L1056
$L1057:
	inc	DWORD PTR _i$[ebp]
$L1056:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _noperands$[ebp], eax
	jle	$L1058
; Line 1727
	mov	eax, DWORD PTR _i$[ebp]
	mov	BYTE PTR _goal_alternative_win$[ebp+eax], 1
; Line 1728
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _this_alternative$[ebp+eax*4]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	DWORD PTR _goal_alternative$[ebp+ecx*4], eax
; Line 1729
	mov	eax, DWORD PTR _i$[ebp]
	mov	al, BYTE PTR _this_alternative_offmemok$[ebp+eax]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	BYTE PTR _goal_alternative_offmemok$[ebp+ecx], al
; Line 1730
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _this_alternative_matches$[ebp+eax*4]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	DWORD PTR _goal_alternative_matches$[ebp+ecx*4], eax
; Line 1732
	mov	eax, DWORD PTR _i$[ebp]
	mov	al, BYTE PTR _this_alternative_earlyclobber$[ebp+eax]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	BYTE PTR _goal_alternative_earlyclobber$[ebp+ecx], al
; Line 1733
	jmp	$L1057
$L1058:
; Line 1734
	mov	eax, DWORD PTR _this_alternative_number$[ebp]
	mov	DWORD PTR _goal_alternative_number$[ebp], eax
; Line 1735
	mov	eax, DWORD PTR _swapped$[ebp]
	mov	DWORD PTR _goal_alternative_swapped$[ebp], eax
; Line 1736
	mov	eax, DWORD PTR _this_earlyclobber$[ebp]
	mov	DWORD PTR _goal_earlyclobber$[ebp], eax
; Line 1737
	jmp	$finish$1059
; Line 1742
$L1054:
	cmp	DWORD PTR _reject$936[ebp], 0
	jle	$L1060
; Line 1743
	mov	eax, DWORD PTR _reject$936[ebp]
	add	DWORD PTR _losers$934[ebp], eax
; Line 1748
$L1060:
	cmp	DWORD PTR _bad$935[ebp], 0
	jne	$L1061
	mov	eax, DWORD PTR _losers$934[ebp]
	cmp	DWORD PTR _best$[ebp], eax
	jle	$L1061
; Line 1750
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L1062
$L1063:
	inc	DWORD PTR _i$[ebp]
$L1062:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _noperands$[ebp], eax
	jle	$L1064
; Line 1752
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _this_alternative$[ebp+eax*4]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	DWORD PTR _goal_alternative$[ebp+ecx*4], eax
; Line 1753
	mov	eax, DWORD PTR _i$[ebp]
	mov	al, BYTE PTR _this_alternative_win$[ebp+eax]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	BYTE PTR _goal_alternative_win$[ebp+ecx], al
; Line 1754
	mov	eax, DWORD PTR _i$[ebp]
	mov	al, BYTE PTR _this_alternative_offmemok$[ebp+eax]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	BYTE PTR _goal_alternative_offmemok$[ebp+ecx], al
; Line 1755
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _this_alternative_matches$[ebp+eax*4]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	DWORD PTR _goal_alternative_matches$[ebp+ecx*4], eax
; Line 1757
	mov	eax, DWORD PTR _i$[ebp]
	mov	al, BYTE PTR _this_alternative_earlyclobber$[ebp+eax]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	BYTE PTR _goal_alternative_earlyclobber$[ebp+ecx], al
; Line 1758
	jmp	$L1063
$L1064:
; Line 1759
	mov	eax, DWORD PTR _swapped$[ebp]
	mov	DWORD PTR _goal_alternative_swapped$[ebp], eax
; Line 1760
	mov	eax, DWORD PTR _losers$934[ebp]
	mov	DWORD PTR _best$[ebp], eax
; Line 1761
	mov	eax, DWORD PTR _this_alternative_number$[ebp]
	mov	DWORD PTR _goal_alternative_number$[ebp], eax
; Line 1762
	mov	eax, DWORD PTR _this_earlyclobber$[ebp]
	mov	DWORD PTR _goal_earlyclobber$[ebp], eax
; Line 1764
$L1061:
	jmp	$L932
$L933:
; Line 1775
	cmp	DWORD PTR _commutative$[ebp], 0
	jl	$L1065
; Line 1777
	cmp	DWORD PTR _swapped$[ebp], 1
	sbb	eax, eax
	neg	eax
	mov	DWORD PTR _swapped$[ebp], eax
; Line 1778
	cmp	DWORD PTR _swapped$[ebp], 0
	je	$L1066
; Line 1780
	mov	eax, DWORD PTR _commutative$[ebp]
	mov	eax, DWORD PTR _substed_operand$[ebp+eax*4+4]
	mov	ecx, DWORD PTR _commutative$[ebp]
	mov	DWORD PTR _recog_operand[ecx*4], eax
; Line 1781
	mov	eax, DWORD PTR _commutative$[ebp]
	mov	eax, DWORD PTR _substed_operand$[ebp+eax*4]
	mov	ecx, DWORD PTR _commutative$[ebp]
	mov	DWORD PTR _recog_operand[ecx*4+4], eax
; Line 1783
	mov	eax, DWORD PTR _noperands$[ebp]
	shl	eax, 2
	push	eax
	lea	eax, DWORD PTR _constraints1$[ebp]
	push	eax
	lea	eax, DWORD PTR _constraints$[ebp]
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
; Line 1784
	jmp	$try_swapped$930
; Line 1786
	jmp	$L1067
$L1066:
; Line 1788
	mov	eax, DWORD PTR _commutative$[ebp]
	mov	eax, DWORD PTR _substed_operand$[ebp+eax*4]
	mov	ecx, DWORD PTR _commutative$[ebp]
	mov	DWORD PTR _recog_operand[ecx*4], eax
; Line 1789
	mov	eax, DWORD PTR _commutative$[ebp]
	mov	eax, DWORD PTR _substed_operand$[ebp+eax*4+4]
	mov	ecx, DWORD PTR _commutative$[ebp]
	mov	DWORD PTR _recog_operand[ecx*4+4], eax
; Line 1790
$L1067:
; Line 1798
$L1065:
	cmp	DWORD PTR _best$[ebp], 107		; 0000006bH
	jne	$L1068
; Line 1801
	cmp	DWORD PTR _insn_code_number$[ebp], 0
	jl	$L1069
; Line 1802
	call	_abort
; Line 1803
$L1069:
	push	OFFSET $SG1070
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_error_for_asm
	add	esp, 8
; Line 1805
	mov	eax, DWORD PTR _const0_rtx
	push	eax
	push	0
	push	26					; 0000001aH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 1806
	mov	DWORD PTR _n_reloads, 0
; Line 1807
	jmp	$L835
; Line 1812
$L1068:
$finish$1059:
; Line 1820
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L1071
$L1072:
	inc	DWORD PTR _i$[ebp]
$L1071:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _noperands$[ebp], eax
	jle	$L1073
; Line 1821
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _goal_alternative_matched$[ebp+eax*4], -1
	jmp	$L1072
$L1073:
; Line 1823
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L1074
$L1075:
	inc	DWORD PTR _i$[ebp]
$L1074:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _noperands$[ebp], eax
	jle	$L1076
; Line 1825
	mov	eax, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR _goal_alternative_win$[ebp+eax]
	or	eax, eax
	jne	$L1077
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _goal_alternative_matches$[ebp+eax*4], 0
	jl	$L1077
; Line 1826
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _goal_alternative_matches$[ebp+ecx*4]
	mov	DWORD PTR _goal_alternative_matched$[ebp+ecx*4], eax
; Line 1831
$L1077:
	jmp	$L1075
$L1076:
	cmp	DWORD PTR _goal_alternative_swapped$[ebp], 0
	je	$L1078
; Line 1835
	mov	eax, DWORD PTR _commutative$[ebp]
	mov	eax, DWORD PTR _substed_operand$[ebp+eax*4]
	mov	DWORD PTR _tem$1079[ebp], eax
; Line 1836
	mov	eax, DWORD PTR _commutative$[ebp]
	mov	eax, DWORD PTR _substed_operand$[ebp+eax*4+4]
	mov	ecx, DWORD PTR _commutative$[ebp]
	mov	DWORD PTR _substed_operand$[ebp+ecx*4], eax
; Line 1837
	mov	eax, DWORD PTR _tem$1079[ebp]
	mov	ecx, DWORD PTR _commutative$[ebp]
	mov	DWORD PTR _substed_operand$[ebp+ecx*4+4], eax
; Line 1838
	mov	eax, DWORD PTR _commutative$[ebp]
	mov	eax, DWORD PTR _recog_operand[eax*4]
	mov	DWORD PTR _tem$1079[ebp], eax
; Line 1839
	mov	eax, DWORD PTR _commutative$[ebp]
	mov	eax, DWORD PTR _recog_operand[eax*4+4]
	mov	ecx, DWORD PTR _commutative$[ebp]
	mov	DWORD PTR _recog_operand[ecx*4], eax
; Line 1840
	mov	eax, DWORD PTR _tem$1079[ebp]
	mov	ecx, DWORD PTR _commutative$[ebp]
	mov	DWORD PTR _recog_operand[ecx*4+4], eax
; Line 1847
$L1078:
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L1080
$L1081:
	inc	DWORD PTR _i$[ebp]
$L1080:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _noperands$[ebp], eax
	jle	$L1082
; Line 1849
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _substed_operand$[ebp+eax*4]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _recog_operand_loc[ecx*4]
	mov	DWORD PTR [ecx], eax
; Line 1851
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _operand_reloadnum$[ebp+eax*4], -1
; Line 1852
	jmp	$L1081
$L1082:
; Line 1856
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L1083
$L1084:
	inc	DWORD PTR _i$[ebp]
$L1083:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _noperands$[ebp], eax
	jle	$L1085
; Line 1862
	mov	eax, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR _goal_alternative_win$[ebp+eax]
	or	eax, eax
	jne	$L1086
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _recog_operand[eax*4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2031616				; 001f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1087
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _recog_operand[eax*4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1088
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _recog_operand[eax*4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1088
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _recog_operand[eax*4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1088
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _recog_operand[eax*4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1086
$L1088:
$L1087:
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _recog_operand[eax*4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2031616				; 001f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1583
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _goal_alternative$[ebp+eax*4], 10 ; 0000000aH
	je	$L1587
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _goal_alternative$[ebp+eax*4], 12 ; 0000000cH
	jne	$L1585
$L1587:
	mov	DWORD PTR -672+[ebp], 10		; 0000000aH
	jmp	$L1586
$L1585:
	mov	DWORD PTR -672+[ebp], 0
$L1586:
	jmp	$L1584
$L1583:
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _recog_operand[eax*4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 16777216				; 01000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1588
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _goal_alternative$[ebp+eax*4], 10 ; 0000000aH
	je	$L1592
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _goal_alternative$[ebp+eax*4], 12 ; 0000000cH
	jne	$L1590
$L1592:
	mov	DWORD PTR -672+[ebp], 6
	jmp	$L1591
$L1590:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _goal_alternative$[ebp+eax*4], 9
	jne	$L1593
	call	_abort
	mov	DWORD PTR -672+[ebp], 9
	jmp	$L1594
$L1593:
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _goal_alternative$[ebp+eax*4]
	mov	DWORD PTR -672+[ebp], eax
$L1594:
$L1591:
	jmp	$L1589
$L1588:
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _goal_alternative$[ebp+eax*4]
	mov	DWORD PTR -672+[ebp], eax
$L1589:
$L1584:
	cmp	DWORD PTR -672+[ebp], 0
	jne	$L1086
; Line 1864
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _operand_mode$[ebp+eax*4]
	mov	DWORD PTR _mode$1089[ebp], eax
; Line 1869
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _recog_operand[eax*4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2031616				; 001f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1595
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _recog_operand[eax*4]
	push	eax
	call	_force_const_double_mem
	add	esp, 4
	mov	ecx, DWORD PTR _i$[ebp]
	mov	DWORD PTR _recog_operand[ecx*4], eax
	jmp	$L1596
$L1595:
	cmp	DWORD PTR _mode$1089[ebp], 0
	je	$L1597
	mov	eax, DWORD PTR _mode$1089[ebp]
	mov	DWORD PTR -676+[ebp], eax
	jmp	$L1598
$L1597:
	mov	DWORD PTR -676+[ebp], 4
$L1598:
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _recog_operand[eax*4]
	push	eax
	mov	eax, DWORD PTR -676+[ebp]
	push	eax
	call	_force_const_mem
	add	esp, 8
	mov	ecx, DWORD PTR _i$[ebp]
	mov	DWORD PTR _recog_operand[ecx*4], eax
$L1596:
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _recog_operand[eax*4]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _recog_operand_loc[ecx*4]
	mov	DWORD PTR [ecx], eax
; Line 1870
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _recog_operand[eax*4]
	push	eax
	call	_find_reloads_toplev
	add	esp, 4
; Line 1871
	mov	eax, DWORD PTR _goal_alternative_number$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _constraints1$[ebp+eax*4]
	push	eax
	call	_alternative_allows_memconst
	add	esp, 8
	or	eax, eax
	je	$L1090
; Line 1872
	mov	eax, DWORD PTR _i$[ebp]
	mov	BYTE PTR _goal_alternative_win$[ebp+eax], 1
; Line 1873
$L1090:
; Line 1876
$L1086:
	jmp	$L1084
$L1085:
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L1091
$L1092:
	inc	DWORD PTR _i$[ebp]
$L1091:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _noperands$[ebp], eax
	jle	$L1093
; Line 1877
	mov	eax, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR _goal_alternative_win$[ebp+eax]
	or	eax, eax
	jne	$L1094
; Line 1880
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _goal_alternative_matches$[ebp+eax*4], 0
	jl	$L1095
; Line 1885
	jmp	$L1096
$L1095:
; Line 1887
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _goal_alternative_matched$[ebp+eax*4], -1
	jne	$L1097
	mov	eax, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR _goal_alternative_offmemok$[ebp+eax]
	or	eax, eax
	je	$L1097
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _recog_operand[eax*4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1097
; Line 1893
	push	0
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _recog_operand[eax*4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	10					; 0000000aH
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _recog_operand[eax*4]
	add	eax, 4
	push	eax
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _recog_operand[eax*4]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_push_reload
	add	esp, 40					; 00000028H
	mov	ecx, DWORD PTR _i$[ebp]
	mov	DWORD PTR _operand_reloadnum$[ebp+ecx*4], eax
; Line 1895
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _recog_operand[eax*4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _operand_reloadnum$[ebp+ecx*4]
	mov	DWORD PTR _reload_inc[ecx*4], eax
; Line 1897
	jmp	$L1098
$L1097:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _goal_alternative_matched$[ebp+eax*4], -1
	jne	$L1099
; Line 1907
	cmp	DWORD PTR _insn_code_number$[ebp], 0
	jl	$L1599
	mov	eax, DWORD PTR _insn_code_number$[ebp]
	mov	ecx, eax
	shl	eax, 3
	sub	eax, ecx
	mov	ecx, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR _insn_operand_strict_low[eax+ecx]
	mov	DWORD PTR -680+[ebp], eax
	jmp	$L1600
$L1599:
	mov	DWORD PTR -680+[ebp], 0
$L1600:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _modified$[ebp+eax*4], 1
	jne	$L1601
	mov	DWORD PTR -684+[ebp], 0
	jmp	$L1602
$L1601:
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _operand_mode$[ebp+eax*4]
	mov	DWORD PTR -684+[ebp], eax
$L1602:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _modified$[ebp+eax*4], 3
	jne	$L1603
	mov	DWORD PTR -688+[ebp], 0
	jmp	$L1604
$L1603:
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _operand_mode$[ebp+eax*4]
	mov	DWORD PTR -688+[ebp], eax
$L1604:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _modified$[ebp+eax*4], 1
	je	$L1605
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _recog_operand[eax*4]
	mov	DWORD PTR -692+[ebp], eax
	jmp	$L1606
$L1605:
	mov	DWORD PTR -692+[ebp], 0
$L1606:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _modified$[ebp+eax*4], 3
	je	$L1607
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _recog_operand[eax*4]
	mov	DWORD PTR -696+[ebp], eax
	jmp	$L1608
$L1607:
	mov	DWORD PTR -696+[ebp], 0
$L1608:
	push	0
	push	0
	mov	eax, DWORD PTR -680+[ebp]
	push	eax
	mov	eax, DWORD PTR -684+[ebp]
	push	eax
	mov	eax, DWORD PTR -688+[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _goal_alternative$[ebp+eax*4]
	push	eax
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _recog_operand_loc[eax*4]
	push	eax
	mov	eax, DWORD PTR -692+[ebp]
	push	eax
	mov	eax, DWORD PTR -696+[ebp]
	push	eax
	call	_push_reload
	add	esp, 40					; 00000028H
	mov	ecx, DWORD PTR _i$[ebp]
	mov	DWORD PTR _operand_reloadnum$[ebp+ecx*4], eax
; Line 1911
	jmp	$L1100
$L1099:
; Line 1912
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _modified$[ebp+eax*4], 1
	jne	$L1101
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _goal_alternative_matched$[ebp+eax*4]
	cmp	DWORD PTR _modified$[ebp+eax*4], 3
	jne	$L1101
; Line 1922
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _goal_alternative_matched$[ebp+eax*4]
	mov	eax, DWORD PTR _operand_mode$[ebp+eax*4]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _operand_mode$[ebp+eax*4]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _goal_alternative$[ebp+eax*4]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _goal_alternative_matched$[ebp+eax*4]
	mov	eax, DWORD PTR _recog_operand_loc[eax*4]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _recog_operand_loc[eax*4]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _goal_alternative_matched$[ebp+eax*4]
	mov	eax, DWORD PTR _recog_operand[eax*4]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _recog_operand[eax*4]
	push	eax
	call	_push_reload
	add	esp, 40					; 00000028H
	mov	ecx, DWORD PTR _i$[ebp]
	mov	DWORD PTR _operand_reloadnum$[ebp+ecx*4], eax
; Line 1923
	mov	eax, DWORD PTR _output_reloadnum$S477
	mov	ecx, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _goal_alternative_matched$[ebp+ecx*4]
	mov	DWORD PTR _operand_reloadnum$[ebp+ecx*4], eax
; Line 1925
	jmp	$L1102
$L1101:
; Line 1926
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _modified$[ebp+eax*4], 3
	jne	$L1103
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _goal_alternative_matched$[ebp+eax*4]
	cmp	DWORD PTR _modified$[ebp+eax*4], 1
	jne	$L1103
; Line 1936
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _operand_mode$[ebp+eax*4]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _goal_alternative_matched$[ebp+eax*4]
	mov	eax, DWORD PTR _operand_mode$[ebp+eax*4]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _goal_alternative$[ebp+eax*4]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _recog_operand_loc[eax*4]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _goal_alternative_matched$[ebp+eax*4]
	mov	eax, DWORD PTR _recog_operand_loc[eax*4]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _recog_operand[eax*4]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _goal_alternative_matched$[ebp+eax*4]
	mov	eax, DWORD PTR _recog_operand[eax*4]
	push	eax
	call	_push_reload
	add	esp, 40					; 00000028H
	mov	ecx, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _goal_alternative_matched$[ebp+ecx*4]
	mov	DWORD PTR _operand_reloadnum$[ebp+ecx*4], eax
; Line 1937
	mov	eax, DWORD PTR _output_reloadnum$S477
	mov	ecx, DWORD PTR _i$[ebp]
	mov	DWORD PTR _operand_reloadnum$[ebp+ecx*4], eax
; Line 1939
	jmp	$L1104
$L1103:
	cmp	DWORD PTR _insn_code_number$[ebp], 0
	jl	$L1105
; Line 1940
	call	_abort
; Line 1941
	jmp	$L1106
$L1105:
; Line 1943
	push	OFFSET $SG1107
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_error_for_asm
	add	esp, 8
; Line 1945
	mov	eax, DWORD PTR _const0_rtx
	push	eax
	push	0
	push	26					; 0000001aH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 1946
	mov	DWORD PTR _n_reloads, 0
; Line 1947
	jmp	$L835
; Line 1948
$L1106:
$L1104:
$L1102:
$L1100:
$L1098:
$L1096:
; Line 1950
	jmp	$L1108
$L1094:
; Line 1952
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _goal_alternative_matched$[ebp+eax*4], 0
	jge	$L1109
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _goal_alternative_matches$[ebp+eax*4], 0
	jge	$L1109
	cmp	DWORD PTR _optimize, 0
	je	$L1109
; Line 1954
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _recog_operand[eax*4]
	mov	DWORD PTR _operand$1110[ebp], eax
; Line 1960
$L1112:
	mov	eax, DWORD PTR _operand$1110[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1113
; Line 1961
	mov	eax, DWORD PTR _operand$1110[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _operand$1110[ebp], eax
	jmp	$L1112
$L1113:
; Line 1969
	mov	eax, DWORD PTR _operand$1110[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1114
	mov	eax, DWORD PTR _operand$1110[ebp]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L1114
	mov	eax, DWORD PTR _operand$1110[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	or	eax, eax
	jge	$L1114
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _goal_alternative$[ebp+eax*4], 0
	je	$L1114
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _modified$[ebp+eax*4], 1
	je	$L1115
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 917504				; 000e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1114
$L1115:
; Line 1979
	cmp	DWORD PTR _insn_code_number$[ebp], 0
	jl	$L1609
	mov	eax, DWORD PTR _insn_code_number$[ebp]
	mov	ecx, eax
	shl	eax, 3
	sub	eax, ecx
	mov	ecx, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR _insn_operand_strict_low[eax+ecx]
	mov	DWORD PTR -700+[ebp], eax
	jmp	$L1610
$L1609:
	mov	DWORD PTR -700+[ebp], 0
$L1610:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _modified$[ebp+eax*4], 1
	jne	$L1611
	mov	DWORD PTR -704+[ebp], 0
	jmp	$L1612
$L1611:
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _operand_mode$[ebp+eax*4]
	mov	DWORD PTR -704+[ebp], eax
$L1612:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _modified$[ebp+eax*4], 3
	jne	$L1613
	mov	DWORD PTR -708+[ebp], 0
	jmp	$L1614
$L1613:
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _operand_mode$[ebp+eax*4]
	mov	DWORD PTR -708+[ebp], eax
$L1614:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _modified$[ebp+eax*4], 1
	je	$L1615
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _recog_operand[eax*4]
	mov	DWORD PTR -712+[ebp], eax
	jmp	$L1616
$L1615:
	mov	DWORD PTR -712+[ebp], 0
$L1616:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _modified$[ebp+eax*4], 3
	je	$L1617
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _recog_operand[eax*4]
	mov	DWORD PTR -716+[ebp], eax
	jmp	$L1618
$L1617:
	mov	DWORD PTR -716+[ebp], 0
$L1618:
	push	0
	push	1
	mov	eax, DWORD PTR -700+[ebp]
	push	eax
	mov	eax, DWORD PTR -704+[ebp]
	push	eax
	mov	eax, DWORD PTR -708+[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _goal_alternative$[ebp+eax*4]
	push	eax
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _recog_operand_loc[eax*4]
	push	eax
	mov	eax, DWORD PTR -712+[ebp]
	push	eax
	mov	eax, DWORD PTR -716+[ebp]
	push	eax
	call	_push_reload
	add	esp, 40					; 00000028H
	mov	ecx, DWORD PTR _i$[ebp]
	mov	DWORD PTR _operand_reloadnum$[ebp+ecx*4], eax
; Line 1981
	jmp	$L1116
$L1114:
; Line 1986
	mov	eax, DWORD PTR _operand$1110[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1117
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _goal_alternative$[ebp+eax*4], 0
	je	$L1117
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _modified$[ebp+eax*4], 1
	je	$L1118
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 917504				; 000e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1117
$L1118:
; Line 1996
	cmp	DWORD PTR _insn_code_number$[ebp], 0
	jl	$L1619
	mov	eax, DWORD PTR _insn_code_number$[ebp]
	mov	ecx, eax
	shl	eax, 3
	sub	eax, ecx
	mov	ecx, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR _insn_operand_strict_low[eax+ecx]
	mov	DWORD PTR -720+[ebp], eax
	jmp	$L1620
$L1619:
	mov	DWORD PTR -720+[ebp], 0
$L1620:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _modified$[ebp+eax*4], 1
	jne	$L1621
	mov	DWORD PTR -724+[ebp], 0
	jmp	$L1622
$L1621:
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _operand_mode$[ebp+eax*4]
	mov	DWORD PTR -724+[ebp], eax
$L1622:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _modified$[ebp+eax*4], 3
	jne	$L1623
	mov	DWORD PTR -728+[ebp], 0
	jmp	$L1624
$L1623:
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _operand_mode$[ebp+eax*4]
	mov	DWORD PTR -728+[ebp], eax
$L1624:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _modified$[ebp+eax*4], 1
	je	$L1625
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _recog_operand[eax*4]
	mov	DWORD PTR -732+[ebp], eax
	jmp	$L1626
$L1625:
	mov	DWORD PTR -732+[ebp], 0
$L1626:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _modified$[ebp+eax*4], 3
	je	$L1627
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _recog_operand[eax*4]
	mov	DWORD PTR -736+[ebp], eax
	jmp	$L1628
$L1627:
	mov	DWORD PTR -736+[ebp], 0
$L1628:
	push	0
	push	1
	mov	eax, DWORD PTR -720+[ebp]
	push	eax
	mov	eax, DWORD PTR -724+[ebp]
	push	eax
	mov	eax, DWORD PTR -728+[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _goal_alternative$[ebp+eax*4]
	push	eax
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _recog_operand_loc[eax*4]
	push	eax
	mov	eax, DWORD PTR -732+[ebp]
	push	eax
	mov	eax, DWORD PTR -736+[ebp]
	push	eax
	call	_push_reload
	add	esp, 40					; 00000028H
	mov	ecx, DWORD PTR _i$[ebp]
	mov	DWORD PTR _operand_reloadnum$[ebp+ecx*4], eax
; Line 1997
$L1117:
$L1116:
; Line 2000
$L1109:
$L1108:
	jmp	$L1092
$L1093:
	cmp	DWORD PTR _goal_earlyclobber$[ebp], 0
	je	$L1119
; Line 2001
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L1120
$L1121:
	inc	DWORD PTR _i$[ebp]
$L1120:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _noperands$[ebp], eax
	jle	$L1122
; Line 2002
	mov	eax, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR _goal_alternative_earlyclobber$[ebp+eax]
	or	eax, eax
	je	$L1123
; Line 2003
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _recog_operand[eax*4]
	mov	ecx, DWORD PTR _n_earlyclobbers
	mov	DWORD PTR _reload_earlyclobbers[ecx*4], eax
	inc	DWORD PTR _n_earlyclobbers
; Line 2008
$L1123:
	jmp	$L1121
$L1122:
$L1119:
	cmp	DWORD PTR _insn_code_number$[ebp], 0
	jl	$L1124
; Line 2009
	mov	eax, DWORD PTR _insn_code_number$[ebp]
	mov	eax, DWORD PTR _insn_n_dups[eax*4]
	dec	eax
	mov	DWORD PTR _i$[ebp], eax
	jmp	$L1125
$L1126:
	dec	DWORD PTR _i$[ebp]
$L1125:
	cmp	DWORD PTR _i$[ebp], 0
	jl	$L1127
; Line 2011
	mov	eax, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR _recog_dup_num[eax]
	mov	DWORD PTR _opno$1128[ebp], eax
; Line 2012
	mov	eax, DWORD PTR _opno$1128[ebp]
	mov	eax, DWORD PTR _recog_operand_loc[eax*4]
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _recog_dup_loc[ecx*4]
	mov	DWORD PTR [ecx], eax
; Line 2013
	mov	eax, DWORD PTR _opno$1128[ebp]
	cmp	DWORD PTR _operand_reloadnum$[ebp+eax*4], 0
	jl	$L1129
; Line 2015
	mov	eax, DWORD PTR _opno$1128[ebp]
	mov	ecx, DWORD PTR _insn_code_number$[ebp]
	mov	edx, ecx
	shl	ecx, 3
	sub	ecx, edx
	shl	ecx, 2
	mov	eax, DWORD PTR _insn_operand_mode[ecx+eax*4]
	push	eax
	mov	eax, DWORD PTR _opno$1128[ebp]
	mov	eax, DWORD PTR _operand_reloadnum$[ebp+eax*4]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _recog_dup_loc[eax*4]
	push	eax
	call	_push_replacement
	add	esp, 12					; 0000000cH
; Line 2016
$L1129:
	jmp	$L1126
$L1127:
; Line 2143
$L1124:
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L1130
$L1131:
	inc	DWORD PTR _i$[ebp]
$L1130:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _n_reloads, eax
	jle	$L1132
; Line 2145
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _reload_when_needed[eax*4], 3
; Line 2147
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _reload_needed_for[eax*4], 0
	je	$L1133
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _reload_needed_for_multiple[eax*4], 0
	jne	$L1133
; Line 2150
	mov	DWORD PTR _output_address$1135[ebp], 0
; Line 2151
	mov	DWORD PTR _input_address$1136[ebp], 0
; Line 2152
	mov	DWORD PTR _operand_address$1137[ebp], 0
; Line 2160
	mov	DWORD PTR _j$1134[ebp], 0
	jmp	$L1138
$L1139:
	inc	DWORD PTR _j$1134[ebp]
$L1138:
	mov	eax, DWORD PTR _j$1134[ebp]
	cmp	DWORD PTR _n_reloads, eax
	jle	$L1140
; Line 2162
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _j$1134[ebp]
	mov	ecx, DWORD PTR _reload_in[ecx*4]
	cmp	DWORD PTR _reload_needed_for[eax*4], ecx
	je	$L1142
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _j$1134[ebp]
	mov	ecx, DWORD PTR _reload_out[ecx*4]
	cmp	DWORD PTR _reload_needed_for[eax*4], ecx
	jne	$L1141
$L1142:
; Line 2164
	mov	eax, DWORD PTR _j$1134[ebp]
	movsx	eax, BYTE PTR _reload_optional[eax]
	or	eax, eax
	je	$L1143
; Line 2165
	mov	DWORD PTR _operand_address$1137[ebp], 1
; Line 2166
	jmp	$L1144
$L1143:
; Line 2168
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _j$1134[ebp]
	mov	ecx, DWORD PTR _reload_in[ecx*4]
	cmp	DWORD PTR _reload_needed_for[eax*4], ecx
	jne	$L1145
; Line 2169
	mov	DWORD PTR _input_address$1136[ebp], 1
; Line 2170
$L1145:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _j$1134[ebp]
	mov	ecx, DWORD PTR _reload_out[ecx*4]
	cmp	DWORD PTR _reload_needed_for[eax*4], ecx
	jne	$L1146
; Line 2171
	mov	DWORD PTR _output_address$1135[ebp], 1
; Line 2172
$L1146:
$L1144:
; Line 2177
$L1141:
	jmp	$L1139
$L1140:
	cmp	DWORD PTR _input_address$1136[ebp], 0
	je	$L1147
	cmp	DWORD PTR _output_address$1135[ebp], 0
	jne	$L1147
	cmp	DWORD PTR _operand_address$1137[ebp], 0
	jne	$L1147
; Line 2178
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _reload_when_needed[eax*4], 0
; Line 2179
$L1147:
	cmp	DWORD PTR _output_address$1135[ebp], 0
	je	$L1148
	cmp	DWORD PTR _input_address$1136[ebp], 0
	jne	$L1148
	cmp	DWORD PTR _operand_address$1137[ebp], 0
	jne	$L1148
; Line 2180
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _reload_when_needed[eax*4], 1
; Line 2181
$L1148:
	cmp	DWORD PTR _operand_address$1137[ebp], 0
	je	$L1149
	cmp	DWORD PTR _input_address$1136[ebp], 0
	jne	$L1149
	cmp	DWORD PTR _output_address$1135[ebp], 0
	jne	$L1149
; Line 2182
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _reload_when_needed[eax*4], 2
; Line 2183
$L1149:
; Line 2184
$L1133:
	jmp	$L1131
$L1132:
; Line 2188
	cmp	DWORD PTR _goal_earlyclobber$[ebp], 0
	jne	$L1150
; Line 2189
	call	_combine_reloads
; Line 2190
$L1150:
$L835:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_find_reloads ENDP
_altnum$ = 12
_c$ = -4
_constraint$ = 8
_alternative_allows_memconst PROC NEAR
; Line 2199
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 2202
$L1156:
	cmp	DWORD PTR _altnum$[ebp], 0
	jle	$L1157
; Line 2204
$L1159:
	mov	eax, DWORD PTR _constraint$[ebp]
	mov	DWORD PTR -8+[ebp], eax
	inc	DWORD PTR _constraint$[ebp]
	mov	eax, DWORD PTR -8+[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 44					; 0000002cH
	je	$L1160
	jmp	$L1159
$L1160:
; Line 2205
	dec	DWORD PTR _altnum$[ebp]
; Line 2206
	jmp	$L1156
$L1157:
; Line 2209
$L1162:
	mov	eax, DWORD PTR _constraint$[ebp]
	movsx	eax, BYTE PTR [eax]
	mov	DWORD PTR _c$[ebp], eax
	inc	DWORD PTR _constraint$[ebp]
	cmp	DWORD PTR _c$[ebp], 0
	je	$L1163
	cmp	DWORD PTR _c$[ebp], 44			; 0000002cH
	je	$L1163
	cmp	DWORD PTR _c$[ebp], 35			; 00000023H
	je	$L1163
; Line 2210
	cmp	DWORD PTR _c$[ebp], 109			; 0000006dH
	je	$L1165
	cmp	DWORD PTR _c$[ebp], 111			; 0000006fH
	jne	$L1164
$L1165:
; Line 2211
	mov	eax, 1
	jmp	$L1153
; Line 2212
$L1164:
	jmp	$L1162
$L1163:
	sub	eax, eax
	jmp	$L1153
; Line 2213
$L1153:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_alternative_allows_memconst ENDP
_TEXT	ENDS
EXTRN	_plus_constant:NEAR
_TEXT	SEGMENT
_x$ = 8
_code$ = -8
_fmt$ = -12
_i$ = -4
_regno$1172 = -16
_tem$1177 = -20
_regno$1179 = -24
_size$1182 = -28
_offset$1186 = -36
_addr$1187 = -32
_find_reloads_toplev PROC NEAR
; Line 2225
	push	ebp
	mov	ebp, esp
	sub	esp, 36					; 00000024H
	push	ebx
	push	esi
	push	edi
; Line 2226
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$[ebp], eax
; Line 2228
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_format[eax*4]
	mov	DWORD PTR _fmt$[ebp], eax
; Line 2231
	cmp	DWORD PTR _code$[ebp], 34		; 00000022H
	jne	$L1171
; Line 2234
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _regno$1172[ebp], eax
; Line 2235
	mov	eax, DWORD PTR _regno$1172[ebp]
	mov	ecx, DWORD PTR _reg_equiv_constant
	cmp	DWORD PTR [ecx+eax*4], 0
	je	$L1173
; Line 2236
	mov	eax, DWORD PTR _regno$1172[ebp]
	mov	ecx, DWORD PTR _reg_equiv_constant
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _x$[ebp], eax
; Line 2243
	jmp	$L1174
$L1173:
	mov	eax, DWORD PTR _regno$1172[ebp]
	mov	ecx, DWORD PTR _reg_equiv_address
	cmp	DWORD PTR [ecx+eax*4], 0
	je	$L1175
; Line 2246
	mov	eax, DWORD PTR _regno$1172[ebp]
	mov	ecx, DWORD PTR _reg_equiv_address
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	37					; 00000025H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _x$[ebp], eax
; Line 2249
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	add	eax, 4
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	0
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	call	_find_reloads_address
	add	esp, 20					; 00000014H
; Line 2251
$L1175:
$L1174:
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L1167
; Line 2253
$L1171:
	cmp	DWORD PTR _code$[ebp], 37		; 00000025H
	jne	$L1176
; Line 2255
	mov	eax, DWORD PTR _x$[ebp]
	mov	DWORD PTR _tem$1177[ebp], eax
; Line 2256
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	add	eax, 4
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	lea	eax, DWORD PTR _tem$1177[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	call	_find_reloads_address
	add	esp, 20					; 00000014H
; Line 2257
	mov	eax, DWORD PTR _tem$1177[ebp]
	jmp	$L1167
; Line 2260
$L1176:
	cmp	DWORD PTR _code$[ebp], 35		; 00000023H
	jne	$L1178
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1178
; Line 2263
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _regno$1179[ebp], eax
; Line 2265
	cmp	DWORD PTR _regno$1179[ebp], 10		; 0000000aH
	jl	$L1180
	mov	eax, DWORD PTR _regno$1179[ebp]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	or	eax, eax
	jge	$L1180
	mov	eax, DWORD PTR _regno$1179[ebp]
	mov	ecx, DWORD PTR _reg_equiv_constant
	cmp	DWORD PTR [ecx+eax*4], 0
	je	$L1180
; Line 2268
	mov	eax, DWORD PTR _regno$1179[ebp]
	mov	ecx, DWORD PTR _reg_equiv_constant
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1181
; Line 2270
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	shl	eax, 3
	mov	DWORD PTR _size$1182[ebp], eax
; Line 2271
	cmp	DWORD PTR _size$1182[ebp], 32		; 00000020H
	jge	$L1183
; Line 2274
	mov	eax, DWORD PTR _regno$1179[ebp]
	mov	ecx, DWORD PTR _reg_equiv_constant
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	eax, DWORD PTR [eax+4]
	mov	edx, 1
	mov	cl, BYTE PTR _size$1182[ebp]
	shl	edx, cl
	dec	edx
	and	eax, edx
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	jmp	$L1167
; Line 2275
$L1183:
	mov	eax, DWORD PTR _regno$1179[ebp]
	mov	ecx, DWORD PTR _reg_equiv_constant
	mov	eax, DWORD PTR [ecx+eax*4]
	jmp	$L1167
; Line 2279
$L1181:
; Line 2284
	jmp	$L1184
$L1180:
	cmp	DWORD PTR _regno$1179[ebp], 10		; 0000000aH
	jl	$L1185
	mov	eax, DWORD PTR _regno$1179[ebp]
	mov	ecx, DWORD PTR _reg_equiv_address
	cmp	DWORD PTR [ecx+eax*4], 0
	je	$L1185
; Line 2286
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	shl	eax, 2
	mov	DWORD PTR _offset$1186[ebp], eax
; Line 2295
	mov	eax, DWORD PTR _offset$1186[ebp]
	push	eax
	mov	eax, DWORD PTR _regno$1179[ebp]
	mov	ecx, DWORD PTR _reg_equiv_address
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	call	_plus_constant
	add	esp, 8
	mov	DWORD PTR _addr$1187[ebp], eax
; Line 2296
	mov	eax, DWORD PTR _addr$1187[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	37					; 00000025H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _x$[ebp], eax
; Line 2299
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	add	eax, 4
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	0
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	call	_find_reloads_address
	add	esp, 20					; 00000014H
; Line 2302
$L1185:
$L1184:
; Line 2304
$L1178:
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_length[eax*4]
	dec	eax
	mov	DWORD PTR _i$[ebp], eax
	jmp	$L1188
$L1189:
	dec	DWORD PTR _i$[ebp]
$L1188:
	cmp	DWORD PTR _i$[ebp], 0
	jl	$L1190
; Line 2306
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 101				; 00000065H
	jne	$L1191
; Line 2307
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	push	eax
	call	_find_reloads_toplev
	add	esp, 4
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [edx+ecx*4+4], eax
; Line 2308
$L1191:
	jmp	$L1189
$L1190:
; Line 2309
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L1167
; Line 2310
$L1167:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_find_reloads_toplev ENDP
_TEXT	ENDS
_BSS	SEGMENT
_memlocs$S470 DD 023H DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
_ad$ = 8
_regno$ = 12
_i$ = -4
_tem$ = -8
_make_memloc PROC NEAR
; Line 2316
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 2318
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _reg_equiv_address
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _tem$[ebp], eax
; Line 2319
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L1198
$L1199:
	inc	DWORD PTR _i$[ebp]
$L1198:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _n_memlocs$S471, eax
	jle	$L1200
; Line 2320
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _memlocs$S470[eax*4]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _tem$[ebp]
	push	eax
	call	_rtx_equal_p
	add	esp, 8
	or	eax, eax
	je	$L1201
; Line 2321
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _memlocs$S470[eax*4]
	jmp	$L1195
; Line 2322
$L1201:
	jmp	$L1199
$L1200:
	mov	eax, DWORD PTR _tem$[ebp]
	push	eax
	mov	eax, DWORD PTR _ad$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	37					; 00000025H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _tem$[ebp], eax
; Line 2323
	mov	eax, DWORD PTR _tem$[ebp]
	mov	ecx, DWORD PTR _n_memlocs$S471
	mov	DWORD PTR _memlocs$S470[ecx*4], eax
	inc	DWORD PTR _n_memlocs$S471
; Line 2324
	mov	eax, DWORD PTR _tem$[ebp]
	jmp	$L1195
; Line 2325
$L1195:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_make_memloc ENDP
_TEXT	ENDS
EXTRN	_double_reg_address_ok:BYTE
EXTRN	_copy_rtx:NEAR
_BSS	SEGMENT
_subst_reg_equivs_changed$S476 DD 01H DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
_oldref$1222 = -16
_mode$ = 8
_memrefloc$ = 12
_ad$ = 16
_loc$ = 20
_operand$ = 24
_regno$ = -4
_tem$ = -8
_tem$1214 = -12
_find_reloads_address PROC NEAR
; Line 2345
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	push	ebx
	push	esi
	push	edi
; Line 2349
	mov	eax, DWORD PTR _ad$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1210
; Line 2351
	mov	eax, DWORD PTR _ad$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _regno$[ebp], eax
; Line 2353
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _reg_equiv_constant
	cmp	DWORD PTR [ecx+eax*4], 0
	je	$L1211
; Line 2355
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _reg_equiv_constant
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_strict_memory_address_p
	add	esp, 8
	or	eax, eax
	je	$L1212
; Line 2357
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _reg_equiv_constant
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _ad$[ebp], eax
	mov	eax, DWORD PTR _ad$[ebp]
	mov	ecx, DWORD PTR _loc$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 2358
	mov	eax, 1
	jmp	$L1207
; Line 2360
$L1212:
; Line 2372
$L1211:
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _reg_equiv_address
	cmp	DWORD PTR [ecx+eax*4], 0
	je	$L1213
; Line 2374
	mov	eax, DWORD PTR _regno$[ebp]
	push	eax
	mov	eax, DWORD PTR _ad$[ebp]
	push	eax
	call	_make_memloc
	add	esp, 8
	mov	DWORD PTR _tem$1214[ebp], eax
; Line 2378
	mov	eax, DWORD PTR _operand$[ebp]
	push	eax
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _tem$1214[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	10					; 0000000aH
	push	0
	mov	eax, DWORD PTR _tem$1214[ebp]
	add	eax, 4
	push	eax
	push	0
	mov	eax, DWORD PTR _tem$1214[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_push_reload
	add	esp, 40					; 00000028H
; Line 2381
	mov	eax, DWORD PTR _operand$[ebp]
	push	eax
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _ad$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	10					; 0000000aH
	push	0
	mov	eax, DWORD PTR _loc$[ebp]
	push	eax
	push	0
	mov	eax, DWORD PTR _tem$1214[ebp]
	push	eax
	call	_push_reload
	add	esp, 40					; 00000028H
; Line 2382
	mov	eax, 1
	jmp	$L1207
; Line 2384
$L1213:
; Line 2386
	cmp	DWORD PTR _regno$[ebp], 10		; 0000000aH
	jl	$L1631
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	or	eax, eax
	jge	$L1631
	mov	eax, DWORD PTR _indirect_ok$S473
	mov	DWORD PTR -20+[ebp], eax
	jmp	$L1632
$L1631:
	cmp	DWORD PTR _regno$[ebp], 7
	jle	$L1635
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	cmp	eax, 7
	ja	$L1633
$L1635:
	mov	DWORD PTR -20+[ebp], 1
	jmp	$L1634
$L1633:
	mov	DWORD PTR -20+[ebp], 0
$L1634:
$L1632:
	cmp	DWORD PTR -20+[ebp], 0
	jne	$L1215
; Line 2389
	mov	eax, DWORD PTR _operand$[ebp]
	push	eax
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _ad$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	10					; 0000000aH
	push	0
	mov	eax, DWORD PTR _loc$[ebp]
	push	eax
	push	0
	mov	eax, DWORD PTR _ad$[ebp]
	push	eax
	call	_push_reload
	add	esp, 40					; 00000028H
; Line 2390
	mov	eax, 1
	jmp	$L1207
; Line 2392
$L1215:
	sub	eax, eax
	jmp	$L1207
; Line 2395
$L1210:
	mov	eax, DWORD PTR _ad$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_strict_memory_address_p
	add	esp, 8
	or	eax, eax
	je	$L1216
; Line 2408
	mov	eax, DWORD PTR _ad$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1217
	mov	eax, DWORD PTR _ad$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1217
	mov	eax, DWORD PTR _ad$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1217
	mov	eax, DWORD PTR _ad$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg_equiv_constant
	cmp	DWORD PTR [ecx+eax*4], 0
	jne	$L1217
; Line 2409
	sub	eax, eax
	jmp	$L1207
; Line 2411
$L1217:
	mov	DWORD PTR _subst_reg_equivs_changed$S476, 0
; Line 2412
	mov	eax, DWORD PTR _ad$[ebp]
	push	eax
	call	_subst_reg_equivs
	add	esp, 4
	mov	ecx, DWORD PTR _loc$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 2414
	cmp	DWORD PTR _subst_reg_equivs_changed$S476, 0
	jne	$L1218
; Line 2415
	sub	eax, eax
	jmp	$L1207
; Line 2418
$L1218:
	mov	eax, DWORD PTR _ad$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_strict_memory_address_p
	add	esp, 8
	or	eax, eax
	je	$L1219
; Line 2419
	sub	eax, eax
	jmp	$L1207
; Line 2420
$L1219:
; Line 2424
$L1216:
; Line 2430
	mov	eax, DWORD PTR _ad$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1220
	mov	eax, DWORD PTR _ad$[ebp]
	mov	ecx, DWORD PTR _frame_pointer_rtx
	cmp	DWORD PTR [eax+4], ecx
	jne	$L1220
	mov	eax, DWORD PTR _ad$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1220
; Line 2433
	cmp	DWORD PTR _memrefloc$[ebp], 0
	je	$L1221
; Line 2435
	mov	eax, DWORD PTR _memrefloc$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _oldref$1222[ebp], eax
; Line 2436
	mov	eax, DWORD PTR _memrefloc$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_copy_rtx
	add	esp, 4
	mov	ecx, DWORD PTR _memrefloc$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 2437
	mov	eax, DWORD PTR _memrefloc$[ebp]
	mov	eax, DWORD PTR [eax]
	add	eax, 4
	mov	DWORD PTR _loc$[ebp], eax
; Line 2438
	mov	eax, DWORD PTR _oldref$1222[ebp]
	cmp	DWORD PTR _operand$[ebp], eax
	jne	$L1223
; Line 2439
	mov	eax, DWORD PTR _memrefloc$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _operand$[ebp], eax
; Line 2440
$L1223:
; Line 2441
$L1221:
	movsx	eax, BYTE PTR _double_reg_address_ok
	or	eax, eax
	je	$L1224
; Line 2444
	mov	eax, DWORD PTR _ad$[ebp]
	push	eax
	call	_copy_rtx
	add	esp, 4
	mov	DWORD PTR _ad$[ebp], eax
	mov	eax, DWORD PTR _ad$[ebp]
	mov	ecx, DWORD PTR _loc$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 2448
	mov	eax, DWORD PTR _operand$[ebp]
	push	eax
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _ad$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	9
	push	0
	mov	eax, DWORD PTR _ad$[ebp]
	add	eax, 8
	push	eax
	push	0
	mov	eax, DWORD PTR _ad$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_push_reload
	add	esp, 40					; 00000028H
; Line 2450
	jmp	$L1225
$L1224:
; Line 2456
	mov	eax, DWORD PTR _operand$[ebp]
	push	eax
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _ad$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	10					; 0000000aH
	push	0
	mov	eax, DWORD PTR _loc$[ebp]
	push	eax
	push	0
	mov	eax, DWORD PTR _ad$[ebp]
	push	eax
	call	_push_reload
	add	esp, 40					; 00000028H
; Line 2457
$L1225:
; Line 2458
	mov	eax, 1
	jmp	$L1207
; Line 2464
$L1220:
	mov	eax, DWORD PTR _ad$[ebp]
	mov	DWORD PTR _tem$[ebp], eax
; Line 2465
	mov	eax, DWORD PTR _ad$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1226
; Line 2466
	mov	eax, DWORD PTR _ad$[ebp]
	push	eax
	call	_subst_indexed_address
	add	esp, 4
	mov	DWORD PTR _tem$[ebp], eax
; Line 2467
$L1226:
	mov	eax, DWORD PTR _ad$[ebp]
	cmp	DWORD PTR _tem$[ebp], eax
	je	$L1227
	mov	eax, DWORD PTR _tem$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_strict_memory_address_p
	add	esp, 8
	or	eax, eax
	je	$L1227
; Line 2472
	mov	DWORD PTR _subst_reg_equivs_changed$S476, 0
; Line 2473
	mov	eax, DWORD PTR _tem$[ebp]
	push	eax
	call	_subst_reg_equivs
	add	esp, 4
	mov	DWORD PTR _tem$[ebp], eax
; Line 2477
	cmp	DWORD PTR _subst_reg_equivs_changed$S476, 0
	je	$L1229
	mov	eax, DWORD PTR _tem$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_strict_memory_address_p
	add	esp, 8
	or	eax, eax
	je	$L1228
$L1229:
; Line 2479
	mov	eax, DWORD PTR _tem$[ebp]
	mov	ecx, DWORD PTR _loc$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 2480
	sub	eax, eax
	jmp	$L1207
; Line 2482
$L1228:
; Line 2486
$L1227:
	mov	eax, DWORD PTR _ad$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1231
	mov	eax, DWORD PTR _ad$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1231
	mov	eax, DWORD PTR _ad$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1231
	mov	eax, DWORD PTR _ad$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1230
$L1231:
	mov	eax, DWORD PTR _ad$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_strict_memory_address_p
	add	esp, 8
	or	eax, eax
	jne	$L1230
; Line 2490
	mov	eax, DWORD PTR _operand$[ebp]
	push	eax
	push	0
	push	0
	push	0
	push	4
	push	10					; 0000000aH
	push	0
	mov	eax, DWORD PTR _loc$[ebp]
	push	eax
	push	0
	mov	eax, DWORD PTR _ad$[ebp]
	push	eax
	call	_push_reload
	add	esp, 40					; 00000028H
; Line 2491
	mov	eax, 1
	jmp	$L1207
; Line 2494
$L1230:
	mov	eax, DWORD PTR _operand$[ebp]
	push	eax
	mov	eax, DWORD PTR _loc$[ebp]
	push	eax
	push	0
	mov	eax, DWORD PTR _ad$[ebp]
	push	eax
	call	_find_reloads_address_1
	add	esp, 16					; 00000010H
	jmp	$L1207
; Line 2495
$L1207:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_find_reloads_address ENDP
_ad$ = 8
_code$ = -8
_i$ = -4
_fmt$ = -12
_regno$1243 = -16
_subst_reg_equivs PROC NEAR
; Line 2504
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	push	ebx
	push	esi
	push	edi
; Line 2505
	mov	eax, DWORD PTR _ad$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$[ebp], eax
; Line 2509
	mov	eax, DWORD PTR _code$[ebp]
	mov	DWORD PTR -20+[ebp], eax
	jmp	$L1237
; Line 2511
$L1241:
; Line 2518
	mov	eax, DWORD PTR _ad$[ebp]
	jmp	$L1233
; Line 2520
$L1242:
; Line 2522
	mov	eax, DWORD PTR _ad$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _regno$1243[ebp], eax
; Line 2524
	mov	eax, DWORD PTR _regno$1243[ebp]
	mov	ecx, DWORD PTR _reg_equiv_constant
	cmp	DWORD PTR [ecx+eax*4], 0
	je	$L1244
; Line 2526
	mov	DWORD PTR _subst_reg_equivs_changed$S476, 1
; Line 2527
	mov	eax, DWORD PTR _regno$1243[ebp]
	mov	ecx, DWORD PTR _reg_equiv_constant
	mov	eax, DWORD PTR [ecx+eax*4]
	jmp	$L1233
; Line 2529
$L1244:
; Line 2530
	mov	eax, DWORD PTR _ad$[ebp]
	jmp	$L1233
; Line 2532
$L1245:
; Line 2535
	mov	eax, DWORD PTR _ad$[ebp]
	mov	ecx, DWORD PTR _frame_pointer_rtx
	cmp	DWORD PTR [eax+4], ecx
	jne	$L1246
	mov	eax, DWORD PTR _ad$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1246
; Line 2536
	mov	eax, DWORD PTR _ad$[ebp]
	jmp	$L1233
; Line 2537
$L1246:
	jmp	$L1238
$L1237:
	sub	DWORD PTR -20+[ebp], 30			; 0000001eH
	cmp	DWORD PTR -20+[ebp], 14			; 0000000eH
	ja	$L1238
	shl	DWORD PTR -20+[ebp], 2
	mov	eax, DWORD PTR -20+[ebp]
	jmp	DWORD PTR $L1636[eax]
$L1636:
	DD	OFFSET $L1241
	DD	OFFSET $L1241
	DD	OFFSET $L1241
	DD	OFFSET $L1241
	DD	OFFSET $L1242
	DD	OFFSET $L1238
	DD	OFFSET $L1238
	DD	OFFSET $L1238
	DD	OFFSET $L1241
	DD	OFFSET $L1241
	DD	OFFSET $L1241
	DD	OFFSET $L1238
	DD	OFFSET $L1238
	DD	OFFSET $L1238
	DD	OFFSET $L1245
$L1238:
; Line 2539
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_format[eax*4]
	mov	DWORD PTR _fmt$[ebp], eax
; Line 2540
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_length[eax*4]
	dec	eax
	mov	DWORD PTR _i$[ebp], eax
	jmp	$L1247
$L1248:
	dec	DWORD PTR _i$[ebp]
$L1247:
	cmp	DWORD PTR _i$[ebp], 0
	jl	$L1249
; Line 2541
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 101				; 00000065H
	jne	$L1250
; Line 2542
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _ad$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	push	eax
	call	_subst_reg_equivs
	add	esp, 4
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _ad$[ebp]
	mov	DWORD PTR [edx+ecx*4+4], eax
; Line 2543
$L1250:
	jmp	$L1248
$L1249:
	mov	eax, DWORD PTR _ad$[ebp]
	jmp	$L1233
; Line 2544
$L1233:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_subst_reg_equivs ENDP
_addr$ = 8
_const_part$ = -12
_var_part$ = -8
_regno$ = -4
_subst_indexed_address PROC NEAR
; Line 2557
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	push	ebx
	push	esi
	push	edi
; Line 2558
	mov	DWORD PTR _const_part$[ebp], 0
; Line 2559
	mov	DWORD PTR _var_part$[ebp], 0
; Line 2562
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1256
; Line 2564
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1258
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1258
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1258
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1257
$L1258:
; Line 2566
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _const_part$[ebp], eax
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _var_part$[ebp], eax
; Line 2567
	jmp	$L1259
$L1257:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1261
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1261
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1261
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1260
$L1261:
; Line 2569
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _const_part$[ebp], eax
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _var_part$[ebp], eax
; Line 2570
	jmp	$L1262
$L1260:
; Line 2571
	mov	eax, DWORD PTR _addr$[ebp]
	mov	DWORD PTR _var_part$[ebp], eax
$L1262:
$L1259:
; Line 2573
	cmp	DWORD PTR _const_part$[ebp], 0
	je	$L1263
	mov	eax, DWORD PTR _const_part$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1263
; Line 2574
	mov	eax, DWORD PTR _const_part$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _const_part$[ebp], eax
; Line 2576
$L1263:
; Line 2579
	mov	eax, DWORD PTR _var_part$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1264
	mov	eax, DWORD PTR _var_part$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _regno$[ebp], eax
	cmp	DWORD PTR _regno$[ebp], 10		; 0000000aH
	jl	$L1264
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	or	eax, eax
	jge	$L1264
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _reg_equiv_constant
	cmp	DWORD PTR [ecx+eax*4], 0
	je	$L1264
; Line 2584
	cmp	DWORD PTR _const_part$[ebp], 0
	je	$L1637
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _reg_equiv_constant
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	mov	eax, DWORD PTR _const_part$[ebp]
	push	eax
	push	4
	push	44					; 0000002cH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	push	0
	push	32					; 00000020H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	jmp	$L1638
$L1637:
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _reg_equiv_constant
	mov	eax, DWORD PTR [ecx+eax*4]
$L1638:
	jmp	$L1252
; Line 2586
$L1264:
	mov	eax, DWORD PTR _var_part$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1265
; Line 2587
	mov	eax, DWORD PTR _addr$[ebp]
	jmp	$L1252
; Line 2589
$L1265:
; Line 2592
	mov	eax, DWORD PTR _var_part$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1266
	mov	eax, DWORD PTR _var_part$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _regno$[ebp], eax
	cmp	DWORD PTR _regno$[ebp], 10		; 0000000aH
	jl	$L1266
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	or	eax, eax
	jge	$L1266
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _reg_equiv_constant
	cmp	DWORD PTR [ecx+eax*4], 0
	je	$L1266
; Line 2598
	cmp	DWORD PTR _const_part$[ebp], 0
	je	$L1639
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _reg_equiv_constant
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	mov	eax, DWORD PTR _const_part$[ebp]
	push	eax
	push	4
	push	44					; 0000002cH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	push	0
	push	32					; 00000020H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR -16+[ebp], eax
	jmp	$L1640
$L1639:
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _reg_equiv_constant
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR -16+[ebp], eax
$L1640:
	mov	eax, DWORD PTR -16+[ebp]
	push	eax
	mov	eax, DWORD PTR _var_part$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	push	4
	push	44					; 0000002cH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L1252
; Line 2600
$L1266:
; Line 2603
	mov	eax, DWORD PTR _var_part$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1267
	mov	eax, DWORD PTR _var_part$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _regno$[ebp], eax
	cmp	DWORD PTR _regno$[ebp], 10		; 0000000aH
	jl	$L1267
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	or	eax, eax
	jge	$L1267
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _reg_equiv_constant
	cmp	DWORD PTR [ecx+eax*4], 0
	je	$L1267
; Line 2609
	cmp	DWORD PTR _const_part$[ebp], 0
	je	$L1641
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _reg_equiv_constant
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	mov	eax, DWORD PTR _const_part$[ebp]
	push	eax
	push	4
	push	44					; 0000002cH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	push	0
	push	32					; 00000020H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR -20+[ebp], eax
	jmp	$L1642
$L1641:
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _reg_equiv_constant
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR -20+[ebp], eax
$L1642:
	mov	eax, DWORD PTR -20+[ebp]
	push	eax
	mov	eax, DWORD PTR _var_part$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	4
	push	44					; 0000002cH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L1252
; Line 2610
$L1267:
; Line 2611
$L1256:
	mov	eax, DWORD PTR _addr$[ebp]
	jmp	$L1252
; Line 2612
$L1252:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_subst_indexed_address ENDP
_fmt$1344 = -56
_i$1345 = -52
_incremented$1319 = -24
_regno$1321 = -32
_value$1322 = -28
_tem$1325 = -36
_link$1329 = -40
_reloadnum$1330 = -44
_x$ = 8
_context$ = 12
_loc$ = 16
_operand$ = 20
_regno$1337 = -48
_code$ = -4
_op0$1275 = -20
_op1$1276 = -8
_code0$1277 = -16
_code1$1278 = -12
_find_reloads_address_1 PROC NEAR
; Line 2636
	push	ebp
	mov	ebp, esp
	sub	esp, 64					; 00000040H
	push	ebx
	push	esi
	push	edi
; Line 2637
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$[ebp], eax
; Line 2639
	cmp	DWORD PTR _code$[ebp], 44		; 0000002cH
	jne	$L1274
; Line 2641
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _op0$1275[ebp], eax
; Line 2642
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _op1$1276[ebp], eax
; Line 2643
	mov	eax, DWORD PTR _op0$1275[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code0$1277[ebp], eax
; Line 2644
	mov	eax, DWORD PTR _op1$1276[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code1$1278[ebp], eax
; Line 2645
	cmp	DWORD PTR _code0$1277[ebp], 47		; 0000002fH
	je	$L1280
	cmp	DWORD PTR _code0$1277[ebp], 77		; 0000004dH
	je	$L1280
	cmp	DWORD PTR _code1$1278[ebp], 37		; 00000025H
	jne	$L1279
$L1280:
; Line 2647
	mov	eax, DWORD PTR _operand$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	add	eax, 4
	push	eax
	push	1
	mov	eax, DWORD PTR _op0$1275[ebp]
	push	eax
	call	_find_reloads_address_1
	add	esp, 16					; 00000010H
; Line 2648
	mov	eax, DWORD PTR _operand$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	add	eax, 8
	push	eax
	push	0
	mov	eax, DWORD PTR _op1$1276[ebp]
	push	eax
	call	_find_reloads_address_1
	add	esp, 16					; 00000010H
; Line 2650
	jmp	$L1281
$L1279:
	cmp	DWORD PTR _code1$1278[ebp], 47		; 0000002fH
	je	$L1283
	cmp	DWORD PTR _code1$1278[ebp], 77		; 0000004dH
	je	$L1283
	cmp	DWORD PTR _code0$1277[ebp], 37		; 00000025H
	jne	$L1282
$L1283:
; Line 2652
	mov	eax, DWORD PTR _operand$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	add	eax, 4
	push	eax
	push	0
	mov	eax, DWORD PTR _op0$1275[ebp]
	push	eax
	call	_find_reloads_address_1
	add	esp, 16					; 00000010H
; Line 2653
	mov	eax, DWORD PTR _operand$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	add	eax, 8
	push	eax
	push	1
	mov	eax, DWORD PTR _op1$1276[ebp]
	push	eax
	call	_find_reloads_address_1
	add	esp, 16					; 00000010H
; Line 2655
	jmp	$L1284
$L1282:
; Line 2656
	cmp	DWORD PTR _code0$1277[ebp], 30		; 0000001eH
	je	$L1286
	cmp	DWORD PTR _code0$1277[ebp], 32		; 00000020H
	je	$L1286
	cmp	DWORD PTR _code0$1277[ebp], 39		; 00000027H
	je	$L1286
	cmp	DWORD PTR _code0$1277[ebp], 38		; 00000026H
	jne	$L1285
$L1286:
; Line 2658
	mov	eax, DWORD PTR _operand$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	add	eax, 8
	push	eax
	push	0
	mov	eax, DWORD PTR _op1$1276[ebp]
	push	eax
	call	_find_reloads_address_1
	add	esp, 16					; 00000010H
; Line 2660
	jmp	$L1287
$L1285:
; Line 2661
	cmp	DWORD PTR _code1$1278[ebp], 30		; 0000001eH
	je	$L1289
	cmp	DWORD PTR _code1$1278[ebp], 32		; 00000020H
	je	$L1289
	cmp	DWORD PTR _code1$1278[ebp], 39		; 00000027H
	je	$L1289
	cmp	DWORD PTR _code1$1278[ebp], 38		; 00000026H
	jne	$L1288
$L1289:
; Line 2663
	mov	eax, DWORD PTR _operand$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	add	eax, 4
	push	eax
	push	0
	mov	eax, DWORD PTR _op0$1275[ebp]
	push	eax
	call	_find_reloads_address_1
	add	esp, 16					; 00000010H
; Line 2665
	jmp	$L1290
$L1288:
	cmp	DWORD PTR _code0$1277[ebp], 34		; 00000022H
	jne	$L1291
	cmp	DWORD PTR _code1$1278[ebp], 34		; 00000022H
	jne	$L1291
; Line 2668
	mov	eax, DWORD PTR _op0$1275[ebp]
	cmp	DWORD PTR [eax+4], 7
	jl	$L1293
	mov	eax, DWORD PTR _op0$1275[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	cmp	eax, 7
	jae	$L1292
$L1293:
	mov	eax, DWORD PTR _op1$1276[ebp]
	cmp	DWORD PTR [eax+4], 7
	jle	$L1294
	mov	eax, DWORD PTR _op1$1276[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	cmp	eax, 7
	ja	$L1292
$L1294:
; Line 2669
	sub	eax, eax
	jmp	$L1272
; Line 2670
	jmp	$L1295
$L1292:
; Line 2671
	mov	eax, DWORD PTR _op1$1276[ebp]
	cmp	DWORD PTR [eax+4], 7
	jl	$L1297
	mov	eax, DWORD PTR _op1$1276[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	cmp	eax, 7
	jae	$L1296
$L1297:
	mov	eax, DWORD PTR _op0$1275[ebp]
	cmp	DWORD PTR [eax+4], 7
	jle	$L1298
	mov	eax, DWORD PTR _op0$1275[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	cmp	eax, 7
	ja	$L1296
$L1298:
; Line 2672
	sub	eax, eax
	jmp	$L1272
; Line 2673
	jmp	$L1299
$L1296:
	mov	eax, DWORD PTR _op1$1276[ebp]
	cmp	DWORD PTR [eax+4], 7
	jle	$L1301
	mov	eax, DWORD PTR _op1$1276[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	cmp	eax, 7
	ja	$L1300
$L1301:
; Line 2674
	mov	eax, DWORD PTR _operand$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	add	eax, 4
	push	eax
	push	1
	mov	eax, DWORD PTR _op0$1275[ebp]
	push	eax
	call	_find_reloads_address_1
	add	esp, 16					; 00000010H
; Line 2675
	jmp	$L1302
$L1300:
	mov	eax, DWORD PTR _op0$1275[ebp]
	cmp	DWORD PTR [eax+4], 7
	jle	$L1304
	mov	eax, DWORD PTR _op0$1275[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	cmp	eax, 7
	ja	$L1303
$L1304:
; Line 2676
	mov	eax, DWORD PTR _operand$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	add	eax, 8
	push	eax
	push	1
	mov	eax, DWORD PTR _op1$1276[ebp]
	push	eax
	call	_find_reloads_address_1
	add	esp, 16					; 00000010H
; Line 2677
	jmp	$L1305
$L1303:
	mov	eax, DWORD PTR _op1$1276[ebp]
	cmp	DWORD PTR [eax+4], 7
	jl	$L1307
	mov	eax, DWORD PTR _op1$1276[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	cmp	eax, 7
	jae	$L1306
$L1307:
; Line 2678
	mov	eax, DWORD PTR _operand$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	add	eax, 4
	push	eax
	push	0
	mov	eax, DWORD PTR _op0$1275[ebp]
	push	eax
	call	_find_reloads_address_1
	add	esp, 16					; 00000010H
; Line 2679
	jmp	$L1308
$L1306:
	mov	eax, DWORD PTR _op0$1275[ebp]
	cmp	DWORD PTR [eax+4], 7
	jl	$L1310
	mov	eax, DWORD PTR _op0$1275[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	cmp	eax, 7
	jae	$L1309
$L1310:
; Line 2680
	mov	eax, DWORD PTR _operand$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	add	eax, 8
	push	eax
	push	0
	mov	eax, DWORD PTR _op1$1276[ebp]
	push	eax
	call	_find_reloads_address_1
	add	esp, 16					; 00000010H
; Line 2681
	jmp	$L1311
$L1309:
; Line 2683
	mov	eax, DWORD PTR _operand$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	add	eax, 4
	push	eax
	push	1
	mov	eax, DWORD PTR _op0$1275[ebp]
	push	eax
	call	_find_reloads_address_1
	add	esp, 16					; 00000010H
; Line 2684
	mov	eax, DWORD PTR _operand$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	add	eax, 8
	push	eax
	push	0
	mov	eax, DWORD PTR _op1$1276[ebp]
	push	eax
	call	_find_reloads_address_1
	add	esp, 16					; 00000010H
; Line 2685
$L1311:
$L1308:
$L1305:
$L1302:
$L1299:
$L1295:
; Line 2687
	jmp	$L1312
$L1291:
	cmp	DWORD PTR _code0$1277[ebp], 34		; 00000022H
	jne	$L1313
; Line 2689
	mov	eax, DWORD PTR _operand$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	add	eax, 4
	push	eax
	push	1
	mov	eax, DWORD PTR _op0$1275[ebp]
	push	eax
	call	_find_reloads_address_1
	add	esp, 16					; 00000010H
; Line 2690
	mov	eax, DWORD PTR _operand$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	add	eax, 8
	push	eax
	push	0
	mov	eax, DWORD PTR _op1$1276[ebp]
	push	eax
	call	_find_reloads_address_1
	add	esp, 16					; 00000010H
; Line 2692
	jmp	$L1314
$L1313:
	cmp	DWORD PTR _code1$1278[ebp], 34		; 00000022H
	jne	$L1315
; Line 2694
	mov	eax, DWORD PTR _operand$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	add	eax, 8
	push	eax
	push	1
	mov	eax, DWORD PTR _op1$1276[ebp]
	push	eax
	call	_find_reloads_address_1
	add	esp, 16					; 00000010H
; Line 2695
	mov	eax, DWORD PTR _operand$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	add	eax, 4
	push	eax
	push	0
	mov	eax, DWORD PTR _op0$1275[ebp]
	push	eax
	call	_find_reloads_address_1
	add	esp, 16					; 00000010H
; Line 2697
$L1315:
$L1314:
$L1312:
$L1290:
$L1287:
$L1284:
$L1281:
; Line 2698
	jmp	$L1316
$L1274:
; Line 2699
	cmp	DWORD PTR _code$[ebp], 66		; 00000042H
	je	$L1318
	cmp	DWORD PTR _code$[ebp], 65		; 00000041H
	je	$L1318
	cmp	DWORD PTR _code$[ebp], 64		; 00000040H
	je	$L1318
	cmp	DWORD PTR _code$[ebp], 63		; 0000003fH
	jne	$L1317
$L1318:
; Line 2701
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _incremented$1319[ebp], eax
; Line 2703
	mov	eax, DWORD PTR _incremented$1319[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1320
; Line 2705
	mov	eax, DWORD PTR _incremented$1319[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _regno$1321[ebp], eax
; Line 2706
	mov	DWORD PTR _value$1322[ebp], 0
; Line 2710
	cmp	DWORD PTR _regno$1321[ebp], 10		; 0000000aH
	jl	$L1323
	mov	eax, DWORD PTR _regno$1321[ebp]
	mov	ecx, DWORD PTR _reg_equiv_constant
	cmp	DWORD PTR [ecx+eax*4], 0
	je	$L1323
; Line 2711
	call	_abort
; Line 2715
$L1323:
	mov	eax, DWORD PTR _regno$1321[ebp]
	mov	ecx, DWORD PTR _reg_equiv_address
	cmp	DWORD PTR [ecx+eax*4], 0
	je	$L1324
; Line 2717
	mov	eax, DWORD PTR _regno$1321[ebp]
	push	eax
	mov	eax, DWORD PTR _incremented$1319[ebp]
	push	eax
	call	_make_memloc
	add	esp, 8
	mov	DWORD PTR _tem$1325[ebp], eax
; Line 2722
	mov	eax, DWORD PTR _operand$[ebp]
	push	eax
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _tem$1325[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	10					; 0000000aH
	push	0
	mov	eax, DWORD PTR _tem$1325[ebp]
	add	eax, 4
	push	eax
	push	0
	mov	eax, DWORD PTR _tem$1325[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_push_reload
	add	esp, 40					; 00000028H
; Line 2724
	mov	eax, DWORD PTR _tem$1325[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	push	eax
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _x$[ebp], eax
; Line 2739
$L1324:
	mov	eax, DWORD PTR _regno$1321[ebp]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	or	eax, eax
	jl	$L1326
; Line 2740
	mov	eax, DWORD PTR _regno$1321[ebp]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	DWORD PTR _regno$1321[ebp], eax
; Line 2741
$L1326:
; Line 2743
	cmp	DWORD PTR _regno$1321[ebp], 10		; 0000000aH
	jge	$L1328
	cmp	DWORD PTR _context$[ebp], 0
	je	$L1643
	cmp	DWORD PTR _regno$1321[ebp], 7
	jl	$L1647
	mov	eax, DWORD PTR _regno$1321[ebp]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	cmp	eax, 7
	jae	$L1645
$L1647:
	mov	DWORD PTR -60+[ebp], 1
	jmp	$L1646
$L1645:
	mov	DWORD PTR -60+[ebp], 0
$L1646:
	jmp	$L1644
$L1643:
	cmp	DWORD PTR _regno$1321[ebp], 7
	jle	$L1650
	mov	eax, DWORD PTR _regno$1321[ebp]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	cmp	eax, 7
	ja	$L1648
$L1650:
	mov	DWORD PTR -60+[ebp], 1
	jmp	$L1649
$L1648:
	mov	DWORD PTR -60+[ebp], 0
$L1649:
$L1644:
	cmp	DWORD PTR -60+[ebp], 0
	jne	$L1327
$L1328:
; Line 2750
	mov	eax, DWORD PTR _operand$[ebp]
	push	eax
	push	0
	push	0
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	cmp	DWORD PTR _context$[ebp], 1
	sbb	eax, eax
	and	eax, 1
	add	eax, 9
	push	eax
	push	0
	mov	eax, DWORD PTR _loc$[ebp]
	push	eax
	push	0
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_push_reload
	add	esp, 40					; 00000028H
	mov	DWORD PTR _reloadnum$1330[ebp], eax
; Line 2752
	mov	eax, DWORD PTR _incremented$1319[ebp]
	push	eax
	mov	eax, DWORD PTR _this_insn$S472
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_find_inc_amount
	add	esp, 8
	mov	ecx, DWORD PTR _reloadnum$1330[ebp]
	mov	DWORD PTR _reload_inc[ecx*4], eax
; Line 2754
	mov	DWORD PTR _value$1322[ebp], 1
; Line 2759
	mov	eax, DWORD PTR _this_insn$S472
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR _link$1329[ebp], eax
	jmp	$L1331
$L1332:
	mov	eax, DWORD PTR _link$1329[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _link$1329[ebp], eax
$L1331:
	cmp	DWORD PTR _link$1329[ebp], 0
	je	$L1333
; Line 2761
	mov	eax, DWORD PTR _link$1329[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 33554432				; 02000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1334
	mov	eax, DWORD PTR _link$1329[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _incremented$1319[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L1334
; Line 2762
	push	0
	mov	eax, DWORD PTR _reloadnum$1330[ebp]
	push	eax
	mov	eax, DWORD PTR _link$1329[ebp]
	add	eax, 4
	push	eax
	call	_push_replacement
	add	esp, 12					; 0000000cH
; Line 2763
$L1334:
	jmp	$L1332
$L1333:
; Line 2764
$L1327:
	mov	eax, DWORD PTR _value$1322[ebp]
	jmp	$L1272
; Line 2766
$L1320:
; Line 2767
	jmp	$L1335
$L1317:
	cmp	DWORD PTR _code$[ebp], 34		; 00000022H
	jne	$L1336
; Line 2769
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _regno$1337[ebp], eax
; Line 2771
	mov	eax, DWORD PTR _regno$1337[ebp]
	mov	ecx, DWORD PTR _reg_equiv_constant
	cmp	DWORD PTR [ecx+eax*4], 0
	je	$L1338
; Line 2775
	mov	eax, DWORD PTR _operand$[ebp]
	push	eax
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	cmp	DWORD PTR _context$[ebp], 1
	sbb	eax, eax
	and	eax, 1
	add	eax, 9
	push	eax
	push	0
	mov	eax, DWORD PTR _loc$[ebp]
	push	eax
	push	0
	mov	eax, DWORD PTR _regno$1337[ebp]
	mov	ecx, DWORD PTR _reg_equiv_constant
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	call	_push_reload
	add	esp, 40					; 00000028H
; Line 2776
	mov	eax, 1
	jmp	$L1272
; Line 2789
$L1338:
	mov	eax, DWORD PTR _regno$1337[ebp]
	mov	ecx, DWORD PTR _reg_equiv_address
	cmp	DWORD PTR [ecx+eax*4], 0
	je	$L1339
; Line 2791
	mov	eax, DWORD PTR _regno$1337[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_make_memloc
	add	esp, 8
	mov	DWORD PTR _x$[ebp], eax
; Line 2794
	mov	eax, DWORD PTR _operand$[ebp]
	push	eax
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	10					; 0000000aH
	push	0
	mov	eax, DWORD PTR _x$[ebp]
	add	eax, 4
	push	eax
	push	0
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_push_reload
	add	esp, 40					; 00000028H
; Line 2797
$L1339:
	mov	eax, DWORD PTR _regno$1337[ebp]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	or	eax, eax
	jl	$L1340
; Line 2798
	mov	eax, DWORD PTR _regno$1337[ebp]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	DWORD PTR _regno$1337[ebp], eax
; Line 2799
$L1340:
; Line 2801
	cmp	DWORD PTR _regno$1337[ebp], 10		; 0000000aH
	jge	$L1342
	cmp	DWORD PTR _context$[ebp], 0
	je	$L1651
	cmp	DWORD PTR _regno$1337[ebp], 7
	jl	$L1655
	mov	eax, DWORD PTR _regno$1337[ebp]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	cmp	eax, 7
	jae	$L1653
$L1655:
	mov	DWORD PTR -64+[ebp], 1
	jmp	$L1654
$L1653:
	mov	DWORD PTR -64+[ebp], 0
$L1654:
	jmp	$L1652
$L1651:
	cmp	DWORD PTR _regno$1337[ebp], 7
	jle	$L1658
	mov	eax, DWORD PTR _regno$1337[ebp]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	cmp	eax, 7
	ja	$L1656
$L1658:
	mov	DWORD PTR -64+[ebp], 1
	jmp	$L1657
$L1656:
	mov	DWORD PTR -64+[ebp], 0
$L1657:
$L1652:
	cmp	DWORD PTR -64+[ebp], 0
	jne	$L1341
$L1342:
; Line 2805
	mov	eax, DWORD PTR _operand$[ebp]
	push	eax
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	cmp	DWORD PTR _context$[ebp], 1
	sbb	eax, eax
	and	eax, 1
	add	eax, 9
	push	eax
	push	0
	mov	eax, DWORD PTR _loc$[ebp]
	push	eax
	push	0
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_push_reload
	add	esp, 40					; 00000028H
; Line 2806
	mov	eax, 1
	jmp	$L1272
; Line 2808
$L1341:
; Line 2809
	jmp	$L1343
$L1336:
; Line 2811
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_format[eax*4]
	mov	DWORD PTR _fmt$1344[ebp], eax
; Line 2813
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_length[eax*4]
	dec	eax
	mov	DWORD PTR _i$1345[ebp], eax
	jmp	$L1346
$L1347:
	dec	DWORD PTR _i$1345[ebp]
$L1346:
	cmp	DWORD PTR _i$1345[ebp], 0
	jl	$L1348
; Line 2815
	mov	eax, DWORD PTR _i$1345[ebp]
	mov	ecx, DWORD PTR _fmt$1344[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 101				; 00000065H
	jne	$L1349
; Line 2816
	mov	eax, DWORD PTR _operand$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$1345[ebp]
	shl	eax, 2
	add	eax, DWORD PTR _x$[ebp]
	add	eax, 4
	push	eax
	mov	eax, DWORD PTR _context$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$1345[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	push	eax
	call	_find_reloads_address_1
	add	esp, 16					; 00000010H
; Line 2817
$L1349:
	jmp	$L1347
$L1348:
; Line 2818
$L1343:
$L1335:
$L1316:
; Line 2820
	sub	eax, eax
	jmp	$L1272
; Line 2821
$L1272:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_find_reloads_address_1 ENDP
_TEXT	ENDS
PUBLIC	_subst_reloads
_TEXT	SEGMENT
_i$ = -4
_r$1355 = -12
_reloadreg$1356 = -8
_subst_reloads PROC NEAR
; Line 2832
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 2835
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L1352
$L1353:
	inc	DWORD PTR _i$[ebp]
$L1352:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _n_replacements$S469, eax
	jle	$L1354
; Line 2837
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	lea	eax, DWORD PTR _replacements$S468[eax*4]
	mov	DWORD PTR _r$1355[ebp], eax
; Line 2838
	mov	eax, DWORD PTR _r$1355[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR _reload_reg_rtx[eax*4]
	mov	DWORD PTR _reloadreg$1356[ebp], eax
; Line 2839
	cmp	DWORD PTR _reloadreg$1356[ebp], 0
	je	$L1357
; Line 2843
	mov	eax, DWORD PTR _reloadreg$1356[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	mov	ecx, DWORD PTR _r$1355[ebp]
	cmp	eax, DWORD PTR [ecx+8]
	je	$L1358
	mov	eax, DWORD PTR _r$1355[ebp]
	cmp	DWORD PTR [eax+8], 0
	je	$L1358
; Line 2844
	push	0
	mov	eax, DWORD PTR _reloadreg$1356[ebp]
	push	eax
	mov	eax, DWORD PTR _r$1355[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	push	35					; 00000023H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	DWORD PTR _reloadreg$1356[ebp], eax
; Line 2845
$L1358:
	mov	eax, DWORD PTR _reloadreg$1356[ebp]
	mov	ecx, DWORD PTR _r$1355[ebp]
	mov	ecx, DWORD PTR [ecx]
	mov	DWORD PTR [ecx], eax
; Line 2848
	jmp	$L1359
$L1357:
	mov	eax, DWORD PTR _r$1355[ebp]
	mov	eax, DWORD PTR [eax+4]
	movsx	eax, BYTE PTR _reload_optional[eax]
	or	eax, eax
	jne	$L1360
; Line 2849
	call	_abort
; Line 2850
$L1360:
$L1359:
	jmp	$L1353
$L1354:
; Line 2851
$L1350:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_subst_reloads ENDP
_TEXT	ENDS
EXTRN	_reload_first_uid:DWORD
EXTRN	_call_used_regs:TBYTE
EXTRN	_rtx_addr_varies_p:NEAR
EXTRN	_push_operand:NEAR
EXTRN	_rtx_renumbered_equal_p:NEAR
EXTRN	_flag_float_store:DWORD
_TEXT	SEGMENT
_xregno$1475 = -96
_xnregs$1476 = -92
_link$1484 = -100
_i$1422 = -56
_incno$1489 = -104
_goal$ = 8
_insn$ = 12
_regno1$1427 = -60
_class$ = 16
_nregs1$1428 = -64
_other$ = 20
_reload_reg_p$ = 24
_goalreg$ = 28
_mode$ = 32
_p$ = -40
_valtry$ = -16
_value$ = -12
_where$ = -36
_pat$ = -48
_regno$ = -24
_valueno$ = -32
_goal_mem$ = -20
_goal_const$ = -8
_goal_mem_addr_varies$ = -4
_nregs$ = -44
_dest$1444 = -68
_valuenregs$ = -28
_xregno$1450 = -76
_code$1386 = -52
_xnregs$1451 = -72
_i$1462 = -80
_v1$1466 = -84
_dest$1469 = -88
_find_equiv_reg PROC NEAR
; Line 2947
	push	ebp
	mov	ebp, esp
	sub	esp, 124				; 0000007cH
	push	ebx
	push	esi
	push	edi
; Line 2948
	mov	eax, DWORD PTR _insn$[ebp]
	mov	DWORD PTR _p$[ebp], eax
; Line 2951
	mov	DWORD PTR _regno$[ebp], -1
; Line 2953
	mov	DWORD PTR _goal_mem$[ebp], 0
; Line 2954
	mov	DWORD PTR _goal_const$[ebp], 0
; Line 2955
	mov	DWORD PTR _goal_mem_addr_varies$[ebp], 0
; Line 2959
	cmp	DWORD PTR _goal$[ebp], 0
	jne	$L1381
; Line 2960
	mov	eax, DWORD PTR _goalreg$[ebp]
	mov	DWORD PTR _regno$[ebp], eax
; Line 2961
	jmp	$L1382
$L1381:
	mov	eax, DWORD PTR _goal$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1383
; Line 2962
	mov	eax, DWORD PTR _goal$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _regno$[ebp], eax
; Line 2963
	jmp	$L1384
$L1383:
	mov	eax, DWORD PTR _goal$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1385
; Line 2965
	mov	eax, DWORD PTR _goal$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$1386[ebp], eax
; Line 2966
	mov	eax, DWORD PTR _goal$[ebp]
	mov	eax, DWORD PTR [eax]
	shr	eax, 27					; 0000001bH
	test	al, 1
	je	$L1387
; Line 2967
	sub	eax, eax
	jmp	$L1368
; Line 2968
$L1387:
; Line 2969
	cmp	DWORD PTR _flag_float_store, 0
	je	$L1388
	mov	eax, DWORD PTR _goal$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 184549376				; 0b000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L1389
	mov	eax, DWORD PTR _goal$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 167772160				; 0a000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1388
$L1389:
; Line 2970
	sub	eax, eax
	jmp	$L1368
; Line 2972
$L1388:
	mov	eax, DWORD PTR _code$1386[ebp]
	mov	DWORD PTR -124+[ebp], eax
	jmp	$L1390
; Line 2974
$L1394:
; Line 2978
	sub	eax, eax
	jmp	$L1368
; Line 2979
	jmp	$L1391
$L1390:
	cmp	DWORD PTR -124+[ebp], 63		; 0000003fH
	jl	$L1391
	cmp	DWORD PTR -124+[ebp], 66		; 00000042H
	jle	$L1394
	jmp	$L1391
$L1391:
; Line 2980
	mov	DWORD PTR _goal_mem$[ebp], 1
; Line 2982
	jmp	$L1395
$L1385:
	mov	eax, DWORD PTR _goal$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1397
	mov	eax, DWORD PTR _goal$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1397
	mov	eax, DWORD PTR _goal$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1397
	mov	eax, DWORD PTR _goal$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1396
$L1397:
; Line 2983
	mov	DWORD PTR _goal_const$[ebp], 1
; Line 2984
	jmp	$L1398
$L1396:
; Line 2985
	sub	eax, eax
	jmp	$L1368
$L1398:
$L1395:
$L1384:
$L1382:
; Line 2992
	cmp	DWORD PTR _regno$[ebp], 0
	jl	$L1399
	cmp	DWORD PTR _regno$[ebp], 10		; 0000000aH
	jge	$L1399
	cmp	DWORD PTR _regno$[ebp], 8
	jl	$L1399
	cmp	DWORD PTR _regno$[ebp], 10		; 0000000aH
	jge	$L1399
; Line 2993
	sub	eax, eax
	jmp	$L1368
; Line 3000
$L1399:
$L1401:
; Line 3002
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _p$[ebp], eax
; Line 3003
	cmp	DWORD PTR _p$[ebp], 0
	je	$L1404
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1114112				; 00110000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1403
$L1404:
; Line 3004
	sub	eax, eax
	jmp	$L1368
; Line 3005
$L1403:
; Line 3015
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 851968				; 000d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1405
	cmp	DWORD PTR _reload_reg_p$[ebp], 0
	je	$L1406
	cmp	DWORD PTR _reload_reg_p$[ebp], 1
	je	$L1406
	mov	eax, DWORD PTR _p$[ebp]
	mov	ecx, DWORD PTR _reload_first_uid
	cmp	DWORD PTR [eax+4], ecx
	jge	$L1405
$L1406:
; Line 3017
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _pat$[ebp], eax
; Line 3037
	mov	eax, DWORD PTR _pat$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1408
	cmp	DWORD PTR _regno$[ebp], 0
	jl	$L1410
	mov	eax, DWORD PTR _pat$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1410
	mov	eax, DWORD PTR _pat$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _regno$[ebp]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L1410
	mov	eax, DWORD PTR _pat$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _valtry$[ebp], eax
	mov	eax, DWORD PTR _valtry$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1409
$L1410:
	cmp	DWORD PTR _regno$[ebp], 0
	jl	$L1411
	mov	eax, DWORD PTR _pat$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1411
	mov	eax, DWORD PTR _pat$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _regno$[ebp]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L1411
	mov	eax, DWORD PTR _pat$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _valtry$[ebp], eax
	mov	eax, DWORD PTR _valtry$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1409
$L1411:
	cmp	DWORD PTR _goal_const$[ebp], 0
	je	$L1412
	mov	eax, DWORD PTR _goal$[ebp]
	push	eax
	mov	eax, DWORD PTR _pat$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_rtx_equal_p
	add	esp, 8
	or	eax, eax
	je	$L1412
	mov	eax, DWORD PTR _pat$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _valtry$[ebp], eax
	mov	eax, DWORD PTR _valtry$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1409
$L1412:
	cmp	DWORD PTR _goal_mem$[ebp], 0
	je	$L1413
	mov	eax, DWORD PTR _pat$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _valtry$[ebp], eax
	mov	eax, DWORD PTR _valtry$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1413
	mov	eax, DWORD PTR _pat$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _goal$[ebp]
	push	eax
	call	_rtx_renumbered_equal_p
	add	esp, 8
	or	eax, eax
	jne	$L1409
$L1413:
	cmp	DWORD PTR _goal_mem$[ebp], 0
	je	$L1408
	mov	eax, DWORD PTR _pat$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _valtry$[ebp], eax
	mov	eax, DWORD PTR _valtry$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1408
	mov	eax, DWORD PTR _pat$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _goal$[ebp]
	push	eax
	call	_rtx_renumbered_equal_p
	add	esp, 8
	or	eax, eax
	je	$L1408
$L1409:
; Line 3042
	mov	eax, DWORD PTR _valtry$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _valueno$[ebp], eax
	cmp	DWORD PTR _other$[ebp], 0
	jl	$L1659
	mov	eax, DWORD PTR _other$[ebp]
	sub	eax, DWORD PTR _valueno$[ebp]
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	mov	DWORD PTR -108+[ebp], eax
	jmp	$L1660
$L1659:
	cmp	DWORD PTR _valueno$[ebp], 10		; 0000000aH
	jae	$L1661
	mov	eax, DWORD PTR _class$[ebp]
	movsx	eax, WORD PTR _reg_class_contents[eax*2]
	mov	edx, 1
	mov	cl, BYTE PTR _valueno$[ebp]
	shl	edx, cl
	test	eax, edx
	je	$L1661
	mov	DWORD PTR -108+[ebp], 1
	jmp	$L1662
$L1661:
	mov	DWORD PTR -108+[ebp], 0
$L1662:
$L1660:
	cmp	DWORD PTR -108+[ebp], 0
	je	$L1414
; Line 3045
	mov	eax, DWORD PTR _valtry$[ebp]
	mov	DWORD PTR _value$[ebp], eax
; Line 3046
	mov	eax, DWORD PTR _p$[ebp]
	mov	DWORD PTR _where$[ebp], eax
; Line 3047
	jmp	$L1402
; Line 3049
$L1414:
$L1408:
; Line 3050
$L1405:
	jmp	$L1401
$L1402:
; Line 3060
	cmp	DWORD PTR _valueno$[ebp], 7
	jne	$L1415
; Line 3061
	sub	eax, eax
	jmp	$L1368
; Line 3064
$L1415:
	mov	eax, DWORD PTR _value$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	cmp	eax, DWORD PTR _mode$[ebp]
	je	$L1416
; Line 3065
	sub	eax, eax
	jmp	$L1368
; Line 3070
$L1416:
; Line 3073
	cmp	DWORD PTR _goal_mem$[ebp], 0
	je	$L1417
	mov	eax, DWORD PTR _where$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _value$[ebp]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L1417
	cmp	DWORD PTR _valueno$[ebp], 8
	jl	$L1663
	mov	DWORD PTR -112+[ebp], 1
	jmp	$L1664
$L1663:
	mov	eax, DWORD PTR _mode$[ebp]
	mov	eax, DWORD PTR _mode_size[eax*4]
	add	eax, 3
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	mov	DWORD PTR -112+[ebp], eax
$L1664:
	push	0
	mov	eax, DWORD PTR _goal$[ebp]
	push	eax
	mov	eax, DWORD PTR _valueno$[ebp]
	add	eax, DWORD PTR -112+[ebp]
	push	eax
	mov	eax, DWORD PTR _valueno$[ebp]
	push	eax
	call	_refers_to_regno_p
	add	esp, 16					; 00000010H
	or	eax, eax
	je	$L1417
; Line 3074
	sub	eax, eax
	jmp	$L1368
; Line 3078
$L1417:
; Line 3080
	cmp	DWORD PTR _goal_mem$[ebp], 0
	jne	$L1418
	cmp	DWORD PTR _goal_const$[ebp], 0
	jne	$L1418
	cmp	DWORD PTR _regno$[ebp], 8
	jl	$L1665
	mov	DWORD PTR -116+[ebp], 1
	jmp	$L1666
$L1665:
	mov	eax, DWORD PTR _mode$[ebp]
	mov	eax, DWORD PTR _mode_size[eax*4]
	add	eax, 3
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	mov	DWORD PTR -116+[ebp], eax
$L1666:
	mov	eax, DWORD PTR _regno$[ebp]
	add	eax, DWORD PTR -116+[ebp]
	cmp	eax, DWORD PTR _valueno$[ebp]
	jle	$L1418
	cmp	DWORD PTR _valueno$[ebp], 8
	jl	$L1667
	mov	DWORD PTR -120+[ebp], 1
	jmp	$L1668
$L1667:
	mov	eax, DWORD PTR _mode$[ebp]
	mov	eax, DWORD PTR _mode_size[eax*4]
	add	eax, 3
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	mov	DWORD PTR -120+[ebp], eax
$L1668:
	mov	eax, DWORD PTR _valueno$[ebp]
	add	eax, DWORD PTR -120+[ebp]
	cmp	eax, DWORD PTR _regno$[ebp]
	jle	$L1418
; Line 3081
	sub	eax, eax
	jmp	$L1368
; Line 3089
$L1418:
; Line 3090
	cmp	DWORD PTR _reload_reg_p$[ebp], 0
	je	$L1419
	cmp	DWORD PTR _reload_reg_p$[ebp], 1
	je	$L1419
	mov	eax, DWORD PTR _valueno$[ebp]
	mov	ecx, DWORD PTR _reload_reg_p$[ebp]
	movsx	eax, WORD PTR [ecx+eax*2]
	or	eax, eax
	jl	$L1419
; Line 3091
	sub	eax, eax
	jmp	$L1368
; Line 3097
$L1419:
	cmp	DWORD PTR _valueno$[ebp], 8
	jl	$L1420
	cmp	DWORD PTR _valueno$[ebp], 10		; 0000000aH
	jge	$L1420
; Line 3098
	sub	eax, eax
	jmp	$L1368
; Line 3101
$L1420:
	cmp	DWORD PTR _regno$[ebp], 8
	jl	$L1669
	mov	DWORD PTR _nregs$[ebp], 1
	jmp	$L1670
$L1669:
	mov	eax, DWORD PTR _mode$[ebp]
	mov	eax, DWORD PTR _mode_size[eax*4]
	add	eax, 3
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	mov	DWORD PTR _nregs$[ebp], eax
$L1670:
; Line 3102
	cmp	DWORD PTR _valueno$[ebp], 8
	jl	$L1671
	mov	DWORD PTR _valuenregs$[ebp], 1
	jmp	$L1672
$L1671:
	mov	eax, DWORD PTR _mode$[ebp]
	mov	eax, DWORD PTR _mode_size[eax*4]
	add	eax, 3
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	mov	DWORD PTR _valuenregs$[ebp], eax
$L1672:
; Line 3107
	cmp	DWORD PTR _reload_reg_p$[ebp], 0
	je	$L1421
; Line 3110
	mov	DWORD PTR _i$1422[ebp], 0
	jmp	$L1423
$L1424:
	inc	DWORD PTR _i$1422[ebp]
$L1423:
	mov	eax, DWORD PTR _i$1422[ebp]
	cmp	DWORD PTR _n_reloads, eax
	jle	$L1425
; Line 3111
	mov	eax, DWORD PTR _i$1422[ebp]
	cmp	DWORD PTR _reload_reg_rtx[eax*4], 0
	je	$L1426
	mov	eax, DWORD PTR _i$1422[ebp]
	cmp	DWORD PTR _reload_in[eax*4], 0
	je	$L1426
; Line 3113
	mov	eax, DWORD PTR _i$1422[ebp]
	mov	eax, DWORD PTR _reload_reg_rtx[eax*4]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _regno1$1427[ebp], eax
; Line 3115
	cmp	DWORD PTR _regno1$1427[ebp], 8
	jl	$L1673
	mov	DWORD PTR _nregs1$1428[ebp], 1
	jmp	$L1674
$L1673:
	mov	eax, DWORD PTR _i$1422[ebp]
	mov	eax, DWORD PTR _reload_reg_rtx[eax*4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	add	eax, 3
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	mov	DWORD PTR _nregs1$1428[ebp], eax
$L1674:
; Line 3117
	mov	eax, DWORD PTR _valuenregs$[ebp]
	add	eax, DWORD PTR _valueno$[ebp]
	cmp	eax, DWORD PTR _regno1$1427[ebp]
	jle	$L1429
	mov	eax, DWORD PTR _nregs1$1428[ebp]
	add	eax, DWORD PTR _regno1$1427[ebp]
	cmp	eax, DWORD PTR _valueno$[ebp]
	jle	$L1429
; Line 3118
	sub	eax, eax
	jmp	$L1368
; Line 3119
$L1429:
; Line 3120
$L1426:
	jmp	$L1424
$L1425:
; Line 3122
$L1421:
	cmp	DWORD PTR _goal_mem$[ebp], 0
	je	$L1430
; Line 3123
	mov	eax, DWORD PTR _goal$[ebp]
	push	eax
	call	_rtx_addr_varies_p
	add	esp, 4
	mov	DWORD PTR _goal_mem_addr_varies$[ebp], eax
; Line 3128
$L1430:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	DWORD PTR _p$[ebp], eax
; Line 3129
$L1433:
; Line 3131
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _p$[ebp], eax
; Line 3132
	mov	eax, DWORD PTR _p$[ebp]
	cmp	DWORD PTR _where$[ebp], eax
	jne	$L1435
; Line 3133
	mov	eax, DWORD PTR _value$[ebp]
	jmp	$L1368
; Line 3137
$L1435:
; Line 3144
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 983040				; 000f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1436
	cmp	DWORD PTR _regno$[ebp], 0
	jl	$L1438
	cmp	DWORD PTR _regno$[ebp], 10		; 0000000aH
	jge	$L1438
	mov	eax, DWORD PTR _regno$[ebp]
	movsx	eax, BYTE PTR _call_used_regs[eax]
	or	eax, eax
	jne	$L1437
$L1438:
	cmp	DWORD PTR _valueno$[ebp], 0
	jl	$L1439
	cmp	DWORD PTR _valueno$[ebp], 10		; 0000000aH
	jge	$L1439
	mov	eax, DWORD PTR _valueno$[ebp]
	movsx	eax, BYTE PTR _call_used_regs[eax]
	or	eax, eax
	jne	$L1437
$L1439:
	cmp	DWORD PTR _goal_mem$[ebp], 0
	je	$L1436
$L1437:
; Line 3145
	sub	eax, eax
	jmp	$L1368
; Line 3147
$L1436:
; Line 3148
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 851968				; 000d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1441
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 917504				; 000e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1441
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 983040				; 000f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1440
$L1441:
; Line 3156
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _pat$[ebp], eax
; Line 3157
	mov	eax, DWORD PTR _pat$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1443
	mov	eax, DWORD PTR _pat$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1769472				; 001b0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1442
$L1443:
; Line 3159
	mov	eax, DWORD PTR _pat$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _dest$1444[ebp], eax
; Line 3163
$L1446:
	mov	eax, DWORD PTR _dest$1444[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1448
	mov	eax, DWORD PTR _dest$1444[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 5898240				; 005a0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1448
	mov	eax, DWORD PTR _dest$1444[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 5832704				; 00590000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1448
	mov	eax, DWORD PTR _dest$1444[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2359296				; 00240000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1447
$L1448:
; Line 3164
	mov	eax, DWORD PTR _dest$1444[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _dest$1444[ebp], eax
	jmp	$L1446
$L1447:
; Line 3165
	mov	eax, DWORD PTR _dest$1444[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1449
; Line 3167
	mov	eax, DWORD PTR _dest$1444[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _xregno$1450[ebp], eax
; Line 3169
	mov	eax, DWORD PTR _dest$1444[ebp]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jge	$L1452
; Line 3170
	cmp	DWORD PTR _xregno$1450[ebp], 8
	jl	$L1675
	mov	DWORD PTR _xnregs$1451[ebp], 1
	jmp	$L1676
$L1675:
	mov	eax, DWORD PTR _dest$1444[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	add	eax, 3
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	mov	DWORD PTR _xnregs$1451[ebp], eax
$L1676:
; Line 3171
	jmp	$L1453
$L1452:
; Line 3172
	mov	DWORD PTR _xnregs$1451[ebp], 1
$L1453:
; Line 3173
	mov	eax, DWORD PTR _nregs$[ebp]
	add	eax, DWORD PTR _regno$[ebp]
	cmp	eax, DWORD PTR _xregno$1450[ebp]
	jle	$L1454
	mov	eax, DWORD PTR _xnregs$1451[ebp]
	add	eax, DWORD PTR _xregno$1450[ebp]
	cmp	eax, DWORD PTR _regno$[ebp]
	jle	$L1454
; Line 3174
	sub	eax, eax
	jmp	$L1368
; Line 3175
$L1454:
; Line 3176
	mov	eax, DWORD PTR _valuenregs$[ebp]
	add	eax, DWORD PTR _valueno$[ebp]
	cmp	eax, DWORD PTR _xregno$1450[ebp]
	jle	$L1455
	mov	eax, DWORD PTR _xnregs$1451[ebp]
	add	eax, DWORD PTR _xregno$1450[ebp]
	cmp	eax, DWORD PTR _valueno$[ebp]
	jle	$L1455
; Line 3177
	sub	eax, eax
	jmp	$L1368
; Line 3178
$L1455:
	cmp	DWORD PTR _goal_mem_addr_varies$[ebp], 0
	je	$L1456
; Line 3179
	sub	eax, eax
	jmp	$L1368
; Line 3180
$L1456:
; Line 3181
	jmp	$L1457
$L1449:
; Line 3182
	cmp	DWORD PTR _goal_mem$[ebp], 0
	je	$L1459
	mov	eax, DWORD PTR _dest$1444[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1459
	mov	eax, DWORD PTR _dest$1444[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	mov	eax, DWORD PTR _dest$1444[ebp]
	push	eax
	call	_push_operand
	add	esp, 8
	or	eax, eax
	jne	$L1459
; Line 3183
	sub	eax, eax
	jmp	$L1368
; Line 3184
$L1459:
$L1457:
; Line 3185
	jmp	$L1460
$L1442:
	mov	eax, DWORD PTR _pat$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1310720				; 00140000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1461
; Line 3188
	mov	eax, DWORD PTR _pat$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	dec	eax
	mov	DWORD PTR _i$1462[ebp], eax
	jmp	$L1463
$L1464:
	dec	DWORD PTR _i$1462[ebp]
$L1463:
	cmp	DWORD PTR _i$1462[ebp], 0
	jl	$L1465
; Line 3190
	mov	eax, DWORD PTR _pat$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _i$1462[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	mov	DWORD PTR _v1$1466[ebp], eax
; Line 3191
	mov	eax, DWORD PTR _v1$1466[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1468
	mov	eax, DWORD PTR _v1$1466[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1769472				; 001b0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1467
$L1468:
; Line 3193
	mov	eax, DWORD PTR _v1$1466[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _dest$1469[ebp], eax
; Line 3197
$L1471:
	mov	eax, DWORD PTR _dest$1469[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1473
	mov	eax, DWORD PTR _dest$1469[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 5898240				; 005a0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1473
	mov	eax, DWORD PTR _dest$1469[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 5832704				; 00590000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1473
	mov	eax, DWORD PTR _dest$1469[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2359296				; 00240000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1472
$L1473:
; Line 3198
	mov	eax, DWORD PTR _dest$1469[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _dest$1469[ebp], eax
	jmp	$L1471
$L1472:
; Line 3199
	mov	eax, DWORD PTR _dest$1469[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1474
; Line 3201
	mov	eax, DWORD PTR _dest$1469[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _xregno$1475[ebp], eax
; Line 3203
	mov	eax, DWORD PTR _dest$1469[ebp]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jge	$L1477
; Line 3204
	cmp	DWORD PTR _xregno$1475[ebp], 8
	jl	$L1677
	mov	DWORD PTR _xnregs$1476[ebp], 1
	jmp	$L1678
$L1677:
	mov	eax, DWORD PTR _dest$1469[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	add	eax, 3
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	mov	DWORD PTR _xnregs$1476[ebp], eax
$L1678:
; Line 3205
	jmp	$L1478
$L1477:
; Line 3206
	mov	DWORD PTR _xnregs$1476[ebp], 1
$L1478:
; Line 3208
	mov	eax, DWORD PTR _nregs$[ebp]
	add	eax, DWORD PTR _regno$[ebp]
	cmp	eax, DWORD PTR _xregno$1475[ebp]
	jle	$L1479
	mov	eax, DWORD PTR _xnregs$1476[ebp]
	add	eax, DWORD PTR _xregno$1475[ebp]
	cmp	eax, DWORD PTR _regno$[ebp]
	jle	$L1479
; Line 3209
	sub	eax, eax
	jmp	$L1368
; Line 3210
$L1479:
; Line 3211
	mov	eax, DWORD PTR _valuenregs$[ebp]
	add	eax, DWORD PTR _valueno$[ebp]
	cmp	eax, DWORD PTR _xregno$1475[ebp]
	jle	$L1480
	mov	eax, DWORD PTR _xnregs$1476[ebp]
	add	eax, DWORD PTR _xregno$1475[ebp]
	cmp	eax, DWORD PTR _valueno$[ebp]
	jle	$L1480
; Line 3212
	sub	eax, eax
	jmp	$L1368
; Line 3213
$L1480:
	cmp	DWORD PTR _goal_mem_addr_varies$[ebp], 0
	je	$L1481
; Line 3214
	sub	eax, eax
	jmp	$L1368
; Line 3215
$L1481:
; Line 3216
	jmp	$L1482
$L1474:
; Line 3217
	cmp	DWORD PTR _goal_mem$[ebp], 0
	je	$L1483
	mov	eax, DWORD PTR _dest$1469[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1483
	mov	eax, DWORD PTR _dest$1469[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	mov	eax, DWORD PTR _dest$1469[ebp]
	push	eax
	call	_push_operand
	add	esp, 8
	or	eax, eax
	jne	$L1483
; Line 3218
	sub	eax, eax
	jmp	$L1368
; Line 3219
$L1483:
$L1482:
; Line 3220
$L1467:
	jmp	$L1464
$L1465:
; Line 3227
$L1461:
$L1460:
; Line 3230
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR _link$1484[ebp], eax
	jmp	$L1485
$L1486:
	mov	eax, DWORD PTR _link$1484[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _link$1484[ebp], eax
$L1485:
	cmp	DWORD PTR _link$1484[ebp], 0
	je	$L1487
; Line 3231
	mov	eax, DWORD PTR _link$1484[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 33554432				; 02000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1488
; Line 3233
	mov	eax, DWORD PTR _link$1484[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _incno$1489[ebp], eax
; Line 3234
	mov	eax, DWORD PTR _nregs$[ebp]
	add	eax, DWORD PTR _regno$[ebp]
	cmp	eax, DWORD PTR _incno$1489[ebp]
	jle	$L1490
	mov	eax, DWORD PTR _incno$1489[ebp]
	cmp	DWORD PTR _regno$[ebp], eax
	jg	$L1490
; Line 3235
	sub	eax, eax
	jmp	$L1368
; Line 3236
$L1490:
	mov	eax, DWORD PTR _valuenregs$[ebp]
	add	eax, DWORD PTR _valueno$[ebp]
	cmp	eax, DWORD PTR _incno$1489[ebp]
	jle	$L1491
	mov	eax, DWORD PTR _incno$1489[ebp]
	cmp	DWORD PTR _valueno$[ebp], eax
	jg	$L1491
; Line 3237
	sub	eax, eax
	jmp	$L1368
; Line 3238
$L1491:
	cmp	DWORD PTR _goal_mem_addr_varies$[ebp], 0
	je	$L1492
; Line 3239
	sub	eax, eax
	jmp	$L1368
; Line 3240
$L1492:
; Line 3241
$L1488:
	jmp	$L1486
$L1487:
; Line 3243
$L1440:
	jmp	$L1433
$L1434:
; Line 3244
$L1368:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_find_equiv_reg ENDP
_x$ = 8
_inced$ = 12
_code$ = -8
_fmt$ = -12
_i$ = -4
_addr$1500 = -16
_tem$1507 = -20
_j$1510 = -24
_tem$1514 = -28
_find_inc_amount PROC NEAR
; Line 3253
	push	ebp
	mov	ebp, esp
	sub	esp, 28					; 0000001cH
	push	ebx
	push	esi
	push	edi
; Line 3254
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$[ebp], eax
; Line 3258
	cmp	DWORD PTR _code$[ebp], 37		; 00000025H
	jne	$L1499
; Line 3260
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _addr$1500[ebp], eax
; Line 3265
	mov	eax, DWORD PTR _addr$1500[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 4128768				; 003f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1502
	mov	eax, DWORD PTR _addr$1500[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 4259840				; 00410000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1502
	mov	eax, DWORD PTR _addr$1500[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 4194304				; 00400000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1502
	mov	eax, DWORD PTR _addr$1500[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 4325376				; 00420000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1501
$L1502:
	mov	eax, DWORD PTR _addr$1500[ebp]
	mov	ecx, DWORD PTR _inced$[ebp]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L1501
; Line 3266
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	jmp	$L1495
; Line 3267
$L1501:
; Line 3269
$L1499:
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_format[eax*4]
	mov	DWORD PTR _fmt$[ebp], eax
; Line 3270
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_length[eax*4]
	dec	eax
	mov	DWORD PTR _i$[ebp], eax
	jmp	$L1503
$L1504:
	dec	DWORD PTR _i$[ebp]
$L1503:
	cmp	DWORD PTR _i$[ebp], 0
	jl	$L1505
; Line 3272
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 101				; 00000065H
	jne	$L1506
; Line 3274
	mov	eax, DWORD PTR _inced$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	push	eax
	call	_find_inc_amount
	add	esp, 8
	mov	DWORD PTR _tem$1507[ebp], eax
; Line 3275
	cmp	DWORD PTR _tem$1507[ebp], 0
	je	$L1508
; Line 3276
	mov	eax, DWORD PTR _tem$1507[ebp]
	jmp	$L1495
; Line 3277
$L1508:
; Line 3278
$L1506:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 69					; 00000045H
	jne	$L1509
; Line 3281
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	eax, DWORD PTR [eax]
	dec	eax
	mov	DWORD PTR _j$1510[ebp], eax
	jmp	$L1511
$L1512:
	dec	DWORD PTR _j$1510[ebp]
$L1511:
	cmp	DWORD PTR _j$1510[ebp], 0
	jl	$L1513
; Line 3283
	mov	eax, DWORD PTR _inced$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$1510[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	push	eax
	call	_find_inc_amount
	add	esp, 8
	mov	DWORD PTR _tem$1514[ebp], eax
; Line 3284
	cmp	DWORD PTR _tem$1514[ebp], 0
	je	$L1515
; Line 3285
	mov	eax, DWORD PTR _tem$1514[ebp]
	jmp	$L1495
; Line 3286
$L1515:
	jmp	$L1512
$L1513:
; Line 3288
$L1509:
	jmp	$L1504
$L1505:
; Line 3290
	sub	eax, eax
	jmp	$L1495
; Line 3291
$L1495:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_find_inc_amount ENDP
_TEXT	ENDS
END
